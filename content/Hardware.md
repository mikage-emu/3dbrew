+++
title = 'Hardware'
+++

This page lists and describes the hardware found inside the Nintendo
3DS. Many of these parts are custom made and are expanded upon here or
in other pages.

## Common hardware

<table>
<thead>
<tr class="header">
<th>Type</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>ARM11 Processor Core</td>
<td>Old3DS: <a
href="http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0360f/index.html">ARM11
2x MPCore &amp; 2x VFPv2 Co-Processor</a> 268MHz (268,111,856.0 ±
2<sup>-32</sup> Hz, i.e. exactly twice the clock rate of the ARM9).</p>
<p>New3DS: 4x MPCore, 4x VFPv2, able to run up to 804MHz (see below). It
also has an optional 2MB L2 cache.</td>
</tr>
<tr class="even">
<td>ARM9 Processor Core</td>
<td><a
href="http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0201d/index.html">ARM946</a>
134MHz (134,055,927.9 ± 2<sup>-32</sup> Hz),</td>
</tr>
<tr class="odd">
<td>GPU</td>
<td><a href="http://en.wikipedia.org/wiki/PICA200">DMP PICA</a>
268MHz,</td>
</tr>
<tr class="even">
<td>VRAM</td>
<td>6 MB within SoC.</td>
</tr>
<tr class="odd">
<td>Top screen</td>
<td>800x240, with only 400 usable pixels per eye per line.</td>
</tr>
<tr class="even">
<td>Bottom screen</td>
<td>320x240, with resistive touch overlay.</td>
</tr>
<tr class="odd">
<td>DSP</td>
<td><a
href="https://twitter.com/CEVADSP/status/177172880918986752">CEVA
TeakLite</a>. 134Mhz. 24ch 32728Hz sampling rates.</td>
</tr>
</tbody>
</table>

New3DS exclusives are able to clock the CPU at 804MHz, but this appears
to be limited to the currently running application/app cores. Timed by
running svcGetSystemTick on either side of a long idle loop to stay in
the current process context. svcGetSystemTick uses a tick counter
running at 268MHz in this mode.

On New3DS: when Home Menu is active, the system runs at 804MHz. For
everything else, it's 268MHz, except when the app(let) has the required
flag set. See [here](NCCH/Extended_Header "wikilink") and
[here](PDN_Registers "wikilink") for details, regarding clock-rate and
cache.

For New3DS-only there are multiple clock-rate multiplier values
available in [hardware](PDN_Registers "wikilink"), but since the
relevant code is only implemented in the New3DS ARM11-kernel, the only
non-normal clock-rate available with official kernel code is 3x.

## Specifications

