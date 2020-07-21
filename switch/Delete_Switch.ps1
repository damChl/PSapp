<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Delete_Switch
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Delete_Switch                   = New-Object system.Windows.Forms.Form
$Delete_Switch.ClientSize        = '550,200'
$Delete_Switch.text              = "Delete a virtual switch"
$Delete_Switch.TopMost           = $false
$Icon                            = New-Object system.drawing.icon ($PSScriptRoot + "\icons\ikonka_switch.ico")
$Delete_Switch.Icon              = $Icon
$Delete_Switch.FormBorderStyle  = 'FixedDialog'

$lb_SelectSwitch                 = New-Object system.Windows.Forms.Label
$lb_SelectSwitch.text            = "Select a switch to delete"
$lb_SelectSwitch.AutoSize        = $true
$lb_SelectSwitch.width           = 25
$lb_SelectSwitch.height          = 10
$lb_SelectSwitch.location        = New-Object System.Drawing.Point(10,10)
$lb_SelectSwitch.Font            = 'Microsoft Sans Serif,12'

$pnl_SelectSwitch                = New-Object system.Windows.Forms.Panel
$pnl_SelectSwitch.height         = 40
$pnl_SelectSwitch.width          = 535
$pnl_SelectSwitch.location       = New-Object System.Drawing.Point(0,31)

$cmb_SelectSwitch                = New-Object system.Windows.Forms.ComboBox
$cmb_SelectSwitch.width          = 345
$cmb_SelectSwitch.height         = 20
$cmb_SelectSwitch.location       = New-Object System.Drawing.Point(10,6)
$cmb_SelectSwitch.Font           = 'Microsoft Sans Serif,10'

$btn_Delete                      = New-Object system.Windows.Forms.Button
$btn_Delete.text                 = "Delete"
$btn_Delete.width                = 90
$btn_Delete.height               = 50
$btn_Delete.location             = New-Object System.Drawing.Point(450,140)
$btn_Delete.Font                 = 'Microsoft Sans Serif,12,style=Bold'

$Delete_Switch.controls.AddRange(@($lb_SelectSwitch,$pnl_SelectSwitch,$btn_Delete))
$pnl_SelectSwitch.controls.AddRange(@($cmb_SelectSwitch))

#adapters 
$adapters = @((Get-VMSwitch).Name)
foreach ($adapter in $adapters){$cmb_SelectSwitch.items.add($adapter)}


$btn_Delete.Add_Click({

    if(!($cmb_SelectSwitch.Text))
    {
        [System.Windows.Forms.MessageBox]::Show("Select switch", 'Attention', 'OK', 'Error')
        Return
    }

    $selectedItem = $cmb_SelectSwitch.selectedItem.toString()
    Remove-VMSwitch $selectedItem -force
    [System.Windows.Forms.MessageBox]::Show("Switch has been deleted", 'Attention', 'OK', 'Information')
    $cmb_SelectSwitch.items.remove($selectedItem)
})

$Delete_Switch.ShowDialog()
