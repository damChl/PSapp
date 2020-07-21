<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Delete_VM
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Delete_VM                       = New-Object system.Windows.Forms.Form
$Delete_VM.ClientSize            = '549,200'
$Delete_VM.text                  = "Delete a virtual machine"
$Delete_VM.TopMost               = $false
$Icon                            = New-Object system.drawing.icon ($PSScriptRoot + "\icons\ikonka_maszyna_środowisko.ico")
$Delete_VM.Icon                  = $Icon
$Delete_VM.FormBorderStyle  = 'FixedDialog'

$lb_SelectVM                     = New-Object system.Windows.Forms.Label
$lb_SelectVM.text                = "Select the virtual machine to delete"
$lb_SelectVM.AutoSize            = $true
$lb_SelectVM.width               = 25
$lb_SelectVM.height              = 10
$lb_SelectVM.location            = New-Object System.Drawing.Point(10,10)
$lb_SelectVM.Font                = 'Microsoft Sans Serif,12'

$pnl_SelectVM                    = New-Object system.Windows.Forms.Panel
$pnl_SelectVM.height             = 36
$pnl_SelectVM.width              = 414
$pnl_SelectVM.location           = New-Object System.Drawing.Point(0,32)

$cmb_SelectVM                    = New-Object system.Windows.Forms.ComboBox
$cmb_SelectVM.width              = 395
$cmb_SelectVM.height             = 20
$cmb_SelectVM.location           = New-Object System.Drawing.Point(10,6)
$cmb_SelectVM.Font               = 'Microsoft Sans Serif,10'

$lb_OSVHDDelete                  = New-Object system.Windows.Forms.Label
$lb_OSVHDDelete.text             = "Do You want to delete VM`'s main virtual disk?"
$lb_OSVHDDelete.AutoSize         = $true
$lb_OSVHDDelete.width            = 25
$lb_OSVHDDelete.height           = 10
$lb_OSVHDDelete.location         = New-Object System.Drawing.Point(10,75)
$lb_OSVHDDelete.Font             = 'Microsoft Sans Serif,12'

$pnl_DeleteOSVHD                 = New-Object system.Windows.Forms.Panel
$pnl_DeleteOSVHD.height          = 36
$pnl_DeleteOSVHD.width           = 414
$pnl_DeleteOSVHD.location        = New-Object System.Drawing.Point(0,98)

$rdbtn_Yes                       = New-Object system.Windows.Forms.RadioButton
$rdbtn_Yes.text                  = "Yes"
$rdbtn_Yes.AutoSize              = $true
$rdbtn_Yes.width                 = 104
$rdbtn_Yes.height                = 20
$rdbtn_Yes.location              = New-Object System.Drawing.Point(10,6)
$rdbtn_Yes.Font                  = 'Microsoft Sans Serif,10'

$rdbtn_No                        = New-Object system.Windows.Forms.RadioButton
$rdbtn_No.text                   = "No"
$rdbtn_No.AutoSize               = $true
$rdbtn_No.width                  = 104
$rdbtn_No.height                 = 20
$rdbtn_No.location               = New-Object System.Drawing.Point(119,6)
$rdbtn_No.Font                   = 'Microsoft Sans Serif,10'
$rdbtn_No.Checked                = $true 

$lb_DiskToDelete                 = New-Object system.Windows.Forms.Label
$lb_DiskToDelete.text            = "The following virtual disk will be deleted"
$lb_DiskToDelete.AutoSize        = $true
$lb_DiskToDelete.width           = 25
$lb_DiskToDelete.height          = 10
$lb_DiskToDelete.location        = New-Object System.Drawing.Point(10,134)
$lb_DiskToDelete.Font            = 'Microsoft Sans Serif,12'

$pnl_VHDToBeDeleted              = New-Object system.Windows.Forms.Panel
$pnl_VHDToBeDeleted.height       = 36
$pnl_VHDToBeDeleted.width        = 414
$pnl_VHDToBeDeleted.location     = New-Object System.Drawing.Point(0,158)

$txtb_ChosenVHD                  = New-Object system.Windows.Forms.TextBox
$txtb_ChosenVHD.multiline        = $false
$txtb_ChosenVHD.width            = 395
$txtb_ChosenVHD.height           = 20
$txtb_ChosenVHD.location         = New-Object System.Drawing.Point(10,4)
$txtb_ChosenVHD.Font             = 'Microsoft Sans Serif,10'

$btn_Delete                      = New-Object system.Windows.Forms.Button
$btn_Delete.text                 = "Delete"
$btn_Delete.width                = 90
$btn_Delete.height               = 50
$btn_Delete.location             = New-Object System.Drawing.Point(450,140)
$btn_Delete.Font                 = 'Microsoft Sans Serif,12,style=Bold'

$Delete_VM.controls.AddRange(@($lb_SelectVM,$pnl_SelectVM,$lb_OSVHDDelete,$pnl_DeleteOSVHD,$lb_DiskToDelete,$pnl_VHDToBeDeleted,$btn_Delete))
$pnl_SelectVM.controls.AddRange(@($cmb_SelectVM))
$pnl_DeleteOSVHD.controls.AddRange(@($rdbtn_Yes,$rdbtn_No))
$pnl_VHDToBeDeleted.controls.AddRange(@($txtb_ChosenVHD))

#machines
$machines = @((Get-VM -VMName *).Name)
foreach ($machine in $machines){$cmb_SelectVM.items.add($machine)}

function loadMachine{
$selectedItem = $cmb_SelectVM.selectedItem.toString()
return $selectedItem
}

