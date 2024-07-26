// Generated by gencpp from file franka_predict_action/ClearActionQueueResponse.msg
// DO NOT EDIT!


#ifndef FRANKA_PREDICT_ACTION_MESSAGE_CLEARACTIONQUEUERESPONSE_H
#define FRANKA_PREDICT_ACTION_MESSAGE_CLEARACTIONQUEUERESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace franka_predict_action
{
template <class ContainerAllocator>
struct ClearActionQueueResponse_
{
  typedef ClearActionQueueResponse_<ContainerAllocator> Type;

  ClearActionQueueResponse_()
    : clear_ret(false)  {
    }
  ClearActionQueueResponse_(const ContainerAllocator& _alloc)
    : clear_ret(false)  {
  (void)_alloc;
    }



   typedef uint8_t _clear_ret_type;
  _clear_ret_type clear_ret;





  typedef boost::shared_ptr< ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator> const> ConstPtr;

}; // struct ClearActionQueueResponse_

typedef ::franka_predict_action::ClearActionQueueResponse_<std::allocator<void> > ClearActionQueueResponse;

typedef boost::shared_ptr< ::franka_predict_action::ClearActionQueueResponse > ClearActionQueueResponsePtr;
typedef boost::shared_ptr< ::franka_predict_action::ClearActionQueueResponse const> ClearActionQueueResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator1> & lhs, const ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator2> & rhs)
{
  return lhs.clear_ret == rhs.clear_ret;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator1> & lhs, const ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace franka_predict_action

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9d33160d173e7ec57031aac816786381";
  }

  static const char* value(const ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9d33160d173e7ec5ULL;
  static const uint64_t static_value2 = 0x7031aac816786381ULL;
};

template<class ContainerAllocator>
struct DataType< ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "franka_predict_action/ClearActionQueueResponse";
  }

  static const char* value(const ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
"bool clear_ret\n"
;
  }

  static const char* value(const ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.clear_ret);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ClearActionQueueResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::franka_predict_action::ClearActionQueueResponse_<ContainerAllocator>& v)
  {
    s << indent << "clear_ret: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.clear_ret);
  }
};

} // namespace message_operations
} // namespace ros

#endif // FRANKA_PREDICT_ACTION_MESSAGE_CLEARACTIONQUEUERESPONSE_H