Section "BeforeSections" SEC_BeforeSections
  SetOutPath "$INSTDIR\bin\"
  Push $9
  FileOpen $9 "$INSTDIR\bin\findlib.conf" w
  FileWrite $9 "path=$\"$INSTDIR\lib$\"$\r$\n"
  FileClose $9
  Pop $9
SectionEnd
