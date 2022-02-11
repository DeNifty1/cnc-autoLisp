;;;*********************
;;;* Figure 12 Drawing *
;;;*  Created 8/23/96  * 
;;;*********************

(defun c:fig ( / pt11 tem tem1) 
     (graphscr)
     (setq tem  (getvar "osmode"))
     (setq tem1 (getvar "pickbox"))
     (setvar "osmode" 0)
     (setvar "pickbox" 0)
     (setq pt11 (getpoint "\nInsertion Point: "))
     (setq lg (getdist "\nWhat is the LENGTH of bracket? "))
     (setq wd 6.0)
     (setq bc (- lg 0.75))
     (setq cd 3.25)
;;; Will draw rectangle of bracket
     (setq pt12 (polar pt11 (/ pi 2.0) wd))
     (setq pt13 (polar pt12 0.0 bc))
     (setq pt14 (polar pt13 (* pi 1.5) wd))
     (command "line" pt11 pt12 pt13 pt14 "c")
;;; Obtain side AB & rectangles       
      (if (<= lg 43.0)
           (progn
           (setq ab 7.50)
           (setq len "7.75")
           )
           (if (<= lg 57.0)
                (progn
                (setq ab 9.50)
                (setq len "9.75")
                )
                (if (<= lg 72.0)
                     (progn
                     (setq ab 11.50)
                     (setq len "11.75")
                     )
                )
           ) 
      )   
     (setq a (car pt11)) (setq b (+ 10.0 (cadr pt11)))
     (setq pt11 (list a b))   
;;; Will draw gusset part of bracket     
     (setq pt12 (polar pt11 (/ pi 2.0) ab))
     (setq pt13 (polar pt12 0.0 bc))
     (setq pt14 (polar pt13 (* pi 1.5) cd))
     (command "line" pt11 pt12 pt13 pt14 "c")
     (setvar "osmode" tem)
     (setvar "pickbox" 6)
     (print (strcat "ONE INCH SHOULD BE 6 X " len))
)
