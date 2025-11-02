!include "StrRep.nsh"

Section "BeforeSections" SEC_BeforeSections
  SetOutPath "$INSTDIR\bin\"
  !insertmacro StrRep $8 "path=$\"$INSTDIR\lib$\"$\r$\n" "\" "\\"
  Push $9
  FileOpen $9 "$INSTDIR\bin\findlib.conf" w
  FileWrite $9 $8
  FileClose $9
  Pop $9
SectionEnd
