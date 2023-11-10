#region<~~Chargement des éléments de l'interface graphique~~>
using namespace System.Windows.Forms
using namespace System.Drawing
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#endregion

#region<~~Interface graphique~~>
    #region<-Form_Main->
    $form_Main                  = [Form]::new()
    $form_Main.Size             = [Size]::new(800, 600)
    $form_Main.StartPosition    = [FormStartPosition]::CenterScreen
    $form_Main.BackColor        = [Color]::White
    $form_Main.MaximizeBox      = $false
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
        
        #region<~-Onglet Installeur-~>
            #region<-TabPage_Installer->
            $tabPage_Installer              = [TabPage]::new()
            $tabPage_Installer.BackColor    = [Color]::White
            $tabPage_Installer.Text         = "Installeur"
            #endregion

            #region<-Label_Hypervisor->
            $label_Hypervisor           = [Label]::new()
            $label_Hypervisor.Location  = [Point]::new(45, 110)
            $label_Hypervisor.AutoSize  = $true
            $label_Hypervisor.Text      = "Hyperviseur:"
            #endregion

            #region<~-Groupe Hyperviseur-~>
                #region<-GroupBox_Hypervisor->
                $groupBox_Hypervisor            = [GroupBox]::new()
                $groupBox_Hypervisor.Location   = [Point]::new(35, 125)
                $groupBox_Hypervisor.BackColor  = [Color]::FromArgb(0xFFF1F1F1)
                $groupBox_Hypervisor.autosize   = $true
                #endregion

                #region<-RadioButton_HyperV->
                $radioButton_HyperV             = [RadioButton]::new()
                $radioButton_HyperV.Location    = [Point]::new(30, 20)
                $radioButton_HyperV.AutoSize    = $true
                $radioButton_HyperV.Text        = "HYPER V"
                #endregion

                #region<-RadioButton_VirtualBox->
                $radioButton_VirtualBox             = [RadioButton]::new()
                $radioButton_VirtualBox.Location    = [Point]::new(30, 50)
                $radioButton_VirtualBox.AutoSize    = $true
                $radioButton_VirtualBox.Text        = "VIRTUALBOX"
                
                #endregion

                #region<-RadioButton_VMware->
                $radioButton_VMware             = [RadioButton]::new()
                $radioButton_VMware.Location    = [Point]::new(30, 80)
                $radioButton_VMware.AutoSize    = $true
                $radioButton_VMware.Text        = "VMWARE"
                #endregion

                #region<~Controls GroupBox_Hypervisor~>
                $groupBox_Hypervisor.Controls.AddRange(@(
                    $radioButton_HyperV,
                    $radioButton_VirtualBox,
                    $radioButton_VMware
                ))
                #endregion
            #endregion<~-Groupe Hyperviseur-~>

            #region<-Label_Office->
            $officeLabel            = [Label]::new()
            $officeLabel.Location   = [Point]::new(290, 110)
            $officeLabel.AutoSize   = $true
            $officeLabel.Text       = "Office:"
            #endregion

            #region<~-Groupe Office-~>
                #region<-GroupBox_Office->
                $groupBox_Office            = [GroupBox]::new()
                $groupBox_Office.Location   = [Point]::new(280, 125)
                $groupBox_Office.BackColor  = [Color]::FromArgb(0xFFF1F1F1)
                $groupBox_Office.autosize   = $true
                #endregion

                #region<-RadioButtion_MSOffice->
                $radioButtion_MSOffice          = [RadioButton]::new()
                $radioButtion_MSOffice.Location = [Point]::new(30, 20)
                $radioButtion_MSOffice.AutoSize = $true
                $radioButtion_MSOffice.Text     = "Microsoft Office"
                #endregion

                #region<-RadioButtion_LibreOffice->
                $radioButtion_LibreOffice           = [RadioButton]::new()
                $radioButtion_LibreOffice.Location  = [Point]::new(30, 50)
                $radioButtion_LibreOffice.AutoSize  = $true
                $radioButtion_LibreOffice.Text      = "Libre Office"
                #endregion

                #region<-RadioButtion_OpenOffice->
                $radioButtion_OpenOffice            = [RadioButton]::new()
                $radioButtion_OpenOffice.Location   = [Point]::new(30, 80)
                $radioButtion_OpenOffice.AutoSize   = $true
                $radioButtion_OpenOffice.Text       = "Open Office"
                #endregion

                #region<~Controls GroupBox_Office~>
                $groupBox_Office.Controls.AddRange(@(
                    $radioButtion_MSOffice,
                    $radioButtion_LibreOffice,
                    $radioButtion_OpenOffice
                ))
                #endregion
            #endregion<~-Groupe Office-~>

            #region<-Label_Software->
            $label_Software             = [Label]::new()
            $label_Software.Location    = [Point]::new(540, 110)
            $label_Software.autosize    = $true
            $label_Software.Text        = "Logiciels Métiers:"
            #endregion

            #region<~-Groupe Software-~>
                #region<-GroupBox_Software->
                $groupBox_Software              = [GroupBox]::new()
                $groupBox_Software.Location     = [Point]::new(530, 125)
                $groupBox_Software.BackColor    = [Color]::FromArgb(0xFFF1F1F1)
                $groupBox_Software.autosize     = $true
                #endregion

                #region<-CheckBox_Putty->
                $checkBox_Putty             = [CheckBox]::new()
                $checkBox_Putty.Location    = [Point]::new(30, 20)
                $checkBox_Putty.autosize    = $true
                $checkBox_Putty.Text        = "PUTTY"
               
                #endregion
                
                #region<-CheckBox_Acrobat->
                $checkBox_Acrobat           = [CheckBox]::new()
                $checkBox_Acrobat.Location  = [Point]::new(30, 50)
                $checkBox_Acrobat.autosize  = $true
                $checkBox_Acrobat.Text      = "Adobe Acrobat Reader"
                #endregion
                
                #region<-CheckBox_Wireshark->
                $checkBox_Wireshark             = [CheckBox]::new()
                $checkBox_Wireshark.Location    = [Point]::new(30, 80)
                $checkBox_Wireshark.autosize    = $true
                $checkBox_Wireshark.Text        = "Wireshark"
                #endregion

                #region<~Controls GroupBox_Software~>
                $groupBox_Software.Controls.AddRange(@(
                    $checkBox_Putty,
                    $checkBox_Acrobat,
                    $checkBox_Wireshark
                ))
                #endregion
            #endregion<~-Groupe Software-~>

            #region<-Label_Configuration->
            $label_Configuration             = [Label]::new()
            $label_Configuration.Location    = [Point]::new(45, 300)
            $label_Configuration.autosize    = $true
            $label_Configuration.Text        = "Configuration:"
            #endregion

            #region<~-Groupe Configuration-~>
                #region<-GroupBox_Configuration->
                $groupBox_Configuration            = [GroupBox]::new()
                $groupBox_Configuration.Location   = [Point]::new(35, 325)
                $groupBox_Configuration.BackColor  = [Color]::FromArgb(0xFFF1F1F1)
                $groupBox_Configuration.autosize   = $true
                #endregion

                #region<-CheckBox_LocalUser->
                $checkBox_LocalUser             = [CheckBox]::new()
                $checkBox_LocalUser.Location    = [Point]::new(30, 20)
                $checkBox_LocalUser.AutoSize    = $true
                $checkBox_LocalUser.Text        = "Créer le compte candidat"
                #endregion

                #region<-CheckBox_MAJWindows->
                $checkBox_MAJWindows            = [CheckBox]::new()
                $checkBox_MAJWindows.Location   = [Point]::new(30, 50)
                $checkBox_MAJWindows.AutoSize   = $true
                $checkBox_MAJWindows.Text       = "Effectuer les mises à jour Windows"
                #endregion

                #region<-CheckBox_DisableAutoUpdate->
                $checkBox_DisableAutoUpdate             = [CheckBox]::new()
                $checkBox_DisableAutoUpdate.Location    = [Point]::new(30, 80)
                $checkBox_DisableAutoUpdate.AutoSize    = $true
                $checkBox_DisableAutoUpdate.Text        = "Désactiver les mises à jour automatiques"
                #endregion

                #region<~Controls GroupBox_Configuration~>
                $groupBox_Configuration.Controls.AddRange(@(
                    $checkBox_LocalUser,
                    $checkBox_MAJWindows,
                    $checkBox_DisableAutoUpdate
                ))
                #endregion
            #endregion<~-Groupe Configuration-~>

            #region<~Controls TabPage_Installer~>
            $tabPage_Installer.Controls.AddRange(@(
                $label_Hypervisor,
                $groupBox_Hypervisor,
                $officeLabel,
                $groupBox_Office,
                $label_Software,
                $groupBox_Software,
                $label_Configuration,
                $groupBox_Configuration
            ))
            #endregion
        #endregion<~-Onglet Installeur-~>

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

        #region<~-Onglet Netoyage-~>
            #region<-TabPage_Netoyage->
            $tabPage_Netoyage           = [TabPage]::new()
            $tabPage_Netoyage.BackColor = [Color]::White
            $tabPage_Netoyage.Text      = "Netoyage"
            #endregion
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

        #region<~Controls TabControl_Onglets~>
        $tabControl_Onglets.TabPages.AddRange(@(
            $tabPage_Installer,
            $tabPage_Audit,
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