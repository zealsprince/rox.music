# rox.music, español.
#
# Reflejo de en-CA. Lo que falte aquí cae en silencio al inglés en tiempo de
# ejecución, así que scripts/check-locales.ts es el sitio donde se notan los
# huecos y no la propia página.
#
# Los nombres de producto se quedan como están: rox, Foobar2000, CaTRoX,
# NekoRoX, MusicBee, Mp3tag, ReplayGain, gpui. Se traduce lo que alguien lee,
# no lo que alguien pulsa o escribe.
#
# Los sustantivos del núcleo salen de la propia aplicación
# (crates/rox-i18n/locales/es) y no se inventan aquí: espacio de trabajo,
# disposición, paleta, apariencia, panel, barra de posición. Quien lea la web
# sobre un espacio de trabajo tiene que reencontrar esa palabra en los ajustes.
#
# Español neutro, seguro en toda Latinoamérica: teléfono y no móvil, memoria
# USB y no pendrive. El pretérito perfecto compuesto tira a peninsular y se
# queda como está, porque reescribirlo entero costaría más de lo que arregla.
#
# Las comillas son rectas ("…"), como en la aplicación. Los números ya están
# localizados (50.000, 0,3 segundos); que siga siendo así.

## Estructura

skip-to-content = Saltar al contenido

nav-home = Inicio de rox
nav-main = Principal
nav-download = Descargar
nav-workspaces = Espacios de trabajo
nav-more = Más
nav-github = rox en GitHub
    .stars = rox en GitHub, { $stars } estrellas

language-picker = Idioma
language-missing = ¿No encuentras tu idioma?
theme-toggle = Cambiar el tema
    .label = Cambiar entre el tema claro y el oscuro

footer-credit = rox lo construye [Andrew Lake (zealsprince)](@author) en Rust sobre [gpui](@gpui), el framework de interfaz que hay detrás de [Zed](@zed). Libre y de código abierto bajo la [AGPL-3.0](@license).
footer-nav = Pie de página
footer-source = Código
footer-irc = IRC
footer-irc-direct = Directo
footer-irc-web = Chat web
footer-bug = Informar de un fallo
footer-translate = Ayuda a traducir

## La propia web

# El título que ve el buscador, no la frase que lee una persona. Apunta a
# "foobar2000 alternative", la única consulta que rox puede ganar de verdad. En
# inglés son 59 caracteres, para que Google lo muestre entero; aquí rige el
# mismo presupuesto, y dejar caer el nombre de una plataforma es la forma más
# barata de hacer sitio.
site-tagline = rox - alternativa a Foobar2000 para Linux, macOS y Windows

# Por debajo de 160 caracteres, o Google corta a media frase.
site-description = Reproductor de música nativo para bibliotecas locales grandes y bien etiquetadas. Compón tus paneles, comparte temas como archivos, rápido con 50.000 pistas.

# Las cuatro tarjetas sociales de static/social/ son una sola imagen para todos
# los idiomas, y la frase va escrita en inglés dentro del dibujo. El texto
# alternativo tiene que decir lo que ahí pone de verdad, y que está en inglés.
# Lo mismo vale para download-title, workspaces-title y viz-title.
social-image-alt = El logo de rox sobre la frase en inglés: if Foobar2000 was made in the current year

# El número de espacios de trabajo incluidos, escrito con letra. Una cifra en
# mitad de una frase suena a ficha técnica, y qué números se escriben con letra
# se decide idioma por idioma, así que se decide aquí. Toda frase que menciona
# la cuenta dice { workspace-count } y le pasa $count.
workspace-count = { $count ->
    [1] un
    [2] dos
    [3] tres
    [4] cuatro
    [5] cinco
    [6] seis
    [7] siete
    [8] ocho
    [9] nueve
   *[other] { $count }
}

## Afirmaciones del grafo de datos estructurados

app-feature-panels = Interfaz de paneles componible con ventanas independientes
app-feature-workspaces = Espacios de trabajo compartibles con disposición, paleta y apariencia
app-feature-tagging = Edición profunda de etiquetas con escrituras atómicas y por lotes
app-feature-gapless = Reproducción sin huecos
app-feature-dsp = Ecualizador, fundido encadenado y ReplayGain
app-feature-exclusive = Salida exclusiva bit a bit
app-feature-lyrics = Letras sincronizadas
app-feature-scrobbling = Scrobbling a Last.fm

## Inicio

home-hero = La forma de Foobar2000, sin veinte años a cuestas.
    .lede = Un reproductor de escritorio para quien tiene la biblioteca en su disco, grande y bien etiquetada. Los paneles los montas tú. Un tema es un archivo, y ese archivo se lo puedes pasar a otra persona. Nativo en Linux, macOS y Windows.
    .alt = rox con el espacio de trabajo predeterminado al estilo NekoRoX, mostrando la biblioteca, la carátula, la cola y un panel de espectro

home-speed = Menos de un segundo hasta la ventana
    .body = rox se distribuye como un único binario y arranca antes de que hayas soltado el ratón.

home-features = Qué lleva dentro

home-closer = Hazlo tuyo
    .body = De serie vienen { workspace-count } espacios de trabajo, a un clic en la ventana de bienvenida. Cada uno cabe en un archivo: la disposición, la paleta y los shaders que usa. Edítalo, rómpelo, pásaselo a alguien. [Míralos todos](/workspaces).

## La tabla de benchmarks

benchmark-caption = Arranque, memoria y CPU en reposo de siete reproductores de música sobre una biblioteca de 50.000 pistas
benchmark-player = Reproductor
benchmark-window-up = Ventana abierta
benchmark-loaded = Carga completa
benchmark-memory = Memoria
benchmark-idle-cpu = CPU en reposo
benchmark-never-settles = nunca se estabiliza

benchmark-method = Todo esto lo medí yo en una sola máquina (Ryzen 9 5950X, Linux/Wayland). Misma biblioteca de 50.000 pistas en un SSD externo, mismo montaje para cada reproductor, y la biblioteca cargada en todos. La memoria es PSS de todo el árbol de procesos. "Cargado" es cuando la CPU se estabiliza tras el arranque; en reposo es un reproductor en pausa con la ventana visible.
    .deadbeef = [DeaDBeeF](@deadbeef) se habría quedado en 44 MB y habría ganado en memoria, pero no llegó a tener fila: su analizador de MP3 revienta a medio importar esta biblioteca, en todos los intentos. rox indexa las 50.000 pistas, y también los archivos truncados con los que tropieza.

## La rejilla de funciones

features-library = Biblioteca
features-playback = Reproducción
features-looks = Aspecto
features-daily = Día a día

feature-library = Una biblioteca que aguanta
    .body = Un escáner paralelo no se conforma con echar un vistazo a la cabecera: lee las etiquetas completas, las duraciones reales y el códec propio de cada archivo. La vigilancia de carpetas sobrevive a los renombrados, y nada desaparece en silencio.
    .link = Qué se rompe con 50.000 pistas

feature-tagging = Etiquetado del que te puedes fiar
    .body = Un editor completo con escrituras atómicas y edición por lotes. Las valoraciones van en los propios archivos vía FMPS y POPM. Consultas a MusicBrainz, iTunes y Deezer.
    .link = Frente a Mp3tag

feature-cue = Los rips con cue suenan como pistas
    .body = Un FLAC de disco entero junto a su cue sheet se indexa como filas de verdad. Cada tramo se puede recorrer, se scrobblea, se ordena y entra en el siguiente sin huecos, igual que un archivo.
    .link = Cómo funcionan los tramos

feature-gapless = Reproducción sin huecos
    .body = Un solo flujo, con aleatorio, repetición y reproducir a continuación. Se recupera cuando desaparece un dispositivo de audio, y las teclas multimedia y el "sonando ahora" funcionan en las tres plataformas.

feature-equalizer = Diez bandas y bit a bit
    .body = Un ecualizador en su propia ventana, un fundido encadenado que deja en paz los empalmes de un álbum, y salida exclusiva que dice a qué accedió el hardware.
    .link = ReplayGain y bit a bit

feature-similarity = Ordenado por cómo suena
    .body = rox describe tus pistas a partir de su propio audio, tempo incluido, y ordena lo que viene por parecido. Todo se ejecuta en tu máquina y sobre tus archivos, sin ningún servicio de por medio.

feature-panels = Paneles que compones tú
    .body = Unos cuarenta tipos de panel, de la biblioteca y la cola a cuadrículas de artistas, espectro y VU. Duplica uno con su configuración, guárdalo como preajuste, o sácalo a una ventana.
    .link = Frente a Foobar2000

feature-themes = Temas como archivos que se comparten
    .body = Un espacio de trabajo es un archivo con la disposición, la paleta, la apariencia y los shaders. Las paletas pueden teñirse con la carátula que suena, y aclararse u oscurecerse con la imagen.
    .link = Los { workspace-count } de serie

feature-shaders = Visuales que escuchan
    .body = Escribe un shader WGSL sobre un panel o sobre toda la ventana. Sus entradas las alimentan señales con nombre sacadas del espectro, así que una banda de bombo mueve el mando que tú le señales.
    .link = Shaders y señales

feature-lyrics = Letras e historial
    .body = Sincronizadas o planas, desde archivos adjuntos, etiquetas o lrclib, con un editor que reescribe donde leyó. Un registro de escuchas alimenta el panel de historial, las estadísticas y el scrobbling.

feature-playlists = Listas que sobreviven
    .body = Favoritos, reordenar arrastrando, m3u de entrada y de salida, y listas inteligentes que vuelven a ejecutar una consulta guardada en vez de guardar una foto fija. Las entradas sobreviven a que un archivo se vaya y vuelva.

feature-binary = Un binario, sin instalador
    .body = Un tarball, un DMG o un zip, además del AUR y un flake de Nix. El modo portátil guarda la biblioteca y los ajustes en una carpeta junto al ejecutable.
    .link = Consíguelo

## El botón de descarga, allá donde aparezca

