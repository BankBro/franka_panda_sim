
(cl:in-package :asdf)

(defsystem "franka_manipulate-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "MoveitPosCtl" :depends-on ("_package_MoveitPosCtl"))
    (:file "_package_MoveitPosCtl" :depends-on ("_package"))
  ))