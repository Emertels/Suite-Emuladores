# 🕹️ Suíte Inteligente: Baixador e Atualizador de Emuladores (v18.10)

<p align="center">
  <a href="README-PT-BR.md"><img src="https://img.shields.io/badge/Documenta%C3%A7%C3%A3o-Portugu%C3%AAs%20(Brasil)-green?style=for-the-badge" alt="PT-BR"></a>
  <a href="README-EN.md"><img src="https://img.shields.io/badge/Documentation-English-blue?style=for-the-badge" alt="EN"></a>
  <a href="CHANGELOG-PT-BR.md"><img src="https://img.shields.io/badge/Changelog-PT--BR-purple?style=for-the-badge" alt="Changelog PT-BR"></a>
  <a href="CHANGELOG-EN.md"><img src="https://img.shields.io/badge/Changelog-EN-darkblue?style=for-the-badge" alt="Changelog EN"></a>
  <a href="#-sistemas-e-softwares-suportados-56-motores"><img src="https://img.shields.io/badge/Emuladores-56%20Motores-cyan?style=for-the-badge" alt="56 Emuladores"></a>
</p>

Suíte profissional e inteligente em **PowerShell** voltada para download autônomo, descompactação cirúrgica, extração e atualização silenciosa de um ecossistema com **56 emuladores de jogos, frontends e ferramentas de gerenciamento de ROMs** no Windows.

---

## 📸 Demonstração / Interface

<p align="center">
  <img src="assets/baixador_preview.png" alt="Baixador de Emuladores 18.10" width="850" />
</p>

<p align="center">
  <img src="assets/atualizador_preview.png" alt="Atualizador de Emuladores 18.10" width="850" />
</p>

---

## 🧠 Por que a Suíte é Inteligente?

A automação foi desenvolvida com recursos autônomos de nível profissional:
* **Detecção e Gestão Autônoma do 7-Zip:** Verifica se o 7-Zip está instalado ou desatualizado. Baixa e instala a versão oficial em segundo plano silenciosamente (`/S`) antes de iniciar os downloads.
* **Arquitetura Anti-Falha e Anti-Rate-Limit:** Possui raspador dinâmico de contingência (`Get-GitHubReleaseAssetsWeb`) que ignora limites da API REST do GitHub (HTTP 403), extraindo links diretamente do HTML limpo.
* **Blindagem Híbrida Inteligente (MEKA_Dual):** Consulta o AppVeyor CI por compilações contínuas (Nightlies). Se expirarem ou caírem, comuta 100% em silêncio para os lançamentos oficiais no GitHub sem alertas de erro.
* **Cache Inteligente de Sessão (Nintendo Switch):** Baixa Firmware oficial (324 MB) e Keys uma única vez e distribui localmente para `Ryujinx`, `Ryujinx-Canary`, `Eden` e `Citron-Neo`, poupando tempo e largura de banda.
* **Preservação Cirúrgica de Dados do Usuário:** No Atualizador, apenas arquivos `.exe` e `.dll` antigos são substituídos. Seus saves, arquivos de configuração (`.ini`, `.cfg`, `.json`), shaders, BIOS e perfis de controle permanecem rigorosamente intocados.
* **Ativação VIP Automática:** Injeção direta no Registro do Windows para desbloquear o Project64 e remover alertas de doação permanentemente.

---

## 📌 Diferenças entre os Scripts

