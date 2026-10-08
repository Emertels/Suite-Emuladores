param(
    [string]$Lang = ""
)

[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12 
[Net.ServicePointManager]::Expect100Continue = $false 
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [Console]::OutputEncoding 
$ProgressPreference = 'SilentlyContinue'  

# ==============================================================================
# MOTOR DE INTERNACIONALIZAÇÃO (10 IDIOMAS GLOBAIS)
# ==============================================================================
$SupportedLangs = @('pt', 'en', 'es', 'fr', 'de', 'it', 'ja', 'zh', 'ru', 'ko')

if (-not $Lang -or $Lang.ToLower() -notin $SupportedLangs) {
    $sysTwoLetter = ([System.Globalization.CultureInfo]::CurrentUICulture.TwoLetterISOLanguageName).ToLower()
    if ($sysTwoLetter -in $SupportedLangs) {
        $Global:CurrentLang = $sysTwoLetter
    } else {
        $Global:CurrentLang = "en"
    }
} else {
    $Global:CurrentLang = $Lang.ToLower()
}

$Global:I18N = @{
    'pt' = @{
        'LangLabel' = 'Português';
        'Title' = 'ATUALIZADOR DE EMULADORES 18.10';
        'By' =  'By: Emerson';
        'Author' = 'Teles';
        'SessionStarted' = 'Sessão iniciada:';
        'Time' = 'Tempo:';
        'WarnClose' = 'ATENÇÃO: OS EMULADORES SERÃO ENCERRADOS AUTOMATICAMENTE: {0}... ';
        'DownloadProgress' = 'Download em andamento...';
        'Downloading' = '  Baixando: {0} ';
        'Downloaded' = '  Baixado: {0} ({1} MB)';
        'Organizing' = '  Organizando arquivos...';
        'OrganizingFw' = '  Organizando Firmware...';
        'OrganizingKeys' = '  Organizando Keys...';
        'OkUpdatedSingular' = '  OK: {0} atualizado!';
        'OkUpdatedPlural' = '  OK: {0} atualizados!';
        'OkFw' = '  OK: Firmware atualizada!';
        'OkKeys' = '  OK: Keys atualizadas!';
        'OkVip' = '  OK: Registro VIP Injetado!';
        'ErrFolderNotFound' = '  ERRO: Pasta não encontrada!';
        'ErrProcess' = '  ERRO: Falha ao processar o {0}';
        'RateLimitNotice' = '  AVISO: Limite de taxa excedido para o IP {0}. Tentando raspagem direta...';
        'ErrComponent' = '  ERRO: Falha ao baixar os {0} ({1})';
        'ErrFirmware' = '  ERRO: Falha na Firmware ({0})';
        'ErrKeys' = '  ERRO: Falha nas Keys ({0})';
        'TotalTime' = '  TEMPO TOTAL: {0}m {1}s';
        'SuccessCount' = '  ATUALIZADOS: ';
        'FailedCount' = '  NÃO ATUALIZADOS: ';
        'AllDone' = '----- TUDO PRONTO! -----';
        'PressEnter' = 'Pressione ENTER para sair';
        'CatEmus' = '|   EMULADORES & PATCHES   |';
        'CatFrontends' = '|  FRONTENDS & GERENCIADORES  |';
        'SevenZipInstall' = '[7-Zip] INSTALANDO {0} ';
        'SevenZipUpdate' = '[7-Zip] ATUALIZANDO para {0} ';
        'SevenZipAlert' = '  ALERTA: O 7-Zip não foi encontrado e não foi possível instalar!';
        'SevenZipFree' = '  Baixe e instale gratuitamente em: https://www.7-zip.org/';
        'DlFinished' = 'Download concluído!';
        'DlError' = 'ERRO NO DOWNLOAD!';
        'FatalError' = 'ALERTA CRÍTICO: Ocorreu um erro fatal no núcleo do script';
        'HiddenSize' = ' (Tamanho oculto)';
        'Complement' = 'Complemento';
        'RateLimitBlock' = 'Bloqueio do GitHub';
        'NotFound' = 'Não encontrado';
        'NetworkFail' = 'Falha de rede'
    };
    'en' = @{
        'LangLabel' = 'English';
        'Title' = 'EMULATOR UPDATER 18.10';
        'By' =  'By: Emerson';
        'Author' = 'Teles';
        'SessionStarted' = 'Session started:';
        'Time' = 'Time:';
        'WarnClose' = 'WARNING: EMULATORS WILL BE CLOSED AUTOMATICALLY: {0}... ';
        'DownloadProgress' = 'Download in progress...';
        'Downloading' = '  Downloading: {0} ';
        'Downloaded' = '  Downloaded: {0} ({1} MB)';
        'Organizing' = '  Organizing files...';
        'OrganizingFw' = '  Organizing Firmware...';
        'OrganizingKeys' = '  Organizing Keys...';
        'OkUpdatedSingular' = '  OK: {0} updated!';
        'OkUpdatedPlural' = '  OK: {0} updated!';
        'OkFw' = '  OK: Firmware updated!';
        'OkKeys' = '  OK: Keys updated!';
        'OkVip' = '  OK: VIP Registry Injected!';
        'ErrFolderNotFound' = '  ERROR: Folder not found!';
        'ErrProcess' = '  ERROR: Failed to process {0}';
        'RateLimitNotice' = '  WARNING: Rate limit exceeded for IP {0}. Attempting direct scraping...';
        'ErrComponent' = '  ERROR: Failed to download {0} ({1})';
        'ErrFirmware' = '  ERROR: Firmware failure ({0})';
        'ErrKeys' = '  ERROR: Keys failure ({0})';
        'TotalTime' = '  TOTAL TIME: {0}m {1}s';
        'SuccessCount' = '  UPDATED: ';
        'FailedCount' = '  NOT UPDATED: ';
        'AllDone' = '----- ALL DONE! -----';
        'PressEnter' = 'Press ENTER to exit';
        'CatEmus' = '|   EMULATORS & PATCHES    |';
        'CatFrontends' = '|   FRONTENDS & MANAGERS   |';
        'SevenZipInstall' = '[7-Zip] INSTALLING {0} ';
        'SevenZipUpdate' = '[7-Zip] UPDATING to {0} ';
        'SevenZipAlert' = '  ALERT: 7-Zip was not found and could not be installed!';
        'SevenZipFree' = '  Download and install for free at: https://www.7-zip.org/';
        'DlFinished' = 'Download finished!';
        'DlError' = 'DOWNLOAD ERROR!';
        'FatalError' = 'CRITICAL ALERT: A fatal error occurred in script core';
        'HiddenSize' = ' (Hidden size)';
        'Complement' = 'Add-on';
        'RateLimitBlock' = 'GitHub Rate Limit';
        'NotFound' = 'Not found';
        'NetworkFail' = 'Network failure'
    };
    'es' = @{
        'LangLabel' = 'Español';
        'Title' = 'ACTUALIZADOR DE EMULADORES 18.10';
        'By' = 'Por: Emerson';
        'Author' = 'Teles';
        'SessionStarted' = 'Sesión iniciada:';
        'Time' = 'Tiempo:';
        'WarnClose' = 'ATENCIÓN: LOS EMULADORES SE CERRARÁN AUTOMÁTICAMENTE: {0}... ';
        'DownloadProgress' = 'Descarga en curso...';
        'Downloading' = '  Descargando: {0} ';
        'Downloaded' = '  Descargado: {0} ({1} MB)';
        'Organizing' = '  Organizando archivos...';
        'OrganizingFw' = '  Organizando Firmware...';
        'OrganizingKeys' = '  Organizando Keys...';
        'OkUpdatedSingular' = '  OK: ¡{0} actualizado!';
        'OkUpdatedPlural' = '  OK: ¡{0} actualizados!';
        'OkFw' = '  OK: ¡Firmware actualizada!';
        'OkKeys' = '  OK: ¡Keys actualizadas!';
        'OkVip' = '  OK: ¡Registro VIP Inyectado!';
        'ErrFolderNotFound' = '  ERROR: ¡Carpeta no encontrada!';
        'ErrProcess' = '  ERROR: Fallo al procesar {0}';
        'RateLimitNotice' = '  AVISO: Límite de tasa excedido para la IP {0}. Probando raspado directo...';
        'ErrComponent' = '  ERROR: Fallo al descargar {0} ({1})';
        'ErrFirmware' = '  ERROR: Fallo en Firmware ({0})';
        'ErrKeys' = '  ERROR: Fallo en Keys ({0})';
        'TotalTime' = '  TIEMPO TOTAL: {0}m {1}s';
        'SuccessCount' = '  ACTUALIZADOS: ';
        'FailedCount' = '  NO ACTUALIZADOS: ';
        'AllDone' = '----- ¡TODO LISTO! -----';
        'PressEnter' = 'Presione ENTER para salir';
        'CatEmus' = '|   EMULADORES Y PARCHES   |';
        'CatFrontends' = '|   FRONTENDS Y GESTORES   |';
        'SevenZipInstall' = '[7-Zip] INSTALANDO {0} ';
        'SevenZipUpdate' = '[7-Zip] ACTUALIZANDO a {0} ';
        'SevenZipAlert' = '  ALERTA: ¡No se encontró 7-Zip y no se pudo instalar!';
        'SevenZipFree' = '  Descargue e instale gratis en: https://www.7-zip.org/';
        'DlFinished' = '¡Descarga finalizada!';
        'DlError' = '¡ERROR EN LA DESCARGA!';
        'FatalError' = 'ALERTA CRÍTICA: Ocurrió un error fatal en el núcleo del script';
        'HiddenSize' = ' (Tamaño oculto)';
        'Complement' = 'Complemento';
        'RateLimitBlock' = 'Bloqueo de GitHub';
        'NotFound' = 'No encontrado';
        'NetworkFail' = 'Fallo de red'
    };
    'fr' = @{
        'LangLabel' = 'Français';
        'Title' = 'MISE À JOUR D''ÉMULATEURS 18.10';
        'By' = 'Par : Emerson';
        'Author' = 'Teles';
        'SessionStarted' = 'Session commencée :';
        'Time' = 'Temps :';
        'WarnClose' = 'ATTENTION : LES ÉMULATEURS SERONT FERMÉS AUTOMATIQUEMENT : {0}... ';
        'DownloadProgress' = 'Téléchargement en cours...';
        'Downloading' = '  Téléchargement : {0} ';
        'Downloaded' = '  Téléchargé : {0} ({1} MB)';
        'Organizing' = '  Organisation des fichiers...';
        'OrganizingFw' = '  Organisation du Firmware...';
        'OrganizingKeys' = '  Organisation des Keys...';
        'OkUpdatedSingular' = '  OK : {0} mis à jour !';
        'OkUpdatedPlural' = '  OK : {0} mis à jour !';
        'OkFw' = '  OK : Firmware mis à jour !';
        'OkKeys' = '  OK : Keys mises à jour !';
        'OkVip' = '  OK : Registre VIP injecté !';
        'ErrFolderNotFound' = '  ERREUR : Dossier introuvable !';
        'ErrProcess' = '  ERREUR : Échec du traitement de {0}';
        'RateLimitNotice' = '  AVIS : Limite de requêtes dépassée pour IP {0}. Essai de scraping direct...';
        'ErrComponent' = '  ERREUR : Échec du téléchargement de {0} ({1})';
        'ErrFirmware' = '  ERREUR : Échec Firmware ({0})';
        'ErrKeys' = '  ERREUR : Échec Keys ({0})';
        'TotalTime' = '  TEMPS TOTAL : {0}m {1}s';
        'SuccessCount' = '  MIS À JOUR : ';
        'FailedCount' = '  NON MIS À JOUR : ';
        'AllDone' = '----- TOUT EST PRÊT ! -----';
        'PressEnter' = 'Appuyez sur ENTRÉE pour quitter';
        'CatEmus' = '|   ÉMULATEURS & PATCHS    |';
        'CatFrontends' = '|  FRONTENDS & GESTIONNAIRES  |';
        'SevenZipInstall' = '[7-Zip] INSTALLATION DE {0} ';
        'SevenZipUpdate' = '[7-Zip] MISE À JOUR vers {0} ';
        'SevenZipAlert' = '  ALERTE : 7-Zip est introuvable et n''a pas pu être installé !';
        'SevenZipFree' = '  Téléchargez et installez gratuitement sur : https://www.7-zip.org/';
        'DlFinished' = 'Téléchargement terminé !';
        'DlError' = 'ERREUR DE TÉLÉCHARGEMENT !';
        'FatalError' = 'ALERTE CRITIQUE : Une erreur fatale s''est produite dans le noyau du script';
        'HiddenSize' = ' (Taille masquée)';
        'Complement' = 'Complément';
        'RateLimitBlock' = 'Blocage GitHub';
        'NotFound' = 'Introuvable';
        'NetworkFail' = 'Échec réseau'
    };
    'de' = @{
        'LangLabel' = 'Deutsch';
        'Title' = 'EMULATOR-AKTUALISIERER 18.10';
        'By' = 'Von: Emerson';
        'Author' = 'Teles';
        'SessionStarted' = 'Sitzung gestartet:';
        'Time' = 'Zeit:';
        'WarnClose' = 'ACHTUNG: EMULATOREN WERDEN AUTOMATISCH BEENDET: {0}... ';
        'DownloadProgress' = 'Download läuft...';
        'Downloading' = '  Herunterladen: {0} ';
        'Downloaded' = '  Heruntergeladen: {0} ({1} MB)';
        'Organizing' = '  Dateien werden organisiert...';
        'OrganizingFw' = '  Firmware wird organisiert...';
        'OrganizingKeys' = '  Keys werden organisiert...';
        'OkUpdatedSingular' = '  OK: {0} aktualisiert!';
        'OkUpdatedPlural' = '  OK: {0} aktualisiert!';
        'OkFw' = '  OK: Firmware aktualisiert!';
        'OkKeys' = '  OK: Keys aktualisiert!';
        'OkVip' = '  OK: VIP-Registrierung injiziert!';
        'ErrFolderNotFound' = '  FEHLER: Ordner nicht gefunden!';
        'ErrProcess' = '  FEHLER: Fehler beim Verarbeiten von {0}';
        'RateLimitNotice' = '  HINWEIS: Ratenlimit überschritten für IP {0}. Direkter Abruf wird versucht...';
        'ErrComponent' = '  FEHLER: Download fehlgeschlagen für {0} ({1})';
        'ErrFirmware' = '  FEHLER: Firmware-Fehler ({0})';
        'ErrKeys' = '  FEHLER: Keys-Fehler ({0})';
        'TotalTime' = '  GESAMTZEIT: {0}m {1}s';
        'SuccessCount' = '  AKTUALISIERT: ';
        'FailedCount' = '  NICHT AKTUALISIERT: ';
        'AllDone' = '----- ALLES ERLEDIGT! -----';
        'PressEnter' = 'Drücken Sie die EINGABETASTE zum Beenden';
        'CatEmus' = '|   EMULATOREN & PATCHES   |';
        'CatFrontends' = '|   FRONTENDS & MANAGER    |';
        'SevenZipInstall' = '[7-Zip] INSTALLIERE {0} ';
        'SevenZipUpdate' = '[7-Zip] AKTUALISIERE auf {0} ';
        'SevenZipAlert' = '  WARNUNG: 7-Zip wurde nicht gefunden und konnte nicht installiert werden!';
        'SevenZipFree' = '  Kostenlos herunterladen und installieren unter: https://www.7-zip.org/';
        'DlFinished' = 'Download abgeschlossen!';
        'DlError' = 'DOWNLOAD-FEHLER!';
        'FatalError' = 'KRITISCHE WARNUNG: Ein schwerwiegender Fehler ist im Skriptkern aufgetreten';
        'HiddenSize' = ' (Größe verborgen)';
        'Complement' = 'Ergänzung';
        'RateLimitBlock' = 'GitHub-Blockierung';
        'NotFound' = 'Nicht gefunden';
        'NetworkFail' = 'Netzwerkfehler'
    };
    'it' = @{
        'LangLabel' = 'Italiano';
        'Title' = 'AGGIORNATORE DI EMULATORI 18.10';
        'By' = 'Di: Emerson';
        'Author' = 'Teles';
        'SessionStarted' = 'Sessione avviata:';
        'Time' = 'Tempo:';
        'WarnClose' = 'ATTENZIONE: GLI EMULATORI VERRANNO CHIUSI AUTOMATICAMENTE: {0}... ';
        'DownloadProgress' = 'Download in corso...';
        'Downloading' = '  Scaricamento: {0} ';
        'Downloaded' = '  Scaricato: {0} ({1} MB)';
        'Organizing' = '  Organizzazione file...';
        'OrganizingFw' = '  Organizzazione Firmware...';
        'OrganizingKeys' = '  Organizzazione Keys...';
        'OkUpdatedSingular' = '  OK: {0} aggiornato!';
        'OkUpdatedPlural' = '  OK: {0} aggiornati!';
        'OkFw' = '  OK: Firmware aggiornato!';
        'OkKeys' = '  OK: Keys aggiornate!';
        'OkVip' = '  OK: Registro VIP inserito!';
        'ErrFolderNotFound' = '  ERRORE: Cartella non trovata!';
        'ErrProcess' = '  ERRORE: Errore durante l''elaborazione di {0}';
        'RateLimitNotice' = '  AVVISO: Limite di frequenza superato per IP {0}. Tento lo scraping diretto...';
        'ErrComponent' = '  ERRORE: Errore nello scaricare {0} ({1})';
        'ErrFirmware' = '  ERRORE: Errore Firmware ({0})';
        'ErrKeys' = '  ERRORE: Errore Keys ({0})';
        'TotalTime' = '  TEMPO TOTALE: {0}m {1}s';
        'SuccessCount' = '  AGGIORNATI: ';
        'FailedCount' = '  NON AGGIORNATI: ';
        'AllDone' = '----- TUTTO PRONTO! -----';
        'PressEnter' = 'Premi INVIO per uscire';
        'CatEmus' = '|    EMULATORI & PATCH     |';
        'CatFrontends' = '|    FRONTEND & GESTORI    |';
        'SevenZipInstall' = '[7-Zip] INSTALLAZIONE DI {0} ';
        'SevenZipUpdate' = '[7-Zip] AGGIORNAMENTO a {0} ';
        'SevenZipAlert' = '  AVVISO: 7-Zip non è stato trovato e non è stato possibile installarlo!';
        'SevenZipFree' = '  Scarica e installa gratuitamente su: https://www.7-zip.org/';
        'DlFinished' = 'Download completato!';
        'DlError' = 'ERRORE NEL DOWNLOAD!';
        'FatalError' = 'AVVISO CRITICO: Si è verificato un errore grave nel core dello script';
        'HiddenSize' = ' (Dimensione nascosta)';
        'Complement' = 'Componente';
        'RateLimitBlock' = 'Blocco GitHub';
        'NotFound' = 'Non trovato';
        'NetworkFail' = 'Errore di rete'
    };
    'ja' = @{
        'LangLabel' = '日本語';
        'Title' = 'エミュレータアップデータ 18.10';
        'By' = '作成者: Emerson';
        'Author' = 'Teles';
        'SessionStarted' = 'セッション開始:';
        'Time' = '時間:';
        'WarnClose' = '注意: エミュレータは自動的に終了します: {0}... ';
        'DownloadProgress' = 'ダウンロード進行中...';
        'Downloading' = '  ダウンロード中: {0} ';
        'Downloaded' = '  ダウンロード完了: {0} ({1} MB)';
        'Organizing' = '  ファイルを整理中...';
        'OrganizingFw' = '  ファームウェアを整理中...';
        'OrganizingKeys' = '  キーを整理中...';
        'OkUpdatedSingular' = '  OK: {0} が更新されました!';
        'OkUpdatedPlural' = '  OK: {0} が更新されました!';
        'OkFw' = '  OK: ファームウェアが更新されました!';
        'OkKeys' = '  OK: キーが更新されました!';
        'OkVip' = '  OK: VIPレジストリが登録されました!';
        'ErrFolderNotFound' = '  エラー: フォルダが見つかりません!';
        'ErrProcess' = '  エラー: {0} の処理に失敗しました';
        'RateLimitNotice' = '  警告: IP {0} のレート制限を超過しました。直接スクレイピングを試行中...';
        'ErrComponent' = '  エラー: {0} のダウンロードに失敗 ({1})';
        'ErrFirmware' = '  エラー: ファームウェアエラー ({0})';
        'ErrKeys' = '  エラー: キーエラー ({0})';
        'TotalTime' = '  合計時間: {0}分 {1}秒';
        'SuccessCount' = '  更新成功: ';
        'FailedCount' = '  更新失敗: ';
        'AllDone' = '----- 完了しました! -----';
        'PressEnter' = 'ENTERキーを押して終了';
        'CatEmus' = '|   エミュレータ ＆ パッチ   |';
        'CatFrontends' = '| フロントエンド ＆ マネージャー |';
        'SevenZipInstall' = '[7-Zip] {0} をインストール中 ';
        'SevenZipUpdate' = '[7-Zip] {0} へ更新中 ';
        'SevenZipAlert' = '  警告: 7-Zipが見つからず、インストールできませんでした!';
        'SevenZipFree' = '  公式から無料でインストールしてください: https://www.7-zip.org/';
        'DlFinished' = 'ダウンロード完了!';
        'DlError' = 'ダウンロードエラー!';
        'FatalError' = '重大なエラー: スクリプトのコアで致命的なエラーが発生しました';
        'HiddenSize' = ' (サイズ非公開)';
        'Complement' = '追加コンポーネント';
        'RateLimitBlock' = 'GitHub制限';
        'NotFound' = '見つかりません';
        'NetworkFail' = 'ネットワーク障害'
    };
    'zh' = @{
        'LangLabel' = '简体中文';
        'Title' = '模拟器更新器 18.10';
        'By' = '作者: Emerson';
        'Author' = 'Teles';
        'SessionStarted' = '会话已启动:';
        'Time' = '时间:';
        'WarnClose' = '注意：模拟器将在 {0} 秒后自动关闭... ';
        'DownloadProgress' = '下载进行中...';
        'Downloading' = '  正在下载: {0} ';
        'Downloaded' = '  已下载: {0} ({1} MB)';
        'Organizing' = '  正在整理文件...';
        'OrganizingFw' = '  正在整理固件...';
        'OrganizingKeys' = '  正在整理密钥...';
        'OkUpdatedSingular' = '  OK: {0} 已更新!';
        'OkUpdatedPlural' = '  OK: {0} 已更新!';
        'OkFw' = '  OK: 固件已更新!';
        'OkKeys' = '  OK: 密钥已更新!';
        'OkVip' = '  OK: VIP注册表已注入!';
        'ErrFolderNotFound' = '  错误: 未找到文件夹!';
        'ErrProcess' = '  错误: 处理 {0} 失败';
        'RateLimitNotice' = '  提示: IP {0} 的速率限制已超。正在尝试直接抓取...';
        'ErrComponent' = '  错误: 下载 {0} 失败 ({1})';
        'ErrFirmware' = '  错误: 固件失败 ({0})';
        'ErrKeys' = '  错误: 密钥失败 ({0})';
        'TotalTime' = '  总耗时: {0}分 {1}秒';
        'SuccessCount' = '  已更新: ';
        'FailedCount' = '  未更新: ';
        'AllDone' = '----- 全部完成! -----';
        'PressEnter' = '按 ENTER 键退出';
        'CatEmus' = '|       模拟器与补丁       |';
        'CatFrontends' = '|      前端与管理工具      |';
        'SevenZipInstall' = '[7-Zip] 正在安装 {0} ';
        'SevenZipUpdate' = '[7-Zip] 正在更新至 {0} ';
        'SevenZipAlert' = '  警告: 未找到 7-Zip 且无法安装!';
        'SevenZipFree' = '  请前往官网免费下载安装: https://www.7-zip.org/';
        'DlFinished' = '下载完成!';
        'DlError' = '下载出错!';
        'FatalError' = '严重警告: 脚本核心发生致命错误';
        'HiddenSize' = ' (大小未知)';
        'Complement' = '附加组件';
        'RateLimitBlock' = 'GitHub速率拦截';
        'NotFound' = '未找到';
        'NetworkFail' = '网络失败'
    };
    'ru' = @{
        'LangLabel' = 'Русский';
        'Title' = 'ОБНОВИТЕЛЬ ЭМУЛЯТОРОВ 18.10';
        'By' = 'Автор: Emerson';
        'Author' = 'Teles';
        'SessionStarted' = 'Сессия начата:';
        'Time' = 'Время:';
        'WarnClose' = 'ВНИМАНИЕ: ЭМУЛЯТОРЫ БУДУТ ЗАКРЫТЫ АВТОМАТИЧЕСКИ: {0}... ';
        'DownloadProgress' = 'Загрузка выполняется...';
        'Downloading' = '  Скачивание: {0} ';
        'Downloaded' = '  Скачано: {0} ({1} МБ)';
        'Organizing' = '  Организация файлов...';
        'OrganizingFw' = '  Организация прошивки...';
        'OrganizingKeys' = '  Организация ключей...';
        'OkUpdatedSingular' = '  OK: {0} обновлен!';
        'OkUpdatedPlural' = '  OK: {0} обновлены!';
        'OkFw' = '  OK: Прошивка обновлена!';
        'OkKeys' = '  OK: Ключи обновлены!';
        'OkVip' = '  OK: VIP реестр применен!';
        'ErrFolderNotFound' = '  ОШИБКА: Папка не найдена!';
        'ErrProcess' = '  ОШИБКА: Сбой обработки {0}';
        'RateLimitNotice' = '  ВНИМАНИЕ: Превышен лимит запросов для IP {0}. Прямой поиск...';
        'ErrComponent' = '  ОШИБКА: Сбой загрузки {0} ({1})';
        'ErrFirmware' = '  ОШИБКА: Сбой прошивки ({0})';
        'ErrKeys' = '  ОШИБКА: Сбой ключей ({0})';
        'TotalTime' = '  ОБЩЕЕ ВРЕМЯ: {0}м {1}с';
        'SuccessCount' = '  ОБНОВЛЕНО: ';
        'FailedCount' = '  НЕ ОБНОВЛЕНО: ';
        'AllDone' = '----- ВСЁ ГОТОВО! -----';
        'PressEnter' = 'Нажмите ENTER для выхода';
        'CatEmus' = '|   ЭМУЛЯТОРЫ И ПАТЧИ      |';
        'CatFrontends' = '|  ФРОНТЕНДЫ И МЕНЕДЖЕРЫ   |';
        'SevenZipInstall' = '[7-Zip] УСТАНОВКА {0} ';
        'SevenZipUpdate' = '[7-Zip] ОБНОВЛЕНИЕ до {0} ';
        'SevenZipAlert' = '  ВНИМАНИЕ: 7-Zip не найден и не удалось установить!';
        'SevenZipFree' = '  Скачайте и установите бесплатно с: https://www.7-zip.org/';
        'DlFinished' = 'Загрузка завершена!';
        'DlError' = 'ОШИБКА ЗАГРУЗКИ!';
        'FatalError' = 'КРИТИЧЕСКАЯ ОШИБКА: Фатальный сбой в ядре скрипта';
        'HiddenSize' = ' (Размер скрыт)';
        'Complement' = 'Дополнение';
        'RateLimitBlock' = 'Блокировка GitHub';
        'NotFound' = 'Не найдено';
        'NetworkFail' = 'Сбой сети'
    };
    'ko' = @{
        'LangLabel' = '한국어';
        'Title' = '에뮬레이터 업데이터 18.10';
        'By' = '제작: Emerson';
        'Author' = 'Teles';
        'SessionStarted' = '세션 시작됨:';
        'Time' = '시간:';
        'WarnClose' = '주의: 에뮬레이터가 자동으로 종료됩니다: {0}... ';
        'DownloadProgress' = '다운로드 진행 중...';
        'Downloading' = '  다운로드 중: {0} ';
        'Downloaded' = '  다운로드 완료: {0} ({1} MB)';
        'Organizing' = '  파일 정리 중...';
        'OrganizingFw' = '  펌웨어 정리 중...';
        'OrganizingKeys' = '  키 정리 중...';
        'OkUpdatedSingular' = '  OK: {0} 업데이트 완료!';
        'OkUpdatedPlural' = '  OK: {0} 업데이트 완료!';
        'OkFw' = '  OK: 펌웨어 업데이트 완료!';
        'OkKeys' = '  OK: 키 업데이트 완료!';
        'OkVip' = '  OK: VIP 레지스트리 적용됨!';
        'ErrFolderNotFound' = '  오류: 폴더를 찾을 수 없습니다!';
        'ErrProcess' = '  오류: {0} 처리 실패';
        'RateLimitNotice' = '  알림: IP {0} 의 속도 제한 초과됨. 직접 웹 스크래핑 시도 중...';
        'ErrComponent' = '  오류: {0} 다운로드 실패 ({1})';
        'ErrFirmware' = '  오류: 펌웨어 오류 ({0})';
        'ErrKeys' = '  오류: 키 오류 ({0})';
        'TotalTime' = '  총 소요 시간: {0}분 {1}초';
        'SuccessCount' = '  업데이트됨: ';
        'FailedCount' = '  업데이트 실패: ';
        'AllDone' = '----- 모든 작업 완료! -----';
        'PressEnter' = '종료하려면 ENTER 키를 누르세요';
        'CatEmus' = '|   에뮬레이터 및 패치     |';
        'CatFrontends' = '|    프론트엔드 및 관리자  |';
        'SevenZipInstall' = '[7-Zip] {0} 설치 중 ';
        'SevenZipUpdate' = '[7-Zip] {0} 로 업데이트 중 ';
        'SevenZipAlert' = '  경고: 7-Zip을 찾을 수 없으며 설치하지 못했습니다!';
        'SevenZipFree' = '  공식 사이트에서 무료로 설치하세요: https://www.7-zip.org/';
        'DlFinished' = '다운로드 완료!';
        'DlError' = '다운로드 오류!';
        'FatalError' = '치명적 경고: 스크립트 코어에서 치명적인 오류가 발생했습니다';
        'HiddenSize' = ' (크기 숨김)';
        'Complement' = '추가 구성 요소';
        'RateLimitBlock' = 'GitHub 속도 제한';
        'NotFound' = '찾을 수 없음';
        'NetworkFail' = '네트워크 실패'
    }
}

function T($key, $arg0 = $null, $arg1 = $null) {
    $dict = $Global:I18N[$Global:CurrentLang]
    if (-not $dict) { $dict = $Global:I18N['en'] }
    $val = $dict[$key]
    if (-not $val) { $val = $Global:I18N['en'][$key] }
    if (-not $val) { return $key }
    if ($null -ne $arg0 -and $null -ne $arg1) { return ($val -f $arg0, $arg1) }
    if ($null -ne $arg0) { return ($val -f $arg0) }
    return $val
}

# --- IDENTIDADE NINJA (Disfarce de Chrome para driblar o Cloudflare) ---
$UA_Chrome = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36"

# --- INJEÇÃO DO MOTOR DE REDE MODERNO GLOBAL --- 
Add-Type -AssemblyName System.Net.Http 
$Handler = New-Object System.Net.Http.HttpClientHandler
$Handler.AutomaticDecompression = [System.Net.DecompressionMethods]::GZip -bor [System.Net.DecompressionMethods]::Deflate
$Global:HttpClient = New-Object System.Net.Http.HttpClient($Handler)
$Global:HttpClient.DefaultRequestHeaders.Add("User-Agent", $UA_Chrome) 
$Global:HttpClient.Timeout = [TimeSpan]::FromMinutes(3) # Timeout de segurança 

# --- RADAR E GESTOR INTELIGENTE DO 7-ZIP ---
$7zPaths = @("$env:ProgramFiles\7-Zip\7z.exe", "${env:ProgramFiles(x86)}\7-Zip\7z.exe", "$env:SystemDrive\Program Files\7-Zip\7z.exe")
$7z = $7zPaths | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $7z -and (Get-Command "7z.exe" -ErrorAction SilentlyContinue)) { $7z = "7z.exe" }

