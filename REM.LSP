(defun c:rem ( / osnapm p1 y1 done)
	(graphscr)
	(setq osnapm (getvar "osmode"))
	(setvar "osmode" 0)
        (setq p1 (getpoint "\nPick begining point of remnant: "));
        (setq y1 (getstring "\nEnter Y: "));
        (command "line" p1 (strcat "@0," y1 ) "");
        (setq done 0)
        (while (/= done nil)
                (setq x (getstring "\nEnter X: ")); 
                (command "line" "" (strcat "@" x ",0" ) "" );
                (setq y (getstring "\nEnter Y: ")); 
                (command "line" "" (strcat "@0," y ) "" );
                (if (or (= x "0") (= y "0"))
                        (setq done nil)
                        (setq done 1)
                )
        )
	(setvar "osmode" osnapm)
)

