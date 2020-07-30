FILESEXTRAPATHS_append := ":${THISDIR}/files"

SRC_URI_remove = "file://0001-Allow-BUILD_STRING-to-be-set-in-.revision-file.patch"
SRC_URI_append = " file://Allow-BUILD_STRING-to-be-set-in-revision-file.patch "
