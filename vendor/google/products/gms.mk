###############################################################################
# GMS home folder location
# Note: we cannot use $(my-dir) in this makefile
ANDROID_PARTNER_GMS_HOME := vendor/google

# GMS mandatory core packages(20)
$(call inherit-product, build/target/product/product_launched_with_p.mk)
GMS_PRODUCT_PACKAGES += \
    AndroidPlatformServices \
    ConfigUpdater \
    GoogleBackupTransport \
    GoogleExtServices \
    GoogleExtShared \
    GoogleFeedback \
    GoogleOneTimeInitializer \
    GooglePackageInstaller \
    GooglePartnerSetup \
    GooglePrintRecommendationService \
    GoogleRestore \
    GoogleServicesFramework \
    GoogleCalendarSyncAdapter \
    GoogleContactsSyncAdapter \
    GoogleTTS \
    GmsCore \
    Phonesky \
    SetupWizard \
    Wellbeing \
    WebViewGoogle

# GMS mandatory libraries
PRODUCT_PACKAGES += com.google.android.maps.jar

# Overlay for GMS devices
$(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product-if-exists, device/mediatek/common/overlay/backup/backup_overlay.mk)
$(call inherit-product, device/sample/products/location_overlay.mk)
PRODUCT_PACKAGE_OVERLAYS += \
    $(ANDROID_PARTNER_GMS_HOME)/products/assistant_gsa_overlay \
    $(ANDROID_PARTNER_GMS_HOME)/products/gms_overlay \
    $(ANDROID_PARTNER_GMS_HOME)/products/webview_overlay
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(ANDROID_PARTNER_GMS_HOME)/products/webview_overlay

ifneq ($(strip $(MTK_TB_WIFI_3G_MODE)),WIFI_ONLY)
# Overlay for GoogleDialer
#PRODUCT_PACKAGE_OVERLAYS += $(ANDROID_PARTNER_GMS_HOME)/apps/GoogleDialer/overlay
endif

# Configuration files for GMS apps
PRODUCT_COPY_FILES += \
    $(ANDROID_PARTNER_GMS_HOME)/etc/default-permissions/default-permissions-google.xml:system/etc/default-permissions/default-permissions-google.xml \
    $(ANDROID_PARTNER_GMS_HOME)/etc/permissions/privapp-permissions-google.xml:system/etc/permissions/privapp-permissions-google.xml \
    $(ANDROID_PARTNER_GMS_HOME)/etc/preferred-apps/google.xml:system/etc/preferred-apps/google.xml \
    $(ANDROID_PARTNER_GMS_HOME)/etc/sysconfig/google.xml:system/etc/sysconfig/google.xml \
    $(ANDROID_PARTNER_GMS_HOME)/etc/sysconfig/wellbeing.xml:system/etc/sysconfig/wellbeing.xml \
    $(ANDROID_PARTNER_GMS_HOME)/etc/sysconfig/gmsexpress.xml:system/etc/sysconfig/gmsexpress.xml \
    $(ANDROID_PARTNER_GMS_HOME)/etc/sysconfig/google-hiddenapi-package-whitelist.xml:system/etc/sysconfig/google-hiddenapi-package-whitelist.xml

# GMS mandatory application packages
GMS_PRODUCT_PACKAGES += \
    Chrome \
    AssistantShell
#    Drive \
#    Gmail2 \
#    Duo \
#    Maps \
#    YTMusic \
#    Photos \
#    Velvet \
#    Videos \
#    YouTube \

# GMS comms suite(4)
GMS_PRODUCT_PACKAGES += \
    CarrierServices
#    GoogleContacts
#ifneq ($(strip $(MTK_TB_WIFI_3G_MODE)),WIFI_ONLY)
#GMS_PRODUCT_PACKAGES += \
#    GoogleDialer \
#    Messages
#endif
# GMS optional application packages
#GMS_PRODUCT_PACKAGES += \
#    CalendarGoogle \
#    LatinImeGoogle

# Overlay for SearchLauncherQuickStep
#PRODUCT_PACKAGE_OVERLAYS += \
#    $(ANDROID_PARTNER_GMS_HOME)/apps/SearchLauncher/quickstep/overlay \
#    $(ANDROID_PARTNER_GMS_HOME)/apps/SearchLauncher/quickstep/static_overlay
#PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
#    $(ANDROID_PARTNER_GMS_HOME)/apps/SearchLauncher/quickstep/static_overlay

#GMS_PRODUCT_PACKAGES += \
#    Launcher3NoQsb
#    FilesGoogle \
#    SearchLauncherQuickStep \

# Add GMS package into system product packages
PRODUCT_PACKAGES += $(GMS_PRODUCT_PACKAGES)

# Overrides
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.opa.eligible_device=true \
    ro.setupwizard.mode=OPTIONAL \
    setupwizard.feature.predeferred_enabled=true \
    ro.com.google.gmsversion=9_202001
