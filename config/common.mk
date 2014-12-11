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
	ro.build.selinux=1 \
	persist.sys.root_access=3 \
	persist.sys.strictmode.visual=0 \
	persist.sys.strictmode.disable=1 \
        ro.max.fling_velocity=14000 \
        ro.min.fling_velocity=9000 \
        persist.sys.scrollingcache=3

ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0

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
    vendor/plain/prebuilt/etc/init.local.rc:root/init.slim.rc \
    vendor/plain/prebuilt/etc/init.plain.kerneltweak.sh:/system/etc/init.plain.kerneltweak.sh \
    vendor/plain/prebuilt/bin/plaintweak:system/bin/plaintweak \
    vendor/plain/prebuilt/etc/init.d/99customanimation:/system/etc/init.d/99customanimation \
    external/koush/Superuser/init.superuser.rc:root/init.superuser.rc

# Enable SIP and VoIP on all targets
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Additional packages
-include vendor/plain/config/packages.mk

# Versioning
-include vendor/plain/config/version.mk

# Chainfire SuperSU v2.36
-include vendor/plain/config/supersu.mk

-include vendor/plain/sepolicy/sepolicy.mk

# Add our overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/plain/overlay/common
