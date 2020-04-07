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
# choco install docker-desktop # Optional
# choco install cloudfoundry-cli --confirm # Optional
choco install jmeter --confirm
choco install postman --confirm
choco install curl --confirm
choco install flyway.commandline --confirm
choco install rabbitmq --confirm
choco install ntop.portable --confirm
choco install intellijidea-community --confirm
choco install vscode --confirm
choco install springtoolsuite --confirm
choco install firefox --confirm

# Add trace plugin for Rabbitmq
cd 'C:\Program Files\RabbitMQ Server\rabbitmq_server-3.8.3\sbin'
.\rabbitmq-plugins enable rabbitmq_tracing
cd $HOME
