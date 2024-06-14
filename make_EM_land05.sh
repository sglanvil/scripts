#!/bin/bash
# location:

module load nco

destDir=/glade/derecho/scratch/sglanvil/holdingCell/S2S_land05/

srcDir=/glade/derecho/scratch/ssfcst/cesm2cam6_land0.5/
caseName=cesm2cam6_land0.5
#srcDir=/glade/campaign/cesm/development/cross-wg/S2S/CESM2/S2SHINDCASTS/
#caseName=cesm2cam6v2

iyear=2021
dateArray=(03may2021 10may2021 17may2021 24may2021 31may2021 07jun2021 14jun2021 21jun2021 28jun2021 05jul2021 12jul2021 19jul2021 26jul2021)

for idate in "${dateArray[@]}"; do
        echo $idate
        imonth=$(date -d $idate +"%m")
        ncea -O ${srcDir}/p1/tas_2m/${iyear}/${imonth}/*${idate}* ${destDir}/tas_2m_${caseName}_${idate}_00z_d01_d46_EM.nc
done
