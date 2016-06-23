Overview
===============================================================================
A collection of simple utility SAS macros to speed up data exploration.

See [Motivation](#motivation), [Quick Start](#quick-start) and [Installation](#installation) below.

Feel free to get in touch/send pull requests with ideas for improvements.

Contents
===============================================================================

* [Motivation](#motivation)
* [Quick Start](#quick-start)
* [Parameter Dictionary](#parameter-dictionary)
* [Details](#details)
* [Installation](#installation)
* [Tests](#tests)
* [Inspirations](#inspirations)



Motivation
===============================================================================

## Example 1

Before:

	proc freq data=mydata;
		var patid;
	run;
	
After:

	%freq(mydata, patid);
	

## Example 2

Before:

	proc sort data=data1; by patid; run;
	proc sort data=data2; by patid; run;
	
	data merged;
		merge data1 data2;
		by patid;
	run;
	
After:

	%sort(data1, data2, patid);
	
		






Quick Start
===============================================================================

There are 3 types of macros:

1. Printing - print output to SAS listing (.lst)

2. Data Manipulation

3. Miscellaneous


The following are shown with the most common parameters. Details follow.

### (1) Printing

`%contents(dset);`

macro to run proc contents on DSET

`%count(dset, var);` 

macro to count unique and total observations [default: var=patid] in DSET

`%freq(dset, var);`

macro to do simple proc freq of VAR's in DSET

`%overview(dset);`

runs all of the following on DSET: %contents, %freqmeans[CBAR],
%count, %print, separated by %blank

`%print(dset);`

macro to do simple proc print of DSET

`%printobs(dset, n=100);`

macro to run proc print with `by patid; id patid;` on DSET


### (2) Data Manipulation

`%merge(dset1,dset2,by,out);`

macro to do simple data step merge of DSET1 and DSET2

`%sort(dset,by, out=0);`

macro to do simple proc sort by BY variable in DSET, output as OUT


### (3) Miscellaneous

`%blank();`

macro that creates and prints a blank dataset and also resets titles

`%echo(text,file);`

macro (mostly shell script) to save TEXT to FILE

`%get_prog_name();`

macro that obtains the short name, without `.sas`, of the current SAS
program


`%test(var,condition);`

macro that runs CONDITION when VAR is equal to 1



## Notes
Many parameters do not need to be specified. Both of the following will work:

	%freq(dset=visits, var=type);
	%freq(visits, type);


You can see exactly what the macro is doing by adding the following
before you call them:

	options mprint;  

*In older versions, this was included in the macro itself, but it has
been decided to remove this.*



Parameter Dictionary
===============================================================================
dset = input dataset

var  = variable for proc

by   = by variable for merge or sort




Details
===============================================================================

[working - see actual code]



Installation
===============================================================================
Copy the `/macros` folder and its contents to a directory of your choice.

You can include individual macros with:

	%include "count.sas";

Or add them to your autocalls (get help from an administrator)




Tests
===============================================================================

## tests.sas [working]
testing program

tests the following
* count.sas
* print.sas
* printobs.sas



Inspirations
===============================================================================

Hadley Wickham

R 