* **`Baixador de Emuladores de Jogos 18.10.ps1` (Instalação Direta)**:
  * Utiliza a variável central `$Base = "C:\Emuladores"`.
  * Cria dinamicamente toda a árvore de diretórios e subpastas caso ainda não existam.
  * Baixa e descompacta tudo diretamente no disco `C:\`, sem necessidade de configurar caminhos manualmente.
  * Ideal para criar uma instalação portátil do zero ou estruturar um novo disco de jogos.
* **`Atualizador de Emuladores de Jogos 18.10.ps1` (Atualização de Instalação Existente)**:
  * Trabalha com **caminhos absolutos** pré-definidos para cada emulador.
  * No repositório oficial do GitHub, todos os links utilizam o marcador em inglês e em maiúsculo: **`PUT_YOUR_DIRECTORY_HERE`** (ex: `"PUT_YOUR_DIRECTORY_HERE\Nintendo Wii U\Cemu"`).
  * **Como configurar:** Abra o script no Bloco de Notas ou VS Code, pressione `Ctrl + H` (Substituir) e troque **`PUT_YOUR_DIRECTORY_HERE`** pelo caminho real onde seus emuladores estão instalados (ex: `D:\Games\Emuladores` ou `C:\Emuladores`).
  * **Como remover emuladores não utilizados:** Se você não possui determinado emulador instalado, basta **comentar a linha colocando `#` no início** ou simplesmente apagar a linha daquele emulador no final do script.

---

## 🌐 Suporte Multilíngue (10 Idiomas Nativos)

A versão 18.10 reconhece **automaticamente** o idioma do seu sistema operacional através de `[System.Globalization.CultureInfo]::CurrentUICulture`:

* 🇧🇷 **Português (`pt`)**
* 🇺🇸 **Inglês (`en`)** *(Fallback padrão universal)*
* 🇪🇸 **Espanhol (`es`)**
* 🇫🇷 **Francês (`fr`)**
* 🇩🇪 **Alemão (`de`)**
* 🇮🇹 **Italiano (`it`)**
* 🇯🇵 **Japonês (`ja`)**
* 🇨🇳 **Chinês Simplificado (`zh`)**
* 🇷🇺 **Russo (`ru`)**
* 🇰🇷 **Coreano (`ko`)**

### Como forçar manualmente um idioma:
```powershell
powershell -ExecutionPolicy Bypass -File ".\Atualizador de Emuladores de Jogos 18.10.ps1" -Lang es
powershell -ExecutionPolicy Bypass -File ".\Baixador de Emuladores de Jogos 18.10.ps1" -Lang en
```

---

## 📂 Sistemas e Softwares Suportados (56 Motores)

* **Nintendo (18)**: Citron-Neo, Eden, Ryujinx, Ryujinx-Canary, Cemu, Dolphin, Azahar (3 branches: Release, Master, Plus), DeSmuME, FCEUX, bsnes, Snes9x, SuperSnes9x, SuperZSNES, Project64, Rosalie's Mupen GUI (RMG), mGBA, Gearboy, VisualBoyAdvance-M.
* **Sony (7)**: shadPS4 (PS4), RPCS3 (PS3), PCSX2 (PS2), DuckStation (PS1), PCSX-Redux (PS1), PPSSPP (PSP), Vita3K (PS Vita).
* **Microsoft (5)**: Xemu (Xbox Clássico), Cxbx-Reloaded (Xbox Clássico), Xenia Master (Xbox 360), Xenia Canary (Xbox 360), Xenia Edge (Xbox 360).
* **Sega / Arcade / Retro (19)**: Flycast, Flycast Dojo, Deecy, Ymir (AVX2), Ymir (SSE2), FinalBurn Neo, MAME Oficial, MAMEUI Classic, MAMEUI Plus!, ARCADE64, MEKA, Mesen, jgenesis, GearSystem, etc.
* **Frontends & Gerenciadores (7)**: RetroArch, Playnite, EmulationStation-DE, Attract-Mode Plus, Xenia Manager, ClrMame, ClrMamePro.

---

## 🚀 Como Utilizar

1. **Pré-requisitos**:
   * Windows 10 ou 11 (64-bit).
   * PowerShell 5.1 ou superior.
   * Conexão estável com a internet.
