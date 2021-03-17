# Copyright 2017-2018 NXP

# NOTE: This recipe is used only for the
# imx8m-var-dart, which is pinned to
# kernel version 4.14.78

DESCRIPTION = "Generate Boot Loader for i.MX8 device"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
SECTION = "BSP"

IMX_MKIMAGE_SRC_imx8m-var-dart ?= "git://source.codeaurora.org/external/imx/imx-mkimage.git;protocol=https"
SRCBRANCH_imx8m-var-dart = "imx_4.14.98_2.0.0_ga"
SRC_URI = "${IMX_MKIMAGE_SRC};branch=${SRCBRANCH}"
SRCREV_imx8m-var-dart = "dd0234001713623c79be92b60fa88bc07b07f24f"

DEPENDS = "zlib-native openssl-native"

DESCRIPTION = "i.MX make image"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
SECTION = "BSP"

inherit deploy

# Add CFLAGS with native INCDIR & LIBDIR for imx-mkimage build
CFLAGS = "-O2 -Wall -std=c99 -I ${STAGING_INCDIR_NATIVE} -L ${STAGING_LIBDIR_NATIVE}"

BOOT_TOOLS = "imx-boot-tools"
BOOT_NAME = "imx-boot"
PROVIDES = "${BOOT_NAME}"

IMX_FIRMWARE = "firmware-imx imx-sc-firmware"
IMX_FIRMWARE_mx8m = "firmware-imx"
DEPENDS += " \
    u-boot \
    ${IMX_FIRMWARE} \
    imx-atf \
    ${@bb.utils.contains('COMBINED_FEATURES', 'optee', 'optee-os-imx', '', d)} \
"
DEPENDS_append_mx8m = " dtc-native"

# For i.MX 8, this package aggregates the imx-m4-demos
# output. Note that this aggregation replaces the aggregation
# that would otherwise be done in the image build as controlled
# by IMAGE_BOOTFILES_DEPENDS and IMAGE_BOOTFILES in image_types_fsl.bbclass
IMX_M4_DEMOS        = ""
IMX_M4_DEMOS_mx8qm  = "imx-m4-demos:do_deploy"
IMX_M4_DEMOS_mx8qxp = "imx-m4-demos:do_deploy"

# This package aggregates output deployed by other packages,
# so set the appropriate dependencies
do_compile[depends] += " \
    virtual/bootloader:do_deploy \
    ${@' '.join('%s:do_deploy' % r for r in '${IMX_FIRMWARE}'.split() )} \
    imx-atf:do_deploy \
    ${IMX_M4_DEMOS} \
    ${@bb.utils.contains('COMBINED_FEATURES', 'optee', 'optee-os-imx:do_deploy', '', d)} \
"

SC_FIRMWARE_NAME ?= "scfw_tcm.bin"

ATF_MACHINE_NAME ?= "bl31-imx8qm.bin"
ATF_MACHINE_NAME_mx8qm = "bl31-imx8qm.bin"
ATF_MACHINE_NAME_mx8qxp = "bl31-imx8qx.bin"
ATF_MACHINE_NAME_mx8mq = "bl31-imx8mq.bin"
ATF_MACHINE_NAME_mx8mm = "bl31-imx8mm.bin"
ATF_MACHINE_NAME_append = "${@bb.utils.contains('COMBINED_FEATURES', 'optee', '-optee', '', d)}"

DCD_NAME ?= "imx8qm_dcd.cfg.tmp"
DCD_NAME_mx8qm = "imx8qm_dcd.cfg.tmp"
DCD_NAME_mx8qxp = "imx8qx_dcd.cfg.tmp"

UBOOT_NAME = "u-boot-${MACHINE}.bin-${UBOOT_CONFIG}"
BOOT_CONFIG_MACHINE = "${BOOT_NAME}-${MACHINE}-${UBOOT_CONFIG}.bin"

TOOLS_NAME ?= "mkimage_imx8"

SOC_TARGET ?= "iMX8QM"
SOC_TARGET_mx8qm  = "iMX8QM"
SOC_TARGET_mx8qxp = "iMX8QX"
SOC_TARGET_mx8mq  = "iMX8M"
SOC_TARGET_mx8mm  = "iMX8MM"

