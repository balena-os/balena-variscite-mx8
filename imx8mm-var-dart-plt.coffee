deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon
 
IMX8M_VAR_DART_FLASH = 'Press and hold SW13. Insert SD CARD and then power up the <%= TYPE_NAME %>. Release the switch 10 seconds after the board was powered.'
IMX8M_VAR_DART_POST_PROVISION = 'Wait for the board to enter the post provisioning state in dashboard.'

postProvisioningInstructions = [
	IMX8M_VAR_DART_POST_PROVISION
        instructions.REMOVE_INSTALL_MEDIA
        instructions.BOARD_REPOWER
]
 
module.exports =
        version: 1
        slug: 'imx8mm-var-dart-plt'
        name: 'Variscite DART-MX8M Mini PLT'
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
                machine: 'imx8mm-var-dart-plt'
                image: 'balena-image-flasher'
                fstype: 'balenaos-img'
                version: 'yocto-warrior'
                deployArtifact: 'balena-image-flasher-imx8mm-var-dart-plt.balenaos-img'
                compressed: true

        options: [ networkOptions.group ]

        configuration:
                config:
                        partition:
                                primary: 1
                        path: '/config.json'

        initialization: commonImg.initialization
