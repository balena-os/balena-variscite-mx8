do_install:append () {
    # Move udev rules into /usr/lib/udev/rules.d/ because /etc/udev/rules.d is bind mounted for custom rules in balenaOS
    install -d ${D}${nonarch_base_libdir}/udev/rules.d
    mv ${D}/etc/udev/rules.d/*.rules ${D}${nonarch_base_libdir}/udev/rules.d/
}
