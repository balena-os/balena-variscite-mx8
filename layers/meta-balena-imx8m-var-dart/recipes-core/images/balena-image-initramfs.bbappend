# This fixes circular dependency error
IMAGE_FSTYPES:imx8m-var-dart  = "${INITRAMFS_FSTYPES}"
IMAGE_FSTYPES:imx8mm-var-dart = "${INITRAMFS_FSTYPES}"
PACKAGE_INSTALL:remove = " mdraid"
PACKAGE_INSTALL:remove = " initramfs-module-recovery"
