#region<~~Chargement des éléments de l'interface graphique~~>
using namespace System.Windows.Forms
Add-Type -AssemblyName System.Windows.Forms
#endregion

function New-ListViewItem {
    param (
        [Parameter()] $Arg1,
        [Parameter()] $Arg2,
        [Parameter()] $Arg3,
        [Parameter()] $Couleur,
        [Parameter(Mandatory = $true)] $ListView
    )

    if ($null -eq $Arg1) {
        $listViewItem = [ListViewItem]::new()
    }

    else {
        $listViewItem = [ListViewItem]::new($Arg1)
    }

    if ($null -ne $Arg2) {
        [void] $listViewItem.SubItems.Add($Arg2)
    }

    if ($null -ne $Arg3) {
        [void] $listViewItem.SubItems.Add($Arg3)
    }

    if ($null -ne $Couleur) {
        $listViewItem.ForeColor = $Couleur
    }

    [void] $ListView.Items.Add($listViewItem)
}

function Get-AuditInfo {

    [void] $listView_Audit.Columns.Add("Type", 80)
    [void] $listView_Audit.Columns.Add("Informations", 300)
    [void] $listView_Audit.Columns.Add("Prérequis", 370)

    Get-RAMInfo
    Get-OperatingSystem
    Get-ProcessorInfo
    Get-StorageInfo
}

function New-CandidatAccount {
    $userName = "Candidat"
    $password = "P@ssw0rd" | ConvertTo-SecureString -AsPlainText -Force

    New-LocalUser -Name $username -Password $password -Description "Compte candidat TSSR" -AccountNeverExpires -PasswordNeverExpires -UserMayNotChangePassword
}

function Start-WindowsMAJ {
    $UpdateSession = New-Object -ComObject Microsoft.Update.Session
    $UpdateSearcher = $UpdateSession.CreateupdateSearcher()
    $SearchResult = $UpdateSearcher.Search("IsInstalled=0")

    $UpdateDownloader = $UpdateSession.CreateUpdateDownloader()
    $UpdateDownloader.Updates = $SearchResult.Updates
    [void] $UpdateDownloader.Download()

    $UpdateInstaller = $UpdateSession.CreateUpdateInstaller()
    $UpdateInstaller.Updates = $SearchResult.Updates
    [void] $UpdateInstaller.Install()
}

function Disable-AutoUpdate  {
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" -Name AUOptions -Value 1
}

function Set-ObjApp {
    $list_Apps = [ArrayList]::new(@(
        "Microsoft 365",
        "Libre Office",
        "VMWare Workstation",
        "Virtual Box",
        "Putty",
        "Adobe Acrobat Reader",
        "WinSCP",
        "Wireshark",
        "WinMerge",
        "Google Chrome",
        "Brave",
        "Tor Browser",
        "Teams",
        "Zoom",
        "Notepad++",
        "AnyDesk",
        "Team Viewer",
        "Bitvise",
        "Cyberduck",
        "Etcher",
        "Advanced IP Scanner",
        "Netcat",
        "Draw.io"
    ))

    $list_Chocolatey = [ArrayList]::new(@(
        "office365business",
        "libreoffice-still",
        "vmwareworkstation",
        "virtualbox ",
        "putty",
        "adobereader",
        "winscp",
        "wireshark",
        "winmerge",
        "googlechrome",
        "brave",
        "tor-browser",
        "microsoft-teams",
        "zoom",
        "notepadplusplus",
        "anydesk",
        "teamviewer9",
        "bitvise-ssh-client",
        "cyberduck",
        "etcher",
        "advanced-ip-scanner",
        "netcat",
        "drawio"
    ))

    $cpt = 0
    foreach($app in $list_Apps) {
        $chocolateyName = $list_Chocolatey[$cpt]

        $obj_App = [obj_App]::new($app, $chocolateyName, $false)

        [void] $list_ObjectApps.Add($obj_App)

        $cpt += 1
    }
}