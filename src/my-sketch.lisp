(defpackage my-sketch
  (:export :hello)
  (:use :cl))
(in-package :my-sketch)

(defun hello ()
  (print "good"))
