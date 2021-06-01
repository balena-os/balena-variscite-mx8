do_install_append() {
	echo "" > ${D}${sysconfdir}/issue
	echo "" > ${D}${sysconfdir}/issue.net
}
