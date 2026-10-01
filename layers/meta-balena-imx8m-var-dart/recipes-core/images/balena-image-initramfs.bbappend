# create some extra space for the Scarthgap update

PACKAGE_INSTALL:remove = "initramfs-module-migrate"
PACKAGE_INSTALL:remove = "mdraid"
PACKAGE_INSTALL:remove = "initramfs-module-recovery"

IMAGE_ROOTFS_MAXSIZE = "65536"
