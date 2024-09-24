# RO service "ldr:ro"

| Command Header | Available since system version  | Description                             |
|----------------|---------------------------------|-----------------------------------------|
| 0x000100C2     | [2.0.0-2](2.0.0-2 "wikilink")   | [Initialize](RO:Initialize "wikilink")  |
| 0x00020082     | [2.0.0-2](2.0.0-2 "wikilink")   | [LoadCRR](RO:LoadCRR "wikilink")        |
| 0x00030042     | [2.0.0-2](2.0.0-2 "wikilink")   | [UnloadCRR](RO:UnloadCRR "wikilink")    |
| 0x000402C2     | [2.0.0-2](2.0.0-2 "wikilink")   | [LoadCRO](RO:LoadExeCRO "wikilink")     |
| 0x000500C2     | [2.0.0-2](2.0.0-2 "wikilink")   | [UnloadCRO](RO:UnloadCRO "wikilink")    |
| 0x00060042     | [2.0.0-2](2.0.0-2 "wikilink")   | [LinkCRO](RO:LinkCRO "wikilink")        |
| 0x00070042     | [2.0.0-2](2.0.0-2 "wikilink")   | [UnlinkCRO](RO:UnlinkCRO "wikilink")    |
| 0x00080042     | [2.0.0-2](2.0.0-2 "wikilink")   | [Shutdown](RO:Shutdown "wikilink")      |
| 0x000902C2     | [7.2.0-17](7.2.0-17 "wikilink") | [LoadCRO_New](RO:LoadExeCRO "wikilink") |

The mapadress used in these services is calculated by the user-process
like so: when inputaddr is \<0x08000000, the address used is the same
one from inputaddr. Otherwise, the address is: mapvaddr = inputaddr -
(0x08000000 - \<main-process .text address + .text, .rodata, .data, and
.bss size aligned to pagesize\>). This service API is used for CTR
"DLLs"/shared libraries: [CRO](CRO0 "wikilink").

# Error Codes

| Error Code | Description                       |
|------------|-----------------------------------|
| D9012FF1   | Address is misaligned             |
| E0A12FF9   | Service is already Initialized    |
| E1612FF7   | Provided Kernel Handle is invalid |
|            |                                   |

# Version history

<table>
<thead>
<tr class="header">
<th><p>Version</p></th>
<th><p>Changes</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>v0</p></td>
<td><p>Initial version.</p></td>
</tr>
<tr class="even">
<td><p>v1024</p></td>
<td><p>Removed access for SVC's: 5,7,D,E,10.</p>
<p>Cmd5 now sets the last segment in the CRO binary to R-X when it's
done.</p>
<p>Maybe more.</p></td>
</tr>
<tr class="odd">
<td><p>v2049</p></td>
<td><p>No changes.</p></td>
</tr>
<tr class="even">
<td><p>v3074</p></td>
<td><p>Added cmd9.</p></td>
</tr>
<tr class="odd">
<td><p>v4096</p></td>
<td><p>No changes.</p></td>
</tr>
<tr class="even">
<td><p><a href="9.0.0-20" title="wikilink">v5120</a></p></td>
<td><p>No actual changes, just a rebuild with latest CTRSDK(only the
CTRSDK version values in .code for <a href="ErrDisp"
title="wikilink">ErrDisp</a> were updated).</p></td>
</tr>
</tbody>
</table>

[Category:Services](Category:Services "wikilink")