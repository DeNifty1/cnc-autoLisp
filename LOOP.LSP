(defun c:lp ( / item rad esel1 ent1 esel2 ent2 ok
                  p1 p2 p3 p4 p5 p6 pint half_ang cl fl)
   (defun item (num ent)
      (cdr (assoc num ent))
   )
   (setvar "cmdecho" 0)
   (initget 7)
      (setq
         rad 0.375     ;;;(getdist "\nLoop radius: ") 
      )
   (setq
      esel1 (entsel "\nFirst Line: ")
      ok   nil
   )
   (if esel1
     (progn
        (setq ent1 (entget (car esel1)))
        (if (= "LINE" (item 0 ent1))
           (progn
              (redraw (car esel1) 3)
              (setq esel2 (entsel "\nSecond Line: "))
              (if esel2
                  (progn
                     (setq
                         ent2 (entget (car esel2))
                         ok   (= "LINE" (item 0 ent2))
                     )
                     (IF (not ok)
                        (princ "\nNot a Line!")
                     )
                  )
                  (princ "\nNothing Selected!")
              )

           )
           (princ "\nNot a Line!")
        )
        (redraw (car esel1) 4)
     )
     (princ "\nNothing Selected!")
   )

   (if ok
      (setq
         p1 (item 10 ent1)
         p2 (item 11 ent1)
         p3 (item 10 ent2)
         p4 (item 11 ent2)
         pint (inters p1 p2 p3 p4 nil)
      )
   )
   (if pint
      (progn
         (if (> (distance p2 pint) (distance p1 pint))
             (setq
                temp p2
                p2   p1
                p1   temp
             )
         )
         (if (> (distance p4 pint) (distance p3 pint))
             (setq
                temp p4
                p4   p3
                p3   temp
             )
         )
         (setq
             half_ang (abs (* 0.5 (- (angle p1 p2) (angle p3 p4))))
             d        (/ (* rad (cos half_ang)) (sin half_ang))
             p5 (polar pint (angle p1 p2) d)
             p6 (polar pint (angle p3 p4) d)
             cl (getvar "clayer")
             fl (item 8 ent1)
        )
        (if (/= cl fl)
            (command "layer" "s" fl "")
        )
        (command
           "change" (car esel1) "" p5
           "change" (car esel2) "" p6
           "arc"   p5 "E" p6 "d" (polar p5 (angle p1 p2) 1.0)
        )
        (if (/= cl fl)
            (command "layer" "s" cl "")
        )

      )
      (if ok
        (princ "\nLines are parallel!")
      )
   )
   (princ)
)
