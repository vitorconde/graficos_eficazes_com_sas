
data bmi;
	infile datalines;
	input category $ 1-11 upper_bmi lower_bmi weight_bmi;
	lower_hgt=(703*weight_bmi/lower_bmi)**.5;
	upper_hgt=(703*weight_bmi/upper_bmi)**.5;
	nn=_n_;
	datalines;
Underweight 1    18.5    25.0 4 
Underweight 1    18.5   100.0 4 
Underweight 1    18.5   175.0 4 
Underweight 1    18.5   250.0 4 
Underweight 1    18.5   325.0 4 
Normal      18.5 25.0    25.0 5 
Normal      18.5 25.0   100.0 5 
Normal      18.5 25.0   175.0 5 
Normal      18.5 25.0   250.0 5 
Normal      18.5 25.0   325.0 5 
Overweight  25.0 30.0    25.0 6 
Overweight  25.0 30.0   100.0 6 
Overweight  25.0 30.0   175.0 6 
Overweight  25.0 30.0   250.0 6 
Overweight  25.0 30.0   325.0 6 
Obese       30.0 150.0  25.0  7 
Obese       30.0 150.0  100.0 7 
Obese       30.0 150.0  175.0 7 
Obese       30.0 150.0  250.0 7 
Obese       30.0 150.0  325.0 7
;
run;

proc template;
	define style styles.bmi;
		parent=styles.listing;
		style graphcolors from graphcolors /    'gcdata1'=CX31035E     'gdata1'=CXFFFFFF    'gdata3'=CXFDC861    'gdata4'=CXDC531F    'gdata2'=CX679920;
	end;
run;


data records;
	infile datalines;
	nn=_n_;
	input wgt hgt year name $;
	datalines;
45 52 1975 Bob 
80 56 1980 Bob 
125 66 1986 Bob 
175 67 1990 Bob 
200 68 1995 Bob 
215 69 2000 Bob 
250 69 2005 Bob 
80  43 1975 Fred 
85  58 1980 Fred 
135 70 1986 Fred 
180 70 1990 Fred 
195 70 2005 Fred 
50  42 1975 Jack 
135 54 1980 Jack 
140 64 1985 Jack 
160 73 1990 Jack 
170 76 2000 Jack 
180 76 2005 Jack 
;
run;

proc sort data= records;
	by nn;
run;

proc sort data= bmi;
	by nn;
run;

data merged;
	merge records bmi;
	by nn;

	if name='' then
		name='Jack';
run;