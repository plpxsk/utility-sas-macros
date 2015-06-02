%let kk = %strip_prog_name(test=1);

x echo "";
x echo ">> tests:";
x echo &PROG_LONG ;
x echo &PROG_SAS ;
x echo &PROG ;
x echo "";
x echo ">> final:";
x echo &kk;
