deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon
 
IMX8M_VAR_DART_FLASH = 'Set the SW7 BOOT SELECT switch to SDCARD. Insert SD CARD. Power up the <%= TYPE_NAME %>.'
IMX8M_VAR_DART_POST_FLASH = 'Set the SW7 BOOT SELECT switch to eMMC.'
 
postProvisioningInstructions = [
        instructions.BOARD_SHUTDOWN
        instructions.REMOVE_INSTALL_MEDIA
        IMX8M_VAR_DART_POST_FLASH
        instructions.BOARD_REPOWER
]
 
module.exports =
        version: 1
        slug: 'imx8m-var-dart'
        name: 'Variscite DART-MX8M'
        arch: 'aarch64'
        state: 'released'

        stateInstructions:
                postProvisioning: postProvisioningInstructions
 
        instructions: [
                instructions.ETCHER_SD
                instructions.EJECT_SD
                instructions.FLASHER_WARNING
                IMX8M_VAR_DART_FLASH
        ].concat(postProvisioningInstructions)

        gettingStartedLink:
                windows: 'http://docs.resin.io/imx8m-var-dart/nodejs/getting-started/#adding-your-first-device'
                osx: 'http://docs.resin.io/imx8m-var-dart/getting-started/#adding-your-first-device'
                linux: 'http://docs.resin.io/imx8m-var-dart/getting-started/#adding-your-first-device'

        supportsBlink: true

        yocto:
                machine: 'imx8m-var-dart'
                image: 'balena-image-flasher'
                fstype: 'balenaos-img'
                version: 'yocto-dunfell'
                deployArtifact: 'balena-image-flasher-imx8m-var-dart.balenaos-img'
                compressed: true

        options: [ networkOptions.group ]

        configuration:
                config:
                        partition:
                                primary: 1
                        path: '/config.json'

        initialization: commonImg.initialization
