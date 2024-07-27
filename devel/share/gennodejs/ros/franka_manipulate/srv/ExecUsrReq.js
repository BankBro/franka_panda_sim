// Auto-generated. Do not edit!

// (in-package franka_manipulate.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class ExecUsrReqRequest {
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
    // Serializes a message object of type ExecUsrReqRequest
    // Serialize message field [model_name]
    bufferOffset = _serializer.string(obj.model_name, buffer, bufferOffset);
    // Serialize message field [instruction]
    bufferOffset = _serializer.string(obj.instruction, buffer, bufferOffset);
    // Serialize message field [unnorm_key]
    bufferOffset = _serializer.string(obj.unnorm_key, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ExecUsrReqRequest
    let len;
    let data = new ExecUsrReqRequest(null);
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
    return 'franka_manipulate/ExecUsrReqRequest';
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
    const resolved = new ExecUsrReqRequest(null);
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

class ExecUsrReqResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.exec_usr_req_ret = null;
    }
    else {
      if (initObj.hasOwnProperty('exec_usr_req_ret')) {
        this.exec_usr_req_ret = initObj.exec_usr_req_ret
      }
      else {
        this.exec_usr_req_ret = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ExecUsrReqResponse
    // Serialize message field [exec_usr_req_ret]
    bufferOffset = _serializer.bool(obj.exec_usr_req_ret, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ExecUsrReqResponse
    let len;
    let data = new ExecUsrReqResponse(null);
    // Deserialize message field [exec_usr_req_ret]
    data.exec_usr_req_ret = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'franka_manipulate/ExecUsrReqResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '70cb9a8771a3a05cee361cd81812dcc8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    bool exec_usr_req_ret
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ExecUsrReqResponse(null);
    if (msg.exec_usr_req_ret !== undefined) {
      resolved.exec_usr_req_ret = msg.exec_usr_req_ret;
    }
    else {
      resolved.exec_usr_req_ret = false
    }

    return resolved;
    }
};

module.exports = {
  Request: ExecUsrReqRequest,
  Response: ExecUsrReqResponse,
  md5sum() { return '8547ce5d173f55fbcf01cd3bf7a775f5'; },
  datatype() { return 'franka_manipulate/ExecUsrReq'; }
};
