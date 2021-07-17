---
title: "Punt Runts Fantasy Guide"
layout: default
output:
  md_document:
    variant: gfm
    preserve_yaml: TRUE

---

# Fantasy

Some text to start\!\!\!\!

``` r
library(ggplot2)
#setwd(knitr::opts_chunk$get("fig.path"))
p <- ggplot(data=ggplot2::diamonds, mapping = aes(x=x, y=y))+
  geom_point()
p
```

![](../assets/img/Rmarkdown/test-1.png)<!-- -->

Some text after too.