| Type                                             | 3DS                                                                                                                                                  | 3DSXL                | 2DS                                                              | N3DS                                                                                                    | N3DSXL                      | N2DSXL                 |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------|------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|-----------------------------|------------------------|
| Model                                            | CTR-001                                                                                                                                              | SPR-001              | FTR-001                                                          | KTR-001                                                                                                 | RED-001                     | JAN-001                |
| SoC                                              | CPU CTR                                                                                                                                              | CPU CTR A CPU CTR    | CPU CTR B                                                        | CPU LGR A                                                                                               | CPU LGR A                   | CPU LGR A              |
| FCRAM                                            | [2x64MB Fujitsu MB82M8080-07L](https://web.archive.org/web/20221022124807/https://www.fujitsu.com/downloads/MICRO/fma/pdf/MB81EDS516545_e511463.pdf) | Fujitsu MB82DBS16641 | Fujitsu MB82DBS1664                                              | ??                                                                                                      | Fujitsu MB82MK9A9A          | Fujitsu MB82MK9A9A     |
| Top Screen                                       | 3.53 in, 3D                                                                                                                                          | 4.88 in, 3D          | 3.53 in cropped from a single panel                              | 3.88 in, 3D                                                                                             | 4.88 in, 3D                 | 4.88 in (?)            |
| Bottom Screen                                    | 3.00 in                                                                                                                                              | 4.18 in              | 3.00 in cropped from a single panel                              | 3.33 in                                                                                                 | 4.18 in                     | 4.18 in (?)            |
| Storage                                          | Toshiba THGBM2G3P1FBAI8 1GB                                                                                                                          |                      | Changed between O3DS and N3DS parts depending on production date | Samsung KLM4G1YEQC 4GB (in 1.3GiB SLC mode) or Toshiba THGBMBG4P1KBAIT 2GB (MLC, approx. 1.8GiB usable) |                             | Samsung KLM4G1FEPD 4GB |
| Speaker, Microphone, Circlepad, Touch controller | TI PAIC3010B 0AA37DW                                                                                                                                 | ??                   | TI AIC3010D 35AQ9NW                                              | TI AIC3010B 39C4ETW                                                                                     | TI AIC3010D 48C01JW         | ??                     |
| Gyroscope                                        | [Invensense ITG-3270 MEMS Gyroscope](https://www.sparkfun.com/datasheets/Sensors/Gyro/PS-ITG-3200-00-01.4.pdf)                                       | ??                   | ??                                                               | ??                                                                                                      | ??                          | ??                     |
| Accelerometer                                    | ST Micro 2048 33DH X1MAQ Accelerometer Model LIS331DH                                                                                                | ??                   | ??                                                               | ??                                                                                                      | ??                          | ??                     |
| Infrared IC                                      | NXP S750 0803 TSD031C                                                                                                                                | ??                   | ??                                                               | ??                                                                                                      | NXP S750 1603 TSD438C       | NXP S750 0210 TSD651C  |
| Custom Microcontroller                           | Renesas UC CTR                                                                                                                                       | ??                   | Renesas UC CTR 324KM47 KG10                                      | Renesas UC KTR                                                                                          | Renesas UC KTR 442KM13 TK14 | ??                     |
| PMIC?                                            | TI 93045A4 OAAH86W                                                                                                                                   | ??                   | ??                                                               | TI 93045A4 38A6TYW G2                                                                                   | TI 93045A4 49AF3NW G2       | TI 93045A4 72ASRHW G2  |
| Charging IC                                      | CKP TI [BQ24072](http://www.ti.com/lit/ds/symlink/bq24072.pdf)                                                                                       |                      |                                                                  |                                                                                                         |                             |                        |
| Wifi                                             | Atheros AR6014                                                                                                                                       | ??                   | ??                                                               | ??                                                                                                      | Atheros AR6014G-AL1C        | ??                     |
| Wifi SPI Flash                                   | Raw ID data: 20 58                                                                                                                                   | ??                   | ??                                                               | Raw ID data: 62 62                                                                                      | ??                          | ??                     |

- \[11\] Official Documentation

<!-- -->

- \[5\],\[10\] According to iFixit.com
  ([source](http://www.ifixit.com/Teardown/Nintendo-3DS-Teardown/5029/1#s22696)):

<!-- -->

- Datasheet for memory is for a chip in the same series, it has less
  memory than the one inside the 3DS (128mbits vs 512mbits).

<!-- -->

- There is a trove of data on the FCC website at
  [1](https://fjallfoss.fcc.gov/oetcf/eas/reports/ViewExhibitReport.cfm?mode=Exhibits&RequestTimeout=500&calledFromFrame=N&application_id=462292&fcc_id=%27EW4DWMW028%27).

<!-- -->

- \[12\] This IC is somewhat similar to
  [this](http://www.alldatasheet.net/datasheet-pdf/pdf/347838/NXP/SC16IS750IBS.html).

<!-- -->

- The Raw ID data for Wifi SPI Flash is from command 0x9F, RDID.

## FCRAM

There is one FCRAM (Fast Cycle RAM) IC in the 3DS, produced by Fujitsu
and branded as MB82M8080-07L. The Fujitsu MB82M8080-07L chip internally
contains 2 dies, where each die is branded MB81EDS516545 and
MB82DBS08645.

The MB81EDS516545 die is a CMOS Fast Cycle Random Access Memory (FCRAM)
with Low Power Double Data Rate (LPDDR) SDRAM Interface containing
512MBit storage accessible in a 64-bit format. The MB81EDS516545 is
suited for consumer applications requiring high data bandwidth with low
power consumption.

## SoC

The 3DS has much of it's internals housed in a SoC (System on Chip) just
like it's predecessors. This is done to reduce build costs, cut down on
power consumption, as well as make the PCB layout less complex and make
the system harder to tamper with. The SoC, branded as the Nintendo 1048
0H, contains the CPU, GPU, DSP and VRAM.

According to official documents, the CPU used is a dual-core ARM11 CPU,
clocked at 268MHz. One core is dedicated to system software, while the
other is used for application programming, each known as the syscore and
appcore, respectively.

## GPU

Designed by Digital Media Professionals Inc. (DMP) and codenamed
PICA200, 268Mhz.

Block diagram of an ULTRAY2000 based architecture PICA200:

<figure>
<img src="../Pica200BlockDiagram.png"
title="File:Pica200BlockDiagram.png" />
<figcaption><a
href="../File:Pica200BlockDiagram.png">File:Pica200BlockDiagram.png</a></figcaption>
</figure>

PICA200 is compatible with OpenGL ES 1.1. It furthermore provides unique
functionality for:

- Per-fragment lighting ("Lighting Maestro")
- Hard- and soft-shadowing ("Shadow Maestro")
- Polygon subdivision ("Figure Maestro")
- Bump mapping and procedural textures ("Mapping Maestro")
- Rendering of gaseous objects ("Particle Maestro")

Some parts of the extended functionality are provided in hardware by an
extended geometry pipeline. Most importantly, PICA200 has three
programmable vertex processors. There is furthermore a unit called
[Primitive Engine](GPU/Primitive_Engine "wikilink"), which is a geometry
shader unit (using the same instruction set as vertex shaders) with
support for variable-size primitives. The Primitive Engine functionality
may be disabled, and the geometry shader unit then acts as a fourth
vertex processor. See
[Shader_Instruction_Set](Shader_Instruction_Set "wikilink") for more
information on the shader instruction set.

[Fragment lighting](GPU/Fragment_Lighting "wikilink") is implemented as
an optional pipeline step during pixel processing. It's implemented by
having the vertex shader output an additional attribute describing the
transformation (represented by a quaternion) to surface-local space.
This per-vertex quaternion can then be interpolated across screen space
to calculate dot products relevant for lighting (e.g. light vector dot
normal vector). To provide support for advanced lighting models, these
dot products are used as indices into programmable lookup tables. With
this setup, PICA200 in particular supports the shading models
Blinn-Phong, Cook-Terrance, Ward, and microfacet-based BRDF-models.

PICA200 supports four texture units, the fourth of which is used
exclusively for [procedural texture
generation](GPU/Procedural_Texture_Generation "wikilink").

## SDIO controller

Nintendo recommends SD cards up to 32 GB. The internal SDIO controller
seems to support SD cards up to 2.199 Terabyte (32-bit sector number).
Up to 2TB (AGI TF138) has been tested and works, however larger SD sizes
increase system boot time. The larger the SD capacity, the greater the
bootup slowdown. 64-128GB tends to be the sweet spot for most users,
with only an extra 0.5-1.0 seconds added to boot time as the tradeoff
for the larger size.

SD cards should be formatted FAT32 with a 64KB unit size for maximum
compatibility.

![<File:Gm9_2tb_sd.png>](Gm9_2tb_sd.png "File:Gm9_2tb_sd.png")
![<File:Ftpd_2tb_sd.png>](Ftpd_2tb_sd.png "File:Ftpd_2tb_sd.png")

| Capacity    | Boot time (NEW2DS) | Boot time (OLD3DS) |
|-------------|--------------------|--------------------|
| No SD cards | 7 seconds          | 8 seconds          |
| 16GB        | 10 seconds         | 11 seconds         |
| 64GB        | 12 seconds         | 11 seconds         |
| 256GB       | 19 seconds         | 20 seconds         |
| 2TB         | 60 seconds         | 60 seconds         |

- Tests were made on NEW2DS 11.16.0.49J and OLD3DS 11.15.0.47J.
- Boot time is the time until you see the home menu (software icons are
  still loading) after pressing power button.

## Images

### Front

<figure>
<img src="../CTR_Front.jpg" title="CTR_Front.jpg" width="600" />
<figcaption>CTR_Front.jpg</figcaption>
</figure>

[High Resolution](http://guide-images.ifixit.net/igi/ishJaSCOwLkvbLYK)

### Back

<figure>
<img src="../CTR_Back.jpg" title="Image:CTR_Back.jpg" />
<figcaption>Image:CTR_Back.jpg</figcaption>
</figure>

[High Resolution](http://guide-images.ifixit.net/igi/n1CKAdbPrHyNPNuW)

### NAND pinout

NAND dumping has been successful, but the image is encrypted.

#### Normal model

<figure>
<img src="../CTR_NAND_pinout.png" title="Image:CTR_NAND_pinout.png" />
<figcaption>Image:CTR_NAND_pinout.png</figcaption>
</figure>

#### XL model

<figure>
<img src="../CTR_NAND_pinout_XL.jpg" title="CTR_NAND_pinout_XL.jpg"
width="500" />
<figcaption>CTR_NAND_pinout_XL.jpg</figcaption>
</figure>

#### 2DS

<figure>
<img src="../2DSeMMC.jpg" title="2DSeMMC.jpg" width="500" />
<figcaption>2DSeMMC.jpg</figcaption>
</figure>

#### New 3DS

<figure>
<img src="../N3DSeMMC.jpg" title="Image:N3DSeMMC.jpg" />
<figcaption>Image:N3DSeMMC.jpg</figcaption>
</figure>

#### New 3DS XL

<figure>
<img src="../N3DSXLeMMC.jpg" title="Image:N3DSXLeMMC.jpg" />
<figcaption>Image:N3DSXLeMMC.jpg</figcaption>
</figure>

### WiFi dongle pinout

<figure>
<img src="../CTR_WiFiDongle_pinout.png" title="CTR_WiFiDongle_pinout.png"
width="600" />
<figcaption>CTR_WiFiDongle_pinout.png</figcaption>
</figure>

SDIO interface is colored red:

- CLK
- CMD
- D0, D1, D2, D3

This is the interface for the 'NEW' WiFi module (based on Atheros
AR6002) first included in DSi.

The proprietary DS-mode WiFi is colored yellow, pins are unknown.

I²C eeprom is colored blue:

- SCL
- SDA

SPI Flash is colored purple:

- CLK
- CS#
- SI
- SO
- WP#
- NC

### Auxiliary Microcontroller (MCU)

<figure>
<img src="../CTR_UC.png" title="CTR_UC.png" width="600" />
<figcaption>CTR_UC.png</figcaption>
</figure>

Monitors HOME button, WiFi switch, 3D slider, volume control slider.
Controls LEDs, various power supplies via an I²C connection to the PMIC.

Two I²C buses are attached to the MCU. For one, the SoC is the master;
for the other, the MCU is the master.

Devices attached to MCU master I²C bus:

- MCU (master)
- Fuel Gauge
- Accelerometer (slave address 0x18)
- PMIC
- maybe more?

Devices attached to the SoC master I²C bus:

- SoC (master)
- MCU
- LCD
- Camera
- QTM (New3DS-only)

The MCU uses the [RL78
ISA](http://mcs.uwsuper.edu/sb/327/Resources/RL78.pdf).

The MCU uses some custom Special Function Registers, but documentation
for much of the hardware protocol/general SFRs can be found
[here](http://courses.ee.sun.ac.za/Computer_Systems_245/Dokumentasie/RL78%20hardware%20manual%20(registers).pdf).
