FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

inherit kernel-resin

# This fixes invalid package name
# error caused by SRCPV
LOCALVERSION = ""

# Use same gpu driver as the Variscite Debian release
SRC_URI_append_imx8m-var-dart = " \
	file://0001-Add-identification-led.patch \
	file://0001-vivante-gpu-revert-to-6.2.4.p1-driver.patch \
"
