# Changelog

This project does NOT follow semantic versioning. The version increases as
follows:

1. Major version updates are breaking updates to the build infrastructure.
   These should be very rare.
2. Minor version updates are made for every major Buildroot release. This
   may also include Erlang/OTP and Linux kernel updates. These are made four
   times a year shortly after the Buildroot releases.
3. Patch version updates are made for Buildroot minor releases, Erlang/OTP
   releases, and Linux kernel updates. They're also made to fix bugs and add
   features to the build infrastructure.

## v0.6.2

* Updated dependencies
  * [nerves_system_br v1.18.3](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.18.3)

* Changes
  * Programs that use OpenMP will run now. The OpenMP shared library
    (`libgomp.so`) was supplied by the toolchain, but not copied.

## v0.6.1

This release updates to Buildroot 2021.11 and OTP 24.2. If you have made a
custom system, please review the `nerves_system_br` [release
notes](https://github.com/nerves-project/nerves_system_br/blob/v1.18.2/CHANGELOG.md#v1180).

* Updated dependencies
  * [nerves_system_br v1.18.2](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.18.2)
  * [Buildroot 2021.11](http://lists.busybox.net/pipermail/buildroot/2021-December/629911.html)
  * [Erlang/OTP 24.2](https://erlang.org/download/OTP-24.2.README)
  * GCC 10.3

* Improvements
  * Support for the `dl.nerves-project.org` backup site. Due to a GitHub outage
    in November, there was a 2 day period of failing builds since some packages
    could not be downloaded. We implemented the backup site to prevent this in
    the future. This update is in the `nerves_defconfig`.
  * Use new build ORB on CircleCI. This ORB will shorten build times to fit in
    CircleCI's new free tier limits. Please update if building your own systems.

## v0.6.0

Use v0.6.1 instead.

## v0.5.4

* Updated dependencies
  * [nerves_system_br v1.17.4](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.17.4)
  * [Buildroot 2021.08.2](http://lists.busybox.net/pipermail/buildroot/2021-November/628323.html)
  * [Erlang/OTP 24.1.7](https://erlang.org/download/OTP-24.1.7.README).

## v0.5.3

* Updated dependencies
  * [nerves_system_br v1.17.3](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.17.3)
  * [Erlang/OTP 24.1.4](https://erlang.org/download/OTP-24.1.4.README).

## v0.5.2

This is a security/bug fix patch release. It should be safe to update for
everyone.

* Updated dependencies
  * [nerves_system_br v1.17.1](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.17.1)
  * [Buildroot 2021.08.1](http://lists.busybox.net/pipermail/buildroot/2021-October/625642.html)
  * [Erlang/OTP 24.1.2](https://erlang.org/download/OTP-24.1.2.README)

* Improvements
  * Include software versioning and licensing info (see legal-info directory in
    artifact)

## v0.5.1

This fixes a regression that happened when the toolchain was updated to require
Linux kernel headers newer than the kernel used in this project. Rather than
holding the kernel version back, I updated it to Linux 5.10. This is beyond what
Seeed supports (4.19), but it's 2021 and Linux 5.10 appears to work well.

* Updated dependencies
  * Linux 5.10.59

## v0.5.0

This release updates to Buildroot 2021.08 and OTP 24.1. If you have made a
custom system off this one, please review the `nerves_system_br v1.17.0` release
notes.

* Updated dependencies
  * [nerves_system_br v1.17.0](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.17.0)
  * [Buildroot 2021.08](http://lists.busybox.net/pipermail/buildroot/2021-September/622072.html)
  * [Erlang/OTP 24.1](https://erlang.org/download/OTP-24.1.README)

## v0.4.2

This release updates Erlang/OTP from 24.0.3 to 24.0.5 and Buildroot from 2021.05
to 2021.05.1. Both of these are security/bug fix updates. This is expected to be
a safe upgrade from v1.16.1 for all users.

* Updated dependencies
  * [nerves_system_br v1.16.4](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.16.1)
  * [Erlang/OTP 24.0.5](https://erlang.org/download/OTP-24.0.5.README)

* Improvements
  * Beta support for using a `runtime.exs` script for runtime configuration.
  * Added a `provision` task to the `fwup.config` to enable re-provisioning a
    MicroSD card without changing its contents.
  * Adds a default `/etc/sysctl.conf` that enables use of ICMP in Erlang. This
    requires `nerves_runtime v0.11.5` or later to automatically load the sysctl
    variables. With it using `:gen_udp` to send/receive ICMP will "just work".
    It also makes it easier to add other sysctl variables if needed.

## v0.4.1

This release updates Nerves Toolchains to v1.4.3 and OTP 24.0.3. It should be
safe for everyone to apply.

* Updated dependencies
  * [nerves_system_br v1.16.1](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.16.1)
  * [Erlang/OTP 24.0.3](https://erlang.org/download/OTP-24.0.3.README)
  * [nerves toolchains v1.4.3](https://github.com/nerves-project/toolchains/releases/tag/v1.4.3)

## v0.4.0

This release updates to Buildroot 2021.05 and OTP 24.0.2. If you have made a
custom system off this one, please review the `nerves_system_br v1.16.0` release
notes.

* Updated dependencies
  * [nerves_system_br v1.16.0](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.16.0)
  * [Buildroot 2021.05](http://lists.busybox.net/pipermail/buildroot/2021-June/311946.html)
  * [Erlang/OTP 24.0.2](https://erlang.org/download/OTP-24.0.2.README)

* Improvements
  * This release now contains debug symbols and includes the Build-ID in the
    ELF headers. This makes it easier to get stack traces from C programs. As
    before, the Nerves tooling strips all symbols from firmware images, so this
    won't make programs bigger.

## v0.3.1

This is a security/bug fix release that updates to Buildroot 2021.02.1 and OTP
23.3.1. It should be safe for everyone to apply.

* Updated dependencies
  * [nerves_system_br v1.15.1](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.15.1)
  * [Buildroot 2021.02](http://lists.busybox.net/pipermail/buildroot/2021-April/307970.html)
  * [Erlang/OTP 23.3.1](https://erlang.org/download/OTP-23.3.1.README)

## v0.3.0

This release updates to Buildroot 2021.02 and OTP 23.2.7. If you have made a
custom system off this one, please review the `nerves_system_br v1.15.0` release
notes.

The Nerves toolchain has also been updated to v1.4.2. This brings in Linux 4.14
headers to enable use of cdev and eBPF. This won't affect most users.

* Updated dependencies
  * [nerves_system_br v1.15.0](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.15.0)
  * [Buildroot 2021.02](http://lists.busybox.net/pipermail/buildroot/2021-March/305168.html)
  * [Erlang/OTP 23.2.7](https://erlang.org/download/OTP-23.2.7.README)
  * [nerves toolchains v1.4.2](https://github.com/nerves-project/toolchains/releases/tag/v1.4.2)

## v0.2.1

* Improvements:
  * Load device tree overlays for I2C, SPI and UART so that the "Raspberry Pi"
    GPIO headers work more like the Raspberry Pi by default
  * Synchronize with official systems

## v0.2.0

This updates the system to the `nerves_system_br 1.14.x` series and updates the
toolchain to use gcc 10.

* Updated dependencies
  * [nerves_system_br: bump to 1.14.4](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.14.4)
  * [Erlang/OTP 23.2.4](https://erlang.org/download/OTP-23.2.4.README)

## v0.1.1

* Updated dependencies
  * [nerves_system_br: bump to v1.13.4](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.13.4)
  * [Erlang/OTP 23.1.4](https://erlang.org/download/OTP-23.1.4.README)
  * [boardid 1.10.0](https://github.com/nerves-project/boardid/releases/tag/v1.10.0)

## v0.1.0

This is the initial release. The basics work: MicroSD boot, Linux, both Ethernet
ports, the RTC, DT overlays, firmware updates. The display and eMMC support are
untested and likely require work. Only a cursory skim of power management and
other peripherals has been made so far.

