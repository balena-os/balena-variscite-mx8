# We don't need the udev rules installed by this recipe (furthermore, the automount.rules will make the flasher fail)
do_install:append() {
	rm -f ${D}${sysconfdir}/udev/rules.d/*.rules
}
