# 🕹️ Intelligent Automation Suite: Game Emulator Downloader & Updater (v18.00)

<p align="center">
  <a href="README-PT-BR.md"><img src="https://img.shields.io/badge/Documenta%C3%A7%C3%A3o-Portugu%C3%AAs%20(Brasil)-green?style=for-the-badge" alt="PT-BR"></a>
  <a href="README-EN.md"><img src="https://img.shields.io/badge/Documentation-English-blue?style=for-the-badge" alt="EN"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge" alt="License"></a>
  <a href="#-supported-systems--emulators-56-engines"><img src="https://img.shields.io/badge/Emulators-56%20Engines-cyan?style=for-the-badge" alt="56 Emulators"></a>
</p>

Professional and intelligent **PowerShell** suite designed for autonomous downloading, surgical unpacking, extraction, and silent updating of an ecosystem of **56 game emulators, frontends, and ROM management utilities** on Windows.

---

## 📸 Screenshots & Live Terminal Interface

<p align="center">
  <img src="assets/baixador_preview.png" alt="Emulator Downloader 18.00" width="850" />
</p>

<p align="center">
  <img src="assets/atualizador_preview.png" alt="Emulator Updater 18.00" width="850" />
</p>

---

## 🧠 Why is the Suite Intelligent?

The automation suite was engineered with enterprise-grade autonomous mechanisms:
* **Autonomous 7-Zip Detection & Deployment:** Verifies if 7-Zip is installed or outdated. Automatically downloads and installs the official 64-bit version silently (`/S`) in the background before queuing downloads.
* **Resilient Rate-Limit Scraper (HTTP 403):** Integrated web scraping engine (`Get-GitHubReleaseAssetsWeb`) that bypasses GitHub REST API anonymous rate limits (60 requests/hr) by parsing direct links from HTML.
* **Hybrid Failover Shield (MEKA_Dual):** Queries AppVeyor CI for fresh nightly builds. If expired or down, silently switches to official stable GitHub Releases without throwing console errors.
* **Intelligent Session Caching (Nintendo Switch):** Downloads large official Firmware (324 MB) and Keys once per session, distributing locally to `Ryujinx`, `Ryujinx-Canary`, `Eden`, and `Citron-Neo` to eliminate redundant downloads.
* **Surgical User Data Preservation:** In the Updater, only old `.exe` and `.dll` files are deleted before unpacking. Configuration files (`.ini`, `.cfg`, `.json`), saves, states, shaders, BIOS, and controller mappings remain 100% untouched.
* **Automatic VIP Activation:** Directly injects Project64 VIP registration keys into the Windows Registry to permanently silence donation popups.

---

## 📌 Differences Between Scripts

* **`Baixador de Emuladores de Jogos 18.00.ps1` (Downloader - Fresh Setup)**:
  * Uses central root directory variable: `$Base = "C:\Emuladores"`.
  * Dynamically creates the entire folder hierarchy and subfolders if missing.
  * Downloads and extracts everything directly into `C:\Emuladores` without manual configuration.
  * Ideal for setting up a clean portable drive from scratch.
* **`Atualizador de Emuladores de Jogos 18.00.ps1` (Updater - Existing Setup)**:
  * Uses **absolute paths** configured per emulator.
  * Pre-configured with the universal placeholder: **`PUT_YOUR_DIRECTORY_HERE`** (e.g., `"PUT_YOUR_DIRECTORY_HERE\Nintendo Wii U\Cemu"`).
  * **How to configure:** Open the script in Notepad or VS Code, press `Ctrl + H` (Replace), and replace **`PUT_YOUR_DIRECTORY_HERE`** with your local emulators root directory (e.g., `D:\Games\Emulators` or `C:\Emulators`).
  * **How to exclude unused emulators:** If you do not have an emulator installed, simply **comment out its line with `#`** or delete the line at the bottom of the script.

---

## 🌐 Multilingual Support (10 Native Languages)

Version 18.00 **automatically detects** your operating system's language via `[System.Globalization.CultureInfo]::CurrentUICulture`:

* 🇧🇷 **Portuguese (`pt`)**
* 🇺🇸 **English (`en`)** *(Default universal fallback)*
* 🇪🇸 **Spanish (`es`)**
* 🇫🇷 **French (`fr`)**
* 🇩🇪 **German (`de`)**
* 🇮🇹 **Italian (`it`)**
* 🇯🇵 **Japanese (`ja`)**
* 🇨🇳 **Simplified Chinese (`zh`)**
* 🇷🇺 **Russian (`ru`)**
* 🇰🇷 **Korean (`ko`)**

### Manual Language Override:
```powershell
powershell -ExecutionPolicy Bypass -File ".\Atualizador de Emuladores de Jogos 18.00.ps1" -Lang en
powershell -ExecutionPolicy Bypass -File ".\Baixador de Emuladores de Jogos 18.00.ps1" -Lang es
```

---

## 📂 Supported Systems & Emulators (56 Engines)

* **Nintendo (18)**: Citron-Neo, Eden, Ryujinx, Ryujinx-Canary, Cemu, Dolphin, Azahar (3 branches), DeSmuME, FCEUX, bsnes, Snes9x, SuperSnes9x, SuperZSNES, Project64, Rosalie's Mupen GUI (RMG), mGBA, Gearboy, VisualBoyAdvance-M.
* **Sony (7)**: shadPS4 (PS4), RPCS3 (PS3), PCSX2 (PS2), DuckStation (PS1), PCSX-Redux (PS1), PPSSPP (PSP), Vita3K (PS Vita).
* **Microsoft (5)**: Xemu (Xbox), Cxbx-Reloaded (Xbox), Xenia Master (Xbox 360), Xenia Canary (Xbox 360), Xenia Edge (Xbox 360).
* **Sega / Arcade / Retro (19)**: Flycast, Flycast Dojo, Deecy, Ymir (AVX2), Ymir (SSE2), FinalBurn Neo, MAME Official, MAMEUI Classic, MAMEUI Plus!, ARCADE64, MEKA, Mesen, jgenesis, GearSystem, etc.
* **Frontends & Managers (7)**: RetroArch, Playnite, EmulationStation-DE, Attract-Mode Plus, Xenia Manager, ClrMame, ClrMamePro.

---

## 🚀 Usage Guide

1. **Prerequisites**:
   * Windows 10 or 11 (64-bit).
   * PowerShell 5.1 or newer.
   * Internet connection.
2. **Direct Execution**:
   * Double-click `Baixador-de-Emuladores.bat` or `Atualizador-de-Emuladores.bat`, or run from PowerShell:
     ```powershell
     powershell -ExecutionPolicy Bypass -File "Atualizador de Emuladores de Jogos 18.00.ps1"
     powershell -ExecutionPolicy Bypass -File "Baixador de Emuladores de Jogos 18.00.ps1"
     ```

---

## 👨‍💻 Author & Community

Developed by **Emerson Teles**.

* 💬 **Official Discord:** [Emerson Teles Official Server](https://discord.gg/cnTxQhWWQp)
* ✈️ **Telegram Mods Channel:** [APKs & Mods Android](https://t.me/apksmodsandroid)
* ☕ **Support on Ko-fi:** [ko-fi.com/emertels](https://ko-fi.com/emertels)
* 🐙 **GitHub:** [@Emertels](https://github.com/Emertels)

---

## 📄 License

Distributed under the **MIT** License. See [LICENSE](LICENSE) for details.
