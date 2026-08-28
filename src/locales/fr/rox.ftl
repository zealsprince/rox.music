# rox.music, français.
#
# Calqué sur en-CA. Ce qui manque ici retombe silencieusement sur l'anglais à
# l'exécution, donc c'est scripts/check-locales.ts qui fait remonter les trous,
# pas la page elle-même.
#
# Les noms de produits restent tels quels : rox, Foobar2000, CaTRoX, NekoRoX,
# MusicBee, Mp3tag, ReplayGain, gpui. On traduit ce qui se lit, pas ce qui se
# clique ni ce qui se tape.
#
# On tutoie. L'application dit « tu » partout et jamais « vous »
# (crates/rox-i18n/locales/fr), la voix de l'anglais est directe et personnelle,
# et quelqu'un qui lit la page puis installe rox ne devrait pas changer de
# registre en cours de route.
#
# Le vocabulaire suit celui de l'application, pour qu'un mot lu ici se retrouve
# dans les réglages : piste (et non titre, qui reste le champ de métadonnées),
# espace de travail, disposition (et non mise en page), préréglage, surcouche,
# fond, playlist, et attaque et total pour les types de signaux.
#
# Les guillemets sont « … », jamais "…". Les nombres sont déjà localisés
# (50 000, 0,3 seconde, 134 Mo, 100 %) ; garder ça.

## Cadre

skip-to-content = Aller au contenu

nav-home = Accueil rox
nav-main = Principal
nav-download = Téléchargement
nav-workspaces = Espaces de travail
nav-more = Plus
nav-github = rox sur GitHub
    .stars = rox sur GitHub, { $stars } étoiles

language-picker = Langue
language-missing = Ta langue n'y est pas ?
theme-toggle = Changer de thème
    .label = Basculer entre le thème clair et le thème sombre

footer-credit = rox est développé par [Andrew Lake (zealsprince)](@author) en Rust sur [gpui](@gpui), le framework d'interface derrière [Zed](@zed). Libre et open source sous [AGPL-3.0](@license).
footer-nav = Pied de page
footer-source = Code source
footer-irc = IRC
footer-irc-direct = Direct
footer-irc-web = Webchat
footer-bug = Signaler un bug
footer-translate = Aider à traduire

## Le site lui-même

# Le titre pour la recherche, pas la phrase écrite pour être lue. « Si
# Foobar2000 avait été écrit cette année » est la meilleure phrase et elle reste
# en h1 et sur la carte sociale, là où un humain la lit. Personne ne la tape
# dans Google.
#
# Celui-ci vise « foobar2000 alternative », la requête que rox peut réellement
# gagner. « linux music player » est imprenable face à vingt ans de listicles,
# et la poursuivre coûterait le seul terme qui convertit. 59 caractères en
# anglais, pour que Google l'affiche en entier ; une traduction a le même
# budget, et lâcher un nom de plateforme est le moyen le moins cher de faire de
# la place.
site-tagline = rox - alternative à Foobar2000 pour Linux, macOS, Windows

# Sous 160 caractères, sinon Google coupe en plein milieu de la phrase. Les
# plateformes sont déjà dans le titre, ce qui libère la place pour ce que le
# titre ne peut pas dire.
site-description = Lecteur de musique natif pour grandes bibliothèques locales bien taguées. Compose tes panneaux, partage tes thèmes en un fichier, fluide à 50 000 pistes.

# Les quatre cartes sociales sous static/social/ sont un seul et même fichier
# pour toutes les langues, et la phrase y est incrustée en anglais. L'alt doit
# donc dire ce qui est réellement écrit, et dire que c'est de l'anglais. Vaut
# pareil pour download-title, workspaces-title et viz-title.
social-image-alt = Le logo rox au-dessus de la phrase en anglais : if Foobar2000 was made in the current year

# Le nombre d'espaces de travail livrés, écrit en toutes lettres. Un chiffre
# sous dix se lit comme une fiche technique en plein milieu d'une phrase, et
# quels nombres s'écrivent en lettres, chaque langue en décide. Toute phrase qui
# donne le compte dit { workspace-count } et passe $count.
workspace-count = { $count ->
    [1] un
    [2] deux
    [3] trois
    [4] quatre
    [5] cinq
    [6] six
    [7] sept
    [8] huit
    [9] neuf
   *[other] { $count }
}

## Affirmations dans le graphe de données structurées

app-feature-panels = Interface en panneaux composables, détachables en fenêtres
app-feature-workspaces = Espaces de travail partageables portant disposition, palette et apparence
app-feature-tagging = Édition de tags approfondie, écritures atomiques et traitement par lots
app-feature-gapless = Lecture sans blanc
app-feature-dsp = Égaliseur, fondu enchaîné et ReplayGain
app-feature-exclusive = Sortie exclusive bit-perfect
app-feature-lyrics = Paroles synchronisées
app-feature-scrobbling = Scrobbling Last.fm

## Accueil

home-hero = Si Foobar2000 avait été écrit cette année.
    .lede = Un lecteur de musique pour ceux dont la bibliothèque locale est grande et taguée avec soin. Les panneaux, tu les composes toi-même ; un thème, c'est un seul fichier, à donner à qui tu veux. Natif sur Linux, macOS et Windows.
    .alt = rox avec l'espace de travail par défaut façon NekoRoX : bibliothèque, pochette, file d'attente et un panneau de spectre

home-speed = Une fenêtre en moins d'une seconde
    .body = rox tient dans un seul binaire et démarre avant que tu n'aies lâché la souris.

home-features = Ce qu'il y a dedans

home-closer = À toi d'en faire quelque chose
    .body = rox est livré avec { workspace-count } espaces de travail, à un clic dans la fenêtre d'accueil. Chacun est un fichier unique portant la disposition, la palette et les shaders qu'il utilise : modifiable, cassable, transmissible. [Les voir tous](/workspaces).

## Le tableau de mesures

benchmark-caption = Démarrage, mémoire et CPU au repos de sept lecteurs de musique sur une bibliothèque de 50 000 pistes
benchmark-player = Lecteur
benchmark-window-up = Fenêtre affichée
benchmark-loaded = Entièrement chargé
benchmark-memory = Mémoire
benchmark-idle-cpu = CPU au repos
benchmark-never-settles = ne se stabilise jamais

benchmark-method = J'ai mesuré tout cela moi-même, sur une seule machine (Ryzen 9 5950X, Linux/Wayland), avec la même bibliothèque de 50 000 pistes sur un SSD externe, chaque lecteur passé dans le même banc d'essai avec sa bibliothèque chargée. La mémoire est le PSS sur l'ensemble de l'arbre de processus. « Chargé » signifie que le CPU s'est stabilisé après le lancement ; le repos, c'est un lecteur en pause avec la fenêtre visible.
    .deadbeef = [DeaDBeeF](@deadbeef) se serait posé à 44 Mo et aurait gagné sur la mémoire, mais il n'a jamais eu de ligne : son analyseur MP3 part en segfault en plein import de cette bibliothèque, à chaque tentative. rox indexe les 50 000 pistes, y compris les fichiers tronqués sur lesquels il bute.

## La grille de fonctionnalités

features-library = Bibliothèque
features-playback = Lecture
features-looks = Apparence
features-daily = Au quotidien

feature-library = Une bibliothèque qui tient la charge
    .body = Un scanner parallèle lit les tags complets, les durées réelles et le codec propre à chaque fichier, pas un survol d'en-tête. La surveillance des dossiers survit aux renommages, et rien ne disparaît en silence.
    .link = Ce qui casse à 50 000 pistes

feature-tagging = Un tagage digne de confiance
    .body = Un éditeur complet, écritures atomiques et modifications par lots. Les notes vivent dans les fichiers eux-mêmes via FMPS et POPM. Recherche via MusicBrainz, iTunes et Deezer.
    .link = Face à Mp3tag

feature-cue = Les rips CUE se lisent comme des pistes
    .body = Un FLAC couvrant tout un disque, à côté de sa feuille cue, s'indexe en vraies lignes. Chaque segment se navigue, se scrobble, se trie et enchaîne sans blanc sur le suivant, exactement comme un fichier.
    .link = Comment fonctionnent les segments

feature-gapless = Lecture sans blanc
    .body = Un seul flux, avec lecture aléatoire, répétition et lire ensuite. Il se rétablit quand un périphérique audio disparaît, et les touches multimédias et la lecture en cours fonctionnent sur les trois plateformes.

feature-equalizer = Dix bandes et du bit-perfect
    .body = Un égaliseur dans sa propre fenêtre, un fondu enchaîné qui laisse tranquilles les enchaînements voulus d'un album, et une sortie exclusive qui dit ce que le matériel a réellement accepté.
    .link = ReplayGain et bit-perfect

feature-similarity = Trié à l'oreille
    .body = rox décrit tes pistes à partir de leur propre audio, tempo compris, et ordonne la suite par ressemblance. Tout tourne sur ta machine, sur tes fichiers, sans service dans la boucle.

feature-panels = Des panneaux que tu composes
    .body = Une quarantaine de types de panneaux, de la bibliothèque et la file d'attente aux grilles d'artistes, au spectre et au VU-mètre. Duplique-en un avec sa configuration, enregistre-le comme préréglage, ou détache-le dans une fenêtre.
    .link = Face à Foobar2000

feature-themes = Des thèmes qui tiennent dans un fichier
    .body = Un espace de travail est un fichier portant disposition, palette, apparence et shaders. Les palettes peuvent se teinter d'après la pochette en cours et basculer clair ou sombre avec l'image.
    .link = Les { workspace-count } livrés

feature-shaders = Des visuels qui écoutent
    .body = Écris un shader WGSL sur un panneau ou sur toute la fenêtre. Des signaux nommés issus du spectre circulent sur ses entrées, pour qu'une bande de grosse caisse pilote le réglage que tu lui désignes.
    .link = Shaders et signaux

feature-lyrics = Paroles et historique
    .body = Synchronisées ou simples, depuis des fichiers annexes, des tags ou lrclib, avec un éditeur qui réécrit là où il a lu. Un journal d'écoute alimente le panneau d'historique, les statistiques et le scrobbling.

feature-playlists = Des playlists qui survivent
    .body = Favoris, réorganisation par glisser, m3u dans les deux sens, et playlists intelligentes qui relancent une requête enregistrée au lieu de figer un instantané. Les entrées survivent au départ et au retour d'un fichier.

feature-binary = Un binaire, pas d'installeur
    .body = Une archive tar, un DMG ou un zip, plus l'AUR et un flake Nix. Le mode portable garde la bibliothèque et les réglages dans un dossier à côté de l'exécutable.
    .link = Le télécharger

## Le bouton de téléchargement, partout où il apparaît

