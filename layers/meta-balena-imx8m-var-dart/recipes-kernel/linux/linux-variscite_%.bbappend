FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

inherit kernel-resin

# This fixes invalid package name
# error caused by SRCPV
LOCALVERSION = ""

# sdma driver tries to load the firmware
# from initramfs causing bt to fail on plain mx8,
# doesn't harm having it as module on all variants
RESIN_CONFIGS_append = " imx-sdma"
RESIN_CONFIGS[imx-sdma] = " \
		CONFIG_IMX_SDMA=m \
"

# Leave aside 0001-vivante-gpu-revert-to-6.2.4.p1-driver.patch
# for the plain imx8m until we can test if it's still needed
# with the new 4.14.98 kernel
SRC_URI_append_imx8m-var-dart = " \
	file://0001-Add-identification-led.patch \
	file://0001-fsl-imx8mq-var-dart-common.dtsi-Add-spidev-support.patch \
"

SRC_URI_append = " \
	file://0002-NFLX-2019-001-SACK-Panic.patch \
	file://0003-NFLX-2019-001-SACK-Panic-for-lteq-4.14.patch \
	file://0004-NFLX-2019-001-SACK-Slowness.patch \
	file://0005-NFLX-2019-001-Resour-Consump-Low-MSS.patch \
	file://0006-NFLX-2019-001-Resour-Consump-Low-MSS.patch \
"

SRC_URI_append_imx8mm-var-dart = " \
	file://mx8mm-fsl-imx8mm-var-dart-Enable-SPIDEV.patch \
"
