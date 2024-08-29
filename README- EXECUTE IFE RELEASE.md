<<<<<<< HEAD

1- Get the starting dataset microsim_base_2014_t4.h5 from the linked zenodo repository, which is the fourth quarter of 2014 augmented with plausible individual careers. 
This starting dataset comes from the release MISSAR V1.0.

2- Go to ..\MISSAR\LIAM2_commented_code\Prospective_simulations\Seed_17101945\2014_t4_start\Permanent_IFE_variants\ to get the two hypothetical permanent IFE variants, with 
central, low and high economic scenarios. 

 Change the paths in the .yml files to link to the microsim_base_2014_t4.h5 starting dataset, and to the globals file globals_prosp_feb_2021_leg.csv found in 
..\MISSAR\LIAM2_commented_code\globals\ . 

3- Install the LIAM2 microsimulation toolbox found in liam2.plan.be, and execute the .yml files. Be sure to run the model through the permanent IFE variants and economic 
scenarios with the csv alignment files present in the Permanent_IFE_variants folder. The output csv files (adequacy_central.csv, central_v2_m.csv, etc.) have different 
names from one macroeconomic scenario to the other, but not between IFE variants. Be sure to move the csv output files out of the folder when done with a simulation. If you wish
to  output the full simulated synthetic dataset, uncomment the -person[dump_all] process near the end of the .yml simulation files. 

4- To get the simulated economic result, fetch the Deficit_computation_50_1.03_CPI.xlsx and  Deficit_computation_50_1.03_mob.xlsx excels from the linked zenodo repository. 
You can find these in the Excel_files_scenarios_and_results.rar file, within the ..\Prospective_extrapolated_results folder. Update the sheets with csv output file
names with the corresponding output (workers_and_wage_central.csv , low_v2_m.csv, etc.). You can find the data for Figure 4 in the first sheet, GDP evolution by scenario.
When done, go to sheet economic_result to get the IFE cost by variant and economic scenario. Copy those values and paste them in the
 Excel IFE_cost_graph_mobility.ods, in sheet Total_cost_IFE, used for Figure 6). Also, get the Total_IFE_coverage values from the sheets IFE_cost_central, IFE_cost_high and 
IFE_cost_low and copy them in the IFE_coverage sheet to get Figure 1.b). 

5- To get the simulated income distribution statistics, fetch the  Graphics_redistribution_SEDLAC_CPI_IFE.ods and Graphics_redistribution_SEDLAC_CPI_mob.ods files from the linked
zenodo repository. You can find these in the Excel_files_scenarios_and_results.rar file, within the ..\Prospective_extrapolated_results folder. Change the data in the 
redistribution_low, redistribution_central and redistribution_high sheets with the one you just simulated. You get the data for Figures 7.a) and 7.b) in the sheet Gini yearly.
For Figures 7.c) and 7.d), the data is in the sheet top 10% share yearly. 

6- Values from Figures 2.a) and 2.b) can be found on the linked zenodo repository, open the Excel_files_scenarios_and_results.rar file and go to the 
 ..\Prospective_scenarios\Historical_graphs_ages_16_69 folder. You can use either Economic_scenarios_representation_feb_2021.numbers file or the 
	Economic_scenarios_representation_nov_2020.xlsx file to see the values. 
	For Figure 3, go to the ..\Social_security_data\Historical_indexes\Compute_globals folder and, within the Inflation_RIPTE_and_ANSES_discounting_public.xlsx file 
	go to sheet real wage scenarios representat. 
	For Figure 5, go to the BC, BD and BE columns of Sheet possible_quarterly_mobility. 
7- Lastly, values for Figure 1.a) come from simulations with actual legislation up to March 2021, with no permanent IFE (but with the historical waves of the IFE simulated). 
	To get these, go to the linked zenodo repository and open the Historical_IFE_simulations.rar file. Go to the
	..\Prospective_extrapolated_results\Projections_2014_q4_start\March_2021_legislation folder and open the Households_with_no_income.ods file. The
	proportions of simulated households with no income are taken from the Deficit_computation_50_1.03_trim.xlsx file, in the IFE_cost_central, 
	IFE_cost_low and IFE_cost_high sheets, from the variable No_labour_or_pen_income_hh
