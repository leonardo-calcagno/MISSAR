/*******************We will in the future try to simulate workers' economic sector, as it determines part of employers' contribucions and 
		is likely a strong determinant for income and labour stability. 

		However, with the covid-19 crisis, on 17 March 2020 the government announced sectors strongly impacted by the virus will not
				pay employers' contributions. These include those in link with tourism, transportation of people, entertainment and 
				spectacles and hotels and restaurants, at the very least. This measure may be further extended.

		Thus, in this file you will find how we distinguish economic sectors in the EPHc waves published since 2016, based on 
				the "Clasificación de Actividades Económicas para Encuestas Sociodemográficas del MERCOSUR CAES" used in the EPHc. 
				The code is very similar to the one present in macro %decree_814_2001 detailed in file 5. "Macro for importing past 
				careers". 
		We will not only get economic sector variables for future behavioural equations, we will also identify formal wage-earners who 
		get this employers' contributions deduction. *****************************/


proc freq data=leo.ephc_post_2016; 
	where caes="49" | caes="50" | caes="51" | caes="52" | caes="55" | caes="56" | caes="79" | caes="90" | caes="91" | caes="92" | caes="93"; 
	table clasificador; 
	table pp04b_cod; 
run; 

proc freq data=leo.ephc_post_2016; 
table pp04b_cod; 
where 10<=pp04b_cod<100; 
run; 

data leo.eph_formatted_2016_2019; 
	length sector $82.; 
	length sector_corto $82.; 
set leo.eph_formatted_2016_2019; 

/***********************Here, the code for assigning people to a given sector. This is normally OK, but it would gain from being 
		revised *********************/ 
		if pp04b_cod<10 
			then sector="Primario"; 
		if missing(pp04b_cod) 
			then sector="Ninguno"; 
	clasificador=put(pp04b_cod,4.);
		if 10<=pp04b_cod<100 
			then do; 
				caes=substr(clasificador,1,4); 
			if caes="  10" | caes="  20" | caes="  30"|caes="  50" |caes="  60" |caes="  70" |caes="  80"|caes="  90"
				then sector="Primario"; 
				if caes="  15"| caes="  26"  
						then sector="Industria Manuf."; 
					if caes="  35"
						then sector="Otras ramas"; 
					if caes="  45"| caes="  48"  
						then sector="Comercio"; 
					if caes="  56"
						then sector="Hoteles y Restaurantes"; 
					if caes="  49"
						then sector="Transporte/Almacen./Comunicaciones"; 
					if caes="  85"  
						then sector="Enseñanza"; 
					if caes="  94"  | caes="  95"
						then sector="Otros servicios comunit. Soc. y Par.";

			end; 
			
		if 1000>pp04b_cod>=100 
			then do; 
				caes=substr(clasificador,1,3); 
					if caes=" 10" | caes=" 20" | caes=" 30"|caes=" 50" |caes=" 60" |caes=" 70" |caes=" 80"|caes=" 90"
						|caes="  1" |caes="  2" | caes="  3" | caes="  5" |caes="  6" |caes="  7" |caes="  8"|caes="  9"
						then sector="Primario"; 
					if caes=" 15"| caes=" 26" 
						then sector="Industria Manuf."; 
					if caes=" 35"
						then sector="Otras ramas"; 
					if caes=" 45"| caes=" 48" 
						then sector="Comercio"; 
					if caes=" 56"
						then sector="Hoteles y Restaurantes"; 
					if caes=" 49"
						then sector="Transporte/Almacen./Comunicaciones"; 
					if caes=" 85" 
						then sector="Enseñanza"; 
					if caes=" 94" | caes=" 95"
						then sector="Otros servicios comunit. Soc. y Par.";
			end; 

		if pp04b_cod>=1000 then do; 
			caes=substr(clasificador,1,2); 
			if caes="40" 
	then sector="construcción"; 
if  caes="10" | caes="11" | caes="12" | caes="13" | caes="14" | caes="15"|caes="16" | caes="17" | caes="18" |
	caes="19"|caes="20"|caes="21"|caes="22"|caes="23" | caes="24" | caes="25"|caes="26"|caes="27"|caes="28"|
	caes="29"|caes="30"|caes="31"|caes="32"|caes="33"
	then sector="Industria Manuf."; 
if caes="45" | caes="48"
	then sector="Comercio"; 
if caes="55" | caes="56" 
	then sector="Hoteles y Restaurantes"; 
if caes="49" | caes="50" | caes="51" | caes="52" | caes="53" /*Transporte / Almacen.*/
	| caes="58" |caes="59"|caes="60"|caes="61"|caes="62"|caes="63" /*Comunicaciones*/
	then sector="Transporte/Almacen./Comunicaciones"; 
