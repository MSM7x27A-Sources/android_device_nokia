#
# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The GPS configuration appropriate for this device.
#$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/nokia/normandy/overlay

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_TAGS += dalvik.gc.type-precise

# ViewMem 
PRODUCT_PACKAGES += viewmem

# Config Files
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/nokia/normandy/system,system)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/nokia/normandy/rootdir,root)

## Misc files
PRODUCT_COPY_FILES += \
    device/nokia/normandy/system/lib/liboncrpc.so:obj/lib/liboncrpc.so \
    device/nokia/normandy/system/lib/libnv.so:obj/lib/libnv.so \
    device/nokia/normandy/system/lib/libaudioalsa.so:obj/lib/libaudioalsa.so \
    device/nokia/normandy/system/lib/libaudcal.so:obj/lib/libaudcal.so 

# Copy Prebuilt Camera as system app
PRODUCT_COPY_FILES +=  device/nokia/normandy/prebuilt/app/com.cyngn.cameranext.ver.2.0.003.apk:system/priv-app/Camera/com.cyngn.cameranext.ver.2.0.003.apk

# Torch
PRODUCT_PACKAGES += Torch

# Packages
PRODUCT_PACKAGES += audio.a2dp.default
PRODUCT_PACKAGES += audio.primary.msm7x27a
PRODUCT_PACKAGES += audio.usb.default
PRODUCT_PACKAGES += audio_policy.msm7x27a
PRODUCT_PACKAGES += libaudioutils

PRODUCT_PACKAGES += libgenlock
PRODUCT_PACKAGES += copybit.msm7x27a
PRODUCT_PACKAGES += gralloc.msm7x27a
PRODUCT_PACKAGES += libqdMetaData
PRODUCT_PACKAGES += memtrack.msm7x27a
PRODUCT_PACKAGES += libtilerenderer

PRODUCT_PACKAGES += librs_jni
PRODUCT_PACKAGES += LiveWallpapers
PRODUCT_PACKAGES += LiveWallpapersPicker
PRODUCT_PACKAGES += VisualizationWallpapers

PRODUCT_PACKAGES += charger_res_images
PRODUCT_PACKAGES += charger
PRODUCT_PACKAGES += libmm-omxcore
PRODUCT_PACKAGES += libOmxCore
PRODUCT_PACKAGES += libstagefrighthw

PRODUCT_PACKAGES += gps.msm7x27a
PRODUCT_PACKAGES += camera.msm7x27a 
PRODUCT_PACKAGES += lights.msm7x27a

PRODUCT_PACKAGES += power.msm7x27a
PRODUCT_PACKAGES += power.qcom

PRODUCT_PACKAGES += com.android.future.usb.accessory
PRODUCT_PACKAGES += hwmac
PRODUCT_PACKAGES += make_ext4fs
PRODUCT_PACKAGES += setup_fs

PRODUCT_PACKAGES += libstlport

# Gello
PRODUCT_PACKAGES += Gello

# Wifi
PRODUCT_PACKAGES += libcnefeatureconfig
PRODUCT_PACKAGES += libwpa_client
PRODUCT_PACKAGES += hostapd
PRODUCT_PACKAGES += dhcpcd.conf
PRODUCT_PACKAGES += wpa_supplicant
PRODUCT_PACKAGES += wpa_supplicant.conf

# Permissions
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml
#PRODUCT_COPY_FILES += packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml
PRODUCT_PACKAGES += frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml
PRODUCT_PACKAGES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# Override bootanimation
PRODUCT_COPY_FILES += device/nokia/normandy/bootanimation/cm10.zip:system/media/bootanimation.zip

#$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
