<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    New_VM_From_Template
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$New_VM_From_Template            = New-Object system.Windows.Forms.Form
$New_VM_From_Template.ClientSize  = '550,350'
$New_VM_From_Template.text       = "New virtual machine from a template"
$New_VM_From_Template.TopMost    = $false
$Icon                            = New-Object system.drawing.icon ($PSScriptRoot + "\icons\ikonka_maszyna_środowisko.ico")
$New_VM_From_Template.Icon              = $Icon
$New_VM_From_Template.FormBorderStyle  = 'FixedDialog'

$lb_VMTemplateName               = New-Object system.Windows.Forms.Label
$lb_VMTemplateName.text          = "Choose a template for the new virtual machine"
$lb_VMTemplateName.AutoSize      = $true
$lb_VMTemplateName.width         = 25
$lb_VMTemplateName.height        = 10
$lb_VMTemplateName.location      = New-Object System.Drawing.Point(10,9)
$lb_VMTemplateName.Font          = 'Microsoft Sans Serif,12'

$txtb_VMTemplateName             = New-Object system.Windows.Forms.TextBox
$txtb_VMTemplateName.multiline   = $false
$txtb_VMTemplateName.width       = 290
$txtb_VMTemplateName.height      = 20
$txtb_VMTemplateName.location    = New-Object System.Drawing.Point(10,38)
$txtb_VMTemplateName.Font        = 'Microsoft Sans Serif,10'

$btn_SelectVMTemplate            = New-Object system.Windows.Forms.Button
$btn_SelectVMTemplate.text       = "Browse..."
$btn_SelectVMTemplate.width      = 70
$btn_SelectVMTemplate.height     = 30
$btn_SelectVMTemplate.location   = New-Object System.Drawing.Point(310,32)
$btn_SelectVMTemplate.Font       = 'Microsoft Sans Serif,10'

$lb_AboutVMTemplate              = New-Object system.Windows.Forms.Label
$lb_AboutVMTemplate.text         = "Virtual machine will be created using this parameters:"
$lb_AboutVMTemplate.AutoSize     = $true
$lb_AboutVMTemplate.width        = 25
$lb_AboutVMTemplate.height       = 10
$lb_AboutVMTemplate.location     = New-Object System.Drawing.Point(10,74)
$lb_AboutVMTemplate.Font         = 'Microsoft Sans Serif,12'

$lb_VMRAM                        = New-Object system.Windows.Forms.Label
$lb_VMRAM.text                   = "RAM memory"
$lb_VMRAM.AutoSize               = $true
$lb_VMRAM.width                  = 25
$lb_VMRAM.height                 = 10
$lb_VMRAM.location               = New-Object System.Drawing.Point(10,104)
$lb_VMRAM.Font                   = 'Microsoft Sans Serif,10'

$lb_VMCores                      = New-Object system.Windows.Forms.Label
$lb_VMCores.text                 = "Amount of cores"
$lb_VMCores.AutoSize             = $true
$lb_VMCores.width                = 25
$lb_VMCores.height               = 10
$lb_VMCores.location             = New-Object System.Drawing.Point(10,129)
$lb_VMCores.Font                 = 'Microsoft Sans Serif,10'

$lb_VMSwitch                     = New-Object system.Windows.Forms.Label
$lb_VMSwitch.text                = "Connected switch"
$lb_VMSwitch.AutoSize            = $true
$lb_VMSwitch.width               = 25
$lb_VMSwitch.height              = 10
$lb_VMSwitch.location            = New-Object System.Drawing.Point(10,154)
$lb_VMSwitch.Font                = 'Microsoft Sans Serif,10'

$txtb_VMRAM                      = New-Object system.Windows.Forms.TextBox
$txtb_VMRAM.multiline            = $false
$txtb_VMRAM.width                = 100
$txtb_VMRAM.height               = 20
$txtb_VMRAM.location             = New-Object System.Drawing.Point(139,99)
$txtb_VMRAM.Font                 = 'Microsoft Sans Serif,10'
$txtb_VMRAM.Enabled = $false
$txtb_VMRAM.BackColor = "#ffffff"

$txtb_VMCores                    = New-Object system.Windows.Forms.TextBox
$txtb_VMCores.multiline          = $false
$txtb_VMCores.width              = 100
$txtb_VMCores.height             = 20
$txtb_VMCores.location           = New-Object System.Drawing.Point(139,124)
$txtb_VMCores.Font               = 'Microsoft Sans Serif,10'
$txtb_VMCores.Enabled = $false
$txtb_VMCores.BackColor = "#ffffff"

$txtb_VMSwitch                   = New-Object system.Windows.Forms.TextBox
$txtb_VMSwitch.multiline         = $false
$txtb_VMSwitch.width             = 241
$txtb_VMSwitch.height            = 20
$txtb_VMSwitch.location          = New-Object System.Drawing.Point(139,149)
$txtb_VMSwitch.Font              = 'Microsoft Sans Serif,10'
$txtb_VMSwitch.Enabled = $false
$txtb_VMSwitch.BackColor = "#ffffff"

$lb_GB                           = New-Object system.Windows.Forms.Label
$lb_GB.text                      = "GB"
$lb_GB.AutoSize                  = $true
$lb_GB.width                     = 25
$lb_GB.height                    = 10
$lb_GB.location                  = New-Object System.Drawing.Point(242,104)
$lb_GB.Font                      = 'Microsoft Sans Serif,10'

