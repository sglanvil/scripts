#!/bin/bash

# Author: Sasha Glanville (sglanvil@ucar.edu)

# change the access time without using "touch" (loophole, I guess)
  
#dir=/global/cscratch1/sd/sglanvil/archive/e3smv1.20TR_CMIP6.ne30_oECv3_ICG.LE-v1.0365.004/
dir=/global/cscratch1/sd/sglanvil/E3SMv1_simulations/

for fil in $(find $dir -type f); do
        echo $fil
        cat $fil | head -n 0
        echo -------------------------
done

echo DONE
