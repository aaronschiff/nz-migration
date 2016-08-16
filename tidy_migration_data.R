# Cleaning up migration data downloadeded from Infoshare

# Setup
rm(list = ls())
library(readr)
library(tidyr)
library(dplyr)

# Read and clean an individual data file
readMigrationData = function(f) {
  # Read the data
  dirty_dat = read_csv(f, 
                       skip = 2, 
                       col_names = c("citizenship", "residence", "date", "arrivals", "departures"))
  
  # Trim the footnotes
  last_row = which(dirty_dat$citizenship == "Table information:") - 1
  dirty_dat = dirty_dat[1:last_row, ]
  
  # Clean the data 
  clean_dat = dirty_dat %>% 
    fill(citizenship, residence) %>% 
    separate(date, 
             into = c("year", "month"), 
             sep = "M", 
             convert = TRUE)
  
  return(clean_dat)
}

# Read all data files
files = list.files(path = "source_data", pattern = "*.csv", full.names = TRUE)
dat = lapply(files, readMigrationData) %>% bind_rows()
dat = arrange(dat, residence, citizenship, year, month)

# Write out migration data
write_csv(dat, "migration_data.csv")
