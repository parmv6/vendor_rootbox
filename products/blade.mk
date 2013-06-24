# Inherit AOSP device configuration for Blade
$(call inherit-product, device/zte/blade/blade.mk)

# Inherit AOKP common bits
$(call inherit-product, vendor/rootbox/configs/common.mk)

# Inherit GSM common stuff
$(call inherit-product, vendor/rootbox/configs/gsm.mk)

# PA OVERLAY_TARGET
OVERLAY_TARGET := pa_hdpi

# Setup device specific product configuration.
PRODUCT_NAME := rootbox_blade
PRODUCT_BRAND := ZTE
PRODUCT_MODEL := Blade
PRODUCT_MANUFACTURER := ZTE

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=blade BUILD_ID=JRO03C BUILD_FINGERPRINT=ZTE/N880E_JB4_2/atlas40:4.2/JOP40C/20121121.110335:user/release-keys PRIVATE_BUILD_DESC="N880E_JB4_2-user 4.2 JOP40C 20121121.110335 release-keys" BUILD_NUMBER=20121121.110335
PRODUCT_RELEASE_NAME := Blade

# Copy Skate specific prebuilt files
PRODUCT_COPY_FILES += \
    vendor/rootbox/prebuilt/hdpi/bootanimation.zip:system/media/bootanimation.zip
