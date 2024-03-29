﻿$ErrorActionPreference = 'Stop';
$toolsDir               = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$packageArgs = @{
    PackageName    = $env:ChocolateyPackageName
    Destination    = $toolsDir
    FileFullPath   = Join-Path $toolsDir 'nixpacks-v0.1.1-i686-pc-windows-msvc.zip'
    FileFullPath64 = Join-Path $toolsDir 'nixpacks-v0.1.1-x86_64-pc-windows-msvc.zip'
}

#Remove old versions of nixpacks in the tools directory
Get-ChildItem -Directory -Path $toolsDir | Remove-Item -Recurse -Ea 0

Get-ChocolateyUnzip @packageArgs

Write-Host "nixpacks installed to $toolsDir"

Remove-Item -Force -Path $toolsDir\*.zip
