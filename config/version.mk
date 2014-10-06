# Versioning of the ROM

TARGET_PRODUCT_SHORT := $(TARGET_PRODUCT)
TARGET_PRODUCT_SHORT := $(subst plain_,,$(TARGET_PRODUCT_SHORT))

ifdef BUILDTYPE_NIGHTLY
	ROM_BUILDTYPE := Nightly
	ROM_VERSION := $(shell date -u +%Y%m%d)-$(TARGET_PRODUCT_SHORT)-Nightly
endif
ifdef BUILDTYPE_EXPERIMENTAL
	ROM_BUILDTYPE := Experimental
	ROM_VERSION := $(shell date -u +%Y%m%d)-$(TARGET_PRODUCT_SHORT)-Experimental
endif
ifdef BUILDTYPE_RELEASE
	ROM_BUILDTYPE := Release
	$(shell export AROMA_BUILD=true) 
	ROM_VERSION := $(PLATFORM_VERSION)-$(TARGET_PRODUCT_SHORT)
endif

ifndef ROM_BUILDTYPE
	ROM_BUILDTYPE := Unofficial
	ifdef AROMA_BUILD
	ROM_BUILDTYPE := $(ROM_BUILDTYPE)-Aroma
	endif
	ROM_VERSION := $(shell date -u +%Y%m%d)-$(TARGET_PRODUCT_SHORT)-$(ROM_BUILDTYPE)
endif


# Apply it to build.prop
PRODUCT_PROPERTY_OVERRIDES += \
	ro.modversion=Plain-Andy-$(TARGET_PRODUCT_SHORT) \
	ro.plain.version=$(ROM_VERSION)
