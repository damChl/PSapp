<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    New_Forest
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$New_Forest                      = New-Object system.Windows.Forms.Form
$New_Forest.ClientSize           = '550,500'
$New_Forest.text                 = "New forest"
$New_Forest.TopMost              = $false
$Icon                            = New-Object system.drawing.icon ($PSScriptRoot + "\icons\ikonka_maszyna_środowisko.ico")
$New_Forest.Icon      = $Icon
$New_Forest.FormBorderStyle  = 'FixedDialog'

$lb_ForestName                   = New-Object system.Windows.Forms.Label
$lb_ForestName.text              = "Choose Your forest name or use default name "
$lb_ForestName.AutoSize          = $true
$lb_ForestName.width             = 25
$lb_ForestName.height            = 10
$lb_ForestName.location          = New-Object System.Drawing.Point(10,10)
$lb_ForestName.Font              = 'Microsoft Sans Serif,12'

$pnl_ForestName                  = New-Object system.Windows.Forms.Panel
$pnl_ForestName.height           = 35
$pnl_ForestName.width            = 292
$pnl_ForestName.location         = New-Object System.Drawing.Point(0,27)

$rdbtn_DefaultForestName         = New-Object system.Windows.Forms.RadioButton
$rdbtn_DefaultForestName.text    = "Default name"
$rdbtn_DefaultForestName.AutoSize  = $true
$rdbtn_DefaultForestName.width   = 104
$rdbtn_DefaultForestName.height  = 20
$rdbtn_DefaultForestName.location  = New-Object System.Drawing.Point(10,11)
$rdbtn_DefaultForestName.Font    = 'Microsoft Sans Serif,10'

$rdbtn_CustomForestName          = New-Object system.Windows.Forms.RadioButton
$rdbtn_CustomForestName.text     = "Custom name"
$rdbtn_CustomForestName.AutoSize  = $true
$rdbtn_CustomForestName.width    = 104
$rdbtn_CustomForestName.height   = 20
$rdbtn_CustomForestName.location  = New-Object System.Drawing.Point(143,11)
$rdbtn_CustomForestName.Font     = 'Microsoft Sans Serif,10'
$rdbtn_DefaultForestName.Checked = $true

$txtb_ForestName                 = New-Object system.Windows.Forms.TextBox
$txtb_ForestName.multiline       = $false
$txtb_ForestName.width           = 320
$txtb_ForestName.height          = 20
$txtb_ForestName.location        = New-Object System.Drawing.Point(10,2)
$txtb_ForestName.Font            = 'Microsoft Sans Serif,10'

$pnl_ForestCustomName            = New-Object system.Windows.Forms.Panel
$pnl_ForestCustomName.height     = 36
$pnl_ForestCustomName.width      = 346
$pnl_ForestCustomName.location   = New-Object System.Drawing.Point(0,63)

$btn_Create                      = New-Object system.Windows.Forms.Button
$btn_Create.text                 = "Create"
$btn_Create.width                = 90
$btn_Create.height               = 50
$btn_Create.location             = New-Object System.Drawing.Point(450,440)
$btn_Create.Font                 = 'Microsoft Sans Serif,12,style=Bold'

$lb_VMName                       = New-Object system.Windows.Forms.Label
$lb_VMName.text                  = "Enter name of the new virtual machine on which a forest will be created"
$lb_VMName.AutoSize              = $true
$lb_VMName.width                 = 25
$lb_VMName.height                = 10
$lb_VMName.location              = New-Object System.Drawing.Point(10,101)
$lb_VMName.Font                  = 'Microsoft Sans Serif,12'

$txtb_VMName                     = New-Object system.Windows.Forms.TextBox
$txtb_VMName.multiline           = $false
$txtb_VMName.width               = 320
$txtb_VMName.height              = 20
$txtb_VMName.location            = New-Object System.Drawing.Point(8,125)
$txtb_VMName.Font                = 'Microsoft Sans Serif,10'

