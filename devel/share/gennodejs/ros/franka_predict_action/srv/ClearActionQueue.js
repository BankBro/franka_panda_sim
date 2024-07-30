// Auto-generated. Do not edit!

// (in-package franka_predict_action.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class ClearActionQueueRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ClearActionQueueRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ClearActionQueueRequest
    let len;
    let data = new ClearActionQueueRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'franka_predict_action/ClearActionQueueRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ClearActionQueueRequest(null);
    return resolved;
    }
};

class ClearActionQueueResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.clear_ret = null;
    }
    else {
      if (initObj.hasOwnProperty('clear_ret')) {
        this.clear_ret = initObj.clear_ret
      }
      else {
        this.clear_ret = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ClearActionQueueResponse
    // Serialize message field [clear_ret]
    bufferOffset = _serializer.bool(obj.clear_ret, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ClearActionQueueResponse
    let len;
    let data = new ClearActionQueueResponse(null);
    // Deserialize message field [clear_ret]
    data.clear_ret = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'franka_predict_action/ClearActionQueueResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9d33160d173e7ec57031aac816786381';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    bool clear_ret
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ClearActionQueueResponse(null);
    if (msg.clear_ret !== undefined) {
      resolved.clear_ret = msg.clear_ret;
    }
    else {
      resolved.clear_ret = false
    }

    return resolved;
    }
};

module.exports = {
  Request: ClearActionQueueRequest,
  Response: ClearActionQueueResponse,
  md5sum() { return '9d33160d173e7ec57031aac816786381'; },
  datatype() { return 'franka_predict_action/ClearActionQueue'; }
};
