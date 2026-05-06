Write-Host "🏠 Home-Automatisierung wird gestartet..." -ForegroundColor Cyan

# === Ecosia Browser ===
# 👉 Falls der Pfad nicht stimmt:
# Rechtsklick auf Ecosia-Verknüpfung → Eigenschaften → Ziel
$EcosiaPath = "C:\Program Files\Ecosia Browser\Application\ecosia.exe"

if (Test-Path $EcosiaPath) {
    Start-Process $EcosiaPath "https://mail.google.com"
    Start-Process $EcosiaPath "https://email.t-online.de"
}
else {
    Write-Warning "Ecosia Browser nicht gefunden – Pfad prüfen!"
}

Start-Sleep -Seconds 2

# === Proton Mail Desktop Client ===
# Typischer Pfad (ggf. anpassen)
$ProtonPath = "$env:LOCALAPPDATA\Programs\Proton Mail\Proton Mail.exe"

if (Test-Path $ProtonPath) {
    Start-Process $ProtonPath
}
else {
    Write-Warning "Proton Mail Client nicht gefunden – Pfad prüfen!"
}

Start-Sleep -Seconds 2

# === Outlook ===
# Funktioniert in der Regel zuverlässig
Start-Process "outlook.exe"

# === Explorer (Dieser PC) ===
Start-Process "explorer.exe"

# === OneDrive ===
$OneDrivePath = "$env:LOCALAPPDATA\Microsoft\OneDrive\OneDrive.exe"

if (Test-Path $OneDrivePath) {
    Start-Process $OneDrivePath
}
else {
    Write-Warning "OneDrive nicht gefunden oder bereits gestartet."
}

Write-Host "✅ Home-Automatisierung abgeschlossen" -ForegroundColor Green