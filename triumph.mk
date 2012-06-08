#
# Copyright (C) 2009 The Android Open Source Project
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

#
# This is the product configuration for a motorola triumph,
# not specialized for any geography.
#

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

PRODUCT_COPY_FILES += \
    device/motorola/triumph/init.triumph.rc:root/init.triumph.rc 

$(call inherit-product-if-exists, vendor/motorola/triumph/triumph-vendor.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-motorola \
    ro.com.google.clientidbase.yt=android-motorola \
    ro.com.google.clientidbase.am=android-motorola \
    ro.com.google.clientidbase.ms=android-motorola \
    ro.com.google.clientidbase.gmm=android-motorola \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.ril.v3=icccardstatus,skipbrokendatacall,datacall,signalstrength,facilitylock \
    persist.sys.use_dithering=0 \
    ro.sf.lcd_density=240 \
    ro.compcache.default=0 \
    ro.secure=0

DEVICE_PACKAGE_OVERLAYS += device/motorola/triumph/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/motorola/triumph/media_profiles.xml:system/etc/media_profiles.xml

# Firmware
PRODUCT_COPY_FILES += \
    device/motorola/triumph/firmware/qcom_fw.bin:system/etc/firmware/qcom_fw.bin \
    device/motorola/triumph/firmware/qcom_wapi_fw.bin:system/etc/firmware/qcom_wapi_fw.bin \
    device/motorola/triumph/firmware/qcom_wlan_nv.bin:system/etc/firmware/qcom_wlan_nv.bin

PRODUCT_COPY_FILES += \
    device/motorola/triumph/vold.fstab:system/etc/vold.fstab \
    device/motorola/triumph/gps.conf:system/etc/gps.conf \
    device/motorola/triumph/apns-conf.xml:system/etc/apns-conf.xml

PRODUCT_COPY_FILES += \
    device/motorola/triumph/modules/libra.ko:system/lib/modules/libra.ko

PRODUCT_PACKAGES += \
    librs_jni \
    sensors.triumph \
    lights.triumph \
    gralloc.qsd8k \
    copybit.qsd8k \
    libOmxCore \
    libOmxVidEnc

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Triumph uses high-density artwork where available
PRODUCT_LOCALES += hdpi

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/motorola/triumph/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product-if-exists, vendor/motorola/triumph/triumph-vendor.mk)

# stuff common to all HTC phones
$(call inherit-product, device/motorola/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)


PRODUCT_NAME := full_triumph
PRODUCT_DEVICE := triumph
