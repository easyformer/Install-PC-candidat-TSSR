#region<~~Chargement des éléments de l'interface graphique~~>
using namespace System.Windows.Forms
using namespace System.Drawing
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#endregion

#region<~-Onglet Netoyage-~>
    #region<-TabPage_Netoyage->
    $tabPage_Netoyage           = [TabPage]::new()
    $tabPage_Netoyage.BackColor = [Color]::White
    $tabPage_Netoyage.Text      = "Netoyage"
    #endregion

    #region<-Button_Tron->
    $button_Tron            = [Button]::new()
    $button_Tron.Location   = [Point]::new(350, 145)
    $button_Tron.Size       = [Size]::new(95, 25)
    $button_Tron.Text       = "Lancer TRON *"
    $button_Tron.Add_Click({
        Start-Tron
    })
    #endregion

    #region<-Button_PlusInformation->
    $button_PlusInformation            = [Button]::new()
    $button_PlusInformation.Location   = [Point]::new(455, 145)
    $button_PlusInformation.Size       = [Size]::new(150, 25)
    $button_PlusInformation.Text       = "Plus d'informations..."
    $button_PlusInformation.Add_Click({
        Start-Process -Path "https://www.tech2tech.fr/tronscript-le-script-ultime-pour-desinfecter-un-pc-sous-windows/"
    })
    #endregion

    #region<-Button_InformationDetails->
    $button_InformationDetails            = [Button]::new()
    $button_InformationDetails.Location   = [Point]::new(615, 145)
    $button_InformationDetails.Size       = [Size]::new(150, 25)
    $button_InformationDetails.Text       = "Informations détaillées"
    $button_InformationDetails.Add_Click({
        Start-Process -Path "https://github.com/bmrf/tron/blob/master/README.md#full-tron-description"
    })
    #endregion

    #region<-ListView_Netoyage->
    $listView_Netoyage              = [ListView]::new()
    $listView_Netoyage.Location     = [Point]::new(10, 175)
    $listView_Netoyage.Size         = [Size]::new(755, 340)
    $listView_Netoyage.View         = [View]::Details
    $listView_Netoyage.CheckBoxes   = $true
    #endregion

    #region<-Label_DetailsTron->
    $label_DetailsTron          = [Label]::new()
    $label_DetailsTron.Location = [Point]::new(10, 520)
    $label_DetailsTron.Size     = [Size]::new(600, 20)
    $label_DetailsTron.Font     = [Font]::new(
        [FontFamily]::new('Arial'),
        8,
        [FontStyle]::Italic
    )
    $label_DetailsTron.Text = "* TRON est un logiciel de débogage, de maintenance et d'optimisation pour systèmes Windows"
    #endregion
            
    #region<~Controls TabPage_Netoyage~>
    $tabPage_Netoyage.Controls.AddRange(@(
        $button_Tron,
        $button_PlusInformation,
        $button_InformationDetails,
        $listView_Netoyage,
        $label_DetailsTron
    ))
    #endregion
#endregion<~-Onglet Netoyage-~>