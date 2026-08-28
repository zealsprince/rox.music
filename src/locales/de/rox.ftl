# rox.music, Deutsch.
#
# Gespiegelt von en-CA. Was hier fehlt, fällt zur Laufzeit still auf Englisch
# zurück, deshalb ist scripts/check-locales.ts die Stelle, an der Lücken
# auffallen und nicht die Seite selbst.
#
# Produktnamen bleiben stehen: rox, Foobar2000, CaTRoX, NekoRoX, MusicBee,
# Mp3tag, ReplayGain, gpui. Übersetzt wird, was jemand liest, nicht, was jemand
# anklickt oder eintippt.
#
# "Workspace" heißt hier Arbeitsfläche, weil die App selbst das so nennt
# (crates/rox-i18n/locales/de). Wer auf der Seite über Arbeitsflächen liest,
# soll das Wort in den Einstellungen wiederfinden. Feminin, also "die
# CaTRoX-Arbeitsfläche", "eine der mitgelieferten".
#
# Anführungszeichen sind „…“, nicht "…". Die Zahlen sind schon lokalisiert
# (50.000, 0,3 Sekunden, 100 %); das bitte so halten.

## Rahmen

skip-to-content = Zum Inhalt springen

nav-home = rox-Startseite
nav-main = Hauptnavigation
nav-download = Download
nav-workspaces = Arbeitsflächen
nav-more = Mehr
nav-github = rox auf GitHub
    .stars = rox auf GitHub, { $stars } Sterne

language-picker = Sprache
language-missing = Deine Sprache fehlt?
theme-toggle = Design wechseln
    .label = Zwischen hellem und dunklem Design wechseln

footer-credit = rox wird von [Andrew Lake (zealsprince)](@author) in Rust auf [gpui](@gpui) gebaut, dem UI-Framework hinter [Zed](@zed). Frei und quelloffen unter der [AGPL-3.0](@license).
footer-nav = Fußzeile
footer-source = Quellcode
footer-irc = IRC
footer-irc-direct = Direkt
footer-irc-web = Webchat
footer-bug = Fehler melden
footer-translate = Mitübersetzen

## Die Seite selbst

# Der Titel für die Suche, nicht der Satz für Menschen. Zielt auf "foobar2000
# alternative", die eine Suche, die rox gewinnen kann. 59 Zeichen im Englischen,
# damit Google ihn ganz anzeigt; hier gilt dasselbe Budget. Eine Plattform
# fallen zu lassen ist der billigste Weg, Platz zu schaffen.
site-tagline = rox - Foobar2000-Alternative für Linux, macOS und Windows

# Unter 160 Zeichen, sonst schneidet Google mitten im Satz ab.
site-description = Nativer Musikplayer für große, sorgfältig getaggte lokale Sammlungen. Panels selbst bauen, Themes als Datei weitergeben, bei 50.000 Titeln schnell bleiben.

# Alle vier Social-Cards unter static/social/ sind für jede Sprache dieselbe
# Datei, und der Satz steht als englischer Text im Bild. Der Alt-Text muss also
# sagen, was dort wirklich steht, und dass es Englisch ist. Gilt genauso für
# download-title, workspaces-title und viz-title.
social-image-alt = Das rox-Logo über dem englischen Satz: if Foobar2000 was made in the current year

# Die Anzahl der mitgelieferten Arbeitsflächen, ausgeschrieben. Eine Ziffer
# unter zehn liest sich mitten im Satz wie ein Datenblatt, und welche Zahlen
# ausgeschrieben werden, entscheidet jede Sprache selbst. Jeder Satz, der die
# Anzahl nennt, sagt { workspace-count } und reicht $count durch.
workspace-count = { $count ->
    [1] ein
    [2] zwei
    [3] drei
    [4] vier
    [5] fünf
    [6] sechs
    [7] sieben
    [8] acht
    [9] neun
   *[other] { $count }
}

## Aussagen im Structured-Data-Graph

app-feature-panels = Zusammenstellbare Panel-Oberfläche mit auskoppelbaren Fenstern
app-feature-workspaces = Teilbare Arbeitsflächen mit Layout, Palette und Erscheinungsbild
app-feature-tagging = Tiefe Tag-Bearbeitung mit atomaren Schreibvorgängen und Stapelverarbeitung
app-feature-gapless = Lückenlose Wiedergabe
app-feature-dsp = Equalizer, Crossfade und ReplayGain
app-feature-exclusive = Exklusive bitgenaue Ausgabe
app-feature-lyrics = Synchronisierte Songtexte
app-feature-scrobbling = Last.fm-Scrobbling

## Startseite

# Bewusst keine Übersetzung des englischen Satzes. Die h1 ist die Stimme, nicht
# der Suchtreffer: site-tagline trägt "Foobar2000-Alternative" für Google, also
# ist diese Zeile frei, das Gefühl zu transportieren statt den Witz des
# Originals nachzubauen. Wer hier auf eine wörtliche Fassung zurückgeht, nimmt
# der Startseite genau das, wofür sie da ist.
home-hero = Der Medienplayer von heute, nicht von gestern.
    .lede = Ein Desktop-Musikplayer für Leute mit großen, sorgfältig getaggten lokalen Sammlungen. Die Oberfläche baust du dir selbst aus Panels zusammen, und ein ganzes Theme passt in eine Datei zum Weitergeben. Nativ auf Linux, macOS und Windows.
    .alt = rox mit der NekoRoX-artigen Standard-Arbeitsfläche: Bibliothek, Cover, Warteschlange und ein Spektrum-Panel

home-speed = Ein Fenster in unter einer Sekunde
    .body = rox ist eine einzige Binärdatei und startet, bevor du die Maus losgelassen hast.

home-features = Was drinsteckt

home-closer = Mach was Eigenes draus
    .body = { workspace-count } Arbeitsflächen sind mit dabei, einen Klick entfernt im Willkommensfenster. Jede davon ist eine einzelne Datei mit dem Layout, der Palette und den Shadern, die sie benutzt: du kannst sie bearbeiten, kaputtmachen und weitergeben. [Alle ansehen](/workspaces).

## Die Benchmark-Tabelle

benchmark-caption = Start, Speicher und Leerlauf-CPU von sieben Musikplayern auf einer Sammlung mit 50.000 Titeln
benchmark-player = Player
benchmark-window-up = Fenster da
benchmark-loaded = Vollständig geladen
benchmark-memory = Speicher
benchmark-idle-cpu = CPU im Leerlauf
benchmark-never-settles = beruhigt sich nie

benchmark-method = Alle Werte habe ich selbst gemessen, auf einer Maschine (Ryzen 9 5950X, Linux/Wayland), mit derselben Sammlung aus 50.000 Titeln auf einer externen SSD, jeder Player über dieselbe Testumgebung mit geladener Bibliothek. Speicher ist PSS über den gesamten Prozessbaum. „Geladen“ heißt, dass sich die CPU nach dem Start beruhigt hat; Leerlauf ist ein pausierter Player mit sichtbarem Fenster.
    .deadbeef = [DeaDBeeF](@deadbeef) wäre bei 44 MB gelandet und hätte beim Speicher gewonnen, bekam aber keine Zeile: sein MP3-Parser stürzt beim Import dieser Sammlung jedes Mal mittendrin ab. rox indiziert alle 50.000 Titel, auch die abgeschnittenen Dateien, über die er stolpert.

## Das Feature-Raster

features-library = Bibliothek
features-playback = Wiedergabe
features-looks = Aussehen
features-daily = Alltag

feature-library = Eine Bibliothek, die standhält
    .body = Ein paralleler Scanner liest vollständige Tags, echte Laufzeiten und den Codec jeder einzelnen Datei, kein überflogener Header. Die Ordnerüberwachung übersteht Umbenennungen, und nichts verschwindet stillschweigend.
    .link = Was bei 50.000 Titeln kaputtgeht

feature-tagging = Tagging, dem du trauen kannst
    .body = Ein vollwertiger Editor mit atomaren Schreibvorgängen und Stapelbearbeitung. Bewertungen stehen über FMPS und POPM in den Dateien selbst. Abgleich über MusicBrainz, iTunes und Deezer.
    .link = Neben Mp3tag

feature-cue = CUE-Rips spielen wie Titel
    .body = Ein FLAC über eine ganze CD wird neben seinem Cue-Sheet als echte Zeilen indiziert. Jeder Abschnitt lässt sich spulen, scrobbeln, sortieren und läuft lückenlos in den nächsten, genau wie eine Datei.
    .link = Wie die Abschnitte funktionieren

feature-gapless = Lückenlose Wiedergabe
    .body = Ein Stream, mit Zufallswiedergabe, Wiederholung und „Als Nächstes spielen“. Er fängt sich, wenn ein Audiogerät verschwindet, und Medientasten und die Titelanzeige des Systems funktionieren auf allen drei Plattformen.

feature-equalizer = Zehn Bänder und bitgenau
    .body = Ein Equalizer in einem eigenen Fenster, ein Crossfade, der die eigenen Übergänge eines Albums in Ruhe lässt, und exklusive Ausgabe, die sagt, worauf die Hardware sich eingelassen hat.
    .link = ReplayGain und bitgenau

feature-similarity = Sortiert danach, wie es klingt
    .body = rox beschreibt deine Titel anhand ihres eigenen Audiomaterials, Tempo inklusive, und ordnet das Nächste nach Ähnlichkeit. Das läuft auf deiner Maschine über deine Dateien, ohne Dienst dazwischen.

feature-panels = Panels, die du zusammenstellst
    .body = Rund vierzig Panel-Typen, von Bibliothek und Warteschlange bis Künstlerraster, Spektrum und VU. Eins mit seiner Konfiguration duplizieren, als Vorlage speichern oder in ein eigenes Fenster auskoppeln.
    .link = Neben Foobar2000

feature-themes = Themes als teilbare Dateien
    .body = Eine Arbeitsfläche ist eine Datei mit Layout, Palette, Erscheinungsbild und Shadern. Paletten können sich am laufenden Cover einfärben und mit dem Bild hell oder dunkel werden.
    .link = Die { workspace-count } mitgelieferten

feature-shaders = Visuals, die zuhören
    .body = Schreib einen WGSL-Shader über ein Panel oder das ganze Fenster. Benannte Signale aus dem Spektrum liegen auf seinen Eingängen, damit ein Bassband genau den Regler bewegt, auf den du zeigst.
    .link = Shader und Signale

feature-lyrics = Songtexte und Verlauf
    .body = Synchronisiert oder einfach, aus Begleitdateien, Tags oder lrclib, mit einem Editor, der dorthin zurückschreibt, wo er gelesen hat. Ein Hörprotokoll speist Verlaufs-Panel, Statistiken und Scrobbling.

feature-playlists = Playlists, die überleben
    .body = Favoriten, Umsortieren per Drag, m3u rein und raus, und intelligente Playlists, die eine gespeicherte Abfrage neu ausführen statt eine Momentaufnahme festzuhalten. Einträge überstehen es, wenn eine Datei geht und wiederkommt.

feature-binary = Eine Binärdatei, kein Installer
    .body = Ein Tarball, ein DMG oder ein Zip, dazu das AUR und ein Nix-Flake. Der portable Modus hält Bibliothek und Einstellungen in einem Ordner neben der ausführbaren Datei.
    .link = Hol es dir

## Der Download-Button, überall wo er auftaucht

