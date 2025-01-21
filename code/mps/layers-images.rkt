#lang racket

(require csc151)
(require csc151/layers)

;; File:
;;   layers-images.rkt
;; Author:
;;   Samuel A. Rebelsky
;; Contents:
;;   Code for making some of the images in the layers MP.

(markdown-dir "../../images/mps/layers")

#|
(solid-circle 40 "red")
(outlined-circle 30 "red" 10)

(solid-ellipse 20 40 "dark orange")
(outlined-ellipse 30 15 "dark orange" 10)

(solid-square 30 "yellow")
(outlined-square 15 "yellow" 15)

(solid-rectangle 20 40 "green")
(outlined-rectangle 30 20 "green" 5)

(solid-wedge 30 45 "blue")

(solid-equilateral-triangle 40 "indigo")
(outlined-equilateral-triangle 30 "indigo" 5)

(solid-isosceles-triangle 20 40 "violet")
(outlined-isosceles-triangle 40 20 "violet" 5)

(solid-right-triangle 20 40 "gray")
(outlined-right-triangle 40 20 "gray" 5)
|#

#|
(above (outlined-circle 30 "red" 5) (outlined-square 20 "blue" 5))
(above (outlined-square 20 "blue" 5) (outlined-circle 30 "red" 5))

(above/align "left" (outlined-square 20 "blue" 5) (outlined-circle 30 "red" 5))
(above/align "center" (outlined-square 20 "blue" 5) (outlined-circle 30 "red" 5))
(above/align "right" (outlined-square 20 "blue" 5) (outlined-circle 30 "red" 5))

(beside (outlined-circle 30 "red" 5) (outlined-square 20 "blue" 5))
(beside (outlined-square 20 "blue" 5) (outlined-circle 30 "red" 5))

(beside/align "top" (outlined-square 20 "blue" 5) (outlined-circle 30 "red" 5))
(beside/align "center" (outlined-square 20 "blue" 5) (outlined-circle 30 "red" 5))
(beside/align "bottom" (outlined-square 20 "blue" 5) (outlined-circle 30 "red" 5))

(overlay (outlined-circle 30 "red" 5) (outlined-square 20 "blue" 5))
(overlay (outlined-square 20 "blue" 5) (outlined-circle 30 "red" 5))

(overlay/origin (outlined-circle 30 "red" 5) (outlined-square 20 "blue" 5))
(overlay/origin (outlined-square 20 "blue" 5) (outlined-circle 30 "red" 5))
|#
