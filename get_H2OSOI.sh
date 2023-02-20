#!/bin/bash
# created: February 20, 2023
# located: /glade/campaign/cesm/development/cross-wg/S2S/sglanvil/forSanjiv/H2OSOI_climoOCNclimoATM

module load nco

case=climoOCNclimoATM

dir=/glade/campaign/cesm/development/cross-wg/S2S/CESM2/S2SHINDCASTS${case}/postprocess/lnd/
dest=/glade/campaign/cesm/development/cross-wg/S2S/sglanvil/forSanjiv/H2OSOI_${case}/
mkdir -p ${dest}

for source in $dir/cesm2cam6${case}v2.*.00.clm2.h0.*.nc; do # just copy over member 00
        filename=$(sed -e 's/.*\///g' <<< $source)
        date=$(sed -e 's/.*clm2\.h0\.//g' <<< $source | sed -e 's/\.nc//g')
        echo $date
        ncks -O -v H2OSOI,ZSOI,DZSOI,lon,lat,landmask,landfrac,area,levgrnd,time,mcdate -d time,0 ${source} ${dest}/H2OSOI_cesm2cam6${case}v2.00.clm2.h0.${date}_time0.nc
        ncks -O -v H2OSOI,ZSOI,DZSOI,lon,lat,landmask,landfrac,area,levgrnd,time,mcdate -d time,5 ${source} ${dest}/H2OSOI_cesm2cam6${case}v2.00.clm2.h0.${date}_time5.nc
        echo
done

# concatenate the forecasts
ncecat -O ${dest}/*_time0* ${dest}/H2OSOI_cesm2cam6${case}v2.00.clm2.h0.ALL.time0.nc
ncecat -O ${dest}/*_time5* ${dest}/H2OSOI_cesm2cam6${case}v2.00.clm2.h0.ALL.time5.nc

# squeeze the degenerate time dimension
ncwa -O -a time ${dest}/H2OSOI_cesm2cam6${case}v2.00.clm2.h0.ALL.time0.nc ${dest}/H2OSOI_cesm2cam6${case}v2.00.clm2.h0.ALL.time0.nc
ncwa -O -a time ${dest}/H2OSOI_cesm2cam6${case}v2.00.clm2.h0.ALL.time5.nc ${dest}/H2OSOI_cesm2cam6${case}v2.00.clm2.h0.ALL.time5.nc
