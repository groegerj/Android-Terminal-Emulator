LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(call all-java-files-under, src) \
                   src/jackpal/androidterm/libtermexec/v1/ITerminal.aidl

LOCAL_MODULE := jackpal.androidterm.libtermexec.v1

LOCAL_JNI_SHARED_LIBRARIES := libjackpal-termexec2
LOCAL_REQUIRED_MODULES := libjackpal-termexec2

include $(BUILD_STATIC_JAVA_LIBRARY)

include $(call all-makefiles-under,$(LOCAL_PATH))

