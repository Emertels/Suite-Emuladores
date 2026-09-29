# 📜 Histórico de Alterações / Changelog (Português)

<p align="center">
  <a href="CHANGELOG-PT-BR.md"><img src="https://img.shields.io/badge/Changelog-Portugu%C3%AAs%20(Brasil)-green?style=for-the-badge" alt="PT-BR"></a>
  <a href="CHANGELOG-EN.md"><img src="https://img.shields.io/badge/Changelog-English-blue?style=for-the-badge" alt="EN"></a>
  <a href="README.md"><img src="https://img.shields.io/badge/Voltar%20ao-README-orange?style=for-the-badge" alt="README"></a>
</p>

---

## 🚀 [18.00] - 28/09/2026
* **Internacionalização Completa (10 Idiomas Nativos):** Implementação de reconhecimento automático do idioma do sistema operacional (`[System.Globalization.CultureInfo]::CurrentUICulture`) e dicionário interno com suporte nativo a 10 idiomas: Português (`pt`), Inglês (`en`), Espanhol (`es`), Francês (`fr`), Alemão (`de`), Italiano (`it`), Japonês (`ja`), Chinês Simplificado (`zh`), Russo (`ru`) e Coreano (`ko`). Suporte completo a override manual via parâmetro `-Lang <code>` e fallback universal automático para Inglês.
* **Blindagem Anti-Queda do MEKA (Arquitetura Híbrida `MEKA_Dual`):** Rastreamento reestruturado. O script consulta primariamente o AppVeyor CI em busca das compilações contínuas mais recentes (Nightly). Se os artefatos estiverem expirados (limite de 30 dias) ou o serviço indisponível, o sistema comuta de forma instantânea e 100% silenciosa para as versões oficiais estáveis no GitHub (`ocornut/meka`), sem poluição visual ou mensagens de erro na tela.
* **Atualização de Nomenclatura e Radar do jgenesis:** Calibragem no rastreador do emulador jgenesis, adaptado para a nova nomenclatura de compilações do desenvolvedor após a remoção do prefixo `gui-` (agora `jgenesis-*-windows-x86_64.zip`), restabelecendo o fluxo automático e contínuo de atualizações a partir do repositório oficial.
* **Bypass Web Scraper de Contingência contra Rate Limit do GitHub (HTTP 403):** Desenvolvido motor de raspagem resiliente (`Get-GitHubReleaseAssetsWeb`) que intercepta bloqueios da API REST pública do GitHub (limite anônimo de 60 requisições/hora) e extrai os links diretos de download a partir do HTML puro da página `expanded_assets`, garantindo downloads ininterruptos mesmo sob restrições severas de IP.
* **Calibragem Cirúrgica de Filtros de Descarte:**
  * **Xenia Canary:** Injeção de regex estrito para descartar pacotes Linux (`xenia_canary_linux.AppImage`), baixando exclusivamente o executável comprimido para Windows.
  * **PCSX2:** Adicionado filtro de badwords para ignorar compilações com símbolos de depuração (`-symbols.7z`, `pdb`, `debug`).
* **Resolução Dinâmica de Compilações Dev do BizHawk (`BizHawk_Dev`):** Substituído link fixo por motor autônomo com dupla camada: localiza dinamicamente o último artefato gerado na branch `master` no GitHub Actions (`TASEmulators/BizHawk`) e possui raspagem Web direta para contornar limites de API, direcionando o download sempre para a build dev mais recente via `nightly.link` sem URLs fixas.
* **Compatibilidade Universal UTF-8 nos Scripts:** Scripts principais codificados com suporte pleno a UTF-8 com BOM, garantindo compatibilidade total com o interpretador nativo do Windows PowerShell 5.1 e PowerShell 7+, sem quebra de caracteres em alfabetos cirílicos, ideogramas orientais ou acentuação latina.
* **Alinhamento Centralizado do Autor no HUD:** Ajuste geométrico nos cabeçalhos visuais dos terminais do Baixador e Atualizador, centralizando perfeitamente a assinatura "Teles" sob "Emerson" com preenchimento padronizado de colunas em todos os idiomas.
* **Manutenção e Sincronização dos 56 Motores:** Todos os emuladores, frontends, complementos, patches e ferramentas de ROMs foram auditados e validados, mantendo ambos os scripts sincronizados e plenamente operacionais.

---

