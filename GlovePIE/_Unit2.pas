//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit2;

interface

uses
  SysUtils, Classes;

type
  TPoint = TPoint = record//size=8
X:Integer;//f0
Y:Integer;//f4
end;;
  TRect = TRect = record//size=10
Left:Integer;//f0
Top:Integer;//f4
Right:Integer;//f8
Bottom:Integer;//fC
TopLeft:TPoint;//f0
BottomRight:TPoint;//f8
end;;
  tagSIZE = tagSIZE = record//size=8
cx:Integer;//f0
cy:Integer;//f4
end;;
  TSmallPoint = TSmallPoint = record//size=4
x:SmallInt;//f0
y:SmallInt;//f2
end;;
  _LARGE_INTEGER = _LARGE_INTEGER = record//size=8
LowPart:Cardinal;//f0
HighPart:Integer;//f4
QuadPart:Int64;//f0
end;;
  _LIST_ENTRY = _LIST_ENTRY = record//size=8
Flink:PListEntry;//f0
Blink:PListEntry;//f4
end;;
  _RTL_CRITICAL_SECTION_DEBUG = _RTL_CRITICAL_SECTION_DEBUG = record//size=20
Type_18:Word;//f0
CreatorBackTraceIndex:Word;//f2
CriticalSection:PRTLCriticalSection;//f4
ProcessLocksList:_LIST_ENTRY;//f8
EntryCount:Cardinal;//f10
ContentionCount:Cardinal;//f14
Spare:?;//f18
end;;
  _RTL_CRITICAL_SECTION = _RTL_CRITICAL_SECTION = record//size=18
DebugInfo:PRTLCriticalSectionDebug;//f0
LockCount:Integer;//f4
RecursionCount:Integer;//f8
OwningThread:Cardinal;//fC
LockSemaphore:Cardinal;//f10
Reserved:Cardinal;//f14
end;;
  _OVERLAPPED = _OVERLAPPED = record//size=14
Internal:Cardinal;//f0
InternalHigh:Cardinal;//f4
Offset:Cardinal;//f8
OffsetHigh:Cardinal;//fC
hEvent:Cardinal;//f10
end;;
  _SECURITY_ATTRIBUTES = _SECURITY_ATTRIBUTES = record//size=C
nLength:Cardinal;//f0
lpSecurityDescriptor:Pointer;//f4
bInheritHandle:LongBool;//f8
end;;
  _FILETIME = _FILETIME = record//size=8
dwLowDateTime:Cardinal;//f0
dwHighDateTime:Cardinal;//f4
end;;
  tagBITMAP = tagBITMAP = record//size=18
bmType:Integer;//f0
bmWidth:Integer;//f4
bmHeight:Integer;//f8
bmWidthBytes:Integer;//fC
bmPlanes:Word;//f10
bmBitsPixel:Word;//f12
bmBits:Pointer;//f14
end;;
  tagBITMAPINFOHEADER = tagBITMAPINFOHEADER = record//size=28
biSize:Cardinal;//f0
biWidth:Integer;//f4
biHeight:Integer;//f8
biPlanes:Word;//fC
biBitCount:Word;//fE
biCompression:Cardinal;//f10
biSizeImage:Cardinal;//f14
biXPelsPerMeter:Integer;//f18
biYPelsPerMeter:Integer;//f1C
biClrUsed:Cardinal;//f20
biClrImportant:Cardinal;//f24
end;;
  tagBITMAPINFO = tagBITMAPINFO = record//size=2C
bmiHeader:tagBITMAPINFOHEADER;//f0
bmiColors:?;//f28
end;;
  tagLOGFONTW = tagLOGFONTW = record//size=5C
lfHeight:Integer;//f0
lfWidth:Integer;//f4
lfEscapement:Integer;//f8
lfOrientation:Integer;//fC
lfWeight:Integer;//f10
lfItalic:Byte;//f14
lfUnderline:Byte;//f15
lfStrikeOut:Byte;//f16
lfCharSet:Byte;//f17
lfOutPrecision:Byte;//f18
lfClipPrecision:Byte;//f19
lfQuality:Byte;//f1A
lfPitchAndFamily:Byte;//f1B
lfFaceName:?;//f1C
end;;
  _devicemodeW = _devicemodeW = record//size=DC
dmDeviceName:?;//f0
dmSpecVersion:Word;//f40
dmDriverVersion:Word;//f42
dmSize:Word;//f44
dmDriverExtra:Word;//f46
dmFields:Cardinal;//f48
dmOrientation:SmallInt;//f4C
dmPaperSize:SmallInt;//f4E
dmPaperLength:SmallInt;//f50
dmPaperWidth:SmallInt;//f52
dmScale:SmallInt;//f54
dmCopies:SmallInt;//f56
dmDefaultSource:SmallInt;//f58
dmPrintQuality:SmallInt;//f5A
dmColor:SmallInt;//f5C
dmDuplex:SmallInt;//f5E
dmYResolution:SmallInt;//f60
dmTTOption:SmallInt;//f62
dmCollate:SmallInt;//f64
dmFormName:?;//f66
dmLogPixels:Word;//fA6
dmBitsPerPel:Cardinal;//fA8
dmPelsWidth:Cardinal;//fAC
dmPelsHeight:Cardinal;//fB0
dmDisplayFlags:Cardinal;//fB4
dmDisplayFrequency:Cardinal;//fB8
dmICMMethod:Cardinal;//fBC
dmICMIntent:Cardinal;//fC0
dmMediaType:Cardinal;//fC4
dmDitherType:Cardinal;//fC8
dmICCManufacturer:Cardinal;//fCC
dmICCModel:Cardinal;//fD0
dmPanningWidth:Cardinal;//fD4
dmPanningHeight:Cardinal;//fD8
end;;
  tagDIBSECTION = tagDIBSECTION = record//size=54
dsBm:tagBITMAP;//f0
dsBmih:tagBITMAPINFOHEADER;//f18
dsBitfields:?;//f40
dshSection:Cardinal;//f4C
dsOffset:Cardinal;//f50
end;;
  tagMSG = tagMSG = record//size=1C
hwnd:HWND;//f0
message:Cardinal;//f4
wParam:Integer;//f8
lParam:Integer;//fC
time:Cardinal;//f10
pt:TPoint;//f14
end;;
  tagMINMAXINFO = tagMINMAXINFO = record//size=28
ptReserved:TPoint;//f0
ptMaxSize:TPoint;//f8
ptMaxPosition:TPoint;//f10
ptMinTrackSize:TPoint;//f18
ptMaxTrackSize:TPoint;//f20
end;;
  tagNMHDR = tagNMHDR = record//size=C
hwndFrom:HWND;//f0
idFrom:Cardinal;//f4
code:Integer;//f8
end;;
  :1 = (odSelected, odGrayed, odDisabled, odChecked, odFocused, odDefault, odHotLight, odInactive, odNoAccel, odNoFocusRect, odReserved1, odReserved2, odComboBoxEdit);
  TOwnerDrawState = set of :1;
  tagVS_FIXEDFILEINFO = tagVS_FIXEDFILEINFO = record//size=34
dwSignature:Cardinal;//f0
dwStrucVersion:Cardinal;//f4
dwFileVersionMS:Cardinal;//f8
dwFileVersionLS:Cardinal;//fC
dwProductVersionMS:Cardinal;//f10
dwProductVersionLS:Cardinal;//f14
dwFileFlagsMask:Cardinal;//f18
dwFileFlags:Cardinal;//f1C
dwFileOS:Cardinal;//f20
dwFileType:Cardinal;//f24
dwFileSubtype:Cardinal;//f28
dwFileDateMS:Cardinal;//f2C
dwFileDateLS:Cardinal;//f30
end;;
  GESTURECONFIG = GESTURECONFIG = record//size=C
