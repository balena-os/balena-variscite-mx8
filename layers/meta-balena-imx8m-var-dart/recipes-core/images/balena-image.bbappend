include balena-image.inc

BALENA_BOOT_PARTITION_FILES:append:imx8mp-var-dart = " \
    imx-boot-${MACHINE}-sd.bin-flash_evk:/imx-boot.bin \
"
