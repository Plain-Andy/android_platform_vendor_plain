# Versioning of the ROM

TARGET_PRODUCT_SHORT := $(TARGET_PRODUCT)
TARGET_PRODUCT_SHORT := $(subst plain_,,$(TARGET_PRODUCT_SHORT))

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
ifeq ($(ROM_BUILDTYPE),Release)
	$(shell export AROMA_BUILD=true)
endif

ROM_VERSION := $(shell date -u +%Y%m%d)-$(TARGET_PRODUCT_SHORT)-$(ROM_BUILDTYPE)

ifdef BUILDTYPE_RELEASE
	ROM_BUILDTYPE := Release 
	ROM_VERSION := $(PLATFORM_VERSION)-$(TARGET_PRODUCT_SHORT)
endif

# Apply it to build.prop
PRODUCT_PROPERTY_OVERRIDES += \
	ro.modversion=Plain-Andy-$(TARGET_PRODUCT_SHORT) \
	ro.plain.version=$(ROM_VERSION)
