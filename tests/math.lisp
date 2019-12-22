(defpackage my-sketch-test.math
  (:use :cl :prove)
  (:import-from :my-sketch.math
                :clamp-1
                :radians
                :degrees))
(in-package :my-sketch-test.math)

(plan 5)

;; clamp-1
(is (my-sketch.math:clamp-1 10) 1.0)
(is (my-sketch.math:clamp-1 0.5) 0.5)
(is (my-sketch.math:clamp-1 -10) 0.0)

;; radians
(is (my-sketch.math:radians 180) PI)

;; degrees
(is (my-sketch.math:degrees PI) 180.0d0)

(finalize)
