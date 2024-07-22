# run on casper
set -e

# location: /glade/work/sglanvil/CCR/yeager/loop_years.sh

# There are two scripts total: loop_years.sh and concat_SMYLE_DP.sh

# Specify: ivar, imonth, destDir, and start/end years in this script
# Specify: account key (eg, CESM0021) in concat_SMYLE_DP.sh script
# Logon to casper, then submit like this: bash loop_years.sh

ivar=TREFHT
imonth=11
destDir=/glade/derecho/scratch/sglanvil/SMYLE_DP_files/

export destDir
export ivar
export imonth
for iyear in {1958..1960}; do
        export iyear
        qsub -v iyear,ivar,imonth,destDir concat_SMYLE_DP.sh
done
