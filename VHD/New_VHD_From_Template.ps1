<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    New_VHD_From_Template
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$New_VHD_From_Template           = New-Object system.Windows.Forms.Form
$New_VHD_From_Template.ClientSize  = '550,350'
$New_VHD_From_Template.text      = "New vitrual hard drive from template"
$New_VHD_From_Template.TopMost   = $false
$Icon                            = New-Object system.drawing.icon ($PSScriptRoot + "\icons\ikonka_dysk.ico")
$New_VHD_From_Template.Icon      = $Icon
$New_VHD_From_Template.FormBorderStyle  = 'FixedDialog'

$lb_ChooseDiskTemplate           = New-Object system.Windows.Forms.Label
$lb_ChooseDiskTemplate.text      = "Choose template for the new virtual disk"
$lb_ChooseDiskTemplate.AutoSize  = $true
$lb_ChooseDiskTemplate.width     = 25
$lb_ChooseDiskTemplate.height    = 10
$lb_ChooseDiskTemplate.location  = New-Object System.Drawing.Point(10,9)
$lb_ChooseDiskTemplate.Font      = 'Microsoft Sans Serif,12'

$txtb_TemplateName               = New-Object system.Windows.Forms.TextBox
$txtb_TemplateName.multiline     = $false
$txtb_TemplateName.width         = 287
$txtb_TemplateName.height        = 20
$txtb_TemplateName.location      = New-Object System.Drawing.Point(10,38)
$txtb_TemplateName.Font          = 'Microsoft Sans Serif,10'

$btn_SelectTemplate              = New-Object system.Windows.Forms.Button
$btn_SelectTemplate.text         = "Browse..."
$btn_SelectTemplate.width        = 70
$btn_SelectTemplate.height       = 30
$btn_SelectTemplate.location     = New-Object System.Drawing.Point(305,32)
$btn_SelectTemplate.Font         = 'Microsoft Sans Serif,10'

$lb_AboutTemplate                = New-Object system.Windows.Forms.Label
$lb_AboutTemplate.text           = "Disk will be created with following parameters:"
$lb_AboutTemplate.AutoSize       = $true
$lb_AboutTemplate.width          = 25
$lb_AboutTemplate.height         = 10
$lb_AboutTemplate.location       = New-Object System.Drawing.Point(10,70)
$lb_AboutTemplate.Font           = 'Microsoft Sans Serif,12'

$lb_DiskFormat                   = New-Object system.Windows.Forms.Label
$lb_DiskFormat.text              = "Format"
$lb_DiskFormat.AutoSize          = $true
$lb_DiskFormat.width             = 25
$lb_DiskFormat.height            = 10
$lb_DiskFormat.location          = New-Object System.Drawing.Point(10,100)
$lb_DiskFormat.Font              = 'Microsoft Sans Serif,10'


$lb_DiskType                     = New-Object system.Windows.Forms.Label
$lb_DiskType.text                = "Type"
$lb_DiskType.AutoSize            = $true
$lb_DiskType.width               = 25
$lb_DiskType.height              = 10
$lb_DiskType.location            = New-Object System.Drawing.Point(10,125)
$lb_DiskType.Font                = 'Microsoft Sans Serif,10'

$lb_DiskSize                     = New-Object system.Windows.Forms.Label
$lb_DiskSize.text                = "Size"
$lb_DiskSize.AutoSize            = $true
$lb_DiskSize.width               = 25
$lb_DiskSize.height              = 10
$lb_DiskSize.location            = New-Object System.Drawing.Point(10,150)
$lb_DiskSize.Font                = 'Microsoft Sans Serif,10'

$txtb_DiskFormat                 = New-Object system.Windows.Forms.TextBox
$txtb_DiskFormat.multiline       = $false
$txtb_DiskFormat.width           = 100
$txtb_DiskFormat.height          = 20
$txtb_DiskFormat.location        = New-Object System.Drawing.Point(63,95)
$txtb_DiskFormat.Font            = 'Microsoft Sans Serif,10'
$txtb_DiskFormat.Enabled = $false
$txtb_DiskFormat.BackColor = "#ffffff"

$txtb_DiskType                   = New-Object system.Windows.Forms.TextBox
$txtb_DiskType.multiline         = $false
$txtb_DiskType.width             = 100
$txtb_DiskType.height            = 20
$txtb_DiskType.location          = New-Object System.Drawing.Point(63,120)
$txtb_DiskType.Font              = 'Microsoft Sans Serif,10'
$txtb_DiskType.Enabled = $false
$txtb_DiskType.BackColor = "#ffffff"

$WinForm1                        = New-Object system.Windows.Forms.Form
$WinForm1.ClientSize             = '550,350'
$WinForm1.text                   = "New vitrual hard drive from template"
$WinForm1.TopMost                = $false

$txtb_DiskSize                   = New-Object system.Windows.Forms.TextBox
$txtb_DiskSize.multiline         = $false
$txtb_DiskSize.width             = 100
$txtb_DiskSize.height            = 20
$txtb_DiskSize.location          = New-Object System.Drawing.Point(63,145)
$txtb_DiskSize.Font              = 'Microsoft Sans Serif,10'
$txtb_DiskSize.Enabled = $false
$txtb_DiskSize.BackColor = "#ffffff"

$lb_GB                           = New-Object system.Windows.Forms.Label
$lb_GB.text                      = "GB"
$lb_GB.AutoSize                  = $true
$lb_GB.width                     = 25
$lb_GB.height                    = 10
$lb_GB.location                  = New-Object System.Drawing.Point(165,150)
$lb_GB.Font                      = 'Microsoft Sans Serif,10'

