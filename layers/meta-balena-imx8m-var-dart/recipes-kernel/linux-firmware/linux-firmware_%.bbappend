# Use latest Laird wifi firmware
BRCM_REV:imx8mm-var-dart-nrt = "11.39.0.18"

# Default values taken from meta-variscite-bsp Kirkstone release 5.15-2.0.x-v1.3
# at https://variwiki.com/index.php?title=DART-MX8M-MINI_Release_Notes&release=mx8mm-yocto-kirkstone-5.15-2.0.x-v1.3

BRCM_LWB_SHA_RELEASE_VARISCITE="8faa105e036a9f8bffe2857f5d9f5ce539521ef8624b59069290579440228ac5"
BRCM_LWB5_SHA_RELEASE_VARISCITE="583e2b328a185f545e1c5de55acaf3ae092cdbc791a62ff005c5559515488f7f"
BRCM_LWB_SHA_RELEASE_VARISCITE:imx8mm-var-dart-nrt = "f076de39385368849184036a4828051ea0ed4129c1ec115a45b05cd66605c337"
BRCM_LWB5_SHA_RELEASE_VARISCITE:imx8mm-var-dart-nrt = "a9731660ea05bc7625e37314d7f3fd3f70b266aa21a07536baea82213cdfeec2"
SRC_URI[brcm_lwb.sha256sum] = "${BRCM_LWB_SHA_RELEASE_VARISCITE}"
SRC_URI[brcm_lwb5.sha256sum] = "${BRCM_LWB5_SHA_RELEASE_VARISCITE}"

do_firmware_compression:append() {
if [ "${FIRMWARE_COMPRESSION}" = "1" ]; then
    bbnote "Decompressing BT firmware used by variscite bt script";
    for bt_fw_file in "BCM4335C0.hcd" "BCM43430A1.hcd"; do
        bbnote "Looking for ${bt_fw_file}.xz";
        if [ -e "${D}${nonarch_base_libdir}/firmware/brcm/${bt_fw_file}.xz" ]; then
            bbnote "Found ${bt_fw_file}.xz";
            xzcat "${D}${nonarch_base_libdir}/firmware/brcm/${bt_fw_file}.xz" > "${D}${nonarch_base_libdir}/firmware/brcm/${bt_fw_file}";
            rm "${D}${nonarch_base_libdir}/firmware/brcm/${bt_fw_file}.xz";
            bbnote "unpacked ${bt_fw_file}.xz";
        fi
    done
fi
}
