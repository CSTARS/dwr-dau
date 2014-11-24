#! /usr/bin/make -f

include configure.mk

schema:=public

DEFAULT: geojson/detailed_analysis_units.geojson shp

# Converting to WGS84 is a more accepted GEOJSON format.
geojson/detailed_analysis_units.geojson: src/daus.vrt src/dau_v2_105.shp
	ogr2ogr -f GEOJSON  -t_srs WGS84 $@ $<

# Here's an Example of materializing that VRT file, for example to
# upload to Google Maps.
shp: src/daus.vrt
	ogr2ogr $@ $<

# While we may store the original data in the GITHUB repository, we
# also want to show how we got the data.
src/dau_v2_105.shp:zip:=src/dau_v2_CA105.zip
src/dau_v2_105.shp:url:=http://www.waterplan.water.ca.gov/docs/maps/dau_v2_CA105.zip
src/dau_v2_105.shp:
	[[ -f ${zip} ]] || curl ${url} > ${zip}
	unzip -d src -u ${zip}
	rm ${zip}

# Additionally, we may want to show alternative import strateigies.
# This rule will create a PostGIS version in ${schema}
.PHONY: postgis
postgis: src/daus.vrt src/dau_v2_105.shp 
	${OGR} src/daus.vrt

# In order to use our PostGIS import, we include some standard
# configuration file.  This is pulled from a specific version, as a
# github GIST.  This, we probably don't save in our repo.  Want users
# to see where it came from.  Update to newer version if required.
configure.mk:gist:=https://gist.githubusercontent.com/qjhart/052c63d3b1a8b48e4d4f
configure.mk:
	wget ${gist}/raw/e30543c3b8d8ff18a950750a0f340788cc8c1931/configure.mk

# Some convience functions for testing and repreoducing
clean:
	rm -rf configure.mk shp geojson

clean-all: clean
	rm src/dau_v2_105.*
