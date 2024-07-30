;; Auto-generated. Do not edit!


(when (boundp 'franka_predict_action::FetchSingleAction)
  (if (not (find-package "FRANKA_PREDICT_ACTION"))
    (make-package "FRANKA_PREDICT_ACTION"))
  (shadow 'FetchSingleAction (find-package "FRANKA_PREDICT_ACTION")))
(unless (find-package "FRANKA_PREDICT_ACTION::FETCHSINGLEACTION")
  (make-package "FRANKA_PREDICT_ACTION::FETCHSINGLEACTION"))
(unless (find-package "FRANKA_PREDICT_ACTION::FETCHSINGLEACTIONREQUEST")
  (make-package "FRANKA_PREDICT_ACTION::FETCHSINGLEACTIONREQUEST"))
(unless (find-package "FRANKA_PREDICT_ACTION::FETCHSINGLEACTIONRESPONSE")
  (make-package "FRANKA_PREDICT_ACTION::FETCHSINGLEACTIONRESPONSE"))

(in-package "ROS")





(defclass franka_predict_action::FetchSingleActionRequest
  :super ros::object
  :slots ())

(defmethod franka_predict_action::FetchSingleActionRequest
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

(defclass franka_predict_action::FetchSingleActionResponse
  :super ros::object
  :slots (_fetch_ret _action _queue_size ))

(defmethod franka_predict_action::FetchSingleActionResponse
  (:init
   (&key
    ((:fetch_ret __fetch_ret) nil)
    ((:action __action) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:queue_size __queue_size) 0)
    )
   (send-super :init)
   (setq _fetch_ret __fetch_ret)
   (setq _action __action)
   (setq _queue_size (round __queue_size))
   self)
  (:fetch_ret
   (&optional (__fetch_ret :null))
   (if (not (eq __fetch_ret :null)) (setq _fetch_ret __fetch_ret)) _fetch_ret)
  (:action
   (&optional __action)
   (if __action (setq _action __action)) _action)
  (:queue_size
   (&optional __queue_size)
   (if __queue_size (setq _queue_size __queue_size)) _queue_size)
  (:serialization-length
   ()
   (+
    ;; bool _fetch_ret
    1
    ;; float32[] _action
    (* 4    (length _action)) 4
    ;; uint8 _queue_size
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _fetch_ret
       (if _fetch_ret (write-byte -1 s) (write-byte 0 s))
     ;; float32[] _action
     (write-long (length _action) s)
     (dotimes (i (length _action))
       (sys::poke (elt _action i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; uint8 _queue_size
       (write-byte _queue_size s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _fetch_ret
     (setq _fetch_ret (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32[] _action
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _action (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _action i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; uint8 _queue_size
     (setq _queue_size (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass franka_predict_action::FetchSingleAction
  :super ros::object
  :slots ())

(setf (get franka_predict_action::FetchSingleAction :md5sum-) "d42957ee35d3ee4cc592b207953e1495")
(setf (get franka_predict_action::FetchSingleAction :datatype-) "franka_predict_action/FetchSingleAction")
(setf (get franka_predict_action::FetchSingleAction :request) franka_predict_action::FetchSingleActionRequest)
(setf (get franka_predict_action::FetchSingleAction :response) franka_predict_action::FetchSingleActionResponse)

(defmethod franka_predict_action::FetchSingleActionRequest
  (:response () (instance franka_predict_action::FetchSingleActionResponse :init)))

(setf (get franka_predict_action::FetchSingleActionRequest :md5sum-) "d42957ee35d3ee4cc592b207953e1495")
(setf (get franka_predict_action::FetchSingleActionRequest :datatype-) "franka_predict_action/FetchSingleActionRequest")
(setf (get franka_predict_action::FetchSingleActionRequest :definition-)
      "---
bool fetch_ret    # fetching result
float32[] action  # single action
uint8 queue_size  # the size of the queue after fetching
")

(setf (get franka_predict_action::FetchSingleActionResponse :md5sum-) "d42957ee35d3ee4cc592b207953e1495")
(setf (get franka_predict_action::FetchSingleActionResponse :datatype-) "franka_predict_action/FetchSingleActionResponse")
(setf (get franka_predict_action::FetchSingleActionResponse :definition-)
      "---
bool fetch_ret    # fetching result
float32[] action  # single action
uint8 queue_size  # the size of the queue after fetching
")



(provide :franka_predict_action/FetchSingleAction "d42957ee35d3ee4cc592b207953e1495")


