FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

DESCRIPTION = "Systemd services used for powering down/up wifi & bt when suspending to RAM"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit allarch systemd

SRC_URI = "file://imx-suspend.service \
           file://imx-resume.service \
"

RDEPENDS_${PN} = " bash systemd"

do_install () {
   install -d ${D}/${systemd_unitdir}/system
   install -m 644 ${WORKDIR}/imx-suspend.service ${D}/${systemd_unitdir}/system/imx-suspend.service
   install -m 644 ${WORKDIR}/imx-resume.service  ${D}/${systemd_unitdir}/system/imx-resume.service
   install -d ${D}/etc/modprobe.d/
   echo "blacklist lp5562-leds" >  ${D}/etc/modprobe.d/blacklist.conf
}

SYSTEMD_SERVICE_${PN} = "imx-suspend.service imx-resume.service"

FILES_${PN} += " /etc/modprobe.d/blacklist.conf"
