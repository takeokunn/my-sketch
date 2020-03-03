(defpackage my-sketch-test.math
  (:use :cl :prove :my-sketch.math))
(in-package :my-sketch-test.math)

(plan nil)

;; clamp-1
(is (clamp-1 10) 1.0)
(is (clamp-1 0.5) 0.5)
(is (clamp-1 -10) 0.0)

;; normalize
(is (normalize 0.1 0 2) 0.05)
(is (normalize 10 2 3 :clamp t :out-low 2 :out-high 7) 7)

;; radians
(is (radians 180) PI)

;; degrees
(is (degrees PI) 180.0d0)

(finalize)
