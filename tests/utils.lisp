(defpackage my-sketch-test.utils
  (:use :cl :prove :my-sketch.utils))
(in-package :my-sketch-test.utils)

(plan nil)

;; pad-list
(is (pad-list '(4 5) 1 5) '(1 1 1 4 5))

;; split-n
(is (split-n '(1 2 3 4 5) 1) '((1) 2 3 4 5))
(is (split-n '(1 2 3 4 5) 3) '((1 2 3) 4 5))

;; group
(is (group '(1 2 3 4 5)) '((1 2) (3 4)))
(is (group '(1 2 3 4 5) 3) '((1 2 3)))
(is (group '(1 2 3 4 5 6) 2) '((1 2) (3 4) (5 6)))
(is (group '(1 2 3 4 5 6) 3) '((1 2 3) (4 5 6)))

;; group-bits
(is (group-bits 1) '(1))
(is (group-bits 256) '(1 0))
(is (group-bits 1000) '(3 232))
(is (group-bits 65536) '(1 0 0))

;; order-list
(is (order-list '(0) '("a" "b" "c")) '("a"))
(is (order-list '(0 2) '("a" "b" "c")) '("a" "c"))

;; mix-lists
(is (mix-lists '(1 2 3) '(a b c)) '(1 a 2 b 3 c))
(is (mix-lists '(1 2) '(a b) '(x y)) '(1 a x 2 b y))

;; div2-inexact
(is (div2-inexact 10) (values 5 5))
(is (div2-inexact 11) (values 5 6))

;; abs-or-rel
(is (abs-or-rel "dfasfas" 0) 0)
(is (abs-or-rel -1 10) 10)
(is (abs-or-rel 0.5 10) 5.0)
(is (abs-or-rel 1.1 10) 1.1)

;; lerp-lists
(is (lerp-lists 0.5 '(1 2 3) '(4 5 6)) '(2.5 3.5 4.5))

;; flatten
(is (flatten "fdsafds") '("fdsafds"))
(is (flatten '(1 2 (3 (4 (5 6))))) '(1 2 3 4 5 6))

;; coerce-float
(is (coerce-float 10) 10.0)
(is (coerce-float -10) -10.0)

;; TODO: copy-buffer

;; relative-path
(is (relative-path "test.txt") (format nil "~Atest.txt" (asdf:system-source-directory 'my-sketch)))

;; file-name-extension
(is (file-name-extension "aaa") nil)
(is (file-name-extension "aaa.txt") "txt")

(finalize)
