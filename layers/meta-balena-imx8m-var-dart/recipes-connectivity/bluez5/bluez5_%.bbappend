FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append_imx8m-var-dart = " \
	file://variscite-bt \
	file://variscite-bt.conf \
"

do_install_append_imx8m-var-dart() {
	install -d ${D}${sysconfdir}/bluetooth
	install -m 0644 ${WORKDIR}/variscite-bt.conf ${D}${sysconfdir}/bluetooth
	install -d ${D}${systemd_unitdir}/system
	install -m 0755 ${WORKDIR}/variscite-bt ${D}${sysconfdir}/bluetooth
}
