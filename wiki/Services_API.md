Nintendo provides application developers with an API, which communicate
with certain services. Services, in this sense, are [system processes
running in the
background](Title_list#00040130_-_System_Modules "wikilink") which wait
for incoming requests. When a process wants to communicate with a
service, it first needs to get a handle to the named service, and then
it can communicate with the service via interprocess communication. Each
service has a name up to 8 characters, for example .

Handles for services are retrieved from the [service manager
port](Services "wikilink"), `srv:`. Services are an abstraction of
ports, they operate the same way except regular ports can have their
handles retrieved directly from a SVC.

For a description of how commands and arguments are passed to services,
see [IPC Command Structure](IPC_Command_Structure "wikilink").

List of services (grouped by the process which provides them):

<table>
<thead>
<tr class="header">
<th><p>Old3ds</p></th>
<th><p>Services</p></th>
<th><p>Service names</p></th>
<th scope="col" width="200"><p>Notes</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="Filesystem_services‎" title="wikilink">Filesystem
services‎</a></p></td>
<td><p>, , </p></td>
<td><p>USER: normal applications and system modules, LDR: loader, REG:
register</p></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="Process_Services‎" title="wikilink">Process
Services‎</a></p></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="PXI_Services‎" title="wikilink">PXI Services‎</a></p></td>
<td><p>, , , , , , , , </p></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="Application_Manager_Services"
title="wikilink">Application Manager Services</a></p></td>
<td><p>, , , , </p></td>
<td><p>app: am for applications, net: network installation (<a
href="NIM_Services" title="wikilink">nim</a>), u: local installation,
sys: am for system titles, pipe: not an actual port (internally used to
represent the <a href="Application_Manager_Services#File_service"
title="wikilink">FSFile-like interface</a>)</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="Process_Manager_Services" title="wikilink">Process
Manager Services</a></p></td>
<td><p>, </p></td>
<td><p>app: launching titles, dbg: launching titles with debugging
enabled</p></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="NIM_Services" title="wikilink">NIM Services</a></p></td>
<td><p>, , , </p></td>
<td><p>aoc: DLC, ndm: for <a href="NDM_Services"
title="wikilink">ndm</a>, s: for eShop, u: for updater</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="Config_Services" title="wikilink">Config
Services</a></p></td>
<td><p>, , , </p></td>
<td><p>u: for user, s: for system, i: for initialization/formatting,
nor: accesses wifi SPI flash</p></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="NS" title="wikilink">NS and APT Services</a></p></td>
<td><p>, , , , , </p></td>
<td><p>ns:s: for system, ns:p: power (shutdown/reboot), ns:c: ?, <a
href="APT:A">APT:A</a>: application, <a href="APT:S">APT:S</a>: system,
<a href="APT:U">APT:U</a>: user</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="RO_Services" title="wikilink">RO Services</a></p></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="NDM_Services" title="wikilink">NDM Services</a></p></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="CSND_Services" title="wikilink">CSND
Services</a></p></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="Camera_Services" title="wikilink">Camera
Services</a></p></td>
<td><p>, , , , (New3DS only)</p></td>
<td></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="Codec_Services" title="wikilink">Codec
Services</a></p></td>
<td><p>, , , , , </p></td>
<td><p>HID: human interface device, MIC: microphone, CSN: for <a
href="CSND_Services" title="wikilink">csnd</a>?, DSP: for <a
href="DSP_Services" title="wikilink">dsp</a>?, LGY: legacy (some kind of
backwards compat?), CHK: ?</p></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="DLP_Services" title="wikilink">DLP Services</a></p></td>
<td><p>, , </p></td>
<td><p>CLNT: client, FKCL: fake client, SRVR: server</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="DSP_Services" title="wikilink">DSP Services</a></p></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="GSP_Services" title="wikilink">GSP Services</a></p></td>
<td><p>, </p></td>
<td><p>Lcd: LCD control, Gpu: GPU control</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="BOSS_Services" title="wikilink">BOSS
Services</a></p></td>
<td><p>, , </p></td>
<td><p>U: user, P: privileged, M: for <a href="NDM_Services"
title="wikilink">ndm</a></p></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="CECD_Services" title="wikilink">CECD
Services</a></p></td>
<td><p>, , </p></td>
<td><p>u: user, s: system, ndm: for <a href="NDM_Services"
title="wikilink">ndm</a></p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="IR_Services" title="wikilink">IR Services</a></p></td>
<td><p>, , </p></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="I2C_Services" title="wikilink">I2C Services</a></p></td>
<td><p>, , , , , , , , </p></td>
<td></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="GPIO_Services" title="wikilink">GPIO
Services</a></p></td>
<td><p>, , , , , , </p></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="HID_Services" title="wikilink">HID Services</a></p></td>
<td><p>, , , </p></td>
<td><p>NFC: near-field communication (amiibo), QTM: head tracking device
(related to <a href="QTM_Services" title="wikilink">QTM Services</a>)?,
SPVR: system privileged?</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="PTM_Services" title="wikilink">PTM Services</a></p></td>
<td><p>, , , , , </p></td>
<td><p>gets: get system time, play: play history, s: system, sets: set
system time, sysm: system menu (homemenu/testmenu), u: user</p></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="NWM_Services" title="wikilink">NWM Services</a></p></td>
<td><p>, , , , , , </p></td>
<td><p>CEC: streetpass, EXT: ?, INF: infrastructure, SAP: ?, SOC:
socket, UDS: local WLAN, TST: ?</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="HTTP_Services" title="wikilink">HTTP
Services</a></p></td>
<td></td>
<td><p>C: connection</p></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="SSL_Services" title="wikilink">SSL Services</a></p></td>
<td></td>
<td><p>C: connection</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="Socket_Services" title="wikilink">Socket
Services</a></p></td>
<td><p>, </p></td>
<td><p>P: privileged, U: user</p></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="AC_Services" title="wikilink">AC Services</a></p></td>
<td><p>, </p></td>
<td><p>i: internal, u: user</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="Friend_Services" title="wikilink">Friend
Services</a></p></td>
<td><p>, , </p></td>
<td><p>a: admin, n: for <a href="NDM_Services" title="wikilink">ndm</a>,
u: user</p></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="News_Services" title="wikilink">News
Services</a></p></td>
<td><p>, </p></td>
<td><p>s: system, u:user</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="PDN_Services" title="wikilink">PDN Services</a></p></td>
<td><p>, , , , </p></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="SPI_Services" title="wikilink">SPI Services</a></p></td>
<td><p>, , , , </p></td>
<td></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="Loader_Services" title="wikilink">Loader
Services</a></p></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="MCU_Services" title="wikilink">MCU Services</a></p></td>
<td><p>, , , , , , , , </p></td>
<td></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="MIC_Services" title="wikilink">MIC Services</a></p></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="ACT_Services" title="wikilink">ACT Services</a></p></td>
<td><p>, </p></td>
<td><p>a: admin, u: user</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="MP_Services" title="wikilink">MP Services</a></p></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="NFC_Services" title="wikilink">NFC Services</a></p></td>
<td><p>, , , , , </p></td>
<td><p>dev: developer, m: ? p: passthrough?, r: raw?, s: system, u:
user</p></td>
</tr>
<tr class="odd">
<td style="background: red"><p>No</p></td>
<td><p><a href="MVD_Services" title="wikilink">MVD Services</a></p></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td style="background: red"><p>No</p></td>
<td><p><a href="QTM_Services" title="wikilink">QTM Services</a></p></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

List of PXI services:

- [Filesystem services PXI](Filesystem_services_PXI "wikilink")
- [Process Services PXI](Process_Services_PXI "wikilink")
- [Application Manager Services
  PXI](Application_Manager_Services_PXI "wikilink")
- [Process Manager Services
  PXI](Process_Manager_Services_PXI "wikilink")
- [Development Services PXI](Development_Services_PXI "wikilink")
- [Gamecard Services PXI](Gamecard_Services_PXI "wikilink")
- [Legacy FIRM PXI](Legacy_FIRM_PXI "wikilink") (TWL_FIRM/AGB_FIRM)

List of ports:

- [ErrDisp](ErrDisp "wikilink")
- [Services](Services "wikilink")

See [Error codes](Error_codes "wikilink").