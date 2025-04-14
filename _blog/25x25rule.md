---
title: "The 25x25 rule of evaluating college punters"
subtitle: "Our thoughts on finding draftable punters"
layout: post
output:
  md_document:
    variant: gfm
    preserve_yaml: TRUE
---
Every year, around draft time, we answer the question, “which punters will be drafted?” Over the last few years, we’ve developed a few intuitions and guidelines that have helped us successfully predict the college punters likely to be drafted, as well as those likely to stick around the NFL. Today we’re sharing some of those thoughts with you.

First, a disclaimer: NFL teams have way more data than us, from tracking data, to private workouts, to interviews. They are much better suited to properly evaluate college punters than we are. 

Despite the fact that for college punters, we are limited to occasionally inaccurate play by play data, our metrics have done a pretty good job of predicting draft status and NFL success over the past 5-7 years.

If you haven’t yet read about our custom metric pEPA/p (punter expected points added per punt), you can read about it [here](https://puntalytics.github.io/metrics.html). pEPA is different from the classic EPA per play, which you might see used to discuss quarterbacks or other offensive performance. The TLDR is that our metric adjusts for line of scrimmage (short punts, closer to the opposing endzone are not penalized for being short) and for return outcome (fair caught, out of bounds, and downed punts are rewarded for being unreturnable, while return yards are normalized so that punters aren’t dinged for missed tackles by the coverage team). We tend to look at splits for punters in terms of Open-Field (inside own 40) vs Pin-Deep (beyond own 40).

Looking at our metrics and the recent history of drafted punters, we can set the following thresholds: **one year with pEPA/p above 0.25, AND 25 years or younger at draft time.** This controls for the slew of successful college punters who have not been drafted likely due to their age (see Max Duffy, John Haggerty, etc). **2025 Edit: we've now seen a couple examples of older punters drafted and/or making teams as UDFA (Tory Taylor was 26 when drafted in the 4th round in 2024 and Lou Hedley was 30 as a UDFA and made the Saints 53-man roster)** NFL teams may be ditching their age threshold for punters if they seem them only as 1-4 year commodities.

In recent years, here are how young punters have slotted up.

| Year | Punter              | pEPA of best season | draftable grade | draft status | started in NFL           | number of years started/possible |
|------|---------------------|---------------------|-----------------|--------------|--------------------------|--------------------------|
| 2024 | Tory Taylor         | 0.37                | no (age)        | 4th round    |yes                       |1/1
| 2024 | Austin McNamara     | 0.32                | yes             | UDFA         |?                         |0/1
| 2024 | Matthew Hayball     | 0.38                | no (age)        | UDFA         |yes                       |1/1
| 2024 | Ryan Rehkow         | 0.32                | yes             | UDFA         |yes                       |1/1
| 2024 | Ryan Sanborn        | 0.30                | yes             | UDFA         |?                         |0/1
| 2023 | Bryce Baringer      | 0.38                | yes             | 6th round    | yes                      |2/2
| 2023 | Brad Robbins        | 0.27                | yes             | 6th round    | yes                      |1/2
| 2023 | Michael Turk        | 0.44                | yes             | UDFA         | no                       |0/2
| 2023 | Ethan Evans         | NA-D2               | NA              | 7th round    | yes                      |2/2
| 2023 | Ty Zentner          | 0.15                | no              | UDFA         | yes                      |1/2
| 2023 | Lou Hedley          | 0.40                | no (age)        | UDFA         | yes                      |1/2
| 2022 | Jordan Stout        | 0.34                | yes             | 4th round    | yes                      |3/3
| 2022 | Jake Camarda        | 0.33                | yes             | 4th round    | yes                      |3/3
| 2022 | Matt Araiza         | 0.39                | yes             | 6th round    | yes                      |1/depends how you count
| 2022 | Trent Gill          | 0.19                | no              | 7th round    | yes                      |2/3
| 2022 | Ryan Stonehouse     | 0.30                | yes             | UDFA         | yes (2022 PB)            |3/3
| 2022 | Ryan Wright         | 0.30                | yes             | UDFA         | yes                      |3/3
| 2022 | Race Porter         | 0.34                | yes             | XFL          | no                       |0/3
| 2021 | Pressley Harvin III | 0.41                | yes             | 7th round    | yes                      |3/4
| 2021 | Drue Chrisman       | 0.32                | yes             | UDFA         | yes                      |0.5/4
| 2020 | Braden Mann         | 0.37                | yes             | 6th round    | yes                      |5/5
| 2020 | Sterling Hofrichter | 0.22                | no              | 7th round    | yes                      |1/5
| 2020 | Tommy Townsend      | 0.33                | yes             | UDFA         | yes (2022 AP1)           |5/5
| 2020 | Joseph Charlton     | 0.39                | yes             | UDFA         | no                       |1.5/5
| 2020 | Blake Gillikin      | 0.19                | no              | UDFA         | yes                      |4/5
| 2020 | Arryn Siposs        | 0.22                | no              | UDFA         | yes                      |2/5
| 2019 | Mitch Wishnowsky    | 0.41                | yes             | 4th round    | yes                      |6/6
| 2019 | Jake Bailey         | 0.26                | yes             | 5th round    | yes (2020 AP1)           |6/6
| 2019 | Jack Fox            | 0.16                | no              | UDFA         | yes (2020 AP2, 2024 AP 1)|6/6
| 2019 | AJ Cole             | 0.20                | no              | UDFA         | yes (2021 AP1, 2022 AP2) |6/6
| 2019 | Jaime Gillan        | NA-FCS              | NA              | UDFA         | yes                      |6/6

Because we pride ourselves on our transparency, let's talk about our hits and misses.  

**Biggest hits** (we had high dratable grades on these punters, they did not get drafted, but have since become punting assets for their teams): Ryan Rehkow, Ryan Stonehouse, Ryan Wright, and Tommy Townsend.   

**Guys we were right to counsel against** (we did not have high grades on these players, they were drafted, and have not panned out): Trent Gill, and Sterling Hofrichter.  

**Guys we were wrong about** (we had high grades on them, but they either weren't drafted or never panned out): Michael Turk, Race Porter, Joseph Charlton, and Brandon Wright.  

**Guys the NFL got right that we would have missed** (self-explanatory): *crickets ...* You could count Ethan Evans here, but because he was a D2 punter on him, we had no data available. We still listed him on our punter big board that year.  

**Guys that everyone was wrong about** (didn't meet our thresholds, did not get drafted, but are now household names): Jack Fox, A. J. Cole, and Blake Gillikin. 

So what does this all mean? Well, if your name is Ryan, and we think you were a great college punter, and you don't get drafted, then odds are you will pan out in the NFL. Also, NFL evaluators don't seem to have metrics that help them identify which punters will outperform their college production. Until we consistently see guys with sub .2 college pEPA getting drafted and making rosters, we will stand by our draft boards. That said, they all knew about Race Porter and we're still holding out hope. Not every terrific college season is created equally. On the whole, pEPA and age do a pretty good job of predicting future draft status and identifying punters with NFL starter caliber floors.

