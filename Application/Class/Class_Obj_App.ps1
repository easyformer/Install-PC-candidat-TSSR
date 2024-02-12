Class obj_App {
    [string] $Name
    [string] $ChocolateyName
    [string] $Installed
    [string] $InstallType
    [string] $UnistallString

    obj_App([string] $in_Name, [string] $in_ChocolateyName, [string] $in_Installed) {
        $this.Name = $in_Name
        $this.ChocolateyName = $in_ChocolateyName
        $this.Installed = $in_Installed
        $this.InstallType = $null
        $this.UnistallString = $null
    }
}