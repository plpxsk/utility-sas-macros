/*****************************************************************************/
/* WHAT     sas program to create indicator variables for variables in
            a macrolist (or automatically selected from some dataset)

/* HOW      %INDX() generates indicator
            PROC CONTENTS + proc sql gets variable names from a dataset
            %RUNIT() iterates through macro list to generate indicator
                for each variable

/* WHO      Pawel Paczuski github.com/pavopax
/* DATE     2014 05 02    

/* NOTES
/*****************************************************************************/

/* can use */
/* %let gabba = %str(gab, %i); */



/* macro to convert variables to indicators*/
/* outputs dataset "df" with patid and the indicator only for easy later merge*/
/* d = dataset // v = var for indicator // n = name of new var (perhaps use same prefix with consecutive #s!!) */ %MACRO INDX(d=, v=, n=);
   data df;
       set &D;
       if &V > . then tt = 1; else tt =0;
       rename tt=&N;
       label
           &N = "&V 0/1"
           ;
   run;
 
%MEND INDX;
 
 
data have;
input Index  Var1   Var2  Var3;
cards;
1      78.3   54.7  79.8
3      67.2   56.2  12.3
2      65.3   45.2  98.1
1      56.2   49.7  11.3
1      67.2   98.2  98.6
;
run;
 
/* put all dataset variable names into macro list */
/* source: "Putting SAS Dataset Variable Names into a Macro Variable cc01" */
/* search online */
proc contents data = have
out = vars(keep = varnum name)
noprint;

proc sql noprint;
  select distinct name
  into :orderedvars separated by ' '
  from vars
  order by varnum;
quit;
 
/* run macro for each variable in above dataset*/ %macro  RUNIT;
   %local i cur;
   %do i=1 %to %nitem(&ORDEREDVARS);
       %let cur=%scan(&ORDEREDVARS,&I);
       %let vname = V&I;
 
       %INDX(d=have, v=&CUR, n=&VNAME);
       %end;
%mend RUNIT;
 
%RUNIT;
proc print data = df;
run;
ENDSAS;/***********************************************************************/
    
ENDSAS;/***********************************************************************/


data _null_;
    dtt = datetime();
    call symput('kappa', put(dtt, datetime.) ); run;
