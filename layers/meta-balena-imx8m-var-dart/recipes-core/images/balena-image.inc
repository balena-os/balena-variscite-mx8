BALENA_BOOT_PARTITION_FILES_imx8m-var-dart = " \
    ${KERNEL_IMAGETYPE}${KERNEL_INITRAMFS}-${MACHINE}.bin:/Image.gz \
    fsl-imx8mq-var-dart-sd-emmc-lvds.dtb:/fsl-imx8mq-var-dart-sd-emmc-lvds.dtb \
    fsl-imx8mq-var-dart-sd-emmc-hdmi.dtb:/fsl-imx8mq-var-dart-sd-emmc-hdmi.dtb \
    fsl-imx8mq-var-dart-sd-emmc-dual-display.dtb:/fsl-imx8mq-var-dart-sd-emmc-dual-display.dtb \
    fsl-imx8mq-var-dart-emmc-wifi-lvds.dtb:/fsl-imx8mq-var-dart-emmc-wifi-lvds.dtb \
    fsl-imx8mq-var-dart-emmc-wifi-hdmi.dtb:/fsl-imx8mq-var-dart-emmc-wifi-hdmi.dtb \
    fsl-imx8mq-var-dart-emmc-wifi-dual-display.dtb:/fsl-imx8mq-var-dart-emmc-wifi-dual-display.dtb \
"

BALENA_BOOT_PARTITION_FILES_imx8mm-var-dart = " \
    ${KERNEL_IMAGETYPE}${KERNEL_INITRAMFS}-${MACHINE}.bin:/Image.gz \
    fsl-imx8mm-var-dart.dtb:/fsl-imx8mm-var-dart.dtb \
    fsl-imx8mm-var-dart-m4.dtb:/fsl-imx8mm-var-dart-m4.dtb \
"

BALENA_BOOT_PARTITION_FILES_imx8mm-var-dart-plt = " \
    ${KERNEL_IMAGETYPE}${KERNEL_INITRAMFS}-${MACHINE}.bin:/Image.gz \
    imx8mm-var-dart.dtb: \
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
					i2c-tools \
"

IMAGE_INSTALL_remove_imx8mm-var-dart-nrt = "kernel-module-imx-gpu-viv"
IMAGE_INSTALL_remove_imx8mm-var-dart-plt = "kernel-module-imx-gpu-viv"

# Flash signed bootloader to raw image
IMAGE_CMD_balenaos-img_append_imx8m-var-dart () {
    dd if=${DEPLOY_DIR_IMAGE}/imx-boot-${MACHINE}-sd.bin-flash_evk of=${BALENA_RAW_IMG} conv=notrunc seek=33 bs=1K
}

# Flash signed bootloader to raw image
IMAGE_CMD_balenaos-img_append_imx8mm-var-dart () {
    dd if=${DEPLOY_DIR_IMAGE}/imx-boot-${MACHINE}-sd.bin-flash_lpddr4_ddr4_evk of=${BALENA_RAW_IMG} conv=notrunc seek=33 bs=1K
}


MACHINE_EXTRA_RDEPENDS += " \
                           linux-firmware-bcm4339 \
			   linux-firmware \
                           bcm43xx-utils \
                           brcm-patchram-plus \
                           kernel-modules \
                           pm-utils \
                           bluez5 \
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
