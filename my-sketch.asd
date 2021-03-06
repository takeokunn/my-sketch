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
                        ((:file "my-sketch")
                         (:file "math")
                         (:file "utils")
                         (:file "color" :depends-on ("math" "utils"))
                         ;; (:file "pen" :depends-on ("color"))
                         )))
  :description ""
  :in-order-to ((test-op (test-op "my-sketch-test"))))
