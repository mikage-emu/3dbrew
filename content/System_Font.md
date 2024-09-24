+++
title = 'System Font'
+++

During system boot, the system-font is loaded by [NS](NS "wikilink") to
LINEAR-memory(in the original 0x14000000 vmem region) which always gets
allocated at SYSTEM_memregion+0. Due to it being located there, all of
this is GPU accessible. The [BCFNT](BCFNT "wikilink") is loaded from the
font title for the system region into that memory. During loading, the
font-data is modified: the magic-num at fontdata+0 is changed from
"CFNT" to "CFNU", and all file offsets are converted to addresses in
this allocated linearmem. Processes can get the sharedmem_handle+vaddr
for mapping the sharedmem for this via
[<APT:GetSharedFont>](NS_and_APT_Services "wikilink").

With font-data title-version v0 for USA/EUR/JPN, the size of this entire
sharedmem is 0x332000-bytes.

Shared mem structure:

| Offset                | Size                             | Description                                                                                                                                                                                                                                                                                                                        |
|-----------------------|----------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0                   | 0x80                             | Header                                                                                                                                                                                                                                                                                                                             |
| 0x80                  | Font data size                   | The actual font data.                                                                                                                                                                                                                                                                                                              |
| 0x80 + Font data size | 0x332000 - 0x80 - Font data size | This is leftover data from decompression operation. During the font loading process, compressed data is loaded to `sharedmem + 0x332000 - compressed_size_aligned_to_4`, and then is decompressed to `sharedmem + 0x80`. Compressed data at the end that doesn't get overwritten by decompressed data remains in the shared memory |

Header structure:

<table>
<thead>
<tr class="header">
<th><p>Offset</p></th>
<th><p>Size</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x0</p></td>
<td><p>0x4</p></td>
<td><p>Status. 1: loading system font</p>
<p>2: system font loaded</p>
<p>3: failed to load system font</p></td>
</tr>
<tr class="even">
<td><p>0x4</p></td>
<td><p>0x4</p></td>
<td><p>Region. Indicates which <a
href="../Title_list#0004009B_-_Shared_Data_Archives"
title="wikilink">system font archive</a> is loaded 1: region JPN/EUR/USA
(archive 0004009B00014002)</p>
<p>2: region CHN (archive 0004009B00014102)</p>
<p>3: region KOR (archive 0004009B00014202)</p>
<p>4: region TWN (archive 0004009B00014302)</p></td>
</tr>
<tr class="odd">
<td><p>0x8</p></td>
<td><p>0x4</p></td>
<td><p>Decompressed font data size.</p></td>
</tr>
<tr class="even">
<td><p>0xC</p></td>
<td><p>0x74</p></td>
<td><p>Normally all-zero?</p></td>
</tr>
</tbody>
</table>

## Unicode Private Use characters

Some of these characters are used for tutorial message boxes and
notifications; they can also be generally used in [Mii](Mii "wikilink")
names, [application titles](SMDH "wikilink"), etc.

Most of these originated in the "icons" tab of the DS's standard
software keyboard, and were extensively used in its firmware UI.

|                    |
|--------------------|
| *Private Use Area* |
| U+                 |
| E00x               |
| E01x               |
| E02x               |
| E03x               |
| E04x               |
| E05x               |
| E06x               |
| E07x               |

Table courtesy
[Wikibooks](https://en.wikibooks.org/wiki/Unicode/Character_reference/E000-EFFF)