Clear-Host

$AWSAccessKey           = ""
$AWSSecretKey           = ""
$AWSRegion              = "eu-west-1"

$FilterPlatform         = New-Object Amazon.EC2.Model.Filter
$FilterPlatform.Name    = "platform"
$FilterPlatform.Values  = "windows"
$FilterName             = New-Object Amazon.EC2.Model.Filter
$FilterName.Name        = "name"
$FilterName.Values      = "Windows_Server*"

# authentification
Set-AWSCredential -AccessKey $AWSAccessKey -SecretKey $AWSSecretKey 

# all AMI
Get-EC2Image -Region $AWSRegion -Filter $FilterPlatform,$FilterName | Sort-Object -Property Name |  Select-Object Name,ImageId | Out-File AWS_AMI_Windows_Server_$AWSRegion.txt

# Windows 2016
$FilterName.Values      = "Windows_Server-2016*"
Get-EC2Image -Region $AWSRegion -Filter $FilterPlatform,$FilterName | Sort-Object -Property Name |  Select-Object Name,ImageId | Out-File AWS_AMI_Windows_Server-2016_$AWSRegion.txt

# fin
Write-Host "ok."
Write-Host ""
