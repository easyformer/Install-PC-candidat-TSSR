#region<~~Chargement des éléments de l'interface graphique~~>
using namespace System.Windows.Forms
using namespace System.Drawing
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#endregion

#region<~-Onglet Remerciement-~>
    #region<-TabPage_Remerciement->
    $tabPage_Remerciement            = [TabPage]::new()
    $tabPage_Remerciement.BackColor  = [Color]::White
    $tabPage_Remerciement.Text      = "Remerciement"
    #endregion

    #region<-ListView_Netoyage->
    $listView_Remerciement              = [ListView]::new()
    $listView_Remerciement.Location     = [Point]::new(10, 175)
    $listView_Remerciement.Size         = [Size]::new(755, 340)
    $listView_Remerciement.View         = [View]::Details
    #endregion

    #region<-Label_Remerciement_Contributeurs->
    $label_Remerciement_Contributeurs           = [Label]::new()
    $label_Remerciement_Contributeurs.Location  = [Point]::new(10, 145)
    $label_Remerciement_Contributeurs.Size      = [Size]::new(250, 20)
    $label_Remerciement_Contributeurs.Text      = "Merci à tout les généreux contributeurs :"
    #endregion

    #region<~Controls TabPage_Remerciement~>
    $tabPage_Remerciement.Controls.AddRange(@(
        $listView_Remerciement,
        $label_Remerciement_Contributeurs
    ))
    #endregion
#endregion<~-Onglet Remerciement-~>