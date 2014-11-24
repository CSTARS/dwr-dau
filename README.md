# California DWR Detailed Analysis Units (2003)

In the past DWR has maintained a listing of California's Detailed
Analysis Units (DAUs) used by the state for water planning.  While
still avialable, this data is harder to find online.  This repository
maintains a copy of the dau original source files, as well as a few
alternate formats.

This dataset is the DWR Version 20, December 2003.

## Overview

The Department of Water Resources (DWR) uses Detailed Analysis Units (DAU) as 
the base geographic unit for most statewide planning purposes.  There are 278 
DAU's that cover all of mainland California.  The DAU's are nested inside 46 
Planning Subareas (PSA), which in turn are nested inside of 10 Hydrologic 
Regions (HR). 

## Attributes

We use a subset of the attributes supplied in the original file

--- | ---
dau_code | The DAU code (3 character string) of the delineated area
dau_name | The DAU name (character string) of the delineated area
psa_code |The PSA code (3 character string) of PSA encompassing the delineated area
psa_name | The PSA name (character string) of the PSA encompassing the delineated area
hr_code	 | The HR code (2 character string) of the HR encompassing the delineated area
hr_name	| The HR name (character string) of the HR encompassing the delineated area
dauid_code | The DAU identification code (8 character string), which is a concatenation of the HR_CODE, PSA_CODE, and DAU_CODE.   
pa_no | The California Planning Update area number (6 character number).


## Process

1.  DWR used, as a starting point, the vector data from Calwater 2.0.  This 
vector data was provided to all four DWR District Offices.  Each District 
Office made the decisions as to which vector lines were to be used from the 
Calwater 2.0 data.  

2.  The District Offices then digitized, from previously drawn DAU boundaries 
drawn on USGS 1:24,000 maps, those DAU lines which were not taken from the 
Calwater 2.0 data.  

3.  All four Districts' digital data was then brought together at Headquarters 
into one file, and run through quality control procedures to clean up the 
linework, and attribute each DAU appropriately, creating a draft digital map.  

4.  The draft DAU digital map was reviewed by Headquarters and the four 
District Offices, and all discovered errors were corrected.  

5.  Two products were finalized:

  a.  An AUTOCAD DWG file, DWRDAUV10.DWG (version 1.0), which contains the 
  linework and limited attributes (just the DAU code).  
  b.  A Shape file(s), DWRDAUV10.SHP, .SHX, .DBF (version 1.0), which 
  contains the polygons and the complete attributing of each polygon.  

6.  In December of 2003, an error was corrected in the boundary on the valley 
floor between the Tulare Lake Region and the San Joaquin Region.  It resulted
in a new shape file, DWRDAUV20.SHP.  The only major change that resulted was, 
on the westside, DAU 220 became larger and two polygons, and DAU 248 became 
smaller.  On the eastside, DAU 234 became smaller, and DAU 214 became larger. 
In addition, a new column was added containing the California Planning Update  
Area number.      