download-cta = Télécharger rox
# %s est l'endroit où enhance.js insère le nom de la plateforme détectée. À
# garder : le script ne connaît aucune langue et ne sait que substituer, donc
# c'est ici que l'ordre des mots doit être bon.
download-cta-detected = Télécharger pour %s
download-packaged = Sous Arch ou NixOS ? [Installe-le plutôt depuis l'AUR ou le flake Nix](/download#packages).
download-meta = v{ $version } · Linux, macOS, Windows · [tous les téléchargements](@releases)

## Téléchargement

download-title = Télécharger rox pour Linux, macOS ou Windows
    .description = Télécharge rox gratuitement pour Linux, macOS ou Windows. Un binaire par plateforme, sans installeur et sans compte. Open source sous AGPL.
    .image-alt = Le logo rox au-dessus de la phrase en anglais : download for Linux, macOS and Windows

download-h1 = Télécharger rox
    .lede = Un binaire par plateforme. Pas d'installeur, pas de compte, rien qui tourne en arrière-plan une fois fermé.

download-released = publié le { $date }
download-notes = notes de version
download-missing = Aucun build { $platform } dans cette version. [Voir la page des versions](@releases).

install-linux-1 = Décompresse l'archive n'importe où.
install-linux-2 = Lance `./rox`.
install-macos-1 = Ouvre le DMG.
install-macos-2 = Glisse rox dans Applications.
install-windows-1 = Décompresse n'importe où.
install-windows-2 = Lance `rox.exe`.
install-windows-caveat = Si SmartScreen proteste, choisis Informations complémentaires, puis Exécuter quand même.

download-packages = Gestionnaires de paquets
    .body = Deux voies qui gardent rox à jour en même temps que le reste de ton système.

package-aur =
    .scope = AUR, compilé depuis les sources
    .body = Sur l'AUR sous le nom `rox-player`, co-maintenu par l'auteur de rox. N'importe quel assistant AUR fonctionne, ou clone le paquet et lance `makepkg -si` toi-même.
    .link = rox-player sur l'AUR

package-nix =
    .scope = directement depuis le flake
    .body = Le dépôt est un flake. La première commande lance rox sans rien installer, la seconde le place dans ton profil. Sous NixOS, ajoute le flake en entrée et tire `packages.default`, ou utilise l'overlay qu'il exporte.
    .link = flake.nix

download-cli = Le lancer depuis un terminal
    .body = Passe des fichiers ou des dossiers à rox et il les joue immédiatement, en remplaçant ce qui était chargé. Un dossier se déplie en les fichiers audio qu'il contient directement.
    .flags = `--enqueue` (ou `-e`) ajoute à la file d'attente au lieu de lire tout de suite. `--portable` garde la bibliothèque, les réglages et les caches dans un dossier `rox-data` à côté de l'exécutable, pour ce lancement. Pour rester portable d'un lancement à l'autre, dépose un fichier vide nommé `portable` à côté de l'exécutable, ou active l'option dans les réglages de comportement.

download-build = Le compiler toi-même
    .body = Avec Nix, `nix develop` puis `cargo run` te donnent un shell de développement portant la chaîne d'outils Rust et les bibliothèques que gpui charge à l'exécution. Sans Nix, il te faut Rust stable et les bibliothèques système de gpui depuis ta distribution. La [section développement du README](@readme-dev) donne la liste complète.

## Espaces de travail

workspaces-title = Espaces de travail rox - thèmes et dispositions partageables
    .description = Un espace de travail rox, c'est toute une apparence dans un fichier partageable : disposition, palette, apparence et les shaders qu'il utilise. Ils vont d'un hommage à Foobar2000 à un lecteur entièrement rendu en tramage 1 bit.
    .image-alt = Le logo rox au-dessus de la phrase en anglais : a whole look in one shareable file

workspaces-lede = Un espace de travail, c'est toute une apparence dans un fichier : disposition, palette, apparence et tous les shaders qu'il utilise, embarqués pour qu'une apparence importée arrive complète. Charge-en un depuis la fenêtre d'accueil ou les réglages, change ce que tu veux, et transmets le fichier pour que quelqu'un d'autre retrouve exactement la même chose. Les { workspace-count } ci-dessous sont livrés avec rox.

workspaces-critters = Comment Critters fait ça
    .body = Un espace de travail embarque ses shaders, code source et images compris, pour qu'une apparence qui rend toute l'application en impression 1 bit s'importe entière au lieu d'arriver sous forme de référence vers un fichier sur la machine de quelqu'un d'autre. Rien ne s'exécute avant ton approbation. [Shaders et signaux](/music-visualizer).

workspace-default = À quoi ressemble rox tel quel : surfaces translucides, teinte d'après la pochette désactivée.
    .alt = L'espace de travail Default de rox : une grille de pochettes à côté d'une playlist avec notes en étoiles, une barre de navigation en forme d'onde ambre en bas et des onglets pour la biographie, les paroles et les métadonnées.

workspace-foobar = Tout ce projet est une querelle avec cette disposition. Opaque, dense, décorations système activées, barre de menus là où elle a toujours été.
    .alt = L'espace de travail Foobar de rox : une disposition foobar2000 classique avec barre de menus, colonnes de filtre par artiste et album, un tableau de pistes dense avec compteurs de lecture et notes, et la pochette en bas à gauche.

workspace-catrox = Le skin CaTRoX pour foobar2000, connu et adoré, celui par qui tout a commencé.
    .alt = L'espace de travail CaTRoX de rox : le skin foobar2000 recréé, avec un rendu circulaire de la pochette en CD, une liste de champs de métadonnées à gauche et des pistes groupées par album avec des points de notation.

workspace-llama = WinAmp, tel que tu t'en souviens plutôt que tel qu'il était. Tahoma, sombre, sans décorations.
    .alt = L'espace de travail Llama de rox : un analyseur de spectre pointillé façon Winamp en haut, des commandes de lecture vertes et une liste de pistes dense en dessous, sans aucune décoration de fenêtre.

workspace-metro = Panneaux plats et lignes aérées avec la teinte d'après la pochette, pour que la palette suive ce qui passe.
    .alt = L'espace de travail Metro de rox : une grille pleine largeur de pochettes d'album avec les titres en dessous, et à droite un panneau de biographie d'artiste avec photo, étiquettes de genre et nombre d'auditeurs.

workspace-phosphor = Du monospace partout. Consolas, pas de pochette en lecture rapide, un terminal qui joue de la musique.
    .alt = L'espace de travail Phosphor de rox : du vert sur noir en monospace partout, une arborescence de dossiers à côté d'un tableau de pistes et une forme d'onde verte en bas, comme un terminal qui joue de la musique.

workspace-critters = Toute l'application en impression 1 bit. Un tramage ordonné sur chaque surface, des tons qui s'écrasent avec les infrabasses, et un mur de bruit derrière les panneaux qui bouge avec le morceau.
    .alt = L'espace de travail Critters de rox : toute la fenêtre rendue en tramage ordonné noir et blanc, avec une étagère incurvée de pochettes au-dessus d'une barre de navigation, une rangée de commandes, une bande de forme d'onde et un tableau de pistes, le tout posé sur un champ de bruit mouvant.

workspace-diffuse = Seulement l'album en cours, sur un voile doux tiré de sa propre pochette. Monochrome à dessein, pour que la couleur vienne de l'image, et la bibliothèque attend dans un tiroir sur le bord droit.
    .alt = L'espace de travail Diffuse de rox : une grande pochette d'album occupe la gauche de la fenêtre sur un dégradé flou de la même image, avec le titre, l'artiste et l'album à côté au-dessus d'une fine ligne de navigation, une rangée de commandes de lecture et un curseur de volume.

## Plus

more-title = En savoir plus sur rox
    .description = Les pages qui vivent hors de la navigation principale : la comparaison avec Foobar2000, ce qui compte dans un lecteur pour une bibliothèque locale, et comment rox fonctionne sur Linux, macOS et Windows.

more-lede = Les pages qui n'ont pas leur place dans la navigation, gardées là où on peut les retrouver plutôt que supprimées.

more-why = Pourquoi elles existent
    .p1 = Ces pages existent pour être trouvées. Quelqu'un qui cherche en { $year } une alternative à Foobar2000 sous Linux, ou qui essaie de savoir quel lecteur survit à une bibliothèque de cette taille, devrait atterrir sur une page qui lui répond, pas sur une page d'accueil écrite pour des gens qui savent déjà ce qu'est rox.
    .p2 = Elles sont hors de la navigation à dessein. Le site principal, c'est trois pages : ce qu'est rox, comment l'obtenir, à quoi il ressemble. Empiler le reste dans l'en-tête rendrait ce que tu es venu chercher plus difficile à trouver, un mauvais calcul pour tous ceux qui arrivent en sachant déjà ce qu'ils veulent.
    .p3 = Tu sais peut-être déjà tout cela sur rox et Foobar2000. Beaucoup de gens qui atterrissent ici ne le savent pas, et c'est pour eux. Chacune dit là où rox perd comme là où il gagne, et ne répète rien de ce que donne la [page d'accueil](/).

more-pages = Les pages
more-closer = Si tu préfères sauter tout ça, la [page de téléchargement](/download) est à deux clics d'un lecteur qui tourne, et le [code source](@repo) est la documentation la plus honnête ici.

## Les pages hors navigation

page-foobar2000-alternative = L'alternative à Foobar2000
    .blurb = Ce que Foobar2000 a réussi, là où il te laisse en plan, et ce que rox y fait. Y compris là où Foobar2000 garde l'avantage.

page-catrox = CaTRoX, reconstruit en natif
    .blurb = Le thème foobar2000 par lequel tout a commencé, qui l'a fait, et ce qu'il a fallu pour faire tourner cette apparence sans Windows en dessous.

page-nekorox = NekoRoX, et ce qu'il est devenu
    .blurb = Le fork de CaTRoX que j'ai maintenu pendant dix ans, pourquoi il s'est arrêté, et lesquels de ses panneaux existent dans rox aujourd'hui. Y compris AlphaRoX, le clair.

page-music-visualizer = La visualisation, et la couche en dessous
    .blurb = Panneaux de spectre et de forme d'onde, shaders WGSL sur n'importe quel panneau ou sur toute la fenêtre, et les signaux nommés tirés de l'audio qui les pilotent.

page-cue-sheets = Rips FLAC et CUE
    .blurb = Une image de disque entier et sa feuille, indexées en vraies pistes qui se naviguent, se trient, se scrobblent et enchaînent sans blanc.

page-mp3tag-alternative = Une alternative à Mp3tag pour Linux
    .blurb = Modifications par lots, une grille par fichier, et un chemin d'écriture qui copie, vérifie et renomme au lieu de modifier tes fichiers sur place.

page-musicbee-alternative = Une alternative à MusicBee
    .blurb = Ce que MusicBee fait et pas rox, ce que rox fait et pas MusicBee, et pourquoi la réponse honnête dépend de ton système.

page-replaygain = ReplayGain, et ce qu'il coûte
    .blurb = Ce que ReplayGain fait vraiment, gain par piste contre gain par album, mesurer les fichiers que personne n'a tagués, et pourquoi l'activer signifie renoncer au bit-perfect.

page-best-music-player = Le meilleur lecteur de musique pour une bibliothèque locale
    .blurb = Ce qui distingue vraiment les lecteurs une fois ta collection devenue sérieuse, et ce que donne le peloton sur 50 000 pistes.

page-linux = rox sous Linux
    .blurb = AUR et Nix, Wayland et X11, sortie exclusive ALSA, touches multimédias MPRIS, et le tableau de mesures où ne figurent que des lecteurs Linux.

page-windows = rox sous Windows
    .blurb = Un zip sans installeur, le mode portable, la sortie exclusive WASAPI, et un point de vue honnête sur la concurrence avec Foobar2000 sur ses terres.

page-macos = rox sous macOS
    .blurb = Apple Silicon, signé et notarisé, menus dans la barre système, sortie exclusive CoreAudio.

## Introuvable

notfound-title = Page introuvable
    .description = Cette page n'existe pas sur rox.music.
notfound-h1 = Rien par ici
notfound-nav = Retour en terrain connu

## Les trois pages de plateforme, cadre commun

platform-breadcrumb = rox sous { $platform }
platform-limits = Ce qu'il ne peut pas faire sous { $platform }
platform-closer = Pointe-le sur ta bibliothèque
    .body = Libre et open source sous AGPL. Pas de compte, et rien qui tourne en arrière-plan une fois fermé.
platform-more = Plus sur [à quoi il ressemble](/workspaces), la [comparaison complète avec Foobar2000](/foobar2000-alternative), ou ce que fait réellement la sortie exclusive ci-dessus, dans [ReplayGain et bit-perfect](/replaygain).

## Linux

linux = rox - un lecteur de musique natif pour Linux
    .description = Un lecteur de musique Linux natif pour les grandes bibliothèques locales. Sur l'AUR et en flake Nix, Wayland et X11, sortie exclusive ALSA, touches multimédias MPRIS, et une fenêtre en moins d'une seconde à 50 000 pistes.
    .h1 = Un lecteur de musique pour Linux, conçu pour Linux
    .lede = Pas un portage, pas une enveloppe Electron, et pas Foobar2000 sous Wine. Un binaire natif qui traite Linux comme une cible de première classe plutôt que comme la troisième.
    .aside = Une sortie exclusive qui rapporte ce que la carte a réellement accepté plutôt que ce que tu lui as demandé, et une apparence que tu construis ici et transmets à quelqu'un sous Windows. Si c'est le genre de chose dont Linux t'a privé, c'est ici que ça se trouve.
    .siblings = Le même lecteur sous [Windows](/windows) et [macOS](/macos).

