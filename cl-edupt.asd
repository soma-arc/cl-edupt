#|
  This file is a part of cl-edupt project.
  Copyright (c) 2016 soma_arc
|#

#|
  Common Lisp implementation of edupt

  Author: soma_arc
|#

(in-package :cl-user)
(defpackage cl-edupt-asd
  (:use :cl :asdf))
(in-package :cl-edupt-asd)

(defsystem cl-edupt
  :version "0.1"
  :author "soma_arc"
  :license "MIT"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "cl-edupt"))))
  :description "Common Lisp implementation of edupt"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op cl-edupt-test))))
