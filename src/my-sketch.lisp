(defpackage my-sketch
  (:use :cl)
  (:import-from :my-sketch.math
    :+pi+)
  (:export :hello))
(in-package :my-sketch)

(defun hello (x)
  (+ x +pi+))

;; (defstruct env
;;     (pen nil))

;; (defparameter *env* nil)

;; (defmacro define-sketch-class ()
;;     `(defclass sketch (kit.sdl2:gl-window)
;;          ((%env :initform (make-env))
;;              (%restart :initform t)
;;              ,@*default-slots*)))

;; (defun sketch-bindings-to-slots (sketch bindings)
;;     (mapcar (lambda (x) (make-slot-form sketch x))
;;         (remove-if (lambda (x)
;;                        (member (car x) (mapcar #'car *default-slots*)))
;;             bindings)))

;; (defparameter *default-slots*
;;     '((title :initform "Sketch" :reader sketch-title :initarg :title)
;;          (width :initform 400 :reader sketch-width :initarg :width)
;;          (height :initform 400 :reader sketch-height :initarg :height)
;;          (fullscreen :initform nil :reader sketch-fullscreen :initarg :fullscreen)
;;          (copy-pixels :initform nil :accessor sketch-copy-pixels :initarg :copy-pixels)
;;          (y-axis :initform :down :reader sketch-y-axis :initarg :y-axis)))

;; (defun default-slot-p (slot-or-binding)
;;     (let ((defaults (mapcar #'car *default-slots*)))
;;         (typecase slot-or-binding
;;             (list (member (car slot-or-binding) defaults))
;;             (t (member slot-or-binding defaults)))))

;; (defun intern-accessor (name)
;;     (intern (string (alexandria:symbolicate 'sketch- name)) :sketch))

;; (defun binding-accessor (sketch binding)
;;     (if (default-slot-p binding)
;;         (intern-accessor (car binding))
;;         (or (cadr (member :accessor (cddr binding)))
;;             (alexandria:symbolicate sketch '- (car binding)))))

;; (defun make-slot-form (sketch binding)
;;     `(,(car binding)
;;          :initarg ,(alexandria:make-keyword (car binding))
;;          :accessor ,(binding-accessor sketch binding)))

;; (defun sketch-bindings-to-slots (sketch bindings)
;;     (mapcar (lambda (x) (make-slot-form sketch x))
;;         (remove-if (lambda (x)
;;                        (member (car x) (mapcar #'car *default-slots*)))
;;             bindings)))

;; (defclass sketch (kit.sdl2:gl-window)
;;     ((test :initform 10)))

;; (defmacro defsketch (sketch-name)
;;     `(progn
;;          (defclass ,sketch-name (sketch)
;;              )))

;; (defsketch hello-world)
