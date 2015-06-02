/* PROD PROGRAM:  <specify>
/* WORK PROGRAM:  <specify>
/* 
/* PURPOSE:       store exploratory macros, for easy reference inside programs
/*
/* STRUCTURE:
    %XP()         "eXPlore"   contents + print
    %FIT()        "Freq IT"   freq
    %CC()         "Counter"   count + count unique
    %atmosphere   jitter + boxplot
    %printobs()   print by observation
/* 
/* SOURCE PRGM:   NONE
/* INPUT:         NONE
/* OUTPUT:        NONE
/* MACROS USED:   NONE
/* 
/* AUTHOR:        Pawel Paczuski
/* CREATION DATE: 04/15/14
/* 
/* NOTES:         for more awesomeness, create an easy shortcut to insert
                  a reference to this file in your program
    
/* MODIFICATIONS:  
/******************************************************************************/

%MACRO xp(d=, o=20);
    proc contents data = &D;
    run;

    proc print data = &D (obs = &O);
    run;
%MEND;
        
        
%MACRO fit(v=, opts=);
    /* may want to add <data = &D> ? otherwise uses most recent */
    proc freq;
        table &V /&OPTS;
    run;
%MEND;


%MACRO cc(d, v=patid, g=);
    proc sql;
        select
            %if %length(&G) > 0 %then %do;
            &G,
            %end; 
            
            count(&V) as N,
            count(unique(&V.)) as NUniq

            from &D
            %if %length(&G) > 0 %then %do; 
                group by &G 
                %end; 
            ;

        quit;
%MEND;        

/* MACRO BLACK */
data blankx;    ignoramus="--";     run;

%MACRO blank;
    proc print data = blankx noobs; run;
%MEND ;



*** Print only a limited observations from a data set ;
/* /home/prinf/actgA5257/sas_macros/sasautos/printobs.sas */
%macro printobs(dsn=&syslast,n=All,byvar=patid,descending=F,vnames=,label=F,fancy=F,split=%str("*"),nofmt=NULL,contents=F,title=T,outfile=) ;
  /* PRINT TO A DIFFERENT LISTING FILE */
  %if &outfile^= %then %do ;
    proc printto print=&outfile new ;
	run ;
  %end ;

  /* CONTENTS LISTING IF SELECTED */
  %if &contents=T %then %do ;
    title2 "Contents listing: %upcase(&dsn)" ;
	title3 "Created by program: %sysfunc(getoption(sysin))" ;
    proc contents data=&dsn order=varnum ;
    run ;
  %end ;
  /* PRINTOUT SELECTED OBSERVATIONS */
  %if &title=T %then title2 "&n observations from %upcase(&dsn)" ; ;
  proc sort data=&dsn out=dsn ;
    by %if &descending=T %then descending ; &byvar ;
  run ;
  %if &fancy=F %then %do ;
   proc print data=dsn %if &n^=All %then (obs=&n); %if &label=T %then split="*" ;;
    by  %if &descending=T %then descending ; &byvar ;
    id &byvar ;
    %if &vnames^= %then var &vnames ;;
    %if &nofmt^=NULL %then format &nofmt ;;
   run ;
 %end ;
 %if &fancy=T %then %do ;
  proc report data=dsn split=&split headskip  ;
    columns &byvar %if &vnames^= %then &vnames ;;
    %let j=1 ;
    %do %until(%length(%scan(&byvar,&j," "))=0) ;
	define %scan(&byvar,&j," ") / group order=data ;;
        %linebreak(after=%scan(&byvar,&j," ")) ;
	%let j = %eval(&j+1);
	%end ;
    %let i=1 ;
    %do %until(%length(%scan(&vnames,&i," "))=0) ;
	define %scan(&vnames,&i," ") / display ;;
	%let i = %eval(&i+1);
	%end ;
  run ;
 %end ;
 /* CLOSE OUTPUT FILE IF ONE WAS OPENED */
  %if &outfile^= %then %do ;
    proc printto ;
	run ;
  %end ;

%mend ;





/******************************************************************************/ 
/* JITTER - ATMOSPHERE
/******************************************************************************/
/* /home/prinf/actgA5260S/final_analysis/Bone/programs/working/tables_figures/Fat_supp_reg_leptin.sas */

/* http://blogs.sas.com/content/graphicallyspeaking/2012/05/07/unbox-your-box-plots/ */
/* http://blogs.sas.com/content/graphicallyspeaking/files/2012/05/boxWithOrigData_sas.txt */


/* Jittered scatter overlaid with box plot */
/* temp */
/* ods path reset; */

/* %let xxvarf = lep_deltaf.; */
/* %let xxvar  = lep_delta; */
/* %let yyvar  = vat_p; */
%macro atmosphere(DSET=, XXVARF=, XXVAR=, YYVAR=,T1=,T2=,T3=);
    x echo "need to manually edit x tick marks; see tickvalueSequence";
    proc template;                                                                
        define statgraph unbox;
        begingraph;
        entryTitle "&YYVAR by &XXVAR"; 
        layout overlay / xaxisopts=(display=(tickvalues) /* type=linear */
            linearOpts=(tickvalueSequence=(start=-1 increment=1 end=3)
            tickValueFormat=&XXVARF)
            );
        scatterPlot x=eval(0.08*rannor(57)+&XXVAR) y=&YYVAR / name="sp1"
            markerAttrs=GraphData3 legendLabel="Raw (jittered) data"
            dataTransparency=0.5;
        boxplot x=&XXVAR y=&YYVAR / display=(caps mean median)
            meanAttrs=(color=red symbol=diamondFilled);

        discreteLegend "sp1";
        endlayout;           
        endgraph;                                                               
        end;                                                                       
    run;

    proc sgrender template=unbox data=lepx;
    run;

%MEND;    
