# Registers

| Old3DS | Name                             | Address    | Width | Used by                       |
|--------|----------------------------------|------------|-------|-------------------------------|
| Yes    | [I2S1_CNT](#I2S1_CNT "wikilink") | 0x10145000 | 2     | Codec sysmodule, AgbBg, TwlBg |
| Yes    | [I2S2_CNT](#I2S2_CNT "wikilink") | 0x10145002 | 2     | Codec sysmodule, AgbBg, TwlBg |

## I2S1_CNT

| Bit  | Description                                                           |
|------|-----------------------------------------------------------------------|
| 0-5  | DSP volume (doesn't affect csnd).                                     |
| 6-11 | GBA hardware master volume. And DSi too?                              |
| 12   | Unknown purpose. Maybe direction for microphone input?                |
| 13   | I2S frequency. 0=32.728498046875 kHz, 1=47.605088068181818181818 kHz. |
| 14   | First MCLK output. 0=8.3784955 MHz, 1=16.756991 MHz.                  |
| 15   | Enable (0=Disabled, 1=Enabled)                                        |

This I2S line is used the DSP, GBA hardware and microphone.

This is usually set to 0xC800 or 0xC820 when the DSP is active.

## I2S2_CNT

| Bit  | Description                                                                        |
|------|------------------------------------------------------------------------------------|
| 0-12 | Unused (0).                                                                        |
| 13   | I2S frequency. 0=32.728498046875 kHz, 1=47.605088068181818181818 kHz.              |
| 14   | Second MCLK output. Connected to the CODEC chip. 0=8.3784955 MHz, 1=16.756991 MHz. |
| 15   | Enable (0=Disabled, 1=Enabled)                                                     |

This I2S line is used by CSND.

Usually set to 0xE000.