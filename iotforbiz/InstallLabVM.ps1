#Enable Containers
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -All -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName Containers -All -NoRestart

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

#Add Demo User to docker group
Add-LocalGroupMember -Member demouser -Group docker-users

#Bring down Desktop Shortcuts
$zipDownload = "http://YOUR-URL-HERE/FILENAME.ZIP"
$downloadedFile = "D:\FILENAME.zip"
$vmFolder = "C:\VM"
Invoke-WebRequest $zipDownload -OutFile $downloadedFile
Add-Type -assembly "system.io.compression.filesystem"
[io.compression.zipfile]::ExtractToDirectory($downloadedFile, $vmFolder)

#Reboot
Restart-Computer