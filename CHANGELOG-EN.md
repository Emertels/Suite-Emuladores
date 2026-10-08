# 📜 Version History / Changelog (English)

<p align="center">
  <a href="CHANGELOG-PT-BR.md"><img src="https://img.shields.io/badge/Changelog-Portugu%C3%AAs%20(Brasil)-green?style=for-the-badge" alt="PT-BR"></a>
  <a href="CHANGELOG-EN.md"><img src="https://img.shields.io/badge/Changelog-English-blue?style=for-the-badge" alt="EN"></a>
  <a href="README-EN.md"><img src="https://img.shields.io/badge/Back%20to-README-orange?style=for-the-badge" alt="README"></a>
</p>

---

## 🚀 [18.10] - 2026-10-08
* **Restoration & Dynamic Resolution for Ryujinx & Ryujinx-Canary Ecosystem:**
  * **Diagnostic & Fallback Strategy:** Due to the permanent shutdown of legacy upstream servers (`update.ryujinx.app` and `git.ryujinx.app` connection timeouts), the `RyujinxAPI` resolver was completely redesigned into an autonomous, multi-tier engine.
  * **Ryujinx Stable:** Autonomous tracking querying the active community repository `GRID0-net/GRID0-ryujinx` (with fallback to `NextendoNetwork/Ryujinx-Nextendo`), dynamically fetching the latest Windows x64 build (`win_x64.zip` / `win_x64.7z`).
  * **Ryujinx Canary:** Autonomous tracking querying the active release mirror `ewigl/ryubing-canary-mirror` (with fallback to `ADEMOLA200/Ryujinx-Canary-Builds`), dynamically retrieving the freshest Canary build available.
  * **Dual Anti-Rate-Limit Layer:** Both resolvers query GitHub API with automatic seamless fallback to pure HTML scraping (`expanded_assets`), guaranteeing 100% dynamic releases with zero hardcoded URLs and immune to HTTP 403 limits.
* **Permanent Fix for HUD Visual Overlap Glitch ("Organizing files..."):**
  * **Root Cause:** 7-Zip progress streaming (`-bsp1` piped into PowerShell) produced excessive output bursts and linebreaks on massive archives (such as RetroArch and Playnite), pushing console buffers down and desynchronizing the recorded cursor coordinate (`$Global:LOrgY`). This caused progress lines to overwrite subsequent emulator headers and remain orphaned on screen.
  * **Clean Resolution:** 7-Zip extraction now operates completely silently (`-bso0 -bsp0 2>&1 | Out-Null`). The console displays a clean stationary organizing status without buffer scrolling, and the `finally` block precisely erases the line and prints the green success message with zero screen artifacts.
* **Continuous Dynamic Resolution for BizHawk Dev (Nightly):**
  * Engine (`BizHawk_Dev`) fully integrated across main scripts, dynamically querying master branch continuous artifacts via GitHub Actions and `nightly.link` without hardcoded direct links.
* **ClrMamePro Synchronization & Verification:**
  * Standardized `ClrMame_Pro_Combo` across all scripts, verifying folder existence before triggering downloads and properly sorting dual binaries into `ClrMamePro-32` and `ClrMamePro-64`.
* **Nintendo Switch Local Paths Update:**
  * Updated user default directories for Ryujinx and Ryujinx Canary in the local Updater (`D:\Games\Emuladores\Nintendo Switch\Ryujinx` and `D:\Games\Emuladores\Nintendo Switch\Ryujinx Canary`), preserving 56 `PUT_YOUR_DIRECTORY_HERE` placeholders in the GitHub edition.
* **HUD Header Symmetry & Centering:**
  * Author spacing mathematically adjusted to 7 spaces, symmetrically centering "Teles" right beneath "Emerson" across all 10 language profiles.
* **Universal 18.10 Release Alignment:**
  * All scripts, `.bat` launchers, dictionaries, and documentation updated to v18.10 with 0 AST parse errors and UTF-8 BOM encoding.

---
## 🚀 [18.10] - 2026-09-28
* **Full Internationalization (10 Native Languages):** Autonomous operating system language detection (`[System.Globalization.CultureInfo]::CurrentUICulture`) and built-in dictionary supporting 10 languages: Portuguese (`pt`), English (`en`), Spanish (`es`), French (`fr`), German (`de`), Italian (`it`), Japanese (`ja`), Simplified Chinese (`zh`), Russian (`ru`), and Korean (`ko`). Full support for manual runtime override (`-Lang <code>`) and universal automatic fallback to English.
* **MEKA Anti-Failover Shield (Hybrid `MEKA_Dual` Architecture):** Tracking completely re-architected. Primarily queries AppVeyor CI for fresh continuous integration nightlies. If AppVeyor artifacts are expired (30-day retention limit) or unavailable, it instantly and 100% silently switches to official stable GitHub Releases (`ocornut/meka`), without terminal errors or visual clutter.
* **jgenesis Upstream Naming & Radar Alignment:** Calibrated regex tracking for jgenesis following upstream build renaming (removal of `gui-` prefix to `jgenesis-*-windows-x86_64.zip`), restoring uninterrupted automated updates.
* **Contingency GitHub Rate Limit Web Scraper (HTTP 403 Bypass):** Resilient scraping engine (`Get-GitHubReleaseAssetsWeb`) that intercepts GitHub public REST API rate limits (60 req/hr) and directly scrapes download links from clean HTML on `expanded_assets`, ensuring uninterrupted downloads under strict IP limits.
* **Surgical Asset Filtering:**
  * **Xenia Canary:** Strict regex filter discards Linux packages (`xenia_canary_linux.AppImage`), downloading Windows binaries exclusively.
  * **PCSX2:** Badwords filter excludes debug packages (`-symbols.7z`, `pdb`, `debug`).
