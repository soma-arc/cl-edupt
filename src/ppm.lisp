(defpackage :cl-edupt/ppm
  (:use :cl))

(defun clamp (x)
  (cond ((< x 0) 0)
        ((> x 1) 1)
        (t x)))

(defun to-int (x)
  (floor (+ (* (expt (clamp x) (/ 1 2.2)) 255)
            0.5)))

(defun save-ppm (stream image width height)
  (format stream "P3~%~D ~D~%~D~%" width height 255)
  (loop for i from 0 below (* width height)
     do (format stream "~D ~D ~D~%"
                (to-int (v-x (svref image i)))
                (to-int (v-y (svref image i)))
                (to-int (v-z (svref image i))))))

