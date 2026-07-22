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
	file://imx8mm-var-dart-dt8mcustomboard_p1atlas-pps-v1.dts \
	file://imx8mm-var-dart-dt8mcustomboard-legacy_p1atlas-pps-v1.dts \
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

# Remove non-i.MX8M Silicon Architectures
BALENA_CONFIGS:append = " strip-other-socs"
BALENA_CONFIGS[strip-other-socs] = " \
    CONFIG_ARCH_LAYERSCAPE=n \
    CONFIG_ARCH_KEEMBAY=n \
    CONFIG_ARCH_S32=n \
    CONFIG_SOC_S32V234=n \
    CONFIG_ARCH_S32_CLK=n \
"

# Remove NUMA for iMX8MQ modules
BALENA_CONFIGS:append:imx8mq-var-dart = " numa"
BALENA_CONFIGS[numa] = " \
    CONFIG_NUMA=n \
"

# Strips non-existent hardware drivers and Xen (which requires them to function)
BALENA_CONFIGS:append:imx8mq-var-dart = " iommu-smmu"
BALENA_CONFIGS[iommu-smmu] = " \
    CONFIG_ARM_SMMU=n \
    CONFIG_ARM_SMMU_V3=n \
    CONFIG_IOMMU_IO_PGTABLE=n \
    CONFIG_IOMMU_IO_PGTABLE_LPAE=n \
    CONFIG_XEN=n \
"

# Removes common clock routing trees compiled for alternative family chips (Plus, Nano, etc.)
BALENA_CONFIGS:append:imx8mq-var-dart = " alternative-clocks"
BALENA_CONFIGS[alternative-clocks] = " \
    CONFIG_CLK_IMX8MN=n \
    CONFIG_CLK_IMX8MP=n \
    CONFIG_CLK_IMX8MM=n \
    CONFIG_CLK_IMX8QXP=n \
    CONFIG_CLK_IMX8ULP=n \
"

# Eliminates alternative video processing engines; the i.MX8MQ exclusively supports the Hantro VPU
BALENA_CONFIGS:append:imx8mq-var-dart = " multimedia-vpu"
BALENA_CONFIGS[multimedia-vpu] = " \
    CONFIG_MXC_VPU_MALONE=n \
    CONFIG_MXC_VPU_WINDSOR=n \
"

do_configure:append:imx8mm-var-dart() {
    cp ${WORKDIR}/imx8mm-var-dart-dt8mcustomboard_p1atlas-pps-v1.dts ${S}/arch/arm64/boot/dts/freescale/
    cp ${WORKDIR}/imx8mm-var-dart-dt8mcustomboard-legacy_p1atlas-pps-v1.dts ${S}/arch/arm64/boot/dts/freescale/
}