* **Dynamic BizHawk Dev Build Resolution (`BizHawk_Dev`):** Replaced hardcoded links with an autonomous resolver: dynamically queries latest CI artifacts from TASEmulators master branch on GitHub Actions with a zero-rate-limit Web scraping fallback, downloading the freshest dev zip via `nightly.link` without hardcoded URLs.
* **Universal UTF-8 Encoding Compatibility:** Scripts encoded in UTF-8 with BOM, guaranteeing full compatibility across Windows PowerShell 5.1 and PowerShell 7+ without character corruption in Cyrillic, Asian scripts, or accented Latin alphabets.
* **HUD Author Centering:** Mathematical alignment in the terminal header, perfectly centering the author signature "Teles" under "Emerson" with unified column padding across all languages.
* **Ecosystem Audit (56 Engines):** Comprehensive validation of all 56 emulators, frontends, patches, and ROM management utilities across Downloader and Updater scripts.

---

## ⚡ [17.50] - 2026-07-08
* **Massive Platform Expansion:** Native addition of modern engines: shadPS4 (PS4), Vita3K (PS Vita), Xemu (Original Xbox), DuckStation & PCSX-Redux (PS1), bsnes (SNES), and Xenia Manager (Xbox 360).
* **New GitHub Tracking for MEKA:** Rebuilt tracker targeting official GitHub API releases with `win32|mekaw` regex, securing stable permanent builds.
* **Switch Asset Telemetry:** Dynamic mathematical calculation of package sizes on disk (`$Global:FwSizeStr` and `$Global:KeySizeStr`), reporting Firmware in MB and Keys in KB on success.
* **HUD Cleanup on Exit (`Update-HUD -Clear $true`):** Surgical cleanup clearing speed meters and timers, presenting an immaculate Final Scoreboard.

---

## 🛡️ [17.20] - 2026-06-26
* **Ninja Identity System (Anti-Cloudflare Bypass):** Global network engine emulates real Google Chrome 125 browser signature, bypassing anti-bot screens on prodkeys.net for automated Switch Keys retrieval.
* **Exclusive `GitHub_Tag` Engine for Citron-Neo:** Queries release drawers directly under the `nightly-windows` tag.
* **Regex Calibration for Xenia Patches & RMG:** Adapted to new `.7z` archives for Xenia and the "Portable" keyword in Rosalie's Mupen GUI releases.
* **Standardized Exception Feedback:** Clean, concise error tags (`(Error 404)`, `(Missing Link)`, `(Network Fail)`).
* **Nintendo Switch Metrics Fix:** Resolved counter omission bug for Nintendo Switch emulators.

---

## 🏭 [15.85] - 2026-06-21
* **"Assembly Line" Terminal Architecture:** Real-time granular tracking and status reporting for each individual component (Core Emulator, Patches, Graphic Packs, Firmware, Keys).
* **Intelligent Grammatical & Dual-Matrix Tags:** Dynamic singular/plural detection and dynamic `(32-bit)` / `(64-bit)` labeling for dual-architecture emulators (FCEUX, Snes9x).
* **API Error Bleed Shield:** Intercepts and suppresses verbose JSON rate-limit error dumps.
* **Decoupled Switch Firmware & Keys:** Failures in Firmware downloads do not interrupt or affect Keys fetching.

---

## 🔧 [15.70] - 2026-05-21
* **Code Structure & Stability Overhaul:** Eliminated syntax freezes and loop anomalies.
* **Mesen Tracker Update:** Updated regex for new `Mesen_X.X.X_Windows.zip` release format.
* **Queue Optimization:** Deprecated unstable and heavily rate-limited scraper targets.

---

## 🔍 [15.50] - 2026-05-17
* **High-Precision Exclusion Filters:** Eliminated false positives that blocked 64-bit binaries containing '32' in the filename.
* **Dynamic ProdKeys Scraper:** Fully automated web scraping on prodkeys.net replacing static links.
* **Autonomous 7-Zip Manager:** Detects 7-Zip absence or obsolescence, quietly downloading and installing the latest official build (`/S`).

---

