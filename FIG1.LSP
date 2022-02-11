;;;*********************
;;;* Figure 12 Drawing *
;;;*  Created 8/23/96  * 
;;;*********************


(defun c:fig ( / pt11 tem tem1) 
     (graphscr)
     (setq tem  (getvar "osmode"))
     (setq tem1 (getvar "pickbox"))
     (setvar "osmode" 2)
     (setvar "pickbox" 0)
     (setq length (getdist "\nWhat is the LENGTH of bracket?"))
     (setq pt11 (getpoint "\nInsertion Point: "))
     (setq wd 6.0)
     (setq bc (- length 0.75))
     (setq cd 3.25)
;;; Will draw rectangle of bracket
     (command
      "line" pt11
      (strcat "@" bc ",0")
      (strcat "@0," wd)
      (strcat "@-" bc ",0")
      (strcat "@0,-" wd)
     ""
     )
;;; Obtain side AB & rectangles       
      (if (<= length 43)
           (progn
           (setq ab 7.50)
           (setq len 7.25)
           )
           (if (<= length 57)
                (progn
                (setq ab 9.50)
                (setq len 9.25)
                )
                (if (<= length 72)
                     (progn
                     (setq ab 11.50)
                     (setq len 11.25)
                     )
                )
           ) 
      )   
;;; Will draw gusset part of bracket     
     (command
      "line" pt11
      (strcat "@0," ab)
      (strcat "@" bc ",0")
      (strcat "@0,-" cd)
      (strcat "c")
      ""
     )
     (command "text" pt11 7.0 0 
          (strcat "ONE INCH SHOULD BE 6 X " LEN "")
     )
)
