(defun c:cr ( / item esel1 ent1 esel2 ent2 ok ort
                  p1 p2 p3 p4 p5 p6 pint half_ang d cl fl)
   (defun item (num ent)
      (cdr (assoc num ent))
   )
      (setvar "cmdecho" 0)
   (setq ort (getvar "orthomode"))   
   (setvar "orthomode" 0)
   (if (= nil len)
      (setq len (getdist "\nExtension length: "))
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
;             d        (abs (/ (* len (cos half_ang)) (sin half_ang)))
             d (abs len)
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
   (setvar "orthomode" ort)
)

(defun c:re()
   (setvar "cmdecho" 0)
   (setq pt1 (getpoint "\nInsertion Point: ")
         wid  (getstring "\n Width: ")
         hgt  (getstring "\nHeight: ")
   )
   (if (= nil wid)
     (setq wid "0")
   )
   (if (= nil hgt)
     (setq hgt "0")
   )
   (command
      "line" pt1
      (strcat "@" wid ",0")
      (strcat "@0," hgt)
      (strcat "@-" wid ",0")
      (strcat "@0,-" hgt)
      ""
   )
)

(defun c:fl()
  (setq cl1
        (strcat
           "COPY "
           (getstring "\nNC Code File: ")
           ".txt B: /V"
        )
  )
  (princ "\nInsert Floppy Disk in Drive B")
  (initget 1 "Yes No")
  (If (= "Yes" (getkword "\nProceed (Yes or No)? "))
     (progn
        (princ cl1)
        (command "SHELL" cl1)
     )
     (princ "CANCELLED!")
  )
  (princ)
)
                                                                                                                                            
(defun c:out2txt ()
(setq p strcat("rename " *codename* ".out " *codename* ".txt"))
(command "shell" p)
)
 

(defun c:note()
   (setq layr (getvar "clayer"))
   (setq txt (getstring "\Enter note:"))
   (setq p1 (getpoint "\Insertion Point: "))
   (command "layer" "s" "notes" "")
   (command "text" "c" p1 4.0 0 txt)
   (command "layer" "s" layr "")
   (setq e1 (entlast))
   (command "scale" e1 "" p1)
)
