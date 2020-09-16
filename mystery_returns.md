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

In a last-ditch effort, we checked if some simple `str_detect`s could
fix the problem; unfortunately, it seems like even this very wide net
only snags a couple hundred punts, \~10% of the mystery.

``` r
punts %>% 
  filter(punt_out_of_bounds==0 & return_yards==0) %>%
  filter(desc %>% str_detect("bounds")) %>%
  mutate(gotcha = desc %>% str_extract("bounds")) %>%
  select(punt_out_of_bounds, gotcha)
```

    ## # A tibble: 206 x 2
    ##    punt_out_of_bounds gotcha
    ##                 <dbl> <chr> 
    ##  1                  0 bounds
    ##  2                  0 bounds
    ##  3                  0 bounds
    ##  4                  0 bounds
    ##  5                  0 bounds
    ##  6                  0 bounds
    ##  7                  0 bounds
    ##  8                  0 bounds
    ##  9                  0 bounds
    ## 10                  0 bounds
    ## # … with 196 more rows

``` r
punts %>% 
  filter(punt_downed==0) %>%
  filter(desc %>% str_detect("owned")) %>%
  mutate(gotcha = desc %>% str_extract("owned")) %>%
  select(punt_downed, gotcha)
```

    ## # A tibble: 45 x 2
    ##    punt_downed gotcha
    ##          <dbl> <chr> 
    ##  1           0 owned 
    ##  2           0 owned 
    ##  3           0 owned 
    ##  4           0 owned 
    ##  5           0 owned 
    ##  6           0 owned 
    ##  7           0 owned 
    ##  8           0 owned 
    ##  9           0 owned 
    ## 10           0 owned 
    ## # … with 35 more rows

``` r
punts %>% 
  filter(punt_fair_catch==0) %>%
  filter(desc %>% str_detect("air catch" ) | 
           desc %>% str_detect("air caught")) %>%
  mutate(gotcha = desc %>% str_extract("air c[:alpha:]+")) %>%
  select(punt_fair_catch, gotcha)
```

    ## # A tibble: 14 x 2
    ##    punt_fair_catch gotcha   
    ##              <dbl> <chr>    
    ##  1               0 air catch
    ##  2               0 air catch
    ##  3               0 air catch
    ##  4               0 air catch
    ##  5               0 air catch
    ##  6               0 air catch
    ##  7               0 air catch
    ##  8               0 air catch
    ##  9               0 air catch
    ## 10               0 air catch
    ## 11               0 air catch
    ## 12               0 air catch
    ## 13               0 air catch
    ## 14               0 air catch

``` r
punts %>% 
  filter(touchback==0) %>%
  filter(desc %>% str_detect("ouchback" )) %>%
  mutate(gotcha = desc %>% str_extract("ouchback")) %>%
  select(punt_fair_catch, gotcha)
```

    ## # A tibble: 0 x 2
    ## # … with 2 variables: punt_fair_catch <dbl>, gotcha <chr>
