# This fixes circular dependency error
IMAGE_FSTYPES_imx8m-var-dart  = "${INITRAMFS_FSTYPES}"
IMAGE_FSTYPES_imx8mm-var-dart = "${INITRAMFS_FSTYPES}"

PACKAGE_INSTALL_remove = " initramfs-module-recovery"
