
/***********Quick addition: show the non-response to the income variable among workers skyrockets with the new iteration of the EPHc 
		since 2016. It increases from 2.7% between 2003 and 2015 to 25% in 2016-2017. */

options nofmterr; 
proc contents data=leo.eph_formatted_2016_2019; run; 
data labour_income; 
set leo.eph_formatted_2016_2019; 
	where estado=1 & (cat_ocup=1| cat_ocup=2 |cat_ocup=3);
		ITL=p21+tot_p12;
run; 
data labour_income; 
set labour_income; 
		keep itl pondera estado cat_ocup period; 
run; 
data labour_income; 
set labour_income; 
	income_response=0; 
	if itl>0 then income_response=1; 
run; 
proc freq data=labour_income; 
	weight pondera; 
	table income_response*cat_ocup; 
	table income_response*period; 
run; 
/*




/**************************************************************************************************************************/
	/*Now we will study the redistributive impact of ANSES reforms and the adequacy of their benefits*/
/*dm 'odsresults; clear'; 
dm 'clear log'; 
proc means data=leo.prosp_central_imp_152;
		where v2_m_actu_2^=0; 
		weight pondera; 
			var v2_m_actu_2; 
run; 
proc means data=leo.prosp_central_imp_70; 
		where liqui_retirement="True"; 
		weight pondera; 
			var v2_m_actu_2; 
run; 
proc print data=leo.prosp_central_imp_70 (obs=10); 
where liqui_retirement="True" & v2_m_actu_2=0; run; 
proc print data=leo.prosp_central_imp_70 (obs=10); 
where liqui_retirement="True" & v2_m_actu=0; run; 
proc freq data=leo.prosp_central_imp_70; 
table age; 
where liqui_retirement="True" & v2_m_actu_2=0; 
run; 
proc freq data=leo.prosp_central_imp_70; 
weight pondera; 
where age=65; 
table universal_net_pensioN; run; 
proc print data=leo.prosp_central_imp_80 (obs=10); 
where age>=65; run; 
proc means data=leo.prosp_central_imp_50;
		where v2_m_actu_2^=0; 
		weight pondera; 
			var v2_m_actu_2; 
run; 

proc means data=leo.liam_brux_nv_2014_t4;
		where v2_m_actu^=0; 
		weight pondera; 
			var v2_m_actu; 
run; */
dm 'odsresults; clear'; 
dm 'clear log'; 
/**************************************First, we compute household income************************************************/
data household_income; 
set leo.liam_brux_nv_2014_t4; 
	total_income=itl_actu+v2_m_actu+v5_m_actu; 
run; 

proc sort data=household_income; 
	by hogar;
run; 	
data household_income; 
set household_income; 
	by hogar; 
	if first.hogar then 
		do; 
			hh_income=total_income; 
			hh_labour_income=itl_actu; 
			hh_pension=v2_m_actu; 
			hh_family_benefits=v5_m_actu; 
			household_members=1; 
		end; 
	else 
		do; 
			hh_income+total_income; 
			hh_labour_income+itl_actu; 
			hh_pension+v2_m_actu; 
			hh_family_benefits+v5_m_actu;
			household_members+1; 
			end; 
	if last.hogar; 
run; 


data hh_with_no_income; 
set household_income;
	if hh_income>0 then has_income=1; 
	if hh_income=0 then has_income=0; 
run; 
proc freq data=hh_with_no_income; 
	weight pondera; 
		table has_income;
run; 


/*This is enough to compute redistribution indicators on per capita income. However, most agencies (the OCDE and INSEE for France, SEDLAC and
		World Bank for Argentina) compute these on equivalised income: total income is divided by the consumption units in a household, 
		not the actual number of denizens. We will thus comlpete the household_income dataset with these alternatives measures to determine
		household wealth.*/ 
proc sort data=leo.liam_brux_nv_2014_t4; 
	by hogar descending ch06; 
run; 

data consumption_unit; 
set leo.liam_brux_nv_2014_t4; 
	by hogar; 
	if first.hogar then 
		do; 
			consumption_unit=1; 
		end; 
	else 
		do; 
			if ch06>=14 then consumption_unit=0.5; 
			if ch06<14 then consumption_unit=0.3; 
		end; 
	consumption_unit_sedlac=1; 
	if ch06<=5 then consumption_unit_sedlac=0.5; 
	if 17>=ch06>5 then consumption_unit_sedlac=0.75; 
run; 
proc means data=consumption_unit noprint; 
	by hogar; 
		var consumption_unit;
			output out=hh_cu sum=total_cu;  
run; 

proc means data=consumption_unit noprint; 
	by hogar; 
		var consumption_unit_sedlac; 
			output out=hh_cu_sedlac sum=total_cu_sedlac; 
run; 
data hh_cu; 
set hh_cu; 
	keep hogar total_cu; 
run; 
data hh_cu_sedlac; 
set hh_cu_sedlac; 
	keep hogar total_cu_sedlac; 
run; 
/*This is where we compute the various possible definitions of household income*/
data household_income; 
merge household_income hh_cu hh_cu_sedlac; 
	by hogar; 
		
	per_cap_income=hh_income/household_members; 
	per_cap_labour_income=hh_labour_income/household_members; 
	per_cap_labour_pen_income=(hh_labour_income+hh_pension)/household_members; 
	per_cap_labour_fam_income=(hh_labour_income+hh_family_benefits)/household_members;

	cu_income=hh_income/total_cu; 
	cu_labour_income=hh_labour_income/total_cu; 
	cu_labour_pen_income=(hh_labour_income+hh_pension)/total_cu; 
	cu_labour_fam_income=(hh_labour_income+hh_family_benefits)/total_cu;

	sedlac_income=hh_income/(total_cu_sedlac**0.9); 
	sedlac_labour_income=hh_labour_income/(total_cu_sedlac**0.9); 
	sedlac_labour_pen_income=(hh_labour_income+hh_pension)/(total_cu_sedlac**0.9); 
	sedlac_labour_fam_income=(hh_labour_income+hh_family_benefits)/(total_cu_sedlac**0.9);

keep 
	per_cap_income per_cap_labour_income per_cap_labour_pen_income per_cap_labour_fam_income
	cu_income cu_labour_income cu_labour_pen_income cu_labour_fam_income
	sedlac_income sedlac_labour_income sedlac_labour_pen_income sedlac_labour_fam_income
	hh_income hh_labour_income hh_pension hh_family_benefits household_members 
	hogar pondera ano4 period;  
run; 
/*********************The first big family of indicators is those where we take out households who do not report labour, pension or family
		benefits income. This is what is done by SEDLAC when computing the GINI. The ECLAC tries to assign minimum plausible incomes to these
		households. The problem is SEDLAC's option is the simplest and also works best with our microsimulation (by construction, 
		all simulated workers report their income and simulated incomeless households are those who happen to be made up of unemployed 
		or inactive people with no revenue).*/
