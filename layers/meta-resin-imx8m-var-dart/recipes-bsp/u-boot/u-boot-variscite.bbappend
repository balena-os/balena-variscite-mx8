UBOOT_KCONFIG_SUPPORT = "1"

inherit resin-u-boot

FILESEXTRAPATHS_append := ":${THISDIR}/files"

SRC_URI_append_imx8m-var-dart = " \
	file://imx8m-var-dart-integrate-balena.patch \
"
