;;***********************
;;* Contents of Program *
;;***********************
;;   mk        Shrinks an object .05" overall
;;   re        Rectangle drawer
;;   mm        Mirrors an object twice
;;   sm        Converts windowed metric drawing to English units


;Friday, August 18, 1995  Revised 1/26/96
;Program for shrinking Doctor Support Plates & like parts

(defun c:mk( / tem tem1 p1 p2 p3 p4 p5)
     (graphscr)
     (setq tem  (getvar "osmode"))
     (setq tem1 (getvar "pickbox"))
     (setvar "osmode" 2)
     (setq p1 (entsel "\nPick an edge of object to shrink: "))
     (setvar "pickbox" 0)
     (setq p2 (getpoint "\nPick 1ST point of window: "))
     (setq p3 (getcorner "\nPick 2ND point of window: " p2))
     (setq p4 (getpoint "\nPick center of object: "))
     (command "PEDIT" p1 "yes" "j" "w" p2 p3 "" "")
     (setq p5 (getpoint "\nPick edge of object: "))
     (command "OFFSET" "0.05" p5 p4 "")
     (command "EXPLODE" "l")
     (command "ERASE" p5 "")
     (setvar "osmode" tem )
     (setvar "pickbox" tem1)
)

(defun c:re()
   (graphscr)
   (setvar "cmdecho" 0)
   (setq pt1 (getpoint "\nInsertion Point: ")
         wid  (getstring "\nLength: ")
         hgt  (getstring "\n Width: ")
   )
   (if (= nil wid)
     (setq wid hgt)
   )
   (if (= nil hgt)
     (setq hgt wid)
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



(defun c:mm(/ tem tem1)
     (graphscr)
     (setq tem  (getvar "osmode"))
     (setq tem1 (getvar "pickbox"))
     (setvar "osmode" 0)
     (setvar "pickbox" 0)
     (setq p1 (getpoint "\nPick 1ST point of window: "))
     (setq p2 (getcorner "\nPick 2ND point of window: " p1))
     (command "mirror" "w" p1 p2 "" p1 "@0,1" "n")
     (command "mirror" "p" "" p1 "@-1,0" "y")
     (setvar "osmode" tem)
     (setvar "pickbox" 6)
)


(defun c:sm(/ tem tem1 p1 p2)
     (graphscr)
     (setq tem  (getvar "osmode"))
     (setq tem1 (getvar "pickbox"))
     (setvar "osmode" 2)
     (setvar "pickbox" 0)
     (setq p1 (getpoint "\nPick 1ST point of window: "))
     (setq p2 (getcorner "\nPick 2ND point of window: " p1))
     (command "scale" "w" p1 p2 "" p1 ".03937")
     (setvar "osmode" tem)
     (setvar "pickbox" 6)
)
