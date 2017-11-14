# Copyright 2011 The Android Open Source Project

#AUDIO_POLICY_TEST := true
#ENABLE_AUDIO_DUMP := true

LOCAL_PATH := $(call my-dir)

common_cflags := -D_POSIX_SOURCE
ifeq ($(strip $(NEW_INPUT_AUDIO_HAL)),true)
    common_cflags += -DNEW_INPUT_AUDIO_HAL
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_FM)),true)
    common_cflags += -DQCOM_FM_ENABLED
endif

ifneq ($(strip $(QCOM_PROXY_DEVICE_ENABLED)),false)
    common_cflags += -DQCOM_PROXY_DEVICE_ENABLED
endif

ifeq ($(strip $(BOARD_USES_SRS_TRUEMEDIA)),true)
  common_cflags += -DSRS_PROCESSING
endif

include $(CLEAR_VARS)

LOCAL_CFLAGS += $(common_cflags)

LOCAL_SRC_FILES := \
    audio_hw_hal.cpp \
    HardwarePinSwitching.c

LOCAL_SRC_FILES += \
    AudioHardware_cad.cpp

LOCAL_SHARED_LIBRARIES := \
    libcutils       \
    libutils        \
    libmedia

ifneq ($(TARGET_SIMULATOR),true)
LOCAL_SHARED_LIBRARIES += libdl
endif

LOCAL_STATIC_LIBRARIES := \
    libmedia_helper \
    libaudiohw_legacy

LOCAL_MODULE := audio.primary.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS += -fno-short-enums

LOCAL_C_INCLUDES += hardware/libhardware/include
LOCAL_C_INCLUDES += hardware/libhardware_legacy/include
LOCAL_C_INCLUDES += frameworks/base/include
LOCAL_C_INCLUDES += system/core/include

LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

LOCAL_CLANG := false

include $(BUILD_SHARED_LIBRARY)

include $(LOCAL_PATH)/policy_hal/Android.mk
