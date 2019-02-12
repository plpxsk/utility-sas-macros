/******************************************************************************/
/* PROD PROGRAM:   freq.sas
/* WORK PROGRAM:   freq.sas
/* 
/* PURPOSE:        macro to do simple proc freq of some <var>'s in <dset>
/* 
/* SOURCE PRGM:    NONE
/* INPUT:          NONE
/* OUTPUT:         NONE
/* MACROS USED:    NONE
/* EXEMPTIONS:     NONE
/* 
/* AUTHOR:         Paul Paczuski
/* CREATION DATE:  01/09/15
/* 
/* DETAILS:        
/* 
/* PRGM STRUCTURE: 
/* 
/* NOTES:          
/* MODIFICATIONS:  
/******************************************************************************/


/* OPTIONAL: */
/* options = specify options which follow the </> in the <table> statement */
/* etc  = add another statement */
%MACRO FREQ(dset, var, options="", etc="");

    proc freq data=&DSET;
        table &VAR
            %if &OPTIONS ne "" %then %do; 
            / &OPTIONS; 
            %end;
        ;
        %if &ETC ne "" %then %do;
            &ETC. ;
            %end;
    run;

%MEND;    

