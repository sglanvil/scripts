#!/bin/bash
# Use: changes the global attributes ("input_file" description)
# Note: you can also run this over good files and it won't mess them up
# (it fixes the wrong files, and just leaves the correct files alone)

module load nco

for imember in 0111 0121 0131 0141; do
        dir=/glade/campaign/cgd/ccr/E3SMv2/FV_regridded/v2.FV1.historical_${imember}/atm/proc/tseries/day_1
        for ifile in $dir/*.nc; do
                inputFileBad=$(ncdump -h $ifile | grep input_file)
                path=$(sed -e 's/:input_file = "//g' <<< $inputFileBad | sed -e 's#/[^/]*$##' )
                lastPartBad=$(sed -e 's/.*\///g' <<< $inputFileBad | sed -e 's/" ;//g');
                lastPartFixed=$(sed -e 's/20150101/18500101/g' <<< $lastPartBad | sed -e 's/21001231/20141231/g') ;
                inputFileFixed=$path/$lastPartFixed
                echo $lastPartBad
                echo $lastPartFixed
                echo $inputFileFixed
#               ncatted -O -h -a input_file,global,o,c,$inputFileFixed $ifile
                echo
        done
done

