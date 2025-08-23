# Waterproof Dependencies Installer
> Windows installer which installes all dependencies needed for the Waterproof vscode extension.

### Usage

In the intended usage, the installer is downloaded and executed automatically from the vscode extension.
Alternatively, it can be downloaded manually.

⚠ Note that the installation path should be chosen to be `C:\cygwin_wp\home\runneradmin\.opam\wp\`

⚠ Note that in the library selection window, all selected libraries are necessary for Waterproof to function

⚠ If one of the libraries is deselected, dependencies of that library are automatically deselected, too

----------

### Developer Usage

#### Building
To build the installer, run the Windows Github Action.
This can be done either by pushing to the repository on any branch, or manually activating it via a dispatch.
Dispatching it can be done by going to the [actions tab, then windows](https://github.com/impermeable/waterproof-dependencies-installer/actions/workflows/windows.yml) then click the "Run workflow" button and select `main` (or the appropriate branch).

Building often takes 1 - 1.5 hours, and since it happens infrequently we don't currently cache anything.

#### Updating
To update to a new coq and/or [coq/platform](https://github.com/coq/platform/) version you need to update a number of places:

In .github/workflows/windows.yml
 - Change the coq/platform version in step "Git checkout Coq platform", by changing the value after "ref:". For now it is set to `main`, which should be okay but is not stable.
 - Change the pick, i.e. coq version for coq platform in step "Run coq platform make windows", by changing the argument -pick="COQ-VERSION-AND-PLATFORM-VERSION", for example: "8.17~2023.08" or "8.20~2025.01", check coq/platform for valid options.
 - Change the coq-lsp version, to the one matching the chosen coq version.
 - Change the waterproof version.

**NOTE**: This is just upgrading the versions! The build can still fail if coq/platform or any of the other dependencies changed.
Always verify that a new installer works, in particular with the newest coq-waterproof tactics to ensure you get exactly the version you want.
