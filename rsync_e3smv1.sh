#!/bin/bash

# STEP ONE: ssh dtn02
# STEP TWO: add this cronjob to list, type "crontab -e", add this line (with no #)
# 00 06 * * * bash -l /global/homes/s/sglanvil/rsync_e3smv1.sh 1> rsync_e3smv1.out 2>&1

# https://docs.nersc.gov/systems/dtn/#access
# https://docs.nersc.gov/jobs/workflow/workflow_nodes/

# --------------- USER SPECIFY ---------------
case=e3smv1.20TR_CMIP6.ne30_oECv3_ICG.LE-v1.0365.004
# --------------- USER SPECIFY ---------------

src=/global/cscratch1/sd/$USER/archive/$case/
dest=/global/cfs/cdirs/mp9/archive/e3smv1/$case/

mkdir -p $dest

rsync -avz --no-perms --no-owner --no-group --no-times --size-only $src $dest
