# This Makefile generates files for printing SCAD documents
# Copyright (C) 2016  Kenneth Barbour | kenbarbour.com
# License: GNU GPL v3 (or later)
## make all		Generate STL for each SCAD file
## make gcode		Generate gcode for each SCAD file

## SCAD Compiler
SCADC?=openscad

## Slicing program
SLICER?=slic3r

STL_TARGETS = $(patsubst %.scad,%.stl,$(wildcard *.scad))
GCODE_TARGETS = $(patsubst %.scad,%.gcode,$(wildcard *.scad))

.PHONY: all models gcode clean
all: models gcode
models: $(STL_TARGETS)
gcode: $(GCODE_TARGETS)

%.stl: %.scad
	$(SCADC) -o $@ $<

%.gcode: %.stl
	$(SLICER) $< -o $@

clean:
	rm -f *.stl *.gcode