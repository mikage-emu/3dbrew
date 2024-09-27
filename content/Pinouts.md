+++
title = 'Pinouts'
+++

## CTR CPU B

|     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |      |      |     |     |     |     |      |       |     |     |     |
|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|------|------|-----|-----|-----|-----|------|-------|-----|-----|-----|
| G   | 0?  | CS1 | ?   | ?   | D5  | D2  |     | RST | CLK | G   | G   | X   | X   | 3v3 | 3v3 |     | 3v3 |     |      |      |     | ?   | ?   | ?   |      | IRIRQ | ?   | ?   | G   |
| 1?  | 2?  | CSx | CSy | ?   | D6  | D3  | D0  | IRQ | CS1 | G   | G   | G   | G   | 3v3 |     | 3v3 |     | G   |      |      | ?   | ?   | ?   | ?   |      |       |     | ?   | ?   |
| 3?  |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |      |      |     |     |     |     |      |       |     | ?   | ?   |
|     |     |     | 3v3 |     | D7  | D4  | D1  | DET | CS2 | G   | G   | G   | 3v3 |     | 3v3 | G   | 3v3 | 3v3 | 3v3  | ?    | ?   | ?   | ?   | ?   | IRTX | ?     |     | ?   | ?   |
| CLK | D0  |     |     | G   | 1v2 | 3v3 | G   | 1v2 | 3v3 | G   | 1v2 | G   | G   | 1v2 | 3v3 | G   | 1v2 | 3v3 | G    | 1v2  | 3v3 | G   | 1v2 | 3v3 | G    | ?     |     | ?   | ?   |
| D1  | D2  |     | D3  | 3v3 |     |     |     |     |     |     |     |     |     |     |     |     |     |     |      |      |     |     |     |     | 1v2  | ?     |     | ?   | ?   |
| CMD | IRQ |     | WP  | 1v2 |     |     |     |     |     |     |     |     |     |     |     |     |     |     |      |      |     |     |     |     | 1v8  | ?     |     | ?   | ?   |
| CLK | D0  |     |     | G   |     |     | 3v3 | G   | 3v3 | G   | 1v2 | G   | 3v3 | G   | 1v2 | G   | 3v3 | G   | 1v2  | G    | 3v3 | G   |     |     | G    | ?     |     | ?   | ?   |
| D1  | D2  |     | D3  | 3v3 |     |     | G   | 3v3 | G   | 3v3 | G   | 3v3 | G   | 3v3 | G   | 3v3 | G   | 3v3 | G    | 3v3  | G   | 1v2 |     |     | 1v2  | ?     |     | ?   | ?   |
|     | CMD |     |     | 1v2 |     |     | 1v2 | G   |     |     |     |     |     |     |     |     |     |     |      |      | 1v2 | G   |     |     | 1v8  | ?     |     | ?   | ?   |
| ?   | ?   |     | ?   | G   |     |     | G   | 3v3 |     |     |     |     |     |     |     |     |     |     |      |      | G   | 1v8 |     |     | G    | ?     |     | ?   | ?   |
|     | ?   |     | ?   | 3v3 |     |     | 3v3 | G   |     |     |     |     |     |     |     |     |     |     |      |      | 1v2 | G   |     |     | 1v2  | ?     |     | ?   | ?   |
|     |     |     |     | 1v2 |     |     | G   | 3v3 |     |     |     |     |     |     |     |     |     |     |      |      | G   | 1v8 |     |     | 1v8  | ?     |     | ?   | ?   |
|     |     |     |     | G   |     |     | 1v2 | G   |     |     |     |     |     |     |     |     |     |     |      |      | 1v8 | G   |     |     | G    | ?     |     | ?   | ?   |
| SCL |     |     |     | 3v3 |     |     | G   | 3v3 |     |     |     |     |     |     |     |     |     |     |      |      | G   | 1v2 |     |     | 1v2  | ?     |     | ?   | ?   |
| SDA |     |     |     | 1v2 |     |     | 3v3 | G   |     |     |     |     |     |     |     |     |     |     |      |      | 1v8 | G   |     |     | 1v8  | ?     |     | ?   | ?   |
|     | ?   |     | ?   | G   |     |     | G   | 1v2 |     |     |     |     |     |     |     |     |     |     |      |      | G   | 1v8 |     |     | G    | ?     |     | ?   |     |
| ?   | ?   |     | ?   | 1v8 |     |     | 1v2 | G   |     |     |     |     |     |     |     |     |     |     |      |      | 1v8 | G   |     |     | 1v2  | ?     |     | ?   |     |
| ?   | ?   |     | ?   | 1v2 |     |     | G   | 1v8 |     |     |     |     |     |     |     |     |     |     |      |      | G   | 1v2 |     |     | 1v8  | ?     |     | ?   | ?   |
| ?   | ?   |     | ?   | G   |     |     | 1v8 | G   |     |     |     |     |     |     |     |     |     |     |      |      | 1v8 | G   |     |     | G    | ?     |     | ?   | ?   |
| ?   | ?   |     | ?   | 1v8 |     |     | G   | 1v8 |     |     |     |     |     |     |     |     |     |     |      |      | G   | 1v8 |     |     | 1v2  | ?     |     | ?   | ?   |
| G   | ?   |     | ?   | 1v2 |     |     | 1v2 | G   | 1v8 | G   | 1v8 | G   | 1v8 | G   | 1v2 | G   | 1v8 | G   | 1v8  | G    | 1v8 | G   |     |     | 1v8  | ?     |     | ?   | ?   |
| ?   | ?   |     | ?   | G   |     |     | G   | 1v8 | G   | 1v2 | G   | 1v8 | G   | 1v2 | G   | 1v8 | G   | 1v2 | G    | 1v8  | G   | 1v2 |     |     | G    | ?     |     | ?   | ?   |
| ?   | ?   |     | ?   | 1v8 |     |     |     |     |     |     |     |     |     |     |     |     |     |     |      |      |     |     |     |     | 1v2  | ?     |     | ?   | ?   |
| ?   | ?   |     | ?   | 1v2 |     |     |     |     |     |     |     |     |     |     |     |     |     |     |      |      |     |     |     |     | 1v8  | ?     |     | ?   | ?   |
| ?   | ?   |     | ?   | G   | 1v8 | 1v2 | G   | 1v8 | 1v2 | G   | 1v8 | 1v2 | G   | 1v8 | 1v2 | G   | 1v8 | 1v2 | G    | 1v8  | 1v2 | G   | 1v8 | 1v2 | G    | ?     |     | ?   | ?   |
| ?   | ?   |     | ?   | ?   | ?   | ?   | ?   | ?   | ?   | ?   | 3?  | 4?  | 5?  |     |     |     |     | B   | PADR | PADD | G   | ?   | ?   | G   | ?    | ?     |     | ?   | ?   |
| ?   | ?   |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |     |      |      |     |     |     |     |      |       |     | ?   | ?   |
| G   | G   | ?   | ?   | ?   | ?   |     | ?   | ?   | ?   | ?   | SDA | 1?  | 2?  |     |     |     |     | A   | STRT | PADU | L   | Y   | ?   | ?   | ?    | ?     | ?   | ?   | ?   |
| G   | ?   | ?   |     | ?   | ?   | ?   |     | ?   | ?   | ?   | SCL | 0?  |     |     |     |     |     |     | SLCT | PADL | R   | X   | ?   | ?   | ?    | ?     | ?   | ?   | G   |

