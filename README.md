# California DWR Detailed Analysis Units (2012)

The Department of Water Resources (DWR) uses Detailed Analysis Units (DAU) as 
the base geographic unit for most statewide planning purposes.  There are 278 
DAU's that cover all of mainland California.  The DAU's are nested inside 46 
Planning Subareas (PSA), which in turn are nested inside of 10 Hydrologic 
Regions (HR). 

We use a subset of the attributes supplied in the original source data.

Attribute | Description
--- | ---
dau_code | The DAU code (3 character string) of the delineated area
dau_name | The DAU name (character string) of the delineated area
psa_code |The PSA code (3 character string) of PSA encompassing the delineated area
psa_name | The PSA name (character string) of the PSA encompassing the delineated area
hr_code	 | The HR code (2 character string) of the HR encompassing the delineated area
hr_name	| The HR name (character string) of the HR encompassing the delineated area
dauid_code | The DAU identification code (8 character string), which is a concatenation of the HR_CODE, PSA_CODE, and DAU_CODE.   
pa_no | The California Planning Update area number (6 character number).

The most current version of the DAU's were supplied by the *California
Department of Forestry and Fire Protection*.  Please see the ```src```
directory for a copy of that data.  The intent of this repository is
to; provide a discoverable location for the data, provide a geojson
format, and standardize the dataset from update to update.


# Updates 

## 2012 Deatail County update.

Detailed Analysis Unit-DAU Convergence via County Boundary cnty24k09,
(*See metadata for cnty24k09, Cal-Atlas), State of California. The
existing DAU boundaries were clipped via Cal-Atlas cnty24k09 by
Michael L. Serna, NRO via ArcMap 10. DAU’s were sent out to: Northern
Region Office (NRO), North Central Region Office (NCRO), South Central
Region Office (SCRO) and Southern Region Office (SRO)
respectively. Collaboration was by Department of Water Resources,
Region Office personnel, Michael L. Serna, NRO, Jason Harbaugh - NCRO,
Cynthia Moffett - SCRO and Robert Fastenau - SRO with the final merge
of all data into a cohesive workable dataset completed by Michael
L. Serna - NRO, Land and Water Use Section.

Existing DAU feature class boundaries contained a multitude of variant
sliver acreages along all DAU and county boundary lines through-out
the State of California.Each region office was sent their respective
‘clipped’ features where they ‘exploded’ each county to expose the
DAU’s sliver anomalies. They subsequently merged the variant slivers
into the proper DAUs. Upon completion, the DAU feature classes were
sent back to Michael L. Serna, NRO where they were merged back
together, ‘Unioned’ to the cnty24k09 State Boundary and ‘exploded’ to
expose DAU/State of California boundary slivers. These features are
reachable by County\DAU. This allows the county boundaries, the DAU
boundaries and the State of California Boundary to match Cal-Atlas
cnty24k09.

Extremely detailed descriptions of boundary changes made for different
versions are provided in the Process Step metadata section. More
general version notes are provided here;

Please see the metadata file in the src directory for more
information.

## California DWR Detailed Analysis Units (2003)

In the past DWR has maintained a listing of California's Detailed
Analysis Units (DAUs) used by the state for water planning.  While
still avialable, this data is harder to find online.  This repository
maintains a copy of the dau original source files, as well as a few
alternate formats.

This dataset is the DWR Version 20, December 2003.

### Process

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





