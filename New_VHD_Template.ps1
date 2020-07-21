<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    New_VHD_Template
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$New_VHD_Template                = New-Object system.Windows.Forms.Form
$New_VHD_Template.ClientSize     = '550,350'
$New_VHD_Template.text           = "New virtual disk template"
$New_VHD_Template.TopMost        = $false
$Icon                            = New-Object system.drawing.icon ($PSScriptRoot + "\icons\ikonka_dysk.ico")
$New_VHD_Template.Icon              = $Icon
$New_VHD_Template.FormBorderStyle  = 'FixedDialog'

$lb_DiskTemplateName             = New-Object system.Windows.Forms.Label
$lb_DiskTemplateName.text        = "Specify name of the template"
$lb_DiskTemplateName.AutoSize    = $true
$lb_DiskTemplateName.width       = 25
$lb_DiskTemplateName.height      = 10
$lb_DiskTemplateName.location    = New-Object System.Drawing.Point(10,6)
$lb_DiskTemplateName.Font        = 'Microsoft Sans Serif,12'

$txtb_DiskTemplateName           = New-Object system.Windows.Forms.TextBox
$txtb_DiskTemplateName.multiline  = $false
$txtb_DiskTemplateName.text      = "New virtual disk template"
$txtb_DiskTemplateName.width     = 300
$txtb_DiskTemplateName.height    = 30
$txtb_DiskTemplateName.location  = New-Object System.Drawing.Point(10,30)
$txtb_DiskTemplateName.Font      = 'Microsoft Sans Serif,10'

$btn_CreateDiskTemplate          = New-Object system.Windows.Forms.Button
$btn_CreateDiskTemplate.text     = "Create"
$btn_CreateDiskTemplate.width    = 90
$btn_CreateDiskTemplate.height   = 50
$btn_CreateDiskTemplate.location  = New-Object System.Drawing.Point(450,290)
$btn_CreateDiskTemplate.Font     = 'Microsoft Sans Serif,12,style=Bold'

$lb_ChooseDiskFormatTemplate     = New-Object system.Windows.Forms.Label
$lb_ChooseDiskFormatTemplate.text  = "Choose disk format"
$lb_ChooseDiskFormatTemplate.AutoSize  = $false
$lb_ChooseDiskFormatTemplate.width  = 150
$lb_ChooseDiskFormatTemplate.height  = 17
$lb_ChooseDiskFormatTemplate.location  = New-Object System.Drawing.Point(10,118)
$lb_ChooseDiskFormatTemplate.Font  = 'Microsoft Sans Serif,12'

$pnl_DiskFormatTemplate          = New-Object system.Windows.Forms.Panel
$pnl_DiskFormatTemplate.height   = 35
$pnl_DiskFormatTemplate.width    = 270
$pnl_DiskFormatTemplate.location  = New-Object System.Drawing.Point(5,140)

$rdbtn_VHDTemplate               = New-Object system.Windows.Forms.RadioButton
$rdbtn_VHDTemplate.text          = "VHD"
$rdbtn_VHDTemplate.AutoSize      = $true
$rdbtn_VHDTemplate.width         = 104
$rdbtn_VHDTemplate.height        = 20
$rdbtn_VHDTemplate.location      = New-Object System.Drawing.Point(8,5)
$rdbtn_VHDTemplate.Font          = 'Microsoft Sans Serif,10'

$rdbtn_VHDXTemplate              = New-Object system.Windows.Forms.RadioButton
$rdbtn_VHDXTemplate.text         = "VHDX"
$rdbtn_VHDXTemplate.AutoSize     = $true
$rdbtn_VHDXTemplate.width        = 104
$rdbtn_VHDXTemplate.height       = 20
$rdbtn_VHDXTemplate.location     = New-Object System.Drawing.Point(105,5)
$rdbtn_VHDXTemplate.Font         = 'Microsoft Sans Serif,10'
$rdbtn_VHDXTemplate.Checked      = $true

