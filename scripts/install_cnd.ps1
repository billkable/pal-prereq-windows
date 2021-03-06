# Make sure you have access to run scripts on the Local Machine,
# run the following if necessary:
#
#   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# Install Chocolatey

Set-ExecutionPolicy Bypass -Scope Process
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install prereq software

choco install git --confirm
choco install openjdk11 --confirm
choco install gradle --confirm
choco install mysql --confirm
choco install cloudfoundry-cli --confirm
choco install curl --confirm
choco install flyway.commandline --confirm
choco install ntop.portable --confirm
choco install intellijidea-community --confirm
choco install vscode --confirm
choco install slack --confirm
choco install graphviz.portable --confirm

# Postman has special handling - imcompatible with Sysprep given it
# installs to user profile, move it to root partition
choco install postman --confirm
cd ~/AppData/Local/Postman
.\Postman.exe --squirrel-uninstall 7.20.4
Stop-Process postman.exe
cd 'C:\Program Files\Postman'
.\Postman.exe --squirrel-install 7.20.4
# You may need to manually set up startup shortcuts on cloned workspace!