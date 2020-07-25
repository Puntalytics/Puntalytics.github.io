---
layout: default
title: Our Metrics
---

# Our Metrics
Puntalytics was founded out of a frustration with the metrics typically used to evaluate punters.  As we'll explain below, Gross Yards per Punt and Net Yards per Punt leave a lot to be desired; other metrics (like Percent of Punts Inside the 20 and Touchback Percentage) can help fill in the gaps, but still don't give a complete picture.  The metrics below are our humble attempt at carrying puntalytics into the data science age along with the rest of football.
## SHARP - Scrimmage Help/Hurt Adjusted Real Punting
The biggest inherent problem with Gross Yards per Punt is, at certain field positions, the punter's goal is pin the opponent deep while avoiding a touchback, rather than kicking as far as possible.  In these sitatuations, a punter's average can be dinged for a short (say, 35 yard) punt, even when that punt was excellent.  To adjust for this, we compute the average punt distance **from that yard line**.  SHARP is then calculated as Distance / Average Distance from that yard line.  We wrote about this at length in a [BleedingGreenNation fanpost](https://www.bleedinggreennation.com/2019/9/4/20850296/gross-yards-gross-the-puntalytics-primer-you-didnt-know-you-were)
### SHARPnet
SHARPnet is calculated just like SHARP, but with a base of Net Yards rather than Gross Yards.  This tends to be our go-to metric.
## RERUN - Return-Edited Real Unbiased Net
<blockquote class="twitter-tweet" data-theme="light"><p lang="en" dir="ltr">Every time a dynamic returner goes off for 20+ yds, we think, was that the punter&#39;s fault? And even in less extreme cases, are we swaying our evaluations of punters based on the quality of the coverage team in front of them? We&#39;ll spend this thread musing on that question</p>&mdash; Puntalytics (@ThePuntRunts) <a href="https://twitter.com/ThePuntRunts/status/1235374680313233408?ref_src=twsrc%5Etfw">March 5, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
As we muse in [this twitter thread](https://twitter.com/ThePuntRunts/status/1235374680313233408?s=20), it seems unfair to blame punters for the occasional 20-plus-yard return.  To adjust for this, we filter punts into 'returned' and 'not returned', and assign all 'returned' punts an average return, rather than whatever return actually happened.