data hh_all_income; 
set household_income; 
	if per_cap_income=0 then delete; 
run; 

data hh_labour_income; 
set household_income; 
	if per_cap_labour_income=0 then delete; 
run; 
data hh_labour_pen_income; 
set household_income; 
	if per_cap_labour_pen_income=0 then delete; 
run; 
data hh_labour_fam_income; 
set household_income; 
	if per_cap_labour_fam_income=0 then delete; 
run; 
/*Then, we compute the top and bottom deciles among households following these variating definitions of household income */
proc univariate data=household_income noprint;
	where per_cap_income^=0 ;
	weight pondera; 
   		var per_cap_income;
   		output out=deciles_per_cap_1 pctlpts= 10 50 90 pctlpre=decile_all_; 
run;


proc univariate data=household_income noprint;
	where per_cap_labour_income^=0 ;
	weight pondera; 
   		var per_cap_labour_income;
   		output out=deciles_per_cap_2 pctlpts= 10 50 90 pctlpre=decile_labour_; 
run;

proc univariate data=household_income noprint;
	where per_cap_labour_pen_income^=0 ;
	weight pondera; 
   		var per_cap_labour_pen_income;
   		output out=deciles_per_cap_3 pctlpts= 10 50 90 pctlpre=decile_labour_pen_; 
run;

proc univariate data=household_income noprint;
	where per_cap_labour_fam_income^=0 ;
	weight pondera; 
   		var per_cap_labour_fam_income;
   		output out=deciles_per_cap_4 pctlpts= 10 50 90 pctlpre=decile_labour_fam_; 
run;

/**************************************************************************************************/

proc univariate data=household_income noprint;
	where per_cap_income^=0 ;
	weight pondera; 
   		var cu_income;
   		output out=deciles_cu_1 pctlpts= 10 50 90 pctlpre=decile_all_; 
run;


proc univariate data=household_income noprint;
	where per_cap_labour_income^=0 ;
	weight pondera; 
   		var cu_labour_income;
   		output out=deciles_cu_2 pctlpts= 10 50 90 pctlpre=decile_labour_; 
run;

proc univariate data=household_income noprint;
	where per_cap_labour_pen_income^=0 ;
	weight pondera; 
   		var cu_labour_pen_income;
   		output out=deciles_cu_3 pctlpts= 10 50 90 pctlpre=decile_labour_pen_; 
run;

proc univariate data=household_income noprint;
	where per_cap_labour_fam_income^=0 ;
	weight pondera; 
   		var cu_labour_fam_income;
   		output out=deciles_cu_4 pctlpts= 10 50 90 pctlpre=decile_labour_fam_; 
run;


/**************************************************************************************************/
proc univariate data=household_income noprint;
	where per_cap_income^=0 ;
	weight pondera; 
   		var sedlac_income;
   		output out=deciles_sedlac_1 pctlpts= 10 50 90 pctlpre=decile_all_; 
run;

proc univariate data=household_income noprint;
	where per_cap_labour_income^=0 ;
	weight pondera; 
   		var sedlac_labour_income;
   		output out=deciles_sedlac_2 pctlpts= 10 50 90 pctlpre=decile_labour_; 
run;

proc univariate data=household_income noprint;
	where per_cap_labour_pen_income^=0 ;
	weight pondera; 
   		var sedlac_labour_pen_income;
   		output out=deciles_sedlac_3 pctlpts= 10 50 90 pctlpre=decile_labour_pen_; 
run;

proc univariate data=household_income noprint;
	where per_cap_labour_fam_income^=0 ;
	weight pondera; 
   		var sedlac_labour_fam_income;
   		output out=deciles_sedlac_4 pctlpts= 10 50 90 pctlpre=decile_labour_fam_; 
run;

/*We then deduce the interdecile ratio, income share of the top decile and of the bottom decile.*/

/*******************The statistics when we take the per capita income************************************************/
data deciles_per_cap_1; 
set deciles_per_cap_1; 
	ano4=2014; 
run;
data deciles_per_cap_2; 
set deciles_per_cap_2; 
	ano4=2014; 
run;
data deciles_per_cap_3; 
set deciles_per_cap_3; 
	ano4=2014; 
run;
data deciles_per_cap_4; 
set deciles_per_cap_4; 
	ano4=2014; 
run; 
data leo.decile_ratios_2014_t4; 
merge deciles_per_cap_1-deciles_per_cap_4; 
	by ano4; 
		decile_ratio_all=decile_all_90/decile_all_10; 
			decile_ratio_labour=decile_labour_90/decile_labour_10; 
			decile_ratio_labour_pen=decile_labour_pen_90/decile_labour_pen_10; 
			decile_ratio_labour_fam=decile_labour_fam_90/decile_labour_fam_10; 
		d9_d5_all=decile_all_90/decile_all_50; 
			d9_d5_labour=decile_labour_90/decile_labour_50; 
			d9_d5_labour_pen=decile_labour_pen_90/decile_labour_pen_50; 
			d9_d5_labour_fam=decile_labour_fam_90/decile_labour_fam_50; 
		d5_d1_all=decile_all_50/decile_all_10; 
			d5_d1_labour=decile_labour_50/decile_labour_10; 
			d5_d1_labour_pen=decile_labour_pen_50/decile_labour_pen_10; 
			d5_d1_labour_fam=decile_labour_fam_50/decile_labour_fam_10; 

	keep decile_ratio_all decile_ratio_labour decile_ratio_labour_pen decile_ratio_labour_fam
		d9_d5_all d9_d5_labour d9_d5_labour_pen d9_d5_labour_fam
		d5_d1_all d5_d1_labour d5_d1_labour_pen d5_d1_labour_fam; 
run; 
data income_redistribution; 
merge household_income deciles_1; 
	by ano4; 
	bottom_10=0; 
	top_10=0; 
	if per_cap_income<=decile_all_10 & per_cap_income^=0
		then bottom_10=1; 
	if per_cap_income>=decile_all_90
		then top_10=1; 
	total_hh_income=per_cap_income*household_members*pondera; 
	total_labour_income=per_cap_labour_income*household_members*pondera; 
	total_labour_pen_income=(per_cap_labour_income+per_cap_labour_pen_income)*household_members*pondera; 
	total_labour_fam_income=(per_cap_labour_income+per_cap_labour_fam_income)*household_members*pondera; 
run; 
proc sort data=income_redistribution; 
by ano4;
run;  
data sum_total_income;
    set income_redistribution;
    by ano4;
    if first.ano4 then do; 
		sum_total_income=total_hh_income;
		sum_labour_income=total_labour_income; 
		sum_labour_pen_income=total_labour_pen_income; 
		sum_labour_fam_income=total_labour_fam_income; 
	end; 
    else do; 
		sum_total_income+total_hh_income;
		sum_labour_income+total_labour_income;
		sum_labour_pen_income+total_labour_pen_income;
		sum_labour_fam_income+total_labour_fam_income;
	end; 
    if last.ano4;
	keep sum_total_income sum_labour_income sum_labour_pen_income sum_labour_fam_income ano4; 
