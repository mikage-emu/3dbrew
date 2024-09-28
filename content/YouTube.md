+++
title = 'YouTube'
+++

The YouTube application available from the eShop is a web-browser. Like
the [main](Internet_Browser "wikilink") browser this uses WebKit. All
data is downloaded with plaintext HTTP (3DS application).

The OSS for the 3DS / Wii U YouTube application is available at the
following:

- [1](https://github.com/youtube/h5vcc_hh)
- [2](https://github.com/youtube/h5vcc)

## User-Agent and Browser Versions

The user-agent format is almost identical to the main browser:
"Mozilla/5.0 (Nintendo 3DS; U; ; Factory Media Production)
Version/<version>.<region>". <lang> is "en", "fr", etc. <region> is
"US", "EU", etc. See below for <version>.

<table>
<thead>
<tr class="header">
<th>Browser version</th>
<th>USA/EUR CDN Title-version</th>
<th>Release date</th>
<th>Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>1.7498</td>
<td>v16 and v0</td>
<td></td>
<td>Initial app version.</td>
</tr>
<tr class="even">
<td>1.7498</td>
<td>v1056 and v1040</td>
<td></td>
<td>First app update. This build uses the <a {{% href "../7.0.0-13" %}}
title="wikilink">v7.0</a> <a {{% href "../NCCH" %}} title="wikilink">NCCH</a>
encryption for the main CXI, this was the first retail title to use
this.</td>
</tr>
<tr class="odd">
<td>1.7498</td>
<td>v2096 and v2080</td>
<td>October 15, 2015</td>
<td>This update fixed the vuln used for tubehax.</p>
<ul>
<li>This version was built with the latest CTRSDK, so NATIVE_FIRM <a
{{% href "../9.6.0-24" %}} title="wikilink">9.6.0-X</a> is now required.</li>
<li>Plaintext HTTP is still used.</li>
<li>The RomFS is empty, and accessinfo is still 0x0. Strings related to
RO are still in the codebin, but during application startup ldr:ro isn't
used at all. The CROs are now built with the main codebin(included with
the main .text etc), hence the much larger sections listed below.</li>
<li>The codebin sections are much larger:
<ul>
<li>"Code text size: 0x003A9CF0" -&gt; "Code text size: 0x00A81470"</li>
<li>"Code ro size: 0x000B9360" -&gt; "Code ro size: 0x0014C848"</li>
<li>"Code data size: 0x00203F08" -&gt; "Code data size: 0x00207788"</li>
<li>"Code bss size: 0x00095748" -&gt; "Code bss size: 0x00094F48"</li>
</ul></li>
<li>The USA codebin contains the following user-agent strings:
"Mozilla/5.0 (Nintendo 3DS; U; Factory Media Production; en)
Version/1.7498.US" and "Mozilla/5.0 (Nintendo 3DS New3DS; U; Factory
Media Production; en) Version/1.7499.US".</li>
</ul>
<p><strong>None</strong> of the public Old3DS/New3DS <a
{{% href "../Browserhax" %}} title="wikilink">browserhax</a> which were public at
the time this YouTube app was updated, affect the YouTube app at all (no
crashes).</p>
<ul>
<li>The "range" html <input> no longer displays: the page
background-color is displayed where the slider would have been. Hence,
unless there's a way to get this to actually display, <a
{{% href "../Browserhax" %}} title="wikilink">sliderhax</a> isn't usable with this
YouTube app version.</li>
</ul>
<p>See <a
href="https://github.com/youtube/h5vcc_hh/commit/f464b0a60c6bc99001d4fe3b1915d31dc22b5d69">here</a>
for the WebKit changes. The only actual code changes (in this commit)
besides an optimization changeset being integrated, is changes for
fixing the vuln used by tubehax.</p>
<p>Originally the YouTube app used the DNS server from the system
configuration. Now it's hard-coded to use Google's DNS server at IP
address 8.8.8.8 via DNS-resolver socket code in the app itself (it's
unknown whether this resolver code existed in the app before this
version).</td>
</tr>
</tbody>
</table>

Updates for this application are forced, since the app itself checks for
a newer version of the title (this is done before any actual HTTP
requests by the actual application are done). This is done with [Friend
Services](Friend_Services "wikilink"): the application tries to
authenticate itself with FRDU. When the installed version is outdated,
it gets an error-code in the output buffer for
[FRDU:GetGameAuthenticationData](FRDU:GetGameAuthenticationData "wikilink")
(this error-code then gets passed to the error-display applet). This is
exactly what official games do when initializing online multiplayer too.

The friend HTTP requests which are involved with the above use HTTPS, so
blocking it isn't an option (the usual POST request(s) to
<https://nasc.nintendowifi.net/ac>): blocking it via DNS only results in
a different error-code.

## RomFS

The RomFS only contains [CROs](CRO0 "wikilink") ("/cro/") and the
[CRR](CRR0 "wikilink") ("/.crr/static.crr"), the following is the
"/cro/" contents:

- JavaScriptCore_CTR.cro
- WebCore_CTR.cro
- WebkitMediaPlayer_CTR.cro
- WebKit_CTR.cro
- static.crs

## 3rd Party Libs

The youtube application seems to use libcurl, libjpeg, OpenSSL(ver
1.0.0e) and libavcodec.

## Webkit

Looks like the YouTube application uses a newer version of Webkit than
the Internet Browser applet. It has the ability to construct Blobs, of
course the HTML5 video element, and possibly the Audio element (Visible,
but untested). It also supports the localStorage API. Here a list of
exposed apis: [3](http://pastie.org/private/cmtppzyqmopzi9umhg8za).

### embedded.ctr

Inside the YouTube app, there is a pseudo-webserver running that links
to a structure inside ExeFS. This structure provides a list of urls
under the domain "<http://embeded.ctr/>".
