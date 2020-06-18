UBOOT_KCONFIG_SUPPORT = "1"

inherit resin-u-boot

FILESEXTRAPATHS_append := ":${THISDIR}/files"

SRC_URI_append_imx8m-var-dart = " \
	file://dart-mx8mq-Integrate-with-Balena-u-boot-environment.patch \ 
"

SRC_URI_append_imx8mm-var-dart = " \
	file://dart-mx8mm-Integrate-with-Balena-u-boot-environment.patch \
"

SRC_URI_append_imx8mm-var-dart-plt = " \
	file://0001-Add-support-for-querying-boot-switch-position.patch \
	file://0002-bootcmd-Flash-only-if-bootswitch-in-EXT-position.patch \
"

SRC_URI_append_imx8mm-var-dart-nrt = " \
	file://mx8mm-nrt-Enable-M4-run-from-DDR.patch \
"
