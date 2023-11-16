#region<~~Chargement des éléments de l'interface graphique~~>
using namespace System.Windows.Forms
using namespace System.Drawing
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#endregion

#region<~-Onglet Audit-~>
    #region<-TabPage_Audit->
    $tabPage_Audit           = [TabPage]::new()
    $tabPage_Audit.BackColor = [Color]::White
    $tabPage_Audit.Text      = "Audit"
    #endregion

    #region<-Label_Audit->
    $label_Audit             = [Label]::new()
    $label_Audit.Location    = [Point]::new(220, 120)
    $label_Audit.Size        = [Size]::new(600, 20)
    $label_Audit.ForeColor   = [Color]::FromArgb(0xFF05918A)
    $label_Audit.Font        = [Font]::new(
        [FontFamily]::new("Arial"), 
        12, 
        [FontStyle]::Bold
    )
    $label_Audit.Text        = "Audit de conformité Matérielle et logicielle"
    #endregion

    #region<-Button_CPUZ->
    $button_CPUZ            = [Button]::new()
    $button_CPUZ.Location   = [Point]::new(690, 145)
    $button_CPUZ.Size       = [Size]::new(75, 25)
    $button_CPUZ.Text       = "CPU-Z *"
    $button_CPUZ.Add_Click({
        Start-CPUZ
    })
    #endregion

    #region<-ListView_Audit->
    $listView_Audit           = [ListView]::new()
    $listView_Audit.Location  = [Point]::new(10, 175)
    $listView_Audit.Size      = [Size]::new(755, 340)
    $listView_Audit.View      = [View]::Details
    #endregion

    #region<-Label_DetailsCPUZ->
    $label_DetailsCPUZ          = [Label]::new()
    $label_DetailsCPUZ.Location = [Point]::new(10, 520)
    $label_DetailsCPUZ.Size     = [Size]::new(400, 20)
    $label_DetailsCPUZ.Font     = [Font]::new(
        [FontFamily]::new('Arial'),
        8,
        [FontStyle]::Italic
    )
    $label_DetailsCPUZ.Text = "* CPU-Z est un logiciel donnant plus d'information sur le matèriel de la machine"
    #endregion

    #region<~Controls TabPage_Audit~>
    $tabPage_Audit.Controls.AddRange(@(
        $label_Audit,
        $button_CPUZ,
        $listView_Audit,
        $label_DetailsCPUZ
    ))
    #endregion
#endregion<~-Onglet Audit-~>