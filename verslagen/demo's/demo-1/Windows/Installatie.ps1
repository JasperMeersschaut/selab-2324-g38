#Automatiseren software-installatie

Function InstallAll {
    InstallAlgemeneApplicaties
    InstallSystemEngineeringLab
}
Function InstallAlgemeneApplicaties {
    Write-Host "`n`n`nInstallatie algemene applicaties"
    Write-Host "--------------------------------"
    Write-Host "`n- Git installeren"
    choco install -y git
    Write-Host "`n- Adobe Acrobat Reader installeren"
    choco install -y adobereader
    Write-Host "`n- Firefox installeren"
    choco install -y firefoxdownloadsview
    Write-Host "`n- GitHub Desktop installeren"
    choco install -y github
    Write-Host "`n- Visual Studio Code installeren"
    choco install -y vscode
    Write-Host "`n- VLC Media Player installeren"
    choco install -y vlc
}
Function InstallSystemEngineeringLab {
    Write-Host "`n`n`nInstallatie System Engineering Lab"
    Write-Host "------------------------------------"
    Write-Host "`n- FileZilla installeren"
    choco install -y filezilla
    Write-Host "`n- VirtualBox installeren"
    choco install -y virtualbox
    Write-Host "`n- MySQL Workbench installeren"
    choco install -y mysql.workbench
}

$choice = Read-Host -Prompt 'Instal [A] - Update [B] - Delete [C]'
if ('A' -eq $choice) {
    $type = Read-Host -Prompt 'Instal all [A] - Install `Algemene applicaties` [B] - Install `System Engineering Lab` [C]'
    switch ($type) {
        'A' {InstallAll}
        'B' {InstallAlgemeneApplicaties}
        'C' {InstallSystemEngineeringLab}
    }
}
if ('B' -eq $choice) {
    choco upgrade all
}
if ('C' -eq $choice) {
    $app = Read-Host -Prompt 'What package do you want to delete?'
    choco uninstall $app
}