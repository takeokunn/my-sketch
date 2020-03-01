(defpackage my-sketch-test.math
  (:use :cl :prove)
  (:import-from :my-sketch.math
                :clamp-1
                :normalize
                :radians
                :degrees))
(in-package :my-sketch-test.math)

(plan 5)

;; clamp-1
(is (my-sketch.math:clamp-1 10) 1.0)
(is (my-sketch.math:clamp-1 0.5) 0.5)
(is (my-sketch.math:clamp-1 -10) 0.0)

;; normalize
(is (my-sketch.math:normalize 0.1 0 2) 0.05)
(is (my-sketch.math:normalize 10 2 3 :clamp t :out-low 2 :out-high 7) 7)

;; radians
(is (my-sketch.math:radians 180) PI)

;; degrees
(is (my-sketch.math:degrees PI) 180.0d0)

(finalize)
