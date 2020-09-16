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

# An `nflfastR` mystery

Here’s a quick little code chunk re: the (too?) large number of
“returned” punts with 0 yard returns.

Install:

``` r
devtools::install_github("Puntalytics/puntr")
library(puntr)
library(tidyverse)
```

Filter to just returned punts:

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
  labs(title = "Distribution of returns on returned punts in 2019",
         subtitle = "Why all the punts with return = 0?",
         x="Return yards", caption="figure @ThePuntRunts | data @nflfastR")
```

![](../assets/img/Rmarkdown/returndistributions-1.png)<!-- -->
Everything about this plot seems right, other than 100(\!) more 0-yard
returns than you’d expect. Our leading theories are:

  - some fair catches are missing, meaning a fair caught punt is instead
    logged as “returned” punt with a 0-yard return (this seems most
    likely\!). If this is the case, we’ll probably just start assuming
    all 0-yard returns are fair catches and call it a day.  
  - some returns are missing, meaning e.g. a 50-yard punt with a 5-yard
    return gets mistakenly logged as a 45-yard punt with a 0-yard
    return.  
  - there’s some filtering step beyond out-of-bounds, downed, fair
    catch, and touchback that we’re forgetting, or we’re doing this
    filtering improperly.

It’s also unclear to us where along the pipeline this discrepancy is
most likely to have happened, anywhere from the scorekeeper going to the
bathroom during a punt to improper filtering by us. And lastly, it’s of
course possible that this isn’t an error at all, and there’s just some
football reason we’re missing that there are so many 0-yard returns.

In case you’re curious (we were\!) here’s the same plot for all punts
1999-2019, which makes for a prettier distribution:

![](../assets/img/Rmarkdown/returndistributionsallyears-1.png)<!-- -->
