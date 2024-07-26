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

class PredictActionRequest {
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
    // Serializes a message object of type PredictActionRequest
    // Serialize message field [model_name]
    bufferOffset = _serializer.string(obj.model_name, buffer, bufferOffset);
    // Serialize message field [instruction]
    bufferOffset = _serializer.string(obj.instruction, buffer, bufferOffset);
    // Serialize message field [unnorm_key]
    bufferOffset = _serializer.string(obj.unnorm_key, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PredictActionRequest
    let len;
    let data = new PredictActionRequest(null);
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
    return 'franka_predict_action/PredictActionRequest';
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
    const resolved = new PredictActionRequest(null);
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

class PredictActionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.predict_ret = null;
      this.action_flat = null;
      this.action_shape = null;
    }
    else {
      if (initObj.hasOwnProperty('predict_ret')) {
        this.predict_ret = initObj.predict_ret
      }
      else {
        this.predict_ret = false;
      }
      if (initObj.hasOwnProperty('action_flat')) {
        this.action_flat = initObj.action_flat
      }
      else {
        this.action_flat = [];
      }
      if (initObj.hasOwnProperty('action_shape')) {
        this.action_shape = initObj.action_shape
      }
      else {
        this.action_shape = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PredictActionResponse
    // Serialize message field [predict_ret]
    bufferOffset = _serializer.bool(obj.predict_ret, buffer, bufferOffset);
    // Serialize message field [action_flat]
    bufferOffset = _arraySerializer.float32(obj.action_flat, buffer, bufferOffset, null);
    // Serialize message field [action_shape]
    bufferOffset = _arraySerializer.uint8(obj.action_shape, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PredictActionResponse
    let len;
    let data = new PredictActionResponse(null);
    // Deserialize message field [predict_ret]
    data.predict_ret = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [action_flat]
    data.action_flat = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [action_shape]
    data.action_shape = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.action_flat.length;
    length += object.action_shape.length;
    return length + 9;
  }

  static datatype() {
    // Returns string type for a service object
    return 'franka_predict_action/PredictActionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '085ab47a05c5067de6e32066d85e1283';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    bool predict_ret         # result of prediction
    float32[] action_flat     # the flatten predicted action
    uint8[] action_shape      # the shape of the predicted action: [num_action, action_dim]
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PredictActionResponse(null);
    if (msg.predict_ret !== undefined) {
      resolved.predict_ret = msg.predict_ret;
    }
    else {
      resolved.predict_ret = false
    }

    if (msg.action_flat !== undefined) {
      resolved.action_flat = msg.action_flat;
    }
    else {
      resolved.action_flat = []
    }

    if (msg.action_shape !== undefined) {
      resolved.action_shape = msg.action_shape;
    }
    else {
      resolved.action_shape = []
    }

    return resolved;
    }
};

module.exports = {
  Request: PredictActionRequest,
  Response: PredictActionResponse,
  md5sum() { return 'ae8dd43aecc2d95dbde2901ca04451f5'; },
  datatype() { return 'franka_predict_action/PredictAction'; }
};
