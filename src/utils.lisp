(defpackage my-sketch.utils
    (:use :cl :my-sketch.math)
    (:import-from :alexandria
        :make-keyword)
    (:export :pad-list))
(in-package :my-sketch.utils)

(defun pad-list (list pad length)
    (if (>= (length list) length)
        list
        (append (make-list (- length (length list)) :initial-element pad)
            list)))