#function myP{
#    $nazwamaszyny = loadMachine
#            if ((Get-VMSnapshot -VMName $nazwamaszyny)) {
#                $sciezkadysku = Get-VM -VMName $nazwamaszyny | Get-VMHardDiskDrive | select path -expandproperty path
#                $sciezkadysku.Substring(0,$sciezkadysku.LastIndexOf("_"))
#                $a = $sciezkadysku.Substring(0,$sciezkadysku.LastIndexOf("_")) + ".vhdx" | Out-String  
#                }
#            else {
#                $sciezkadysku = Get-VM -VMName $nazwamaszyny | Get-VMHardDiskDrive | select path -expandproperty path
#            }
#    return $a
#}

$rdbtn_Yes.Enabled = $false
$cmb_SelectVM.add_SelectedIndexChanged({
if (!($cmb_SelectVM.Text)){
    $rdbtn_Yes.Enabled = $false
    }
else{
    $rdbtn_Yes.Enabled = $true
    }
})


#ale
$txtb_ChosenVHD.Enabled = $false

$cmb_SelectVM.add_SelectedIndexChanged({
if ($rdbtn_Yes.Checked){
    $txtb_ChosenVHD.Enabled = $true
        $nazwamaszyny = loadMachine
                if ((Get-VMSnapshot -VMName $nazwamaszyny)) {
                $sciezkadysku = Get-VM -VMName $nazwamaszyny | Get-VMHardDiskDrive | select path -expandproperty path 
                $sciezkadysku.Substring(0,$sciezkadysku.LastIndexOf(".")) #bez .avhdx
                $pos = $sciezkadysku.LastIndexof(".")
                $format = $sciezkadysku.Substring($pos+1)
                    if($format.Contains("a")){
                    $format = $format.TrimStart("a")
                    }
 
                $txtb_ChosenVHD.Text = $sciezkadysku.Substring(0,$sciezkadysku.LastIndexOf("_")) + "." + $format                
                }

                else{
                $txtb_ChosenVHD.Text = Get-VM -VMName $nazwamaszyny | Get-VMHardDiskDrive | select path -expandproperty path
                }
    }
    else{
    $txtb_ChosenVHD.Enabled = $false
    $txtb_ChosenVHD.text = ""

    }
 })


$rdbtn_Yes.add_Click({
    if ($rdbtn_Yes.Checked){
  $txtb_ChosenVHD.Enabled = $true
        $nazwamaszyny = loadMachine
                if ((Get-VMSnapshot -VMName $nazwamaszyny)) {
                $sciezkadysku = Get-VM -VMName $nazwamaszyny | Get-VMHardDiskDrive | select path -expandproperty path 
                $sciezkadysku.Substring(0,$sciezkadysku.LastIndexOf(".")) #bez .avhdx
                $pos = $sciezkadysku.LastIndexof(".")
                $format = $sciezkadysku.Substring($pos+1)
                    if($format.Contains("a")){
                    $format = $format.TrimStart("a")
                    }
 
                $txtb_ChosenVHD.Text = $sciezkadysku.Substring(0,$sciezkadysku.LastIndexOf("_")) + "." + $format                
                }

                else{
                $txtb_ChosenVHD.Text = Get-VM -VMName $nazwamaszyny | Get-VMHardDiskDrive | select path -expandproperty path
                }
    }
    
    
})


$rdbtn_No.add_Click({
 $txtb_ChosenVHD.Enabled = $false
    $txtb_ChosenVHD.text = ""
})


$btn_Delete.add_Click({

        try{
            $nazwamaszyny = loadMachine
        }
        catch{
            [System.Windows.Forms.MessageBox]::Show("Machine doesn't exist", 'Attention', 'OK', 'Error')
            Return
        }

        if(!($cmb_SelectVM.Text))
        {
            [System.Windows.Forms.MessageBox]::Show("Please select VM", 'Attention', 'OK', 'Error')
            Return
        }



    if($rdbtn_Yes.Checked){
        $disk = $txtb_ChosenVHD.Text
        
        Remove-VM -Name $nazwamaszyny -Force
        [System.Windows.Forms.MessageBox]::Show("VM has been deleted", 'Attention', 'OK', 'Information')
        [System.Windows.Forms.MessageBox]::Show("Wait 10 seconds to delete disk", 'Attention', 'OK', 'Information')
        Start-Sleep -Seconds 10        
        Remove-Item –path $disk
        [System.Windows.Forms.MessageBox]::Show("Disk has been deleted", 'Attention', 'OK', 'Information')
        $txtb_ChosenVHD.Text = ""
        $cmb_SelectVM.items.remove($nazwamaszyny)
    }
    else{

        
        Remove-VM -Name $nazwamaszyny -Force
        $cmb_SelectVM.items.remove($nazwamaszyny)
        [System.Windows.Forms.MessageBox]::Show("VM has been deleted", 'Attention', 'OK', 'Information')
        }    
})


$Delete_VM.ShowDialog()




#$nazwamaszyny = "exde1"
#if ((Get-VMSnapshot -VMName $nazwamaszyny)) {
#$sciezkadysku = Get-VM -VMName $nazwamaszyny | Get-VMHardDiskDrive | select path -expandproperty path 
#$sciezkadysku.Substring(0,$sciezkadysku.LastIndexOf(".")) #bez .avhdx
#$pos = $sciezkadysku.LastIndexof(".")
#$format = $sciezkadysku.Substring($pos+1)
#if($format.Contains("a"))
#{
#$format = $format.TrimStart("a")
#}
# 
#$path = $sciezkadysku.Substring(0,$sciezkadysku.LastIndexOf("_")) + "." + $format
# 
#Remove-item -path $path
#}
#else
#{
#$sciezkadysku = Get-VM -VMName $nazwamaszyny | Get-VMHardDiskDrive | select path -expandproperty path
#Remove-item -path $sciezkadysku
#}
