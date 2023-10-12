FILESEXTRAPATHS:append := ":${THISDIR}/files"

# Increase scan duration and make sure caches are flushed
# to overcome autokit sporadic scan reporting no results.
# Scanning appears to work fine outside autokit on the PLT
# device and this could be caused by interferences and
# caching.
SRC_URI:append:imx8mm-var-dart-plt += " \
    file://0005-scan_len.patch \
"
