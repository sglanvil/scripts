#!/bin/bash

# ------------------- USER SPECIFY BELOW -------------------
case=e3smv1.20TR_CMIP6.ne30_oECv3_ICG.LE-v1.0210.001
src=/global/cscratch1/sd/nanr/archive/$case/
dest=/global/cfs/cdirs/mp9/archive/e3smv1/$case/
# ------------------- USER SPECIFY ABOVE -------------------

for fullSrc in $(find $src -name '*' -type f); do
        file=$(sed -e 's/.*\///' <<< $fullSrc)
        middlePath=$(sed -e "s~$src~~" <<< $fullSrc | sed -e "s/$file//")
        echo $fullSrc
        hashSrc=$(md5sum $src/$middlePath/$file | cut -d " " -f1) # get hash of src file
        if [ -f "$dest"/"$middlePath"/"$file" ]; then # make sure dest file exists
                hashDest=$(md5sum $dest/$middlePath/$file | cut -d " " -f1) # then get hash of dest file
                # echo $hashSrc
                # echo $hashDest
                if [[ "$hashSrc" == "$hashDest" ]]; then
                        # echo "okay to remove source file"
                        ls $src/$middlePath/$file >> removeList_nanr
                else
                        ls $src/$middlePath/$file >> keepList_nanr
                        # echo "do NOT remove source file (dest file is corrupt)"
                fi
        else
                ls $src/$middlePath/$file >> keepList_nanr
                # echo "do NOT remove source file (dest file does not exist)"
        fi
        echo --------------------------
done