;
;
;
;  ,p6"bo `7MM  `7MM  `7Mb,od8 `7Mb,od8 `7M'   `MF'   
; 6M'  OO   MM    MM    MM' "'   MM' "'   VA   ,V     
; 8M        MM    MM    MM       MM        VA ,V      
; YM.    ,  MM    MM    MM       MM         VVV       
;  YMbmd'   `Mbod"YML..JMML.   .JMML.       ,V        
;                        ,,                 ,V        
;                      `7MMs            OOb"          
;                        MM                           
;      ,pP"Ybd  ,pW"Wq.  MM `7M'   `MF'.gP"Ya `7Mb,od8
;      8I   `" 6W'   `Wb MM   VA   ,V ,M'   Yb  MM' "'
;      `YMMMa. 8M     M8 MM    VA ,V  8M""""""  MM    
;      L.   I8 YA.   ,A9 MM     VVV   YM.    ,  MM    
;      M9mmmP'  `Ybmd9'.JMML.    W     `Mbmmd'.JMML.  
;
; 
;  author:   Ryan Edwards
;     upi:   
;      id:   
;
;
;
;  to run:   (clear)
;            (load "/Users/ryan/Desktop/Compsci 367/CS367/A5/main.clp")
;            (run)
;
;  re-run:   (reset)
;            (run)
;
;
;
;  domain:   Do you have enough ingredients and cookware to
;            cook a curry?
;
; summary:   This program helps to solve a common dilema;
;            whether one has sufficient ingredients and
;            cookware to make a curry.
;
;            Curry's are great because they keep well, don't
;            cost much and taste delicious. While not overly
;            complicated to cook, they do require a 
;            considerable amount of ingredients.
;       
;            The scope of the domain is limited to a typical
;            student flat where cooking elements and utensils
;            are available, but food and cookware (such as pots)
;            are not necessarily present.
;             
;
;            enjoy :)                                                                               
;                 
;
;
;    ref1:   ASCII Word Art generated with
;            http://www.kammerl.de/ascii/AsciiSignature.php
;
;
;    ref2:   Code adapted from carDiag.clp as shown in class
;            (see below)
;
; (defrule carDiagnosis
;     =>
;         (printout t "does car start? (1-yes, 0-no)" crlf)
;         (bind ?x (read))
;         (if (= ?x 1)
;             then (assert (carTurnOn yes))
;         else
;             (assert (carTurnOn no))
;         )
; )


;;**********************************
;;* PROGRAM LAUNCH AND DESCRIPTION *
;;**********************************


(defrule start
    (declare (salience 10000))
    =>                                             
        (printout t "                                             " crlf)                                              
        (printout t " ,p6\"bo `7MM  `7MM  `7Mb,od8 `7Mb,od8 `7M'   `MF'   " crlf)
        (printout t "6M'  OO   MM    MM    MM' \"'   MM' \"'   VA   ,V     " crlf)
        (printout t "8M        MM    MM    MM       MM        VA ,V      " crlf)
        (printout t "YM.    ,  MM    MM    MM       MM         VVV       " crlf)
        (printout t " YMbmd'   `Mbod\"YML..JMML.   .JMML.       ,V        " crlf)
        (printout t "                       ,,                 ,V        " crlf)
        (printout t "                     `7MMs            OOb\"          " crlf)
        (printout t "                       MM                           " crlf)
        (printout t "     ,pP\"Ybd  ,pW\"Wq.  MM `7M'   `MF'.gP\"Ya `7Mb,od8" crlf)
        (printout t "     8I   `\" 6W'   `Wb MM   VA   ,V ,M'   Yb  MM' \"'" crlf)
        (printout t "     `YMMMa. 8M     M8 MM    VA ,V  8M\"\"\"\"\"\"  MM    " crlf)
        (printout t "     L.   I8 YA.   ,A9 MM     VVV   YM.    ,  MM    " crlf)
        (printout t "     M9mmmP'  `Ybmd9'.JMML.    W     `Mbmmd'.JMML.  " crlf)
        (printout t "                                             " crlf)                                              
        (printout t "                                             " crlf)
        (printout t "Do you want to read about the problem domain? (1-yes, 0-no)" crlf)
        (bind ?x (read))
        (if (= ?x 1) then
            (printout t "Description/ Problem Domain:" crlf)
            (printout t "" crlf) 
            (printout t "This program helps to solve a common dilema\;" crlf)
            (printout t "whether one has sufficient ingredients and cookware to make a curry." crlf)                                                                                
            (printout t "Curry's are great because they keep well, don't cost much and taste" crlf)                                                                                
            (printout t "delicious. While not overly complicated to cook, they do require a" crlf)                                                                                
            (printout t "considerable amount of ingredients." crlf)                                                                                
            (printout t "" crlf)                                                                                
            (printout t "The scope of the domain is limited to a typical student flat where" crlf)                                                                                
            (printout t "cooking elements and utensils are available, but food and cookware" crlf)                                                                                
            (printout t "(such as pots) are not necessarily present." crlf)
            (printout t "" crlf)
            (printout t "-----" crlf)                                                                                
            (printout t "" crlf)    
        )
                                                                                      

)

