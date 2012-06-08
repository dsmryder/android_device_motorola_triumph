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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/motorola/triumph/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := qsd8k
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := triumph

TARGET_USES_2G_VM_SPLIT := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION := VER_0_6_X
BOARD_WLAN_DEVICE := libra
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/libra.ko"
WIFI_DRIVER_MODULE_NAME := "libra"
WIFI_SDIO_IF_DRIVER_MODULE_PATH := "/system/lib/modules/librasdioif.ko"
WIFI_SDIO_IF_DRIVER_MODULE_NAME := "librasdioif"
BOARD_WEXT_NO_COMBO_SCAN := true

BOARD_USES_GENERIC_AUDIO := true

BOARD_KERNEL_CMDLINE := console=ttyMSM1 androidboot.hardware=triumph
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := triumph
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50001
BOARD_VENDOR_QCOM_GPS_NEEDS_LNA := true
BOARD_VENDOR_QCOM_GPS_HAS_BROKEN_XTRA := true

BOARD_EGL_CFG := device/motorola/triumph/egl.cfg

BOARD_USES_QCOM_HARDWARE := true
TARGET_HAVE_TSLIB := true
TARGET_HAVE_HDMI_OUT := true
TARGET_HARDWARE_3D := false

BOARD_CAMERA_LIBRARIES := libcamera

BOARD_USE_USB_MASS_STORAGE_SWITCH := true
BOARD_UMS_LUNFILE := "/sys/devices/platform/usb_mass_storage/lun0/file"

BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_USES_MMCUTILS := true
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/motorola/triumph/recovery/recovery_ui.c
BOARD_CUSTOM_GRAPHICS := ../../../device/motorola/triumph/recovery/minui/graphics.c

TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/motorola/triumph/releasetools/triumph_img_from_target_files
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/motorola/triumph/releasetools/triumph_ota_from_target_files

BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00480000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 260046848
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1191182336
BOARD_FLASH_BLOCK_SIZE := 262144

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common
TARGET_PREBUILT_KERNEL := device/motorola/triumph/kernel
TARGET_PREBUILT_RECOVERY_KERNEL := device/motorola/triumph/recovery_kernel

BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p7
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
BOARD_DATA_DEVICE := /dev/block/mmcblk0p8
BOARD_DATA_FILESYSTEM := ext4
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p11
BOARD_CACHE_FILESYSTEM := ext4

# Make sure vold formats the proper sdcard partition
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

BOARD_HAS_NO_MISC_PARTITION := true
TARGET_USERIMAGES_USE_EXT4 := true

TARGET_OTA_ASSERT_DEVICE := triumph,WX435,fb0