SOC_DIR ?= "${SOC_TARGET}"
SOC_DIR_mx8m = "iMX8M"

DEPLOY_OPTEE = "${@bb.utils.contains('COMBINED_FEATURES', 'optee', 'true', 'false', d)}"

IMXBOOT_TARGETS ?= "${@bb.utils.contains('UBOOT_CONFIG', 'fspi', 'flash_flexspi', \
                       bb.utils.contains('UBOOT_CONFIG', 'nand', 'flash_nand', \
                                                                 'flash_multi_cores flash_dcd', d), d)}"

S = "${WORKDIR}/git"

do_compile () {
    if [ "${SOC_TARGET}" = "iMX8M" -o "${SOC_TARGET}" = "iMX8MM" ]; then
        echo 8MQ/8MM boot binary build
        SOC_DIR="iMX8M"
        for ddr_firmware in ${DDR_FIRMWARE_NAME}; do
            echo "Copy ddr_firmware: ${ddr_firmware} from ${DEPLOY_DIR_IMAGE} -> ${S}/${SOC_DIR} "
            cp ${DEPLOY_DIR_IMAGE}/${ddr_firmware}               ${S}/${SOC_DIR}/
        done
        cp ${DEPLOY_DIR_IMAGE}/signed_*_imx8m.bin             ${S}/${SOC_DIR}/
        cp ${DEPLOY_DIR_IMAGE}/u-boot-spl.bin-${MACHINE}-${UBOOT_CONFIG} ${S}/${SOC_DIR}/u-boot-spl.bin
        cp ${DEPLOY_DIR_IMAGE}/${BOOT_TOOLS}/${UBOOT_DTB_NAME}   ${S}/${SOC_DIR}/
        cp ${DEPLOY_DIR_IMAGE}/${BOOT_TOOLS}/u-boot-nodtb.bin-${MACHINE}-${UBOOT_CONFIG}    ${S}/${SOC_DIR}/u-boot-nodtb.bin
        cp ${DEPLOY_DIR_IMAGE}/${BOOT_TOOLS}/mkimage_uboot       ${S}/${SOC_DIR}/

        cp ${DEPLOY_DIR_IMAGE}/${BOOT_TOOLS}/${ATF_MACHINE_NAME} ${S}/${SOC_DIR}/bl31.bin
        cp ${DEPLOY_DIR_IMAGE}/${UBOOT_NAME}                     ${S}/${SOC_DIR}/u-boot.bin

    elif [ "${SOC_TARGET}" = "iMX8QM" ]; then
        echo 8QM boot binary build
        cp ${DEPLOY_DIR_IMAGE}/${BOOT_TOOLS}/${SC_FIRMWARE_NAME} ${S}/${SOC_DIR}/scfw_tcm.bin
        cp ${DEPLOY_DIR_IMAGE}/${BOOT_TOOLS}/${ATF_MACHINE_NAME} ${S}/${SOC_DIR}/bl31.bin
        cp ${DEPLOY_DIR_IMAGE}/${UBOOT_NAME}                     ${S}/${SOC_DIR}/u-boot.bin
        if ${DEPLOY_OPTEE}; then
            cp ${DEPLOY_DIR_IMAGE}/u-boot-spl.bin-${MACHINE}-${UBOOT_CONFIG} ${S}/${SOC_DIR}/u-boot-spl.bin
        fi

        cp ${DEPLOY_DIR_IMAGE}/imx8qm_m4_0_TCM_rpmsg_lite_pingpong_rtos_linux_remote_m40.bin ${S}/${SOC_DIR}/m40_tcm.bin
        cp ${DEPLOY_DIR_IMAGE}/imx8qm_m4_1_TCM_rpmsg_lite_pingpong_rtos_linux_remote_m41.bin ${S}/${SOC_DIR}/m41_tcm.bin
        cp ${DEPLOY_DIR_IMAGE}/imx8qm_m4_0_TCM_rpmsg_lite_pingpong_rtos_linux_remote_m40.bin ${S}/${SOC_DIR}/m4_image.bin
        cp ${DEPLOY_DIR_IMAGE}/imx8qm_m4_1_TCM_rpmsg_lite_pingpong_rtos_linux_remote_m41.bin ${S}/${SOC_DIR}/m4_1_image.bin

        cp ${DEPLOY_DIR_IMAGE}/mx8qm-ahab-container.img ${S}/${SOC_DIR}/

    else
        echo 8QX boot binary build
        cp ${DEPLOY_DIR_IMAGE}/imx8qx_m4_TCM_srtm_demo.bin ${S}/${SOC_DIR}/m40_tcm.bin
        cp ${DEPLOY_DIR_IMAGE}/imx8qx_m4_TCM_srtm_demo.bin ${S}/${SOC_DIR}/m4_image.bin
        cp ${DEPLOY_DIR_IMAGE}/mx8qx-ahab-container.img ${S}/${SOC_DIR}/
        cp ${DEPLOY_DIR_IMAGE}/${BOOT_TOOLS}/${SC_FIRMWARE_NAME} ${S}/${SOC_DIR}/scfw_tcm.bin
        cp ${DEPLOY_DIR_IMAGE}/${BOOT_TOOLS}/${ATF_MACHINE_NAME} ${S}/${SOC_DIR}/bl31.bin
        cp ${DEPLOY_DIR_IMAGE}/${UBOOT_NAME}                     ${S}/${SOC_DIR}/u-boot.bin
        if ${DEPLOY_OPTEE}; then
            cp ${DEPLOY_DIR_IMAGE}/u-boot-spl.bin-${MACHINE}-${UBOOT_CONFIG} ${S}/${SOC_DIR}/u-boot-spl.bin
        fi
    fi

    # Copy TEE binary to SoC target folder to mkimage
    if ${DEPLOY_OPTEE}; then
        cp ${DEPLOY_DIR_IMAGE}/tee.bin             ${S}/${SOC_DIR}/
    fi

    # mkimage for i.MX8
    for target in ${IMXBOOT_TARGETS}; do
        echo "building ${SOC_TARGET} - ${target}"
        make SOC=${SOC_TARGET} ${target}
        if [ -e "${S}/${SOC_DIR}/flash.bin" ]; then
            cp ${S}/${SOC_DIR}/flash.bin ${S}/${BOOT_CONFIG_MACHINE}-${target}
        fi
    done
}

