Set-ExecutionPolicy Bypass -Scope Process -Force

Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

$Packages = @( `
            [pscustomobject]@{ name='curl';params='' },`
            [pscustomobject]@{ name='azure-cli';params='' },`
            [pscustomobject]@{ name='vscode';params='' },`
            [pscustomobject]@{ name='bicep';params='' },`
            [pscustomobject]@{ name='azure-functions-core-tools';params='/x64' },`
            [pscustomobject]@{ name='microsoft-windows-terminal';params='' },`
            [pscustomobject]@{ name='dotnetcore-sdk';params='' },`
            [pscustomobject]@{ name='dotnet-sdk';params='' },`
            [pscustomobject]@{ name='dotnetfx';params='' },`
            [pscustomobject]@{ name='python3';params='' },`
            [pscustomobject]@{ name='sql-server-management-studio';params='' },`
            [pscustomobject]@{ name='microsoftazurestorageexplorer';params='' },`
            [pscustomobject]@{ name='terraform';params='' },`
            [pscustomobject]@{ name='git';params='' },`
            [pscustomobject]@{ name='omnisharp';params='' },`
            [pscustomobject]@{ name='kubernetes-cli';params='' },`
            [pscustomobject]@{ name='docker-cli';params='' },`
            [pscustomobject]@{ name='wsl2';params='/Retry:true' },`
            [pscustomobject]@{ name='docker-desktop';params='' }`
            
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

$extensions = @(`
                "4ops.terraform",`
                "auchenberg.vscode-browser-preview",`
                "AwesomeAutomationTeam.azureautomation",`
                "azuredevspaces.azds",`
                "bencoleman.armview",`
                "dan-c-underwood.arm",`
                "dbaeumer.vscode-eslint",`
                "DotJoshJohnson.xml",`
                "eamodio.gitlens",`
                "esbenp.prettier-vscode",`
                "florian.jwt",`
                "formulahendry.azure-storage-explorer",`
                "GitHub.codespaces",`
                "GitHub.vscode-pull-request-github",`
                "golang.go",`
                "hashicorp.terraform",`
                "hediet.vscode-drawio",`
                "huacat.pink-theme",`
                "humao.rest-client",`
                "laszer25.terraform-azure-autocomplete",`
                "marmac.xslt-action",`
                "mindaro-dev.file-downloader",`
                "mindaro.mindaro",`
                "momoto.binary-viewer",`
                "ms-azure-devops.azure-pipelines",`
                "ms-azuretools.vscode-apimanagement",`
                "ms-azuretools.vscode-azureAPIConnections",`
                "ms-azuretools.vscode-azureappservice",`
                "ms-azuretools.vscode-azurefunctions",`
                "ms-azuretools.vscode-azurelogicapps",`
                "ms-azuretools.vscode-azureresourcegroups",`
                "ms-azuretools.vscode-azurestorage",`
                "ms-azuretools.vscode-azureterraform",`
                "ms-azuretools.vscode-azurevirtualmachines",`
                "ms-azuretools.vscode-bicep",`
                "ms-azuretools.vscode-cosmosdb",`
                "ms-azuretools.vscode-docker",`
                "ms-azuretools.vscode-logicapps",`
                "ms-dotnettools.csharp",`
                "ms-dotnettools.vscode-dotnet-runtime",`
                "ms-kubernetes-tools.vscode-aks-tools",`
                "ms-kubernetes-tools.vscode-kubernetes-tools",`
                "ms-mssql.mssql",`
                "ms-python.python",`
                "ms-toolsai.jupyter",`
                "ms-vscode-remote.remote-containers",`
                "ms-vscode-remote.remote-ssh",`
                "ms-vscode-remote.remote-ssh-edit",`
                "ms-vscode-remote.remote-wsl",`
                "ms-vscode-remote.vscode-remote-extensionpack",`
                "ms-vscode.azure-account",`
                "ms-vscode.azurecli",`
                "ms-vscode.js-debug-nightly",`
                "ms-vscode.powershell",`
                "ms-vscode.vscode-node-azure-pack",`
                "ms-vsliveshare.vsliveshare",`
                "ms-vsts.team",`
                "msazurermtools.azurerm-vscode-tools",`
                "msjsdiag.debugger-for-chrome",`
                "octref.vetur",`
                "redhat.fabric8-analytics",`
                "redhat.java",`
                "redhat.vscode-commons",`
                "redhat.vscode-xml",`
                "redhat.vscode-yaml",`
                "ritwickdey.LiveServer",`
                "tht13.python",`
                "tonybaloney.vscode-pets",`
                "VisualStudioExptTeam.vscodeintellicode",`
                "VisualStudioOnlineApplicationInsights.application-insights",`
                "vsciot-vscode.azure-iot-toolkit",`
                "vscjava.vscode-java-debug",`
                "vscjava.vscode-java-dependency",`
                "vscjava.vscode-java-pack",`
                "vscjava.vscode-java-test",`
                "vscjava.vscode-maven",`
                "vscode-icons-team.vscode-icons",`
                "WASTeamAccount.WebTemplateStudio-dev-nightly",`
                "ytechie.armviz",`
                "yzane.markdown-pdf"
            )

$codeCmd = "C:\Program Files\Microsoft VS Code\bin\code.cmd"

Foreach ($extension in $extensions)
{
    &$codeCmd --install-extension $extension
}

dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

Add-LocalGroupMember -Group "docker-users" -Member "AzureAdmin"

Write-Host "Script Complete"

exit 0