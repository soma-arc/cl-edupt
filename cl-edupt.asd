(defsystem cl-edupt
  :version "0.1"
  :author "soma_arc"
  :license "MIT"
  :pathname "src/"
  :depends-on ("cl-edupt/cl-edupt")
  :class :package-inferred-system
  :description "Common Lisp implementation of edupt"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.md"
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