run;

data sum_top_10_income; 
set income_redistribution; 
	where top_10=1; 
	by ano4;
    if first.ano4 then do; 
		sum_top_10_income=total_hh_income;
		sum_top_10_labour_income=total_labour_income; 
		sum_top_10_pen_income=total_labour_pen_income; 
		sum_top_10_fam_income=total_labour_fam_income; 
	end; 
    else do; 
		sum_top_10_income+total_hh_income;
		sum_top_10_labour_income+total_labour_income;
		sum_top_10_pen_income+total_labour_pen_income;
		sum_top_10_fam_income+total_labour_fam_income;
	end; 
    if last.ano4;
	keep sum_top_10_income sum_top_10_labour_income sum_top_10_pen_income sum_top_10_fam_income ano4; 
run;
	
data sum_bottom_10_income; 
set income_redistribution; 
	where bottom_10=1; 
	by ano4;
    if first.ano4 then do; 
		sum_bottom_10_income=total_hh_income;
		sum_bottom_10_labour_income=total_labour_income; 
		sum_bottom_10_pen_income=total_labour_pen_income; 
		sum_bottom_10_fam_income=total_labour_fam_income; 
	end; 
    else do; 
		sum_bottom_10_income+total_hh_income;
		sum_bottom_10_labour_income+total_labour_income;
		sum_bottom_10_pen_income+total_labour_pen_income;
		sum_bottom_10_fam_income+total_labour_fam_income;
	end; 
    if last.ano4;
	keep sum_bottom_10_income sum_bottom_10_labour_income sum_bottom_10_pen_income sum_bottom_10_fam_income ano4; 
run; 
	

data leo.top_bottom_share_2014_t4; 
merge sum_total_income sum_top_10_income sum_bottom_10_income; 
	by ano4; 
		top_10_share=sum_top_10_income/sum_total_income; 
		bottom_10_share=sum_bottom_10_income/sum_total_income; 
		top_10_labour_share=sum_top_10_labour_income/sum_labour_income; 
		bottom_10_labour_share=sum_bottom_10_labour_income/sum_labour_income; 
		top_10_labour_pen_share=sum_top_10_pen_income/sum_labour_pen_income; 
		bottom_10_labour_pen_share=sum_bottom_10_pen_income/sum_labour_pen_income; 
		top_10_labour_fam_share=sum_top_10_fam_income/sum_labour_fam_income; 
		bottom_10_labour_fam_share=sum_bottom_10_fam_income/sum_labour_fam_income; 
		keep top_10_share bottom_10_share top_10_labour_share bottom_10_labour_share top_10_labour_fam_share bottom_10_labour_fam_share
			top_10_labour_pen_share bottom_10_labour_pen_share; 
run; 

/*******************The statistics when we take INSEE's consumption units (CU)************************************************/
data deciles_cu_1; 
set deciles_cu_1; 
	ano4=2014; 
run;
data deciles_cu_2; 
set deciles_cu_2; 
	ano4=2014; 
run;
data deciles_cu_3; 
set deciles_cu_3; 
	ano4=2014; 
run;
data deciles_cu_4; 
set deciles_cu_4; 
	ano4=2014; 
run; 
data leo.decile_ratios_cu_2014_t4; 
merge deciles_cu_1-deciles_cu_4; 
	by ano4; 
		decile_ratio_all=decile_all_90/decile_all_10; 
			decile_ratio_labour=decile_labour_90/decile_labour_10; 
			decile_ratio_labour_pen=decile_labour_pen_90/decile_labour_pen_10; 
			decile_ratio_labour_fam=decile_labour_fam_90/decile_labour_fam_10; 
		d9_d5_all=decile_all_90/decile_all_50; 
			d9_d5_labour=decile_labour_90/decile_labour_50; 
			d9_d5_labour_pen=decile_labour_pen_90/decile_labour_pen_50; 
			d9_d5_labour_fam=decile_labour_fam_90/decile_labour_fam_50; 
		d5_d1_all=decile_all_50/decile_all_10; 
			d5_d1_labour=decile_labour_50/decile_labour_10; 
			d5_d1_labour_pen=decile_labour_pen_50/decile_labour_pen_10; 
			d5_d1_labour_fam=decile_labour_fam_50/decile_labour_fam_10; 

	keep decile_ratio_all decile_ratio_labour decile_ratio_labour_pen decile_ratio_labour_fam
		d9_d5_all d9_d5_labour d9_d5_labour_pen d9_d5_labour_fam
		d5_d1_all d5_d1_labour d5_d1_labour_pen d5_d1_labour_fam;  
run; 
data income_redistribution; 
merge household_income deciles_cu_1; 
	by ano4; 
	bottom_10=0; 
	top_10=0; 
	if cu_income<=decile_all_10 & cu_income^=0
		then bottom_10=1; 
	if cu_income>=decile_all_90
		then top_10=1; 
	total_hh_income=cu_income*household_members*pondera; 
	total_labour_income=cu_labour_income*household_members*pondera; 
	total_labour_pen_income=(cu_labour_income+cu_labour_pen_income)*household_members*pondera; 
	total_labour_fam_income=(cu_labour_income+cu_labour_fam_income)*household_members*pondera; 
run; 
proc sort data=income_redistribution; 
by ano4;
run;  
data sum_total_income;
    set income_redistribution;
    by ano4;
    if first.ano4 then do; 
		sum_total_income=total_hh_income;
		sum_labour_income=total_labour_income; 
		sum_labour_pen_income=total_labour_pen_income; 
		sum_labour_fam_income=total_labour_fam_income; 
	end; 
    else do; 
		sum_total_income+total_hh_income;
		sum_labour_income+total_labour_income;
		sum_labour_pen_income+total_labour_pen_income;
		sum_labour_fam_income+total_labour_fam_income;
	end; 
    if last.ano4;
	keep sum_total_income sum_labour_income sum_labour_pen_income sum_labour_fam_income ano4; 
run;

data sum_top_10_income; 
set income_redistribution; 
	where top_10=1; 
	by ano4;
    if first.ano4 then do; 
		sum_top_10_income=total_hh_income;
		sum_top_10_labour_income=total_labour_income; 
		sum_top_10_pen_income=total_labour_pen_income; 
		sum_top_10_fam_income=total_labour_fam_income; 
	end; 
    else do; 
		sum_top_10_income+total_hh_income;
		sum_top_10_labour_income+total_labour_income;
		sum_top_10_pen_income+total_labour_pen_income;
		sum_top_10_fam_income+total_labour_fam_income;
	end; 
    if last.ano4;
	keep sum_top_10_income sum_top_10_labour_income sum_top_10_pen_income sum_top_10_fam_income ano4; 
run;
	
