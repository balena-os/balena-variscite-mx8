FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"
FILESEXTRAPATHS_append := ":${THISDIR}/${PN}-5.4.85"

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

## TODO: Rebase identification led for mx8m
#file://0001-Add-identification-led.patch 

SRC_URI_append_imx8mm-var-dart = " \
	file://mx8mm-fsl-imx8mm-var-dart-Enable-SPIDEV_5.4.85.patch \
"

# nrt uses the 4.x kernel with realtime patches
SRC_URI_remove_imx8mm-var-dart-nrt = "file://mx8mm-fsl-imx8mm-var-dart-Enable-SPIDEV_5.4.85.patch"

SRC_URI_append_imx8mm-var-dart-nrt = " \
	file://0001-imx8mm-var-dart-nrt-pinmux.patch \
	file://0007-mmc-core-Disable-CQE.patch \
	file://0008-dts-fsl-imx8mm-var-dart-Disable-GPU.patch \
	file://0009-Port-RT-changes-4.19.31-rt18.patch \
	file://0010-fsl-imx8mm-var-dart-Update-pinmux-for-NRT-board.patch \
	file://0011-imx8mm-var-dart-nrt-Add-LP55231-to-the-device-tree.patch \
"

SRC_URI_append_imx8mm-var-dart-plt = " \
	file://0007-mmc-core-Disable-CQE.patch \
	file://imx8mm-var-dart-plt-Switch-usb1-dr_mode-to-host.patch \
	file://imx8mm-var-dart-plt-Disable-PCIe.patch \
	file://mx8mm-fsl-imx8mm-var-dart-Enable-SPIDEV_5.4.3.patch \
"

# already applies te 5.4.3 spidev patch
SRC_URI_remove_imx8mm-var-dart-plt = "file://mx8mm-fsl-imx8mm-var-dart-Enable-SPIDEV_5.4.85.patch"

BALENA_CONFIGS_append_imx8mm-var-dart-nrt = " preempt_rt"
BALENA_CONFIGS[preempt_rt] = " \
    CONFIG_PREEMPT_RT_FULL=y \
"

BALENA_CONFIGS_append_imx8mm-var-dart-nrt = " lp55231"
BALENA_CONFIGS[lp55231] = " \
    CONFIG_LEDS_LP5523=m \
"