$lb_ChooseDiskTypeTemplate       = New-Object system.Windows.Forms.Label
$lb_ChooseDiskTypeTemplate.text  = "Choose disk type"
$lb_ChooseDiskTypeTemplate.AutoSize  = $true
$lb_ChooseDiskTypeTemplate.width  = 25
$lb_ChooseDiskTypeTemplate.height  = 10
$lb_ChooseDiskTypeTemplate.location  = New-Object System.Drawing.Point(10,179)
$lb_ChooseDiskTypeTemplate.Font  = 'Microsoft Sans Serif,12'

$Panel1                          = New-Object system.Windows.Forms.Panel
$Panel1.height                   = 35
$Panel1.width                    = 270
$Panel1.location                 = New-Object System.Drawing.Point(5,202)

$rdbtn_FixedSizeTemplate         = New-Object system.Windows.Forms.RadioButton
$rdbtn_FixedSizeTemplate.text    = "Fixed size"
$rdbtn_FixedSizeTemplate.AutoSize  = $true
$rdbtn_FixedSizeTemplate.width   = 104
$rdbtn_FixedSizeTemplate.height  = 20
$rdbtn_FixedSizeTemplate.location  = New-Object System.Drawing.Point(8,5)
$rdbtn_FixedSizeTemplate.Font    = 'Microsoft Sans Serif,10'

$rdbtn_DynamicallyExpandingTemplate   = New-Object system.Windows.Forms.RadioButton
$rdbtn_DynamicallyExpandingTemplate.text  = "Dynamically expanding"
$rdbtn_DynamicallyExpandingTemplate.AutoSize  = $true
$rdbtn_DynamicallyExpandingTemplate.width  = 104
$rdbtn_DynamicallyExpandingTemplate.height  = 20
$rdbtn_DynamicallyExpandingTemplate.location  = New-Object System.Drawing.Point(105,5)
$rdbtn_DynamicallyExpandingTemplate.Font  = 'Microsoft Sans Serif,10'
$rdbtn_DynamicallyExpandingTemplate.Checked  = $true

$lb_NameLocationDiskTemplate     = New-Object system.Windows.Forms.Label
$lb_NameLocationDiskTemplate.text  = "Specify location of the template"
$lb_NameLocationDiskTemplate.AutoSize  = $true
$lb_NameLocationDiskTemplate.width  = 25
$lb_NameLocationDiskTemplate.height  = 10
$lb_NameLocationDiskTemplate.location  = New-Object System.Drawing.Point(10,62)
$lb_NameLocationDiskTemplate.Font  = 'Microsoft Sans Serif,12'

$txtb_DiskTemplateLocation       = New-Object system.Windows.Forms.TextBox
$txtb_DiskTemplateLocation.multiline  = $false
$txtb_DiskTemplateLocation.width  = 300
$txtb_DiskTemplateLocation.height  = 30
$txtb_DiskTemplateLocation.location  = New-Object System.Drawing.Point(10,87)
$txtb_DiskTemplateLocation.Font  = 'Microsoft Sans Serif,10'

$btn_DiskTemplateLocation        = New-Object system.Windows.Forms.Button
$btn_DiskTemplateLocation.text   = "Browse..."
$btn_DiskTemplateLocation.width  = 70
$btn_DiskTemplateLocation.height  = 30
$btn_DiskTemplateLocation.location  = New-Object System.Drawing.Point(315,81)
$btn_DiskTemplateLocation.Font   = 'Microsoft Sans Serif,10'

$lb_SpecifyDiskTemplateSize      = New-Object system.Windows.Forms.Label
$lb_SpecifyDiskTemplateSize.text  = "Specify size of the disk"
$lb_SpecifyDiskTemplateSize.AutoSize  = $true
$lb_SpecifyDiskTemplateSize.width  = 25
$lb_SpecifyDiskTemplateSize.height  = 10
$lb_SpecifyDiskTemplateSize.location  = New-Object System.Drawing.Point(10,244)
$lb_SpecifyDiskTemplateSize.Font  = 'Microsoft Sans Serif,12'