if caes="64"|caes="65"|caes="66"|caes="68" /*Servicios financieros, inmuebles*/
	|caes="69" |caes="70"|caes="71"|caes="72"|caes="73"|caes="74"|caes="75" /*Actividades profesionales, Científicas y Técnicas.*/
	|caes="77" | caes="78" |caes="79"|caes="80"|caes="81"|caes="82" /*Actividades administrativas y servicios de apoyo.*/
	then sector="Servicios fin., inm, cient. y otros de apoyo"; 
if caes="83" |caes="84" 
	then sector="Admi. pública Defensa y Seg. Soc."; 
if caes="85" 
	then sector="Enseñanza"; 
if caes="86" | caes="87" | caes="88" 
	then sector="Servicios sociales y de salud"; 
if caes="97" | caes="98" 
	then sector="Servicio doméstico"; 
if caes="90" | caes="91" | caes="92"|caes="93"|caes="94"|caes="95"|caes="96" 
	then sector="Otros servicios comunit. Soc. y Par."; 
if caes="99" | caes="35" |caes="36"|caes="37"|caes="38"|caes="39"
	then sector="Otras ramas"; 
if pp04b_cod=9999 
	then sector="No espec."; 
		end; 
		if pp04b_cod<10 
			then sector_corto="Primario y otros servicios"; 
		if missing(pp04b_cod) 
			then sector_corto="Ninguno"; 
	clasificador=put(pp04b_cod,4.);
		if 10<=pp04b_cod<100 
			then do; 
				caes=substr(clasificador,1,4); 
			if caes="  10" | caes="  20" | caes="  30"|caes="  50" |caes="  60" |caes="  70" |caes="  80"|caes="  90"
				then sector_corto="Primario y otros servicios"; 
				if caes="  15"| caes="  26"  
						then sector_corto="Industria Manuf."; 
					if caes="  35"
						then sector_corto="Primario y otros servicios"; 
					if caes="  45"| caes="  48"  
						then sector_corto="Empleados servicios"; 
					if caes="  56"
						then sector_corto="Empleados servicios"; 
					if caes="  49"
						then sector_corto="Empleados servicios"; 
					if caes="  85"  
						then sector_corto="Enseñanza"; 
					if caes="  94"  | caes="  95"
						then sector_corto="Primario y otros servicios";
			end; 
			
		if 1000>pp04b_cod>=100 
			then do; 
				caes=substr(clasificador,1,3); 
					if caes=" 10" | caes=" 20" | caes=" 30"|caes=" 50" |caes=" 60" |caes=" 70" |caes=" 80"|caes=" 90"
						|caes="  1" |caes="  2" | caes="  3" | caes="  5" |caes="  6" |caes="  7" |caes="  8"|caes="  9"
						then sector_corto="Primario y otros servicios"; 
					if caes=" 15"| caes=" 26" 
						then sector_corto="Industria Manuf."; 
					if caes=" 35"
						then sector_corto="Primario y otros servicios"; 
					if caes=" 45"| caes=" 48" 
						then sector_corto="Empleados servicios"; 
					if caes=" 56"
						then sector_corto="Empleados servicios"; 
					if caes=" 49"
						then sector_corto="Empleados servicios"; 
					if caes=" 85" 
						then sector_corto="Enseñanza"; 
					if caes=" 94" | caes=" 95"
						then sector_corto="Primario y otros servicios";
			end; 

		if pp04b_cod>=1000 then do; 
			caes=substr(clasificador,1,2); 
			if caes="40" 
	then sector_corto="construcción"; 
if  caes="10" | caes="11" | caes="12" | caes="13" | caes="14" | caes="15"|caes="16" | caes="17" | caes="18" |
	caes="19"|caes="20"|caes="21"|caes="22"|caes="23" | caes="24" | caes="25"|caes="26"|caes="27"|caes="28"|
	caes="29"|caes="30"|caes="31"|caes="32"|caes="33"
	then sector_corto="Industria Manuf."; 
if caes="45" | caes="48"
	then sector_corto="Empleados servicios"; 
if caes="55" | caes="56" 
	then sector_corto="Empleados servicios"; 
if caes="49" | caes="50" | caes="51" | caes="52" | caes="53" /*Transporte / Almacen.*/
	|caes="77" | caes="78" |caes="79"|caes="80"|caes="81"|caes="82" /*Actividades administrativas y servicios de apoyo.*/
	then sector_corto="Empleados servicios"; 
if caes="64"|caes="65"|caes="66"|caes="68" /*Servicios financieros, inmuebles*/
	|caes="69" |caes="70"|caes="71"|caes="72"|caes="73"|caes="74"|caes="75" /*Actividades profesionales, Científicas y Técnicas.*/
	| caes="58" |caes="59"|caes="60"|caes="61"|caes="62"|caes="63" /*Comunicaciones*/
	then sector_corto="Profesiones intelectuales, financieras y de información"; 
if caes="83" |caes="84" 
	then sector_corto="Admi. pública Defensa y Seg. Soc."; 
if caes="85" 
	then sector_corto="Enseñanza"; 
if caes="86" | caes="87" | caes="88" 
	then sector_corto="Servicios sociales y de salud"; 
