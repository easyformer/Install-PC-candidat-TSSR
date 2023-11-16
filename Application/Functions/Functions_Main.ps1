#region<~~Chargement des éléments de l'interface graphique~~>
using namespace System.Windows.Forms
Add-Type -AssemblyName System.Windows.Forms
#endregion

function New-ListViewItem {
    param (
        [Parameter()] $Arg1,
        [Parameter(Mandatory = $true)] $Arg2,
        [Parameter(Mandatory = $true)] $Arg3,
        [Parameter()] $Couleur,
        [Parameter(Mandatory = $true)] $ListView
    )

    if ($null -eq $Arg1) {
        $listViewItem = [ListViewItem]::new()
    }

    else {
        $listViewItem = [ListViewItem]::new($Arg1)
    }

    [void] $listViewItem.SubItems.Add($Arg2)
    [void] $listViewItem.SubItems.Add($Arg3)

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

function Install-Chocolatey {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}