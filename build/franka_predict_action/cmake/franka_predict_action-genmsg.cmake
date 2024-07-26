# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "franka_predict_action: 0 messages, 4 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(franka_predict_action_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/ClearActionQueue.srv" NAME_WE)
add_custom_target(_franka_predict_action_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "franka_predict_action" "/project/franka_panda_sim_ws/src/franka_predict_action/srv/ClearActionQueue.srv" ""
)

get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/FetchSingleAction.srv" NAME_WE)
add_custom_target(_franka_predict_action_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "franka_predict_action" "/project/franka_panda_sim_ws/src/franka_predict_action/srv/FetchSingleAction.srv" ""
)

get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/PredictAction.srv" NAME_WE)
add_custom_target(_franka_predict_action_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "franka_predict_action" "/project/franka_panda_sim_ws/src/franka_predict_action/srv/PredictAction.srv" ""
)

get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/StoreNewActionToQueue.srv" NAME_WE)
add_custom_target(_franka_predict_action_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "franka_predict_action" "/project/franka_panda_sim_ws/src/franka_predict_action/srv/StoreNewActionToQueue.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(franka_predict_action
  "/project/franka_panda_sim_ws/src/franka_predict_action/srv/ClearActionQueue.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_predict_action
)
_generate_srv_cpp(franka_predict_action
  "/project/franka_panda_sim_ws/src/franka_predict_action/srv/FetchSingleAction.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_predict_action
)
_generate_srv_cpp(franka_predict_action
  "/project/franka_panda_sim_ws/src/franka_predict_action/srv/PredictAction.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_predict_action
)
_generate_srv_cpp(franka_predict_action
  "/project/franka_panda_sim_ws/src/franka_predict_action/srv/StoreNewActionToQueue.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_predict_action
)

