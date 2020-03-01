(defsystem "my-sketch-test"
  :defsystem-depends-on ("prove-asdf")
  :author "takeokunn"
  :license "GPLv3"
  :depends-on (:my-sketch
               :prove
               :alexandria
               :cl-geometry
               :glkit
               :mathkit
               :md5
               :sdl2-image
               :sdl2-ttf
               :sdl2kit
               :split-sequence
               :static-vectors)
  :components ((:module "tests"
                        :components
                        ((:test-file "my-sketch")
                         (:test-file "utils")
                         (:test-file "math"))))
  :description "Test system for my-sketch"
  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
