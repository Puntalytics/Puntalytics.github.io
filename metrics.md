---
layout: default
title: Our Metrics
---

# Our Metrics
Puntalytics was founded out of a frustration with the metrics typically used to evaluate punters.  As we'll explain below, Gross Yards per Punt and Net Yards per Punt leave a lot to be desired; other metrics (like Percent of Punts Inside the 20 and Touchback Percentage) can help fill in the gaps, but still don't give a complete picture.  The metrics below are our humble attempt at carrying puntalytics into the data science age along with the rest of football.
## SHARP - Scrimmage Help/Hurt Adjusted Real Punting
The biggest inherent problem with Gross Yards per Punt is, at certain field positions, the punter's goal is pin the opponent deep while avoiding a touchback, rather than kicking as far as possible.  In these sitatuations, a punter's average can be dinged for a short (say, 35 yard) punt, even when that punt was excellent.  To adjust for this, we compute the average punt distance **from that yard line**.  SHARP is then calculated as Distance / Average Distance from that yard line.
### SHARPnet
SHARPnet is calculated just like SHARP, but with a base of Net Yards rather than Gross Yards.  This tends to be our go-to metric.
## RERUN - Return-Edited Real Unbiased Net
As we muse in [this twitter thread](https://twitter.com/ThePuntRunts/status/1235374680313233408?s=20), it seems unfair to blame punters for the occasional 20-plus-yard return.  To adjust for this, we filter punts into 'returned' and 'not returned', and assign all 'returned' punts an average return, rather than whatever return actually happened.
