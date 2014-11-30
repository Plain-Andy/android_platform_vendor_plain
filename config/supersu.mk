# Chainfire SuperSU v2.36
SU_VERSION_MAJOR := 2
SU_VERSION_MINOR := 36
SU_VERSION := v$(SU_VERSION_MAJOR).$(SU_VERSION_MINOR)

PRODUCT_COPY_FILES += \
    vendor/plain/prebuilt/supersu/SuperSU-$(SU_VERSION).zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/plain/prebuilt/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon
