<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Add_VM_to_domain
#>


Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Add_VM_to_domain                = New-Object system.Windows.Forms.Form
$Add_VM_to_domain.ClientSize     = '550,350'
$Add_VM_to_domain.text           = "Add a virtual machine to the domain"
$Add_VM_to_domain.TopMost        = $false
$Icon                            = New-Object system.drawing.icon ($PSScriptRoot + "\icons\ikonka_maszyna_środowisko.ico")
$Add_VM_to_domain.Icon      = $Icon
$Add_VM_to_domain.FormBorderStyle  = 'FixedDialog'

$lb_SelectVM                     = New-Object system.Windows.Forms.Label
$lb_SelectVM.text                = "Select virtual machine to add to a domain"
$lb_SelectVM.AutoSize            = $true
$lb_SelectVM.width               = 25
$lb_SelectVM.height              = 10
$lb_SelectVM.location            = New-Object System.Drawing.Point(11,11)
$lb_SelectVM.Font                = 'Microsoft Sans Serif,12'

$pnl_SelectVM                    = New-Object system.Windows.Forms.Panel
$pnl_SelectVM.height             = 43
$pnl_SelectVM.width              = 403
$pnl_SelectVM.location           = New-Object System.Drawing.Point(0,33)

$cmb_SelectVM                    = New-Object system.Windows.Forms.ComboBox
$cmb_SelectVM.width              = 383
$cmb_SelectVM.height             = 20
$cmb_SelectVM.location           = New-Object System.Drawing.Point(10,7)
$cmb_SelectVM.Font               = 'Microsoft Sans Serif,10'

$lb_EnterDomainName              = New-Object system.Windows.Forms.Label
$lb_EnterDomainName.text         = "Enter name of the domain "
$lb_EnterDomainName.AutoSize     = $true
$lb_EnterDomainName.width        = 25
$lb_EnterDomainName.height       = 10
$lb_EnterDomainName.location     = New-Object System.Drawing.Point(10,82)
$lb_EnterDomainName.Font         = 'Microsoft Sans Serif,12'

$txtb_DomainName                 = New-Object system.Windows.Forms.TextBox
$txtb_DomainName.multiline       = $false
$txtb_DomainName.width           = 383
$txtb_DomainName.height          = 20
$txtb_DomainName.location        = New-Object System.Drawing.Point(10,109)
$txtb_DomainName.Font            = 'Microsoft Sans Serif,10'

$btn_AddToDomain                 = New-Object system.Windows.Forms.Button
$btn_AddToDomain.text            = "Add to domain"
$btn_AddToDomain.width           = 135
$btn_AddToDomain.height          = 50
$btn_AddToDomain.location        = New-Object System.Drawing.Point(405,290)
$btn_AddToDomain.Font            = 'Microsoft Sans Serif,12,style=Bold'

$lb_EnterIPDC                    = New-Object system.Windows.Forms.Label
$lb_EnterIPDC.text               = "Enter last number for IPv4 configuration of a domain controller "
$lb_EnterIPDC.AutoSize           = $true
$lb_EnterIPDC.width              = 25
$lb_EnterIPDC.height             = 10
$lb_EnterIPDC.location           = New-Object System.Drawing.Point(10,152)
$lb_EnterIPDC.Font               = 'Microsoft Sans Serif,12'

$lb_IPDC                         = New-Object system.Windows.Forms.Label
$lb_IPDC.text                    = "10.10.10."
$lb_IPDC.AutoSize                = $true
$lb_IPDC.width                   = 25
$lb_IPDC.height                  = 10
$lb_IPDC.location                = New-Object System.Drawing.Point(10,183)
$lb_IPDC.Font                    = 'Microsoft Sans Serif,10'

$txtb_IPDC                       = New-Object system.Windows.Forms.TextBox
$txtb_IPDC.multiline             = $false
$txtb_IPDC.width                 = 32
$txtb_IPDC.height                = 20
$txtb_IPDC.location              = New-Object System.Drawing.Point(73,178)
$txtb_IPDC.Font                  = 'Microsoft Sans Serif,10'

