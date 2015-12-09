/******************************************************************************/
/* PROD PROGRAM:   count.sas
/* WORK PROGRAM:   count.sas
/* 
/* PURPOSE:        macro to count unique and total observations
                    (default: v=patid) in a (d)ataset
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
/* MODIFICATIONS:  [see git]
/******************************************************************************/


%MACRO COUNT(d                   /* input dataset*/
    , v=patid                    /* OPTIONAL: variable to count*/
    , g=""                       /* OPTIONAL: <group by> variable*/
    , out=out_count              /* name of output dataset*/
    , warn=0                     /* OPTIONAL: set to 1 to warn if duplicates exist*/
    );

    
    %put '%count(d, v=patid, g=) counts <v>ariable in <d>ataset,';
    %put 'with optional <g>roup variable';
    %put '... warn=1 warns if duplicates exist [beta; may not work with <g>roup]';


    
    title6 "Dataset: &D" ;

    /* [I like the dashed line in proc sql output...] */
    proc sql; select %if &G ne "" %then %do;  &G , %end;
          count(unique(&V))           as N_unique_&V label "Unique &V (N)"
        , count(&V)                   as N_total_&V  label "Total &V (N)"
        , count(&V)-count(unique(&V)) as Diff        label "Difference"

        from &D
            
        %if &G ne "" %then %do;  group by &G %end;
        ;
    quit;

    title6 ;
    
    /* [...thats why I'm repeating this block of code:]  */
    proc sql; create table &OUT as 
        select %if &G ne "" %then %do;  &G , %end;
          count(unique(&V))           as N_unique_&V
        , count(&V)                   as N_total_&V
        , count(&V)-count(unique(&V)) as Diff

        from &D
            
        %if &G ne "" %then %do;  group by &G %end;
        ;
    quit;


   /* if requested, output warning if duplicates exist */
   %if &WARN = 1 %then %do;
        %local DIFFX;

        proc sql noprint;
            select sum(Diff)

            into :DIFFX separated by '' 

            from &OUT
            ;
        quit;       

        %if %eval(&DIFFX) ^= 0 %then %do; 
            %put WARNING(CBAR): '%count(..., warn=1)' sees duplicate records.; 
            %end; 
        %end; 

%MEND ; 
