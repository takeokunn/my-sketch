(defsystem "my-sketch"
    :version "0.1.0"
    :author "takeokunn"
    :license "GPLv3"
    :depends-on (:alexandria
                 :cl-geometry
                 :glkit
                 :mathkit
                 :md5
                 :sdl2-image
                 :sdl2-ttf
                 :sdl2kit
                 :split-sequence
                 :static-vectors)
    :components ((:module "src"
                          :components
                          ((:file "my-sketch" :depends-on ("math"))
                           (:file "math")
                           (:file "utils")
                           (:file "env")
                           (:file "resources" :depends-on ("utils" "env")))))
    :description ""
    :in-order-to ((test-op (test-op "my-sketch-test"))))
