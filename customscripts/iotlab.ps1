Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

$Packages = 'googlechrome',`
            'git.install',`
            'docker-for-windows',`
            'postman',`
            'nodejs.install',`
            'visualstudiocode'

ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

Restart-Computer