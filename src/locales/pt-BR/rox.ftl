# rox.music, português do Brasil.
#
# Espelhado de en-CA. O que faltar aqui cai em silêncio para o inglês em tempo
# de execução, por isso scripts/check-locales.ts é o lugar onde as lacunas
# aparecem, e não a própria página.
#
# Nomes de produtos ficam como estão: rox, Foobar2000, CaTRoX, NekoRoX,
# MusicBee, Mp3tag, ReplayGain, gpui. Traduz-se o que alguém lê, não o que
# alguém clica ou digita.
#
# "Workspace" aqui é espaço de trabalho, porque é assim que o próprio
# aplicativo chama (crates/rox-i18n/locales/pt-BR). Quem lê sobre espaços de
# trabalho no site precisa reencontrar a palavra nas configurações. Masculino,
# então "o espaço de trabalho CaTRoX", "um dos que já vêm com o rox". A URL
# /workspaces continua como está, e o nome do placeholder { workspace-count }
# também.
#
# As aspas são as curvas, “assim”, e nunca as retas. Os números já estão
# localizados (50.000, 0,3 segundo, 100%); mantenha assim.

## Moldura

skip-to-content = Pular para o conteúdo

nav-home = página inicial do rox
nav-main = Principal
nav-download = Download
nav-workspaces = Espaços de trabalho
nav-more = Mais
nav-github = rox no GitHub
    .stars = rox no GitHub, { $stars } estrelas

language-picker = Idioma
language-missing = Não achou seu idioma?
theme-toggle = Alternar tema
    .label = Alternar entre o tema claro e o escuro

footer-credit = O rox é feito por [Andrew Lake (zealsprince)](@author) em Rust sobre [gpui](@gpui), o framework de interface por trás do [Zed](@zed). Livre e de código aberto sob a [AGPL-3.0](@license).
footer-nav = Rodapé
footer-source = Código
footer-irc = IRC
footer-irc-direct = Direto
footer-irc-web = Webchat
footer-bug = Relatar um bug
footer-translate = Ajude a traduzir

## O site em si

# O título que vai para a busca, e não a frase escrita para alguém ler. "Se o
# Foobar2000 tivesse sido feito em pleno século XXI" é a frase melhor, e por
# isso fica como h1 e no cartão social, onde tem gente lendo. Ninguém digita
# isso no Google.
#
# O alvo aqui é "alternativa ao foobar2000", uma busca que o rox tem como
# ganhar. "player de música para linux" não se ganha contra vinte anos de
# listinha, e correr atrás disso custaria o único termo que converte. São 59
# caracteres em inglês, para o título caber inteiro na largura que o Google
# mostra. A tradução tem o mesmo orçamento, e largar o nome de uma plataforma é
# o jeito mais barato de abrir espaço.
site-tagline = rox - alternativa ao Foobar2000 para Linux, macOS e Windows

# Menos de 160 caracteres, senão o Google corta no meio da frase. As
# plataformas já estão no título, e é isso que sobra de espaço para dizer o que
# o título não diz.
site-description = Um player nativo para coleções locais grandes e bem etiquetadas. Monte seus painéis, compartilhe temas como arquivos, continue rápido com 50.000 faixas.

# As quatro social cards em static/social/ são o mesmo arquivo para todos os
# idiomas, e a frase está como texto em inglês dentro da imagem. O alt precisa
# dizer o que está escrito lá de verdade, e que está em inglês. Vale igual para
# download-title, workspaces-title e viz-title.
social-image-alt = O logo do rox acima da frase em inglês: if Foobar2000 was made in the current year

# A quantidade de espaços de trabalho que já vêm com o rox, escrita por
# extenso. Um algarismo abaixo de dez no meio de uma frase parece ficha
# técnica, e quais números se escrevem por extenso é decisão de cada idioma,
# então ela acontece aqui. Toda frase que cita a quantidade diz
# { workspace-count } e passa $count adiante.
workspace-count = { $count ->
    [1] um
    [2] dois
    [3] três
    [4] quatro
    [5] cinco
    [6] seis
    [7] sete
    [8] oito
    [9] nove
   *[other] { $count }
}

## Afirmações no grafo de dados estruturados

app-feature-panels = Interface de painéis que você monta, com janelas destacáveis
app-feature-workspaces = Espaços de trabalho compartilháveis que carregam layout, paleta e aparência
app-feature-tagging = Edição profunda de tags com escritas atômicas e edições em lote
app-feature-gapless = Reprodução sem intervalo
app-feature-dsp = Equalizador, crossfade e ReplayGain
app-feature-exclusive = Saída exclusiva bit-perfect
app-feature-lyrics = Letras sincronizadas
app-feature-scrobbling = Scrobbling no Last.fm

## Início

home-hero = Se o Foobar2000 tivesse sido feito em pleno século XXI.
    .lede = Um player de música de desktop para quem tem coleções locais grandes e bem etiquetadas. Você mesmo monta os painéis. Um tema é um arquivo só, que dá para passar adiante. Nativo em Linux, macOS e Windows.
    .alt = O rox rodando o espaço de trabalho padrão no estilo NekoRoX, mostrando a biblioteca, a capa, a fila e um painel de espectro

home-speed = Menos de um segundo até a janela abrir
    .body = O rox vem como um binário só e inicia antes de você soltar o mouse.

home-features = O que tem dentro

home-closer = Faça dele o seu
    .body = São { workspace-count } espaços de trabalho que já vêm com o rox, a um clique na janela de boas-vindas. Cada um é um arquivo único com o layout, a paleta e os shaders que ele roda, então dá para editar, quebrar e passar para outra pessoa. [Veja todos](/workspaces).

## A tabela de benchmarks

benchmark-caption = Início, memória e CPU em repouso de sete players de música numa mesma coleção de 50.000 faixas
benchmark-player = Player
benchmark-window-up = Janela na tela
benchmark-loaded = Totalmente carregado
benchmark-memory = Memória
benchmark-idle-cpu = CPU em repouso
benchmark-never-settles = nunca estabiliza

benchmark-method = Medi todos eles eu mesmo, numa máquina só (Ryzen 9 5950X, Linux/Wayland), com a mesma coleção de 50 mil faixas num SSD externo e cada player passando pela mesma bancada com a biblioteca carregada. Memória é PSS da árvore de processos inteira. “Carregado” é quando a CPU estabiliza depois do início; repouso é um player pausado com a janela visível.
    .deadbeef = O [DeaDBeeF](@deadbeef) teria ficado em 44 MB e ganhado no quesito memória, mas não chegou a ter uma linha: o parser de MP3 dele dá segfault no meio da importação desta coleção, em toda tentativa. O rox indexa as 50.000 faixas, incluindo os arquivos truncados que o derrubam.

## A grade de recursos

features-library = Biblioteca
features-playback = Reprodução
features-looks = Visual
features-daily = No dia a dia

feature-library = Uma biblioteca que aguenta
    .body = Um scanner paralelo lê as tags completas, as durações reais e o codec de cada arquivo. Nada de passar o olho no cabeçalho. A monitoração de pastas sobrevive a renomeações, e nada some em silêncio.
    .link = O que quebra com 50.000 faixas

feature-tagging = Tags em que dá para confiar
    .body = Um editor completo com escritas atômicas e edições em lote. As avaliações ficam nos próprios arquivos, via FMPS e POPM. Consulta pelo MusicBrainz, iTunes e Deezer.
    .link = Ao lado do Mp3tag

feature-cue = Rips em cue tocam como faixas
    .body = Um FLAC de disco inteiro ao lado do cue sheet dele é indexado como linhas de verdade. Cada trecho busca, faz scrobble, ordena e emenda no seguinte sem intervalo, do jeito que um arquivo faz.
    .link = Como os trechos funcionam

feature-gapless = Reprodução sem intervalo
    .body = Um stream só, com aleatório, repetição e tocar em seguida. Se um dispositivo de áudio some, ele se recupera. As teclas de mídia e o aviso de faixa tocando funcionam nas três plataformas.

feature-equalizer = Dez bandas e bit-perfect
    .body = Um equalizador numa janela própria, um crossfade que deixa as emendas de um álbum em paz, e saída exclusiva que diz com o que o hardware concordou.
    .link = ReplayGain e bit-perfect

feature-similarity = Ordenado por como soa
    .body = O rox descreve suas faixas a partir do áudio delas, andamento incluído, e ordena o que vem a seguir por semelhança. Tudo roda na sua máquina, sobre os seus arquivos, sem serviço nenhum no meio.

feature-panels = Painéis que você monta
    .body = Uns quarenta tipos de painel, de biblioteca e fila a grades de artistas, espectro e VU. Duplique um com a configuração dele, salve como predefinição, ou destaque em uma janela.
    .link = Ao lado do Foobar2000

feature-themes = Temas como arquivos compartilháveis
    .body = Um espaço de trabalho é um arquivo só com layout, paleta, aparência e shaders. As paletas podem se tingir pela capa que toca, indo para o claro ou o escuro junto com a imagem.
    .link = Os { workspace-count } que já vêm junto

feature-shaders = Visuais que escutam
    .body = Escreva um shader WGSL sobre um painel ou sobre a janela inteira. Sinais nomeados tirados do espectro alimentam as entradas dele, então uma banda de bumbo move o controle que você apontar.
    .link = Shaders e sinais

feature-lyrics = Letras e histórico
    .body = Sincronizadas ou simples, de arquivos ao lado, tags ou lrclib, com um editor que escreve de volta onde leu. Um registro de audições alimenta o painel de histórico, as estatísticas e o scrobbling.

feature-playlists = Playlists que sobrevivem
    .body = Favoritos, reordenar arrastando, m3u para dentro e para fora, e playlists inteligentes que reexecutam uma consulta salva em vez de guardar um retrato. As entradas sobrevivem a um arquivo sair e voltar.

feature-binary = Um binário, sem instalador
    .body = Um tarball, um DMG ou um zip, mais o AUR e um flake do Nix. O modo portátil guarda a biblioteca e as configurações numa pasta ao lado do executável.
    .link = Baixe

## O botão de download, onde quer que ele apareça

