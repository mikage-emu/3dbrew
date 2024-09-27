The Nintendo 3DS eShop was added in the June 2011 update for JP/EUR/USA.

From here, you can download Virtual Console games, 3D Classics, DSiware
software, view screenshots, and 3D trailers for upcoming 3DS titles.

While eShop is loading, eShop will use command
[NIMS:CheckSysupdateAvailableSOAP](NIMS:CheckSysupdateAvailableSOAP "wikilink").
If a system update is available where title installation for system
titles still needs finalized (or when the updated titles were not
downloaded at all), eShop will then display the "system update is
available" message.

The eShop application uses command
[AMNet:FinishInstallToMedia](AMNet:FinishInstallToMedia "wikilink") to
finalize the SD title install (if the whole title is downloaded while
eShop is still running), however, before using that command the eShop
application also uses
[AMNet:FinishInstallToMedia](AMNet:FinishInstallToMedia "wikilink") to
finalize installing all system titles (from system updates).

## eShop QR Codes

eShop QR Codes can be scanned with the camera, allowing one to quickly
navigate to the desired eShop title with just two clicks. The QR Codes
themselves is a simple text/url QR, started with "ESHOP://" string
followed by a decimal eShop content link id(same IDs used internally by
eShop for all content) and then some special data, delimited by a dot
symbol, which can be ommited.

In order for the QR-code string data to be valid for eShop, it must
begin with "ESHOP://5", with the first ID being all decimal.

| QR Code source                      | Region | Title                                                                         | Serial | Title ID         |
|-------------------------------------|--------|-------------------------------------------------------------------------------|--------|------------------|
| ESHOP://50010000000201.PEAALL000000 | EUR    | nintendogs + cats: Golden Retriever & New Friends                             | ADAP   | 0004000000030C00 |
| ESHOP://50010000007463.J00101Z00061 | JPN    | Pushmo                                                                        | JCAJ   | 0004000000068D00 |
| ESHOP://50010000007870.PEAALL000000 | EUR    | Crush 3D                                                                      | ACRP   | 0004000000040400 |
| ESHOP://50010000008009.PEAALL000000 | EUR    | Resident Evil Revelations                                                     | ABRE   | 000400000005EE00 |
| ESHOP://50010000008123.J00101Z00095 | JPN    | Rhythm Kaitou R: Koutei Napoleon no Isan                                      | ARTJ   | 0004000000078100 |
| ESHOP://50010000008404.PEAALL000000 | EUR    | Mario & Sonic at the London 2012 Olympic Games                                | ACMP   | 0004000000054900 |
| ESHOP://50010000008447.J00101Z00094 | JPN    | Biohazard Revelations                                                         | ABRJ   | 0004000000053B00 |
| ESHOP://50010000008449.J00101Z00082 | JPN    | Itsu no Ma ni Koukan Nikki                                                    | JFRJ   | 0004000000051600 |
| ESHOP://50010000008561              | USA    | Swapnote                                                                      | JFRE   | 0004000000051700 |
| ESHOP://50010000008647.J00101Z00096 | JPN    | Metal Gear Solid Snake Eater 3D                                               | AMGJ   | 000400000007A000 |
| ESHOP://50010000008648.J00101Z00097 | JPN    | Theatrythm Final Fantasy                                                      | ATHJ   | 0004000000078200 |
| ESHOP://50010000008782.PEAALL000000 | EUR    | Metal Gear Solid Snake Eater 3D                                               | AMGE   | 0004000000082400 |
| ESHOP://50010000008842.PEAALL000000 | EUR    | Rhythm Thief And The Emperor's Treasure                                       | ARTP   | 000400000006DA00 |
| ESHOP://50010000009084.J00101Z00121 | JPN    | Hatsune Miku And Future Stars: Project Mirai                                  | AM9J   | 0004000000048000 |
| ESHOP://50010000009102.J00101Z00106 | JPN    | Denpa Ningen no RPG                                                           | JD8J   | 0004000000077E00 |
| ESHOP://50010000009161.J00101Z00118 | JPN    | The Rolling Western                                                           | JAMJ   | 0004000000059B00 |
| ESHOP://50010000009261              | USA    | Dillon's Rolling Western                                                      | JAME   | 000400000007C400 |
| ESHOP://50010000009401.J00101Z00120 | JPN    | Kingdom Hearts 3D Nintendo Direct 2012.2.22 Video                             | JZ8J   | 0004000000092E00 |
| ESHOP://50010000009403.J00101Z00119 | JPN    | Dragon Quest Monsters: Terry no Wonderland 3D Nintendo Direct 2012.2.22 Video | JZ7J   | 0004000000092F00 |
| ESHOP://50010000009575.PEAALL000000 | EUR    | Kid Icarus: Of Myths And Monsters (Virtual Console)                           | RBLP   | 0004000000069500 |
| ESHOP://50010000009846              | USA    | Ketzal's Corridors                                                            | JELE   | 0004000000083800 |
| ESHOP://50010000010434              | USA    | New Super Mario Bros. 2 Trailer                                               |        |                  |
| ESHOP://50010000014732.J00101Z00407 | JPN    | Chain Blaster                                                                 | JCBJ   | 00040000000DCC00 |

