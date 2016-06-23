/******************************************************************************/
/* PROD PROGRAM:   echo.sas
/* WORK PROGRAM:   echo.sas
/* 
/* PURPOSE:        
    macro (mostly shell script) to save a (text) warning to an output
    text (file)
/* 
/* SOURCE PRGM:    NONE
/* INPUT:          NONE
/* OUTPUT:         NONE
/* MACROS USED:    NONE
/* EXEMPTIONS:     NONE
/* 
/* AUTHOR:         Paul Paczuski
/* CREATION DATE:  05/28/15
/* 
/* DETAILS:
    program writes &TEXT to &FILE
    and automatically inserts the following, for each %echo(): 
        * date
        * program name
    
/* 
/* PRGM STRUCTURE: 
/* 
/* NOTES:          
/* MODIFICATIONS:  
/******************************************************************************/

/* text = text to write*/
/* file = file to write &TEXT to*/
/* tip: use text=%str(my text) to include commas and special characters */
%MACRO ECHO(text,file="ECHO_RESULTS.txt");
    /* SETUP */
    %let PROG =  %sysfunc(getoption(sysin)); /* only in batch mode*/


    /* ECHO */
    x echo "";
    x echo "writing an echo to &FILE" ;
    x echo "";

    x echo " " >> &FILE ; 
    x date >> &FILE ; 
    x echo "&PROG" >> &FILE ; 
    x echo "" >> &FILE ; 
    x echo "&TEXT"  >> &FILE ; 

%MEND ECHO ;
