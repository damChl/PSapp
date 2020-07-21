<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    New_Virtual_HD
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$New_VirtualHardDrive            = New-Object system.Windows.Forms.Form
$New_VirtualHardDrive.ClientSize  = '550,350'
$New_VirtualHardDrive.text       = "New virtual hard drive"
$New_VirtualHardDrive.TopMost    = $false
$Icon                            = New-Object system.drawing.icon ($PSScriptRoot + "\icons\ikonka_dysk.ico")
$New_VirtualHardDrive.Icon       = $Icon
$New_VirtualHardDrive.FormBorderStyle  = 'FixedDialog'

$lb_ChooseDiskFormats            = New-Object system.Windows.Forms.Label
$lb_ChooseDiskFormats.text       = "Choose disk format"
$lb_ChooseDiskFormats.AutoSize   = $false
$lb_ChooseDiskFormats.width      = 140
$lb_ChooseDiskFormats.height     = 15
$lb_ChooseDiskFormats.location   = New-Object System.Drawing.Point(10,10)
$lb_ChooseDiskFormats.Font       = 'Microsoft Sans Serif,12'

$pnl_DiskFormats                 = New-Object system.Windows.Forms.Panel
$pnl_DiskFormats.height          = 30
$pnl_DiskFormats.width           = 270
$pnl_DiskFormats.location        = New-Object System.Drawing.Point(5,30)

$rdbtn_VHD                       = New-Object system.Windows.Forms.RadioButton
$rdbtn_VHD.text                  = "VHD"
$rdbtn_VHD.AutoSize              = $true
$rdbtn_VHD.width                 = 104
$rdbtn_VHD.height                = 20
$rdbtn_VHD.location              = New-Object System.Drawing.Point(7,5)
$rdbtn_VHD.Font                  = 'Microsoft Sans Serif,10'

$rdbtn_VHDX                      = New-Object system.Windows.Forms.RadioButton
$rdbtn_VHDX.text                 = "VHDX"
$rdbtn_VHDX.AutoSize             = $true
$rdbtn_VHDX.width                = 104
$rdbtn_VHDX.height               = 20
$rdbtn_VHDX.location             = New-Object System.Drawing.Point(100,5)
$rdbtn_VHDX.Font                 = 'Microsoft Sans Serif,10'
$rdbtn_VHDX.Checked              = $true

$pnl_DiskTypes                   = New-Object system.Windows.Forms.Panel
$pnl_DiskTypes.height            = 30
$pnl_DiskTypes.width             = 400
$pnl_DiskTypes.location          = New-Object System.Drawing.Point(5,92)

$lb_DiskTypes                    = New-Object system.Windows.Forms.Label
$lb_DiskTypes.text               = "Choose disk type"
$lb_DiskTypes.AutoSize           = $false
$lb_DiskTypes.width              = 135
$lb_DiskTypes.height             = 20
$lb_DiskTypes.location           = New-Object System.Drawing.Point(10,70)
$lb_DiskTypes.Font               = 'Microsoft Sans Serif,12'

$rdbtn_FixedSize                 = New-Object system.Windows.Forms.RadioButton
$rdbtn_FixedSize.text            = "Fixed size"
$rdbtn_FixedSize.AutoSize        = $true
$rdbtn_FixedSize.width           = 104
$rdbtn_FixedSize.height          = 20
$rdbtn_FixedSize.location        = New-Object System.Drawing.Point(7,5)
$rdbtn_FixedSize.Font            = 'Microsoft Sans Serif,10'

$rdbtn_DyncamicallyExpanding     = New-Object system.Windows.Forms.RadioButton
$rdbtn_DyncamicallyExpanding.text  = "Dynamically expanding"
$rdbtn_DyncamicallyExpanding.AutoSize  = $true
$rdbtn_DyncamicallyExpanding.width  = 104
$rdbtn_DyncamicallyExpanding.height  = 20
$rdbtn_DyncamicallyExpanding.location  = New-Object System.Drawing.Point(100,5)
$rdbtn_DyncamicallyExpanding.Font  = 'Microsoft Sans Serif,10'
$rdbtn_DyncamicallyExpanding.Checked = $true

