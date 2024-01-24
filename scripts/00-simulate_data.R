#### Preamble ####
# Purpose: Get data on Open Data Toronto about Dinesafe and make table
# Author: Siyu Li
# Email: siyul.li@mail.utoronto.ca
# Date: 20 January 2024

#### Workspace setup ####
install.packages("opendatatoronto")
install.packages("tidyverse")
install.packages("knitr")

library(knitr)
library(janitor)
library(lubridate)
library(opendatatoronto)
library(tidyverse)


#### Simulate ####
set.seed(853)

simulated_data <-
  tibble(
    # The code for date from staackoverflow
    # https://stackoverflow.com/questions/21502332/generating-random-dates
    Inspection_Date = sample(seq(as.Date('2022/01/01'), as.Date('2023/12/31'), by="day"), 76827,replace = 'TRUE'),
    # Use 1 through to 76827 to represent each establishment
    "Establishment_id" = 1:76827,
    # Randomly pick an option, with replacement, 76827 times
    "Establishment_Status" = sample(
      x = c("Pass", "Conditional Pass", "Closed"),
      size = 76827,
      replace = TRUE
    ),
    "Severity" = sample(
      x = c("M-Minor", "C-Crucial", "S-Significant", "-"),
      size = 76827,
      replace = TRUE
    ),
  )
simulated_data

head(simulated_data)

