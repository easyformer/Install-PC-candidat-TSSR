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