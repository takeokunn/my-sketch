(defpackage my-sketch-test.color
  (:use :cl :prove :my-sketch.color))
(in-package :my-sketch-test.color)

(plan nil)

;; rgb-to-hsb
(is (rgb-to-hsb 255 0 0) '(0 1 255))
(is (rgb-to-hsb 80 80 80) '(0 0 80))
(is (rgb-to-hsb 120 80 90) '(23/24 1/3 120))

;; hsb-to-rgb
(is (hsb-to-rgb 0 1 255) '(255 0 0))
(is (hsb-to-rgb 0 0 80) '(80 80 80))
(is (hsb-to-rgb 23/24 1/3 120) '(120 80 90))

;; rgb

(is (color-red (rgb 1 0 0)) (color-red +red+))
(is (color-green (rgb 0 1 0)) (color-green +green+))
(is (color-blue (rgb 0 0 1)) (color-blue +blue+))

;; TODO: hsb
;; TODO: gray
;; TODO: rgb-255
;; TODO: hsb-360
;; TODO: gray-255
;; TODO: hex-to-color
;; TODO: color-rgb
;; TODO: color-rgba
;; TODO: color-rgba-255
;; TODO: color-hsba
;; TODO: color-vector
;; TODO: color-vector-255
;; TODO: lerp-color
;; TODO: random-color
;; TODO: hash-color
;; TODO: color-filter-grayscale
;; TODO: color-filter-invert
;; TODO: color-filter-rotate
;; TODO: color-filter-hsb

(finalize)
