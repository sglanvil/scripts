#!/bin/bash

case=e3smv1.20TR_CMIP6.ne30_oECv3_ICG.LE-v1.0365.004

# ---------- only doing /atm/hist/ for now...
src=/global/cscratch1/sd/$USER/archive/$case/atm/hist/
dest=/global/cfs/cdirs/mp9/archive/e3smv1/$case/atm/hist/

for fullSrc in $src/*; do
        file=$(basename $fullSrc)
        echo $file
        hashSrc=$(md5sum $src/$file | cut -d " " -f1) # get hash of src file
        if [ -f "$dest"/"$file" ]; then # make sure dest file exists
                hashDest=$(md5sum $dest/$file | cut -d " " -f1) # then get hash of dest file

                # -------------- FOR TESTING ------------
                # hashDest=d8059ef1d9066223c9fb0e73039ff664 # uncomment this, if you wish to test
                # ---------------------------------------

                echo $hashSrc
                echo $hashDest
                if [[ "$hashSrc" == "$hashDest" ]]; then
                        echo "okay to remove source file"
                        ls $src/$file
                        # rm $src/$file # -------------- WHEN READY, UNCOMMENT THIS LINE
                else
                        echo "do NOT remove source file (dest file is corrupt)"
                fi
        else
                echo "do NOT remove source file (dest file does not exist)"
        fi
        echo --------------------------
done
