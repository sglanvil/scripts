#!/bin/bash

# Author: Sasha Glanville (sglanvil@ucar.edu)

# run as "cesmsf"
whoami

archiveDir=/glade/scratch/cesmsf/archive/
caseName=b.e21.BHISTcmip6.f09_g17.CESM2-SF-xAER

for imember in {004..010}; do
        echo $archiveDir/$caseName.$imember/ocn/hist/
        cd $archiveDir/$caseName.$imember/ocn/hist/
        rename "5day" "nday5" *.5day.*
done

