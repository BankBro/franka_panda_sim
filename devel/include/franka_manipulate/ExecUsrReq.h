// Generated by gencpp from file franka_manipulate/ExecUsrReq.msg
// DO NOT EDIT!


#ifndef FRANKA_MANIPULATE_MESSAGE_EXECUSRREQ_H
#define FRANKA_MANIPULATE_MESSAGE_EXECUSRREQ_H

#include <ros/service_traits.h>


#include <franka_manipulate/ExecUsrReqRequest.h>
#include <franka_manipulate/ExecUsrReqResponse.h>


namespace franka_manipulate
{

struct ExecUsrReq
{

typedef ExecUsrReqRequest Request;
typedef ExecUsrReqResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct ExecUsrReq
} // namespace franka_manipulate


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::franka_manipulate::ExecUsrReq > {
  static const char* value()
  {
    return "8547ce5d173f55fbcf01cd3bf7a775f5";
  }

  static const char* value(const ::franka_manipulate::ExecUsrReq&) { return value(); }
};

template<>
struct DataType< ::franka_manipulate::ExecUsrReq > {
  static const char* value()
  {
    return "franka_manipulate/ExecUsrReq";
  }

  static const char* value(const ::franka_manipulate::ExecUsrReq&) { return value(); }
};


// service_traits::MD5Sum< ::franka_manipulate::ExecUsrReqRequest> should match
// service_traits::MD5Sum< ::franka_manipulate::ExecUsrReq >
template<>
struct MD5Sum< ::franka_manipulate::ExecUsrReqRequest>
{
  static const char* value()
  {
    return MD5Sum< ::franka_manipulate::ExecUsrReq >::value();
  }
  static const char* value(const ::franka_manipulate::ExecUsrReqRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::franka_manipulate::ExecUsrReqRequest> should match
// service_traits::DataType< ::franka_manipulate::ExecUsrReq >
template<>
struct DataType< ::franka_manipulate::ExecUsrReqRequest>
{
  static const char* value()
  {
    return DataType< ::franka_manipulate::ExecUsrReq >::value();
  }
  static const char* value(const ::franka_manipulate::ExecUsrReqRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::franka_manipulate::ExecUsrReqResponse> should match
// service_traits::MD5Sum< ::franka_manipulate::ExecUsrReq >
template<>
struct MD5Sum< ::franka_manipulate::ExecUsrReqResponse>
{
  static const char* value()
  {
    return MD5Sum< ::franka_manipulate::ExecUsrReq >::value();
  }
  static const char* value(const ::franka_manipulate::ExecUsrReqResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::franka_manipulate::ExecUsrReqResponse> should match
// service_traits::DataType< ::franka_manipulate::ExecUsrReq >
template<>
struct DataType< ::franka_manipulate::ExecUsrReqResponse>
{
  static const char* value()
  {
    return DataType< ::franka_manipulate::ExecUsrReq >::value();
  }
  static const char* value(const ::franka_manipulate::ExecUsrReqResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // FRANKA_MANIPULATE_MESSAGE_EXECUSRREQ_H
