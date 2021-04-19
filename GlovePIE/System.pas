//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit System;

interface

uses
  SysUtils, Classes;

type
  Boolean = (False, True);
  ByteBool = (False, True);
  WordBool = (False, True);
  LongBool = (False, True);
  TGUID = TGUID = record//size=10
D1:Cardinal;//f0
D2:Word;//f4
D3:Word;//f6
D4:?;//f8
end;;
  TInterfaceEntry = TInterfaceEntry = record//size=1C
IID:TGUID;//f0
VTable:Pointer;//f10
IOffset:Integer;//f14
ImplGetter:NativeUInt;//f18
end;;
  TInterfaceTable = TInterfaceTable = record//size=445C4
EntryCount:Integer;//f0
Entries:?;//f4
end;;
  TMethod = TMethod = record//size=8
Code:Pointer;//f0
Data:Pointer;//f4
end;;
  TObject = class()
  published
    function Equals(Obj:TObject):Boolean;//00405BC8
    procedure GetHashCode;//00405BD0
    function ToString:string;//00405DE8
    function UnitName:string;//00405CF0
    //function GetInterface(IID:TGUID; Obj:?):Boolean;//00405BD4
    function GetInterfaceEntry(IID:TGUID):PInterfaceEntry;//00405CA4
    function GetInterfaceTable:PInterfaceTable;//00405CE8
    function SafeCallException(ExceptObject:TObject; ExceptAddr:Pointer):HRESULT;//00405DE0
    function NewInstance:TObject;//00405AA4
    procedure FreeInstance;//00405AC0
    destructor Destroy();//00405AFC
    //procedure DefaultHandler(var Message:?);//00405DFC
    procedure AfterConstruction;//00405E00
    procedure BeforeDestruction;//00405E04
    //procedure Dispatch(var Message:?);//00405E08
    function FieldAddress(Name:string):Pointer;//00406014
    function ClassType:TClass;//004059FC
    function ClassName:string;//00405A04
    function ClassNameIs(Name:string):Boolean;//00405A1C
    procedure CleanupInstance;//00405B70
    constructor Create();//00405ADC
    procedure Free;//00405B0C
    function InitInstance(Instance:Pointer):TObject;//00405B18
    function ClassParent:TClass;//00405A98
    function MethodAddress(Name:string):Pointer;//00405F2C
    function MethodName(Address:Pointer):string;//00405F54
    function FieldAddress(Name:ShortString):Pointer;//00405FA0
    function MethodAddress(Name:ShortString):Pointer;//00405EBC
    function ClassInfo:Pointer;//00405DD8
    function InstanceSize:Integer;//00405AD4
    function InheritsFrom(AClass:TClass):Boolean;//00405DC4
  end;
  TInterfacedObject = class(TObject)
  published
    function NewInstance:TObject;//0040B210
    procedure BeforeDestruction;//0040B200
    procedure AfterConstruction;//0040B1F4
  public
    FRefCount:Integer;//f4
    function _AddRef:Integer; stdcall;//0040B248
    function _Release:Integer; stdcall;//0040B25C
  end;
  TVarArrayBound = TVarArrayBound = record//size=8
ElementCount:Integer;//f0
LowBound:Integer;//f4
end;;
  TVarArrayBoundArray = array [1..1] of TVarArrayBound;
  TVarArray = TVarArray = record//size=18
DimCount:Word;//f0
Flags:Word;//f2
ElementSize:Integer;//f4
LockCount:Integer;//f8
Data:Pointer;//fC
Bounds:TVarArrayBoundArray;//f10
end;;
  TVarData = TVarData = record//size=10
VType:Word;//f0
Reserved1:Word;//f2
Reserved2:Word;//f4
Reserved3:Word;//f6
VSmallInt:SmallInt;//f8
VInteger:Integer;//f8
VSingle:Single;//f8
VDouble:Double;//f8
VCurrency:Currency;//f8
VDate:TDateTime;//f8
VOleStr:PWideChar;//f8
VDispatch:Pointer;//f8
VError:HRESULT;//f8
VBoolean:WordBool;//f8
VUnknown:Pointer;//f8
VShortInt:ShortInt;//f8
VByte:Byte;//f8
VWord:Word;//f8
VLongWord:Cardinal;//f8
VInt64:Int64;//f8
VUInt64:UInt64;//f8
VString:Pointer;//f8
VAny:Pointer;//f8
VArray:PVarArray;//f8
VPointer:Pointer;//f8
VUString:Pointer;//f8
VLongs:?;//f4
VWords:?;//f2
VBytes:?;//f2
RawData:?;//f0
end;;
  TTypeTable = array [1..536870911] of Pointer;
  TPackageTypeInfo = TPackageTypeInfo = record//size=10
TypeCount:Integer;//f0
TypeTable:PTypeTable;//f4
UnitCount:Integer;//f8
UnitNames:PShortString;//fC
end;;
  TLibModule = TLibModule = record//size=1C
Next:PLibModule;//f0
Instance:Cardinal;//f4
CodeInstance:Cardinal;//f8
DataInstance:Cardinal;//fC
ResInstance:Cardinal;//f10
TypeInfo:PPackageTypeInfo;//f14
Reserved:Integer;//f18
end;;
  TResStringRec = TResStringRec = record//size=8
Module:?;//f0
Identifier:Integer;//f4
end;;
  TExceptionRecord = TExceptionRecord = record//size=50
ExceptionCode:Cardinal;//f0
ExceptionFlags:Cardinal;//f4
ExceptionRecord:PExceptionRecord;//f8
ExceptionAddress:Pointer;//fC
NumberParameters:Cardinal;//f10
ExceptionInformation:?;//f14
ExceptAddr:Pointer;//f14
ExceptObject:Pointer;//f18
end;;
    function InterlockedExchangePointer(var P:Pointer; V:Pointer):Pointer;//004025FC
    function InterlockedExchange(var P:Pointer; V:Pointer):Pointer;//00402608
    function InterlockedAdd(var Addend:Integer; Increment:Integer):Integer;//00402610
    function InterlockedIncrement(var Addend:Integer):Integer;//0040261C
    function InterlockedDecrement(var Addend:Integer):Integer;//00402628
    function InterlockedCompareExchange(var Destination:Integer; Exchange:Integer; Comparand:Integer):Integer;//00402634
    function InterlockedCompareExchangePointer(var Destination:Pointer; Exchange:Pointer; Comparand:Pointer):Pointer;//0040263C
    function CloseHandle:LongBool; stdcall;//00402644
    function CreateFileW(dwDesiredAccess:Integer; dwShareMode:Integer; lpSecurityAttributes:Pointer; dwCreationDisposition:Integer; dwFlagsAndAttributes:Integer; hTemplateFile:Integer):Integer; stdcall;//0040264C
    procedure InitializeCriticalSection; stdcall;//00402654
    procedure EnterCriticalSection; stdcall;//0040265C
    procedure LeaveCriticalSection; stdcall;//00402664
    procedure DeleteCriticalSection; stdcall;//0040266C
    function GetFileType:Integer; stdcall;//00402674
    function GetFileSize(x:Integer):Integer; stdcall;//0040267C
    function GetStdHandle:THandle; stdcall;//00402684
    procedure RaiseException(dwExceptionFlags:DWORD; nNumberOfArguments:DWORD; lpArguments:PDWORD); stdcall;//0040268C
    function ReadFile(var Buffer:void ; nNumberOfBytesToRead:DWORD; var lpNumberOfBytesRead:DWORD; lpOverlapped:POverlapped):LongBool; stdcall;//00402694
    procedure RtlUnwind;//0040269C
    function SetEndOfFile:LongBool; stdcall;//004026A4
    function SetFilePointer(lDistanceToMove:LongInt; lpDistanceToMoveHigh:Pointer; dwMoveMethod:DWORD):DWORD; stdcall;//004026AC
    function UnhandledExceptionFilter:LongInt; stdcall;//004026B4
    function WriteFile(const Buffer:void ; nNumberOfBytesToWrite:Cardinal; var lpNumberOfBytesWritten:Cardinal; lpOverlapped:Pointer):Integer; stdcall;//004026BC
    function CharNextW:PWideChar; stdcall;//004026C4
    function CompareStringW(dwCmpFlags:Integer; lpString1:PWideChar; cchCount1:Integer; lpString2:PWideChar; cchCount2:Integer):Integer; stdcall;//004026CC
    function CompareStringW(dwCmpFlags:Integer; lpString1:PWideChar; cchCount1:Integer; lpString2:PWideChar; cchCount2:Integer):Integer; stdcall;//004026D4
    function CreateThread(StackSize:Cardinal; ThreadFunc:TThreadFunc; Parameter:Pointer; CreationFlags:Cardinal; var ThreadId:Cardinal):Integer; stdcall;//004026DC
    procedure ExitThread; stdcall;//004026E4
    procedure ExitProcess; stdcall;//004026EC
    function MessageBoxA(lpText:PAnsiChar; lpCaption:PAnsiChar; uType:LongWord):Integer; stdcall;//004026F4
    procedure FindClose;//004026FC
    function FindFirstFileW(var lpFindFileData:_WIN32_FIND_DATAW):THandle; stdcall;//00402704
    function FreeLibrary:LongBool; stdcall;//0040270C
    function GetCommandLineW:PWideChar;//00402714
    function GetLastError:DWORD;//0040271C
    function GetLocaleInfoW(LCType:Integer; lpLCData:PWideChar; cchData:Integer):Integer; stdcall;//00402724
    function GetUserDefaultUILanguage:LANGID;//0040272C
    function GetModuleFileNameW(lpFilename:PWideChar; nSize:DWORD):DWORD; stdcall;//00402734
    function GetModuleHandleW:Integer; stdcall;//0040273C
    function GetProcAddress(lpProcName:PAnsiChar):Pointer; stdcall;//00402744
    procedure GetStartupInfoA; stdcall;//0040274C
    function GetSystemDefaultUILanguage:Word;//00402754
    function IsValidLocale(dwFlags:DWORD):LongBool; stdcall;//0040275C
    function LoadLibraryExW(hFile:THandle; dwFlags:DWORD):HMODULE; stdcall;//00402764
    function LoadStringW(uID:LongWord; lpBuffer:PWideChar; nBufferMax:Integer):Integer; stdcall;//0040276C
    function lstrcpynW(lpString2:PWideChar; iMaxLength:Integer):PWideChar; stdcall;//00402774
    function lstrlenW:Integer; stdcall;//0040277C
    function MultiByteToWideChar(Flags:Integer; MBStr:PAnsiChar; MBCount:Integer; WCStr:PWideChar; WCCount:Integer):Integer; stdcall;//00402784
    function RegCloseKey:Integer; stdcall;//0040278C
    function RegOpenKeyExW(lpSubKey:PWideChar; ulOptions:Cardinal; samDesired:Cardinal; var phkResult:Cardinal):Integer; stdcall;//00402794
    function RegQueryValueExW(lpValueName:PWideChar; lpReserved:Pointer; lpType:PDWORD; lpData:PByte; lpcbData:PDWORD):LongInt; stdcall;//0040279C
    function WideCharToMultiByte(dwFlags:DWORD; lpWideCharStr:PWideChar; cchWideChar:Integer; lpMultiByteStr:PAnsiChar; cchMultiByte:Integer; lpDefaultChar:PAnsiChar; lpUsedDefaultChar:PBOOL):Integer; stdcall;//004027A4
    function VirtualQuery(var lpBuffer:_MEMORY_BASIC_INFORMATION; dwLength:DWORD):DWORD; stdcall;//004027AC
    function SysAllocStringLen(len:Integer):PWideChar; stdcall;//004027B4
    function SysReAllocStringLen(psz:PWideChar; len:Integer):Integer; stdcall;//004027BC
    procedure SysFreeString; stdcall;//004027C4
    function GetCurrentThreadId:DWORD;//004027CC
    function GetVersion:Cardinal;//004027D4
    function QueryPerformanceCounter:LongBool; stdcall;//004027DC
    function GetTickCount:DWORD;//004027E4
    procedure GetSystemInfo; stdcall;//004027EC
    function GetACP:Cardinal;//004027F4
    function SwitchToThread:LongBool;//004027FC
    function GetCmdShow:Integer;//00402804
    function VirtualAlloc(dwSize:Cardinal; flAllocationType:Cardinal; flProtect:Cardinal):Pointer; stdcall;//00402830
    function VirtualFree(dwSize:DWORD; dwFreeType:DWORD):LongBool; stdcall;//00402838
    //function Sleep:?; stdcall;//00402840
    function LockCmpxchg(CompareVal:Byte; NewVal:Byte; AAddress:PByte):Byte;//00402990
    procedure Move12(const ASource:void ; var ADest:void ; ACount:Integer);//00402998
    procedure Move20(const ASource:void ; var ADest:void ; ACount:Integer);//004029AC
    procedure Move28(const ASource:void ; var ADest:void ; ACount:Integer);//004029CC
    procedure Move36(const ASource:void ; var ADest:void ; ACount:Integer);//004029F8
    procedure Move44(const ASource:void ; var ADest:void ; ACount:Integer);//00402A18
    procedure Move52(const ASource:void ; var ADest:void ; ACount:Integer);//00402A3C
    procedure Move60(const ASource:void ; var ADest:void ; ACount:Integer);//00402A68
    procedure Move68(const ASource:void ; var ADest:void ; ACount:Integer);//00402A98
    procedure MoveX16L4(const ASource:void ; var ADest:void ; ACount:Integer);//00402AD0
    procedure MoveX8L4(const ASource:void ; var ADest:void ; ACount:Integer);//00402B00
    procedure RemoveMediumFreeBlock(APMediumFreeBlock:PMediumFreeBlock);//00402B1C
    procedure InsertMediumBlockIntoBin(APMediumFreeBlock:PMediumFreeBlock; AMediumBlockSize:Cardinal);//00402B5C
    procedure BinMediumSequentialFeedRemainder;//00402BBC
    function AllocNewSequentialFeedMediumPool(AFirstBlockSize:Cardinal):Pointer;//00402C28
    procedure LockLargeBlocks;//00402CA0
    function AllocateLargeBlock(ASize:Cardinal):Pointer;//00402CE8
    function FreeLargeBlock(APointer:Pointer):Integer;//00402D4C
    function ReallocateLargeBlock(APointer:Pointer; ANewSize:Cardinal):Pointer;//00402DF0
    function SysGetMem(Size:Integer):Pointer;//00402F3C
    function SysFreeMem(P:Pointer):Integer;//004032C0
    function SysReallocMem(P:Pointer; Size:Integer):Pointer;//004034B8
    function SysAllocMem(Size:Cardinal):Pointer;//004037D0
    function NextMediumBlock(APMediumBlock:Pointer):Pointer;//00403804
    function GetFirstMediumBlockInPool(APMediumBlockPoolHeader:PMediumBlockPoolHeader):Pointer;//00403828
    procedure GetFirstAndLastSmallBlockInPool(APSmallBlockPool:PSmallBlockPoolHeader; var AFirstPtr:Pointer; var ALastPtr:Pointer);//00403868
    function CardinalToStrBuf(ACardinal:Cardinal; ABuffer:PAnsiChar):PAnsiChar;//004038A0
    function AppendStringToBuffer(const ASource:PAnsiChar; const ADestination:PAnsiChar; ACount:Cardinal):PAnsiChar;//004039BC
    function AppendClassNameToBuffer(AClass:TClass; ADestination:PAnsiChar):PAnsiChar;//004039D4
    function IsValidVMTAddress(APAddress:PCardinal):Boolean;//00403A08
    function InternalIsValidClass(AClassPointer:Pointer; ADepth:Integer):Boolean;//00403A84
    function GetObjectClass(APointer:Pointer):TClass;//00403B04
    function LockExpectedMemoryLeaksList:Boolean;//00403B2C
    function SysRegisterExpectedMemoryLeak(P:Pointer):Boolean;//00403BA0
    function SysUnregisterExpectedMemoryLeak(P:Pointer):Boolean;//00403BE0
    procedure CheckSmallBlockPoolForLeaks(APSmallBlockPool:PSmallBlockPoolHeader);//00403C38
    procedure ScanForMemoryLeaks;//00403E00
    procedure BuildBlockTypeLookupTable;//004041E4
    procedure InitializeMemoryManager;//00404228
    procedure FreeAllMemory;//00404350
    procedure FinalizeMemoryManager;//004043E0
    function AllocMem(Size:Cardinal):Pointer;//00404434
    function RegisterExpectedMemoryLeak(P:Pointer):Boolean;//0040444C
    function @GetMem(size:Integer):Pointer;//00404468
    function @FreeMem(p:Pointer):Integer;//00404484
    function @ReallocMem(var P:Pointer; NewSize:Integer):Pointer;//0040449C
    function ExceptObject:TObject;//004044EC
    function ExceptAddr:Pointer;//0040450C
    function AcquireExceptionObject:Pointer;//0040452C
    function RaiseList:Pointer;//00404560
    procedure RunErrorAt(ErrCode:Integer; ErrorAtAddr:Pointer);//0040456C
    procedure ErrorAt(ErrorCode:Byte; ErrorAddr:Pointer);//00404578
    procedure Error(errorCode:TRuntimeError);//004045C4
    procedure @_IOTest;//004045E4
    procedure SetInOutRes(NewValue:Integer);//00404604
    procedure InOutError;//00404614
    function IOResult:Integer;//00404620
    procedure Move(const Source:void ; var Dest:void ; Count:Integer);//00404640
    function GetParamStr(P:PWideChar; var Param:AnsiString):PWideChar;//00404740
    function ParamCount:Integer;//004047FC
    function ParamStr(Index:Integer):string;//0040485C
    procedure Randomize;//004048BC
    function Random(const ARange:Integer):Integer;//004048E4
    function Random:Extended;//00404900
    function UpCase(Ch:Char):Char;//00404928
    procedure Set8087CW(NewCW:Word);//00404940
    function Get8087CW:Word;//00404950
    function Int(const X:Extended):Extended;//00404958
    function Frac(const X:Extended):Extended;//00404984
    function Exp(const X:Extended):Extended;//004049B4
    function Cos(const X:Extended):Extended;//004049D4
    function Sin(const X:Extended):Extended;//004049E4
    function Ln(const X:Extended):Extended;//004049F4
    function ArcTan(const X:Extended):Extended;//00404A08
    function Sqrt(const X:Extended):Extended;//00404A18
    procedure @ROUND;//00404A28
    function @TRUNC(X:Extended):Int64;//00404A34
    procedure @AbstractError;//00404A58
    function OpenText(var t:TTextRec; Mode:Word):Integer;//00404A74
    function @RewritText(var T:TTextRec):Integer;//00404AD0
    function TextIn(var t:TTextRec):Integer;//00404ADC
    function FileNOPProc(var t:void ):Integer;//00404B18
    function TextOut(var t:TTextRec):Integer;//00404B1C
    function InternalClose(Handle:Integer):Boolean;//00404B58
    function TextClose(var t:TTextRec):Integer;//00404B68
    function TextOpen(var t:TTextRec):Integer;//00404B88
    function @Assign(var F:TFileRec; S:String):Integer;//00404D38
    function InternalFlush(var t:TTextRec; Func:TTextIOFunc):Integer;//00404D9C
    function Flush(var t:Text):Integer;//00404DE4
    procedure @Flush(var F:TFileRec);//00404DF0
    function ReadFile(var Buffer:void ; nNumberOfBytesToRead:DWORD; var lpNumberOfBytesRead:DWORD; lpOverlapped:POverlapped):LongBool; stdcall;//00404DFC
    function WriteFile(const Buffer:void ; nNumberOfBytesToWrite:Cardinal; var lpNumberOfBytesWritten:Cardinal; lpOverlapped:Pointer):Integer; stdcall;//00404E04
    function BlockIO(var f:TFileRec; buffer:Pointer; recCnt:Cardinal; var recsDone:Integer; ModeMask:Integer; IOProc:TIOProc; ErrorNo:Integer):Cardinal;//00404E0C
    function @BlockRead(var F:TFileRec; buffer:Pointer; recCnt:Longint; var recsRead:Longint):Longint;//00404E9C
    function @BlockWrite(var F:TFileRec; buffer:Pointer; recCnt:Longint; var recsWritten:Longint):Longint;//00404EBC
    procedure @Close(var F:TFileRec);//00404EDC
    function @EofFile(var F:TFileRec):Boolean;//00404F34
    function @FilePos(var F:TFileRec):Longint;//00404F50
    function @FileSize(var F:TFileRec):Longint;//00404FA0
    procedure @FillChar(var dst:Pointer; cnt:Integer; val:Char);//00404FEC
    function @CloseFile(var f:TFileRec):Integer;//00405088
    function OpenFile(var f:TFileRec; recSiz:Integer; mode:Integer):Integer;//004050B0
    function @ResetFile(var F:TFileRec; RecSize:Longint):Integer;//00405190
    function @RewritFile(var F:TFileRec; RecSize:Longint):Integer;//004051AC
    procedure @Seek(var F:TFileRec; RecNum:Longint);//004051B8
    procedure @StrLong(Val:Integer; Width:Integer; S:PShortString);//004051EC
    function @ValLong(s:AnsiString; var code:Integer):Longint;//0040524C
    function TryOpenForOutput(var t:TTextRec):Boolean;//00405350
    function @WriteBytes(var t:TTextRec; const b:void ; cnt:Integer):Pointer;//00405394
    function @WriteSpaces(var t:TTextRec; cnt:Integer):Pointer;//004053E8
    procedure @WriteLString(var T:TTextRec; S:AnsiString; Width:Longint);//00405464
    procedure @Write0Bool(var T:TTextRec; Val:Boolean);//00405488
    procedure @WriteBool(var T:TTextRec; Val:Boolean; Width:Longint);//00405490
    procedure @WriteLn(var T:TTextRec);//00405500
    procedure @SetElem(var Dest:SET; Elem:Byte; Size:Byte);//00405548
    procedure @SetEq;//0040556C
    procedure @SetUnion;//004055A0
    procedure @SetSub;//004055AC
    procedure @ValExt(s:AnsiString; var code:Integer);//004055BC
    procedure FPower10;//004056F4
    procedure @Pow10;//004056FC
    procedure @FpuInit;//004059E0
    procedure @BoundErr;//004059EC
    procedure @IntOver;//004059F4
    function InvokeImplGetter(Self:TObject; ImplGetter:NativeUInt):IInterface;//00405B98
    function @IsClass(Child:TObject; Parent:TClass):Boolean;//00405D24
    function @AsClass(child:TObject; parent:TClass):TObject;//00405D48
    procedure FindDynaMethod;//00405D64
    procedure @CallDynaInst;//00405D94
    procedure @FindDynaInst;//00405DAC
    function UTF8Compare(const Str1:ShortString; const Str2:ShortString):Boolean;//00405E30
    function UTF8ShortStringToString(const Str:ShortString):string;//00405EA8
    function @ClassCreate(AClass:TClass; Alloc:Boolean):TObject;//0040603C
    procedure @ClassDestroy(Instance:TObject);//0040608C
    function @AfterConstruction(Instance:TObject):TObject;//00406094
    function @BeforeDestruction(Instance:TObject; OuterMost:ShortInt):TObject;//004060E4
    procedure TSpinWait.SpinCycle;//004060F4
    procedure TSpinLock.Enter;//0040616C
    procedure TSpinLock.Exit;//0040619C
    procedure Spin;//004061A4
    procedure CheckMonitorSupport;//004061C0
    function CheckOwningThread:Cardinal;//004061D4
    function Create:PMonitor;//004061EC
    procedure Destroy;//0040620C
    procedure Destroy;//00406224
    function DequeueWaiter:PWaitingThread;//00406250
    function Enter(Timeout:Cardinal):Boolean;//004062D8
    procedure Exit;//00406470
    procedure Exit;//004064BC
    function GetEvent:Pointer;//004064D4
    function GetFieldAddress:PPMonitor;//0040653C
    function GetMonitor:PMonitor;//0040654C
    procedure Pulse;//0040658C
    procedure Pulse;//004065A8
    procedure QueueWaiter(var WaitingThread:TWaitingThread);//004065C0
    procedure RemoveWaiter(var WaitingThread:TWaitingThread);//00406630
    function TryEnter:Boolean;//004066C4
    function Wait(ALock:PMonitor; Timeout:Cardinal):Boolean;//00406704
    function Wait(ALock:TObject; Timeout:Cardinal):Boolean;//004067B8
    procedure NotifyReRaise;//004067E4
    procedure NotifyNonDelphiException;//00406800
    procedure NotifyExcept;//00406824
    procedure NotifyOnExcept;//0040683C
    procedure NotifyAnyExcept;//00406850
    procedure CheckJmp;//00406864
    procedure NotifyExceptFinally;//00406884
    procedure NotifyTerminate;//004068AC
    procedure NotifyUnhandled;//004068C8
    procedure @HandleAnyException;//004068E8
    procedure @HandleOnException;//00406A14
    procedure @HandleFinally;//00406B9C
    procedure @HandleFinallyInternal;//00406C44
    procedure @HandleAutoException;//00406C7C
    procedure @RaiseExcept;//00406D40
    procedure @RaiseAgain;//00406DB0
    procedure @DoneExcept;//00406E04
    procedure @TryFinallyExit;//00406E34
    procedure MapToRunError(P:PExceptionRecord); stdcall;//00406E4C
    procedure @ExceptionHandler;//00406EEC
    procedure SetExceptionHandler(Context:PInitContext);//00406F8C
    procedure UnsetExceptionHandler(Context:PInitContext);//00406FAC
    procedure FinalizeUnits;//00406FD4
    procedure InitUnits;//0040703C
    procedure @StartExe(InitTable:PackageInfo; Module:PLibModule);//004070A8
    function LoadResStringA(ResStringRec:PResStringRec):AnsiString;//004070F0
    function LoadResStringW(ResStringRec:PResStringRec):WideString;//00407144
    function LoadResStringU(ResStringRec:PResStringRec):string;//00407194
    procedure @InitResStringImports;//004071A8
    procedure @InitImports;//004071EC
    procedure @InitWideStrings;//00407210
    procedure MakeErrorMessage;//0040722C
    procedure ExitDll(Context:PInitContext);//00407290
    procedure WriteErrorMessage;//004072BC
    procedure @Halt0;//0040734C
    procedure @Halt(Code:Integer);//00407478
    procedure @RunError(errorCode:Byte);//00407484
    procedure @Assert(Message:String; Filename:String; LineNumber:Integer);//00407490
    function ThreadWrapper(Parameter:Pointer):Integer; stdcall;//004074DC
    function BeginThread(SecurityAttributes:Pointer; StackSize:Cardinal; ThreadFunc:TThreadFunc; Parameter:Pointer; CreationFlags:Cardinal; var ThreadId:Cardinal):Integer;//00407514
    procedure EndThread(ExitCode:Integer);//00407590
    function @NewUnicodeString(CharLength:Integer):Pointer;//004075AC
    function @NewAnsiString(CharLength:Integer; CodePage:Word):Pointer;//004075EC
    procedure WStrError;//00407638
    function @NewWideString(CharLength:Integer):Pointer;//00407640
    procedure @UStrClr(var S:UnicodeString);//00407658
    procedure @LStrClr(var S:AnsiString);//0040767C
    procedure @WStrClr(var S:WideString);//004076A0
    procedure @UStrArrayClr(var StrArray:Pointer; Count:Integer);//004076B8
    procedure @LStrArrayClr(var StrArray:Pointer; Count:Integer);//004076E8
    procedure @WStrArrayClr(var StrArray:Pointer; Count:Integer);//00407718
    function @UStrAddRef(var S:UnicodeString):Pointer;//0040773C
    function @LStrAddRef(var S:AnsiString):Pointer;//0040774C
    function @WStrAddRef(var S:WideString):Pointer;//0040775C
    function CharFromWChar(CharDest:PAnsiChar; DestBytes:Integer; const WCharSource:PWideChar; SrcChars:Integer; CodePage:Integer):Integer;//0040777C
    function CharFromWChar(CharDest:PAnsiChar; DestBytes:Integer; const WCharSource:PWideChar; SrcChars:Integer):Integer;//004077A8
    function WCharFromChar(WCharDest:PWideChar; DestChars:Integer; const CharSource:PAnsiChar; SrcBytes:Integer; CodePage:Integer):Integer;//004077C4
    procedure @UStrFromPWCharLen(var Dest:UnicodeString; Source:PWideChar; Length:Integer);//004077E0
    procedure @WStrFromPWCharLen(var Dest:WideString; Source:PWideChar; Length:Integer);//00407810
    procedure @LStrFromPCharLen(var Dest:AnsiString; Source:PAnsiChar; Length:Integer);//00407834
    procedure InternalUStrFromPCharLen(var Dest:AnsiString; Source:PAnsiChar; Length:Integer; CodePage:Integer);//0040786C
    procedure @UStrFromPCharLen(var Dest:UnicodeString; Source:PAnsiChar; Length:Integer);//00407900
    procedure InternalWStrFromPCharLen(var Dest:WideString; Source:PAnsiChar; Length:Integer; CodePage:Integer);//00407910
    procedure @WStrFromPCharLen(var Dest:WideString; Source:PAnsiChar; Length:Integer);//004079A4
    procedure @LStrFromPWCharLen(var Dest:AnsiString; Source:PWideChar; Length:Integer);//004079B4
    procedure @UStrAsg(var Dest:UnicodeString; Source:UnicodeString);//00407A38
    procedure @UStrLAsg(var Dest:UnicodeString; const Source:UnicodeString);//00407A80
    procedure @WStrAsg(var Dest:WideString; Source:WideString);//00407AAC
    procedure @WStrLAsg(var Dest:WideString; const Source:WideString);//00407AD4
    procedure @LStrAsg(var Dest:AnsiString; Source:AnsiString);//00407ADC
    procedure @LStrLAsg(var Dest:AnsiString; const Source:AnsiString);//00407B24
    function @UStrLen(S:UnicodeString):Integer;//00407B50
    function @LStrLen(S:AnsiString):Integer;//00407B5C
    function @PCharLen(P:PAnsiChar):Integer;//00407B68
    function @PWCharLen(P:PWideChar):Integer;//00407B90
    function InternalUniqueStringU(var Str:AnsiString):Pointer;//00407BC4
    function InternalUniqueStringA(var Str:AnsiString):Pointer;//00407C08
    function @UniqueStringU(var Str:AnsiString):Pointer;//00407C4C
    function @UniqueStringA(var Str:AnsiString):Pointer;//00407C54
    procedure UniqueString(var Str:AnsiString);//00407C5C
    procedure @AStrCmp(S1:PShortString; S2:PShortString; Bytes:Integer);//00407C64
    procedure @PStrNCpy(Dest:PShortString; Source:PShortString; MaxLen:Byte);//00407CD4
    procedure @LStrFromChar(var Dest:AnsiString; Source:AnsiChar);//00407CF0
    procedure @LStrFromPChar(var Dest:AnsiString; Source:PAnsiChar);//00407D00
    procedure @LStrFromPWChar(var Dest:AnsiString; Source:PWideChar);//00407D34
    procedure @LStrFromString(var Dest:AnsiString; const Source:ShortString);//00407D74
    procedure @LStrFromArray(var Dest:AnsiString; Source:PAnsiChar; Length:Integer);//00407D88
    procedure @LStrFromWStr(var Dest:AnsiString; const Source:WideString);//00407DA8
    procedure @LStrToString(var Dest:ShortString; const Source:AnsiString; MaxLen:Integer);//00407DC0
    procedure @LStrCat(var Dest:AnsiString; Source:AnsiString);//00407DE4
    procedure @LStrCat3(var Dest:AnsiString; Source1:AnsiString; Source2:AnsiString);//00407E3C
    procedure @LStrCatN(var Dest:AnsiString; ArgCnt:Integer);//00407EC0
    procedure @LStrEqual(Left:AnsiString; Right:AnsiString);//00407F88
    function @LStrToPChar(S:AnsiString):PChar;//00407FD0
    function @LStrCopy(const S:AnsiString; Index:Integer; Count:Integer):AnsiString;//00407FE0
    procedure @LStrDelete(var S:AnsiString; Index:Integer; Count:Integer);//00408028
    procedure @LStrSetLength(var S:AnsiString; NewLen:Integer);//00408074
    procedure @LStrFromUStr(var Dest:AnsiString; const Source:AnsiString; CodePage:Word);//004080EC
    procedure WStrSet(var S:WideString; P:PWideChar);//00408104
    procedure @WStrFromWChar(var Dest:WideString; Source:WideChar);//00408114
    procedure @WStrFromPChar(var Dest:WideString; Source:PAnsiChar);//00408124
    procedure @WStrFromPWChar(var Dest:WideString; Source:PWideChar);//00408154
    procedure @WStrFromWArray(var Dest:WideString; Source:PWideChar; Length:Integer);//00408190
    procedure @WStrFromLStr(var Dest:WideString; const Source:AnsiString);//004081AC
    function @WStrToPWChar(S:WideString):PWideChar;//004081CC
    procedure @WStrCat(var Dest:WideString; Source:WideString);//004081E0
    procedure @WStrCat3(var Dest:WideString; Source1:WideString; Source2:WideString);//0040825C
    procedure @WStrCatN(var Dest:WideString; ArgCnt:Integer);//004082D8
    //function @WStrCmp(Left:WideString; Right:WideString):?;//00408320
    procedure @WStrEqual(Left:WideString; Right:WideString);//004083A4
    function @WStrCopy(const S:WideString; Index:Integer; Count:Integer):WideString;//004083AC
    procedure @WStrDelete(var S:WideString; Index:Integer; Count:Integer);//004083F8
    procedure @WStrSetLength(var S:WideString; NewLen:Integer);//00408494
    function @UStrToPWChar(S:UnicodeString):PWideChar;//004084E8
    procedure @UStrFromWChar(var Dest:UnicodeString; Source:WideChar);//004084F8
    procedure @UStrFromPChar(var Dest:UnicodeString; Source:PAnsiChar);//00408508
    procedure @UStrFromPWChar(var Dest:UnicodeString; Source:PWideChar);//00408538
    procedure @UStrFromArray(var Dest:UnicodeString; Source:PAnsiChar; Length:Integer);//00408574
    procedure @UStrFromWArray(var Dest:UnicodeString; Source:PWideChar; Length:Integer);//0040858C
    procedure @UStrFromLStr(var Dest:UnicodeString; const Source:AnsiString);//004085A8
    procedure @UStrFromWStr(var Dest:UnicodeString; const Source:WideString);//004085C8
    procedure @WStrFromUStr(var Dest:WideString; const Source:AnsiString);//004085DC
    procedure @UStrToString(var Dest:ShortString; const Source:UnicodeString; MaxLen:Integer);//004085EC
    procedure @UStrFromString(var Dest:UnicodeString; const Source:ShortString);//00408658
    procedure @UStrSetLength(var S:UnicodeString; NewLen:Integer);//00408664
    procedure @UStrCat(var Dest:UnicodeString; Source:UnicodeString);//004086E4
    procedure @UStrCat3(var Dest:UnicodeString; Source1:UnicodeString; Source2:UnicodeString);//0040873C
    procedure @UStrCatN(var Dest:UnicodeString; ArgCnt:Integer);//004087C4
    //function @UStrCmp(Left:UnicodeString; Right:UnicodeString):?;//00408874
    procedure @UStrEqual(Left:UnicodeString; Right:UnicodeString);//004088D4
    function @UStrCopy(const S:UnicodeString; Index:Integer; Count:Integer):UnicodeString;//0040890C
    procedure @UStrDelete(var S:UnicodeString; Index:Integer; Count:Integer);//00408954
    procedure @UStrInsert(const Source:UnicodeString; var S:UnicodeString; Index:Integer);//004089B8
    function Pos(const SubStr:AnsiString; const Str:AnsiString):Integer;//00408A78
    function Pos(const SubStr:WideString; const Str:WideString):Integer;//00408AC4
    function Pos(const SubStr:RawByteString; const Str:RawByteString):Integer;//00408B14
    function StringOfChar(Ch:Char; Count:Integer):string;//00408C58
    procedure SetCodePage(var S:RawByteString; CodePage:Word; Convert:Boolean);//00408C80
    procedure @InitializeRecord(p:Pointer; typeInfo:Pointer);//00408DF4
    procedure @InitializeArray(p:Pointer; typeInfo:Pointer; elemCount:Cardinal);//00408E28
    procedure @Initialize(p:Pointer; typeInfo:Pointer);//00408EC0
    procedure @FinalizeRecord(P:Pointer; TypeInfo:Pointer);//00408ECC
    procedure @VarClr(var v:TVarData);//00408F04
    procedure @FinalizeArray(P:Pointer; TypeInfo:Pointer; ElemCount:Cardinal);//00408F1C
    procedure @Finalize(p:Pointer; typeInfo:Pointer);//0040902C
    procedure @AddRefRecord;//00409038
    procedure @VarAddRef(var v:TVarData);//00409068
    procedure @AddRefArray;//00409080
    procedure @VarCopy(var Dest:TVarData; const Src:TVarData);//00409144
    procedure @CopyRecord(Dest:Pointer; Source:Pointer; TypeInfo:Pointer);//0040915C
    procedure @CopyArray(Dest:Pointer; Source:Pointer; TypeInfo:Pointer; Cnt:Integer);//0040929C
    function @New(size:Integer; typeInfo:Pointer):Pointer;//004093B4
    procedure @Dispose(p:Pointer; typeInfo:Pointer);//004093C8
    procedure sub_004093D8;//004093D8
    procedure WideCharLenToStrVar(Source:PWideChar; SourceLen:Integer; var Dest:AnsiString);//004093E0
    procedure WideCharLenToStrVar(Source:PWideChar; SourceLen:Integer; var Dest:AnsiString);//004093EC
    function OleStrToString(Source:PWideChar):string;//00409400
    procedure OleStrToStrVar(Source:PWideChar; var Dest:AnsiString);//00409408
    procedure OleStrToStrVar(Source:PWideChar; var Dest:AnsiString);//00409424
    function StringToOleStr(const Source:AnsiString):PWideChar;//00409440
    //function sub_00409460(?:?):?;//00409460
    procedure @DispCallByIDError;//00409480
    procedure @_llmul;//00409488
    procedure @_lldiv;//004094AC
    procedure @_lludiv;//00409540
    procedure @_llmod;//0040958C
    procedure @_llumod;//00409608
    procedure @_llshl;//00409658
    procedure @_llushr;//00409670
    function @ValInt64(const s:AnsiString; var code:Integer):Int64;//00409688
    function @DynArrayLength(Arr:Pointer):Longint;//00409900
    function @DynArrayHigh(Arr:Pointer):Longint;//00409908
    procedure CopyArray(dest:Pointer; source:Pointer; typeInfo:Pointer; cnt:Integer);//00409910
    procedure FinalizeArray(P:Pointer; TypeInfo:Pointer; Count:Cardinal);//00409920
    procedure DynArrayClear(var arr:Pointer; typeInfo:PDynArrayTypeInfo);//00409928
    procedure DynArraySetLength(var arr:Pointer; typeInfo:PDynArrayTypeInfo; dimCnt:Longint; lenVec:PLongint);//00409930
    procedure @DynArraySetLength(var Arr:Pointer; TypeInfo:PDynArrayTypeInfo; DimCnt:Longint; LengthVec:Longint);//00409AC8
    procedure @DynArrayCopyRange(Arr:Pointer; TypeInfo:PDynArrayTypeInfo; Index:Integer; Count:Integer; var Result:Pointer);//00409AD4
    procedure @DynArrayClear(var Arr:Pointer; TypeInfo:PDynArrayTypeInfo);//00409BC8
    procedure @DynArrayAsg(var Dest:Pointer; Source:Pointer; TypeInfo:PDynArrayTypeInfo);//00409C04
    procedure @DynArrayAddRef(Arr:Pointer);//00409C2C
    function FindHInstance(Address:Pointer):Cardinal;//00409C38
    function FindClassHInstance(ClassType:TClass):Cardinal;//00409C60
    function DelayLoadResourceModule(Module:PLibModule):Cardinal;//00409C68
    function FindResourceHInstance(Instance:Cardinal):Cardinal;//00409CB0
    procedure InitializeLocaleData;//00409F14
    procedure FinalizeLocaleDate;//0040A004
    function LastHyphenPos(S:AnsiString):Integer;//0040A010
    function ConvertResToUILanguages(ResBuffer:PAnsiChar):string;//0040A07C
    function GetPreferredLangForOldOS(LANGID:Word):string;//0040A16C
    function CheckDifferentLanguageList(src1:PWideChar; src2:PWideChar; len:Integer):Boolean;//0040A300
    function ThreadUILanguages(var bufsize:Integer):PWideChar;//0040A324
    function GetPreferredLangForNewOS(const LANGID:Word):string;//0040A368
    function GetUILanguages(const LANGID:Word):string;//0040A484
    function FindBS(Current:PWideChar):PWideChar;//0040A5A4
    function ToLongPath(AFileName:PWideChar; BufLen:Integer):PWideChar;//0040A5C8
    function InternalGetLocaleOverride(AppName:AnsiString):string;//0040A7BC
    function GetLocaleOverride(const AppName:AnsiString):string;//0040AAD8
    procedure SetLocaleOverride(const NewPreferredLanguages:AnsiString);//0040AB3C
    function LoadModule(ModuleName:AnsiString; CheckOwner:Boolean):Cardinal;//0040AB90
    function ResouceDLLExists(S:AnsiString):Boolean;//0040ABE8
    function LoadLanguageList(FileNameBody:AnsiString; List:AnsiString):string;//0040AC54
    function Load3LettersModule(FileNameBody:AnsiString):string;//0040AD20
    function GetResourceModuleName(HostAppName:AnsiString; ModuleName:AnsiString):string;//0040ADEC
    function LoadResourceModule(ModuleName:PWideChar; CheckOwner:Boolean):Cardinal;//0040AF08
    procedure EnumResourceModules(Func:TEnumModuleFunc; Data:Pointer);//0040AFD0
    procedure EnumResourceModules(Func:TEnumModuleFuncLW; Data:Pointer);//0040AFD8
    procedure AddModuleUnloadProc(Proc:TModuleUnloadProc);//0040B004
    procedure RemoveModuleUnloadProc(Proc:TModuleUnloadProcLW);//0040B00C
    procedure AddModuleUnloadProc(Proc:TModuleUnloadProcLW);//0040B014
    //procedure sub_0040B034(?:?);//0040B034
    procedure NotifyModuleUnload(HInstance:Cardinal);//0040B098
    procedure RegisterModule(LibModule:PLibModule);//0040B0F4
    procedure UnregisterModule(LibModule:PLibModule);//0040B104
    function @IntfClear(var Dest:IInterface):Pointer;//0040B174
    procedure @IntfCopy(var Dest:IInterface; const Source:IInterface);//0040B18C
    procedure @IntfCast(var Dest:IInterface; const Source:IInterface; const IID:TGUID);//0040B1B8
    procedure @IntfAddRef(const Dest:IInterface);//0040B1E8
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;//0040B220
    function @CheckAutoResult(ResultCode:HRESULT):HRESULT;//0040B284
    function UnicodeToUtf8(Dest:PAnsiChar; MaxDestBytes:Cardinal; Source:PWideChar; SourceChars:Cardinal):Cardinal;//0040B2D0
    function Utf8ToUnicode(Dest:PWideChar; MaxDestChars:Cardinal; Source:PAnsiChar; SourceBytes:Cardinal):Cardinal;//0040B350
    function UTF8Encode(const WS:WideString):RawByteString;//0040B3C0
    function UTF8Encode(const US:AnsiString):RawByteString;//0040B4A4
    function UTF8EncodeToShortString(const US:AnsiString):ShortString;//0040B580
    function UTF8Decode(const S:RawByteString):WideString;//0040B5B8
    function UTF8ToWideString(const S:RawByteString):WideString;//0040B664
    function UTF8ToUnicodeString(const S:RawByteString):string;//0040B678
    function UTF8ToUnicodeString(const S:ShortString):string;//0040B724
    function UTF8ToString(const S:RawByteString):string;//0040B7B4
    function LoadResString(ResStringRec:PResStringRec):string;//0040B7C8
    function LocaleCharsFromUnicode(CodePage:Cardinal; Flags:Cardinal; UnicodeStr:PWideChar; UnicodeStrLen:Integer; LocaleStr:PAnsiChar; LocaleStrLen:Integer; DefaultChar:PAnsiChar; UsedDefaultChar:PLongBool):Integer;//0040B834
    function UnicodeFromLocaleChars(CodePage:Cardinal; Flags:Cardinal; LocaleStr:PAnsiChar; LocaleStrLen:Integer; UnicodeStr:PWideChar; UnicodeStrLen:Integer):Integer;//0040B85C
    function GetCPUCount:Integer;//0040B87C
    procedure SetUtf8CompareLocale;//0040B890
    function LocalAlloc(size:Integer):Pointer; stdcall;//0040B8CC
    function LocalFree:Pointer; stdcall;//0040B8D4
    function LoadLibraryA:HMODULE; stdcall;//0040B8DC
    function lstrcmpiA(lpString2:PAnsiChar):Integer; stdcall;//0040B8E4
    procedure @memcpy(var Dest:void ; const Src:void ; Count:Integer); cdecl;//0040B8EC
    procedure @memset(var Dest:void ; Value:Byte; Count:Integer); cdecl;//0040B900
    procedure @delayLoadHelper;//0040B914
    procedure ;//0040B91C
    //procedure sub_0040B956(?:?);//0040B956
    //function sub_0040B97E(?:?; ?:?):?;//0040B97E
    //function sub_0040B993(?:?):?;//0040B993
    //function sub_0040B9AA(?:?):?;//0040B9AA
    //procedure sub_0040B9B7(?:?; ?:?);//0040B9B7
    //function sub_0040B9DA(?:?):?;//0040B9DA
    //function sub_0040B9E7(?:?; ?:?):?;//0040B9E7
    procedure @_delayLoadHelper;//0040BA02
    //function sub_0040BC1F(?:?):?;//0040BC1F
    procedure @_FUnloadDelayLoadedDLL;//0040BC66
    procedure @InitDelayHelp;//0040BCD0
    procedure @ShutdownDelayHelp;//0040BCDF

implementation

//004025FC
function InterlockedExchangePointer(var P:Pointer; V:Pointer):Pointer;
begin
{*
 004025FC    mov         ecx,eax
 004025FE    mov         eax,dword ptr [ecx]
 00402600    lock cmpxchgdword ptr [ecx],edx
>00402604    jne         00402600
 00402606    ret
*}
end;

//00402608
function InterlockedExchange(var P:Pointer; V:Pointer):Pointer;
begin
{*
>00402608    jmp         InterlockedExchangePointer
 0040260D    ret
*}
end;

//00402610
function InterlockedAdd(var Addend:Integer; Increment:Integer):Integer;
begin
{*
 00402610    mov         ecx,eax
 00402612    mov         eax,edx
 00402614    lock xadd   dword ptr [ecx],eax
 00402618    add         eax,edx
 0040261A    ret
*}
end;

//0040261C
function InterlockedIncrement(var Addend:Integer):Integer;
begin
{*
 0040261C    mov         edx,1
>00402621    jmp         InterlockedAdd
 00402626    ret
*}
end;

//00402628
function InterlockedDecrement(var Addend:Integer):Integer;
begin
{*
 00402628    mov         edx,0FFFFFFFF
>0040262D    jmp         InterlockedAdd
 00402632    ret
*}
end;

//00402634
function InterlockedCompareExchange(var Destination:Integer; Exchange:Integer; Comparand:Integer):Integer;
begin
{*
 00402634    xchg        eax,ecx
 00402635    lock cmpxchgdword ptr [ecx],edx
 00402639    ret
*}
end;

//0040263C
function InterlockedCompareExchangePointer(var Destination:Pointer; Exchange:Pointer; Comparand:Pointer):Pointer;
begin
{*
>0040263C    jmp         InterlockedCompareExchange
 00402641    ret
*}
end;

//00402644
function kernel32.CloseHandle:LongBool; stdcall;
begin
{*
 00402644    jmp         dword ptr ds:[825F48]
*}
end;

//0040264C
function kernel32.CreateFileW(dwDesiredAccess:Integer; dwShareMode:Integer; lpSecurityAttributes:Pointer; dwCreationDisposition:Integer; dwFlagsAndAttributes:Integer; hTemplateFile:Integer):Integer; stdcall;
begin
{*
 0040264C    jmp         dword ptr ds:[825F44]
*}
end;

//00402654
procedure kernel32.InitializeCriticalSection; stdcall;
begin
{*
 00402654    jmp         dword ptr ds:[825F40]
*}
end;

//0040265C
procedure kernel32.EnterCriticalSection; stdcall;
begin
{*
 0040265C    jmp         dword ptr ds:[825F3C]
*}
end;

//00402664
procedure kernel32.LeaveCriticalSection; stdcall;
begin
{*
 00402664    jmp         dword ptr ds:[825F38]
*}
end;

//0040266C
procedure kernel32.DeleteCriticalSection; stdcall;
begin
{*
 0040266C    jmp         dword ptr ds:[825F34]
*}
end;

//00402674
function kernel32.GetFileType:Integer; stdcall;
begin
{*
 00402674    jmp         dword ptr ds:[825F30]
*}
end;

//0040267C
function kernel32.GetFileSize(x:Integer):Integer; stdcall;
begin
{*
 0040267C    jmp         dword ptr ds:[825F2C]
*}
end;

//00402684
function kernel32.GetStdHandle:THandle; stdcall;
begin
{*
 00402684    jmp         dword ptr ds:[825F28]
*}
end;

//0040268C
procedure kernel32.RaiseException(dwExceptionFlags:DWORD; nNumberOfArguments:DWORD; lpArguments:PDWORD); stdcall;
begin
{*
 0040268C    jmp         dword ptr ds:[825F24]
*}
end;

//00402694
function kernel32.ReadFile(var Buffer:void ; nNumberOfBytesToRead:DWORD; var lpNumberOfBytesRead:DWORD; lpOverlapped:POverlapped):LongBool; stdcall;
begin
{*
 00402694    jmp         dword ptr ds:[825F20]
*}
end;

//0040269C
procedure kernel32.RtlUnwind;
begin
{*
 0040269C    jmp         dword ptr ds:[825F1C]
*}
end;

//004026A4
function kernel32.SetEndOfFile:LongBool; stdcall;
begin
{*
 004026A4    jmp         dword ptr ds:[825F18]
*}
end;

//004026AC
function kernel32.SetFilePointer(lDistanceToMove:LongInt; lpDistanceToMoveHigh:Pointer; dwMoveMethod:DWORD):DWORD; stdcall;
begin
{*
 004026AC    jmp         dword ptr ds:[825F14]
*}
end;

//004026B4
function kernel32.UnhandledExceptionFilter:LongInt; stdcall;
begin
{*
 004026B4    jmp         dword ptr ds:[825F10]
*}
end;

//004026BC
function kernel32.WriteFile(const Buffer:void ; nNumberOfBytesToWrite:Cardinal; var lpNumberOfBytesWritten:Cardinal; lpOverlapped:Pointer):Integer; stdcall;
begin
{*
 004026BC    jmp         dword ptr ds:[825F0C]
*}
end;

//004026C4
function user32.CharNextW:PWideChar; stdcall;
begin
{*
 004026C4    jmp         dword ptr ds:[825E70]
*}
end;

//004026CC
function kernel32.CompareStringW(dwCmpFlags:Integer; lpString1:PWideChar; cchCount1:Integer; lpString2:PWideChar; cchCount2:Integer):Integer; stdcall;
begin
{*
 004026CC    jmp         dword ptr ds:[825F08]
*}
end;

//004026D4
function kernel32.CompareStringW(dwCmpFlags:Integer; lpString1:PWideChar; cchCount1:Integer; lpString2:PWideChar; cchCount2:Integer):Integer; stdcall;
begin
{*
 004026D4    jmp         dword ptr ds:[825F08]
*}
end;

//004026DC
function kernel32.CreateThread(StackSize:Cardinal; ThreadFunc:TThreadFunc; Parameter:Pointer; CreationFlags:Cardinal; var ThreadId:Cardinal):Integer; stdcall;
begin
{*
 004026DC    jmp         dword ptr ds:[825F04]
*}
end;

//004026E4
procedure kernel32.ExitThread; stdcall;
begin
{*
 004026E4    jmp         dword ptr ds:[825F00]
*}
end;

//004026EC
procedure kernel32.ExitProcess; stdcall;
begin
{*
 004026EC    jmp         dword ptr ds:[825EFC]
*}
end;

//004026F4
function user32.MessageBoxA(lpText:PAnsiChar; lpCaption:PAnsiChar; uType:LongWord):Integer; stdcall;
begin
{*
 004026F4    jmp         dword ptr ds:[825E6C]
*}
end;

//004026FC
procedure kernel32.FindClose;
begin
{*
 004026FC    jmp         dword ptr ds:[825EF8]
*}
end;

//00402704
function kernel32.FindFirstFileW(var lpFindFileData:_WIN32_FIND_DATAW):THandle; stdcall;
begin
{*
 00402704    jmp         dword ptr ds:[825EF4]
*}
end;

//0040270C
function kernel32.FreeLibrary:LongBool; stdcall;
begin
{*
 0040270C    jmp         dword ptr ds:[825EF0]
*}
end;

//00402714
function kernel32.GetCommandLineW:PWideChar;
begin
{*
 00402714    jmp         dword ptr ds:[825EEC]
*}
end;

//0040271C
function kernel32.GetLastError:DWORD;
begin
{*
 0040271C    jmp         dword ptr ds:[825EE8]
*}
end;

//00402724
function kernel32.GetLocaleInfoW(LCType:Integer; lpLCData:PWideChar; cchData:Integer):Integer; stdcall;
begin
{*
 00402724    jmp         dword ptr ds:[825EE4]
*}
end;

//0040272C
function kernel32.GetUserDefaultUILanguage:LANGID;
begin
{*
 0040272C    jmp         dword ptr ds:[825EE0]
*}
end;

//00402734
function kernel32.GetModuleFileNameW(lpFilename:PWideChar; nSize:DWORD):DWORD; stdcall;
begin
{*
 00402734    jmp         dword ptr ds:[825EDC]
*}
end;

//0040273C
function kernel32.GetModuleHandleW:Integer; stdcall;
begin
{*
 0040273C    jmp         dword ptr ds:[825ED8]
*}
end;

//00402744
function kernel32.GetProcAddress(lpProcName:PAnsiChar):Pointer; stdcall;
begin
{*
 00402744    jmp         dword ptr ds:[825ED4]
*}
end;

//0040274C
procedure kernel32.GetStartupInfoA; stdcall;
begin
{*
 0040274C    jmp         dword ptr ds:[825ED0]
*}
end;

//00402754
function kernel32.GetSystemDefaultUILanguage:Word;
begin
{*
 00402754    jmp         dword ptr ds:[825ECC]
*}
end;

//0040275C
function kernel32.IsValidLocale(dwFlags:DWORD):LongBool; stdcall;
begin
{*
 0040275C    jmp         dword ptr ds:[825EC8]
*}
end;

//00402764
function kernel32.LoadLibraryExW(hFile:THandle; dwFlags:DWORD):HMODULE; stdcall;
begin
{*
 00402764    jmp         dword ptr ds:[825EC4]
*}
end;

//0040276C
function user32.LoadStringW(uID:LongWord; lpBuffer:PWideChar; nBufferMax:Integer):Integer; stdcall;
begin
{*
 0040276C    jmp         dword ptr ds:[825E68]
*}
end;

//00402774
function kernel32.lstrcpynW(lpString2:PWideChar; iMaxLength:Integer):PWideChar; stdcall;
begin
{*
 00402774    jmp         dword ptr ds:[825EC0]
*}
end;

//0040277C
function kernel32.lstrlenW:Integer; stdcall;
begin
{*
 0040277C    jmp         dword ptr ds:[825EBC]
*}
end;

//00402784
function kernel32.MultiByteToWideChar(Flags:Integer; MBStr:PAnsiChar; MBCount:Integer; WCStr:PWideChar; WCCount:Integer):Integer; stdcall;
begin
{*
 00402784    jmp         dword ptr ds:[825EB8]
*}
end;

//0040278C
function advapi32.RegCloseKey:Integer; stdcall;
begin
{*
 0040278C    jmp         dword ptr ds:[825E60]
*}
end;

//00402794
function advapi32.RegOpenKeyExW(lpSubKey:PWideChar; ulOptions:Cardinal; samDesired:Cardinal; var phkResult:Cardinal):Integer; stdcall;
begin
{*
 00402794    jmp         dword ptr ds:[825E5C]
*}
end;

//0040279C
function advapi32.RegQueryValueExW(lpValueName:PWideChar; lpReserved:Pointer; lpType:PDWORD; lpData:PByte; lpcbData:PDWORD):LongInt; stdcall;
begin
{*
 0040279C    jmp         dword ptr ds:[825E58]
*}
end;

//004027A4
function kernel32.WideCharToMultiByte(dwFlags:DWORD; lpWideCharStr:PWideChar; cchWideChar:Integer; lpMultiByteStr:PAnsiChar; cchMultiByte:Integer; lpDefaultChar:PAnsiChar; lpUsedDefaultChar:PBOOL):Integer; stdcall;
begin
{*
 004027A4    jmp         dword ptr ds:[825EB4]
*}
end;

//004027AC
function kernel32.VirtualQuery(var lpBuffer:_MEMORY_BASIC_INFORMATION; dwLength:DWORD):DWORD; stdcall;
begin
{*
 004027AC    jmp         dword ptr ds:[825EB0]
*}
end;

//004027B4
function oleaut32.SysAllocStringLen(len:Integer):PWideChar; stdcall;
begin
{*
 004027B4    jmp         dword ptr ds:[825E50]
*}
end;

//004027BC
function oleaut32.SysReAllocStringLen(psz:PWideChar; len:Integer):Integer; stdcall;
begin
{*
 004027BC    jmp         dword ptr ds:[825E4C]
*}
end;

//004027C4
procedure oleaut32.SysFreeString; stdcall;
begin
{*
 004027C4    jmp         dword ptr ds:[825E48]
*}
end;

//004027CC
function kernel32.GetCurrentThreadId:DWORD;
begin
{*
 004027CC    jmp         dword ptr ds:[825EAC]
*}
end;

//004027D4
function kernel32.GetVersion:Cardinal;
begin
{*
 004027D4    jmp         dword ptr ds:[825EA8]
*}
end;

//004027DC
function kernel32.QueryPerformanceCounter:LongBool; stdcall;
begin
{*
 004027DC    jmp         dword ptr ds:[825EA4]
*}
end;

//004027E4
function kernel32.GetTickCount:DWORD;
begin
{*
 004027E4    jmp         dword ptr ds:[825EA0]
*}
end;

//004027EC
procedure kernel32.GetSystemInfo; stdcall;
begin
{*
 004027EC    jmp         dword ptr ds:[825E9C]
*}
end;

//004027F4
function kernel32.GetACP:Cardinal;
begin
{*
 004027F4    jmp         dword ptr ds:[825E98]
*}
end;

//004027FC
function kernel32.SwitchToThread:LongBool;
begin
{*
 004027FC    jmp         dword ptr ds:[825E94]
*}
end;

//00402804
function GetCmdShow:Integer;
begin
{*
 00402804    push        ebx
 00402805    add         esp,0FFFFFFBC
 00402808    mov         ebx,0A
 0040280D    mov         dword ptr [esp],44
 00402814    push        esp
 00402815    call        kernel32.GetStartupInfoA
 0040281A    test        byte ptr [esp+2C],1
>0040281F    je          00402826
 00402821    movzx       ebx,word ptr [esp+30]
 00402826    mov         eax,ebx
 00402828    add         esp,44
 0040282B    pop         ebx
 0040282C    ret
*}
end;

//00402830
function kernel32.VirtualAlloc(dwSize:Cardinal; flAllocationType:Cardinal; flProtect:Cardinal):Pointer; stdcall;
begin
{*
 00402830    jmp         dword ptr ds:[825E90]
*}
end;

//00402838
function kernel32.VirtualFree(dwSize:DWORD; dwFreeType:DWORD):LongBool; stdcall;
begin
{*
 00402838    jmp         dword ptr ds:[825E8C]
*}
end;

//00402840
{*function kernel32.Sleep:?; stdcall;
begin
 00402840    jmp         dword ptr ds:[825E88]
end;*}

//00402990
function LockCmpxchg(CompareVal:Byte; NewVal:Byte; AAddress:PByte):Byte;
begin
{*
 00402990    lock cmpxchgbyte ptr [ecx],dl
 00402994    ret
*}
end;

//00402998
procedure Move12(const ASource:void ; var ADest:void ; ACount:Integer);
begin
{*
 00402998    mov         ecx,dword ptr [eax]
 0040299A    mov         dword ptr [edx],ecx
 0040299C    mov         ecx,dword ptr [eax+4]
 0040299F    mov         eax,dword ptr [eax+8]
 004029A2    mov         dword ptr [edx+4],ecx
 004029A5    mov         dword ptr [edx+8],eax
 004029A8    ret
*}
end;

//004029AC
procedure Move20(const ASource:void ; var ADest:void ; ACount:Integer);
begin
{*
 004029AC    mov         ecx,dword ptr [eax]
 004029AE    mov         dword ptr [edx],ecx
 004029B0    mov         ecx,dword ptr [eax+4]
 004029B3    mov         dword ptr [edx+4],ecx
 004029B6    mov         ecx,dword ptr [eax+8]
 004029B9    mov         dword ptr [edx+8],ecx
 004029BC    mov         ecx,dword ptr [eax+0C]
 004029BF    mov         eax,dword ptr [eax+10]
 004029C2    mov         dword ptr [edx+0C],ecx
 004029C5    mov         dword ptr [edx+10],eax
 004029C8    ret
*}
end;

//004029CC
procedure Move28(const ASource:void ; var ADest:void ; ACount:Integer);
begin
{*
 004029CC    mov         ecx,dword ptr [eax]
 004029CE    mov         dword ptr [edx],ecx
 004029D0    mov         ecx,dword ptr [eax+4]
 004029D3    mov         dword ptr [edx+4],ecx
 004029D6    mov         ecx,dword ptr [eax+8]
 004029D9    mov         dword ptr [edx+8],ecx
 004029DC    mov         ecx,dword ptr [eax+0C]
 004029DF    mov         dword ptr [edx+0C],ecx
 004029E2    mov         ecx,dword ptr [eax+10]
 004029E5    mov         dword ptr [edx+10],ecx
 004029E8    mov         ecx,dword ptr [eax+14]
 004029EB    mov         eax,dword ptr [eax+18]
 004029EE    mov         dword ptr [edx+14],ecx
 004029F1    mov         dword ptr [edx+18],eax
 004029F4    ret
*}
end;

//004029F8
procedure Move36(const ASource:void ; var ADest:void ; ACount:Integer);
begin
{*
 004029F8    fild        qword ptr [eax]
 004029FA    fild        qword ptr [eax+8]
 004029FD    fild        qword ptr [eax+10]
 00402A00    fild        qword ptr [eax+18]
 00402A03    mov         ecx,dword ptr [eax+20]
 00402A06    mov         dword ptr [edx+20],ecx
 00402A09    fistp       qword ptr [edx+18]
 00402A0C    fistp       qword ptr [edx+10]
 00402A0F    fistp       qword ptr [edx+8]
 00402A12    fistp       qword ptr [edx]
 00402A14    ret
*}
end;

//00402A18
procedure Move44(const ASource:void ; var ADest:void ; ACount:Integer);
begin
{*
 00402A18    fild        qword ptr [eax]
 00402A1A    fild        qword ptr [eax+8]
 00402A1D    fild        qword ptr [eax+10]
 00402A20    fild        qword ptr [eax+18]
 00402A23    fild        qword ptr [eax+20]
 00402A26    mov         ecx,dword ptr [eax+28]
 00402A29    mov         dword ptr [edx+28],ecx
 00402A2C    fistp       qword ptr [edx+20]
 00402A2F    fistp       qword ptr [edx+18]
 00402A32    fistp       qword ptr [edx+10]
 00402A35    fistp       qword ptr [edx+8]
 00402A38    fistp       qword ptr [edx]
 00402A3A    ret
*}
end;

//00402A3C
procedure Move52(const ASource:void ; var ADest:void ; ACount:Integer);
begin
{*
 00402A3C    fild        qword ptr [eax]
 00402A3E    fild        qword ptr [eax+8]
 00402A41    fild        qword ptr [eax+10]
 00402A44    fild        qword ptr [eax+18]
 00402A47    fild        qword ptr [eax+20]
 00402A4A    fild        qword ptr [eax+28]
 00402A4D    mov         ecx,dword ptr [eax+30]
 00402A50    mov         dword ptr [edx+30],ecx
 00402A53    fistp       qword ptr [edx+28]
 00402A56    fistp       qword ptr [edx+20]
 00402A59    fistp       qword ptr [edx+18]
 00402A5C    fistp       qword ptr [edx+10]
 00402A5F    fistp       qword ptr [edx+8]
 00402A62    fistp       qword ptr [edx]
 00402A64    ret
*}
end;

//00402A68
procedure Move60(const ASource:void ; var ADest:void ; ACount:Integer);
begin
{*
 00402A68    fild        qword ptr [eax]
 00402A6A    fild        qword ptr [eax+8]
 00402A6D    fild        qword ptr [eax+10]
 00402A70    fild        qword ptr [eax+18]
 00402A73    fild        qword ptr [eax+20]
 00402A76    fild        qword ptr [eax+28]
 00402A79    fild        qword ptr [eax+30]
 00402A7C    mov         ecx,dword ptr [eax+38]
 00402A7F    mov         dword ptr [edx+38],ecx
 00402A82    fistp       qword ptr [edx+30]
 00402A85    fistp       qword ptr [edx+28]
 00402A88    fistp       qword ptr [edx+20]
 00402A8B    fistp       qword ptr [edx+18]
 00402A8E    fistp       qword ptr [edx+10]
 00402A91    fistp       qword ptr [edx+8]
 00402A94    fistp       qword ptr [edx]
 00402A96    ret
*}
end;

//00402A98
procedure Move68(const ASource:void ; var ADest:void ; ACount:Integer);
begin
{*
 00402A98    fild        qword ptr [eax]
 00402A9A    fild        qword ptr [eax+8]
 00402A9D    fild        qword ptr [eax+10]
 00402AA0    fild        qword ptr [eax+18]
 00402AA3    fild        qword ptr [eax+20]
 00402AA6    fild        qword ptr [eax+28]
 00402AA9    fild        qword ptr [eax+30]
 00402AAC    fild        qword ptr [eax+38]
 00402AAF    mov         ecx,dword ptr [eax+40]
 00402AB2    mov         dword ptr [edx+40],ecx
 00402AB5    fistp       qword ptr [edx+38]
 00402AB8    fistp       qword ptr [edx+30]
 00402ABB    fistp       qword ptr [edx+28]
 00402ABE    fistp       qword ptr [edx+20]
 00402AC1    fistp       qword ptr [edx+18]
 00402AC4    fistp       qword ptr [edx+10]
 00402AC7    fistp       qword ptr [edx+8]
 00402ACA    fistp       qword ptr [edx]
 00402ACC    ret
*}
end;

//00402AD0
procedure MoveX16L4(const ASource:void ; var ADest:void ; ACount:Integer);
begin
{*
 00402AD0    sub         ecx,0C
 00402AD3    add         eax,ecx
 00402AD5    add         edx,ecx
 00402AD7    neg         ecx
>00402AD9    jns         00402AEE
 00402ADB    fild        qword ptr [ecx+eax]
 00402ADE    fild        qword ptr [ecx+eax+8]
 00402AE2    fistp       qword ptr [ecx+edx+8]
 00402AE6    fistp       qword ptr [ecx+edx]
 00402AE9    add         ecx,10
>00402AEC    js          00402ADB
 00402AEE    fild        qword ptr [ecx+eax]
 00402AF1    fistp       qword ptr [ecx+edx]
 00402AF4    mov         eax,dword ptr [ecx+eax+8]
 00402AF8    mov         dword ptr [ecx+edx+8],eax
 00402AFC    ret
*}
end;

//00402B00
procedure MoveX8L4(const ASource:void ; var ADest:void ; ACount:Integer);
begin
{*
 00402B00    sub         ecx,4
 00402B03    add         eax,ecx
 00402B05    add         edx,ecx
 00402B07    neg         ecx
 00402B09    fild        qword ptr [ecx+eax]
 00402B0C    fistp       qword ptr [ecx+edx]
 00402B0F    add         ecx,8
>00402B12    js          00402B09
 00402B14    mov         eax,dword ptr [ecx+eax]
 00402B17    mov         dword ptr [ecx+edx],eax
 00402B1A    ret
*}
end;

//00402B1C
procedure RemoveMediumFreeBlock(APMediumFreeBlock:PMediumFreeBlock);
begin
{*
 00402B1C    mov         ecx,dword ptr [eax+4]
 00402B1F    mov         edx,dword ptr [eax]
 00402B21    cmp         ecx,edx
 00402B23    mov         dword ptr [ecx],edx
 00402B25    mov         dword ptr [edx+4],ecx
>00402B28    je          00402B2C
 00402B2A    ret
 00402B2B    nop
 00402B2C    sub         ecx,78EAC8
 00402B32    mov         edx,ecx
 00402B34    shr         ecx,3
 00402B37    movzx       edx,dh
 00402B3A    mov         eax,0FFFFFFFE
 00402B3F    rol         eax,cl
 00402B41    and         dword ptr [edx*4+78EA48],eax
>00402B48    jne         00402B2A
 00402B4A    mov         eax,0FFFFFFFE
 00402B4F    mov         ecx,edx
 00402B51    rol         eax,cl
 00402B53    and         dword ptr ds:[78EA44],eax
 00402B59    ret
*}
end;

//00402B5C
procedure InsertMediumBlockIntoBin(APMediumFreeBlock:PMediumFreeBlock; AMediumBlockSize:Cardinal);
begin
{*
 00402B5C    sub         edx,0B30
 00402B62    shr         edx,8
 00402B65    sub         edx,3FF
 00402B6B    sbb         ecx,ecx
 00402B6D    and         edx,ecx
 00402B6F    add         edx,3FF
 00402B75    lea         ecx,[edx*8+78EAC8]
 00402B7C    mov         edx,dword ptr [ecx+4]
 00402B7F    cmp         edx,ecx
 00402B81    mov         dword ptr [eax],ecx
 00402B83    mov         dword ptr [eax+4],edx
 00402B86    mov         dword ptr [edx],eax
 00402B88    mov         dword ptr [ecx+4],eax
>00402B8B    je          00402B90
 00402B8D    ret
 00402B8E    nop
 00402B8F    nop
 00402B90    sub         ecx,78EAC8
 00402B96    mov         edx,ecx
 00402B98    shr         ecx,3
 00402B9B    movzx       edx,dh
 00402B9E    mov         eax,1
 00402BA3    shl         eax,cl
 00402BA5    or          dword ptr [edx*4+78EA48],eax
 00402BAC    mov         eax,1
 00402BB1    mov         ecx,edx
 00402BB3    shl         eax,cl
 00402BB5    or          dword ptr ds:[78EA44],eax
 00402BBB    ret
*}
end;

//00402BBC
procedure BinMediumSequentialFeedRemainder;
begin
{*
 00402BBC    cmp         dword ptr ds:[78EA40],0
>00402BC3    jne         00402BC8
 00402BC5    ret
 00402BC6    nop
 00402BC7    nop
 00402BC8    mov         eax,[0078EA3C]
 00402BCD    test        byte ptr [eax-4],1
>00402BD1    jne         00402BF8
 00402BD3    or          dword ptr [eax-4],8
 00402BD7    mov         edx,dword ptr ds:[78EA40]
 00402BDD    sub         eax,edx
 00402BDF    lea         ecx,[edx+3]
 00402BE2    mov         dword ptr [eax-4],ecx
 00402BE5    mov         dword ptr [edx+eax-8],edx
 00402BE9    cmp         edx,0B30
>00402BEF    jae         00402B5C
 00402BF5    ret
 00402BF6    nop
 00402BF7    nop
 00402BF8    mov         edx,0FFFFFFF0
 00402BFD    and         edx,dword ptr [eax-4]
 00402C00    cmp         edx,0B30
>00402C06    jb          00402C1A
 00402C08    call        RemoveMediumFreeBlock
 00402C0D    mov         eax,[0078EA3C]
 00402C12    mov         edx,0FFFFFFF0
 00402C17    and         edx,dword ptr [eax-4]
 00402C1A    mov         ecx,dword ptr ds:[78EA40]
 00402C20    sub         eax,ecx
 00402C22    add         edx,ecx
>00402C24    jmp         00402BDF
 00402C26    ret
*}
end;

//00402C28
function AllocNewSequentialFeedMediumPool(AFirstBlockSize:Cardinal):Pointer;
begin
{*
 00402C28    push        ebx
 00402C29    mov         ebx,eax
 00402C2B    call        BinMediumSequentialFeedRemainder
 00402C30    push        4
 00402C32    push        1000
 00402C37    push        13FFF0
 00402C3C    push        0
 00402C3E    call        kernel32.VirtualAlloc
 00402C43    test        eax,eax
>00402C45    je          00402C94
 00402C47    mov         edx,dword ptr ds:[78EA2F]
 00402C4D    mov         ecx,eax
 00402C4F    mov         dword ptr [ecx],78EA2B
 00402C55    mov         [0078EA2F],eax
 00402C5A    mov         dword ptr [ecx+4],edx
 00402C5D    mov         dword ptr [edx],eax
 00402C5F    mov         ecx,eax
 00402C61    add         ecx,13FFF0
 00402C67    mov         edx,ecx
 00402C69    sub         edx,4
 00402C6C    mov         dword ptr [edx],2
 00402C72    mov         edx,13FFE0
 00402C77    sub         edx,ebx
 00402C79    mov         dword ptr ds:[78EA40],edx
 00402C7F    sub         ecx,ebx
 00402C81    mov         eax,ecx
 00402C83    mov         [0078EA3C],eax
 00402C88    mov         edx,eax
 00402C8A    or          ebx,2
 00402C8D    sub         edx,4
 00402C90    mov         dword ptr [edx],ebx
 00402C92    pop         ebx
 00402C93    ret
 00402C94    xor         eax,eax
 00402C96    mov         [0078EA40],eax
 00402C9B    xor         eax,eax
 00402C9D    pop         ebx
 00402C9E    ret
*}
end;

//00402CA0
procedure LockLargeBlocks;
begin
{*
 00402CA0    cmp         byte ptr ds:[78E055],0
>00402CA7    je          00402CE6
>00402CA9    jmp         00402CD4
 00402CAB    cmp         byte ptr ds:[78E8DD],0
>00402CB2    jne         00402CD4
 00402CB4    push        0
 00402CB6    call        kernel32.Sleep
 00402CBB    mov         ecx,790AC8
 00402CC0    mov         dl,1
 00402CC2    xor         eax,eax
 00402CC4    call        LockCmpxchg
 00402CC9    test        al,al
>00402CCB    je          00402CE6
 00402CCD    push        0A
 00402CCF    call        kernel32.Sleep
 00402CD4    mov         ecx,790AC8
 00402CD9    mov         dl,1
 00402CDB    xor         eax,eax
 00402CDD    call        LockCmpxchg
 00402CE2    test        al,al
>00402CE4    jne         00402CAB
 00402CE6    ret
*}
end;

//00402CE8
function AllocateLargeBlock(ASize:Cardinal):Pointer;
begin
{*
 00402CE8    push        ebx
 00402CE9    push        esi
 00402CEA    push        edi
 00402CEB    push        ebp
 00402CEC    mov         ebp,eax
 00402CEE    lea         esi,[ebp+10010]
 00402CF4    dec         esi
 00402CF5    add         esi,4
 00402CF8    and         esi,0FFFF0000
 00402CFE    push        4
 00402D00    push        101000
 00402D05    push        esi
 00402D06    push        0
 00402D08    call        kernel32.VirtualAlloc
 00402D0D    mov         ebx,eax
 00402D0F    test        ebx,ebx
>00402D11    je          00402D43
 00402D13    mov         edi,ebx
 00402D15    mov         dword ptr [edi+8],ebp
 00402D18    or          esi,4
 00402D1B    mov         dword ptr [edi+0C],esi
 00402D1E    call        LockLargeBlocks
 00402D23    mov         eax,[00790ACD]
 00402D28    mov         dword ptr [edi],790AC9
 00402D2E    mov         dword ptr ds:[790ACD],ebx
 00402D34    mov         dword ptr [edi+4],eax
 00402D37    mov         dword ptr [eax],ebx
 00402D39    mov         byte ptr ds:[790AC8],0
 00402D40    add         ebx,10
 00402D43    mov         eax,ebx
 00402D45    pop         ebp
 00402D46    pop         edi
 00402D47    pop         esi
 00402D48    pop         ebx
 00402D49    ret
*}
end;

//00402D4C
function FreeLargeBlock(APointer:Pointer):Integer;
begin
{*
 00402D4C    push        ebx
 00402D4D    push        esi
 00402D4E    push        edi
 00402D4F    push        ebp
 00402D50    add         esp,0FFFFFFDC
 00402D53    mov         esi,eax
 00402D55    sub         esi,10
 00402D58    call        LockLargeBlocks
 00402D5D    mov         eax,esi
 00402D5F    mov         edx,dword ptr [eax]
 00402D61    mov         dword ptr [esp],edx
 00402D64    mov         edx,dword ptr [eax+4]
 00402D67    mov         dword ptr [esp+4],edx
 00402D6B    mov         edx,dword ptr [eax+0C]
 00402D6E    test        dl,8
>00402D71    jne         00402D8D
 00402D73    push        8000
 00402D78    push        0
 00402D7A    push        esi
 00402D7B    call        kernel32.VirtualFree
 00402D80    test        eax,eax
>00402D82    je          00402D88
 00402D84    xor         edi,edi
>00402D86    jmp         00402DC7
 00402D88    or          edi,0FFFFFFFF
>00402D8B    jmp         00402DC7
 00402D8D    mov         ebx,esi
 00402D8F    mov         ebp,edx
 00402D91    and         ebp,0FFFFFFF0
 00402D94    xor         edi,edi
 00402D96    push        1C
 00402D98    lea         eax,[esp+0C]
 00402D9C    push        eax
 00402D9D    push        ebx
 00402D9E    call        kernel32.VirtualQuery
 00402DA3    push        8000
 00402DA8    push        0
 00402DAA    push        ebx
 00402DAB    call        kernel32.VirtualFree
 00402DB0    test        eax,eax
>00402DB2    jne         00402DB9
 00402DB4    or          edi,0FFFFFFFF
>00402DB7    jmp         00402DC7
 00402DB9    mov         esi,dword ptr [esp+14]
 00402DBD    cmp         ebp,esi
>00402DBF    jbe         00402DC7
 00402DC1    sub         ebp,esi
 00402DC3    add         ebx,esi
>00402DC5    jmp         00402D96
 00402DC7    test        edi,edi
>00402DC9    jne         00402DDE
 00402DCB    mov         eax,dword ptr [esp+4]
 00402DCF    mov         edx,dword ptr [esp]
 00402DD2    mov         dword ptr [eax],edx
 00402DD4    mov         eax,dword ptr [esp]
 00402DD7    mov         edx,dword ptr [esp+4]
 00402DDB    mov         dword ptr [eax+4],edx
 00402DDE    mov         byte ptr ds:[790AC8],0
 00402DE5    mov         eax,edi
 00402DE7    add         esp,24
 00402DEA    pop         ebp
 00402DEB    pop         edi
 00402DEC    pop         esi
 00402DED    pop         ebx
 00402DEE    ret
*}
end;

//00402DF0
function ReallocateLargeBlock(APointer:Pointer; ANewSize:Cardinal):Pointer;
begin
{*
 00402DF0    push        ebx
 00402DF1    push        esi
 00402DF2    push        edi
 00402DF3    push        ebp
 00402DF4    add         esp,0FFFFFFE0
 00402DF7    mov         esi,edx
 00402DF9    mov         edi,eax
 00402DFB    mov         eax,edi
 00402DFD    sub         eax,4
 00402E00    mov         eax,dword ptr [eax]
 00402E02    mov         ebx,eax
 00402E04    and         ebx,0FFFFFFF0
 00402E07    sub         ebx,14
 00402E0A    cmp         ebx,esi
>00402E0C    jae         00402EF3
 00402E12    mov         edx,ebx
 00402E14    shr         edx,2
 00402E17    add         edx,ebx
 00402E19    cmp         edx,esi
>00402E1B    jbe         00402E21
 00402E1D    mov         ebp,edx
>00402E1F    jmp         00402E23
 00402E21    mov         ebp,esi
 00402E23    mov         edx,edi
 00402E25    sub         edx,10
 00402E28    and         eax,0FFFFFFF0
 00402E2B    add         edx,eax
 00402E2D    mov         dword ptr [esp],edx
 00402E30    push        1C
 00402E32    lea         eax,[esp+8]
 00402E36    push        eax
 00402E37    mov         eax,dword ptr [esp+8]
 00402E3B    push        eax
 00402E3C    call        kernel32.VirtualQuery
 00402E41    cmp         dword ptr [esp+14],10000
>00402E49    jne         00402EBB
 00402E4B    and         dword ptr [esp+10],0FFFF0000
 00402E53    mov         edx,esi
 00402E55    sub         edx,ebx
 00402E57    mov         eax,dword ptr [esp+10]
 00402E5B    cmp         edx,eax
>00402E5D    jae         00402EBB
 00402E5F    mov         edx,ebp
 00402E61    sub         edx,ebx
 00402E63    add         edx,10000
 00402E69    dec         edx
 00402E6A    and         edx,0FFFF0000
 00402E70    mov         ebx,edx
 00402E72    cmp         eax,ebx
>00402E74    jae         00402E78
 00402E76    mov         ebx,eax
 00402E78    push        4
 00402E7A    push        2000
 00402E7F    push        ebx
 00402E80    mov         eax,dword ptr [esp+0C]
 00402E84    push        eax
 00402E85    call        kernel32.VirtualAlloc
 00402E8A    test        eax,eax
>00402E8C    je          00402EBB
 00402E8E    push        4
 00402E90    push        1000
 00402E95    push        ebx
 00402E96    mov         eax,dword ptr [esp+0C]
 00402E9A    push        eax
 00402E9B    call        kernel32.VirtualAlloc
 00402EA0    test        eax,eax
>00402EA2    je          00402EBB
 00402EA4    mov         eax,edi
 00402EA6    sub         eax,10
 00402EA9    mov         dword ptr [eax+8],esi
 00402EAC    mov         edx,eax
 00402EAE    add         ebx,dword ptr [edx+0C]
 00402EB1    or          ebx,8
 00402EB4    mov         dword ptr [edx+0C],ebx
 00402EB7    mov         ebx,edi
>00402EB9    jmp         00402F32
 00402EBB    mov         eax,ebp
 00402EBD    call        SysGetMem
 00402EC2    mov         ebx,eax
 00402EC4    test        ebx,ebx
>00402EC6    je          00402F32
 00402EC8    cmp         ebp,40A2C
>00402ECE    jbe         00402ED8
 00402ED0    mov         eax,ebx
 00402ED2    sub         eax,10
 00402ED5    mov         dword ptr [eax+8],esi
 00402ED8    mov         eax,edi
 00402EDA    sub         eax,10
 00402EDD    mov         eax,dword ptr [eax+8]
 00402EE0    mov         edx,ebx
 00402EE2    mov         ecx,edi
 00402EE4    xchg        eax,ecx
 00402EE5    call        MoveX16L4
 00402EEA    mov         eax,edi
 00402EEC    call        SysFreeMem
>00402EF1    jmp         00402F32
 00402EF3    shr         ebx,1
 00402EF5    cmp         esi,ebx
>00402EF7    jb          00402F03
 00402EF9    mov         ebx,edi
 00402EFB    sub         edi,10
 00402EFE    mov         dword ptr [edi+8],esi
>00402F01    jmp         00402F32
 00402F03    mov         eax,esi
 00402F05    call        SysGetMem
 00402F0A    mov         ebx,eax
 00402F0C    test        ebx,ebx
>00402F0E    je          00402F32
 00402F10    cmp         esi,40A2C
>00402F16    jbe         00402F20
 00402F18    mov         eax,edi
 00402F1A    sub         eax,10
 00402F1D    mov         dword ptr [eax+8],esi
 00402F20    mov         edx,ebx
 00402F22    mov         eax,edi
 00402F24    mov         ecx,esi
 00402F26    call        MoveX8L4
 00402F2B    mov         eax,edi
 00402F2D    call        SysFreeMem
 00402F32    mov         eax,ebx
 00402F34    add         esp,20
 00402F37    pop         ebp
 00402F38    pop         edi
 00402F39    pop         esi
 00402F3A    pop         ebx
 00402F3B    ret
*}
end;

//00402F3C
function SysGetMem(Size:Integer):Pointer;
begin
{*
 00402F3C    lea         edx,[eax+3]
 00402F3F    shr         edx,3
 00402F42    cmp         eax,0A2C
 00402F47    push        ebx
 00402F48    mov         cl,byte ptr ds:[78E055]
>00402F4E    ja          0040319C
 00402F54    test        cl,cl
 00402F56    movzx       eax,byte ptr [edx+78E8E4]
 00402F5D    lea         ebx,[eax*8+784078]
>00402F64    jne         00402FBC
 00402F66    mov         edx,dword ptr [ebx+4]
 00402F69    mov         eax,dword ptr [edx+8]
 00402F6C    mov         ecx,0FFFFFFF8
 00402F71    cmp         edx,ebx
>00402F73    je          00402F8C
 00402F75    add         dword ptr [edx+0C],1
 00402F79    and         ecx,dword ptr [eax-4]
 00402F7C    mov         dword ptr [edx+8],ecx
 00402F7F    mov         dword ptr [eax-4],edx
>00402F82    je          00402FAC
 00402F84    mov         byte ptr [ebx],0
 00402F87    pop         ebx
 00402F88    ret
 00402F89    nop
 00402F8A    nop
 00402F8B    nop
 00402F8C    mov         edx,dword ptr [ebx+10]
 00402F8F    movzx       ecx,word ptr [ebx+2]
 00402F93    add         ecx,eax
 00402F95    cmp         eax,dword ptr [ebx+0C]
>00402F98    ja          00403010
 00402F9A    add         dword ptr [edx+0C],1
 00402F9E    mov         dword ptr [ebx+8],ecx
 00402FA1    mov         byte ptr [ebx],0
 00402FA4    mov         dword ptr [eax-4],edx
 00402FA7    pop         ebx
 00402FA8    ret
 00402FA9    nop
 00402FAA    nop
 00402FAB    nop
 00402FAC    mov         ecx,dword ptr [edx+4]
 00402FAF    mov         dword ptr [ecx+14],ebx
 00402FB2    mov         dword ptr [ebx+4],ecx
 00402FB5    mov         byte ptr [ebx],0
 00402FB8    pop         ebx
 00402FB9    ret
 00402FBA    nop
 00402FBB    nop
 00402FBC    mov         eax,100
 00402FC1    lock cmpxchgbyte ptr [ebx],ah
>00402FC5    je          00402F66
 00402FC7    add         ebx,20
 00402FCA    mov         eax,100
 00402FCF    lock cmpxchgbyte ptr [ebx],ah
>00402FD3    je          00402F66
 00402FD5    add         ebx,20
 00402FD8    mov         eax,100
 00402FDD    lock cmpxchgbyte ptr [ebx],ah
>00402FE1    je          00402F66
 00402FE3    sub         ebx,40
 00402FE6    rep nop
 00402FE8    cmp         byte ptr ds:[78E8DD],0
>00402FEF    jne         00402FBC
 00402FF1    push        0
 00402FF3    call        kernel32.Sleep
 00402FF8    mov         eax,100
 00402FFD    lock cmpxchgbyte ptr [ebx],ah
>00403001    je          00402F66
 00403007    push        0A
 00403009    call        kernel32.Sleep
>0040300E    jmp         00402FBC
 00403010    push        esi
 00403011    push        edi
 00403012    cmp         byte ptr ds:[78E055],0
>00403019    je          00403054
 0040301B    mov         eax,100
 00403020    lock cmpxchgbyte ptr ds:[78EA3B],ah
>00403028    je          00403054
 0040302A    rep nop
 0040302C    cmp         byte ptr ds:[78E8DD],0
>00403033    jne         0040301B
 00403035    push        0
 00403037    call        kernel32.Sleep
 0040303C    mov         eax,100
 00403041    lock cmpxchgbyte ptr ds:[78EA3B],ah
>00403049    je          00403054
 0040304B    push        0A
 0040304D    call        kernel32.Sleep
>00403052    jmp         0040301B
 00403054    movsx       esi,byte ptr [ebx+1]
 00403058    and         esi,dword ptr ds:[78EA44]
>0040305E    je          004030D0
 00403060    bsf         eax,esi
 00403063    lea         esi,[eax*8+0]
 0040306A    mov         ecx,dword ptr [eax*4+78EA48]
 00403071    bsf         ecx,ecx
 00403074    lea         ecx,[ecx+esi*4]
 00403077    lea         edi,[ecx*8+78EAC8]
 0040307E    mov         esi,dword ptr [edi+4]
 00403081    mov         edx,dword ptr [esi+4]
 00403084    mov         dword ptr [edi+4],edx
 00403087    mov         dword ptr [edx],edi
 00403089    cmp         edi,edx
>0040308B    jne         004030A4
 0040308D    mov         edx,0FFFFFFFE
 00403092    rol         edx,cl
 00403094    and         dword ptr [eax*4+78EA48],edx
>0040309B    jne         004030A4
 0040309D    btr         dword ptr ds:[78EA44],eax
 004030A4    mov         edi,0FFFFFFF0
 004030A9    and         edi,dword ptr [esi-4]
 004030AC    cmp         edi,10A60
>004030B2    jb          00403120
 004030B4    mov         edx,edi
 004030B6    movzx       edi,word ptr [ebx+1A]
 004030BA    sub         edx,edi
 004030BC    lea         eax,[edi+esi]
 004030BF    lea         ecx,[edx+3]
 004030C2    mov         dword ptr [eax-4],ecx
 004030C5    mov         dword ptr [edx+eax-8],edx
 004030C9    call        InsertMediumBlockIntoBin
>004030CE    jmp         00403125
 004030D0    movzx       ecx,word ptr [ebx+18]
 004030D4    mov         edi,dword ptr ds:[78EA40]
 004030DA    cmp         edi,ecx
>004030DC    jb          00403104
 004030DE    mov         esi,dword ptr ds:[78EA3C]
 004030E4    movzx       ecx,word ptr [ebx+1A]
 004030E8    lea         edx,[ecx+0B30]
 004030EE    cmp         edi,edx
>004030F0    jb          004030F4
 004030F2    mov         edi,ecx
 004030F4    sub         esi,edi
 004030F6    sub         dword ptr ds:[78EA40],edi
 004030FC    mov         dword ptr ds:[78EA3C],esi
>00403102    jmp         00403125
 00403104    movzx       eax,word ptr [ebx+1A]
 00403108    mov         edi,eax
 0040310A    call        AllocNewSequentialFeedMediumPool
 0040310F    mov         esi,eax
 00403111    test        eax,eax
>00403113    jne         00403125
 00403115    mov         [0078EA3B],al
 0040311A    mov         byte ptr [ebx],al
 0040311C    pop         edi
 0040311D    pop         esi
 0040311E    pop         ebx
 0040311F    ret
 00403120    and         byte ptr [edi+esi-4],0F7
 00403125    lea         ecx,[edi+6]
 00403128    mov         dword ptr [esi-4],ecx
 0040312B    xor         eax,eax
 0040312D    mov         [0078EA3B],al
 00403132    mov         dword ptr [esi],ebx
 00403134    mov         dword ptr [esi+8],eax
 00403137    mov         dword ptr [esi+0C],1
 0040313E    mov         dword ptr [ebx+10],esi
 00403141    lea         eax,[esi+20]
 00403144    movzx       ecx,word ptr [ebx+2]
 00403148    lea         edx,[ecx+eax]
 0040314B    mov         dword ptr [ebx+8],edx
 0040314E    add         edi,esi
 00403150    sub         edi,ecx
 00403152    mov         dword ptr [ebx+0C],edi
 00403155    mov         byte ptr [ebx],0
 00403158    mov         dword ptr [eax-4],esi
 0040315B    pop         edi
 0040315C    pop         esi
 0040315D    pop         ebx
 0040315E    ret
 0040315F    nop
 00403160    mov         eax,100
 00403165    lock cmpxchgbyte ptr ds:[78EA3B],ah
>0040316D    je          004031BA
 0040316F    rep nop
 00403171    cmp         byte ptr ds:[78E8DD],0
>00403178    jne         00403160
 0040317A    push        0
 0040317C    call        kernel32.Sleep
 00403181    mov         eax,100
 00403186    lock cmpxchgbyte ptr ds:[78EA3B],ah
>0040318E    je          004031BA
 00403190    push        0A
 00403192    call        kernel32.Sleep
>00403197    jmp         00403160
 00403199    nop
 0040319A    nop
 0040319B    nop
 0040319C    cmp         eax,40A2C
>004031A1    ja          004032B4
 004031A7    lea         ebx,[eax+0D3]
 004031AD    and         ebx,0FFFFFF00
 004031B3    add         ebx,30
 004031B6    test        cl,cl
>004031B8    jne         00403160
 004031BA    lea         edx,[ebx-0B30]
 004031C0    mov         ecx,edx
 004031C2    shr         edx,0D
 004031C5    shr         ecx,8
 004031C8    mov         eax,0FFFFFFFF
 004031CD    shl         eax,cl
 004031CF    and         eax,dword ptr [edx*4+78EA48]
>004031D6    je          004031E4
 004031D8    and         ecx,0FFFFFFE0
 004031DB    bsf         eax,eax
 004031DE    or          ecx,eax
>004031E0    jmp         00403240
 004031E2    nop
 004031E3    nop
 004031E4    mov         eax,0FFFFFFFE
 004031E9    mov         ecx,edx
 004031EB    shl         eax,cl
 004031ED    and         eax,dword ptr ds:[78EA44]
>004031F3    je          0040320C
 004031F5    bsf         edx,eax
 004031F8    mov         eax,dword ptr [edx*4+78EA48]
 004031FF    bsf         ecx,eax
 00403202    mov         eax,edx
 00403204    shl         eax,5
 00403207    or          ecx,eax
>00403209    jmp         00403240
 0040320B    nop
 0040320C    mov         ecx,dword ptr ds:[78EA40]
 00403212    sub         ecx,ebx
>00403214    jb          00403230
 00403216    mov         eax,[0078EA3C]
 0040321B    sub         eax,ebx
 0040321D    mov         [0078EA3C],eax
 00403222    mov         dword ptr ds:[78EA40],ecx
 00403228    or          ebx,2
 0040322B    mov         dword ptr [eax-4],ebx
>0040322E    jmp         00403237
 00403230    mov         eax,ebx
 00403232    call        AllocNewSequentialFeedMediumPool
 00403237    mov         byte ptr ds:[78EA3B],0
 0040323E    pop         ebx
 0040323F    ret
 00403240    push        esi
 00403241    push        edi
 00403242    lea         edi,[ecx*8+78EAC8]
 00403249    mov         esi,dword ptr [edi+4]
 0040324C    mov         eax,dword ptr [esi+4]
 0040324F    mov         dword ptr [edi+4],eax
 00403252    mov         dword ptr [eax],edi
 00403254    cmp         edi,eax
>00403256    jne         0040326F
 00403258    mov         eax,0FFFFFFFE
 0040325D    rol         eax,cl
 0040325F    and         dword ptr [edx*4+78EA48],eax
>00403266    jne         0040326F
 00403268    btr         dword ptr ds:[78EA44],edx
 0040326F    mov         edi,0FFFFFFF0
 00403274    and         edi,dword ptr [esi-4]
 00403277    mov         edx,edi
 00403279    sub         edx,ebx
>0040327B    je          0040329C
 0040327D    lea         eax,[ebx+esi]
 00403280    lea         ecx,[edx+3]
 00403283    mov         dword ptr [eax-4],ecx
 00403286    mov         dword ptr [edx+eax-8],edx
 0040328A    cmp         edx,0B30
>00403290    jb          004032A1
 00403292    call        InsertMediumBlockIntoBin
>00403297    jmp         004032A1
 00403299    nop
 0040329A    nop
 0040329B    nop
 0040329C    and         byte ptr [edi+esi-4],0F7
 004032A1    lea         ecx,[ebx+2]
 004032A4    mov         dword ptr [esi-4],ecx
 004032A7    mov         byte ptr ds:[78EA3B],0
 004032AE    mov         eax,esi
 004032B0    pop         edi
 004032B1    pop         esi
 004032B2    pop         ebx
 004032B3    ret
 004032B4    pop         ebx
 004032B5    test        eax,eax
>004032B7    jns         00402CE8
 004032BD    xor         eax,eax
 004032BF    ret
*}
end;

//004032C0
function SysFreeMem(P:Pointer):Integer;
begin
{*
 004032C0    mov         edx,dword ptr [eax-4]
 004032C3    test        dl,7
 004032C6    mov         ecx,eax
 004032C8    push        ebx
 004032C9    mov         bl,byte ptr ds:[78E055]
>004032CF    jne         004033B8
 004032D5    test        bl,bl
 004032D7    mov         ebx,dword ptr [edx]
>004032D9    jne         0040333C
 004032DB    sub         dword ptr [edx+0C],1
 004032DF    mov         eax,dword ptr [edx+8]
>004032E2    je          00403310
 004032E4    test        eax,eax
 004032E6    mov         dword ptr [edx+8],ecx
 004032E9    lea         eax,[eax+1]
 004032EC    mov         dword ptr [ecx-4],eax
>004032EF    je          004032F8
 004032F1    xor         eax,eax
 004032F3    mov         byte ptr [ebx],al
 004032F5    pop         ebx
 004032F6    ret
 004032F7    nop
 004032F8    mov         ecx,dword ptr [ebx+4]
 004032FB    mov         dword ptr [edx+14],ebx
 004032FE    mov         dword ptr [edx+4],ecx
 00403301    mov         dword ptr [ecx+14],edx
 00403304    mov         dword ptr [ebx+4],edx
 00403307    mov         byte ptr [ebx],0
 0040330A    xor         eax,eax
 0040330C    pop         ebx
 0040330D    ret
 0040330E    nop
 0040330F    nop
 00403310    test        eax,eax
>00403312    je          00403327
 00403314    mov         eax,dword ptr [edx+14]
 00403317    mov         ecx,dword ptr [edx+4]
 0040331A    mov         dword ptr [eax+4],ecx
 0040331D    mov         dword ptr [ecx+14],eax
 00403320    xor         eax,eax
 00403322    cmp         dword ptr [ebx+10],edx
>00403325    jne         0040332A
 00403327    mov         dword ptr [ebx+0C],eax
 0040332A    mov         byte ptr [ebx],al
 0040332C    mov         eax,edx
 0040332E    mov         edx,dword ptr [edx-4]
 00403331    mov         bl,byte ptr ds:[78E055]
>00403337    jmp         004033C1
 0040333C    mov         eax,100
 00403341    lock cmpxchgbyte ptr [ebx],ah
>00403345    je          004032DB
 00403347    rep nop
 00403349    cmp         byte ptr ds:[78E8DD],0
>00403350    jne         0040333C
 00403352    push        ecx
 00403353    push        edx
 00403354    push        0
 00403356    call        kernel32.Sleep
 0040335B    pop         edx
 0040335C    pop         ecx
 0040335D    mov         eax,100
 00403362    lock cmpxchgbyte ptr [ebx],ah
>00403366    je          004032DB
 0040336C    push        ecx
 0040336D    push        edx
 0040336E    push        0A
 00403370    call        kernel32.Sleep
 00403375    pop         edx
 00403376    pop         ecx
>00403377    jmp         0040333C
 00403379    nop
 0040337A    nop
 0040337B    nop
 0040337C    mov         eax,100
 00403381    lock cmpxchgbyte ptr ds:[78EA3B],ah
>00403389    je          004033CD
 0040338B    rep nop
 0040338D    cmp         byte ptr ds:[78E8DD],0
>00403394    jne         0040337C
 00403396    push        0
 00403398    call        kernel32.Sleep
 0040339D    mov         eax,100
 004033A2    lock cmpxchgbyte ptr ds:[78EA3B],ah
>004033AA    je          004033CD
 004033AC    push        0A
 004033AE    call        kernel32.Sleep
>004033B3    jmp         0040337C
 004033B5    nop
 004033B6    nop
 004033B7    nop
 004033B8    test        dl,5
>004033BB    jne         004034A8
 004033C1    and         edx,0FFFFFFF0
 004033C4    test        bl,bl
 004033C6    mov         ebx,edx
 004033C8    push        esi
 004033C9    mov         esi,eax
>004033CB    jne         0040337C
 004033CD    test        dword ptr [ebx+esi-4],1
 004033D5    mov         ecx,dword ptr [ebx+esi-4]
>004033D9    jne         00403410
 004033DB    or          ecx,8
 004033DE    mov         dword ptr [ebx+esi-4],ecx
 004033E2    test        byte ptr [esi-4],8
>004033E6    jne         00403428
 004033E8    cmp         ebx,13FFE0
>004033EE    je          00403440
 004033F0    lea         eax,[ebx+3]
 004033F3    mov         dword ptr [esi-4],eax
 004033F6    mov         dword ptr [ebx+esi-8],ebx
 004033FA    mov         eax,esi
 004033FC    mov         edx,ebx
 004033FE    call        InsertMediumBlockIntoBin
 00403403    mov         byte ptr ds:[78EA3B],0
 0040340A    xor         eax,eax
 0040340C    pop         esi
 0040340D    pop         ebx
 0040340E    ret
 0040340F    nop
 00403410    lea         eax,[ebx+esi]
 00403413    and         ecx,0FFFFFFF0
 00403416    add         ebx,ecx
 00403418    cmp         ecx,0B30
>0040341E    jb          004033E2
 00403420    call        RemoveMediumFreeBlock
>00403425    jmp         004033E2
 00403427    nop
 00403428    mov         ecx,dword ptr [esi-8]
 0040342B    sub         esi,ecx
 0040342D    add         ebx,ecx
 0040342F    cmp         ecx,0B30
>00403435    jb          004033E8
 00403437    mov         eax,esi
 00403439    call        RemoveMediumFreeBlock
>0040343E    jmp         004033E8
 00403440    cmp         dword ptr ds:[78EA40],13FFE0
>0040344A    jne         00403478
 0040344C    sub         esi,10
 0040344F    mov         eax,dword ptr [esi]
 00403451    mov         edx,dword ptr [esi+4]
 00403454    mov         dword ptr [eax+4],edx
 00403457    mov         dword ptr [edx],eax
 00403459    mov         byte ptr ds:[78EA3B],0
 00403460    push        8000
 00403465    push        0
 00403467    push        esi
 00403468    call        kernel32.VirtualFree
 0040346D    cmp         eax,1
 00403470    sbb         eax,eax
 00403472    pop         esi
 00403473    pop         ebx
 00403474    ret
 00403475    nop
 00403476    nop
 00403477    nop
 00403478    lea         ebx,[esi+13FFE0]
 0040347E    call        BinMediumSequentialFeedRemainder
 00403483    mov         dword ptr [ebx-4],2
 0040348A    mov         dword ptr ds:[78EA40],13FFE0
 00403494    mov         dword ptr ds:[78EA3C],ebx
 0040349A    mov         byte ptr ds:[78EA3B],0
 004034A1    xor         eax,eax
 004034A3    pop         esi
 004034A4    pop         ebx
 004034A5    ret
 004034A6    nop
 004034A7    nop
 004034A8    pop         ebx
 004034A9    test        dl,3
>004034AC    je          00402D4C
 004034B2    mov         eax,0FFFFFFFF
 004034B7    ret
*}
end;

//004034B8
function SysReallocMem(P:Pointer; Size:Integer):Pointer;
begin
{*
 004034B8    mov         ecx,dword ptr [eax-4]
 004034BB    test        cl,7
 004034BE    push        ebx
 004034BF    push        esi
 004034C0    mov         esi,eax
>004034C2    jne         00403550
 004034C8    mov         ebx,dword ptr [ecx]
 004034CA    movzx       ecx,word ptr [ebx+2]
 004034CE    sub         ecx,4
 004034D1    cmp         ecx,edx
>004034D3    jb          0040350C
 004034D5    lea         ebx,[edx*4+40]
 004034DC    cmp         ebx,ecx
>004034DE    jb          004034E4
 004034E0    pop         esi
 004034E1    pop         ebx
 004034E2    ret
 004034E3    nop
 004034E4    mov         ebx,edx
 004034E6    mov         eax,edx
 004034E8    call        SysGetMem
 004034ED    test        eax,eax
>004034EF    je          00403507
 004034F1    mov         ecx,ebx
 004034F3    mov         edx,eax
 004034F5    mov         ebx,eax
 004034F7    mov         eax,esi
 004034F9    call        MoveX8L4
 004034FE    mov         eax,esi
 00403500    call        SysFreeMem
 00403505    mov         eax,ebx
 00403507    pop         esi
 00403508    pop         ebx
 00403509    ret
 0040350A    nop
 0040350B    nop
 0040350C    lea         ecx,[ecx+ecx+20]
 00403510    push        edi
 00403511    mov         edi,edx
 00403513    xor         eax,eax
 00403515    sub         ecx,edx
 00403517    adc         eax,0FFFFFFFF
 0040351A    and         eax,ecx
 0040351C    add         eax,edx
 0040351E    call        SysGetMem
 00403523    test        eax,eax
>00403525    je          0040354B
 00403527    cmp         edi,40A2C
>0040352D    jbe         00403532
 0040352F    mov         dword ptr [eax-8],edi
 00403532    movzx       ecx,word ptr [ebx+2]
 00403536    sub         ecx,4
 00403539    mov         edx,eax
 0040353B    mov         edi,eax
 0040353D    mov         eax,esi
 0040353F    call        dword ptr [ebx+1C]
 00403542    mov         eax,esi
 00403544    call        SysFreeMem
 00403549    mov         eax,edi
 0040354B    pop         edi
 0040354C    pop         esi
 0040354D    pop         ebx
 0040354E    ret
 0040354F    nop
 00403550    test        cl,5
>00403553    jne         004037C0
 00403559    mov         ebx,ecx
 0040355B    and         ecx,0FFFFFFF0
 0040355E    push        edi
 0040355F    lea         edi,[ecx+eax]
 00403562    sub         ecx,4
 00403565    and         ebx,0F
 00403568    cmp         edx,ecx
 0040356A    push        ebp
>0040356B    ja          00403680
 00403571    lea         ebp,[edx+edx]
 00403574    cmp         ebp,ecx
>00403576    jb          00403580
 00403578    pop         ebp
 00403579    pop         edi
 0040357A    pop         esi
 0040357B    pop         ebx
 0040357C    ret
 0040357D    nop
 0040357E    nop
 0040357F    nop
 00403580    cmp         edx,0B2C
>00403586    jae         0040359D
 00403588    cmp         edx,2CC
>0040358E    jb          00403658
 00403594    mov         edx,0B2C
 00403599    cmp         ecx,edx
>0040359B    jbe         00403578
 0040359D    lea         ebp,[edx+0D3]
 004035A3    and         ebp,0FFFFFF00
 004035A9    add         ebp,30
 004035AC    add         ecx,4
 004035AF    sub         ecx,ebp
 004035B1    cmp         byte ptr ds:[78E055],0
>004035B8    je          00403600
 004035BA    mov         eax,100
 004035BF    lock cmpxchgbyte ptr ds:[78EA3B],ah
>004035C7    je          004035F8
 004035C9    rep nop
 004035CB    cmp         byte ptr ds:[78E8DD],0
>004035D2    jne         004035BA
 004035D4    push        ecx
 004035D5    push        0
 004035D7    call        kernel32.Sleep
 004035DC    pop         ecx
 004035DD    mov         eax,100
 004035E2    lock cmpxchgbyte ptr ds:[78EA3B],ah
>004035EA    je          004035F8
 004035EC    push        ecx
 004035ED    push        0A
 004035EF    call        kernel32.Sleep
 004035F4    pop         ecx
>004035F5    jmp         004035BA
 004035F7    nop
 004035F8    mov         ebx,0F
 004035FD    and         ebx,dword ptr [esi-4]
 00403600    or          ebx,ebp
 00403602    mov         dword ptr [esi-4],ebx
 00403605    mov         ebx,ecx
 00403607    mov         edx,dword ptr [edi-4]
 0040360A    test        dl,1
>0040360D    jne         00403618
 0040360F    or          edx,8
 00403612    mov         dword ptr [edi-4],edx
>00403615    jmp         0040362E
 00403617    nop
 00403618    mov         eax,edi
 0040361A    and         edx,0FFFFFFF0
 0040361D    add         ebx,edx
 0040361F    add         edi,edx
 00403621    cmp         edx,0B30
>00403627    jb          0040362E
 00403629    call        RemoveMediumFreeBlock
 0040362E    mov         dword ptr [edi-8],ebx
 00403631    lea         eax,[ebx+3]
 00403634    mov         dword ptr [esi+ebp-4],eax
 00403638    cmp         ebx,0B30
>0040363E    jb          0040364A
 00403640    lea         eax,[esi+ebp]
 00403643    mov         edx,ebx
 00403645    call        InsertMediumBlockIntoBin
 0040364A    mov         byte ptr ds:[78EA3B],0
 00403651    mov         eax,esi
 00403653    pop         ebp
 00403654    pop         edi
 00403655    pop         esi
 00403656    pop         ebx
 00403657    ret
 00403658    mov         edi,edx
 0040365A    mov         eax,edx
 0040365C    call        SysGetMem
 00403661    test        eax,eax
>00403663    je          0040367B
 00403665    mov         ebp,eax
 00403667    mov         edx,eax
 00403669    mov         eax,esi
 0040366B    mov         ecx,edi
 0040366D    call        MoveX8L4
 00403672    mov         eax,esi
 00403674    call        SysFreeMem
 00403679    mov         eax,ebp
 0040367B    pop         ebp
 0040367C    pop         edi
 0040367D    pop         esi
 0040367E    pop         ebx
 0040367F    ret
 00403680    mov         eax,dword ptr [edi-4]
 00403683    test        al,1
>00403685    je          00403778
 0040368B    and         eax,0FFFFFFF0
 0040368E    lea         ebp,[ecx+eax]
 00403691    cmp         edx,ebp
>00403693    ja          00403778
 00403699    cmp         byte ptr ds:[78E055],0
>004036A0    je          004036FD
 004036A2    mov         eax,100
 004036A7    lock cmpxchgbyte ptr ds:[78EA3B],ah
>004036AF    je          004036E4
 004036B1    rep nop
 004036B3    cmp         byte ptr ds:[78E8DD],0
>004036BA    jne         004036A2
 004036BC    push        ecx
 004036BD    push        edx
 004036BE    push        0
 004036C0    call        kernel32.Sleep
 004036C5    pop         edx
 004036C6    pop         ecx
 004036C7    mov         eax,100
 004036CC    lock cmpxchgbyte ptr ds:[78EA3B],ah
>004036D4    je          004036E4
 004036D6    push        ecx
 004036D7    push        edx
 004036D8    push        0A
 004036DA    call        kernel32.Sleep
 004036DF    pop         edx
 004036E0    pop         ecx
>004036E1    jmp         004036A2
 004036E3    nop
 004036E4    mov         ebx,0F
 004036E9    and         ebx,dword ptr [esi-4]
 004036EC    mov         eax,dword ptr [edi-4]
 004036EF    test        al,1
>004036F1    je          00403771
 004036F3    and         eax,0FFFFFFF0
 004036F6    lea         ebp,[ecx+eax]
 004036F9    cmp         edx,ebp
>004036FB    ja          00403771
 004036FD    cmp         eax,0B30
>00403702    jb          0040370F
 00403704    mov         eax,edi
 00403706    push        ecx
 00403707    push        edx
 00403708    call        RemoveMediumFreeBlock
 0040370D    pop         edx
 0040370E    pop         ecx
 0040370F    mov         eax,ecx
 00403711    shr         eax,2
 00403714    add         eax,ecx
 00403716    xor         edi,edi
 00403718    sub         eax,edx
 0040371A    adc         edi,0FFFFFFFF
 0040371D    and         eax,edi
 0040371F    lea         eax,[edx+eax+0D3]
 00403726    and         eax,0FFFFFF00
 0040372B    add         eax,30
 0040372E    lea         edx,[ebp+4]
 00403731    sub         edx,eax
>00403733    ja          00403740
 00403735    and         dword ptr [esi+ebp],0FFFFFFF7
 00403739    add         ebp,4
>0040373C    jmp         0040375C
 0040373E    nop
 0040373F    nop
 00403740    mov         dword ptr [esi+ebp-4],edx
 00403744    lea         edi,[edx+3]
 00403747    mov         dword ptr [eax+esi-4],edi
 0040374B    mov         ebp,eax
 0040374D    cmp         edx,0B30
>00403753    jb          0040375C
 00403755    add         eax,esi
 00403757    call        InsertMediumBlockIntoBin
 0040375C    or          ebp,ebx
 0040375E    mov         dword ptr [esi-4],ebp
 00403761    mov         byte ptr ds:[78EA3B],0
 00403768    mov         eax,esi
 0040376A    pop         ebp
 0040376B    pop         edi
 0040376C    pop         esi
 0040376D    pop         ebx
 0040376E    ret
 0040376F    nop
 00403770    nop
 00403771    mov         byte ptr ds:[78EA3B],0
 00403778    mov         eax,ecx
 0040377A    shr         eax,2
 0040377D    add         eax,ecx
 0040377F    xor         edi,edi
 00403781    sub         eax,edx
 00403783    adc         edi,0FFFFFFFF
 00403786    and         eax,edi
 00403788    add         eax,edx
 0040378A    mov         ebp,eax
 0040378C    mov         edi,ecx
 0040378E    push        edx
 0040378F    call        SysGetMem
 00403794    pop         edx
 00403795    test        eax,eax
>00403797    je          0040376A
 00403799    cmp         ebp,40A2C
>0040379F    jbe         004037A4
 004037A1    mov         dword ptr [eax-8],edx
 004037A4    mov         ebp,eax
 004037A6    mov         edx,eax
 004037A8    mov         eax,esi
 004037AA    mov         ecx,edi
 004037AC    call        MoveX16L4
 004037B1    mov         eax,esi
 004037B3    call        SysFreeMem
 004037B8    mov         eax,ebp
 004037BA    pop         ebp
 004037BB    pop         edi
 004037BC    pop         esi
 004037BD    pop         ebx
 004037BE    ret
 004037BF    nop
 004037C0    pop         esi
 004037C1    pop         ebx
 004037C2    test        cl,3
>004037C5    je          00402DF0
 004037CB    xor         eax,eax
 004037CD    ret
*}
end;

//004037D0
function SysAllocMem(Size:Cardinal):Pointer;
begin
{*
 004037D0    push        ebx
 004037D1    lea         ebx,[eax-1]
 004037D4    and         ebx,0FFFFFFFC
 004037D7    call        SysGetMem
 004037DC    cmp         eax,1
 004037DF    sbb         ecx,ecx
 004037E1    lea         edx,[ebx+eax]
 004037E4    or          ebx,ecx
 004037E6    cmp         ebx,40A2C
>004037EC    jae         00403800
 004037EE    neg         ebx
 004037F0    fldz
 004037F2    fst         qword ptr [ebx+edx]
 004037F5    add         ebx,8
>004037F8    js          004037F2
 004037FA    mov         dword ptr [edx],ecx
 004037FC    ffree       st(0)
 004037FE    fincstp
 00403800    pop         ebx
 00403801    ret
*}
end;

//00403804
function NextMediumBlock(APMediumBlock:Pointer):Pointer;
begin
{*
 00403804    mov         ecx,eax
 00403806    mov         edx,ecx
 00403808    sub         edx,4
 0040380B    mov         edx,dword ptr [edx]
 0040380D    and         edx,0FFFFFFF0
 00403810    add         edx,ecx
 00403812    mov         eax,edx
 00403814    mov         edx,eax
 00403816    sub         edx,4
 00403819    mov         edx,dword ptr [edx]
 0040381B    and         edx,0FFFFFFF0
 0040381E    test        edx,edx
>00403820    jne         00403824
 00403822    xor         eax,eax
 00403824    ret
*}
end;

//00403828
function GetFirstMediumBlockInPool(APMediumBlockPoolHeader:PMediumBlockPoolHeader):Pointer;
begin
{*
 00403828    cmp         dword ptr ds:[78EA40],0
>0040382F    je          0040384B
 00403831    mov         edx,dword ptr ds:[78EA3C]
 00403837    cmp         edx,eax
>00403839    jb          0040384B
 0040383B    mov         edx,eax
 0040383D    add         edx,13FFF0
 00403843    cmp         edx,dword ptr ds:[78EA3C]
>00403849    jae         0040384F
 0040384B    add         eax,10
 0040384E    ret
 0040384F    cmp         dword ptr ds:[78EA40],13FFE0
>00403859    je          00403862
 0040385B    mov         eax,[0078EA3C]
>00403860    jmp         00403864
 00403862    xor         eax,eax
 00403864    ret
*}
end;

//00403868
procedure GetFirstAndLastSmallBlockInPool(APSmallBlockPool:PSmallBlockPoolHeader; var AFirstPtr:Pointer; var ALastPtr:Pointer);
begin
{*
 00403868    push        ebx
 00403869    mov         ebx,eax
 0040386B    add         ebx,20
 0040386E    mov         dword ptr [edx],ebx
 00403870    mov         edx,dword ptr [eax]
 00403872    cmp         eax,dword ptr [edx+10]
>00403875    jne         0040387F
 00403877    mov         ebx,dword ptr [edx+8]
 0040387A    cmp         ebx,dword ptr [edx+0C]
>0040387D    jbe         00403895
 0040387F    mov         ebx,eax
 00403881    sub         ebx,4
 00403884    mov         ebx,dword ptr [ebx]
 00403886    and         ebx,0FFFFFFF0
 00403889    add         ebx,eax
 0040388B    movzx       eax,word ptr [edx+2]
 0040388F    sub         ebx,eax
 00403891    mov         dword ptr [ecx],ebx
 00403893    pop         ebx
 00403894    ret
 00403895    mov         eax,dword ptr [edx+8]
 00403898    dec         eax
 00403899    mov         dword ptr [ecx],eax
 0040389B    pop         ebx
 0040389C    ret
*}
end;

//004038A0
function CardinalToStrBuf(ACardinal:Cardinal; ABuffer:PAnsiChar):PAnsiChar;
begin
{*
 004038A0    push        edi
 004038A1    mov         edi,edx
 004038A3    add         eax,1
 004038A6    mov         edx,89705F41
 004038AB    mul         eax,edx
 004038AD    shr         eax,1E
 004038B0    mov         ecx,edx
 004038B2    and         edx,1FFFFFFF
 004038B8    shr         ecx,1D
 004038BB    lea         edx,[edx+edx*4]
 004038BE    add         edx,eax
 004038C0    mov         eax,ecx
 004038C2    or          eax,30
 004038C5    mov         byte ptr [edi],al
 004038C7    mov         eax,edx
 004038C9    cmp         ecx,1
 004038CC    sbb         edi,0FFFFFFFF
 004038CF    shr         eax,1C
 004038D2    and         edx,0FFFFFFF
 004038D8    or          ecx,eax
 004038DA    or          eax,30
 004038DD    mov         byte ptr [edi],al
 004038DF    lea         eax,[edx+edx*4]
 004038E2    lea         edx,[edx+edx*4]
 004038E5    cmp         ecx,1
 004038E8    sbb         edi,0FFFFFFFF
 004038EB    shr         eax,1B
 004038EE    and         edx,7FFFFFF
 004038F4    or          ecx,eax
 004038F6    or          eax,30
 004038F9    mov         byte ptr [edi],al
 004038FB    lea         eax,[edx+edx*4]
 004038FE    lea         edx,[edx+edx*4]
 00403901    cmp         ecx,1
 00403904    sbb         edi,0FFFFFFFF
 00403907    shr         eax,1A
 0040390A    and         edx,3FFFFFF
 00403910    or          ecx,eax
 00403912    or          eax,30
 00403915    mov         byte ptr [edi],al
 00403917    lea         eax,[edx+edx*4]
 0040391A    lea         edx,[edx+edx*4]
 0040391D    cmp         ecx,1
 00403920    sbb         edi,0FFFFFFFF
 00403923    shr         eax,19
 00403926    and         edx,1FFFFFF
 0040392C    or          ecx,eax
 0040392E    or          eax,30
 00403931    mov         byte ptr [edi],al
 00403933    lea         eax,[edx+edx*4]
 00403936    lea         edx,[edx+edx*4]
 00403939    cmp         ecx,1
 0040393C    sbb         edi,0FFFFFFFF
 0040393F    shr         eax,18
 00403942    and         edx,0FFFFFF
 00403948    or          ecx,eax
 0040394A    or          eax,30
 0040394D    mov         byte ptr [edi],al
 0040394F    lea         eax,[edx+edx*4]
 00403952    lea         edx,[edx+edx*4]
 00403955    cmp         ecx,1
 00403958    sbb         edi,0FFFFFFFF
 0040395B    shr         eax,17
 0040395E    and         edx,7FFFFF
 00403964    or          ecx,eax
 00403966    or          eax,30
 00403969    mov         byte ptr [edi],al
 0040396B    lea         eax,[edx+edx*4]
 0040396E    lea         edx,[edx+edx*4]
 00403971    cmp         ecx,1
 00403974    sbb         edi,0FFFFFFFF
 00403977    shr         eax,16
 0040397A    and         edx,3FFFFF
 00403980    or          ecx,eax
 00403982    or          eax,30
 00403985    mov         byte ptr [edi],al
 00403987    lea         eax,[edx+edx*4]
 0040398A    lea         edx,[edx+edx*4]
 0040398D    cmp         ecx,1
 00403990    sbb         edi,0FFFFFFFF
 00403993    shr         eax,15
 00403996    and         edx,1FFFFF
 0040399C    or          ecx,eax
 0040399E    or          eax,30
 004039A1    mov         byte ptr [edi],al
 004039A3    lea         eax,[edx+edx*4]
 004039A6    cmp         ecx,1
 004039A9    sbb         edi,0FFFFFFFF
 004039AC    shr         eax,14
 004039AF    or          eax,30
 004039B2    mov         byte ptr [edi],al
 004039B4    lea         eax,[edi+1]
 004039B7    pop         edi
 004039B8    ret
*}
end;

//004039BC
function AppendStringToBuffer(const ASource:PAnsiChar; const ADestination:PAnsiChar; ACount:Cardinal):PAnsiChar;
begin
{*
 004039BC    push        ebx
 004039BD    push        esi
 004039BE    mov         esi,ecx
 004039C0    mov         ebx,edx
 004039C2    mov         edx,ebx
 004039C4    mov         ecx,esi
 004039C6    call        Move
 004039CB    mov         eax,ebx
 004039CD    add         eax,esi
 004039CF    pop         esi
 004039D0    pop         ebx
 004039D1    ret
*}
end;

//004039D4
function AppendClassNameToBuffer(AClass:TClass; ADestination:PAnsiChar):PAnsiChar;
begin
{*
 004039D4    push        ebx
 004039D5    mov         ebx,edx
 004039D7    test        eax,eax
>004039D9    je          004039ED
 004039DB    add         eax,0FFFFFFC8
 004039DE    mov         eax,dword ptr [eax]
 004039E0    movzx       ecx,byte ptr [eax]
 004039E3    inc         eax
 004039E4    mov         edx,ebx
 004039E6    call        AppendStringToBuffer
 004039EB    pop         ebx
 004039EC    ret
 004039ED    mov         eax,[00784064]
 004039F2    call        @PCharLen
 004039F7    mov         ecx,eax
 004039F9    mov         edx,ebx
 004039FB    mov         eax,[00784064]
 00403A00    call        AppendStringToBuffer
 00403A05    pop         ebx
 00403A06    ret
*}
end;

//00403A08
function IsValidVMTAddress(APAddress:PCardinal):Boolean;
begin
{*
 00403A08    push        ebp
 00403A09    mov         ebp,esp
 00403A0B    push        ebx
 00403A0C    mov         edx,eax
 00403A0E    cmp         edx,0FFFF
>00403A14    jbe         00403A7E
 00403A16    test        dl,3
>00403A19    jne         00403A7E
 00403A1B    mov         edx,dword ptr [ebp+8]
 00403A1E    mov         edx,dword ptr [edx-1C]
 00403A21    mov         ecx,eax
 00403A23    cmp         edx,ecx
>00403A25    ja          00403A37
 00403A27    mov         ebx,dword ptr [ebp+8]
 00403A2A    mov         ebx,dword ptr [ebp+8]
 00403A2D    add         edx,dword ptr [ebx-10]
 00403A30    add         ecx,4
 00403A33    cmp         edx,ecx
>00403A35    jae         00403A4E
 00403A37    mov         edx,dword ptr [ebp+8]
 00403A3A    xor         ecx,ecx
 00403A3C    mov         dword ptr [edx-10],ecx
 00403A3F    push        1C
 00403A41    mov         edx,dword ptr [ebp+8]
 00403A44    add         edx,0FFFFFFE4
 00403A47    push        edx
 00403A48    push        eax
 00403A49    call        kernel32.VirtualQuery
 00403A4E    mov         eax,dword ptr [ebp+8]
 00403A51    cmp         dword ptr [eax-10],4
>00403A55    jb          00403A75
 00403A57    mov         eax,dword ptr [ebp+8]
 00403A5A    cmp         dword ptr [eax-0C],1000
>00403A61    jne         00403A75
 00403A63    mov         eax,dword ptr [ebp+8]
 00403A66    test        byte ptr [eax-8],0F6
>00403A6A    je          00403A75
 00403A6C    mov         eax,dword ptr [ebp+8]
 00403A6F    test        byte ptr [eax-7],1
>00403A73    je          00403A79
 00403A75    xor         eax,eax
>00403A77    jmp         00403A80
 00403A79    mov         al,1
 00403A7B    pop         ebx
 00403A7C    pop         ebp
 00403A7D    ret
 00403A7E    xor         eax,eax
 00403A80    pop         ebx
 00403A81    pop         ebp
 00403A82    ret
*}
end;

//00403A84
function InternalIsValidClass(AClassPointer:Pointer; ADepth:Integer):Boolean;
begin
{*
 00403A84    push        ebp
 00403A85    mov         ebp,esp
 00403A87    push        ebx
 00403A88    push        esi
 00403A89    push        edi
 00403A8A    mov         edi,edx
 00403A8C    mov         ebx,eax
 00403A8E    cmp         edi,3E8
>00403A94    jge         00403AFB
 00403A96    mov         eax,dword ptr [ebp+8]
 00403A99    push        eax
 00403A9A    mov         eax,ebx
 00403A9C    add         eax,0FFFFFFA8
 00403A9F    call        IsValidVMTAddress
 00403AA4    pop         ecx
 00403AA5    test        al,al
>00403AA7    je          00403AFB
 00403AA9    mov         eax,dword ptr [ebp+8]
 00403AAC    push        eax
 00403AAD    mov         eax,ebx
 00403AAF    add         eax,0FFFFFFD0
 00403AB2    call        IsValidVMTAddress
 00403AB7    pop         ecx
 00403AB8    test        al,al
>00403ABA    je          00403AFB
 00403ABC    mov         eax,ebx
 00403ABE    add         eax,0FFFFFFD0
 00403AC1    mov         esi,dword ptr [eax]
 00403AC3    mov         eax,ebx
 00403AC5    add         eax,0FFFFFFA8
 00403AC8    cmp         ebx,dword ptr [eax]
>00403ACA    jne         00403AF3
 00403ACC    test        esi,esi
>00403ACE    je          00403AF7
 00403AD0    mov         eax,dword ptr [ebp+8]
 00403AD3    push        eax
 00403AD4    mov         eax,esi
 00403AD6    call        IsValidVMTAddress
 00403ADB    pop         ecx
 00403ADC    test        al,al
>00403ADE    je          00403AF3
 00403AE0    mov         eax,dword ptr [ebp+8]
 00403AE3    push        eax
 00403AE4    lea         edx,[edi+1]
 00403AE7    mov         eax,dword ptr [esi]
 00403AE9    call        InternalIsValidClass
 00403AEE    pop         ecx
 00403AEF    test        al,al
>00403AF1    jne         00403AF7
 00403AF3    xor         eax,eax
>00403AF5    jmp         00403AFD
 00403AF7    mov         al,1
>00403AF9    jmp         00403AFD
 00403AFB    xor         eax,eax
 00403AFD    pop         edi
 00403AFE    pop         esi
 00403AFF    pop         ebx
 00403B00    pop         ebp
 00403B01    ret
*}
end;

//00403B04
function GetObjectClass(APointer:Pointer):TClass;
begin
{*
 00403B04    push        ebp
 00403B05    mov         ebp,esp
 00403B07    add         esp,0FFFFFFE4
 00403B0A    push        ebx
 00403B0B    mov         ebx,dword ptr [eax]
 00403B0D    xor         eax,eax
 00403B0F    mov         dword ptr [ebp-10],eax
 00403B12    push        ebp
 00403B13    xor         edx,edx
 00403B15    mov         eax,ebx
 00403B17    call        InternalIsValidClass
 00403B1C    pop         ecx
 00403B1D    test        al,al
>00403B1F    jne         00403B23
 00403B21    xor         ebx,ebx
 00403B23    mov         eax,ebx
 00403B25    pop         ebx
 00403B26    mov         esp,ebp
 00403B28    pop         ebp
 00403B29    ret
*}
end;

//00403B2C
function LockExpectedMemoryLeaksList:Boolean;
begin
{*
 00403B2C    cmp         byte ptr ds:[78E055],0
>00403B33    je          00403B72
>00403B35    jmp         00403B60
 00403B37    cmp         byte ptr ds:[78E8DD],0
>00403B3E    jne         00403B60
 00403B40    push        0
 00403B42    call        kernel32.Sleep
 00403B47    mov         ecx,790AE0
 00403B4C    mov         dl,1
 00403B4E    xor         eax,eax
 00403B50    call        LockCmpxchg
 00403B55    test        al,al
>00403B57    je          00403B72
 00403B59    push        0A
 00403B5B    call        kernel32.Sleep
 00403B60    mov         ecx,790AE0
 00403B65    mov         dl,1
 00403B67    xor         eax,eax
 00403B69    call        LockCmpxchg
 00403B6E    test        al,al
>00403B70    jne         00403B37
 00403B72    cmp         dword ptr ds:[790ADC],0
>00403B79    jne         00403B93
 00403B7B    push        4
 00403B7D    push        1000
 00403B82    push        10000
 00403B87    push        0
 00403B89    call        kernel32.VirtualAlloc
 00403B8E    mov         [00790ADC],eax
 00403B93    cmp         dword ptr ds:[790ADC],0
 00403B9A    setne       al
 00403B9D    ret
*}
end;

//00403BA0
function SysRegisterExpectedMemoryLeak(P:Pointer):Boolean;
begin
{*
 00403BA0    push        ebx
 00403BA1    mov         ebx,eax
 00403BA3    call        LockExpectedMemoryLeaksList
 00403BA8    test        al,al
>00403BAA    je          00403BD5
 00403BAC    mov         eax,[00790ADC]
 00403BB1    cmp         dword ptr [eax],3FFE
>00403BB7    jge         00403BD5
 00403BB9    mov         eax,[00790ADC]
 00403BBE    mov         eax,dword ptr [eax]
 00403BC0    mov         edx,dword ptr ds:[790ADC]
 00403BC6    mov         dword ptr [edx+eax*4+4],ebx
 00403BCA    mov         eax,[00790ADC]
 00403BCF    inc         dword ptr [eax]
 00403BD1    mov         al,1
>00403BD3    jmp         00403BD7
 00403BD5    xor         eax,eax
 00403BD7    mov         byte ptr ds:[790AE0],0
 00403BDE    pop         ebx
 00403BDF    ret
*}
end;

//00403BE0
function SysUnregisterExpectedMemoryLeak(P:Pointer):Boolean;
begin
{*
 00403BE0    push        ebx
 00403BE1    push        esi
 00403BE2    push        edi
 00403BE3    mov         esi,eax
 00403BE5    mov         edi,790ADC
 00403BEA    xor         ebx,ebx
 00403BEC    cmp         dword ptr [edi],0
>00403BEF    je          00403C30
 00403BF1    call        LockExpectedMemoryLeaksList
 00403BF6    test        al,al
>00403BF8    je          00403C30
 00403BFA    mov         eax,dword ptr [edi]
 00403BFC    mov         edx,dword ptr [eax]
 00403BFE    dec         edx
 00403BFF    test        edx,edx
>00403C01    jl          00403C29
 00403C03    inc         edx
 00403C04    xor         eax,eax
 00403C06    mov         ecx,dword ptr [edi]
 00403C08    cmp         esi,dword ptr [ecx+eax*4+4]
>00403C0C    jne         00403C25
 00403C0E    mov         edx,dword ptr [edi]
 00403C10    mov         edx,dword ptr [edx]
 00403C12    mov         ecx,dword ptr [edi]
 00403C14    mov         edx,dword ptr [ecx+edx*4]
 00403C17    mov         ecx,dword ptr [edi]
 00403C19    mov         dword ptr [ecx+eax*4+4],edx
 00403C1D    mov         edx,dword ptr [edi]
 00403C1F    dec         dword ptr [edx]
 00403C21    mov         bl,1
>00403C23    jmp         00403C29
 00403C25    inc         eax
 00403C26    dec         edx
>00403C27    jne         00403C06
 00403C29    mov         byte ptr ds:[790AE0],0
 00403C30    mov         eax,ebx
 00403C32    pop         edi
 00403C33    pop         esi
 00403C34    pop         ebx
 00403C35    ret
*}
end;

//00403C38
procedure CheckSmallBlockPoolForLeaks(APSmallBlockPool:PSmallBlockPoolHeader);
begin
{*
 00403C38    push        ebp
 00403C39    mov         ebp,esp
 00403C3B    add         esp,0FFFFFFD0
 00403C3E    push        ebx
 00403C3F    push        esi
 00403C40    push        edi
 00403C41    mov         dword ptr [ebp-4],eax
 00403C44    mov         eax,dword ptr [ebp-4]
 00403C47    mov         eax,dword ptr [eax]
 00403C49    sub         eax,784078
 00403C4F    shr         eax,5
 00403C52    shl         eax,8
 00403C55    mov         edx,dword ptr [ebp+8]
 00403C58    lea         edi,[edx+eax*8-1B800]
 00403C5F    lea         ecx,[ebp-2C]
 00403C62    lea         edx,[ebp-28]
 00403C65    mov         eax,dword ptr [ebp-4]
 00403C68    call        GetFirstAndLastSmallBlockInPool
>00403C6D    jmp         00403DEB
 00403C72    sub         esi,4
 00403C75    test        byte ptr [esi],1
>00403C78    jne         00403DDF
 00403C7E    mov         eax,dword ptr [ebp-28]
 00403C81    call        SysUnregisterExpectedMemoryLeak
 00403C86    test        al,al
>00403C88    jne         00403DDF
 00403C8E    mov         eax,dword ptr [ebp+8]
 00403C91    mov         byte ptr [eax-1B801],0
 00403C98    xor         ebx,ebx
 00403C9A    mov         eax,dword ptr [ebp-28]
 00403C9D    call        GetObjectClass
 00403CA2    mov         dword ptr [ebp-8],eax
 00403CA5    cmp         dword ptr [ebp-8],0
>00403CA9    jne         00403DAD
 00403CAF    mov         eax,dword ptr [ebp-28]
 00403CB2    cmp         dword ptr [eax+4],100
>00403CB9    jge         00403DDB
 00403CBF    mov         eax,dword ptr [ebp-28]
 00403CC2    mov         eax,dword ptr [eax+8]
 00403CC5    mov         dword ptr [ebp-10],eax
 00403CC8    mov         eax,dword ptr [ebp-28]
 00403CCB    movzx       eax,word ptr [eax+2]
 00403CCF    mov         dword ptr [ebp-18],eax
 00403CD2    cmp         dword ptr [ebp-18],1
>00403CD6    je          00403CE2
 00403CD8    cmp         dword ptr [ebp-18],2
>00403CDC    jne         00403DDB
 00403CE2    mov         eax,dword ptr [ebp-10]
 00403CE5    inc         eax
 00403CE6    imul        dword ptr [ebp-18]
 00403CE9    add         eax,0C
 00403CEC    mov         dword ptr [ebp-14],eax
 00403CEF    cmp         dword ptr [ebp-10],0
>00403CF3    jle         00403DDB
 00403CF9    mov         eax,dword ptr [ebp-4]
 00403CFC    mov         eax,dword ptr [eax]
 00403CFE    movzx       eax,word ptr [eax+2]
 00403D02    sub         eax,4
 00403D05    cmp         eax,dword ptr [ebp-14]
>00403D08    jl          00403DDB
 00403D0E    mov         byte ptr [ebp-21],1
 00403D12    cmp         dword ptr [ebp-18],1
>00403D16    jne         00403D63
 00403D18    mov         eax,dword ptr [ebp-28]
 00403D1B    add         eax,0C
 00403D1E    mov         dword ptr [ebp-1C],eax
 00403D21    mov         eax,dword ptr [ebp-10]
 00403D24    test        eax,eax
>00403D26    jle         00403D4A
 00403D28    mov         dword ptr [ebp-30],eax
 00403D2B    cmp         byte ptr [ebp-21],0
>00403D2F    je          00403D39
 00403D31    mov         eax,dword ptr [ebp-1C]
 00403D34    cmp         byte ptr [eax],20
>00403D37    jae         00403D3D
 00403D39    xor         eax,eax
>00403D3B    jmp         00403D3F
 00403D3D    mov         al,1
 00403D3F    mov         byte ptr [ebp-21],al
 00403D42    inc         dword ptr [ebp-1C]
 00403D45    dec         dword ptr [ebp-30]
>00403D48    jne         00403D2B
 00403D4A    cmp         byte ptr [ebp-21],0
>00403D4E    je          00403DDB
 00403D54    mov         eax,dword ptr [ebp-1C]
 00403D57    cmp         byte ptr [eax],0
>00403D5A    jne         00403DDB
 00403D5C    mov         ebx,1
>00403D61    jmp         00403DDB
 00403D63    mov         eax,dword ptr [ebp-28]
 00403D66    add         eax,0C
 00403D69    mov         dword ptr [ebp-20],eax
 00403D6C    mov         eax,dword ptr [ebp-10]
 00403D6F    test        eax,eax
>00403D71    jle         00403D97
 00403D73    mov         dword ptr [ebp-30],eax
 00403D76    cmp         byte ptr [ebp-21],0
>00403D7A    je          00403D85
 00403D7C    mov         eax,dword ptr [ebp-20]
 00403D7F    cmp         word ptr [eax],20
>00403D83    jae         00403D89
 00403D85    xor         eax,eax
>00403D87    jmp         00403D8B
 00403D89    mov         al,1
 00403D8B    mov         byte ptr [ebp-21],al
 00403D8E    add         dword ptr [ebp-20],2
 00403D92    dec         dword ptr [ebp-30]
>00403D95    jne         00403D76
 00403D97    cmp         byte ptr [ebp-21],0
>00403D9B    je          00403DDB
 00403D9D    mov         eax,dword ptr [ebp-20]
 00403DA0    cmp         word ptr [eax],0
>00403DA4    jne         00403DDB
 00403DA6    mov         ebx,2
>00403DAB    jmp         00403DDB
 00403DAD    mov         ebx,3
 00403DB2    mov         eax,dword ptr [edi+ebx*8]
 00403DB5    cmp         eax,dword ptr [ebp-8]
>00403DB8    je          00403DC9
 00403DBA    cmp         dword ptr [edi+ebx*8],0
>00403DBE    je          00403DC9
 00403DC0    inc         ebx
 00403DC1    cmp         ebx,0FF
>00403DC7    jle         00403DB2
 00403DC9    cmp         ebx,0FF
>00403DCF    jg          00403DD9
 00403DD1    mov         eax,dword ptr [ebp-8]
 00403DD4    mov         dword ptr [edi+ebx*8],eax
>00403DD7    jmp         00403DDB
 00403DD9    xor         ebx,ebx
 00403DDB    inc         dword ptr [edi+ebx*8+4]
 00403DDF    mov         eax,dword ptr [ebp-4]
 00403DE2    mov         eax,dword ptr [eax]
 00403DE4    movzx       eax,word ptr [eax+2]
 00403DE8    add         dword ptr [ebp-28],eax
 00403DEB    mov         esi,dword ptr [ebp-28]
 00403DEE    cmp         esi,dword ptr [ebp-2C]
>00403DF1    jbe         00403C72
 00403DF7    pop         edi
 00403DF8    pop         esi
 00403DF9    pop         ebx
 00403DFA    mov         esp,ebp
 00403DFC    pop         ebp
 00403DFD    ret
*}
end;

//00403E00
procedure ScanForMemoryLeaks;
begin
{*
 00403E00    push        ebp
 00403E01    mov         ebp,esp
 00403E03    push        eax
 00403E04    mov         eax,27
 00403E09    add         esp,0FFFFF004
 00403E0F    push        eax
 00403E10    dec         eax
>00403E11    jne         00403E09
 00403E13    mov         eax,dword ptr [ebp-4]
 00403E16    add         esp,0FFFFF7E0
 00403E1C    push        ebx
 00403E1D    push        esi
 00403E1E    push        edi
 00403E1F    lea         eax,[ebp-1B800]
 00403E25    xor         ecx,ecx
 00403E27    mov         edx,1B800
 00403E2C    call        @FillChar
 00403E31    lea         eax,[ebp-1F824]
 00403E37    xor         ecx,ecx
 00403E39    mov         edx,4000
 00403E3E    call        @FillChar
 00403E43    xor         eax,eax
 00403E45    mov         dword ptr [ebp-1B808],eax
 00403E4B    mov         byte ptr [ebp-1B801],1
 00403E52    mov         edi,dword ptr ds:[78EA2F]
>00403E58    jmp         00403EDF
 00403E5D    mov         eax,edi
 00403E5F    call        GetFirstMediumBlockInPool
 00403E64    mov         ebx,eax
 00403E66    test        ebx,ebx
>00403E68    je          00403EDC
 00403E6A    mov         eax,ebx
 00403E6C    sub         eax,4
 00403E6F    mov         esi,dword ptr [eax]
 00403E71    test        esi,1
>00403E77    jne         00403ECF
 00403E79    test        esi,4
>00403E7F    je          00403E8C
 00403E81    push        ebp
 00403E82    mov         eax,ebx
 00403E84    call        CheckSmallBlockPoolForLeaks
 00403E89    pop         ecx
>00403E8A    jmp         00403ECF
 00403E8C    cmp         dword ptr [ebp-1B808],1000
>00403E96    jge         00403ECF
 00403E98    and         esi,0FFFFFFF0
 00403E9B    sub         esi,4
 00403E9E    mov         dword ptr [ebp-1B814],esi
 00403EA4    mov         eax,ebx
 00403EA6    call        SysUnregisterExpectedMemoryLeak
 00403EAB    test        al,al
>00403EAD    jne         00403ECF
 00403EAF    mov         byte ptr [ebp-1B801],0
 00403EB6    mov         eax,dword ptr [ebp-1B808]
 00403EBC    mov         edx,dword ptr [ebp-1B814]
 00403EC2    mov         dword ptr [ebp+eax*4-1F824],edx
 00403EC9    inc         dword ptr [ebp-1B808]
 00403ECF    mov         eax,ebx
 00403ED1    call        NextMediumBlock
 00403ED6    mov         ebx,eax
 00403ED8    test        ebx,ebx
>00403EDA    jne         00403E6A
 00403EDC    mov         edi,dword ptr [edi+4]
 00403EDF    cmp         edi,78EA2B
>00403EE5    jne         00403E5D
 00403EEB    mov         ebx,dword ptr ds:[790ACD]
>00403EF1    jmp         00403F2A
 00403EF3    mov         eax,ebx
 00403EF5    add         eax,10
 00403EF8    call        SysUnregisterExpectedMemoryLeak
 00403EFD    test        al,al
>00403EFF    jne         00403F27
 00403F01    mov         byte ptr [ebp-1B801],0
 00403F08    mov         esi,dword ptr [ebx+0C]
 00403F0B    and         esi,0FFFFFFF0
 00403F0E    sub         esi,4
 00403F11    sub         esi,10
 00403F14    mov         eax,dword ptr [ebp-1B808]
 00403F1A    mov         dword ptr [ebp+eax*4-1F824],esi
 00403F21    inc         dword ptr [ebp-1B808]
 00403F27    mov         ebx,dword ptr [ebx+4]
 00403F2A    cmp         ebx,790AC9
>00403F30    je          00403F3E
 00403F32    cmp         dword ptr [ebp-1B808],1000
>00403F3C    jl          00403EF3
 00403F3E    cmp         byte ptr [ebp-1B801],0
>00403F45    jne         004041DA
 00403F4B    mov         byte ptr [ebp-1B809],0
 00403F52    xor         eax,eax
 00403F54    mov         dword ptr [ebp-1B818],eax
 00403F5A    mov         eax,[00784054]
 00403F5F    call        @PCharLen
 00403F64    mov         ecx,eax
 00403F66    lea         edx,[ebp-27824]
 00403F6C    mov         eax,[00784054]
 00403F71    call        AppendStringToBuffer
 00403F76    mov         ebx,eax
 00403F78    mov         dword ptr [ebp-1B810],37
 00403F82    mov         dword ptr [ebp-1B820],78407A
 00403F8C    lea         eax,[ebp-1B004]
 00403F92    mov         dword ptr [ebp-1B824],eax
 00403F98    mov         eax,dword ptr [ebp-1B820]
 00403F9E    movzx       eax,word ptr [eax]
 00403FA1    sub         eax,4
 00403FA4    mov         dword ptr [ebp-1B81C],eax
 00403FAA    mov         byte ptr [ebp-1B80A],0
 00403FB1    mov         edi,0FF
 00403FB6    mov         eax,dword ptr [ebp-1B824]
 00403FBC    mov         esi,eax
 00403FBE    lea         eax,[ebp-20025]
 00403FC4    cmp         ebx,eax
>00403FC6    ja          004040F8
 00403FCC    cmp         dword ptr [esi],0
>00403FCF    jbe         004040EB
 00403FD5    cmp         byte ptr [ebp-1B809],0
>00403FDC    jne         00403FFF
 00403FDE    mov         eax,[00784058]
 00403FE3    call        @PCharLen
 00403FE8    mov         ecx,eax
 00403FEA    mov         edx,ebx
 00403FEC    mov         eax,[00784058]
 00403FF1    call        AppendStringToBuffer
 00403FF6    mov         ebx,eax
 00403FF8    mov         byte ptr [ebp-1B809],1
 00403FFF    cmp         byte ptr [ebp-1B80A],0
>00404006    jne         0040405E
 00404008    mov         byte ptr [ebx],0D
 0040400B    inc         ebx
 0040400C    mov         byte ptr [ebx],0A
 0040400F    inc         ebx
 00404010    mov         eax,dword ptr [ebp-1B818]
 00404016    inc         eax
 00404017    mov         edx,ebx
 00404019    call        CardinalToStrBuf
 0040401E    mov         ebx,eax
 00404020    mov         byte ptr [ebx],20
 00404023    inc         ebx
 00404024    mov         byte ptr [ebx],2D
 00404027    inc         ebx
 00404028    mov         byte ptr [ebx],20
 0040402B    inc         ebx
 0040402C    mov         edx,ebx
 0040402E    mov         eax,dword ptr [ebp-1B81C]
 00404034    call        CardinalToStrBuf
 00404039    mov         ebx,eax
 0040403B    mov         eax,[00784060]
 00404040    call        @PCharLen
 00404045    mov         ecx,eax
 00404047    mov         edx,ebx
 00404049    mov         eax,[00784060]
 0040404E    call        AppendStringToBuffer
 00404053    mov         ebx,eax
 00404055    mov         byte ptr [ebp-1B80A],1
>0040405C    jmp         00404066
 0040405E    mov         byte ptr [ebx],2C
 00404061    inc         ebx
 00404062    mov         byte ptr [ebx],20
 00404065    inc         ebx
 00404066    mov         eax,edi
 00404068    sub         eax,1
>0040406B    jb          00404074
>0040406D    je          00404090
 0040406F    dec         eax
>00404070    je          004040AC
>00404072    jmp         004040C8
 00404074    mov         eax,[00784064]
 00404079    call        @PCharLen
 0040407E    mov         ecx,eax
 00404080    mov         edx,ebx
 00404082    mov         eax,[00784064]
 00404087    call        AppendStringToBuffer
 0040408C    mov         ebx,eax
>0040408E    jmp         004040D4
 00404090    mov         eax,[00784068]
 00404095    call        @PCharLen
 0040409A    mov         ecx,eax
 0040409C    mov         edx,ebx
 0040409E    mov         eax,[00784068]
 004040A3    call        AppendStringToBuffer
 004040A8    mov         ebx,eax
>004040AA    jmp         004040D4
 004040AC    mov         eax,[0078406C]
 004040B1    call        @PCharLen
 004040B6    mov         ecx,eax
 004040B8    mov         edx,ebx
 004040BA    mov         eax,[0078406C]
 004040BF    call        AppendStringToBuffer
 004040C4    mov         ebx,eax
>004040C6    jmp         004040D4
 004040C8    mov         eax,dword ptr [esi-4]
 004040CB    mov         edx,ebx
 004040CD    call        AppendClassNameToBuffer
 004040D2    mov         ebx,eax
 004040D4    mov         byte ptr [ebx],20
 004040D7    inc         ebx
 004040D8    mov         byte ptr [ebx],78
 004040DB    inc         ebx
 004040DC    mov         byte ptr [ebx],20
 004040DF    inc         ebx
 004040E0    mov         eax,dword ptr [esi]
 004040E2    mov         edx,ebx
 004040E4    call        CardinalToStrBuf
 004040E9    mov         ebx,eax
 004040EB    dec         edi
 004040EC    sub         esi,8
 004040EF    cmp         edi,0FFFFFFFF
>004040F2    jne         00403FBE
 004040F8    mov         eax,dword ptr [ebp-1B81C]
 004040FE    mov         dword ptr [ebp-1B818],eax
 00404104    add         dword ptr [ebp-1B824],800
 0040410E    add         dword ptr [ebp-1B820],20
 00404115    dec         dword ptr [ebp-1B810]
>0040411B    jne         00403F98
 00404121    cmp         dword ptr [ebp-1B808],0
>00404128    jle         004041A9
 0040412A    cmp         byte ptr [ebp-1B809],0
>00404131    je          00404143
 00404133    mov         byte ptr [ebx],0D
 00404136    inc         ebx
 00404137    mov         byte ptr [ebx],0A
 0040413A    inc         ebx
 0040413B    mov         byte ptr [ebx],0D
 0040413E    inc         ebx
 0040413F    mov         byte ptr [ebx],0A
 00404142    inc         ebx
 00404143    mov         eax,[0078405C]
 00404148    call        @PCharLen
 0040414D    mov         ecx,eax
 0040414F    mov         edx,ebx
 00404151    mov         eax,[0078405C]
 00404156    call        AppendStringToBuffer
 0040415B    mov         ebx,eax
 0040415D    mov         esi,dword ptr [ebp-1B808]
 00404163    dec         esi
 00404164    test        esi,esi
>00404166    jb          004041A9
 00404168    inc         esi
 00404169    xor         edi,edi
 0040416B    lea         eax,[ebp-1F824]
 00404171    mov         dword ptr [ebp-1B824],eax
 00404177    test        edi,edi
>00404179    je          00404183
 0040417B    mov         byte ptr [ebx],2C
 0040417E    inc         ebx
 0040417F    mov         byte ptr [ebx],20
 00404182    inc         ebx
 00404183    mov         eax,dword ptr [ebp-1B824]
 00404189    mov         eax,dword ptr [eax]
 0040418B    mov         edx,ebx
 0040418D    call        CardinalToStrBuf
 00404192    mov         ebx,eax
 00404194    lea         eax,[ebp-20025]
 0040419A    cmp         ebx,eax
>0040419C    ja          004041A9
 0040419E    inc         edi
 0040419F    add         dword ptr [ebp-1B824],4
 004041A6    dec         esi
>004041A7    jne         00404177
 004041A9    mov         eax,[00784070]
 004041AE    call        @PCharLen
 004041B3    mov         ecx,eax
 004041B5    mov         edx,ebx
 004041B7    mov         eax,[00784070]
 004041BC    call        AppendStringToBuffer
 004041C1    push        2010
 004041C6    mov         eax,[00784074]
 004041CB    push        eax
 004041CC    lea         eax,[ebp-27824]
 004041D2    push        eax
 004041D3    push        0
 004041D5    call        user32.MessageBoxA
 004041DA    pop         edi
 004041DB    pop         esi
 004041DC    pop         ebx
 004041DD    mov         esp,ebp
 004041DF    pop         ebp
 004041E0    ret
*}
end;

//004041E4
procedure BuildBlockTypeLookupTable;
begin
{*
 004041E4    push        esi
 004041E5    push        edi
 004041E6    xor         eax,eax
 004041E8    xor         esi,esi
 004041EA    mov         edx,78407A
 004041EF    cmp         byte ptr ds:[78EA2A],0
>004041F6    je          004041FD
 004041F8    test        byte ptr [edx],0F
>004041FB    jne         0040421A
 004041FD    movzx       edi,word ptr [edx]
 00404200    shr         edi,3
 00404203    mov         ecx,esi
 00404205    add         ecx,ecx
 00404207    add         ecx,ecx
 00404209    cmp         edi,eax
>0040420B    jbe         00404218
 0040420D    mov         byte ptr [eax+78E8E4],cl
 00404213    inc         eax
 00404214    cmp         edi,eax
>00404216    ja          0040420D
 00404218    mov         eax,edi
 0040421A    inc         esi
 0040421B    add         edx,20
 0040421E    cmp         esi,37
>00404221    jne         004041EF
 00404223    pop         edi
 00404224    pop         esi
 00404225    ret
*}
end;

//00404228
procedure InitializeMemoryManager;
begin
{*
 00404228    push        ebx
 00404229    push        esi
 0040422A    push        edi
 0040422B    mov         esi,37
 00404230    mov         ebx,784094;^Move12
 00404235    cmp         dword ptr [ebx],0
>00404238    jne         00404240
 0040423A    mov         dword ptr [ebx],402AD0;MoveX16L4
 00404240    lea         eax,[ebx-1C]
 00404243    mov         dword ptr [ebx-8],eax
 00404246    lea         eax,[ebx-1C]
 00404249    mov         dword ptr [ebx-18],eax
 0040424C    xor         eax,eax
 0040424E    mov         dword ptr [ebx-10],eax
 00404251    mov         dword ptr [ebx-14],1
 00404258    movzx       eax,word ptr [ebx-1A]
 0040425C    add         eax,eax
 0040425E    add         eax,eax
 00404260    lea         eax,[eax+eax*2]
 00404263    add         eax,0EF
 00404268    and         eax,0FFFFFF00
 0040426D    add         eax,30
 00404270    cmp         eax,0B30
>00404275    jae         0040427C
 00404277    mov         eax,0B30
 0040427C    add         eax,4D0
 00404281    shr         eax,0D
 00404284    cmp         eax,7
>00404287    jbe         0040428E
 00404289    mov         eax,7
 0040428E    mov         ecx,eax
 00404290    mov         dl,0FF
 00404292    shl         dl,cl
 00404294    mov         byte ptr [ebx-1B],dl
 00404297    shl         eax,0D
 0040429A    add         ax,0B30
 0040429E    mov         word ptr [ebx-4],ax
 004042A2    movzx       edi,word ptr [ebx-1A]
 004042A6    movzx       eax,di
 004042A9    mov         ecx,eax
 004042AB    shl         ecx,4
 004042AE    lea         ecx,[ecx+ecx*2]
 004042B1    add         ecx,0EF
 004042B7    and         ecx,0FFFFFF00
 004042BD    add         ecx,30
 004042C0    cmp         ecx,7330
>004042C6    jae         004042CD
 004042C8    mov         ecx,7330
 004042CD    cmp         ecx,0FF30
>004042D3    jbe         004042DA
 004042D5    mov         ecx,0FF30
 004042DA    mov         eax,ecx
 004042DC    sub         eax,20
 004042DF    movzx       edx,di
 004042E2    mov         ecx,edx
 004042E4    xor         edx,edx
 004042E6    div         eax,ecx
 004042E8    imul        di
 004042EB    add         ax,0EF
 004042EF    and         ax,0FF00
 004042F3    add         ax,30
 004042F7    mov         word ptr [ebx-2],ax
 004042FB    add         ebx,20
 004042FE    dec         esi
>004042FF    jne         00404235
 00404305    call        BuildBlockTypeLookupTable
 0040430A    mov         dword ptr ds:[78EA2B],78EA2B
 00404314    mov         dword ptr ds:[78EA2F],78EA2B
 0040431E    mov         esi,400
 00404323    mov         edx,78EAC8
 00404328    mov         eax,edx
 0040432A    mov         dword ptr [eax],eax
 0040432C    mov         dword ptr [eax+4],eax
 0040432F    add         edx,8
 00404332    dec         esi
>00404333    jne         00404328
 00404335    mov         dword ptr ds:[790AC9],790AC9
 0040433F    mov         dword ptr ds:[790ACD],790AC9
 00404349    pop         edi
 0040434A    pop         esi
 0040434B    pop         ebx
 0040434C    ret
*}
end;

//00404350
procedure FreeAllMemory;
begin
{*
 00404350    push        ebx
 00404351    push        esi
 00404352    push        edi
 00404353    push        ebp
 00404354    mov         ebx,78EA2B
 00404359    mov         esi,790AC9
 0040435E    mov         edi,dword ptr [ebx+4]
>00404361    jmp         00404375
 00404363    mov         ebp,dword ptr [edi+4]
 00404366    push        8000
 0040436B    push        0
 0040436D    push        edi
 0040436E    call        kernel32.VirtualFree
 00404373    mov         edi,ebp
 00404375    cmp         edi,ebx
>00404377    jne         00404363
 00404379    mov         edx,37
 0040437E    mov         eax,784078
 00404383    mov         ecx,eax
 00404385    mov         dword ptr [eax+14],ecx
 00404388    mov         ecx,eax
 0040438A    mov         dword ptr [eax+4],ecx
 0040438D    mov         dword ptr [eax+8],1
 00404394    xor         ecx,ecx
 00404396    mov         dword ptr [eax+0C],ecx
 00404399    add         eax,20
 0040439C    dec         edx
>0040439D    jne         00404383
 0040439F    mov         dword ptr [ebx],ebx
 004043A1    mov         dword ptr [ebx+4],ebx
 004043A4    mov         edx,400
 004043A9    mov         ecx,78EAC8
 004043AE    mov         eax,ecx
 004043B0    mov         dword ptr [eax],eax
 004043B2    mov         dword ptr [eax+4],eax
 004043B5    add         ecx,8
 004043B8    dec         edx
>004043B9    jne         004043AE
 004043BB    mov         ebx,dword ptr [esi+4]
>004043BE    jmp         004043D2
 004043C0    mov         edi,dword ptr [ebx+4]
 004043C3    push        8000
 004043C8    push        0
 004043CA    push        ebx
 004043CB    call        kernel32.VirtualFree
 004043D0    mov         ebx,edi
 004043D2    cmp         ebx,esi
>004043D4    jne         004043C0
 004043D6    mov         dword ptr [esi],esi
 004043D8    mov         dword ptr [esi+4],esi
 004043DB    pop         ebp
 004043DC    pop         edi
 004043DD    pop         esi
 004043DE    pop         ebx
 004043DF    ret
*}
end;

//004043E0
procedure FinalizeMemoryManager;
begin
{*
 004043E0    cmp         dword ptr ds:[790AE4],0
>004043E7    je          004043FB
 004043E9    mov         eax,[00790AE4]
 004043EE    push        eax
 004043EF    call        kernel32.CloseHandle
 004043F4    xor         eax,eax
 004043F6    mov         [00790AE4],eax
 004043FB    cmp         byte ptr ds:[78E8DC],0
>00404402    je          00404409
 00404404    call        ScanForMemoryLeaks
 00404409    cmp         dword ptr ds:[790ADC],0
>00404410    je          0040442B
 00404412    push        8000
 00404417    push        0
 00404419    mov         eax,[00790ADC]
 0040441E    push        eax
 0040441F    call        kernel32.VirtualFree
 00404424    xor         eax,eax
 00404426    mov         [00790ADC],eax
 0040442B    call        FreeAllMemory
 00404430    ret
*}
end;

//00404434
function AllocMem(Size:Cardinal):Pointer;
begin
{*
 00404434    test        eax,eax
>00404436    je          00404442
 00404438    call        dword ptr ds:[784764]
 0040443E    test        eax,eax
>00404440    je          00404444
 00404442    rep ret
 00404444    mov         al,1
>00404446    jmp         Error
 0040444B    ret
*}
end;

//0040444C
function RegisterExpectedMemoryLeak(P:Pointer):Boolean;
begin
{*
 0040444C    push        ebx
 0040444D    mov         ebx,eax
 0040444F    test        ebx,ebx
>00404451    je          0040445F
 00404453    mov         eax,ebx
 00404455    call        dword ptr ds:[784768]
 0040445B    test        al,al
>0040445D    jne         00404463
 0040445F    xor         eax,eax
 00404461    pop         ebx
 00404462    ret
 00404463    mov         al,1
 00404465    pop         ebx
 00404466    ret
*}
end;

//00404468
function @GetMem(size:Integer):Pointer;
begin
{*
 00404468    test        eax,eax
>0040446A    jle         0040447F
 0040446C    call        dword ptr ds:[784758]
 00404472    test        eax,eax
>00404474    je          00404478
 00404476    rep ret
 00404478    mov         al,1
>0040447A    jmp         Error
 0040447F    xor         eax,eax
 00404481    rep ret
*}
end;

//00404484
function @FreeMem(p:Pointer):Integer;
begin
{*
 00404484    test        eax,eax
>00404486    je          00404492
 00404488    call        dword ptr ds:[78475C]
 0040448E    test        eax,eax
>00404490    jne         00404494
 00404492    rep ret
 00404494    mov         al,2
>00404496    jmp         Error
 0040449B    ret
*}
end;

//0040449C
function @ReallocMem(var P:Pointer; NewSize:Integer):Pointer;
begin
{*
 0040449C    mov         ecx,dword ptr [eax]
 0040449E    test        ecx,ecx
>004044A0    je          004044D4
 004044A2    test        edx,edx
>004044A4    je          004044BE
 004044A6    push        eax
 004044A7    mov         eax,ecx
 004044A9    call        dword ptr ds:[784760]
 004044AF    pop         ecx
 004044B0    or          eax,eax
>004044B2    je          004044CD
 004044B4    mov         dword ptr [ecx],eax
 004044B6    ret
 004044B7    mov         al,2
>004044B9    jmp         Error
 004044BE    mov         dword ptr [eax],edx
 004044C0    mov         eax,ecx
 004044C2    call        dword ptr ds:[78475C]
 004044C8    or          eax,eax
>004044CA    jne         004044B7
 004044CC    ret
 004044CD    mov         al,1
>004044CF    jmp         Error
 004044D4    test        edx,edx
>004044D6    je          004044E8
 004044D8    push        eax
 004044D9    mov         eax,edx
 004044DB    call        dword ptr ds:[784758]
 004044E1    pop         ecx
 004044E2    or          eax,eax
>004044E4    je          004044CD
 004044E6    mov         dword ptr [ecx],eax
 004044E8    ret
*}
end;

//004044EC
function ExceptObject:TObject;
begin
{*
 004044EC    call        @GetTls
 004044F1    cmp         dword ptr [eax+0],0;{RaiseListPtr:Pointer}
>004044F8    je          00404509
 004044FA    call        @GetTls
 004044FF    mov         eax,dword ptr [eax+0];{RaiseListPtr:Pointer}
 00404505    mov         eax,dword ptr [eax+8]
 00404508    ret
 00404509    xor         eax,eax
 0040450B    ret
*}
end;

//0040450C
function ExceptAddr:Pointer;
begin
{*
 0040450C    call        @GetTls
 00404511    cmp         dword ptr [eax+0],0;{RaiseListPtr:Pointer}
>00404518    je          00404529
 0040451A    call        @GetTls
 0040451F    mov         eax,dword ptr [eax+0];{RaiseListPtr:Pointer}
 00404525    mov         eax,dword ptr [eax+4]
 00404528    ret
 00404529    xor         eax,eax
 0040452B    ret
*}
end;

//0040452C
function AcquireExceptionObject:Pointer;
begin
{*
 0040452C    push        ebx
 0040452D    call        @GetTls
 00404532    mov         eax,dword ptr [eax+0];{RaiseListPtr:Pointer}
 00404538    test        eax,eax
>0040453A    je          00404557
 0040453C    mov         ebx,dword ptr [eax+8]
 0040453F    xor         edx,edx
 00404541    mov         dword ptr [eax+8],edx
 00404544    cmp         dword ptr ds:[78E020],0
>0040454B    je          00404559
 0040454D    mov         eax,ebx
 0040454F    call        dword ptr ds:[78E020]
>00404555    jmp         00404559
 00404557    xor         ebx,ebx
 00404559    mov         eax,ebx
 0040455B    pop         ebx
 0040455C    ret
*}
end;

//00404560
function RaiseList:Pointer;
begin
{*
 00404560    call        @GetTls
 00404565    mov         eax,dword ptr [eax+0];{RaiseListPtr:Pointer}
 0040456B    ret
*}
end;

//0040456C
procedure RunErrorAt(ErrCode:Integer; ErrorAtAddr:Pointer);
begin
{*
 0040456C    mov         dword ptr ds:[784004],edx
 00404572    call        @Halt
 00404577    ret
*}
end;

//00404578
procedure ErrorAt(ErrorCode:Byte; ErrorAddr:Pointer);
begin
{*
 00404578    push        ebx
 00404579    push        esi
 0040457A    mov         esi,edx
 0040457C    mov         ebx,eax
 0040457E    and         bl,7F
 00404581    cmp         dword ptr ds:[78E008],0
>00404588    je          00404594
 0040458A    mov         edx,esi
 0040458C    mov         eax,ebx
 0040458E    call        dword ptr ds:[78E008]
 00404594    test        bl,bl
>00404596    jne         004045A5
 00404598    call        @GetTls
 0040459D    mov         ebx,dword ptr [eax+4];{InOutRes:Integer}
>004045A3    jmp         004045B4
 004045A5    cmp         bl,1B
>004045A8    ja          004045B4
 004045AA    movzx       eax,bl
 004045AD    movzx       ebx,byte ptr [eax+784770]
 004045B4    movzx       eax,bl
 004045B7    mov         edx,esi
 004045B9    call        RunErrorAt
 004045BE    pop         esi
 004045BF    pop         ebx
 004045C0    ret
*}
end;

//004045C4
procedure Error(errorCode:TRuntimeError);
begin
{*
 004045C4    push        ebp
 004045C5    mov         ebp,esp
 004045C7    push        ecx
 004045C8    mov         byte ptr [ebp-1],al
 004045CB    mov         al,byte ptr [ebp-1]
 004045CE    and         al,7F
 004045D0    lea         edx,[ebp-1]
 004045D3    inc         edx
 004045D4    add         edx,4
 004045D7    mov         edx,dword ptr [edx]
 004045D9    call        ErrorAt
 004045DE    pop         ecx
 004045DF    pop         ebp
 004045E0    ret
*}
end;

//004045E4
procedure @_IOTest;
begin
{*
 004045E4    push        eax
 004045E5    push        edx
 004045E6    push        ecx
 004045E7    call        @GetTls
 004045EC    cmp         dword ptr [eax+4],0;{InOutRes:Integer}
 004045F3    pop         ecx
 004045F4    pop         edx
 004045F5    pop         eax
>004045F6    jne         004045F9
 004045F8    ret
 004045F9    xor         eax,eax
>004045FB    jmp         Error
 00404600    ret
*}
end;

//00404604
procedure SetInOutRes(NewValue:Integer);
begin
{*
 00404604    push        ebx
 00404605    mov         ebx,eax
 00404607    call        @GetTls
 0040460C    mov         dword ptr [eax+4],ebx;{InOutRes:Integer}
 00404612    pop         ebx
 00404613    ret
*}
end;

//00404614
procedure InOutError;
begin
{*
 00404614    call        kernel32.GetLastError
 00404619    call        SetInOutRes
 0040461E    ret
*}
end;

//00404620
function IOResult:Integer;
begin
{*
 00404620    push        ebx
 00404621    call        @GetTls
 00404626    mov         ebx,dword ptr [eax+4];{InOutRes:Integer}
 0040462C    call        @GetTls
 00404631    xor         edx,edx
 00404633    mov         dword ptr [eax+4],edx;{InOutRes:Integer}
 00404639    mov         eax,ebx
 0040463B    pop         ebx
 0040463C    ret
*}
end;

//00404640
procedure Move(const Source:void ; var Dest:void ; Count:Integer);
begin
{*
 00404640    cmp         eax,edx
>00404642    je          00404675
 00404644    cmp         ecx,20
>00404647    ja          004046C5
 00404649    sub         ecx,8
>0040464C    jg          00404655
 0040464E    jmp         dword ptr [ecx*4+404698]
 00404655    fild        qword ptr [ecx+eax]
 00404658    fild        qword ptr [eax]
 0040465A    cmp         ecx,8
>0040465D    jle         00404670
 0040465F    fild        qword ptr [eax+8]
 00404662    cmp         ecx,10
>00404665    jle         0040466D
 00404667    fild        qword ptr [eax+10]
 0040466A    fistp       qword ptr [edx+10]
 0040466D    fistp       qword ptr [edx+8]
 00404670    fistp       qword ptr [edx]
 00404672    fistp       qword ptr [ecx+edx]
 00404675    ret
 00404676    nop
 00404677    nop
>00404678    jne         004046C0
 0040467A    inc         eax
 0040467B    add         dh,dh
 0040467D    inc         esi
 0040467E    inc         eax
 0040467F    add         ah,bh
 00404681    inc         esi
 00404682    inc         eax
 00404683    add         byte ptr [ebx],al
 00404685    inc         edi
 00404686    inc         eax
 00404687    add         byte ptr [eax],dl
 00404689    inc         edi
 0040468A    inc         eax
 0040468B    add         byte ptr ds:[20004047],dl
 00404691    inc         edi
 00404692    inc         eax
 00404693    add         byte ptr ds:[38004047],ch
 00404699    inc         edi
 0040469A    inc         eax
 0040469B    add         byte ptr [edx-21],dl
 0040469E    sub         byte ptr [ebp-7207FEBC],cl
 004046A4    dec         esp
 004046A5    or          bh,al
 004046A7    fild        qword ptr [eax]
 004046A9    push        ecx
 004046AA    neg         ecx
 004046AC    and         edx,0FFFFFFF8
 004046AF    lea         ecx,[edx+ecx+8]
 004046B3    pop         edx
 004046B4    fild        qword ptr [ecx+eax]
 004046B7    fistp       qword ptr [ecx+edx]
 004046BA    add         ecx,8
>004046BD    jl          004046B4
 004046BF    fistp       qword ptr [edx]
 004046C1    pop         edx
 004046C2    fistp       qword ptr [edx]
 004046C4    ret
>004046C5    jle         004046F5
 004046C7    cmp         eax,edx
>004046C9    ja          0040469C
 004046CB    sub         edx,ecx
 004046CD    cmp         eax,edx
 004046CF    lea         edx,[ecx+edx]
>004046D2    jbe         0040469C
 004046D4    sub         ecx,8
 004046D7    push        ecx
 004046D8    fild        qword ptr [ecx+eax]
 004046DB    fild        qword ptr [eax]
 004046DD    add         ecx,edx
 004046DF    and         ecx,0FFFFFFF8
 004046E2    sub         ecx,edx
 004046E4    fild        qword ptr [ecx+eax]
 004046E7    fistp       qword ptr [ecx+edx]
 004046EA    sub         ecx,8
>004046ED    jg          004046E4
 004046EF    pop         ecx
 004046F0    fistp       qword ptr [edx]
 004046F2    fistp       qword ptr [ecx+edx]
 004046F5    ret
*}
end;

//00404740
function GetParamStr(P:PWideChar; var Param:AnsiString):PWideChar;
begin
{*
 00404740    push        ebx
 00404741    push        esi
 00404742    push        edi
 00404743    push        ebp
 00404744    mov         ebx,edx
>00404746    jmp         0040474B
 00404748    add         eax,2
 0040474B    movzx       edx,word ptr [eax]
 0040474E    test        dx,dx
>00404751    je          00404759
 00404753    cmp         dx,20
>00404757    jbe         00404748
 00404759    cmp         word ptr [eax],22
>0040475D    jne         0040476B
 0040475F    cmp         word ptr [eax+2],22
>00404764    jne         0040476B
 00404766    add         eax,4
>00404769    jmp         0040474B
 0040476B    xor         edi,edi
 0040476D    mov         esi,eax
>0040476F    jmp         0040479D
 00404771    cmp         bp,22
>00404775    jne         00404799
 00404777    add         eax,2
>0040477A    jmp         00404780
 0040477C    inc         edi
 0040477D    add         eax,2
 00404780    movzx       edx,word ptr [eax]
 00404783    test        dx,dx
>00404786    je          0040478E
 00404788    cmp         dx,22
>0040478C    jne         0040477C
 0040478E    cmp         word ptr [eax],0
>00404792    je          0040479D
 00404794    add         eax,2
>00404797    jmp         0040479D
 00404799    inc         edi
 0040479A    add         eax,2
 0040479D    movzx       ebp,word ptr [eax]
 004047A0    cmp         bp,20
>004047A4    ja          00404771
 004047A6    mov         eax,ebx
 004047A8    mov         edx,edi
 004047AA    call        @UStrSetLength
 004047AF    mov         eax,esi
 004047B1    mov         esi,dword ptr [ebx]
 004047B3    xor         ecx,ecx
>004047B5    jmp         004047EB
 004047B7    cmp         di,22
>004047BB    jne         004047E3
 004047BD    add         eax,2
>004047C0    jmp         004047CA
 004047C2    mov         word ptr [esi+ecx*2],dx
 004047C6    add         eax,2
 004047C9    inc         ecx
 004047CA    movzx       edx,word ptr [eax]
 004047CD    test        dx,dx
>004047D0    je          004047D8
 004047D2    cmp         dx,22
>004047D6    jne         004047C2
 004047D8    cmp         word ptr [eax],0
>004047DC    je          004047EB
 004047DE    add         eax,2
>004047E1    jmp         004047EB
 004047E3    mov         word ptr [esi+ecx*2],di
 004047E7    add         eax,2
 004047EA    inc         ecx
 004047EB    movzx       edi,word ptr [eax]
 004047EE    cmp         di,20
>004047F2    ja          004047B7
 004047F4    pop         ebp
 004047F5    pop         edi
 004047F6    pop         esi
 004047F7    pop         ebx
 004047F8    ret
*}
end;

//004047FC
function ParamCount:Integer;
begin
{*
 004047FC    push        ebp
 004047FD    mov         ebp,esp
 004047FF    push        0
 00404801    push        ebx
 00404802    push        esi
 00404803    xor         eax,eax
 00404805    push        ebp
 00404806    push        40484D
 0040480B    push        dword ptr fs:[eax]
 0040480E    mov         dword ptr fs:[eax],esp
 00404811    xor         esi,esi
 00404813    call        kernel32.GetCommandLineW
 00404818    lea         edx,[ebp-4]
 0040481B    call        GetParamStr
 00404820    mov         ebx,eax
 00404822    lea         edx,[ebp-4]
 00404825    mov         eax,ebx
 00404827    call        GetParamStr
 0040482C    mov         ebx,eax
 0040482E    cmp         dword ptr [ebp-4],0
>00404832    je          00404837
 00404834    inc         esi
>00404835    jmp         00404822
 00404837    xor         eax,eax
 00404839    pop         edx
 0040483A    pop         ecx
 0040483B    pop         ecx
 0040483C    mov         dword ptr fs:[eax],edx
 0040483F    push        404854
 00404844    lea         eax,[ebp-4]
 00404847    call        @UStrClr
 0040484C    ret
>0040484D    jmp         @HandleFinally
>00404852    jmp         00404844
 00404854    mov         eax,esi
 00404856    pop         esi
 00404857    pop         ebx
 00404858    pop         ecx
 00404859    pop         ebp
 0040485A    ret
*}
end;

//0040485C
function ParamStr(Index:Integer):string;
begin
{*
 0040485C    push        ebx
 0040485D    push        esi
 0040485E    push        edi
 0040485F    add         esp,0FFFFFDF4
 00404865    mov         ebx,edx
 00404867    mov         esi,eax
 00404869    mov         eax,ebx
 0040486B    call        @UStrClr
 00404870    test        esi,esi
>00404872    jne         00404892
 00404874    push        105
 00404879    lea         eax,[esp+4]
 0040487D    push        eax
 0040487E    push        0
 00404880    call        kernel32.GetModuleFileNameW
 00404885    mov         ecx,eax
 00404887    mov         edx,esp
 00404889    mov         eax,ebx
 0040488B    call        @UStrFromPWCharLen
>00404890    jmp         004048B0
 00404892    call        kernel32.GetCommandLineW
 00404897    mov         edi,eax
 00404899    mov         edx,ebx
 0040489B    mov         eax,edi
 0040489D    call        GetParamStr
 004048A2    mov         edi,eax
 004048A4    test        esi,esi
>004048A6    je          004048B0
 004048A8    cmp         dword ptr [ebx],0
>004048AB    je          004048B0
 004048AD    dec         esi
>004048AE    jmp         00404899
 004048B0    add         esp,20C
 004048B6    pop         edi
 004048B7    pop         esi
 004048B8    pop         ebx
 004048B9    ret
*}
end;

//004048BC
procedure Randomize;
begin
{*
 004048BC    add         esp,0FFFFFFF8
 004048BF    push        esp
 004048C0    call        kernel32.QueryPerformanceCounter
 004048C5    test        eax,eax
>004048C7    je          004048D4
 004048C9    mov         eax,dword ptr [esp]
 004048CC    mov         [00784008],eax
 004048D1    pop         ecx
 004048D2    pop         edx
 004048D3    ret
 004048D4    call        kernel32.GetTickCount
 004048D9    mov         [00784008],eax
 004048DE    pop         ecx
 004048DF    pop         edx
 004048E0    ret
*}
end;

//004048E4
function Random(const ARange:Integer):Integer;
begin
{*
 004048E4    push        ebx
 004048E5    xor         ebx,ebx
 004048E7    imul        edx,dword ptr [ebx+784008],8088405
 004048F1    inc         edx
 004048F2    mov         dword ptr [ebx+784008],edx
 004048F8    mul         eax,edx
 004048FA    mov         eax,edx
 004048FC    pop         ebx
 004048FD    ret
*}
end;

//00404900
function Random:Extended;
begin
{*
 00404900    push        ebx
 00404901    xor         ebx,ebx
 00404903    imul        edx,dword ptr [ebx+784008],8088405
 0040490D    inc         edx
 0040490E    mov         dword ptr [ebx+784008],edx
 00404914    fld         qword ptr [ebx+784790]
 0040491A    push        0
 0040491C    push        edx
 0040491D    fild        qword ptr [esp]
 00404920    add         esp,8
 00404923    fmulp       st(1),st
 00404925    pop         ebx
 00404926    ret
*}
end;

//00404928
function UpCase(Ch:Char):Char;
begin
{*
 00404928    mov         edx,eax
 0040492A    mov         ecx,eax
 0040492C    add         ecx,0FFFFFF9F
 0040492F    sub         cx,1A
>00404933    jae         0040493C
 00404935    mov         edx,eax
 00404937    and         dx,0FFDF
 0040493C    mov         eax,edx
 0040493E    ret
*}
end;

//00404940
procedure Set8087CW(NewCW:Word);
begin
{*
 00404940    mov         [00784024],ax;gvar_00784024
 00404946    fnclex
 00404948    fldcw       word ptr ds:[784024];gvar_00784024
 0040494E    ret
*}
end;

//00404950
function Get8087CW:Word;
begin
{*
 00404950    push        0
 00404952    fnstcw      word ptr [esp]
 00404955    pop         eax
 00404956    ret
*}
end;

//00404958
function Int(const X:Extended):Extended;
begin
{*
 00404958    push        ebp
 00404959    mov         ebp,esp
 0040495B    fld         tbyte ptr [ebp+8]
 0040495E    sub         esp,4
 00404961    fnstcw      word ptr [esp]
 00404964    fnstcw      word ptr [esp+2]
 00404968    wait
 00404969    or          word ptr [esp+2],0F00
 00404970    fldcw       word ptr [esp+2]
 00404974    frndint
 00404976    wait
 00404977    fldcw       word ptr [esp]
 0040497A    add         esp,4
 0040497D    pop         ebp
 0040497E    ret         0C
*}
end;

//00404984
function Frac(const X:Extended):Extended;
begin
{*
 00404984    push        ebp
 00404985    mov         ebp,esp
 00404987    fld         tbyte ptr [ebp+8]
 0040498A    fld         st(0)
 0040498C    sub         esp,4
 0040498F    fnstcw      word ptr [esp]
 00404992    fnstcw      word ptr [esp+2]
 00404996    wait
 00404997    or          word ptr [esp+2],0F00
 0040499E    fldcw       word ptr [esp+2]
 004049A2    frndint
 004049A4    wait
 004049A5    fldcw       word ptr [esp]
 004049A8    add         esp,4
 004049AB    fsubp       st(1),st
 004049AD    pop         ebp
 004049AE    ret         0C
*}
end;

//004049B4
function Exp(const X:Extended):Extended;
begin
{*
 004049B4    push        ebp
 004049B5    mov         ebp,esp
 004049B7    fld         tbyte ptr [ebp+8]
 004049BA    fldl2e
 004049BC    fmulp       st(1),st
 004049BE    fld         st(0)
 004049C0    frndint
 004049C2    fsub        st(1),st
 004049C4    fxch        st(1)
 004049C6    f2xm1
 004049C8    fld1
 004049CA    faddp       st(1),st
 004049CC    fscale
 004049CE    fstp        st(1)
 004049D0    pop         ebp
 004049D1    ret         0C
*}
end;

//004049D4
function Cos(const X:Extended):Extended;
begin
{*
 004049D4    push        ebp
 004049D5    mov         ebp,esp
 004049D7    fld         tbyte ptr [ebp+8]
 004049DA    fcos
 004049DC    wait
 004049DD    pop         ebp
 004049DE    ret         0C
*}
end;

//004049E4
function Sin(const X:Extended):Extended;
begin
{*
 004049E4    push        ebp
 004049E5    mov         ebp,esp
 004049E7    fld         tbyte ptr [ebp+8]
 004049EA    fsin
 004049EC    wait
 004049ED    pop         ebp
 004049EE    ret         0C
*}
end;

//004049F4
function Ln(const X:Extended):Extended;
begin
{*
 004049F4    push        ebp
 004049F5    mov         ebp,esp
 004049F7    fld         tbyte ptr [ebp+8]
 004049FA    fldln2
 004049FC    fxch        st(1)
 004049FE    fyl2x
 00404A00    wait
 00404A01    pop         ebp
 00404A02    ret         0C
*}
end;

//00404A08
function ArcTan(const X:Extended):Extended;
begin
{*
 00404A08    push        ebp
 00404A09    mov         ebp,esp
 00404A0B    fld         tbyte ptr [ebp+8]
 00404A0E    fld1
 00404A10    fpatan
 00404A12    wait
 00404A13    pop         ebp
 00404A14    ret         0C
*}
end;

//00404A18
function Sqrt(const X:Extended):Extended;
begin
{*
 00404A18    push        ebp
 00404A19    mov         ebp,esp
 00404A1B    fld         tbyte ptr [ebp+8]
 00404A1E    fsqrt
 00404A20    wait
 00404A21    pop         ebp
 00404A22    ret         0C
*}
end;

//00404A28
procedure @ROUND;
begin
{*
 00404A28    sub         esp,8
 00404A2B    fistp       qword ptr [esp]
 00404A2E    wait
 00404A2F    pop         eax
 00404A30    pop         edx
 00404A31    ret
*}
end;

//00404A34
function @TRUNC(X:Extended):Int64;
begin
{*
 00404A34    sub         esp,0C
 00404A37    fnstcw      word ptr [esp]
 00404A3A    fnstcw      word ptr [esp+2]
 00404A3E    wait
 00404A3F    or          word ptr [esp+2],0F00
 00404A46    fldcw       word ptr [esp+2]
 00404A4A    fistp       qword ptr [esp+4]
 00404A4E    wait
 00404A4F    fldcw       word ptr [esp]
 00404A52    pop         ecx
 00404A53    pop         eax
 00404A54    pop         edx
 00404A55    ret
*}
end;

//00404A58
procedure @AbstractError;
begin
{*
 00404A58    cmp         dword ptr ds:[78E034],0
>00404A5F    je          00404A67
 00404A61    call        dword ptr ds:[78E034]
 00404A67    mov         eax,0D2
>00404A6C    jmp         @RunError
 00404A71    ret
*}
end;

//00404A74
function OpenText(var t:TTextRec; Mode:Word):Integer;
begin
{*
 00404A74    push        ebx
 00404A75    push        esi
 00404A76    mov         esi,edx
 00404A78    mov         ebx,eax
 00404A7A    movzx       eax,word ptr [ebx+4]
 00404A7E    cmp         ax,0D7B0
>00404A82    jb          00404A8A
 00404A84    cmp         ax,0D7B3
>00404A88    jbe         00404A91
 00404A8A    mov         ebx,66
>00404A8F    jmp         00404ABD
 00404A91    cmp         ax,0D7B0
>00404A95    je          00404A9E
 00404A97    mov         eax,ebx
 00404A99    call        @Close
 00404A9E    mov         word ptr [ebx+4],si
 00404AA2    cmp         word ptr [ebx+48],0
>00404AA7    jne         00404AB6
 00404AA9    cmp         dword ptr [ebx+18],0
>00404AAD    jne         00404AB6
 00404AAF    mov         dword ptr [ebx+18],404B88;TextOpen:Integer
 00404AB6    mov         eax,ebx
 00404AB8    call        dword ptr [ebx+18]
 00404ABB    mov         ebx,eax
 00404ABD    test        ebx,ebx
>00404ABF    je          00404AC8
 00404AC1    mov         eax,ebx
 00404AC3    call        SetInOutRes
 00404AC8    mov         eax,ebx
 00404ACA    pop         esi
 00404ACB    pop         ebx
 00404ACC    ret
*}
end;

//00404AD0
function @RewritText(var T:TTextRec):Integer;
begin
{*
 00404AD0    mov         dx,0D7B2
 00404AD4    call        OpenText
 00404AD9    ret
*}
end;

//00404ADC
function TextIn(var t:TTextRec):Integer;
begin
{*
 00404ADC    push        ebx
 00404ADD    mov         ebx,eax
 00404ADF    xor         eax,eax
 00404AE1    mov         dword ptr [ebx+10],eax
 00404AE4    xor         eax,eax
 00404AE6    mov         dword ptr [ebx+0C],eax
 00404AE9    push        0
 00404AEB    lea         eax,[ebx+10]
 00404AEE    push        eax
 00404AEF    mov         eax,dword ptr [ebx+8]
 00404AF2    push        eax
 00404AF3    mov         eax,dword ptr [ebx+14]
 00404AF6    push        eax
 00404AF7    mov         eax,dword ptr [ebx]
 00404AF9    push        eax
 00404AFA    call        kernel32.ReadFile
 00404AFF    test        eax,eax
>00404B01    jne         00404B11
 00404B03    call        kernel32.GetLastError
 00404B08    cmp         eax,6D
>00404B0B    jne         00404B13
 00404B0D    xor         eax,eax
 00404B0F    pop         ebx
 00404B10    ret
 00404B11    xor         eax,eax
 00404B13    pop         ebx
 00404B14    ret
*}
end;

//00404B18
function FileNOPProc(var t:void ):Integer;
begin
{*
 00404B18    xor         eax,eax
 00404B1A    ret
*}
end;

//00404B1C
function TextOut(var t:TTextRec):Integer;
begin
{*
 00404B1C    push        ebx
 00404B1D    push        esi
 00404B1E    push        ecx
 00404B1F    mov         ebx,eax
 00404B21    mov         esi,dword ptr [ebx+0C]
 00404B24    test        esi,esi
>00404B26    jne         00404B2C
 00404B28    xor         eax,eax
>00404B2A    jmp         00404B52
 00404B2C    push        0
 00404B2E    lea         eax,[esp+4]
 00404B32    push        eax
 00404B33    push        esi
 00404B34    mov         eax,dword ptr [ebx+14]
 00404B37    push        eax
 00404B38    mov         eax,dword ptr [ebx]
 00404B3A    push        eax
 00404B3B    call        kernel32.WriteFile
 00404B40    test        eax,eax
>00404B42    jne         00404B4B
 00404B44    call        kernel32.GetLastError
>00404B49    jmp         00404B4D
 00404B4B    xor         eax,eax
 00404B4D    xor         edx,edx
 00404B4F    mov         dword ptr [ebx+0C],edx
 00404B52    pop         edx
 00404B53    pop         esi
 00404B54    pop         ebx
 00404B55    ret
*}
end;

//00404B58
function InternalClose(Handle:Integer):Boolean;
begin
{*
 00404B58    push        ebx
 00404B59    mov         ebx,eax
 00404B5B    push        ebx
 00404B5C    call        kernel32.CloseHandle
 00404B61    dec         eax
 00404B62    sete        al
 00404B65    pop         ebx
 00404B66    ret
*}
end;

//00404B68
function TextClose(var t:TTextRec):Integer;
begin
{*
 00404B68    push        ebx
 00404B69    mov         ebx,eax
 00404B6B    mov         word ptr [ebx+4],0D7B0
 00404B71    mov         eax,dword ptr [ebx]
 00404B73    call        InternalClose
 00404B78    test        al,al
>00404B7A    jne         00404B83
 00404B7C    call        kernel32.GetLastError
 00404B81    pop         ebx
 00404B82    ret
 00404B83    xor         eax,eax
 00404B85    pop         ebx
 00404B86    ret
*}
end;

//00404B88
function TextOpen(var t:TTextRec):Integer;
begin
{*
 00404B88    push        esi
 00404B89    mov         esi,eax
 00404B8B    xor         eax,eax
 00404B8D    mov         dword ptr [esi+0C],eax
 00404B90    mov         dword ptr [esi+10],eax
 00404B93    mov         ax,word ptr [esi+4]
 00404B97    sub         eax,0D7B1
>00404B9C    je          00404BA9
 00404B9E    dec         eax
>00404B9F    je          00404BC1
 00404BA1    dec         eax
>00404BA2    je          00404BD2
>00404BA4    jmp         00404D11
 00404BA9    mov         eax,80000000
 00404BAE    mov         edx,1
 00404BB3    mov         ecx,3
 00404BB8    mov         dword ptr [esi+1C],404ADC;TextIn:Integer
>00404BBF    jmp         00404BE8
 00404BC1    mov         eax,40000000
 00404BC6    mov         edx,1
 00404BCB    mov         ecx,2
>00404BD0    jmp         00404BE1
 00404BD2    mov         eax,0C0000000
 00404BD7    mov         edx,1
 00404BDC    mov         ecx,3
 00404BE1    mov         dword ptr [esi+1C],404B1C;TextOut:Integer
 00404BE8    mov         dword ptr [esi+24],404B68;TextClose:Integer
 00404BEF    mov         dword ptr [esi+20],404B18;FileNOPProc:Integer
 00404BF6    cmp         word ptr [esi+48],0
>00404BFB    je          00404CB3
 00404C01    push        0
 00404C03    push        80
 00404C08    push        ecx
 00404C09    push        0
 00404C0B    push        edx
 00404C0C    push        eax
 00404C0D    lea         eax,[esi+48]
 00404C10    push        eax
 00404C11    call        kernel32.CreateFileW
 00404C16    cmp         eax,0FFFFFFFF
>00404C19    je          00404D27
 00404C1F    mov         dword ptr [esi],eax
 00404C21    cmp         word ptr [esi+4],0D7B3
>00404C27    jne         00404CF0
 00404C2D    dec         word ptr [esi+4]
 00404C31    push        0
 00404C33    push        dword ptr [esi]
 00404C35    call        kernel32.GetFileSize
 00404C3A    inc         eax
>00404C3B    je          00404D27
 00404C41    sub         eax,81
>00404C46    jae         00404C4A
 00404C48    xor         eax,eax
 00404C4A    push        0
 00404C4C    push        0
 00404C4E    push        eax
 00404C4F    push        dword ptr [esi]
 00404C51    call        kernel32.SetFilePointer
 00404C56    inc         eax
>00404C57    je          00404D27
 00404C5D    push        0
 00404C5F    mov         edx,esp
 00404C61    push        0
 00404C63    push        edx
 00404C64    push        80
 00404C69    lea         edx,[esi+250]
 00404C6F    push        edx
 00404C70    push        dword ptr [esi]
 00404C72    call        kernel32.ReadFile
 00404C77    pop         edx
 00404C78    dec         eax
>00404C79    jne         00404D27
 00404C7F    xor         eax,eax
 00404C81    cmp         eax,edx
>00404C83    jae         00404CF0
 00404C85    cmp         byte ptr [esi+eax+250],0E
>00404C8D    je          00404C92
 00404C8F    inc         eax
>00404C90    jmp         00404C81
 00404C92    push        2
 00404C94    push        0
 00404C96    sub         eax,edx
 00404C98    push        eax
 00404C99    push        dword ptr [esi]
 00404C9B    call        kernel32.SetFilePointer
 00404CA0    inc         eax
>00404CA1    je          00404D27
 00404CA7    push        dword ptr [esi]
 00404CA9    call        kernel32.SetEndOfFile
 00404CAE    dec         eax
>00404CAF    jne         00404D27
>00404CB1    jmp         00404CF0
 00404CB3    lea         eax,[esi+250]
 00404CB9    mov         dword ptr [esi+8],80
 00404CC0    mov         dword ptr [esi+24],404B18;FileNOPProc:Integer
 00404CC7    mov         dword ptr [esi+14],eax
 00404CCA    cmp         word ptr [esi+4],0D7B2
>00404CD0    je          00404CD6
 00404CD2    push        0F6
>00404CD4    jmp         00404CE4
 00404CD6    cmp         esi,78E5FC
>00404CDC    jne         00404CE2
 00404CDE    push        0F4
>00404CE0    jmp         00404CE4
 00404CE2    push        0F5
 00404CE4    call        kernel32.GetStdHandle
 00404CE9    cmp         eax,0FFFFFFFF
>00404CEC    je          00404D27
 00404CEE    mov         dword ptr [esi],eax
 00404CF0    cmp         word ptr [esi+4],0D7B1
>00404CF6    je          00404D0F
 00404CF8    push        dword ptr [esi]
 00404CFA    call        kernel32.GetFileType
 00404CFF    test        eax,eax
>00404D01    je          00404D13
 00404D03    cmp         eax,2
>00404D06    jne         00404D0F
 00404D08    mov         dword ptr [esi+20],404B1C;TextOut:Integer
 00404D0F    xor         eax,eax
 00404D11    pop         esi
 00404D12    ret
 00404D13    push        dword ptr [esi]
 00404D15    call        kernel32.CloseHandle
 00404D1A    mov         word ptr [esi+4],0D7B0
 00404D20    mov         eax,69
>00404D25    jmp         00404D11
 00404D27    mov         word ptr [esi+4],0D7B0
 00404D2D    call        kernel32.GetLastError
>00404D32    jmp         00404D11
 00404D34    ret
*}
end;

//00404D38
function @Assign(var F:TFileRec; S:String):Integer;
begin
{*
 00404D38    push        ebx
 00404D39    push        esi
 00404D3A    push        edi
 00404D3B    mov         edi,edx
 00404D3D    mov         ebx,eax
 00404D3F    mov         eax,ebx
 00404D41    xor         ecx,ecx
 00404D43    mov         edx,250
 00404D48    call        @FillChar
 00404D4D    lea         eax,[ebx+250]
 00404D53    mov         dword ptr [ebx+14],eax
 00404D56    mov         word ptr [ebx+4],0D7B0
 00404D5C    movzx       eax,byte ptr ds:[784029]
 00404D63    mov         word ptr [ebx+6],ax
 00404D67    mov         dword ptr [ebx+8],80
 00404D6E    mov         dword ptr [ebx+18],404B88;TextOpen:Integer
 00404D75    mov         eax,edi
 00404D77    call        @PWCharLen
 00404D7C    mov         esi,eax
 00404D7E    mov         eax,edi
 00404D80    lea         edx,[ebx+48]
 00404D83    mov         ecx,esi
 00404D85    add         ecx,ecx
 00404D87    call        Move
 00404D8C    mov         word ptr [ebx+esi*2+48],0
 00404D93    xor         eax,eax
 00404D95    pop         edi
 00404D96    pop         esi
 00404D97    pop         ebx
 00404D98    ret
*}
end;

//00404D9C
function InternalFlush(var t:TTextRec; Func:TTextIOFunc):Integer;
begin
{*
 00404D9C    push        ebx
 00404D9D    movzx       ecx,word ptr [eax+4]
 00404DA1    sub         cx,0D7B1
>00404DA6    je          00404DB7
 00404DA8    dec         ecx
 00404DA9    sub         cx,2
>00404DAD    jae         00404DBB
 00404DAF    mov         ebx,edx
 00404DB1    call        ebx
 00404DB3    mov         ebx,eax
>00404DB5    jmp         00404DD2
 00404DB7    xor         ebx,ebx
>00404DB9    jmp         00404DD2
 00404DBB    cmp         eax,78E32C
>00404DC0    je          00404DC9
 00404DC2    cmp         eax,78E5FC
>00404DC7    jne         00404DCD
 00404DC9    xor         ebx,ebx
>00404DCB    jmp         00404DD2
 00404DCD    mov         ebx,67
 00404DD2    test        ebx,ebx
>00404DD4    je          00404DDD
 00404DD6    mov         eax,ebx
 00404DD8    call        SetInOutRes
 00404DDD    mov         eax,ebx
 00404DDF    pop         ebx
 00404DE0    ret
*}
end;

//00404DE4
function Flush(var t:Text):Integer;
begin
{*
 00404DE4    mov         edx,dword ptr [eax+1C]
 00404DE7    call        InternalFlush
 00404DEC    ret
*}
end;

//00404DF0
procedure @Flush(var F:TFileRec);
begin
{*
 00404DF0    mov         edx,dword ptr [eax+20]
 00404DF3    call        InternalFlush
 00404DF8    ret
*}
end;

//00404DFC
function kernel32.ReadFile(var Buffer:void ; nNumberOfBytesToRead:DWORD; var lpNumberOfBytesRead:DWORD; lpOverlapped:POverlapped):LongBool; stdcall;
begin
{*
 00404DFC    jmp         dword ptr ds:[825F20]
*}
end;

//00404E04
function kernel32.WriteFile(const Buffer:void ; nNumberOfBytesToWrite:Cardinal; var lpNumberOfBytesWritten:Cardinal; lpOverlapped:Pointer):Integer; stdcall;
begin
{*
 00404E04    jmp         dword ptr ds:[825F0C]
*}
end;

//00404E0C
function BlockIO(var f:TFileRec; buffer:Pointer; recCnt:Cardinal; var recsDone:Integer; ModeMask:Integer; IOProc:TIOProc; ErrorNo:Integer):Cardinal;
begin
{*
 00404E0C    push        ebp
 00404E0D    mov         ebp,esp
 00404E0F    push        ecx
 00404E10    push        ebx
 00404E11    push        esi
 00404E12    push        edi
 00404E13    mov         esi,ecx
 00404E15    mov         edi,edx
 00404E17    mov         ebx,eax
 00404E19    mov         eax,dword ptr [ebp+10]
 00404E1C    movzx       edx,word ptr [ebx+4]
 00404E20    and         edx,eax
 00404E22    cmp         eax,edx
>00404E24    jne         00404E80
 00404E26    push        0
 00404E28    lea         eax,[ebp-4]
 00404E2B    push        eax
 00404E2C    mov         eax,dword ptr [ebx+8]
 00404E2F    imul        esi
 00404E31    push        eax
 00404E32    push        edi
 00404E33    mov         eax,dword ptr [ebx]
 00404E35    push        eax
 00404E36    call        dword ptr [ebp+0C]
 00404E39    test        eax,eax
>00404E3B    jne         00404E4E
 00404E3D    call        kernel32.GetLastError
 00404E42    call        SetInOutRes
 00404E47    xor         eax,eax
 00404E49    mov         dword ptr [ebp-4],eax
>00404E4C    jmp         00404E8F
 00404E4E    mov         ecx,dword ptr [ebx+8]
 00404E51    mov         eax,dword ptr [ebp-4]
 00404E54    xor         edx,edx
 00404E56    div         eax,ecx
 00404E58    mov         dword ptr [ebp-4],eax
 00404E5B    mov         eax,dword ptr [ebp+14]
 00404E5E    test        eax,eax
>00404E60    je          00404E6C
 00404E62    mov         eax,dword ptr [ebp+14]
 00404E65    mov         edx,dword ptr [ebp-4]
 00404E68    mov         dword ptr [eax],edx
>00404E6A    jmp         00404E8F
 00404E6C    cmp         esi,dword ptr [ebp-4]
>00404E6F    je          00404E8F
 00404E71    mov         eax,dword ptr [ebp+8]
 00404E74    call        SetInOutRes
 00404E79    xor         eax,eax
 00404E7B    mov         dword ptr [ebp-4],eax
>00404E7E    jmp         00404E8F
 00404E80    mov         eax,67
 00404E85    call        SetInOutRes
 00404E8A    xor         eax,eax
 00404E8C    mov         dword ptr [ebp-4],eax
 00404E8F    mov         eax,dword ptr [ebp-4]
 00404E92    pop         edi
 00404E93    pop         esi
 00404E94    pop         ebx
 00404E95    pop         ecx
 00404E96    pop         ebp
 00404E97    ret         10
*}
end;

//00404E9C
function @BlockRead(var F:TFileRec; buffer:Pointer; recCnt:Longint; var recsRead:Longint):Longint;
begin
{*
 00404E9C    push        ebp
 00404E9D    mov         ebp,esp
 00404E9F    push        ebx
 00404EA0    mov         ebx,dword ptr [ebp+8]
 00404EA3    push        ebx
 00404EA4    push        0D7B1
 00404EA9    push        404DFC;kernel32.ReadFile:LongBool
 00404EAE    push        64
 00404EB0    call        BlockIO
 00404EB5    pop         ebx
 00404EB6    pop         ebp
 00404EB7    ret         4
*}
end;

//00404EBC
function @BlockWrite(var F:TFileRec; buffer:Pointer; recCnt:Longint; var recsWritten:Longint):Longint;
begin
{*
 00404EBC    push        ebp
 00404EBD    mov         ebp,esp
 00404EBF    push        ebx
 00404EC0    mov         ebx,dword ptr [ebp+8]
 00404EC3    push        ebx
 00404EC4    push        0D7B2
 00404EC9    push        404E04;kernel32.WriteFile:Integer
 00404ECE    push        65
 00404ED0    call        BlockIO
 00404ED5    pop         ebx
 00404ED6    pop         ebp
 00404ED7    ret         4
*}
end;

//00404EDC
procedure @Close(var F:TFileRec);
begin
{*
 00404EDC    push        ebx
 00404EDD    push        esi
 00404EDE    mov         ebx,eax
 00404EE0    xor         esi,esi
 00404EE2    movzx       eax,word ptr [ebx+4]
 00404EE6    cmp         ax,0D7B1
>00404EEA    jb          00404F1B
 00404EEC    cmp         ax,0D7B3
>00404EF0    ja          00404F1B
 00404EF2    and         ax,0D7B2
 00404EF6    cmp         ax,0D7B2
>00404EFA    jne         00404F03
 00404EFC    mov         eax,ebx
 00404EFE    call        dword ptr [ebx+1C]
 00404F01    mov         esi,eax
 00404F03    test        esi,esi
>00404F05    jne         00404F0E
 00404F07    mov         eax,ebx
 00404F09    call        dword ptr [ebx+24]
 00404F0C    mov         esi,eax
 00404F0E    test        esi,esi
>00404F10    je          00404F2D
 00404F12    mov         eax,esi
 00404F14    call        SetInOutRes
>00404F19    jmp         00404F2D
 00404F1B    cmp         ebx,78E05C
>00404F21    je          00404F2D
 00404F23    mov         eax,67
 00404F28    call        SetInOutRes
 00404F2D    mov         eax,esi
 00404F2F    pop         esi
 00404F30    pop         ebx
 00404F31    ret
*}
end;

//00404F34
function @EofFile(var F:TFileRec):Boolean;
begin
{*
 00404F34    push        ebx
 00404F35    push        esi
 00404F36    mov         ebx,eax
 00404F38    mov         eax,ebx
 00404F3A    call        @FilePos
 00404F3F    mov         esi,eax
 00404F41    mov         eax,ebx
 00404F43    call        @FileSize
 00404F48    cmp         esi,eax
 00404F4A    setge       al
 00404F4D    pop         esi
 00404F4E    pop         ebx
 00404F4F    ret
*}
end;

//00404F50
function @FilePos(var F:TFileRec):Longint;
begin
{*
 00404F50    push        ebx
 00404F51    push        esi
 00404F52    mov         ebx,eax
 00404F54    movzx       eax,word ptr [ebx+4]
 00404F58    cmp         ax,0D7B0
>00404F5C    jbe         00404F8B
 00404F5E    cmp         ax,0D7B3
>00404F62    ja          00404F8B
 00404F64    push        1
 00404F66    push        0
 00404F68    push        0
 00404F6A    mov         eax,dword ptr [ebx]
 00404F6C    push        eax
 00404F6D    call        kernel32.SetFilePointer
 00404F72    mov         esi,eax
 00404F74    cmp         esi,0FFFFFFFF
>00404F77    jne         00404F80
 00404F79    call        InOutError
>00404F7E    jmp         00404F98
 00404F80    mov         eax,esi
 00404F82    xor         edx,edx
 00404F84    div         eax,dword ptr [ebx+8]
 00404F87    mov         esi,eax
>00404F89    jmp         00404F98
 00404F8B    mov         eax,67
 00404F90    call        SetInOutRes
 00404F95    or          esi,0FFFFFFFF
 00404F98    mov         eax,esi
 00404F9A    pop         esi
 00404F9B    pop         ebx
 00404F9C    ret
*}
end;

//00404FA0
function @FileSize(var F:TFileRec):Longint;
begin
{*
 00404FA0    push        ebx
 00404FA1    push        esi
 00404FA2    mov         ebx,eax
 00404FA4    or          esi,0FFFFFFFF
 00404FA7    movzx       eax,word ptr [ebx+4]
 00404FAB    cmp         ax,0D7B0
>00404FAF    jbe         00404FDA
 00404FB1    cmp         ax,0D7B3
>00404FB5    ja          00404FDA
 00404FB7    push        0
 00404FB9    mov         eax,dword ptr [ebx]
 00404FBB    push        eax
 00404FBC    call        kernel32.GetFileSize
 00404FC1    mov         esi,eax
 00404FC3    cmp         esi,0FFFFFFFF
>00404FC6    jne         00404FCF
 00404FC8    call        InOutError
>00404FCD    jmp         00404FE4
 00404FCF    mov         eax,esi
 00404FD1    xor         edx,edx
 00404FD3    div         eax,dword ptr [ebx+8]
 00404FD6    mov         esi,eax
>00404FD8    jmp         00404FE4
 00404FDA    mov         eax,67
 00404FDF    call        SetInOutRes
 00404FE4    mov         eax,esi
 00404FE6    pop         esi
 00404FE7    pop         ebx
 00404FE8    ret
*}
end;

//00404FEC
procedure @FillChar(var dst:Pointer; cnt:Integer; val:Char);
begin
{*
 00404FEC    cmp         edx,20
 00404FEF    mov         ch,cl
>00404FF1    jl          00405032
 00404FF3    mov         word ptr [eax],cx
 00404FF6    mov         word ptr [eax+2],cx
 00404FFA    mov         word ptr [eax+4],cx
 00404FFE    mov         word ptr [eax+6],cx
 00405002    sub         edx,10
 00405005    fld         qword ptr [eax]
 00405007    fst         qword ptr [edx+eax]
 0040500A    fst         qword ptr [edx+eax+8]
 0040500E    mov         ecx,eax
 00405010    and         ecx,7
 00405013    sub         ecx,8
 00405016    sub         eax,ecx
 00405018    add         edx,ecx
 0040501A    add         eax,edx
 0040501C    neg         edx
 0040501E    fst         qword ptr [edx+eax]
 00405021    fst         qword ptr [edx+eax+8]
 00405025    add         edx,10
>00405028    jl          0040501E
 0040502A    ffree       st(0)
 0040502C    fincstp
 0040502E    ret
 0040502F    nop
 00405030    nop
 00405031    nop
 00405032    test        edx,edx
>00405034    jle         00405086
 00405036    mov         byte ptr [edx+eax-1],cl
 0040503A    and         edx,0FFFFFFFE
 0040503D    neg         edx
 0040503F    lea         edx,[edx*2+405086]
 00405046    jmp         edx
 00405048    nop
 00405049    nop
 0040504A    mov         word ptr [eax+1C],cx
 0040504E    mov         word ptr [eax+1A],cx
 00405052    mov         word ptr [eax+18],cx
 00405056    mov         word ptr [eax+16],cx
 0040505A    mov         word ptr [eax+14],cx
 0040505E    mov         word ptr [eax+12],cx
 00405062    mov         word ptr [eax+10],cx
 00405066    mov         word ptr [eax+0E],cx
 0040506A    mov         word ptr [eax+0C],cx
 0040506E    mov         word ptr [eax+0A],cx
 00405072    mov         word ptr [eax+8],cx
 00405076    mov         word ptr [eax+6],cx
 0040507A    mov         word ptr [eax+4],cx
 0040507E    mov         word ptr [eax+2],cx
 00405082    mov         word ptr [eax],cx
 00405085    ret
 00405086    ret
*}
end;

//00405088
function @CloseFile(var f:TFileRec):Integer;
begin
{*
 00405088    push        ebx
 00405089    push        esi
 0040508A    mov         ebx,eax
 0040508C    mov         word ptr [ebx+4],0D7B0
 00405092    xor         esi,esi
 00405094    mov         eax,dword ptr [ebx]
 00405096    call        InternalClose
 0040509B    test        al,al
>0040509D    jne         004050A9
 0040509F    call        InOutError
 004050A4    mov         esi,1
 004050A9    mov         eax,esi
 004050AB    pop         esi
 004050AC    pop         ebx
 004050AD    ret
*}
end;

//004050B0
function OpenFile(var f:TFileRec; recSiz:Integer; mode:Integer):Integer;
begin
{*
 004050B0    push        ebx
 004050B1    push        esi
 004050B2    push        edi
 004050B3    mov         esi,edx
 004050B5    mov         edi,ecx
 004050B7    xor         edx,edx
 004050B9    mov         ebx,eax
 004050BB    mov         dx,word ptr [eax+4]
 004050BF    sub         edx,0D7B0
>004050C5    je          004050DC
 004050C7    cmp         edx,3
>004050CA    ja          00405173
 004050D0    call        dword ptr [ebx+24]
 004050D3    test        eax,eax
>004050D5    je          004050DC
 004050D7    call        SetInOutRes
 004050DC    mov         word ptr [ebx+4],0D7B3
 004050E2    mov         dword ptr [ebx+8],esi
 004050E5    mov         dword ptr [ebx+24],405088;@CloseFile:Integer
 004050EC    mov         dword ptr [ebx+1C],404B18;FileNOPProc:Integer
 004050F3    cmp         word ptr [ebx+48],0
>004050F8    je          0040515A
 004050FA    mov         eax,0C0000000
 004050FF    mov         dl,byte ptr ds:[78400C];gvar_0078400C
 00405105    and         edx,70
 00405108    shr         edx,2
 0040510B    mov         edx,dword ptr [edx+784798]
 00405111    mov         ecx,2
 00405116    sub         edi,3
>00405119    je          0040513C
 0040511B    mov         ecx,3
 00405120    inc         edi
>00405121    je          0040513C
 00405123    mov         eax,40000000
 00405128    inc         edi
 00405129    mov         word ptr [ebx+4],0D7B2
>0040512F    je          0040513C
 00405131    mov         eax,80000000
 00405136    mov         word ptr [ebx+4],0D7B1
 0040513C    push        0
 0040513E    push        80
 00405143    push        ecx
 00405144    push        0
 00405146    push        edx
 00405147    push        eax
 00405148    lea         eax,[ebx+48]
 0040514B    push        eax
 0040514C    call        kernel32.CreateFileW
 00405151    cmp         eax,0FFFFFFFF
>00405154    je          0040517A
 00405156    mov         dword ptr [ebx],eax
>00405158    jmp         0040518A
 0040515A    mov         dword ptr [ebx+24],404B18;FileNOPProc:Integer
 00405161    cmp         edi,3
>00405164    je          0040516A
 00405166    push        0F6
>00405168    jmp         0040516C
 0040516A    push        0F5
 0040516C    call        kernel32.GetStdHandle
>00405171    jmp         00405151
 00405173    mov         eax,66
>00405178    jmp         00405185
 0040517A    mov         word ptr [ebx+4],0D7B0
 00405180    call        kernel32.GetLastError
 00405185    call        SetInOutRes
 0040518A    pop         edi
 0040518B    pop         esi
 0040518C    pop         ebx
 0040518D    ret
*}
end;

//00405190
function @ResetFile(var F:TFileRec; RecSize:Longint):Integer;
begin
{*
 00405190    movzx       ecx,byte ptr ds:[78400C];gvar_0078400C
 00405197    and         cl,3
 0040519A    cmp         cl,2
>0040519D    jbe         004051A1
 0040519F    mov         cl,2
 004051A1    movzx       ecx,cl
 004051A4    call        OpenFile
 004051A9    ret
*}
end;

//004051AC
function @RewritFile(var F:TFileRec; RecSize:Longint):Integer;
begin
{*
 004051AC    mov         ecx,3
 004051B1    call        OpenFile
 004051B6    ret
*}
end;

//004051B8
procedure @Seek(var F:TFileRec; RecNum:Longint);
begin
{*
 004051B8    mov         ecx,eax
 004051BA    movzx       eax,word ptr [eax+4]
 004051BE    sub         eax,0D7B1
 004051C3    cmp         eax,2
>004051C6    ja          004051E1
 004051C8    push        0
 004051CA    mov         eax,dword ptr [ecx+8]
 004051CD    mul         eax,edx
 004051CF    push        0
 004051D1    push        eax
 004051D2    push        dword ptr [ecx]
 004051D4    call        kernel32.SetFilePointer
 004051D9    inc         eax
>004051DA    je          00404614
 004051E0    ret
 004051E1    mov         eax,67
>004051E6    jmp         SetInOutRes
 004051EB    ret
*}
end;

//004051EC
procedure @StrLong(Val:Integer; Width:Integer; S:PShortString);
begin
{*
 004051EC    push        ebx
 004051ED    push        esi
 004051EE    push        edi
 004051EF    push        edx
 004051F0    sub         esp,14
 004051F3    mov         edi,ecx
 004051F5    mov         esi,eax
 004051F7    cdq
 004051F8    xor         eax,edx
 004051FA    sub         eax,edx
 004051FC    mov         ecx,0A
 00405201    xor         ebx,ebx
 00405203    xor         edx,edx
 00405205    div         eax,ecx
 00405207    add         edx,30
 0040520A    mov         byte ptr [esp+ebx],dl
 0040520D    inc         ebx
 0040520E    test        eax,eax
>00405210    jne         00405203
 00405212    test        esi,esi
>00405214    jge         0040521B
 00405216    mov         byte ptr [esp+ebx],2D
 0040521A    inc         ebx
 0040521B    mov         byte ptr [edi],bl
 0040521D    inc         edi
 0040521E    mov         ecx,dword ptr [esp+14]
 00405222    cmp         ecx,0FF
>00405228    jle         0040522F
 0040522A    mov         ecx,0FF
 0040522F    sub         ecx,ebx
>00405231    jle         0040523A
 00405233    add         byte ptr [edi-1],cl
 00405236    mov         al,20
 00405238    rep stos    byte ptr [edi]
 0040523A    mov         al,byte ptr [esp+ebx-1]
 0040523E    mov         byte ptr [edi],al
 00405240    inc         edi
 00405241    dec         ebx
>00405242    jne         0040523A
 00405244    add         esp,18
 00405247    pop         edi
 00405248    pop         esi
 00405249    pop         ebx
 0040524A    ret
*}
end;

//0040524C
function @ValLong(s:AnsiString; var code:Integer):Longint;
begin
{*
 0040524C    push        ebx
 0040524D    push        esi
 0040524E    push        edi
 0040524F    mov         esi,eax
 00405251    push        eax
 00405252    test        eax,eax
>00405254    je          004052DD
 0040525A    xor         eax,eax
 0040525C    xor         ebx,ebx
 0040525E    mov         edi,0CCCCCCC
 00405263    mov         bx,word ptr [esi]
 00405266    add         esi,2
 00405269    cmp         bx,20
>0040526D    je          00405263
 0040526F    mov         ch,0
 00405271    cmp         bx,2D
>00405275    je          004052ED
 00405277    cmp         bx,2B
>0040527B    je          004052EF
 0040527D    cmp         bx,24
>00405281    je          004052F7
 00405283    cmp         bx,78
>00405287    je          004052F7
 00405289    cmp         bx,58
>0040528D    je          004052F7
 0040528F    cmp         bx,30
>00405293    jne         004052AE
 00405295    mov         bx,word ptr [esi]
 00405298    add         esi,2
 0040529B    cmp         bx,78
>0040529F    je          004052F7
 004052A1    cmp         bx,58
>004052A5    je          004052F7
 004052A7    test        bx,bx
>004052AA    je          004052D3
>004052AC    jmp         004052B3
 004052AE    test        bx,bx
>004052B1    je          004052E8
 004052B3    sub         bx,30
 004052B7    cmp         bx,9
>004052BB    ja          004052E8
 004052BD    cmp         eax,edi
>004052BF    ja          004052E8
 004052C1    lea         eax,[eax+eax*4]
 004052C4    add         eax,eax
 004052C6    add         eax,ebx
 004052C8    mov         bx,word ptr [esi]
 004052CB    add         esi,2
 004052CE    test        bx,bx
>004052D1    jne         004052B3
 004052D3    dec         ch
>004052D5    je          004052E2
 004052D7    test        eax,eax
>004052D9    jge         00405343
>004052DB    jmp         004052E8
 004052DD    add         esi,2
>004052E0    jmp         004052E8
 004052E2    neg         eax
>004052E4    jle         00405343
>004052E6    js          00405343
 004052E8    pop         ebx
 004052E9    sub         esi,ebx
>004052EB    jmp         00405346
 004052ED    inc         ch
 004052EF    mov         bx,word ptr [esi]
 004052F2    add         esi,2
>004052F5    jmp         0040527D
 004052F7    mov         edi,0FFFFFFF
 004052FC    mov         bx,word ptr [esi]
 004052FF    add         esi,2
 00405302    test        bx,bx
>00405305    je          004052DD
 00405307    cmp         bx,61
>0040530B    jb          00405311
 0040530D    sub         bx,20
 00405311    sub         bx,30
 00405315    cmp         bx,9
>00405319    jbe         00405329
 0040531B    sub         bx,11
 0040531F    cmp         bx,5
>00405323    ja          004052E8
 00405325    add         bx,0A
 00405329    cmp         eax,edi
>0040532B    ja          004052E8
 0040532D    shl         eax,4
 00405330    add         eax,ebx
 00405332    mov         bx,word ptr [esi]
 00405335    add         esi,2
 00405338    test        bx,bx
>0040533B    jne         00405307
 0040533D    dec         ch
>0040533F    jne         00405343
 00405341    neg         eax
 00405343    pop         ecx
 00405344    xor         esi,esi
 00405346    shr         esi,1
 00405348    mov         dword ptr [edx],esi
 0040534A    pop         edi
 0040534B    pop         esi
 0040534C    pop         ebx
 0040534D    ret
*}
end;

//00405350
function TryOpenForOutput(var t:TTextRec):Boolean;
begin
{*
 00405350    push        ebx
 00405351    mov         ebx,eax
 00405353    cmp         ebx,78E32C
>00405359    je          00405363
 0040535B    cmp         ebx,78E5FC
>00405361    jne         00405375
 00405363    movzx       eax,byte ptr ds:[784029]
 0040536A    mov         word ptr [ebx+6],ax
 0040536E    mov         eax,ebx
 00405370    call        @RewritText
 00405375    cmp         word ptr [ebx+4],0D7B2
 0040537B    sete        al
 0040537E    mov         ebx,eax
 00405380    test        bl,bl
>00405382    jne         0040538E
 00405384    mov         eax,69
 00405389    call        SetInOutRes
 0040538E    mov         eax,ebx
 00405390    pop         ebx
 00405391    ret
*}
end;

//00405394
function @WriteBytes(var t:TTextRec; const b:void ; cnt:Integer):Pointer;
begin
{*
 00405394    push        esi
 00405395    push        edi
 00405396    mov         esi,edx
 00405398    cmp         word ptr [eax+4],0D7B2
>0040539E    je          004053AF
 004053A0    push        eax
 004053A1    push        edx
 004053A2    push        ecx
 004053A3    call        TryOpenForOutput
 004053A8    test        al,al
 004053AA    pop         ecx
 004053AB    pop         edx
 004053AC    pop         eax
>004053AD    je          004053E4
 004053AF    mov         edi,dword ptr [eax+14]
 004053B2    add         edi,dword ptr [eax+0C]
 004053B5    mov         edx,dword ptr [eax+8]
 004053B8    sub         edx,dword ptr [eax+0C]
 004053BB    cmp         edx,ecx
>004053BD    jg          004053DF
 004053BF    add         dword ptr [eax+0C],edx
 004053C2    sub         ecx,edx
 004053C4    push        eax
 004053C5    push        ecx
 004053C6    mov         ecx,edx
 004053C8    rep movs    byte ptr [edi],byte ptr [esi]
 004053CA    call        dword ptr [eax+1C]
 004053CD    test        eax,eax
>004053CF    jne         004053D5
 004053D1    pop         ecx
 004053D2    pop         eax
>004053D3    jmp         004053AF
 004053D5    call        SetInOutRes
 004053DA    pop         ecx
 004053DB    pop         eax
 004053DC    pop         edi
 004053DD    pop         esi
 004053DE    ret
 004053DF    add         dword ptr [eax+0C],ecx
 004053E2    rep movs    byte ptr [edi],byte ptr [esi]
 004053E4    pop         edi
 004053E5    pop         esi
 004053E6    ret
*}
end;

//004053E8
function @WriteSpaces(var t:TTextRec; cnt:Integer):Pointer;
begin
{*
 004053E8    mov         ecx,edx
 004053EA    mov         edx,405418
 004053EF    cmp         ecx,40
>004053F2    jle         00405458
 004053F4    sub         ecx,40
 004053F7    push        eax
 004053F8    push        ecx
 004053F9    mov         ecx,40
 004053FE    call        @WriteBytes
 00405403    call        @GetTls
 00405408    cmp         dword ptr [eax+4],0;{InOutRes:Integer}
>0040540F    jne         00405415
 00405411    pop         ecx
 00405412    pop         eax
>00405413    jmp         004053EA
 00405415    pop         ecx
 00405416    pop         eax
 00405417    ret
 00405418    and         byte ptr [eax],ah
 0040541A    and         byte ptr [eax],ah
 0040541C    and         byte ptr [eax],ah
 0040541E    and         byte ptr [eax],ah
 00405420    and         byte ptr [eax],ah
 00405422    and         byte ptr [eax],ah
 00405424    and         byte ptr [eax],ah
 00405426    and         byte ptr [eax],ah
 00405428    and         byte ptr [eax],ah
 0040542A    and         byte ptr [eax],ah
 0040542C    and         byte ptr [eax],ah
 0040542E    and         byte ptr [eax],ah
 00405430    and         byte ptr [eax],ah
 00405432    and         byte ptr [eax],ah
 00405434    and         byte ptr [eax],ah
 00405436    and         byte ptr [eax],ah
 00405438    and         byte ptr [eax],ah
 0040543A    and         byte ptr [eax],ah
 0040543C    and         byte ptr [eax],ah
 0040543E    and         byte ptr [eax],ah
 00405440    and         byte ptr [eax],ah
 00405442    and         byte ptr [eax],ah
 00405444    and         byte ptr [eax],ah
 00405446    and         byte ptr [eax],ah
 00405448    and         byte ptr [eax],ah
 0040544A    and         byte ptr [eax],ah
 0040544C    and         byte ptr [eax],ah
 0040544E    and         byte ptr [eax],ah
 00405450    and         byte ptr [eax],ah
 00405452    and         byte ptr [eax],ah
 00405454    and         byte ptr [eax],ah
 00405456    and         byte ptr [eax],ah
 00405458    test        ecx,ecx
>0040545A    jg          00405394
 00405460    ret
*}
end;

//00405464
procedure @WriteLString(var T:TTextRec; S:AnsiString; Width:Longint);
begin
{*
 00405464    push        ebx
 00405465    push        esi
 00405466    mov         ebx,edx
 00405468    mov         edx,ecx
 0040546A    xor         ecx,ecx
 0040546C    test        ebx,ebx
>0040546E    je          00405475
 00405470    mov         ecx,dword ptr [ebx-4]
 00405473    sub         edx,ecx
 00405475    push        ecx
 00405476    call        @WriteSpaces
 0040547B    pop         ecx
 0040547C    mov         edx,ebx
 0040547E    pop         esi
 0040547F    pop         ebx
>00405480    jmp         @WriteBytes
 00405485    ret
*}
end;

//00405488
procedure @Write0Bool(var T:TTextRec; Val:Boolean);
begin
{*
 00405488    xor         ecx,ecx
 0040548A    call        @WriteBool
 0040548F    ret
*}
end;

//00405490
procedure @WriteBool(var T:TTextRec; Val:Boolean; Width:Longint);
begin
{*
 00405490    push        ebp
 00405491    mov         ebp,esp
 00405493    push        0
 00405495    push        ebx
 00405496    push        esi
 00405497    push        edi
 00405498    mov         edi,ecx
 0040549A    mov         esi,edx
 0040549C    mov         ebx,eax
 0040549E    xor         eax,eax
 004054A0    push        ebp
 004054A1    push        4054F1
 004054A6    push        dword ptr fs:[eax]
 004054A9    mov         dword ptr fs:[eax],esp
 004054AC    mov         eax,esi
 004054AE    call        @UStrLen
 004054B3    mov         edx,edi
 004054B5    sub         edx,eax
 004054B7    mov         eax,ebx
 004054B9    call        @WriteSpaces
 004054BE    lea         eax,[ebp-4]
 004054C1    mov         edx,esi
 004054C3    mov         ecx,0
 004054C8    call        @LStrFromUStr
 004054CD    mov         edx,dword ptr [ebp-4]
 004054D0    mov         eax,ebx
 004054D2    xor         ecx,ecx
 004054D4    call        @WriteLString
 004054D9    mov         ebx,eax
 004054DB    xor         eax,eax
 004054DD    pop         edx
 004054DE    pop         ecx
 004054DF    pop         ecx
 004054E0    mov         dword ptr fs:[eax],edx
 004054E3    push        4054F8
 004054E8    lea         eax,[ebp-4]
 004054EB    call        @LStrClr
 004054F0    ret
>004054F1    jmp         @HandleFinally
>004054F6    jmp         004054E8
 004054F8    mov         eax,ebx
 004054FA    pop         edi
 004054FB    pop         esi
 004054FC    pop         ebx
 004054FD    pop         ecx
 004054FE    pop         ebp
 004054FF    ret
*}
end;

//00405500
procedure @WriteLn(var T:TTextRec);
begin
{*
 00405500    push        ebx
 00405501    push        esi
 00405502    push        ecx
 00405503    mov         ebx,eax
 00405505    test        byte ptr [ebx+6],1
>00405509    je          00405526
 0040550B    mov         byte ptr [esp],0D
 0040550F    mov         byte ptr [esp+1],0A
 00405514    mov         edx,esp
 00405516    mov         eax,ebx
 00405518    mov         ecx,2
 0040551D    call        @WriteBytes
 00405522    mov         esi,eax
>00405524    jmp         0040553A
 00405526    mov         byte ptr [esp],0A
 0040552A    mov         edx,esp
 0040552C    mov         eax,ebx
 0040552E    mov         ecx,1
 00405533    call        @WriteBytes
 00405538    mov         esi,eax
 0040553A    mov         eax,ebx
 0040553C    call        @Flush
 00405541    mov         eax,esi
 00405543    pop         edx
 00405544    pop         esi
 00405545    pop         ebx
 00405546    ret
*}
end;

//00405548
procedure @SetElem(var Dest:SET; Elem:Byte; Size:Byte);
begin
{*
 00405548    push        ebx
 00405549    push        edi
 0040554A    mov         edi,eax
 0040554C    xor         ebx,ebx
 0040554E    mov         bl,cl
 00405550    mov         ecx,ebx
 00405552    xor         eax,eax
 00405554    rep stos    byte ptr [edi]
 00405556    sub         edi,ebx
 00405558    inc         eax
 00405559    mov         cl,dl
 0040555B    rol         al,cl
 0040555D    shr         ecx,3
 00405560    cmp         ecx,ebx
>00405562    jae         00405567
 00405564    or          byte ptr [ecx+edi],al
 00405567    pop         edi
 00405568    pop         ebx
 00405569    ret
*}
end;

//0040556C
procedure @SetEq;
begin
{*
 0040556C    push        esi
 0040556D    push        edi
 0040556E    mov         esi,eax
 00405570    mov         edi,edx
 00405572    and         ecx,0FF
 00405578    dec         ecx
>00405579    je          0040558F
 0040557B    movzx       eax,word ptr [ecx+esi-1]
 00405580    movzx       edx,word ptr [ecx+edi-1]
 00405585    cmp         eax,edx
>00405587    jne         0040558C
 00405589    dec         ecx
>0040558A    jne         00405578
 0040558C    pop         edi
 0040558D    pop         esi
 0040558E    ret
 0040558F    mov         al,byte ptr [ecx+esi]
 00405592    mov         dl,byte ptr [ecx+edi]
 00405595    cmp         al,dl
>00405597    jne         0040558C
 00405599    or          ecx,ecx
 0040559B    pop         edi
 0040559C    pop         esi
 0040559D    ret
*}
end;

//004055A0
procedure @SetUnion;
begin
{*
 004055A0    mov         ch,byte ptr [edx]
 004055A2    inc         edx
 004055A3    or          byte ptr [eax],ch
 004055A5    inc         eax
 004055A6    dec         cl
>004055A8    jne         004055A0
 004055AA    ret
*}
end;

//004055AC
procedure @SetSub;
begin
{*
 004055AC    mov         ch,byte ptr [edx]
 004055AE    not         ch
 004055B0    inc         edx
 004055B1    and         byte ptr [eax],ch
 004055B3    inc         eax
 004055B4    dec         cl
>004055B6    jne         004055AC
 004055B8    ret
*}
end;

//004055BC
procedure @ValExt(s:AnsiString; var code:Integer);
begin
{*
 004055BC    push        ebx
 004055BD    xor         ebx,ebx
 004055BF    push        esi
 004055C0    push        edi
 004055C1    push        ebx
 004055C2    mov         esi,eax
 004055C4    push        eax
 004055C5    fldz
 004055C7    xor         eax,eax
 004055C9    xor         ebx,ebx
 004055CB    xor         edi,edi
 004055CD    push        ebx
 004055CE    test        esi,esi
>004055D0    je          004056E7
 004055D6    mov         bx,word ptr [esi]
 004055D9    add         esi,2
 004055DC    cmp         bx,20
>004055E0    je          004055D6
 004055E2    mov         ch,0
 004055E4    cmp         bx,2D
>004055E8    je          004055F2
 004055EA    cmp         bx,2B
>004055EE    je          004055F4
>004055F0    jmp         004055FA
 004055F2    inc         ch
 004055F4    mov         bx,word ptr [esi]
 004055F7    add         esi,2
 004055FA    test        bx,bx
>004055FD    je          004056EA
 00405603    mov         edi,dword ptr [esp+8]
 00405607    sub         bx,30
 0040560B    cmp         bx,9
>0040560F    ja          0040562A
 00405611    fmul        qword ptr [edi+7847B8]
 00405617    mov         dword ptr [esp],ebx
 0040561A    fiadd       dword ptr [esp]
 0040561D    mov         bx,word ptr [esi]
 00405620    add         esi,2
 00405623    test        bx,bx
>00405626    jne         00405607
>00405628    jmp         0040565D
 0040562A    cmp         bx,0FFFFFFFE
>0040562E    jne         00405661
 00405630    mov         bx,word ptr [esi]
 00405633    add         esi,2
 00405636    test        bx,bx
>00405639    je          0040565D
 0040563B    sub         bx,30
 0040563F    cmp         bx,9
>00405643    ja          00405661
 00405645    fmul        qword ptr [edi+7847B8]
 0040564B    mov         dword ptr [esp],ebx
 0040564E    fiadd       dword ptr [esp]
 00405651    dec         eax
 00405652    mov         bx,word ptr [esi]
 00405655    add         esi,2
 00405658    test        bx,bx
>0040565B    jne         0040563B
 0040565D    xor         edi,edi
>0040565F    jmp         004056C7
 00405661    cmp         bx,15
>00405665    je          0040566D
 00405667    cmp         bx,35
>0040566B    jne         004056EA
 0040566D    mov         bx,word ptr [esi]
 00405670    add         esi,2
 00405673    mov         ah,0
 00405675    cmp         bx,2D
>00405679    je          00405683
 0040567B    cmp         bx,2B
>0040567F    je          00405685
>00405681    jmp         0040568B
 00405683    inc         ah
 00405685    mov         bx,word ptr [esi]
 00405688    add         esi,2
 0040568B    sub         bx,30
 0040568F    cmp         bx,9
>00405693    ja          004056EA
 00405695    mov         edi,ebx
 00405697    mov         bx,word ptr [esi]
 0040569A    add         esi,2
 0040569D    test        bx,bx
>004056A0    je          004056BE
 004056A2    sub         bx,30
 004056A6    cmp         bx,9
>004056AA    ja          004056EA
 004056AC    lea         edi,[edi+edi*4]
 004056AF    add         edi,edi
 004056B1    add         edi,ebx
 004056B3    mov         bx,word ptr [esi]
 004056B6    add         esi,2
 004056B9    test        bx,bx
>004056BC    jne         004056A2
 004056BE    dec         ah
>004056C0    jne         004056C4
 004056C2    neg         edi
 004056C4    movsx       eax,al
 004056C7    add         eax,edi
 004056C9    push        edx
 004056CA    push        ecx
 004056CB    call        @Pow10
 004056D0    pop         ecx
 004056D1    pop         edx
 004056D2    dec         ch
>004056D4    je          004056E3
 004056D6    add         esp,0C
 004056D9    xor         esi,esi
 004056DB    shr         esi,1
 004056DD    mov         dword ptr [edx],esi
 004056DF    pop         edi
 004056E0    pop         esi
 004056E1    pop         ebx
 004056E2    ret
 004056E3    fchs
>004056E5    jmp         004056D6
 004056E7    add         esi,2
 004056EA    pop         eax
 004056EB    pop         ebx
 004056EC    sub         esi,ebx
 004056EE    add         esp,4
>004056F1    jmp         004056DB
 004056F3    ret
*}
end;

//004056F4
procedure FPower10;
begin
{*
>004056F4    jmp         @Pow10
 004056F9    ret
*}
end;

//004056FC
procedure @Pow10;
begin
{*
 004056FC    push        ebx
 004056FD    xor         ebx,ebx
 004056FF    test        eax,eax
>00405701    jl          00405750
>00405703    je          004057A3
 00405709    cmp         eax,1400
>0040570E    jge         00405795
 00405714    mov         edx,eax
 00405716    and         edx,1F
 00405719    lea         edx,[edx+edx*4]
 0040571C    fld         tbyte ptr [ebx+edx*2+4057AF]
 00405723    fmulp       st(1),st
 00405725    shr         eax,5
>00405728    je          004057A3
 0040572A    mov         edx,eax
 0040572C    and         edx,0F
>0040572F    je          0040573D
 00405731    lea         edx,[edx+edx*4]
 00405734    fld         tbyte ptr [ebx+edx*2+4058E5]
 0040573B    fmulp       st(1),st
 0040573D    shr         eax,4
>00405740    je          004057A3
 00405742    lea         eax,[eax+eax*4]
 00405745    fld         tbyte ptr [ebx+eax*2+40597B]
 0040574C    fmulp       st(1),st
>0040574E    jmp         004057A3
 00405750    neg         eax
 00405752    cmp         eax,1400
>00405757    jge         0040579F
 00405759    mov         edx,eax
 0040575B    and         edx,1F
 0040575E    lea         edx,[edx+edx*4]
 00405761    fld         tbyte ptr [ebx+edx*2+4057AF]
 00405768    fdivp       st(1),st
 0040576A    shr         eax,5
>0040576D    je          004057A3
 0040576F    mov         edx,eax
 00405771    and         edx,0F
>00405774    je          00405782
 00405776    lea         edx,[edx+edx*4]
 00405779    fld         tbyte ptr [ebx+edx*2+4058E5]
 00405780    fdivp       st(1),st
 00405782    shr         eax,4
>00405785    je          004057A3
 00405787    lea         eax,[eax+eax*4]
 0040578A    fld         tbyte ptr [ebx+eax*2+40597B]
 00405791    fdivp       st(1),st
>00405793    jmp         004057A3
 00405795    fstp        st(0)
 00405797    fld         tbyte ptr [ebx+4057A5]
>0040579D    jmp         004057A3
 0040579F    fstp        st(0)
 004057A1    fldz
 004057A3    pop         ebx
 004057A4    ret
*}
end;

//004059E0
procedure @FpuInit;
begin
{*
 004059E0    fninit
 004059E2    wait
 004059E3    fldcw       word ptr ds:[784024];gvar_00784024
 004059E9    ret
*}
end;

//004059EC
procedure @BoundErr;
begin
{*
 004059EC    mov         al,4
>004059EE    jmp         Error
 004059F3    ret
*}
end;

//004059F4
procedure @IntOver;
begin
{*
 004059F4    mov         al,5
>004059F6    jmp         Error
 004059FB    ret
*}
end;

//004059FC
function TObject.ClassType:TClass;
begin
{*
 004059FC    mov         eax,dword ptr [eax]
 004059FE    mov         edx,eax
 00405A00    mov         eax,edx
 00405A02    ret
*}
end;

//00405A04
function TObject.ClassName:string;
begin
{*
 00405A04    push        ebx
 00405A05    push        esi
 00405A06    mov         esi,edx
 00405A08    mov         ebx,eax
 00405A0A    mov         edx,esi
 00405A0C    add         ebx,0FFFFFFC8
 00405A0F    mov         eax,dword ptr [ebx]
 00405A11    call        UTF8ToString
 00405A16    pop         esi
 00405A17    pop         ebx
 00405A18    ret
*}
end;

//00405A1C
function TObject.ClassNameIs(Name:string):Boolean;
begin
{*
 00405A1C    push        ebp
 00405A1D    mov         ebp,esp
 00405A1F    push        0
 00405A21    push        ebx
 00405A22    push        esi
 00405A23    mov         esi,edx
 00405A25    mov         ebx,eax
 00405A27    xor         eax,eax
 00405A29    push        ebp
 00405A2A    push        405A8A
 00405A2F    push        dword ptr fs:[eax]
 00405A32    mov         dword ptr fs:[eax],esp
 00405A35    lea         edx,[ebp-4]
 00405A38    mov         eax,ebx
 00405A3A    call        TObject.ClassName
 00405A3F    mov         eax,esi
 00405A41    call        @UStrLen
 00405A46    push        eax
 00405A47    mov         eax,esi
 00405A49    call        @UStrToPWChar
 00405A4E    push        eax
 00405A4F    mov         eax,dword ptr [ebp-4]
 00405A52    call        @UStrLen
 00405A57    push        eax
 00405A58    mov         eax,dword ptr [ebp-4]
 00405A5B    call        @UStrToPWChar
 00405A60    push        eax
 00405A61    push        1
 00405A63    mov         eax,[0078E8D8]
 00405A68    push        eax
 00405A69    call        kernel32.CompareStringW
 00405A6E    cmp         eax,2
 00405A71    sete        bl
 00405A74    xor         eax,eax
 00405A76    pop         edx
 00405A77    pop         ecx
 00405A78    pop         ecx
 00405A79    mov         dword ptr fs:[eax],edx
 00405A7C    push        405A91
 00405A81    lea         eax,[ebp-4]
 00405A84    call        @UStrClr
 00405A89    ret
>00405A8A    jmp         @HandleFinally
>00405A8F    jmp         00405A81
 00405A91    mov         eax,ebx
 00405A93    pop         esi
 00405A94    pop         ebx
 00405A95    pop         ecx
 00405A96    pop         ebp
 00405A97    ret
*}
end;

//00405A98
function TObject.ClassParent:TClass;
begin
{*
 00405A98    mov         eax,dword ptr [eax-30]
 00405A9B    test        eax,eax
>00405A9D    je          00405AA1
 00405A9F    mov         eax,dword ptr [eax]
 00405AA1    ret
*}
end;

//00405AA4
function TObject.NewInstance:TObject;
begin
{*
 00405AA4    push        ebx
 00405AA5    mov         ebx,eax
 00405AA7    mov         eax,ebx
 00405AA9    call        TObject.InstanceSize
 00405AAE    call        @GetMem
 00405AB3    mov         edx,eax
 00405AB5    mov         eax,ebx
 00405AB7    call        TObject.InitInstance
 00405ABC    pop         ebx
 00405ABD    ret
*}
end;

//00405AC0
procedure TObject.FreeInstance;
begin
{*
 00405AC0    push        ebx
 00405AC1    mov         ebx,eax
 00405AC3    mov         eax,ebx
 00405AC5    call        TObject.CleanupInstance
 00405ACA    mov         eax,ebx
 00405ACC    call        @FreeMem
 00405AD1    pop         ebx
 00405AD2    ret
*}
end;

//00405AD4
function TObject.InstanceSize:Integer;
begin
{*
 00405AD4    add         eax,0FFFFFFCC
 00405AD7    mov         eax,dword ptr [eax]
 00405AD9    ret
*}
end;

//00405ADC
constructor TObject.Create();
begin
{*
 00405ADC    test        dl,dl
>00405ADE    je          00405AE8
 00405AE0    add         esp,0FFFFFFF0
 00405AE3    call        @ClassCreate
 00405AE8    test        dl,dl
>00405AEA    je          00405AFB
 00405AEC    call        @AfterConstruction
 00405AF1    pop         dword ptr fs:[0]
 00405AF8    add         esp,0C
 00405AFB    ret
*}
end;

//00405AFC
destructor TObject.Destroy();
begin
{*
 00405AFC    call        @BeforeDestruction
 00405B01    test        dl,dl
>00405B03    jle         00405B0A
 00405B05    call        @ClassDestroy
 00405B0A    ret
*}
end;

//00405B0C
procedure TObject.Free;
begin
{*
 00405B0C    test        eax,eax
>00405B0E    je          00405B17
 00405B10    mov         dl,1
 00405B12    mov         ecx,dword ptr [eax]
 00405B14    call        dword ptr [ecx-4]
 00405B17    ret
*}
end;

//00405B18
function TObject.InitInstance(Instance:Pointer):TObject;
begin
{*
 00405B18    push        ebx
 00405B19    push        esi
 00405B1A    push        edi
 00405B1B    mov         ebx,eax
 00405B1D    mov         edi,edx
 00405B1F    stos        dword ptr [edi]
 00405B20    mov         ecx,dword ptr [ebx-34]
 00405B23    xor         eax,eax
 00405B25    push        ecx
 00405B26    shr         ecx,2
 00405B29    dec         ecx
 00405B2A    rep stos    dword ptr [edi]
 00405B2C    pop         ecx
 00405B2D    and         ecx,3
 00405B30    rep stos    byte ptr [edi]
 00405B32    mov         eax,edx
 00405B34    mov         edx,esp
 00405B36    mov         ecx,dword ptr [ebx-54]
 00405B39    test        ecx,ecx
>00405B3B    je          00405B3E
 00405B3D    push        ecx
 00405B3E    mov         ebx,dword ptr [ebx-30]
 00405B41    test        ebx,ebx
>00405B43    je          00405B49
 00405B45    mov         ebx,dword ptr [ebx]
>00405B47    jmp         00405B36
 00405B49    cmp         esp,edx
>00405B4B    je          00405B6A
 00405B4D    pop         ebx
 00405B4E    mov         ecx,dword ptr [ebx]
 00405B50    add         ebx,4
 00405B53    mov         esi,dword ptr [ebx+10]
 00405B56    test        esi,esi
>00405B58    je          00405B60
 00405B5A    mov         edi,dword ptr [ebx+14]
 00405B5D    mov         dword ptr [edi+eax],esi
 00405B60    add         ebx,1C
 00405B63    dec         ecx
>00405B64    jne         00405B53
 00405B66    cmp         esp,edx
>00405B68    jne         00405B4D
 00405B6A    pop         edi
 00405B6B    pop         esi
 00405B6C    pop         ebx
 00405B6D    ret
*}
end;

//00405B70
procedure TObject.CleanupInstance;
begin
{*
 00405B70    push        ebx
 00405B71    push        esi
 00405B72    mov         ebx,eax
 00405B74    mov         esi,eax
 00405B76    mov         esi,dword ptr [esi]
 00405B78    mov         edx,dword ptr [esi-4C]
 00405B7B    mov         esi,dword ptr [esi-30]
 00405B7E    test        edx,edx
>00405B80    je          00405B89
 00405B82    call        @FinalizeRecord
 00405B87    mov         eax,ebx
 00405B89    test        esi,esi
>00405B8B    jne         00405B76
 00405B8D    mov         eax,ebx
 00405B8F    call        TMonitor.Destroy
 00405B94    pop         esi
 00405B95    pop         ebx
 00405B96    ret
*}
end;

//00405B98
function InvokeImplGetter(Self:TObject; ImplGetter:NativeUInt):IInterface;
begin
{*
 00405B98    xchg        edx,ecx
 00405B9A    cmp         ecx,0FF000000
>00405BA0    jae         00405BB3
 00405BA2    cmp         ecx,0FE000000
>00405BA8    jb          00405BB1
 00405BAA    movsx       ecx,cx
 00405BAD    add         ecx,dword ptr [eax]
 00405BAF    jmp         dword ptr [ecx]
 00405BB1    jmp         ecx
 00405BB3    and         ecx,0FFFFFF
 00405BB9    add         ecx,eax
 00405BBB    mov         eax,edx
 00405BBD    mov         edx,dword ptr [ecx]
>00405BBF    jmp         @IntfCopy
 00405BC4    ret
*}
end;

//00405BC8
function TObject.Equals(Obj:TObject):Boolean;
begin
{*
 00405BC8    cmp         eax,edx
 00405BCA    sete        al
 00405BCD    ret
*}
end;

//00405BD0
procedure TObject.GetHashCode;
begin
{*
 00405BD0    ret
*}
end;

//00405BD4
{*function TObject.GetInterface(IID:TGUID; Obj:?):Boolean;
begin
 00405BD4    push        ebp
 00405BD5    mov         ebp,esp
 00405BD7    add         esp,0FFFFFFF8
 00405BDA    push        ebx
 00405BDB    push        esi
 00405BDC    push        edi
 00405BDD    xor         ebx,ebx
 00405BDF    mov         dword ptr [ebp-8],ebx
 00405BE2    mov         ebx,ecx
 00405BE4    mov         dword ptr [ebp-4],edx
 00405BE7    mov         edi,eax
 00405BE9    xor         eax,eax
 00405BEB    push        ebp
 00405BEC    push        405C94
 00405BF1    push        dword ptr fs:[eax]
 00405BF4    mov         dword ptr fs:[eax],esp
 00405BF7    xor         eax,eax
 00405BF9    mov         dword ptr [ebx],eax
 00405BFB    mov         edx,dword ptr [ebp-4]
 00405BFE    mov         eax,dword ptr [edi]
 00405C00    call        TObject.GetInterfaceEntry
 00405C05    mov         esi,eax
 00405C07    test        esi,esi
>00405C09    je          00405C3E
 00405C0B    mov         eax,dword ptr [esi+14]
 00405C0E    test        eax,eax
>00405C10    je          00405C25
 00405C12    add         edi,eax
 00405C14    mov         dword ptr [ebx],edi
 00405C16    cmp         dword ptr [ebx],0
>00405C19    je          00405C76
 00405C1B    mov         eax,dword ptr [ebx]
 00405C1D    push        eax
 00405C1E    mov         eax,dword ptr [eax]
 00405C20    call        dword ptr [eax+4]
>00405C23    jmp         00405C76
 00405C25    lea         ecx,[ebp-8]
 00405C28    mov         edx,dword ptr [esi+18]
 00405C2B    mov         eax,edi
 00405C2D    call        InvokeImplGetter
 00405C32    mov         edx,dword ptr [ebp-8]
 00405C35    mov         eax,ebx
 00405C37    call        @IntfCopy
>00405C3C    jmp         00405C76
 00405C3E    mov         eax,[00784040]
 00405C43    xor         edx,edx
 00405C45    push        edx
 00405C46    push        eax
 00405C47    mov         eax,dword ptr [ebp-4]
 00405C4A    mov         eax,dword ptr [eax]
 00405C4C    xor         edx,edx
 00405C4E    cmp         edx,dword ptr [esp+4]
>00405C52    jne         00405C57
 00405C54    cmp         eax,dword ptr [esp]
 00405C57    pop         edx
 00405C58    pop         eax
>00405C59    jne         00405C76
 00405C5B    mov         eax,dword ptr [ebp-4]
 00405C5E    mov         edx,dword ptr [eax+0C]
 00405C61    mov         eax,dword ptr [eax+8]
 00405C64    cmp         edx,dword ptr ds:[78404C]
>00405C6A    jne         00405C76
 00405C6C    cmp         eax,dword ptr ds:[784048]
>00405C72    jne         00405C76
 00405C74    mov         dword ptr [ebx],edi
 00405C76    cmp         dword ptr [ebx],0
 00405C79    setne       al
 00405C7C    mov         ebx,eax
 00405C7E    xor         eax,eax
 00405C80    pop         edx
 00405C81    pop         ecx
 00405C82    pop         ecx
 00405C83    mov         dword ptr fs:[eax],edx
 00405C86    push        405C9B
 00405C8B    lea         eax,[ebp-8]
 00405C8E    call        @IntfClear
 00405C93    ret
>00405C94    jmp         @HandleFinally
>00405C99    jmp         00405C8B
 00405C9B    mov         eax,ebx
 00405C9D    pop         edi
 00405C9E    pop         esi
 00405C9F    pop         ebx
 00405CA0    pop         ecx
 00405CA1    pop         ecx
 00405CA2    pop         ebp
 00405CA3    ret
end;*}

//00405CA4
function TObject.GetInterfaceEntry(IID:TGUID):PInterfaceEntry;
begin
{*
 00405CA4    push        ebx
 00405CA5    push        esi
 00405CA6    mov         ebx,eax
 00405CA8    mov         eax,dword ptr [ebx-54]
 00405CAB    test        eax,eax
>00405CAD    je          00405CD8
 00405CAF    mov         ecx,dword ptr [eax]
 00405CB1    add         eax,4
 00405CB4    mov         esi,dword ptr [edx]
 00405CB6    cmp         esi,dword ptr [eax]
>00405CB8    jne         00405CD2
 00405CBA    mov         esi,dword ptr [edx+4]
 00405CBD    cmp         esi,dword ptr [eax+4]
>00405CC0    jne         00405CD2
 00405CC2    mov         esi,dword ptr [edx+8]
 00405CC5    cmp         esi,dword ptr [eax+8]
>00405CC8    jne         00405CD2
 00405CCA    mov         esi,dword ptr [edx+0C]
 00405CCD    cmp         esi,dword ptr [eax+0C]
>00405CD0    je          00405CE5
 00405CD2    add         eax,1C
 00405CD5    dec         ecx
>00405CD6    jne         00405CB4
 00405CD8    mov         ebx,dword ptr [ebx-30]
 00405CDB    test        ebx,ebx
>00405CDD    je          00405CE3
 00405CDF    mov         ebx,dword ptr [ebx]
>00405CE1    jmp         00405CA8
 00405CE3    xor         eax,eax
 00405CE5    pop         esi
 00405CE6    pop         ebx
 00405CE7    ret
*}
end;

//00405CE8
function TObject.GetInterfaceTable:PInterfaceTable;
begin
{*
 00405CE8    add         eax,0FFFFFFAC
 00405CEB    mov         eax,dword ptr [eax]
 00405CED    ret
*}
end;

//00405CF0
function TObject.UnitName:string;
begin
{*
 00405CF0    push        ebx
 00405CF1    push        esi
 00405CF2    push        edi
 00405CF3    mov         esi,edx
 00405CF5    call        TObject.ClassInfo
 00405CFA    mov         ebx,eax
 00405CFC    test        ebx,ebx
>00405CFE    je          00405D19
 00405D00    mov         edi,ebx
 00405D02    mov         eax,edi
 00405D04    add         eax,2
 00405D07    inc         edi
 00405D08    movzx       edx,byte ptr [edi]
 00405D0B    add         eax,edx
 00405D0D    add         eax,0A
 00405D10    mov         edx,esi
 00405D12    call        UTF8ToString
>00405D17    jmp         00405D20
 00405D19    mov         eax,esi
 00405D1B    call        @UStrClr
 00405D20    pop         edi
 00405D21    pop         esi
 00405D22    pop         ebx
 00405D23    ret
*}
end;

//00405D24
function @IsClass(Child:TObject; Parent:TClass):Boolean;
begin
{*
 00405D24    push        ebx
 00405D25    push        esi
 00405D26    mov         esi,edx
 00405D28    mov         ebx,eax
 00405D2A    test        ebx,ebx
>00405D2C    je          00405D3B
 00405D2E    mov         edx,esi
 00405D30    mov         eax,dword ptr [ebx]
 00405D32    call        TObject.InheritsFrom
 00405D37    test        al,al
>00405D39    jne         00405D40
 00405D3B    xor         eax,eax
 00405D3D    pop         esi
 00405D3E    pop         ebx
 00405D3F    ret
 00405D40    mov         al,1
 00405D42    pop         esi
 00405D43    pop         ebx
 00405D44    ret
*}
end;

//00405D48
function @AsClass(child:TObject; parent:TClass):TObject;
begin
{*
 00405D48    test        eax,eax
>00405D4A    je          00405D62
 00405D4C    mov         ecx,eax
 00405D4E    mov         ecx,dword ptr [ecx]
 00405D50    cmp         ecx,edx
>00405D52    je          00405D62
 00405D54    mov         ecx,dword ptr [ecx-30]
 00405D57    test        ecx,ecx
>00405D59    jne         00405D4E
 00405D5B    mov         al,0A
>00405D5D    jmp         Error
 00405D62    ret
*}
end;

//00405D64
procedure FindDynaMethod;
begin
{*
 00405D64    push        edi
 00405D65    xchg        eax,esi
>00405D66    jmp         00405D6A
 00405D68    mov         esi,dword ptr [esi]
 00405D6A    mov         edi,dword ptr [esi-3C]
 00405D6D    test        edi,edi
>00405D6F    je          00405D7E
 00405D71    movzx       ecx,word ptr [edi]
 00405D74    push        ecx
 00405D75    add         edi,2
 00405D78    repne scas  word ptr [edi]
>00405D7B    je          00405D87
 00405D7D    pop         ecx
 00405D7E    mov         esi,dword ptr [esi-30]
 00405D81    test        esi,esi
>00405D83    jne         00405D68
 00405D85    pop         edi
 00405D86    ret
 00405D87    pop         eax
 00405D88    add         eax,eax
 00405D8A    sub         eax,ecx
 00405D8C    mov         esi,dword ptr [edi+eax*2-4]
 00405D90    pop         edi
 00405D91    ret
*}
end;

//00405D94
procedure @CallDynaInst;
begin
{*
 00405D94    push        eax
 00405D95    push        ecx
 00405D96    mov         eax,dword ptr [eax]
 00405D98    call        FindDynaMethod
 00405D9D    pop         ecx
 00405D9E    pop         eax
>00405D9F    je          00405DA3
 00405DA1    jmp         esi
 00405DA3    pop         ecx
>00405DA4    jmp         @AbstractError
 00405DA9    ret
*}
end;

//00405DAC
procedure @FindDynaInst;
begin
{*
 00405DAC    push        esi
 00405DAD    mov         esi,edx
 00405DAF    mov         eax,dword ptr [eax]
 00405DB1    call        FindDynaMethod
 00405DB6    mov         eax,esi
 00405DB8    pop         esi
>00405DB9    jne         00405DC1
 00405DBB    pop         ecx
>00405DBC    jmp         @AbstractError
 00405DC1    ret
*}
end;

//00405DC4
function TObject.InheritsFrom(AClass:TClass):Boolean;
begin
{*
>00405DC4    jmp         00405DC8
 00405DC6    mov         eax,dword ptr [eax]
 00405DC8    cmp         eax,edx
>00405DCA    je          00405DD4
 00405DCC    mov         eax,dword ptr [eax-30]
 00405DCF    test        eax,eax
>00405DD1    jne         00405DC6
 00405DD3    ret
 00405DD4    mov         al,1
 00405DD6    ret
*}
end;

//00405DD8
function TObject.ClassInfo:Pointer;
begin
{*
 00405DD8    add         eax,0FFFFFFB8
 00405DDB    mov         eax,dword ptr [eax]
 00405DDD    ret
*}
end;

//00405DE0
function TObject.SafeCallException(ExceptObject:TObject; ExceptAddr:Pointer):HRESULT;
begin
{*
 00405DE0    mov         eax,8000FFFF
 00405DE5    ret
*}
end;

//00405DE8
function TObject.ToString:string;
begin
{*
 00405DE8    push        ebx
 00405DE9    push        esi
 00405DEA    mov         esi,edx
 00405DEC    mov         ebx,eax
 00405DEE    mov         edx,esi
 00405DF0    mov         eax,dword ptr [ebx]
 00405DF2    call        TObject.ClassName
 00405DF7    pop         esi
 00405DF8    pop         ebx
 00405DF9    ret
*}
end;

//00405DFC
{*procedure TObject.DefaultHandler(var Message:?);
begin
 00405DFC    ret
end;*}

//00405E00
procedure TObject.AfterConstruction;
begin
{*
 00405E00    ret
*}
end;

//00405E04
procedure TObject.BeforeDestruction;
begin
{*
 00405E04    ret
*}
end;

//00405E08
{*procedure TObject.Dispatch(var Message:?);
begin
 00405E08    push        esi
 00405E09    mov         si,word ptr [edx]
 00405E0C    or          si,si
>00405E0F    je          00405E28
 00405E11    cmp         si,0C000
>00405E16    jae         00405E28
 00405E18    push        eax
 00405E19    mov         eax,dword ptr [eax]
 00405E1B    call        FindDynaMethod
 00405E20    pop         eax
>00405E21    je          00405E28
 00405E23    mov         ecx,esi
 00405E25    pop         esi
 00405E26    jmp         ecx
 00405E28    pop         esi
 00405E29    mov         ecx,dword ptr [eax]
 00405E2B    jmp         dword ptr [ecx-10]
 00405E2E    ret
end;*}

//00405E30
function UTF8Compare(const Str1:ShortString; const Str2:ShortString):Boolean;
begin
{*
 00405E30    push        ebx
 00405E31    push        esi
 00405E32    add         esp,0FFFFFC00
 00405E38    mov         ebx,edx
 00405E3A    push        100
 00405E3F    lea         edx,[esp+4]
 00405E43    push        edx
 00405E44    movzx       edx,byte ptr [eax]
 00405E47    push        edx
 00405E48    inc         eax
 00405E49    push        eax
 00405E4A    push        0
 00405E4C    push        0FDE9
 00405E51    call        kernel32.MultiByteToWideChar
 00405E56    mov         esi,eax
 00405E58    push        100
 00405E5D    lea         eax,[esp+204]
 00405E64    push        eax
 00405E65    movzx       eax,byte ptr [ebx]
 00405E68    push        eax
 00405E69    lea         eax,[ebx+1]
 00405E6C    push        eax
 00405E6D    push        0
 00405E6F    push        0FDE9
 00405E74    call        kernel32.MultiByteToWideChar
 00405E79    mov         ebx,eax
 00405E7B    push        ebx
 00405E7C    lea         eax,[esp+204]
 00405E83    push        eax
 00405E84    push        esi
 00405E85    lea         eax,[esp+0C]
 00405E89    push        eax
 00405E8A    push        1
 00405E8C    mov         eax,[0078E8D8]
 00405E91    push        eax
 00405E92    call        kernel32.CompareStringW
 00405E97    cmp         eax,2
 00405E9A    sete        al
 00405E9D    add         esp,400
 00405EA3    pop         esi
 00405EA4    pop         ebx
 00405EA5    ret
*}
end;

//00405EA8
function UTF8ShortStringToString(const Str:ShortString):string;
begin
{*
 00405EA8    push        ebx
 00405EA9    push        esi
 00405EAA    mov         esi,edx
 00405EAC    mov         ebx,eax
 00405EAE    mov         edx,esi
 00405EB0    mov         eax,ebx
 00405EB2    call        UTF8ToString
 00405EB7    pop         esi
 00405EB8    pop         ebx
 00405EB9    ret
*}
end;

//00405EBC
function TObject.MethodAddress(Name:ShortString):Pointer;
begin
{*
 00405EBC    push        ebx
 00405EBD    push        esi
 00405EBE    push        edi
 00405EBF    xor         ecx,ecx
 00405EC1    xor         edi,edi
 00405EC3    mov         bl,byte ptr [edx]
>00405EC5    jmp         00405EC9
 00405EC7    mov         eax,dword ptr [eax]
 00405EC9    mov         esi,dword ptr [eax-40]
 00405ECC    test        esi,esi
>00405ECE    je          00405EE9
 00405ED0    mov         di,word ptr [esi]
 00405ED3    test        edi,edi
>00405ED5    je          00405EE9
 00405ED7    add         esi,2
 00405EDA    mov         cl,byte ptr [esi+6]
 00405EDD    cmp         cl,bl
>00405EDF    je          00405F0A
 00405EE1    mov         cx,word ptr [esi]
 00405EE4    add         esi,ecx
 00405EE6    dec         edi
>00405EE7    jne         00405EDA
 00405EE9    mov         eax,dword ptr [eax-30]
 00405EEC    test        eax,eax
>00405EEE    jne         00405EC7
>00405EF0    jmp         00405F28
 00405EF2    mov         bl,byte ptr [edx]
>00405EF4    jmp         00405EE1
 00405EF6    push        eax
 00405EF7    push        edx
 00405EF8    lea         eax,[esi+6]
 00405EFB    call        UTF8Compare
 00405F00    xor         ecx,ecx
 00405F02    test        al,al
 00405F04    pop         edx
 00405F05    pop         eax
>00405F06    je          00405EF2
>00405F08    jmp         00405F25
 00405F0A    mov         ch,0
 00405F0C    mov         bl,byte ptr [ecx+esi+6]
 00405F10    test        bl,80
>00405F13    jne         00405EF6
 00405F15    xor         bl,byte ptr [ecx+edx]
 00405F18    test        bl,80
>00405F1B    jne         00405EF6
 00405F1D    and         bl,0DF
>00405F20    jne         00405EF2
 00405F22    dec         ecx
>00405F23    jne         00405F0C
 00405F25    mov         eax,dword ptr [esi+2]
 00405F28    pop         edi
 00405F29    pop         esi
 00405F2A    pop         ebx
 00405F2B    ret
*}
end;

//00405F2C
function TObject.MethodAddress(Name:string):Pointer;
begin
{*
 00405F2C    push        ebx
 00405F2D    push        esi
 00405F2E    add         esp,0FFFFFF00
 00405F34    mov         esi,edx
 00405F36    mov         ebx,eax
 00405F38    mov         edx,esp
 00405F3A    mov         eax,esi
 00405F3C    call        UTF8EncodeToShortString
 00405F41    mov         edx,esp
 00405F43    mov         eax,ebx
 00405F45    call        TObject.MethodAddress
 00405F4A    add         esp,100
 00405F50    pop         esi
 00405F51    pop         ebx
 00405F52    ret
*}
end;

//00405F54
function TObject.MethodName(Address:Pointer):string;
begin
{*
 00405F54    push        ebx
 00405F55    push        esi
 00405F56    push        edi
 00405F57    mov         edi,ecx
 00405F59    xor         ebx,ebx
 00405F5B    xor         ecx,ecx
>00405F5D    jmp         00405F61
 00405F5F    mov         eax,dword ptr [eax]
 00405F61    mov         esi,dword ptr [eax-40]
 00405F64    test        esi,esi
>00405F66    je          00405F7F
 00405F68    mov         cx,word ptr [esi]
 00405F6B    test        ecx,ecx
>00405F6D    je          00405F7F
 00405F6F    add         esi,2
 00405F72    cmp         edx,dword ptr [esi+2]
>00405F75    je          00405F8F
 00405F77    mov         bx,word ptr [esi]
 00405F7A    add         esi,ebx
 00405F7C    dec         ecx
>00405F7D    jne         00405F72
 00405F7F    mov         eax,dword ptr [eax-30]
 00405F82    test        eax,eax
>00405F84    jne         00405F5F
 00405F86    lea         esi,ds:[405F8E]
>00405F8C    jmp         00405F92
 00405F8E    add         byte ptr [ebx-0F76F93A],al
 00405F94    mov         edx,edi
 00405F96    pop         edi
 00405F97    pop         esi
 00405F98    pop         ebx
>00405F99    jmp         UTF8ShortStringToString
 00405F9E    ret
*}
end;

//00405FA0
function TObject.FieldAddress(Name:ShortString):Pointer;
begin
{*
 00405FA0    push        ebx
 00405FA1    push        esi
 00405FA2    push        edi
 00405FA3    xor         ecx,ecx
 00405FA5    xor         edi,edi
 00405FA7    mov         bl,byte ptr [edx]
 00405FA9    push        eax
 00405FAA    mov         eax,dword ptr [eax]
 00405FAC    mov         esi,dword ptr [eax-44]
 00405FAF    test        esi,esi
>00405FB1    je          00405FCB
 00405FB3    mov         di,word ptr [esi]
 00405FB6    test        edi,edi
>00405FB8    je          00405FCB
 00405FBA    add         esi,6
 00405FBD    mov         cl,byte ptr [esi+6]
 00405FC0    cmp         cl,bl
>00405FC2    je          00405FF0
 00405FC4    lea         esi,[ecx+esi+7]
 00405FC8    dec         edi
>00405FC9    jne         00405FBD
 00405FCB    mov         eax,dword ptr [eax-30]
 00405FCE    test        eax,eax
>00405FD0    jne         00405FAA
 00405FD2    pop         edx
>00405FD3    jmp         0040600E
 00405FD5    mov         bl,byte ptr [edx]
 00405FD7    mov         cl,byte ptr [esi+6]
>00405FDA    jmp         00405FC4
 00405FDC    push        eax
 00405FDD    push        edx
 00405FDE    lea         eax,[esi+6]
 00405FE1    call        UTF8Compare
 00405FE6    xor         ecx,ecx
 00405FE8    test        al,al
 00405FEA    pop         edx
 00405FEB    pop         eax
>00405FEC    je          00405FD5
>00405FEE    jmp         00406009
 00405FF0    mov         bl,byte ptr [ecx+esi+6]
 00405FF4    test        bl,80
>00405FF7    jne         00405FDC
 00405FF9    xor         bl,byte ptr [ecx+edx]
 00405FFC    test        bl,80
>00405FFF    jne         00405FDC
 00406001    and         bl,0DF
>00406004    jne         00405FD5
 00406006    dec         ecx
>00406007    jne         00405FF0
 00406009    mov         eax,dword ptr [esi]
 0040600B    pop         edx
 0040600C    add         eax,edx
 0040600E    pop         edi
 0040600F    pop         esi
 00406010    pop         ebx
 00406011    ret
*}
end;

//00406014
function TObject.FieldAddress(Name:string):Pointer;
begin
{*
 00406014    push        ebx
 00406015    push        esi
 00406016    add         esp,0FFFFFF00
 0040601C    mov         esi,edx
 0040601E    mov         ebx,eax
 00406020    mov         edx,esp
 00406022    mov         eax,esi
 00406024    call        UTF8EncodeToShortString
 00406029    mov         edx,esp
 0040602B    mov         eax,ebx
 0040602D    call        TObject.FieldAddress
 00406032    add         esp,100
 00406038    pop         esi
 00406039    pop         ebx
 0040603A    ret
*}
end;

//0040603C
function @ClassCreate(AClass:TClass; Alloc:Boolean):TObject;
begin
{*
 0040603C    push        edx
 0040603D    push        ecx
 0040603E    push        ebx
 0040603F    test        dl,dl
>00406041    jl          00406046
 00406043    call        dword ptr [eax-0C]
 00406046    xor         edx,edx
 00406048    lea         ecx,[esp+10]
 0040604C    mov         ebx,dword ptr fs:[edx]
 0040604F    mov         dword ptr [ecx],ebx
 00406051    mov         dword ptr [ecx+8],ebp
 00406054    mov         dword ptr [ecx+4],406065
 0040605B    mov         dword ptr [ecx+0C],eax
 0040605E    mov         dword ptr fs:[edx],ecx
 00406061    pop         ebx
 00406062    pop         ecx
 00406063    pop         edx
 00406064    ret
*}
end;

//0040608C
procedure @ClassDestroy(Instance:TObject);
begin
{*
 0040608C    mov         edx,dword ptr [eax]
 0040608E    call        dword ptr [edx-8]
 00406091    ret
*}
end;

//00406094
function @AfterConstruction(Instance:TObject):TObject;
begin
{*
 00406094    push        ebp
 00406095    mov         ebp,esp
 00406097    push        ecx
 00406098    push        ebx
 00406099    push        esi
 0040609A    push        edi
 0040609B    mov         dword ptr [ebp-4],eax
 0040609E    xor         edx,edx
 004060A0    push        ebp
 004060A1    push        4060C3
 004060A6    push        dword ptr fs:[edx]
 004060A9    mov         dword ptr fs:[edx],esp
 004060AC    mov         eax,dword ptr [ebp-4]
 004060AF    mov         edx,dword ptr [eax]
 004060B1    call        dword ptr [edx-1C]
 004060B4    mov         eax,dword ptr [ebp-4]
 004060B7    pop         dword ptr fs:[0]
 004060BE    add         esp,8
>004060C1    jmp         004060DC
>004060C3    jmp         @HandleAnyException
 004060C8    mov         dl,1
 004060CA    mov         eax,dword ptr [ebp-4]
 004060CD    call        @BeforeDestruction
 004060D2    call        @RaiseAgain
 004060D7    call        @DoneExcept
 004060DC    pop         edi
 004060DD    pop         esi
 004060DE    pop         ebx
 004060DF    pop         ecx
 004060E0    pop         ebp
 004060E1    ret
*}
end;

//004060E4
function @BeforeDestruction(Instance:TObject; OuterMost:ShortInt):TObject;
begin
{*
 004060E4    test        dl,dl
>004060E6    jg          004060E9
 004060E8    ret
 004060E9    push        eax
 004060EA    push        edx
 004060EB    mov         edx,dword ptr [eax]
 004060ED    call        dword ptr [edx-18]
 004060F0    pop         edx
 004060F1    pop         eax
 004060F2    ret
*}
end;

//004060F4
procedure TMonitor.TSpinWait.SpinCycle;
begin
{*
 004060F4    push        ebx
 004060F5    push        esi
 004060F6    mov         ebx,eax
 004060F8    mov         eax,dword ptr [ebx]
 004060FA    cmp         eax,0A
>004060FD    jg          00406108
 004060FF    cmp         dword ptr ds:[78E058],1;CPUCount:Integer
>00406106    jg          0040614D
 00406108    cmp         eax,0A
>0040610B    jl          00406114
 0040610D    mov         ecx,eax
 0040610F    sub         ecx,0A
>00406112    jmp         00406116
 00406114    mov         ecx,eax
 00406116    mov         eax,ecx
 00406118    mov         esi,14
 0040611D    cdq
 0040611E    idiv        eax,esi
 00406120    cmp         edx,13
>00406123    jne         0040612E
 00406125    push        1
 00406127    call        kernel32.Sleep
>0040612C    jmp         0040615B
 0040612E    mov         eax,ecx
 00406130    mov         ecx,5
 00406135    cdq
 00406136    idiv        eax,ecx
 00406138    cmp         edx,4
>0040613B    jne         00406146
 0040613D    push        0
 0040613F    call        kernel32.Sleep
>00406144    jmp         0040615B
 00406146    call        kernel32.SwitchToThread
>0040614B    jmp         0040615B
 0040614D    mov         ecx,eax
 0040614F    mov         eax,4
 00406154    shl         eax,cl
 00406156    call        TMonitor.Spin
 0040615B    inc         dword ptr [ebx]
 0040615D    cmp         dword ptr [ebx],0
>00406160    jge         00406168
 00406162    mov         dword ptr [ebx],0A
 00406168    pop         esi
 00406169    pop         ebx
 0040616A    ret
*}
end;

//0040616C
procedure TMonitor.TSpinLock.Enter;
begin
{*
 0040616C    push        ebx
 0040616D    push        esi
 0040616E    push        ecx
 0040616F    mov         esi,eax
 00406171    xor         eax,eax
 00406173    mov         dword ptr [esp],eax
 00406176    mov         ebx,dword ptr [esi]
 00406178    test        ebx,ebx
>0040617A    jne         0040618E
 0040617C    mov         eax,esi
 0040617E    mov         ecx,ebx
 00406180    mov         edx,1
 00406185    call        InterlockedCompareExchange
 0040618A    cmp         ebx,eax
>0040618C    je          00406197
 0040618E    mov         eax,esp
 00406190    call        TMonitor.TSpinWait.SpinCycle
>00406195    jmp         00406176
 00406197    pop         edx
 00406198    pop         esi
 00406199    pop         ebx
 0040619A    ret
*}
end;

//0040619C
procedure TMonitor.TSpinLock.Exit;
begin
{*
 0040619C    xor         edx,edx
 0040619E    call        InterlockedExchange
 004061A3    ret
*}
end;

//004061A4
procedure TMonitor.Spin;
begin
{*
 004061A4    push        ebp
 004061A5    mov         ebp,esp
 004061A7    push        ecx
 004061A8    mov         dword ptr [ebp-4],eax
 004061AB    cmp         dword ptr [ebp-4],0
>004061AF    jle         004061BC
 004061B1    rep nop
 004061B3    dec         dword ptr [ebp-4]
 004061B6    cmp         dword ptr [ebp-4],0
>004061BA    jg          004061B1
 004061BC    pop         ecx
 004061BD    pop         ebp
 004061BE    ret
*}
end;

//004061C0
procedure TMonitor.CheckMonitorSupport;
begin
{*
 004061C0    cmp         dword ptr ds:[78E8CC],0;gvar_0078E8CC
>004061C7    jne         004061D0
 004061C9    mov         al,1A
 004061CB    call        Error
 004061D0    ret
*}
end;

//004061D4
function TMonitor.CheckOwningThread:Cardinal;
begin
{*
 004061D4    push        ebx
 004061D5    mov         ebx,dword ptr [eax+8]
 004061D8    call        kernel32.GetCurrentThreadId
 004061DD    cmp         ebx,eax
>004061DF    je          004061E8
 004061E1    mov         al,19
 004061E3    call        Error
 004061E8    mov         eax,ebx
 004061EA    pop         ebx
 004061EB    ret
*}
end;

//004061EC
function TMonitor.Create:PMonitor;
begin
{*
 004061EC    push        ebx
 004061ED    mov         eax,1C
 004061F2    call        @GetMem
 004061F7    mov         ebx,eax
 004061F9    mov         eax,ebx
 004061FB    xor         ecx,ecx
 004061FD    mov         edx,1C
 00406202    call        @FillChar
 00406207    mov         eax,ebx
 00406209    pop         ebx
 0040620A    ret
*}
end;

//0040620C
procedure TMonitor.Destroy;
begin
{*
 0040620C    call        TMonitor.GetFieldAddress
 00406211    mov         edx,dword ptr [eax]
 00406213    test        edx,edx
>00406215    je          00406222
 00406217    xor         ecx,ecx
 00406219    mov         dword ptr [eax],ecx
 0040621B    mov         eax,edx
 0040621D    call        TMonitor.Destroy
 00406222    ret
*}
end;

//00406224
procedure TMonitor.Destroy;
begin
{*
 00406224    push        ebx
 00406225    push        esi
 00406226    mov         ebx,eax
 00406228    cmp         dword ptr ds:[78E8CC],0;gvar_0078E8CC
>0040622F    je          00406243
 00406231    cmp         dword ptr [ebx+0C],0
>00406235    je          00406243
 00406237    mov         eax,dword ptr [ebx+0C]
 0040623A    mov         esi,dword ptr ds:[78E8CC];gvar_0078E8CC
 00406240    call        dword ptr [esi+4]
 00406243    mov         eax,ebx
 00406245    xor         edx,edx
 00406247    call        @FreeMem
 0040624C    pop         esi
 0040624D    pop         ebx
 0040624E    ret
*}
end;

//00406250
function TMonitor.DequeueWaiter:PWaitingThread;
begin
{*
 00406250    push        ebp
 00406251    mov         ebp,esp
 00406253    add         esp,0FFFFFFF8
 00406256    mov         dword ptr [ebp-4],eax
 00406259    mov         eax,dword ptr [ebp-4]
 0040625C    add         eax,18
 0040625F    call        TMonitor.TSpinLock.Enter
 00406264    xor         ecx,ecx
 00406266    push        ebp
 00406267    push        4062C8
 0040626C    push        dword ptr fs:[ecx]
 0040626F    mov         dword ptr fs:[ecx],esp
 00406272    mov         eax,dword ptr [ebp-4]
 00406275    mov         eax,dword ptr [eax+14]
 00406278    mov         dword ptr [ebp-8],eax
 0040627B    cmp         dword ptr [ebp-8],0
>0040627F    je          0040628B
 00406281    mov         eax,dword ptr [ebp-8]
 00406284    mov         eax,dword ptr [eax]
 00406286    cmp         eax,dword ptr [ebp-8]
>00406289    jne         0040629A
 0040628B    mov         eax,dword ptr [ebp-4]
 0040628E    xor         edx,edx
 00406290    mov         dword ptr [eax+14],edx
 00406293    call        @TryFinallyExit
>00406298    jmp         004062CF
 0040629A    mov         edx,dword ptr [ebp-4]
 0040629D    mov         edx,dword ptr [edx+14]
 004062A0    mov         eax,dword ptr [edx]
 004062A2    mov         dword ptr [ebp-8],eax
 004062A5    mov         ecx,dword ptr [ebp-4]
 004062A8    mov         eax,dword ptr [eax]
 004062AA    mov         ecx,dword ptr [ebp-4]
 004062AD    mov         dword ptr [edx],eax
 004062AF    xor         eax,eax
 004062B1    pop         edx
 004062B2    pop         ecx
 004062B3    pop         ecx
 004062B4    mov         dword ptr fs:[eax],edx
 004062B7    push        4062CF
 004062BC    mov         eax,dword ptr [ebp-4]
 004062BF    add         eax,18
 004062C2    call        TMonitor.TSpinLock.Exit
 004062C7    ret
>004062C8    jmp         @HandleFinally
>004062CD    jmp         004062BC
 004062CF    mov         eax,dword ptr [ebp-8]
 004062D2    pop         ecx
 004062D3    pop         ecx
 004062D4    pop         ebp
 004062D5    ret
*}
end;

//004062D8
function TMonitor.Enter(Timeout:Cardinal):Boolean;
begin
{*
 004062D8    push        ebx
 004062D9    push        esi
 004062DA    push        edi
 004062DB    push        ebp
 004062DC    add         esp,0FFFFFFF4
 004062DF    mov         edi,edx
 004062E1    mov         esi,eax
 004062E3    mov         ebp,dword ptr [esi+10]
 004062E6    mov         eax,esi
 004062E8    call        TMonitor.TryEnter
 004062ED    mov         byte ptr [esp],al
 004062F0    cmp         byte ptr [esp],0
>004062F4    jne         00406461
 004062FA    test        edi,edi
>004062FC    je          00406461
 00406302    mov         byte ptr [esp+1],0
 00406307    test        ebp,ebp
>00406309    jle         00406398
 0040630F    call        kernel32.GetTickCount
 00406314    mov         dword ptr [esp+4],eax
 00406318    test        ebp,ebp
>0040631A    jle         00406373
 0040631C    cmp         edi,0FFFFFFFF
>0040631F    je          00406337
 00406321    call        kernel32.GetTickCount
 00406326    sub         eax,dword ptr [esp+4]
 0040632A    cmp         edi,eax
>0040632C    ja          00406337
 0040632E    mov         byte ptr [esp],0
>00406332    jmp         00406461
 00406337    mov         ebx,dword ptr [esi]
 00406339    cmp         ebx,1
>0040633C    jg          00406373
 0040633E    test        ebx,ebx
>00406340    jne         0040636C
 00406342    mov         eax,esi
 00406344    xor         ecx,ecx
 00406346    mov         edx,1
 0040634B    call        InterlockedCompareExchange
 00406350    test        eax,eax
>00406352    jne         0040636C
 00406354    call        kernel32.GetCurrentThreadId
 00406359    mov         dword ptr [esi+8],eax
 0040635C    mov         dword ptr [esi+4],1
 00406363    mov         byte ptr [esp],1
>00406367    jmp         00406461
 0040636C    rep nop
 0040636E    dec         ebp
 0040636F    test        ebp,ebp
>00406371    jg          0040631C
 00406373    cmp         edi,0FFFFFFFF
>00406376    je          00406398
 00406378    call        kernel32.GetTickCount
 0040637D    mov         dword ptr [esp+8],eax
 00406381    mov         eax,dword ptr [esp+8]
 00406385    sub         eax,dword ptr [esp+4]
 00406389    cmp         edi,eax
>0040638B    ja          00406396
 0040638D    mov         byte ptr [esp],0
>00406391    jmp         00406461
 00406396    sub         edi,eax
 00406398    mov         ebx,dword ptr [esi]
 0040639A    test        ebx,ebx
>0040639C    je          004062E6
 004063A2    lea         edx,[ebx+2]
 004063A5    mov         eax,esi
 004063A7    mov         ecx,ebx
 004063A9    call        InterlockedCompareExchange
 004063AE    cmp         ebx,eax
>004063B0    jne         00406398
 004063B2    call        kernel32.GetTickCount
 004063B7    mov         dword ptr [esp+4],eax
 004063BB    mov         eax,esi
 004063BD    call        TMonitor.GetEvent
 004063C2    mov         edx,eax
 004063C4    mov         ebx,dword ptr ds:[78E8CC];gvar_0078E8CC
 004063CA    mov         ecx,edi
 004063CC    xor         eax,eax
 004063CE    call        dword ptr [ebx+10]
 004063D1    test        eax,eax
 004063D3    sete        byte ptr [esp]
 004063D7    cmp         edi,0FFFFFFFF
>004063DA    je          004063FF
 004063DC    call        kernel32.GetTickCount
 004063E1    mov         dword ptr [esp+8],eax
 004063E5    mov         eax,dword ptr [esp+8]
 004063E9    sub         eax,dword ptr [esp+4]
 004063ED    cmp         edi,eax
>004063EF    jbe         004063FD
 004063F1    mov         eax,dword ptr [esp+8]
 004063F5    sub         eax,dword ptr [esp+4]
 004063F9    sub         edi,eax
>004063FB    jmp         004063FF
 004063FD    xor         edi,edi
 004063FF    cmp         byte ptr [esp],0
>00406403    je          00406428
 00406405    mov         ebx,dword ptr [esi]
 00406407    test        bl,1
>0040640A    jne         00406441
 0040640C    mov         edx,ebx
 0040640E    sub         edx,2
 00406411    or          edx,1
 00406414    mov         eax,esi
 00406416    mov         ecx,ebx
 00406418    call        InterlockedCompareExchange
 0040641D    cmp         ebx,eax
>0040641F    jne         00406405
 00406421    mov         byte ptr [esp+1],1
>00406426    jmp         00406441
 00406428    mov         ebx,dword ptr [esi]
 0040642A    mov         edx,ebx
 0040642C    sub         edx,2
 0040642F    mov         eax,esi
 00406431    mov         ecx,ebx
 00406433    call        InterlockedCompareExchange
 00406438    cmp         ebx,eax
>0040643A    jne         00406428
 0040643C    mov         byte ptr [esp+1],1
 00406441    cmp         byte ptr [esp+1],0
>00406446    je          004063B2
 0040644C    cmp         byte ptr [esp],0
>00406450    je          00406461
 00406452    call        kernel32.GetCurrentThreadId
 00406457    mov         dword ptr [esi+8],eax
 0040645A    mov         dword ptr [esi+4],1
 00406461    movzx       eax,byte ptr [esp]
 00406465    add         esp,0C
 00406468    pop         ebp
 00406469    pop         edi
 0040646A    pop         esi
 0040646B    pop         ebx
 0040646C    ret
*}
end;

//00406470
procedure TMonitor.Exit;
begin
{*
 00406470    push        ebx
 00406471    push        esi
 00406472    mov         esi,eax
 00406474    mov         eax,esi
 00406476    call        TMonitor.CheckOwningThread
 0040647B    dec         dword ptr [esi+4]
 0040647E    cmp         dword ptr [esi+4],0
>00406482    jne         004064B7
 00406484    xor         eax,eax
 00406486    mov         dword ptr [esi+8],eax
 00406489    mov         ebx,dword ptr [esi]
 0040648B    mov         edx,ebx
 0040648D    dec         edx
 0040648E    mov         eax,esi
 00406490    mov         ecx,ebx
 00406492    call        InterlockedCompareExchange
 00406497    cmp         ebx,eax
>00406499    jne         00406489
 0040649B    test        ebx,0FFFFFFFE
>004064A1    je          004064B7
 004064A3    mov         eax,esi
 004064A5    call        TMonitor.GetEvent
 004064AA    mov         ebx,dword ptr ds:[78E8CC];gvar_0078E8CC
 004064B0    xor         ecx,ecx
 004064B2    xor         edx,edx
 004064B4    call        dword ptr [ebx+10]
 004064B7    pop         esi
 004064B8    pop         ebx
 004064B9    ret
*}
end;

//004064BC
procedure TMonitor.Exit;
begin
{*
 004064BC    push        ebx
 004064BD    mov         ebx,eax
 004064BF    call        TMonitor.CheckMonitorSupport
 004064C4    mov         eax,ebx
 004064C6    call        TMonitor.GetMonitor
 004064CB    call        TMonitor.Exit
 004064D0    pop         ebx
 004064D1    ret
*}
end;

//004064D4
function TMonitor.GetEvent:Pointer;
begin
{*
 004064D4    push        ebx
 004064D5    push        esi
 004064D6    push        edi
 004064D7    push        ebp
 004064D8    mov         ebp,eax
 004064DA    mov         esi,1
 004064DF    mov         ebx,dword ptr [ebp+0C]
 004064E2    test        ebx,ebx
>004064E4    jne         00406532
 004064E6    mov         ebx,dword ptr ds:[78E8CC];gvar_0078E8CC
 004064EC    call        dword ptr [ebx]
 004064EE    mov         edi,eax
 004064F0    lea         eax,[ebp+0C]
 004064F3    xor         ecx,ecx
 004064F5    mov         edx,edi
 004064F7    call        InterlockedCompareExchangePointer
 004064FC    mov         ebx,eax
 004064FE    test        ebx,ebx
>00406500    jne         00406506
 00406502    mov         ebx,edi
>00406504    jmp         00406515
 00406506    test        edi,edi
>00406508    je          00406515
 0040650A    mov         edx,dword ptr ds:[78E8CC];gvar_0078E8CC
 00406510    mov         eax,edi
 00406512    call        dword ptr [edx+4]
 00406515    test        ebx,ebx
>00406517    jne         00406532
 00406519    push        esi
 0040651A    call        kernel32.Sleep
 0040651F    cmp         esi,200
>00406525    jle         0040652E
 00406527    mov         esi,1
>0040652C    jmp         004064E6
 0040652E    add         esi,esi
>00406530    jmp         004064E6
 00406532    mov         eax,ebx
 00406534    pop         ebp
 00406535    pop         edi
 00406536    pop         esi
 00406537    pop         ebx
 00406538    ret
*}
end;

//0040653C
function TMonitor.GetFieldAddress:PPMonitor;
begin
{*
 0040653C    mov         edx,dword ptr [eax]
 0040653E    add         edx,0FFFFFFCC
 00406541    mov         edx,dword ptr [edx]
 00406543    add         edx,eax
 00406545    sub         edx,4
 00406548    mov         eax,edx
 0040654A    ret
*}
end;

//0040654C
function TMonitor.GetMonitor:PMonitor;
begin
{*
 0040654C    push        ebx
 0040654D    push        esi
 0040654E    push        edi
 0040654F    call        TMonitor.GetFieldAddress
 00406554    mov         esi,eax
 00406556    mov         ebx,dword ptr [esi]
 00406558    test        ebx,ebx
>0040655A    jne         00406584
 0040655C    call        TMonitor.Create
 00406561    mov         edi,eax
 00406563    mov         eax,esi
 00406565    xor         ecx,ecx
 00406567    mov         edx,edi
 00406569    call        InterlockedCompareExchangePointer
 0040656E    mov         ebx,eax
 00406570    test        ebx,ebx
>00406572    jne         00406578
 00406574    mov         ebx,edi
>00406576    jmp         00406584
 00406578    mov         edx,1C
 0040657D    mov         eax,edi
 0040657F    call        @FreeMem
 00406584    mov         eax,ebx
 00406586    pop         edi
 00406587    pop         esi
 00406588    pop         ebx
 00406589    ret
*}
end;

//0040658C
procedure TMonitor.Pulse;
begin
{*
 0040658C    push        ebx
 0040658D    call        TMonitor.DequeueWaiter
 00406592    test        eax,eax
>00406594    je          004065A6
 00406596    mov         ebx,dword ptr ds:[78E8CC];gvar_0078E8CC
 0040659C    xor         ecx,ecx
 0040659E    xor         edx,edx
 004065A0    mov         eax,dword ptr [eax+8]
 004065A3    call        dword ptr [ebx+10]
 004065A6    pop         ebx
 004065A7    ret
*}
end;

//004065A8
procedure TMonitor.Pulse;
begin
{*
 004065A8    push        ebx
 004065A9    mov         ebx,eax
 004065AB    call        TMonitor.CheckMonitorSupport
 004065B0    mov         eax,ebx
 004065B2    call        TMonitor.GetMonitor
 004065B7    call        TMonitor.Pulse
 004065BC    pop         ebx
 004065BD    ret
*}
end;

//004065C0
procedure TMonitor.QueueWaiter(var WaitingThread:TWaitingThread);
begin
{*
 004065C0    push        ebp
 004065C1    mov         ebp,esp
 004065C3    push        ecx
 004065C4    push        ebx
 004065C5    mov         ebx,edx
 004065C7    mov         dword ptr [ebp-4],eax
 004065CA    mov         eax,dword ptr [ebp-4]
 004065CD    add         eax,18
 004065D0    call        TMonitor.TSpinLock.Enter
 004065D5    xor         edx,edx
 004065D7    push        ebp
 004065D8    push        406625
 004065DD    push        dword ptr fs:[edx]
 004065E0    mov         dword ptr fs:[edx],esp
 004065E3    mov         eax,dword ptr [ebp-4]
 004065E6    mov         eax,dword ptr [eax+14]
 004065E9    test        eax,eax
>004065EB    jne         004065F7
 004065ED    mov         eax,dword ptr [ebp-4]
 004065F0    mov         dword ptr [eax+14],ebx
 004065F3    mov         dword ptr [ebx],ebx
>004065F5    jmp         0040660C
 004065F7    mov         edx,dword ptr [ebp-4]
 004065FA    mov         eax,dword ptr [eax]
 004065FC    mov         dword ptr [ebx],eax
 004065FE    mov         eax,dword ptr [ebp-4]
 00406601    mov         eax,dword ptr [eax+14]
 00406604    mov         dword ptr [eax],ebx
 00406606    mov         eax,dword ptr [ebp-4]
 00406609    mov         dword ptr [eax+14],ebx
 0040660C    xor         eax,eax
 0040660E    pop         edx
 0040660F    pop         ecx
 00406610    pop         ecx
 00406611    mov         dword ptr fs:[eax],edx
 00406614    push        40662C
 00406619    mov         eax,dword ptr [ebp-4]
 0040661C    add         eax,18
 0040661F    call        TMonitor.TSpinLock.Exit
 00406624    ret
>00406625    jmp         @HandleFinally
>0040662A    jmp         00406619
 0040662C    pop         ebx
 0040662D    pop         ecx
 0040662E    pop         ebp
 0040662F    ret
*}
end;

//00406630
procedure TMonitor.RemoveWaiter(var WaitingThread:TWaitingThread);
begin
{*
 00406630    push        ebp
 00406631    mov         ebp,esp
 00406633    push        ecx
 00406634    push        ebx
 00406635    mov         ebx,edx
 00406637    mov         dword ptr [ebp-4],eax
 0040663A    mov         eax,dword ptr [ebp-4]
 0040663D    cmp         dword ptr [eax+14],0
>00406641    je          004066BE
 00406643    mov         eax,dword ptr [ebp-4]
 00406646    add         eax,18
 00406649    call        TMonitor.TSpinLock.Enter
 0040664E    xor         ecx,ecx
 00406650    push        ebp
 00406651    push        4066B7
 00406656    push        dword ptr fs:[ecx]
 00406659    mov         dword ptr fs:[ecx],esp
 0040665C    mov         eax,dword ptr [ebp-4]
 0040665F    mov         eax,dword ptr [eax+14]
 00406662    mov         edx,dword ptr [eax]
 00406664    mov         eax,dword ptr [edx]
>00406666    jmp         00406676
 00406668    cmp         eax,ebx
>0040666A    jne         00406672
 0040666C    mov         ecx,dword ptr [eax]
 0040666E    mov         dword ptr [edx],ecx
>00406670    jmp         0040667E
 00406672    mov         edx,eax
 00406674    mov         eax,dword ptr [eax]
 00406676    mov         ecx,dword ptr [ebp-4]
 00406679    cmp         eax,dword ptr [ecx+14]
>0040667C    jne         00406668
 0040667E    mov         ecx,dword ptr [ebp-4]
 00406681    cmp         eax,dword ptr [ecx+14]
>00406684    jne         0040669E
 00406686    cmp         eax,ebx
>00406688    jne         0040669E
 0040668A    cmp         eax,dword ptr [eax]
>0040668C    jne         00406698
 0040668E    mov         eax,dword ptr [ebp-4]
 00406691    xor         edx,edx
 00406693    mov         dword ptr [eax+14],edx
>00406696    jmp         0040669E
 00406698    mov         eax,dword ptr [ebp-4]
 0040669B    mov         dword ptr [eax+14],edx
 0040669E    xor         eax,eax
 004066A0    pop         edx
 004066A1    pop         ecx
 004066A2    pop         ecx
 004066A3    mov         dword ptr fs:[eax],edx
 004066A6    push        4066BE
 004066AB    mov         eax,dword ptr [ebp-4]
 004066AE    add         eax,18
 004066B1    call        TMonitor.TSpinLock.Exit
 004066B6    ret
>004066B7    jmp         @HandleFinally
>004066BC    jmp         004066AB
 004066BE    pop         ebx
 004066BF    pop         ecx
 004066C0    pop         ebp
 004066C1    ret
*}
end;

//004066C4
function TMonitor.TryEnter:Boolean;
begin
{*
 004066C4    push        ebx
 004066C5    mov         ebx,eax
 004066C7    call        kernel32.GetCurrentThreadId
 004066CC    cmp         eax,dword ptr [ebx+8]
>004066CF    jne         004066D8
 004066D1    inc         dword ptr [ebx+4]
 004066D4    mov         al,1
 004066D6    pop         ebx
 004066D7    ret
 004066D8    mov         eax,ebx
 004066DA    xor         ecx,ecx
 004066DC    mov         edx,1
 004066E1    call        InterlockedCompareExchange
 004066E6    test        eax,eax
>004066E8    jne         004066FD
 004066EA    call        kernel32.GetCurrentThreadId
 004066EF    mov         dword ptr [ebx+8],eax
 004066F2    mov         dword ptr [ebx+4],1
 004066F9    mov         al,1
>004066FB    jmp         004066FF
 004066FD    xor         eax,eax
 004066FF    pop         ebx
 00406700    ret
*}
end;

//00406704
function TMonitor.Wait(ALock:PMonitor; Timeout:Cardinal):Boolean;
begin
{*
 00406704    push        ebp
 00406705    mov         ebp,esp
 00406707    add         esp,0FFFFFFE8
 0040670A    push        ebx
 0040670B    push        esi
 0040670C    push        edi
 0040670D    mov         dword ptr [ebp-4],ecx
 00406710    mov         ebx,edx
 00406712    mov         esi,eax
 00406714    xor         eax,eax
 00406716    mov         dword ptr [ebp-18],eax
 00406719    mov         eax,ebx
 0040671B    call        TMonitor.CheckOwningThread
 00406720    mov         dword ptr [ebp-14],eax
 00406723    mov         edi,dword ptr ds:[78E8CC];gvar_0078E8CC
 00406729    call        dword ptr [edi+8]
 0040672C    mov         dword ptr [ebp-10],eax
 0040672F    xor         eax,eax
 00406731    push        ebp
 00406732    push        4067A6
 00406737    push        dword ptr fs:[eax]
 0040673A    mov         dword ptr fs:[eax],esp
 0040673D    mov         eax,dword ptr [ebx+4]
 00406740    mov         dword ptr [ebp-0C],eax
 00406743    lea         edx,[ebp-18]
 00406746    mov         eax,esi
 00406748    call        TMonitor.QueueWaiter
 0040674D    mov         dword ptr [ebx+4],1
 00406754    mov         eax,ebx
 00406756    call        TMonitor.Exit
 0040675B    mov         edi,dword ptr ds:[78E8CC];gvar_0078E8CC
 00406761    mov         ecx,dword ptr [ebp-4]
 00406764    mov         edx,dword ptr [ebp-10]
 00406767    xor         eax,eax
 00406769    call        dword ptr [edi+10]
 0040676C    test        eax,eax
 0040676E    sete        byte ptr [ebp-5]
 00406772    mov         eax,ebx
 00406774    or          edx,0FFFFFFFF
 00406777    call        TMonitor.Enter
 0040677C    lea         edx,[ebp-18]
 0040677F    mov         eax,esi
 00406781    call        TMonitor.RemoveWaiter
 00406786    mov         eax,dword ptr [ebp-0C]
 00406789    mov         dword ptr [ebx+4],eax
 0040678C    xor         eax,eax
 0040678E    pop         edx
 0040678F    pop         ecx
 00406790    pop         ecx
 00406791    mov         dword ptr fs:[eax],edx
 00406794    push        4067AD
 00406799    mov         ebx,dword ptr ds:[78E8CC];gvar_0078E8CC
 0040679F    mov         eax,dword ptr [ebp-10]
 004067A2    call        dword ptr [ebx+0C]
 004067A5    ret
>004067A6    jmp         @HandleFinally
>004067AB    jmp         00406799
 004067AD    movzx       eax,byte ptr [ebp-5]
 004067B1    pop         edi
 004067B2    pop         esi
 004067B3    pop         ebx
 004067B4    mov         esp,ebp
 004067B6    pop         ebp
 004067B7    ret
*}
end;

//004067B8
function TMonitor.Wait(ALock:TObject; Timeout:Cardinal):Boolean;
begin
{*
 004067B8    push        ebx
 004067B9    push        esi
 004067BA    push        edi
 004067BB    mov         edi,ecx
 004067BD    mov         esi,edx
 004067BF    mov         ebx,eax
 004067C1    call        TMonitor.CheckMonitorSupport
 004067C6    mov         eax,esi
 004067C8    call        TMonitor.GetMonitor
 004067CD    push        eax
 004067CE    mov         eax,ebx
 004067D0    call        TMonitor.GetMonitor
 004067D5    mov         ecx,edi
 004067D7    pop         edx
 004067D8    call        TMonitor.Wait
 004067DD    pop         edi
 004067DE    pop         esi
 004067DF    pop         ebx
 004067E0    ret
*}
end;

//004067E4
procedure NotifyReRaise;
begin
{*
 004067E4    cmp         byte ptr ds:[784026],1
>004067EB    jbe         004067FE
 004067ED    push        0
 004067EF    push        0
 004067F1    push        0
 004067F3    push        0EEDFADF
 004067F8    call        dword ptr ds:[78E014]
 004067FE    ret
*}
end;

//00406800
procedure NotifyNonDelphiException;
begin
{*
 00406800    cmp         byte ptr ds:[784026],0
>00406807    je          00406820
 00406809    push        eax
 0040680A    push        eax
 0040680B    push        edx
 0040680C    push        esp
 0040680D    push        2
 0040680F    push        0
 00406811    push        0EEDFAE4
 00406816    call        dword ptr ds:[78E014]
 0040681C    add         esp,8
 0040681F    pop         eax
 00406820    ret
*}
end;

//00406824
procedure NotifyExcept;
begin
{*
 00406824    push        esp
 00406825    push        1
 00406827    push        0
 00406829    push        0EEDFAE0
 0040682E    call        dword ptr ds:[78E014]
 00406834    add         esp,4
 00406837    pop         eax
 00406838    ret
*}
end;

//0040683C
procedure NotifyOnExcept;
begin
{*
 0040683C    cmp         byte ptr ds:[784026],1
>00406843    jbe         0040684E
 00406845    push        eax
 00406846    push        dword ptr [ebx+4]
>00406849    jmp         NotifyExcept
 0040684E    ret
*}
end;

//00406850
procedure NotifyAnyExcept;
begin
{*
 00406850    cmp         byte ptr ds:[784026],1
>00406857    jbe         00406860
 00406859    push        eax
 0040685A    push        ebx
>0040685B    jmp         NotifyExcept
 00406860    ret
*}
end;

//00406864
procedure CheckJmp;
begin
{*
 00406864    test        ecx,ecx
>00406866    je          00406881
 00406868    mov         eax,dword ptr [ecx+1]
 0040686B    cmp         byte ptr [ecx],0E9
>0040686E    je          0040687C
 00406870    cmp         byte ptr [ecx],0EB
>00406873    jne         00406881
 00406875    movsx       eax,al
 00406878    inc         ecx
 00406879    inc         ecx
>0040687A    jmp         0040687F
 0040687C    add         ecx,5
 0040687F    add         ecx,eax
 00406881    ret
*}
end;

//00406884
procedure NotifyExceptFinally;
begin
{*
 00406884    cmp         byte ptr ds:[784026],1
>0040688B    jbe         004068AA
 0040688D    push        eax
 0040688E    push        edx
 0040688F    push        ecx
 00406890    call        CheckJmp
 00406895    push        ecx
 00406896    push        esp
 00406897    push        1
 00406899    push        0
 0040689B    push        0EEDFAE1
 004068A0    call        dword ptr ds:[78E014]
 004068A6    pop         ecx
 004068A7    pop         ecx
 004068A8    pop         edx
 004068A9    pop         eax
 004068AA    ret
*}
end;

//004068AC
procedure NotifyTerminate;
begin
{*
 004068AC    cmp         byte ptr ds:[784026],1
>004068B3    jbe         004068C7
 004068B5    push        edx
 004068B6    push        esp
 004068B7    push        1
 004068B9    push        0
 004068BB    push        0EEDFAE2
 004068C0    call        dword ptr ds:[78E014]
 004068C6    pop         edx
 004068C7    ret
*}
end;

//004068C8
procedure NotifyUnhandled;
begin
{*
 004068C8    push        eax
 004068C9    push        edx
 004068CA    cmp         byte ptr ds:[784026],1
>004068D1    jbe         004068E3
 004068D3    push        esp
 004068D4    push        2
 004068D6    push        0
 004068D8    push        0EEDFAE3
 004068DD    call        dword ptr ds:[78E014]
 004068E3    pop         edx
 004068E4    pop         eax
 004068E5    ret
*}
end;

//004068E8
procedure @HandleAnyException;
begin
{*
 004068E8    mov         eax,dword ptr [esp+4]
 004068EC    test        dword ptr [eax+4],6
>004068F3    jne         00406A0C
 004068F9    cmp         dword ptr [eax],0EEDFADE
 004068FF    mov         edx,dword ptr [eax+18]
 00406902    mov         ecx,dword ptr [eax+14]
>00406905    je          00406975
 00406907    cld
 00406908    call        @FpuInit
 0040690D    mov         edx,dword ptr ds:[78E010]
 00406913    test        edx,edx
>00406915    je          00406A0C
 0040691B    call        edx
 0040691D    test        eax,eax
>0040691F    je          00406A0C
 00406925    mov         edx,dword ptr [esp+0C]
 00406929    mov         ecx,dword ptr [esp+4]
 0040692D    cmp         dword ptr [ecx],0EEFFACE
>00406933    je          0040696C
 00406935    call        NotifyNonDelphiException
 0040693A    cmp         byte ptr ds:[784027],0
>00406941    jbe         0040696C
 00406943    cmp         byte ptr ds:[784026],0
>0040694A    ja          0040696C
 0040694C    lea         ecx,[esp+4]
 00406950    push        eax
 00406951    push        ecx
 00406952    call        kernel32.UnhandledExceptionFilter
 00406957    cmp         eax,0
 0040695A    pop         eax
>0040695B    je          00406A0C
 00406961    mov         edx,eax
 00406963    mov         eax,dword ptr [esp+4]
 00406967    mov         ecx,dword ptr [eax+0C]
>0040696A    jmp         0040699C
 0040696C    mov         edx,eax
 0040696E    mov         eax,dword ptr [esp+4]
 00406972    mov         ecx,dword ptr [eax+0C]
 00406975    cmp         byte ptr ds:[784027],1
>0040697C    jbe         0040699C
 0040697E    cmp         byte ptr ds:[784026],0
>00406985    ja          0040699C
 00406987    push        eax
 00406988    lea         eax,[esp+8]
 0040698C    push        edx
 0040698D    push        ecx
 0040698E    push        eax
 0040698F    call        kernel32.UnhandledExceptionFilter
 00406994    cmp         eax,0
 00406997    pop         ecx
 00406998    pop         edx
 00406999    pop         eax
>0040699A    je          00406A0C
 0040699C    or          dword ptr [eax+4],2
 004069A0    push        ebx
 004069A1    xor         ebx,ebx
 004069A3    push        esi
 004069A4    push        edi
 004069A5    push        ebp
 004069A6    mov         ebx,dword ptr fs:[ebx]
 004069A9    push        ebx
 004069AA    push        eax
 004069AB    push        edx
 004069AC    push        ecx
 004069AD    mov         edx,dword ptr [esp+28]
 004069B1    push        0
 004069B3    push        eax
 004069B4    push        4069C0
 004069B9    push        edx
 004069BA    call        dword ptr ds:[78E018]
 004069C0    mov         edi,dword ptr [esp+28]
 004069C4    call        @GetTls
 004069C9    push        dword ptr [eax+0];{RaiseListPtr:Pointer}
 004069CF    mov         dword ptr [eax+0],esp;{RaiseListPtr:Pointer}
 004069D5    mov         ebp,dword ptr [edi+8]
 004069D8    mov         ebx,dword ptr [edi+4]
 004069DB    mov         dword ptr [edi+4],4069EC
 004069E2    add         ebx,5
 004069E5    call        NotifyAnyExcept
 004069EA    jmp         ebx
>004069EC    jmp         @HandleFinallyInternal
 004069F1    call        @GetTls
 004069F6    mov         ecx,dword ptr [eax+0];{RaiseListPtr:Pointer}
 004069FC    mov         edx,dword ptr [ecx]
 004069FE    mov         dword ptr [eax+0],edx;{RaiseListPtr:Pointer}
 00406A04    mov         eax,dword ptr [ecx+8]
>00406A07    jmp         TObject.Free
 00406A0C    mov         eax,1
 00406A11    ret
*}
end;

//00406A14
procedure @HandleOnException;
begin
{*
 00406A14    mov         eax,dword ptr [esp+4]
 00406A18    test        dword ptr [eax+4],6
>00406A1F    jne         00406B94
 00406A25    cmp         dword ptr [eax],0EEDFADE
>00406A2B    je          00406A4C
 00406A2D    cld
 00406A2E    call        @FpuInit
 00406A33    mov         edx,dword ptr ds:[78E00C]
 00406A39    test        edx,edx
>00406A3B    je          00406B94
 00406A41    call        edx
 00406A43    test        eax,eax
>00406A45    jne         00406A51
>00406A47    jmp         00406B94
 00406A4C    mov         eax,dword ptr [eax+18]
 00406A4F    mov         eax,dword ptr [eax]
 00406A51    mov         edx,dword ptr [esp+8]
 00406A55    push        ebx
 00406A56    push        esi
 00406A57    push        edi
 00406A58    push        ebp
 00406A59    mov         ecx,dword ptr [edx+4]
 00406A5C    mov         ebx,dword ptr [ecx+5]
 00406A5F    lea         esi,[ecx+9]
 00406A62    mov         ebp,eax
 00406A64    mov         eax,dword ptr [esi]
 00406A66    test        eax,eax
>00406A68    je          00406AAD
 00406A6A    mov         edi,ebp
>00406A6C    jmp         00406A70
 00406A6E    mov         edi,dword ptr [edi]
 00406A70    mov         eax,dword ptr [eax]
 00406A72    cmp         eax,edi
>00406A74    je          00406AAD
 00406A76    mov         ecx,dword ptr [eax-34]
 00406A79    cmp         ecx,dword ptr [edi-34]
>00406A7C    jne         00406A95
 00406A7E    mov         eax,dword ptr [eax-38]
 00406A81    mov         edx,dword ptr [edi-38]
 00406A84    xor         ecx,ecx
 00406A86    mov         cl,byte ptr [eax]
 00406A88    cmp         cl,byte ptr [edx]
>00406A8A    jne         00406A95
 00406A8C    inc         eax
 00406A8D    inc         edx
 00406A8E    call        @AStrCmp
>00406A93    je          00406AAD
 00406A95    mov         edi,dword ptr [edi-30]
 00406A98    mov         eax,dword ptr [esi]
 00406A9A    test        edi,edi
>00406A9C    jne         00406A6E
 00406A9E    add         esi,8
 00406AA1    dec         ebx
>00406AA2    jne         00406A64
 00406AA4    pop         ebp
 00406AA5    pop         edi
 00406AA6    pop         esi
 00406AA7    pop         ebx
>00406AA8    jmp         00406B94
 00406AAD    mov         eax,dword ptr [esp+14]
 00406AB1    cmp         dword ptr [eax],0EEDFADE
 00406AB7    mov         edx,dword ptr [eax+18]
 00406ABA    mov         ecx,dword ptr [eax+14]
>00406ABD    je          00406B00
 00406ABF    call        dword ptr ds:[78E010]
 00406AC5    mov         edx,dword ptr [esp+1C]
 00406AC9    call        NotifyNonDelphiException
 00406ACE    cmp         byte ptr ds:[784027],0
>00406AD5    jbe         00406AF5
 00406AD7    cmp         byte ptr ds:[784026],0
>00406ADE    ja          00406AF5
 00406AE0    lea         ecx,[esp+14]
 00406AE4    push        eax
 00406AE5    push        ecx
 00406AE6    call        kernel32.UnhandledExceptionFilter
 00406AEB    cmp         eax,0
 00406AEE    pop         eax
>00406AEF    je          00406B94
 00406AF5    mov         edx,eax
 00406AF7    mov         eax,dword ptr [esp+14]
 00406AFB    mov         ecx,dword ptr [eax+0C]
>00406AFE    jmp         00406B27
 00406B00    cmp         byte ptr ds:[784027],1
>00406B07    jbe         00406B27
 00406B09    cmp         byte ptr ds:[784026],0
>00406B10    ja          00406B27
 00406B12    push        eax
 00406B13    lea         eax,[esp+18]
 00406B17    push        edx
 00406B18    push        ecx
 00406B19    push        eax
 00406B1A    call        kernel32.UnhandledExceptionFilter
 00406B1F    cmp         eax,0
 00406B22    pop         ecx
 00406B23    pop         edx
 00406B24    pop         eax
>00406B25    je          00406B94
 00406B27    xor         ebx,ebx
 00406B29    mov         ebx,dword ptr fs:[ebx]
 00406B2C    push        ebx
 00406B2D    push        eax
 00406B2E    push        edx
 00406B2F    push        ecx
 00406B30    mov         edx,dword ptr [esp+28]
 00406B34    or          dword ptr [eax+4],2
 00406B38    push        esi
 00406B39    push        0
 00406B3B    push        eax
 00406B3C    push        406B48
 00406B41    push        edx
 00406B42    call        dword ptr ds:[78E018]
 00406B48    pop         ebx
 00406B49    mov         edi,dword ptr [esp+28]
 00406B4D    call        @GetTls
 00406B52    push        dword ptr [eax+0];{RaiseListPtr:Pointer}
 00406B58    mov         dword ptr [eax+0],esp;{RaiseListPtr:Pointer}
 00406B5E    mov         ebp,dword ptr [edi+8]
 00406B61    mov         dword ptr [edi+4],406B74
 00406B68    mov         eax,dword ptr [esp+8]
 00406B6C    call        NotifyOnExcept
 00406B71    jmp         dword ptr [ebx+4]
>00406B74    jmp         @HandleFinallyInternal
 00406B79    call        @GetTls
 00406B7E    mov         ecx,dword ptr [eax+0];{RaiseListPtr:Pointer}
 00406B84    mov         edx,dword ptr [ecx]
 00406B86    mov         dword ptr [eax+0],edx;{RaiseListPtr:Pointer}
 00406B8C    mov         eax,dword ptr [ecx+8]
>00406B8F    jmp         TObject.Free
 00406B94    mov         eax,1
 00406B99    ret
*}
end;

//00406B9C
procedure @HandleFinally;
begin
{*
 00406B9C    mov         eax,dword ptr [esp+4]
 00406BA0    test        dword ptr [eax+4],6
>00406BA7    je          00406C3C
 00406BAD    push        ebx
 00406BAE    xor         ebx,ebx
 00406BB0    push        esi
 00406BB1    push        edi
 00406BB2    push        ebp
 00406BB3    push        ebp
 00406BB4    push        406C1C
 00406BB9    push        dword ptr fs:[ebx]
 00406BBC    mov         dword ptr fs:[ebx],esp
 00406BBF    mov         ebx,dword ptr fs:[ebx]
 00406BC2    mov         edx,dword ptr [eax+18]
 00406BC5    mov         ecx,dword ptr [eax+14]
 00406BC8    push        ebx
 00406BC9    push        eax
 00406BCA    push        edx
 00406BCB    push        ecx
 00406BCC    mov         edi,dword ptr [esp+34]
 00406BD0    call        @GetTls
 00406BD5    push        dword ptr [eax+0];{RaiseListPtr:Pointer}
 00406BDB    mov         dword ptr [eax+0],esp;{RaiseListPtr:Pointer}
 00406BE1    mov         ecx,dword ptr [edi+4]
 00406BE4    mov         ebp,dword ptr [edi+8]
 00406BE7    mov         dword ptr [edi+4],406C1C
 00406BEE    add         ecx,5
 00406BF1    call        NotifyExceptFinally
 00406BF6    call        ecx
 00406BF8    call        @GetTls
 00406BFD    mov         ecx,dword ptr [eax+0];{RaiseListPtr:Pointer}
 00406C03    mov         edx,dword ptr [ecx]
 00406C05    mov         dword ptr [eax+0],edx;{RaiseListPtr:Pointer}
 00406C0B    add         esp,14
 00406C0E    xor         eax,eax
 00406C10    pop         edx
 00406C11    pop         ecx
 00406C12    pop         ecx
 00406C13    mov         dword ptr fs:[eax],edx
 00406C16    pop         ebp
 00406C17    pop         edi
 00406C18    pop         esi
 00406C19    pop         ebx
>00406C1A    jmp         00406C3C
>00406C1C    jmp         @HandleFinallyInternal
 00406C21    call        @GetTls
 00406C26    mov         ecx,dword ptr [eax+0];{RaiseListPtr:Pointer}
 00406C2C    mov         edx,dword ptr [ecx]
 00406C2E    mov         dword ptr [eax+0],edx;{RaiseListPtr:Pointer}
 00406C34    mov         eax,dword ptr [ecx+8]
>00406C37    jmp         TObject.Free
 00406C3C    mov         eax,1
 00406C41    ret
*}
end;

//00406C44
procedure @HandleFinallyInternal;
begin
{*
 00406C44    mov         eax,dword ptr [esp+4]
 00406C48    mov         edx,dword ptr [esp+8]
 00406C4C    test        dword ptr [eax+4],6
>00406C53    je          00406C74
 00406C55    mov         ecx,dword ptr [edx+4]
 00406C58    mov         dword ptr [edx+4],406C74
 00406C5F    push        ebx
 00406C60    push        esi
 00406C61    push        edi
 00406C62    push        ebp
 00406C63    mov         ebp,dword ptr [edx+8]
 00406C66    add         ecx,5
 00406C69    call        NotifyExceptFinally
 00406C6E    call        ecx
 00406C70    pop         ebp
 00406C71    pop         edi
 00406C72    pop         esi
 00406C73    pop         ebx
 00406C74    mov         eax,1
 00406C79    ret
*}
end;

//00406C7C
procedure @HandleAutoException;
begin
{*
 00406C7C    mov         eax,dword ptr [esp+4]
 00406C80    test        dword ptr [eax+4],6
>00406C87    jne         00406D38
 00406C8D    cmp         dword ptr [eax],0EEDFADE
 00406C93    cld
 00406C94    call        @FpuInit
>00406C99    je          00406CC2
 00406C9B    cmp         byte ptr ds:[784027],0
>00406CA2    jbe         00406CC2
 00406CA4    cmp         byte ptr ds:[784026],0
>00406CAB    ja          00406CC2
 00406CAD    lea         eax,[esp+4]
 00406CB1    push        eax
 00406CB2    call        kernel32.UnhandledExceptionFilter
 00406CB7    cmp         eax,0
>00406CBA    je          00406D38
 00406CBC    mov         eax,dword ptr [esp+4]
>00406CC0    jmp         00406CD4
 00406CC2    cmp         byte ptr ds:[784027],1
>00406CC9    jbe         00406CD4
 00406CCB    cmp         byte ptr ds:[784026],0
>00406CD2    jbe         00406CAD
 00406CD4    or          dword ptr [eax+4],2
 00406CD8    push        esi
 00406CD9    push        edi
 00406CDA    push        ebp
 00406CDB    mov         edx,dword ptr [esp+14]
 00406CDF    push        0
 00406CE1    push        eax
 00406CE2    push        406CEE
 00406CE7    push        edx
 00406CE8    call        dword ptr ds:[78E018]
 00406CEE    pop         ebp
 00406CEF    pop         edi
 00406CF0    pop         esi
 00406CF1    mov         eax,dword ptr [esp+4]
 00406CF5    mov         ebx,8000FFFF
 00406CFA    cmp         dword ptr [eax],0EEDFADE
>00406D00    jne         00406D26
 00406D02    mov         edx,dword ptr [eax+18]
 00406D05    mov         ecx,dword ptr [eax+14]
 00406D08    mov         eax,dword ptr [esp+8]
 00406D0C    mov         eax,dword ptr [eax+0C]
 00406D0F    test        eax,eax
>00406D11    je          00406D1A
 00406D13    mov         ebx,dword ptr [eax]
 00406D15    call        dword ptr [ebx-20]
 00406D18    mov         ebx,eax
 00406D1A    mov         eax,dword ptr [esp+4]
 00406D1E    mov         eax,dword ptr [eax+18]
 00406D21    call        TObject.Free
 00406D26    xor         eax,eax
 00406D28    mov         esp,dword ptr [esp+8]
 00406D2C    pop         ecx
 00406D2D    mov         dword ptr fs:[eax],ecx
 00406D30    pop         edx
 00406D31    pop         ebp
 00406D32    lea         edx,[edx+5]
 00406D35    pop         ecx
 00406D36    jmp         edx
 00406D38    mov         eax,1
 00406D3D    ret
*}
end;

//00406D40
procedure @RaiseExcept;
begin
{*
 00406D40    or          eax,eax
>00406D42    jne         00406D4E
 00406D44    mov         eax,0D8
 00406D49    call        @RunError
 00406D4E    pop         edx
 00406D4F    push        esp
 00406D50    push        ebp
 00406D51    push        edi
 00406D52    push        esi
 00406D53    push        ebx
 00406D54    push        eax
 00406D55    push        edx
 00406D56    mov         eax,esp
 00406D58    push        esp
 00406D59    push        7
 00406D5B    push        1
 00406D5D    push        0EEDFADE
 00406D62    push        edx
 00406D63    mov         edx,dword ptr ds:[78E01C]
 00406D69    test        edx,edx
>00406D6B    je          00406DA6
 00406D6D    push        dword ptr [eax+18]
 00406D70    push        dword ptr [eax+14]
 00406D73    push        dword ptr [eax+10]
 00406D76    push        dword ptr [eax+0C]
 00406D79    push        dword ptr [eax+8]
 00406D7C    push        dword ptr [eax+4]
 00406D7F    push        dword ptr [eax]
 00406D81    push        7
 00406D83    push        dword ptr [eax]
 00406D85    push        eax
 00406D86    push        edx
 00406D87    call        RaiseList
 00406D8C    mov         ecx,eax
 00406D8E    pop         edx
 00406D8F    pop         eax
 00406D90    test        ecx,ecx
>00406D92    je          00406D97
 00406D94    mov         ecx,dword ptr [ecx+0C]
 00406D97    push        ecx
 00406D98    push        1
 00406D9A    push        0EEDFADE
 00406D9F    mov         eax,esp
 00406DA1    call        edx
 00406DA3    add         esp,30
 00406DA6    jmp         dword ptr ds:[78E014]
 00406DA6    dd          00408DC3
*}
end;

//00406DB0
procedure @RaiseAgain;
begin
{*
 00406DB0    mov         eax,dword ptr [esp+30]
 00406DB4    mov         dword ptr [eax+4],406DFB
 00406DBB    call        @GetTls
 00406DC0    mov         edx,dword ptr [eax+0];{RaiseListPtr:Pointer}
 00406DC6    mov         ecx,dword ptr [edx]
 00406DC8    mov         dword ptr [eax+0],ecx;{RaiseListPtr:Pointer}
 00406DCE    mov         eax,dword ptr [edx+0C]
 00406DD1    and         dword ptr [eax+4],0FFFFFFFD
 00406DD5    cmp         dword ptr [eax],0EEDFADE
>00406DDB    je          00406DEA
 00406DDD    mov         eax,dword ptr [edx+8]
 00406DE0    call        TObject.Free
 00406DE5    call        NotifyReRaise
 00406DEA    xor         eax,eax
 00406DEC    add         esp,14
 00406DEF    mov         edx,dword ptr fs:[eax]
 00406DF2    pop         ecx
 00406DF3    mov         edx,dword ptr [edx]
 00406DF5    mov         dword ptr [ecx],edx
 00406DF7    pop         ebp
 00406DF8    pop         edi
 00406DF9    pop         esi
 00406DFA    pop         ebx
 00406DFB    mov         eax,1
 00406E00    ret
*}
end;

//00406E04
procedure @DoneExcept;
begin
{*
 00406E04    call        @GetTls
 00406E09    mov         edx,dword ptr [eax+0];{RaiseListPtr:Pointer}
 00406E0F    mov         ecx,dword ptr [edx]
 00406E11    mov         dword ptr [eax+0],ecx;{RaiseListPtr:Pointer}
 00406E17    mov         eax,dword ptr [edx+8]
 00406E1A    call        TObject.Free
 00406E1F    pop         edx
 00406E20    mov         esp,dword ptr [esp+2C]
 00406E24    xor         eax,eax
 00406E26    pop         ecx
 00406E27    mov         dword ptr fs:[eax],ecx
 00406E2A    pop         eax
 00406E2B    pop         ebp
 00406E2C    call        NotifyTerminate
 00406E31    jmp         edx
 00406E33    ret
*}
end;

//00406E34
procedure @TryFinallyExit;
begin
{*
 00406E34    xor         edx,edx
 00406E36    mov         ecx,dword ptr [esp+8]
 00406E3A    mov         eax,dword ptr [esp+4]
 00406E3E    add         ecx,5
 00406E41    mov         dword ptr fs:[edx],eax
 00406E44    call        ecx
 00406E46    ret         0C
*}
end;

//00406E4C
procedure MapToRunError(P:PExceptionRecord); stdcall;
begin
{*
 00406E4C    push        ebp
 00406E4D    mov         ebp,esp
 00406E4F    mov         edx,dword ptr [ebp+8]
 00406E52    mov         eax,dword ptr [edx]
 00406E54    cmp         eax,0C0000092
>00406E59    jg          00406E87
>00406E5B    je          00406EB9
 00406E5D    cmp         eax,0C000008E
>00406E62    jg          00406E79
>00406E64    je          00406EBD
 00406E66    sub         eax,0C0000005
>00406E6B    je          00406EC9
 00406E6D    sub         eax,87
>00406E72    je          00406EB1
 00406E74    dec         eax
>00406E75    je          00406EC5
>00406E77    jmp         00406ED9
 00406E79    add         eax,3FFFFF71
 00406E7E    sub         eax,2
>00406E81    jb          00406EB9
>00406E83    je          00406EB5
>00406E85    jmp         00406ED9
 00406E87    cmp         eax,0C0000096
>00406E8C    jg          00406E9F
>00406E8E    je          00406ECD
 00406E90    sub         eax,0C0000093
>00406E95    je          00406EC5
 00406E97    dec         eax
>00406E98    je          00406EAD
 00406E9A    dec         eax
>00406E9B    je          00406EC1
>00406E9D    jmp         00406ED9
 00406E9F    sub         eax,0C00000FD
>00406EA4    je          00406ED5
 00406EA6    sub         eax,3D
>00406EA9    je          00406ED1
>00406EAB    jmp         00406ED9
 00406EAD    mov         al,0C8
>00406EAF    jmp         00406EDB
 00406EB1    mov         al,0C9
>00406EB3    jmp         00406EDB
 00406EB5    mov         al,0CD
>00406EB7    jmp         00406EDB
 00406EB9    mov         al,0CF
>00406EBB    jmp         00406EDB
 00406EBD    mov         al,0C8
>00406EBF    jmp         00406EDB
 00406EC1    mov         al,0D7
>00406EC3    jmp         00406EDB
 00406EC5    mov         al,0CE
>00406EC7    jmp         00406EDB
 00406EC9    mov         al,0D8
>00406ECB    jmp         00406EDB
 00406ECD    mov         al,0DA
>00406ECF    jmp         00406EDB
 00406ED1    mov         al,0D9
>00406ED3    jmp         00406EDB
 00406ED5    mov         al,0CA
>00406ED7    jmp         00406EDB
 00406ED9    mov         al,0FF
 00406EDB    movzx       eax,al
 00406EDE    mov         edx,dword ptr [edx+0C]
 00406EE1    call        RunErrorAt
 00406EE6    pop         ebp
 00406EE7    ret         4
*}
end;

//00406EEC
procedure @ExceptionHandler;
begin
{*
 00406EEC    mov         eax,dword ptr [esp+4]
 00406EF0    test        dword ptr [eax+4],6
>00406EF7    jne         00406F86
 00406EFD    cmp         byte ptr ds:[784026],0
>00406F04    ja          00406F15
 00406F06    lea         eax,[esp+4]
 00406F0A    push        eax
 00406F0B    call        kernel32.UnhandledExceptionFilter
 00406F10    cmp         eax,0
>00406F13    je          00406F86
 00406F15    mov         eax,dword ptr [esp+4]
 00406F19    cld
 00406F1A    call        @FpuInit
 00406F1F    mov         edx,dword ptr [esp+8]
 00406F23    push        0
 00406F25    push        eax
 00406F26    push        406F32
 00406F2B    push        edx
 00406F2C    call        dword ptr ds:[78E018]
 00406F32    mov         ebx,dword ptr [esp+4]
 00406F36    cmp         dword ptr [ebx],0EEDFADE
 00406F3C    mov         edx,dword ptr [ebx+14]
 00406F3F    mov         eax,dword ptr [ebx+18]
>00406F42    je          00406F61
 00406F44    mov         edx,dword ptr ds:[78E010]
 00406F4A    test        edx,edx
>00406F4C    je          00406E4C
 00406F52    mov         eax,ebx
 00406F54    call        edx
 00406F56    test        eax,eax
>00406F58    je          00406E4C
 00406F5E    mov         edx,dword ptr [ebx+0C]
 00406F61    call        NotifyUnhandled
 00406F66    mov         ecx,dword ptr ds:[78E004]
 00406F6C    test        ecx,ecx
>00406F6E    je          00406F72
 00406F70    call        ecx
 00406F72    mov         ecx,dword ptr [esp+4]
 00406F76    mov         eax,0D9
 00406F7B    mov         edx,dword ptr [ecx+14]
 00406F7E    mov         dword ptr [esp],edx
>00406F81    jmp         @RunError
 00406F86    xor         eax,eax
 00406F88    ret
*}
end;

//00406F8C
procedure SetExceptionHandler(Context:PInitContext);
begin
{*
 00406F8C    push        eax
 00406F8D    xor         edx,edx
 00406F8F    lea         eax,[ebp-10]
 00406F92    mov         ecx,dword ptr fs:[edx]
 00406F95    mov         dword ptr fs:[edx],eax
 00406F98    mov         dword ptr [eax],ecx
 00406F9A    mov         dword ptr [eax+4],406EEC;@ExceptionHandler
 00406FA1    mov         dword ptr [eax+8],ebp
 00406FA4    pop         ecx
 00406FA5    mov         dword ptr [ecx+4],eax
 00406FA8    ret
*}
end;

//00406FAC
procedure UnsetExceptionHandler(Context:PInitContext);
begin
{*
 00406FAC    mov         eax,dword ptr [eax+4]
 00406FAF    xor         edx,edx
 00406FB1    test        eax,eax
>00406FB3    je          00406FD1
 00406FB5    mov         ecx,dword ptr fs:[edx]
 00406FB8    cmp         eax,ecx
>00406FBA    jne         00406FC4
 00406FBC    mov         eax,dword ptr [eax]
 00406FBE    mov         dword ptr fs:[edx],eax
 00406FC1    ret
 00406FC2    mov         ecx,dword ptr [ecx]
 00406FC4    cmp         ecx,0FFFFFFFF
>00406FC7    je          00406FD1
 00406FC9    cmp         dword ptr [ecx],eax
>00406FCB    jne         00406FC2
 00406FCD    mov         eax,dword ptr [eax]
 00406FCF    mov         dword ptr [ecx],eax
 00406FD1    ret
*}
end;

//00406FD4
procedure FinalizeUnits;
begin
{*
 00406FD4    push        ebp
 00406FD5    mov         ebp,esp
 00406FD7    push        ebx
 00406FD8    push        esi
 00406FD9    push        edi
 00406FDA    mov         eax,[00790AF0]
 00406FDF    test        eax,eax
>00406FE1    je          00407036
 00406FE3    mov         ebx,dword ptr ds:[790AF4]
 00406FE9    mov         edi,dword ptr [eax+4]
 00406FEC    xor         eax,eax
 00406FEE    push        ebp
 00406FEF    push        407022
 00406FF4    push        dword ptr fs:[eax]
 00406FF7    mov         dword ptr fs:[eax],esp
 00406FFA    test        ebx,ebx
>00406FFC    jle         00407018
 00406FFE    dec         ebx
 00406FFF    mov         dword ptr ds:[790AF4],ebx
 00407005    mov         esi,dword ptr [edi+ebx*8+4]
 00407009    test        esi,esi
>0040700B    je          00407014
 0040700D    cmp         dword ptr [esi],0
>00407010    je          00407014
 00407012    call        esi
 00407014    test        ebx,ebx
>00407016    jg          00406FFE
 00407018    xor         eax,eax
 0040701A    pop         edx
 0040701B    pop         ecx
 0040701C    pop         ecx
 0040701D    mov         dword ptr fs:[eax],edx
>00407020    jmp         00407036
>00407022    jmp         @HandleAnyException
 00407027    call        FinalizeUnits
 0040702C    call        @RaiseAgain
 00407031    call        @DoneExcept
 00407036    pop         edi
 00407037    pop         esi
 00407038    pop         ebx
 00407039    pop         ebp
 0040703A    ret
*}
end;

//0040703C
procedure InitUnits;
begin
{*
 0040703C    push        ebp
 0040703D    mov         ebp,esp
 0040703F    push        ecx
 00407040    push        ebx
 00407041    push        esi
 00407042    push        edi
 00407043    mov         eax,[00790AF0]
 00407048    test        eax,eax
>0040704A    je          004070A2
 0040704C    mov         edi,dword ptr [eax]
 0040704E    xor         ebx,ebx
 00407050    mov         eax,dword ptr [eax+4]
 00407053    mov         dword ptr [ebp-4],eax
 00407056    xor         eax,eax
 00407058    push        ebp
 00407059    push        40708E
 0040705E    push        dword ptr fs:[eax]
 00407061    mov         dword ptr fs:[eax],esp
 00407064    cmp         edi,ebx
>00407066    jle         00407084
 00407068    mov         eax,dword ptr [ebp-4]
 0040706B    mov         esi,dword ptr [eax+ebx*8]
 0040706E    inc         ebx
 0040706F    mov         dword ptr ds:[790AF4],ebx
 00407075    test        esi,esi
>00407077    je          00407080
 00407079    cmp         dword ptr [esi],0
>0040707C    je          00407080
 0040707E    call        esi
 00407080    cmp         edi,ebx
>00407082    jg          00407068
 00407084    xor         eax,eax
 00407086    pop         edx
 00407087    pop         ecx
 00407088    pop         ecx
 00407089    mov         dword ptr fs:[eax],edx
>0040708C    jmp         004070A2
>0040708E    jmp         @HandleAnyException
 00407093    call        FinalizeUnits
 00407098    call        @RaiseAgain
 0040709D    call        @DoneExcept
 004070A2    pop         edi
 004070A3    pop         esi
 004070A4    pop         ebx
 004070A5    pop         ecx
 004070A6    pop         ebp
 004070A7    ret
*}
end;

//004070A8
procedure @StartExe(InitTable:PackageInfo; Module:PLibModule);
begin
{*
 004070A8    mov         dword ptr ds:[78E014],40268C
 004070B2    mov         dword ptr ds:[78E018],40269C
 004070BC    mov         [00790AF0],eax
 004070C1    xor         eax,eax
 004070C3    mov         [00790AF4],eax
 004070C8    mov         dword ptr ds:[790AF8],edx
 004070CE    mov         eax,dword ptr [edx+4]
 004070D1    mov         [0078E038],eax
 004070D6    mov         eax,790AE8
 004070DB    call        SetExceptionHandler
 004070E0    mov         byte ptr ds:[78E040],0;IsLibrary:Boolean
 004070E7    call        InitUnits
 004070EC    ret
*}
end;

//004070F0
function LoadResStringA(ResStringRec:PResStringRec):AnsiString;
begin
{*
 004070F0    push        ebp
 004070F1    mov         ebp,esp
 004070F3    push        0
 004070F5    push        ebx
 004070F6    push        esi
 004070F7    mov         esi,edx
 004070F9    mov         ebx,eax
 004070FB    xor         eax,eax
 004070FD    push        ebp
 004070FE    push        407138
 00407103    push        dword ptr fs:[eax]
 00407106    mov         dword ptr fs:[eax],esp
 00407109    lea         edx,[ebp-4]
 0040710C    mov         eax,ebx
 0040710E    call        LoadResString
 00407113    mov         edx,dword ptr [ebp-4]
 00407116    mov         eax,esi
 00407118    mov         ecx,0
 0040711D    call        @LStrFromUStr
 00407122    xor         eax,eax
 00407124    pop         edx
 00407125    pop         ecx
 00407126    pop         ecx
 00407127    mov         dword ptr fs:[eax],edx
 0040712A    push        40713F
 0040712F    lea         eax,[ebp-4]
 00407132    call        @UStrClr
 00407137    ret
>00407138    jmp         @HandleFinally
>0040713D    jmp         0040712F
 0040713F    pop         esi
 00407140    pop         ebx
 00407141    pop         ecx
 00407142    pop         ebp
 00407143    ret
*}
end;

//00407144
function LoadResStringW(ResStringRec:PResStringRec):WideString;
begin
{*
 00407144    push        ebp
 00407145    mov         ebp,esp
 00407147    push        0
 00407149    push        ebx
 0040714A    push        esi
 0040714B    mov         esi,edx
 0040714D    mov         ebx,eax
 0040714F    xor         eax,eax
 00407151    push        ebp
 00407152    push        407187
 00407157    push        dword ptr fs:[eax]
 0040715A    mov         dword ptr fs:[eax],esp
 0040715D    lea         edx,[ebp-4]
 00407160    mov         eax,ebx
 00407162    call        LoadResString
 00407167    mov         edx,dword ptr [ebp-4]
 0040716A    mov         eax,esi
 0040716C    call        @WStrFromUStr
 00407171    xor         eax,eax
 00407173    pop         edx
 00407174    pop         ecx
 00407175    pop         ecx
 00407176    mov         dword ptr fs:[eax],edx
 00407179    push        40718E
 0040717E    lea         eax,[ebp-4]
 00407181    call        @UStrClr
 00407186    ret
>00407187    jmp         @HandleFinally
>0040718C    jmp         0040717E
 0040718E    pop         esi
 0040718F    pop         ebx
 00407190    pop         ecx
 00407191    pop         ebp
 00407192    ret
*}
end;

//00407194
function LoadResStringU(ResStringRec:PResStringRec):string;
begin
{*
 00407194    push        ebx
 00407195    push        esi
 00407196    mov         esi,edx
 00407198    mov         ebx,eax
 0040719A    mov         edx,esi
 0040719C    mov         eax,ebx
 0040719E    call        LoadResString
 004071A3    pop         esi
 004071A4    pop         ebx
 004071A5    ret
*}
end;

//004071A8
procedure @InitResStringImports;
begin
{*
 004071A8    push        ebx
 004071A9    xor         ebx,ebx
 004071AB    push        edi
 004071AC    push        esi
 004071AD    mov         edi,dword ptr [eax+ebx]
 004071B0    lea         esi,[eax+ebx+4]
 004071B4    mov         eax,dword ptr [esi+4]
 004071B7    mov         eax,dword ptr [eax+ebx]
 004071BA    mov         edx,dword ptr [esi]
 004071BC    add         edx,ebx
 004071BE    mov         ecx,dword ptr [esi+8]
 004071C1    test        ecx,ecx
>004071C3    je          004071CC
 004071C5    dec         ecx
>004071C6    je          004071D3
 004071C8    dec         ecx
>004071C9    je          004071DA
 004071CB    int         3
 004071CC    call        LoadResStringA
>004071D1    jmp         004071DF
 004071D3    call        LoadResStringW
>004071D8    jmp         004071DF
 004071DA    call        LoadResStringU
 004071DF    add         esi,0C
 004071E2    dec         edi
>004071E3    jne         004071B4
 004071E5    pop         esi
 004071E6    pop         edi
 004071E7    pop         ebx
 004071E8    ret
*}
end;

//004071EC
procedure @InitImports;
begin
{*
 004071EC    push        ebx
 004071ED    xor         ebx,ebx
 004071EF    push        edi
 004071F0    push        esi
 004071F1    mov         edi,dword ptr [eax+ebx]
 004071F4    lea         esi,[eax+ebx+4]
 004071F8    mov         eax,dword ptr [esi+4]
 004071FB    mov         edx,dword ptr [esi]
 004071FD    mov         eax,dword ptr [eax+ebx]
 00407200    add         eax,dword ptr [esi+8]
 00407203    mov         dword ptr [edx+ebx],eax
 00407206    add         esi,0C
 00407209    dec         edi
>0040720A    jne         004071F8
 0040720C    pop         esi
 0040720D    pop         edi
 0040720E    pop         ebx
 0040720F    ret
*}
end;

//00407210
procedure @InitWideStrings;
begin
{*
 00407210    push        ebx
 00407211    push        esi
 00407212    mov         ebx,dword ptr [eax]
 00407214    lea         esi,[eax+4]
 00407217    mov         edx,dword ptr [esi+4]
 0040721A    mov         eax,dword ptr [esi]
 0040721C    call        @WStrAsg
 00407221    add         esi,8
 00407224    dec         ebx
>00407225    jne         00407217
 00407227    pop         esi
 00407228    pop         ebx
 00407229    ret
*}
end;

//0040722C
procedure MakeErrorMessage;
begin
{*
 0040722C    push        ebx
 0040722D    push        esi
 0040722E    push        edi
 0040722F    mov         edi,7847C6
 00407234    mov         bl,10
 00407236    mov         esi,dword ptr ds:[784000]
 0040723C    mov         eax,esi
 0040723E    mov         ecx,0A
 00407243    cdq
 00407244    idiv        eax,ecx
 00407246    add         dl,30
 00407249    movzx       eax,bl
 0040724C    mov         byte ptr [edi+eax],dl
 0040724F    mov         ecx,0A
 00407254    mov         eax,esi
 00407256    cdq
 00407257    idiv        eax,ecx
 00407259    mov         esi,eax
 0040725B    dec         ebx
 0040725C    test        esi,esi
>0040725E    jne         0040723C
 00407260    mov         bl,1C
 00407262    mov         esi,dword ptr ds:[784004]
 00407268    mov         eax,esi
 0040726A    and         eax,0F
 0040726D    movzx       eax,byte ptr [eax+7847E4]
 00407274    movzx       edx,bl
 00407277    mov         byte ptr [edi+edx],al
 0040727A    mov         ecx,10
 0040727F    mov         eax,esi
 00407281    xor         edx,edx
 00407283    div         eax,ecx
 00407285    mov         esi,eax
 00407287    dec         ebx
 00407288    test        esi,esi
>0040728A    jne         00407268
 0040728C    pop         edi
 0040728D    pop         esi
 0040728E    pop         ebx
 0040728F    ret
*}
end;

//00407290
procedure ExitDll(Context:PInitContext);
begin
{*
 00407290    mov         edi,eax
 00407292    mov         ebx,dword ptr [edi+18]
 00407295    mov         ebp,dword ptr [edi+14]
 00407298    push        dword ptr [edi+1C]
 0040729B    push        dword ptr [edi+20]
 0040729E    mov         esi,dword ptr [edi]
 004072A0    mov         ecx,0C
 004072A5    rep movs    dword ptr [edi],dword ptr [esi]
 004072A7    pop         edi
 004072A8    pop         esi
 004072A9    xor         eax,eax
 004072AB    xchg        eax,dword ptr ds:[784000]
 004072B1    neg         eax
 004072B3    sbb         eax,eax
 004072B5    inc         eax
 004072B6    leave
 004072B7    ret         0C
*}
end;

//004072BC
procedure WriteErrorMessage;
begin
{*
 004072BC    push        ecx
 004072BD    cmp         byte ptr ds:[78E054],0
>004072C4    je          0040731D
 004072C6    cmp         word ptr ds:[78E330],0D7B2
>004072CF    jne         004072E5
 004072D1    cmp         dword ptr ds:[78E338],0
>004072D8    jbe         004072E5
 004072DA    mov         eax,78E32C
 004072DF    call        dword ptr ds:[78E348]
 004072E5    push        0
 004072E7    lea         eax,[esp+4]
 004072EB    push        eax
 004072EC    push        1D
 004072EE    push        7847C6
 004072F3    push        0F5
 004072F5    call        kernel32.GetStdHandle
 004072FA    push        eax
 004072FB    call        kernel32.WriteFile
 00407300    push        0
 00407302    lea         eax,[esp+4]
 00407306    push        eax
 00407307    push        2
 00407309    push        407348;#13+#10
 0040730E    push        0F5
 00407310    call        kernel32.GetStdHandle
 00407315    push        eax
 00407316    call        kernel32.WriteFile
 0040731B    pop         edx
 0040731C    ret
 0040731D    cmp         byte ptr ds:[784028],0
>00407324    jne         00407339
 00407326    push        0
 00407328    push        7847C0
 0040732D    push        7847C6
 00407332    push        0
 00407334    call        user32.MessageBoxA
 00407339    pop         edx
 0040733A    ret
*}
end;

//0040734C
procedure @Halt0;
begin
{*
 0040734C    push        ebx
 0040734D    push        esi
 0040734E    push        edi
 0040734F    push        ebp
 00407350    mov         esi,790AE8
 00407355    mov         edi,78E050
 0040735A    cmp         dword ptr ds:[784004],0
>00407361    je          00407374
 00407363    call        MakeErrorMessage
 00407368    call        WriteErrorMessage
 0040736D    xor         eax,eax
 0040736F    mov         [00784004],eax
 00407374    cmp         dword ptr ds:[790B1C],0
>0040737B    je          0040739E
 0040737D    call        kernel32.GetCurrentThreadId
 00407382    cmp         eax,dword ptr ds:[790B44]
>00407388    jne         0040739E
 0040738A    mov         eax,790B18
 0040738F    call        UnsetExceptionHandler
 00407394    mov         eax,790B18
 00407399    call        ExitDll
 0040739E    cmp         byte ptr [esi+28],0
>004073A2    jne         004073B8
 004073A4    cmp         dword ptr [edi],0
>004073A7    je          004073B8
 004073A9    mov         eax,dword ptr [edi]
 004073AB    mov         ebx,eax
 004073AD    xor         eax,eax
 004073AF    mov         dword ptr [edi],eax
 004073B1    call        ebx
 004073B3    cmp         dword ptr [edi],0
>004073B6    jne         004073A9
 004073B8    cmp         byte ptr [esi+28],2
>004073BC    jne         004073CC
 004073BE    cmp         dword ptr ds:[784000],0
>004073C5    jne         004073CC
 004073C7    xor         eax,eax
 004073C9    mov         dword ptr [esi+0C],eax
 004073CC    call        AcquireExceptionObject
 004073D1    mov         ebx,eax
 004073D3    test        ebx,ebx
>004073D5    je          004073E9
 004073D7    mov         eax,ebx
 004073D9    call        TObject.Free
 004073DE    call        AcquireExceptionObject
 004073E3    mov         ebx,eax
 004073E5    test        ebx,ebx
>004073E7    jne         004073D7
 004073E9    call        FinalizeUnits
 004073EE    cmp         byte ptr [esi+28],1
>004073F2    jbe         004073FD
 004073F4    cmp         dword ptr ds:[784000],0
>004073FB    je          00407423
 004073FD    mov         ebp,dword ptr [esi+10]
 00407400    test        ebp,ebp
>00407402    je          00407423
 00407404    mov         eax,ebp
 00407406    call        UnregisterModule
 0040740B    mov         eax,dword ptr [esi+10]
 0040740E    mov         edi,dword ptr [eax+10]
 00407411    mov         eax,dword ptr [esi+10]
 00407414    cmp         edi,dword ptr [eax+4]
>00407417    je          00407423
 00407419    test        edi,edi
>0040741B    je          00407423
 0040741D    push        edi
 0040741E    call        kernel32.FreeLibrary
 00407423    mov         eax,esi
 00407425    call        UnsetExceptionHandler
 0040742A    cmp         byte ptr [esi+28],1
>0040742E    jne         00407433
 00407430    call        dword ptr [esi+24]
 00407433    cmp         byte ptr [esi+28],0
>00407437    je          00407440
 00407439    mov         eax,esi
 0040743B    call        ExitDll
 00407440    cmp         dword ptr [esi],0
>00407443    jne         0040745F
 00407445    cmp         dword ptr ds:[78E030],0
>0040744C    je          00407454
 0040744E    call        dword ptr ds:[78E030]
 00407454    mov         eax,[00784000]
 00407459    push        eax
 0040745A    call        kernel32.ExitProcess
 0040745F    mov         eax,dword ptr [esi]
 00407461    push        esi
 00407462    mov         edi,esi
 00407464    mov         esi,eax
 00407466    mov         ecx,0C
 0040746B    rep movs    dword ptr [edi],dword ptr [esi]
 0040746D    pop         esi
>0040746E    jmp         004073B8
 00407473    pop         ebp
 00407474    pop         edi
 00407475    pop         esi
 00407476    pop         ebx
 00407477    ret
*}
end;

//00407478
procedure @Halt(Code:Integer);
begin
{*
 00407478    mov         [00784000],eax
 0040747D    call        @Halt0
 00407482    ret
*}
end;

//00407484
procedure @RunError(errorCode:Byte);
begin
{*
 00407484    pop         dword ptr ds:[784004]
>0040748A    jmp         @Halt
 0040748F    ret
*}
end;

//00407490
procedure @Assert(Message:String; Filename:String; LineNumber:Integer);
begin
{*
 00407490    push        ebp
 00407491    mov         ebp,esp
 00407493    add         esp,0FFFFFFF0
 00407496    mov         dword ptr [ebp-0C],ecx
 00407499    mov         dword ptr [ebp-8],edx
 0040749C    mov         dword ptr [ebp-4],eax
 0040749F    lea         eax,[ebp-10]
 004074A2    add         eax,8
 004074A5    add         eax,4
 004074A8    add         eax,8
 004074AB    mov         eax,dword ptr [eax]
 004074AD    mov         dword ptr [ebp-10],eax
 004074B0    cmp         dword ptr ds:[78E02C],0
>004074B7    je          004074CE
 004074B9    mov         eax,dword ptr [ebp-10]
 004074BC    push        eax
 004074BD    mov         ecx,dword ptr [ebp-0C]
 004074C0    mov         edx,dword ptr [ebp-8]
 004074C3    mov         eax,dword ptr [ebp-4]
 004074C6    call        dword ptr ds:[78E02C]
>004074CC    jmp         004074D8
 004074CE    mov         edx,dword ptr [ebp-10]
 004074D1    mov         al,15
 004074D3    call        ErrorAt
 004074D8    mov         esp,ebp
 004074DA    pop         ebp
 004074DB    ret
*}
end;

//004074DC
function ThreadWrapper(Parameter:Pointer):Integer; stdcall;
begin
{*
 004074DC    push        ebp
 004074DD    mov         ebp,esp
 004074DF    call        @FpuInit
 004074E4    push        ebp
 004074E5    xor         ecx,ecx
 004074E7    push        406EEC;@ExceptionHandler
 004074EC    mov         edx,dword ptr fs:[ecx]
 004074EF    push        edx
 004074F0    mov         dword ptr fs:[ecx],esp
 004074F3    mov         eax,dword ptr [ebp+8]
 004074F6    mov         ecx,dword ptr [eax+4]
 004074F9    mov         edx,dword ptr [eax]
 004074FB    push        ecx
 004074FC    push        edx
 004074FD    call        @FreeMem
 00407502    pop         edx
 00407503    pop         eax
 00407504    call        edx
 00407506    xor         edx,edx
 00407508    pop         ecx
 00407509    mov         dword ptr fs:[edx],ecx
 0040750C    pop         ecx
 0040750D    pop         ebp
 0040750E    pop         ebp
 0040750F    ret         4
*}
end;

//00407514
function BeginThread(SecurityAttributes:Pointer; StackSize:Cardinal; ThreadFunc:TThreadFunc; Parameter:Pointer; CreationFlags:Cardinal; var ThreadId:Cardinal):Integer;
begin
{*
 00407514    push        ebp
 00407515    mov         ebp,esp
 00407517    add         esp,0FFFFFFF8
 0040751A    push        ebx
 0040751B    push        esi
 0040751C    push        edi
 0040751D    mov         esi,ecx
 0040751F    mov         dword ptr [ebp-8],edx
 00407522    mov         dword ptr [ebp-4],eax
 00407525    mov         edi,dword ptr [ebp+10]
 00407528    cmp         dword ptr ds:[78402C],0
>0040752F    je          0040753F
 00407531    mov         edx,edi
 00407533    mov         eax,esi
 00407535    call        dword ptr ds:[78402C]
 0040753B    mov         ebx,eax
>0040753D    jmp         00407550
 0040753F    mov         eax,8
 00407544    call        @GetMem
 00407549    mov         ebx,eax
 0040754B    mov         dword ptr [ebx],esi
 0040754D    mov         dword ptr [ebx+4],edi
 00407550    mov         byte ptr ds:[78E055],1
 00407557    mov         eax,dword ptr [ebp+8]
 0040755A    push        eax
 0040755B    mov         eax,dword ptr [ebp+0C]
 0040755E    push        eax
 0040755F    push        ebx
 00407560    mov         eax,4074DC;ThreadWrapper:Integer
 00407565    push        eax
 00407566    mov         eax,dword ptr [ebp-8]
 00407569    push        eax
 0040756A    mov         eax,dword ptr [ebp-4]
 0040756D    push        eax
 0040756E    call        kernel32.CreateThread
 00407573    mov         esi,eax
 00407575    test        esi,esi
>00407577    jne         00407585
 00407579    mov         edx,8
 0040757E    mov         eax,ebx
 00407580    call        @FreeMem
 00407585    mov         eax,esi
 00407587    pop         edi
 00407588    pop         esi
 00407589    pop         ebx
 0040758A    pop         ecx
 0040758B    pop         ecx
 0040758C    pop         ebp
 0040758D    ret         0C
*}
end;

//00407590
procedure EndThread(ExitCode:Integer);
begin
{*
 00407590    push        ebx
 00407591    mov         ebx,eax
 00407593    cmp         dword ptr ds:[784030],0
>0040759A    je          004075A4
 0040759C    mov         eax,ebx
 0040759E    call        dword ptr ds:[784030]
 004075A4    push        ebx
 004075A5    call        kernel32.ExitThread
 004075AA    pop         ebx
 004075AB    ret
*}
end;

//004075AC
function @NewUnicodeString(CharLength:Integer):Pointer;
begin
{*
 004075AC    test        eax,eax
>004075AE    jle         004075E9
 004075B0    push        eax
 004075B1    add         eax,eax
>004075B3    jo          004075E4
 004075B5    add         eax,0E
>004075B8    jo          004075E4
 004075BA    call        @GetMem
 004075BF    add         eax,0C
 004075C2    pop         edx
 004075C3    mov         dword ptr [eax-8],1
 004075CA    mov         dword ptr [eax-4],edx
 004075CD    mov         word ptr [eax+edx*2],0
 004075D3    mov         word ptr [eax-0A],2
 004075D9    mov         edx,dword ptr ds:[78E8D4]
 004075DF    mov         word ptr [eax-0C],dx
 004075E3    ret
>004075E4    jmp         @IntOver
 004075E9    xor         eax,eax
 004075EB    ret
*}
end;

//004075EC
function @NewAnsiString(CharLength:Integer; CodePage:Word):Pointer;
begin
{*
 004075EC    test        eax,eax
>004075EE    jle         00407633
 004075F0    push        eax
 004075F1    add         eax,0E
>004075F4    jo          0040762E
 004075F6    and         eax,0FFFFFFFE
 004075F9    push        edx
 004075FA    push        eax
 004075FB    call        @GetMem
 00407600    pop         edx
 00407601    pop         ecx
 00407602    mov         word ptr [edx+eax-2],0
 00407609    add         eax,0C
 0040760C    pop         edx
 0040760D    mov         dword ptr [eax-4],edx
 00407610    mov         dword ptr [eax-8],1
 00407617    test        ecx,ecx
>00407619    jne         00407621
 0040761B    mov         ecx,dword ptr ds:[78E8D0]
 00407621    mov         edx,ecx
 00407623    mov         word ptr [eax-0C],dx
 00407627    mov         word ptr [eax-0A],1
 0040762D    ret
>0040762E    jmp         @IntOver
 00407633    xor         eax,eax
 00407635    ret
*}
end;

//00407638
procedure WStrError;
begin
{*
 00407638    mov         al,1
>0040763A    jmp         Error
 0040763F    ret
*}
end;

//00407640
function @NewWideString(CharLength:Integer):Pointer;
begin
{*
 00407640    test        eax,eax
>00407642    je          00407654
 00407644    push        eax
 00407645    push        0
 00407647    call        oleaut32.SysAllocStringLen
 0040764C    test        eax,eax
>0040764E    je          00407638
 00407654    ret
*}
end;

//00407658
procedure @UStrClr(var S:UnicodeString);
begin
{*
 00407658    mov         edx,dword ptr [eax]
 0040765A    test        edx,edx
>0040765C    je          0040767A
 0040765E    mov         dword ptr [eax],0
 00407664    mov         ecx,dword ptr [edx-8]
 00407667    dec         ecx
>00407668    jl          0040767A
 0040766A    lock dec    dword ptr [edx-8]
>0040766E    jne         0040767A
 00407670    push        eax
 00407671    lea         eax,[edx-0C]
 00407674    call        @FreeMem
 00407679    pop         eax
 0040767A    ret
*}
end;

//0040767C
procedure @LStrClr(var S:AnsiString);
begin
{*
 0040767C    mov         edx,dword ptr [eax]
 0040767E    test        edx,edx
>00407680    je          0040769E
 00407682    mov         dword ptr [eax],0
 00407688    mov         ecx,dword ptr [edx-8]
 0040768B    dec         ecx
>0040768C    jl          0040769E
 0040768E    lock dec    dword ptr [edx-8]
>00407692    jne         0040769E
 00407694    push        eax
 00407695    lea         eax,[edx-0C]
 00407698    call        @FreeMem
 0040769D    pop         eax
 0040769E    ret
*}
end;

//004076A0
procedure @WStrClr(var S:WideString);
begin
{*
 004076A0    mov         edx,dword ptr [eax]
 004076A2    test        edx,edx
>004076A4    je          004076B4
 004076A6    mov         dword ptr [eax],0
 004076AC    push        eax
 004076AD    push        edx
 004076AE    call        oleaut32.SysFreeString
 004076B3    pop         eax
 004076B4    ret
*}
end;

//004076B8
procedure @UStrArrayClr(var StrArray:Pointer; Count:Integer);
begin
{*
 004076B8    push        ebx
 004076B9    push        esi
 004076BA    mov         ebx,eax
 004076BC    mov         esi,edx
 004076BE    mov         edx,dword ptr [ebx]
 004076C0    test        edx,edx
>004076C2    je          004076DE
 004076C4    mov         dword ptr [ebx],0
 004076CA    mov         ecx,dword ptr [edx-8]
 004076CD    dec         ecx
>004076CE    jl          004076DE
 004076D0    lock dec    dword ptr [edx-8]
>004076D4    jne         004076DE
 004076D6    lea         eax,[edx-0C]
 004076D9    call        @FreeMem
 004076DE    add         ebx,4
 004076E1    dec         esi
>004076E2    jne         004076BE
 004076E4    pop         esi
 004076E5    pop         ebx
 004076E6    ret
*}
end;

//004076E8
procedure @LStrArrayClr(var StrArray:Pointer; Count:Integer);
begin
{*
 004076E8    push        ebx
 004076E9    push        esi
 004076EA    mov         ebx,eax
 004076EC    mov         esi,edx
 004076EE    mov         edx,dword ptr [ebx]
 004076F0    test        edx,edx
>004076F2    je          0040770E
 004076F4    mov         dword ptr [ebx],0
 004076FA    mov         ecx,dword ptr [edx-8]
 004076FD    dec         ecx
>004076FE    jl          0040770E
 00407700    lock dec    dword ptr [edx-8]
>00407704    jne         0040770E
 00407706    lea         eax,[edx-0C]
 00407709    call        @FreeMem
 0040770E    add         ebx,4
 00407711    dec         esi
>00407712    jne         004076EE
 00407714    pop         esi
 00407715    pop         ebx
 00407716    ret
*}
end;

//00407718
procedure @WStrArrayClr(var StrArray:Pointer; Count:Integer);
begin
{*
 00407718    push        ebx
 00407719    push        esi
 0040771A    mov         ebx,eax
 0040771C    mov         esi,edx
 0040771E    mov         eax,dword ptr [ebx]
 00407720    test        eax,eax
>00407722    je          00407730
 00407724    mov         dword ptr [ebx],0
 0040772A    push        eax
 0040772B    call        oleaut32.SysFreeString
 00407730    add         ebx,4
 00407733    dec         esi
>00407734    jne         0040771E
 00407736    pop         esi
 00407737    pop         ebx
 00407738    ret
*}
end;

//0040773C
function @UStrAddRef(var S:UnicodeString):Pointer;
begin
{*
 0040773C    test        eax,eax
>0040773E    je          0040774A
 00407740    mov         edx,dword ptr [eax-8]
 00407743    inc         edx
>00407744    jle         0040774A
 00407746    lock inc    dword ptr [eax-8]
 0040774A    ret
*}
end;

//0040774C
function @LStrAddRef(var S:AnsiString):Pointer;
begin
{*
 0040774C    test        eax,eax
>0040774E    je          0040775A
 00407750    mov         edx,dword ptr [eax-8]
 00407753    inc         edx
>00407754    jle         0040775A
 00407756    lock inc    dword ptr [eax-8]
 0040775A    ret
*}
end;

//0040775C
function @WStrAddRef(var S:WideString):Pointer;
begin
{*
 0040775C    mov         edx,dword ptr [eax]
 0040775E    test        edx,edx
>00407760    je          0040777A
 00407762    push        eax
 00407763    mov         ecx,dword ptr [edx-4]
 00407766    shr         ecx,1
 00407768    push        ecx
 00407769    push        edx
 0040776A    call        oleaut32.SysAllocStringLen
 0040776F    pop         edx
 00407770    test        eax,eax
>00407772    je          00407638
 00407778    mov         dword ptr [edx],eax
 0040777A    ret
*}
end;

//0040777C
function CharFromWChar(CharDest:PAnsiChar; DestBytes:Integer; const WCharSource:PWideChar; SrcChars:Integer; CodePage:Integer):Integer;
begin
{*
 0040777C    push        ebp
 0040777D    mov         ebp,esp
 0040777F    push        ebx
 00407780    push        esi
 00407781    mov         esi,dword ptr [ebp+8]
 00407784    test        esi,esi
>00407786    jne         0040778E
 00407788    mov         esi,dword ptr ds:[78E8D0]
 0040778E    mov         ebx,dword ptr [ebp+0C]
 00407791    push        ebx
 00407792    push        eax
 00407793    push        edx
 00407794    push        0
 00407796    push        0
 00407798    mov         eax,esi
 0040779A    xor         edx,edx
 0040779C    call        LocaleCharsFromUnicode
 004077A1    pop         esi
 004077A2    pop         ebx
 004077A3    pop         ebp
 004077A4    ret         8
*}
end;

//004077A8
function CharFromWChar(CharDest:PAnsiChar; DestBytes:Integer; const WCharSource:PWideChar; SrcChars:Integer):Integer;
begin
{*
 004077A8    push        ebp
 004077A9    mov         ebp,esp
 004077AB    push        ebx
 004077AC    mov         ebx,dword ptr [ebp+8]
 004077AF    push        ebx
 004077B0    mov         ebx,dword ptr ds:[78E8D0]
 004077B6    push        ebx
 004077B7    call        CharFromWChar
 004077BC    pop         ebx
 004077BD    pop         ebp
 004077BE    ret         4
*}
end;

//004077C4
function WCharFromChar(WCharDest:PWideChar; DestChars:Integer; const CharSource:PAnsiChar; SrcBytes:Integer; CodePage:Integer):Integer;
begin
{*
 004077C4    push        ebp
 004077C5    mov         ebp,esp
 004077C7    push        ebx
 004077C8    mov         ebx,dword ptr [ebp+0C]
 004077CB    push        ebx
 004077CC    push        eax
 004077CD    push        edx
 004077CE    mov         eax,dword ptr [ebp+8]
 004077D1    xor         edx,edx
 004077D3    call        UnicodeFromLocaleChars
 004077D8    pop         ebx
 004077D9    pop         ebp
 004077DA    ret         8
*}
end;

//004077E0
procedure @UStrFromPWCharLen(var Dest:UnicodeString; Source:PWideChar; Length:Integer);
begin
{*
 004077E0    push        ebx
 004077E1    push        esi
 004077E2    push        edi
 004077E3    mov         ebx,eax
 004077E5    mov         esi,edx
 004077E7    mov         edi,ecx
 004077E9    mov         eax,edi
 004077EB    call        @NewUnicodeString
 004077F0    mov         ecx,edi
 004077F2    mov         edi,eax
 004077F4    test        esi,esi
>004077F6    je          00407803
 004077F8    mov         edx,eax
 004077FA    mov         eax,esi
 004077FC    shl         ecx,1
 004077FE    call        Move
 00407803    mov         eax,ebx
 00407805    call        @LStrClr
 0040780A    mov         dword ptr [ebx],edi
 0040780C    pop         edi
 0040780D    pop         esi
 0040780E    pop         ebx
 0040780F    ret
*}
end;

//00407810
procedure @WStrFromPWCharLen(var Dest:WideString; Source:PWideChar; Length:Integer);
begin
{*
 00407810    test        ecx,ecx
>00407812    je          004076A0
 00407818    push        eax
 00407819    push        ecx
 0040781A    push        edx
 0040781B    call        oleaut32.SysAllocStringLen
 00407820    test        eax,eax
 00407822    pop         edx
>00407823    je          00407638
 00407829    push        dword ptr [edx]
 0040782B    mov         dword ptr [edx],eax
 0040782D    call        oleaut32.SysFreeString
 00407832    ret
*}
end;

//00407834
procedure @LStrFromPCharLen(var Dest:AnsiString; Source:PAnsiChar; Length:Integer);
begin
{*
 00407834    push        ebp
 00407835    mov         ebp,esp
 00407837    push        ebx
 00407838    push        esi
 00407839    push        edi
 0040783A    mov         ebx,eax
 0040783C    mov         esi,edx
 0040783E    mov         edi,ecx
 00407840    mov         eax,edi
 00407842    movzx       edx,word ptr [ebp+8]
 00407846    call        @NewAnsiString
 0040784B    mov         ecx,edi
 0040784D    mov         edi,eax
 0040784F    test        esi,esi
>00407851    je          0040785C
 00407853    mov         edx,eax
 00407855    mov         eax,esi
 00407857    call        Move
 0040785C    mov         eax,ebx
 0040785E    call        @LStrClr
 00407863    mov         dword ptr [ebx],edi
 00407865    pop         edi
 00407866    pop         esi
 00407867    pop         ebx
 00407868    pop         ebp
 00407869    ret         4
*}
end;

//0040786C
procedure InternalUStrFromPCharLen(var Dest:AnsiString; Source:PAnsiChar; Length:Integer; CodePage:Integer);
begin
{*
 0040786C    push        ebp
 0040786D    mov         ebp,esp
 0040786F    add         esp,0FFFFF004
 00407875    push        eax
 00407876    add         esp,0FFFFFFFC
 00407879    push        ebx
 0040787A    push        esi
 0040787B    push        edi
 0040787C    mov         esi,ecx
 0040787E    mov         dword ptr [ebp-4],edx
 00407881    mov         edi,eax
 00407883    test        esi,esi
>00407885    jg          00407890
 00407887    mov         eax,edi
 00407889    call        @UStrClr
>0040788E    jmp         004078F7
 00407890    lea         eax,[esi+1]
 00407893    cmp         eax,7FF
>00407898    jge         004078C9
 0040789A    push        esi
 0040789B    mov         eax,dword ptr [ebp+8]
 0040789E    push        eax
 0040789F    lea         eax,[ebp-1004]
 004078A5    mov         ecx,dword ptr [ebp-4]
 004078A8    mov         edx,7FF
 004078AD    call        WCharFromChar
 004078B2    mov         ebx,eax
 004078B4    test        ebx,ebx
>004078B6    jle         004078C9
 004078B8    lea         edx,[ebp-1004]
 004078BE    mov         eax,edi
 004078C0    mov         ecx,ebx
 004078C2    call        @UStrFromPWCharLen
>004078C7    jmp         004078F7
 004078C9    lea         ebx,[esi+1]
 004078CC    mov         eax,edi
 004078CE    mov         edx,ebx
 004078D0    call        @UStrSetLength
 004078D5    push        esi
 004078D6    mov         eax,dword ptr [ebp+8]
 004078D9    push        eax
 004078DA    mov         eax,dword ptr [edi]
 004078DC    mov         ecx,dword ptr [ebp-4]
 004078DF    mov         edx,ebx
 004078E1    call        WCharFromChar
 004078E6    mov         ebx,eax
 004078E8    test        ebx,ebx
>004078EA    jge         004078EE
 004078EC    xor         ebx,ebx
 004078EE    mov         eax,edi
 004078F0    mov         edx,ebx
 004078F2    call        @UStrSetLength
 004078F7    pop         edi
 004078F8    pop         esi
 004078F9    pop         ebx
 004078FA    mov         esp,ebp
 004078FC    pop         ebp
 004078FD    ret         4
*}
end;

//00407900
procedure @UStrFromPCharLen(var Dest:UnicodeString; Source:PAnsiChar; Length:Integer);
begin
{*
 00407900    push        ebx
 00407901    mov         ebx,dword ptr ds:[78E8D0]
 00407907    push        ebx
 00407908    call        InternalUStrFromPCharLen
 0040790D    pop         ebx
 0040790E    ret
*}
end;

//00407910
procedure InternalWStrFromPCharLen(var Dest:WideString; Source:PAnsiChar; Length:Integer; CodePage:Integer);
begin
{*
 00407910    push        ebp
 00407911    mov         ebp,esp
 00407913    add         esp,0FFFFF004
 00407919    push        eax
 0040791A    add         esp,0FFFFFFFC
 0040791D    push        ebx
 0040791E    push        esi
 0040791F    push        edi
 00407920    mov         esi,ecx
 00407922    mov         dword ptr [ebp-4],edx
 00407925    mov         edi,eax
 00407927    test        esi,esi
>00407929    jg          00407934
 0040792B    mov         eax,edi
 0040792D    call        @WStrClr
>00407932    jmp         0040799B
 00407934    lea         eax,[esi+1]
 00407937    cmp         eax,7FF
>0040793C    jge         0040796D
 0040793E    push        esi
 0040793F    mov         eax,dword ptr [ebp+8]
 00407942    push        eax
 00407943    lea         eax,[ebp-1004]
 00407949    mov         ecx,dword ptr [ebp-4]
 0040794C    mov         edx,7FF
 00407951    call        WCharFromChar
 00407956    mov         ebx,eax
 00407958    test        ebx,ebx
>0040795A    jle         0040796D
 0040795C    lea         edx,[ebp-1004]
 00407962    mov         eax,edi
 00407964    mov         ecx,ebx
 00407966    call        @WStrFromPWCharLen
>0040796B    jmp         0040799B
 0040796D    lea         ebx,[esi+1]
 00407970    mov         eax,edi
 00407972    mov         edx,ebx
 00407974    call        @WStrSetLength
 00407979    push        esi
 0040797A    mov         eax,dword ptr [ebp+8]
 0040797D    push        eax
 0040797E    mov         eax,dword ptr [edi]
 00407980    mov         ecx,dword ptr [ebp-4]
 00407983    mov         edx,ebx
 00407985    call        WCharFromChar
 0040798A    mov         ebx,eax
 0040798C    test        ebx,ebx
>0040798E    jge         00407992
 00407990    xor         ebx,ebx
 00407992    mov         eax,edi
 00407994    mov         edx,ebx
 00407996    call        @WStrSetLength
 0040799B    pop         edi
 0040799C    pop         esi
 0040799D    pop         ebx
 0040799E    mov         esp,ebp
 004079A0    pop         ebp
 004079A1    ret         4
*}
end;

//004079A4
procedure @WStrFromPCharLen(var Dest:WideString; Source:PAnsiChar; Length:Integer);
begin
{*
 004079A4    push        ebx
 004079A5    mov         ebx,dword ptr ds:[78E8D0]
 004079AB    push        ebx
 004079AC    call        InternalWStrFromPCharLen
 004079B1    pop         ebx
 004079B2    ret
*}
end;

//004079B4
procedure @LStrFromPWCharLen(var Dest:AnsiString; Source:PWideChar; Length:Integer);
begin
{*
 004079B4    push        ebp
 004079B5    mov         ebp,esp
 004079B7    add         esp,0FFFFFFF8
 004079BA    push        ebx
 004079BB    push        esi
 004079BC    push        edi
 004079BD    mov         dword ptr [ebp-8],ecx
 004079C0    mov         dword ptr [ebp-4],edx
 004079C3    mov         edi,eax
 004079C5    mov         ebx,dword ptr [ebp+8]
 004079C8    cmp         dword ptr [ebp-8],0
>004079CC    jg          004079D7
 004079CE    mov         eax,edi
 004079D0    call        @LStrClr
>004079D5    jmp         00407A2D
 004079D7    test        bx,bx
>004079DA    jne         004079E3
 004079DC    movzx       ebx,word ptr ds:[78E8D0]
 004079E3    mov         eax,dword ptr [ebp-8]
 004079E6    push        eax
 004079E7    movzx       eax,bx
 004079EA    push        eax
 004079EB    mov         ecx,dword ptr [ebp-4]
 004079EE    xor         edx,edx
 004079F0    xor         eax,eax
 004079F2    call        CharFromWChar
 004079F7    mov         esi,eax
 004079F9    mov         eax,edi
 004079FB    xor         ecx,ecx
 004079FD    mov         edx,esi
 004079FF    call        @LStrSetLength
 00407A04    test        esi,esi
>00407A06    jle         00407A26
 00407A08    mov         eax,dword ptr [ebp-8]
 00407A0B    push        eax
 00407A0C    movzx       eax,bx
 00407A0F    push        eax
 00407A10    mov         eax,dword ptr [edi]
 00407A12    mov         ecx,dword ptr [ebp-4]
 00407A15    mov         edx,esi
 00407A17    call        CharFromWChar
 00407A1C    mov         eax,dword ptr [edi]
 00407A1E    sub         eax,0C
 00407A21    mov         word ptr [eax],bx
>00407A24    jmp         00407A2D
 00407A26    mov         eax,edi
 00407A28    call        @LStrClr
 00407A2D    pop         edi
 00407A2E    pop         esi
 00407A2F    pop         ebx
 00407A30    pop         ecx
 00407A31    pop         ecx
 00407A32    pop         ebp
 00407A33    ret         4
*}
end;

//00407A38
procedure @UStrAsg(var Dest:UnicodeString; Source:UnicodeString);
begin
{*
 00407A38    test        edx,edx
>00407A3A    je          00407A62
 00407A3C    mov         ecx,dword ptr [edx-8]
 00407A3F    inc         ecx
>00407A40    jg          00407A5E
 00407A42    push        eax
 00407A43    push        edx
 00407A44    mov         eax,dword ptr [edx-4]
 00407A47    call        @NewUnicodeString
 00407A4C    mov         edx,eax
 00407A4E    pop         eax
 00407A4F    push        edx
 00407A50    mov         ecx,dword ptr [eax-4]
 00407A53    shl         ecx,1
 00407A55    call        Move
 00407A5A    pop         edx
 00407A5B    pop         eax
>00407A5C    jmp         00407A62
 00407A5E    lock inc    dword ptr [edx-8]
 00407A62    xchg        edx,dword ptr [eax]
 00407A64    test        edx,edx
>00407A66    je          00407A7C
 00407A68    mov         ecx,dword ptr [edx-8]
 00407A6B    dec         ecx
>00407A6C    jl          00407A7C
 00407A6E    lock dec    dword ptr [edx-8]
>00407A72    jne         00407A7C
 00407A74    lea         eax,[edx-0C]
 00407A77    call        @FreeMem
 00407A7C    ret
*}
end;

//00407A80
procedure @UStrLAsg(var Dest:UnicodeString; const Source:UnicodeString);
begin
{*
 00407A80    test        edx,edx
>00407A82    je          00407A8E
 00407A84    mov         ecx,dword ptr [edx-8]
 00407A87    inc         ecx
>00407A88    jle         00407A8E
 00407A8A    lock inc    dword ptr [edx-8]
 00407A8E    xchg        edx,dword ptr [eax]
 00407A90    test        edx,edx
>00407A92    je          00407AA8
 00407A94    mov         ecx,dword ptr [edx-8]
 00407A97    dec         ecx
>00407A98    jl          00407AA8
 00407A9A    lock dec    dword ptr [edx-8]
>00407A9E    jne         00407AA8
 00407AA0    lea         eax,[edx-0C]
 00407AA3    call        @FreeMem
 00407AA8    ret
*}
end;

//00407AAC
procedure @WStrAsg(var Dest:WideString; Source:WideString);
begin
{*
 00407AAC    cmp         dword ptr [eax],edx
>00407AAE    je          00407AD3
 00407AB0    test        edx,edx
>00407AB2    je          004076A0
 00407AB8    mov         ecx,dword ptr [edx-4]
 00407ABB    shr         ecx,1
>00407ABD    je          004076A0
 00407AC3    push        ecx
 00407AC4    push        edx
 00407AC5    push        eax
 00407AC6    call        oleaut32.SysReAllocStringLen
 00407ACB    test        eax,eax
>00407ACD    je          00407638
 00407AD3    ret
*}
end;

//00407AD4
procedure @WStrLAsg(var Dest:WideString; const Source:WideString);
begin
{*
>00407AD4    jmp         @WStrAsg
 00407AD9    ret
*}
end;

//00407ADC
procedure @LStrAsg(var Dest:AnsiString; Source:AnsiString);
begin
{*
 00407ADC    test        edx,edx
>00407ADE    je          00407B08
 00407AE0    mov         ecx,dword ptr [edx-8]
 00407AE3    inc         ecx
>00407AE4    jg          00407B04
 00407AE6    push        eax
 00407AE7    push        edx
 00407AE8    mov         eax,dword ptr [edx-4]
 00407AEB    movzx       edx,word ptr [edx-0C]
 00407AEF    call        @NewAnsiString
 00407AF4    mov         edx,eax
 00407AF6    pop         eax
 00407AF7    push        edx
 00407AF8    mov         ecx,dword ptr [eax-4]
 00407AFB    call        Move
 00407B00    pop         edx
 00407B01    pop         eax
>00407B02    jmp         00407B08
 00407B04    lock inc    dword ptr [edx-8]
 00407B08    xchg        edx,dword ptr [eax]
 00407B0A    test        edx,edx
>00407B0C    je          00407B22
 00407B0E    mov         ecx,dword ptr [edx-8]
 00407B11    dec         ecx
>00407B12    jl          00407B22
 00407B14    lock dec    dword ptr [edx-8]
>00407B18    jne         00407B22
 00407B1A    lea         eax,[edx-0C]
 00407B1D    call        @FreeMem
 00407B22    ret
*}
end;

//00407B24
procedure @LStrLAsg(var Dest:AnsiString; const Source:AnsiString);
begin
{*
 00407B24    test        edx,edx
>00407B26    je          00407B32
 00407B28    mov         ecx,dword ptr [edx-8]
 00407B2B    inc         ecx
>00407B2C    jle         00407B32
 00407B2E    lock inc    dword ptr [edx-8]
 00407B32    xchg        edx,dword ptr [eax]
 00407B34    test        edx,edx
>00407B36    je          00407B4C
 00407B38    mov         ecx,dword ptr [edx-8]
 00407B3B    dec         ecx
>00407B3C    jl          00407B4C
 00407B3E    lock dec    dword ptr [edx-8]
>00407B42    jne         00407B4C
 00407B44    lea         eax,[edx-0C]
 00407B47    call        @FreeMem
 00407B4C    ret
*}
end;

//00407B50
function @UStrLen(S:UnicodeString):Integer;
begin
{*
 00407B50    test        eax,eax
>00407B52    je          00407B59
 00407B54    sub         eax,4
 00407B57    mov         eax,dword ptr [eax]
 00407B59    ret
*}
end;

//00407B5C
function @LStrLen(S:AnsiString):Integer;
begin
{*
 00407B5C    test        eax,eax
>00407B5E    je          00407B65
 00407B60    sub         eax,4
 00407B63    mov         eax,dword ptr [eax]
 00407B65    ret
*}
end;

//00407B68
function @PCharLen(P:PAnsiChar):Integer;
begin
{*
 00407B68    test        eax,eax
>00407B6A    je          00407B8D
 00407B6C    push        eax
 00407B6D    xor         ecx,ecx
 00407B6F    cmp         cl,byte ptr [eax]
>00407B71    je          00407B8A
 00407B73    cmp         cl,byte ptr [eax+1]
>00407B76    je          00407B89
 00407B78    cmp         cl,byte ptr [eax+2]
>00407B7B    je          00407B88
 00407B7D    cmp         cl,byte ptr [eax+3]
>00407B80    je          00407B87
 00407B82    add         eax,4
>00407B85    jmp         00407B6F
 00407B87    inc         eax
 00407B88    inc         eax
 00407B89    inc         eax
 00407B8A    pop         ecx
 00407B8B    sub         eax,ecx
 00407B8D    ret
*}
end;

//00407B90
function @PWCharLen(P:PWideChar):Integer;
begin
{*
 00407B90    test        eax,eax
>00407B92    je          00407BC1
 00407B94    push        eax
 00407B95    xor         ecx,ecx
 00407B97    cmp         cx,word ptr [eax]
>00407B9A    je          00407BBC
 00407B9C    cmp         cx,word ptr [eax+2]
>00407BA0    je          00407BB9
 00407BA2    cmp         cx,word ptr [eax+4]
>00407BA6    je          00407BB6
 00407BA8    cmp         cx,word ptr [eax+6]
>00407BAC    je          00407BB3
 00407BAE    add         eax,8
>00407BB1    jmp         00407B97
 00407BB3    add         eax,2
 00407BB6    add         eax,2
 00407BB9    add         eax,2
 00407BBC    pop         ecx
 00407BBD    sub         eax,ecx
 00407BBF    shr         eax,1
 00407BC1    ret
*}
end;

//00407BC4
function InternalUniqueStringU(var Str:AnsiString):Pointer;
begin
{*
 00407BC4    mov         edx,dword ptr [eax]
 00407BC6    test        edx,edx
>00407BC8    je          00407C02
 00407BCA    mov         ecx,dword ptr [edx-8]
 00407BCD    dec         ecx
>00407BCE    je          00407C02
 00407BD0    push        ebx
 00407BD1    mov         ebx,eax
 00407BD3    mov         eax,dword ptr [edx-4]
 00407BD6    call        @NewUnicodeString
 00407BDB    mov         edx,eax
 00407BDD    xchg        eax,dword ptr [ebx]
 00407BDF    push        eax
 00407BE0    mov         ecx,dword ptr [eax-4]
 00407BE3    shl         ecx,1
 00407BE5    call        Move
 00407BEA    pop         eax
 00407BEB    mov         ecx,dword ptr [eax-8]
 00407BEE    dec         ecx
>00407BEF    jl          00407BFF
 00407BF1    lock dec    dword ptr [eax-8]
>00407BF5    jne         00407BFF
 00407BF7    lea         eax,[eax-0C]
 00407BFA    call        @FreeMem
 00407BFF    mov         edx,dword ptr [ebx]
 00407C01    pop         ebx
 00407C02    mov         eax,edx
 00407C04    ret
*}
end;

//00407C08
function InternalUniqueStringA(var Str:AnsiString):Pointer;
begin
{*
 00407C08    mov         edx,dword ptr [eax]
 00407C0A    test        edx,edx
>00407C0C    je          00407C48
 00407C0E    mov         ecx,dword ptr [edx-8]
 00407C11    dec         ecx
>00407C12    je          00407C48
 00407C14    push        ebx
 00407C15    mov         ebx,eax
 00407C17    mov         eax,dword ptr [edx-4]
 00407C1A    movzx       edx,word ptr [edx-0C]
 00407C1E    call        @NewAnsiString
 00407C23    mov         edx,eax
 00407C25    xchg        eax,dword ptr [ebx]
 00407C27    push        eax
 00407C28    mov         ecx,dword ptr [eax-4]
 00407C2B    call        Move
 00407C30    pop         eax
 00407C31    mov         ecx,dword ptr [eax-8]
 00407C34    dec         ecx
>00407C35    jl          00407C45
 00407C37    lock dec    dword ptr [eax-8]
>00407C3B    jne         00407C45
 00407C3D    lea         eax,[eax-0C]
 00407C40    call        @FreeMem
 00407C45    mov         edx,dword ptr [ebx]
 00407C47    pop         ebx
 00407C48    mov         eax,edx
 00407C4A    ret
*}
end;

//00407C4C
function @UniqueStringU(var Str:AnsiString):Pointer;
begin
{*
>00407C4C    jmp         InternalUniqueStringU
 00407C51    ret
*}
end;

//00407C54
function @UniqueStringA(var Str:AnsiString):Pointer;
begin
{*
>00407C54    jmp         InternalUniqueStringA
 00407C59    ret
*}
end;

//00407C5C
procedure UniqueString(var Str:AnsiString);
begin
{*
>00407C5C    jmp         InternalUniqueStringU
 00407C61    ret
*}
end;

//00407C64
procedure @AStrCmp(S1:PShortString; S2:PShortString; Bytes:Integer);
begin
{*
 00407C64    push        ebx
 00407C65    push        esi
 00407C66    push        ecx
 00407C67    mov         esi,ecx
 00407C69    shr         esi,2
>00407C6C    je          00407C94
 00407C6E    mov         ecx,dword ptr [eax]
 00407C70    mov         ebx,dword ptr [edx]
 00407C72    cmp         ecx,ebx
>00407C74    jne         00407CBB
 00407C76    dec         esi
>00407C77    je          00407C8E
 00407C79    mov         ecx,dword ptr [eax+4]
 00407C7C    mov         ebx,dword ptr [edx+4]
 00407C7F    cmp         ecx,ebx
>00407C81    jne         00407CBB
 00407C83    add         eax,8
 00407C86    add         edx,8
 00407C89    dec         esi
>00407C8A    jne         00407C6E
>00407C8C    jmp         00407C94
 00407C8E    add         eax,4
 00407C91    add         edx,4
 00407C94    pop         esi
 00407C95    and         esi,3
>00407C98    je          00407CD0
 00407C9A    mov         cl,byte ptr [eax]
 00407C9C    cmp         cl,byte ptr [edx]
>00407C9E    jne         00407CD0
 00407CA0    dec         esi
>00407CA1    je          00407CB6
 00407CA3    mov         cl,byte ptr [eax+1]
 00407CA6    cmp         cl,byte ptr [edx+1]
>00407CA9    jne         00407CD0
 00407CAB    dec         esi
>00407CAC    je          00407CB6
 00407CAE    mov         cl,byte ptr [eax+2]
 00407CB1    cmp         cl,byte ptr [edx+2]
>00407CB4    jne         00407CD0
 00407CB6    xor         eax,eax
 00407CB8    pop         esi
 00407CB9    pop         ebx
 00407CBA    ret
 00407CBB    pop         esi
 00407CBC    cmp         cl,bl
>00407CBE    jne         00407CD0
 00407CC0    cmp         ch,bh
>00407CC2    jne         00407CD0
 00407CC4    shr         ecx,10
 00407CC7    shr         ebx,10
 00407CCA    cmp         cl,bl
>00407CCC    jne         00407CD0
 00407CCE    cmp         ch,bh
 00407CD0    pop         esi
 00407CD1    pop         ebx
 00407CD2    ret
*}
end;

//00407CD4
procedure @PStrNCpy(Dest:PShortString; Source:PShortString; MaxLen:Byte);
begin
{*
 00407CD4    push        ebx
 00407CD5    movzx       ebx,byte ptr [edx]
 00407CD8    cmp         cl,bl
>00407CDA    jbe         00407CDE
 00407CDC    mov         ecx,ebx
 00407CDE    mov         byte ptr [eax],cl
 00407CE0    inc         edx
 00407CE1    inc         eax
 00407CE2    movzx       ecx,cl
 00407CE5    xchg        eax,edx
 00407CE6    call        Move
 00407CEB    pop         ebx
 00407CEC    ret
*}
end;

//00407CF0
procedure @LStrFromChar(var Dest:AnsiString; Source:AnsiChar);
begin
{*
 00407CF0    push        edx
 00407CF1    mov         edx,esp
 00407CF3    push        ecx
 00407CF4    mov         ecx,1
 00407CF9    call        @LStrFromPCharLen
 00407CFE    pop         edx
 00407CFF    ret
*}
end;

//00407D00
procedure @LStrFromPChar(var Dest:AnsiString; Source:PAnsiChar);
begin
{*
 00407D00    push        dword ptr [esp]
 00407D03    mov         dword ptr [esp+4],ecx
 00407D07    xor         ecx,ecx
 00407D09    test        edx,edx
>00407D0B    je          00407D2E
 00407D0D    push        edx
 00407D0E    cmp         cl,byte ptr [edx]
>00407D10    je          00407D29
 00407D12    cmp         cl,byte ptr [edx+1]
>00407D15    je          00407D28
 00407D17    cmp         cl,byte ptr [edx+2]
>00407D1A    je          00407D27
 00407D1C    cmp         cl,byte ptr [edx+3]
>00407D1F    je          00407D26
 00407D21    add         edx,4
>00407D24    jmp         00407D0E
 00407D26    inc         edx
 00407D27    inc         edx
 00407D28    inc         edx
 00407D29    mov         ecx,edx
 00407D2B    pop         edx
 00407D2C    sub         ecx,edx
>00407D2E    jmp         @LStrFromPCharLen
 00407D33    ret
*}
end;

//00407D34
procedure @LStrFromPWChar(var Dest:AnsiString; Source:PWideChar);
begin
{*
 00407D34    push        dword ptr [esp]
 00407D37    mov         dword ptr [esp+4],ecx
 00407D3B    xor         ecx,ecx
 00407D3D    test        edx,edx
>00407D3F    je          00407D6E
 00407D41    push        edx
 00407D42    cmp         cx,word ptr [edx]
>00407D45    je          00407D67
 00407D47    cmp         cx,word ptr [edx+2]
>00407D4B    je          00407D64
 00407D4D    cmp         cx,word ptr [edx+4]
>00407D51    je          00407D61
 00407D53    cmp         cx,word ptr [edx+6]
>00407D57    je          00407D5E
 00407D59    add         edx,8
>00407D5C    jmp         00407D42
 00407D5E    add         edx,2
 00407D61    add         edx,2
 00407D64    add         edx,2
 00407D67    mov         ecx,edx
 00407D69    pop         edx
 00407D6A    sub         ecx,edx
 00407D6C    shr         ecx,1
>00407D6E    jmp         @LStrFromPWCharLen
 00407D73    ret
*}
end;

//00407D74
procedure @LStrFromString(var Dest:AnsiString; const Source:ShortString);
begin
{*
 00407D74    push        dword ptr [esp]
 00407D77    mov         dword ptr [esp+4],ecx
 00407D7B    xor         ecx,ecx
 00407D7D    mov         cl,byte ptr [edx]
 00407D7F    inc         edx
>00407D80    jmp         @LStrFromPCharLen
 00407D85    ret
*}
end;

//00407D88
procedure @LStrFromArray(var Dest:AnsiString; Source:PAnsiChar; Length:Integer);
begin
{*
 00407D88    push        ebp
 00407D89    mov         ebp,esp
 00407D8B    push        edi
 00407D8C    push        eax
 00407D8D    push        ecx
 00407D8E    mov         edi,edx
 00407D90    xor         eax,eax
 00407D92    repne scas  byte ptr [edi]
>00407D94    jne         00407D98
 00407D96    not         ecx
 00407D98    pop         eax
 00407D99    add         ecx,eax
 00407D9B    pop         eax
 00407D9C    pop         edi
 00407D9D    pop         ebp
>00407D9E    jmp         @LStrFromPCharLen
 00407DA3    pop         ebp
 00407DA4    ret         4
*}
end;

//00407DA8
procedure @LStrFromWStr(var Dest:AnsiString; const Source:WideString);
begin
{*
 00407DA8    push        dword ptr [esp]
 00407DAB    mov         dword ptr [esp+4],ecx
 00407DAF    xor         ecx,ecx
 00407DB1    test        edx,edx
>00407DB3    je          00407DBA
 00407DB5    mov         ecx,dword ptr [edx-4]
 00407DB8    shr         ecx,1
>00407DBA    jmp         @LStrFromPWCharLen
 00407DBF    ret
*}
end;

//00407DC0
procedure @LStrToString(var Dest:ShortString; const Source:AnsiString; MaxLen:Integer);
begin
{*
 00407DC0    push        ebx
 00407DC1    test        edx,edx
>00407DC3    je          00407DDD
 00407DC5    mov         ebx,dword ptr [edx-4]
 00407DC8    test        ebx,ebx
>00407DCA    je          00407DDD
 00407DCC    cmp         ecx,ebx
>00407DCE    jl          00407DD2
 00407DD0    mov         ecx,ebx
 00407DD2    mov         byte ptr [eax],cl
 00407DD4    inc         eax
 00407DD5    xchg        eax,edx
 00407DD6    call        Move
 00407DDB    pop         ebx
 00407DDC    ret
 00407DDD    mov         byte ptr [eax],0
 00407DE0    pop         ebx
 00407DE1    ret
*}
end;

//00407DE4
procedure @LStrCat(var Dest:AnsiString; Source:AnsiString);
begin
{*
 00407DE4    test        edx,edx
>00407DE6    je          00407E3A
 00407DE8    mov         ecx,dword ptr [eax]
 00407DEA    test        ecx,ecx
>00407DEC    je          00407ADC
 00407DF2    push        ebx
 00407DF3    push        esi
 00407DF4    push        edi
 00407DF5    mov         ebx,eax
 00407DF7    mov         esi,edx
 00407DF9    mov         edi,ecx
 00407DFB    cmp         esi,ecx
 00407DFD    mov         edi,dword ptr [ecx-4]
 00407E00    mov         edx,dword ptr [esi-4]
 00407E03    add         edx,edi
>00407E05    jo          00407E35
 00407E07    cmp         esi,ecx
>00407E09    je          00407E26
 00407E0B    movzx       ecx,word ptr [ecx-0C]
 00407E0F    call        @LStrSetLength
 00407E14    mov         eax,esi
 00407E16    mov         ecx,dword ptr [esi-4]
 00407E19    mov         edx,dword ptr [ebx]
 00407E1B    add         edx,edi
 00407E1D    call        Move
 00407E22    pop         edi
 00407E23    pop         esi
 00407E24    pop         ebx
 00407E25    ret
 00407E26    movzx       ecx,word ptr [ecx-0C]
 00407E2A    call        @LStrSetLength
 00407E2F    mov         eax,dword ptr [ebx]
 00407E31    mov         ecx,edi
>00407E33    jmp         00407E19
>00407E35    jmp         @IntOver
 00407E3A    ret
*}
end;

//00407E3C
procedure @LStrCat3(var Dest:AnsiString; Source1:AnsiString; Source2:AnsiString);
begin
{*
 00407E3C    test        edx,edx
>00407E3E    je          00407EA9
 00407E40    test        ecx,ecx
>00407E42    je          00407ADC
 00407E48    cmp         edx,dword ptr [eax]
>00407E4A    je          00407EB0
 00407E4C    cmp         ecx,dword ptr [eax]
>00407E4E    je          00407E5E
 00407E50    push        eax
 00407E51    push        ecx
 00407E52    call        @LStrAsg
 00407E57    pop         edx
 00407E58    pop         eax
>00407E59    jmp         @LStrCat
 00407E5E    push        edi
 00407E5F    mov         edi,dword ptr [edx-4]
 00407E62    add         edi,dword ptr [ecx-4]
>00407E65    jo          00407EB7
 00407E67    push        ebx
 00407E68    push        esi
 00407E69    push        eax
 00407E6A    mov         ebx,edx
 00407E6C    mov         esi,ecx
 00407E6E    mov         eax,edi
 00407E70    movzx       edx,word ptr [esi-0C]
 00407E74    call        @NewAnsiString
 00407E79    mov         edi,eax
 00407E7B    mov         edx,edi
 00407E7D    mov         eax,ebx
 00407E7F    mov         ecx,dword ptr [ebx-4]
 00407E82    call        Move
 00407E87    mov         edx,edi
 00407E89    mov         eax,esi
 00407E8B    mov         ecx,dword ptr [esi-4]
 00407E8E    add         edx,dword ptr [ebx-4]
 00407E91    call        Move
 00407E96    pop         eax
 00407E97    mov         edx,edi
 00407E99    test        edi,edi
>00407E9B    je          00407EA0
 00407E9D    dec         dword ptr [edi-8]
 00407EA0    call        @LStrAsg
 00407EA5    pop         esi
 00407EA6    pop         ebx
 00407EA7    pop         edi
 00407EA8    ret
 00407EA9    mov         edx,ecx
>00407EAB    jmp         @LStrAsg
 00407EB0    mov         edx,ecx
>00407EB2    jmp         @LStrCat
 00407EB7    pop         edi
>00407EB8    jmp         @IntOver
 00407EBD    ret
*}
end;

//00407EC0
procedure @LStrCatN(var Dest:AnsiString; ArgCnt:Integer);
begin
{*
 00407EC0    push        0
 00407EC2    push        ebx
 00407EC3    push        esi
 00407EC4    push        edi
 00407EC5    push        edx
 00407EC6    push        eax
 00407EC7    push        0
 00407EC9    mov         ebx,edx
 00407ECB    xor         edi,edi
 00407ECD    mov         ecx,dword ptr [esp+edx*4+1C]
 00407ED1    test        ecx,ecx
>00407ED3    je          00407EE9
 00407ED5    movzx       esi,word ptr [ecx-0C]
 00407ED9    mov         dword ptr [esp+18],esi
 00407EDD    cmp         dword ptr [eax],ecx
>00407EDF    jne         00407EE9
 00407EE1    mov         edi,ecx
 00407EE3    mov         eax,dword ptr [ecx-4]
 00407EE6    dec         edx
>00407EE7    jmp         00407EEB
 00407EE9    xor         eax,eax
 00407EEB    mov         ecx,dword ptr [esp+edx*4+1C]
 00407EEF    test        ecx,ecx
>00407EF1    je          00407F11
 00407EF3    add         eax,dword ptr [ecx-4]
>00407EF6    jo          00407F82
 00407EFC    cmp         dword ptr [esp+18],0
>00407F01    jne         00407F0B
 00407F03    movzx       esi,word ptr [ecx-0C]
 00407F07    mov         dword ptr [esp+18],esi
 00407F0B    cmp         edi,ecx
>00407F0D    jne         00407F11
 00407F0F    xor         edi,edi
 00407F11    dec         edx
>00407F12    jne         00407EEB
 00407F14    test        edi,edi
>00407F16    je          00407F38
 00407F18    mov         edx,eax
 00407F1A    mov         eax,dword ptr [esp+4]
 00407F1E    mov         esi,dword ptr [edi-4]
 00407F21    movzx       ecx,word ptr [edi-0C]
 00407F25    call        @LStrSetLength
 00407F2A    mov         edi,dword ptr [esp+4]
 00407F2E    mov         eax,dword ptr [edi]
 00407F30    mov         dword ptr [esp],eax
 00407F33    add         esi,dword ptr [edi]
 00407F35    dec         ebx
>00407F36    jmp         00407F46
 00407F38    mov         edx,dword ptr [esp+18]
 00407F3C    call        @NewAnsiString
 00407F41    mov         dword ptr [esp],eax
 00407F44    mov         esi,eax
 00407F46    mov         eax,dword ptr [esp+ebx*4+1C]
 00407F4A    mov         edx,esi
 00407F4C    test        eax,eax
>00407F4E    je          00407F5A
 00407F50    mov         ecx,dword ptr [eax-4]
 00407F53    add         esi,ecx
 00407F55    call        Move
 00407F5A    dec         ebx
>00407F5B    jne         00407F46
 00407F5D    mov         edx,dword ptr [esp]
 00407F60    mov         eax,dword ptr [esp+4]
 00407F64    test        edi,edi
>00407F66    jne         00407F74
 00407F68    test        edx,edx
>00407F6A    je          00407F6F
 00407F6C    dec         dword ptr [edx-8]
 00407F6F    call        @LStrAsg
 00407F74    add         esp,8
 00407F77    pop         edx
 00407F78    pop         edi
 00407F79    pop         esi
 00407F7A    pop         ebx
 00407F7B    pop         eax
 00407F7C    pop         eax
 00407F7D    lea         esp,[esp+edx*4]
 00407F80    jmp         eax
>00407F82    jmp         @IntOver
 00407F87    ret
*}
end;

//00407F88
procedure @LStrEqual(Left:AnsiString; Right:AnsiString);
begin
{*
 00407F88    cmp         eax,edx
>00407F8A    je          00407FB7
 00407F8C    test        eax,edx
>00407F8E    je          00407FBC
 00407F90    mov         ecx,dword ptr [eax-4]
 00407F93    cmp         ecx,dword ptr [edx-4]
>00407F96    jne         00407FB7
 00407F98    push        ebx
 00407F99    lea         edx,[ecx+edx-4]
 00407F9D    lea         ebx,[ecx+eax-4]
 00407FA1    neg         ecx
 00407FA3    mov         eax,dword ptr [ebx]
 00407FA5    cmp         eax,dword ptr [edx]
>00407FA7    jne         00407FB6
 00407FA9    add         ecx,4
>00407FAC    jns         00407FB8
 00407FAE    mov         eax,dword ptr [ecx+ebx]
 00407FB1    cmp         eax,dword ptr [ecx+edx]
>00407FB4    je          00407FA9
 00407FB6    pop         ebx
 00407FB7    ret
 00407FB8    xor         eax,eax
 00407FBA    pop         ebx
 00407FBB    ret
 00407FBC    test        eax,eax
>00407FBE    je          00407FC8
 00407FC0    test        edx,edx
>00407FC2    jne         00407F90
 00407FC4    cmp         dword ptr [eax-4],edx
 00407FC7    ret
 00407FC8    cmp         eax,dword ptr [edx-4]
 00407FCB    ret
*}
end;

//00407FD0
function @LStrToPChar(S:AnsiString):PChar;
begin
{*
 00407FD0    mov         edx,eax
 00407FD2    test        edx,edx
>00407FD4    jne         00407FDC
 00407FD6    mov         eax,784800
 00407FDB    ret
 00407FDC    mov         eax,edx
 00407FDE    ret
*}
end;

//00407FE0
function @LStrCopy(const S:AnsiString; Index:Integer; Count:Integer):AnsiString;
begin
{*
 00407FE0    push        ebx
 00407FE1    test        eax,eax
>00407FE3    je          00408017
 00407FE5    mov         ebx,dword ptr [eax-4]
 00407FE8    test        ebx,ebx
>00407FEA    je          00408017
 00407FEC    dec         edx
>00407FED    jl          0040800F
 00407FEF    cmp         edx,ebx
>00407FF1    jge         00408017
 00407FF3    sub         ebx,edx
 00407FF5    test        ecx,ecx
>00407FF7    jl          00408017
 00407FF9    cmp         ecx,ebx
>00407FFB    jg          00408013
 00407FFD    add         edx,eax
 00407FFF    movzx       eax,word ptr [eax-0C]
 00408003    push        eax
 00408004    mov         eax,dword ptr [esp+0C]
 00408008    call        @LStrFromPCharLen
>0040800D    jmp         00408020
 0040800F    xor         edx,edx
>00408011    jmp         00407FF3
 00408013    mov         ecx,ebx
>00408015    jmp         00407FFD
 00408017    mov         eax,dword ptr [esp+8]
 0040801B    call        @LStrClr
 00408020    pop         ebx
 00408021    ret         4
*}
end;

//00408028
procedure @LStrDelete(var S:AnsiString; Index:Integer; Count:Integer);
begin
{*
 00408028    push        ebx
 00408029    push        esi
 0040802A    push        edi
 0040802B    mov         ebx,eax
 0040802D    mov         esi,edx
 0040802F    mov         edi,ecx
 00408031    call        InternalUniqueStringA
 00408036    mov         edx,dword ptr [ebx]
 00408038    test        edx,edx
>0040803A    je          00408070
 0040803C    mov         ecx,dword ptr [edx-4]
 0040803F    dec         esi
>00408040    jl          00408070
 00408042    cmp         esi,ecx
>00408044    jge         00408070
 00408046    test        edi,edi
>00408048    jle         00408070
 0040804A    sub         ecx,esi
 0040804C    cmp         edi,ecx
>0040804E    jle         00408052
 00408050    mov         edi,ecx
 00408052    sub         ecx,edi
 00408054    add         edx,esi
 00408056    lea         eax,[edi+edx]
 00408059    call        Move
 0040805E    mov         edx,dword ptr [ebx]
 00408060    mov         eax,ebx
 00408062    movzx       ecx,word ptr [edx-0C]
 00408066    mov         edx,dword ptr [edx-4]
 00408069    sub         edx,edi
 0040806B    call        @LStrSetLength
 00408070    pop         edi
 00408071    pop         esi
 00408072    pop         ebx
 00408073    ret
*}
end;

//00408074
procedure @LStrSetLength(var S:AnsiString; NewLen:Integer);
begin
{*
 00408074    push        ebx
 00408075    push        esi
 00408076    push        edi
 00408077    push        ebp
 00408078    push        0
 0040807A    mov         ebx,eax
 0040807C    mov         esi,edx
 0040807E    mov         ebp,ecx
 00408080    xor         edi,edi
 00408082    test        edx,edx
>00408084    jle         004080DB
 00408086    mov         eax,dword ptr [ebx]
 00408088    test        eax,eax
>0040808A    je          004080BA
 0040808C    cmp         dword ptr [eax-8],1
>00408090    jne         004080BA
 00408092    sub         eax,0C
 00408095    add         edx,0D
>00408098    jo          004080B5
 0040809A    mov         dword ptr [esp],eax
 0040809D    mov         eax,esp
 0040809F    call        @ReallocMem
 004080A4    mov         eax,dword ptr [esp]
 004080A7    add         eax,0C
 004080AA    mov         dword ptr [ebx],eax
 004080AC    mov         dword ptr [eax-4],esi
 004080AF    mov         byte ptr [esi+eax],0
>004080B3    jmp         004080E4
>004080B5    jmp         @IntOver
 004080BA    mov         eax,edx
 004080BC    mov         edx,ebp
 004080BE    call        @NewAnsiString
 004080C3    mov         edi,eax
 004080C5    mov         eax,dword ptr [ebx]
 004080C7    test        eax,eax
>004080C9    je          004080DB
 004080CB    mov         edx,edi
 004080CD    mov         ecx,dword ptr [eax-4]
 004080D0    cmp         ecx,esi
>004080D2    jl          004080D6
 004080D4    mov         ecx,esi
 004080D6    call        Move
 004080DB    mov         eax,ebx
 004080DD    call        @LStrClr
 004080E2    mov         dword ptr [ebx],edi
 004080E4    pop         edx
 004080E5    pop         ebp
 004080E6    pop         edi
 004080E7    pop         esi
 004080E8    pop         ebx
 004080E9    ret
*}
end;

//004080EC
procedure @LStrFromUStr(var Dest:AnsiString; const Source:AnsiString; CodePage:Word);
begin
{*
 004080EC    push        dword ptr [esp]
 004080EF    mov         dword ptr [esp+4],ecx
 004080F3    xor         ecx,ecx
 004080F5    test        edx,edx
>004080F7    je          004080FC
 004080F9    mov         ecx,dword ptr [edx-4]
>004080FC    jmp         @LStrFromPWCharLen
 00408101    ret
*}
end;

//00408104
procedure WStrSet(var S:WideString; P:PWideChar);
begin
{*
 00408104    xchg        edx,dword ptr [eax]
 00408106    test        edx,edx
>00408108    je          00408110
 0040810A    push        edx
 0040810B    call        oleaut32.SysFreeString
 00408110    ret
*}
end;

//00408114
procedure @WStrFromWChar(var Dest:WideString; Source:WideChar);
begin
{*
 00408114    push        edx
 00408115    mov         edx,esp
 00408117    mov         ecx,1
 0040811C    call        @WStrFromPWCharLen
 00408121    pop         edx
 00408122    ret
*}
end;

//00408124
procedure @WStrFromPChar(var Dest:WideString; Source:PAnsiChar);
begin
{*
 00408124    xor         ecx,ecx
 00408126    test        edx,edx
>00408128    je          0040814B
 0040812A    push        edx
 0040812B    cmp         cl,byte ptr [edx]
>0040812D    je          00408146
 0040812F    cmp         cl,byte ptr [edx+1]
>00408132    je          00408145
 00408134    cmp         cl,byte ptr [edx+2]
>00408137    je          00408144
 00408139    cmp         cl,byte ptr [edx+3]
>0040813C    je          00408143
 0040813E    add         edx,4
>00408141    jmp         0040812B
 00408143    inc         edx
 00408144    inc         edx
 00408145    inc         edx
 00408146    mov         ecx,edx
 00408148    pop         edx
 00408149    sub         ecx,edx
>0040814B    jmp         @WStrFromPCharLen
 00408150    ret
*}
end;

//00408154
procedure @WStrFromPWChar(var Dest:WideString; Source:PWideChar);
begin
{*
 00408154    xor         ecx,ecx
 00408156    test        edx,edx
>00408158    je          00408187
 0040815A    push        edx
 0040815B    cmp         cx,word ptr [edx]
>0040815E    je          00408180
 00408160    cmp         cx,word ptr [edx+2]
>00408164    je          0040817D
 00408166    cmp         cx,word ptr [edx+4]
>0040816A    je          0040817A
 0040816C    cmp         cx,word ptr [edx+6]
>00408170    je          00408177
 00408172    add         edx,8
>00408175    jmp         0040815B
 00408177    add         edx,2
 0040817A    add         edx,2
 0040817D    add         edx,2
 00408180    mov         ecx,edx
 00408182    pop         edx
 00408183    sub         ecx,edx
 00408185    shr         ecx,1
>00408187    jmp         @WStrFromPWCharLen
 0040818C    ret
*}
end;

//00408190
procedure @WStrFromWArray(var Dest:WideString; Source:PWideChar; Length:Integer);
begin
{*
 00408190    push        edi
 00408191    push        eax
 00408192    push        ecx
 00408193    mov         edi,edx
 00408195    xor         eax,eax
 00408197    repne scas  word ptr [edi]
>0040819A    jne         0040819E
 0040819C    not         ecx
 0040819E    pop         eax
 0040819F    add         ecx,eax
 004081A1    pop         eax
 004081A2    pop         edi
>004081A3    jmp         @WStrFromPWCharLen
 004081A8    ret
*}
end;

//004081AC
procedure @WStrFromLStr(var Dest:WideString; const Source:AnsiString);
begin
{*
 004081AC    xor         ecx,ecx
 004081AE    test        edx,edx
>004081B0    je          004081C5
 004081B2    movzx       ecx,word ptr [edx-0C]
 004081B6    push        dword ptr [esp]
 004081B9    mov         dword ptr [esp+4],ecx
 004081BD    mov         ecx,dword ptr [edx-4]
>004081C0    jmp         InternalWStrFromPCharLen
>004081C5    jmp         @WStrClr
 004081CA    ret
*}
end;

//004081CC
function @WStrToPWChar(S:WideString):PWideChar;
begin
{*
 004081CC    mov         edx,eax
 004081CE    test        edx,edx
>004081D0    jne         004081D8
 004081D2    mov         eax,4081DC
 004081D7    ret
 004081D8    mov         eax,edx
 004081DA    ret
*}
end;

//004081E0
procedure @WStrCat(var Dest:WideString; Source:WideString);
begin
{*
 004081E0    push        ebx
 004081E1    push        esi
 004081E2    push        edi
 004081E3    add         esp,0FFFFFFF4
 004081E6    mov         dword ptr [esp+4],edx
 004081EA    mov         dword ptr [esp],eax
 004081ED    mov         eax,dword ptr [esp+4]
 004081F1    test        eax,eax
>004081F3    je          004081FC
 004081F5    sub         eax,4
 004081F8    mov         eax,dword ptr [eax]
 004081FA    shr         eax,1
 004081FC    mov         ebx,eax
 004081FE    test        ebx,ebx
>00408200    je          00408254
 00408202    mov         eax,dword ptr [esp]
 00408205    mov         eax,dword ptr [eax]
 00408207    mov         dword ptr [esp+8],eax
 0040820B    mov         eax,dword ptr [esp+8]
 0040820F    test        eax,eax
>00408211    je          0040821A
 00408213    sub         eax,4
 00408216    mov         eax,dword ptr [eax]
 00408218    shr         eax,1
 0040821A    mov         esi,eax
 0040821C    lea         eax,[ebx+esi]
 0040821F    call        @NewWideString
 00408224    mov         edi,eax
 00408226    test        esi,esi
>00408228    jle         0040823A
 0040822A    mov         ecx,esi
 0040822C    add         ecx,ecx
 0040822E    mov         edx,edi
 00408230    mov         eax,dword ptr [esp]
 00408233    mov         eax,dword ptr [eax]
 00408235    call        Move
 0040823A    lea         edx,[edi+esi*2]
 0040823D    mov         ecx,ebx
 0040823F    add         ecx,ecx
 00408241    mov         eax,dword ptr [esp+4]
 00408245    call        Move
 0040824A    mov         eax,dword ptr [esp]
 0040824D    mov         edx,edi
 0040824F    call        WStrSet
 00408254    add         esp,0C
 00408257    pop         edi
 00408258    pop         esi
 00408259    pop         ebx
 0040825A    ret
*}
end;

//0040825C
procedure @WStrCat3(var Dest:WideString; Source1:WideString; Source2:WideString);
begin
{*
 0040825C    push        ebx
 0040825D    push        esi
 0040825E    push        edi
 0040825F    push        ebp
 00408260    add         esp,0FFFFFFF8
 00408263    mov         dword ptr [esp+4],ecx
 00408267    mov         ebp,edx
 00408269    mov         dword ptr [esp],eax
 0040826C    mov         eax,ebp
 0040826E    test        eax,eax
>00408270    je          00408279
 00408272    sub         eax,4
 00408275    mov         eax,dword ptr [eax]
 00408277    shr         eax,1
 00408279    mov         ebx,eax
 0040827B    mov         eax,dword ptr [esp+4]
 0040827F    test        eax,eax
>00408281    je          0040828A
 00408283    sub         eax,4
 00408286    mov         eax,dword ptr [eax]
 00408288    shr         eax,1
 0040828A    mov         esi,eax
 0040828C    test        ebx,ebx
>0040828E    jne         00408294
 00408290    test        esi,esi
>00408292    je          004082C7
 00408294    lea         eax,[esi+ebx]
 00408297    call        @NewWideString
 0040829C    mov         edi,eax
 0040829E    mov         ecx,ebx
 004082A0    add         ecx,ecx
 004082A2    mov         edx,edi
 004082A4    mov         eax,ebp
 004082A6    call        Move
 004082AB    lea         edx,[edi+ebx*2]
 004082AE    mov         ecx,esi
 004082B0    add         ecx,ecx
 004082B2    mov         eax,dword ptr [esp+4]
 004082B6    call        Move
 004082BB    mov         eax,dword ptr [esp]
 004082BE    mov         edx,edi
 004082C0    call        WStrSet
>004082C5    jmp         004082CF
 004082C7    mov         eax,dword ptr [esp]
 004082CA    call        @WStrClr
 004082CF    pop         ecx
 004082D0    pop         edx
 004082D1    pop         ebp
 004082D2    pop         edi
 004082D3    pop         esi
 004082D4    pop         ebx
 004082D5    ret
*}
end;

//004082D8
procedure @WStrCatN(var Dest:WideString; ArgCnt:Integer);
begin
{*
 004082D8    push        ebx
 004082D9    push        esi
 004082DA    push        edx
 004082DB    push        eax
 004082DC    mov         ebx,edx
 004082DE    xor         eax,eax
 004082E0    mov         ecx,dword ptr [esp+edx*4+10]
 004082E4    test        ecx,ecx
>004082E6    je          004082EB
 004082E8    add         eax,dword ptr [ecx-4]
 004082EB    dec         edx
>004082EC    jne         004082E0
 004082EE    shr         eax,1
 004082F0    call        @NewWideString
 004082F5    push        eax
 004082F6    mov         esi,eax
 004082F8    mov         eax,dword ptr [esp+ebx*4+14]
 004082FC    mov         edx,esi
 004082FE    test        eax,eax
>00408300    je          0040830C
 00408302    mov         ecx,dword ptr [eax-4]
 00408305    add         esi,ecx
 00408307    call        Move
 0040830C    dec         ebx
>0040830D    jne         004082F8
 0040830F    pop         edx
 00408310    pop         eax
 00408311    call        WStrSet
 00408316    pop         edx
 00408317    pop         esi
 00408318    pop         ebx
 00408319    pop         eax
 0040831A    lea         esp,[esp+edx*4]
 0040831D    jmp         eax
 0040831F    ret
*}
end;

//00408320
{*function @WStrCmp(Left:WideString; Right:WideString):?;
begin
 00408320    push        ebx
 00408321    push        esi
 00408322    push        edi
 00408323    mov         esi,eax
 00408325    mov         edi,edx
 00408327    cmp         eax,edx
>00408329    je          0040839D
 0040832B    test        esi,esi
>0040832D    je          00408380
 0040832F    test        edi,edi
>00408331    je          00408387
 00408333    mov         eax,dword ptr [esi-4]
 00408336    mov         edx,dword ptr [edi-4]
 00408339    sub         eax,edx
>0040833B    ja          0040833F
 0040833D    add         edx,eax
 0040833F    push        edx
 00408340    shr         edx,2
>00408343    je          0040836B
 00408345    mov         ecx,dword ptr [esi]
 00408347    mov         ebx,dword ptr [edi]
 00408349    cmp         ecx,ebx
>0040834B    jne         0040838E
 0040834D    dec         edx
>0040834E    je          00408365
 00408350    mov         ecx,dword ptr [esi+4]
 00408353    mov         ebx,dword ptr [edi+4]
 00408356    cmp         ecx,ebx
>00408358    jne         0040838E
 0040835A    add         esi,8
 0040835D    add         edi,8
 00408360    dec         edx
>00408361    jne         00408345
>00408363    jmp         0040836B
 00408365    add         esi,4
 00408368    add         edi,4
 0040836B    pop         edx
 0040836C    and         edx,2
>0040836F    je          0040837C
 00408371    mov         cx,word ptr [esi]
 00408374    mov         bx,word ptr [edi]
 00408377    cmp         cx,bx
>0040837A    jne         0040839D
 0040837C    add         eax,eax
>0040837E    jmp         0040839D
 00408380    mov         edx,dword ptr [edi-4]
 00408383    sub         eax,edx
>00408385    jmp         0040839D
 00408387    mov         eax,dword ptr [esi-4]
 0040838A    sub         eax,edx
>0040838C    jmp         0040839D
 0040838E    pop         edx
 0040838F    cmp         cx,bx
>00408392    jne         0040839D
 00408394    shr         ecx,10
 00408397    shr         ebx,10
 0040839A    cmp         cx,bx
 0040839D    pop         edi
 0040839E    pop         esi
 0040839F    pop         ebx
 004083A0    ret
end;*}

//004083A4
procedure @WStrEqual(Left:WideString; Right:WideString);
begin
{*
>004083A4    jmp         @WStrCmp
 004083A9    ret
*}
end;

//004083AC
function @WStrCopy(const S:WideString; Index:Integer; Count:Integer):WideString;
begin
{*
 004083AC    push        ebp
 004083AD    mov         ebp,esp
 004083AF    push        ebx
 004083B0    push        esi
 004083B1    mov         ebx,eax
 004083B3    test        ebx,ebx
>004083B5    je          004083BE
 004083B7    sub         ebx,4
 004083BA    mov         ebx,dword ptr [ebx]
 004083BC    shr         ebx,1
 004083BE    cmp         edx,1
>004083C1    jge         004083C7
 004083C3    xor         edx,edx
>004083C5    jmp         004083CE
 004083C7    dec         edx
 004083C8    cmp         ebx,edx
>004083CA    jge         004083CE
 004083CC    mov         edx,ebx
 004083CE    test        ecx,ecx
>004083D0    jge         004083D6
 004083D2    xor         esi,esi
>004083D4    jmp         004083E0
 004083D6    mov         esi,ebx
 004083D8    sub         esi,edx
 004083DA    cmp         ecx,esi
>004083DC    jge         004083E0
 004083DE    mov         esi,ecx
 004083E0    mov         ecx,dword ptr [ebp+8]
 004083E3    add         edx,edx
 004083E5    add         edx,eax
 004083E7    mov         eax,esi
 004083E9    xchg        eax,ecx
 004083EA    call        @WStrFromPWCharLen
 004083EF    pop         esi
 004083F0    pop         ebx
 004083F1    pop         ebp
 004083F2    ret         4
*}
end;

//004083F8
procedure @WStrDelete(var S:WideString; Index:Integer; Count:Integer);
begin
{*
 004083F8    push        ebx
 004083F9    push        esi
 004083FA    push        edi
 004083FB    push        ebp
 004083FC    add         esp,0FFFFFFF8
 004083FF    mov         ebx,edx
 00408401    mov         dword ptr [esp],eax
 00408404    mov         eax,dword ptr [esp]
 00408407    mov         eax,dword ptr [eax]
 00408409    mov         dword ptr [esp+4],eax
 0040840D    mov         eax,dword ptr [esp+4]
 00408411    test        eax,eax
>00408413    je          0040841C
 00408415    sub         eax,4
 00408418    mov         eax,dword ptr [eax]
 0040841A    shr         eax,1
 0040841C    mov         esi,eax
 0040841E    test        esi,esi
>00408420    jle         0040848B
 00408422    cmp         ebx,1
>00408425    jl          0040848B
 00408427    cmp         esi,ebx
>00408429    jl          0040848B
 0040842B    test        ecx,ecx
>0040842D    jle         0040848B
 0040842F    dec         ebx
 00408430    mov         edi,esi
 00408432    sub         edi,ebx
 00408434    sub         edi,ecx
 00408436    test        edi,edi
>00408438    jge         0040843C
 0040843A    xor         edi,edi
 0040843C    test        ebx,ebx
>0040843E    jne         00408448
 00408440    test        edi,edi
>00408442    jne         00408448
 00408444    xor         ebp,ebp
>00408446    jmp         00408481
 00408448    lea         eax,[edi+ebx]
 0040844B    call        @NewWideString
 00408450    mov         ebp,eax
 00408452    test        ebx,ebx
>00408454    jle         00408466
 00408456    mov         ecx,ebx
 00408458    add         ecx,ecx
 0040845A    mov         edx,ebp
 0040845C    mov         eax,dword ptr [esp]
 0040845F    mov         eax,dword ptr [eax]
 00408461    call        Move
 00408466    test        edi,edi
>00408468    jle         00408481
 0040846A    sub         esi,edi
 0040846C    mov         eax,dword ptr [esp]
 0040846F    mov         eax,dword ptr [eax]
 00408471    lea         eax,[eax+esi*2]
 00408474    mov         ecx,edi
 00408476    add         ecx,ecx
 00408478    lea         edx,[ebp+ebx*2]
 0040847C    call        Move
 00408481    mov         eax,dword ptr [esp]
 00408484    mov         edx,ebp
 00408486    call        WStrSet
 0040848B    pop         ecx
 0040848C    pop         edx
 0040848D    pop         ebp
 0040848E    pop         edi
 0040848F    pop         esi
 00408490    pop         ebx
 00408491    ret
*}
end;

//00408494
procedure @WStrSetLength(var S:WideString; NewLen:Integer);
begin
{*
 00408494    push        ebx
 00408495    push        esi
 00408496    push        edi
 00408497    push        ecx
 00408498    mov         esi,edx
 0040849A    mov         edi,eax
 0040849C    xor         ebx,ebx
 0040849E    test        esi,esi
>004084A0    jle         004084D7
 004084A2    mov         eax,esi
 004084A4    call        @NewWideString
 004084A9    mov         ebx,eax
 004084AB    mov         edx,dword ptr [edi]
 004084AD    mov         eax,edx
 004084AF    mov         dword ptr [esp],eax
 004084B2    mov         eax,dword ptr [esp]
 004084B5    test        eax,eax
>004084B7    je          004084C0
 004084B9    sub         eax,4
 004084BC    mov         eax,dword ptr [eax]
 004084BE    shr         eax,1
 004084C0    test        eax,eax
>004084C2    jle         004084D7
 004084C4    cmp         esi,eax
>004084C6    jge         004084CA
 004084C8    mov         eax,esi
 004084CA    mov         ecx,eax
 004084CC    add         ecx,ecx
 004084CE    mov         eax,edx
 004084D0    mov         edx,ebx
 004084D2    call        Move
 004084D7    mov         eax,edi
 004084D9    mov         edx,ebx
 004084DB    call        WStrSet
 004084E0    pop         edx
 004084E1    pop         edi
 004084E2    pop         esi
 004084E3    pop         ebx
 004084E4    ret
*}
end;

//004084E8
function @UStrToPWChar(S:UnicodeString):PWideChar;
begin
{*
 004084E8    mov         edx,eax
 004084EA    test        edx,edx
>004084EC    jne         004084F4
 004084EE    mov         eax,78480E
 004084F3    ret
 004084F4    mov         eax,edx
 004084F6    ret
*}
end;

//004084F8
procedure @UStrFromWChar(var Dest:UnicodeString; Source:WideChar);
begin
{*
 004084F8    push        edx
 004084F9    mov         edx,esp
 004084FB    mov         ecx,1
 00408500    call        @UStrFromPWCharLen
 00408505    pop         edx
 00408506    ret
*}
end;

//00408508
procedure @UStrFromPChar(var Dest:UnicodeString; Source:PAnsiChar);
begin
{*
 00408508    xor         ecx,ecx
 0040850A    test        edx,edx
>0040850C    je          0040852F
 0040850E    push        edx
 0040850F    cmp         cl,byte ptr [edx]
>00408511    je          0040852A
 00408513    cmp         cl,byte ptr [edx+1]
>00408516    je          00408529
 00408518    cmp         cl,byte ptr [edx+2]
>0040851B    je          00408528
 0040851D    cmp         cl,byte ptr [edx+3]
>00408520    je          00408527
 00408522    add         edx,4
>00408525    jmp         0040850F
 00408527    inc         edx
 00408528    inc         edx
 00408529    inc         edx
 0040852A    mov         ecx,edx
 0040852C    pop         edx
 0040852D    sub         ecx,edx
>0040852F    jmp         @UStrFromPCharLen
 00408534    ret
*}
end;

//00408538
procedure @UStrFromPWChar(var Dest:UnicodeString; Source:PWideChar);
begin
{*
 00408538    xor         ecx,ecx
 0040853A    test        edx,edx
>0040853C    je          0040856B
 0040853E    push        edx
 0040853F    cmp         cx,word ptr [edx]
>00408542    je          00408564
 00408544    cmp         cx,word ptr [edx+2]
>00408548    je          00408561
 0040854A    cmp         cx,word ptr [edx+4]
>0040854E    je          0040855E
 00408550    cmp         cx,word ptr [edx+6]
>00408554    je          0040855B
 00408556    add         edx,8
>00408559    jmp         0040853F
 0040855B    add         edx,2
 0040855E    add         edx,2
 00408561    add         edx,2
 00408564    mov         ecx,edx
 00408566    pop         edx
 00408567    sub         ecx,edx
 00408569    shr         ecx,1
>0040856B    jmp         @UStrFromPWCharLen
 00408570    ret
*}
end;

//00408574
procedure @UStrFromArray(var Dest:UnicodeString; Source:PAnsiChar; Length:Integer);
begin
{*
 00408574    push        edi
 00408575    push        eax
 00408576    push        ecx
 00408577    mov         edi,edx
 00408579    xor         eax,eax
 0040857B    repne scas  byte ptr [edi]
>0040857D    jne         00408581
 0040857F    not         ecx
 00408581    pop         eax
 00408582    add         ecx,eax
 00408584    pop         eax
 00408585    pop         edi
>00408586    jmp         @UStrFromPCharLen
 0040858B    ret
*}
end;

//0040858C
procedure @UStrFromWArray(var Dest:UnicodeString; Source:PWideChar; Length:Integer);
begin
{*
 0040858C    push        edi
 0040858D    push        eax
 0040858E    push        ecx
 0040858F    mov         edi,edx
 00408591    xor         eax,eax
 00408593    repne scas  word ptr [edi]
>00408596    jne         0040859A
 00408598    not         ecx
 0040859A    pop         eax
 0040859B    add         ecx,eax
 0040859D    pop         eax
 0040859E    pop         edi
>0040859F    jmp         @UStrFromPWCharLen
 004085A4    ret
*}
end;

//004085A8
procedure @UStrFromLStr(var Dest:UnicodeString; const Source:AnsiString);
begin
{*
 004085A8    xor         ecx,ecx
 004085AA    test        edx,edx
>004085AC    je          004085C1
 004085AE    movzx       ecx,word ptr [edx-0C]
 004085B2    push        dword ptr [esp]
 004085B5    mov         dword ptr [esp+4],ecx
 004085B9    mov         ecx,dword ptr [edx-4]
>004085BC    jmp         InternalUStrFromPCharLen
>004085C1    jmp         @UStrFromPCharLen
 004085C6    ret
*}
end;

//004085C8
procedure @UStrFromWStr(var Dest:UnicodeString; const Source:WideString);
begin
{*
 004085C8    xor         ecx,ecx
 004085CA    test        edx,edx
>004085CC    je          004085D3
 004085CE    mov         ecx,dword ptr [edx-4]
 004085D1    shr         ecx,1
>004085D3    jmp         @UStrFromPWCharLen
 004085D8    ret
*}
end;

//004085DC
procedure @WStrFromUStr(var Dest:WideString; const Source:AnsiString);
begin
{*
 004085DC    xor         ecx,ecx
 004085DE    test        edx,edx
>004085E0    je          004085E5
 004085E2    mov         ecx,dword ptr [edx-4]
>004085E5    jmp         @WStrFromPWCharLen
 004085EA    ret
*}
end;

//004085EC
procedure @UStrToString(var Dest:ShortString; const Source:UnicodeString; MaxLen:Integer);
begin
{*
 004085EC    push        ebx
 004085ED    push        esi
 004085EE    add         esp,0FFFFFE00
 004085F4    mov         ebx,ecx
 004085F6    mov         esi,eax
 004085F8    cmp         ebx,0FF
>004085FE    jle         00408605
 00408600    mov         ebx,0FF
 00408605    mov         eax,edx
 00408607    test        eax,eax
>00408609    je          00408610
 0040860B    sub         eax,4
 0040860E    mov         eax,dword ptr [eax]
 00408610    cmp         ebx,eax
>00408612    jg          00408616
 00408614    mov         eax,ebx
 00408616    test        eax,eax
>00408618    jne         0040861E
 0040861A    xor         eax,eax
>0040861C    jmp         0040863D
 0040861E    push        eax
 0040861F    lea         eax,[esp+4]
 00408623    mov         ecx,edx
 00408625    mov         edx,1FF
 0040862A    call        CharFromWChar
 0040862F    test        eax,eax
>00408631    jge         00408637
 00408633    xor         eax,eax
>00408635    jmp         0040863D
 00408637    cmp         ebx,eax
>00408639    jge         0040863D
 0040863B    mov         eax,ebx
 0040863D    mov         byte ptr [esi],al
 0040863F    test        eax,eax
>00408641    jle         0040864E
 00408643    lea         edx,[esi+1]
 00408646    mov         ecx,esp
 00408648    xchg        eax,ecx
 00408649    call        Move
 0040864E    add         esp,200
 00408654    pop         esi
 00408655    pop         ebx
 00408656    ret
*}
end;

//00408658
procedure @UStrFromString(var Dest:UnicodeString; const Source:ShortString);
begin
{*
 00408658    xor         ecx,ecx
 0040865A    mov         cl,byte ptr [edx]
 0040865C    inc         edx
>0040865D    jmp         @UStrFromPCharLen
 00408662    ret
*}
end;

//00408664
procedure @UStrSetLength(var S:UnicodeString; NewLen:Integer);
begin
{*
 00408664    push        ebx
 00408665    push        esi
 00408666    push        edi
 00408667    mov         ebx,eax
 00408669    mov         esi,edx
 0040866B    xor         edi,edi
 0040866D    test        edx,edx
>0040866F    jle         004086D5
 00408671    mov         eax,dword ptr [ebx]
 00408673    test        eax,eax
>00408675    je          004086B4
 00408677    cmp         dword ptr [eax-8],1
>0040867B    jne         004086B4
 0040867D    sub         eax,0C
 00408680    add         edx,edx
>00408682    jo          004086AF
 00408684    add         edx,0E
>00408687    jo          004086AF
 00408689    push        eax
 0040868A    mov         eax,esp
 0040868C    call        @ReallocMem
 00408691    pop         eax
 00408692    add         eax,0C
 00408695    mov         dword ptr [ebx],eax
 00408697    mov         dword ptr [eax-4],esi
 0040869A    mov         word ptr [eax+esi*2],0
 004086A0    test        edi,edi
>004086A2    je          004086DE
 004086A4    push        edi
 004086A5    mov         eax,esp
 004086A7    call        @LStrClr
 004086AC    pop         edi
>004086AD    jmp         004086DE
>004086AF    jmp         @IntOver
 004086B4    mov         eax,edx
 004086B6    call        @NewUnicodeString
 004086BB    mov         edi,eax
 004086BD    mov         eax,dword ptr [ebx]
 004086BF    test        eax,eax
>004086C1    je          004086D5
 004086C3    mov         edx,edi
 004086C5    mov         ecx,dword ptr [eax-4]
 004086C8    cmp         ecx,esi
>004086CA    jl          004086CE
 004086CC    mov         ecx,esi
 004086CE    shl         ecx,1
 004086D0    call        Move
 004086D5    mov         eax,ebx
 004086D7    call        @LStrClr
 004086DC    mov         dword ptr [ebx],edi
 004086DE    pop         edi
 004086DF    pop         esi
 004086E0    pop         ebx
 004086E1    ret
*}
end;

//004086E4
procedure @UStrCat(var Dest:UnicodeString; Source:UnicodeString);
begin
{*
 004086E4    test        edx,edx
>004086E6    je          00408738
 004086E8    mov         ecx,dword ptr [eax]
 004086EA    test        ecx,ecx
>004086EC    je          00407A38
 004086F2    push        ebx
 004086F3    push        esi
 004086F4    push        edi
 004086F5    mov         ebx,eax
 004086F7    mov         esi,edx
 004086F9    mov         edi,dword ptr [ecx-4]
 004086FC    mov         edx,dword ptr [esi-4]
 004086FF    add         edx,edi
 00408701    test        edx,0C0000000
>00408707    jne         00408733
 00408709    cmp         esi,ecx
>0040870B    je          00408728
 0040870D    call        @UStrSetLength
 00408712    mov         eax,esi
 00408714    mov         ecx,dword ptr [esi-4]
 00408717    mov         edx,dword ptr [ebx]
 00408719    shl         edi,1
 0040871B    add         edx,edi
 0040871D    shl         ecx,1
 0040871F    call        Move
 00408724    pop         edi
 00408725    pop         esi
 00408726    pop         ebx
 00408727    ret
 00408728    call        @UStrSetLength
 0040872D    mov         eax,dword ptr [ebx]
 0040872F    mov         ecx,edi
>00408731    jmp         00408717
>00408733    jmp         @IntOver
 00408738    ret
*}
end;

//0040873C
procedure @UStrCat3(var Dest:UnicodeString; Source1:UnicodeString; Source2:UnicodeString);
begin
{*
 0040873C    test        edx,edx
>0040873E    je          004087AE
 00408740    test        ecx,ecx
>00408742    je          00407A38
 00408748    cmp         edx,dword ptr [eax]
>0040874A    je          004087B5
 0040874C    cmp         ecx,dword ptr [eax]
>0040874E    je          0040875E
 00408750    push        eax
 00408751    push        ecx
 00408752    call        @UStrAsg
 00408757    pop         edx
 00408758    pop         eax
>00408759    jmp         @UStrCat
 0040875E    push        ebx
 0040875F    push        esi
 00408760    push        edi
 00408761    mov         ebx,edx
 00408763    mov         esi,ecx
 00408765    push        eax
 00408766    mov         eax,dword ptr [ebx-4]
 00408769    add         eax,dword ptr [esi-4]
 0040876C    test        eax,0C0000000
>00408771    jne         004087BC
 00408773    call        @NewUnicodeString
 00408778    mov         edi,eax
 0040877A    mov         edx,edi
 0040877C    mov         eax,ebx
 0040877E    mov         ecx,dword ptr [ebx-4]
 00408781    shl         ecx,1
 00408783    call        Move
 00408788    mov         eax,esi
 0040878A    mov         ecx,dword ptr [esi-4]
 0040878D    shl         ecx,1
 0040878F    mov         edx,dword ptr [ebx-4]
 00408792    shl         edx,1
 00408794    add         edx,edi
 00408796    call        Move
 0040879B    pop         eax
 0040879C    mov         edx,edi
 0040879E    test        edi,edi
>004087A0    je          004087A5
 004087A2    dec         dword ptr [edi-8]
 004087A5    call        @UStrAsg
 004087AA    pop         edi
 004087AB    pop         esi
 004087AC    pop         ebx
 004087AD    ret
 004087AE    mov         edx,ecx
>004087B0    jmp         @UStrAsg
 004087B5    mov         edx,ecx
>004087B7    jmp         @UStrCat
>004087BC    jmp         @IntOver
 004087C1    ret
*}
end;

//004087C4
procedure @UStrCatN(var Dest:UnicodeString; ArgCnt:Integer);
begin
{*
 004087C4    sub         esp,4
 004087C7    push        ebx
 004087C8    push        esi
 004087C9    push        edi
 004087CA    push        edx
 004087CB    push        eax
 004087CC    push        0
 004087CE    mov         ebx,edx
 004087D0    xor         edi,edi
 004087D2    mov         ecx,dword ptr [esp+edx*4+1C]
 004087D6    test        ecx,ecx
>004087D8    je          004087E6
 004087DA    cmp         dword ptr [eax],ecx
>004087DC    jne         004087E6
 004087DE    mov         edi,ecx
 004087E0    mov         eax,dword ptr [ecx-4]
 004087E3    dec         edx
>004087E4    jmp         004087E8
 004087E6    xor         eax,eax
 004087E8    mov         ecx,dword ptr [esp+edx*4+1C]
 004087EC    test        ecx,ecx
>004087EE    je          00408800
 004087F0    add         eax,dword ptr [ecx-4]
 004087F3    test        eax,0C0000000
>004087F8    jne         0040886D
 004087FA    cmp         edi,ecx
>004087FC    jne         00408800
 004087FE    xor         edi,edi
 00408800    dec         edx
>00408801    jne         004087E8
 00408803    test        edi,edi
>00408805    je          00408825
 00408807    mov         edx,eax
 00408809    mov         eax,dword ptr [esp+4]
 0040880D    mov         esi,dword ptr [edi-4]
 00408810    call        @UStrSetLength
 00408815    mov         edi,dword ptr [esp+4]
 00408819    mov         eax,dword ptr [edi]
 0040881B    mov         dword ptr [esp],eax
 0040881E    shl         esi,1
 00408820    add         esi,dword ptr [edi]
 00408822    dec         ebx
>00408823    jmp         0040882F
 00408825    call        @NewUnicodeString
 0040882A    mov         dword ptr [esp],eax
 0040882D    mov         esi,eax
 0040882F    mov         eax,dword ptr [esp+ebx*4+1C]
 00408833    mov         edx,esi
 00408835    test        eax,eax
>00408837    je          00408845
 00408839    mov         ecx,dword ptr [eax-4]
 0040883C    shl         ecx,1
 0040883E    add         esi,ecx
 00408840    call        Move
 00408845    dec         ebx
>00408846    jne         0040882F
 00408848    mov         edx,dword ptr [esp]
 0040884B    mov         eax,dword ptr [esp+4]
 0040884F    test        edi,edi
>00408851    jne         0040885F
 00408853    test        edx,edx
>00408855    je          0040885A
 00408857    dec         dword ptr [edx-8]
 0040885A    call        @UStrAsg
 0040885F    add         esp,8
 00408862    pop         edx
 00408863    pop         edi
 00408864    pop         esi
 00408865    pop         ebx
 00408866    pop         eax
 00408867    pop         eax
 00408868    lea         esp,[esp+edx*4]
 0040886B    jmp         eax
>0040886D    jmp         @IntOver
 00408872    ret
*}
end;

//00408874
{*function @UStrCmp(Left:UnicodeString; Right:UnicodeString):?;
begin
 00408874    cmp         eax,edx
>00408876    je          004088B9
 00408878    test        eax,edx
>0040887A    je          004088C5
 0040887C    mov         ecx,dword ptr [eax]
 0040887E    cmp         ecx,dword ptr [edx]
>00408880    jne         004088BA
 00408882    push        ebx
 00408883    mov         ebx,dword ptr [eax-4]
 00408886    xor         ecx,ecx
 00408888    sub         ebx,dword ptr [edx-4]
 0040888B    push        ebx
 0040888C    adc         ecx,0FFFFFFFF
 0040888F    and         ecx,ebx
 00408891    sub         ecx,dword ptr [eax-4]
 00408894    add         ecx,ecx
 00408896    sub         eax,ecx
 00408898    sub         edx,ecx
 0040889A    add         ecx,4
>0040889D    jns         004088B5
 0040889F    mov         ebx,dword ptr [ecx+eax]
 004088A2    cmp         ebx,dword ptr [ecx+edx]
>004088A5    je          0040889A
 004088A7    mov         edx,dword ptr [ecx+edx]
 004088AA    ror         ebx,10
 004088AD    ror         edx,10
 004088B0    cmp         ebx,edx
 004088B2    pop         ebx
 004088B3    pop         ebx
 004088B4    ret
 004088B5    pop         eax
 004088B6    add         eax,eax
 004088B8    pop         ebx
 004088B9    ret
 004088BA    mov         edx,dword ptr [edx]
 004088BC    ror         ecx,10
 004088BF    ror         edx,10
 004088C2    cmp         ecx,edx
 004088C4    ret
 004088C5    test        eax,eax
>004088C7    je          004088CD
 004088C9    test        edx,edx
>004088CB    jne         0040887C
 004088CD    cmp         eax,edx
 004088CF    ret
end;*}

//004088D4
procedure @UStrEqual(Left:UnicodeString; Right:UnicodeString);
begin
{*
 004088D4    cmp         eax,edx
>004088D6    je          00408908
 004088D8    test        eax,edx
>004088DA    je          004088FE
 004088DC    mov         ecx,dword ptr [eax-4]
 004088DF    cmp         ecx,dword ptr [edx-4]
>004088E2    jne         00408908
 004088E4    add         ecx,ecx
 004088E6    add         eax,ecx
 004088E8    add         edx,ecx
 004088EA    neg         ecx
 004088EC    push        ebx
 004088ED    mov         ebx,dword ptr [ecx+eax]
 004088F0    cmp         ebx,dword ptr [ecx+edx]
>004088F3    jne         004088FC
 004088F5    add         ecx,4
>004088F8    js          004088ED
 004088FA    xor         eax,eax
 004088FC    pop         ebx
 004088FD    ret
 004088FE    test        eax,eax
>00408900    je          00408906
 00408902    test        edx,edx
>00408904    jne         004088DC
 00408906    cmp         eax,edx
 00408908    ret
*}
end;

//0040890C
function @UStrCopy(const S:UnicodeString; Index:Integer; Count:Integer):UnicodeString;
begin
{*
 0040890C    push        ebp
 0040890D    mov         ebp,esp
 0040890F    push        ebx
 00408910    push        esi
 00408911    mov         ebx,eax
 00408913    test        ebx,ebx
>00408915    je          0040891C
 00408917    sub         ebx,4
 0040891A    mov         ebx,dword ptr [ebx]
 0040891C    cmp         edx,1
>0040891F    jge         00408925
 00408921    xor         edx,edx
>00408923    jmp         0040892C
 00408925    dec         edx
 00408926    cmp         ebx,edx
>00408928    jge         0040892C
 0040892A    mov         edx,ebx
 0040892C    test        ecx,ecx
>0040892E    jge         00408934
 00408930    xor         esi,esi
>00408932    jmp         0040893E
 00408934    mov         esi,ebx
 00408936    sub         esi,edx
 00408938    cmp         ecx,esi
>0040893A    jge         0040893E
 0040893C    mov         esi,ecx
 0040893E    mov         ecx,dword ptr [ebp+8]
 00408941    add         edx,edx
 00408943    add         edx,eax
 00408945    mov         eax,esi
 00408947    xchg        eax,ecx
 00408948    call        @UStrFromPWCharLen
 0040894D    pop         esi
 0040894E    pop         ebx
 0040894F    pop         ebp
 00408950    ret         4
*}
end;

//00408954
procedure @UStrDelete(var S:UnicodeString; Index:Integer; Count:Integer);
begin
{*
 00408954    push        ebx
 00408955    push        esi
 00408956    push        edi
 00408957    push        ecx
 00408958    mov         edi,ecx
 0040895A    mov         ebx,edx
 0040895C    mov         esi,eax
 0040895E    mov         eax,esi
 00408960    call        InternalUniqueStringU
 00408965    mov         eax,dword ptr [esi]
 00408967    mov         dword ptr [esp],eax
 0040896A    mov         eax,dword ptr [esp]
 0040896D    test        eax,eax
>0040896F    je          00408976
 00408971    sub         eax,4
 00408974    mov         eax,dword ptr [eax]
 00408976    cmp         ebx,1
>00408979    jl          004089B1
 0040897B    cmp         eax,ebx
>0040897D    jl          004089B1
 0040897F    test        edi,edi
>00408981    jle         004089B1
 00408983    dec         ebx
 00408984    mov         edx,eax
 00408986    sub         edx,ebx
 00408988    sub         edx,edi
 0040898A    mov         edi,edx
 0040898C    test        edi,edi
>0040898E    jge         00408992
 00408990    xor         edi,edi
 00408992    sub         eax,edi
 00408994    mov         edx,dword ptr [esi]
 00408996    lea         eax,[edx+eax*2]
 00408999    mov         ecx,edi
 0040899B    add         ecx,ecx
 0040899D    mov         edx,dword ptr [esi]
 0040899F    lea         edx,[edx+ebx*2]
 004089A2    call        Move
 004089A7    lea         edx,[edi+ebx]
 004089AA    mov         eax,esi
 004089AC    call        @UStrSetLength
 004089B1    pop         edx
 004089B2    pop         edi
 004089B3    pop         esi
 004089B4    pop         ebx
 004089B5    ret
*}
end;

//004089B8
procedure @UStrInsert(const Source:UnicodeString; var S:UnicodeString; Index:Integer);
begin
{*
 004089B8    push        ebx
 004089B9    push        esi
 004089BA    push        edi
 004089BB    push        ebp
 004089BC    add         esp,0FFFFFFF0
 004089BF    mov         esi,ecx
 004089C1    mov         edi,edx
 004089C3    mov         dword ptr [esp],eax
 004089C6    mov         eax,dword ptr [esp]
 004089C9    test        eax,eax
>004089CB    je          004089D2
 004089CD    sub         eax,4
 004089D0    mov         eax,dword ptr [eax]
 004089D2    mov         ebp,eax
 004089D4    test        ebp,ebp
>004089D6    jle         00408A6F
 004089DC    mov         edx,dword ptr [edi]
 004089DE    mov         eax,edx
 004089E0    mov         dword ptr [esp+0C],eax
 004089E4    mov         eax,dword ptr [esp+0C]
 004089E8    test        eax,eax
>004089EA    je          004089F1
 004089EC    sub         eax,4
 004089EF    mov         eax,dword ptr [eax]
 004089F1    mov         ebx,eax
 004089F3    cmp         esi,1
>004089F6    jge         004089FC
 004089F8    xor         esi,esi
>004089FA    jmp         00408A03
 004089FC    dec         esi
 004089FD    cmp         ebx,esi
>004089FF    jge         00408A03
 00408A01    mov         esi,ebx
 00408A03    cmp         edx,dword ptr [esp]
 00408A06    sete        byte ptr [esp+8]
 00408A0B    lea         eax,[ebp+ebx]
 00408A0F    mov         dword ptr [esp+4],eax
 00408A13    cmp         dword ptr [esp+4],0
>00408A18    jge         00408A1F
 00408A1A    call        @IntOver
 00408A1F    mov         eax,edi
 00408A21    mov         edx,dword ptr [esp+4]
 00408A25    call        @UStrSetLength
 00408A2A    cmp         ebx,esi
>00408A2C    jle         00408A47
 00408A2E    lea         eax,[ebp+esi]
 00408A32    mov         edx,dword ptr [edi]
 00408A34    lea         edx,[edx+eax*2]
 00408A37    mov         eax,dword ptr [edi]
 00408A39    lea         eax,[eax+esi*2]
 00408A3C    sub         ebx,esi
 00408A3E    mov         ecx,ebx
 00408A40    add         ecx,ecx
 00408A42    call        Move
 00408A47    cmp         byte ptr [esp+8],0
>00408A4C    je          00408A5E
 00408A4E    mov         eax,dword ptr [edi]
 00408A50    lea         edx,[eax+esi*2]
 00408A53    mov         ecx,ebp
 00408A55    add         ecx,ecx
 00408A57    call        Move
>00408A5C    jmp         00408A6F
 00408A5E    mov         eax,dword ptr [edi]
 00408A60    lea         edx,[eax+esi*2]
 00408A63    mov         ecx,ebp
 00408A65    add         ecx,ecx
 00408A67    mov         eax,dword ptr [esp]
 00408A6A    call        Move
 00408A6F    add         esp,10
 00408A72    pop         ebp
 00408A73    pop         edi
 00408A74    pop         esi
 00408A75    pop         ebx
 00408A76    ret
*}
end;

//00408A78
function Pos(const SubStr:AnsiString; const Str:AnsiString):Integer;
begin
{*
 00408A78    test        eax,eax
>00408A7A    je          00408AC3
 00408A7C    test        edx,edx
>00408A7E    je          00408AB6
 00408A80    push        ebx
 00408A81    push        esi
 00408A82    push        edi
 00408A83    mov         esi,eax
 00408A85    mov         edi,edx
 00408A87    mov         ecx,dword ptr [edi-4]
 00408A8A    push        edi
 00408A8B    mov         edx,dword ptr [esi-4]
 00408A8E    dec         edx
>00408A8F    js          00408AB1
 00408A91    mov         ax,word ptr [esi]
 00408A94    add         esi,2
 00408A97    sub         ecx,edx
>00408A99    jle         00408AB1
 00408A9B    repne scas  word ptr [edi]
>00408A9E    jne         00408AB1
 00408AA0    mov         ebx,ecx
 00408AA2    push        esi
 00408AA3    push        edi
 00408AA4    mov         ecx,edx
 00408AA6    repe cmps   word ptr [esi],word ptr [edi]
 00408AA9    pop         edi
 00408AAA    pop         esi
>00408AAB    je          00408AB9
 00408AAD    mov         ecx,ebx
>00408AAF    jmp         00408A9B
 00408AB1    pop         edx
 00408AB2    xor         eax,eax
>00408AB4    jmp         00408AC0
 00408AB6    xor         eax,eax
 00408AB8    ret
 00408AB9    pop         edx
 00408ABA    mov         eax,edi
 00408ABC    sub         eax,edx
 00408ABE    shr         eax,1
 00408AC0    pop         edi
 00408AC1    pop         esi
 00408AC2    pop         ebx
 00408AC3    ret
*}
end;

//00408AC4
function Pos(const SubStr:WideString; const Str:WideString):Integer;
begin
{*
 00408AC4    test        eax,eax
>00408AC6    je          00408B13
 00408AC8    test        edx,edx
>00408ACA    je          00408B06
 00408ACC    push        ebx
 00408ACD    push        esi
 00408ACE    push        edi
 00408ACF    mov         esi,eax
 00408AD1    mov         edi,edx
 00408AD3    mov         ecx,dword ptr [edi-4]
 00408AD6    shr         ecx,1
 00408AD8    push        edi
 00408AD9    mov         edx,dword ptr [esi-4]
 00408ADC    shr         edx,1
 00408ADE    dec         edx
>00408ADF    js          00408B01
 00408AE1    mov         ax,word ptr [esi]
 00408AE4    add         esi,2
 00408AE7    sub         ecx,edx
>00408AE9    jle         00408B01
 00408AEB    repne scas  word ptr [edi]
>00408AEE    jne         00408B01
 00408AF0    mov         ebx,ecx
 00408AF2    push        esi
 00408AF3    push        edi
 00408AF4    mov         ecx,edx
 00408AF6    repe cmps   word ptr [esi],word ptr [edi]
 00408AF9    pop         edi
 00408AFA    pop         esi
>00408AFB    je          00408B09
 00408AFD    mov         ecx,ebx
>00408AFF    jmp         00408AEB
 00408B01    pop         edx
 00408B02    xor         eax,eax
>00408B04    jmp         00408B10
 00408B06    xor         eax,eax
 00408B08    ret
 00408B09    pop         edx
 00408B0A    mov         eax,edi
 00408B0C    sub         eax,edx
 00408B0E    shr         eax,1
 00408B10    pop         edi
 00408B11    pop         esi
 00408B12    pop         ebx
 00408B13    ret
*}
end;

//00408B14
function Pos(const SubStr:RawByteString; const Str:RawByteString):Integer;
begin
{*
 00408B14    push        ebx
 00408B15    push        esi
 00408B16    add         esp,0FFFFFFF0
 00408B19    test        edx,edx
>00408B1B    je          00408B6B
 00408B1D    test        eax,eax
>00408B1F    je          00408B6B
 00408B21    mov         esi,dword ptr [edx-4]
 00408B24    mov         ebx,dword ptr [eax-4]
 00408B27    cmp         esi,ebx
>00408B29    jl          00408B6B
 00408B2B    test        ebx,ebx
>00408B2D    jle         00408B6B
 00408B2F    dec         ebx
 00408B30    add         esi,edx
 00408B32    add         edx,ebx
 00408B34    mov         dword ptr [esp+8],esi
 00408B38    add         eax,ebx
 00408B3A    mov         dword ptr [esp+4],edx
 00408B3E    neg         ebx
 00408B40    movzx       ecx,byte ptr [eax]
 00408B43    mov         dword ptr [esp],ebx
>00408B46    jne         00408BE5
 00408B4C    sub         esi,2
 00408B4F    mov         dword ptr [esp+0C],esi
 00408B53    cmp         cl,byte ptr [edx]
>00408B55    je          00408B98
 00408B57    cmp         cl,byte ptr [edx+1]
>00408B5A    je          00408BA8
 00408B5C    add         edx,2
 00408B5F    cmp         edx,dword ptr [esp+0C]
>00408B63    jb          00408B6F
 00408B65    cmp         edx,dword ptr [esp+8]
>00408B69    jb          00408B53
 00408B6B    xor         eax,eax
>00408B6D    jmp         00408B9F
 00408B6F    cmp         cl,byte ptr [edx]
>00408B71    je          00408B98
 00408B73    cmp         cl,byte ptr [edx+1]
>00408B76    je          00408BA8
 00408B78    cmp         cl,byte ptr [edx+2]
>00408B7B    je          00408B95
 00408B7D    cmp         cl,byte ptr [edx+3]
>00408B80    je          00408BA5
 00408B82    add         edx,4
 00408B85    cmp         edx,dword ptr [esp+0C]
>00408B89    jb          00408B6F
 00408B8B    cmp         edx,dword ptr [esp+8]
>00408B8F    jb          00408B53
 00408B91    xor         eax,eax
>00408B93    jmp         00408B9F
 00408B95    add         edx,2
 00408B98    inc         edx
 00408B99    mov         eax,edx
 00408B9B    sub         eax,dword ptr [esp+4]
 00408B9F    add         esp,10
 00408BA2    pop         esi
 00408BA3    pop         ebx
 00408BA4    ret
 00408BA5    add         edx,2
 00408BA8    add         edx,2
 00408BAB    xor         eax,eax
 00408BAD    cmp         edx,dword ptr [esp+8]
>00408BB1    ja          00408BB9
 00408BB3    mov         eax,edx
 00408BB5    sub         eax,dword ptr [esp+4]
 00408BB9    add         esp,10
 00408BBC    pop         esi
 00408BBD    pop         ebx
 00408BBE    ret
 00408BBF    cmp         cl,byte ptr [edx]
>00408BC1    je          00408C38
 00408BC3    cmp         cl,byte ptr [edx+1]
>00408BC6    je          00408C0B
 00408BC8    cmp         cl,byte ptr [edx+2]
>00408BCB    je          00408C35
 00408BCD    cmp         cl,byte ptr [edx+3]
>00408BD0    je          00408C08
 00408BD2    add         edx,4
 00408BD5    cmp         edx,dword ptr [esp+0C]
>00408BD9    jb          00408BBF
 00408BDB    cmp         edx,dword ptr [esp+8]
>00408BDF    jb          00408BEC
 00408BE1    xor         eax,eax
>00408BE3    jmp         00408C2F
 00408BE5    sub         esi,2
 00408BE8    mov         dword ptr [esp+0C],esi
 00408BEC    cmp         cl,byte ptr [edx]
>00408BEE    je          00408C38
 00408BF0    cmp         cl,byte ptr [edx+1]
>00408BF3    je          00408C0B
 00408BF5    add         edx,2
 00408BF8    cmp         edx,dword ptr [esp+0C]
>00408BFC    jb          00408BBF
 00408BFE    cmp         edx,dword ptr [esp+8]
>00408C02    jb          00408BEC
 00408C04    xor         eax,eax
>00408C06    jmp         00408C2F
 00408C08    add         edx,2
 00408C0B    mov         esi,dword ptr [esp]
 00408C0E    movzx       ebx,word ptr [eax+esi]
 00408C12    cmp         bx,word ptr [edx+esi+1]
>00408C17    jne         00408BF5
 00408C19    add         esi,2
>00408C1C    jl          00408C0E
 00408C1E    add         edx,2
 00408C21    xor         eax,eax
 00408C23    cmp         edx,dword ptr [esp+8]
>00408C27    ja          00408C2F
 00408C29    mov         eax,edx
 00408C2B    sub         eax,dword ptr [esp+4]
 00408C2F    add         esp,10
 00408C32    pop         esi
 00408C33    pop         ebx
 00408C34    ret
 00408C35    add         edx,2
 00408C38    mov         esi,dword ptr [esp]
 00408C3B    movzx       ebx,word ptr [eax+esi]
 00408C3F    cmp         bx,word ptr [edx+esi]
>00408C43    jne         00408BF0
 00408C45    add         esi,2
>00408C48    jl          00408C3B
 00408C4A    inc         edx
 00408C4B    mov         eax,edx
 00408C4D    sub         eax,dword ptr [esp+4]
 00408C51    add         esp,10
 00408C54    pop         esi
 00408C55    pop         ebx
 00408C56    ret
*}
end;

//00408C58
function StringOfChar(Ch:Char; Count:Integer):string;
begin
{*
 00408C58    push        ebx
 00408C59    push        esi
 00408C5A    push        edi
 00408C5B    mov         edi,ecx
 00408C5D    mov         ebx,edx
 00408C5F    mov         esi,eax
 00408C61    mov         eax,edi
 00408C63    mov         ecx,ebx
 00408C65    xor         edx,edx
 00408C67    call        @UStrFromPWCharLen
 00408C6C    mov         eax,dword ptr [edi]
 00408C6E    test        ebx,ebx
>00408C70    jle         00408C7B
 00408C72    dec         ebx
 00408C73    mov         word ptr [eax+ebx*2],si
 00408C77    test        ebx,ebx
>00408C79    jg          00408C72
 00408C7B    pop         edi
 00408C7C    pop         esi
 00408C7D    pop         ebx
 00408C7E    ret
*}
end;

//00408C80
procedure SetCodePage(var S:RawByteString; CodePage:Word; Convert:Boolean);
begin
{*
 00408C80    push        ebp
 00408C81    mov         ebp,esp
 00408C83    add         esp,0FFFFFFF0
 00408C86    push        ebx
 00408C87    push        esi
 00408C88    push        edi
 00408C89    xor         ebx,ebx
 00408C8B    mov         dword ptr [ebp-4],ebx
 00408C8E    mov         byte ptr [ebp-5],cl
 00408C91    mov         esi,edx
 00408C93    mov         ebx,eax
 00408C95    xor         eax,eax
 00408C97    push        ebp
 00408C98    push        408DE6
 00408C9D    push        dword ptr fs:[eax]
 00408CA0    mov         dword ptr fs:[eax],esp
 00408CA3    mov         edi,dword ptr [ebx]
 00408CA5    mov         dword ptr [ebp-10],edi
 00408CA8    cmp         dword ptr [ebp-10],0
>00408CAC    je          00408CBC
 00408CAE    mov         dword ptr [ebp-10],edi
 00408CB1    mov         eax,dword ptr [ebp-10]
 00408CB4    sub         eax,0C
 00408CB7    movzx       eax,word ptr [eax]
>00408CBA    jmp         00408CC3
 00408CBC    movzx       eax,word ptr ds:[78E8D0]
 00408CC3    cmp         si,ax
>00408CC6    jne         00408CCC
 00408CC8    mov         al,1
>00408CCA    jmp         00408CE2
 00408CCC    mov         eax,dword ptr [ebx]
 00408CCE    mov         dword ptr [ebp-10],eax
 00408CD1    mov         eax,dword ptr [ebp-10]
 00408CD4    test        eax,eax
>00408CD6    je          00408CDD
 00408CD8    sub         eax,4
 00408CDB    mov         eax,dword ptr [eax]
 00408CDD    test        eax,eax
 00408CDF    sete        al
 00408CE2    test        al,al
>00408CE4    jne         00408DD0
 00408CEA    cmp         byte ptr [ebp-5],0
>00408CEE    je          00408DAC
 00408CF4    mov         edi,dword ptr [ebx]
 00408CF6    mov         dword ptr [ebp-10],edi
 00408CF9    cmp         dword ptr [ebp-10],0
>00408CFD    je          00408D0D
 00408CFF    mov         dword ptr [ebp-10],edi
 00408D02    mov         eax,dword ptr [ebp-10]
 00408D05    sub         eax,0A
 00408D08    movzx       eax,word ptr [eax]
>00408D0B    jmp         00408D11
 00408D0D    mov         ax,1
 00408D11    cmp         ax,1
>00408D15    jne         00408D23
 00408D17    lea         eax,[ebp-4]
 00408D1A    mov         edx,dword ptr [ebx]
 00408D1C    call        @UStrFromLStr
>00408D21    jmp         00408D2D
 00408D23    lea         eax,[ebp-4]
 00408D26    mov         edx,dword ptr [ebx]
 00408D28    call        @UStrLAsg
 00408D2D    mov         edi,dword ptr [ebp-4]
 00408D30    test        edi,edi
>00408D32    je          00408D39
 00408D34    sub         edi,4
 00408D37    mov         edi,dword ptr [edi]
 00408D39    push        edi
 00408D3A    movzx       eax,si
 00408D3D    push        eax
 00408D3E    mov         eax,dword ptr [ebp-4]
 00408D41    call        @UStrToPWChar
 00408D46    mov         ecx,eax
 00408D48    xor         edx,edx
 00408D4A    xor         eax,eax
 00408D4C    call        CharFromWChar
 00408D51    mov         edi,eax
 00408D53    mov         eax,ebx
 00408D55    xor         ecx,ecx
 00408D57    mov         edx,edi
 00408D59    call        @LStrSetLength
 00408D5E    test        edi,edi
>00408D60    jle         00408DB3
 00408D62    mov         eax,dword ptr [ebx]
 00408D64    mov         dword ptr [ebp-10],eax
 00408D67    mov         edi,dword ptr [ebp-10]
 00408D6A    test        edi,edi
>00408D6C    je          00408D73
 00408D6E    sub         edi,4
 00408D71    mov         edi,dword ptr [edi]
 00408D73    mov         eax,dword ptr [ebp-4]
 00408D76    mov         dword ptr [ebp-0C],eax
 00408D79    cmp         dword ptr [ebp-0C],0
>00408D7D    je          00408D8A
 00408D7F    mov         eax,dword ptr [ebp-0C]
 00408D82    sub         eax,4
 00408D85    mov         eax,dword ptr [eax]
 00408D87    mov         dword ptr [ebp-0C],eax
 00408D8A    mov         eax,dword ptr [ebp-0C]
 00408D8D    push        eax
 00408D8E    movzx       eax,si
 00408D91    push        eax
 00408D92    mov         eax,dword ptr [ebp-4]
 00408D95    call        @UStrToPWChar
 00408D9A    push        eax
 00408D9B    mov         eax,dword ptr [ebx]
 00408D9D    call        @LStrToPChar
 00408DA2    mov         edx,edi
 00408DA4    pop         ecx
 00408DA5    call        CharFromWChar
>00408DAA    jmp         00408DB3
 00408DAC    mov         eax,ebx
 00408DAE    call        InternalUniqueStringA
 00408DB3    mov         eax,dword ptr [ebx]
 00408DB5    mov         dword ptr [ebp-10],eax
 00408DB8    mov         eax,dword ptr [ebp-10]
 00408DBB    test        eax,eax
>00408DBD    je          00408DC4
 00408DBF    sub         eax,4
 00408DC2    mov         eax,dword ptr [eax]
 00408DC4    test        eax,eax
>00408DC6    jle         00408DD0
 00408DC8    mov         eax,dword ptr [ebx]
 00408DCA    sub         eax,0C
 00408DCD    mov         word ptr [eax],si
 00408DD0    xor         eax,eax
 00408DD2    pop         edx
 00408DD3    pop         ecx
 00408DD4    pop         ecx
 00408DD5    mov         dword ptr fs:[eax],edx
 00408DD8    push        408DED
 00408DDD    lea         eax,[ebp-4]
 00408DE0    call        @UStrClr
 00408DE5    ret
>00408DE6    jmp         @HandleFinally
>00408DEB    jmp         00408DDD
 00408DED    pop         edi
 00408DEE    pop         esi
 00408DEF    pop         ebx
 00408DF0    mov         esp,ebp
 00408DF2    pop         ebp
 00408DF3    ret
*}
end;

//00408DF4
procedure @InitializeRecord(p:Pointer; typeInfo:Pointer);
begin
{*
 00408DF4    xor         ecx,ecx
 00408DF6    push        ebx
 00408DF7    mov         cl,byte ptr [edx+1]
 00408DFA    push        esi
 00408DFB    push        edi
 00408DFC    mov         ebx,eax
 00408DFE    lea         esi,[ecx+edx+0A]
 00408E02    mov         edi,dword ptr [ecx+edx+6]
 00408E06    test        edi,edi
>00408E08    je          00408E23
 00408E0A    mov         edx,dword ptr [esi]
 00408E0C    mov         eax,dword ptr [esi+4]
 00408E0F    add         eax,ebx
 00408E11    mov         edx,dword ptr [edx]
 00408E13    mov         ecx,1
 00408E18    call        @InitializeArray
 00408E1D    add         esi,8
 00408E20    dec         edi
>00408E21    jg          00408E0A
 00408E23    pop         edi
 00408E24    pop         esi
 00408E25    pop         ebx
 00408E26    ret
*}
end;

//00408E28
procedure @InitializeArray(p:Pointer; typeInfo:Pointer; elemCount:Cardinal);
begin
{*
 00408E28    test        ecx,ecx
>00408E2A    je          00408EBE
 00408E30    push        ebx
 00408E31    push        esi
 00408E32    push        edi
 00408E33    mov         ebx,eax
 00408E35    mov         esi,edx
 00408E37    mov         edi,ecx
 00408E39    xor         edx,edx
 00408E3B    mov         al,byte ptr [esi]
 00408E3D    mov         dl,byte ptr [esi+1]
 00408E40    xor         ecx,ecx
 00408E42    cmp         al,0A
>00408E44    je          00408E6C
 00408E46    cmp         al,0B
>00408E48    je          00408E6C
 00408E4A    cmp         al,0C
>00408E4C    je          00408E76
 00408E4E    cmp         al,0D
>00408E50    je          00408E89
 00408E52    cmp         al,0E
>00408E54    je          00408EA7
 00408E56    cmp         al,0F
>00408E58    je          00408E6C
 00408E5A    cmp         al,11
>00408E5C    je          00408E6C
 00408E5E    cmp         al,12
>00408E60    je          00408E6C
 00408E62    mov         al,2
 00408E64    pop         edi
 00408E65    pop         esi
 00408E66    pop         ebx
>00408E67    jmp         Error
 00408E6C    mov         dword ptr [ebx],ecx
 00408E6E    add         ebx,4
 00408E71    dec         edi
>00408E72    jg          00408E6C
>00408E74    jmp         00408EBB
 00408E76    mov         dword ptr [ebx],ecx
 00408E78    mov         dword ptr [ebx+4],ecx
 00408E7B    mov         dword ptr [ebx+8],ecx
 00408E7E    mov         dword ptr [ebx+0C],ecx
 00408E81    add         ebx,10
 00408E84    dec         edi
>00408E85    jg          00408E76
>00408E87    jmp         00408EBB
 00408E89    push        ebp
 00408E8A    mov         ebp,edx
 00408E8C    mov         edx,dword ptr [esi+ebp+0A]
 00408E90    mov         eax,ebx
 00408E92    add         ebx,dword ptr [esi+ebp+2]
 00408E96    mov         ecx,dword ptr [esi+ebp+6]
 00408E9A    mov         edx,dword ptr [edx]
 00408E9C    call        @InitializeArray
 00408EA1    dec         edi
>00408EA2    jg          00408E8C
 00408EA4    pop         ebp
>00408EA5    jmp         00408EBB
 00408EA7    push        ebp
 00408EA8    mov         ebp,edx
 00408EAA    mov         eax,ebx
 00408EAC    add         ebx,dword ptr [esi+ebp+2]
 00408EB0    mov         edx,esi
 00408EB2    call        @InitializeRecord
 00408EB7    dec         edi
>00408EB8    jg          00408EAA
 00408EBA    pop         ebp
 00408EBB    pop         edi
 00408EBC    pop         esi
 00408EBD    pop         ebx
 00408EBE    ret
*}
end;

//00408EC0
procedure @Initialize(p:Pointer; typeInfo:Pointer);
begin
{*
 00408EC0    mov         ecx,1
>00408EC5    jmp         @InitializeArray
 00408ECA    ret
*}
end;

//00408ECC
procedure @FinalizeRecord(P:Pointer; TypeInfo:Pointer);
begin
{*
 00408ECC    xor         ecx,ecx
 00408ECE    push        ebx
 00408ECF    mov         cl,byte ptr [edx+1]
 00408ED2    push        esi
 00408ED3    push        edi
 00408ED4    mov         ebx,eax
 00408ED6    lea         esi,[ecx+edx+0A]
 00408EDA    mov         edi,dword ptr [ecx+edx+6]
 00408EDE    test        edi,edi
>00408EE0    je          00408EFB
 00408EE2    mov         edx,dword ptr [esi]
 00408EE4    mov         eax,dword ptr [esi+4]
 00408EE7    add         eax,ebx
 00408EE9    mov         edx,dword ptr [edx]
 00408EEB    mov         ecx,1
 00408EF0    call        @FinalizeArray
 00408EF5    add         esi,8
 00408EF8    dec         edi
>00408EF9    jg          00408EE2
 00408EFB    mov         eax,ebx
 00408EFD    pop         edi
 00408EFE    pop         esi
 00408EFF    pop         ebx
 00408F00    ret
*}
end;

//00408F04
procedure @VarClr(var v:TVarData);
begin
{*
 00408F04    cmp         dword ptr ds:[784010],0
>00408F0B    je          00408F14
 00408F0D    call        dword ptr ds:[784010]
 00408F13    ret
 00408F14    mov         al,10
 00408F16    call        Error
 00408F1B    ret
*}
end;

//00408F1C
procedure @FinalizeArray(P:Pointer; TypeInfo:Pointer; ElemCount:Cardinal);
begin
{*
 00408F1C    cmp         ecx,0
>00408F1F    je          0040902A
 00408F25    push        eax
 00408F26    push        ebx
 00408F27    push        esi
 00408F28    push        edi
 00408F29    mov         ebx,eax
 00408F2B    mov         esi,edx
 00408F2D    mov         edi,ecx
 00408F2F    xor         edx,edx
 00408F31    mov         al,byte ptr [esi]
 00408F33    mov         dl,byte ptr [esi+1]
 00408F36    cmp         al,0A
>00408F38    je          00408F67
 00408F3A    cmp         al,12
>00408F3C    je          00408FA1
 00408F3E    cmp         al,0B
>00408F40    je          00408F84
 00408F42    cmp         al,0C
>00408F44    je          00408FB8
 00408F46    cmp         al,0D
>00408F48    je          00408FC7
 00408F4A    cmp         al,0E
>00408F4C    je          00408FE5
 00408F52    cmp         al,0F
>00408F54    je          00408FFB
 00408F5A    cmp         al,11
>00408F5C    je          0040900A
>00408F62    jmp         0040901B
 00408F67    cmp         ecx,1
 00408F6A    mov         eax,ebx
>00408F6C    jg          00408F78
 00408F6E    call        @LStrClr
>00408F73    jmp         00409026
 00408F78    mov         edx,ecx
 00408F7A    call        @LStrArrayClr
>00408F7F    jmp         00409026
 00408F84    cmp         ecx,1
 00408F87    mov         eax,ebx
>00408F89    jg          00408F95
 00408F8B    call        @WStrClr
>00408F90    jmp         00409026
 00408F95    mov         edx,ecx
 00408F97    call        @WStrArrayClr
>00408F9C    jmp         00409026
 00408FA1    cmp         ecx,1
 00408FA4    mov         eax,ebx
>00408FA6    jg          00408FAF
 00408FA8    call        @UStrClr
>00408FAD    jmp         00409026
 00408FAF    mov         edx,ecx
 00408FB1    call        @UStrArrayClr
>00408FB6    jmp         00409026
 00408FB8    mov         eax,ebx
 00408FBA    add         ebx,10
 00408FBD    call        @VarClr
 00408FC2    dec         edi
>00408FC3    jg          00408FB8
>00408FC5    jmp         00409026
 00408FC7    push        ebp
 00408FC8    mov         ebp,edx
 00408FCA    mov         edx,dword ptr [esi+ebp+0A]
 00408FCE    mov         eax,ebx
 00408FD0    add         ebx,dword ptr [esi+ebp+2]
 00408FD4    mov         ecx,dword ptr [esi+ebp+6]
 00408FD8    mov         edx,dword ptr [edx]
 00408FDA    call        @FinalizeArray
 00408FDF    dec         edi
>00408FE0    jg          00408FCA
 00408FE2    pop         ebp
>00408FE3    jmp         00409026
 00408FE5    push        ebp
 00408FE6    mov         ebp,edx
 00408FE8    mov         eax,ebx
 00408FEA    add         ebx,dword ptr [esi+ebp+2]
 00408FEE    mov         edx,esi
 00408FF0    call        @FinalizeRecord
 00408FF5    dec         edi
>00408FF6    jg          00408FE8
 00408FF8    pop         ebp
>00408FF9    jmp         00409026
 00408FFB    mov         eax,ebx
 00408FFD    add         ebx,4
 00409000    call        @IntfClear
 00409005    dec         edi
>00409006    jg          00408FFB
>00409008    jmp         00409026
 0040900A    mov         eax,ebx
 0040900C    mov         edx,esi
 0040900E    add         ebx,4
 00409011    call        @DynArrayClear
 00409016    dec         edi
>00409017    jg          0040900A
>00409019    jmp         00409026
 0040901B    pop         edi
 0040901C    pop         esi
 0040901D    pop         ebx
 0040901E    pop         eax
 0040901F    mov         al,2
>00409021    jmp         Error
 00409026    pop         edi
 00409027    pop         esi
 00409028    pop         ebx
 00409029    pop         eax
 0040902A    ret
*}
end;

//0040902C
procedure @Finalize(p:Pointer; typeInfo:Pointer);
begin
{*
 0040902C    mov         ecx,1
>00409031    jmp         @FinalizeArray
 00409036    ret
*}
end;

//00409038
procedure @AddRefRecord;
begin
{*
 00409038    xor         ecx,ecx
 0040903A    push        ebx
 0040903B    mov         cl,byte ptr [edx+1]
 0040903E    push        esi
 0040903F    push        edi
 00409040    mov         ebx,eax
 00409042    lea         esi,[ecx+edx+0A]
 00409046    mov         edi,dword ptr [ecx+edx+6]
 0040904A    mov         edx,dword ptr [esi]
 0040904C    mov         eax,dword ptr [esi+4]
 0040904F    add         eax,ebx
 00409051    mov         edx,dword ptr [edx]
 00409053    mov         ecx,1
 00409058    call        @AddRefArray
 0040905D    add         esi,8
 00409060    dec         edi
>00409061    jg          0040904A
 00409063    pop         edi
 00409064    pop         esi
 00409065    pop         ebx
 00409066    ret
*}
end;

//00409068
procedure @VarAddRef(var v:TVarData);
begin
{*
 00409068    cmp         dword ptr ds:[784014],0
>0040906F    je          00409078
 00409071    call        dword ptr ds:[784014]
 00409077    ret
 00409078    mov         al,10
 0040907A    call        Error
 0040907F    ret
*}
end;

//00409080
procedure @AddRefArray;
begin
{*
 00409080    push        ebx
 00409081    push        esi
 00409082    push        edi
 00409083    test        ecx,ecx
>00409085    je          0040913F
 0040908B    mov         ebx,eax
 0040908D    mov         esi,edx
 0040908F    mov         edi,ecx
 00409091    xor         edx,edx
 00409093    mov         al,byte ptr [esi]
 00409095    mov         dl,byte ptr [esi+1]
 00409098    cmp         al,0A
>0040909A    je          004090C2
 0040909C    cmp         al,0B
>0040909E    je          004090D1
 004090A0    cmp         al,12
>004090A2    je          004090C2
 004090A4    cmp         al,0C
>004090A6    je          004090E0
 004090A8    cmp         al,0D
>004090AA    je          004090EF
 004090AC    cmp         al,0E
>004090AE    je          0040910D
 004090B0    cmp         al,0F
>004090B2    je          00409123
 004090B4    cmp         al,11
>004090B6    je          00409132
 004090B8    mov         al,2
 004090BA    pop         edi
 004090BB    pop         esi
 004090BC    pop         ebx
>004090BD    jmp         Error
 004090C2    mov         eax,dword ptr [ebx]
 004090C4    add         ebx,4
 004090C7    call        @LStrAddRef
 004090CC    dec         edi
>004090CD    jg          004090C2
>004090CF    jmp         0040913F
 004090D1    mov         eax,ebx
 004090D3    add         ebx,4
 004090D6    call        @WStrAddRef
 004090DB    dec         edi
>004090DC    jg          004090D1
>004090DE    jmp         0040913F
 004090E0    mov         eax,ebx
 004090E2    add         ebx,10
 004090E5    call        @VarAddRef
 004090EA    dec         edi
>004090EB    jg          004090E0
>004090ED    jmp         0040913F
 004090EF    push        ebp
 004090F0    mov         ebp,edx
 004090F2    mov         edx,dword ptr [esi+ebp+0A]
 004090F6    mov         eax,ebx
 004090F8    add         ebx,dword ptr [esi+ebp+2]
 004090FC    mov         ecx,dword ptr [esi+ebp+6]
 00409100    mov         edx,dword ptr [edx]
 00409102    call        @AddRefArray
 00409107    dec         edi
>00409108    jg          004090F2
 0040910A    pop         ebp
>0040910B    jmp         0040913F
 0040910D    push        ebp
 0040910E    mov         ebp,edx
 00409110    mov         eax,ebx
 00409112    add         ebx,dword ptr [esi+ebp+2]
 00409116    mov         edx,esi
 00409118    call        @AddRefRecord
 0040911D    dec         edi
>0040911E    jg          00409110
 00409120    pop         ebp
>00409121    jmp         0040913F
 00409123    mov         eax,dword ptr [ebx]
 00409125    add         ebx,4
 00409128    call        @IntfAddRef
 0040912D    dec         edi
>0040912E    jg          00409123
>00409130    jmp         0040913F
 00409132    mov         eax,dword ptr [ebx]
 00409134    add         ebx,4
 00409137    call        @DynArrayAddRef
 0040913C    dec         edi
>0040913D    jg          00409132
 0040913F    pop         edi
 00409140    pop         esi
 00409141    pop         ebx
 00409142    ret
*}
end;

//00409144
procedure @VarCopy(var Dest:TVarData; const Src:TVarData);
begin
{*
 00409144    cmp         dword ptr ds:[784018],0
>0040914B    je          00409154
 0040914D    call        dword ptr ds:[784018]
 00409153    ret
 00409154    mov         al,10
 00409156    call        Error
 0040915B    ret
*}
end;

//0040915C
procedure @CopyRecord(Dest:Pointer; Source:Pointer; TypeInfo:Pointer);
begin
{*
 0040915C    push        ebx
 0040915D    push        esi
 0040915E    push        edi
 0040915F    push        ebp
 00409160    mov         ebx,eax
 00409162    mov         esi,edx
 00409164    xor         eax,eax
 00409166    mov         al,byte ptr [ecx+1]
 00409169    lea         edi,[eax+ecx+0A]
 0040916D    mov         ebp,dword ptr [edi-4]
 00409170    xor         eax,eax
 00409172    mov         ecx,dword ptr [edi-8]
 00409175    test        ebp,ebp
>00409177    je          00409289
 0040917D    push        ecx
 0040917E    mov         ecx,dword ptr [edi+4]
 00409181    sub         ecx,eax
>00409183    jle         00409190
 00409185    mov         edx,eax
 00409187    add         eax,esi
 00409189    add         edx,ebx
 0040918B    call        Move
 00409190    mov         eax,dword ptr [edi+4]
 00409193    mov         edx,dword ptr [edi]
 00409195    mov         edx,dword ptr [edx]
 00409197    mov         cl,byte ptr [edx]
 00409199    cmp         cl,0A
>0040919C    je          004091D9
 0040919E    cmp         cl,0B
>004091A1    je          004091FE
 004091A3    cmp         cl,12
>004091A6    je          004091ED
 004091A8    cmp         cl,0C
>004091AB    je          0040920F
 004091AD    cmp         cl,0D
>004091B0    je          00409220
 004091B2    cmp         cl,0E
>004091B5    je          00409240
 004091BB    cmp         cl,0F
>004091BE    je          00409259
 004091C4    cmp         cl,11
>004091C7    je          0040926A
 004091CD    mov         al,2
 004091CF    pop         ecx
 004091D0    pop         ebp
 004091D1    pop         edi
 004091D2    pop         esi
 004091D3    pop         ebx
>004091D4    jmp         Error
 004091D9    mov         edx,dword ptr [eax+esi]
 004091DC    add         eax,ebx
 004091DE    call        @LStrAsg
 004091E3    mov         eax,4
>004091E8    jmp         0040927B
 004091ED    mov         edx,dword ptr [eax+esi]
 004091F0    add         eax,ebx
 004091F2    call        @UStrAsg
 004091F7    mov         eax,4
>004091FC    jmp         0040927B
 004091FE    mov         edx,dword ptr [eax+esi]
 00409201    add         eax,ebx
 00409203    call        @WStrAsg
 00409208    mov         eax,4
>0040920D    jmp         0040927B
 0040920F    lea         edx,[eax+esi]
 00409212    add         eax,ebx
 00409214    call        @VarCopy
 00409219    mov         eax,10
>0040921E    jmp         0040927B
 00409220    xor         ecx,ecx
 00409222    mov         cl,byte ptr [edx+1]
 00409225    push        dword ptr [ecx+edx+2]
 00409229    push        dword ptr [ecx+edx+6]
 0040922D    mov         ecx,dword ptr [ecx+edx+0A]
 00409231    mov         ecx,dword ptr [ecx]
 00409233    lea         edx,[eax+esi]
 00409236    add         eax,ebx
 00409238    call        @CopyArray
 0040923D    pop         eax
>0040923E    jmp         0040927B
 00409240    xor         ecx,ecx
 00409242    mov         cl,byte ptr [edx+1]
 00409245    mov         ecx,dword ptr [ecx+edx+2]
 00409249    push        ecx
 0040924A    mov         ecx,edx
 0040924C    lea         edx,[eax+esi]
 0040924F    add         eax,ebx
 00409251    call        @CopyRecord
 00409256    pop         eax
>00409257    jmp         0040927B
 00409259    mov         edx,dword ptr [eax+esi]
 0040925C    add         eax,ebx
 0040925E    call        @IntfCopy
 00409263    mov         eax,4
>00409268    jmp         0040927B
 0040926A    mov         ecx,edx
 0040926C    mov         edx,dword ptr [eax+esi]
 0040926F    add         eax,ebx
 00409271    call        @DynArrayAsg
 00409276    mov         eax,4
 0040927B    add         eax,dword ptr [edi+4]
 0040927E    add         edi,8
 00409281    dec         ebp
>00409282    jne         0040917E
 00409288    pop         ecx
 00409289    sub         ecx,eax
>0040928B    jle         00409297
 0040928D    lea         edx,[eax+ebx]
 00409290    add         eax,esi
 00409292    call        Move
 00409297    pop         ebp
 00409298    pop         edi
 00409299    pop         esi
 0040929A    pop         ebx
 0040929B    ret
*}
end;

//0040929C
procedure @CopyArray(Dest:Pointer; Source:Pointer; TypeInfo:Pointer; Cnt:Integer);
begin
{*
 0040929C    push        ebx
 0040929D    push        esi
 0040929E    push        edi
 0040929F    push        ebp
 004092A0    mov         ebx,eax
 004092A2    mov         esi,edx
 004092A4    mov         edi,ecx
 004092A6    mov         ebp,dword ptr [esp+14]
 004092AA    mov         cl,byte ptr [edi]
 004092AC    cmp         cl,0A
>004092AF    je          004092EB
 004092B1    cmp         cl,0B
>004092B4    je          00409302
 004092B6    cmp         cl,12
>004092B9    je          00409319
 004092BB    cmp         cl,0C
>004092BE    je          0040932D
 004092C0    cmp         cl,0D
>004092C3    je          00409341
 004092C5    cmp         cl,0E
>004092C8    je          00409364
 004092CE    cmp         cl,0F
>004092D1    je          00409381
 004092D7    cmp         cl,11
>004092DA    je          00409395
 004092E0    mov         al,2
 004092E2    pop         ebp
 004092E3    pop         edi
 004092E4    pop         esi
 004092E5    pop         ebx
>004092E6    jmp         Error
 004092EB    mov         eax,ebx
 004092ED    mov         edx,dword ptr [esi]
 004092EF    call        @LStrAsg
 004092F4    add         ebx,4
 004092F7    add         esi,4
 004092FA    dec         ebp
>004092FB    jne         004092EB
>004092FD    jmp         004093A9
 00409302    mov         eax,ebx
 00409304    mov         edx,dword ptr [esi]
 00409306    call        @WStrAsg
 0040930B    add         ebx,4
 0040930E    add         esi,4
 00409311    dec         ebp
>00409312    jne         00409302
>00409314    jmp         004093A9
 00409319    mov         eax,ebx
 0040931B    mov         edx,dword ptr [esi]
 0040931D    call        @UStrAsg
 00409322    add         ebx,4
 00409325    add         esi,4
 00409328    dec         ebp
>00409329    jne         00409319
>0040932B    jmp         004093A9
 0040932D    mov         eax,ebx
 0040932F    mov         edx,esi
 00409331    call        @VarCopy
 00409336    add         ebx,10
 00409339    add         esi,10
 0040933C    dec         ebp
>0040933D    jne         0040932D
>0040933F    jmp         004093A9
 00409341    xor         ecx,ecx
 00409343    mov         cl,byte ptr [edi+1]
 00409346    lea         edi,[ecx+edi+2]
 0040934A    mov         eax,ebx
 0040934C    mov         edx,esi
 0040934E    mov         ecx,dword ptr [edi+8]
 00409351    mov         ecx,dword ptr [ecx]
 00409353    push        dword ptr [edi+4]
 00409356    call        @CopyArray
 0040935B    add         ebx,dword ptr [edi]
 0040935D    add         esi,dword ptr [edi]
 0040935F    dec         ebp
>00409360    jne         0040934A
>00409362    jmp         004093A9
 00409364    mov         eax,ebx
 00409366    mov         edx,esi
 00409368    mov         ecx,edi
 0040936A    call        @CopyRecord
 0040936F    xor         eax,eax
 00409371    mov         al,byte ptr [edi+1]
 00409374    add         ebx,dword ptr [eax+edi+2]
 00409378    add         esi,dword ptr [eax+edi+2]
 0040937C    dec         ebp
>0040937D    jne         00409364
>0040937F    jmp         004093A9
 00409381    mov         eax,ebx
 00409383    mov         edx,dword ptr [esi]
 00409385    call        @IntfCopy
 0040938A    add         ebx,4
 0040938D    add         esi,4
 00409390    dec         ebp
>00409391    jne         00409381
>00409393    jmp         004093A9
 00409395    mov         eax,ebx
 00409397    mov         edx,dword ptr [esi]
 00409399    mov         ecx,edi
 0040939B    call        @DynArrayAsg
 004093A0    add         ebx,4
 004093A3    add         esi,4
 004093A6    dec         ebp
>004093A7    jne         00409395
 004093A9    pop         ebp
 004093AA    pop         edi
 004093AB    pop         esi
 004093AC    pop         ebx
 004093AD    ret         4
*}
end;

//004093B4
function @New(size:Integer; typeInfo:Pointer):Pointer;
begin
{*
 004093B4    push        edx
 004093B5    call        @GetMem
 004093BA    pop         edx
 004093BB    test        eax,eax
>004093BD    je          004093C6
 004093BF    push        eax
 004093C0    call        @Initialize
 004093C5    pop         eax
 004093C6    ret
*}
end;

//004093C8
procedure @Dispose(p:Pointer; typeInfo:Pointer);
begin
{*
 004093C8    push        eax
 004093C9    call        @Finalize
 004093CE    pop         eax
 004093CF    call        @FreeMem
 004093D4    ret
*}
end;

//004093D8
procedure sub_004093D8;
begin
{*
 004093D8    call        WideCharLenToStrVar
 004093DD    ret
*}
end;

//004093E0
procedure WideCharLenToStrVar(Source:PWideChar; SourceLen:Integer; var Dest:AnsiString);
begin
{*
 004093E0    xchg        eax,ecx
 004093E1    xchg        ecx,edx
 004093E3    call        @UStrFromPWCharLen
 004093E8    ret
*}
end;

//004093EC
procedure WideCharLenToStrVar(Source:PWideChar; SourceLen:Integer; var Dest:AnsiString);
begin
{*
 004093EC    push        ebx
 004093ED    movzx       ebx,word ptr ds:[78E8D0]
 004093F4    push        ebx
 004093F5    xchg        eax,ecx
 004093F6    xchg        ecx,edx
 004093F8    call        @LStrFromPWCharLen
 004093FD    pop         ebx
 004093FE    ret
*}
end;

//00409400
function OleStrToString(Source:PWideChar):string;
begin
{*
 00409400    call        OleStrToStrVar
 00409405    ret
*}
end;

//00409408
procedure OleStrToStrVar(Source:PWideChar; var Dest:AnsiString);
begin
{*
 00409408    push        ecx
 00409409    mov         dword ptr [esp],eax
 0040940C    mov         ecx,dword ptr [esp]
 0040940F    test        ecx,ecx
>00409411    je          0040941A
 00409413    sub         ecx,4
 00409416    mov         ecx,dword ptr [ecx]
 00409418    shr         ecx,1
 0040941A    xchg        edx,ecx
 0040941C    call        WideCharLenToStrVar
 00409421    pop         edx
 00409422    ret
*}
end;

//00409424
procedure OleStrToStrVar(Source:PWideChar; var Dest:AnsiString);
begin
{*
 00409424    push        ecx
 00409425    mov         dword ptr [esp],eax
 00409428    mov         ecx,dword ptr [esp]
 0040942B    test        ecx,ecx
>0040942D    je          00409436
 0040942F    sub         ecx,4
 00409432    mov         ecx,dword ptr [ecx]
 00409434    shr         ecx,1
 00409436    xchg        edx,ecx
 00409438    call        WideCharLenToStrVar
 0040943D    pop         edx
 0040943E    ret
*}
end;

//00409440
function StringToOleStr(const Source:AnsiString):PWideChar;
begin
{*
 00409440    push        ecx
 00409441    xor         edx,edx
 00409443    mov         dword ptr [esp],edx
 00409446    mov         edx,eax
 00409448    test        edx,edx
>0040944A    je          00409451
 0040944C    sub         edx,4
 0040944F    mov         edx,dword ptr [edx]
 00409451    mov         ecx,esp
 00409453    xchg        eax,ecx
 00409454    xchg        edx,ecx
 00409456    call        @WStrFromPCharLen
 0040945B    mov         eax,dword ptr [esp]
 0040945E    pop         edx
 0040945F    ret
*}
end;

//00409460
{*function sub_00409460(?:?):?;
begin
 00409460    push        ecx
 00409461    xor         edx,edx
 00409463    mov         dword ptr [esp],edx
 00409466    mov         edx,eax
 00409468    test        edx,edx
>0040946A    je          00409471
 0040946C    sub         edx,4
 0040946F    mov         edx,dword ptr [edx]
 00409471    mov         ecx,esp
 00409473    xchg        eax,ecx
 00409474    xchg        edx,ecx
 00409476    call        @WStrFromPWCharLen
 0040947B    mov         eax,dword ptr [esp]
 0040947E    pop         edx
 0040947F    ret
end;*}

//00409480
procedure @DispCallByIDError;
begin
{*
 00409480    mov         al,11
>00409482    jmp         Error
 00409487    ret
*}
end;

//00409488
procedure @_llmul;
begin
{*
 00409488    push        edx
 00409489    push        eax
 0040948A    mov         eax,dword ptr [esp+10]
 0040948E    mul         eax,dword ptr [esp]
 00409491    mov         ecx,eax
 00409493    mov         eax,dword ptr [esp+4]
 00409497    mul         eax,dword ptr [esp+0C]
 0040949B    add         ecx,eax
 0040949D    mov         eax,dword ptr [esp]
 004094A0    mul         eax,dword ptr [esp+0C]
 004094A4    add         edx,ecx
 004094A6    pop         ecx
 004094A7    pop         ecx
 004094A8    ret         8
*}
end;

//004094AC
procedure @_lldiv;
begin
{*
 004094AC    push        ebx
 004094AD    push        esi
 004094AE    push        edi
 004094AF    mov         ebx,dword ptr [esp+10]
 004094B3    mov         ecx,dword ptr [esp+14]
 004094B7    mov         esi,edx
 004094B9    mov         edi,ecx
 004094BB    sar         esi,1F
 004094BE    xor         eax,esi
 004094C0    xor         edx,esi
 004094C2    sub         eax,esi
 004094C4    sbb         edx,esi
 004094C6    sar         edi,1F
 004094C9    xor         esi,edi
 004094CB    xor         ebx,edi
 004094CD    xor         ecx,edi
 004094CF    sub         ebx,edi
 004094D1    sbb         ecx,edi
>004094D3    jne         004094E8
 004094D5    cmp         edx,ebx
>004094D7    jb          004094E2
 004094D9    mov         ecx,eax
 004094DB    mov         eax,edx
 004094DD    xor         edx,edx
 004094DF    div         eax,ebx
 004094E1    xchg        eax,ecx
 004094E2    div         eax,ebx
 004094E4    mov         edx,ecx
>004094E6    jmp         0040952F
 004094E8    sub         esp,0C
 004094EB    mov         dword ptr [esp],eax
 004094EE    mov         dword ptr [esp+4],ebx
 004094F2    mov         dword ptr [esp+8],edx
 004094F6    mov         edi,ecx
 004094F8    shr         edx,1
 004094FA    rcr         eax,1
 004094FC    ror         edi,1
 004094FE    rcr         ebx,1
 00409500    bsr         ecx,ecx
 00409503    shrd        ebx,edi,cl
 00409506    shrd        eax,edx,cl
 00409509    shr         edx,cl
 0040950B    rol         edi,1
 0040950D    div         eax,ebx
 0040950F    mov         ebx,dword ptr [esp]
 00409512    mov         ecx,eax
 00409514    imul        edi,eax
 00409517    mul         eax,dword ptr [esp+4]
 0040951B    add         edx,edi
 0040951D    sub         ebx,eax
 0040951F    mov         eax,ecx
 00409521    mov         ecx,dword ptr [esp+8]
 00409525    sbb         ecx,edx
 00409527    sbb         eax,0
 0040952A    xor         edx,edx
 0040952C    add         esp,0C
 0040952F    xor         eax,esi
 00409531    xor         edx,esi
 00409533    sub         eax,esi
 00409535    sbb         edx,esi
 00409537    pop         edi
 00409538    pop         esi
 00409539    pop         ebx
 0040953A    ret         8
*}
end;

//00409540
procedure @_lludiv;
begin
{*
 00409540    push        ebp
 00409541    push        ebx
 00409542    push        esi
 00409543    push        edi
 00409544    mov         ebx,dword ptr [esp+14]
 00409548    mov         ecx,dword ptr [esp+18]
 0040954C    or          ecx,ecx
>0040954E    jne         00409558
 00409550    or          edx,edx
>00409552    je          00409583
 00409554    or          ebx,ebx
>00409556    je          00409583
 00409558    mov         ebp,ecx
 0040955A    mov         ecx,40
 0040955F    xor         edi,edi
 00409561    xor         esi,esi
 00409563    shl         eax,1
 00409565    rcl         edx,1
 00409567    rcl         esi,1
 00409569    rcl         edi,1
 0040956B    cmp         edi,ebp
>0040956D    jb          0040957A
>0040956F    ja          00409575
 00409571    cmp         esi,ebx
>00409573    jb          0040957A
 00409575    sub         esi,ebx
 00409577    sbb         edi,ebp
 00409579    inc         eax
 0040957A    loop        00409563
 0040957C    pop         edi
 0040957D    pop         esi
 0040957E    pop         ebx
 0040957F    pop         ebp
 00409580    ret         8
 00409583    div         eax,ebx
 00409585    xor         edx,edx
>00409587    jmp         0040957C
 00409589    ret
*}
end;

//0040958C
procedure @_llmod;
begin
{*
 0040958C    push        ebp
 0040958D    push        ebx
 0040958E    push        esi
 0040958F    push        edi
 00409590    xor         edi,edi
 00409592    mov         ebx,dword ptr [esp+14]
 00409596    mov         ecx,dword ptr [esp+18]
 0040959A    or          ecx,ecx
>0040959C    jne         004095A6
 0040959E    or          edx,edx
>004095A0    je          004095FF
 004095A2    or          ebx,ebx
>004095A4    je          004095FF
 004095A6    or          edx,edx
>004095A8    jns         004095B4
 004095AA    neg         edx
 004095AC    neg         eax
 004095AE    sbb         edx,0
 004095B1    or          edi,1
 004095B4    or          ecx,ecx
>004095B6    jns         004095BF
 004095B8    neg         ecx
 004095BA    neg         ebx
 004095BC    sbb         ecx,0
 004095BF    mov         ebp,ecx
 004095C1    mov         ecx,40
 004095C6    push        edi
 004095C7    xor         edi,edi
 004095C9    xor         esi,esi
 004095CB    shl         eax,1
 004095CD    rcl         edx,1
 004095CF    rcl         esi,1
 004095D1    rcl         edi,1
 004095D3    cmp         edi,ebp
>004095D5    jb          004095E2
>004095D7    ja          004095DD
 004095D9    cmp         esi,ebx
>004095DB    jb          004095E2
 004095DD    sub         esi,ebx
 004095DF    sbb         edi,ebp
 004095E1    inc         eax
 004095E2    loop        004095CB
 004095E4    mov         eax,esi
 004095E6    mov         edx,edi
 004095E8    pop         ebx
 004095E9    test        ebx,1
>004095EF    je          004095F8
 004095F1    neg         edx
 004095F3    neg         eax
 004095F5    sbb         edx,0
 004095F8    pop         edi
 004095F9    pop         esi
 004095FA    pop         ebx
 004095FB    pop         ebp
 004095FC    ret         8
 004095FF    div         eax,ebx
 00409601    xchg        eax,edx
 00409602    xor         edx,edx
>00409604    jmp         004095F8
 00409606    ret
*}
end;

//00409608
procedure @_llumod;
begin
{*
 00409608    push        ebp
 00409609    push        ebx
 0040960A    push        esi
 0040960B    push        edi
 0040960C    mov         ebx,dword ptr [esp+14]
 00409610    mov         ecx,dword ptr [esp+18]
 00409614    or          ecx,ecx
>00409616    jne         00409620
 00409618    or          edx,edx
>0040961A    je          0040964F
 0040961C    or          ebx,ebx
>0040961E    je          0040964F
 00409620    mov         ebp,ecx
 00409622    mov         ecx,40
 00409627    xor         edi,edi
 00409629    xor         esi,esi
 0040962B    shl         eax,1
 0040962D    rcl         edx,1
 0040962F    rcl         esi,1
 00409631    rcl         edi,1
 00409633    cmp         edi,ebp
>00409635    jb          00409642
>00409637    ja          0040963D
 00409639    cmp         esi,ebx
>0040963B    jb          00409642
 0040963D    sub         esi,ebx
 0040963F    sbb         edi,ebp
 00409641    inc         eax
 00409642    loop        0040962B
 00409644    mov         eax,esi
 00409646    mov         edx,edi
 00409648    pop         edi
 00409649    pop         esi
 0040964A    pop         ebx
 0040964B    pop         ebp
 0040964C    ret         8
 0040964F    div         eax,ebx
 00409651    xchg        eax,edx
 00409652    xor         edx,edx
>00409654    jmp         00409648
 00409656    ret
*}
end;

//00409658
procedure @_llshl;
begin
{*
 00409658    and         cl,3F
 0040965B    cmp         cl,20
>0040965E    jl          00409667
 00409660    mov         edx,eax
 00409662    shl         edx,cl
 00409664    xor         eax,eax
 00409666    ret
 00409667    shld        edx,eax,cl
 0040966A    shl         eax,cl
 0040966C    ret
*}
end;

//00409670
procedure @_llushr;
begin
{*
 00409670    and         cl,3F
 00409673    cmp         cl,20
>00409676    jl          0040967F
 00409678    mov         eax,edx
 0040967A    xor         edx,edx
 0040967C    shr         eax,cl
 0040967E    ret
 0040967F    shrd        eax,edx,cl
 00409682    shr         edx,cl
 00409684    ret
*}
end;

//00409688
function @ValInt64(const s:AnsiString; var code:Integer):Int64;
begin
{*
 00409688    push        ebx
 00409689    push        esi
 0040968A    push        edi
 0040968B    push        ebp
 0040968C    add         esp,0FFFFFFEC
 0040968F    mov         dword ptr [esp],edx
 00409692    mov         esi,eax
 00409694    mov         ebp,1
 00409699    xor         edi,edi
 0040969B    mov         dword ptr [esp+8],0
 004096A3    mov         dword ptr [esp+0C],0
 004096AB    test        esi,esi
>004096AD    jne         004096BA
 004096AF    mov         eax,dword ptr [esp]
 004096B2    mov         dword ptr [eax],ebp
>004096B4    jmp         004098ED
 004096B9    inc         ebp
 004096BA    cmp         word ptr [esi+ebp*2-2],20
>004096C0    je          004096B9
 004096C2    mov         byte ptr [esp+10],0
 004096C7    movzx       eax,word ptr [esi+ebp*2-2]
 004096CC    cmp         ax,2D
>004096D0    jne         004096DA
 004096D2    mov         byte ptr [esp+10],1
 004096D7    inc         ebp
>004096D8    jmp         004096E1
 004096DA    cmp         ax,2B
>004096DE    jne         004096E1
 004096E0    inc         ebp
 004096E1    mov         bl,1
 004096E3    movzx       eax,word ptr [esi+ebp*2-2]
 004096E8    cmp         ax,24
>004096EC    jne         004096F2
 004096EE    mov         dl,1
>004096F0    jmp         0040970D
 004096F2    mov         edx,eax
 004096F4    mov         ecx,eax
 004096F6    add         ecx,0FFFFFF9F
 004096F9    sub         cx,1A
>004096FD    jae         00409706
 004096FF    mov         edx,eax
 00409701    and         dx,0FFDF
 00409706    cmp         dx,58
 0040970A    sete        dl
 0040970D    test        dl,dl
>0040970F    je          00409715
 00409711    mov         dl,1
>00409713    jmp         00409758
 00409715    cmp         ax,30
>00409719    jne         0040972D
 0040971B    mov         edx,esi
 0040971D    test        edx,edx
>0040971F    je          00409726
 00409721    sub         edx,4
 00409724    mov         edx,dword ptr [edx]
 00409726    cmp         edx,ebp
 00409728    setg        dl
>0040972B    jmp         0040972F
 0040972D    xor         edx,edx
 0040972F    test        dl,dl
>00409731    je          00409756
 00409733    movzx       edx,word ptr [esi+ebp*2]
 00409737    movzx       ecx,word ptr [esi+ebp*2]
 0040973B    add         ecx,0FFFFFF9F
 0040973E    sub         cx,1A
>00409742    jae         0040974D
 00409744    movzx       edx,word ptr [esi+ebp*2]
 00409748    and         dx,0FFDF
 0040974D    cmp         dx,58
 00409751    sete        dl
>00409754    jmp         00409758
 00409756    xor         edx,edx
 00409758    test        dl,dl
>0040975A    je          0040981E
 00409760    cmp         ax,30
>00409764    jne         00409767
 00409766    inc         ebp
 00409767    inc         ebp
 00409768    movzx       ecx,word ptr [esi+ebp*2-2]
 0040976D    mov         eax,ecx
 0040976F    add         eax,0FFFFFFD0
 00409772    sub         ax,0A
>00409776    jb          0040978C
 00409778    add         eax,0FFFFFFF9
 0040977B    sub         ax,6
>0040977F    jb          00409794
 00409781    add         eax,0FFFFFFE6
 00409784    sub         ax,6
>00409788    jb          0040979C
>0040978A    jmp         004097F7
 0040978C    movzx       edi,cx
 0040978F    sub         edi,30
>00409792    jmp         004097A2
 00409794    movzx       edi,cx
 00409797    sub         edi,37
>0040979A    jmp         004097A2
 0040979C    movzx       edi,cx
 0040979F    sub         edi,57
 004097A2    cmp         dword ptr [esp+0C],0
>004097A7    jne         004097B2
 004097A9    cmp         dword ptr [esp+8],0
>004097AE    jb          004097F7
>004097B0    jmp         004097B4
>004097B2    jl          004097F7
 004097B4    cmp         dword ptr [esp+0C],0FFFFFFF
>004097BC    jne         004097C7
 004097BE    cmp         dword ptr [esp+8],0FFFFFFFF
>004097C3    jbe         004097C9
>004097C5    jmp         004097F7
>004097C7    jg          004097F7
 004097C9    mov         eax,edi
 004097CB    cdq
 004097CC    push        edx
 004097CD    push        eax
 004097CE    mov         eax,dword ptr [esp+10]
 004097D2    mov         edx,dword ptr [esp+14]
 004097D6    shld        edx,eax,4
 004097DA    shl         eax,4
 004097DD    add         eax,dword ptr [esp]
 004097E0    adc         edx,dword ptr [esp+4]
 004097E4    add         esp,8
 004097E7    mov         dword ptr [esp+8],eax
 004097EB    mov         dword ptr [esp+0C],edx
 004097EF    inc         ebp
 004097F0    xor         ebx,ebx
>004097F2    jmp         00409768
 004097F7    cmp         byte ptr [esp+10],0
>004097FC    je          004098D2
 00409802    mov         eax,dword ptr [esp+8]
 00409806    mov         edx,dword ptr [esp+0C]
 0040980A    neg         eax
 0040980C    adc         edx,0
 0040980F    neg         edx
 00409811    mov         dword ptr [esp+8],eax
 00409815    mov         dword ptr [esp+0C],edx
>00409819    jmp         004098D2
 0040981E    movzx       eax,word ptr [esi+ebp*2-2]
 00409823    add         eax,0FFFFFFD0
 00409826    sub         ax,0A
>0040982A    jae         0040988B
 0040982C    movzx       edi,word ptr [esi+ebp*2-2]
 00409831    sub         edi,30
 00409834    cmp         dword ptr [esp+0C],0
>00409839    jne         00409844
 0040983B    cmp         dword ptr [esp+8],0
>00409840    jb          0040988B
>00409842    jmp         00409846
>00409844    jl          0040988B
 00409846    cmp         dword ptr [esp+0C],0CCCCCCC
>0040984E    jne         0040985C
 00409850    cmp         dword ptr [esp+8],0CCCCCCCC
>00409858    jbe         0040985E
>0040985A    jmp         0040988B
>0040985C    jg          0040988B
 0040985E    push        0
 00409860    push        0A
 00409862    mov         eax,dword ptr [esp+10]
 00409866    mov         edx,dword ptr [esp+14]
 0040986A    call        @_llmul
 0040986F    push        edx
 00409870    push        eax
 00409871    mov         eax,edi
 00409873    cdq
 00409874    add         eax,dword ptr [esp]
 00409877    adc         edx,dword ptr [esp+4]
 0040987B    add         esp,8
 0040987E    mov         dword ptr [esp+8],eax
 00409882    mov         dword ptr [esp+0C],edx
 00409886    inc         ebp
 00409887    xor         ebx,ebx
>00409889    jmp         0040981E
 0040988B    cmp         byte ptr [esp+10],0
>00409890    je          004098A9
 00409892    mov         eax,dword ptr [esp+8]
 00409896    mov         edx,dword ptr [esp+0C]
 0040989A    neg         eax
 0040989C    adc         edx,0
 0040989F    neg         edx
 004098A1    mov         dword ptr [esp+8],eax
 004098A5    mov         dword ptr [esp+0C],edx
 004098A9    cmp         dword ptr [esp+0C],0
>004098AE    jne         004098B5
 004098B0    cmp         dword ptr [esp+8],0
>004098B5    je          004098D2
 004098B7    cmp         dword ptr [esp+0C],0
>004098BC    jne         004098C8
 004098BE    cmp         dword ptr [esp+8],0
 004098C3    setb        al
>004098C6    jmp         004098CB
 004098C8    setl        al
 004098CB    cmp         al,byte ptr [esp+10]
>004098CF    je          004098D2
 004098D1    dec         ebp
 004098D2    cmp         word ptr [esi+ebp*2-2],0
 004098D8    setne       al
 004098DB    or          bl,al
>004098DD    je          004098E6
 004098DF    mov         eax,dword ptr [esp]
 004098E2    mov         dword ptr [eax],ebp
>004098E4    jmp         004098ED
 004098E6    mov         eax,dword ptr [esp]
 004098E9    xor         edx,edx
 004098EB    mov         dword ptr [eax],edx
 004098ED    mov         eax,dword ptr [esp+8]
 004098F1    mov         edx,dword ptr [esp+0C]
 004098F5    add         esp,14
 004098F8    pop         ebp
 004098F9    pop         edi
 004098FA    pop         esi
 004098FB    pop         ebx
 004098FC    ret
*}
end;

//00409900
function @DynArrayLength(Arr:Pointer):Longint;
begin
{*
 00409900    test        eax,eax
>00409902    je          00409907
 00409904    mov         eax,dword ptr [eax-4]
 00409907    ret
*}
end;

//00409908
function @DynArrayHigh(Arr:Pointer):Longint;
begin
{*
 00409908    call        @DynArrayLength
 0040990D    dec         eax
 0040990E    ret
*}
end;

//00409910
procedure CopyArray(dest:Pointer; source:Pointer; typeInfo:Pointer; cnt:Integer);
begin
{*
 00409910    push        ebp
 00409911    mov         ebp,esp
 00409913    push        dword ptr [ebp+8]
 00409916    call        @CopyArray
 0040991B    pop         ebp
 0040991C    ret         4
*}
end;

//00409920
procedure FinalizeArray(P:Pointer; TypeInfo:Pointer; Count:Cardinal);
begin
{*
>00409920    jmp         @FinalizeArray
 00409925    ret
*}
end;

//00409928
procedure DynArrayClear(var arr:Pointer; typeInfo:PDynArrayTypeInfo);
begin
{*
 00409928    call        @DynArrayClear
 0040992D    ret
*}
end;

//00409930
procedure DynArraySetLength(var arr:Pointer; typeInfo:PDynArrayTypeInfo; dimCnt:Longint; lenVec:PLongint);
begin
{*
 00409930    push        ebp
 00409931    mov         ebp,esp
 00409933    add         esp,0FFFFFFE0
 00409936    push        ebx
 00409937    push        esi
 00409938    push        edi
 00409939    mov         dword ptr [ebp-8],ecx
 0040993C    mov         esi,edx
 0040993E    mov         dword ptr [ebp-4],eax
 00409941    mov         ebx,dword ptr [ebp-4]
 00409944    mov         ebx,dword ptr [ebx]
 00409946    mov         eax,dword ptr [ebp+8]
 00409949    mov         edi,dword ptr [eax]
 0040994B    test        edi,edi
>0040994D    jg          00409969
 0040994F    test        edi,edi
>00409951    jge         0040995A
 00409953    mov         al,4
 00409955    call        Error
 0040995A    mov         eax,dword ptr [ebp-4]
 0040995D    mov         edx,esi
 0040995F    call        DynArrayClear
>00409964    jmp         00409ABD
 00409969    xor         eax,eax
 0040996B    mov         dword ptr [ebp-10],eax
 0040996E    test        ebx,ebx
>00409970    je          0040997B
 00409972    sub         ebx,8
 00409975    mov         eax,dword ptr [ebx+4]
 00409978    mov         dword ptr [ebp-10],eax
 0040997B    movzx       eax,byte ptr [esi+1]
 0040997F    add         esi,eax
 00409981    mov         eax,esi
 00409983    mov         edx,dword ptr [eax+2]
 00409986    mov         dword ptr [ebp-18],edx
 00409989    mov         edx,dword ptr [eax+6]
 0040998C    test        edx,edx
>0040998E    je          00409994
 00409990    mov         esi,dword ptr [edx]
>00409992    jmp         00409996
 00409994    xor         esi,esi
 00409996    mov         eax,edi
 00409998    imul        dword ptr [ebp-18]
 0040999B    mov         dword ptr [ebp-1C],eax
 0040999E    mov         eax,dword ptr [ebp-1C]
 004099A1    cdq
 004099A2    idiv        eax,edi
 004099A4    cmp         eax,dword ptr [ebp-18]
>004099A7    je          004099B0
 004099A9    mov         al,4
 004099AB    call        Error
 004099B0    add         dword ptr [ebp-1C],8
 004099B4    cmp         dword ptr [ebp-1C],0
>004099B8    jge         004099C1
 004099BA    mov         al,4
 004099BC    call        Error
 004099C1    test        ebx,ebx
>004099C3    je          004099CA
 004099C5    cmp         dword ptr [ebx],1
>004099C8    jne         004099FF
 004099CA    mov         dword ptr [ebp-20],ebx
 004099CD    cmp         edi,dword ptr [ebp-10]
>004099D0    jge         004099EF
 004099D2    test        esi,esi
>004099D4    je          004099EF
 004099D6    mov         eax,ebx
 004099D8    add         eax,8
 004099DB    mov         edx,edi
 004099DD    imul        edx,dword ptr [ebp-18]
 004099E1    add         eax,edx
 004099E3    mov         ecx,dword ptr [ebp-10]
 004099E6    sub         ecx,edi
 004099E8    mov         edx,esi
 004099EA    call        FinalizeArray
 004099EF    lea         eax,[ebp-20]
 004099F2    mov         edx,dword ptr [ebp-1C]
 004099F5    call        @ReallocMem
 004099FA    mov         ebx,dword ptr [ebp-20]
>004099FD    jmp         00409A5D
 004099FF    dec         dword ptr [ebx]
 00409A01    mov         eax,dword ptr [ebp-1C]
 00409A04    call        @GetMem
 00409A09    mov         ebx,eax
 00409A0B    mov         eax,dword ptr [ebp-10]
 00409A0E    mov         dword ptr [ebp-14],eax
 00409A11    cmp         edi,dword ptr [ebp-14]
>00409A14    jge         00409A19
 00409A16    mov         dword ptr [ebp-14],edi
 00409A19    test        esi,esi
>00409A1B    je          00409A47
 00409A1D    mov         edx,dword ptr [ebp-14]
 00409A20    imul        edx,dword ptr [ebp-18]
 00409A24    mov         eax,ebx
 00409A26    add         eax,8
 00409A29    xor         ecx,ecx
 00409A2B    call        @FillChar
 00409A30    mov         eax,dword ptr [ebp-14]
 00409A33    push        eax
 00409A34    mov         edx,dword ptr [ebp-4]
 00409A37    mov         edx,dword ptr [edx]
 00409A39    mov         eax,ebx
 00409A3B    add         eax,8
 00409A3E    mov         ecx,esi
 00409A40    call        CopyArray
>00409A45    jmp         00409A5D
 00409A47    mov         ecx,dword ptr [ebp-14]
 00409A4A    imul        ecx,dword ptr [ebp-18]
 00409A4E    mov         edx,ebx
 00409A50    add         edx,8
 00409A53    mov         eax,dword ptr [ebp-4]
 00409A56    mov         eax,dword ptr [eax]
 00409A58    call        Move
 00409A5D    mov         eax,ebx
 00409A5F    mov         dword ptr [eax],1
 00409A65    mov         dword ptr [eax+4],edi
 00409A68    add         ebx,8
 00409A6B    mov         edx,edi
 00409A6D    sub         edx,dword ptr [ebp-10]
 00409A70    imul        edx,dword ptr [ebp-18]
 00409A74    mov         eax,dword ptr [ebp-18]
 00409A77    imul        eax,dword ptr [ebp-10]
 00409A7B    add         eax,ebx
 00409A7D    xor         ecx,ecx
 00409A7F    call        @FillChar
 00409A84    cmp         dword ptr [ebp-8],1
>00409A88    jle         00409AB8
 00409A8A    add         dword ptr [ebp+8],4
 00409A8E    dec         dword ptr [ebp-8]
 00409A91    dec         edi
 00409A92    test        edi,edi
>00409A94    jl          00409AB8
 00409A96    inc         edi
 00409A97    mov         dword ptr [ebp-0C],0
 00409A9E    mov         eax,dword ptr [ebp+8]
 00409AA1    push        eax
 00409AA2    mov         eax,dword ptr [ebp-0C]
 00409AA5    lea         eax,[ebx+eax*4]
 00409AA8    mov         ecx,dword ptr [ebp-8]
 00409AAB    mov         edx,esi
 00409AAD    call        DynArraySetLength
 00409AB2    inc         dword ptr [ebp-0C]
 00409AB5    dec         edi
>00409AB6    jne         00409A9E
 00409AB8    mov         eax,dword ptr [ebp-4]
 00409ABB    mov         dword ptr [eax],ebx
 00409ABD    pop         edi
 00409ABE    pop         esi
 00409ABF    pop         ebx
 00409AC0    mov         esp,ebp
 00409AC2    pop         ebp
 00409AC3    ret         4
*}
end;

//00409AC8
procedure @DynArraySetLength(var Arr:Pointer; TypeInfo:PDynArrayTypeInfo; DimCnt:Longint; LengthVec:Longint);
begin
{*
 00409AC8    push        esp
 00409AC9    add         dword ptr [esp],4
 00409ACD    call        DynArraySetLength
 00409AD2    ret
*}
end;

//00409AD4
procedure @DynArrayCopyRange(Arr:Pointer; TypeInfo:PDynArrayTypeInfo; Index:Integer; Count:Integer; var Result:Pointer);
begin
{*
 00409AD4    push        ebp
 00409AD5    mov         ebp,esp
 00409AD7    add         esp,0FFFFFFF0
 00409ADA    push        ebx
 00409ADB    push        esi
 00409ADC    push        edi
 00409ADD    mov         edi,ecx
 00409ADF    mov         dword ptr [ebp-8],edx
 00409AE2    mov         dword ptr [ebp-4],eax
 00409AE5    mov         ebx,dword ptr [ebp+0C]
 00409AE8    xor         esi,esi
 00409AEA    cmp         dword ptr [ebp-4],0
>00409AEE    je          00409BAF
 00409AF4    mov         eax,dword ptr [ebp-8]
 00409AF7    mov         dword ptr [ebp-10],eax
 00409AFA    test        edi,edi
>00409AFC    jge         00409B02
 00409AFE    add         ebx,edi
 00409B00    xor         edi,edi
 00409B02    mov         eax,dword ptr [ebp-4]
 00409B05    sub         eax,8
 00409B08    mov         eax,dword ptr [eax+4]
 00409B0B    cmp         eax,edi
>00409B0D    jge         00409B11
 00409B0F    mov         edi,eax
 00409B11    mov         edx,eax
 00409B13    sub         edx,edi
 00409B15    cmp         ebx,edx
>00409B17    jle         00409B1B
 00409B19    mov         ebx,edx
 00409B1B    test        ebx,ebx
>00409B1D    jge         00409B21
 00409B1F    xor         ebx,ebx
 00409B21    test        ebx,ebx
>00409B23    jle         00409BAF
 00409B29    mov         eax,dword ptr [ebp-10]
 00409B2C    movzx       eax,byte ptr [eax+1]
 00409B30    add         dword ptr [ebp-10],eax
 00409B33    mov         eax,dword ptr [ebp-10]
 00409B36    mov         eax,dword ptr [eax+2]
 00409B39    mov         dword ptr [ebp-0C],eax
 00409B3C    mov         eax,dword ptr [ebp-10]
 00409B3F    mov         eax,dword ptr [eax+6]
 00409B42    test        eax,eax
>00409B44    je          00409B4D
 00409B46    mov         eax,dword ptr [eax]
 00409B48    mov         dword ptr [ebp-10],eax
>00409B4B    jmp         00409B52
 00409B4D    xor         eax,eax
 00409B4F    mov         dword ptr [ebp-10],eax
 00409B52    mov         eax,ebx
 00409B54    imul        dword ptr [ebp-0C]
 00409B57    add         eax,8
 00409B5A    call        @GetMem
 00409B5F    mov         esi,eax
 00409B61    mov         eax,esi
 00409B63    mov         dword ptr [eax],1
 00409B69    mov         dword ptr [eax+4],ebx
 00409B6C    add         esi,8
 00409B6F    imul        edi,dword ptr [ebp-0C]
 00409B73    add         dword ptr [ebp-4],edi
 00409B76    test        ebx,ebx
>00409B78    jle         00409BAF
 00409B7A    cmp         dword ptr [ebp-10],0
>00409B7E    je          00409B9F
 00409B80    mov         edx,ebx
 00409B82    imul        edx,dword ptr [ebp-0C]
 00409B86    mov         eax,esi
 00409B88    xor         ecx,ecx
 00409B8A    call        @FillChar
 00409B8F    push        ebx
 00409B90    mov         ecx,dword ptr [ebp-10]
 00409B93    mov         edx,dword ptr [ebp-4]
 00409B96    mov         eax,esi
 00409B98    call        CopyArray
>00409B9D    jmp         00409BAF
 00409B9F    mov         ecx,ebx
 00409BA1    imul        ecx,dword ptr [ebp-0C]
 00409BA5    mov         edx,esi
 00409BA7    mov         eax,dword ptr [ebp-4]
 00409BAA    call        Move
 00409BAF    mov         eax,dword ptr [ebp+8]
 00409BB2    mov         edx,dword ptr [ebp-8]
 00409BB5    call        DynArrayClear
 00409BBA    mov         eax,dword ptr [ebp+8]
 00409BBD    mov         dword ptr [eax],esi
 00409BBF    pop         edi
 00409BC0    pop         esi
 00409BC1    pop         ebx
 00409BC2    mov         esp,ebp
 00409BC4    pop         ebp
 00409BC5    ret         8
*}
end;

//00409BC8
procedure @DynArrayClear(var Arr:Pointer; TypeInfo:PDynArrayTypeInfo);
begin
{*
 00409BC8    mov         ecx,dword ptr [eax]
 00409BCA    test        ecx,ecx
>00409BCC    je          00409C03
 00409BCE    mov         dword ptr [eax],0
 00409BD4    lock dec    dword ptr [ecx-8]
>00409BD8    jne         00409C03
 00409BDA    push        eax
 00409BDB    mov         eax,ecx
 00409BDD    xor         ecx,ecx
 00409BDF    mov         cl,byte ptr [edx+1]
 00409BE2    mov         edx,dword ptr [ecx+edx+6]
 00409BE6    test        edx,edx
>00409BE8    je          00409BFA
 00409BEA    mov         ecx,dword ptr [eax-4]
 00409BED    test        ecx,ecx
>00409BEF    je          00409BFA
 00409BF1    mov         edx,dword ptr [edx]
 00409BF3    push        eax
 00409BF4    call        @FinalizeArray
 00409BF9    pop         eax
 00409BFA    sub         eax,8
 00409BFD    call        @FreeMem
 00409C02    pop         eax
 00409C03    ret
*}
end;

//00409C04
procedure @DynArrayAsg(var Dest:Pointer; Source:Pointer; TypeInfo:PDynArrayTypeInfo);
begin
{*
 00409C04    push        ebx
 00409C05    mov         ebx,dword ptr [eax]
 00409C07    test        edx,edx
>00409C09    je          00409C0F
 00409C0B    lock inc    dword ptr [edx-8]
 00409C0F    test        ebx,ebx
>00409C11    je          00409C27
 00409C13    lock dec    dword ptr [ebx-8]
>00409C17    jne         00409C27
 00409C19    push        eax
 00409C1A    push        edx
 00409C1B    mov         edx,ecx
 00409C1D    inc         dword ptr [ebx-8]
 00409C20    call        @DynArrayClear
 00409C25    pop         edx
 00409C26    pop         eax
 00409C27    mov         dword ptr [eax],edx
 00409C29    pop         ebx
 00409C2A    ret
*}
end;

//00409C2C
procedure @DynArrayAddRef(Arr:Pointer);
begin
{*
 00409C2C    test        eax,eax
>00409C2E    je          00409C34
 00409C30    lock inc    dword ptr [eax-8]
 00409C34    ret
*}
end;

//00409C38
function FindHInstance(Address:Pointer):Cardinal;
begin
{*
 00409C38    add         esp,0FFFFFFE4
 00409C3B    push        1C
 00409C3D    lea         edx,[esp+4]
 00409C41    push        edx
 00409C42    push        eax
 00409C43    call        kernel32.VirtualQuery
 00409C48    cmp         dword ptr [esp+10],1000
>00409C50    jne         00409C58
 00409C52    mov         eax,dword ptr [esp+4]
>00409C56    jmp         00409C5A
 00409C58    xor         eax,eax
 00409C5A    add         esp,1C
 00409C5D    ret
*}
end;

//00409C60
function FindClassHInstance(ClassType:TClass):Cardinal;
begin
{*
 00409C60    call        FindHInstance
 00409C65    ret
*}
end;

//00409C68
function DelayLoadResourceModule(Module:PLibModule):Cardinal;
begin
{*
 00409C68    push        ebx
 00409C69    push        esi
 00409C6A    add         esp,0FFFFFDF4
 00409C70    mov         ebx,eax
 00409C72    cmp         dword ptr [ebx+10],0
>00409C76    jne         00409CA3
 00409C78    push        20A
 00409C7D    lea         eax,[esp+4]
 00409C81    push        eax
 00409C82    mov         eax,dword ptr [ebx+4]
 00409C85    push        eax
 00409C86    call        kernel32.GetModuleFileNameW
 00409C8B    mov         eax,esp
 00409C8D    mov         dl,1
 00409C8F    call        LoadResourceModule
 00409C94    mov         esi,eax
 00409C96    mov         dword ptr [ebx+10],esi
 00409C99    test        esi,esi
>00409C9B    jne         00409CA3
 00409C9D    mov         eax,dword ptr [ebx+4]
 00409CA0    mov         dword ptr [ebx+10],eax
 00409CA3    mov         eax,dword ptr [ebx+10]
 00409CA6    add         esp,20C
 00409CAC    pop         esi
 00409CAD    pop         ebx
 00409CAE    ret
*}
end;

//00409CB0
function FindResourceHInstance(Instance:Cardinal):Cardinal;
begin
{*
 00409CB0    push        ebx
 00409CB1    push        esi
 00409CB2    push        edi
 00409CB3    mov         esi,eax
 00409CB5    mov         ebx,dword ptr ds:[784034];gvar_00784034
 00409CBB    test        ebx,ebx
>00409CBD    je          00409CDF
 00409CBF    cmp         esi,dword ptr [ebx+4]
>00409CC2    je          00409CCE
 00409CC4    cmp         esi,dword ptr [ebx+8]
>00409CC7    je          00409CCE
 00409CC9    cmp         esi,dword ptr [ebx+0C]
>00409CCC    jne         00409CD9
 00409CCE    mov         eax,ebx
 00409CD0    call        DelayLoadResourceModule
 00409CD5    mov         edi,eax
>00409CD7    jmp         00409CE1
 00409CD9    mov         ebx,dword ptr [ebx]
 00409CDB    test        ebx,ebx
>00409CDD    jne         00409CBF
 00409CDF    mov         edi,esi
 00409CE1    mov         eax,edi
 00409CE3    pop         edi
 00409CE4    pop         esi
 00409CE5    pop         ebx
 00409CE6    ret
*}
end;

//00409F14
procedure InitializeLocaleData;
begin
{*
 00409F14    push        790B55
 00409F19    call        kernel32.InitializeCriticalSection
 00409F1E    mov         word ptr ds:[790B6E],7F
 00409F27    call        kernel32.GetVersion
 00409F2C    and         eax,0FF
 00409F31    cmp         eax,6
 00409F34    setae       byte ptr ds:[790B54]
 00409F3B    cmp         byte ptr ds:[790B54],0
>00409F42    je          00409F92
 00409F44    push        409F94
 00409F49    push        409FB4
 00409F4E    call        kernel32.GetModuleHandleW
 00409F53    push        eax
 00409F54    call        kernel32.GetProcAddress
 00409F59    mov         [00790B48],eax
 00409F5E    push        409FD0
 00409F63    push        409FB4
 00409F68    call        kernel32.GetModuleHandleW
 00409F6D    push        eax
 00409F6E    call        kernel32.GetProcAddress
 00409F73    mov         [00790B4C],eax
 00409F78    push        409FF0
 00409F7D    push        409FB4
 00409F82    call        kernel32.GetModuleHandleW
 00409F87    push        eax
 00409F88    call        kernel32.GetProcAddress
 00409F8D    mov         [00790B50],eax
 00409F92    ret
*}
end;

//0040A004
procedure FinalizeLocaleDate;
begin
{*
 0040A004    push        790B55
 0040A009    call        kernel32.DeleteCriticalSection
 0040A00E    ret
*}
end;

//0040A010
function LastHyphenPos(S:AnsiString):Integer;
begin
{*
 0040A010    push        ebp
 0040A011    mov         ebp,esp
 0040A013    push        ecx
 0040A014    push        ebx
 0040A015    mov         dword ptr [ebp-4],eax
 0040A018    mov         eax,dword ptr [ebp-4]
 0040A01B    call        @UStrAddRef
 0040A020    xor         eax,eax
 0040A022    push        ebp
 0040A023    push        40A06C
 0040A028    push        dword ptr fs:[eax]
 0040A02B    mov         dword ptr fs:[eax],esp
 0040A02E    mov         eax,dword ptr [ebp-4]
 0040A031    test        eax,eax
>0040A033    je          0040A03A
 0040A035    sub         eax,4
 0040A038    mov         eax,dword ptr [eax]
 0040A03A    cmp         eax,1
>0040A03D    jl          0040A054
 0040A03F    mov         edx,dword ptr [ebp-4]
 0040A042    cmp         word ptr [edx+eax*2-2],2D
>0040A048    jne         0040A04F
 0040A04A    mov         ebx,eax
 0040A04C    dec         ebx
>0040A04D    jmp         0040A056
 0040A04F    dec         eax
 0040A050    test        eax,eax
>0040A052    jne         0040A03F
 0040A054    xor         ebx,ebx
 0040A056    xor         eax,eax
 0040A058    pop         edx
 0040A059    pop         ecx
 0040A05A    pop         ecx
 0040A05B    mov         dword ptr fs:[eax],edx
 0040A05E    push        40A073
 0040A063    lea         eax,[ebp-4]
 0040A066    call        @UStrClr
 0040A06B    ret
>0040A06C    jmp         @HandleFinally
>0040A071    jmp         0040A063
 0040A073    mov         eax,ebx
 0040A075    pop         ebx
 0040A076    pop         ecx
 0040A077    pop         ebp
 0040A078    ret
*}
end;

//0040A07C
function ConvertResToUILanguages(ResBuffer:PAnsiChar):string;
begin
{*
 0040A07C    push        ebp
 0040A07D    mov         ebp,esp
 0040A07F    xor         ecx,ecx
 0040A081    push        ecx
 0040A082    push        ecx
 0040A083    push        ecx
 0040A084    push        ecx
 0040A085    push        ebx
 0040A086    push        esi
 0040A087    mov         ebx,edx
 0040A089    mov         esi,eax
 0040A08B    xor         eax,eax
 0040A08D    push        ebp
 0040A08E    push        40A14D
 0040A093    push        dword ptr fs:[eax]
 0040A096    mov         dword ptr fs:[eax],esp
 0040A099    mov         eax,ebx
 0040A09B    mov         edx,esi
 0040A09D    call        @UStrFromPChar
 0040A0A2    mov         eax,dword ptr [ebx]
 0040A0A4    mov         dword ptr [ebp-0C],eax
 0040A0A7    mov         eax,dword ptr [ebp-0C]
 0040A0AA    test        eax,eax
>0040A0AC    je          0040A0B3
 0040A0AE    sub         eax,4
 0040A0B1    mov         eax,dword ptr [eax]
 0040A0B3    test        eax,eax
>0040A0B5    jle         0040A0CA
 0040A0B7    mov         edx,1
 0040A0BC    mov         ecx,dword ptr [ebx]
 0040A0BE    cmp         word ptr [ecx+edx*2-2],2C
>0040A0C4    je          0040A12A
 0040A0C6    inc         edx
 0040A0C7    dec         eax
>0040A0C8    jne         0040A0BC
 0040A0CA    lea         eax,[ebp-8]
 0040A0CD    mov         edx,dword ptr [ebx]
 0040A0CF    call        @UStrLAsg
 0040A0D4    mov         eax,ebx
 0040A0D6    call        @UStrClr
>0040A0DB    jmp         0040A124
 0040A0DD    push        dword ptr [ebx]
 0040A0DF    push        dword ptr [ebp-4]
 0040A0E2    push        dword ptr [ebp-8]
 0040A0E5    mov         eax,ebx
 0040A0E7    mov         edx,3
 0040A0EC    call        @UStrCatN
 0040A0F1    lea         eax,[ebp-4]
 0040A0F4    mov         edx,40A168;','
 0040A0F9    call        @UStrLAsg
 0040A0FE    lea         eax,[ebp-10]
 0040A101    push        eax
 0040A102    mov         eax,dword ptr [ebp-8]
 0040A105    call        LastHyphenPos
 0040A10A    mov         ecx,eax
 0040A10C    mov         edx,1
 0040A111    mov         eax,dword ptr [ebp-8]
 0040A114    call        @UStrCopy
 0040A119    mov         edx,dword ptr [ebp-10]
 0040A11C    lea         eax,[ebp-8]
 0040A11F    call        @UStrLAsg
 0040A124    cmp         dword ptr [ebp-8],0
>0040A128    jne         0040A0DD
 0040A12A    xor         eax,eax
 0040A12C    pop         edx
 0040A12D    pop         ecx
 0040A12E    pop         ecx
 0040A12F    mov         dword ptr fs:[eax],edx
 0040A132    push        40A154
 0040A137    lea         eax,[ebp-10]
 0040A13A    call        @UStrClr
 0040A13F    lea         eax,[ebp-8]
 0040A142    mov         edx,2
 0040A147    call        @UStrArrayClr
 0040A14C    ret
>0040A14D    jmp         @HandleFinally
>0040A152    jmp         0040A137
 0040A154    pop         esi
 0040A155    pop         ebx
 0040A156    mov         esp,ebp
 0040A158    pop         ebp
 0040A159    ret
*}
end;

//0040A16C
function GetPreferredLangForOldOS(LANGID:Word):string;
begin
{*
 0040A16C    push        ebp
 0040A16D    mov         ebp,esp
 0040A16F    add         esp,0FFFFFE98
 0040A175    push        ebx
 0040A176    push        esi
 0040A177    push        edi
 0040A178    xor         ecx,ecx
 0040A17A    mov         dword ptr [ebp-160],ecx
 0040A180    mov         dword ptr [ebp-164],ecx
 0040A186    mov         dword ptr [ebp-168],ecx
 0040A18C    mov         dword ptr [ebp-4],edx
 0040A18F    mov         esi,eax
 0040A191    xor         eax,eax
 0040A193    push        ebp
 0040A194    push        40A2D1
 0040A199    push        dword ptr fs:[eax]
 0040A19C    mov         dword ptr fs:[eax],esp
 0040A19F    mov         eax,dword ptr [ebp-4]
 0040A1A2    call        @UStrClr
 0040A1A7    cmp         si,word ptr ds:[784810]
>0040A1AE    jb          0040A204
 0040A1B0    cmp         si,word ptr ds:[784A10]
>0040A1B7    ja          0040A204
 0040A1B9    mov         edi,40
 0040A1BE    xor         eax,eax
 0040A1C0    mov         dword ptr [ebp-8],eax
 0040A1C3    cmp         edi,dword ptr [ebp-8]
>0040A1C6    jb          0040A204
 0040A1C8    mov         ebx,dword ptr [ebp-8]
 0040A1CB    add         ebx,edi
 0040A1CD    shr         ebx,1
 0040A1CF    cmp         si,word ptr [ebx*8+784810]
>0040A1D7    jae         0040A1DE
 0040A1D9    mov         edi,ebx
 0040A1DB    dec         edi
>0040A1DC    jmp         0040A1FF
 0040A1DE    cmp         si,word ptr [ebx*8+784810]
>0040A1E6    jbe         0040A1EE
 0040A1E8    inc         ebx
 0040A1E9    mov         dword ptr [ebp-8],ebx
>0040A1EC    jmp         0040A1FF
 0040A1EE    mov         edx,dword ptr [ebp-4]
 0040A1F1    mov         eax,dword ptr [ebx*8+784814]
 0040A1F8    call        ConvertResToUILanguages
>0040A1FD    jmp         0040A204
 0040A1FF    cmp         edi,dword ptr [ebp-8]
>0040A202    jae         0040A1C8
 0040A204    mov         eax,dword ptr [ebp-4]
 0040A207    cmp         dword ptr [eax],0
>0040A20A    jne         0040A2B3
 0040A210    push        2
 0040A212    movzx       eax,si
 0040A215    push        eax
 0040A216    call        kernel32.IsValidLocale
 0040A21B    test        eax,eax
>0040A21D    je          0040A2B3
 0040A223    push        55
 0040A225    lea         eax,[ebp-0B2]
 0040A22B    push        eax
 0040A22C    push        59
 0040A22E    movzx       ebx,si
 0040A231    push        ebx
 0040A232    call        kernel32.GetLocaleInfoW
 0040A237    push        55
 0040A239    lea         eax,[ebp-15C]
 0040A23F    push        eax
 0040A240    push        5A
 0040A242    push        ebx
 0040A243    call        kernel32.GetLocaleInfoW
 0040A248    lea         eax,[ebp-160]
 0040A24E    lea         edx,[ebp-0B2]
 0040A254    mov         ecx,55
 0040A259    call        @UStrFromWArray
 0040A25E    push        dword ptr [ebp-160]
 0040A264    push        40A2EC;'-'
 0040A269    lea         eax,[ebp-164]
 0040A26F    lea         edx,[ebp-15C]
 0040A275    mov         ecx,55
 0040A27A    call        @UStrFromWArray
 0040A27F    push        dword ptr [ebp-164]
 0040A285    push        40A2FC;','
 0040A28A    lea         eax,[ebp-168]
 0040A290    lea         edx,[ebp-0B2]
 0040A296    mov         ecx,55
 0040A29B    call        @UStrFromWArray
 0040A2A0    push        dword ptr [ebp-168]
 0040A2A6    mov         eax,dword ptr [ebp-4]
 0040A2A9    mov         edx,5
 0040A2AE    call        @UStrCatN
 0040A2B3    xor         eax,eax
 0040A2B5    pop         edx
 0040A2B6    pop         ecx
 0040A2B7    pop         ecx
 0040A2B8    mov         dword ptr fs:[eax],edx
 0040A2BB    push        40A2D8
 0040A2C0    lea         eax,[ebp-168]
 0040A2C6    mov         edx,3
 0040A2CB    call        @UStrArrayClr
 0040A2D0    ret
>0040A2D1    jmp         @HandleFinally
>0040A2D6    jmp         0040A2C0
 0040A2D8    pop         edi
 0040A2D9    pop         esi
 0040A2DA    pop         ebx
 0040A2DB    mov         esp,ebp
 0040A2DD    pop         ebp
 0040A2DE    ret
*}
end;

//0040A300
function CheckDifferentLanguageList(src1:PWideChar; src2:PWideChar; len:Integer):Boolean;
begin
{*
 0040A300    push        ebx
 0040A301    push        esi
 0040A302    mov         esi,ecx
 0040A304    mov         cl,1
 0040A306    test        esi,esi
>0040A308    jle         0040A31D
 0040A30A    movzx       ebx,word ptr [eax]
 0040A30D    cmp         bx,word ptr [edx]
>0040A310    jne         0040A31F
 0040A312    add         eax,2
 0040A315    add         edx,2
 0040A318    dec         esi
 0040A319    test        esi,esi
>0040A31B    jg          0040A30A
 0040A31D    xor         ecx,ecx
 0040A31F    mov         eax,ecx
 0040A321    pop         esi
 0040A322    pop         ebx
 0040A323    ret
*}
end;

//0040A324
function ThreadUILanguages(var bufsize:Integer):PWideChar;
begin
{*
 0040A324    push        ebp
 0040A325    mov         ebp,esp
 0040A327    push        ecx
 0040A328    push        ebx
 0040A329    push        esi
 0040A32A    mov         ebx,eax
 0040A32C    xor         esi,esi
 0040A32E    xor         eax,eax
 0040A330    mov         dword ptr [ebx],eax
 0040A332    push        ebx
 0040A333    push        0
 0040A335    lea         eax,[ebp-4]
 0040A338    push        eax
 0040A339    push        38
 0040A33B    call        dword ptr ds:[790B48]
 0040A341    test        al,al
>0040A343    je          0040A35E
 0040A345    mov         eax,dword ptr [ebx]
 0040A347    add         eax,eax
 0040A349    call        @GetMem
 0040A34E    mov         esi,eax
 0040A350    push        ebx
 0040A351    push        esi
 0040A352    lea         eax,[ebp-4]
 0040A355    push        eax
 0040A356    push        38
 0040A358    call        dword ptr ds:[790B48]
 0040A35E    mov         eax,esi
 0040A360    pop         esi
 0040A361    pop         ebx
 0040A362    pop         ecx
 0040A363    pop         ebp
 0040A364    ret
*}
end;

//0040A368
function GetPreferredLangForNewOS(const LANGID:Word):string;
begin
{*
 0040A368    push        ebp
 0040A369    mov         ebp,esp
 0040A36B    add         esp,0FFFFFFE4
 0040A36E    push        ebx
 0040A36F    push        esi
 0040A370    mov         esi,edx
 0040A372    mov         ebx,eax
 0040A374    xor         eax,eax
 0040A376    mov         dword ptr [ebp-0C],eax
 0040A379    call        dword ptr ds:[790B50]
 0040A37F    cmp         bx,ax
>0040A382    je          0040A3DC
 0040A384    lea         eax,[ebp-4]
 0040A387    call        ThreadUILanguages
 0040A38C    mov         dword ptr [ebp-0C],eax
 0040A38F    mov         edx,ebx
 0040A391    mov         dword ptr [ebp-10],3
 0040A398    lea         eax,[ebp-16]
 0040A39B    mov         ecx,edx
 0040A39D    and         cx,0F
 0040A3A1    movzx       ecx,cx
 0040A3A4    movzx       ecx,byte ptr [ecx+7847E4]
 0040A3AB    mov         word ptr [eax],cx
 0040A3AE    movzx       edx,dx
 0040A3B1    shr         edx,4
 0040A3B4    dec         dword ptr [ebp-10]
 0040A3B7    sub         eax,2
 0040A3BA    cmp         dword ptr [ebp-10],0FFFFFFFF
>0040A3BE    jne         0040A39B
 0040A3C0    mov         word ptr [ebp-14],0
 0040A3C6    mov         word ptr [ebp-12],0
 0040A3CC    lea         eax,[ebp-10]
 0040A3CF    push        eax
 0040A3D0    lea         eax,[ebp-1C]
 0040A3D3    push        eax
 0040A3D4    push        4
 0040A3D6    call        dword ptr ds:[790B4C]
 0040A3DC    lea         eax,[ebp-8]
 0040A3DF    call        ThreadUILanguages
 0040A3E4    mov         ebx,eax
 0040A3E6    test        ebx,ebx
>0040A3E8    je          0040A425
 0040A3EA    mov         eax,dword ptr [ebp-8]
 0040A3ED    sub         eax,2
 0040A3F0    test        eax,eax
>0040A3F2    jl          0040A415
 0040A3F4    inc         eax
 0040A3F5    mov         dword ptr [ebp-10],0
 0040A3FC    mov         edx,dword ptr [ebp-10]
 0040A3FF    cmp         word ptr [ebx+edx*2],0
>0040A404    jne         0040A40F
 0040A406    mov         edx,dword ptr [ebp-10]
 0040A409    mov         word ptr [ebx+edx*2],2C
 0040A40F    inc         dword ptr [ebp-10]
 0040A412    dec         eax
>0040A413    jne         0040A3FC
 0040A415    mov         eax,esi
 0040A417    mov         edx,ebx
 0040A419    call        @UStrFromPWChar
 0040A41E    mov         eax,ebx
 0040A420    call        @FreeMem
 0040A425    cmp         dword ptr [ebp-0C],0
>0040A429    je          0040A47B
 0040A42B    lea         eax,[ebp-10]
 0040A42E    push        eax
 0040A42F    push        0
 0040A431    push        0
 0040A433    call        dword ptr ds:[790B4C]
 0040A439    lea         eax,[ebp-8]
 0040A43C    call        ThreadUILanguages
 0040A441    mov         ebx,eax
 0040A443    mov         eax,dword ptr [ebp-4]
 0040A446    cmp         eax,dword ptr [ebp-8]
>0040A449    jne         0040A45C
 0040A44B    mov         ecx,dword ptr [ebp-8]
 0040A44E    mov         edx,ebx
 0040A450    mov         eax,dword ptr [ebp-0C]
 0040A453    call        CheckDifferentLanguageList
 0040A458    test        al,al
>0040A45A    je          0040A46C
 0040A45C    lea         eax,[ebp-10]
 0040A45F    push        eax
 0040A460    mov         eax,dword ptr [ebp-0C]
 0040A463    push        eax
 0040A464    push        8
 0040A466    call        dword ptr ds:[790B4C]
 0040A46C    mov         eax,ebx
 0040A46E    call        @FreeMem
 0040A473    mov         eax,dword ptr [ebp-0C]
 0040A476    call        @FreeMem
 0040A47B    pop         esi
 0040A47C    pop         ebx
 0040A47D    mov         esp,ebp
 0040A47F    pop         ebp
 0040A480    ret
*}
end;

//0040A484
function GetUILanguages(const LANGID:Word):string;
begin
{*
 0040A484    push        ebp
 0040A485    mov         ebp,esp
 0040A487    push        0
 0040A489    push        ebx
 0040A48A    push        esi
 0040A48B    mov         esi,edx
 0040A48D    mov         ebx,eax
 0040A48F    xor         eax,eax
 0040A491    push        ebp
 0040A492    push        40A587
 0040A497    push        dword ptr fs:[eax]
 0040A49A    mov         dword ptr fs:[eax],esp
 0040A49D    push        790B55
 0040A4A2    call        kernel32.EnterCriticalSection
 0040A4A7    cmp         bx,word ptr ds:[790B6E]
>0040A4AE    jne         0040A4D0
 0040A4B0    mov         eax,esi
 0040A4B2    mov         edx,790B70
 0040A4B7    mov         ecx,55
 0040A4BC    call        @UStrFromWArray
 0040A4C1    push        790B55
 0040A4C6    call        kernel32.LeaveCriticalSection
>0040A4CB    jmp         0040A571
 0040A4D0    push        790B55
 0040A4D5    call        kernel32.LeaveCriticalSection
 0040A4DA    mov         eax,esi
 0040A4DC    call        @UStrClr
 0040A4E1    push        2
 0040A4E3    movzx       eax,bx
 0040A4E6    push        eax
 0040A4E7    call        kernel32.IsValidLocale
 0040A4EC    test        eax,eax
>0040A4EE    je          0040A53F
 0040A4F0    cmp         byte ptr ds:[790B54],0
>0040A4F7    je          0040A504
 0040A4F9    mov         edx,esi
 0040A4FB    mov         eax,ebx
 0040A4FD    call        GetPreferredLangForNewOS
>0040A502    jmp         0040A53F
 0040A504    mov         edx,esi
 0040A506    mov         eax,ebx
 0040A508    call        GetPreferredLangForOldOS
 0040A50D    call        kernel32.GetSystemDefaultUILanguage
 0040A512    cmp         bx,ax
>0040A515    je          0040A53F
 0040A517    cmp         dword ptr [esi],0
>0040A51A    je          0040A528
 0040A51C    mov         eax,esi
 0040A51E    mov         edx,40A5A0;','
 0040A523    call        @UStrCat
 0040A528    call        kernel32.GetSystemDefaultUILanguage
 0040A52D    lea         edx,[ebp-4]
 0040A530    call        GetPreferredLangForOldOS
 0040A535    mov         edx,dword ptr [ebp-4]
 0040A538    mov         eax,esi
 0040A53A    call        @UStrCat
 0040A53F    push        790B55
 0040A544    call        kernel32.EnterCriticalSection
 0040A549    mov         word ptr ds:[790B6E],bx
 0040A550    push        0AA
 0040A555    mov         eax,dword ptr [esi]
 0040A557    call        @UStrToPWChar
 0040A55C    push        eax
 0040A55D    push        790B70
 0040A562    call        kernel32.lstrcpynW
 0040A567    push        790B55
 0040A56C    call        kernel32.LeaveCriticalSection
 0040A571    xor         eax,eax
 0040A573    pop         edx
 0040A574    pop         ecx
 0040A575    pop         ecx
 0040A576    mov         dword ptr fs:[eax],edx
 0040A579    push        40A58E
 0040A57E    lea         eax,[ebp-4]
 0040A581    call        @UStrClr
 0040A586    ret
>0040A587    jmp         @HandleFinally
>0040A58C    jmp         0040A57E
 0040A58E    pop         esi
 0040A58F    pop         ebx
 0040A590    pop         ecx
 0040A591    pop         ebp
 0040A592    ret
*}
end;

//0040A5A4
function FindBS(Current:PWideChar):PWideChar;
begin
{*
 0040A5A4    push        ebx
 0040A5A5    push        esi
 0040A5A6    mov         ebx,eax
>0040A5A8    jmp         0040A5B2
 0040A5AA    push        ebx
 0040A5AB    call        user32.CharNextW
 0040A5B0    mov         ebx,eax
 0040A5B2    movzx       esi,word ptr [ebx]
 0040A5B5    test        si,si
>0040A5B8    je          0040A5C0
 0040A5BA    cmp         si,5C
>0040A5BE    jne         0040A5AA
 0040A5C0    mov         eax,ebx
 0040A5C2    pop         esi
 0040A5C3    pop         ebx
 0040A5C4    ret
*}
end;

//0040A5C8
function ToLongPath(AFileName:PWideChar; BufLen:Integer):PWideChar;
begin
{*
 0040A5C8    push        ebp
 0040A5C9    mov         ebp,esp
 0040A5CB    add         esp,0FFFFFB94
 0040A5D1    push        ebx
 0040A5D2    push        esi
 0040A5D3    push        edi
 0040A5D4    mov         dword ptr [ebp-8],edx
 0040A5D7    mov         dword ptr [ebp-4],eax
 0040A5DA    mov         eax,dword ptr [ebp-4]
 0040A5DD    mov         dword ptr [ebp-0C],eax
 0040A5E0    push        40A78C
 0040A5E5    call        kernel32.GetModuleHandleW
 0040A5EA    mov         esi,eax
 0040A5EC    test        esi,esi
>0040A5EE    je          0040A630
 0040A5F0    push        40A7A8
 0040A5F5    push        esi
 0040A5F6    call        kernel32.GetProcAddress
 0040A5FB    mov         ebx,eax
 0040A5FD    test        ebx,ebx
>0040A5FF    je          0040A630
 0040A601    push        105
 0040A606    lea         eax,[ebp-46A]
 0040A60C    push        eax
 0040A60D    mov         eax,dword ptr [ebp-4]
 0040A610    push        eax
 0040A611    call        ebx
 0040A613    test        eax,eax
>0040A615    je          0040A630
 0040A617    mov         eax,dword ptr [ebp-8]
 0040A61A    push        eax
 0040A61B    lea         eax,[ebp-46A]
 0040A621    push        eax
 0040A622    mov         eax,dword ptr [ebp-4]
 0040A625    push        eax
 0040A626    call        kernel32.lstrcpynW
>0040A62B    jmp         0040A782
 0040A630    mov         eax,dword ptr [ebp-4]
 0040A633    cmp         word ptr [eax],5C
>0040A637    jne         0040A674
 0040A639    mov         eax,dword ptr [ebp-4]
 0040A63C    cmp         word ptr [eax+2],5C
>0040A641    jne         0040A782
 0040A647    mov         eax,dword ptr [ebp-4]
 0040A64A    add         eax,4
 0040A64D    call        FindBS
 0040A652    mov         esi,eax
 0040A654    cmp         word ptr [esi],0
>0040A658    je          0040A782
 0040A65E    lea         eax,[esi+2]
 0040A661    call        FindBS
 0040A666    mov         esi,eax
 0040A668    cmp         word ptr [esi],0
>0040A66C    je          0040A782
>0040A672    jmp         0040A67A
 0040A674    mov         esi,dword ptr [ebp-4]
 0040A677    add         esi,4
 0040A67A    mov         ebx,esi
 0040A67C    sub         ebx,dword ptr [ebp-4]
 0040A67F    sar         ebx,1
>0040A681    jns         0040A686
 0040A683    adc         ebx,0
 0040A686    lea         eax,[ebx+1]
 0040A689    push        eax
 0040A68A    mov         eax,dword ptr [ebp-4]
 0040A68D    push        eax
 0040A68E    lea         eax,[ebp-46A]
 0040A694    push        eax
 0040A695    call        kernel32.lstrcpynW
>0040A69A    jmp         0040A764
 0040A69F    lea         eax,[esi+2]
 0040A6A2    call        FindBS
 0040A6A7    mov         edi,eax
 0040A6A9    mov         eax,edi
 0040A6AB    sub         eax,esi
 0040A6AD    sar         eax,1
>0040A6AF    jns         0040A6B4
 0040A6B1    adc         eax,0
 0040A6B4    add         eax,ebx
 0040A6B6    inc         eax
 0040A6B7    cmp         eax,105
>0040A6BC    jg          0040A782
 0040A6C2    mov         eax,edi
 0040A6C4    sub         eax,esi
 0040A6C6    sar         eax,1
>0040A6C8    jns         0040A6CD
 0040A6CA    adc         eax,0
 0040A6CD    inc         eax
 0040A6CE    push        eax
 0040A6CF    push        esi
 0040A6D0    lea         eax,[ebp-46A]
 0040A6D6    mov         edx,ebx
 0040A6D8    add         edx,edx
 0040A6DA    add         eax,edx
 0040A6DC    push        eax
 0040A6DD    call        kernel32.lstrcpynW
 0040A6E2    lea         eax,[ebp-260]
 0040A6E8    push        eax
 0040A6E9    lea         eax,[ebp-46A]
 0040A6EF    push        eax
 0040A6F0    call        kernel32.FindFirstFileW
 0040A6F5    mov         dword ptr [ebp-10],eax
 0040A6F8    cmp         dword ptr [ebp-10],0FFFFFFFF
>0040A6FC    je          0040A782
 0040A702    mov         eax,dword ptr [ebp-10]
 0040A705    push        eax
 0040A706    call        kernel32.FindClose
 0040A70B    lea         eax,[ebp-234]
 0040A711    push        eax
 0040A712    call        kernel32.lstrlenW
 0040A717    lea         edx,[ebx+1]
 0040A71A    add         eax,edx
 0040A71C    inc         eax
 0040A71D    cmp         eax,105
>0040A722    jg          0040A782
 0040A724    mov         word ptr [ebp+ebx*2-46A],5C
 0040A72E    mov         eax,105
 0040A733    sub         eax,ebx
 0040A735    dec         eax
 0040A736    push        eax
 0040A737    lea         eax,[ebp-234]
 0040A73D    push        eax
 0040A73E    lea         eax,[ebp-46A]
 0040A744    mov         edx,ebx
 0040A746    add         edx,edx
 0040A748    add         eax,edx
 0040A74A    add         eax,2
 0040A74D    push        eax
 0040A74E    call        kernel32.lstrcpynW
 0040A753    lea         eax,[ebp-234]
 0040A759    push        eax
 0040A75A    call        kernel32.lstrlenW
 0040A75F    inc         eax
 0040A760    add         ebx,eax
 0040A762    mov         esi,edi
 0040A764    cmp         word ptr [esi],0
>0040A768    jne         0040A69F
 0040A76E    mov         eax,dword ptr [ebp-8]
 0040A771    push        eax
 0040A772    lea         eax,[ebp-46A]
 0040A778    push        eax
 0040A779    mov         eax,dword ptr [ebp-4]
 0040A77C    push        eax
 0040A77D    call        kernel32.lstrcpynW
 0040A782    mov         eax,dword ptr [ebp-0C]
 0040A785    pop         edi
 0040A786    pop         esi
 0040A787    pop         ebx
 0040A788    mov         esp,ebp
 0040A78A    pop         ebp
 0040A78B    ret
*}
end;

//0040A7BC
function InternalGetLocaleOverride(AppName:AnsiString):string;
begin
{*
 0040A7BC    push        ebp
 0040A7BD    mov         ebp,esp
 0040A7BF    add         esp,0FFFFFDE4
 0040A7C5    push        ebx
 0040A7C6    mov         ebx,edx
 0040A7C8    mov         dword ptr [ebp-4],eax
 0040A7CB    mov         eax,dword ptr [ebp-4]
 0040A7CE    call        @UStrAddRef
 0040A7D3    xor         eax,eax
 0040A7D5    push        ebp
 0040A7D6    push        40A9E1
 0040A7DB    push        dword ptr fs:[eax]
 0040A7DE    mov         dword ptr fs:[eax],esp
 0040A7E1    cmp         dword ptr [ebp-4],0
>0040A7E5    jne         0040A7FC
 0040A7E7    push        105
 0040A7EC    lea         eax,[ebp-21A]
 0040A7F2    push        eax
 0040A7F3    push        0
 0040A7F5    call        kernel32.GetModuleFileNameW
>0040A7FA    jmp         0040A816
 0040A7FC    push        105
 0040A801    mov         eax,dword ptr [ebp-4]
 0040A804    call        @UStrToPWChar
 0040A809    push        eax
 0040A80A    lea         eax,[ebp-21A]
 0040A810    push        eax
 0040A811    call        kernel32.lstrcpynW
 0040A816    cmp         word ptr [ebp-21A],0
>0040A81E    je          0040A9CB
 0040A824    xor         eax,eax
 0040A826    mov         dword ptr [ebp-8],eax
 0040A829    lea         eax,[ebp-0C]
 0040A82C    push        eax
 0040A82D    push        0F0019
 0040A832    push        0
 0040A834    push        40A9F0
 0040A839    push        80000001
 0040A83E    call        advapi32.RegOpenKeyExW
 0040A843    test        eax,eax
>0040A845    je          0040A8E5
 0040A84B    lea         eax,[ebp-0C]
 0040A84E    push        eax
 0040A84F    push        0F0019
 0040A854    push        0
 0040A856    push        40A9F0
 0040A85B    push        80000002
 0040A860    call        advapi32.RegOpenKeyExW
 0040A865    test        eax,eax
>0040A867    je          0040A8E5
 0040A869    lea         eax,[ebp-0C]
 0040A86C    push        eax
 0040A86D    push        0F0019
 0040A872    push        0
 0040A874    push        40AA2C
 0040A879    push        80000001
 0040A87E    call        advapi32.RegOpenKeyExW
 0040A883    test        eax,eax
>0040A885    je          0040A8E5
 0040A887    lea         eax,[ebp-0C]
 0040A88A    push        eax
 0040A88B    push        0F0019
 0040A890    push        0
 0040A892    push        40AA2C
 0040A897    push        80000002
 0040A89C    call        advapi32.RegOpenKeyExW
 0040A8A1    test        eax,eax
>0040A8A3    je          0040A8E5
 0040A8A5    lea         eax,[ebp-0C]
 0040A8A8    push        eax
 0040A8A9    push        0F0019
 0040A8AE    push        0
 0040A8B0    push        40AA60
 0040A8B5    push        80000001
 0040A8BA    call        advapi32.RegOpenKeyExW
 0040A8BF    test        eax,eax
>0040A8C1    je          0040A8E5
 0040A8C3    lea         eax,[ebp-0C]
 0040A8C6    push        eax
 0040A8C7    push        0F0019
 0040A8CC    push        0
 0040A8CE    push        40AA94
 0040A8D3    push        80000001
 0040A8D8    call        advapi32.RegOpenKeyExW
 0040A8DD    test        eax,eax
>0040A8DF    jne         0040A9CB
 0040A8E5    xor         eax,eax
 0040A8E7    push        ebp
 0040A8E8    push        40A9C4
 0040A8ED    push        dword ptr fs:[eax]
 0040A8F0    mov         dword ptr fs:[eax],esp
 0040A8F3    lea         eax,[ebp-21A]
 0040A8F9    mov         edx,105
 0040A8FE    call        ToLongPath
 0040A903    lea         eax,[ebp-10]
 0040A906    push        eax
 0040A907    push        0
 0040A909    push        0
 0040A90B    push        0
 0040A90D    lea         eax,[ebp-21A]
 0040A913    push        eax
 0040A914    mov         eax,dword ptr [ebp-0C]
 0040A917    push        eax
 0040A918    call        advapi32.RegQueryValueExW
 0040A91D    test        eax,eax
>0040A91F    jne         0040A954
 0040A921    mov         eax,dword ptr [ebp-10]
 0040A924    call        @GetMem
 0040A929    mov         dword ptr [ebp-8],eax
 0040A92C    lea         eax,[ebp-10]
 0040A92F    push        eax
 0040A930    mov         eax,dword ptr [ebp-8]
 0040A933    push        eax
 0040A934    push        0
 0040A936    push        0
 0040A938    lea         eax,[ebp-21A]
 0040A93E    push        eax
 0040A93F    mov         eax,dword ptr [ebp-0C]
 0040A942    push        eax
 0040A943    call        advapi32.RegQueryValueExW
 0040A948    mov         eax,ebx
 0040A94A    mov         edx,dword ptr [ebp-8]
 0040A94D    call        @UStrFromPWChar
>0040A952    jmp         0040A99F
 0040A954    lea         eax,[ebp-10]
 0040A957    push        eax
 0040A958    push        0
 0040A95A    push        0
 0040A95C    push        0
 0040A95E    push        40AAD4
 0040A963    mov         eax,dword ptr [ebp-0C]
 0040A966    push        eax
 0040A967    call        advapi32.RegQueryValueExW
 0040A96C    test        eax,eax
>0040A96E    jne         0040A99F
 0040A970    mov         eax,dword ptr [ebp-10]
 0040A973    call        @GetMem
 0040A978    mov         dword ptr [ebp-8],eax
 0040A97B    lea         eax,[ebp-10]
 0040A97E    push        eax
 0040A97F    mov         eax,dword ptr [ebp-8]
 0040A982    push        eax
 0040A983    push        0
 0040A985    push        0
 0040A987    push        40AAD4
 0040A98C    mov         eax,dword ptr [ebp-0C]
 0040A98F    push        eax
 0040A990    call        advapi32.RegQueryValueExW
 0040A995    mov         eax,ebx
 0040A997    mov         edx,dword ptr [ebp-8]
 0040A99A    call        @UStrFromPWChar
 0040A99F    xor         eax,eax
 0040A9A1    pop         edx
 0040A9A2    pop         ecx
 0040A9A3    pop         ecx
 0040A9A4    mov         dword ptr fs:[eax],edx
 0040A9A7    push        40A9CB
 0040A9AC    cmp         dword ptr [ebp-8],0
>0040A9B0    je          0040A9BA
 0040A9B2    mov         eax,dword ptr [ebp-8]
 0040A9B5    call        @FreeMem
 0040A9BA    mov         eax,dword ptr [ebp-0C]
 0040A9BD    push        eax
 0040A9BE    call        advapi32.RegCloseKey
 0040A9C3    ret
>0040A9C4    jmp         @HandleFinally
>0040A9C9    jmp         0040A9AC
 0040A9CB    xor         eax,eax
 0040A9CD    pop         edx
 0040A9CE    pop         ecx
 0040A9CF    pop         ecx
 0040A9D0    mov         dword ptr fs:[eax],edx
 0040A9D3    push        40A9E8
 0040A9D8    lea         eax,[ebp-4]
 0040A9DB    call        @UStrClr
 0040A9E0    ret
>0040A9E1    jmp         @HandleFinally
>0040A9E6    jmp         0040A9D8
 0040A9E8    pop         ebx
 0040A9E9    mov         esp,ebp
 0040A9EB    pop         ebp
 0040A9EC    ret
*}
end;

//0040AAD8
function GetLocaleOverride(const AppName:AnsiString):string;
begin
{*
 0040AAD8    push        ebp
 0040AAD9    mov         ebp,esp
 0040AADB    push        0
 0040AADD    push        ebx
 0040AADE    push        esi
 0040AADF    mov         ebx,edx
 0040AAE1    mov         esi,eax
 0040AAE3    xor         eax,eax
 0040AAE5    push        ebp
 0040AAE6    push        40AB2F
 0040AAEB    push        dword ptr fs:[eax]
 0040AAEE    mov         dword ptr fs:[eax],esp
 0040AAF1    cmp         dword ptr ds:[784A18],0
>0040AAF8    jne         0040AB0C
 0040AAFA    lea         edx,[ebp-4]
 0040AAFD    mov         eax,esi
 0040AAFF    call        InternalGetLocaleOverride
 0040AB04    mov         eax,dword ptr [ebp-4]
 0040AB07    call        SetLocaleOverride
 0040AB0C    mov         eax,ebx
 0040AB0E    mov         edx,dword ptr ds:[784A18]
 0040AB14    call        @UStrFromPWChar
 0040AB19    xor         eax,eax
 0040AB1B    pop         edx
 0040AB1C    pop         ecx
 0040AB1D    pop         ecx
 0040AB1E    mov         dword ptr fs:[eax],edx
 0040AB21    push        40AB36
 0040AB26    lea         eax,[ebp-4]
 0040AB29    call        @UStrClr
 0040AB2E    ret
>0040AB2F    jmp         @HandleFinally
>0040AB34    jmp         0040AB26
 0040AB36    pop         esi
 0040AB37    pop         ebx
 0040AB38    pop         ecx
 0040AB39    pop         ebp
 0040AB3A    ret
*}
end;

//0040AB3C
procedure SetLocaleOverride(const NewPreferredLanguages:AnsiString);
begin
{*
 0040AB3C    push        ebx
 0040AB3D    push        esi
 0040AB3E    push        edi
 0040AB3F    mov         esi,eax
 0040AB41    cmp         dword ptr ds:[784A18],0
>0040AB48    je          0040AB54
 0040AB4A    mov         eax,[00784A18]
 0040AB4F    call        @FreeMem
 0040AB54    mov         eax,esi
 0040AB56    test        eax,eax
>0040AB58    je          0040AB5F
 0040AB5A    sub         eax,4
 0040AB5D    mov         eax,dword ptr [eax]
 0040AB5F    mov         ebx,eax
 0040AB61    test        ebx,ebx
>0040AB63    jle         0040AB8A
 0040AB65    inc         ebx
 0040AB66    mov         edi,ebx
 0040AB68    add         edi,edi
 0040AB6A    mov         eax,edi
 0040AB6C    call        @GetMem
 0040AB71    mov         [00784A18],eax
 0040AB76    mov         eax,esi
 0040AB78    call        @UStrToPWChar
 0040AB7D    mov         edx,dword ptr ds:[784A18]
 0040AB83    mov         ecx,edi
 0040AB85    call        Move
 0040AB8A    pop         edi
 0040AB8B    pop         esi
 0040AB8C    pop         ebx
 0040AB8D    ret
*}
end;

//0040AB90
function LoadModule(ModuleName:AnsiString; CheckOwner:Boolean):Cardinal;
begin
{*
 0040AB90    push        ebp
 0040AB91    mov         ebp,esp
 0040AB93    push        ecx
 0040AB94    push        ebx
 0040AB95    mov         dword ptr [ebp-4],eax
 0040AB98    mov         eax,dword ptr [ebp-4]
 0040AB9B    call        @UStrAddRef
 0040ABA0    xor         eax,eax
 0040ABA2    push        ebp
 0040ABA3    push        40ABD8
 0040ABA8    push        dword ptr fs:[eax]
 0040ABAB    mov         dword ptr fs:[eax],esp
 0040ABAE    push        2
 0040ABB0    push        0
 0040ABB2    mov         eax,dword ptr [ebp-4]
 0040ABB5    call        @UStrToPWChar
 0040ABBA    push        eax
 0040ABBB    call        kernel32.LoadLibraryExW
 0040ABC0    mov         ebx,eax
 0040ABC2    xor         eax,eax
 0040ABC4    pop         edx
 0040ABC5    pop         ecx
 0040ABC6    pop         ecx
 0040ABC7    mov         dword ptr fs:[eax],edx
 0040ABCA    push        40ABDF
 0040ABCF    lea         eax,[ebp-4]
 0040ABD2    call        @UStrClr
 0040ABD7    ret
>0040ABD8    jmp         @HandleFinally
>0040ABDD    jmp         0040ABCF
 0040ABDF    mov         eax,ebx
 0040ABE1    pop         ebx
 0040ABE2    pop         ecx
 0040ABE3    pop         ebp
 0040ABE4    ret
*}
end;

//0040ABE8
function ResouceDLLExists(S:AnsiString):Boolean;
begin
{*
 0040ABE8    push        ebp
 0040ABE9    mov         ebp,esp
 0040ABEB    add         esp,0FFFFFDAC
 0040ABF1    push        ebx
 0040ABF2    mov         dword ptr [ebp-4],eax
 0040ABF5    mov         eax,dword ptr [ebp-4]
 0040ABF8    call        @UStrAddRef
 0040ABFD    xor         eax,eax
 0040ABFF    push        ebp
 0040AC00    push        40AC46
 0040AC05    push        dword ptr fs:[eax]
 0040AC08    mov         dword ptr fs:[eax],esp
 0040AC0B    lea         eax,[ebp-254]
 0040AC11    push        eax
 0040AC12    mov         eax,dword ptr [ebp-4]
 0040AC15    call        @UStrToPWChar
 0040AC1A    push        eax
 0040AC1B    call        kernel32.FindFirstFileW
 0040AC20    cmp         eax,0FFFFFFFF
 0040AC23    setne       bl
 0040AC26    test        bl,bl
>0040AC28    je          0040AC30
 0040AC2A    push        eax
 0040AC2B    call        kernel32.FindClose
 0040AC30    xor         eax,eax
 0040AC32    pop         edx
 0040AC33    pop         ecx
 0040AC34    pop         ecx
 0040AC35    mov         dword ptr fs:[eax],edx
 0040AC38    push        40AC4D
 0040AC3D    lea         eax,[ebp-4]
 0040AC40    call        @UStrClr
 0040AC45    ret
>0040AC46    jmp         @HandleFinally
>0040AC4B    jmp         0040AC3D
 0040AC4D    mov         eax,ebx
 0040AC4F    pop         ebx
 0040AC50    mov         esp,ebp
 0040AC52    pop         ebp
 0040AC53    ret
*}
end;

//0040AC54
function LoadLanguageList(FileNameBody:AnsiString; List:AnsiString):string;
begin
{*
 0040AC54    push        ebp
 0040AC55    mov         ebp,esp
 0040AC57    add         esp,0FFFFFFF4
 0040AC5A    push        ebx
 0040AC5B    push        esi
 0040AC5C    push        edi
 0040AC5D    xor         ebx,ebx
 0040AC5F    mov         dword ptr [ebp-0C],ebx
 0040AC62    mov         edi,ecx
 0040AC64    mov         dword ptr [ebp-8],edx
 0040AC67    mov         dword ptr [ebp-4],eax
 0040AC6A    mov         eax,dword ptr [ebp-4]
 0040AC6D    call        @UStrAddRef
 0040AC72    mov         eax,dword ptr [ebp-8]
 0040AC75    call        @UStrAddRef
 0040AC7A    xor         eax,eax
 0040AC7C    push        ebp
 0040AC7D    push        40AD0F
 0040AC82    push        dword ptr fs:[eax]
 0040AC85    mov         dword ptr fs:[eax],esp
 0040AC88    mov         eax,edi
 0040AC8A    call        @UStrClr
 0040AC8F    mov         ebx,1
>0040AC94    jmp         0040ACE1
 0040AC96    mov         esi,ebx
>0040AC98    jmp         0040AC9B
 0040AC9A    inc         ebx
 0040AC9B    mov         eax,dword ptr [ebp-8]
 0040AC9E    call        @UStrLen
 0040ACA3    cmp         ebx,eax
>0040ACA5    jg          0040ACB2
 0040ACA7    mov         eax,dword ptr [ebp-8]
 0040ACAA    cmp         word ptr [eax+ebx*2-2],2C
>0040ACB0    jne         0040AC9A
 0040ACB2    cmp         ebx,esi
>0040ACB4    je          0040ACE0
 0040ACB6    lea         eax,[ebp-0C]
 0040ACB9    push        eax
 0040ACBA    mov         ecx,ebx
 0040ACBC    sub         ecx,esi
 0040ACBE    mov         edx,esi
 0040ACC0    mov         eax,dword ptr [ebp-8]
 0040ACC3    call        @UStrCopy
 0040ACC8    mov         ecx,dword ptr [ebp-0C]
 0040ACCB    mov         eax,edi
 0040ACCD    mov         edx,dword ptr [ebp-4]
 0040ACD0    call        @UStrCat3
 0040ACD5    mov         eax,dword ptr [edi]
 0040ACD7    call        ResouceDLLExists
 0040ACDC    test        al,al
>0040ACDE    jne         0040ACF4
 0040ACE0    inc         ebx
 0040ACE1    mov         eax,dword ptr [ebp-8]
 0040ACE4    call        @UStrLen
 0040ACE9    cmp         ebx,eax
>0040ACEB    jle         0040AC96
 0040ACED    mov         eax,edi
 0040ACEF    call        @UStrClr
 0040ACF4    xor         eax,eax
 0040ACF6    pop         edx
 0040ACF7    pop         ecx
 0040ACF8    pop         ecx
 0040ACF9    mov         dword ptr fs:[eax],edx
 0040ACFC    push        40AD16
 0040AD01    lea         eax,[ebp-0C]
 0040AD04    mov         edx,3
 0040AD09    call        @UStrArrayClr
 0040AD0E    ret
>0040AD0F    jmp         @HandleFinally
>0040AD14    jmp         0040AD01
 0040AD16    pop         edi
 0040AD17    pop         esi
 0040AD18    pop         ebx
 0040AD19    mov         esp,ebp
 0040AD1B    pop         ebp
 0040AD1C    ret
*}
end;

//0040AD20
function Load3LettersModule(FileNameBody:AnsiString):string;
begin
{*
 0040AD20    push        ebp
 0040AD21    mov         ebp,esp
 0040AD23    add         esp,0FFFFFFEC
 0040AD26    push        ebx
 0040AD27    xor         ecx,ecx
 0040AD29    mov         dword ptr [ebp-14],ecx
 0040AD2C    mov         dword ptr [ebp-10],ecx
 0040AD2F    mov         ebx,edx
 0040AD31    mov         dword ptr [ebp-4],eax
 0040AD34    mov         eax,dword ptr [ebp-4]
 0040AD37    call        @UStrAddRef
 0040AD3C    xor         eax,eax
 0040AD3E    push        ebp
 0040AD3F    push        40ADE0
 0040AD44    push        dword ptr fs:[eax]
 0040AD47    mov         dword ptr fs:[eax],esp
 0040AD4A    push        8
 0040AD4C    lea         eax,[ebp-0C]
 0040AD4F    push        eax
 0040AD50    push        3
 0040AD52    call        kernel32.GetUserDefaultUILanguage
 0040AD57    movzx       eax,ax
 0040AD5A    push        eax
 0040AD5B    call        kernel32.GetLocaleInfoW
 0040AD60    lea         eax,[ebp-10]
 0040AD63    lea         edx,[ebp-0C]
 0040AD66    mov         ecx,4
 0040AD6B    call        @UStrFromWArray
 0040AD70    mov         ecx,dword ptr [ebp-10]
 0040AD73    mov         eax,ebx
 0040AD75    mov         edx,dword ptr [ebp-4]
 0040AD78    call        @UStrCat3
 0040AD7D    mov         eax,dword ptr [ebx]
 0040AD7F    call        ResouceDLLExists
 0040AD84    test        al,al
>0040AD86    jne         0040ADBD
 0040AD88    mov         word ptr [ebp-8],0
 0040AD8E    lea         eax,[ebp-14]
 0040AD91    lea         edx,[ebp-0C]
 0040AD94    mov         ecx,4
 0040AD99    call        @UStrFromWArray
 0040AD9E    mov         ecx,dword ptr [ebp-14]
 0040ADA1    mov         eax,ebx
 0040ADA3    mov         edx,dword ptr [ebp-4]
 0040ADA6    call        @UStrCat3
 0040ADAB    mov         eax,dword ptr [ebx]
 0040ADAD    call        ResouceDLLExists
 0040ADB2    test        al,al
>0040ADB4    jne         0040ADBD
 0040ADB6    mov         eax,ebx
 0040ADB8    call        @UStrClr
 0040ADBD    xor         eax,eax
 0040ADBF    pop         edx
 0040ADC0    pop         ecx
 0040ADC1    pop         ecx
 0040ADC2    mov         dword ptr fs:[eax],edx
 0040ADC5    push        40ADE7
 0040ADCA    lea         eax,[ebp-14]
 0040ADCD    mov         edx,2
 0040ADD2    call        @UStrArrayClr
 0040ADD7    lea         eax,[ebp-4]
 0040ADDA    call        @UStrClr
 0040ADDF    ret
>0040ADE0    jmp         @HandleFinally
>0040ADE5    jmp         0040ADCA
 0040ADE7    pop         ebx
 0040ADE8    mov         esp,ebp
 0040ADEA    pop         ebp
 0040ADEB    ret
*}
end;

//0040ADEC
function GetResourceModuleName(HostAppName:AnsiString; ModuleName:AnsiString):string;
begin
{*
 0040ADEC    push        ebp
 0040ADED    mov         ebp,esp
 0040ADEF    push        0
 0040ADF1    push        0
 0040ADF3    push        0
 0040ADF5    push        0
 0040ADF7    push        0
 0040ADF9    push        0
 0040ADFB    push        ebx
 0040ADFC    push        esi
 0040ADFD    mov         esi,ecx
 0040ADFF    mov         dword ptr [ebp-8],edx
 0040AE02    mov         dword ptr [ebp-4],eax
 0040AE05    mov         eax,dword ptr [ebp-4]
 0040AE08    call        @UStrAddRef
 0040AE0D    mov         eax,dword ptr [ebp-8]
 0040AE10    call        @UStrAddRef
 0040AE15    xor         eax,eax
 0040AE17    push        ebp
 0040AE18    push        40AEF9
 0040AE1D    push        dword ptr fs:[eax]
 0040AE20    mov         dword ptr fs:[eax],esp
 0040AE23    mov         eax,esi
 0040AE25    call        @UStrClr
 0040AE2A    lea         eax,[ebp-10]
 0040AE2D    mov         edx,dword ptr [ebp-8]
 0040AE30    call        @UStrLAsg
 0040AE35    mov         eax,dword ptr [ebp-8]
 0040AE38    test        eax,eax
>0040AE3A    je          0040AE41
 0040AE3C    sub         eax,4
 0040AE3F    mov         eax,dword ptr [eax]
 0040AE41    mov         ebx,eax
 0040AE43    cmp         ebx,1
>0040AE46    jl          0040AE6D
 0040AE48    mov         eax,dword ptr [ebp-8]
 0040AE4B    cmp         word ptr [eax+ebx*2-2],2E
>0040AE51    jne         0040AE68
 0040AE53    lea         eax,[ebp-10]
 0040AE56    push        eax
 0040AE57    mov         ecx,ebx
 0040AE59    mov         edx,1
 0040AE5E    mov         eax,dword ptr [ebp-8]
 0040AE61    call        @UStrCopy
>0040AE66    jmp         0040AE6D
 0040AE68    dec         ebx
 0040AE69    test        ebx,ebx
>0040AE6B    jne         0040AE48
 0040AE6D    lea         edx,[ebp-0C]
 0040AE70    mov         eax,dword ptr [ebp-4]
 0040AE73    call        GetLocaleOverride
 0040AE78    cmp         dword ptr [ebp-0C],0
>0040AE7C    je          0040AE8D
 0040AE7E    mov         ecx,esi
 0040AE80    mov         edx,dword ptr [ebp-0C]
 0040AE83    mov         eax,dword ptr [ebp-10]
 0040AE86    call        LoadLanguageList
>0040AE8B    jmp         0040AEDE
 0040AE8D    call        kernel32.GetUserDefaultUILanguage
 0040AE92    lea         edx,[ebp-14]
 0040AE95    call        GetUILanguages
 0040AE9A    mov         edx,dword ptr [ebp-14]
 0040AE9D    mov         ecx,esi
 0040AE9F    mov         eax,dword ptr [ebp-10]
 0040AEA2    call        LoadLanguageList
 0040AEA7    cmp         dword ptr [esi],0
>0040AEAA    jne         0040AECF
 0040AEAC    cmp         byte ptr ds:[790B54],0
>0040AEB3    jne         0040AECF
 0040AEB5    call        kernel32.GetSystemDefaultUILanguage
 0040AEBA    lea         edx,[ebp-18]
 0040AEBD    call        GetUILanguages
 0040AEC2    mov         edx,dword ptr [ebp-18]
 0040AEC5    mov         ecx,esi
 0040AEC7    mov         eax,dword ptr [ebp-10]
 0040AECA    call        LoadLanguageList
 0040AECF    cmp         dword ptr [esi],0
>0040AED2    jne         0040AEDE
 0040AED4    mov         edx,esi
 0040AED6    mov         eax,dword ptr [ebp-10]
 0040AED9    call        Load3LettersModule
 0040AEDE    xor         eax,eax
 0040AEE0    pop         edx
 0040AEE1    pop         ecx
 0040AEE2    pop         ecx
 0040AEE3    mov         dword ptr fs:[eax],edx
 0040AEE6    push        40AF00
 0040AEEB    lea         eax,[ebp-18]
 0040AEEE    mov         edx,6
 0040AEF3    call        @UStrArrayClr
 0040AEF8    ret
>0040AEF9    jmp         @HandleFinally
>0040AEFE    jmp         0040AEEB
 0040AF00    pop         esi
 0040AF01    pop         ebx
 0040AF02    mov         esp,ebp
 0040AF04    pop         ebp
 0040AF05    ret
*}
end;

//0040AF08
function LoadResourceModule(ModuleName:PWideChar; CheckOwner:Boolean):Cardinal;
begin
{*
 0040AF08    push        ebp
 0040AF09    mov         ebp,esp
 0040AF0B    add         esp,0FFFFFDE8
 0040AF11    push        ebx
 0040AF12    push        esi
 0040AF13    push        edi
 0040AF14    xor         ecx,ecx
 0040AF16    mov         dword ptr [ebp-214],ecx
 0040AF1C    mov         dword ptr [ebp-218],ecx
 0040AF22    mov         dword ptr [ebp-4],ecx
 0040AF25    mov         ebx,edx
 0040AF27    mov         esi,eax
 0040AF29    xor         eax,eax
 0040AF2B    push        ebp
 0040AF2C    push        40AFBD
 0040AF31    push        dword ptr fs:[eax]
 0040AF34    mov         dword ptr fs:[eax],esp
 0040AF37    xor         edi,edi
 0040AF39    push        105
 0040AF3E    lea         eax,[ebp-20E]
 0040AF44    push        eax
 0040AF45    push        0
 0040AF47    call        kernel32.GetModuleFileNameW
 0040AF4C    lea         eax,[ebp-214]
 0040AF52    mov         edx,esi
 0040AF54    call        @UStrFromPWChar
 0040AF59    mov         eax,dword ptr [ebp-214]
 0040AF5F    push        eax
 0040AF60    lea         eax,[ebp-218]
 0040AF66    lea         edx,[ebp-20E]
 0040AF6C    mov         ecx,105
 0040AF71    call        @UStrFromWArray
 0040AF76    mov         eax,dword ptr [ebp-218]
 0040AF7C    lea         ecx,[ebp-4]
 0040AF7F    pop         edx
 0040AF80    call        GetResourceModuleName
 0040AF85    cmp         dword ptr [ebp-4],0
>0040AF89    je          0040AF97
 0040AF8B    mov         edx,ebx
 0040AF8D    mov         eax,dword ptr [ebp-4]
 0040AF90    call        LoadModule
 0040AF95    mov         edi,eax
 0040AF97    xor         eax,eax
 0040AF99    pop         edx
 0040AF9A    pop         ecx
 0040AF9B    pop         ecx
 0040AF9C    mov         dword ptr fs:[eax],edx
 0040AF9F    push        40AFC4
 0040AFA4    lea         eax,[ebp-218]
 0040AFAA    mov         edx,2
 0040AFAF    call        @UStrArrayClr
 0040AFB4    lea         eax,[ebp-4]
 0040AFB7    call        @UStrClr
 0040AFBC    ret
>0040AFBD    jmp         @HandleFinally
>0040AFC2    jmp         0040AFA4
 0040AFC4    mov         eax,edi
 0040AFC6    pop         edi
 0040AFC7    pop         esi
 0040AFC8    pop         ebx
 0040AFC9    mov         esp,ebp
 0040AFCB    pop         ebp
 0040AFCC    ret
*}
end;

//0040AFD0
procedure EnumResourceModules(Func:TEnumModuleFunc; Data:Pointer);
begin
{*
 0040AFD0    call        EnumResourceModules
 0040AFD5    ret
*}
end;

//0040AFD8
procedure EnumResourceModules(Func:TEnumModuleFuncLW; Data:Pointer);
begin
{*
 0040AFD8    push        ebx
 0040AFD9    push        esi
 0040AFDA    push        edi
 0040AFDB    mov         edi,edx
 0040AFDD    mov         esi,eax
 0040AFDF    mov         ebx,dword ptr ds:[784034];gvar_00784034
 0040AFE5    test        ebx,ebx
>0040AFE7    je          0040AFFE
 0040AFE9    mov         eax,ebx
 0040AFEB    call        DelayLoadResourceModule
 0040AFF0    mov         edx,edi
 0040AFF2    call        esi
 0040AFF4    test        al,al
>0040AFF6    je          0040AFFE
 0040AFF8    mov         ebx,dword ptr [ebx]
 0040AFFA    test        ebx,ebx
>0040AFFC    jne         0040AFE9
 0040AFFE    pop         edi
 0040AFFF    pop         esi
 0040B000    pop         ebx
 0040B001    ret
*}
end;

//0040B004
procedure AddModuleUnloadProc(Proc:TModuleUnloadProc);
begin
{*
 0040B004    call        AddModuleUnloadProc
 0040B009    ret
*}
end;

//0040B00C
procedure RemoveModuleUnloadProc(Proc:TModuleUnloadProcLW);
begin
{*
 0040B00C    call        0040B034
 0040B011    ret
*}
end;

//0040B014
procedure AddModuleUnloadProc(Proc:TModuleUnloadProcLW);
begin
{*
 0040B014    push        ebx
 0040B015    mov         ebx,eax
 0040B017    mov         eax,8
 0040B01C    call        @GetMem
 0040B021    mov         edx,dword ptr ds:[784038];gvar_00784038
 0040B027    mov         dword ptr [eax],edx
 0040B029    mov         dword ptr [eax+4],ebx
 0040B02C    mov         [00784038],eax;gvar_00784038
 0040B031    pop         ebx
 0040B032    ret
*}
end;

//0040B034
{*procedure sub_0040B034(?:?);
begin
 0040B034    push        ebx
 0040B035    push        esi
 0040B036    push        edi
 0040B037    push        ebp
 0040B038    mov         ebp,eax
 0040B03A    mov         edi,dword ptr ds:[784038];0x0 gvar_00784038
 0040B040    test        edi,edi
>0040B042    je          0040B065
 0040B044    mov         eax,dword ptr [edi+4]
 0040B047    cmp         eax,ebp
>0040B049    jne         0040B065
 0040B04B    mov         eax,[00784038];0x0 gvar_00784038
 0040B050    mov         eax,dword ptr [eax]
 0040B052    mov         [00784038],eax;gvar_00784038
 0040B057    mov         edx,8
 0040B05C    mov         eax,edi
 0040B05E    call        @FreeMem
>0040B063    jmp         0040B092
 0040B065    mov         ebx,edi
 0040B067    test        ebx,ebx
>0040B069    je          0040B092
 0040B06B    mov         esi,dword ptr [ebx]
 0040B06D    test        esi,esi
>0040B06F    je          0040B08C
 0040B071    mov         eax,dword ptr [esi+4]
 0040B074    cmp         eax,ebp
>0040B076    jne         0040B08C
 0040B078    mov         edi,esi
 0040B07A    mov         eax,dword ptr [esi]
 0040B07C    mov         dword ptr [ebx],eax
 0040B07E    mov         edx,8
 0040B083    mov         eax,edi
 0040B085    call        @FreeMem
>0040B08A    jmp         0040B092
 0040B08C    mov         ebx,dword ptr [ebx]
 0040B08E    test        ebx,ebx
>0040B090    jne         0040B06B
 0040B092    pop         ebp
 0040B093    pop         edi
 0040B094    pop         esi
 0040B095    pop         ebx
 0040B096    ret
end;*}

//0040B098
procedure NotifyModuleUnload(HInstance:Cardinal);
begin
{*
 0040B098    push        ebp
 0040B099    mov         ebp,esp
 0040B09B    add         esp,0FFFFFFF8
 0040B09E    push        ebx
 0040B09F    push        esi
 0040B0A0    push        edi
 0040B0A1    mov         dword ptr [ebp-4],eax
 0040B0A4    mov         eax,[00784038];gvar_00784038
 0040B0A9    mov         dword ptr [ebp-8],eax
 0040B0AC    cmp         dword ptr [ebp-8],0
>0040B0B0    je          0040B0EB
 0040B0B2    xor         eax,eax
 0040B0B4    push        ebp
 0040B0B5    push        40B0D3
 0040B0BA    push        dword ptr fs:[eax]
 0040B0BD    mov         dword ptr fs:[eax],esp
 0040B0C0    mov         ebx,dword ptr [ebp-8]
 0040B0C3    mov         eax,dword ptr [ebp-4]
 0040B0C6    call        dword ptr [ebx+4]
 0040B0C9    xor         eax,eax
 0040B0CB    pop         edx
 0040B0CC    pop         ecx
 0040B0CD    pop         ecx
 0040B0CE    mov         dword ptr fs:[eax],edx
>0040B0D1    jmp         0040B0DD
>0040B0D3    jmp         @HandleAnyException
 0040B0D8    call        @DoneExcept
 0040B0DD    mov         eax,dword ptr [ebp-8]
 0040B0E0    mov         eax,dword ptr [eax]
 0040B0E2    mov         dword ptr [ebp-8],eax
 0040B0E5    cmp         dword ptr [ebp-8],0
>0040B0E9    jne         0040B0B2
 0040B0EB    pop         edi
 0040B0EC    pop         esi
 0040B0ED    pop         ebx
 0040B0EE    pop         ecx
 0040B0EF    pop         ecx
 0040B0F0    pop         ebp
 0040B0F1    ret
*}
end;

//0040B0F4
procedure RegisterModule(LibModule:PLibModule);
begin
{*
 0040B0F4    mov         edx,dword ptr ds:[784034];gvar_00784034
 0040B0FA    mov         dword ptr [eax],edx
 0040B0FC    mov         [00784034],eax;gvar_00784034
 0040B101    ret
*}
end;

//0040B104
procedure UnregisterModule(LibModule:PLibModule);
begin
{*
 0040B104    push        ebp
 0040B105    mov         ebp,esp
 0040B107    push        ecx
 0040B108    mov         dword ptr [ebp-4],eax
 0040B10B    xor         edx,edx
 0040B10D    push        ebp
 0040B10E    push        40B168
 0040B113    push        dword ptr fs:[edx]
 0040B116    mov         dword ptr fs:[edx],esp
 0040B119    mov         eax,dword ptr [ebp-4]
 0040B11C    mov         eax,dword ptr [eax+4]
 0040B11F    call        NotifyModuleUnload
 0040B124    xor         eax,eax
 0040B126    pop         edx
 0040B127    pop         ecx
 0040B128    pop         ecx
 0040B129    mov         dword ptr fs:[eax],edx
 0040B12C    push        40B16F
 0040B131    mov         eax,dword ptr [ebp-4]
 0040B134    cmp         eax,dword ptr ds:[784034];gvar_00784034
>0040B13A    jne         0040B148
 0040B13C    mov         eax,dword ptr [ebp-4]
 0040B13F    mov         eax,dword ptr [eax]
 0040B141    mov         [00784034],eax;gvar_00784034
>0040B146    jmp         0040B167
 0040B148    mov         eax,[00784034];gvar_00784034
 0040B14D    test        eax,eax
>0040B14F    je          0040B167
 0040B151    mov         edx,dword ptr [eax]
 0040B153    cmp         edx,dword ptr [ebp-4]
>0040B156    jne         0040B161
 0040B158    mov         edx,dword ptr [ebp-4]
 0040B15B    mov         edx,dword ptr [edx]
 0040B15D    mov         dword ptr [eax],edx
>0040B15F    jmp         0040B167
 0040B161    mov         eax,dword ptr [eax]
 0040B163    test        eax,eax
>0040B165    jne         0040B151
 0040B167    ret
>0040B168    jmp         @HandleFinally
>0040B16D    jmp         0040B131
 0040B16F    pop         ecx
 0040B170    pop         ebp
 0040B171    ret
*}
end;

//0040B174
function @IntfClear(var Dest:IInterface):Pointer;
begin
{*
 0040B174    mov         edx,dword ptr [eax]
 0040B176    test        edx,edx
>0040B178    je          0040B188
 0040B17A    mov         dword ptr [eax],0
 0040B180    push        eax
 0040B181    push        edx
 0040B182    mov         eax,dword ptr [edx]
 0040B184    call        dword ptr [eax+8]
 0040B187    pop         eax
 0040B188    ret
*}
end;

//0040B18C
procedure @IntfCopy(var Dest:IInterface; const Source:IInterface);
begin
{*
 0040B18C    test        edx,edx
>0040B18E    je          0040B1A9
 0040B190    push        edx
 0040B191    push        eax
 0040B192    mov         eax,dword ptr [edx]
 0040B194    push        edx
 0040B195    call        dword ptr [eax+4]
 0040B198    pop         eax
 0040B199    mov         ecx,dword ptr [eax]
 0040B19B    pop         dword ptr [eax]
 0040B19D    test        ecx,ecx
>0040B19F    jne         0040B1A2
 0040B1A1    ret
 0040B1A2    mov         eax,dword ptr [ecx]
 0040B1A4    push        ecx
 0040B1A5    call        dword ptr [eax+8]
 0040B1A8    ret
 0040B1A9    mov         ecx,dword ptr [eax]
 0040B1AB    test        ecx,ecx
 0040B1AD    mov         dword ptr [eax],edx
>0040B1AF    je          0040B1B7
 0040B1B1    mov         eax,dword ptr [ecx]
 0040B1B3    push        ecx
 0040B1B4    call        dword ptr [eax+8]
 0040B1B7    ret
*}
end;

//0040B1B8
procedure @IntfCast(var Dest:IInterface; const Source:IInterface; const IID:TGUID);
begin
{*
 0040B1B8    test        edx,edx
>0040B1BA    je          0040B174
 0040B1C0    push        edi
 0040B1C1    mov         edi,eax
 0040B1C3    push        0
 0040B1C5    push        esp
 0040B1C6    push        ecx
 0040B1C7    push        edx
 0040B1C8    mov         eax,dword ptr [edx]
 0040B1CA    call        dword ptr [eax]
 0040B1CC    test        eax,eax
>0040B1CE    je          0040B1D7
 0040B1D0    mov         al,17
>0040B1D2    jmp         Error
 0040B1D7    mov         eax,dword ptr [edi]
 0040B1D9    test        eax,eax
>0040B1DB    je          0040B1E3
 0040B1DD    push        eax
 0040B1DE    mov         eax,dword ptr [eax]
 0040B1E0    call        dword ptr [eax+8]
 0040B1E3    pop         eax
 0040B1E4    mov         dword ptr [edi],eax
 0040B1E6    pop         edi
 0040B1E7    ret
*}
end;

//0040B1E8
procedure @IntfAddRef(const Dest:IInterface);
begin
{*
 0040B1E8    test        eax,eax
>0040B1EA    je          0040B1F2
 0040B1EC    push        eax
 0040B1ED    mov         eax,dword ptr [eax]
 0040B1EF    call        dword ptr [eax+4]
 0040B1F2    ret
*}
end;

//0040B1F4
procedure TInterfacedObject.AfterConstruction;
begin
{*
 0040B1F4    add         eax,4
 0040B1F7    call        InterlockedDecrement
 0040B1FC    ret
*}
end;

//0040B200
procedure TInterfacedObject.BeforeDestruction;
begin
{*
 0040B200    cmp         dword ptr [eax+4],0
>0040B204    je          0040B20D
 0040B206    mov         al,2
 0040B208    call        Error
 0040B20D    ret
*}
end;

//0040B210
function TInterfacedObject.NewInstance:TObject;
begin
{*
 0040B210    call        TObject.NewInstance
 0040B215    mov         dword ptr [eax+4],1
 0040B21C    ret
*}
end;

//0040B220
function TContainedObject.QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;
begin
{*
 0040B220    push        ebp
 0040B221    mov         ebp,esp
 0040B223    push        ebx
 0040B224    mov         ebx,dword ptr [ebp+8]
 0040B227    mov         ecx,dword ptr [ebp+10]
 0040B22A    mov         edx,dword ptr [ebp+0C]
 0040B22D    mov         eax,ebx
 0040B22F    call        TObject.GetInterface
 0040B234    test        al,al
>0040B236    je          0040B23C
 0040B238    xor         eax,eax
>0040B23A    jmp         0040B241
 0040B23C    mov         eax,80004002
 0040B241    pop         ebx
 0040B242    pop         ebp
 0040B243    ret         0C
*}
end;

//0040B248
function TInterfacedObject._AddRef:Integer; stdcall;
begin
{*
 0040B248    push        ebp
 0040B249    mov         ebp,esp
 0040B24B    mov         eax,dword ptr [ebp+8]
 0040B24E    add         eax,4
 0040B251    call        InterlockedIncrement
 0040B256    pop         ebp
 0040B257    ret         4
*}
end;

//0040B25C
function TInterfacedObject._Release:Integer; stdcall;
begin
{*
 0040B25C    push        ebp
 0040B25D    mov         ebp,esp
 0040B25F    push        ebx
 0040B260    push        esi
 0040B261    mov         ebx,dword ptr [ebp+8]
 0040B264    lea         eax,[ebx+4]
 0040B267    call        InterlockedDecrement
 0040B26C    mov         esi,eax
 0040B26E    test        esi,esi
>0040B270    jne         0040B27B
 0040B272    mov         dl,1
 0040B274    mov         eax,ebx
 0040B276    mov         ecx,dword ptr [eax]
 0040B278    call        dword ptr [ecx-4]
 0040B27B    mov         eax,esi
 0040B27D    pop         esi
 0040B27E    pop         ebx
 0040B27F    pop         ebp
 0040B280    ret         4
*}
end;

//0040B284
function @CheckAutoResult(ResultCode:HRESULT):HRESULT;
begin
{*
 0040B284    push        ebp
 0040B285    mov         ebp,esp
 0040B287    add         esp,0FFFFFFF4
 0040B28A    mov         dword ptr [ebp-4],eax
 0040B28D    cmp         dword ptr [ebp-4],0
>0040B291    jge         0040B2C0
 0040B293    lea         eax,[ebp-4]
 0040B296    add         eax,4
 0040B299    add         eax,4
 0040B29C    mov         eax,dword ptr [eax]
 0040B29E    mov         dword ptr [ebp-0C],eax
 0040B2A1    cmp         dword ptr ds:[78E028],0
>0040B2A8    je          0040B2B6
 0040B2AA    mov         edx,dword ptr [ebp-0C]
 0040B2AD    mov         eax,dword ptr [ebp-4]
 0040B2B0    call        dword ptr ds:[78E028]
 0040B2B6    mov         edx,dword ptr [ebp-0C]
 0040B2B9    mov         al,18
 0040B2BB    call        ErrorAt
 0040B2C0    mov         eax,dword ptr [ebp-4]
 0040B2C3    mov         dword ptr [ebp-8],eax
 0040B2C6    mov         eax,dword ptr [ebp-8]
 0040B2C9    mov         esp,ebp
 0040B2CB    pop         ebp
 0040B2CC    ret
*}
end;

//0040B2D0
function UnicodeToUtf8(Dest:PAnsiChar; MaxDestBytes:Cardinal; Source:PWideChar; SourceChars:Cardinal):Cardinal;
begin
{*
 0040B2D0    push        ebp
 0040B2D1    mov         ebp,esp
 0040B2D3    push        ecx
 0040B2D4    push        ebx
 0040B2D5    push        esi
 0040B2D6    mov         esi,ecx
 0040B2D8    mov         dword ptr [ebp-4],edx
 0040B2DB    mov         ebx,eax
 0040B2DD    xor         eax,eax
 0040B2DF    test        esi,esi
>0040B2E1    je          0040B346
 0040B2E3    test        ebx,ebx
>0040B2E5    je          0040B32C
 0040B2E7    mov         eax,dword ptr [ebp+8]
 0040B2EA    push        eax
 0040B2EB    push        ebx
 0040B2EC    mov         eax,dword ptr [ebp-4]
 0040B2EF    push        eax
 0040B2F0    push        0
 0040B2F2    push        0
 0040B2F4    mov         ecx,esi
 0040B2F6    xor         edx,edx
 0040B2F8    mov         eax,0FDE9
 0040B2FD    call        LocaleCharsFromUnicode
 0040B302    cmp         eax,dword ptr [ebp-4]
>0040B305    jne         0040B346
>0040B307    jmp         0040B30A
 0040B309    dec         eax
 0040B30A    cmp         eax,1
>0040B30D    jbe         0040B346
 0040B30F    cmp         byte ptr [ebx+eax-1],7F
>0040B314    jbe         0040B346
 0040B316    test        byte ptr [ebx+eax-1],80
>0040B31B    je          0040B346
 0040B31D    movzx       edx,byte ptr [ebx+eax-1]
 0040B322    and         dl,0C0
 0040B325    cmp         dl,0C0
>0040B328    jne         0040B309
>0040B32A    jmp         0040B346
 0040B32C    mov         eax,dword ptr [ebp+8]
 0040B32F    push        eax
 0040B330    push        0
 0040B332    push        0
 0040B334    push        0
 0040B336    push        0
 0040B338    mov         ecx,esi
 0040B33A    xor         edx,edx
 0040B33C    mov         eax,0FDE9
 0040B341    call        LocaleCharsFromUnicode
 0040B346    pop         esi
 0040B347    pop         ebx
 0040B348    pop         ecx
 0040B349    pop         ebp
 0040B34A    ret         4
*}
end;

//0040B350
function Utf8ToUnicode(Dest:PWideChar; MaxDestChars:Cardinal; Source:PAnsiChar; SourceBytes:Cardinal):Cardinal;
begin
{*
 0040B350    push        ebp
 0040B351    mov         ebp,esp
 0040B353    push        ecx
 0040B354    push        ebx
 0040B355    push        esi
 0040B356    mov         dword ptr [ebp-4],ecx
 0040B359    mov         esi,edx
 0040B35B    mov         ebx,eax
 0040B35D    xor         eax,eax
 0040B35F    cmp         dword ptr [ebp-4],0
>0040B363    je          0040B3B7
 0040B365    test        ebx,ebx
>0040B367    je          0040B3A0
 0040B369    test        esi,esi
>0040B36B    jbe         0040B3A0
 0040B36D    mov         eax,dword ptr [ebp+8]
 0040B370    push        eax
 0040B371    push        ebx
 0040B372    push        esi
 0040B373    mov         ecx,dword ptr [ebp-4]
 0040B376    xor         edx,edx
 0040B378    mov         eax,0FDE9
 0040B37D    call        UnicodeFromLocaleChars
 0040B382    cmp         esi,eax
>0040B384    jne         0040B3B7
 0040B386    cmp         eax,1
>0040B389    jbe         0040B3B7
 0040B38B    cmp         word ptr [ebx+eax*2-2],0DC00
>0040B392    jb          0040B3B7
 0040B394    cmp         word ptr [ebx+eax*2-2],0DFFF
>0040B39B    ja          0040B3B7
 0040B39D    dec         eax
>0040B39E    jmp         0040B3B7
 0040B3A0    mov         eax,dword ptr [ebp+8]
 0040B3A3    push        eax
 0040B3A4    push        0
 0040B3A6    push        0
 0040B3A8    mov         ecx,dword ptr [ebp-4]
 0040B3AB    xor         edx,edx
 0040B3AD    mov         eax,0FDE9
 0040B3B2    call        UnicodeFromLocaleChars
 0040B3B7    pop         esi
 0040B3B8    pop         ebx
 0040B3B9    pop         ecx
 0040B3BA    pop         ebp
 0040B3BB    ret         4
*}
end;

//0040B3C0
function UTF8Encode(const WS:WideString):RawByteString;
begin
{*
 0040B3C0    push        ebp
 0040B3C1    mov         ebp,esp
 0040B3C3    add         esp,0FFFFFFF4
 0040B3C6    push        ebx
 0040B3C7    push        esi
 0040B3C8    xor         ecx,ecx
 0040B3CA    mov         dword ptr [ebp-4],ecx
 0040B3CD    mov         dword ptr [ebp-0C],edx
 0040B3D0    mov         dword ptr [ebp-8],eax
 0040B3D3    xor         eax,eax
 0040B3D5    push        ebp
 0040B3D6    push        40B495
 0040B3DB    push        dword ptr fs:[eax]
 0040B3DE    mov         dword ptr fs:[eax],esp
 0040B3E1    mov         eax,dword ptr [ebp-0C]
 0040B3E4    call        @LStrClr
 0040B3E9    mov         eax,dword ptr [ebp-8]
 0040B3EC    xor         edx,edx
 0040B3EE    call        @WStrEqual
>0040B3F3    je          0040B47F
 0040B3F9    mov         eax,dword ptr [ebp-8]
 0040B3FC    test        eax,eax
>0040B3FE    je          0040B407
 0040B400    sub         eax,4
 0040B403    mov         eax,dword ptr [eax]
 0040B405    shr         eax,1
 0040B407    mov         ebx,eax
 0040B409    lea         edx,[ebx+ebx*2]
 0040B40C    lea         eax,[ebp-4]
 0040B40F    mov         ecx,0FDE9
 0040B414    call        @LStrSetLength
 0040B419    mov         esi,dword ptr [ebp-4]
 0040B41C    test        esi,esi
>0040B41E    je          0040B425
 0040B420    sub         esi,4
 0040B423    mov         esi,dword ptr [esi]
 0040B425    push        ebx
 0040B426    mov         eax,dword ptr [ebp-8]
 0040B429    call        @WStrToPWChar
 0040B42E    push        eax
 0040B42F    mov         eax,dword ptr [ebp-4]
 0040B432    call        @LStrToPChar
 0040B437    lea         edx,[esi+1]
 0040B43A    pop         ecx
 0040B43B    call        UnicodeToUtf8
 0040B440    mov         ebx,eax
 0040B442    test        ebx,ebx
>0040B444    jle         0040B457
 0040B446    lea         eax,[ebp-4]
 0040B449    mov         ecx,0FDE9
 0040B44E    mov         edx,ebx
 0040B450    call        @LStrSetLength
>0040B455    jmp         0040B45F
 0040B457    lea         eax,[ebp-4]
 0040B45A    call        @LStrClr
 0040B45F    mov         eax,dword ptr [ebp-0C]
 0040B462    mov         edx,dword ptr [ebp-4]
 0040B465    call        @LStrAsg
 0040B46A    mov         eax,dword ptr [ebp-0C]
 0040B46D    cmp         dword ptr [eax],0
>0040B470    je          0040B47F
 0040B472    mov         eax,dword ptr [ebp-0C]
 0040B475    mov         eax,dword ptr [eax]
 0040B477    sub         eax,0C
 0040B47A    mov         word ptr [eax],0FDE9
 0040B47F    xor         eax,eax
 0040B481    pop         edx
 0040B482    pop         ecx
 0040B483    pop         ecx
 0040B484    mov         dword ptr fs:[eax],edx
 0040B487    push        40B49C
 0040B48C    lea         eax,[ebp-4]
 0040B48F    call        @LStrClr
 0040B494    ret
>0040B495    jmp         @HandleFinally
>0040B49A    jmp         0040B48C
 0040B49C    pop         esi
 0040B49D    pop         ebx
 0040B49E    mov         esp,ebp
 0040B4A0    pop         ebp
 0040B4A1    ret
*}
end;

//0040B4A4
function UTF8Encode(const US:AnsiString):RawByteString;
begin
{*
 0040B4A4    push        ebp
 0040B4A5    mov         ebp,esp
 0040B4A7    add         esp,0FFFFFFF4
 0040B4AA    push        ebx
 0040B4AB    push        esi
 0040B4AC    xor         ecx,ecx
 0040B4AE    mov         dword ptr [ebp-4],ecx
 0040B4B1    mov         dword ptr [ebp-0C],edx
 0040B4B4    mov         dword ptr [ebp-8],eax
 0040B4B7    xor         eax,eax
 0040B4B9    push        ebp
 0040B4BA    push        40B571
 0040B4BF    push        dword ptr fs:[eax]
 0040B4C2    mov         dword ptr fs:[eax],esp
 0040B4C5    mov         eax,dword ptr [ebp-0C]
 0040B4C8    call        @LStrClr
 0040B4CD    cmp         dword ptr [ebp-8],0
>0040B4D1    je          0040B55B
 0040B4D7    mov         eax,dword ptr [ebp-8]
 0040B4DA    test        eax,eax
>0040B4DC    je          0040B4E3
 0040B4DE    sub         eax,4
 0040B4E1    mov         eax,dword ptr [eax]
 0040B4E3    mov         ebx,eax
 0040B4E5    lea         edx,[ebx+ebx*2]
 0040B4E8    lea         eax,[ebp-4]
 0040B4EB    mov         ecx,0FDE9
 0040B4F0    call        @LStrSetLength
 0040B4F5    mov         esi,dword ptr [ebp-4]
 0040B4F8    test        esi,esi
>0040B4FA    je          0040B501
 0040B4FC    sub         esi,4
 0040B4FF    mov         esi,dword ptr [esi]
 0040B501    push        ebx
 0040B502    mov         eax,dword ptr [ebp-8]
 0040B505    call        @UStrToPWChar
 0040B50A    push        eax
 0040B50B    mov         eax,dword ptr [ebp-4]
 0040B50E    call        @LStrToPChar
 0040B513    lea         edx,[esi+1]
 0040B516    pop         ecx
 0040B517    call        UnicodeToUtf8
 0040B51C    mov         ebx,eax
 0040B51E    test        ebx,ebx
>0040B520    jle         0040B533
 0040B522    lea         eax,[ebp-4]
 0040B525    mov         ecx,0FDE9
 0040B52A    mov         edx,ebx
 0040B52C    call        @LStrSetLength
>0040B531    jmp         0040B53B
 0040B533    lea         eax,[ebp-4]
 0040B536    call        @LStrClr
 0040B53B    mov         eax,dword ptr [ebp-0C]
 0040B53E    mov         edx,dword ptr [ebp-4]
 0040B541    call        @LStrAsg
 0040B546    mov         eax,dword ptr [ebp-0C]
 0040B549    cmp         dword ptr [eax],0
>0040B54C    je          0040B55B
 0040B54E    mov         eax,dword ptr [ebp-0C]
 0040B551    mov         eax,dword ptr [eax]
 0040B553    sub         eax,0C
 0040B556    mov         word ptr [eax],0FDE9
 0040B55B    xor         eax,eax
 0040B55D    pop         edx
 0040B55E    pop         ecx
 0040B55F    pop         ecx
 0040B560    mov         dword ptr fs:[eax],edx
 0040B563    push        40B578
 0040B568    lea         eax,[ebp-4]
 0040B56B    call        @LStrClr
 0040B570    ret
>0040B571    jmp         @HandleFinally
>0040B576    jmp         0040B568
 0040B578    pop         esi
 0040B579    pop         ebx
 0040B57A    mov         esp,ebp
 0040B57C    pop         ebp
 0040B57D    ret
*}
end;

//0040B580
function UTF8EncodeToShortString(const US:AnsiString):ShortString;
begin
{*
 0040B580    push        ebx
 0040B581    push        esi
 0040B582    push        edi
 0040B583    mov         esi,edx
 0040B585    mov         edi,eax
 0040B587    mov         ebx,edi
 0040B589    test        ebx,ebx
>0040B58B    je          0040B592
 0040B58D    sub         ebx,4
 0040B590    mov         ebx,dword ptr [ebx]
 0040B592    push        ebx
 0040B593    mov         eax,edi
 0040B595    call        @UStrToPWChar
 0040B59A    mov         ecx,eax
 0040B59C    lea         eax,[esi+1]
 0040B59F    mov         edx,0FF
 0040B5A4    call        UnicodeToUtf8
 0040B5A9    test        eax,eax
>0040B5AB    jge         0040B5AF
 0040B5AD    xor         eax,eax
 0040B5AF    mov         byte ptr [esi],al
 0040B5B1    pop         edi
 0040B5B2    pop         esi
 0040B5B3    pop         ebx
 0040B5B4    ret
*}
end;

//0040B5B8
function UTF8Decode(const S:RawByteString):WideString;
begin
{*
 0040B5B8    push        ebp
 0040B5B9    mov         ebp,esp
 0040B5BB    add         esp,0FFFFFFF4
 0040B5BE    push        ebx
 0040B5BF    push        esi
 0040B5C0    xor         ecx,ecx
 0040B5C2    mov         dword ptr [ebp-4],ecx
 0040B5C5    mov         dword ptr [ebp-8],edx
 0040B5C8    mov         esi,eax
 0040B5CA    xor         eax,eax
 0040B5CC    push        ebp
 0040B5CD    push        40B654
 0040B5D2    push        dword ptr fs:[eax]
 0040B5D5    mov         dword ptr fs:[eax],esp
 0040B5D8    mov         eax,dword ptr [ebp-8]
 0040B5DB    call        @WStrClr
 0040B5E0    test        esi,esi
>0040B5E2    je          0040B63E
 0040B5E4    mov         dword ptr [ebp-0C],esi
 0040B5E7    mov         eax,dword ptr [ebp-0C]
 0040B5EA    test        eax,eax
>0040B5EC    je          0040B5F3
 0040B5EE    sub         eax,4
 0040B5F1    mov         eax,dword ptr [eax]
 0040B5F3    mov         ebx,eax
 0040B5F5    lea         eax,[ebp-4]
 0040B5F8    mov         edx,ebx
 0040B5FA    call        @WStrSetLength
 0040B5FF    push        ebx
 0040B600    mov         eax,esi
 0040B602    call        @LStrToPChar
 0040B607    push        eax
 0040B608    mov         eax,dword ptr [ebp-4]
 0040B60B    call        @WStrToPWChar
 0040B610    lea         edx,[ebx+1]
 0040B613    pop         ecx
 0040B614    call        Utf8ToUnicode
 0040B619    mov         ebx,eax
 0040B61B    test        ebx,ebx
>0040B61D    jle         0040B62B
 0040B61F    lea         eax,[ebp-4]
 0040B622    mov         edx,ebx
 0040B624    call        @WStrSetLength
>0040B629    jmp         0040B633
 0040B62B    lea         eax,[ebp-4]
 0040B62E    call        @WStrClr
 0040B633    mov         eax,dword ptr [ebp-8]
 0040B636    mov         edx,dword ptr [ebp-4]
 0040B639    call        @WStrAsg
 0040B63E    xor         eax,eax
 0040B640    pop         edx
 0040B641    pop         ecx
 0040B642    pop         ecx
 0040B643    mov         dword ptr fs:[eax],edx
 0040B646    push        40B65B
 0040B64B    lea         eax,[ebp-4]
 0040B64E    call        @WStrClr
 0040B653    ret
>0040B654    jmp         @HandleFinally
>0040B659    jmp         0040B64B
 0040B65B    pop         esi
 0040B65C    pop         ebx
 0040B65D    mov         esp,ebp
 0040B65F    pop         ebp
 0040B660    ret
*}
end;

//0040B664
function UTF8ToWideString(const S:RawByteString):WideString;
begin
{*
 0040B664    push        ebx
 0040B665    push        esi
 0040B666    mov         esi,edx
 0040B668    mov         ebx,eax
 0040B66A    mov         edx,esi
 0040B66C    mov         eax,ebx
 0040B66E    call        UTF8Decode
 0040B673    pop         esi
 0040B674    pop         ebx
 0040B675    ret
*}
end;

//0040B678
function UTF8ToUnicodeString(const S:RawByteString):string;
begin
{*
 0040B678    push        ebp
 0040B679    mov         ebp,esp
 0040B67B    add         esp,0FFFFFFF4
 0040B67E    push        ebx
 0040B67F    push        esi
 0040B680    xor         ecx,ecx
 0040B682    mov         dword ptr [ebp-4],ecx
 0040B685    mov         dword ptr [ebp-8],edx
 0040B688    mov         esi,eax
 0040B68A    xor         eax,eax
 0040B68C    push        ebp
 0040B68D    push        40B714
 0040B692    push        dword ptr fs:[eax]
 0040B695    mov         dword ptr fs:[eax],esp
 0040B698    mov         eax,dword ptr [ebp-8]
 0040B69B    call        @UStrClr
 0040B6A0    test        esi,esi
>0040B6A2    je          0040B6FE
 0040B6A4    mov         dword ptr [ebp-0C],esi
 0040B6A7    mov         eax,dword ptr [ebp-0C]
 0040B6AA    test        eax,eax
>0040B6AC    je          0040B6B3
 0040B6AE    sub         eax,4
 0040B6B1    mov         eax,dword ptr [eax]
 0040B6B3    mov         ebx,eax
 0040B6B5    lea         eax,[ebp-4]
 0040B6B8    mov         edx,ebx
 0040B6BA    call        @UStrSetLength
 0040B6BF    push        ebx
 0040B6C0    mov         eax,esi
 0040B6C2    call        @LStrToPChar
 0040B6C7    push        eax
 0040B6C8    mov         eax,dword ptr [ebp-4]
 0040B6CB    call        @UStrToPWChar
 0040B6D0    lea         edx,[ebx+1]
 0040B6D3    pop         ecx
 0040B6D4    call        Utf8ToUnicode
 0040B6D9    mov         ebx,eax
 0040B6DB    test        ebx,ebx
>0040B6DD    jle         0040B6EB
 0040B6DF    lea         eax,[ebp-4]
 0040B6E2    mov         edx,ebx
 0040B6E4    call        @UStrSetLength
>0040B6E9    jmp         0040B6F3
 0040B6EB    lea         eax,[ebp-4]
 0040B6EE    call        @UStrClr
 0040B6F3    mov         eax,dword ptr [ebp-8]
 0040B6F6    mov         edx,dword ptr [ebp-4]
 0040B6F9    call        @UStrAsg
 0040B6FE    xor         eax,eax
 0040B700    pop         edx
 0040B701    pop         ecx
 0040B702    pop         ecx
 0040B703    mov         dword ptr fs:[eax],edx
 0040B706    push        40B71B
 0040B70B    lea         eax,[ebp-4]
 0040B70E    call        @UStrClr
 0040B713    ret
>0040B714    jmp         @HandleFinally
>0040B719    jmp         0040B70B
 0040B71B    pop         esi
 0040B71C    pop         ebx
 0040B71D    mov         esp,ebp
 0040B71F    pop         ebp
 0040B720    ret
*}
end;

//0040B724
function UTF8ToUnicodeString(const S:ShortString):string;
begin
{*
 0040B724    push        ebp
 0040B725    mov         ebp,esp
 0040B727    push        0
 0040B729    push        ebx
 0040B72A    push        esi
 0040B72B    push        edi
 0040B72C    mov         edi,edx
 0040B72E    mov         esi,eax
 0040B730    xor         eax,eax
 0040B732    push        ebp
 0040B733    push        40B7A5
 0040B738    push        dword ptr fs:[eax]
 0040B73B    mov         dword ptr fs:[eax],esp
 0040B73E    mov         eax,edi
 0040B740    call        @UStrClr
 0040B745    cmp         byte ptr [esi],0
>0040B748    je          0040B78F
 0040B74A    movzx       ebx,byte ptr [esi]
 0040B74D    lea         eax,[ebp-4]
 0040B750    mov         edx,ebx
 0040B752    call        @UStrSetLength
 0040B757    push        ebx
 0040B758    mov         eax,dword ptr [ebp-4]
 0040B75B    call        @UStrToPWChar
 0040B760    lea         ecx,[esi+1]
 0040B763    lea         edx,[ebx+1]
 0040B766    call        Utf8ToUnicode
 0040B76B    mov         ebx,eax
 0040B76D    test        ebx,ebx
>0040B76F    jle         0040B77D
 0040B771    lea         eax,[ebp-4]
 0040B774    mov         edx,ebx
 0040B776    call        @UStrSetLength
>0040B77B    jmp         0040B785
 0040B77D    lea         eax,[ebp-4]
 0040B780    call        @UStrClr
 0040B785    mov         eax,edi
 0040B787    mov         edx,dword ptr [ebp-4]
 0040B78A    call        @UStrAsg
 0040B78F    xor         eax,eax
 0040B791    pop         edx
 0040B792    pop         ecx
 0040B793    pop         ecx
 0040B794    mov         dword ptr fs:[eax],edx
 0040B797    push        40B7AC
 0040B79C    lea         eax,[ebp-4]
 0040B79F    call        @UStrClr
 0040B7A4    ret
>0040B7A5    jmp         @HandleFinally
>0040B7AA    jmp         0040B79C
 0040B7AC    pop         edi
 0040B7AD    pop         esi
 0040B7AE    pop         ebx
 0040B7AF    pop         ecx
 0040B7B0    pop         ebp
 0040B7B1    ret
*}
end;

//0040B7B4
function UTF8ToString(const S:RawByteString):string;
begin
{*
 0040B7B4    push        ebx
 0040B7B5    push        esi
 0040B7B6    mov         esi,edx
 0040B7B8    mov         ebx,eax
 0040B7BA    mov         edx,esi
 0040B7BC    mov         eax,ebx
 0040B7BE    call        UTF8ToUnicodeString
 0040B7C3    pop         esi
 0040B7C4    pop         ebx
 0040B7C5    ret
*}
end;

//0040B7C8
function LoadResString(ResStringRec:PResStringRec):string;
begin
{*
 0040B7C8    push        ebx
 0040B7C9    push        esi
 0040B7CA    push        eax
 0040B7CB    mov         eax,2
 0040B7D0    add         esp,0FFFFF004
 0040B7D6    push        eax
 0040B7D7    dec         eax
>0040B7D8    jne         0040B7D0
 0040B7DA    mov         eax,dword ptr [esp+2000]
 0040B7E1    add         esp,4
 0040B7E4    mov         esi,edx
 0040B7E6    mov         ebx,eax
 0040B7E8    test        ebx,ebx
>0040B7EA    je          0040B829
 0040B7EC    cmp         dword ptr [ebx+4],10000
>0040B7F3    jge         0040B81F
 0040B7F5    push        1000
 0040B7FA    lea         eax,[esp+4]
 0040B7FE    push        eax
 0040B7FF    mov         eax,dword ptr [ebx+4]
 0040B802    push        eax
 0040B803    mov         eax,dword ptr [ebx]
 0040B805    mov         eax,dword ptr [eax]
 0040B807    call        FindResourceHInstance
 0040B80C    push        eax
 0040B80D    call        user32.LoadStringW
 0040B812    mov         ecx,eax
 0040B814    mov         edx,esp
 0040B816    mov         eax,esi
 0040B818    call        @UStrFromPWCharLen
>0040B81D    jmp         0040B829
 0040B81F    mov         eax,esi
 0040B821    mov         edx,dword ptr [ebx+4]
 0040B824    call        @UStrFromPWChar
 0040B829    add         esp,2000
 0040B82F    pop         esi
 0040B830    pop         ebx
 0040B831    ret
*}
end;

//0040B834
function LocaleCharsFromUnicode(CodePage:Cardinal; Flags:Cardinal; UnicodeStr:PWideChar; UnicodeStrLen:Integer; LocaleStr:PAnsiChar; LocaleStrLen:Integer; DefaultChar:PAnsiChar; UsedDefaultChar:PLongBool):Integer;
begin
{*
 0040B834    push        ebp
 0040B835    mov         ebp,esp
 0040B837    push        ebx
 0040B838    mov         ebx,dword ptr [ebp+8]
 0040B83B    push        ebx
 0040B83C    mov         ebx,dword ptr [ebp+0C]
 0040B83F    push        ebx
 0040B840    mov         ebx,dword ptr [ebp+10]
 0040B843    push        ebx
 0040B844    mov         ebx,dword ptr [ebp+14]
 0040B847    push        ebx
 0040B848    mov         ebx,dword ptr [ebp+18]
 0040B84B    push        ebx
 0040B84C    push        ecx
 0040B84D    push        edx
 0040B84E    push        eax
 0040B84F    call        kernel32.WideCharToMultiByte
 0040B854    pop         ebx
 0040B855    pop         ebp
 0040B856    ret         14
*}
end;

//0040B85C
function UnicodeFromLocaleChars(CodePage:Cardinal; Flags:Cardinal; LocaleStr:PAnsiChar; LocaleStrLen:Integer; UnicodeStr:PWideChar; UnicodeStrLen:Integer):Integer;
begin
{*
 0040B85C    push        ebp
 0040B85D    mov         ebp,esp
 0040B85F    push        ebx
 0040B860    mov         ebx,dword ptr [ebp+8]
 0040B863    push        ebx
 0040B864    mov         ebx,dword ptr [ebp+0C]
 0040B867    push        ebx
 0040B868    mov         ebx,dword ptr [ebp+10]
 0040B86B    push        ebx
 0040B86C    push        ecx
 0040B86D    push        edx
 0040B86E    push        eax
 0040B86F    call        kernel32.MultiByteToWideChar
 0040B874    pop         ebx
 0040B875    pop         ebp
 0040B876    ret         0C
*}
end;

//0040B87C
function GetCPUCount:Integer;
begin
{*
 0040B87C    add         esp,0FFFFFFDC
 0040B87F    push        esp
 0040B880    call        kernel32.GetSystemInfo
 0040B885    mov         eax,dword ptr [esp+14]
 0040B889    add         esp,24
 0040B88C    ret
*}
end;

//0040B890
procedure SetUtf8CompareLocale;
begin
{*
 0040B890    call        kernel32.GetVersion
 0040B895    mov         edx,eax
 0040B897    and         edx,0FF
 0040B89D    and         eax,0FF00
 0040B8A2    shr         eax,8
 0040B8A5    cmp         edx,5
>0040B8A8    jne         0040B8AF
 0040B8AA    cmp         eax,1
>0040B8AD    jae         0040B8B4
 0040B8AF    cmp         edx,5
>0040B8B2    jbe         0040B8BF
 0040B8B4    mov         dword ptr ds:[78E8D8],7F
 0040B8BE    ret
 0040B8BF    mov         dword ptr ds:[78E8D8],409
 0040B8C9    ret
*}
end;

//0040B8CC
function kernel32.LocalAlloc(size:Integer):Pointer; stdcall;
begin
{*
 0040B8CC    jmp         dword ptr ds:[825E84]
*}
end;

//0040B8D4
function kernel32.LocalFree:Pointer; stdcall;
begin
{*
 0040B8D4    jmp         dword ptr ds:[825E80]
*}
end;

//0040B8DC
function kernel32.LoadLibraryA:HMODULE; stdcall;
begin
{*
 0040B8DC    jmp         dword ptr ds:[825E7C]
*}
end;

//0040B8E4
function kernel32.lstrcmpiA(lpString2:PAnsiChar):Integer; stdcall;
begin
{*
 0040B8E4    jmp         dword ptr ds:[825E78]
*}
end;

//0040B8EC
procedure @memcpy(var Dest:void ; const Src:void ; Count:Integer); cdecl;
begin
{*
 0040B8EC    push        ebp
 0040B8ED    mov         ebp,esp
 0040B8EF    mov         edx,dword ptr [ebp+8]
 0040B8F2    mov         eax,dword ptr [ebp+0C]
 0040B8F5    mov         ecx,dword ptr [ebp+10]
 0040B8F8    call        Move
 0040B8FD    pop         ebp
 0040B8FE    ret
*}
end;

//0040B900
procedure @memset(var Dest:void ; Value:Byte; Count:Integer); cdecl;
begin
{*
 0040B900    push        ebp
 0040B901    mov         ebp,esp
 0040B903    movzx       ecx,byte ptr [ebp+0C]
 0040B907    mov         eax,dword ptr [ebp+8]
 0040B90A    mov         edx,dword ptr [ebp+10]
 0040B90D    call        @FillChar
 0040B912    pop         ebp
 0040B913    ret
*}
end;

//0040B914
procedure @delayLoadHelper;
begin
{*
 0040B914    jmp         dword ptr ds:[78403C]
 0040B91A    ret
*}
end;

//0040B91C
procedure _DF_.;
begin
{*
 0040B91C    push        ebp
 0040B91D    mov         ebp,esp
 0040B91F    push        ebx
 0040B920    push        esi
 0040B921    mov         esi,dword ptr [ebp+8]
 0040B924    push        8
 0040B926    push        40
 0040B928    call        kernel32.LocalAlloc
 0040B92D    mov         ebx,eax
 0040B92F    test        ebx,ebx
>0040B931    jne         0040B942
 0040B933    push        esi
 0040B934    push        1
 0040B936    push        0
 0040B938    push        0C0FB0008
 0040B93D    call        kernel32.RaiseException
 0040B942    mov         dword ptr [ebx+4],esi
 0040B945    mov         eax,[00784A1C]
 0040B94A    mov         dword ptr [ebx],eax
 0040B94C    mov         dword ptr ds:[784A1C],ebx
 0040B952    pop         esi
 0040B953    pop         ebx
 0040B954    pop         ebp
 0040B955    ret
*}
end;

//0040B956
{*procedure sub_0040B956(?:?);
begin
 0040B956    push        ebp
 0040B957    mov         ebp,esp
 0040B959    mov         edx,dword ptr [ebp+8]
 0040B95C    mov         eax,784A1C
>0040B961    jmp         0040B965
 0040B963    mov         eax,dword ptr [eax]
 0040B965    cmp         dword ptr [eax],0
>0040B968    je          0040B96E
 0040B96A    cmp         edx,dword ptr [eax]
>0040B96C    jne         0040B963
 0040B96E    cmp         edx,dword ptr [eax]
>0040B970    jne         0040B976
 0040B972    mov         ecx,dword ptr [edx]
 0040B974    mov         dword ptr [eax],ecx
 0040B976    push        edx
 0040B977    call        kernel32.LocalFree
 0040B97C    pop         ebp
 0040B97D    ret
end;*}

//0040B97E
{*function sub_0040B97E(?:?; ?:?):?;
begin
 0040B97E    push        ebp
 0040B97F    mov         ebp,esp
 0040B981    mov         eax,dword ptr [ebp+8]
 0040B984    sub         eax,dword ptr [ebp+0C]
 0040B987    test        eax,eax
>0040B989    jns         0040B98E
 0040B98B    add         eax,3
 0040B98E    sar         eax,2
 0040B991    pop         ebp
 0040B992    ret
end;*}

//0040B993
{*function sub_0040B993(?:?):?;
begin
 0040B993    push        ebp
 0040B994    mov         ebp,esp
 0040B996    mov         eax,dword ptr [ebp+8]
 0040B999    xor         edx,edx
>0040B99B    jmp         0040B9A1
 0040B99D    add         eax,4
 0040B9A0    inc         edx
 0040B9A1    cmp         dword ptr [eax],0
>0040B9A4    jne         0040B99D
 0040B9A6    mov         eax,edx
 0040B9A8    pop         ebp
 0040B9A9    ret
end;*}

//0040B9AA
{*function sub_0040B9AA(?:?):?;
begin
 0040B9AA    push        ebp
 0040B9AB    mov         ebp,esp
 0040B9AD    mov         eax,dword ptr [ebp+8]
 0040B9B0    add         eax,dword ptr [eax+3C]
 0040B9B3    pop         ebp
 0040B9B4    ret         4
end;*}

//0040B9B7
{*procedure sub_0040B9B7(?:?; ?:?);
begin
 0040B9B7    push        ebp
 0040B9B8    mov         ebp,esp
 0040B9BA    push        ebx
 0040B9BB    mov         ebx,dword ptr [ebp+8]
 0040B9BE    push        ebx
 0040B9BF    call        0040B993
 0040B9C4    pop         ecx
 0040B9C5    shl         eax,2
 0040B9C8    push        eax
 0040B9C9    push        dword ptr [ebp+0C]
 0040B9CC    push        ebx
 0040B9CD    call        @memcpy
 0040B9D2    add         esp,0C
 0040B9D5    pop         ebx
 0040B9D6    pop         ebp
 0040B9D7    ret         8
end;*}

//0040B9DA
{*function sub_0040B9DA(?:?):?;
begin
 0040B9DA    push        ebp
 0040B9DB    mov         ebp,esp
 0040B9DD    mov         eax,dword ptr [ebp+8]
 0040B9E0    mov         eax,dword ptr [eax+8]
 0040B9E3    pop         ebp
 0040B9E4    ret         4
end;*}

//0040B9E7
{*function sub_0040B9E7(?:?; ?:?):?;
begin
 0040B9E7    push        ebp
 0040B9E8    mov         ebp,esp
 0040B9EA    mov         eax,dword ptr [ebp+0C]
 0040B9ED    mov         edx,dword ptr [ebp+8]
 0040B9F0    cmp         eax,dword ptr [edx+34]
>0040B9F3    jne         0040B9FC
 0040B9F5    mov         eax,1
>0040B9FA    jmp         0040B9FE
 0040B9FC    xor         eax,eax
 0040B9FE    pop         ebp
 0040B9FF    ret         8
end;*}

//0040BA02
procedure @_delayLoadHelper;
begin
{*
 0040BA02    push        ebp
 0040BA03    mov         ebp,esp
 0040BA05    add         esp,0FFFFFFD0
 0040BA08    push        ebx
 0040BA09    push        esi
 0040BA0A    push        edi
 0040BA0B    mov         esi,dword ptr [ebp+8]
 0040BA0E    push        24
 0040BA10    push        0
 0040BA12    lea         eax,[ebp-30]
 0040BA15    push        eax
 0040BA16    call        @memset
 0040BA1B    add         esp,0C
 0040BA1E    mov         dword ptr [ebp-30],24
 0040BA25    mov         dword ptr [ebp-2C],esi
 0040BA28    mov         edx,dword ptr [ebp+0C]
 0040BA2B    mov         dword ptr [ebp-28],edx
 0040BA2E    mov         ecx,dword ptr [esi+4]
 0040BA31    mov         dword ptr [ebp-24],ecx
 0040BA34    mov         ebx,dword ptr [esi+8]
 0040BA37    push        dword ptr [esi+0C]
 0040BA3A    push        dword ptr [ebp+0C]
 0040BA3D    call        0040B97E
 0040BA42    add         esp,8
 0040BA45    mov         dword ptr [ebp-4],eax
 0040BA48    mov         eax,dword ptr [ebp-4]
 0040BA4B    shl         eax,2
 0040BA4E    add         eax,dword ptr [esi+10]
 0040BA51    test        byte ptr [eax+3],80
 0040BA55    sete        dl
 0040BA58    and         edx,1
 0040BA5B    mov         dword ptr [ebp-20],edx
 0040BA5E    test        edx,edx
>0040BA60    je          0040BA6C
 0040BA62    mov         eax,dword ptr [eax]
 0040BA64    add         eax,2
 0040BA67    mov         dword ptr [ebp-1C],eax
>0040BA6A    jmp         0040BA77
 0040BA6C    mov         ecx,dword ptr [eax]
 0040BA6E    and         ecx,0FFFF
 0040BA74    mov         dword ptr [ebp-1C],ecx
 0040BA77    xor         edi,edi
 0040BA79    cmp         dword ptr ds:[784A24],0
>0040BA80    je          0040BA99
 0040BA82    lea         eax,[ebp-30]
 0040BA85    push        eax
 0040BA86    push        0
 0040BA88    call        dword ptr ds:[784A24]
 0040BA8E    mov         edi,eax
 0040BA90    test        eax,eax
>0040BA92    je          0040BA99
>0040BA94    jmp         0040BBF4
 0040BA99    test        ebx,ebx
>0040BA9B    jne         0040BB3C
 0040BAA1    cmp         dword ptr ds:[784A24],0
>0040BAA8    je          0040BAB8
 0040BAAA    lea         edx,[ebp-30]
 0040BAAD    push        edx
 0040BAAE    push        1
 0040BAB0    call        dword ptr ds:[784A24]
 0040BAB6    mov         ebx,eax
 0040BAB8    test        ebx,ebx
>0040BABA    jne         0040BAC6
 0040BABC    push        dword ptr [ebp-24]
 0040BABF    call        kernel32.LoadLibraryA
 0040BAC4    mov         ebx,eax
 0040BAC6    test        ebx,ebx
>0040BAC8    jne         0040BB0D
 0040BACA    call        kernel32.GetLastError
 0040BACF    mov         dword ptr [ebp-10],eax
 0040BAD2    cmp         dword ptr ds:[784A20],0
>0040BAD9    je          0040BAE9
 0040BADB    lea         eax,[ebp-30]
 0040BADE    push        eax
 0040BADF    push        3
 0040BAE1    call        dword ptr ds:[784A20]
 0040BAE7    mov         ebx,eax
 0040BAE9    test        ebx,ebx
>0040BAEB    jne         0040BB0D
 0040BAED    lea         eax,[ebp-30]
 0040BAF0    mov         dword ptr [ebp-8],eax
 0040BAF3    lea         edx,[ebp-8]
 0040BAF6    push        edx
 0040BAF7    push        1
 0040BAF9    push        0
 0040BAFB    push        0C0FB007E
 0040BB00    call        kernel32.RaiseException
 0040BB05    mov         eax,dword ptr [ebp-14]
>0040BB08    jmp         0040BC16
 0040BB0D    push        790C1C
 0040BB12    call        kernel32.EnterCriticalSection
 0040BB17    cmp         dword ptr [esi+8],0
>0040BB1B    jne         0040BB29
 0040BB1D    push        esi
 0040BB1E    call        _DF_.
 0040BB23    pop         ecx
 0040BB24    mov         dword ptr [esi+8],ebx
>0040BB27    jmp         0040BB32
 0040BB29    push        ebx
 0040BB2A    call        kernel32.FreeLibrary
 0040BB2F    mov         ebx,dword ptr [esi+8]
 0040BB32    push        790C1C
 0040BB37    call        kernel32.LeaveCriticalSection
 0040BB3C    mov         dword ptr [ebp-18],ebx
 0040BB3F    cmp         dword ptr ds:[784A24],0
>0040BB46    je          0040BB56
 0040BB48    lea         eax,[ebp-30]
 0040BB4B    push        eax
 0040BB4C    push        2
 0040BB4E    call        dword ptr ds:[784A24]
 0040BB54    mov         edi,eax
 0040BB56    test        edi,edi
>0040BB58    jne         0040BBAD
 0040BB5A    cmp         dword ptr [esi+14],0
>0040BB5E    je          0040BBA2
 0040BB60    cmp         dword ptr [esi+1C],0
>0040BB64    je          0040BBA2
 0040BB66    push        ebx
 0040BB67    call        0040B9AA
 0040BB6C    mov         edi,eax
 0040BB6E    cmp         dword ptr [edi],4550
>0040BB74    jne         0040BBA2
 0040BB76    push        edi
 0040BB77    call        0040B9DA
 0040BB7C    cmp         eax,dword ptr [esi+1C]
>0040BB7F    jne         0040BBA2
 0040BB81    push        ebx
 0040BB82    push        edi
 0040BB83    call        0040B9E7
 0040BB88    test        eax,eax
>0040BB8A    je          0040BBA2
 0040BB8C    push        dword ptr [esi+14]
 0040BB8F    push        dword ptr [esi+0C]
 0040BB92    call        0040B9B7
 0040BB97    mov         eax,dword ptr [esi+0C]
 0040BB9A    mov         edx,dword ptr [ebp-4]
 0040BB9D    mov         edi,dword ptr [eax+edx*4]
>0040BBA0    jmp         0040BBF4
 0040BBA2    push        dword ptr [ebp-1C]
 0040BBA5    push        ebx
 0040BBA6    call        kernel32.GetProcAddress
 0040BBAB    mov         edi,eax
 0040BBAD    test        edi,edi
>0040BBAF    jne         0040BBEF
 0040BBB1    call        kernel32.GetLastError
 0040BBB6    mov         dword ptr [ebp-10],eax
 0040BBB9    cmp         dword ptr ds:[784A20],0
>0040BBC0    je          0040BBD0
 0040BBC2    lea         eax,[ebp-30]
 0040BBC5    push        eax
 0040BBC6    push        4
 0040BBC8    call        dword ptr ds:[784A20]
 0040BBCE    mov         edi,eax
 0040BBD0    test        edi,edi
>0040BBD2    jne         0040BBEF
 0040BBD4    lea         eax,[ebp-30]
 0040BBD7    mov         dword ptr [ebp-0C],eax
 0040BBDA    lea         edx,[ebp-0C]
 0040BBDD    push        edx
 0040BBDE    push        1
 0040BBE0    push        0
 0040BBE2    push        0C0FB007F
 0040BBE7    call        kernel32.RaiseException
 0040BBEC    mov         edi,dword ptr [ebp-14]
 0040BBEF    mov         eax,dword ptr [ebp+0C]
 0040BBF2    mov         dword ptr [eax],edi
 0040BBF4    cmp         dword ptr ds:[784A24],0
>0040BBFB    je          0040BC14
 0040BBFD    xor         edx,edx
 0040BBFF    mov         dword ptr [ebp-10],edx
 0040BC02    mov         dword ptr [ebp-18],ebx
 0040BC05    mov         dword ptr [ebp-14],edi
 0040BC08    lea         ecx,[ebp-30]
 0040BC0B    push        ecx
 0040BC0C    push        5
 0040BC0E    call        dword ptr ds:[784A24]
 0040BC14    mov         eax,edi
 0040BC16    pop         edi
 0040BC17    pop         esi
 0040BC18    pop         ebx
 0040BC19    mov         esp,ebp
 0040BC1B    pop         ebp
 0040BC1C    ret         8
*}
end;

//0040BC1F
{*function sub_0040BC1F(?:?):?;
begin
 0040BC1F    push        ebp
 0040BC20    mov         ebp,esp
 0040BC22    push        ebx
 0040BC23    push        esi
 0040BC24    push        edi
 0040BC25    mov         ebx,dword ptr [ebp+8]
 0040BC28    test        ebx,ebx
>0040BC2A    je          0040BC5F
 0040BC2C    mov         eax,dword ptr [ebx+4]
 0040BC2F    cmp         dword ptr [eax+18],0
>0040BC33    je          0040BC5F
 0040BC35    mov         esi,dword ptr [ebx+4]
 0040BC38    mov         edi,dword ptr [esi+8]
 0040BC3B    push        dword ptr [esi+18]
 0040BC3E    push        dword ptr [esi+0C]
 0040BC41    call        0040B9B7
 0040BC46    push        edi
 0040BC47    call        kernel32.FreeLibrary
 0040BC4C    xor         eax,eax
 0040BC4E    mov         dword ptr [esi+8],eax
 0040BC51    push        ebx
 0040BC52    call        0040B956
 0040BC57    pop         ecx
 0040BC58    mov         eax,1
>0040BC5D    jmp         0040BC61
 0040BC5F    xor         eax,eax
 0040BC61    pop         edi
 0040BC62    pop         esi
 0040BC63    pop         ebx
 0040BC64    pop         ebp
 0040BC65    ret
end;*}

//0040BC66
procedure @_FUnloadDelayLoadedDLL;
begin
{*
 0040BC66    push        ebp
 0040BC67    mov         ebp,esp
 0040BC69    push        ebx
 0040BC6A    push        esi
 0040BC6B    mov         esi,dword ptr [ebp+8]
 0040BC6E    mov         ebx,784A1C
 0040BC73    push        790C1C
 0040BC78    call        kernel32.EnterCriticalSection
 0040BC7D    test        esi,esi
>0040BC7F    je          0040BCB4
 0040BC81    mov         ebx,dword ptr [ebx]
 0040BC83    test        ebx,ebx
>0040BC85    je          0040BC9F
 0040BC87    mov         eax,dword ptr [ebx+4]
 0040BC8A    push        dword ptr [eax+4]
 0040BC8D    push        esi
 0040BC8E    call        kernel32.lstrcmpiA
 0040BC93    test        eax,eax
>0040BC95    jne         0040BC99
>0040BC97    jmp         0040BC9F
 0040BC99    mov         ebx,dword ptr [ebx]
 0040BC9B    test        ebx,ebx
>0040BC9D    jne         0040BC87
 0040BC9F    push        ebx
 0040BCA0    call        0040BC1F
 0040BCA5    pop         ecx
 0040BCA6    mov         ebx,eax
>0040BCA8    jmp         0040BCBE
>0040BCAA    jmp         0040BCB4
 0040BCAC    push        dword ptr [ebx]
 0040BCAE    call        0040BC1F
 0040BCB3    pop         ecx
 0040BCB4    cmp         dword ptr [ebx],0
>0040BCB7    jne         0040BCAC
 0040BCB9    mov         ebx,1
 0040BCBE    push        790C1C
 0040BCC3    call        kernel32.LeaveCriticalSection
 0040BCC8    mov         eax,ebx
 0040BCCA    pop         esi
 0040BCCB    pop         ebx
 0040BCCC    pop         ebp
 0040BCCD    ret         4
*}
end;

//0040BCD0
procedure @InitDelayHelp;
begin
{*
 0040BCD0    push        ebp
 0040BCD1    mov         ebp,esp
 0040BCD3    push        790C1C
 0040BCD8    call        kernel32.InitializeCriticalSection
 0040BCDD    pop         ebp
 0040BCDE    ret
*}
end;

//0040BCDF
procedure @ShutdownDelayHelp;
begin
{*
 0040BCDF    push        ebp
 0040BCE0    mov         ebp,esp
 0040BCE2    push        0
 0040BCE4    call        @_FUnloadDelayLoadedDLL
 0040BCE9    push        790C1C
 0040BCEE    call        kernel32.DeleteCriticalSection
 0040BCF3    pop         ebp
 0040BCF4    ret
*}
end;

Initialization
//00780000
{*
 00780000    sub         dword ptr ds:[78E8E0],1
>00780007    jae         007800A9
 0078000D    call        @InitDelayHelp
 00780012    call        InitializeMemoryManager
 00780017    call        InitializeLocaleData
 0078001C    mov         byte ptr ds:[78400C],2;gvar_0078400C
 00780023    mov         dword ptr ds:[78E014],40268C
 0078002D    mov         dword ptr ds:[78E018],40269C
 00780037    mov         byte ptr ds:[78E056],2
 0078003E    call        GetCPUCount
 00780043    mov         [0078E058],eax;CPUCount:Integer
 00780048    mov         dword ptr ds:[78E000],409480
 00780052    call        @FpuInit
 00780057    mov         word ptr ds:[78E060],0D7B0
 00780060    mov         word ptr ds:[78E330],0D7B0
 00780069    mov         word ptr ds:[78E600],0D7B0
 00780072    call        kernel32.GetCommandLineW
 00780077    mov         [0078E048],eax
 0078007C    call        GetCmdShow
 00780081    mov         [0078E044],eax
 00780086    call        kernel32.GetACP
 0078008B    mov         [0078E8D0],eax
 00780090    mov         dword ptr ds:[78E8D4],4B0
 0078009A    call        kernel32.GetCurrentThreadId
 0078009F    mov         [0078E03C],eax
 007800A4    call        SetUtf8CompareLocale
 007800A9    ret
*}
Finalization
//0040BCF8
{*
 0040BCF8    push        ebp
 0040BCF9    mov         ebp,esp
 0040BCFB    xor         eax,eax
 0040BCFD    push        ebp
 0040BCFE    push        40BD56
 0040BD03    push        dword ptr fs:[eax]
 0040BD06    mov         dword ptr fs:[eax],esp
 0040BD09    inc         dword ptr ds:[78E8E0]
>0040BD0F    jne         0040BD48
 0040BD11    mov         eax,78E05C
 0040BD16    call        @Close
 0040BD1B    mov         eax,78E32C
 0040BD20    call        @Close
 0040BD25    mov         eax,78E5FC
 0040BD2A    call        @Close
 0040BD2F    call        FinalizeLocaleDate
 0040BD34    call        FinalizeMemoryManager
 0040BD39    call        @ShutdownDelayHelp
 0040BD3E    mov         eax,784050;^'FastMM Borland Edition (c) 2004 - 2008 Pierre le Riche / Professional Softw...
 0040BD43    call        @LStrClr
 0040BD48    xor         eax,eax
 0040BD4A    pop         edx
 0040BD4B    pop         ecx
 0040BD4C    pop         ecx
 0040BD4D    mov         dword ptr fs:[eax],edx
 0040BD50    push        40BD5D
 0040BD55    ret
>0040BD56    jmp         @HandleFinally
>0040BD5B    jmp         0040BD55
 0040BD5D    pop         ebp
 0040BD5E    ret
*}
end.