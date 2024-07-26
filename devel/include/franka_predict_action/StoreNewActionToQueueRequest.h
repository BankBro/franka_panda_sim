// Generated by gencpp from file franka_predict_action/StoreNewActionToQueueRequest.msg
// DO NOT EDIT!


#ifndef FRANKA_PREDICT_ACTION_MESSAGE_STORENEWACTIONTOQUEUEREQUEST_H
#define FRANKA_PREDICT_ACTION_MESSAGE_STORENEWACTIONTOQUEUEREQUEST_H


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
struct StoreNewActionToQueueRequest_
{
  typedef StoreNewActionToQueueRequest_<ContainerAllocator> Type;

  StoreNewActionToQueueRequest_()
    : model_name()
    , instruction()
    , unnorm_key()  {
    }
  StoreNewActionToQueueRequest_(const ContainerAllocator& _alloc)
    : model_name(_alloc)
    , instruction(_alloc)
    , unnorm_key(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _model_name_type;
  _model_name_type model_name;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _instruction_type;
  _instruction_type instruction;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _unnorm_key_type;
  _unnorm_key_type unnorm_key;





  typedef boost::shared_ptr< ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator> const> ConstPtr;

}; // struct StoreNewActionToQueueRequest_

typedef ::franka_predict_action::StoreNewActionToQueueRequest_<std::allocator<void> > StoreNewActionToQueueRequest;

typedef boost::shared_ptr< ::franka_predict_action::StoreNewActionToQueueRequest > StoreNewActionToQueueRequestPtr;
typedef boost::shared_ptr< ::franka_predict_action::StoreNewActionToQueueRequest const> StoreNewActionToQueueRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator1> & lhs, const ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator2> & rhs)
{
  return lhs.model_name == rhs.model_name &&
    lhs.instruction == rhs.instruction &&
    lhs.unnorm_key == rhs.unnorm_key;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator1> & lhs, const ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace franka_predict_action

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c9c6b563258de86117080d1e01c3bf23";
  }

  static const char* value(const ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc9c6b563258de861ULL;
  static const uint64_t static_value2 = 0x17080d1e01c3bf23ULL;
};

template<class ContainerAllocator>
struct DataType< ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "franka_predict_action/StoreNewActionToQueueRequest";
  }

  static const char* value(const ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string model_name   # the name of the model to predict\n"
"string instruction  # the instruction sended to model for predicton\n"
"string unnorm_key   # the dataset of the scene\n"
"\n"
;
  }

  static const char* value(const ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.model_name);
      stream.next(m.instruction);
      stream.next(m.unnorm_key);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct StoreNewActionToQueueRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::franka_predict_action::StoreNewActionToQueueRequest_<ContainerAllocator>& v)
  {
    s << indent << "model_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.model_name);
    s << indent << "instruction: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.instruction);
    s << indent << "unnorm_key: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.unnorm_key);
  }
};

} // namespace message_operations
} // namespace ros

#endif // FRANKA_PREDICT_ACTION_MESSAGE_STORENEWACTIONTOQUEUEREQUEST_H