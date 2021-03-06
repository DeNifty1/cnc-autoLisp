;;      mo = multiple offset
(defun c:mo(/ obj pnt off1 off2 test)
	(setq obj (entsel "\nPick datum line to offset by:"))
	(setq pnt (getpoint "\nSide to offset to?"))
	(setq off1 (getstring "\nEnter offset distance:"))
	(command "offset" off1 obj pnt "")
	(setq test 0)
	(while (/= test nil)
		(setq off2 (getstring "\nEnter offset distance:"))
		(command "offset" off2 obj pnt "")
		(if (= off2 "")
			(setq test nil)
			(setq test 1)
		)
	)
)
