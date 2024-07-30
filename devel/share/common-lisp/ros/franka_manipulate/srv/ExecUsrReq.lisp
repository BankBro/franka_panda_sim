; Auto-generated. Do not edit!


(cl:in-package franka_manipulate-srv)


;//! \htmlinclude ExecUsrReq-request.msg.html

(cl:defclass <ExecUsrReq-request> (roslisp-msg-protocol:ros-message)
  ((model_name
    :reader model_name
    :initarg :model_name
    :type cl:string
    :initform "")
   (instruction
    :reader instruction
    :initarg :instruction
    :type cl:string
    :initform "")
   (unnorm_key
    :reader unnorm_key
    :initarg :unnorm_key
    :type cl:string
    :initform ""))
)

(cl:defclass ExecUsrReq-request (<ExecUsrReq-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecUsrReq-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecUsrReq-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_manipulate-srv:<ExecUsrReq-request> is deprecated: use franka_manipulate-srv:ExecUsrReq-request instead.")))

(cl:ensure-generic-function 'model_name-val :lambda-list '(m))
(cl:defmethod model_name-val ((m <ExecUsrReq-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_manipulate-srv:model_name-val is deprecated.  Use franka_manipulate-srv:model_name instead.")
  (model_name m))

(cl:ensure-generic-function 'instruction-val :lambda-list '(m))
(cl:defmethod instruction-val ((m <ExecUsrReq-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_manipulate-srv:instruction-val is deprecated.  Use franka_manipulate-srv:instruction instead.")
  (instruction m))

(cl:ensure-generic-function 'unnorm_key-val :lambda-list '(m))
(cl:defmethod unnorm_key-val ((m <ExecUsrReq-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_manipulate-srv:unnorm_key-val is deprecated.  Use franka_manipulate-srv:unnorm_key instead.")
  (unnorm_key m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecUsrReq-request>) ostream)
  "Serializes a message object of type '<ExecUsrReq-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'model_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'model_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'instruction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'instruction))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'unnorm_key))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'unnorm_key))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecUsrReq-request>) istream)
  "Deserializes a message object of type '<ExecUsrReq-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'model_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'model_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'instruction) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'instruction) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'unnorm_key) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'unnorm_key) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExecUsrReq-request>)))
  "Returns string type for a service object of type '<ExecUsrReq-request>"
  "franka_manipulate/ExecUsrReqRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecUsrReq-request)))
  "Returns string type for a service object of type 'ExecUsrReq-request"
  "franka_manipulate/ExecUsrReqRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExecUsrReq-request>)))
  "Returns md5sum for a message object of type '<ExecUsrReq-request>"
  "8547ce5d173f55fbcf01cd3bf7a775f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecUsrReq-request)))
  "Returns md5sum for a message object of type 'ExecUsrReq-request"
  "8547ce5d173f55fbcf01cd3bf7a775f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecUsrReq-request>)))
  "Returns full string definition for message of type '<ExecUsrReq-request>"
  (cl:format cl:nil "string model_name   # the name of the model to predict~%string instruction  # the instruction sended to model for predicton~%string unnorm_key   # the dataset of the scene~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecUsrReq-request)))
  "Returns full string definition for message of type 'ExecUsrReq-request"
  (cl:format cl:nil "string model_name   # the name of the model to predict~%string instruction  # the instruction sended to model for predicton~%string unnorm_key   # the dataset of the scene~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecUsrReq-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'model_name))
     4 (cl:length (cl:slot-value msg 'instruction))
     4 (cl:length (cl:slot-value msg 'unnorm_key))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecUsrReq-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecUsrReq-request
    (cl:cons ':model_name (model_name msg))
    (cl:cons ':instruction (instruction msg))
    (cl:cons ':unnorm_key (unnorm_key msg))
))
;//! \htmlinclude ExecUsrReq-response.msg.html

(cl:defclass <ExecUsrReq-response> (roslisp-msg-protocol:ros-message)
  ((exec_usr_req_ret
    :reader exec_usr_req_ret
    :initarg :exec_usr_req_ret
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ExecUsrReq-response (<ExecUsrReq-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecUsrReq-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecUsrReq-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_manipulate-srv:<ExecUsrReq-response> is deprecated: use franka_manipulate-srv:ExecUsrReq-response instead.")))

(cl:ensure-generic-function 'exec_usr_req_ret-val :lambda-list '(m))
(cl:defmethod exec_usr_req_ret-val ((m <ExecUsrReq-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_manipulate-srv:exec_usr_req_ret-val is deprecated.  Use franka_manipulate-srv:exec_usr_req_ret instead.")
  (exec_usr_req_ret m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecUsrReq-response>) ostream)
  "Serializes a message object of type '<ExecUsrReq-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'exec_usr_req_ret) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecUsrReq-response>) istream)
  "Deserializes a message object of type '<ExecUsrReq-response>"
    (cl:setf (cl:slot-value msg 'exec_usr_req_ret) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExecUsrReq-response>)))
  "Returns string type for a service object of type '<ExecUsrReq-response>"
  "franka_manipulate/ExecUsrReqResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecUsrReq-response)))
  "Returns string type for a service object of type 'ExecUsrReq-response"
  "franka_manipulate/ExecUsrReqResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExecUsrReq-response>)))
  "Returns md5sum for a message object of type '<ExecUsrReq-response>"
  "8547ce5d173f55fbcf01cd3bf7a775f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecUsrReq-response)))
  "Returns md5sum for a message object of type 'ExecUsrReq-response"
  "8547ce5d173f55fbcf01cd3bf7a775f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecUsrReq-response>)))
  "Returns full string definition for message of type '<ExecUsrReq-response>"
  (cl:format cl:nil "~%bool exec_usr_req_ret~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecUsrReq-response)))
  "Returns full string definition for message of type 'ExecUsrReq-response"
  (cl:format cl:nil "~%bool exec_usr_req_ret~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecUsrReq-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecUsrReq-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecUsrReq-response
    (cl:cons ':exec_usr_req_ret (exec_usr_req_ret msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ExecUsrReq)))
  'ExecUsrReq-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ExecUsrReq)))
  'ExecUsrReq-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecUsrReq)))
  "Returns string type for a service object of type '<ExecUsrReq>"
  "franka_manipulate/ExecUsrReq")