try {
    $html7z = (Invoke-WebRequest -Uri "https://www.7-zip.org/download.html" -UseBasicParsing -UserAgent $UA_Chrome -ErrorAction Stop).Content
    $link7z = ([regex]'href="(https://github\.com/ip7z/7zip/releases/download/[^"]*x64\.exe)"').Matches($html7z) |
              ForEach-Object { $_.Groups[1].Value } | Select-Object -First 1

    if ($link7z) {
        $nomeInstalador7z = $link7z -replace ".*/", ""
        $versaoDisponivel = 0
        if ($link7z -match '/(\d+\.\d+)/') { $versaoDisponivel = [int]($matches[1] -replace "\.", "") }

        $versaoInstalada = 0
        $precisaAtualizar = $false
        $estaInstalado = $null -ne $7z -and (Test-Path $7z)

        if ($estaInstalado) {
            $verStr = (& $7z i 2>&1 | Select-String "7-Zip (\d+\.\d+)").Matches | Select-Object -First 1
            if ($verStr -and $verStr.Groups[1].Value) {
                $versaoInstalada = [int]($verStr.Groups[1].Value -replace "\.", "")
            }
            $precisaAtualizar = $versaoDisponivel -gt $versaoInstalada
        }

        if (-not $estaInstalado -or $precisaAtualizar) {
            $7zY = [Console]::CursorTop
            $msg7z = if (-not $estaInstalado) { T 'SevenZipInstall' $nomeInstalador7z } else { T 'SevenZipUpdate' $nomeInstalador7z }
            Write-Host $msg7z -NoNewline -ForegroundColor Yellow

            Add-Type -AssemblyName System.Net.Http
            $Handler7z = New-Object System.Net.Http.HttpClientHandler
            $Client7z = New-Object System.Net.Http.HttpClient($Handler7z)
            $Client7z.DefaultRequestHeaders.Add("User-Agent", $UA_Chrome)
            $Client7z.Timeout = [TimeSpan]::FromMinutes(3)

            $resp7z = $Client7z.GetAsync($link7z, [System.Net.Http.HttpCompletionOption]::ResponseHeadersRead).Result
            $resp7z.EnsureSuccessStatusCode() | Out-Null
            $total7z = $resp7z.Content.Headers.ContentLength
            $stream7z = $resp7z.Content.ReadAsStreamAsync().Result
            $installer7z = Join-Path $env:TEMP $nomeInstalador7z
            $file7z = [System.IO.File]::Create($installer7z)
            $buf7z = New-Object byte[] 65536
            $read7z = 0; $last7z = Get-Date; $startDL7z = Get-Date

            while (($chunk = $stream7z.Read($buf7z, 0, $buf7z.Length)) -gt 0) {
                $file7z.Write($buf7z, 0, $chunk)
                $read7z += $chunk
                $now7z = Get-Date
                if (($now7z - $last7z).TotalMilliseconds -gt 250) {
                    $readMb7z = [math]::Round($read7z / 1MB, 2)
                    $totalMb7z = [math]::Round($total7z / 1MB, 2)
                    $pct7z = if ($total7z -gt 0) { [math]::Round(($read7z / $total7z) * 100) } else { 0 }
                    try {
                        [Console]::SetCursorPosition(0, $7zY)
                        Write-Host "$msg7z($readMb7z MB / $totalMb7z MB) [$pct7z%]   " -NoNewline -ForegroundColor Yellow
                    } catch {}
                    $last7z = $now7z
                }
            }
            $file7z.Close(); $stream7z.Close(); $Client7z.Dispose()

            Start-Process -FilePath $installer7z -ArgumentList "/S" -Wait -ErrorAction Stop
            Remove-Item -LiteralPath $installer7z -Force -ErrorAction SilentlyContinue

            $7z = "$env:ProgramFiles\7-Zip\7z.exe"
            try {
                [Console]::SetCursorPosition(0, $7zY)
                Write-Host "".PadRight(([Console]::WindowWidth - 1)) -NoNewline
                [Console]::SetCursorPosition(0, $7zY)
            } catch {}
        }
    }
} catch {
    if (-not $7z) {
        Write-Host "============================================================" -ForegroundColor DarkCyan
        Write-Host (T 'SevenZipAlert') -ForegroundColor Red
        Write-Host (T 'SevenZipFree') -ForegroundColor White
        Write-Host "============================================================" -ForegroundColor DarkCyan
        Write-Host "`n  $((T 'PressEnter'))..." -NoNewline -ForegroundColor Gray
        [void][Console]::ReadLine()
        exit
    }
} 

