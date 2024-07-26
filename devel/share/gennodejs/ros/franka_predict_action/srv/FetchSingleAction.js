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

class FetchSingleActionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FetchSingleActionRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FetchSingleActionRequest
    let len;
    let data = new FetchSingleActionRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'franka_predict_action/FetchSingleActionRequest';
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
    const resolved = new FetchSingleActionRequest(null);
    return resolved;
    }
};

class FetchSingleActionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.fetch_ret = null;
      this.action = null;
      this.queue_size = null;
    }
    else {
      if (initObj.hasOwnProperty('fetch_ret')) {
        this.fetch_ret = initObj.fetch_ret
      }
      else {
        this.fetch_ret = false;
      }
      if (initObj.hasOwnProperty('action')) {
        this.action = initObj.action
      }
      else {
        this.action = [];
      }
      if (initObj.hasOwnProperty('queue_size')) {
        this.queue_size = initObj.queue_size
      }
      else {
        this.queue_size = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FetchSingleActionResponse
    // Serialize message field [fetch_ret]
    bufferOffset = _serializer.bool(obj.fetch_ret, buffer, bufferOffset);
    // Serialize message field [action]
    bufferOffset = _arraySerializer.float32(obj.action, buffer, bufferOffset, null);
    // Serialize message field [queue_size]
    bufferOffset = _serializer.uint8(obj.queue_size, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FetchSingleActionResponse
    let len;
    let data = new FetchSingleActionResponse(null);
    // Deserialize message field [fetch_ret]
    data.fetch_ret = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [action]
    data.action = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [queue_size]
    data.queue_size = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.action.length;
    return length + 6;
  }

  static datatype() {
    // Returns string type for a service object
    return 'franka_predict_action/FetchSingleActionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd42957ee35d3ee4cc592b207953e1495';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool fetch_ret    # fetching result
    float32[] action  # single action
    uint8 queue_size  # the size of the queue after fetching
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FetchSingleActionResponse(null);
    if (msg.fetch_ret !== undefined) {
      resolved.fetch_ret = msg.fetch_ret;
    }
    else {
      resolved.fetch_ret = false
    }

    if (msg.action !== undefined) {
      resolved.action = msg.action;
    }
    else {
      resolved.action = []
    }

    if (msg.queue_size !== undefined) {
      resolved.queue_size = msg.queue_size;
    }
    else {
      resolved.queue_size = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: FetchSingleActionRequest,
  Response: FetchSingleActionResponse,
  md5sum() { return 'd42957ee35d3ee4cc592b207953e1495'; },
  datatype() { return 'franka_predict_action/FetchSingleAction'; }
};