legend:

|                   |
|-------------------|
| SoC clock crystal |
| RTC clock crystal |
| Gamecard          |
| SDCARD SDIO       |
| NAND SDIO         |
| WIFI SDIO         |
| SPI               |
| I2C-1             |
| I2C-2             |
| I2C-3             |
| Pad               |
| FCRAM             |
| Camera            |
| WIFI              |
| GPIO              |
| LCD0 (small)      |
| LCD1 (big)        |
| CODEC0 (unknown)  |
| CODEC1 (unknown)  |
| MCU (unknown)     |
| POWER             |
| Ground            |

Orientation: Triangle bottom right on the PCB.

## UC CTR

The MCU seems to most closely resemble an NEC (Renesas) 78K0R/Kx3-L
64-pin FBGA:
<https://www.renesas.com/us/en/document/mah/78k0rkx3-l-users-manual-hardware-r01uh0106ej040078k0rkx3l?language=en&r=1051991>

The functional pin mapping is almost exactly the same, except the GPIO
port assignment is almost completely different.

Most low port numbers appear to map to the correct physical pin
locations as described in the above datasheet, however around P7 and
above this mapping is definitely altered.

Orientation: Pin 1 marker in bottom left corner

### Pinout

|     |     |        |      |         |        |     |         |         |
|-----|-----|--------|------|---------|--------|-----|---------|---------|
| 8   | \+  | G      |      |         | TP75   | X   | X       | ?       |
| 7   | SCL |        | G    |         | /RESET | ?   | ?       | \+      |
| 6   | SDA |        | \+   | TP77    | TP76   |     |         | \+      |
| 5   | ?   |        | TP78 | PWRLED1 |        |     |         | CHRGLED |
| 4   |     |        |      |         |        |     | G       | G       |
| 3   |     | PWRBTN |      |         |        |     | BATTTHM |         |
| 2   |     |        |      | PWRLED0 |        |     | HOMEBTN |         |
| 1   | \+  |        |      |         | SCL    | SDA |         | G       |
| /   | A   | B      | C    | D       | E      | F   | G       | H       |

