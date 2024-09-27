+++
title = 'MCURTC:GetRTC'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00020000\] |

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
<td>2-3</td>
<td><code> u8 seconds,</code><br />
<code> u8 minutes,</code><br />
<code> u8 hours,</code><br />
<code> u8 dayofweek,</code><br />
<code> u8 dayofmonth,</code><br />
<code> u8 month,</code><br />
<code> u8 year,</code><br />
<code> u8 leapcount</code></td>
</tr>
<tr class="even">
<td>3-4</td>
<td>svcGetSystemTick value corresponding to when the RTC read was
done</td>
</tr>
<tr class="odd">
<td>5-9</td>
<td>Uninitialized data</td>
</tr>
<tr class="even">
<td></td>
<td></td>
</tr>
</tbody>
</table>

# Description

This gets the RTC time from the MCU device.
