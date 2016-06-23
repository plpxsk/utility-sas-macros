/******************************************************************************/
/* PROD PROGRAM:   count.sas
/* WORK PROGRAM:   count.sas
/* 
/* PURPOSE:        macro to count unique and total observations
                    (default: v=patid) in a dataset
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


%MACRO COUNT(dset                /* input dataset*/
    , var=patid                  /* OPTIONAL: variable to count*/
    , group=""                   /* OPTIONAL: <group by> variable*/
    , out=out_count              /* name of output dataset*/
    , warn=0                     /* OPTIONAL: set to 1 to warn if duplicates exist*/
    );

    
    %put '%count(dset, var=patid, group=) counts <var> in <dset>,';
    %put 'with optional <group> variable';
    %put '... warn=1 warns if duplicates exist [beta; may not work with <group>]';


    
    title6 "Dataset: &DSET" ;

    /* [I like the dashed line in proc sql output...] */
    proc sql; select %if &GROUP ne "" %then %do;  &GROUP , %end;
          count(unique(&VAR))             as N_unique_&VAR label "Unique &VAR (N)"
        , count(&VAR)                     as N_total_&VAR  label "Total &VAR (N)"
        , count(&VAR)-count(unique(&VAR)) as Diff          label "Difference"

        from &DSET
            
        %if &GROUP ne "" %then %do;  group by &GROUP %end;
        ;
    quit;

    title6 ;
    
    /* [...thats why I'm repeating this block of code:]  */
    proc sql; create table &OUT as 
        select %if &GROUP ne "" %then %do;  &GROUP , %end;
          count(unique(&VAR))             as N_unique_&VAR
        , count(&VAR)                     as N_total_&VAR
        , count(&VAR)-count(unique(&VAR)) as Diff

        from &DSET
            
        %if &GROUP ne "" %then %do;  group by &GROUP %end;
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
