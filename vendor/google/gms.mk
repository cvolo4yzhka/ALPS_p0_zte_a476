ifdef BUILD_GMS
ifeq ($(strip $(BUILD_GMS)), yes)
ifeq ($(strip $(BUILD_AGO_GMS)), yes)
ifeq ($(strip $(EEA_TYPE)), type1)
$(call inherit-product-if-exists, vendor/google/products/gms_go_eea_type1.mk)
else ifeq ($(strip $(EEA_TYPE)), type2)
$(call inherit-product-if-exists, vendor/google/products/gms_go_eea_type2.mk)
else ifeq ($(strip $(EEA_TYPE)), type3a)
$(call inherit-product-if-exists, vendor/google/products/gms_go_eea_type3a.mk)
else ifeq ($(strip $(EEA_TYPE)), type3b)
$(call inherit-product-if-exists, vendor/google/products/gms_go_eea_type3b.mk)
else ifeq ($(strip $(EEA_TYPE)), type4a)
$(call inherit-product-if-exists, vendor/google/products/gms_go_eea_type4a.mk)
else ifeq ($(strip $(EEA_TYPE)), type4b)
$(call inherit-product-if-exists, vendor/google/products/gms_go_eea_type4b.mk)
else ifeq ($(strip $(EEA_TYPE)), type4c)
$(call inherit-product-if-exists, vendor/google/products/gms_go_eea_type4c.mk)
else
$(call inherit-product-if-exists, vendor/google/products/gms_go.mk)
endif
else
ifeq ($(strip $(EEA_TYPE)), type1)
$(call inherit-product-if-exists, vendor/google/products/gms_eea_type1.mk)
else ifeq ($(strip $(EEA_TYPE)), type2)
$(call inherit-product-if-exists, vendor/google/products/gms_eea_type2.mk)
else ifeq ($(strip $(EEA_TYPE)), type3a)
$(call inherit-product-if-exists, vendor/google/products/gms_eea_type3a.mk)
else ifeq ($(strip $(EEA_TYPE)), type3b)
$(call inherit-product-if-exists, vendor/google/products/gms_eea_type3b.mk)
else ifeq ($(strip $(EEA_TYPE)), type4a)
$(call inherit-product-if-exists, vendor/google/products/gms_eea_type4a.mk)
else ifeq ($(strip $(EEA_TYPE)), type4b)
$(call inherit-product-if-exists, vendor/google/products/gms_eea_type4b.mk)
else ifeq ($(strip $(EEA_TYPE)), type4c)
$(call inherit-product-if-exists, vendor/google/products/gms_eea_type4c.mk)
else
$(call inherit-product-if-exists, vendor/google/products/gms.mk)
endif
endif
endif
endif