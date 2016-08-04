#! /usr/bin/make -f

include configure.mk

schema:=public

DEFAULT: detailed_analysis_units.geojson shp

# We need the California Counties to make
# the DAUCO layer as well.
caco.shp:=california-counties-1.0.0/shp/california_counties.shp
${caco.shp}:version:=v1.0.0
${caco.shp}:tgz:=v1.0.0.tar.gz
${caco.shp}:git:=https://github.com/CSTARS/california-counties/archive
${caco.shp}:${tgz}
	[[ -f ${tgz} ]] || wget ${git}/${tgz};\
	tar -xzf ${tgz};

postgis:: ${caco.shp}
	${OGR} -overwrite -a_srs 'epsg:3310' -nlt PROMOTE_TO_MULTI ${caco.shp};
	${PG} -c 'alter table california_counties rename wkb_geometry to boundary'

# Converting to WGS84 is a more accepted GEOJSON format.
detailed_analysis_units.geojson: src/daus.vrt src/dau_2012.shp
	ogr2ogr -f GEOJSON  -t_srs WGS84 $@ $<

# Here's an Example of materializing that VRT file, for example to
# upload to Google Maps.
shp: src/daus.vrt
	ogr2ogr $@ $<

# Additionally, we may want to show alternative import strateigies.
# This rule will create a PostGIS version in ${schema}
.PHONY: postgis
postgis:: src/daus.vrt src/dau_2012.shp 
	${OGR} -overwrite -a_srs 'epsg:3310' src/daus.vrt
	${PG} -c 'alter table detailed_analysis_units rename wkb_geometry to boundary'


# Create the dauco data.
.PHONY: dauco
dauco: dauco.geojson shp/dauco.shp

dauco.geojson:
	${PG} -f src/dauco.sql
	ogr2ogr -nlt POLYGON -a_srs epsg:3310 -t_srs epsg:4326  -f GEOJSON -overwrite dauco.geojson  PG:"service=${service}" dauco

shp/dauco.shp:dauco.geojson
	ogr2ogr -nlt POLYGON -a_srs epsg:3310 -overwrite shp/dauco.shp  PG:"service=${service}" dauco


# In order to use our PostGIS import, we include some standard
# configuration file.  This is pulled from a specific version, as a
# github GIST.  This, we probably don't save in our repo.  Want users
# to see where it came from.  Update to newer version if required.
configure.mk:gist:=https://gist.githubusercontent.com/qjhart/052c63d3b1a8b48e4d4f
configure.mk:
	wget ${gist}/raw/e30543c3b8d8ff18a950750a0f340788cc8c1931/configure.mk

# Some convience functions for testing and repreoducing
dist-clean:
	rm -rf configure.mk shp *.geojson 

