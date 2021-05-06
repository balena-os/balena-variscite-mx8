FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

inherit kernel-resin

# This fixes invalid package name
# error caused by SRCPV
LOCALVERSION = ""

# Disable commit SHA in kernel version string
SCMVERSION="n"

# sdma driver tries to load the firmware
# from initramfs causing bt to fail on plain mx8,
# doesn't harm having it as module on all variants
BALENA_CONFIGS_append = " imx-sdma"
BALENA_CONFIGS[imx-sdma] = " \
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
	file://0010-fsl-imx8mm-var-dart-Update-pinmux-for-NRT-board.patch \
"

SRC_URI_append_imx8mm-var-dart-plt = " \
	file://0007-mmc-core-Disable-CQE.patch \
	file://0001-disable-gigabit.patch \
	file://imx8mm-var-dart-plt-Switch-usb1-dr_mode-to-host.patch \
	file://imx8mm-var-dart-plt-Disable-PCIe.patch \
	file://mx8mm-fsl-imx8mm-var-dart-Enable-SPIDEV_5.4.3.patch \
"

BALENA_CONFIGS_append_imx8mm-var-dart-nrt = " preempt_rt"
BALENA_CONFIGS[preempt_rt] = " \
    CONFIG_PREEMPT_RT_FULL=y \
"
