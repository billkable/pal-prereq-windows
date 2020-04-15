# Install Steps

-   Squirrel install postman

    ```pwsh
    choco install postman --confirm
    cd ~/AppData/Local/Postman
    .\Postman.exe --squirrel-uninstall 7.20.1
    Stop-Process -Name Postman
    cd 'C:\Program Files'
    mv ~/AppData/Local/Postman .
    cd Postman
    .\Postman.exe --squirrel-install 7.20.1
    Stop-Process -Name Postman
    ```

-   Rabbitmq install:

    ```pwsh
    choco install rabbitmq --confirm
    cd 'C:\Program Files\RabbitMQ Server\rabbitmq_server-3.8.3\sbin'
    .\rabbitmq-plugins enable rabbitmq_tracing
    ```

-   Add follow Desktop and Taskbar icons
    - Firefox
    - Powershell
    - Powershell ISE
    - Gitbash
    - Code
    - IntelliJ
    - STS
    - Postman
    - Jmeter

-   Firefox Bookmarks
