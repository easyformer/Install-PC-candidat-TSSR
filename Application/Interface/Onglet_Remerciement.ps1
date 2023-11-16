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

    #region<-Label_Remerciement->
    $label_Remerciement          = [Label]::new()
    $label_Remerciement.Location = [Point]::new(20, 120)
    $label_Remerciement.Size     = [Size]::new(200, 20)
    $label_Remerciement.Text     = "Merci d'utiliser notre application !"
    #endregion

    #region<-Label_Remerciement_Location->
    $label_Remerciement_Location            = [Label]::new()
    $label_Remerciement_Location.Location   = [Point]::new(220, 120)
    $label_Remerciement_Location.Size       = [Size]::new(500, 260)
    $label_Remerciement_Location.ForeColor  = [Color]::FromArgb(0xFF515151)
    $label_Remerciement_Location.Font       = [Font]::new("Arial", 14, [FontStyle]::Bold)
    $label_Remerciement_Location.Text       = "Pour louer des plateformes pédagogiques n'hésitez pas à contacter EasyFormer :`n`n Easyformer`n 12 rue des Violettes`n 95000 CERGY `n https://www.easyformer.fr/ `n `n Alex FALZON `n afalzon@easyformer.fr `n 06 26 05 35 83 `n "
    #endregion

    #region<-Label_Remerciement_Contributeurs->
    $label_Remerciement_Contributeurs           = [Label]::new()
    $label_Remerciement_Contributeurs.Location  = [Point]::new(50, 420)
    $label_Remerciement_Contributeurs.Size      = [Size]::new(600, 400)
    $label_Remerciement_Contributeurs.Text      = "Merci à tout les généreux contributeurs:`n`nAlex FALZON, Zaide Flanders, Christophe Tabary, Guillaume Cluzel, Louis Lemerle, Haymadou Nemaga, Abdessalem BENAROUS, Houdaifa Guemour, Abdelhamid MEDIOUNA, Radouane KHAIZ, Mohand ALIOUCHE, Stan AKE, Reaksmey CHIA, Joseph ABENGOYAP AKAME, Samuel POULADE, Yuanyuan Wensia MBOUKOU MAYELA"
    #endregion

    #region<~Controls TabPage_Remerciement~>
    $tabPage_Remerciement.Controls.AddRange(@(
        $label_Remerciement,
        $label_Remerciement_Location,
        $label_Remerciement_Contributeurs
    ))
    #endregion
#endregion<~-Onglet Remerciement-~>