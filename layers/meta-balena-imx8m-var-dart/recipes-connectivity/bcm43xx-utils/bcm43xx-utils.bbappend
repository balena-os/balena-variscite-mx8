do_install:append() {
	sed -i 's/\# Unload WIFI driver/ifconfig wlan0 down \&\& sleep 2/g' ${D}/${sysconfdir}/wifi/variscite-wifi
}