dwID:Cardinal;//f0
dwWant:Cardinal;//f4
dwBlock:Cardinal;//f8
end;;
    function GetModuleHandleW:Integer; stdcall;//0040BD60
    function LocalAlloc(size:Integer):Pointer; stdcall;//0040BD68
    function TlsGetValue:Pointer; stdcall;//0040BD70
    function TlsSetValue(lpTlsValue:Pointer):LongBool; stdcall;//0040BD78
    function AllocTlsBuffer(Size:Integer):Pointer;//0040BD80
    function GetTlsSize:Integer;//0040BD8C
    procedure InitThreadTLS;//0040BD94
    function @GetTls:Pointer;//0040BDD8
    procedure InitializeModule;//0040BE18
    procedure @InitExe;//0040BE24
    function SplitRect(const Rect:TRect; SplitType:TSplitRectType; Size:Integer):TRect;//0040BFB8
    function SplitRect(const Rect:TRect; SplitType:TSplitRectType; Percent:Double):TRect;//0040C010
    function CenteredRect(const SourceRect:TRect; const CenteredRect:TRect):TRect;//0040C0B4
    function EqualRect(const R1:TRect; const R2:TRect):Boolean;//0040C130
    function Rect(Left:Integer; Top:Integer; Right:Integer; Bottom:Integer):TRect;//0040C154
    function RectWidth(const Rect:TRect):Integer;//0040C170
    function RectHeight(const Rect:TRect):Integer;//0040C178
    //procedure sub_0040C184(?:?; ?:?; ?:?);//0040C184
    function SmallPoint(XY:LongWord):TSmallPoint;//0040C18C
    function PtInRect(const Rect:TRect; const P:TPoint):Boolean;//0040C1A4
    function IntersectRect(var Rect:TRect; const R1:TRect; const R2:TRect):Boolean;//0040C1C8
    function UnionRect(var Rect:TRect; const R1:TRect; const R2:TRect):Boolean;//0040C228
    function IsRectEmpty(const Rect:TRect):Boolean;//0040C298
    function OffsetRect(var Rect:TRect; DX:Integer; DY:Integer):Boolean;//0040C2B0
    function Bounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer):TRect;//0040C2C8
    function RegCloseKey:Integer; stdcall;//0040D38C
    function RegConnectRegistryW(hKey:HKEY; var phkResult:HKEY):LongInt; stdcall;//0040D394
    function RegCreateKeyExW(lpSubKey:PWideChar; Reserved:DWORD; lpClass:PWideChar; dwOptions:DWORD; samDesired:DWORD; lpSecurityAttributes:PSecurityAttributes; var phkResult:HKEY; lpdwDisposition:PDWORD):LongInt; stdcall;//0040D39C
    function RegDeleteKeyW(lpSubKey:PWideChar):LongInt; stdcall;//0040D3A4
    function RegDeleteValueW(lpValueName:PWideChar):LongInt; stdcall;//0040D3AC
    function RegEnumKeyExW(dwIndex:DWORD; lpName:PWideChar; var lpcbName:DWORD; lpReserved:Pointer; lpClass:PWideChar; lpcbClass:PDWORD; lpftLastWriteTime:PFileTime):LongInt; stdcall;//0040D3B4
    function RegEnumValueW(dwIndex:DWORD; lpValueName:PWideChar; var lpcbValueName:DWORD; lpReserved:Pointer; lpType:PDWORD; lpData:PByte; lpcbData:PDWORD):LongInt; stdcall;//0040D3BC
    function RegFlushKey:LongInt; stdcall;//0040D3C4
    function RegLoadKeyW(lpSubKey:PWideChar; lpFile:PWideChar):LongInt; stdcall;//0040D3CC
    function RegOpenKeyExW(lpSubKey:PWideChar; ulOptions:Cardinal; samDesired:Cardinal; var phkResult:Cardinal):Integer; stdcall;//0040D3D4
    function RegQueryInfoKeyW(lpClass:PWideChar; lpcbClass:PDWORD; lpReserved:Pointer; lpcSubKeys:PDWORD; lpcbMaxSubKeyLen:PDWORD; lpcbMaxClassLen:PDWORD; lpcValues:PDWORD; lpcbMaxValueNameLen:PDWORD; lpcbMaxValueLen:PDWORD; lpcbSecurityDescriptor:PDWORD; lpftLastWriteTime:PFileTime):LongInt; stdcall;//0040D3DC
    function RegQueryValueExW(lpValueName:PWideChar; lpReserved:Pointer; lpType:PDWORD; lpData:PByte; lpcbData:PDWORD):LongInt; stdcall;//0040D3E4
    function RegReplaceKeyW(lpSubKey:PWideChar; lpNewFile:PWideChar; lpOldFile:PWideChar):LongInt; stdcall;//0040D3EC
    function RegRestoreKeyW(lpFile:PWideChar; dwFlags:DWORD):LongInt; stdcall;//0040D3F4
    function RegSaveKeyW(lpFile:PWideChar; lpSecurityAttributes:PSecurityAttributes):LongInt; stdcall;//0040D3FC
    function RegSetValueExW(lpValueName:PWideChar; Reserved:DWORD; dwType:DWORD; lpData:Pointer; cbData:DWORD):LongInt; stdcall;//0040D404
    function RegUnLoadKeyW(lpSubKey:PWideChar):LongInt; stdcall;//0040D40C
    function Beep(dwDuration:DWORD):LongBool; stdcall;//0040D414
    function CancelIo:LongBool; stdcall;//0040D41C
    function CloseHandle:LongBool; stdcall;//0040D424
    function CompareStringW(dwCmpFlags:Integer; lpString1:PWideChar; cchCount1:Integer; lpString2:PWideChar; cchCount2:Integer):Integer; stdcall;//0040D42C
    function CompareStringA(dwCmpFlags:Integer; lpString1:PAnsiChar; cchCount1:Integer; lpString2:PAnsiChar; cchCount2:Integer):Integer; stdcall;//0040D434
    function CompareStringW(dwCmpFlags:Integer; lpString1:PWideChar; cchCount1:Integer; lpString2:PWideChar; cchCount2:Integer):Integer; stdcall;//0040D43C
    function CreateDirectoryW(Attr:Integer):WordBool; stdcall;//0040D444
    procedure dll;//0040D44C
    function CreateEventW(bManualReset:LongBool; bInitialState:LongBool; lpName:PWideChar):THandle; stdcall;//0040D45C
    function CreateFileW(dwDesiredAccess:Integer; dwShareMode:Integer; lpSecurityAttributes:Pointer; dwCreationDisposition:Integer; dwFlagsAndAttributes:Integer; hTemplateFile:Integer):Integer; stdcall;//0040D464
    function CreateFileMappingW(lpFileMappingAttributes:PSecurityAttributes; flProtect:DWORD; dwMaximumSizeHigh:DWORD; dwMaximumSizeLow:DWORD; lpName:PWideChar):THandle; stdcall;//0040D46C
    function CreateThread(StackSize:Cardinal; ThreadFunc:TThreadFunc; Parameter:Pointer; CreationFlags:Cardinal; var ThreadId:Cardinal):Integer; stdcall;//0040D474
    procedure DeleteCriticalSection; stdcall;//0040D47C
    function DeviceIoControl(dwIoControlCode:DWORD; lpInBuffer:Pointer; nInBufferSize:DWORD; lpOutBuffer:Pointer; nOutBufferSize:DWORD; var lpBytesReturned:DWORD; lpOverlapped:POverlapped):LongBool; stdcall;//0040D484
    procedure EnterCriticalSection; stdcall;//0040D48C
    function EnumCalendarInfoW(Locale:DWORD; Calendar:DWORD; CalType:DWORD):LongBool; stdcall;//0040D494
    function EnumSystemLocalesW(dwFlags:DWORD):LongBool; stdcall;//0040D49C
    procedure FindClose;//0040D4A4
    function FindFirstFileW(var lpFindFileData:_WIN32_FIND_DATAW):THandle; stdcall;//0040D4AC
    function FindResourceW(lpName:PWideChar; lpType:PWideChar):Integer; stdcall;//0040D4B4
    function FormatMessageW(lpSource:Pointer; dwMessageId:DWORD; dwLanguageId:DWORD; lpBuffer:PWideChar; nSize:DWORD; Arguments:Pointer):DWORD; stdcall;//0040D4BC
    function FreeLibrary:LongBool; stdcall;//0040D4C4
    function InterlockedCompareExchange(Exchange:Integer; Comparand:Integer):Integer;//0040D4CC
    function InterlockedExchange(V:Pointer):Pointer;//0040D4D4
    function InterlockedExchangeAdd(B:Integer):Integer;//0040D4DC
    function FreeResource:LongBool; stdcall;//0040D4E4
    function GetACP:Cardinal;//0040D4EC
    function GetCPInfo(var lpCPInfo:_cpinfo):LongBool; stdcall;//0040D4F4
    function GetCPInfoExW(dwFlags:DWORD; var lpCPInfoEx:_cpinfoExW):LongBool; stdcall;//0040D4FC
    function GetCommState(var lpDCB:_DCB):LongBool; stdcall;//0040D504
    function GetCommTimeouts(var lpCommTimeouts:_COMMTIMEOUTS):LongBool; stdcall;//0040D50C
    function GetComputerNameW(var nSize:DWORD):LongBool; stdcall;//0040D514
    function GetCurrentProcess:THandle;//0040D51C
    function GetCurrentProcessId:DWORD;//0040D524
    function GetCurrentThread:THandle;//0040D52C
    function GetCurrentThreadId:DWORD;//0040D534
    function GetDateFormatW(dwFlags:DWORD; lpDate:PSystemTime; lpFormat:PWideChar; lpDateStr:PWideChar; cchDate:Integer):Integer; stdcall;//0040D53C
    function GetDiskFreeSpaceW(var lpSectorsPerCluster:DWORD; var lpBytesPerSector:DWORD; var lpNumberOfFreeClusters:DWORD; var lpTotalNumberOfClusters:DWORD):LongBool; stdcall;//0040D544
    function GetEnvironmentVariableW(lpBuffer:PWideChar; nSize:DWORD):DWORD; stdcall;//0040D54C
    function GetExitCodeThread(var lpExitCode:DWORD):LongBool; stdcall;//0040D554
    function GetFileAttributesW:DWORD; stdcall;//0040D55C
    function GetFileSize(x:Integer):Integer; stdcall;//0040D564
    function GetFullPathNameW(nBufferLength:DWORD; lpBuffer:PWideChar; var lpFilePart:PWideChar):DWORD; stdcall;//0040D56C
    function GetLastError:DWORD;//0040D574
    procedure GetLocalTime; stdcall;//0040D57C
    function GetLocaleInfoW(LCType:Integer; lpLCData:PWideChar; cchData:Integer):Integer; stdcall;//0040D584
    function GetLocaleInfoW(LCType:Integer; lpLCData:PWideChar; cchData:Integer):Integer; stdcall;//0040D58C
    function GetLogicalDriveStringsW(lpBuffer:PWideChar):DWORD; stdcall;//0040D594
    function GetModuleFileNameW(lpFilename:PWideChar; nSize:DWORD):DWORD; stdcall;//0040D59C
    function GetModuleHandleW:Integer; stdcall;//0040D5A4
    function GetOEMCP:LongWord;//0040D5AC
    function GetOverlappedResult(const lpOverlapped:_OVERLAPPED; var lpNumberOfBytesTransferred:DWORD; bWait:LongBool):LongBool; stdcall;//0040D5B4
    function GetPrivateProfileStringW(lpKeyName:PWideChar; lpDefault:PWideChar; lpReturnedString:PWideChar; nSize:DWORD; lpFileName:PWideChar):DWORD; stdcall;//0040D5BC
    function GetProcAddress(lpProcName:PAnsiChar):Pointer; stdcall;//0040D5C4
    function GetProcAddress(hModule:HMODULE; lpProcName:PWideChar):Pointer; stdcall;//0040D5CC
    function GetStdHandle:THandle; stdcall;//0040D640
    function GetStringTypeExW(dwInfoType:DWORD; lpSrcStr:PWideChar; cchSrc:Integer; var lpCharType:void ):LongBool; stdcall;//0040D648
    function GetStringTypeExA(dwInfoType:DWORD; lpSrcStr:PAnsiChar; cchSrc:Integer; var lpCharType:void ):LongBool; stdcall;//0040D650
    procedure GetSystemInfo; stdcall;//0040D658
    function GetTempPathW(lpBuffer:PWideChar):DWORD; stdcall;//0040D660
    function GetThreadLocale:DWORD;//0040D668
    function GetThreadPriority:Integer; stdcall;//0040D670
    function GetTickCount:DWORD;//0040D678
    function GetTimeZoneInformation:DWORD; stdcall;//0040D680
    function GetUserDefaultLCID:DWORD;//0040D688
    procedure $thunk_CreateDirectoryTransactedA;//0040D690
    function LocaleNameToLCID(lpName:PWideChar; dwFlags:DWORD):Integer; stdcall;//0040D6A0
    function GetVersion:Cardinal;//0040D6A8
    function GetVersionExW:LongBool; stdcall;//0040D6B0
    function GetWindowsDirectoryW(uSize:LongWord):LongWord; stdcall;//0040D6B8
    function GlobalAddAtomW:Word; stdcall;//0040D6C0
    function GlobalAlloc(dwBytes:DWORD):THandle; stdcall;//0040D6C8
    function GlobalDeleteAtom:Word; stdcall;//0040D6D0
    function GlobalFindAtomW:Word; stdcall;//0040D6D8
    function GlobalFree:THandle; stdcall;//0040D6E0
    function GlobalLock:Pointer; stdcall;//0040D6E8
    function GlobalSize:DWORD; stdcall;//0040D6F0
    function GlobalUnlock:LongBool; stdcall;//0040D6F8
    procedure InitializeCriticalSection; stdcall;//0040D700
    function IsBadReadPtr(ucb:LongWord):LongBool; stdcall;//0040D708
    function IsBadWritePtr(ucb:LongWord):LongBool; stdcall;//0040D710
    function IsValidLocale(dwFlags:DWORD):LongBool; stdcall;//0040D718
    procedure LeaveCriticalSection; stdcall;//0040D720
    function LoadLibraryW:HMODULE; stdcall;//0040D728
    function LoadResource(hResInfo:Cardinal):Cardinal; stdcall;//0040D730
    function LocalFree:Pointer; stdcall;//0040D738
    function LockResource:Pointer; stdcall;//0040D740
    function MapViewOfFile(dwDesiredAccess:Cardinal; dwFileOffsetHigh:Cardinal; dwFileOffsetLow:Cardinal; dwNumberOfBytesToMap:Cardinal):Pointer; stdcall;//0040D748
    function MulDiv(nNumerator:Integer; nDenominator:Integer):Integer; stdcall;//0040D750
    function MultiByteToWideChar(Flags:Integer; MBStr:PAnsiChar; MBCount:Integer; WCStr:PWideChar; WCCount:Integer):Integer; stdcall;//0040D758
    function OpenFileMappingW(bInheritHandle:LongBool; lpName:PWideChar):THandle; stdcall;//0040D760
    function OpenMutexW(bInheritHandle:LongBool; lpName:PWideChar):THandle; stdcall;//0040D768
    function OpenProcess(bInheritHandle:LongBool; dwProcessId:DWORD):THandle; stdcall;//0040D770
    function IsDebuggerPresent:LongBool;//0040D778
    function QueryDosDeviceW(lpTargetPath:PWideChar; ucchMax:DWORD):DWORD; stdcall;//0040D780
    function QueryPerformanceCounter:LongBool; stdcall;//0040D788
    function QueryPerformanceFrequency:LongBool; stdcall;//0040D790
    procedure RaiseException(dwExceptionFlags:DWORD; nNumberOfArguments:DWORD; lpArguments:PDWORD); stdcall;//0040D798
    function ReadFile(var Buffer:void ; nNumberOfBytesToRead:DWORD; var lpNumberOfBytesRead:DWORD; lpOverlapped:POverlapped):LongBool; stdcall;//0040D7A0
    function ReadProcessMemory(const lpBaseAddress:Pointer; lpBuffer:Pointer; nSize:DWORD; var lpNumberOfBytesRead:DWORD):LongBool; stdcall;//0040D7A8
    function ReleaseMutex:LongBool; stdcall;//0040D7B0
    function ResetEvent:LongBool; stdcall;//0040D7B8
    function ResumeThread:DWORD; stdcall;//0040D7C0
    function SetCommState(const lpDCB:_DCB):LongBool; stdcall;//0040D7C8
    function SetCommTimeouts(const lpCommTimeouts:_COMMTIMEOUTS):LongBool; stdcall;//0040D7D0
    function SetEndOfFile:LongBool; stdcall;//0040D7D8
    function SetErrorMode:LongWord; stdcall;//0040D7E0
    function SetEvent:LongBool; stdcall;//0040D7E8
    function SetFilePointer(lDistanceToMove:LongInt; lpDistanceToMoveHigh:Pointer; dwMoveMethod:DWORD):DWORD; stdcall;//0040D7F0
    procedure SetLastError; stdcall;//0040D7F8
    function SetThreadLocale:LongBool; stdcall;//0040D800
    function SetThreadPriority(nPriority:Integer):LongBool; stdcall;//0040D808
    function SignalObjectAndWait(hObjectToWaitOn:THandle; dwMilliseconds:DWORD; bAlertable:LongBool):DWORD; stdcall;//0040D810
    function SizeofResource(hResInfo:HRSRC):DWORD; stdcall;//0040D818
    procedure Sleep; stdcall;//0040D820
    function SleepEx(bAlertable:LongBool):DWORD; stdcall;//0040D828
    function SuspendThread:DWORD; stdcall;//0040D830
    procedure SwitchToThread;//0040D838
    function TryEnterCriticalSection:LongBool; stdcall;//0040D840
    function UnmapViewOfFile:LongBool; stdcall;//0040D848
    function VerLanguageNameW(szLang:PWideChar; nSize:DWORD):DWORD; stdcall;//0040D850
    function VirtualAlloc(dwSize:Cardinal; flAllocationType:Cardinal; flProtect:Cardinal):Pointer; stdcall;//0040D858
    function VirtualAllocEx(lpAddress:Pointer; dwSize:DWORD; flAllocationType:DWORD; flProtect:DWORD):Pointer; stdcall;//0040D860
    function VirtualFree(dwSize:DWORD; dwFreeType:DWORD):LongBool; stdcall;//0040D868
    function VirtualFreeEx(lpAddress:Pointer; dwSize:DWORD; dwFreeType:DWORD):Pointer; stdcall;//0040D870
    function VirtualQuery(var lpBuffer:_MEMORY_BASIC_INFORMATION; dwLength:DWORD):DWORD; stdcall;//0040D878
    function VirtualQueryEx(lpAddress:Pointer; var lpBuffer:_MEMORY_BASIC_INFORMATION; dwLength:DWORD):DWORD; stdcall;//0040D880
    function WaitForMultipleObjectsEx(lpHandles:PWOHandleArray; bWaitAll:LongBool; dwMilliseconds:DWORD; bAlertable:LongBool):DWORD; stdcall;//0040D888
    function WaitForSingleObject(dwMilliseconds:DWORD):DWORD; stdcall;//0040D890
    function WaitForSingleObjectEx(dwMilliseconds:DWORD; bAlertable:LongBool):DWORD; stdcall;//0040D898
    function WideCharToMultiByte(dwFlags:DWORD; lpWideCharStr:PWideChar; cchWideChar:Integer; lpMultiByteStr:PAnsiChar; cchMultiByte:Integer; lpDefaultChar:PAnsiChar; lpUsedDefaultChar:PBOOL):Integer; stdcall;//0040D8A0
    function WriteFile(const Buffer:void ; nNumberOfBytesToWrite:Cardinal; var lpNumberOfBytesWritten:Cardinal; lpOverlapped:Pointer):Integer; stdcall;//0040D8A8
    function WritePrivateProfileStringW(lpKeyName:PWideChar; lpString:PWideChar; lpFileName:PWideChar):LongBool; stdcall;//0040D8B0
    function lstrlenA:Integer; stdcall;//0040D8B8
    function lstrlenW:Integer; stdcall;//0040D8C0
    function GetFileVersionInfoW(dwHandle:DWORD; dwLen:DWORD; lpData:Pointer):LongBool; stdcall;//0040D8C8
    function GetFileVersionInfoSizeW(var lpdwHandle:DWORD):DWORD; stdcall;//0040D8D0
    function VerQueryValueW(lpSubBlock:PWideChar; var lplpBuffer:Pointer; var puLen:LongWord):LongBool; stdcall;//0040D8D8
    function AbortDoc:Integer; stdcall;//0040D8E0
    function AlphaBlend(p2:Integer; p3:Integer; p4:Integer; p5:Integer; DC6:HDC; p7:Integer; p8:Integer; p9:Integer; p10:Integer; p11:_BLENDFUNCTION):LongBool; stdcall;//0040D8E8
    function AngleArc(p2:Integer; p3:Integer; p4:DWORD; p5:Single; p6:Single):LongBool; stdcall;//0040D8F0
    function Arc(left:Integer; top:Integer; right:Integer; bottom:Integer; startX:Integer; startY:Integer; endX:Integer; endY:Integer):LongBool; stdcall;//0040D8F8
    function ArcTo(RLeft:Integer; RTop:Integer; RRight:Integer; RBottom:Integer; X1:Integer; Y1:Integer; X2:Integer; Y2:Integer):LongBool; stdcall;//0040D900
    function BitBlt(X:Integer; Y:Integer; Width:Integer; Height:Integer; SrcDC:HDC; XSrc:Integer; YSrc:Integer; Rop:DWORD):LongBool; stdcall;//0040D908
    function Chord(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer; X3:Integer; Y3:Integer; X4:Integer; Y4:Integer):LongBool; stdcall;//0040D910
    function CloseEnhMetaFile:HENHMETAFILE; stdcall;//0040D918
    function CopyEnhMetaFileW(p2:PWideChar):HENHMETAFILE; stdcall;//0040D920
    function CreateBitmap(Height:Integer; Planes:LongInt; BitCount:LongInt; Bits:Pointer):HBITMAP; stdcall;//0040D928
    function CreateBrushIndirect:HBRUSH; stdcall;//0040D930
    function CreateCompatibleBitmap(Width:Integer; Height:Integer):HBITMAP; stdcall;//0040D938
    function CreateCompatibleDC:HDC; stdcall;//0040D940
    function CreateDCW(lpszDevice:PWideChar; lpszOutput:PWideChar; lpdvmInit:PDeviceModeW):HDC; stdcall;//0040D948
    function CreateDIBSection(const p2:tagBITMAPINFO; p3:LongWord; var p4:Pointer; p5:THandle; p6:DWORD):HBITMAP; stdcall;//0040D950
    function CreateDIBitmap(var InfoHeader:tagBITMAPINFOHEADER; dwUsage:DWORD; InitBits:Pointer; var InitInfo:tagBITMAPINFO; wUsage:LongWord):HBITMAP; stdcall;//0040D958
    function CreateEnhMetaFileW(FileName:PWideChar; Rect:PRect; Desc:PWideChar):HDC; stdcall;//0040D960
    function CreateFontIndirectW:HFONT; stdcall;//0040D968
    function CreateHalftonePalette:HPALETTE; stdcall;//0040D970
    function CreateICW(lpszDevice:PWideChar; lpszOutput:PWideChar; lpdvmInit:PDeviceModeW):HDC; stdcall;//0040D978
    function CreatePalette:HPALETTE; stdcall;//0040D980
    function CreatePenIndirect:HPEN; stdcall;//0040D988
    function CreateRectRgn(p2:Integer; p3:Integer; p4:Integer):HRGN; stdcall;//0040D990
    function CreateSolidBrush:HBRUSH; stdcall;//0040D998
    function DeleteDC:LongBool; stdcall;//0040D9A0
    function DeleteEnhMetaFile:LongBool; stdcall;//0040D9A8
    function DeleteObject:LongBool; stdcall;//0040D9B0
    function Ellipse(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer):LongBool; stdcall;//0040D9B8
    function EndDoc:Integer; stdcall;//0040D9C0
    function EndPage:Integer; stdcall;//0040D9C8
    function EnumFontFamiliesExW(var p2:tagLOGFONTW; p3:Pointer; p4:Integer; p5:DWORD):LongBool; stdcall;//0040D9D0
    function EnumFontsW(lpszFace:PWideChar; fntenmprc:Pointer; lpszData:PWideChar):Integer; stdcall;//0040D9D8
    function ExcludeClipRect(LeftRect:Integer; TopRect:Integer; RightRect:Integer; BottomRect:Integer):Integer; stdcall;//0040D9E0
    function ExtCreatePen(Width:DWORD; const Brush:tagLOGBRUSH; StyleCount:DWORD; Style:Pointer):HPEN; stdcall;//0040D9E8
    function ExtFloodFill(X:Integer; Y:Integer; Color:DWORD; FillType:LongWord):LongBool; stdcall;//0040D9F0
    function ExtTextOutW(X:Integer; Y:Integer; Dx:PInteger; Count:LongInt; const Str:UnicodeString; Rect:PRect; Options:LongInt):LongBool;//0040D9F8
    function FrameRgn(hrgn:HRGN; hbr:HBRUSH; Width:Integer; Height:Integer):LongBool; stdcall;//0040DA00
    function GdiFlush:LongBool;//0040DA08
    function GetBitmapBits(Count:LongInt; Bits:Pointer):LongInt; stdcall;//0040DA10
    function GetBrushOrgEx(var lppt:TPoint):LongBool; stdcall;//0040DA18
    function GetCharABCWidthsW(FirstChar:LongWord; LastChar:LongWord; const ABCStructs:void ):LongBool; stdcall;//0040DA20
    function GetClipBox(var Rect:TRect):Integer; stdcall;//0040DA28
    function GetCurrentPositionEx(Point:PPoint):LongBool; stdcall;//0040DA30
    function GetDIBColorTable(p2:LongWord; p3:LongWord; var RGBQuadStructs:void ):LongWord; stdcall;//0040DA38
    function GetDIBits(Bitmap:HBITMAP; StartScan:LongWord; NumScans:LongWord; Bits:Pointer; var BitInfo:tagBITMAPINFO; Usage:LongWord):Integer; stdcall;//0040DA40
    function GetDeviceCaps(Index:Integer):Integer; stdcall;//0040DA48
    function GetEnhMetaFileBits(p2:LongWord; p3:PByte):LongWord; stdcall;//0040DA50
    function GetEnhMetaFileDescriptionW(p2:LongWord; p3:PWideChar):LongWord; stdcall;//0040DA58
    function GetEnhMetaFileHeader(p2:LongWord; p3:PEnhMetaHeader):LongWord; stdcall;//0040DA60
    function GetEnhMetaFilePaletteEntries(p2:LongWord; p3:Pointer):LongWord; stdcall;//0040DA68
    function GetFontLanguageInfo:DWORD; stdcall;//0040DA70
    function GetObjectW(p2:Integer; p3:Pointer):Integer; stdcall;//0040DA78
    function GetPaletteEntries(StartIndex:LongWord; NumEntries:LongWord; var PaletteEntries:void ):LongWord; stdcall;//0040DA80
    function GetPixel(X:Integer; Y:Integer):DWORD; stdcall;//0040DA88
    function GetRgnBox(var p2:TRect):Integer; stdcall;//0040DA90
    function GetStockObject:HGDIOBJ; stdcall;//0040DA98
    function GetSystemPaletteEntries(StartIndex:LongWord; NumEntries:LongWord; var PaletteEntries:void ):LongWord; stdcall;//0040DAA0
    function GetTextExtentPoint32W(const Str:UnicodeString; Count:Integer; var Size:TSize):LongBool;//0040DAA8
    function GetTextExtentPointW(Str:PWideChar; Count:Integer; var Size:TSize):LongBool; stdcall;//0040DAB0
    function GetTextMetricsW(var TM:tagTEXTMETRICW):LongBool; stdcall;//0040DAB8
    function GetWinMetaFileBits(p2:LongWord; p3:PByte; p4:Integer; p5:HDC):LongWord; stdcall;//0040DAC0
    function GetWindowOrgEx(var Point:TPoint):LongBool; stdcall;//0040DAC8
    function IntersectClipRect(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer):Integer; stdcall;//0040DAD0
    function LPtoDP(var Points:void ; Count:Integer):LongBool; stdcall;//0040DAD8
    function LineTo(X:Integer; Y:Integer):LongBool; stdcall;//0040DAE0
    function MaskBlt(XDest:Integer; YDest:Integer; Width:Integer; Height:Integer; SrcDC:HDC; XScr:Integer; YScr:Integer; Mask:HBITMAP; xMask:Integer; yMask:Integer; Rop:DWORD):LongBool; stdcall;//0040DAE8
    function MoveToEx(p2:Integer; p3:Integer; p4:PPoint):LongBool; stdcall;//0040DAF0
    function PatBlt(X:Integer; Y:Integer; Width:Integer; Height:Integer; Rop:DWORD):LongBool; stdcall;//0040DAF8
    function Pie(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer; X3:Integer; Y3:Integer; X4:Integer; Y4:Integer):LongBool; stdcall;//0040DB00
    function PlayEnhMetaFile(p2:HENHMETAFILE; const p3:TRect):LongBool; stdcall;//0040DB08
    function PolyBezier(const Points:void ; Count:DWORD):LongBool; stdcall;//0040DB10
    function PolyBezierTo(const Points:void ; Count:DWORD):LongBool; stdcall;//0040DB18
    function PolyPolyline(const PointStructs:void ; const Points:void ; p4:DWORD):LongBool; stdcall;//0040DB20
    function Polygon(const Points:void ; Count:Integer):LongBool; stdcall;//0040DB28
    function Polyline(const Points:void ; Count:Integer):LongBool; stdcall;//0040DB30
    function RealizePalette:LongWord; stdcall;//0040DB38
    function RectVisible(const Rect:TRect):LongBool; stdcall;//0040DB40
    function Rectangle(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer):LongBool; stdcall;//0040DB48
    function RestoreDC(SavedDC:Integer):LongBool; stdcall;//0040DB50
    function RoundRect(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer; X3:Integer; Y3:Integer):LongBool; stdcall;//0040DB58
    function SaveDC:Integer; stdcall;//0040DB60
    function SelectClipRgn(Region:HRGN):Integer; stdcall;//0040DB68
    function SelectObject(p2:HGDIOBJ):HGDIOBJ; stdcall;//0040DB70
    function SelectPalette(Palette:HPALETTE; ForceBackground:LongBool):HPALETTE; stdcall;//0040DB78
    function SetAbortProc(lpAbortProc:TFNAbortProc):Integer; stdcall;//0040DB80
    function SetBkColor(Color:DWORD):DWORD; stdcall;//0040DB88
    function SetBkMode(BkMode:Integer):Integer; stdcall;//0040DB90
    function SetBrushOrgEx(X:Integer; Y:Integer; PrevPt:PPoint):LongBool; stdcall;//0040DB98
    function SetDIBColorTable(p2:LongWord; p3:LongWord; var RGBQuadSTructs:void ):LongWord; stdcall;//0040DBA0
    function SetDIBits(Bitmap:HBITMAP; StartScan:LongWord; NumScans:LongWord; Bits:Pointer; var BitsInfo:tagBITMAPINFO; Usage:LongWord):Integer; stdcall;//0040DBA8
    function SetEnhMetaFileBits(p2:PByte):HENHMETAFILE; stdcall;//0040DBB0
    function SetMapMode(p2:Integer):Integer; stdcall;//0040DBB8
    function SetPixel(X:Integer; Y:Integer; Color:DWORD):DWORD; stdcall;//0040DBC0
    function SetROP2(p2:Integer):Integer; stdcall;//0040DBC8
    function SetStretchBltMode(StretchMode:Integer):Integer; stdcall;//0040DBD0
    function SetTextColor(Color:DWORD):DWORD; stdcall;//0040DBD8
    function SetTextCharacterExtra(CharExtra:Integer):Integer; stdcall;//0040DBE0
    function SetViewportExtEx(XExt:Integer; YExt:Integer; Size:PSize):LongBool; stdcall;//0040DBE8
    function SetViewportOrgEx(X:Integer; Y:Integer; Point:PPoint):LongBool; stdcall;//0040DBF0
    function SetWinMetaFileBits(p2:PByte; p3:HDC; const p4:tagMETAFILEPICT):HENHMETAFILE; stdcall;//0040DBF8
    function SetWindowExtEx(XExt:Integer; YExt:Integer; Size:PSize):LongBool; stdcall;//0040DC00
    function SetWindowOrgEx(X:Integer; Y:Integer; Point:PPoint):LongBool; stdcall;//0040DC08
    function StartDocW(const p2:_DOCINFOW):Integer; stdcall;//0040DC10
    function StartPage:Integer; stdcall;//0040DC18
    function StretchBlt(X:Integer; Y:Integer; Width:Integer; Height:Integer; SrcDC:HDC; XSrc:Integer; YSrc:Integer; SrcWidth:Integer; SrcHeight:Integer; Rop:DWORD):LongBool; stdcall;//0040DC20
    function StretchDIBits(DestX:Integer; DestY:Integer; DestWidth:Integer; DestHeight:Integer; SrcX:Integer; SrcY:Integer; SrcWidth:Integer; SrcHeight:Integer; Bits:Pointer; var BitsInfo:tagBITMAPINFO; Usage:LongWord; Rop:DWORD):Integer; stdcall;//0040DC28
    function TextOutW(X:Integer; Y:Integer; Str:PWideChar; Count:Integer):LongBool; stdcall;//0040DC30
    function UnrealizeObject:LongBool; stdcall;//0040DC38
    function ActivateKeyboardLayout(Flags:LongWord):HKL; stdcall;//0040DC40
    function AdjustWindowRectEx(dwStyle:DWORD; bMenu:LongBool; dwExStyle:DWORD):LongBool; stdcall;//0040DC48
    function AttachThreadInput(idAttachTo:DWORD; fAttach:LongBool):LongBool; stdcall;//0040DC50
    function BeginDeferWindowPos:THandle; stdcall;//0040DC58
    function BeginPaint(var lpPaint:tagPAINTSTRUCT):HDC; stdcall;//0040DC60
    function BringWindowToTop:LongBool; stdcall;//0040DC68
    procedure dll;//0040DC70
    function CallNextHookEx(nCode:Integer; wParam:Integer; lParam:Integer):Integer; stdcall;//0040DC80
    function CallWindowProcW(hWnd:HWND; Msg:LongWord; wParam:Integer; lParam:Integer):Integer; stdcall;//0040DC88
    function CharLowerW:PWideChar; stdcall;//0040DC90
    function CharLowerBuffW(cchLength:DWORD):DWORD; stdcall;//0040DC98
    function CharLowerBuffA(cchLength:DWORD):DWORD; stdcall;//0040DCA0
    function CharNextW:PWideChar; stdcall;//0040DCA8
    function CharNextW:PWideChar; stdcall;//0040DCB0
    function CharUpperW:PWideChar; stdcall;//0040DCB8
    function CharUpperBuffW(cchLength:DWORD):DWORD; stdcall;//0040DCC0
    function CharUpperBuffA(cchLength:DWORD):DWORD; stdcall;//0040DCC8
    function CharUpperBuffW(cchLength:DWORD):DWORD; stdcall;//0040DCD0
    function CheckMenuItem(uIDCheckItem:LongWord; uCheck:LongWord):DWORD; stdcall;//0040DCD8
    function ClientToScreen(var lpPoint:TPoint):LongBool; stdcall;//0040DCE0
    function CloseClipboard:LongBool;//0040DCE8
    function CopyIcon:HICON; stdcall;//0040DCF0
    function CountClipboardFormats:Integer;//0040DCF8
    function CreateAcceleratorTableW(Count:Integer):HACCEL; stdcall;//0040DD00
    function CreateCaret(hBitmap:HBITMAP; nWidth:Integer; nHeight:Integer):LongBool; stdcall;//0040DD08
    function CreateIcon(nWidth:Integer; nHeight:Integer; cPlanes:Byte; cBitsPixel:Byte; lpbANDbits:Pointer; lpbXORbits:Pointer):HICON; stdcall;//0040DD10
    function CreateMenu:HMENU;//0040DD18
    function CreatePopupMenu:HMENU;//0040DD20
    function DefFrameProcW(hWndMDIClient:HWND; uMsg:LongWord; wParam:Integer; lParam:Integer):Integer; stdcall;//0040DD28
    function DefMDIChildProcW(uMsg:LongWord; wParam:Integer; lParam:Integer):Integer; stdcall;//0040DD30
    function DefWindowProcW(Msg:LongWord; wParam:Integer; lParam:Integer):Integer; stdcall;//0040DD38
    function DeferWindowPos(hWnd:HWND; hWndInsertAfter:HWND; x:Integer; y:Integer; cx:Integer; cy:Integer; uFlags:LongWord):THandle; stdcall;//0040DD40
    function DeleteMenu(uPosition:LongWord; uFlags:LongWord):LongBool; stdcall;//0040DD48
    function DestroyCaret:LongBool;//0040DD50
    function DestroyCursor:LongBool; stdcall;//0040DD58
    function DestroyIcon:LongBool; stdcall;//0040DD60
    function DestroyMenu:LongBool; stdcall;//0040DD68
    function DestroyWindow:LongBool; stdcall;//0040DD70
    function DispatchMessageW:LongInt; stdcall;//0040DD78
    function DispatchMessageA:LongInt; stdcall;//0040DD80
    function DispatchMessageW:LongInt; stdcall;//0040DD88
    function DrawAnimatedRects(idAni:Integer; const lprcFrom:TRect; const lprcTo:TRect):LongBool; stdcall;//0040DD90
    function DrawEdge(var qrc:TRect; edge:LongWord; grfFlags:LongWord):LongBool; stdcall;//0040DD98
    function DrawFocusRect(const lprc:TRect):LongBool; stdcall;//0040DDA0
    function DrawFrameControl(Rect:PRect; uType:LongWord; uState:LongWord):LongBool; stdcall;//0040DDA8
    function DrawIcon(X:Integer; Y:Integer; hIcon:HICON):LongBool; stdcall;//0040DDB0
    function DrawIconEx(xLeft:Integer; yTop:Integer; hIcon:HICON; cxWidth:Integer; cyWidth:Integer; istepIfAniCur:LongWord; hbrFlickerFreeDraw:HBRUSH; diFlags:LongWord):LongBool; stdcall;//0040DDB8
    function DrawMenuBar:LongBool; stdcall;//0040DDC0
    function DrawTextW(const lpString:UnicodeString; nCount:Integer; uFormat:LongWord; var lpRect:TRect):Integer;//0040DDC8
    function DrawTextW(const lpString:UnicodeString; nCount:Integer; uFormat:LongWord; var lpRect:TRect):Integer;//0040DDD0
    function DrawTextExW(lpchText:PWideChar; cchText:Integer; var p4:TRect; dwDTFormat:LongWord; DTParams:PDrawTextParams):Integer; stdcall;//0040DDD8
    function EmptyClipboard:LongBool;//0040DDE0
    function EnableMenuItem(uIDEnableItem:LongWord; uEnable:LongWord):LongBool; stdcall;//0040DDE8
    function EnableScrollBar(wSBflags:LongWord; wArrows:LongWord):LongBool; stdcall;//0040DDF0
    function EnableWindow(bEnable:LongBool):LongBool; stdcall;//0040DDF8
    function EndDeferWindowPos:LongBool; stdcall;//0040DE00
    function EndMenu:LongBool;//0040DE08
    function EndPaint(const lpPaint:tagPAINTSTRUCT):LongBool; stdcall;//0040DE10
    function EnumChildWindows(lpEnumFunc:Pointer; lParam:Integer):LongBool; stdcall;//0040DE18
    function EnumClipboardFormats:LongWord; stdcall;//0040DE20
    function EnumDisplayDevicesA(iDevNum:DWORD; var lpDisplayDevice:_DISPLAY_DEVICEA; dwFlags:DWORD):LongBool; stdcall;//0040DE28
    function EnumThreadWindows(lpfn:Pointer; lParam:Integer):LongBool; stdcall;//0040DE30
    function EnumWindows(lParam:Integer):LongBool; stdcall;//0040DE38
    function FillRect(const lprc:TRect; hbr:HBRUSH):Integer; stdcall;//0040DE40
    function FindWindowW(lpWindowName:PWideChar):HWND; stdcall;//0040DE48
    function FindWindowExW(Child:HWND; ClassName:PWideChar; WindowName:PWideChar):HWND; stdcall;//0040DE50
    function FlashWindowEx:LongBool; stdcall;//0040DE58
    function FrameRect(const lprc:TRect; hbr:HBRUSH):Integer; stdcall;//0040DE60
    function GetActiveWindow:HWND;//0040DE68
    function GetAncestor(gaFlags:LongWord):HWND; stdcall;//0040DE70
    function GetCapture:HWND;//0040DE78
    function GetCaretPos:LongBool; stdcall;//0040DE80
    function GetClassInfoW(lpClassName:PWideChar; var lpWndClass:tagWNDCLASSW):LongBool; stdcall;//0040DE88
    function GetClassLongW(nIndex:Integer):DWORD; stdcall;//0040DE90
    function GetClassNameW(lpClassName:PWideChar; nMaxCount:Integer):Integer; stdcall;//0040DE98
    function GetClientRect(var lpRect:TRect):LongBool; stdcall;//0040DEA0
    function GetClipboardData:THandle; stdcall;//0040DEA8
    function GetCursor:HICON;//0040DEB0
    function GetCursorInfo:LongBool; stdcall;//0040DEB8
    function GetCursorPos:LongBool; stdcall;//0040DEC0
    function GetDC:HDC; stdcall;//0040DEC8
    function GetDCEx(hrgnClip:HRGN; flags:DWORD):HDC; stdcall;//0040DED0
    function GetDesktopWindow:HWND;//0040DED8
    function GetDlgCtrlID:Integer; stdcall;//0040DEE0
    function GetDlgItem(nIDDlgItem:Integer):HWND; stdcall;//0040DEE8
    function GetDoubleClickTime:LongWord;//0040DEF0
    function GetFocus:HWND;//0040DEF8
    function GetForegroundWindow:HWND;//0040DF00
    function GetIconInfo(var piconinfo:_ICONINFO):LongBool; stdcall;//0040DF08
    function GetKeyNameTextW(lpString:PWideChar; nSize:Integer):Integer; stdcall;//0040DF10
    function GetKeyState:SmallInt; stdcall;//0040DF18
    function GetKeyboardLayout:HKL; stdcall;//0040DF20
    function GetKeyboardLayoutList(var List:void ):LongWord; stdcall;//0040DF28
    function GetKeyboardLayoutNameW:LongBool; stdcall;//0040DF30
    function GetKeyboardState:LongBool; stdcall;//0040DF38
    function GetLastActivePopup:HWND; stdcall;//0040DF40
    function GetMenu:HMENU; stdcall;//0040DF48
    function GetMenuItemCount:Integer; stdcall;//0040DF50
    function GetMenuItemID(nPos:Integer):LongWord; stdcall;//0040DF58
    function GetMenuItemInfoW(p2:LongWord; p3:LongBool; var p4:tagMENUITEMINFOW):LongBool; stdcall;//0040DF60
    function GetMenuState(uId:LongWord; uFlags:LongWord):LongWord; stdcall;//0040DF68
    function GetMenuStringW(uIDItem:LongWord; lpString:PWideChar; nMaxCount:Integer; uFlag:LongWord):Integer; stdcall;//0040DF70
    function GetMessageExtraInfo:LongInt;//0040DF78
    function GetMessagePos:DWORD;//0040DF80
    function GetMessageTime:LongInt;//0040DF88
    function GetWindow(uCmd:LongWord):HWND; stdcall;//0040DF90
    function GetParent:HWND; stdcall;//0040DF98
    function GetPropW(lpString:PWideChar):THandle; stdcall;//0040DFA0
    function GetScrollInfo(BarFlag:Integer; var ScrollInfo:tagSCROLLINFO):LongBool; stdcall;//0040DFA8
    function GetScrollPos(nBar:Integer):Integer; stdcall;//0040DFB0
    function GetScrollRange(nBar:Integer; var lpMinPos:Integer; var lpMaxPos:Integer):LongBool; stdcall;//0040DFB8
    function GetSubMenu(nPos:Integer):HMENU; stdcall;//0040DFC0
    function GetSysColor:DWORD; stdcall;//0040DFC8
    function GetSysColorBrush:HBRUSH; stdcall;//0040DFD0
    function GetSystemMenu(bRevert:LongBool):HMENU; stdcall;//0040DFD8
    function GetSystemMetrics:Integer; stdcall;//0040DFE0
    function GetTopWindow(var ReturnVar:THandle):BOOL; stdcall;//0040DFE8
    function GetWindow(uCmd:LongWord):HWND; stdcall;//0040DFF0
    function GetWindowDC:HDC; stdcall;//0040DFF8
    function GetWindowLongW(nIndex:Integer):LongInt; stdcall;//0040E000
    function GetWindowLongW(nIndex:Integer):LongInt; stdcall;//0040E008
    function GetWindowPlacement(var WindowPlacement:tagWINDOWPLACEMENT):LongBool; stdcall;//0040E010
    function GetWindowPlacement(var WindowPlacement:tagWINDOWPLACEMENT):LongBool; stdcall;//0040E018
    function GetWindowRect(var lpRect:TRect):LongBool; stdcall;//0040E020
    function GetWindowTextW(lpString:PWideChar; nMaxCount:Integer):Integer; stdcall;//0040E028
    function GetWindowThreadProcessId(var dwProcessId:DWORD):DWORD; stdcall;//0040E030
    function GetWindowThreadProcessId(var dwProcessId:DWORD):DWORD; stdcall;//0040E038
    function HideCaret:LongBool; stdcall;//0040E040
    function InflateRect(dx:Integer; dy:Integer):LongBool; stdcall;//0040E048
    function InsertMenuW(uPosition:LongWord; uFlags:LongWord; uIDNewItem:LongWord; lpNewItem:PWideChar):LongBool; stdcall;//0040E050
    function InsertMenuItemW(p2:LongWord; p3:LongBool; const p4:tagMENUITEMINFOW):LongBool; stdcall;//0040E058
    function InvalidateRect(lpRect:PRect; bErase:LongBool):LongBool; stdcall;//0040E060
    function InvalidateRect(lpRect:PRect; bErase:LongBool):LongBool; stdcall;//0040E068
    function IsCharAlphaW:LongBool; stdcall;//0040E070
    function IsCharAlphaNumericW:LongBool; stdcall;//0040E078
    function IsChild(hWnd:HWND):LongBool; stdcall;//0040E080
    function IsClipboardFormatAvailable:LongBool; stdcall;//0040E088
    function IsDialogMessageA(var lpMsg:tagMSG):LongBool; stdcall;//0040E090
    function IsDialogMessageW(var lpMsg:tagMSG):LongBool; stdcall;//0040E098
    function IsIconic:BOOL;//0040E0A0
    function IsRectEmpty:LongBool; stdcall;//0040E0A8
    function IsWindow:LongBool; stdcall;//0040E0B0
    function IsWindowEnabled:LongBool; stdcall;//0040E0B8
    function IsWindowUnicode:LongBool; stdcall;//0040E0C0
    function IsWindowVisible:LongBool; stdcall;//0040E0C8
    function IsZoomed:LongBool; stdcall;//0040E0D0
    function KillTimer(uIDEvent:LongWord):LongBool; stdcall;//0040E0D8
    function LoadBitmapW(lpBitmapName:PWideChar):HBITMAP; stdcall;//0040E0E0
    function LoadCursorW(const lpCursorName:UnicodeString):HICON;//0040E0E8
    function LoadCursorFromFileW:HICON; stdcall;//0040E0F0
    function LoadIconW(lpIconName:PWideChar):HICON; stdcall;//0040E0F8
    function LoadImageW(ImageName:PWideChar; ImageType:LongWord; X:Integer; Y:Integer; Flags:LongWord):THandle; stdcall;//0040E100
    function LoadKeyboardLayoutW(Flags:LongWord):HKL;//0040E108
    function LoadStringW(uID:LongWord; lpBuffer:PWideChar; nBufferMax:Integer):Integer; stdcall;//0040E110
    function MapVirtualKeyW(uMapType:LongWord):LongWord; stdcall;//0040E118
    function MapWindowPoints(hWndTo:HWND; var lpPoints:void ; cPoints:LongWord):Integer; stdcall;//0040E120
    function MessageBeep:LongBool; stdcall;//0040E128
    //function MessageBoxW(Text:PWideChar; Caption:PWideChar; Typ:Integer):?; stdcall;//0040E130
    function MoveWindow(X:Integer; Y:Integer; nWidth:Integer; nHeight:Integer; bRepaint:LongBool):LongBool; stdcall;//0040E138
    function MsgWaitForMultipleObjects(var pHandles:void ; fWaitAll:LongBool; dwMilliseconds:DWORD; dwWakeMask:DWORD):DWORD; stdcall;//0040E140
    function MsgWaitForMultipleObjectsEx(var pHandles:void ; dwMilliseconds:DWORD; dwWakeMask:DWORD; dwFlags:DWORD):DWORD; stdcall;//0040E148
    function OffsetRect(DX:Integer; DY:Integer):Boolean;//0040E150
    function OpenClipboard:LongBool; stdcall;//0040E158
    function PeekMessageW(hWnd:HWND; wMsgFilterMin:LongWord; wMsgFilterMax:LongWord; wRemoveMsg:LongWord):LongBool; stdcall;//0040E160
    function PeekMessageA(hWnd:HWND; wMsgFilterMin:LongWord; wMsgFilterMax:LongWord; wRemoveMsg:LongWord):LongBool; stdcall;//0040E168
    function PeekMessageW(hWnd:HWND; wMsgFilterMin:LongWord; wMsgFilterMax:LongWord; wRemoveMsg:LongWord):LongBool; stdcall;//0040E170
    function PostMessageW(Msg:LongWord; wParam:Integer; lParam:Integer):LongBool; stdcall;//0040E178
    procedure PostQuitMessage; stdcall;//0040E180
    function PtInRect(const P:TPoint):Boolean;//0040E188
    function RedrawWindow(lprcUpdate:PRect; hrgnUpdate:HRGN; flags:LongWord):LongBool; stdcall;//0040E190
    function RegisterClassW:Word; stdcall;//0040E198
    function RegisterClipboardFormatW:LongWord; stdcall;//0040E1A0
    function RegisterWindowMessageW:LongWord; stdcall;//0040E1A8
    function ReleaseCapture:LongBool;//0040E1B0
    function ReleaseDC(hDC:HDC):Integer; stdcall;//0040E1B8
    function RemoveMenu(uPosition:LongWord; uFlags:LongWord):LongBool; stdcall;//0040E1C0
    function RemovePropW(lpString:PWideChar):THandle; stdcall;//0040E1C8
    function ScreenToClient(var lpPoint:TPoint):LongBool; stdcall;//0040E1D0
    procedure $thunk_AddClipboardFormatListener;//0040E1D8
    function PhysicalToLogicalPoint(hWnd:HWND; var lpPoint:TPoint):LongBool; stdcall;//0040E1E8
    function ScrollWindow(XAmount:Integer; YAmount:Integer; Rect:PRect; ClipRect:PRect):LongBool; stdcall;//0040E1F0
    function ScrollWindowEx(dx:Integer; dy:Integer; prcScroll:PRect; prcClip:PRect; hrgnUpdate:HRGN; prcUpdate:PRect; flags:LongWord):LongBool; stdcall;//0040E1F8
    function SendMessageW(Msg:LongWord; wParam:Integer; lParam:Integer):Integer; stdcall;//0040E200
    function SendMessageA(Msg:LongWord; wParam:Integer; lParam:Integer):Integer; stdcall;//0040E208
    function SendMessageW(Msg:LongWord; wParam:Integer; lParam:Integer):Integer; stdcall;//0040E210
    function SendMessageCallbackW(Msg:LongWord; wParam:Integer; lParam:Integer; lpResultCallBack:Pointer; dwData:DWORD):LongBool; stdcall;//0040E218
    function SetActiveWindow:HWND; stdcall;//0040E220
    function SetCapture:HWND; stdcall;//0040E228
    function SetCaretPos(Y:Integer):LongBool; stdcall;//0040E230
    function SetClassLongW(nIndex:Integer; dwNewLong:LongInt):DWORD; stdcall;//0040E238
    function SetClipboardData(hMem:THandle):THandle; stdcall;//0040E240
    function SetCursor:HICON; stdcall;//0040E248
    function SetCursorPos(Y:Integer):LongBool; stdcall;//0040E250
    function SetFocus:HWND; stdcall;//0040E258
    function SetForegroundWindow:LongBool; stdcall;//0040E260
    function SetKeyboardState:LongBool; stdcall;//0040E268
    function SetMenu(hMenu:HMENU):LongBool; stdcall;//0040E270
    function SetMenuItemInfoW(p2:LongWord; p3:LongBool; const p4:tagMENUITEMINFOW):LongBool; stdcall;//0040E278
    function SetParent(hWndNewParent:HWND):HWND; stdcall;//0040E280
    function SetPropW(lpString:PWideChar; hData:THandle):LongBool; stdcall;//0040E288
    function SetRect(xLeft:Integer; yTop:Integer; xRight:Integer; yBottom:Integer):LongBool; stdcall;//0040E290
    function SetScrollInfo(BarFlag:Integer; const ScrollInfo:tagSCROLLINFO; Redraw:LongBool):Integer; stdcall;//0040E298
    function SetScrollPos(nBar:Integer; nPos:Integer; bRedraw:LongBool):Integer; stdcall;//0040E2A0
    function SetScrollRange(nBar:Integer; nMinPos:Integer; nMaxPos:Integer; bRedraw:LongBool):LongBool; stdcall;//0040E2A8
    function SetTimer(nIDEvent:LongWord; uElapse:LongWord; lpTimerFunc:Pointer):LongWord; stdcall;//0040E2B0
    function SetWindowLongW(nIndex:Integer; dwNewLong:LongInt):LongInt; stdcall;//0040E2B8
    function SetWindowLongW(nIndex:Integer; dwNewLong:LongInt):LongInt; stdcall;//0040E2C0
    function SetWindowPlacement(WindowPlacement:PWindowPlacement):LongBool; stdcall;//0040E2C8
    function SetWindowPlacement(WindowPlacement:PWindowPlacement):LongBool; stdcall;//0040E2D0
    function SetWindowPos(hWndInsertAfter:HWND; X:Integer; Y:Integer; cx:Integer; cy:Integer; uFlags:LongWord):LongBool; stdcall;//0040E2D8
    function SetWindowTextW(const lpString:UnicodeString):LongBool;//0040E2E0
    function SetWindowsHookExW(lpfn:TFNHookProc; hmod:HINST; dwThreadId:DWORD):HHOOK; stdcall;//0040E2E8
    function ShowCaret:LongBool; stdcall;//0040E2F0
    function ShowCursor:Integer; stdcall;//0040E2F8
    function ShowOwnedPopups(fShow:LongBool):LongBool; stdcall;//0040E300
    function ShowScrollBar(wBar:Integer; bShow:LongBool):LongBool; stdcall;//0040E308
    function ShowWindow(nCmdShow:Integer):LongBool; stdcall;//0040E310
    function SystemParametersInfoW(uiParam:LongWord; pvParam:Pointer; fWinIni:LongWord):LongBool; stdcall;//0040E318
    function SystemParametersInfoW(uiParam:LongWord; pvParam:Pointer; fWinIni:LongWord):LongBool; stdcall;//0040E320
    function SystemParametersInfoW(uiParam:LongWord; pvParam:Pointer; fWinIni:LongWord):LongBool; stdcall;//0040E328
    function TrackPopupMenu(uFlags:LongWord; x:Integer; y:Integer; nReserved:Integer; hWnd:HWND; prcRect:PRect):LongBool; stdcall;//0040E330
    function TranslateMDISysAccel(const lpMsg:tagMSG):LongBool; stdcall;//0040E338
    function TranslateMessage:LongBool; stdcall;//0040E340
    function UnhookWindowsHookEx:LongBool; stdcall;//0040E348
    function UnionRect(const lprcSrc1:TRect; const lprcSrc2:TRect):LongBool; stdcall;//0040E350
    function UnregisterClassW(hInstance:HINST):LongBool; stdcall;//0040E358
    function UpdateWindow:LongBool; stdcall;//0040E360
    function ValidateRect(lpRect:PRect):LongBool; stdcall;//0040E368
    function ValidateRect(lpRect:PRect):LongBool; stdcall;//0040E370
    function VkKeyScanW:SmallInt; stdcall;//0040E378
    function WaitMessage:LongBool;//0040E380
    function WindowFromPoint:HWND; stdcall;//0040E388
    //function keybd_event(bScan:Byte; dwFlags:DWORD; dwExtraInfo:DWORD):?; stdcall;//0040E390
    procedure mouse_event(dx:DWORD; dy:DWORD; dwData:DWORD; dwExtraInfo:DWORD); stdcall;//0040E398
    function CreateWindowExW(dwExStyle:DWORD; lpClassName:PWideChar; lpParam:Pointer; hInstance:HINST; hMenu:HMENU; hWndParent:HWND; nHeight:Integer; nWidth:Integer; Y:Integer; X:Integer; dwStyle:DWORD):HWND;//0040E3A0
    function CreateWindowEx(dwExStyle:DWORD; lpClassName:PWideChar; lpWindowName:PWideChar; dwStyle:DWORD; X:Integer; Y:Integer; nWidth:Integer; nHeight:Integer; hWndParent:HWND; hMenu:HMENU; hInstance:HINST; lpParam:Pointer):HWND;//0040E3A8
    function HwndMSWheel(var puiMsh_MsgMouseWheel:LongWord; var puiMsh_Msg3DSupport:LongWord; var puiMsh_MsgScrollLines:LongWord; var pf3DSupport:LongBool; var piScrollLines:Integer):HWND;//0040E400
    procedure $thunk_CalculatePopupWindowPosition;//0040E548
    function GetGestureInfo(hGestureInfo:HGESTUREINFO; var pGestureInfo:GESTUREINFO):LongBool; stdcall;//0040E558
    procedure $thunk_CloseGestureInfoHandle;//0040E560
    function CloseGestureInfoHandle(hGestureInfo:HGESTUREINFO):LongBool; stdcall;//0040E570
    procedure $thunk_CloseTouchInputHandle;//0040E578
    function SetGestureConfig(hwnd:HWND; dwReserved:DWORD; cIDs:LongWord; pGestureConfig:PGESTURECONFIG; cbSize:LongWord):LongBool; stdcall;//0040E588
    procedure InitVersionInfo;//0040E590
    function SizeOf:Integer;//0040E5CC

