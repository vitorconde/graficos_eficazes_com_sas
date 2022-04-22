proc template;
	define style styles.bmi;
		parent=styles.listing;
		style graphcolors from graphcolors /    'gcdata1'=CX31035E     'gdata1'=CXFFFFFF    'gdata3'=CXFDC861    'gdata4'=CXDC531F    'gdata2'=CX679920;
	end;
run;

ods listing style=Netdraw;

ods escapechar = '^';
title justify=left "^{style[preimage='C:\Users\sasdemo\Documents\SAS_logo_horiz.jpg?height=1cm&width=5cm']}" ;


ods graphics on / width=10in;
ods graphics on / height=7in;

title2 'Body Mass Index Categories';

proc sgplot data=bmi;
	band x=weight_bmi    upper=upper_hgt lower=lower_hgt /   transparency=.5    group=category    name="bmi";
	xaxis min=30 max=300 label='Weight (lbs)' grid;
	yaxis min=40 max=80  label='Height (in)'  grid;
	keylegend "bmi" /    position=right across=1 title='BMI';
run;


ODS _ALL_ CLOSE;