<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    New_Plain_VM
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$New_Plain_VM                    = New-Object system.Windows.Forms.Form
$New_Plain_VM.ClientSize         = '550,350'
$New_Plain_VM.text               = "New virtual machine"
$New_Plain_VM.TopMost            = $false
$Icon                            = New-Object system.drawing.icon ($PSScriptRoot + "\icons\ikonka_maszyna_środowisko.ico")
$New_Plain_VM.Icon              = $Icon
$New_Plain_VM.FormBorderStyle  = 'FixedDialog'

$lb_VMName                       = New-Object system.Windows.Forms.Label
$lb_VMName.text                  = "Choose a name of the new virtual machine"
$lb_VMName.AutoSize              = $true
$lb_VMName.width                 = 25
$lb_VMName.height                = 10
$lb_VMName.location              = New-Object System.Drawing.Point(10,10)
$lb_VMName.Font                  = 'Microsoft Sans Serif,12'

$txtv_VMName                     = New-Object system.Windows.Forms.TextBox
$txtv_VMName.multiline           = $false
$txtv_VMName.text                = "New virtual machine"
$txtv_VMName.width               = 263
$txtv_VMName.height              = 20
$txtv_VMName.location            = New-Object System.Drawing.Point(10,38)
$txtv_VMName.Font                = 'Microsoft Sans Serif,10'

$lb_VMGeneration                 = New-Object system.Windows.Forms.Label
$lb_VMGeneration.text            = "Select generation of the new virtual machine"
$lb_VMGeneration.AutoSize        = $true
$lb_VMGeneration.width           = 25
$lb_VMGeneration.height          = 10
$lb_VMGeneration.location        = New-Object System.Drawing.Point(10,65)
$lb_VMGeneration.Font            = 'Microsoft Sans Serif,12'

$pnl_VMGeneration                = New-Object system.Windows.Forms.Panel
$pnl_VMGeneration.height         = 26
$pnl_VMGeneration.width          = 292
$pnl_VMGeneration.location       = New-Object System.Drawing.Point(0,84)

$rdbtn_VMGeneration1             = New-Object system.Windows.Forms.RadioButton
$rdbtn_VMGeneration1.text        = "Generation 1"
$rdbtn_VMGeneration1.AutoSize    = $true
$rdbtn_VMGeneration1.width       = 104
$rdbtn_VMGeneration1.height      = 20
$rdbtn_VMGeneration1.location    = New-Object System.Drawing.Point(12,7)
$rdbtn_VMGeneration1.Font        = 'Microsoft Sans Serif,10'

$rdbtn_VMGeneration2             = New-Object system.Windows.Forms.RadioButton
$rdbtn_VMGeneration2.text        = "Generation 2"
$rdbtn_VMGeneration2.AutoSize    = $true
$rdbtn_VMGeneration2.width       = 104
$rdbtn_VMGeneration2.height      = 20
$rdbtn_VMGeneration2.location    = New-Object System.Drawing.Point(167,7)
$rdbtn_VMGeneration2.Font        = 'Microsoft Sans Serif,10'
$rdbtn_VMGeneration2.Checked     = $true

$lb_VMRAM                        = New-Object system.Windows.Forms.Label
$lb_VMRAM.text                   = "Specify amount of RAM memory"
$lb_VMRAM.AutoSize               = $true
$lb_VMRAM.width                  = 25
$lb_VMRAM.height                 = 10
$lb_VMRAM.location               = New-Object System.Drawing.Point(10,120)
$lb_VMRAM.Font                   = 'Microsoft Sans Serif,12'

$txtb_VMRAM                      = New-Object system.Windows.Forms.TextBox
$txtb_VMRAM.multiline            = $false
$txtb_VMRAM.text                 = "1"
$txtb_VMRAM.width                = 76
$txtb_VMRAM.height               = 20
$txtb_VMRAM.location             = New-Object System.Drawing.Point(10,148)
$txtb_VMRAM.Font                 = 'Microsoft Sans Serif,10'

