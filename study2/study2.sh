#!/bin/bash
# Study 2 runs a sensitivity for each shock scenario reading based on the 
# the Shock-scenario-*.csv file by creating a study2.csv file of parameters
# and initial conditions sample from a distribution using the 
# sampple_parms_studdy2.R script, running the study for that scenario, and
# processing the results for that scenario. Results are saved for each scenario
# so they can be analyzed by the scenario and combined later. 
# 
# Created by Peter S. Hovmand May 4, 2025
# Revised by Peter S. Hovmand May 11, 2025
# 
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -t 1:00:00
#SBATCH --output=my.stdout 
#SBATCH --mail-user=<your email> 
#SBATCH --mail-type=ALL 
#SBATCH --job-name="CHL FS CLD study 2"
# 
#SBATCH -o serial-R.out%j # capture jobid in output file name

echo "CHL FS CLD study 2" > timing_study2.out
time(
    # load R module
    # module load R/4.1.2-foss-2021b
    
    # get a list of the 
    file_list=$(ls Shock-scenario-*.csv)
    
    # loop through the list of shock scenarios
    for scenario in $file_list 
    do
      # echo the current run to stdio
      echo "running = $scenario"
      
      # Sample parameters for the study2.csv
      Rscript sample_parms_study2.R
      
      # run simulate the study for the scenario
      awk -f simulate_study.sh -v MODEL="Regional-CLD-5-1.stmx" -v SCENARIO=$scenario study2.csv
 
      # Process results
      Rscript process_study2.R
    done
    

) 2>> timing_study2.out
