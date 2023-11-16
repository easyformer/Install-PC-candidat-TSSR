#region<~-Onglet Netoyage-~>
    #region<-TabPage_Netoyage->
    $tabPage_Netoyage           = [TabPage]::new()
    $tabPage_Netoyage.BackColor = [Color]::White
    $tabPage_Netoyage.Text      = "Netoyage"
    #endregion

    #region<-Button_Tron->
    $button_Tron            = [Button]::new()
    $button_Tron.Location   = [Point]::new(670, 145)
    $button_Tron.Size       = [Size]::new(95, 25)
    $button_Tron.Text       = "Lancer TRON *"
    $button_Tron.Add_Click({
        Start-TestTron
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
        $listView_Netoyage,
        $label_DetailsTron
    ))
    #endregion
#endregion<~-Onglet Netoyage-~>