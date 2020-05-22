FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_imx8m-var-dart = " \
	file://variscite-wifi \
	file://variscite-wifi-common.sh \
	file://variscite-wifi.conf \
	file://blacklist.conf \
"

do_install_append_imx8m-var-dart() {
	install -d ${D}${sysconfdir}/wifi
	install -m 0644 ${WORKDIR}/variscite-wifi.conf ${D}${sysconfdir}/wifi
	install -m 0644 ${WORKDIR}/variscite-wifi-common.sh ${D}/${sysconfdir}/wifi
	install -m 0755 ${WORKDIR}/variscite-wifi ${D}/${sysconfdir}/wifi
	install -m 0644 ${WORKDIR}/blacklist.conf ${D}/${sysconfdir}/wifi
}
