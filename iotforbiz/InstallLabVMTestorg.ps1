#Enable Containers
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName Containers -All -NoRestart

#Install Chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

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

#Reboot
Restart-Computer