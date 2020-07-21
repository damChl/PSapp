<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Main_Page_Form
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Main_Page_Form                  = New-Object system.Windows.Forms.Form
$Main_Page_Form.ClientSize       = '760,470'
$Main_Page_Form.text             = "Virtual environment"
$Main_Page_Form.TopMost          = $false
$Icon                            = New-Object system.drawing.icon ($PSScriptRoot + "\icons\ikonka_main.ico")
$Main_Page_Form.Icon             = $Icon
$Main_Page_Form.FormBorderStyle  = 'FixedDialog'

$lb_VMs                          = New-Object system.Windows.Forms.Label
$lb_VMs.text                     = "Virtual machines"
$lb_VMs.AutoSize                 = $true
$lb_VMs.width                    = 25
$lb_VMs.height                   = 10
$lb_VMs.location                 = New-Object System.Drawing.Point(10,6)
$lb_VMs.Font                     = 'Microsoft Sans Serif,12'

$txtb_VMList                     = New-Object system.Windows.Forms.TextBox
$txtb_VMList.multiline           = $true
$txtb_VMList.width               = 565
$txtb_VMList.height              = 430
$txtb_VMList.enabled             = $true
$txtb_VMList.location            = New-Object System.Drawing.Point(10,30)
$txtb_VMList.Font                = 'lucida console,10'
$txtb_VMList.ReadOnly            = $true

$lb_Manage                       = New-Object system.Windows.Forms.Label
$lb_Manage.text                  = "Manage"
$lb_Manage.AutoSize              = $true
$lb_Manage.width                 = 25
$lb_Manage.height                = 10
$lb_Manage.Anchor                = 'top,right'
$lb_Manage.location              = New-Object System.Drawing.Point(581,6)
$lb_Manage.Font                  = 'Microsoft Sans Serif,12'

$btn_RefreshVMList               = New-Object system.Windows.Forms.Button
$btn_RefreshVMList.text          = "Refresh VM list"
$btn_RefreshVMList.width         = 175
$btn_RefreshVMList.height        = 35
$btn_RefreshVMList.Anchor        = 'top,right'
$btn_RefreshVMList.location      = New-Object System.Drawing.Point(579,345)
$btn_RefreshVMList.Font          = 'Microsoft Sans Serif,10'

$btn_Disks                       = New-Object system.Windows.Forms.Button
$btn_Disks.text                  = "Virtual disks..."
$btn_Disks.width                 = 175
$btn_Disks.height                = 35
$btn_Disks.Anchor                = 'top,right'
$btn_Disks.location              = New-Object System.Drawing.Point(580,30)
$btn_Disks.Font                  = 'Microsoft Sans Serif,10'

$btn_VMs                         = New-Object system.Windows.Forms.Button
$btn_VMs.text                    = "Virtual machines..."
$btn_VMs.width                   = 175
$btn_VMs.height                  = 35
$btn_VMs.Anchor                  = 'top,right'
$btn_VMs.location                = New-Object System.Drawing.Point(580,70)
$btn_VMs.Font                    = 'Microsoft Sans Serif,10'

$btn_MachineTemplates            = New-Object system.Windows.Forms.Button
$btn_MachineTemplates.text       = "Virtual machine templates..."
$btn_MachineTemplates.width      = 175
$btn_MachineTemplates.height     = 35
$btn_MachineTemplates.Anchor     = 'top,right'
$btn_MachineTemplates.location   = New-Object System.Drawing.Point(580,190)
$btn_MachineTemplates.Font       = 'Microsoft Sans Serif,10'

$btn_DiskTemplates               = New-Object system.Windows.Forms.Button
$btn_DiskTemplates.text          = "Virtual disk templates..."
$btn_DiskTemplates.width         = 175
$btn_DiskTemplates.height        = 35
$btn_DiskTemplates.Anchor        = 'top,right'
$btn_DiskTemplates.location      = New-Object System.Drawing.Point(580,150)
$btn_DiskTemplates.Font          = 'Microsoft Sans Serif,10'