data sum_bottom_10_income; 
set income_redistribution; 
	where bottom_10=1; 
	by ano4;
    if first.ano4 then do; 
		sum_bottom_10_income=total_hh_income;
		sum_bottom_10_labour_income=total_labour_income; 
		sum_bottom_10_pen_income=total_labour_pen_income; 
		sum_bottom_10_fam_income=total_labour_fam_income; 
	end; 
    else do; 
		sum_bottom_10_income+total_hh_income;
		sum_bottom_10_labour_income+total_labour_income;
		sum_bottom_10_pen_income+total_labour_pen_income;
		sum_bottom_10_fam_income+total_labour_fam_income;
	end; 
    if last.ano4;
	keep sum_bottom_10_income sum_bottom_10_labour_income sum_bottom_10_pen_income sum_bottom_10_fam_income ano4; 
run; 
	

data leo.top_bottom_share_cu_2014_t4; 
merge sum_total_income sum_top_10_income sum_bottom_10_income; 
	by ano4; 
		top_10_share=sum_top_10_income/sum_total_income; 
		bottom_10_share=sum_bottom_10_income/sum_total_income; 
		top_10_labour_share=sum_top_10_labour_income/sum_labour_income; 
		bottom_10_labour_share=sum_bottom_10_labour_income/sum_labour_income; 
		top_10_labour_pen_share=sum_top_10_pen_income/sum_labour_pen_income; 
		bottom_10_labour_pen_share=sum_bottom_10_pen_income/sum_labour_pen_income; 
		top_10_labour_fam_share=sum_top_10_fam_income/sum_labour_fam_income; 
		bottom_10_labour_fam_share=sum_bottom_10_fam_income/sum_labour_fam_income; 
		keep top_10_share bottom_10_share top_10_labour_share bottom_10_labour_share top_10_labour_fam_share bottom_10_labour_fam_share
			top_10_labour_pen_share bottom_10_labour_pen_share; 
run; 


/*******************The statistics when we take SEDLAC's equivalised household income************************************************/
data deciles_sedlac_1; 
set deciles_sedlac_1; 
	ano4=2014; 
run;
data deciles_sedlac_2; 
set deciles_sedlac_2; 
	ano4=2014; 
run;
data deciles_sedlac_3; 
set deciles_sedlac_3; 
	ano4=2014; 
run;
data deciles_sedlac_4; 
set deciles_sedlac_4; 
	ano4=2014; 
run; 
data leo.decile_ratios_sedlac_2014_t4; 
merge deciles_sedlac_1-deciles_sedlac_4; 
	by ano4; 
		decile_ratio_all=decile_all_90/decile_all_10; 
			decile_ratio_labour=decile_labour_90/decile_labour_10; 
			decile_ratio_labour_pen=decile_labour_pen_90/decile_labour_pen_10; 
			decile_ratio_labour_fam=decile_labour_fam_90/decile_labour_fam_10; 
		d9_d5_all=decile_all_90/decile_all_50; 
			d9_d5_labour=decile_labour_90/decile_labour_50; 
			d9_d5_labour_pen=decile_labour_pen_90/decile_labour_pen_50; 
			d9_d5_labour_fam=decile_labour_fam_90/decile_labour_fam_50; 
		d5_d1_all=decile_all_50/decile_all_10; 
			d5_d1_labour=decile_labour_50/decile_labour_10; 
			d5_d1_labour_pen=decile_labour_pen_50/decile_labour_pen_10; 
			d5_d1_labour_fam=decile_labour_fam_50/decile_labour_fam_10; 

	keep decile_ratio_all decile_ratio_labour decile_ratio_labour_pen decile_ratio_labour_fam
		d9_d5_all d9_d5_labour d9_d5_labour_pen d9_d5_labour_fam
		d5_d1_all d5_d1_labour d5_d1_labour_pen d5_d1_labour_fam; 
run; 
data income_redistribution; 
merge household_income deciles_sedlac_1; 
	by ano4; 
	bottom_10=0; 
	top_10=0; 
	if sedlac_income<=decile_all_10 & sedlac_income^=0
		then bottom_10=1; 
	if sedlac_income>=decile_all_90
		then top_10=1; 
	total_hh_income=sedlac_income*household_members*pondera; 
	total_labour_income=sedlac_labour_income*household_members*pondera; 
	total_labour_pen_income=(sedlac_labour_income+sedlac_labour_pen_income)*household_members*pondera; 
	total_labour_fam_income=(sedlac_labour_income+sedlac_labour_fam_income)*household_members*pondera; 
run; 
proc sort data=income_redistribution; 
by ano4;
run;  
data sum_total_income;
    set income_redistribution;
    by ano4;
    if first.ano4 then do; 
		sum_total_income=total_hh_income;
		sum_labour_income=total_labour_income; 
		sum_labour_pen_income=total_labour_pen_income; 
		sum_labour_fam_income=total_labour_fam_income; 
	end; 
    else do; 
		sum_total_income+total_hh_income;
		sum_labour_income+total_labour_income;
		sum_labour_pen_income+total_labour_pen_income;
		sum_labour_fam_income+total_labour_fam_income;
	end; 
    if last.ano4;
	keep sum_total_income sum_labour_income sum_labour_pen_income sum_labour_fam_income ano4; 
run;

data sum_top_10_income; 
set income_redistribution; 
	where top_10=1; 
	by ano4;
    if first.ano4 then do; 
		sum_top_10_income=total_hh_income;
		sum_top_10_labour_income=total_labour_income; 
		sum_top_10_pen_income=total_labour_pen_income; 
		sum_top_10_fam_income=total_labour_fam_income; 
	end; 
    else do; 
		sum_top_10_income+total_hh_income;
		sum_top_10_labour_income+total_labour_income;
		sum_top_10_pen_income+total_labour_pen_income;
		sum_top_10_fam_income+total_labour_fam_income;
	end; 
    if last.ano4;
	keep sum_top_10_income sum_top_10_labour_income sum_top_10_pen_income sum_top_10_fam_income ano4; 
run;
	
data sum_bottom_10_income; 
set income_redistribution; 
	where bottom_10=1; 
	by ano4;
    if first.ano4 then do; 
		sum_bottom_10_income=total_hh_income;
		sum_bottom_10_labour_income=total_labour_income; 
		sum_bottom_10_pen_income=total_labour_pen_income; 
		sum_bottom_10_fam_income=total_labour_fam_income; 
	end; 
    else do; 
		sum_bottom_10_income+total_hh_income;
		sum_bottom_10_labour_income+total_labour_income;
		sum_bottom_10_pen_income+total_labour_pen_income;
		sum_bottom_10_fam_income+total_labour_fam_income;
	end; 
    if last.ano4;
	keep sum_bottom_10_income sum_bottom_10_labour_income sum_bottom_10_pen_income sum_bottom_10_fam_income ano4; 
run; 
	

