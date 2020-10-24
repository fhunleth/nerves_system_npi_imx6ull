#############################################################
#
# ebf-linux-dtoverlays
#
#############################################################

EBF_LINUX_DTOVERLAYS_VERSION = e19dcecfe5d666a6dfb8f5791bcb1d819b85c954
EBF_LINUX_DTOVERLAYS_SITE = $(call github,Embedfire,ebf-linux-dtoverlays,$(EBF_LINUX_DTOVERLAYS_VERSION))
EBF_LINUX_DTOVERLAYS_LICENSE = GPLv2+
EBF_LINUX_DTOVERLAYS_DEPENDENCIES = host-dtc
EBF_LINUX_DTOVERLAYS_INSTALL_TARGET = NO
EBF_LINUX_DTOVERLAYS_INSTALL_IMAGES = YES

define EBF_LINUX_DTOVERLAYS_BUILD_CMDS
        $(MAKE) -C $(@D)
endef

define EBF_LINUX_DTOVERLAYS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 755 $(@D)/config-pin $(TARGET_DIR)/usr/bin/config-pin
endef

define EBF_LINUX_DTOVERLAYS_INSTALL_IMAGES_CMDS
        mkdir -p $(BINARIES_DIR)/ebf-linux-dtoverlays
	cp $(@D)/output/*.dtbo $(BINARIES_DIR)/ebf-linux-dtoverlays
endef

$(eval $(generic-package))
