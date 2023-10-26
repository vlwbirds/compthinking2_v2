# Suddenly you're a shorebird biologist

library(tidyverse)

# Generate sample data
# Sightings of Black Oystercatcher chicks at Santa Cruz beaches
beaches <- c("Cowell's", "Steamer Lane", "Natural Bridges", "Mitchell's", "Main")
# blue, green, black, white, yellow
band_colors <- c("B", "G", "K", "W", "Y") 
# Surveys took place weekly in the summer of 2023
surveys <- seq(as.Date("2023-06-01"), as.Date("2023-08-31"), by = 7)

# Setting the "seed" forces randomized functions (like sample()) to generate
# the same output
set.seed(1538)
# 3 band colors identify a bird. We want 12 birds.
birds <- paste0(
  sample(band_colors, 25, replace = TRUE),
  sample(band_colors, 25, replace = TRUE),
  sample(band_colors, 25, replace = TRUE)
) %>% 
  unique() %>%
  head(12)
bloy_chicks <- tibble(
  # Randomly generate survey data
  beach = sample(beaches, size = 100, replace = TRUE),
  bird = sample(birds, size = 100, replace = TRUE),
  survey = sample(surveys, size = 100, replace = TRUE)
) %>% 
  # Remove duplicates (see ?distinct)
  distinct() %>% 
  # Sort by survey date and location
  arrange(survey, beach)
