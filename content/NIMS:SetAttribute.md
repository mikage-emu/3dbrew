+++
title = 'NIMS:SetAttribute'
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
<td><p>Header code [0x000B0084]</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Length of the attribute to set (<em>including</em> trailing
NUL)</p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td><p>Length of the value to set (<em>including</em> trailing NUL if
string)</p></td>
</tr>
<tr class="even">
<td><p>3</p></td>
<td><p>(size &lt;&lt; 14) {{!}} (static_buffer_id &lt;&lt; 10)}} for <a
href="../IPC#Static_Buffer_Translation" title="wikilink">static buffer</a>
(id 0)</p></td>
</tr>
<tr class="odd">
<td><p>4</p></td>
<td><p>Pointer to the name of the attribute in ASCII to set</p></td>
</tr>
<tr class="even">
<td><p>5</p></td>
<td><p>(size &lt;&lt; 14) {{!}} (static_buffer_id &lt;&lt; 10)}} for <a
href="../IPC#Static_Buffer_Translation" title="wikilink">static buffer</a>
(id 1)</p></td>
</tr>
<tr class="odd">
<td><p>6</p></td>
<td><p>Pointer to the value of the attribute to set</p></td>
</tr>
</tbody>
</table>

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Sets an attribute. The name of the attribute appears to be an ASCII
string. The types of the attributes *may* vary (research required, only
ASCII strings observed).

| Attribute | Value                                                              |
|-----------|--------------------------------------------------------------------|
| TIN       | TIN (?). [eShop](EShop "wikilink") sets this to (string!) "56789". |
