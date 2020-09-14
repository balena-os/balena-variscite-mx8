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

# For plain imx8m-var-dart we'll stay at kernel 4.14.78
# because there's no ubuntu release for 4.14.98, and
# we want to preserve compatiblity for GPU access from container
SRC_URI_append_imx8m-var-dart = " \
        file://0001-vivante-gpu-revert-to-6.2.4.p1-driver.patch \
	file://0001-Add-identification-led.patch \
	file://0001-fsl-imx8mq-var-dart-common.dtsi-Add-spidev-support.patch \
"

SRC_URI_append_imx8mm-var-dart = " \
	file://mx8mm-fsl-imx8mm-var-dart-Enable-SPIDEV.patch \
"

# we disable the SPI patch until the customer tells us otherwise
SRC_URI_remove_imx8mm-var-dart-plt = "file://mx8mm-fsl-imx8mm-var-dart-Enable-SPIDEV.patch"

SRC_URI_append_imx8mm-var-dart-nrt = " \
	file://0001-imx8mm-var-dart-nrt-pinmux.patch \
	file://0007-mmc-core-Disable-CQE.patch \
	file://0008-dts-fsl-imx8mm-var-dart-Disable-GPU.patch \
	file://0009-Port-RT-changes-4.19.31-rt18.patch \
"

SRC_URI_append_imx8mm-var-dart-plt = " \
	file://0007-mmc-core-Disable-CQE.patch \
	file://0001-test.patch \
"

RESIN_CONFIGS_append_imx8mm-var-dart-nrt = " preempt_rt"
RESIN_CONFIGS[preempt_rt] = " \
    CONFIG_PREEMPT_RT_FULL=y \
"
