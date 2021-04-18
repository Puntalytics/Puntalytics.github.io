install.packages(c("devtools", "tidyverse"), repos = "http://cran.us.r-project.org")
library(tidyverse)

devtools::install_github("Puntalytics/puntr")
library(puntr)

punts <- import_punts(2019:2020) %>%
  trust_the_process() %>%
  calculate_all()

bb <- punts %>% filter(punter_player_name=="J.Bailey")

ggplot(data=punts, aes(x=YardsFromOwnEndZone, y=GrossYards)) +
  geom_jitter(size=0.8, alpha=0.6, color='grey') +
  geom_smooth() +
  geom_point(data=bb, color='red') +
  theme_bw() +
  labs(title="temp", subtitle='temp2', caption='blah')

miniY <- punts %>% create_miniY() %>%
  filter(season==2020) %>%
  arrange(returnpct) %>%
  rename(Punter_EPA = Punt_eaepaae_avg) %>%
  select(punter_player_name, returnpct, Gross, Net, Punter_EPA) %>%
  mutate(across(where(is.numeric), round, 2))
