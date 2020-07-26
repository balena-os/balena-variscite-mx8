Change log
-----------

# v2.53.9+rev1
## (2020-07-24)


<details>
<summary> Update meta-balena from v2.52.5 to v2.53.9 [Alexandru Costache] </summary>

> ## meta-balena-2.53.9
> ### (2020-07-23)
> 
> 
> <details>
> <summary> balena-supervisor: Update to v11.9.9 [Rich Bayliss] </summary>
> 
>> ### balena-supervisor-11.9.9
>> #### (2020-07-23)
>> 
>> * common: Fix bug where aliases might be undefined [Rich Bayliss]
>> 
> </details>
> 
> 
> ## meta-balena-2.53.8
> ### (2020-07-23)
> 
> * resin-supervisor: Create required directories before launch [Alex Gonzalez]
> 
> ## meta-balena-2.53.7
> ### (2020-07-23)
> 
> 
> <details>
> <summary> balena-supervisor: Update to v11.9.8 [Florin Sarbu] </summary>
> 
>> ### balena-supervisor-11.9.8
>> #### (2020-07-22)
>> 
>> * Bump lodash from 4.17.15 to 4.17.19 [dependabot[bot]]
>> 
>> ### balena-supervisor-11.9.7
>> #### (2020-07-22)
>> 
>> * docker-utils: Test network gateway determination logic [Rich Bayliss]
>> * Fix docker-util using incorrect reference for function [Miguel Casqueira]
>> 
> </details>
> 
> 
> ## meta-balena-2.53.6
> ### (2020-07-21)
> 
> * recipes-containers/balena: Use separate service for loading healthcheck image [Alexandru Costache]
> 
> ## meta-balena-2.53.5
> ### (2020-07-21)
> 
> 
> <details>
> <summary> balena-supervisor: Update to v11.9.6 [Rich Bayliss] </summary>
> 
>> ### balena-supervisor-11.9.6
>> #### (2020-07-20)
>> 
>> * Fix purge and restart invocations by providing instanced apps [Cameron Diver]
>> * Fix purge invocations of new singletons [Cameron Diver]
>> 
>> ### balena-supervisor-11.9.5
>> #### (2020-07-14)
>> 
>> * Update ESR version information [Cameron Diver]
>> 
> </details>
> 
> 
> ## meta-balena-2.53.4
> ### (2020-07-21)
> 
> * Add support for aufs5 on kernel 5.x variants [Florin Sarbu]
> * Force choosing busybox-hwclock over util-linux-hwclock [Alex Gonzalez]
> 
> ## meta-balena-2.53.3
> ### (2020-07-16)
> 
> * provisioning: provide base supervisor_version during provision [Matthew McGinn]
> 
> ## meta-balena-2.53.2
> ### (2020-07-16)
> 
> * Add LZ4 support config for older kernels [Alexandru Costache]
> 
> ## meta-balena-2.53.1
> ### (2020-07-14)
> 
> * Remove unnecessary config.json keys [Pagan Gazzard]
> 
> ## meta-balena-2.53.0
> ### (2020-07-14)
> 
> * resin-supervisor: Create required directories before launch [Alex Gonzalez]
> * Rebrand custom resin logos [Alex Gonzalez]
> * plymouth: Remove patch that sets plymouth resin theme [Alex Gonzalez]
> * docker-disk: Update dind container to v19.03.10 [Michal Toman]
> * docker-disk: Update to still supported dind container [Gergely Imreh]
> * Use udev for setting up wlan power management [Michal Toman]
> * Use --mount instead of --volume for bind mounts to the supervisor container. [Robert Günzler]
> 
> ## meta-balena-2.52.7
> ### (2020-07-13)
> 
> 
> <details>
> <summary> Update balena-supervisor from v11.9.3 to v11.9.4 [Rich Bayliss] </summary>
> 
>> ### balena-supervisor-11.9.4
>> #### (2020-07-13)
>> 
>> * bug: Fix unhandled promise rejection [Rich Bayliss]
>> 
> </details>
> 
> 
> ## meta-balena-2.52.6
> ### (2020-07-13)
> 
> * Update to use api v6 and fix a quoting bug [Pagan Gazzard]
> 
</details>

# v2.52.5+rev2
## (2020-07-12)

* Switch to kernel version 4.19.35 for imx8mm-var-dart-nrt [Florin Sarbu]

# v2.52.5+rev1
## (2020-07-10)


<details>
<summary> Update meta-balena from v2.52.4 to v2.52.5 [Florin Sarbu] </summary>

> ## meta-balena-2.52.5
> ### (2020-07-10)
> 
> * Allow comments in iptables ruleset [Alex Gonzalez]
> 
</details>

# v2.52.4+rev1
## (2020-07-10)


<details>
<summary> Update meta-balena from v2.51.8 to v2.52.4 [Florin Sarbu] </summary>

