FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

inherit kernel-resin

# This fixes invalid package name
# error caused by SRCPV
LOCALVERSION = ""

SRC_URI_append_imx8m-var-dart = " \
	file://0001-Add-identification-led.patch \
"
