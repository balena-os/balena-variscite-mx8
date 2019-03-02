# This fixes circular dependency error
IMAGE_FSTYPES_imx8m-var-dart  = "${INITRAMFS_FSTYPES}"

# This fixes rootfs maxsize override error
IMAGE_ROOTFS_MAXSIZE = "16384"
