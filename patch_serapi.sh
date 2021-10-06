#!/usr/bin/bash

# Set default install dir
sed -i 's/  InstallDir "C:\\.*/  InstallDir "C:\\cygwin_coq_platform\\home\\runneradmin\\.opam\\coq_for_waterproof"/g' coq-platform/windows/Coq.nsi

# Comment out whitelist to include
sed -i '/^OPAM_FILE_WHITELIST\[base\]/ c#OPAM_FILE_WHITELIST\[base\]' coq-platform/windows/create_installer_windows.sh
sed -i '/^OPAM_FILE_WHITELIST\[base-threads\]/ c#OPAM_FILE_WHITELIST\[base-threads\]' coq-platform/windows/create_installer_windows.sh
sed -i '/^OPAM_FILE_WHITELIST\[ppx_deriving\]/ c#OPAM_FILE_WHITELIST\[ppx_deriving\]' coq-platform/windows/create_installer_windows.sh
sed -i '/^OPAM_FILE_WHITELIST\[sexplib0\]/ c#OPAM_FILE_WHITELIST\[sexplib0\]' coq-platform/windows/create_installer_windows.sh
sed -i '/^OPAM_FILE_WHITELIST\[result\]/ c#OPAM_FILE_WHITELIST\[result\]' coq-platform/windows/create_installer_windows.sh
          
# Change META files to not uses threading which is not supported on Windows
sed -i '/^requires(mt,mt_posix)/ c#requires(mt,mt_posix)' .opam/coq_for_waterproof/lib/threads/META
sed -i '/^type_of_threads = "posix"/ c#type_of_threads = "none"' .opam/coq_for_waterproof/lib/threads/META

# Comment out line to ignore modified warnings
sed -i '/      echo "In package '\''$1'\'' the file '\''$file'\'' does not exist"/!b;n;c#      exit 1' coq-platform/windows/create_installer_windows.sh
