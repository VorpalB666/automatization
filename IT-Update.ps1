Write-Host "IT-Update wird gestartet..." -ForegroundColor Red

# === GitHub Trending ===
$EcosiaPath = "C:\Users\Stefa\AppData\Local\EcosiaBrowser\Application\ecosiabrowser.exe"

if (Test-Path $EcosiaPath) {
    Start-Process $EcosiaPath "https://github.com/trending"
    Start-Process $EcosiaPath "https://github.com/explore"
}
else {
    Write-Warning "GitHub Trending nicht gefunden – Pfad prüfen!"
}

Start-Sleep -Seconds 2


# === VSCode (nur wenn nicht bereits geöffnet) ===
$VSCodePath = "C:\Users\Stefa\AppData\Local\Programs\Microsoft VS Code\Code.exe"

if (-not (Get-Process -Name "Code" -ErrorAction SilentlyContinue)) {
    if (Test-Path $VSCodePath) {
        Start-Process $VSCodePath
    }
    else {
        Write-Warning "VSCode nicht gefunden – Pfad prüfen!"
    }
}
else {
    Write-Host "⏩ VS Code läuft bereits" -ForegroundColor DarkGray
}


# === OneNote (nur wenn nicht bereits geöffnet) ===
if (-not (Get-Process -Name "ONENOTE" -ErrorAction SilentlyContinue)) {
    Start-Process "ms-onenote:"
} else {
    Write-Host "⏩ OneNote läuft bereits" -ForegroundColor DarkGray
}


Start-Sleep -Seconds 2

# === Further Internet Sources ===
$EcosiaPath = "C:\Users\Stefa\AppData\Local\EcosiaBrowser\Application\ecosiabrowser.exe"

if (Test-Path $EcosiaPath) {
    Start-Process $EcosiaPath "https://www.heise.de/"
    Start-Process $EcosiaPath "https://www.security-insider.de/"
    Start-Process $EcosiaPath "https://techcrunch.com/latest/"
}
else {
    Write-Warning "Further Internet Sources nicht gefunden – Pfad prüfen!"
}

# === Open Folder ===
Start-Process "C:\Users\Stefa\OneDrive\IT"

Write-Host "IT-Update ready" -ForegroundColor Green