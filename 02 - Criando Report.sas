ods listing style=Netdraw;

ods escapechar = '^';

title justify=left "^{style[preimage='C:\Users\sasdemo\Documents\SAS_logo_horiz.jpg?height=1cm&width=5cm']}" ;

title2 'Principais Causas de Morte por Cancer nos EUA 2007 x 1997';
footnote justify=left italic 'Fonte: American Cancer Society';

ods graphics on / width=10in;
ods graphics on / height=20in;


proc sgpanel data=cancer_sorted;
	panelby Ano / columns=1 uniscale=all;
	format mcases mdeaths fcases fdeaths positive.;
	hbar cause / response=mcases    
		fillattrs=graphdata1 transparency=.65   
		legendlabel="Novos Casos (Masc)" name="mcases";
	hbar cause / response=mdeaths   
		barwidth=.5 fillattrs=graphdata1 transparency=0   
		legendlabel="Mortes (Masc)" name="mdeaths";
	hbar cause / response=fcases   
		fillattrs=graphdata2 transparency=.65    
		legendlabel="Novos Casos (Fem)" name="fcases";
	hbar cause / response=fdeaths   
		barwidth=.5 fillattrs=graphdata2 transparency=0    
		legendlabel="Mortes (Fem)" name="fdeaths";
	keylegend "mcases" "fcases" "mdeaths" "fdeaths" / across=2;
	colaxis label=" " grid;
	rowaxis label=" " discreteorder=data;
run;

ODS _ALL_ CLOSE;