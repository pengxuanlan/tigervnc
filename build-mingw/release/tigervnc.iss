[Setup]
#ifdef WIN64
ArchitecturesInstallIn64BitMode=x64
#endif
AppName=TigerVNC
AppVerName=TigerVNC 1.16.80 ()
AppVersion=1.16.80
AppPublisher=TigerVNC team
AppPublisherURL=https://tigervnc.org
DefaultDirName={pf}\TigerVNC
DefaultGroupName=TigerVNC
LicenseFile=/workspace\LICENCE.TXT

[Files]
Source: "/workspace/build-mingw\vncviewer\vncviewer.exe"; DestDir: "{app}"; Flags: ignoreversion restartreplace; 
Source: "/workspace\README.rst"; DestDir: "{app}"; Flags: ignoreversion
Source: "/workspace\LICENCE.TXT"; DestDir: "{app}"; Flags: ignoreversion

#define LINGUAS
#define Lang
#sub AddLanguage
  #define Lang = FileRead(LINGUAS)
  Source: "/workspace/build-mingw\po\{#Lang}.mo"; DestDir: "{app}\locale\{#Lang}\LC_MESSAGES"; DestName: "tigervnc.mo"; Flags: ignoreversion
#endsub
#for {LINGUAS = FileOpen("/workspace\po\LINGUAS"); !FileEof(LINGUAS); ""} AddLanguage

[Icons]
Name: "{group}\TigerVNC"; FileName: "{app}\vncviewer.exe";
Name: "{group}\Listening TigerVNC"; FileName: "{app}\vncviewer.exe"; Parameters: "-listen";

Name: "{group}\License"; FileName: "write.exe"; Parameters: "LICENCE.TXT"; WorkingDir: "{app}"; Flags: "useapppaths"
Name: "{group}\Read Me"; FileName: "write.exe"; Parameters: "README.rst"; WorkingDir: "{app}"; Flags: "useapppaths"
Name: "{group}\Uninstall TigerVNC"; FileName: "{uninstallexe}"; WorkingDir: "{app}";
