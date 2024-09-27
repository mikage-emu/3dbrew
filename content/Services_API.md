+++
title = 'Services API'
+++

Nintendo provides application developers with an API, which communicate
with certain services. Services, in this sense, are [system processes
running in the
background](Title_list#00040130_-_System_Modules "wikilink") which wait
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
<td><p><a href="fs:USER" title="wikilink">fs:USER</a>, <a href="fs:LDR"
title="wikilink">fs:LDR</a>, <a href="fs:REG"
title="wikilink">fs:REG</a></p></td>
<td><p>USER: normal applications and system modules, LDR: loader, REG:
register</p></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="Process_Services‎" title="wikilink">Process
Services‎</a></p></td>
<td><p><a href="ps:ps" title="wikilink">ps:ps</a></p></td>
<td></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="PXI_Services‎" title="wikilink">PXI Services‎</a></p></td>
<td><p><a href="PxiFS0" title="wikilink">PxiFS0</a>, <a href="PxiFS1"
title="wikilink">PxiFS1</a>, <a href="PxiFSB"
title="wikilink">PxiFSB</a>, <a href="PxiFSR"
title="wikilink">PxiFSR</a>, <a href="PxiPM" title="wikilink">PxiPM</a>,
<a href="pxi:am9" title="wikilink">pxi:am9</a>, <a href="pxi:dev"
title="wikilink">pxi:dev</a>, <a href="pxi:mc"
title="wikilink">pxi:mc</a>, <a href="pxi:ps9"
title="wikilink">pxi:ps9</a></p></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="Application_Manager_Services"
title="wikilink">Application Manager Services</a></p></td>
<td><p><a href="am:app" title="wikilink">am:app</a>, <a href="am:net"
title="wikilink">am:net</a>, <a href="am:u" title="wikilink">am:u</a>,
<a href="am:sys" title="wikilink">am:sys</a>, <a href="am:pipe"
title="wikilink">am:pipe</a></p></td>
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
<td><p><a href="pm:app" title="wikilink">pm:app</a>, <a href="pm:dbg"
title="wikilink">pm:dbg</a></p></td>
<td><p>app: launching titles, dbg: launching titles with debugging
enabled</p></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="NIM_Services" title="wikilink">NIM Services</a></p></td>
<td><p><a href="nim:aoc" title="wikilink">nim:aoc</a>, <a href="nim:ndm"
title="wikilink">nim:ndm</a>, <a href="nim:s"
title="wikilink">nim:s</a>, <a href="nim:u"
title="wikilink">nim:u</a></p></td>
<td><p>aoc: DLC, ndm: for <a href="NDM_Services"
title="wikilink">ndm</a>, s: for eShop, u: for updater</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="Config_Services" title="wikilink">Config
Services</a></p></td>
<td><p><a href="cfg:u" title="wikilink">cfg:u</a>, <a href="cfg:s"
title="wikilink">cfg:s</a>, <a href="cfg:i" title="wikilink">cfg:i</a>,
<a href="cfg:nor" title="wikilink">cfg:nor</a></p></td>
<td><p>u: for user, s: for system, i: for initialization/formatting,
nor: accesses wifi SPI flash</p></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="NS" title="wikilink">NS and APT Services</a></p></td>
<td><p><a href="ns:s" title="wikilink">ns:s</a>, <a href="ns:p"
title="wikilink">ns:p</a>, <a href="ns:c" title="wikilink">ns:c</a>, <a
href="APT:A" title="wikilink"><span>APT:A</span></a>, <a href="APT:S"
title="wikilink"><span>APT:S</span></a>, <a href="APT:U"
title="wikilink"><span>APT:U</span></a></p></td>
<td><p>ns:s: for system, ns:p: power (shutdown/reboot), ns:c: ?, <a
href="APT:A">APT:A</a>: application, <a href="APT:S">APT:S</a>: system,
<a href="APT:U">APT:U</a>: user</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="RO_Services" title="wikilink">RO Services</a></p></td>
<td><p><a href="ldr:ro" title="wikilink">ldr:ro</a></p></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="NDM_Services" title="wikilink">NDM Services</a></p></td>
<td><p><a href="ndm:u" title="wikilink">ndm:u</a></p></td>
<td></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="CSND_Services" title="wikilink">CSND
Services</a></p></td>
<td><p><a href="csnd:SND" title="wikilink">csnd:SND</a></p></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="Camera_Services" title="wikilink">Camera
Services</a></p></td>
<td><p><a href="cam:u" title="wikilink">cam:u</a>, <a href="y2r:u"
title="wikilink">y2r:u</a>, <a href="cam:s" title="wikilink">cam:s</a>,
<a href="cam:c" title="wikilink">cam:c</a>, <a href="cam:q"
title="wikilink">cam:q</a> (New3DS only)</p></td>
<td></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="Codec_Services" title="wikilink">Codec
Services</a></p></td>
<td><p><a href="cdc:HID" title="wikilink">cdc:HID</a>, <a href="cdc:MIC"
title="wikilink">cdc:MIC</a>, <a href="cdc:CSN"
title="wikilink">cdc:CSN</a>, <a href="cdc:DSP"
title="wikilink">cdc:DSP</a>, <a href="cdc:LGY"
title="wikilink">cdc:LGY</a>, <a href="cdc:CHK"
title="wikilink">cdc:CHK</a></p></td>
<td><p>HID: human interface device, MIC: microphone, CSN: for <a
href="CSND_Services" title="wikilink">csnd</a>?, DSP: for <a
href="DSP_Services" title="wikilink">dsp</a>?, LGY: legacy (some kind of
backwards compat?), CHK: ?</p></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="DLP_Services" title="wikilink">DLP Services</a></p></td>
<td><p><a href="dlp:CLNT" title="wikilink">dlp:CLNT</a>, <a
href="dlp:FKCL" title="wikilink">dlp:FKCL</a>, <a href="dlp:SRVR"
title="wikilink">dlp:SRVR</a></p></td>
<td><p>CLNT: client, FKCL: fake client, SRVR: server</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="DSP_Services" title="wikilink">DSP Services</a></p></td>
<td><p><a href="dsp::DSP" title="wikilink">dsp::DSP</a></p></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="GSP_Services" title="wikilink">GSP Services</a></p></td>
<td><p><a href="gsp::Lcd" title="wikilink">gsp::Lcd</a>, <a
href="gsp::Gpu" title="wikilink">gsp::Gpu</a></p></td>
<td><p>Lcd: LCD control, Gpu: GPU control</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="BOSS_Services" title="wikilink">BOSS
Services</a></p></td>
<td><p><a href="boss:U" title="wikilink">boss:U</a>, <a href="boss:P"
title="wikilink">boss:P</a>, <a href="boss:M"
title="wikilink">boss:M</a></p></td>
<td><p>U: user, P: privileged, M: for <a href="NDM_Services"
title="wikilink">ndm</a></p></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="CECD_Services" title="wikilink">CECD
Services</a></p></td>
<td><p><a href="cecd:u" title="wikilink">cecd:u</a>, <a href="cecd:s"
title="wikilink">cecd:s</a>, <a href="cecd:ndm"
title="wikilink">cecd:ndm</a></p></td>
<td><p>u: user, s: system, ndm: for <a href="NDM_Services"
title="wikilink">ndm</a></p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="IR_Services" title="wikilink">IR Services</a></p></td>
<td><p><a href="ir:u" title="wikilink">ir:u</a>, <a href="ir:USER"
title="wikilink">ir:USER</a>, <a href="ir:rst"
title="wikilink">ir:rst</a></p></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="I2C_Services" title="wikilink">I2C Services</a></p></td>
<td><p><a href="i2c::MCU" title="wikilink">i2c::MCU</a>, <a
href="i2c::CAM" title="wikilink">i2c::CAM</a>, <a href="i2c::LCD"
title="wikilink">i2c::LCD</a>, <a href="i2c::DEB"
title="wikilink">i2c::DEB</a>, <a href="i2c::HID"
title="wikilink">i2c::HID</a>, <a href="i2c::IR"
title="wikilink">i2c::IR</a>, <a href="i2c::EEP"
title="wikilink">i2c::EEP</a>, <a href="i2c::NFC"
title="wikilink">i2c::NFC</a>, <a href="i2c::QTM"
title="wikilink">i2c::QTM</a></p></td>
<td></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="GPIO_Services" title="wikilink">GPIO
Services</a></p></td>
<td><p><a href="gpio:CDC" title="wikilink">gpio:CDC</a>, <a
href="gpio:MCU" title="wikilink">gpio:MCU</a>, <a href="gpio:HID"
title="wikilink">gpio:HID</a>, <a href="gpio:NWM"
title="wikilink">gpio:NWM</a>, <a href="gpio:IR"
title="wikilink">gpio:IR</a>, <a href="gpio:NFC"
title="wikilink">gpio:NFC</a>, <a href="gpio:QTM"
title="wikilink">gpio:QTM</a></p></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="HID_Services" title="wikilink">HID Services</a></p></td>
<td><p><a href="hid:NFC" title="wikilink">hid:NFC</a>, <a href="hid:QTM"
title="wikilink">hid:QTM</a>, <a href="hid:SPVR"
title="wikilink">hid:SPVR</a>, <a href="hid:USER"
title="wikilink">hid:USER</a></p></td>
<td><p>NFC: near-field communication (amiibo), QTM: head tracking device
(related to <a href="QTM_Services" title="wikilink">QTM Services</a>)?,
SPVR: system privileged?</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="PTM_Services" title="wikilink">PTM Services</a></p></td>
<td><p><a href="ptm:gets" title="wikilink">ptm:gets</a>, <a
href="ptm:play" title="wikilink">ptm:play</a>, <a href="ptm:s"
title="wikilink">ptm:s</a>, <a href="ptm:sets"
title="wikilink">ptm:sets</a>, <a href="ptm:sysm"
title="wikilink">ptm:sysm</a>, <a href="ptm:u"
title="wikilink">ptm:u</a></p></td>
<td><p>gets: get system time, play: play history, s: system, sets: set
system time, sysm: system menu (homemenu/testmenu), u: user</p></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="NWM_Services" title="wikilink">NWM Services</a></p></td>
<td><p><a href="nwm::CEC" title="wikilink">nwm::CEC</a>, <a
href="nwm::EXT" title="wikilink">nwm::EXT</a>, <a href="nwm::INF"
title="wikilink">nwm::INF</a>, <a href="nwm::SAP"
title="wikilink">nwm::SAP</a>, <a href="nwm::SOC"
title="wikilink">nwm::SOC</a>, <a href="nwm::TST"
title="wikilink">nwm::TST</a>, <a href="nwm::UDS"
title="wikilink">nwm::UDS</a></p></td>
<td><p>CEC: streetpass, EXT: ?, INF: infrastructure, SAP: ?, SOC:
socket, UDS: local WLAN, TST: ?</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="HTTP_Services" title="wikilink">HTTP
Services</a></p></td>
<td><p><a href="http:C"
title="wikilink"><span>http:C</span></a></p></td>
<td><p>C: connection</p></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="SSL_Services" title="wikilink">SSL Services</a></p></td>
<td><p><a href="ssl:C" title="wikilink">ssl:C</a></p></td>
<td><p>C: connection</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="Socket_Services" title="wikilink">Socket
Services</a></p></td>
<td><p><a href="soc:P" title="wikilink">soc:P</a>, <a href="soc:U"
title="wikilink">soc:U</a></p></td>
<td><p>P: privileged, U: user</p></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="AC_Services" title="wikilink">AC Services</a></p></td>
<td><p><a href="ac:i" title="wikilink">ac:i</a>, <a href="ac:u"
title="wikilink">ac:u</a></p></td>
<td><p>i: internal, u: user</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="Friend_Services" title="wikilink">Friend
Services</a></p></td>
<td><p><a href="frd:a" title="wikilink">frd:a</a>, <a href="frd:n"
title="wikilink">frd:n</a>, <a href="frd:u"
title="wikilink">frd:u</a></p></td>
<td><p>a: admin, n: for <a href="NDM_Services" title="wikilink">ndm</a>,
u: user</p></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="News_Services" title="wikilink">News
Services</a></p></td>
<td><p><a href=":news:s" title="wikilink">:<span>news:s</span></a>, <a
href=":news:u" title="wikilink">:<span>news:u</span></a></p></td>
<td><p>s: system, u:user</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="PDN_Services" title="wikilink">PDN Services</a></p></td>
<td><p><a href="pdn:s" title="wikilink">pdn:s</a>, <a href="pdn:d"
title="wikilink">pdn:d</a>, <a href="pdn:i" title="wikilink">pdn:i</a>,
<a href="pdn:g" title="wikilink">pdn:g</a>, <a href="pdn:c"
title="wikilink">pdn:c</a></p></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="SPI_Services" title="wikilink">SPI Services</a></p></td>
<td><p><a href="SPI::NOR" title="wikilink">SPI::NOR</a>, <a
href="SPI::CD2" title="wikilink">SPI::CD2</a>, <a href="SPI::CS2"
title="wikilink">SPI::CS2</a>, <a href="SPI::CS3"
title="wikilink">SPI::CS3</a>, <a href="SPI::DEF"
title="wikilink">SPI::DEF</a></p></td>
<td></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="Loader_Services" title="wikilink">Loader
Services</a></p></td>
<td><p><a href="Loader" title="wikilink">Loader</a></p></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="MCU_Services" title="wikilink">MCU Services</a></p></td>
<td><p><a href="mcu::CAM" title="wikilink">mcu::CAM</a>, <a
href="mcu::GPU" title="wikilink">mcu::GPU</a>, <a href="mcu::HID"
title="wikilink">mcu::HID</a>, <a href="mcu::RTC"
title="wikilink">mcu::RTC</a>, <a href="mcu::SND"
title="wikilink">mcu::SND</a>, <a href="mcu::NWM"
title="wikilink">mcu::NWM</a>, <a href="mcu::HWC"
title="wikilink">mcu::HWC</a>, <a href="mcu::PLS"
title="wikilink">mcu::PLS</a>, <a href="mcu::CDC"
title="wikilink">mcu::CDC</a></p></td>
<td></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="MIC_Services" title="wikilink">MIC Services</a></p></td>
<td><p><a href="mic:u" title="wikilink">mic:u</a></p></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="ACT_Services" title="wikilink">ACT Services</a></p></td>
<td><p><a href="act:a" title="wikilink">act:a</a>, <a href="act:u"
title="wikilink">act:u</a></p></td>
<td><p>a: admin, u: user</p></td>
</tr>
<tr class="odd">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="MP_Services" title="wikilink">MP Services</a></p></td>
<td><p><a href="mp:u" title="wikilink">mp:u</a></p></td>
<td></td>
</tr>
<tr class="even">
<td style="background: green"><p>Yes</p></td>
<td><p><a href="NFC_Services" title="wikilink">NFC Services</a></p></td>
<td><p><a href="nfc:dev" title="wikilink">nfc:dev</a>, <a href="nfc:m"
title="wikilink">nfc:m</a>, <a href="nfc:p" title="wikilink">nfc:p</a>,
<a href="nfc:r" title="wikilink">nfc:r</a>, <a href="nfc:s"
title="wikilink">nfc:s</a>, <a href="nfc:u"
title="wikilink">nfc:u</a></p></td>
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