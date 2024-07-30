
(cl:in-package :asdf)

(defsystem "franka_predict_action-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ClearActionQueue" :depends-on ("_package_ClearActionQueue"))
    (:file "_package_ClearActionQueue" :depends-on ("_package"))
    (:file "FetchSingleAction" :depends-on ("_package_FetchSingleAction"))
    (:file "_package_FetchSingleAction" :depends-on ("_package"))
    (:file "PredictAction" :depends-on ("_package_PredictAction"))
    (:file "_package_PredictAction" :depends-on ("_package"))
    (:file "StoreNewActionToQueue" :depends-on ("_package_StoreNewActionToQueue"))
    (:file "_package_StoreNewActionToQueue" :depends-on ("_package"))
  ))