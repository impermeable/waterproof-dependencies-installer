# Waterproof Dependencies Installer
> Windows installer which installes all dependencies needed for the Waterproof application.

### Usage

![image](https://user-images.githubusercontent.com/23257952/136795885-21559223-33d8-45fc-8a5b-02499d38fca0.png "Installation Process")

⚠ Note that the installation path should be chosen to be `C:\cygwin_wp\home\runneradmin\.opam\wp\`

⚠ Note that in the library selection window, Coq-SerAPI is required for Waterproof to function!

⚠ If one of the libraries is deselected, dependencies of that library are automatically deselected to!

----------

### Developer Usage

#### Configuring
To change the installed dependencies. Change the `packages.cfg` file.

Opam packages can have a specified version by just adding it to the package name or see: https://opam.ocaml.org/doc/Usage.html#opam-install

#### Building
To build the installer, run the Windows Github Action.
This can be done either by pushing to the repository on any branch, or manually activating it via a dispatch.
Dispatching it can be done by going to the [actions tab, then windows](https://github.com/impermeable/waterproof-dependencies-installer/actions/workflows/windows.yml) then click the "Run workflow" button and select `main` (or the appropriate branch).

Building often takes 1 - 1.5 hours, and since it happens infrequently we don't currently cache anything.

#### Updating
To update to a new coq and/or [coq/platform](https://github.com/coq/platform/) version you need to update a number of places:

In .github/workflows/windows.yml
 - Change the coq/platform version in step "Git checkout Coq platform", by changing the value after "ref:"
 - Change the pick, i.e. coq version for coq platform in step "Run coq platform make windows", by changing the argument -pick="COQ-VERSION-AND-PLATFORM-VERSION", for example: "8.14~2022.01" or "8.15~2022.04", check coq/platform for valid options

In packages.cfg
 - Change the coq-serapi version, to the one matching the chosen coq version, check https://opam.ocaml.org/packages/coq-serapi/ for the options
 
**NOTE**: This is just upgrading the versions! The build can still fail if coq/platform or any of the other dependencies changed. 
Always verify that a new installer works, in particular with the newest coq-waterproof tactics to ensure you get exactly the version you want.



