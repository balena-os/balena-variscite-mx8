#@TYPE: Machine
#@NAME: Variscite DART-MX8M
#@SOC: i.MX8MQ
#@DESCRIPTION: Machine configuration for Variscite DART-MX8M
#@MAINTAINER: Nate Drude <nate.d@variscite.com>
#
# http://www.variscite.com

MACHINEOVERRIDES =. "mx8mq:"
require conf/machine/include/imx-base.inc
require conf/machine/include/arm/armv8a/tune-cortexa53.inc

require variscite.inc
require variscite_bcm43xx.inc

# Variscite BSP default providers
PREFERRED_PROVIDER_virtual/kernel:imx8mq-var-dart ?= "linux-variscite"
PREFERRED_PROVIDER_u-boot:imx8mq-var-dart ?= "u-boot-variscite"
PREFERRED_PROVIDER_u-boot-fw-utils:imx8mq-var-dart ?= "u-boot-fw-utils"
PREFERRED_PROVIDER_virtual/bootloader:imx8mq-var-dart ?= "u-boot-variscite"

KERNEL_DEVICETREE = " \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-m4-sd-dp.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-m4-sd-hdmi.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-m4-sd-lvds-dp.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-m4-sd-lvds.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-m4-sd-lvds-hdmi.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-m4-wifi-dp.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-m4-wifi-hdmi.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-m4-wifi-lvds-dp.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-m4-wifi-lvds.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-m4-wifi-lvds-hdmi.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-sd-dp.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-sd-hdmi.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-sd-lvds-dp.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-sd-lvds.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-sd-lvds-hdmi.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-wifi-dp.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-wifi-hdmi.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-wifi-lvds-dp.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-wifi-lvds.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-legacy-wifi-lvds-hdmi.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-m4-sd-hdmi.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-m4-sd-lvds.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-m4-sd-lvds-hdmi.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-m4-wifi-hdmi.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-m4-wifi-lvds.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-m4-wifi-lvds-hdmi.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-sd-hdmi.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-sd-lvds.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-sd-lvds-hdmi.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-wifi-hdmi.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-wifi-lvds.dtb \
	freescale/imx8mq-var-dart-dt8mcustomboard-wifi-lvds-hdmi.dtb \
"

MACHINE_EXTRA_RRECOMMENDS:remove = " imx-m4-demos"

UBOOT_CONFIG ??= "sd"
UBOOT_CONFIG[sd] = "imx8mq_var_dart_config,sdcard"
SPL_BINARY = "spl/u-boot-spl.bin"

ATF_PLATFORM = "imx8mq"

# Set DDR FIRMWARE
DDR_FIRMWARE_NAME = "lpddr4_pmu_train_1d_imem.bin lpddr4_pmu_train_1d_dmem.bin lpddr4_pmu_train_2d_imem.bin lpddr4_pmu_train_2d_dmem.bin"

# Set U-Boot DTB
UBOOT_DTB_NAME = "imx8mq-var-dart-dt8mcustomboard.dtb"

# Set imx-mkimage boot target
IMXBOOT_TARGETS = "flash_evk flash_evk_no_hdmi flash_dp_evk"
IMX_BOOT_SOC_TARGET = "iMX8M"

SERIAL_CONSOLES = "115200;ttymxc0"

IMAGE_BOOTLOADER = "imx-boot"

LOADADDR = ""
UBOOT_SUFFIX = "bin"
UBOOT_MAKE_TARGET = ""
IMX_BOOT_SEEK = "33"

# If you change TEE_LOAD_ADDR, make sure to align patch for soc.mak
TEE_LOAD_ADDR ?= "0x56000000"
TEE_CFG_DDR_SIZE ?= "0x100000000"
