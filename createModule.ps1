# createModule.ps1
param(
    [Parameter(Mandatory=$true)]
    [string]$ModuleName
)

$basePath = ".\Microservice.Services\$ModuleName"

# Ana klasörler
New-Item -ItemType Directory -Path "$basePath\src" -Force
New-Item -ItemType Directory -Path "$basePath\build" -Force
New-Item -ItemType Directory -Path "$basePath\deploy" -Force
New-Item -ItemType Directory -Path "$basePath\test" -Force
New-Item -ItemType Directory -Path "$basePath\docs" -Force
New-Item -ItemType Directory -Path "$basePath\.github\workflows" -Force

# .gitignore ve README.md dosyaları
@("$basePath\build\.gitignore", "$basePath\deploy\.gitignore", "$basePath\docs\.gitignore", "$basePath\src\.gitignore", "$basePath\test\.gitignore") | ForEach-Object { New-Item -ItemType File -Path $_ -Force }
New-Item -ItemType File -Path "$basePath\README.md" -Force

# src altı modül mimarisi
$srcPath = "$basePath\src"
$projPrefix = "$ModuleName"

# Web API projesi
dotnet new webapi -f net9.0 -n "$projPrefix.App" -o "$srcPath\$projPrefix.App" --no-https

# Class Library projeleri
foreach ($suffix in @("Abstraction", "App", "Core", "Domain", "Repository", "Infrastructure", "CQRS")) {
    $projName = "$projPrefix.$suffix"
    dotnet new classlib -f net9.0 -n $projName -o "$srcPath\$projName"
}

Write-Host "Modül yapısı ve projeler oluşturuldu: $basePath"

Read-Host "Devam etmek için Enter'a basın..."

