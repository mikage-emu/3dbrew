+++
title = 'NIMS:SetAttribute'
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
<td>Header code [0x000B0084]</td>
</tr>
<tr class="even">
<td>1</td>
<td>Length of the attribute to set (<em>including</em> trailing
NUL)</td>
</tr>
<tr class="odd">
<td>2</td>
<td>Length of the value to set (<em>including</em> trailing NUL if
string)</td>
</tr>
<tr class="even">
<td>3</td>
<td>(size &lt;&lt; 14) {{!}} (static_buffer_id &lt;&lt; 10)}} for <a
href="../IPC#static_buffer_translation" title="wikilink">static buffer</a>
(id 0)</td>
</tr>
<tr class="odd">
<td>4</td>
<td>Pointer to the name of the attribute in ASCII to set</td>
</tr>
<tr class="even">
<td>5</td>
<td>(size &lt;&lt; 14) {{!}} (static_buffer_id &lt;&lt; 10)}} for <a
href="../IPC#static_buffer_translation" title="wikilink">static buffer</a>
(id 1)</td>
</tr>
<tr class="odd">
<td>6</td>
<td>Pointer to the value of the attribute to set</td>
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