### Generating Module File
_generate_module_cpp(franka_predict_action
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_predict_action
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(franka_predict_action_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(franka_predict_action_generate_messages franka_predict_action_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/ClearActionQueue.srv" NAME_WE)
add_dependencies(franka_predict_action_generate_messages_cpp _franka_predict_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/FetchSingleAction.srv" NAME_WE)
add_dependencies(franka_predict_action_generate_messages_cpp _franka_predict_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/PredictAction.srv" NAME_WE)
add_dependencies(franka_predict_action_generate_messages_cpp _franka_predict_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/StoreNewActionToQueue.srv" NAME_WE)
add_dependencies(franka_predict_action_generate_messages_cpp _franka_predict_action_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(franka_predict_action_gencpp)
add_dependencies(franka_predict_action_gencpp franka_predict_action_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS franka_predict_action_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(franka_predict_action
  "/project/franka_panda_sim_ws/src/franka_predict_action/srv/ClearActionQueue.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_predict_action
)
_generate_srv_eus(franka_predict_action
  "/project/franka_panda_sim_ws/src/franka_predict_action/srv/FetchSingleAction.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_predict_action
)
_generate_srv_eus(franka_predict_action
  "/project/franka_panda_sim_ws/src/franka_predict_action/srv/PredictAction.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_predict_action
)
_generate_srv_eus(franka_predict_action
  "/project/franka_panda_sim_ws/src/franka_predict_action/srv/StoreNewActionToQueue.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_predict_action
)

### Generating Module File
_generate_module_eus(franka_predict_action
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_predict_action
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(franka_predict_action_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(franka_predict_action_generate_messages franka_predict_action_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/ClearActionQueue.srv" NAME_WE)
add_dependencies(franka_predict_action_generate_messages_eus _franka_predict_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/FetchSingleAction.srv" NAME_WE)
add_dependencies(franka_predict_action_generate_messages_eus _franka_predict_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/PredictAction.srv" NAME_WE)
add_dependencies(franka_predict_action_generate_messages_eus _franka_predict_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/StoreNewActionToQueue.srv" NAME_WE)
add_dependencies(franka_predict_action_generate_messages_eus _franka_predict_action_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(franka_predict_action_geneus)
add_dependencies(franka_predict_action_geneus franka_predict_action_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS franka_predict_action_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(franka_predict_action
  "/project/franka_panda_sim_ws/src/franka_predict_action/srv/ClearActionQueue.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_predict_action
)
_generate_srv_lisp(franka_predict_action
  "/project/franka_panda_sim_ws/src/franka_predict_action/srv/FetchSingleAction.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_predict_action
)
_generate_srv_lisp(franka_predict_action
  "/project/franka_panda_sim_ws/src/franka_predict_action/srv/PredictAction.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_predict_action
)
_generate_srv_lisp(franka_predict_action
  "/project/franka_panda_sim_ws/src/franka_predict_action/srv/StoreNewActionToQueue.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_predict_action
)

### Generating Module File
_generate_module_lisp(franka_predict_action
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_predict_action
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(franka_predict_action_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(franka_predict_action_generate_messages franka_predict_action_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/ClearActionQueue.srv" NAME_WE)
add_dependencies(franka_predict_action_generate_messages_lisp _franka_predict_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/FetchSingleAction.srv" NAME_WE)
add_dependencies(franka_predict_action_generate_messages_lisp _franka_predict_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/PredictAction.srv" NAME_WE)
add_dependencies(franka_predict_action_generate_messages_lisp _franka_predict_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/StoreNewActionToQueue.srv" NAME_WE)
add_dependencies(franka_predict_action_generate_messages_lisp _franka_predict_action_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(franka_predict_action_genlisp)
add_dependencies(franka_predict_action_genlisp franka_predict_action_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS franka_predict_action_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(franka_predict_action
  "/project/franka_panda_sim_ws/src/franka_predict_action/srv/ClearActionQueue.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_predict_action
)
_generate_srv_nodejs(franka_predict_action
  "/project/franka_panda_sim_ws/src/franka_predict_action/srv/FetchSingleAction.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_predict_action
)
_generate_srv_nodejs(franka_predict_action
  "/project/franka_panda_sim_ws/src/franka_predict_action/srv/PredictAction.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_predict_action
)
_generate_srv_nodejs(franka_predict_action
  "/project/franka_panda_sim_ws/src/franka_predict_action/srv/StoreNewActionToQueue.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_predict_action
)

### Generating Module File
_generate_module_nodejs(franka_predict_action
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_predict_action
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(franka_predict_action_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(franka_predict_action_generate_messages franka_predict_action_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/ClearActionQueue.srv" NAME_WE)
add_dependencies(franka_predict_action_generate_messages_nodejs _franka_predict_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/FetchSingleAction.srv" NAME_WE)
add_dependencies(franka_predict_action_generate_messages_nodejs _franka_predict_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/PredictAction.srv" NAME_WE)
add_dependencies(franka_predict_action_generate_messages_nodejs _franka_predict_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/StoreNewActionToQueue.srv" NAME_WE)
add_dependencies(franka_predict_action_generate_messages_nodejs _franka_predict_action_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(franka_predict_action_gennodejs)
add_dependencies(franka_predict_action_gennodejs franka_predict_action_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS franka_predict_action_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(franka_predict_action
  "/project/franka_panda_sim_ws/src/franka_predict_action/srv/ClearActionQueue.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_predict_action
)
_generate_srv_py(franka_predict_action
  "/project/franka_panda_sim_ws/src/franka_predict_action/srv/FetchSingleAction.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_predict_action
)
_generate_srv_py(franka_predict_action
  "/project/franka_panda_sim_ws/src/franka_predict_action/srv/PredictAction.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_predict_action
)
_generate_srv_py(franka_predict_action
  "/project/franka_panda_sim_ws/src/franka_predict_action/srv/StoreNewActionToQueue.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_predict_action
)

### Generating Module File
_generate_module_py(franka_predict_action
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_predict_action
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(franka_predict_action_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(franka_predict_action_generate_messages franka_predict_action_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/ClearActionQueue.srv" NAME_WE)
add_dependencies(franka_predict_action_generate_messages_py _franka_predict_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/FetchSingleAction.srv" NAME_WE)
add_dependencies(franka_predict_action_generate_messages_py _franka_predict_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/PredictAction.srv" NAME_WE)
add_dependencies(franka_predict_action_generate_messages_py _franka_predict_action_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/project/franka_panda_sim_ws/src/franka_predict_action/srv/StoreNewActionToQueue.srv" NAME_WE)
add_dependencies(franka_predict_action_generate_messages_py _franka_predict_action_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(franka_predict_action_genpy)
add_dependencies(franka_predict_action_genpy franka_predict_action_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS franka_predict_action_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_predict_action)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/franka_predict_action
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(franka_predict_action_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_predict_action)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/franka_predict_action
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(franka_predict_action_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_predict_action)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/franka_predict_action
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(franka_predict_action_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_predict_action)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/franka_predict_action
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(franka_predict_action_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_predict_action)
  install(CODE "execute_process(COMMAND \"/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_predict_action\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/franka_predict_action
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(franka_predict_action_generate_messages_py std_msgs_generate_messages_py)
endif()
