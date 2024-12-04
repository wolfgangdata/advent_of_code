# advent of code - day 2
source("helper_get_aoc.R")
library(tidyverse)

df <- get_aoc(2) %>% 
    read_lines() %>%
    map(~ as.numeric(str_split(.x, " ", simplify = TRUE)))

# Define the original safety checker
is_safe <- function(data) {
    differences <- diff(data)
    all(abs(differences) >= 1 & abs(differences) <= 3) && 
        length(unique(sign(differences))) == 1
}

count <- df %>%
    map_int(is_safe) %>%
    sum()

# Print the result
print(count)


# part 2
is_safe_with_dampener <- function(data) {
    any(
        seq_along(data) %>%
            map(~ data[-.x]) %>%    # iterate through all reports by removing one element
            map_lgl(is_safe)        # check if any modified report is safe
    ) || is_safe(data)              # check if original report is safe
}


safe_count <- df %>%
    map_lgl(is_safe_with_dampener) %>%
    sum()

print(safe_count)