try { 
    $GlobalStartTime = Get-Date  
    $Global:SuccessfulDownloads = 0  
    
    $RandomID = Get-Random -Minimum 1000 -Maximum 99999
    $TempDir = Join-Path $env:TEMP "EmuUpdates_$RandomID"
    
    $Header = @{ "User-Agent" = $UA_Chrome } 
    $BadWords = "arm64|aarch64|linux|macos|ubuntu|android|apk|symbols|pdb|appimage|dbg|installer|libretro|source|vfs-dump|preview|debug|[^6]32bit|win32(?![-_]x64)|x86(?![-_]64)|\bi686\b"
 
    $Global:TotalAttempted = 0 
    $Global:LastEmuSuccess = $false

    If (!(Test-Path -LiteralPath $TempDir)) { [System.IO.Directory]::CreateDirectory($TempDir) | Out-Null } 

    $Global:HeaderY = [Console]::CursorTop
    Write-Host "==========================================================================" -ForegroundColor DarkCyan
    Write-Host "0.0 MB/s       " -NoNewline -ForegroundColor DarkGreen
    $TitleText = "      $((T 'Title'))"
    Write-Host $TitleText.PadRight(45) -NoNewline -ForegroundColor Cyan
    Write-Host "  $((T 'By'))" -ForegroundColor White
    Write-Host "$((T 'Time')) 00:00".PadRight(15) -NoNewline -ForegroundColor DarkGreen
    $SessionText = "      $((T 'SessionStarted')) $(Get-Date -Format "dd/MM/yyyy - HH:mm:ss")"
    Write-Host $SessionText.PadRight(45) -NoNewline -ForegroundColor Gray
    Write-Host "       $((T 'Author'))" -ForegroundColor White
    Write-Host "==========================================================================" -ForegroundColor DarkCyan
    Write-Host " [Language / Idioma: $($Global:I18N[$Global:CurrentLang]['LangLabel'])]`n" -ForegroundColor DarkYellow
     
    $WarnY = [Console]::CursorTop 
    for ($i = 3; $i -ge 1; $i--) { 
        [Console]::SetCursorPosition(0, $WarnY) 
        Write-Host (T 'WarnClose' $i) -ForegroundColor Red 
        Start-Sleep -Seconds 1 
    } 

    Get-Process -Name "arcade*", "ares*", "attract*", "azahar*", "bizhawk*", "bsnes*", "cemu*", "citron*", "clrmame*", "cmp*", "cxbx*", "deecy*", "desmume*", "dolphin*", "duckstation*", "eden*", "emuhawk*", "emulationstation*", "ES-DE*", "fbneo*", "fceux*", "flycast*", "gearboy*", "gearsystem*", "jgenesis*", "mame*", "meka*", "mesen*", "mgba*", "pcsx-redux*", "pcsx2*", "playnite*", "ppsspp*", "project64*", "retroarch*", "rmg*", "rpcs3*", "ryujinx*", "shadps4*", "snes9x*", "super-snes9x*", "superzsnes*", "vba*", "visualboy*", "vita3k*", "xemu*", "xenia*", "xeniamanager*", "ymir*" -ErrorAction SilentlyContinue | Stop-Process -Force 
    
    [Console]::SetCursorPosition(0, $WarnY) 
    Write-Host "".PadRight(([Console]::WindowWidth - 1)) -NoNewline 
    [Console]::SetCursorPosition(0, $WarnY) 
    $Global:DownloadStatusY = [Console]::CursorTop 
    Write-Host "$((T 'DownloadProgress'))`n" -ForegroundColor Gray 

    Function Update-HUD { 
        param($Speed, $TimeStr, $Clear = $false) 
        if ($Global:HeaderY -lt 0) { return } 
        $oldX = [Console]::CursorLeft; $oldY = [Console]::CursorTop 
        try {
            [Console]::SetCursorPosition(0, $Global:HeaderY + 1) 
            if ($Clear) { Write-Host "               " -NoNewline } 
            else { Write-Host "$Speed MB/s".PadRight(15) -NoNewline -ForegroundColor Green } 
            [Console]::SetCursorPosition(0, $Global:HeaderY + 2) 
            if ($Clear) { Write-Host "               " -NoNewline } 
            else { Write-Host "$((T 'Time')) $TimeStr".PadRight(15) -NoNewline -ForegroundColor Green } 
            [Console]::SetCursorPosition($oldX, $oldY) 
        } catch {}
    } 

    Function Custom-Download { 
        param($Url, $Path, $UA) 
        $startX = [Console]::CursorLeft; $startY = [Console]::CursorTop; $StartTime = Get-Date 
        try { 
            $Global:HttpClient.DefaultRequestHeaders.Remove("User-Agent") | Out-Null 
            $Global:HttpClient.DefaultRequestHeaders.Add("User-Agent", $UA) 

            $response = $Global:HttpClient.GetAsync($Url, [System.Net.Http.HttpCompletionOption]::ResponseHeadersRead).Result 
            $response.EnsureSuccessStatusCode() | Out-Null 

            $Total = $response.Content.Headers.ContentLength 

            if ((-not $Total -or $Total -lt 100000) -and $UA -match "Ryujinx") {  
                throw "Bloqueio do servidor (Arquivo muito pequeno/falso)"  
            } 

            $Stream = $response.Content.ReadAsStreamAsync().Result 
            $File = [System.IO.File]::Create($Path) 

            $Buffer = New-Object byte[] 262144 
            $TotalRead = 0; $LastUpdate = Get-Date; $SpeedAvg = 0 

            while (($Read = $Stream.Read($Buffer, 0, $Buffer.Length)) -gt 0) { 
                $File.Write($Buffer, 0, $Read) 
                $TotalRead += $Read 
                $Now = Get-Date 
                $Elapsed = ($Now - $StartTime).TotalSeconds 

                if (($Now - $LastUpdate).TotalMilliseconds -gt 250) { 
                    if ($Elapsed -gt 0.2) { 
                        $Instant = ($TotalRead / 1MB) / $Elapsed 
                        $SpeedAvg = ($SpeedAvg * 0.7) + ($Instant * 0.3) 
                        $DisplaySpeed = [math]::Round($SpeedAvg, 2) 
                         
                        $readMb = [math]::Round($TotalRead / 1MB, 2) 
                        $totalMb = [math]::Round($Total / 1MB, 2) 
                         
                        try {
                            [Console]::SetCursorPosition($startX, $startY) 
                            if ($Total -gt 0) {
                                if ($Total -gt 5MB) {
                                    Write-Host " ($readMb MB / $totalMb MB) [$([math]::Round(($TotalRead / $Total) * 100))%]   " -NoNewline -ForegroundColor Cyan  
                                } else {
                                    Write-Host " ($readMb MB / $totalMb MB)   " -NoNewline -ForegroundColor Cyan  
                                }
                            } else { 
                                Write-Host " ($readMb MB) [Baixando...]   " -NoNewline -ForegroundColor Cyan 
                            } 
                        } catch {}
                        Update-HUD -Speed $DisplaySpeed -TimeStr ("{0:mm\:ss}" -f ($Now - $GlobalStartTime)) 
                        $LastUpdate = $Now 
                    } 
                } 
            } 

            $File.Close(); $Stream.Close() 

            $FileInfo = Get-Item -LiteralPath $Path -ErrorAction SilentlyContinue 
            if ($FileInfo -and $FileInfo.Length -gt 1024) {  
                if ($UA -match "Ryujinx") { 
                    if ($FileInfo.Length -lt 10MB) { throw "HTML falso" } 
                    $Bytes = Get-Content -LiteralPath $Path -Encoding Byte -TotalCount 4 
                    $Signature = [System.BitConverter]::ToString($Bytes) 

                    if ($Signature -ne "50-4B-03-04" -and $Signature -ne "37-7A-BC-AF") { throw "Assinatura ZIP/7z corrompida" } 
                } elseif ($Path -match "\.(zip|7z|exe)$") {  
                    & $7z t "$Path" 2>&1 | Out-Null 
                    if ($LASTEXITCODE -ne 0) { throw "Corrompido" }  
                } 
            } else { throw "Arquivo pequeno demais (Menos de 1KB)" } 

        } catch {  
            if ($null -ne $File) { try { $File.Close() } catch {} } 
            if ($null -ne $Stream) { try { $Stream.Close() } catch {} } 
            throw $_  
        } 
    } 

    # --- RASPAGEM DE ASSETS DO GITHUB (FALLBACK ANTI-RATE-LIMIT) ---
    Function Get-GitHubReleaseAssetsWeb {
        param($Repo, [switch]$LatestOnly)
        $url = if ($LatestOnly) { "https://github.com/$Repo/releases/latest" } else { "https://github.com/$Repo/releases" }
        try {
            $resp = Invoke-WebRequest -Uri $url -UserAgent $UA_Chrome -UseBasicParsing -MaximumRedirection 5
            $finalUrl = $resp.BaseResponse.ResponseUri.AbsoluteUri
            $tags = @()
            if ($finalUrl -match "/releases/tag/([^/]+)") {
                $tags += $matches[1]
            } else {
                $tm = [regex]::Matches($resp.Content, 'href="/[^/]+/[^/]+/releases/tag/([^"]+)"')
                foreach ($m in $tm) {
                    $t = $m.Groups[1].Value
                    if ($t -notin $tags) { $tags += $t }
                    if ($LatestOnly -and $tags.Count -ge 1) { break }
                    if ($tags.Count -ge 5) { break }
                }
            }

            $foundAssets = @()
            foreach ($t in $tags) {
                $assetsUrl = "https://github.com/$Repo/releases/expanded_assets/$t"
                $assetsResp = Invoke-WebRequest -Uri $assetsUrl -UserAgent $UA_Chrome -UseBasicParsing
                $am = [regex]::Matches($assetsResp.Content, 'href="([^"]*releases/download/[^"]+)"')
                foreach ($m in $am) {
                    $dl = $m.Groups[1].Value
                    if ($dl -match "^/") { $dl = "https://github.com$dl" }
                    $foundAssets += $dl
                }
                if ($foundAssets.Count -gt 0 -and $LatestOnly) { break }
            }
            return $foundAssets
        } catch {
            return @()
        }
    }

    Function Extract-And-Flatten { 
        param ($ZipFile, $TargetFolder, $Name) 
        if ($ZipFile -notmatch "\.(zip|7z|rar|exe)$") { Copy-Item -LiteralPath $ZipFile -Destination $TargetFolder -Force; return } 
        $FT = $TargetFolder 
         
        if ($Name -eq "ClrMamePro") {
        if ($ZipFile -match "cmp.*32") { $FT = Join-Path $TargetFolder "ClrMamePro-32" }
        elseif ($ZipFile -match "cmp.*64") { $FT = Join-Path $TargetFolder "ClrMamePro-64" }
    }
        elseif ($ZipFile -match "graphicPacks") {  
            $FT = Join-Path $TargetFolder "graphicPacks"  
        } 
        elseif ($ZipFile -match "patches\.(zip|7z)|game-patches") {  
            if ($Name -match "Edge") { $FT = Join-Path $TargetFolder "game_patches" } 
            else { $FT = Join-Path $TargetFolder "patches" } 
        } 
        elseif ($ZipFile -match "cheats\.(zip|7z)") {  
            $FT = Join-Path $TargetFolder "cheats"  
        } 
         
        if (!(Test-Path -LiteralPath $FT)) { [System.IO.Directory]::CreateDirectory($FT) | Out-Null } 
         
        $ExtractTemp = Join-Path $TempDir ("T_" + (New-Guid).Guid.Substring(0,8)) 
        [System.IO.Directory]::CreateDirectory($ExtractTemp) | Out-Null 
         
        if ($Name -match "ARCADE" -and $ZipFile -match "32bit") { 
            & $7z e "$ZipFile" "-o$ExtractTemp" "*.exe" -y -aoa -bso0 -bsp0 2>&1 | Out-Null
            $exe32 = Join-Path $ExtractTemp "arcade.exe" 
            if (Test-Path -LiteralPath $exe32) { Rename-Item -LiteralPath $exe32 -NewName "arcade_x86.exe" -Force } 
        } else { 
            & $7z x "$ZipFile" "-o$ExtractTemp" -y -aoa -bso0 -bsp0 2>&1 | Out-Null
        } 
         
        if ($Name -match "Azahar") { 
            $Check = Get-ChildItem -LiteralPath $ExtractTemp -ErrorAction SilentlyContinue | Where-Object { $_.Extension -match '.zip|.7z' } 
            if ($Check) {  
                $InnerZip = $Check[0].FullName 
                & $7z x "$InnerZip" "-o$ExtractTemp" -y -aoa -bso0 -bsp0 2>&1 | Out-Null
                Remove-Item -LiteralPath $InnerZip -Force -ErrorAction SilentlyContinue  
            } 
        } 
         
        if ($Name -match "MAMEUI64 Plus") { 
            $PlusFolder = Get-ChildItem -LiteralPath $ExtractTemp -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -match "mameui" } | Select-Object -First 1 
            if ($PlusFolder) { 
                Get-ChildItem -LiteralPath $PlusFolder.FullName -ErrorAction SilentlyContinue | ForEach-Object { Move-Item -LiteralPath $_.FullName -Destination $ExtractTemp -Force -ErrorAction SilentlyContinue } 
                Remove-Item -LiteralPath $PlusFolder.FullName -Recurse -Force -ErrorAction SilentlyContinue 
            } 
        } 
         
        if (-not (Test-Path -LiteralPath $ExtractTemp)) { throw "Pasta de extração bloqueada/removida pelo sistema." } 
         
        $Source = if ((Get-ChildItem -LiteralPath $ExtractTemp -ErrorAction SilentlyContinue).Count -eq 1 -and (Get-ChildItem -LiteralPath $ExtractTemp -ErrorAction SilentlyContinue)[0].PSIsContainer) { (Get-ChildItem -LiteralPath $ExtractTemp -ErrorAction SilentlyContinue)[0].FullName } else { $ExtractTemp } 
         
        Get-ChildItem -LiteralPath $Source -Force -ErrorAction SilentlyContinue | ForEach-Object { Copy-Item -LiteralPath $_.FullName -Destination $FT -Recurse -Force -ErrorAction SilentlyContinue } 
        Remove-Item -LiteralPath $ExtractTemp -Recurse -Force -ErrorAction SilentlyContinue 
    } 

    Function Update-SwitchAssets {
        param ($EmuName, $FwTarget, $KeyTarget)
        
        if (-not $Global:LastEmuSuccess) { return }
        
        if (-not $Global:FwZipPath) { $Global:FwZipPath = "" }
        if (-not $Global:KeyZipPath) { $Global:KeyZipPath = "" }
        if (-not $Global:FwSizeStr) { $Global:FwSizeStr = "" }
        if (-not $Global:KeySizeStr) { $Global:KeySizeStr = "" }

        # --- BLOCO 1: FIRMWARE ---
        try {
            if ($Global:FwZipPath -eq "" -or -not (Test-Path -LiteralPath $Global:FwZipPath)) {
                $FwApi = "https://api.github.com/repos/THZoria/NX_Firmware/releases/latest"
                $FwAsset = $null
                try {
                    $FwRel = Invoke-RestMethod -Uri $FwApi -Headers $Header -ErrorAction Stop
                    $FwAsset = $FwRel.assets | Where-Object { $_.name -match "(?i)Firmware.*\.zip" } | Select-Object -First 1
                } catch {
                    $fwWeb = Get-GitHubReleaseAssetsWeb "THZoria/NX_Firmware" -LatestOnly
                    $fwUrlWeb = $fwWeb | Where-Object { $_ -match "(?i)Firmware.*\.zip" } | Select-Object -First 1
                    if ($fwUrlWeb) {
                        $FwAsset = [PSCustomObject]@{
                            name = ($fwUrlWeb -replace ".*/", "")
                            browser_download_url = $fwUrlWeb
                        }
                    }
                }
                if (-not $FwAsset) { throw "Firmware ZIP não encontrado no Github" }

                $FwUrl = $FwAsset.browser_download_url
                $Global:FwName = $FwAsset.name
                $Global:FwZipPath = Join-Path $TempDir $Global:FwName
                
                $LBaixY = [Console]::CursorTop
                Write-Host (T 'Downloading' $Global:FwName) -NoNewline -ForegroundColor White
                
                Custom-Download -Url $FwUrl -Path $Global:FwZipPath -UA $UA_Chrome
                
                $FwSizeMB = if (Test-Path -LiteralPath $Global:FwZipPath) { [Math]::Round((Get-Item -LiteralPath $Global:FwZipPath).Length / 1MB, 2) } else { 0 }
                $Global:FwSizeStr = "($FwSizeMB MB)"
                try {
                    [Console]::SetCursorPosition(0, $LBaixY)
                    Write-Host "$((T 'Downloaded' $Global:FwName $FwSizeMB))".PadRight(([Console]::WindowWidth - 1)) -ForegroundColor White
                } catch {}
            } else {
                Write-Host "  Baixado: $($Global:FwName) $($Global:FwSizeStr)" -ForegroundColor White
            }

            if (Test-Path -LiteralPath $FwTarget) { Remove-Item -LiteralPath $FwTarget -Recurse -Force -ErrorAction SilentlyContinue }
            [System.IO.Directory]::CreateDirectory($FwTarget) | Out-Null

            $Global:LOrgY = [Console]::CursorTop
            Write-Host "$((T 'OrganizingFw')) " -NoNewline -ForegroundColor Magenta

            & $7z x "$($Global:FwZipPath)" "-o$FwTarget" -y -aoa -bso0 -bsp0 2>&1 | Out-Null

            try {
                [Console]::SetCursorPosition(0, $Global:LOrgY)
                Write-Host "".PadRight(([Console]::WindowWidth - 1)) -NoNewline
                [Console]::SetCursorPosition(0, $Global:LOrgY)
            } catch {}

            Write-Host (T 'OkFw') -ForegroundColor Green

        } catch {
            $errY = [Console]::CursorTop
            try { [Console]::SetCursorPosition(0, $errY); Write-Host "".PadRight(([Console]::WindowWidth - 1)) -NoNewline; [Console]::SetCursorPosition(0, $errY) } catch {}
            
            $rawErr = "$_"
            $cleanErr = if ($rawErr -match "404") { "404" } elseif ($rawErr -match "rate limit") { T 'RateLimitBlock' } else { T 'NetworkFail' }
            Write-Host (T 'ErrFirmware' $cleanErr) -ForegroundColor Red
        }

        # --- BLOCO 2: KEYS ---
        try {
            if ($Global:KeyZipPath -eq "" -or -not (Test-Path -LiteralPath $Global:KeyZipPath)) {
                $KeysPageHtml = (Invoke-WebRequest -Uri "https://prodkeys.net/ryujinx-prod-keys-update/" -UseBasicParsing -UserAgent $UA_Chrome -ErrorAction Stop).Content
                $KeysLinks = ([regex]'href="(https://[^"]*prodkeys[^"]*\.zip)"').Matches($KeysPageHtml) | ForEach-Object { $_.Groups[1].Value }
                
                if (-not $KeysLinks) { throw "Nenhum link de Keys encontrado" }
                
                $KeysUrl = $KeysLinks[0]
                $Global:KeyName = $KeysUrl -replace ".*/", ""
                $Global:KeyZipPath = Join-Path $TempDir $Global:KeyName

                $LBaixYKeys = [Console]::CursorTop
                Write-Host (T 'Downloading' $Global:KeyName) -NoNewline -ForegroundColor White
                
                Custom-Download -Url $KeysUrl -Path $Global:KeyZipPath -UA $UA_Chrome
                
                $KeysSizeKB = if (Test-Path -LiteralPath $Global:KeyZipPath) { [Math]::Round((Get-Item -LiteralPath $Global:KeyZipPath).Length / 1KB, 2) } else { 0 }
                $Global:KeySizeStr = "($KeysSizeKB KB)"
                try {
                    [Console]::SetCursorPosition(0, $LBaixYKeys)
                    Write-Host "  Baixado: $($Global:KeyName) $($Global:KeySizeStr)".PadRight(([Console]::WindowWidth - 1)) -ForegroundColor White
                } catch {}
            } else {
                Write-Host "  Baixado: $($Global:KeyName) $($Global:KeySizeStr)" -ForegroundColor White
            }

            if (Test-Path -LiteralPath $KeyTarget) { Remove-Item -LiteralPath $KeyTarget -Recurse -Force -ErrorAction SilentlyContinue }
            [System.IO.Directory]::CreateDirectory($KeyTarget) | Out-Null

            $Global:LOrgY = [Console]::CursorTop
            Write-Host "$((T 'OrganizingKeys')) " -NoNewline -ForegroundColor Magenta

            & $7z e "$($Global:KeyZipPath)" "-o$KeyTarget" "*.keys" -r -y -aoa -bso0 -bsp0 2>&1 | Out-Null

            try {
                [Console]::SetCursorPosition(0, $Global:LOrgY)
                Write-Host "".PadRight(([Console]::WindowWidth - 1)) -NoNewline
                [Console]::SetCursorPosition(0, $Global:LOrgY)
            } catch {}

            Write-Host (T 'OkKeys') -ForegroundColor Green

        } catch {
            $errY = [Console]::CursorTop
            try { [Console]::SetCursorPosition(0, $errY); Write-Host "".PadRight(([Console]::WindowWidth - 1)) -NoNewline; [Console]::SetCursorPosition(0, $errY) } catch {}
            
            $rawErr = "$_"
            $cleanErr = if ($rawErr -match "Nenhum link") { T 'NotFound' } elseif ($rawErr -match "404") { "404" } else { T 'NetworkFail' }
            Write-Host (T 'ErrKeys' $cleanErr) -ForegroundColor Red
        }
    }

    Function Update-Emu { 
        param ($Name, $Type, $Repo, $ExtractPath, $FileKeyword, $DirectLink = $null, [switch]$IsSwitch) 
        $Global:TotalAttempted++ 
        $Global:LastEmuSuccess = $false
        $DisplayName = if ($Name -eq "Snes9xCombo") { "Snes9x" } else { $Name } 
        Write-Host "[$DisplayName]" -ForegroundColor Yellow 
         
        if ($Name -eq "ClrMamePro") {
            if (!(Test-Path -LiteralPath $ExtractPath)) { 
                Write-Host (T 'ErrFolderNotFound') -ForegroundColor Red 
                return 
            }
            $ComboPaths = @(
                (Join-Path $ExtractPath "ClrMamePro-32"),
                (Join-Path $ExtractPath "ClrMamePro-64")
            )
            foreach ($cp in $ComboPaths) {
                if (Test-Path -LiteralPath $cp) {
                    Get-ChildItem -LiteralPath $cp -Force -ErrorAction SilentlyContinue | Where-Object { $_.Extension -in ".exe", ".dll" } | Remove-Item -Force -ErrorAction SilentlyContinue
                }
            }
        } else {
            if (!(Test-Path -LiteralPath $ExtractPath)) { Write-Host (T 'ErrFolderNotFound') -ForegroundColor Red; return } 
            Get-ChildItem -LiteralPath $ExtractPath -Force -ErrorAction SilentlyContinue | Where-Object { 
                $TargetExt = $_.Extension -in ".exe", ".dll" 
                $BlockPJ64 = ($Name -match "Project64" -and $_.Name -match "BMGlib|SDL|zlib1") 
                $BlockDolphin = ($Name -match "Dolphin" -and $_.Name -match "DolphinQt2|DolphinWx") 
                 
                $TargetExt -and -not $BlockPJ64 -and -not $BlockDolphin 
            } | Remove-Item -Force -ErrorAction SilentlyContinue 
        }

        $ErrorPrinted = $false
        try { 
            $Urls = @(); $UA = $UA_Chrome 
            if ($Type -eq "Direct") { 
                $Urls += $DirectLink 
                if ($Name -eq "DuckStation") {
                    $Urls += "https://github.com/duckstation/chtdb/releases/download/latest/cheats.zip"
                    $Urls += "https://github.com/duckstation/chtdb/releases/download/latest/patches.zip"
                }
            } 
            elseif ($Type -eq "GitHub") { 
                $ApiSuffix = if ($Name -match "^(Flycast Dojo|Rpcs3|Playnite|MEKA)$") { "releases/latest" } else { "releases" } 
                $FoundAssets = $null

                try {
                    $Releases = Invoke-RestMethod -Uri "https://api.github.com/repos/$Repo/$ApiSuffix" -Headers $Header -ErrorAction Stop 
                    if ($Name -match "^(Flycast Dojo|Rpcs3|Playnite|MEKA)$") { 
                        $Asset = $Releases.assets | Where-Object { $_.name -match $FileKeyword -and $_.name -notmatch "symbols|pdb|debug|arm64|macos|linux|appimage" } | Select-Object -First 1 
                        if ($Asset) { $Urls += $Asset.browser_download_url } 
                    } else { 
                        foreach ($Rel in $Releases) { 
                            $Asset = $Rel.assets | Where-Object { $_.name -match $FileKeyword -and $_.name -notmatch $BadWords } | Select-Object -First 1 
                            if ($Asset) {  
                                $Urls += $Asset.browser_download_url 
                                break 
                            } 
                        } 
                    } 
                } catch {
                    # FALLBACK ANTI-RATE-LIMIT VIA WEB SCRAPER
                    $webAssets = Get-GitHubReleaseAssetsWeb $Repo ($ApiSuffix -eq "releases/latest")
                    $AssetWeb = $webAssets | Where-Object { $_ -match $FileKeyword -and $_ -notmatch $BadWords } | Select-Object -First 1
                    if ($AssetWeb) { $Urls += $AssetWeb }
                }
                 
                if ($Name -eq "Cemu") {  
                    try {
                        $CAssets = (Invoke-RestMethod -Uri "https://api.github.com/repos/cemu-project/cemu_graphic_packs/releases/latest" -Headers $Header).assets  
                        $Urls += ($CAssets | Where-Object { $_.name -match "graphicPacks" } | Select-Object -First 1).browser_download_url  
                    } catch {
                        $cpWeb = Get-GitHubReleaseAssetsWeb "cemu-project/cemu_graphic_packs" -LatestOnly
                        $cpMatch = $cpWeb | Where-Object { $_ -match "graphicPacks" } | Select-Object -First 1
                        if ($cpMatch) { $Urls += $cpMatch }
                    }
                } 

                if ($Name -eq "PCSX2") { $Urls += "https://github.com/PCSX2/pcsx2_patches/releases/latest/download/patches.zip" } 
                if ($DirectLink) { $Urls += $DirectLink } 
            } 
            elseif ($Type -eq "GitHub_Tag") { 
                try {
                    $Rel = Invoke-RestMethod -Uri "https://api.github.com/repos/$Repo/releases/tags/$DirectLink" -Headers $Header -ErrorAction Stop 
                    $Asset = $Rel.assets | Where-Object { $_.name -match $FileKeyword } | Select-Object -First 1 
                    if ($Asset) { $Urls += $Asset.browser_download_url } 
                } catch {
                    $tagAssetsUrl = "https://github.com/$Repo/releases/expanded_assets/$DirectLink"
                    $tagHtml = (Invoke-WebRequest -Uri $tagAssetsUrl -UserAgent $UA_Chrome -UseBasicParsing).Content
                    $tm = [regex]::Matches($tagHtml, 'href="([^"]*releases/download/[^"]+)"')
                    foreach ($m in $tm) {
                        $dl = $m.Groups[1].Value; if ($dl -match "^/") { $dl = "https://github.com$dl" }
                        if ($dl -match $FileKeyword) { $Urls += $dl; break }
                    }
                }
            }
                        elseif ($Type -eq "MEKA_Dual") {
                # MOTOR HÍBRIDO MEKA: APPVEYOR CI (NIGHTLY PRINCIPAL) + FALLBACK GITHUB RELEASES SILENCIOSO
                $FoundMeka = $false
                try {
                    $ApiUrl = "https://ci.appveyor.com/api/projects/$Repo/history?recordsNumber=15"
                    $HistoryData = Invoke-RestMethod -Uri $ApiUrl -Headers $Header -ErrorAction Stop
                    foreach ($build in $HistoryData.builds) {
                        if ($build.status -ne "success") { continue }
                        $BuildDetails = Invoke-RestMethod -Uri "https://ci.appveyor.com/api/projects/$Repo/build/$($build.version)" -Headers $Header -ErrorAction SilentlyContinue
                        if (-not $BuildDetails -or -not $BuildDetails.build.jobs) { continue }
                        foreach ($job in $BuildDetails.build.jobs) {
                            if ($job.status -ne "success" -or -not $job.jobId) { continue }
                            $Arts = Invoke-RestMethod -Uri "https://ci.appveyor.com/api/buildjobs/$($job.jobId)/artifacts" -Headers $Header -ErrorAction SilentlyContinue
                            $Asset = $Arts | Where-Object { $_.fileName -match "(?i)mekaw.*\.zip$|meka[\\/]Dist[\\/].*\.zip$" } | Select-Object -First 1
                            if ($Asset) {
                                $EncodedFile = [uri]::EscapeDataString($Asset.fileName)
                                $AppVeyorUrl = "https://ci.appveyor.com/api/buildjobs/$($job.jobId)/artifacts/$EncodedFile"
                                try {
                                    $chk = $Global:HttpClient.GetAsync($AppVeyorUrl, [System.Net.Http.HttpCompletionOption]::ResponseHeadersRead).Result
                                    if ($chk.IsSuccessStatusCode) {
                                        $Urls += $AppVeyorUrl
                                        $FoundMeka = $true
                                        break
                                    }
                                } catch {}
                            }
                        }
                        if ($FoundMeka) { break }
                    }
                } catch {}

                if (-not $FoundMeka) {
                    # Contingência 100% silenciosa: GitHub Releases oficial caso AppVeyor expire ou falhe
                    try {
                        $MekaRel = Invoke-RestMethod -Uri "https://api.github.com/repos/$Repo/releases" -Headers $Header -ErrorAction Stop
                        foreach ($rel in $MekaRel) {
                            $Asset = $rel.assets | Where-Object { $_.name -match "(?i)mekaw.*\.zip" } | Select-Object -First 1
                            if ($Asset) { $Urls += $Asset.browser_download_url; $FoundMeka = $true; break }
                        }
                    } catch {
                        try {
                            $mekaWeb = Get-GitHubReleaseAssetsWeb $Repo
                            $AssetWeb = $mekaWeb | Where-Object { $_ -match "(?i)mekaw.*\.zip" } | Select-Object -First 1
                            if ($AssetWeb) { $Urls += $AssetWeb; $FoundMeka = $true }
                        } catch {}
                    }
                }
                if (-not $FoundMeka) { throw "MEKA indisponível no momento" }
            }
            elseif ($Type -eq "DeSmuME_Fallback") { 
                $NightlyUrl = "https://nightly.link/TASEmulators/desmume/workflows/build_win/master/desmume-win-x64.zip" 
                try { 
                    $check = $Global:HttpClient.GetAsync($NightlyUrl, [System.Net.Http.HttpCompletionOption]::ResponseHeadersRead).Result 
                    $check.EnsureSuccessStatusCode() | Out-Null 
                    $Urls += $NightlyUrl 
                } catch { 
                    try {
                        $Rel = Invoke-RestMethod -Uri "https://api.github.com/repos/TASEmulators/desmume/releases" -Headers $Header -ErrorAction Stop 
                        foreach ($r in $Rel) { 
                            $Asset = $r.assets | Where-Object { $_.name -match "win64.*\.zip" } | Select-Object -First 1 
                            if ($Asset) { $Urls += $Asset.browser_download_url; break } 
                        } 
                    } catch {
                        $dsWeb = Get-GitHubReleaseAssetsWeb "TASEmulators/desmume"
                        $dsMatch = $dsWeb | Where-Object { $_ -match "win64.*\.zip" } | Select-Object -First 1
                        if ($dsMatch) { $Urls += $dsMatch }
                    }
                } 
            } 
            elseif ($Type -eq "GitLab_API") { 
                $ApiUrl = "https://gitlab.com/api/v4/projects/es-de%2Femulationstation-de/releases" 
                $Rel = Invoke-RestMethod -Uri $ApiUrl -ErrorAction Stop 
                $Asset = $Rel[0].assets.links | Where-Object { $_.url -match "x64_Portable\.zip" -or $_.name -match "x64_Portable\.zip" } | Select-Object -First 1 
                if ($Asset) { $Urls += $Asset.url } 
                else { throw "Link GitLab não encontrado" } 
            } 
            elseif ($Type -eq "AppVeyor_Snes9x") { 
                $x86Url = ""; $x64Url = "" 
                try {
                    $SData = Invoke-RestMethod -Uri "https://ci.appveyor.com/api/projects/snes9x/snes9x" -ErrorAction Stop 
                    if ($SData -and $SData.build -and $SData.build.jobs) { 
                        foreach ($job in $SData.build.jobs) { 
                            if ($job.status -ne "success") { continue } 
                            $arts = Invoke-RestMethod -Uri "https://ci.appveyor.com/api/buildjobs/$($job.jobId)/artifacts" -ErrorAction SilentlyContinue 
                            if ($arts -and $arts.Count -gt 0) { 
                                if (-not $x86Url) { 
                                    $f86 = $arts | Where-Object { $_.fileName -match "win32\.zip$" -and $_.fileName -notmatch "x64|libretro|debug" } | Select-Object -First 1 
                                    if ($f86) { $x86Url = "https://ci.appveyor.com/api/buildjobs/$($job.jobId)/artifacts/$([uri]::EscapeDataString($f86.fileName))" } 
                                } 
                                if (-not $x64Url) { 
                                    $f64 = $arts | Where-Object { $_.fileName -match "win32-x64\.zip$" -and $_.fileName -notmatch "libretro|debug" } | Select-Object -First 1 
                                    if ($f64) { $x64Url = "https://ci.appveyor.com/api/buildjobs/$($job.jobId)/artifacts/$([uri]::EscapeDataString($f64.fileName))" } 
                                } 
                            } 
                        } 
                        if ($x86Url) { $Urls += $x86Url } 
                        if ($x64Url) { $Urls += $x64Url } 
                    } 
                } catch {
                    # Fallback GitHub Releases oficial do snes9x
                    $snAssets = Get-GitHubReleaseAssetsWeb "snes9xgit/snes9x" -LatestOnly
                    $sn64 = $snAssets | Where-Object { $_ -match "win32-x64\.zip$" } | Select-Object -First 1
                    if ($sn64) { $Urls += $sn64 }
                }
            } 
            elseif ($Type -eq "FCEUX_Combo") { 
                $Urls += "https://github.com/TASEmulators/fceux/releases/download/interim-build/fceux-win32.zip" 
                $Urls += "https://github.com/TASEmulators/fceux/releases/download/interim-build/fceux-win64.zip" 
            } 
            elseif ($Type -eq "GitHub_YmirNightly") { 
                try {
                    $Rel = Invoke-RestMethod -Uri "https://api.github.com/repos/$Repo/releases/tags/latest-nightly" -Headers $Header -ErrorAction Stop 
                    $Asset = $Rel.assets | Where-Object { $_.name -match $FileKeyword } | Select-Object -First 1 
                    if ($Asset) { $Urls += $Asset.browser_download_url } 
                } catch {
                    $ymAssets = Get-GitHubReleaseAssetsWeb $Repo -LatestOnly
                    $ymMatch = $ymAssets | Where-Object { $_ -match $FileKeyword } | Select-Object -First 1
                    if ($ymMatch) { $Urls += $ymMatch }
                }
            } 
            elseif ($Type -eq "Dolphin_CI") { 
                $ApiBuilds = "https://dolphin.ci/api/v2/builders/37/builds?limit=5&order=-number" 
                $BuildsJson = (Invoke-RestMethod -Uri $ApiBuilds -Headers $Header -ErrorAction Stop).builds 
                $FoundDolphin = $false 

                foreach ($Build in $BuildsJson) { 
                    $BuildId = $Build.buildid 
                    $ApiProps = "https://dolphin.ci/api/v2/builds/$BuildId/properties" 
                    $PropsStr = (Invoke-WebRequest -Uri $ApiProps -UseBasicParsing -Headers $Header).Content 

                    if ($PropsStr -match '(https://dl\.dolphin-emu\.org/builds/[a-zA-Z0-9/_-]+x64\.7z)') { 
                        $Urls += $matches[1] 
                        $FoundDolphin = $true 
                        break 
                    } 
                }            
                if (-not $FoundDolphin) { throw "Link não encontrado na API do Dolphin CI." } 
            }        
            elseif ($Type -eq "Flycast") { 
                [xml]$xml = (Invoke-WebRequest -Uri "https://flycast-builds.s3.fr-par.scw.cloud/?prefix=win/heads/master" -UseBasicParsing -UserAgent $UA -ErrorAction Stop).Content 
                $Urls += "https://flycast-builds.s3.fr-par.scw.cloud/" + ($xml.ListBucketResult.Contents | Where-Object { $_.Key -like "*.zip" } | Sort-Object LastModified -Descending | Select-Object -First 1).Key 
            } 
            elseif ($Type -eq "Project64_Nightly") { 
                $html = (Invoke-WebRequest -Uri "https://www.pj64-emu.com/nightly-builds" -UseBasicParsing -UserAgent $UA).Content 
                if ($html -match 'href="(/file/project64-win32-dev-[^"]+)"') { $Urls += "https://www.pj64-emu.com" + $matches[1] } 
            } 
            elseif ($Type -eq "PCSX_Redux_Nightly") { 
                $Idx = Invoke-RestMethod -Uri "https://distrib.app/storage/manifests/pcsx-redux/dev-win-x64/manifest.json" -Headers $Header -ErrorAction Stop 
                if ($Idx -and $Idx.builds) { 
                    $LID = $Idx.builds[0].id 
                    $Bld = Invoke-RestMethod -Uri "https://distrib.app/storage/manifests/pcsx-redux/dev-win-x64/manifest-$LID.json" -Headers $Header -ErrorAction Stop 
                    if ($Bld -and $Bld.path) { $Urls += "https://distrib.app$($Bld.path)" } 
                } 
            } 
            elseif ($Type -eq "PPSSPP_Nightly") { 
                $T = (Invoke-RestMethod -Uri "https://builds.ppsspp.org/meta/history-20.json") | Where-Object { $_.builds.Windows -match '\.zip' } | Select-Object -First 1 
                if ($T) { $Urls += "https://builds.ppsspp.org/builds/$($T.description)/$($T.builds.Windows[0])" } 
            } 
            elseif ($Type -eq "Scrape") { 
                $html = (Invoke-WebRequest -Uri $DirectLink -UseBasicParsing).Content 
                if ($html -match 'href="([^"]+windows-x64\.zip)"') { $Urls += $matches[1] } 
            } 
            elseif ($Type -eq "BizHawk_Dev") {
                $bizUrl = $null
                try {
                    $arts = (Invoke-RestMethod -Uri "https://api.github.com/repos/TASEmulators/BizHawk/actions/artifacts?per_page=30" -Headers $Header -ErrorAction Stop).artifacts
                    $validArt = $arts | Where-Object { $_.name -eq "BizHawk-dev-windows" -and -not $_.expired -and $_.workflow_run.head_branch -eq "master" } | Select-Object -First 1
                    if ($validArt) {
                        $bizUrl = "https://nightly.link/TASEmulators/BizHawk/actions/runs/$($validArt.workflow_run.id)/BizHawk-dev-windows.zip"
                    }
                } catch {}

                if (-not $bizUrl) {
                    try {
                        $actHtml = (Invoke-WebRequest -Uri "https://github.com/TASEmulators/BizHawk/actions/workflows/ci.yml?query=branch%3Amaster+is%3Asuccess" -UseBasicParsing -UserAgent $UA_Chrome -ErrorAction Stop).Content
                        $runMatches = [regex]::Matches($actHtml, '/TASEmulators/BizHawk/actions/runs/(\d+)')
                        $latestRunId = ($runMatches | ForEach-Object { $_.Groups[1].Value } | Select-Object -Unique -First 1)
                        if ($latestRunId) {
                            $bizUrl = "https://nightly.link/TASEmulators/BizHawk/actions/runs/$latestRunId/BizHawk-dev-windows.zip"
                        }
                    } catch {}
                }

                if (-not $bizUrl) {
                    $bizUrl = "https://nightly.link/TASEmulators/BizHawk/workflows/ci/master/BizHawk-dev-windows.zip"
                }

                if ($bizUrl) { $Urls += $bizUrl }
                else { throw "Não foi possível resolver o link do BizHawk-dev." }
            } 
            elseif ($Type -eq "Eden_CI") {
                $htmlEden = (Invoke-WebRequest -Uri "https://git.eden-emu.dev/eden-ci/nightly/releases" -UseBasicParsing -Headers $Header -ErrorAction Stop).Content
                if ($htmlEden -match 'href="([^"]*Eden-Windows-[^"]*amd64-msvc-standard\.zip)"') {
                    $link = $matches[1]
                    $Urls += if ($link -match "^http") { $link } else { "https://git.eden-emu.dev" + $link }
                } else { throw "Link do Eden não encontrado." }
            }
            elseif ($Type -eq "RyujinxAPI") { 
                $RyuUrl = $null 
                try { 
                    $ApiRes = Invoke-RestMethod -Uri "https://update.ryujinx.app/latest/query?os=win&arch=amd64&rc=$Repo" -UserAgent "Ryujinx/1.0" -TimeoutSec 2 -ErrorAction Stop 
                    if ($ApiRes -and $ApiRes.download_url) { $RyuUrl = $ApiRes.download_url } 
                } catch { } 

                if (-not $RyuUrl) { 
                    $ryuRepos = if ($Repo -eq "canary") { 
                        @("ewigl/ryubing-canary-mirror", "ADEMOLA200/Ryujinx-Canary-Builds") 
                    } else { 
                        @("GRID0-net/GRID0-ryujinx", "NextendoNetwork/Ryujinx-Nextendo") 
                    } 

                    foreach ($rRepo in $ryuRepos) { 
                        try { 
                            $rel = Invoke-RestMethod -Uri "https://api.github.com/repos/$rRepo/releases" -Headers $Header -TimeoutSec 3 -ErrorAction Stop 
                            foreach ($r in $rel) { 
                                $asset = $r.assets | Where-Object { $_.name -match "win.*x64\.zip$|win_x64\.zip$" } | Select-Object -First 1 
                                if (-not $asset) { 
                                    $asset = $r.assets | Where-Object { $_.name -match "win.*x64\.7z$|win_x64\.7z$" } | Select-Object -First 1 
                                } 
                                if ($asset) { $RyuUrl = $asset.browser_download_url; break } 
                            } 
                        } catch { 
                            try { 
                                $resp = Invoke-WebRequest -Uri "https://github.com/$rRepo/releases" -UserAgent $UA_Chrome -UseBasicParsing -TimeoutSec 5 -ErrorAction Stop 
                                $tagMatches = [regex]::Matches($resp.Content, 'href="/' + [regex]::Escape($rRepo) + '/releases/tag/([^"]+)"') 
                                foreach ($tm in $tagMatches) { 
                                    $t = $tm.Groups[1].Value 
                                    $assetsUrl = "https://github.com/$rRepo/releases/expanded_assets/$t" 
                                    $aResp = Invoke-WebRequest -Uri $assetsUrl -UserAgent $UA_Chrome -UseBasicParsing -TimeoutSec 5 -ErrorAction Stop 
                                    $dlMatches = [regex]::Matches($aResp.Content, 'href="([^"]*releases/download/[^"]+)"') 
                                     
                                    $mZip = $null; $m7z = $null 
                                    foreach ($dm in $dlMatches) { 
                                        $dl = $dm.Groups[1].Value 
                                        if ($dl -match "win.*x64\.zip$|win_x64\.zip$") { 
                                            $mZip = if ($dl -match "^http") { $dl } else { "https://github.com$dl" } 
                                            break 
                                        } elseif ($dl -match "win.*x64\.7z$|win_x64\.7z$") { 
                                            if (-not $m7z) { $m7z = if ($dl -match "^http") { $dl } else { "https://github.com$dl" } } 
                                        } 
                                    } 
                                    if ($mZip) { $RyuUrl = $mZip; break } 
                                    if ($m7z) { $RyuUrl = $m7z; break } 
                                } 
                            } catch {} 
                        } 
                        if ($RyuUrl) { break } 
                    } 
                } 
                if ($RyuUrl) { $Urls += $RyuUrl } 
            } 
            elseif ($Type -eq "MAME_Oficial") { 
                try {
                    $Rel = Invoke-RestMethod -Uri "https://api.github.com/repos/mamedev/mame/releases/latest" -Headers $Header -ErrorAction Stop 
                    $Asset = $Rel.assets | Where-Object { $_.name -match "(_64bit|_x64)\.exe$" } | Select-Object -First 1 
                    if ($Asset) { $Urls += $Asset.browser_download_url } 
                } catch {
                    $mWeb = Get-GitHubReleaseAssetsWeb "mamedev/mame" -LatestOnly
                    $mMatch = $mWeb | Where-Object { $_ -match "(_64bit|_x64)\.exe$" } | Select-Object -First 1
                    if ($mMatch) { $Urls += $mMatch }
                }
                if ($Urls.Count -eq 0) { throw "Executável oficial não encontrado no GitHub." } 
            } 
            elseif ($Type -eq "MAMEUI_Classic") { 
                $html = (Invoke-WebRequest -Uri "https://messui.1emulation.com/" -UseBasicParsing -UserAgent $UA).Content 
                if ($html -match 'href="([^"]*mameui\d+\.7z)"') { 
                    $link = $matches[1] 
                    $Urls += if ($link -match "^http") { $link } else { "https://messui.1emulation.com/$link" } 
                } else { throw "Link do MAMEUI Classic não encontrado no Messui." } 
            } 
            elseif ($Type -eq "MAMEUI_Plus") { 
                $html = (Invoke-WebRequest -Uri "https://www.progettosnaps.net/mameplus/" -UseBasicParsing -UserAgent $UA).Content 
                if ($html -match 'href="([^"]*download\?tipo=mameplus_bin[^"]+64b\.7z)"') { 
                    $linkFragment = $matches[1].Replace("&amp;", "&") 
                    $Urls += if ($linkFragment -match "^http") { $linkFragment } else {  
                        if ($linkFragment.StartsWith("/")) { "https://www.progettosnaps.net$linkFragment" }  
                        else { "https://www.progettosnaps.net/$linkFragment" } 
                    } 
                } else { throw "Link do MAMEUI Plus não encontrado no site Progetto Snaps." } 
            } 
            elseif ($Type -eq "Arcade_64") { 
                $html64 = (Invoke-WebRequest -Uri "https://messui.1emulation.com/arcade/" -UseBasicParsing -UserAgent $UA).Content 
                if ($html64 -match '(?i)href="([^"]*arcade\d+\.7z)"') { 
                    $link = $matches[1] 
                    $Urls += if ($link -match "^http") { $link } else { "https://messui.1emulation.com/arcade/$link" } 
                } else { throw "Arquivo 64-bit não encontrado no site Messui." } 
            } 
            elseif ($Type -eq "Arcade_32") { 
                $html32 = (Invoke-WebRequest -Uri "https://retrodanuart.com/mamexp/" -UseBasicParsing -UserAgent $UA).Content 
                $links32 = ([regex]'(?i)href="([^"]+\.7z)"').Matches($html32) | ForEach-Object { $_.Groups[1].Value } 
                $Url32 = $links32 | Where-Object { $_ -match "32" } | Select-Object -First 1 
                if ($Url32) { 
                    if ($Url32 -match "^http") {  
                        $Urls += $Url32  
                    } else {  
                        $cleanPath = $Url32.TrimStart('/') 
                        $Urls += "https://retrodanuart.com/$cleanPath"  
                    } 
                } else { throw "Link 32-bit não encontrado no Retro Danuart." } 
            } 
            elseif ($Type -eq "ClrMame_Oficial") { 
                $SiteUrl = "https://mamedev.emulab.it/clrmamepro/"
                $Html = (Invoke-WebRequest -Uri $SiteUrl -UseBasicParsing -UserAgent $UA_Chrome -ErrorAction Stop).Content 
                
                $AllZips = ([regex]"(?i)href\s*=\s*[`"']([^`"']*\.zip)[`"']").Matches($Html) | ForEach-Object { $_.Groups[1].Value }
                $ValidLinks = $AllZips | Where-Object { $_ -match $FileKeyword -and $_ -notmatch "(?i)src|source|mac|linux" }
                
                if ($ValidLinks) { 
                    $link = $ValidLinks | Sort-Object | Select-Object -Last 1
                    $Urls += if ($link -match "^http") { $link } else { $SiteUrl + $link.TrimStart('/') } 
                } else { throw "Arquivo $FileKeyword não encontrado no site." } 
            } 
            elseif ($Type -eq "ClrMame_Pro_Combo") { 
                $SiteUrl = "https://mamedev.emulab.it/clrmamepro/"
                $Html = (Invoke-WebRequest -Uri $SiteUrl -UseBasicParsing -UserAgent $UA_Chrome -ErrorAction Stop).Content 
                
                $AllZips = ([regex]"(?i)href\s*=\s*[`"']([^`"']*\.zip)[`"']").Matches($Html) | ForEach-Object { $_.Groups[1].Value }
                $Link32 = $AllZips | Where-Object { $_ -match "cmp.*32\.zip" } | Sort-Object | Select-Object -Last 1
                $Link64 = $AllZips | Where-Object { $_ -match "cmp.*64\.zip" } | Sort-Object | Select-Object -Last 1
                
                if ($Link32) { $Urls += if ($Link32 -match "^http") { $Link32 } else { $SiteUrl + $Link32.TrimStart('/') } }
                if ($Link64) { $Urls += if ($Link64 -match "^http") { $Link64 } else { $SiteUrl + $Link64.TrimStart('/') } }
                
                if ($Urls.Count -eq 0) { throw "Nenhum arquivo ClrMamePro encontrado no site." } 
            }
            elseif ($Type -eq "GitHub_SuperSnes9x") { 
                try {
                    $Rel = Invoke-RestMethod -Uri "https://api.github.com/repos/shanytc/snes9x/releases/latest" -Headers $Header -ErrorAction Stop 
                    $Asset32 = $Rel.assets | Where-Object { $_.name -match "win32\.zip$" } | Select-Object -First 1 
                    $Asset64 = $Rel.assets | Where-Object { $_.name -match "win32-x64\.zip$" } | Select-Object -First 1 
                    if ($Asset32) { $Urls += $Asset32.browser_download_url } 
                    if ($Asset64) { $Urls += $Asset64.browser_download_url } 
                } catch {
                    $ssWeb = Get-GitHubReleaseAssetsWeb "shanytc/snes9x" -LatestOnly
                    $ss32 = $ssWeb | Where-Object { $_ -match "win32\.zip$" } | Select-Object -First 1
                    $ss64 = $ssWeb | Where-Object { $_ -match "win32-x64\.zip$" } | Select-Object -First 1
                    if ($ss32) { $Urls += $ss32 }
                    if ($ss64) { $Urls += $ss64 }
                }
            } 
            elseif ($Type -eq "Scrape_SuperZSNES") { 
                $htmlZsnes = (Invoke-WebRequest -Uri "https://www.zsnes.com/" -UseBasicParsing -Headers $Header -ErrorAction Stop).Content 
                if ($htmlZsnes -match 'href\s*=\s*["'']?([^"''>]*SuperZSNES[^"''>]*\.zip)["'']?') { 
                    $link = $matches[1] 
                    $Urls += if ($link -match "^http") { $link } else { "https://www.zsnes.com/" + $link.TrimStart('/') } 
                } else { throw "Link do SuperZSNES não encontrado." } 
            } 
            elseif ($Type -eq "RetroArch_Buildbot") { 
                $htmlBuildbot = (Invoke-WebRequest -Uri "https://buildbot.libretro.com/stable/" -UseBasicParsing -UserAgent $UA -ErrorAction Stop).Content 
                $Versoes = ([regex]'href="[^"]*?(\d+\.\d+\.\d+)/?"').Matches($htmlBuildbot) | ForEach-Object {  
                    try { [version]$_.Groups[1].Value } catch {}  
                } | Where-Object { $_ -ne $null } | Sort-Object -Unique 
                 
                if ($Versoes.Count -gt 0) { 
                    $UltimaVersao = $Versoes[-1].ToString(3) 
                    $Urls += "https://buildbot.libretro.com/stable/$UltimaVersao/windows/x86_64/RetroArch.7z" 
                } else {  
                    throw "Versões não encontradas no Buildbot"  
                } 
            }

            if ($Urls.Count -eq 0) { throw "Sem link disponível" } 

            foreach ($Url in $Urls) { 
                $ItemLabel = $DisplayName
                if ($Urls.Count -gt 1) {
                    $DecodedUrlCheck = [uri]::UnescapeDataString($Url)
                    $FaqNCheck = if ($DecodedUrlCheck -match '([^/]+\.(zip|7z|exe|rar))$') { $matches[1] } else { "$Name.zip" }
                    
                    if ($Name -eq "ClrMamePro") {
                        if ($FaqNCheck -match "cmp.*32") { $ItemLabel = "ClrMamePro-32" }
                        elseif ($FaqNCheck -match "cmp.*64") { $ItemLabel = "ClrMamePro-64" }
                    }
                    elseif ($FaqNCheck -match "(?i)graphicPacks") { $ItemLabel = "graphicPacks" }
                    elseif ($FaqNCheck -match "(?i)patches\.(zip|7z)|game-patches") { $ItemLabel = "Patches" }
                    elseif ($FaqNCheck -match "(?i)cheats\.(zip|7z)") { $ItemLabel = "Cheats" }
                    elseif (($Urls -match '32|x86') -and ($Urls -match '64')) {
                        if ($FaqNCheck -match "(?i)x64|win64|x86_64") { $ItemLabel = "$DisplayName (64-bit)" }
                        elseif ($FaqNCheck -match "(?i)win32|x86") { $ItemLabel = "$DisplayName (32-bit)" }
                    }
                    elseif ($Url -ne $Urls[0]) { $ItemLabel = (T 'Complement') }
                }

                try {
                    $LBaixY = [Console]::CursorTop 
                    $DecodedUrl = [uri]::UnescapeDataString($Url) 
                    $FaqN = if ($DecodedUrl -match '([^/]+\.(zip|7z|exe|rar))$') { $matches[1] } else { "$Name.zip" } 
                    
                    $UrlUA = if ($Type -eq "RyujinxAPI" -and $Url -match "ryujinx\.app") { "Ryujinx/1.0" } else { $UA_Chrome } 
                    
                    $SizeMB = 0 
                    try { 
                        $reqH = [System.Net.WebRequest]::Create($Url); $reqH.Method = "HEAD"; $reqH.Timeout = 5000; $reqH.UserAgent = $UrlUA 
                        $resH = $reqH.GetResponse(); $SizeMB = [Math]::Round($resH.ContentLength / 1MB, 2); $resH.Close() 
                    } catch { $SizeMB = 0 } 

                    $DispSize = if ($SizeMB -gt 0) { "($SizeMB MB)" } else { "" } 
                    $RyuWarn = if ($Type -eq "RyujinxAPI" -and $SizeMB -eq 0) { (T 'HiddenSize') } else { "" } 
                    
                    Write-Host (T 'Downloading' $FaqN) -NoNewline -ForegroundColor White 
                    if ($RyuWarn) { Write-Host $RyuWarn -NoNewline -ForegroundColor DarkGray } 
                    
                    If (!(Test-Path -LiteralPath $TempDir)) { [System.IO.Directory]::CreateDirectory($TempDir) | Out-Null } 
                    
                    $HashPrefix = (New-Guid).Guid.Substring(0,4) 
                    $TFile = Join-Path $TempDir "${HashPrefix}_$FaqN" 
                    
                    Custom-Download -Url $Url -Path $TFile -UA $UrlUA 
                    
                    $FinalSize = if ($SizeMB -eq 0 -and (Test-Path -LiteralPath $TFile)) { [Math]::Round((Get-Item -LiteralPath $TFile).Length / 1MB, 2) } else { $SizeMB } 
                    
                    try {
                        [Console]::SetCursorPosition(0, $LBaixY) 
                        Write-Host "$((T 'Downloaded' $FaqN $FinalSize))".PadRight(([Console]::WindowWidth - 1)) -ForegroundColor White 
                    } catch {}
                    
                    $Global:LOrgY = [Console]::CursorTop 
                    Write-Host "$((T 'Organizing')) " -NoNewline -ForegroundColor Magenta 
                    
                    try {
                        Extract-And-Flatten -ZipFile $TFile -TargetFolder $ExtractPath -Name $Name 
                    } finally {
                        try {
                            [Console]::SetCursorPosition(0, $Global:LOrgY)
                            Write-Host "".PadRight(([Console]::WindowWidth - 1)) -NoNewline
                            [Console]::SetCursorPosition(0, $Global:LOrgY) 
                        } catch {}
                    }

                    if ($ItemLabel -match "(?i)graphicPacks|Patches|Cheats") {
                        Write-Host (T 'OkUpdatedPlural' $ItemLabel) -ForegroundColor Green
                    } else {
                        Write-Host (T 'OkUpdatedSingular' $ItemLabel) -ForegroundColor Green
                    }

                } catch {
                    $errY = [Console]::CursorTop
                    try { [Console]::SetCursorPosition(0, $errY); Write-Host "".PadRight(([Console]::WindowWidth - 1)) -NoNewline; [Console]::SetCursorPosition(0, $errY) } catch {}
                    
                    $rawErr = "$_"
                    $cleanErr = if ($rawErr -match "404") { "404" } elseif ($rawErr -match "rate limit") { T 'RateLimitBlock' } else { T 'NetworkFail' }
                    
                    if ($ItemLabel -match "(?i)graphicPacks|Patches|Cheats") {
                        Write-Host (T 'ErrComponent' $ItemLabel $cleanErr) -ForegroundColor Red
                    } else {
                        Write-Host (T 'ErrProcess' $DisplayName) -ForegroundColor Red
                    }
                    $ErrorPrinted = $true
                    throw $_
                } finally { 
                    if (Test-Path -LiteralPath $TFile) { Remove-Item -LiteralPath $TFile -Force -ErrorAction SilentlyContinue } 
                } 
            } 

            if ($IsSwitch) {
                $Global:LastEmuSuccess = $true
                if ($Name -eq "Ryujinx") { Update-SwitchAssets "Ryujinx" "$ExtractPath\portable\bis\system\Contents\registered" "$ExtractPath\portable\system" }
                if ($Name -eq "Ryujinx-Canary") { Update-SwitchAssets "Ryujinx-Canary" "$ExtractPath\portable\bis\system\Contents\registered" "$ExtractPath\portable\system" }
                if ($Name -eq "Eden") { Update-SwitchAssets "Eden" "$ExtractPath\user\nand\system\Contents\registered" "$ExtractPath\user\keys" }
                if ($Name -eq "Citron-Neo") { Update-SwitchAssets "Citron-Neo" "$ExtractPath\user\nand\system\Contents\registered" "$ExtractPath\user\keys" }
                $Global:SuccessfulDownloads++ 
            } else {
                $Global:LastEmuSuccess = $true
                $Global:SuccessfulDownloads++ 
                
                if (-not $IsSwitch -and $Name -match "Project64") { 
                    $Pj64RegPath = "HKCU:\SOFTWARE\Project64" 
                    if (-not (Test-Path -LiteralPath $Pj64RegPath)) { New-Item -Path $Pj64RegPath -Force | Out-Null } 
                    [byte[]]$Pj64Key = 0xd2,0x70,0x47,0x7a,0x97,0xa4,0x2a,0x8a,0xa6,0xea,0xcb,0x17,0x23,0xed,0xaa,0xc0,0xa1,0x26,0xaf,0x70,0xb9,0xd2,0xaf,0x9c,0xd5,0xb8,0x13,0xd5,0xc8,0xe6,0x36,0xdf,0xdb,0x4e,0xf1,0x74,0x54,0x2c,0xb4,0x15,0x48,0xdf,0x19,0x77,0x11,0xbe,0x5e,0x1f,0x7c,0x14,0x19,0x1f,0x4c,0x3e,0xab,0xae,0xa6,0x26,0x87,0xbb,0x8a,0xd8,0x27,0x30,0x2c,0x98,0xa3,0x09,0x75,0x2d,0x44,0x27,0x15,0x29,0xec,0xb5,0xc2,0x6e,0xab,0x32,0x1e,0x52,0xcb,0xef,0x62,0x3e,0x4a,0x73 

                    Set-ItemProperty -Path $Pj64RegPath -Name "user" -Value $Pj64Key -Type Binary -Force -ErrorAction SilentlyContinue 
                    Write-Host (T 'OkVip') -ForegroundColor Green 
                }
            }
        } catch {  
            $Global:LastEmuSuccess = $false
            if (-not $ErrorPrinted) {
                $errY = [Console]::CursorTop
                try { [Console]::SetCursorPosition(0, $errY); Write-Host "".PadRight(([Console]::WindowWidth - 1)) -NoNewline; [Console]::SetCursorPosition(0, $errY) } catch {}
                Write-Host (T 'ErrProcess' $DisplayName) -ForegroundColor Red  
            }
        } 
    } 

    Write-Host " --------------------------" -ForegroundColor Cyan 
    Write-Host (T 'CatEmus') -ForegroundColor Cyan 
    Write-Host " --------------------------`n" -ForegroundColor Cyan     
    Update-Emu "Ares" "GitHub" "ares-emulator/ares" "PUT_YOUR_DIRECTORY_HERE\_Outros\Ares" "windows" 
    Update-Emu "Azahar" "GitHub" "azahar-emu/azahar" "PUT_YOUR_DIRECTORY_HERE\Nintendo 3DS\Azahar\Azahar (HEAD-afbaf8e)" "windows-msvc.*\.zip" 
    Update-Emu "Azahar-Master" "Direct" "" "PUT_YOUR_DIRECTORY_HERE\Nintendo 3DS\Azahar\AzaharMaster (master-d4b5633)" "" "https://nightly.link/azahar-emu/azahar/workflows/build/master/windows-msvc.zip" 
    Update-Emu "Azahar-Plus" "GitHub" "AzaharPlus/AzaharPlus" "PUT_YOUR_DIRECTORY_HERE\Nintendo 3DS\Azahar\AzaharPlus (c13dce9090-dirty)" "windows.*zip" 
    Update-Emu "BizHawk" "GitHub" "TASEmulators/BizHawk" "PUT_YOUR_DIRECTORY_HERE\_Outros\BizHawk" "win-x64.*\.zip" 
    Update-Emu "BizHawk-dev" "BizHawk_Dev" "TASEmulators/BizHawk" "PUT_YOUR_DIRECTORY_HERE\_Outros\BizHawk_devbuild" "" 
    Update-Emu "bsnes" "GitHub" "bsnes-emu/bsnes" "PUT_YOUR_DIRECTORY_HERE\Super Nintendo\Bsnes-Nightly-v115" "windows" 
    Update-Emu "Cemu" "GitHub" "cemu-project/Cemu" "PUT_YOUR_DIRECTORY_HERE\Nintendo Wii U\Cemu" "windows-x64" 
    Update-Emu "Citron-Neo" "GitHub_Tag" "citron-neo/CI" "PUT_YOUR_DIRECTORY_HERE\Nintendo Switch\Citron-NEO (Nightly)-x64" "windows" "nightly-windows" -IsSwitch
    Update-Emu "Cxbx-Reloaded" "GitHub" "Cxbx-Reloaded/Cxbx-Reloaded" "PUT_YOUR_DIRECTORY_HERE\Xbox\Cxbx-Reloaded" "Release" 
    Update-Emu "Deecy" "GitHub" "Senryoku/Deecy" "PUT_YOUR_DIRECTORY_HERE\DreamCast\Deecy" "x86_64-windows\.zip" 
    Update-Emu "DeSmuME" "DeSmuME_Fallback" "" "PUT_YOUR_DIRECTORY_HERE\Nintendo DS\DeSmuME-VS2022-x64-Release" ""    
    Update-Emu "Dolphin" "Dolphin_CI" "" "PUT_YOUR_DIRECTORY_HERE\GameCube-NintendoWII\Dolphin - v5.0-26000 - (x64)" ""    
    Update-Emu "DuckStation" "Direct" "" "PUT_YOUR_DIRECTORY_HERE\PlayStation 1\DuckStation" "" "https://github.com/stenzek/duckstation/releases/download/preview/duckstation-windows-x64-release.zip" 
    Update-Emu "Eden" "Eden_CI" "" "PUT_YOUR_DIRECTORY_HERE\Nintendo Switch\Eden" "" -IsSwitch
    Update-Emu "FCEUX" "FCEUX_Combo" "" "PUT_YOUR_DIRECTORY_HERE\Nintendo NES\FCEUX" "" 
    Update-Emu "FinalBurn-Neo" "GitHub" "finalburnneo/FBNeo" "PUT_YOUR_DIRECTORY_HERE\_Outros\FinalBurn Neo" "windows-x86_64\.zip" 
    Update-Emu "Flycast" "Flycast" "" "PUT_YOUR_DIRECTORY_HERE\DreamCast\Flycast" "" 
    Update-Emu "Flycast-Dojo" "GitHub" "blueminder/flycast-dojo" "PUT_YOUR_DIRECTORY_HERE\DreamCast\Flycast Dojo" "zip" 
    Update-Emu "Gearboy" "Scrape" "" "PUT_YOUR_DIRECTORY_HERE\GameBoyAdvanced-GameBoyColor\Gearboy" "" "https://nightly.link/drhelius/Gearboy/workflows/gearboy/master" 
    Update-Emu "GearSystem" "Scrape" "" "PUT_YOUR_DIRECTORY_HERE\MegaDrive-MasterSystem-GameGear\GearSystem" "" "https://nightly.link/drhelius/Gearsystem/workflows/gearsystem/master" 
    Update-Emu "jgenesis" "GitHub" "jsgroth/jgenesis" "PUT_YOUR_DIRECTORY_HERE\_Outros\jgenesis" "windows.*x86_64.*\.zip|windows.*\.zip" 
    Update-Emu "MAME Oficial" "MAME_Oficial" "" "PUT_YOUR_DIRECTORY_HERE\Arcade\MAME Oficial" "" 
    Update-Emu "MAMEUI64 Classic" "MAMEUI_Classic" "" "PUT_YOUR_DIRECTORY_HERE\Arcade\MAMEUI64 Classic" "" 
    Update-Emu "MAMEUI64 Plus!" "MAMEUI_Plus" "" "PUT_YOUR_DIRECTORY_HERE\Arcade\MAMEUI64 Plus!" "" 
    Update-Emu "MAME-ARCADE64" "Arcade_64" "" "PUT_YOUR_DIRECTORY_HERE\Arcade\ARCADE64_GCC" "" 
    Update-Emu "MEKA" "MEKA_Dual" "ocornut/meka" "PUT_YOUR_DIRECTORY_HERE\_Outros\MEKA" "(?i)mekaw.*\.zip"
    Update-Emu "Mesen" "GitHub" "SourMesen/Mesen2" "PUT_YOUR_DIRECTORY_HERE\_Outros\Mesen2" "Windows.*\.zip"
    Update-Emu "mGBA" "Direct" "" "PUT_YOUR_DIRECTORY_HERE\GameBoyAdvanced-GameBoyColor\mGBA - v0.11" "" "https://s3.amazonaws.com/mgba/mGBA-build-latest-win64.7z" 
    Update-Emu "PCSX-Redux" "PCSX_Redux_Nightly" "" "PUT_YOUR_DIRECTORY_HERE\PlayStation 1\PCSX-Redux Git (nightly-x64)" "" 
    Update-Emu "PCSX2" "GitHub" "PCSX2/pcsx2" "PUT_YOUR_DIRECTORY_HERE\PlayStation 2\PCSX2 - v2.7" "windows-x64-Qt" 
    Update-Emu "PPSSPP" "PPSSPP_Nightly" "" "PUT_YOUR_DIRECTORY_HERE\PlayStation Portable\PPSSPP - v1.20.4-0000000000" "" 
    Update-Emu "Project64" "Project64_Nightly" "" "PUT_YOUR_DIRECTORY_HERE\Nintendo 64\Project64 - v4.0.0" ""
    Update-Emu "Rosalie's Mupen" "GitHub" "Rosalie241/RMG" "PUT_YOUR_DIRECTORY_HERE\Nintendo 64\Rosalie's Mupen GUI" "RMG-Portable-Windows.*\.zip"	
    Update-Emu "Rpcs3" "GitHub" "RPCS3/rpcs3-binaries-win" "PUT_YOUR_DIRECTORY_HERE\PlayStation 3\Rpcs3" "win64" 
    Update-Emu "Ryujinx" "RyujinxAPI" "stable" "PUT_YOUR_DIRECTORY_HERE\Nintendo Switch\Ryujinx" "" -IsSwitch
    Update-Emu "Ryujinx-Canary" "RyujinxAPI" "canary" "PUT_YOUR_DIRECTORY_HERE\Nintendo Switch\Ryujinx Canary" "" -IsSwitch
    Update-Emu "shadPS4" "GitHub" "shadps4-emu/shadps4-qtlauncher" "PUT_YOUR_DIRECTORY_HERE\Playstation 4\shadPS4QtLauncher" "win64-qt" 
    Update-Emu "Snes9xCombo" "AppVeyor_Snes9x" "" "PUT_YOUR_DIRECTORY_HERE\Super Nintendo\Snes9x - v1.63 (x86-x64)" "" 
    Update-Emu "SuperSnes9x" "GitHub_SuperSnes9x" "" "PUT_YOUR_DIRECTORY_HERE\Super Nintendo\SuperSnes9x - v1.63 (x86-x64)" "" 
    Update-Emu "SuperZSNES" "Scrape_SuperZSNES" "" "PUT_YOUR_DIRECTORY_HERE\Super Nintendo\SuperZSNES" "" 
    Update-Emu "VisualBoyAdvance-M" "Direct" "" "PUT_YOUR_DIRECTORY_HERE\GameBoyAdvanced-GameBoyColor\VisualBoyAdvance-M-x86-x64" "" "https://nightly.visualboyadvance-m.org/visualboyadvance-m-Win-x86_64.zip" 
    Update-Emu "Vita3K" "GitHub" "Vita3K/Vita3K-builds" "PUT_YOUR_DIRECTORY_HERE\PlayStation Vita\Vita3K" "windows" 
    Update-Emu "Xemu" "GitHub" "xemu-project/xemu" "PUT_YOUR_DIRECTORY_HERE\Xbox\XEMU" "windows"   
    Update-Emu "Xenia Canary" "GitHub" "xenia-canary/xenia-canary" "PUT_YOUR_DIRECTORY_HERE\Xbox 360\Xenia Canary + Patchs" "xenia_canary.*windows.*\.7z|canary.*windows" "https://github.com/xenia-canary/game-patches/releases/latest/download/game-patches.7z"  
    Update-Emu "Xenia Edge" "GitHub" "has207/xenia-edge" "PUT_YOUR_DIRECTORY_HERE\Xbox 360\Xenia Edge" "windows" "https://github.com/xenia-canary/game-patches/releases/latest/download/game-patches.7z" 
    Update-Emu "Xenia Master" "Direct" "" "PUT_YOUR_DIRECTORY_HERE\Xbox 360\Xenia Master" "" "https://github.com/xenia-project/release-builds-windows/releases/latest/download/xenia_master.zip" 
    Update-Emu "Ymir-AVX2" "GitHub_YmirNightly" "StrikerX3/Ymir" "PUT_YOUR_DIRECTORY_HERE\Sega Saturn\Ymir-x86_64-AVX2-dev" "windows.*AVX2.*\.zip" 
    Update-Emu "Ymir-SSE2" "GitHub_YmirNightly" "StrikerX3/Ymir" "PUT_YOUR_DIRECTORY_HERE\Sega Saturn\Ymir-x86_64-SSE2-dev" "windows.*SSE2.*\.zip" 
      
    Write-Host "`n -----------------------------" -ForegroundColor Cyan 
    Write-Host (T 'CatFrontends') -ForegroundColor Cyan 
    Write-Host " -----------------------------`n" -ForegroundColor Cyan    
    Update-Emu "Attract-Mode Plus" "GitHub" "oomek/attractplus" "PUT_YOUR_DIRECTORY_HERE\_Outros\Attract-Mode Plus" "Windows.*\.7z" 
    Update-Emu "ClrMame" "ClrMame_Oficial" "" "PUT_YOUR_DIRECTORY_HERE\_Outros\ClrMame" "clrmame.*\.zip" 
    Update-Emu "ClrMamePro" "ClrMame_Pro_Combo" "" "PUT_YOUR_DIRECTORY_HERE\_Outros\ClrMamePro" "" 
    Update-Emu "EmulationStation-DE" "GitLab_API" "" "PUT_YOUR_DIRECTORY_HERE\_Outros\EmulationStation-DesktopEdition-3" "" 
    Update-Emu "Playnite" "GitHub" "JosefNemec/Playnite" "PUT_YOUR_DIRECTORY_HERE\_Outros\Playnite-10" "\.7z" 
    Update-Emu "RetroArch" "RetroArch_Buildbot" "" "PUT_YOUR_DIRECTORY_HERE\_Outros\RetroArch" "" "" 
    Update-Emu "Xenia Manager" "GitHub" "xenia-manager/xenia-manager" "PUT_YOUR_DIRECTORY_HERE\Xbox 360\_Xenia Manager\XeniaManager-v4" "zip" 

} catch { 
    Write-Host "`n$((T 'FatalError'))" -ForegroundColor Red 
} finally { 
    if ($Global:HttpClient) { $Global:HttpClient.Dispose() } 
    Update-HUD -Clear $true 
    
    # Limpeza Final da pasta temporária exclusiva da sessão
    if ($TempDir -and (Test-Path -LiteralPath $TempDir)) { 
        Remove-Item -LiteralPath $TempDir -Recurse -Force -ErrorAction SilentlyContinue 
    }

    $EndCursor = [Console]::CursorTop  
    try { 
        [Console]::SetCursorPosition(0, $Global:DownloadStatusY) 
        Write-Host "".PadRight(([Console]::WindowWidth - 1)) -NoNewline  
        [Console]::SetCursorPosition(0, $Global:DownloadStatusY) 
        if ($Global:SuccessfulDownloads -gt 0) { Write-Host "$((T 'DlFinished'))`n" -ForegroundColor DarkGreen }  
        else { Write-Host "$((T 'DlError'))`n" -ForegroundColor Red } 
    } catch {} 
     
    [Console]::SetCursorPosition(0, $EndCursor)  
    $GlobalEndTime = Get-Date 
    $TotalTime = $GlobalEndTime - $GlobalStartTime 
    $tM = [math]::Floor($TotalTime.TotalMinutes) 
    $tS = $TotalTime.Seconds 
     
    $Failed = $Global:TotalAttempted - $Global:SuccessfulDownloads 

    Write-Host "`n========================================" -ForegroundColor DarkCyan 
    Write-Host (T 'TotalTime' $tM $tS) -ForegroundColor Gray 
    Write-Host (T 'SuccessCount') -NoNewline -ForegroundColor Gray 
    Write-Host "$Global:SuccessfulDownloads" -ForegroundColor Green 
    Write-Host (T 'FailedCount') -NoNewline -ForegroundColor Gray 
    Write-Host "$Failed" -ForegroundColor Yellow 
    Write-Host "========================================" -ForegroundColor DarkCyan 
     
    Write-Host "`n$((T 'AllDone'))" -ForegroundColor Cyan 
    [Console]::Beep(800, 300); [Console]::Beep(1000, 500) 
    Read-Host (T 'PressEnter') 
}
