FILESEXTRAPATHS:append := ":${THISDIR}/files"

# Increase scan duration and make sure caches are flushed
# to overcome autokit sporadic scan reporting no results.
# Scanning appears to work fine outside autokit on the PLT
# device and this could be caused by interferences and
# caching.
SRC_URI:append:imx8mm-var-dart = " \
    file://0005-scan_len.patch \
"

# Remove obex-profiles from bluez5's default PACKAGECONFIG
# so we don't get the large libical and libicu in the rootfs
PACKAGECONFIG:remove = "obex-profiles"
