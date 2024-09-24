+++
title = 'Nintendo Zone'
+++

**Nintendo Zone** is the successor to DS Download Stations, offering
retailer exclusive content, game videos, screenshots, etc. As of
February 6th 2012 demos are available for download, demos are
[downloaded](NIM_Services "wikilink") from the eShop servers and
installed to SD card. NZone demos are the same ones available on eShop,
these are region-locked as trying to download them from other regions
results in an error. The 3DS NZone is significantly different from the
DS(i) [NZone](http://dsibrew.org/wiki/Nintendo_Zone). Most content
available at NZone is already available on eShop, like the
screenshots/videos, game info etc.

Like DSi, when an open 3DS detects NZone the originally hidden NZone
title appears and a notification about it appears. Like DSi this title
is already stored on NAND, originally this title only became accessible
from home-menu once the 3DS was in a range of a NZone at least once,
however at some point with a system update this title became
always-accessible. When NZone beacons are in range, 3DS only detects
NZone when not connected to Internet already. Once connected to a NZone
AP, the beacon payload is cached until disconnected from the AP.

When modified DSi nzone beacons are broadcasted with the 3DS Best Buy
ApNum, DSi launcher won't blink the NZone title icon but the title will
still semi-work. The NZone application would connect to the server, with
buttons for demos, Best Buy, and WFC config displayed, but NZone will
display an error a while after selecting "Best Buy" service after a bit
of loading.(probably unsupported html tags etc)

## Description

The NZone browser interface is similar to the regular [Internet
Browser](Internet_Browser "wikilink"), the browser engine used here is
completely different however. Unlike the regular [Internet
Browser](Internet_Browser "wikilink") which uses the socket/SSL services
directly, the Nintendo Zone application uses the
[HTTP](HTTP_Services "wikilink") service instead. 3D stereoscopic videos
are supported via html `<media>` tags, for 3D videos the "mediatype"
attribute is set to "3D". For 2D videos videos the "mediatype" attribute
is set to "2D". This uses Mobiclip with file extension .moflex, the
magic number from the first word in the video file is
0xabaa324c(little-endian).

The 3DS NZone application immediately uses
[NIMS:CheckSysupdateAvailableSOAP](NIMS:CheckSysupdateAvailableSOAP "wikilink")
once connected to the NZone AP, if an update is available and the user
selects "Cancel" in the displayed dialog, the application will stop
using the wifi AP.

The user-agent used by the Nintendo Zone application is
"NintendoZoneViewer/3.1". The URL parameters sent to the dsdl.\* HTTPS
server are the same as DSi(besides the value of the console-type
parameter and the "ver" parameter value), except 3DS also sends
additional headers in the request using the same data sent in the URL
parameters. The zonebnr server requires three more request headers(extra
URL parameters are not needed here), the first of these three headers is
"ZoneUserID" where the unknown value is 16 hex-digits(8-bytes in
binary). The last two headers of these additional three headers contain
data which was originally sent with the dsdl server URL parameters.

The NZone beacon encryption is same as before, except some unknown
fields in the cleartext was changed where 3DS will only "detect" NZone
/w NZone icon blinking/enabled when the beacons' fields are set this
way. DSi will not detect these beacons. 3DS can use DS(i) NZone, but
only if the NZone title is already enabled. With DS(i) beacons, 3DS
connects to Internet but the NZone icon will not blink. However the
NZone title will still work once launched.

### Beacon payload format

This seems to be identical to DS(i) NZone format except for the unknown
fields. 3DS NZone is not region-locked like DS(i).

<table>
<thead>
<tr class="header">
<th>OFFSET</th>
<th>SIZE</th>
<th>DESCRIPTION</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x00</p></td>
<td><p>32</p></td>
<td><p>AP SSID</p></td>
</tr>
<tr class="even">
<td><p>0x20</p></td>
<td><p>10</p></td>
<td><p>ApNum, required for connecting to the server. This is used by the
server to determine which retailer NZone you're using. Apnum structure:
10 digits or RSSCCTTLLL. R is the decimal region, SS is the decimal
ServiceID. CC is the two-letter country-code, TT is the 2-letter country
state/province code, and LLL is the decimal locationID. Regions: 0) JPN
1) USA 2/3) EUR 4) KOR 5) CHN. LLL is always zero for non-JPN
deployments, however in JPN this is unique per NZone hotspot
location.</p></td>
</tr>
<tr class="odd">
<td><p>0x2a</p></td>
<td><p>2</p></td>
<td><p>This u16 was always one in all dumps, unknown what this is. This
isn't used by the client.</p></td>
</tr>
<tr class="even">
<td><p>0x2c</p></td>
<td><p>24</p></td>
<td><p>Some ServiceName, either in UTF-16 or ASCII</p></td>
</tr>
<tr class="odd">
<td><p>0x44</p></td>
<td><p>32</p></td>
<td><p>AP crypto key, if any</p></td>
</tr>
<tr class="even">
<td><p>0x64</p></td>
<td><p>1</p></td>
<td><p>Unknown, not used by the DS(i) client. For 3DS this value varies,
for DS(i) this is 0x0.</p></td>
</tr>
<tr class="odd">
<td><p>0x65</p></td>
<td><p>1</p></td>
<td><p>AP crypto key type: 0) Open 1) WEP-64 2) WEP-128 3) WEP-152 4)
WPA-PSK (TKIP) 5) WPA2-PSK (TKIP) 6) WPA-PSK (AES) 7) WPA2-PSK (AES)
(the encryption key field contains the AP passphrase)</p></td>
</tr>
<tr class="even">
<td><p>0x66</p></td>
<td><p>1</p></td>
<td><p>Bit 0: Enables Nintendo Zone content on DS(i)<br />
Bit 1: Enables friend list and online gaming<br />
Bit 4: Enables Nintendo Zone Viewer on 3DS<br />
Bit 7: Blocks the Nintendo eShop<br />
Bits 2, 3, 5, 6: Unknown</p></td>
</tr>
<tr class="odd">
<td><p>0x67</p></td>
<td><p>1</p></td>
<td><p>Bit 0: Blocks the internet browser<br />
Bits 1 to 7: Unknown</p></td>
</tr>
<tr class="even">
<td><p>0x68</p></td>
<td><p>4</p></td>
<td><p>Padding</p></td>
</tr>
<tr class="odd">
<td><p>0x6c</p></td>
<td><p>2</p></td>
<td><p>Unknown, seems to be always 0x428</p></td>
</tr>
<tr class="even">
<td><p>0x6e</p></td>
<td><p>2</p></td>
<td><p>CRC16 over the whole payload excluding CRC offset, initval is
0</p></td>
</tr>
</tbody>
</table>