=======

1- Get the starting dataset microsim_base_2014_t4.h5 from the linked zenodo repository, which is the fourth quarter of 2014 augmented with plausible individual careers. 
This starting dataset comes from the release MISSAR V1.0.

2- Go to ..\MISSAR\LIAM2_commented_code\Prospective_simulations\Seed_17101945\2014_t4_start\Permanent_IFE_variants\ to get the two hypothetical permanent IFE variants, with 
central, low and high economic scenarios. 

 Change the paths in the .yml files to link to the microsim_base_2014_t4.h5 starting dataset, and to the globals file globals_prosp_feb_2021_leg.csv found in 
..\MISSAR\LIAM2_commented_code\globals\ . 

3- Install the LIAM2 microsimulation toolbox found in liam2.plan.be, and execute the .yml files. Be sure to run the model through the permanent IFE variants and economic 
scenarios with the csv alignment files present in the Permanent_IFE_variants folder. The output csv files (adequacy_central.csv, central_v2_m.csv, etc.) have different 
names from one macroeconomic scenario to the other, but not between IFE variants. Be sure to move the csv output files out of the folder when done with a simulation. If you wish
to  output the full simulated synthetic dataset, uncomment the -person[dump_all] process near the end of the .yml simulation files. 

4- To get the simulated economic result, fetch the Deficit_computation_50_1.03_CPI.xlsx and  Deficit_computation_50_1.03_mob.xlsx excels from the linked zenodo repository. 
You can find these in the Excel_files_scenarios_and_results.rar file, within the ..\Prospective_extrapolated_results folder. Update the sheets with csv output file
names with the corresponding output (workers_and_wage_central.csv , low_v2_m.csv, etc.). You can find the data for Figure 4 in the first sheet, GDP evolution by scenario.
When done, go to sheet economic_result to get the IFE cost by variant and economic scenario. Copy those values and paste them in the
 Excel IFE_cost_graph_mobility.ods, in sheet Total_cost_IFE, used for Figure 6). Also, get the Total_IFE_coverage values from the sheets IFE_cost_central, IFE_cost_high and 
IFE_cost_low and copy them in the IFE_coverage sheet to get Figure 1.b). 

5- To get the simulated income distribution statistics, fetch the  Graphics_redistribution_SEDLAC_CPI_IFE.ods and Graphics_redistribution_SEDLAC_CPI_mob.ods files from the linked
zenodo repository. You can find these in the Excel_files_scenarios_and_results.rar file, within the ..\Prospective_extrapolated_results folder. Change the data in the 
redistribution_low, redistribution_central and redistribution_high sheets with the one you just simulated. You get the data for Figures 7.a) and 7.b) in the sheet Gini yearly.
For Figures 7.c) and 7.d), the data is in the sheet top 10% share yearly. 

6- Values from Figures 2.a) and 2.b) can be found on the linked zenodo repository, open the Excel_files_scenarios_and_results.rar file and go to the 
 ..\Prospective_scenarios\Historical_graphs_ages_16_69 folder. You can use either Economic_scenarios_representation_feb_2021.numbers file or the 
	Economic_scenarios_representation_nov_2020.xlsx file to see the values. 
	For Figure 3, go to the ..\Social_security_data\Historical_indexes\Compute_globals folder and, within the Inflation_RIPTE_and_ANSES_discounting_public.xlsx file 
	go to sheet real wage scenarios representat. 
	For Figure 5, go to the BC, BD and BE columns of Sheet possible_quarterly_mobility. 
7- Lastly, values for Figure 1.a) come from simulations with actual legislation up to March 2021, with no permanent IFE (but with the historical waves of the IFE simulated). 
	To get these, go to the linked zenodo repository and open the Historical_IFE_simulations.rar file. Go to the
	..\Prospective_extrapolated_results\Projections_2014_q4_start\March_2021_legislation folder and open the Households_with_no_income.ods file. The
	proportions of simulated households with no income are taken from the Deficit_computation_50_1.03_trim.xlsx file, in the IFE_cost_central, 
	IFE_cost_low and IFE_cost_high sheets, from the variable No_labour_or_pen_income_hh
>>>>>>> 12f2b92332c8cca169e4072a1b1ee4ea607764e3
