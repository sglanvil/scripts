# scripts

## Cylc Notes
```
ps -ef | grep sglanvil
kill <PID>
https://cylc.discourse.group/t/cylc-scan-and-cylc-kill/281/3
```
## Sed Notes
```
http://sed.sourceforge.net/sedfaq4.html#:~:text=In%20sed%2C%20the%20dollar%20sign,to%20expand%20the%20variables%20properly.
https://stackoverflow.com/questions/27787536/how-to-pass-a-variable-containing-slashes-to-sed
```
## Find and Exec Notes
```
For the S2S realtime stand-alone land run:
(just search Jan-01 files, because of the repeats)
find *-01-01-00000 -name "*clm2.h0.*" -type f -exec cp {} /glade/campaign/cesm/development/cross-wg/S2S/sanjiv/climo/ \;
find *-01-01-00000 -name "*.clm2.h0.*" -type f -exec cp {} /glade/campaign/cesm/development/cross-wg/S2S/sanjiv/regular/ \;
```
```
Find and rename (sub)directories recursively 
(/glade/campaign/cesm/development/cross-wg/S2S/CESM2/)
find . -depth -name "*climoALL*" -type d -exec rename "climoALL" "climoATMclimoLND" {} \;
```
```
Find and rename files recursively
(/glade/campaign/cesm/development/cross-wg/S2S/CESM2/)
find . -name "*climoALL*" -type f -exec rename "climoALL" "climoATMclimoLND" {} \;
```
## Execcasper Notes
```
execcasper -l walltime=24:00:00 --mem=100G
```
### NCO Notes
```
Remove degenerate (size=1) dimension with NCO (like matlab’s squeeze)
Example: assume time is the degenerate variable…
ncks -C -O -x -v time in.nc out.nc
ncwa -O -a time in.nc out.nc
```
