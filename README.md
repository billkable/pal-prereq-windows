# PAL Windows Setup

The scope of this project is to simplify the setup of PAL dependencies
on Windows,
similar to the PAL installation scripts for
[MacOSX](https://prerequisites.pal.pivotal.io/prerequisites/prerequisites/macosx_install.sh)
and
[Ubuntu Linux](https://prerequisites.pal.pivotal.io/prerequisites/prerequisites/linux-install/ubuntu.html).

The
[Windows install script](./install.ps1) leverages
the
[Chocolatey] package manager to keep the installation
experience similar to the Ubuntu and Mac equivalents.

## Installations

The following are the set of dependencies required for the
*Platform Acceleration Lab (PAL) for Java Developers* course:

1. Git
1. OpenJDK 11
1. Gradle
1. MySql
1. CF CLI
1. cURL
1. Flyway
1. Rabbitmq
1. IntelliJ
1. Firefox
1. Graphviz

You can see the full list of PAL prerequisites
[here](https://prerequisites.pal.pivotal.io/prerequisites/prerequisites/index.html).

The following are additional software components convenient for the
*Spring* product courses and specific for Windows:

1. Chocolatey package manager
1. Postman - REST Client
1. Jmeter - Load injector
1. NTop - Enhanced console top command for Windows

## Running the installer

To install and use the image,
from the windows machine:

1. Download the `install.ps1` script from this repository.
1. Run it from a Powershell terminal with Adminstrative access.
1. Close the Powershell window.
1. Use the image

## Idiosynchrocies with Windows

Running PAL on Windows will require some different handling of commands
than many of the PAL lab instructions specify.

The installation here favors use of Gitbash over other bash alternatives
like Cygwin.

Remember that Windows architecture is substantially different than *nix
based systems,
and bash was not designed with Windows in mind.

Some of the hotspots to consider:

1.  Gitbash *does not* behave exactly like a *nix hosted bash shell.
1.  cURL syntax on Windows is different than on *nix hosted platforms.
1.  IDE shortcuts between Windows and MacOSX are different,
    although close to Ubuntu counterparts.
1.  Command line monitoring and process handling tools are different,
    or behave differently on Windows than *nix.

In some cases it may be more convenient to use Powershell counterparts
over Gitbash.
If you know them,
feel free to use them over any of the prescriptive bash commands in this
course.

The following sections are specific known issues:

### Logging into Cloud Foundry CLI

Gitbash will fail on the `cf login` command.
There are two workarounds:

1.  Use terminal or powershell - the `cf` command line will be the same
    as if using bash.

2.  Replace use of `cf login` with a combination of the following
    commands:

    - `cf api`
    - `cf auth`
    - `cf target`

    You will see use of these commands in the pipeline automation over
    the login command,
    because they are not interactive.

    Use `cf help` command for their use.

### cURL

Note the the experience may be different between Powershell
(if you choose it) and Gitbash

-   The `-i` option in Powershell will prompt for interactive population
    of `curl` options.

-   `localhost` will not resolve without the protocol specifier `http`.

Recommend to stick with Gitbash if using `curl`,
or you may choose to run Postman instead.

### Terminating a process

There is known issue with Gitbash where its terminal will not recognize
a `Ctl+C` signal to gracefully terminate a running foreground process
(like a long-running Spring Boot application).
You have a few options to handle it:

1.  Run your processes from powershell.
    It is more flexible than terminal window,
    in that it is more friendly to bash commands,
    and will automatically transpose forward to back slashes.
    Use of `Ctrl+C` should work here.

1.  Use `jps -l` command from alternate Gitbash or powershell window
    to determine the process id (PID) of the appropriate app you want to
    terminate,
    and terminate with one of the following:

    -   Task Manager
        -   Right-click Taskbar and select the option
        -   Go to the *Details* view to list the processes
        -   Right-click the process,
            select *End task* option.

    -   [Stop-Process command](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/stop-process?view=powershell-7) is the preferred approach,
        and more aligned with the existing instructions:

        ```pshl
        Stop-Process -Id <pid> -Confirm -PassThru
        ```

        If you need to force-kill a hung process,
        use the `-Force` option:

        ```pshl
        Stop-Process -Id <pid> -Confirm -Force -PassThru
        ```