data leo.top_bottom_share_sedlac_2014_t4; 
merge sum_total_income sum_top_10_income sum_bottom_10_income; 
	by ano4; 
		top_10_share=sum_top_10_income/sum_total_income; 
		bottom_10_share=sum_bottom_10_income/sum_total_income; 
		top_10_labour_share=sum_top_10_labour_income/sum_labour_income; 
		bottom_10_labour_share=sum_bottom_10_labour_income/sum_labour_income; 
		top_10_labour_pen_share=sum_top_10_pen_income/sum_labour_pen_income; 
		bottom_10_labour_pen_share=sum_bottom_10_pen_income/sum_labour_pen_income; 
		top_10_labour_fam_share=sum_top_10_fam_income/sum_labour_fam_income; 
		bottom_10_labour_fam_share=sum_bottom_10_fam_income/sum_labour_fam_income; 
		keep top_10_share bottom_10_share top_10_labour_share bottom_10_labour_share top_10_labour_fam_share bottom_10_labour_fam_share
			top_10_labour_pen_share bottom_10_labour_pen_share; 
run; 
/*Finally, here we compute the gini index with various household income definitions.*/
/****************************First with per capita income********************************/
%gini(hh_all_income,gini_all_income,per_cap_income,pondera); 
%gini(hh_labour_income,gini_labour_income,per_cap_labour_income,pondera); 
%gini(hh_labour_pen_income,gini_labour_pen_income,per_cap_labour_pen_income,pondera); 
%gini(hh_labour_fam_income,gini_labour_fam_income,per_cap_labour_fam_income,pondera); 


data leo.gini_2014_t4; 
set gini_all_income gini_labour_income gini_labour_pen_income gini_labour_fam_income; 
ruN; 
proc print data=leo.gini_2014_t4 (obs=100); run; 
/****************************Then with OCDE and INSEE Consumption Units********************************/

%gini(hh_all_income,gini_all_income,cu_income,pondera); 
%gini(hh_labour_income,gini_labour_income,cu_labour_income,pondera); 
%gini(hh_labour_pen_income,gini_labour_pen_income,cu_labour_pen_income,pondera); 
%gini(hh_labour_fam_income,gini_labour_fam_income,cu_labour_fam_income,pondera); 


data leo.gini_cu_2014_t4; 
set gini_all_income gini_labour_income gini_labour_pen_income gini_labour_fam_income; 
ruN; 

/****************************Finally with the benchmark equivalised household income used by SEDLAC and the World Bank********************************/

%gini(hh_all_income,gini_all_income,sedlac_income,pondera); 
%gini(hh_labour_income,gini_labour_income,sedlac_labour_income,pondera); 
%gini(hh_labour_pen_income,gini_labour_pen_income,sedlac_labour_pen_income,pondera); 
%gini(hh_labour_fam_income,gini_labour_fam_income,sedlac_labour_fam_income,pondera); 


data leo.gini_sedlac_2014_t4; 
set gini_all_income gini_labour_income gini_labour_pen_income gini_labour_fam_income; 
ruN; 
dm 'odsresults; clear'; 
/********************We compute individual gini for people of retiring age, including those with no declared income. This is to 
		measure the impact later of taking out moratorium pensions or replacing them with the universal pension among the elderly 
		income inequality*****************/
data retirement_age_people; 
set leo.liam_brux_nv_2014_t4; 
	where ch06>=65 | (ch06>=60 & male="FALSE"); 
		total_income=itl_actu+v2_m_actu+v5_m_actu;
		labour_pen_income=itl_actu+v2_m_actu; 
run; 
%gini(retirement_age_people,gini_ret_age_all,total_income,pondera); 
%gini(retirement_age_people,gini_ret_age_v2_m,v2_m_actu,pondera); 
%gini(retirement_age_people,gini_ret_age_labour_pen,labour_pen_income,pondera); 
data _65_plus_people; 
set leo.liam_brux_nv_2014_t4; 
	where ch06>=65; 
		total_income=itl_actu+v2_m_actu+v5_m_actu;
		labour_pen_income=itl_actu+v2_m_actu; 
run; 

%gini(_65_plus_people,gini_65_all,total_income,pondera); 
%gini(_65_plus_people,gini_65_v2_m,v2_m_actu,pondera); 
%gini(_65_plus_people,gini_65_labour_pen,labour_pen_income,pondera); 

dm 'odsresults; clear'; 
dm 'clear log'; 
data retirement_age_people_hi; 
set leo.liam_brux_nv_2014_t4; 
	where ch06>=65 | (ch06>=60 & male="FALSE") & ((itl_actu+v2_m_actu+v5_m_actu)>0); 
		total_income=itl_actu+v2_m_actu+v5_m_actu;
		labour_pen_income=itl_actu+v2_m_actu; 
run; 
%gini(retirement_age_people_hi,gini_hi_ret_age_all,total_income,pondera); 
%gini(retirement_age_people_hi,gini_hi_ret_age_v2_m,v2_m_actu,pondera); 
%gini(retirement_age_people_hi,gini_hi_ret_age_labour_pen,labour_pen_income,pondera); 
data _65_plus_people_hi_hi; 
set leo.liam_brux_nv_2014_t4; 
	where ch06>=65 & ((itl_actu+v2_m_actu+v5_m_actu)>0); 
		total_income=itl_actu+v2_m_actu+v5_m_actu;
		labour_pen_income=itl_actu+v2_m_actu; 
run; 

%gini(_65_plus_people_hi,gini_hi_65_all,total_income,pondera); 
%gini(_65_plus_people_hi,gini_hi_65_v2_m,v2_m_actu,pondera); 
%gini(_65_plus_people_hi,gini_hi_65_labour_pen,labour_pen_income,pondera); 
data leo.gini_old_2014_t4; 
set gini_ret_age_all gini_ret_age_v2_m gini_ret_age_labour_pen
	gini_65_all gini_65_v2_m gini_65_labour_pen
gini_hi_ret_age_all gini_hi_ret_age_v2_m gini_hi_ret_age_labour_pen
	gini_hi_65_all gini_hi_65_v2_m gini_hi_65_labour_pen; 
run; 
proc print data=leo.gini_old_2014_t4; run; 

/*The last step is exporting all these inequalities measures, which we will later process together with the statistics we will compute in 
		our microsimulation model.*/
dm 'clear log'; 
proc export data=leo.gini_2014_t4 
	outfile="C:\Users\Leonardo\Dropbox\Thèse_nouvelle_version\LIAM2\Résultats agrégés prospectifs\Projections finales départ 2014_t4\Législation 2018\Adéquation-redistribution\gini_2014_t4.csv"
	dbms=csv replace; 
run; 
proc export data=leo.decile_ratios_2014_t4 
	outfile="C:\Users\Leonardo\Dropbox\Thèse_nouvelle_version\LIAM2\Résultats agrégés prospectifs\Projections finales départ 2014_t4\Législation 2018\Adéquation-redistribution\decile_ratios_2014_t4.csv"
	dbms=csv replace; 
run; 

