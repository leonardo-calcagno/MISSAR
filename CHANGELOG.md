<<<<<<< HEAD

Version 1.1. 
- Added wage equation residuals in the Mincer wage equations used to determine labour income
- Print header of output csv files only once per simulation
- The 2019 Budget Law makes the Universal Pension for the Elderly Adult incompatible with formal labour. Adopted this change in the model.
- Took measures to reduce the proportion of households with no labour or pension income: 
	* Unemployed and inactive young adults can move back to parents' place
	* Only form new household at 24 if working
	* In households with no pension income, have the oldest working-age dweller at least be an informal worker (without affecting age and gender specific
		 aggregate labour-market state proportions)
- Improved the handling of independent workers of the formal sector: 
	* Proportions of "monotributistas" and "autónomos" up to the first quarter of 2019
	* Start using labour ministry data for total autonomou and monostributista independent workers
	* Take into account age and gender structure of independent workers in the EPH to better determine who is "autónomo", "monotributista", or a non-registered 
		independent worker.
	* Corrected the computation of rents of reference for autonomous workers.
- Updated economic data:
	* CPI up to September 2019
	* Wages up to July 2019
	* EPH survey up to fist quarter of 2019 
- Start taking into account  inflation in macroeconomic projections: 
	* Impact of expected inflation deceleration on real pension mobility
	* Use Market Expectations Survey (REM) from the Central Bank for inflation up to 2025. Still assume 0 inflation by 2026.

Version 1.2. 
- Dynamic globals computation: 
	* Globals input in dynamic microsimulation are the result of the Inflation_Ripte_and_ANSES_discounting excel. 
	* Monthly inflation projected up to 2040, with direct impact on real mobility
- Start ex-ante projections: since pension mobility is suspended, run projections with varying new pension mobility scenarios
- Incorporated the computation of temporary pension and family benefits bonuses
	* Allowed for the coding of one-time family-benefits and pension bonuses, that do not change future benefits' levels.
	* Incorporated March 2018, Decree 73/2019 December 2019 and January 2020 one-time pension bonuses.  
	* Added one-time Universal Child Benefit (AUH) bonuses.
- Include measures taken by Law 27.541; distinct end-of-term 10/12/2019 Macri legislation, and 31/12/2019 legisaltion. 
- Coded lump-sum increase of March 2020. 
- Corrected interpretation error: non-taxable income on employers contributions, introduced by Law 27.430, does not apply to civil servants
- Updated economic data: 
	* CPI up to October 2020
	* Wages up to September 2020
	* EPH survey up to second quarter of 2020

Version 1.3. 
- Code Emergency Family Income (IFE), both historical values (April 2020-September 2020) and hypothetical permanent IFE variations.
- Flag a proportion of initial pensioners as having a 2006 pension moratorium. This is important for Law 26.417 pension mobillity computation and 
		to study the evolution of benefits given through a pension moratorium over time.
- Reproduce the proportion of individuals that in 2014 received a retirement pension and a survivors' benefit at the same time: important for both 
	Law 26.417 and 27.609 pension mobility formula (which depend on the evolution of total benefits given, not on that of total beneficiaries of at least
	one benefit).
- Better compute Law 26.417 (2008-2017) and Law 27.609 (2021-) pension mobility laws: 
	* Start computing SIPA benefits given each quarter, not only beneficiaries, distinguishing between contributory and non-contributory retirement and survivors' benefits. 
		This is because both Laws divide ANSES fiscal income by ANSES benefits, not ANSES beneficaries. 
	* For Law 26.417 pension mobility, you only consider contributory retirement and survivors' benefits in pension mobility.
	* For Law 27.609 pension mobility, take into account Decree 104/2021 (B.O. 13/02/2021) reglamentation: all ANSES fiscal income and all retirement, survivors' and PUAM
		benefits. 
- Legislation interpretation mistake corrected: PUAM is not compatible with survivors benefits (less simulated people with the PUAM). 
- Code release for submitted article: The Emergency Family Income (IFE) in Argentina: Could It Become a Permanent Safety Net?
- Updated economic data: 
	* CPI up to January 2021
	* Wages up to December 2020
	* EPH survey up to third quarter of 2020
- Removed excel files and results from ex-ante policy evaluation variants; moved to ZENODO repository linked to tagged versions. Included xls and xlsx files in gitignore.

Version 1.4. (ongoing)
- Corrected various globals errors, including Law 26.417 pension mobility formula computation
- 2021 temporary benefits taken into account: doubling of family benefits, pension bonuses...
- Correct birth module, making child-bearing probability conditional on current number of children
- Correct major birth probability error in p_birth_f3.csv; also, stop dividing by 4 for quarterly probabilities of giving birth
- Add Decree 475/2021 quarter validation for women depending on total children, and number of children with AUH
- Generate and handle globals with R and google drive
- Handle MISSAR results with R and google drive
- Include 2022 proposed pension moratorium legislation
- Manually updated economic data: 
	* Autonomous and monotributista information up to February 2022
	* Gender of autonomous and monotributistas workers measured for December 2021 (BESS)
- Data scraping for automatic calibration data updates: 
	* CPI, RIPTE and INDEC wage indexes
	* ANSES fiscal income , from Savings-Investment-Accounts
	* Social security contributions (AFIP)
	* Ongoing: ANSES benefits, with Selenium
- Migration from SAS to R:
	* Alignment tables from the EPH dataset (2003-2023)
	* Macro for family links determination for post 2016 EPH dataset
=======

