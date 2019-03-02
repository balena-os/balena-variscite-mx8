FILESEXTRAPATHS_append := ":${THISDIR}/${PN}"

inherit kernel-resin

SRC_URI_append_imx8m-var-dart = " \
	file://0001-Add-identification-led.patch \
"
