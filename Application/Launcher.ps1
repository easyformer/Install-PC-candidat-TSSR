#region<~~Chargement des éléments de l'interface graphique~~>
using namespace System.Windows.Forms
using namespace System.Collections
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Collections
#endregion

#region<~~DOT Sourcing des différents fichiers~~>
. "$PSScriptRoot\functions\functions.ps1"
. "$PSScriptRoot\Interface\Interface_Main.ps1"
#endregion

#region<~~Variables~~>
$list_Process = [ArrayList]::new()
$list_Apps = [ArrayList]::new(@(
    "Microsoft 365",
    "Libre Office",
    "Open Office",
    "VMWare Workstation",
    "Virtual Box",
    "Putty",
    "Adobe Acrobat",
    "WireShark"
))
$list_Chocolatey = [ArrayList]::new(@(
    "putty",
    "winscp",
    "winmerge",
    "wireshark",
    "googlechrome",
    "brave",
    "tor-browser",
    "microsoft-office",
    "visio",
    "teams",
    "zoom",
    "notepadplusplus",
    "vmwareworkstation",
    "anydesk",
    "teamviewer",
    "bitvise-ssh-client",
    "cyberduck",
    "puttysessionsmanager",
    "balenaetcher",
    "advanced-ip-scanner",
    "netcat",
    "drawio"
))
$dictionary_Apps = [hashtable]::new()
#endregion

function Main {
    [void] $list_Process.Count # retrait de l'erreur de non utilisation de l'IDE
    [void] $list_Apps.Count # retrait de l'erreur de non utilisation de l'IDE
    [void] $dictionary_Apps.Count # retrait de l'erreur de non utilisation de l'IDE

    [Application]::EnableVisualStyles()

    #Get-InstalledApps

    Get-AuditInfo

    Show-TronArguments
    
    [void] [Application]::Run($form_Main)
}

Main