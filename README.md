# Waterproof Dependencies Installer
# DO NOT MERGE
> Windows installer which installes all dependencies needed for the Waterproof application.

### Usage

![image](https://user-images.githubusercontent.com/16321928/123624232-9ec84980-d80e-11eb-9829-ca653ba6f6b8.png "Installation Process")

⚠ Note that the installation path should be chosen to be `C:\cygwin64_coq\home\trist\.opam\_coq-platform_.2021.02.1\`

⚠ Note that in the library selection window, Coq-SerAPI is required for Waterproof to function!

⚠ If one of the libraries is deselected, dependencies of that library are automatically deselected to!

### Developer Usage

To build the installer, run the Windows Github Action.

To change the installed dependencies. Change the `packages.cfg` file.
