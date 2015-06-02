/******************************************************************************/
/* PROD PROGRAM:   echo.sas
/* WORK PROGRAM:   echo.sas
/* 
/* PURPOSE:        
    macro (mostly shell script) to save a (t)ext warning to an output
    text (f)ile
/* 
/* SOURCE PRGM:    NONE
/* INPUT:          NONE
/* OUTPUT:         NONE
/* MACROS USED:    NONE
/* EXEMPTIONS:     NONE
/* 
/* AUTHOR:         Pawel Paczuski
/* CREATION DATE:  05/28/15
/* 
/* DETAILS:
    program writes text &T to file &F
    and automatically inserts the following, for each %echo(): 
        * date
        * program name
    
/* 
/* PRGM STRUCTURE: 
/* 
/* NOTES:          
/* MODIFICATIONS:  
/******************************************************************************/

/* t = text to write*/
/* f = file to write &T to*/
/* tip: t= %str(text enclosed in %str() has commas, and !special characters!!) */
%MACRO ECHO(t,f="ECHO_RESULTS.txt");
    /* SETUP */
    %let PROG =  %sysfunc(getoption(sysin)); /* only in batch mode*/


    /* ECHO */
    x echo "";
    x echo "writing an echo to &F" ;
    x echo "";

    x echo " " >> &F ; 
    x date >> &F ; 
    x echo "&PROG" >> &F ; 
    x echo "" >> &F ; 
    x echo "&T"  >> &F ; 

%MEND ECHO ;