linux-why = Le problème pour lequel il a été écrit
linux-why-1 = Les bons lecteurs Linux renoncent chacun à quelque chose. Le tagage de Tauon reste en surface. Strawberry ne se compose pas. Quod Libet n'est pas un lecteur qu'on aurait envie d'habiller. La pile qui fait à la fois les panneaux, le tagage approfondi et une culture du thème est coincée sous Windows depuis vingt ans.
linux-why-2 = Faire tourner cette pile sous Wine fonctionne jusqu'à ce que ça ne fonctionne plus. Un skin comme CaTRoX tient par des contournements empilés et, par endroits, du rendu Internet Explorer à l'intérieur de panneaux. À travers une couche de traduction, on voit vite quelle part relève de la chance, et chaque mise à jour du système est une occasion de le découvrir.
linux-why-3 = rox, c'est cette forme écrite nativement : une quarantaine de types de panneaux que tu disposes toi-même, une édition de tags à laquelle tu peux confier une vraie collection, et des thèmes qui voyagent dans un seul fichier.

linux-install = L'installer
linux-install-1 = Sous Arch, il est sur l'AUR sous le nom `rox-player`, co-maintenu par l'auteur. N'importe quel assistant fonctionne, ou clone et lance `makepkg -si` toi-même.
linux-install-2 = Le dépôt est aussi un flake, donc Nix et NixOS l'obtiennent sans étape d'empaquetage. La première commande lance rox sans rien installer, la seconde le place dans ton profil.
linux-install-3 = Partout ailleurs, décompresse l'archive et lance `./rox`. Un binaire, pas d'installeur, aucune trace quand tu le supprimes.

linux-display = Wayland et X11
linux-display-1 = Les deux, nativement, via gpui. Les décorations de fenêtre sont un réglage par espace de travail plutôt qu'une décision prise à la compilation, tu peux donc utiliser des décorations côté serveur sur une disposition et une fenêtre sans bordure sur la suivante, sans redémarrer dans un autre build.

linux-alsa = Sortie exclusive via ALSA
linux-alsa-1 = Le mode exclusif ouvre la carte directement sous la forme `hw:CARD=x,DEV=n`. C'est le seul nom ALSA sans dmix, sans plug et sans serveur de son sur le chemin, et c'est précisément ce qui en fait la seule voie qui refusera une fréquence qu'elle ne sait pas faire au lieu de rééchantillonner discrètement vers autre chose.
linux-alsa-2 = La contrepartie est honnête : tant que rox tient la carte en mode exclusif, il la tient. Rien d'autre sur le système ne joue par ce périphérique jusqu'à ce que tu arrêtes. rox te dit ce que le matériel a réellement accepté plutôt que ce que tu as demandé, donc un écart apparaît comme un chiffre au lieu d'un soupçon.
linux-alsa-3 = Le mode partagé est la valeur par défaut et se comporte comme toutes les autres applications de ton bureau.

linux-desktop = Intégration au bureau
linux-desktop-1 = Les touches multimédias et la lecture en cours passent par un vrai service MPRIS, donc playerctl, les widgets multimédias de GNOME et de KDE, et tout ce qui parle `org.mpris.MediaPlayer2` le voient sans configuration.
linux-desktop-2 = L'icône de barre système passe par StatusNotifierItem, et c'est ce qui rend la fermeture vers la barre sûre : si aucun hôte SNI ne tourne pour la recevoir, fermer la dernière fenêtre quitte au lieu de laisser un processus sans interface auquel tu ne peux plus revenir.

linux-benchmarks = Le tableau de mesures ne contient que des lecteurs Linux
linux-benchmarks-1 = Le tableau comparatif de ce site a été mesuré sous Linux contre des logiciels Linux : Elisa, fooyin, Quod Libet, Strawberry, Museeks et Tauon, tous sur une seule machine avec la même bibliothèque de 50 000 pistes. rox affiche une fenêtre en 0,3 seconde et se stabilise à 134 Mo. Le concurrent le plus léger qui arrive au bout du chargement consomme presque trois fois plus de mémoire.

linux-limit-arch = x86_64 uniquement. Il n'y a pas de build Linux aarch64, donc les cartes ARM et Asahi demandent une compilation depuis les sources.
linux-limit-plugins = Pas d'API de plugins, donc rien ici ne remplace un composant Foobar2000 précis dont tu dépends.

## Windows

windows = rox - un lecteur de musique pour Windows sans installeur
    .description = Un lecteur de musique Windows natif pour les grandes bibliothèques locales. Un zip sans installeur, le mode portable, la sortie exclusive WASAPI, une édition de tags approfondie, et des panneaux que tu composes toi-même.
    .h1 = Un lecteur de musique pour Windows, par quelqu'un qui a quitté Windows
    .lede = Foobar2000 est chez lui sous Windows, et il y est très bon. Cette page est honnête là-dessus, et sur les raisons précises pour lesquelles tu pourrais quand même vouloir rox.
    .aside = Ce que tu construis ici tient dans un fichier, et il s'ouvre à l'identique sur la machine Linux ou Mac posée à côté. Si une configuration à laquelle tu as consacré un week-end s'est déjà retrouvée coincée sur un seul système, c'est la partie qui vaut bien un après-midi.
    .siblings = Le même lecteur sous [Linux](/linux) et [macOS](/macos).

windows-awkward = Commençons par la partie gênante
windows-awkward-1 = Si tu es sous Windows, que ton installation Foobar2000 est réglée comme tu l'aimes et qu'elle est stable depuis des années, rox n'est pas un cran au-dessus. Foobar2000 a deux décennies de composants, une empreinte plus petite, et plus aucune surprise en réserve. Prétendre le contraire sur une page comme celle-ci serait un moyen facile de te faire perdre ton après-midi.
windows-awkward-2 = Les raisons de regarder quand même sont précises, et bien réelles. Tu veux le même lecteur et la même disposition sur la machine Linux ou Mac que tu utilises aussi. Tu veux un code lisible et une licence AGPL plutôt qu'un freeware fermé. Ou tu veux une culture du thème où toute une apparence tient dans un fichier que tu peux envoyer, au lieu d'un dossier de composants, de configurations et de scripts qui ne se réassemble que sur ta machine.

windows-install = L'installer
windows-install-1 = Décompresse n'importe où et lance `rox.exe`. Pas d'installeur, pas de service, pas d'entrée de désinstallation et rien qui tourne en arrière-plan une fois fermé.
windows-install-2 = Le mode portable garde la bibliothèque, les réglages et les caches dans un dossier `rox-data` à côté de l'exécutable, l'ensemble tient donc sur une clé. Passe `--portable` pour un lancement, ou dépose un fichier vide nommé `portable` à côté de l'exécutable pour que ce soit permanent.
windows-install-3 = Le binaire n'est pas signé, SmartScreen protestera donc la première fois. Informations complémentaires, puis Exécuter quand même. Les certificats de signature coûtent de l'argent qu'un lecteur gratuit n'a pas, et le dire vaut mieux que de faire passer l'avertissement pour un bug.

windows-wasapi = Sortie exclusive via WASAPI
windows-wasapi-1 = Le mode exclusif prend le point de terminaison en WASAPI exclusive, ce qui place la fréquence et la profondeur du fichier devant le convertisseur, sans rien entre les deux. rox rapporte ce que le périphérique a réellement accepté, donc si le matériel a discrètement refusé tes 192 kHz, tu le lis à l'écran plutôt que dans une discussion de forum.
windows-wasapi-2 = Tant qu'il tient le point de terminaison, rien d'autre sur la machine ne joue par ce périphérique. C'est ce que veut dire exclusif, et c'est la raison pour laquelle ce n'est pas la valeur par défaut.

windows-integration = Le reste de l'intégration Windows
windows-integration-1 = Les touches multimédias et l'incrustation de lecture en cours passent par SMTC, la même surface système qu'utilisent les applications intégrées, donc le panneau des touches de volume affiche le titre et les boutons de lecture fonctionnent.
windows-integration-2 = Il y a une icône de barre système avec fermeture vers la barre, fermer la dernière fenêtre laisse donc la musique tourner, et l'icône est le chemin du retour. Un espace de travail peut aussi retirer le cadre de la fenêtre, ou garder le cadre et n'abandonner que la bordure de redimensionnement, ce qui laisse intacts l'ombre, les dispositions Snap et Win+flèche, et ne sacrifie que le redimensionnement par les bords.

windows-limit-instance = Pas de verrou d'instance unique. Sous Linux et macOS, un second lancement remet ses fichiers au rox déjà ouvert ; sous Windows, il démarre une seconde copie.
windows-limit-signing = x86_64 uniquement, et le binaire n'est pas signé, attends-toi donc à SmartScreen une fois.
windows-limit-plugins = Pas d'API de plugins, un composant Foobar2000 précis n'a donc pas d'équivalent ici.

## macOS

macos = rox - un lecteur de musique natif pour macOS
    .description = Un lecteur de musique macOS natif pour les grandes bibliothèques locales. Apple Silicon, signé et notarisé, menus dans la barre système, sortie exclusive CoreAudio, et édition de tags approfondie.
    .h1 = Un lecteur de musique natif pour macOS
    .lede = Foobar2000 a désormais un vrai build Mac. Ce qu'il n'a pas sur Mac, c'est la raison pour laquelle les gens le configuraient sous Windows.
    .aside = Des menus là où macOS les place, une quarantaine de types de panneaux à disposer comme tu veux, et { workspace-count } apparences complètes à un clic dans la fenêtre d'accueil. Si configurer le lecteur est la partie que tu préfères, tu es au bon endroit.
    .siblings = Le même lecteur sous [Linux](/linux) et [Windows](/windows).

macos-gap = Ce qui manque sur Mac, précisément
macos-gap-1 = Foobar2000 v2 propose une version macOS officielle, et cette page ne va pas prétendre le contraire. Le hic, c'est que l'écosystème de composants et de skins, ce qui justifiait de passer un week-end à configurer une installation Windows, est resté côté Windows. Sur un Mac, tu obtiens le lecteur sans l'écosystème qui justifiait de le choisir.
macos-gap-2 = rox remet la composition et le thème : une quarantaine de types de panneaux disposés comme tu veux, dupliqués avec leurs propres configurations, détachés dans de vraies fenêtres, et toute une apparence enregistrée dans un fichier partageable. L'un des { workspace-count } espaces de travail livrés est une recréation de CaTRoX, ce qui dit assez honnêtement ce qu'il vise.

macos-install = L'installer
macos-install-1 = Ouvre le DMG et glisse rox dans Applications. Les versions sont signées avec un Apple Developer ID et notarisées, Gatekeeper le laisse donc s'ouvrir sans la danse du clic droit puis Ouvrir ni un détour par le panneau de sécurité.

macos-native = Il se comporte comme une application Mac
macos-native-1 = Les menus vivent dans la barre de menus système, là où macOS les attend, et pas dans une barre dessinée à l'intérieur de la fenêtre. Le bouton vert fait un plein écran natif, et en maintenant Option tu obtiens le zoom à la place.
macos-native-2 = Fermer la dernière fenêtre laisse rox dans le Dock au lieu de quitter, ce qui est la convention de la plateforme et la moitié macOS du comportement de fermeture vers la barre.

macos-coreaudio = Sortie exclusive via CoreAudio
macos-coreaudio-1 = Le mode exclusif pilote le périphérique via CoreAudio à la fréquence propre du fichier, et rapporte ce que le matériel a accepté plutôt que ce qui a été demandé. Utile surtout si tu as un DAC qui vaut la peine, et désactivé par défaut parce que retirer un périphérique au reste du système devrait être une décision prise exprès.

macos-limit-silicon = Apple Silicon uniquement. Il n'y a pas de build Intel, un Mac Intel demande donc une compilation depuis les sources.
macos-limit-xcode = Compiler depuis les sources demande Xcode, avec ou sans nix : gpui compile des shaders Metal à la compilation et nix ne peut pas livrer la chaîne d'outils Metal d'Apple.
macos-limit-plugins = Pas d'API de plugins, un composant Foobar2000 précis n'a donc pas d'équivalent ici.

## Meilleur lecteur pour une bibliothèque locale

best-breadcrumb = Meilleur lecteur de musique
best-title = Le meilleur lecteur de musique pour une bibliothèque locale en { $year }
    .description = Les applications de streaming et les lecteurs de bibliothèque ne se jugent pas sur les mêmes choses. Cinq critères qui distinguent vraiment les lecteurs de bureau une fois ta collection devenue sérieuse, mesurés sur 50 000 pistes.

best-lede = Pas la meilleure application musicale. Ce sont des clients de streaming et on les juge sur le catalogue et le prix. Ici, la question est plus modeste : quel lecteur de bureau tient le coup quand la musique est déjà sur ton disque et qu'il y en a beaucoup.

