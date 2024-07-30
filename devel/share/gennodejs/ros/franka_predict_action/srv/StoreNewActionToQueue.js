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

class StoreNewActionToQueueRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.model_name = null;
      this.instruction = null;
      this.unnorm_key = null;
    }
    else {
      if (initObj.hasOwnProperty('model_name')) {
        this.model_name = initObj.model_name
      }
      else {
        this.model_name = '';
      }
      if (initObj.hasOwnProperty('instruction')) {
        this.instruction = initObj.instruction
      }
      else {
        this.instruction = '';
      }
      if (initObj.hasOwnProperty('unnorm_key')) {
        this.unnorm_key = initObj.unnorm_key
      }
      else {
        this.unnorm_key = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type StoreNewActionToQueueRequest
    // Serialize message field [model_name]
    bufferOffset = _serializer.string(obj.model_name, buffer, bufferOffset);
    // Serialize message field [instruction]
    bufferOffset = _serializer.string(obj.instruction, buffer, bufferOffset);
    // Serialize message field [unnorm_key]
    bufferOffset = _serializer.string(obj.unnorm_key, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type StoreNewActionToQueueRequest
    let len;
    let data = new StoreNewActionToQueueRequest(null);
    // Deserialize message field [model_name]
    data.model_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [instruction]
    data.instruction = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [unnorm_key]
    data.unnorm_key = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.model_name);
    length += _getByteLength(object.instruction);
    length += _getByteLength(object.unnorm_key);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'franka_predict_action/StoreNewActionToQueueRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c9c6b563258de86117080d1e01c3bf23';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string model_name   # the name of the model to predict
    string instruction  # the instruction sended to model for predicton
    string unnorm_key   # the dataset of the scene
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new StoreNewActionToQueueRequest(null);
    if (msg.model_name !== undefined) {
      resolved.model_name = msg.model_name;
    }
    else {
      resolved.model_name = ''
    }

    if (msg.instruction !== undefined) {
      resolved.instruction = msg.instruction;
    }
    else {
      resolved.instruction = ''
    }

    if (msg.unnorm_key !== undefined) {
      resolved.unnorm_key = msg.unnorm_key;
    }
    else {
      resolved.unnorm_key = ''
    }

    return resolved;
    }
};

class StoreNewActionToQueueResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.store_ret = null;
    }
    else {
      if (initObj.hasOwnProperty('store_ret')) {
        this.store_ret = initObj.store_ret
      }
      else {
        this.store_ret = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type StoreNewActionToQueueResponse
    // Serialize message field [store_ret]
    bufferOffset = _serializer.bool(obj.store_ret, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type StoreNewActionToQueueResponse
    let len;
    let data = new StoreNewActionToQueueResponse(null);
    // Deserialize message field [store_ret]
    data.store_ret = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'franka_predict_action/StoreNewActionToQueueResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '199b9e329731aabfa20ffd0220024cf3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    bool store_ret  # the result of storing the new action
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new StoreNewActionToQueueResponse(null);
    if (msg.store_ret !== undefined) {
      resolved.store_ret = msg.store_ret;
    }
    else {
      resolved.store_ret = false
    }

    return resolved;
    }
};

module.exports = {
  Request: StoreNewActionToQueueRequest,
  Response: StoreNewActionToQueueResponse,
  md5sum() { return '5b013e147fda06393de0b2e74bcdcf2c'; },
  datatype() { return 'franka_predict_action/StoreNewActionToQueue'; }
};
