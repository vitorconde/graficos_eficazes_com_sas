data work.cancer;
	infile datalines;
	input cause $ 1-20 Ano $ mcases fcases mdeaths fdeaths;
	deaths=mdeaths + fdeaths;
	mcases= -1 * mcases;
	mdeaths= -1 * mdeaths;
	datalines;
C�ncer de Pulm�o    2007 114760  98620  89510  70880  
C�ncer Colorretal   2007  55290  57050  26000  26180  
C�ncer de Mama      2007   2030 178480    450  40460  
C�ncer de P�ncreas  2007  18830  18340  16840  16530  
C�ncer de Pr�stata  2007 218890      0  27050      0  
Leucemia            2007  24800  19440  12320   9470  
Linfoma             2007  38670  32710  10370   9360  
C�ncer de F�gado    2007  13650   5510  11280   5500  
C�ncer de Ov�rio    2007      0  22430      0  15280  
C�ncer de Es�fago   2007  12130   3430  10900   3040  
C�ncer de Bexiga    2007  50040  17120   9630   4120  
C�ncer de Rim       2007  31590  19600   8080   4810  
C�ncer de Pulm�o    1997  98300  79800  94400  66000  
C�ncer Colorretal   1997  45500  48600  22600  24000  
C�ncer de Mama      1997   1400 180200   290   43900  
C�ncer de P�ncreas  1997  13400  14200  13500  14600  
C�ncer de Pr�stata  1997 334500      0  41800      0  
Leucemia            1997  15900  12400  11770   9540  
Linfoma             1997  34200  26900  13220  12060  
C�ncer de F�gado    1997   9100   4500   7500   4900  
C�ncer de Ov�rio    1997      0  26800      0  14200  
C�ncer de Es�fago   1997   9400   3100   8700   2800  
C�ncer de Bexiga    1997  39500  15000   7800   3900  
C�ncer de Rim       1997  17100  11700   7000   4300
;
run;

proc sort data=cancer out=cancer_sorted;
	by descending Ano descending deaths;
run;

proc format;
	picture positive low-<0='000,000'
		0<-high='000,000';
run;
