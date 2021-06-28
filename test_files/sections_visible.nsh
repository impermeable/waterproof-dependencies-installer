Section /o "zfc" Sec_zfc
SetOutPath "$INSTDIR\"
!include "files_zfc.nsh"
SectionEnd
Section "coq" Sec_coq
SetOutPath "$INSTDIR\"
!include "files_coq.nsh"
SectionEnd
Section "coq-coquelicot" Sec_coq_coquelicot
SetOutPath "$INSTDIR\"
!include "files_coq-coquelicot.nsh"
SectionEnd
Section "coq-serapi" Sec_coq_serapi
SetOutPath "$INSTDIR\"
!include "files_coq-serapi.nsh"
SectionEnd
