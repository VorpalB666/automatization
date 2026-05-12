$Backups = @{
    "C:\Users\Stefa\OneDrive\Dokumente" = "E:\Backup\Dokumente"
    "C:\Users\Stefa\OneDrive\Gesundheit" = "E:\Backup\Gesundheit"
    "C:\Users\Stefa\OneDrive\IT" = "E:\Backup\IT"
    "C:\Users\Stefa\OneDrive\Wohnung" = "E:\Backup\Wohnung"
}

foreach ($pair in $Backups.GetEnumerator()) {
    robocopy $pair.Key $pair.Value /E /XO
}
``