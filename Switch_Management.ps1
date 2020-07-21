<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Switch_Management
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Switch_Management               = New-Object system.Windows.Forms.Form
$Switch_Management.ClientSize    = '300,250'
$Switch_Management.text          = "Switch management"
$Switch_Management.TopMost       = $false
$Icon                            = New-Object system.drawing.icon ($PSScriptRoot + "\icons\ikonka_switch.ico")
$Switch_Management.Icon              = $Icon
$Switch_Management.FormBorderStyle  = 'FixedDialog'

$lb_SelectAction                 = New-Object system.Windows.Forms.Label
$lb_SelectAction.text            = "Select action"
$lb_SelectAction.AutoSize        = $true
$lb_SelectAction.width           = 25
$lb_SelectAction.height          = 10
$lb_SelectAction.location        = New-Object System.Drawing.Point(10,10)
$lb_SelectAction.Font            = 'Microsoft Sans Serif,12'

$btn_CreateSwitch                = New-Object system.Windows.Forms.Button
$btn_CreateSwitch.text           = "Create a new switch"
$btn_CreateSwitch.width          = 280
$btn_CreateSwitch.height         = 40
$btn_CreateSwitch.location       = New-Object System.Drawing.Point(10,50)
$btn_CreateSwitch.Font           = 'Microsoft Sans Serif,12'

$btn_DeleteSwitch                = New-Object system.Windows.Forms.Button
$btn_DeleteSwitch.text           = "Delete a switch"
$btn_DeleteSwitch.width          = 280
$btn_DeleteSwitch.height         = 40
$btn_DeleteSwitch.location       = New-Object System.Drawing.Point(10,110)
$btn_DeleteSwitch.Font           = 'Microsoft Sans Serif,12'

$btn_Exit                        = New-Object system.Windows.Forms.Button
$btn_Exit.text                   = "Exit"
$btn_Exit.width                  = 280
$btn_Exit.height                 = 40
$btn_Exit.location               = New-Object System.Drawing.Point(10,170)
$btn_Exit.Font                   = 'Microsoft Sans Serif,12'

$Switch_Management.controls.AddRange(@($lb_SelectAction,$btn_CreateSwitch,$btn_DeleteSwitch,$btn_Exit))

#new_virtual_switch
$btn_CreateSwitch.Add_Click({
    $path = $PSScriptRoot + "\switch\New_Virtual_Switch.ps1"
    & $path
})

#delete_virtual_switch
$btn_DeleteSwitch.Add_Click({
    $path = $PSScriptRoot + "\switch\Delete_Switch.ps1"
    & $path
})

#exit
$btn_Exit.Add_Click({
   $Switch_Management.Close()
})

$Switch_Management.ShowDialog()

