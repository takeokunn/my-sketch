(defpackage my-sketch.resources
  (:use :cl :my-sketch.env :my-sketch.utils)
  (:export :load-resource))
(in-package :my-sketch.resources)

;;;;;;;;;;;;;;;;;;;;;;;;
;;       class        ;;
;;;;;;;;;;;;;;;;;;;;;;;;
(defclass resource () ())

(defclass image (resource)
  ((texture :accessor image-texture :initarg :texture)
   (width :accessor image-width :initarg :width)
   (height :accessor image-height :initarg :height)))

(defclass typeface (resource)
  ((filename :accessor typeface-filename :initarg :filename)
   (pointer :accessor typeface-pointer :initarg :pointer)))

;;;;;;;;;;;;;;;;;;;;;;;;
;;    load-resource   ;;
;;;;;;;;;;;;;;;;;;;;;;;;
(defgeneric load-typed-resource (filename type &key &allow-other-keys))

(defmethod load-typed-resource (filename type &key &allow-other-keys)
  (if (not type)
      (error (format nil "~a's type cannot be deduced." filename))
      (error (format nil "Unsupported resource type ~a" type))))

(defmethod load-typed-resource (filename (type (eql :image)) &key &allow-other-keys)
  (make-image-from-surface (sdl2-image:load-image filename)))

(defmethod load-typed-resource (filename (type (eql :typeface))
                                &key (size 18) &allow-other-keys)
  (make-instance 'typeface
                 :filename filename
                 :pointer (sdl2-ttf:open-font filename
                                              (coerce (truncate size)
                                                      '(signed-byte 32)))))

;;;;;;;;;;;;;;;;;;;;;;;;
;;    free-resource   ;;
;;;;;;;;;;;;;;;;;;;;;;;;
(defgeneric free-resource (resource))

(defmethod free-resource :around (resource)
  (when resource
    (call-next-method)))

(defmethod free-resource ((image image))
  (gl:delete-textures (list (image-texture image))))

(defmethod free-resource ((typeface typeface)))

;;;;;;;;;;;;;;;;;;;;;;;;
;;      functions     ;;
;;;;;;;;;;;;;;;;;;;;;;;;
(defun make-image-from-surface (surface)
  (let ((texture (car (gl:gen-textures 1))))
    (gl:bind-texture :texture-2d texture)
    (gl:tex-parameter :texture-2d :texture-min-filter :linear)
    (gl:tex-image-2d :texture-2d 0 :rgba
                     (sdl2:surface-width surface)
                     (sdl2:surface-height surface)
                     0
                     :bgra
                     :unsigned-byte (sdl2:surface-pixels surface))
    (gl:bind-texture :texture-2d 0)
    (let ((image (make-instance 'image
                                :width (sdl2:surface-width surface)
                                :height (sdl2:surface-height surface)
                                :texture texture)))
      (sdl2:free-surface surface)
      image)))

(defun load-resource (filename &rest all-keys &key type force-reload-p &allow-other-keys)
  (let ((*env* (or *env* (my-sketch.env::make-env)))) ;; try faking env if we still don't have one
    (symbol-macrolet ((resource (gethash key (my-sketch.env::env-resources *env*))))
      (let* ((key (alexandria:make-keyword
                   (alexandria:symbolicate filename (format nil "~a" all-keys)))))
        (when force-reload-p
          (free-resource resource)
          (remhash key (my-sketch.env::env-resources *env*)))
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
