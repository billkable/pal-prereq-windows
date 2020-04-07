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
choco install maven --confirm
choco install postman --confirm
choco install curl --confirm
choco install flyway.commandline --confirm
choco install ntop.portable --confirm
choco install intellijidea-community --confirm
choco install vscode --confirm
choco install springtoolsuite --confirm

