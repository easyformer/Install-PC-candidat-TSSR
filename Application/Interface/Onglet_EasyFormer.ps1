#region<~~Chargement des éléments de l'interface graphique~~>
using namespace System.Windows.Forms
using namespace System.Drawing
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#endregion

#region<~-Onglet EasyFormer-~>
    #region<-TabPage_EasyFormer->
    $tabPage_EasyFormer            = [TabPage]::new()
    $tabPage_EasyFormer.BackColor  = [Color]::White
    $tabPage_EasyFormer.Text      = "EasyFormer"
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

    #region<~Controls TabPage_EasyFormer~>
    $tabPage_EasyFormer.Controls.AddRange(@(
        $label_Remerciement,
        $label_Remerciement_Location
    ))
    #endregion
#endregion<~-Onglet EasyFormer-~>