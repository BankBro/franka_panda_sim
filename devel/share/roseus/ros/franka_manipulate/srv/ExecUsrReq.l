;; Auto-generated. Do not edit!


(when (boundp 'franka_manipulate::ExecUsrReq)
  (if (not (find-package "FRANKA_MANIPULATE"))
    (make-package "FRANKA_MANIPULATE"))
  (shadow 'ExecUsrReq (find-package "FRANKA_MANIPULATE")))
(unless (find-package "FRANKA_MANIPULATE::EXECUSRREQ")
  (make-package "FRANKA_MANIPULATE::EXECUSRREQ"))
(unless (find-package "FRANKA_MANIPULATE::EXECUSRREQREQUEST")
  (make-package "FRANKA_MANIPULATE::EXECUSRREQREQUEST"))
(unless (find-package "FRANKA_MANIPULATE::EXECUSRREQRESPONSE")
  (make-package "FRANKA_MANIPULATE::EXECUSRREQRESPONSE"))

(in-package "ROS")





(defclass franka_manipulate::ExecUsrReqRequest
  :super ros::object
  :slots (_model_name _instruction _unnorm_key ))

(defmethod franka_manipulate::ExecUsrReqRequest
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

(defclass franka_manipulate::ExecUsrReqResponse
  :super ros::object
  :slots (_exec_usr_req_ret ))

(defmethod franka_manipulate::ExecUsrReqResponse
  (:init
   (&key
    ((:exec_usr_req_ret __exec_usr_req_ret) nil)
    )
   (send-super :init)
   (setq _exec_usr_req_ret __exec_usr_req_ret)
   self)
  (:exec_usr_req_ret
   (&optional (__exec_usr_req_ret :null))
   (if (not (eq __exec_usr_req_ret :null)) (setq _exec_usr_req_ret __exec_usr_req_ret)) _exec_usr_req_ret)
  (:serialization-length
   ()
   (+
    ;; bool _exec_usr_req_ret
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _exec_usr_req_ret
       (if _exec_usr_req_ret (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _exec_usr_req_ret
     (setq _exec_usr_req_ret (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass franka_manipulate::ExecUsrReq
  :super ros::object
  :slots ())

(setf (get franka_manipulate::ExecUsrReq :md5sum-) "8547ce5d173f55fbcf01cd3bf7a775f5")
(setf (get franka_manipulate::ExecUsrReq :datatype-) "franka_manipulate/ExecUsrReq")
(setf (get franka_manipulate::ExecUsrReq :request) franka_manipulate::ExecUsrReqRequest)
(setf (get franka_manipulate::ExecUsrReq :response) franka_manipulate::ExecUsrReqResponse)

(defmethod franka_manipulate::ExecUsrReqRequest
  (:response () (instance franka_manipulate::ExecUsrReqResponse :init)))

(setf (get franka_manipulate::ExecUsrReqRequest :md5sum-) "8547ce5d173f55fbcf01cd3bf7a775f5")
(setf (get franka_manipulate::ExecUsrReqRequest :datatype-) "franka_manipulate/ExecUsrReqRequest")
(setf (get franka_manipulate::ExecUsrReqRequest :definition-)
      "string model_name   # the name of the model to predict
string instruction  # the instruction sended to model for predicton
string unnorm_key   # the dataset of the scene

---

bool exec_usr_req_ret
")

(setf (get franka_manipulate::ExecUsrReqResponse :md5sum-) "8547ce5d173f55fbcf01cd3bf7a775f5")
(setf (get franka_manipulate::ExecUsrReqResponse :datatype-) "franka_manipulate/ExecUsrReqResponse")
(setf (get franka_manipulate::ExecUsrReqResponse :definition-)
      "string model_name   # the name of the model to predict
string instruction  # the instruction sended to model for predicton
string unnorm_key   # the dataset of the scene

---

bool exec_usr_req_ret
")



(provide :franka_manipulate/ExecUsrReq "8547ce5d173f55fbcf01cd3bf7a775f5")


