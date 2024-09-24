## Registres

| NOM           | ADDRESSE PHYSIQUE | ADDRESSE DU PROCESSUS | TAILLE |
|---------------|-------------------|-----------------------|--------|
| REG_I2C1DATA  | 0x10116100        | 0x1EC16100            | 1      |
| REG_I2C1CNT   | 0x10116101        | 0x1EC16101            | 1      |
| REG_I2C1CNTEX | 0x10116102        | 0x1EC16102            | 2      |
| REG_I2C1SCL   | 0x10116104        | 0x1EC16104            | 2      |
| REG_I2C2DATA  | 0x10114400        | 0x1EC14400            | 1      |
| REG_I2C2CNT   | 0x10114401        | 0x1EC14401            | 1      |
| REG_I2C2CNTEX | 0x10114402        | 0x1EC14402            | 2      |
| REG_I2C2SCL   | 0x10114404        | 0x1EC14404            | 2      |
| REG_I2C3DATA  | 0x10114800        | 0x1EC14800            | 1      |
| REG_I2C3CNT   | 0x10114801        | 0x1EC14801            | 1      |
| REG_I2C3CNTEX | 0x10114802        | 0x1EC14802            | 2      |
| REG_I2C3SCL   | 0x10114804        | 0x1EC14804            | 2      |

## Dispositifs I2C

| Bus I2C du dispositif | Addresse du dispositif | Description du dispositif                                                        |
|-----------------------|------------------------|----------------------------------------------------------------------------------|
| 1                     | 0x4a                   | Gestion de l'alimentation?(même adresse que la gestion d'alimentation de la DSi) |
| 1                     | 0x7a                   | Camera0?(même adresse que DSi cam0)                                              |
| 1                     | 0x78                   | Camera1?(même adresse que DSi cam1)                                              |
| 2                     | 0x4a                   | ?                                                                                |
| 2                     | 0x78                   | ?                                                                                |
| 2                     | 0x2c                   | ?                                                                                |
| 2                     | 0x2e                   | ?                                                                                |
| 2                     | 0x40                   | ?                                                                                |
| 2                     | 0x44                   | ?                                                                                |
| 3                     | 0xa6                   | ?                                                                                |
| 3                     | 0xd0                   | ?                                                                                |
| 3                     | 0xd2                   | ?                                                                                |
| 3                     | 0xa4                   | ?                                                                                |
| 3                     | 0x9a                   | ?                                                                                |
| 3                     | 0xa0                   | ?                                                                                |

# I2CCNT

| BIT | DESCRIPTION                                            |
|-----|--------------------------------------------------------|
| 0   | HOLD (0=Dernier byte de transaction, 1=Bytes restants) |
| 2   | Flag d'Erreur/ack?                                     |
| 4   | En liaison avec le mode lecture?                       |
| 5   | Mode Lecture?                                          |
| 6   | Activer IRQ?                                           |
| 7   | Activer?                                               |

REG_I2CxCNT