$txtb_DiskSizeTemplate           = New-Object system.Windows.Forms.TextBox
$txtb_DiskSizeTemplate.multiline  = $false
$txtb_DiskSizeTemplate.width     = 125
$txtb_DiskSizeTemplate.height    = 20
$txtb_DiskSizeTemplate.location  = New-Object System.Drawing.Point(10,268)
$txtb_DiskSizeTemplate.Font      = 'Microsoft Sans Serif,10'

$lb_GB                           = New-Object system.Windows.Forms.Label
$lb_GB.text                      = "GB"
$lb_GB.AutoSize                  = $true
$lb_GB.width                     = 25
$lb_GB.height                    = 10
$lb_GB.location                  = New-Object System.Drawing.Point(141,272)
$lb_GB.Font                      = 'Microsoft Sans Serif,10'

$New_VHD_Template.controls.AddRange(@($lb_DiskTemplateName,$txtb_DiskTemplateName,$btn_CreateDiskTemplate,$lb_ChooseDiskFormatTemplate,$pnl_DiskFormatTemplate,$lb_ChooseDiskTypeTemplate,$Panel1,$lb_NameLocationDiskTemplate,$txtb_DiskTemplateLocation,$btn_DiskTemplateLocation,$lb_SpecifyDiskTemplateSize,$txtb_DiskSizeTemplate,$lb_GB))
$pnl_DiskFormatTemplate.controls.AddRange(@($rdbtn_VHDTemplate,$rdbtn_VHDXTemplate))
$Panel1.controls.AddRange(@($rdbtn_FixedSizeTemplate,$rdbtn_DynamicallyExpandingTemplate))

$btn_DiskTemplateLocation.Add_Click({
    Add-Type -AssemblyName System.Windows.Forms
    $FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
    [void]$FolderBrowser.ShowDialog()
    $FolderBrowser.SelectedPath
    $txtb_DiskTemplateLocation.Text = $FolderBrowser.SelectedPath
})

$btn_CreateDiskTemplate.Add_Click({
    if(!($txtb_DiskTemplateName.Text))
        {
            [System.Windows.Forms.MessageBox]::Show("Enter the name", 'Attention', 'OK', 'Error')
            Return
        }

    if(!($txtb_DiskTemplateLocation.Text))
        {
            [System.Windows.Forms.MessageBox]::Show("Select location", 'Attention', 'OK', 'Error')
            Return
        }

    if(!($txtb_DiskSizeTemplate.Text))
        {
            [System.Windows.Forms.MessageBox]::Show("Enter the size", 'Attention', 'OK', 'Error')
            Return
        }



    if($rdbtn_VHDTemplate.Checked){$diskFormat = "VHD"}
    else{$diskFormat = "VHDX"}

    if($rdbtn_FixedSizeTemplate.Checked){$diskType = "Fixed"}
    else{$diskType = "Dynamic"}

    #check_size_number
    try{
        [int]$sized = $txtb_DiskSizeTemplate.Text
    }
    catch{
        [System.Windows.Forms.MessageBox]::Show("Size must be a number", 'Attention', 'OK', 'Error')
        Return
    }

      $nazwaschmatudysku = $txtb_DiskTemplateName.Text
      $diskname = $txtb_DiskTemplateName.Text
      $path = $txtb_DiskTemplateLocation.Text + "\" + $diskname + ".csv"
      $size = [int]$sized * 1GB
            #powyzej wartosci z formatki
       New-Object -TypeName PSCustomObject -Property @{
       diskname= $diskname
       diskformat = $diskFormat
       disktype = $diskType
       size = $size

} | Export-Csv -Path $path -NoTypeInformation
[System.Windows.Forms.MessageBox]::Show("Template exported", 'Attention', 'OK', 'Information')

})


$New_VHD_Template.ShowDialog()
