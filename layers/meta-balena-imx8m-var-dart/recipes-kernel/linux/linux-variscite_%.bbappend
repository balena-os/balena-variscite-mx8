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

# RT patch patch-5.4.82-rt46.patch taken from
# https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/5.4/older/
SRC_URI_append_imx8mm-var-dart-nrt = " \
	file://patch-5.4.82-rt46.patch \
	file://0007-mmc-core-Disable-CQE.patch \
	file://0008-dts-fsl-imx8mm-var-dart-Disable-GPU.patch \
	file://fsl-imx8mm-var-dart-nrt-Port-pinmux-for-NRT-board-to-ker-5-4-85.patch \
	file://fsl-imx8mm-var-dart-nrt-pinmux-legacy-nrt.patch \
"

SRC_URI_append_imx8mm-var-dart-plt = " \
	file://0007-mmc-core-Disable-CQE.patch \
	file://imx8mm-var-dart-plt-Switch-usb1-dr_mode-to-host.patch \
	file://imx8mm-var-dart-plt-Disable-PCIe.patch \
	file://mx8mm-fsl-imx8mm-var-dart-Enable-SPIDEV_5.4.85.patch \
"

# already applies te 5.4.3 spidev patch
SRC_URI_remove_imx8mm-var-dart-plt = "file://mx8mm-fsl-imx8mm-var-dart-Enable-SPIDEV_5.4.85.patch"

BALENA_CONFIGS_append_imx8mm-var-dart-nrt = " preempt_rt"
BALENA_CONFIGS[preempt_rt] = " \
    CONFIG_ARCH_SUPPORTS_RT=y \
    CONFIG_EXPERT=y \
    CONFIG_PREEMPT_RT=y \
"
