# !/bin/awk
# Simulates the model reading in the model, scenario, and study file with the 
# parameters
# 
# Run this with from the command line with: 
#   awk -f simulate_study.sh -v MODEL="Regional-CLD-5-1.stmx" -v SCENARIO="Shock-scenario-Regional.csv" study2.csv
#
# Created by: Peter S. Hovmand March 24, 2024
# Revised by: Peter S. Hovmand April 18, 2025 for workshop
#             Peter S. Hovmand April 20, 2025 to add model name as option
#             Peter S. Hovmand May 4, 2025 for CHL FS CLD analysis
#             Peter S. Hovmand May 11, 2025 for study 2

# process_run.R and appended to the study results file. 

BEGIN {
  # Comment/uncomment lines below depending on the platform
  STELLA_PATH="/Applications/Stella_Simulator_3.5.1_Mac_Arm/stella_simulator"
  # STELLA_PATH="/home/psh39/Stella_Simulator/stella_simulator"
  
  # Set the model run simulation arguments
  STELLA_RUN=" -q " "'" MODEL "'"

  # Set Stella command
  STELLA_CMD=STELLA_PATH STELLA_RUN
}

# Pulls the variable names from the top row of the csv file of parameters
NR == 1 {
  varnames = $0
  print STELLA_CMD
  }
  
# Saves each row as a .csv file that can be dynamically linked and
# and run with a Stella model
NR >1 {
  # write the parameters for the row to the Parms.csv import file
  print varnames "\n" $0 > "Parms.csv"
  close("Parms.csv")
  
  # copy the scenario to the "schok scenario.csv" file
  TMP="cp " SCENARIO" shock-scenario.csv"
  system(TMP)
  
  # run the model
  system(STELLA_CMD)
  
  # copy results to a unique file for the run
  ## first remove the .csv from the SCENARIO variable
  gsub(/.csv/, "",SCENARIO)
  TMP="cp Results.csv " SCENARIO "_Results_" NR-1 ".csv" 
  system(TMP)
  } 
  
