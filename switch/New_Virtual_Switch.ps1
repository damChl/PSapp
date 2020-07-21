<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    New_Virtual_Switch
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$New_Switch_Form                 = New-Object system.Windows.Forms.Form
$New_Switch_Form.ClientSize      = '550,350'
$New_Switch_Form.text            = "New virtual switch"
$New_Switch_Form.TopMost         = $false
$Icon                            = New-Object system.drawing.icon ($PSScriptRoot + "\icons\ikonka_switch.ico")
$New_Switch_Form.Icon            = $Icon
$New_Switch_Form.FormBorderStyle  = 'FixedDialog'

$lb_SwitchType                   = New-Object system.Windows.Forms.Label
$lb_SwitchType.text              = "Select type of the switch"
$lb_SwitchType.AutoSize          = $true
$lb_SwitchType.width             = 25
$lb_SwitchType.height            = 10
$lb_SwitchType.location          = New-Object System.Drawing.Point(10,10)
$lb_SwitchType.Font              = 'Microsoft Sans Serif,12'

$pnl_SwitchTypes                 = New-Object system.Windows.Forms.Panel
$pnl_SwitchTypes.height          = 30
$pnl_SwitchTypes.width           = 270
$pnl_SwitchTypes.location        = New-Object System.Drawing.Point(5,30)

$rdbtn_Private                   = New-Object system.Windows.Forms.RadioButton
$rdbtn_Private.text              = "Private"
$rdbtn_Private.AutoSize          = $true
$rdbtn_Private.width             = 90
$rdbtn_Private.height            = 30
$rdbtn_Private.location          = New-Object System.Drawing.Point(7,5)
$rdbtn_Private.Font              = 'Microsoft Sans Serif,10'
$rdbtn_Private.Checked           = $true 

$rdbtn_Internal                  = New-Object system.Windows.Forms.RadioButton
$rdbtn_Internal.text             = "Internal"
$rdbtn_Internal.AutoSize         = $true
$rdbtn_Internal.width            = 90
$rdbtn_Internal.height           = 30
$rdbtn_Internal.location         = New-Object System.Drawing.Point(90,5)
$rdbtn_Internal.Font             = 'Microsoft Sans Serif,10'

$rdbtn_External                  = New-Object system.Windows.Forms.RadioButton
$rdbtn_External.text             = "External"
$rdbtn_External.AutoSize         = $true
$rdbtn_External.width            = 90
$rdbtn_External.height           = 30
$rdbtn_External.location         = New-Object System.Drawing.Point(180,5)
$rdbtn_External.Font             = 'Microsoft Sans Serif,10'

$lb_NetworkAdapter               = New-Object system.Windows.Forms.Label
$lb_NetworkAdapter.text          = "Choose network adapter"
$lb_NetworkAdapter.AutoSize      = $true
$lb_NetworkAdapter.width         = 25
$lb_NetworkAdapter.height        = 10
$lb_NetworkAdapter.location      = New-Object System.Drawing.Point(10,65)
$lb_NetworkAdapter.Font          = 'Microsoft Sans Serif,12'

$cmb_NetworkAdapter              = New-Object system.Windows.Forms.ComboBox
$cmb_NetworkAdapter.width        = 270
$cmb_NetworkAdapter.height       = 30
$cmb_NetworkAdapter.location     = New-Object System.Drawing.Point(5,5)
$cmb_NetworkAdapter.Font         = 'Microsoft Sans Serif,10'

$lb_SwitchName                   = New-Object system.Windows.Forms.Label
$lb_SwitchName.text              = "Enter the name of virtual switch"
$lb_SwitchName.AutoSize          = $true
$lb_SwitchName.width             = 25
$lb_SwitchName.height            = 10
$lb_SwitchName.location          = New-Object System.Drawing.Point(10,129)
$lb_SwitchName.Font              = 'Microsoft Sans Serif,12'

