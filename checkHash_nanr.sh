#!/bin/bash

# This script creates a file listing of all files ready to be deleted.
# These files exist as duplicates, present on both $src and $dest directories.
# This script checks all archive files (all components, even non-hist subdirectories).
# This script uses MD5 hashes, checking size and corruption.

# ------------------------- SETUP --------------------------
# ssh dtn02
# nohup bash checkHash_nanr.sh > checkHash_out 2>&1 &
# (will continue/finish, even after lost connection)
# This script creates 1-2 text files: removeList_nanr and keepList_nanr
# Then you can run this commmand: cat removeList_nanr | xargs rm
# Then you can rerun this checkHash_nanr.sh script to see if anything remains.
# ----------------------------------------------------------

# ------------------- USER SPECIFY BELOW -------------------
case=e3smv1.20TR_CMIP6.ne30_oECv3_ICG.LE-v1.0210.001
src=/global/cscratch1/sd/nanr/archive/$case/
dest=/global/cfs/cdirs/mp9/archive/e3smv1/$case/
# do this if you want to empty the files:
echo > removeList_nanr
echo > keepList_nanr
# ------------------- USER SPECIFY ABOVE -------------------

for fullSrc in $(find $src -name '*' -type f); do
        file=$(sed -e 's/.*\///' <<< $fullSrc)
        middlePath=$(sed -e "s~$src~~" <<< $fullSrc | sed -e "s/$file//")
        echo $fullSrc
        hashSrc=$(md5sum $src/$middlePath/$file | cut -d " " -f1) # get hash of src file
        if [ -f "$dest"/"$middlePath"/"$file" ]; then # make sure dest file exists
                hashDest=$(md5sum $dest/$middlePath/$file | cut -d " " -f1) # then get hash of dest file
                if [[ "$hashSrc" == "$hashDest" ]]; then
                        ls $src/$middlePath/$file >> removeList_nanr # OKAY to remove src file
                else
                        ls $src/$middlePath/$file >> keepList_nanr # do NOT remove src file (dest file is corrupt)
                fi
        else
                ls $src/$middlePath/$file >> keepList_nanr # do NOT remove src file (dest file does not exist)
        fi
done


