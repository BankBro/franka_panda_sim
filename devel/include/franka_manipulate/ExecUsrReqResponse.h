// Generated by gencpp from file franka_manipulate/ExecUsrReqResponse.msg
// DO NOT EDIT!


#ifndef FRANKA_MANIPULATE_MESSAGE_EXECUSRREQRESPONSE_H
#define FRANKA_MANIPULATE_MESSAGE_EXECUSRREQRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace franka_manipulate
{
template <class ContainerAllocator>
struct ExecUsrReqResponse_
{
  typedef ExecUsrReqResponse_<ContainerAllocator> Type;

  ExecUsrReqResponse_()
    : exec_usr_req_ret(false)  {
    }
  ExecUsrReqResponse_(const ContainerAllocator& _alloc)
    : exec_usr_req_ret(false)  {
  (void)_alloc;
    }



   typedef uint8_t _exec_usr_req_ret_type;
  _exec_usr_req_ret_type exec_usr_req_ret;





  typedef boost::shared_ptr< ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator> const> ConstPtr;

}; // struct ExecUsrReqResponse_

typedef ::franka_manipulate::ExecUsrReqResponse_<std::allocator<void> > ExecUsrReqResponse;

typedef boost::shared_ptr< ::franka_manipulate::ExecUsrReqResponse > ExecUsrReqResponsePtr;
typedef boost::shared_ptr< ::franka_manipulate::ExecUsrReqResponse const> ExecUsrReqResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator1> & lhs, const ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator2> & rhs)
{
  return lhs.exec_usr_req_ret == rhs.exec_usr_req_ret;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator1> & lhs, const ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace franka_manipulate

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "70cb9a8771a3a05cee361cd81812dcc8";
  }

  static const char* value(const ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x70cb9a8771a3a05cULL;
  static const uint64_t static_value2 = 0xee361cd81812dcc8ULL;
};

template<class ContainerAllocator>
struct DataType< ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "franka_manipulate/ExecUsrReqResponse";
  }

  static const char* value(const ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
"bool exec_usr_req_ret\n"
;
  }

  static const char* value(const ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.exec_usr_req_ret);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ExecUsrReqResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::franka_manipulate::ExecUsrReqResponse_<ContainerAllocator>& v)
  {
    s << indent << "exec_usr_req_ret: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.exec_usr_req_ret);
  }
};

} // namespace message_operations
} // namespace ros

#endif // FRANKA_MANIPULATE_MESSAGE_EXECUSRREQRESPONSE_H