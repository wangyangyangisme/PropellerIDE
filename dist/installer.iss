; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "PropellerIDE"
#define MyAppURL "www.parallax.com"
#define MyAppExeName "propelleride.exe"
#define MyAppBin "{app}"
#define MyPath ".."
;#define FtdiChipApp "CDM v2.12.00 WHQL Certified.exe"

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ---- IMPORTANT!!! ---- Set this to your QtPath
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#define QtPath "C:\Qt\5.3\mingw482_32"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppID={{FFFE6E20-C961-487B-B55B-510E4BCE479B}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher="Parallax Inc."
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputDir="."
OutputBaseFilename=propelleride-{#MyAppVersion}-win-setup
Compression=lzma/Max
SolidCompression=true
AlwaysShowDirOnReadyPage=true
UserInfoPage=no
UsePreviousUserInfo=no
DisableDirPage=yes
DisableProgramGroupPage=yes
DisableReadyPage=no
WizardImageFile="{#MyPath}\gfx\propellerbanner.bmp"

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
;Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: checkedonce; 
;Name: quicklaunchicon; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: checkedonce; OnlyBelowVersion: 0,6.1
Name: FtdiChip; Description: "Install FTDI Chip USB Serial Port Drivers"; Flags: checkedonce; 

[Files]
Source: "{#MyPath}\src\propelleride\propelleride.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyPath}\src\p1load\p1load.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyPath}\src\OpenSpin\openspin.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyPath}\gfx\propellerhat.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyPath}\doc"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#MyPath}\library"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#MyPath}\src\prebuilt\win32\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#QtPath}\bin\Qt5Core.dll"; DestDir: "{#MyAppBin}"; Flags: ignoreversion
Source: "{#QtPath}\bin\Qt5Gui.dll"; DestDir: "{#MyAppBin}"; Flags: ignoreversion
Source: "{#QtPath}\bin\Qt5Widgets.dll"; DestDir: "{#MyAppBin}"; Flags: ignoreversion
Source: "{#QtPath}\bin\Qt5PrintSupport.dll"; DestDir: "{#MyAppBin}"; Flags: ignoreversion
Source: "{#QtPath}\plugins\platforms\qwindows.dll"; DestDir: "{#MyAppBin}\platforms"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}" ; IconFilename: "{app}\propellerhat.ico";
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}";
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\propellerhat.ico";
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\propellerhat.ico";

[Run]
;Filename: {app}\{#FtdiChipApp}; Tasks: FtdiChip; Flags: RunAsCurrentUser NoWait; 
Filename: {app}\{#MyAppExeName}; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, "&", "&&")}}"; Flags: skipifsilent NoWait PostInstall; 

[Registry]
Root: HKCU; SubKey: Software\ParallaxInc; Flags: UninsDeleteKey; 
Root: HKCU; Subkey: "Software\ParallaxInc\PropellerIDE"; Flags: UninsDeleteKey; 
Root: HKCU; Subkey: "Software\ParallaxInc\PropellerIDE"; ValueType: string; ValueName: PropellerIDE_SpinCompiler; ValueData: {app}\openspin.exe;        Flags: DeleteKey;
Root: HKCU; Subkey: "Software\ParallaxInc\PropellerIDE"; ValueType: string; ValueName: PropellerIDE_SpinLoader;   ValueData: {app}\p1load.exe;          Flags: DeleteKey; 
Root: HKCU; Subkey: "Software\ParallaxInc\PropellerIDE"; ValueType: string; ValueName: PropellerIDE_SpinIncludes; ValueData: {app}\library;             Flags: DeleteKey;
Root: HKCU; Subkey: "Software\ParallaxInc\PropellerIDE"; ValueType: string; ValueName: PropellerIDE_LastFileName; ValueData: {app}\library\Welcome.spin;   Flags: DeleteKey; 

Root: HKCU; Subkey: "Software\ParallaxInc\PropellerIDE"; ValueType: string; ValueName: PropellerIDE_SpinCompiler; ValueData: {app}\openspin.exe;        Flags: UninsDeleteKey;
Root: HKCU; Subkey: "Software\ParallaxInc\PropellerIDE"; ValueType: string; ValueName: PropellerIDE_SpinLoader;   ValueData: {app}\p1load.exe;          Flags: UninsDeleteKey; 
Root: HKCU; Subkey: "Software\ParallaxInc\PropellerIDE"; ValueType: string; ValueName: PropellerIDE_SpinIncludes; ValueData: {app}\library;             Flags: UninsDeleteKey;
Root: HKCU; Subkey: "Software\ParallaxInc\PropellerIDE"; ValueType: string; ValueName: PropellerIDE_LastFileName; ValueData: {app}\library\Welcome.spin;   Flags: UninsDeleteKey; 