> ## meta-balena-2.52.4
> ### (2020-07-09)
> 
> 
> <details>
> <summary> Update balena-supervisor from v11.4.10 to v11.9.3 [Cameron Diver] </summary>
> 
>> ### balena-supervisor-11.9.3
>> #### (2020-07-08)
>> 
>> * Fix bug where a promise was not resolved in db-format [Cameron Diver]
>> * Convert deviceConfig module to a singleton [Cameron Diver]
>> 
>> ### balena-supervisor-11.9.2
>> #### (2020-07-06)
>> 
>> * avahi: Control with HOST_DISCOVERABILITY [Cameron Diver]
>> 
>> ### balena-supervisor-11.9.1
>> #### (2020-07-01)
>> 
>> * firewall: Add Host Firewall functionality [Rich Bayliss]
>> 
>> ### balena-supervisor-11.9.0
>> #### (2020-06-23)
>> 
>> * Added support for configuring FDT directive in extlinux.conf [Miguel Casqueira]
>> 
>> ### balena-supervisor-11.8.4
>> #### (2020-06-22)
>> 
>> * state: Report device MAC address to the API [Rich Bayliss]
>> 
>> ### balena-supervisor-11.8.3
>> #### (2020-06-18)
>> 
>> 
>> <details>
>> <summary> Update pinejs-client-request to 7.x [Pagan Gazzard] </summary>
>> 
>>> #### pinejs-client-request-7.0.0
>>> ##### (2020-06-16)
>>> 
>>> * Empty commit to attempt republish [Pagan Gazzard]
>>> * Switch from bluebird-lru-cache to lru-cache for caching [Pagan Gazzard]
>>> * Update target to es2018 [Pagan Gazzard]
>>> * Remove bluebird dependency [Pagan Gazzard]
>>> * Convert to async/await [Pagan Gazzard]
>>> 
>>> <details>
>>> <summary> Update to pinejs-client-core 6.x [Pagan Gazzard] </summary>
>>> 
>>>> ##### pinejs-client-js-6.0.0
>>>> ###### (2020-06-04)
>>>> 
>>>> * Increase minimum es version to es2015 [Pagan Gazzard]
>>>> * Convert to async/await [Pagan Gazzard]
>>>> * Remove now unnecessary PinejsClientCoreFactory [Pagan Gazzard]
>>>> * Switch to using native promises [Pagan Gazzard]
>>>> * Drop support for deprecated request overrides [Pagan Gazzard]
>>>> * Drop support for deprecated `query` method [Pagan Gazzard]
>>>> * Drop support for deprecated string based requests [Pagan Gazzard]
>>>> * Use `;` for expand options instead of `&` [Pagan Gazzard]
>>>> 
>>> </details>
>>> 
>>> 
>>> #### pinejs-client-request-6.2.0
>>> ##### (2020-06-08)
>>> 
>>> * Lazy load bluebird-lru-cache and lodash [Pagan Gazzard]
>>> 
>>> #### pinejs-client-request-6.1.4
>>> ##### (2020-06-08)
>>> 
>>> * Convert some lodash usage to native versions [Pagan Gazzard]
>>> 
>>> #### pinejs-client-request-6.1.3
>>> ##### (2020-06-04)
>>> 
>>> * Remove unused dependencies [Pagan Gazzard]
>>> 
>>> #### pinejs-client-request-6.1.2
>>> ##### (2020-06-02)
>>> 
>>> 
>>> <details>
>>> <summary> Update dependencies [Pagan Gazzard] </summary>
>>> 
>>>> ##### pinejs-client-js-5.8.0
>>>> ###### (2020-05-29)
>>>> 
>>>> * Generate optional builds for es2015/es2018 as well as the default es5 [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.7.1
>>>> ###### (2020-05-25)
>>>> 
>>>> * Update dependencies [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.7.0
>>>> ###### (2020-04-15)
>>>> 
>>>> * Make transformGetResult a method , to ease overriding the get method [Thodoris Greasidis]
>>>> 
>>> </details>
>>> 
>>> 
>>> #### pinejs-client-request-6.1.1
>>> ##### (2020-03-19)
>>> 
>>> * Add linting [Pagan Gazzard]
>>> 
>>> #### pinejs-client-request-6.1.0
>>> ##### (2020-03-19)
>>> 
>>> * Move require-npm4-to-publish to dev dependencies [Pagan Gazzard]
>>> 
>>> <details>
>>> <summary> Update dependencies [Pagan Gazzard] </summary>
>>> 
>>>> ##### typed-error-3.2.0
>>>> ###### (2019-11-20)
>>>> 
>>>> * update deps and specify minimum engine requirements [Will Boyce]
>>>> 
>>>> ##### pinejs-client-js-5.6.11
>>>> ###### (2020-02-21)
>>>> 
>>>> * 🐛: Fix missing `deprecated.getStringParams` function [Andreas Fitzek]
>>>> 
>>>> ##### pinejs-client-js-5.6.10
>>>> ###### (2020-02-14)
>>>> 
>>>> * Update to resin-lint 3.x [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.6.9
>>>> ###### (2020-02-14)
>>>> 
>>>> * CircleCI: Remove deploy job as it's handled by balenaCI [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.6.8
>>>> ###### (2020-02-14)
>>>> 
>>>> * Add the missing `method` on the post method [Thodoris Greasidis]
>>>> 
>>>> ##### pinejs-client-js-5.6.7
>>>> ###### (2020-02-14)
>>>> 
>>>> * Deprecate request overrides [Pagan Gazzard]
>>>> * Deprecate queries using a string url [Pagan Gazzard]
>>>> * Deprecate `query` in favor of `get` [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.6.6
>>>> ###### (2020-02-14)
>>>> 
>>>> * Allow resource/$count in $filter [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.6.5
>>>> ###### (2020-01-30)
>>>> 
>>>> * Remove `defaults` helper in favour of `??` [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.6.4
>>>> ###### (2020-01-30)
>>>> 
>>>> * Avoid allocations when destroying a poll [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.6.3
>>>> ###### (2020-01-30)
>>>> 
>>>> * Improve `RawFilter` typing [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.6.2
>>>> ###### (2020-01-29)
>>>> 
>>>> * Update dependencies [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.6.1
>>>> ###### (2020-01-22)
>>>> 
>>>> * Switch most CODEOWNERS entries to a team [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.6.0
>>>> ###### (2019-07-12)
>>>> 
>>>> * Add 'upsert' method supporting natural keys, requires Pinejs ^10.19.1 [Thodoris Greasidis]
>>>> 
>>>> ##### pinejs-client-js-5.5.4
>>>> ###### (2019-06-18)
>>>> 
>>>> * Remove unnecessary `string` type that is handled by the `Params` type [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.5.3
>>>> ###### (2019-06-18)
>>>> 
>>>> * Use an .npmrc to prevent creating a package-lock on each install [Thodoris Greasidis]
>>>> 
>>>> ##### pinejs-client-js-5.5.2
>>>> ###### (2019-06-10)
>>>> 
>>>> * Add some type casting so that it compiles on TypeScript 3.5 [Thodoris Greasidis]
>>>> 
>>>> ##### pinejs-client-js-5.5.1
>>>> ###### (2019-05-15)
>>>> 
>>>> * Fix downstream declaration creation errors due to `Dictionary` [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.5.0
>>>> ###### (2019-05-15)
>>>> 
>>>> * Add a prepare method that prepares a query into a function [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.4.1
>>>> ###### (2019-05-10)
>>>> 
>>>> * Add CODEOWNERS [Gergely Imreh]
>>>> 
>>>> ##### pinejs-client-js-5.4.0
>>>> ###### (2019-05-10)
>>>> 
>>>> * Add support for parameter aliases in resource ids [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.3.10
>>>> ###### (2019-05-10)
>>>> 
>>>> * Deduplicate transformation of GET results [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.3.9
>>>> ###### (2019-05-10)
>>>> 
>>>> * Simplify how we expose types, which means `subscribe` is now exposed [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.3.8
>>>> ###### (2019-05-09)
>>>> 
>>>> * Add automatic formatting via prettier [Pagan Gazzard]
>>>> 
>>>> ##### pinejs-client-js-5.3.7
>>>> ###### (2019-05-08)
>>>> 
>>>> * Remove node 4 build, add node 12 [Pagan Gazzard]
>>>> * Add .versionbot/CHANGELOG.yml for downstream changelogs [Pagan Gazzard]
>>>> 
>>> </details>
>>> 
>>> 
>>> #### pinejs-client-request-6.0.3
>>> ##### (2020-01-22)
>>> 
>>> * Add CODEOWNERS [Pagan Gazzard]
>>> 
>>> #### pinejs-client-request-6.0.2
>>> ##### (2019-05-08)
>>> 
>>> * Add node 12 tests [Pagan Gazzard]
>>> * Add upstream for pinejs-client-core [Pagan Gazzard]
>>> 
>>> #### pinejs-client-request-6.0.1
>>> ##### (2019-04-23)
>>> 
>>> * Update target to es2016, part of/fixing the typed-error bump [Pagan Gazzard]
>>> 
>>> #### pinejs-client-request-6.0.0
>>> ##### (2019-04-17)
>>> 
>>> * typed-error: Update to v3.1.0 [Will Boyce]
>>> 
>> </details>
>> 
>> 
>> ### balena-supervisor-11.8.2
>> #### (2020-06-17)
>> 
>> * Make service-manager module a singleton [Cameron Diver]
>> * Make volume-manager module a singleton [Cameron Diver]
>> * Make network-manager module a singleton [Cameron Diver]
>> * Add supervisor upgrade document [Hugh Brown]
>> 
>> ### balena-supervisor-11.8.1
>> #### (2020-06-16)
>> 
>> * Update webpack dependencies [Pagan Gazzard]
>> 
>> ### balena-supervisor-11.8.0
>> #### (2020-06-16)
>> 
>> * Use API v6 [Akis Kesoglou]
>> 
>> ### balena-supervisor-11.7.3
>> #### (2020-06-15)
>> 
>> * Db-format module code fixups [Cameron Diver]
>> 
>> ### balena-supervisor-11.7.2
>> #### (2020-06-11)
>> 
>> * Add label to expose gpu to container [Robert Günzler]
>> 
>> ### balena-supervisor-11.7.1
>> #### (2020-06-11)
>> 
>> * Move database app processing out to its own module [Cameron Diver]
>> * Make target-state-cache a singleton [Cameron Diver]
>> 
>> ### balena-supervisor-11.7.0
>> #### (2020-06-10)
>> 
>> * Respect an initialDeviceName field in the config.json [Cameron Diver]
>> 
>> ### balena-supervisor-11.6.6
>> #### (2020-06-10)
>> 
>> * Make images module a singleton [Cameron Diver]
>> 
>> ### balena-supervisor-11.6.5
>> #### (2020-06-09)
>> 
>> * fix: API auth missing on state GET/PATCH [Rich Bayliss]
>> 
>> ### balena-supervisor-11.6.4
>> #### (2020-06-08)
>> 
>> * Refactored @ts-ignore to @ts-expect-error in test file [Miguel Casqueira]
>> 
>> ### balena-supervisor-11.6.3
>> #### (2020-06-08)
>> 
>> * Make logger module a singleton [Cameron Diver]
>> * Fix exponential backoff for state polling [Pagan Gazzard]
>> 
>> ### balena-supervisor-11.6.2
>> #### (2020-06-08)
>> 
>> * Make the event-tracker module a singleton [Cameron Diver]
>> 
>> ### balena-supervisor-11.6.1
>> #### (2020-06-05)
>> 
>> * Convert all test files to TS and add .spec to all filenames [Miguel Casqueira]
>> * fix: Pin alpine python version [Rich Bayliss]
>> 
>> ### balena-supervisor-11.6.0
>> #### (2020-06-03)
>> 
>> * Isolate target state fetching to its own module which emits on update [Pagan Gazzard]
>> 
>> ### balena-supervisor-11.5.3
>> #### (2020-06-02)
>> 
>> * Make docker module a singleton [Cameron Diver]
>> 
>> ### balena-supervisor-11.5.2
>> #### (2020-06-02)
>> 
>> * Make the config module a singleton [Cameron Diver]
>> 
>> ### balena-supervisor-11.5.1
>> #### (2020-06-01)
>> 
>> * Remove unused dependencies and dedupe [Cameron Diver]
>> 
>> ### balena-supervisor-11.5.0
>> #### (2020-05-29)
>> 
>> * Refactor device-state healthchecks to log reason for failure [Miguel Casqueira]
>> 
>> ### balena-supervisor-11.4.17
>> #### (2020-05-29)
>> 
>> * Update dependencies [Pagan Gazzard]
>> 
>> ### balena-supervisor-11.4.16
>> #### (2020-05-29)
>> 
>> * Make the db module a singleton [Cameron Diver]
>> 
>> ### balena-supervisor-11.4.15
>> #### (2020-05-26)
>> 
>> * Check for ApiError before using it as such [Cameron Diver]
>> 
>> ### balena-supervisor-11.4.14
>> #### (2020-05-21)
>> 
>> * check for 409 status code, rather than string matching uuid conflicts [Cameron Diver]
>> 
>> ### balena-supervisor-11.4.13
>> #### (2020-05-21)
>> 
>> * Use safeStateClone to avoid call-stack exceeding errors [Cameron Diver]
>> 
>> ### balena-supervisor-11.4.12
>> #### (2020-05-19)
>> 
>> * Improved handling of invalid appId in V2 state endpoint [Miguel Casqueira]
>> 
>> ### balena-supervisor-11.4.11
>> #### (2020-05-18)
>> 
>> * Switch to balenaApi for the state patch as patching cannot be cached [Pagan Gazzard]
>> 
> </details>
> 
> 
> ## meta-balena-2.52.3
> ### (2020-07-09)
> 
> * systemd: Simplify zram swap unit dependencies to avoid ordering cycle [Alex Gonzalez]
> 
> ## meta-balena-2.52.2
> ### (2020-07-06)
> 
> * kernel-resin: Make USB_SERIAL and USB_SERIAL_GENERIC built-ins [Alex Gonzalez]
> * kernel-resin: Fix configuration warnings from newer kernels [Alex Gonzalez]
> * kernel-resin: Update balena kernel configuration for updated engine [Alex Gonzalez]
> 
> ## meta-balena-2.52.1
> ### (2020-07-02)
> 
> * Fix up UUID variable when communicating with API [Matthew McGinn]
> 
> ## meta-balena-2.52.0
> ### (2020-06-30)
> 
> * Add compressed memory swap support [Alex Gonzalez]
> * systemd-zram-swap: Add compressed memory swap support [Alex Gonzalez]
> * kernel-resin: Built-in zram configuration [Alex Gonzalez]
> 
</details>

# v2.51.8+rev5
## (2020-07-10)

* Disable GPU for imx8mm-var-dart-nrt as requested by customer [Florin Sarbu]

# v2.51.8+rev4
## (2020-07-10)

* Correctly disable CQE for imx8mm-var-dart-nrt [Florin Sarbu]

# v2.51.8+rev3
## (2020-07-09)

* Disable CQE for imx8mm-var-dart-nrt [Florin Sarbu]

# v2.51.8+rev2
## (2020-07-09)

* Revert "u-boot: Switch to DDR for the M4 load address" so that customer can use spi [Florin Sarbu]

# v2.51.8+rev1
## (2020-07-08)

* Add the real-time kernel patch for imx8mm-var-dart-nrt [Florin Sarbu]
* Update balena-yocto-scripts to v1.8.0 [Florin Sarbu]

<details>
<summary> Update meta-balena from v2.51.1 to v2.51.8 [Florin Sarbu] </summary>

> ## meta-balena-2.51.8
> ### (2020-06-30)
> 
> * resin-ntp-config: merge 'burst' command with 'add server' line [Mark Corbin]

> ## meta-balena-2.51.7
> ### (2020-06-25)
> 
> * resin-image: Install extra_uEnv.txt in boot partition [Alexandru Costache]

> ## meta-balena-2.51.6
> ### (2020-06-25)
> 
> * initrdscripts: rootfs: Fix comparison to account for empty variable [Alex Gonzalez]
> * Use UUID rather than ID when communicating with API [Matthew McGinn]

> ## meta-balena-2.51.5
> ### (2020-06-18)
> 
> * Set chrony default servers as pools [Matthew McGinn]

> ## meta-balena-2.51.4
> ### (2020-06-15)
> 
> * Generate nested changelogs for balena-engine [Robert Günzler]

> ## meta-balena-2.51.3
> ### (2020-06-10)
> 
> * Revert allowing local resin-supervisor image updates [Alex Gonzalez]

> ## meta-balena-2.51.2
> ### (2020-06-08)
> 
> * Disable u-boot console, silence u-boot in production builds [Florin Sarbu]
</details>

# v2.51.1+rev2
## (2020-06-19)

* Switch to DDR for the M4 load address on the imx8mm-var-dart-nrt machine [Alexandru Costache]

# v2.51.1+rev1
## (2020-06-18)

* linux-variscite: Add GPIO5_IO9 as ecspi chipselect [Alexandru Costache]

<details>
<summary> Update meta-balena from v2.50.1 to v2.51.1 [Alexandru Costache] </summary>

> ## meta-balena-2.51.1
> ### (2020-06-04)
> 
> * openvpn: Add runtime dependency on bash [Willem Remie]

> ## meta-balena-2.51.0
> ### (2020-06-03)
> 
> * balena-engine: Update to 19.03.13 [Robert Günzler]

> ## meta-balena-2.50.4
> ### (2020-06-02)
> 
> * Use correct SRC_URI for bindmount [Florin Sarbu]

> ## meta-balena-2.50.3
> ### (2020-06-01)
> 
> * os-helpers-fs: Fix shellcheck warnings [Alex Gonzalez]
> * Fallback to label root device matching to support devices with closed source bootloaders [Alex Gonzalez]
> * Fallback to labels and partlabels for devices with custom HUPs [Alex Gonzalez]

> ## meta-balena-2.50.2
> ### (2020-05-27)
> 
> * Enable the Analog Devices AD5446 kernel driver [Florin Sarbu]
</details>

# v2.50.1+rev1
## (2020-05-22)

* imx8mm-var-dart-nrt: Add coffee file [Alexandru Costache]
* imx8mm-var-dart-plt: Update with custom icon [Alexandru Costache]
* Update balena-yocto-scripts to v1.7.2 [Alexandru Costache]

<details>
<summary> Update meta-balena from v2.48.0 to v2.50.1 [Alexandru Costache] </summary>

> ## meta-balena-2.50.1
> ### (2020-05-21)
> 
> * networkmanager: Remove build warning [Alex Gonzalez]
> * Remove busybox-syslog to use only systemd's journald [Alex Gonzalez]
> * Update CODEOWNERS [Alex Gonzalez]
> * Backport NM patch for setting modem MTU correctly [Florin Sarbu]
> * update-resin-supervisor: short circuit if remote image cannot be fetched [Matthew McGinn]
> 
<details>
<summary> Update balena-supervisor from v11.4.1 to v11.4.10 [Cameron Diver] </summary>

>> ### balena-supervisor-11.4.10
>> #### (2020-05-18)
>> 
>> * Fix leftover spurious return from typescript conversion [Cameron Diver]

>> ### balena-supervisor-11.4.9
>> #### (2020-05-18)
>> 
>> * Catch errors in the target state poll so polling will always continue [Pagan Gazzard]

>> ### balena-supervisor-11.4.8
>> #### (2020-05-18)
>> 
>> * Avoid querying `instantUpdates` on every state poll [Pagan Gazzard]

>> ### balena-supervisor-11.4.7
>> #### (2020-05-16)
>> 
>> * Fix default request options [Pagan Gazzard]

>> ### balena-supervisor-11.4.6
>> #### (2020-05-15)
>> 
>> * Remove CoffeeScript tests and all CoffeeScript tools [Miguel Casqueira]

>> ### balena-supervisor-11.4.5
>> #### (2020-05-15)
>> 
>> * Update to @balena/lint 5.x [Pagan Gazzard]

>> ### balena-supervisor-11.4.4
>> #### (2020-05-15)
>> 
>> * Add a random offset to the poll interval with each poll [Cameron Diver]

>> ### balena-supervisor-11.4.3
>> #### (2020-05-14)
>> 
>> * Cache service names in local log backend [Cameron Diver]

>> ### balena-supervisor-11.4.2
>> #### (2020-05-13)
>> 
>> * Update engine information in package.json [Cameron Diver]
</details>

> 

> ## meta-balena-2.50.0
> ### (2020-05-13)
> 
> * Use /tmp as bootparam_root storage [Alex Gonzalez]
> * Update to libqmi v1.24.10 [Michal Toman]
> * Set rust 1.36 as the preferred rust version from meta-balena-common [Zubair Lutfullah Kakakhel]
> * Turn off wlan0 power save [Michal Toman]
> 
<details>
<summary> Update os-config from 1.1.3 to 1.1.4 [Alex Gonzalez] </summary>

>> ### os-config-1.1.4
>> #### (2020-05-13)
>> 
>> * versionbot: Add changelog yml file [Alex Gonzalez]
</details>

> 
> 
<details>
<summary> Update balena-supervisor from v11.3.0 to v11.4.1 [Cameron Diver] </summary>

>> ### balena-supervisor-11.4.1
>> #### (2020-05-12)
>> 
>> * Correctly check if value is a valid Integer [Miguel Casqueira]

>> ### balena-supervisor-11.4.0
>> #### (2020-05-12)
>> 
>> * Added endpoint to check if VPN is connected [Miguel Casqueira]

>> ### balena-supervisor-11.3.11
>> #### (2020-05-11)
>> 
>> * Fixed stubs for test suite [Miguel Casqueira]

>> ### balena-supervisor-11.3.10
>> #### (2020-05-11)
>> 
>> * Added more documentation to help new contributors start developing [Miguel Casqueira]

>> ### balena-supervisor-11.3.9
>> #### (2020-05-11)
>> 
>> * Fix dindctl script and update balenaos-in-container [Cameron Diver]

>> ### balena-supervisor-11.3.8
>> #### (2020-05-08)
>> 
>> * Remove unnecessary config.json keys [Pagan Gazzard]

>> ### balena-supervisor-11.3.7
>> #### (2020-05-08)
>> 
>> * CI: Use node 12 for tests to match runtime version [Pagan Gazzard]
>> * CI: Use docker 18 client to match remote [Pagan Gazzard]

>> ### balena-supervisor-11.3.6
>> #### (2020-05-07)
>> 
>> * Move SupervisorAPI state change logs to appropriate functions [Miguel Casqueira]

>> ### balena-supervisor-11.3.5
>> #### (2020-05-07)
>> 
>> * Add 20k-ultra to codeowners [Miguel Casqueira]

>> ### balena-supervisor-11.3.4
>> #### (2020-05-06)
>> 
>> * Don't use the openvpn alias to check VPN status [Cameron Diver]

>> ### balena-supervisor-11.3.3
>> #### (2020-05-06)
>> 
>> * Use lstat rather than stat to avoid error with symlinks in sync [Cameron Diver]

>> ### balena-supervisor-11.3.2
>> #### (2020-05-05)
>> 
>> * Move build files into build-conf and rename to build-utils [Cameron Diver]
>> * Fix knex migration require translation [Cameron Diver]

>> ### balena-supervisor-11.3.1
>> #### (2020-05-05)
>> 
>> * Remove legacy fallback to DROP rule in iptables [Cameron Diver]
>> * Add an ESTABLISHED flag to API iptables rules [Cameron Diver]
>> * Add ESR information to repo.yml [Cameron Diver]
</details>

> 
> 
<details>
<summary> Update balena-supervisor from v10.11.0 to v11.3.0 [Cameron Diver] </summary>

>> ### balena-supervisor-11.3.0
>> #### (2020-05-04)
>> 
>> * Added Bearer Authorization spec [Miguel Casqueira]

>> ### balena-supervisor-11.2.0
>> #### (2020-04-30)
>> 
>> * Added explanation README for running specific tests [Miguel Casqueira]

>> ### balena-supervisor-11.1.11
>> #### (2020-04-28)
>> 
>> * Remove coverage running and modules [Cameron Diver]

>> ### balena-supervisor-11.1.10
>> #### (2020-04-27)
>> 
>> * Update balena-register-device to fix provisioning [Cameron Diver]

>> ### balena-supervisor-11.1.9
>> #### (2020-04-22)
>> 
>> * Added protocol to semver.org link [Miguel Casqueira]

>> ### balena-supervisor-11.1.8
>> #### (2020-04-21)
>> 
>> * Actually remove dbus-native dependency [Cameron Diver]

>> ### balena-supervisor-11.1.7
>> #### (2020-04-21)
>> 
>> * Fix livepush predicate for POSIX sh in entry.sh [Cameron Diver]

>> ### balena-supervisor-11.1.6
>> #### (2020-04-21)
>> 
>> * Remove double printing of API status error [Cameron Diver]

>> ### balena-supervisor-11.1.5
>> #### (2020-04-15)
>> 
>> * ⤴️ Upgrade migrations to work with knex [Cameron Diver]
>> * 📄 Upgrade knex to avoid CVE-2019-10757 [Cameron Diver]

>> ### balena-supervisor-11.1.4
>> #### (2020-04-14)
>> 
>> * 🔎 Also watch js files during livepush [Cameron Diver]
>> * Clear changed files after successful livepush invocation [Cameron Diver]
>> * Use livepush commands for copying and running dev specific steps [Cameron Diver]

>> ### balena-supervisor-11.1.3
>> #### (2020-04-13)
>> 
>> * 🚀 Update supervisor to node12 [Cameron Diver]

>> ### balena-supervisor-11.1.2
>> #### (2020-04-13)
>> 
>> * Move from dbus-native to dbus [Cameron Diver]

>> ### balena-supervisor-11.1.1
>> #### (2020-04-10)
>> 
>> * Update copy-webpack-plugin [Pagan Gazzard]
>> * Update ts-loader to 6.x [Pagan Gazzard]
>> * Update fork-ts-checker-webpack-plugin to 4.x [Pagan Gazzard]

>> ### balena-supervisor-11.1.0
>> #### (2020-04-09)
>> 
>> * Support matching on device type within contracts [Cameron Diver]

>> ### balena-supervisor-11.0.9
>> #### (2020-04-08)
>> 
>> * Workaround a circular dependency [Pagan Gazzard]

>> ### balena-supervisor-11.0.8
>> #### (2020-04-08)
>> 
>> * Link sqlite with a system sqlite for quicker builds [Cameron Diver]

>> ### balena-supervisor-11.0.7
>> #### (2020-04-08)
>> 
>> * Convert application-manager.coffee to javascript [Pagan Gazzard]

>> ### balena-supervisor-11.0.6
>> #### (2020-04-08)
>> 
>> * Don't sync test files with livepush [Cameron Diver]

>> ### balena-supervisor-11.0.5
>> #### (2020-04-07)
>> 
>> * Add newTargetState event and use it for backup loading [Cameron Diver]

>> ### balena-supervisor-11.0.4
>> #### (2020-04-07)
>> 
>> * Don't wrap UpdatesLockedErrors with a detailed error [Cameron Diver]

>> ### balena-supervisor-11.0.3
>> #### (2020-04-07)
>> 
>> * Allow spaces in volume definitions [Cameron Diver]

>> ### balena-supervisor-11.0.2
>> #### (2020-04-06)
>> 
>> * Update to balena-register-device 6.0.1 [Pagan Gazzard]

>> ### balena-supervisor-11.0.1
>> #### (2020-04-06)
>> 
>> * Don't mangle names when minimising with webpack [Cameron Diver]

>> ### balena-supervisor-11.0.0
>> #### (2020-04-06)
>> 
>> * ⚡ Update synchronisation scripts for supervisor development [Cameron Diver]
>> * 🔧 Move to an alpine base image and drop i386-nlp support [Cameron Diver]

>> ### balena-supervisor-10.11.3
>> #### (2020-04-02)
>> 
>> * Convert test/18-startup.coffee to typescript [Pagan Gazzard]
>> * Convert test/19-compose-utils.coffee to javascript [Pagan Gazzard]
>> * Convert test/18-compose-network.coffee to javascript [Pagan Gazzard]
>> * Convert test/17-config-utils.spec.coffee to javascript [Pagan Gazzard]
>> * Convert test/16-ports.spec.coffee to typescript [Pagan Gazzard]
>> * Convert test/15-conversions.spec.coffee to javascript [Pagan Gazzard]
>> * Convert test/12-logger.spec.coffee to javascript [Pagan Gazzard]

>> ### balena-supervisor-10.11.2
>> #### (2020-03-31)
>> 
>> * Pass in deviceId when fetching device tags [Cameron Diver]

>> ### balena-supervisor-10.11.1
>> #### (2020-03-30)
>> 
>> * 🔧 Update resin-lint -> balena-lint in lintstaged [Cameron Diver]
</details>

> 
> 
<details>
<summary> Update os-config from 1.1.1 to 1.1.3 [Zubair Lutfullah Kakakhel] </summary>

>> ### os-config-1.1.3
>> #### (2020-03-24)
>> 
>> * Reorder module dependencies [Zahari Petkov]
>> * Pin serde version to v1.0.94 [Zahari Petkov]

>> ### os-config-1.1.2
>> #### (2020-02-04)
>> 
>> * Block on random until success [Zahari Petkov]
>> * Use parse_filters instead of parse [Zubair Lutfullah Kakakhel]
</details>

> 

> ## meta-balena-2.49.0
> ### (2020-05-01)
> 
> * balena-host: Ignore environment file if it does not exist [Alex Gonzalez]
> * Bump balena-engine to 18.09.17 [Robert Günzler]
> * networkmanager: Use absolute path in drop-in [Sven Schwermer]
> * Update ModemManager to v1.12.8 [Michal Toman]
> * Update balena-engine to 18.09.16 [Robert Günzler]
> * Add support for using udev by-state links in balenaOS [Alex Gonzalez]
> * Add initramfs module to regenerate default filesystem UUIDs [Alex Gonzalez]
> * Create udev state symlinks for all partitions [Alex Gonzalez]
> * initramfs-framework: Add os-helpers to module prepare [Alex Gonzalez]
> * Fix initramfs fsck warnings for the boot partition [Andrei Gherzan]
> * Switch to built-in FAT kernel configs [Andrei Gherzan]
> 
<details>
<summary> Update balena-supervisor from v10.8.0 to v10.11.0 [Cameron Diver] </summary>

>> ### balena-supervisor-10.11.0
>> #### (2020-03-30)
>> 
>> * Add BALENA_DEVICE_ARCH environment variable for containers [Cameron Diver]

>> ### balena-supervisor-10.10.15
>> #### (2020-03-30)
>> 
>> * Don't throw an error when getting an unhealthy state [Cameron Diver]

>> ### balena-supervisor-10.10.14
>> #### (2020-03-28)
>> 
>> * Convert src/device-api/common.coffee to javascript [Pagan Gazzard]

>> ### balena-supervisor-10.10.13
>> #### (2020-03-27)
>> 
>> * Switch to mz for the proxyvisor [Pagan Gazzard]
>> * Convert proxyvisor to javascript [Pagan Gazzard]

>> ### balena-supervisor-10.10.12
>> #### (2020-03-26)
>> 
>> * Remove unnecessary code from application-manager [Pagan Gazzard]
>> * Switch to a named export for application-manager [Pagan Gazzard]

>> ### balena-supervisor-10.10.11
>> #### (2020-03-25)
>> 
>> * Convert device-api/v1 to javascript [Pagan Gazzard]

>> ### balena-supervisor-10.10.10
>> #### (2020-03-24)
>> 
>> * Update livepush [Cameron Diver]

>> ### balena-supervisor-10.10.9
>> #### (2020-03-24)
>> 
>> * Add type checking for javascript files [Pagan Gazzard]

>> ### balena-supervisor-10.10.8
>> #### (2020-03-24)
>> 
>> * Pin resin-cli-visuals to avoid build error of lzma-native [Cameron Diver]
>> * Update dependencies [Cameron Diver]

>> ### balena-supervisor-10.10.7
>> #### (2020-03-24)
>> 
>> * Avoid any transpilation of node_modules [Pagan Gazzard]

>> ### balena-supervisor-10.10.6
>> #### (2020-03-24)
>> 
>> * Add transpilation for javascript files to ease node 6 compatibility [Pagan Gazzard]
>> * Add a precheck that linting/tests work on node 10 [Pagan Gazzard]
>> * Update to balena-lint and enable javascript linting [Pagan Gazzard]

>> ### balena-supervisor-10.10.5
>> #### (2020-03-23)
>> 
>> * Tests: Add missing await [Pagan Gazzard]

>> ### balena-supervisor-10.10.4
>> #### (2020-03-16)
>> 
>> * docs: Clarify update locks for multicontainer applications [Gareth Davies]

>> ### balena-supervisor-10.10.3
>> #### (2020-03-16)
>> 
>> * logging: fix up some typos [Matthew McGinn]

>> ### balena-supervisor-10.10.2
>> #### (2020-03-16)
>> 
>> * Bump acorn from 5.7.3 to 5.7.4 [dependabot[bot]]

>> ### balena-supervisor-10.10.1
>> #### (2020-03-13)
>> 
>> * Update dependencies [Pagan Gazzard]

>> ### balena-supervisor-10.10.0
>> #### (2020-03-06)
>> 
>> * Allow semver comparison on l4t versions in contracts [Cameron Diver]
>> * Allow l4t versions with three numbers as well as two [Cameron Diver]

>> ### balena-supervisor-10.9.2
>> #### (2020-03-05)
>> 
>> * config: Support loading SSDT via ConfigFS [Rich Bayliss]

>> ### balena-supervisor-10.9.1
>> #### (2020-02-25)
>> 
>> * Convert device-state module to typescript [Cameron Diver]
>> * Improve application-manager typings [Cameron Diver]
>> * Improve and extend internal typings [Cameron Diver]

>> ### balena-supervisor-10.9.0
>> #### (2020-02-24)
>> 
>> * Add a containerId request parameter for journal-logs api endpoint, and pass it along to journalctl process options. [Ivan]
</details>

> 
</details>

# v2.48.0+rev3
## (2020-05-12)

* Set private to false in .coffee files for the public device types [Florin Sarbu]

# v2.48.0+rev2
## (2020-04-14)

* imx8mm-var-dart-plt: Remove unnecessary step from coffee file [Alexandru Costache]

# v2.48.0+rev1
## (2020-04-13)

* Do not use wireless-regdb-static until we move to kernel >= 4.15 [Alexandru Costache]
* Update balena-yocto-scripts to v1.5.6 [Alexandru Costache]
* u-boot: Implement support for querying boot switch [Alexandru Costache]

<details>
<summary> Update meta-balena from v2.47.1 to v2.48.0 [Alexandru Costache] </summary>

> ## meta-balena-2.48.0
> ### (2020-03-20)
> 
> * Add the linux-firmware recipe from the Poky zeus-22.0.1 release and package various iwlwifi firmware separately [Florin Sarbu]
> * Add regulatory.db (Wireless Central Regulatory Domain Database) to rootfs so kernel versions >= v4.15 can load it (for Poky Thud and Warrior based board) [Florin Sarbu]
> * Do not send SIGKILL directly to user containers (set KillMode=process in balena.service) [Florin Sarbu]
> * Update balena-supervisor from  to v10.8.0 [Cameron Diver]
> * Update config.json documentation for disabling NM connectivity checks [Gareth Davies]
> * Fix a typo in a NetworkManager plugin path [Zubair Lutfullah Kakakhel]
> * Remove unnecessary openvpn v2.4.4 recipe in meta-resin-pyro. [Zubair Lutfullah Kakakhel]
> * Use a weak default assignment in a recipe for customer trying to override a variable in his layer [Zubair Lutfullah Kakakhel]
</details>

# v2.47.1+rev2
## (2020-02-28)

* conf/layer: Fix imx8mm-var-dart BT issues [Alexandru Costache]

# v2.47.1+rev1
## (2020-02-25)


<details>
<summary> Update meta-balena from v2.47.0 to v2.47.1 [Alexandru Costache] </summary>

> ## meta-balena-2.47.1
> ### (2020-02-13)
> 
> * Affects 2.45+ on all devices. Fix dangling sshd services on failed connections that would grow and cause cpu load to keep rising. See issue 1837 in meta-balena for more detail. [Zubair Lutfullah Kakakhel]
</details>

# v2.47.0+rev1
## (2020-02-11)

* Update balena-yocto-scripts to v1.5.4 [Florin Sarbu]

<details>
<summary> Update meta-balena from v2.44.0 to v2.47.0 [Florin Sarbu] </summary>

> ## meta-balena-2.47.0
> ### (2020-01-29)
> 
> * Update usb-modeswitch-data to version 20191128 [Florin Sarbu]
> * Update usb-modeswitch to version 2.5.2 [Florin Sarbu]
> * Update to ModemManager v1.12.4 [Florin Sarbu]
> * Update libmbim to version 1.22.0 [Florin Sarbu]
> * Update libqmi to version 1.24.4 [Florin Sarbu]
> * Add periodic vacuuming of journald log files [Alex Gonzalez]
> * No user impact. Increase limit for maximum initramfs size from 12MB to 32MB. This helps reduce unnecessary overrides in integration layers. [Zubair Lutfullah Kakakhel]
> * Match licenses with license files. [Alex Gonzalez]
> * Enable sixaxis support in bluez5 [Alexis Svinartchouk]
> * Addressing review comments [Gareth Davies]
> * Update config.json documentation [Gareth Davies]
> * Increase DNS clients timeout to 15 seconds [Alex Gonzalez]
> * Fix supervisor nested changelogs [Zubair Lutfullah Kakakhel]
> * Enable memory overcommit [Alex Gonzalez]
> * Add uinput kernel module [Florin Sarbu]
> * Make sure to add in rootfs the wifi firmware for wl18xx [Florin Sarbu]
> * Add supported USB WiFi dongle [Vicentiu Galanopulo]

> ## meta-balena-2.46.2
> ### (2020-01-17)
> 
> * Americanize the README.md [Matthew McGinn]

> ## meta-balena-2.46.1
> ### (2020-01-01)
> 
> * Disable by default the option to stop u-boot autoboot by pressing CTRL+C in all OS versions [Florin Sarbu]
> * Increase NTP polling time to around 4.5 hours. [Alex Gonzalez]
> * Disable the option to stop u-boot autoboot by pressing CTRL+C in production OS version [Florin Sarbu]

> ## meta-balena-2.46.0
> ### (2019-12-23)
> 
> * Update to ModemManager v1.12.2 [Zahari Petkov]
> * Update libmbim to version 1.20.2 [Zahari Petkov]
> * Update libqmi to version 1.24.2 [Zahari Petkov]
> * Update balena-supervisor to v10.6.27 [Cameron Diver]
> * Tweak how the flasher asserts that internal media is valid for being installed balena OS on [Florin Sarbu]
> * Remove networkmanager stale temporary files at startup [Alex Gonzalez]
> * networkmanager: Rework patches to remove fuzzing [Alex Gonzalez]
> * Update openvpn to v2.4.7 [Will Boyce]
> * Enable kernel configs for USB_SERIAL, USB_SERIAL_PL2303 and HFS for all devices [Zubair Lutfullah Kakakhel]
> * image-resin.bbclass: Mark do_populate_lic_deploy with nostamp [Zubair Lutfullah Kakakhel]
> * Namespace the hello-world healthcheck image [Zubair Lutfullah Kakakhel]
> * Update balena-supervisor to v10.6.17 [Cameron Diver]
> * Update balena-supervisor to v10.6.13 [Cameron Diver]
> * Update CODEOWNERS [Zubair Lutfullah Kakakhel]

> ## meta-balena-2.45.1
> ### (2019-11-21)
> 
> * Fix for a race condition where occasionally the supervisor might not be able to come up during boot. Also can be caused by using io.balena.features.balena-socket and app container restart always policy. Affects meta-balena 2.44.0 and 2.45.0. To be fixed in 2.44.1 and 2.46.0 [Zubair Lutfullah Kakakhel]
> * Rename resin to balena where possible [Pagan Gazzard]
> * Add leading new line for PACKAGE_INSTALL variable [Vicentiu Galanopulo]
> * Set `net.ipv4.ip_local_port_range` to recommended range (49152-65535) [Will Boyce]
> * No user impact, subtle fix in rollback version checks [Zubair Lutfullah Kakakhel]

> ## meta-balena-2.45.0
> ### (2019-10-30)
> 
> * Increase persistent journal size to 32M [Will Boyce]
> * Move persistent logs from state to data partition [Will Boyce]
> * Add wpa-supplicant recipe and update to v2.9 [Will Boyce]
> * Improve robustness by making variou services restart if they stop for some reason [Zubair Lutfullah Kakakhel]
> * Build net/dummy as module [Alexandru Costache]
</details>

# v2.44.0+rev7
## (2020-02-11)

* Update meta-rust to include 1.36 [Zubair Lutfullah Kakakhel]

# v2.44.0+rev6
## (2020-02-04)

* Cleanup unnecessary use of IMAGE_ROOTFS_MAXSIZE [Zubair Lutfullah Kakakhel]

# v2.44.0+rev5
## (2020-01-22)

* Remove the usb-modeswitch patch that fixes crashes on 64 bits architectures [Florin Sarbu]

# v2.44.0+rev4
## (2020-01-15)

* Change the state to 'released' in the coffee file [Vicentiu Galanopulo]

# v2.44.0+rev3
## (2019-11-19)

* Update balena-yocto-scripts to v1.5.2 [Florin Sarbu]

# v2.44.0+rev2
## (2019-10-24)

* Update balena-yocto-scripts to v1.4.0 [Florin Sarbu]

# v2.44.0+rev1
## (2019-10-10)

* Update the meta-balena submodule from v2.43.0 to v2.44.0 [Vicentiu Galanopulo]

# v2.43.0+rev1
## (2019-10-02)

* Update the meta-balena submodule from v2.38.3 to v2.43.0 [Vicentiu Galanopulo]

# v2.38.3+rev1
## (2019-07-16)

* Update the balena-yocto-scripts submodule to v1.3.5 [Florin Sarbu]

<details>
<summary> Update meta-balena from v2.38.1 to v2.38.3 [Florin Sarbu] </summary>

> ## meta-balena-2.38.3
> ### (2019-07-10)
> 
> * resin-proxy-config: fix up incorrect bash subshell command [Matthew McGinn]

> ## meta-balena-2.38.2
> ### (2019-06-27)
> 
> * Update to kernel-modules-headers v0.0.20 to fix missing target modpost binary on kernel 5.0.3 [Florin Sarbu]
> * Update to kernel-modules-headers v0.0.19 to fix target objtool compile issue on kernel 5.0.3 [Florin Sarbu]
</details>

# v2.38.1+rev2
## (2019-07-09)

* Patches for TCP-based remote denial of service vulnerabilities [Vicentiu Galanopulo]

# v2.38.1+rev1
## (2019-06-21)

* Update the balena-yocto-scripts submodule to v1.2.1 [Alexandru Costache]
* Update meta-balena from v2.38.0 to v2.38.1 [Alexandru Costache]

# v2.38.0+rev1
## (2019-06-17)

* Update rust to 1.33 [Alexandru Costache]
* Update repo.yml to be able to trigger VersionBot with `meta-balena` [Alexandru Costache]
* Update the balena-yocto-scripts submodule to v1.2.0 [Alexandru Costache]
* Update meta-balena from v2.31.5 to v2.38.0 [Alexandru Costache]
* Rename meta-resin to meta-balena in repository [Alexandru Costache]
* Change the poky submodule to our github mirror [Alexandru Costache]

# v2.31.5+rev2
## (2019-04-04)

* resin-info.bbappend: Display BalenaOS ASCII logo [Alexandru Costache]

# v2.31.5+rev1
## (2019-03-22)

* Update meta-resin from v2.31.3 to v2.31.5 [Florin Sarbu]

<details>
<summary> View details </summary>

## meta-resin-2.31.5
### (2019-03-21)

* Update resin-supervisor to v9.11.3 [Andrei Gherzan]

## meta-resin-2.31.4
### (2019-03-20)

* resin-supervisor: Recreate on start if config has changed [Rich Bayliss]
</details>

* Update meta-resin from v2.31.2 to v2.31.3 [Florin Sarbu]

<details>
<summary> View details </summary>

## meta-resin-2.31.3
### (2019-03-20)

* Update resin-supervisor to v9.11.2 [Pablo Carranza Velez]
</details>

# v2.31.2+rev1
## (2019-03-20)

* Update meta-resin from v2.31.1 to v2.31.2 [Florin Sarbu]

<details>
<summary> View details </summary>

## meta-resin-2.31.2
### (2019-03-19)

* Update resin-supervisor to v9.11.1 [Pablo Carranza Velez]
</details>

# v2.31.1+rev1
## (2019-03-19)

* conf/samples: Added conf samples files [Alexandru Costache]
* Added imx8m-var-dart coffee file [Alexandru Costache]
* Added license file [Alexandru Costache]
