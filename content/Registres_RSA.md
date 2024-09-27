# Registres

| Old3DS | Nom                                    | Addresse physique | Taille | Utilisé par |
|--------|----------------------------------------|-------------------|--------|-------------|
| Oui    | [RSA_CNT](#RSA_CNT "wikilink")         | 0x1000B000        | 0x04   |             |
| Oui    | RSA_?                                 | 0x1000B0F0        | 0x04   |             |
| Oui    | [RSA_SLOT](#RSA_SLOT "wikilink")0      | 0x1000B100        | 0x10   |             |
| Oui    | [RSA_SLOT](#RSA_SLOT "wikilink")1      | 0x1000B110        | 0x10   |             |
| Oui    | [RSA_SLOT](#RSA_SLOT "wikilink")2      | 0x1000B120        | 0x10   |             |
| Oui    | [RSA_SLOT](#RSA_SLOT "wikilink")3      | 0x1000B130        | 0x10   |             |
| Oui    | [RSA_EXPFIFO](#RSA_EXPFIFO "wikilink") | 0x1000B200        | 0x04   |             |
| Oui    | [RSA_MOD](#RSA_MOD "wikilink")         | 0x1000B400        | 0x100  |             |
| Oui    | [RSA_TXT](#RSA_TXT "wikilink")         | 0x1000B800        | 0x100  |             |

## RSA_CNT

| Bit | Description                                                       |
|-----|-------------------------------------------------------------------|
| 0   | Début (1=Actif/Occupé, 0=Inactif)                                 |
| 1   | ?                                                                 |
| 4-7 | Emplacement de la clef (Bit6-7 don't actually affect the keyslot) |
| 8   | Endianness (1=Little endian, 0=Big endian)                        |
| 9   | Ordre des mots (1=Ordre normal, 0=Ordre renversé)                 |

## RSA_SLOT

| Nom                                      | Décalage | Taille |
|------------------------------------------|----------|--------|
| [RSA_SLOTCNT](#RSA_SLOTCNT "wikilink")   | 0x0      | 0x4    |
| [RSA_SLOTSIZE](#RSA_SLOTSIZE "wikilink") | 0x4      | 0x4    |
| ?                                        | 0x8      | 0x4    |
| ?                                        | 0xC      | 0x4    |

## RSA_SLOTCNT

| Bits | Description                                                                      |
|------|----------------------------------------------------------------------------------|
| 0    | Statut de la clef (1=Clef définie, 0=Clef non définie pour le moment)            |
| 1    | Protection en écriture de la clef, ce bit est RW. (0 = non protégé, 1 = protégé) |
| 30-2 | ?                                                                                |
| 31   | ?                                                                                |

Avant d'écrire RSA_EXPFIFO/RSA_MOD, le bit 0 doit ici être mit à zéro si
le bit 31 est déjà à zéro. Autrement, l'ARM9 se bloquera lorsque vous
essayerez d'écrire en RSA_EXPFIFO.

## RSA_SLOTSIZE

Ceci contient la taille du RSA pour cet emplacement défini en mots.
Normalement, la valeur est 0x40 pour un chiffrement RSA-2048.

## RSA_EXPFIFO

L'exposent de l'octet situé en 0x100 (privé ou publique) est écrit dans
cet emplacement en écriture seul- PEPS.

## RSA_MOD

Le modulo de la clef RSA pour l'emplacement sélectionné peut être écrit
ici. Au moment de l'écriture, le modulo doit être aligné avec la fin de
la zone du registre.

## RSA_TXT

La signature RSA peut être écrit ici. Les données lues provenant d'ici
sont le message. Au moment de l'écriture de la signature RSA, la
signature doit être préfixé par des zéros jusqu'à atteindre un multiple
de 8 octets et la fin de la signature doit être aligné avec la fin de la
zone du registre.

Le préfixe du message PKCS doit être vérifié manuellement par le
logiciel étant donné que l'hardware ne fait que des opérations RSA
brutes.

## Utilisation des emplacements de clef

| Emplacement de clef | Description                                                                                                                                                                                                     |
|---------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0                   | Arbitraire                                                                                                                                                                                                      |
| 1                   | Description d'accès au [CXI](NCCH/FR#CXI "wikilink") (suivant l'exheader)                                                                                                                                       |
| 2-3                 | Initialisé par la bootrom du processeur ARM9 mais non utilisé par aucun des [FIRMs](FIRM/FR "wikilink"). L'utilisation de ces emplacements par la bootrom ARM9 est inconnu. (si ils ont une quelconque utilité) |