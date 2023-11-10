#region<~~Chargement des éléments de l'interface graphique~~>
using namespace System.Windows.Forms
using namespace System.Collections
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Collections
#endregion

#region<~~DOT Sourcing des différents fichiers~~>
. "$PSScriptRoot\functions\functions.ps1"
. "$PSScriptRoot\Interface\Interface.ps1"
#endregion

#region<~~Variables~~>
$list_Process = [ArrayList]::new()
#endregion

function Main {
    $list_Process.Clear() # retrait de l'erreur de non utilisation de l'IDE

    [Application]::EnableVisualStyles()

    Get-OfficeAppsInstalled

    Get-AuditInfo
    
    [void] [Application]::Run($form_Main)
}

Main