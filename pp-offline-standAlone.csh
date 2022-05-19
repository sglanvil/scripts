#!/bin/csh 
# originally made by nanr
# significant edits by sglanvil

mkdir -p /glade/scratch/sglanvil/post-proc/
setenv CESM2_TOOLS_ROOT /glade/work/nanr/cesm_tags/CASE_tools/cesm2-sf/
setenv DOUT_S_ROOT  /glade/scratch/cesmsf/archive/
setenv CASEROOT /glade/scratch/sglanvil/post-proc/

module load ncl nco
module use /glade/work/bdobbins/Software/Modules
module load cesm_postprocessing

set start_mbr =  4
set end_mbr =  10
foreach mbr ( `seq $start_mbr $end_mbr` )
        set mbr_padZeros = `printf %03d $mbr`
        set CASE = b.e21.BHISTcmip6.f09_g17.CESM2-SF-xAER.${mbr_padZeros}
        mkdir -p $CASEROOT/$CASE
        cd $CASEROOT/$CASE
        if ( ! -d "postprocess" ) then
           create_postprocess -caseroot=`pwd`
        endif
        cd postprocess
        cp $CESM2_TOOLS_ROOT/pp/env_timeseries.xml $CASEROOT/$CASE/postprocess
        pp_config --set TIMESERIES_OUTPUT_ROOTDIR=/glade/collections/cdg/timeseries-cmip6/$CASE
        pp_config --set CASE=$CASE
        pp_config --set DOUT_S_ROOT=$DOUT_S_ROOT/$CASE
        pp_config --set ATM_GRID=0.9x1.25
        pp_config --set LND_GRID=0.9x1.25
        pp_config --set ICE_GRID=gx1v7
        pp_config --set OCN_GRID=gx1v7
        pp_config --set ICE_NX=320
        pp_config --set ICE_NY=384
        cp $CESM2_TOOLS_ROOT/pp/timeseries $CASEROOT/$CASE/postprocess
end

