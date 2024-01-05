deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

SD_BOOT = 'Configure the SW7 boot dip switch to boot from SD Card (set it to EXT position) and power on the board. Let it boot and perform the automatic install of balenaOS onto the eMMC.'
EMMC_BOOT = 'Configure the SW7 boot dip switch to boot from eMMC (set it to INT position).'

postProvisioningInstructions = [
        instructions.BOARD_SHUTDOWN
        instructions.REMOVE_INSTALL_MEDIA
        EMMC_BOOT
        instructions.BOARD_REPOWER
]

module.exports =
        version: 1
        slug: 'imx8mp-var-dart'
        name: 'Variscite DART-MX8M-PLUS'
        arch: 'aarch64'
        state: 'released'

        stateInstructions:
                postProvisioning: postProvisioningInstructions

        instructions: [
                instructions.ETCHER_SD
                instructions.EJECT_SD
                instructions.FLASHER_WARNING
                SD_BOOT
        ].concat(postProvisioningInstructions)

        gettingStartedLink:
                windows: 'https://docs.balena.io/learn/getting-started/imx8mp-var-dart/nodejs/'
                osx: 'https://docs.balena.io/learn/getting-started/imx8mp-var-dart/nodejs/'
                linux: 'https://docs.balena.io/learn/getting-started/imx8mp-var-dart/nodejs/'

        supportsBlink: false

        yocto:
                machine: 'imx8mp-var-dart'
                image: 'balena-image-flasher'
                fstype: 'balenaos-img'
                version: 'yocto-kirkstone'
                deployArtifact: 'balena-image-flasher-imx8mp-var-dart.balenaos-img'
                compressed: true

        options: [ networkOptions.group ]

        configuration:
                config:
                        partition:
                                primary: 1
                        path: '/config.json'

        initialization: commonImg.initialization
