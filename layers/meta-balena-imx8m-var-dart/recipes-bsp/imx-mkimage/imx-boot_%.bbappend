DEPENDS:append = " \
    virtual/bootloader \
"
do_configure[nostamp] = "1"
do_compile[depends] += "virtual/bootloader:do_deploy"
do_compile[nostamp] = "1"

# for imx8m-var-dart we only use imx-boot-imx8m-var-dart-sd.bin-flash_evk
do_install:append:imx8m-var-dart() {
    rm -f ${D}/boot/imx-boot-imx8m-var-dart-sd.bin-flash_dp_evk
    rm -f ${D}/boot/imx-boot-imx8m-var-dart-sd.bin-flash_evk_no_hdmi
}