$lb_GB                           = New-Object system.Windows.Forms.Label
$lb_GB.text                      = "GB"
$lb_GB.AutoSize                  = $true
$lb_GB.width                     = 25
$lb_GB.height                    = 10
$lb_GB.location                  = New-Object System.Drawing.Point(91,153)
$lb_GB.Font                      = 'Microsoft Sans Serif,10'

$lb_VMCores                      = New-Object system.Windows.Forms.Label
$lb_VMCores.text                 = "Specify amount of CPU cores to use"
$lb_VMCores.AutoSize             = $true
$lb_VMCores.width                = 25
$lb_VMCores.height               = 10
$lb_VMCores.location             = New-Object System.Drawing.Point(10,178)
$lb_VMCores.Font                 = 'Microsoft Sans Serif,12'

$lb_Cores                        = New-Object system.Windows.Forms.Label
$lb_Cores.text                   = "cores"
$lb_Cores.AutoSize               = $true
$lb_Cores.width                  = 25
$lb_Cores.height                 = 10
$lb_Cores.location               = New-Object System.Drawing.Point(91,208)
$lb_Cores.Font                   = 'Microsoft Sans Serif,10'

$lb_VMNetwork                    = New-Object system.Windows.Forms.Label
$lb_VMNetwork.text               = "Configure network connection"
$lb_VMNetwork.AutoSize           = $true
$lb_VMNetwork.width              = 25
$lb_VMNetwork.height             = 10
$lb_VMNetwork.location           = New-Object System.Drawing.Point(10,291)
$lb_VMNetwork.Font               = 'Microsoft Sans Serif,12'

$cmb_VMNetwork                   = New-Object system.Windows.Forms.ComboBox
$cmb_VMNetwork.width             = 263
$cmb_VMNetwork.height            = 20
$cmb_VMNetwork.location          = New-Object System.Drawing.Point(10,7)
$cmb_VMNetwork.Font              = 'Microsoft Sans Serif,10'

$lb_SelectVMDisk                 = New-Object system.Windows.Forms.Label
$lb_SelectVMDisk.text            = "Choose disk You want to connect "
$lb_SelectVMDisk.AutoSize        = $true
$lb_SelectVMDisk.width           = 25
$lb_SelectVMDisk.height          = 10
$lb_SelectVMDisk.location        = New-Object System.Drawing.Point(10,235)
$lb_SelectVMDisk.Font            = 'Microsoft Sans Serif,12'

$txtb_VMDisk                     = New-Object system.Windows.Forms.TextBox
$txtb_VMDisk.multiline           = $false
$txtb_VMDisk.width               = 263
$txtb_VMDisk.height              = 20
$txtb_VMDisk.location            = New-Object System.Drawing.Point(10,263)
$txtb_VMDisk.Font                = 'Microsoft Sans Serif,10'

$btn_Create                      = New-Object system.Windows.Forms.Button
$btn_Create.text                 = "Create"
$btn_Create.width                = 90
$btn_Create.height               = 50
$btn_Create.location             = New-Object System.Drawing.Point(450,290)
$btn_Create.Font                 = 'Microsoft Sans Serif,12,style=Bold'

$btn_BrowseVMDisk                = New-Object system.Windows.Forms.Button
$btn_BrowseVMDisk.text           = "Browse..."
$btn_BrowseVMDisk.width          = 70
$btn_BrowseVMDisk.height         = 30
$btn_BrowseVMDisk.location       = New-Object System.Drawing.Point(277,257)
$btn_BrowseVMDisk.Font           = 'Microsoft Sans Serif,10'

$pnl_VMNetwork                   = New-Object system.Windows.Forms.Panel
$pnl_VMNetwork.height            = 36
$pnl_VMNetwork.width             = 359
$pnl_VMNetwork.location          = New-Object System.Drawing.Point(0,310)

