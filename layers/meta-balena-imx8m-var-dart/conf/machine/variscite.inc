## Brough in from Kirkstone branch of meta-variscite-bsp github repository
## See https://variwiki.com/index.php?title=DART-MX8M-MINI_Release_Notes&release=mx8mm-yocto-kirkstone-5.15-2.0.x-v1.3
## for release details
INHERIT += "image-buildinfo"

MACHINE_FEATURES += " pci bluetooth wifi screen"

IMX_DEFAULT_BSP = "nxp"

USE_VT = "0"

KERNEL_IMAGETYPE:mx8-nxp-bsp = "Image.gz"

WKS_FILE:mx8-nxp-bsp = "imx-imx-boot-singlepart.wks.in"

# Set a more generic tuning for code reuse across parts
DEFAULTTUNE:mx8-nxp-bsp:fslc     ?= "armv8a-crc-crypto"
DEFAULTTUNE:mx8m-nxp-bsp:fslc    ?= "armv8a-crc-crypto"
DEFAULTTUNE:mx8qxp-nxp-bsp:fslc  ?= "armv8a-crc-crypto"
DEFAULTTUNE:mx8x-nxp-bsp:fslc    ?= "armv8a-crc-crypto"

# Variscite BSP default providers
PREFERRED_RPROVIDER_u-boot-default-env ?= "u-boot-variscite"

# Use i.MX Gstreamer Version
MACHINE_GSTREAMER_1_0_PLUGIN:mx8-nxp-bsp = "imx-gst1.0-plugin"
PREFERRED_VERSION_imx-gst1.0-plugin:mx8-nxp-bsp ?= "4.7.0"
PREFERRED_VERSION_gstreamer1.0:mx8-nxp-bsp              ?= "1.20.0.imx"
PREFERRED_VERSION_gstreamer1.0-plugins-base:mx8-nxp-bsp ?= "1.20.0.imx"
PREFERRED_VERSION_gstreamer1.0-plugins-good:mx8-nxp-bsp ?= "1.20.0.imx"
PREFERRED_VERSION_gstreamer1.0-plugins-bad:mx8-nxp-bsp  ?= "1.20.0.imx"
PREFERRED_VERSION_gstreamer1.0-plugins-ugly:mx8-nxp-bsp ?= "1.20.0"
PREFERRED_VERSION_gstreamer1.0-libav:mx8-nxp-bsp        ?= "1.20.0"
PREFERRED_VERSION_gstreamer1.0-rtsp-server:mx8-nxp-bsp  ?= "1.20.0"

# Add VPU and Cortex M4/M7 firmware
MACHINE_FIRMWARE:append:mx8-nxp-bsp = " \
	firmware-imx-vpu-imx8 \
	freertos-variscite \
	"

# Add VPU and Cortex M4/M7 firmware
MACHINE_FIRMWARE:append:mx8-nxp-bsp = " \
	freertos-variscite \
	"
MACHINE_EXTRA_RDEPENDS += " \
	gptfdisk \
	hostapd \
	hdparm \
	imx-kobs \
	iw \
	kernel-modules \
	kmod \
	${@bb.utils.contains('DISTRO', 'b2qt', '', \
           bb.utils.contains('DISTRO_FEATURES', 'wayland', 'networkmanager networkmanager-nmcli', \
                                                       '', d), d)} \
	packagegroup-tools-bluetooth \
	bluealsa \
	pm-utils \
	rng-tools \
	wpa-supplicant \
	wireless-regdb-static \
	u-boot-fw-utils \
	u-boot-splash \
"

# Packages added to all images (including core-image-minimal)
IMAGE_INSTALL:append:mx8-nxp-bsp = " \
	kernel-image \
	kernel-devicetree \
"

IMAGE_FSTYPES = "tar.gz wic.gz"

# Wayland based distros add systemd to DISTRO_FEATURES
# Remove sysvinit or systemd based on DISTRO_FEATURES to avoid conflicts
DISTRO_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' sysvinit', '', d)}"
DISTRO_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', ' systemd', '', d)}"

# Use bluez-alsa instead of pulseaudio
DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " pulseaudio"
