RESIN_BOOT_PARTITION_FILES_imx8m-var-dart = " \
    ${KERNEL_IMAGETYPE}${KERNEL_INITRAMFS}-${MACHINE}.bin:/Image.gz \
    ${KERNEL_IMAGETYPE}-fsl-imx8mq-var-dart-sd-emmc-lvds.dtb:/fsl-imx8mq-var-dart-sd-emmc-lvds.dtb \
    ${KERNEL_IMAGETYPE}-fsl-imx8mq-var-dart-sd-emmc-hdmi.dtb:/fsl-imx8mq-var-dart-sd-emmc-hdmi.dtb \
    ${KERNEL_IMAGETYPE}-fsl-imx8mq-var-dart-sd-emmc-dual-display.dtb:/fsl-imx8mq-var-dart-sd-emmc-dual-display.dtb \
    ${KERNEL_IMAGETYPE}-fsl-imx8mq-var-dart-emmc-wifi-lvds.dtb:/fsl-imx8mq-var-dart-emmc-wifi-lvds.dtb \
    ${KERNEL_IMAGETYPE}-fsl-imx8mq-var-dart-emmc-wifi-hdmi.dtb:/fsl-imx8mq-var-dart-emmc-wifi-hdmi.dtb \
    ${KERNEL_IMAGETYPE}-fsl-imx8mq-var-dart-emmc-wifi-dual-display.dtb:/fsl-imx8mq-var-dart-emmc-wifi-dual-display.dtb \
"

RESIN_BOOT_PARTITION_FILES_imx8mm-var-dart = " \
    ${KERNEL_IMAGETYPE}${KERNEL_INITRAMFS}-${MACHINE}.bin:/Image.gz \
    ${KERNEL_IMAGETYPE}-fsl-imx8mm-var-dart.dtb:/fsl-imx8mm-var-dart.dtb \
    ${KERNEL_IMAGETYPE}-fsl-imx8mm-var-dart-m4.dtb:/fsl-imx8mm-var-dart-m4.dtb \
"

IMAGE_INSTALL_append = " \
                                        imx-boot \
                                        linux-firmware-bcm4339 \
                                        bcm43xx-utils \
                                        brcm-patchram-plus \
                                        kernel-modules \
                                        bluez5 \
					pm-utils \
					pm-services \
					firmware-imx \
					firmware-imx-vpu-imx8 \
					firmware-imx-sdma \
					kernel-module-imx-gpu-viv \
"

# Flash signed bootloader to raw image
IMAGE_CMD_resinos-img_append_imx8m-var-dart () {
    dd if=${DEPLOY_DIR_IMAGE}/imx-boot-${MACHINE}-sd.bin-flash_evk of=${RESIN_RAW_IMG} conv=notrunc seek=33 bs=1K
}

# Flash signed bootloader to raw image
IMAGE_CMD_resinos-img_append_imx8mm-var-dart () {
    dd if=${DEPLOY_DIR_IMAGE}/imx-boot-${MACHINE}-sd.bin of=${RESIN_RAW_IMG} conv=notrunc seek=33 bs=1K
}


MACHINE_EXTRA_RDEPENDS += " \
                           linux-firmware-bcm4339 \
			   linux-firmware \
                           bcm43xx-utils \
                           brcm-patchram-plus \
                           kernel-modules \
                           pm-utils \
                           firmware-imx-vpu-imx8 \
                           firmware-imx-sdma \
			   kernel-module-imx-gpu-viv \
                           "

IMAGE_INSTALL_append = " \
	kernel-image-initramfs \
        kernel-devicetree \
"

# Fixes error: packages already installed
# by kernel-image-initramfs
IMAGE_INSTALL_remove = " kernel-image"
