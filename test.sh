#!/usr/bin/bash

test_folder="test_files"
installer_file_folder="windows_installer"

exit_code=0


# File to compare
file="files_coq-coquelicot.nsh"

if cmp -s "$test_folder/$file" "$installer_file_folder/$file"; then
    echo "[*] Test 1: Opam installation success!"
else
    echo "[*] Test 1: Opam installation fail!"
    exit_code=1
fi

file="files_zfc.nsh"

if cmp -s "$test_folder/$file" "$installer_file_folder/$file"; then
    echo "[*] Test 2: Custom package installation success!"
else
    echo "[*] Test 2: Custom package installation fail!"
    exit_code=1
fi

file="sections_visible.nsh"

if cmp -s "$test_folder/$file" "$installer_file_folder/$file"; then
    echo "[*] Test 3: Unselection success!"
else
    echo "[*] Test 3: Unselection fail!"
    exit_code=1
fi

exit $exit_code
