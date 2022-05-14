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
