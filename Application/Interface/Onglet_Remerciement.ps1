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

    #region<-Label_Remerciement_Contributeurs->
    $label_Remerciement_Contributeurs           = [Label]::new()
    $label_Remerciement_Contributeurs.Location  = [Point]::new(50, 420)
    $label_Remerciement_Contributeurs.Size      = [Size]::new(600, 400)
    $label_Remerciement_Contributeurs.Text      = "Merci à tout les généreux contributeurs:`n`nAlex FALZON, Zaide Flanders, Christophe Tabary, Guillaume Cluzel, Louis Lemerle, Haymadou Nemaga, Abdessalem BENAROUS, Houdaifa Guemour, Abdelhamid MEDIOUNA, Radouane KHAIZ, Mohand ALIOUCHE, Stan AKE, Reaksmey CHIA, Joseph ABENGOYAP AKAME, Samuel POULADE, Yuanyuan Wensia MBOUKOU MAYELA"
    #endregion

    #region<~Controls TabPage_Remerciement~>
    $tabPage_Remerciement.Controls.AddRange(@(
        $label_Remerciement_Contributeurs
    ))
    #endregion
#endregion<~-Onglet Remerciement-~>