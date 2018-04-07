#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
$Packages = 'googlechrome',`
            'docker-for-windows',`
            'postman',`
            'nodejs.install',`
            'visualstudiocode'

#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}
Add-LocalGroupMember -Member demouser -Group docker-users

#Install Hyper-V and Reboot
Install-WindowsFeature -Name Hyper-V `
                       -IncludeAllSubFeature `
                       -IncludeManagementTools `
                       -Verbose `
                       -Restart
