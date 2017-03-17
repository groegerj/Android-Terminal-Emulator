LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE:= libjackpal-androidterm5

LOCAL_SRC_FILES:= \
  common.cpp \
  termExec.cpp \
  fileCompat.cpp

LOCAL_LDLIBS := -llog
LOCAL_SHARED_LIBRARIES += liblog libcutils

include $(BUILD_SHARED_LIBRARY)
