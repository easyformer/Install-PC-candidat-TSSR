#region<~~Chargement des éléments de l'interface graphique~~>
using namespace System.Collections
Add-Type -AssemblyName System.Collections
#endregion

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

function Start-Tron {
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