SYSROOT_DIRS += "/boot"

do_install () {
    install -d ${D}/boot
    for target in ${IMXBOOT_TARGETS}; do
        install -m 0644 ${S}/${BOOT_CONFIG_MACHINE}-${target} ${D}/boot/
    done
}

DEPLOYDIR_IMXBOOT = "${BOOT_TOOLS}"
do_deploy () {
    install -d ${DEPLOYDIR}/${DEPLOYDIR_IMXBOOT}

    # copy the tool mkimage to deploy path and sc fw, dcd and uboot
    install -m 0644 ${DEPLOY_DIR_IMAGE}/${UBOOT_NAME} ${DEPLOYDIR}/${DEPLOYDIR_IMXBOOT}
    if [ "${SOC_TARGET}" = "iMX8M" -o "${SOC_TARGET}" = "iMX8MM" ]; then
        SOC_DIR="iMX8M"
        install -m 0644 ${DEPLOY_DIR_IMAGE}/u-boot-spl.bin-${MACHINE}-${UBOOT_CONFIG} ${DEPLOYDIR}/${DEPLOYDIR_IMXBOOT}
        for ddr_firmware in ${DDR_FIRMWARE_NAME}; do
            install -m 0644 ${DEPLOY_DIR_IMAGE}/${ddr_firmware} ${DEPLOYDIR}/${DEPLOYDIR_IMXBOOT}
        done
        install -m 0644 ${DEPLOY_DIR_IMAGE}/signed_*_imx8m.bin ${DEPLOYDIR}/${DEPLOYDIR_IMXBOOT}

        install -m 0755 ${S}/${SOC_DIR}/${TOOLS_NAME} ${DEPLOYDIR}/${DEPLOYDIR_IMXBOOT}

        install -m 0755 ${S}/${SOC_DIR}/mkimage_fit_atf.sh ${DEPLOYDIR}/${DEPLOYDIR_IMXBOOT}
    elif [ "${SOC_TARGET}" = "iMX8QM" ]; then
        if [ "${MACHINE}" = "imx8qma0mek" ]; then
            install -m 0644 ${S}/${SOC_DIR}/${DCD_NAME} ${DEPLOYDIR}/${DEPLOYDIR_IMXBOOT}
        fi
        install -m 0644 ${S}/${SOC_DIR}/mx8qm-ahab-container.img ${DEPLOYDIR}/${DEPLOYDIR_IMXBOOT}
        install -m 0644 ${S}/${SOC_DIR}/m40_tcm.bin ${DEPLOYDIR}/${DEPLOYDIR_IMXBOOT}
        install -m 0644 ${S}/${SOC_DIR}/m41_tcm.bin ${DEPLOYDIR}/${DEPLOYDIR_IMXBOOT}
        install -m 0644 ${S}/${SOC_DIR}/m4_image.bin ${DEPLOYDIR}/${DEPLOYDIR_IMXBOOT}
        install -m 0644 ${S}/${SOC_DIR}/m4_1_image.bin ${DEPLOYDIR}/${DEPLOYDIR_IMXBOOT}

        install -m 0755 ${S}/${TOOLS_NAME} ${DEPLOYDIR}/${BOOT_TOOLS}
        if ${DEPLOY_OPTEE}; then
            install -m 0644 ${DEPLOY_DIR_IMAGE}/u-boot-spl.bin-${MACHINE}-${UBOOT_CONFIG} ${DEPLOYDIR}/${DEPLOYDIR_IMXBOOT}
        fi
    else
        install -m 0644 ${S}/${SOC_DIR}/mx8qx-ahab-container.img ${DEPLOYDIR}/${DEPLOYDIR_IMXBOOT}
        install -m 0644 ${S}/${SOC_DIR}/m40_tcm.bin ${DEPLOYDIR}/${DEPLOYDIR_IMXBOOT}
        install -m 0644 ${S}/${SOC_DIR}/m4_image.bin ${DEPLOYDIR}/${DEPLOYDIR_IMXBOOT}

        install -m 0755 ${S}/${TOOLS_NAME} ${DEPLOYDIR}/${BOOT_TOOLS}
        if ${DEPLOY_OPTEE}; then
            install -m 0644 ${DEPLOY_DIR_IMAGE}/u-boot-spl.bin-${MACHINE}-${UBOOT_CONFIG} ${DEPLOYDIR}/${DEPLOYDIR_IMXBOOT}
        fi
    fi

    # copy tee.bin to deploy path
    if "${DEPLOY_OPTEE}"; then
        install -m 0644 ${DEPLOY_DIR_IMAGE}/tee.bin ${DEPLOYDIR}/${DEPLOYDIR_IMXBOOT}
    fi

    # copy makefile (soc.mak) for reference
    install -m 0644 ${S}/${SOC_DIR}/soc.mak     ${DEPLOYDIR}/${DEPLOYDIR_IMXBOOT}

    # copy the generated boot image to deploy path
    for target in ${IMXBOOT_TARGETS}; do
        # Use first "target" as IMAGE_IMXBOOT_TARGET
        if [ "$IMAGE_IMXBOOT_TARGET" = "" ]; then
            IMAGE_IMXBOOT_TARGET="$target"
            echo "Set boot target as $IMAGE_IMXBOOT_TARGET"
        fi
        install -m 0644 ${S}/${BOOT_CONFIG_MACHINE}-${target} ${DEPLOYDIR}
    done
    cd ${DEPLOYDIR}
    ln -sf ${BOOT_CONFIG_MACHINE}-${IMAGE_IMXBOOT_TARGET} ${BOOT_CONFIG_MACHINE}
    cd -
}

addtask deploy before do_build after do_compile

FILES_${PN} = "/boot"

COMPATIBLE_MACHINE = "imx8m-var-dart"
PACKAGE_ARCH = "${MACHINE_ARCH}"
