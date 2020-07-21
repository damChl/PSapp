<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    VHD_Management
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$VDisk_Management                = New-Object system.Windows.Forms.Form
$VDisk_Management.ClientSize     = '300,250'
$VDisk_Management.text           = "Virtual disk management"
$VDisk_Management.TopMost        = $false
$Icon                            = New-Object system.drawing.icon ($PSScriptRoot + "\icons\ikonka_dysk.ico")
$VDisk_Management.Icon           = $Icon
$VDisk_Management.FormBorderStyle  = 'FixedDialog'

$lb_SelectAction                 = New-Object system.Windows.Forms.Label
$lb_SelectAction.text            = "Select action"
$lb_SelectAction.AutoSize        = $true
$lb_SelectAction.width           = 25
$lb_SelectAction.height          = 10
$lb_SelectAction.location        = New-Object System.Drawing.Point(10,10)
$lb_SelectAction.Font            = 'Microsoft Sans Serif,12'

$btn_CreateDisk                  = New-Object system.Windows.Forms.Button
$btn_CreateDisk.text             = "Create a new virtual disk "
$btn_CreateDisk.width            = 280
$btn_CreateDisk.height           = 40
$btn_CreateDisk.location         = New-Object System.Drawing.Point(10,36)
$btn_CreateDisk.Font             = 'Microsoft Sans Serif,12'

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Create a new virtual disk from template"
$Button1.width                   = 280
$Button1.height                  = 40
$Button1.location                = New-Object System.Drawing.Point(10,86)
$Button1.Font                    = 'Microsoft Sans Serif,11'

$btn_DeleteVHD                   = New-Object system.Windows.Forms.Button
$btn_DeleteVHD.text              = "Delete a virtual disk "
$btn_DeleteVHD.width             = 280
$btn_DeleteVHD.height            = 40
$btn_DeleteVHD.location          = New-Object System.Drawing.Point(10,136)
$btn_DeleteVHD.Font              = 'Microsoft Sans Serif,12'

$btn_Exit                        = New-Object system.Windows.Forms.Button
$btn_Exit.text                   = "Exit"
$btn_Exit.width                  = 280
$btn_Exit.height                 = 40
$btn_Exit.location               = New-Object System.Drawing.Point(10,186)
$btn_Exit.Font                   = 'Microsoft Sans Serif,12'

$VDisk_Management.controls.AddRange(@($lb_SelectAction,$btn_CreateDisk,$Button1,$btn_DeleteVHD,$btn_Exit))

#virtual_disk
$btn_CreateDisk.Add_Click({
    $path = $PSScriptRoot + "\VHD\New_PlainVHD.ps1"
    & $path
})

#virtual_disk_from_template
$Button1.Add_Click({
    $path = $PSScriptRoot + "\VHD\New_VHD_From_Template.ps1"
    & $path
})

#delete_virtual_disk
$btn_DeleteVHD.Add_Click({
    $path = $PSScriptRoot + "\VHD\Delete_VHD.ps1"
    & $path
})

$btn_Exit.Add_Click({
   $VDisk_Management.Close()
})

$VDisk_Management.ShowDialog()