Version 1.1. 
- Added wage equation residuals in the Mincer wage equations used to determine labour income
- Print header of output csv files only once per simulation
- The 2019 Budget Law makes the Universal Pension for the Elderly Adult incompatible with formal labour. Adopted this change in the model.
- Took measures to reduce the proportion of households with no labour or pension income: 
	* Unemployed and inactive young adults can move back to parents' place
	* Only form new household at 24 if working
	* In households with no pension income, have the oldest working-age dweller at least be an informal worker (without affecting age and gender specific
		 aggregate labour-market state proportions)
- Improved the handling of independent workers of the formal sector: 
	* Proportions of "monotributistas" and "autónomos" up to the first quarter of 2019
	* Start using labour ministry data for total autonomou and monostributista independent workers
	* Take into account age and gender structure of independent workers in the EPH to better determine who is "autónomo", "monotributista", or a non-registered 
		independent worker.
	* Corrected the computation of rents of reference for autonomous workers.
- Updated economic data:
	* CPI up to September 2019
	* Wages up to July 2019
	* EPH survey up to fist quarter of 2019 
- Start taking into account  inflation in macroeconomic projections: 
	* Impact of expected inflation deceleration on real pension mobility
	* Use Market Expectations Survey (REM) from the Central Bank for inflation up to 2025. Still assume 0 inflation by 2026.

Version 1.2. 
- Dynamic globals computation: 
	* Globals input in dynamic microsimulation are the result of the Inflation_Ripte_and_ANSES_discounting excel. 
	* Monthly inflation projected up to 2040, with direct impact on real mobility
- Start ex-ante projections: since pension mobility is suspended, run projections with varying new pension mobility scenarios
- Incorporated the computation of temporary pension and family benefits bonuses
	* Allowed for the coding of one-time family-benefits and pension bonuses, that do not change future benefits' levels.
	* Incorporated March 2018, Decree 73/2019 December 2019 and January 2020 one-time pension bonuses.  
	* Added one-time Universal Child Benefit (AUH) bonuses.
- Include measures taken by Law 27.541; distinct end-of-term 10/12/2019 Macri legislation, and 31/12/2019 legisaltion. 
- Coded lump-sum increase of March 2020. 
- Corrected interpretation error: non-taxable income on employers contributions, introduced by Law 27.430, does not apply to civil servants
- Updated economic data: 
	* CPI up to October 2020
	* Wages up to September 2020
	* EPH survey up to second quarter of 2020

Version 1.3. 
- Code Emergency Family Income (IFE), both historical values (April 2020-September 2020) and hypothetical permanent IFE variations.
- Flag a proportion of initial pensioners as having a 2006 pension moratorium. This is important for Law 26.417 pension mobillity computation and 
		to study the evolution of benefits given through a pension moratorium over time.
- Reproduce the proportion of individuals that in 2014 received a retirement pension and a survivors' benefit at the same time: important for both 
	Law 26.417 and 27.609 pension mobility formula (which depend on the evolution of total benefits given, not on that of total beneficiaries of at least
	one benefit).
- Better compute Law 26.417 (2008-2017) and Law 27.609 (2021-) pension mobility laws: 
	* Start computing SIPA benefits given each quarter, not only beneficiaries, distinguishing between contributory and non-contributory retirement and survivors' benefits. 
		This is because both Laws divide ANSES fiscal income by ANSES benefits, not ANSES beneficaries. 
	* For Law 26.417 pension mobility, you only consider contributory retirement and survivors' benefits in pension mobility.
	* For Law 27.609 pension mobility, take into account Decree 104/2021 (B.O. 13/02/2021) reglamentation: all ANSES fiscal income and all retirement, survivors' and PUAM
		benefits. 
- Legislation interpretation mistake corrected: PUAM is not compatible with survivors benefits (less simulated people with the PUAM). 
- Code release for submitted article: The Emergency Family Income (IFE) in Argentina: Could It Become a Permanent Safety Net?
- Updated economic data: 
	* CPI up to January 2021
	* Wages up to December 2020
	* EPH survey up to third quarter of 2020
- Removed excel files and results from ex-ante policy evaluation variants; moved to ZENODO repository linked to tagged versions. Included xls and xlsx files in gitignore.

Version 1.4. (ongoing)
- Corrected various globals errors, including Laws 26.417and 27.426 pension mobility formula computation
- Temporary benefits taken into account: doubling of family benefits (2021), pension boqnuses (2021-2024)...
- Correct birth module, making child-bearing probability conditional on current number of children
- Correct major birth probability error in p_birth_f3.csv; also, stop dividing by 4 for quarterly probabilities of giving birth
- Add Decree 475/2021 quarter validation for women depending on total children, and number of children with AUH
- Add 2023 Law 27.705 pension moratorium and buyback mechanism simulation
- Add August 2024 Milei legislation:
	* Monthly pension indexation following CPI, (Decree 274/2024) 
	* Doubling of the AUH (Decree 117/2023)
	* Tentative pension bonus for minimum pensions of fixed $70.000 ARS (same in AF end-of-term legislation)
- Rework pension mobility in globals: actual quarterly average of real monthly values, instead of middle-of-the quarter pension mobility value
- Generate and handle globals with R and google drive
- Handle MISSAR results with R and google drive
- Data scraping for automatic calibration data updates: 
	* CPI, RIPTE and INDEC wage indexes
	* ANSES fiscal income , from Savings-Investment-Accounts
	* Social security contributions (AFIP)
	* ANSES benefits, for pension mobility computation, with Selenium
	* Autonomous and monotributista independent workers information (gender taken from December 2021 BESS)
- Migration from SAS to R:
	* Alignment tables from the EPH dataset (2003-2024)
	* Macro for family links determination for post 2016 EPH dataset
- Add CELADE 2024 demographic projections alignment tables in alternative projections folder (by Agustin Romero)
>>>>>>> 12f2b92332c8cca169e4072a1b1ee4ea607764e3
