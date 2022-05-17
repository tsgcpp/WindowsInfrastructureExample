$ErrorActionPreference = 'Stop'

. ./install-functions.ps1

Add-Machine-Path-If-Needed-WIE -NewPath 'C:\Program Files\Git\cmd'
Add-Machine-Path-If-Needed-WIE -NewPath 'C:\Program Files\Git\bin'
