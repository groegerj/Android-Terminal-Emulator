TOP_LOCAL_PATH:= $(call my-dir)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(call all-java-files-under, src)

LOCAL_PACKAGE_NAME := Terminal

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res

LOCAL_JNI_SHARED_LIBRARIES := libjackpal-androidterm5
LOCAL_REQUIRED_MODULES := libjackpal-androidterm5 \
                          libjackpal-termexec2

LOCAL_STATIC_JAVA_LIBRARIES := jackpal.androidterm.emulatorview \
                               jackpal.androidterm.libtermexec.v1

include $(BUILD_PACKAGE)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(TOP_LOCAL_PATH)/libraries/libtermexec/Android.mk
include $(TOP_LOCAL_PATH)/libraries/emulatorview/Android.mk