$rdbtn_Differencing              = New-Object system.Windows.Forms.RadioButton
$rdbtn_Differencing.text         = "Differencing"
$rdbtn_Differencing.AutoSize     = $true
$rdbtn_Differencing.width        = 104
$rdbtn_Differencing.height       = 20
$rdbtn_Differencing.location     = New-Object System.Drawing.Point(270,5)
$rdbtn_Differencing.Font         = 'Microsoft Sans Serif,10'

$lb_ChooseParentDisk             = New-Object system.Windows.Forms.Label
$lb_ChooseParentDisk.text        = "Choose parent disk"
$lb_ChooseParentDisk.AutoSize    = $false
$lb_ChooseParentDisk.width       = 160
$lb_ChooseParentDisk.height      = 20
$lb_ChooseParentDisk.location    = New-Object System.Drawing.Point(10,130)
$lb_ChooseParentDisk.Font        = 'Microsoft Sans Serif,12'

$pnl_ChooseParentDisk            = New-Object system.Windows.Forms.Panel
$pnl_ChooseParentDisk.height     = 35
$pnl_ChooseParentDisk.width      = 450
$pnl_ChooseParentDisk.location   = New-Object System.Drawing.Point(5,150)

$btn_ChooseParentDisk            = New-Object system.Windows.Forms.Button
$btn_ChooseParentDisk.text       = "Browse..."
$btn_ChooseParentDisk.width      = 70
$btn_ChooseParentDisk.height     = 30
$btn_ChooseParentDisk.location   = New-Object System.Drawing.Point(365,3)
$btn_ChooseParentDisk.Font       = 'Microsoft Sans Serif,10'

$lb_DiskNameAndPath              = New-Object system.Windows.Forms.Label
$lb_DiskNameAndPath.text         = "Select name and location"
$lb_DiskNameAndPath.AutoSize     = $false
$lb_DiskNameAndPath.width        = 200
$lb_DiskNameAndPath.height       = 17
$lb_DiskNameAndPath.location     = New-Object System.Drawing.Point(10,194)
$lb_DiskNameAndPath.Font         = 'Microsoft Sans Serif,12'

$txtb_ChooseDiskParent           = New-Object system.Windows.Forms.TextBox
$txtb_ChooseDiskParent.multiline  = $false
$txtb_ChooseDiskParent.width     = 355
$txtb_ChooseDiskParent.height    = 25
$txtb_ChooseDiskParent.location  = New-Object System.Drawing.Point(5,9)
$txtb_ChooseDiskParent.Font      = 'Microsoft Sans Serif,10'

$lb_DiskName                     = New-Object system.Windows.Forms.Label
$lb_DiskName.text                = "Name:"
$lb_DiskName.AutoSize            = $true
$lb_DiskName.width               = 25
$lb_DiskName.height              = 10
$lb_DiskName.location            = New-Object System.Drawing.Point(10,225)
$lb_DiskName.Font                = 'Microsoft Sans Serif,10'

$lb_Location                     = New-Object system.Windows.Forms.Label
$lb_Location.text                = "Location:"
$lb_Location.AutoSize            = $true
$lb_Location.width               = 63
$lb_Location.height              = 10
$lb_Location.location            = New-Object System.Drawing.Point(10,250)
$lb_Location.Font                = 'Microsoft Sans Serif,10'

$txtb_DiskLocation               = New-Object system.Windows.Forms.TextBox
$txtb_DiskLocation.multiline     = $false
$txtb_DiskLocation.width         = 355
$txtb_DiskLocation.height        = 20
$txtb_DiskLocation.location      = New-Object System.Drawing.Point(73,245)
$txtb_DiskLocation.Font          = 'Microsoft Sans Serif,10'

