(defpackage my-sketch.math
    (:use :cl)
    (:import-from :kit.sdl2
        :gl-window)
    (:import-from :alexandria
        :clamp)
    (:export :clamp-1
        :radians
        :degrees))
(in-package :my-sketch.math)

(defconstant +pi+ PI)
(defconstant +two-pi+ (* PI 2))
(defconstant +tau+ +two-pi+)
(defconstant +half-pi+(/ PI 2))
(defconstant +quarter-pi+ (/ PI 4))
(defconstant +epsilon+ single-float-epsilon)
(defconstant +phi+ 1.61803398875)
(defconstant +golden-ratio+ +phi+)
(defconstant +e+ (exp 1))

(defmacro clamp-1 (x)
    `(alexandria:clamp ,x 0.0 1.0))

;; TODO
(defun normalize ())

(defmacro radians (deg)
    `(* PI (/ ,deg 180)))

(defmacro degrees (rad)
    `(* 180 (/ ,rad PI)))
