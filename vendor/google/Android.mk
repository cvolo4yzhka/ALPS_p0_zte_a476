ifdef BUILD_GMS
ifeq ($(strip $(BUILD_GMS)), yes)

include $(call all-subdir-makefiles)

GMS_PRODUCT_MODULES := $(strip $(foreach p,$(GMS_PRODUCT_PACKAGES),$(PACKAGES.$(p).OVERRIDES)))
$(info [BUILD_GMS] override $(GMS_PRODUCT_MODULES))

GMS_OVERRIDE_DIRS := \
  $(TARGET_OUT_APPS) \
  $(TARGET_OUT_APPS_PRIVILEGED) \
  $(TARGET_OUT_DATA_APPS) \
  $(TARGET_OUT_VENDOR_APPS) \
  $(TARGET_OUT_VENDOR_APPS_PRIVILEGED) \
  $(TARGET_OUT_VENDOR)/operator/app

GMS_PRODUCT_FILES := \
  $(foreach d,$(GMS_OVERRIDE_DIRS),$(addprefix $(d)/,$(GMS_PRODUCT_MODULES))) \
  $(dir $(call module-installed-files,$(GMS_PRODUCT_MODULES)))

endif
endif

