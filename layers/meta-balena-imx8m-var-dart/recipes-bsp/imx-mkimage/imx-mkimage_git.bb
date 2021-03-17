# Copyright (C) 2016 Freescale Semiconductor
# Copyright 2017 NXP

# NOTE: This recipe is used only for the
# imx8m-var-dart, which is pinned to
# kernel version 4.14.78

IMX_MKIMAGE_SRC_imx8m-var-dart ?= "git://source.codeaurora.org/external/imx/imx-mkimage.git;protocol=https"
SRCBRANCH_imx8m-var-dart = "imx_4.14.98_2.0.0_ga"
SRC_URI = "${IMX_MKIMAGE_SRC};branch=${SRCBRANCH}"
SRCREV_imx8m-var-dart = "dd0234001713623c79be92b60fa88bc07b07f24f"

DEPENDS = "zlib-native openssl-native"

DESCRIPTION = "i.MX make image"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
SECTION = "BSP"

inherit native deploy

S = "${WORKDIR}/git"

CFLAGS = "-O2 -Wall -std=c99 -I ${STAGING_INCDIR} -L ${STAGING_LIBDIR}"

do_compile () {
    cd ${S}
    oe_runmake clean
    oe_runmake bin

    oe_runmake -C iMX8M -f soc.mak mkimage_imx8

    oe_runmake -C iMX8QM -f soc.mak imx8qm_dcd.cfg.tmp
    oe_runmake -C iMX8QX -f soc.mak imx8qx_dcd.cfg.tmp
}

BOOT_TOOLS = "imx-boot-tools"
SYSROOT_DIRS += "/boot"

do_install () {
    cd ${S}
    install -d ${D}${bindir}
    install -m 0755 iMX8M/mkimage_imx8 ${D}${bindir}/mkimage_imx8m
    install -m 0755 mkimage_imx8 ${D}${bindir}/mkimage_imx8
}

do_deploy () {
    install -m 0644 ${S}/iMX8QM/imx8qm_dcd.cfg.tmp ${DEPLOYDIR}
    install -m 0644 ${S}/iMX8QX/imx8qx_dcd.cfg.tmp ${DEPLOYDIR}
}

addtask deploy before do_build after do_install

COMPATIBLE_MACHINE="imx8m-var-dart"
