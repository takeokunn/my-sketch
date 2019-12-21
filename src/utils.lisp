(defpackage my-sketch.utils
    (:use :cl :my-sketch.math)
    (:export :pad-list
        :split-n
        :group
        :order-list
        :mix-lists
        :div2-inexact
        :abs-or-rel
        :lerp-lists
        :flatten
        :coerce-float
        :relative-path
        :file-name-extension))
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
(defun group-bits ())

(defun order-list (order list)
  (loop for o in order
    collect (nth o list)))

(defun mix-lists (&rest lists)
  (apply #'append (apply #'mapcar #'list lists)))

(defun div2-inexact (a)
  (multiple-value-bind (x y)
    (floor a 2)
    (values x (+ x y))))

(defun abs-or-rel (val src)
  (if (numberp val)
    (cond ((< 0 val 1) (* src val))
      ((<= 1 val) val)
      (t src))
    (or src 0)))

(defun lerp-lists (v list-a list-b)
  (mapcar (lambda (a b) (alexandria:lerp v a b)) list-a list-b))

(defun flatten (tree)
  (let (list)
    (labels ((traverse (subtree)
               (when subtree
                 (if (consp subtree)
                   (progn
                     (traverse (car subtree))
                     (traverse (cdr subtree)))
                   (push subtree list)))))
      (traverse tree))
    (nreverse list)))

(defun coerce-float (x)
  (coerce x 'single-float))

;; TODO
(defun copy-buffer ())

(defun relative-path (path &optional (system 'my-sketch))
  (format nil "~a" (asdf:system-relative-pathname system path)))

(defun file-name-extension (name)
  (let ((pos (position #\. name :from-end t)))
    (when (numberp pos)
      (subseq name (1+ pos)))))
