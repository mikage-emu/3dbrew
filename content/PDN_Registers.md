+++
title = 'PDN Registers'
+++

# Register table

| Old3DS | Name                                                         | Address    | Width | Used by                                                                                 |
|--------|--------------------------------------------------------------|------------|-------|-----------------------------------------------------------------------------------------|
| Yes    | [PDN_SLEEP_CNT](#pdn_sleep_cnt "wikilink")                   | 0x10141000 | 2     | Kernel11                                                                                |
| Yes    | [PDN_WAKE_ENABLE](#pdn_wake_enable "wikilink")               | 0x10141008 | 4     | [ptm services](ptm_services "wikilink"), [pdn services](pdn_services "wikilink")        |
| Yes    | [PDN_WAKE_REASON](#pdn_wake_reason "wikilink")               | 0x1014100c | 4     | [ptm services](ptm_services "wikilink"), twlbg, [pdn services](pdn_services "wikilink") |
| Yes    | [LGY_MODE](#lgy_mode "wikilink")                             | 0x10141100 | 2     | TwlProcess9, TwlBg                                                                      |
| Yes    | [LGY_SLEEP_CNT](#lgy_sleep_cnt "wikilink")                   | 0x10141104 | 2     | TwlBg                                                                                   |
| Yes    | [LGY_IRQ_ENABLE](#lgy_irq_enable "wikilink")                 | 0x10141108 | 2     | TwlBg                                                                                   |
| Yes    | [LGY_PAD_CNT](#lgy_pad_cnt "wikilink")                       | 0x1014110A | 2     | TwlBg                                                                                   |
| Yes    | [LGY_HIDEMU_MASK](#lgy_hidemu_mask "wikilink")               | 0x10141110 | 2     | TwlBg                                                                                   |
| Yes    | [LGY_HIDEMU_PAD](#lgy_hidemu_pad "wikilink")                 | 0x10141112 | 2     | TwlBg                                                                                   |
| Yes    | [LGY_GPIOEMU_MASK](#lgy_gpioemu_mask "wikilink")             | 0x10141114 | 2     | [codec services](codec_services "wikilink"), TwlBg                                      |
| Yes    | [LGY_GPIOEMU_DATA](#lgy_gpioemu_data "wikilink")             | 0x10141116 | 2     | [codec services](codec_services "wikilink"), TwlBg                                      |
| Yes    | [LGY_CARDDETECTEMU_MASK](#lgy_carddetectemu_mask "wikilink") | 0x10141118 | 1     | TwlBg                                                                                   |
| Yes    | [LGY_CARDDETECTEMU_DATA](#lgy_carddetectemu_data "wikilink") | 0x10141119 | 1     | TwlBg                                                                                   |
| Yes    | LGY_?                                                       | 0x10141120 | 1     | TwlBg                                                                                   |
|        |                                                              |            |       |                                                                                         |
| Yes    | [PDN_GPU_CNT](#pdn_gpu_cnt "wikilink")                       | 0x10141200 | 4     | boot11, kernel11, [pdn services](pdn_services "wikilink"), TwlBg                        |
| Yes    | [PDN_VRAM_CNT](#pdn_vram_cnt "wikilink")                     | 0x10141204 | 1     | Boot11, Kernel11, TwlBg                                                                 |
| Yes    | [PDN_LCD_CNT](#pdn_lcd_cnt "wikilink")                       | 0x10141208 | 1     | Boot11                                                                                  |
| Yes    | [PDN_FCRAM_CNT](#pdn_fcram_cnt "wikilink")                   | 0x10141210 | 2     | Kernel11, TwlBg                                                                         |
| Yes    | [PDN_I2S_CNT](#pdn_i2s_cnt "wikilink")                       | 0x10141220 | 1     | boot11, twlbg, [pdn services](pdn_services "wikilink")                                  |
| Yes    | [PDN_CAMERA_CNT](#pdn_camera_cnt "wikilink")                 | 0x10141224 | 1     | [pdn services](pdn_services "wikilink")                                                 |
| Yes    | [PDN_DSP_CNT](#pdn_dsp_cnt "wikilink")                       | 0x10141230 | 1     | process9, [pdn services](pdn_services "wikilink")                                       |
| No     | [PDN_MVD_CNT](#pdn_mvd_cnt "wikilink")                       | 0x10141240 | 1     |                                                                                         |
| No     | [PDN_LGR_SOCMODE](#pdn_lgr_socmode "wikilink")               | 0x10141300 | 2     | NewKernel11                                                                             |
| No     | [PDN_LGR_CNT](#pdn_lgr_cnt "wikilink")                       | 0x10141304 | 2     | NewKernel11                                                                             |
| No     | [PDN_LGR_CPU_CNT](#pdn_lgr_cpu_cnt0-3 "wikilink")\<0-3\>   | 0x10141310 | 1\*4  | NewKernel11                                                                             |

# Sleep registers

## PDN_SLEEP_CNT

| Bits | Description              |
|------|--------------------------|
| 0    | 1 = Enter sleep mode     |
| 2-14 | Unused.                  |
| 15   | 1 = VRAM is powered down |

Kernel11 powers down VRAM (it's unclear whether bit15 is power-down or
self-refresh mode) by first disabling the 8 banks using [GX register
0x10400030](GPU/External_Registers#map "wikilink"), then by disabling
the GPU clock using [PDN_GPU_CNT](#pdn_gpu_cnt "wikilink") bit 16 and
finally writes to and polls this register.

## PDN_WAKE_ENABLE

| Bits | Description                                         |
|------|-----------------------------------------------------|
| 1    | [HID_PAD_CNT](HID_Registers#hid_pad_cnt "wikilink") |
| 3    | Shell opened                                        |
| 4    | Headphones not plugged in                           |
| 8    | WiFi (?)                                            |
| 19   | Shell GPIO (?)                                      |
| 26   | [MCU interrupt](I2C_Registers#device_3 "wikilink")  |
| 30   | Touch screen pressed                                |
| 31   | CTR gamecard inserted/removed                       |
|      |                                                     |

List in progress.

This is a OR list of wake triggers that will wake up the console from
sleep and raise IRQ 0x58.

## PDN_WAKE_REASON

Same layout as [PDN_WAKE_ENABLE](#pdn_wake_enable "wikilink").

This is a OR list of the wake triggers that actually woke up the
console.

For each bit, write 1 to acknowledge, and 0 to clear (?).

# Legacy registers

## LGY_MODE

| Bits | Description                                  |
|------|----------------------------------------------|
| 0-1  | Read only legacy mode set on reg 0x10018000. |
| 2-14 | Unused.                                      |
| 15   | 1 = enable legacy mode.                      |

To boot into DSi or GBA mode first set register 0x10018000 to the
desired mode and setup LgyFb. Then disable FCRAM by clearing bit 0 in
reg 0x10201000, writing 0 to PDN_FCRAM_CNT followed by 1 and waiting for
bit 2 to clear.

The very last 3DS-mode register poke the [TWL_FIRM](FIRM "wikilink")
Process9 does before it gets switched into TWL-mode, is writing 0x8000
to this register. Before writing this register, TWL Process9 waits for
ARM7 to change the value of this register. The Process9 code for this
runs from ITCM, since switching into TWL-mode includes remapping all
ARM9 physical memory.

## LGY_SLEEP_CNT

| Bits | Description                                                     |
|------|-----------------------------------------------------------------|
| 0    | Write 1 to wakeup GBA mode.                                     |
| 1    | Sleep state/ack. 1 when GBA mode entered sleep. Write 1 to ack. |
| 2    | ?                                                               |
| 3-14 | Unused.                                                         |
| 15   | 1 = IRQ enable (IRQ 0x59)                                       |

When a GBA game enters sleep mode and bit 15 is 1, IRQ 0x59 fires and
bit 1 is set. Bit 1 must be acknowledged/written together with bit 0
otherwise GBA mode wakes up from sleep early sometimes.

## LGY_IRQ_ENABLE

[Arm11 interrupt](ARM11_Interrupts "wikilink") enable bits for legacy
interrupts, same bit layout as the GPIOEMU regs below.

## LGY_PAD_CNT

Also named "KEYCNT" on certain other DS(i)/GBA documentations. The value
of this register is copied to [HID_PAD_CNT](HID_Registers "wikilink")
when GBA mode enters sleep.

## LGY_HIDEMU_MASK

Set bits will use the corresponding values from
[LGY_HIDEMU_PAD](#lgy_hidemu_pad "wikilink") instead of allowing the
hardware to read it from [HID_PAD](HID_Registers#hid_pad "wikilink").

This is set to 0x1FFF (all buttons and the debug key) and
[LGY_HIDEMU_PAD](#lgy_hidemu_pad "wikilink") is set to 0 when the "Close
this software and return to HOME Menu?" dialog is shown to prevent the
button presses from propagating to the DS/GBA CPU.

## LGY_HIDEMU_PAD

Works the same way as [HID_PAD](HID_Registers#hid_pad "wikilink"), but
the values set here are only replaced in the HID_PAD seen by the DS/GBA
CPU when the corresponding bits in
[LGY_HIDEMU_MASK](#lgy_hidemu_mask "wikilink") are set.

## LGY_GPIOEMU_MASK

Set bits will read bits from
[LGY_GPIOEMU_DATA](#lgy_gpioemu_data "wikilink") (override).

This is used to trigger things like the TWL MCU interrupt in TWL mode.

## LGY_GPIOEMU_DATA

See above

## LGY_CARDDETECTEMU_MASK

Set bits will read bits from
[LGY_CARDDETECTEMU_DATA](#lgy_carddetectemu_data "wikilink") (override).

Bit0 signals cartridge removal.

## LGY_CARDDETECTEMU_DATA

See above

# Clock and reset registers

## PDN_GPU_CNT

| Bits | Description                                            |
|------|--------------------------------------------------------|
| 0    | GPU main block + VRAM + LCD reset. 0 = reset.          |
| 1    | PSC block reset? 0 = reset.                            |
| 2    | Geoshader block reset? 0 = reset.                      |
| 3    | Rasterization block reset? 0 = reset.                  |
| 4    | PPF block reset. 0 = reset.                            |
| 5    | PDC block reset? 0 = reset.                            |
| 6    | PDC related reset. 0 = reset.                          |
| 7-15 | Unused.                                                |
| 16   | Clock enable for all blocks, VRAM and LCD. 1 = enable. |

PDN uses a 12 ARM11 cycle delay to deassert reset.

## PDN_VRAM_CNT

| Bits | Description                    |
|------|--------------------------------|
| 0    | Clock. 1 = enable, 0 = disable |

This register seems to be unimplemented in released models: while it is
used in tandem with PDN_GPU_CNT.bit16 in Boot11 screeninit code,
Kernel11 only uses PDN_GPU_CNT.bit16 to power-off VRAM before going to
sleep.

## PDN_LCD_CNT

| Bits | Description                    |
|------|--------------------------------|
| 0    | Clock. 1 = enable, 0 = disable |

This register seems to be unimplemented in released models, only to be
used in Boot11, as PDN_GPU_CNT.bit16 also drives the LCD clock.

## PDN_FCRAM_CNT

| Bits | Description                                                       |
|------|-------------------------------------------------------------------|
| 0    | Reset. 0 = reset.                                                 |
| 1    | Clock. 1 = enable, 0 = disable                                    |
| 2    | Acknowledge clock request. Gets set or unset when toggling bit 1. |

Twl-/AgbBg use this to disable FCRAM for the GBA rom in GBA mode or DSi
main RAM in DSi mode. AgbBg clears bit 0 in reg 0x10201000 before
touching this reg.

Kernel11 uses it to put the FCRAM in self-refresh mode (clock disable)
before going to sleep.

## PDN_I2S_CNT

| Bits | Description                                 |
|------|---------------------------------------------|
| 0    | I2S1 Clock (maybe?) 1 = enable, 0 = disable |
| 1    | I2S2 Clock. 1 = enable, 0 = disable         |

I2S1 clock enable bit seems to be unimplemented. Maybe it's because DSP
clock enable drives it?

## PDN_CAMERA_CNT

| Bits | Description                    |
|------|--------------------------------|
| 0    | Clock. 1 = enable, 0 = disable |

## PDN_DSP_CNT

| Bits | Description                    |
|------|--------------------------------|
| 0    | Reset. 0 = reset.              |
| 1    | Clock. 1 = enable, 0 = disable |

PDN services holds reset for 0x30 Arm11 cycles.

## PDN_MVD_CNT

| Bits | Description      |
|------|------------------|
| 0    | Reset. 0 = reset |

This doesn't seem to be used by anything, but does have a clear effect
on the hardware.

The reset value for this register is 1 (out-of-reset at boot).

# N3DS SoC (LGR) registers

## PDN_LGR_SOCMODE

This is used for configuring the New3DS ARM11 CPU clock-rate. This
register is New3DS-only: reading from here on Old3DS always returns
all-zeros even when one tried writing data here prior to the read.

<table>
<thead>
<tr class="header">
<th>Bits</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0-2</td>
<td>SoC mode. Possible values:</p>
<p><code> 0=CTR+256MHz</code><br />
<code> 1=LGR2+256MHz, 5=LGR2+804MHz</code><br />
<code> 2=LGR1+256MHz, 3=LGR1+536MHz</code></p>
<p>N3DS modes (LGR1/LGR2) enable the New 3DS FCRAM extension and are
needed to access N3DS-only devices.</p>
<ul>
<li>CTR: O3DS</li>
<li>LGR1: N3DS prototype, 4 cores (originally 2), no L2C</li>
<li>LGR2: retail N3DS, 4 cores, has L2C</li>
</ul></td>
</tr>
<tr class="even">
<td>15</td>
<td>Interrupt status (read) / clear (write)</td>
</tr>
</tbody>
</table>

**All currently powered-on cores must be (and remain) in WFI state to
trigger the SoC mode switch.**

Kernel code suggests that devices that support LGR1 but not LGR2 only
had 2 cores. All cores (the number of which can be read from MPCORE SCU
registers) are usable in LGR1 mode.

On firmlaunch, the kernel sets the mode to O3DS.

[svcKernelSetState](SVC#kernelsetstate "wikilink") type10, only
implemented on New3DS, uses this register. This piece of code choses the
mode matching the input Param0 bit0 state (1 for higher clock), using
the state of
[CFG11_SOCINFO](CONFIG11_Registers#cfg11_socinfo "wikilink") to
determine which mode is the best (which is always LGR2 on all released
New 3DS units).

## PDN_LGR_CNT

| Bits | Description                       |
|------|-----------------------------------|
| 0    | Enables the N3DS extramem block   |
| 8    | Enables the L2C block (LGR2 only) |

Kernel11 sets this to 0x101 when bit 2 in
[CFG11_SOCINFO](CONFIG11_Registers#cfg11_socinfo "wikilink") (LGR2
supported) is set otherwise 1.

## PDN_LGR_CPU_CNT\<0-3\>

| Bits | Description                                                                                                                                |
|------|--------------------------------------------------------------------------------------------------------------------------------------------|
| 0    | Power request: 0 = power off, 1 = power on                                                                                                 |
| 1    | Handshake bit Needs to be set before powering on the core. It is meant to be cleared by software on the powered-on core, to signal itself. |
| 4    | Power status: 0 = off, 1 = on                                                                                                              |
| 5    | Core present?                                                                                                                              |

Only usable for core2 and core3. Core 0 and 1 have a fixed, read-only
value of 0x30 for this register.

- On power-on, software should switch the affected core to Normal Mode
  on the SCU
- On power-off, software **must** switch the affected core to Powered
  Off mode on the SCU (otherwise the core won't go off)

The normal Arm11 bootrom checks cpuid and hangs if cpuid \>= 2. This is
a problem when booting the 2 additional New3DS Arm11 MPCores.
NewKernel11 solves this by using a hardware feature to overlay the
bootrom with a configurable branch to a kernel function. This overlay
feature was added with the New3DS.

The overlay should be enabled by setting bit0 in
[CFG11_BOOTROM_OVERLAY_CNT](CONFIG11_Registers#cfg11_bootrom_overlay_cnt "wikilink")
and configured by setting the entrypoint address to
[CFG11_BOOTROM_OVERLAY_VAL](CONFIG11_Registers#cfg11_bootrom_overlay_val "wikilink").

The overlay overrides all *instruction* reads from phyiscal addresses
0xFFFF0000-0xFFFF1000 and 0x10000-0x11000 to the following (figured out
by using low exception vectors and configuring the b11 veeners
accordingly):

```
 ldr pc, [pc, #(0x20 - 8)]
```

and all *data* reads from the same ranges to
[CFG11_BOOTROM_OVERLAY_VAL](CONFIG11_Registers#cfg11_bootrom_overlay_val "wikilink").
