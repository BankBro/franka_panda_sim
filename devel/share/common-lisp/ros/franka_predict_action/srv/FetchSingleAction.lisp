; Auto-generated. Do not edit!


(cl:in-package franka_predict_action-srv)


;//! \htmlinclude FetchSingleAction-request.msg.html

(cl:defclass <FetchSingleAction-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass FetchSingleAction-request (<FetchSingleAction-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FetchSingleAction-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FetchSingleAction-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_predict_action-srv:<FetchSingleAction-request> is deprecated: use franka_predict_action-srv:FetchSingleAction-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FetchSingleAction-request>) ostream)
  "Serializes a message object of type '<FetchSingleAction-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FetchSingleAction-request>) istream)
  "Deserializes a message object of type '<FetchSingleAction-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FetchSingleAction-request>)))
  "Returns string type for a service object of type '<FetchSingleAction-request>"
  "franka_predict_action/FetchSingleActionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FetchSingleAction-request)))
  "Returns string type for a service object of type 'FetchSingleAction-request"
  "franka_predict_action/FetchSingleActionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FetchSingleAction-request>)))
  "Returns md5sum for a message object of type '<FetchSingleAction-request>"
  "d42957ee35d3ee4cc592b207953e1495")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FetchSingleAction-request)))
  "Returns md5sum for a message object of type 'FetchSingleAction-request"
  "d42957ee35d3ee4cc592b207953e1495")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FetchSingleAction-request>)))
  "Returns full string definition for message of type '<FetchSingleAction-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FetchSingleAction-request)))
  "Returns full string definition for message of type 'FetchSingleAction-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FetchSingleAction-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FetchSingleAction-request>))
  "Converts a ROS message object to a list"
  (cl:list 'FetchSingleAction-request
))
;//! \htmlinclude FetchSingleAction-response.msg.html

(cl:defclass <FetchSingleAction-response> (roslisp-msg-protocol:ros-message)
  ((fetch_ret
    :reader fetch_ret
    :initarg :fetch_ret
    :type cl:boolean
    :initform cl:nil)
   (action
    :reader action
    :initarg :action
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (queue_size
    :reader queue_size
    :initarg :queue_size
    :type cl:fixnum
    :initform 0))
)

(cl:defclass FetchSingleAction-response (<FetchSingleAction-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FetchSingleAction-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FetchSingleAction-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_predict_action-srv:<FetchSingleAction-response> is deprecated: use franka_predict_action-srv:FetchSingleAction-response instead.")))

(cl:ensure-generic-function 'fetch_ret-val :lambda-list '(m))
(cl:defmethod fetch_ret-val ((m <FetchSingleAction-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_predict_action-srv:fetch_ret-val is deprecated.  Use franka_predict_action-srv:fetch_ret instead.")
  (fetch_ret m))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <FetchSingleAction-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_predict_action-srv:action-val is deprecated.  Use franka_predict_action-srv:action instead.")
  (action m))

(cl:ensure-generic-function 'queue_size-val :lambda-list '(m))
(cl:defmethod queue_size-val ((m <FetchSingleAction-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_predict_action-srv:queue_size-val is deprecated.  Use franka_predict_action-srv:queue_size instead.")
  (queue_size m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FetchSingleAction-response>) ostream)
  "Serializes a message object of type '<FetchSingleAction-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'fetch_ret) 1 0)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'action))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'action))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'queue_size)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FetchSingleAction-response>) istream)
  "Deserializes a message object of type '<FetchSingleAction-response>"
    (cl:setf (cl:slot-value msg 'fetch_ret) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'action) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'action)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'queue_size)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FetchSingleAction-response>)))
  "Returns string type for a service object of type '<FetchSingleAction-response>"
  "franka_predict_action/FetchSingleActionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FetchSingleAction-response)))
  "Returns string type for a service object of type 'FetchSingleAction-response"
  "franka_predict_action/FetchSingleActionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FetchSingleAction-response>)))
  "Returns md5sum for a message object of type '<FetchSingleAction-response>"
  "d42957ee35d3ee4cc592b207953e1495")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FetchSingleAction-response)))
  "Returns md5sum for a message object of type 'FetchSingleAction-response"
  "d42957ee35d3ee4cc592b207953e1495")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FetchSingleAction-response>)))
  "Returns full string definition for message of type '<FetchSingleAction-response>"
  (cl:format cl:nil "bool fetch_ret    # fetching result~%float32[] action  # single action~%uint8 queue_size  # the size of the queue after fetching~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FetchSingleAction-response)))
  "Returns full string definition for message of type 'FetchSingleAction-response"
  (cl:format cl:nil "bool fetch_ret    # fetching result~%float32[] action  # single action~%uint8 queue_size  # the size of the queue after fetching~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FetchSingleAction-response>))
  (cl:+ 0
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'action) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FetchSingleAction-response>))
  "Converts a ROS message object to a list"
  (cl:list 'FetchSingleAction-response
    (cl:cons ':fetch_ret (fetch_ret msg))
    (cl:cons ':action (action msg))
    (cl:cons ':queue_size (queue_size msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'FetchSingleAction)))
  'FetchSingleAction-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'FetchSingleAction)))
  'FetchSingleAction-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FetchSingleAction)))
  "Returns string type for a service object of type '<FetchSingleAction>"
  "franka_predict_action/FetchSingleAction")