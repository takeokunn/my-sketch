(defpackage my-sketch.math
  (:use :cl)
  (:export
   :+pi+
   :+two-pi+
   :+tau+
   :+half-pi+
   :+quarter-pi+
   :+epsilon+
   :+phi+
   :+golden-ratio+
   :+e+
   :clamp-1
   :normalize
   :radians
   :degrees))
(in-package :my-sketch.math)

(defconstant +pi+ PI)
(defconstant +two-pi+ (* PI 2))
(defconstant +tau+ +two-pi+)
(defconstant +half-pi+ (/ PI 2))
(defconstant +quarter-pi+ (/ PI 4))
(defconstant +epsilon+ single-float-epsilon)
(defconstant +phi+ 1.61803398875)
(defconstant +golden-ratio+ +phi+)
(defconstant +e+ (exp 1))

(defun clamp-1 (x)
  (alexandria:clamp x 0.0 1.0))

(defun normalize (x low high &key (clamp t) (out-low 0.0) (out-high 1.0))
  (let* ((input-low (min low high))
         (input-high (max low high))
         (min-out-low (min out-low out-high))
         (min-out-high (max out-low out-high))
         (norm (+ out-low
                  (* (- out-high out-low)
                     (/ (- x input-low) (- input-high input-low))))))
    (cond (clamp (alexandria:clamp norm min-out-low min-out-high))
          (t norm))))

(defmacro radians (deg)
  `(* PI (/ ,deg 180)))

(defmacro degrees (rad)
  `(* 180 (/ ,rad PI)))
