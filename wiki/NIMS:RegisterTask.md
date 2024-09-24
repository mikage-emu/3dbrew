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
<td><p>Header code [0x00550246]</p></td>
</tr>
<tr class="even">
<td><p>1-6</p></td>
<td><p><a href="NIM_Services#TitleDownloadProgress"
title="wikilink">Title Download Progress</a></p></td>
</tr>
<tr class="odd">
<td><p>7-8</p></td>
<td><p>Unknown, not written by the system <a href="eShop"
title="wikilink">eShop</a> application service command code *at*
*all*.</p></td>
</tr>
<tr class="even">
<td><p>9</p></td>
<td><p>Unknown, eShop always writes 0</p></td>
</tr>
<tr class="odd">
<td><p>10</p></td>
<td><p>for <a href="IPC#Handle_Translation" title="wikilink">process
ID</a></p></td>
</tr>
<tr class="even">
<td><p>11</p></td>
<td><p>Placeholder for process ID</p></td>
</tr>
<tr class="odd">
<td><p>12</p></td>
<td><p>(size &lt;&lt; 14) {{!}} (static_buffer_id &lt;&lt; 10)}} for <a
href="IPC#Static_Buffer_Translation" title="wikilink">static buffer</a>
(id 1)</p></td>
</tr>
<tr class="even">
<td><p>13</p></td>
<td><p>Pointer to the name of the title in UTF-16LE</p></td>
</tr>
<tr class="odd">
<td><p>14</p></td>
<td><p>(size &lt;&lt; 14) {{!}} (static_buffer_id &lt;&lt; 10)}} for <a
href="IPC#Static_Buffer_Translation" title="wikilink">static buffer</a>
(id 5)</p></td>
</tr>
<tr class="even">
<td><p>15</p></td>
<td><p>Pointer to the name of the developer of the title in
UTF-16LE</p></td>
</tr>
</tbody>
</table>

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Registers a task for sleep mode downloading. A glowing, wrapped package
with the information from input words 13 and 15 will be shown on the
[Home Menu](Home_Menu "wikilink").