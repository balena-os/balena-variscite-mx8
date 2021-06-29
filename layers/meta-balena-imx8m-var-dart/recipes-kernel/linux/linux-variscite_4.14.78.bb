# Copyright (C) 2013-2016 Freescale Semiconductor
# Copyright 2017 NXP
# Copyright 2018-2019 Variscite Ltd.
# Released under the MIT license (see COPYING.MIT for the terms)

SUMMARY = "Linux kernel provided and supported by Variscite"
DESCRIPTION = "Linux kernel provided and supported by Variscite (based on the kernel provided by NXP) \
with focus on i.MX Family SOMs. It includes support for many IPs such as GPU, VPU and IPU."

require recipes-kernel/linux/linux-imx.inc

FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

DEPENDS += "lzop-native bc-native"

DEFAULT_PREFERENCE = "1"

SRCBRANCH = "imx_4.14.78_1.0.0_ga_var01"
PV="4.14.78"
LOCALVERSION = "-${SRCBRANCH}"
KERNEL_DEFCONFIG = "${S}/arch/arm64/configs/imx8_var_defconfig"
DEFAULT_DTB = "sd-emmc-lvds"
DEFAULT_DTB_PREFIX = "fsl-imx8mq-var-dart"

KERNEL_SRC ?= "git://github.com/varigit/linux-imx;protocol=git"
SRC_URI = "${KERNEL_SRC};branch=${SRCBRANCH}"
SRCREV = "163651a6d455e77ce9359e306c2523810f74aff8"

S = "${WORKDIR}/git"

addtask copy_defconfig after do_unpack before do_preconfigure
do_copy_defconfig () {
    cp ${KERNEL_DEFCONFIG} ${WORKDIR}/defconfig
}

pkg_postinst_kernel-devicetree_append_imx8m-var-dart () {
    cd $D/boot
    ln -s ${DEFAULT_DTB_PREFIX}-${DEFAULT_DTB}.dtb ${UBOOT_DTB_NAME}
}

COMPATIBLE_MACHINE = "(imx8m-var-dart|imx8mm-var-dart)"
EXTRA_OEMAKE_append_mx8 = " ARCH=arm64"
