(defun c:newby ()                            
        (defun gp_dialog ()
                (setq    type    "0"
                        matthk  "100" 
                        prognum "000"
                )
                (setq dcl_id (load_dialog "newby.dcl"))
                (if (not (new_dialog "gp_box1" dcl_id))(exit))
                (set_tile "gp_matthk" "1")
                (set_tile "gp_prognum" "000")
                (action_tile "gp_ssta" 
                        "setq type 0")
                (action_tile "gp_mldstl" 
                        "setq type 1")
                (action_tile "gp_alum"  
                        "setq type 2")
                (action_tile "gp_deck" 
                        "setq type 3")
                (action_tile "gp_sstb" 
                        "setq type 4")
                (action_tile "cancel" "(done_dialog) (setq gperr \"\") (exit)")
                (action_tile "accept"
                        (strcat
                                "(progn (setq save1 (strcat type matthk prognum))
                (start_dialog)
        )
                
                (if (= type "0")
                        (setq mat1 "316L STAINLESS STEEL") 
                        (setq mat2 "S")
                )
                (if (= type "1")
                        (setq mat1 "A-36 MILD STEEL") 
                        (setq mat2 "A")
                )
                (if (= type "2")
                        (setq mat1 "ALUMINUM") 
                        (setq mat2 "AL")
                )
                (if (= type "3")
                        (setq mat1 "DECK PLATE") 
                        (setq mat2 "D")
                )
                (if (= type "4")
                        (setq mat1 "304L STAINLESS STEEL") 
                        (setq mat2 "S")
                )
        
        (setq save2 (strcat mat2 matthk prognum))
        (command "saveas" save2)
        (command "text" (strcat "30,140") 7.0 0 
                (strcat save1 " DISK# PLATE# " matthk " " mat1 "") 
        )
)  
  
