#!/bin/bash
  
dir=/global/cscratch1/sd/sglanvil/archive/e3smv1.20TR_CMIP6.ne30_oECv3_ICG.LE-v1.0365.004/

for fil in $(find $dir -type f); do
        echo $fil
        cat $fil | head -n 0
        echo -------------------------
done

echo DONE
