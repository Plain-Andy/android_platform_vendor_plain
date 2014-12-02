# Versioning of the ROM

TARGET_PRODUCT_SHORT := $(TARGET_PRODUCT)
TARGET_PRODUCT_SHORT := $(subst plain_,,$(TARGET_PRODUCT_SHORT))

ROM_VERSION_MAJOR := $(shell date +"%y")
ROM_VERSION_MINOR := 2

ifdef BUILDTYPE_NIGHTLY
	ROM_BUILDTYPE := Nightly
endif
ifdef BUILDTYPE_WEEKLY
	ROM_BUILDTYPE := Weekly
endif
ifdef BUILDTYPE_EXPERIMENTAL
	ROM_BUILDTYPE := Experimental
endif

ifndef ROM_BUILDTYPE
	ROM_BUILDTYPE := Unofficial
endif

ROM_VERSION := $(shell date -u +%Y%m%d)-$(TARGET_PRODUCT_SHORT)

ifdef AROMA_BUILD
	ROM_BUILDTYPE := $(ROM_BUILDTYPE)-Aroma
endif

ifdef BUILDTYPE_RELEASE
	ROM_BUILDTYPE := Release 
	ROM_VERSION := v$(ROM_VERSION_MAJOR).$(ROM_VERSION_MINOR)-$(TARGET_PRODUCT_SHORT)
	AROMA_BUILD := true
endif

# Apply it to build.prop
PRODUCT_PROPERTY_OVERRIDES += \
	ro.modversion=Plain-Andy-$(TARGET_PRODUCT_SHORT) \
	ro.plain.version=$(ROM_VERSION) \
	rom.buildtype=$(ROM_BUILDTYPE)