## Wi-Fi Hotspots

### Hotspot.conf format

The list of NZone hotspots is loaded from "conf:/hotspot.conf" by the AC
system applet, where "conf:" is the 000400DB00010502
[CFA](NCCH#CFA "wikilink") archive. This is a CSV file, with LF-style
newlines. All of the information stored in the NZone beacon is also
stored in this file for each hotspot. This file can list a max of 100
hotspots.(As of title version v1024, hotspot.conf lists 52 hotspots)
This format can be parsed by
[hotspotconf-tool](https://github.com/yellows8/hotspotconf-tool).

Beginning the CSV file is the Interval record and field. Following that
is the hotspot records on one line, and the fields for each hotspot on
individual lines. Some fields are Base64-encoded, for those the Base64
padding character '\*' is used instead of '='.

IsBrowser, IsShop, and IsGame might determine whether the [Internet
Browser](Internet_Browser "wikilink"), [eShop](eShop "wikilink"), and
games' online multi-player may be used.

#### Records

| Record name  | Field max len       | Field data                                                                                                                                    |
|--------------|---------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| Interval     | Arbitrary           | Decimal interval, unknown (usually 20)                                                                                                        |
| ServiceName  | 0x40 (after decode) | Hotspot Base64-encoded ASCII ServiceName                                                                                                      |
| Url          | 0x80 (after decode) | Hotspot Base64-encoded URL (usually unused, optionally links to the retailer's website)                                                       |
| Ssid         | 32 (after decode)   | Hotspot Base64-encoded SSID                                                                                                                   |
| SecurityKey  | 0x40 (after decode) | Hotspot Base64-encoded encryption key. For encryption type7, WPA2-PSK is used, however unlike the NZone beacon this is the 0x20-byte WPA-PSK. |
| SecurityMode | 1                   | Decimal hotspot encryption type (0 for none)                                                                                                  |
| ApNum        | 10                  | Hotspot ApNum, see above NZone beacon info                                                                                                    |
| IsVendorIE   | 1                   | Decimal hotspot flag, can be either 1 or 0                                                                                                    |
| IsBackground | 1                   | Decimal hotspot flag, can be either 1 or 0                                                                                                    |
| IsBrowser    | 1                   | Decimal hotspot flag, can be either 1 or 0                                                                                                    |
| IsShop       | 1                   | Decimal hotspot flag, can be either 1 or 0                                                                                                    |
| IsGame       | 1                   | Decimal hotspot flag, can be either 1 or 0                                                                                                    |
| IsSetToFW    | 1                   | Decimal hotspot flag, can be either 1 or 0                                                                                                    |
| IsZone       | 1                   | Decimal hotspot flag, can be either 1 or 0. This field was added for newer NZone hotspot.conf versions.                                       |

### Hotspots

Hotspots not listed in hotspot.conf can only be used via NZone beacons.
The below flags is the combined "IsXXX" fields from hotspot.conf,
excluding IsSetToFW. The below hotspot.conf version specifies what title
version that hotspot was added to the list, if at all.("Unknown"
indicates that the hotspot is present in v1024, but it's unknown whether
it was in the previous version.)

#### Hotspot list from NZone hotspot.conf

| SSID                                                                      | Security | Region/country | ServiceName                            | Flags         | Hotspot.conf version |
|---------------------------------------------------------------------------|----------|----------------|----------------------------------------|---------------|----------------------|
| wifine                                                                    | None     | JPN            | [Wifine](http://wifine.jp/)            | 1, 1, 1, 1, 1 | Unknown              |
| NintendoSpotPass1                                                         | None     | EUR            | Nintendo                               | 1, 1, 1, 1, 1 | Unknown              |
| NintendoSpotPass2                                                         | None     | EUR            | Nintendo                               | 1, 0, 0, 0, 1 | Unknown              |
| attwifi                                                                   | None     | USA            | AT&T                                   | 1, 1, 1, 1, 1 | Unknown              |
| SIMON WiFi                                                                | None     | USA            | Simon Malls                            | 1, 1, 1, 1, 1 | Unknown              |
| noasp01                                                                   | None     | USA            | NOA (Nintendo events)                  | 1, 1, 1, 1, 1 | Unknown              |
| noasp02                                                                   | None     | USA            | NOA (Nintendo events)                  | 1, 1, 1, 1, 1 | Unknown              |
| Telekom                                                                   | None     | EUR (Germany)  | Telekom                                | 1, 0, 0, 0, 1 | Unknown              |
| Telekom_ICE                                                               | None     | EUR (Germany)  | Telekom                                | 1, 0, 0, 0, 1 | Unknown              |
| Guglielmo                                                                 | None     | IT             | Guglielmo                              | 1, 1, 1, 1, 1 | Unknown              |
| ASTRO                                                                     | None     | IT             | Guglielmo                              | 1, 1, 1, 1, 1 | Unknown              |
| Banca Sella WiFi Clienti                                                  | None     | IT             | Guglielmo                              | 1, 1, 1, 1, 1 | Unknown              |
| confindustria                                                             | None     | IT             | Guglielmo                              | 1, 1, 1, 1, 1 | Unknown              |
| Grand                                                                     | None     | IT             | Guglielmo                              | 1, 1, 1, 1, 1 | Unknown              |
| Guglielmo Rimini WiFi                                                     | None     | IT             | Guglielmo                              | 1, 1, 1, 1, 1 | Unknown              |
| GuglielmoDallaRosaPrati                                                   | None     | IT             | Guglielmo                              | 1, 1, 1, 1, 1 | Unknown              |
| Hotels                                                                    | None     | IT             | Guglielmo                              | 1, 1, 1, 1, 1 | Unknown              |
| L.Bettolo                                                                 | None     | IT             | Guglielmo                              | 1, 1, 1, 1, 1 | Unknown              |
| LecceWireless                                                             | None     | IT             | Guglielmo                              | 1, 1, 1, 1, 1 | Unknown              |
| P.zza Nicoloso                                                            | None     | IT             | Guglielmo                              | 1, 1, 1, 1, 1 | Unknown              |
| PortoDiTrieste                                                            | None     | IT             | Guglielmo                              | 1, 1, 1, 1, 1 | Unknown              |
| Comune-Na Piazze WIFI                                                     | None     | IT             | Guglielmo                              | 1, 1, 1, 1, 1 | Unknown              |
| WiFi_Stampa                                                               | None     | IT             | Guglielmo                              | 1, 1, 1, 1, 1 | Unknown              |
| KPN                                                                       | None     | EUR (NL)       | KPN                                    | 1, 1, 0, 1, 1 | Unknown              |
| METEOR                                                                    | None     | FR             | Meteor                                 | 1, 0, 0, 0, 1 | Unknown              |
| MCDONALDS                                                                 | None     | FR             | Meteor                                 | 1, 0, 0, 0, 1 | Unknown              |
| AREA_by_METEOR                                                            | None     | FR             | Meteor                                 | 1, 0, 0, 0, 1 | Unknown              |
| PATaPAIN_by_METEOR                                                        | None     | FR             | Meteor                                 | 1, 0, 0, 0, 1 | Unknown              |
| CASINO_by_METEOR                                                          | None     | FR             | Meteor                                 | 1, 0, 0, 0, 1 | Unknown              |
| all_seasons_by_METEOR                                                     | None     | FR             | Meteor                                 | 1, 0, 0, 0, 1 | Unknown              |
| ADAGIO_by_METEOR                                                          | None     | FR             | Meteor                                 | 1, 0, 0, 0, 1 | Unknown              |
| PULLMAN_by_METEOR                                                         | None     | FR             | Meteor                                 | 1, 0, 0, 0, 1 | Unknown              |
| Best_Western_by_METEOR                                                    | None     | FR             | Meteor                                 | 1, 0, 0, 0, 1 | Unknown              |
| CreditAgricole_by_METEOR                                                  | None     | FR             | Meteor                                 | 1, 0, 0, 0, 1 | Unknown              |
| IBIS_by_METEOR                                                            | None     | FR             | Meteor                                 | 1, 0, 0, 0, 1 | Unknown              |
| MERCURE_by_METEOR                                                         | None     | FR             | Meteor                                 | 1, 0, 0, 0, 1 | Unknown              |
| Telefonica                                                                | None     | ES             | Telefonica                             | 1, 0, 0, 1, 1 | Unknown              |
| GOWEXWiFi                                                                 | None     | ES             | Gowex                                  | 1, 0, 0, 1, 1 | Unknown              |
| OurenseWiFi                                                               | None     | ES             | Gowex                                  | 1, 0, 0, 1, 1 | Unknown              |
| RED_LIBRE_AVILES_WILOC                                                    | None     | ES             | Gowex                                  | 1, 0, 0, 1, 1 | Unknown              |
| GIJON WIFI                                                                | None     | ES             | Gowex                                  | 1, 0, 0, 1, 1 | Unknown              |
| 01MIERESWIFI                                                              | None     | ES             | Gowex                                  | 1, 0, 0, 1, 1 | Unknown              |
| 01EibarWifi                                                               | None     | ES             | Gowex                                  | 1, 0, 0, 1, 1 | Unknown              |
| WIFIBUR                                                                   | None     | ES             | Gowex                                  | 1, 0, 0, 1, 1 | Unknown              |
| ValladolidWiFi                                                            | None     | ES             | Gowex                                  | 1, 0, 0, 1, 1 | Unknown              |
| 01PuertoDelRosarioWiFi                                                    | None     | ES             | Gowex                                  | 1, 0, 0, 1, 1 | Unknown              |
| PT-WIFI                                                                   | None     | PT             | PTWiFi                                 | 1, 0, 0, 0, 1 | Unknown              |
| FON_ZON_FREE_INTERNET                                                     | None     | PT             | ZON                                    | 1, 0, 0, 0, 1 | Unknown              |
| [WiFi Zone - The Cloud](https://www.thecloud.net/free-wifi/support/faqs/) | None     | EUR (GB)       | [The Cloud](https://www.thecloud.net/) | 1, 1, 1, 1, 1 | Unknown              |
| [Mycloud](https://www.thecloud.net/free-wifi/support/faqs/)               | None     | EUR (GB)       | [The Cloud](https://www.thecloud.net/) | 1, 1, 1, 1, 1 | Unknown              |
| [WLAN Zone - The Cloud](https://www.thecloud.net/free-wifi/support/faqs/) | None     | EUR (GB)       | [The Cloud](https://www.thecloud.net/) | 1, 0, 0, 0, 1 | Unknown              |
| [_The Cloud](https://www.thecloud.net/free-wifi/support/faqs/)           | None     | EUR (GB)       | [The Cloud](https://www.thecloud.net/) | ?             | After v1024          |
| FREESPOT                                                                  | None     | JPN            | FREESPOT                               | 1, 1, 1, 1, 1 | Unknown              |
| [TSUTAYA](http://www.tsutaya.co.jp/tc/game/deds/about.html)               | None     | JPN            | TSUTAYA                                | ?             | Unknown              |
| Wayport_Access                                                            | None     | USA            | McDonalds                              | ?             | After v1024          |
| Boingo Hotspot                                                            | None     | USA            | Boingo                                 | ?             | Unknown              |
| ibahn                                                                     | None     | USA            | iBAHN                                  | ?             | Unknown              |
| BELLWIFI@MCDONALDS                                                        | None     | USA (Canada)   | Bell                                   | ?             | After v1024          |
| [free-hotspot.com](http://www.free-hotspot.com/)                          | None     | EUR            | free-hotspot.com                       | ?             | After v1024          |
| Bestbuy                                                                   | WPA2-PSK | USA            | Bestbuy                                |               | After v1024          |

See also
[this](http://yls8.mtheall.com/ninupdates/3ds_nzonehotspots.php).

#### NZone hotspots only accessible via NZone beacons

| SSID                                              | Security | Region/country | ServiceName                 | Notes                                                                                |
|---------------------------------------------------|----------|----------------|-----------------------------|--------------------------------------------------------------------------------------|
| noasp03                                           | None     | USA            | NOA (Nintendo event at GDC) |                                                                                      |
| BestBuy                                           | None     | USA            | BestBuy                     |                                                                                      |
| [7SPOT](http://webapp.7spot.jp/howtoconnect.html) | None     | JPN            | 7-11                        | A LAN-only hostname used is for the retailer's site linked to from the NZone server. |

The above hotspots can only be accessed by broadcasting NZone beacons
which contain the encrypted Nintendo tag data.

#### Hotspot Notes

- These can be configured on you own router/laptop/phone to identify as
  a Nintendo Zone.
- You will need an available Internet connection to be able to connect
  to the servers.
- After connecting the Wi-Fi network, the page displayed will be of the
  device's region. (Some regions, such as Australia, will not be
  redirected to a local Nintendo Zone page as there are no plans to
  introduce Nintendo Zone(s) to that region. If a 3DS has its region set
  to one of these regions where there are no plans to introduce a
  Nintendo Zone, they will be brought to the Nintendo Zone of the region
  of the SSID)
- If you intend to create a permanent, private, Nintendo Zone WiFi spot.
  It is recommended that you enable MAC address filtering to only allow
  your devices. As using any form of encryption will prevent the
  Nintendo Zone WiFi spot from working with your 3DS.
