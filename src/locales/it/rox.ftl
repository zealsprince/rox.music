# rox.music, italiano.
#
# Ricalcato su en-CA. Quello che manca qui ricade in silenzio sull'inglese a
# runtime, quindi è scripts/check-locales.ts a far emergere i buchi, non la
# pagina.
#
# I nomi dei prodotti restano come sono: rox, Foobar2000, CaTRoX, NekoRoX,
# MusicBee, Mp3tag, ReplayGain, gpui. Si traduce ciò che si legge, non ciò che
# si clicca o si digita.
#
# La terminologia segue quella dell'app (crates/rox-i18n/locales/it), così chi
# legge il sito ritrova la stessa parola nelle impostazioni:
#   workspace   -> spazio di lavoro (settings-page-workspace), mai il solo
#                  "spazio"
#   layout      -> layout, non "disposizione"
#   look        -> look, l'identità visiva intera che sta in un file
#   appearance  -> aspetto, il componente dentro il look. Due parole diverse
#                  perché sono due cose diverse: il sito le confondeva
#   route       -> route, femminile: una route, le route (route-header)
#   onset       -> attacco (signal-kind-onset)
#
# "Skin" è femminile: una skin, la skin CaTRoX, ricreata.
#
# Le virgolette in mezzo a una frase sono « », non "…". I numeri sono già
# localizzati (50.000, 0,3 secondi); tenerli così.

## Cornice

skip-to-content = Vai al contenuto

nav-home = Home di rox
nav-main = Principale
nav-download = Download
nav-workspaces = Spazi di lavoro
nav-more = Altro
nav-github = rox su GitHub
    .stars = rox su GitHub, { $stars } stelle

language-picker = Lingua
language-missing = Non trovi la tua lingua?
theme-toggle = Cambia tema
    .label = Alterna tema chiaro e scuro

footer-credit = rox è realizzato da [Andrew Lake (zealsprince)](@author) in Rust su [gpui](@gpui), il framework di interfaccia dietro [Zed](@zed). Libero e open source sotto [AGPL-3.0](@license).
footer-nav = Piè di pagina
footer-source = Codice sorgente
footer-irc = IRC
footer-irc-direct = Diretto
footer-irc-web = Webchat
footer-bug = Segnala un bug
footer-translate = Dai una mano a tradurre

## Il sito stesso

# Il titolo per la ricerca, non la frase per le persone. "If Foobar2000 was
# made in the current year" è la frase migliore e resta l'h1 e il testo sulla
# social card, dove la legge qualcuno. Su Google non la digita nessuno.
#
# Questo punta a "foobar2000 alternative", una ricerca che rox può davvero
# vincere. "linux music player" non è vincibile contro vent'anni di listicle, e
# inseguirla costerebbe l'unico termine che converte. In inglese sono 59
# caratteri, così sopravvive intero alla larghezza con cui Google lo mostra: la
# traduzione ha lo stesso budget, e lasciar cadere il nome di una piattaforma è
# il modo più economico di fare spazio.
site-tagline = rox - alternativa a Foobar2000 per Linux, macOS e Windows

# Sotto i 160 caratteri, così Google la mostra intera invece di tagliarla a
# metà frase. Le piattaforme stanno già nel titolo, ed è questo che libera lo
# spazio per quello che il titolo non può dire.
site-description = Un lettore musicale nativo per grandi librerie locali taggate con cura. Componi i tuoi pannelli, condividi i temi come file, resta veloce a 50.000 tracce.

# Tutte e quattro le social card sotto static/social/ sono un'unica immagine
# per pagina, la stessa per ogni lingua, e la frase è testo inglese dentro il
# quadro. L'alt deve dire cosa c'è scritto davvero e che è in inglese: tradurlo
# racconterebbe a chi usa uno screen reader un'immagine che non esiste. Vale
# allo stesso modo per download-title, workspaces-title e viz-title.
social-image-alt = Il logo rox sopra la frase in inglese: if Foobar2000 was made in the current year

# Il numero di spazi di lavoro inclusi, scritto in lettere. Una cifra sotto il
# dieci in mezzo a una frase si legge come una scheda tecnica, e quali numeri si
# scrivono in lettere lo decide ogni lingua per conto suo. Ogni frase che cita
# il conteggio dice { workspace-count } e passa $count.
#
# Attenzione: in italiano è il numero scritto in lettere a governare l'articolo
# davanti ("gli otto", ma "i nove"), e il conteggio cambia quando ne esce un
# altro. Dove si poteva, le frasi qui sotto sono girate in modo che nessun
# articolo tocchi il conteggio.
workspace-count = { $count ->
    [1] uno
    [2] due
    [3] tre
    [4] quattro
    [5] cinque
    [6] sei
    [7] sette
    [8] otto
    [9] nove
   *[other] { $count }
}

## Affermazioni nel grafo dei dati strutturati

app-feature-panels = Interfaccia a pannelli componibili, staccabili in finestre
app-feature-workspaces = Spazi di lavoro condivisibili con layout, palette e aspetto
app-feature-tagging = Editing dei tag approfondito, scritture atomiche e modifiche in blocco
app-feature-gapless = Riproduzione senza stacchi
app-feature-dsp = Equalizzatore, dissolvenza incrociata e ReplayGain
app-feature-exclusive = Uscita esclusiva bit-perfect
app-feature-lyrics = Testi sincronizzati
app-feature-scrobbling = Scrobbling su Last.fm

## Home

# Deliberatamente non una traduzione della frase inglese. L'h1 porta la voce,
# non la ricerca: è site-tagline a portare "alternativa a Foobar2000" per Google,
# quindi questa riga è libera di trasmettere il sentimento invece di rifare la
# battuta dell'originale. Tornare a una versione letterale toglierebbe alla home
# proprio quello per cui esiste.
home-hero = Il lettore musicale di oggi, non di ieri.
    .lede = Un lettore desktop per chi ha una libreria locale grande e taggata con cura. I pannelli li componi tu, e un tema intero sta in un file solo, da passare a chi vuoi. Nativo su Linux, macOS e Windows.
    .alt = rox con lo spazio di lavoro predefinito in stile NekoRoX: libreria, copertina, coda e un pannello di spettro

home-speed = Una finestra in meno di un secondo
    .body = rox è un solo binario e parte prima che tu abbia mollato il mouse.

home-features = Cosa c'è dentro

home-closer = Fallo tuo
    .body = Ci sono { workspace-count } spazi di lavoro inclusi, a un clic dalla finestra di benvenuto. Ognuno è un singolo file che contiene il layout, la palette e gli shader che usa: lo modifichi, lo rompi, lo passi a qualcun altro. [Guardali tutti](/workspaces).

## La tabella dei benchmark

benchmark-caption = Avvio, memoria e CPU a riposo di sette lettori musicali su una libreria da 50.000 tracce
benchmark-player = Lettore
benchmark-window-up = Finestra pronta
benchmark-loaded = Caricato del tutto
benchmark-memory = Memoria
benchmark-idle-cpu = CPU a riposo
benchmark-never-settles = non si stabilizza mai

benchmark-method = Ho misurato tutto io stesso, su una sola macchina (Ryzen 9 5950X, Linux/Wayland), con la stessa libreria da 50.000 tracce su un SSD esterno, ogni lettore attraverso lo stesso banco di prova con la libreria caricata. La memoria è il PSS sull'intero albero dei processi. «Caricato» è quando la CPU si stabilizza dopo l'avvio; a riposo è un lettore in pausa con la finestra visibile.
    .deadbeef = [DeaDBeeF](@deadbeef) si sarebbe fermato a 44 MB e avrebbe vinto sulla memoria, ma non ha mai avuto una riga: il suo parser MP3 va in segmentation fault a metà dell'importazione di questa libreria, a ogni tentativo. rox indicizza tutte le 50.000 tracce, compresi i file troncati che lo fanno inciampare.

## La griglia delle funzioni

features-library = Libreria
features-playback = Riproduzione
features-looks = Look
features-daily = Ogni giorno

feature-library = Una libreria che regge
    .body = Uno scanner parallelo legge i tag completi, le durate reali e il codec di ogni singolo file, non una scorsa all'intestazione. Il monitoraggio delle cartelle sopravvive alle rinomine, e niente sparisce in silenzio.
    .link = Cosa si rompe a 50.000 tracce

feature-tagging = Tagging di cui fidarsi
    .body = Un editor completo, con scritture atomiche e modifiche in blocco. I voti stanno nei file stessi tramite FMPS e POPM. Ricerca via MusicBrainz, iTunes e Deezer.
    .link = A confronto con Mp3tag

feature-cue = I rip CUE si comportano da tracce
    .body = Un FLAC che copre un disco intero, accanto al suo cue sheet, si indicizza come righe vere. Ogni segmento si scorre, si scrobbla, si ordina e passa senza stacchi al successivo, esattamente come un file.
    .link = Come funzionano i segmenti

feature-gapless = Riproduzione senza stacchi
    .body = Un solo flusso, con riproduzione casuale, ripetizione e riproduci dopo. Si riprende quando un dispositivo audio sparisce, e i tasti multimediali e il brano in riproduzione funzionano su tutte e tre le piattaforme.

feature-equalizer = Dieci bande e bit-perfect
    .body = Un equalizzatore in una finestra tutta sua, una dissolvenza incrociata che lascia stare gli attacchi voluti di un album, e un'uscita esclusiva che dice cosa ha davvero accettato l'hardware.
    .link = ReplayGain e bit-perfect

feature-similarity = Ordinato per come suona
    .body = rox descrive le tue tracce a partire dal loro stesso audio, tempo compreso, e ordina quello che viene dopo per somiglianza. Gira sulla tua macchina sui tuoi file, senza servizi di mezzo.

feature-panels = Pannelli che componi tu
    .body = Una quarantina di tipi di pannello, dalla libreria e la coda alle griglie di artisti, allo spettro e al VU. Duplicane uno con la sua configurazione, salvalo come preset, o staccalo in una finestra.
    .link = A confronto con Foobar2000

feature-themes = Temi come file condivisibili
    .body = Uno spazio di lavoro è un file con layout, palette, aspetto e shader. Le palette possono tingersi dalla copertina in riproduzione, virando al chiaro o allo scuro con l'immagine.
    .link = Quelli inclusi, { workspace-count } in tutto

feature-shaders = Visual che ascoltano
    .body = Scrivi uno shader WGSL su un pannello o sull'intera finestra. Segnali con un nome ricavati dallo spettro viaggiano sui suoi ingressi, così una banda di cassa muove la manopola che le indichi.
    .link = Shader e segnali

feature-lyrics = Testi e cronologia
    .body = Sincronizzati o semplici, da file sidecar, dai tag o da lrclib, con un editor che riscrive dove ha letto. Un registro degli ascolti alimenta il pannello cronologia, le statistiche e lo scrobbling.

feature-playlists = Playlist che sopravvivono
    .body = Preferiti, riordino con il trascinamento, m3u in entrata e in uscita, e playlist intelligenti che rieseguono una query salvata invece di conservare un'istantanea. Le voci sopravvivono a un file che se ne va e torna.

feature-binary = Un binario, nessun installer
    .body = Un tarball, un DMG o uno zip, più l'AUR e un flake Nix. La modalità portatile tiene libreria e impostazioni in una cartella accanto all'eseguibile.
    .link = Prendilo

## Il pulsante di download, ovunque compaia

