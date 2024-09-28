+++
title = 'I2C Registers'
+++

# Registers

| Old3DS | Name                            | Address    | Width | Used by           |
|--------|---------------------------------|------------|-------|-------------------|
| Yes    | I2C1_DATA                       | 0x10161000 | 1     | I2C bus 1 devices |
| Yes    | [I2C1_CNT](#i2c_cnt "wikilink") | 0x10161001 | 1     | I2C bus 1 devices |
| Yes    | I2C1_CNTEX                      | 0x10161002 | 2     | I2C bus 1 devices |
| Yes    | I2C1_SCL                        | 0x10161004 | 2     | I2C bus 1 devices |
| Yes    | I2C2_DATA                       | 0x10144000 | 1     | I2C bus 2 devices |
| Yes    | [I2C2_CNT](#i2c_cnt "wikilink") | 0x10144001 | 1     | I2C bus 2 devices |
| Yes    | I2C2_CNTEX                      | 0x10144002 | 2     | I2C bus 2 devices |
| Yes    | I2C2_SCL                        | 0x10144004 | 2     | I2C bus 2 devices |
| Yes    | I2C3_DATA                       | 0x10148000 | 1     | I2C bus 3 devices |
| Yes    | [I2C3_CNT](#i2c_cnt "wikilink") | 0x10148001 | 1     | I2C bus 3 devices |
| Yes    | I2C3_CNTEX                      | 0x10148002 | 2     | I2C bus 3 devices |
| Yes    | I2C3_SCL                        | 0x10148004 | 2     | I2C bus 3 devices |

## I2C_CNT

| BIT | DESCRIPTION                                                        |
|-----|--------------------------------------------------------------------|
| 0   | Stop (0=No, 1=Stop/last byte)                                      |
| 1   | Start (0=No, 1=Start/first byte)                                   |
| 2   | Pause (0=Transfer Data, 1=Pause after Error, used with/after Stop) |
| 4   | Ack Flag (0=Error, 1=Okay) (For DataRead: W, for DataWrite: R)     |
| 5   | Data Direction (0=Write, 1=Read)                                   |
| 6   | Interrupt Enable (0=Disable, 1=Enable)                             |
| 7   | Start/busy (0=Ready, 1=Start/busy)                                 |

## I2C_CNTEX

| BIT | DESCRIPTION          |
|-----|----------------------|
| 0-1 | ? Set to 2 normally. |

## I2C_SCL

| BIT  | DESCRIPTION          |
|------|----------------------|
| 0-5  | ?                    |
| 8-12 | ? Set to 5 normally. |

# I2C Devices

| [Device id](I2C_Registers "wikilink") | Device bus id | Device Write Address | Accessible via I2C [service](I2C_Services "wikilink") | Device description                                                                                                                                                                                                                                   |
|---------------------------------------|---------------|----------------------|-------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0                                     | 1             | 0x4a                 | "i2c::MCU"                                            | Power management?(same device addr as the DSi power-management)                                                                                                                                                                                      |
| 1                                     | 1             | 0x7a                 | "i2c::CAM"                                            | Camera0?(same dev-addr as DSi cam0)                                                                                                                                                                                                                  |
| 2                                     | 1             | 0x78                 | "i2c::CAM"                                            | Camera1?(same dev-addr as DSi cam1)                                                                                                                                                                                                                  |
| 3                                     | 2             | 0x4a                 | "i2c::MCU"                                            | MCU                                                                                                                                                                                                                                                  |
| 4                                     | 2             | 0x78                 | "i2c::CAM"                                            | ?                                                                                                                                                                                                                                                    |
| 5                                     | 2             | 0x2c                 | "i2c::LCD"                                            | ?                                                                                                                                                                                                                                                    |
| 6                                     | 2             | 0x2e                 | "i2c::LCD"                                            | ?                                                                                                                                                                                                                                                    |
| 7                                     | 2             | 0x40                 | "i2c::DEB"                                            | ?                                                                                                                                                                                                                                                    |
| 8                                     | 2             | 0x44                 | "i2c::DEB"                                            | ?                                                                                                                                                                                                                                                    |
| 9                                     | 3             | 0xa6                 | "i2c::HID"                                            | Gyroscope. The device table in I2C-module had the device address changed from 0xA6 to 0xD6 with [8.0.0-18](8.0.0-18 "wikilink").                                                                                                                     |
| 10                                    | 3             | 0xd0                 | "i2c::HID"                                            | Gyroscope (old3DS)                                                                                                                                                                                                                                   |
| 11                                    | 3             | 0xd2                 | "i2c::HID"                                            | Gyroscope (2DS, new3DSXL, new2DSXL)                                                                                                                                                                                                                  |
| 12                                    | 3             | 0xa4                 | "i2c::HID"                                            | DebugPad (slightly modified [Wii Classic Controller Pro](https://wiibrew.org/wiki/Wiimote/Extension_Controllers/Classic_Controller_Pro))                                                                                                             |
| 13                                    | 3             | 0x9a                 | "i2c::IR"                                             | IR                                                                                                                                                                                                                                                   |
| 14                                    | 3             | 0xa0                 | "i2c::EEP"                                            | HWCAL EEPROM ([only present on dev units where SHA256 is used for HWCAL verification](Hardware_calibration#Header "wikilink"))                                                                                                                       |
| 15                                    | 2             | 0xee                 | "i2c::NFC"                                            | New3DS-only [NFC](NFC_Services "wikilink")                                                                                                                                                                                                           |
| 16                                    | 1             | 0x40                 | "i2c::QTM"                                            | New3DS-only [QTM](QTM_Services "wikilink")                                                                                                                                                                                                           |
| 17                                    | 3             | 0x54                 | "i2c::IR"                                             | Used by IR-module starting with [8.0.0-18](8.0.0-18 "wikilink"), for New3DS-only HID via "ir:rst". This deviceid doesn't seem to be supported by i2c module on [8.0.0-18](8.0.0-18 "wikilink")(actual support was later added in New3DS i2c module). |

**Notice**: These device addresses are used for writing to the
respective device, for reading bit0 must be set (see I2C protocol).
Thus, the actual device address is \>\> 1.

## Device 3

` ro = read-only (writing is no-op)`
` rw = read-write`
` wo = write-only (reading will yield 00, FF, or unpredictable data)`

` d* = dynamic register (explaination below this table)`
` s* = shared register (explaination below this table)`
` ds = dynamic shared (explaination below this table)`

Reading or writing multiple bytes from/to single-byte registers
increments the register ID along with it. For example reading two bytes
from reg 0x00 reads regs 0x00 and 0x01.

This is not the case for multibyte regs (0x29, 0x2D, 0x4F, 0x61 and
0x7F), plus reg 0x60.

<table>
<thead>
<tr class="header">
<th><p>REGISTER</p></th>
<th><p>WIDTH</p></th>
<th><p>INFO</p></th>
<th><p>DESCRIPTION</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x00</p></td>
<td><p>s</p></td>
<td><p>ro</p></td>
<td><p>Version high</p></td>
</tr>
<tr class="even">
<td><p>0x01</p></td>
<td><p>s</p></td>
<td><p>ro</p></td>
<td><p>Version low</p></td>
</tr>
<tr class="odd">
<td><p>0x02</p></td>
<td><p>d</p></td>
<td><p>rw</p></td>
<td><p>For bit0 and 1 values, writing will mask away/"acknowledge" the
event, set to 3 by mcuMainLoop on reset if reset source is Watchdog</p>
<p><code> bit0: RTC clock value got reset to defaults</code><br />
<code> bit1: Watchdog reset happened</code><br />
<code> bit5: TWL MCU reg: volume mode (0: 8-step, 1: 32-step)</code><br />
<code> bit6: TWL MCU reg: NTR (0) vs TWL mode (1)</code><br />
<code> bit7: TWL MCU reg: Uses NAND</code></p></td>
</tr>
<tr class="even">
<td><p>0x03</p></td>
<td><p>ds</p></td>
<td><p>rw</p></td>
<td><p>Top screen Vcom</p></td>
</tr>
<tr class="odd">
<td><p>0x04</p></td>
<td><p>ds</p></td>
<td><p>rw</p></td>
<td><p>Bottom screen Vcom</p></td>
</tr>
<tr class="even">
<td><p>0x05 - 0x07</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>Danger zone - <a href="../MCU_Services#MCU_firmware_versions"
title="wikilink">MCU unlock sequence</a> is written here.</p></td>
</tr>
<tr class="odd">
<td><p>0x08</p></td>
<td><p>s</p></td>
<td><p>ro</p></td>
<td><p>Raw 3D slider position</p></td>
</tr>
<tr class="even">
<td><p>0x09</p></td>
<td><p>s</p></td>
<td><p>ro</p></td>
<td><p>Volume slider state (0x00 - 0x3F) This is the same value returned
by <a href="../MCUHWC:GetSoundVolume"
title="wikilink">MCUHWC:GetSoundVolume</a></p></td>
</tr>
<tr class="odd">
<td><p>0x0A</p></td>
<td><p>s</p></td>
<td><p>ro</p></td>
<td><p>Internal battery temperature (in Celsius)</p></td>
</tr>
<tr class="even">
<td><p>0x0B</p></td>
<td><p>s</p></td>
<td><p>ro</p></td>
<td><p>Battery percentage (integer part).</p>
<p>Valid values are in range of 0 to 100 inclusive.</p></td>
</tr>
<tr class="odd">
<td><p>0x0C</p></td>
<td><p>s</p></td>
<td><p>ro</p></td>
<td><p>Battery percentage (fractional part).</p>
<p>Seems to have a resolution of around 0.1% according to tests.</p>
<p>To calculate battery charge percentage in full resolution:</p>
<p><code>MCU[0x0B] + (MCU[0x0C] / 256.0F)</code></p></td>
</tr>
<tr class="even">
<td><p>0x0D</p></td>
<td><p>s</p></td>
<td><p>ro</p></td>
<td><p>System voltage.</p>
<p>This voltage seems to be measured at the load side, so the voltage
reading will always be lower than direct probes across the battery due
to the various voltage drops in the system by the time the voltage is
measured.</p>
<p>To calculate system voltage in Volts:</p>
<p><code>MCU[0x0D] * 5 / 256.0F</code></p></td>
</tr>
<tr class="odd">
<td><p>0x0E</p></td>
<td><p>s</p></td>
<td><p>ro</p></td>
<td><p>?</p></td>
</tr>
<tr class="even">
<td><p>0x0F</p></td>
<td><p>s</p></td>
<td><p>ro</p></td>
<td><p>Flags: bit7-5 are read via <a href="../MCU_Services"
title="wikilink">mcu::GPU</a>. The rest of them are read via <a
href="../MCU_Services" title="wikilink">mcu::RTC</a>.</p>
<p><code> bit1: ShellState</code><br />
<code> bit3: AdapterState</code><br />
<code> bit4: BatteryChargeState</code><br />
<code> bit5: Bottom screen backlight on</code><br />
<code> bit6: Top screen backlight on</code><br />
<code> bit7: LCD panel voltage on</code></p></td>
</tr>
<tr class="odd">
<td><p>0x10 - 0x13</p></td>
<td><p>s</p></td>
<td><p>ro</p></td>
<td><p>Received interrupt bitmask, see register 0x18 for possible values
If no interrupt was received this register is 0</p></td>
</tr>
<tr class="even">
<td><p>0x14</p></td>
<td><p>s</p></td>
<td><p>ro</p></td>
<td><p>Unused and unwritable byte :(</p></td>
</tr>
<tr class="odd">
<td><p>0x15 - 0x17</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>Unused and unreferenced free RAM! Good for userdata.</p></td>
</tr>
<tr class="even">
<td><p>0x18 - 0x1B</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>Interrupt mask for register 0x10 (0=enabled,1=disabled)</p>
<p><code> bit00: Power button press (for 27 "ticks")</code><br />
<code> bit01: Power button held (for 375 "ticks"; the 3DS turns off regardless after a fixed time)</code><br />
<code> bit02: HOME button press (for 5 "ticks")</code><br />
<code> bit03: HOME button release</code><br />
<code> bit04: WiFi switch button</code><br />
<code> bit05: Shell close</code><br />
<code> bit06: Shell open</code><br />
<code> bit07: Fatal hardware condition(</code><a
href="../Services#Notifications"
title="wikilink"><code>?</code></a><code>) (sent when the MCU gets reset by the Watchdog timer)</code><br />
<code> bit08: Charger removed</code><br />
<code> bit09: Charger plugged in</code><br />
<code> bit10: RTC alarm (when some conditions are met it's sent when the current day and month and year matches the current RTC time)</code><br />
<code> bit11: Accelerometer I2C read/write done </code><a
href="https://github.com/profi200/libn3ds/blob/083c8ffa3f56a49802fa74b6afe45a96820f0439/include/arm11/drivers/mcu_regmap.h#L124"><code>1</code></a><br />
<code> bit12: HID update</code><br />
<code> bit13: Battery percentage status change (triggered at 10%, 5%, and 0% while discharging)</code><br />
<code> bit14: Battery stopped charging (independent of charger state)</code><br />
<code> bit15: Battery started charging</code></p>
<p>Nonmaskable(?) interrupts</p>
<p><code> bit16: ???</code><br />
<code> bit17: ??? (opposite even for bit16)</code><br />
<code> bit22: Volume slider position change</code><br />
<code> bit23: ??? Register 0x0E update</code><br />
<code> bit24: GPU off</code><br />
<code> bit25: GPU on</code><br />
<code> bit26: bottom backlight off</code><br />
<code> bit27: bottom backlight on</code><br />
<code> bit28: top backlight off</code><br />
<code> bit29: top backlight on</code><br />
<code> bit30: bit set by mcu sysmodule</code><br />
<code> bit31: bit set by mcu sysmodule</code></p></td>
</tr>
<tr class="odd">
<td><p>0x1C - 0x1F</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>Unused and unreferenced free RAM! Good for userdata.</p></td>
</tr>
<tr class="even">
<td><p>0x20</p></td>
<td><p>d</p></td>
<td><p>wo</p></td>
<td><p>System power control:</p>
<p><code> bit0: power off</code><br />
<code> bit1: full reboot (unused). Discards things like </code><a
href="../CONFIG9_Registers#CFG9_BOOTENV"
title="wikilink"><code>CFG9_BOOTENV</code></a><br />
<code>   - Asserts RESET1 via PMIC command (?) (deasserts nRESET1). This could be the reset that controls some CFG9 registers</code><br />
<code>   - Asserts RESET2 (P0.1 = 0, PM0.1 = 0 (output)) (deasserts nRESET2)</code><br />
<code>   - Asserts FCRAM_RESET (P3.0 = 0) (deasserts nFCRAM_RESET)</code><br />
<code> bit2: normal reboot. Preserves </code><a
href="../CONFIG9_Registers#CFG9_BOOTENV"
title="wikilink"><code>CFG9_BOOTENV</code></a><code>, etc.</code><br />
<code>   - Asserts RESET2 (P0.1 = 0, PM0.1 = 0)</code><br />
<code>   - If in NTR emulation mode (see reg 0x02), asserts FCRAM_RESET (P3.0 = 0)</code><br />
<code>   - Resets TWL MCU i2c registers</code><br />
<code> bit3: FCRAM reset (present in by LgyBg. Unused because a system reboot does the same thing &amp; a PDN reg also possibly implements this function)</code><br />
<code>   - Asserts FCRAM_RESET (P3.0 = 0)</code><br />
<code> bit4: signal that sleep mode is about to be entered (used by PTM)</code></p>
<p>Bit 4 sets a bit at a RAM address which seems to control the watcdog
timer state, then this bit is immediately unmasked. This field has a
bitmask of 0x0F.</p>
<p>If any of the reset bits is set, the MCU waits for 5ms, then
deasserts RESET1 (via PMIC), RESET2 (PM0.1 = 1 (input)) and FCRAM_RESET
(P3.0 = 1), and reinitializes some other various registers after a 100ms
delay.</p></td>
</tr>
<tr class="odd">
<td><p>0x21</p></td>
<td><p>d</p></td>
<td><p>wo</p></td>
<td><p>Used in legacy mode to signal events for TWL MCU "emulation"
(written to REG[0x5D])? Software then asserts the TWL MCU IRQ pin via <a
href="#LGY_GPIOEMU_MASK" title="wikilink">Legacy I/O registers</a>.</p>
<p><code> bit0: Signal TWL POWER button click</code><br />
<code> bit1: Signal TWL reset</code><br />
<code> bit2: Signal TWL power off</code><br />
<code> bit3: Signal TWL battery low</code><br />
<code> bit4: Signal TWL battery empty</code><br />
<code> bit5: Signal TWL volume button click</code></p></td>
</tr>
<tr class="even">
<td><p>0x22</p></td>
<td><p>d</p></td>
<td><p>wo</p></td>
<td><p>Used to turn on or turn off LCD-related boost circuits. Bits 5:2
can be read back so see whether backlight setting is in progress or not,
however bits 1:0 get cleared as soon as the request gets
acknowledged.</p>
<p><code> bit0: LCD panel voltage off</code><br />
<code> bit1: LCD panel voltage on</code><br />
<code> bit2: Bottom screen backlight off</code><br />
<code> bit3: Bottom screen backlight on</code><br />
<code> bit4: Top screen backlight off</code><br />
<code> bit5: Top screen backlight on</code></p>
<p>Bits 4 and 5 have no effect on a 2DS because the backlight source is
the bottom screen. The rest of the bits are masked away.</p></td>
</tr>
<tr class="odd">
<td><p>0x23</p></td>
<td><p>d</p></td>
<td><p>wo</p></td>
<td><p>Writing 0x72 ('r') resets the MCU, but this is stubbed on
retail?</p></td>
</tr>
<tr class="even">
<td><p>0x24</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>Watchdog timer. This must be set *before* the timer is triggered,
otherwise the old value is used. Value zero disables the
watchdog.</p></td>
</tr>
<tr class="odd">
<td><p>0x25</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>?</p></td>
</tr>
<tr class="even">
<td><p>0x26</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>?</p></td>
</tr>
<tr class="odd">
<td><p>0x27</p></td>
<td><p>sd</p></td>
<td><p>rw</p></td>
<td><p>Raw volume slider state</p></td>
</tr>
<tr class="even">
<td><p>0x28</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>Brightness of the WiFi/Power LED</p></td>
</tr>
<tr class="odd">
<td><p>0x29</p></td>
<td><p>sd(5)</p></td>
<td><p>rw</p></td>
<td><p>Power mode indicator state (read-write)</p>
<p><code> 1 = forced default blue</code><br />
<code> 2 = sleep mode animation</code><br />
<code> 3 = "power off" mode</code><br />
<code> 4 = disable blue power LED and turn on red power LED</code><br />
<code> 5 = disable red power LED and turn on blue power LED</code><br />
<code> 6 = animate blue power LED off and flash red power LED</code><br />
<code> anything else = automatic mode</code></p>
<p>The other 4 bytes (32bits) affect the pattern of the red power LED
(write only)</p></td>
</tr>
<tr class="even">
<td><p>0x2A</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>WiFi LED state, non-0 value turns on the WiFi LED, 4 bits
wide</p></td>
</tr>
<tr class="odd">
<td><p>0x2B</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>Camera LED state, 4bits wide,</p>
<p><code> 0, 3, 6-0xF = off</code><br />
<code> 1 = slowly blinking</code><br />
<code> 2 = constantly on</code><br />
<code> 3 = "TWL" mode</code><br />
<code> 4 = flash once</code><br />
<code> 5 = delay before changing to 2</code></p></td>
</tr>
<tr class="even">
<td><p>0x2C</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>3D LED state, 4 bits wide</p></td>
</tr>
<tr class="odd">
<td><p>0x2D</p></td>
<td><p>0x64</p></td>
<td><p>wo</p></td>
<td><p>This is used for <a href="../MCURTC:SetInfoLEDPattern"
title="wikilink">controlling</a> the notification LED (see <a
href="../MCURTC:SetInfoLEDPatternHeader"
title="wikilink">MCURTC:SetInfoLEDPatternHeader</a> as well), when this
register is written. It's possible to write data here with size less
than 0x64, and only that portion of the pattern data will get
overwritten. Reading from this register only returns zeroes, so it's
considered write-only. Writing past the size of this register seems to
do nothing.</p></td>
</tr>
<tr class="even">
<td><p>0x2E</p></td>
<td><p>s</p></td>
<td><p>ro</p></td>
<td><p>This <a href="../MCURTC:GetInfoLEDStatus"
title="wikilink">returns</a> the notification LED status when read (1
means new cycle started)</p></td>
</tr>
<tr class="odd">
<td><p>0x2F</p></td>
<td><p>s</p></td>
<td><p>wo?</p></td>
<td><p>??? The write function for this register is stubbed.</p></td>
</tr>
<tr class="even">
<td><p>0x30 - 0x36</p></td>
<td><p>ds</p></td>
<td><p>rw</p></td>
<td><p>RTC time (system clock). 7 bytes are read from this. The upper
nibble of each byte encodes 10s (BCD), so each byte is post-processed
with (byte &amp; 0xF) + (10 * (byte &gt;&gt; 4)).</p>
<p><code> byte 0: seconds</code><br />
<code> byte 1: minutes</code><br />
<code> byte 2: hours</code><br />
<code> byte 3: current week (unused)</code><br />
<code> byte 4: days</code><br />
<code> byte 5: months</code><br />
<code> byte 6: years</code></p></td>
</tr>
<tr class="odd">
<td><p>0x37</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>RTC time byte 7: leap year counter / "watch error correction"
register (unused in code)</p></td>
</tr>
<tr class="even">
<td><p>0x38 - 0x3C</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>RTC alarm registers</p>
<p><code> byte 0: minutes</code><br />
<code> byte 1: hours</code><br />
<code> byte 2: day</code><br />
<code> byte 3: month</code><br />
<code> byte 4: year</code></p></td>
</tr>
<tr class="odd">
<td><p>0x3B</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>Could be used on extremely old MCU_FIRM versions to upload <a
href="../MCU_Services#MCU_firmware_versions" title="wikilink">MCU
firmware</a> if reg 0xF == 0 and reg 0x10 == 1 (presumably major and
minor version fields for mcufw 0.1 which largely predates factory
firm).</p></td>
</tr>
<tr class="even">
<td><p>0x3D 0x3E</p></td>
<td><p>ds</p></td>
<td><p>ro</p></td>
<td><p>RTC tick counter / "ITMC" (when resets to 0 the seconds increase)
Only reading 0x3D will update the in-RAM value</p></td>
</tr>
<tr class="odd">
<td><p>0x3F</p></td>
<td><p>d</p></td>
<td><p>wo</p></td>
<td><p>2 bits</p>
<p><code> bit0: Asserts RESET1 (P0.0 = 0, PM0.0 = 0 (output)) but does NOT deassert it (wtf?). This seems to kill the entire SoC: is it because it doesn't deassert it, or does it not deassert it because the SoC hangs anyway? This is the pin that controls some security-critical regs like CFG9_BOOTENV!</code><br />
<code> bit1: turns on a prohibited bit in an RTC Control register and turns P12 into an output</code></p></td>
</tr>
<tr class="even">
<td><p>0x40</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>Tilt sensor sampling mode. Bits 0 and 1 control the mode. If bits
0 or 1 are set then the tilt sensor is enabled and sampled.</p></td>
</tr>
<tr class="odd">
<td><p>0x41</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>Index selector for register 0x44</p></td>
</tr>
<tr class="even">
<td><p>0x42</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>Unused?</p></td>
</tr>
<tr class="odd">
<td><p>0x43</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>Unused???, accelometer related</p></td>
</tr>
<tr class="even">
<td><p>0x44</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>???, pedoometer related(?)</p></td>
</tr>
<tr class="odd">
<td><p>0x45 - 0x4A</p></td>
<td><p>s</p></td>
<td><p>ro</p></td>
<td><p>Tilt sensor 3D rotation from the 12bit ADC, left shifted 4 to fit
in a 16bit signed short, relative to the 3DS bottom screen</p>
<table>
<thead>
<tr class="header">
<th><p>AXIS</p></th>
<th><p>V=0x00</p></th>
<th><p>V=0x40</p></th>
<th><p>V=0xC0</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>X (left/right)</p></td>
<td><p>held up vertically</p></td>
<td><p>rotated left 90° like a steering wheel</p></td>
<td><p>rotated right 90° like a steering wheel</p></td>
</tr>
<tr class="even">
<td><p>Y (forwards/backwards)</p></td>
<td><p>laid flat on the desk with the screen facing up</p></td>
<td><p>held up vertically</p></td>
<td><p>held up vertically with screen facing upside-down</p></td>
</tr>
<tr class="odd">
<td><p>Z (???)</p></td>
<td><p>???</p></td>
<td><p>???</p></td>
<td><p>???</p></td>
</tr>
</tbody>
</table></td>
</tr>
<tr class="even">
<td><p>0x4B</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>PedometerStepCount (for the current day)</p></td>
</tr>
<tr class="odd">
<td><p>0x4C 0x4D</p></td>
<td><p>??</p></td>
<td><p>??</p></td>
<td><p>??</p></td>
</tr>
<tr class="even">
<td><p>0x4E</p></td>
<td><p>d</p></td>
<td><p>rw</p></td>
<td><p>??? this = (0xFFE9E &amp; 1) ? 0x10 : 0</p></td>
</tr>
<tr class="odd">
<td><p>0x4F</p></td>
<td><p>d(6)</p></td>
<td><p>ro</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>0x50</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>???</p></td>
</tr>
<tr class="odd">
<td><p>0x51</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>???</p></td>
</tr>
<tr class="even">
<td><p>0x52 - 0x57</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>?</p></td>
</tr>
<tr class="odd">
<td><p>0x58</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>Register-mapped ADC register DSP volume slider 0% volume offset
(setting this to 0xFF will esentially mute the DSP as it's the volume
slider's maximum raw value)</p></td>
</tr>
<tr class="even">
<td><p>0x59</p></td>
<td><p>s</p></td>
<td><p>rw</p></td>
<td><p>Register-mapped ADC register DSP volume slider 100% volume offset
(setting both this and the above to 0 will disable the volume slider
with 100% volume, setting this to a lower value than the above will make
the volume slider have only 2 states; on and off)</p></td>
</tr>
<tr class="odd">
<td><p>0x5A</p></td>
<td><p>s</p></td>
<td><p>ro/rw</p></td>
<td><p>Invalid, do not use! On newer MCU_FIRM versions this is unused,
but on older MCU_FIRM versions this is a read-only counter.</p></td>
</tr>
<tr class="even">
<td><p>0x5B - 0x5F</p></td>
<td><p>s</p></td>
<td><p>-</p></td>
<td><p>These registers are out of bounds (0xFFC00 and up), they don't
exist, writing is no-op, reading will yield FFs.</p></td>
</tr>
<tr class="odd">
<td><p>0x60</p></td>
<td><p>d</p></td>
<td><p>rw</p></td>
<td><p>Free register bank address (index) select Selects the index to
read from in the free register bank, up to 200. Used in conjunction with
reg 0x61.</p>
<p><code> byte 0: bit0 = "WirelessDisabled", bit1 = "SoftwareClosed", bit2 = "PowerOffInitiated", bit3 = "LgyNativeResolution", bit4 = "LegacyJumpProhibited"</code><br />
<code> byte 1: Legacy LCD data</code><br />
<code> bytes 2 and 3: Local Friend Code counter</code><br />
<code> bytes 4 and 5: UUID clock sequence</code><br />
<code> bytes 6 and 7: Unused</code><br />
<code> bytes 8 to 175: Playtime data for legacy titles</code><br />
<code> bytes 176 to 188: Temporary playtime data in case console doesn't shut down gracefully, updated every 5 minutes</code><br />
<code> bytes 188 to 199: Unused</code></p></td>
</tr>
<tr class="even">
<td><p>0x61</p></td>
<td><p>d(200)</p></td>
<td><p>rw</p></td>
<td><p>Free register bank, data is read from/written to here.</p>
<p>Accessing N bytes of this register increments the selected index by
N.</p></td>
</tr>
<tr class="odd">
<td><p>0x62 - 0x7E</p></td>
<td><p>s</p></td>
<td><p>-</p></td>
<td><p>These registers don't exist, writing is no-op, reading will yield
FFs.</p></td>
</tr>
<tr class="even">
<td><p>0x7F</p></td>
<td><p>d(9-0x13)</p></td>
<td><p>ro</p></td>
<td><p>Various system state information (debug pointer table)</p>
<p><code> byte 0x00: Console type, see </code><a
href="../Configuration_Memory#MCU_HW_INFO"
title="wikilink"><code>here</code></a><br />
<code> byte 0x01: PMIC vendor code</code><br />
<code> byte 0x02: Battery vendor code (determined from battery middle pin)</code><br />
<code>   0x00: Maxell (middle pin tied to GND)</code><br />
<code>     CTR-003 CTR-A-BP (old3DS)</code><br />
<code>     CTR-003 CTR-A-BPMX-C3 (2DS): Wuxi Hitachi Maxell Co.,Ltd.</code><br />
<code>     CTR-003 CTR-A-BPMX-C5 (Switch Pro Controller): Wuxi Maxell Co., Ltd.</code><br />
<code>     SPR-003 SPR-A-BPMX-C3 (new3DSXL): Wuxi Hitachi Maxell Co.,Ltd.</code><br />
<code> byte 0x03: MGIC version (major?)</code><br />
<code> byte 0x04: MGIC version (minor?)</code><br />
<code> byte 0x05: RCOMP(?)</code><br />
<code> byte 0x06: On-board battery slot NTC reading (more heat causes this value to go *down*, and cooling off will make this value go back up)</code><br />
<code> byte 0x09: system model (see </code><a
href="../Cfg:GetSystemModel#System_Model_Values"
title="wikilink"><code>Cfg:GetSystemModel</code></a><code> for values)</code><br />
<code> byte 0x0A: Red Power LED mode (0 = off, 1 = on)</code><br />
<code> byte 0x0B: Blue Power LED intensity  (0x00 - 0xFF)</code><br />
<code> byte 0x0D: RGB LED red intensity</code><br />
<code> byte 0x0E: RGB LED green intensity</code><br />
<code> byte 0x0F: RGB LED blue intensity</code><br />
<code> byte 0x11: WiFi LED brightness</code><br />
<code> byte 0x12: raw button states?</code><br />
<code>   bit0: unset while Power button is held</code><br />
<code>   bit1: unset while HOME button is held</code><br />
<code>   bit2: unset while WiFi slider is held</code><br />
<code>   bit5: unset while the charging LED is active</code><br />
<code>   bit6: unset while charger is plugged in</code></p>
<p>On MCU_FIRM major version 1 the size of this is 9, reading past the
9th byte will yield AA instead of FF.</p></td>
</tr>
<tr class="odd">
<td><p>0x80 - 0xFF</p></td>
<td><p>s</p></td>
<td><p>-</p></td>
<td><p>These registers don't exist, writing is no-op, reading will yield
FFs.</p></td>
</tr>
</tbody>
</table>

Shared register: the letter "s" means that the given register is in a
"shared register pool", meaning the resgister is in the register pool in
RAM at address `0xFFBA4 + registernumber`.

Dynamic register: these registers aren't in the shared pool, they just
"pretend" to be there. These registers often don't retain their set
value, change rapidly, or control various hardware.

Non-shared (dynamic) register: it's a register whose contents separate
from the shared register pool. Messing with these registers will not
affect the shared register pool at all.

On old versions of MCU_FIRM none of the invalid registers are masked
away by the read handler function, but are still read-only. Newer
MCU_FIRM versions return the hardcoded value FF instead.

## Device 5 & 6

These are the chip-on-glass display controllers, also known as I2CLCD.

### Shared registers

These registers are the same across all known I2CLCD controllers (except
Controller ID 0x00).

<table>
<thead>
<tr class="header">
<th><p>Register</p></th>
<th><p>Name</p></th>
<th><p>Valid bits</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x01</p></td>
<td><p>Display enable</p></td>
<td><p>0x11</p></td>
<td><p>Values:</p>
<p><code> - 0x00 - screen off, slow burn-in</code><br />
<code> - 0x01 - screen off, fast burn-in</code><br />
<code> - 0x10 - screen on, color input used</code><br />
<code> - 0x11 - screen on, color input not used, High-Z (display turns black or white depending on interface config)</code></p></td>
</tr>
<tr class="even">
<td><p>0x40</p></td>
<td><p>Read address</p></td>
<td></td>
<td><p>Write to this register to set the read address.</p>
<p>Reading from I2CLCD is non-standard. When you read, it returns pairs
of the currently read address, and then the data byte at that address.
The read address auto-increments.</p></td>
</tr>
<tr class="odd">
<td><p>0x54</p></td>
<td><p>Checksum? trigger</p></td>
<td><p>0x01</p></td>
<td><p>When transitioning bit0 from 0 to 1, it seems to trigger some
sort of checksum calcuation. Broken on controller 0x01, where it's
oneshot.</p></td>
</tr>
<tr class="even">
<td><p>0x55</p></td>
<td><p>???</p></td>
<td><p>0x03 (all) / 0x07 (2DS)</p></td>
<td><p>Unknown. When toggling 0x54 bit0 from 0 to 1, this register gets
changed to 0x01 (all) / 0x05 (2DS).</p>
<p>This register is sometimes seen with a value of 0x02 at
initialization time on the top screen.</p></td>
</tr>
<tr class="odd">
<td><p>0x56</p></td>
<td><p>Checksum?</p></td>
<td></td>
<td><p>Unknown. Read-writable with no effect (old3DS) / read-only
(all).</p>
<p>A random value is written here when 0x54 bit0 is changed from 0 to 1.
Constantly updates with a seemingly random value, except on Controller
ID 0x01, where it's oneshot/bugged.</p></td>
</tr>
<tr class="even">
<td><p>0x60</p></td>
<td><p>???</p></td>
<td><p>0x01</p></td>
<td><p>Unknown. 0x00 is written here during init. Seems to have no
effect.</p></td>
</tr>
<tr class="odd">
<td><p>0x61</p></td>
<td><p>Register checksum</p></td>
<td></td>
<td><p>Some - but not all - register values are combined using an
unknown algorithm into this register. It's unknown which registers
influence this value, as some registers which influence this value are
read-only.</p></td>
</tr>
<tr class="even">
<td><p>0x62</p></td>
<td><p>???</p></td>
<td><p>0x01</p></td>
<td><p>Unknown, does nothing on known controllers. During init, gsp
waits for this to become 0x01.</p></td>
</tr>
<tr class="odd">
<td><p>0xFE</p></td>
<td><p>???</p></td>
<td></td>
<td><p>Unknown, does nothing. 0xAA is written here during init.</p></td>
</tr>
<tr class="even">
<td><p>0xFF</p></td>
<td><p>Controller ID</p></td>
<td></td>
<td><p>Upper 4bits is manufacturer. Lower 4bits is unknown, most likely
revision, possibly encoded as a Johnson counter. The fields are encoded
this way, most likely for the register checksum feature.</p>
<p>Manufacturers:</p>
<p><code> - 0x0 - SHARP (LTPS(?) TN), old I2CLCD, found in old3DS (non-XL) only</code><br />
<code> - 0x1 - JDI (LTPS IPS), found in select new3DS and new3DSXL consoles</code><br />
<code> - 0xC - SHARP (LTPS(?) TN), new I2CLCD</code><br />
<code> - 0xE - SHARP (TFT), found in 2DS only</code></p>
<p>Known IDs:</p>
<p><code> - 0xC7 - new3DS, new3DSXL, new2DSXL, and some select newer old3DSXL</code><br />
<code> - 0xC3 - older old3DSXL</code><br />
<code> - 0xE1 - 2DS</code><br />
<code>   - LQ050B1LW10B</code><br />
<code>     - LQ = normal TFT</code><br />
<code>     - 050 = panel 5 inches diagonal</code><br />
<code>     - B = "other" display format</code><br />
<code>     - 1 = transmissive (backlight-compatible)</code><br />
<code>     - L = LVDS</code><br />
<code>     - W = *unknown coating type*</code><br />
<code>     - 10 = model number</code><br />
<code>     - B = *unknown suffix*</code><br />
<code> - 0x10 - some select new3DS and new3DSXL with IPS screens</code><br />
<code> - 0x01 - old3DS</code><br />
<code>   - LS035T7LE38P (top screen)</code><br />
<code>     - LS = TFT (LTPS or SI-TFT ?)</code><br />
<code>     - 035 = panel 3.5 inches diagonal</code><br />
<code>     - T = "other 16:9" (even though the panel is 16:10 in physical size, or 32:10 in terms of pixel count)</code><br />
<code>     - 7 = *unknown backing type*</code><br />
<code>     - L = LVDS</code><br />
<code>     - E = *unknown coating type*</code><br />
<code>     - 38 = model number</code><br />
<code>     - P = *unknow suffix*</code><br />
<code>   - LS030Q7DW48P (bottom screen)</code><br />
<code>     - LS = TFT (LTPS or SI-TFT ?)</code><br />
<code>     - 030 = panel 3 inches diagonal</code><br />
<code>     - Q = QVGA (320x240)</code><br />
<code>     - 7 = *unknown backing type*</code><br />
<code>     - D = parallel RGB (unspecified, but it's known to be RGB888 for this display)</code><br />
<code>     - W = *unknown coating type*</code><br />
<code>     - 48 = model number</code><br />
<code>     - P = *unknow suffix*</code><br />
<code> - 0x00 - no controller, or dead (I2CLCD always ACKs reads, but returns 00 if dead)</code></p></td>
</tr>
</tbody>
</table>

### Custom registers for controller 0x00

This Controller ID is fully unknown, and the only reason we know about
its existance is due to gsp having special handling code for it.

| Register | Name | Valid bits | Description                        |
|----------|------|------------|------------------------------------|
| 0x11     | ???  |            | Unknown. Write 0x10 to initialize. |
| 0x50     | ???  |            | Unknown. Write 0x01 to initialize. |

### Custom registers for controller 0x01

<table>
<thead>
<tr class="header">
<th><p>Register</p></th>
<th><p>Name</p></th>
<th><p>Valid bits</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x10</p></td>
<td><p>Interface config</p></td>
<td><p>0xF7</p></td>
<td><p>Regonfigures the input pins and pin behavior of the
controller.</p>
<p><code>bit0 - color value invert (D = ~D, or D = 255 - D)</code><br />
<code>bit1 - color format remap (D7:D2 &lt;-- D5:D0, that is left shift color data by 2)</code><br />
<code>bit2 - ???</code><br />
<code>bit4 - ???</code><br />
<code>bit5 - ???</code><br />
<code>bit6 - ???</code><br />
<code>bit7 - DS-style undriven screen (it will be white instead of black, see shared register 0x01)</code></p></td>
</tr>
<tr class="even">
<td><p>0x11</p></td>
<td><p>Image config</p></td>
<td><p>0x7F</p></td>
<td><p>Image filters and pixel clock control.</p>
<p><code>bit0 - Horizontal Flip (scan from right to left)</code><br />
<code>bit1 - red-blue swap</code><br />
<code>bit2 - ???</code><br />
<code>bit3 - ???</code><br />
<code>bit4 - ???</code><br />
<code>bit5 - ???</code><br />
<code>bit6 - ???</code></p></td>
</tr>
<tr class="odd">
<td><p>0x1D</p></td>
<td><p>???</p></td>
<td><p>0x0F</p></td>
<td><p>Unknown, bit0 enables registers 0x12 to 0x19 to control some
analog timing controls to the display panel itself.</p></td>
</tr>
<tr class="even">
<td><p>0x50</p></td>
<td><p>???</p></td>
<td><p>0x11</p></td>
<td><p>Unknown. Has no effect on bottom screen. On the top screen, bit4
blanks out the display (LVDS disable?).</p></td>
</tr>
<tr class="odd">
<td><p>0x53</p></td>
<td><p>???</p></td>
<td><p>0x73</p></td>
<td><p>Unknown. While other bits seem to have no effect, bit0 kills the
controller until a power cycle.</p></td>
</tr>
</tbody>
</table>

### Custom registers for controller 0xC3

Basically the same as Controller ID 0xC7.

### Custom registers for controller 0xC7

This is the most common non-old3DS display controller. Quite
overclockable.

Note: on the 0xC7 controller unlocking the factory controls at register
0x03 glitches out most of the standard controls (like registers 0x50 to
0x56), so use with caution.

| Register | Name          | Valid bits | Description                                                 |
|----------|---------------|------------|-------------------------------------------------------------|
| 0x03     | Factory key 2 |            | Write 0xAA here to unlock a second set of factory controls. |
| 0xAF     | Factory key   |            | Write 0xAA here to unlock factory controls.                 |

Factory mode registers for unlock register 0x03:

<table>
<thead>
<tr class="header">
<th><p>Register</p></th>
<th><p>Name</p></th>
<th><p>Valid bits</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x10</p></td>
<td><p>Image control?</p></td>
<td><p>0xD7</p></td>
<td><p>Most bits are unknown.</p>
<p><code>bit0 - color invert</code><br />
<code>bit1 - slight gamma increase</code></p></td>
</tr>
<tr class="even">
<td><p>0x11</p></td>
<td><p>Image transform?</p></td>
<td><p>0x7F</p></td>
<td><p>Mostly unknown.</p>
<p><code>bit0 - Invert horizontal scan direction (0 = left to right, 1 = right to left)</code><br />
<code>bit1 - red-blue swap</code><br />
<code>bit2 - Invert vertical scan direction (0 = top to bottom, 1 = bottom to top)</code><br />
<code>bit3 - Invert the order of each scanline pair (might be needed if bit2 is toggled)</code><br />
<code>bit4 - Enable interlaced signal (use bit3 to swap fields)</code><br />
<code>bit5 - ???</code><br />
<code>bit6 - ???</code></p></td>
</tr>
<tr class="odd">
<td><p>0x70-0x83</p></td>
<td><p>Color curve red</p></td>
<td rowspan="3"></td>
<td rowspan="3"><p>These registers are used for fine-tuning the analog
driving curve of the screen</p>
<p>Positive:</p>
<p><code>- byte 00 (0xFF) - ???</code><br />
<code>- byte 01 (0xFF) - ???</code><br />
<code>- byte 02 (0x3F) - ???</code><br />
<code>- byte 03 (0x3F) - ???</code><br />
<code>- byte 04 (0x3F) - ???</code><br />
<code>- byte 05 (0x3F) - ???</code><br />
<code>- byte 06 (0x3F) - ???</code><br />
<code>- byte 07 (0x3F) - ???</code><br />
<code>- byte 08 (0x3F) - ???</code><br />
<code>- byte 09 (0x3F) - ???</code><br />
</p>
<p>Negative:</p>
<p><code>- byte 10 (0xFF) - ???</code><br />
<code>- byte 11 (0xFF) - ???</code><br />
<code>- byte 12 (0x3F) - ???</code><br />
<code>- byte 13 (0x3F) - ???</code><br />
<code>- byte 14 (0x3F) - ???</code><br />
<code>- byte 15 (0x3F) - ???</code><br />
<code>- byte 16 (0x3F) - ???</code><br />
<code>- byte 17 (0x3F) - ???</code><br />
<code>- byte 18 (0x3F) - ???</code><br />
<code>- byte 19 (0x3F) - ???</code></p></td>
</tr>
<tr class="even">
<td><p>0x84-0x97</p></td>
<td><p>Color curve green</p></td>
</tr>
<tr class="odd">
<td><p>0x98-0xAB</p></td>
<td><p>Color curve blue</p></td>
</tr>
</tbody>
</table>

### Custom registers for controller 0xE1

This controller is designed to drive a split panel. As such, the factory
controls have been slightly altered to accomodate this.

This is the only I2CLCD which responds on both I2CLCD addresses. The
dominant screen is the bottom one.

Most registers are similar to controller 0xC7, but there are some
differences due to the split shared panel nature.

| Register | Name          | Valid bits | Description                                              |
|----------|---------------|------------|----------------------------------------------------------|
| 0x03     | Factory key 2 |            | Write 0xAA here to unlock a 2nd set of factory controls. |
| 0xAF     | Factory key   |            | Write 0xAA here to unlock factory controls.              |

Factory mode registers for unlock register 0x03:

<table>
<thead>
<tr class="header">
<th><p>Register</p></th>
<th><p>Name</p></th>
<th><p>Valid bits</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x10</p></td>
<td><p>Image control?</p></td>
<td><p>0xD7</p></td>
<td><p>Most bits are unknown. This applies to the whole display
panel.</p>
<p><code>bit0 - color invert</code><br />
<code>bit1 - slight gamma increase</code></p></td>
</tr>
<tr class="even">
<td><p>0x11</p></td>
<td><p>Image transform</p></td>
<td><p>0x33</p></td>
<td><p><code>bit0 - top half horizontal flip</code><br />
<code>bit1 - top half red-blue swap</code><br />
<code>bit4 - bottom half horizontal flip</code><br />
<code>bit5 - bottom half red-blue swap</code></p></td>
</tr>
<tr class="odd">
<td><p>0x70-0x83</p></td>
<td><p>Analog curve top</p></td>
<td rowspan="2"></td>
<td rowspan="2"><p>Consists of two unknown curve values. Seems to be
nonstandard.</p>
<p>Pair 1:</p>
<p><code>byte 00 (0xFF) - ???</code><br />
<code>byte 01 (0xFF) - ???</code><br />
<code>byte 02 (0xFF) - ???</code><br />
<code>byte 03 (0xFF) - ???</code><br />
<code>byte 04 (0x3F) - ???</code><br />
<code>byte 05 (0x3F) - ???</code><br />
<code>byte 06 (0x3F) - ???</code><br />
<code>byte 07 (0x3F) - ???</code><br />
<code>byte 08 (0x3F) - ???</code><br />
<code>byte 09 (0x3F) - ???</code></p>
<p>Part 2:</p>
<p><code>byte 10 (0xFF) - ???</code><br />
<code>byte 11 (0xFF) - ???</code><br />
<code>byte 12 (0xFF) - ???</code><br />
<code>byte 13 (0xFF) - ???</code><br />
<code>byte 14 (0x3F) - ???</code><br />
<code>byte 15 (0x3F) - ???</code><br />
<code>byte 16 (0x3F) - ???</code><br />
<code>byte 17 (0x3F) - ???</code><br />
<code>byte 18 (0x3F) - ???</code><br />
<code>byte 19 (0x3F) - ???</code></p></td>
</tr>
<tr class="even">
<td><p>0x84-0x97</p></td>
<td><p>Analog curve bottom</p></td>
</tr>
</tbody>
</table>

### Custom registers for controller 0x10

JDI IPS controller.

Warning: on the JDI controller, unlocking any of the factory mode
registers overshadows some other registers, so don't write to "standard"
locations (other than register 0x40) before locking factory mode back!

| Register | Name          | Valid bits | Description                                            |
|----------|---------------|------------|--------------------------------------------------------|
| 0x03     | Factory key 2 |            | Write 0xAA here to unlock advanced IPS curve controls. |
| 0xAF     | Factory key   |            | Write 0xAA here to unlock factory controls.            |

Factory mode registers unlocked by register 0xAF:

- 0x41 - 0x4F
- 0x58 - 0x5F
- 0x67 - 0x6F
- 0xD0 - 0xEF
- unknown...

Factory mode registers unlocked by register 0x03:

- 0x04 - 0x0F
- unknown...

| Register  | Name              | Valid bits | Description |
|-----------|-------------------|------------|-------------|
| 0x70-0x7F | Driving curve 1-1 |            |             |
| 0x80-0x8F | Driving curve 1-2 |            |             |
| 0x90-0x9F | Driving curve 2-1 |            |             |
| 0xA0-0xAF | Driving curve 2-2 |            |             |
| 0xB0-0xBF | Driving curve 3-1 |            |             |
| 0xC0-0xCF | Driving curve 3-2 |            |             |

## Device 10

See the datasheet linked to on the [Hardware](Hardware "wikilink") page
for reference.

## Device 11

See the datasheet linked to on the [Hardware](Hardware "wikilink") page
for reference.

## Device 12

| REGISTER | WIDTH | DESCRIPTION     |
|----------|-------|-----------------|
| 0x0      | 21    | DebugPad state. |

This is a [Wii Classic Controller
Pro](https://wiibrew.org/wiki/Wiimote/Extension_Controllers/Classic_Controller_Pro)
which was slightly modified to have an encrypted device type of 0xF0
[instead of
0xFD](https://wiibrew.org/wiki/Wiimote/Extension_Controllers#The_New_Way).

See [here](HID_Shared_Memory#Offset_0x238 "wikilink") for the HID shared
memory report format.

## Device 13

| Raw I2C register address | Internal register address | Width | Description                        |
|--------------------------|---------------------------|-------|------------------------------------|
| 0x0                      | 0x0                       | 0x40  | RHR / THR (data receive/send FIFO) |
| 0x8                      | 0x1                       | 0x1   | IER                                |
| 0x10                     | 0x2                       | 0x1   | FCR/IIR                            |
| 0x18                     | 0x3                       | 0x1   | LCR                                |
| 0x20                     | 0x4                       | 0x1   | MCR                                |
| 0x28                     | 0x5                       | 0x1   | LSR                                |
| 0x30                     | 0x6                       | 0x1   | MSR/TCR                            |
| 0x38                     | 0x7                       | 0x1   | SPR/TLR                            |
| 0x40                     | 0x8                       | 0x1   | TXLVL                              |
| 0x48                     | 0x9                       | 0x1   | RXLVL                              |
| 0x50                     | 0xA                       | 0x1   | IODir                              |
| 0x58                     | 0xB                       | 0x1   | IOState                            |
| 0x60                     | 0xC                       | 0x1   | IoIntEna                           |
| 0x68                     | 0xD                       | 0x1   | reserved                           |
| 0x70                     | 0xE                       | 0x1   | IOControl                          |
| 0x78                     | 0xF                       | 0x1   | EFCR                               |

See the
[datasheet](http://www.alldatasheet.net/datasheet-pdf/pdf/347838/NXP/SC16IS750IBS.html)
linked to on the [Hardware](Hardware "wikilink") page for reference.
From that datasheet, for the structure of the I2C register address u8:
"Bit 0 is not used, bits 2:1 select the channel, bits 6:3 select one of
the UART internal registers. Bit 7 is not used with the I2C-bus
interface, but it is used by the SPI interface to indicate a read or a
write operation."

## Device 14

Used by [Cfg](Config_Services "wikilink")-sysmodule via the i2c::EEP
service. This is presumably EEPROM going by the service name.

The Cfg-module code which loads the
[CCAL](Flash_Filesystem "wikilink")(nandro:/sys/{HWCAL0.dat/HWCAL1.dat})
file from NAND will load it from I2C instead, if a certain state flag is
non-zero. Likewise for the function which writes CCAL to NAND. HMAC/hash
verification after loading is skipped when the CCAL was loaded from I2C.

## Device 15

This the New3DS [NFC](NFC_Services "wikilink") controller "I2C"
interface. This device is accessed via the WriteDeviceRaw/ReadDeviceRaw
I2C service [commands](I2C_Services "wikilink").

Since the \*Raw commands are used with this, this device has no I2C
registers. Instead, raw data is transfered after the I2C device is
selected. Hence, WriteDeviceRaw is used for sending commands to the
controller, while ReadDeviceRaw is for receiving responses from the
controller. Certain commands may return multiple command responses.

Command request / response structure:

| Offset | Size | Description                   |
|--------|------|-------------------------------|
| 0x0    | 0x1  | Normally 0x10?                |
| 0x1    | 0x1  | Command source / destination. |
| 0x2    | 0x1  | CmdID                         |
| 0x3    | 0x1  | Payload size.                 |

Following the above header is the payload data(when payload size is
non-zero), with the size specified in the header. The command response
payload is usually at least 1-byte, where that byte appears to be
normally 0x0. For command requests the payload data is the command
parameters.

For command requests sent to the NFC tag itself, Cmd\[1\]=0x0 and
CmdID=0x0. The command request payload data here is the actual command
request data for the NFC tag, starting with the CmdID u8 at payload+0.

During NFC module startup, a certain command is sent to the controller
which eventually(after various cmd-reply headers etc) returns the
following the payload after the first byte in the payload:

`000000: 44 65 63 20 32 32 20 32 30 31 32 31 34 3a 35 33  Dec 22 201214:53 `
`000010: 3a 35 30 01 05 0d 46 05 1b 79 20 07 32 30 37 39  :50...F..y .2079`
`000020: 31 42 35                                         1B5`

Or that is: "Dec 22 201214:53:50<binary>20791B5". Therefore, this
appears to return the part-number of the NFC controller(other command
request(s) / response(s) use this part-number value too).

### NFC controller commands

| CmdRequest\[1\] | CmdID | Payload data for parameters                 | Description                                                                                                                                                |
|-----------------|-------|---------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x2E            | 0x2F  | Firmware image for this chunk, size varies. | This is used during NFC module startup to upload the firmware image to the NFC controller. This is used repeatedly to upload multiple chunks of the image. |

## Device 17

(Stub)

Used by New 3DS for ZL, ZR, C stick

This device do not use registers. After writing the address, read the
next several bytes.

| Offset | Description                  |
|--------|------------------------------|
| 0x0    | Fixed 0x80                   |
| 0x1    | Buttons (ZL = 0x4, ZR = 0x2) |