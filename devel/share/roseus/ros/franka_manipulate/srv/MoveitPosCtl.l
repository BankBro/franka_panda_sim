;; Auto-generated. Do not edit!


(when (boundp 'franka_manipulate::MoveitPosCtl)
  (if (not (find-package "FRANKA_MANIPULATE"))
    (make-package "FRANKA_MANIPULATE"))
  (shadow 'MoveitPosCtl (find-package "FRANKA_MANIPULATE")))
(unless (find-package "FRANKA_MANIPULATE::MOVEITPOSCTL")
  (make-package "FRANKA_MANIPULATE::MOVEITPOSCTL"))
(unless (find-package "FRANKA_MANIPULATE::MOVEITPOSCTLREQUEST")
  (make-package "FRANKA_MANIPULATE::MOVEITPOSCTLREQUEST"))
(unless (find-package "FRANKA_MANIPULATE::MOVEITPOSCTLRESPONSE")
  (make-package "FRANKA_MANIPULATE::MOVEITPOSCTLRESPONSE"))

(in-package "ROS")





(defclass franka_manipulate::MoveitPosCtlRequest
  :super ros::object
  :slots (_x _y _z _yaw _pitch _roll ))

(defmethod franka_manipulate::MoveitPosCtlRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:yaw __yaw) 0.0)
    ((:pitch __pitch) 0.0)
    ((:roll __roll) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _yaw (float __yaw))
   (setq _pitch (float __pitch))
   (setq _roll (float __roll))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _z
    4
    ;; float32 _yaw
    4
    ;; float32 _pitch
    4
    ;; float32 _roll
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _z
       (sys::poke _z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _z
     (setq _z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pitch
     (setq _pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _roll
     (setq _roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass franka_manipulate::MoveitPosCtlResponse
  :super ros::object
  :slots (_go_ret ))

(defmethod franka_manipulate::MoveitPosCtlResponse
  (:init
   (&key
    ((:go_ret __go_ret) 0)
    )
   (send-super :init)
   (setq _go_ret (round __go_ret))
   self)
  (:go_ret
   (&optional __go_ret)
   (if __go_ret (setq _go_ret __go_ret)) _go_ret)
  (:serialization-length
   ()
   (+
    ;; uint8 _go_ret
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _go_ret
       (write-byte _go_ret s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _go_ret
     (setq _go_ret (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass franka_manipulate::MoveitPosCtl
  :super ros::object
  :slots ())

(setf (get franka_manipulate::MoveitPosCtl :md5sum-) "945ea5a2f427feb9ae87e22a769e0733")
(setf (get franka_manipulate::MoveitPosCtl :datatype-) "franka_manipulate/MoveitPosCtl")
(setf (get franka_manipulate::MoveitPosCtl :request) franka_manipulate::MoveitPosCtlRequest)
(setf (get franka_manipulate::MoveitPosCtl :response) franka_manipulate::MoveitPosCtlResponse)

(defmethod franka_manipulate::MoveitPosCtlRequest
  (:response () (instance franka_manipulate::MoveitPosCtlResponse :init)))

(setf (get franka_manipulate::MoveitPosCtlRequest :md5sum-) "945ea5a2f427feb9ae87e22a769e0733")
(setf (get franka_manipulate::MoveitPosCtlRequest :datatype-) "franka_manipulate/MoveitPosCtlRequest")
(setf (get franka_manipulate::MoveitPosCtlRequest :definition-)
      "# position in world frame, unit: meter
float32 x
float32 y
float32 z

# Euler angles(intrinsic rotation), unit: radian
float32 yaw    # z axis
float32 pitch  # y axis
float32 roll   # x axis

---

# result of action
uint8 go_ret
")

(setf (get franka_manipulate::MoveitPosCtlResponse :md5sum-) "945ea5a2f427feb9ae87e22a769e0733")
(setf (get franka_manipulate::MoveitPosCtlResponse :datatype-) "franka_manipulate/MoveitPosCtlResponse")
(setf (get franka_manipulate::MoveitPosCtlResponse :definition-)
      "# position in world frame, unit: meter
float32 x
float32 y
float32 z

# Euler angles(intrinsic rotation), unit: radian
float32 yaw    # z axis
float32 pitch  # y axis
float32 roll   # x axis

---

# result of action
uint8 go_ret
")



(provide :franka_manipulate/MoveitPosCtl "945ea5a2f427feb9ae87e22a769e0733")


