# 🤖 AGENTS-PT-BR: Diretrizes de Manutenção para IA Agêntica

Este documento instrui modelos de linguagem, agentes de código e automações sobre as regras arquiteturais estritas que devem ser seguidas ao ler, refatorar ou expandir este repositório de scripts em PowerShell (Versão 18.10).

---

## 🎯 Regras Críticas de Adaptação pelo Usuário

### 1. Configuração de Diretórios no Atualizador vs Baixador
* **No `Atualizador de Emuladores de Jogos 18.10.ps1` (Pasta GitHub)**:
  * Todos os 56 caminhos do quarto argumento (`$ExtractPath`) nas chamadas `Update-Emu` utilizam o marcador em inglês e em maiúsculas: **`PUT_YOUR_DIRECTORY_HERE`**.
  * Exemplo: `Update-Emu "Cemu" "GitHub" "cemu-project/Cemu" "PUT_YOUR_DIRECTORY_HERE\Nintendo Wii U\Cemu" "windows-x64"`.
  * Qualquer agente ou usuário deve manter essa convenção universal na pasta pública do GitHub para permitir que usuários façam substituição via `Ctrl + H`.
  * O atualizador valida com `Test-Path`; se o diretório não existir, ele reporta `"ERRO: Pasta não encontrada!"` e pula com segurança.
* **No `Baixador de Emuladores de Jogos 18.10.ps1`**:
  * O diretório é controlado centralmente pela variável `$Base = "C:\Emuladores"`.
  * Cria as pastas automaticamente caso não existam. Não utiliza `PUT_YOUR_DIRECTORY_HERE`.

### 2. Customização e Exclusão de Emuladores Não Utilizados
* O script executa uma fila sequencial de chamadas `Update-Emu` no bloco `EMULADORES & PATCHES` e `FRONTENDS & GERENCIADORES`.
* **Como excluir um emulador:**
  * O usuário ou agente **NÃO DEVE** alterar a lógica interna das funções de rede (`Update-Emu`, `Custom-Download`, `Extract-And-Flatten`).
  * A remoção deve ser feita comentando com `#` ou apagando exclusivamente a linha da chamada específica no rodapé do script.
  * **Ajuste no Fechador Automático (`Get-Process`):** Se o usuário não possui o emulador no sistema, mantenha o nome na lista de encerramento apenas por segurança; sua presença não causa erros devido ao uso de `-ErrorAction SilentlyContinue`.

---

## 🛠️ Padrões de Engenharia do Código

Ao adicionar novos emuladores ou motores de raspagem, o agente DEVE seguir os seguintes padrões:

### 1. Codificação e Internacionalização (10 Idiomas)
* O arquivo do script **DEVE SER SALVO EM UTF-8 COM BOM** (`0xEF, 0xBB, 0xBF`). O PowerShell 5.1 no Windows interpreta arquivos sem BOM sob codificação ANSI (Windows-1252), causando erros de sintaxe (`UnexpectedToken`) ao encontrar ideogramas ou caracteres cirílicos.
* Toda mensagem visível exibida no terminal deve utilizar a função de tradução `T 'Chave'` consultando o dicionário `$Global:I18N`.
* Novos idiomas ou textos devem ser adicionados simetricamente em todos os 10 blocos de idioma (`pt`, `en`, `es`, `fr`, `de`, `it`, `ja`, `zh`, `ru`, `ko`).

### 2. Tratamento de Arquivos e LiteralPath
* Nunca use `-Path` com exclusões genéricas onde pastas possam conter colchetes `[` ou `]`.
* Use sempre `-LiteralPath` nas rotinas de manipulação do sistema de arquivos (`Test-Path`, `Get-ChildItem`, `Remove-Item`, `Copy-Item`).

### 3. Preservação de Configurações do Usuário
* Na função `Update-Emu`, o processo de limpeza antes da extração remove exclusivamente extensões binárias (`.exe`, `.dll`).
* **Proteções explícitas:** Arquivos de configurações (`.ini`, `.cfg`, `.json`), pastas de saves (`save/`, `states/`), pastas de jogos ou plugins específicos (como os listados nos blocos `$BlockPJ64` e `$BlockDolphin`) devem continuar rigorosamente intocados.

### 4. Nomenclatura e Fechamento de Processos (`Stop-Process`)
* A lista do `Get-Process` no início do script utiliza wildcards (`*`).
* O nome informado **deve ser o nome do processo executável em segundo plano**, não o título da janela.
  * Exemplo: Rosalie's Mupen GUI deve ser referenciado como `rmg*` (devido a `RMG.exe`).
  * Exemplo: ClrMamePro deve conter `cmp*` (devido a `cmpro.exe` e `cmpro64.exe`).

### 5. Resiliência de Links e Rate Limit
* Para repositórios do GitHub, sempre forneça o fallback `Get-GitHubReleaseAssetsWeb` caso a API REST retorne status 403 (Rate Limit).
* Para motores CI que purgam artefatos (como AppVeyor), utilize arquitetura híbrida testando o link antes de adicionar e chaveando silenciosamente para releases estáveis caso o artefato tenha expirado.
