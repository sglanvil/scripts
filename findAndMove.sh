#!/bin/bash

# do as user "cesmsf"

archiveDir=/glade/scratch/cesmsf/archive/

for imember in {004..010}; do
        echo ${imember}
        origDir=${archiveDir}/b.e21.BHISTcmip6.f09_g17.CESM2-SF-xAER.${imember}/
        trashDir=${archiveDir}/b.e21.BHISTcmip6.f09_g17.CESM2-SF-xAER.${imember}_trash/
        mkdir -p ${trashDir}
        for fullSrc in $(find ${origDir} -name "*2015*" -type f -not -path */rest/*); do        # OPTION 1: exclude rest subdir
#        for fullSrc in $(find ${origDir} -name "*2015*" -type f); do                           # OPTION 2: include all subdirs
                file=$(sed -e 's/.*\///' <<< ${fullSrc})
                middlePath=$(sed -e "s~${origDir}~~" <<< ${fullSrc} | sed -e "s/$file//")
                mkdir -p $trashDir/$middlePath/
                mv $fullSrc $trashDir/$middlePath/
        done
done
