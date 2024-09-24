+++
title = 'Nintendo Video'
+++

**Nintendo Video** is a service allowing owners of American, Japanese,
and European 3DS's to download and watch various videos offered by
Nintendo. Nintendo Video uses SpotPass to download videos, even when the
Nintendo Video app itself is not running. Nintendo Video was
discontinued March 31, 2014.

**Eurosport** is a service similar to **Nintendo Video** and allowing
owners of European 3DS's to download and watch various videos offered by
Eurosport. Eurosport was discontinued December 31, 2012.

## Internet connection

To identify your 3DS's region and country, different URLs are requested
by 3DS's from different countries. A URL contains a subdomain that's
specific for your region (EU/USA/JP), a country code that's specific to
your country, and a language code. Here's a table containing country
codes and subdomains known so far and their corresponding file names:

| Country              | Region subdomain | File name |
|----------------------|------------------|-----------|
| EUR (Nintendo Video) | pubeu-p          | ESP_MD    |
| EUR (Eurosport)      | pubes-p          | EWP_MD    |
| USA                  | pubus-p          | ESE_MD    |
| Japan                | pubjp-p          | ESJ_MD    |

See <http://www.wiibrew.org/wiki/Country_Codes> for the country codes.

Language codes known so far:

| Language    | Code | Region  |
|-------------|------|---------|
| Japanese    | 0    | Japan   |
| English     | 1    | EUR/USA |
| French      | 2    | EUR/USA |
| German      | 3    | EUR     |
| Italian     | 4    | EUR     |
| Spanish     | 5    | EUR/USA |
| Netherlands | 8    | EUR     |
| Portuguese  | 9    | EUR/USA |
| Russian     | 10   | EUR     |

In all requests below, *COUNTRYCODE* should be replaced with your
country's code, *COUNTRYSUBDOMAIN* should be replaced with your region's
subdomain. *FILENAME* are also depends on the region and should be
replaced correspondingly. *LANGUAGECODE* should be replaced by a desired
language (by now most of the content are the same for all available
languages, so one can use "1" as a most common).

Surprisingly, Nintendo Video uses plain unencrypted HTTP connection to
transfer videos. When "connectivity check" button is pressed, Nintendo
Video sends a following HTTP request to
*COUNTRYSUBDOMAIN*.est.c.app.nintendowifi.net:

<tt>GET /1/*COUNTRYCODE*/*LANGUAGECODE*/CHECK HTTP/1.1

Host: *COUNTRYSUBDOMAIN*.est.c.app.nintendowifi.net</tt>

As you can see, no console-specific data is being sent. The server
responds with either a 403 or 404 error code, where 403 means that
user's region (determined by IP, I guess) doesn't match the region
specified by *COUNTRYCODE* and *COUNTRYSUBDOMAIN* and 404 means that
everything's OK.

If everything is OK with the region check, the 3DS proceeds to download
videos. It seems that support for only four videos is hardcoded into
Nintendo Video app, because it makes following requests (to the same
server as the CHECK query):

