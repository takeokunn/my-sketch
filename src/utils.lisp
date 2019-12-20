(defpackage my-sketch.utils
    (:use :cl :my-sketch.math)
    (:import-from :alexandria
        :make-keyword)
    (:export :pad-list
        :split-n
        :group
        :order-list
        :mix-lists))
(in-package :my-sketch.utils)

(defun pad-list (list pad length)
    (if (>= (length list) length)
        list
        (append (make-list (- length (length list)) :initial-element pad)
            list)))

(defun split-n (list n)
    (when (>= (length list) n)
        (loop with acc = '()
            for i below n
            do (setf acc (cons (car list) acc)
                   list (cdr list))
            finally (return (cons (nreverse acc) list)))))

(defun group (list &optional (group-length 2))
    (loop with acc = '()
        while (or (not acc) (cdr list))
        do (let ((split (split-n list group-length)))
               (when (car split)
                   (setf acc (cons (car split) acc)))
               (setf list (cdr split)))
        finally (return (nreverse acc))))

;; TODO
;; (defun group-bits ())

(defun order-list (order list)
    (loop for o in order
        collect (nth o list)))

(defun mix-lists (&rest lists)
    (apply #'append (apply #'mapcar #'list lists)))
