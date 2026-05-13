Write-Host "🏠 Home-Automatisierung wird gestartet..." -ForegroundColor Cyan


# --- Hilfsfunktion: Startet nur, wenn Prozess nicht läuft ---
function Start-IfNotRunning {
    param(
        [Parameter(Mandatory)]
        [string]$AppName,

        [Parameter(Mandatory)]
        [string]$StartCommand,

        [Parameter(Mandatory)]
        [string[]]$ProcessNames
    )

    $isRunning = Get-Process -ErrorAction SilentlyContinue |
                 Where-Object { $ProcessNames -contains $_.ProcessName }

    if (-not $isRunning) {
        Write-Host "🔹 Starte $AppName" -ForegroundColor Gray
        Start-Process $StartCommand
    } else {
        Write-Host "⏩ $AppName läuft bereits" -ForegroundColor DarkGray
    }
}


# === Ecosia Browser ===
# 👉 Falls der Pfad nicht stimmt:
# Rechtsklick auf Ecosia-Verknüpfung → Eigenschaften → Ziel
$EcosiaPath = "C:\Users\Stefa\AppData\Local\EcosiaBrowser\Application\ecosiabrowser.exe"

if (Test-Path $EcosiaPath) {
    Start-Process $EcosiaPath "https://mail.google.com"
    Start-Process $EcosiaPath "https://email.t-online.de"
}

else {
    Write-Warning "Ecosia Browser nicht gefunden – Pfad prüfen!"
}

#Start-Sleep -Seconds 2

# === Proton Mail Desktop Client ===
# Typischer Pfad (ggf. anpassen)
#$ProtonPath = "C:\Users\Stefa\AppData\Local\EcosiaBrowser\Application\chrome_proxy.exe  --profile-directory=Default --app-id=jnpecgipniidlgicjocehkhajgdnjekh"

#if (Test-Path $ProtonPath) {
#    Start-Process $ProtonPath
#}
#else {
 #   Write-Warning "Proton Mail Client nicht gefunden – Pfad prüfen!"
#}


# === OneNote (nur wenn nicht offen) ===
# Robust: prüft typische Prozessnamen (klassisch + ggf. Komponenten)
Start-IfNotRunning `
  -AppName "OneNote" `
  -StartCommand "OneNote" `
  -ProcessNames @("ONENOTE", "ONENOTEIM")

Start-Sleep -Seconds 2

# === Outlook (nur wenn nicht offen) ===
# Robust: klassisch = OUTLOOK, neues Outlook oft = olk
Start-IfNotRunning `
  -AppName "Outlook" `
  -StartCommand "ms-outlook:" `
  -ProcessNames @("OUTLOOK", "olk")


# === Explorer (Dieser PC) ===
Start-Process "explorer.exe"

Write-Host "✅ Home-Automatisierung abgeschlossen" -ForegroundColor Green