#!/bin/bash
#PBS -N SMYLE_concat 
#PBS -A CESM0021 
#PBS -l select=1:ncpus=1:mem=10GB
#PBS -l walltime=06:00:00
#PBS -k eod
#PBS -j oe
#PBS -q casper
#PBS -m abe

# location: /glade/work/sglanvil/CCR/yeager/concat_SMYLE_DP.sh

module load nco
for imember in {011..030}; do
        case=b.e21.BSMYLE.f09_g17.${iyear}-${imonth}.${imember}
        dirSMYLE=/glade/campaign/cesm/development/espwg/SMYLE/archive/${case}/atm/proc/tseries/month_1/
        dirDP=/glade/campaign/cesm/development/espwg/CESM2-DP/timeseries/${case}/atm/proc/tseries/month_1/
        if [ ! -d ${dirSMYLE} ] || [ ! -d ${dirDP} ]; then
                echo ${iyear} ${imember} "directory does not exist <skipping>"
                continue
        fi
        echo ${iyear} ${imember}
        file1=$(ls ${dirSMYLE}*.${ivar}.${iyear}*)
        file2=$(ls ${dirDP}*.${ivar}.$((iyear+2))*)

        file1BEGIN=${file1: -16:6}
        file1END=${file1: -9:6}
        file2BEGIN=${file2: -16:6}
        file2END=${file2: -9:6}

        basename1=$(basename ${file1})
        outFile=${destDir}/${basename1:0:-9}${file2END}.nc
        if [[ ${file1END} = ${file2BEGIN} ]]; then
                # ------ OVERLAP ------
                ncks -O -d time,1,98 ${file2} ${destDir}/temp_${iyear}_${imonth}.nc
                ncrcat -O ${file1} ${destDir}/temp_${iyear}_${imonth}.nc ${outFile}
                rm ${destDir}/temp_${iyear}_${imonth}.nc
        else
                # ------ NO OVERLAP ------
                ncks -O -d time,0,97 ${file2} ${destDir}/temp_${iyear}_${imonth}.nc
                ncrcat -O ${file1} ${destDir}/temp_${iyear}_${imonth}.nc ${outFile}
                rm ${destDir}/temp_${iyear}_${imonth}.nc
        fi
        timeLength=$(ncdump -h ${outFile} | grep UNLIMITED | grep -o '[0-9]*')
        if [ ${timeLength} != 122 ]; then
                echo ${iyear} ${imember} "is not the corret time length"
        fi
done

exit
