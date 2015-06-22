/******************************************************************************/
/* PROD PROGRAM:   freq.sas
/* WORK PROGRAM:   freq.sas
/* 
/* PURPOSE:        macro to do simple proc freq of some (v)ariables in a (d)ataset
/* 
/* SOURCE PRGM:    NONE
/* INPUT:          NONE
/* OUTPUT:         NONE
/* MACROS USED:    NONE
/* EXEMPTIONS:     NONE
/* 
/* AUTHOR:         Pawel Paczuski
/* CREATION DATE:  01/09/15
/* 
/* DETAILS:        
/* 
/* PRGM STRUCTURE: 
/* 
/* NOTES:          
/* MODIFICATIONS:  
/******************************************************************************/


/* d = dataset */
/* v = variable*/

/* OPTIONAL: */
/* opts = specify options whcih follow the </> in the <table> statement */
/* etc  = add another statement */
%MACRO FREQ(d, v, opts="", etc="");

    proc freq data=&D;
        table &V
            %if &OPTS ne "" %then %do; 
            / &OPTS; 
            %end;
        ;
        %if &etc ne "" %then %do;
            &ETC. ;
            %end;
    run;

%MEND;    

