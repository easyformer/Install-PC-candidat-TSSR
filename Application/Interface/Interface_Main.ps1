#region<~~Chargement des éléments de l'interface graphique~~>
using namespace System.Windows.Forms
using namespace System.Drawing
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#endregion

#region<~~Interface graphique~~>
    #region<-Form_Main->
    $size                       = [Size]::new(800, 600)
    $form_Main                  = [Form]::new()
    $form_Main.StartPosition    = [FormStartPosition]::CenterScreen
    $form_Main.BackColor        = [Color]::White
    $form_Main.MaximizeBox      = $false
    $form_Main.Size             = $size
    $form_Main.MinimumSize      = $size
    $form_Main.MaximumSize      = $size
    $form_Main.Text             = "Installeur de PC candidat pour le titre TSSR"
    $form_Main.Add_Closing({
        if ($list_Process.Count -ne 0) {
            foreach ($process in $list_Process) {
                $runningProcess = Get-Process | Where-Object Id -EQ $process.Id

                if ($runningProcess.ProcessName -eq $process.ProcessName) {
                    $process.Kill()
                }
            }
        }
    })
    #endregion

    #region<-PictureBox_ImageEF->
    $pictureBox_ImageEF             = [PictureBox]::new()
    $pictureBox_ImageEF.Location    = [Point]::new(10, 30)
    $pictureBox_ImageEF.Size        = [Size]::new(110, 90)
    $pictureBox_ImageEF.Image       = [Image]::FromFile("$PSScriptRoot\..\Assets\logo.png") 
    #endregion

    #region<-Label_Title->
    $label_Title             = [Label]::new()
    $label_Title.Location    = [Point]::new(150, 50)
    $label_Title.Size        = [Size]::new(600, 20)
    $label_Title.ForeColor   = [Color]::FromArgb(0xFF05918A)
    $label_Title.Font        = [Font]::new(
        [FontFamily]::new("Arial"), 
        14, 
        [FontStyle]::Bold
    ) 
    $label_Title.Text        = "Script d'installation de PC candidat pour la plateforme TSSR"
    #endregion

    #region<-Label_SubTitle->
    $label_SubTitle             = [Label]::new()
    $label_SubTitle.Location    = [Point]::new(500, 70)
    $label_SubTitle.Size        = [Size]::new(150, 60)
    $label_SubTitle.ForeColor   = [Color]::FromArgb(0xFF515151)
    $label_SubTitle.Font        = [Font]::new(
        [FontFamily]::new("Arial"), 
        12, 
        [FontStyle]::Italic
    )
    $label_SubTitle.Text        = "By EasyFormer"
    #endregion

    #region<~~--Onglets--~~>
        #region <-TabControl_Onglets->
        $tabControl_Onglets         = [TabControl]::new()
        $tabControl_Onglets.Dock    = [DockStyle]::Fill
        #endregion

        #region<~-Onglet EasyFormer~>
        . "$PSScriptRoot\Onglet_EasyFormer.ps1"
        #endregion<~-Onglet EasyFormer~>
        
        #region<~-Onglet TSSR~>
            . "$PSScriptRoot\Onglet_TSSR.ps1"
        #endregion<~-Onglet TSSR~>
            
        #region<~-Onglet Audit-~>
            . "$PSScriptRoot\Onglet_Audit.ps1"
        #endregion<~-Onglet Audit-~>

        #region<~-Onglet Logiciels-~>
            . "$PSScriptRoot\Onglet_Logiciels.ps1"
        #endregion<~-Onglet Logiciels-~>

        #region<~-Onglet Netoyage-~>
            . "$PSScriptRoot\Onglet_Netoyage.ps1"
        #endregion<~-Onglet Netoyage-~>

        #region<~-Onglet Remerciement-~>
            . "$PSScriptRoot\Onglet_Remerciement.ps1"
        #endregion<~-Onglet Remerciement-~>

        #region<~Controls TabControl_Onglets~>
        $tabControl_Onglets.TabPages.AddRange(@(
            $tabPage_EasyFormer,
            $tabPage_Configuration,
            $tabPage_Audit,
            $tabPage_Logiciels,
            $tabPage_Netoyage,
            $tabPage_Remerciement
        ))
        #endregion
    #endregion<~~--Onglets--~~>

    #region<~Controls Form_Main~>
    $form_Main.Controls.AddRange(@(
        $pictureBox_ImageEF,
        $label_Title,
        $label_SubTitle,
        $tabControl_Onglets
    ))
    #endregion
#endregion<~~Interface graphique~~>