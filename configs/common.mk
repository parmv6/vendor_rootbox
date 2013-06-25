# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/rootbox/overlay/common

# Common dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/rootbox/overlay/dictionaries

# SuperUser
SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.rb.superuser

# AOKP Packages
PRODUCT_PACKAGES += \
    AOKPtips \
    AppWidgetPicker \
    GooManager \
    LatinImeDictionaryPack \
    mGerrit \
    PermissionsManager \
    ROMControl \
    Superuser \
    su

# RootBox Packages
PRODUCT_PACKAGES += \
    RootBox \
    Trebuchet

# CM Packages
PRODUCT_PACKAGES += \
    audio_effects.conf \
    DSPManager \
    libcyanogen-dsp \
    LockClock \
    Music

# PA Packages
ifdef PA_PREF_FIX
PRODUCT_PACKAGES += \
    PaPrefs
else 
PRODUCT_PACKAGES += \
    ParanoidPreferences
endif

# RootBox build.prop tweaks
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.amr.wideband=1 \
    ro.pa.family=$(OVERLAY_TARGET)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.feedback \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enterprise_mode=1 \
    windowsmgr.max_events_per_sec=240 \
    ro.kernel.android.checkjni=0 \
    persist.sys.root_access=3

PRODUCT_COPY_FILES += \
    vendor/rootbox/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml \
    vendor/rootbox/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/rootbox/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/rootbox/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/rootbox/prebuilt/common/bin/50-backupScript.sh:system/addon.d/50-backupScript.sh

# Camera effects
PRODUCT_COPY_FILES +=  \
    vendor/rootbox/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/rootbox/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# ParanoidAndroid Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/rootbox/prebuilt/preferences/$(TARGET_PRODUCT)

# Allow device family to add overlays and use a same prop.conf
ifneq ($(OVERLAY_TARGET),)
    PRODUCT_PACKAGE_OVERLAYS += vendor/rootbox/overlay/$(OVERLAY_TARGET)
    PA_CONF_SOURCE := $(OVERLAY_TARGET)
else
    PA_CONF_SOURCE := $(TARGET_PRODUCT)
endif

PRODUCT_COPY_FILES += \
    vendor/rootbox/prebuilt/$(PA_CONF_SOURCE).conf:system/etc/paranoid/properties.conf \
    vendor/rootbox/prebuilt/$(PA_CONF_SOURCE).conf:system/etc/paranoid/backup.conf

# init.d
PRODUCT_COPY_FILES += \
    vendor/rootbox/prebuilt/common/etc/init.local.rc:root/init.aokp.rc \
    vendor/rootbox/prebuilt/common/etc/init.d/00start:system/etc/init.d/00start \
    vendor/rootbox/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/rootbox/prebuilt/common/etc/init.d/99complete:system/etc/init.d/99complete \
    vendor/rootbox/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/rootbox/prebuilt/common/bin/sysinit:system/bin/sysinit

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    libssh \
    ssh \
    sshd \
    sshd-config \
    ssh-keygen \
    sftp \
    scp

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Scarabaeus.ogg \
    ro.config.notification_sound=Antimony.ogg \
    ro.config.alarm_alert=Scandium.ogg

PRODUCT_COPY_FILES += packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Inherit common build.prop overrides
-include vendor/rootbox/configs/common_versions.mk

# T-Mobile theme engine
include vendor/rootbox/configs/themes_common.mk

# Bring in all audio files
include frameworks/base/data/sounds/NewAudio.mk

# Extra Ringtones
include frameworks/base/data/sounds/AudioPackageNewWave.mk
