ods listing style=Netdraw;

ods escapechar = '^';
title justify=left "^{style[preimage='C:\Users\sasdemo\Documents\SAS_logo_horiz.jpg?height=1cm&width=5cm']}" ;

ods graphics on / width=10in;
ods graphics on / height=7in;

/*title2 'Comparação de Gráficos - Insight';*/

proc sgplot data=bmi;
	band x=weight_bmi    upper=upper_hgt lower=lower_hgt /   transparency=.5    group=category    name="bmi";
	xaxis min=30 max=300 label='Weight (lbs)' grid;
	yaxis min=40 max=80  label='Height (in)'  grid;
	keylegend "bmi" /    position=right across=1 title='BMI';
run;

proc sgplot data=merged;
	band x=weight_bmi    upper=upper_hgt lower=lower_hgt /   transparency=.5 group=category name="bmi";
	xaxis min=30 max=300 label='Weight (lbs)' grid valueattrs=(color=black size=12pt);
	yaxis min=40 max=80  label='Height (in)'  grid valueattrs=(color=black size=12pt);
	keylegend "bmi" / position=right across=1 title='BMI' valueattrs=(color=black size=12pt);
	series x=wgt y=hgt /   datalabel=year   lineattrs=(pattern=solid thickness=2px )   markers markerattrs=(symbol=circlefilled size=10px)   group=name name="pts" datalabelattrs=(size=12 weight=bold);
	keylegend "pts" / position=bottom title='Patient: ' ;
	inset "BMI=703 x Weight / Height (*ESC*){sup '2'}"  " "/   position=bottomright textattrs=graphfootnotetext;
run;


ODS _ALL_ CLOSE;