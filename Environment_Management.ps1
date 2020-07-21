<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Environment_Management
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Environment_Management          = New-Object system.Windows.Forms.Form
$Environment_Management.ClientSize  = '300,250'
$Environment_Management.text     = "Virtual environment management"
$Environment_Management.TopMost  = $false
$Icon                            = New-Object system.drawing.icon ($PSScriptRoot + "\icons\ikonka_maszyna_środowisko.ico")
$Environment_Management.Icon              = $Icon
$Environment_Management.FormBorderStyle  = 'FixedDialog'

$lb_SelectAction                 = New-Object system.Windows.Forms.Label
$lb_SelectAction.text            = "Select action"
$lb_SelectAction.AutoSize        = $true
$lb_SelectAction.width           = 25
$lb_SelectAction.height          = 10
$lb_SelectAction.location        = New-Object System.Drawing.Point(10,10)
$lb_SelectAction.Font            = 'Microsoft Sans Serif,12'

$btn_NewVM                       = New-Object system.Windows.Forms.Button
$btn_NewVM.text                  = "New forest"
$btn_NewVM.width                 = 280
$btn_NewVM.height                = 40
$btn_NewVM.location              = New-Object System.Drawing.Point(10,36)
$btn_NewVM.Font                  = 'Microsoft Sans Serif,12'

$btn_PromoteToDC                 = New-Object system.Windows.Forms.Button
$btn_PromoteToDC.text            = "Promote a virtual machine to DC"
$btn_PromoteToDC.width           = 280
$btn_PromoteToDC.height          = 40
$btn_PromoteToDC.location        = New-Object System.Drawing.Point(10,86)
$btn_PromoteToDC.Font            = 'Microsoft Sans Serif,12'

$btn_AddToDomain                 = New-Object system.Windows.Forms.Button
$btn_AddToDomain.text            = "Add a virtual machine to a domain"
$btn_AddToDomain.width           = 280
$btn_AddToDomain.height          = 40
$btn_AddToDomain.location        = New-Object System.Drawing.Point(10,136)
$btn_AddToDomain.Font            = 'Microsoft Sans Serif,12'

$btn_Exit                        = New-Object system.Windows.Forms.Button
$btn_Exit.text                   = "Exit"
$btn_Exit.width                  = 280
$btn_Exit.height                 = 40
$btn_Exit.location               = New-Object System.Drawing.Point(10,186)
$btn_Exit.Font                   = 'Microsoft Sans Serif,12'

$Environment_Management.controls.AddRange(@($lb_SelectAction,$btn_NewVM,$btn_PromoteToDC,$btn_AddToDomain,$btn_Exit))

#exit
$btn_Exit.Add_Click({
   $Environment_Management.Close()
})

#new_forest
$btn_NewVM.Add_Click({
    $path = $PSScriptRoot + "\environment\New_Forest.ps1"
    & $path
})

#new_forest
$btn_PromoteToDC.Add_Click({
    $path = $PSScriptRoot + "\environment\Promote_to_DC.ps1"
    & $path
})

#add_to_domain
$btn_AddToDomain.Add_Click({
    $path = $PSScriptRoot + "\environment\Add_VM_to_domain.ps1"
    & $path
})

$Environment_Management.ShowDialog()

