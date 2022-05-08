(defpackage :cl-edupt/vec3
  (:use :cl))

(defstruct (vec3
             (:conc-name v-)
             (:constructor make-vec3)
             (:constructor vec3 (x y z)))
  (x 0)
  (y 0)
  (z 0))

(defun scale (v k)
  (vec3 (* (v-x v) k)
        (* (v-y v) k)
        (* (v-z v) k)))

(defun sum (&rest vecs)
  (reduce (lambda (v1 v2)
            (setf (v-x v1) (+ (v-x v1) (v-x v2)))
            (setf (v-y v1) (+ (v-y v1) (v-y v2)))
            (setf (v-z v1) (+ (v-z v1) (v-z v2)))
            v1)
          vecs
          :initial-value (vec3 0 0 0)))

(defun diff (&rest vecs)
  (reduce (lambda (v1 v2)
            (vec3 (- (v-x v1) (v-x v2))
                  (- (v-y v1) (v-y v2))
                  (- (v-z v1) (v-z v2))))
          vecs))

(defun prod (&rest vecs)
  (reduce (lambda (v1 v2)
            (setf (v-x v1) (* (v-x v1) (v-x v2)))
            (setf (v-y v1) (* (v-y v1) (v-y v2)))
            (setf (v-z v1) (* (v-z v1) (v-z v2)))
            v1)
          vecs
          :initial-value (vec3 1 1 1)))

(defun quot (&rest vecs)
  (reduce (lambda (v1 v2)
            (vec3 (/ (v-x v1) (v-x v2))
                  (/ (v-y v1) (v-y v2))
                  (/ (v-z v1) (v-z v2))))
          vecs))

(defun dot (v1 v2)
  (+ (* (v-x v1) (v-x v2))
     (* (v-y v1) (v-y v2))
     (* (v-z v1) (v-z v2))))

(defun cross (v1 v2)
  (vec3 (- (* (v-y v1) (v-z v2)) (* (v-z v1) (v-y v2)))
        (- (* (v-z v1) (v-x v2)) (* (v-x v1) (v-z v2)))
        (- (* (v-x v1) (v-y v2)) (* (v-y v1) (v-x v2)))))

(defun vlen-sq (v)
  (+ (* (v-x v) (v-x v))
     (* (v-y v) (v-y v))
     (* (v-z v) (v-z v))))

(defun vlen (v)
  (sqrt (vlen-sq v)))

(defun normalize! (v)
  (let ((l (vlen v)))
    (setf (v-x v) (/ (v-x v) l))
    (setf (v-y v) (/ (v-y v) l))
    (setf (v-z v) (/ (v-z v) l)))
  v)