implementation

//0040BD60
function kernel32.GetModuleHandleW:Integer; stdcall;
begin
{*
 0040BD60    jmp         dword ptr ds:[825F5C]
*}
end;

//0040BD68
function kernel32.LocalAlloc(size:Integer):Pointer; stdcall;
begin
{*
 0040BD68    jmp         dword ptr ds:[825F58]
*}
end;

//0040BD70
function kernel32.TlsGetValue:Pointer; stdcall;
begin
{*
 0040BD70    jmp         dword ptr ds:[825F54]
*}
end;

//0040BD78
function kernel32.TlsSetValue(lpTlsValue:Pointer):LongBool; stdcall;
begin
{*
 0040BD78    jmp         dword ptr ds:[825F50]
*}
end;

//0040BD80
function AllocTlsBuffer(Size:Integer):Pointer;
begin
{*
 0040BD80    push        eax
 0040BD81    push        40
 0040BD83    call        kernel32.LocalAlloc
 0040BD88    ret
*}
end;

//0040BD8C
function GetTlsSize:Integer;
begin
{*
 0040BD8C    mov         eax,48
 0040BD91    ret
*}
end;

//0040BD94
procedure InitThreadTLS;
begin
{*
 0040BD94    push        ebx
 0040BD95    call        GetTlsSize
 0040BD9A    mov         ebx,eax
 0040BD9C    test        ebx,ebx
>0040BD9E    je          0040BDD6
 0040BDA0    cmp         dword ptr ds:[784A28],0FFFFFFFF
>0040BDA7    jne         0040BDB3
 0040BDA9    mov         eax,0E2
 0040BDAE    call        @RunError
 0040BDB3    mov         eax,ebx
 0040BDB5    call        AllocTlsBuffer
 0040BDBA    test        eax,eax
>0040BDBC    jne         0040BDCA
 0040BDBE    mov         eax,0E2
 0040BDC3    call        @RunError
>0040BDC8    jmp         0040BDD6
 0040BDCA    push        eax
 0040BDCB    mov         eax,[00784A28]
 0040BDD0    push        eax
 0040BDD1    call        kernel32.TlsSetValue
 0040BDD6    pop         ebx
 0040BDD7    ret
*}
end;

//0040BDD8
function @GetTls:Pointer;
begin
{*
 0040BDD8    mov         cl,byte ptr ds:[790C34]
 0040BDDE    mov         eax,[00784A28]
 0040BDE3    test        cl,cl
>0040BDE5    jne         0040BE0D
 0040BDE7    mov         edx,dword ptr fs:[2C]
 0040BDEE    mov         eax,dword ptr [edx+eax*4]
 0040BDF1    ret
 0040BDF2    call        InitThreadTLS
 0040BDF7    mov         eax,[00784A28]
 0040BDFC    push        eax
 0040BDFD    call        kernel32.TlsGetValue
 0040BE02    test        eax,eax
>0040BE04    je          0040BE07
 0040BE06    ret
 0040BE07    mov         eax,[00790C3C]
 0040BE0C    ret
 0040BE0D    push        eax
 0040BE0E    call        kernel32.TlsGetValue
 0040BE13    test        eax,eax
>0040BE15    je          0040BDF2
 0040BE17    ret
*}
end;

//0040BE18
procedure InitializeModule;
begin
{*
 0040BE18    mov         eax,784A30
 0040BE1D    call        RegisterModule
 0040BE22    ret
*}
end;

//0040BE24
procedure @InitExe;
begin
{*
 0040BE24    push        ebx
 0040BE25    mov         ebx,eax
 0040BE27    xor         eax,eax
 0040BE29    mov         [00784A28],eax
 0040BE2E    push        0
 0040BE30    call        kernel32.GetModuleHandleW
 0040BE35    mov         [00790C38],eax;gvar_00790C38
 0040BE3A    mov         eax,[00790C38];gvar_00790C38
 0040BE3F    mov         [00784A34],eax
 0040BE44    xor         eax,eax
 0040BE46    mov         [00784A38],eax
 0040BE4B    xor         eax,eax
 0040BE4D    mov         [00784A3C],eax
 0040BE52    lea         eax,[ebx+8]
 0040BE55    mov         [00784A44],eax
 0040BE5A    call        InitializeModule
 0040BE5F    mov         edx,784A30
 0040BE64    mov         eax,ebx
 0040BE66    call        @StartExe
 0040BE6B    pop         ebx
 0040BE6C    ret
*}
end;

//0040BFB8
function SplitRect(const Rect:TRect; SplitType:TSplitRectType; Size:Integer):TRect;
begin
{*
 0040BFB8    push        ebp
 0040BFB9    mov         ebp,esp
 0040BFBB    push        ecx
 0040BFBC    push        ebx
 0040BFBD    push        esi
 0040BFBE    push        edi
 0040BFBF    mov         dword ptr [ebp-4],ecx
 0040BFC2    mov         ebx,dword ptr [ebp+8]
 0040BFC5    mov         esi,eax
 0040BFC7    mov         edi,ebx
 0040BFC9    movs        dword ptr [edi],dword ptr [esi]
 0040BFCA    movs        dword ptr [edi],dword ptr [esi]
 0040BFCB    movs        dword ptr [edi],dword ptr [esi]
 0040BFCC    movs        dword ptr [edi],dword ptr [esi]
 0040BFCD    sub         dl,1
>0040BFD0    jb          0040BFDE
>0040BFD2    je          0040BFE8
 0040BFD4    dec         dl
>0040BFD6    je          0040BFF2
 0040BFD8    dec         dl
>0040BFDA    je          0040BFFD
>0040BFDC    jmp         0040C006
 0040BFDE    mov         eax,dword ptr [eax]
 0040BFE0    add         eax,dword ptr [ebp-4]
 0040BFE3    mov         dword ptr [ebx+8],eax
>0040BFE6    jmp         0040C006
 0040BFE8    mov         eax,dword ptr [eax+8]
 0040BFEB    sub         eax,dword ptr [ebp-4]
 0040BFEE    mov         dword ptr [ebx],eax
>0040BFF0    jmp         0040C006
 0040BFF2    mov         eax,dword ptr [eax+4]
 0040BFF5    add         eax,dword ptr [ebp-4]
 0040BFF8    mov         dword ptr [ebx+0C],eax
>0040BFFB    jmp         0040C006
 0040BFFD    mov         eax,dword ptr [eax+0C]
 0040C000    sub         eax,dword ptr [ebp-4]
 0040C003    mov         dword ptr [ebx+4],eax
 0040C006    pop         edi
 0040C007    pop         esi
 0040C008    pop         ebx
 0040C009    pop         ecx
 0040C00A    pop         ebp
 0040C00B    ret         4
*}
end;

//0040C010
function SplitRect(const Rect:TRect; SplitType:TSplitRectType; Percent:Double):TRect;
begin
{*
 0040C010    push        ebp
 0040C011    mov         ebp,esp
 0040C013    push        ecx
 0040C014    push        ebx
 0040C015    push        esi
 0040C016    push        edi
 0040C017    mov         esi,ecx
 0040C019    mov         ebx,eax
 0040C01B    push        esi
 0040C01C    mov         edi,esi
 0040C01E    mov         esi,ebx
 0040C020    movs        dword ptr [edi],dword ptr [esi]
 0040C021    movs        dword ptr [edi],dword ptr [esi]
 0040C022    movs        dword ptr [edi],dword ptr [esi]
 0040C023    movs        dword ptr [edi],dword ptr [esi]
 0040C024    pop         esi
 0040C025    sub         dl,1
>0040C028    jb          0040C036
>0040C02A    je          0040C052
 0040C02C    dec         dl
>0040C02E    je          0040C070
 0040C030    dec         dl
>0040C032    je          0040C08D
>0040C034    jmp         0040C0AA
 0040C036    mov         eax,ebx
 0040C038    call        RectWidth
 0040C03D    mov         dword ptr [ebp-4],eax
 0040C040    fild        dword ptr [ebp-4]
 0040C043    fmul        qword ptr [ebp+8]
 0040C046    call        @TRUNC
 0040C04B    add         eax,dword ptr [ebx]
 0040C04D    mov         dword ptr [esi+8],eax
>0040C050    jmp         0040C0AA
 0040C052    mov         eax,ebx
 0040C054    call        RectWidth
 0040C059    mov         dword ptr [ebp-4],eax
 0040C05C    fild        dword ptr [ebp-4]
 0040C05F    fmul        qword ptr [ebp+8]
 0040C062    call        @TRUNC
 0040C067    mov         edx,dword ptr [ebx+8]
 0040C06A    sub         edx,eax
 0040C06C    mov         dword ptr [esi],edx
>0040C06E    jmp         0040C0AA
 0040C070    mov         eax,ebx
 0040C072    call        RectHeight
 0040C077    mov         dword ptr [ebp-4],eax
 0040C07A    fild        dword ptr [ebp-4]
 0040C07D    fmul        qword ptr [ebp+8]
 0040C080    call        @TRUNC
 0040C085    add         eax,dword ptr [ebx+4]
 0040C088    mov         dword ptr [esi+0C],eax
>0040C08B    jmp         0040C0AA
 0040C08D    mov         eax,ebx
 0040C08F    call        RectHeight
 0040C094    mov         dword ptr [ebp-4],eax
 0040C097    fild        dword ptr [ebp-4]
 0040C09A    fmul        qword ptr [ebp+8]
 0040C09D    call        @TRUNC
 0040C0A2    mov         edx,dword ptr [ebx+0C]
 0040C0A5    sub         edx,eax
 0040C0A7    mov         dword ptr [esi+4],edx
 0040C0AA    pop         edi
 0040C0AB    pop         esi
 0040C0AC    pop         ebx
 0040C0AD    pop         ecx
 0040C0AE    pop         ebp
 0040C0AF    ret         8
*}
end;

