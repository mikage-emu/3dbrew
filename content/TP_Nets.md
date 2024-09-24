+++
title = 'TP Nets'
+++

This page lists and describes the purposes of the testpoints accessible
on a 3DS's circuit board.

## Old 3DS

The signals were figured out using a PicoScope 2206B running at least at
2 MS/s, ±5 V, 8-bit, 1:10, DC. All measures of digital signals were
referenced by the square GND pad at the bottom left corner.

| TP     | Net Name                   | U\[V\]       | S/O/A/R (1) | A/D/P/G\|C/OC\|R/T (2) | Domain       | f\[Hz\]    | Description                                       |
|--------|----------------------------|--------------|-------------|------------------------|--------------|------------|---------------------------------------------------|
| TP1    | GND                        | 0V           | S           | G                      | Charger      | \-         |                                                   |
| TP2    | +1.2V                      | 1.2V         | O           | P                      | ?            | \-         |                                                   |
| TP3    | +2.8V                      | 2.8V         | O           | P                      | ?            | \-         |                                                   |
| TP4    | Uchrg                      | 3V - 5V      | S           | P                      | Charger Port | \-         |                                                   |
| TP5    | +1.8V                      | 1.8V         | O           | P                      | ?            | \-         |                                                   |
| TP6    | +2.8V                      | 2.8V         | O           | P                      | ?            | \-         |                                                   |
| TP7    | +1.8V                      | 1.8V         | S           | P                      | ?            | \-         |                                                   |
| TP8    | Ubat                       | 3.5V - 3.8V  | S           | P                      | Battery      | \-         |                                                   |
| TP9    | +3.9V                      | 3.6V - 3.9V  | S           | P                      | ?            | \-         | 3.9V when off, around 3.6V when active            |
| TP10   | +1.8V                      | 1.8V         | S           | P                      | ?            | \-         |                                                   |
| TP11   | +1.8V                      | 1.8V         | S           | P                      | ?            | \-         |                                                   |
| TP12   | +4V                        | 3.7V - 4V    | O           | P                      | ?            | \-         | 4V during standby, around 3.75V when active       |
| ..     |                            |              |             |                        |              |            |                                                   |
| TP41   | Bot Screen Lights Source   | 10V          | A           | P                      | ?            | \-         |                                                   |
| TP42   | Bot Screen Lights Sink     | 0.2V         | A           | P                      | ?            | \-         |                                                   |
| ..     |                            |              |             |                        |              |            |                                                   |
| TP46   | Enable? Supply?            | 3.2V         | A           | PP?P?                  | ?            | \-         | High when displays are active but low during boot |
| ..     |                            |              |             |                        |              |            |                                                   |
| TP48   | HEADPHONE-GND              | 2.2Vpp       | O?          | G                      | headphone    | ~ 33kHz    | Headphone ground                                  |
| TP49   | HEADPHONE-PD               | 1V           | O           | OC                     | headphone    | \-         | headphone Plug Detection                          |
| TP50   | HEADPHONE-LEFT             | 2.2Vpp       | A           | A+PP                   | headphone    |            | referenced to TP48, AC                            |
| TP51   | HEADPHONE-RIGHT            | 2.2Vpp       | A           | A+PP                   | headphone    |            | referenced to TP48, AC                            |
| ..     |                            |              |             |                        |              |            |                                                   |
| TP58   | WLAN button                | 1.8V         | O           | OC                     | side buttons | \-         |                                                   |
| ..     |                            |              |             |                        |              |            |                                                   |
| TP67   | SYS-LED-BLUE-LowsideDriver | 2.2V - 3V    | O           | P+T                    | leds         | 0Hz, 2kHz  | Static when active, PWM when in standby           |
| TP68   | JPAD-Y                     | 0.2V - 1.5V  | A           | A                      | circle pad   | \-         | Voltage U \> D                                    |
| TP69   | JPAD-X                     | 0.2V - 1.5V  | A           | A                      | circle pad   | \-         | Voltage L \> R                                    |
| TP70   | SYS-LED-RED-LowsideDriver  | (2.2V - 3V)? | ?           | P+T                    | leds         | ?          |                                                   |
| ..     |                            |              |             |                        |              |            |                                                   |
| TP80   | START                      | 1.8V         | O           | OC                     | main buttons | \-         |                                                   |
| TP81   | SELECT                     | 1.8V         | O           | OC                     | main buttons | \-         |                                                   |
| TP82   | R                          | 1.8V         | O           | OC                     | main buttons | \-         |                                                   |
| TP83   | L                          | 1.8V         | O           | OC                     | main buttons | \-         |                                                   |
| TP84   | +1.8V                      | 1.8V         | O           | P?                     | ?            | \-         | perhaps voltage rail for buttons?                 |
| TP85   | DPAD-U                     | 1.8V         | O           | OC                     | main buttons | \-         |                                                   |
| TP86   | X                          | 1.8V         | O           | OC                     | main buttons | \-         |                                                   |
| TP87   | DPAD-L                     | 1.8V         | O           | OC                     | main buttons | \-         |                                                   |
| TP88   | Y                          | 1.8V         | O           | OC                     | main buttons | \-         |                                                   |
| TP89   | A                          | 1.8V         | O           | OC                     | main buttons | \-         |                                                   |
| TP90   | DPAD-R                     | 1.8V         | O           | OC                     | main buttons | \-         |                                                   |
| TP91   | DPAD-D                     | 1.8V         | O           | OC                     | main buttons | \-         |                                                   |
| TP92   | B                          | 1.8V         | O           | OC                     | main buttons | \-         |                                                   |
| TP93   | ?                          | 0V           | S           | G? D? A?               | ?            | \-         |                                                   |
| TP94   | ?                          | 0V           | S           | G? D? A?               | ?            | \-         |                                                   |
| ..     |                            |              |             |                        |              |            |                                                   |
| TP96   | +3.2V                      | 3.2V         | O           | P?                     | ?            | \-         |                                                   |
| ..     |                            |              |             |                        |              |            |                                                   |
| TP131  | TOP-SCREEN-PWM             | 1.8V         | A           | D                      | ?            | 1166.7kHz  | 2.7% (darkest) - 25% (brightest) dutycycle        |
| TP132  | BOT-SCREEN-PWM             | 1.8V         | A           | D                      | ?            | 1166.7kHz  | 5% (darkest) - 54% (brightest) dutycycle          |
| ..     |                            |              |             |                        |              |            |                                                   |
| TP144  | IR-I2C-SCL                 | 3.2Vp        | R           | OC                     | ir-i2c       | 390kHz     | Address: 9Ah (W), 9Bh (R)                         |
| ..     |                            |              |             |                        |              |            |                                                   |
| TP146  | IR-I2C-SDA                 | 3.2Vp        | R           | OC                     | ir-i2c       | 390kHz     |                                                   |
| ..     |                            |              |             |                        |              |            |                                                   |
| TP149  | ?                          | 2Vp          | A           | C?+R                   | ?            | 47.6kHz    | I2S word select?                                  |
| TP150  | ?                          | 2Vp          | A           | C?+R                   | ?            | 1.52MHz    | I2S clock?                                        |
| ..     |                            |              |             |                        |              |            |                                                   |
| TP152  | ?                          | 1.8Vp        | A           | D                      | ?            | 16.7MHz    | clock?                                            |
| ..     |                            |              |             |                        |              |            |                                                   |
| TP189  | VIDEO-CLK                  | 1.8Vp        | A           | D+T                    | video signal | 11.1MHz    | at home screen                                    |
| TP190  | VIDEO-HSYNC                | 1.8Vp        | A           | D+R                    | video signal | 24.77kHz   | at home screen                                    |
| TP191  | VIDEO-VSYNC                | 1.8Vp        | A           | D+R                    | video signal | 59.8Hz ~60 | at home screen                                    |
| ..     |                            |              |             |                        |              |            |                                                   |
| TP213  | TOUCH-Y?                   | 2V, 2Vp      | O           | D, D+R                 | touch        |            |                                                   |
| TP214  | TOUCH-X?                   | 0V, 2Vp      | O           | A, A+R                 | touch        |            |                                                   |
| TP215  | TOUCH-Y?                   | 2V, 2Vp      | O           | D, D+R                 | touch        |            |                                                   |
| TP216  | TOUCH-X?                   | 0V, 2Vp      | O           | A, A+R                 | touch        |            |                                                   |
| ..     |                            |              |             |                        |              |            |                                                   |
| TP249  | NAND-DAT0                  |              | O?          | PP?                    | nand         |            |                                                   |
| TP250  | NAND-DAT1                  |              | O?          | PP?                    | nand         |            |                                                   |
| TP251  | NAND-DAT2                  |              | O?          | PP?                    | nand         |            |                                                   |
| TP252  | NAND-DAT3                  |              | O?          | PP?                    | nand         |            |                                                   |
| TP253  | NAND-CMD                   |              | O?          | PP?                    | nand         |            |                                                   |
| TP254? | NAND-CLK?                  |              | O?          | PP?                    | nand         |            |                                                   |

\[1\] Presence: S = Static (always present); O = device On; A = Active
(not in standby); R = when Required.

\[2\] Electrical characteristics: Signal Type: A = Analogue; D =
Digital; P = Power; G = Ground; Driver: PP = Push Pull; OC = Open
Collector; PU/PD = Pull Up/Down Typical Waveforms: R = Rectangular; T =
Triangular;