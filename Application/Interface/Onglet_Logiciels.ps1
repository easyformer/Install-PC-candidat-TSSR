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

    #region<~Controls TabPage_Logiciels~>
    $tabPage_Logiciels.Controls.AddRange(@(

    ))
    #endregion
#endregion<~-Onglet Logiciels-~>