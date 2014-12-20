PRODUCT_COPY_FILES += \
    vendor/plain/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml \
    vendor/plain/prebuilt/etc/selective-spn-conf.xml:system/etc/selective-spn-conf.xml \
    vendor/plain/prebuilt/etc/spn-conf.xml:system/etc/spn-conf.xml

PRODUCT_PACKAGES += \
    Stk \
    CellBroadcastReceiver \
    VoiceDialer \
    SoundRecorder
