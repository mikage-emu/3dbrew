![](Gamecard.jpg "Gamecard.jpg") ![](GamecardPhy.jpg "GamecardPhy.jpg")

### Interfaz física

Las tarjetas 3DS tienen la misma interfaz física que las tarjetas DS y
DSi. Sólo hay una pequeña diferencia de diseño en la carcasa de
plástico, que tiene un pequeño saliente en la esquina superior derecha.
De este modo se impide la inserción de la tarjeta en las antiguas
consolas Nintendo DS o Nintendo DSi.

Si se modifica la carcasa para que una tarjeta 3DS encaje en una consola
Nintendo DS o Nintendo DSi, ésta se negará a leer los datos de la
tarjeta y no mostrará icono alguno.

| Conector | Nombre | Descripción                                                                                                                                 |
|----------|--------|---------------------------------------------------------------------------------------------------------------------------------------------|
| 1        | GND    | Tierra                                                                                                                                      |
| 2        | CLK    | Reloj. Frecuencias 6.7MHz y 4.2MHz para tarjetas DS/DSi, hasta 16.6MHz en tarjetas 3DS (para transferencias SPI y ROM).                     |
| 3        | NC     | No conectado. Posiblemente usado para programar las tarjetas.                                                                               |
| 4        | RCS    | Selección de ROM, activo a nivel bajo. Al pasar a nivel bajo se inicia la transferencia del ROM.                                            |
| 5        | RST    | Reinicio, activo a nivel bajo.                                                                                                              |
| 6        | ECS    | Selección del chip de partidas guardadas, activo a nivel bajo. Al pasar a nivel bajo se inicia la transferencia SPI de la partida guardada. |
| 7        | IRQ    | Detección de extracción de la tarjeta.                                                                                                      |
| 8        | VCC    | Alimentación 3.3V.                                                                                                                          |
| 9        | DAT0   | Bus de datos bidireccional.                                                                                                                 |
| 10       | DAT1   | Bus de datos bidireccional.                                                                                                                 |
| 11       | DAT2   | Bus de datos bidireccional.                                                                                                                 |
| 12       | DAT3   | Bus de datos bidireccional.                                                                                                                 |
| 13       | DAT4   | Bus de datos bidireccional / Conector NC/SIO3 en el chip de partidas guardadas.                                                             |
| 14       | DAT5   | Bus de datos bidireccional / Conector WP#/SIO2 en el chip de partidas guardadas.                                                            |
| 15       | DAT6   | Bus de datos bidireccional / Conector SO/SIO1 en el chip de partidas guardadas.                                                             |
| 16       | DAT7   | Bus de datos bidireccional / Conector SI/SIO0 en el chip de partidas guardadas.                                                             |
| 17       | GND    | Tierra                                                                                                                                      |

### Flash SPI

De momento, sólo se ha identificado un chip flash de partidas guardadas.
El chip se identifica como 0xC22211. La ID del fabricante JEDEC es
Macronix, y a pesar que la etiqueta del chip dice 25L1001, la ID JEDEC
corresponde con el MX25L1021E. Hoja de datos ent:
<http://www.macronix.com/QuickPlace/hq/PageLibrary4825740B00298A3B.nsf/h_Index/3F21BAC2E121E17848257639003A3146/$File/MX25L1021E,%203V,%201Mb,%20v0.01.pdf>.
Sin embargo, el MX25L1021E no soporta la transmisión ancha de 4 bit que
la Nintendo 3DS usa para comunicarse con la flash SPI. Entonces es
posible que sea un chip personalizado.

### Formato

Las tarjetas pueden venir en distintos tamaños e incluyen
actualizaciones del sistema en una región reservada para ello. En las
ROMs de menos de 1GB se puede encontrar esta región con: CART_SIZE_MAX-(
0x280000\*(CART_SIZE_MAX/CART_SIZE_128MB) )-0x2000000. La región es
entonces de 0x2000000 bytes.

### Protocolo

El protocolo de comunicación entre la consola Nintendo 3DS y las
tarjetas 3DS ha cambiado casi completamente en comparación al protocolo
de comunicación de las tarjetas DS y DSi.

Después de la sexta transferencia, los comandos cambian de tamaño,
pasando de ser de 8 bytes a 16 bytes. Posiblemente se usa una nueva
encriptación, como AES CTR. Cuando se usan comandos de 16 bytes, el bus
de datos mantiene el valor 0x00 hasta que la tarjeta señala que está
lista enviando un simple byte 0x01, seguido de los datos. Después de
cada bloque de datos de 0x200 bytes, se envían (antes de ser
encriptados) 4 bytes CRC32 estándar de los datos de bloque.

Esto es un set de comandos de muestra que una Nintendo 3DS envía a una
tarjeta 3DS:

