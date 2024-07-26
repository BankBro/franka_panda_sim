;; Auto-generated. Do not edit!


(when (boundp 'franka_predict_action::StoreNewActionToQueue)
  (if (not (find-package "FRANKA_PREDICT_ACTION"))
    (make-package "FRANKA_PREDICT_ACTION"))
  (shadow 'StoreNewActionToQueue (find-package "FRANKA_PREDICT_ACTION")))
(unless (find-package "FRANKA_PREDICT_ACTION::STORENEWACTIONTOQUEUE")
  (make-package "FRANKA_PREDICT_ACTION::STORENEWACTIONTOQUEUE"))
(unless (find-package "FRANKA_PREDICT_ACTION::STORENEWACTIONTOQUEUEREQUEST")
  (make-package "FRANKA_PREDICT_ACTION::STORENEWACTIONTOQUEUEREQUEST"))
(unless (find-package "FRANKA_PREDICT_ACTION::STORENEWACTIONTOQUEUERESPONSE")
  (make-package "FRANKA_PREDICT_ACTION::STORENEWACTIONTOQUEUERESPONSE"))

(in-package "ROS")





(defclass franka_predict_action::StoreNewActionToQueueRequest
  :super ros::object
  :slots (_model_name _instruction _unnorm_key ))

(defmethod franka_predict_action::StoreNewActionToQueueRequest
  (:init
   (&key
    ((:model_name __model_name) "")
    ((:instruction __instruction) "")
    ((:unnorm_key __unnorm_key) "")
    )
   (send-super :init)
   (setq _model_name (string __model_name))
   (setq _instruction (string __instruction))
   (setq _unnorm_key (string __unnorm_key))
   self)
  (:model_name
   (&optional __model_name)
   (if __model_name (setq _model_name __model_name)) _model_name)
  (:instruction
   (&optional __instruction)
   (if __instruction (setq _instruction __instruction)) _instruction)
  (:unnorm_key
   (&optional __unnorm_key)
   (if __unnorm_key (setq _unnorm_key __unnorm_key)) _unnorm_key)
  (:serialization-length
   ()
   (+
    ;; string _model_name
    4 (length _model_name)
    ;; string _instruction
    4 (length _instruction)
    ;; string _unnorm_key
    4 (length _unnorm_key)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _model_name
       (write-long (length _model_name) s) (princ _model_name s)
     ;; string _instruction
       (write-long (length _instruction) s) (princ _instruction s)
     ;; string _unnorm_key
       (write-long (length _unnorm_key) s) (princ _unnorm_key s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _model_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _model_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _instruction
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _instruction (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _unnorm_key
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _unnorm_key (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass franka_predict_action::StoreNewActionToQueueResponse
  :super ros::object
  :slots (_store_ret ))

(defmethod franka_predict_action::StoreNewActionToQueueResponse
  (:init
   (&key
    ((:store_ret __store_ret) nil)
    )
   (send-super :init)
   (setq _store_ret __store_ret)
   self)
  (:store_ret
   (&optional (__store_ret :null))
   (if (not (eq __store_ret :null)) (setq _store_ret __store_ret)) _store_ret)
  (:serialization-length
   ()
   (+
    ;; bool _store_ret
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _store_ret
       (if _store_ret (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _store_ret
     (setq _store_ret (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass franka_predict_action::StoreNewActionToQueue
  :super ros::object
  :slots ())

(setf (get franka_predict_action::StoreNewActionToQueue :md5sum-) "5b013e147fda06393de0b2e74bcdcf2c")
(setf (get franka_predict_action::StoreNewActionToQueue :datatype-) "franka_predict_action/StoreNewActionToQueue")
(setf (get franka_predict_action::StoreNewActionToQueue :request) franka_predict_action::StoreNewActionToQueueRequest)
(setf (get franka_predict_action::StoreNewActionToQueue :response) franka_predict_action::StoreNewActionToQueueResponse)

(defmethod franka_predict_action::StoreNewActionToQueueRequest
  (:response () (instance franka_predict_action::StoreNewActionToQueueResponse :init)))

(setf (get franka_predict_action::StoreNewActionToQueueRequest :md5sum-) "5b013e147fda06393de0b2e74bcdcf2c")
(setf (get franka_predict_action::StoreNewActionToQueueRequest :datatype-) "franka_predict_action/StoreNewActionToQueueRequest")
(setf (get franka_predict_action::StoreNewActionToQueueRequest :definition-)
      "string model_name   # the name of the model to predict
string instruction  # the instruction sended to model for predicton
string unnorm_key   # the dataset of the scene

---

bool store_ret  # the result of storing the new action
")

(setf (get franka_predict_action::StoreNewActionToQueueResponse :md5sum-) "5b013e147fda06393de0b2e74bcdcf2c")
(setf (get franka_predict_action::StoreNewActionToQueueResponse :datatype-) "franka_predict_action/StoreNewActionToQueueResponse")
(setf (get franka_predict_action::StoreNewActionToQueueResponse :definition-)
      "string model_name   # the name of the model to predict
string instruction  # the instruction sended to model for predicton
string unnorm_key   # the dataset of the scene

---

bool store_ret  # the result of storing the new action
")



(provide :franka_predict_action/StoreNewActionToQueue "5b013e147fda06393de0b2e74bcdcf2c")


