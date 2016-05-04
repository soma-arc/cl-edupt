#|
  This file is a part of cl-edupt project.
  Copyright (c) 2016 soma_arc
|#

(in-package :cl-user)
(defpackage cl-edupt-test-asd
  (:use :cl :asdf))
(in-package :cl-edupt-test-asd)

(defsystem cl-edupt-test
  :author "soma_arc"
  :license "MIT"
  :depends-on (:cl-edupt
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "cl-edupt"))))
  :description "Test system for cl-edupt"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
