
library(tidyverse)
set.seed(21490084)

marathon_data_full <- read_csv("marathondata.csv")

marathon_data <- marathon_data_full %>%
  select(
    age,
    gender,
    resting_heart_rate_bpm,
    vo2_max,
    bmi,
    sleep_hours_avg,
    injury_count,
    nutrition_score,
    hydration_consistency,
    actual_finish_time_minutes
  ) %>%
  mutate(
    gender = as.factor(gender)
  )

sample_index <- sample(seq_len(nrow(marathon_data)), size = 2000)

marathon_data_sampled <- marathon_data[sample_index, ]

missing_prop_long <- marathon_data_sampled %>%
  summarise(across(everything(), ~ mean(is.na(.)))) %>%
  pivot_longer(
    cols = everything(),
    names_to = "variable",
    values_to = "prop_missing"
  ) %>%
  filter(prop_missing > 0) %>%
  arrange(desc(prop_missing))

missing_prop_long