if caes="97" | caes="98" 
	then sector_corto="Servicio doméstico"; 
if caes="90" | caes="91" | caes="92"|caes="93"|caes="94"|caes="95"|caes="96" 
	then sector_corto="Primario y otros servicios"; 
if caes="99" | caes="35" |caes="36"|caes="37"|caes="38"|caes="39"
	then sector_corto="Primario y otros servicios"; 
if pp04b_cod=9999 
	then sector_corto="No espec."; 
		end;  
/************Now, the code for identifying sectors that won't pay employers' contributions due to covid_19 emergency measures.************/
no_cont_covid=0; 
	if sector="Hoteles y Restaurantes"
		then no_cont_covid=1; 
	if 4903>=pp04b_cod>=4901 /*Transporte ferroviario, por metro, y automotor de pasajeros*/ 
			| pp04b_cod=7900 | pp04b_cod=79 /*Agencias de viaje*/
		then no_cont_covid=1; 
	if pp04b_cod>=1000 
		then do; 
	if caes="50" | caes="51" | caes="52" /*Transporte vía acuática, aéreo, almacenamiento / auxiliares transporte*/
			| caes="90" | caes="91" | caes="92" | caes="93" /*Artes, Entretenimiento y Recreación*/
		then no_cont_covid=1; 	  
		end; 
	if pp04b_cod<1000 
		then do; 
			if caes=" 49" | caes="  49" | caes=" 50" | caes="  50"| caes=" 51" | caes="  51"| caes=" 52" | caes="  52"
				| caes=" 90" | caes="  90"| caes=" 91" | caes="  91"| caes=" 92" | caes="  92"| caes=" 93" | caes="  93"
				then no_cont_covid=1; 
		end;
	if missing(caes) & labour_market_state<4 
		then do; 
		if pp04b_cod=1 
			then do; 
				caes="1"; 
				sector="Primario"; 
				sector_corto="Primario y otros servicios";
			end; 
		if pp04b_cod=6
			then do; 
				caes="6"; 
				sector="Primario"; 
				sector_corto="Primario y otros servicios"; 
			end; 
		end; 
run; 
dm 'odsresults; clear'; 
dm 'clear log'; 
proc freq data=leo.eph_formatted_2016_2019; 
table pp04b_cod; 
where missing(caes) & labour_Market_state<4; 
run; 
/*Based on the labour-market structure of the last four available quarters, we can see 9.23% of formal wage-earners will not have their 
		employers pay contributions, for a yet unknown period of time (probably at least a quarter). */
proc freq data=leo.eph_formatted_2016_2019; 
	where (ano4=2019 | (ano4=2018 & trimestre=4) ) & labour_market_state=1; 
	weight pondera; 
	table no_cont_covid*pp04b_cod; 
run; 
/*Next step is trying to see what workers are most likely in these sectors. We will as a quick measure only take the gender and age 
		profile of these workers. We will input this information in the starting dataset and assume workers don't change their sector when
		they enter the formal labour force. Probably will change the contrib variable, already used for employers contributions following
		Decree 814/2001. */

proc freq data=leo.eph_formatted_2016_2019; 
	weight pondera; 
	where labour_market_state<4; 
	table sector*ch04; 
run; 


proc freq data=leo.eph_formatted_2016_2019; 
	weight pondera; 
	where labour_market_state<4; 
	table pp04b_cod*pp04a; 
	table sector*pp04a; 
run; 

proc freq data=leo.eph_formatted_2016_2019; 
	weight pondera; 
	where labour_market_state<4 & sector="Primario"; 
	table pp04d_cod*pp04b_cod; 
run; 

proc freq data=leo.eph_data_formatted_2014; 
table pp04b_cod; 
where labour_Market_state<4; 
run; 

proc contents data=leo.eph_data_formatted_2003_2015; 
run; 
proc contents data=leo.eph_data_formatted_2014; run; 
proc contents data=leo.eph_data_formatted_2005; run; 

proc freq data=test_2005; 
table labour_market_state*cat_ocup; 
run; 
data test_2005; 
	length qualif_wag $32. ; 
set leo.eph_data_formatted_2005;
	new_labour_market_state=labour_market_state; 
		qualif_wag="Non_qualif"; 
	if (estado=1)&(cat_ocup=3 | cat_ocup=4) 
		then do; 
				/*We tag independent workers that occupy a position that needs a professional or a technical qualification. Those who 
						have only an operative qualification or no qualification at all are non qualified*/
 			qualification=substr(pp04d_cod,5);
			if qualification^=1 & qualification^=2 
				then qualif_wag="Non_qualif"; 
			else qualif_wag="Qualif"; 
		end; 
	if labour_market_state=3 & (cat_ocup=1 | cat_ocup=2)
		then new_labour_market_state=6; 
	if labour_market_state=1 & pp04a=2
		then new_labour_market_state=7; 
run; 
data 
proc freq data=test_2005; 
where labour_market_state<4; 
table labour_market_state*qualif_wag; 
run;  
