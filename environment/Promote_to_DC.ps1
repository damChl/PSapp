<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Promote_to_DC
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Promote_to_DC                   = New-Object system.Windows.Forms.Form
$Promote_to_DC.ClientSize        = '550,350'
$Promote_to_DC.text              = "Promote a server to a domain controller"
$Promote_to_DC.TopMost           = $false
$Icon                            = New-Object system.drawing.icon ($PSScriptRoot + "\icons\ikonka_maszyna_środowisko.ico")
$Promote_to_DC.Icon      = $Icon
$Promote_to_DC.FormBorderStyle  = 'FixedDialog'

$lb_ChooseVM                     = New-Object system.Windows.Forms.Label
$lb_ChooseVM.text                = "Choose a server You want to promote to DC"
$lb_ChooseVM.AutoSize            = $true
$lb_ChooseVM.width               = 25
$lb_ChooseVM.height              = 10
$lb_ChooseVM.location            = New-Object System.Drawing.Point(10,10)
$lb_ChooseVM.Font                = 'Microsoft Sans Serif,12'

$pnl_ChooseServerName            = New-Object system.Windows.Forms.Panel
$pnl_ChooseServerName.height     = 38
$pnl_ChooseServerName.width      = 390
$pnl_ChooseServerName.location   = New-Object System.Drawing.Point(0,30)

$cmb_ChooseVM                    = New-Object system.Windows.Forms.ComboBox
$cmb_ChooseVM.width              = 365
$cmb_ChooseVM.height             = 20
$cmb_ChooseVM.location           = New-Object System.Drawing.Point(10,6)
$cmb_ChooseVM.Font               = 'Microsoft Sans Serif,10'

$lb_DomainName                   = New-Object system.Windows.Forms.Label
$lb_DomainName.text              = "Enter name of the domain"
$lb_DomainName.AutoSize          = $true
$lb_DomainName.width             = 25
$lb_DomainName.height            = 10
$lb_DomainName.location          = New-Object System.Drawing.Point(10,73)
$lb_DomainName.Font              = 'Microsoft Sans Serif,12'

$txtb_DomainName                 = New-Object system.Windows.Forms.TextBox
$txtb_DomainName.multiline       = $false
$txtb_DomainName.width           = 365
$txtb_DomainName.height          = 20
$txtb_DomainName.location        = New-Object System.Drawing.Point(10,98)
$txtb_DomainName.Font            = 'Microsoft Sans Serif,10'

$btn_Promote                     = New-Object system.Windows.Forms.Button
$btn_Promote.text                = "Promote"
$btn_Promote.width               = 90
$btn_Promote.height              = 50
$btn_Promote.location            = New-Object System.Drawing.Point(450,290)
$btn_Promote.Font                = 'Microsoft Sans Serif,12,style=Bold'

$lb_EnterIPMain                  = New-Object system.Windows.Forms.Label
$lb_EnterIPMain.text             = "Enter last number for IPv4 configuration of the main DC"
$lb_EnterIPMain.AutoSize         = $true
$lb_EnterIPMain.width            = 25
$lb_EnterIPMain.height           = 10
$lb_EnterIPMain.location         = New-Object System.Drawing.Point(10,136)
$lb_EnterIPMain.Font             = 'Microsoft Sans Serif,12'

$lb_IPMain                       = New-Object system.Windows.Forms.Label
$lb_IPMain.text                  = "10.10.10."
$lb_IPMain.AutoSize              = $true
$lb_IPMain.width                 = 25
$lb_IPMain.height                = 10
$lb_IPMain.location              = New-Object System.Drawing.Point(10,167)
$lb_IPMain.Font                  = 'Microsoft Sans Serif,10'

$txtb_IPMain                     = New-Object system.Windows.Forms.TextBox
$txtb_IPMain.multiline           = $false
$txtb_IPMain.width               = 38
$txtb_IPMain.height              = 20
$txtb_IPMain.location            = New-Object System.Drawing.Point(72,162)
$txtb_IPMain.Font                = 'Microsoft Sans Serif,10'

