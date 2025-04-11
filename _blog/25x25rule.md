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

Looking at our metrics and the recent history of drafted punters, we can set the following thresholds: **one year with pEPA/p above 0.25, AND 25 years or younger at draft time.** This controls for the slew of successful college punters who have not been drafted likely due to their age (see Max Duffy, John Haggerty, etc).

In recent years, here are how young punters have slotted up.

| Year | Punter              | pEPA of best season | draftable grade | draft status | started in NFL           |
|------|---------------------|---------------------|-----------------|--------------|--------------------------|
| 2024 | Tory Taylor         | 0.37                | no (age)        | 4th round    |yes                        |
| 2024 | Austin McNamara     | 0.32                | yes             | UDFA         |?                        |
| 2024 | Matthew Hayball     | 0.38                | no (age)        | UDFA         |yes                        |
| 2024 | Ryan Rehkow         | 0.32                | yes             | UDFA         |yes                        |
| 2024 | Ryan Sanborn        | 0.30                | yes             | UDFA         |?                        |
| 2023 | Bryce Baringer      | 0.38                | yes             | 6th round    | yes                        |
| 2023 | Brad Robbins        | 0.27                | yes             | 6th round    | yes                        |
| 2023 | Michael Turk        | 0.44                | yes             | UDFA         | no                        |
| 2023 | Ethan Evans         | NA-D2               | NA              | 7th round    | yes                        |
| 2023 | Ty Zentner          | 0.15                | no              | UDFA         | yes                        |
| 2022 | Jordan Stout        | 0.34                | yes             | 4th round    | yes                      |
| 2022 | Jake Camarda        | 0.33                | yes             | 4th round    | yes                      |
| 2022 | Matt Araiza         | 0.39                | yes             | 6th round    | yes                        |
| 2022 | Trent Gill          | 0.19                | no              | 7th round    | yes                      |
| 2022 | Ryan Stonehouse     | 0.30                | yes             | UDFA         | yes (2022 PB)            |
| 2022 | Ryan Wright         | 0.30                | yes             | UDFA         | yes                      |
| 2022 | Race Porter         | 0.34                | yes             | XFL          | no                       |
| 2021 | Pressley Harvin III | 0.41                | yes             | 7th round    | yes                      |
| 2021 | Drue Chrisman       | 0.32                | yes             | UDFA         | yes                      |
| 2020 | Braden Mann         | 0.37                | yes             | 6th round    | yes                      |
| 2020 | Sterling Hofrichter | 0.22                | no              | 7th round    | yes                      |
| 2020 | Tommy Townsend      | 0.33                | yes             | UDFA         | yes (2022 AP1)           |
| 2020 | Joseph Charlton     | 0.39                | yes             | UDFA         | no                       |
| 2020 | Blake Gillikin      | 0.19                | no              | UDFA         | yes                      |
| 2020 | Arryn Siposs        | 0.22                | no              | UDFA         | yes                      |
| 2019 | Mitch Wishnowsky    | 0.41                | yes             | 4th round    | yes                      |
| 2019 | Jake Bailey         | 0.26                | yes             | 5th round    | yes (2020 AP1)           |
| 2019 | Jack Fox            | 0.16                | no              | UDFA         | yes (2020 AP2, 2024 AP 1)            |
| 2019 | AJ Cole             | 0.20                | no              | UDFA         | yes (2021 AP1, 2022 AP2) |
| 2019 | Jaime Gillan        | NA-FCS              | NA              | UDFA         | yes                      |

Since 2019, we have two big misses (Race Porter and Brandon Wright); we had high grades on both, neither were drafted, and now both are out of the league. But, in that time, we also would have counseled teams to draft 5 punters they otherwise would not have who went on to become starting caliber punters for at least one season (pretty good return on a seventh round pick). Those punters are Ryan Stonehouse (2022 pro bowl), Ryan Wright, Drue Chrisman, Tommy Townsend (2022 first team all-pro), and Joseph Charlton. There are also a handful of punters in that time who neither we, nor the league had draftable grades on, and who have gone on to become starting caliber punters, most notably AJ Cole III (2021 first team all-pro) and Jack Fox (2020 pro bowl). On the whole, pEPA and age do a pretty good job of predicting future draft status and identifying punters with NFL starter caliber floors.

