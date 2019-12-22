(defpackage my-sketch-test.utils
  (:use :cl :prove)
  (:import-from :my-sketch.utils
                :pad-list
                :split-n))
(in-package :my-sketch-test.utils)

(plan 25)

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
(is (my-sketch.utils:mix-lists '(1 2 3) '(a b c)) '(1 a 2 b 3 c))
(is (my-sketch.utils:mix-lists '(1 2) '(a b) '(x y)) '(1 a x 2 b y))

;; div2-inexact
(is (my-sketch.utils:div2-inexact 10) (values 5 5))
(is (my-sketch.utils:div2-inexact 11) (values 5 6))

;; abs-or-rel
(is (my-sketch.utils:abs-or-rel "dfasfas" 0) 0)
(is (my-sketch.utils:abs-or-rel -1 10) 10)
(is (my-sketch.utils:abs-or-rel 0.5 10) 5.0)
(is (my-sketch.utils:abs-or-rel 1.1 10) 1.1)

;; lerp-lists
(is (my-sketch.utils:lerp-lists 0.5 '(1 2 3) '(4 5 6)) '(2.5 3.5 4.5))

;; flatten
(is (my-sketch.utils:flatten "fdsafds") '("fdsafds"))
(is (my-sketch.utils:flatten '(1 2 (3 (4 (5 6))))) '(1 2 3 4 5 6))

;; coerce-float
(is (my-sketch.utils:coerce-float 10) 10.0)
(is (my-sketch.utils:coerce-float -10) -10.0)

;; relative-path
(is (my-sketch.utils:relative-path "test.txt") (format nil "~Atest.txt" (asdf:system-source-directory 'my-sketch)))

;; file-name-extension
(is (my-sketch.utils:file-name-extension "aaa") nil)
(is (my-sketch.utils:file-name-extension "aaa.txt") "txt")

(finalize)
