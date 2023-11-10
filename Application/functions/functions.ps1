#region<~~Chargement des éléments de l'interface graphique~~>
using namespace System.Windows.Forms
using namespace System.Drawing
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#endregion

#region<~~Définition des variables~~>
$color_Red = [Color]::Red
$color_Green = [Color]::Green
#endregion

function Get-RAMInfo {

    $ram = Get-WmiObject -Class Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum
    $ramCapacityGB = [math]::Round($ram.Sum / 1GB, 2)

    if ($ramCapacityGB -lt 16) {
        $etatPrerequis = "Vous n'avez pas assez de RAM : 16GB requis"
        $couleur = $color_Red
    }
    
    else {
        $etatPrerequis = "Vous avez les 16GB de RAM requis"
        $couleur = $color_Green
    }

    New-ListViewItem -Type "RAM" -Information "$ramCapacityGB GB" -Prerequis $etatPrerequis -Couleur $couleur
}

function Get-OperatingSystem {

    $operatingSystem = Get-WmiObject -Class Win32_OperatingSystem
    $name = $operatingSystem.Caption
    $version = $operatingSystem.Version

    Switch ($name) {
        {$_ -like "*Windows 10*"} {
            $etatPrerequis = "Vous avez à minima Windows 10"
            $couleur = $color_Green
            break
        }

        {$_ -like "*Windows 11*"} {
            $etatPrerequis = "Vous avez à minima Windows 10"
            $couleur = $color_Green
            break
        }

        Default {
            $etatPrerequis = "Vous n'avez pas à minima Windows 10"
            $couleur = $color_Red
        }
    }

    New-ListViewItem -Type "OS" -Information "$name $version" -Prerequis $etatPrerequis -Couleur $couleur
}

function Get-ProcessorInfo {

    $processor = Get-WmiObject -Class Win32_Processor
    $name = $processor.Name
    $cores = $processor.NumberOfCores
    $virtualization = (Get-ComputerInfo).HyperVisorPresent

    if ($virtualization -eq $true) {
        $etatPrerequis = "La virtualisation est activée"
        $couleur = $color_Green
    }

    elseif ($virtualization -eq $false) {
        $etatPrerequis = "La virtualisation n'est pas activée"
        $couleur = $color_Red
    }

    New-ListViewItem -Type "Processeur" -Information "$name  $cores coeurs" -Prerequis $etatPrerequis -Couleur $couleur
}

function Get-StorageInfo {

    $disks = Get-WmiObject -Class Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }

    foreach ($disk in $disks) {

        $drive = $disk.DeviceID
        $diskSizeGB = [math]::Round($disk.Size / 1GB, 2)
        $diskFreeSpaceGB = [math]::Round($disk.FreeSpace / 1GB, 2)

        if ($diskFreeSpaceGB -lt 50) {
            $etatPrerequis = "Vous n'avez pas au moins 50 GB de stockage de libre"
            $couleur = $color_Red
        }

        else {
            $etatPrerequis = "Vous avez au moins 50 GB de stockage de libre"
            $couleur = $color_Green
        }

        New-ListViewItem -Type "Stockage" -Information "Volume $drive  $diskSizeGB GB  $diskFreeSpaceGB GB Libre" -Prerequis $etatPrerequis -Couleur $couleur
    }
}

function New-ListViewItem {
    param (
        [Parameter(Mandatory = $true)] $Type,
        [Parameter(Mandatory = $true)] $Information,
        [Parameter(Mandatory = $true)] $Prerequis,
        [Parameter(Mandatory = $true)] $Couleur
    )

    $listViewItem = [ListViewItem]::new($Type)
    [void] $listViewItem.SubItems.Add($Information)
    [void] $listViewItem.SubItems.Add($Prerequis)
    $listViewItem.ForeColor = $Couleur

    [void] $listView_Audit.Items.Add($listViewItem)
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

function Get-OfficeAppsInstalled {
    $apps = Get-WmiObject -Class Win32_Product

    if ($apps | Where-Object Name -Like "Office 16 Click-to-Run*") {
        $radioButtion_MSOffice.ForeColor = $color_Green
    }

    else {
        $radioButtion_MSOffice.ForeColor = $color_Red
    }


    if ($apps | Where-Object Name -Like "LibreOffice*") {
        $radioButtion_LibreOffice.ForeColor = $color_Green
    }

    else {
        $radioButtion_LibreOffice.ForeColor = $color_Red
    }


    if ($apps | Where-Object Name -Like "Openoffice*") {
        $radioButtion_OpenOffice.ForeColor = $color_Green
    }

    else {
        $radioButtion_OpenOffice.ForeColor = $color_Red
    }
}

function Start-CPUZ {
    $pathCPUZ = "$PSScriptRoot\..\Outils\cpuz.exe"
    $process = Start-Process $pathCPUZ -PassThru
    [void] $list_Process.Add($process)
}