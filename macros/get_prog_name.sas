/******************************************************************************/
/* PROD PROGRAM:   get_prog_name.sas
/* WORK PROGRAM:   get_prog_name.sas
/* 
/* PURPOSE:       macro that obtains the short name, without `.sas`
                  of the current SAS program
/* 
/* SOURCE PRGM:    NONE
/* INPUT:          NONE
/* OUTPUT:         NONE
/* MACROS USED:    NONE
/* EXEMPTIONS:     NONE
/* 
/* AUTHOR:         Paul Paczuski
/* CREATION DATE:  06/02/15
/* 
/* DETAILS:        
/* 
/* PRGM STRUCTURE: 
/* 
/* NOTES:          
/* MODIFICATIONS:  
/******************************************************************************/

%MACRO get_prog_name(test=0);
    %if &TEST = 1 %then %do;
        %global prog_long prog_sas prog ;
        %end;

    /* works only in batch (unix) mode  */

    /* &PROG's are local macro vars */
    /* first, get the long name including location */
    /* then, delete location by scanning from end */
    /* last, delete .sas*/
    /* and return value */
    %let prog_long = %sysfunc(getoption(sysin)) ; 
    %let prog_sas  = %scan(&PROG_LONG, -1, '/') ; 
    %let prog      = %scan(&PROG_SAS, 1, '.') ; 
    &PROG

%MEND ;
