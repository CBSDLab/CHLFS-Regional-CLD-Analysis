# Analysis of the Children's Healthy Living (CHL) Food Systems Regional Causal Loop Diagram (CLD) Scoping Model

This repository contains model and code for running analyses of the CHL Regional CLD simulation model. The Regional CLD system dynamics model was developed as a learning model based on synthesis of causal loop diagrams created in group model building workshops across the US Affiliated Pacific jurisdcitions (Alaska, Hawai'i, Commonwealth of Northern Mariana Islands, Guam, and American Samoa). The CLDs from each jurisdiction were synthesized at the 2023 annual meeting in a group model building session with researchers and jurisdiction leads resulting in the regional CLD shown below.

![image](https://github.com/user-attachments/assets/45c6137d-500e-4068-a8c9-8092e4b503e5)

Major limitations of the CLD included the high level of aggregation that raised questions about the applicability of the CLD to local jurisdictions and the difficulty knowing how to interpret the qualitative CLD. Questions were also raised about how the CLD aligned with data and if there might be a way to evaluate the CLD emperically. 

To address these limitations and questions, a simulation model was developed based on the regional CLD where the CLD represents the core feedback theory of the Pacific regional food system. The primary purpose of this scoping model is to be able to emperically test the CLD against data and evaluate heuristics commonly used to interpret qualitative system dynamics models. For example, a common practice in analyzing qualitative CLDs borrows a technique from Theory of Constraints that compares the degree of causal variables influencing a variable or node with the number of effect variables to rank potential leverage points. Another example is the use of Donella Meadows' ranking of potential leverage points. A third approach draws on results from graph theory and centrality measures to infer leverage points based on the qualitative CLD alone. However, these heuristics for interpreting qualitative CLDs have not been formally tested. 

The strict correspondence between the qualitative CLD and simulation model means that the simulation results can be interpreted as the behavior logically implied by the CLD. It is important to keep in mind that this is only one set of implied behaviors among a much larger set of implied behaviors as different techniques for formally simulating a CLD could yeild different sets of implied behaviors. While this limits the practical significance of a CLD simulation to inform policies and interventions in the real world, it does allow us to better understand the limitations of qualitative CLDs and heuristics. That is important to keep in mind because short of building full research simulation models, which takes time, resources, data, and considerable expertise in developing and testing simulation models, many justify the use of qualitative CLDs and heuristics as a viable alternative to simulation modeling for informing policy and intervention design.   

## Preliminaries

Begin by creating a working directory and then clone the repository so that the files needed for each study are in their own folder. In the terminal, type or copy the following command:
```
git clone https://github.com/CBSDLab/CHLFS-Regional-CLD-Analysis.git
```
After cloning the directory, go to the CHLFS-Regional-CLD-Analysis directory. 

```
cd CHLFS-Regional-CLD-Analysis
```

## Study 1 - Simulating Shock Scenarios

Study 1 runs the model for a series of exogenous or "shock" scenarios. Change to the study1 directory and then examine the contents with the following commands:

```
cd study1
ls
```
The study directory contains the files needed to run the study 1 simulations, including:

* Regional-CLD-5-1.stmx - this is the Stella simulation model
* Parms.csv - an input file with the parameter values that will be used for the current simulation
* Results.csv - the output file with the results from the current simulation
* shock-scenario.csv - the shock scenario being simulated for the current simulation

The time varying values that specify each shock scenario for the region and each jurisdictions are described in the following .csv files: 

* Shock-scenario-Alaska-1.csv
* Shock-scenario-Alaska-2.csv
* Shock-scenario-American-Samoa.csv
* Shock-scenario-Guam.csv
* Shock-scenario-Hawaii-1.csv
* Shock-scenario-Hawaii-2.csv
* Shock-scenario-CNMI.csv
* Shock-scenario-Regional.csv

The parameter values used for study1 are defined in study1.csv. For study 1, these are the same parameters for each scenario. Lastly, there are a number of scripts for running and processing the study 1 simulation results:

* simulate_study1.sh - this is the main Bash SLURM script for running the simulation study. 
* study_simulate.awk - this is the AWK script for running each simulation. 
* process_study1.R - this is an R script that processes and combines the results after all the simulations have been completed. 

To submit a batch job to run the simulation, type the follow sbatch command:

```
sbatch simulate_study1.sh
```
## Study 2 - Simulating Shock Scenarios with Sensitivity Analysis

