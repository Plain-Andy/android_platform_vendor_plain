# Versioning of the ROM

TARGET_PRODUCT_SHORT := $(TARGET_PRODUCT)
TARGET_PRODUCT_SHORT := $(subst plain_,,$(TARGET_PRODUCT_SHORT))

ROM_VERSION_MAJOR := $(shell date +"%y")
ROM_VERSION_MINOR := 3

ifdef BUILDTYPE_NIGHTLY
	ROM_BUILDTYPE := Nightly
	plain := bacon
endif
ifdef BUILDTYPE_WEEKLY
	ROM_BUILDTYPE := Weekly
	plain := coffee
endif
ifdef BUILDTYPE_EXPERIMENTAL
	ROM_BUILDTYPE := Experimental
	plain := latte
endif
ifdef BUILDTYPE_RELEASE
	ROM_BUILDTYPE := Release 
	ROM_VERSION := $(BUILD_ID)-v$(ROM_VERSION_MAJOR).$(ROM_VERSION_MINOR)-$(TARGET_PRODUCT_SHORT)
	AROMA_BUILD := true
	plain := coffee
endif

ifndef ROM_BUILDTYPE
	ROM_BUILDTYPE := Unofficial
	plain := latte
endif

ROM_VERSION := $(shell date -u +%m.%d).$(BUILD_ID)

# Apply it to build.prop
PRODUCT_PROPERTY_OVERRIDES += \
	ro.modversion=Plain-Andy-$(TARGET_PRODUCT_SHORT) \
	ro.plain.version=$(ROM_VERSION) \
	rom.buildtype=$(ROM_BUILDTYPE)
