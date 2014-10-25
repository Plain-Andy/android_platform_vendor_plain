PRODUCT_BRAND ?= plain

# general properties
PRODUCT_PROPERTIES_OVERRIDE += \
	keyguard.no_require_sim=true \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.com.google.clientidbase=android-google \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.setupwizard.enterprise_mode=1 \
	ro.com.android.dateformat=MM-dd-yyyy \
	ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.root_access=1 \
	persist.sys.strictmode.visual=0 \
	persist.sys.strictmode.disable=1 \
        ro.max.fling_velocity=14000 \
        ro.min.fling_velocity=9000 \
        persist.sys.scrollingcache=3

# enable ADB authentication if not on eng build
ifneq ($(TARGET_BUILD_VARIANT),eng)
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=1
else
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0
endif

# Embed SuperUser
SUPERUSER_EMBEDDED := true

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/plain/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/plain/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/plain/prebuilt/bin/50-hosts.sh:system/addon.d/50-hosts.sh \
    vendor/plain/prebuilt/bin/blacklist:system/addon.d/blacklist

# init.d support
PRODUCT_COPY_FILES += \
	vendor/plain/prebuilt/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/plain/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# Init script file with plain extras
PRODUCT_COPY_FILES += \
    vendor/plain/prebuilt/etc/init.local.rc:root/init.plain.rc \
    vendor/plain/prebuilt/etc/init.plain.kerneltweak.sh:/system/etc/init.plain.kerneltweak.sh \
    vendor/plain/prebuilt/bin/plaintweak:system/bin/plaintweak

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Additional packages
-include vendor/plain/config/packages.mk

# Versioning
-include vendor/plain/config/version.mk

# Theme Manager
-include vendor/plain/config/nfc_enhanced.mk

# Theme Manager
-include vendor/plain/config/themes.mk

# CM Hardware Abstraction Framework
PRODUCT_PACKAGES += \
    org.cyanogenmod.hardware \
    org.cyanogenmod.hardware.xml

# Add our overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/plain/overlay/common

# Qualcomm Optimized Dalvik
LOCAL_PATH:= vendor/plain/prebuilt

ifneq ($(filter msm8610 msm8x26 msm8226 msm8x74 msm8974 msm8960 msm8660 msm7627a msm7630_surf apq8084 mpq8092,$(TARGET_BOARD_PLATFORM)),)
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/bin/dalvikvm:system/bin/dalvikvm \
        $(LOCAL_PATH)/bin/dexopt:system/bin/dexopt \
        $(LOCAL_PATH)/lib/libcutils.so:system/lib/libcutils.so \
        $(LOCAL_PATH)/lib/libdvm.so:system/lib/libdvm.so \
        $(LOCAL_PATH)/lib/libqc-opt.so:system/lib/libqc-opt.so
endif

# Extra recovery tools for CWM 
PRODUCT_PACKAGES += \
    recovery_e2fsck \
    recovery_mke2fs \
    recovery_tune2fs \
    mount.exfat_static \
    minivold

## Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libstagefright_soft_ffmpegadec \
    libstagefright_soft_ffmpegvdec \
    libFFmpegExtractor \
    libnamparser
