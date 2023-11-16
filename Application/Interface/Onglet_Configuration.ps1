#region<~~Chargement des éléments de l'interface graphique~~>
using namespace System.Windows.Forms
using namespace System.Drawing
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#endregion

#region<~-Onglet Configuration-~>
    #region<-TabPage_Configuration->
    $tabPage_Configuration              = [TabPage]::new()
    $tabPage_Configuration.BackColor    = [Color]::White
    $tabPage_Configuration.Text         = "Configuration"
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

    #region<-Checkbox_Unistall->
    $checkBox_Unistall = [CheckBox]::new()
    $checkBox_Unistall.Location = [Point]::new(35, 255)
    $checkBox_Unistall.AutoSize = $true
    $checkBox_Unistall.Text = "Désinstaller"
    $checkBox_Unistall.Add_CheckStateChanged({
               
    })
    #endregion

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

    #region<~Controls TabPage_Configuration~>
    $tabPage_Configuration.Controls.AddRange(@(
        $label_Hypervisor,
        $groupBox_Hypervisor,
        $checkBox_Unistall,
        $officeLabel,
        $groupBox_Office,
        $label_Software,
        $groupBox_Software,
        $label_Configuration,
        $groupBox_Configuration
    ))
    #endregion
#endregion<~-Onglet Configuration-~>