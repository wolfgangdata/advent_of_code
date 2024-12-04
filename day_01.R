# advent of code - day 1
source("helper_get_aoc.R")
library(tidyverse)

df <- get_aoc(1) %>%
    read.table()

# part 1 ----
# base r
sum(abs(sort(df[[1]]) - sort(df[[2]])))

# dplyr
df %>%
    summarize(diff_sum = sum(abs(sort(pull(df, 1)) - sort(pull(df, 2)))))


# part 2 ----
df %>%
    filter(V2 %in% V1) %>%
    count(V2, name = "Freq") %>%
    summarize(result = sum(V2 * Freq)) %>% 
    pull(result)

