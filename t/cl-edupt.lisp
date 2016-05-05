(in-package :cl-user)
(defpackage cl-edupt-test
  (:use :cl
        :cl-edupt
        :prove))
(in-package :cl-edupt-test)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-edupt)' in your Lisp.

(plan nil)

(let ((*default-test-function* #'equalp)
      (zero (vec3 0 0 0))
      (a (vec3 1 2 3))
      (b (vec3 3 4 5))
      (c (vec3 5 6 7)))
  (subtest "testing vec"
           (is (scale a 2)
               (vec3 2 4 6))
           (is (sum)
               (vec3 0 0 0))
           (is (sum a)
               (vec3 1 2 3))
           (is (sum a b c)
               (vec3 9 12 15))
           (is (diff a b)
               (vec3 -2 -2 -2))
           (is (diff a b c)
               (vec3 -7 -8 -9))
           (is (prod)
               (vec3 1 1 1))
           (is (prod a)
               (vec3 1 2 3))
           (is (prod a b c)
               (vec3 15 48 105))
           (is (quot a b)
               (vec3 (/ 1 3) (/ 2 4) (/ 3 5)))
           (is (quot a b c)
               (vec3 (/ 1 3 5) (/ 2 4 6) (/ 3 5 7)))
           (is (vlen-sq a) 14)
           (is (vlen-sq b) 50)
           (is (vlen-sq zero) 0)
           (is (vlen a) (sqrt 14))
           (is (vlen b) (sqrt 50))
           (is (vlen zero) 0)
           (is (dot a b) 26)
           (is (dot b c) 74)
           (is (cross a b) (vec3 -2 4 -2))
           (is (cross b c) (vec3 -2 4 -2))
           ))


(finalize)
