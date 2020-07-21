<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    VM_Management
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$VM_Management                   = New-Object system.Windows.Forms.Form
$VM_Management.ClientSize        = '300,250'
$VM_Management.text              = "Virtual machine management"
$VM_Management.TopMost           = $false
$Icon                            = New-Object system.drawing.icon ($PSScriptRoot + "\icons\ikonka_maszyna_środowisko.ico")
$VM_Management.Icon           = $Icon
$VM_Management.FormBorderStyle  = 'FixedDialog'

$lb_SelectAction                 = New-Object system.Windows.Forms.Label
$lb_SelectAction.text            = "Select action"
$lb_SelectAction.AutoSize        = $true
$lb_SelectAction.width           = 25
$lb_SelectAction.height          = 10
$lb_SelectAction.location        = New-Object System.Drawing.Point(10,10)
$lb_SelectAction.Font            = 'Microsoft Sans Serif,12'

$btn_NewVM                       = New-Object system.Windows.Forms.Button
$btn_NewVM.text                  = "New virtual machine"
$btn_NewVM.width                 = 280
$btn_NewVM.height                = 40
$btn_NewVM.location              = New-Object System.Drawing.Point(10,36)
$btn_NewVM.Font                  = 'Microsoft Sans Serif,12'

$btn_NewVMFromTemplate           = New-Object system.Windows.Forms.Button
$btn_NewVMFromTemplate.text      = "New virtual machine from a template"
$btn_NewVMFromTemplate.width     = 280
$btn_NewVMFromTemplate.height    = 40
$btn_NewVMFromTemplate.location  = New-Object System.Drawing.Point(10,86)
$btn_NewVMFromTemplate.Font      = 'Microsoft Sans Serif,11'

$btn_DeleteVM                    = New-Object system.Windows.Forms.Button
$btn_DeleteVM.text               = "Delete a virtual machine"
$btn_DeleteVM.width              = 280
$btn_DeleteVM.height             = 40
$btn_DeleteVM.location           = New-Object System.Drawing.Point(10,136)
$btn_DeleteVM.Font               = 'Microsoft Sans Serif,12'

$btn_Exit                        = New-Object system.Windows.Forms.Button
$btn_Exit.text                   = "Exit"
$btn_Exit.width                  = 280
$btn_Exit.height                 = 40
$btn_Exit.location               = New-Object System.Drawing.Point(10,186)
$btn_Exit.Font                   = 'Microsoft Sans Serif,12'

$VM_Management.controls.AddRange(@($lb_SelectAction,$btn_NewVM,$btn_NewVMFromTemplate,$btn_DeleteVM,$btn_Exit))

#new_virtual_machine
$btn_NewVm.Add_Click({
    $path = $PSScriptRoot + "\VM\New_Plain_VM.ps1"
    & $path
})

#virtual_machine_from_template
$btn_NewVMFromTemplate.Add_Click({
    $path = $PSScriptRoot + "\VM\New_VM_From_Template.ps1"
    & $path
})


#deltete_virtual_machine
$btn_DeleteVM.Add_Click({
    $path = $PSScriptRoot + "\VM\Delete_VM.ps1"
    & $path
})

#exit
$btn_Exit.Add_Click({
   $VM_Management.Close()
})

$VM_Management.ShowDialog()

