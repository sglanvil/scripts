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
### Find and exec
```
Just search Jan-01 files, because of the repeats:
find *-01-01-00000 -name "*clm2.h0.*" -type f -exec cp {} /glade/campaign/cesm/development/cross-wg/S2S/sanjiv/climo/ \;
```