$lb_EnterIPVM                    = New-Object system.Windows.Forms.Label
$lb_EnterIPVM.text               = "Enter last number for IPv4 configuration for this machine"
$lb_EnterIPVM.AutoSize           = $true
$lb_EnterIPVM.width              = 25
$lb_EnterIPVM.height             = 10
$lb_EnterIPVM.location           = New-Object System.Drawing.Point(10,220)
$lb_EnterIPVM.Font               = 'Microsoft Sans Serif,12'

$lb_IPVM                         = New-Object system.Windows.Forms.Label
$lb_IPVM.text                    = "10.10.10."
$lb_IPVM.AutoSize                = $true
$lb_IPVM.width                   = 25
$lb_IPVM.height                  = 10
$lb_IPVM.location                = New-Object System.Drawing.Point(10,253)
$lb_IPVM.Font                    = 'Microsoft Sans Serif,10'

$txtb_IPVM                       = New-Object system.Windows.Forms.TextBox
$txtb_IPVM.multiline             = $false
$txtb_IPVM.width                 = 32
$txtb_IPVM.height                = 20
$txtb_IPVM.location              = New-Object System.Drawing.Point(73,248)
$txtb_IPVM.Font                  = 'Microsoft Sans Serif,10'

$Add_VM_to_domain.controls.AddRange(@($lb_SelectVM,$pnl_SelectVM,$lb_EnterDomainName,$txtb_DomainName,$btn_AddToDomain,$lb_EnterIPDC,$lb_IPDC,$txtb_IPDC,$lb_EnterIPVM,$lb_IPVM,$txtb_IPVM))
$pnl_SelectVM.controls.AddRange(@($cmb_SelectVM))


$machines = @((Get-VM -VMName *).Name)
foreach ($machine in $machines){$cmb_SelectVM.items.add($machine)}


function loadCli{
$selectedItem = $cmb_SelectVM.selectedItem.toString()
return $selectedItem
}


$btn_AddToDomain.Add_Click({
    [System.Windows.Forms.MessageBox]::Show("Adding to domain has been started", 'Attention', 'OK', 'Information')
    $error.Clear(); Clear-Host

 $ipMach = "10.10.10." + $txtb_IPVM.Text

 $idDC = "10.10.10." + $txtb_IPDC.Text	
 $Cli = loadCli
 $domain = $txtb_DomainName.Text
	

        if(!($cmb_SelectVM.Text)){
            [System.Windows.Forms.MessageBox]::Show("Select client", 'Attention', 'OK', 'Error')
            Return
        }

        if(!($txtb_DomainName.Text)){
            [System.Windows.Forms.MessageBox]::Show("Enter the domain name", 'Attention', 'OK', 'Error')
            Return
        }

        if(!($txtb_IPDC.Text)){
            [System.Windows.Forms.MessageBox]::Show("Enter the DC IP", 'Attention', 'OK', 'Error')
            Return
        }

        if(!($txtb_IPVM.Text)){
            [System.Windows.Forms.MessageBox]::Show("Enter the VM IP", 'Attention', 'OK', 'Error')
            Return
        }



        try{
            Start-VM -Name $Cli
            Start-Sleep -s 10
            [System.Windows.Forms.MessageBox]::Show("First credentials are for clieant, and next are for domain admin", 'Attention', 'OK', 'Information')
            Invoke-Command -VMName $Cli -ScriptBlock {
		        $netAdapter = (Get-NetAdapter).name
            New-NetIPAddress -InterfaceAlias $netAdapter  -IPAddress $args[0] -PrefixLength 8 -AddressFamily IPv4 

            Set-DnsClientServerAddress -InterfaceAlias $netAdapter -ServerAddresses $args[1]

            Start-Sleep -s 3

            Add-Computer -DomainName $args[2] -Credential (Get-Credential) -Restart -force} -Args $ipMach,$idDC, $domain -ErrorAction Stop

            [System.Windows.Forms.MessageBox]::Show("Finished", 'Attention', 'OK', 'Information')
        }

        catch{
            [System.Windows.Forms.MessageBox]::Show("$($_.Exception.Message)", 'Attention', 'OK', 'Error')
            Return
        }

})

$Add_VM_to_domain.ShowDialog()