; Auto-generated. Do not edit!


(cl:in-package franka_manipulate-srv)


;//! \htmlinclude MoveitPosCtl-request.msg.html

(cl:defclass <MoveitPosCtl-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0)
   (pitch
    :reader pitch
    :initarg :pitch
    :type cl:float
    :initform 0.0)
   (roll
    :reader roll
    :initarg :roll
    :type cl:float
    :initform 0.0))
)

(cl:defclass MoveitPosCtl-request (<MoveitPosCtl-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveitPosCtl-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveitPosCtl-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_manipulate-srv:<MoveitPosCtl-request> is deprecated: use franka_manipulate-srv:MoveitPosCtl-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <MoveitPosCtl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_manipulate-srv:x-val is deprecated.  Use franka_manipulate-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <MoveitPosCtl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_manipulate-srv:y-val is deprecated.  Use franka_manipulate-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <MoveitPosCtl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_manipulate-srv:z-val is deprecated.  Use franka_manipulate-srv:z instead.")
  (z m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <MoveitPosCtl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_manipulate-srv:yaw-val is deprecated.  Use franka_manipulate-srv:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <MoveitPosCtl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_manipulate-srv:pitch-val is deprecated.  Use franka_manipulate-srv:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'roll-val :lambda-list '(m))
(cl:defmethod roll-val ((m <MoveitPosCtl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_manipulate-srv:roll-val is deprecated.  Use franka_manipulate-srv:roll instead.")
  (roll m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveitPosCtl-request>) ostream)
  "Serializes a message object of type '<MoveitPosCtl-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveitPosCtl-request>) istream)
  "Deserializes a message object of type '<MoveitPosCtl-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveitPosCtl-request>)))
  "Returns string type for a service object of type '<MoveitPosCtl-request>"
  "franka_manipulate/MoveitPosCtlRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveitPosCtl-request)))
  "Returns string type for a service object of type 'MoveitPosCtl-request"
  "franka_manipulate/MoveitPosCtlRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveitPosCtl-request>)))
  "Returns md5sum for a message object of type '<MoveitPosCtl-request>"
  "945ea5a2f427feb9ae87e22a769e0733")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveitPosCtl-request)))
  "Returns md5sum for a message object of type 'MoveitPosCtl-request"
  "945ea5a2f427feb9ae87e22a769e0733")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveitPosCtl-request>)))
  "Returns full string definition for message of type '<MoveitPosCtl-request>"
  (cl:format cl:nil "# position in world frame, unit: meter~%float32 x~%float32 y~%float32 z~%~%# Euler angles(intrinsic rotation), unit: radian~%float32 yaw    # z axis~%float32 pitch  # y axis~%float32 roll   # x axis~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveitPosCtl-request)))
  "Returns full string definition for message of type 'MoveitPosCtl-request"
  (cl:format cl:nil "# position in world frame, unit: meter~%float32 x~%float32 y~%float32 z~%~%# Euler angles(intrinsic rotation), unit: radian~%float32 yaw    # z axis~%float32 pitch  # y axis~%float32 roll   # x axis~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveitPosCtl-request>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveitPosCtl-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveitPosCtl-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':roll (roll msg))
))
;//! \htmlinclude MoveitPosCtl-response.msg.html

(cl:defclass <MoveitPosCtl-response> (roslisp-msg-protocol:ros-message)
  ((go_ret
    :reader go_ret
    :initarg :go_ret
    :type cl:fixnum
    :initform 0))
)

(cl:defclass MoveitPosCtl-response (<MoveitPosCtl-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveitPosCtl-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveitPosCtl-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_manipulate-srv:<MoveitPosCtl-response> is deprecated: use franka_manipulate-srv:MoveitPosCtl-response instead.")))

(cl:ensure-generic-function 'go_ret-val :lambda-list '(m))
(cl:defmethod go_ret-val ((m <MoveitPosCtl-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_manipulate-srv:go_ret-val is deprecated.  Use franka_manipulate-srv:go_ret instead.")
  (go_ret m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveitPosCtl-response>) ostream)
  "Serializes a message object of type '<MoveitPosCtl-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'go_ret)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveitPosCtl-response>) istream)
  "Deserializes a message object of type '<MoveitPosCtl-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'go_ret)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveitPosCtl-response>)))
  "Returns string type for a service object of type '<MoveitPosCtl-response>"
  "franka_manipulate/MoveitPosCtlResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveitPosCtl-response)))
  "Returns string type for a service object of type 'MoveitPosCtl-response"
  "franka_manipulate/MoveitPosCtlResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveitPosCtl-response>)))
  "Returns md5sum for a message object of type '<MoveitPosCtl-response>"
  "945ea5a2f427feb9ae87e22a769e0733")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveitPosCtl-response)))
  "Returns md5sum for a message object of type 'MoveitPosCtl-response"
  "945ea5a2f427feb9ae87e22a769e0733")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveitPosCtl-response>)))
  "Returns full string definition for message of type '<MoveitPosCtl-response>"
  (cl:format cl:nil "~%# result of action~%uint8 go_ret~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveitPosCtl-response)))
  "Returns full string definition for message of type 'MoveitPosCtl-response"
  (cl:format cl:nil "~%# result of action~%uint8 go_ret~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveitPosCtl-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveitPosCtl-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveitPosCtl-response
    (cl:cons ':go_ret (go_ret msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoveitPosCtl)))
  'MoveitPosCtl-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoveitPosCtl)))
  'MoveitPosCtl-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveitPosCtl)))
  "Returns string type for a service object of type '<MoveitPosCtl>"
  "franka_manipulate/MoveitPosCtl")