Quand la 3DS ne trouve pas la puce *NAND*, elle affiche cette erreur :

<figure>
<img src="CTR_Bootrom_Error.jpg" title="CTR_Bootrom_Error.jpg"
width="500" />
<figcaption>CTR_Bootrom_Error.jpg</figcaption>
</figure>

## Procédure de *boot* de la 3DS

- 0 seconde - La console est mise sous tension et démarre le processus
  de *boot.*

<!-- -->

- 2 secondes - Le *BootLoader* tente d'initialiser la *NAND*. Si cette
  dernière est correctement initialisée, le processus de *boot*
  continue. Si l'initialisation est impossible (par exemple, la puce
  n'est pas connectée, endommagée, etc...) un écran d'erreur similaire à
  celui ci-dessus apparaît.

<!-- -->

- 3 secondes - Tout le *hardware* essentiel est maintenant actif.
  Vérification de tous les périphériques connectés puis lancement de
  celui éventuellement inséré dans le *slot 1*, si c'est une carte
  *auto-boot* (comme celles dans les bornes de démos, par exemple). Le
  [Menu Home](Menu_Home "wikilink") n'a pas encore été initialisé à ce
  stade, étant donné que certains jeux *auto-boot* contrecarrent
  quelques mesures de protection du [Menu Home](Menu_Home "wikilink") ,
  comme le contrôle parental ou les mises à jour forcées. Il est à noter
  que l'éxécution d'un logiciel *auto-boot* n'est pas enregistrée dans
  les journaux du [Menu Home](Menu_Home "wikilink"). Si aucun
  périphérique *auto-boot* n'est trouvé dans *le slot 1*, le [Menu
  Home](Menu_Home "wikilink") est finalement initialisé.

Note : Il semblerait que les périphériques*auto-boot* ne contournent pas
le zonage de la console. (La console affiche "Une erreur est survenue"
si la région ne correspond pas)

- 4 secondes - Les écrans LCD sont initialisés.

<!-- -->

- 7 secondes - Le [Menu Home](Menu_Home "wikilink") est complètement
  chargé.