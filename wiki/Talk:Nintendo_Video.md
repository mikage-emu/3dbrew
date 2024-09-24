I've got an email from one of the persons who also tried spoofing Video
servers and he made some interesting points:

- last number in the path sometimes differs, for example, his 3DS
  requests /1/COUNTRYCODE/10 instead of /1/COUTRYCODE/1, no matter which
  country I set in my console's settings
  - this person's 3DS has Russian set as the default language, so the
    last number might indicate console's language
- each coutnry's videos seem to be encrypted with a special
  country-specific key, because same videos (i.e. the ones that look the
  same when are played in Video app) downloaded from different regions
  have different files
- even though the videos seem to be encrypted with a country-specific
  key, you can put videos from any region in any other region folder
  (i.e., you can download /1/77/1/ESP_MD1 from the real server and put
  it in /1/110/1/ on your spoofed server, and the 3DS will still play)
  - perhaps all the videos are encrypted with the same key, but the
    encrypted files look different because of some value in the video's
    data that changes between countries...
    --[Luigi2us](User:Luigi2us "wikilink") 13:28, 22 July 2011 (CEST)
    - maybe the key is based on a timestamp --[Duke
      srg](User:Duke_srg "wikilink") 14:19, 22 July 2011 (CEST)
      - IMO given the above info where NVideo still plays the video from
        other regions,(and also since videos' ciphertext in the same
        country don't match at all) it's likely an AES-CTR fixed key
        with metadata including at least release date timestamp for CTR.
        --[Yellows8](User:Yellows8 "wikilink") 05:53, 23 July 2011
        (CEST)
        - BTW, video can be played from other countries within the
          region, but not from the other region. I.e. USA video can't be
          played on EUR console and vice versa. --[Duke
          srg](User:Duke_srg "wikilink") 06:05, 23 July 2011 (CEST)
- files contain information about where they're located on the screen,
  i.e. if you rename ESP_MD2 to ESP_MD1, it will still be shown in the
  top-right corner after it's downloaded

--[Popoffka](User:Popoffka "wikilink") 06:44, 20 July 2011 (CEST)

I've just tested setting a different languges, the last number in the
path os definitely a language code:

- 1 - English
- 2 - Francias
- 3 - Deutsch
- 4 - Italiano
- 5 - Espanol
- 8 - Netherlands
- 9 - Portugues
- 10 - Russian

Got some videos. Unknown 4 (3?) bytes in the header seems to be an
unique id of video, at leas it increments with video release time. UK
server returns the same video for all alnguages, German servers videos
for languages 2-10 ar ethe same and seems to have the same content with
language-1 video but cyphered with another key? French servers acts like
German, except that slot-2 video for at least language-10 (Russian) have
another size than language-1 video, but seems to have the same content.

--[Duke srg](User:Duke_srg "wikilink") 09:29, 21 July 2011 (CEST) For US
regons files named ESE_MD\*. Files can be renamed to ESP\*, but download
is aborted by 3DS on non-native region console --[Duke
srg](User:Duke_srg "wikilink") 09:28, 22 July 2011 (CEST)

Videos that a expired are downloaded from the spoofed server but not
shown, regardless on the date set on the console. Console should check
video availability or real date online for that. But not all videos
expiring with the date mentioned in description, it seems that there is
a property in file that defines whether that video should not be shown
after expire date. --[Duke srg](User:Duke_srg "wikilink") 04:23, 23 July
2011 (CEST)

Checked all european servers. Here is the list of all countries
available in curent version of Nintendo Video player with server status

| Country        | Status               |
|----------------|----------------------|
| Australia      | online               |
| Austria        | online               |
| Belgium        | online               |
| Czech Republic | online, but no video |
| Finland        | online, but no video |
| France         | online               |
| Germany        | online               |
| Greece         | online               |
| Denmark        | online               |
| Ireland        | online, but no video |
| Italy          | online               |
| Luxembourg     | online               |
| Netherlands    | online               |
| New Zealand    | online               |
| Norway         | online               |
| Poland         | online               |
| Portugal       | online               |
| Russia         | offline              |
| Sweden         | online               |
| Switzerland    | online               |
| South Africa   | offline              |
| Spain          | online               |
| Turkey         | online, but no video |
| United Kingdom | online               |

All other countries are not available in current version of the Nintendo
Video client. Offline and no video servers should be checked from the
native region to make certain. Russia is offline for sure, but as for
Portugal, it should work because this service was earlier announced to
start. --[Duke srg](User:Duke_srg "wikilink") 09:56, 25 July 2011 (CEST)

As for other regions, video is available in Japan, USA, Canada and
Mexico --[Duke srg](User:Duke_srg "wikilink") 11:28, 25 July 2011 (CEST)

It seems that japan clients is a bit smarter. It requests ESJ_CNF file,
which is the small 1074 bytes 'boss' type file with a timestamp of "Thu,
1 Jan 1970 04:07:54 UTC". Without that file videos just starting to
download and terminates immidiately --[Duke
srg](User:Duke_srg "wikilink") 08:09, 27 July 2011 (CEST)

- Can somebody with a Japanese 3DS confirm this? Also, can somebody
  check if the ESP_CNF (or ESE_CNF) file exists on other region's
  servers? I can't do that myself because I'm in Thailand ATM and I have
  very limited internet access. --[Popoffka](User:Popoffka "wikilink")
  08:06, 28 July 2011 (CEST)
  - This is confirmed, I've checked all that stuff with european, USA
    and Japan consoles. On all that regions video was successfully
    downloaded from the spoofed server and played.--[Duke
    srg](User:Duke_srg "wikilink") 08:13, 28 July 2011 (CEST)

<!-- -->

- Needed to confirm video availability in Finland, Greece, Ireland and
  Portugal. It should be there but I still can't find working proxy for
  these countries. --[Duke srg](User:Duke_srg "wikilink") 10:58, 31 July
  2011 (CEST)