#region<~~Chargement des éléments de l'interface graphique~~>
using namespace System.Windows.Forms
using namespace System.Collections
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Collections
#endregion

#region<~~DOT Sourcing des différents fichiers~~>
        #-----Class-----
. "$PSScriptRoot\Class\Class_Obj_App.ps1"

        #-----Functions-----
. "$PSScriptRoot\Functions\Functions_Main.ps1"
. "$PSScriptRoot\Functions\Functions_Netoyage.ps1"
. "$PSScriptRoot\Functions\Functions_Audit.ps1"
. "$PSScriptRoot\Functions\Functions_Logiciels.ps1"
. "$PSScriptRoot\Functions\Functions_Remerciment.ps1"
    
        #------Interfaces-----
. "$PSScriptRoot\Interface\Interface_Main.ps1"
#endregion

#region<~~Variables~~>
$chocolatey_Installation = $null
$list_RegistryApps = [ArrayList]::new()
$list_Win32Apps = [ArrayList]::new()
$list_ChocolateyApps = [ArrayList]::new()
$list_Process = [ArrayList]::new()
$list_ObjectApps = [ArrayList]::new()
#endregion

function Main {
    [void] $list_RegistryApps.Count # retrait de l'erreur de non utilisation de l'IDE
    [void] $list_Win32Apps.Count # retrait de l'erreur de non utilisation de l'IDE
    [void] $list_ChocolateyApps.Count # retrait de l'erreur de non utilisation de l'IDE
    [void] $list_Process.Count # retrait de l'erreur de non utilisation de l'IDE
    [void] $list_ObjectApps.Count # retrait de l'erreur de non utilisation de l'IDE
    if ($chocolatey_Installation) {
        # retrait de l'erreur de non utilisation de l'IDE
    }

    [Application]::EnableVisualStyles()

    Get-InstalledApps

    Get-AuditInfo

    Show-TronArguments

    Get-Chocolatey

    Set-ObjApp

    Show-Logiciels

    Show-Thanks
    
    [void] [Application]::Run($form_Main)
}

Main