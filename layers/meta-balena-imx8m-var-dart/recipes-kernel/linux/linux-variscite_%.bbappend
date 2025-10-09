FILESEXTRAPATHS:append := ":${THISDIR}/${PN}"

inherit kernel-resin

# This fixes invalid package name
# error caused by SRCPV
LOCALVERSION = ""

# Disable commit SHA in kernel version string
SCMVERSION="n"

# sdma driver tries to load the firmware
# from initramfs causing bt to fail on plain mx8,
# doesn't harm having it as module on all variants
BALENA_CONFIGS:append = " imx-sdma"
BALENA_CONFIGS[imx-sdma] = " \
		CONFIG_IMX_SDMA=m \
"

BALENA_CONFIGS:append = " pps-client "
BALENA_CONFIGS[pps-client] = " \
    CONFIG_PPS_CLIENT_GPIO=m \
"

## TODO: Rebase identification led for mx8m
#file://0001-Add-identification-led.patch 

SRC_URI:append:imx8mm-var-dart = " \
	file://0001-Avoid-hang-at-boot-if-pcie-oscillator-not-present.patch \
	file://mx8mm-fsl-imx8mm-var-dart-Enable-SPIDEV_5.4.142.patch \
	file://0001-Enable-spidev0.0-on-kernel-5.10-for-iMX8M-Mini-VAR-S.patch \
"

# RT patch patch-5.4.82-rt46.patch taken from
# https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/5.4/older/
SRC_URI:append:imx8mm-var-dart-nrt = " \
	file://0001-Rebase-kernel-5.15.55-rt48-on-kernel-5.15.60-imx_var.patch \
	file://0007-mmc-core-Disable-CQE.patch \
	file://0008-dts-fsl-imx8mm-var-dart-Disable-GPU.patch \
	file://fsl-imx8mm-var-dart-Port-pinmux-for-NRT-board-to-ker.patch \
	file://fsl-imx8mm-var-dart-nrt-pinmux-legacy-nrt.patch \
	file://imx8mm-var-dart-nrt-Add-LP55231-to-the-device-tree.patch \
	file://imx8mm-var-dart-plt-Disable-PCIe.patch \
	file://0001-lp55xx-Add-support-for-default-startup-brightness-fr.patch \
	file://0001-lp55231-Don-t-reset-chip-during-initialization.patch \
	file://nrt-Add-CW2015-in-device-tree.patch \
	file://nrt-add-cw2015-profile-to-imx8mm-var-dart.dtsi.patch \
	file://0001-nrt-Fix-build-after-applying-realtime-patch.patch \
	file://0009-freescale-Remove-touch-controller-node-from-dts.patch \
"

SRC_URI:append:imx8mm-var-dart-plt = " \
	file://0007-mmc-core-Disable-CQE.patch \
	file://imx8mm-var-dart-plt-Switch-usb1-dr_mode-to-host.patch \
	file://imx8mm-var-dart-plt-Disable-PCIe.patch \
"


BALENA_CONFIGS:append = " optimize-size"
BALENA_CONFIGS[optimize-size] = " \
    CONFIG_CC_OPTIMIZE_FOR_SIZE=y \
"
