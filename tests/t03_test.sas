%let kmkm=0;
data gab;
    x=10;
    %test( &KMKM, %str(y=20;) ) ;
run;

proc print ;
run;
