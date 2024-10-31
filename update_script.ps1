# Définition du fichier de log
$logFile = "C:\Scripts\update_log.txt"
function Write-Log {
    param ([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "$timestamp - $message"
    Write-Output $logMessage | Out-File -FilePath $logFile -Append
}

# Fonction pour mettre à jour Windows
function Update-Windows {
    Write-Log "Début de la mise à jour Windows"
    
    # Charger le module de mise à jour Windows
    if (-not (Get-Module PSWindowsUpdate)) {
        Install-Module -Name PSWindowsUpdate -Force -Scope CurrentUser | Out-Null
        Import-Module PSWindowsUpdate | Out-Null
    }

    Write-Log "Recherche de mises à jour Windows..."
    $updates = Get-WindowsUpdate

    if ($updates) {
        Write-Log "Mises à jour disponibles : $($updates.Count)"
        Write-Log "Installation des mises à jour Windows..."
        Install-WindowsUpdate -AcceptAll -AutoReboot | ForEach-Object {
            Write-Log "Mise à jour installée : $($_.Title)"
        }
        Write-Log "Mises à jour Windows terminées."
    } else {
        Write-Log "Aucune mise à jour Windows trouvée."
    }
}

# Fonction pour mettre à jour les applications via Winget
function Update-Applications {
    Write-Log "Début de la mise à jour des applications avec Winget"
    $apps = winget upgrade --accept-source-agreements --accept-package-agreements --id
    foreach ($app in $apps) {
        Write-Log "Mise à jour de l'application $($app.Id)..."
        winget upgrade --id $app.Id --silent | Out-Null
        Write-Log "Application mise à jour : $($app.Id)"
    }
    Write-Log "Mises à jour des applications terminées."
}

# Exécution des mises à jour
Write-Log "====== Démarrage du script de mise à jour ======"
try {
    Update-Windows
    Update-Applications
    Write-Log "Toutes les mises à jour sont terminées."
} catch {
    Write-Log "Erreur pendant l'exécution du script : $_"
}
Write-Log "====== Fin du script de mise à jour ======"