$lb_EnterIPPromoted              = New-Object system.Windows.Forms.Label
$lb_EnterIPPromoted.text         = "Enter last number for IPv4 configuration for this machine"
$lb_EnterIPPromoted.AutoSize     = $true
$lb_EnterIPPromoted.width        = 25
$lb_EnterIPPromoted.height       = 10
$lb_EnterIPPromoted.location     = New-Object System.Drawing.Point(10,200)
$lb_EnterIPPromoted.Font         = 'Microsoft Sans Serif,12'

$lb_IPPromoted                   = New-Object system.Windows.Forms.Label
$lb_IPPromoted.text              = "10.10.10."
$lb_IPPromoted.AutoSize          = $true
$lb_IPPromoted.width             = 25
$lb_IPPromoted.height            = 10
$lb_IPPromoted.location          = New-Object System.Drawing.Point(10,231)
$lb_IPPromoted.Font              = 'Microsoft Sans Serif,10'

$txtb_IPPromoted                 = New-Object system.Windows.Forms.TextBox
$txtb_IPPromoted.multiline       = $false
$txtb_IPPromoted.width           = 38
$txtb_IPPromoted.height          = 20
$txtb_IPPromoted.location        = New-Object System.Drawing.Point(72,226)
$txtb_IPPromoted.Font            = 'Microsoft Sans Serif,10'

$Promote_to_DC.controls.AddRange(@($lb_ChooseVM,$pnl_ChooseServerName,$lb_DomainName,$txtb_DomainName,$btn_Promote,$lb_EnterIPMain,$lb_IPMain,$txtb_IPMain,$lb_EnterIPPromoted,$lb_IPPromoted,$txtb_IPPromoted))
$pnl_ChooseServerName.controls.AddRange(@($cmb_ChooseVM))

$machines = @((Get-VM -VMName *).Name)
foreach ($machine in $machines){$cmb_ChooseVM.items.add($machine)}


function loadVM{
$selectedItem = $cmb_ChooseVM.selectedItem.toString()
return $selectedItem
}

$btn_Promote.Add_Click({
[System.Windows.Forms.MessageBox]::Show("Promoting has been strated", 'Attention', 'OK', 'Information')

 $error.Clear(); Clear-Host

 $ipMach = "10.10.10." + $txtb_IPPromoted.Text

 $idDC = "10.10.10." + $txtb_IPMain.Text

 $Cli = loadVM
 $domain = $txtb_DomainName.Text
 $pass = ConvertTo-SecureString "mmNXbun6)v" -AsPlainText -Force

            Start-VM -Name $Cli
            Start-Sleep -s 10

            [System.Windows.Forms.MessageBox]::Show("First two credentials are for new DC, and next are for the primary domain admin", 'Attention', 'OK', 'Information')

            try{
            Invoke-Command -VMName $Cli -ScriptBlock {
            New-NetIPAddress -InterfaceAlias "Ethernet"  -IPAddress $args[0] -PrefixLength 8 -AddressFamily IPv4 

            Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses ($args[1])
            Restart-Computer -Force } -Args $ipMach, $idDC, $domain
            Start-Sleep -s 30
            Invoke-Command -VMName $Cli -ScriptBlock {
            $pass = ConvertTo-SecureString "mmNXbun6)v" -AsPlainText -Force
            Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
            Import-Module ADDSDeployment
            Install-ADDSDomainController -DomainName $args[2] -InstallDNS:$False -SafeModeAdministratorPassword $args[3] -credential (get-credential) -force
	        } -Args $ipMach, $idDC, $domain, $pass
                [System.Windows.Forms.MessageBox]::Show("Finished", 'Attention', 'OK', 'Information')
            }
            catch {
                [System.Windows.Forms.MessageBox]::Show("$($_.Exception.Message)", 'Error', 'OK', 'Error')
                Return
            }
})



$Promote_to_DC.ShowDialog()

