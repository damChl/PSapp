<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    New_VM_Template
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$New_VM_Template                 = New-Object system.Windows.Forms.Form
$New_VM_Template.ClientSize      = '550,350'
$New_VM_Template.text            = "New virtual machine template"
$New_VM_Template.TopMost         = $false
$Icon                            = New-Object system.drawing.icon ($PSScriptRoot + "\icons\ikonka_maszyna_środowisko.ico")
$New_VM_Template.Icon              = $Icon
$New_VM_Template.FormBorderStyle  = 'FixedDialog'

$lb_VMTemplateName               = New-Object system.Windows.Forms.Label
$lb_VMTemplateName.text          = "Specify name of the template"
$lb_VMTemplateName.AutoSize      = $true
$lb_VMTemplateName.width         = 25
$lb_VMTemplateName.height        = 10
$lb_VMTemplateName.location      = New-Object System.Drawing.Point(10,10)
$lb_VMTemplateName.Font          = 'Microsoft Sans Serif,12'

$txtb_TemplateName               = New-Object system.Windows.Forms.TextBox
$txtb_TemplateName.multiline     = $false
$txtb_TemplateName.text          = "New VM template"
$txtb_TemplateName.width         = 242
$txtb_TemplateName.height        = 20
$txtb_TemplateName.location      = New-Object System.Drawing.Point(10,38)
$txtb_TemplateName.Font          = 'Microsoft Sans Serif,10'

$lb_TemplateLocation             = New-Object system.Windows.Forms.Label
$lb_TemplateLocation.text        = "Specify location of the template"
$lb_TemplateLocation.AutoSize    = $true
$lb_TemplateLocation.width       = 25
$lb_TemplateLocation.height      = 10
$lb_TemplateLocation.location    = New-Object System.Drawing.Point(10,70)
$lb_TemplateLocation.Font        = 'Microsoft Sans Serif,12'

$txtb_TemplateLocation           = New-Object system.Windows.Forms.TextBox
$txtb_TemplateLocation.multiline  = $false
$txtb_TemplateLocation.width     = 242
$txtb_TemplateLocation.height    = 20
$txtb_TemplateLocation.location  = New-Object System.Drawing.Point(10,100)
$txtb_TemplateLocation.Font      = 'Microsoft Sans Serif,10'

$btn_TemplateLocation            = New-Object system.Windows.Forms.Button
$btn_TemplateLocation.text       = "Browse..."
$btn_TemplateLocation.width      = 70
$btn_TemplateLocation.height     = 30
$btn_TemplateLocation.location   = New-Object System.Drawing.Point(260,94)
$btn_TemplateLocation.Font       = 'Microsoft Sans Serif,10'

$lb_VMRAM                        = New-Object system.Windows.Forms.Label
$lb_VMRAM.text                   = "Specify amount of RAM and CPU cores for a VM created from this template"
$lb_VMRAM.AutoSize               = $true
$lb_VMRAM.width                  = 25
$lb_VMRAM.height                 = 10
$lb_VMRAM.location               = New-Object System.Drawing.Point(10,130)
$lb_VMRAM.Font                   = 'Microsoft Sans Serif,12'

$lb_GB                           = New-Object system.Windows.Forms.Label
$lb_GB.text                      = "GB"
$lb_GB.AutoSize                  = $true
$lb_GB.width                     = 25
$lb_GB.height                    = 10
$lb_GB.location                  = New-Object System.Drawing.Point(159,157)
$lb_GB.Font                      = 'Microsoft Sans Serif,10'

$txtb_VMRAM                      = New-Object system.Windows.Forms.TextBox
$txtb_VMRAM.multiline            = $false
$txtb_VMRAM.text                 = "1"
$txtb_VMRAM.width                = 100
$txtb_VMRAM.height               = 20
$txtb_VMRAM.location             = New-Object System.Drawing.Point(57,155)
$txtb_VMRAM.Font                 = 'Microsoft Sans Serif,10'

$txtb_VMCores                    = New-Object system.Windows.Forms.TextBox
$txtb_VMCores.multiline          = $false
$txtb_VMCores.text               = "1"
$txtb_VMCores.width              = 100
$txtb_VMCores.height             = 20
$txtb_VMCores.location           = New-Object System.Drawing.Point(57,185)
$txtb_VMCores.Font               = 'Microsoft Sans Serif,10'

$lb_VMNetworking                 = New-Object system.Windows.Forms.Label
$lb_VMNetworking.text            = "Configure networking for a VM created from this template"
$lb_VMNetworking.AutoSize        = $true
$lb_VMNetworking.width           = 25
$lb_VMNetworking.height          = 10
$lb_VMNetworking.location        = New-Object System.Drawing.Point(10,278)
$lb_VMNetworking.Font            = 'Microsoft Sans Serif,12'

$pnl_VMNetworking                = New-Object system.Windows.Forms.Panel
$pnl_VMNetworking.height         = 39
$pnl_VMNetworking.width          = 276
$pnl_VMNetworking.location       = New-Object System.Drawing.Point(0,301)

$cmb_VMNetworking                = New-Object system.Windows.Forms.ComboBox
$cmb_VMNetworking.width          = 242
$cmb_VMNetworking.height         = 20
$cmb_VMNetworking.location       = New-Object System.Drawing.Point(10,10)
$cmb_VMNetworking.Font           = 'Microsoft Sans Serif,10'

$btn_Create                      = New-Object system.Windows.Forms.Button
$btn_Create.text                 = "Create"
$btn_Create.width                = 90
$btn_Create.height               = 50
$btn_Create.location             = New-Object System.Drawing.Point(450,290)
$btn_Create.Font                 = 'Microsoft Sans Serif,12,style=Bold'

