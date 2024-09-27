+++
title = 'NIMS:RegisterTask'
+++

# Request

<table>
<thead>
<tr class="header">
<th>Index Word</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0</td>
<td>Header code [0x00550246]</td>
</tr>
<tr class="even">
<td>1-6</td>
<td><a href="../NIM_Services#TitleDownloadProgress"
title="wikilink">Title Download Progress</a></td>
</tr>
<tr class="odd">
<td>7-8</td>
<td>Unknown, not written by the system <a href="../eShop"
title="wikilink">eShop</a> application service command code *at*
*all*.</td>
</tr>
<tr class="even">
<td>9</td>
<td>Unknown, eShop always writes 0</td>
</tr>
<tr class="odd">
<td>10</td>
<td>for <a href="../IPC#Handle_Translation" title="wikilink">process
ID</a></td>
</tr>
<tr class="even">
<td>11</td>
<td>Placeholder for process ID</td>
</tr>
<tr class="odd">
<td>12</td>
<td>(size &lt;&lt; 14) {{!}} (static_buffer_id &lt;&lt; 10)}} for <a
href="../IPC#Static_Buffer_Translation" title="wikilink">static buffer</a>
(id 1)</td>
</tr>
<tr class="even">
<td>13</td>
<td>Pointer to the name of the title in UTF-16LE</td>
</tr>
<tr class="odd">
<td>14</td>
<td>(size &lt;&lt; 14) {{!}} (static_buffer_id &lt;&lt; 10)}} for <a
href="../IPC#Static_Buffer_Translation" title="wikilink">static buffer</a>
(id 5)</td>
</tr>
<tr class="even">
<td>15</td>
<td>Pointer to the name of the developer of the title in
UTF-16LE</td>
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
