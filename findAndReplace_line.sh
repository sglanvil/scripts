#!/bin/bash

# Author: Sasha Glanville (sglanvil@ucar.edu)

case=b.e21.BHISTcmip6.f09_g17.CESM2-SF-xAER

for imember in {004..010}; do
        newCase=$case.$imember
        cd /glade/scratch/sglanvil/post-proc/$newCase/postprocess/
        pwd
        sed -i "s/CASE=b.e21.BHISTcmip6.f09_g17.CESM2-SF-xAER.004/CASE=$newCase/g" timeseries
        sed -i "s/nanr/sglanvil/g" timeseries
done

