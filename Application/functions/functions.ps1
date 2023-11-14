#region<~~Chargement des éléments de l'interface graphique~~>
using namespace System.Windows.Forms
using namespace System.Drawing
using namespace System.Collections
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.Collections
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

function Get-InstalledApps {
    $win32Apps = Get-WmiObject -Class Win32_Product | Select-Object -Property Name
    $registryApps = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName

    foreach ($app in $list_Apps) {
        $search = "*" + $app + "*"

        if (($win32Apps -like $search) -or ($registryApps -like $search)) {
            $value = $true
        }

        else {
            $value = $false
        }

        $key = $app
        [void] $dictionary_Apps.Add($key, $value)
    }
}

function Start-CPUZ {
    $pathCPUZ = "$PSScriptRoot\..\Outils\App CPU-Z\cpuz.exe"
    $process = Start-Process $pathCPUZ -PassThru
    [void] $list_Process.Add($process)
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

function Show-TronArguments {
    $list_Arguments = [ArrayList]::new(@(
        "-a",
        "-asm",
        "-c",
        "-d",
        "-dev",
        "-e",
        "-er",
        "-m",
        "-o",
        "-p",
        "-pmb",
        "-r",
        "-sa",
        "-sac",
        "-sap",
        "-scc",
        "-scs",
        "-sd",
        "-sdb",
        "-sdc",
        "-sdu",
        "-se",
        "-sk",
        "-sm",
        "-sor",
        "-spr",
        "-ss",
        "-str",
        "-swu",
        "-swo",
        "-udl",
        "-v"
    ))

    $list_TronArgumentsDescription = [ArrayList]::new(@(
        "Automatic mode (no prompts; implies -e)",
        "Automatic mode (no prompts; implies -e; reboots to Safe Mode first)",
        "Config dump (show config. Can be used with other switches to see what WOULD happen, but script will never execute if this switch is used)",
        "Dry run (run through script without executing any jobs)",
        "Override OS detection (allow running on unsupported Windows versions)",
        "Accept EULA (suppress disclaimer warning screen)",
        "Email a report when finished. Requires you to configure SwithMailSettings.xml",
        "Preserve OEM Metro apps (don't remove them)",
        "Power off after running (overrides -r)",
        "Preserve power settings (don't reset to Windows default)",
        "Preserve Malwarebytes (don't uninstall it) after Tron is complete",
        "Reboot (auto-reboot 15 seconds after completion)",
        "Skip ALL antivirus scans (AdwCleaner, KVRT, MBAM, SAV)",
        "Skip AdwCleaner scan",
        "Skip application patches (don't patch 7-Zip)",
        "Skip cookie cleanup (not recommended, Tron auto-preserves most common login cookies)",
        "Skip custom scripts (has no effect if you haven't supplied custom scripts)",
        "Skip defrag (force Tron to ALWAYS skip Stage 5 defrag)",
        "Skip de-bloat (entire OEM bloatware removal process; implies -m)",
        "Skip DISM Cleanup (SxS component store deflation)",
        "Skip debloat update. Prevent Tron from auto-updating the S2 debloat lists",
        "Skip Event Log clear (don't backup and clear Windows Event Logs)",
        "Skip Kaspersky Virus Rescue Tool (KVRT) scan",
        "Skip Malwarebytes Anti-Malware (MBAM) installation",
        "Skip OneDrive removal regardless whether it's in use or not",
        "Skip page file settings reset (don't set to 'Let Windows manage the page file')",
        "Skip Sophos Anti-Virus (SAV) scan",
        "Skip Telemetry Removal (just turn off Telemetry instead of removing it)",
        "Skip Windows Updates entirely (ignore both WSUS Offline and online methods)",
        "Skip user-supplied WSUS Offline updates (if they exist; online updates still attempted)",
        "Upload debug logs. Send tron.log and the system GUID dump to the Tron developer",
        "Verbose. Show as much output as possible. NOTE: Significantly slower!"
    ))

    [void] $listView_Netoyage.Columns.Add(" ", 30)
    [void] $listView_Netoyage.Columns.Add("Arguments", 75)
    [void] $listView_Netoyage.Columns.Add("Description", 760)

    $cpt = 0

    foreach ($arg in $list_Arguments) {
        $description = $list_TronArgumentsDescription[$cpt]

        New-ListViewItem -Arg2 $arg -Arg3 $description -ListView $listView_Netoyage

        $cpt += 1
    }

}

function Start-TestTron {
    $tronPath = "$PSScriptRoot\..\Outils\App TRON\tron\tron.bat"

    $list_Arguments = [ArrayList]::new()

    foreach ($item in $listView_Netoyage.Items) {

        if ($item.Checked -eq $true) {
            $arg = $item.SubItems[1].Text
            [void] $list_Arguments.Add($arg)
        }
   }

    $messageBox = [MessageBox]::Show(
        "Attention, pendant l'exécution de TRON, une étape fermera toutes les applications ouvertes.`n Etez-vous sur de vouloir lancer TRON ?",    
        "TRON",
        [MessageBoxButtons]::OKCancel,
        [MessageBoxIcon]::Information
    )

    if ($messageBox -eq "OK") {
        Start-Process -Verb RunAs -FilePath $tronPath -ArgumentList $list_Arguments -Wait
    }
}