;;**************************************
;;* BEGIN DECISION TREE IMPLEMENTATION *
;;**************************************

(defrule pot
    =>
        (printout t "Do you have a pot? (1-yes, 0-no)" crlf)
        (bind ?x (read))
        (if (= ?x 1) then
            (assert (havePot yes))
        else
            (assert (havePot no))
            (assert (makeCurry no))
            (facts)
        )
)

(defrule oil
    (havePot yes)
    =>
        (printout t "Do you have oil? (1-yes, 0-no)" crlf)
        (bind ?x (read))
        (if (= ?x 1) then 
            (assert (haveOil yes))
        else
            (assert (haveOil no))
            (assert (makeCurry no))
            (facts)
        )
)


(defrule onion
    (haveOil yes)
    =>
        (printout t "Do you have onions? (1-yes, 0-no)" crlf)
        (bind ?x (read))
        (if (= ?x 1) then 
            (assert (haveOnion yes))
        else
            (assert (haveOnion no))
            (assert (makeCurry no))
            (facts)
        )
)

(defrule tomato
    (haveOnion yes)
    =>
        (printout t "Do you have canned tomatoes? (1-yes, 0-no)" crlf)
        (bind ?x (read))
        (if (= ?x 1) then 
            (assert (haveTomato yes))
        else
            (assert (haveTomato no))
            (assert (makeCurry no))
            (facts)
        )
)


(defrule coconutMilk
    (haveTomato yes)
    =>
        (printout t "Do you have coconut milk? (1-yes, 0-no)" crlf)
        (bind ?x (read))
        (if (= ?x 1) then 
            (assert (haveCoconutMilk yes))
        else
            (assert (haveCoconutMilk no))
            (assert (makeCurry no))
            (facts)
        )
)


;;**********
;;* SPICES *
;;**********


(defrule goodSpices
    (haveCoconutMilk yes)
    =>
        (printout t "Do you have coriander, garam masala, cumin and tumeric? (1-yes, 0-no)" crlf)
        (bind ?x (read))
        (if (= ?x 1) then 
            (assert (haveSpices good))
        )
)


(defrule poorSpices
    (haveCoconutMilk yes)
    (not (haveSpices good))
    =>
        (printout t "Do you have curry powder? (1-yes, 0-no)" crlf)
        (bind ?x (read))
        (if (= ?x 1) then 
            (assert (haveSpices poor))
        else
            (assert (haveSpices no))
            (assert (makeCurry no))
            (facts)
        )
)

(defrule goodHotSpices
    (or (haveSpices good)
        (haveSpices poor))
    =>
        (printout t "Do you have cayenne? (1-yes, 0-no)" crlf)
        (bind ?x (read))
        (if (= ?x 1) then 
            (assert (haveHotSpices good))
        )
)


(defrule poorHotSpices
    (or (haveSpices good)
        (haveSpices poor))
    (not (haveHotSpices good))
    =>
        (printout t "Do you have chilli powder? (1-yes, 0-no)" crlf)
        (bind ?x (read))
        (if (= ?x 1) then 
            (assert (haveHotSpices poor))
        else
            (assert (haveHotSpices no))
            (assert (makeCurry no))
            (facts)
        )
)


;;*************************************
;;* SPLIT PATHS - MEAT AND VEGE CURRY *
;;*************************************


(defrule meat
    (or (haveHotSpices good)
        (haveHotSpices poor))
    =>
        (printout t "Do you have meat? (1-yes, 0-no)" crlf)
        (bind ?x (read))
        (if (= ?x 1) then 
            (assert (haveMeat yes))
        else
            (assert (haveMeat no))
        )
)


(defrule meatCurry
    (haveMeat yes)
    =>
        (printout t "How many vegetables do you have? (enter amount)" crlf)
        (bind ?x (read))
        (if (>= ?x 1) then 
            (assert (makeCurry meat))
            (printout t "" crlf)
            (printout t "Yay! You have enough ingredients for a meat curry!" crlf)
            (printout t "" crlf)
            (facts)
        else
            (assert (makeCurry no))
            (facts)
        )
)


(defrule vegetableCurry
    (haveMeat no)
    =>
        (printout t "How many vegetables do you have? (enter amount)" crlf)
        (bind ?x (read))
        (if (>= ?x 3) then 
            (assert (makeCurry vegetable))
            (printout t "" crlf)
            (printout t "Yay! You have enough ingredients for a vegetable curry!" crlf)
            (printout t "" crlf)
            (facts)
        else
            (assert (makeCurry no))
            (facts)
        )
)
























