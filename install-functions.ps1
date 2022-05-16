# "-WIE" is the postfix of this example.

function Find-Install-Package-WIE {
    param(
        [string]$PackageFormat
    )

    $PackageFile = (Get-ChildItem -File $PackageFormat -Name)
    $FoundFilesCount = (Write-Output $PackageFile | Measure-Object -Line | Select-Object -ExpandProperty Lines)

    if ($FoundFilesCount -le 0)
    {
        Throw "$PackageFormat was not found in this directory"
    }

    if ($FoundFilesCount -ge 2)
    {
        Throw "$PackageFormat is duplicated in this directory"
    }

    $PackageFile = $PackageFile.Trim()

    return $PackageFile
}

function Add-Machine-Path-If-Needed-WIE
{
    param(
        [string]$NewPath
    )

    $Path = Get-Path-WIE
    if (Contains-Path-WIE -NewPath $NewPath -Path $Path)
    {
        Write-Output "$NewPath already exists"
        return
    }

    Add-Path-WIE -NewPath $NewPath

    Write-Output "$NewPath was added to the machine PATH"

    $Path = Get-Path-WIE
    Write-Output "PATH: $PATH"
}

function Get-Path-WIE
{
    return [Environment]::GetEnvironmentVariable('PATH', [System.EnvironmentVariableTarget]::Machine)
}

function Set-Path-WIE
{
    param(
        [string]$Path
    )

    SETX /M PATH $Path
}

function Add-Path-WIE
{
    param(
        [string]$NewPath
    )

    $Path = Get-Path-WIE
    $Path += ';' + $NewPath

    Set-Path-WIE -Path $PATH
}

function Contains-Path-WIE
{
    param(
        [string]$NewPath,
        [string]$Path
    )

    return ";$Path;".Contains(";$NewPath;")
}
