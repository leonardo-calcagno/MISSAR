/*Here we show the residuals of our Mincer wage equations follow a normal law. We also compute the law's mean and standard error. 
		Based on this, we generate individual error terms in our prospective and retrospective simulations for individuals that did not
		earn a labour income at the time of the survey. */
ods pdf file="H:\LIAM2_commented_code_AGN\Normality of wage residuals.pdf"; 
title 'Normality of forward Mincer wage equations residuals';
proc univariate data=leo.wage_residuals_forward noprint normaltest;
   histogram resid /normal(color=red)  ;
run;

title 'Normality of backward Mincer wage equations residuals';
proc univariate data=leo.wage_residuals_back noprint normaltest;
   histogram resid /normal(color=red)  ;
run; 
/*For the sake of continuity with our starting dataset, we compute the standard error and mean of the residuals of the wage equations
		in our starting datasets, and also show these residuals follow a normal law. If we generate individual error terms in our 
		simulations with the mean and standard deviation computed on the 2003-2015 period, we create a discontinuity in 
		labour income inequality between our starting dataset and the simulated periods. This is why we compute the mean and standard
		deviation of the residuals of forward and backward Mincer wage equations for each starting dataset (second quarters of 2014 
		and 2015, fourth quarter of 2014). */

title 'Normality of forward Mincer wage equations residuals, fourth quarter of 2014';
proc univariate data=leo.wage_residuals_forward noprint normaltest;
where period=46;
   histogram resid /normal(color=red)  ;
run;


title 'Normality of backward Mincer wage equations residuals, fourth quarter of 2014';
proc univariate data=leo.wage_residuals_back noprint normaltest;
where period=46;
   histogram resid /normal(color=red)  ;
run;


title 'Normality of forward Mincer wage equations residuals, second quarter of 2015';
proc univariate data=leo.wage_residuals_forward noprint normaltest;
where period=48;
   histogram resid /normal(color=red)  ;
run;


title 'Normality of backward Mincer wage equations residuals, second quarter of 2015';
proc univariate data=leo.wage_residuals_back noprint normaltest;
where period=48;
   histogram resid /normal(color=red)  ;
run;


title 'Normality of forward Mincer wage equations residuals, second quarter of 2014';
proc univariate data=leo.wage_residuals_forward noprint normaltest;
where period=44;
   histogram resid /normal(color=red)  ;
run;


title 'Normality of backward Mincer wage equations residuals, second quarter of 2014';
proc univariate data=leo.wage_residuals_back noprint normaltest;
where period=44;
   histogram resid /normal(color=red)  ;
run;
ods pdf close; 
