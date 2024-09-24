La 3DS utilise une carte SD pour le stockage des données additionnelles
des jeux, la musiques et les photos prises avec la 3DS.

`/DCIM - Photos et images téléchargées avec le navigateur Internet.`
`/Music - Fichiers de musique`
`/Nintendo 3DS - Données des jeux`

/DCIM depuis la mise à jour [3.0.0-5](3.0.0-5 "wikilink") contient aussi
les vidéos 3D .avi de l’Appareil Photo 3DS. Le codec utilisé est MJPG.

## Données additionnelles

Les données additionnelles des jeux sont stockées ici:


/Nintendo 3DS/<SomeID>/<SomeID>/extdata/00000000

`0000008f - Quelques données du firmware `[`2.0.0-2`](2.0.0-2 "wikilink")`, inconnu (n’apparaît pas dans le management des données additionnelles) `
`00000098 - eShop - EUR (Non confirmé)`
`00000207 - Editeur Mii - JPN `
`0000020d - La Guerre des têtes - JPN`
`00000210 - Quelques données du firmware `[`2.0.0-2`](2.0.0-2 "wikilink")`, inconnu (n’apparaît pas dans le management des données additionnelles) `
`00000217 - Editeur Mii - USA`
`00000219 - eShop USA`
`0000021d - La Guerre des têtes- USA`
`00000227 - Editeur Mii - EUR`
`0000022d - La Guerre des têtes - EUR`
`0000030c - Nintendogs + Cats - EUR`
`00000326 - Pokédex 3D - EUR`
`0000032d - Super Street Fighter IV 3D - USA`
`0000033b - Ridge Racer 3D - EUR`
`0000033c - Super Street Fighter IV 3D - EUR`
`0000034d - Samurai Warriors Chronicles - USA`
`00000358 - Ridge Racer 3D - USA`
`0000038a - Dead or Alive Dimensions - EUR`
`000004aa - Nintendo Vidéo - USA`
`000004ab - Nintendo Vidéo - EUR`

Toutes les données additionnelles ([Données
additionnelles](Données_additionnelles "wikilink")), sont cryptées. Même
si ces fichiers utilisent des blocs 0xFF similaires aux [Sauvegardes de
Jeux](Sauvegardes_de_Jeux "wikilink") FLASH, ils ne peuvent pas être
décryptés avec la faille xorpad comme les sauvegardes. Les données
additionnelles ne peuvent pas être copiées sur la carte SD d'une autre
3DS, elles sont liées à la console.

## import.db and title.db

Avec l'introduction de la mise à jour de Juin, la structure des dossiers
a considérablement changé. Vous trouverez maintenant les dossiers "dbs"
et "title" dans /Nintendo3DS/<SomeID>/<SomeID>/ avec le dossier
"extdata". Le dossier "dbs" contient deux fichiers, import.db et
title.db (utilité actuellement inconnue). Le fichier import.db semble
contenir des données sur les SRLs des DsiWares.

Les données au début du fichier sont cryptées, mais le reste est en
clair. Ce fichier fait toujours 3.1MB, il ne contient donc pas le SRL
complet de la plupart des DsiWares. Les données stockées ici ne sont pas
ordonnées de la même façon que les SRLs sources : le code ARM7, le code
ARM9 et les données sont mixés ensemble. Le fichier peur contenir les
données d'un DsiWare non installé, simplement listé sur la DSi source
lors du transfert de DsiWares.(ce fichier est en fait une sorte de
stockage temporaire de données utilisées pour l'installation des
DsiWares, etc).

title.db semble être crypté.

- [Anciens et nouveaux import.db et title.db ayant été xorés, révélant
  du texte en clair](https://gist.github.com/1113cbe10f124e5a2c72).

## title

`/title/00040000/ Contient les téléchargement effectués depuis l'eShop ( quelqu'un peut-il les vérifier et les ajouter pour les différentes régions ?):`
`00032600 - Pokedex 3D - EUR (vérifié)`
`00042a00 - Legend of Zelda - Link's Awakening - EUR`
`0004ab00 - Nintendo Vidéo - EUR`
`00052000 - Let's Golf 3D - EUR`
`00054300 - 3D Classics Excitebike - USA`
`00054e00 - 3D Classics Excitebike - EUR (verifié)`
`00054300 - 3D Classics Excitebike - USA`
`00045C00 - 3D Classics Excitebike - JPN`
`Pour plus d'IDs, vour les titles00040000 sur la `[`Liste des Titles`](Liste_des_Titles "wikilink")

Les dossiers des titles ci-dessus contiennent deux sous-dossiers :
"content" et "data". Le dossier "content" contient : le fichier
00000000.tmd, des fichiers .app et un dossier cmd contenant
00000001.cmd. Tous sont cryptés avec une clé unique à chaque console. Le
dossier "data" contient 00000001.sav, c'est la sauvegarde cryptée du
title. Même si ces sauvegardes ressemblent aux sauvegardes FLASH, elles
utilisent un CTR approprié pour chaque bloc AES dans le fichier. Le CTR
change entièrement à chaque écriture de sauvegarde. Le fait de renommer
ces sauvegardes provoque un blocage du menu lors de l’exécution du
title. Le fait de modifier les sauvegardes provoque une corruption de la
somme de contrôle/ du hachage comme sur les sauvegardes flash.

Lors du renommage de "n'importe quel" dossier/fichier dans le dossier
"content", l'icône sur le menu Home est toujours affichée. Le fait de
modifier ces fichiers a le même effet que si vous les renommiez.

Si vous renommez le dossier/fichier cmd, ou bien le fichier
00000000.app, la banner 3D n'est plus affichée. Si vous renommez le
dossier cmd ou le fichier contenu dans ce dossier, le menu Home refusera
d’exécuter le title et le manuel ne fonctionnera pas (il affichera
l'écran noir disant que la carte SD n'est pas insérée). Le manuel ne se
lancera pas non plus si le fichier 00000001.app est renommé, se
pourrait-il que ce .app soit le manuel ? Si le fichier binaire principal
00000000.app est renommé, le title ne sera pas lancé et dans le manuel,
une marque substitutive est utilisée pour afficher le nom du title et
son icône. Le [menu Home](menu_Home "wikilink") ne soucie absolument pas
de si le tmd a été renommé.

## Private

Les données "Private" sont stockées ici:

`/Nintendo 3DS/Private/`

<Title ID Low>

/

`00020400 - Appareil Photo 3DS`
`00020500 - Studio son Nintendo 3DS`

Les données "Private" pour l'appareil photo et le studio son sont en
clair. Il y a un fichier [phtcahe.bin](phtcache.bin/FR "wikilink") dans
le dossier "Private" de l'appareil hpto, il semblerait qu'il liste les
photos présentes sur la carte SD. Si vous voulez installer des images et
les voir sur la 3DS, renommez-les avec (8 chiffres).mpo et
sauvegardez-les dans /DCIM. Dans le dossier "Private" du studio son, il
y a des fichiers voice/XX/\*.m4a. ( Où XX est un chiffre de 01 à 10,
avec le son encodé en .m4a)