//0040C0B4
function CenteredRect(const SourceRect:TRect; const CenteredRect:TRect):TRect;
begin
{*
 0040C0B4    push        ebx
 0040C0B5    push        esi
 0040C0B6    push        edi
 0040C0B7    push        ebp
 0040C0B8    push        ecx
 0040C0B9    mov         dword ptr [esp],ecx
 0040C0BC    mov         edi,edx
 0040C0BE    mov         ebx,eax
 0040C0C0    mov         eax,edi
 0040C0C2    call        RectWidth
 0040C0C7    mov         esi,eax
 0040C0C9    mov         eax,edi
 0040C0CB    call        RectHeight
 0040C0D0    mov         edi,eax
 0040C0D2    mov         ebp,dword ptr [ebx+8]
 0040C0D5    add         ebp,dword ptr [ebx]
 0040C0D7    sar         ebp,1
>0040C0D9    jns         0040C0DE
 0040C0DB    adc         ebp,0
 0040C0DE    mov         eax,dword ptr [ebx+4]
 0040C0E1    add         eax,dword ptr [ebx+0C]
 0040C0E4    sar         eax,1
>0040C0E6    jns         0040C0EB
 0040C0E8    adc         eax,0
 0040C0EB    mov         ebx,eax
 0040C0ED    lea         eax,[edi+1]
 0040C0F0    sar         eax,1
>0040C0F2    jns         0040C0F7
 0040C0F4    adc         eax,0
 0040C0F7    add         eax,ebx
 0040C0F9    push        eax
 0040C0FA    mov         eax,dword ptr [esp+4]
 0040C0FE    push        eax
 0040C0FF    sar         edi,1
>0040C101    jns         0040C106
 0040C103    adc         edi,0
 0040C106    mov         edx,ebx
 0040C108    sub         edx,edi
 0040C10A    mov         eax,esi
 0040C10C    sar         eax,1
>0040C10E    jns         0040C113
 0040C110    adc         eax,0
 0040C113    push        eax
 0040C114    mov         eax,ebp
 0040C116    pop         ecx
 0040C117    sub         eax,ecx
 0040C119    lea         ecx,[esi+1]
 0040C11C    sar         ecx,1
>0040C11E    jns         0040C123
 0040C120    adc         ecx,0
 0040C123    add         ecx,ebp
 0040C125    call        Rect
 0040C12A    pop         edx
 0040C12B    pop         ebp
 0040C12C    pop         edi
 0040C12D    pop         esi
 0040C12E    pop         ebx
 0040C12F    ret
*}
end;

//0040C130
function EqualRect(const R1:TRect; const R2:TRect):Boolean;
begin
{*
 0040C130    mov         ecx,dword ptr [eax]
 0040C132    cmp         ecx,dword ptr [edx]
>0040C134    jne         0040C14E
 0040C136    mov         ecx,dword ptr [eax+8]
 0040C139    cmp         ecx,dword ptr [edx+8]
>0040C13C    jne         0040C14E
 0040C13E    mov         ecx,dword ptr [eax+4]
 0040C141    cmp         ecx,dword ptr [edx+4]
>0040C144    jne         0040C14E
 0040C146    mov         eax,dword ptr [eax+0C]
 0040C149    cmp         eax,dword ptr [edx+0C]
>0040C14C    je          0040C151
 0040C14E    xor         eax,eax
 0040C150    ret
 0040C151    mov         al,1
 0040C153    ret
*}
end;

//0040C154
function Rect(Left:Integer; Top:Integer; Right:Integer; Bottom:Integer):TRect;
begin
{*
 0040C154    push        ebp
 0040C155    mov         ebp,esp
 0040C157    push        ebx
 0040C158    mov         ebx,dword ptr [ebp+8]
 0040C15B    mov         dword ptr [ebx],eax
 0040C15D    mov         dword ptr [ebx+4],edx
 0040C160    mov         eax,dword ptr [ebp+0C]
 0040C163    mov         dword ptr [ebx+0C],eax
 0040C166    mov         dword ptr [ebx+8],ecx
 0040C169    pop         ebx
 0040C16A    pop         ebp
 0040C16B    ret         8
*}
end;

//0040C170
function RectWidth(const Rect:TRect):Integer;
begin
{*
 0040C170    mov         edx,dword ptr [eax+8]
 0040C173    sub         edx,dword ptr [eax]
 0040C175    mov         eax,edx
 0040C177    ret
*}
end;

//0040C178
function RectHeight(const Rect:TRect):Integer;
begin
{*
 0040C178    mov         edx,dword ptr [eax+0C]
 0040C17B    sub         edx,dword ptr [eax+4]
 0040C17E    mov         eax,edx
 0040C180    ret
*}
end;

//0040C184
{*procedure sub_0040C184(?:?; ?:?; ?:?);
begin
 0040C184    mov         dword ptr [ecx],eax
 0040C186    mov         dword ptr [ecx+4],edx
 0040C189    ret
end;*}

//0040C18C
function SmallPoint(XY:LongWord):TSmallPoint;
begin
{*
 0040C18C    push        ecx
 0040C18D    mov         edx,eax
 0040C18F    and         dx,0FFFFFFFF
 0040C193    mov         word ptr [esp],dx
 0040C197    shr         eax,10
 0040C19A    mov         word ptr [esp+2],ax
 0040C19F    mov         eax,dword ptr [esp]
 0040C1A2    pop         edx
 0040C1A3    ret
*}
end;

//0040C1A4
function PtInRect(const Rect:TRect; const P:TPoint):Boolean;
begin
{*
 0040C1A4    mov         ecx,dword ptr [edx]
 0040C1A6    cmp         ecx,dword ptr [eax]
>0040C1A8    jl          0040C1BF
 0040C1AA    cmp         ecx,dword ptr [eax+8]
>0040C1AD    jge         0040C1BF
 0040C1AF    mov         ecx,dword ptr [edx+4]
 0040C1B2    cmp         ecx,dword ptr [eax+4]
>0040C1B5    jl          0040C1BF
 0040C1B7    mov         edx,dword ptr [edx+4]
 0040C1BA    cmp         edx,dword ptr [eax+0C]
>0040C1BD    jl          0040C1C2
 0040C1BF    xor         eax,eax
 0040C1C1    ret
 0040C1C2    mov         al,1
 0040C1C4    ret
*}
end;

//0040C1C8
function IntersectRect(var Rect:TRect; const R1:TRect; const R2:TRect):Boolean;
begin
{*
 0040C1C8    push        ebx
 0040C1C9    push        esi
 0040C1CA    push        edi
 0040C1CB    mov         ebx,ecx
 0040C1CD    mov         esi,eax
 0040C1CF    push        esi
 0040C1D0    mov         edi,esi
 0040C1D2    mov         esi,edx
 0040C1D4    movs        dword ptr [edi],dword ptr [esi]
 0040C1D5    movs        dword ptr [edi],dword ptr [esi]
 0040C1D6    movs        dword ptr [edi],dword ptr [esi]
 0040C1D7    movs        dword ptr [edi],dword ptr [esi]
 0040C1D8    pop         esi
 0040C1D9    mov         eax,dword ptr [ebx]
 0040C1DB    cmp         eax,dword ptr [edx]
>0040C1DD    jle         0040C1E1
 0040C1DF    mov         dword ptr [esi],eax
 0040C1E1    mov         eax,dword ptr [ebx+4]
 0040C1E4    cmp         eax,dword ptr [edx+4]
>0040C1E7    jle         0040C1EC
 0040C1E9    mov         dword ptr [esi+4],eax
 0040C1EC    mov         eax,dword ptr [ebx+8]
 0040C1EF    cmp         eax,dword ptr [edx+8]
>0040C1F2    jge         0040C1F7
 0040C1F4    mov         dword ptr [esi+8],eax
 0040C1F7    mov         eax,dword ptr [ebx+0C]
 0040C1FA    cmp         eax,dword ptr [edx+0C]
>0040C1FD    jge         0040C202
 0040C1FF    mov         dword ptr [esi+0C],eax
 0040C202    mov         eax,esi
 0040C204    call        IsRectEmpty
 0040C209    mov         ebx,eax
 0040C20B    xor         bl,1
 0040C20E    test        bl,bl
>0040C210    jne         0040C220
 0040C212    mov         eax,esi
 0040C214    xor         ecx,ecx
 0040C216    mov         edx,10
 0040C21B    call        @FillChar
 0040C220    mov         eax,ebx
 0040C222    pop         edi
 0040C223    pop         esi
 0040C224    pop         ebx
 0040C225    ret
*}
end;

//0040C228
function UnionRect(var Rect:TRect; const R1:TRect; const R2:TRect):Boolean;
begin
{*
 0040C228    push        ebx
 0040C229    push        esi
 0040C22A    push        edi
 0040C22B    mov         ebx,ecx
 0040C22D    mov         edi,edx
 0040C22F    mov         esi,eax
 0040C231    push        esi
 0040C232    push        edi
 0040C233    mov         eax,edi
 0040C235    mov         edi,esi
 0040C237    mov         esi,eax
 0040C239    movs        dword ptr [edi],dword ptr [esi]
 0040C23A    movs        dword ptr [edi],dword ptr [esi]
 0040C23B    movs        dword ptr [edi],dword ptr [esi]
 0040C23C    movs        dword ptr [edi],dword ptr [esi]
 0040C23D    pop         edi
 0040C23E    pop         esi
 0040C23F    mov         eax,ebx
 0040C241    call        IsRectEmpty
 0040C246    test        al,al
>0040C248    jne         0040C273
 0040C24A    mov         eax,dword ptr [ebx]
 0040C24C    cmp         eax,dword ptr [edi]
>0040C24E    jge         0040C252
 0040C250    mov         dword ptr [esi],eax
 0040C252    mov         eax,dword ptr [ebx+4]
 0040C255    cmp         eax,dword ptr [edi+4]
>0040C258    jge         0040C25D
 0040C25A    mov         dword ptr [esi+4],eax
 0040C25D    mov         eax,dword ptr [ebx+8]
 0040C260    cmp         eax,dword ptr [edi+8]
>0040C263    jle         0040C268
 0040C265    mov         dword ptr [esi+8],eax
 0040C268    mov         eax,dword ptr [ebx+0C]
 0040C26B    cmp         eax,dword ptr [edi+0C]
>0040C26E    jle         0040C273
 0040C270    mov         dword ptr [esi+0C],eax
 0040C273    mov         eax,esi
 0040C275    call        IsRectEmpty
 0040C27A    mov         ebx,eax
 0040C27C    xor         bl,1
 0040C27F    test        bl,bl
>0040C281    jne         0040C291
 0040C283    mov         eax,esi
 0040C285    xor         ecx,ecx
 0040C287    mov         edx,10
 0040C28C    call        @FillChar
 0040C291    mov         eax,ebx
 0040C293    pop         edi
 0040C294    pop         esi
 0040C295    pop         ebx
 0040C296    ret
*}
end;

//0040C298
function IsRectEmpty(const Rect:TRect):Boolean;
begin
{*
 0040C298    mov         edx,dword ptr [eax+8]
 0040C29B    cmp         edx,dword ptr [eax]
>0040C29D    jle         0040C2AA
 0040C29F    mov         edx,dword ptr [eax+0C]
 0040C2A2    cmp         edx,dword ptr [eax+4]
>0040C2A5    jle         0040C2AA
 0040C2A7    xor         eax,eax
 0040C2A9    ret
 0040C2AA    mov         al,1
 0040C2AC    ret
*}
end;

//0040C2B0
function OffsetRect(var Rect:TRect; DX:Integer; DY:Integer):Boolean;
begin
{*
 0040C2B0    test        eax,eax
>0040C2B2    je          0040C2C2
 0040C2B4    add         dword ptr [eax],edx
 0040C2B6    add         dword ptr [eax+8],edx
 0040C2B9    add         dword ptr [eax+4],ecx
 0040C2BC    add         dword ptr [eax+0C],ecx
 0040C2BF    mov         al,1
 0040C2C1    ret
 0040C2C2    xor         eax,eax
 0040C2C4    ret
*}
end;

//0040C2C8
function Bounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer):TRect;
begin
{*
 0040C2C8    push        ebp
 0040C2C9    mov         ebp,esp
 0040C2CB    push        ebx
 0040C2CC    mov         ebx,dword ptr [ebp+8]
 0040C2CF    mov         dword ptr [ebx],eax
 0040C2D1    mov         dword ptr [ebx+4],edx
 0040C2D4    add         ecx,eax
 0040C2D6    mov         dword ptr [ebx+8],ecx
 0040C2D9    add         edx,dword ptr [ebp+0C]
 0040C2DC    mov         dword ptr [ebx+0C],edx
 0040C2DF    pop         ebx
 0040C2E0    pop         ebp
 0040C2E1    ret         8
*}
end;

//0040D38C
function advapi32.RegCloseKey:Integer; stdcall;
begin
{*
 0040D38C    jmp         dword ptr ds:[8266D8]
*}
end;

//0040D394
function advapi32.RegConnectRegistryW(hKey:HKEY; var phkResult:HKEY):LongInt; stdcall;
begin
{*
 0040D394    jmp         dword ptr ds:[8266D4]
*}
end;

//0040D39C
function advapi32.RegCreateKeyExW(lpSubKey:PWideChar; Reserved:DWORD; lpClass:PWideChar; dwOptions:DWORD; samDesired:DWORD; lpSecurityAttributes:PSecurityAttributes; var phkResult:HKEY; lpdwDisposition:PDWORD):LongInt; stdcall;
begin
{*
 0040D39C    jmp         dword ptr ds:[8266D0]
*}
end;

//0040D3A4
function advapi32.RegDeleteKeyW(lpSubKey:PWideChar):LongInt; stdcall;
begin
{*
 0040D3A4    jmp         dword ptr ds:[8266CC]
*}
end;

//0040D3AC
function advapi32.RegDeleteValueW(lpValueName:PWideChar):LongInt; stdcall;
begin
{*
 0040D3AC    jmp         dword ptr ds:[8266C8]
*}
end;

//0040D3B4
function advapi32.RegEnumKeyExW(dwIndex:DWORD; lpName:PWideChar; var lpcbName:DWORD; lpReserved:Pointer; lpClass:PWideChar; lpcbClass:PDWORD; lpftLastWriteTime:PFileTime):LongInt; stdcall;
begin
{*
 0040D3B4    jmp         dword ptr ds:[8266C4]
*}
end;

//0040D3BC
function advapi32.RegEnumValueW(dwIndex:DWORD; lpValueName:PWideChar; var lpcbValueName:DWORD; lpReserved:Pointer; lpType:PDWORD; lpData:PByte; lpcbData:PDWORD):LongInt; stdcall;
begin
{*
 0040D3BC    jmp         dword ptr ds:[8266C0]
*}
end;

//0040D3C4
function advapi32.RegFlushKey:LongInt; stdcall;
begin
{*
 0040D3C4    jmp         dword ptr ds:[8266BC]
*}
end;

//0040D3CC
function advapi32.RegLoadKeyW(lpSubKey:PWideChar; lpFile:PWideChar):LongInt; stdcall;
begin
{*
 0040D3CC    jmp         dword ptr ds:[8266B8]
*}
end;

//0040D3D4
function advapi32.RegOpenKeyExW(lpSubKey:PWideChar; ulOptions:Cardinal; samDesired:Cardinal; var phkResult:Cardinal):Integer; stdcall;
begin
{*
 0040D3D4    jmp         dword ptr ds:[8266B4]
*}
end;

//0040D3DC
function advapi32.RegQueryInfoKeyW(lpClass:PWideChar; lpcbClass:PDWORD; lpReserved:Pointer; lpcSubKeys:PDWORD; lpcbMaxSubKeyLen:PDWORD; lpcbMaxClassLen:PDWORD; lpcValues:PDWORD; lpcbMaxValueNameLen:PDWORD; lpcbMaxValueLen:PDWORD; lpcbSecurityDescriptor:PDWORD; lpftLastWriteTime:PFileTime):LongInt; stdcall;
begin
{*
 0040D3DC    jmp         dword ptr ds:[8266B0]
*}
end;

//0040D3E4
function advapi32.RegQueryValueExW(lpValueName:PWideChar; lpReserved:Pointer; lpType:PDWORD; lpData:PByte; lpcbData:PDWORD):LongInt; stdcall;
begin
{*
 0040D3E4    jmp         dword ptr ds:[8266AC]
*}
end;

//0040D3EC
function advapi32.RegReplaceKeyW(lpSubKey:PWideChar; lpNewFile:PWideChar; lpOldFile:PWideChar):LongInt; stdcall;
begin
{*
 0040D3EC    jmp         dword ptr ds:[8266A8]
*}
end;

//0040D3F4
function advapi32.RegRestoreKeyW(lpFile:PWideChar; dwFlags:DWORD):LongInt; stdcall;
begin
{*
 0040D3F4    jmp         dword ptr ds:[8266A4]
*}
end;

//0040D3FC
function advapi32.RegSaveKeyW(lpFile:PWideChar; lpSecurityAttributes:PSecurityAttributes):LongInt; stdcall;
begin
{*
 0040D3FC    jmp         dword ptr ds:[8266A0]
*}
end;

//0040D404
function advapi32.RegSetValueExW(lpValueName:PWideChar; Reserved:DWORD; dwType:DWORD; lpData:Pointer; cbData:DWORD):LongInt; stdcall;
begin
{*
 0040D404    jmp         dword ptr ds:[82669C]
*}
end;

//0040D40C
function advapi32.RegUnLoadKeyW(lpSubKey:PWideChar):LongInt; stdcall;
begin
{*
 0040D40C    jmp         dword ptr ds:[826698]
*}
end;

//0040D414
function kernel32.Beep(dwDuration:DWORD):LongBool; stdcall;
begin
{*
 0040D414    jmp         dword ptr ds:[826690]
*}
end;

//0040D41C
function kernel32.CancelIo:LongBool; stdcall;
begin
{*
 0040D41C    jmp         dword ptr ds:[82668C]
*}
end;

//0040D424
function kernel32.CloseHandle:LongBool; stdcall;
begin
{*
 0040D424    jmp         dword ptr ds:[826688]
*}
end;

//0040D42C
function kernel32.CompareStringW(dwCmpFlags:Integer; lpString1:PWideChar; cchCount1:Integer; lpString2:PWideChar; cchCount2:Integer):Integer; stdcall;
begin
{*
 0040D42C    jmp         dword ptr ds:[826684]
*}
end;

//0040D434
function kernel32.CompareStringA(dwCmpFlags:Integer; lpString1:PAnsiChar; cchCount1:Integer; lpString2:PAnsiChar; cchCount2:Integer):Integer; stdcall;
begin
{*
 0040D434    jmp         dword ptr ds:[826680]
*}
end;

//0040D43C
function kernel32.CompareStringW(dwCmpFlags:Integer; lpString1:PWideChar; cchCount1:Integer; lpString2:PWideChar; cchCount2:Integer):Integer; stdcall;
begin
{*
 0040D43C    jmp         dword ptr ds:[826684]
*}
end;

//0040D444
function kernel32.CreateDirectoryW(Attr:Integer):WordBool; stdcall;
begin
{*
 0040D444    jmp         dword ptr ds:[82667C]
*}
end;

//0040D44C
procedure kernel32.dll;
begin
{*
 0040D44C    push        82A020
 0040D451    call        @delayLoadHelper
 0040D456    pop         ecx
 0040D457    pop         edx
 0040D458    xchg        eax,dword ptr [esp]
 0040D45B    ret
*}
end;

//0040D45C
function kernel32.CreateEventW(bManualReset:LongBool; bInitialState:LongBool; lpName:PWideChar):THandle; stdcall;
begin
{*
 0040D45C    jmp         dword ptr ds:[826678]
*}
end;

//0040D464
function kernel32.CreateFileW(dwDesiredAccess:Integer; dwShareMode:Integer; lpSecurityAttributes:Pointer; dwCreationDisposition:Integer; dwFlagsAndAttributes:Integer; hTemplateFile:Integer):Integer; stdcall;
begin
{*
 0040D464    jmp         dword ptr ds:[826674]
*}
end;

//0040D46C
function kernel32.CreateFileMappingW(lpFileMappingAttributes:PSecurityAttributes; flProtect:DWORD; dwMaximumSizeHigh:DWORD; dwMaximumSizeLow:DWORD; lpName:PWideChar):THandle; stdcall;
begin
{*
 0040D46C    jmp         dword ptr ds:[826670]
*}
end;

//0040D474
function kernel32.CreateThread(StackSize:Cardinal; ThreadFunc:TThreadFunc; Parameter:Pointer; CreationFlags:Cardinal; var ThreadId:Cardinal):Integer; stdcall;
begin
{*
 0040D474    jmp         dword ptr ds:[82666C]
*}
end;

//0040D47C
procedure kernel32.DeleteCriticalSection; stdcall;
begin
{*
 0040D47C    jmp         dword ptr ds:[826668]
*}
end;

//0040D484
function kernel32.DeviceIoControl(dwIoControlCode:DWORD; lpInBuffer:Pointer; nInBufferSize:DWORD; lpOutBuffer:Pointer; nOutBufferSize:DWORD; var lpBytesReturned:DWORD; lpOverlapped:POverlapped):LongBool; stdcall;
begin
{*
 0040D484    jmp         dword ptr ds:[826664]
*}
end;

//0040D48C
procedure kernel32.EnterCriticalSection; stdcall;
begin
{*
 0040D48C    jmp         dword ptr ds:[826660]
*}
end;

//0040D494
function kernel32.EnumCalendarInfoW(Locale:DWORD; Calendar:DWORD; CalType:DWORD):LongBool; stdcall;
begin
{*
 0040D494    jmp         dword ptr ds:[82665C]
*}
end;

//0040D49C
function kernel32.EnumSystemLocalesW(dwFlags:DWORD):LongBool; stdcall;
begin
{*
 0040D49C    jmp         dword ptr ds:[826658]
*}
end;

//0040D4A4
procedure kernel32.FindClose;
begin
{*
 0040D4A4    jmp         dword ptr ds:[826654]
*}
end;

//0040D4AC
function kernel32.FindFirstFileW(var lpFindFileData:_WIN32_FIND_DATAW):THandle; stdcall;
begin
{*
 0040D4AC    jmp         dword ptr ds:[826650]
*}
end;

//0040D4B4
function kernel32.FindResourceW(lpName:PWideChar; lpType:PWideChar):Integer; stdcall;
begin
{*
 0040D4B4    jmp         dword ptr ds:[82664C]
*}
end;

//0040D4BC
function kernel32.FormatMessageW(lpSource:Pointer; dwMessageId:DWORD; dwLanguageId:DWORD; lpBuffer:PWideChar; nSize:DWORD; Arguments:Pointer):DWORD; stdcall;
begin
{*
 0040D4BC    jmp         dword ptr ds:[826648]
*}
end;

//0040D4C4
function kernel32.FreeLibrary:LongBool; stdcall;
begin
{*
 0040D4C4    jmp         dword ptr ds:[826644]
*}
end;

//0040D4CC
function kernel32.InterlockedCompareExchange(Exchange:Integer; Comparand:Integer):Integer;
begin
{*
 0040D4CC    jmp         dword ptr ds:[826640]
*}
end;

//0040D4D4
function kernel32.InterlockedExchange(V:Pointer):Pointer;
begin
{*
 0040D4D4    jmp         dword ptr ds:[82663C]
*}
end;

//0040D4DC
function kernel32.InterlockedExchangeAdd(B:Integer):Integer;
begin
{*
 0040D4DC    jmp         dword ptr ds:[826638]
*}
end;

//0040D4E4
function kernel32.FreeResource:LongBool; stdcall;
begin
{*
 0040D4E4    jmp         dword ptr ds:[826634]
*}
end;

//0040D4EC
function kernel32.GetACP:Cardinal;
begin
{*
 0040D4EC    jmp         dword ptr ds:[826630]
*}
end;

//0040D4F4
function kernel32.GetCPInfo(var lpCPInfo:_cpinfo):LongBool; stdcall;
begin
{*
 0040D4F4    jmp         dword ptr ds:[82662C]
*}
end;

//0040D4FC
function kernel32.GetCPInfoExW(dwFlags:DWORD; var lpCPInfoEx:_cpinfoExW):LongBool; stdcall;
begin
{*
 0040D4FC    jmp         dword ptr ds:[826628]
*}
end;

//0040D504
function kernel32.GetCommState(var lpDCB:_DCB):LongBool; stdcall;
begin
{*
 0040D504    jmp         dword ptr ds:[826624]
*}
end;

//0040D50C
function kernel32.GetCommTimeouts(var lpCommTimeouts:_COMMTIMEOUTS):LongBool; stdcall;
begin
{*
 0040D50C    jmp         dword ptr ds:[826620]
*}
end;

//0040D514
function kernel32.GetComputerNameW(var nSize:DWORD):LongBool; stdcall;
begin
{*
 0040D514    jmp         dword ptr ds:[82661C]
*}
end;

//0040D51C
function kernel32.GetCurrentProcess:THandle;
begin
{*
 0040D51C    jmp         dword ptr ds:[826618]
*}
end;

//0040D524
function kernel32.GetCurrentProcessId:DWORD;
begin
{*
 0040D524    jmp         dword ptr ds:[826614]
*}
end;

//0040D52C
function kernel32.GetCurrentThread:THandle;
begin
{*
 0040D52C    jmp         dword ptr ds:[826610]
*}
end;

//0040D534
function kernel32.GetCurrentThreadId:DWORD;
begin
{*
 0040D534    jmp         dword ptr ds:[82660C]
*}
end;

//0040D53C
function kernel32.GetDateFormatW(dwFlags:DWORD; lpDate:PSystemTime; lpFormat:PWideChar; lpDateStr:PWideChar; cchDate:Integer):Integer; stdcall;
begin
{*
 0040D53C    jmp         dword ptr ds:[826608]
*}
end;

//0040D544
function kernel32.GetDiskFreeSpaceW(var lpSectorsPerCluster:DWORD; var lpBytesPerSector:DWORD; var lpNumberOfFreeClusters:DWORD; var lpTotalNumberOfClusters:DWORD):LongBool; stdcall;
begin
{*
 0040D544    jmp         dword ptr ds:[826604]
*}
end;

