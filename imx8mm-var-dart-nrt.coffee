deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon
 
IMX8M_VAR_DART_FLASH = 'Set the SW7 BOOT SELECT switch to EXT. Insert SD CARD and then power up the <%= TYPE_NAME %>.'
IMX8M_VAR_DART_POST_FLASH = 'Set the SW7 BOOT SELECT switch to INT.'
 
postProvisioningInstructions = [
        instructions.BOARD_SHUTDOWN
        instructions.REMOVE_INSTALL_MEDIA
        IMX8M_VAR_DART_POST_FLASH
        instructions.BOARD_REPOWER
]
 
module.exports =
        version: 1
        slug: 'imx8mm-var-dart-nrt'
        name: 'Variscite DART-MX8M Mini NRT'
        arch: 'aarch64'
        state: 'new'
 
        stateInstructions:
                postProvisioning: postProvisioningInstructions
 
        instructions: [
                instructions.ETCHER_SD
                instructions.EJECT_SD
                instructions.FLASHER_WARNING
                IMX8M_VAR_DART_FLASH
        ].concat(postProvisioningInstructions)

        gettingStartedLink:
                windows: 'http://docs.resin.io/imx8mm-var-dart/nodejs/getting-started/#adding-your-first-device'
                osx: 'http://docs.resin.io/imx8mm-var-dart/getting-started/#adding-your-first-device'
                linux: 'http://docs.resin.io/imx8mm-var-dart/getting-started/#adding-your-first-device'

        supportsBlink: false

        yocto:
                machine: 'imx8mm-var-dart-nrt'
                image: 'balena-image-flasher'
                fstype: 'balenaos-img'
                version: 'yocto-warrior'
                deployArtifact: 'balena-image-flasher-imx8mm-var-dart-nrt.balenaos-img'
                compressed: true

        options: [ networkOptions.group ]

        configuration:
                config:
                        partition:
                                primary: 1
                        path: '/config.json'

        initialization: commonImg.initialization
