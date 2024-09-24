+++
title = 'MIC Registers'
+++

## Registers

| NAME                                   | PHYSICAL ADDRESS | PROCESS VIRTUAL ADDRESS | WIDTH |
|----------------------------------------|------------------|-------------------------|-------|
| [REG_MIC_CNT](#reg_mic_cnt "wikilink") | 0x10162000       | 0x1EC62000              | 0x2   |
| REG_MIC_DATA                           | 0x10162004       | 0x1EC62004              | 0x4   |

These are the registers for the microphone hardware, see
[here](MIC_Services "wikilink") also.

REG_MIC_DATA contains the current audio data from the microphone.

## REG_MIC_CNT

| Bit | Description                                         |
|-----|-----------------------------------------------------|
| 3-2 | [Sampling rate](MIC_Services#SampleRate "wikilink") |
|     |                                                     |