### Pin assignment

`und = undocumented / custom`
`SFR = Special Function Register (SFR bank 1, range FFF00h - FFFFFh)`
`ESR = Extended Special Function Register (SFR bank 2, range F0000h - F0806h)`
`/   = active low (ground to enable, pull to power supply to disable)`

| TP   | Pin | Port                   | Purpose                                                                                          |
|------|-----|------------------------|--------------------------------------------------------------------------------------------------|
| TP79 | A8  | EVdd                   | Digital voltage source input (positive)                                                          |
| TP74 | E7  | /RESET                 | Resets the MCU when grounded, but is also used when reprogramming                                |
| TP75 | E8  | FLMD0                  | Flash mode(?) used when reprogramming with external programmer                                   |
| TP76 | E6  | TOOL1                  | Used when using an ICE or debugger                                                               |
| TP77 | D6  | TOOL0                  | Multipurpose pin for reprogramming and debugging                                                 |
|      | A7  | SCL0 / P6.0            | DSi-side I2C SCL                                                                                 |
|      | A6  | SDA0 / P6.1            | DSi-side I2C SDA                                                                                 |
|      | E1  | SCL1 / ESR\[510h\].und | 3DS-side SCL                                                                                     |
|      | F1  | SDA1 / ESR\[510h\].und | 3DS-side SDA                                                                                     |
|      | F7  | /P0.1                  | SocReset_n (one of the two SoC reset signals)                                                    |
|      | G7  | /P0.0                  | SocReset_n (one of the two SoC reset signals)                                                    |
|      |     | /P3.0                  | Unknown. Probably resets something, as it's poked in a similar pattern to the SoC reset signals. |
|      |     | P5.0                   | Toggles something (poked in conjunction with reset signals)                                      |
|      |     | P2.0                   | HOME button                                                                                      |
|      |     | P4.3                   | Charging LED(?)                                                                                  |
|      |     | P5.1                   | Charger "button"                                                                                 |
|      |     | P7.0                   | ???                                                                                              |
|      |     | P2.4                   | BatteryChargeState (?)                                                                           |
|      |     | P7.3                   | Power button                                                                                     |
|      |     | P7.4                   | WiFi button                                                                                      |
|      |     | P7.6                   | External IRQ (MCU --\> SoC)                                                                      |

## CODEC

|        |       |     |     |     |     |        |     |     |     |          |
|--------|-------|-----|-----|-----|-----|--------|-----|-----|-----|----------|
|        | 4?    | 3v3 |     | 3?  | 0?  | ?      | ?   |     | G   |          |
|        | 3?    | 5?  | G   |     | 1?  | CSx    | ?   |     | G   |          |
| G      | 2?    | 0?  | G   |     | 2?  | CSy    |     |     |     | SPEAKER1 |
| TOUCH  | TOUCH | 1?  | G   | G   | G   | G      | G   | G   |     | SPEAKER1 |
| TOUCH  | TOUCH |     | G   | G   | G   | G      | G   | G   |     |          |
| CPAD   | CPAD  |     | G   | G   | G   | G      | G   | G   |     |          |
|        |       |     | G   | G   | G   | G      | G   | G   |     | SPEAKER2 |
| MIC    |       | G   | G   | G   | G   | G      | G   | G   |     | SPEAKER2 |
| JACK_R | G     | G   |     | G   |     |        |     |     |     | G        |
| 3v3    |       |     |     | G   | G   | G      | G   |     |     |          |
|        |       | G   |     |     |     | JACK_L |     | G   | G   |          |

