Depuis son lancement, nous avons étudié la 3DS sous tous les angles et,
bien que nous ayons fait d'énormes progrès grâce aux efforts combinés de
nombre de contributeurs, il nous faut bien admettre que l'on
progresserait énormément si nous étions en mesure d'extraire le code
de*boot* ainsi que d'autres informations cachées sur le
[SoC](http://fr.wikipedia.org/wiki/Syst%C3%A8me_sur_puce) propriétaire
d'une Nintendo 3DS.

# Mise à jour au 06/07/2013

La collecte de fonds restera ouverte jusqu'à que nous atteignons les
2300 dollars nécessaires au décapsulage (comprenant les taxes en
vigueur) . Par conséquent, la collecte de fond est toujours valide.
Merci pour votre précieux support.

# Qu'est-ce que le décapsulage ?

En gros, lors de la conception de la 3DS, Nintendo a regroupé le CPU, le
DPU et le GPU sur ce que l'on appelle un
[SoC](http://fr.wikipedia.org/wiki/Syst%C3%A8me_sur_puce), propriétaire.
Les informations sensibles y sont en partie stockées, et y sont
vraisemblablement inscrites le lors du processus d'assemblage en usine.
Cependant, ces données ne sont pas accessibles depuis l'extérieur, cela
a en effet été conçu de sorte qu'elles n'en sortent jamais. Si le
travail a bien été fait, elles n'atteindront donc jamais la mémoire
principale de la 3DS et, par conséquent, les données qui sont privées
(algorithmes, clés de cryptage...), le restent.

Pour extraire ces données et ensuite procéder à une rétroingénierie, on
a souvent recours à ce que l'on appelle un **décapsulage** de la puce
concernée. C'est une action très délicate puisque qu'il faut d'abord
enlever l'époxy, puis retirer une à une les couches avant d'en prendre
des clichés en haute résolution afin de pouvoir reconstruire la logique
d'agencement des composants et circuits. Il faut bien entendu un
matériel adapté (MEB, pour microscope électronique à balayage), rarement
utilisé en dehors du contexte professionnel en raison de coûts et d'une
technicité bien trop élevés pour un simple 'hacker".

Le décapsulage de puces a déjà été utilisé par la communauté de
l'émulation pour étudier et extraire des donnés de puces propriétaires,
comme par exemple celles présentes dans les cartouches de la *SNES*. Ce
procédé a aussi été utile pour comprendre le fonctionnement d'autres
composants et ainsi créer des émulateurs plus proches du fonctionnement
réel de la machine originale.

# Est-ce légal ?

La rétroingéniérie est un droit garanti par l'article L122-6-1 du code
de la propriété intellectuelle en France.

Cependant nous ne prônons pas le piratage, aussi les donnés extraites du
processeur ne seront utilisées **que** pour nourrir la scène*Homebrew*
de la 3DS.

# Combien ça coûte ?

Nous avons obtenu un devis d'un laboratoire professionnel (comprenant le
démontage, décapsulage, retirage des couches, la microscopie... ) pour
400\$ par couche, ce qui reviendrait à un total de 2000\$ pour le tout,
selon eux. Il faut aussi prendre en compte le prix de la 3DS que nous
fournirons comme échantillon.

Le nombre de couches n'est qu'une estimation, tout simplement parce
qu'il est impossible de connaître le nombre effectif de couches dans le
[SoC](http://fr.wikipedia.org/wiki/Syst%C3%A8me_sur_puce) avant de
procéder au décapsulage. Dans le pire des cas, nous pensons qu'il y en
aura entre 8 et 10. Donc pour le moment, atteindre les 2000\$ nous
semble être un bon point de départ, nous aviserons plus tard pour savoir
si les couches éventuellement restantes valent le coup d'être
photographiées.

# Comment dois-je aider ?

Après en avoir discuté avec les autres contributeurs du site, nous
sommes parvenus à la conclusion que ce projet peut se révéler vraiment
intéressant et utile. Cependant, demander 2000\$ pour un simple hobby
est quelque peu délicat, bien que cela reste une somme très raisonnable
pour une levée de fonds.

Nous avons crée cette page dans le but de faire connaître cette levée de
fonds. C'est maintenant à votre tour de jouer, visiteurs de ce site.
Nous pensons aussi envoyer aux donateurs une copie des images produites
comme remerciement.

Pour vous rappeler, nous essayons d'envoyer une 3DS à un laboratoire
professionnel pour obtenir les photographies des différentes couches
séparées (en utilisant l'argent de cette levée de fonds). Les images
obtenues grâce au MEB seront par la suite reconstruites et utilisées
conjointement pour découvrir les secrets du *hardware* de la 3DS.

# Dans quelles mesures ce projet va-t-il faire vous progresser ?

Il nous est difficile de donner une réponse claire avant que le SoC ait
été décapsulé. Cependant, si l'on considère les précédentes expériences
avec la *SNES*, il est possible d'obtenir de bons résultats. Nous ne
pouvons en revanche pas vous garantir à 100% que cela fonctionnera aussi
bien, les technologies impliquées étant très différentes; il est
possible de rencontrer de nouvelles contraintes. Mais qui ne tente rien
n'a rien. Notre équipe d'experts bien qu'anxieuse, a hâte de décortiquer
minutieusement les entrailles du *SoC* la 3DS.

Par ailleurs, nous nous concentrerons principalement sur :

- la *rom* de *boot*, qui peut contenir des vulnérabilités nous
  permettant de prendre le contrôle du système
- les clés secrètes, cachées dans le*hardware* et utilisées pour les
  opération cryptographiques
- les algorithmes secrets, implémentés dans le*hardware* pour cacher les
  informations des curieux
- et peut être même plus !

# Comment puis-je aider ?

Si vous souhaitez contribuer à cette cause, vous pouvez le faire en
donnant [ici](http://n-dev.net/donate.php).

# Informations de contact

[Jl12](User:Jl12 "wikilink") s'occupe de la collecte des dons, et
délivrera les échantillons finaux au [laboratoire
professionnel](http://www.eaglabs.com/about-eag.html) pour le
décapsulage une fois la collecte de fonds terminée. Si vous avez des
questions supplémentaires, adressez-vous directement à gspeer012 (@)
gmail (.) com (en anglais)