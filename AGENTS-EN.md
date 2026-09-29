# 🤖 AGENTS-EN: Maintenance Guidelines for Agentic AI

This document instructs Large Language Models (LLMs), AI code assistants, and automated pipelines on the strict architectural rules required when reading, refactoring, or extending this PowerShell emulation script suite (Version 18.00).

---

## 🎯 Critical User Adaptation Rules

### 1. Directory Configuration in Updater vs Downloader
* **In `Atualizador de Emuladores de Jogos 18.00.ps1` (GitHub Folder)**:
  * All 56 emulator target directories (the 4th argument `$ExtractPath` in `Update-Emu` calls) use the uppercase English placeholder: **`PUT_YOUR_DIRECTORY_HERE`**.
  * Example: `Update-Emu "Cemu" "GitHub" "cemu-project/Cemu" "PUT_YOUR_DIRECTORY_HERE\Nintendo Wii U\Cemu" "windows-x64"`.
  * Agents and maintainers must preserve this placeholder convention in public releases to allow users to find-and-replace (`Ctrl + H`) with their actual emulator path.
  * The updater uses `Test-Path`; if a path does not exist, it safely skips with `"ERRO: Pasta não encontrada!"`.
* **In `Baixador de Emuladores de Jogos 18.00.ps1`**:
  * Destination is centrally managed via `$Base = "C:\Emuladores"`.
  * Creates all folders automatically. Does not use `PUT_YOUR_DIRECTORY_HERE`.

### 2. Customizing and Removing Unused Emulators
* The script runs a sequential queue of `Update-Emu` invocations within the `EMULADORES & PATCHES` and `FRONTENDS & GERENCIADORES` categories.
* **How to exclude an emulator:**
  * Agents **MUST NOT** modify the internal networking logic (`Update-Emu`, `Custom-Download`, `Extract-And-Flatten`).
  * Exclusion must be performed exclusively by commenting out (`#`) or deleting the specific `Update-Emu` call line near the bottom of the script.
  * **Automated Process Terminator (`Get-Process`):** If the user lacks an emulator on their system, leave its process tag in the termination list; it will not trigger errors due to `-ErrorAction SilentlyContinue`.

---

## 🛠️ Code Engineering Standards

When introducing new emulators or scraping routines, agents MUST adhere to:

### 1. Encoding and 10-Language Internationalization
* Scripts **MUST BE SAVED IN UTF-8 WITH BOM** (`0xEF, 0xBB, 0xBF`). Windows PowerShell 5.1 parses non-BOM scripts as Windows-1252 ANSI, triggering syntax errors (`UnexpectedToken`) when encountering CJK or Cyrillic characters.
* Every UI message printed to the console must call `T 'Key'` to fetch localized strings from `$Global:I18N`.
* Any new UI strings must be added symmetrically across all 10 supported languages (`pt`, `en`, `es`, `fr`, `de`, `it`, `ja`, `zh`, `ru`, `ko`).

### 2. File Handling and LiteralPath
* Never use wildcards with `-Path` where folders might contain brackets (`[` or `]`).
* Always use `-LiteralPath` in filesystem operations (`Test-Path`, `Get-ChildItem`, `Remove-Item`, `Copy-Item`).

### 3. Preserving User Data and Configuration
* In `Update-Emu`, file cleanup before extraction deletes only binary extensions (`.exe`, `.dll`).
* **Explicit Protection:** Configuration files (`.ini`, `.cfg`, `.json`), save folders (`save/`, `states/`), game folders, and specialized plugin folders must remain strictly untouched.

### 4. Process Termination Naming (`Stop-Process`)
* The `Get-Process` list at the start of the script uses wildcards (`*`).
* Always pass the **background process executable name**, not the window title.
  * Example: Rosalie's Mupen GUI is tracked as `rmg*` (for `RMG.exe`).
  * Example: ClrMamePro is tracked as `cmp*` (for `cmpro.exe` and `cmpro64.exe`).

### 5. Link Resilience and Rate Limiting
* For GitHub releases, always provide the web scraper fallback (`Get-GitHubReleaseAssetsWeb`) to bypass anonymous 60 req/hr HTTP 403 blocks.
* For CI providers with artifact expiration (e.g., AppVeyor), implement hybrid fallback mechanisms that validate link availability and silently switch to official releases upon expiration.