//0040D54C
function kernel32.GetEnvironmentVariableW(lpBuffer:PWideChar; nSize:DWORD):DWORD; stdcall;
begin
{*
 0040D54C    jmp         dword ptr ds:[826600]
*}
end;

//0040D554
function kernel32.GetExitCodeThread(var lpExitCode:DWORD):LongBool; stdcall;
begin
{*
 0040D554    jmp         dword ptr ds:[8265FC]
*}
end;

//0040D55C
function kernel32.GetFileAttributesW:DWORD; stdcall;
begin
{*
 0040D55C    jmp         dword ptr ds:[8265F8]
*}
end;

//0040D564
function kernel32.GetFileSize(x:Integer):Integer; stdcall;
begin
{*
 0040D564    jmp         dword ptr ds:[8265F4]
*}
end;

//0040D56C
function kernel32.GetFullPathNameW(nBufferLength:DWORD; lpBuffer:PWideChar; var lpFilePart:PWideChar):DWORD; stdcall;
begin
{*
 0040D56C    jmp         dword ptr ds:[8265F0]
*}
end;

//0040D574
function kernel32.GetLastError:DWORD;
begin
{*
 0040D574    jmp         dword ptr ds:[8265EC]
*}
end;

//0040D57C
procedure kernel32.GetLocalTime; stdcall;
begin
{*
 0040D57C    jmp         dword ptr ds:[8265E8]
*}
end;

//0040D584
function kernel32.GetLocaleInfoW(LCType:Integer; lpLCData:PWideChar; cchData:Integer):Integer; stdcall;
begin
{*
 0040D584    jmp         dword ptr ds:[8265E4]
*}
end;

//0040D58C
function kernel32.GetLocaleInfoW(LCType:Integer; lpLCData:PWideChar; cchData:Integer):Integer; stdcall;
begin
{*
 0040D58C    jmp         dword ptr ds:[8265E4]
*}
end;

//0040D594
function kernel32.GetLogicalDriveStringsW(lpBuffer:PWideChar):DWORD; stdcall;
begin
{*
 0040D594    jmp         dword ptr ds:[8265E0]
*}
end;

//0040D59C
function kernel32.GetModuleFileNameW(lpFilename:PWideChar; nSize:DWORD):DWORD; stdcall;
begin
{*
 0040D59C    jmp         dword ptr ds:[8265DC]
*}
end;

//0040D5A4
function kernel32.GetModuleHandleW:Integer; stdcall;
begin
{*
 0040D5A4    jmp         dword ptr ds:[8265D8]
*}
end;

//0040D5AC
function kernel32.GetOEMCP:LongWord;
begin
{*
 0040D5AC    jmp         dword ptr ds:[8265D4]
*}
end;

//0040D5B4
function kernel32.GetOverlappedResult(const lpOverlapped:_OVERLAPPED; var lpNumberOfBytesTransferred:DWORD; bWait:LongBool):LongBool; stdcall;
begin
{*
 0040D5B4    jmp         dword ptr ds:[8265D0]
*}
end;

//0040D5BC
function kernel32.GetPrivateProfileStringW(lpKeyName:PWideChar; lpDefault:PWideChar; lpReturnedString:PWideChar; nSize:DWORD; lpFileName:PWideChar):DWORD; stdcall;
begin
{*
 0040D5BC    jmp         dword ptr ds:[8265CC]
*}
end;

//0040D5C4
function kernel32.GetProcAddress(lpProcName:PAnsiChar):Pointer; stdcall;
begin
{*
 0040D5C4    jmp         dword ptr ds:[8265C8]
*}
end;

//0040D5CC
function GetProcAddress(hModule:HMODULE; lpProcName:PWideChar):Pointer; stdcall;
begin
{*
 0040D5CC    push        ebp
 0040D5CD    mov         ebp,esp
 0040D5CF    push        0
 0040D5D1    push        ebx
 0040D5D2    push        esi
 0040D5D3    mov         ebx,dword ptr [ebp+0C]
 0040D5D6    mov         esi,dword ptr [ebp+8]
 0040D5D9    xor         eax,eax
 0040D5DB    push        ebp
 0040D5DC    push        40D62F
 0040D5E1    push        dword ptr fs:[eax]
 0040D5E4    mov         dword ptr fs:[eax],esp
 0040D5E7    mov         eax,ebx
 0040D5E9    shr         eax,10
>0040D5EC    jne         0040D5F9
 0040D5EE    push        ebx
 0040D5EF    push        esi
 0040D5F0    call        kernel32.GetProcAddress
 0040D5F5    mov         ebx,eax
>0040D5F7    jmp         0040D619
 0040D5F9    lea         eax,[ebp-4]
 0040D5FC    mov         edx,ebx
 0040D5FE    mov         ecx,0
 0040D603    call        @LStrFromPWChar
 0040D608    mov         eax,dword ptr [ebp-4]
 0040D60B    call        @LStrToPChar
 0040D610    push        eax
 0040D611    push        esi
 0040D612    call        kernel32.GetProcAddress
 0040D617    mov         ebx,eax
 0040D619    xor         eax,eax
 0040D61B    pop         edx
 0040D61C    pop         ecx
 0040D61D    pop         ecx
 0040D61E    mov         dword ptr fs:[eax],edx
 0040D621    push        40D636
 0040D626    lea         eax,[ebp-4]
 0040D629    call        @LStrClr
 0040D62E    ret
>0040D62F    jmp         @HandleFinally
>0040D634    jmp         0040D626
 0040D636    mov         eax,ebx
 0040D638    pop         esi
 0040D639    pop         ebx
 0040D63A    pop         ecx
 0040D63B    pop         ebp
 0040D63C    ret         8
*}
end;

//0040D640
function kernel32.GetStdHandle:THandle; stdcall;
begin
{*
 0040D640    jmp         dword ptr ds:[8265C4]
*}
end;

//0040D648
function kernel32.GetStringTypeExW(dwInfoType:DWORD; lpSrcStr:PWideChar; cchSrc:Integer; var lpCharType:void ):LongBool; stdcall;
begin
{*
 0040D648    jmp         dword ptr ds:[8265C0]
*}
end;

//0040D650
function kernel32.GetStringTypeExA(dwInfoType:DWORD; lpSrcStr:PAnsiChar; cchSrc:Integer; var lpCharType:void ):LongBool; stdcall;
begin
{*
 0040D650    jmp         dword ptr ds:[8265BC]
*}
end;

//0040D658
procedure kernel32.GetSystemInfo; stdcall;
begin
{*
 0040D658    jmp         dword ptr ds:[8265B8]
*}
end;

//0040D660
function kernel32.GetTempPathW(lpBuffer:PWideChar):DWORD; stdcall;
begin
{*
 0040D660    jmp         dword ptr ds:[8265B4]
*}
end;

//0040D668
function kernel32.GetThreadLocale:DWORD;
begin
{*
 0040D668    jmp         dword ptr ds:[8265B0]
*}
end;

//0040D670
function kernel32.GetThreadPriority:Integer; stdcall;
begin
{*
 0040D670    jmp         dword ptr ds:[8265AC]
*}
end;

//0040D678
function kernel32.GetTickCount:DWORD;
begin
{*
 0040D678    jmp         dword ptr ds:[8265A8]
*}
end;

//0040D680
function kernel32.GetTimeZoneInformation:DWORD; stdcall;
begin
{*
 0040D680    jmp         dword ptr ds:[8265A4]
*}
end;

//0040D688
function kernel32.GetUserDefaultLCID:DWORD;
begin
{*
 0040D688    jmp         dword ptr ds:[8265A0]
*}
end;

//0040D690
procedure $thunk_CreateDirectoryTransactedA;
begin
{*
 0040D690    push        eax
 0040D691    push        edx
 0040D692    push        ecx
 0040D693    push        82A0F0;^$thunk_CreateDirectoryTransactedA
>0040D698    jmp         kernel32.dll
*}
end;

//0040D6A0
function LocaleNameToLCID(lpName:PWideChar; dwFlags:DWORD):Integer; stdcall;
begin
{*
 0040D6A0    jmp         dword ptr ds:[82A0F0]
*}
end;

//0040D6A8
function kernel32.GetVersion:Cardinal;
begin
{*
 0040D6A8    jmp         dword ptr ds:[82659C]
*}
end;

//0040D6B0
function kernel32.GetVersionExW:LongBool; stdcall;
begin
{*
 0040D6B0    jmp         dword ptr ds:[826598]
*}
end;

//0040D6B8
function kernel32.GetWindowsDirectoryW(uSize:LongWord):LongWord; stdcall;
begin
{*
 0040D6B8    jmp         dword ptr ds:[826594]
*}
end;

//0040D6C0
function kernel32.GlobalAddAtomW:Word; stdcall;
begin
{*
 0040D6C0    jmp         dword ptr ds:[826590]
*}
end;

//0040D6C8
function kernel32.GlobalAlloc(dwBytes:DWORD):THandle; stdcall;
begin
{*
 0040D6C8    jmp         dword ptr ds:[82658C]
*}
end;

//0040D6D0
function kernel32.GlobalDeleteAtom:Word; stdcall;
begin
{*
 0040D6D0    jmp         dword ptr ds:[826588]
*}
end;

//0040D6D8
function kernel32.GlobalFindAtomW:Word; stdcall;
begin
{*
 0040D6D8    jmp         dword ptr ds:[826584]
*}
end;

//0040D6E0
function kernel32.GlobalFree:THandle; stdcall;
begin
{*
 0040D6E0    jmp         dword ptr ds:[826580]
*}
end;

//0040D6E8
function kernel32.GlobalLock:Pointer; stdcall;
begin
{*
 0040D6E8    jmp         dword ptr ds:[82657C]
*}
end;

//0040D6F0
function kernel32.GlobalSize:DWORD; stdcall;
begin
{*
 0040D6F0    jmp         dword ptr ds:[826578]
*}
end;

//0040D6F8
function kernel32.GlobalUnlock:LongBool; stdcall;
begin
{*
 0040D6F8    jmp         dword ptr ds:[826574]
*}
end;

//0040D700
procedure kernel32.InitializeCriticalSection; stdcall;
begin
{*
 0040D700    jmp         dword ptr ds:[826570]
*}
end;

//0040D708
function kernel32.IsBadReadPtr(ucb:LongWord):LongBool; stdcall;
begin
{*
 0040D708    jmp         dword ptr ds:[82656C]
*}
end;

//0040D710
function kernel32.IsBadWritePtr(ucb:LongWord):LongBool; stdcall;
begin
{*
 0040D710    jmp         dword ptr ds:[826568]
*}
end;

//0040D718
function kernel32.IsValidLocale(dwFlags:DWORD):LongBool; stdcall;
begin
{*
 0040D718    jmp         dword ptr ds:[826564]
*}
end;

//0040D720
procedure kernel32.LeaveCriticalSection; stdcall;
begin
{*
 0040D720    jmp         dword ptr ds:[826560]
*}
end;

//0040D728
function kernel32.LoadLibraryW:HMODULE; stdcall;
begin
{*
 0040D728    jmp         dword ptr ds:[82655C]
*}
end;

//0040D730
function kernel32.LoadResource(hResInfo:Cardinal):Cardinal; stdcall;
begin
{*
 0040D730    jmp         dword ptr ds:[826558]
*}
end;

//0040D738
function kernel32.LocalFree:Pointer; stdcall;
begin
{*
 0040D738    jmp         dword ptr ds:[826554]
*}
end;

//0040D740
function kernel32.LockResource:Pointer; stdcall;
begin
{*
 0040D740    jmp         dword ptr ds:[826550]
*}
end;

//0040D748
function kernel32.MapViewOfFile(dwDesiredAccess:Cardinal; dwFileOffsetHigh:Cardinal; dwFileOffsetLow:Cardinal; dwNumberOfBytesToMap:Cardinal):Pointer; stdcall;
begin
{*
 0040D748    jmp         dword ptr ds:[82654C]
*}
end;

//0040D750
function kernel32.MulDiv(nNumerator:Integer; nDenominator:Integer):Integer; stdcall;
begin
{*
 0040D750    jmp         dword ptr ds:[826548]
*}
end;

//0040D758
function kernel32.MultiByteToWideChar(Flags:Integer; MBStr:PAnsiChar; MBCount:Integer; WCStr:PWideChar; WCCount:Integer):Integer; stdcall;
begin
{*
 0040D758    jmp         dword ptr ds:[826544]
*}
end;

//0040D760
function kernel32.OpenFileMappingW(bInheritHandle:LongBool; lpName:PWideChar):THandle; stdcall;
begin
{*
 0040D760    jmp         dword ptr ds:[826540]
*}
end;

//0040D768
function kernel32.OpenMutexW(bInheritHandle:LongBool; lpName:PWideChar):THandle; stdcall;
begin
{*
 0040D768    jmp         dword ptr ds:[82653C]
*}
end;

//0040D770
function kernel32.OpenProcess(bInheritHandle:LongBool; dwProcessId:DWORD):THandle; stdcall;
begin
{*
 0040D770    jmp         dword ptr ds:[826538]
*}
end;

//0040D778
function kernel32.IsDebuggerPresent:LongBool;
begin
{*
 0040D778    jmp         dword ptr ds:[826534]
*}
end;

//0040D780
function kernel32.QueryDosDeviceW(lpTargetPath:PWideChar; ucchMax:DWORD):DWORD; stdcall;
begin
{*
 0040D780    jmp         dword ptr ds:[826530]
*}
end;

//0040D788
function kernel32.QueryPerformanceCounter:LongBool; stdcall;
begin
{*
 0040D788    jmp         dword ptr ds:[82652C]
*}
end;

//0040D790
function kernel32.QueryPerformanceFrequency:LongBool; stdcall;
begin
{*
 0040D790    jmp         dword ptr ds:[826528]
*}
end;

//0040D798
procedure kernel32.RaiseException(dwExceptionFlags:DWORD; nNumberOfArguments:DWORD; lpArguments:PDWORD); stdcall;
begin
{*
 0040D798    jmp         dword ptr ds:[826524]
*}
end;

//0040D7A0
function kernel32.ReadFile(var Buffer:void ; nNumberOfBytesToRead:DWORD; var lpNumberOfBytesRead:DWORD; lpOverlapped:POverlapped):LongBool; stdcall;
begin
{*
 0040D7A0    jmp         dword ptr ds:[826520]
*}
end;

//0040D7A8
function kernel32.ReadProcessMemory(const lpBaseAddress:Pointer; lpBuffer:Pointer; nSize:DWORD; var lpNumberOfBytesRead:DWORD):LongBool; stdcall;
begin
{*
 0040D7A8    jmp         dword ptr ds:[82651C]
*}
end;

//0040D7B0
function kernel32.ReleaseMutex:LongBool; stdcall;
begin
{*
 0040D7B0    jmp         dword ptr ds:[826518]
*}
end;

//0040D7B8
function kernel32.ResetEvent:LongBool; stdcall;
begin
{*
 0040D7B8    jmp         dword ptr ds:[826514]
*}
end;

//0040D7C0
function kernel32.ResumeThread:DWORD; stdcall;
begin
{*
 0040D7C0    jmp         dword ptr ds:[826510]
*}
end;

//0040D7C8
function kernel32.SetCommState(const lpDCB:_DCB):LongBool; stdcall;
begin
{*
 0040D7C8    jmp         dword ptr ds:[82650C]
*}
end;

//0040D7D0
function kernel32.SetCommTimeouts(const lpCommTimeouts:_COMMTIMEOUTS):LongBool; stdcall;
begin
{*
 0040D7D0    jmp         dword ptr ds:[826508]
*}
end;

//0040D7D8
function kernel32.SetEndOfFile:LongBool; stdcall;
begin
{*
 0040D7D8    jmp         dword ptr ds:[826504]
*}
end;

//0040D7E0
function kernel32.SetErrorMode:LongWord; stdcall;
begin
{*
 0040D7E0    jmp         dword ptr ds:[826500]
*}
end;

//0040D7E8
function kernel32.SetEvent:LongBool; stdcall;
begin
{*
 0040D7E8    jmp         dword ptr ds:[8264FC]
*}
end;

//0040D7F0
function kernel32.SetFilePointer(lDistanceToMove:LongInt; lpDistanceToMoveHigh:Pointer; dwMoveMethod:DWORD):DWORD; stdcall;
begin
{*
 0040D7F0    jmp         dword ptr ds:[8264F8]
*}
end;

//0040D7F8
procedure kernel32.SetLastError; stdcall;
begin
{*
 0040D7F8    jmp         dword ptr ds:[8264F4]
*}
end;

//0040D800
function kernel32.SetThreadLocale:LongBool; stdcall;
begin
{*
 0040D800    jmp         dword ptr ds:[8264F0]
*}
end;

//0040D808
function kernel32.SetThreadPriority(nPriority:Integer):LongBool; stdcall;
begin
{*
 0040D808    jmp         dword ptr ds:[8264EC]
*}
end;

//0040D810
function kernel32.SignalObjectAndWait(hObjectToWaitOn:THandle; dwMilliseconds:DWORD; bAlertable:LongBool):DWORD; stdcall;
begin
{*
 0040D810    jmp         dword ptr ds:[8264E8]
*}
end;

//0040D818
function kernel32.SizeofResource(hResInfo:HRSRC):DWORD; stdcall;
begin
{*
 0040D818    jmp         dword ptr ds:[8264E4]
*}
end;

//0040D820
procedure kernel32.Sleep; stdcall;
begin
{*
 0040D820    jmp         dword ptr ds:[8264E0]
*}
end;

//0040D828
function kernel32.SleepEx(bAlertable:LongBool):DWORD; stdcall;
begin
{*
 0040D828    jmp         dword ptr ds:[8264DC]
*}
end;

//0040D830
function kernel32.SuspendThread:DWORD; stdcall;
begin
{*
 0040D830    jmp         dword ptr ds:[8264D8]
*}
end;

//0040D838
procedure kernel32.SwitchToThread;
begin
{*
 0040D838    jmp         dword ptr ds:[8264D4]
*}
end;

//0040D840
function kernel32.TryEnterCriticalSection:LongBool; stdcall;
begin
{*
 0040D840    jmp         dword ptr ds:[8264D0]
*}
end;

//0040D848
function kernel32.UnmapViewOfFile:LongBool; stdcall;
begin
{*
 0040D848    jmp         dword ptr ds:[8264CC]
*}
end;

//0040D850
function kernel32.VerLanguageNameW(szLang:PWideChar; nSize:DWORD):DWORD; stdcall;
begin
{*
 0040D850    jmp         dword ptr ds:[8264C8]
*}
end;

//0040D858
function kernel32.VirtualAlloc(dwSize:Cardinal; flAllocationType:Cardinal; flProtect:Cardinal):Pointer; stdcall;
begin
{*
 0040D858    jmp         dword ptr ds:[8264C4]
*}
end;

//0040D860
function kernel32.VirtualAllocEx(lpAddress:Pointer; dwSize:DWORD; flAllocationType:DWORD; flProtect:DWORD):Pointer; stdcall;
begin
{*
 0040D860    jmp         dword ptr ds:[8264C0]
*}
end;

//0040D868
function kernel32.VirtualFree(dwSize:DWORD; dwFreeType:DWORD):LongBool; stdcall;
begin
{*
 0040D868    jmp         dword ptr ds:[8264BC]
*}
end;

//0040D870
function kernel32.VirtualFreeEx(lpAddress:Pointer; dwSize:DWORD; dwFreeType:DWORD):Pointer; stdcall;
begin
{*
 0040D870    jmp         dword ptr ds:[8264B8]
*}
end;

//0040D878
function kernel32.VirtualQuery(var lpBuffer:_MEMORY_BASIC_INFORMATION; dwLength:DWORD):DWORD; stdcall;
begin
{*
 0040D878    jmp         dword ptr ds:[8264B4]
*}
end;

//0040D880
function kernel32.VirtualQueryEx(lpAddress:Pointer; var lpBuffer:_MEMORY_BASIC_INFORMATION; dwLength:DWORD):DWORD; stdcall;
begin
{*
 0040D880    jmp         dword ptr ds:[8264B0]
*}
end;

//0040D888
function kernel32.WaitForMultipleObjectsEx(lpHandles:PWOHandleArray; bWaitAll:LongBool; dwMilliseconds:DWORD; bAlertable:LongBool):DWORD; stdcall;
begin
{*
 0040D888    jmp         dword ptr ds:[8264AC]
*}
end;

//0040D890
function kernel32.WaitForSingleObject(dwMilliseconds:DWORD):DWORD; stdcall;
begin
{*
 0040D890    jmp         dword ptr ds:[8264A8]
*}
end;

//0040D898
function kernel32.WaitForSingleObjectEx(dwMilliseconds:DWORD; bAlertable:LongBool):DWORD; stdcall;
begin
{*
 0040D898    jmp         dword ptr ds:[8264A4]
*}
end;

//0040D8A0
function kernel32.WideCharToMultiByte(dwFlags:DWORD; lpWideCharStr:PWideChar; cchWideChar:Integer; lpMultiByteStr:PAnsiChar; cchMultiByte:Integer; lpDefaultChar:PAnsiChar; lpUsedDefaultChar:PBOOL):Integer; stdcall;
begin
{*
 0040D8A0    jmp         dword ptr ds:[8264A0]
*}
end;

//0040D8A8
function kernel32.WriteFile(const Buffer:void ; nNumberOfBytesToWrite:Cardinal; var lpNumberOfBytesWritten:Cardinal; lpOverlapped:Pointer):Integer; stdcall;
begin
{*
 0040D8A8    jmp         dword ptr ds:[82649C]
*}
end;

//0040D8B0
function kernel32.WritePrivateProfileStringW(lpKeyName:PWideChar; lpString:PWideChar; lpFileName:PWideChar):LongBool; stdcall;
begin
{*
 0040D8B0    jmp         dword ptr ds:[826498]
*}
end;

//0040D8B8
function kernel32.lstrlenA:Integer; stdcall;
begin
{*
 0040D8B8    jmp         dword ptr ds:[826490]
*}
end;

//0040D8C0
function kernel32.lstrlenW:Integer; stdcall;
begin
{*
 0040D8C0    jmp         dword ptr ds:[826494]
*}
end;

//0040D8C8
function version.GetFileVersionInfoW(dwHandle:DWORD; dwLen:DWORD; lpData:Pointer):LongBool; stdcall;
begin
{*
 0040D8C8    jmp         dword ptr ds:[826488]
*}
end;

//0040D8D0
function version.GetFileVersionInfoSizeW(var lpdwHandle:DWORD):DWORD; stdcall;
begin
{*
 0040D8D0    jmp         dword ptr ds:[826484]
*}
end;

//0040D8D8
function version.VerQueryValueW(lpSubBlock:PWideChar; var lplpBuffer:Pointer; var puLen:LongWord):LongBool; stdcall;
begin
{*
 0040D8D8    jmp         dword ptr ds:[826480]
*}
end;

//0040D8E0
function gdi32.AbortDoc:Integer; stdcall;
begin
{*
 0040D8E0    jmp         dword ptr ds:[826478]
*}
end;

//0040D8E8
function msimg32.AlphaBlend(p2:Integer; p3:Integer; p4:Integer; p5:Integer; DC6:HDC; p7:Integer; p8:Integer; p9:Integer; p10:Integer; p11:_BLENDFUNCTION):LongBool; stdcall;
begin
{*
 0040D8E8    jmp         dword ptr ds:[8262C8]
*}
end;

//0040D8F0
function gdi32.AngleArc(p2:Integer; p3:Integer; p4:DWORD; p5:Single; p6:Single):LongBool; stdcall;
begin
{*
 0040D8F0    jmp         dword ptr ds:[826474]
*}
end;

//0040D8F8
function gdi32.Arc(left:Integer; top:Integer; right:Integer; bottom:Integer; startX:Integer; startY:Integer; endX:Integer; endY:Integer):LongBool; stdcall;
begin
{*
 0040D8F8    jmp         dword ptr ds:[826470]
*}
end;

//0040D900
function gdi32.ArcTo(RLeft:Integer; RTop:Integer; RRight:Integer; RBottom:Integer; X1:Integer; Y1:Integer; X2:Integer; Y2:Integer):LongBool; stdcall;
begin
{*
 0040D900    jmp         dword ptr ds:[82646C]
*}
end;

//0040D908
function gdi32.BitBlt(X:Integer; Y:Integer; Width:Integer; Height:Integer; SrcDC:HDC; XSrc:Integer; YSrc:Integer; Rop:DWORD):LongBool; stdcall;
begin
{*
 0040D908    jmp         dword ptr ds:[826468]
*}
end;

//0040D910
function gdi32.Chord(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer; X3:Integer; Y3:Integer; X4:Integer; Y4:Integer):LongBool; stdcall;
begin
{*
 0040D910    jmp         dword ptr ds:[826464]
*}
end;

//0040D918
function gdi32.CloseEnhMetaFile:HENHMETAFILE; stdcall;
begin
{*
 0040D918    jmp         dword ptr ds:[826460]
*}
end;

//0040D920
function gdi32.CopyEnhMetaFileW(p2:PWideChar):HENHMETAFILE; stdcall;
begin
{*
 0040D920    jmp         dword ptr ds:[82645C]
*}
end;

//0040D928
function gdi32.CreateBitmap(Height:Integer; Planes:LongInt; BitCount:LongInt; Bits:Pointer):HBITMAP; stdcall;
begin
{*
 0040D928    jmp         dword ptr ds:[826458]
*}
end;

