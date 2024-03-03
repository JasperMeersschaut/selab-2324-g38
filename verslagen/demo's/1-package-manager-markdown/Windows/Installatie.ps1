#Automatiseren software-installatie

Function InstallAll {
    InstallAlgemeneApplicaties
    InstallSystemEngineeringLab
}
Function InstallAlgemeneApplicaties {
    Write-Host "`n`n`nInstallatie algemene applicaties" -ForegroundColor Red -BackgroundColor Yellow
    Write-Host "--------------------------------" -ForegroundColor Red -BackgroundColor Yellow
    Write-Host "`n- Git installeren" -ForegroundColor Green
    choco install -y git
    Write-Host "`n- Adobe Acrobat Reader installeren"-ForegroundColor Magenta
    choco install -y adobereader
    Write-Host "`n- Firefox installeren" -ForegroundColor Green
    choco install -y firefoxdownloadsview
    Write-Host "`n- GitHub Desktop installeren" -ForegroundColor Magenta
    choco install -y github
    Write-Host "`n- Visual Studio Code installeren" -ForegroundColor Green
    choco install -y vscode
    Write-Host "`n- VLC Media Player installeren" -ForegroundColor Magenta
    choco install -y vlc
}
Function InstallSystemEngineeringLab {
    Write-Host "`n`n`nInstallatie System Engineering Lab" -ForegroundColor Red -BackgroundColor Yellow
    Write-Host "------------------------------------" -ForegroundColor Red -BackgroundColor Yellow
    Write-Host "`n- FileZilla installeren" -ForegroundColor Green
    choco install -y filezilla
    Write-Host "`n- VirtualBox installeren" -ForegroundColor Magenta
    choco install -y virtualbox
    Write-Host "`n- MySQL Workbench installeren" -ForegroundColor Green
    choco install -y mysql.workbench
}

$choice = Read-Host -Prompt 'Install [A] - Update [B] - Delete [C]'
if ('A' -eq $choice) {
    $type = Read-Host -Prompt 'Install all [A] - Install `Algemene applicaties` [B] - Install `System Engineering Lab` [C]'
    switch ($type) {
        'A' {InstallAll}
        'B' {InstallAlgemeneApplicaties}
        'C' {InstallSystemEngineeringLab}
    }
}
if ('B' -eq $choice) {
    choco upgrade -y all
}
if ('C' -eq $choice) {
    $app = Read-Host -Prompt 'What package do you want to delete?'
    choco uninstall $app
}
