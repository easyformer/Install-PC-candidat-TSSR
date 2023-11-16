#region<~~Chargement des éléments de l'interface graphique~~>
using namespace System.Drawing
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

    New-ListViewItem -Arg1 "RAM" -Arg2 "$ramCapacityGB GB" -Arg3 $etatPrerequis -Couleur $couleur -ListView $listView_Audit
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

    New-ListViewItem -Arg1 "OS" -Arg2 "$name $version" -Arg3 $etatPrerequis -Couleur $couleur -ListView $listView_Audit
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

    New-ListViewItem -Arg1 "Processeur" -Arg2 "$name  $cores coeurs" -Arg3 $etatPrerequis -Couleur $couleur -ListView $listView_Audit
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

        New-ListViewItem -Arg1 "Stockage" -Arg2 "Volume $drive  $diskSizeGB GB  $diskFreeSpaceGB GB Libre" -Arg3 $etatPrerequis -Couleur $couleur -ListView $listView_Audit
    }
}

function Start-CPUZ {
    $pathCPUZ = "$PSScriptRoot\..\Outils\App CPU-Z\cpuz.exe"
    $process = Start-Process $pathCPUZ -PassThru
    [void] $list_Process.Add($process)
}