## ⚡ [17.50] - 08/07/2026
* **Expansão Massiva de Plataformas:** Injeção nativa de novos motores modernos para PlayStation, Xbox e Nintendo: shadPS4 (PS4), Vita3K (PS Vita), Xemu (Xbox Clássico), DuckStation e PCSX-Redux (PS1), além do bsnes (SNES) e do gerenciador dedicado Xenia Manager (Xbox 360).
* **Novo Motor GitHub para MEKA:** Rastreamento reescrito varrendo a API oficial do desenvolvedor através da chave condicional `win32|mekaw`, assegurando download de compilações estáveis imunes à exclusão temporal.
* **Telemetria de Switch Aprimorada:** Cálculo matemático dinâmico do peso dos pacotes baixados no disco (`$Global:FwSizeStr` e `$Global:KeySizeStr`), reportando a Firmware em MB e as Keys em KB diretamente no status de sucesso.
* **Expurgo Visual no Fechamento (`Update-HUD -Clear $true`):** Limpeza cirúrgica eliminando medidores de velocidade (MB/s) e cronômetro do terminal, entregando uma interface limpa para o Placar Final.

---

## 🛡️ [17.20] - 26/06/2026
* **Sistema de Identidade Ninja (Bypass anti-Cloudflare):** Motor de rede global atualizado para emular a assinatura de navegador real (Google Chrome 125), contornando falsos positivos de link ausente no prodkeys.net para download autônomo das Keys do Switch.
* **Motor Exclusivo `GitHub_Tag` para Citron-Neo:** Rastreamento direto da gaveta de compilações na tag `nightly-windows`.
* **Calibragem de Regex para Xenia Patches e RMG:** Rastreamento do Xenia no novo formato `.7z` e adaptação do Rosalie's Mupen GUI à nomenclatura "Portable".
* **Padronização de Erros Visuais:** Mensagens de exceção curtas e cirúrgicas sem acentos quebrados (`(Erro 404)`, `(Link ausente)`, `(Falha de rede)`).
* **Correção no Contador do Nintendo Switch:** Solucionado bug que omitia emuladores de Switch do contador global de processados.

---

## 🏭 [15.85] - 21/06/2026
* **Arquitetura de "Linha de Montagem" no Terminal:** Processamento e reporte individualizado em tempo real para cada componente (Emulador principal, Patches, Graphic Packs, Firmware e Keys).
* **Radar Gramatical e Tags Inteligentes:** Distinção dinâmica entre singular e plural nas mensagens de sucesso e aplicação de tags `(32-bit)` ou `(64-bit)` exclusivamente em emuladores de matriz dupla.
* **Blindagem contra Vazamento de Erros de API:** Interceptação e supressão de sangramentos de tela JSON gerados por Rate Limit do GitHub.
* **Independência Lógica de Firmware e Keys:** Isolamento de falhas entre o pacote de sistema e os arquivos de chaves do Nintendo Switch.

---

## 🔧 [15.70] - 21/05/2026
* **Revisão Estrutural de Código:** Eliminação de travamentos de sintaxe e laços incorretos.
* **Radar do Mesen Atualizado:** Adaptação da expressão regular para o novo padrão de release `Mesen_X.X.X_Windows.zip`.
* **Estabilização da Fila:** Remoção de alvos instáveis sujeitos a bloqueios anti-bot severos.

---

## 🔍 [15.50] - 17/05/2026
* **Filtros de Precisão Cirúrgica:** Eliminação de falsos positivos que bloqueavam executáveis de 64-bit contendo o número 32 no nome.
* **Raspador Dinâmico para ProdKeys:** Remoção de links estáticos e implementação de busca em tempo real.
* **Gestor Autônomo do 7-Zip:** Verificação de presença e versão do 7-Zip com download e instalação silenciosa transparente em segundo plano.

---

## ⚡ [15.40] - 15/05/2026
* **Sessões Isoladas com GUID:** Pastas temporárias com hash exclusivo permitindo múltiplas instâncias concorrentes.
* **Descompactação Nativa GZip/Deflate no HttpClient:** Redução drástica de tráfego de rede e tempo de resposta de APIs.
* **Buffer Expandido para 256KB:** Maximização de taxas de transferência em conexões de fibra de alta velocidade.
* **Proteção contra Redimensionamento do Terminal:** Blindagem de coordenadas do cursor contra quebras no redimensionamento da janela.
* **Uso Estrito de `-LiteralPath`:** Suporte integral a caminhos contendo colchetes `[` e `]`.
* **Filtros Agressivos no RPCS3:** Rastreamento direto do endpoint latest ignorando pacotes debug/symbols.
* **Eden apontado para Eden-CI:** Forçado download prioritário da build MSVC recomendada.
* **Criação de Pastas via .NET Puro:** Invocação direta da API C# para criar árvores de diretórios sem falhas.
* **Inclusão do RMG e Mesen:** Catálogo oficial elevado para 56 motores.
* **Trava de Saída Segura no ENTER:** Bloqueio de fechamento acidental da janela do terminal.

---

