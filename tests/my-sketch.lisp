(defpackage my-sketch-test
  (:use :cl :prove))
(in-package :my-sketch-test)

;; NOTE: To run this test file, execute `(asdf:test-system :my-sketch)' in your Lisp.

(plan 1)

(is 1 1)

(finalize)
