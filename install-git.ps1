$ErrorActionPreference = 'Stop'

. ./install-functions.ps1

$PackageFormat = 'Git-2.*64-bit.exe'
$LogFile = ".install-git.log.tmp"

# Invoke-WebRequest https://github.com/git-for-windows/git/releases/download/v2.36.1.windows.1/Git-2.36.1-64-bit.exe -OutFile Git-2.36.1-64-bit.exe

$PackageFile = Find-Install-Package-WIE -PackageFormat $PackageFormat
if (!($?))
{
    exit 1
}

Write-Output "Installing $PackageFile"

# See the install folder in PowerShellOptions.inf
$Result = Start-Process -NoNewWindow -Wait -PassThru -FilePath "./$PackageFile" `
    -ArgumentList `
    "/LANG=en", `
    "/ALLUSERS", `
    "/VERYSILENT", `
    "/NORESTART", `
    "/NOCANCEL", `
    "/SP-", `
    "/SUPPRESSMSGBOXES", `
    "/CLOSEAPPLICATIONS", `
    "/RESTARTAPPLICATIONS", `
    "/LOG=$LogFile", `
    "/LOADINF=git-for-windows.inf"
    
    
Get-Content $LogFile
Remove-Item $LogFile

if ($Result.ExitCode -ne  0)
{
    Write-Error "Installation failed. The exit code was $($Result.ExitCode)"
    exit 1
}

Write-Output "$PackageFile was installed successfully"
