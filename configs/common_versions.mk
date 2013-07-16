# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

DATE = $(shell date +%Y%m%d)
RB_BRANCH=jb-mr1

ifneq ($(RB_BUILD),)
# RootBox Official properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.developerid=zeelog \
    ro.goo.board=blade \
    ro.goo.rom=RootBox \
    ro.goo.version=$(DATE) \
    ro.rootbox.version=RootBox-JB-$(TARGET_PRODUCT)-$(RB_BUILD)
else
# RootBox Nightlies properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.developerid=zeelog \
    ro.goo.board=blade \
    ro.goo.rom=RootBoxNightlies \
    ro.goo.version=4 \
    ro.rootbox.version=RootBox-JB-$(TARGET_PRODUCT)-Nightly-$(DATE)
endif

# needed for statistics
PRODUCT_PROPERTY_OVERRIDES += \
        ro.rootbox.branch=$(RB_BRANCH) \
        ro.rootbox.device=$(RB_PRODUCT)

# Camera shutter sound property
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.camera-sound=1
