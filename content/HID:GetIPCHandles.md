+++
title = 'HID:GetIPCHandles'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000A0000\] |

# Response

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
<td>Header code</td>
</tr>
<tr class="even">
<td>1</td>
<td>Result code</td>
</tr>
<tr class="odd">
<td>2</td>
<td></td>
</tr>
<tr class="even">
<td>3</td>
<td><a href="../HID_Shared_Memory" title="wikilink">Shared</a> memory
handle</td>
</tr>
<tr class="odd">
<td>4</td>
<td>Event handle signaled by HID-module, when the <a
href="../HID_Shared_Memory"
title="wikilink">sharedmem</a>+0(PAD/circle-pad)/+0xA8(touch-screen)
region was updated.</td>
</tr>
<tr class="even">
<td>5</td>
<td>Event handle signaled by HID-module, when the <a
href="../HID_Shared_Memory"
title="wikilink">sharedmem</a>+0(PAD/circle-pad)/+0xA8(touch-screen)
region was updated.</td>
</tr>
<tr class="odd">
<td>6</td>
<td>Event handle signaled by HID-module, when the <a
href="../HID_Shared_Memory" title="wikilink">sharedmem</a> accelerometer
state was updated.</td>
</tr>
<tr class="even">
<td>7</td>
<td>Event handle signaled by HID-module, when the <a
href="../HID_Shared_Memory" title="wikilink">sharedmem</a> gyroscope state
was updated.</td>
</tr>
<tr class="odd">
<td>8</td>
<td>Event handle signaled by HID-module, when the <a
href="../HID_Shared_Memory" title="wikilink">sharedmem</a> DebugPad state
was updated.</td>
</tr>
</tbody>
</table>
