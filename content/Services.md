+++
title = 'Services'
+++

Services are an abstraction of ports and are the commonly used way of
inter-process communication outside of the kernel. While handles of
regular ports are retrieved from [svcConnectToPort](SVC "wikilink"),
service handles are retrieved through the port *srv:* ("service
manager").

When a service is registered, [svcCreatePort](SVC "wikilink") is used
without a port-name. This means that the port is inaccessible via the
port SVCs outside of sm-module. See below for getting a session handle
for sending commands to services.

Processes with PID less than or equal to the number of NATIVE_FIRM
built-in modules (fs, sm, pm, pxi, ldr) have access to all services.
This value is obtained from [svcGetSystemInfo](SVC "wikilink"). Other
processes are limited to access services listed in their [service access
control
list](NCCH/Extended_Header#ARM11_Local_System_Capabilities "wikilink"),
as passed to [SRVPM:RegisterProcess](SRVPM:RegisterProcess "wikilink").

Attempting to use [GetServiceHandle](SRV:GetServiceHandle "wikilink")
with a service that the process has access to when that service isn't
registered will block until it is registered.

## Service Manager Port "srv:"

| Command Header | Description                                                       |
|----------------|-------------------------------------------------------------------|
| 0x00010002     | [RegisterClient](SRV:RegisterClient "wikilink")                   |
| 0x00020000     | [EnableNotification](SRV:EnableNotification "wikilink")           |
| 0x00030100     | [RegisterService](SRV:RegisterService "wikilink")                 |
| 0x000400C0     | [UnregisterService](SRV:UnregisterService "wikilink")             |
| 0x00050100     | [GetServiceHandle](SRV:GetServiceHandle "wikilink")               |
| 0x000600C2     | [RegisterPort](SRV:RegisterPort "wikilink")                       |
| 0x000700C0     | [UnregisterPort](SRV:UnregisterPort "wikilink")                   |
| 0x00080100     | [GetPort](SRV:GetPort "wikilink")                                 |
| 0x00090040     | [Subscribe](SRV:Subscribe "wikilink")                             |
| 0x000A0040     | [Unsubscribe](SRV:Unsubscribe "wikilink")                         |
| 0x000B0000     | [ReceiveNotification](SRV:ReceiveNotification "wikilink")         |
| 0x000C0080     | [PublishToSubscriber](SRV:PublishToSubscriber "wikilink")         |
| 0x000D0040     | [PublishAndGetSubscriber](SRV:PublishAndGetSubscriber "wikilink") |
| 0x000E00C0     | [IsServiceRegistered](SRV:IsServiceRegistered "wikilink")         |

It appears these "port" commands can be used for transferring arbitrary
handles, however [GetPort](SRV:GetPort "wikilink") still uses the same
service-access-control validation as
[GetServiceHandle](SRV:GetServiceHandle "wikilink"). Despite this fact,
it appears that a "port" and a service with the same name can coexist
independently.

## Service Manager Process-Manager Port/Service "srv:pm"

| Command Header (port), prior to [7.0.0-13](7.0.0-13 "wikilink") | Command Header (service), post [7.0.0-13](7.0.0-13 "wikilink") | Description                                             |
|-----------------------------------------------------------------|----------------------------------------------------------------|---------------------------------------------------------|
| 0x04010042                                                      | 0x00010042                                                     | [PublishToProcess](SRVPM:PublishToProcess "wikilink")   |
| 0x04020040                                                      | 0x00020040                                                     | [PublishToAll](SRVPM:PublishToAll "wikilink")           |
| 0x04030082                                                      | 0x00030082                                                     | [RegisterProcess](SRVPM:RegisterProcess "wikilink")     |
| 0x04040040                                                      | 0x00040040                                                     | [UnregisterProcess](SRVPM:UnregisterProcess "wikilink") |

Prior to to [7.0.0-13](7.0.0-13 "wikilink"), the commands listed for
"srv:" were also accessible under this port with the same
command-headers. Starting with [7.0.0-13](7.0.0-13 "wikilink"), the
"srv:pm" port was changed to a service. With this change, commandIDs for
these commands were changed. "srv:pm" was originally vulnerable, this
was fixed with [7.0.0-13](7.0.0-13 "wikilink"), see
[here](3DS_exploits "wikilink"). Originally any process could use
"srv:pm", however starting with [7.0.0-13](7.0.0-13 "wikilink") only the
built-in NATIVE_FIRM sysmodules have access to it. The only system title
which uses "srv:pm" is the [Process
Manager](Process_Manager_Services "wikilink").

## Notifications

| ID          | Published by | Subscribed by                                                                               | Description                                                                                                                            |
|-------------|--------------|---------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| 0x100       |              | Not Needed                                                                                  | This indicates that the recipient must terminate.                                                                                      |
| 0x101       | PTM          | NS                                                                                          | Signaled on sleep mode entry.                                                                                                          |
| 0x102       | PTM          | NS                                                                                          | Sleep Mode related?                                                                                                                    |
| 0x103       | PTM          | NS, CSND, NWM, AC, NIM                                                                      | Fired on sleep mode entry (Kernel state is modified by PTM after publishing this)                                                      |
| 0x104       | PTM          | HID                                                                                         | This indicates that the system is entering sleep mode. (Kernel state is modified by PTM before publishing this)                        |
| 0x105       | PTM          | NS, DSP, CSND, GSP, CODEC, CAMERA, HID, QTM, MIC, IR, NWM, FRIENDS, AC, CECD, ACT, NDM, NIM | This indicates that the system has exited sleep mode.                                                                                  |
| 0x106       | PTM          | NS, MIC, AC, NEWS, CECD, BOSS                                                               | Fired after sleep mode exit.                                                                                                           |
| 0x107       | PTM          | NWM, CECD, BOSS, NDM, NIM, NEWS                                                             | Unknown.                                                                                                                               |
| 0x108       | PTM          | GSP, QTM                                                                                    | System is going to Power Down.                                                                                                         |
| 0x109       | CFG          | GSP                                                                                         | CFG block 0x00050001 has been modified, change LCD brightness/PWM settings                                                             |
| 0x10B       | CFG          | CAMERA                                                                                      | ?                                                                                                                                      |
| 0x10C       | PM           |                                                                                             | A Regular application has started.                                                                                                     |
| 0x110-0x11F | PM           | NS                                                                                          | Sent on application exit. See [PM launch flags](PMApp:LaunchTitle#Launch_Flags "wikilink").                                            |
| 0x179       | PM           | PTM, NS                                                                                     | All processes other than PTM and NS have terminated.                                                                                   |
| 0x200       |              | NS                                                                                          | Signaled just before sleep mode is exited from.                                                                                        |
| 0x202       | MCU          | NS                                                                                          | POWER button pressed                                                                                                                   |
| 0x203       | MCU          | NS                                                                                          | POWER button held long                                                                                                                 |
| 0x204       | MCU          | NS                                                                                          | HOME button pressed                                                                                                                    |
| 0x205       | MCU          | NS                                                                                          | HOME button released                                                                                                                   |
| 0x206       | MCU / NWM    | NWM                                                                                         | The physical Wi-Fi slider state changed                                                                                                |
| 0x207       |              | MENU                                                                                        | SD card inserted                                                                                                                       |
| 0x208       |              | MENU                                                                                        | Game cartridge inserted                                                                                                                |
| 0x209       |              | NS, MENU                                                                                    | SD card removed                                                                                                                        |
| 0x20A       |              | NS, MENU                                                                                    | Game cartridge removed                                                                                                                 |
| 0x20B       |              | NS, MENU                                                                                    | Game cartridge inserted or removed                                                                                                     |
| 0x20C       | MCU          | PTM                                                                                         | Published on a fatal hardware condition, when the MCU WDT triggers, ptm throws fatal error F960D407 in receipt of this                 |
| 0x20D       | MCU          | GSP                                                                                         | Charger plugged out.                                                                                                                   |
| 0x20E       | MCU          | GSP                                                                                         | Charger plugged in.                                                                                                                    |
| 0x20F       | MCU          |                                                                                             | Published by the mcu module when (bitmask & 0x8000) is true (started charging). This bitmask is obtained by reading i2c register 0x10. |
| 0x210       | MCU          |                                                                                             | Published by the mcu module when (bitmask & 0x4000) is true (stopped charging). This bitmask is obtained by reading i2c register 0x10. |
| 0x211       | PTM          |                                                                                             | Battery very low (5%)                                                                                                                  |
| 0x212       | PTM          |                                                                                             | Battery low (10%)                                                                                                                      |
| 0x213       | NS           | CODEC, HID, GSP, CAMERA, MIC, NDM, QTM, PTM                                                 | Shell opened.                                                                                                                          |
| 0x214       | NS           | CODEC, HID, GSP, CAMERA, MIC, NDM, QTM, PTM.                                                | Shell closed.                                                                                                                          |
| 0x300       | AC           | NDM, MENU                                                                                   | Signaled after sleep mode exit and during system boot.                                                                                 |
| 0x301       | AC           | FRIENDS, NDM                                                                                | Signaled just before sleep mode is exited from.                                                                                        |
| 0x302       | NWM          | NDM, SOCKET, FRIENDS, AC                                                                    | Unknown.                                                                                                                               |
| 0x303       |              | CECD, NDM                                                                                   | Unknown.                                                                                                                               |
| 0x304       |              | CECD, NDM, SOCKET                                                                           | Unknown                                                                                                                                |