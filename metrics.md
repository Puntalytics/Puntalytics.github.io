---
layout: default
title: Our Metrics
---

# Our Metrics
Puntalytics was founded out of a frustration with the metrics typically used to evaluate punters.  As we'll explain below, Gross Yards per Punt and Net Yards per Punt leave a lot to be desired; other metrics (like Percent of Punts Inside the 20 and Touchback Percentage) can help fill in the gaps, but still don't give a complete picture. Applying traditional EPA to punting is a disaster. The metrics below are our humble attempt at carrying puntalytics into the data science age along with the rest of football.
## EPA/punt
![EPA/punt for all punters in 2019](/assets/img/epaperpunt2019.png)
The go-to stat in the modern analytics community is EPA - expected points added. Read about EPA [here](https://www.advancedfootballanalytics.com/index.php/home/stats/stats-explained/expected-points-and-epa-explained), among other places.  
There are two big hurdles to using EPA for punting. First, the yards-to-go on fourth down when the punt is called is a huge, huge factor. It's essentially impossible for a punter to log positive EPA on a 4th&1 punt; otherwise put, don't punt on 4th&1! We sidestep this issue by averaging EP values across the entire `nflfastR` dataset to get a game-script-independent valuation of each yardline on 1st or 4th down. With EP values in hand, we can do the subtraction ourself and determine and EPA for every punt.  
The second big problem with standard EPA/punt is that it's hugely influenced by plays with large returns or turnovers, especially those that result in touchdowns. We account for this by basing our EPA model on RERUN.
### RERUN - Return-Edited Real Unbiased Net
<blockquote class="twitter-tweet" data-theme="light"><p lang="en" dir="ltr">Every time a dynamic returner goes off for 20+ yds, we think, was that the punter&#39;s fault? And even in less extreme cases, are we swaying our evaluations of punters based on the quality of the coverage team in front of them? We&#39;ll spend this thread musing on that question</p>&mdash; Puntalytics (@ThePuntRunts) <a href="https://twitter.com/ThePuntRunts/status/1235374680313233408?ref_src=twsrc%5Etfw">March 5, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
As we muse in [this twitter thread](https://twitter.com/ThePuntRunts/status/1235374680313233408?s=20), it seems unfair to blame punters for the occasional 20-plus-yard return.  To adjust for this, we filter punts into 'returned' and 'not returned', and assign all 'returned' punts an average return, rather than whatever return actually happened.

## SHARP - Scrimmage Help/Hurt Adjusted Real Punting
![Plot showing GrossYards vs. YardsFromOwnEndZone](/assets/img/SHARPplot.jpg)
In contrast with the modern analytics community and its affinity for EPA, the go-to stat in mainstream media for describing punters is gross yards/punt. The biggest inherent problem with Gross Yards per Punt is, at certain field positions, the punter's goal is pin the opponent deep while avoiding a touchback, rather than kicking as far as possible.  In these sitatuations, a punter's average can be dinged for a short (say, 35 yard) punt, even when that punt was excellent.  To adjust for this, we compute the (smoothed) average punt distance **from that yard line**, represented in the above graph as a yellow line.  Compare that with the red line, showing the length of an "average punt" without considering field postion.  SHARP is then calculated as Distance / Average Distance from that yard line.  We wrote about this at length in a [BleedingGreenNation fanpost](https://www.bleedinggreennation.com/2019/9/4/20850296/gross-yards-gross-the-puntalytics-primer-you-didnt-know-you-were)
### SHARPnet and SHARP RERUN
The second-biggest problem with gross yards/punt is that it doesn't consider returns. SHARP inherits that short coming, so we often instead use SHARPnet. SHARPnet is calculated just like SHARP, but with a base of Net Yards rather than Gross Yards. Likewise, we can compute SHARP RERUN.
