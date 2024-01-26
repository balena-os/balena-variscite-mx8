MACHINEOVERRIDES =. "mx8mm:"
require conf/machine/include/imx-base.inc
require conf/machine/include/arm/armv8a/tune-cortexa53.inc

require conf/machine/variscite.inc
require conf/machine/variscite_bcm43xx.inc

# Variscite BSP default providers
PREFERRED_PROVIDER_virtual/kernel:imx8mm-var-dart ?= "linux-variscite"
PREFERRED_PROVIDER_u-boot:imx8mm-var-dart ?= "u-boot-variscite"
PREFERRED_PROVIDER_u-boot-fw-utils:imx8mm-var-dart ?= "u-boot-fw-utils"
PREFERRED_PROVIDER_virtual/bootloader:imx8mm-var-dart ?= "u-boot-variscite"

KERNEL_DEVICETREE = " \
	freescale/imx8mm-var-dart-dt8mcustomboard.dtb \
	freescale/imx8mm-var-dart-dt8mcustomboard-legacy.dtb \
	freescale/imx8mm-var-som-symphony.dtb \
	freescale/imx8mm-var-dart-dt8mcustomboard-m4.dtb \
	freescale/imx8mm-var-dart-dt8mcustomboard-legacy-m4.dtb \
	freescale/imx8mm-var-som-symphony-m4.dtb \
"

MACHINE_EXTRA_RRECOMMENDS:remove = " imx-m4-demos"

UBOOT_CONFIG ??= "sd"
UBOOT_CONFIG[sd] = "imx8mm_var_dart_config,sdcard"
SPL_BINARY = "spl/u-boot-spl.bin"

ATF_PLATFORM = "imx8mm"
ATF_LOAD_ADDR = "0x920000"

# Set DDR FIRMWARE
DDR_FIRMWARE_NAME = " \
	ddr4_imem_1d.bin \
	ddr4_dmem_1d.bin \
	ddr4_imem_2d.bin \
	ddr4_dmem_2d.bin \
	lpddr4_pmu_train_1d_imem.bin \
	lpddr4_pmu_train_1d_dmem.bin \
	lpddr4_pmu_train_2d_imem.bin \
	lpddr4_pmu_train_2d_dmem.bin \
"
# Set U-Boot DTB
UBOOT_DTB_NAME = "imx8mm-var-dart-customboard.dtb"
UBOOT_DTB_EXTRA = "imx8mm-var-som-symphony.dtb"

# Set imx-mkimage boot target
IMXBOOT_TARGETS = "flash_lpddr4_ddr4_evk"

IMX_BOOT_SOC_TARGET = "iMX8MM"

# Extra firmware package name, that is required to build boot container for fslc bsp
IMX_EXTRA_FIRMWARE = "firmware-imx-8m"

SERIAL_CONSOLES = "115200;ttymxc0 "

IMAGE_BOOTLOADER = "imx-boot"

LOADADDR = ""
UBOOT_SUFFIX = "bin"
UBOOT_MAKE_TARGET = "all"
IMX_BOOT_SEEK = "33"

# If you change TEE_LOAD_ADDR, make sure to align patch for soc.mak
TEE_LOAD_ADDR ?= "0x56000000"
TEE_CFG_DDR_SIZE ?= "0x80000000"
