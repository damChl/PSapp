<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Delete_VHD
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Delete_VHD                      = New-Object system.Windows.Forms.Form
$Delete_VHD.ClientSize           = '550,200'
$Delete_VHD.text                 = "Delete a virtual disk"
$Delete_VHD.TopMost              = $false
$Icon                            = New-Object system.drawing.icon ($PSScriptRoot + "\icons\ikonka_dysk.ico")
$Delete_VHD.Icon                 = $Icon
$Delete_VHD.FormBorderStyle  = 'FixedDialog'
 
$lb_ChooseDisk                   = New-Object system.Windows.Forms.Label
$lb_ChooseDisk.text              = "Choose disk to delete"
$lb_ChooseDisk.AutoSize          = $true
$lb_ChooseDisk.width             = 25
$lb_ChooseDisk.height            = 10
$lb_ChooseDisk.location          = New-Object System.Drawing.Point(10,10)
$lb_ChooseDisk.Font              = 'Microsoft Sans Serif,12'

$txtb_Disk                       = New-Object system.Windows.Forms.TextBox
$txtb_Disk.multiline             = $false
$txtb_Disk.width                 = 380
$txtb_Disk.height                = 20
$txtb_Disk.location              = New-Object System.Drawing.Point(10,36)
$txtb_Disk.Font                  = 'Microsoft Sans Serif,10'

$btn_Browse                      = New-Object system.Windows.Forms.Button
$btn_Browse.text                 = "Browse..."
$btn_Browse.width                = 70
$btn_Browse.height               = 30
$btn_Browse.location             = New-Object System.Drawing.Point(400,31)
$btn_Browse.Font                 = 'Microsoft Sans Serif,10'

$btn_DeleteVHD                   = New-Object system.Windows.Forms.Button
$btn_DeleteVHD.text              = "Delete"
$btn_DeleteVHD.width             = 90
$btn_DeleteVHD.height            = 50
$btn_DeleteVHD.location          = New-Object System.Drawing.Point(450,140)
$btn_DeleteVHD.Font              = 'Microsoft Sans Serif,12,style=Bold'

$Delete_VHD.controls.AddRange(@($lb_ChooseDisk,$txtb_Disk,$btn_Browse,$btn_DeleteVHD))

#button_parent
$btn_Browse.Add_Click({
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
    InitialDirectory = [Environment]::GetFolderPath('Desktop') 
    Filter = 'Disk (*.vhdx)|*.vhdx|Disk (*.vhd)|*.vhd'
    }
[void]$FileBrowser.ShowDialog()
$txtb_Disk.Text = $FileBrowser.Filename
})

$btn_DeleteVHD.Add_Click({
    $path = $txtb_Disk.Text

    If (!(test-path $path)){
        [System.Windows.Forms.MessageBox]::Show("Doesn't exsist", 'Attention', 'OK', 'Error')
        Return
        }
    
    if (Test-Path -Path $path -Include *.vhdx, *.vhd){
    Remove-Item –path $path
    }
    else {
    [System.Windows.Forms.MessageBox]::Show("Its's not a disk", 'Attention', 'OK', 'Error')
    Return
    }


    [System.Windows.Forms.MessageBox]::Show("Disk has been deleted", 'Attention', 'OK', 'Information')
})

$Delete_VHD.ShowDialog()