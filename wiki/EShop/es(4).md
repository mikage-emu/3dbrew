La Nintendo 3DS eShop fue añadida en la actualización de junio de 2011
para JP/EUR/USA.

Permite descargar juegos de la Consola Virtual, 3D Classics, software de
DSi y ver imágenes y tráilers 3D de futuros títulos de Nintendo 3DS.

Al conectar con los servidores, la eShop realiza las siguientes
peticiones sobre HTTPS: nus.c.shop.nintendowifi.net,
ecs.c.shop.nintendowifi.net, cp3s-auth.c.shop.nintendowifi.net,
cas.c.shop.nintendowifi.net, y a248.e.akamai.net.

Mientras el eshop esta cargando , eshop usara los comando
NIMS:CheckSysupdateAvailableSOAP. Si una actualizacion del sistema esta
disponible donde la instalacion del titulo de sistema esta, necesita
esperar que finalize (o cuando la actualizacion del titulo no es
descargado del todo) eshop entonces mostrara un mensaje diciendo "Hay
disponible una actualizacion del sistema"

## Codigos QR del Eshop

Codigos QR del Eshop pueden ser escaneados con la camara permitiendo
rapidamente navegar al titulo del eshop deseado con solo dos clicks. El
codigo QR por si mismo es un simple texto/url QR,comienza con "ESHOP://"
cadena seguida de id de un titulo del eshop luego de algunos datas
especiales , delimitados por un simbolo de punto , el cual puede ser
omitido.

| Fuente de codigo QR                 | Region | Titulo                                              | Serial                                                                                                                                            | ID del titulo    |
|-------------------------------------|--------|-----------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|------------------|
| ESHOP://50010000000201.PEAALL000000 | EUR    | Nintendogs & Cats Demo                              | ADA/B/C                                                                                                                                           | 0004000200030c01 |
| ESHOP://50010000007870.PEAALL000000 | EUR    | Crush 3D                                            | A??P                                                                                                                                              | 00040002         |
| ESHOP://50010000008009.PEAALL000000 | EUR    | Resident Evil Revelations Demo                      | ABRE                                                                                                                                              | 000400020005ee01 |
| ESHOP://50010000008123.J00101Z00095 | JPN    | Rhythm Thief & the Emperor's Treasure Demo          | ARTJ                                                                                                                                              | 00040002         |
| ESHOP://50010000008404.PEAALL000000 | EUR    | Mario & Sonic at the London 2012 Olympic Games Demo | ACMP [1](http://mediacontent.nintendo-europe.com/NOE/images/game_content/ACMP-MarioAndSonicAtTheLondon2012OlympicGames-QRCode-EA_ALL_000_001.bmp) | 00040002         |
| ESHOP://50010000008447.J00101Z00094 | JPN    | Resident Evil Revelations Demo                      | ABRJ                                                                                                                                              | 00040002         |
| ESHOP://50010000008449.J00101Z00082 | JPN    | Swapnote                                            | JFRJ                                                                                                                                              |                  |
| ESHOP://50010000008561              | USA    | Swapnote                                            | JFRE                                                                                                                                              | 0004000000051700 |
| ESHOP://50010000008647.J00101Z00096 | JPN    | MGS Snake Eater 3D Demo                             | AMGJ                                                                                                                                              | 0004000200048101 |
| ESHOP://50010000008648.J00101Z00097 | JPN    | Theatrythm Final Fantasy                            | ATHJ                                                                                                                                              |                  |
| ESHOP://50010000008782.PEAALL000000 | EUR    | MGS Snake Eater 3D Demo                             | AMGE                                                                                                                                              | 0004000200082401 |
| ESHOP://50010000008842.PEAALL000000 | EUR    | Rhythm Thief & the Emperor's Treasure Demo          | ARTP [2](http://mediacontent.nintendo-europe.com/NOE/images/game_content/ARTP-RhythmThief_TheEmperorsTreasure-QRCode-EA_ALL_000_001.bmp)          | 00040002         |
| ESHOP://50010000009084.J00101Z00121 | JPN    | Hatsune Miku and Future Stars: Project Mirai Demo   | AM9J                                                                                                                                              | 00040002         |
| ESHOP://50010000009102.J00101Z00106 | JPN    | Denpa Ningen RPG                                    | JD8J                                                                                                                                              |                  |
| ESHOP://50010000009161.J00101Z00118 | JPN    | Dillon's Rolling Western                            | JAMJ                                                                                                                                              | 00040000         |
| ESHOP://50010000009261              | USA    | Dillon's Rolling Western                            | JAME?                                                                                                                                             | 00040000         |
| ESHOP://50010000009401.J00101Z00120 | JPN    | Kingdom Hearts 3D Video Download                    | JZ8J                                                                                                                                              |                  |
| ESHOP://50010000009403.J00101Z00119 | JPN    | DQM 3D Video Download                               | JZ7J                                                                                                                                              |                  |
| ESHOP://50010000009575.PEAALL000000 | EUR    | Kid Icarus: Of Myths and Monsters (Virtual Console) | ?                                                                                                                                                 |                  |
| ESHOP://50010000009846              | USA    | Ketzal's Corridors                                  | ?                                                                                                                                                 |                  |

- Nuevos codigos QR para japoneses "Fotos con Super Mario" tienen una
  cadena de codigos diferentes
  ESHOP://50010000013120.J00108Z00001.CD588EAE95A3A68D15C647DA2AC0945FD88F70AB8A31149E51C4B05FB927B0B8

<!-- -->

- Hay un link en el eshop japones
  [3](http://www.nintendo.co.jp/3ds/eshop/qrCode.html?####) donde tu
  puedes remplazar los \#### escribiendo la serial del titulo del eshop
  japones y tu tendras su codigoQR (ej.
  <http://www.nintendo.co.jp/3ds/eshop/qrCode.html?jcaj> tendras el
  codigo qr de pushmo)

<!-- -->

- Tu puedes usar la tabla API de google para crear un qr code para los
  codigos de arriba:
  <https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=ESHOP>
  (reemplace el texto ESHOP con el ESHOP:// link por uno de los de
  arriba...)