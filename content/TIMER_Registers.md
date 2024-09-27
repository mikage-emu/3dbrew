+++
title = 'TIMER Registers'
+++

There are 4 timers. These timers run at a frequency of 67,027,964.0 ±
2<sup>-32</sup> Hz (i.e. exactly half the ARM9 clock frequency).

# Registers

| Old3DS | Name                                  | Address           | Width | Used by        |
|--------|---------------------------------------|-------------------|-------|----------------|
| Yes    | [TIMER_VAL](#timer_val "wikilink")(n) | 0x10003000 + 4\*n | 2     | Boot9, Kernel9 |
| Yes    | [TIMER_CNT](#timer_cnt "wikilink")(n) | 0x10003002 + 4\*n | 2     | Boot9, Kernel9 |

## TIMER_VAL

Writing to TIMER_VAL loads a starting value for one of the 4 timers,
while reading it will show the current timer value.

## TIMER_CNT

| Bit | Description                                            |
|-----|--------------------------------------------------------|
| 1-0 | Prescaler select (0=F/1, 1=F/64, 2=F/256, 3=F/1024)    |
| 2   | Count-up (0=Disabled, 1=Enabled)                       |
| 5-3 | Not used                                               |
| 6   | IRQ enable (0=Disabled, 1=IRQ on timer value overflow) |
| 7   | Start/Stop (0=Stop, 1=Start)                           |

## Count-up

When count-up is enabled, the timer value will increase every time the
previous timer overflows.