download-cta = Scarica rox
# %s è il punto in cui enhance.js inserisce il nome della piattaforma rilevata.
# Va tenuto: lo script non conosce la lingua e sa solo sostituire, quindi
# l'ordine delle parole deve essere giusto già qui.
download-cta-detected = Scarica per %s
download-packaged = Su Arch o NixOS? [Installalo invece dall'AUR o dal flake Nix](/download#packages).
download-meta = v{ $version } · Linux, macOS, Windows · [tutti i download](@releases)

## Download

download-title = Scarica rox per Linux, macOS o Windows
    .description = Scarica rox gratuitamente per Linux, macOS o Windows. Un download per piattaforma, nessun account. Open source sotto AGPL.
    .image-alt = Il logo rox sopra la frase in inglese: download for Linux, macOS and Windows

download-h1 = Scarica rox
    .lede = Un download per piattaforma. Nessun account, niente che resti in esecuzione in background quando lo chiudi.

download-released = pubblicato il { $date }
download-notes = note di rilascio
download-missing = Nessuna build per { $platform } in questa versione. [Controlla la pagina dei rilasci](@releases).

install-linux-1 = Estrai il tarball dove vuoi.
install-linux-2 = Avvia `./rox`.
install-macos-1 = Apri il DMG.
install-macos-2 = Trascina rox in Applicazioni.
install-windows-1 = Estrai dove vuoi.
install-windows-2 = Avvia `rox.exe`.
install-windows-caveat = Se SmartScreen protesta, scegli Ulteriori informazioni e poi Esegui comunque.

download-alt-linux = Su Debian, Ubuntu o Mint c'è anche un pacchetto:
download-alt-windows = Preferisci un'installazione guidata? C'è un installer:

download-packages = Gestori di pacchetti
    .body = Due strade che tengono rox aggiornato insieme al resto del sistema.

package-aur =
    .scope = AUR, compila dai sorgenti
    .body = Sull'AUR come `rox-player`, co-mantenuto dall'autore di rox. Va bene qualsiasi helper AUR, oppure cloni il pacchetto e lanci `makepkg -si` a mano.
    .link = rox-player sull'AUR

package-nix =
    .scope = direttamente dal flake
    .body = Il repository è un flake. Il primo comando avvia rox senza installare nulla, il secondo lo mette nel tuo profilo. Su NixOS aggiungi il flake come input e tiri dentro `packages.default`, oppure usi l'overlay che esporta.
    .link = flake.nix

download-cli = Avviarlo da un terminale
    .body = Passa a rox file o cartelle e li riproduce subito, sostituendo quello che era caricato. Le cartelle si espandono nei file audio contenuti direttamente al loro interno.
    .flags = `--enqueue` (o `-e`) accoda invece di riprodurre subito. `--portable` tiene libreria, impostazioni e cache in una cartella `rox-data` accanto all'eseguibile, per quell'avvio. Per restare portatile tra un avvio e l'altro, metti un file vuoto chiamato `portable` accanto all'eseguibile, oppure attiva l'interruttore nelle impostazioni di comportamento.

download-build = Compilarlo in proprio
    .body = Con Nix, `nix develop` e poi `cargo run` ti danno una shell di sviluppo con la toolchain Rust e le librerie che gpui carica a runtime. Senza Nix ti servono Rust stabile e le librerie di sistema di gpui dalla tua distribuzione. La [sezione sviluppo del README](@readme-dev) ha l'elenco completo.

## Spazi

workspaces-title = Spazi di lavoro di rox - temi e layout condivisibili
    .description = Uno spazio di lavoro di rox è un look intero in un file condivisibile: layout, palette, aspetto e gli shader che usa. Vanno da un omaggio a Foobar2000 a un lettore reso interamente in dithering a 1 bit.
    .image-alt = Il logo rox sopra la frase in inglese: a whole look in one shareable file

workspaces-lede = Uno spazio di lavoro è un look intero in un file: layout, palette, aspetto e tutti gli shader che usa, incorporati perché un look importato arrivi completo. Caricane uno dalla finestra di benvenuto o dalle impostazioni, cambia quello che vuoi, e passa il file a qualcun altro perché ottenga esattamente la stessa cosa. Questi { workspace-count } sono inclusi.

workspaces-critters = Come ci riesce Critters
    .body = Uno spazio di lavoro porta con sé i propri shader incorporati, sorgente e immagini comprese, perché un look che renderizza l'intera applicazione come una stampa a 1 bit si importi per intero invece di arrivare come riferimento a un file sulla macchina di qualcun altro. Niente viene eseguito prima che tu lo approvi. [Shader e segnali](/music-visualizer).

workspace-default = Com'è rox appena installato: superfici traslucide, tinta dalla copertina disattivata.
    .alt = Lo spazio di lavoro Default di rox: una griglia di copertine accanto a una playlist con voti a stelle, una barra di scorrimento a forma d'onda ambrata in basso e schede per biografia, testo e metadati.

workspace-foobar = Il layout con cui tutto questo progetto litiga da sempre. Opaco, denso, decorazioni di sistema attive, barra dei menu dov'è sempre stata.
    .alt = Lo spazio di lavoro Foobar di rox: un classico layout foobar2000 con barra dei menu, colonne di filtro per artista e album, una tabella di tracce densa con conteggi di riproduzione e voti, e la copertina in basso a sinistra.

workspace-catrox = La skin CaTRoX per foobar2000 che conosci e ami, quella da cui è partito tutto.
    .alt = Lo spazio di lavoro CaTRoX di rox: la skin foobar2000 ricreata, con una resa circolare della copertina a CD, un elenco di campi di metadati a sinistra e tracce raggruppate per album con pallini di valutazione.

workspace-llama = WinAmp, com'è nel tuo ricordo e non com'era davvero. Tahoma, scuro, nessuna cornice.
    .alt = Lo spazio di lavoro Llama di rox: un analizzatore di spettro a puntini in stile Winamp in alto, controlli di riproduzione verdi e sotto un elenco di tracce denso, senza alcuna cornice di finestra.

workspace-metro = Pannelli piatti e righe comode con la tinta dalla copertina attiva, così la palette segue quello che sta suonando.
    .alt = Lo spazio di lavoro Metro di rox: una griglia a tutta larghezza di copertine con i titoli sotto, e a destra un pannello di biografia dell'artista con foto, etichette di genere e numero di ascoltatori.

workspace-phosphor = Tutto a spaziatura fissa. Consolas, nessuna copertina nella riproduzione rapida, un terminale a cui capita di suonare musica.
    .alt = Lo spazio di lavoro Phosphor di rox: verde su nero a spaziatura fissa ovunque, un albero di cartelle accanto a una tabella di tracce e una forma d'onda verde in basso, come un terminale che suona musica.

workspace-critters = L'intera applicazione come stampa a 1 bit. Un dithering ordinato su ogni superficie, toni che collassano con i bassi profondi, e un muro di rumore dietro i pannelli che si muove con il brano.
    .alt = Lo spazio di lavoro Critters di rox: l'intera finestra resa in dithering ordinato in bianco e nero, con una mensola curva di copertine sopra una barra di scorrimento, una riga di controlli, una striscia di forma d'onda e una tabella di tracce, tutto su un campo di rumore in movimento.

workspace-diffuse = Solo l'album in riproduzione, su una velatura morbida ricavata dalla sua stessa copertina. Monocromatico di proposito, così il colore lo porta l'immagine, e la libreria aspetta in un cassetto sul bordo destro.
    .alt = Lo spazio di lavoro Diffuse di rox: una grande copertina riempie la parte sinistra della finestra su una sfumatura sfocata della stessa immagine, con titolo, artista e album accanto sopra una sottile linea di scorrimento, una fila di pulsanti di riproduzione e un cursore del volume.

## Altro

more-title = Altro su rox
    .description = Le pagine che stanno fuori dalla navigazione principale: il confronto con Foobar2000, cosa cercare in un lettore per una libreria locale, e come funziona rox su Linux, macOS e Windows.

more-lede = Le pagine che non hanno posto nella navigazione, tenute a portata di mano invece che cancellate.

more-why = Perché esistono
    .p1 = Queste pagine esistono per essere trovate. Chi nel { $year } cerca un'alternativa a Foobar2000 su Linux, o sta capendo quale lettore sopravvive a una libreria di queste dimensioni, dovrebbe atterrare dove gli si risponde, non su una home scritta per chi già sa cos'è rox.
    .p2 = Stanno fuori dalla navigazione di proposito. Il sito vero e proprio è tre pagine: cos'è rox, come si prende, com'è fatto. Impilare il resto nell'intestazione renderebbe più difficile trovare quello per cui sei venuto, e sarebbe un pessimo scambio per chi arriva sapendo già tutto.
    .p3 = Magari tutto questo su rox e Foobar2000 lo sai già. Molti di quelli che atterrano qui non lo sanno, ed è per loro che ci sono. Ognuna dice dove rox perde tanto quanto dove vince, e non ripete niente di quello che trovi in [home](/).

more-pages = Le pagine
more-closer = Se preferisci saltare tutto questo, dalla [pagina di download](/download) mancano due clic a un lettore in funzione, e il [codice sorgente](@repo) è la documentazione più onesta che c'è qui.

## Le pagine fuori dalla navigazione

page-foobar2000-alternative = L'alternativa a Foobar2000
    .blurb = Cosa ha fatto bene Foobar2000, dove ti lascia a piedi e cosa fa rox al riguardo. Comprese le voci in cui Foobar2000 è ancora avanti.

page-catrox = CaTRoX, ricostruito nativo
    .blurb = Il tema foobar2000 da cui è partito tutto, chi l'ha fatto, e cosa è servito per far girare quel look senza Windows sotto.

page-nekorox = NekoRoX, e dov'è finito
    .blurb = Il fork di CaTRoX che ho mantenuto per dieci anni, perché si è fermato, e quali dei suoi pannelli esistono oggi in rox. Compreso AlphaRoX, quello chiaro.

page-music-visualizer = La visualizzazione, e lo strato che c'è sotto
    .blurb = Pannelli di spettro e forma d'onda, shader WGSL su qualsiasi pannello o sull'intera finestra, e i segnali con un nome ricavati dall'audio che li muovono.

page-cue-sheets = Rip FLAC e CUE
    .blurb = Un'immagine di disco intero e il suo sheet, indicizzati come tracce vere che si scorrono, si ordinano, si scrobblano e si concatenano senza stacchi.

page-mp3tag-alternative = Un'alternativa a Mp3tag per Linux
    .blurb = Modifiche in blocco, una griglia per file, e un percorso di scrittura che copia, verifica e rinomina invece di modificare i tuoi file sul posto.

page-musicbee-alternative = Un'alternativa a MusicBee
    .blurb = Cosa fa MusicBee che rox non fa, cosa fa rox che MusicBee non può fare, e perché la risposta onesta dipende dal tuo sistema operativo.

page-replaygain = ReplayGain, e quanto costa
    .blurb = Cosa fa davvero ReplayGain, guadagno per traccia contro guadagno per album, misurare i file che nessuno ha mai taggato, e perché accenderlo significa rinunciare al bit-perfect.

page-best-music-player = Il miglior lettore musicale per una libreria locale
    .blurb = Cosa distingue davvero i lettori una volta che la tua collezione è seria, e come se la cava il gruppo su 50.000 tracce.

page-linux = rox su Linux
    .blurb = AUR e Nix, Wayland e X11, uscita esclusiva ALSA, tasti multimediali MPRIS, e la tabella di benchmark in cui ci sono solo lettori Linux.

page-windows = rox su Windows
    .blurb = Uno zip senza installer, modalità portatile, uscita esclusiva WASAPI, e una lettura onesta su cosa significhi competere con Foobar2000 in casa sua.

page-macos = rox su macOS
    .blurb = Apple Silicon, firmato e notarizzato, menu nella barra di sistema, uscita esclusiva CoreAudio.

## Non trovata

notfound-title = Pagina non trovata
    .description = Questa pagina non esiste su rox.music.
notfound-h1 = Da queste parti non c'è niente
notfound-nav = Vie d'uscita

## Le tre pagine di piattaforma, cornice comune

platform-breadcrumb = rox su { $platform }
platform-limits = Cosa non può fare su { $platform }
platform-closer = Puntalo sulla tua libreria
    .body = Libero e open source sotto AGPL. Nessun account, e niente che resti in esecuzione in background quando lo chiudi.
platform-more = Altro su [com'è fatto](/workspaces), il [confronto completo con Foobar2000](/foobar2000-alternative), o cosa stia facendo davvero l'uscita esclusiva qui sopra, in [ReplayGain e bit-perfect](/replaygain).

## Linux

linux = rox - un lettore musicale nativo per Linux
    .description = Un lettore musicale Linux nativo per grandi librerie locali. Sull'AUR e come flake Nix, Wayland e X11, uscita esclusiva ALSA, tasti multimediali MPRIS, e una finestra in meno di un secondo a 50.000 tracce.
    .h1 = Un lettore musicale per Linux, costruito per Linux
    .lede = Non un port, non un involucro Electron, e non Foobar2000 sotto Wine. Un binario nativo che tratta Linux come piattaforma di prima classe invece che come la terza.
    .aside = Un'uscita esclusiva che riferisce cosa ha davvero accettato la scheda audio invece di cosa le hai chiesto, e un look che costruisci qui e passi a qualcuno che sta su Windows. Se è il genere di cosa a cui Linux ti ha abituato a rinunciare, è qui che la trovi.
    .siblings = Lo stesso lettore su [Windows](/windows) e [macOS](/macos).

linux-why = Il problema per cui è stato scritto
linux-why-1 = I buoni lettori Linux rinunciano ognuno a qualcosa. Il tagging di Tauon resta in superficie. Strawberry non lo componi a pannelli. Quod Libet non è un lettore per cui qualcuno si metterebbe a fare temi. Lo stack che fa insieme pannelli, tagging approfondito e un modo di fare i temi è bloccato su Windows da vent'anni.
linux-why-2 = Far girare quello stack sotto Wine funziona finché non funziona più. Una skin come CaTRoX sta insieme grazie a soluzioni di fortuna impilate e, in alcuni punti, a Internet Explorer che renderizza dentro i pannelli. Attraverso uno strato di traduzione diventa evidente quanta parte sia fortuna, e ogni aggiornamento del sistema è un'occasione per scoprirlo.
linux-why-3 = rox è quella forma scritta in modo nativo: una quarantina di tipi di pannello che disponi tu, un editing dei tag a cui puoi affidare una collezione vera, e temi che viaggiano come un singolo file.

linux-install = Installarlo
linux-install-1 = Su Arch sta sull'AUR come `rox-player`, co-mantenuto dall'autore. Va bene qualsiasi helper, oppure cloni e lanci `makepkg -si` a mano.
linux-install-2 = Il repository è anche un flake, quindi Nix e NixOS lo ottengono senza un passaggio di pacchettizzazione. Il primo comando avvia rox senza installare nulla, il secondo lo mette nel tuo profilo.
linux-install-3 = Ovunque altro, estrai il tarball e avvia `./rox`. Un binario, nessun installer, niente che resti indietro quando lo cancelli.

linux-display = Wayland e X11
linux-display-1 = Entrambi, in modo nativo, tramite gpui. Le decorazioni della finestra sono un'impostazione per spazio di lavoro invece che una decisione presa in fase di compilazione, quindi puoi usare decorazioni lato server su un layout e una senza bordi sul successivo, senza riavviare in una build diversa.

linux-alsa = Uscita esclusiva tramite ALSA
linux-alsa-1 = La modalità esclusiva apre la scheda audio direttamente come `hw:CARD=x,DEV=n`. È l'unico nome ALSA senza dmix, senza plug e senza server audio da nessuna parte nel percorso, ed è proprio questo che ne fa l'unica strada che rifiuta una frequenza che non sa fare invece di ricampionare in silenzio verso qualcos'altro.
linux-alsa-2 = Lo scambio è quello onesto: finché rox tiene la scheda in modalità esclusiva, la tiene. Nient'altro nel sistema suona attraverso quel dispositivo finché non smetti. rox ti dice cosa ha davvero accettato l'hardware invece di cosa hai chiesto, così una discrepanza compare come un numero invece che come un sospetto.
linux-alsa-3 = La modalità condivisa è quella predefinita e si comporta come qualsiasi altra applicazione sul tuo desktop.

linux-desktop = Integrazione con il desktop
linux-desktop-1 = I tasti multimediali e il brano in riproduzione passano da un vero servizio MPRIS, quindi playerctl, i widget multimediali di GNOME e KDE, e qualsiasi altra cosa parli `org.mpris.MediaPlayer2` lo vedono senza configurazione.
linux-desktop-2 = L'icona nell'area di notifica va sul bus tramite StatusNotifierItem, ed è questo che rende sicura la chiusura in tray: se non c'è nessun host SNI in esecuzione a riceverla, chiudere l'ultima finestra chiude davvero, invece di lasciare in giro un processo senza interfaccia a cui non puoi più tornare.

linux-benchmarks = Nei benchmark ci sono solo lettori Linux
linux-benchmarks-1 = La tabella comparativa di questo sito è stata eseguita su Linux contro software Linux: Elisa, fooyin, Quod Libet, Strawberry, Museeks e Tauon, tutti su una sola macchina con la stessa libreria da 50.000 tracce. rox mostra una finestra in 0,3 secondi e si assesta a 134 MB. Il secondo più leggero, tra quelli che arrivano in fondo al caricamento, usa quasi il triplo della memoria.

linux-limit-arch = Solo x86_64. Non c'è una build Linux aarch64, quindi le schede ARM e Asahi richiedono una compilazione dai sorgenti.
linux-limit-plugins = Nessuna API per plugin, quindi qui niente sostituisce un componente Foobar2000 preciso da cui dipendi.

## Windows

windows = rox - un lettore musicale per Windows senza installer
    .description = Un lettore musicale Windows nativo per grandi librerie locali. Uno zip senza installer, modalità portatile, uscita esclusiva WASAPI, editing dei tag approfondito, e pannelli che componi tu.
    .h1 = Un lettore musicale per Windows, da chi Windows l'ha lasciato
    .lede = Su Windows Foobar2000 gioca in casa, e in casa è fortissimo. Questa pagina lo dice senza giri, insieme ai motivi precisi per cui potresti volere comunque rox.
    .aside = Quello che costruisci qui è un file, e si apre identico sulla macchina Linux o Mac accanto. Se una configurazione su cui hai passato un fine settimana è mai rimasta bloccata su un solo sistema operativo, è quella la parte che vale un pomeriggio.
    .siblings = Lo stesso lettore su [Linux](/linux) e [macOS](/macos).

windows-awkward = Partiamo dalla parte scomoda
windows-awkward-1 = Se usi Windows e il tuo Foobar2000 è configurato come piace a te, stabile da anni, rox non è un passo avanti. Foobar2000 ha due decenni di componenti, un ingombro minore e nessuna sorpresa rimasta dentro. Far finta del contrario su una pagina come questa sarebbe il modo più facile di farti buttare via il pomeriggio.
windows-awkward-2 = I motivi per dare comunque un'occhiata sono pochi e concreti. Vuoi lo stesso lettore e lo stesso layout sulla macchina Linux o Mac che comunque usi. Vuoi un codice leggibile e una licenza AGPL invece di freeware chiuso. Oppure vuoi un modo vero di condividere i temi, in cui un look intero è un file che puoi mandare a qualcuno, invece di una cartella di componenti, configurazioni e script che si rimonta solo sulla tua macchina.

windows-install = Installarlo
windows-install-1 = Estrai dove vuoi e avvia `rox.exe`. Nessun installer, nessun servizio, nessuna voce di disinstallazione e niente in esecuzione in background una volta chiuso.
windows-install-2 = La modalità portatile tiene libreria, impostazioni e cache in una cartella `rox-data` accanto all'eseguibile, quindi tutto sta su una chiavetta. Passa `--portable` per un avvio, oppure metti un file vuoto chiamato `portable` accanto all'eseguibile per renderlo permanente.
windows-install-3 = Il binario non è firmato, quindi SmartScreen protesterà la prima volta. Ulteriori informazioni, poi Esegui comunque. I certificati di firma costano soldi che un lettore gratuito non ha, e dirlo è meglio che far passare l'avviso per un bug.

windows-wasapi = Uscita esclusiva tramite WASAPI
windows-wasapi-1 = La modalità esclusiva prende l'endpoint in WASAPI exclusive, il che mette la frequenza e la profondità di bit del file davanti al convertitore senza niente in mezzo. rox riferisce cosa ha davvero accettato il dispositivo, quindi se l'hardware ha rifiutato in silenzio i tuoi 192 kHz lo scopri da un valore a schermo invece che da una discussione su un forum.
windows-wasapi-2 = Finché tiene l'endpoint, nient'altro sulla macchina suona attraverso quel dispositivo. È questo che significa esclusiva ed è il motivo per cui non è l'impostazione predefinita.

windows-integration = Il resto dell'integrazione con Windows
windows-integration-1 = I tasti multimediali e il riquadro del brano in riproduzione passano da SMTC, la stessa superficie di sistema che usano le app integrate, quindi il pannello dei tasti del volume mostra la traccia e i pulsanti di riproduzione funzionano.
windows-integration-2 = C'è un'icona nell'area di notifica con la chiusura in tray, quindi chiudere l'ultima finestra lascia la musica in riproduzione invece di fermarla, e l'icona è la strada per rientrare. Uno spazio di lavoro può anche togliere del tutto la cornice della finestra, o tenerla e rinunciare solo al bordo di ridimensionamento, il che lascia intatti l'ombra, i layout Snap e Win+freccia e costa solo il trascinamento dal bordo.

windows-limit-instance = Nessun blocco a istanza singola. Su Linux e macOS un secondo avvio consegna i suoi file al rox già in esecuzione; su Windows parte una seconda copia.
windows-limit-signing = Solo x86_64, e il binario non è firmato, quindi aspettati SmartScreen una volta.
windows-limit-plugins = Nessuna API per plugin, quindi un componente Foobar2000 preciso non ha un equivalente qui.

## macOS

macos = rox - un lettore musicale nativo per macOS
    .description = Un lettore musicale macOS nativo per grandi librerie locali. Apple Silicon, firmato e notarizzato, menu nella barra di sistema, uscita esclusiva CoreAudio, ed editing dei tag approfondito.
    .h1 = Un lettore musicale nativo per macOS
    .lede = Foobar2000 ora ha una vera build per Mac. Quello che sul Mac non ha è il motivo per cui la gente lo configurava su Windows.
    .aside = Menu dove macOS li mette, una quarantina di tipi di pannello da disporre come vuoi, e { workspace-count } look completi a un clic dalla finestra di benvenuto. Se configurare il lettore è la parte che ti piace davvero, qui c'è di che divertirsi.
    .siblings = Lo stesso lettore su [Linux](/linux) e [Windows](/windows).

macos-gap = Cosa manca sul Mac, nello specifico
macos-gap-1 = Foobar2000 v2 ha una versione macOS ufficiale, e questa pagina non farà finta di niente. Il punto è che l'ecosistema di componenti e skin, quello che rendeva un'installazione Windows degna di un fine settimana di configurazione, è rimasto su Windows. Su un Mac ottieni il lettore senza l'ecosistema che ne giustificava la scelta.
macos-gap-2 = rox riporta dentro la composizione e i temi: una quarantina di tipi di pannello disposti come vuoi, duplicati con le loro configurazioni, staccati in finestre vere, e un look intero salvato come un file condivisibile. Uno degli spazi di lavoro inclusi, { workspace-count } in tutto, è una ricreazione di CaTRoX, il che dice onestamente a cosa punta.

macos-install = Installarlo
macos-install-1 = Apri il DMG e trascina rox in Applicazioni. I rilasci sono firmati con un Apple Developer ID e notarizzati, quindi Gatekeeper lo lascia aprire senza il balletto del clic destro e Apri né un giro nel pannello di sicurezza.

macos-native = Si comporta come un'applicazione Mac
macos-native-1 = I menu stanno nella barra dei menu di sistema, dove macOS se li aspetta, non in una barra disegnata dentro la finestra. Il pulsante verde fa lo schermo intero nativo, e tenendo premuto Opzione ottieni lo zoom.
macos-native-2 = Chiudere l'ultima finestra lascia rox nel Dock invece di uscire, il che è la convenzione della piattaforma e la metà macOS della chiusura in tray.

macos-coreaudio = Uscita esclusiva tramite CoreAudio
macos-coreaudio-1 = La modalità esclusiva pilota il dispositivo tramite CoreAudio alla frequenza propria del file, e riferisce cosa ha accettato l'hardware invece di cosa era stato richiesto. Utile soprattutto se hai un DAC che se lo merita, e disattivata di default perché togliere un dispositivo al resto del sistema dovrebbe essere una decisione presa apposta.

macos-limit-silicon = Solo Apple Silicon. Non c'è una build Intel, quindi un Mac Intel richiede una compilazione dai sorgenti.
macos-limit-xcode = Compilare dai sorgenti richiede Xcode, con o senza nix: gpui compila shader Metal in fase di build e nix non può distribuire la toolchain Metal di Apple.
macos-limit-plugins = Nessuna API per plugin, quindi un componente Foobar2000 preciso non ha un equivalente qui.

## Miglior lettore per una libreria locale

best-breadcrumb = Miglior lettore musicale
best-title = Il miglior lettore musicale per una libreria locale nel { $year }
    .description = Le app di streaming e i lettori di libreria si giudicano su cose diverse. Cinque criteri che distinguono davvero i lettori musicali desktop una volta che la tua collezione è seria, misurati su 50.000 tracce.

best-lede = Non la migliore app musicale. Quelle sono client di streaming e si giudicano su catalogo e prezzo. Qui la domanda è più stretta: quale lettore desktop regge quando la musica è già sul tuo disco e ce n'è tanta.

disclosure = Trasparenza
best-disclosure = rox è uno dei lettori in questo confronto e questo è il suo sito, quindi leggi prima i criteri e poi i numeri. Tutti e cinque reggono, che tu finisca per scaricare qualcosa oppure no.

best-criteria = Cinque cose che li distinguono davvero

best-criterion-size = Deve sopravvivere alle dimensioni della tua libreria
    .body = La maggior parte dei lettori viene mostrata su qualche centinaio di album. I guasti interessanti cominciano nell'ordine delle decine di migliaia, dove la scansione si porta via una serata, lo scorrimento scatta e la memoria sale finché qualcosa cede. È l'unico criterio che non puoi valutare da uno screenshot, ed è quello che decide se fra un anno userai ancora quella cosa.

best-criterion-read = Deve leggere bene i tuoi tag
    .body = Una scorsa all'intestazione ti dà un nome di traccia e una durata sbagliata. Leggere in profondità vuol dire tag completi, durate reali, e il codec, la frequenza e la profondità di bit di ogni singolo file. Vuol dire anche che i file con tag rotti vengono indicizzati invece di essere scartati in silenzio, perché una libreria che perde di nascosto 300 file è peggio di una che lo ammette.

best-criterion-write = Deve lasciarti riscrivere i tag
    .body = Una collezione curata è una collezione che si modifica. Modifiche in blocco, scritture atomiche perché un crash non tronchi un file, e voti conservati nei file stessi invece che in un database che non puoi portarti via.

best-criterion-layout = Il layout deve essere il tuo
    .body = Il gusto qui è davvero personale, ed è proprio l'argomento a favore della composizione invece di un buon layout predefinito. Pannelli che disponi, duplichi con configurazioni proprie e stacchi in finestre vere battono qualsiasi singolo layout scelto da qualcun altro.

best-criterion-yours = Deve restare tuo
    .body = Alle librerie locali si torna quando un servizio toglie un album o cambia le condizioni. Un lettore che risponde a questo con un account, telemetria o un abbonamento non ha capito il senso di quello che sta suonando.

best-measured = Com'è il primo criterio, misurato
    .body = Sette lettori, una libreria da 50.000 tracce, una macchina, un banco di prova. Il tempo di avvio e il costo a riposo sono le parti che senti tutti i santi giorni.

best-shortlist = La rosa onesta
    .p1 = Se sei su Windows e usi già [Foobar2000](/foobar2000-alternative), hai la risposta e ce l'hai da vent'anni. Niente in questa pagina batte un Foobar2000 che funziona, sulla sua piattaforma.
    .p2 = Se vuoi qualcosa con un grande ecosistema di plugin e una lunga storia su Linux, Quod Libet e Strawberry sono entrambe risposte vere, ed entrambe sono più lente a caricare una libreria di queste dimensioni di quanto siano piacevoli una volta caricata. Se il criterio del tagging è quello che ti interessa davvero, è trattato a parte come [alternativa a Mp3tag](/mp3tag-alternative), e il lato volume del primo criterio è coperto in [ReplayGain](/replaygain).
    .p3 = rox è la risposta se vuoi la forma di Foobar2000 in modo nativo su Linux o macOS: pannelli che componi, tagging approfondito, temi come singoli file condivisibili, e un lettore che mostra una finestra in meno di un secondo con una libreria di queste dimensioni. È nuovo, e non ha un'API per plugin. Sono due costi reali.
    .aside = I cinque criteri qui sopra sono la base, non il tetto. I voti finiscono nei file stessi tramite FMPS e POPM invece che in un database che non puoi portarti via, e i generi a valori multipli si uniscono come un parere della libreria invece di riscrivere i tuoi tag. Se è questo che volevi da una libreria, è questo il lettore da puntare sul tuo disco.

best-closer = Misuralo sulla tua collezione
    .body = Il benchmark che conta è quello sul tuo disco. Libero e open source, nessun account, nessun installer.

## MusicBee

musicbee-breadcrumb = Alternativa a MusicBee
musicbee-title = Un'alternativa a MusicBee per Linux e macOS nel { $year }
    .description = MusicBee esiste solo per Windows. rox è un lettore nativo per grandi librerie locali su Linux, macOS e Windows, con tagging approfondito e un layout che componi tu. Compreso quello che MusicBee continua a fare meglio.

musicbee-h1 = Un'alternativa a MusicBee che non è solo per Windows
    .lede = Il problema di MusicBee, visto da una macchina Linux o Mac, è che è ottimo e non c'è. Questa pagina parla di cosa si trasferisce davvero e cosa no.

musicbee-good = Cosa fa bene MusicBee
    .p1 = L'ampiezza. Gestisce bene una libreria grande, si occupa di playlist automatiche e automazione della coda, sincronizza con lettori portatili, fa podcast e radio in streaming, converte formati, e con le skin diventa qualcosa che guardi volentieri. È gratuito, è rifinito, e per molte persone è l'ultimo lettore musicale che abbiano mai dovuto installare.
    .p2 = E gira su Windows, punto. Con Wine ne ottieni una versione, con la solita avvertenza che funziona finché un aggiornamento non decide altrimenti.

musicbee-gaps = Cosa non fa rox
    .body = Questo prima di tutto, perché è la parte che per molti decide la questione e seppellirla ti farebbe perdere tempo.
    .close = Quattro punti reali, e l'elenco non è stato gonfiato per sembrare onesto. Se due di questi fanno parte del tuo modo di usare un lettore, fermati qui.

musicbee-gap-sync = **Nessuna sincronizzazione con dispositivi.** Se la musica la sposti su un telefono o su un DAP passando dal lettore, rox non ha proprio una risposta.
musicbee-gap-radio = **Nessun podcast né radio in streaming.** rox riproduce i file sul tuo disco.
musicbee-gap-plugins = **Nessuna API per plugin.** Quello che avresti risolto con un'estensione deve esistere già.
musicbee-gap-ffmpeg = **La conversione richiede ffmpeg.** rox converte tra formati, ma pilota un ffmpeg che hai installato tu invece di portarsi dietro un encoder proprio, e non ricodifica in direzione di un dispositivo perché non c'è nessuna sincronizzazione per cui ricodificare.

musicbee-transfers = Cosa si trasferisce, e cosa è meglio
    .p1 = La libreria regge alle dimensioni che gli utenti di MusicBee tendono ad avere. Uno scanner parallelo legge tag completi, durate reali e il codec, la frequenza e la profondità di bit di ogni file invece di scorrere le intestazioni, e i file con tag illeggibili vengono indicizzati per nome file invece di sparire in silenzio. L'editing dei tag è un editor vero, con modifiche in blocco, una griglia per file, e un [percorso di scrittura che copia e verifica](/mp3tag-alternative) invece di modificare gli originali sul posto.
    .p2 = L'interfaccia è la differenza più grossa. MusicBee ti dà un buon layout e un po' di personalizzazione; rox ti dà una quarantina di tipi di pannello che disponi tu, duplichi con configurazioni proprie e stacchi in vere finestre di sistema. Un look intero è un file con layout, palette e aspetto, il che significa che l'assetto su cui ti fermi lo puoi passare a qualcun altro, o portare sull'altra macchina, invece di lasciarlo vivere su una sola installazione.
    .p3 = Le playlist automatiche si trasferiscono. Una playlist intelligente in rox è una query salvata scritta nella stessa sintassi del campo di ricerca, con ordinamento e limite facoltativi, e si riesegue a ogni aggiornamento del pannello invece di conservare un'istantanea vecchia. L'editor ti mostra man mano cosa pesca la query mentre la scrivi, così scopri di aver scritto la regola sbagliata prima di salvarla con un nome.
    .p4 = C'è anche l'automazione della coda: rox la ricarica quando si svuota, dal tuo ordine di navigazione, dalle tracce a cui non arrivi mai, o da come suona la traccia in corso. Quest'ultima cosa nasce dall'analisi dei tuoi file sulla tua macchina, quindi funziona su una libreria di cui su internet nessuno ha mai sentito parlare.

musicbee-size = La questione delle dimensioni
    .body = MusicBee non è in questa tabella, perché i benchmark sono stati eseguiti su Linux, dove non gira. È qui come risposta a «l'alternativa crolla alle dimensioni della mia libreria?», misurata su 50.000 tracce.

musicbee-split = Il bivio onesto
    .p1 = Resti su Windows con un MusicBee che sincronizza il telefono e lo riempie di podcast? Niente qui lo sostituisce, e cambiare ti costerebbe due funzioni di cui rox non ha alcuna versione.
    .p2 = Passi a Linux o a un Mac, o ci sei già e guardi il vuoto lasciato da MusicBee? È tutta la ragione per cui questo esiste, e lo scambio è preciso: rinunci alla sincronizzazione e ai podcast, e ottieni un lettore nativo con un tagging più profondo, un layout che costruisci tu, e una libreria che resta veloce a cinquantamila tracce.
    .aside = Staccare un pannello in una finestra di sistema tutta sua, o passare a qualcuno l'intero layout come un file, non sono righe di un confronto di funzioni perché dall'altra parte non c'è niente da confrontare. Se è questo che cercavi, l'hai trovato.

musicbee-closer = Mettilo alla prova sulla tua libreria
    .body = Libero e open source sotto AGPL, nessun account e nessun installer. C'è anche un [confronto con Foobar2000](/foobar2000-alternative), se è davvero quella la configurazione che stai lasciando.

## CaTRoX

catrox-title = CaTRoX, ricostruito come lettore nativo
    .description = Il tema CaTRoX per foobar2000, chi l'ha costruito, e cosa è servito per far girare quel look in modo nativo su Linux e macOS, senza Windows né Wine sotto.

catrox-h1 = CaTRoX, senza Windows sotto
    .lede = rox include uno spazio di lavoro CaTRoX. Questa è la pagina sul perché, e sulle persone al cui lavoro si appoggia.

catrox-credit = Il merito a chi spetta
    .body = CaTRoX è un tema per foobar2000. Il design e la palette originali sono di eXtremeHunter1972, e l'edizione che la maggior parte delle persone ha davvero usato è [CaTRoX_QWR](https://theqwertiest.github.io/CaTRoX_QWR/), ricostruita e mantenuta da TheQwertiest. rox non è affiliato a nessuno dei due, e niente qui è codice loro. Lo spazio di lavoro qui sotto è la ricreazione di un look che hanno fatto loro.

catrox-was = Cos'era CaTRoX
    .p1 = Un layout denso, scuro e orientato all'informazione per foobar2000: la copertina resa come CD, un elenco di campi di metadati su un lato, tracce raggruppate per album con pallini di valutazione, e una barra dei menu esattamente dove va una barra dei menu. È quello che la gente intende quando dice che foobar2000 può essere bello, ed è gran parte del motivo per cui qualcuno si è mai sobbarcato la configurazione di foobar2000.
    .p2 = Non è mai stata una skin nel senso in cui la intende di solito un lettore musicale. CaTRoX è una pila di componenti, script di pannelli e configurazione, assemblata. È questo che lo rendeva potente, ed è anche questo che lo rende difficile da spostare, difficile da condividere e facile da rompere.

catrox-nekorox = Dove è entrato NekoRoX
    .p1 = L'autore di rox ne ha mantenuto un fork per anni. [NekoRoX](/nekorox) era CaTRoX con sopra un mucchio di pannelli, plugin e moduli di comodità: navigazione ad albero e a filtri, modalità mini e micro player, un pannello di testi sincronizzati, uno scorrimento di copertine, la presenza su Discord, strumenti Last.fm. Ora in cima al suo README c'è una nota che dice che non è più mantenuto, e che punta qui.
    .p2 = Il motivo di quella nota è il contenuto onesto di questa pagina. Passare a Linux a tempo pieno significava far girare l'intero assemblaggio sotto Wine, e una pila tenuta insieme da soluzioni di fortuna impilate, che in alcuni punti renderizza Internet Explorer dentro i pannelli, non gradisce uno strato di traduzione. Girava. Dava anche l'impressione che il prossimo aggiornamento potesse fermarlo per sempre, con dentro dieci anni di configurazione.

catrox-recreation = La ricreazione
    .body = Lo spazio di lavoro CaTRoX in rox è quel layout ricostruito con pannelli nativi: la resa circolare della copertina, l'elenco dei campi di metadati, l'elenco delle tracce raggruppato per album con i suoi pallini di valutazione, la barra dei menu. È un look, riprodotto, non il port di qualcosa. Nessun codice di CaTRoX esiste in rox e non potrebbe, dato che rox è Rust su [gpui](@gpui) e CaTRoX sono script di pannelli che girano dentro foobar2000. Il confronto più ampio con foobar2000, comprese le voci in cui è ancora avanti, sta su [una pagina sua](/foobar2000-alternative).
    .after = La parte che è cambiata è cosa serve per averlo. In rox un look intero è un singolo file che tiene insieme layout, palette e aspetto, quindi lo spazio di lavoro CaTRoX è a un clic dalla finestra di benvenuto, e quello che ci costruisci sopra è un file che puoi passare a qualcun altro. Nessun elenco di componenti, nessun ordine di installazione, nessuna configurazione che si rimonta solo sulla macchina su cui è stata costruita.

catrox-shot-alt = Lo spazio di lavoro CaTRoX in rox: una resa circolare della copertina a CD, un elenco di campi di metadati a sinistra con titolo, artista, album, codec e bitrate, e a destra tracce raggruppate per album con pallini di valutazione.

catrox-limits = Cosa non recuperi
    .aside = Quello che ottieni in cambio è un layout che si apre su Linux e macOS senza Wine nei paraggi, sopravvive a un aggiornamento di sistema e viaggia come un file. Dopo un decennio passato a mantenere l'originale, quello scambio è l'intera ragione per cui rox esiste.

catrox-limit-panels = Non ogni pannello di CaTRoX ha un equivalente. rox ha una quarantina di tipi di pannello suoi e non sono gli stessi quaranta.
catrox-limit-youtube = Nessuna riproduzione da YouTube. CaTRoX e NekoRoX ce l'avevano entrambi tramite componenti; rox riproduce quello che sta sul tuo disco.
catrox-limit-plugins = Nessuna API per plugin, quindi quello che avresti risolto con un componente foobar2000 deve esistere già in rox oppure non esiste affatto.
catrox-limit-fidelity = È una ricreazione fatta dall'esterno. I dettagli differiscono, e una corrispondenza al pixel non è mai stata l'obiettivo.

# $others è il numero degli spazi di lavoro inclusi meno questo. Prima
# c'era scritto "Cinque", che ha smesso di essere vero due spazi di lavoro
# fa.
catrox-closer = Provalo
    .body = Lo spazio di lavoro CaTRoX è incluso, a un clic dalla finestra di benvenuto. Ce ne sono altri { $others }, tra cui un [layout Foobar e uno a forma di WinAmp](/workspaces).

## Cue sheet

cue-breadcrumb = Cue sheet
cue-title = Riprodurre i rip FLAC e CUE, una traccia alla volta
    .description = Un'immagine di disco intero accanto a un cue sheet, indicizzata come tracce vere: ogni segmento si scorre, si ordina, si scrobbla e passa senza stacchi al successivo, e le tue playlist non scoprono mai che tre righe condividono un file.

cue-h1 = I cue sheet, e i rip che si comportano da album
    .lede = Se hai rippato CD prima che dividere fosse la norma, una fetta della tua libreria è un FLAC per disco con accanto un file di testo. La maggior parte dei lettori o ignora lo sheet o tratta quello che descrive come roba di serie B. Ecco cosa ne fa rox.

cue-what = Cos'è davvero un rip cue
    .p1 = Un file audio che contiene un disco intero, e uno sheet `.cue` che elenca dove comincia ogni brano. È il modo accurato di conservare un CD, perché le pause tra i brani fanno parte del disco e dividere le butta via. È anche il formato che rompe l'assunto su cui è costruita ogni libreria musicale, cioè che un file è una traccia.
    .p2 = I lettori lo risolvono in uno di tre modi. Ignorare lo sheet e mostrare un brano da settanta minuti. Mostrare i brani dello sheet ma tenerli separati dalla libreria vera, così ricerca, ordinamento e playlist si comportano diversamente per loro. Oppure rendere la rottura reale e assorbirla una volta per tutte.

cue-rows = Righe vere, non frammenti
    .p1 = rox indicizza ogni segmento dello sheet come una normale riga della libreria, identificata dal suo file più il numero di traccia. Tutto quello che viene dopo la legge come una traccia, perché per tutto quello che viene dopo lo è. Le playlist la fotografano, gli ascolti ci si agganciano, la ricerca la trova, le colonne di ordinamento la ordinano, e nessuna di queste sa che undici righe puntano allo stesso FLAC.
    .p2 = L'alternativa che sceglie la maggior parte delle implementazioni è un percorso sintetico, `album.flac#3`, che tiene ordinato il database e sposta il problema su ogni pezzo di codice che aprirà quel percorso più tardi. Un suffisso non rimosso lì è un bug silenzioso che legge byte di tag dal nulla. Una libreria senza cue sheet non paga niente di tutto questo: i segmenti vivono in una tabella a parte, e sui percorsi caldi non li legge nessuno.

cue-playing = Riprodurre un segmento come un file
    .p1 = Il motore tratta un segmento come il mondo intero per quella traccia: un seek preciso al suo inizio, un taglio al campione su entrambi i bordi, e un confine di fine che prende la stessa strada di una vera fine di file. La riproduzione senza stacchi, la dissolvenza incrociata, lo stop dopo il brano corrente e la ripetizione funzionano tutti senza sapere che i segmenti esistano.
    .p2 = Il taglio in testa è il dettaglio che conta. Un seek preciso atterra su un confine di pacchetto invece che sul campione esatto, quindi senza scartare i frame tra l'atterraggio e l'inizio del segmento ogni brano si apre sulla coda di quello prima. È il suono di un'implementazione cue che nessuno ha finito.
    .p3 = I brani consecutivi di un rip condividono un gruppo album, ed è questo che impedisce alla dissolvenza incrociata di sfumare sopra gli attacchi senza stacchi del disco stesso. Un rip suona come il disco da cui è stato tratto.

cue-scanning = La scansione, e il diritto di cambiare idea
    .p1 = Lo sheet rivendica la sua immagine. Finché un cue elenca un file, quel file non ottiene una riga sua, quindi non ti ritrovi con undici tracce più un doppione da settanta minuti. L'aggiornamento si basa su quale dei due è stato modificato per ultimo, quindi modificare lo sheet o l'audio ritaglia il rip alla scansione successiva. Cancella lo sheet e l'immagine si richiude in una sola riga semplice.
    .p2 = I metadati preferiscono lo sheet e ricadono sui tag dell'immagine. Gli sheet scritti prima che esistesse la disciplina UTF-8 ottengono un ripiego cp1252, perché i vecchi rip sono esattamente la popolazione per cui questa funzione esiste.

cue-ratings = Voti che non timbrano tutto il disco
    .p1 = rox normalmente scrive i voti nei file stessi, che è la scelta giusta finché un file è una traccia. Su un rip cue non lo è: l'immagine appartiene a tutte e undici le tracce, quindi una scrittura per traccia timbrerebbe ognuna con le stesse stelle.
    .p2 = Per queste righe lo scrittore rifiuta la parte su file e il database tiene il valore. Lo stesso per le modifiche ai tag. Ottieni voti per traccia su un rip, e la tua immagine ne esce identica byte per byte.

cue-outstanding = Per ora restano fuori
    .body = I picchi della forma d'onda e il passaggio di analisi acustica leggono ancora l'immagine intera invece del segmento. I testi sono per file, quindi tutto il rip ne condivide uno. La misura ReplayGain per segmento, la modifica dei cue sheet nell'app e i blocchi CUESHEET incorporati nel FLAC non sono gestiti. Ognuno si aggiunge sopra al modo in cui i segmenti vengono identificati, e nessuno lo cambia.

cue-later = Le parti che noteresti solo dopo
    .aside = La misura di tutto questo non è se un rip si riproduce. È se, un mese dopo, qualcosa nella libreria si comporta ancora diversamente perché veniva da un'immagine.

cue-later-m3u = L'esportazione m3u scrive i segmenti come `path#N`, e l'importazione preferisce una corrispondenza esatta di percorso, quindi un elenco fa andata e ritorno attraverso altri software senza collassare sull'immagine.
cue-later-scrobble = Lo scrobbling e il brano in riproduzione deduplicano sulla coppia, quindi le undici tracce di un disco si scrobblano come undici tracce e non come una molto lunga.
cue-later-listens = Gli ascolti si riagganciano per segmento dopo una nuova scansione, quindi un disco conserva la sua cronologia di riproduzione per traccia anche quando ogni segmento porta tag identici.
cue-later-replaygain = Passa solo la coppia album dei valori ReplayGain. I valori per traccia scritti contro un'immagine di disco intero descrivono il disco, quindi vengono ignorati invece che creduti.

cue-closer = Puntalo sullo scaffale che non hai mai diviso
    .body = Lo scanner raccoglie gli sheet già alla prima passata, insieme a tutto il resto. Altro su [cosa si rompe alle dimensioni di una libreria](/best-music-player).

## Foobar2000

fb-breadcrumb = Alternativa a Foobar2000
fb-title = Un'alternativa a Foobar2000 per Linux, macOS e Windows nel { $year }
    .description = Foobar2000 ha azzeccato i layout a pannelli, il tagging approfondito e una scena di temi, e ne ha lasciato la maggior parte bloccata su Windows. rox è un lettore nativo e open source che porta tutte e tre su Linux e macOS.

fb-h1 = Un'alternativa a Foobar2000 che gira ovunque
    .lede = Foobar2000 ha azzeccato tre cose che quasi nient'altro azzecca insieme, e ne ha lasciate due bloccate su Windows. rox è il tentativo di portarle tutte e tre dall'altra parte.

fb-right = Cosa ha azzeccato Foobar2000
    .p1 = Un'interfaccia che monti a partire da pannelli invece di accettare quello che lo sviluppatore ti ha consegnato. Sopra a quella, una scena di temi, ed è solo per questo che CaTRoX, [NekoRoX](/nekorox) e Georgia esistono. E una gestione di tag e libreria che non crolla quando la collezione arriva a decine di migliaia di file.
    .p2 = Molti lettori ne fanno una. Pochissimi ne fanno due. Lo stack che le fa tutte e tre è di fatto solo per Windows da vent'anni, e ogni tentativo di spostarlo ha significato rinunciare a una di esse.

fb-leaves = Dove ti lascia a piedi
    .p1 = Su Linux non c'è una build Foobar2000 ufficiale, quindi le opzioni oneste sono Wine o qualcos'altro. Wine funziona finché non funziona più. Una skin come CaTRoX si appoggia a soluzioni di fortuna impilate e, in alcuni punti, a Internet Explorer che renderizza dentro i pannelli, e farlo passare per uno strato di traduzione mostra esattamente quanta parte sia tenuta insieme dalla fortuna. È sempre a un aggiornamento di sistema dal rompersi.
    .p2 = macOS sta meglio di prima, da quando Foobar2000 v2 include una vera build per Mac. Ma la parte che la gente vuole davvero, l'ecosistema di componenti e skin che rendeva la versione Windows degna di un fine settimana di configurazione, è rimasta su Windows. Ottieni il lettore senza il motivo per cui volevi il lettore.
    .p3 = E su Windows stesso non c'è niente che non vada. Vale la pena dirlo chiaramente: se sei su Windows e il tuo Foobar2000 funziona, rox non è un'emergenza.

fb-does = Cosa fa rox al riguardo
    .p1 = Nativo su tutte e tre le piattaforme, un binario ciascuna, scritto in Rust su [gpui](@gpui). Una quarantina di tipi di pannello che disponi tu, duplichi con configurazioni indipendenti e stacchi in vere finestre di sistema. Lo scanner della libreria legge tag completi, durate reali e il codec, la frequenza e la profondità di bit di ogni file invece di scorrere le intestazioni, e regge a 50.000 tracce.
    .p2 = La risposta sul fronte dei temi è la parte che è cambiata di più. Uno spazio di lavoro è un singolo file che tiene insieme layout, palette e aspetto. Lo modifichi, lo rompi, lo passi a qualcuno e quella persona ottiene esattamente quello che avevi tu. Uno degli spazi di lavoro inclusi, { workspace-count } in tutto, è una [ricreazione di CaTRoX](/catrox), ed è l'onesta dichiarazione d'intenti.

fb-shot-alt = Lo spazio di lavoro CaTRoX in rox: la skin foobar2000 ricreata in modo nativo, con una resa circolare della copertina a CD, un elenco di campi di metadati a sinistra e tracce raggruppate per album con pallini di valutazione.

fb-table = Fianco a fianco
    .caption = Foobar2000 e rox a confronto su supporto delle piattaforme, temi, licenza e maturità
    .area = Ambito
    .method = Tre righe vanno a Foobar2000, e sono le tre dove ci vorrebbero anni per colmare il divario. Una tabella comparativa in cui una colonna vince tutto è pubblicità, non un confronto.

fb-row-linux = Nativo su Linux
    .fb = Nessuna build ufficiale. Solo Wine.
    .rox = A pieno titolo, x86_64.

fb-row-macos = Nativo su macOS
    .fb = Build ufficiale dalla v2.
    .rox = A pieno titolo, Apple Silicon.

fb-row-windows = Nativo su Windows
    .fb = Casa sua. Da oltre vent'anni.
    .rox = A pieno titolo, x86_64.

fb-row-panels = Pannelli da comporre
    .fb = Sì, tramite Columns UI e affini.
    .rox = Una quarantina di tipi di pannello, integrati, nessun componente da installare.

fb-row-sharing = Condividere un look
    .fb = Una skin è un mucchio di componenti, configurazioni e script. Notoriamente macchinosa.
    .rox = Un file solo, con layout, palette e aspetto.

fb-row-source = Sorgente disponibile
    .fb = Freeware a codice chiuso.
    .rox = AGPL-3.0, tutto quanto.

fb-row-components = Ecosistema di componenti
    .fb = Ognuno ha costruito su chi c'era prima. Qualsiasi cosa ti venga in mente.
    .rox = Nessuna API per plugin.

fb-row-maturity = Maturità
    .fb = Dal 2002. Non ti sorprende.
    .rox = Dal 2026. Ti sorprenderà, ogni tanto.

fb-row-footprint = Ingombro
    .fb = Notoriamente minuscolo.
    .rox = Un binario da 62 MB, 134 MB residenti a 50k tracce.

fb-not = Chi non dovrebbe cambiare
    .p1 = Se sei su Windows, i tuoi componenti sono configurati e la cosa è stabile da un decennio, qui non c'è niente che valga il disturbo. Se dipendi da un componente Foobar2000 preciso, rox non ha un'API per plugin e non può sostituirlo. Se vuoi un software che ha già fatto tutti i suoi errori, rox è giovane di quattro anni.
    .p2 = Se sei passato a Linux lasciandoti dietro la configurazione, o sei su un Mac con un lettore privo dell'ecosistema che lo giustificava, è quello il vuoto in cui questo è stato costruito.
    .p3 = Vale la pena dire anche l'altro lato dell'arrivare tardi. Niente in rox deve restare compatibile con una decisione presa nel 2002, ed è così che un look intero finisce per essere un file condivisibile invece di un grafo di componenti, che una sola base di codice copre tutte e tre le piattaforme, e che una quarantina di tipi di pannello arrivano inclusi invece di essere montati un download alla volta. È anche il motivo per cui l'identità di una traccia non è mai stata legata ai percorsi dei file, ed è questo che renderà possibile più avanti unire una libreria locale con qualcos'altro. Gran parte di quei 62 MB racconta la stessa storia.
    .aside = Pannelli che si staccano in vere finestre di sistema, o una palette che si ritinge dalla copertina in riproduzione, non sono mai entrati nella tabella qui sopra. Non c'era niente da mettere nell'altra colonna. Se è questo il genere di differenze che cerchi, rox è il posto giusto.

fb-closer = Mettilo alla prova sulla tua libreria
    .body = Libero, open source sotto AGPL, nessun account e nessun installer. Puntalo sulla collezione che rompe gli altri lettori.
    .fine = Oppure leggi prima il [codice sorgente](@repo). È un modo ragionevole di valutare un lettore che vuole il permesso di scrivere i tuoi tag. Ancora indeciso? I [criteri che distinguono i lettori di libreria](/best-music-player) sono scritti a parte, benchmark compresi.

## Mp3tag

mp3tag-breadcrumb = Alternativa a Mp3tag
mp3tag-title = Un'alternativa a Mp3tag per Linux e macOS nel { $year }
    .description = Editing dei tag in blocco su FLAC, MP3, MP4 e APE, una griglia per file per le importazioni disordinate, voti scritti nei file stessi, e un percorso di scrittura che non modifica mai un originale sul posto.

mp3tag-h1 = Un editor di tag che puoi puntare su diecimila file
    .lede = Mp3tag è lo strumento a cui pensa la maggior parte delle persone quando dice editor di tag, e non ne esiste una build per Linux. rox ha dentro un editor completo, e un percorso di scrittura pensato per il caso in cui un blocco è così grande che «di solito funziona» non basta più.

mp3tag-isnt = Partiamo da cosa non è
    .p1 = rox è un lettore musicale che contiene un editor di tag serio. Mp3tag è un tagger dedicato, e come tagger dedicato è migliore: script, azioni, stringhe di formato componibili, e vent'anni di spigoli limati. Se quello che vuoi è uno strumento a sé da lanciare su una cartella e poi chiudere, su Windows, è quello.
    .p2 = L'argomento per farlo in rox è che taggare una libreria di solito non è un compito che si finisce. È una cosa che fai mentre ascolti, sul file che hai appena notato essere sbagliato, ed è per questo che avere l'editor attaccato al lettore e alla libreria è il punto e non un compromesso.

mp3tag-write = Il percorso di scrittura
    .p1 = È la parte che vale la lettura anche se rox non lo installi mai. La maggior parte degli scrittori di tag modifica il file sul posto: apre l'originale, riscrive l'area dei metadati, e spera. Fila liscio decine di migliaia di volte e una volta è una catastrofe, perché un crash, un disco pieno o un supporto staccato a metà lasciano un file che non si legge più, con dentro il tuo audio.
    .p2 = rox non scrive mai dentro un originale. Ogni modifica copia il file, applica il cambiamento alla copia, verifica il risultato rileggendo i metadati e calcolando l'hash del flusso audio per confermare che sia identico byte per byte a quello che è entrato, e solo allora rinomina atomicamente la copia sopra l'originale. Se un passaggio fallisce la copia viene rimossa e il tuo file resta intatto, perché non è mai stato aperto in scrittura.
    .p3 = Ogni file è anche isolato, quindi un file patologico in un blocco di quattromila fallisce da solo invece di far saltare tutto il lotto.

mp3tag-cost = Il costo
    .body = Copia, verifica, rinomina significa che ogni modifica ha bisogno per un attimo di spazio libero pari al file, ed è più lento che scrivere sul posto. Su un blocco di qualche migliaio di FLAC è tempo vero e disco vero. È lo scambio che rox fa apposta, ed è l'intera ragione per cui l'editor si può puntare senza timore su una libreria invece che su una cartella.

mp3tag-batch = Modificare un blocco senza appiattirlo
    .p1 = Seleziona quante tracce vuoi e l'editor si apre come un unico modulo condiviso. Un campo su cui tutti i file concordano mostra il suo valore; i campi in disaccordo restano vuoti sotto un segnaposto che indica più valori. Solo i campi che tocchi davvero scrivono qualcosa, quindi un campo intatto non riscrive nessun file, e quelli che sarebbe assurdo timbrare su una selezione, cioè titolo, numero di traccia e numero di disco, in una modifica in blocco si disattivano da soli.
    .p2 = Quando un file dentro il blocco è sbagliato, il modulo diventa una tabella: una riga per traccia, una colonna per campo, i campi per traccia bloccati modificabili sul posto. È la vista per l'importazione in cui ogni titolo e ogni numero è sbagliato in modo diverso, e batte l'entrare nei campi uno alla volta. Entrambe le viste confermano come un unico blocco attraverso lo stesso percorso di scrittura, e il risultato arriva nella libreria senza una nuova scansione.

mp3tag-specs = Cosa legge e cosa scrive
mp3tag-spec-formats = **Formati.** ID3v2, commenti Vorbis, atomi MP4 e APE dietro un solo editor, quindi MP3, FLAC, M4A e il resto sono la stessa schermata.
mp3tag-spec-ratings = **Voti.** Scritti nei file stessi tramite FMPS e POPM, non in un database che non puoi portarti via.
mp3tag-spec-genres = **Generi a valori multipli.** Elenchi veri, le cui unioni restano un parere della libreria invece di una riscrittura dei tuoi tag.
mp3tag-spec-art = **Copertine.** Copertine con più immagini, aggiunte e sostituite attraverso lo stesso percorso atomico.
mp3tag-spec-lookup = **Ricerca.** Tag e copertine da MusicBrainz, iTunes e Deezer, applicati con lo stesso diff, così vedi cosa cambia prima che scriva.
mp3tag-spec-repair = **Riparazione.** Un passaggio per i file i cui tag sono danneggiati in modi noti invece che semplicemente sbagliati, quelli che fanno mostrare agli altri tagger una traccia come nome di file con durata zero.
mp3tag-spec-patterns = **Schemi, in entrambe le direzioni.** Una stringa di formato come `%artist% - %title%` estrae i tag da un nome di file, e lo stesso schema al contrario rinomina i file a partire dai loro tag. Entrambi mostrano l'anteprima di ogni traccia prima che venga scritto qualcosa.

mp3tag-stay = Chi dovrebbe restare con Mp3tag
    .p1 = Se sei su Windows e ti appoggi ad azioni, script o al lavoro più elaborato sulle stringhe di formato, rox non ha un equivalente e questo sarebbe un passo indietro. Se vuoi un tagger che non sia anche un lettore, questa è proprio la forma sbagliata.
    .p2 = Se sei su Linux o su un Mac, o se il tuo taggare avviene in mezzo all'ascolto invece che come lavoro separato, è quello il vuoto che questo riempie.
    .aside = Il percorso di scrittura è la parte che non ha una controparte con cui confrontarsi. Verificare l'hash di un flusso audio prima di rinominare sopra un originale non è una cosa che un tagger fa, a meno che non si aspetti di essere puntato su tutto quello che possiedi. Se è questo il tipo di prudenza che vuoi tra una modifica e i tuoi file, è quello che trovi qui.

mp3tag-closer = Puntalo sulla cartella che stai evitando
    .body = Libero e open source, nessun account, nessun installer. Il [lato libreria](/best-music-player) è trattato a parte, e se vieni da una configurazione Windows ci sono anche un confronto con [MusicBee](/musicbee-alternative) e uno con [Foobar2000](/foobar2000-alternative).

## La visualizzazione

viz-breadcrumb = Visualizzazione musicale
viz-title = Una visualizzazione musicale integrata nel lettore - rox
    .description = Pannelli di spettro, forma d'onda e VU, più shader WGSL su qualsiasi pannello o sull'intera finestra, mossi da segnali con un nome che ricavi dall'audio in riproduzione e mandi dove vuoi con una route.
    .image-alt = Il logo rox sopra la frase in inglese: signals off the music, shaders on every surface

viz-h1 = Una visualizzazione che vive nel lettore
    .lede = La maggior parte dei lettori ti dà un analizzatore di spettro e si ferma lì. rox ha quei pannelli e, sotto, uno strato di modulazione: segnali con un nome ricavati dall'audio, che una route porta dentro gli ingressi degli shader che scrivi tu, salvati nello stesso file in cui vive il resto del tuo tema.

viz-panels = Prima i pannelli normali
    .p1 = Un pannello di spettro con stili a barre o a blocchi, sfumature, picchi con una gravità propria, etichette di frequenza, e una zonizzazione divisa che analizza sopra e sotto una frequenza scelta con dimensioni di finestra diverse, così ciascun capo dell'intervallo baratta reattività e risoluzione per conto suo. Una striscia di forma d'onda che disegna l'intera traccia, per canale, e salta dove clicchi. Un VU. Una mensola di copertine che le ruota in vero 3D. Niente di tutto questo richiede una riga di codice ed è quello che userà la maggior parte delle persone.
    .p2 = Mettere in pausa congela le barre dov'erano, invece di lasciarle cadere a terra. Sembra una piccolezza finché non provi a guardare l'istante esatto in cui hai messo in pausa.

viz-shaders = Shader, su quattro superfici
    .p1 = Uno shader di rox è un singolo stadio di frammento WGSL. Può girare sul corpo di un singolo pannello, come pannello Shader a sé, come sovrapposizione sull'intera finestra, o come sfondo che dipinge sotto tutti i pannelli, dietro la copertina. La sovrapposizione e lo sfondo hanno ciascuno un interruttore che li estende a ogni finestra aperta di rox. Stesso linguaggio, stesso blocco di uniform, stesse route in tutti i casi.
    .p2 = Ogni shader riceve l'orologio, la risoluzione, il puntatore, e otto float meta che descrivono l'istante: il volume, dove sta la testina nella traccia, se l'audio si sta davvero muovendo, la durata della traccia, e quanto scura risulta la palette attuale, così che un singolo shader possa vestirsi per il chiaro e per lo scuro invece di nascere legato al tema per cui è stato scritto.
    .p3 = Uno shader di pannello può anche leggere cosa ha davvero disegnato il pannello. Un binding di maschera gli passa il disegno del pannello riprodotto su trasparenza, e i pannelli pubblicano la forma del loro contenuto, così un'ombra o un bagliore segue una copertina in letterbox invece delle bande vuote ai suoi lati.
    .p4 = Oltre uno stadio, un commento `// @pass` divide il testo in una catena fino a otto, ognuno in grado di leggere per nome i passaggi precedenti. È quello che serve a una piramide di sfocatura o a un bloom a due stadi. Una riga `// @asset` nomina un'immagine da campionare, e `// @asset art: @cover` collega la copertina della traccia in riproduzione, ricollegandosi quando la traccia cambia. Con l'applicazione arrivano nove esempi, ognuno dei quali dimostra una parte diversa di questo contratto invece di nove variazioni su un plasma.
    .p5 = Punta il pannello su un file sul disco e rox lo sorveglia. Salva nel tuo editor e la finestra ce l'ha. Un salvataggio che non compila lascia sullo schermo l'ultima versione buona con l'errore nel pannello, perché perdere l'immagine è un brutto modo di scoprire di aver sbagliato a scrivere un punto e virgola.

viz-signals = I segnali sono la parte che cambia tutto
    .p1 = Uno shader con dentro un orologio è un salvaschermo. Quello che ne fa una visualizzazione è ciò con cui lo nutri, e in rox è un insieme di segnali con un nome, condiviso dall'intera applicazione. Li costruisci in una finestra a parte, sotto Applicazione, accanto all'equalizzatore, e quella finestra ha uno spettro e i controlli di riproduzione per lo stesso motivo per cui li ha l'equalizzatore: scegli una banda a occhio e a orecchio su quello che stai davvero ascoltando.
    .p2 = Cinque tipi di sorgente. Una **banda** è l'energia tra due frequenze, il segnale su cui viaggia un crescendo. Il **livello** è l'intero mix. Un **attacco** pulsa quando una banda supera la propria media recente, il segnale su cui viaggia un colpo. Un **trigger** pulsa quando una banda attraversa una linea che hai tracciato, per il materiale in cui la media mobile non torna mai giù e un attacco ammutolisce dopo la prima battuta. Un **totale** somma un altro segnale nel tempo e, arrivato a uno, riparte da zero, così uno shader può leggerlo come una fase che avanza finché la musica è forte e si ferma quando non lo è.
    .p3 = Ognuno porta con sé uno smorzamento della risposta e una soglia. La soglia è l'impostazione che si guadagna il posto: una banda che segue il rumore di fondo tiene per sempre ogni manopola collegata leggermente fuori dalla posizione di riposo, e una soglia con una curva sopra restituisce invece silenzio tra un colpo e l'altro. L'indicatore disegna il valore non filtrato con la soglia tracciata attraverso, dato che una barra sparita sotto la propria soglia non aiuterebbe per niente a posizionarla.
    .p4 = Una route lega un segnale a un parametro con un intervallo di uscita: questo segnale, questo parametro, da qui a lì. Sedici slot raggiungono ogni shader, e gli slot rimasti liberi ricevono un semplice cursore nelle impostazioni, così un look può essere per metà suonato dalla musica e per metà regolato a mano.

viz-tap = Misurato prima della manopola del volume
    .body = Il punto di prelievo che le visualizzazioni leggono sta prima del volume di uscita. Abbassare la musica prima la faceva sembrare più debole di quello che è, e un segnale tarato a un volume era sbagliato a un altro. L'equalizzatore e ReplayGain si vedono comunque, dato che agiscono a monte e fanno parte di quello che stai ascoltando.

viz-critters = Critters, come argomento
    .body = Uno degli spazi di lavoro inclusi è l'intero lettore reso come stampa a 1 bit: un dithering ordinato su ogni superficie, toni che collassano con i bassi profondi, e un muro di rumore dietro i pannelli che si muove con il brano. Sono cinque segnali e quattro shader in un singolo file, e niente di tutto questo è un caso speciale nell'applicazione.
    .caption = Caricalo dalla finestra di benvenuto, poi apri le impostazioni e smontalo. [Tutti gli altri](/workspaces).

viz-trust = Eseguire lo shader di uno sconosciuto
    .p1 = Gli shader viaggiano dentro i file degli spazi di lavoro, quindi un look importato arriva portando il codice di qualcun altro.
    .p2 = Niente viene eseguito finché non lo dici tu. Il sorgente di ogni shader riceve un'impronta, e l'elenco degli approvati è locale alla macchina e viene scritto solo da un'azione diretta: hai scelto il file, hai ricaricato, hai scelto un preset, hai premuto Approva. Un look arrivato dentro un pacchetto resta lì inerte con un pulsante sotto fino ad allora. Gli esempi che arrivano con rox sono affidabili per costruzione, perché sono compilati dentro il binario.
    .p3 = Attivarne uno apre una finestra di conferma che aspetta una risposta invece di fare un conto alla rovescia, e su quella finestra non gira mai nessuno shader. Qualunque cosa lo shader faccia al resto dello schermo, la via d'uscita resta leggibile.

viz-limits = Cosa non è gestito
    .aside = La distanza tra «voglio che tutto il lettore lampeggi sulla cassa» e averlo sono una banda, una soglia e una route, e nessuna delle tre richiede di ricompilare.

viz-limit-routes = Le route raggiungono gli slot degli shader e le manopole del pannello particelle. Le impostazioni di ogni altro pannello restano manopole che imposti a mano.
viz-limit-milkdrop = WGSL, non Milkdrop né AVS. Non c'è un importatore per nessuno dei due, e vent'anni di preset non passano.
viz-limit-midi = Nessuna superficie di controllo MIDI o OSC. Il passaggio di sovrapposizione e i passaggi dei pannelli sono quello che c'è, mossi dall'audio e dal puntatore.
viz-limit-battery = Un passaggio su tutta la finestra è un vero passaggio GPU a ogni fotogramma. Su un portatile a batteria è una scelta tua.

viz-closer = Provalo sulla tua libreria
    .body = Qui niente chiama casa: l'analisi è sull'audio che sta già passando per il lettore. Altro su [cosa porta con sé uno spazio di lavoro](/workspaces).

## NekoRoX

neko-title = NekoRoX, il tema foobar2000, ricostruito nativo
    .description = NekoRoX era un fork di CaTRoX per foobar2000: pannelli su misura, testi sincronizzati, presenza su Discord, strumenti Last.fm. Ora è archiviato, e rox è il lettore nativo che il suo autore ha costruito al suo posto.

neko-h1 = NekoRoX, il tema foobar2000, e dov'è finito
    .lede = NekoRoX era un tema foobar2000: un fork di CaTRoX con sopra dieci anni di pannelli, plugin e correzioni. L'ho mantenuto come [catlinman](https://github.com/catlinman) finché non è diventato impossibile da mantenere. rox è quello che ho costruito al suo posto, e il suo look predefinito è quel layout ricostruito da zero.

neko-shot-alt = Il tema foobar2000 NekoRoX: un layout scuro con le schede INF, BIO, LYR, ART e LIB, un muro di copertine a sinistra, tracce raggruppate per album con voti a stelle a destra, e in basso una forma d'onda ambrata con un analizzatore di spettro.
neko-shot-caption = NekoRoX dentro foobar2000, su Windows, nel 2022.

neko-was = Cos'era NekoRoX
    .p1 = Un foobar2000 pronto all'uso: lo estraevi in `%appdata%` e avevi un lettore finito. Scuro, denso, schede per info, biografia, testi, copertine e libreria, un muro di copertine su un lato, tracce raggruppate per album con pallini di valutazione, e in basso una forma d'onda ambrata con sotto uno spettro. Sotto c'erano Columns UI, un mucchio di pannelli JScript, un file di layout `.fcl` e una cartella di font da installare a mano.
    .p2 = È partito da [CaTRoX](/catrox), il tema di eXtremeHunter1972, poi portato avanti da TheQwertiest. NekoRoX ha aggiunto la navigazione ad albero e a filtri, le modalità mini player, un pannello di testi sincronizzati, uno scorrimento di copertine, la presenza su Discord e strumenti Last.fm, e strada facendo ha reintegrato molto del lavoro di TheQwertiest. Nessuno degli script sottostanti era mio e il README l'ha sempre detto.

neko-where = Dove trovarlo
    .body = Il repository è ancora online su [github.com/catlinman/foobar2000](https://github.com/catlinman/foobar2000) e i file funzionano ancora. Non è mantenuto, è solo per Windows, e diversi componenti da cui dipende sono invecchiati o spariti dai loro host originali. Se vuoi farlo girare, fallo girare. Sappi solo che non lo sistema più nessuno.

neko-alpha = AlphaRoX, quello chiaro
    .body = Lo stesso tema con la palette invertita, pubblicato sotto questo account come [AlphaRoX](https://github.com/zealsprince/foobar2000). È un fork di NekoRoX, che è un fork di CaTRoX, il che dice quasi tutto quello che non andava nel distribuire un look in questo modo. Stesso stato di NekoRoX oggi: online, funzionante, non mantenuto.
    .alt = Il tema foobar2000 AlphaRoX: la controparte chiara di NekoRoX, con sfondo bianco, un muro di copertine a sinistra, tracce raggruppate per album con voti a stelle, e in basso una forma d'onda blu con analizzatore di spettro.

neko-stopped = Perché si è fermato
    .p1 = Sono passato a Linux a tempo pieno, il che voleva dire far girare l'intero assemblaggio sotto Wine. Girava. Renderizzava anche Internet Explorer dentro i pannelli, e una pila tenuta insieme da soluzioni di fortuna impilate non gradisce uno strato di traduzione. Ogni aggiornamento di foobar2000, e ogni aggiornamento di Wine, era un testa o croce su dieci anni di configurazione.
    .p2 = Il problema più profondo era il formato. Un'installazione NekoRoX non è un file, è un elenco di componenti, un ordine di installazione e un insieme di percorsi che si rimontano solo sulla macchina su cui sono stati costruiti. È per questo che il README diceva di copiare quattro cartelle in due posti diversi. Condividere un look non dovrebbe richiedere una pagina di istruzioni.

# $others è il numero degli spazi di lavoro inclusi meno quello
# predefinito e CaTRoX, che nella frase sono già nominati. Prima diceva
# "altri quattro".
neko-rox = Cosa ne fa rox
    .body = rox è un lettore nativo scritto in Rust, su Linux, macOS e Windows, senza foobar2000 né Wine sotto. Il suo spazio di lavoro predefinito è il layout NekoRoX ricostruito con pannelli nativi, ed è per questo che i due screenshot si somigliano. C'è anche uno [spazio di lavoro CaTRoX](/catrox) incluso, più altri { $others }.

neko-default-alt = Lo spazio di lavoro predefinito di rox, una ricostruzione nativa del layout NekoRoX: una griglia di copertine accanto a una playlist con voti a stelle, una barra di scorrimento a forma d'onda ambrata in basso, e schede per biografia, testo e metadati.

neko-carried = L'elenco delle funzioni, riga per riga
    .after = Quello che NekoRoX non poteva fare è quello a cui tengo di più. In rox un look intero è un singolo file che tiene insieme layout, palette e aspetto, quindi passi uno spazio di lavoro a qualcuno e quella persona ha la tua configurazione. Nessun elenco di componenti, nessun ordine di installazione, nessuna cartella di font.

neko-had-nav = Navigazione ad albero e a filtri
    .now = Pannello albero delle cartelle, più un pannello di filtri a cascata su artista, album, genere e anno.
neko-had-mini = Modalità mini e micro player
    .now = Un layout mini per spazio di lavoro, attivabile dai controlli di riproduzione, con una sua dimensione di finestra.
neko-had-ontop = Sempre in primo piano
    .now = Ancora niente. La finestra è una finestra normale.
neko-had-ratings = Viste per voto e conteggio riproduzioni
    .now = Voti a cinque stelle o su dieci punti, scritti in POPM e FMPS, e una colonna riproduzioni ordinabile.
neko-had-youtube = Ricerca e riproduzione audio da YouTube
    .now = Niente. rox riproduce i file dal tuo disco.
neko-had-covers = Visualizzatore di copertine e cover flow
    .now = Un pannello Copertina e un carosello di album che rimpicciolisce e scurisce i vicini verso i bordi.
neko-had-lyrics = Testi sincronizzati in tempo reale
    .now = Fogli LRC evidenziati sulla testina, clic su una riga per saltarci, presi da lrclib.
neko-had-viz = Visualizzazione e barra di scorrimento ad ampiezza
    .now = Una forma d'onda dell'intera traccia da scorrere a piacere, uno spettro FFT, un VU.
neko-had-discord = Rich Presence di Discord
    .now = Brano in riproduzione, stato e tempo trascorso tramite l'IPC di Discord.
neko-had-bio = Ricerca biografia in tempo reale
    .now = Biografia dell'artista con fanart, etichette, numero di ascoltatori e artisti simili.
neko-had-lastfm = Integrazione con Last.fm
    .now = Scrobbling, brano in riproduzione, cuori rispecchiati come love, e importazione dei brani preferiti.

neko-closer = Prendi rox
    .body = Libero, open source, un binario per piattaforma. La [pagina degli spazi di lavoro](/workspaces) mostra i look inclusi, { workspace-count } in tutto, e il [confronto con foobar2000](/foobar2000-alternative) copre dove foobar2000 è ancora avanti.

## ReplayGain

rg-title = ReplayGain spiegato, e cosa costa accenderlo
    .description = Cosa fa davvero ReplayGain, guadagno per traccia contro guadagno per album, perché conta il valore di picco, come trattare i file che nessuno ha mai misurato, e perché ReplayGain e riproduzione bit-perfect si escludono a vicenda.

rg-h1 = ReplayGain, e cosa ti costa
    .lede = Perché un album suona il doppio più forte del successivo, cosa fa davvero la correzione al tuo audio, e perché non puoi averla insieme al bit-perfect.

rg-problem = Il problema che risolve
    .p1 = I dischi non sono masterizzati a un volume comune. Un CD del 1985 e un remaster dello stesso album del 2005 possono differire di dieci decibel o più, ed è la differenza tra stare comodi e allungare la mano verso il volume. Metti in riproduzione casuale una libreria che copre quattro decenni e regoli il volume una traccia su tre.
    .p2 = ReplayGain risolve questo senza toccare il tuo audio. Un passaggio di analisi misura quanto una traccia si discosta da un volume di riferimento e scrive quel numero, in decibel, nei tag del file. In riproduzione il lettore legge il numero e lo applica. Niente viene ricodificato e niente viene distrutto, perché la correzione vive in un tag e l'audio sotto è quello che avevi.

rg-modes = Guadagno per traccia e guadagno per album
    .p1 = Ogni file misurato porta due numeri, e scegliere tra loro è l'unica impostazione che cambia davvero la sensazione dell'ascolto.
    .track = Il **guadagno per traccia** pareggia ogni traccia in modo indipendente. Ogni brano arriva allo stesso volume, ed è quello che vuoi in riproduzione casuale. Appiattisce anche gli album costruiti apposta con dinamica: l'interludio silenzioso prima della chiusura potente viene tirato su per pareggiarla, e l'effetto voluto dalla produzione sparisce.
    .album = Il **guadagno per album** applica un unico valore a ogni traccia del disco, calcolato sull'album nel suo insieme. Le differenze relative dentro l'album sopravvivono esattamente come masterizzate, e l'album come unità si allinea agli altri album. È l'impostazione giusta se ascolti i dischi dall'inizio alla fine.
    .setting = rox lo prende come impostazione e applica il valore scelto per traccia all'apertura, quindi è una preferenza e non qualcosa di inciso nei file.

rg-peak = Il picco, e perché un'amplificazione può distorcere
    .p1 = Accanto al guadagno, un passaggio di misura registra il campione più forte della traccia. Quel numero conta perché le correzioni ReplayGain vanno in entrambe le direzioni: una registrazione bassa riceve un guadagno positivo, e moltiplicare campioni che già sfiorano il fondo scala li spinge oltre. Oltre il fondo scala non c'è più spazio, quindi la forma d'onda si appiattisce e senti una distorsione che nel file non c'era.
    .p2 = Il picco è ciò che lo impedisce. rox limita un'amplificazione in base al picco che il tag riporta, quindi una traccia bassa viene alzata solo fin dove può senza distorcere. Il risultato è che alcune tracce basse si fermano un po' sotto il volume obiettivo, ed è lo scambio corretto e il motivo stesso per cui i valori di picco vengono conservati.

rg-unmeasured = I file che nessuno ha mai misurato
    .p1 = ReplayGain funziona solo sui file che portano i tag, e in una libreria vera messa insieme in vent'anni una grossa fetta non li porterà. Storicamente questo voleva dire passare un tagger separato su tutto prima che il tuo lettore servisse a qualcosa.
    .p2 = rox legge i tag dove ci sono, sotto i nomi standard in ogni formato che indicizza: frame TXXX in ID3v2, commenti Vorbis in FLAC, atomi liberi in MP4. Per tutto il resto misura i file da solo con un passaggio di volume EBU R128 e conserva il risultato nella libreria, marcato come misurato, così una scansione successiva può distinguere i numeri di rox da quello che ha scritto un tagger. Se preferisci che i numeri stiano nei file, un'impostazione li riscrive attraverso lo stesso percorso di scrittura verificato che usa l'editor dei tag.
    .p3 = Quel passaggio può partire da solo. Con la misura automatica attiva, i file vengono misurati una volta che il monitoraggio delle cartelle si è assestato dopo un'importazione, e una traccia aggiunta a un album già misurato rimanda l'intero disco a una nuova misura, dato che il guadagno per album è un numero sul disco e non sul file.

rg-skip = La parte che quasi tutte le pagine saltano
    .p1 = ReplayGain moltiplica i tuoi campioni per un numero. Quella è elaborazione. Non è senza perdita, non è un passaggio diretto, e qualsiasi lettore che rivendichi insieme ReplayGain e uscita bit-perfect sta descrivendo una cosa che non può esistere.
    .p2 = Questo conta se possiedi un DAC scelto con cura. Bit-perfect significa che i campioni che arrivano al convertitore sono quelli del file, non modificati, quindi tutto ciò che li scala, un volume sotto il massimo, un equalizzatore, ReplayGain, fa cadere la promessa. Non esiste una versione della normalizzazione del volume che lasci stare i bit, perché cambiare il volume è cambiare i bit.
    .choice = Quale dei due vuoi è una scelta vera e non una domanda trabocchetto. Il bit-perfect conta per l'ascolto critico di un album su hardware buono. ReplayGain conta per tutte le altre ore, quando la libreria gira in casuale e preferiresti non toccare il volume. La maggior parte delle persone dovrebbe tenere ReplayGain acceso e non pensarci più. Quello che conta è sapere quale dei due è attivo.

rg-bitperfect = Cosa significa bit-perfect in rox
    .body = Tre condizioni, nude e crude: la catena di elaborazione vuota o disattivata, il volume al 100%, e il dispositivo che gira alla frequenza propria del file sorgente. Soddisfale tutte e tre e il convertitore riceve campioni identici bit per bit. Mancane una e non li riceve, e rox lo dice invece di esibire un bollino. ReplayGain acceso è elaborazione accesa, e viene mostrato come elaborazione accesa.

rg-exclusive = L'uscita esclusiva, a parte
    .p1 = Il bit-perfect richiede anche che il sistema operativo si tolga di mezzo, ed è a questo che serve una modalità di uscita esclusiva. rox prende il dispositivo direttamente: il nome ALSA `hw:` su Linux, senza dmix, senza plug e senza server audio di mezzo; WASAPI exclusive su Windows; la modalità hog tramite CoreAudio su macOS. Segue la frequenza della sorgente dove il dispositivo lo consente, e riferisce cosa ha davvero accettato l'hardware invece di cosa era stato chiesto.
    .p2 = Lo scambio è quello che esclusiva significa ovunque: finché rox tiene il dispositivo, nient'altro sulla macchina ci suona attraverso. Se il dispositivo non può essere preso, rox ricade in modalità condivisa con lo stato visibile, invece di ammutolire e lasciarti lì a chiederti perché.

rg-limits = Cosa non è gestito
    .aside = Un lettore che ti dice quale tra bit-perfect e ReplayGain è vero in questo momento, e che misura i file a cui i tuoi tagger non sono mai arrivati, è un elenco corto. Se è questo il tipo di onestà che vuoi dalla cosa che sta tra la tua libreria e il tuo DAC, rox in quell'elenco c'è.

rg-limit-opus = I file Opus portano un loro schema `R128_TRACK_GAIN`, relativo a un riferimento diverso. rox non lo converte, perché `.opus` non è tra le estensioni dello scanner.
rg-limit-itunes = L'`iTunNORM` di iTunes è fuori ambito. Nient'altro lo scrive e i suoi valori per canale non sono un guadagno in decibel.
rg-limit-rate-switch = Seguire la frequenza della sorgente in modalità esclusiva costa uno stacco udibile tra due tracce a frequenze diverse, dato che il flusso si riapre. La riproduzione senza stacchi dentro una stessa frequenza non ne risente.

rg-closer = Puntalo sulla tua libreria
    .body = Il passaggio di misura gira in background su tutto quello a cui manca un guadagno, e continua anche con la finestra delle impostazioni chiusa. Altro su [cos'altro conta alle dimensioni di una libreria](/best-music-player).
