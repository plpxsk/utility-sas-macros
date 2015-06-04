# Utility SAS macros
Pawel Paczuski [AMA] [pavopax.com](http://www.pavopax.com)

Overview
===============================================================================
A collection of simple utility SAS macros to speed up data exploration.

See [Quick Start](#quick-start) and [Installation](#installation) below.

Feel free to get in touch/send pull requests with ideas for improvements.



Contents
===============================================================================
* [Quick Start](#quick-start)
* [Parameter Dictionary](#parameter-dictionary)
* [Details](#details)
* [Installation](#installation)
* [Tests](#tests)
* [Inspirations](#inspirations)



Quick Start
===============================================================================
*See bottom for some quick notes*


## There are three collections of these macros:
1. Printing - print output to SAS listing (.lst)
2. Data Manipulation
3. Miscellaneous

### (1) Printing

*shown with most common parameters. details below*

`%contents(d);`

macro to run proc contents on a (d)ataset

`%count(d,v);` 

macro to count unique and total observations (default: v=patid) in a
(d)ataset

`%freq(d,v);`

macro to do simple proc freq of some (v)ariables in a (d)ataset

`%overview(d);`

runs all of the following on a (d)ataset: %contents, %freqmeans[CBAR],
%count, %print, separated by %blank

`%print(d);`

macro to do simple proc print of a (d)ataset

`%printobs(d,n=100);`

macro to run proc print with `by patid; id patid;` on a (d)ataset

`%sort(d,v);`

macro to do simple proc sort by (v)ariable in a (d)ataset

### (2) Data Manipulation

`%merge(d1,d2,by,out);`

macro to do simple data step merge of datasets d1 and d2 by (v)ariable


### (3) Miscellaneous

`%blank();`

macro that creates and prints a blank dataset and also resets titles

`%echo(t,f);`

macro (mostly shell script) to save a (t)ext warning to an output text
(f)ile




## Notes
Many parameters do not need to be specified. Both of the following will work:

	%freq(d=visits, v=type);
	%freq(visits, type);


By reviewing the SAS log, you can see exactly what the macros are
doing, since they are wrapped with:

    options mprint;  
    ...  
    options nomprint;  




Parameter Dictionary
===============================================================================
d = dataset

v = variable

[and others]



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

## tests.sas
testing program [working]

tests the following
* count.sas
* print.sas
* printobs.sas



Inspirations
===============================================================================

Hadley Wickham

R 
