+++
title = 'GSPGPU:RegisterInterruptRelayQueue'
+++

# Request

<table>
<thead>
<tr class="header">
<th><p>Index Word</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>Header code [0x00130042]</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Flags</p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>3</p></td>
<td><p><a href="KEvent" title="wikilink">KEvent</a> handle</p></td>
</tr>
</tbody>
</table>

# Response

<table>
<thead>
<tr class="header">
<th><p>Index Word</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>Header code [0x00130082]</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Result code</p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td><p>GSP module thread index</p></td>
</tr>
<tr class="even">
<td><p>3</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>4</p></td>
<td><p><a href="SVC" title="wikilink">Shared</a> memory handle</p></td>
</tr>
</tbody>
</table>

# Description

The specified KEvent handle is used by the application GSP thread, when
the event is triggered by GSP module this application thread can then
write [GX commands](GSP_Shared_Memory "wikilink") to the shared memory.