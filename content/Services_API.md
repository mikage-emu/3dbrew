+++
title = 'Services API'
+++

Nintendo provides application developers with an API, which communicate
with certain services. Services, in this sense, are [system processes
running in the
background](Title_list#00040130---system-modules "wikilink") which wait
for incoming requests. When a process wants to communicate with a
service, it first needs to get a handle to the named service, and then
it can communicate with the service via interprocess communication. Each
service has a name up to 8 characters, for example "nim:u".

Handles for services are retrieved from the [service manager
port](Services "wikilink"), "srv:". Services are an abstraction of
ports, they operate the same way except regular ports can have their
handles retrieved directly from a SVC.

For a description of how commands and arguments are passed to services,
see [IPC Command Structure](IPC_Command_Structure "wikilink").

List of services (grouped by the process which provides them):

<table>
<thead>
<tr class="header">
<th>Old3ds</th>
<th>Services</th>
<th>Service names</th>
<th scope="col" width="200"><p>Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../Filesystem_services" %}} title="wikilink">Filesystem
services</a></td>
<td><a {{% href "../Fs:USER" %}} title="wikilink">fs:USER</a>, <a {{% href "../Fs:LDR" %}}
title="wikilink">fs:LDR</a>, <a {{% href "../Fs:REG" %}}
title="wikilink">fs:REG</a></td>
<td>USER: normal applications and system modules, LDR: loader, REG:
register</td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../Process_Services" %}} title="wikilink">Process
Services</a></td>
<td><a {{% href "../Ps:ps" %}} title="wikilink">ps:ps</a></td>
<td></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../PXI_Services" %}} title="wikilink">PXI Services</a></td>
<td><a {{% href "../PxiFS0" %}} title="wikilink">PxiFS0</a>, <a {{% href "../PxiFS1" %}}
title="wikilink">PxiFS1</a>, <a {{% href "../PxiFSB" %}}
title="wikilink">PxiFSB</a>, <a {{% href "../PxiFSR" %}}
title="wikilink">PxiFSR</a>, <a {{% href "../PxiPM" %}} title="wikilink">PxiPM</a>,
<a {{% href "../Pxi:am9" %}} title="wikilink">pxi:am9</a>, <a {{% href "../Pxi:dev" %}}
title="wikilink">pxi:dev</a>, <a {{% href "../Pxi:mc" %}}
title="wikilink">pxi:mc</a>, <a {{% href "../Pxi:ps9" %}}
title="wikilink">pxi:ps9</a></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../Application_Manager_Services" %}}
title="wikilink">Application Manager Services</a></td>
<td><a {{% href "../Am:app" %}} title="wikilink">am:app</a>, <a {{% href "../Am:net" %}}
title="wikilink">am:net</a>, <a {{% href "../Am:u" %}} title="wikilink">am:u</a>,
<a {{% href "../Am:sys" %}} title="wikilink">am:sys</a>, <a {{% href "../Am:pipe" %}}
title="wikilink">am:pipe</a></td>
<td>app: am for applications, net: network installation (<a
{{% href "../NIM_Services" %}} title="wikilink">nim</a>), u: local installation,
sys: am for system titles, pipe: not an actual port (internally used to
represent the <a {{% href "../Application_Manager_Services" %}}
title="wikilink">FSFile-like interface</a>)</td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../Process_Manager_Services" %}} title="wikilink">Process
Manager Services</a></td>
<td><a {{% href "../Pm:app" %}} title="wikilink">pm:app</a>, <a {{% href "../Pm:dbg" %}}
title="wikilink">pm:dbg</a></td>
<td>app: launching titles, dbg: launching titles with debugging
enabled</td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../NIM_Services" %}} title="wikilink">NIM Services</a></td>
<td><a {{% href "../Nim:aoc" %}} title="wikilink">nim:aoc</a>, <a {{% href "../Nim:ndm" %}}
title="wikilink">nim:ndm</a>, <a {{% href "../Nim:s" %}}
title="wikilink">nim:s</a>, <a {{% href "../Nim:u" %}}
title="wikilink">nim:u</a></td>
<td>aoc: DLC, ndm: for <a {{% href "../NDM_Services" %}}
title="wikilink">ndm</a>, s: for eShop, u: for updater</td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../Config_Services" %}} title="wikilink">Config
Services</a></td>
<td><a {{% href "../Cfg:u" %}} title="wikilink">cfg:u</a>, <a {{% href "../Cfg:s" %}}
title="wikilink">cfg:s</a>, <a {{% href "../Cfg:i" %}} title="wikilink">cfg:i</a>,
<a {{% href "../Cfg:nor" %}} title="wikilink">cfg:nor</a></td>
<td>u: for user, s: for system, i: for initialization/formatting,
nor: accesses wifi SPI flash</td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../NS" %}} title="wikilink">NS and APT Services</a></td>
<td><a {{% href "../Ns:s" %}} title="wikilink">ns:s</a>, <a {{% href "../Ns:p" %}}
title="wikilink">ns:p</a>, <a {{% href "../Ns:c" %}} title="wikilink">ns:c</a>, <a
{{% href "../APT:A" %}} title="wikilink"><span>APT:A</span></a>, <a {{% href "../APT:S" %}}
title="wikilink"><span>APT:S</span></a>, <a {{% href "../APT:U" %}}
title="wikilink"><span>APT:U</span></a></td>
<td>ns:s: for system, ns:p: power (shutdown/reboot), ns:c: ?, <a
{{% href "../APT:A" %}}>APT:A</a>: application, <a {{% href "../APT:S" %}}>APT:S</a>: system,
<a {{% href "../APT:U" %}}>APT:U</a>: user</td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../RO_Services" %}} title="wikilink">RO Services</a></td>
<td><a {{% href "../Ldr:ro" %}} title="wikilink">ldr:ro</a></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../NDM_Services" %}} title="wikilink">NDM Services</a></td>
<td><a {{% href "../Ndm:u" %}} title="wikilink">ndm:u</a></td>
<td></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../CSND_Services" %}} title="wikilink">CSND
Services</a></td>
<td><a {{% href "../Csnd:SND" %}} title="wikilink">csnd:SND</a></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../Camera_Services" %}} title="wikilink">Camera
Services</a></td>
<td><a {{% href "../cam:u" "broken" %}} title="wikilink">cam:u</a>, <a {{% href "../y2r:u" "broken" %}}
title="wikilink">y2r:u</a>, <a {{% href "../cam:s" "broken" %}} title="wikilink">cam:s</a>,
<a {{% href "../cam:c" "broken" %}} title="wikilink">cam:c</a>, <a {{% href "../cam:q" "broken" %}}
title="wikilink">cam:q</a> (New3DS only)</td>
<td></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../Codec_Services" %}} title="wikilink">Codec
Services</a></td>
<td><a {{% href "../cdc:HID" "broken" %}} title="wikilink">cdc:HID</a>, <a {{% href "../cdc:MIC" "broken" %}}
title="wikilink">cdc:MIC</a>, <a {{% href "../cdc:CSN" "broken" %}}
title="wikilink">cdc:CSN</a>, <a {{% href "../cdc:DSP" "broken" %}}
title="wikilink">cdc:DSP</a>, <a {{% href "../cdc:LGY" "broken" %}}
title="wikilink">cdc:LGY</a>, <a {{% href "../cdc:CHK" "broken" %}}
title="wikilink">cdc:CHK</a></td>
<td>HID: human interface device, MIC: microphone, CSN: for <a
{{% href "../CSND_Services" %}} title="wikilink">csnd</a>?, DSP: for <a
{{% href "../DSP_Services" %}} title="wikilink">dsp</a>?, LGY: legacy (some kind of
backwards compat?), CHK: ?</td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../DLP_Services" %}} title="wikilink">DLP Services</a></td>
<td><a {{% href "../dlp:CLNT" "broken" %}} title="wikilink">dlp:CLNT</a>, <a
{{% href "../dlp:FKCL" "broken" %}} title="wikilink">dlp:FKCL</a>, <a {{% href "../dlp:SRVR" "broken" %}}
title="wikilink">dlp:SRVR</a></td>
<td>CLNT: client, FKCL: fake client, SRVR: server</td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../DSP_Services" %}} title="wikilink">DSP Services</a></td>
<td><a {{% href "../dsp::DSP" "broken" %}} title="wikilink">dsp::DSP</a></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../GSP_Services" %}} title="wikilink">GSP Services</a></td>
<td><a {{% href "../gsp::Lcd" "broken" %}} title="wikilink">gsp::Lcd</a>, <a
{{% href "../gsp::Gpu" "broken" %}} title="wikilink">gsp::Gpu</a></td>
<td>Lcd: LCD control, Gpu: GPU control</td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../BOSS_Services" %}} title="wikilink">BOSS
Services</a></td>
<td><a {{% href "../boss:U" "broken" %}} title="wikilink">boss:U</a>, <a {{% href "../boss:P" "broken" %}}
title="wikilink">boss:P</a>, <a {{% href "../boss:M" "broken" %}}
title="wikilink">boss:M</a></td>
<td>U: user, P: privileged, M: for <a {{% href "../NDM_Services" %}}
title="wikilink">ndm</a></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../CECD_Services" %}} title="wikilink">CECD
Services</a></td>
<td><a {{% href "../cecd:u" "broken" %}} title="wikilink">cecd:u</a>, <a {{% href "../cecd:s" "broken" %}}
title="wikilink">cecd:s</a>, <a {{% href "../cecd:ndm" "broken" %}}
title="wikilink">cecd:ndm</a></td>
<td>u: user, s: system, ndm: for <a {{% href "../NDM_Services" %}}
title="wikilink">ndm</a></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../IR_Services" %}} title="wikilink">IR Services</a></td>
<td><a {{% href "../ir:u" "broken" %}} title="wikilink">ir:u</a>, <a {{% href "../Ir:USER" %}}
title="wikilink">ir:USER</a>, <a {{% href "../ir:rst" "broken" %}}
title="wikilink">ir:rst</a></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../I2C_Services" %}} title="wikilink">I2C Services</a></td>
<td><a {{% href "../i2c::MCU" "broken" %}} title="wikilink">i2c::MCU</a>, <a
{{% href "../i2c::CAM" "broken" %}} title="wikilink">i2c::CAM</a>, <a {{% href "../i2c::LCD" "broken" %}}
title="wikilink">i2c::LCD</a>, <a {{% href "../i2c::DEB" "broken" %}}
title="wikilink">i2c::DEB</a>, <a {{% href "../i2c::HID" "broken" %}}
title="wikilink">i2c::HID</a>, <a {{% href "../i2c::IR" "broken" %}}
title="wikilink">i2c::IR</a>, <a {{% href "../i2c::EEP" "broken" %}}
title="wikilink">i2c::EEP</a>, <a {{% href "../i2c::NFC" "broken" %}}
title="wikilink">i2c::NFC</a>, <a {{% href "../i2c::QTM" "broken" %}}
title="wikilink">i2c::QTM</a></td>
<td></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../GPIO_Services" %}} title="wikilink">GPIO
Services</a></td>
<td><a {{% href "../gpio:CDC" "broken" %}} title="wikilink">gpio:CDC</a>, <a
{{% href "../gpio:MCU" "broken" %}} title="wikilink">gpio:MCU</a>, <a {{% href "../gpio:HID" "broken" %}}
title="wikilink">gpio:HID</a>, <a {{% href "../gpio:NWM" "broken" %}}
title="wikilink">gpio:NWM</a>, <a {{% href "../gpio:IR" "broken" %}}
title="wikilink">gpio:IR</a>, <a {{% href "../gpio:NFC" "broken" %}}
title="wikilink">gpio:NFC</a>, <a {{% href "../gpio:QTM" "broken" %}}
title="wikilink">gpio:QTM</a></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../HID_Services" %}} title="wikilink">HID Services</a></td>
<td><a {{% href "../hid:NFC" "broken" %}} title="wikilink">hid:NFC</a>, <a {{% href "../hid:QTM" "broken" %}}
title="wikilink">hid:QTM</a>, <a {{% href "../hid:SPVR" "broken" %}}
title="wikilink">hid:SPVR</a>, <a {{% href "../hid:USER" "broken" %}}
title="wikilink">hid:USER</a></td>
<td>NFC: near-field communication (amiibo), QTM: head tracking device
(related to <a {{% href "../QTM_Services" %}} title="wikilink">QTM Services</a>)?,
SPVR: system privileged?</td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../PTM_Services" %}} title="wikilink">PTM Services</a></td>
<td><a {{% href "../ptm:gets" "broken" %}} title="wikilink">ptm:gets</a>, <a
{{% href "../ptm:play" "broken" %}} title="wikilink">ptm:play</a>, <a {{% href "../ptm:s" "broken" %}}
title="wikilink">ptm:s</a>, <a {{% href "../ptm:sets" "broken" %}}
title="wikilink">ptm:sets</a>, <a {{% href "../ptm:sysm" "broken" %}}
title="wikilink">ptm:sysm</a>, <a {{% href "../ptm:u" "broken" %}}
title="wikilink">ptm:u</a></td>
<td>gets: get system time, play: play history, s: system, sets: set
system time, sysm: system menu (homemenu/testmenu), u: user</td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../NWM_Services" %}} title="wikilink">NWM Services</a></td>
<td><a {{% href "../nwm::CEC" "broken" %}} title="wikilink">nwm::CEC</a>, <a
{{% href "../nwm::EXT" "broken" %}} title="wikilink">nwm::EXT</a>, <a {{% href "../nwm::INF" "broken" %}}
title="wikilink">nwm::INF</a>, <a {{% href "../nwm::SAP" "broken" %}}
title="wikilink">nwm::SAP</a>, <a {{% href "../nwm::SOC" "broken" %}}
title="wikilink">nwm::SOC</a>, <a {{% href "../nwm::TST" "broken" %}}
title="wikilink">nwm::TST</a>, <a {{% href "../nwm::UDS" "broken" %}}
title="wikilink">nwm::UDS</a></td>
<td>CEC: streetpass, EXT: ?, INF: infrastructure, SAP: ?, SOC:
socket, UDS: local WLAN, TST: ?</td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../HTTP_Services" %}} title="wikilink">HTTP
Services</a></td>
<td><a href="http:C"
title="wikilink"><span>http:C</span></a></td>
<td>C: connection</td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../SSL_Services" %}} title="wikilink">SSL Services</a></td>
<td><a {{% href "../ssl:C" "broken" %}} title="wikilink">ssl:C</a></td>
<td>C: connection</td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../Socket_Services" %}} title="wikilink">Socket
Services</a></td>
<td><a {{% href "../soc:P" "broken" %}} title="wikilink">soc:P</a>, <a {{% href "../soc:U" "broken" %}}
title="wikilink">soc:U</a></td>
<td>P: privileged, U: user</td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../AC_Services" %}} title="wikilink">AC Services</a></td>
<td><a {{% href "../ac:i" "broken" %}} title="wikilink">ac:i</a>, <a {{% href "../ac:u" "broken" %}}
title="wikilink">ac:u</a></td>
<td>i: internal, u: user</td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../Friend_Services" %}} title="wikilink">Friend
Services</a></td>
<td><a {{% href "../frd:a" "broken" %}} title="wikilink">frd:a</a>, <a {{% href "../frd:n" "broken" %}}
title="wikilink">frd:n</a>, <a {{% href "../frd:u" "broken" %}}
title="wikilink">frd:u</a></td>
<td>a: admin, n: for <a {{% href "../NDM_Services" %}} title="wikilink">ndm</a>,
u: user</td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../News_Services" %}} title="wikilink">News
Services</a></td>
<td><a {{% href "../:news:s" "broken" %}} title="wikilink">:<span>news:s</span></a>, <a
{{% href "../:news:u" "broken" %}} title="wikilink">:<span>news:u</span></a></td>
<td>s: system, u:user</td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../PDN_Services" %}} title="wikilink">PDN Services</a></td>
<td><a {{% href "../pdn:s" "broken" %}} title="wikilink">pdn:s</a>, <a {{% href "../pdn:d" "broken" %}}
title="wikilink">pdn:d</a>, <a {{% href "../pdn:i" "broken" %}} title="wikilink">pdn:i</a>,
<a {{% href "../pdn:g" "broken" %}} title="wikilink">pdn:g</a>, <a {{% href "../pdn:c" "broken" %}}
title="wikilink">pdn:c</a></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../SPI_Services" %}} title="wikilink">SPI Services</a></td>
<td><a {{% href "../SPI::NOR" "broken" %}} title="wikilink">SPI::NOR</a>, <a
{{% href "../SPI::CD2" "broken" %}} title="wikilink">SPI::CD2</a>, <a {{% href "../SPI::CS2" "broken" %}}
title="wikilink">SPI::CS2</a>, <a {{% href "../SPI::CS3" "broken" %}}
title="wikilink">SPI::CS3</a>, <a {{% href "../SPI::DEF" "broken" %}}
title="wikilink">SPI::DEF</a></td>
<td></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../Loader_Services" %}} title="wikilink">Loader
Services</a></td>
<td><a {{% href "../Loader" "broken" %}} title="wikilink">Loader</a></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../MCU_Services" %}} title="wikilink">MCU Services</a></td>
<td><a {{% href "../mcu::CAM" "broken" %}} title="wikilink">mcu::CAM</a>, <a
{{% href "../mcu::GPU" "broken" %}} title="wikilink">mcu::GPU</a>, <a {{% href "../mcu::HID" "broken" %}}
title="wikilink">mcu::HID</a>, <a {{% href "../mcu::RTC" "broken" %}}
title="wikilink">mcu::RTC</a>, <a {{% href "../mcu::SND" "broken" %}}
title="wikilink">mcu::SND</a>, <a {{% href "../mcu::NWM" "broken" %}}
title="wikilink">mcu::NWM</a>, <a {{% href "../mcu::HWC" "broken" %}}
title="wikilink">mcu::HWC</a>, <a {{% href "../mcu::PLS" "broken" %}}
title="wikilink">mcu::PLS</a>, <a {{% href "../mcu::CDC" "broken" %}}
title="wikilink">mcu::CDC</a></td>
<td></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../MIC_Services" %}} title="wikilink">MIC Services</a></td>
<td><a {{% href "../mic:u" "broken" %}} title="wikilink">mic:u</a></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../ACT_Services" %}} title="wikilink">ACT Services</a></td>
<td><a {{% href "../act:a" "broken" %}} title="wikilink">act:a</a>, <a {{% href "../act:u" "broken" %}}
title="wikilink">act:u</a></td>
<td>a: admin, u: user</td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../MP_Services" %}} title="wikilink">MP Services</a></td>
<td><a {{% href "../mp:u" "broken" %}} title="wikilink">mp:u</a></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</td>
<td><a {{% href "../NFC_Services" %}} title="wikilink">NFC Services</a></td>
<td><a {{% href "../nfc:dev" "broken" %}} title="wikilink">nfc:dev</a>, <a {{% href "../nfc:m" "broken" %}}
title="wikilink">nfc:m</a>, <a {{% href "../nfc:p" "broken" %}} title="wikilink">nfc:p</a>,
<a {{% href "../nfc:r" "broken" %}} title="wikilink">nfc:r</a>, <a {{% href "../nfc:s" "broken" %}}
title="wikilink">nfc:s</a>, <a {{% href "../nfc:u" "broken" %}}
title="wikilink">nfc:u</a></td>
<td>dev: developer, m: ? p: passthrough?, r: raw?, s: system, u:
user</td>
</tr>
<tr class="odd">
<td style="background: red"><p>No</td>
<td><a {{% href "../MVD_Services" %}} title="wikilink">MVD Services</a></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td style="background: red"><p>No</td>
<td><a {{% href "../QTM_Services" %}} title="wikilink">QTM Services</a></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>

List of PXI services:

-   [Filesystem services PXI](Filesystem_services_PXI "wikilink")
-   [Process Services PXI](Process_Services_PXI "wikilink")
-   [Application Manager Services
    PXI](Application_Manager_Services_PXI "wikilink")
-   [Process Manager Services
    PXI](Process_Manager_Services_PXI "wikilink")
-   [Development Services PXI](Development_Services_PXI "wikilink")
-   [Gamecard Services PXI](Gamecard_Services_PXI "wikilink")
-   [Legacy FIRM PXI](Legacy_FIRM_PXI "wikilink") (TWL_FIRM/AGB_FIRM)

List of ports:

-   [ErrDisp](ErrDisp "wikilink")
-   [Services](Services "wikilink")

See [Error codes](Error_codes "wikilink").
