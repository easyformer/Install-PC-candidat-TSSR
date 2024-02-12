#region<~~Chargement des éléments de l'interface graphique~~>
using namespace System.Windows.Forms
using namespace System.Drawing
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#endregion

#region<~-Onglet Logiciels-~>
    #region<-TabPage_Logiciels->
    $tabPage_Logiciels           = [TabPage]::new()
    $tabPage_Logiciels.BackColor = [Color]::White
    $tabPage_Logiciels.Text      = "Logiciels"
    #endregion

    #region<-Label_MessageInstallationChocolatey->
    $label_MessageInstallationChocolatey            = [Label]::new()
    $label_MessageInstallationChocolatey.Location   = [Point]::new(10, 150)
    $label_MessageInstallationChocolatey.Size       = [Size]::new(175, 20)
    $label_MessageInstallationChocolatey.Text       = "Etat installation de chocolatey :"
    #endregion

    #region<-Label_EtatInstalationChocolatey->
    $label_EtatInstallationChocolatey           = [Label]::new()
    $label_EtatInstallationChocolatey.Location  = [Point]::new(185, 150)
    $label_EtatInstallationChocolatey.Size      = [Size]::new(100, 20)
    #endregion

    #region<-Button_InstallationChocolatey->
    $button_InstallationChocolatey            = [Button]::new()
    $button_InstallationChocolatey.Location   = [Point]::new(300, 145)
    $button_InstallationChocolatey.Size       = [Size]::new(125, 25)
    $button_InstallationChocolatey.Enabled    = $false
    $button_InstallationChocolatey.Text       = "Installer Chocolatey"
    $button_InstallationChocolatey.Add_Click({
        Install-Chocolatey
    })

    #region<-Button_Execution->
    $button_Execution            = [Button]::new()
    $button_Execution.Location   = [Point]::new(435, 145)
    $button_Execution.Size       = [Size]::new(80, 25)
    $button_Execution.Text       = "Exécution"
    $button_Execution.Enabled    = $false
    $button_Execution.Add_Click({
        start-LogicielExecution
    })
    #endregion

    #region<-Button_Explication->
    $button_Explication            = [Button]::new()
    $button_Explication.Location   = [Point]::new(525, 145)
    $button_Explication.Size       = [Size]::new(80, 25)
    $button_Explication.Text       = "Explications"
    $button_Explication.Enabled    = $false
    $button_Explication.Add_Click({
        
    })
    #endregion

    #region<-Button_InformationChocolatey->
    $button_InformationChocolatey            = [Button]::new()
    $button_InformationChocolatey.Location   = [Point]::new(615, 145)
    $button_InformationChocolatey.Size       = [Size]::new(150, 25)
    $button_InformationChocolatey.Text       = "A propos de Chocolatey"
    $button_InformationChocolatey.Add_Click({
        Start-Process -Path "https://chocolatey.org/why-chocolatey"
    })
    #endregion

    #region<-ListView_Logiciels->
    $listView_Logiciels              = [ListView]::new()
    $listView_Logiciels.Location     = [Point]::new(10, 175)
    $listView_Logiciels.Size         = [Size]::new(755, 340)
    $listView_Logiciels.View         = [View]::Details
    $listView_Logiciels.CheckBoxes   = $true
    $listView_Logiciels.Enabled      = $false
    $listView_Logiciels.Add_ItemCheck({
        Update-ListViewLogiciel
    }) 
    #endregion

    #region<-Label_DetailsChocolatey->
    $label_DetailsChocolatey          = [Label]::new()
    $label_DetailsChocolatey.Location = [Point]::new(10, 520)
    $label_DetailsChocolatey.Size     = [Size]::new(600, 20)
    $label_DetailsChocolatey.Font     = [Font]::new(
        [FontFamily]::new('Arial'),
        8,
        [FontStyle]::Italic
    )
    $label_DetailsChocolatey.Text = "L'installation des logiciels se base sur Chocolatey"
    #endregion

    #region<~Controls TabPage_Logiciels~>
    $tabPage_Logiciels.Controls.AddRange(@(
        $label_MessageInstallationChocolatey,
        $label_EtatInstallationChocolatey,
        $button_InstallationChocolatey,
        $button_Execution,
        $button_Explication,
        $button_InformationChocolatey,
        $listView_Logiciels,
        $label_DetailsChocolatey
    ))
    #endregion
#endregion<~-Onglet Logiciels-~>