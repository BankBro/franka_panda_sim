; Auto-generated. Do not edit!


(cl:in-package franka_predict_action-srv)


;//! \htmlinclude StoreNewActionToQueue-request.msg.html

(cl:defclass <StoreNewActionToQueue-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass StoreNewActionToQueue-request (<StoreNewActionToQueue-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StoreNewActionToQueue-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StoreNewActionToQueue-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_predict_action-srv:<StoreNewActionToQueue-request> is deprecated: use franka_predict_action-srv:StoreNewActionToQueue-request instead.")))

(cl:ensure-generic-function 'model_name-val :lambda-list '(m))
(cl:defmethod model_name-val ((m <StoreNewActionToQueue-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_predict_action-srv:model_name-val is deprecated.  Use franka_predict_action-srv:model_name instead.")
  (model_name m))

(cl:ensure-generic-function 'instruction-val :lambda-list '(m))
(cl:defmethod instruction-val ((m <StoreNewActionToQueue-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_predict_action-srv:instruction-val is deprecated.  Use franka_predict_action-srv:instruction instead.")
  (instruction m))

(cl:ensure-generic-function 'unnorm_key-val :lambda-list '(m))
(cl:defmethod unnorm_key-val ((m <StoreNewActionToQueue-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_predict_action-srv:unnorm_key-val is deprecated.  Use franka_predict_action-srv:unnorm_key instead.")
  (unnorm_key m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StoreNewActionToQueue-request>) ostream)
  "Serializes a message object of type '<StoreNewActionToQueue-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StoreNewActionToQueue-request>) istream)
  "Deserializes a message object of type '<StoreNewActionToQueue-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StoreNewActionToQueue-request>)))
  "Returns string type for a service object of type '<StoreNewActionToQueue-request>"
  "franka_predict_action/StoreNewActionToQueueRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StoreNewActionToQueue-request)))
  "Returns string type for a service object of type 'StoreNewActionToQueue-request"
  "franka_predict_action/StoreNewActionToQueueRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StoreNewActionToQueue-request>)))
  "Returns md5sum for a message object of type '<StoreNewActionToQueue-request>"
  "5b013e147fda06393de0b2e74bcdcf2c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StoreNewActionToQueue-request)))
  "Returns md5sum for a message object of type 'StoreNewActionToQueue-request"
  "5b013e147fda06393de0b2e74bcdcf2c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StoreNewActionToQueue-request>)))
  "Returns full string definition for message of type '<StoreNewActionToQueue-request>"
  (cl:format cl:nil "string model_name   # the name of the model to predict~%string instruction  # the instruction sended to model for predicton~%string unnorm_key   # the dataset of the scene~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StoreNewActionToQueue-request)))
  "Returns full string definition for message of type 'StoreNewActionToQueue-request"
  (cl:format cl:nil "string model_name   # the name of the model to predict~%string instruction  # the instruction sended to model for predicton~%string unnorm_key   # the dataset of the scene~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StoreNewActionToQueue-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'model_name))
     4 (cl:length (cl:slot-value msg 'instruction))
     4 (cl:length (cl:slot-value msg 'unnorm_key))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StoreNewActionToQueue-request>))
  "Converts a ROS message object to a list"
  (cl:list 'StoreNewActionToQueue-request
    (cl:cons ':model_name (model_name msg))
    (cl:cons ':instruction (instruction msg))
    (cl:cons ':unnorm_key (unnorm_key msg))
))
;//! \htmlinclude StoreNewActionToQueue-response.msg.html

(cl:defclass <StoreNewActionToQueue-response> (roslisp-msg-protocol:ros-message)
  ((store_ret
    :reader store_ret
    :initarg :store_ret
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass StoreNewActionToQueue-response (<StoreNewActionToQueue-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StoreNewActionToQueue-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StoreNewActionToQueue-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_predict_action-srv:<StoreNewActionToQueue-response> is deprecated: use franka_predict_action-srv:StoreNewActionToQueue-response instead.")))

(cl:ensure-generic-function 'store_ret-val :lambda-list '(m))
(cl:defmethod store_ret-val ((m <StoreNewActionToQueue-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_predict_action-srv:store_ret-val is deprecated.  Use franka_predict_action-srv:store_ret instead.")
  (store_ret m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StoreNewActionToQueue-response>) ostream)
  "Serializes a message object of type '<StoreNewActionToQueue-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'store_ret) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StoreNewActionToQueue-response>) istream)
  "Deserializes a message object of type '<StoreNewActionToQueue-response>"
    (cl:setf (cl:slot-value msg 'store_ret) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StoreNewActionToQueue-response>)))
  "Returns string type for a service object of type '<StoreNewActionToQueue-response>"
  "franka_predict_action/StoreNewActionToQueueResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StoreNewActionToQueue-response)))
  "Returns string type for a service object of type 'StoreNewActionToQueue-response"
  "franka_predict_action/StoreNewActionToQueueResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StoreNewActionToQueue-response>)))
  "Returns md5sum for a message object of type '<StoreNewActionToQueue-response>"
  "5b013e147fda06393de0b2e74bcdcf2c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StoreNewActionToQueue-response)))
  "Returns md5sum for a message object of type 'StoreNewActionToQueue-response"
  "5b013e147fda06393de0b2e74bcdcf2c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StoreNewActionToQueue-response>)))
  "Returns full string definition for message of type '<StoreNewActionToQueue-response>"
  (cl:format cl:nil "~%bool store_ret  # the result of storing the new action~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StoreNewActionToQueue-response)))
  "Returns full string definition for message of type 'StoreNewActionToQueue-response"
  (cl:format cl:nil "~%bool store_ret  # the result of storing the new action~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StoreNewActionToQueue-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StoreNewActionToQueue-response>))
  "Converts a ROS message object to a list"
  (cl:list 'StoreNewActionToQueue-response
    (cl:cons ':store_ret (store_ret msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'StoreNewActionToQueue)))
  'StoreNewActionToQueue-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'StoreNewActionToQueue)))
  'StoreNewActionToQueue-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StoreNewActionToQueue)))
  "Returns string type for a service object of type '<StoreNewActionToQueue>"
  "franka_predict_action/StoreNewActionToQueue")