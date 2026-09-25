BALENA_BOOT_PARTITION_FILES:imx8m-var-dart = " \
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

IMAGE_INSTALL:append = " \
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
	firmware-imx-sdma-imx7d \
	libgpiod \
	linux-firmware-bcm4339 \
"

IMAGE_INSTALL:append:imx8mp-var-dart = " \
	linux-firmware-bcm43430 \
"

IMAGE_INSTALL:remove:imx8mm-var-dart-nrt = "kernel-module-imx-gpu-viv"
IMAGE_INSTALL:remove:imx8mm-var-dart-plt = "kernel-module-imx-gpu-viv"

# Flash signed bootloader to raw image
IMAGE_CMD:balenaos-img:append:imx8m-var-dart () {
    dd if=${DEPLOY_DIR_IMAGE}/imx-boot-${MACHINE}-sd.bin-flash_evk of=${BALENA_RAW_IMG} conv=notrunc seek=33 bs=1K
}

# Flash signed bootloader to raw image
IMAGE_CMD:balenaos-img:append:imx8mm-var-dart () {
    dd if=${DEPLOY_DIR_IMAGE}/imx-boot-${MACHINE}-sd.bin-flash_lpddr4_ddr4_evk of=${BALENA_RAW_IMG} conv=notrunc seek=33 bs=1K
}

# Flash signed bootloader to raw image
IMAGE_CMD:balenaos-img:append:imx8mp-var-dart () {
    dd if=${DEPLOY_DIR_IMAGE}/imx-boot-${MACHINE}-sd.bin-flash_evk of=${BALENA_RAW_IMG} conv=notrunc seek=32 bs=1K
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
"

IMAGE_ROOTFS_SIZE:imx8mm-var-som="487424"
IMAGE_ROOTFS_SIZE:imx8mp-var-dart="487424"

# Fix default sizes
IMAGE_ROOTFS_SIZE:imx8m-var-dart = "327680"
BALENA_BOOT_SIZE:imx8m-var-dart = "40960"
BALENA_STATE_SIZE:imx8m-var-dart = "20480"
IMAGE_ROOTFS_SIZE:imx8mm-var-dart-plt = "327680"
BALENA_BOOT_SIZE:imx8mm-var-dart-plt = "40960"
BALENA_STATE_SIZE:imx8mm-var-dart-plt = "20480"
IMAGE_ROOTFS_SIZE:imx8mm-var-dart = "327680"
BALENA_BOOT_SIZE:imx8mm-var-dart = "40960"
BALENA_STATE_SIZE:imx8mm-var-dart = "20480"
BALENA_BOOT_SIZE:imx8mm-var-som = "40960"
BALENA_STATE_SIZE:imx8mm-var-som = "20480"
BALENA_BOOT_SIZE:imx8mp-var-dart = "40960"
BALENA_STATE_SIZE:imx8mp-var-dart = "20480"

unset ROOTFS_SIZE

# we do not use some packages installed by the BSP
IMAGE_INSTALL:remove = "packagegroup-security-tpm2"
IMAGE_INSTALL:remove = "packagegroup-tools-bluetooth"
IMAGE_INSTALL:remove = "packagegroup-variscite-devel"
IMAGE_INSTALL:remove = "variscite-base-files"

ROOTFS_POSTPROCESS_COMMAND += "remove_hwdb_bin; "

remove_hwdb_bin() {
    rm -f ${IMAGE_ROOTFS}/usr/lib/udev/hwdb.bin
}

do_resin_boot_dirgen_and_deploy[depends] += "imx-boot:do_deploy"
