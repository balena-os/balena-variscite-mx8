include resin-image.inc

RESIN_BOOT_PARTITION_FILES_append_imx8m-var-dart = " \
    imx-boot-${MACHINE}-sd.bin-flash_evk:/imx-boot-sd.bin \
"

RESIN_BOOT_PARTITION_FILES_append_imx8mm-var-dart = " \
    imx-boot-${MACHINE}-sd.bin-flash_lpddr4_ddr4_evk:/imx-boot-sd.bin \
"
