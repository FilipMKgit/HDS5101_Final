
library(tidyverse)

marathon_data_full <- read_csv("marathondata.csv")

marathon_data <- marathon_data_full %>%
  select(age, gender, vo2_max, bmi, actual_finish_time_minutes) %>%
  mutate(gender = as.factor(gender))