include balena-image.inc

BALENA_BOOT_PARTITION_FILES:append:imx8m-var-dart = " \
    imx-boot-${MACHINE}-sd.bin-flash_evk:/imx-boot-sd.bin \
"

BALENA_BOOT_PARTITION_FILES:append:imx8mm-var-dart = " \
    imx-boot-${MACHINE}-sd.bin-flash_lpddr4_ddr4_evk:/imx-boot-sd.bin \
"


# With Kirstone the rootfs space has increased,
# let's raise the image size values before
# production to allow for future updates
IMAGE_ROOTFS_SIZE:imx8mm-var-som="487424"
