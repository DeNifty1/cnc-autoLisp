(defun c:newby ( / type matthk mat1 mat2 prognum save1 save2)
	(setq type (getstring "\nType of material: 0=316L 1=A-36 2=Al 3=Deck 4=304L: "))
	(setq matthk (getstring "\nEnter three number material thickness: "))
	(setq prognum (getstring "\nPlease enter Program Number: "))
	(setq save1 (strcat type matthk prognum))
		(if (= type "0")
			(progn
			(setq mat1 "316L STAINLESS STEEL") 
			(setq mat2 "S")
			)
		)
		(if (= type "1")
			(progn
			(setq mat1 "A-36 MILD STEEL") 
			(setq mat2 "A")
			)
		)
		(if (= type "2")
			(progn
			(setq mat1 "ALUMINUM") 
			(setq mat2 "L")
			)       
		)
		(if (= type "3")
			(progn
			(setq mat1 "ALUM DECK PLATE") 
			(setq mat2 "D")
			)
		    )
		(if (= type "4")
			(progn
			(setq mat1 "304L STAINLESS STEEL") 
			(setq mat2 "S")
			)
		)
	
	(setq save2 (strcat mat2 matthk prognum))
	(command "text" (strcat "30,140") 7.0 0 
		(strcat save1 " DISK  PLATE# " matthk " " mat1 "") 
	)
	(command "saveas" "r14" save2)
)  
  
