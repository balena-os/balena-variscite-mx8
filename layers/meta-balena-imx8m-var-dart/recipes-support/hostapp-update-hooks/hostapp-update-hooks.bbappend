FILESEXTRAPATHS:append := ":${THISDIR}/files"

HOSTAPP_HOOKS:append:imx8m-var-dart = " \
    99-resin-uboot \
    99-flash-bootloader-imx8m-var-dart \
"

HOSTAPP_HOOKS:append:imx8mm-var-dart = " \
    99-resin-uboot \
    99-flash-bootloader-imx8mm-var-dart \
"

HOSTAPP_HOOKS:append:imx8mp-var-dart = " \
    99-resin-uboot \
    99-flash-bootloader_imx8mp-var-dart \
"
