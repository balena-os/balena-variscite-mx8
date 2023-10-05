FILESEXTRAPATHS:append := ":${THISDIR}/files"

HOSTAPP_HOOKS:append:imx8m-var-dart = " \
    99-resin-uboot \
    99-flash-bootloader-imx8m-var-dart \
"

FILESEXTRAPATHS:append := ":${THISDIR}/files"

HOSTAPP_HOOKS:append:imx8mm-var-dart = " \
    99-resin-uboot \
    99-flash-bootloader-imx8mm-var-dart \
"
