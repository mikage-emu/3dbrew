+++
title = 'MCURTC:SetInfoLEDPattern'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x003B0640\] |
| 1          | Animation                  |
| 2-9        | u8\[32\] Red pattern       |
| 10-17      | u8\[32\] Green pattern     |
| 18-25      | u8\[32\] Blue pattern      |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is used for controlling (including blinking) the notification LED.
MCU module uses [I2C](I2C_Services "wikilink") service command
0x001100C2 to write the input 0x64-bytes to MCU [I2C](I2C "wikilink")
register 0x2D.

# Animation

<table>
<thead>
<tr class="header">
<th><p>u8 delay</p></th>
<th><p>u8 smoothing</p></th>
<th><p>u8 loop_delay</p></th>
<th><p>u8 blink_speed</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><em>delay = seconds * 0x10</em></p>
<p>Since this data is represented in a u8, the precision is 1/16th of a
second (0x01) and the maximum delay time is 15.9375 seconds (0xFF).</p>
<p>If set to 0x00, only the first value of the pattern is played.
(?)</p></td>
<td><p>The lower the value is, the less smoothing is applied to the
pattern. Here is a visual approximation of how the smoothing works: <a
href="https://i.imgur.com/ZxdPbIw.png">Smooth function.</a></p></td>
<td><p><em>loop_delay = seconds * 0x10</em> Since this data is
represented in a u8, the precision is 1/16th of a second (0x01) and the
maximum delay time is 15.875 seconds (0xFE).</p>
<p>If set to 0x00, there is no loop delay.</p>
<p>If set to 0xFF, the pattern is played only once.</p></td>
<td><p>if smoothing is nothing, this can set LED blink speed
value.</p></td>
</tr>
</tbody>
</table>