$txtb_DiskName                   = New-Object system.Windows.Forms.TextBox
$txtb_DiskName.multiline         = $false
$txtb_DiskName.width             = 355
$txtb_DiskName.height            = 20
$txtb_DiskName.location          = New-Object System.Drawing.Point(73,220)
$txtb_DiskName.Font              = 'Microsoft Sans Serif,10'

$btn_DiskLocation                = New-Object system.Windows.Forms.Button
$btn_DiskLocation.text           = "Browse..."
$btn_DiskLocation.width          = 70
$btn_DiskLocation.height         = 30
$btn_DiskLocation.location       = New-Object System.Drawing.Point(433,239)
$btn_DiskLocation.Font           = 'Microsoft Sans Serif,10'

$lb_ChooseDiskSize               = New-Object system.Windows.Forms.Label
$lb_ChooseDiskSize.text          = "Specify size of the disk"
$lb_ChooseDiskSize.AutoSize      = $true
$lb_ChooseDiskSize.width         = 25
$lb_ChooseDiskSize.height        = 10
$lb_ChooseDiskSize.location      = New-Object System.Drawing.Point(10,284)
$lb_ChooseDiskSize.Font          = 'Microsoft Sans Serif,12'

$txtb_DiskSize                   = New-Object system.Windows.Forms.TextBox
$txtb_DiskSize.multiline         = $false
$txtb_DiskSize.width             = 120
$txtb_DiskSize.height            = 20
$txtb_DiskSize.location          = New-Object System.Drawing.Point(5,5)
$txtb_DiskSize.Font              = 'Microsoft Sans Serif,10'

$lb_DiskGB                       = New-Object system.Windows.Forms.Label
$lb_DiskGB.text                  = "GB"
$lb_DiskGB.AutoSize              = $true
$lb_DiskGB.width                 = 25
$lb_DiskGB.height                = 10
$lb_DiskGB.location              = New-Object System.Drawing.Point(133,315)
$lb_DiskGB.Font                  = 'Microsoft Sans Serif,10'

$pnl_DiskSize                    = New-Object system.Windows.Forms.Panel
$pnl_DiskSize.height             = 31
$pnl_DiskSize.width              = 128
$pnl_DiskSize.location           = New-Object System.Drawing.Point(5,305)

$btn_CreateHD                    = New-Object system.Windows.Forms.Button
$btn_CreateHD.text               = "Create"
$btn_CreateHD.width              = 90
$btn_CreateHD.height             = 50
$btn_CreateHD.Anchor             = 'right,bottom'
$btn_CreateHD.location           = New-Object System.Drawing.Point(450,290)
$btn_CreateHD.Font               = 'Microsoft Sans Serif,12,style=Bold'

$New_VirtualHardDrive.controls.AddRange(@($lb_ChooseDiskFormats,$pnl_DiskFormats,$pnl_DiskTypes,$lb_DiskTypes,$lb_ChooseParentDisk,$pnl_ChooseParentDisk,$lb_DiskNameAndPath,$lb_DiskName,$lb_Location,$txtb_DiskLocation,$txtb_DiskName,$btn_DiskLocation,$lb_ChooseDiskSize,$lb_DiskGB,$pnl_DiskSize,$btn_CreateHD))
$pnl_DiskFormats.controls.AddRange(@($rdbtn_VHD,$rdbtn_VHDX))
$pnl_DiskTypes.controls.AddRange(@($rdbtn_FixedSize,$rdbtn_DyncamicallyExpanding,$rdbtn_Differencing))
$pnl_ChooseParentDisk.controls.AddRange(@($btn_ChooseParentDisk,$txtb_ChooseDiskParent))
$pnl_DiskSize.controls.AddRange(@($txtb_DiskSize))

#disk_type
$txtb_ChooseDiskParent.Enabled = $false
$btn_ChooseParentDisk.Enabled = $false
$rdbtn_Differencing.add_CheckedChanged({
    if ($rdbtn_Differencing.Checked){
        $txtb_ChooseDiskParent.Enabled = $true
        $btn_ChooseParentDisk.Enabled = $true
        $txtb_DiskSize.Enabled = $fasle
        }
    else {$txtb_ChooseDiskParent.Enabled = $false
        $btn_ChooseParentDisk.Enabled = $false
        $txtb_DiskSize.Enabled = $true
        }
    })