proc export data=leo.top_bottom_share_2014_t4 
	outfile="C:\Users\Leonardo\Dropbox\Thèse_nouvelle_version\LIAM2\Résultats agrégés prospectifs\Projections finales départ 2014_t4\Législation 2018\Adéquation-redistribution\top_bottom_share_2014_t4.csv"
	dbms=csv replace; 
run; 



proc export data=leo.gini_cu_2014_t4 
	outfile="C:\Users\Leonardo\Dropbox\Thèse_nouvelle_version\LIAM2\Résultats agrégés prospectifs\Projections finales départ 2014_t4\Législation 2018\Adéquation-redistribution\gini_cu_2014_t4.csv"
	dbms=csv replace; 
run; 

proc export data=leo.decile_ratios_cu_2014_t4 
	outfile="C:\Users\Leonardo\Dropbox\Thèse_nouvelle_version\LIAM2\Résultats agrégés prospectifs\Projections finales départ 2014_t4\Législation 2018\Adéquation-redistribution\decile_ratios_cu_2014_t4.csv"
	dbms=csv replace; 
run; 

proc export data=leo.top_bottom_share_cu_2014_t4 
	outfile="C:\Users\Leonardo\Dropbox\Thèse_nouvelle_version\LIAM2\Résultats agrégés prospectifs\Projections finales départ 2014_t4\Législation 2018\Adéquation-redistribution\top_bottom_share_cu_2014_t4.csv"
	dbms=csv replace; 
run; 

proc export data=leo.gini_sedlac_2014_t4 
	outfile="C:\Users\Leonardo\Dropbox\Thèse_nouvelle_version\LIAM2\Résultats agrégés prospectifs\Projections finales départ 2014_t4\Législation 2018\Adéquation-redistribution\gini_sedlac_2014_t4.csv"
	dbms=csv replace; 
run; 

proc export data=leo.decile_ratios_sedlac_2014_t4 
	outfile="C:\Users\Leonardo\Dropbox\Thèse_nouvelle_version\LIAM2\Résultats agrégés prospectifs\Projections finales départ 2014_t4\Législation 2018\Adéquation-redistribution\decile_ratios_sedlac_2014_t4.csv"
	dbms=csv replace; 
run; 

proc export data=leo.top_bottom_share_sedlac_2014_t4 
	outfile="C:\Users\Leonardo\Dropbox\Thèse_nouvelle_version\LIAM2\Résultats agrégés prospectifs\Projections finales départ 2014_t4\Législation 2018\Adéquation-redistribution\top_bottom_share_sedlac_2014_t4.csv"
	dbms=csv replace; 
run; 



proc export data=leo.gini_old_2014_t4 
	outfile="C:\Users\Leonardo\Dropbox\Thèse_nouvelle_version\LIAM2\Résultats agrégés prospectifs\Projections finales départ 2014_t4\Législation 2018\Adéquation-redistribution\gini_old_2014_t4.csv"
	dbms=csv replace; 
run; 

 /*************************************************************************************************************/

/*Here, we export some adequacy mesaures for pensions in the starting dataset.*/
proc means data=leo.liam_brux_nv_2014_t4; 
	weight pondera; 
	where v2_m_actu^=0; 
		var v2_m_actu; 
		output out=pension_2014_t4 mean=mean_pension median=median_pension;
run;
data pension_2014_t4; 
set pension_2014_t4; 
	period=48; 
run; 
proc means data=leo.liam_brux_nv_2014_t4; 
	weight pondera; 
	where itl^=0 & etat2^=4 & etat2^=5; 
		var itl; 
		output out=labour_income_2014_t4 mean=mean_labour_income median=median_labour_income;
run;

data labour_income_2014_t4; 
set labour_income_2014_t4; 
	period=48; 
run; 
data leo.pension_2014_t4; 
merge pension_2014_t4 labour_income_2014_t4;
	by period;  
		median_pension_labour=median_pension/median_labour_income; 
		mean_pension_labour=mean_pension/mean_labour_income; 
	keep period mean_pension median_pension mean_labour_income median_labour_Income median_pension_labour mean_pension_labour; 
ruN;  
proc print data=leo.pension_2014_t4; run; 
proc export data=leo.pension_2014_t4 
	outfile="C:\Users\Leonardo\Dropbox\Thèse_nouvelle_version\LIAM2\Résultats agrégés prospectifs\Projections finales départ 2014_t4\Législation 2018\Adéquation-redistribution\pension_2014_t4.csv"
	dbms=csv replace; 
run; 
data coverage; 
set leo.liam_brux_Nv_2014_t4; 
	coverage_legal=0; 
	coverage_65=0;
		if (ch06>=65 | (ch06>=60 & male="FALSE")) & v2_m_actu>0 then coverage_legal=1; 
		if ch06>=65 & v2_m_actu>0 then coverage_65=1; 
run; 
proc freq data=coverage; 
	weight pondera; 
	where ch06>=65 | (ch06>=60 & male="FALSE");
		table coverage_legal /out=leo.coverage_legal_2014_t4; 
run; 
proc freq data=coverage; 
	weight pondera; 
	where ch06>=65;
		table coverage_65 /out=leo.coverage_65_2014_t4;
run; 
data fam_ben_income; 
set household_income; 
	keep hh_family_benefits hogar; 
run; 
proc sort data=fam_ben_income; 
	by hogar; 
run; 
proc sort data=leo.liam_brux_Nv_2014_t4; 
	by hogar; 
run; 	
data coverage_fam_ben; 
merge leo.liam_brux_nv_2014_t4 household_income; 
	by hogar; 
		child_coverage=0; 
			if ch06<18 & hh_family_benefits>0 
			then child_coverage=1; 
run; 
proc freq data=coverage_fam_ben; 
	weight pondera; 
	where ch06<18; 
		table child_coverage /out=leo.child_coverage_2014_t4; 
run; 


proc export data=leo.coverage_legal_2014_t4 
	outfile="C:\Users\Leonardo\Dropbox\Thèse_nouvelle_version\LIAM2\Résultats agrégés prospectifs\Projections finales départ 2014_t4\Législation 2018\Adéquation-redistribution\coverage_legal_2014_t4.csv"
	dbms=csv replace; 
run; 

proc export data=leo.coverage_65_2014_t4 
	outfile="C:\Users\Leonardo\Dropbox\Thèse_nouvelle_version\LIAM2\Résultats agrégés prospectifs\Projections finales départ 2014_t4\Législation 2018\Adéquation-redistribution\coverage_65_2014_t4.csv"
	dbms=csv replace; 
run; 

proc export data=leo.child_coverage_2014_t4 
	outfile="C:\Users\Leonardo\Dropbox\Thèse_nouvelle_version\LIAM2\Résultats agrégés prospectifs\Projections finales départ 2014_t4\Législation 2018\Adéquation-redistribution\child_coverage_2014_t4.csv"
	dbms=csv replace; 
run; 

