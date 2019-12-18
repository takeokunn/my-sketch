(defpackage my-sketch-test
    (:use :cl :prove)
    (:import-from :my-sketch.math
        :clamp-1
        :radians
        :degrees)
    (:import-from :my-sketch.utils
        :pad-list))
(in-package :my-sketch-test)

;; NOTE: To run this test file, execute `(asdf:test-system :my-sketch)' in your Lisp.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          math           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;         utils           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(plan 1)

;; pad-list
(is (my-sketch.utils:pad-list '(4 5) 1 5) '(1 1 1 4 5))

(finalize)