$lb_EnterDiskLocation            = New-Object system.Windows.Forms.Label
$lb_EnterDiskLocation.text       = "Choose location of the new virtual machine`'s disk"
$lb_EnterDiskLocation.AutoSize   = $true
$lb_EnterDiskLocation.width      = 25
$lb_EnterDiskLocation.height     = 10
$lb_EnterDiskLocation.location   = New-Object System.Drawing.Point(10,222)
$lb_EnterDiskLocation.Font       = 'Microsoft Sans Serif,12'

$txtb_DiskLocation               = New-Object system.Windows.Forms.TextBox
$txtb_DiskLocation.multiline     = $false
$txtb_DiskLocation.width         = 320
$txtb_DiskLocation.height        = 20
$txtb_DiskLocation.location      = New-Object System.Drawing.Point(8,250)
$txtb_DiskLocation.Font          = 'Microsoft Sans Serif,10'

$btn_Browse                      = New-Object system.Windows.Forms.Button
$btn_Browse.text                 = "Browse..."
$btn_Browse.width                = 70
$btn_Browse.height               = 30
$btn_Browse.location             = New-Object System.Drawing.Point(338,246)
$btn_Browse.Font                 = 'Microsoft Sans Serif,10'

$lb_EnterPass                    = New-Object system.Windows.Forms.Label
$lb_EnterPass.text               = "Enter DSRM Password below:"
$lb_EnterPass.AutoSize           = $true
$lb_EnterPass.width              = 25
$lb_EnterPass.height             = 10
$lb_EnterPass.location           = New-Object System.Drawing.Point(10,413)
$lb_EnterPass.Font               = 'Microsoft Sans Serif,12'

$lb_Pass1                        = New-Object system.Windows.Forms.Label
$lb_Pass1.text                   = "Password:"
$lb_Pass1.AutoSize               = $true
$lb_Pass1.width                  = 25
$lb_Pass1.height                 = 10
$lb_Pass1.location               = New-Object System.Drawing.Point(10,446)
$lb_Pass1.Font                   = 'Microsoft Sans Serif,10'

$lb_ConfirmPass                  = New-Object system.Windows.Forms.Label
$lb_ConfirmPass.text             = "Confirm password:"
$lb_ConfirmPass.AutoSize         = $true
$lb_ConfirmPass.width            = 25
$lb_ConfirmPass.height           = 10
$lb_ConfirmPass.location         = New-Object System.Drawing.Point(10,471)
$lb_ConfirmPass.Font             = 'Microsoft Sans Serif,10'

$txtb_Pass1                      = New-Object system.Windows.Forms.TextBox
$txtb_Pass1.multiline            = $false
$txtb_Pass1.width                = 151
$txtb_Pass1.height               = 20
$txtb_Pass1.location             = New-Object System.Drawing.Point(130,441)
$txtb_Pass1.Font                 = 'Microsoft Sans Serif,10'

$txtb_Pass2                      = New-Object system.Windows.Forms.TextBox
$txtb_Pass2.multiline            = $false
$txtb_Pass2.width                = 151
$txtb_Pass2.height               = 20
$txtb_Pass2.location             = New-Object System.Drawing.Point(130,466)
$txtb_Pass2.Font                 = 'Microsoft Sans Serif,10'

$lb_EnterIP                      = New-Object system.Windows.Forms.Label
$lb_EnterIP.text                 = "Enter last number for IPv4 configuration"
$lb_EnterIP.AutoSize             = $true
$lb_EnterIP.width                = 25
$lb_EnterIP.height               = 10
$lb_EnterIP.location             = New-Object System.Drawing.Point(10,281)
$lb_EnterIP.Font                 = 'Microsoft Sans Serif,12'

$lb_IP                           = New-Object system.Windows.Forms.Label
$lb_IP.text                      = "10.10.10."
$lb_IP.AutoSize                  = $true
$lb_IP.width                     = 25
$lb_IP.height                    = 10
$lb_IP.location                  = New-Object System.Drawing.Point(10,309)
$lb_IP.Font                      = 'Microsoft Sans Serif,10'

