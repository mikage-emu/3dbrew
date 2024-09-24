## Carte

- 0x1EF00400 est l'écran du haut
- 0x1EF00500 est l'écran du bas

## Valeures initiales de nngxInitialize pour l'écran du haut

- 0x1EF00400 = 0x1C2
- 0x1EF00404 = 0xD1
- 0x1EF00408 = 0x1C1
- 0x1EF0040C = 0x1C1
- 0x1EF00410 = 0
- 0x1EF00414 = 0xCF
- 0x1EF00418 = 0xD1
- 0x1EF0041C = 0x1C501C1
- 0x1EF00420 = 0x10000
- 0x1EF00424 = 0x19D
- 0x1EF00428 = 2
- 0x1EF0042C = 0x1C2
- 0x1EF00430 = 0x1C2
- 0x1EF00434 = 0x1C2
- 0x1EF00438 = 1
- 0x1EF0043C = 2
- 0x1EF00440 = 0x1960192
- 0x1EF00444 = 0
- 0x1EF00448 = 0
- 0x1EF0045C = 0x19000F0
- 0x1EF00460 = 0x1c100d1
- 0x1EF00464 = 0x1920002
- 0x1EF00470 = 0x80340
- 0x1EF0049C = 0

## Plus de valeures initiales de nngxInitialize pour l'écran du haut

- 0x1EF00468 = 0x18300000, change plus tard pour 0x181e6000, framebuffer
- 0x1EF0046C = 0x18300000, change plus tard pour 0x18273000, framebuffer
- 0x1EF00494 = 0x18300000
- 0x1EF00498 = 0x18300000
- 0x1EF00478 = 1, ne reste pas 1, lu comme 0
- 0x1EF00474 = 0x10501

## 0x1EF00X90

| Bit  | Description                                                     |
|------|-----------------------------------------------------------------|
| 3-0  | ?                                                               |
| 7-4  | Contrôle la dimention et/ou le format de couleur du framebuffer |
| 31-7 | ?                                                               |

Ce registre contrôle comment est affiché le framebuffer du LCD.

## Framebuffers

Le module GSP du framebuffer LCD DMAs du tas de l'application GSP est
situé dans la FCRAM à l'intérieur de la VRAM. Ces framebuffers
contiennent normalement les dernière frames rendues par le GPU. Le
format de couleur est BGR8. Ces framebuffers sont remplis de gauche à
droite au lieu de haut en bas. (Ainsi le début du framebuffer est
remplis en commençant à gauche de l'écran)