## ⚡ [15.40] - 2026-05-15
* **GUID-Isolated Sessions:** Unique temporary directories per run enabling safe concurrent executions.
* **Native GZip/Deflate Decompression in HttpClient:** Drastically reduced API payload overhead and latency.
* **256KB Download Buffer:** Maximized throughput on high-speed gigabit connections.
* **Terminal Resize Crash Guard:** Ancoring cursor coordinates safely against console resizing.
* **Strict `-LiteralPath` Enforcement:** Complete support for paths containing square brackets `[` and `]`.
* **Aggressive RPCS3 Filtering:** Queries latest releases while ignoring debug/symbol archives.
* **Eden Points to Eden-CI:** Prioritizes recommended MSVC builds for graphics compatibility.
* **Pure .NET Directory Creation:** Direct C# system calls ensuring crash-proof folder hierarchy generation.
* **RMG and Mesen Added:** Official catalog elevated to 56 engines.
* **Protected ENTER Key Exit:** Safe terminal pause preventing accidental window termination.

---

## 🎮 [15.10] - 2026-05-10
* **Native RetroArch Support:** Direct extraction pipeline via Libretro Buildbot.
* **SuperSnes9x & SuperZSNES Added:** Hybrid GitHub API and direct web scraping integrations.
* **Eden Switch Emulator Added:** Automated retrieval of standard MSVC releases.
* **Single-Session Switch Cache:** Firmware (324 MB) and Keys downloaded once and shared locally across Citron-Neo, Eden, Ryujinx, and Ryujinx-Canary.
* **Deferred Temp Cleanup:** Cleans large temp files only after complete queue execution.
* **Minimalist HUD:** Clean `[XX%]` progress indicators across download and extraction phases.
* **Project64 VIP Activation:** Direct injection into Windows Registry.

---

## 🗂️ [12.70] - 2026-04-26
* **Category Separation:** Clear visual distinction between "EMULATORS" and "FRONTENDS & MANAGERS".
* **Dolphin CI Integration:** Dynamic build tracking immune to random hash directories.
* **DeSmuME Automatic Fallback:** Secondary GitHub Releases failover route.
* **Attract-Mode Plus & ClrMame C++:** Advanced arcade and ROM management utilities added.

---

## 🕹️ [12.50] - 2026-04-25
* **Complete MAME Family:** Official MAME, MAMEUI64 Classic, and MAMEUI64 Plus!.
* **Ryujinx Mirror Failover:** Intelligent redirection to Ryubing in case of API downtime.
* **MAMEUI Plus! Hierarchy Fix:** Automatically strips redundant subfolder `mameui+`.
* **7-Zip Self-Extracting `.exe` Support.**

---

## 🎯 [12.40] - 2026-04-23
* **mGBA & Deecy Added:** GBA and Dreamcast emulation support.
* **Project64 Silent Activation:** 100% Windows registry activation.

---

## 📊 [12.38] - 2026-04-21
* **Rebuilt Final Scoreboard:** Accurate success/failure counts without duplicate or negative tallies.
* **Console Color Highlighting:** Distinct visual tracking for extraction and organization stages.

---

## 🌐 [12.37] - 2026-04-19
* **.NET HttpClient with 128KB Buffer:** Modern networking replacing legacy WebRequest and slow BITS.
* **Single Connection Instance:** Prevents socket exhaustion during bulk downloads.
* **Dynamic User-Agent Rotation:** Bypasses server-side bot flags.
* **Azahar Nested ZIP Handling:** Strips internal duplicate archives.
* **3-Minute Global Timeout:** Guards against hung external connections.
* **Ares, jgenesis, GearSystem, MEKA, Playnite, and EmulationStation-DE Added.**
* **Dual-Build Snes9xCombo:** Downloads 32-bit and 64-bit concurrently in a single pass.

---

## 🚀 [12.01] - 2026-04-18
* **FinalBurn Neo (64-bit) & BizHawk (Stable/Nightly) Added.**
* **Surgical User Data Protection:** Pre-extraction cleanup targets `.exe` and `.dll` binaries only, keeping configs, saves, shaders, and BIOS intact.
* **Automatic Graphic Packs & Patches Routing:** Autonomous sorting into Cemu and Xenia directories.

---

## 📦 [11.40] - 2026-04-17
* **Multi-Package Handling for Xenia:** Downloads core emulator plus compatibility patches.
* **Xenia Edge Added via GitHub API.**

---

## 🔒 [11.35] - 2026-04-16
* **Integrity Validation (`7z t`):** Silent archive testing before extraction, discarding corrupt downloads.
* **Resilient Connection Handling.**

---

## 👶 [11.29] - 2026-04-15
* **First Unified Automated Release.**
* **Basic Telemetry:** Elapsed time and dynamic percentage meters.
* **Initial Cross-Platform Tracking:** DeSmuME, Flycast Dojo, Ymir, and Azahar.
* **Dual-Matrix Support:** Simultaneous 32-bit and 64-bit tracking for PPSSPP and Snes9x.
