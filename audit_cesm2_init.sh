#!/bin/bash
# location: /glade/work/sglanvil/CCR/audit
# May 29, 2024 | sglanvil

dirA="/glade/campaign/cesm/development/espwg/SMYLE-CASES/CESM2-SMYLE/inputdata/cesm2_init/"
dirB="/glade/campaign/cesm/development/espwg/SMYLE/inputdata/cesm2_init/"

filesA=$(find $dirA -type f)

for fullFilePath in $filesA; do
        result=$(echo $fullFilePath | awk -F'cesm2_init/' '{print $2}')
        if [ ! -f "$dirB$result" ]; then
                echo $dirB$result
        fi
done > missingFiles_for_cesm2init.txt

echo "...Search Finished..." >> missingFiles_for_cesm2init.txt

