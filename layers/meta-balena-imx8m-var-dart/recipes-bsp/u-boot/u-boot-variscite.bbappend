UBOOT_KCONFIG_SUPPORT = "1"

inherit resin-u-boot

FILESEXTRAPATHS_append := ":${THISDIR}/files"

SRC_URI_append_imx8m-var-dart = " \
	file://imx8m-var-dart-integrate-balena.patch \
	file://0001-imx8m_var_dart.h-Set-ads7846-chipselect-before-imx_s.patch \
"

SRC_URI_append_imx8mm-var-dart = " \
        file://dart-mx8mm-Integrate-with-Balena-u-boot-environment.patch \
"
