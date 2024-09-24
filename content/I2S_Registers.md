+++
title = 'I2S Registers'
+++

# Registers

| Old3DS | Name                             | Address    | Width | Used by                       |
|--------|----------------------------------|------------|-------|-------------------------------|
| Yes    | [I2S1_CNT](#i2s1_cnt "wikilink") | 0x10145000 | 2     | Codec sysmodule, AgbBg, TwlBg |
| Yes    | [I2S2_CNT](#i2s2_cnt "wikilink") | 0x10145002 | 2     | Codec sysmodule, AgbBg, TwlBg |

## I2S1_CNT

| Bit   | Description                      |
|-------|----------------------------------|
| 0-5   | DSP volume (doesn't affect csnd) |
| 6-11  | Another volume?                  |
| 12    | ?                                |
| 13-14 | ?                                |
| 15    | Enable (0=Disabled, 1=Enabled)   |

This I2S line is used the DSP and microphone.

This is usually set to 0xC800 or 0xC820 when the DSP is active.

## I2S2_CNT

| Bit   | Description                    |
|-------|--------------------------------|
| 13-14 | ?                              |
| 15    | Enable (0=Disabled, 1=Enabled) |

This I2S line is used by CSND.

Usually set to 0xE000.