## LCD (old3DS bottom)

<table>
<thead>
<tr class="header">
<th><p>Pin number</p></th>
<th><p>Name</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>01</p></td>
<td><p>-6V</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>02</p></td>
<td><p>12V</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>03</p></td>
<td><p>CLK</p></td>
<td><p>Pixel clock</p></td>
</tr>
<tr class="even">
<td><p>04</p></td>
<td><p>/HBL</p></td>
<td><p>Horizontal blank (low while blanking)</p></td>
</tr>
<tr class="odd">
<td><p>05</p></td>
<td><p>/VBL</p></td>
<td><p>Vertical blank (low while blanking)</p></td>
</tr>
<tr class="even">
<td><p>06</p></td>
<td><p>2v2</p></td>
<td><p>Loopback of pin 07?</p></td>
</tr>
<tr class="odd">
<td><p>07</p></td>
<td><p>2v2</p></td>
<td><p>Content latch? Shorting this to ground or to pin 06 will "lock"
the screen memory while still allowing the screen to refresh
itself.</p></td>
</tr>
<tr class="even">
<td><p>08</p></td>
<td><p>GND</p></td>
<td><p>"chassi" ground</p></td>
</tr>
<tr class="odd">
<td><p>09</p></td>
<td><p>HCL</p></td>
<td><p>Horizontal clock</p></td>
</tr>
<tr class="even">
<td><p>10</p></td>
<td><p>GND</p></td>
<td><p>"chassi" ground</p></td>
</tr>
<tr class="odd">
<td><p>11</p></td>
<td><p>BIAS 1</p></td>
<td><p>Default ~ 4.5V - 4.8V; sets contrast</p></td>
</tr>
<tr class="even">
<td><p>12</p></td>
<td><p>BIAS 2</p></td>
<td><p>Usually matches BIAS 1; sets "flicker"</p></td>
</tr>
<tr class="odd">
<td><p>13</p></td>
<td><p>???</p></td>
<td><p>Might be a transistor? Shorted to ground if off, 2.36V if
on.</p></td>
</tr>
<tr class="even">
<td><p>14</p></td>
<td><p>6V</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>15</p></td>
<td><p>???</p></td>
<td><p>Loopback of pin 14 ? Shorting this with pin 14 or ground will
make the 3DS turn off with a harsh pop sound.</p></td>
</tr>
<tr class="even">
<td><p>16</p></td>
<td><p>???</p></td>
<td><p>???</p></td>
</tr>
<tr class="odd">
<td><p>17</p></td>
<td><p>???</p></td>
<td><p>???</p></td>
</tr>
<tr class="even">
<td><p>18</p>
<p>[...]</p>
<p>25</p></td>
<td><p>RED 0</p>
<p>[...]</p>
<p>RED 7</p></td>
<td><p>Red pixel bits</p></td>
</tr>
<tr class="odd">
<td><p>26</p></td>
<td><p>GND</p></td>
<td><p>"chassi" ground</p></td>
</tr>
<tr class="even">
<td><p>27</p>
<p>[...]</p>
<p>34</p></td>
<td><p>BLUE 7</p>
<p>[...]</p>
<p>BLUE 0</p></td>
<td><p>Blue pixel bits</p></td>
</tr>
<tr class="odd">
<td><p>35</p></td>
<td><p>GND</p></td>
<td><p>"chassi" ground</p></td>
</tr>
<tr class="even">
<td><p>36</p>
<p>[...]</p>
<p>43</p></td>
<td><p>GREEN 7</p>
<p>[...]</p>
<p>GREEN 0</p></td>
<td><p>Green pixel bits</p></td>
</tr>
</tbody>
</table>