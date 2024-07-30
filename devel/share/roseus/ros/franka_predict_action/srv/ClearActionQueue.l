;; Auto-generated. Do not edit!


(when (boundp 'franka_predict_action::ClearActionQueue)
  (if (not (find-package "FRANKA_PREDICT_ACTION"))
    (make-package "FRANKA_PREDICT_ACTION"))
  (shadow 'ClearActionQueue (find-package "FRANKA_PREDICT_ACTION")))
(unless (find-package "FRANKA_PREDICT_ACTION::CLEARACTIONQUEUE")
  (make-package "FRANKA_PREDICT_ACTION::CLEARACTIONQUEUE"))
(unless (find-package "FRANKA_PREDICT_ACTION::CLEARACTIONQUEUEREQUEST")
  (make-package "FRANKA_PREDICT_ACTION::CLEARACTIONQUEUEREQUEST"))
(unless (find-package "FRANKA_PREDICT_ACTION::CLEARACTIONQUEUERESPONSE")
  (make-package "FRANKA_PREDICT_ACTION::CLEARACTIONQUEUERESPONSE"))

(in-package "ROS")





(defclass franka_predict_action::ClearActionQueueRequest
  :super ros::object
  :slots ())

(defmethod franka_predict_action::ClearActionQueueRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass franka_predict_action::ClearActionQueueResponse
  :super ros::object
  :slots (_clear_ret ))

(defmethod franka_predict_action::ClearActionQueueResponse
  (:init
   (&key
    ((:clear_ret __clear_ret) nil)
    )
   (send-super :init)
   (setq _clear_ret __clear_ret)
   self)
  (:clear_ret
   (&optional (__clear_ret :null))
   (if (not (eq __clear_ret :null)) (setq _clear_ret __clear_ret)) _clear_ret)
  (:serialization-length
   ()
   (+
    ;; bool _clear_ret
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _clear_ret
       (if _clear_ret (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _clear_ret
     (setq _clear_ret (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass franka_predict_action::ClearActionQueue
  :super ros::object
  :slots ())

(setf (get franka_predict_action::ClearActionQueue :md5sum-) "9d33160d173e7ec57031aac816786381")
(setf (get franka_predict_action::ClearActionQueue :datatype-) "franka_predict_action/ClearActionQueue")
(setf (get franka_predict_action::ClearActionQueue :request) franka_predict_action::ClearActionQueueRequest)
(setf (get franka_predict_action::ClearActionQueue :response) franka_predict_action::ClearActionQueueResponse)

(defmethod franka_predict_action::ClearActionQueueRequest
  (:response () (instance franka_predict_action::ClearActionQueueResponse :init)))

(setf (get franka_predict_action::ClearActionQueueRequest :md5sum-) "9d33160d173e7ec57031aac816786381")
(setf (get franka_predict_action::ClearActionQueueRequest :datatype-) "franka_predict_action/ClearActionQueueRequest")
(setf (get franka_predict_action::ClearActionQueueRequest :definition-)
      "---

bool clear_ret
")

(setf (get franka_predict_action::ClearActionQueueResponse :md5sum-) "9d33160d173e7ec57031aac816786381")
(setf (get franka_predict_action::ClearActionQueueResponse :datatype-) "franka_predict_action/ClearActionQueueResponse")
(setf (get franka_predict_action::ClearActionQueueResponse :definition-)
      "---

bool clear_ret
")



(provide :franka_predict_action/ClearActionQueue "9d33160d173e7ec57031aac816786381")


