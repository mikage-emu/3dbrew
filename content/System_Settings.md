+++
title = 'System Settings'
+++

**System Settings** allows you to manage various settings, use [System
Transfer](System_Transfer "wikilink"), and use Data Management.

All applications(CTR/TWL) launched by System Settings are launched via
[APT:PrepareToDoApplicationJump/APT:DoApplicationJump](NS_and_APT_Services "wikilink"),
such as DS INTERNET and [System Transfer](System_Transfer "wikilink").

## Accessible services

| Service                                                                        | Last seen on version         |
|--------------------------------------------------------------------------------|------------------------------|
| [fs:USER](Filesystem_services#filesystem_service_fsuser "wikilink")     | [v8202](9.0.0-20 "wikilink") |
| [gsp:Gpu](GSP_Services "wikilink")                                             | [v8202](9.0.0-20 "wikilink") |
| [ndm:u](NDM_Services "wikilink")                                               | [v8202](9.0.0-20 "wikilink") |
| [APT:A](NS_and_APT_Services#apta-service "wikilink")                                   | [v8202](9.0.0-20 "wikilink") |
| [ac:i](AC_Services "wikilink")                                                 | [v8202](9.0.0-20 "wikilink") |
| [act:a](ACT_Services "wikilink")                                               | [v8202](9.0.0-20 "wikilink") |
| [am:sys](Application_Manager_Services#application_manager_services "wikilink") | [v8202](9.0.0-20 "wikilink") |
| [boss:P](BOSS_Services "wikilink")                                             | [v8202](9.0.0-20 "wikilink") |
| [cam:s](Camera_Services#cams_port_cal "wikilink")                       | [v8202](9.0.0-20 "wikilink") |
| [cecd:s](CECD_Services "wikilink")                                             | [v8202](9.0.0-20 "wikilink") |
| [cfg:nor](Config_Services#config_nvram_service_cfgnor "wikilink")       | [v8202](9.0.0-20 "wikilink") |
| [dsp::DSP](DSP_Services "wikilink")                                            | [v8202](9.0.0-20 "wikilink") |
| [frd:a](Friend_Services "wikilink")                                            | [v8202](9.0.0-20 "wikilink") |
| [gsp::Lcd](GSP_Services "wikilink")                                            | [v8202](9.0.0-20 "wikilink") |
| [http:C](HTTP_Services "wikilink")                                           | [v8202](9.0.0-20 "wikilink") |
| [mic:u](MIC_Services "wikilink")                                               | [v8202](9.0.0-20 "wikilink") |
| [news:s](News_Services#news-service-newss "wikilink")                 | [v8202](9.0.0-20 "wikilink") |
| [nim:u](NIM_Services#nim-updater-service-nimu "wikilink")                  | [v8202](9.0.0-20 "wikilink") |
| [ns:s](NS#ns_service_nss "wikilink")                                    | [v8202](9.0.0-20 "wikilink") |
| [nwm::EXT](NWM_Services#nwm_service_nwmext "wikilink")                 | [v8202](9.0.0-20 "wikilink") |
| [nwm::INF](NWM_Services#nwm_infrastructure_service_nwminf "wikilink")  | [v8202](9.0.0-20 "wikilink") |
| [nwm::SOC](NWM_Services#nwm_socket_service_nwmsoc "wikilink")          | [v8202](9.0.0-20 "wikilink") |
| [ptm:gets](PTM_Services#getsystemtime_ptm_service_ptmgets "wikilink")   | [v8202](9.0.0-20 "wikilink") |
| [ptm:sysm](PTM_Services#sysmenu_ptm_service_ptmsysm "wikilink")         | [v8202](9.0.0-20 "wikilink") |
| [soc:P](Socket_Services#socket_privileged_service_socp "wikilink")      | [v8202](9.0.0-20 "wikilink") |
| [soc:U](Socket_Services#socket_user_service_socu "wikilink")            | [v8202](9.0.0-20 "wikilink") |
| [ssl:C](SSL_Services "wikilink")                                               | [v8202](9.0.0-20 "wikilink") |
| [y2r:u](Camera_Services#y2ru "wikilink")                                      | [v8202](9.0.0-20 "wikilink") |
| [qtm:s](QTM_Services#qtm_system_service_qtms "wikilink")                | [v8202](9.0.0-20 "wikilink") |
| [cfg:i](Config_Services#config_service_cfgi "wikilink")                 | [v8202](9.0.0-20 "wikilink") |
| [hid:SPVR](HID_Services#hid_service_hidspvr "wikilink")                 | [v8202](9.0.0-20 "wikilink") |

## Data Management

### 3DS

Here you can manage 3DS extra data, and 3DSWare/"Software".

When managing 3DS Software installed to the SD Card, the
[title.db](Title_Database "wikilink") is read by the core receiving
[AM](Application_Manager_Services_PXI "wikilink") commands. From the
title.db file, AM gets a list of installed titles, title sizes and the
name of the ".cmd" file for each title, which is used to check the
authenticity of the title data(product code, title version, and if an
electronic manaual is used, is also kept for each title, in the
title.db, but won't be used by the Data Management Utility). For each
title listed, it checks if the title is authentic(via the .cmd file). If
the title passes authentication, Data Management decrypts/reads the ICN
data from the executable NCCH([CXI](CXI "wikilink")) and displays it
along with the archived title size. If a title doesn't pass
authentication, a placeholder icon(light grey with a '?' in the center),
name ('????????') and a size of zero are used. Deleting titles removes
the title data from the title.db and import.db, and deletes the
directory of the content.

Additionally, if a CTR-NAND or TWL-NAND installed title passes
authentication, but has a fake-signed ticket, System Settings will call
"[svcBreak](SVC "wikilink")" upon entering Data Management -\> 3DS \|
DSiWare. Barring patched RSA sig checks, this will prevent a user from
viewing the 3DS and/or DSiWare Data Management menu depending on which
NAND(s) the offending title(s) is installed. This phenomenon has been
known to lock users out of executing widely used exploits like
[Bannerbomb3](https://github.com/zoogie/Bannerbomb3), which need access
to Data Management to trigger.

### DSiWare

See [DSiWare Exports](DSiWare_Exports "wikilink").

## System Format

Most of the System Format is done with
[FS:InitializeCtrFileSystem](FS:InitializeCtrFileSystem "wikilink").
This command updates the high u64 of the keyY stored in
[movable.sed](Nand/private/movable.sed "wikilink"). Since this keyY was
updated, the data stored on [SD](SD_Filesystem "wikilink")
card(sdmc/Nintendo 3DS/<ID0>/<ID1>) and the data under
[nand/data/<ID0>](Flash_Filesystem "wikilink") is rendered useless,
since that data used the old keyY. Since that data is no longer usable,
the system then deletes the two above SD/NAND directories.

When you first enter the System Format menu, it will check if a NNID is
linked. If there's a linked-NNID, it will then display: "Are you ready
to connect to the Internet to check whether data can be formatted"?
Continuing will only result in connecting to wifi for checking in with
Nintendo's servers, which may fail if the console is banned. Once that's
done it will continue with the usual system-format messages; proceeding
will result in the NNID cookie, potentially still present on NAND
backups or multiboot scenarios, being invalidated until the next sign-in
(at which point even old sessions will be valid again).

## System Updater

The system updater title is identical to the regular system settings,
except only system update is accessible with this. On dev units, this
title can only be launched under certain conditions.

On retail units, this title is accessible in scenarios where you have to
update via the Internet to use certain 3DS software other than the home
menu. i.e. using the eShop, on a system version less than the current
one. When one selects "Cancel" from here on retail, the system will
shutdown. [NS](NS "wikilink") launches SAFE_MODE_FIRM for running this
title, when the [UPDATEFLAG](Configuration_Memory "wikilink") is set
during system boot.

## Exiting System Settings

Upon exit, the system reboots instead of simply returning to home menu.

## Parental Controls Reset

The following refers to the functionality which generates the Parental
Controls "Master Key".

<table>
<thead>
<tr class="header">
<th>System version, for the mset title</th>
<th>Parental controls reset functionality version</th>
<th>Inquiry number length</th>
<th>Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><a {{% href "../1.0.0-0" %}} title="wikilink">1.0.0-X</a> - <a
{{% href "../6.3.0-12" %}} title="wikilink">6.3.0-X</a></td>
<td>v0</td>
<td>8</td>
<td>Mostly inherited from the Wii/DSi algorithm which used CRC-32
(0xEDB88320) with custom XOR-out (0xAAAA). 0x14C1 was added to produce
the final result.</p>
<p>For the 3DS algorithm, only constants were changed: the polynomial
was changed to 0xEDBA6320 and the addition constant became 0x1657.</p>
<p>The input to either function is an ASCII string of the format
"%02u%02u%04u" where the parameters are month, day, and low 4 digits of
the inquiry number. The low 5 decimal digits from the output u32 are
then used for the master key.</p>
<p>Because of the date being used in the algorithm, this results in the
master key only being valid on a particular day, though this is
trivially defeated by setting the system time to the correct date that
the key was generated on.</p>
<p>This had a minor refactor in <a {{% href "../6.0.0-11" %}}
title="wikilink">6.0.0-X</a> but is functionally identical.</td>
</tr>
<tr class="even">
<td><a {{% href "../7.0.0-13" %}} title="wikilink">7.0.0-X</a> - <a
{{% href "../7.1.0-16" %}} title="wikilink">7.1.0-X</a></td>
<td>v1</td>
<td>10</td>
<td>Introduced a new scheme using HMAC-SHA-256. The HMAC key is
loaded from mset .rodata, and differs between regions.</p>
<p>The inquiry number was bumped from 8 digits to 10 digits, but the
same function is used to generate the digits as in v0 (derived from MAC
address).</p>
<p>All digits of the inquiry number are now actually used in the master
key derivation function, as the string format is now "%02u%02u%010u"
(month, day, inquiry number). This buffer is hashed (as above), and a
little-endian word is read from the start of the output hash. The low 5
decimal digits of this word are used as the master key.</td>
</tr>
<tr class="odd">
<td><a {{% href "../7.2.0-17" %}} title="wikilink">7.2.0-X</a> -
current</td>
<td>v2</td>
<td>10</td>
<td>Extension of v1 featuring a number of changes which serve to
obscure the HMAC key used.</p>
<p>The HMAC key is now stored in a separate file stored in the CVer
RomFS, called <a {{% href "../CVer" %}}
title="wikilink">masterkey.bin</a>. This is used to update the key
independently of the mset title. In order to make this possible, a
scheme was devised to encode the required key within the inquiry number
- the first digit denotes region, and the next two digits represent the
key version. These values match up with values stored in the
masterkey.bin header. For compatibility with v1 (as inquiry number
length did not change), the version values begin at 10 - when parsing an
inquiry number, a "version" of less than 10 should be handled as
algorithm v1.</p>
<p>The HMAC key is now also encrypted in masterkey.bin. This uses
AES-128-CTR using a (normal) key in mset .rodata (which differs between
regions), with the initial counter value also stored in
masterkey.bin.</p>
<p>At some point, Nintendo chose to "abandon" the original JPN region ID
(0), and moved to region ID 9 instead (which usually doesn't exist). It
is unknown why they made this change, as the AES key used for both of
these IDs is the same.</td>
</tr>
</tbody>
</table>

## ExtData

The ExtData [File System](Extdata#filesystem "wikilink") for System
Settings is as follows:

```
root
├── icon
├── boss
└── user
    ├── Backup.dat
    └── MsetExt.dat
```

| File        | Details                                                          | Size         | FW Introduced                   | Plaintext                                                                                             |
|-------------|------------------------------------------------------------------|--------------|---------------------------------|-------------------------------------------------------------------------------------------------------|
| icon        | Stubbed. Always image 00000002.                                  | 0x4 Bytes    | n/a                             |                                                                                                       |
| MsetExt.dat | [DSiWare Exports](DSiWare_Exports "wikilink") Management         | 0x960 Bytes  | [2.0.0-2](2.0.0-2 "wikilink")   | [Download](https://dl.dropboxusercontent.com/u/60710927/CTR/Sample/SystemSettingsExtdata/MsetExt.dat) |
| Backup.dat  | [SD Savedata Backups](SD_Savedata_Backups "wikilink") Management | 0xf5a0 Bytes | [6.0.0-11](6.0.0-11 "wikilink") | [Download](https://dl.dropboxusercontent.com/u/60710927/CTR/Sample/SystemSettingsExtdata/Backup.dat)  |

### MsetExt.dat

This keeps a record for the DSiWare Exports for a maximum of 300
exports. Each record is in the format:

| OFFSET | SIZE | DESCRIPTION                |
|--------|------|----------------------------|
| 0      | 4    | Game Code in Little Endian |
| 0x4    | 4    | Reserved                   |

All unused entries are filled with "0xff".

### Backup.dat

This keeps a record for the 30 save data backup slots for [SD Savedata
Backups](SD_Savedata_Backups "wikilink"). Each entry corresponds to an
individual backup slot.

Entry:

| OFFSET | SIZE             | DESCRIPTION             |
|--------|------------------|-------------------------|
| 0x000  | 8                | Reserved                |
| 0x8    | 0x800 (0x80\*16) | 16 UTF-16 Title Strings |
| 0x808  | 8                | Title ID                |
| 0x810  | 8                | Unknown                 |
| 0x818  | 8                | Total Save Data Size    |
| 0x820  | 0x10             | Reserved                |

## Launch parameters

System Settings can start at specific menus when certain parameters are
given.

\* - returns to settings menu instead of rebooting

| Value | Action                                                             |
|-------|--------------------------------------------------------------------|
| 0x01  | Initial setup (system not actually formatted, music plays earlier) |
| 0x10  | Internet Settings -\> Connection Settings                          |
| 0x11  | Internet Settings -\> Other Information                            |
| 0x6e  | Internet Settings -\> Connection Settings                          |
| 0x6f  | Parental Controls                                                  |
| 0x70  | Parental Controls birthday entry                                   |
| 0x71  | Data Management                                                    |
| 0x72  | 3DS Software Management                                            |
| 0x73  | 3DS Extra Data Management                                          |
| 0x74  | DSiWare Management                                                 |
| 0x75  | StreetPass Management                                              |
| 0x76  | Internet Settings\*                                                |
| 0x77  | Other Settings, second-to-last page\*                              |
| 0x78  | Touch Screen calibration                                           |
| 0x79  | Circle Pad calibration                                             |
| 0x7a  | System Update                                                      |
| 0x7b  | System Update                                                      |
| 0x7c  | Format System Memory\*                                             |
