UBOOT_KCONFIG_SUPPORT = "1"

inherit resin-u-boot

FILESEXTRAPATHS_append := ":${THISDIR}/files"

SRC_URI_append_imx8m-var-dart = " \
	file://dart-mx8mq-Integrate-with-Balena-u-boot-environment.patch \ 
"

SRC_URI_append_imx8mm-var-dart = " \
        file://dart-mx8mm-Integrate-with-Balena-u-boot-environment.patch \
"
