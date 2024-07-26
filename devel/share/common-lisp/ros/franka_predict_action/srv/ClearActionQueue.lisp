; Auto-generated. Do not edit!


(cl:in-package franka_predict_action-srv)


;//! \htmlinclude ClearActionQueue-request.msg.html

(cl:defclass <ClearActionQueue-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ClearActionQueue-request (<ClearActionQueue-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClearActionQueue-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClearActionQueue-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_predict_action-srv:<ClearActionQueue-request> is deprecated: use franka_predict_action-srv:ClearActionQueue-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClearActionQueue-request>) ostream)
  "Serializes a message object of type '<ClearActionQueue-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClearActionQueue-request>) istream)
  "Deserializes a message object of type '<ClearActionQueue-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClearActionQueue-request>)))
  "Returns string type for a service object of type '<ClearActionQueue-request>"
  "franka_predict_action/ClearActionQueueRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClearActionQueue-request)))
  "Returns string type for a service object of type 'ClearActionQueue-request"
  "franka_predict_action/ClearActionQueueRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClearActionQueue-request>)))
  "Returns md5sum for a message object of type '<ClearActionQueue-request>"
  "9d33160d173e7ec57031aac816786381")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClearActionQueue-request)))
  "Returns md5sum for a message object of type 'ClearActionQueue-request"
  "9d33160d173e7ec57031aac816786381")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClearActionQueue-request>)))
  "Returns full string definition for message of type '<ClearActionQueue-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClearActionQueue-request)))
  "Returns full string definition for message of type 'ClearActionQueue-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClearActionQueue-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClearActionQueue-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ClearActionQueue-request
))
;//! \htmlinclude ClearActionQueue-response.msg.html

(cl:defclass <ClearActionQueue-response> (roslisp-msg-protocol:ros-message)
  ((clear_ret
    :reader clear_ret
    :initarg :clear_ret
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ClearActionQueue-response (<ClearActionQueue-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ClearActionQueue-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ClearActionQueue-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name franka_predict_action-srv:<ClearActionQueue-response> is deprecated: use franka_predict_action-srv:ClearActionQueue-response instead.")))

(cl:ensure-generic-function 'clear_ret-val :lambda-list '(m))
(cl:defmethod clear_ret-val ((m <ClearActionQueue-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader franka_predict_action-srv:clear_ret-val is deprecated.  Use franka_predict_action-srv:clear_ret instead.")
  (clear_ret m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ClearActionQueue-response>) ostream)
  "Serializes a message object of type '<ClearActionQueue-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'clear_ret) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ClearActionQueue-response>) istream)
  "Deserializes a message object of type '<ClearActionQueue-response>"
    (cl:setf (cl:slot-value msg 'clear_ret) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ClearActionQueue-response>)))
  "Returns string type for a service object of type '<ClearActionQueue-response>"
  "franka_predict_action/ClearActionQueueResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClearActionQueue-response)))
  "Returns string type for a service object of type 'ClearActionQueue-response"
  "franka_predict_action/ClearActionQueueResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ClearActionQueue-response>)))
  "Returns md5sum for a message object of type '<ClearActionQueue-response>"
  "9d33160d173e7ec57031aac816786381")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ClearActionQueue-response)))
  "Returns md5sum for a message object of type 'ClearActionQueue-response"
  "9d33160d173e7ec57031aac816786381")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ClearActionQueue-response>)))
  "Returns full string definition for message of type '<ClearActionQueue-response>"
  (cl:format cl:nil "~%bool clear_ret~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ClearActionQueue-response)))
  "Returns full string definition for message of type 'ClearActionQueue-response"
  (cl:format cl:nil "~%bool clear_ret~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ClearActionQueue-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ClearActionQueue-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ClearActionQueue-response
    (cl:cons ':clear_ret (clear_ret msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ClearActionQueue)))
  'ClearActionQueue-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ClearActionQueue)))
  'ClearActionQueue-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ClearActionQueue)))
  "Returns string type for a service object of type '<ClearActionQueue>"
  "franka_predict_action/ClearActionQueue")