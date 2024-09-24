### Format

Nous n'avons, à l'heure actuelle, aucune information concernant le
format utilisé pour stocker les fichiers sur la mémoire flash de la
console. La lecture de la puce flash est possible via les broches sur la
carte mère. Cela a été fait, mais les données sont cryptées et
nécessitent donc d'être décryptées avant de pouvoir être analysées.
Malheureusement le décryptage est encore impossible.

### Système de fichiers

Chaque partition de la NAND est formatée avec le système de fichiers
FAT.

### Cryptage

Il semblerait que les fichiers sur la NAND aient été cryptés avec le
système AES.

### Partitions

| Nom   | Description                         |
|-------|-------------------------------------|
| firm0 | Partition du Firmware.              |
| firm1 | Partition du Firmware..             |
| nand  | Système de fichiers CTR-NAND. (3DS) |
| twln  | Système de fichier TWL-NAND. (DSi)  |