$txtb_IP                         = New-Object system.Windows.Forms.TextBox
$txtb_IP.multiline               = $false
$txtb_IP.width                   = 35
$txtb_IP.height                  = 20
$txtb_IP.location                = New-Object System.Drawing.Point(72,305)
$txtb_IP.Font                    = 'Microsoft Sans Serif,10'

$lb_ChooseVMSwitch               = New-Object system.Windows.Forms.Label
$lb_ChooseVMSwitch.text          = "Select switch for the new virtual machine"
$lb_ChooseVMSwitch.AutoSize      = $true
$lb_ChooseVMSwitch.width         = 25
$lb_ChooseVMSwitch.height        = 10
$lb_ChooseVMSwitch.location      = New-Object System.Drawing.Point(10,341)
$lb_ChooseVMSwitch.Font          = 'Microsoft Sans Serif,12'

$pnl_ChooseSwitch                = New-Object system.Windows.Forms.Panel
$pnl_ChooseSwitch.height         = 41
$pnl_ChooseSwitch.width          = 422
$pnl_ChooseSwitch.location       = New-Object System.Drawing.Point(0,358)

$cmb_ChooseVMSwitch              = New-Object system.Windows.Forms.ComboBox
$cmb_ChooseVMSwitch.width        = 320
$cmb_ChooseVMSwitch.height       = 20
$cmb_ChooseVMSwitch.location     = New-Object System.Drawing.Point(10,10)
$cmb_ChooseVMSwitch.Font         = 'Microsoft Sans Serif,10'