<tt>GET /1/*COUNTRYCODE*/*LANGUAGECODE*/*FILENAME*1 HTTP/1.1

Host: *COUNTRYSUBDOMAIN*.est.c.app.nintendowifi.net</tt>

<tt>GET /1/*COUNTRYCODE*/*LANGUAGECODE*/*FILENAME*2 HTTP/1.1

Host: *COUNTRYSUBDOMAIN*.est.c.app.nintendowifi.net</tt>

<tt>GET /1/*COUNTRYCODE*/*LANGUAGECODE*/*FILENAME*3 HTTP/1.1

Host: *COUNTRYSUBDOMAIN*.est.c.app.nintendowifi.net</tt>

<tt>GET /1/*COUNTRYCODE*/*LANGUAGECODE*/*FILENAME*4 HTTP/1.1

Host: *COUNTRYSUBDOMAIN*.est.c.app.nintendowifi.net</tt>

*FILENAME* seems to return a 403 error if the user's region doesn't
match, 404 if the video doesn't exist and the video itself otherwise. As
of July 18th, 2011, only 1st and 2nd videos are available from UK IP
addresses.

For Japan region /1/1/0/ESJ_CNF must also present on a server in order
to play video files.

These videos can easily be downloaded from any computer with IP address
that matches country specified by *COUNTRYCODE*, *COUNTRYSUBDOMAIN* and
*LANGUAGECODE* using wget without any special settings. Videos are
region-locked.

## SD storage

Downloaded videos are stored in the SD card
[Extdata](Extdata "wikilink"), from the decrypted
[SpotPass](SpotPass "wikilink") content payload, adding an additional
header to them. Country info is presumably stored in this metadata,
region-lock is handled by the BOSS module via the programID in the
[payload header](SpotPass#Payload_Content_Header "wikilink").

While the SpotPass payload uses little-endian, the extra header added to
the Extdata is stored in big-endian.

| Offset | Length | Notes                              |
|--------|--------|------------------------------------|
| 0x0    | 0x4    | Unknown, value is 0x18             |
| 0x4    | 0x14   | ?                                  |
| 0x18   | 0x8    | TitleID of Nintendo Video          |
| 0x20   | 0x8    | ?                                  |
| 0x28   | 0x4    | File size                          |
| 0x2C   | 0x4    | ?                                  |
| 0x30   | 0x4    | Release date (integer, YYYYmmddhh) |
| 0x34   |        | SpotPass payload                   |

## File format

The SpotPass content downloaded for Nintendo Video uses the
[SpotPass](SpotPass "wikilink") content container format, see the
SpotPass page for info on the container format. At the end of the video
file is a JPEG, which contains the video thumbnail, and various
advertising metadata (interactive links) including the URL associated
with the video. The text shown on the web browser button is also stored
in the interactive links.

Region info is stored in the decrypted SpotPass crypto layer, see above
SD section.

The following entries use little-endian.

### Header

| Offset | Length | Notes                                                            |
|--------|--------|------------------------------------------------------------------|
| 0x0    | 0x4    | Start address of header? (0x0)                                   |
| 0x4    | 0x4    | End address of header                                            |
| 0x8    | 0x4    | Start address of metadata and video                              |
| 0xC    | 0x4    | End address of metadata and video                                |
| 0x10   | 0x4    | Video thumbnail length                                           |
| 0x14   | 0x4    | Unknown (padding?)                                               |
| 0x18   |        | [Interactive links header](#Interactive_links_header "wikilink") |
|        |        | [Metadata](#Metadata "wikilink")                                 |

### Metadata

| Offset | Length                      | Notes                                                                                  |
|--------|-----------------------------|----------------------------------------------------------------------------------------|
| 0x0    | 0x4                         | Metadata length (0x248)                                                                |
| 0x4    | 0x20                        | Video ID (M<shortvidtitle>video ID)                                                    |
| 0x24   | 0x8                         | [Release date](#Timestamp "wikilink")                                                  |
| 0x2C   | 0x8                         | [Expire date](#Timestamp "wikilink")                                                   |
| 0x34   | 0x78                        | UTF-16 video title                                                                     |
| 0xAC   | 0x8                         | ?                                                                                      |
| 0xB4   | 0x4                         | Video length                                                                           |
| 0xB8   | 0x190                       | UTF-16 video description                                                               |
| 0x248  | 0x20 \* number of links     | Interactive link IDs (I<shortvidtitle>video ID)                                        |
|        | Video size                  | Mobiclip .moflex video data (first word here is little-endian magic number 0xABAA324C) |
|        | Thumbnail size              | Video thumbnail                                                                        |
|        | Interactive links data size | [Interactive links data](#Interactive_links_data "wikilink")                           |

### Timestamp

The release and expire date are stored using a custom timestamp, where
each value (year, month, day...) is stored as unique bytes.

| Offset | Length | Notes    |
|--------|--------|----------|
| 0x0    | 0x2    | Year     |
| 0x2    | 0x1    | Month    |
| 0x3    | 0x1    | Day      |
| 0x4    | 0x1    | Hours    |
| 0x5    | 0x1    | Minutes  |
| 0x6    | 0x1    | Seconds  |
| 0x7    | 0x1    | Padding? |

### Interactive links

Interactive links are structures that store the advertising and
thumbnail data that is displayed to the user during the video playback.

#### Interactive links header

| Offset | Length | Notes                                        |
|--------|--------|----------------------------------------------|
| 0x0    | 0x4    | Number of interactive links                  |
| 0x4    | 0x4    | Address of interactive link data             |
| 0x8    |        | Address of additional interactive links data |

#### Interactive links data

Interactive links store a thumbnail image as a JPEG image.

| Offset | Length         | Notes                                                        |
|--------|----------------|--------------------------------------------------------------|
| 0x0    | 0x4            | Metadata length (0x16C)                                      |
| 0x4    | 0x30           | Interactive link ID (I<shortvidtitle>video ID)               |
| 0x34   | 0x8            | Unknown                                                      |
| 0x3C   | 0x100          | URL address of link. For eShop link, use (tiger://<TitleID>) |
| 0x13C  | 0x4            | Button link color (RGBA)                                     |
| 0x140  | 0x28           | UTF-16 button link text                                      |
| 0x168  | 0x4            | Thumbnail length                                             |
|        | Thumbnail size | Thumbnail image                                              |

## Server spoofing

In case you want to try messing with Nintendo Video, here's a
description of what I did:

1.  Set up a DNS server using bind9, which returned my IP as the IP for
    pubeu-p.est.c.app.nintendowifi.net [(bind
    config)](http://pastie.org/2230422).
    1.  Don't forget to replace MY_IP in config with your IP address,
        but **don't** replace the IP of conntest.nintendowifi.net
        service
2.  Set up an HTTP server using nginx and put ESP_MD1, ESP_MD2 (which I
    have downloaded from Nintendo's servers earlier, see above) in my
    /var/www/1/110/1/ folder.
3.  Configured my 3DS to use my DNS server as both primary and secondary
    DNS server.
4.  ???
5.  PROFIT!

This can be done with any DNS server and HTTP server, as long as you
spoof everything correctly. It is possible on Windows. I have not tried
Mac OS X.

Unfortunately, this currently has little use since Nintendo shut the
services down. However, they can still be spoofed if you have everything
still on your 3DS. Spoofing your own videos could be possible, but you
can already watch videos with the web browser and something like
Universal Media Server.

## External links

- [A video showing Nintendo Video server being
  spoofed](http://www.youtube.com/watch?v=Tl8QYofL1tg)