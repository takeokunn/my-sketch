(defpackage my-sketch.resources
    (:use :cl)
    (:export :load-resource))
(in-package :my-sketch.resources)

(defclass resource () ())

(defclass image (resource)
    ((texture :accessor image-texture :initarg :texture)
        (width :accessor image-width :initarg :width)
        (height :accessor image-height :initarg :height)))

(defclass typeface (resource)
    ((filename :accessor typeface-filename :initarg :filename)
        (pointer :accessor typeface-pointer :initarg :pointer)))

(defun load-resource (filename &rest all-keys &key type force-reload-p &allow-other-keys)
    (let ((*env* (or *env* (make-env)))) ;; try faking env if we still don't have one
        (symbol-macrolet ((resource (gethash key (env-resources *env*))))
            (let* ((key (alexandria:make-keyword
                            (alexandria:symbolicate filename (format nil "~a" all-keys)))))
                (when force-reload-p
                    (free-resource resource)
                    (remhash key (env-resources *env*)))
                (when (not resource)
                    (setf resource
                        (apply #'load-typed-resource
                            (list*  filename
                                (or type
                                    (case (alexandria:make-keyword
                                              (alexandria:symbolicate
                                                  (string-upcase (file-name-extension filename))))
                                        ((:png :jpg :jpeg :tga :gif :bmp) :image)
                                        ((:ttf :otf) :typeface)))
                                all-keys))))
                resource))))
