Ce qui suit est une description des fonctions, et des applications
disponibles avec les 3DS de développement (DevKit), dérivé du SDK
révision 37904. Pour plus d'informations sur les kits de développement
3DS suivez ce
[lien](http://n-dev.net/showthread.php?tid=20&pid=53#pid53) (anglais).

<figure>
<img src="CTR_HMN_DEV.png" title="CTR_HMN_DEV.png" width="300" />
<figcaption>CTR_HMN_DEV.png</figcaption>
</figure>

### Menu de Développement (DEV MEN)

<figure>
<img src="Devmenuicon.jpg" title="File:Devmenuicon.jpg" />
<figcaption><a
href="File:Devmenuicon.jpg">File:Devmenuicon.jpg</a></figcaption>
</figure>

<img src="Devmenscnsht.jpg" title="Devmenscnsht.jpg" width="250"
alt="Devmenscnsht.jpg" /> Cette application affiche sur l'écran du haut
le numero de firmware (et sa révision) pour lequel l'application est
faite, l'espace libre disponible sur la partition du NAND TWL DSiWare
(stockage des applications DSiWare) et sur la carte SD si elle est
présente. Il fournit également des informations sur le fichier courant
ou périphérique sélectionné, ainsi que des instructions de navigation
pour l'écran du bas. L'écran du bas peut afficher trois fenêtres
différentes, qui sont:

- Programmes (Programs)- Depuis cette fenêtre, les applications peuvent
  être chargés depuis le Nand, la carte SD et la carte "slot 1". Elle
  montre le format de 'id unique' (nom de l'application si elle est
  stocké sur le nand / carte SD ou le type d'appareil, si elle est
  chargé à partir du slot 1). Les applications qui ne sont pas sur une
  carte dans le slot 1 peuvent-être supprimées via ce menu.

<!-- -->

- Importer (Import)- Depuis cette fenêtre, les applications (compilées
  pour être installées) au format .CIA (voir [CIA](CIA "wikilink"))
  peuvent être installées depuis une carte SD.

<!-- -->

- Données d'Extensions (ExtData)- Depuis cette fenêtre, il est possible
  de détruire les données additionnelles

(Notez que les jeux 3ds vendus dans le commerce ne sont pas reconnus par
les 3DSs de développement, l'application affiche alors «carte inconnue»
dans la fenêtre "Programmes" et ne montre aucun détail sur l'écran du
haut)

| Revision du Dev Menu | Types des titres accessibles              |
|----------------------|-------------------------------------------|
| ?- 32640 - 33437     | 0000(NAND Uniquement),0010,8004,8005,8011 |
| 35887                | 0000(NAND Uniquement),8004                |
| 37785 - 40909 -?     | 0000(NAND et SDMC),8004                   |

### Configuration (Config)

<figure>
<img src="Configicon.jpg" title="File:Configicon.jpg" />
<figcaption><a
href="File:Configicon.jpg">File:Configicon.jpg</a></figcaption>
</figure>

<img src="3DS_dev_configmenu.JPG" title="3DS_dev_configmenu.JPG"
width="250" alt="3DS_dev_configmenu.JPG" /> Cete application est un
simple menu de configuration pour 3DS, elle possèdes les options
suivantes:

- Restaurer les Paramètres (Reset Settings) - Remet les paramètres par
  défaut.

<!-- -->

- Paramètres Hid (Hid Setting) - Hid pour interface entre l'homme et la
  machine,(human interface device), Ils permettent de calibrer l'ecran
  tactile et le stick analogique.

<!-- -->

- Paramètres Rtc (Rtc Setting) - (real time clock) Permet de configurer
  l'heure de la machine.

<!-- -->

- Paramètres Lcd (Lcd Setting) - Définit les paramètres d'affichage que
  l'on trouve dans le menu d'accueil ainsi que les paramètres de
  luminosité.

<!-- -->

- Paramètres de l'utilisateur (User Info Setting) - Permet le changement
  nom d'utilisateur et le "NG NAME FLAG" (aux valeurs VRAI ou FAUX).

<!-- -->

- Autres Paramètres (Other Setting) Non apparents sur le menu principal
  de l'application -

-\>Réglage du Son - mono/stereo/surround

-\>Réglages Système - Changer les allocations de mémoire.

- Prod (connu) - Mode mémoire de 64 Mo (Le menu principal peut se lancer
  uniquement en mode 64 Mo)
- Dev1 - Mode mémoire de 96 Mo (Certainement non utilisé (3ds alors en
  phase de conception))
- Dev2 - Mode mémoire de 80 Mo (Certainement non utilisé (3ds alors en
  phase de conception))
- Dev3 - Mode mémoire de 72 Mo (Certainement non utilisé (3ds alors en
  phase de conception))
- Dev4 - Mode mémoire de 32 Mo (Mini application comme le bloc note ?)

Mais toutes les 3DS développeur n'ont pas la capacité de fonctionner
dans des modes autres que Prod. On ne sait pas pourquoi certaines unités
sont restreintes dans le mode Prod et certaines non. Cela n'a rien à
voir avec la version de l'application.On a fait le test avec la même
version de l'application sur 2 3DS, une pouvait passer dans un autre
mode que Prod mais l'autre ne pouvait pas.

-\>Exceptions (Exception handler)- Activer/Désactiver

-\>Break Stop (Points d'arrêts ?)- Activer/Désactiver

-\>Menu - (Home Menu/Test Menu) Le menu Test est une alternative à
l'interface par defaut de la 3DS le 'Home Menu' ou Menu Principal Voir
3DS [GUI](3DS_Development_Unit_GUI "wikilink") (anglais) pour plus
d'informations

-\> Langue (Language) - la même chose que dans les paramètres systèmes,
à cela qu'il y a une option "invalide"

-\>Forcer l'importation (Dlp Force Child Import) - Activer/Désactiver -
Normalement la 3DS télécharge les contenus jouables (Dlp) d'abord sur la
NAND et ne re-télécharge un contenu, écrasant l'ancienne version, que si
la version est superieure à celle qu'elle possède déjà en mémoire. En
activant cette option la 3DS télécharge automatiquement le contenu sans
tenir compted e la version. Utile uniquement à des fin de tests.

-\> Mode Debug - Activer/Désactiver

- Tester les Paramètres (Test Setting) - Teste la calibration de l'ecran
  tactile et du stick analogique

<!-- -->

- Paramètres d'avertissements (Eula Setting) - Permet à l'utilisateur de
  changer la "Agree Version" soit les :"ff.ff" les symboles sont
  interchangeables et varient entre aa et 99 (par défaut la combinaison
  est 00.00).

Traduction non terminé je terminerai plus tard... en attendant consultez
la page <http://3dbrew.org/wiki/3DS_Development_Unit_Software> (anglais)