//0040D930
function gdi32.CreateBrushIndirect:HBRUSH; stdcall;
begin
{*
 0040D930    jmp         dword ptr ds:[826454]
*}
end;

//0040D938
function gdi32.CreateCompatibleBitmap(Width:Integer; Height:Integer):HBITMAP; stdcall;
begin
{*
 0040D938    jmp         dword ptr ds:[826450]
*}
end;

//0040D940
function gdi32.CreateCompatibleDC:HDC; stdcall;
begin
{*
 0040D940    jmp         dword ptr ds:[82644C]
*}
end;

//0040D948
function gdi32.CreateDCW(lpszDevice:PWideChar; lpszOutput:PWideChar; lpdvmInit:PDeviceModeW):HDC; stdcall;
begin
{*
 0040D948    jmp         dword ptr ds:[826448]
*}
end;

//0040D950
function gdi32.CreateDIBSection(const p2:tagBITMAPINFO; p3:LongWord; var p4:Pointer; p5:THandle; p6:DWORD):HBITMAP; stdcall;
begin
{*
 0040D950    jmp         dword ptr ds:[826444]
*}
end;

//0040D958
function gdi32.CreateDIBitmap(var InfoHeader:tagBITMAPINFOHEADER; dwUsage:DWORD; InitBits:Pointer; var InitInfo:tagBITMAPINFO; wUsage:LongWord):HBITMAP; stdcall;
begin
{*
 0040D958    jmp         dword ptr ds:[826440]
*}
end;

//0040D960
function gdi32.CreateEnhMetaFileW(FileName:PWideChar; Rect:PRect; Desc:PWideChar):HDC; stdcall;
begin
{*
 0040D960    jmp         dword ptr ds:[82643C]
*}
end;

//0040D968
function gdi32.CreateFontIndirectW:HFONT; stdcall;
begin
{*
 0040D968    jmp         dword ptr ds:[826438]
*}
end;

//0040D970
function gdi32.CreateHalftonePalette:HPALETTE; stdcall;
begin
{*
 0040D970    jmp         dword ptr ds:[826434]
*}
end;

//0040D978
function gdi32.CreateICW(lpszDevice:PWideChar; lpszOutput:PWideChar; lpdvmInit:PDeviceModeW):HDC; stdcall;
begin
{*
 0040D978    jmp         dword ptr ds:[826430]
*}
end;

//0040D980
function gdi32.CreatePalette:HPALETTE; stdcall;
begin
{*
 0040D980    jmp         dword ptr ds:[82642C]
*}
end;

//0040D988
function gdi32.CreatePenIndirect:HPEN; stdcall;
begin
{*
 0040D988    jmp         dword ptr ds:[826428]
*}
end;

//0040D990
function gdi32.CreateRectRgn(p2:Integer; p3:Integer; p4:Integer):HRGN; stdcall;
begin
{*
 0040D990    jmp         dword ptr ds:[826424]
*}
end;

//0040D998
function gdi32.CreateSolidBrush:HBRUSH; stdcall;
begin
{*
 0040D998    jmp         dword ptr ds:[826420]
*}
end;

//0040D9A0
function gdi32.DeleteDC:LongBool; stdcall;
begin
{*
 0040D9A0    jmp         dword ptr ds:[82641C]
*}
end;

//0040D9A8
function gdi32.DeleteEnhMetaFile:LongBool; stdcall;
begin
{*
 0040D9A8    jmp         dword ptr ds:[826418]
*}
end;

//0040D9B0
function gdi32.DeleteObject:LongBool; stdcall;
begin
{*
 0040D9B0    jmp         dword ptr ds:[826414]
*}
end;

//0040D9B8
function gdi32.Ellipse(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer):LongBool; stdcall;
begin
{*
 0040D9B8    jmp         dword ptr ds:[826410]
*}
end;

//0040D9C0
function gdi32.EndDoc:Integer; stdcall;
begin
{*
 0040D9C0    jmp         dword ptr ds:[82640C]
*}
end;

//0040D9C8
function gdi32.EndPage:Integer; stdcall;
begin
{*
 0040D9C8    jmp         dword ptr ds:[826408]
*}
end;

//0040D9D0
function gdi32.EnumFontFamiliesExW(var p2:tagLOGFONTW; p3:Pointer; p4:Integer; p5:DWORD):LongBool; stdcall;
begin
{*
 0040D9D0    jmp         dword ptr ds:[826404]
*}
end;

//0040D9D8
function gdi32.EnumFontsW(lpszFace:PWideChar; fntenmprc:Pointer; lpszData:PWideChar):Integer; stdcall;
begin
{*
 0040D9D8    jmp         dword ptr ds:[826400]
*}
end;

//0040D9E0
function gdi32.ExcludeClipRect(LeftRect:Integer; TopRect:Integer; RightRect:Integer; BottomRect:Integer):Integer; stdcall;
begin
{*
 0040D9E0    jmp         dword ptr ds:[8263FC]
*}
end;

//0040D9E8
function gdi32.ExtCreatePen(Width:DWORD; const Brush:tagLOGBRUSH; StyleCount:DWORD; Style:Pointer):HPEN; stdcall;
begin
{*
 0040D9E8    jmp         dword ptr ds:[8263F8]
*}
end;

//0040D9F0
function gdi32.ExtFloodFill(X:Integer; Y:Integer; Color:DWORD; FillType:LongWord):LongBool; stdcall;
begin
{*
 0040D9F0    jmp         dword ptr ds:[8263F4]
*}
end;

//0040D9F8
function gdi32.ExtTextOutW(X:Integer; Y:Integer; Dx:PInteger; Count:LongInt; const Str:UnicodeString; Rect:PRect; Options:LongInt):LongBool;
begin
{*
 0040D9F8    jmp         dword ptr ds:[8263F0]
*}
end;

//0040DA00
function gdi32.FrameRgn(hrgn:HRGN; hbr:HBRUSH; Width:Integer; Height:Integer):LongBool; stdcall;
begin
{*
 0040DA00    jmp         dword ptr ds:[8263EC]
*}
end;

//0040DA08
function gdi32.GdiFlush:LongBool;
begin
{*
 0040DA08    jmp         dword ptr ds:[8263E8]
*}
end;

//0040DA10
function gdi32.GetBitmapBits(Count:LongInt; Bits:Pointer):LongInt; stdcall;
begin
{*
 0040DA10    jmp         dword ptr ds:[8263E4]
*}
end;

//0040DA18
function gdi32.GetBrushOrgEx(var lppt:TPoint):LongBool; stdcall;
begin
{*
 0040DA18    jmp         dword ptr ds:[8263E0]
*}
end;

//0040DA20
function gdi32.GetCharABCWidthsW(FirstChar:LongWord; LastChar:LongWord; const ABCStructs:void ):LongBool; stdcall;
begin
{*
 0040DA20    jmp         dword ptr ds:[8263DC]
*}
end;

//0040DA28
function gdi32.GetClipBox(var Rect:TRect):Integer; stdcall;
begin
{*
 0040DA28    jmp         dword ptr ds:[8263D8]
*}
end;

//0040DA30
function gdi32.GetCurrentPositionEx(Point:PPoint):LongBool; stdcall;
begin
{*
 0040DA30    jmp         dword ptr ds:[8263D4]
*}
end;

//0040DA38
function gdi32.GetDIBColorTable(p2:LongWord; p3:LongWord; var RGBQuadStructs:void ):LongWord; stdcall;
begin
{*
 0040DA38    jmp         dword ptr ds:[8263D0]
*}
end;

//0040DA40
function gdi32.GetDIBits(Bitmap:HBITMAP; StartScan:LongWord; NumScans:LongWord; Bits:Pointer; var BitInfo:tagBITMAPINFO; Usage:LongWord):Integer; stdcall;
begin
{*
 0040DA40    jmp         dword ptr ds:[8263CC]
*}
end;

//0040DA48
function gdi32.GetDeviceCaps(Index:Integer):Integer; stdcall;
begin
{*
 0040DA48    jmp         dword ptr ds:[8263C8]
*}
end;

//0040DA50
function gdi32.GetEnhMetaFileBits(p2:LongWord; p3:PByte):LongWord; stdcall;
begin
{*
 0040DA50    jmp         dword ptr ds:[8263C4]
*}
end;

//0040DA58
function gdi32.GetEnhMetaFileDescriptionW(p2:LongWord; p3:PWideChar):LongWord; stdcall;
begin
{*
 0040DA58    jmp         dword ptr ds:[8263C0]
*}
end;

//0040DA60
function gdi32.GetEnhMetaFileHeader(p2:LongWord; p3:PEnhMetaHeader):LongWord; stdcall;
begin
{*
 0040DA60    jmp         dword ptr ds:[8263BC]
*}
end;

//0040DA68
function gdi32.GetEnhMetaFilePaletteEntries(p2:LongWord; p3:Pointer):LongWord; stdcall;
begin
{*
 0040DA68    jmp         dword ptr ds:[8263B8]
*}
end;

//0040DA70
function gdi32.GetFontLanguageInfo:DWORD; stdcall;
begin
{*
 0040DA70    jmp         dword ptr ds:[8263B4]
*}
end;

//0040DA78
function gdi32.GetObjectW(p2:Integer; p3:Pointer):Integer; stdcall;
begin
{*
 0040DA78    jmp         dword ptr ds:[8263B0]
*}
end;

//0040DA80
function gdi32.GetPaletteEntries(StartIndex:LongWord; NumEntries:LongWord; var PaletteEntries:void ):LongWord; stdcall;
begin
{*
 0040DA80    jmp         dword ptr ds:[8263AC]
*}
end;

//0040DA88
function gdi32.GetPixel(X:Integer; Y:Integer):DWORD; stdcall;
begin
{*
 0040DA88    jmp         dword ptr ds:[8263A8]
*}
end;

//0040DA90
function gdi32.GetRgnBox(var p2:TRect):Integer; stdcall;
begin
{*
 0040DA90    jmp         dword ptr ds:[8263A4]
*}
end;

//0040DA98
function gdi32.GetStockObject:HGDIOBJ; stdcall;
begin
{*
 0040DA98    jmp         dword ptr ds:[8263A0]
*}
end;

//0040DAA0
function gdi32.GetSystemPaletteEntries(StartIndex:LongWord; NumEntries:LongWord; var PaletteEntries:void ):LongWord; stdcall;
begin
{*
 0040DAA0    jmp         dword ptr ds:[82639C]
*}
end;

//0040DAA8
function gdi32.GetTextExtentPoint32W(const Str:UnicodeString; Count:Integer; var Size:TSize):LongBool;
begin
{*
 0040DAA8    jmp         dword ptr ds:[826398]
*}
end;

//0040DAB0
function gdi32.GetTextExtentPointW(Str:PWideChar; Count:Integer; var Size:TSize):LongBool; stdcall;
begin
{*
 0040DAB0    jmp         dword ptr ds:[826394]
*}
end;

//0040DAB8
function gdi32.GetTextMetricsW(var TM:tagTEXTMETRICW):LongBool; stdcall;
begin
{*
 0040DAB8    jmp         dword ptr ds:[826390]
*}
end;

//0040DAC0
function gdi32.GetWinMetaFileBits(p2:LongWord; p3:PByte; p4:Integer; p5:HDC):LongWord; stdcall;
begin
{*
 0040DAC0    jmp         dword ptr ds:[82638C]
*}
end;

//0040DAC8
function gdi32.GetWindowOrgEx(var Point:TPoint):LongBool; stdcall;
begin
{*
 0040DAC8    jmp         dword ptr ds:[826388]
*}
end;

//0040DAD0
function gdi32.IntersectClipRect(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer):Integer; stdcall;
begin
{*
 0040DAD0    jmp         dword ptr ds:[826384]
*}
end;

//0040DAD8
function gdi32.LPtoDP(var Points:void ; Count:Integer):LongBool; stdcall;
begin
{*
 0040DAD8    jmp         dword ptr ds:[826380]
*}
end;

//0040DAE0
function gdi32.LineTo(X:Integer; Y:Integer):LongBool; stdcall;
begin
{*
 0040DAE0    jmp         dword ptr ds:[82637C]
*}
end;

//0040DAE8
function gdi32.MaskBlt(XDest:Integer; YDest:Integer; Width:Integer; Height:Integer; SrcDC:HDC; XScr:Integer; YScr:Integer; Mask:HBITMAP; xMask:Integer; yMask:Integer; Rop:DWORD):LongBool; stdcall;
begin
{*
 0040DAE8    jmp         dword ptr ds:[826378]
*}
end;

//0040DAF0
function gdi32.MoveToEx(p2:Integer; p3:Integer; p4:PPoint):LongBool; stdcall;
begin
{*
 0040DAF0    jmp         dword ptr ds:[826374]
*}
end;

//0040DAF8
function gdi32.PatBlt(X:Integer; Y:Integer; Width:Integer; Height:Integer; Rop:DWORD):LongBool; stdcall;
begin
{*
 0040DAF8    jmp         dword ptr ds:[826370]
*}
end;

//0040DB00
function gdi32.Pie(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer; X3:Integer; Y3:Integer; X4:Integer; Y4:Integer):LongBool; stdcall;
begin
{*
 0040DB00    jmp         dword ptr ds:[82636C]
*}
end;

//0040DB08
function gdi32.PlayEnhMetaFile(p2:HENHMETAFILE; const p3:TRect):LongBool; stdcall;
begin
{*
 0040DB08    jmp         dword ptr ds:[826368]
*}
end;

//0040DB10
function gdi32.PolyBezier(const Points:void ; Count:DWORD):LongBool; stdcall;
begin
{*
 0040DB10    jmp         dword ptr ds:[826364]
*}
end;

//0040DB18
function gdi32.PolyBezierTo(const Points:void ; Count:DWORD):LongBool; stdcall;
begin
{*
 0040DB18    jmp         dword ptr ds:[826360]
*}
end;

//0040DB20
function gdi32.PolyPolyline(const PointStructs:void ; const Points:void ; p4:DWORD):LongBool; stdcall;
begin
{*
 0040DB20    jmp         dword ptr ds:[82635C]
*}
end;

//0040DB28
function gdi32.Polygon(const Points:void ; Count:Integer):LongBool; stdcall;
begin
{*
 0040DB28    jmp         dword ptr ds:[826358]
*}
end;

//0040DB30
function gdi32.Polyline(const Points:void ; Count:Integer):LongBool; stdcall;
begin
{*
 0040DB30    jmp         dword ptr ds:[826354]
*}
end;

//0040DB38
function gdi32.RealizePalette:LongWord; stdcall;
begin
{*
 0040DB38    jmp         dword ptr ds:[826350]
*}
end;

//0040DB40
function gdi32.RectVisible(const Rect:TRect):LongBool; stdcall;
begin
{*
 0040DB40    jmp         dword ptr ds:[82634C]
*}
end;

//0040DB48
function gdi32.Rectangle(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer):LongBool; stdcall;
begin
{*
 0040DB48    jmp         dword ptr ds:[826348]
*}
end;

//0040DB50
function gdi32.RestoreDC(SavedDC:Integer):LongBool; stdcall;
begin
{*
 0040DB50    jmp         dword ptr ds:[826344]
*}
end;

//0040DB58
function gdi32.RoundRect(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer; X3:Integer; Y3:Integer):LongBool; stdcall;
begin
{*
 0040DB58    jmp         dword ptr ds:[826340]
*}
end;

//0040DB60
function gdi32.SaveDC:Integer; stdcall;
begin
{*
 0040DB60    jmp         dword ptr ds:[82633C]
*}
end;

//0040DB68
function gdi32.SelectClipRgn(Region:HRGN):Integer; stdcall;
begin
{*
 0040DB68    jmp         dword ptr ds:[826338]
*}
end;

//0040DB70
function gdi32.SelectObject(p2:HGDIOBJ):HGDIOBJ; stdcall;
begin
{*
 0040DB70    jmp         dword ptr ds:[826334]
*}
end;

//0040DB78
function gdi32.SelectPalette(Palette:HPALETTE; ForceBackground:LongBool):HPALETTE; stdcall;
begin
{*
 0040DB78    jmp         dword ptr ds:[826330]
*}
end;

//0040DB80
function gdi32.SetAbortProc(lpAbortProc:TFNAbortProc):Integer; stdcall;
begin
{*
 0040DB80    jmp         dword ptr ds:[82632C]
*}
end;

//0040DB88
function gdi32.SetBkColor(Color:DWORD):DWORD; stdcall;
begin
{*
 0040DB88    jmp         dword ptr ds:[826328]
*}
end;

//0040DB90
function gdi32.SetBkMode(BkMode:Integer):Integer; stdcall;
begin
{*
 0040DB90    jmp         dword ptr ds:[826324]
*}
end;

//0040DB98
function gdi32.SetBrushOrgEx(X:Integer; Y:Integer; PrevPt:PPoint):LongBool; stdcall;
begin
{*
 0040DB98    jmp         dword ptr ds:[826320]
*}
end;

//0040DBA0
function gdi32.SetDIBColorTable(p2:LongWord; p3:LongWord; var RGBQuadSTructs:void ):LongWord; stdcall;
begin
{*
 0040DBA0    jmp         dword ptr ds:[82631C]
*}
end;

//0040DBA8
function gdi32.SetDIBits(Bitmap:HBITMAP; StartScan:LongWord; NumScans:LongWord; Bits:Pointer; var BitsInfo:tagBITMAPINFO; Usage:LongWord):Integer; stdcall;
begin
{*
 0040DBA8    jmp         dword ptr ds:[826318]
*}
end;

//0040DBB0
function gdi32.SetEnhMetaFileBits(p2:PByte):HENHMETAFILE; stdcall;
begin
{*
 0040DBB0    jmp         dword ptr ds:[826314]
*}
end;

//0040DBB8
function gdi32.SetMapMode(p2:Integer):Integer; stdcall;
begin
{*
 0040DBB8    jmp         dword ptr ds:[826310]
*}
end;

//0040DBC0
function gdi32.SetPixel(X:Integer; Y:Integer; Color:DWORD):DWORD; stdcall;
begin
{*
 0040DBC0    jmp         dword ptr ds:[82630C]
*}
end;

//0040DBC8
function gdi32.SetROP2(p2:Integer):Integer; stdcall;
begin
{*
 0040DBC8    jmp         dword ptr ds:[826308]
*}
end;

//0040DBD0
function gdi32.SetStretchBltMode(StretchMode:Integer):Integer; stdcall;
begin
{*
 0040DBD0    jmp         dword ptr ds:[826304]
*}
end;

//0040DBD8
function gdi32.SetTextColor(Color:DWORD):DWORD; stdcall;
begin
{*
 0040DBD8    jmp         dword ptr ds:[826300]
*}
end;

//0040DBE0
function gdi32.SetTextCharacterExtra(CharExtra:Integer):Integer; stdcall;
begin
{*
 0040DBE0    jmp         dword ptr ds:[8262FC]
*}
end;

//0040DBE8
function gdi32.SetViewportExtEx(XExt:Integer; YExt:Integer; Size:PSize):LongBool; stdcall;
begin
{*
 0040DBE8    jmp         dword ptr ds:[8262F8]
*}
end;

//0040DBF0
function gdi32.SetViewportOrgEx(X:Integer; Y:Integer; Point:PPoint):LongBool; stdcall;
begin
{*
 0040DBF0    jmp         dword ptr ds:[8262F4]
*}
end;

//0040DBF8
function gdi32.SetWinMetaFileBits(p2:PByte; p3:HDC; const p4:tagMETAFILEPICT):HENHMETAFILE; stdcall;
begin
{*
 0040DBF8    jmp         dword ptr ds:[8262F0]
*}
end;

//0040DC00
function gdi32.SetWindowExtEx(XExt:Integer; YExt:Integer; Size:PSize):LongBool; stdcall;
begin
{*
 0040DC00    jmp         dword ptr ds:[8262EC]
*}
end;

//0040DC08
function gdi32.SetWindowOrgEx(X:Integer; Y:Integer; Point:PPoint):LongBool; stdcall;
begin
{*
 0040DC08    jmp         dword ptr ds:[8262E8]
*}
end;

//0040DC10
function gdi32.StartDocW(const p2:_DOCINFOW):Integer; stdcall;
begin
{*
 0040DC10    jmp         dword ptr ds:[8262E4]
*}
end;

//0040DC18
function gdi32.StartPage:Integer; stdcall;
begin
{*
 0040DC18    jmp         dword ptr ds:[8262E0]
*}
end;

//0040DC20
function gdi32.StretchBlt(X:Integer; Y:Integer; Width:Integer; Height:Integer; SrcDC:HDC; XSrc:Integer; YSrc:Integer; SrcWidth:Integer; SrcHeight:Integer; Rop:DWORD):LongBool; stdcall;
begin
{*
 0040DC20    jmp         dword ptr ds:[8262DC]
*}
end;

//0040DC28
function gdi32.StretchDIBits(DestX:Integer; DestY:Integer; DestWidth:Integer; DestHeight:Integer; SrcX:Integer; SrcY:Integer; SrcWidth:Integer; SrcHeight:Integer; Bits:Pointer; var BitsInfo:tagBITMAPINFO; Usage:LongWord; Rop:DWORD):Integer; stdcall;
begin
{*
 0040DC28    jmp         dword ptr ds:[8262D8]
*}
end;

//0040DC30
function gdi32.TextOutW(X:Integer; Y:Integer; Str:PWideChar; Count:Integer):LongBool; stdcall;
begin
{*
 0040DC30    jmp         dword ptr ds:[8262D4]
*}
end;

//0040DC38
function gdi32.UnrealizeObject:LongBool; stdcall;
begin
{*
 0040DC38    jmp         dword ptr ds:[8262D0]
*}
end;

//0040DC40
function user32.ActivateKeyboardLayout(Flags:LongWord):HKL; stdcall;
begin
{*
 0040DC40    jmp         dword ptr ds:[8262C0]
*}
end;

//0040DC48
function user32.AdjustWindowRectEx(dwStyle:DWORD; bMenu:LongBool; dwExStyle:DWORD):LongBool; stdcall;
begin
{*
 0040DC48    jmp         dword ptr ds:[8262BC]
*}
end;

//0040DC50
function user32.AttachThreadInput(idAttachTo:DWORD; fAttach:LongBool):LongBool; stdcall;
begin
{*
 0040DC50    jmp         dword ptr ds:[8262B0]
*}
end;

//0040DC58
function user32.BeginDeferWindowPos:THandle; stdcall;
begin
{*
 0040DC58    jmp         dword ptr ds:[8262AC]
*}
end;

//0040DC60
function user32.BeginPaint(var lpPaint:tagPAINTSTRUCT):HDC; stdcall;
begin
{*
 0040DC60    jmp         dword ptr ds:[8262A8]
*}
end;

//0040DC68
function user32.BringWindowToTop:LongBool; stdcall;
begin
{*
 0040DC68    jmp         dword ptr ds:[8262A4]
*}
end;

//0040DC70
procedure user32.dll;
begin
{*
 0040DC70    push        82A000
 0040DC75    call        @delayLoadHelper
 0040DC7A    pop         ecx
 0040DC7B    pop         edx
 0040DC7C    xchg        eax,dword ptr [esp]
 0040DC7F    ret
*}
end;

//0040DC80
function user32.CallNextHookEx(nCode:Integer; wParam:Integer; lParam:Integer):Integer; stdcall;
begin
{*
 0040DC80    jmp         dword ptr ds:[8262A0]
*}
end;

//0040DC88
function user32.CallWindowProcW(hWnd:HWND; Msg:LongWord; wParam:Integer; lParam:Integer):Integer; stdcall;
begin
{*
 0040DC88    jmp         dword ptr ds:[82629C]
*}
end;

//0040DC90
function user32.CharLowerW:PWideChar; stdcall;
begin
{*
 0040DC90    jmp         dword ptr ds:[826298]
*}
end;

//0040DC98
function user32.CharLowerBuffW(cchLength:DWORD):DWORD; stdcall;
begin
{*
 0040DC98    jmp         dword ptr ds:[826294]
*}
end;

//0040DCA0
function user32.CharLowerBuffA(cchLength:DWORD):DWORD; stdcall;
begin
{*
 0040DCA0    jmp         dword ptr ds:[8262B4]
*}
end;

//0040DCA8
function user32.CharNextW:PWideChar; stdcall;
begin
{*
 0040DCA8    jmp         dword ptr ds:[826290]
*}
end;

//0040DCB0
function user32.CharNextW:PWideChar; stdcall;
begin
{*
 0040DCB0    jmp         dword ptr ds:[826290]
*}
end;

//0040DCB8
function user32.CharUpperW:PWideChar; stdcall;
begin
{*
 0040DCB8    jmp         dword ptr ds:[82628C]
*}
end;

//0040DCC0
function user32.CharUpperBuffW(cchLength:DWORD):DWORD; stdcall;
begin
{*
 0040DCC0    jmp         dword ptr ds:[826288]
*}
end;

//0040DCC8
function user32.CharUpperBuffA(cchLength:DWORD):DWORD; stdcall;
begin
{*
 0040DCC8    jmp         dword ptr ds:[8262B8]
*}
end;

//0040DCD0
function user32.CharUpperBuffW(cchLength:DWORD):DWORD; stdcall;
begin
{*
 0040DCD0    jmp         dword ptr ds:[826288]
*}
end;

//0040DCD8
function user32.CheckMenuItem(uIDCheckItem:LongWord; uCheck:LongWord):DWORD; stdcall;
begin
{*
 0040DCD8    jmp         dword ptr ds:[826284]
*}
end;

//0040DCE0
function user32.ClientToScreen(var lpPoint:TPoint):LongBool; stdcall;
begin
{*
 0040DCE0    jmp         dword ptr ds:[826280]
*}
end;

