/******************************************************************************/
/* PROD PROGRAM:   blank.sas
/* WORK PROGRAM:   blank.sas
/* 
/* PURPOSE:        macro that creates and prints a blank dataset and also resets titles
/* 
/* SOURCE PRGM:    NONE
/* INPUT:          NONE
/* OUTPUT:         NONE
/* MACROS USED:    NONE
/* EXEMPTIONS:     NONE
/* 
/* AUTHOR:         Pawel Paczuski
/* CREATION DATE:  01/12/15
/* 
/* DETAILS:        
/* 
/* PRGM STRUCTURE: 
/* 
/* NOTES:          
/* MODIFICATIONS:  
/******************************************************************************/

/* MACRO BLANK:  */
%put "";
%put 'macro blank is just a title separator. it prints a blank dataset to reset titles' ;
%put "";

data blank;    x="--";     label x = '--'; run ;

%MACRO BLANK(); 

    proc print data = blank noobs label; run;
    title '';

%MEND ; 
