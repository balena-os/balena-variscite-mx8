inherit resin-u-boot

FILESEXTRAPATHS:append := ":${THISDIR}/files"

SRC_URI:append:imx8m-var-dart = " \
	file://dart-mx8mq-Integrate-with-Balena-u-boot-environment.patch \
"

SRC_URI:append:imx8mm-var-dart = " \
	file://imx8mm-var-dart-Integrate-with-Balena-u-boot-environment.patch \
"

SRC_URI:append:imx8mm-var-dart-plt = " \
	file://0001-Add-support-for-querying-boot-switch-position.patch \
	file://0002-bootcmd-Flash-only-if-bootswitch-in-EXT-position.patch \
	file://mx8mm-plt-turn-on-yellow-led-at-boot.patch \
"

SRC_URI:append:imx8mp-var-dart = " \
	file://imx8mp-var-dart_Integrate-with-balenaOS.patch \
"

# Fixes SPL crash with CRC32 checks PR in meta-balena.
# CRC32 checks on kernel image and fdt run fine with the above.
UBOOT_VARS:remove = "CONFIG_CMD_HASH"

