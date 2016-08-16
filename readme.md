# Clean Infoshare migration data

This is a small script to clean the New Zealand migration data downloaded from Statistics New Zealand's Infoshare system. Source data and the cleaned data is included together with the code to create the cleaned data from the source.

The original data was downloaded from the "Permanent & long-term migration by EVERY country of residence and citizenship (Monthly)" table. The data was requested from Infoshare so that "Travel Direction" is in the columns and all other variables are in the rows. 

Due to Infoshare's 100,000 rows limit, the data was downloaded in several files corresponding to all variables for different time periods. The R script combines these data files into a single CSV file and performs other cleaning operations on the data. 