disclosure = Transparence
best-disclosure = rox est l'un des lecteurs de cette comparaison et ceci est son propre site, lis donc les critères d'abord et les chiffres ensuite. Les cinq restent valables, que tu finisses par télécharger quelque chose ou non.

best-criteria = Cinq choses qui les distinguent vraiment

best-criterion-size = Il doit survivre à la taille de ta bibliothèque
    .body = La plupart des lecteurs font leur démo sur quelques centaines d'albums. Les échecs intéressants commencent dans les dizaines de milliers, où l'analyse prend une soirée, le défilement saccade et la mémoire grimpe jusqu'à ce que quelque chose lâche. C'est le seul critère que tu ne peux pas évaluer sur une capture d'écran, et c'est celui qui décide si tu utiliseras encore la chose dans un an.

best-criterion-read = Il doit lire tes tags correctement
    .body = Un survol d'en-tête te donne un nom de morceau et une durée fausse. Lire en profondeur, c'est les tags complets, les durées réelles, et le codec, la fréquence et la profondeur propres à chaque fichier. C'est aussi indexer les fichiers aux tags cassés au lieu de les écarter en silence, parce qu'une bibliothèque qui perd discrètement 300 fichiers est pire qu'une qui l'admet.

best-criterion-write = Il doit te laisser réécrire les tags
    .body = Une collection qui a été soignée est une collection qu'on modifie. Modifications par lots, écritures atomiques pour qu'un plantage ne tronque pas un fichier, et des notes stockées dans les fichiers eux-mêmes plutôt que dans une base que tu ne peux pas emporter.

best-criterion-layout = La disposition doit être la tienne
    .body = Le goût est ici vraiment personnel, et c'est l'argument en faveur de la composition plutôt que d'un bon réglage par défaut. Des panneaux que tu disposes, dupliques avec leurs propres configurations et détaches dans de vraies fenêtres battent n'importe quelle disposition unique choisie par quelqu'un d'autre.

best-criterion-yours = Il doit rester le tien
    .body = Les bibliothèques locales, c'est ce sur quoi on se replie quand un service retire un album ou change ses conditions. Un lecteur qui répond à cela par un compte, de la télémétrie ou un abonnement est passé à côté du sens même de ce qu'il joue.

best-measured = À quoi ressemble le premier critère, mesuré
    .body = Sept lecteurs, une bibliothèque de 50 000 pistes, une machine, un banc d'essai. Le temps de démarrage et le coût au repos, c'est ce que tu sens passer tous les jours.

best-shortlist = La sélection honnête
    .p1 = Si tu es sous Windows et que tu utilises déjà [Foobar2000](/foobar2000-alternative), tu as la réponse et tu l'as depuis vingt ans. Rien sur cette page ne bat une installation Foobar2000 qui marche, sur sa propre plateforme.
    .p2 = Si tu veux quelque chose avec un large écosystème de plugins et un long passé sous Linux, Quod Libet et Strawberry sont deux vraies réponses, et tous deux mettent plus de temps à charger une bibliothèque de cette taille qu'ils ne sont agréables une fois chargés. Si le critère du tagage est celui qui t'intéresse vraiment, il est traité à part comme [alternative à Mp3tag](/mp3tag-alternative), et le versant sonore du premier critère est couvert dans [ReplayGain](/replaygain).
    .p3 = rox est la réponse si tu veux la forme Foobar2000 nativement sous Linux ou macOS : des panneaux que tu composes, un tagage approfondi, des thèmes en un fichier partageable, et un lecteur qui affiche une fenêtre en moins d'une seconde face à une bibliothèque de cette taille. Il est jeune, et il n'a pas d'API de plugins. Ce sont deux coûts réels.
    .aside = Les cinq critères ci-dessus sont le plancher, pas le plafond. Les notes vont dans les fichiers eux-mêmes via FMPS et POPM plutôt que dans une base que tu ne peux pas emporter, et les genres à valeurs multiples fusionnent comme un avis de la bibliothèque au lieu de réécrire tes tags. Si c'est le genre de chose que tu attendais d'une bibliothèque, voilà celui à pointer sur ton disque.

best-closer = Mesure-le sur ta propre collection
    .body = Le test qui compte, c'est celui sur ton disque. Libre et open source, sans compte, sans installeur.

## MusicBee

musicbee-breadcrumb = Alternative à MusicBee
musicbee-title = Une alternative à MusicBee pour Linux et macOS en { $year }
    .description = MusicBee est réservé à Windows. rox est un lecteur natif pour les grandes bibliothèques locales sous Linux, macOS et Windows, avec un tagage approfondi et une disposition que tu composes toi-même. Y compris ce que MusicBee fait toujours mieux.

musicbee-h1 = Une alternative à MusicBee qui ne se limite pas à Windows
    .lede = Le problème de MusicBee, vu depuis une machine Linux ou Mac, c'est qu'il est excellent et qu'il n'est pas là. Cette page parle de ce qui se transpose vraiment et de ce qui ne se transpose pas.

musicbee-good = Ce que MusicBee fait bien
    .p1 = L'étendue. Il gère correctement une grande bibliothèque, s'occupe des listes automatiques et de l'automatisation de la file d'attente, se synchronise avec des baladeurs, fait les podcasts et la radio en ligne, convertit les formats, et se laisse habiller en quelque chose que tu aimes regarder. Il est gratuit, il est soigné, et pour beaucoup de gens c'est le dernier lecteur de musique qu'ils ont eu à installer.
    .p2 = Il tourne aussi sous Windows et nulle part ailleurs. Wine t'en donne une version, avec la réserve habituelle : ça marche jusqu'à ce qu'une mise à jour en décide autrement.

musicbee-gaps = Ce que rox ne fait pas
    .body = On commence par là, parce que c'est la partie qui tranche la question pour beaucoup de gens, et que l'enterrer te ferait perdre du temps.
    .close = Quatre points réels, et la liste n'a pas été gonflée pour avoir l'air honnête. Si deux d'entre eux font partie de ta façon d'utiliser un lecteur, arrête-toi ici.

musicbee-gap-sync = **Pas de synchronisation d'appareils.** Si tu transfères de la musique vers un téléphone ou un baladeur depuis ton lecteur, rox n'a strictement rien à proposer.
musicbee-gap-radio = **Pas de podcasts ni de radio en ligne.** rox lit les fichiers de ton disque.
musicbee-gap-plugins = **Pas d'API de plugins.** Ce que tu aurais résolu avec une extension doit déjà exister.
musicbee-gap-ffmpeg = **La conversion demande ffmpeg.** rox convertit entre formats, mais il pilote un ffmpeg que tu as installé au lieu d'embarquer son propre encodeur, et il ne réencode pas en route vers un appareil puisqu'il n'y a pas de synchronisation qui le demanderait.

