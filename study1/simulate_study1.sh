#!/bin/bash
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -t 1:00:00
#SBATCH --output=my.stdout 
#SBATCH --mail-user=<your email>
#SBATCH --mail-type=ALL 
#SBATCH --job-name="CHL FS CLD Study1"
#SBATCH -o serial-R.out%j # capture jobid in output file name

echo "CHL FS CLD study 1" > timing_study1.out
time(
    # run simulation study using AWK script
    awk -f study_simulate.awk -v MODEL="Regional-CLD-5-1.stmx" -v SCENARIO="Shock-scenario-Regional" study1.csv
    awk -f study_simulate.awk -v MODEL="Regional-CLD-5-1.stmx" -v SCENARIO="Shock-scenario-American-Samoa" study1.csv
    awk -f study_simulate.awk -v MODEL="Regional-CLD-5-1.stmx" -v SCENARIO="Shock-scenario-CNMI" study1.csv
    awk -f study_simulate.awk -v MODEL="Regional-CLD-5-1.stmx" -v SCENARIO="Shock-scenario-Guam" study1.csv
    awk -f study_simulate.awk -v MODEL="Regional-CLD-5-1.stmx" -v SCENARIO="Shock-scenario-Hawaii-1" study1.csv
    awk -f study_simulate.awk -v MODEL="Regional-CLD-5-1.stmx" -v SCENARIO="Shock-scenario-Hawaii-2" study1.csv
    awk -f study_simulate.awk -v MODEL="Regional-CLD-5-1.stmx" -v SCENARIO="Shock-scenario-Alaska-1" study1.csv
    awk -f study_simulate.awk -v MODEL="Regional-CLD-5-1.stmx" -v SCENARIO="Shock-scenario-Alaska-2" study1.csv

    # load R module to process results
    module load R/4.1.2-foss-2021b
    Rscript process_study1.R
) 2>> timing_study1.out
