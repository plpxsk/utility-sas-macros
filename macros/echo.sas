/******************************************************************************/
/* PROD PROGRAM:   echo.sas
/* WORK PROGRAM:   echo.sas
/* 
/* PURPOSE:        
    macro to save a warning to a file
    use for data checks. meant to be used as part of routine running of admin reports
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
    program writes text from &T to file &F
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
    %let PROG =  %sysfunc(getoption(sysin));

    %global ii ;


    /* ECHO */
    x echo "";
    x echo "writing an echo to &F" ;
    x echo "";

    /* x echo " " >> &F ; */


    %if &II = 1 %then %do;
        
        /* x date >> &F ; */
        /* x echo "&PROG" >> &F ; */
        /* x echo "" >> &F ; */
        %end;

    %else %do;
        /* x echo "&II" >> &F; */
        /* x echo "&T"  >> &F ; */
        %end ;
    
    %let II = %eval(&II+1);
    x echo "&II";

%MEND ECHO ;
