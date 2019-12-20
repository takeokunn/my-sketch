(defpackage my-sketch-test
    (:use :cl :prove)
    (:import-from :my-sketch.math
        :clamp-1
        :radians
        :degrees)
    (:import-from :my-sketch.utils
        :pad-list
        :split-n))
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

(plan 11)

;; pad-list
(is (my-sketch.utils:pad-list '(4 5) 1 5) '(1 1 1 4 5))

;; split-n
(is (my-sketch.utils:split-n '(1 2 3 4 5) 1) '((1) 2 3 4 5))
(is (my-sketch.utils:split-n '(1 2 3 4 5) 3) '((1 2 3) 4 5))

;; group
(is (my-sketch.utils:group '(1 2 3 4 5)) '((1 2) (3 4)))
(is (my-sketch.utils:group '(1 2 3 4 5) 3) '((1 2 3)))
(is (my-sketch.utils:group '(1 2 3 4 5 6) 2) '((1 2) (3 4) (5 6)))
(is (my-sketch.utils:group '(1 2 3 4 5 6) 3) '((1 2 3) (4 5 6)))

;; order-list
(is (my-sketch.utils:order-list '(0) '("a" "b" "c")) '("a"))
(is (my-sketch.utils:order-list '(0 2) '("a" "b" "c")) '("a" "c"))

;; mix-lists
(is (my-sketch.utils:mix-lists '((1 2 3) (a b c))) '(1 a 2 b 3 c))
(is (my-sketch.utils:mix-lists '((1 2) (a b) (x y))) '(1 a x 2 b y))

(finalize)
