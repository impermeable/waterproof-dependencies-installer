# Waterproof Dependencies Installer
> Windows installer which installes all dependencies needed for the Waterproof application.

### Usage

![image](https://user-images.githubusercontent.com/23257952/136795885-21559223-33d8-45fc-8a5b-02499d38fca0.png "Installation Process")

⚠ Note that the installation path should be chosen to be `C:\cygwin_coq_platform\home\runneradmin\.opam\coq_for_waterproof\`

⚠ Note that in the library selection window, Coq-SerAPI is required for Waterproof to function!

⚠ If one of the libraries is deselected, dependencies of that library are automatically deselected to!

### Developer Usage

To build the installer, run the Windows Github Action.

To change the installed dependencies. Change the `packages.cfg` file.