| Tamaño | Comando                            | Comando desencriptado              | Descripción                                            |
|--------|------------------------------------|------------------------------------|--------------------------------------------------------|
| `2000` | `9F00000000000000`                 |                                    | Reinicio                                               |
| `0000` | `71C93FE9BB0A3B18`                 |                                    | Desconocido                                            |
| `0004` | `9000000000000000`                 |                                    | Obtener ID de la tarjeta, respuesta=9000FEC2           |
| `0004` | `9000000000000000`                 |                                    | Obtener ID de la tarjeta, respuesta=9000FEC2           |
| `0004` | `A000000000000000`                 |                                    | Desconocido, respuesta=00000000                        |
| `0000` | `3E00000000000000`                 |                                    | Entrar modo de comandos de 16 bytes.                   |
| `0200` | `82000000000000000000000000000000` |                                    | Obtener cabecera                                       |
| `0000` | `F32C92D85C9D44DED3E0E41DBE7C90D9` | `8300000000000000708DF1A731717D0B` | Semilla                                                |
| `0004` | `696B9D8582FB55D31B68CAFE70C74A95` | `A200000000000000708DF1A731717D0B` | Obtener ID protegida de la tarjeta, respuesta=9000FEC2 |
| `0004` | `BAA4812CA0AC9C5D19399530E3ACCCAB` | `A300000000000000708DF1A731717D0B` | Desconocido                                            |
| `0000` | `178E427C22D87ADB86387249A97D321A` | `C500000000000000708DF1A731717D0B` | Desconocido                                            |
| `0004` | `E06019B1BD5C9130ED6A4D9F4A9E7193` | `A200000000000000708DF1A731717D0B` | Obtener ID protegida de la tarjeta, respuesta=9000FEC2 |
| `0004` | `4E0D224862523BBFE2E6255F80E15F37` | `A200000000000000708DF1A731717D0B` | Obtener ID protegida de la tarjeta, respuesta=9000FEC2 |
| `0004` | `4CDF93D319FB62D0DB632A45E3E8D84C` | `A200000000000000708DF1A731717D0B` | Obtener ID protegida de la tarjeta, respuesta=9000FEC2 |
| `0004` | `9AA5D80551002F955546D296A57F0FEF` | `A200000000000000708DF1A731717D0B` | Obtener ID protegida de la tarjeta, respuesta=9000FEC2 |
| `0004` | `C12BA81AEF30DDDBD93FAD5D544C6334` | `A200000000000000708DF1A731717D0B` | Obtener ID protegida de la tarjeta, respuesta=9000FEC2 |
| `0200` | `62EC5FB7F420AE1DC6253AE18AFA5BB3` | `BF000000000000000000000000000000` | Leer dirección 0                                       |
| `0200` | `E3FA23AA016BE0C93430D1F42FF41324` | `BF000000000040000000000000000000` | Leer dirección 0x4000                                  |

El comando de la cabecera tiene algunos falsos bytes iniciales, y
finalmente responde con una cabecera de 0x200 bytes. Esto es un ejemplo
de Lego Starwars 3:

`0000000: 00 8c 03 00 00 00 04 00 00 00 00 00 00 00 00 00  ................`
`0000010: b3 cf fb c6 6a b1 cb 20 32 af ce 35 d4 1c 74 c9  ....j.. 2..5..t.`
`0000020: 8e 6b 27 2f 08 01 28 3b d4 30 de 44 37 f5 b0 46  .k'/..(;.0.D7..F`
`0000030: 91 59 d7 38 33 48 df 83 fd 71 84 2c 00 00 00 00  .Y.83H...q.,....`
`0000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`0000050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`0000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`0000070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`0000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`0000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`00000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`00000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`00000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`00000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`00000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`00000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`0000100: 4e 43 43 48 7a 7f 0e 00 00 8c 03 00 00 00 04 00  NCCHz...........`
`0000110: 36 34 02 00 00 00 00 00 00 8c 03 00 00 00 04 00  64..............`
`0000120: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`0000130: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`0000140: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`0000150: 43 54 52 2d 50 2d 41 4c 47 50 00 00 00 00 00 00  CTR-P-ALGP......`
`0000160: 0c 27 e3 c1 de 7b 2a e2 d3 11 4f 32 a4 ee bf 46  .'...{*...O2...F`
`0000170: 9a fd 0c f3 52 c1 1d 49 84 c2 a9 f1 d2 14 4c 63  ....R..I......Lc`
`0000180: 00 04 00 00 00 00 00 00 00 00 00 00 01 03 00 00  ................`
`0000190: 05 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00  ................`
`00001a0: 06 00 00 00 1c 0a 00 00 01 00 00 00 00 00 00 00  ................`
`00001b0: 22 0a 00 00 58 75 0e 00 01 00 00 00 00 00 00 00  "...Xu..........`
`00001c0: 13 0c 04 26 15 f6 47 c4 c6 32 25 ea 9e 67 f8 a2  ...&..G..2%..g..`
`00001d0: 7b 15 24 6b 88 fb c7 a9 27 25 7b 84 97 7b 78 7b  {.$k....'%{..{x{`
`` 00001e0: a6 5b ee 10 60 bb 6a 68 21 bb ce c6 00 03 5b 7e  .[..`.jh!.....[~ ``
`00001f0: 64 fb 6e ac a7 f0 96 0c fb 1f 5a 37 08 77 28 f7  d.n.......Z7.w(.`