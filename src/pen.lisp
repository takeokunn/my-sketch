(defpackage my-sketch.pen
  (:use :cl)
  (:export :pen
           :with-pen
           :flip-pen))
(in-package :my-sketch.pen)

(defstruct pen
  (fill nil)
  (stroke nil)
  (weight 1)
  (curve-steps 100))

(defmacro with-pen (pen &body body)
  (alexandria:once-only (pen)
    `(alexandria:with-gensyms (previous-pen)
       (progn
         (setf previous-pen (env-pen *env*)
               (env-pen *env*) ,pen)
         ,@body
         (setf (env-pen *env*) previous-pen)))))

(defun flip-pen (pen)
  (make-pen :weight (pen-weight pen)
            :stroke (pen-fill pen)
            :fill (pen-stroke pen)
            :curve-steps (pen-curve-steps pen)))

;; (let ((pen))
;;   (defun make-default-pen ()
;;     (setf pen (or pen
;;                   (make-pen :weight 1
;;                             :fill +white+
;;                             :stroke +black+)))))