download-cta = Descargar rox
# En %s pone enhance.js el nombre de la plataforma que detectó. Se queda: el
# script no sabe de idiomas y solo sabe sustituir, así que el orden de las
# palabras tiene que estar bien aquí.
download-cta-detected = Descargar para %s
download-packaged = ¿En Arch o NixOS? [Instálalo desde el AUR o el flake de Nix](/download#packages) en su lugar.
download-meta = v{ $version } · Linux, macOS, Windows · [todas las descargas](@releases)

## Descargar

download-title = Descargar rox para Linux, macOS o Windows
    .description = Descarga rox gratis para Linux, macOS o Windows. Una descarga por plataforma, sin cuenta. Código abierto bajo la AGPL.
    .image-alt = El logo de rox sobre la frase en inglés: download for Linux, macOS and Windows

download-h1 = Descargar rox
    .lede = Una descarga por plataforma. Sin cuenta, y nada ejecutándose en segundo plano cuando está cerrado.

download-released = publicado el { $date }
download-notes = notas de la versión
download-missing = Esta versión no trae compilación para { $platform }. [Mira en la página de publicaciones](@releases).

install-linux-1 = Descomprime el tarball donde quieras.
install-linux-2 = Ejecuta `./rox`.
install-macos-1 = Abre el DMG.
install-macos-2 = Arrastra rox a Aplicaciones.
install-windows-1 = Descomprime donde quieras.
install-windows-2 = Ejecuta `rox.exe`.
install-windows-caveat = Si SmartScreen protesta, elige Más información y luego Ejecutar de todas formas.

download-alt-linux = En Debian, Ubuntu o Mint también hay un paquete:
download-alt-windows = ¿Prefieres un instalador guiado? Aquí está:

download-packages = Gestores de paquetes
    .body = Dos vías para que rox se mantenga al día junto con el resto de tu sistema.

package-aur =
    .scope = AUR, compila desde el código
    .body = En el AUR como `rox-player`, comantenido por el autor de rox. Sirve cualquier ayudante del AUR, o clona el paquete y ejecuta `makepkg -si` tú mismo.
    .link = rox-player en el AUR

package-nix =
    .scope = directo desde el flake
    .body = El repositorio es un flake. El primer comando ejecuta rox sin instalar nada, el segundo lo deja en tu perfil. En NixOS, añade el flake como entrada y trae `packages.default`, o usa el overlay que exporta.
    .link = flake.nix

download-cli = Ejecutarlo desde una terminal
    .body = Pásale a rox archivos o carpetas y los reproduce al momento, reemplazando lo que estuviera cargado. Las carpetas se expanden a los archivos de audio que hay dentro.
    .flags = `--enqueue` (o `-e`) añade a la cola en vez de reproducir. `--portable` guarda la biblioteca, los ajustes y las cachés en una carpeta `rox-data` junto al ejecutable durante esa ejecución. Para que siga siendo portátil entre arranques, deja un archivo vacío llamado `portable` junto al ejecutable, o activa el interruptor en los ajustes de Comportamiento.

download-build = Compilarlo tú mismo
    .body = Con Nix, `nix develop` y luego `cargo run` te da un entorno de desarrollo con la toolchain de Rust y las bibliotecas que gpui carga en tiempo de ejecución. Sin Nix necesitas Rust estable y las bibliotecas de sistema de gpui desde tu distribución. La [sección de desarrollo del README](@readme-dev) tiene la lista completa.

## Espacios de trabajo

workspaces-title = Espacios de trabajo de rox - temas y disposiciones que se comparten
    .description = Un espacio de trabajo de rox es un aspecto entero en un archivo que se comparte: disposición, paleta, apariencia y los shaders que usa. Van desde un homenaje a Foobar2000 hasta un reproductor renderizado por completo en tramado de 1 bit.
    .image-alt = El logo de rox sobre la frase en inglés: a whole look in one shareable file

workspaces-lede = Un espacio de trabajo es un aspecto entero en un archivo: disposición, paleta, apariencia y todos los shaders que usa, incrustados para que un aspecto importado llegue completo. Carga uno desde la ventana de bienvenida o desde los ajustes, cambia lo que quieras, y pásale el archivo a otra persona para que reciba exactamente lo mismo. Estos { workspace-count } vienen de serie.

workspaces-critters = Cómo lo hace Critters
    .body = Un espacio de trabajo lleva sus shaders incrustados, código e imágenes por igual, así que un aspecto que renderiza la aplicación entera como una impresión de 1 bit se importa completo en vez de llegar como una referencia a un archivo de la máquina de otro. Nada se ejecuta hasta que lo apruebas. [Shaders y señales](/music-visualizer).

workspace-default = Cómo se ve rox recién instalado: superficies translúcidas, tinte de carátula desactivado.
    .alt = El espacio de trabajo Default de rox: una cuadrícula de carátulas junto a una lista con valoraciones por estrellas, una barra de posición con forma de onda ámbar abajo y pestañas de biografía, letras y metadatos.

workspace-foobar = La disposición con la que discute todo este proyecto. Opaca, densa, decoraciones del sistema activadas, barra de menús donde estuvo siempre.
    .alt = El espacio de trabajo Foobar de rox: una disposición clásica de foobar2000 con barra de menús, columnas de filtro de artista y álbum, una tabla de pistas densa con contadores de reproducción y valoraciones, y la carátula abajo a la izquierda.

workspace-catrox = La skin CaTRoX de foobar2000 que conoces y adoras, la que empezó todo.
    .alt = El espacio de trabajo CaTRoX de rox: la skin de foobar2000 recreada, con una representación circular de la carátula como CD, una lista de campos de metadatos a la izquierda y pistas agrupadas por álbum con puntos de valoración.

workspace-llama = WinAmp, tal como lo recuerdas y no tal como era. Tahoma, oscuro, sin marco.
    .alt = El espacio de trabajo Llama de rox: un analizador de espectro punteado al estilo Winamp arriba, controles de transporte verdes y debajo una lista de pistas densa, sin marco de ventana.

workspace-metro = Paneles planos y filas holgadas con el tinte de carátula activado, así la paleta sigue a la carátula que esté sonando.
    .alt = El espacio de trabajo Metro de rox: una cuadrícula de carátulas a todo lo ancho con los títulos debajo, y a la derecha un panel de biografía del artista con foto, etiquetas de género y número de oyentes.

workspace-phosphor = Todo monoespaciado. Consolas, sin carátula en la reproducción rápida, un terminal que resulta que reproduce música.
    .alt = El espacio de trabajo Phosphor de rox: verde sobre negro en monoespaciada de principio a fin, un árbol de carpetas junto a una tabla de pistas y una forma de onda verde abajo, como un terminal que reproduce música.

workspace-critters = La aplicación entera como una impresión de 1 bit. Un tramado ordenado sobre cada superficie, tonos que se aplastan con los subgraves, y un muro de ruido detrás de los paneles que se mueve con la canción.
    .alt = El espacio de trabajo Critters de rox: la ventana entera renderizada en tramado ordenado en blanco y negro, con un estante curvo de carátulas sobre una barra de posición, una fila de transporte, una tira de forma de onda y una tabla de pistas, todo sobre un campo de ruido en movimiento.

workspace-diffuse = Solo el álbum que suena, sobre un baño suave de su propia carátula. Monocromo a propósito, para que el color lo ponga la imagen, y la biblioteca espera en un cajón del borde derecho.
    .alt = El espacio de trabajo Diffuse de rox: una carátula grande llenando la parte izquierda de la ventana sobre un degradado desenfocado de la misma imagen, con el título, el artista y el álbum al lado sobre una línea de posición fina, una fila de botones de transporte y un deslizador de volumen.

## Más

more-title = Más sobre rox
    .description = Las páginas que quedan fuera de la navegación principal: la comparación con Foobar2000, qué buscar en un reproductor para una biblioteca local, y cómo funciona rox en Linux, macOS y Windows.

more-lede = Las páginas que no pintan nada en la navegación, guardadas en algún sitio localizable en vez de borradas.

more-why = Por qué están aquí
    .p1 = Estas existen para que las encuentren. Quien busque una alternativa a Foobar2000 en Linux en { $year }, o esté averiguando qué reproductor sobrevive a una biblioteca de este tamaño, debería aterrizar en algo que le responda y no en una portada escrita para quien ya sabe qué es rox.
    .p2 = Están fuera de la navegación a propósito. La web principal son tres páginas: qué es rox, cómo conseguirlo, cómo se ve. Amontonar el resto en la cabecera haría más difícil encontrar aquello a lo que viniste, y ese es un mal trato para todo el que llegó sabiendo ya lo que buscaba.
    .p3 = Puede que ya sepas todo esto sobre rox y Foobar2000. Mucha gente que aterriza aquí no, y para esa gente son estas páginas. Cada una dice dónde pierde rox además de dónde gana, y no repite nada de lo que hay en la [portada](/).

more-pages = Las páginas
more-closer = Si prefieres saltártelo todo, la [página de descarga](/download) está a dos clics de un reproductor funcionando, y el [código](@repo) es la documentación más honesta que hay aquí.

## Las páginas fuera de la navegación, tal como las listan el índice y el sitemap

page-foobar2000-alternative = La alternativa a Foobar2000
    .blurb = Qué hizo bien Foobar2000, dónde te deja tirado y qué hace rox al respecto. Incluye dónde Foobar2000 sigue por delante.

page-catrox = CaTRoX, reconstruido nativo
    .blurb = El tema de foobar2000 con el que empezó esto, quién lo hizo, y qué hizo falta para que ese aspecto funcione sin Windows debajo.

page-nekorox = NekoRoX, y adónde fue a parar
    .blurb = El fork de CaTRoX que mantuve durante una década, por qué se paró, y cuáles de sus paneles existen hoy en rox. Incluye AlphaRoX, el claro.

page-music-visualizer = El visualizador, y la capa que hay debajo
    .blurb = Paneles de espectro y forma de onda, shaders WGSL sobre cualquier panel o sobre toda la ventana, y las señales con nombre sacadas del audio que los mueven.

page-cue-sheets = Rips en FLAC y CUE
    .blurb = Una imagen de disco entero y su sheet, indexadas como pistas de verdad que se recorren, se ordenan, se scrobblean y entran una en otra sin huecos.

page-mp3tag-alternative = Una alternativa a Mp3tag para Linux
    .blurb = Edición por lotes, una rejilla por archivo, y una ruta de escritura que copia, verifica y renombra en vez de editar tus archivos en el sitio.

page-musicbee-alternative = Una alternativa a MusicBee
    .blurb = Qué hace MusicBee que rox no hace, qué hace rox que MusicBee no puede, y por qué la respuesta honesta depende de tu sistema operativo.

page-replaygain = ReplayGain, y lo que cuesta
    .blurb = Qué hace ReplayGain en realidad, ganancia de pista frente a ganancia de álbum, medir los archivos que nadie etiquetó, y por qué activarlo significa renunciar al bit a bit.

page-best-music-player = El mejor reproductor de música para una biblioteca local
    .blurb = Qué separa de verdad a los reproductores cuando tu biblioteca es real, y cómo queda el campo con una colección de 50.000 pistas.

page-linux = rox en Linux
    .blurb = AUR y Nix, Wayland y X11, salida exclusiva por ALSA, teclas multimedia por MPRIS, y la tabla de benchmarks donde solo hay reproductores de Linux.

page-windows = rox en Windows
    .blurb = Un zip sin instalador, modo portátil, salida exclusiva por WASAPI, y una lectura honesta de lo que es competir con Foobar2000 en su propia casa.

page-macos = rox en macOS
    .blurb = Apple Silicon, firmado y notarizado, menús en la barra del sistema, salida exclusiva por CoreAudio.

## No encontrado

notfound-title = Página no encontrada
    .description = Esa página no existe en rox.music.
notfound-h1 = Nada por aquí
notfound-nav = Volver al camino

## Las tres páginas de plataforma, marco común

platform-breadcrumb = rox en { $platform }
platform-limits = Qué no puede hacer en { $platform }
platform-closer = Apúntalo a tu biblioteca
    .body = Libre y de código abierto bajo la AGPL. Sin cuenta, y nada ejecutándose en segundo plano cuando está cerrado.
platform-more = Más sobre [cómo se ve](/workspaces), la [comparación completa con Foobar2000](/foobar2000-alternative), o qué está haciendo en realidad la salida exclusiva de arriba, en [ReplayGain y bit a bit](/replaygain).

## Linux

linux = rox - un reproductor de música nativo para Linux
    .description = Un reproductor de música nativo de Linux para bibliotecas locales grandes. En el AUR y como flake de Nix, Wayland y X11, salida exclusiva por ALSA, teclas multimedia por MPRIS, y menos de un segundo hasta la ventana con 50.000 pistas.
    .h1 = Un reproductor de música para Linux hecho para Linux
    .lede = No es un port, ni un envoltorio de Electron, ni Foobar2000 bajo Wine. Un binario nativo que trata Linux como objetivo de primera y no como el tercero.
    .aside = Salida exclusiva que informa de a qué accedió la tarjeta de sonido en vez de lo que le pediste, y un aspecto que puedes construir aquí y pasarle a alguien con Windows. Si eso es lo que echabas de menos en Linux, pues aquí está.
    .siblings = El mismo reproductor en [Windows](/windows) y [macOS](/macos).

linux-why = El problema para el que se escribió
linux-why-1 = Los buenos reproductores de Linux renuncian a algo cada uno. El etiquetado de Tauon es superficial. Strawberry no es componible. A Quod Libet no hay quien le ponga un tema. El conjunto que hace paneles, etiquetado profundo y una historia de temas al mismo tiempo lleva veinte años atrapado en Windows.
linux-why-2 = Pasar ese conjunto por Wine funciona hasta que deja de funcionar. Una skin como CaTRoX se sostiene con apaños apilados y, en algunos sitios, con Internet Explorer renderizando dentro de los paneles. A través de una capa de traducción se hace evidente cuánto de aquello es suerte, y cada actualización del sistema es una oportunidad de comprobarlo.
linux-why-3 = rox es esa forma escrita de forma nativa: unos cuarenta tipos de panel que colocas tú, edición de etiquetas en la que puedes confiar con una colección de verdad, y temas que viajan como un solo archivo.

linux-install = Instalarlo
linux-install-1 = En Arch está en el AUR como `rox-player`, comantenido por el autor. Sirve cualquier ayudante, o clona y ejecuta `makepkg -si` tú mismo.
linux-install-2 = El repositorio también es un flake, así que Nix y NixOS lo tienen sin pasar por un paquete. El primer comando ejecuta rox sin instalar nada, el segundo lo deja en tu perfil.
linux-install-3 = En cualquier otro sitio, descomprime el tarball y ejecuta `./rox`. Un binario, sin instalador, y nada que se quede atrás cuando lo borres.

linux-display = Wayland y X11
linux-display-1 = Los dos, de forma nativa, a través de gpui. Las decoraciones de ventana son un ajuste por espacio de trabajo y no una decisión de compilación, así que puedes usar decoraciones del servidor en una disposición y otra sin bordes en la siguiente sin reiniciar en una compilación distinta.

linux-alsa = Salida exclusiva a través de ALSA
linux-alsa-1 = El modo exclusivo abre la tarjeta de sonido directamente como `hw:CARD=x,DEV=n`. Ese es el único nombre de ALSA sin dmix, sin plug y sin ningún servidor de sonido por el camino. Por eso es también la única vía que rechaza una frecuencia que no puede dar, en lugar de remuestrear a otra cosa sin avisar.
linux-alsa-2 = El trato es el honesto: mientras rox tiene la tarjeta en modo exclusivo, la tiene. Nada más del sistema suena por ese dispositivo hasta que pares. rox te dice a qué accedió el hardware en realidad y no lo que pediste, así que un desajuste aparece como un número en vez de como una sospecha.
linux-alsa-3 = El modo compartido es el predeterminado y se comporta como cualquier otra aplicación de tu escritorio.

linux-desktop = Integración con el escritorio
linux-desktop-1 = Las teclas multimedia y el "sonando ahora" llegan por un servicio MPRIS de verdad, así que playerctl, los widgets multimedia de GNOME y KDE, y cualquier otra cosa que hable `org.mpris.MediaPlayer2` lo ven sin configurar nada.
linux-desktop-2 = El icono de la bandeja entra en el bus por StatusNotifierItem, que es lo que hace seguro el salir a la bandeja: si no hay ningún host SNI escuchando, cerrar la última ventana cierra el programa en vez de dejar colgado un proceso sin interfaz al que no puedes volver.

linux-benchmarks = Los benchmarks son todos de reproductores de Linux
linux-benchmarks-1 = La tabla comparativa de esta web se hizo en Linux contra software de Linux: Elisa, fooyin, Quod Libet, Strawberry, Museeks y Tauon, todos en una máquina con la misma biblioteca de 50.000 pistas. rox abre la ventana en 0,3 segundos y se estabiliza en 134 MB. El siguiente más ligero que llega a cargar del todo usa casi el triple de memoria.

linux-limit-arch = Solo x86_64. No hay compilación de Linux para aarch64, así que las placas ARM y Asahi necesitan compilar desde el código.
linux-limit-plugins = Sin API de plugins, así que nada de esto sustituye a un componente concreto de Foobar2000 del que dependas.

## Windows

windows = rox - un reproductor de música para Windows sin instalador
    .description = Un reproductor de música nativo de Windows para bibliotecas locales grandes. Un zip sin instalador, modo portátil, salida exclusiva por WASAPI, edición profunda de etiquetas, y paneles que compones tú.
    .h1 = Un reproductor de música para Windows, de alguien que dejó Windows
    .lede = Windows es la casa de Foobar2000 y ahí es muy bueno. Esta página es honesta sobre eso, y sobre los motivos concretos por los que aun así podrías querer rox.
    .aside = Lo que montes aquí es un archivo, y se abre igual en la máquina con Linux o Mac que tienes al lado. Si alguna vez una configuración a la que le dedicaste un fin de semana se te quedó atrapada en un sistema operativo, esa es la parte que merece una tarde.
    .siblings = El mismo reproductor en [Linux](/linux) y [macOS](/macos).

windows-awkward = Empecemos por la parte incómoda
windows-awkward-1 = Si usas Windows, tienes Foobar2000 configurado a tu gusto y lleva años estable, rox no es una mejora. Foobar2000 tiene dos décadas de componentes, una huella menor y ninguna sorpresa pendiente. Fingir lo contrario en una página como esta sería una forma fácil de hacerte perder la tarde.
windows-awkward-2 = Los motivos para mirar de todas formas son estrechos y reales. Quieres el mismo reproductor y la misma disposición en la máquina con Linux o Mac que también usas. Quieres que el código se pueda leer y que la licencia sea la AGPL en vez de freeware cerrado. O quieres una historia de temas donde un aspecto entero es un archivo que le puedes mandar a alguien, en lugar de una carpeta de componentes, configuraciones y scripts que solo se vuelve a montar en tu máquina.

windows-install = Instalarlo
windows-install-1 = Descomprime donde quieras y ejecuta `rox.exe`. No hay instalador, ni servicio, ni entrada de desinstalación, ni nada ejecutándose en segundo plano una vez cerrado.
windows-install-2 = El modo portátil guarda la biblioteca, los ajustes y las cachés en una carpeta `rox-data` junto al ejecutable, así que todo cabe en una memoria USB. Pasa `--portable` para una ejecución, o deja un archivo vacío llamado `portable` junto al ejecutable para que sea permanente.
windows-install-3 = El binario no está firmado, así que SmartScreen protestará la primera vez. Más información, y luego Ejecutar de todas formas. Los certificados de firma cuestan un dinero que un reproductor gratuito no tiene, y decirlo es mejor que fingir que el aviso es un fallo.

windows-wasapi = Salida exclusiva a través de WASAPI
windows-wasapi-1 = El modo exclusivo toma el endpoint en WASAPI exclusivo, lo que pone la frecuencia y la profundidad de bits del propio archivo delante del conversor sin nada en medio. rox informa de lo que aceptó el dispositivo en realidad, así que si el hardware rechazó tus 192 kHz sin decir nada te enteras por una lectura y no por una discusión de foro.
windows-wasapi-2 = Mientras tiene el endpoint, nada más de la máquina suena por ese dispositivo. Eso es lo que significa exclusivo y es la razón de que no sea el modo predeterminado.

windows-integration = El resto de la integración con Windows
windows-integration-1 = Las teclas multimedia y el aviso de "sonando ahora" llegan por SMTC, la misma superficie del sistema que usan las aplicaciones integradas, así que el panel de las teclas de volumen muestra la pista y los botones de transporte funcionan.
windows-integration-2 = Hay un icono de bandeja con salida a la bandeja, así que cerrar la última ventana deja la música sonando en vez de terminarla, y el icono es la forma de volver. Un espacio de trabajo también puede quitar el marco de la ventana, o mantener el marco y quitar solo el borde de redimensión, lo que deja intactas la sombra, los diseños de anclaje y Win+flecha y renuncia únicamente al arrastre del borde.

windows-limit-instance = Sin control de instancia única. En Linux y macOS un segundo arranque le pasa sus archivos al rox que ya se está ejecutando; en Windows arranca una segunda copia.
windows-limit-signing = Solo x86_64, y el binario no está firmado, así que cuenta con SmartScreen una vez.
windows-limit-plugins = Sin API de plugins, así que un componente concreto de Foobar2000 no tiene equivalente aquí.

## macOS

macos = rox - un reproductor de música nativo para macOS
    .description = Un reproductor de música nativo de macOS para bibliotecas locales grandes. Apple Silicon, firmado y notarizado, menús en la barra del sistema, salida exclusiva por CoreAudio, y edición profunda de etiquetas.
    .h1 = Un reproductor de música nativo para macOS
    .lede = Foobar2000 ya tiene una compilación de Mac de verdad. Lo que no tiene en el Mac es el motivo por el que la gente lo configuraba en Windows.
    .aside = Menús donde macOS los pone, unos cuarenta tipos de panel para colocarlos como quieras, y { workspace-count } aspectos completos a un clic en la ventana de bienvenida. Si configurar el reproductor es la parte que de verdad disfrutas, eso es lo que hay aquí.
    .siblings = El mismo reproductor en [Linux](/linux) y [Windows](/windows).

macos-gap = En el Mac, el hueco es otro
macos-gap-1 = Foobar2000 v2 trae una versión oficial de macOS, y esta página no va a fingir que no. El problema es que el ecosistema de componentes y skins, lo que hacía que una instalación de Windows valiera un fin de semana de configuración, está del lado de Windows. En un Mac tienes el reproductor sin el ecosistema que justificaba elegirlo.
macos-gap-2 = rox devuelve la composición y los temas: unos cuarenta tipos de panel colocados como quieras, duplicados con sus propias configuraciones, sacados a ventanas de verdad, y un aspecto entero guardado como un solo archivo que se comparte. Uno de los { workspace-count } espacios de trabajo incluidos es una recreación de CaTRoX, que es una declaración justa de a qué apunta.

macos-install = Instalarlo
macos-install-1 = Abre el DMG y arrastra rox a Aplicaciones. Las publicaciones van firmadas con un Apple Developer ID y notarizadas, así que Gatekeeper lo deja abrir sin el baile del clic derecho ni un viaje al panel de seguridad.

macos-native = Se comporta como una aplicación de Mac
macos-native-1 = Los menús viven en la barra de menús del sistema, donde macOS espera encontrarlos, no en una barra dibujada dentro de la ventana. El botón verde hace pantalla completa nativa, y con Option te da zoom.
macos-native-2 = Cerrar la última ventana deja rox en el dock en vez de salir, que es la convención de la plataforma y la mitad macOS del comportamiento de salir a la bandeja.

macos-coreaudio = Salida exclusiva a través de CoreAudio
macos-coreaudio-1 = El modo exclusivo maneja el dispositivo por CoreAudio a la frecuencia del propio archivo, e informa de a qué accedió el hardware en vez de lo que se pidió. Útil sobre todo si tienes un DAC que merezca la molestia, y desactivado por defecto porque quitarle un dispositivo al resto del sistema debería ser una decisión que tomas a propósito.

macos-limit-silicon = Solo Apple Silicon. No hay compilación para Intel, así que un Mac con Intel necesita compilar desde el código.
macos-limit-xcode = Compilar desde el código necesita Xcode, con nix o sin él: gpui compila shaders de Metal al compilar y nix no puede distribuir la toolchain de Metal de Apple.
macos-limit-plugins = Sin API de plugins, así que un componente concreto de Foobar2000 no tiene equivalente aquí.

## El mejor reproductor de música para una biblioteca local

best-breadcrumb = Mejor reproductor de música
best-title = El mejor reproductor de música para una biblioteca local en { $year }
    .description = Las aplicaciones de streaming y los reproductores de biblioteca se juzgan por cosas distintas. Cinco criterios que de verdad separan a los reproductores de escritorio cuando tu colección es real, medidos con 50.000 pistas.

best-lede = No la mejor aplicación de música. Esas son clientes de streaming y se juzgan por catálogo y precio. Esto va de la pregunta más pequeña: qué reproductor de escritorio aguanta cuando la música ya está en tu disco y hay mucha.

disclosure = Transparencia
best-disclosure = rox es uno de los reproductores de esta comparación y esta es su propia web, así que lee primero los criterios y después los números. Los cinco se sostienen acabes descargando algo o no.

best-criteria = Cinco cosas que de verdad los separan

best-criterion-size = Tiene que sobrevivir al tamaño de tu biblioteca
    .body = A casi todos los reproductores se les hace la demo con unos cientos de álbumes. Los fallos interesantes empiezan en las decenas de miles, donde escanear se lleva una tarde, el desplazamiento se atasca y la memoria sube hasta que algo cede. Este es el único criterio que no puedes evaluar desde una captura, y es el que decide si dentro de un año sigues usando la cosa.

best-criterion-read = Tiene que leer tus etiquetas como es debido
    .body = Un vistazo a la cabecera te da un nombre de pista y una duración equivocada. Leer a fondo significa etiquetas completas, duraciones reales, y el códec, la frecuencia de muestreo y la profundidad de bits propios de cada archivo. También significa que los archivos con etiquetas rotas se indexan en vez de desaparecer en silencio, porque una biblioteca que pierde 300 archivos sin decir nada es peor que una que lo admite.

best-criterion-write = Tiene que dejarte escribir las etiquetas de vuelta
    .body = Una colección cuidada es una colección que se edita. Edición por lotes, escrituras atómicas para que un cuelgue no trunque un archivo, y valoraciones guardadas en los propios archivos en vez de en una base de datos que no te puedes llevar.

best-criterion-layout = La disposición tiene que ser tuya
    .body = Las preferencias aquí son genuinamente personales, y ese es el argumento a favor de la composición frente a un buen valor predeterminado. Paneles que colocas, duplicas con sus propias configuraciones y sacas a ventanas de verdad le ganan a cualquier disposición única que haya elegido otra persona.

best-criterion-yours = Tiene que ser tuyo y seguir siéndolo
    .body = Las bibliotecas locales son a lo que vuelve la gente cuando un servicio quita un álbum o cambia sus condiciones. Un reproductor que responda a eso con una cuenta, telemetría o una suscripción no ha entendido de qué va lo que está reproduciendo.

best-measured = Cómo queda el primero al medirlo
    .body = Siete reproductores, una biblioteca de 50.000 pistas, una máquina, un montaje. El arranque y el coste en reposo son la parte que notas todos los días.

best-shortlist = La lista corta honesta
    .p1 = Si usas Windows y ya tienes [Foobar2000](/foobar2000-alternative), tienes la respuesta y la tienes desde hace veinte años. Nada de esta página le gana a un Foobar2000 que funciona en su propia plataforma.
    .p2 = Si quieres algo con un ecosistema grande de plugins y un largo historial en Linux, Quod Libet y Strawberry son respuestas de verdad. A los dos les cuesta cargar una biblioteca de este tamaño más de lo agradables que resultan luego. Si el criterio del etiquetado es el que de verdad te importa, eso está escrito aparte como [alternativa a Mp3tag](/mp3tag-alternative), y el lado de la sonoridad del primer criterio está cubierto en [ReplayGain](/replaygain).
    .p3 = rox es la respuesta si quieres la forma de Foobar2000 de manera nativa en Linux o macOS: paneles que compones, etiquetado profundo, temas como archivos que se comparten, y un reproductor que abre la ventana en menos de un segundo con una biblioteca de este tamaño. Es nuevo, y no tiene API de plugins. Las dos cosas son costes reales.
    .aside = Los cinco criterios de arriba son el suelo, no el techo. Las valoraciones van en los propios archivos a través de FMPS y POPM y no en una base de datos que no te puedes llevar, y los géneros de valores múltiples se unifican como una opinión de la biblioteca en vez de como una reescritura de tus etiquetas. Si eso es lo que llevas tiempo queriendo de una biblioteca, este es el que hay que apuntar a tu disco.

best-closer = Mídelo con tu propia colección
    .body = El benchmark que importa es el que está en tu disco. Libre y de código abierto, sin cuenta, sin instalador.

## MusicBee

musicbee-breadcrumb = Alternativa a MusicBee
musicbee-title = Una alternativa a MusicBee para Linux y macOS en { $year }
    .description = MusicBee es solo para Windows. rox es un reproductor nativo para bibliotecas locales grandes en Linux, macOS y Windows, con etiquetado profundo y una disposición que compones tú. Incluye lo que MusicBee sigue haciendo mejor.

musicbee-h1 = Una alternativa a MusicBee que no es solo para Windows
    .lede = El problema de MusicBee, desde una máquina con Linux o Mac, es que es excelente y no está ahí. Esta página va de qué se traslada de verdad y qué no.

musicbee-good = En qué es bueno MusicBee
    .p1 = Amplitud. Gestiona bien una biblioteca grande, se apaña con las listas automáticas y la automatización de la cola, sincroniza con dispositivos portátiles, hace podcasts y radio por internet, convierte formatos, y se puede vestir con algo que dé gusto mirar. Es gratis, está pulido, y para mucha gente es el último reproductor de música que necesitó instalar.
    .p2 = También se ejecuta en Windows y en ningún otro sitio. Con Wine consigues una versión de él, con la advertencia de siempre: funciona hasta que una actualización decide lo contrario.

musicbee-gaps = Lo que rox no hace
    .body = Lo pongo primero, porque es la parte que decide la cuestión para mucha gente y enterrarlo te haría perder el tiempo.
    .close = Cuatro cosas reales, y la lista no está inflada para parecer honesta. Si dos de ellas forman parte de cómo usas un reproductor, para aquí.

musicbee-gap-sync = **Sin sincronización con dispositivos.** Si mueves música a un teléfono o a un DAP desde tu reproductor, rox no tiene ninguna respuesta.
musicbee-gap-radio = **Sin podcasts ni radio por internet.** rox reproduce archivos de tu disco.
musicbee-gap-plugins = **Sin API de plugins.** Lo que hubieras resuelto con un complemento tiene que existir ya.
musicbee-gap-ffmpeg = **La conversión necesita ffmpeg.** rox convierte entre formatos, pero maneja un ffmpeg que instalaste tú en vez de llevar un codificador propio, y no recodifica de camino a un dispositivo porque no hay sincronización para la que recodificar.

musicbee-transfers = Qué se traslada, y qué es mejor
    .p1 = La biblioteca aguanta al tamaño que suelen tener los usuarios de MusicBee. Un escáner paralelo saca de cada archivo las etiquetas completas, la duración real y su códec, frecuencia de muestreo y profundidad de bits, en lugar de quedarse en la cabecera. Los archivos con etiquetas ilegibles se indexan por nombre de archivo y no desaparecen sin más. La edición de etiquetas es un editor de verdad: edición por lotes, una rejilla por archivo, y una [ruta de escritura que copia y verifica](/mp3tag-alternative) en lugar de modificar los originales en el sitio.
    .p2 = La interfaz es la diferencia mayor. MusicBee te da una buena disposición y algo de personalización; rox te da unos cuarenta tipos de panel que colocas tú, duplicas con sus propias configuraciones y sacas a ventanas del sistema de verdad. Un aspecto entero es un archivo con la disposición, la paleta y la apariencia. Así que la organización con la que te quedes se la puedes pasar a otra persona, o llevártela a tu otra máquina, en lugar de dejarla viviendo dentro de una instalación.
    .p3 = Las listas automáticas se trasladan. Una lista inteligente en rox es una consulta guardada escrita en la misma sintaxis que usa el campo de búsqueda, con un orden y un tope opcionales, y se vuelve a ejecutar cada vez que el panel se refresca en lugar de guardar una foto vieja. El editor te muestra qué recoge la consulta según la escribes, así que te enteras de que escribiste mal la regla antes de guardarla con un nombre.
    .p4 = La automatización de la cola también está aquí: rox rellena la cola cuando se queda seca, a partir de tu orden de navegación, de las pistas a las que nunca llegas, o de a qué suena la pista actual. Esto último sale de analizar tus archivos en tu propia máquina, así que funciona con una biblioteca de la que nada en internet ha oído hablar.

musicbee-size = La cuestión del tamaño
    .body = MusicBee no está en esta tabla, porque los benchmarks se hicieron en Linux, donde no funciona. Está aquí como respuesta a "¿se cae la alternativa con el tamaño de mi biblioteca?", medido con 50.000 pistas.

musicbee-split = A quién le sirve esto y a quién no
    .p1 = ¿Te quedas en Windows con una configuración de MusicBee que sincroniza tu teléfono y le mete podcasts? Nada de aquí sustituye eso, y cambiar te costaría dos funciones de las que rox no tiene versión.
    .p2 = ¿Te mudas a Linux o a un Mac, o ya estás ahí mirando el hueco que dejó MusicBee? Esa es la razón entera de que esto exista, y el trato es concreto: renuncias a la sincronización y a los podcasts, y consigues un reproductor nativo con etiquetado más profundo, una disposición que montas tú, y una biblioteca que sigue ágil con cincuenta mil pistas.
    .aside = Sacar un panel a su propia ventana del sistema, o pasarle a alguien tu disposición entera como un solo archivo, no son filas de una comparación de funciones porque no hay nada al otro lado con lo que compararlas. Si eso es lo que llevas buscando, está en rox.

musicbee-closer = Ponlo a prueba con tu propia biblioteca
    .body = Libre y de código abierto bajo la AGPL, sin cuenta y sin instalador. También hay una [comparación con Foobar2000](/foobar2000-alternative), por si esa es la configuración que estás dejando de verdad.

## CaTRoX

catrox-title = CaTRoX, reconstruido como reproductor nativo
    .description = El tema CaTRoX de foobar2000, quién lo construyó, y qué hizo falta para que ese aspecto funcione de forma nativa en Linux y macOS sin Windows ni Wine debajo.

catrox-h1 = CaTRoX, sin Windows debajo
    .lede = rox trae un espacio de trabajo CaTRoX de serie. Esta es la página sobre por qué, y sobre la gente cuyo trabajo lo sostiene.

catrox-credit = El crédito donde corresponde
    .body = CaTRoX es un tema de foobar2000. El diseño y la paleta originales son de eXtremeHunter1972, y la edición que casi todo el mundo ha usado de verdad es [CaTRoX_QWR](https://theqwertiest.github.io/CaTRoX_QWR/), reconstruida y mantenida por TheQwertiest. rox no está afiliado a ninguno de los dos, y nada de aquí es su código. El espacio de trabajo de abajo es una recreación de un aspecto que hicieron ellos.

catrox-was = Qué era CaTRoX
    .p1 = Una disposición densa, oscura y con la información por delante para foobar2000: la carátula representada como un CD, una lista de campos de metadatos a un lado, pistas agrupadas por álbum con puntos de valoración, y una barra de menús exactamente donde va una barra de menús. Es a lo que se refiere la gente cuando dice que foobar2000 puede verse bien, y es casi toda la razón de que alguien aguantara configurar foobar2000 en primer lugar.
    .p2 = Nunca fue una skin en el sentido en que suele decirlo un reproductor de música. CaTRoX es un montón de componentes, scripts de panel y configuración, ensamblados. Eso es lo que lo hacía potente, y también lo que lo hace difícil de mover, difícil de compartir y fácil de romper.

catrox-nekorox = Dónde entró NekoRoX
    .p1 = El autor de rox mantuvo un fork durante años. [NekoRoX](/nekorox) era CaTRoX con una pila de paneles, plugins y módulos de comodidad encima: navegación por árbol y filtros, modos de reproductor mini y micro, un panel de letras sincronizadas, un cover flow, presencia en Discord, herramientas de Last.fm. Ahora tiene una nota arriba del README que dice que ya no se mantiene, y que apunta aquí.
    .p2 = El motivo de esa nota es el contenido honesto de esta página. Mudarse a Linux a tiempo completo significaba pasar el ensamblaje entero por Wine, y una pila sostenida con apaños apilados, en algunos sitios renderizando Internet Explorer dentro de los paneles, no le hace ninguna gracia una capa de traducción. Funcionaba. También daba la sensación de estar a una actualización de pararse para siempre, con una década de configuración dentro.

catrox-recreation = La recreación
    .body = El espacio de trabajo CaTRoX de rox es esa disposición reconstruida con paneles nativos: la carátula circular, la lista de campos de metadatos, la lista de pistas agrupada por álbum con sus puntos de valoración, la barra de menús. Es un aspecto, reproducido, no un port de nada. Nada del código de CaTRoX existe en rox y nada podría, porque rox es Rust sobre [gpui](@gpui) y CaTRoX son scripts de panel ejecutándose dentro de foobar2000. La discusión más amplia con foobar2000, incluidas las filas donde sigue por delante, está en [su propia página](/foobar2000-alternative).
    .after = Lo que cambió es lo que cuesta tenerlo. En rox un aspecto entero es un solo archivo con la disposición, la paleta y la apariencia juntas, así que el espacio de trabajo CaTRoX está a un clic en la ventana de bienvenida, y lo que construyas a partir de él es un archivo que le puedes pasar a alguien. Sin lista de componentes, sin orden de instalación, sin una configuración que solo se vuelve a montar en la máquina donde se hizo.

catrox-shot-alt = El espacio de trabajo CaTRoX de rox: una representación circular de la carátula como CD, una lista de campos de metadatos a la izquierda con título, artista, álbum, códec y tasa de bits, y pistas agrupadas por álbum con puntos de valoración a la derecha.

catrox-limits = Lo que no recuperas
    .aside = Lo que consigues a cambio es una disposición que se abre en Linux y macOS sin Wine por ninguna parte, sobrevive a una actualización del sistema, y viaja como un solo archivo. Después de una década manteniendo el original, ese trato es la razón entera de que rox exista.

catrox-limit-panels = No todos los paneles de CaTRoX tienen equivalente. rox tiene sus propios cuarenta y pico tipos de panel y no son los mismos cuarenta.
catrox-limit-youtube = Sin reproducción de YouTube. CaTRoX y NekoRoX la tenían por componentes; rox reproduce lo que hay en tu disco.
catrox-limit-plugins = Sin API de plugins, así que lo que hubieras resuelto con un componente de foobar2000 tiene que existir ya en rox o no existir en absoluto.
catrox-limit-fidelity = Es una recreación hecha desde fuera. Los detalles difieren, y una coincidencia exacta al píxel nunca fue el objetivo.

# $others es la cuenta de espacios de trabajo incluidos menos este.
catrox-closer = Pruébalo
    .body = El espacio de trabajo CaTRoX viene de serie, a un clic en la ventana de bienvenida. Y con él otros { $others }, entre ellos una [disposición Foobar y otra con forma de WinAmp](/workspaces).

## Cue sheets

cue-breadcrumb = Cue sheets
cue-title = Reproducir rips en FLAC y CUE, una pista a la vez
    .description = Una imagen de disco entero junto a un cue sheet, indexada como pistas de verdad: cada tramo se recorre, se ordena, se scrobblea y entra sin huecos en el siguiente, y tus listas nunca se enteran de que tres filas comparten un archivo.

cue-h1 = Cue sheets, y rips que se comportan como álbumes
    .lede = Si copiaste CD antes de que partirlos fuera lo normal, un buen trozo de tu biblioteca es un FLAC por disco con un archivo de texto al lado. Casi todos los reproductores o ignoran el sheet o tratan lo que describe como material de segunda. Esto es lo que hace rox con ello.

cue-what = Qué es en realidad un rip con cue
    .p1 = Un archivo de audio con un disco entero dentro, y un sheet `.cue` que lista dónde empieza cada pista. Es la forma exacta de conservar un CD, porque los huecos entre pistas son parte del disco y partirlo los tira. También es el formato que rompe la suposición sobre la que se construye cualquier biblioteca de música: que un archivo es una pista.
    .p2 = Los reproductores lo resuelven de una de tres formas. Ignorar el sheet y mostrar una pista de setenta minutos. Mostrar las pistas del sheet pero mantenerlas aparte de la biblioteca real, de modo que la búsqueda, el orden y las listas se comporten distinto con ellas. O hacer real la ruptura y absorberla de una vez.

cue-rows = Filas de verdad, no fragmentos
    .p1 = rox indexa cada tramo del sheet como una fila normal de la biblioteca, identificada por su archivo más su número de pista. Todo lo que viene después la lee como una pista, porque para todo lo que viene después lo es. Las listas la congelan, las escuchas se le enganchan, la búsqueda la encuentra y las columnas de orden la ordenan. Ninguna sabe que once filas apuntan al mismo FLAC.
    .p2 = La alternativa que elige la mayoría de implementaciones es una ruta sintética, `album.flac#3`, que mantiene la base de datos ordenada y traslada el problema a cada trozo de código que abra esa ruta más tarde. Un recorte que se olvide ahí es un fallo silencioso que lee bytes de etiqueta de la nada. Una biblioteca sin cue sheets no paga nada por todo esto: los tramos viven en una tabla aparte, y nada de las rutas calientes los lee.

cue-playing = Reproducir un tramo como un archivo
    .p1 = El motor toma un tramo como el mundo entero de esa pista: un posicionamiento exacto hasta su inicio, un recorte con precisión de muestra en los dos extremos, y un límite final que sigue el mismo camino que un final de archivo real. La reproducción sin huecos, el fundido encadenado, el parar tras la actual y la repetición funcionan todos sin saber que existen los tramos.
    .p2 = El recorte de cabeza es el detalle que importa. Un posicionamiento exacto aterriza en un límite de paquete y no en la muestra exacta, así que sin descartar los fotogramas entre el aterrizaje y el inicio del tramo, cada pista empieza con la cola de la anterior. Ese es el sonido de una implementación de cue que nadie terminó.
    .p3 = Las pistas consecutivas de un rip comparten grupo de álbum, que es lo que evita que el fundido encadenado se coma los empalmes sin huecos del propio disco. Un rip suena como el disco del que se sacó.

cue-scanning = Escanear, y cambiar de idea
    .p1 = El sheet reclama su imagen. Mientras un cue lista un archivo, ese archivo no tiene fila propia, así que no acabas con once pistas más un duplicado de setenta minutos. La frescura se calcula con el que se modificó más tarde de los dos, así que editar el sheet o el audio vuelve a cortar el rip en el siguiente escaneo. Borra el sheet y la imagen se pliega de vuelta a una fila normal.
    .p2 = Los metadatos prefieren el sheet y recurren a las etiquetas de la propia imagen. Los sheets escritos antes de que la disciplina UTF-8 fuera una cosa reciben un respaldo en cp1252, porque los rips antiguos son exactamente la población para la que existe esta función.

cue-ratings = Valoraciones que no marcan el disco entero
    .p1 = rox normalmente escribe las valoraciones en los propios archivos, que es lo correcto cuando un archivo es una pista. En un rip con cue no lo es: la imagen pertenece a las once pistas, así que una escritura por pista marcaría a todas con las mismas estrellas.
    .p2 = El escritor rechaza la mitad de archivo para estas filas y la base de datos guarda el valor. Lo mismo con las ediciones de etiquetas. Consigues valoraciones por pista en un rip, y tu imagen sale de ahí idéntica byte a byte.

cue-outstanding = Fuera, por ahora
    .body = Los picos de la forma de onda y el análisis acústico siguen leyendo la imagen entera en vez del tramo. Las letras son por archivo, así que un rip comparte una sola. La medición de ReplayGain por tramo, la edición de cue sheets dentro de la aplicación y los bloques CUESHEET incrustados en FLAC están todos sin resolver. Cada uno es aditivo sobre cómo se identifican los tramos, y ninguno lo cambia.

cue-later = Las partes que solo notarías más adelante
    .aside = La medida de esto no es si un rip suena. Es si, un mes después, algo de la biblioteca sigue comportándose distinto por haber salido de una imagen.

cue-later-m3u = La exportación a m3u escribe los tramos como `path#N`, y la importación prefiere una coincidencia exacta de ruta, así que una lista va y vuelve por otro programa sin colapsar en la imagen.
cue-later-scrobble = El scrobbling y el "sonando ahora" deduplican sobre el par, así que las once pistas de un disco se scrobblean como once pistas y no como una muy larga.
cue-later-listens = Las escuchas se vuelven a enganchar por tramo tras un reescaneo, así que un disco mantiene su historial de reproducción por pista incluso cuando todos los tramos llevan etiquetas idénticas.
cue-later-replaygain = Solo se traslada el par de valores de álbum de ReplayGain. Los valores de pista escritos contra una imagen de disco entero describen el disco, así que se ignoran en vez de darlos por buenos.

cue-closer = Apúntalo al estante que nunca partiste
    .body = El escáner recoge los sheets en su primera pasada, junto con todo lo demás. Más sobre [qué se rompe a escala de biblioteca](/best-music-player).

## Foobar2000

fb-breadcrumb = Alternativa a Foobar2000
fb-title = Una alternativa a Foobar2000 para Linux, macOS y Windows en { $year }
    .description = Foobar2000 acertó con las disposiciones por paneles, el etiquetado profundo y una comunidad de temas, y dejó casi todo eso atrapado en Windows. rox es un reproductor nativo y de código abierto que lleva las tres cosas a Linux y macOS.

fb-h1 = Una alternativa a Foobar2000 que funciona en todas partes
    .lede = Foobar2000 acertó en tres cosas que casi nada más hace a la vez, y dejó dos de ellas atrapadas en Windows. rox es el intento de llevar las tres al otro lado.

fb-right = Qué hizo bien Foobar2000
    .p1 = Una interfaz que montas con paneles en vez de aceptar lo que haya enviado quien la desarrolló. Una comunidad de temas encima de eso, que es la razón de que CaTRoX, [NekoRoX](/nekorox) y Georgia existan siquiera. Y una gestión de etiquetas y biblioteca que no se cae cuando la colección tiene decenas de miles de archivos.
    .p2 = Muchos reproductores hacen una. Muy pocos hacen dos. El conjunto que hace las tres lleva veinte años siendo prácticamente solo para Windows, y cada intento de moverlo ha significado renunciar a una.

fb-leaves = Dónde te deja tirado
    .p1 = En Linux no hay compilación oficial de Foobar2000, así que las opciones honestas son Wine u otra cosa. Wine funciona justo hasta que deja de funcionar. Una skin como CaTRoX se apoya en apaños apilados y, en algunos sitios, en Internet Explorer renderizando dentro de los paneles, y pasar eso por una capa de traducción deja bien a la vista cuánto se sostiene por suerte. Está a una actualización del sistema de romperse, siempre.
    .p2 = macOS está mejor que antes, ya que Foobar2000 v2 trae una compilación de Mac de verdad. Pero la parte que la gente quiere en realidad, el ecosistema de componentes y skins que hacía que la versión de Windows mereciera un fin de semana de configuración, está del lado de Windows. Consigues el reproductor sin el motivo por el que querías el reproductor.
    .p3 = Y en el propio Windows no hay nada que esté mal. Merece decirse claro: si usas Windows y tu configuración de Foobar2000 funciona, rox no es ninguna emergencia.

fb-does = Qué hace rox al respecto
    .p1 = Nativo en las tres plataformas, un binario en cada una, escrito en Rust sobre [gpui](@gpui). Unos cuarenta tipos de panel que colocas tú, duplicas con configuraciones independientes y sacas a ventanas del sistema de verdad. El escáner de la biblioteca va a las etiquetas completas, las duraciones reales y el códec, la frecuencia de muestreo y la profundidad de bits propios de cada archivo, en lugar de quedarse en las cabeceras. Y aguanta con 50.000 pistas.
    .p2 = La respuesta en temas es la parte que más cambió. Un espacio de trabajo es un solo archivo con la disposición, la paleta y la apariencia juntas. Lo editas, lo rompes, se lo pasas a alguien y esa persona recibe exactamente lo que tenías tú. Uno de los { workspace-count } que vienen de serie es una [recreación de CaTRoX](/catrox), que es la declaración honesta de intenciones.

fb-shot-alt = El espacio de trabajo CaTRoX de rox: la skin de foobar2000 recreada de forma nativa, con una representación circular de la carátula como CD, una lista de campos de metadatos a la izquierda y pistas agrupadas por álbum con puntos de valoración.

fb-table = Lado a lado
    .caption = Foobar2000 y rox comparados en soporte de plataformas, temas, licencia y madurez
    .area = Área
    .method = Tres filas se las lleva Foobar2000, y son las tres que costarían años cerrar. Una tabla comparativa donde una columna lo gana todo es un anuncio, no una comparación.

fb-row-linux = Nativo en Linux
    .fb = Sin compilación oficial. Solo Wine.
    .rox = De primera, x86_64.

fb-row-macos = Nativo en macOS
    .fb = Compilación oficial desde la v2.
    .rox = De primera, Apple Silicon.

fb-row-windows = Nativo en Windows
    .fb = Su casa. Veintitantos años de ella.
    .rox = De primera, x86_64.

fb-row-panels = Paneles que compones
    .fb = Sí, con Columns UI y compañía.
    .rox = Cuarenta y pico tipos de panel, de serie, sin componentes que instalar.

fb-row-sharing = Compartir un aspecto
    .fb = Una skin son componentes, configuraciones y scripts. Un lío, y con fama de serlo.
    .rox = Un archivo con la disposición, la paleta y la apariencia.

fb-row-source = Código disponible
    .fb = Freeware de código cerrado.
    .rox = AGPL-3.0, todo él.

fb-row-components = Ecosistema de componentes
    .fb = Cada uno construyó sobre el anterior. Lo que se te ocurra, ya existe.
    .rox = Sin API de plugins.

fb-row-maturity = Madurez
    .fb = Desde 2002. No te da sorpresas.
    .rox = Desde 2026. Te las dará, de vez en cuando.

fb-row-footprint = Huella
    .fb = Minúscula, y famosa por serlo.
    .rox = Un binario de 62 MB, 134 MB residentes con 50.000 pistas.

fb-not = Quién no debería cambiar
    .p1 = Si usas Windows, tienes tus componentes configurados y la cosa lleva una década estable, aquí no hay nada que compense el lío de cambiar. Si dependes de un componente concreto de Foobar2000, rox no tiene API de plugins y no puede sustituirlo. Si quieres software que ya haya cometido todos sus errores, rox es cuatro años demasiado joven.
    .p2 = Si te mudaste a Linux y dejaste la configuración atrás, o estás en un Mac con un reproductor sin el ecosistema que lo justificaba, ese es el hueco en el que se construyó esto.
    .p3 = El otro lado de llegar tarde merece decirse. Nada en rox tiene que seguir siendo compatible con una decisión tomada en 2002, que es cómo un aspecto entero acaba siendo un solo archivo que se comparte en vez de un grafo de componentes, cómo una sola base de código cubre las tres plataformas, y cómo cuarenta y pico tipos de panel vienen de serie en vez de montarse una descarga cada vez. También es por lo que la identidad de una pista nunca se ató a las rutas de archivo, que es lo que hace posible fusionar más adelante una biblioteca local con cualquier otra cosa. La mayor parte de esos 62 MB es la misma historia.
    .aside = Los paneles que salen a ventanas del sistema de verdad, o una paleta que se retiñe con la carátula que esté sonando, nunca llegaron a la tabla de arriba. No había nada que poner en la otra columna. Si diferencias así son lo que buscas, rox es tu sitio.

fb-closer = Ponlo a prueba con tu propia biblioteca
    .body = Libre, de código abierto bajo la AGPL, sin cuenta y sin instalador. Apúntalo a la colección que rompe otros reproductores.
    .fine = O lee antes el [código](@repo). Es una forma razonable de evaluar un reproductor que quiere permiso de escritura sobre tus etiquetas. ¿Sigues dándole vueltas? Los [criterios que separan a los reproductores de biblioteca](/best-music-player) están escritos aparte, benchmarks incluidos.

## Mp3tag

mp3tag-breadcrumb = Alternativa a Mp3tag
mp3tag-title = Una alternativa a Mp3tag para Linux y macOS en { $year }
    .description = Edición de etiquetas por lotes en FLAC, MP3, MP4 y APE, una rejilla por archivo para las importaciones hechas un desastre, valoraciones escritas en los propios archivos, y una ruta de escritura que nunca edita un original en el sitio.

mp3tag-h1 = Un editor de etiquetas que puedes apuntar a diez mil archivos
    .lede = Mp3tag es la herramienta a la que se refiere casi todo el mundo cuando dice editor de etiquetas, y no hay compilación de Linux. rox lleva un editor completo dentro, y una ruta de escritura pensada para el caso en que un lote es lo bastante grande como para que "normalmente funciona" no baste.

mp3tag-isnt = Empecemos por lo que esto no es
    .p1 = rox es un reproductor de música que contiene un editor de etiquetas serio. Mp3tag es un etiquetador dedicado, y como etiquetador dedicado es mejor: scripting, acciones, cadenas de formato que puedes componer, y veinte años de aristas limadas. Si lo que quieres es una herramienta independiente para pasarla por una carpeta y cerrarla, en Windows, esa es la buena.
    .p2 = El argumento para hacerlo en rox es que etiquetar una biblioteca no suele ser una tarea que termines. Es algo que haces mientras escuchas, sobre el archivo que acabas de ver mal, y eso hace que el editor esté pegado al reproductor y a la biblioteca por diseño y no como concesión.

mp3tag-write = La ruta de escritura
    .p1 = Esta es la parte que merece leerse aunque nunca instales rox. Casi todos los escritores de etiquetas modifican tu archivo en el sitio: abren el original, reescriben la zona de metadatos y cruzan los dedos. Eso va bien decenas de miles de veces y es catastrófico una, porque un cuelgue, un disco lleno o un disco desenchufado a medio camino dejan un archivo que ya no se puede leer, con tu audio dentro.
    .p2 = rox nunca escribe dentro de un original. Cada edición copia el archivo y aplica el cambio a la copia. Después verifica el resultado: relee los metadatos y calcula el hash del flujo de audio para confirmar que es idéntico byte a byte al que entró. Solo entonces renombra la copia sobre el original, de forma atómica. Si algún paso falla, la copia se borra y tu archivo queda intacto, porque nunca llegó a abrirse para escritura.
    .p3 = Cada archivo va además aislado, así que un archivo patológico dentro de un lote de cuatro mil falla por su cuenta en vez de llevarse por delante toda la ejecución.

mp3tag-cost = El coste
    .body = Copiar, verificar y renombrar significa que cada edición necesita brevemente espacio libre igual al archivo, y es más lento que escribir en el sitio. En un lote de unos miles de FLAC eso es tiempo real y disco real. Es el trato que rox hace a propósito, y es la razón entera de que el editor sea seguro de apuntar a una biblioteca en vez de a una carpeta.

mp3tag-batch = Editar un lote sin aplanarlo
    .p1 = Selecciona el número de pistas que quieras y el editor se abre como un único formulario compartido. Un campo en el que todos los archivos coinciden muestra su valor; los campos que discrepan salen vacíos bajo un texto de "varios valores". Solo escribe algo lo que de verdad muevas, así que un campo intacto nunca reescribe un archivo. Y los que serían un disparate estampados sobre una selección se bloquean solos en un lote: el título, el número de pista y el de disco.
    .p2 = Cuando un archivo del lote está mal, el formulario se cambia por una tabla: una fila por pista, una columna por campo, y los campos bloqueados por pista editables ahí mismo. Esa es la vista para la importación donde cada título y cada número está mal de una forma distinta, y le gana a ir entrando campo por campo. Las dos vistas confirman como un solo lote por la misma ruta de escritura, y el resultado aterriza en la biblioteca sin reescanear.

mp3tag-specs = Qué lee y qué escribe
mp3tag-spec-formats = **Formatos.** ID3v2, comentarios Vorbis, átomos MP4 y APE tras un solo editor, así que MP3, FLAC, M4A y el resto son la misma pantalla.
mp3tag-spec-ratings = **Valoraciones.** Escritas en los propios archivos con FMPS y POPM, no en una base de datos que no te puedes llevar.
mp3tag-spec-genres = **Géneros de valores múltiples.** Listas de verdad, con las unificaciones guardadas como una opinión de la biblioteca en vez de como una reescritura de tus etiquetas.
mp3tag-spec-art = **Carátulas.** Portadas de varias imágenes, añadidas y reemplazadas por la misma ruta atómica.
mp3tag-spec-lookup = **Consultas.** Etiquetas y carátulas de MusicBrainz, iTunes y Deezer, aplicadas por el mismo diff para que veas qué cambia antes de que escriba.
mp3tag-spec-repair = **Reparación.** Una pasada para archivos cuyas etiquetas están dañadas de formas concretas y conocidas en vez de simplemente mal, las que hacen que otros etiquetadores muestren una pista como un nombre de archivo y una duración de cero.
mp3tag-spec-patterns = **Patrones, en los dos sentidos.** Una cadena de formato como `%artist% - %title%` saca etiquetas de un nombre de archivo, y el mismo patrón al revés renombra archivos a partir de sus etiquetas. Los dos muestran una vista previa de cada pista antes de escribir nada.

mp3tag-stay = Quién debería quedarse con Mp3tag
    .p1 = Si usas Windows y te apoyas en acciones, scripting o en el trabajo más elaborado con cadenas de formato, rox no tiene equivalente y esto sería un paso atrás. Si quieres un etiquetador que no sea además un reproductor, esta es la forma equivocada por completo.
    .p2 = Si usas Linux o un Mac, o tu etiquetado ocurre en mitad de la escucha en vez de como tarea aparte, ese es el hueco que esto llena.
    .aside = La ruta de escritura es la parte que no tiene contraparte con la que compararse. Verificar el hash del flujo de audio antes de renombrar sobre un original no es algo que haga un etiquetador salvo que espere que lo apunten a todo lo que tienes. Si esa es la clase de cautela que quieres entre una edición y tus archivos, aquí la tienes.

mp3tag-closer = Apúntalo a la carpeta que llevas evitando
    .body = Libre y de código abierto, sin cuenta, sin instalador. El [lado de la biblioteca](/best-music-player) está escrito aparte, y si vienes de una configuración de Windows también hay una comparación con [MusicBee](/musicbee-alternative) y otra con [Foobar2000](/foobar2000-alternative).

## El visualizador

viz-breadcrumb = Visualizador de música
viz-title = Un visualizador de música integrado en el reproductor - rox
    .description = Paneles de espectro, forma de onda y VU, además de shaders WGSL sobre cualquier panel o sobre toda la ventana, movidos por señales con nombre que sacas del audio que suena y enrutas adonde quieras.
    .image-alt = El logo de rox sobre la frase en inglés: signals off the music, shaders on every surface

viz-h1 = Un visualizador que vive dentro del reproductor
    .lede = Casi todos los reproductores te dan un analizador de espectro y ahí se quedan. rox tiene esos paneles, y debajo una capa de modulación: señales con nombre sacadas del audio, enrutadas a entradas de shader que escribes tú, guardadas en el mismo archivo donde vive el resto de tu tema.

viz-panels = Primero, los paneles normales
    .p1 = Un panel de espectro con estilos de barra o de bloque, degradados, marcas de pico con su propia gravedad, etiquetas de frecuencia, y zonas partidas que analizan por encima y por debajo de una frecuencia elegida con ventanas de distinto tamaño, así que cada extremo del rango cambia reactividad por resolución en sus propios términos. Una tira de forma de onda que dibuja la pista entera, por canal, y que va adonde hagas clic. Un medidor VU. Un estante de carátulas que las gira en 3D de verdad. Nada de esto necesita una línea de código y es lo que usará la mayoría.
    .p2 = Pausar congela las barras donde estaban, en vez de dejarlas caer al suelo. Suena a poco hasta que intentas mirar el momento exacto en el que pausaste.

viz-shaders = Shaders, en cuatro superficies
    .p1 = Un shader de rox es una etapa de fragmento WGSL. Puede ejecutarse sobre el cuerpo de un solo panel, como panel de Shader propio, como superposición sobre toda la ventana, o como fondo pintando bajo todos los paneles, detrás de la carátula. La superposición y el fondo tienen cada uno un interruptor que los extiende a todas las ventanas que rox tenga abiertas. El mismo lenguaje, el mismo bloque de uniforms y el mismo enrutado en todos ellos.
    .p2 = Cada shader recibe el reloj, la resolución, el puntero y ocho floats meta que describen el momento: volumen, dónde está el cabezal dentro de la pista, si el audio se está moviendo de verdad, la duración de la pista, y cuán oscura se dibuja la paleta actual, así que un mismo shader puede vestirse para claro y oscuro en vez de estar hecho solo para el tema contra el que se escribió.
    .p3 = Un shader de panel también puede leer lo que el panel dibujó en realidad. Un enlace de máscara le entrega la pintura del propio panel repetida sobre transparencia, y los paneles publican la forma de su contenido, así que una sombra o un resplandor sigue a una carátula con bandas y no a las franjas vacías de los lados.
    .p4 = Pasada una etapa, un comentario `// @pass` parte el texto en una cadena de hasta ocho, cada una capaz de leer por nombre las pasadas anteriores. Eso es lo que necesita una pirámide de desenfoque o un bloom en dos etapas. Una línea `// @asset` nombra una imagen que muestrear, y `// @asset art: @cover` enlaza la carátula de la pista que suena, reenlazándola cuando la pista cambia. Vienen nueve ejemplos con la aplicación, cada uno demostrando una parte distinta de ese contrato en vez de nueve variaciones sobre un plasma.
    .p5 = Apunta el panel a un archivo del disco y rox lo vigila. Guarda en tu editor y la ventana ya lo tiene. Un guardado que no compila deja la última versión buena en pantalla con el error en el panel, porque perder la imagen es una mala forma de enterarte de que has escrito mal un punto y coma.

viz-signals = Las señales son la parte diferente
    .p1 = Un shader con un reloj dentro es un salvapantallas. Lo que lo convierte en visualizador es lo que le des de comer, y en rox eso es un conjunto de señales con nombre compartido por toda la aplicación. Las construyes en una ventana propia, dentro de Aplicación, junto al ecualizador, y lleva un espectro y un transporte por la misma razón que el ecualizador: eliges una banda a ojo y de oído contra lo que estás reproduciendo de verdad.
    .p2 = Cinco clases de origen. Una **banda** es la energía entre dos frecuencias, que es la señal sobre la que cabalga un crescendo. **Nivel** es toda la mezcla. Un **ataque** pulsa cuando una banda salta por encima de su propia media reciente, que es la señal sobre la que cabalga un golpe. Un **disparo** pulsa cuando una banda cruza una línea que dibujaste tú, para material donde la media móvil nunca llega a bajar y un ataque se queda callado tras el primer compás. Un **total** suma otra señal a lo largo del tiempo y da la vuelta en uno, así que un shader puede leerlo como una fase que avanza mientras la música está fuerte y se estanca mientras no lo está.
    .p3 = Cada una lleva suavizado de respuesta y una puerta. La puerta es el ajuste que se gana su sitio: una banda cabalgando el ruido de sala mantiene para siempre todos los mandos que cuelgan de ella ligeramente fuera de su reposo, y un umbral con una curva encima entrega silencio entre los golpes. El medidor dibuja el valor sin puerta con el umbral marcado encima, porque una barra que desapareciera bajo su propia puerta no ayudaría nada a colocar la puerta.
    .p4 = Una ruta une una señal con un parámetro y un tramo de salida: esta señal, este destino, de aquí hasta allá. Dieciséis slots llegan a cada shader, y los slots a los que no se enruta nada reciben un deslizador normal en la página de ajustes, así que un aspecto puede estar medio interpretado y medio puesto a mano.

viz-tap = Medido antes del mando de volumen
    .body = La toma que leen las visuales está por delante del volumen de salida. Antes, bajar la música la hacía parecer más floja de lo que es, y una señal ajustada a un volumen estaba mal a otro. El ecualizador y ReplayGain sí se ven, porque van aguas arriba y son parte de lo que estás oyendo.

viz-critters = Critters, como argumento
    .body = Uno de los espacios de trabajo incluidos es el reproductor entero renderizado como una impresión de 1 bit: un tramado ordenado sobre cada superficie, tonos que se aplastan con los subgraves, y un muro de ruido detrás de los paneles que se mueve con la canción. Son cinco señales y cuatro shaders en un solo archivo, y nada de eso es un caso especial dentro de la aplicación.
    .caption = Cárgalo desde la ventana de bienvenida, luego abre los ajustes y destrípalo. [El resto de ellos](/workspaces).

viz-trust = Ejecutar el shader de un desconocido
    .p1 = Los shaders viajan dentro de los archivos de espacio de trabajo, lo que significa que un aspecto importado llega con código de otra persona.
    .p2 = Nada se ejecuta hasta que tú lo dices. El código de cada shader lleva una huella, y la lista de aprobados es local a la máquina y solo se escribe por una acción directa: elegiste el archivo, pulsaste recargar, elegiste un preajuste, pulsaste Aprobar. Un aspecto que llegó en un paquete se queda ahí inerte con un botón debajo hasta entonces. Los ejemplos que vienen con rox son de confianza por construcción, porque están compilados dentro del binario.
    .p3 = Encender uno abre una ventana de confirmación que espera una respuesta en vez de contar atrás, y esa ventana nunca se sombrea. Haga lo que haga el shader con el resto de la pantalla, el camino de vuelta sigue siendo legible.

viz-limits = Qué no está resuelto
    .aside = La distancia entre "quiero que el reproductor entero destelle con el bombo" y tenerlo son una banda, una puerta y una ruta, y ninguna de las tres necesita recompilar nada.

viz-limit-routes = Las rutas llegan a los slots de shader y a los mandos del panel de partículas. Los ajustes de todos los demás paneles siguen siendo mandos que pones a mano.
viz-limit-milkdrop = WGSL, no Milkdrop ni AVS. No hay importador para ninguno, y veinte años de presets no cruzan.
viz-limit-midi = Sin superficie de control MIDI ni OSC. Lo que existe es la pasada de superposición y las pasadas de panel, movidas por el audio y el puntero.
viz-limit-battery = Una pasada a ventana completa es una pasada de GPU real en cada fotograma. En un portátil con batería, eso es una decisión que estás tomando.

viz-closer = Pruébalo con tu propia biblioteca
    .body = Aquí nada llama a ningún sitio: el análisis es el audio que ya está pasando por el reproductor. Más sobre [qué lleva un espacio de trabajo](/workspaces).

## NekoRoX

neko-title = NekoRoX, el tema de foobar2000, reconstruido nativo
    .description = NekoRoX era un fork de CaTRoX para foobar2000: paneles propios, letras sincronizadas, presencia en Discord, herramientas de Last.fm. Ahora está archivado, y rox es el reproductor nativo que su autor construyó en su lugar.

neko-h1 = NekoRoX, el tema de foobar2000, y adónde fue a parar
    .lede = NekoRoX era un tema de foobar2000: un fork de CaTRoX con una década de paneles, plugins y arreglos apilados encima. Lo mantuve como [catlinman](https://github.com/catlinman) hasta que dejó de ser mantenible. rox es lo que construí en su lugar, y su aspecto predeterminado es esa disposición reconstruida desde cero.

neko-shot-alt = El tema NekoRoX de foobar2000: una disposición oscura con pestañas INF, BIO, LYR, ART y LIB, un muro de carátulas a la izquierda, pistas agrupadas por álbum con valoraciones por estrellas a la derecha, y una forma de onda ámbar con un analizador de espectro abajo.
neko-shot-caption = NekoRoX ejecutándose en foobar2000, en Windows, en 2022.

neko-was = Qué era NekoRoX
    .p1 = Una configuración de foobar2000 lista para usar que descomprimías en `%appdata%` y ya tenías un reproductor terminado. Oscuro, denso, pestañas para info, biografía, letras, carátulas y biblioteca, un muro de carátulas en un lado, pistas agrupadas por álbum con puntos de valoración, y una forma de onda ámbar abajo. Debajo había Columns UI, un montón de paneles en JScript, un archivo de disposición `.fcl` y una carpeta de fuentes que tenías que instalar a mano.
    .p2 = Empezó como [CaTRoX](/catrox), el tema de eXtremeHunter1972, luego llevado adelante por TheQwertiest. NekoRoX añadió navegación por árbol y filtros, modos de reproductor mini, un panel de letras sincronizadas, un cover flow, presencia en Discord y herramientas de Last.fm, y fue reincorporando buena parte del trabajo de TheQwertiest sobre la marcha. Ninguno de los scripts de base era mío y el README siempre lo ha dicho.

neko-where = Dónde encontrarlo
    .body = El repositorio sigue en pie en [github.com/catlinman/foobar2000](https://github.com/catlinman/foobar2000) y los archivos siguen funcionando. No se mantiene, es solo para Windows, y varios de los componentes de los que depende se han quedado obsoletos o han desaparecido de donde estaban. Si quieres usarlo, úsalo. Solo ten claro que no lo va a arreglar nadie.

neko-alpha = AlphaRoX, el claro
    .body = El mismo tema con la paleta invertida, publicado en esta cuenta como [AlphaRoX](https://github.com/zealsprince/foobar2000). Es un fork de NekoRoX, que es un fork de CaTRoX, lo que te dice casi todo lo que estaba mal en distribuir un aspecto de esta manera. El mismo estado que NekoRoX ahora: en pie, funcionando, sin mantenimiento.
    .alt = El tema AlphaRoX de foobar2000: la contraparte clara de NekoRoX, con fondo blanco, un muro de carátulas a la izquierda, pistas agrupadas por álbum con valoraciones por estrellas, y una forma de onda azul con analizador de espectro abajo.

neko-stopped = Por qué se paró
    .p1 = Me mudé a Linux a tiempo completo, lo que significaba pasar el ensamblaje entero por Wine. Funcionaba. También renderizaba Internet Explorer dentro de los paneles, y una pila sostenida con apaños apilados no se lleva nada bien con una capa de traducción. Cada actualización de foobar2000, y cada actualización de Wine, era una moneda al aire sobre una década de configuración.
    .p2 = El problema más de fondo era el formato. Una instalación de NekoRoX no es un archivo, es una lista de componentes, un orden de instalación y un conjunto de rutas que solo se vuelven a montar en la máquina donde se hicieron. Por eso el README le decía a la gente que copiara cuatro directorios en dos sitios distintos. Compartir un aspecto no debería llevar una página de instrucciones.

# $others es la cuenta de espacios de trabajo incluidos menos el
# predeterminado y CaTRoX, que ya salen nombrados en la frase.
neko-rox = Qué hace rox con ello
    .body = rox es un reproductor nativo escrito en Rust, en Linux, macOS y Windows, sin foobar2000 y sin Wine debajo. Su espacio de trabajo predeterminado es la disposición de NekoRoX reconstruida con paneles nativos, y por eso las dos capturas se parecen. De serie viene también un [espacio de trabajo CaTRoX](/catrox), y otros { $others } con él.

neko-default-alt = El espacio de trabajo predeterminado de rox, una reconstrucción nativa de la disposición de NekoRoX: una cuadrícula de carátulas junto a una lista con valoraciones por estrellas, una barra de posición con forma de onda ámbar abajo, y pestañas de biografía, letras y metadatos.

neko-carried = La lista de funciones, línea por línea
    .after = Lo que NekoRoX no podía hacer es lo que más me importa. En rox un aspecto entero es un solo archivo con la disposición, la paleta y la apariencia juntas, así que le pasas a alguien un espacio de trabajo y ya tiene tu configuración. Sin lista de componentes, sin orden de instalación, sin carpeta de fuentes.

neko-had-nav = Navegación por árbol y por filtros
    .now = Panel de árbol de carpetas, más un panel de filtro en cascada por artista, álbum, género y año.
neko-had-mini = Modos de reproductor mini y micro
    .now = Una disposición mini por espacio de trabajo, conmutada desde el transporte, con su propio tamaño de ventana.
neko-had-ontop = Siempre encima
    .now = Nada por ahora. La ventana es una ventana normal.
neko-had-ratings = Vistas de valoración y de reproducciones
    .now = Valoraciones de cinco estrellas o de diez puntos, escritas en POPM y FMPS, y una columna de reproducciones ordenable.
neko-had-youtube = Búsqueda y reproducción de audio de YouTube
    .now = Nada. rox reproduce archivos de tu disco.
neko-had-covers = Visor de carátulas y cover flow
    .now = Un panel de carátula y un carrusel de álbumes que escala y atenúa a sus vecinos hacia los bordes.
neko-had-lyrics = Letras sincronizadas en tiempo real
    .now = Letras LRC resaltadas sobre el cabezal, clic en una línea para ir ahí, descargadas de lrclib.
neko-had-viz = Visualización y barra de posición con amplitud
    .now = Una forma de onda de la pista entera que puedes recorrer, un espectro FFT, un medidor VU.
neko-had-discord = Rich presence de Discord
    .now = Lo que suena, el estado de reproducción y el tiempo transcurrido por IPC de Discord.
neko-had-bio = Búsqueda de biografía en vivo
    .now = Biografía del artista con fanart, etiquetas, número de oyentes y artistas parecidos.
neko-had-lastfm = Integración con Last.fm
    .now = Scrobbling, "sonando ahora", corazones reflejados como favoritos, e importación de pistas favoritas.

neko-closer = Consigue rox
    .body = Libre, de código abierto, un binario por plataforma. La [página de espacios de trabajo](/workspaces) enseña los { workspace-count } aspectos incluidos, y la [comparación con foobar2000](/foobar2000-alternative) cubre dónde foobar2000 sigue por delante.

## ReplayGain

rg-title = ReplayGain explicado, y lo que cuesta activarlo
    .description = Qué hace ReplayGain en realidad, ganancia de pista frente a ganancia de álbum, por qué importa el valor de pico, cómo tratar los archivos que nadie midió nunca, y por qué ReplayGain y la reproducción bit a bit se excluyen mutuamente.

rg-h1 = ReplayGain, y lo que te cuesta
    .lede = Por qué un álbum suena el doble de fuerte que el siguiente, qué le hace el arreglo a tu audio en realidad, y por qué no puedes tenerlo a la vez que la reproducción bit a bit.

rg-problem = El problema que resuelve
    .p1 = Los discos no se masterizan a una sonoridad común. Un CD de 1985 y una remasterización de 2005 del mismo álbum pueden diferir en diez decibelios o más, que es la diferencia entre estar cómodo y buscar el mando del volumen. Pon en aleatorio una biblioteca de cuatro décadas y estarás ajustando el volumen cada tres pistas.
    .p2 = ReplayGain lo arregla sin tocar tu audio. Una pasada de análisis mide cuánto se aleja una pista de una sonoridad de referencia y escribe ese número, en decibelios, en las etiquetas del archivo. Al reproducir, el reproductor lee el número y lo aplica. No se recodifica nada y no se destruye nada, porque la corrección vive en una etiqueta y el audio de debajo es el audio que tenías.

rg-modes = Ganancia de pista y ganancia de álbum
    .p1 = Cada archivo medido lleva dos números, y elegir entre ellos es el único ajuste que de verdad cambia cómo se siente escuchar.
    .track = **Ganancia de pista** nivela cada pista por separado. Cada canción llega a la misma sonoridad, que es lo que quieres en aleatorio. También aplana los álbumes construidos con dinámica a propósito: el interludio suave antes del cierre potente sube hasta igualarlo, y el efecto que buscaba el productor desaparece.
    .album = **Ganancia de álbum** aplica una sola cifra a todas las pistas del disco, calculada a partir del álbum entero. Las diferencias relativas dentro del álbum sobreviven exactamente como se masterizaron, y el álbum como unidad queda al nivel de otros álbumes. Este es el valor correcto si escuchas discos de principio a fin.
    .setting = rox lo toma como un ajuste y aplica la cifra elegida por pista según la abre, así que es una preferencia y no algo grabado a fuego en los archivos.

rg-peak = El pico, y por qué un realce puede saturar
    .p1 = Junto a la ganancia, una pasada de medición anota la muestra más alta de la pista. Ese número importa porque las correcciones de ReplayGain van en los dos sentidos: una grabación floja recibe una ganancia positiva, y multiplicar muestras que ya llegan cerca de la escala completa las empuja más allá. Pasada la escala completa no hay adónde ir, así que la onda se aplana y oyes una distorsión que no estaba en el archivo.
    .p2 = El pico es lo que lo evita. rox limita un realce contra el pico que declara la etiqueta, así que una pista floja se sube solo hasta donde puede llegar sin saturar. El resultado es que algunas pistas flojas se quedan algo por debajo de la sonoridad objetivo, que es el intercambio correcto y la razón de que se guarden los valores de pico.

rg-unmeasured = Los archivos que nadie midió nunca
    .p1 = ReplayGain solo funciona con archivos que llevan las etiquetas, y en una biblioteca real reunida a lo largo de veinte años una buena parte no las lleva. Históricamente eso significaba pasar un etiquetador aparte por todo antes de que tu reproductor sirviera de algo.
    .p2 = rox lee las etiquetas donde existen, bajo los nombres estándar de cada formato que indexa: marcos TXXX en ID3v2, comentarios Vorbis en FLAC, átomos libres en MP4. Para todo lo demás mide los archivos él mismo con una pasada de sonoridad EBU R128 y guarda el resultado contra la biblioteca, marcado como medido para que un reescaneo posterior pueda distinguir los números propios de rox de lo que escribió un etiquetador. Si prefieres que los números vivan en los archivos, un ajuste los escribe de vuelta por la misma ruta de escritura verificada que usa el editor de etiquetas.
    .p3 = Esa pasada puede ejecutarse sola. Con la medición automática activada, los archivos se miden en cuanto el vigilante de carpetas se calma tras una importación, y una pista soltada en un álbum ya medido manda el disco entero de vuelta a medir, porque la ganancia de álbum es una cifra sobre el disco y no sobre el archivo.

rg-skip = La parte que casi todas las páginas se saltan
    .p1 = ReplayGain multiplica tus muestras por un número. Eso es procesado. No es sin pérdidas, no es un paso directo, y cualquier reproductor que afirme tener ReplayGain y salida bit a bit al mismo tiempo está describiendo algo que no puede pasar.
    .p2 = Esto importa si tienes un DAC que elegiste con cuidado. Bit a bit significa que las muestras que llegan al conversor son las muestras del archivo, sin modificar, así que cualquier cosa que las escale acaba con esa afirmación: un control de volumen por debajo de la unidad, un ecualizador, ReplayGain. No hay ninguna versión de la normalización de sonoridad que deje los bits en paz, porque cambiar la sonoridad es cambiar los bits.
    .choice = Cuál de las dos quieres es una elección real y no una pregunta trampa. El bit a bit importa para escuchar con atención un álbum en buen equipo. ReplayGain importa el resto de las horas, cuando la biblioteca va en aleatorio y prefieres no tocar el volumen. Casi todo el mundo debería usar ReplayGain y dejar de preocuparse. La cuestión es saber cuál de los dos está activo.

rg-bitperfect = Qué significa bit a bit en rox
    .body = Tres condiciones, dichas en vez de adornadas: la cadena de procesado vacía o desactivada, el volumen al 100%, y el dispositivo funcionando a la frecuencia propia del archivo de origen. Cumple las tres y el conversor recibe muestras idénticas bit a bit. Falla una y no las recibe, y rox lo dice en vez de mostrar un distintivo. ReplayGain activado es procesado activado, y se lee como procesado activado.

rg-exclusive = Salida exclusiva, aparte
    .p1 = El bit a bit también necesita al sistema operativo fuera del camino, que es para lo que sirve un modo de salida exclusiva. rox toma el dispositivo directamente: el nombre `hw:` de ALSA en Linux, sin dmix, sin plug y sin servidor de sonido en medio; WASAPI exclusivo en Windows; modo hog por CoreAudio en macOS. Sigue la frecuencia de origen donde el dispositivo lo permite, e informa de a qué accedió el hardware en realidad y no de lo que se pidió.
    .p2 = El trato es lo que significa exclusivo en todas partes: mientras rox tiene el dispositivo, nada más de la máquina suena por él. Si no puede tomarlo, rox vuelve al modo compartido con el estado a la vista, en vez de quedarse callado y dejarte averiguar por qué.

rg-limits = Qué no está resuelto
    .aside = Un reproductor que te diga cuál de los dos, bit a bit o ReplayGain, está activo ahora mismo, y que mida los archivos a los que tus etiquetadores nunca llegaron, es una lista corta. Si esa es la clase de honestidad que quieres de lo que hay entre tu biblioteca y tu DAC, rox está en ella.

rg-limit-opus = Los archivos Opus llevan su propio esquema `R128_TRACK_GAIN` relativo a una referencia distinta. rox no lo convierte, porque `.opus` no está entre las extensiones del escáner.
rg-limit-itunes = El `iTunNORM` de iTunes queda fuera del alcance. No lo escribe nada más y sus cifras por canal no son una ganancia en decibelios.
rg-limit-rate-switch = Seguir la frecuencia de origen en modo exclusivo cuesta un hueco audible entre dos pistas de frecuencias distintas, porque el flujo se reabre. La reproducción sin huecos dentro de una misma frecuencia no se ve afectada.

rg-closer = Apúntalo a tu biblioteca
    .body = La pasada de medición se ejecuta en segundo plano sobre todo lo que no tenga ganancia, y sigue en marcha con la ventana de ajustes cerrada. Más sobre [qué más importa a escala de biblioteca](/best-music-player).
