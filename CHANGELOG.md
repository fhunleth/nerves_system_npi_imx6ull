# Changelog

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

