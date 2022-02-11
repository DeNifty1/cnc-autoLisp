(defun dtr (a)
	(* pi (/ a 180.0))
)

;;Function for dimensioning multiple circles
(defun dimcir()
	(command "layer" "set" "dimension" "")
	(setvar "dimscale" 6)
	(setq cir_rad (/ cir_dia 2))
	(setq p2 (polar p1 (dtr count) cir_rad))
	;;(princ cir_rad)(princ p1)(princ p2)(princ count)
	(setvar "pickbox" 6)
	(command "dim")(command "diameter" p2 "" 3)(command "exit") 
	(command "layer" "set" "object" "")
)
(defun lastarray()
	(command "array" "l" "" "p" p1 numholes "" "")
)

;;? Polar array of circular bolt holes
(defun holearray()
	(setq numhole (getstring "\nHow many holes? "))
	(setq numholes (atoi numhole))
	(setq boltdia (getreal "\nDiameter of holes: "))
	(setq radcen (getdist "\nRadius from center: "))
	(setq caption1 (getstring "\nEnter description: "))
	(setq caption (strcat "%%c" caption1 " " numhole " TIMES"))
	(setq p3 (list (car p1) (+ (cadr p1) radcen)) ) ;;p3 = cen of arrayed holes
	(setq boltrad (/ boltdia 2))
	(setq p4 (list (+ (car p3) boltrad) (cadr p3))) ;;p4 = delta x of p3
	(setq p5 (polar p3 (dtr 45) boltrad))		;;p5 = polar movement off p3
	(command "circle" p3 "d" boltdia)(lastarray)
	(command "layer" "set" "dimension" "")
	;;(setvar "dimscale" 4)
	(command "dim")(command "diameter" p5 caption 5)(command "exit") 
	;;(command "layer" "set" "center" "")
	;;(command "dim")(command "center" p4)(command "exit")
	;;(setvar "pickbox" 0)
	;;(setq sidemove 0.05)
	;;(setq p6 (list (+ (car p3) sidemove) (cadr p3)))
	;;(command "array" p6 "" "p" p1 numholes "" "")
 	;;(command "line" p1 p4 p5 "")
	(command "layer" "set" "object" "")
)

(defun c:roll( / tmp_osnap tmp_pbox cir_dia test)
	(graphscr)
	(command "layer" "set" "object" "")
	(setq tmp_osnap (getvar "osmode"))
	(setq tmp_pbox (getvar "pickbox"))
	(setq tmp_dimscale (getvar "dimscale"))
		;;(setq tmp_ (getvar ""))
		;;(setq tmp_ (getvar ""))
	(setvar "osmode" 4)     ;;osnap cen
	(setvar "pickbox" 0)
	(setvar "dimscale" 6)
	
	;;Pick center of ring
	(setq p1 (getpoint "\nPick center point of ring:"))
	(setvar "osmode" 0)     ;;osnap none
	
	;;Enter values for Diameters to be used
	;;Loop until no additional circles
	;;after first circle diameter set default to <ENTER> (or done)
	(setq cir_dia (getdist "\nEnter Diameter: "))
	(command "circle" p1 "d" cir_dia) 
	(setq count 10)
	(dimcir)
	(while (/= cir_dia nil)
		(setq cir_dia (getstring "\nEnter Diameter: "))
		(if (/= cir_dia "")
			(progn
				(setq cir_dia (atof cir_dia)) 
				;;"atof" converts string var to real number
				(command "circle" p1 "d" cir_dia)
				(setq count (+ count 15))
				(dimcir) 
			)
			(setq cir_dia nil)
	       )
	)
	(holearray)

	;;Reset original values
	(setvar "osmode" tmp_osnap)
	(setvar "pickbox" 6)
	;;(setvar "pickbox" tmp_pbox)
	(setvar "dimscale" tmp_dimscale)

)