$lb_NameLocation                 = New-Object system.Windows.Forms.Label
$lb_NameLocation.text            = "Specify name and location of the new virtual disk"
$lb_NameLocation.AutoSize        = $true
$lb_NameLocation.width           = 25
$lb_NameLocation.height          = 10
$lb_NameLocation.location        = New-Object System.Drawing.Point(10,178)
$lb_NameLocation.Font            = 'Microsoft Sans Serif,12'

$txtb_DiskName                   = New-Object system.Windows.Forms.TextBox
$txtb_DiskName.multiline         = $false
$txtb_DiskName.width             = 287
$txtb_DiskName.height            = 20
$txtb_DiskName.location          = New-Object System.Drawing.Point(74,202)
$txtb_DiskName.Font              = 'Microsoft Sans Serif,10'

$lb_DiskName                     = New-Object system.Windows.Forms.Label
$lb_DiskName.text                = "Name:"
$lb_DiskName.AutoSize            = $true
$lb_DiskName.width               = 25
$lb_DiskName.height              = 10
$lb_DiskName.location            = New-Object System.Drawing.Point(10,207)
$lb_DiskName.Font                = 'Microsoft Sans Serif,10'

$lb_DiskLocation                 = New-Object system.Windows.Forms.Label
$lb_DiskLocation.text            = "Location:"
$lb_DiskLocation.AutoSize        = $true
$lb_DiskLocation.width           = 25
$lb_DiskLocation.height          = 10
$lb_DiskLocation.location        = New-Object System.Drawing.Point(10,232)
$lb_DiskLocation.Font            = 'Microsoft Sans Serif,10'

$txtb_DiskLocation               = New-Object system.Windows.Forms.TextBox
$txtb_DiskLocation.multiline     = $false
$txtb_DiskLocation.width         = 287
$txtb_DiskLocation.height        = 20
$txtb_DiskLocation.location      = New-Object System.Drawing.Point(74,227)
$txtb_DiskLocation.Font          = 'Microsoft Sans Serif,10'

$btn_BrowseDiskLocation          = New-Object system.Windows.Forms.Button
$btn_BrowseDiskLocation.text     = "Browse..."
$btn_BrowseDiskLocation.width    = 70
$btn_BrowseDiskLocation.height   = 30
$btn_BrowseDiskLocation.location  = New-Object System.Drawing.Point(369,221)
$btn_BrowseDiskLocation.Font     = 'Microsoft Sans Serif,10'

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Create"
$Button1.width                   = 90
$Button1.height                  = 50
$Button1.Anchor                  = 'right,bottom'
$Button1.location                = New-Object System.Drawing.Point(450,290)
$Button1.Font                    = 'Microsoft Sans Serif,12,style=Bold'

$New_VHD_From_Template.controls.AddRange(@($lb_ChooseDiskTemplate,$txtb_TemplateName,$btn_SelectTemplate,$lb_AboutTemplate,$lb_DiskFormat,$lb_DiskType,$lb_DiskSize,$txtb_DiskFormat,$txtb_DiskType,$txtb_DiskSize,$lb_GB,$lb_NameLocation,$txtb_DiskName,$lb_DiskName,$lb_DiskLocation,$txtb_DiskLocation,$btn_BrowseDiskLocation,$Button1))

#btn_template
$btn_SelectTemplate.Add_Click({
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
   InitialDirectory = [Environment]::GetFolderPath('Desktop') 
  Filter = 'Template (*.csv)|*.csv'
}
[void]$FileBrowser.ShowDialog()
$txtb_TemplateName.Text = $FileBrowser.Filename
})

#btn_disk
$btn_BrowseDiskLocation.Add_Click({
    Add-Type -AssemblyName System.Windows.Forms
    $FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
    [void]$FolderBrowser.ShowDialog()
    $FolderBrowser.SelectedPath
    $txtb_DiskLocation.Text = $FolderBrowser.SelectedPath
})

#add_parameters
$txtb_TemplateName.Add_TextChanged({
    $P = Import-Csv -Path $txtb_TemplateName.Text
    $txtb_DiskFormat.Text = $P.diskformat
    $txtb_DiskType.Text = $P.disktype
    $txtb_DiskSize.Text = $P.size / 1GB
    #[System.Windows.Forms.MessageBox]::Show("$P", 'Attention', 'OK', 'Information')
})


$Button1.Add_Click({

    if(!($txtb_TemplateName.Text))
        {
            [System.Windows.Forms.MessageBox]::Show("Sekect template", 'Attention', 'OK', 'Error')
            Return
        }

    if(!($txtb_DiskName.Text))
    {
        [System.Windows.Forms.MessageBox]::Show("Enter the name", 'Attention', 'OK', 'Error')
        Return
    }

    if(!($txtb_DiskLocation.Text))
    {
        [System.Windows.Forms.MessageBox]::Show("Enter the name", 'Attention', 'OK', 'Error')
        Return
    }

    $path = $txtb_DiskLocation.Text + "\" + $txtb_DiskName.Text + "." + $txtb_DiskFormat.Text
    [int]$size = $txtb_DiskSize.Text
    
    if ($txtb_DiskType.Text -eq 'Dynamic'){New-VHD -Path $path -SizeBytes ([int]$size * 1GB) -Dynamic}
    elseif ($txtb_DiskType.Text -eq 'Fixed'){New-VHD -Path $path -SizeBytes ([int]$size * 1GB) -Fixed}
    [System.Windows.Forms.MessageBox]::Show("Disk has been created", 'Attention', 'OK', 'Information')
    
})

$New_VHD_From_Template.ShowDialog()