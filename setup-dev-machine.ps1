Set-ExecutionPolicy Bypass -Scope Process -Force

Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

$Packages = @( `
            [pscustomobject]@{ name='curl';params='' },`
            [pscustomobject]@{ name='azure-cli';params='' },`
            [pscustomobject]@{ name='microsoft-edge-insider-dev';params='' },`
            [pscustomobject]@{ name='vscode';params='' },`
            [pscustomobject]@{ name='vscode-vsliveshare';params=''},`
            [pscustomobject]@{ name='azurefunctions-vscode';params='' },`
            [pscustomobject]@{ name='azureaccount-vscode';params='' },`
            [pscustomobject]@{ name='vscode-csharp';params='' },`
            [pscustomobject]@{ name='vscode-powershell';params='' },`
            [pscustomobject]@{ name='vscode-csharpextensions';params='' },`
            [pscustomobject]@{ name='vscode-azurerm-tools';params='' },`
            [pscustomobject]@{ name='bicep';params='' },`
            [pscustomobject]@{ name='azure-functions-core-tools';params='/x64' }`
            )

Foreach ($Package in $Packages)
{
    if($Package.params -ne '')
    {
        choco install $Package.name --params $Package.params -y
    }
    else {
        choco install $Package.name -y
    }
}


Write-Host "Script Complete"

exit 0