download-cta = Baixar o rox
# %s é onde o enhance.js coloca o nome da plataforma detectada. Tem que ficar: o
# script não conhece idioma nenhum e só sabe substituir, então a ordem das
# palavras precisa estar certa aqui.
download-cta-detected = Baixar para %s
download-packaged = Está no Arch ou no NixOS? [Instale pelo AUR ou pelo flake do Nix](/download#packages).
download-meta = v{ $version } · Linux, macOS, Windows · [todos os downloads](@releases)

## Download

download-title = Baixar o rox para Linux, macOS ou Windows
    .description = Baixe o rox de graça para Linux, macOS ou Windows. Um binário por plataforma, sem instalador e sem conta. Código aberto sob a AGPL.
    .image-alt = O logo do rox acima da frase em inglês: download for Linux, macOS and Windows

download-h1 = Baixar o rox
    .lede = Um binário por plataforma. Sem instalador, sem conta, e nada rodando em segundo plano quando ele está fechado.

download-released = lançado em { $date }
download-notes = notas da versão
download-missing = Nenhuma build para { $platform } nesta versão. [Veja a página de releases](@releases).

install-linux-1 = Descompacte o tarball em qualquer lugar.
install-linux-2 = Rode `./rox`.
install-macos-1 = Abra o DMG.
install-macos-2 = Arraste o rox para Aplicativos.
install-windows-1 = Descompacte em qualquer lugar.
install-windows-2 = Rode `rox.exe`.
install-windows-caveat = Se o SmartScreen reclamar, escolha Mais informações e depois Executar assim mesmo.

download-packages = Gerenciadores de pacotes
    .body = Dois caminhos que mantêm o rox atualizado junto com o resto do seu sistema.

package-aur =
    .scope = AUR, compila do código
    .body = No AUR como `rox-player`, comantido pelo autor do rox. Qualquer helper de AUR funciona, ou você clona o pacote e roda `makepkg -si` você mesmo.
    .link = rox-player no AUR

package-nix =
    .scope = direto do flake
    .body = O repositório é um flake. O primeiro comando roda o rox sem instalar nada, o segundo o coloca no seu perfil. No NixOS, adicione o flake como input e puxe `packages.default`, ou use o overlay que ele exporta.
    .link = flake.nix

download-cli = Rodando pelo terminal
    .body = Passe arquivos ou pastas para o rox e ele os toca na hora, substituindo o que estava carregado. As pastas se expandem para os arquivos de áudio direto dentro delas.
    .flags = `--enqueue` (ou `-e`) acrescenta à fila em vez de tocar. `--portable` guarda a biblioteca, as configurações e os caches numa pasta `rox-data` ao lado do executável naquela execução. Para continuar portátil entre inícios, deixe um arquivo vazio chamado `portable` ao lado do executável, ou ligue a opção nas configurações de Comportamento.

download-build = Compilando você mesmo
    .body = Com Nix, `nix develop` e depois `cargo run` te dão um ambiente de desenvolvimento com a toolchain do Rust e as bibliotecas que o gpui carrega em tempo de execução. Sem Nix você precisa do Rust estável e das bibliotecas de sistema do gpui pela sua distribuição. A [seção de desenvolvimento do README](@readme-dev) tem a lista completa.

## Espaços de trabalho

workspaces-title = Espaços de trabalho do rox - temas e layouts compartilháveis
    .description = Um espaço de trabalho do rox é um visual inteiro num arquivo compartilhável: layout, paleta, aparência e os shaders que ele roda. Vão de uma homenagem ao Foobar2000 a um player renderizado inteiro em dither de 1 bit.
    .image-alt = O logo do rox acima da frase em inglês: a whole look in one shareable file

workspaces-lede = Um espaço de trabalho é um visual inteiro num arquivo: layout, paleta, aparência e todos os shaders que ele roda, embutidos, para que um visual importado chegue completo. Carregue um pela janela de boas-vindas ou pelas configurações, mude o que quiser e passe o arquivo adiante. Quem receber vê exatamente a mesma coisa. Estes { workspace-count } já vêm com o rox.

workspaces-critters = Como o Critters faz isso
    .body = Um espaço de trabalho carrega os shaders dele embutidos, código e imagens juntos. Assim um visual que renderiza o aplicativo inteiro como uma impressão de 1 bit chega por inteiro, em vez de chegar como referência a um arquivo na máquina de outra pessoa. Nada roda antes de você aprovar. [Shaders e sinais](/music-visualizer).

workspace-default = A cara do rox recém-instalado: superfícies translúcidas, tintura pelas capas desligada.
    .alt = O espaço de trabalho Default do rox: uma grade de capas ao lado de uma playlist com avaliações em estrelas, uma barra de posição em forma de onda âmbar embaixo e abas para biografia, letra e metadados.

workspace-foobar = O layout com o qual este projeto inteiro discute. Opaco, denso, decorações do sistema ligadas, barra de menus onde ela sempre esteve.
    .alt = O espaço de trabalho Foobar do rox: um layout clássico de foobar2000 com barra de menus, colunas de filtro por artista e álbum, uma tabela de faixas densa com contagens de reprodução e avaliações, e a capa no canto inferior esquerdo.

workspace-catrox = O skin CaTRoX de foobar2000 que você conhece e ama, o que começou tudo.
    .alt = O espaço de trabalho CaTRoX do rox: o skin de foobar2000 recriado, com uma renderização circular da capa como CD, uma lista de campos de metadados descendo à esquerda e faixas agrupadas por álbum com pontos de avaliação.

workspace-llama = O WinAmp, do jeito que você lembra e não do jeito que ele era. Tahoma, escuro, sem moldura.
    .alt = O espaço de trabalho Llama do rox: um analisador de espectro pontilhado no estilo Winamp no topo, controles de transporte verdes e uma lista de faixas densa embaixo, sem moldura de janela.

workspace-metro = Painéis planos e linhas folgadas com a tintura pelas capas ligada, então a paleta segue a capa que estiver tocando.
    .alt = O espaço de trabalho Metro do rox: uma grade de capas de álbum ocupando a largura inteira com os títulos embaixo, e à direita um painel de biografia do artista com foto, tags de gênero e contagem de ouvintes.

workspace-phosphor = Monoespaçado em tudo. Consolas, sem capa na reprodução rápida, um terminal que por acaso toca música.
    .alt = O espaço de trabalho Phosphor do rox: verde no preto em monoespaçado do começo ao fim, uma árvore de pastas ao lado de uma tabela de faixas e uma forma de onda verde embaixo, como um terminal que toca música.

workspace-critters = O aplicativo inteiro como uma impressão de 1 bit. Um dither ordenado sobre cada superfície, tons que esmagam com o sub-grave, e uma parede de ruído atrás dos painéis que se move com a música.
    .alt = O espaço de trabalho Critters do rox: a janela inteira renderizada em dither ordenado preto e branco, com uma prateleira curva de capas sobre uma barra de posição, uma fileira de transporte, uma tira de forma de onda e uma tabela de faixas, tudo em cima de um campo de ruído que se desloca.

workspace-diffuse = Só o álbum que está tocando, sobre um banho suave da própria capa dele. Monocromático de propósito, para que a cor venha da imagem, e a biblioteca espera numa gaveta na borda direita.
    .alt = O espaço de trabalho Diffuse do rox: uma capa de álbum grande preenchendo a esquerda da janela contra um gradiente desfocado da mesma imagem, com o título, o artista e o álbum ao lado sobre uma linha fina de posição, uma fileira de botões de transporte e um controle de volume.

## Mais

more-title = Mais sobre o rox
    .description = As páginas que ficam fora da navegação principal: a comparação com o Foobar2000, o que olhar num player de música para uma coleção local, e como o rox funciona em cada um dos três: Linux, macOS e Windows.

more-lede = As páginas que não cabem na navegação, guardadas em algum lugar fácil de achar em vez de apagadas.

more-why = Por que elas estão aqui
    .p1 = Estas páginas existem para serem encontradas. Quem procura uma alternativa ao Foobar2000 no Linux em { $year }, ou tenta descobrir qual player sobrevive a uma coleção deste tamanho, precisa cair em algum lugar que responda. Não numa página inicial escrita para quem já sabe o que o rox é.
    .p2 = Elas estão fora da navegação de propósito. O site principal são três páginas: o que o rox é, como conseguir, com que cara ele fica. Empilhar o resto no cabeçalho deixaria mais difícil achar aquilo que você veio buscar, e essa é uma troca ruim para todo mundo que chegou já sabendo.
    .p3 = Talvez você já saiba tudo isso sobre o rox e o Foobar2000. Muita gente que chega aqui não sabe, e é para essas pessoas que estas páginas existem. Cada uma diz onde o rox perde, e não só onde ele ganha, e nenhuma repete o que você já leria na [página inicial](/).

more-pages = As páginas
more-closer = Se você preferir pular tudo isso, a [página de download](/download) está a dois cliques de um player rodando, e o [código](@repo) é a documentação mais honesta daqui.

## As páginas fora da navegação

page-foobar2000-alternative = A alternativa ao Foobar2000
    .blurb = O que o Foobar2000 acertou, onde ele te deixa na mão, e o que o rox faz a respeito. Inclui os pontos em que o Foobar2000 ainda está na frente.

page-catrox = CaTRoX, reconstruído nativo
    .blurb = O tema de foobar2000 que começou isto tudo, quem o fez, e o que foi preciso para colocar aquele visual para rodar sem Windows por baixo.

page-nekorox = NekoRoX, e para onde ele foi
    .blurb = O fork do CaTRoX que mantive por uma década, por que parou, e quais painéis dele existem no rox hoje. Inclui o AlphaRoX, o claro.

page-music-visualizer = A visualização, e a camada por baixo dela
    .blurb = Painéis de espectro e forma de onda, shaders WGSL sobre qualquer painel ou sobre a janela inteira, e os sinais nomeados tirados do áudio que movem tudo isso.

page-cue-sheets = Rips em FLAC e CUE
    .blurb = Uma imagem de disco inteiro e o sheet dela, indexados como faixas de verdade que buscam, ordenam, fazem scrobble e emendam sem intervalo umas nas outras.

page-mp3tag-alternative = Uma alternativa ao Mp3tag para Linux
    .blurb = Edições em lote, uma grade por arquivo, e um caminho de escrita que copia, verifica e renomeia em vez de mexer nos seus arquivos no lugar.

page-musicbee-alternative = Uma alternativa ao MusicBee
    .blurb = O que o MusicBee faz e o rox não faz, o que o rox faz e o MusicBee não consegue, e por que a resposta honesta depende do seu sistema operacional.

page-replaygain = ReplayGain, e o que ele custa
    .blurb = O que o ReplayGain realmente faz, ganho de faixa contra ganho de álbum, medir os arquivos que ninguém etiquetou, e por que ligar isso significa abrir mão do bit-perfect.

page-best-music-player = O melhor player de música para uma coleção local
    .blurb = O que de fato separa os players quando sua coleção é grande de verdade, e como o campo se sai numa coleção de 50.000 faixas.

page-linux = rox no Linux
    .blurb = AUR e Nix, Wayland e X11, saída exclusiva por ALSA, teclas de mídia via MPRIS, e a tabela de benchmarks em que só há players de Linux.

page-windows = rox no Windows
    .blurb = Um zip sem instalador, modo portátil, saída exclusiva por WASAPI, e uma leitura honesta sobre competir com o Foobar2000 no terreno dele.

page-macos = rox no macOS
    .blurb = Apple Silicon, assinado e notarizado, menus na barra do sistema, saída exclusiva por CoreAudio.

## Não encontrado

notfound-title = Página não encontrada
    .description = Essa página não existe no rox.music.
notfound-h1 = Não tem nada aqui
notfound-nav = Recuperação

## As três páginas de plataforma, moldura comum

platform-breadcrumb = rox no { $platform }
platform-limits = O que ele não consegue fazer no { $platform }
platform-closer = Aponte para a sua coleção
    .body = Livre e de código aberto sob a AGPL. Sem conta, e nada rodando em segundo plano quando ele está fechado.
platform-more = Mais sobre [com que cara ele fica](/workspaces), a [comparação completa com o Foobar2000](/foobar2000-alternative), ou o que a saída exclusiva lá em cima realmente faz, em [ReplayGain e bit-perfect](/replaygain).

## Linux

linux = rox - um player de música nativo para Linux
    .description = Um player de música nativo de Linux para coleções locais grandes. No AUR e como flake do Nix, Wayland e X11, saída exclusiva por ALSA, teclas de mídia via MPRIS, e menos de um segundo até a janela abrir com 50.000 faixas.
    .h1 = Um player de música para Linux que foi feito para o Linux
    .lede = Não é um port, não é um empacotamento em Electron, e não é o Foobar2000 no Wine. É um binário nativo que trata o Linux como alvo de primeira classe, e não como o terceiro da fila.
    .aside = Saída exclusiva que devolve com o que a placa realmente concordou, em vez do que você pediu. E um visual que você monta aqui e entrega para alguém no Windows. Se é desse tipo de coisa que o Linux vinha te deixando sem, é aqui que ela mora.
    .siblings = O mesmo player no [Windows](/windows) e no [macOS](/macos).

linux-why = O problema para o qual ele foi escrito
linux-why-1 = Os bons players de Linux abrem mão de algo cada um. O tagging do Tauon é raso. O Strawberry não deixa você montar a interface. Ninguém montaria um tema para o Quod Libet. A combinação de painéis, tagging profundo e uma cultura de temas ao mesmo tempo está presa no Windows há vinte anos.
linux-why-2 = Rodar essa combinação pelo Wine funciona até parar de funcionar. Um skin como o CaTRoX se sustenta em gambiarras empilhadas e, em alguns pontos, no Internet Explorer renderizando dentro de painéis. Por uma camada de tradução fica óbvio o quanto disso é sorte, e cada atualização do sistema é uma chance de descobrir.
linux-why-3 = O rox é esse formato escrito de forma nativa: uns quarenta tipos de painel que você mesmo arruma, edição de tags em que dá para confiar com uma coleção de verdade, e temas que viajam como um arquivo único.

linux-install = Instalando
linux-install-1 = No Arch ele está no AUR como `rox-player`, comantido pelo autor. Qualquer helper funciona, ou você clona e roda `makepkg -si` você mesmo.
linux-install-2 = O repositório também é um flake, então Nix e NixOS o pegam sem passo de empacotamento. O primeiro comando roda o rox sem instalar nada, o segundo o coloca no seu perfil.
linux-install-3 = Em todo o resto, descompacte o tarball e rode `./rox`. Um binário, sem instalador, nada deixado para trás quando você apaga.

linux-display = Wayland e X11
linux-display-1 = Os dois, nativamente, pelo gpui. As decorações de janela são uma configuração por espaço de trabalho, e não uma decisão de tempo de compilação. Dá para rodar decorações do servidor num layout e um sem borda no seguinte, sem reiniciar em outra build.

linux-alsa = Saída exclusiva por ALSA
linux-alsa-1 = O modo exclusivo abre a placa direto como `hw:CARD=x,DEV=n`. Esse é o único nome de ALSA sem dmix, sem plug e sem servidor de som em lugar nenhum do caminho, e é isso que faz dele a única rota que recusa uma taxa que não consegue em vez de reamostrar caladinha para outra coisa.
linux-alsa-2 = A troca é a honesta: enquanto o rox segura a placa em modo exclusivo, ele a segura mesmo. Nada mais no sistema toca por aquele dispositivo até você parar. O rox te diz com o que o hardware realmente concordou, em vez do que você pediu, então uma divergência aparece como número e não como suspeita.
linux-alsa-3 = O modo compartilhado é o padrão e se comporta como qualquer outro programa na sua área de trabalho.

linux-desktop = Integração com a área de trabalho
linux-desktop-1 = As teclas de mídia e o aviso de faixa tocando passam por um serviço MPRIS de verdade. O playerctl, os widgets de mídia do GNOME e do KDE, e qualquer outra coisa que fale `org.mpris.MediaPlayer2` enxergam tudo sem configuração.
linux-desktop-2 = O ícone da bandeja vai para o barramento por StatusNotifierItem, e é isso que torna o fechar-para-a-bandeja seguro: se não houver nenhum host SNI rodando para recebê-lo, fechar a última janela encerra o programa em vez de deixar um processo sem interface do qual você não consegue voltar.

linux-benchmarks = Os benchmarks são só de players de Linux
linux-benchmarks-1 = A tabela de comparação deste site foi rodada no Linux contra software de Linux: Elisa, fooyin, Quod Libet, Strawberry, Museeks e Tauon, todos numa máquina só com a mesma coleção de 50.000 faixas. O rox coloca uma janela na tela em 0,3 segundo e estabiliza em 134 MB. O mais leve depois dele que chega a terminar de carregar usa quase o triplo de memória.

linux-limit-arch = Só x86_64. Não existe build de Linux para aarch64, então placas ARM e Asahi precisam compilar do código.
linux-limit-plugins = Sem API de plugins, então nada aqui substitui um componente específico do Foobar2000 do qual você depende.

## Windows

windows = rox - um player de música para Windows sem instalador
    .description = Um player de música nativo de Windows para coleções locais grandes. Um zip sem instalador, modo portátil, saída exclusiva por WASAPI, edição profunda de tags e painéis que você mesmo monta.
    .h1 = Um player de música para Windows, de alguém que saiu do Windows
    .lede = O Windows é a casa do Foobar2000 e ele é muito bom lá. Esta página é honesta quanto a isso, e quanto aos motivos específicos pelos quais você ainda pode querer o rox.
    .aside = O que quer que você monte aqui é um arquivo só, e ele abre igual na máquina Linux ou Mac do lado. Se um setup em que você gastou um fim de semana já ficou preso num sistema operacional, essa é a parte que vale uma tarde.
    .siblings = O mesmo player no [Linux](/linux) e no [macOS](/macos).

windows-awkward = Vamos começar pela parte constrangedora
windows-awkward-1 = Se você usa Windows, seu Foobar2000 está configurado do jeito que você gosta e está estável há anos, o rox não é uma melhoria. O Foobar2000 tem duas décadas de componentes, uma pegada menor e nenhuma surpresa sobrando. Fingir o contrário numa página como esta seria um jeito fácil de desperdiçar a sua tarde.
windows-awkward-2 = Os motivos para olhar mesmo assim são poucos e reais. Você quer o mesmo player e o mesmo layout na máquina Linux ou Mac que também usa. Você quer que o código seja legível e a licença seja a AGPL, em vez de freeware fechado. Ou você quer um jeito de fazer temas em que um visual inteiro é um arquivo que dá para mandar para alguém, e não uma pasta de componentes, configurações e scripts que só se remonta na sua máquina.

windows-install = Instalando
windows-install-1 = Descompacte em qualquer lugar e rode `rox.exe`. Não tem instalador, não tem serviço, não tem entrada de desinstalação e não fica nada rodando em segundo plano depois de fechado.
windows-install-2 = O modo portátil guarda a biblioteca, as configurações e os caches numa pasta `rox-data` ao lado do executável, então a coisa toda cabe num pendrive. Passe `--portable` para uma execução, ou deixe um arquivo vazio chamado `portable` ao lado do executável para valer sempre.
windows-install-3 = O binário não é assinado, então o SmartScreen vai reclamar da primeira vez. Mais informações, depois Executar assim mesmo. Certificados de assinatura custam um dinheiro que um player gratuito não tem, e dizer isso é melhor do que fingir que o aviso é um bug.

windows-wasapi = Saída exclusiva por WASAPI
windows-wasapi-1 = O modo exclusivo toma o endpoint em WASAPI exclusive, o que coloca a taxa e a profundidade de bits do próprio arquivo na frente do conversor, sem nada no meio. O rox informa de volta o que o dispositivo realmente aceitou, então, se o hardware recusou seus 192 kHz caladinho, você descobre por uma leitura na tela e não por uma discussão de fórum.
windows-wasapi-2 = Enquanto ele segura o endpoint, nada mais na máquina toca por aquele dispositivo. É isso que exclusivo quer dizer, e é por isso que não é o padrão.

windows-integration = O resto da integração com o Windows
windows-integration-1 = As teclas de mídia e a sobreposição com a faixa tocando passam pelo SMTC, a mesma superfície de sistema que os aplicativos internos usam, então o painel da tecla de volume mostra a faixa e os botões de transporte funcionam.
windows-integration-2 = Tem ícone de bandeja com fechar-para-a-bandeja, então fechar a última janela deixa a música tocando em vez de encerrá-la, e o ícone é o caminho de volta. Um espaço de trabalho também pode tirar a moldura da janela, ou manter a moldura e abrir mão só da borda de redimensionamento, o que deixa a sombra, os snap layouts e o Win+seta intactos e sacrifica apenas o arraste pela borda.

windows-limit-instance = Sem trava de instância única. No Linux e no macOS um segundo início entrega os arquivos dele ao rox que já roda; no Windows ele abre uma segunda cópia.
windows-limit-signing = Só x86_64, e o binário não é assinado, então conte com o SmartScreen uma vez.
windows-limit-plugins = Sem API de plugins, então um componente específico do Foobar2000 não tem equivalente aqui.

## macOS

macos = rox - um player de música nativo para macOS
    .description = Um player de música nativo de macOS para coleções locais grandes. Apple Silicon, assinado e notarizado, menus na barra do sistema, saída exclusiva por CoreAudio, e edição profunda de tags.
    .h1 = Um player de música nativo para macOS
    .lede = O Foobar2000 tem uma build de Mac de verdade agora. O que ele não tem no Mac é o motivo pelo qual as pessoas o configuravam no Windows.
    .aside = Menus onde o macOS os coloca, uns quarenta tipos de painel para arrumar como quiser, e { workspace-count } visuais completos a um clique na janela de boas-vindas. Se configurar o player é a parte de que você realmente gosta, é isso que tem aqui.
    .siblings = O mesmo player no [Linux](/linux) e no [Windows](/windows).

macos-gap = A lacuna especificamente no Mac
macos-gap-1 = O Foobar2000 v2 traz uma versão oficial de macOS, e esta página não vai fingir que não. O detalhe é que o ecossistema de componentes e skins, aquilo que fez uma instalação de Windows valer um fim de semana de configuração, é do lado Windows. Num Mac você fica com o player sem o ecossistema que justificava escolhê-lo.
macos-gap-2 = O rox devolve a montagem e os temas: uns quarenta tipos de painel arrumados como você quiser, duplicados com configurações próprias, destacados em janelas de verdade, e um visual inteiro guardado como um arquivo compartilhável. Um dos { workspace-count } espaços de trabalho que já vêm com o rox é uma recriação do CaTRoX, o que é uma declaração justa do que ele mira.

macos-install = Instalando
macos-install-1 = Abra o DMG e arraste o rox para Aplicativos. As versões são assinadas com um Apple Developer ID e notarizadas, então o Gatekeeper deixa abrir sem a dancinha do clique-direito-abrir nem uma ida ao painel de segurança.

macos-native = Ele se comporta como um aplicativo de Mac
macos-native-1 = Os menus ficam na barra de menus do sistema, onde o macOS espera encontrá-los, e não numa barra desenhada dentro da janela. O botão verde faz tela cheia nativa, e segurar Option te dá zoom no lugar.
macos-native-2 = Fechar a última janela deixa o rox no dock em vez de encerrá-lo, que é a convenção da plataforma e a metade macOS do comportamento de fechar-para-a-bandeja.

macos-coreaudio = Saída exclusiva por CoreAudio
macos-coreaudio-1 = O modo exclusivo dirige o dispositivo pelo CoreAudio na taxa do próprio arquivo, e informa com o que o hardware concordou em vez do que foi pedido. Útil principalmente se você tem um DAC que vale o trabalho, e desligado por padrão porque tirar um dispositivo do resto do sistema deveria ser uma decisão tomada de propósito.

macos-limit-silicon = Só Apple Silicon. Não existe build para Intel, então um Mac Intel precisa compilar do código.
macos-limit-xcode = Compilar do código precisa do Xcode, com nix ou sem: o gpui compila shaders Metal em tempo de build e o nix não consegue distribuir a toolchain Metal da Apple.
macos-limit-plugins = Sem API de plugins, então um componente específico do Foobar2000 não tem equivalente aqui.

## Melhor player de música para uma coleção local

best-breadcrumb = Melhor player de música
best-title = O melhor player de música para uma coleção local em { $year }
    .description = Aplicativos de streaming e players de biblioteca são julgados por coisas diferentes. Cinco critérios que de fato separam os players de desktop quando sua coleção é grande de verdade, medidos em 50.000 faixas.

best-lede = Não é o melhor aplicativo de música. Esses são clientes de streaming e são julgados por catálogo e preço. Aqui a pergunta é menor: qual player de desktop aguenta quando a música já está no seu disco e tem muita dela.

disclosure = Divulgação
best-disclosure = O rox é um dos players desta comparação e este é o site dele, então leia os critérios primeiro e os números depois. Os cinco valem independentemente de você acabar baixando qualquer coisa.

best-criteria = Cinco coisas que de fato os separam

best-criterion-size = Ele tem que sobreviver ao tamanho da sua coleção
    .body = A maioria dos players é demonstrada com algumas centenas de álbuns. As falhas interessantes começam nas dezenas de milhares, onde escanear leva uma noite, a rolagem trava e a memória sobe até algo ceder. Este é o único critério que você não consegue avaliar por uma captura de tela, e é o que decide se daqui a um ano você ainda vai estar usando a coisa.

best-criterion-read = Ele tem que ler suas tags direito
    .body = Passar o olho no cabeçalho te dá um nome de faixa e uma duração errada. Ler fundo significa tags completas, durações reais, e o codec, a taxa de amostragem e a profundidade de bits de cada arquivo. Significa também que arquivos com tags quebradas são indexados em vez de sumirem em silêncio, porque uma biblioteca que perde 300 arquivos caladinha é pior que uma que admite.

best-criterion-write = Ele tem que deixar você escrever as tags de volta
    .body = Uma coleção que foi curada é uma coleção que é editada. Edições em lote, escritas atômicas para que uma queda não trunque um arquivo, e avaliações guardadas nos próprios arquivos, e não num banco de dados que você não consegue levar embora.

best-criterion-layout = O layout tem que ser seu
    .body = O gosto aqui é realmente pessoal, e é esse o argumento a favor da montagem em vez de um bom padrão. Painéis que você arruma, duplica com configurações próprias e destaca em janelas de verdade batem qualquer layout único que outra pessoa escolheu.

best-criterion-yours = Ele tem que ser seu para ficar
    .body = As coleções locais são aquilo para onde as pessoas voltam quando um serviço tira um álbum do ar ou muda os termos. Um player que responde a isso com conta, telemetria ou assinatura perdeu o sentido daquilo que está tocando.

best-measured = Como o primeiro fica quando medido
    .body = Sete players, uma coleção de 50.000 faixas, uma máquina, uma bancada. O tempo de início e o custo em repouso são as partes que você sente todo santo dia.

best-shortlist = A lista curta honesta
    .p1 = Se você está no Windows e já usa o [Foobar2000](/foobar2000-alternative), você tem a resposta e a tem há vinte anos. Nada nesta página bate um Foobar2000 que funciona na plataforma dele.
    .p2 = Se você quer algo com um grande ecossistema de plugins e um longo histórico no Linux, Quod Libet e Strawberry são respostas de verdade, e os dois demoram mais para carregar uma coleção deste tamanho do que são agradáveis depois de carregada. Se o critério de tagging é o que realmente te interessa, isso está escrito à parte como [alternativa ao Mp3tag](/mp3tag-alternative), e o lado da sonoridade do critério um está em [ReplayGain](/replaygain).
    .p3 = O rox é a resposta se você quer o formato do Foobar2000 nativamente no Linux ou no macOS: painéis que você monta, tagging profundo, temas como arquivos únicos compartilháveis, e um player que coloca uma janela na tela em menos de um segundo com uma coleção deste tamanho. Ele é novo, e não tem API de plugins. Os dois são custos reais.
    .aside = Os cinco critérios acima são o piso, e não o teto. As avaliações vão para os próprios arquivos por FMPS e POPM, e não para um banco de dados que você não pode levar. Os gêneros com vários valores são unificados como uma opinião da biblioteca, sem reescrever as suas tags. Se é esse tipo de coisa que você vinha querendo de uma biblioteca, é este que você aponta para o seu disco.

best-closer = Meça contra a sua própria coleção
    .body = O benchmark que importa é o que está no seu disco. Livre e de código aberto, sem conta, sem instalador.

## MusicBee

musicbee-breadcrumb = Alternativa ao MusicBee
musicbee-title = Uma alternativa ao MusicBee para Linux e macOS em { $year }
    .description = O MusicBee só existe para Windows. O rox é um player nativo para coleções locais grandes em Linux, macOS e Windows, com tagging profundo e um layout que você mesmo monta. Inclui o que o MusicBee ainda faz melhor.

musicbee-h1 = Uma alternativa ao MusicBee que não é só de Windows
    .lede = De uma máquina Linux ou Mac, o problema do MusicBee é que ele é excelente e não está lá. Esta página é sobre o que realmente vem junto e o que não vem.

musicbee-good = No que o MusicBee é bom
    .p1 = Amplitude. Ele gerencia uma coleção grande direito, dá conta de playlists automáticas e automação de fila, sincroniza com aparelhos portáteis, faz podcasts e rádio pela internet, converte formatos, e dá para trocar o visual dele por algo que você goste de olhar. É gratuito, é polido, e para muita gente é o último player de música que precisou instalar.
    .p2 = Ele também roda no Windows e em lugar nenhum além. O Wine te dá uma versão dele, com a ressalva de sempre: funciona até uma atualização decidir o contrário.

musicbee-gaps = O que o rox não faz
    .body = Isto primeiro, porque é a parte que decide a questão para muita gente, e enterrar isso desperdiçaria seu tempo.
    .close = Quatro coisas reais, e a lista não foi enchida para parecer honesta. Se duas delas fazem parte de como você usa um player, pare por aqui.

musicbee-gap-sync = **Sem sincronização com aparelhos.** Se você passa música para um celular ou um DAP pelo seu player, o rox não tem resposta nenhuma.
musicbee-gap-radio = **Sem podcasts nem rádio pela internet.** O rox toca arquivos do seu disco.
musicbee-gap-plugins = **Sem API de plugins.** O que você resolveria com um complemento precisa já existir.
musicbee-gap-ffmpeg = **A conversão precisa do ffmpeg.** O rox converte entre formatos, mas ele dirige um ffmpeg que você instalou em vez de trazer um codificador próprio, e não recodifica no caminho para um aparelho porque não existe sincronização para a qual recodificar.

musicbee-transfers = O que vem junto, e o que é melhor
    .p1 = A biblioteca aguenta o tamanho que os usuários de MusicBee costumam ter. Um scanner paralelo lê as tags completas, as durações reais e o codec, a taxa de amostragem e a profundidade de bits de cada arquivo, sem passar o olho nos cabeçalhos, e arquivos com tags ilegíveis são indexados pelo nome em vez de desaparecerem em silêncio. A edição de tags é um editor de verdade, com edições em lote, uma grade por arquivo, e um [caminho de escrita que copia e verifica](/mp3tag-alternative) em vez de modificar os originais no lugar.
    .p2 = A interface é a diferença maior. O MusicBee te dá um bom layout e alguma troca de visual; o rox te dá uns quarenta tipos de painel que você mesmo arruma, duplica com configurações próprias e destaca em janelas de verdade do sistema. Um visual inteiro é um arquivo com layout, paleta e aparência, ou seja, o arranjo em que você parar é algo que dá para entregar a outra pessoa, ou levar para a sua outra máquina, em vez de algo que vive numa instalação só.
    .p3 = As playlists automáticas vêm junto. Uma playlist inteligente no rox é uma consulta salva escrita na mesma sintaxe que o campo de busca usa, com ordenação e limite opcionais, e ela roda de novo a cada atualização do painel em vez de segurar um retrato velho. O editor mostra a prévia do que a consulta pega enquanto você digita, então você descobre que escreveu a regra errada antes de salvá-la com um nome.
    .p4 = A automação de fila também está aqui: o rox reabastece a fila quando ela seca, a partir da sua ordem de navegação, das faixas que você nunca chega a ouvir, ou de como soa a faixa atual. Essa última vem da análise dos seus arquivos na sua própria máquina, então funciona numa coleção de que ninguém na internet nunca ouviu falar.

musicbee-size = A questão do tamanho
    .body = O MusicBee não está nesta tabela porque os benchmarks foram rodados no Linux, onde ele não roda. A tabela está aqui como resposta para “a alternativa aguenta uma coleção do meu tamanho?”, medida em 50.000 faixas.

musicbee-split = A divisão honesta
    .p1 = Vai ficar no Windows com um MusicBee que sincroniza seu celular e o alimenta com podcasts? Nada aqui substitui isso, e trocar te custaria dois recursos dos quais o rox não tem versão nenhuma.
    .p2 = Está indo para o Linux ou para um Mac, ou já está lá olhando a lacuna que o MusicBee deixou? É exatamente por isso que isto existe, e a troca é específica: você abre mão de sincronização e podcasts, e ganha um player nativo com tagging mais profundo, um layout que você mesmo monta, e uma biblioteca que continua rápida com cinquenta mil faixas.
    .aside = Destacar um painel numa janela própria do sistema, ou entregar seu layout inteiro para alguém como um arquivo só, não são linhas numa comparação de recursos, porque não há nada do outro lado para comparar. Se é atrás disso que você estava, o rox é onde isso está.

musicbee-closer = Experimente na sua própria coleção
    .body = Livre e de código aberto sob a AGPL, sem conta e sem instalador. Tem uma [comparação com o Foobar2000](/foobar2000-alternative) também, se é esse o setup que você está deixando de verdade.

## CaTRoX

catrox-title = CaTRoX, reconstruído como player nativo
    .description = O tema CaTRoX de foobar2000, quem o construiu, e o que foi preciso para colocar aquele visual rodando nativamente no Linux e no macOS sem Windows nem Wine por baixo.

catrox-h1 = CaTRoX, sem Windows por baixo
    .lede = O rox já vem com um espaço de trabalho CaTRoX. Esta é a página sobre o porquê, e sobre as pessoas em cujo trabalho ele se apoia.

catrox-credit = Crédito onde é devido
    .body = O CaTRoX é um tema de foobar2000. O design e o esquema de cores originais são do eXtremeHunter1972, e a edição que a maioria das pessoas realmente usou é o [CaTRoX_QWR](https://theqwertiest.github.io/CaTRoX_QWR/), reconstruído e mantido pelo TheQwertiest. O rox não tem ligação com nenhum dos dois, e nada aqui é código deles. O espaço de trabalho abaixo é uma recriação de um visual que eles fizeram.

catrox-was = O que o CaTRoX era
    .p1 = Um layout denso, escuro e voltado a informação para o foobar2000: a capa renderizada como um CD, uma lista de campos de metadados de um lado, faixas agrupadas por álbum com pontos de avaliação, e uma barra de menus exatamente onde uma barra de menus fica. É a coisa que as pessoas querem dizer quando falam que o foobar2000 pode ficar bonito, e é a maior parte do motivo pelo qual alguém aguentou configurar o foobar2000 para começar.
    .p2 = Ele nunca foi um skin no sentido que um player de música normalmente dá à palavra. O CaTRoX é uma pilha de componentes, scripts de painel e configuração, montada. Foi isso que o tornou poderoso, e é isso também que o torna difícil de mover, difícil de compartilhar e fácil de quebrar.

catrox-nekorox = Onde o NekoRoX entrou
    .p1 = O autor do rox manteve um fork dele por anos. O [NekoRoX](/nekorox) era o CaTRoX com um monte de painéis próprios, plugins e módulos de conveniência por cima: navegação por árvore e por filtros, modos mini e micro player, um painel de letra sincronizada, um cover flow, presença no Discord, ferramentas de Last.fm. Hoje tem um aviso no topo do README dizendo que não é mais mantido, e apontando para cá.
    .p2 = O motivo desse aviso é o conteúdo honesto desta página. Mudar para o Linux em tempo integral significou rodar a montagem inteira pelo Wine, e uma pilha sustentada por gambiarras empilhadas, em alguns pontos renderizando Internet Explorer dentro de painéis, não gosta nada de uma camada de tradução. Rodava. Também parecia estar a uma atualização de parar, para sempre, com uma década de configuração dentro.

catrox-recreation = A recriação
    .body = O espaço de trabalho CaTRoX no rox é aquele layout reconstruído a partir de painéis nativos: a renderização circular da capa, a lista de campos de metadados, a lista de faixas agrupada por álbum com os pontos de avaliação, a barra de menus. É um visual reproduzido, não um port de nada. Nada do código do CaTRoX existe no rox e nem poderia, já que o rox é Rust sobre [gpui](@gpui) e o CaTRoX são scripts de painel rodando dentro do foobar2000. A discussão maior com o foobar2000, inclusive as linhas em que ele ainda está na frente, está [na página dele](/foobar2000-alternative).
    .after = O que mudou foi o que custa ter isso. No rox um visual inteiro é um arquivo único guardando layout, paleta e aparência juntos, então o espaço de trabalho CaTRoX é um clique na janela de boas-vindas, e o que você constrói a partir dele é um arquivo que dá para entregar a outra pessoa. Sem lista de componentes, sem ordem de instalação, sem configuração que só se remonta na máquina em que foi construída.

catrox-shot-alt = O espaço de trabalho CaTRoX no rox: uma renderização circular da capa como CD, uma lista de campos de metadados à esquerda com título, artista, álbum, codec e bitrate, e faixas agrupadas por álbum com pontos de avaliação à direita.

catrox-limits = O que você não recupera
    .aside = O que você ganha no lugar é um layout que abre no Linux e no macOS sem Wine chegando perto, sobrevive a uma atualização do sistema, e viaja como um arquivo só. Depois de uma década mantendo o original, essa troca é o motivo inteiro de o rox existir.

catrox-limit-panels = Nem todo painel do CaTRoX tem equivalente. O rox tem uns quarenta tipos de painel próprios e não são os mesmos quarenta.
catrox-limit-youtube = Sem reprodução do YouTube. CaTRoX e NekoRoX tinham isso por componentes; o rox toca o que está no seu disco.
catrox-limit-plugins = Sem API de plugins, então o que você resolveria com um componente do foobar2000 precisa já existir no rox ou não existe de jeito nenhum.
catrox-limit-fidelity = É uma recriação feita de fora. Os detalhes diferem, e uma correspondência pixel a pixel nunca foi o objetivo.

# $others é a quantidade de espaços de trabalho que vêm com o rox menos este
# aqui. Já foi o literal "Cinco", que deixou de ser verdade dois espaços de
# trabalho atrás.
catrox-closer = Experimente
    .body = O espaço de trabalho CaTRoX já vem com o rox, a um clique na janela de boas-vindas. Outros { $others } também, incluindo um [layout Foobar e um com cara de WinAmp](/workspaces).

## Cue sheets

cue-breadcrumb = Cue sheets
cue-title = Tocando rips em FLAC e CUE, uma faixa por vez
    .description = Uma imagem de disco inteiro ao lado de um cue sheet, indexada como faixas de verdade: cada trecho busca, ordena, faz scrobble e emenda sem intervalo no seguinte, e suas playlists nunca ficam sabendo que três linhas dividem um arquivo.

cue-h1 = Cue sheets, e rips que se comportam como álbuns
    .lede = Se você ripou CDs antes de dividir virar o padrão, um pedaço da sua coleção é um FLAC por disco com um arquivo de texto ao lado. A maioria dos players ou ignora o sheet, ou trata o que ele descreve como coisa de segunda classe. Eis o que o rox faz com isso.

cue-what = O que um rip em cue realmente é
    .p1 = Um arquivo de áudio com um disco inteiro dentro, e um sheet `.cue` listando onde cada faixa começa. É o jeito fiel de preservar um CD, porque as pausas entre as faixas fazem parte do disco e dividir joga isso fora. É também o formato que quebra a premissa sobre a qual toda biblioteca de música é construída: a de que um arquivo é uma faixa.
    .p2 = Os players resolvem isso de uma entre três maneiras. Ignorar o sheet e mostrar uma faixa de setenta minutos. Mostrar as faixas do sheet, mas mantidas separadas da biblioteca de verdade, de modo que busca, ordenação e playlists se comportam diferente com elas. Ou levar a quebra a sério e absorvê-la de uma vez.

cue-rows = Linhas de verdade, não fragmentos
    .p1 = O rox indexa cada trecho do sheet como uma linha comum da biblioteca, identificada pelo arquivo dela mais o número da faixa. Tudo lá adiante lê aquilo como uma faixa, porque para tudo lá adiante é uma faixa. As playlists a registram, as audições grudam nela, a busca a encontra, as colunas de ordenação a ordenam, e nenhuma delas sabe que onze linhas apontam para o mesmo FLAC.
    .p2 = A alternativa que a maioria das implementações escolhe é um caminho sintético, `album.flac#3`, que mantém o banco de dados arrumado e passa o problema para cada pedaço de código que depois abrir aquele caminho. Um corte esquecido ali é um bug silencioso que lê bytes de tag do nada. Uma coleção sem cue sheet nenhum não paga nada por isso: os trechos vivem numa tabela lateral, e nada nos caminhos quentes os lê.

cue-playing = Tocando um trecho como um arquivo
    .p1 = A engine trata um trecho como o mundo inteiro daquela faixa: uma busca precisa até o começo dele, um corte com precisão de amostra nas duas pontas, e um limite de fim que toma o mesmo caminho de um fim de arquivo de verdade. Reprodução sem intervalo, crossfade, parar depois da atual e repetir funcionam todos sem saber que trechos existem.
    .p2 = O corte da cabeça é o detalhe que importa. Uma busca precisa cai num limite de pacote e não na amostra exata. Sem descartar os quadros entre a aterrissagem e o começo do trecho, toda faixa abre com o rabo da anterior. É esse o som de uma implementação de cue que ninguém terminou.
    .p3 = Faixas consecutivas de um rip dividem um grupo de álbum, e é isso que impede o crossfade de passar por cima das emendas sem intervalo do próprio disco. Um rip toca como o disco de onde foi cortado.

cue-scanning = Escaneando, e mudando de ideia
    .p1 = O sheet reivindica a imagem dele. Enquanto um cue lista um arquivo, aquele arquivo não ganha linha própria, então você não acaba com onze faixas mais uma duplicata de setenta minutos. A atualidade se guia por qual dos dois foi modificado por último, então editar o sheet ou o áudio recorta o rip na próxima varredura. Apague o sheet e a imagem volta a ser uma única linha comum.
    .p2 = Os metadados preferem o sheet e caem nas tags da própria imagem. Sheets escritos antes de a disciplina de UTF-8 existir ganham um fallback em cp1252, porque rips antigos são exatamente o público para o qual este recurso existe.

cue-ratings = Avaliações que não carimbam o disco inteiro
    .p1 = O rox normalmente escreve as avaliações nos próprios arquivos, o que é o certo quando um arquivo é uma faixa. Num rip em cue não é: a imagem pertence às onze faixas, então uma escrita por faixa carimbaria todas elas com as mesmas estrelas.
    .p2 = O escritor recusa a metade em arquivo para essas linhas e o banco de dados guarda o valor. O mesmo vale para edições de tag. Você fica com avaliações por faixa num rip, e sua imagem sai disso idêntica byte a byte.

cue-outstanding = De fora, por enquanto
    .body = Os picos da forma de onda e a passagem de análise acústica ainda leem a imagem inteira em vez do trecho. As letras são por arquivo, então um rip divide uma letra só. Medição de ReplayGain por trecho, edição de cue sheet dentro do aplicativo e blocos CUESHEET embutidos em FLAC estão todos sem tratamento. Cada um deles é aditivo sobre a forma como os trechos são identificados, e nenhum muda isso.

cue-later = As partes que você só notaria depois
    .aside = A medida disto não é se um rip toca. É se, um mês depois, alguma coisa na biblioteca ainda se comporta diferente por ter vindo de uma imagem.

cue-later-m3u = A exportação m3u escreve os trechos como `path#N`, e a importação prefere uma correspondência exata de caminho, então uma lista faz a ida e volta por outro software sem colapsar na imagem.
cue-later-scrobble = O scrobbling e o aviso de faixa tocando deduplicam no par, então as onze faixas de um disco viram onze scrobbles em vez de um só, bem comprido.
cue-later-listens = As audições voltam a grudar no trecho certo depois de uma nova varredura, então um disco mantém o histórico de reprodução por faixa mesmo quando todos os trechos carregam tags idênticas.
cue-later-replaygain = Só o par de valores de álbum do ReplayGain é aproveitado. Valores de faixa escritos contra uma imagem de disco inteiro descrevem o disco, então são ignorados em vez de acreditados.

cue-closer = Aponte para a prateleira que você nunca dividiu
    .body = O scanner pega os sheets já na primeira passagem, junto com todo o resto. Mais sobre [o que quebra em escala de biblioteca](/best-music-player).

## Foobar2000

fb-breadcrumb = Alternativa ao Foobar2000
fb-title = Uma alternativa ao Foobar2000 para Linux, macOS e Windows em { $year }
    .description = O Foobar2000 acertou nos layouts de painéis, no tagging profundo e numa comunidade de temas, e deixou a maior parte disso presa no Windows. O rox é um player nativo e de código aberto que leva os três para o Linux e o macOS.

fb-h1 = Uma alternativa ao Foobar2000 que roda em todo lugar
    .lede = O Foobar2000 acertou em três coisas que quase nada mais acerta ao mesmo tempo, e deixou duas delas presas no Windows. O rox é a tentativa de levar as três para o outro lado.

fb-right = O que o Foobar2000 acertou
    .p1 = Uma interface que você monta a partir de painéis, em vez de aceitar o que o desenvolvedor entregou. Uma comunidade de temas em cima disso, que é como CaTRoX, [NekoRoX](/nekorox) e Georgia existem. E gerenciamento de tags e de biblioteca que não cai quando a coleção tem dezenas de milhares de arquivos.
    .p2 = Muitos players fazem uma dessas. Bem poucos fazem duas. A combinação que faz as três é praticamente exclusiva do Windows há vinte anos, e toda tentativa de movê-la significou abrir mão de uma delas.

fb-leaves = Onde ele te deixa na mão
    .p1 = No Linux não existe build oficial do Foobar2000, então as opções honestas são o Wine ou outra coisa. O Wine funciona bem até parar de funcionar. Um skin como o CaTRoX se apoia em gambiarras empilhadas e, em alguns pontos, no Internet Explorer renderizando dentro de painéis, e rodar isso por uma camada de tradução mostra exatamente o quanto se sustenta na sorte. Está sempre a uma atualização do sistema de quebrar.
    .p2 = O macOS está melhor do que era, já que o Foobar2000 v2 traz uma build de Mac de verdade. Mas a parte que as pessoas realmente querem, o ecossistema de componentes e skins que fez a versão de Windows valer um fim de semana de configuração, é do lado Windows. Você fica com o player sem o motivo pelo qual queria o player.
    .p3 = E no próprio Windows não tem nada errado. Isso merece ser dito com todas as letras: se você está no Windows e seu Foobar2000 funciona, o rox não é uma emergência.

fb-does = O que o rox faz a respeito
    .p1 = Nativo nas três plataformas, um binário para cada, escrito em Rust sobre [gpui](@gpui). Uns quarenta tipos de painel que você mesmo arruma, duplica com configurações independentes e destaca em janelas de verdade do sistema. O scanner da biblioteca lê tags completas, durações reais e o codec, a taxa de amostragem e a profundidade de bits de cada arquivo, sem passar o olho nos cabeçalhos, e ele aguenta 50.000 faixas.
    .p2 = A resposta para temas é a parte que mais mudou. Um espaço de trabalho é um arquivo único carregando layout, paleta e aparência juntos. Você edita, você quebra, você entrega para outra pessoa e ela recebe exatamente o que você tinha. Um dos { workspace-count } que já vêm com o rox é uma [recriação do CaTRoX](/catrox), que é a declaração honesta de intenção.

fb-shot-alt = O espaço de trabalho CaTRoX no rox: o skin de foobar2000 recriado nativamente, com uma renderização circular da capa como CD, uma lista de campos de metadados à esquerda e faixas agrupadas por álbum com pontos de avaliação.

fb-table = Lado a lado
    .caption = Foobar2000 e rox comparados em suporte a plataformas, temas, licenciamento e maturidade
    .area = Área
    .method = Três linhas vão para o Foobar2000, e são as três que levariam anos para fechar. Uma tabela de comparação em que uma coluna ganha tudo é anúncio, não comparação.

fb-row-linux = Nativo no Linux
    .fb = Sem build oficial. Só Wine.
    .rox = Primeira classe, x86_64.

fb-row-macos = Nativo no macOS
    .fb = Build oficial desde a v2.
    .rox = Primeira classe, Apple Silicon.

fb-row-windows = Nativo no Windows
    .fb = A casa dele. Vinte e tantos anos disso.
    .rox = Primeira classe, x86_64.

fb-row-panels = Painéis que você monta
    .fb = Sim, pelo Columns UI e afins.
    .rox = Uns quarenta tipos de painel, embutidos, sem componentes para instalar.

fb-row-sharing = Compartilhar um visual
    .fb = Um skin é componentes, configurações e scripts. Famosamente chato.
    .rox = Um arquivo com layout, paleta e aparência.

fb-row-source = Código disponível
    .fb = Freeware de código fechado.
    .rox = AGPL-3.0, tudo.

fb-row-components = Ecossistema de componentes
    .fb = Duas décadas de profundidade. Qualquer coisa que você imaginar.
    .rox = Sem API de plugins.

fb-row-maturity = Maturidade
    .fb = Desde 2002. Ele não te surpreende.
    .rox = Desde 2026. Vai surpreender, de vez em quando.

fb-row-footprint = Pegada
    .fb = Famosamente minúscula.
    .rox = Um binário de 62 MB, 134 MB residentes com 50 mil faixas.

fb-not = Quem não deveria trocar
    .p1 = Se você está no Windows, seus componentes estão configurados e o setup está estável há uma década, não há nada aqui que valha a bagunça. Se você depende de um componente específico do Foobar2000, o rox não tem API de plugins e não consegue substituí-lo. Se você quer um software que já cometeu todos os erros dele, o rox é quatro anos novo demais.
    .p2 = Se você mudou para o Linux e deixou o setup para trás, ou está num Mac segurando um player sem o ecossistema que o justificava, é essa a lacuna em que isto foi construído.
    .p3 = O outro lado de chegar tarde merece ser dito. Nada no rox precisa continuar compatível com uma decisão tomada em 2002, e é assim que um visual inteiro acaba sendo um arquivo compartilhável em vez de um grafo de componentes, que uma base de código cobre as três plataformas, e que uns quarenta tipos de painel já vêm junto em vez de serem montados um download por vez. É também por isso que a identidade de uma faixa nunca ficou presa a caminhos de arquivo, que é o que torna possível, mais adiante, juntar uma coleção local com qualquer outra coisa. A maior parte desses 62 MB é a mesma história.
    .aside = Painéis que se destacam em janelas de verdade do sistema, ou uma paleta que se retinge pela capa que estiver tocando, nunca entraram na tabela acima. Não havia o que colocar na outra coluna. Se são diferenças assim que você procura, o rox é o lugar.

fb-closer = Experimente na sua própria coleção
    .body = Livre, de código aberto sob a AGPL, sem conta e sem instalador. Aponte para a coleção que quebra outros players.
    .fine = Ou leia o [código](@repo) antes. É um jeito razoável de avaliar um player que quer acesso de escrita às suas tags. Ainda pesando? Os [critérios que separam os players de biblioteca](/best-music-player) estão escritos à parte, benchmarks incluídos.

## Mp3tag

mp3tag-breadcrumb = Alternativa ao Mp3tag
mp3tag-title = Uma alternativa ao Mp3tag para Linux e macOS em { $year }
    .description = Edição de tags em lote em FLAC, MP3, MP4 e APE, uma grade por arquivo para as importações bagunçadas, avaliações escritas nos próprios arquivos, e um caminho de escrita que nunca edita um original no lugar.

mp3tag-h1 = Um editor de tags que você pode apontar para dez mil arquivos
    .lede = O Mp3tag é a ferramenta que a maioria das pessoas quer dizer quando fala editor de tags, e não existe build de Linux dele. O rox tem um editor completo dentro, e um caminho de escrita feito para o caso em que um lote é grande o bastante para “geralmente funciona” não bastar.

mp3tag-isnt = Comece pelo que isto não é
    .p1 = O rox é um player de música que contém um editor de tags sério. O Mp3tag é um tagger dedicado, e como tagger dedicado ele é melhor: scripting, ações, strings de formato que você compõe, e vinte anos de arestas aparadas. Se o que você quer é uma ferramenta separada para rodar sobre uma pasta e depois fechar, no Windows, é essa.
    .p2 = O argumento para fazer isso dentro do rox é que etiquetar uma coleção normalmente não é uma tarefa que se termina. É algo que você faz enquanto escuta, no arquivo que acabou de notar que estava errado. Por isso o editor estar preso ao player e à biblioteca é o ponto, e não um meio-termo.

mp3tag-write = O caminho de escrita
    .p1 = Esta é a parte que vale ler mesmo que você nunca instale o rox. A maioria dos escritores de tag modifica seu arquivo no lugar: abre o original, reescreve a região de metadados e torce. Isso dá certo dezenas de milhares de vezes e catastroficamente errado uma, porque uma queda, um disco cheio ou um drive arrancado no meio deixam um arquivo que não abre mais, com o seu áudio dentro.
    .p2 = O rox nunca escreve dentro de um original. Toda edição copia o arquivo, aplica a mudança na cópia, verifica o resultado lendo os metadados de volta e calculando o hash do fluxo de áudio para confirmar que ele é idêntico byte a byte ao que entrou, e só então renomeia a cópia atomicamente por cima do original. Se qualquer passo falhar, a cópia é apagada e seu arquivo fica intocado, porque ele nunca foi aberto para escrita.
    .p3 = Cada arquivo também é isolado, então um arquivo problemático num lote de quatro mil falha sozinho, sem derrubar a execução inteira.

mp3tag-cost = O custo
    .body = Copiar, verificar e renomear significa que toda edição precisa por um instante de espaço livre igual ao tamanho do arquivo, e é mais lento que escrever no lugar. Num lote de alguns milhares de FLACs isso é tempo real e disco real. É a troca que o rox faz de propósito, e é o motivo inteiro de o editor ser seguro de apontar para uma biblioteca em vez de para uma pasta.

mp3tag-batch = Editar um lote sem achatá-lo
    .p1 = Selecione quantas faixas quiser e o editor abre como um formulário compartilhado. Um campo em que todos os arquivos concordam mostra o valor; campos que discordam ficam vazios sob um marcador de vários valores. Só os campos que você realmente mexer escrevem alguma coisa, então um campo intocado nunca reescreve um arquivo. E aqueles que seriam sem sentido carimbar numa seleção, título e número da faixa e número do disco, se travam sozinhos num lote.
    .p2 = Quando um arquivo dentro do lote está errado, o formulário vira uma tabela: uma linha por faixa, uma coluna por campo, os campos travados por faixa editáveis ali mesmo. É a visão para aquela importação em que todo título e todo número está errado de um jeito diferente, e ela ganha de entrar campo por campo. As duas visões gravam como um lote só pelo mesmo caminho de escrita, e o resultado cai na biblioteca sem nova varredura.

mp3tag-specs = O que ele lê e escreve
mp3tag-spec-formats = **Formatos.** ID3v2, comentários Vorbis, átomos MP4 e APE atrás de um editor só, então MP3, FLAC, M4A e o resto são a mesma tela.
mp3tag-spec-ratings = **Avaliações.** Escritas nos próprios arquivos por FMPS e POPM, e não num banco de dados que você não pode levar.
mp3tag-spec-genres = **Gêneros com vários valores.** Listas de verdade, com as unificações guardadas como uma opinião da biblioteca em vez de uma reescrita das suas tags.
mp3tag-spec-art = **Capas.** Capas de álbum com várias imagens, adicionadas e substituídas pelo mesmo caminho atômico.
mp3tag-spec-lookup = **Consulta.** Tags e capas do MusicBrainz, do iTunes e do Deezer, aplicadas pelo mesmo diff, então você vê o que muda antes de escrever.
mp3tag-spec-repair = **Reparo.** Uma passagem para arquivos cujas tags estão danificadas de maneiras específicas e conhecidas em vez de meramente erradas, aquelas que fazem outros taggers mostrarem uma faixa como um nome de arquivo com duração zero.
mp3tag-spec-patterns = **Padrões, nos dois sentidos.** Uma string de formato como `%artist% - %title%` lê tags de um nome de arquivo, e o mesmo padrão ao contrário renomeia arquivos a partir das tags deles. Os dois mostram a prévia de cada faixa antes de escrever qualquer coisa.

mp3tag-stay = Quem deveria ficar com o Mp3tag
    .p1 = Se você está no Windows e se apoia em ações, scripting ou no trabalho mais elaborado com strings de formato, o rox não tem equivalente e isto seria um retrocesso. Se você quer um tagger que não seja também um player, este é o formato completamente errado.
    .p2 = Se você está no Linux ou num Mac, ou se etiquetar acontece no meio da escuta em vez de como uma tarefa separada, é essa a lacuna que isto preenche.
    .aside = O caminho de escrita é a parte que não tem contraparte para comparar. Verificar o hash de um fluxo de áudio antes de renomear por cima de um original não é algo que um tagger faça, a menos que ele espere ser apontado para tudo que você tem. Se é esse tipo de cuidado que você quer entre uma edição e seus arquivos, é isso que isto é.

mp3tag-closer = Aponte para a pasta de que você vem fugindo
    .body = Livre e de código aberto, sem conta, sem instalador. O [lado biblioteca disso](/best-music-player) está escrito à parte, e se você vem de um setup de Windows tem uma comparação com o [MusicBee](/musicbee-alternative) e outra com o [Foobar2000](/foobar2000-alternative) também.

## A visualização

viz-breadcrumb = Visualização de música
viz-title = Uma visualização de música embutida no player - rox
    .description = Painéis de espectro, forma de onda e VU, mais shaders WGSL sobre qualquer painel ou sobre a janela inteira, movidos por sinais nomeados que você tira do áudio que está tocando e leva para onde quiser.
    .image-alt = O logo do rox acima da frase em inglês: signals off the music, shaders on every surface

viz-h1 = Uma visualização que mora dentro do player
    .lede = A maioria dos players te dá um analisador de espectro e para por aí. O rox tem esses painéis, e debaixo deles uma camada de modulação: sinais nomeados tirados do áudio, roteados para entradas de shader que você mesmo escreve, salvos no mesmo arquivo em que mora o resto do seu tema.

viz-panels = Primeiro os painéis comuns
    .p1 = Um painel de espectro com estilos de barra ou bloco, gradientes, marcas de pico com gravidade própria, rótulos de frequência, e zoneamento dividido que analisa acima e abaixo de uma frequência escolhida com tamanhos de janela diferentes, de modo que cada ponta da faixa troca reatividade por resolução nos próprios termos. Uma tira de forma de onda que desenha a faixa inteira, por canal, e busca onde você clicar. Um medidor VU. Uma prateleira de capas que as gira em 3D de verdade. Nada disso precisa de uma linha de código, e é o que a maioria das pessoas vai usar.
    .p2 = Pausar congela as barras onde estavam, em vez de deixá-las cair até o chão. Isso soa pequeno até você querer olhar exatamente o instante em que pausou.

viz-shaders = Shaders, em quatro superfícies
    .p1 = Um shader do rox é um estágio de fragmento WGSL. Ele pode rodar sobre o corpo de um único painel, como um painel de Shader próprio, como um overlay sobre a janela inteira, ou como um fundo pintando debaixo de todos os painéis, atrás da capa. Overlay e fundo têm cada um uma chave que os estende para todas as janelas abertas do rox. Mesma linguagem, mesmo bloco de uniforms, mesmo roteamento em todos eles.
    .p2 = Todo shader recebe o relógio, a resolução, o ponteiro, e oito floats de metadados que descrevem o momento: volume, onde o cursor está dentro da faixa, se o áudio está de fato se movendo, a duração da faixa, e quão escura a paleta atual renderiza. Assim um shader consegue se vestir para claro e escuro, em vez de servir só ao tema contra o qual foi escrito.
    .p3 = Um shader de painel também pode ler o que o painel realmente desenhou. Um vínculo de máscara entrega a ele a própria pintura do painel reproduzida sobre transparência, e os painéis publicam a forma do conteúdo deles, então uma sombra ou um brilho segue uma capa em letterbox em vez das barras vazias dos dois lados.
    .p4 = Passando de um estágio, um comentário `// @pass` divide o texto numa cadeia de até oito, cada um capaz de ler pelo nome os passes anteriores. É disso que uma pirâmide de blur ou um bloom de dois estágios precisa. Uma linha `// @asset` nomeia uma imagem para amostrar, e `// @asset art: @cover` vincula a capa da faixa que toca, revinculando quando a faixa vira. Nove exemplos vêm com o aplicativo, cada um demonstrando uma parte diferente desse contrato em vez de nove variações de um plasma.
    .p5 = Aponte o painel para um arquivo no disco e o rox fica de olho nele. Salve no seu editor e a janela já tem. Um salvamento que não compila deixa a última versão boa na tela com o erro no painel, porque perder a imagem é um jeito ruim de descobrir que você digitou um ponto e vírgula errado.

viz-signals = Os sinais são a parte diferente
    .p1 = Um shader com um relógio dentro é um protetor de tela. O que o torna uma visualização é o que você dá de comer a ele, e no rox isso é um conjunto de sinais nomeados compartilhado pelo aplicativo inteiro. Você os monta numa janela própria, em Aplicativo, ao lado do equalizador, e ela traz um espectro e um transporte pelo mesmo motivo que o equalizador traz: você escolhe uma banda de olho e de ouvido, contra aquilo que está realmente tocando.
    .p2 = Cinco tipos de fonte. Uma **banda** é a energia entre duas frequências, o sinal em que uma onda cavalga. **Nível** é a mistura inteira. Um **onset** pulsa quando uma banda salta acima da média recente dela, o sinal em que uma batida cavalga. Um **gatilho** pulsa quando uma banda cruza uma linha que você desenhou, para material em que a média móvel nunca chega a cair e um onset silencia depois do primeiro compasso. Um **total** soma outro sinal ao longo do tempo e dá a volta em um, então um shader pode lê-lo como uma fase que avança enquanto a música está alta e empaca enquanto não está.
    .p3 = Cada um traz uma suavização de resposta e um gate. O gate é a configuração que merece o lugar dela: uma banda cavalgando no ruído da sala segura todo controle preso a ela ligeiramente fora do repouso para sempre, e um limiar com uma curva acima dele entrega silêncio entre as batidas no lugar disso. O medidor desenha o valor sem gate com o limiar marcado por cima, já que uma barra que sumiu debaixo do próprio gate não ajudaria em nada a posicionar o gate.
    .p4 = Uma rota liga um sinal a um parâmetro com um intervalo de saída: este sinal, este alvo, daqui até ali. Dezesseis slots chegam a todo shader, e os slots para os quais nada está roteado ganham um controle simples na página de configurações, então um visual pode ser metade regido pela música e metade ajustado na mão.

viz-tap = Medido antes do controle de volume
    .body = O ponto de escuta que a visualização lê fica antes do volume de saída. Abaixar a música fazia com que ela parecesse mais quieta do que é, e um sinal ajustado num volume ficava errado em outro. O equalizador e o ReplayGain continuam aparecendo, já que rodam antes e fazem parte do que você está ouvindo.

viz-critters = Critters, como argumento
    .body = Um dos espaços de trabalho que já vêm com o rox é o player inteiro renderizado como uma impressão de 1 bit: um dither ordenado sobre cada superfície, tons que esmagam com o sub-grave, e uma parede de ruído atrás dos painéis que se move com a música. São cinco sinais e quatro shaders num arquivo só, e nada disso é um caso especial dentro do aplicativo.
    .caption = Carregue pela janela de boas-vindas, depois abra as configurações e desmonte. [O resto deles](/workspaces).

viz-trust = Rodando o shader de um estranho
    .p1 = Os shaders viajam dentro dos arquivos de espaço de trabalho, o que significa que um visual importado chega carregando código de outra pessoa.
    .p2 = Nada roda antes de você mandar. O código de cada shader recebe uma impressão digital, e a lista de aprovados é local da máquina e só é escrita por uma ação direta: você escolheu o arquivo, você recarregou, você escolheu uma predefinição, você apertou Aprovar. Um visual que chegou num pacote fica ali inerte, com um botão embaixo, até então. Os exemplos que vêm com o rox são confiáveis por construção, porque estão compilados dentro do binário.
    .p3 = Ligar um deles abre uma janela de confirmação que espera por uma resposta em vez de contar o tempo, e essa janela nunca é sombreada. Faça o shader o que fizer com o resto da tela, o caminho de volta continua legível.

viz-limits = O que não está coberto
    .aside = A distância entre “quero o player inteiro piscando no bumbo” e ter isso é uma banda, um gate e uma rota, e nenhum dos três precisa recompilar nada.

viz-limit-routes = As rotas alcançam os slots dos shaders e os controles do painel de partículas. As configurações de todo outro painel continuam sendo controles que você ajusta na mão.
viz-limit-milkdrop = WGSL, não Milkdrop nem AVS. Não existe importador para nenhum dos dois, e vinte anos de presets não atravessam.
viz-limit-midi = Sem superfície de controle MIDI ou OSC. O passe de overlay e os passes de painel são o que existe, movidos pelo áudio e pelo ponteiro.
viz-limit-battery = Um passe de janela inteira é um passe de GPU de verdade a cada quadro. Num laptop na bateria, isso é uma escolha que você está fazendo.

viz-closer = Experimente na sua própria coleção
    .body = Nada aqui liga para lugar nenhum: a análise é o áudio que já está passando pelo player. Mais sobre [o que um espaço de trabalho carrega](/workspaces).

## NekoRoX

neko-title = NekoRoX, o tema de foobar2000, reconstruído nativo
    .description = O NekoRoX era um fork do CaTRoX para foobar2000: painéis próprios, letras sincronizadas, presença no Discord, ferramentas de Last.fm. Está arquivado agora, e o rox é o player nativo que o autor dele construiu no lugar.

neko-h1 = NekoRoX, o tema de foobar2000, e para onde ele foi
    .lede = O NekoRoX era um tema de foobar2000: um fork do CaTRoX com uma década de painéis, plugins e correções empilhados por cima. Eu o mantive como [catlinman](https://github.com/catlinman) até deixar de ser possível manter. O rox é o que eu construí no lugar, e o visual padrão dele é aquele layout reconstruído do zero.

neko-shot-alt = O tema NekoRoX de foobar2000: um layout escuro com abas INF, BIO, LYR, ART e LIB, um mural de capas à esquerda, faixas agrupadas por álbum com avaliações em estrelas à direita, e uma forma de onda âmbar com um analisador de espectro embaixo.
neko-shot-caption = O NekoRoX rodando no foobar2000, no Windows, em 2022.

neko-was = O que o NekoRoX era
    .p1 = Um setup pronto de foobar2000 que você descompactava em `%appdata%` e tinha um player acabado. Escuro, denso, abas para informações, biografia, letra, capa e biblioteca, um mural de capas de um lado, faixas agrupadas por álbum com pontos de avaliação, e uma forma de onda âmbar embaixo com um espectro sob ela. Por baixo havia o Columns UI, um monte de painéis em JScript, um arquivo de layout `.fcl` e uma pasta de fontes que você tinha que instalar na mão.
    .p2 = Começou como [CaTRoX](/catrox), o tema do eXtremeHunter1972, depois levado adiante pelo TheQwertiest. O NekoRoX acrescentou navegação por árvore e por filtros, modos de mini player, um painel de letra sincronizada, um cover flow, presença no Discord e ferramentas de Last.fm, e foi incorporando de volta boa parte do trabalho do TheQwertiest pelo caminho. Nenhum dos scripts por baixo era meu, e o README sempre disse isso.

neko-where = Onde encontrar
    .body = O repositório continua no ar em [github.com/catlinman/foobar2000](https://github.com/catlinman/foobar2000) e os arquivos ainda funcionam. Não é mantido, é só de Windows, e vários dos componentes de que ele depende ficaram parados ou sumiram dos servidores originais. Se você quiser rodar, rode. Só saiba que ninguém vai consertar.

neko-alpha = AlphaRoX, o claro
    .body = O mesmo tema com a paleta invertida, publicado nesta conta como [AlphaRoX](https://github.com/zealsprince/foobar2000). É um fork do NekoRoX, que é um fork do CaTRoX, o que já diz quase tudo sobre o que havia de errado em distribuir um visual desse jeito. Mesma situação do NekoRoX hoje: no ar, funcionando, sem manutenção.
    .alt = O tema AlphaRoX de foobar2000: a contraparte clara do NekoRoX, com fundo branco, um mural de capas à esquerda, faixas agrupadas por álbum com avaliações em estrelas, e uma forma de onda azul com analisador de espectro embaixo.

neko-stopped = Por que parou
    .p1 = Eu mudei para o Linux em tempo integral, o que significou que a montagem inteira passou a rodar pelo Wine. Rodava. Também renderizava Internet Explorer dentro de painéis, e uma pilha sustentada por gambiarras empilhadas não se dá bem com uma camada de tradução. Cada atualização do foobar2000, e cada atualização do Wine, era uma moeda jogada para o alto sobre uma década de configuração.
    .p2 = O problema mais fundo era o formato. Uma instalação do NekoRoX não é um arquivo, é uma lista de componentes, uma ordem de instalação e um conjunto de caminhos que só se remontam na máquina em que foram construídos. É por isso que o README mandava as pessoas copiarem quatro diretórios para dois lugares diferentes. Compartilhar um visual não deveria exigir uma página de instruções.

# $others é a quantidade de espaços de trabalho que vêm com o rox menos o
# padrão e o CaTRoX, os dois já citados na frase. Já foi "outros quatro".
neko-rox = O que o rox faz com isso
    .body = O rox é um player nativo escrito em Rust, no Linux, no macOS e no Windows, sem foobar2000 e sem Wine por baixo. O espaço de trabalho padrão dele é o layout do NekoRoX reconstruído a partir de painéis nativos, e é por isso que as duas capturas se parecem. Tem um [espaço de trabalho CaTRoX](/catrox) junto também, mais outros { $others }.

neko-default-alt = O espaço de trabalho padrão do rox, uma reconstrução nativa do layout do NekoRoX: uma grade de capas ao lado de uma playlist com avaliações em estrelas, uma barra de posição em forma de onda âmbar embaixo, e abas para biografia, letra e metadados.

neko-carried = A lista de recursos, linha por linha
    .after = A coisa que o NekoRoX não conseguia fazer é a que mais me importa. No rox um visual inteiro é um arquivo único carregando layout, paleta e aparência juntos, então você entrega um espaço de trabalho a alguém e a pessoa tem o seu setup. Sem lista de componentes, sem ordem de instalação, sem pasta de fontes.

neko-had-nav = Navegação por árvore e por filtros
    .now = Painel de Árvore de pastas, mais um painel de Filtro em cascata sobre artista, álbum, gênero e ano.
neko-had-mini = Modos mini e micro player
    .now = Um layout mini por espaço de trabalho, alternado pelo transporte, com tamanho de janela próprio.
neko-had-ontop = Sempre no topo
    .now = Ainda nada. A janela é uma janela normal.
neko-had-ratings = Visões de avaliação e contagem de reproduções
    .now = Avaliações de cinco estrelas ou de dez pontos, escritas em POPM e FMPS, e uma coluna de reproduções ordenável.
neko-had-youtube = Busca e reprodução de áudio do YouTube
    .now = Nada. O rox toca arquivos do seu disco.
neko-had-covers = Visualizador de capas e cover flow
    .now = Um painel de Capa e um Carrossel de álbuns que reduz e escurece os vizinhos em direção às bordas.
neko-had-lyrics = Letras sincronizadas em tempo real
    .now = Arquivos LRC destacados no cursor, clique numa linha para pular até ela, buscados do lrclib.
neko-had-viz = Visualização e barra de posição por amplitude
    .now = Uma forma de onda da faixa inteira que dá para arrastar, um espectro FFT, um medidor VU.
neko-had-discord = Discord rich presence
    .now = Tocando agora, estado de reprodução e tempo decorrido pelo IPC do Discord.
neko-had-bio = Busca de biografia ao vivo
    .now = Biografia do artista com fanart, tags, contagem de ouvintes e artistas similares.
neko-had-lastfm = Integração com Last.fm
    .now = Scrobbling, faixa tocando, curtidas espelhadas como loves, e importação de faixas curtidas.

neko-closer = Baixe o rox
    .body = Livre, de código aberto, um binário por plataforma. A [página de espaços de trabalho](/workspaces) mostra os { workspace-count } visuais que já vêm com o rox, e a [comparação com o foobar2000](/foobar2000-alternative) cobre onde o foobar2000 ainda está na frente.

## ReplayGain

rg-title = ReplayGain explicado, e o que custa ligá-lo
    .description = O que o ReplayGain realmente faz, ganho de faixa contra ganho de álbum, por que o valor de pico importa, como lidar com os arquivos que ninguém nunca mediu, e por que ReplayGain e reprodução bit-perfect são mutuamente exclusivos.

rg-h1 = ReplayGain, e o que ele te custa
    .lede = Por que um álbum é duas vezes mais alto que o próximo, o que a solução de fato faz com o seu áudio, e por que você não pode ter isso e reprodução bit-perfect ao mesmo tempo.

rg-problem = O problema que ele resolve
    .p1 = Os discos não são masterizados para uma sonoridade comum. Um CD de 1985 e uma remasterização de 2005 do mesmo álbum podem diferir em dez decibéis ou mais, que é a diferença entre confortável e correr para o controle de volume. Coloque uma coleção de quatro décadas no aleatório e você fica mexendo no volume a cada três faixas.
    .p2 = O ReplayGain resolve isso sem tocar no seu áudio. Uma passagem de análise mede a que distância uma faixa está de uma sonoridade de referência e escreve esse número, em decibéis, nas tags do arquivo. Na reprodução o player lê o número e o aplica. Nada é recodificado e nada é destruído, porque a correção mora numa tag e o áudio por baixo é o áudio que você tinha.

rg-modes = Ganho de faixa e ganho de álbum
    .p1 = Todo arquivo medido carrega dois números, e escolher entre eles é a única configuração que realmente muda a sensação de escutar.
    .track = **Ganho de faixa** nivela cada faixa de forma independente. Toda música chega na mesma sonoridade, que é o que você quer no aleatório. Também achata álbuns construídos com dinâmica de propósito: o interlúdio quieto antes do encerramento alto é puxado para cima até bater com ele, e o efeito que a produção pretendia se foi.
    .album = **Ganho de álbum** aplica um único número a todas as faixas do disco, calculado a partir do álbum como um todo. As diferenças relativas dentro do álbum sobrevivem exatamente como foram masterizadas, e o álbum como unidade fica no mesmo nível de outros álbuns. É o padrão certo se você escuta discos do começo ao fim.
    .setting = O rox trata isso como configuração e aplica o número escolhido por faixa conforme ela abre, então é uma preferência e não algo gravado nos arquivos.

rg-peak = O pico, e por que um reforço pode saturar
    .p1 = Junto com o ganho, uma passagem de medição registra a amostra mais alta da faixa. Esse número importa porque as correções do ReplayGain vão nos dois sentidos: uma gravação quieta ganha ganho positivo, e multiplicar amostras que já chegam perto da escala cheia as empurra além dela. Passando da escala cheia não há para onde ir, então a forma de onda achata e você ouve uma distorção que não estava no arquivo.
    .p2 = O pico é o que impede isso. O rox limita um reforço contra o pico que a tag informa, então uma faixa quieta é levantada só até onde dá sem saturar. O resultado é que algumas faixas quietas ficam um pouco abaixo da sonoridade alvo, que é a troca correta e o motivo pelo qual os valores de pico são guardados.

rg-unmeasured = Os arquivos que ninguém nunca mediu
    .p1 = O ReplayGain só funciona em arquivos que carregam as tags, e numa coleção real montada ao longo de vinte anos uma boa fatia não vai carregar. Historicamente isso significava rodar um tagger separado sobre tudo antes de o seu player servir para alguma coisa.
    .p2 = O rox lê as tags onde elas existem, sob os nomes padrão em todo formato que ele indexa: frames TXXX em ID3v2, comentários Vorbis em FLAC, átomos livres em MP4. Para todo o resto ele mede os arquivos sozinho com uma passagem de sonoridade EBU R128 e guarda o resultado na biblioteca, marcado como medido, para que uma varredura futura consiga distinguir os números do próprio rox do que um tagger escreveu. Se você preferir que os números fiquem nos arquivos, uma configuração os escreve de volta pelo mesmo caminho de escrita verificado que o editor de tags usa.
    .p3 = Essa passagem pode se disparar sozinha. Com a medição automática ligada, os arquivos são medidos assim que a monitoração de pastas se aquieta depois de uma importação, e uma faixa jogada num álbum que já tinha sido medido manda o disco inteiro de volta para nova medição, já que o ganho de álbum é um número sobre o disco e não sobre o arquivo.

rg-skip = A parte que a maioria das páginas pula
    .p1 = O ReplayGain multiplica suas amostras por um número. Isso é processamento. Não é sem perdas, não é passagem direta, e qualquer player que afirme ReplayGain e saída bit-perfect ao mesmo tempo está descrevendo algo que não pode acontecer.
    .p2 = Isso importa se você tem um DAC escolhido com cuidado. Bit-perfect significa que as amostras que chegam ao conversor são as amostras do arquivo, sem modificação, então qualquer coisa que as escale, um controle de volume abaixo da unidade, um equalizador, o ReplayGain, encerra a afirmação. Não existe versão de normalização de sonoridade que deixe os bits em paz, porque mudar a sonoridade é mudar os bits.
    .choice = Qual dos dois você quer é uma escolha de verdade e não uma pegadinha. Bit-perfect importa na escuta crítica de um álbum em hardware bom. O ReplayGain importa em toda outra hora, quando a coleção está no aleatório e você prefere não encostar no volume. A maioria das pessoas deveria rodar o ReplayGain e parar de se preocupar. O ponto é saber qual dos dois está ligado.

rg-bitperfect = O que bit-perfect significa no rox
    .body = Três condições, ditas em vez de enfeitadas: a cadeia de processamento vazia ou desligada, o volume em 100%, e o dispositivo rodando na taxa do próprio arquivo de origem. Cumpra as três e o conversor recebe amostras idênticas bit a bit. Falhe em qualquer uma e ele não recebe, e o rox diz isso em vez de mostrar um selo. ReplayGain ligado é processamento ligado, e ele aparece como processamento ligado.

rg-exclusive = Saída exclusiva, à parte
    .p1 = Bit-perfect também precisa do sistema operacional fora do caminho, que é para isso que serve um modo de saída exclusiva. O rox toma o dispositivo direto: o nome `hw:` do ALSA no Linux, sem dmix, sem plug e sem servidor de som no meio; WASAPI exclusive no Windows; modo hog pelo CoreAudio no macOS. Ele segue a taxa da origem onde o dispositivo permite, e informa com o que o hardware realmente concordou em vez do que foi pedido.
    .p2 = A troca é o que exclusivo significa em todo lugar: enquanto o rox segura o dispositivo, nada mais na máquina toca por ele. Se o dispositivo não puder ser tomado, o rox cai para o modo compartilhado com o estado visível, em vez de ficar mudo e deixar você descobrir por quê.

rg-limits = O que não está coberto
    .aside = A lista de players que te dizem qual dos dois, bit-perfect ou ReplayGain, está valendo agora, e que medem os arquivos que seus taggers nunca alcançaram, é curta. Se é esse tipo de honestidade que você quer da coisa entre sua coleção e seu DAC, o rox está nela.

rg-limit-opus = Arquivos Opus carregam o esquema `R128_TRACK_GAIN` próprio, relativo a uma referência diferente. O rox não converte, porque `.opus` não está nas extensões do scanner.
rg-limit-itunes = O `iTunNORM` do iTunes está fora de escopo. Nada mais o escreve e os valores por canal dele não são um ganho em decibéis.
rg-limit-rate-switch = Seguir a taxa da origem no modo exclusivo custa uma pausa audível entre duas faixas de taxas de amostragem diferentes, já que o stream reabre. A reprodução sem intervalo dentro de uma mesma taxa não é afetada.

rg-closer = Aponte para a sua coleção
    .body = A passagem de medição roda em segundo plano sobre tudo que está sem ganho, e continua rodando com a janela de configurações fechada. Mais sobre [o que mais importa em escala de biblioteca](/best-music-player).
