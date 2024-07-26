// Generated by gencpp from file franka_predict_action/FetchSingleAction.msg
// DO NOT EDIT!


#ifndef FRANKA_PREDICT_ACTION_MESSAGE_FETCHSINGLEACTION_H
#define FRANKA_PREDICT_ACTION_MESSAGE_FETCHSINGLEACTION_H

#include <ros/service_traits.h>


#include <franka_predict_action/FetchSingleActionRequest.h>
#include <franka_predict_action/FetchSingleActionResponse.h>


namespace franka_predict_action
{

struct FetchSingleAction
{

typedef FetchSingleActionRequest Request;
typedef FetchSingleActionResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct FetchSingleAction
} // namespace franka_predict_action


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::franka_predict_action::FetchSingleAction > {
  static const char* value()
  {
    return "d42957ee35d3ee4cc592b207953e1495";
  }

  static const char* value(const ::franka_predict_action::FetchSingleAction&) { return value(); }
};

template<>
struct DataType< ::franka_predict_action::FetchSingleAction > {
  static const char* value()
  {
    return "franka_predict_action/FetchSingleAction";
  }

  static const char* value(const ::franka_predict_action::FetchSingleAction&) { return value(); }
};


// service_traits::MD5Sum< ::franka_predict_action::FetchSingleActionRequest> should match
// service_traits::MD5Sum< ::franka_predict_action::FetchSingleAction >
template<>
struct MD5Sum< ::franka_predict_action::FetchSingleActionRequest>
{
  static const char* value()
  {
    return MD5Sum< ::franka_predict_action::FetchSingleAction >::value();
  }
  static const char* value(const ::franka_predict_action::FetchSingleActionRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::franka_predict_action::FetchSingleActionRequest> should match
// service_traits::DataType< ::franka_predict_action::FetchSingleAction >
template<>
struct DataType< ::franka_predict_action::FetchSingleActionRequest>
{
  static const char* value()
  {
    return DataType< ::franka_predict_action::FetchSingleAction >::value();
  }
  static const char* value(const ::franka_predict_action::FetchSingleActionRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::franka_predict_action::FetchSingleActionResponse> should match
// service_traits::MD5Sum< ::franka_predict_action::FetchSingleAction >
template<>
struct MD5Sum< ::franka_predict_action::FetchSingleActionResponse>
{
  static const char* value()
  {
    return MD5Sum< ::franka_predict_action::FetchSingleAction >::value();
  }
  static const char* value(const ::franka_predict_action::FetchSingleActionResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::franka_predict_action::FetchSingleActionResponse> should match
// service_traits::DataType< ::franka_predict_action::FetchSingleAction >
template<>
struct DataType< ::franka_predict_action::FetchSingleActionResponse>
{
  static const char* value()
  {
    return DataType< ::franka_predict_action::FetchSingleAction >::value();
  }
  static const char* value(const ::franka_predict_action::FetchSingleActionResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // FRANKA_PREDICT_ACTION_MESSAGE_FETCHSINGLEACTION_H