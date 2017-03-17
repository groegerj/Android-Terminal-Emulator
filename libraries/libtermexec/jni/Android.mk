LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE:= libjackpal-termexec2

LOCAL_SRC_FILES:= \
  process.cpp

LOCAL_LDLIBS:= -llog
LOCAL_SHARED_LIBRARIES += liblog libcutils

include $(BUILD_SHARED_LIBRARY)
