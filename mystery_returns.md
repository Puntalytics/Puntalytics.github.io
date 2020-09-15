---
title: "Mystery Returns"
layout: default
output:
  md_document:
    variant: gfm
    preserve_yaml: TRUE
knit: (function(inputFile, encoding) {
  rmarkdown::render(inputFile, encoding = encoding, output_dir = "..") })
---

# An `nflfasR` mystery

Here’s a quick little code chunk re: the (too?) large number of
“returned” punts with 0 yard returns.

Install:

``` r
devtools::install_github("Puntalytics/puntr")
library(puntr)
library(tidyverse)
```

Filter to just returned punts

``` r
punts_2019 <- import_punts(2019)
returned_punts_2019 <- punts_2019 %>%
  filter(punt_out_of_bounds==0 &
           punt_downed==0 &
           punt_fair_catch==0 &
           touchback==0)
```

And finally, plot the distribution of returns:

``` r
ggplot(data = returned_punts_2019, mapping = aes(x = return_yards)) +
  geom_histogram(binwidth = 1) +
  theme_bw() +
  labs(title = "Distribution of returns on returned punts",
         subtitle = "Why all the punts with return = 0?",
         x="Return yards", caption="figure @ThePuntRunts | data @nflfastR")
```

![](../assets/img/Rmarkdown/returndistributions-1.png)<!-- -->
