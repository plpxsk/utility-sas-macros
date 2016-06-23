/******************************************************************************/
/* PROD PROGRAM:   contents.sas
/* WORK PROGRAM:   contents.sas
/* 
/* PURPOSE:        macro to run proc contents on DSET
/* 
/* SOURCE PRGM:    NONE
/* INPUT:          NONE
/* OUTPUT:         NONE
/* MACROS USED:    NONE
/* EXEMPTIONS:     NONE
/* 
/* AUTHOR:         Paul Paczuski
/* CREATION DATE:  04/15/15
/* 
/* DETAILS:        
/* 
/* PRGM STRUCTURE: 
/* 
/* NOTES:          
/* MODIFICATIONS:  
/******************************************************************************/

%MACRO CONTENTS(dset);

    proc contents data = &DSET ;
    run;

%MEND ;     