//0040DCE8
function user32.CloseClipboard:LongBool;
begin
{*
 0040DCE8    jmp         dword ptr ds:[82627C]
*}
end;

//0040DCF0
function user32.CopyIcon:HICON; stdcall;
begin
{*
 0040DCF0    jmp         dword ptr ds:[826278]
*}
end;

//0040DCF8
function user32.CountClipboardFormats:Integer;
begin
{*
 0040DCF8    jmp         dword ptr ds:[826274]
*}
end;

//0040DD00
function user32.CreateAcceleratorTableW(Count:Integer):HACCEL; stdcall;
begin
{*
 0040DD00    jmp         dword ptr ds:[826270]
*}
end;

//0040DD08
function user32.CreateCaret(hBitmap:HBITMAP; nWidth:Integer; nHeight:Integer):LongBool; stdcall;
begin
{*
 0040DD08    jmp         dword ptr ds:[82626C]
*}
end;

//0040DD10
function user32.CreateIcon(nWidth:Integer; nHeight:Integer; cPlanes:Byte; cBitsPixel:Byte; lpbANDbits:Pointer; lpbXORbits:Pointer):HICON; stdcall;
begin
{*
 0040DD10    jmp         dword ptr ds:[826268]
*}
end;

//0040DD18
function user32.CreateMenu:HMENU;
begin
{*
 0040DD18    jmp         dword ptr ds:[826264]
*}
end;

//0040DD20
function user32.CreatePopupMenu:HMENU;
begin
{*
 0040DD20    jmp         dword ptr ds:[826260]
*}
end;

//0040DD28
function user32.DefFrameProcW(hWndMDIClient:HWND; uMsg:LongWord; wParam:Integer; lParam:Integer):Integer; stdcall;
begin
{*
 0040DD28    jmp         dword ptr ds:[82625C]
*}
end;

//0040DD30
function user32.DefMDIChildProcW(uMsg:LongWord; wParam:Integer; lParam:Integer):Integer; stdcall;
begin
{*
 0040DD30    jmp         dword ptr ds:[826258]
*}
end;

//0040DD38
function user32.DefWindowProcW(Msg:LongWord; wParam:Integer; lParam:Integer):Integer; stdcall;
begin
{*
 0040DD38    jmp         dword ptr ds:[826254]
*}
end;

//0040DD40
function user32.DeferWindowPos(hWnd:HWND; hWndInsertAfter:HWND; x:Integer; y:Integer; cx:Integer; cy:Integer; uFlags:LongWord):THandle; stdcall;
begin
{*
 0040DD40    jmp         dword ptr ds:[826250]
*}
end;

//0040DD48
function user32.DeleteMenu(uPosition:LongWord; uFlags:LongWord):LongBool; stdcall;
begin
{*
 0040DD48    jmp         dword ptr ds:[82624C]
*}
end;

//0040DD50
function user32.DestroyCaret:LongBool;
begin
{*
 0040DD50    jmp         dword ptr ds:[826248]
*}
end;

//0040DD58
function user32.DestroyCursor:LongBool; stdcall;
begin
{*
 0040DD58    jmp         dword ptr ds:[826244]
*}
end;

//0040DD60
function user32.DestroyIcon:LongBool; stdcall;
begin
{*
 0040DD60    jmp         dword ptr ds:[826240]
*}
end;

//0040DD68
function user32.DestroyMenu:LongBool; stdcall;
begin
{*
 0040DD68    jmp         dword ptr ds:[82623C]
*}
end;

//0040DD70
function user32.DestroyWindow:LongBool; stdcall;
begin
{*
 0040DD70    jmp         dword ptr ds:[826238]
*}
end;

//0040DD78
function user32.DispatchMessageW:LongInt; stdcall;
begin
{*
 0040DD78    jmp         dword ptr ds:[826234]
*}
end;

//0040DD80
function user32.DispatchMessageA:LongInt; stdcall;
begin
{*
 0040DD80    jmp         dword ptr ds:[826230]
*}
end;

//0040DD88
function user32.DispatchMessageW:LongInt; stdcall;
begin
{*
 0040DD88    jmp         dword ptr ds:[826234]
*}
end;

//0040DD90
function user32.DrawAnimatedRects(idAni:Integer; const lprcFrom:TRect; const lprcTo:TRect):LongBool; stdcall;
begin
{*
 0040DD90    jmp         dword ptr ds:[82622C]
*}
end;

//0040DD98
function user32.DrawEdge(var qrc:TRect; edge:LongWord; grfFlags:LongWord):LongBool; stdcall;
begin
{*
 0040DD98    jmp         dword ptr ds:[826228]
*}
end;

//0040DDA0
function user32.DrawFocusRect(const lprc:TRect):LongBool; stdcall;
begin
{*
 0040DDA0    jmp         dword ptr ds:[826224]
*}
end;

//0040DDA8
function user32.DrawFrameControl(Rect:PRect; uType:LongWord; uState:LongWord):LongBool; stdcall;
begin
{*
 0040DDA8    jmp         dword ptr ds:[826220]
*}
end;

//0040DDB0
function user32.DrawIcon(X:Integer; Y:Integer; hIcon:HICON):LongBool; stdcall;
begin
{*
 0040DDB0    jmp         dword ptr ds:[82621C]
*}
end;

//0040DDB8
function user32.DrawIconEx(xLeft:Integer; yTop:Integer; hIcon:HICON; cxWidth:Integer; cyWidth:Integer; istepIfAniCur:LongWord; hbrFlickerFreeDraw:HBRUSH; diFlags:LongWord):LongBool; stdcall;
begin
{*
 0040DDB8    jmp         dword ptr ds:[826218]
*}
end;

//0040DDC0
function user32.DrawMenuBar:LongBool; stdcall;
begin
{*
 0040DDC0    jmp         dword ptr ds:[826214]
*}
end;

//0040DDC8
function user32.DrawTextW(const lpString:UnicodeString; nCount:Integer; uFormat:LongWord; var lpRect:TRect):Integer;
begin
{*
 0040DDC8    jmp         dword ptr ds:[826210]
*}
end;

//0040DDD0
function user32.DrawTextW(const lpString:UnicodeString; nCount:Integer; uFormat:LongWord; var lpRect:TRect):Integer;
begin
{*
 0040DDD0    jmp         dword ptr ds:[826210]
*}
end;

//0040DDD8
function user32.DrawTextExW(lpchText:PWideChar; cchText:Integer; var p4:TRect; dwDTFormat:LongWord; DTParams:PDrawTextParams):Integer; stdcall;
begin
{*
 0040DDD8    jmp         dword ptr ds:[82620C]
*}
end;

//0040DDE0
function user32.EmptyClipboard:LongBool;
begin
{*
 0040DDE0    jmp         dword ptr ds:[826208]
*}
end;

//0040DDE8
function user32.EnableMenuItem(uIDEnableItem:LongWord; uEnable:LongWord):LongBool; stdcall;
begin
{*
 0040DDE8    jmp         dword ptr ds:[826204]
*}
end;

//0040DDF0
function user32.EnableScrollBar(wSBflags:LongWord; wArrows:LongWord):LongBool; stdcall;
begin
{*
 0040DDF0    jmp         dword ptr ds:[826200]
*}
end;

//0040DDF8
function user32.EnableWindow(bEnable:LongBool):LongBool; stdcall;
begin
{*
 0040DDF8    jmp         dword ptr ds:[8261FC]
*}
end;

//0040DE00
function user32.EndDeferWindowPos:LongBool; stdcall;
begin
{*
 0040DE00    jmp         dword ptr ds:[8261F8]
*}
end;

//0040DE08
function user32.EndMenu:LongBool;
begin
{*
 0040DE08    jmp         dword ptr ds:[8261F4]
*}
end;

//0040DE10
function user32.EndPaint(const lpPaint:tagPAINTSTRUCT):LongBool; stdcall;
begin
{*
 0040DE10    jmp         dword ptr ds:[8261F0]
*}
end;

//0040DE18
function user32.EnumChildWindows(lpEnumFunc:Pointer; lParam:Integer):LongBool; stdcall;
begin
{*
 0040DE18    jmp         dword ptr ds:[8261EC]
*}
end;

//0040DE20
function user32.EnumClipboardFormats:LongWord; stdcall;
begin
{*
 0040DE20    jmp         dword ptr ds:[8261E8]
*}
end;

//0040DE28
function user32.EnumDisplayDevicesA(iDevNum:DWORD; var lpDisplayDevice:_DISPLAY_DEVICEA; dwFlags:DWORD):LongBool; stdcall;
begin
{*
 0040DE28    jmp         dword ptr ds:[8261E4]
*}
end;

//0040DE30
function user32.EnumThreadWindows(lpfn:Pointer; lParam:Integer):LongBool; stdcall;
begin
{*
 0040DE30    jmp         dword ptr ds:[8261E0]
*}
end;

//0040DE38
function user32.EnumWindows(lParam:Integer):LongBool; stdcall;
begin
{*
 0040DE38    jmp         dword ptr ds:[8261DC]
*}
end;

//0040DE40
function user32.FillRect(const lprc:TRect; hbr:HBRUSH):Integer; stdcall;
begin
{*
 0040DE40    jmp         dword ptr ds:[8261D8]
*}
end;

//0040DE48
function user32.FindWindowW(lpWindowName:PWideChar):HWND; stdcall;
begin
{*
 0040DE48    jmp         dword ptr ds:[8261D4]
*}
end;

//0040DE50
function user32.FindWindowExW(Child:HWND; ClassName:PWideChar; WindowName:PWideChar):HWND; stdcall;
begin
{*
 0040DE50    jmp         dword ptr ds:[8261D0]
*}
end;

//0040DE58
function user32.FlashWindowEx:LongBool; stdcall;
begin
{*
 0040DE58    jmp         dword ptr ds:[8261CC]
*}
end;

//0040DE60
function user32.FrameRect(const lprc:TRect; hbr:HBRUSH):Integer; stdcall;
begin
{*
 0040DE60    jmp         dword ptr ds:[8261C8]
*}
end;

//0040DE68
function user32.GetActiveWindow:HWND;
begin
{*
 0040DE68    jmp         dword ptr ds:[8261C4]
*}
end;

//0040DE70
function user32.GetAncestor(gaFlags:LongWord):HWND; stdcall;
begin
{*
 0040DE70    jmp         dword ptr ds:[8261C0]
*}
end;

//0040DE78
function user32.GetCapture:HWND;
begin
{*
 0040DE78    jmp         dword ptr ds:[8261BC]
*}
end;

//0040DE80
function user32.GetCaretPos:LongBool; stdcall;
begin
{*
 0040DE80    jmp         dword ptr ds:[8261B8]
*}
end;

//0040DE88
function user32.GetClassInfoW(lpClassName:PWideChar; var lpWndClass:tagWNDCLASSW):LongBool; stdcall;
begin
{*
 0040DE88    jmp         dword ptr ds:[8261B4]
*}
end;

//0040DE90
function user32.GetClassLongW(nIndex:Integer):DWORD; stdcall;
begin
{*
 0040DE90    jmp         dword ptr ds:[8261B0]
*}
end;

//0040DE98
function user32.GetClassNameW(lpClassName:PWideChar; nMaxCount:Integer):Integer; stdcall;
begin
{*
 0040DE98    jmp         dword ptr ds:[8261AC]
*}
end;

//0040DEA0
function user32.GetClientRect(var lpRect:TRect):LongBool; stdcall;
begin
{*
 0040DEA0    jmp         dword ptr ds:[8261A8]
*}
end;

//0040DEA8
function user32.GetClipboardData:THandle; stdcall;
begin
{*
 0040DEA8    jmp         dword ptr ds:[8261A4]
*}
end;

//0040DEB0
function user32.GetCursor:HICON;
begin
{*
 0040DEB0    jmp         dword ptr ds:[8261A0]
*}
end;

//0040DEB8
function user32.GetCursorInfo:LongBool; stdcall;
begin
{*
 0040DEB8    jmp         dword ptr ds:[82619C]
*}
end;

//0040DEC0
function user32.GetCursorPos:LongBool; stdcall;
begin
{*
 0040DEC0    jmp         dword ptr ds:[826198]
*}
end;

//0040DEC8
function user32.GetDC:HDC; stdcall;
begin
{*
 0040DEC8    jmp         dword ptr ds:[826194]
*}
end;

//0040DED0
function user32.GetDCEx(hrgnClip:HRGN; flags:DWORD):HDC; stdcall;
begin
{*
 0040DED0    jmp         dword ptr ds:[826190]
*}
end;

//0040DED8
function user32.GetDesktopWindow:HWND;
begin
{*
 0040DED8    jmp         dword ptr ds:[82618C]
*}
end;

//0040DEE0
function user32.GetDlgCtrlID:Integer; stdcall;
begin
{*
 0040DEE0    jmp         dword ptr ds:[826188]
*}
end;

//0040DEE8
function user32.GetDlgItem(nIDDlgItem:Integer):HWND; stdcall;
begin
{*
 0040DEE8    jmp         dword ptr ds:[826184]
*}
end;

//0040DEF0
function user32.GetDoubleClickTime:LongWord;
begin
{*
 0040DEF0    jmp         dword ptr ds:[826180]
*}
end;

//0040DEF8
function user32.GetFocus:HWND;
begin
{*
 0040DEF8    jmp         dword ptr ds:[82617C]
*}
end;

//0040DF00
function user32.GetForegroundWindow:HWND;
begin
{*
 0040DF00    jmp         dword ptr ds:[826178]
*}
end;

//0040DF08
function user32.GetIconInfo(var piconinfo:_ICONINFO):LongBool; stdcall;
begin
{*
 0040DF08    jmp         dword ptr ds:[826174]
*}
end;

//0040DF10
function user32.GetKeyNameTextW(lpString:PWideChar; nSize:Integer):Integer; stdcall;
begin
{*
 0040DF10    jmp         dword ptr ds:[826170]
*}
end;

//0040DF18
function user32.GetKeyState:SmallInt; stdcall;
begin
{*
 0040DF18    jmp         dword ptr ds:[82616C]
*}
end;

//0040DF20
function user32.GetKeyboardLayout:HKL; stdcall;
begin
{*
 0040DF20    jmp         dword ptr ds:[826168]
*}
end;

//0040DF28
function user32.GetKeyboardLayoutList(var List:void ):LongWord; stdcall;
begin
{*
 0040DF28    jmp         dword ptr ds:[826164]
*}
end;

//0040DF30
function user32.GetKeyboardLayoutNameW:LongBool; stdcall;
begin
{*
 0040DF30    jmp         dword ptr ds:[826160]
*}
end;

//0040DF38
function user32.GetKeyboardState:LongBool; stdcall;
begin
{*
 0040DF38    jmp         dword ptr ds:[82615C]
*}
end;

//0040DF40
function user32.GetLastActivePopup:HWND; stdcall;
begin
{*
 0040DF40    jmp         dword ptr ds:[826158]
*}
end;

//0040DF48
function user32.GetMenu:HMENU; stdcall;
begin
{*
 0040DF48    jmp         dword ptr ds:[826154]
*}
end;

//0040DF50
function user32.GetMenuItemCount:Integer; stdcall;
begin
{*
 0040DF50    jmp         dword ptr ds:[826150]
*}
end;

//0040DF58
function user32.GetMenuItemID(nPos:Integer):LongWord; stdcall;
begin
{*
 0040DF58    jmp         dword ptr ds:[82614C]
*}
end;

//0040DF60
function user32.GetMenuItemInfoW(p2:LongWord; p3:LongBool; var p4:tagMENUITEMINFOW):LongBool; stdcall;
begin
{*
 0040DF60    jmp         dword ptr ds:[826148]
*}
end;

//0040DF68
function user32.GetMenuState(uId:LongWord; uFlags:LongWord):LongWord; stdcall;
begin
{*
 0040DF68    jmp         dword ptr ds:[826144]
*}
end;

//0040DF70
function user32.GetMenuStringW(uIDItem:LongWord; lpString:PWideChar; nMaxCount:Integer; uFlag:LongWord):Integer; stdcall;
begin
{*
 0040DF70    jmp         dword ptr ds:[826140]
*}
end;

//0040DF78
function user32.GetMessageExtraInfo:LongInt;
begin
{*
 0040DF78    jmp         dword ptr ds:[82613C]
*}
end;

//0040DF80
function user32.GetMessagePos:DWORD;
begin
{*
 0040DF80    jmp         dword ptr ds:[826138]
*}
end;

//0040DF88
function user32.GetMessageTime:LongInt;
begin
{*
 0040DF88    jmp         dword ptr ds:[826134]
*}
end;

//0040DF90
function user32.GetWindow(uCmd:LongWord):HWND; stdcall;
begin
{*
 0040DF90    jmp         dword ptr ds:[826130]
*}
end;

//0040DF98
function user32.GetParent:HWND; stdcall;
begin
{*
 0040DF98    jmp         dword ptr ds:[82612C]
*}
end;

//0040DFA0
function user32.GetPropW(lpString:PWideChar):THandle; stdcall;
begin
{*
 0040DFA0    jmp         dword ptr ds:[826128]
*}
end;

//0040DFA8
function user32.GetScrollInfo(BarFlag:Integer; var ScrollInfo:tagSCROLLINFO):LongBool; stdcall;
begin
{*
 0040DFA8    jmp         dword ptr ds:[826124]
*}
end;

//0040DFB0
function user32.GetScrollPos(nBar:Integer):Integer; stdcall;
begin
{*
 0040DFB0    jmp         dword ptr ds:[826120]
*}
end;

//0040DFB8
function user32.GetScrollRange(nBar:Integer; var lpMinPos:Integer; var lpMaxPos:Integer):LongBool; stdcall;
begin
{*
 0040DFB8    jmp         dword ptr ds:[82611C]
*}
end;

//0040DFC0
function user32.GetSubMenu(nPos:Integer):HMENU; stdcall;
begin
{*
 0040DFC0    jmp         dword ptr ds:[826118]
*}
end;

//0040DFC8
function user32.GetSysColor:DWORD; stdcall;
begin
{*
 0040DFC8    jmp         dword ptr ds:[826114]
*}
end;

//0040DFD0
function user32.GetSysColorBrush:HBRUSH; stdcall;
begin
{*
 0040DFD0    jmp         dword ptr ds:[826110]
*}
end;

//0040DFD8
function user32.GetSystemMenu(bRevert:LongBool):HMENU; stdcall;
begin
{*
 0040DFD8    jmp         dword ptr ds:[82610C]
*}
end;

//0040DFE0
function user32.GetSystemMetrics:Integer; stdcall;
begin
{*
 0040DFE0    jmp         dword ptr ds:[826108]
*}
end;

//0040DFE8
function user32.GetTopWindow(var ReturnVar:THandle):BOOL; stdcall;
begin
{*
 0040DFE8    jmp         dword ptr ds:[826104]
*}
end;

//0040DFF0
function user32.GetWindow(uCmd:LongWord):HWND; stdcall;
begin
{*
 0040DFF0    jmp         dword ptr ds:[826130]
*}
end;

//0040DFF8
function user32.GetWindowDC:HDC; stdcall;
begin
{*
 0040DFF8    jmp         dword ptr ds:[826100]
*}
end;

//0040E000
function user32.GetWindowLongW(nIndex:Integer):LongInt; stdcall;
begin
{*
 0040E000    jmp         dword ptr ds:[8260FC]
*}
end;

//0040E008
function user32.GetWindowLongW(nIndex:Integer):LongInt; stdcall;
begin
{*
 0040E008    jmp         dword ptr ds:[8260FC]
*}
end;

//0040E010
function user32.GetWindowPlacement(var WindowPlacement:tagWINDOWPLACEMENT):LongBool; stdcall;
begin
{*
 0040E010    jmp         dword ptr ds:[8260F8]
*}
end;

//0040E018
function user32.GetWindowPlacement(var WindowPlacement:tagWINDOWPLACEMENT):LongBool; stdcall;
begin
{*
 0040E018    jmp         dword ptr ds:[8260F8]
*}
end;

//0040E020
function user32.GetWindowRect(var lpRect:TRect):LongBool; stdcall;
begin
{*
 0040E020    jmp         dword ptr ds:[8260F4]
*}
end;

//0040E028
function user32.GetWindowTextW(lpString:PWideChar; nMaxCount:Integer):Integer; stdcall;
begin
{*
 0040E028    jmp         dword ptr ds:[8260F0]
*}
end;

//0040E030
function user32.GetWindowThreadProcessId(var dwProcessId:DWORD):DWORD; stdcall;
begin
{*
 0040E030    jmp         dword ptr ds:[8260EC]
*}
end;

//0040E038
function user32.GetWindowThreadProcessId(var dwProcessId:DWORD):DWORD; stdcall;
begin
{*
 0040E038    jmp         dword ptr ds:[8260EC]
*}
end;

//0040E040
function user32.HideCaret:LongBool; stdcall;
begin
{*
 0040E040    jmp         dword ptr ds:[8260E8]
*}
end;

//0040E048
function user32.InflateRect(dx:Integer; dy:Integer):LongBool; stdcall;
begin
{*
 0040E048    jmp         dword ptr ds:[8260E4]
*}
end;

//0040E050
function user32.InsertMenuW(uPosition:LongWord; uFlags:LongWord; uIDNewItem:LongWord; lpNewItem:PWideChar):LongBool; stdcall;
begin
{*
 0040E050    jmp         dword ptr ds:[8260E0]
*}
end;

//0040E058
function user32.InsertMenuItemW(p2:LongWord; p3:LongBool; const p4:tagMENUITEMINFOW):LongBool; stdcall;
begin
{*
 0040E058    jmp         dword ptr ds:[8260DC]
*}
end;

//0040E060
function user32.InvalidateRect(lpRect:PRect; bErase:LongBool):LongBool; stdcall;
begin
{*
 0040E060    jmp         dword ptr ds:[8260D8]
*}
end;

//0040E068
function user32.InvalidateRect(lpRect:PRect; bErase:LongBool):LongBool; stdcall;
begin
{*
 0040E068    jmp         dword ptr ds:[8260D8]
*}
end;

//0040E070
function user32.IsCharAlphaW:LongBool; stdcall;
begin
{*
 0040E070    jmp         dword ptr ds:[8260D4]
*}
end;

//0040E078
function user32.IsCharAlphaNumericW:LongBool; stdcall;
begin
{*
 0040E078    jmp         dword ptr ds:[8260D0]
*}
end;

//0040E080
function user32.IsChild(hWnd:HWND):LongBool; stdcall;
begin
{*
 0040E080    jmp         dword ptr ds:[8260CC]
*}
end;

//0040E088
function user32.IsClipboardFormatAvailable:LongBool; stdcall;
begin
{*
 0040E088    jmp         dword ptr ds:[8260C8]
*}
end;

//0040E090
function user32.IsDialogMessageA(var lpMsg:tagMSG):LongBool; stdcall;
begin
{*
 0040E090    jmp         dword ptr ds:[8260C0]
*}
end;

//0040E098
function user32.IsDialogMessageW(var lpMsg:tagMSG):LongBool; stdcall;
begin
{*
 0040E098    jmp         dword ptr ds:[8260C4]
*}
end;

//0040E0A0
function user32.IsIconic:BOOL;
begin
{*
 0040E0A0    jmp         dword ptr ds:[8260BC]
*}
end;

//0040E0A8
function user32.IsRectEmpty:LongBool; stdcall;
begin
{*
 0040E0A8    jmp         dword ptr ds:[8260B8]
*}
end;

//0040E0B0
function user32.IsWindow:LongBool; stdcall;
begin
{*
 0040E0B0    jmp         dword ptr ds:[8260B4]
*}
end;

//0040E0B8
function user32.IsWindowEnabled:LongBool; stdcall;
begin
{*
 0040E0B8    jmp         dword ptr ds:[8260B0]
*}
end;

//0040E0C0
function user32.IsWindowUnicode:LongBool; stdcall;
begin
{*
 0040E0C0    jmp         dword ptr ds:[8260AC]
*}
end;

//0040E0C8
function user32.IsWindowVisible:LongBool; stdcall;
begin
{*
 0040E0C8    jmp         dword ptr ds:[8260A8]
*}
end;

//0040E0D0
function user32.IsZoomed:LongBool; stdcall;
begin
{*
 0040E0D0    jmp         dword ptr ds:[8260A4]
*}
end;

//0040E0D8
function user32.KillTimer(uIDEvent:LongWord):LongBool; stdcall;
begin
{*
 0040E0D8    jmp         dword ptr ds:[8260A0]
*}
end;

//0040E0E0
function user32.LoadBitmapW(lpBitmapName:PWideChar):HBITMAP; stdcall;
begin
{*
 0040E0E0    jmp         dword ptr ds:[82609C]
*}
end;

//0040E0E8
function user32.LoadCursorW(const lpCursorName:UnicodeString):HICON;
begin
{*
 0040E0E8    jmp         dword ptr ds:[826098]
*}
end;

//0040E0F0
function user32.LoadCursorFromFileW:HICON; stdcall;
begin
{*
 0040E0F0    jmp         dword ptr ds:[826094]
*}
end;

//0040E0F8
function user32.LoadIconW(lpIconName:PWideChar):HICON; stdcall;
begin
{*
 0040E0F8    jmp         dword ptr ds:[826090]
*}
end;

//0040E100
function user32.LoadImageW(ImageName:PWideChar; ImageType:LongWord; X:Integer; Y:Integer; Flags:LongWord):THandle; stdcall;
begin
{*
 0040E100    jmp         dword ptr ds:[82608C]
*}
end;

//0040E108
function user32.LoadKeyboardLayoutW(Flags:LongWord):HKL;
begin
{*
 0040E108    jmp         dword ptr ds:[826088]
*}
end;