$cmb_VMCores                     = New-Object system.Windows.Forms.ComboBox
$cmb_VMCores.width               = 76
$cmb_VMCores.height              = 20
$cmb_VMCores.location            = New-Object System.Drawing.Point(10,206)
$cmb_VMCores.Font                = 'Microsoft Sans Serif,10'

$New_Plain_VM.controls.AddRange(@($lb_VMName,$txtv_VMName,$lb_VMGeneration,$pnl_VMGeneration,$lb_VMRAM,$txtb_VMRAM,$lb_GB,$lb_VMCores,$lb_Cores,$lb_VMNetwork,$lb_SelectVMDisk,$txtb_VMDisk,$btn_Create,$btn_BrowseVMDisk,$pnl_VMNetwork,$cmb_VMCores))
$pnl_VMGeneration.controls.AddRange(@($rdbtn_VMGeneration1,$rdbtn_VMGeneration2))
$pnl_VMNetwork.controls.AddRange(@($cmb_VMNetwork))

$switches = @((Get-VMSwitch).Name)
foreach ($switch in $switches){$cmb_VMNetwork.items.add($switch)}

function loadSwitch{
$selectedItem = $cmb_VMNetwork.selectedItem.toString()
return $selectedItem
}

$cores = (Get-WmiObject -Class Win32_Processor).NumberOfLogicalProcessors

#foreach ($core in $cores){$cmb_VMCores.items.add($core)}

for ($i = 1; $i -le $cores; ++$i) {
$cmb_VMCores.items.add($i)
}


function loadCore{
$selectedCore = $cmb_VMCores.selectedItem.toString()
return $selectedCore
}




$btn_BrowseVMDisk.Add_Click({
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
   InitialDirectory = [Environment]::GetFolderPath('Desktop') 
  Filter = 'Disk (*.vhdx)|*.vhdx|Disk (*.vhd)|*.vhd'
}
[void]$FileBrowser.ShowDialog()
$txtb_VMDisk.Text = $FileBrowser.Filename
})


$btn_Create.Add_Click({

        if(!($txtv_VMName.Text))
        {
            [System.Windows.Forms.MessageBox]::Show("Please give the name", 'Attention', 'OK', 'Error')
            Return
        }

        try{
            $RAM = $txtb_VMRAM.Text
            $RAM = ([int]$RAM *1GB) 
        }
        catch{
            [System.Windows.Forms.MessageBox]::Show("RAM must be a number", 'Attention', 'OK', 'Information')
            Return
        }

        try{
            $cores2 = loadCore
        }
        catch {
            [System.Windows.Forms.MessageBox]::Show("Podaj rdzenie", 'Attention', 'OK', 'Error')
        Return
        }

        if (!($txtb_VMDisk.Text)) 
        {
            [System.Windows.Forms.MessageBox]::Show("Podaj dysk", 'Error', 'OK', 'Error')
            Return
        }
    

    try{
        $switch2 = loadSwitch
    }
    catch {
        [System.Windows.Forms.MessageBox]::Show("DEBILU PODEJ switch", 'Attention', 'OK', 'Error')
        Return
    }

    $diskPath = $txtb_VMDisk.Text
    $name = $txtv_VMName.Text

    

    if ($rdbtn_VMGeneration1.Checked){
    $generation = "1"
    }
    elseif($rdbtn_VMGeneration2.Checked){
    $generation = "2"
    }
    else{
    [System.Windows.Forms.MessageBox]::Show('nie dziala')
    }

    $RAM = $txtb_VMRAM.Text
    $RAM = ([int]$RAM *1GB)

    New-VM -Name $name -Generation $generation -SwitchName $switch2 -MemoryStartupBytes $RAM -VHDPath $diskPath
    Set-VM -Name $name -ProcessorCount $cores2
    [System.Windows.Forms.MessageBox]::Show("Virtual Machine $name created", 'Attention', 'OK', 'Information')
})

$New_Plain_VM.ShowDialog()