musicbee-transfers = Ce qui se transpose, et ce qu'on y gagne
    .p1 = La bibliothèque tient le coup à la taille qu'atteignent généralement les utilisateurs de MusicBee. Un scanner parallèle lit les tags complets, les durées réelles et le codec, la fréquence et la profondeur propres à chaque fichier plutôt que de survoler les en-têtes, et les fichiers aux tags illisibles sont indexés par nom de fichier au lieu de disparaître en silence. L'édition de tags est un vrai éditeur, avec modifications par lots, une grille par fichier, et un [chemin d'écriture qui copie et vérifie](/mp3tag-alternative) au lieu de modifier les originaux sur place.
    .p2 = L'interface est la plus grosse différence. MusicBee te donne une bonne disposition et un peu de personnalisation ; rox te donne une quarantaine de types de panneaux que tu disposes toi-même, dupliques avec leurs propres configurations et détaches dans de vraies fenêtres système. Toute une apparence tient dans un fichier portant disposition, palette et apparence, ce qui veut dire que l'agencement sur lequel tu t'arrêtes est quelque chose que tu peux transmettre, ou emporter sur ton autre machine, plutôt que quelque chose qui vit sur une seule installation.
    .p3 = Les listes automatiques se transposent. Une playlist intelligente dans rox est une requête enregistrée écrite dans la syntaxe du champ de recherche, avec tri et plafond facultatifs, et elle est réévaluée à chaque rafraîchissement du panneau au lieu de figer un instantané périmé. L'éditeur montre en direct ce que la requête capte pendant que tu la tapes, tu découvres donc que tu as écrit la mauvaise règle avant de l'enregistrer sous un nom.
    .p4 = L'automatisation de la file d'attente est là aussi : rox remplit la file quand elle se vide, depuis ton ordre de navigation, depuis les pistes que tu remets toujours à plus tard, ou selon la sonorité de la piste en cours. Ce dernier point vient de l'analyse de tes fichiers sur ta propre machine, il fonctionne donc sur une bibliothèque dont rien sur Internet n'a jamais entendu parler.

musicbee-size = La question de la taille
    .body = MusicBee n'est pas dans ce tableau, parce que les mesures ont été faites sous Linux, où il ne tourne pas. Il est là comme réponse à « est-ce que l'alternative s'écroule à la taille de ma bibliothèque », mesurée sur 50 000 pistes.

musicbee-split = Le verdict honnête
    .p1 = Tu restes sous Windows avec une installation MusicBee qui synchronise ton téléphone et l'alimente en podcasts ? Rien ici ne remplace ça, et changer te coûterait deux fonctions dont rox n'a aucune version.
    .p2 = Tu passes à Linux ou sur un Mac, ou tu y es déjà et tu regardes le vide laissé par MusicBee ? C'est toute la raison d'être de ceci, et les termes de l'échange sont précis : tu abandonnes la synchronisation et les podcasts, et tu obtiens un lecteur natif avec un tagage plus profond, une disposition que tu construis toi-même, et une bibliothèque qui reste rapide à cinquante mille pistes.
    .aside = Détacher un panneau dans sa propre fenêtre système, ou transmettre toute ta disposition sous forme d'un fichier, ne sont pas des lignes d'un tableau comparatif parce qu'il n'y a rien en face à quoi les comparer. Si c'est ce que tu cherchais, c'est dans rox que ça se trouve.

musicbee-closer = Mets-le à l'épreuve de ta propre bibliothèque
    .body = Libre et open source sous AGPL, sans compte et sans installeur. Il y a aussi une [comparaison avec Foobar2000](/foobar2000-alternative), si c'est vraiment la configuration que tu quittes.

## CaTRoX

catrox-title = CaTRoX, reconstruit en lecteur natif
    .description = Le thème CaTRoX pour foobar2000, qui l'a construit, et ce qu'il a fallu pour faire tourner cette apparence nativement sous Linux et macOS, sans Windows ni Wine en dessous.

catrox-h1 = CaTRoX, sans Windows en dessous
    .lede = rox est livré avec un espace de travail CaTRoX. Voici pourquoi, et à qui il le doit.

catrox-credit = Le mérite à qui de droit
    .body = CaTRoX est un thème pour foobar2000. Le design et la palette d'origine sont d'eXtremeHunter1972, et l'édition que la plupart des gens ont réellement utilisée est [CaTRoX_QWR](https://theqwertiest.github.io/CaTRoX_QWR/), reconstruite et maintenue par TheQwertiest. rox n'est affilié ni à l'un ni à l'autre, et rien ici n'est leur code. L'espace de travail ci-dessous est une recréation d'une apparence qu'ils ont faite.

catrox-was = Ce qu'était CaTRoX
    .p1 = Une disposition dense, sombre et orientée information pour foobar2000 : la pochette rendue en CD, une liste de champs de métadonnées sur un côté, des pistes groupées par album avec des points de notation, et une barre de menus exactement là où va une barre de menus. C'est ce que les gens veulent dire quand ils disent que foobar2000 peut être beau, et c'est en grande partie pour ça que des gens ont accepté de configurer foobar2000.
    .p2 = Ça n'a jamais été un skin au sens où un lecteur de musique l'entend d'habitude. CaTRoX est une pile de composants, de scripts de panneaux et de configuration, assemblée. C'est ce qui le rendait puissant, et c'est aussi ce qui le rend difficile à déplacer, difficile à partager et facile à casser.

catrox-nekorox = Où NekoRoX entre en jeu
    .p1 = L'auteur de rox en a maintenu un fork pendant des années. [NekoRoX](/nekorox) était CaTRoX avec un tas de panneaux, plugins et modules de confort par-dessus : navigation par arborescence et par filtres, modes mini et micro lecteur, un panneau de paroles synchronisées, un défilement de pochettes, la présence Discord, des outils Last.fm. Il y a maintenant une note en haut de son README disant qu'il n'est plus maintenu, et pointant ici.
    .p2 = La raison de cette note est le contenu honnête de cette page. Passer à Linux à plein temps voulait dire faire tourner tout l'assemblage sous Wine, et une pile tenue par des contournements empilés, rendant par endroits Internet Explorer dans des panneaux, ne fait pas bon ménage avec une couche de traduction. Ça tournait. Ça donnait aussi l'impression d'être à une mise à jour de s'arrêter définitivement, avec dix ans de configuration à l'intérieur.

catrox-recreation = La recréation
    .body = L'espace de travail CaTRoX dans rox, c'est cette disposition reconstruite à partir de panneaux natifs : le rendu circulaire de la pochette, la liste de champs de métadonnées, la liste de pistes groupée par album avec ses points de notation, la barre de menus. C'est une apparence, reproduite, pas un portage de quoi que ce soit. Aucun code de CaTRoX n'existe dans rox et aucun ne le pourrait, puisque rox est du Rust sur [gpui](@gpui) et CaTRoX des scripts de panneaux tournant dans foobar2000. La discussion plus large avec foobar2000, y compris les lignes où il garde l'avantage, est sur [sa propre page](/foobar2000-alternative).
    .after = Ce qui a changé, c'est ce qu'il faut pour l'avoir. Dans rox, toute une apparence est un seul fichier tenant ensemble disposition, palette et apparence, l'espace de travail CaTRoX est donc à un clic dans la fenêtre d'accueil, et ce que tu en construis tient dans un fichier que tu peux transmettre. Pas de liste de composants, pas d'ordre d'installation, pas de configuration qui ne se réassemble que sur la machine où elle a été construite.

catrox-shot-alt = L'espace de travail CaTRoX dans rox : un rendu circulaire de la pochette en CD, une liste de champs de métadonnées à gauche avec titre, artiste, album, codec et débit, et à droite des pistes groupées par album avec des points de notation.

catrox-limits = Ce que tu ne récupères pas
    .aside = Ce que tu obtiens à la place, c'est une disposition qui s'ouvre sous Linux et macOS sans Wine à proximité, survit à une mise à jour du système, et voyage dans un fichier. Après une décennie à maintenir l'original, ce compromis est toute la raison d'être de rox.

catrox-limit-panels = Tous les panneaux de CaTRoX n'ont pas d'équivalent. rox a une quarantaine de types de panneaux à lui et ce ne sont pas les mêmes quarante.
catrox-limit-youtube = Pas de lecture YouTube. CaTRoX et NekoRoX l'avaient tous deux via des composants ; rox lit ce qui est sur ton disque.
catrox-limit-plugins = Pas d'API de plugins, donc ce que tu aurais résolu avec un composant foobar2000 doit déjà exister dans rox ou n'existe pas du tout.
catrox-limit-fidelity = C'est une recréation faite de l'extérieur. Les détails diffèrent, et une correspondance au pixel près n'a jamais été le but.

# $others, c'est le nombre d'espaces de travail livrés moins celui-ci. Ça
# disait « Cinq » en toutes lettres, ce qui a cessé d'être vrai il y a deux
# espaces de travail.
catrox-closer = Essaie-le
    .body = L'espace de travail CaTRoX est livré avec, à un clic dans la fenêtre d'accueil. { $others } autres l'accompagnent, dont une [disposition Foobar et une autre à la WinAmp](/workspaces).

## Feuilles cue

cue-breadcrumb = Feuilles cue
cue-title = Lire les rips FLAC et CUE, une piste à la fois
    .description = Une image de disque entier à côté d'une feuille cue, indexée en vraies pistes : chaque segment se navigue, se trie, se scrobble et enchaîne sans blanc sur le suivant, et tes playlists ne sauront jamais que trois lignes partagent un fichier.

cue-h1 = Les feuilles cue, et des rips qui se comportent comme des albums
    .lede = Si tu as rippé des CD avant que le découpage devienne la norme, une partie de ta bibliothèque est un FLAC par disque avec un fichier texte à côté. La plupart des lecteurs ignorent la feuille ou traitent ce qu'elle décrit comme de seconde zone. Voici ce que rox en fait.

cue-what = Ce qu'est vraiment un rip cue
    .p1 = Un fichier audio contenant un disque entier, et une feuille `.cue` listant où commence chaque piste. C'est la manière fidèle de conserver un CD, parce que les blancs entre les pistes font partie du disque et que le découpage les jette. C'est aussi le format qui casse l'hypothèse sur laquelle repose toute bibliothèque musicale : qu'un fichier est une piste.
    .p2 = Les lecteurs règlent cela de trois façons. Ignorer la feuille et afficher une piste de soixante-dix minutes. Afficher les pistes de la feuille mais les tenir à l'écart de la vraie bibliothèque, de sorte que la recherche, le tri et les playlists se comportent différemment pour elles. Ou rendre la rupture réelle et l'absorber une bonne fois.

cue-rows = De vraies lignes, pas des fragments
    .p1 = rox indexe chaque segment de la feuille comme une ligne ordinaire de la bibliothèque, identifiée par son fichier plus son numéro de piste. Tout ce qui vient ensuite le lit comme une piste, parce que pour tout ce qui vient ensuite c'en est une. Les playlists le figent, les écoutes s'y rattachent, la recherche le trouve, les colonnes de tri le trient, et aucune d'elles ne sait que onze lignes pointent sur le même FLAC.
    .p2 = L'alternative que choisissent la plupart des implémentations est un chemin synthétique, `album.flac#3`, qui garde la base propre et déplace le problème sur chaque morceau de code qui ouvrira ce chemin plus tard. Un suffixe que ce code oublie de retirer devient un bug silencieux qui lit des octets de tags dans le vide. Une bibliothèque sans feuilles cue ne paie rien de tout ça : les segments vivent dans une table annexe, et rien sur les chemins critiques ne les lit.

cue-playing = Lire un segment comme un fichier
    .p1 = Le moteur traite un segment comme le monde entier pour cette piste : un positionnement précis sur son début, une coupe à l'échantillon près des deux côtés, et une limite de fin qui emprunte le même chemin qu'une vraie fin de fichier. Le sans-blanc, le fondu enchaîné, l'arrêt après la piste en cours et la boucle fonctionnent tous sans savoir que les segments existent.
    .p2 = La coupe de tête est le détail qui compte. Un positionnement précis atterrit sur une frontière de paquet plutôt que sur l'échantillon exact, donc sans jeter les trames entre l'atterrissage et le début du segment, chaque piste s'ouvre sur la queue de la précédente. C'est le son d'une implémentation cue que personne n'a terminée.
    .p3 = Les pistes consécutives d'un même rip partagent un groupe d'album, et c'est ce qui empêche le fondu enchaîné de fondre par-dessus les enchaînements sans blanc propres au disque. Un rip se lit comme le disque dont il a été tiré.

cue-scanning = L'analyse, et le droit de changer d'avis
    .p1 = La feuille revendique son image. Tant qu'un cue liste un fichier, ce fichier n'obtient pas de ligne à lui, tu ne te retrouves donc pas avec onze pistes plus un doublon de soixante-dix minutes. C'est le plus récemment modifié des deux qui fait foi, modifier la feuille ou l'audio redécoupe donc le rip à la prochaine analyse. Supprime la feuille et l'image se replie en une seule ligne ordinaire.
    .p2 = Les métadonnées préfèrent la feuille et retombent sur les tags propres à l'image. Les feuilles écrites avant que la discipline UTF-8 existe obtiennent un repli cp1252, parce que les vieux rips sont exactement la population visée par cette fonction.

cue-ratings = Des notes qui n'estampillent pas tout le disque
    .p1 = rox écrit normalement les notes dans les fichiers eux-mêmes, ce qui est le bon choix tant qu'un fichier est une piste. Sur un rip cue, ce ne l'est plus : l'image appartient aux onze pistes, une écriture par piste estampillerait donc chacune d'elles avec les mêmes étoiles.
    .p2 = Le module d'écriture refuse la partie fichier pour ces lignes et la base conserve la valeur. Pareil pour les modifications de tags. Tu obtiens des notes par piste sur un rip, et ton image en ressort identique octet pour octet.

cue-outstanding = Hors périmètre, pour l'instant
    .body = Les crêtes de forme d'onde et la passe d'analyse acoustique lisent encore l'image entière plutôt que le segment. Les paroles sont par fichier, un rip partage donc une seule feuille de paroles. La mesure ReplayGain par segment, l'édition de feuilles cue dans l'application et les blocs CUESHEET intégrés au FLAC ne sont pas traités. Chacun s'ajoute par-dessus la façon dont les segments sont identifiés, et aucun ne la change.

cue-later = Les détails que tu ne remarquerais que plus tard
    .aside = Le vrai test n'est pas de savoir si un rip se lit. C'est de savoir si, un mois plus tard, quoi que ce soit dans la bibliothèque se comporte encore différemment parce que ça venait d'une image.

cue-later-m3u = L'export m3u écrit les segments sous la forme `path#N`, et l'import préfère une correspondance de chemin exacte, une playlist fait donc l'aller-retour par d'autres logiciels sans s'effondrer sur l'image.
cue-later-scrobble = Le scrobbling et la lecture en cours dédoublonnent sur la paire, les onze pistes d'un disque se scrobblent donc comme onze pistes plutôt qu'une seule très longue.
cue-later-listens = Les écoutes se rattachent par segment après une nouvelle analyse, un disque garde donc son historique de lecture par piste même quand chaque segment porte des tags identiques.
cue-later-replaygain = Seule la paire album des valeurs ReplayGain est reprise. Les valeurs par piste écrites contre une image de disque entier décrivent le disque, elles sont donc ignorées plutôt que crues.

cue-closer = Pointe-le sur l'étagère que tu n'as jamais découpée
    .body = Le scanner ramasse les feuilles dès sa première passe, en même temps que tout le reste. Plus sur [ce qui casse à l'échelle d'une bibliothèque](/best-music-player).

## Foobar2000

fb-breadcrumb = Alternative à Foobar2000
fb-title = Une alternative à Foobar2000 pour Linux, macOS et Windows en { $year }
    .description = Foobar2000 a réussi les dispositions en panneaux, le tagage approfondi et une culture du thème, et en a laissé l'essentiel coincé sous Windows. rox est un lecteur natif et open source qui porte les trois vers Linux et macOS.

fb-h1 = Une alternative à Foobar2000 qui tourne partout
    .lede = Foobar2000 a réussi trois choses que presque rien d'autre ne réussit à la fois, et en a laissé deux coincées sous Windows. rox est la tentative de faire passer les trois.

fb-right = Ce que Foobar2000 a réussi
    .p1 = Une interface que tu assembles à partir de panneaux au lieu d'accepter ce que le développeur a livré. Par-dessus, une culture du thème, et c'est grâce à elle que CaTRoX, [NekoRoX](/nekorox) et Georgia existent. Et une gestion des tags et de la bibliothèque qui ne s'écroule pas quand la collection fait des dizaines de milliers de fichiers.
    .p2 = Beaucoup de lecteurs en font un. Très peu en font deux. La pile qui fait les trois est de fait réservée à Windows depuis vingt ans, et chaque tentative de la déplacer s'est payée par l'abandon de l'un des trois.

fb-leaves = Là où il te laisse en plan
    .p1 = Sous Linux il n'y a pas de build Foobar2000 officiel, les options honnêtes sont donc Wine ou autre chose. Wine fonctionne jusqu'au moment où il ne fonctionne plus. Un skin comme CaTRoX s'appuie sur des contournements empilés et, par endroits, sur du rendu Internet Explorer dans des panneaux, et le faire passer par une couche de traduction montre exactement quelle part tient à la chance. Chaque mise à jour du système est une occasion de tout casser.
    .p2 = macOS va mieux qu'avant, depuis que Foobar2000 v2 livre un vrai build Mac. Mais la partie que les gens veulent vraiment, l'écosystème de composants et de skins qui justifiait de passer un week-end à configurer la version Windows, est resté côté Windows. Tu obtiens le lecteur sans la raison pour laquelle tu voulais le lecteur.
    .p3 = Et sous Windows lui-même, rien ne va mal. Cela mérite d'être dit clairement : si tu es sous Windows et que ton installation Foobar2000 fonctionne, rox n'est pas une urgence.

fb-does = Ce que rox y fait
    .p1 = Natif sur les trois plateformes, un binaire par plateforme, écrit en Rust sur [gpui](@gpui). Une quarantaine de types de panneaux que tu disposes toi-même, dupliques avec des configurations indépendantes et détaches dans de vraies fenêtres système. Le scanner de bibliothèque lit les tags complets, les durées réelles et le codec, la fréquence et la profondeur propres à chaque fichier plutôt que de survoler les en-têtes, et il tient à 50 000 pistes.
    .p2 = La réponse en matière de thème est ce qui a le plus changé. Un espace de travail est un seul fichier tenant ensemble disposition, palette et apparence. Tu le modifies, tu le casses, tu le donnes à quelqu'un et cette personne obtient exactement ce que tu avais. L'un des { workspace-count } livrés est une [recréation de CaTRoX](/catrox), ce qui dit assez honnêtement ce qu'il vise.

fb-shot-alt = L'espace de travail CaTRoX dans rox : le skin foobar2000 recréé nativement, avec un rendu circulaire de la pochette en CD, une liste de champs de métadonnées à gauche et des pistes groupées par album avec des points de notation.

fb-table = Côte à côte
    .caption = Foobar2000 et rox comparés sur le support des plateformes, le thème, la licence et la maturité
    .area = Domaine
    .method = Trois lignes vont à Foobar2000, et ce sont les trois qu'il faudrait des années pour combler. Un tableau comparatif où une colonne gagne partout est une publicité, pas une comparaison.

fb-row-linux = Natif sous Linux
    .fb = Pas de build officiel. Wine uniquement.
    .rox = Cible de premier ordre, x86_64.

fb-row-macos = Natif sous macOS
    .fb = Build officiel depuis la v2.
    .rox = Cible de premier ordre, Apple Silicon.

fb-row-windows = Natif sous Windows
    .fb = Chez lui, depuis plus de vingt ans.
    .rox = Cible de premier ordre, x86_64.

fb-row-panels = Des panneaux à composer
    .fb = Oui, via Columns UI et compagnie.
    .rox = Une quarantaine de types de panneaux, intégrés, aucun composant à installer.

fb-row-sharing = Partager une apparence
    .fb = Un skin, ce sont des composants, des configurations et des scripts. Réputé pénible.
    .rox = Un fichier portant disposition, palette et apparence.

fb-row-source = Code disponible
    .fb = Freeware à code fermé.
    .rox = AGPL-3.0, en entier.

fb-row-components = Écosystème de composants
    .fb = Vingt ans d'accumulation. Tout ce que tu peux imaginer.
    .rox = Pas d'API de plugins.

fb-row-maturity = Maturité
    .fb = Depuis 2002. Il ne te surprend pas.
    .rox = Depuis 2026. Il te surprendra, à l'occasion.

fb-row-footprint = Empreinte
    .fb = Réputé minuscule.
    .rox = Un binaire de 62 Mo, 134 Mo en mémoire à 50k pistes.

fb-not = Qui ne devrait pas changer
    .p1 = Si tu es sous Windows, que tes composants sont réglés et que l'installation est stable depuis une décennie, rien ici ne vaut le dérangement. Si tu dépends d'un composant Foobar2000 précis, rox n'a pas d'API de plugins et ne peut pas le remplacer. Si tu veux un logiciel qui a déjà fait toutes ses erreurs, rox est quatre ans trop jeune.
    .p2 = Si tu es passé à Linux en laissant l'installation derrière toi, ou si tu es sur un Mac avec un lecteur privé de l'écosystème qui le justifiait, c'est le vide dans lequel ceci a été construit.
    .p3 = L'autre versant d'arriver tard mérite d'être dit. Rien dans rox ne doit rester compatible avec une décision prise en 2002, et c'est ainsi qu'une apparence entière devient un fichier partageable au lieu d'un graphe de composants, qu'une seule base de code couvre les trois plateformes, et qu'une quarantaine de types de panneaux sont livrés d'emblée au lieu d'être assemblés téléchargement après téléchargement. C'est aussi pour ça que l'identité d'une piste n'a jamais été liée aux chemins de fichiers, et c'est ce qui rendra possible plus tard la fusion d'une bibliothèque locale avec autre chose. L'essentiel de ces 62 Mo raconte la même histoire.
    .aside = Des panneaux qui se détachent en vraies fenêtres système, ou une palette qui se reteinte d'après la pochette en cours, ne sont jamais entrés dans le tableau ci-dessus. Il n'y avait rien à mettre dans l'autre colonne. Si ce sont ces différences-là que tu cherches, c'est rox qu'il te faut.

fb-closer = Mets-le à l'épreuve de ta propre bibliothèque
    .body = Libre, open source sous AGPL, sans compte et sans installeur. Pointe-le sur la collection qui casse les autres lecteurs.
    .fine = Ou lis d'abord le [code source](@repo). C'est une façon raisonnable d'évaluer un lecteur qui demande le droit d'écrire tes tags. Encore en train de peser le pour et le contre ? Les [critères qui distinguent les lecteurs de bibliothèque](/best-music-player) sont détaillés à part, mesures comprises.

## Mp3tag

mp3tag-breadcrumb = Alternative à Mp3tag
mp3tag-title = Une alternative à Mp3tag pour Linux et macOS en { $year }
    .description = Édition de tags par lots sur FLAC, MP3, MP4 et APE, une grille par fichier pour les imports en désordre, des notes écrites dans les fichiers eux-mêmes, et un chemin d'écriture qui ne modifie jamais un original sur place.

mp3tag-h1 = Un éditeur de tags que tu peux pointer sur dix mille fichiers
    .lede = Mp3tag est l'outil auquel la plupart des gens pensent quand ils disent éditeur de tags, et il n'en existe pas de build Linux. rox embarque un éditeur complet, et un chemin d'écriture pensé pour le cas où un lot est assez gros pour que « ça marche en général » ne suffise plus.

mp3tag-isnt = Commençons par ce que ce n'est pas
    .p1 = rox est un lecteur de musique qui contient un éditeur de tags sérieux. Mp3tag est un tagueur dédié, et en tant que tagueur dédié il est meilleur : scripts, actions, chaînes de format composables, et vingt ans d'aspérités limées. Si ce que tu veux est un outil autonome à lancer sur un dossier puis à fermer, sous Windows, c'est celui-là.
    .p2 = L'argument pour le faire dans rox, c'est que taguer une bibliothèque n'est en général pas une tâche qu'on termine. C'est quelque chose qu'on fait en écoutant, sur le fichier qu'on vient de remarquer comme faux, et c'est pour ça que l'éditeur attaché au lecteur et à la bibliothèque est l'idée même et non un compromis.

mp3tag-write = Le chemin d'écriture
    .p1 = C'est la partie qui vaut la lecture même si tu n'installes jamais rox. La plupart des tagueurs modifient ton fichier sur place : ils ouvrent l'original, réécrivent la zone de métadonnées, et espèrent. Cela se passe bien des dizaines de milliers de fois, et une fois, c'est la catastrophe : un plantage, un disque plein ou un support arraché en cours de route laissent un fichier qui ne s'analyse plus, avec ton audio dedans.
    .p2 = rox n'écrit jamais dans un original. Chaque modification copie le fichier, applique le changement à la copie, vérifie le résultat en relisant les métadonnées et en hachant le flux audio pour confirmer qu'il est identique octet pour octet à ce qui est entré, et seulement ensuite renomme atomiquement la copie par-dessus l'original. Si une étape échoue, la copie est supprimée et ton fichier est intact, parce qu'il n'a jamais été ouvert en écriture.
    .p3 = Chaque fichier est aussi isolé, un fichier pathologique dans un lot de quatre mille échoue donc pour lui seul au lieu d'emporter tout le traitement.

mp3tag-cost = Le prix
    .body = Copier, vérifier, renommer veut dire que chaque modification demande brièvement autant d'espace libre que le fichier, et c'est plus lent qu'écrire sur place. Sur un lot de quelques milliers de FLAC, c'est du vrai temps et du vrai disque. C'est un compromis que rox assume, et c'est toute la raison pour laquelle l'éditeur peut être pointé sans crainte sur une bibliothèque plutôt que sur un dossier.

mp3tag-batch = Modifier un lot sans l'aplatir
    .p1 = Sélectionne autant de pistes que tu veux et l'éditeur s'ouvre comme un formulaire partagé. Un champ sur lequel tous les fichiers s'accordent affiche sa valeur ; les champs qui divergent restent vides sous un espace réservé indiquant plusieurs valeurs. Seuls les champs que tu touches réellement écrivent quelque chose, un champ intact ne réécrit donc aucun fichier, et ceux qu'il serait absurde d'écrire d'un bloc sur toute une sélection, le titre, le numéro de piste et le numéro de disque, se verrouillent d'eux-mêmes dans un lot.
    .p2 = Quand un fichier du lot est faux, le formulaire devient un tableau : une ligne par piste, une colonne par champ, les champs par piste verrouillés modifiables directement. C'est la vue pour l'import où chaque titre et chaque numéro est faux d'une manière différente, et elle vaut mieux que d'entrer dans les champs un par un. Les deux vues valident en un seul lot par le même chemin d'écriture, et le résultat arrive dans la bibliothèque sans nouvelle analyse.

mp3tag-specs = Ce qu'il lit et écrit
mp3tag-spec-formats = **Formats.** ID3v2, commentaires Vorbis, atomes MP4 et APE derrière un seul éditeur, MP3, FLAC, M4A et le reste sont donc le même écran.
mp3tag-spec-ratings = **Notes.** Écrites dans les fichiers eux-mêmes via FMPS et POPM, pas dans une base que tu ne peux pas emporter.
mp3tag-spec-genres = **Genres à valeurs multiples.** De vraies listes, dont les fusions restent un avis de la bibliothèque plutôt qu'une réécriture de tes tags.
mp3tag-spec-art = **Pochettes.** Pochettes d'album à plusieurs images, ajoutées et remplacées par le même chemin atomique.
mp3tag-spec-lookup = **Recherche.** Tags et pochettes depuis MusicBrainz, iTunes et Deezer, appliqués via le même diff, tu vois donc ce qui change avant la moindre écriture.
mp3tag-spec-repair = **Réparation.** Une passe pour les fichiers dont les tags sont abîmés de façons connues plutôt que simplement faux, ceux qui font afficher aux autres tagueurs un titre sous forme de nom de fichier avec une durée nulle.
mp3tag-spec-patterns = **Motifs, dans les deux sens.** Une chaîne de format comme `%artist% - %title%` lit les tags depuis un nom de fichier, et le même motif à l'envers renomme les fichiers d'après leurs tags. Les deux prévisualisent chaque piste avant d'écrire quoi que ce soit.

mp3tag-stay = Qui devrait rester sur Mp3tag
    .p1 = Si tu es sous Windows et que tu t'appuies sur les actions, les scripts ou le travail plus élaboré sur les chaînes de format, rox n'a pas d'équivalent et ce serait un retour en arrière. Si tu veux un tagueur qui ne soit pas aussi un lecteur, rox n'a tout simplement pas la bonne forme.
    .p2 = Si tu es sous Linux ou sur un Mac, ou si ton tagage se fait au milieu de l'écoute plutôt que comme une corvée séparée, c'est le vide que ceci comble.
    .aside = Le chemin d'écriture est la partie qui n'a pas de contrepartie à comparer. Vérifier le hachage d'un flux audio avant de renommer par-dessus un original, un tagueur ne le fait pas s'il ne s'attend pas à être pointé sur tout ce que tu possèdes. Si c'est ce genre de prudence que tu veux entre une modification et tes fichiers, la voilà.

mp3tag-closer = Pointe-le sur le dossier que tu évites
    .body = Libre et open source, sans compte, sans installeur. Le [versant bibliothèque](/best-music-player) est détaillé à part, et si tu viens d'une installation Windows il y a aussi une comparaison [MusicBee](/musicbee-alternative) et une comparaison [Foobar2000](/foobar2000-alternative).

## La visualisation

viz-breadcrumb = Visualisation musicale
viz-title = Une visualisation musicale intégrée au lecteur - rox
    .description = Panneaux de spectre, de forme d'onde et VU-mètre, plus des shaders WGSL sur n'importe quel panneau ou sur toute la fenêtre, pilotés par des signaux nommés que tu tires de l'audio en cours et achemines où tu veux.
    .image-alt = Le logo rox au-dessus de la phrase en anglais : signals off the music, shaders on every surface

viz-h1 = Une visualisation qui vit dans le lecteur
    .lede = La plupart des lecteurs te donnent un analyseur de spectre et s'arrêtent là. rox a ces panneaux, et en dessous une couche de modulation : des signaux nommés tirés de l'audio, acheminés vers des entrées de shaders que tu écris toi-même, enregistrés dans le fichier même où vit le reste de ton thème.

viz-panels = D'abord les panneaux ordinaires
    .p1 = Un panneau de spectre avec styles en barres ou en blocs, dégradés, crêtes ayant leur propre gravité, étiquettes de fréquence, et un zonage séparé qui analyse au-dessus et en dessous d'une fréquence choisie avec des tailles de fenêtre différentes, pour que chaque extrémité de la plage arbitre elle-même entre réactivité et résolution. Une bande de forme d'onde qui dessine la piste entière, par canal, et fait sauter la lecture là où tu cliques. Un VU-mètre. Une étagère de pochettes qui les fait tourner en vraie 3D. Rien de tout cela ne demande une ligne de code et c'est ce que la plupart des gens utiliseront.
    .p2 = Mettre en pause fige les barres là où elles étaient, au lieu de les laisser tomber au sol. Cela paraît anodin jusqu'au moment où tu essaies de regarder l'instant exact où tu as fait pause.

viz-shaders = Des shaders, sur quatre surfaces
    .p1 = Un shader rox est un unique étage de fragment WGSL. Il peut s'exécuter sur le corps d'un seul panneau, comme panneau Shader à part entière, en surcouche sur toute la fenêtre, ou en fond peignant sous tous les panneaux, derrière la pochette. La surcouche et le fond ont chacun un interrupteur qui les étend à toutes les fenêtres ouvertes de rox. Même langage, même bloc d'uniformes, même acheminement partout.
    .p2 = Chaque shader reçoit l'horloge, la résolution, le pointeur, et huit flottants méta décrivant l'instant : le volume, où se trouve la tête de lecture dans la piste, si l'audio avance réellement, la durée de la piste, et à quel point la palette actuelle s'affiche sombre, pour qu'un même shader puisse s'habiller pour le clair comme pour le sombre au lieu d'être livré pour le seul thème sur lequel il a été écrit.
    .p3 = Un shader de panneau peut aussi lire ce que le panneau a réellement dessiné. Une liaison de masque lui remet le dessin du panneau rejoué sur de la transparence, et les panneaux publient la forme de leur contenu, une ombre ou une lueur suit donc une pochette encadrée de bandes noires plutôt que les bandes vides de part et d'autre.
    .p4 = Au-delà d'un étage, un commentaire `// @pass` découpe le texte en une chaîne pouvant aller jusqu'à huit, chacun capable de lire les passes précédentes par leur nom. C'est ce dont une pyramide de flou ou un bloom en deux étages a besoin. Une ligne `// @asset` nomme une image à échantillonner, et `// @asset art: @cover` lie la pochette de la piste en cours, et se relie à nouveau à chaque changement de piste. Neuf exemples sont livrés avec l'application, chacun démontrant une partie différente de ce contrat plutôt que neuf variations d'un plasma.
    .p5 = Pointe le panneau sur un fichier du disque et rox le surveille. Enregistre dans ton éditeur et la fenêtre l'a. Un enregistrement qui ne compile pas laisse la dernière version valide à l'écran avec l'erreur dans le panneau, parce que perdre l'image est une mauvaise façon d'apprendre qu'on a mal tapé un point-virgule.

viz-signals = Les signaux, c'est la partie qu'on ne trouve pas ailleurs
    .p1 = Un shader avec une horloge dedans est un économiseur d'écran. Ce qui en fait une visualisation, c'est ce dont tu le nourris, et dans rox c'est un ensemble de signaux nommés partagé par toute l'application. Tu les construis dans une fenêtre à part, sous Application, à côté de l'égaliseur, et elle embarque un spectre et des commandes de lecture pour la même raison que l'égaliseur : tu choisis une bande à l'œil et à l'oreille sur ce que tu écoutes vraiment.
    .p2 = Cinq types de source. Une **bande**, c'est l'énergie entre deux fréquences, le signal sur lequel une montée s'appuie. Le **niveau**, c'est le mixage entier. Une **attaque** pulse quand une bande dépasse sa propre moyenne récente, le signal sur lequel une frappe s'appuie. Un **déclencheur** pulse quand une bande franchit une ligne que tu as tracée, pour la matière où la moyenne glissante ne redescend jamais et où une attaque se tait après la première mesure. Un **total** additionne un autre signal dans le temps et revient à zéro une fois arrivé à un, un shader peut donc le lire comme une phase qui avance tant que la musique est forte et s'arrête quand elle ne l'est pas.
    .p3 = Chacun porte un lissage de réponse et une porte. La porte est le réglage qui mérite sa place : une bande qui suit le bruit de fond garde tous les réglages qui y sont rattachés éternellement un peu hors de leur position de repos, et un seuil avec une courbe au-dessus livre plutôt du silence entre les frappes. L'indicateur dessine la valeur d'avant la porte avec le seuil tracé en travers, puisqu'une barre disparue sous sa propre porte n'aiderait en rien à placer cette porte.
    .p4 = Une route rattache un signal à un paramètre avec une plage de sortie : ce signal, cette cible, d'ici à là. Seize emplacements atteignent chaque shader, et les emplacements vers lesquels rien n'est acheminé reçoivent un simple curseur dans les réglages, une apparence peut donc être à moitié jouée et à moitié réglée à la main.

viz-tap = Mesuré avant le bouton de volume
    .body = Le point de mesure que lisent les visuels se situe avant le volume de sortie. Baisser la musique la faisait auparavant paraître plus faible qu'elle ne l'est, et un signal réglé à un volume était faux à un autre. L'égaliseur et ReplayGain restent visibles, puisqu'ils agissent en amont et font partie de ce que tu entends.

viz-critters = Critters, en guise d'argument
    .body = L'un des espaces de travail livrés, c'est le lecteur entier rendu en impression 1 bit : un tramage ordonné sur chaque surface, des tons qui s'écrasent avec les infrabasses, et un mur de bruit derrière les panneaux qui bouge avec le morceau. Ce sont cinq signaux et quatre shaders dans un seul fichier, et rien de tout cela n'est un cas particulier dans l'application.
    .caption = Charge-le depuis la fenêtre d'accueil, puis ouvre les réglages et démonte-le. [Tous les autres](/workspaces).

viz-trust = Exécuter le shader d'un inconnu
    .p1 = Les shaders voyagent à l'intérieur des fichiers d'espace de travail, une apparence importée arrive donc en portant le code de quelqu'un d'autre.
    .p2 = Rien ne s'exécute avant que tu ne le dises. Le code de chaque shader reçoit une empreinte, et la liste d'approbation est locale à la machine et n'est jamais écrite que par une action directe : tu as choisi le fichier, tu as rechargé, tu as choisi un préréglage, tu as appuyé sur Approuver. Une apparence arrivée dans un paquet reste là, inerte, avec un bouton en dessous, en attendant. Les exemples livrés avec rox sont dignes de confiance par construction, parce qu'ils sont compilés dans le binaire.
    .p3 = En activer un ouvre une fenêtre de confirmation qui attend une réponse au lieu de compter à rebours, et cette fenêtre ne passe jamais elle-même sous un shader. Quoi que le shader fasse au reste de l'écran, le chemin de sortie reste lisible.

viz-limits = Ce qui n'est pas traité
    .aside = La distance entre « je veux que tout le lecteur clignote sur la grosse caisse » et l'avoir, c'est une bande, une porte et une route, et aucun des trois ne demande de recompiler.

viz-limit-routes = Les routes atteignent les emplacements de shaders et les réglages du panneau de particules. Les réglages de tous les autres panneaux restent des curseurs que tu places à la main.
viz-limit-milkdrop = Du WGSL, pas du Milkdrop ni de l'AVS. Il n'y a d'importateur pour aucun des deux, et vingt ans de préréglages ne passent pas.
viz-limit-midi = Pas de surface de contrôle MIDI ni OSC. La passe de surcouche et les passes de panneaux sont ce qui existe, pilotées par l'audio et le pointeur.
viz-limit-battery = Une passe sur toute la fenêtre est une vraie passe GPU à chaque image. Sur un portable sur batterie, c'est un choix que tu fais.

viz-closer = Essaie-le sur ta propre bibliothèque
    .body = Rien ici n'appelle qui que ce soit : l'analyse porte sur l'audio qui traverse déjà le lecteur. Plus sur [ce que porte un espace de travail](/workspaces).

## NekoRoX

neko-title = NekoRoX, le thème foobar2000, reconstruit en natif
    .description = NekoRoX était un fork de CaTRoX pour foobar2000 : panneaux maison, paroles synchronisées, présence Discord, outils Last.fm. Il est archivé désormais, et rox est le lecteur natif que son auteur a construit à la place.

neko-h1 = NekoRoX, le thème foobar2000, et ce qu'il est devenu
    .lede = NekoRoX était un thème foobar2000 : un fork de CaTRoX avec dix ans de panneaux, de plugins et de correctifs empilés dessus. Je l'ai maintenu sous le nom [catlinman](https://github.com/catlinman) jusqu'à ce qu'il devienne impossible à maintenir. rox est ce que j'ai construit à la place, et son apparence par défaut est cette disposition reconstruite de zéro.

neko-shot-alt = Le thème foobar2000 NekoRoX : une disposition sombre avec les onglets INF, BIO, LYR, ART et LIB, un mur de pochettes à gauche, des pistes groupées par album avec notes en étoiles à droite, et une forme d'onde ambre avec un analyseur de spectre en bas.
neko-shot-caption = NekoRoX dans foobar2000, sous Windows, en 2022.

neko-was = Ce qu'était NekoRoX
    .p1 = Une installation foobar2000 prête à l'emploi que tu décompressais dans `%appdata%` pour obtenir un lecteur fini. Sombre, dense, des onglets pour l'info, la biographie, les paroles, les pochettes et la bibliothèque, un mur de pochettes sur un côté, des pistes groupées par album avec des points de notation, et une forme d'onde ambre en bas avec un spectre en dessous. Dessous, il y avait Columns UI, un tas de panneaux JScript, un fichier de disposition `.fcl` et un dossier de polices à installer à la main.
    .p2 = C'est parti de [CaTRoX](/catrox), le thème d'eXtremeHunter1972, repris ensuite par TheQwertiest. NekoRoX y a ajouté la navigation par arborescence et par filtres, les modes mini lecteur, un panneau de paroles synchronisées, un défilement de pochettes, la présence Discord et des outils Last.fm, et a reversé beaucoup du travail de TheQwertiest au fil du temps. Aucun des scripts sous-jacents n'était de moi et le README l'a toujours dit.

neko-where = Où le trouver
    .body = Le dépôt est toujours en ligne sur [github.com/catlinman/foobar2000](https://github.com/catlinman/foobar2000) et les fichiers fonctionnent encore. Il n'est plus maintenu, il est réservé à Windows, et plusieurs composants dont il dépend ont vieilli ou disparu de leurs hébergeurs d'origine. Si tu veux le faire tourner, fais-le. Sache juste que personne ne le répare.

neko-alpha = AlphaRoX, le clair
    .body = Le même thème avec la palette inversée, publié sous ce compte sous le nom [AlphaRoX](https://github.com/zealsprince/foobar2000). C'est un fork de NekoRoX, qui est un fork de CaTRoX, ce qui dit à peu près tout ce qui n'allait pas dans cette façon de distribuer une apparence. Même état que NekoRoX aujourd'hui : en ligne, fonctionnel, non maintenu.
    .alt = Le thème foobar2000 AlphaRoX : la contrepartie claire de NekoRoX, avec un fond blanc, un mur de pochettes à gauche, des pistes groupées par album avec notes en étoiles, et une forme d'onde bleue avec analyseur de spectre en bas.

neko-stopped = Pourquoi ça s'est arrêté
    .p1 = Je suis passé à Linux à plein temps, ce qui voulait dire faire passer tout l'assemblage par Wine. Ça tournait. Ça rendait aussi Internet Explorer à l'intérieur de panneaux, et une pile tenue par des contournements empilés n'apprécie pas une couche de traduction. Chaque mise à jour de foobar2000, et chaque mise à jour de Wine, était un pile ou face sur dix ans de configuration.
    .p2 = Le problème plus profond était le format. Une installation NekoRoX n'est pas un fichier, c'est une liste de composants, un ordre d'installation et un ensemble de chemins qui ne se réassemblent que sur la machine où ils ont été construits. C'est pour ça que le README demandait de copier quatre répertoires à deux endroits différents. Partager une apparence ne devrait pas demander une page d'instructions.

# $others, c'est le nombre livré moins l'espace de travail par défaut et
# CaTRoX, tous deux déjà nommés dans la phrase. Ça disait « quatre autres ».
neko-rox = Ce que rox en fait
    .body = rox est un lecteur natif écrit en Rust, sous Linux, macOS et Windows, sans foobar2000 ni Wine en dessous. Son espace de travail par défaut est la disposition NekoRoX reconstruite à partir de panneaux natifs, et c'est pourquoi les deux captures se ressemblent. Il y a aussi un [espace de travail CaTRoX](/catrox) livré avec, plus { $others } autres.

neko-default-alt = L'espace de travail par défaut de rox, une reconstruction native de la disposition NekoRoX : une grille de pochettes à côté d'une playlist avec notes en étoiles, une barre de navigation en forme d'onde ambre en bas, et des onglets pour la biographie, les paroles et les métadonnées.

neko-carried = La liste des fonctions, ligne par ligne
    .after = Ce que NekoRoX ne pouvait pas faire est ce qui me tient le plus à cœur. Dans rox, toute une apparence est un seul fichier tenant ensemble disposition, palette et apparence, tu donnes donc un espace de travail à quelqu'un et cette personne a ta configuration. Pas de liste de composants, pas d'ordre d'installation, pas de dossier de polices.

neko-had-nav = Navigation par arborescence et filtres
    .now = Panneau d'arborescence de dossiers, plus un panneau de filtres en cascade sur artiste, album, genre et année.
neko-had-mini = Modes mini et micro lecteur
    .now = Une disposition mini par espace de travail, basculée depuis les commandes de lecture, avec sa propre taille de fenêtre.
neko-had-ontop = Toujours au premier plan
    .now = Rien pour l'instant. La fenêtre est une fenêtre ordinaire.
neko-had-ratings = Vues par note et par nombre de lectures
    .now = Notes sur cinq étoiles ou sur dix points, écrites en POPM et FMPS, et une colonne de lectures triable.
neko-had-youtube = Recherche et lecture audio YouTube
    .now = Rien. rox lit les fichiers de ton disque.
neko-had-covers = Visionneuse de pochettes et défilement
    .now = Un panneau Pochette et un carrousel d'albums qui réduit et assombrit ses voisins vers les bords.
neko-had-lyrics = Paroles synchronisées en temps réel
    .now = Des feuilles LRC surlignées sur la tête de lecture, un clic sur une ligne pour s'y rendre, récupérées depuis lrclib.
neko-had-viz = Visualisation et barre de navigation en amplitude
    .now = Une forme d'onde sur toute la piste que tu peux parcourir, un spectre FFT, un VU-mètre.
neko-had-discord = Rich Presence Discord
    .now = Lecture en cours, état de lecture et temps écoulé via l'IPC Discord.
neko-had-bio = Recherche de biographie en direct
    .now = Biographie d'artiste avec fanart, étiquettes, nombre d'auditeurs et artistes similaires.
neko-had-lastfm = Intégration Last.fm
    .now = Scrobbling, lecture en cours, cœurs répercutés en loves, et import des pistes aimées.

neko-closer = Obtenir rox
    .body = Libre, open source, un binaire par plateforme. La [page des espaces de travail](/workspaces) montre les { workspace-count } apparences livrées, et la [comparaison foobar2000](/foobar2000-alternative) détaille les points où foobar2000 garde l'avantage.

## ReplayGain

rg-title = ReplayGain expliqué, et ce que coûte son activation
    .description = Ce que fait vraiment ReplayGain, gain par piste contre gain par album, pourquoi la valeur de crête compte, comment traiter les fichiers que personne n'a jamais mesurés, et pourquoi ReplayGain et lecture bit-perfect s'excluent mutuellement.

rg-h1 = ReplayGain, et ce qu'il te coûte
    .lede = Pourquoi un album est deux fois plus fort que le suivant, ce que la solution fait réellement à ton audio, et pourquoi tu ne peux pas l'avoir en même temps que la lecture bit-perfect.

rg-problem = Le problème qu'il résout
    .p1 = Les disques ne sont pas masterisés à une intensité commune. Un CD de 1985 et un remaster du même album de 2005 peuvent différer de dix décibels ou plus, et c'est la différence entre écouter confortablement et garder la main sur le volume. Mets en lecture aléatoire une bibliothèque couvrant quatre décennies et tu règles le volume une piste sur trois.
    .p2 = ReplayGain corrige cela sans toucher à ton audio. Une passe d'analyse mesure de combien une piste s'écarte d'une intensité de référence et écrit ce nombre, en décibels, dans les tags du fichier. À la lecture, le lecteur lit le nombre et l'applique. Rien n'est réencodé et rien n'est détruit, parce que la correction vit dans un tag et que l'audio en dessous est celui que tu avais.

rg-modes = Gain par piste et gain par album
    .p1 = Chaque fichier mesuré porte deux nombres, et choisir entre eux est le seul réglage qui change réellement la sensation d'écoute.
    .track = Le **gain par piste** égalise chaque piste indépendamment. Chaque morceau arrive à la même intensité, et c'est ce que tu veux en lecture aléatoire. Cela aplatit aussi les albums construits avec de la dynamique à dessein : l'interlude calme avant le final puissant est tiré vers le haut pour s'y aligner, et l'effet voulu par la production disparaît.
    .album = Le **gain par album** applique un seul chiffre à chaque piste du disque, calculé sur l'album dans son ensemble. Les différences relatives à l'intérieur de l'album survivent exactement telles que masterisées, et l'album en tant qu'unité s'aligne sur les autres albums. C'est le bon réglage par défaut si tu écoutes les disques du début à la fin.
    .setting = rox en fait un réglage et applique le chiffre choisi par piste à l'ouverture, c'est donc une préférence et non quelque chose de gravé dans les fichiers.

rg-peak = La crête, et pourquoi une amplification peut écrêter
    .p1 = À côté du gain, une passe de mesure enregistre l'échantillon le plus fort de la piste. Ce nombre compte parce que les corrections ReplayGain vont dans les deux sens : un enregistrement faible reçoit un gain positif, et multiplier des échantillons qui frôlent déjà la pleine échelle les pousse au-delà. Au-delà de la pleine échelle il n'y a plus de place, la forme d'onde s'aplatit donc et tu entends une distorsion qui n'était pas dans le fichier.
    .p2 = La crête est ce qui l'empêche. rox borne une amplification d'après la crête que rapporte le tag, une piste faible n'est donc remontée que d'autant qu'elle peut l'être sans écrêter. Le résultat est que certaines pistes faibles se posent un peu en dessous de l'intensité cible, et c'est le bon compromis, la raison même pour laquelle les valeurs de crête sont stockées.

rg-unmeasured = Les fichiers que personne n'a jamais mesurés
    .p1 = ReplayGain ne fonctionne que sur les fichiers qui portent les tags, et dans une vraie bibliothèque constituée sur vingt ans une grande part ne les portera pas. Historiquement, cela voulait dire passer un tagueur séparé sur tout avant que ton lecteur ne serve à quelque chose.
    .p2 = rox lit les tags là où ils existent, sous les noms standards dans chaque format qu'il indexe : trames TXXX en ID3v2, commentaires Vorbis en FLAC, atomes libres en MP4. Pour tout le reste, il mesure les fichiers lui-même avec une passe d'intensité EBU R128 et range le résultat dans la bibliothèque, marqué comme mesuré, pour qu'une analyse ultérieure puisse distinguer les chiffres de rox de ce qu'un tagueur a écrit. Si tu préfères que les chiffres vivent dans les fichiers, un réglage les réécrit par le même chemin d'écriture vérifié qu'utilise l'éditeur de tags.
    .p3 = Cette passe peut se lancer toute seule. Avec la mesure automatique activée, les fichiers sont mesurés une fois que la surveillance des dossiers s'est calmée après un import, et une piste déposée dans un album déjà mesuré renvoie tout le disque à une nouvelle mesure, puisque le gain par album est un chiffre sur le disque et non sur le fichier.

rg-skip = La partie que la plupart des pages sautent
    .p1 = ReplayGain multiplie tes échantillons par un nombre. C'est du traitement. Ce n'est pas sans perte, ce n'est pas un passage direct, et tout lecteur revendiquant à la fois ReplayGain et sortie bit-perfect décrit quelque chose qui ne peut pas exister.
    .p2 = Cela compte si tu possèdes un DAC choisi avec soin. Bit-perfect veut dire que les échantillons qui atteignent le convertisseur sont ceux du fichier, non modifiés, donc tout ce qui les met à l'échelle, un volume en dessous du maximum, un égaliseur, ReplayGain, met fin à cette revendication. Il n'existe aucune version de normalisation d'intensité qui laisse les bits tranquilles, parce que changer l'intensité c'est changer les bits.
    .choice = Choisir entre les deux est un vrai choix, pas une question piège. Le bit-perfect compte pour l'écoute critique d'un album sur du bon matériel. ReplayGain compte pour toutes les autres heures, quand la bibliothèque tourne en aléatoire et que tu préférerais ne pas toucher au volume. La plupart des gens devraient activer ReplayGain et ne plus y penser. Ce qui compte, c'est de savoir lequel est actif.

rg-bitperfect = Ce que bit-perfect veut dire dans rox
    .body = Trois conditions, énoncées plutôt que décorées : la chaîne de traitement vide ou désactivée, le volume à 100 %, et le périphérique tournant à la fréquence propre du fichier source. Remplis les trois et le convertisseur reçoit des échantillons identiques bit pour bit. Manques-en une et ce n'est plus le cas, et rox le dit au lieu d'afficher un badge. ReplayGain activé, c'est du traitement activé, et cela s'affiche comme du traitement activé.

rg-exclusive = La sortie exclusive, à part
    .p1 = Le bit-perfect demande aussi que le système d'exploitation sorte du chemin, et c'est à cela que sert un mode de sortie exclusif. rox prend le périphérique directement : le nom ALSA `hw:` sous Linux, sans dmix, sans plug et sans serveur de son sur le trajet ; WASAPI exclusive sous Windows ; le mode hog via CoreAudio sous macOS. Il suit la fréquence de la source quand le périphérique le permet, et rapporte ce que le matériel a réellement accepté plutôt que ce qui a été demandé.
    .p2 = La contrepartie est celle que le mot exclusif implique partout : tant que rox tient le périphérique, rien d'autre sur la machine ne joue par lui. Si le périphérique ne peut pas être obtenu, rox retombe en mode partagé avec l'état visible, plutôt que de se taire en te laissant chercher pourquoi.

rg-limits = Ce qui n'est pas traité
    .aside = Un lecteur qui te dit lequel du bit-perfect et de ReplayGain est vrai à cet instant, et qui mesure les fichiers auxquels tes tagueurs ne sont jamais arrivés, cela fait une liste courte. Si c'est ce genre d'honnêteté que tu veux de la chose entre ta bibliothèque et ton DAC, rox y figure.

rg-limit-opus = Les fichiers Opus portent leur propre schéma `R128_TRACK_GAIN`, relatif à une autre référence. rox ne le convertit pas, parce que `.opus` ne fait pas partie des extensions du scanner.
rg-limit-itunes = L'`iTunNORM` d'iTunes est hors périmètre. Rien d'autre ne l'écrit et ses chiffres par canal ne sont pas un gain en décibels.
rg-limit-rate-switch = Suivre la fréquence de la source en mode exclusif coûte un blanc audible entre deux pistes de fréquences différentes, puisque le flux se rouvre. Le sans-blanc à fréquence constante n'est pas affecté.

rg-closer = Pointe-le sur ta bibliothèque
    .body = La passe de mesure tourne en arrière-plan sur tout ce à quoi il manque un gain, et continue avec la fenêtre de réglages fermée. Plus sur [ce qui compte d'autre à l'échelle d'une bibliothèque](/best-music-player).
