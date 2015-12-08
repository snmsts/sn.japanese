#|
  This file is a part of sn.japanese project.
  Copyright (c) 2015 SANO Masatoshi (snmsts@gmail.com)
|#

#|
  sn.japanese

  Author: SANO Masatoshi (snmsts@gmail.com)
|#



(in-package :cl-user)
(defpackage sn.japanese-asd
  (:use :cl :asdf))
(in-package :sn.japanese-asd)


(defsystem sn.japanese
  :version "0.1"
  :author "SANO Masatoshi"
  :mailto "snmsts@gmail.com"
  :license "MIT"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "package"))))
  :description "sn.japanese"
  :in-order-to ((test-op (load-op :sn.japanese.test))))
