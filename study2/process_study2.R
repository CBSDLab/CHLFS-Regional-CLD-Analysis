# Read in the results from the simulation study and 
# and process them into the desired format
#
# Created by: Peter S. Hovmand April 20, 2025
# Revised by: Peter S. Hovmand May 4, 2025 for CHL FS study 1
#             Peter S. Hovmand May 4, 2025 for CHL FS study 2

library(fs)
library(readr)

# This searches for the results files with filenames in the form of Results_ 
# which includes Results_1.csv, Results_10.csv, etc. but excludes Results.csv
# since this only a temporary results file
results_list <- list.files(pattern="_Results_")

# Sort the list by when it was created. This is needed so that the index
# of the results_list file corresponds to the row or run number for that
# scenario
results_list <- results_list[order(file.mtime(results_list))]

# Create an empty object to store the processed results
processed_results <- NULL

# The results_list object is not sorted in the order of the simulation 
# runs, hence the files are read in a numeric order
for (i in 1:length(results_list)) {
  # Read in the .csv file for simulation run i
  tmp<-read_csv(file=results_list[i])
  
  # remove the run number of .csv from the results_list[i] filename
  scenario_name <- gsub("_Results_[[:digit:]]*[.]csv","", results_list[i])
  
  # create teh tempoary data frame for the results with the scenario
  # name and run number 
  tmp_df <- data.frame(Scenario = scenario_name,
                       Run = i,
                       tmp)
  # Append the processed data for simulation run i to the processed_results
  processed_results <- rbind(processed_results, tmp_df)
}

# Save the processed results
write_csv(processed_results, file = paste0(scenario_name,"_study2.csv"))

# Clean up the drive by deleting the individual simulation study results
file_delete(results_list)
