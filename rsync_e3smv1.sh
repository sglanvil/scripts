#!/bin/bash

# --------------- USER SPECIFY ---------------
case=e3smv1.20TR_CMIP6.ne30_oECv3_ICG.LE-v1.0365.004
# --------------- USER SPECIFY ---------------

src=/global/cscratch1/sd/$USER/archive/$case/
dest=/global/cfs/cdirs/mp9/archive/e3smv1/$case/

mkdir -p $dest

rsync -avz --no-perms --no-owner --no-group --no-times --size-only $src $dest
