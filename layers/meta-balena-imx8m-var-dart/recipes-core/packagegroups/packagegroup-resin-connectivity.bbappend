# the machines in this repo are still on kernel 4.14.98, which is < 4.15 so let's not use wireless-regdb-static just yet.
CONNECTIVITY_FIRMWARES_remove_imx8mm-var-dart-plt = "wireless-regdb-static"

CONNECTIVITY_FIRMWARES_append = " linux-firmware-bcm4339 "
