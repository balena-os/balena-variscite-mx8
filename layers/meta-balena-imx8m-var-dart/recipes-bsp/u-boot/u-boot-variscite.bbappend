UBOOT_KCONFIG_SUPPORT = "1"

inherit resin-u-boot

FILESEXTRAPATHS_append := ":${THISDIR}/files"

LICENSE = "GPLv2+"
LIC_FILES_CHKSUM = "file://Licenses/gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
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
	file://plt-Always-load-the-legacy-dtb.patch \
	file://Use-old-device-tree-on-altboot.patch \
"

SRC_URI_append_imx8mm-var-dart-nrt = " \
	file://imx8mm-var-dart-nrt-Enable-I2C-in-console.patch \
	file://imx8mm-var-dart-nrt-Add-led-start-routine-for-NRT.patch \
"

SRC_URI_append_imx8mm-var-dart-nrt = "${@bb.utils.contains('DISTRO_FEATURES', 'development-image', '', 'file://imx8mm-var-dart-nrt-uart-workaround.patch', d)}"

# The device-tree on NRT still has the old name
# that doesn't include "customboard-legacy". This is available
# for all custom hw since they use kernel versions older than 5.4.85
SRC_URI_append_imx8mm-var-dart-nrt = " \
	file://0003-imx8mm-var-dart-plt-Switch-dtb-name-for-kernel-5.4.3.patch \
"

OS_KERNEL_CMDLINE_remove_imx8mm-var-dart-nrt = "console=null"

