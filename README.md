# AutoLISP routines used for automating common CNC drawing paths
These are LISP routines created for AutoCAD to speed up production work of drawing paths for the postprocessor conversion.
Worked on this between 1995-1998 (based on last modified date) using AutoCAD v12-14?. It is unknown if this works in current versions but maybe useful to someone needing to something similiar.

## CONNECT.LSP
cv - connect rectangular shapes together for burning machines. This was used to create a path between 2 non-circular shapes and include a lead in and lead out of each part (used to minimize piercing which wears down the consumables).

## CR.LSP
- cr - creates a lead in and lead out for cnc path .5 inches long
- re - creates a rectangle
- fl - copys gcode file out to B: drive (Floppy <- yep this is that old)
- out2text - renames a file from .out to .txt
- note - predefined text/formatting

## DISK.LSP
newby - Similar to the NEWBY.LSP code but uses a dialog box

## FIG.LSP & FIG1.LSP
fig - looks like this code draws a particular gusset 

## LOOP.LSP
- lp - ???

## MO.LSP
- mo - multiple offset - line to be offset is selected then the side to offset to and then use enters in each dimension to offest to without having to go through reseelecting the line and side

## NCPR12.MNU
AutoDesk template for digitizer customized for these lisp routines

## NEWBY.LSP
newby - hard to rememeber what this is for but appears to save the file with metal type, thickness and program number. Looks like it then does a 'Save As' for Release 14

## PAGE1.LSP
page1 - edits something on the screen most like likely a date in the title block

## REM.LSP & REM1.LSP & REMBRADT.LSP
REMBRADT.LSP appears to be most addvanced version of rem command
rem - command to determine area left from scarp after parts are removed. Used to estimate scrap rate

## ROLL.LSP & ROLL1.LSP
ROLL1.LSP is minimized version of ROLL.LSP

## TOOLSCRB.LSP
- mk - Shrinks an object .05" overall
- re - Rectangle drawer
- mm - Mirrors an object twice
- sm - Converts windowed metric drawing to English units

## TRACKER1.LSP
tracker - incomplete function for tracking remnants
