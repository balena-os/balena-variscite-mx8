FILESEXTRAPATHS_append := ":${THISDIR}/files"

HOSTAPP_HOOKS_append_imx8m-var-dart = " \
    99-resin-uboot \
    99-flash-bootloader-imx8m-var-dart \
"
