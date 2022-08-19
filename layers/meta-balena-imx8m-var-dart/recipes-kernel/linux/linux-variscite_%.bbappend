FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"
FILESEXTRAPATHS_append := ":${THISDIR}/${PN}-5.4.142"

inherit kernel-resin

PV="5.4.142"

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
	file://mx8mm-fsl-imx8mm-var-dart-Enable-SPIDEV_5.4.142.patch \
	file://0001-imx8mm-test-avoid-pci-hang-no-oscillator.patch \
"

# RT patch patch-5.4.82-rt46.patch taken from
# https://mirrors.edge.kernel.org/pub/linux/kernel/projects/rt/5.4/older/
SRC_URI_append_imx8mm-var-dart-nrt = " \
	file://0001-Apply-kernel-5.4.143-rt64.patch \
	file://0007-mmc-core-Disable-CQE.patch \
	file://0008-dts-fsl-imx8mm-var-dart-Disable-GPU.patch \
	file://fsl-imx8mm-var-dart-nrt-Port-pinmux-for-NRT-board-to-ker-5-4-142.patch \
	file://fsl-imx8mm-var-dart-nrt-pinmux-legacy-nrt.patch \
	file://imx8mm-var-dart-nrt-Add-LP55231-to-the-device-tree.patch \
	file://imx8mm-var-dart-plt-Disable-PCIe.patch \
	file://0001-lp55xx-Add-support-for-default-startup-brightness-fr.patch \
	file://0001-lp55231-Don-t-reset-chip-during-initialization.patch \
	file://nrt-drivers-backport-cw2015-battery-driver.patch \
	file://nrt-cw2015-fix-build-for-nrt.patch \
	file://nrt-Add-CW2015-in-device-tree.patch \
"

SRC_URI_append_imx8mm-var-dart-plt = " \
	file://0007-mmc-core-Disable-CQE.patch \
	file://imx8mm-var-dart-plt-Switch-usb1-dr_mode-to-host.patch \
	file://imx8mm-var-dart-plt-Disable-PCIe.patch \
"

BALENA_CONFIGS_append_imx8mm-var-dart-nrt = " preempt_rt"
BALENA_CONFIGS[preempt_rt] = " \
    CONFIG_ARCH_SUPPORTS_RT=y \
    CONFIG_EXPERT=y \
    CONFIG_PREEMPT_RT=y \
"

BALENA_CONFIGS_append_imx8mm-var-dart-nrt = " cw2015"
BALENA_CONFIGS[cw2015] = " \
    CONFIG_BATTERY_CW2015=m \
"

BALENA_CONFIGS_append_imx8mm-var-dart-nrt = " lp55231"
BALENA_CONFIGS[lp55231] = " \
    CONFIG_LEDS_LP5523=m \
"
