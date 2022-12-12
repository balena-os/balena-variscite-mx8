deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon
 
IMX8MM_VAR_SOM_FLASH = 'Set the BOOT SELECT switch to EXT. Insert SD CARD. Power up the <%= TYPE_NAME %>.'
IMX8MM_VAR_SOM_POST_FLASH = 'Set the BOOT SELECT switch to INT.'
 
postProvisioningInstructions = [
        instructions.BOARD_SHUTDOWN
        instructions.REMOVE_INSTALL_MEDIA
        IMX8MM_VAR_SOM_POST_FLASH
        instructions.BOARD_REPOWER
]
 
module.exports =
        version: 1
        slug: 'imx8mm-var-som'
        name: 'Variscite VAR-SOM-MX8M-MINI Devkit'
        arch: 'aarch64'
        state: 'released'
 
        stateInstructions:
                postProvisioning: postProvisioningInstructions
 
        instructions: [
                instructions.ETCHER_SD
                instructions.EJECT_SD
                instructions.FLASHER_WARNING
                IMX8MM_VAR_SOM_FLASH
        ].concat(postProvisioningInstructions)

        gettingStartedLink:
                windows: 'http://docs.resin.io/imx8mm-var-som/nodejs/getting-started/#adding-your-first-device'
                osx: 'http://docs.resin.io/imx8mm-var-som/getting-started/#adding-your-first-device'
                linux: 'http://docs.resin.io/imx8mm-var-som/getting-started/#adding-your-first-device'

        supportsBlink: false

        yocto:
                machine: 'imx8mm-var-som'
                image: 'balena-image-flasher'
                fstype: 'balenaos-img'
                version: 'yocto-kirkstone'
                deployArtifact: 'balena-image-flasher-imx8mm-var-som.balenaos-img'
                compressed: true

        options: [ networkOptions.group ]

        configuration:
                config:
                        partition:
                                primary: 1
                        path: '/config.json'

        initialization: commonImg.initialization
