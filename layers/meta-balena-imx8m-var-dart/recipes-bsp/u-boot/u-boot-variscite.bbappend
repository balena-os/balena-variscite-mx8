UBOOT_KCONFIG_SUPPORT = "1"

inherit resin-u-boot

FILESEXTRAPATHS_append := ":${THISDIR}/files"

LICENSE = "GPLv2+"
LIC_FILES_CHKSUM = "file://Licenses/gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"

SRCBRANCH_imx8m-var-dart = "imx_v2018.03_4.14.98_2.0.0_ga_var01"
SRCREV_imx8m-var-dart = "6751d25fb2cb6a90dc7e261f8d789be040c1b0cb"


# meta-balena patch does not apply cleanly, so we refactor it
SRC_URI_remove_imx8mm-var-dart = " file://resin-specific-env-integration-kconfig.patch "
SRC_URI_append_imx8mm-var-dart = " file://local-resin-specific-env-integration-kconfig.patch "

SRC_URI_append_imx8m-var-dart = " \
	file://dart-mx8mq-Integrate-with-Balena-u-boot-environment.patch \ 
"

SRC_URI_append_imx8mm-var-dart = " \
	file://dart-mx8mm-Integrate-with-Balena-u-boot-environment.patch \
"

SRC_URI_append_imx8mm-var-dart-plt = " \
	file://0001-Add-support-for-querying-boot-switch-position.patch \
	file://0002-bootcmd-Flash-only-if-bootswitch-in-EXT-position.patch \
	file://0003-imx8mm-var-dart-plt-Switch-dtb-name-for-kernel-5.4.3.patch \
	file://imx8mm-var-dart-Enable-I2C.patch \
	file://mx8mm-plt-enable-i2c4-uboot.patch \
	file://mx8mm-plt-turn-on-yellow-led-at-boot.patch \
	file://mx8mm-var-dart-plt-set-dram-2g.patch \
"

SRC_URI_append_imx8mm-var-dart-nrt = " \
	file://mx8mm-nrt-Enable-M4-run-from-TCM.patch \
"

OS_KERNEL_CMDLINE_remove_imx8mm-var-dart-nrt = "console=null"

do_deploy_append_imx8m-var-dart() {
    install -m 0777 ${B}/${config}/tools/mkimage  ${DEPLOYDIR}/${BOOT_TOOLS}/mkimage_uboot
}