$lb_Cores                        = New-Object system.Windows.Forms.Label
$lb_Cores.text                   = "Cores:"
$lb_Cores.AutoSize               = $true
$lb_Cores.width                  = 25
$lb_Cores.height                 = 10
$lb_Cores.location               = New-Object System.Drawing.Point(10,190)
$lb_Cores.Font                   = 'Microsoft Sans Serif,10'

$lb_RAM                          = New-Object system.Windows.Forms.Label
$lb_RAM.text                     = "RAM:"
$lb_RAM.AutoSize                 = $true
$lb_RAM.width                    = 25
$lb_RAM.height                   = 10
$lb_RAM.location                 = New-Object System.Drawing.Point(10,160)
$lb_RAM.Font                     = 'Microsoft Sans Serif,10'

$lb_Generation                   = New-Object system.Windows.Forms.Label
$lb_Generation.text              = "Select generation for a VM created from this template"
$lb_Generation.AutoSize          = $true
$lb_Generation.width             = 25
$lb_Generation.height            = 10
$lb_Generation.location          = New-Object System.Drawing.Point(10,214)
$lb_Generation.Font              = 'Microsoft Sans Serif,12'

$pnl_Generation                  = New-Object system.Windows.Forms.Panel
$pnl_Generation.height           = 37
$pnl_Generation.width            = 311
$pnl_Generation.location         = New-Object System.Drawing.Point(0,233)

$rdbtn_Generation1               = New-Object system.Windows.Forms.RadioButton
$rdbtn_Generation1.text          = "Generation 1"
$rdbtn_Generation1.AutoSize      = $true
$rdbtn_Generation1.width         = 104
$rdbtn_Generation1.height        = 20
$rdbtn_Generation1.location      = New-Object System.Drawing.Point(10,10)
$rdbtn_Generation1.Font          = 'Microsoft Sans Serif,10'

$rdbtn_Generation2               = New-Object system.Windows.Forms.RadioButton
$rdbtn_Generation2.text          = "Generation 2"
$rdbtn_Generation2.AutoSize      = $true
$rdbtn_Generation2.width         = 104
$rdbtn_Generation2.height        = 20
$rdbtn_Generation2.location      = New-Object System.Drawing.Point(150,10)
$rdbtn_Generation2.Font          = 'Microsoft Sans Serif,10'
$rdbtn_Generation2.Checked       = $true

$New_VM_Template.controls.AddRange(@($lb_VMTemplateName,$txtb_TemplateName,$lb_TemplateLocation,$txtb_TemplateLocation,$btn_TemplateLocation,$lb_VMRAM,$lb_GB,$txtb_VMRAM,$txtb_VMCores,$lb_VMNetworking,$pnl_VMNetworking,$btn_Create,$lb_Cores,$lb_RAM,$lb_Generation,$pnl_Generation))
$pnl_VMNetworking.controls.AddRange(@($cmb_VMNetworking))
$pnl_Generation.controls.AddRange(@($rdbtn_Generation1,$rdbtn_Generation2))

$btn_TemplateLocation.Add_Click({
    Add-Type -AssemblyName System.Windows.Forms
    $FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
    [void]$FolderBrowser.ShowDialog()
    $FolderBrowser.SelectedPath
    $txtb_TemplateLocation.Text = $FolderBrowser.SelectedPath
})

#adapters 
$adapters = @((Get-VMSwitch).Name)
foreach ($adapter in $adapters){$cmb_VMNetworking.items.add($adapter)}

function loadSwitch{
$selectedItem = $cmb_VMNetworking.selectedItem.toString()
return $selectedItem
}


$btn_Create.Add_Click({

    if(!($txtb_TemplateName.Text))
        {
            [System.Windows.Forms.MessageBox]::Show("Enter the name", 'Attention', 'OK', 'Error')
            Return
        }

    if(!($txtb_TemplateLocation.Text))
        {
            [System.Windows.Forms.MessageBox]::Show("Select location", 'Attention', 'OK', 'Error')
            Return
        }

    if(!($txtb_VMRAM.Text))
        {
            [System.Windows.Forms.MessageBox]::Show("Enter the RAM", 'Attention', 'OK', 'Error')
            Return
        }
    if(!($txtb_VMCores.Text))
        {
            [System.Windows.Forms.MessageBox]::Show("Enter cores", 'Attention', 'OK', 'Error')
            Return
        }

    if(!($cmb_VMNetworking.Text))
        {
            [System.Windows.Forms.MessageBox]::Show("Select switch", 'Attention', 'OK', 'Error')
            Return
        }



    if($rdbtn_Generation2.Checked){$genere = "2"}
    else{$genere = "1"}

    #check_size_number
    try{
        [int]$sizeR = $txtb_VMRAM.Text
    }
    catch{
        [System.Windows.Forms.MessageBox]::Show("Ram must be a number", 'Attention', 'OK', 'Error')
        Return
    }

        #check_size_number
    try{
        [int]$cores = $txtb_VMCores.text
    }
    catch{
        [System.Windows.Forms.MessageBox]::Show("Core must be a number", 'Attention', 'OK', 'Error')
        Return
    }

      $templateName = $txtb_TemplateName.Text
      $path = $txtb_TemplateLocation.Text + "\" + $txtb_TemplateName.Text + ".csv"
      
      $switch = loadSwitch
        #powyzej wartosci z formatki
    New-Object -TypeName PSCustomObject -Property @{
    MemoryStartup= [int]$sizeR * 1GB

    ProcCount = $cores

    Generation = $genere
    Switch = $switch
    } | Export-Csv -Path $path -NoTypeInformation
    [System.Windows.Forms.MessageBox]::Show("Template has been exported", 'Attention', 'OK', 'Information')

})


$New_VM_Template.ShowDialog()