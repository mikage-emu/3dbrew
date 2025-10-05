+++
title = 'Internet Browser'
+++

The 3DS Internet Browser was added in the June 2011 Update for JPN/EUR/USA.

From the Internet Browser help section:
In compliance with the LGPL, the source code of the OSS is available via the Nintendo website.
This source code can be downloaded here:
[1](http://mediacontent.nintendo-europe.com/NOE/images/service/OpenSources.zip) [2](http://www.nintendo.co.jp/support/oss/index.html)

The 3DS Internet Browser is [Netfront](http://en.wikipedia.org/wiki/Netfront) Browser NX v1.0 based on [WebKit](http://en.wikipedia.org/wiki/WebKit) engine.

On O3DS the exheader name of this title is "SPIDER"; on N3DS, "SKATER".
The only difference between the ExeFS .code for each region of the Old3DS/New3DS browser, is byte values for the title uniqueID/region.

A ["dummy" browser](#dummy-web-browser "wikilink") (which replaces the actual browser) is being included with cartdrige games shipping with system updates starting with [9.9.0-x](9.9.0-26 "wikilink").
In addition, versions of the real browser since 9.9.0-26X attempt to [check-in with a Nintendo server](#forced-system-update "wikilink") to determine if the existing browser version is out of date.

## [New 3DS](New_3DS "wikilink") Internet Browser

New3DS has a separate browser title, with the exheader name "SKATER".
Unlike the Old3DS browser, the New3DS browser has videos+HTML5 support.

This browser also has a filter enabled by default in the JPN version.
Disabling it requires paying money with a credit-card, for [purchasing](NIM_Services "wikilink") web-browser [DLC](Title_list/DLC "wikilink").
During startup the browser does various HTTPS comms. When visting an URL, the browser sends a plaintext HTTP POST here: [3](http://ars.ifuser.jp:20080/ars2/rating). The raw POST data begins with "ARS/2.0\r\n\x00", the rest appears to be encrypted. The server reply content also has this ARS header + encrypted data. This appears to use a fixed xorpad, likely from a fixed encryption CTR/IV. The server content responses for allowed sites, and blocked sites, are fixed. When the server returns that the site is blocked, the browser goes to this page: [4](http://ars.ifuser.jp/filter/44.html)(the Referrer header value is set to the same URL it's actually requesting).

The WebKit source was updated since the Old3DS browser.
The New3DS browser uses the following services: [mvd:STD](MVD_Services "wikilink") and [ir:rst](IR_Services "wikilink")(DLC-related services are used too but those aren't New3DS specific).
Video decoding is done with [mvd:STD](MVD_Services "wikilink"). Audio decoding/playback is done with a browser-specific DSP binary. The Old3DS browser used CSND for audio playback, the New3DS browser doesn't have access to that at all since it uses DSP instead.

### Video / libstagefright

The browser manual includes licenses for Android and PacketVideo. The browser uses libstagefright from Android. Just like WebKit, the browser appears to use a very old version of libstagefright with security/other changes back-ported(for example, the v10.7 browser libstagefright codebase seems to be older than [this](https://android.googlesource.com/platform/frameworks/av/+/ec77122351b4e78c1fe5b60a208f76baf8c67591%5E%21/media/libstagefright/MPEG4Extractor.cpp)). This codebase is missing certain chunk-parsing code for 3GP.

HTTP for libstagefright is internally handled with [HTTPC](HTTP_Services "wikilink"), with a similar(?) set of RootCAs as for browser-version-check.

### User-Agent and Browser Versions

Normal user-agent format: `Mozilla/5.0 (New Nintendo 3DS like iPhone) AppleWebKit/`<WebKit version>` (KHTML, like Gecko) NX/`<Netfront version>` Mobile NintendoBrowser/`<Mobile NintendoBrowser version>`.`<region>

<region> can be one of the following: "JP", "US", or "EU".

Mobile User-Agent is always `Mozilla/5.0 (iPhone; CPU iPhone OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A403 Safari/8536.25`.

| Mobile NintendoBrowser version(displayed in browser settings) | Normal UA | CDN Title-version | Network-only system-update version | Notes |
|----|----|----|----|----|
| 1.0.9934 | Mozilla/5.0 (New Nintendo 3DS like iPhone) AppleWebKit/536.30 (KHTML, like Gecko) NX/3.0.0.5.8 Mobile NintendoBrowser/1.0.9934.<region> | v10 | [9.0.0-20](9.0.0-20 "wikilink") | Initial version. |
| 1.1.9996 | Mozilla/5.0 (New Nintendo 3DS like iPhone) AppleWebKit/536.30 (KHTML, like Gecko) NX/3.0.0.5.10 Mobile NintendoBrowser/1.1.9996.<region> | v1027 | [9.3.0-21](9.3.0-21 "wikilink") | See below regarding OSS changes. |
| 1.2.10085 | Mozilla/5.0 (New Nintendo 3DS like iPhone) AppleWebKit/536.30 (KHTML, like Gecko) NX/3.0.0.5.13 Mobile NintendoBrowser/1.2.10085.<region> | v2051 | [9.6.0-24](9.6.0-24 "wikilink") | See below. |
| None | None | v3075 | v9.9 CUP | v9.9 CUP dummy web-browser, see below. |
| 1.3.10126 | Mozilla/5.0 (New Nintendo 3DS like iPhone) AppleWebKit/536.30 (KHTML, like Gecko) NX/3.0.0.5.15 Mobile NintendoBrowser/1.3.10126.<region> | v3077 | [9.9.0-26](9.9.0-26 "wikilink") | See below. |
| 1.4.10138 | Mozilla/5.0 (New Nintendo 3DS like iPhone) AppleWebKit/536.30 (KHTML, like Gecko) NX/3.0.0.5.17 Mobile NintendoBrowser/1.4.10138.<region> | v4096 | [10.2.0-28](10.2.0-28 "wikilink") | See below. |
| 1.5.10143 | Mozilla/5.0 (New Nintendo 3DS like iPhone) AppleWebKit/536.30 (KHTML, like Gecko) NX/3.0.0.5.19 Mobile NintendoBrowser/1.5.10143.<region> | v5121 | [10.4.0-29](10.4.0-29 "wikilink") | See below. |
| 1.6.10147 | Mozilla/5.0 (New Nintendo 3DS like iPhone) AppleWebKit/536.30 (KHTML, like Gecko) NX/3.0.0.5.19 Mobile NintendoBrowser/1.6.10147.<region> | v6144 | [10.6.0-31](10.6.0-31 "wikilink") | See below. |
| None | None | v7168 | v10.7 CUP | v10.7 CUP dummy web-browser, see below. |
| 1.7.10150 | Mozilla/5.0 (New Nintendo 3DS like iPhone) AppleWebKit/536.30 (KHTML, like Gecko) NX/3.0.0.5.19 Mobile NintendoBrowser/1.7.10150.<region> | v7184 | [10.7.0-32](10.7.0-32 "wikilink") | See below. |
| 1.8.10156 | Mozilla/5.0 (New Nintendo 3DS like iPhone) AppleWebKit/536.30 (KHTML, like Gecko) NX/3.0.0.5.20 Mobile NintendoBrowser/1.8.10156.<region> | v8192 | [11.1.0-34](11.1.0-34 "wikilink") | See below. |
| None | None | v9217 | v11.4 CUP | v11.4 CUP dummy web-browser, see below. |
| 1.9.10160 | Mozilla/5.0 (New Nintendo 3DS like iPhone) AppleWebKit/536.30 (KHTML, like Gecko) NX/3.0.0.5.20 Mobile NintendoBrowser/1.9.10160.<region> | v9232 | [11.4.0-37](11.4.0-37 "wikilink") | See below. |
| 1.10.10166 | Mozilla/5.0 (New Nintendo 3DS like iPhone) AppleWebKit/536.30 (KHTML, like Gecko) NX/3.0.0.5.22 Mobile NintendoBrowser/1.10.10166.<region> | v10272 | [11.9.0-42](11.9.0-42 "wikilink") | See below. |
| 1.11.10172 | Mozilla/5.0 (New Nintendo 3DS like iPhone) AppleWebKit/536.30 (KHTML, like Gecko) NX/3.0.0.5.23 Mobile NintendoBrowser/1.11.10172.<region> | v11264 | [11.14.0-46](11.14.0-46 "wikilink") | See below. |
| 1.12.10178 | Mozilla/5.0 (New Nintendo 3DS like iPhone) AppleWebKit/536.30 (KHTML, like Gecko) NX/3.0.0.5.24 Mobile NintendoBrowser/1.12.10178.<region> | v12289 | [11.15.0-47](11.15.0-47 "wikilink") | See below. |

Note that the latest Old3DS browser WebKit version at the time the initial New3DS browser was released, was the following: 532.8.

The first version of the KOR New3DS browser was v9.6(which was when the New3DS KOR titles were originally added). Each version of the KOR browser has the same NintendoBrowser version as the other regions. The KOR browser has been only updated when the browser for the other regions were updated, hence the title-versions are the same as well. The KOR browser ExeFS .code is different from the other regions(more than just region-related IDs etc).

#### OSS 9.0 and 9.3 diff

The following is a diff of the OSS archives from [here](http://www.nintendo.co.jp/support/oss/index.html), for v9.0 and v9.3.

`Files NewNintendo3DS_OpenSources9.0.0-/WKC/WebCore/platform/network/WKC/ResourceHandleManagerWKC.cpp and NewNintendo3DS_OpenSources9.3.0-/WKC/WebCore/platform/network/WKC/ResourceHandleManagerWKC.cpp differ`  
```
Files NewNintendo3DS_OpenSources9.0.0-/WKC/WebKit/WKC/webkit/WKCVersion.h and NewNintendo3DS_OpenSources9.3.0-/WKC/WebKit/WKC/webkit/WKCVersion.h differ
```

WKC_CUSTOMER_RELEASE_VERSION was changed from "0.5.8" to "0.5.10".

The following code was added to ResourceHandleManager::doRedirect(): curl_easy_setopt(d-\>m_handle, CURLOPT_SHARE, 0);

#### v9.6

WebKit/OSS code was actually updated.
ExeFS .code was updated. The following files in RomFS were updated:

- "/banner/CN/Skater.icn" and "/banner/KR/Skater.icn".
- "/browser/rootca.pem"
- "/build/buildinfo.dat"
- "/cairo.cro.lex" and "/.crr/static.crr"
- "/lyt/Button/ButtonSelectHSearch.arc"
- "/lyt/Kbd/Swkbd.arc"
- "lyt/Kbd.arc"
- "skater.msbt" under all of the "/message/<region>\_<language>/" directories.
- "/oss.cro.lex", "/peer.cro.lex", "/static.crs", and "/webkit.cro.lex".

The following was added to RomFS:

- "/favicon/naver.dat"
- A "KO" directory under "/iwnn".

#### v9.9

ExeFS:/.code was updated.

The only RomFS changes is file-updating, all of the following files were updated:

`/browser/rootca.pem`  
`/build/buildinfo.dat`  
`/cairo.cro.lex`  
`/.crr/static.crr`  
`/message/CN_Simp_Chinese/skater.msbt`  
`/message/EU_Dutch/skater.msbt`  
`/message/EU_English/skater.msbt`  
`/message/EU_French/skater.msbt`  
`/message/EU_German/skater.msbt`  
`/message/EU_Italian/skater.msbt`  
`/message/EU_Portuguese/skater.msbt`  
`/message/EU_Russian/skater.msbt`  
`/message/EU_Spanish/skater.msbt`  
`/message/JP_Japanese/skater.msbt`  
`/message/KR_Hangeul/skater.msbt`  
`/message/TW_English/skater.msbt`  
`/message/TW_Trad_Chinese/skater.msbt`  
`/message/US_English/skater.msbt`  
`/message/US_French/skater.msbt`  
`/message/US_Portuguese/skater.msbt`  
`/message/US_Spanish/skater.msbt`  
`/oss.cro.lex`  
`/peer.cro.lex`  
`/static.crs`  
```
/webkit.cro.lex
```

See [here](https://gist.github.com/yellows8/9fb509fde4112339f342) for a diff of the OSS(WebKitLibraries/ is not included due to the massive cairo library diff). An exploitable security vuln(which was already known in the context of 3DS webkit) was fixed. [Yellows8](User:Yellows8 "wikilink")' private(at the time of writing) exploit for it is based on the PoC from [here](http://pastebin.com/ufBCQKda)(see the pastebin for the actual pastebin author).

#### v10.2

The libstagefright build in the main SKATER codebin was updated to a version which fixed libstagefright vuln(s): the vuln used in [browserhax_fright](browserhax "wikilink") at the time of sysupdate release was fixed. The \*only\* code changed in the main codebin, was code related to libstagefright.

The only RomFS changes is file-updating, all of the following files were updated(see the forced-sysupdate section regarding what changed in the message files):

`/browser/rootca.pem`  
`/build/buildinfo.dat`  
`/.crr/static.crr`  
`/message/CN_Simp_Chinese/skater.msbt`  
`/message/EU_Dutch/skater.msbt`  
`/message/EU_English/skater.msbt`  
`/message/EU_French/skater.msbt`  
`/message/EU_German/skater.msbt`  
`/message/EU_Italian/skater.msbt`  
`/message/EU_Portuguese/skater.msbt`  
`/message/EU_Russian/skater.msbt`  
`/message/EU_Spanish/skater.msbt`  
`/message/JP_Japanese/skater.msbt`  
`/message/KR_Hangeul/skater.msbt`  
`/message/TW_English/skater.msbt`  
`/message/TW_Trad_Chinese/skater.msbt`  
`/message/US_English/skater.msbt`  
`/message/US_French/skater.msbt`  
`/message/US_Portuguese/skater.msbt`  
`/message/US_Spanish/skater.msbt`  
`/oss.cro.lex`  
`/static.crs`  
```
/webkit.cro.lex
```

OSS diff:

`diff --git a/NewNintendo3DS_OpenSources9.9.0-/WKC/WebKit/WKC/webkit/WKCVersion.h b/NewNintendo3DS_OpenSources10.2.0-/WKC/WebKit/WKC/webkit/WKCVersion.h`  
`index 4543297..0860336 100644`  
`--- a/NewNintendo3DS_OpenSources9.9.0-/WKC/WebKit/WKC/webkit/WKCVersion.h`  
`+++ b/NewNintendo3DS_OpenSources10.2.0-/WKC/WebKit/WKC/webkit/WKCVersion.h`  
`@@ -29,7 +29,7 @@`  
` #define WKC_VERSION_CHECK(major, minor, micro) \`  
`     (((major)*10000) + ((minor)*100) + (micro)) >= ((WKC_VERSION_MAJOR*10000) + (WKC_VERSION_MINOR*100) + (WKC_VERSION_MICRO))`  
` `  
`-#define WKC_CUSTOMER_RELEASE_VERSION "0.5.15"`  
`+#define WKC_CUSTOMER_RELEASE_VERSION "0.5.17"`  
` `  
` #define WKC_WEBKIT_VERSION "536.30"`  
` `  
`diff --git a/NewNintendo3DS_OpenSources9.9.0-/webkit/WebCore/ChangeLog b/NewNintendo3DS_OpenSources10.2.0-/webkit/WebCore/ChangeLog`  
`index a5abb35..cf5a9fa 100644`  
`--- a/NewNintendo3DS_OpenSources9.9.0-/webkit/WebCore/ChangeLog`  
`+++ b/NewNintendo3DS_OpenSources10.2.0-/webkit/WebCore/ChangeLog`  
`@@ -1,3 +1,12 @@`  
`+2013-11-05  Ryosuke Niwa  <rniwa@webkit.org>`  
`+`  
`+        Use-after-free in SliderThumbElement::dragFrom`  
`+        `[`https://bugs.webkit.org/show_bug.cgi?id=123873`](https://bugs.webkit.org/show_bug.cgi?id=123873)  
`+`  
`+        Reviewed by Andreas Kling.`  
`+`  
`+        Merge `[`https://chromium.googlesource.com/chromium/blink/+/04a23bfca2d04101a1828d36ff36c29f3a24f34b`](https://chromium.googlesource.com/chromium/blink/+/04a23bfca2d04101a1828d36ff36c29f3a24f34b)  
`+`  
` 2015-02-06  Maciej Stachowiak  <mjs@apple.com>`  
` `  
`         REGRESSION(r179706): Caused memory corruption on some tests (Requested by _ap_ on #webkit).`  
`@@ -879,7 +888,7 @@`  
`         * rendering/RenderLineBoxList.cpp:`  
`         (WebCore::RenderLineBoxList::dirtyLinesFromChangedChild):`  
` `  
`-2014-01-21  LÃ¡szlÃ³ LangÃ³  <llango.u-szeged@partner.samsung.com>`  
`+2014-01-21  Laszlo Lango  <llango.u-szeged@partner.samsung.com>`  
` `  
`         Assertion failure in Range::nodeWillBeRemoved`  
`         `[`https://bugs.webkit.org/show_bug.cgi?id=121694`](https://bugs.webkit.org/show_bug.cgi?id=121694)  
`@@ -1879,7 +1888,7 @@`  
` `  
` 2012-09-14  Simon Fraser  <simon.fraser@apple.com>`  
` `  
`-        REGRESSION: transition doesnât always override transition-property`  
`+        REGRESSION: transition doesnft always override transition-property`  
`         `[`https://bugs.webkit.org/show_bug.cgi?id=96658`](https://bugs.webkit.org/show_bug.cgi?id=96658)  
` `  
`         Reviewed by Dean Jackson.`  
`@@ -3691,8 +3700,8 @@`  
`             glyph with font data for the primary font, presumably to meet the SVG`  
`             spec requirement: "If the references to alternate glyphs do not result`  
`             in successful identification of alternate glyphs to use, then the`  
`-            character(s) that are inside of the çª¶åltGlyphçª¶?element are rendered as`  
`-            if the çª¶åltGlyphçª¶?element were a çª¶?spançª¶?element instead."`  
`+            character(s) that are inside of the âaltGlyphâ?element are rendered as`  
`+            if the âaltGlyphâ?element were a â?spanâ?element instead."`  
  
`             If the alt glyph is not then found we are in the case from the spec`  
`             and indeed we should use the primary font. However, we end up replacing the GlyphPage`  
`diff --git a/NewNintendo3DS_OpenSources9.9.0-/webkit/WebCore/html/RangeInputType.cpp b/NewNintendo3DS_OpenSources10.2.0-/webkit/WebCore/html/RangeInputType.cpp`  
`index 484adec..d7e9e8d 100644`  
`--- a/NewNintendo3DS_OpenSources9.9.0-/webkit/WebCore/html/RangeInputType.cpp`  
`+++ b/NewNintendo3DS_OpenSources10.2.0-/webkit/WebCore/html/RangeInputType.cpp`  
`@@ -164,7 +164,7 @@ void RangeInputType::handleMouseDownEvent(MouseEvent* event)`  
`     ASSERT(element()->hasShadowRoot());`  
`     if (targetNode != element() && !targetNode->isDescendantOf(element()->shadowTree()->oldestShadowRoot()))`  
`         return;`  
`-    SliderThumbElement* thumb = sliderThumbElementOf(element());`  
`+    RefPtr`<SliderThumbElement>` thumb = sliderThumbElementOf(element());`  
`     if (targetNode == thumb)`  
`         return;`  
```
     thumb->dragFrom(event->absoluteLocation());
```

#### v10.4

The ExeFS codebin was updated, the only change was that the following code was updated in the actual NupCheck HTTPS request function:

- Previous version: sprintf(out, "[https://cbvc.cdn.nintendo.net/SNAKE/2/%s](https://cbvc.cdn.nintendo.net/SNAKE/2/%s)", region);
- Current version: sprintf(out, "[https://cbvc.cdn.nintendo.net/SNAKE/%d/%s](https://cbvc.cdn.nintendo.net/SNAKE/%d/%s)", 3, region);

libpng was updated from version 1.5.21 to 1.5.24.

The following RomFS files were updated(see the forced-sysupdate section regarding what changed in the message files):

`/browser/rootca.pem`  
`/build/buildinfo.dat`  
`/cairo.cro.lex`  
`/.crr/static.crr`  
`/message/CN_Simp_Chinese/skater.msbt`  
`/message/EU_Dutch/skater.msbt`  
`/message/EU_English/skater.msbt`  
`/message/EU_French/skater.msbt`  
`/message/EU_German/skater.msbt`  
`/message/EU_Italian/skater.msbt`  
`/message/EU_Portuguese/skater.msbt`  
`/message/EU_Russian/skater.msbt`  
`/message/EU_Spanish/skater.msbt`  
`/message/JP_Japanese/skater.msbt`  
`/message/KR_Hangeul/skater.msbt`  
`/message/TW_English/skater.msbt`  
`/message/TW_Trad_Chinese/skater.msbt`  
`/message/US_English/skater.msbt`  
`/message/US_French/skater.msbt`  
`/message/US_Portuguese/skater.msbt`  
`/message/US_Spanish/skater.msbt`  
`/oss.cro.lex differ`  
`/peer.cro.lex differ`  
`/static.crs differ`  
```
/webkit.cro.lex differ
```

#### v10.6

The ExeFS codebin was updated.

[browserhax_fright_tx3g](browserhax "wikilink") was fixed. The code handling tx3g now matches the latest libstagefright git.

Hence the below RomFS listing, no OSS was updated at all(besides libstagefright mentioned above).

The following RomFS files were updated:

`/build/buildinfo.dat`  
```
/static.crs
```

#### v10.7

Basically the same changes as Old3DS v10.7, except with the usual buildinfo.dat update in RomFS. The below date is 6 days after the browser-version-check [bypass](3DS_Userland_Flaws "wikilink") was publicly disclosed.

`cat v7184/00000025_romfs/build/buildinfo.dat`  
`10150`  
`applet`  
```
2016-03-02 18:25
```

#### v11.1

The ExeFS codebin was updated. The following files in RomFS were updated:

` /build/buildinfo.dat`  
` /.crr/static.crr`  
` /oss.cro.lex`  
` /static.crs`  
```
 /webkit.cro.lex
```

` cat v8192/00000026_romfs/build/buildinfo.dat`  
` 10156`  
` applet`  
```
 2016-08-26 19:47
```

Minus the 4 functions that changed due to compiler optimization, only 1 function was actually updated. This is LT_1a4004, previous version at LT_1a4004: libstagefright status_t MPEG4Extractor::parseChunk(off64_t \*offset, int depth)

Additional code was added which doesn't seem to be from upstream git, right [before](https://android.googlesource.com/platform/frameworks/av/+/32d6e5f0ebe9e00f80401e5f4fd6e285a474590d/media/libstagefright/MPEG4Extractor.cpp#880) the cprt code block: "if((\*offset + chunk_size) - data_offset \< 0)fail"

This fixed skater31hax + any other mp4 haxx which requires using a negative 64bit chunk_size value.

The filepath base used in the assert strings were changed from "d:\Jenkins\workspace\MPSkaterBuild\MVPlayer\Skater\Base\Android\frameworks\base\media\libstagefright\\ to "d:\jenkins\workspace\MPSkaterBuild-Git\Base\Android\frameworks\base\media\libstagefright\\.

#### v11.4

The only changes in RomFS was for "/build/buildinfo.dat" and "/static.crs", hence no OSS in CRO(s) were updated.

The main codebin was updated. Exactly two functions were updated, these are not related to code exec vulns.

` cat v9232/00000027_romfs/build/buildinfo.dat`  
` 10160`  
` applet`  
```
 2017-03-08 19:44
```

### New3DS Browser Specifications

[5](http://www.nintendo.co.jp/3ds/new/features/modal_net.html)

English version:

- "Browser engine: NetFront® Browser NX v3.0"
- "User agent: Mozilla/5.0 (New Nintendo 3DS like iPhone) AppleWebKit/536.30 (KHTML and like Gecko) NX/3.0.\*.\*.\* Mobile NintendoBrowser/1.0.\*\*\*\* JP
- \*\* Version information is stated.
- \*\*\* When using the “Mobile version request” function, it differs from the above-mentioned character string"
- "Supported protocols: HTTP1.0/HTTP1.1/SSL3.0/TLS1.0/TLS1.1/TLS1.2"
- "Web standard: HTML4.01 / HTML5 / XHTML1.1 / Fullscreen API / Gamepad API / SVG / WebSocket / Video Subtitle / WOFF / Web Messaging / Server-Sent / Web Storage (partial) / XMLHttpRequest / Canvas element / Video / DOM Levels 1-3 / ECMAScript / CSS1 / CSS2.1 / CSS3 (partial)"
- "Image format: bmp / ​​gif / ico / jpeg / png / svg (There are, however, possibilities that some images won't display.)"
- "Image preview: mpo / jpeg (There are, however, possibilities that some images won't display.)"
- "Video format: MP4, M3U8 + TS (HTTPLiveStreaming) (There are, however, some videos that may not be played.)"
- "Video codec: H.264 - MPEG-4 AVC Video (max 854x480 at level 3.2, 3D compatible) (There are, however, some videos that can not be played.)"
- "Audio codec: AAC - ISO / IEC 14496-3 MPEG-4AAC, MP3 (There are, however, some videos that can not be played.)"
- "Format for uploading 3D videos: .mkv (In order to be played, videos must be converted to the appropriate format within the site you are uploading to. In some cases, the video will not play even if converted.)"
- "Plug-ins: Plug-ins such as Adobe Flash are not supported"
- "Active Rating System filtering: provided by Digital Arts, Inc.. Access to web content can be limited based on its category information, restricting access to web content that may result inappropriate."
- "Websites can be requested to provide the mobile version (However, if the web page does not have a mobile version, it won't change the way it's displayed.)"

MJPEG + .avi is also supported.

#### Gamepad

The browser's now-outdated gamepad API provides information about the states of the circle pad, C-stick, and every button aside from the Home and Power buttons. The gamepad, which has an ID of `New Nintendo 3DS Controller`, is contained within the array returned by the `navigator.webkitGetGamepads` function.

Both of the gamepad's arrays, which contain the states of various inputs, seem to be reconstructed each time they are accessed via their gamepad object. It is not known if the values within the arrays can update upon each access of the array, but the values <em>can</em> update frequently enough to obtain accurate readings of the system's controls.

##### Axes

The gamepad's `axes` array contains four floating-point numbers in the following order:

| Index | Axis         |
|-------|--------------|
| 0     | Circle pad X |
| 1     | Circle pad Y |
| 2     | C-stick X    |
| 3     | C-stick Y    |

Each coordinate ranges from -1.0 (left/up) to 1.0 (right/down). Neutral position is indicated by 0.0. Drift and/or inaccurate calibration may make these exact values unattainable.

##### Buttons

The gamepad's `buttons` array contains numbers for the following numbers:

| Index | Button |
|-------|--------|
| 0     | B      |
| 1     | A      |
| 2     | Y      |
| 3     | X      |
| 4     | L      |
| 5     | R      |
| 6     | ZL     |
| 7     | ZR     |
| 8     | Select |
| 9     | Start  |
| 10    | Unused |
| 11    | Unused |
| 12    | Up     |
| 13    | Down   |
| 14    | Left   |
| 15    | Right  |

Each button's value is 0 while the button is not pressed, and 1 while the button is pressed.

Based on the Gamepad API's specifications, buttons 10 and 11 are reserved for left stick presses and right stick presses respectively, which the 3DS does not support.

#### Notes

- Viewport information can be specified with the
  <meta>

  element.
- The html "color" <input> type is not supported.
- 3D images appear as their right-eye image within webpages.
- Webpages are locked to the bottom screen when zooming is disabled, the webpage's initial scale is 1, and the entire webpage can fit within the bottom screen's dimensions (320x212).
- Interactable elements that are positioned partially outside of the bottom screen can temporarily be moved further inside the bottom screen by tapping them with the touchscreen.
- Favicons can be changed using Javascript, but they become unchangeable once the document's <em>readystatechange</em> event finishes firing with a ready state of "complete".
- Focusing on text-editable elements via Javascript will always open the keyboard.
- Webpage content is usually rendered at 30 FPS despite the `webkitRequestAnimationFrame` function allowing code to run at a rate of 60 FPS.
  - As a result, display-related routines may only show half of their intended updates.
  - This issue can be mitigated by rendering on every other frame. However, various factors (such as touchscreen input and sleep mode) make this fairly inconsistent.

## Old3DS browser

### Old3DS Browser Specifications

- "Browser engine: NetFront® Browser"
- "User agent: Mozilla/5.0 (Nintendo 3DS; region; ; en) Version/1.7498.US"
- "Supported protocols: HTTP1.0/HTTP1.1/SSLv3/TLS1.0"
- "Web standard: HTML 4.01/XHTML 1.1/CSS 1/CSS 2.1/CSS 3 (partial functionality)/DOM Levels 1-3/ECMAScript/XMLHttpRequest/Canvas Element (partial functionality)"
- "Image format: MPO / GIF / JPEG / PNG / BMP / ICO (some images cannot be displayed)"
- "Plug-ins: Plug-ins such as Adobe Flash are not supported"

Old3DS browser doesn't support events "focusin" and "focusout"

### User-Agent and Browser Versions

User-agent format: `Mozilla/5.0 (Nintendo 3DS; U; ; `<lang>`) Version/`<version>`.`<region>.

<lang> is "en", "fr", etc. <region> is "US", "EU", etc. See below for <version>.

<table>
<thead>
<tr>
<th>Browser version</th>
<th>CDN Title-version</th>
<th>Network-only system-update version</th>
<th>Notes</th>
</tr>
</thead>
<tbody>
<tr>
<td>1.7412</td>
<td>v6</td>
<td><a {{% href "../2.0.0-2" "broken" %}} title="wikilink">2.0.0-2</a></td>
<td>This was the initial version.</td>
</tr>
<tr>
<td>1.7455</td>
<td>v1024</td>
<td><a {{% href "../2.1.0-4" "broken" %}} title="wikilink">2.1.0-4</a></td>
<td>ExeFS .code was updated, both of the CROs(webkit/OSS) were updated too.</td>
</tr>
<tr>
<td>1.7498</td>
<td>v2050</td>
<td><a {{% href "../4.0.0-7" %}} title="wikilink">4.0.0-7</a></td>
<td>ExeFS .code was updated, both of the CROs(webkit/OSS) were updated too. The manual CFA was updated as well.</td>
</tr>
<tr>
<td>1.7538</td>
<td>v0</td>
<td><a {{% href "../4.2.0-9" "broken" %}} title="wikilink">4.2.0-9</a></td>
<td>First version of the KOR browser. The CROs are different from the USA/EUR/JPN <a {{% href "../4.0.0-7" %}} title="wikilink">4.0.0-7</a> browser.</td>
</tr>
<tr>
<td>1.7552</td>
<td>v3075</td>
<td><a {{% href "../5.0.0-11" %}} title="wikilink">5.0.0-11</a></td>
<td>ExeFS .code and icon were updated, both of the CROs(webkit/OSS) were updated too. The manual CFA was updated as well.</td>
</tr>
<tr>
<td>1.7552</td>
<td>v3088</td>
<td><a {{% href "../7.0.0-13" %}} title="wikilink">7.0.0-13</a></td>
<td>The main NCCH wasn't updated at all(same TMD contentID/content-hash as the previous version), only the manual CFA for this title was updated.</td>
</tr>
<tr>
<td>1.7567</td>
<td>v4096</td>
<td><a {{% href "../7.1.0-16" %}} title="wikilink">7.1.0-16</a></td>
<td>The CXI .code was updated, some data in the RomFS was updated(none of the CROs such as webkit.cro were updated). The manual CFA was updated too.</td>
</tr>
<tr>
<td>1.7585</td>
<td>v5121</td>
<td><a {{% href "../9.5.0-23" %}} title="wikilink">9.5.0-23</a></td>
<td>The CXI .code was updated, and the manual CFA was updated. RomFS changes:</p>
<ul>
<li>"/browser/rootca.pem" updated</li>
<li>"/cro/oss.cro" updated</li>
<li>"/cro/static.crs" updated</li>
<li>"/cro/webkit.cro" updated</li>
<li>"/.crr/static.crr" updated</li>
<li>"/layout/dialogheader/WirelessSwitchOff.arc" was removed</li>
<li>"/layout/favorite/favicondata/KOR.arc" updated</li>
</ul>
<p>A vuln used in a public(at the time of this sysupdate) webkit exploit for spider was fixed, which also fixed the removewinframe exploit from <a href="https://github.com/yellows8/3ds_webkithax">here</a>.</td>
</tr>
<tr>
<td>None</td>
<td>v6147</td>
<td>v9.9 CUP</td>
<td>v9.9 CUP dummy web-browser, see below.</td>
</tr>
<tr>
<td>1.7610</td>
<td>v6149</td>
<td><a {{% href "../9.9.0-26" %}} title="wikilink">9.9.0-26</a></td>
<td>See below.</td>
</tr>
<tr>
<td>1.7616</td>
<td>v7168</td>
<td><a {{% href "../10.2.0-28" %}} title="wikilink">10.2.0-28</a></td>
<td>See below.</td>
</tr>
<tr>
<td>1.7622</td>
<td>v8192</td>
<td><a {{% href "../10.6.0-31" %}} title="wikilink">10.6.0-31</a></td>
<td>See below.</td>
</tr>
<tr>
<td>None</td>
<td>v9216</td>
<td>v10.7 CUP</td>
<td>v10.7 CUP dummy web-browser, see below.</td>
</tr>
<tr>
<td>1.7625</td>
<td>v9232</td>
<td><a {{% href "../10.7.0-32" %}} title="wikilink">10.7.0-32</a></td>
<td>See below.</td>
</tr>
<tr>
<td>1.7630</td>
<td>v10240</td>
<td><a {{% href "../11.1.0-34" %}} title="wikilink">11.1.0-34</a></td>
<td>See below.</td>
</tr>
<tr>
<td>1.7636</td>
<td>v11297</td>
<td><a {{% href "../11.9.0-42" %}} title="wikilink">11.9.0-42</a></td>
<td>See below.</td>
</tr>
<tr>
<td>1.7639</td>
<td>v12288</td>
<td><a {{% href "../11.14.0-46" %}} title="wikilink">11.14.0-46</a></td>
<td>See below.</td>
</tr>
<tr>
<td>1.7642</td>
<td>v13313</td>
<td><a {{% href "../11.15.0-47" %}} title="wikilink">11.15.0-47</a></td>
<td>See below.</td>
</tr>
</tbody>
</table>

### Heap

The USA/EUR/JPN + KOR browser allocates the 0x08000000 heap with size 0x01A97000. The size used by the CHN and TWN browser is 0x01997000, exactly 0x100000-bytes smaller.

### Old3DS v9.9

ExeFS:/.code was updated.

The only changes in RomFS were file-updating, the following files were updated:

`/browser/rootca.pem`  
`/cro/oss.cro`  
`/cro/static.crs`  
`/cro/webkit.cro`  
`/.crr/static.crr`  
`/message/CN_Simp_Chinese/spider.msbt`  
`/message/EU_Dutch/spider.msbt`  
`/message/EU_English/spider.msbt`  
`/message/EU_French/spider.msbt`  
`/message/EU_German/spider.msbt`  
`/message/EU_Italian/spider.msbt`  
`/message/EU_Portuguese/spider.msbt`  
`/message/EU_Russian/spider.msbt`  
`/message/EU_Spanish/spider.msbt`  
`/message/JP_Japanese/spider.msbt`  
`/message/KR_Hangeul/spider.msbt`  
`/message/TW_English/spider.msbt`  
`/message/TW_Trad_Chinese/spider.msbt`  
`/message/US_English/spider.msbt`  
`/message/US_French/spider.msbt`  
`/message/US_Portuguese/spider.msbt`  
```
/message/US_Spanish/spider.msbt
```

OSS diff for v9.5 and v9.9, without the .dox changes:

`diff --git a/3DS_InternetBrowser_OpenSources_JP_US_EU_KR_TW_HK_CN_9.5.0(23J_23U_23E_19K_18T_3C)/WKC/WebKit/WKC/webkit/WKCVersion.h b/3DS_InternetBrowser_OpenSources_JP_US_EU_KR_TW_HK_CN_9.9.0/WKC/WebKit/WKC/webkit/WKCVersion.h`  
`index be5ff09..55a7274 100644`  
`--- a/3DS_InternetBrowser_OpenSources_JP_US_EU_KR_TW_HK_CN_9.5.0(23J_23U_23E_19K_18T_3C)/WKC/WebKit/WKC/webkit/WKCVersion.h`  
`+++ b/3DS_InternetBrowser_OpenSources_JP_US_EU_KR_TW_HK_CN_9.9.0/WKC/WebKit/WKC/webkit/WKCVersion.h`  
`@@ -29,7 +29,7 @@`  
` #define WKC_VERSION_CHECK(major, minor, micro) \`  
`     (((major)*10000) + ((minor)*100) + (micro)) >= ((WKC_VERSION_MAJOR*10000) + (WKC_VERSION_MINOR*100) + (WKC_VERSION_MICRO))`  
` `  
`-#define WKC_CUSTOMER_RELEASE_VERSION "1.8.14"`  
`+#define WKC_CUSTOMER_RELEASE_VERSION "1.8.16"`  
` `  
` #define WKC_WEBKIT_VERSION "532.7"`  
` `  
`diff --git a/3DS_InternetBrowser_OpenSources_JP_US_EU_KR_TW_HK_CN_9.5.0(23J_23U_23E_19K_18T_3C)/webkit/WebCore/rendering/RenderBox.cpp b/3DS_InternetBrowser_OpenSources_JP_US_EU_KR_TW_HK_CN_9.9.0/webkit/WebCore/rendering/RenderBox.cpp`  
`index da4127e..d03403e 100644`  
`--- a/3DS_InternetBrowser_OpenSources_JP_US_EU_KR_TW_HK_CN_9.5.0(23J_23U_23E_19K_18T_3C)/webkit/WebCore/rendering/RenderBox.cpp`  
`+++ b/3DS_InternetBrowser_OpenSources_JP_US_EU_KR_TW_HK_CN_9.9.0/webkit/WebCore/rendering/RenderBox.cpp`  
`@@ -305,23 +305,23 @@ int RenderBox::scrollHeight() const`  
` `  
` int RenderBox::scrollLeft() const`  
` {`  
`-    return hasOverflowClip() ? layer()->scrollXOffset() : 0;`  
`+    return layer() && hasOverflowClip() ? layer()->scrollXOffset() : 0;`  
` }`  
` `  
` int RenderBox::scrollTop() const`  
` {`  
`-    return hasOverflowClip() ? layer()->scrollYOffset() : 0;`  
`+    return layer() && hasOverflowClip() ? layer()->scrollYOffset() : 0;`  
` }`  
  
` void RenderBox::setScrollLeft(int newLeft)`  
` {`  
`-    if (hasOverflowClip())`  
`+    if (hasOverflowClip() && layer())`  
`         layer()->scrollToXOffset(newLeft);`  
` }`  
` `  
` void RenderBox::setScrollTop(int newTop)`  
` {`  
`-    if (hasOverflowClip())`  
`+    if (hasOverflowClip() && layer())`  
`         layer()->scrollToYOffset(newTop);`  
```
 }
```

### Old3DS v10.2

The slider vuln from [here](https://github.com/yellows8/3ds_webkithax) was fixed in the Old3DS browser.

The main codebin .text only increased by 0x10-bytes.

The only changes in RomFS was that the following files were updated:

`/cro/oss.cro`  
`/cro/static.crs`  
`/cro/webkit.cro`  
```
/.crr/static.crr
```

OSS diff:

`diff --git a/3DS_InternetBrowser_OpenSources_JP_US_EU_KR_TW_HK_CN_9.9.0/WKC/WebKit/WKC/webkit/WKCVersion.h b/3DS_InternetBrowser_OpenSources_JP_US_EU_KR_TW_HK_CN_10.2.0/WKC/WebKit/WKC/webkit/WKCVersion.h`  
`index 55a7274..fc153c4 100644`  
`--- a/3DS_InternetBrowser_OpenSources_JP_US_EU_KR_TW_HK_CN_9.9.0/WKC/WebKit/WKC/webkit/WKCVersion.h`  
`+++ b/3DS_InternetBrowser_OpenSources_JP_US_EU_KR_TW_HK_CN_10.2.0/WKC/WebKit/WKC/webkit/WKCVersion.h`  
`@@ -29,7 +29,7 @@`  
` #define WKC_VERSION_CHECK(major, minor, micro) \`  
`     (((major)*10000) + ((minor)*100) + (micro)) >= ((WKC_VERSION_MAJOR*10000) + (WKC_VERSION_MINOR*100) + (WKC_VERSION_MICRO))`  
` `  
`-#define WKC_CUSTOMER_RELEASE_VERSION "1.8.16"`  
`+#define WKC_CUSTOMER_RELEASE_VERSION "1.8.17"`  
` `  
` #define WKC_WEBKIT_VERSION "532.7"`  
` `  
`diff --git a/3DS_InternetBrowser_OpenSources_JP_US_EU_KR_TW_HK_CN_9.9.0/webkit/WebCore/rendering/RenderSlider.cpp b/3DS_InternetBrowser_OpenSources_JP_US_EU_KR_TW_HK_CN_10.2.0/webkit/WebCore/rendering/RenderSlider.cpp`  
`index b2f5cef..1dd3dbd 100644`  
`--- a/3DS_InternetBrowser_OpenSources_JP_US_EU_KR_TW_HK_CN_9.9.0/webkit/WebCore/rendering/RenderSlider.cpp`  
`+++ b/3DS_InternetBrowser_OpenSources_JP_US_EU_KR_TW_HK_CN_10.2.0/webkit/WebCore/rendering/RenderSlider.cpp`  
`@@ -221,6 +221,7 @@ RenderSlider::~RenderSlider()`  
` {`  
`     if (m_thumb)`  
`         m_thumb->detach();`  
`+    m_thumb = 0;`  
` }`  
` `  
` int RenderSlider::baselinePosition(bool, bool) const`  
`@@ -493,7 +494,8 @@ void RenderSlider::forwardEvent(Event* event)`  
`         }`  
`     }`  
` `  
`-    m_thumb->defaultEventHandler(event);`  
`+    if (m_thumb)`  
`+        m_thumb->defaultEventHandler(event);`  
` }`  
` `  
```
 bool RenderSlider::inDragMode() const
```

### Old3DS v10.6

[spider28hax](browserhax "wikilink") was fixed. The "2^32 characters long string" vuln described [here](3DS_Userland_Flaws "wikilink") was *finally* fixed.

*A lot* of WebKit issues/vulns were fixed, see [here](https://gist.github.com/yellows8/b1e10caa1d8bb8a46316) for the changes.

libpng was updated from version 1.4.12 to 1.4.19. zlib was updated from 1.2.7 to 1.2.8.

The .text size increased by 0x478-bytes.

The only changes in RomFS was that the following files were updated:

`/cro/oss.cro`  
`/cro/static.crs`  
`/cro/webkit.cro`  
`/.crr/static.crr`  
```
/manual/Manual.bcma
```

### Old3DS v10.7

*Nothing* changed except some words for version-values in .text being updated(RomFS wasn't changed), code for browser-version-check was [updated](#v107_2 "wikilink").

### Old3DS v11.1

Nothing changed in the ExeFS codebin besides the usual version values. The following files in RomFS were updated:

` /cro/oss.cro`  
` /cro/webkit.cro`  
```
 /.crr/static.crr
```

## Forced system-update

The Old3DS/New3DS Internet Browser updated with [9.9.0-26](9.9.0-26 "wikilink") added the following message strings:

`In order to use the Internet `  
`browser, a system update `  
`is required.`  
`To perform a system update, `  
`select System Update from Other`  
```
Settings in System Settings.
```

`The Internet browser cannot be`  
`used at this time.`  
`Please check your network`  
```
environment or try again later.
```

For whatever reason, the above *message strings* were removed with New3DS-browser v10.2, then re-added with v10.4. This does not apply to the Old3DS browser. Whenever v10.2 New3DS browser tries to use these message-strings for displaying a browser-update-related message, it will crash due to an assert failing since the message-strings are missing. Hence, if/when the v10.2 update-check page is ever updated where the browser tries to display a message for it, or when accessing that page fails, the browser will automatically crash.

This wasn't enforced(web-browser displaying the above message when the installed browser isn't the latest version) until October 26, 2015.

This message only triggers when attempting to load a web-page. This is only handled the first time the browser accesses a web-page, during this browser session.

The browser codebins starting with v9.9 now contain the following URL strings:

- Old3DS: "https://cbvc.cdn.nintendo.net/CTR/1/\<region\>"
- New3DS: "https://cbvc.cdn.nintendo.net/SNAKE/1/\<region\>"

The <region> string is one of the following:

- "JPN"
- "USA"
- "EUR"
- "KOR"

Starting with the browser from [10.2.0-28](10.2.0-28 "wikilink"), the "1" in the above URLs were changed to "2". With the New3DS browser from [10.4.0-29](10.4.0-29 "wikilink"), it's now "3".

As of October 26, 2015, the "1" URLs return the browser-version for v9.9(decimal number as a string without any "."), while the "2" URLs returns 0.

`if(internal_browserver > server_browserver)`  
`{`  
`    `<safe>  
`}`  
`else`  
`{`  
`    `<update message>  
```
}
```

Hence, internal_browserver == server_browserver will trigger the sysupdate message, which appears to be the normal way to indicate that the current browser is outdated(see above).

There is a cache for this in savedata. The request is only done when at least 24-hours have passed since the last time the request was done(see the below savedata section).

It is still possible to guard against this update by blocking the previous URLs using a proxy.
It is not possible to remove the update message by entering the [Recovery Mode](Recovery_Mode "wikilink").

### Page request

For this request, all root-CAs bundled with the browser are trusted, in addition to two of the SSL module builtin Nintendo root-CAs.

The browser(with New3DS at least) does the following with [HTTPC](HTTP_Services "wikilink") for requesting the above page:

- Initializes the HTTP context and uses [HTTPC:InitializeConnectionSession](HTTPC:InitializeConnectionSession "wikilink") + [HTTPC:SetProxyDefault](HTTPC:SetProxyDefault "wikilink").
- Uses [HTTPC](HTTP_Services "wikilink") command 0x250080 twice with cmd\[1\]=contexthandle: first time cmd\[2\]=0x3, second time cmd\[2\]=0x6.
- Then [HTTPC:AddTrustedRootCA](HTTPC:AddTrustedRootCA "wikilink") is used 48 times to setup 48 trusted root CAs. This appears to be every cert in the browser "romfs:/browser/rootca.pem" file converted to DER, in the same order from there(in other words, every single root CA the browser trusts by default for normal web-browsing).
- Then [HTTPC:BeginRequest](HTTPC:BeginRequest "wikilink") is used.
- Then [HTTPC:ReceiveDataTimeout](HTTPC:ReceiveDataTimeout "wikilink") is used, the recv-size seems to be fixed to 0x20.
- Then [HTTPC:GetResponseStatusCodeTimeout](HTTPC:GetResponseStatusCodeTimeout "wikilink") is used.
- Then [HTTPC:GetDownloadSizeState](HTTPC:GetDownloadSizeState "wikilink") is used.
- Then the HTTP context is closed.

Raw request data(New3DS USA v10.2 browser):

`000000: 47 45 54 20 2f 53 4e 41 4b 45 2f 32 2f 55 53 41  GET /SNAKE/2/USA`  
`000010: 20 48 54 54 50 2f 31 2e 31 0d 0a 48 6f 73 74 3a   HTTP/1.1..Host:`  
`000020: 20 63 62 76 63 2e 63 64 6e 2e 6e 69 6e 74 65 6e   cbvc.cdn.ninten`  
```
000030: 64 6f 2e 6e 65 74 0d 0a 0d 0a                    do.net....
```

### v10.7

The only actual code change with Old3DS/New3DS browser v10.7 was that the code which calculates the diff_timestamp was moved to immediately after the block which initializes <state_timestamp> when <state_timestamp> is all-zero. This fixed the browser-version-check [bypass](3DS_Userland_Flaws "wikilink").

## Dummy web-browser

Gamecards v9.9 and above include, with their sysupdate, a dummy Old3DS/New3DS web-browser. The \*only\* thing this title does is display the same message listed in the above forced-update section. The message files in RomFS \*only\* contain that message string above. There are no "http" strings in the main codebin, and [RO](RO_Services "wikilink") isn't used either(no CRO data in RomFS at all). Both browsers are internally called "dummySpider".

Hence, if you update your system below v9.8 with any v9.9 or above gamecard, the system web-browser will be rendered \*completely\* useless until you install a system-update from CDN(no network requests involved here).

Gamecards v10.7 and v11.4(New3DS only) have updated the dummy web-browser, where the only difference is the title version.

## Savedata

### New3DS

On newer SKATER versions, it appears \*all\* NAND savedata is stored under the [0x000200BB](System_SaveData "wikilink") savedata.

#### 0x000200BB savedata

This only contains "t.bin" with filesize 0xadf80, the format is below.

The timestamp format used here is the number of milliseconds since January 1, 2000(local-time).

When using the "Initialize savedata" option in the browser, that deletes this savedata file/image then exits the browser. This file is then re-created when the browser gets started again.

| Offset | Size | Description |
|----|----|----|
| 0x68 | 0x4? | This counter is incremented each time the savedata is written. |
| 0x70 | 0x8 | Timestamp for when the savedata was last written. |
| 0x94 | 0x15? | This is all-zeros on non-JPN systems. On JPN systems where the browser filter is disabled, this is a string in the following format: "4110-%016llX". |
| 0xD8 | 0x8 | s64 timestamp, can be either a normal positive timestamp or a relative negative one. Used with the forced-update described above. When an update is detected this timestamp is negative, otherwise this is a normal positive timestamp(it's unknown how exactly this timestamp is checked). When positive, this seems to be the last time the forced-update HTTPS request was done where no update was needed. |

## APT Parameters

The URL to load can optionally be loaded from char\[\] string [paramblk+0](APT:SendParameter "wikilink"). This is used when scanning URL QR-codes in Home Menu / etc.

## Errors

"Failed to load part of this page": This can be caused by failing to load "/favicon.ico". For example, this can be caused by loading a plain HTTP page, with plain-http favicon redirecting to HTTPS. If cert-verify then fails with favicon in this case, this error would then trigger.

## Other details

- It scored 90/100 on [Acid3](http://acid3.acidtests.org/) test
- Images from the Internet can be saved to the [SD Card](SD_Filesystem "wikilink") and viewed using the [Nintendo 3DS Camera](Nintendo_3DS_Camera "wikilink") application.
- Images saved to an [SD Card](SD_Filesystem "wikilink") or to the Nintendo 3DS system memory can be uploaded to blogs or other sites that allow the uploading of photos using :

<input type="file" />

- HTML5Test.com say that Drag and drop is supported but it's not (code on WebKit is ready, but it's not implemented on interface of browser)
- Webpages are rendered with the RGB565 color format.

## Tips

### Detect User Agent

To detect if the user agent is the Nintendo 3DS Internet Browser (not including mobile site mode):

<script type="text/javascript">

`    if(navigator.userAgent.indexOf("Nintendo 3DS") == -1) { // If the user agent does not contain "Nintendo 3DS"`  
`        location.replace("`[`http://www.3dbrew.org`](http://www.3dbrew.org)`"); // Redirect to another page`  
`    }`  

</script>

- You can check using `navigator.platform.indexOf("Nintendo 3DS") > -1` as well.
- The New 3DS Internet Browser's "Request Mobile Sites" setting affects the user agent. To detect if the New 3DS Internet Browser is being used with this option enabled, use `screen.pixelDepth == 16 && navigator.platform == "iPhone"`.
  - This relies on the fact that the internet browser renders its webpages in 16-bit color, which is (hopefully?) not possible with a real iPhone.
  - Keep in mind that the previous browser-detection examples do not account for this setting.

### Scrolling

Scrolling can be altered by modifying <em>document.body.scrollTop</em> and <em>document.body.scrollLeft</em>. However, there are drawbacks related to working with these properties:

- Both properties return 0 when accessed
- Setting one property resets the other property's scroll position

In order to set both at the same time (without either resetting to 0), use <em>window.scrollTo</em>.

### Events

#### Key Events

The following buttons trigger the <em>onkeydown</em>, <em>onkeypress</em> and <em>onkeyup</em> events:

| Code | Button |
|------|--------|
| 13   | A      |
| 37   | Left   |
| 38   | Up     |
| 39   | Right  |
| 40   | Down   |

The events cannot have their default action cancelled. Other buttons do not trigger key events.

The Old3DS browser dispatches a <em>keypress</em> event once per key press for each of the buttons above, but the New3DS browser dispatches the event continuously until the button is released.

A keyboard event's `keyIdentifier` property usually should not be used to identify which button was pressed, as the A button's <em>keypress</em> event is dispatched with a key identifier of "" (an empty string) rather than "Enter" in the New3DS browser.

The New3DS browser's keyboard dispatches <em>keydown</em> and <em>keyup</em> events when a key is pressed, but it is not possible to determine which key was pressed based on the event itself. Every keyboard <em>keydown</em> event has a key code of 229 and a key identifier of "U+00E5", and every <em>keyup</em> event has a key code of 0 and a key identifier of "U+0000".

Key events are suppressed while the touchscreen is touched.

#### Touch/Mouse Events

The <em>mousedown</em>, <em>mouseup</em>, and <em>click</em> events are all triggered by the browser. However, the <em>mousedown</em> event doesn't trigger until you lift the stylus or you've held it on the screen long enough to trigger text selection mode. Text selection mode requires pressing the touchscreen for approximately 1.05 seconds in the Old3DS browser, or pressing the touchscreen for approximately 0.41 seconds in the New3DS browser. Also, the <em>mousedown</em> event is only dispatched while text selection mode is active. Mouse events cannot have their default actions cancelled.

Touch events are not supported in the Old3DS browser, and the <em>touchcancel</em> event does not seem to be used by either browser. Touches cannot start within the bottom browser bar, but they can move to be within it. The rotation angle, contact radii, and pressure of each touch are always zero, as the 3DS touchscreen is not capable of detecting these values. Only one touch can be detected at a time due to the touchscreen's hardware limitations as well. Unlike mouse events, touch events can have their default actions cancelled. Doing so will prevent the touchscreen from being used to scroll through the webpage, highlight text, zoom out, and interact with the bottom browser bar.

#### System Font Characters

The [system font](System_Font#unicode_private_use_characters "wikilink")'s private-use characters can be viewed within the web browser.

## Screen Resolution

The up screen resolution is 400×240. However, the viewable area in the browser is only <b>400×215</b>.

The touch screen resolution is 320×240. However, the viewable area in the browser is <b>320×212</b> <em>or</em> <b>320×240</b>, depending on if the bottom browser bar is visible. The New3DS browser's bottom bar can hidden by scrolling and/or attempting to zoom in/out with the C-stick, unless scrolling and zooming have both been disabled.

You can have a page span both screens. However, the browser will behave as if the bottom screen is the only active screen and the top screen is scrolled off. This is important when computing CSS coordinates. Items positioned from the "bottom" will be positioned based on the height of the bottom screen, not the cumulative height of both screens.

## Using Both Screens

Generally the easiest way to accomplish the correct layout is to create HTML elements that "contain" the top and bottom screens. Here's an example:

`<!DOCTYPE html>`  

<html>

<head>

<meta name="viewport" content="width=400, initial-scale=1">

<style>

`      body { margin: 0px; }`  
`      #topscreen { width: 400px; height: 215px; overflow: hidden; background-color: red; }`  
`      #bottomscreen { width: 320px; height: 212px; overflow: hidden; background-color: blue; margin: 0 40px 28px; }`  
```
    
```

</style>

</head>

<body>

`    <div id="topscreen">Top Screen</div>`  
`    <div id="bottomscreen">Bottom Screen</div>`  
```
  
```

</body>

</html>

This scheme allows the page to be easily manipulated through JavaScript. In order to have the window snap to the correct position, use the following JavaScript code:

`window.setInterval(function() {`  
`    window.scrollTo(40, 215);`  
```
}, 0);
```

This automatically resets the position if the user accidentally scrolls the page. Zooming should probably also be disabled by adding `user-scalable=no` to the

<meta>

viewport element, though this will only have an effect in the New3DS browser.

## Example Sites

- [Nintendo 3DS Bookmarks](http://www.nintendo.com/3ds/internetbrowser/bookmarks): This is the first bookmark pre-installed in the browser.
- [ImageShare](http://theimageshare.com): Image uploader for the 3DS ([source code](https://github.com/corbindavenport/imageshare))
- [jFox](http://3ds.andysmith.co.uk/jFox.html) (Short URL: <http://bit.ly/iB7FqW>)
- [Ditto3D (Dead Link)](http://ditto3d.com/3ds) (Short URL: <http://bit.ly/oVreWA>)
