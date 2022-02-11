# AutoLISP routines used for automating common CNC drawing paths
These are LISP routines created for AutoCAD to speed up production work of drawing paths for the postprocessor conversion.
Worked on this between 1995-1998 (based on last modified date) using AutoCAD v12-14?. It is unknown if this works in current versions but maybe useful to do someone needing to something similiar.

## CONNECT.LSP
cv - connect rectangular shapes together for burning machines. This was used to create a path between 2 non-circular shapes and include a lead in and lead out of each part (used to minimize piercing which wears down the consumables).

## CR.LSP
- cr - creates a lead in and lead out for cnc path .5 inches long
- re - creates a rectangle
- fl - copys gcode file out to B: drive (Floppy <- yep this is that old)
- out2text - renames a file from .out to .txt
- note - predefined text/formatting

## DISK.LSP
- newby - hard to rememeber what this is for but appears to save the file with metal type, thickness and program number. Looks like it then does a 'Save As' for Release 14

## FIG.LSP
- fig - 

## FIG1.LSP
- fig - 

## LOOP.LSP
- lp - 

## MO.LSP
- mo - multiple offset - line to be offset is selected then the side to offset to and then use enters in each dimension to offest to without having to go through reseelecting the line and side

## NCPR12.MNU
AutoDesk template for digitizer customized for these lisp routines

## NEWBY.LSP
- newby - 

## PAGE1.LSP

## REM.LSP
## REM1.LSP
## REMBRADT.LSP
## ROLL.LSP
## ROLL1.LSP
## TOOLSCRB.LSP
## TRACKER1.LSP