#button_parent
$btn_ChooseParentDisk.Add_Click({
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
    InitialDirectory = [Environment]::GetFolderPath('Desktop') 
    Filter = 'Disk (*.vhdx)|*.vhdx|Disk (*.vhd)|*.vhd'
    }
[void]$FileBrowser.ShowDialog()
$txtb_ChooseDiskParent.Text = $FileBrowser.Filename
})

#disk_path
$btn_DiskLocation.Add_Click({
    Add-Type -AssemblyName System.Windows.Forms
    $FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
    [void]$FolderBrowser.ShowDialog()
    $FolderBrowser.SelectedPath
    $txtb_DiskLocation.Text = $FolderBrowser.SelectedPath
})


$btn_CreateHD.Add_Click({

    #generation
    if($rdbtn_VHD.Checked){$type = "vhd"}
    elseif($rdbtn_VHDX.Checked){$type = "vhdx"}
     
    $diskname = $txtb_DiskName.Text

    #err_diskname
    if(!($diskname)){
        [System.Windows.Forms.MessageBox]::Show("Please give the name", 'Attention', 'OK', 'Error')
        Return
    }

    $path = $txtb_DiskLocation.Text + "\" + "$diskname" + "." + $type

    #make_new_folder
    $path2 = $txtb_DiskLocation.Text + "\"

    If (!(test-path $path2))
    {
        New-Item -Path $path2 -ItemType "directory"
    }


    #err_path
    if(!($txtb_DiskLocation.Text)){
    [System.Windows.Forms.MessageBox]::Show("Please select path", 'Attention', 'OK', 'Error')
    Return
    }

    #check_size_number
    try{
        [int]$size = $txtb_DiskSize.Text 
    }
    catch{
        [System.Windows.Forms.MessageBox]::Show("Size must be a number", 'Attention', 'OK', 'Information')
        Return
    }



    if ($rdbtn_FixedSize.Checked){    

    $pathDisk = $path.Substring(0,$path.IndexOf("\"))
    $filterDisk = "DeviceID='$pathDisk'"
    $disk = Get-WmiObject Win32_LogicalDisk -ComputerName localhost -Filter $filterDisk | Select-Object {$_.FreeSpace/1GB}    

    if(!($size))
    {
        [System.Windows.Forms.MessageBox]::Show("Please give the size", 'Attention', 'OK', 'Error')
        Return
    }
    

    #free_space
    if($size -gt $disk.'$_.FreeSpace/1GB')
    {
        [System.Windows.Forms.MessageBox]::Show("There is no enough space", 'Attention', 'OK', 'Error')
        Return
    }
    
    New-VHD -Path $path -SizeBytes ([int]$size * 1GB) -Fixed
    }

    elseif ($rdbtn_DyncamicallyExpanding.Checked){
        if(!($size))
    {
        [System.Windows.Forms.MessageBox]::Show("Please give the size", 'Attention', 'OK', 'Error')
        Return
    }
        
    $size = $txtb_DiskSize.Text
    New-VHD -Path $path -SizeBytes ([int]$size * 1GB) -Dynamic
    }

    elseif ($rdbtn_Differencing.Checked){

    #err_parent
    if(!($txtb_ChooseDiskParent.Text)){
        [System.Windows.Forms.MessageBox]::Show("Please select parent disk", 'Attention', 'OK', 'Error')
        Return
    }

    $parent = $txtb_ChooseDiskParent.Text


    #err_parent_exist
    If (!(test-path $parent)){
        [System.Windows.Forms.MessageBox]::Show("There is no such disk", 'Attention', 'OK', 'Information')
        Return
        }

    New-VHD -ParentPath $parent -Path $path    
    }

    [System.Windows.Forms.MessageBox]::Show("Virtual Hard Drive $diskname has been created", 'Attention', 'OK', 'Information')   

})

$New_VirtualHardDrive.ShowDialog()