/******************************************************************************/
/* PROD PROGRAM:   count.sas
/* WORK PROGRAM:   count.sas
/* 
/* PURPOSE:        macro to count unique and total observations (default: v=patid)
    in a (d)ataset
/* 
/* SOURCE PRGM:    NONE
/* INPUT:          NONE
/* OUTPUT:         NONE
/* MACROS USED:    NONE
/* EXEMPTIONS:     NONE
/* 
/* AUTHOR:         Pawel Paczuski
/* CREATION DATE:  12/17/14
/* 
/* DETAILS:        
/* 
/* NOTES:          
/* MODIFICATIONS:
/******************************************************************************/


%MACRO COUNTX(d                  /* input dataset*/
    , v=patid                    /* OPT: variable to count*/
    , g=""                       /* OPT: group by?*/
    , out=""                     /* OPT: name of output dataset*/
    , warn=0                     /* OPT: set to 1 to warn if duplicates exist*/
    );
    
    %put '%count(d, v=patid, g=) counts <v>ariable in <d>ataset, with optional <g>roup variable';
    %put '... warn=1 warns if duplicates exist [may not be compatible with <g>roup]';

    %local NN1 NN2 DIFFX;
    
    title6 "Dataset: &D" ;

    proc sql;
        %if &OUT ne "" %then %do ; create table &OUT as %end;
    select 
        %if &G ne "" %then %do;  &G , %end;
        count(unique(&V)) as N_unique_&V, count(&V) as N_total_&V, count(scrnum)-count(unique(scrnum)) as diff
        /* for the warning, need &DIFFX */
        into :NN1, :NN2, :DIFFX separated by ''

        from &D
        %if &G ne "" %then %do;  group by &G %end;
            ;
   quit;

   %if &WARN = 1 and %eval(&DIFFX) ^= 0 %then %do;
       %put WARNING(CBAR): '%count(..., warn=1)' sees duplicate records.;
       %end;
   

   title6 ;

%MEND ; 




