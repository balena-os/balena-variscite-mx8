UBOOT_KCONFIG_SUPPORT = "1"

inherit resin-u-boot

FILESEXTRAPATHS_append := ":${THISDIR}/files"

# meta-balena patch does not apply cleanly, so we refactor it
SRC_URI_remove = " file://resin-specific-env-integration-kconfig.patch "
SRC_URI_append = " file://local-resin-specific-env-integration-kconfig.patch "

SRC_URI_append_imx8m-var-dart = " \
	file://dart-mx8mq-Integrate-with-Balena-u-boot-environment.patch \ 
"

SRC_URI_append_imx8mm-var-dart = " \
	file://dart-mx8mm-Integrate-with-Balena-u-boot-environment.patch \
"

SRC_URI_append_imx8mm-var-dart-plt = " \
	file://0001-Add-support-for-querying-boot-switch-position.patch \
	file://0002-bootcmd-Flash-only-if-bootswitch-in-EXT-position.patch \
	file://imx8mm-var-dart-Enable-I2C.patch \
	file://mx8mm-plt-enable-i2c4-uboot.patch \
	file://mx8mm-plt-turn-on-yellow-led-at-boot.patch \
	file://mx8mm-var-dart-plt-set-dram-2g.patch \
"

SRC_URI_append_imx8mm-var-dart-nrt = " \
	file://mx8mm-nrt-Enable-M4-run-from-TCM.patch \
"