download-cta = Hol dir rox
# %s ist die Stelle, an der enhance.js den erkannten Plattformnamen einsetzt.
# Muss bleiben: das Skript kennt keine Sprache und kann nur ersetzen, die
# Wortstellung muss also hier stimmen.
download-cta-detected = Für %s herunterladen
download-packaged = Auf Arch oder NixOS? [Installiere es stattdessen aus dem AUR oder dem Nix-Flake](/download#packages).
download-meta = v{ $version } · Linux, macOS, Windows · [alle Downloads](@releases)

## Download

download-title = rox für Linux, macOS oder Windows herunterladen
    .description = rox kostenlos für Linux, macOS oder Windows herunterladen. Eine Binärdatei pro Plattform, kein Installer und kein Konto. Quelloffen unter der AGPL.
    .image-alt = Das rox-Logo über dem englischen Satz: download for Linux, macOS and Windows

download-h1 = Hol dir rox
    .lede = Eine Binärdatei pro Plattform. Kein Installer, kein Konto, nichts, was im Hintergrund weiterläuft, wenn es zu ist.

download-released = veröffentlicht am { $date }
download-notes = Versionshinweise
download-missing = In dieser Version gibt es keinen Build für { $platform }. [Sieh auf der Releases-Seite nach](@releases).

install-linux-1 = Den Tarball irgendwohin entpacken.
install-linux-2 = `./rox` starten.
install-macos-1 = Das DMG öffnen.
install-macos-2 = rox nach Programme ziehen.
install-windows-1 = Irgendwohin entpacken.
install-windows-2 = `rox.exe` starten.
install-windows-caveat = Wenn SmartScreen sich beschwert: Weitere Informationen, dann Trotzdem ausführen.

download-packages = Paketmanager
    .body = Zwei Wege, auf denen rox mit dem Rest deines Systems aktuell bleibt.

package-aur =
    .scope = AUR, baut aus dem Quellcode
    .body = Im AUR als `rox-player`, mitbetreut vom rox-Autor. Jeder AUR-Helfer funktioniert, oder du klonst das Paket und rufst `makepkg -si` selbst auf.
    .link = rox-player im AUR

package-nix =
    .scope = direkt aus dem Flake
    .body = Das Repository ist ein Flake. Der erste Befehl startet rox, ohne etwas zu installieren, der zweite legt es in dein Profil. Unter NixOS nimmst du das Flake als Input auf und bindest `packages.default` ein, oder du benutzt das Overlay, das es exportiert.
    .link = flake.nix

download-cli = Mit der Kommandozeile
    .body = Übergib rox Dateien oder Ordner, und es spielt sie sofort und ersetzt, was geladen war. Ordner werden zu den Audiodateien direkt darin aufgelöst.
    .flags = `--enqueue` (oder `-e`) hängt an die Warteschlange an, statt sofort zu spielen. `--portable` hält Bibliothek, Einstellungen und Caches für diesen Start in einem Ordner `rox-data` neben der ausführbaren Datei. Damit das über Starts hinweg gilt, legst du eine leere Datei namens `portable` daneben oder setzt den Schalter in den Verhaltenseinstellungen.

download-build = Compile und entwickle rox selbst
    .body = Mit Nix bekommst du über `nix develop` und dann `cargo run` eine Entwicklungsumgebung mit der Rust-Toolchain und den Bibliotheken, die gpui zur Laufzeit lädt. Ohne Nix brauchst du stabiles Rust und gpuis Systembibliotheken aus deiner Distribution. Der [Entwicklungsabschnitt der README](@readme-dev) hat die vollständige Liste.

## Arbeitsflächen

workspaces-title = rox-Arbeitsflächen - teilbare Themes und Layouts
    .description = Eine rox-Arbeitsfläche ist ein ganzes Erscheinungsbild in einer teilbaren Datei: Layout, Palette, Aussehen und die Shader, die sie benutzt. Sie reichen von einer Foobar2000-Hommage bis zu einem Player, der komplett in 1-Bit-Dither gerendert wird.
    .image-alt = Das rox-Logo über dem englischen Satz: a whole look in one shareable file

workspaces-lede = Eine Arbeitsfläche ist ein ganzes Erscheinungsbild in einer Datei: Layout, Palette, Aussehen und alle Shader, die sie benutzt, eingebettet, damit ein importierter Look vollständig ankommt. Lade eine aus dem Willkommensfenster oder den Einstellungen, ändere daran, was du willst, und gib die Datei weiter, damit jemand anderes genau dasselbe zurückbekommt. Diese { workspace-count } sind mit dabei.

workspaces-critters = Wie Critters das macht
    .body = Eine Arbeitsfläche trägt ihre Shader eingebettet mit sich, Quellcode und Bilddaten, damit ein Look, der die ganze App als 1-Bit-Druck rendert, vollständig importiert wird statt als Verweis auf eine Datei auf einer fremden Maschine anzukommen. Nichts läuft, bevor du es freigibst. [Shader und Signale](/music-visualizer).

workspace-default = Wie rox ohne Zutun aussieht: durchscheinende Flächen, Cover-Einfärbung aus.
    .alt = Die Standard-Arbeitsfläche von rox: ein Cover-Raster neben einer Playlist mit Sternebewertungen, eine bernsteinfarbene Wellenform als Fortschrittsleiste am unteren Rand und Reiter für Biografie, Songtext und Metadaten.

workspace-foobar = Das Layout, mit dem dieses ganze Projekt streitet. Deckend, dicht, Fensterrahmen an, Menüleiste da, wo sie immer war.
    .alt = Die Foobar-Arbeitsfläche von rox: ein klassisches foobar2000-Layout mit Menüleiste, Filterspalten für Künstler und Album, einer dichten Titeltabelle mit Wiedergabezählern und Bewertungen und Cover unten links.

workspace-catrox = Der CaTRoX-Skin für foobar2000, mit dem hier alles anfing. Ja, genau der.
    .alt = Die CaTRoX-Arbeitsfläche von rox: der foobar2000-Skin nachgebaut, mit einer runden CD-Darstellung des Covers, einer Metadatenliste links und nach Alben gruppierten Titeln mit Bewertungspunkten.

workspace-llama = WinAmp, so wie du es in Erinnerung hast und nicht, wie es war. Tahoma, dunkel, kein Fensterrahmen.
    .alt = Die Llama-Arbeitsfläche von rox: ein gepunkteter Spektrumanalysator im Winamp-Stil oben, grüne Transportknöpfe und darunter eine dichte Titelliste, ganz ohne Fensterrahmen.

workspace-metro = Flache Panels und großzügige Zeilen mit Cover-Einfärbung, damit die Palette dem folgt, was gerade läuft.
    .alt = Die Metro-Arbeitsfläche von rox: ein Raster aus Albumcovern über die volle Breite mit Titeln darunter, und rechts ein Künstlerbiografie-Panel mit Foto, Genre-Tags und Hörerzahlen.

workspace-phosphor = Alles Monospace. Consolas, kein Cover in der Schnellwiedergabe, ein Terminal, das zufällig Musik spielt.
    .alt = Die Phosphor-Arbeitsfläche von rox: durchgehend grün auf schwarz in Monospace, ein Ordnerbaum neben einer Titeltabelle und eine grüne Wellenform am unteren Rand, wie ein Terminal, das Musik spielt.

workspace-critters = Die ganze App als 1-Bit-Druck. Ein geordneter Dither über jeder Fläche, Tonwerte, die mit dem Subbass zusammenbrechen, und eine Rauschwand hinter den Panels, die sich mit dem Song bewegt.
    .alt = Die Critters-Arbeitsfläche von rox: das gesamte Fenster in schwarz-weißem geordnetem Dither, mit einem gebogenen Regal aus Albumcovern über Fortschrittsleiste, Transportzeile, Wellenformstreifen und Titeltabelle, alles auf einem wandernden Rauschfeld.

workspace-diffuse = Nur das Album, das gerade läuft, über einem weichen Verlauf aus seinem eigenen Cover. Absichtlich monochrom, damit die Farbe vom Bild kommt, und die Bibliothek wartet in einer Schublade am rechten Rand.
    .alt = Die Diffuse-Arbeitsfläche von rox: ein großes Albumcover füllt die linke Fensterhälfte vor einem weichgezeichneten Verlauf desselben Bildes, daneben Titel, Künstler und Album über einer dünnen Fortschrittslinie, einer Reihe Transportknöpfe und einem Lautstärkeregler.

## Mehr

more-title = Mehr über rox
    .description = Die Seiten abseits der Hauptnavigation: der Foobar2000-Vergleich, worauf es bei einem Player für eine lokale Sammlung ankommt, und wie rox auf Linux, macOS und Windows jeweils läuft.

more-lede = Die Seiten, die nicht in die Navigation gehören, aber zu schade zum Löschen sind.

more-why = Warum es die gibt
    .p1 = Diese Seiten existieren, um gefunden zu werden. Wer { $year } nach einer Foobar2000-Alternative für Linux sucht oder herausfinden will, welcher Player eine Sammlung dieser Größe überlebt, sollte irgendwo landen, wo das beantwortet wird, und nicht auf einer Startseite für Leute, die rox schon kennen.
    .p2 = Sie stehen absichtlich nicht in der Navigation. Die eigentliche Website sind drei Seiten: was rox ist, wie man es bekommt, wie es aussieht. Den Rest in die Kopfzeile zu stapeln würde das, weswegen du gekommen bist, schwerer auffindbar machen, und das ist ein schlechter Tausch für alle, die schon wussten, was sie wollen.
    .p3 = Vielleicht weißt du all das über rox und Foobar2000 längst. Viele, die hier landen, wissen es nicht, und für die sind diese Seiten da. Jede sagt, wo rox verliert, und nicht nur, wo es gewinnt, und wiederholt nichts von dem, was auf der [Startseite](/) steht.

more-pages = Die Seiten
more-closer = Wenn du das alles überspringen willst: von der [Download-Seite](/download) sind es zwei Klicks bis zu einem laufenden Player, und der [Quellcode](@repo) ist die ehrlichste Dokumentation hier.

## Die Seiten abseits der Navigation

page-foobar2000-alternative = Die Foobar2000-Alternative
    .blurb = Was Foobar2000 richtig gemacht hat, wo es dich hängen lässt und was rox dagegen tut. Inklusive der Punkte, in denen Foobar2000 weiter vorne liegt.

page-catrox = CaTRoX, nativ neu gebaut
    .blurb = Das foobar2000-Theme, mit dem das hier angefangen hat, wer es gemacht hat, und was nötig war, damit dieser Look ohne Windows darunter läuft.

page-nekorox = NekoRoX, und wohin es ging
    .blurb = Der CaTRoX-Fork, den ich zehn Jahre gepflegt habe, warum das aufgehört hat, und welche seiner Panels es heute in rox gibt. Inklusive AlphaRoX, dem „Light Theme".

page-music-visualizer = Die Visualisierung, und die Schicht darunter
    .blurb = Spektrum- und Wellenform-Panels, WGSL-Shader über jedem Panel oder dem ganzen Fenster, und die benannten Signale aus dem Audiomaterial, die sie antreiben.

page-cue-sheets = FLAC- und CUE-Rips
    .blurb = Ein Abbild einer ganzen CD und sein Sheet, indiziert als echte Titel, die spulen, sortieren, scrobbeln und lückenlos ineinander laufen.

page-mp3tag-alternative = Eine Mp3tag-Alternative für Linux
    .blurb = Stapelbearbeitung, ein Raster pro Datei, und ein Schreibweg, der kopiert, prüft und umbenennt, statt deine Dateien an Ort und Stelle zu verändern.

page-musicbee-alternative = Eine MusicBee-Alternative
    .blurb = Was MusicBee kann und rox nicht, was rox kann und MusicBee nicht, und warum die ehrliche Antwort von deinem Betriebssystem abhängt.

page-replaygain = ReplayGain, und was es kostet
    .blurb = Was ReplayGain wirklich tut. Titel-Gain gegen Album-Gain. Wie man die Dateien misst, die nie jemand getaggt hat. Und warum es anzuschalten bedeutet, auf bitgenaue Wiedergabe zu verzichten.

page-best-music-player = Der beste Musikplayer für eine lokale Sammlung
    .blurb = Was Player wirklich unterscheidet, sobald deine Sammlung echt ist, und wie sich das Feld auf 50.000 Titeln schlägt.

page-linux = rox unter Linux
    .blurb = AUR und Nix, Wayland und X11, exklusive ALSA-Ausgabe, MPRIS-Medientasten, und die Benchmark-Tabelle, in der ausschließlich Linux-Player stehen.

page-windows = rox unter Windows
    .blurb = Ein Zip ohne Installer, portabler Modus, exklusive WASAPI-Ausgabe, und eine ehrliche Einschätzung dazu, mit Foobar2000 auf dessen Heimatplattform zu konkurrieren.

page-macos = rox unter macOS
    .blurb = Apple Silicon, signiert und notarisiert, Menüs in der Systemleiste, exklusive CoreAudio-Ausgabe.

## Nicht gefunden

notfound-title = Seite nicht gefunden
    .description = Diese Seite gibt es auf rox.music nicht.
notfound-h1 = Tja, hier gibts nichts zu finden
notfound-nav = Zurück ins Trockene

## Die drei Plattformseiten, gemeinsamer Rahmen

platform-breadcrumb = rox unter { $platform }
platform-limits = Was es unter { $platform } nicht kann
platform-closer = Zeig ihm deine Sammlung
    .body = Frei und quelloffen unter der AGPL. Kein Konto, und nichts, was im Hintergrund weiterläuft, wenn es zu ist.
platform-more = Mehr dazu, [wie es aussieht](/workspaces), der [vollständige Foobar2000-Vergleich](/foobar2000-alternative), oder was die exklusive Ausgabe oben eigentlich tut, unter [ReplayGain und bitgenau](/replaygain).

## Linux

linux = rox - ein nativer Musikplayer für Linux
    .description = Ein nativer Linux-Musikplayer für große lokale Sammlungen. Im AUR und als Nix-Flake, Wayland und X11, exklusive ALSA-Ausgabe, MPRIS-Medientasten und bei 50.000 Titeln ein Fenster in unter einer Sekunde.
    .h1 = Ein Musikplayer für Linux, der für Linux gebaut wurde
    .lede = Keine Portierung, kein Electron-Wrapper und kein Foobar2000 unter Wine. Eine native Binärdatei, die Linux als erstklassiges Ziel behandelt statt als drittes.
    .aside = Exklusive Ausgabe, die zurückmeldet, worauf die Soundkarte sich wirklich eingelassen hat, statt was du verlangt hast, und ein Look, den du hier baust und jemandem unter Windows in die Hand drückst. Wenn du auf so etwas unter Linux bisher verzichten musstest: hier gibt es das.
    .siblings = Derselbe Player unter [Windows](/windows) und [macOS](/macos).

linux-why = Das Problem, für das er geschrieben wurde
linux-why-1 = Die guten Linux-Player geben jeweils etwas auf. Tauons Tagging bleibt an der Oberfläche. Bei Strawberry stellst du nichts selbst zusammen. Quod Libet ist nichts, wofür jemand ein Theme bauen würde. Das Paket aus Panels, tiefem Tagging und einer Theming-Kultur hängt seit zwanzig Jahren unter Windows fest.
linux-why-2 = Dieses Paket über Wine laufen zu lassen funktioniert, bis es das nicht mehr tut. Ein Skin wie CaTRoX wird von aufeinandergestapelten Behelfslösungen zusammengehalten und rendert stellenweise Internet Explorer in Panels. Durch eine Übersetzungsschicht wird offensichtlich, wie viel davon Glück ist, und jedes Systemupdate ist eine Gelegenheit, das herauszufinden.
linux-why-3 = rox ist diese Form, nativ geschrieben: rund vierzig Panel-Typen, die du selbst anordnest, Tag-Bearbeitung, der du eine echte Sammlung anvertrauen kannst, und Themes, die als eine einzelne Datei reisen.

linux-install = Installieren
linux-install-1 = Unter Arch liegt es im AUR als `rox-player`, mitbetreut vom Autor. Jeder Helfer funktioniert, oder du klonst und rufst `makepkg -si` selbst auf.
linux-install-2 = Das Repository ist außerdem ein Flake, also bekommen Nix und NixOS es ohne Paketierungsschritt. Der erste Befehl startet rox, ohne etwas zu installieren, der zweite legt es in dein Profil.
linux-install-3 = Überall sonst entpackst du den Tarball und startest `./rox`. Eine Binärdatei, kein Installer, nichts, was zurückbleibt, wenn du sie löschst.

linux-display = Wayland und X11
linux-display-1 = Beides, nativ, über gpui. Fensterdekorationen sind eine Einstellung pro Arbeitsfläche statt einer Entscheidung zur Übersetzungszeit, du kannst also auf einem Layout serverseitige Dekorationen fahren und auf dem nächsten randlos, ohne in einen anderen Build neu zu starten.

linux-alsa = Exklusive Ausgabe über ALSA
linux-alsa-1 = Der exklusive Modus öffnet die Soundkarte direkt als `hw:CARD=x,DEV=n`. Das ist der eine ALSA-Name ohne dmix, ohne plug und ohne Soundserver irgendwo im Weg, und genau deshalb der einzige Weg, der eine Abtastrate ablehnt, die er nicht kann, statt still auf etwas anderes umzurechnen.
linux-alsa-2 = Der Tausch ist ehrlich: solange rox die Karte im exklusiven Modus hält, hält es sie. Nichts anderes auf dem System spielt über dieses Gerät, bis du aufhörst. rox sagt dir, worauf die Hardware sich wirklich eingelassen hat, statt was du verlangt hast, und eine Abweichung taucht so als Zahl auf statt als Verdacht.
linux-alsa-3 = Der geteilte Modus ist der Standard und verhält sich wie jedes andere Programm auf deinem Desktop.

linux-desktop = Desktop-Anbindung
linux-desktop-1 = Medientasten und die Titelanzeige laufen über einen echten MPRIS-Dienst, also sehen playerctl, die Medien-Widgets von GNOME und KDE und alles andere, was `org.mpris.MediaPlayer2` spricht, es ohne Konfiguration.
linux-desktop-2 = Das Tray-Symbol geht über StatusNotifierItem auf den Bus, und genau das macht Schließen-ins-Tray sicher: läuft kein SNI-Host, der es entgegennimmt, beendet sich rox beim Schließen des letzten Fensters, statt einen unerreichbaren Prozess ohne Oberfläche zurückzulassen.

linux-benchmarks = In den Benchmarks stehen ausschließlich Linux-Player
linux-benchmarks-1 = Die Vergleichstabelle auf dieser Seite wurde unter Linux gegen Linux-Software gefahren: Elisa, fooyin, Quod Libet, Strawberry, Museeks und Tauon, alle auf einer Maschine mit derselben Sammlung aus 50.000 Titeln. rox hat das Fenster nach 0,3 Sekunden da und bleibt bei 134 MB. Der nächstleichteste, der überhaupt fertig lädt, braucht fast das Dreifache an Speicher.

linux-limit-arch = Nur x86_64. Es gibt keinen aarch64-Build für Linux, also brauchen ARM-Boards und Asahi einen Build aus dem Quellcode.
linux-limit-plugins = Keine Plugin-Schnittstelle, hier ersetzt also nichts eine bestimmte Foobar2000-Komponente, auf die du angewiesen bist.

## Windows

windows = rox - ein Musikplayer für Windows ohne Installer
    .description = Ein nativer Windows-Musikplayer für große lokale Sammlungen. Ein Zip ohne Installer, portabler Modus, exklusive WASAPI-Ausgabe, tiefe Tag-Bearbeitung und Panels, die du selbst zusammenstellst.
    .h1 = Ein Musikplayer für Windows, von jemandem, der Windows verlassen hat
    .lede = Windows ist Foobar2000s Zuhause und es ist dort sehr gut. Diese Seite sagt das offen, und genauso offen, warum du rox trotzdem wollen könntest.
    .aside = Was du hier baust, ist eine Datei, und sie öffnet sich genauso auf der Linux- oder Mac-Maschine daneben. Wenn ein Setup, in das du ein Wochenende gesteckt hast, jemals auf einem Betriebssystem gestrandet ist, ist das der Teil, der einen Nachmittag wert ist.
    .siblings = Derselbe Player unter [Linux](/linux) und [macOS](/macos).

windows-awkward = Fangen wir mit dem unangenehmen Teil an
windows-awkward-1 = Wenn du unter Windows unterwegs bist, dein Foobar2000 so eingerichtet ist, wie du es magst, und das seit Jahren stabil ist, dann ist rox kein Upgrade. Foobar2000 hat zwei Jahrzehnte Komponenten, ist genügsamer und hält keine Überraschungen mehr bereit. Auf einer Seite wie dieser etwas anderes zu behaupten wäre ein einfacher Weg, deinen Nachmittag zu verschwenden.
windows-awkward-2 = Die Gründe, trotzdem hinzusehen, sind eng gefasst und echt. Du willst denselben Player und dasselbe Layout auf der Linux- oder Mac-Maschine, die du auch benutzt. Du willst lesbaren Quellcode und eine AGPL-Lizenz statt geschlossener Freeware. Oder du willst ein Theming, bei dem ein ganzer Look eine Datei ist, die du jemandem schicken kannst, statt eines Ordners aus Komponenten, Konfigurationen und Skripten, der sich nur auf deiner Maschine wieder zusammensetzt.

windows-install = Installieren
windows-install-1 = Irgendwohin entpacken und `rox.exe` starten. Kein Installer, kein Dienst, kein Eintrag in der Softwareliste und nichts, was im Hintergrund läuft, sobald es zu ist.
windows-install-2 = Der portable Modus hält Bibliothek, Einstellungen und Caches in einem Ordner `rox-data` neben der ausführbaren Datei, das Ganze lebt also auf einem Stick. Übergib `--portable` für einen Start, oder lege eine leere Datei namens `portable` daneben, damit es dauerhaft gilt.
windows-install-3 = Die Binärdatei ist nicht signiert, SmartScreen wird sich beim ersten Mal also melden. Weitere Informationen, dann Trotzdem ausführen. Signaturzertifikate kosten Geld, das ein kostenloser Player nicht hat, und das zu sagen ist besser, als so zu tun, als wäre die Warnung ein Fehler.

windows-wasapi = Exklusive Ausgabe über WASAPI
windows-wasapi-1 = Der exklusive Modus übernimmt den Endpunkt in WASAPI exclusive, was die eigene Abtastrate und Bittiefe der Datei ohne Zwischenschritt vor den Wandler stellt. rox meldet zurück, was das Gerät tatsächlich angenommen hat, wenn die Hardware deine 192 kHz also still abgelehnt hat, erfährst du es von einer Anzeige statt aus einer Forumsdiskussion.
windows-wasapi-2 = Solange es den Endpunkt hält, spielt nichts anderes auf der Maschine über dieses Gerät. Genau das heißt exklusiv, und genau deshalb ist es nicht der Standard.

windows-integration = Der Rest der Windows-Anbindung
windows-integration-1 = Medientasten und die Titeleinblendung laufen über SMTC, dieselbe Systemoberfläche, die eingebaute Apps benutzen, die Lautstärke-Einblendung zeigt also den Titel und die Transportknöpfe funktionieren.
windows-integration-2 = Es gibt ein Tray-Symbol mit Schließen-ins-Tray, das Schließen des letzten Fensters lässt die Musik also weiterlaufen, und das Symbol ist der Weg zurück. Eine Arbeitsfläche kann den Fensterrahmen auch ganz weglassen, oder den Rahmen behalten und nur den Größenänderungsrand aufgeben, was Schatten, Snap-Layouts und Win+Pfeil intakt lässt und allein das Ziehen an der Kante kostet.

windows-limit-instance = Keine Einzelinstanz-Sperre. Unter Linux und macOS übergibt ein zweiter Start seine Dateien an das laufende rox; unter Windows startet eine zweite Kopie.
windows-limit-signing = Nur x86_64, und die Binärdatei ist unsigniert, rechne also einmal mit SmartScreen.
windows-limit-plugins = Keine Plugin-Schnittstelle, eine bestimmte Foobar2000-Komponente hat hier also kein Gegenstück.

## macOS

macos = rox - ein nativer Musikplayer für macOS
    .description = Ein nativer macOS-Musikplayer für große lokale Sammlungen. Apple Silicon, signiert und notarisiert, Menüs in der Systemleiste, exklusive CoreAudio-Ausgabe und tiefe Tag-Bearbeitung.
    .h1 = Ein nativer Musikplayer für macOS
    .lede = Foobar2000 hat inzwischen einen echten Mac-Build. Was es auf dem Mac nicht hat, ist der Grund, aus dem Leute es unter Windows eingerichtet haben.
    .aside = Menüs da, wo macOS sie hinsetzt, rund vierzig Panel-Typen zum Anordnen wie du willst, und { workspace-count } fertige Looks einen Klick entfernt im Willkommensfenster. Wenn das Einrichten des Players der Teil ist, den du wirklich magst, ist das hier für dich.
    .siblings = Derselbe Player unter [Linux](/linux) und [Windows](/windows).

macos-gap = Die Lücke, die auf dem Mac bleibt
macos-gap-1 = Foobar2000 v2 hat eine offizielle macOS-Version, und diese Seite wird nicht so tun, als gäbe es sie nicht. Der Haken ist, dass das Komponenten- und Skin-Ökosystem, also das, was eine Windows-Installation ein Wochenende Einrichten wert gemacht hat, auf der Windows-Seite liegt. Auf einem Mac bekommst du den Player ohne das Ökosystem, das die Wahl gerechtfertigt hat.
macos-gap-2 = rox bringt das Zusammenstellen und das Theming zurück: rund vierzig Panel-Typen, angeordnet wie du willst, dupliziert mit eigenen Konfigurationen, in echte Fenster ausgekoppelt, und ein ganzes Erscheinungsbild in einer teilbaren Datei. Eine der { workspace-count } mitgelieferten Arbeitsflächen ist ein CaTRoX-Nachbau, was eine faire Aussage darüber ist, worauf das Ganze zielt.

macos-install = Installieren
macos-install-1 = Öffne das DMG und zieh rox nach Programme. Releases sind mit einer Apple Developer ID signiert und notarisiert, Gatekeeper lässt es also ohne das Rechtsklick-Öffnen-Theater und ohne Ausflug in die Sicherheitseinstellungen starten.

macos-native = Es verhält sich wie ein Mac-Programm
macos-native-1 = Die Menüs sitzen in der Systemmenüleiste, wo macOS sie erwartet, nicht in einer Leiste, die ins Fenster gezeichnet wird. Der grüne Knopf macht natives Vollbild, und mit gehaltener Wahltaste bekommst du stattdessen Zoom.
macos-native-2 = Das Schließen des letzten Fensters lässt rox im Dock, statt es zu beenden, was der Plattformkonvention entspricht und die macOS-Hälfte des Schließen-ins-Tray-Verhaltens ist.

macos-coreaudio = Exklusive Ausgabe über CoreAudio
macos-coreaudio-1 = Der exklusive Modus fährt das Gerät über CoreAudio mit der eigenen Abtastrate der Datei und meldet, worauf die Hardware sich eingelassen hat, statt was verlangt wurde. Nützlich vor allem, wenn du einen DAC hast, für den sich die Mühe lohnt, und standardmäßig aus, weil dem restlichen System ein Gerät wegzunehmen eine Entscheidung sein sollte, die du absichtlich triffst.

macos-limit-silicon = Nur Apple Silicon. Es gibt keinen Intel-Build, ein Intel-Mac braucht also einen Build aus dem Quellcode.
macos-limit-xcode = Ein Build aus dem Quellcode braucht Xcode, mit oder ohne nix: gpui übersetzt Metal-Shader zur Build-Zeit, und nix kann Apples Metal-Toolchain nicht mitliefern.
macos-limit-plugins = Keine Plugin-Schnittstelle, eine bestimmte Foobar2000-Komponente hat hier also kein Gegenstück.

## Bester Musikplayer für eine lokale Sammlung

best-breadcrumb = Bester Musikplayer
best-title = Der beste Musikplayer für eine lokale Sammlung { $year }
    .description = Streaming-Apps und Bibliotheks-Player werden an unterschiedlichen Dingen gemessen. Fünf Kriterien, die Desktop-Musikplayer wirklich unterscheiden, sobald deine Sammlung echt ist, gemessen an 50.000 Titeln.

best-lede = Nicht die beste Musik-App. Das sind Streaming-Clients, und die werden am Katalog und am Preis gemessen. Hier geht es um die kleinere Frage: welcher Desktop-Player mit einer großen Sammlung klarkommt, die längst auf deiner Platte liegt.

disclosure = Offenlegung
best-disclosure = rox ist einer der Player in diesem Vergleich und das hier ist seine eigene Seite. Lies also erst die Kriterien und dann die Zahlen. Alle fünf gelten unabhängig davon, ob du am Ende irgendetwas herunterlädst.

best-criteria = Fünf Dinge, die die Player wirklich unterscheiden

best-criterion-size = Er muss die Größe deiner Sammlung überleben
    .body = Die meisten Player werden an ein paar hundert Alben vorgeführt. Die interessanten Ausfälle fangen im Zehntausenderbereich an, wo das Einlesen einen Abend dauert, das Scrollen stockt und der Speicherverbrauch steigt, bis irgendetwas nachgibt. Das ist das eine Kriterium, das du von einem Screenshot nicht ablesen kannst, und es ist das, das entscheidet, ob du das Ding in einem Jahr noch benutzt.

best-criterion-read = Er muss deine Tags richtig lesen
    .body = Ein überflogener Header bringt dir einen Titelnamen und eine falsche Laufzeit. Tief lesen heißt vollständige Tags, echte Laufzeiten und den Codec, die Abtastrate und die Bittiefe jeder einzelnen Datei. Es heißt auch, dass Dateien mit kaputten Tags indiziert werden statt still zu verschwinden, denn eine Sammlung, die klammheimlich 300 Dateien verliert, ist schlimmer als eine, die es zugibt.

best-criterion-write = Er muss dich an deine Tags lassen
    .body = Eine Sammlung, die kuratiert wurde, ist eine Sammlung, an der bearbeitet wird. Stapelbearbeitung, atomare Schreibvorgänge, damit ein Absturz keine Datei abschneidet, und Bewertungen in den Dateien selbst statt in einer Datenbank, die du nicht mitnehmen kannst.

best-criterion-layout = Das Layout muss deins sein
    .body = Der Geschmack ist hier wirklich persönlich, und genau das spricht fürs Zusammenstellen statt für eine gute Vorgabe. Panels, die du anordnest, mit eigenen Konfigurationen duplizierst und in echte Fenster auskoppelst, schlagen jedes einzelne Layout, das jemand anderes ausgesucht hat.

best-criterion-yours = Er muss dir gehören und das auch bleiben
    .body = Auf lokale Sammlungen fällt man zurück, wenn ein Dienst ein Album entfernt oder seine Bedingungen ändert. Ein Player, der darauf mit Konto, Telemetrie oder Abo antwortet, hat den Sinn dessen verfehlt, was er abspielt.

best-measured = Wie das erste Kriterium gemessen aussieht
    .body = Sieben Player, eine Sammlung aus 50.000 Titeln, eine Maschine, eine Testumgebung. Startzeit und Leerlaufkosten sind die Teile, die du jeden einzelnen Tag spürst.

best-shortlist = Die ehrliche Empfehlung
    .p1 = Wenn du unter Windows bist und ohnehin [Foobar2000](/foobar2000-alternative) benutzt, hast du die Antwort längst, aber das wusstest du schon. Nichts auf dieser Seite schlägt ein funktionierendes Foobar2000-Setup auf seiner eigenen Plattform.
    .p2 = Wenn du etwas mit einem großen Plugin-Ökosystem und langer Linux-Historie willst, sind Quod Libet und Strawberry beide echte Antworten, und beide kosten beim Laden einer Sammlung dieser Größe mehr Geduld, als sie danach Freude machen. Wenn das Tagging-Kriterium das ist, das dich wirklich interessiert, steht das separat als [Mp3tag-Alternative](/mp3tag-alternative), und die Lautheitsseite von Kriterium eins steht unter [ReplayGain](/replaygain).
    .p3 = rox ist die Antwort, wenn du die Foobar2000-Form nativ unter Linux oder macOS willst: Panels, die du zusammenstellst, tiefes Tagging, Themes als einzelne teilbare Dateien, und ein Player, der bei einer Sammlung dieser Größe in unter einer Sekunde ein Fenster hat. Er ist neu, und er hat keine Plugin-Schnittstelle. Beides sind echte Kosten.
    .aside = Die fünf Kriterien oben sind die Untergrenze, nicht die Obergrenze. Bewertungen gehen über FMPS und POPM in die Dateien selbst statt in eine Datenbank, die du nicht mitnehmen kannst, und mehrwertige Genres werden als Meinung der Bibliothek zusammengeführt statt als Umschreiben deiner Tags. Wenn du so etwas aus einer Bibliothek haben wolltest, ist das hier der, den du auf deine Platte loslässt.

best-closer = Miss ihn an deiner eigenen Sammlung
    .body = Der Benchmark, der zählt, ist der auf deiner Platte. Frei und quelloffen, kein Konto, kein Installer.

## MusicBee

musicbee-breadcrumb = MusicBee-Alternative
musicbee-title = Eine MusicBee-Alternative für Linux und macOS { $year }
    .description = MusicBee gibt es nur für Windows. rox ist ein nativer Player für große lokale Sammlungen unter Linux, macOS und Windows, mit tiefem Tagging und einem Layout, das du selbst zusammenstellst. Inklusive dessen, was MusicBee weiterhin besser macht.

musicbee-h1 = Eine MusicBee-Alternative, die nicht nur unter Windows läuft
    .lede = Von einer Linux- oder Mac-Maschine aus hat MusicBee genau ein Problem: es ist ausgezeichnet, und es ist nicht da. Auf dieser Seite geht es darum, was wirklich mitkommt und was nicht.

musicbee-good = Was MusicBee gut kann
    .p1 = Breite. Es verwaltet eine große Sammlung ordentlich, kann Auto-Playlists und Warteschlangen-Automatik, synchronisiert auf tragbare Geräte, macht Podcasts und Internetradio, konvertiert Formate und lässt sich in etwas verwandeln, das du gern ansiehst. Es ist kostenlos, es ist ausgereift, und für viele Leute ist es der letzte Musikplayer, den sie je installieren mussten.
    .p2 = Es läuft außerdem unter Windows und sonst nirgends. Über Wine bekommst du eine Version davon, mit dem üblichen Vorbehalt, dass sie funktioniert, bis ein Update anderer Meinung ist.

musicbee-gaps = Was rox nicht kann
    .body = Das zuerst, weil es für viele Leute die Frage entscheidet und es weiter unten zu verstecken deine Zeit verschwenden würde.
    .close = Vier echte Punkte, und die Liste ist nicht aufgefüllt worden, damit sie ehrlich aussieht. Wenn zwei davon für dich zu einem Player dazugehören, hör hier auf.

musicbee-gap-sync = **Keine Gerätesynchronisierung.** Wenn du Musik über deinen Player auf ein Telefon oder einen DAP schiebst, hat rox darauf gar keine Antwort.
musicbee-gap-radio = **Keine Podcasts, kein Internetradio.** rox spielt Dateien auf deiner Platte.
musicbee-gap-plugins = **Keine Plugin-Schnittstelle.** Was du mit einer Erweiterung gelöst hättest, muss es schon geben.
musicbee-gap-ffmpeg = **Konvertierung braucht ffmpeg.** rox konvertiert zwischen Formaten, aber es steuert ein ffmpeg, das du installiert hast, statt einen eigenen Encoder mitzubringen, und es kodiert nichts auf dem Weg zu einem Gerät neu, weil es keine Synchronisierung gibt, für die man neu kodieren müsste.

musicbee-transfers = Was mitkommt, und was besser ist
    .p1 = Die Bibliothek hält der Größe stand, die MusicBee-Nutzer üblicherweise haben. Ein paralleler Scanner liest vollständige Tags, echte Laufzeiten und den Codec, die Abtastrate und die Bittiefe jeder Datei, statt Header zu überfliegen, und Dateien mit unlesbaren Tags werden über den Dateinamen indiziert statt still zu verschwinden. Die Tag-Bearbeitung ist ein echter Editor mit Stapelbearbeitung, einem Raster pro Datei und einem [Schreibweg, der kopiert und prüft](/mp3tag-alternative), statt Originale an Ort und Stelle zu verändern.
    .p2 = Die Oberfläche ist der größere Unterschied. MusicBee gibt dir ein gutes Layout und etwas Skinning; rox gibt dir rund vierzig Panel-Typen, die du selbst anordnest, mit eigenen Konfigurationen duplizierst und in echte Betriebssystemfenster auskoppelst. Ein ganzes Erscheinungsbild ist eine Datei mit Layout, Palette und Aussehen, die Anordnung, bei der du am Ende landest, ist also etwas, das du jemandem geben oder auf deine andere Maschine mitnehmen kannst, statt etwas, das auf einer Installation lebt.
    .p3 = Auto-Playlists kommen mit. Eine intelligente Playlist in rox ist eine gespeicherte Abfrage in derselben Syntax, die das Suchfeld benutzt, mit optionaler Sortierung und Obergrenze, und sie läuft bei jeder Aktualisierung des Panels neu statt eine veraltete Momentaufnahme zu halten. Der Editor zeigt beim Tippen, was die Abfrage greift, du merkst also, dass du die falsche Regel geschrieben hast, bevor du sie unter einem Namen speicherst.
    .p4 = Warteschlangen-Automatik gibt es auch: rox füllt die Warteschlange nach, wenn sie leer läuft, aus deiner Browse-Reihenfolge, aus den Titeln, zu denen du nie kommst, oder danach, wie der laufende Titel klingt. Letzteres kommt aus der Analyse deiner Dateien auf deiner eigenen Maschine, es funktioniert also auch bei einer Sammlung, von der im Internet niemand je gehört hat.

musicbee-size = Die Größenfrage
    .body = MusicBee steht nicht in dieser Tabelle, weil die Benchmarks unter Linux gefahren wurden, wo es nicht läuft. Es steht hier als Antwort auf „fällt die Alternative bei meiner Sammlungsgröße um“, gemessen an 50.000 Titeln.

musicbee-split = Die ehrliche Trennlinie
    .p1 = Du bleibst unter Windows, mit einem MusicBee-Setup, das dein Telefon synchronisiert und mit Podcasts füttert? Nichts hier ersetzt das, und ein Wechsel würde dich zwei Funktionen kosten, die rox schlicht nicht hat.
    .p2 = Du wechselst zu Linux oder auf einen Mac, oder du bist schon dort und siehst die Lücke, die MusicBee hinterlassen hat? Genau dafür gibt es das hier, und der Tausch ist konkret: du gibst Synchronisierung und Podcasts auf und bekommst einen nativen Player mit tieferem Tagging, einem Layout, das du selbst baust, und einer Bibliothek, die bei fünfzigtausend Titeln flott bleibt.
    .aside = Ein Panel in ein eigenes Betriebssystemfenster auszukoppeln oder dein gesamtes Layout als eine Datei weiterzugeben, sind keine Zeilen in einem Funktionsvergleich, weil es auf der anderen Seite nichts zu vergleichen gibt. Wenn du darauf aus warst, bist du bei rox richtig.

musicbee-closer = Probier es an deiner eigenen Sammlung
    .body = Frei und quelloffen unter der AGPL, kein Konto und kein Installer. Es gibt auch einen [Foobar2000-Vergleich](/foobar2000-alternative), falls es eigentlich das Setup ist, das du verlässt.

## CaTRoX

catrox-title = CaTRoX, als nativer Player neu gebaut
    .description = Das CaTRoX-Theme für foobar2000, wer es gebaut hat, und was nötig war, damit dieser Look nativ unter Linux und macOS läuft, ohne Windows oder Wine darunter.

catrox-h1 = CaTRoX, ohne Windows darunter
    .lede = rox bringt eine CaTRoX-Arbeitsfläche mit. Das hier ist die Seite über das Warum und über die Leute, auf deren Arbeit das alles steht.

catrox-credit = Anerkennung, wo sie hingehört
    .body = CaTRoX ist ein Theme für foobar2000. Design und Farbschema stammen ursprünglich von eXtremeHunter1972, und die Ausgabe, die die meisten Leute tatsächlich benutzt haben, ist [CaTRoX_QWR](https://theqwertiest.github.io/CaTRoX_QWR/), neu gebaut und gepflegt von TheQwertiest. rox steht mit keinem von beiden in Verbindung, und nichts hiervon ist ihr Code. Die Arbeitsfläche unten ist ein Nachbau eines Looks, den sie gemacht haben.

catrox-was = Was CaTRoX war
    .p1 = Ein dichtes, dunkles, informationsgetriebenes Layout für foobar2000: Cover als CD gerendert, eine Metadatenliste an einer Seite, nach Alben gruppierte Titel mit Bewertungspunkten, und eine Menüleiste genau da, wo eine Menüleiste hingehört. Es ist das, was Leute meinen, wenn sie sagen, foobar2000 könne gut aussehen, und es ist der Hauptgrund, aus dem sich überhaupt jemand das Einrichten von foobar2000 angetan hat.
    .p2 = Ein Skin im Sinne eines Musikplayers war es nie. CaTRoX ist ein Stapel aus Komponenten, Panel-Skripten und Konfiguration, zusammengesetzt. Das hat es mächtig gemacht, und genau das macht es schwer zu bewegen, schwer zu teilen und leicht kaputtzumachen.

catrox-nekorox = Wo NekoRoX ins Spiel kam
    .p1 = rox' Autor hat jahrelang einen Fork davon gefahren. [NekoRoX](/nekorox) war CaTRoX mit einem Haufen eigener Panels, Plugins und Komfortmodule obendrauf: Baum- und Filternavigation, Mini- und Mikro-Player-Modi, ein Panel für synchrone Songtexte, ein Cover-Flow, Discord-Präsenz, Last.fm-Werkzeuge. Oben in der README steht inzwischen ein Hinweis, dass es nicht mehr gepflegt wird, und ein Verweis hierher.
    .p2 = Der Grund für diesen Hinweis ist der ehrliche Inhalt dieser Seite. Der Wechsel zu Linux als Hauptsystem hieß, das ganze Konstrukt durch Wine zu fahren, und ein Stapel, den aufeinandergestapelte Behelfslösungen zusammenhalten und der stellenweise Internet Explorer in Panels rendert, verträgt eine Übersetzungsschicht nicht gut. Er lief. Er fühlte sich auch ein Update davon entfernt an, endgültig stehenzubleiben, mit einem Jahrzehnt Konfiguration darin.

catrox-recreation = Der Nachbau
    .body = Die CaTRoX-Arbeitsfläche in rox ist dieses Layout, aus nativen Panels neu gebaut: die runde Cover-Darstellung, die Metadatenliste, die nach Alben gruppierte Titelliste mit ihren Bewertungspunkten, die Menüleiste. Es ist ein Look, reproduziert, keine Portierung von irgendetwas. Nichts von CaTRoX' Code steckt in rox, und das ginge auch gar nicht, denn rox ist Rust auf [gpui](@gpui) und CaTRoX sind Panel-Skripte, die in foobar2000 laufen. Die größere Auseinandersetzung mit foobar2000, samt der Punkte, in denen es weiter vorne liegt, steht auf [einer eigenen Seite](/foobar2000-alternative).
    .after = Was sich geändert hat, ist, was es kostet, das zu haben. In rox ist ein ganzes Erscheinungsbild eine einzelne Datei mit Layout, Palette und Aussehen zusammen, die CaTRoX-Arbeitsfläche ist also ein Klick im Willkommensfenster, und was du daraus baust, ist eine Datei, die du jemandem geben kannst. Keine Komponentenliste, keine Installationsreihenfolge, keine Konfiguration, die sich nur auf der Maschine wieder zusammensetzt, auf der sie gebaut wurde.

catrox-shot-alt = Die CaTRoX-Arbeitsfläche in rox: eine runde CD-Darstellung des Covers, links eine Metadatenliste mit Titel, Künstler, Album, Codec und Bitrate, und rechts nach Alben gruppierte Titel mit Bewertungspunkten.

catrox-limits = Was du nicht zurückbekommst
    .aside = Was du stattdessen bekommst, ist ein Layout, das unter Linux und macOS läuft, ohne dass Wine auch nur in die Nähe kommt, ein Systemupdate übersteht und als eine Datei reist. Nach einem Jahrzehnt Pflege des Originals ist dieser Tausch der ganze Grund, aus dem es rox gibt.

catrox-limit-panels = Nicht jedes CaTRoX-Panel hat ein Gegenstück. rox hat rund vierzig eigene Panel-Typen, und es sind nicht dieselben vierzig.
catrox-limit-youtube = Keine YouTube-Wiedergabe. CaTRoX und NekoRoX hatten sie beide über Komponenten; rox spielt, was auf deiner Platte liegt.
catrox-limit-plugins = Keine Plugin-Schnittstelle, was du also mit einer foobar2000-Komponente gelöst hättest, muss es in rox schon geben oder es gibt es gar nicht.
catrox-limit-fidelity = Es ist ein Nachbau von außen. Details unterscheiden sich, und eine pixelgenaue Übereinstimmung war nie das Ziel.

# $others ist die Anzahl der mitgelieferten Arbeitsflächen minus dieser einen.
catrox-closer = Probier es aus
    .body = Die CaTRoX-Arbeitsfläche ist mit dabei, einen Klick entfernt im Willkommensfenster. { $others } weitere ebenso, darunter ein [Foobar-Layout und eins, das aussieht wie WinAmp](/workspaces).

## Cue-Sheets

cue-breadcrumb = Cue-Sheets
cue-title = FLAC- und CUE-Rips abspielen, Titel für Titel
    .description = Ein Abbild einer ganzen CD neben einem Cue-Sheet, indiziert als echte Titel: jeder Abschnitt spult, sortiert, scrobbelt und läuft lückenlos in den nächsten, und deine Playlists erfahren nie, dass sich drei Zeilen eine Datei teilen.

cue-h1 = Cue-Sheets, und Rips, die sich wie Alben verhalten
    .lede = Wenn du CDs gerippt hast, bevor das Aufteilen Standard war, liegt ein Teil deiner Sammlung als ein FLAC pro CD mit einer Textdatei daneben. Die meisten Player ignorieren das Sheet entweder oder behandeln, was darin beschrieben ist, als zweitklassig. Hier steht, was rox damit macht.

cue-what = Was ein CUE-Rip eigentlich ist
    .p1 = Eine Audiodatei mit einer ganzen CD darin, und ein `.cue`-Sheet, das auflistet, wo jeder Titel anfängt. So bewahrt man eine CD originalgetreu, denn die Pausen zwischen den Titeln gehören zur CD, und beim Aufteilen fallen sie weg. Es ist auch das Format, das die Annahme bricht, auf der jede Musikbibliothek gebaut ist: dass eine Datei ein Titel ist.
    .p2 = Player lösen das auf eine von drei Arten. Das Sheet ignorieren und einen siebzigminütigen Titel zeigen. Die Titel des Sheets zeigen, sie aber von der eigentlichen Bibliothek getrennt halten, sodass Suche, Sortierung und Playlists sich bei ihnen anders verhalten. Oder den Bruch ernst nehmen und ihn ein einziges Mal verdauen.

cue-rows = Echte Zeilen, keine Fragmente
    .p1 = rox indiziert jeden Abschnitt des Sheets als ganz normale Zeile in der Bibliothek, identifiziert über seine Datei plus seine Titelnummer. Alles Weitere liest ihn als Titel, weil er für alles Weitere einer ist. Playlists halten ihn fest, Hörvorgänge hängen an ihm, die Suche findet ihn, die Sortierspalten sortieren ihn, und keines davon weiß, dass elf Zeilen auf dasselbe FLAC zeigen.
    .p2 = Die Alternative, für die sich die meisten Implementierungen entscheiden, ist ein künstlicher Pfad, `album.flac#3`, der die Datenbank ordentlich hält und das Problem auf jedes Stück Code verschiebt, das diesen Pfad später öffnet. Ein vergessenes Abschneiden dort ist ein stiller Fehler, der Tag-Bytes aus dem Nichts liest. Eine Sammlung ohne Cue-Sheets zahlt für nichts davon: die Abschnitte leben in einer Nebentabelle, und auf den heißen Pfaden liest sie niemand.

cue-playing = Einen Abschnitt wie eine Datei abspielen
    .p1 = Die Engine behandelt einen Abschnitt als die ganze Welt für diesen Titel: ein präziser Sprung an seinen Anfang, ein sampleexakter Schnitt an beiden Kanten, und eine Endgrenze, die denselben Weg nimmt wie ein echtes Dateiende. Lückenlos, Crossfade, Nach-aktuellem-Titel-stoppen und Wiederholen funktionieren alle, ohne zu wissen, dass es Abschnitte gibt.
    .p2 = Der Schnitt am Anfang ist das Detail, auf das es ankommt. Ein präziser Sprung landet auf einer Paketgrenze statt exakt auf dem Sample, ohne das Verwerfen der Frames zwischen der Landung und dem Abschnittsbeginn fängt also jeder Titel mit dem Ende des vorherigen an. Genau so klingt eine Cue-Umsetzung, die niemand zu Ende gebracht hat.
    .p3 = Aufeinanderfolgende Titel eines Rips teilen sich eine Albumgruppe, und genau das hält den Crossfade davon ab, über die eigenen lückenlosen Übergänge einer CD zu blenden. Ein Rip spielt wie die Platte, von der er stammt.

cue-scanning = Einlesen, und wenn du es dir anders überlegst
    .p1 = Das Sheet beansprucht sein Abbild. Solange ein Cue eine Datei auflistet, bekommt diese Datei keine eigene Zeile, du landest also nicht bei elf Titeln plus einem siebzigminütigen Duplikat. Die Aktualität richtet sich danach, welches der beiden zuletzt geändert wurde, das Bearbeiten von Sheet oder Audio schneidet den Rip beim nächsten Einlesen also neu. Lösch das Sheet, und aus dem Abbild wird wieder eine einzelne schlichte Zeile.
    .p2 = Die Metadaten bevorzugen das Sheet und fallen auf die eigenen Tags des Abbilds zurück. Sheets, die vor der UTF-8-Disziplin geschrieben wurden, bekommen einen cp1252-Rückfall, denn alte Rips sind genau die Gruppe, für die es diese Funktion gibt.

cue-ratings = Bewertungen, die nicht die ganze CD stempeln
    .p1 = rox schreibt Bewertungen normalerweise in die Dateien selbst, was richtig ist, solange eine Datei ein Titel ist. Bei einem CUE-Rip ist sie das nicht: das Abbild gehört allen elf Titeln, ein Schreibvorgang pro Titel würde also jedem einzelnen dieselben Sterne aufdrücken.
    .p2 = Der Schreibweg verweigert bei diesen Zeilen die Datei-Hälfte, und die Datenbank behält den Wert. Genauso bei Tag-Änderungen. Du bekommst Bewertungen pro Titel auf einem Rip, und dein Abbild kommt byteidentisch daraus hervor.

cue-outstanding = Vorerst außen vor
    .body = Wellenform-Spitzenwerte und der akustische Analysedurchlauf lesen weiterhin das ganze Abbild statt den Abschnitt. Songtexte gelten pro Datei, ein Rip teilt sich also einen Songtext. ReplayGain-Messung pro Abschnitt, das Bearbeiten von Cue-Sheets in der App und eingebettete FLAC-CUESHEET-Blöcke sind alle nicht abgedeckt. Jedes davon kommt oben auf die Art drauf, wie Abschnitte identifiziert werden, und keines ändert sie.

cue-later = Die Teile, die dir erst später auffallen würden
    .aside = Der Maßstab dafür ist nicht, ob ein Rip abspielt. Sondern ob sich einen Monat später noch irgendetwas in der Bibliothek anders verhält, weil es aus einem Abbild kam.

cue-later-m3u = Der m3u-Export schreibt Abschnitte als `path#N`, und der Import bevorzugt eine exakte Pfadübereinstimmung, eine Liste übersteht den Umweg über andere Software also, ohne auf das Abbild zusammenzufallen.
cue-later-scrobble = Scrobbling und Titelanzeige deduplizieren auf dem Paar, die elf Titel einer CD scrobbeln also als elf Titel und nicht als ein sehr langer.
cue-later-listens = Hörvorgänge hängen sich nach einem erneuten Einlesen wieder pro Abschnitt an, eine CD behält ihre Wiedergabehistorie also pro Titel, selbst wenn jeder Abschnitt identische Tags trägt.
cue-later-replaygain = Nur das Album-Paar der ReplayGain-Werte wird übernommen. Titelwerte, die gegen ein Abbild einer ganzen CD geschrieben wurden, beschreiben die CD, sie werden also ignoriert statt geglaubt.

cue-closer = Zeig ihm das Regal, das du nie aufgeteilt hast
    .body = Der Scanner nimmt die Sheets im ersten Durchlauf mit, zusammen mit allem anderen. Mehr dazu, [was bei großen Sammlungen kaputtgeht](/best-music-player).

## Foobar2000

fb-breadcrumb = Foobar2000-Alternative
fb-title = Eine Foobar2000-Alternative für Linux, macOS und Windows { $year }
    .description = Foobar2000 hat Panel-Layouts, tiefes Tagging und eine Theme-Kultur richtig gemacht und das meiste davon unter Windows stranden lassen. rox ist ein nativer, quelloffener Player, der alle drei nach Linux und macOS bringt.

fb-h1 = Eine Foobar2000-Alternative, die überall läuft
    .lede = Foobar2000 hat drei Dinge richtig gemacht, die fast nichts sonst gleichzeitig kann, und zwei davon unter Windows stranden lassen. rox ist der Versuch, alle drei mit hinüberzunehmen.

fb-right = Was Foobar2000 richtig gemacht hat
    .p1 = Eine Oberfläche, die du aus Panels zusammensetzt, statt zu akzeptieren, was der Entwickler ausgeliefert hat. Darauf eine Theme-Kultur, und nur deshalb gibt es CaTRoX, [NekoRoX](/nekorox) und Georgia überhaupt. Und Tag- und Bibliotheksverwaltung, die nicht umfällt, wenn die Sammlung Zehntausende Dateien tief ist.
    .p2 = Viele Player können eins davon. Sehr wenige können zwei. Das Paket aus allen dreien gibt es seit zwanzig Jahren praktisch nur unter Windows, und jeder Versuch, es zu bewegen, hieß, eins davon aufzugeben.

fb-leaves = Wo es dich hängen lässt
    .p1 = Unter Linux gibt es keinen offiziellen Foobar2000-Build, die ehrlichen Optionen sind also Wine oder etwas anderes. Wine funktioniert genau so lange, bis es das nicht mehr tut. Ein Skin wie CaTRoX stützt sich auf aufeinandergestapelte Behelfslösungen und stellenweise auf Internet Explorer, der in Panels rendert, und das durch eine Übersetzungsschicht zu fahren zeigt genau, wie viel davon Glück ist. Es ist jedes Mal ein Systemupdate vom Kaputtgehen entfernt.
    .p2 = macOS ist besser als früher, seit Foobar2000 v2 einen echten Mac-Build mitbringt. Aber der Teil, den Leute eigentlich wollen, das Komponenten- und Skin-Ökosystem, das die Windows-Version ein Wochenende Einrichten wert gemacht hat, liegt auf der Windows-Seite. Du bekommst den Player ohne den Grund, aus dem du den Player wolltest.
    .p3 = Und unter Windows selbst ist nichts falsch. Das gehört klar gesagt: wenn du unter Windows bist und dein Foobar2000-Setup funktioniert, ist rox kein Notfall.

fb-does = Was rox dagegen tut
    .p1 = Nativ auf allen drei Plattformen, je eine Binärdatei, in Rust auf [gpui](@gpui) geschrieben. Rund vierzig Panel-Typen, die du selbst anordnest, mit eigenen Konfigurationen duplizierst und in echte Betriebssystemfenster auskoppelst. Der Bibliotheksscanner liest vollständige Tags, echte Laufzeiten und den Codec, die Abtastrate und die Bittiefe jeder Datei, statt Header zu überfliegen, und er hält bei 50.000 Titeln stand.
    .p2 = Beim Theming hat sich am meisten geändert. Eine Arbeitsfläche ist eine einzelne Datei mit Layout, Palette und Aussehen zusammen. Du bearbeitest sie, du machst sie kaputt, du gibst sie weiter, und was ankommt, ist genau das, was du hattest. Eine der { workspace-count } mitgelieferten ist ein [CaTRoX-Nachbau](/catrox), was die ehrliche Absichtserklärung ist.

fb-shot-alt = Die CaTRoX-Arbeitsfläche in rox: der foobar2000-Skin nativ nachgebaut, mit einer runden CD-Darstellung des Covers, einer Metadatenliste links und nach Alben gruppierten Titeln mit Bewertungspunkten.

fb-table = Nebeneinander
    .caption = Foobar2000 und rox im Vergleich: Plattformunterstützung, Theming, Lizenz und Reife
    .area = Bereich
    .method = Drei Zeilen gehen an Foobar2000, und es sind die drei, deren Aufholen Jahre dauern würde. Eine Vergleichstabelle, in der eine Spalte alles gewinnt, ist Werbung und kein Vergleich.

fb-row-linux = Nativ unter Linux
    .fb = Kein offizieller Build. Nur Wine.
    .rox = Erstklassig, x86_64.

fb-row-macos = Nativ unter macOS
    .fb = Offizieller Build seit v2.
    .rox = Erstklassig, Apple Silicon.

fb-row-windows = Nativ unter Windows
    .fb = Heimspiel, seit über zwanzig Jahren.
    .rox = Erstklassig, x86_64.

fb-row-panels = Panels zum Zusammenstellen
    .fb = Ja, über Columns UI und Co.
    .rox = Rund vierzig Panel-Typen, eingebaut. Nichts nachzurüsten.

fb-row-sharing = Einen Look teilen
    .fb = Ein Skin ist Komponenten, Konfigurationen und Skripte. Berüchtigte Frickelei.
    .rox = Eine Datei mit Layout, Palette und Aussehen.

fb-row-source = Quellcode verfügbar
    .fb = Geschlossene Freeware.
    .rox = AGPL-3.0, komplett.

fb-row-components = Komponenten-Ökosystem
    .fb = Jeder hat auf dem Vorherigen aufgebaut. Es gibt nichts, was es nicht gibt.
    .rox = Keine Plugin-Schnittstelle.

fb-row-maturity = Reife
    .fb = Seit 2002. Es überrascht dich nicht.
    .rox = Seit 2026. Ab und zu schon.

fb-row-footprint = Fußabdruck
    .fb = Legendär klein.
    .rox = Eine Binärdatei mit 62 MB, 134 MB im Speicher bei 50k Titeln.

fb-not = Wer nicht wechseln sollte
    .p1 = Wenn du unter Windows bist, deine Komponenten eingerichtet sind und das Setup seit einem Jahrzehnt stabil läuft, ist hier nichts die Umstellung wert. Wenn du auf eine bestimmte Foobar2000-Komponente angewiesen bist, hat rox keine Plugin-Schnittstelle und kann sie nicht ersetzen. Wenn du Software willst, die all ihre Fehler schon gemacht hat, ist rox vier Jahre zu jung.
    .p2 = Wenn du zu Linux gewechselt bist und das Setup zurückgelassen hast, oder auf einem Mac einen Player ohne das Ökosystem hältst, das ihn gerechtfertigt hat, dann ist das die Lücke, in der das hier gebaut wurde.
    .p3 = Spät zu kommen hat auch eine andere Seite, und die gehört gesagt. Nichts in rox muss zu einer Entscheidung von 2002 kompatibel bleiben, und genau deshalb wird ein ganzer Look eine teilbare Datei statt eines Komponentengraphen, deckt eine Codebasis alle drei Plattformen ab, und liegen rund vierzig Panel-Typen bei statt Download für Download zusammengesetzt zu werden. Es ist auch der Grund, aus dem die Identität eines Titels nie an Dateipfade gebunden war, und das ist es, was das Zusammenführen einer lokalen Sammlung mit irgendetwas anderem später möglich macht. Der Großteil dieser 62 MB ist dieselbe Geschichte.
    .aside = Panels, die sich in echte Betriebssystemfenster auskoppeln, oder eine Palette, die sich am gerade laufenden Cover neu einfärbt, haben es nie in die Tabelle oben geschafft. Es gab nichts, was man in die andere Spalte hätte schreiben können. Wenn du auf solche Unterschiede aus bist, bist du bei rox richtig.

fb-closer = Probier es an deiner eigenen Sammlung
    .body = Frei, quelloffen unter der AGPL, kein Konto und kein Installer. Zeig es der Sammlung, an der andere Player scheitern.
    .fine = Oder lies erst den [Quellcode](@repo). Das ist eine vernünftige Art, einen Player zu beurteilen, der Schreibzugriff auf deine Tags will. Noch am Abwägen? Die [Kriterien, die Bibliotheks-Player unterscheiden](/best-music-player), stehen separat ausgeschrieben, Benchmarks inklusive.

## Mp3tag

mp3tag-breadcrumb = Mp3tag-Alternative
mp3tag-title = Eine Mp3tag-Alternative für Linux und macOS { $year }
    .description = Stapelweise Tag-Bearbeitung über FLAC, MP3, MP4 und APE, ein Raster pro Datei für die unordentlichen Importe, Bewertungen in den Dateien selbst und ein Schreibweg, der ein Original nie an Ort und Stelle verändert.

mp3tag-h1 = Ein Tag-Editor, den du auf zehntausend Dateien loslassen kannst
    .lede = Mp3tag ist das Werkzeug, das die meisten Leute meinen, wenn sie Tag-Editor sagen, und es gibt keinen Linux-Build davon. rox hat einen vollwertigen Editor eingebaut, und einen Schreibweg für den Fall, dass eine Stapelverarbeitung groß genug ist, dass „läuft meistens“ nicht mehr reicht.

mp3tag-isnt = Zuerst das, was das hier nicht ist
    .p1 = rox ist ein Musikplayer, in dem ein ernstzunehmender Tag-Editor steckt. Mp3tag ist ein spezialisierter Tagger, und als spezialisierter Tagger ist es besser: Skripting, Aktionen, zusammensetzbare Formatzeichenfolgen und zwanzig Jahre abgeschliffene Kanten. Wenn du ein eigenständiges Werkzeug willst, das du über einen Ordner laufen lässt und danach schließt, unter Windows, dann ist Mp3tag das Richtige.
    .p2 = Das Argument dafür, es in rox zu tun, ist, dass das Taggen einer Sammlung normalerweise keine Aufgabe ist, die man abschließt. Es ist etwas, das man beim Hören tut, an der Datei, die einem gerade als falsch aufgefallen ist, und deshalb ist es Absicht und kein Kompromiss, dass der Editor am Player und an der Bibliothek hängt.

mp3tag-write = Der Schreibweg
    .p1 = Das ist der Teil, der sich zu lesen lohnt, selbst wenn du rox nie installierst. Die meisten Tag-Schreiber verändern deine Datei an Ort und Stelle: sie öffnen das Original, schreiben den Metadatenbereich neu und hoffen. Das geht zehntausende Male gut und einmal katastrophal schief, denn ein Absturz, eine volle Platte oder ein herausgezogenes Laufwerk mittendrin hinterlassen eine Datei, die nicht mehr lesbar ist, mit deinem Audiomaterial darin.
    .p2 = rox schreibt nie in ein Original. Jede Änderung kopiert die Datei, wendet die Änderung auf die Kopie an, prüft das Ergebnis, indem sie die Metadaten zurückliest und den Audiostream hasht, um zu bestätigen, dass er byteidentisch zu dem ist, was hineinging, und benennt die Kopie erst dann atomar über das Original um. Scheitert irgendein Schritt, wird die Kopie gelöscht und deine Datei bleibt unberührt, weil sie gar nicht erst zum Schreiben geöffnet wurde.
    .p3 = Jede Datei ist außerdem isoliert, eine einzige kaputte Datei in einem Stapel von viertausend scheitert also für sich, statt den ganzen Durchlauf mitzureißen.

mp3tag-cost = Der Preis
    .body = Kopieren, prüfen, umbenennen heißt, dass jede Änderung kurzzeitig freien Platz in Größe der Datei braucht, und es ist langsamer, als an Ort und Stelle zu schreiben. Bei einem Stapel von ein paar tausend FLACs ist das echte Zeit und echter Plattenplatz. Es ist der Tausch, den rox absichtlich macht, und es ist der ganze Grund, aus dem der Editor sicher auf eine Bibliothek statt auf einen Ordner gerichtet werden kann.

mp3tag-batch = Einen Stapel bearbeiten, ohne ihn einzuebnen
    .p1 = Markiere beliebig viele Titel, und der Editor öffnet sich als ein gemeinsames Formular. Ein Feld, in dem alle Dateien übereinstimmen, zeigt seinen Wert; Felder, die sich unterscheiden, bleiben leer unter einem Platzhalter für mehrere Werte. Nur Felder, die du wirklich anfasst, schreiben etwas, ein unberührtes Feld schreibt also keine Datei neu, und die Felder, die über eine Auswahl gestempelt Unsinn wären, also Titel, Titelnummer und CD-Nummer, sperren sich in einem Stapel selbst.
    .p2 = Wenn eine Datei innerhalb des Stapels falsch ist, wird aus dem Formular eine Tabelle: eine Zeile pro Titel, eine Spalte pro Feld, die gesperrten Felder pro Titel direkt bearbeitbar. Das ist die Ansicht für den Import, bei dem jeder Titel und jede Nummer auf andere Weise falsch ist, und das ist besser, als sich Feld für Feld durchzuklicken. Beide Ansichten schreiben als ein Stapel über denselben Schreibweg, und das Ergebnis landet ohne erneutes Einlesen in der Bibliothek.

mp3tag-specs = Was er liest und schreibt
mp3tag-spec-formats = **Formate.** ID3v2, Vorbis-Kommentare, MP4-Atome und APE hinter einem Editor, MP3, FLAC, M4A und der Rest sind also dieselbe Maske.
mp3tag-spec-ratings = **Bewertungen.** Über FMPS und POPM in die Dateien selbst geschrieben, nicht in eine Datenbank, die du nicht mitnehmen kannst.
mp3tag-spec-genres = **Mehrwertige Genres.** Echte Listen, deren Zusammenführungen als Meinung der Bibliothek gehalten werden statt als Umschreiben deiner Tags.
mp3tag-spec-art = **Cover.** Albumcover mit mehreren Bildern, hinzugefügt und ersetzt über denselben atomaren Weg.
mp3tag-spec-lookup = **Abgleich.** Tags und Cover von MusicBrainz, iTunes und Deezer, angewendet über denselben Diff, du siehst also, was sich ändert, bevor geschrieben wird.
mp3tag-spec-repair = **Reparatur.** Ein Durchlauf für Dateien, deren Tags auf bestimmte bekannte Arten beschädigt statt bloß falsch sind, also die, bei denen andere Tagger einen Titel als Dateinamen mit Laufzeit null anzeigen.
mp3tag-spec-patterns = **Muster, in beide Richtungen.** Eine Formatzeichenfolge wie `%artist% - %title%` liest Tags aus einem Dateinamen, und dasselbe Muster rückwärts benennt Dateien nach ihren Tags um. Beide zeigen jeden Titel in der Vorschau, bevor irgendetwas geschrieben wird.

mp3tag-stay = Wer bei Mp3tag bleiben sollte
    .p1 = Wenn du unter Windows bist und dich auf Aktionen, Skripting oder die aufwendigere Arbeit mit Formatzeichenfolgen stützt, hat rox kein Gegenstück und das hier wäre ein Rückschritt. Wenn du einen Tagger willst, der nicht auch ein Player ist, ist das hier die völlig falsche Form.
    .p2 = Wenn du unter Linux oder auf einem Mac bist, oder dein Taggen mitten im Hören passiert statt als getrennte Pflichtübung, dann ist das die Lücke, die das hier füllt.
    .aside = Der Schreibweg ist der Teil, für den es kein Gegenstück zum Vergleichen gibt. Einen Hash des Audiostreams zu prüfen, bevor über ein Original umbenannt wird, tut ein Tagger nicht, wenn er nicht damit rechnet, auf alles gerichtet zu werden, was du besitzt. Wenn du diese Art Vorsicht zwischen einer Änderung und deinen Dateien willst, ist das hier genau das.

mp3tag-closer = Zeig ihm den Ordner, um den du einen Bogen machst
    .body = Frei und quelloffen, kein Konto, kein Installer. Die [Bibliotheksseite davon](/best-music-player) steht separat, und wenn du von einem Windows-Setup kommst, gibt es auch einen [MusicBee-](/musicbee-alternative) und einen [Foobar2000-Vergleich](/foobar2000-alternative).

## Die Visualisierung

viz-breadcrumb = Musik-Visualisierung
viz-title = Eine Musik-Visualisierung, die im Player eingebaut ist - rox
    .description = Spektrum-, Wellenform- und VU-Panels, dazu WGSL-Shader über jedem Panel oder dem ganzen Fenster, angetrieben von benannten Signalen, die du aus dem laufenden Audiomaterial ziehst und schickst, wohin du willst.
    .image-alt = Das rox-Logo über dem englischen Satz: signals off the music, shaders on every surface

viz-h1 = Eine Visualisierung, die im Player wohnt
    .lede = Die meisten Player geben dir einen Spektrumanalysator und hören da auf. rox hat diese Panels, und darunter eine Modulationsschicht: benannte Signale aus dem Audiomaterial, geleitet in Shader-Eingänge, die du selbst schreibst, gespeichert in derselben Datei, in der auch der Rest deines Themes lebt.

viz-panels = Zuerst die gewöhnlichen Panels
    .p1 = Ein Spektrum-Panel mit Balken- oder Blockstilen, Verläufen, Spitzenkappen mit eigener Schwerkraft, Frequenzbeschriftungen und geteilter Zonierung, die ober- und unterhalb einer gewählten Frequenz mit unterschiedlichen Fenstergrößen analysiert, damit jedes Ende des Bereichs Reaktionsfreude gegen Auflösung zu eigenen Bedingungen tauscht. Ein Wellenformstreifen, der den ganzen Titel zeichnet, pro Kanal, und dorthin springt, wo du klickst. Ein VU-Meter. Ein Cover-Regal, das Cover in echtem 3D dreht. Nichts davon braucht eine Zeile Code, und es ist das, was die meisten Leute benutzen werden.
    .p2 = Pausieren friert die Balken dort ein, wo sie waren, statt sie auf den Boden fallen zu lassen. Das klingt nach Kleinigkeit, bis du dir genau den Moment ansehen willst, in dem du pausiert hast.

viz-shaders = Shader, auf vier Flächen
    .p1 = Ein rox-Shader ist eine WGSL-Fragmentstufe. Er kann über der Fläche eines einzelnen Panels laufen, als eigenes Shader-Panel, als Overlay über dem ganzen Fenster, oder als Hintergrund, der unter allen Panels malt, hinter dem Cover. Overlay und Hintergrund haben je einen Schalter, der sie auf jedes offene rox-Fenster ausdehnt. Dieselbe Sprache, derselbe Uniform-Block, dieselbe Signalführung überall.
    .p2 = Jeder Shader bekommt die Uhr, die Auflösung, den Zeiger und acht Meta-Fließkommawerte, die den Moment beschreiben: Lautstärke, wo der Abspielkopf im Titel steht, ob überhaupt Audio läuft, die Länge des Titels, und wie dunkel die aktuelle Palette rendert, damit ein Shader sich für hell und dunkel passend anziehen kann, statt nur auf dem Theme zu funktionieren, für das er geschrieben wurde.
    .p3 = Ein Panel-Shader kann außerdem lesen, was das Panel tatsächlich gezeichnet hat. Eine Maskenbindung reicht ihm die eigene Zeichnung des Panels, auf Transparenz abgespielt, und Panels veröffentlichen die Form ihres Inhalts, ein Schatten oder ein Leuchten folgt also einem Cover im Letterbox-Format statt den leeren Balken links und rechts davon.
    .p4 = Über eine Stufe hinaus teilt ein `// @pass`-Kommentar den Text in eine Kette von bis zu acht, von denen jede die vorherigen Durchläufe namentlich lesen kann. Genau das braucht eine Blur-Pyramide oder ein zweistufiges Bloom. Eine `// @asset`-Zeile benennt ein Bild zum Abtasten, und `// @asset art: @cover` bindet das Cover des laufenden Titels und bindet neu, wenn der Titel wechselt. Neun Beispiele liegen der App bei, jedes davon führt einen anderen Teil dieses Vertrags vor statt neun Varianten eines Plasmas.
    .p5 = Zeig das Panel auf eine Datei auf der Platte, und rox beobachtet sie. Speichere in deinem Editor, und das Fenster hat es. Ein Speichern, das nicht übersetzt, lässt die letzte funktionierende Fassung auf dem Bildschirm und schreibt den Fehler ins Panel, denn das Bild zu verlieren ist eine schlechte Art herauszufinden, dass du ein Semikolon vertippt hast.

viz-signals = Signale sind der Teil, der anders ist
    .p1 = Ein Shader mit einer Uhr darin ist ein Bildschirmschoner. Zur Visualisierung wird er durch das, womit du ihn fütterst, und in rox ist das ein Pool benannter Signale, den sich die ganze App teilt. Du baust sie in einem eigenen Fenster unter Anwendung, neben dem Equalizer, und es bringt ein Spektrum und einen Transport mit, aus demselben Grund wie der Equalizer: du wählst ein Band mit Auge und Ohr an dem aus, was du tatsächlich abspielst.
    .p2 = Fünf Arten von Quelle. Ein **Band** ist die Energie zwischen zwei Frequenzen, das Signal, auf dem eine Welle reitet. **Pegel** ist die ganze Mischung. Ein **Onset** pulst, wenn ein Band über seinen eigenen jüngsten Durchschnitt springt, das Signal, auf dem ein Schlag reitet. Ein **Auslöser** pulst, wenn ein Band eine Linie überschreitet, die du gezogen hast, für Material, bei dem der gleitende Durchschnitt nie zum Abfallen kommt und ein Onset nach dem ersten Takt verstummt. Eine **Summe** zählt ein anderes Signal über die Zeit auf und läuft bei eins über, ein Shader kann sie also als Phase lesen, die vorrückt, solange die Musik laut ist, und stehenbleibt, wenn sie es nicht ist.
    .p3 = Jedes trägt eine Ansprechglättung und ein Gate. Das Gate ist die Einstellung, die sich ihren Platz verdient: ein Band, das auf Raumgeräusch mitreitet, hält jeden daran hängenden Regler für immer ein wenig aus der Ruhelage, und eine Schwelle mit einer Kurve darüber liefert stattdessen zwischen den Schlägen Stille. Das Messwerk zeichnet den ungegateten Wert mit der Schwelle quer darüber, denn ein Balken, der unter seinem eigenen Gate verschwunden ist, wäre beim Setzen des Gates überhaupt keine Hilfe.
    .p4 = Eine Route hängt ein Signal an einen Parameter, mit einem Ausgangsbereich: dieses Signal, dieses Ziel, von hier bis dort. Sechzehn Plätze erreichen jeden Shader, und die Plätze, auf die nichts geleitet ist, bekommen einen einfachen Regler auf der Einstellungsseite, ein Look kann also zur Hälfte von der Musik gespielt und zur Hälfte von Hand gesetzt sein.

viz-tap = Gemessen vor dem Lautstärkeregler
    .body = Der Abgriff, den die Visualisierung liest, sitzt vor der Ausgangslautstärke. Die Musik leiser zu drehen ließ sie früher leiser aussehen, als sie ist, und ein bei einer Lautstärke abgestimmtes Signal war bei einer anderen falsch. Equalizer und ReplayGain schlagen weiterhin durch, denn die laufen davor und gehören zu dem, was du hörst.

viz-critters = Critters, als Argument
    .body = Eine der mitgelieferten Arbeitsflächen ist der ganze Player als 1-Bit-Druck: ein geordneter Dither über jeder Fläche, Tonwerte, die mit dem Subbass zusammenbrechen, und eine Rauschwand hinter den Panels, die sich mit dem Song bewegt. Es sind fünf Signale und vier Shader in einer einzigen Datei, und nichts davon ist ein Sonderfall in der App.
    .caption = Lade ihn aus dem Willkommensfenster, öffne dann die Einstellungen und nimm ihn auseinander. [Der Rest davon](/workspaces).

viz-trust = Den Shader eines Fremden ausführen
    .p1 = Shader reisen in den Dateien der Arbeitsflächen mit, ein importierter Look kommt also mit dem Code von jemand anderem an.
    .p2 = Nichts läuft, bevor du es sagst. Der Quellcode jedes Shaders bekommt einen Fingerabdruck, und die Freigabeliste ist maschinenlokal und wird nur durch eine direkte Handlung geschrieben: du hast die Datei ausgewählt, du hast neu geladen, du hast eine Vorlage gewählt, du hast Freigeben gedrückt. Ein Look, der in einem Bündel ankam, sitzt bis dahin untätig da, mit einem Knopf darunter. Die Beispiele, die rox mitbringt, sind konstruktionsbedingt vertrauenswürdig, weil sie in die Binärdatei einkompiliert sind.
    .p3 = Eines anzuschalten öffnet ein Bestätigungsfenster, das auf eine Antwort wartet, statt herunterzuzählen, und dieses Fenster wird selbst nie geshadert. Was der Shader auch mit dem Rest des Bildschirms anstellt, der Weg hinaus bleibt lesbar.

viz-limits = Was nicht abgedeckt ist
    .aside = Der Weg von „ich will, dass der ganze Player auf den Kick blitzt“ bis dahin, dass er es tut, sind ein Band, ein Gate und eine Route, und keines der drei braucht einen neuen Build.

viz-limit-routes = Routen erreichen Shader-Plätze und die Regler des Partikel-Panels. Die Einstellungen jedes anderen Panels sind weiterhin Regler, die du von Hand setzt.
viz-limit-milkdrop = WGSL, nicht Milkdrop oder AVS. Es gibt für keines von beiden einen Importer, und zwanzig Jahre Vorlagen kommen nicht mit herüber.
viz-limit-midi = Keine MIDI- oder OSC-Steueroberfläche. Der Overlay-Durchlauf und die Panel-Durchläufe sind, was es gibt, angetrieben vom Audiomaterial und vom Zeiger.
viz-limit-battery = Ein Durchlauf über das ganze Fenster ist ein echter GPU-Durchlauf pro Bild. Auf einem Laptop im Akkubetrieb ist das eine Entscheidung, die du triffst.

viz-closer = Probier es an deiner eigenen Sammlung
    .body = Nichts hier telefoniert nach Hause: die Analyse ist das Audiomaterial, das ohnehin durch den Player läuft. Mehr dazu, [was eine Arbeitsfläche mit sich trägt](/workspaces).

## NekoRoX

neko-title = NekoRoX, das foobar2000-Theme, nativ neu gebaut
    .description = NekoRoX war ein CaTRoX-Fork für foobar2000: eigene Panels, synchrone Songtexte, Discord-Präsenz, Last.fm-Werkzeuge. Es ist inzwischen archiviert, und rox ist der native Player, den sein Autor stattdessen gebaut hat.

neko-h1 = NekoRoX, das foobar2000-Theme, und wohin es ging
    .lede = NekoRoX war ein foobar2000-Theme: ein Fork von CaTRoX mit einem Jahrzehnt aufgestapelter Panels, Plugins und Korrekturen. Ich habe es als [catlinman](https://github.com/catlinman) gepflegt, bis es nicht mehr pflegbar war. rox ist, was ich stattdessen gebaut habe, und sein Standard-Look ist dieses Layout, von Grund auf neu gebaut.

neko-shot-alt = Das foobar2000-Theme NekoRoX: ein dunkles Layout mit den Reitern INF, BIO, LYR, ART und LIB, links eine Cover-Wand, rechts nach Alben gruppierte Titel mit Sternebewertungen, und unten eine bernsteinfarbene Wellenform mit einem Spektrumanalysator.
neko-shot-caption = NekoRoX in foobar2000, unter Windows, im Jahr 2022.

neko-was = Was NekoRoX war
    .p1 = Ein fertig geschnürtes foobar2000-Setup, das du nach `%appdata%` entpackt hast, und der Player stand. Dunkel, dicht, Reiter für Info, Biografie, Songtext, Cover und Bibliothek, an einer Seite eine Cover-Wand, nach Alben gruppierte Titel mit Bewertungspunkten, und unten eine bernsteinfarbene Wellenform mit einem Spektrum darunter. Darunter lagen Columns UI, ein Haufen JScript-Panels, eine `.fcl`-Layoutdatei und ein Schriftartenordner, den du von Hand installieren musstest.
    .p2 = Angefangen hat es als [CaTRoX](/catrox), dem Theme von eXtremeHunter1972, später von TheQwertiest weitergeführt. NekoRoX kam mit Baum- und Filternavigation, Mini-Player-Modi, einem Panel für synchrone Songtexte, einem Cover-Flow, Discord-Präsenz und Last.fm-Werkzeugen dazu und hat unterwegs viel von TheQwertiests Arbeit zurückgeführt. Keines der darunterliegenden Skripte war von mir, und die README hat das immer gesagt.

neko-where = Wo du es findest
    .body = Das Repository steht weiterhin unter [github.com/catlinman/foobar2000](https://github.com/catlinman/foobar2000), und die Dateien funktionieren noch. Es wird nicht gepflegt, es läuft nur unter Windows, und mehrere Komponenten, von denen es abhängt, sind veraltet oder von ihren ursprünglichen Servern verschwunden. Wenn du es benutzen willst, benutz es. Nur repariert es niemand mehr.

neko-alpha = AlphaRoX, das helle
    .body = Dasselbe Theme mit umgedrehter Palette, unter diesem Konto als [AlphaRoX](https://github.com/zealsprince/foobar2000) veröffentlicht. Es ist ein Fork von NekoRoX, das ein Fork von CaTRoX ist, was ziemlich genau zeigt, was daran falsch war, einen Look auf diese Art zu verteilen. Derselbe Stand wie NekoRoX heute: online, funktionierend, ungepflegt.
    .alt = Das foobar2000-Theme AlphaRoX: das helle Gegenstück zu NekoRoX, mit weißem Hintergrund, einer Cover-Wand links, nach Alben gruppierten Titeln mit Sternebewertungen, und einer blauen Wellenform mit Spektrumanalysator am unteren Rand.

neko-stopped = Warum es aufgehört hat
    .p1 = Ich bin ganz zu Linux gewechselt, was hieß, dass das ganze Konstrukt durch Wine ging. Es lief. Es hat auch Internet Explorer in Panels gerendert, und ein Stapel, den aufeinandergestapelte Behelfslösungen zusammenhalten, hat mit einer Übersetzungsschicht keine Freude. Jedes foobar2000-Update und jedes Wine-Update war ein Münzwurf über ein Jahrzehnt Konfiguration.
    .p2 = Das tiefere Problem war das Format. Eine NekoRoX-Installation ist keine Datei, sie ist eine Komponentenliste, eine Installationsreihenfolge und ein Satz Pfade, die sich nur auf der Maschine wieder zusammensetzen, auf der sie gebaut wurden. Deshalb stand in der README, man solle vier Verzeichnisse an zwei verschiedene Orte kopieren. Einen Look zu teilen sollte keine Seite Anleitung brauchen.

# $others ist die Anzahl minus der Standard-Arbeitsfläche und CaTRoX, die
# beide schon im Satz stehen.
neko-rox = Was rox daraus macht
    .body = rox ist ein nativer Player in Rust, unter Linux, macOS und Windows, ohne foobar2000 und ohne Wine darunter. Seine Standard-Arbeitsfläche ist das NekoRoX-Layout, aus nativen Panels neu gebaut, deshalb sehen die beiden Screenshots verwandt aus. Es gibt auch eine [CaTRoX-Arbeitsfläche](/catrox) dazu, und { $others } weitere.

neko-default-alt = Die Standard-Arbeitsfläche von rox, eine native Rekonstruktion des NekoRoX-Layouts: ein Cover-Raster neben einer Playlist mit Sternebewertungen, eine bernsteinfarbene Wellenform als Fortschrittsleiste am unteren Rand, und Reiter für Biografie, Songtext und Metadaten.

neko-carried = Die Funktionsliste, Zeile für Zeile
    .after = Das, was NekoRoX nicht konnte, ist mir am wichtigsten. In rox ist ein ganzes Erscheinungsbild eine einzelne Datei mit Layout, Palette und Aussehen zusammen, du gibst also jemandem eine Arbeitsfläche weiter und damit dein ganzes Setup. Keine Komponentenliste, keine Installationsreihenfolge, kein Schriftartenverzeichnis.

neko-had-nav = Baum- und filterbasierte Navigation
    .now = Ordnerbaum-Panel, dazu ein kaskadierendes Filter-Panel über Künstler, Album, Genre und Jahr.
neko-had-mini = Mini- und Mikro-Player-Modi
    .now = Ein Mini-Layout pro Arbeitsfläche, aus dem Transport heraus umschaltbar, mit eigener Fenstergröße.
neko-had-ontop = Immer im Vordergrund
    .now = Noch nichts. Das Fenster ist ein normales Fenster.
neko-had-ratings = Bewertungs- und Wiedergabezähler-Ansichten
    .now = Bewertungen mit fünf Sternen oder zehn Punkten, in POPM und FMPS geschrieben, und eine sortierbare Spalte für Wiedergaben.
neko-had-youtube = YouTube-Audiosuche und -wiedergabe
    .now = Nichts. rox spielt Dateien von deiner Platte.
neko-had-covers = Cover-Betrachter und Cover-Flow
    .now = Ein Cover-Panel und ein Album-Karussell, das seine Nachbarn zu den Rändern hin verkleinert und abdunkelt.
neko-had-lyrics = Echtzeit-synchrone Songtexte
    .now = LRC-Dateien, auf dem Abspielkopf hervorgehoben, Klick auf eine Zeile springt dorthin, geholt von lrclib.
neko-had-viz = Visualisierung und Amplituden-Fortschrittsleiste
    .now = Eine Wellenform über den ganzen Titel, an der du ziehen kannst, ein FFT-Spektrum, ein VU-Meter.
neko-had-discord = Discord Rich Presence
    .now = Laufender Titel, Wiedergabestatus und verstrichene Zeit über Discord-IPC.
neko-had-bio = Biografie-Abruf in Echtzeit
    .now = Künstlerbiografie mit Fanart, Tags, Hörerzahlen und ähnlichen Künstlern.
neko-had-lastfm = Last.fm-Anbindung
    .now = Scrobbling, laufender Titel, Herzen als Loves gespiegelt, und ein Import der geliebten Titel.

neko-closer = Nimm stattdessen rox
    .body = Frei, quelloffen, eine Binärdatei pro Plattform. Die [Seite mit den Arbeitsflächen](/workspaces) zeigt die { workspace-count } mitgelieferten Looks, und der [foobar2000-Vergleich](/foobar2000-alternative) deckt ab, wo foobar2000 weiter vorne liegt.

## ReplayGain

rg-title = ReplayGain erklärt, und was es kostet, es anzuschalten
    .description = Was ReplayGain wirklich tut, Titel-Gain gegen Album-Gain, warum der Spitzenwert zählt, wie man mit Dateien umgeht, die nie jemand gemessen hat, und warum ReplayGain und bitgenaue Wiedergabe einander ausschließen.

rg-h1 = ReplayGain, und was es dich kostet
    .lede = Warum ein Album doppelt so laut ist wie das nächste, was die Lösung wirklich mit deinem Audiomaterial macht, und warum du es und bitgenaue Wiedergabe nicht gleichzeitig haben kannst.

rg-problem = Das Problem, das es löst
    .p1 = Platten werden nicht auf eine gemeinsame Lautheit gemastert. Eine CD von 1985 und ein Remaster desselben Albums von 2005 können sich um zehn Dezibel oder mehr unterscheiden, und das ist der Unterschied zwischen angenehm und zum Lautstärkeregler greifen. Wirf eine Sammlung über vier Jahrzehnte in den Zufallsmodus, und du stellst bei jedem dritten Titel die Lautstärke nach.
    .p2 = ReplayGain behebt das, ohne dein Audiomaterial anzufassen. Ein Analysedurchlauf misst, wie weit ein Titel von einer Referenzlautheit entfernt liegt, und schreibt diese Zahl in Dezibel in die Tags der Datei. Bei der Wiedergabe liest der Player die Zahl und wendet sie an. Nichts wird neu kodiert und nichts wird zerstört, denn die Korrektur lebt in einem Tag und das Audiomaterial darunter ist das, das du hattest.

rg-modes = Titel-Gain und Album-Gain
    .p1 = Jede gemessene Datei trägt zwei Zahlen, und zwischen ihnen zu wählen ist die eine Einstellung, die wirklich verändert, wie sich Hören anfühlt.
    .track = **Titel-Gain** pegelt jeden Titel für sich. Jedes Stück kommt mit derselben Lautheit an, und genau das willst du im Zufallsmodus. Es ebnet auch Alben ein, die absichtlich mit Dynamik gebaut wurden: das leise Zwischenspiel vor dem lauten Schlussstück wird auf dessen Höhe gezogen, und der Effekt, den die Produktion wollte, ist weg.
    .album = **Album-Gain** wendet eine Zahl auf jeden Titel der Platte an, berechnet aus dem Album als Ganzem. Die relativen Unterschiede innerhalb des Albums überleben genau so, wie sie gemastert wurden, und das Album als Einheit liegt auf Höhe anderer Alben. Das ist die richtige Vorgabe, wenn du Platten von vorne bis hinten hörst.
    .setting = rox nimmt das als Einstellung und wendet die gewählte Zahl beim Öffnen pro Titel an, es bleibt also deine Entscheidung und nichts, was in die Dateien eingebrannt wird.

rg-peak = Der Spitzenwert, und warum eine Anhebung übersteuern kann
    .p1 = Neben dem Gain hält ein Messdurchlauf das lauteste Sample im Titel fest. Diese Zahl zählt, weil ReplayGain-Korrekturen in beide Richtungen gehen: eine leise Aufnahme bekommt einen positiven Gain, und Samples, die ohnehin fast Vollausschlag erreichen, mit ihm zu multiplizieren schiebt sie darüber hinaus. Jenseits von Vollausschlag ist kein Platz mehr, die Wellenform wird also flach und du hörst Verzerrung, die nicht in der Datei war.
    .p2 = Der Spitzenwert verhindert das. rox begrenzt eine Anhebung anhand des Spitzenwerts, den das Tag meldet, ein leiser Titel wird also nur so weit angehoben, wie es ohne Übersteuern geht. Das Ergebnis ist, dass manche leisen Titel etwas unter der Ziellautheit landen, und das ist der richtige Tausch und der Grund, aus dem Spitzenwerte überhaupt gespeichert werden.

rg-unmeasured = Die Dateien, die nie jemand gemessen hat
    .p1 = ReplayGain funktioniert nur bei Dateien, die die Tags tragen, und in einer über zwanzig Jahre gewachsenen Sammlung wird ein großer Teil das nicht tun. Historisch hieß das, einen separaten Tagger über alles laufen zu lassen, bevor dein Player zu etwas zu gebrauchen war.
    .p2 = rox liest die Tags, wo es sie gibt, unter den Standardnamen in jedem Format, das es indiziert: TXXX-Frames in ID3v2, Vorbis-Kommentare in FLAC, Freiform-Atome in MP4. Für alles andere misst es die Dateien selbst mit einem EBU-R128-Lautheitsdurchlauf und legt das Ergebnis in der Bibliothek ab, als gemessen markiert, damit ein späteres erneutes Einlesen rox' eigene Zahlen von dem unterscheiden kann, was ein Tagger geschrieben hat. Wenn die Zahlen lieber in den Dateien stehen sollen, schreibt eine Einstellung sie über denselben geprüften Schreibweg zurück, den auch der Tag-Editor benutzt.
    .p3 = Dieser Durchlauf kann sich selbst starten. Bei eingeschaltetem automatischem Messen werden Dateien gemessen, sobald sich die Ordnerüberwachung nach einem Import beruhigt hat, und ein Titel, der in ein bereits gemessenes Album fällt, schickt die ganze Platte zurück zur Neumessung, denn Album-Gain ist eine Zahl über die Platte und nicht über die Datei.

rg-skip = Der Teil, den die meisten Seiten überspringen
    .p1 = ReplayGain multipliziert deine Samples mit einer Zahl. Das ist Verarbeitung. Es ist nicht verlustfrei, es ist keine Durchleitung, und jeder Player, der ReplayGain und bitgenaue Ausgabe gleichzeitig behauptet, beschreibt etwas, das es nicht geben kann.
    .p2 = Das zählt, wenn du einen sorgfältig ausgewählten DAC besitzt. Bitgenau heißt, dass die Samples, die den Wandler erreichen, die Samples in der Datei sind, unverändert. Alles, was sie skaliert, eine Lautstärke unter 100 %, ein Equalizer, ReplayGain, macht das zunichte. Es gibt keine Version von Lautheitsangleichung, die die Bits in Ruhe lässt, denn die Lautheit zu ändern heißt, die Bits zu ändern.
    .choice = Welches von beiden du willst, ist eine echte Wahl und keine Fangfrage. Bitgenau zählt beim kritischen Hören eines Albums auf guter Hardware. ReplayGain zählt in jeder anderen Stunde, wenn die Sammlung im Zufallsmodus läuft und du den Regler lieber nicht anfassen würdest. Die meisten Leute sollten ReplayGain laufen lassen und sich keine Gedanken machen. Worauf es ankommt, ist zu wissen, welches von beiden gerade an ist.

rg-bitperfect = Was bitgenau in rox heißt
    .body = Drei Bedingungen, aufgezählt statt ausgeschmückt: die Verarbeitungskette leer oder abgeschaltet, Lautstärke auf 100 %, und das Gerät läuft mit der eigenen Abtastrate der Quelldatei. Erfülle alle drei, und der Wandler bekommt bitidentische Samples. Verfehle eine davon, und er bekommt sie nicht, und rox sagt das, statt ein Gütesiegel zu zeigen. ReplayGain an heißt Verarbeitung an, und es wird als Verarbeitung an angezeigt.

rg-exclusive = Exklusive Ausgabe, getrennt betrachtet
    .p1 = Bitgenau braucht außerdem das Betriebssystem aus dem Weg, und genau dafür gibt es einen exklusiven Ausgabemodus. rox nimmt das Gerät direkt: den ALSA-Namen `hw:` unter Linux, ohne dmix, ohne plug und ohne Soundserver im Weg; WASAPI exclusive unter Windows; Hog-Modus über CoreAudio unter macOS. Es folgt der Abtastrate der Quelle, wo das Gerät es zulässt, und meldet, worauf die Hardware sich wirklich eingelassen hat, statt was verlangt wurde.
    .p2 = Der Tausch ist das, was exklusiv überall heißt: solange rox das Gerät hält, spielt nichts anderes auf der Maschine darüber. Lässt sich das Gerät nicht übernehmen, fällt rox mit sichtbarem Zustand auf den geteilten Modus zurück, statt still zu werden und dich rätseln zu lassen.

rg-limits = Was nicht abgedeckt ist
    .aside = Die Liste der Player, die dir sagen, welches von bitgenau und ReplayGain gerade gilt, und die Dateien messen, zu denen deine Tagger nie gekommen sind, ist kurz. Wenn du diese Art Ehrlichkeit von dem Ding zwischen deiner Sammlung und deinem DAC willst, steht rox darauf.

rg-limit-opus = Opus-Dateien tragen ihr eigenes `R128_TRACK_GAIN`-Schema mit einer anderen Referenz. rox rechnet es nicht um, denn `.opus` steht nicht in den Endungen des Scanners.
rg-limit-itunes = iTunes' `iTunNORM` ist außen vor. Nichts sonst schreibt es, und seine Werte pro Kanal sind kein Dezibel-Gain.
rg-limit-rate-switch = Der Abtastrate der Quelle im exklusiven Modus zu folgen kostet eine hörbare Lücke zwischen zwei Titeln unterschiedlicher Abtastrate, weil der Stream neu geöffnet wird. Lückenlos innerhalb einer Rate ist davon nicht betroffen.

rg-closer = Zeig ihm deine Sammlung
    .body = Der Messdurchlauf läuft im Hintergrund über alles, dem ein Gain fehlt, und läuft auch mit geschlossenem Einstellungsfenster weiter. Mehr dazu, [was sonst noch bei großen Sammlungen zählt](/best-music-player).
