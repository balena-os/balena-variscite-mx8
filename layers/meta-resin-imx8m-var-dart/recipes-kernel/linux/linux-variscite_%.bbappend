FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

inherit kernel-resin

# This fixes invalid package name
# error caused by SRCPV
LOCALVERSION = ""

# sdma driver tries to load the firmware
# from initramfs causing bt to fail
RESIN_CONFIGS_append_imx8m-var-dart = " imx-sdma"
RESIN_CONFIGS[imx-sdma] = " \
		CONFIG_IMX_SDMA=m \
"

# Use same gpu driver as the Variscite Debian release
SRC_URI_append_imx8m-var-dart = " \
	file://0001-Add-identification-led.patch \
	file://0001-vivante-gpu-revert-to-6.2.4.p1-driver.patch \
"