- New QR Code for Japanese "Photos with Super Mario" has a different
  code string:
  ESHOP://50010000013120.J00108Z00001.CD588EAE95A3A68D15C647DA2AC0945FD88F70AB8A31149E51C4B05FB927B0B8

<!-- -->

- There is a link in the Japanese eShop
  \[http://www.nintendo.co.jp/3ds/eshop/qrCode.html?####\] where you can
  replace the \#### with the Japanese eShop title's serial and you will
  get it's QR code. (i.e.
  <http://www.nintendo.co.jp/3ds/eshop/qrCode.html?JCAJ> will get you
  the pushmo QR code)

<!-- -->

- You could use Google's Chart API to create a QR code from the codes
  above:
  <https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=ESHOP>
  (replace the ESHOP text with the ESHOP:// link from one of the above)

## NS eShop application parameters

This section describes the 0x1C-byte structure stored at the application
parameters from
[<APT:StartApplication>](APT:StartApplication "wikilink"), under the
0x300-byte buffer listed there.

| Offset | Size | Description                                                                                         |
|--------|------|-----------------------------------------------------------------------------------------------------|
| 0x0    | 0x4  | Unknown, usually 0x3?                                                                               |
| 0x4    | 0x4  | Unknown, usually 0x0?                                                                               |
| 0x8    | 0x8  | u64 binary eShop content ID, same ID from the first string in eShop QR-codes except in binary form. |
| 0x10   | 0x10 | This is the last string from the QR-code(if any), no NUL-termination.                               |

## ExtData

The ExtData [File System](Extdata#Filesystem "wikilink") for eShop is as
follows:

`root`
`├── icon`
`├── boss`
`│   └── TIGER100.tmp`
`└── user`

| File         | Details                                                 | Size                   | Firmware Introduced           | Plain text                                                                                |
|--------------|---------------------------------------------------------|------------------------|-------------------------------|-------------------------------------------------------------------------------------------|
| icon         | Duplicate from application ExeFS. Always image 00000002 | 0x36C0 Bytes           | [2.0.0-2](2.0.0-2 "wikilink") | [Download_EUR](https://dl.dropboxusercontent.com/u/60710927/CTR/Sample/eShopExtdata/icon) |
| TIGER100.tmp | Always image 00000003.                                  | 0xCE47 bytes (varies?) | [2.0.0-2](2.0.0-2 "wikilink") |                                                                                           |

## Music

The eShop pulls its music from a static, region-specific link in a
format similar to the following:

https://a248.e.akamai.net/f/248/103046/10m/npdl.c.app.nintendowifi.net/p01/nsa/CtfKXACbUPl8s7lk/BGM1/\<region\>_BGM1,
where region is one of the primary system regions (JP, US, EU, KR, etc.)
Support also exists for 'BGM2', but this seems to be unused. The music
is held in a [BOSS](SpotPass "wikilink") container.

The format consists of a brief XML header describing the audio
(including the date it was set as the main eShop theme, loop times,
size, etc) followed by a raw AAC stream. Tools such as FFmpeg can handle
rebuilding this stream with ADTS headers for proper time info and such.

The [Home Menu](Home_Menu "wikilink") uses nearly the same format for
the Theme Shop's background music.

## URLs

eShop uses the following domains over HTTPS:

- cp3s-auth.c.shop.nintendowifi.net
- a248.e.akamai.net
- ninja.ctr.shop.nintendo.net
- samurai.ctr.shop.nintendo.net
- ccif.ctr.shop.nintendo.net
- eou.c.shop.nintendowifi.net

These domains are used by [NIM](NIM_Services "wikilink"):

- nus.c.shop.nintendowifi.net
- ecs.c.shop.nintendowifi.net
- cas.c.shop.nintendowifi.net

ninja.ctr.shop.nintendo.net and samurai.ctr.shop.nintendo.net contain
the bulk of the eShop information.

Requests with the following parameters will always return XML unless the
header "Accept: application/json" is used, in which case JSON will be
returned.

### Common Parameters to ninja and samurai

For every request to the ninja and samurai servers, three parameters are
always sent, though are not necessarily required:

| Parameter | Required                       | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | Type                    | Normal value                                     |
|-----------|--------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------|--------------------------------------------------|
| shop_id   | depends on the URL, usually no | Describes which eShop instance should be used. 1 indicates the 3DS eShop, 2 indicates the Wii U eShop. 3 yields the same results as 2 but uses the img-eshop image server. 4 yields similar results as 3 but includes VC titles and updates, lacks image links for /titles and lacks release dates, prices and whether eShop and web sales are possible. For 4, links are given in both MP4 and Moflex formats for movies. Values greater than 4 or less than 1 are invalid. Defaults to 2 if not given. | unsigned integer        | 1                                                |
| lang      | no                             | Describes the language. Seems to be an ISO 639-1 code in lower case. Every eShop region has a default language that is used if this parameter is not given. Some regions have multiple languages, such as CA (en and fr).                                                                                                                                                                                                                                                                                | string (two characters) | depends on region and eShop settings; for US: en |
| _type    | no                             | Describes whether the client wants to receive JSON or XML. This parameter seems actually unused and the servers always return XML.                                                                                                                                                                                                                                                                                                                                                                       | string                  | json                                             |

### samurai

samurai.ctr.shop.nintendo.net (samurai) provides metadata about titles.
The samurai server provides the backend for the eShop title search.

Common parameters described above can always be sent.

<table>
<thead>
<tr class="header">
<th><p>Path</p></th>
<th><p>Description</p></th>
<th><p>Parameters</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>/samurai/ws/<strong>region</strong>/contents</p></td>
<td><p>Fetches the content list, containing basic content information
like the content id (not the 3DS title id), the product code and the
localized title name</p></td>
<td><p>All of these are optional.</p>
<ul>
<li>genre[]: genre ID (unsigned int)</li>
<li>publisher[]: publisher ID (unsigned int)</li>
<li>price_min: minimum price in region currency (signed int)</li>
<li>price_max: maximum price in region currency (signed int)</li>
<li>video_format: "moflex"</li>
<li>freeword: keyword(s?) to look for (string)</li>
<li>limit: maximum results</li>
<li>offset: results to skip</li>
<li>sort: one of "new", "popular" or "score"</li>
<li>release_date_before: date/time title must have been released before
(UNIX timestamp prefixed by +)</li>
<li>release_date_after: date/time title must have been released after
(UNIX timestamp prefixed by -)</li>
</ul></td>
</tr>
<tr class="even">
<td><p>/samurai/ws/<strong>region</strong>/titles</p></td>
<td><p>Same as /contents but only shows software titles</p></td>
<td><p>see /contents</p></td>
</tr>
<tr class="odd">
<td><p>/samurai/ws/<strong>region</strong>/title/<strong>content
id</strong></p></td>
<td><p>Returns information about the title, more verbose than
/titles.</p></td>
<td><p>(none)</p></td>
</tr>
<tr class="even">
<td><p>/samurai/ws/<strong>region</strong>/title/<strong>content
id</strong>/aocs</p></td>
<td><p>Returns a list of add-on contents/downloadable content and prices
in eShop region currency.</p></td>
<td><p>(none)</p></td>
</tr>
<tr class="odd">
<td><p>/samurai/ws/<strong>region</strong>/demo/<strong>content
id</strong></p></td>
<td><p>Returns information about a demo. Content ID is available in the
main game's /title entry.</p></td>
<td><p>(none)</p></td>
</tr>
<tr class="even">
<td><p>/samurai/ws/<strong>region</strong>/movies</p></td>
<td><p>Same as /contents but only shows movies</p></td>
<td><p>see /contents</p></td>
</tr>
<tr class="odd">
<td><p>/samurai/ws/<strong>region</strong>/movie/<strong>content
id</strong></p></td>
<td><p>Returns information about the movie, more verbose than
/movies.</p></td>
<td><p>(none)</p></td>
</tr>
<tr class="even">
<td><p>/samurai/ws/<strong>region</strong>/news</p></td>
<td><p>eShop news section</p></td>
<td><p>(none)</p></td>
</tr>
<tr class="odd">
<td><p>/samurai/ws/<strong>region</strong>/telops</p></td>
<td><p>Scrolling news on the top screen</p></td>
<td><p>shop_id is required</p></td>
</tr>
<tr class="even">
<td><p>/samurai/ws/<strong>region</strong>/directories</p></td>
<td><p>Returns a list of directories available on the regional server
with the name, image, id used for the directory api point, etc.</p></td>
<td><p>pattern: Unsure of the purpose, default value is B from what I
can tell.</p></td>
</tr>
<tr class="odd">
<td><p>/samurai/ws/<strong>region</strong>/directory/<strong>(long long
unsigned int)</strong> and
/samurai/ws/<strong>region</strong>/directory/~<strong>(string)</strong></p></td>
<td><p>Collections, like sales</p></td>
<td><p>(none)</p></td>
</tr>
<tr class="even">
<td><p>/samurai/ws/<strong>region</strong>/genres</p></td>
<td><p>Returns a list of human-readable genre names and their
corresponding genre id.</p></td>
<td><p>(none)</p></td>
</tr>
<tr class="odd">
<td><p>/samurai/ws/<strong>region</strong>/publishers</p></td>
<td><p>Returns a list of human-readable publisher names and their
corresponding publisher id.</p></td>
<td><p>(none)</p></td>
</tr>
<tr class="even">
<td><p>/samurai/ws/<strong>region</strong>/platforms</p></td>
<td><p>Returns a list of human-readable platform names and their
corresponding platform id.</p></td>
<td><p>(none)</p></td>
</tr>
<tr class="odd">
<td><p>/samurai/ws/<strong>region</strong>/languages</p></td>
<td><p>Returns a list of languages available on the regional server with
the ISO 639-1 code used for the lang parameter.</p></td>
<td><p>(none)</p></td>
</tr>
</tbody>
</table>

### ninja

ninja.ctr.shop.nintendo.net (ninja) contains the seeds for the new 9.6
crypto, pricing information and handles actions that require
authentication, such as purchases. Authentication information seems to
be obtained from the [act:u sysmodule](ACT_Services "wikilink") and
works through OAuth2.

| Path                                              | Description                                                                                                 | Parameters                              |
|---------------------------------------------------|-------------------------------------------------------------------------------------------------------------|-----------------------------------------|
| /ninja/ws/**region**/title/**content id**/ec_info | Contains information about the title. Such as title id, content size, and if available, the 9.6 crypto seed | (none)                                  |
| /ninja/ws/titles/id_pair                          | Provides the content id for the given title id, or vice versa.                                              | title_id\[\] or ns_uid\[\] is required. |
| /ninja/ws/**region**/tax_locations                | Provides the tax location ID                                                                                | postal_code is required.                |
| /ninja/ws/service_hosts                           | Provides CCIF and Samurai servers                                                                           | country and shop_id is required.        |
| /ninja/ws/country/**region**                      | Various eshop related information for a given region                                                        | (none)                                  |
| /ninja/ws/country/**region**/replenish_amounts    | Provides the amounts of money you can replenish to your account.                                            | (none)                                  |

### Trusted Root CAs

The eShop application itself uses a
[RootCertChain](HTTP_Services "wikilink") for all HTTPS requests, all of
the trusted root CAs are the following
[default](SSLC:RootCertChainAddDefaultCert "wikilink") ones:

- CertID 0x3
- CertID 0x6
- CertID 0x7
- CertID 0x8
- CertID 0x9
- CertID 0xA

### Server changes following the November 2, 2015, maintenance

Pre-v10.0 eShop used an URL like this:
"%s/samurai/ws/%s/title/%llu/other_purchased?shop_id=1&lang=%s&_type=json".
That URL was removed with v10.0. That URL was requested when trying to
load eShop app-pages. Following the maintenance mentioned above, this
page was removed from the server, which broke pre-v10.0 eShop app
whenever it tried to access that page.

URL changes between [9.7.0-25](9.7.0-25 "wikilink") and
[10.0.0-27](10.0.0-27 "wikilink") are (green = add, red = remove):

%s/ninja/ws/%s/titles/online_prices?title%%5B%%5D=%s&lang=%s<span style="color:#00FF00">&include_coupon=true</span>&shop_id=1&_type=json

<span style="color:#00FF00">%s/ninja/ws/%s/coupon/!check?shop_id=1&_type=json</span>

<span style="color:#00FF00">%s/ninja/ws/my/owned_coupons?ns_uid=%llu&shop_id=1&_type=json</span>

<span style="color:#00FF00">%s/ninja/ws/my/owned_coupons?shop_id=1&_type=json</span>

<span style="color:#00FF00">%s/ninja/ws/my/parental_control/!put?shop_id=1&_type=json</span>

<span style="color:#00FF00">%s/ninja/ws/%s/title/%llu/prepurchase_info?%s=%s&shop_id=1&_type=json</span>

<span style="color:#00FF00">%s/samurai/ws/%s/coupon/%llu/titles?lang=%s&limit=%u&offset=%u&shop_id=1&_type=json</span>

<span style="color:#00FF00">%s/ninja/ws/my/auto_billing/plans?limit=%u&offset=%u&shop_id=1&_type=json</span>

<span style="color:#00FF00">%s/ninja/ws/%s/titles/online_prices?title%%5B%%5D=%s&lang=%s&include_coupon=true&coupon_id=%llu&shop_id=1&_type=json</span>

<span style="color:#00FF00">%s/ninja/ws/my/auto_billing/%014llu/!cancel?shop_id=1&_type=json</span>

<span style="color:#FF0000">%s/samurai/ws/%s/title/%llu/other_purchased?shop_id=1&lang=%s&_type=json</span>

<span style="color:#FF0000">%s/samurai/movie/%s/%s/%014llu/moflex</span>

## New3DS

CheckNew3DS is called in two functions. This is only used for disabling
UI button(s) for downloading New3DS titles when running on Old3DS. For
example, on a New3DS patching a CheckNew3DS func-call with \<retval=0\>,
results in the download button on the app page being grayed-out for a
New3DS-only title.

Attempting to download a New3DS-only title with an Old3DS eShop
account(even with a New3DS using an Old3DS account), results in the
ninja server(specifically the "prepurchase_info" page) returning an
error. HTTP 400 is returned with the following json reply:

`000000: 7b 22 65 72 72 6f 72 22 3a 7b 22 63 6f 64 65 22  {"error":{"code"`
`000010: 3a 22 33 31 35 36 22 2c 22 6d 65 73 73 61 67 65  :"3156","message`
`000020: 22 3a 22 54 68 69 73 20 70 72 6f 64 75 63 74 20  ":"This product `
`000030: 63 61 6e 6e 6f 74 20 62 65 20 70 75 72 63 68 61  cannot be purcha`
`000040: 73 65 64 5c 6e 6f 72 20 72 65 64 65 65 6d 65 64  sed\nor redeemed`
`000050: 20 66 6f 72 20 75 73 65 20 6f 6e 20 74 68 69 73   for use on this`
`000060: 20 73 79 73 74 65 6d 2e 5c 6e 5c 6e 49 66 20 74   system.\n\nIf t`
`000070: 68 65 20 70 72 6f 62 6c 65 6d 20 70 65 72 73 69  he problem persi`
`000080: 73 74 73 2c 20 70 6c 65 61 73 65 5c 6e 6d 61 6b  sts, please\nmak`
`000090: 65 20 6e 6f 74 65 20 6f 66 20 74 68 65 20 65 72  e note of the er`
`0000a0: 72 6f 72 20 63 6f 64 65 20 61 6e 64 5c 6e 76 69  ror code and\nvi`
`0000b0: 73 69 74 20 73 75 70 70 6f 72 74 2e 6e 69 6e 74  sit support.nint`
`0000c0: 65 6e 64 6f 2e 63 6f 6d 2e 22 7d 7d              endo.com."}}`

## TitleID checks

There's titleID checks in the system eShop application code for "Pokémon
Omega Ruby". This appears to be used with UI-related code, unknown why.