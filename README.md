# NPi i.MX6ULL Support

*This is a work in progress. DO NOT USE UNLESS YOU'RE HELPING ME OUT OR YOU'LL
BE QUITE FRUSTRATED*

[![CircleCI](https://circleci.com/gh/nerves-project/nerves_system_npi_imx6ull.svg?style=svg)](https://circleci.com/gh/nerves-project/nerves_system_npi_imx6ull)
[![Hex version](https://img.shields.io/hexpm/v/nerves_system_npi_imx6ull.svg "Hex version")](https://hex.pm/packages/nerves_system_npi_imx6ull)

This is the base Nerves System configuration for the [NPi
i.MX6ULL](https://www.digikey.com/product-detail/en/seeed-technology-co-ltd/102991306/1597-102991306-ND/10492211).

![NPi i.MX6ULL](assets/images/npi_imx6ull.png)
<br><sup>[Image credit](#digikey)</sup>

| Feature              | Description                     |
| -------------------- | ------------------------------- |
| CPU                  | 800 MHz ARM Cortex-A7           |
| Memory               | 512 MB DRAM                     |
| Storage              | 8 GB eMMC Flash and MicroSD     |
| Linux kernel         | 4.19 w/ RCN patches             |
| IEx terminal         | UART `ttymxc0`                  |
| GPIO, I2C, SPI       | Yes - [Elixir Circuits](https://github.com/elixir-circuits) |
| ADC                  | Yes                             |
| PWM                  | Yes, but no Elixir support      |
| UART                 | ttymxc0                         |
| Camera               | None                            |
| Ethernet             | Yes                             |
| WiFi                 | Other requires USB WiFi dongle/driver |
| RTC                  | Yes w/ battery                  |
| HW Watchdog          | i.MX6 watchdog enabled on boot. Be sure to enable `heart` in your vm.args or the device will reboot |

WARNING: 32 GB and larger MicroSD cards don't seem to work!

## Using

The most common way of using this Nerves System is create a project with `mix
nerves.new` and to export `MIX_TARGET=npi_imx6ull`. See the [Getting started
guide](https://hexdocs.pm/nerves/getting-started.html#creating-a-new-nerves-app)
for more information.

If you need custom modifications to this system for your device, clone this
repository and update as described in [Making custom
systems](https://hexdocs.pm/nerves/systems.html#customizing-your-own-nerves-system)

## Console access

TBD

The console is configured to output to the 6 pin header on the
BeagleBone that's labeled J1. A 3.3V FTDI cable is needed to access the output.

The HDMI output has been disabled via device tree to free up pins on the GPIO
header. If you would like console access via HDMI, you will need to enable HDMI
support in the Linux kernel, remove the HDMI disable argument in the uboot
script providing kernel arguments, and change `erlinit.conf` to output to
`tty1`.

## Provisioning devices

This system supports storing provisioning information in a small key-value store
outside of any filesystem. Provisioning is an optional step and reasonable
defaults are provided if this is missing.

Provisioning information can be queried using the Nerves.Runtime KV store's
[`Nerves.Runtime.KV.get/1`](https://hexdocs.pm/nerves_runtime/Nerves.Runtime.KV.html#get/1)
function.

Keys used by this system are:

Key                    | Example Value     | Description
:--------------------- | :---------------- | :----------
`nerves_serial_number` | `"12345678"`       | By default, this string is used to create unique hostnames and Erlang node names. If unset, it defaults to part of the BBB's serial number.

The normal procedure would be to set these keys once in manufacturing or before
deployment and then leave them alone.

For example, to provision a serial number on a running device, run the following
and reboot:

```elixir
iex> cmd("fw_setenv nerves_serial_number 12345678")
```

This system supports setting the serial number offline. To do this, set the
`NERVES_SERIAL_NUMBER` environment variable when burning the firmware. If you're
programming MicroSD cards using `fwup`, the commandline is:

```sh
sudo NERVES_SERIAL_NUMBER=12345678 fwup path_to_firmware.fw
```

Serial numbers are stored on the MicroSD card so if the MicroSD card is
replaced, the serial number will need to be reprogrammed. The numbers are stored
in a U-boot environment block. This is a special region that is separate from
the application partition so reformatting the application partition will not
lose the serial number or any other data stored in this block.

Additional key value pairs can be provisioned by overriding the default
provisioning.conf file location by setting the environment variable
`NERVES_PROVISIONING=/path/to/provisioning.conf`. The default provisioning.conf
will set the `nerves_serial_number`, if you override the location to this file,
you will be responsible for setting this yourself.

## Linux and U-Boot versions

The NPi i.MX6ULL vary by kernel version and patch set. Nerves tracks those
maintained by Robert Nelson at
[eewiki.net](https://www.digikey.com/eewiki/display/linuxonarm/NPi+i.MX6ULL)

Nerves also integrates the NPi i.MX6ULL's U-boot patches but modifies them to
support the Nerves U-Boot environment variables.

[Image credit](#digikey): This image is from [Digikey](http://digikey.com/).