## 🎮 [15.10] - 10/05/2026
* **Suporte Nativo ao RetroArch:** Extração direta via Buildbot oficial da Libretro.
* **Inclusão de SuperSnes9x e SuperZSNES:** Integração mista via GitHub API e raspagem web direta.
* **Emulador Eden (Nintendo Switch):** Download automatizado do pacote msvc-standard.
* **Módulo de Cache Único para Nintendo Switch:** Download da Firmware (320 MB) e Keys uma única vez na sessão com distribuição compartilhada entre Citron-Neo, Eden, Ryujinx e Ryujinx-Canary.
* **Limpeza Tardia de Temporários:** Exclusão de arquivos pesados apenas após o processamento da fila inteira.
* **HUD Minimalista:** Porcentagem dinâmica `[XX%]` em downloads e etapas de descompactação.
* **Ativação VIP Automática do Project64:** Injeção direta no Registro do Windows.

---

## 🗂️ [12.70] - 26/04/2026
* **Separação Industrial de Categorias:** Divisão visual entre "EMULADORES" e "FRONTENDS & GERENCIADORES".
* **Dolphin CI Integration:** Rastreamento dinâmico imune a hash directories aleatórios.
* **Sistema de Fallback para DeSmuME:** Contingência automática apontando para o GitHub Releases.
* **Adição do Attract-Mode Plus e ClrMame C++:** Ferramentas avançadas para gerenciamento de Arcade e conjuntos de ROMs.

---

## 🕹️ [12.50] - 25/04/2026
* **Família MAME Completa:** Inclusão de MAME Oficial, MAMEUI64 Classic e MAMEUI64 Plus!.
* **Espelhamento Ryubing para Ryujinx:** Contingência em caso de indisponibilidade de repositórios principais.
* **Ajuste de Estrutura do MAMEUI Plus!:** Remoção automática da subpasta redundante `mameui+`.
* **Suporte a Arquivos `.exe` Compactados:** Descompactação direta pelo motor do 7-Zip.

---

## 🎯 [12.40] - 23/04/2026
* **Inclusão do mGBA e Deecy:** Emulação avançada para GBA e Dreamcast.
* **Injeção Silenciosa do Project64:** Ativação VIP 100% via registro do Windows, aposentando binários auxiliares.

---

## 📊 [12.38] - 21/04/2026
* **Placar Final Reconstruído:** Contagem matemática precisa eliminando números negativos ou contagens duplicadas.
* **Destaques de Cores do Terminal:** Acompanhamento dinâmico das etapas de download e organização.

---

## 🌐 [12.37] - 19/04/2026
* **Motor HttpClient .NET com Buffer de 128KB:** Aposentadoria definitiva de WebRequest legados e comandos BITS lentos.
* **Instância Única de Conexão:** Prevenção contra esgotamento de portas de rede (Socket Exhaustion).
* **User-Agent Dinâmico:** Rotação de cabeçalhos evitando detecções e falsos bloqueios.
* **Tratamento de Sub-ZIP no Azahar:** Eliminação de arquivos internos duplicados.
* **Timeout Global de 3 Minutos:** Proteção contra servidores externos congelados.
* **Inclusão de Ares, jgenesis, GearSystem, MEKA, Playnite e EmulationStation-DE.**
* **Dual-Build Snes9xCombo:** Download concorrente de 32 e 64 bits em ciclo único.

---

## 🚀 [12.01] - 18/04/2026
* **Adição do FinalBurn Neo (64-bit) e BizHawk (Estável e Nightly).**
* **Preservação de Dados do Usuário:** Remoção cirúrgica prévia apenas de arquivos `.exe` e `.dll`, preservando integralmente saves, shaders, configs e BIOS.
* **Injeção Automática de Graphic Packs e Patches:** Roteamento autônomo para pastas do Cemu e Xenia.

---

## 📦 [11.40] - 17/04/2026
* **Multi-componentes para Família Xenia:** Download e extração do Xenia Canary, Xenia Edge e seus patches de compatibilidade.
* **Inclusão do Xenia Edge via API Oficial.**

---

## 🔒 [11.35] - 16/04/2026
* **Verificação de Integridade de Arquivos (`7z t`):** Teste de assinatura matemática antes da descompactação, descartando downloads corrompidos.
* **Tratamento Resiliente de Quedas de Conexão.**

---

## 👶 [11.29] - 15/04/2026
* **Primeira Versão Automatizada Unificada.**
* **Telemetria Básica:** Cronômetro e indicador de porcentagem dinâmico.
* **Rastreamento Multi-Plataforma Inicial:** DeSmuME, Flycast Dojo, Ymir e Azahar.
* **Suporte a Matriz Dupla (32 e 64 bits):** PPSSPP e Snes9x.
