FILESEXTRAPATHS_append := ":${THISDIR}/files"

SRC_URI_remove = "file://0001-Allow-BUILD_STRING-to-be-set-in-.revision-file.patch"
SRC_URI_append = " file://Allow-BUILD_STRING-to-be-set-in-revision-file.patch "

SRC_URI_remove_imx8mq-var-dart = " \
        file://imx8m-atf-ddr-timing.patch \
        file://imx8m-atf-fix-derate-enable.patch \
"

SRC_URI_append_imx8m-var-dart = " \
        file://old-imx8m-atf-ddr-timing.patch \
        file://old-imx8m-atf-fix-derate-enable.patch \
"