$txtb_SwitchName                 = New-Object system.Windows.Forms.TextBox
$txtb_SwitchName.multiline       = $false
$txtb_SwitchName.text            = "New virtual switch"
$txtb_SwitchName.width           = 270
$txtb_SwitchName.height          = 30
$txtb_SwitchName.location        = New-Object System.Drawing.Point(10,153)
$txtb_SwitchName.Font            = 'Microsoft Sans Serif,10'

$btn_CreateSwitch                = New-Object system.Windows.Forms.Button
$btn_CreateSwitch.text           = "Create"
$btn_CreateSwitch.width          = 90
$btn_CreateSwitch.height         = 50
$btn_CreateSwitch.location       = New-Object System.Drawing.Point(450,290)
$btn_CreateSwitch.Font           = 'Microsoft Sans Serif,12,style=Bold'

$lb_ConnectToVM                  = New-Object system.Windows.Forms.Label
$lb_ConnectToVM.text             = "Do you want to connect the switch to a virtual machine?"
$lb_ConnectToVM.AutoSize         = $true
$lb_ConnectToVM.width            = 25
$lb_ConnectToVM.height           = 10
$lb_ConnectToVM.location         = New-Object System.Drawing.Point(10,194)
$lb_ConnectToVM.Font             = 'Microsoft Sans Serif,12'

$pnl_ConnectSwitchYesNo          = New-Object system.Windows.Forms.Panel
$pnl_ConnectSwitchYesNo.height   = 35
$pnl_ConnectSwitchYesNo.width    = 270
$pnl_ConnectSwitchYesNo.location  = New-Object System.Drawing.Point(5,214)

$rdbtn_ConnectSwitchYes          = New-Object system.Windows.Forms.RadioButton
$rdbtn_ConnectSwitchYes.text     = "Yes"
$rdbtn_ConnectSwitchYes.AutoSize  = $true
$rdbtn_ConnectSwitchYes.width    = 104
$rdbtn_ConnectSwitchYes.height   = 20
$rdbtn_ConnectSwitchYes.location  = New-Object System.Drawing.Point(7,5)
$rdbtn_ConnectSwitchYes.Font     = 'Microsoft Sans Serif,10'

$rdbtn_ConnectSwitchNo           = New-Object system.Windows.Forms.RadioButton
$rdbtn_ConnectSwitchNo.text      = "No"
$rdbtn_ConnectSwitchNo.AutoSize  = $true
$rdbtn_ConnectSwitchNo.width     = 104
$rdbtn_ConnectSwitchNo.height    = 20
$rdbtn_ConnectSwitchNo.location  = New-Object System.Drawing.Point(90,5)
$rdbtn_ConnectSwitchNo.Font      = 'Microsoft Sans Serif,10'
$rdbtn_ConnectSwitchNo.Checked   = $true

$cmb_ChooseVMSwitch              = New-Object system.Windows.Forms.ComboBox
$cmb_ChooseVMSwitch.width        = 270
$cmb_ChooseVMSwitch.height       = 30
$cmb_ChooseVMSwitch.location     = New-Object System.Drawing.Point(5,5)
$cmb_ChooseVMSwitch.Font         = 'Microsoft Sans Serif,10'

$pnl_NetworkAdapter              = New-Object system.Windows.Forms.Panel
$pnl_NetworkAdapter.height       = 30
$pnl_NetworkAdapter.width        = 285
$pnl_NetworkAdapter.location     = New-Object System.Drawing.Point(5,85)

$pnl_ChooseVMSwitch              = New-Object system.Windows.Forms.Panel
$pnl_ChooseVMSwitch.height       = 30
$pnl_ChooseVMSwitch.width        = 285
$pnl_ChooseVMSwitch.location     = New-Object System.Drawing.Point(5,275)

$lb_ChooseVMSwitch               = New-Object system.Windows.Forms.Label
$lb_ChooseVMSwitch.text          = "Choose virtual machine to connect to this switch"
$lb_ChooseVMSwitch.AutoSize      = $true
$lb_ChooseVMSwitch.width         = 25
$lb_ChooseVMSwitch.height        = 10
$lb_ChooseVMSwitch.location      = New-Object System.Drawing.Point(10,255)
$lb_ChooseVMSwitch.Font          = 'Microsoft Sans Serif,12'