2. **Execução Direta**:
   * Dê um duplo clique nos arquivos `.bat` (`Baixador-de-Emuladores.bat` ou `Atualizador-de-Emuladores.bat`), ou execute via terminal:
     ```powershell
     powershell -ExecutionPolicy Bypass -File "Atualizador de Emuladores de Jogos 18.10.ps1"
     powershell -ExecutionPolicy Bypass -File "Baixador de Emuladores de Jogos 18.10.ps1"
     ```

---

## 👨‍💻 Sobre o Autor

Desenvolvido e mantido por **Emerson Teles** (conhecido na comunidade como **Emertels**).

Entusiasta de tecnologia, informática, jogos, manutenção de sistemas e tradução/localização de softwares para Português do Brasil (PT-BR). Desenvolvedor focado em utilitários práticos, ferramentas de produtividade, automação inteligente em PowerShell e soluções completas de localização técnica que aproximam ferramentas modernas do público brasileiro.

### 🛠️ Projetos & Contribuições

- [AI-Chat-Vault](https://github.com/Emertels/AI-Chat-Vault) — Backup portátil e recuperação de conversas locais de 20+ ferramentas e assistentes de IA.
- [Antigravity — Tradução PT-BR](https://github.com/Emertels/Antigravity-Traducao-PTBR) — Localização completa do Google Antigravity Desktop para Português do Brasil.
- [Codex Router — Tradução PT-BR](https://github.com/Emertels/CodexRouter-Traducao-PTBR) — Pacote de tradução e localização do Codex Router Control Center em PT-BR.
- [Cursor AI — Tradução PT-BR](https://github.com/Emertels/Cursor-Traducao-PTBR) — Localização completa e profunda do Cursor AI para Português do Brasil.
- [GPU Tweak III — Tradução PT-BR](https://github.com/Emertels/GPU-Tweak-III-Traducao-PTBR) — Tradução em português brasileiro e instalador automatizado para ASUS GPU Tweak III.
- [Microsoft Photos Fix](https://github.com/Emertels/Microsoft-Photos-Fix) — Solução definitiva em PowerShell e C# para rota de inicialização rápida e visualização no app Fotos do Windows.
- [PSBBN-Translator](https://github.com/Emertels/PSBBN-Translator) — Suíte corporativa de tradução e localização para o PSBBN Definitive Project (PlayStation 2) em 40 idiomas.
- [Silent Hill: Homecoming — Tradução PT-BR](https://github.com/Emertels/Silent-Hill-Homecoming-Traducao-PTBR) — Tradução e revisão completa do jogo para PC em português brasileiro.
- [Suite-Emuladores](https://github.com/Emertels/Suite-Emuladores) — Suíte inteligente em PowerShell para download e atualização autônoma de 56 emuladores e frontends no Windows.
- [ZCode — Tradução PT-BR](https://github.com/Emertels/ZCode-Traducao-PTBR) — Tradução e localização completa do ZCode Desktop para Português do Brasil.

### 🌐 Conecte-se comigo & Comunidades Oficiais

<div align="left">

[![GitHub](https://img.shields.io/badge/GitHub-Emertels-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/emertels)
[![Website](https://img.shields.io/badge/Website-Emerson_Teles-0070F3?style=for-the-badge&logo=googlechrome&logoColor=white)](https://emertels.github.io)
[![Discord](https://img.shields.io/badge/Discord-Emertels%20Server-5865F2?style=for-the-badge&logo=discord&logoColor=white)](https://emertels.github.io/discord)
[![X / Twitter](https://img.shields.io/badge/X_Twitter-@emertels-000000?style=for-the-badge&logo=x&logoColor=white)](https://x.com/emertels)
[![YouTube](https://img.shields.io/badge/YouTube-Emerson_Teles-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/@emersonteles2379)
[![Telegram](https://img.shields.io/badge/Telegram-Aplicativos%20Mods-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/apksmodsandroid)
[![Ko-fi](https://img.shields.io/badge/Ko--fi-Apoiar%20Projeto-FF5E5B?style=for-the-badge&logo=kofi&logoColor=white)](https://ko-fi.com/emertels)

</div>
