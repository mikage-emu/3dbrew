# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000A0000\] |

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
<td><p>Header code</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Result code</p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>3</p></td>
<td><p><a href="HID_Shared_Memory" title="wikilink">Shared</a> memory
handle</p></td>
</tr>
<tr class="odd">
<td><p>4</p></td>
<td><p>Event handle signaled by HID-module, when the <a
href="HID_Shared_Memory"
title="wikilink">sharedmem</a>+0(PAD/circle-pad)/+0xA8(touch-screen)
region was updated.</p></td>
</tr>
<tr class="even">
<td><p>5</p></td>
<td><p>Event handle signaled by HID-module, when the <a
href="HID_Shared_Memory"
title="wikilink">sharedmem</a>+0(PAD/circle-pad)/+0xA8(touch-screen)
region was updated.</p></td>
</tr>
<tr class="odd">
<td><p>6</p></td>
<td><p>Event handle signaled by HID-module, when the <a
href="HID_Shared_Memory" title="wikilink">sharedmem</a> accelerometer
state was updated.</p></td>
</tr>
<tr class="even">
<td><p>7</p></td>
<td><p>Event handle signaled by HID-module, when the <a
href="HID_Shared_Memory" title="wikilink">sharedmem</a> gyroscope state
was updated.</p></td>
</tr>
<tr class="odd">
<td><p>8</p></td>
<td><p>Event handle signaled by HID-module, when the <a
href="HID_Shared_Memory" title="wikilink">sharedmem</a> DebugPad state
was updated.</p></td>
</tr>
</tbody>
</table>