//0040E110
function user32.LoadStringW(uID:LongWord; lpBuffer:PWideChar; nBufferMax:Integer):Integer; stdcall;
begin
{*
 0040E110    jmp         dword ptr ds:[826084]
*}
end;

//0040E118
function user32.MapVirtualKeyW(uMapType:LongWord):LongWord; stdcall;
begin
{*
 0040E118    jmp         dword ptr ds:[826080]
*}
end;

//0040E120
function user32.MapWindowPoints(hWndTo:HWND; var lpPoints:void ; cPoints:LongWord):Integer; stdcall;
begin
{*
 0040E120    jmp         dword ptr ds:[82607C]
*}
end;

//0040E128
function user32.MessageBeep:LongBool; stdcall;
begin
{*
 0040E128    jmp         dword ptr ds:[826078]
*}
end;

//0040E130
{*function user32.MessageBoxW(Text:PWideChar; Caption:PWideChar; Typ:Integer):?; stdcall;
begin
 0040E130    jmp         dword ptr ds:[826074]
end;*}

//0040E138
function user32.MoveWindow(X:Integer; Y:Integer; nWidth:Integer; nHeight:Integer; bRepaint:LongBool):LongBool; stdcall;
begin
{*
 0040E138    jmp         dword ptr ds:[826070]
*}
end;

//0040E140
function user32.MsgWaitForMultipleObjects(var pHandles:void ; fWaitAll:LongBool; dwMilliseconds:DWORD; dwWakeMask:DWORD):DWORD; stdcall;
begin
{*
 0040E140    jmp         dword ptr ds:[82606C]
*}
end;

//0040E148
function user32.MsgWaitForMultipleObjectsEx(var pHandles:void ; dwMilliseconds:DWORD; dwWakeMask:DWORD; dwFlags:DWORD):DWORD; stdcall;
begin
{*
 0040E148    jmp         dword ptr ds:[826068]
*}
end;

//0040E150
function user32.OffsetRect(DX:Integer; DY:Integer):Boolean;
begin
{*
 0040E150    jmp         dword ptr ds:[826064]
*}
end;

//0040E158
function user32.OpenClipboard:LongBool; stdcall;
begin
{*
 0040E158    jmp         dword ptr ds:[826060]
*}
end;

//0040E160
function user32.PeekMessageW(hWnd:HWND; wMsgFilterMin:LongWord; wMsgFilterMax:LongWord; wRemoveMsg:LongWord):LongBool; stdcall;
begin
{*
 0040E160    jmp         dword ptr ds:[82605C]
*}
end;

//0040E168
function user32.PeekMessageA(hWnd:HWND; wMsgFilterMin:LongWord; wMsgFilterMax:LongWord; wRemoveMsg:LongWord):LongBool; stdcall;
begin
{*
 0040E168    jmp         dword ptr ds:[826058]
*}
end;

//0040E170
function user32.PeekMessageW(hWnd:HWND; wMsgFilterMin:LongWord; wMsgFilterMax:LongWord; wRemoveMsg:LongWord):LongBool; stdcall;
begin
{*
 0040E170    jmp         dword ptr ds:[82605C]
*}
end;

//0040E178
function user32.PostMessageW(Msg:LongWord; wParam:Integer; lParam:Integer):LongBool; stdcall;
begin
{*
 0040E178    jmp         dword ptr ds:[826054]
*}
end;

//0040E180
procedure user32.PostQuitMessage; stdcall;
begin
{*
 0040E180    jmp         dword ptr ds:[826050]
*}
end;

//0040E188
function user32.PtInRect(const P:TPoint):Boolean;
begin
{*
 0040E188    jmp         dword ptr ds:[82604C]
*}
end;

//0040E190
function user32.RedrawWindow(lprcUpdate:PRect; hrgnUpdate:HRGN; flags:LongWord):LongBool; stdcall;
begin
{*
 0040E190    jmp         dword ptr ds:[826048]
*}
end;

//0040E198
function user32.RegisterClassW:Word; stdcall;
begin
{*
 0040E198    jmp         dword ptr ds:[826044]
*}
end;

//0040E1A0
function user32.RegisterClipboardFormatW:LongWord; stdcall;
begin
{*
 0040E1A0    jmp         dword ptr ds:[826040]
*}
end;

//0040E1A8
function user32.RegisterWindowMessageW:LongWord; stdcall;
begin
{*
 0040E1A8    jmp         dword ptr ds:[82603C]
*}
end;

//0040E1B0
function user32.ReleaseCapture:LongBool;
begin
{*
 0040E1B0    jmp         dword ptr ds:[826038]
*}
end;

//0040E1B8
function user32.ReleaseDC(hDC:HDC):Integer; stdcall;
begin
{*
 0040E1B8    jmp         dword ptr ds:[826034]
*}
end;

//0040E1C0
function user32.RemoveMenu(uPosition:LongWord; uFlags:LongWord):LongBool; stdcall;
begin
{*
 0040E1C0    jmp         dword ptr ds:[826030]
*}
end;

//0040E1C8
function user32.RemovePropW(lpString:PWideChar):THandle; stdcall;
begin
{*
 0040E1C8    jmp         dword ptr ds:[82602C]
*}
end;

//0040E1D0
function user32.ScreenToClient(var lpPoint:TPoint):LongBool; stdcall;
begin
{*
 0040E1D0    jmp         dword ptr ds:[826028]
*}
end;

//0040E1D8
procedure $thunk_AddClipboardFormatListener;
begin
{*
 0040E1D8    push        eax
 0040E1D9    push        edx
 0040E1DA    push        ecx
 0040E1DB    push        82A0EC;^$thunk_AddClipboardFormatListener
>0040E1E0    jmp         user32.dll
*}
end;

//0040E1E8
function PhysicalToLogicalPoint(hWnd:HWND; var lpPoint:TPoint):LongBool; stdcall;
begin
{*
 0040E1E8    jmp         dword ptr ds:[82A0EC]
*}
end;

//0040E1F0
function user32.ScrollWindow(XAmount:Integer; YAmount:Integer; Rect:PRect; ClipRect:PRect):LongBool; stdcall;
begin
{*
 0040E1F0    jmp         dword ptr ds:[826024]
*}
end;

//0040E1F8
function user32.ScrollWindowEx(dx:Integer; dy:Integer; prcScroll:PRect; prcClip:PRect; hrgnUpdate:HRGN; prcUpdate:PRect; flags:LongWord):LongBool; stdcall;
begin
{*
 0040E1F8    jmp         dword ptr ds:[826020]
*}
end;

//0040E200
function user32.SendMessageW(Msg:LongWord; wParam:Integer; lParam:Integer):Integer; stdcall;
begin
{*
 0040E200    jmp         dword ptr ds:[82601C]
*}
end;

//0040E208
function user32.SendMessageA(Msg:LongWord; wParam:Integer; lParam:Integer):Integer; stdcall;
begin
{*
 0040E208    jmp         dword ptr ds:[826018]
*}
end;

//0040E210
function user32.SendMessageW(Msg:LongWord; wParam:Integer; lParam:Integer):Integer; stdcall;
begin
{*
 0040E210    jmp         dword ptr ds:[82601C]
*}
end;

//0040E218
function user32.SendMessageCallbackW(Msg:LongWord; wParam:Integer; lParam:Integer; lpResultCallBack:Pointer; dwData:DWORD):LongBool; stdcall;
begin
{*
 0040E218    jmp         dword ptr ds:[826014]
*}
end;

//0040E220
function user32.SetActiveWindow:HWND; stdcall;
begin
{*
 0040E220    jmp         dword ptr ds:[826010]
*}
end;

//0040E228
function user32.SetCapture:HWND; stdcall;
begin
{*
 0040E228    jmp         dword ptr ds:[82600C]
*}
end;

//0040E230
function user32.SetCaretPos(Y:Integer):LongBool; stdcall;
begin
{*
 0040E230    jmp         dword ptr ds:[826008]
*}
end;

//0040E238
function user32.SetClassLongW(nIndex:Integer; dwNewLong:LongInt):DWORD; stdcall;
begin
{*
 0040E238    jmp         dword ptr ds:[826004]
*}
end;

//0040E240
function user32.SetClipboardData(hMem:THandle):THandle; stdcall;
begin
{*
 0040E240    jmp         dword ptr ds:[826000]
*}
end;

//0040E248
function user32.SetCursor:HICON; stdcall;
begin
{*
 0040E248    jmp         dword ptr ds:[825FFC]
*}
end;

//0040E250
function user32.SetCursorPos(Y:Integer):LongBool; stdcall;
begin
{*
 0040E250    jmp         dword ptr ds:[825FF8]
*}
end;

//0040E258
function user32.SetFocus:HWND; stdcall;
begin
{*
 0040E258    jmp         dword ptr ds:[825FF4]
*}
end;

//0040E260
function user32.SetForegroundWindow:LongBool; stdcall;
begin
{*
 0040E260    jmp         dword ptr ds:[825FF0]
*}
end;

//0040E268
function user32.SetKeyboardState:LongBool; stdcall;
begin
{*
 0040E268    jmp         dword ptr ds:[825FEC]
*}
end;

//0040E270
function user32.SetMenu(hMenu:HMENU):LongBool; stdcall;
begin
{*
 0040E270    jmp         dword ptr ds:[825FE8]
*}
end;

//0040E278
function user32.SetMenuItemInfoW(p2:LongWord; p3:LongBool; const p4:tagMENUITEMINFOW):LongBool; stdcall;
begin
{*
 0040E278    jmp         dword ptr ds:[825FE4]
*}
end;

//0040E280
function user32.SetParent(hWndNewParent:HWND):HWND; stdcall;
begin
{*
 0040E280    jmp         dword ptr ds:[825FE0]
*}
end;

//0040E288
function user32.SetPropW(lpString:PWideChar; hData:THandle):LongBool; stdcall;
begin
{*
 0040E288    jmp         dword ptr ds:[825FDC]
*}
end;

//0040E290
function user32.SetRect(xLeft:Integer; yTop:Integer; xRight:Integer; yBottom:Integer):LongBool; stdcall;
begin
{*
 0040E290    jmp         dword ptr ds:[825FD8]
*}
end;

//0040E298
function user32.SetScrollInfo(BarFlag:Integer; const ScrollInfo:tagSCROLLINFO; Redraw:LongBool):Integer; stdcall;
begin
{*
 0040E298    jmp         dword ptr ds:[825FD4]
*}
end;

//0040E2A0
function user32.SetScrollPos(nBar:Integer; nPos:Integer; bRedraw:LongBool):Integer; stdcall;
begin
{*
 0040E2A0    jmp         dword ptr ds:[825FD0]
*}
end;

//0040E2A8
function user32.SetScrollRange(nBar:Integer; nMinPos:Integer; nMaxPos:Integer; bRedraw:LongBool):LongBool; stdcall;
begin
{*
 0040E2A8    jmp         dword ptr ds:[825FCC]
*}
end;

//0040E2B0
function user32.SetTimer(nIDEvent:LongWord; uElapse:LongWord; lpTimerFunc:Pointer):LongWord; stdcall;
begin
{*
 0040E2B0    jmp         dword ptr ds:[825FC8]
*}
end;

//0040E2B8
function user32.SetWindowLongW(nIndex:Integer; dwNewLong:LongInt):LongInt; stdcall;
begin
{*
 0040E2B8    jmp         dword ptr ds:[825FC4]
*}
end;

//0040E2C0
function user32.SetWindowLongW(nIndex:Integer; dwNewLong:LongInt):LongInt; stdcall;
begin
{*
 0040E2C0    jmp         dword ptr ds:[825FC4]
*}
end;

//0040E2C8
function user32.SetWindowPlacement(WindowPlacement:PWindowPlacement):LongBool; stdcall;
begin
{*
 0040E2C8    jmp         dword ptr ds:[825FC0]
*}
end;

//0040E2D0
function user32.SetWindowPlacement(WindowPlacement:PWindowPlacement):LongBool; stdcall;
begin
{*
 0040E2D0    jmp         dword ptr ds:[825FC0]
*}
end;

//0040E2D8
function user32.SetWindowPos(hWndInsertAfter:HWND; X:Integer; Y:Integer; cx:Integer; cy:Integer; uFlags:LongWord):LongBool; stdcall;
begin
{*
 0040E2D8    jmp         dword ptr ds:[825FBC]
*}
end;

//0040E2E0
function user32.SetWindowTextW(const lpString:UnicodeString):LongBool;
begin
{*
 0040E2E0    jmp         dword ptr ds:[825FB8]
*}
end;

//0040E2E8
function user32.SetWindowsHookExW(lpfn:TFNHookProc; hmod:HINST; dwThreadId:DWORD):HHOOK; stdcall;
begin
{*
 0040E2E8    jmp         dword ptr ds:[825FB4]
*}
end;

//0040E2F0
function user32.ShowCaret:LongBool; stdcall;
begin
{*
 0040E2F0    jmp         dword ptr ds:[825FB0]
*}
end;

//0040E2F8
function user32.ShowCursor:Integer; stdcall;
begin
{*
 0040E2F8    jmp         dword ptr ds:[825FAC]
*}
end;

//0040E300
function user32.ShowOwnedPopups(fShow:LongBool):LongBool; stdcall;
begin
{*
 0040E300    jmp         dword ptr ds:[825FA8]
*}
end;

//0040E308
function user32.ShowScrollBar(wBar:Integer; bShow:LongBool):LongBool; stdcall;
begin
{*
 0040E308    jmp         dword ptr ds:[825FA4]
*}
end;

//0040E310
function user32.ShowWindow(nCmdShow:Integer):LongBool; stdcall;
begin
{*
 0040E310    jmp         dword ptr ds:[825FA0]
*}
end;

//0040E318
function user32.SystemParametersInfoW(uiParam:LongWord; pvParam:Pointer; fWinIni:LongWord):LongBool; stdcall;
begin
{*
 0040E318    jmp         dword ptr ds:[825F9C]
*}
end;

//0040E320
function user32.SystemParametersInfoW(uiParam:LongWord; pvParam:Pointer; fWinIni:LongWord):LongBool; stdcall;
begin
{*
 0040E320    jmp         dword ptr ds:[825F9C]
*}
end;

//0040E328
function user32.SystemParametersInfoW(uiParam:LongWord; pvParam:Pointer; fWinIni:LongWord):LongBool; stdcall;
begin
{*
 0040E328    jmp         dword ptr ds:[825F9C]
*}
end;

//0040E330
function user32.TrackPopupMenu(uFlags:LongWord; x:Integer; y:Integer; nReserved:Integer; hWnd:HWND; prcRect:PRect):LongBool; stdcall;
begin
{*
 0040E330    jmp         dword ptr ds:[825F98]
*}
end;

//0040E338
function user32.TranslateMDISysAccel(const lpMsg:tagMSG):LongBool; stdcall;
begin
{*
 0040E338    jmp         dword ptr ds:[825F94]
*}
end;

//0040E340
function user32.TranslateMessage:LongBool; stdcall;
begin
{*
 0040E340    jmp         dword ptr ds:[825F90]
*}
end;

//0040E348
function user32.UnhookWindowsHookEx:LongBool; stdcall;
begin
{*
 0040E348    jmp         dword ptr ds:[825F8C]
*}
end;

//0040E350
function user32.UnionRect(const lprcSrc1:TRect; const lprcSrc2:TRect):LongBool; stdcall;
begin
{*
 0040E350    jmp         dword ptr ds:[825F88]
*}
end;

//0040E358
function user32.UnregisterClassW(hInstance:HINST):LongBool; stdcall;
begin
{*
 0040E358    jmp         dword ptr ds:[825F84]
*}
end;

//0040E360
function user32.UpdateWindow:LongBool; stdcall;
begin
{*
 0040E360    jmp         dword ptr ds:[825F80]
*}
end;

//0040E368
function user32.ValidateRect(lpRect:PRect):LongBool; stdcall;
begin
{*
 0040E368    jmp         dword ptr ds:[825F7C]
*}
end;

//0040E370
function user32.ValidateRect(lpRect:PRect):LongBool; stdcall;
begin
{*
 0040E370    jmp         dword ptr ds:[825F7C]
*}
end;

//0040E378
function user32.VkKeyScanW:SmallInt; stdcall;
begin
{*
 0040E378    jmp         dword ptr ds:[825F78]
*}
end;

//0040E380
function user32.WaitMessage:LongBool;
begin
{*
 0040E380    jmp         dword ptr ds:[825F74]
*}
end;

//0040E388
function user32.WindowFromPoint:HWND; stdcall;
begin
{*
 0040E388    jmp         dword ptr ds:[825F70]
*}
end;

//0040E390
{*function user32.keybd_event(bScan:Byte; dwFlags:DWORD; dwExtraInfo:DWORD):?; stdcall;
begin
 0040E390    jmp         dword ptr ds:[825F6C]
end;*}

//0040E398
procedure user32.mouse_event(dx:DWORD; dy:DWORD; dwData:DWORD; dwExtraInfo:DWORD); stdcall;
begin
{*
 0040E398    jmp         dword ptr ds:[825F68]
*}
end;

//0040E3A0
function user32.CreateWindowExW(dwExStyle:DWORD; lpClassName:PWideChar; lpParam:Pointer; hInstance:HINST; hMenu:HMENU; hWndParent:HWND; nHeight:Integer; nWidth:Integer; Y:Integer; X:Integer; dwStyle:DWORD):HWND;
begin
{*
 0040E3A0    jmp         dword ptr ds:[825F64]
*}
end;

//0040E3A8
function CreateWindowEx(dwExStyle:DWORD; lpClassName:PWideChar; lpWindowName:PWideChar; dwStyle:DWORD; X:Integer; Y:Integer; nWidth:Integer; nHeight:Integer; hWndParent:HWND; hMenu:HMENU; hInstance:HINST; lpParam:Pointer):HWND;
begin
{*
 0040E3A8    push        ebp
 0040E3A9    mov         ebp,esp
 0040E3AB    push        ecx
 0040E3AC    push        ebx
 0040E3AD    push        esi
 0040E3AE    push        edi
 0040E3AF    mov         dword ptr [ebp-4],ecx
 0040E3B2    mov         edi,edx
 0040E3B4    mov         esi,eax
 0040E3B6    call        Get8087CW
 0040E3BB    mov         ebx,eax
 0040E3BD    mov         eax,dword ptr [ebp+8]
 0040E3C0    push        eax
 0040E3C1    mov         eax,dword ptr [ebp+0C]
 0040E3C4    push        eax
 0040E3C5    mov         eax,dword ptr [ebp+10]
 0040E3C8    push        eax
 0040E3C9    mov         eax,dword ptr [ebp+14]
 0040E3CC    push        eax
 0040E3CD    mov         eax,dword ptr [ebp+18]
 0040E3D0    push        eax
 0040E3D1    mov         eax,dword ptr [ebp+1C]
 0040E3D4    push        eax
 0040E3D5    mov         eax,dword ptr [ebp+20]
 0040E3D8    push        eax
 0040E3D9    mov         eax,dword ptr [ebp+24]
 0040E3DC    push        eax
 0040E3DD    mov         eax,dword ptr [ebp+28]
 0040E3E0    push        eax
 0040E3E1    mov         eax,dword ptr [ebp-4]
 0040E3E4    push        eax
 0040E3E5    push        edi
 0040E3E6    push        esi
 0040E3E7    call        user32.CreateWindowExW
 0040E3EC    mov         esi,eax
 0040E3EE    mov         eax,ebx
 0040E3F0    call        Set8087CW
 0040E3F5    mov         eax,esi
 0040E3F7    pop         edi
 0040E3F8    pop         esi
 0040E3F9    pop         ebx
 0040E3FA    pop         ecx
 0040E3FB    pop         ebp
 0040E3FC    ret         24
*}
end;

//0040E400
function HwndMSWheel(var puiMsh_MsgMouseWheel:LongWord; var puiMsh_Msg3DSupport:LongWord; var puiMsh_MsgScrollLines:LongWord; var pf3DSupport:LongBool; var piScrollLines:Integer):HWND;
begin
{*
 0040E400    push        ebp
 0040E401    mov         ebp,esp
 0040E403    push        ecx
 0040E404    push        ebx
 0040E405    push        esi
 0040E406    push        edi
 0040E407    mov         edi,ecx
 0040E409    mov         esi,edx
 0040E40B    mov         dword ptr [ebp-4],eax
 0040E40E    push        40E49C
 0040E413    push        40E4C0
 0040E418    call        user32.FindWindowW
 0040E41D    mov         ebx,eax
 0040E41F    push        40E4D0
 0040E424    call        user32.RegisterWindowMessageW
 0040E429    mov         edx,dword ptr [ebp-4]
 0040E42C    mov         dword ptr [edx],eax
 0040E42E    push        40E4F0
 0040E433    call        user32.RegisterWindowMessageW
 0040E438    mov         dword ptr [esi],eax
 0040E43A    push        40E51C
 0040E43F    call        user32.RegisterWindowMessageW
 0040E444    mov         dword ptr [edi],eax
 0040E446    cmp         dword ptr [esi],0
>0040E449    je          0040E463
 0040E44B    test        ebx,ebx
>0040E44D    je          0040E463
 0040E44F    push        0
 0040E451    push        0
 0040E453    mov         eax,dword ptr [esi]
 0040E455    push        eax
 0040E456    push        ebx
 0040E457    call        user32.SendMessageW
 0040E45C    mov         edx,dword ptr [ebp+0C]
 0040E45F    mov         dword ptr [edx],eax
>0040E461    jmp         0040E46A
 0040E463    mov         eax,dword ptr [ebp+0C]
 0040E466    xor         edx,edx
 0040E468    mov         dword ptr [eax],edx
 0040E46A    cmp         dword ptr [edi],0
>0040E46D    je          0040E487
 0040E46F    test        ebx,ebx
>0040E471    je          0040E487
 0040E473    push        0
 0040E475    push        0
 0040E477    mov         eax,dword ptr [edi]
 0040E479    push        eax
 0040E47A    push        ebx
 0040E47B    call        user32.SendMessageW
 0040E480    mov         edx,dword ptr [ebp+8]
 0040E483    mov         dword ptr [edx],eax
>0040E485    jmp         0040E490
 0040E487    mov         eax,dword ptr [ebp+8]
 0040E48A    mov         dword ptr [eax],3
 0040E490    mov         eax,ebx
 0040E492    pop         edi
 0040E493    pop         esi
 0040E494    pop         ebx
 0040E495    pop         ecx
 0040E496    pop         ebp
 0040E497    ret         8
*}
end;

//0040E548
procedure $thunk_CalculatePopupWindowPosition;
begin
{*
 0040E548    push        eax
 0040E549    push        edx
 0040E54A    push        ecx
 0040E54B    push        82A0E8;^$thunk_CalculatePopupWindowPosition
>0040E550    jmp         user32.dll
*}
end;

//0040E558
function GetGestureInfo(hGestureInfo:HGESTUREINFO; var pGestureInfo:GESTUREINFO):LongBool; stdcall;
begin
{*
 0040E558    jmp         dword ptr ds:[82A0E8]
*}
end;

//0040E560
procedure $thunk_CloseGestureInfoHandle;
begin
{*
 0040E560    push        eax
 0040E561    push        edx
 0040E562    push        ecx
 0040E563    push        82A0E4;^$thunk_CloseGestureInfoHandle
>0040E568    jmp         user32.dll
*}
end;

//0040E570
function CloseGestureInfoHandle(hGestureInfo:HGESTUREINFO):LongBool; stdcall;
begin
{*
 0040E570    jmp         dword ptr ds:[82A0E4]
*}
end;

//0040E578
procedure $thunk_CloseTouchInputHandle;
begin
{*
 0040E578    push        eax
 0040E579    push        edx
 0040E57A    push        ecx
 0040E57B    push        82A0E0;^$thunk_CloseTouchInputHandle
>0040E580    jmp         user32.dll
*}
end;

//0040E588
function SetGestureConfig(hwnd:HWND; dwReserved:DWORD; cIDs:LongWord; pGestureConfig:PGESTURECONFIG; cbSize:LongWord):LongBool; stdcall;
begin
{*
 0040E588    jmp         dword ptr ds:[82A0E0]
*}
end;

//0040E590
procedure InitVersionInfo;
begin
{*
 0040E590    add         esp,0FFFFFEEC
 0040E596    mov         dword ptr [esp],114
 0040E59D    push        esp
 0040E59E    call        kernel32.GetVersionExW
 0040E5A3    test        eax,eax
>0040E5A5    je          0040E5C2
 0040E5A7    mov         eax,dword ptr [esp+10]
 0040E5AB    mov         [00784A54],eax
 0040E5B0    mov         eax,dword ptr [esp+4]
 0040E5B4    mov         [00784A4C],eax
 0040E5B9    mov         eax,dword ptr [esp+8]
 0040E5BD    mov         [00784A50],eax
 0040E5C2    add         esp,114
 0040E5C8    ret
*}
end;

//0040E5CC
function tagNONCLIENTMETRICSW.SizeOf:Integer;
begin
{*
 0040E5CC    cmp         dword ptr ds:[784A4C],6
>0040E5D3    jl          0040E5DB
 0040E5D5    mov         eax,1F8
 0040E5DA    ret
 0040E5DB    mov         eax,1F4
 0040E5E0    ret
*}
end;

Initialization
//007800AC
{*
 007800AC    sub         dword ptr ds:[790C40],1
>007800B3    jae         007800C1
 007800B5    call        InitVersionInfo
 007800BA    xor         eax,eax
 007800BC    mov         [00790C44],eax;gvar_00790C44
 007800C1    ret
*}
Finalization
end.