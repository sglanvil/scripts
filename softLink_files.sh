#!/bin/bash

# script located on Cheyenne: /glade/scratch/sglanvil/forJinbo

var=QRL
dir=/glade/campaign/cesm/development/cvcwg/cvwg/L83/timeseries/
dest=/glade/scratch/sglanvil/forJinbo/

for ibase in f.e21.FHIST_BGC.f09_f09_mg17.L83_cam6 f.e21.FHIST_BGC.f09_f09_mg17.L83_cam6_nudging f.e21.FHIST_BGC.f09_f09_mg17.L83_cam6_nudging_clim; do
        for imember in {001..003}; do
                icase=$ibase.$imember
                source=`ls $dir/$icase/atm/proc/tseries/month_1/*.$var.*`
                echo $source
                filename=$(sed -e 's/.*\///g' <<< $source)
                echo $filename
                echo 
                ln -s $source $dest/$filename
        done
done