$lb_ChooseDiskBase               = New-Object system.Windows.Forms.Label
$lb_ChooseDiskBase.text          = "Enter location of a `"Parent`" disk"
$lb_ChooseDiskBase.AutoSize      = $true
$lb_ChooseDiskBase.width         = 25
$lb_ChooseDiskBase.height        = 10
$lb_ChooseDiskBase.location      = New-Object System.Drawing.Point(10,154)
$lb_ChooseDiskBase.Font          = 'Microsoft Sans Serif,12'

$txtb_DiskBaseLocation           = New-Object system.Windows.Forms.TextBox
$txtb_DiskBaseLocation.multiline  = $false
$txtb_DiskBaseLocation.width     = 320
$txtb_DiskBaseLocation.height    = 20
$txtb_DiskBaseLocation.location  = New-Object System.Drawing.Point(10,182)
$txtb_DiskBaseLocation.Font      = 'Microsoft Sans Serif,10'

$btn_BrowseBaseDisk              = New-Object system.Windows.Forms.Button
$btn_BrowseBaseDisk.text         = "Browse..."
$btn_BrowseBaseDisk.width        = 70
$btn_BrowseBaseDisk.height       = 30
$btn_BrowseBaseDisk.location     = New-Object System.Drawing.Point(338,174)
$btn_BrowseBaseDisk.Font         = 'Microsoft Sans Serif,10'

$New_Forest.controls.AddRange(@($lb_ForestName,$pnl_ForestName,$pnl_ForestCustomName,$btn_Create,$lb_VMName,$txtb_VMName,$lb_EnterDiskLocation,$txtb_DiskLocation,$btn_Browse,$lb_EnterPass,$lb_Pass1,$lb_ConfirmPass,$txtb_Pass1,$txtb_Pass2,$lb_EnterIP,$lb_IP,$txtb_IP,$lb_ChooseVMSwitch,$pnl_ChooseSwitch,$lb_ChooseDiskBase,$txtb_DiskBaseLocation,$btn_BrowseBaseDisk))
$pnl_ForestName.controls.AddRange(@($rdbtn_DefaultForestName,$rdbtn_CustomForestName))
$pnl_ForestCustomName.controls.AddRange(@($txtb_ForestName))
$pnl_ChooseSwitch.controls.AddRange(@($cmb_ChooseVMSwitch))

$txtb_ForestName.Enabled = $false
$rdbtn_CustomForestName.add_CheckedChanged({

    if ($rdbtn_DefaultForestName.Checked){
        $txtb_ForestName.Enabled = $Fasle
        }
    else {
        $txtb_ForestName.Enabled = $True
        }
    })

    #disk_path
$btn_Browse.Add_Click({
    Add-Type -AssemblyName System.Windows.Forms
    $FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
    [void]$FolderBrowser.ShowDialog()
    $FolderBrowser.SelectedPath
    $txtb_DiskLocation.Text = $FolderBrowser.SelectedPath
})

$btn_BrowseBaseDisk.Add_Click({
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
   InitialDirectory = [Environment]::GetFolderPath('Desktop') 
  Filter = 'Disk (*.vhdx)|*.vhdx|Disk (*.vhd)|*.vhd'
}
[void]$FileBrowser.ShowDialog()
$txtb_DiskBaseLocation.Text = $FileBrowser.Filename
})

$switches = @((Get-VMSwitch).Name)
foreach ($switch in $switches){$cmb_ChooseVMSwitch.items.add($switch)}

function loadSwitch{
$selectedItem = $cmb_ChooseVMSwitch.selectedItem.toString()
return $selectedItem
}

$btn_Create.Add_Click({

    if ($rdbtn_DefaultForestName.Checked) {
        $domName = "ocean.local"
    }
    else {
        $domName = $txtb_ForestName.Text
    }

    $switch = loadSwitch

    $vhdName = $txtb_VMName.Text

    $end = $txtb_IP.Text

    $ip = "10.10.10."+$end

    $netbiosName = $domName.Substring(0,$domName.IndexOf("."))

    $netbiosName = $netbiosName.ToUpper()
    
    [string]$pass1 = $txtb_Pass1.Text
    [string]$pass2 = $txtb_Pass2.Text

    if($pass1 -ne $pass2){
        [System.Windows.Forms.MessageBox]::Show("Pases not mach", 'Attention', 'OK', 'Error')
        Return
    }

    [System.Windows.Forms.MessageBox]::Show("New forest process has been started", 'Attention', 'OK', 'Information')
    $pass = ConvertTo-SecureString $txtb_Pass1.Text -AsPlainText -Force

    $pathMach = $txtb_DiskLocation.Text + "\" + $txtb_VMName.Text +".vhdx"

    $disk = $txtb_DiskBaseLocation.Text

    New-VHD -ParentPath $disk -Path $pathMach 

    New-VM -Name $vhdName -MemoryStartupBytes 4GB -VHDPath $pathMach -Generation 2 -SwitchName $switch
    Set-Vm -Name $vhdName -AutomaticCheckpointsEnabled $false -ProcessorCount 4
    Start-VM $vhdName
    [System.Windows.Forms.MessageBox]::Show("Please wait 90s to start VM", 'Attention', 'OK', 'Information')
    Start-Sleep -Seconds 80
    [System.Windows.Forms.MessageBox]::Show("Installing new forest", 'Attention', 'OK', 'Information')
    Invoke-Command -VMName $vhdName  -ScriptBlock{ New-NetIPAddress -InterfaceAlias Ethernet  -IPAddress $args[0] -PrefixLength 8 -AddressFamily IPv4 
    Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses $args[0]
    Restart-NetAdapter -Name Ethernet
    Start-Sleep -Seconds 5
    Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
    Import-Module ADDSDeployment
    Install-ADDSForest `
    -CreateDnsDelegation:$false `
    -SafeModeAdministratorPassword $args[1] `
    -DatabasePath "C:\Windows\NTDS" `
    -DomainMode "WinThreshold" `
    -DomainName $args[2] `
    -DomainNetbiosName $args[3] `
    -ForestMode "WinThreshold" `
    -InstallDns:$true `
    -LogPath "C:\Windows\NTDS" `
    -NoRebootOnCompletion:$false `
    -SysvolPath "C:\Windows\SYSVOL" `
    -Force:$true } -Args $ip, $pass, $domName, $netbiosName
    [System.Windows.Forms.MessageBox]::Show("New forest installed succesfully", 'Attention', 'OK', 'Information')    

    
})


$New_Forest.ShowDialog()

