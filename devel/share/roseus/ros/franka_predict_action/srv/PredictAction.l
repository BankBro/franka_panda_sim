;; Auto-generated. Do not edit!


(when (boundp 'franka_predict_action::PredictAction)
  (if (not (find-package "FRANKA_PREDICT_ACTION"))
    (make-package "FRANKA_PREDICT_ACTION"))
  (shadow 'PredictAction (find-package "FRANKA_PREDICT_ACTION")))
(unless (find-package "FRANKA_PREDICT_ACTION::PREDICTACTION")
  (make-package "FRANKA_PREDICT_ACTION::PREDICTACTION"))
(unless (find-package "FRANKA_PREDICT_ACTION::PREDICTACTIONREQUEST")
  (make-package "FRANKA_PREDICT_ACTION::PREDICTACTIONREQUEST"))
(unless (find-package "FRANKA_PREDICT_ACTION::PREDICTACTIONRESPONSE")
  (make-package "FRANKA_PREDICT_ACTION::PREDICTACTIONRESPONSE"))

(in-package "ROS")





(defclass franka_predict_action::PredictActionRequest
  :super ros::object
  :slots (_model_name _instruction _unnorm_key ))

(defmethod franka_predict_action::PredictActionRequest
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

(defclass franka_predict_action::PredictActionResponse
  :super ros::object
  :slots (_predict_ret _action_flat _action_shape ))

(defmethod franka_predict_action::PredictActionResponse
  (:init
   (&key
    ((:predict_ret __predict_ret) nil)
    ((:action_flat __action_flat) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:action_shape __action_shape) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _predict_ret __predict_ret)
   (setq _action_flat __action_flat)
   (setq _action_shape __action_shape)
   self)
  (:predict_ret
   (&optional (__predict_ret :null))
   (if (not (eq __predict_ret :null)) (setq _predict_ret __predict_ret)) _predict_ret)
  (:action_flat
   (&optional __action_flat)
   (if __action_flat (setq _action_flat __action_flat)) _action_flat)
  (:action_shape
   (&optional __action_shape)
   (if __action_shape (setq _action_shape __action_shape)) _action_shape)
  (:serialization-length
   ()
   (+
    ;; bool _predict_ret
    1
    ;; float32[] _action_flat
    (* 4    (length _action_flat)) 4
    ;; uint8[] _action_shape
    (* 1    (length _action_shape)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _predict_ret
       (if _predict_ret (write-byte -1 s) (write-byte 0 s))
     ;; float32[] _action_flat
     (write-long (length _action_flat) s)
     (dotimes (i (length _action_flat))
       (sys::poke (elt _action_flat i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; uint8[] _action_shape
     (write-long (length _action_shape) s)
     (princ _action_shape s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _predict_ret
     (setq _predict_ret (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32[] _action_flat
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _action_flat (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _action_flat i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; uint8[] _action_shape
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _action_shape (make-array n :element-type :char))
     (replace _action_shape buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(defclass franka_predict_action::PredictAction
  :super ros::object
  :slots ())

(setf (get franka_predict_action::PredictAction :md5sum-) "ae8dd43aecc2d95dbde2901ca04451f5")
(setf (get franka_predict_action::PredictAction :datatype-) "franka_predict_action/PredictAction")
(setf (get franka_predict_action::PredictAction :request) franka_predict_action::PredictActionRequest)
(setf (get franka_predict_action::PredictAction :response) franka_predict_action::PredictActionResponse)

(defmethod franka_predict_action::PredictActionRequest
  (:response () (instance franka_predict_action::PredictActionResponse :init)))

(setf (get franka_predict_action::PredictActionRequest :md5sum-) "ae8dd43aecc2d95dbde2901ca04451f5")
(setf (get franka_predict_action::PredictActionRequest :datatype-) "franka_predict_action/PredictActionRequest")
(setf (get franka_predict_action::PredictActionRequest :definition-)
      "string model_name   # the name of the model to predict
string instruction  # the instruction sended to model for predicton
string unnorm_key   # the dataset of the scene

---

bool predict_ret         # result of prediction
float32[] action_flat     # the flatten predicted action
uint8[] action_shape      # the shape of the predicted action: [num_action, action_dim]
")

(setf (get franka_predict_action::PredictActionResponse :md5sum-) "ae8dd43aecc2d95dbde2901ca04451f5")
(setf (get franka_predict_action::PredictActionResponse :datatype-) "franka_predict_action/PredictActionResponse")
(setf (get franka_predict_action::PredictActionResponse :definition-)
      "string model_name   # the name of the model to predict
string instruction  # the instruction sended to model for predicton
string unnorm_key   # the dataset of the scene

---

bool predict_ret         # result of prediction
float32[] action_flat     # the flatten predicted action
uint8[] action_shape      # the shape of the predicted action: [num_action, action_dim]
")



(provide :franka_predict_action/PredictAction "ae8dd43aecc2d95dbde2901ca04451f5")