$New_Switch_Form.controls.AddRange(@($lb_SwitchType,$pnl_SwitchTypes,$lb_NetworkAdapter,$lb_SwitchName,$txtb_SwitchName,$btn_CreateSwitch,$lb_ConnectToVM,$pnl_ConnectSwitchYesNo,$pnl_NetworkAdapter,$pnl_ChooseVMSwitch,$lb_ChooseVMSwitch))
$pnl_SwitchTypes.controls.AddRange(@($rdbtn_Private,$rdbtn_Internal,$rdbtn_External))
$pnl_NetworkAdapter.controls.AddRange(@($cmb_NetworkAdapter))
$pnl_ConnectSwitchYesNo.controls.AddRange(@($rdbtn_ConnectSwitchYes,$rdbtn_ConnectSwitchNo))
$pnl_ChooseVMSwitch.controls.AddRange(@($cmb_ChooseVMSwitch))

#network adpter combo box

$cmb_NetworkAdapter.Enabled = $false
$rdbtn_External.add_CheckedChanged({
    if ($rdbtn_External.Checked){$cmb_NetworkAdapter.Enabled = $true}
    else {$cmb_NetworkAdapter.Enabled = $false}
    })

#adapters 
$adapters = @((Get-NetAdapter).Name)
foreach ($adapter in $adapters){$cmb_NetworkAdapter.items.add($adapter)}

function loadAdapter{
$selectedItem = $cmb_NetworkAdapter.selectedItem.toString()
return $selectedItem
}


#add to machine

$cmb_ChooseVMSwitch.Enabled = $false
$rdbtn_ConnectSwitchYes.add_CheckedChanged({
    if ($rdbtn_ConnectSwitchYes.Checked){$cmb_ChooseVMSwitch.Enabled = $true

    $machines = @((Get-VM).Name)
    foreach ($machine in $machines){$cmb_ChooseVMSwitch.items.add($machine)}
    
    }
    else {$cmb_ChooseVMSwitch.Enabled = $false}
    })

#machines

function loadMachine{
$selectedMachine = $cmb_ChooseVMSwitch.selectedItem.toString()
return $selectedMachine
}


#create
$btn_CreateSwitch.Add_Click({

    $switchname = $txtb_SwitchName.Text
    
    if(!($switchname)){
    [System.Windows.Forms.MessageBox]::Show("Please give the name", 'Attention', 'OK', 'Error')
    Return
    }
    
    if ($rdbtn_ConnectSwitchYes.Checked){
    $vmName = loadMachine
        if(!($vmName)){
        [System.Windows.Forms.MessageBox]::Show("Please choose VM", 'Attention', 'OK', 'Error')
        Return
        }
    }
    
    if ($rdbtn_Internal.Checked){
    New-VMSwitch -name $switchname -SwitchType Internal
    }

    elseif ($rdbtn_Private.Checked){
    New-VMSwitch -name $switchname -SwitchType Private
    }
    
    elseif ($rdbtn_External.Checked){
    [System.Windows.Forms.MessageBox]::Show('There will be a temporary disconnection to the internet', 'Attention', 'OK', 'Information')
    $adapterName = loadAdapter
    New-VMSwitch -name $switchname  -NetAdapterName $adapterName -AllowManagementOS $true
    }
    [System.Windows.Forms.MessageBox]::Show("Virtual Switch $switchname created", 'Attention', 'OK', 'Information')

        #add to machine 
    if ($rdbtn_ConnectSwitchYes.Checked){
    $vmName = loadMachine
    Add-VMNetworkAdapter -VMName $vmName -SwitchName "$switchname"
    [System.Windows.Forms.MessageBox]::Show("Virtual Switch $switchname added to machine", 'Attention', 'OK', 'Information')
    }
})


$New_Switch_Form.ShowDialog()
