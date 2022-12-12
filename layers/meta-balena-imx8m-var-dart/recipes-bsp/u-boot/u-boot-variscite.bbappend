inherit resin-u-boot

FILESEXTRAPATHS:append := ":${THISDIR}/files"

LICENSE = "GPLv2+"
LIC_FILES_CHKSUM = "file://Licenses/gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"

SRC_URI:append:imx8m-var-dart = " \
	file://dart-mx8mq-Integrate-with-Balena-u-boot-environment.patch \
	file://imx8m_var_dart-Use-custom_fdt_file-if-defined.patch \
"

SRC_URI:append:imx8mm-var-dart = " \
	file://dart-mx8mm-Integrate-with-Balena-u-boot-environment.patch \
"

SRC_URI:append:imx8mm-var-dart-plt = " \
	file://0001-Add-support-for-querying-boot-switch-position.patch \
	file://0002-bootcmd-Flash-only-if-bootswitch-in-EXT-position.patch \
	file://mx8mm-plt-turn-on-yellow-led-at-boot.patch \
	file://plt-Always-load-the-legacy-dtb.patch \
	file://Use-old-device-tree-on-altboot.patch \
	file://0009-mx8mm_var_dart-plt-Use-custom_fdt_file-if-defined.patch \
	file://plt-Run-CRC32-checks.patch \
"

SRC_URI:append:imx8mm-var-dart-nrt = " \
	file://imx8mm-var-dart-nrt-Add-led-start-routine-for-NRT.patch \
	file://nrt-Always-load-the-legacy-dtb.patch \
	file://nrt-Run-CRC32-checks.patch \
"

# Fixes SPL crash with CRC32 checks PR in meta-balena.
# CRC32 checks on kernel image and fdt run fine with the above.
UBOOT_VARS:remove = "CONFIG_CMD_HASH"

SRC_URI:append:imx8mm-var-dart-nrt = "${@bb.utils.contains('DISTRO_FEATURES', 'development-image', '', 'file://imx8mm-var-dart-nrt-uart-workaround.patch', d)}"

OS_KERNEL_CMDLINE:remove:imx8mm-var-dart-nrt = "console=null"

