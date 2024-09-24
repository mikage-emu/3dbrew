# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00020000\] |

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
<td><p>2-3</p></td>
<td><p><code> u8 seconds,</code><br />
<code> u8 minutes,</code><br />
<code> u8 hours,</code><br />
<code> u8 dayofweek,</code><br />
<code> u8 dayofmonth,</code><br />
<code> u8 month,</code><br />
<code> u8 year,</code><br />
<code> u8 leapcount</code></p></td>
</tr>
<tr class="even">
<td><p>3-4</p></td>
<td><p>svcGetSystemTick value corresponding to when the RTC read was
done</p></td>
</tr>
<tr class="odd">
<td><p>5-9</p></td>
<td><p>Uninitialized data</p></td>
</tr>
<tr class="even">
<td></td>
<td></td>
</tr>
</tbody>
</table>

# Description

This gets the RTC time from the MCU device.