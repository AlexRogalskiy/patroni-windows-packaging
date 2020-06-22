; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Patroni Environment Setup"
#define MyAppVersion "0.1"
#define MyAppPublisher "CYBERTEC PostgreSQL International GmbH"
#define MyAppURL "https://www.cybertec-postgresql.com/"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{4D29D928-999E-4D56-9896-76DEB4F259EC}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=..\LICENSE
; Uncomment the following line to run in non administrative install mode (install for current user only.)
PrivilegesRequired=lowest
OutputDir=..
OutputBaseFilename=Patroni-Env-Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
ArchitecturesInstallIn64BitMode="x64"

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: "..\patroni-win-x64\python-install.exe"; DestDir: "{app}"
Source: "..\patroni-win-x64\*.bat"; DestDir: "{app}"
Source: "..\patroni-win-x64\*.yml"; DestDir: "{app}"
Source: "..\patroni-win-x64\etcd\*"; DestDir: "{app}\etcd"; Flags: ignoreversion createallsubdirs recursesubdirs
Source: "..\patroni-win-x64\patroni\*"; DestDir: "{app}\patroni"; Flags: ignoreversion createallsubdirs recursesubdirs

[Icons]
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Run]
; Filename: "{app}\python-install.exe"; Parameters: "SimpleInstall=1 InstallAllUsers=0 PrependPath=1 Include_test=0 Include_launcher=0 SimpleInstallDescription=""Patroni Environment Setup"""; Flags: waituntilterminated; Description: "Install Python interpreter"
; Filename: "{localappdata}\Programs\Python\Python38\Scripts\pip3.exe"; Parameters: "install --no-index --find-links .patroni-packages -r requirements.txt"; WorkingDir: "{app}"; Flags: waituntilterminated runasoriginaluser runmaximized; StatusMsg: "Installing required packages"
; Filename: "{localappdata}\Programs\Python\Python38\Scripts\pip3.exe"; Parameters: "install --no-index --find-links ""{app}\.patroni-packages"" psycopg2-binary"; WorkingDir: "{app}"; Flags: waituntilterminated runasoriginaluser runmaximized; Description: "Install required packages"; StatusMsg: "Installing psycopg2 package..."
Filename: "{app}\install.bat"; WorkingDir: "{app}"; Flags: waituntilterminated