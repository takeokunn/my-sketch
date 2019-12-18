(defpackage my-sketch-test
    (:use :cl :prove)
    (:import-from :my-sketch.math
        :radians))
(in-package :my-sketch-test)

;; NOTE: To run this test file, execute `(asdf:test-system :my-sketch)' in your Lisp.

(plan 1)

;; math
(ok (eq 3 3))

;; utils

(finalize)