$btn_Create                      = New-Object system.Windows.Forms.Button
$btn_Create.text                 = "Create"
$btn_Create.width                = 90
$btn_Create.height               = 50
$btn_Create.Anchor               = 'right,bottom'
$btn_Create.location             = New-Object System.Drawing.Point(450,290)
$btn_Create.Font                 = 'Microsoft Sans Serif,12,style=Bold'

$lb_VMName                       = New-Object system.Windows.Forms.Label
$lb_VMName.text                  = "Choose a name for the new virtual machine"
$lb_VMName.AutoSize              = $true
$lb_VMName.width                 = 25
$lb_VMName.height                = 10
$lb_VMName.location              = New-Object System.Drawing.Point(10,186)
$lb_VMName.Font                  = 'Microsoft Sans Serif,12'

$txtb_VMName                     = New-Object system.Windows.Forms.TextBox
$txtb_VMName.multiline           = $false
$txtb_VMName.width               = 290
$txtb_VMName.height              = 20
$txtb_VMName.location            = New-Object System.Drawing.Point(10,214)
$txtb_VMName.Font                = 'Microsoft Sans Serif,10'

$txtb_VMDisk                     = New-Object system.Windows.Forms.TextBox
$txtb_VMDisk.multiline           = $false
$txtb_VMDisk.width               = 290
$txtb_VMDisk.height              = 20
$txtb_VMDisk.location            = New-Object System.Drawing.Point(10,277)
$txtb_VMDisk.Font                = 'Microsoft Sans Serif,10'

$lb_VMDisk                       = New-Object system.Windows.Forms.Label
$lb_VMDisk.text                  = "Choose the disk You want to connect to the virtual machine"
$lb_VMDisk.AutoSize              = $true
$lb_VMDisk.width                 = 25
$lb_VMDisk.height                = 10
$lb_VMDisk.location              = New-Object System.Drawing.Point(10,249)
$lb_VMDisk.Font                  = 'Microsoft Sans Serif,12'

$btn_Browse                      = New-Object system.Windows.Forms.Button
$btn_Browse.text                 = "Browse..."
$btn_Browse.width                = 70
$btn_Browse.height               = 28
$btn_Browse.location             = New-Object System.Drawing.Point(306,273)
$btn_Browse.Font                 = 'Microsoft Sans Serif,10'

$New_VM_From_Template.controls.AddRange(@($lb_VMTemplateName,$txtb_VMTemplateName,$btn_SelectVMTemplate,$lb_AboutVMTemplate,$lb_VMRAM,$lb_VMCores,$lb_VMSwitch,$txtb_VMRAM,$txtb_VMCores,$txtb_VMSwitch,$lb_GB,$btn_Create,$lb_VMName,$txtb_VMName,$txtb_VMDisk,$lb_VMDisk,$btn_Browse))

#btn_template
$btn_SelectVMTemplate.Add_Click({
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
   InitialDirectory = [Environment]::GetFolderPath('Desktop') 
  Filter = 'Template (*.csv)|*.csv'
}
[void]$FileBrowser.ShowDialog()
$txtb_VMTemplateName.Text = $FileBrowser.Filename
})

#btn_disk
$btn_Browse.Add_Click({
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
   InitialDirectory = [Environment]::GetFolderPath('Desktop') 
  Filter = 'Disk (*.vhdx)|*.vhdx|Disk (*.vhd)|*.vhd'
}
    [void]$FileBrowser.ShowDialog()
    $txtb_VMDisk.Text = $FileBrowser.Filename
})

#add_parameters
$txtb_VMTemplateName.Add_TextChanged({
    $P = Import-Csv -Path $txtb_VMTemplateName.Text
    $txtb_VMRAM.Text = $P.MemoryStartup / 1GB
    $txtb_VMCores.Text = $P.ProcCount
    $txtb_VMSwitch.Text = $P.Switch
    #[System.Windows.Forms.MessageBox]::Show("$P", 'Attention', 'OK', 'Information')
})


$btn_Create.Add_Click({

        If (!(test-path $txtb_VMTemplateName.Text -Include *.csv)){
            [System.Windows.Forms.MessageBox]::Show("Template doesn't exsist", 'Attention', 'OK', 'Error')
            Return
        }

        if(!($txtb_VMTemplateName.Text))
        {
            [System.Windows.Forms.MessageBox]::Show("Select location", 'Attention', 'OK', 'Error')
            Return
        }

        if(!($txtb_VMName.Text))
        {
            [System.Windows.Forms.MessageBox]::Show("Enter the name", 'Attention', 'OK', 'Error')
            Return
        }

        if(!($txtb_VMDisk.Text))
        {
            [System.Windows.Forms.MessageBox]::Show("Select disk", 'Attention', 'OK', 'Error')
            Return
        }

    $P = Import-Csv -Path $txtb_VMTemplateName.Text
    $mem = $P.MemoryStartup
    $switch = $P.Switch
    $name = $txtb_VMName.Text
    $core = $P.ProcCount
    $genere = 2
    $disk = $txtb_VMDisk.Text
    New-VM -Name $name -MemoryStartupBytes $mem  -Generation $genere -SwitchName $switch -VHDPath $disk
    Set-Vm -Name $name -ProcessorCount $core
    [System.Windows.Forms.MessageBox]::Show("Machine created", 'Attention', 'OK', 'Information')
})


$New_VM_From_Template.ShowDialog()