#install.packages("tidyverse")
#install.packages("glue")
#install.packages("DBI")
#install.packages("RSQLite")
#install.packages("gsisdecoder")
#install.packages("remotes")
#install.packages("nflfastR")
remotes::install_github("Puntalytics/puntr")
#install.packages("gt")
remotes::install_github("jthomasmock/gtExtras")

if (!require("pak")) install.packages("pak")
pak::pak("nflverse/nflfastR")

library(tidyverse)
library(glue)
library(lubridate)
library(DBI)
library(RSQLite)
library(gsisdecoder)
library(puntr)
library(nflfastR)
library(gt)
library(gtExtras)
library(ggimage)

update_db()
connection <- dbConnect(SQLite(), "./pbp_db")
pbp <- tbl(connection, "nflfastR_pbp")

punts <- pbp %>%
  filter(punt_attempt==1) %>%
  filter(season %in% 2021:2023) %>%
  collect() %>%
  trust_the_process() %>%
  filter(punt_blocked==0)

punts <- punts %>%
  calculate_all() %>%
  filter(season == 2023)

dbDisconnect(connection)

current_threshold <- max(punts$week)

mini <- punts %>%
  filter(!is.na(posteam)) %>%
  by_punters(threshold = current_threshold)

tab <- mini %>%
  ungroup() %>%
  select(Team=team_logo_espn, Punter = punter_player_name, NumPunts, pEPA, Gross, Net, RERUN, OF=SHARP_RERUN_OF, PD=SHARP_RERUN_PD) %>%
  arrange(desc(pEPA)) %>%
  mutate(across(where(is.numeric), round, 2)) %>%
  gt() %>%
  tab_header(
    title = "Punters in 2023, ranked by pEPA",
    subtitle = glue("Minimum {current_threshold} punts")
  ) %>%
  tab_source_note(
    source_note = "'OF and 'PD' are SHARP_RERUN scores for Open-field and pin-deep, respectively"
  ) %>%
  tab_source_note(
    source_note = glue("Updated {now('America/New_York')} eastern")
  ) %>%
  gt_hulk_col_numeric(c(pEPA, Gross, Net, RERUN, OF, PD), trim = TRUE) %>%
  gt_img_rows(Team)

gtsave(tab, 'tables/latest.html')

ggplot(data=mini, aes(x = reorder(punter_player_name, pEPA), y = pEPA)) +
  geom_col(aes(fill = team_color)) +
  geom_image(aes(image = team_logo_espn), asp = 8/5, size=0.03) +
  coord_flip() +
  scale_fill_identity() +
  theme_bw() +
  labs(title = "Punter EPA in 2023", subtitle = glue("Minimum {current_threshold} punts"),
       y="Punter EPA/p above expected", x="Punters in 2023",
       caption=glue("figure @ThePuntRunts | data @nflfastR | updated {now('America/New_York')}")) +
  theme(plot.margin=unit(c(0.5,0.5,0.5,0.5),"cm")) +
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5))
ggsave('tables/latestbars.png', width = 8, height = 5)