/***********Quick addition: show the non-response to the income variable among workers skyrockets with the new iteration of the EPHc 
		since 2016. It increases from 2.7% between 2003 and 2015 to 25% in 2016-2017. */

options nofmterr; 
data labour_income; 
set leo.eph_data_2calib_2003_2015; 
	where estado=1 & (cat_ocup=1| cat_ocup=2 |cat_ocup=3); 
		keep itl pondera estado cat_ocup; 
run; 
data labour_income; 
set labour_income; 
	income_response=0; 
	if itl>0 then income_response=1; 
run; 
proc freq data=labour_income; 
	weight pondera; 
	table income_response*cat_ocup; 
run; 


proc contents data=leo.eph_data_2calib_2016_2017; run; 
options nofmterr; 
data labour_income_2; 
set leo.eph_data_2calib_2016_2017; 
	where estado=1 & (cat_ocup=1| cat_ocup=2 |cat_ocup=3); 
		keep itl pondera estado cat_ocup t; 
run; 
data labour_income_2; 
set labour_income_2; 
	income_response=0; 
	if itl>0 then income_response=1; 
run; 
proc freq data=labour_income_2; 
	weight pondera; 
	table income_response*t; 
run; 

	
/*******************We monitor the evolution of households with no income in our simulations*/
dm 'odsresults; clear'; 
dm 'clear log'; 
%macro household_no_income(indata,period);

data household_income; 
set &indata.; 
	total_income=itl_actu+v2_m_actu+v5_m_actu; 
run; 

proc sort data=household_income; 
	by hogar;
run; 	
data household_income; 
set household_income; 
	by hogar; 
	if first.hogar then 
		do; 
			hh_income=total_income; 
			hh_labour_income=itl_actu; 
			hh_pension=v2_m_actu; 
			hh_family_benefits=v5_m_actu; 
			household_members=1; 
		end; 
	else 
		do; 
			hh_income+total_income; 
			hh_labour_income+itl_actu; 
			hh_pension+v2_m_actu; 
			hh_family_benefits+v5_m_actu;
			household_members+1; 
			end; 
	if last.hogar; 
run; 


data hh_with_no_income; 
set household_income;
	if hh_income>0 then has_income=1; 
	if hh_income=0 then has_income=0; 
run; 
proc freq data=hh_with_no_income noprint; 
	weight pondera; 
		table has_income /out=leo.hh_no_income_&period.;
run; 
data leo.hh_no_income_&period.; 
set leo.hh_no_income_&period.; 
	if has_income=1 then delete; 
	no_income=percent/100;
	period=&period.;  
	drop has_income count percent; 
run; 
%mend; 



options nofmterr; 
data household_income; 
set leo.eph_data_2calib_2014;
	where ano4=2014 & trimestre=4;  
	total_income=p21+tot_p12+v2_m+v5_m; 
run; 

proc sort data=household_income; 
	by hogar;
run; 	
data household_income; 
set household_income; 
	by hogar; 
	if first.hogar then 
		do; 
			hh_income=total_income; 
			hh_labour_income=itl_actu; 
			hh_pension=v2_m_actu; 
			hh_family_benefits=v5_m_actu; 
			household_members=1; 
		end; 
	else 
		do; 
			hh_income+total_income; 
			hh_labour_income+itl_actu; 
			hh_pension+v2_m_actu; 
			hh_family_benefits+v5_m_actu;
			household_members+1; 
			end; 
	if last.hogar; 
run; 


data hh_with_no_income; 
set household_income;
	if hh_income>0 then has_income=1; 
	if hh_income=0 then has_income=0; 
run; 
proc freq data=hh_with_no_income noprint; 
	weight pondera; 
		table has_income /out=leo.hh_no_income_48_bis;
run; 
data leo.hh_no_income_48_bis; 
set leo.hh_no_income_48_bis; 
	if has_income=1 then delete; 
	no_income=percent/100;
	period=48;  
	drop has_income count percent; 
run; 
proc print data=leo.hh_no_income_48_bis; run; 
/*The result is the same with the base dataset than with the starting dataset of our microsimulation.*/ 

