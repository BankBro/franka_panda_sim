; Auto-generated. Do not edit!


(cl:in-package franka_predict_action-srv)


;//! \htmlinclude PredictAction-request.msg.html

(cl:defclass <PredictAction-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass PredictAction-request (<PredictAction-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PredictAction-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PredictAction-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_predict_action-srv:<PredictAction-request> is deprecated: use franka_predict_action-srv:PredictAction-request instead.")))

(cl:ensure-generic-function 'model_name-val :lambda-list '(m))
(cl:defmethod model_name-val ((m <PredictAction-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_predict_action-srv:model_name-val is deprecated.  Use franka_predict_action-srv:model_name instead.")
  (model_name m))

(cl:ensure-generic-function 'instruction-val :lambda-list '(m))
(cl:defmethod instruction-val ((m <PredictAction-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_predict_action-srv:instruction-val is deprecated.  Use franka_predict_action-srv:instruction instead.")
  (instruction m))

(cl:ensure-generic-function 'unnorm_key-val :lambda-list '(m))
(cl:defmethod unnorm_key-val ((m <PredictAction-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_predict_action-srv:unnorm_key-val is deprecated.  Use franka_predict_action-srv:unnorm_key instead.")
  (unnorm_key m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PredictAction-request>) ostream)
  "Serializes a message object of type '<PredictAction-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PredictAction-request>) istream)
  "Deserializes a message object of type '<PredictAction-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PredictAction-request>)))
  "Returns string type for a service object of type '<PredictAction-request>"
  "franka_predict_action/PredictActionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PredictAction-request)))
  "Returns string type for a service object of type 'PredictAction-request"
  "franka_predict_action/PredictActionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PredictAction-request>)))
  "Returns md5sum for a message object of type '<PredictAction-request>"
  "ae8dd43aecc2d95dbde2901ca04451f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PredictAction-request)))
  "Returns md5sum for a message object of type 'PredictAction-request"
  "ae8dd43aecc2d95dbde2901ca04451f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PredictAction-request>)))
  "Returns full string definition for message of type '<PredictAction-request>"
  (cl:format cl:nil "string model_name   # the name of the model to predict~%string instruction  # the instruction sended to model for predicton~%string unnorm_key   # the dataset of the scene~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PredictAction-request)))
  "Returns full string definition for message of type 'PredictAction-request"
  (cl:format cl:nil "string model_name   # the name of the model to predict~%string instruction  # the instruction sended to model for predicton~%string unnorm_key   # the dataset of the scene~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PredictAction-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'model_name))
     4 (cl:length (cl:slot-value msg 'instruction))
     4 (cl:length (cl:slot-value msg 'unnorm_key))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PredictAction-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PredictAction-request
    (cl:cons ':model_name (model_name msg))
    (cl:cons ':instruction (instruction msg))
    (cl:cons ':unnorm_key (unnorm_key msg))
))
;//! \htmlinclude PredictAction-response.msg.html

(cl:defclass <PredictAction-response> (roslisp-msg-protocol:ros-message)
  ((predict_ret
    :reader predict_ret
    :initarg :predict_ret
    :type cl:boolean
    :initform cl:nil)
   (action_flat
    :reader action_flat
    :initarg :action_flat
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (action_shape
    :reader action_shape
    :initarg :action_shape
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass PredictAction-response (<PredictAction-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PredictAction-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PredictAction-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_predict_action-srv:<PredictAction-response> is deprecated: use franka_predict_action-srv:PredictAction-response instead.")))

(cl:ensure-generic-function 'predict_ret-val :lambda-list '(m))
(cl:defmethod predict_ret-val ((m <PredictAction-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_predict_action-srv:predict_ret-val is deprecated.  Use franka_predict_action-srv:predict_ret instead.")
  (predict_ret m))

(cl:ensure-generic-function 'action_flat-val :lambda-list '(m))
(cl:defmethod action_flat-val ((m <PredictAction-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_predict_action-srv:action_flat-val is deprecated.  Use franka_predict_action-srv:action_flat instead.")
  (action_flat m))

(cl:ensure-generic-function 'action_shape-val :lambda-list '(m))
(cl:defmethod action_shape-val ((m <PredictAction-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_predict_action-srv:action_shape-val is deprecated.  Use franka_predict_action-srv:action_shape instead.")
  (action_shape m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PredictAction-response>) ostream)
  "Serializes a message object of type '<PredictAction-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'predict_ret) 1 0)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'action_flat))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'action_flat))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'action_shape))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'action_shape))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PredictAction-response>) istream)
  "Deserializes a message object of type '<PredictAction-response>"
    (cl:setf (cl:slot-value msg 'predict_ret) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'action_flat) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'action_flat)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'action_shape) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'action_shape)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PredictAction-response>)))
  "Returns string type for a service object of type '<PredictAction-response>"
  "franka_predict_action/PredictActionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PredictAction-response)))
  "Returns string type for a service object of type 'PredictAction-response"
  "franka_predict_action/PredictActionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PredictAction-response>)))
  "Returns md5sum for a message object of type '<PredictAction-response>"
  "ae8dd43aecc2d95dbde2901ca04451f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PredictAction-response)))
  "Returns md5sum for a message object of type 'PredictAction-response"
  "ae8dd43aecc2d95dbde2901ca04451f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PredictAction-response>)))
  "Returns full string definition for message of type '<PredictAction-response>"
  (cl:format cl:nil "~%bool predict_ret         # result of prediction~%float32[] action_flat     # the flatten predicted action~%uint8[] action_shape      # the shape of the predicted action: [num_action, action_dim]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PredictAction-response)))
  "Returns full string definition for message of type 'PredictAction-response"
  (cl:format cl:nil "~%bool predict_ret         # result of prediction~%float32[] action_flat     # the flatten predicted action~%uint8[] action_shape      # the shape of the predicted action: [num_action, action_dim]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PredictAction-response>))
  (cl:+ 0
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'action_flat) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'action_shape) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PredictAction-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PredictAction-response
    (cl:cons ':predict_ret (predict_ret msg))
    (cl:cons ':action_flat (action_flat msg))
    (cl:cons ':action_shape (action_shape msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PredictAction)))
  'PredictAction-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PredictAction)))
  'PredictAction-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PredictAction)))
  "Returns string type for a service object of type '<PredictAction>"
  "franka_predict_action/PredictAction")