$btn_Switches                    = New-Object system.Windows.Forms.Button
$btn_Switches.text               = "Virtual switches..."
$btn_Switches.width              = 175
$btn_Switches.height             = 35
$btn_Switches.Anchor             = 'top,right'
$btn_Switches.location           = New-Object System.Drawing.Point(580,110)
$btn_Switches.Font               = 'Microsoft Sans Serif,10'

$btn_Environment                 = New-Object system.Windows.Forms.Button
$btn_Environment.text            = "Virtual environment..."
$btn_Environment.width           = 175
$btn_Environment.height          = 35
$btn_Environment.Anchor          = 'top,right'
$btn_Environment.location        = New-Object System.Drawing.Point(580,230)
$btn_Environment.Font            = 'Microsoft Sans Serif,10'

$lb_Actions                      = New-Object system.Windows.Forms.Label
$lb_Actions.text                 = "Actions"
$lb_Actions.AutoSize             = $true
$lb_Actions.width                = 25
$lb_Actions.height               = 10
$lb_Actions.Anchor               = 'top,right'
$lb_Actions.location             = New-Object System.Drawing.Point(580,321)
$lb_Actions.Font                 = 'Microsoft Sans Serif,12'

$btn_Authors                     = New-Object system.Windows.Forms.Button
$btn_Authors.text                = "Authors"
$btn_Authors.width               = 175
$btn_Authors.height              = 35
$btn_Authors.Anchor              = 'top,right'
$btn_Authors.location            = New-Object System.Drawing.Point(580,385)
$btn_Authors.Font                = 'Microsoft Sans Serif,10'

$btn_Exit                        = New-Object system.Windows.Forms.Button
$btn_Exit.text                   = "Exit"
$btn_Exit.width                  = 175
$btn_Exit.height                 = 35
$btn_Exit.Anchor                 = 'top,right'
$btn_Exit.location               = New-Object System.Drawing.Point(579,425)
$btn_Exit.Font                   = 'Microsoft Sans Serif,10'

$Main_Page_Form.controls.AddRange(@($lb_VMs,$txtb_VMList,$lb_Manage,$btn_RefreshVMList,$btn_Disks,$btn_VMs,$btn_MachineTemplates,$btn_DiskTemplates,$btn_Switches,$btn_Environment,$lb_Actions,$btn_Authors,$btn_Exit))

# admin_run
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr, 6)

#CODE

#machines
$txtb_VMList.Text = get-vm | Format-Table -Property Name, Status, Version -AutoSize |Out-String

#refresh
$btn_RefreshVMList.Add_Click({
   $txtb_VMList.Text = get-vm | Format-Table -Property Name, Status, Version -AutoSize |Out-String
   Remove-Variable * -ErrorAction SilentlyContinue; Remove-Module *; $error.Clear(); Clear-Host
})

#exit
$btn_Exit.Add_Click({
   $Main_Page_Form.Close()
})

#virtual_diks_managment
$btn_Disks.Add_Click({
    $path = $PSScriptRoot + "\VHD_Management.ps1"
    & $path
})

#virtual_machine_managment
$btn_VMs.Add_Click({
    $path = $PSScriptRoot + "\VM_Management.ps1"
    & $path
})


#virtual_switch_managment
$btn_Switches.Add_Click({
    $path = $PSScriptRoot + "\Switch_Management.ps1"
    & $path
})

#virtual_disk_template
$btn_DiskTemplates.Add_Click({
    $path = $PSScriptRoot + "\New_VHD_Template.ps1"
    & $path
})


#virtual_machine_template
$btn_MachineTemplates.Add_Click({
    $path = $PSScriptRoot + "\New_VM_Template.ps1"
    & $path
})

#virtual_environment
$btn_Environment.Add_Click({
    $path = $PSScriptRoot + "\Environment_Management.ps1"
    & $path
})

$btn_Authors.Add_Click({
[System.Windows.Forms.MessageBox]::Show("Damian Charlak`r`nJakub Brzozowski`r`nMateusz Kowalski`r`nRobert Kusina", 'Authors', 'OK', 'Information')
})

$Main_Page_Form.ShowDialog()