%household_no_income(leo.liam_brux_nv_2014_t4,48); 
%household_no_income(leo.prosp_central_imp_49,49); 
%household_no_income(leo.prosp_central_imp_50,50);
%household_no_income(leo.prosp_central_imp_51,51);
%household_no_income(leo.prosp_central_imp_52,52);
%household_no_income(leo.prosp_central_imp_53,53);
%household_no_income(leo.prosp_central_imp_54,54);
%household_no_income(leo.prosp_central_imp_55,55);
%household_no_income(leo.prosp_central_imp_56,56);
%household_no_income(leo.prosp_central_imp_57,57);
%household_no_income(leo.prosp_central_imp_58,58);
%household_no_income(leo.prosp_central_imp_59,59);
%household_no_income(leo.prosp_central_imp_60,60);
%household_no_income(leo.prosp_central_imp_61,61);
%household_no_income(leo.prosp_central_imp_62,62);
%household_no_income(leo.prosp_central_imp_63,63);
%household_no_income(leo.prosp_central_imp_64,64);
%household_no_income(leo.prosp_central_imp_65,65);
%household_no_income(leo.prosp_central_imp_66,66);
%household_no_income(leo.prosp_central_imp_67,67);
%household_no_income(leo.prosp_central_imp_68,68);
%household_no_income(leo.prosp_central_imp_69,69);
%household_no_income(leo.prosp_central_imp_70,70);
%household_no_income(leo.prosp_central_imp_71,71);
%household_no_income(leo.prosp_central_imp_72,72);
%household_no_income(leo.prosp_central_imp_73,73);
%household_no_income(leo.prosp_central_imp_74,74);
%household_no_income(leo.prosp_central_imp_75,75);
%household_no_income(leo.prosp_central_imp_76,76);
%household_no_income(leo.prosp_central_imp_77,77);
%household_no_income(leo.prosp_central_imp_78,78);
%household_no_income(leo.prosp_central_imp_79,79);
%household_no_income(leo.prosp_central_imp_80,80);
%household_no_income(leo.prosp_central_imp_81,81);
%household_no_income(leo.prosp_central_imp_82,82);
%household_no_income(leo.prosp_central_imp_83,83);
%household_no_income(leo.prosp_central_imp_84,84);
%household_no_income(leo.prosp_central_imp_85,85);
%household_no_income(leo.prosp_central_imp_86,86);
%household_no_income(leo.prosp_central_imp_87,87);
%household_no_income(leo.prosp_central_imp_88,88);
%household_no_income(leo.prosp_central_imp_89,89);
%household_no_income(leo.prosp_central_imp_90,90);
%household_no_income(leo.prosp_central_imp_91,91);
%household_no_income(leo.prosp_central_imp_92,92);
%household_no_income(leo.prosp_central_imp_93,93);
%household_no_income(leo.prosp_central_imp_94,94);
%household_no_income(leo.prosp_central_imp_95,95);
%household_no_income(leo.prosp_central_imp_96,96);
%household_no_income(leo.prosp_central_imp_97,97);
%household_no_income(leo.prosp_central_imp_98,98);
%household_no_income(leo.prosp_central_imp_99,99);
%household_no_income(leo.prosp_central_imp_100,100);
%household_no_income(leo.prosp_central_imp_101,101);
%household_no_income(leo.prosp_central_imp_102,102);
%household_no_income(leo.prosp_central_imp_103,103);
%household_no_income(leo.prosp_central_imp_104,104);
%household_no_income(leo.prosp_central_imp_105,105);
%household_no_income(leo.prosp_central_imp_106,106);
%household_no_income(leo.prosp_central_imp_107,107);
%household_no_income(leo.prosp_central_imp_108,108);
%household_no_income(leo.prosp_central_imp_109,109);
%household_no_income(leo.prosp_central_imp_110,110);
%household_no_income(leo.prosp_central_imp_111,111);
%household_no_income(leo.prosp_central_imp_112,112);
%household_no_income(leo.prosp_central_imp_113,113);
%household_no_income(leo.prosp_central_imp_114,114);
%household_no_income(leo.prosp_central_imp_115,115);
%household_no_income(leo.prosp_central_imp_116,116);
%household_no_income(leo.prosp_central_imp_117,117);
%household_no_income(leo.prosp_central_imp_118,118);
%household_no_income(leo.prosp_central_imp_119,119);
%household_no_income(leo.prosp_central_imp_120,120);
%household_no_income(leo.prosp_central_imp_121,121);
%household_no_income(leo.prosp_central_imp_122,122);
%household_no_income(leo.prosp_central_imp_123,123);
%household_no_income(leo.prosp_central_imp_124,124);
%household_no_income(leo.prosp_central_imp_125,125);
%household_no_income(leo.prosp_central_imp_126,126);
%household_no_income(leo.prosp_central_imp_127,127);
%household_no_income(leo.prosp_central_imp_128,128);
%household_no_income(leo.prosp_central_imp_129,129);
%household_no_income(leo.prosp_central_imp_130,130);
%household_no_income(leo.prosp_central_imp_131,131);
%household_no_income(leo.prosp_central_imp_132,132);
%household_no_income(leo.prosp_central_imp_133,133);
%household_no_income(leo.prosp_central_imp_134,134);
%household_no_income(leo.prosp_central_imp_135,135);
%household_no_income(leo.prosp_central_imp_136,136);
%household_no_income(leo.prosp_central_imp_137,137);
%household_no_income(leo.prosp_central_imp_138,138);
%household_no_income(leo.prosp_central_imp_139,139);
%household_no_income(leo.prosp_central_imp_140,140);
%household_no_income(leo.prosp_central_imp_141,141);
%household_no_income(leo.prosp_central_imp_142,142);
%household_no_income(leo.prosp_central_imp_143,143);
%household_no_income(leo.prosp_central_imp_144,144);
%household_no_income(leo.prosp_central_imp_145,145);
%household_no_income(leo.prosp_central_imp_146,146);
%household_no_income(leo.prosp_central_imp_147,147);
%household_no_income(leo.prosp_central_imp_148,148);
%household_no_income(leo.prosp_central_imp_149,149);
%household_no_income(leo.prosp_central_imp_150,150);
%household_no_income(leo.prosp_central_imp_151,151);
%household_no_income(leo.prosp_central_imp_152,152);

data leo.hh_no_income; 
set leo.hh_no_income_48-leo.hh_no_income_152; 
run;
/*****OK this shows the problem with household composition starts on the first period of the simulation, as they immediately jump to 
		15% of the total. From there this share stagnates. **/
	/***Let us make a plot out of this result, to show one of the weaknesses of the model.****/




proc format; value period_prosp				
48="2014_4"
49="2015_1"
50="2015_2"
51="2015_3"
52="2015_4"
53="2016_1"
54="2016_2"
55="2016_3"
56="2016_4"
57="2017_1"
58="2017_2"
59="2017_3"
60="2017_4"
61="2018_1"
62="2018_2"
63="2018_3"
64="2018_4"
65="2019_1"
66="2019_2"
67="2019_3"
68="2019_4"
69="2020_1"
70="2020_2"
71="2020_3"
72="2020_4"
73="2021_1"
74="2021_2"
75="2021_3"
76="2021_4"
77="2022_1"
78="2022_2"
79="2022_3"
80="2022_4"
81="2023_1"
82="2023_2"
83="2023_3"
84="2023_4"
85="2024_1"
86="2024_2"
87="2024_3"
88="2024_4"
89="2025_1"
90="2025_2"
91="2025_3"
92="2025_4"
93="2026_1"
94="2026_2"
95="2026_3"
96="2026_4"
97="2027_1"
98="2027_2"
99="2027_3"
100="2027_4"
101="2028_1"
102="2028_2"
103="2028_3"
104="2028_4"
105="2029_1"
106="2029_2"
107="2029_3"
108="2029_4"
109="2030_1"
110="2030_2"
111="2030_3"
112="2030_4"
113="2031_1"
114="2031_2"
115="2031_3"
116="2031_4"
117="2032_1"
118="2032_2"
119="2032_3"
120="2032_4"
121="2033_1"
122="2033_2"
123="2033_3"
124="2033_4"
125="2034_1"
126="2034_2"
127="2034_3"
128="2034_4"
129="2035_1"
130="2035_2"
131="2035_3"
132="2035_4"
133="2036_1"
134="2036_2"
135="2036_3"
136="2036_4"
137="2037_1"
138="2037_2"
139="2037_3"
140="2037_4"
141="2038_1"
142="2038_2"
143="2038_3"
144="2038_4"
145="2039_1"
146="2039_2"
147="2039_3"
148="2039_4"
149="2040_1"
150="2040_2"
151="2040_3"
152="2040_4"
; run; 

dm 'odsresults; clear'; 
/* ods pdf file="H:\Leonardo_orléans\Sorties_SAS\back_prosp_compare_civ_2014_T4.pdf"; */
options nodate nonumber; 
ods listing sge=on; 

legend1 label=("")Value=(h=1.5 'Households with no income' );
proc gplot data= leo.hh_no_income;
title /*"Prospective labour-market targets, both genders 2014-2040"*/;

axis1 value=(height=1.5 angle=90) label=(h=1.5 /*"Period"*/ "") order=(48 to 152 by 8);
axis2  value=(height=1.5)/*label=(height=1.5 angle=90 "Percentage" )*/ label=("")  ; 

 plot(no_income)*period/ haxis=axis1 vaxis=axis2 legend=legend1  href=49  lhref=1 ;
 format period period_prosp.;
 format no_income percent8.; 
symbol1 interpol=join line=1 width=2 value=none color=red  height=1;
run;
quit; 
ods listing close; 
/*ods pdf close; */
