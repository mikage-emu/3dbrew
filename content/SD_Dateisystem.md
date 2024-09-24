+++
title = 'SD Dateisystem'
+++

Der 3DS benutzt eine SD Karte als allgemeine Datenbank für zusätzliche
Spieldaten und Fotos, die mit dem 3DS aufgenommen wurden.

```
/DCIM - Fotos
/Nintendo 3DS - Spieldaten
```

Zusätzliche Spieldaten sind wie folgt gespeichert:

```
/Nintendo 3DS/`<Zufällige ID>`/`<Zufällige ID>`/extdata/00000000
```

```
0000033c - Super Streetfighter IV 3D - EUR
0000034d - Samurai Warriors Chronicles - USA
0000033b - Ridge Racer 3D - EUR
00000358 - Ridge Racer 3D - USA
0000022d - Face Raiders - EUR
00000227 - Mii Plaza - EUR
0000020d - 顔シューティング - JPN
00000207 - すれちがいMii広場 - JPN
```

Jede der zusätzlichen Spieldaten unter dem Verzeichnis extdata sind
verschlüsselt. Desweiteren benutzen diese Dateien 0xFF blöcke ähnliche
wie EEPROM [saves](Savegames "wikilink"). Extdata kann nicht, wie mit
dem "xorpad-Fehler" von EEPROM Speicherdaten, entschlüsselt werden. Auch
können diese Spieldaten nicht auf andere SD-Karten kopiert werden, da
diese mit dem genutzten 3DS verbunden sind.

Private Daten sind hier gespeichert:

```
/Nintendo 3DS/Private/`<ID siehe unten>`/
```

```
00020500 - Nintendo 3DS Sound
00020400 - Nintendo 3DS Kamera
```

"Private" Dateien vom 3DS Sound/Kamera sind im Klaren Text geschrieben.
Im Priv Kamera Verzeichnis ist die Datei phtchache.bin, es scheint als
wäre es die Bildliste der Bilder auf der SD-Karte. Im Priv Sound
Verzeichnis sind folgende Dateien: voice/XX/\*.m4a. XX is 01-10 und
darin die aufgenommenen Sound als .m4a gespeichert.
