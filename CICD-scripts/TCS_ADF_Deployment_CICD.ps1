# You can write your azure powershell scripts inline here. 
# You can also pass predefined and custom variables to this script using arguments
$Date = Get-Date
$Month = $date.Month; if ($Month -le 9) {$Month = "0" + $Month}
$Day = $date.Day; if ($Day -le 9) {$Day = "0" + $Day}
$DeploymentDate = "$($Date.Year)" + "$Month" + "$Day"
$DeploymentName = "Deploy" + "$($Date.Year)" + "$Month" + "$Day"
Write-Host $DeploymentDate
Write-Host $env:Environment

$ParamPath = "$(System.DefaultWorkingDirectory)\_DemoCICD-CI\drop\ADF-dev-tcs\arm_template_parameters.json"

$TemplatePath = "$(System.DefaultWorkingDirectory)\_DemoCICD-CI\drop\ADF-dev-tcs\arm_template.json"

$MasterConfig = Get-Content $ParamPath | Out-String | ConvertFrom-Json

$factoryName = $MasterConfig.parameters.factoryName.value

$AzureKeyVaultdev_properties_typeProperties_baseUrl = $MasterConfig.parameters.AzureKeyVaultdev_properties_typeProperties_baseUrl.value

Write-Host $factoryName
Write-Host $AzureKeyVaultdev_properties_typeProperties_baseUrl

Write-Host $MasterConfig
Write-Host "Hello World"

New-AzureRmResourceGroupDeployment -Debug -Verbose -Name $DeploymentName -ResourceGroupName $RGName -TemplateFile $TemplatePath -TemplateParameterFile $ParamPath -Confirm:$false