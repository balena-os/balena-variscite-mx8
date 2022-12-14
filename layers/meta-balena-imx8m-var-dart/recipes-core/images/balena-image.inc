BALENA_BOOT_PARTITION_FILES_imx8m-var-dart = " \
    ${KERNEL_IMAGETYPE}${KERNEL_INITRAMFS}-${MACHINE}.bin:/Image.gz \
        imx8mq-var-dart-dt8mcustomboard-legacy-m4-sd-dp.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-legacy-m4-sd-hdmi.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-legacy-m4-sd-lvds-dp.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-legacy-m4-sd-lvds.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-legacy-m4-sd-lvds-hdmi.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-legacy-m4-wifi-dp.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-legacy-m4-wifi-hdmi.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-legacy-m4-wifi-lvds-dp.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-legacy-m4-wifi-lvds.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-legacy-m4-wifi-lvds-hdmi.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-legacy-sd-dp.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-legacy-sd-hdmi.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-legacy-sd-lvds-dp.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-legacy-sd-lvds.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-legacy-sd-lvds-hdmi.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-legacy-wifi-dp.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-legacy-wifi-hdmi.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-legacy-wifi-lvds-dp.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-legacy-wifi-lvds.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-legacy-wifi-lvds-hdmi.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-m4-sd-hdmi.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-m4-sd-lvds.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-m4-sd-lvds-hdmi.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-m4-wifi-hdmi.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-m4-wifi-lvds.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-m4-wifi-lvds-hdmi.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-sd-hdmi.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-sd-lvds.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-sd-lvds-hdmi.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-wifi-hdmi.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-wifi-lvds.dtb:/ \
        imx8mq-var-dart-dt8mcustomboard-wifi-lvds-hdmi.dtb:/ \
"

BALENA_BOOT_PARTITION_FILES_imx8mm-var-dart = " \
    ${KERNEL_IMAGETYPE}${KERNEL_INITRAMFS}-${MACHINE}.bin:/Image.gz \
    imx8mm-var-dart-dt8mcustomboard-legacy.dtb:/imx8mm-var-dart-dt8mcustomboard-legacy.dtb \
    imx8mm-var-dart-dt8mcustomboard.dtb:/imx8mm-var-dart-dt8mcustomboard.dtb \
    imx8mm-var-dart-dt8mcustomboard-m4.dtb:/imx8mm-var-dart-dt8mcustomboard-m4.dtb \
"

BALENA_BOOT_PARTITION_FILES_append = " \
    extra_uEnv.txt:/extra_uEnv.txt \
"

IMAGE_INSTALL_append = " \
	imx-boot \
	bcm43xx-utils \
	brcm-patchram-plus \
	kernel-modules \
	bluez5 \
	pm-utils \
	pm-services \
	firmware-imx-vpu-imx8 \
	kernel-module-imx-gpu-viv \
	i2c-tools \
	kernel-image-initramfs \
	kernel-devicetree \
	firmware-imx-sdma-imx7d \
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
                           firmware-imx \
                           kernel-module-imx-gpu-viv \
			   kernel-image-initramfs \
			   kernel-devicetree \
"

# Fixes error: packages already installed
# by kernel-image-initramfs
IMAGE_INSTALL_remove = " kernel-image"

IMAGE_ROOTFS_SIZE_imx8mm-var-som="487424"
