(defpackage my-sketch-test.color
  (:use :cl :prove :my-sketch.color))
(in-package :my-sketch-test.color)

(plan nil)

;; rgb-to-hsb
(is (rgb-to-hsb 255 0 0) '(0 1 255))
(is (rgb-to-hsb 80 80 80) '(0 0 80))
(is (rgb-to-hsb 120 80 90) '(23/24 1/3 120))

;; hsb-to-rgb
(is (hsb-to-rgb 0 1 255) '(255 0 0))
(is (hsb-to-rgb 0 0 80) '(80 80 80))
(is (hsb-to-rgb 23/24 1/3 120) '(120 80 90))

;; rgb
(is (color-red (rgb 1 0 0)) (color-red +red+))
(is (color-green (rgb 0 1 0)) (color-green +green+))
(is (color-blue (rgb 0 0 1)) (color-blue +blue+))
(is (color-alpha (rgb 0 0 1 0.8)) 0.8)

;; hsb
(is (color-hue (hsb 0.1 100 100)) 0.1)
(is (color-saturation (hsb 0 0.8 1)) 0.8)
(is (color-brightness (hsb 0 0.8 0.9)) 0.9)
(is (color-alpha (hsb 0.1 0.9 0.7 0.8)) 0.8)

;; gray
(is (color-red (gray 0.8)) 0.8)
(is (color-alpha (gray 0.8 0.5)) 0.5)

;; rgb-255
(is (color-red (rgb-255 18 28 38)) 18/255)
(is (color-green (rgb-255 18 28 38)) 28/255)
(is (color-blue (rgb-255 18 28 38)) 38/255)
(is (color-alpha (rgb-255 188 188 100 100)) 100/255)

;; hsb-360
(is (color-hue (hsb-360 280 80 70)) 280/360)
(is (color-saturation (hsb-360 280 80 70)) 80/100)
(is (color-brightness (hsb-360 280 80 70)) 70/100)
(is (color-alpha (hsb-360 280 80 70 100)) 100/255)

;; gray-255
(is (color-red (gray-255 80)) 80/255)
(is (color-alpha (gray-255 80 70)) 70/255)

;; hex-to-color
(is (color-red (hex-to-color "#ffb6c1")) 255/255)
(is (color-green (hex-to-color "#ffb6c1")) 182/255)
(is (color-blue (hex-to-color "#ffb6c1")) 193/255)

;; color-rgb
(is (color-rgb (rgb 0.8 0.7 0.6)) '(0.8 0.7 0.6))

;; color-rgba
(is (color-rgba (rgb 0.8 0.7 0.6 0.8)) '(0.8 0.7 0.6 0.8))

;; color-rgba-255
(is (color-rgba-255 (rgb 0.8 0.6 0.4 1)) '(204 153 102 255))

;; color-hsba
(is (color-hsba (hsb 0.1 0.9 0.7 0.8)) '(0.1 0.9 0.7 0.8))

;; color-vector
(is (aref (color-vector (rgb 0.8 0.6 0.4 1)) 0) 0.8)
(is (aref (color-vector (rgb 0.8 0.6 0.4 1)) 1) 0.6)
(is (aref (color-vector (rgb 0.8 0.6 0.4 1)) 2) 0.4)
(is (aref (color-vector (rgb 0.8 0.6 0.4 1)) 3) 1.0)

;; color-vector-255
(is (aref (color-vector-255 (rgb 0.8 0.6 0.4 1)) 0) 204)
(is (aref (color-vector-255 (rgb 0.8 0.6 0.4 1)) 1) 153)
(is (aref (color-vector-255 (rgb 0.8 0.6 0.4 1)) 2) 102)
(is (aref (color-vector-255 (rgb 0.8 0.6 0.4 1)) 3) 255)

;; lerp-color
(is (color-hue (lerp-color (hsb 0.2 0.3 0.4 0.5) (hsb 0.4 0.5 0.6 0.7) 0.5)) 0.3)
(is (color-saturation (lerp-color (hsb 0.2 0.3 0.4 0.5) (hsb 0.4 0.5 0.6 0.7) 0.5)) 0.4)
(is (color-brightness (lerp-color (hsb 0.2 0.3 0.4 0.5) (hsb 0.4 0.5 0.6 0.7) 0.5)) 0.5)
(is (color-alpha (lerp-color (hsb 0.2 0.3 0.4 0.5) (hsb 0.4 0.5 0.6 0.7) 0.5)) 0.6)

(is (color-red (lerp-color (rgb 0.2 0.3 0.4 0.5) (rgb 0.4 0.5 0.6 0.7) 0.5 :mode 'rgb)) 0.3)
(is (color-green (lerp-color (rgb 0.2 0.3 0.4 0.5) (rgb 0.4 0.5 0.6 0.7) 0.5 :mode 'rgb)) 0.4)
(is (color-blue (lerp-color (rgb 0.2 0.3 0.4 0.5) (rgb 0.4 0.5 0.6 0.7) 0.5 :mode 'rgb)) 0.5)
(is (color-alpha (lerp-color (rgb 0.2 0.3 0.4 0.5) (rgb 0.4 0.5 0.6 0.7) 0.5 :mode 'rgb)) 0.6)

;; random-color
(is (color-alpha (random-color 0.5)) 0.5)

;; hash-color
(is (color-hue (hash-color 1)) 23/45)
(is (color-saturation (hash-color 1)) 1/4)
(is (color-brightness (hash-color 1)) 1/2)

;; color-filter-grayscale
(is (color-rgba (color-filter-grayscale (rgb 0.6 0.2 0.3 0.8) :lightness)) '(1.0 1.0 1.0 0.8))
(is (color-rgba (color-filter-grayscale (rgb 0.6 0.2 0.4 0.8) :average)) '(0.4 0.4 0.4 0.8))
(is (color-rgba (color-filter-grayscale (rgb 0.6 0.2 0.4 0.8))) '(0.298 0.298 0.298 0.8))

;; color-filter-invert
(is (color-hsba (color-filter-invert (hsb 0.1 0.8 0.9))) '(0.6 0.8 0.9 1.0))

;; color-filter-rotate
(is (color-rgb (color-filter-rotate (rgb 0.1 0.3 0.5))) '(0.3 0.5 0.1))

;; color-filter-hsb
(is (color-hsba (color-filter-hsb (hsb 0.1 0.8 0.9))) '(0.1 0.9 0.9 1.0))

(finalize)
