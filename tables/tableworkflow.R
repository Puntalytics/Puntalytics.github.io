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

library(tidyverse)
library(glue)
library(lubridate)
library(DBI)
library(RSQLite)
library(gsisdecoder)
library(puntr)
library(gt)
library(gtExtras)

update_db()
connection <- dbConnect(SQLite(), "./pbp_db")
pbp <- tbl(connection, "nflfastR_pbp")

punts <- pbp %>%
  filter(punt_attempt==1) %>%
  filter(season %in% 2019:2021) %>%
  collect() %>%
  trust_the_process() %>%
  filter(punt_blocked==0) %>%
  calculate_all() %>%
  filter(season == 2021)

dbDisconnect(connection)

current_threshold <- ceiling(1.5 * max(punts$week))

mini <- punts %>% create_mini(threshold = current_threshold-1)

tab <- mini %>%
  ungroup() %>%
  select(Team=team_logo_espn, Punter = punter_player_name, NumPunts, pEPA=Punt_eaepaae_avg, Gross, Net, RERUN, OF=SHARP_RERUN_OF, PD=SHARP_RERUN_PD) %>%
  arrange(desc(pEPA)) %>%
  mutate(across(where(is.numeric), round, 2)) %>%
  gt() %>%
  tab_header(
    title = "Punters in 2021, ranked by pEPA",
    subtitle = glue("Minimum {current_threshold} punts")
  ) %>%
  tab_source_note(
    source_note = "'OF and 'PD' are SHARP_RERUN scores for Open-field and pin-deep, respectively"
  ) %>%
  tab_source_note(
    source_note = glue("Updated {now()}")
  ) %>%
  gt_hulk_col_numeric(c(pEPA, Gross, Net, RERUN, OF, PD), trim = TRUE) %>%
  gt_img_rows(Team)
gtsave(tab, '/tables/latest.html')
