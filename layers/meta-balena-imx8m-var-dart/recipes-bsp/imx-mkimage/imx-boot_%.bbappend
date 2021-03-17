FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

DEPENDS_append = " \
    virtual/bootloader \
"

do_compile[nostamp] = "1"

SRC_URI_append_imx8m-var-dart = " \
        file://imx8m-soc.mak \
"

SRC_URI_remove-imx8m-var-dart = "file://soc.mak"

# NOTE: imx8m-var-dart uses older imx-firmware,
# imx-mkimage, u-boot, atf, and needs the soc.mak
# provided by meta-variscite-fslc as in BalenaOS version
# 2.50.1
do_compile_prepend_imx8m-var-dart() {
        cp ${WORKDIR}/imx8m-soc.mak ${WORKDIR}/soc.mak
}
