(defun new_rem()			;;; Function for creating new remnant drawing
(command "new" rem_num)	;;;TODO: change prototype drawing also to remnant template 
)

(defun addto_rem()		;;; Function for adding to existing remnant drawing

)

(defun c:tracker ()

	(setq rem_num  (getstring "\nEnter remnant number: ") )
	(setq rem_file (strcat rem_num ".dwg") )
	(if (/= rem_file (is not in network drive) )
		(new_rem)
		(addto_rem)
	 )
	(setq )



)