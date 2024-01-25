#### Preamble ####
# Purpose: Download actual data from Open Data Toronto
# Author: Siyu Li
# Email: siyul.li@mail.utoronto.ca
# Date: 21 Januaray 2024
# Prerequisites: -

#### Workspace setup ####
install.packages("opendatatoronto")
install.packages("tidyverse")
install.packages("dplyr")
install.packages("janitor")
install.packages("lubridate")

library(lubridate)
library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(janitor)

#### Acquire ####
dinesafe_program <-
  # Each package is associated with a unique id  found in the "For 
  # Developers" tab of the relevant page from Open Data Toronto
  # https://open.toronto.ca/dataset/dinesafe/
  list_package_resources("ea1d6e57-87af-4e23-b722-6c1f5aa18a8d") |>
  filter(name == 
           "Dinesafe.csv") |>
  get_resource()


write_csv(
  x = dinesafe_program,
  file = "inputs/data/unedited_data.csv"
)

head(dinesafe_program)

#### Clean Dataset####

dinesafe_program_clean$inspection_year <- year(dinesafe_program_clean$inspection_date)

dinesafe_program_clean <-
  clean_names(dinesafe_program) |>
  mutate(inspection_date = ymd(inspection_date)) |> 
  
  select(establishment_status, inspection_date,severity, inspection_year) 


write_csv(
  x = dinesafe_program_clean,
  file = "inputs/data/cleanded_data.csv"
)

head(dinesafe_program_clean)
summary(dinesafe_program_clean)
