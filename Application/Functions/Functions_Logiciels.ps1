#region<~~Chargement des éléments de l'interface graphique~~>
using namespace System.Drawing
Add-Type -AssemblyName System.Drawing
#endregion

#region<~~Variables~~>
$color_Black = [Color]::Black
$color_Green = [Color]::Green
$color_Red = [Color]::Red
#endregion

function Get-Chocolatey {
    $chocolatey_IsPresent = Test-Path -Path "C:\ProgramData\chocolatey"

    if ($chocolatey_IsPresent -eq $true) {
        $label_EtatInstallationChocolatey.ForeColor = $color_Green
        $label_EtatInstallationChocolatey.Text = "Installé"

        $button_InstallationChocolatey.Enabled = $false
        $button_Execution.Enabled = $true
        $button_Explication.Enabled = $true
        $listView_Logiciels.Enabled = $true

        $chocolatey_Installation = $true
    }

    elseif ($chocolatey_IsPresent -eq $false) {
        $label_EtatInstallationChocolatey.ForeColor = $color_Red
        $label_EtatInstallationChocolatey.Text = "Non installé"

        $button_InstallationChocolatey.Enabled = $true
        $button_Execution.Enabled = $false
        $button_Explication.Enabled = $false
        $listView_Logiciels.Enabled = $false

        $chocolatey_Installation = $false
    }

    if ($chocolatey_Installation) {
        # retrait de l'erreur de non utilisation de l'IDE
    }
}

function Get-InstalledApps {
    $win32Apps = Get-WmiObject -Class Win32_Product | Select-Object -Property Name
    Start-LoopApps -Apps $win32Apps -List $list_Win32Apps

    $registryApps = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, UninstallString
    Start-LoopApps -Apps $registryApps -List $list_RegistryApps

    if ($chocolatey_Installation -eq $true) {
        $chocoApps = choco list
        Start-LoopApps -Apps $chocoApps -List $list_ChocolateyApps
    }
}

function Start-LoopApps {
    param(
        [parameter(Mandatory = $true)] $Apps, 
        [parameter(Mandatory = $true)] $List 
    )

    foreach ($app in $Apps) {
        [void] $List.Add($app)
    }
}

function Install-Chocolatey {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    Get-Chocolatey
}

function Show-Logiciels {
    $listView_Logiciels.Columns.Clear()
    $listView_Logiciels.Items.Clear()
    
    [void] $listView_Logiciels.Columns.Add(" ", 30)
    [void] $listView_Logiciels.Columns.Add("Nom", 600)
    [void] $listView_Logiciels.Columns.Add("Installé", 100)

    foreach ($app in $list_ObjectApps) {
        $arg2 = $app.Name
        $arg3 = $app.Installed
        New-ListViewItem -Arg2 $arg2 -Arg3 $arg3 -ListView $listView_Logiciels
    }
}

function start-LogicielExecution {
    foreach ($item in $listView_Logiciels) {
        if ($item.Checked -eq $true) {
            if ($item.Arg3 -eq $false) {
                $package = $item.Arg2
                choco install $package -y
            }

            elseif ($item.Arg3 -eq $true) {
                # logique de désinstallation
            }
        }
    }
}

function Update-ListViewLogiciel {
    foreach ($item in $listView_Logiciels.Items) {
        Write-Host $item
        if ($item.Checked -eq $true) {
            if ($item.Arg3 -eq $true) {
                $item.ForeColor = $color_Red
            }

            elseif ($item.Arg3 -eq "False") {
                $item.ForeColor = $color_Green
            }
        }

        elseif ($item.Checked -eq $false) {
            $item.ForeColor = $color_Black
        }
    }
}