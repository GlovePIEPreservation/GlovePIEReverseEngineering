//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit89;

interface

uses
  SysUtils, Classes, ThdTimer, IdException, IdStreamVCL, IdGlobal;

type
  TTimerThread = class(TThread)
  public
    FOwner:TThreadedTimer;//f40
    FInterval:Cardinal;//f44
    FStop:Cardinal;//f48
    procedure Execute; virtual;//v4//00595FD4
  end;
  TThreadedTimer = class(TComponent)
  published
    destructor Destroy();//005960AC
    constructor Create(AOwner:TComponent);//00596038
  public
    FOnTimer:TNotifyEvent;//f38
    FTimerThread:TTimerThread;//f40
    FEnabled:Boolean;//f44
    FAllowZero:Boolean;//f45
    destructor Destroy(); virtual;//005960AC
    constructor Create(AOwner:TComponent); virtual;//v2C//00596038
    procedure SetEnabled(Value:Boolean);//0059615C
    //function GetInterval:?;//005961A8
    procedure SetInterval(Value:Cardinal);//005961B0
    procedure GetThreadPriority;//005961E0
    procedure SetThreadPriority(Value:TThreadPriority);//005961EC
  end;
  EIdException = class(Exception)
  published
    procedure Toss(AMsg:string);//005969D0
    constructor Create;//00596998
  public
    constructor Create; virtual;//v8//00596998
  end;
  EIdSilentException = class(EIdException)
  end;
  EIdConnClosedGracefully = class(EIdSilentException)
  end;
  EIdSocketHandleError = class(EIdException)
  end;
  EIdPackageSizeTooBig = class(EIdSocketHandleError)
  end;
  EIdNotAllBytesSent = class(EIdSocketHandleError)
  end;
  EIdCouldNotBindSocket = class(EIdSocketHandleError)
  end;
  EIdCanNotBindPortInRange = class(EIdSocketHandleError)
  end;
  EIdInvalidPortRange = class(EIdSocketHandleError)
  end;
  EIdCannotSetIPVersionWhenConnected = class(EIdSocketHandleError)
  end;
  TIdStreamHelperVCL = class(TObject)
  published
    function Seek(AStream:TStream; AOrigin:TSeekOrigin; AOffset:Int64):Int64;//00596F74
    procedure Write(const AStream:TStream; const ABytes:TIdBytes; const ACount:Integer; const AOffset:Integer);//00596E78
    procedure ReadBytes(const AStream:TStream; var VBytes:TIdBytes; const ACount:Integer; const AOffset:Integer);//00596D10
  end;
  TIdReadFileExclusiveStream = class(TFileStream)
  published
    constructor Create;//00597348
  end;
  TIdCriticalSection = class(TCriticalSection)
  end;
  EIdInvalidIPv6Address = class(EIdException)
  end;
  TIdIPv6Address = array [1..8] of Word;
  TIdMaxLineAction = (maException, maSplit);
  TIdIPVersion = (Id_IPv4, Id_IPv6);
  TIdReuseSocket = (rsOSDependent, rsTrue, rsFalse);
    //function sub_00595FA8:?;//00595FA8
    procedure Execute;//00595FD4
    procedure EnsureEncoding(var VEncoding:TEncoding; ADefEncoding:IdAnsiEncodingType);//005972F8
    procedure IndyRaiseLastError;//00597334
    function InterlockedExchangeTHandle(var VTarget:THandle; const AValue:LongWord):THandle;//0059733C
    procedure sub_00597344;//00597344
    function OctalToInt64(const AValue:UnicodeString):Int64;//00597380
    procedure CopyTIdBytes(const ASource:TBytes; const ASourceIndex:Integer; var VDest:TBytes; const ADestIndex:Integer; const ALength:Integer);//0059742C
    procedure CopyTIdShort(const ASource:SHORT; var VDest:TBytes; const ADestIndex:Integer);//00597534
    procedure CopyTIdLongWord(const ASource:LongWord; var VDest:TBytes; const ADestIndex:Integer);//0059753C
    procedure CopyTIdInt64(var VDest:TBytes; const ADestIndex:Integer; const ASource:Int64);//00597544
    procedure CopyTIdIPV6Address(const ASource:TIdIPv6Address; var VDest:TBytes; const ADestIndex:Integer);//0059755C
    function Fetch(var AInput:UnicodeString; const ADelim:UnicodeString; const ADelete:Boolean; const ACaseSensitive:Boolean):UnicodeString;//0059756C
    function FetchCaseInsensitive(var AInput:UnicodeString; const ADelim:UnicodeString; const ADelete:Boolean):UnicodeString;//00597624
    function Ticks:LongWord;//00597710
    function GetTickDiff(const AOldTickCount:LongWord; const ANewTickCount:LongWord):LongWord;//00597718
    function iif(ATest:Boolean; const ATrue:Integer; const AFalse:Integer):Integer;//0059772C
    function iif(const AEncoding:TEncoding; const ADefEncoding:TEncoding; ADefEncodingType:IdAnsiEncodingType):TEncoding;//00597738
    function InMainThread:Boolean;//00597754
    function IsNumeric(const AString:UnicodeString):Boolean;//00597768
    function IsNumeric(const AChar:Char):Boolean;//00597784
    function IPv4ToDWord(const AIPAddress:UnicodeString; var VErr:Boolean):LongWord;//00597798
    function IPv6AddressToStr(const AValue:TIdIPv6Address):UnicodeString;//00597B04
    function MakeCanonicalIPv6Address(const AAddr:UnicodeString):UnicodeString;//00597B94
    procedure IPv6ToIdIPv6Address(const AIPAddress:UnicodeString; var VAddress:TIdIPv6Address);//005980C8
    procedure IPv6ToIdIPv6Address(const AIPAddress:UnicodeString; var VAddress:TIdIPv6Address; var VErr:Boolean);//00598144
    function IndyMax(const AValueOne:LongInt; const AValueTwo:LongInt):LongInt;//00598270
    function IndyMin(const AValueOne:LongInt; const AValueTwo:LongInt):LongInt;//00598278
    function IndyMin(const AValueOne:Int64; const AValueTwo:Int64):Int64;//00598280
    function SBPos(const Substr:UnicodeString; const S:UnicodeString):LongInt;//005982C0
    function InternalAnsiPos(const Substr:UnicodeString; const S:UnicodeString):LongInt;//005982C8
    procedure IndySleep(ATime:LongWord);//005982D0
    procedure SetThreadName(const AName:UnicodeString; AThreadID:LongWord);//005982D8
    function IndyLength(const ABuffer:UnicodeString; const ALength:Integer; const AIndex:Integer):Integer;//0059832C
    function IndyLength(const ABuffer:TBytes; const ALength:Integer; const AIndex:Integer):Integer;//00598418
    function IndyFormat(const AFormat:UnicodeString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1):UnicodeString;//00598674
    function ReplaceOnlyFirst(const S:UnicodeString; const OldPattern:UnicodeString; const NewPattern:UnicodeString):UnicodeString;//00598D10
    function IndyStrToInt(const S:UnicodeString):Integer;//00598D40
    function IndyStrToInt(const S:UnicodeString; ADefault:Integer):Integer;//00598D90
    function ToBytes(const AValue:UnicodeString; ADestEncoding:TEncoding):TBytes;//00598DE4
    function ToBytes(const AValue:UnicodeString; const ALength:Integer; const AIndex:Integer; ADestEncoding:TEncoding):TBytes;//00598E50
    function ToBytes(const AValue:Char; ADestEncoding:TEncoding):TBytes;//00598FDC
    function ToBytes(const AValue:Int64):TBytes;//0059907C
    function ToBytes(const AValue:LongWord):TBytes;//005990AC
    function ToBytes(const AValue:LongInt):TBytes;//005990D0
    function ToBytes(const AValue:SHORT):TBytes;//005990F4
    function ToBytes(const AValue:Word):TBytes;//0059911C
    function ToBytes(const AValue:Byte):TBytes;//00599144
    function ToBytes(const AValue:TBytes; const ASize:Integer; const AIndex:Integer):TBytes;//00599168
    function BytesToLongInt(const AValue:TBytes; const AIndex:Integer):LongInt;//00599308
    function BytesToInt64(const AValue:TBytes; const AIndex:Integer):Int64;//005993D8
    function BytesToWord(const AValue:TBytes; const AIndex:Integer):Word;//005994C0
    function BytesToShort(const AValue:TBytes; const AIndex:Integer):SHORT;//00599594
    procedure BytesToIPv6(const AValue:TBytes; var VAddress:TIdIPv6Address; const AIndex:Integer);//00599668
    function BytesToLongWord(const AValue:TBytes; const AIndex:Integer):LongWord;//00599748
    function BytesToString(const AValue:TBytes; AByteEncoding:TEncoding):UnicodeString;//00599818
    function BytesToString(const AValue:TBytes; const AStartIndex:Integer; const ALength:Integer; AByteEncoding:TEncoding):UnicodeString;//00599834
    procedure WriteStringToStream(AStream:TStream; const AStr:UnicodeString; ADestEncoding:TEncoding);//0059996C
    procedure WriteStringToStream(AStream:TStream; const AStr:UnicodeString; const ALength:Integer; const AIndex:Integer; ADestEncoding:TEncoding);//00599978
    function TextIsSame(const A1:UnicodeString; const A2:UnicodeString):Boolean;//00599AE4
    function TextStartsWith(const S:UnicodeString; const SubS:UnicodeString):Boolean;//00599AFC
    function TextEndsWith(const S:UnicodeString; const SubS:UnicodeString):Boolean;//00599B50
    function CharIsInSet(const AString:UnicodeString; const ACharPos:Integer; const ASet:UnicodeString):Boolean;//00599BB8
    function IndyRegisterExpectedMemoryLeak(AAddress:Pointer):Boolean;//00599C4C

implementation

//00595FA8
{*function sub_00595FA8:?;
begin
 00595FA8    add         esp,0FFFFFFE0
 00595FAB    lea         eax,[esp+10]
 00595FAF    push        eax
 00595FB0    call        kernel32.QueryPerformanceCounter
 00595FB5    lea         eax,[esp+18]
 00595FB9    push        eax
 00595FBA    call        kernel32.QueryPerformanceFrequency
 00595FBF    fild        qword ptr [esp+10]
 00595FC3    fild        qword ptr [esp+18]
 00595FC7    fdivp       st(1),st
 00595FC9    fstp        tbyte ptr [esp]
 00595FCC    wait
 00595FCD    fld         tbyte ptr [esp]
 00595FD0    add         esp,20
 00595FD3    ret
end;*}

//00595FD4
procedure TTimerThread.Execute;
begin
{*
 00595FD4    push        ebx
 00595FD5    push        esi
 00595FD6    add         esp,0FFFFFFF4
 00595FD9    mov         ebx,eax
 00595FDB    xor         esi,esi
 00595FDD    push        esi
 00595FDE    mov         eax,dword ptr [ebx+48];TTimerThread.FStop:Cardinal
 00595FE1    push        eax
 00595FE2    call        kernel32.WaitForSingleObject
 00595FE7    cmp         eax,102
>00595FEC    jne         00596027
 00595FEE    call        00595FA8
 00595FF3    fstp        tbyte ptr [esp]
 00595FF6    wait
 00595FF7    mov         eax,dword ptr [ebx+40];TTimerThread.FOwner:TThreadedTimer
 00595FFA    push        eax
 00595FFB    push        596110
 00596000    mov         eax,ebx
 00596002    call        TThread.Synchronize
 00596007    call        00595FA8
 0059600C    fld         tbyte ptr [esp]
 0059600F    fsubp       st(1),st
 00596011    fmul        dword ptr ds:[596034];1000:Single
 00596017    call        @ROUND
 0059601C    mov         esi,dword ptr [ebx+44];TTimerThread.FInterval:Cardinal
 0059601F    sub         esi,eax
 00596021    test        esi,esi
>00596023    jge         00596027
 00596025    xor         esi,esi
 00596027    cmp         byte ptr [ebx+0D],0;TTimerThread.FTerminated:Boolean
>0059602B    je          00595FDD
 0059602D    add         esp,0C
 00596030    pop         esi
 00596031    pop         ebx
 00596032    ret
*}
end;

//00596038
constructor TThreadedTimer.Create(AOwner:TComponent);
begin
{*
 00596038    push        ebp
 00596039    mov         ebp,esp
 0059603B    push        ecx
 0059603C    push        ebx
 0059603D    push        esi
 0059603E    test        dl,dl
>00596040    je          0059604A
 00596042    add         esp,0FFFFFFF0
 00596045    call        @ClassCreate
 0059604A    mov         byte ptr [ebp-1],dl
 0059604D    mov         ebx,eax
 0059604F    xor         edx,edx
 00596051    mov         eax,ebx
 00596053    call        TComponent.Create
 00596058    mov         cl,1
 0059605A    mov         dl,1
 0059605C    mov         eax,[00595C5C];TTimerThread
 00596061    call        TThread.Create;TTimerThread.Create
 00596066    mov         esi,eax
 00596068    mov         dword ptr [ebx+40],esi;TThreadedTimer.FTimerThread:TTimerThread
 0059606B    mov         dword ptr [esi+40],ebx;TTimerThread.FOwner:TThreadedTimer
 0059606E    mov         dword ptr [esi+44],3E8;TTimerThread.FInterval:Cardinal
 00596075    mov         dl,3
 00596077    mov         eax,esi
 00596079    call        TThread.SetPriority
 0059607E    push        0
 00596080    push        0
 00596082    push        0
 00596084    push        0
 00596086    call        kernel32.CreateEventW
 0059608B    mov         dword ptr [esi+48],eax;TTimerThread.FStop:Cardinal
 0059608E    mov         eax,ebx
 00596090    cmp         byte ptr [ebp-1],0
>00596094    je          005960A5
 00596096    call        @AfterConstruction
 0059609B    pop         dword ptr fs:[0]
 005960A2    add         esp,0C
 005960A5    mov         eax,ebx
 005960A7    pop         esi
 005960A8    pop         ebx
 005960A9    pop         ecx
 005960AA    pop         ebp
 005960AB    ret
*}
end;

//005960AC
destructor TThreadedTimer.Destroy();
begin
{*
 005960AC    push        ebx
 005960AD    push        esi
 005960AE    push        edi
 005960AF    call        @BeforeDestruction
 005960B4    mov         ebx,edx
 005960B6    mov         esi,eax
 005960B8    mov         edi,dword ptr [esi+40];TThreadedTimer.FTimerThread:TTimerThread
 005960BB    mov         byte ptr [esi+44],0;TThreadedTimer.FEnabled:Boolean
 005960BF    mov         eax,edi
 005960C1    call        TThread.Terminate
 005960C6    mov         eax,dword ptr [edi+48];TTimerThread.FStop:Cardinal
 005960C9    push        eax
 005960CA    call        kernel32.SetEvent
 005960CF    cmp         byte ptr [edi+0E],0;TTimerThread.FSuspended:Boolean
>005960D3    je          005960DC
 005960D5    mov         eax,edi
 005960D7    call        TThread.Resume
 005960DC    mov         eax,edi
 005960DE    call        TThread.WaitFor
 005960E3    mov         eax,dword ptr [edi+48];TTimerThread.FStop:Cardinal
 005960E6    push        eax
 005960E7    call        kernel32.CloseHandle
 005960EC    mov         eax,edi
 005960EE    call        TObject.Free
 005960F3    mov         edx,ebx
 005960F5    and         dl,0FC
 005960F8    mov         eax,esi
 005960FA    call        TComponent.Destroy
 005960FF    test        bl,bl
>00596101    jle         0059610A
 00596103    mov         eax,esi
 00596105    call        @ClassDestroy
 0059610A    pop         edi
 0059610B    pop         esi
 0059610C    pop         ebx
 0059610D    ret
*}
end;

//0059615C
procedure TThreadedTimer.SetEnabled(Value:Boolean);
begin
{*
 0059615C    push        ebx
 0059615D    mov         ebx,eax
 0059615F    cmp         dl,byte ptr [ebx+44];TThreadedTimer.FEnabled:Boolean
>00596162    je          005961A3
 00596164    mov         eax,edx
 00596166    mov         byte ptr [ebx+44],al;TThreadedTimer.FEnabled:Boolean
 00596169    test        al,al
>0059616B    je          0059619B
 0059616D    mov         eax,dword ptr [ebx+40];TThreadedTimer.FTimerThread:TTimerThread
 00596170    cmp         dword ptr [eax+44],0;TTimerThread.FInterval:Cardinal
>00596174    ja          00596185
 00596176    mov         eax,dword ptr [ebx+40];TThreadedTimer.FTimerThread:TTimerThread
 00596179    cmp         dword ptr [eax+44],0;TTimerThread.FInterval:Cardinal
>0059617D    jne         005961A3
 0059617F    cmp         byte ptr [ebx+45],0;TThreadedTimer.FAllowZero:Boolean
>00596183    je          005961A3
 00596185    mov         eax,dword ptr [ebx+40];TThreadedTimer.FTimerThread:TTimerThread
 00596188    mov         eax,dword ptr [eax+48];TTimerThread.FStop:Cardinal
 0059618B    push        eax
 0059618C    call        kernel32.SetEvent
 00596191    mov         eax,dword ptr [ebx+40];TThreadedTimer.FTimerThread:TTimerThread
 00596194    call        TThread.Resume
>00596199    jmp         005961A3
 0059619B    mov         eax,dword ptr [ebx+40];TThreadedTimer.FTimerThread:TTimerThread
 0059619E    call        TThread.Suspend
 005961A3    pop         ebx
 005961A4    ret
*}
end;

//005961A8
{*function TThreadedTimer.GetInterval:?;
begin
 005961A8    mov         eax,dword ptr [eax+40];TThreadedTimer.FTimerThread:TTimerThread
 005961AB    mov         eax,dword ptr [eax+44];TTimerThread.FInterval:Cardinal
 005961AE    ret
end;*}

//005961B0
procedure TThreadedTimer.SetInterval(Value:Cardinal);
begin
{*
 005961B0    push        ebx
 005961B1    push        esi
 005961B2    push        edi
 005961B3    mov         esi,edx
 005961B5    mov         edi,eax
 005961B7    mov         eax,dword ptr [edi+40];TThreadedTimer.FTimerThread:TTimerThread
 005961BA    cmp         esi,dword ptr [eax+44];TTimerThread.FInterval:Cardinal
>005961BD    je          005961DB
 005961BF    movzx       ebx,byte ptr [edi+44];TThreadedTimer.FEnabled:Boolean
 005961C3    xor         edx,edx
 005961C5    mov         eax,edi
 005961C7    call        TThreadedTimer.SetEnabled
 005961CC    mov         eax,dword ptr [edi+40];TThreadedTimer.FTimerThread:TTimerThread
 005961CF    mov         dword ptr [eax+44],esi;TTimerThread.FInterval:Cardinal
 005961D2    mov         edx,ebx
 005961D4    mov         eax,edi
 005961D6    call        TThreadedTimer.SetEnabled
 005961DB    pop         edi
 005961DC    pop         esi
 005961DD    pop         ebx
 005961DE    ret
*}
end;

//005961E0
procedure TThreadedTimer.GetThreadPriority;
begin
{*
 005961E0    mov         eax,dword ptr [eax+40];TThreadedTimer.FTimerThread:TTimerThread
 005961E3    call        TThread.GetPriority
 005961E8    ret
*}
end;

//005961EC
procedure TThreadedTimer.SetThreadPriority(Value:TThreadPriority);
begin
{*
 005961EC    mov         eax,dword ptr [eax+40];TThreadedTimer.FTimerThread:TTimerThread
 005961EF    call        TThread.SetPriority
 005961F4    ret
*}
end;

//00596998
constructor EIdException.Create;
begin
{*
 00596998    push        ebx
 00596999    push        esi
 0059699A    test        dl,dl
>0059699C    je          005969A6
 0059699E    add         esp,0FFFFFFF0
 005969A1    call        @ClassCreate
 005969A6    mov         ebx,edx
 005969A8    mov         esi,eax
 005969AA    xor         edx,edx
 005969AC    mov         eax,esi
 005969AE    call        Exception.Create
 005969B3    mov         eax,esi
 005969B5    test        bl,bl
>005969B7    je          005969C8
 005969B9    call        @AfterConstruction
 005969BE    pop         dword ptr fs:[0]
 005969C5    add         esp,0C
 005969C8    mov         eax,esi
 005969CA    pop         esi
 005969CB    pop         ebx
 005969CC    ret
*}
end;

//005969D0
procedure EIdException.Toss(AMsg:string);
begin
{*
 005969D0    push        ebx
 005969D1    push        esi
 005969D2    mov         esi,edx
 005969D4    mov         ebx,eax
 005969D6    mov         ecx,esi
 005969D8    mov         dl,1
 005969DA    mov         eax,ebx
 005969DC    call        dword ptr [eax+8]
 005969DF    call        @RaiseExcept
 005969E4    pop         esi
 005969E5    pop         ebx
 005969E6    ret
*}
end;

//00596D10
procedure TIdStreamHelperVCL.ReadBytes(const AStream:TStream; var VBytes:TIdBytes; const ACount:Integer; const AOffset:Integer);
begin
{*
 00596D10    push        ebp
 00596D11    mov         ebp,esp
 00596D13    push        ecx
 00596D14    push        ebx
 00596D15    push        esi
 00596D16    push        edi
 00596D17    mov         esi,ecx
 00596D19    mov         edi,edx
 00596D1B    test        edi,edi
>00596D1D    jne         00596D33
 00596D1F    mov         ecx,3A
 00596D24    mov         edx,596DE0;'C:\Builds\TP\indysockets\lib\system\IdStreamVCL.pas'
 00596D29    mov         eax,596E54;'Assertion failure'
 00596D2E    call        @Assert
 00596D33    xor         eax,eax
 00596D35    mov         dword ptr [ebp-4],eax
 00596D38    cmp         dword ptr [esi],0
>00596D3B    jne         00596D54
 00596D3D    push        0
 00596D3F    mov         eax,esi
 00596D41    mov         ecx,1
 00596D46    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00596D4C    call        @DynArraySetLength
 00596D51    add         esp,4
 00596D54    mov         ebx,dword ptr [ebp+0C]
 00596D57    test        ebx,ebx
>00596D59    jge         00596D6C
 00596D5B    mov         eax,edi
 00596D5D    mov         edx,dword ptr [eax]
 00596D5F    call        dword ptr [edx]
 00596D61    mov         ebx,eax
 00596D63    mov         eax,edi
 00596D65    call        TStream.GetPosition
 00596D6A    sub         ebx,eax
 00596D6C    test        ebx,ebx
>00596D6E    je          00596DC8
 00596D70    mov         eax,dword ptr [esi]
 00596D72    call        @DynArrayLength
 00596D77    mov         edx,dword ptr [ebp+8]
 00596D7A    add         edx,ebx
 00596D7C    cmp         eax,edx
>00596D7E    jge         00596D9B
 00596D80    mov         eax,dword ptr [ebp+8]
 00596D83    add         eax,ebx
 00596D85    push        eax
 00596D86    mov         eax,esi
 00596D88    mov         ecx,1
 00596D8D    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00596D93    call        @DynArraySetLength
 00596D98    add         esp,4
 00596D9B    cmp         dword ptr [esi],0
>00596D9E    jne         00596DB4
 00596DA0    mov         ecx,51
 00596DA5    mov         edx,596DE0;'C:\Builds\TP\indysockets\lib\system\IdStreamVCL.pas'
 00596DAA    mov         eax,596E54;'Assertion failure'
 00596DAF    call        @Assert
 00596DB4    mov         eax,dword ptr [esi]
 00596DB6    mov         edx,dword ptr [ebp+8]
 00596DB9    lea         edx,[eax+edx]
 00596DBC    mov         ecx,ebx
 00596DBE    mov         eax,edi
 00596DC0    mov         ebx,dword ptr [eax]
 00596DC2    call        dword ptr [ebx+0C]
 00596DC5    mov         dword ptr [ebp-4],eax
 00596DC8    mov         eax,dword ptr [ebp-4]
 00596DCB    pop         edi
 00596DCC    pop         esi
 00596DCD    pop         ebx
 00596DCE    pop         ecx
 00596DCF    pop         ebp
 00596DD0    ret         8
*}
end;

//00596E78
procedure TIdStreamHelperVCL.Write(const AStream:TStream; const ABytes:TIdBytes; const ACount:Integer; const AOffset:Integer);
begin
{*
 00596E78    push        ebp
 00596E79    mov         ebp,esp
 00596E7B    push        ecx
 00596E7C    push        ebx
 00596E7D    push        esi
 00596E7E    mov         ebx,ecx
 00596E80    mov         esi,edx
 00596E82    xor         eax,eax
 00596E84    mov         dword ptr [ebp-4],eax
 00596E87    test        esi,esi
>00596E89    jne         00596E9F
 00596E8B    mov         ecx,5B
 00596E90    mov         edx,596EDC;'C:\Builds\TP\indysockets\lib\system\IdStreamVCL.pas'
 00596E95    mov         eax,596F50;'Assertion failure'
 00596E9A    call        @Assert
 00596E9F    test        ebx,ebx
>00596EA1    je          00596EC6
 00596EA3    mov         ecx,dword ptr [ebp+8]
 00596EA6    mov         edx,dword ptr [ebp+0C]
 00596EA9    mov         eax,ebx
 00596EAB    call        IndyLength
 00596EB0    test        eax,eax
>00596EB2    jle         00596EC6
 00596EB4    mov         edx,dword ptr [ebp+8]
 00596EB7    lea         edx,[ebx+edx]
 00596EBA    mov         ecx,eax
 00596EBC    mov         eax,esi
 00596EBE    mov         ebx,dword ptr [eax]
 00596EC0    call        dword ptr [ebx+10]
 00596EC3    mov         dword ptr [ebp-4],eax
 00596EC6    mov         eax,dword ptr [ebp-4]
 00596EC9    pop         esi
 00596ECA    pop         ebx
 00596ECB    pop         ecx
 00596ECC    pop         ebp
 00596ECD    ret         8
*}
end;

//00596F74
function TIdStreamHelperVCL.Seek(AStream:TStream; AOrigin:TSeekOrigin; AOffset:Int64):Int64;
begin
{*
 00596F74    push        ebp
 00596F75    mov         ebp,esp
 00596F77    add         esp,0FFFFFFF8
 00596F7A    push        dword ptr [ebp+0C]
 00596F7D    push        dword ptr [ebp+8]
 00596F80    mov         eax,edx
 00596F82    mov         edx,ecx
 00596F84    mov         ecx,dword ptr [eax]
 00596F86    call        dword ptr [ecx+18]
 00596F89    mov         dword ptr [ebp-8],eax
 00596F8C    mov         dword ptr [ebp-4],edx
 00596F8F    mov         eax,dword ptr [ebp-8]
 00596F92    mov         edx,dword ptr [ebp-4]
 00596F95    pop         ecx
 00596F96    pop         ecx
 00596F97    pop         ebp
 00596F98    ret         8
*}
end;

//005972F8
procedure EnsureEncoding(var VEncoding:TEncoding; ADefEncoding:IdAnsiEncodingType);
begin
{*
 005972F8    push        ebx
 005972F9    mov         ebx,eax
 005972FB    cmp         dword ptr [ebx],0
>005972FE    jne         00597330
 00597300    dec         dl
>00597302    je          0059730E
 00597304    dec         dl
>00597306    je          00597317
 00597308    dec         dl
>0059730A    je          00597320
>0059730C    jmp         00597329
 0059730E    call        TEncoding.GetASCII
 00597313    mov         dword ptr [ebx],eax
>00597315    jmp         00597330
 00597317    call        TEncoding.GetUTF7
 0059731C    mov         dword ptr [ebx],eax
>0059731E    jmp         00597330
 00597320    call        TEncoding.GetUTF8
 00597325    mov         dword ptr [ebx],eax
>00597327    jmp         00597330
 00597329    call        TEncoding.GetDefault
 0059732E    mov         dword ptr [ebx],eax
 00597330    pop         ebx
 00597331    ret
*}
end;

//00597334
procedure IndyRaiseLastError;
begin
{*
 00597334    call        RaiseLastOSError
 00597339    ret
*}
end;

//0059733C
function InterlockedExchangeTHandle(var VTarget:THandle; const AValue:LongWord):THandle;
begin
{*
 0059733C    call        TInterlocked.Exchange
 00597341    ret
*}
end;

//00597344
procedure sub_00597344;
begin
{*
 00597344    ret
*}
end;

//00597348
constructor TIdReadFileExclusiveStream.Create;
begin
{*
 00597348    push        ebx
 00597349    push        esi
 0059734A    test        dl,dl
>0059734C    je          00597356
 0059734E    add         esp,0FFFFFFF0
 00597351    call        @ClassCreate
 00597356    mov         ebx,edx
 00597358    mov         esi,eax
 0059735A    push        20
 0059735C    xor         edx,edx
 0059735E    mov         eax,esi
 00597360    call        TFileStream.Create
 00597365    mov         eax,esi
 00597367    test        bl,bl
>00597369    je          0059737A
 0059736B    call        @AfterConstruction
 00597370    pop         dword ptr fs:[0]
 00597377    add         esp,0C
 0059737A    mov         eax,esi
 0059737C    pop         esi
 0059737D    pop         ebx
 0059737E    ret
*}
end;

//00597380
function OctalToInt64(const AValue:UnicodeString):Int64;
begin
{*
 00597380    push        ebp
 00597381    mov         ebp,esp
 00597383    add         esp,0FFFFFFF4
 00597386    push        ebx
 00597387    push        esi
 00597388    push        edi
 00597389    xor         edx,edx
 0059738B    mov         dword ptr [ebp-0C],edx
 0059738E    mov         edi,eax
 00597390    xor         eax,eax
 00597392    push        ebp
 00597393    push        597416
 00597398    push        dword ptr fs:[eax]
 0059739B    mov         dword ptr fs:[eax],esp
 0059739E    mov         dword ptr [ebp-8],0
 005973A5    mov         dword ptr [ebp-4],0
 005973AC    mov         eax,edi
 005973AE    test        eax,eax
>005973B0    je          005973B7
 005973B2    sub         eax,4
 005973B5    mov         eax,dword ptr [eax]
 005973B7    mov         ebx,eax
 005973B9    test        ebx,ebx
>005973BB    jle         00597400
 005973BD    mov         esi,1
 005973C2    lea         eax,[ebp-0C]
 005973C5    movzx       edx,word ptr [edi+esi*2-2]
 005973CA    call        @UStrFromWChar
 005973CF    mov         eax,dword ptr [ebp-0C]
 005973D2    xor         edx,edx
 005973D4    call        IndyStrToInt
 005973D9    cdq
 005973DA    push        edx
 005973DB    push        eax
 005973DC    mov         eax,dword ptr [ebp-8]
 005973DF    mov         edx,dword ptr [ebp-4]
 005973E2    shld        edx,eax,3
 005973E6    add         eax,eax
 005973E8    add         eax,eax
 005973EA    add         eax,eax
 005973EC    add         eax,dword ptr [esp]
 005973EF    adc         edx,dword ptr [esp+4]
 005973F3    add         esp,8
 005973F6    mov         dword ptr [ebp-8],eax
 005973F9    mov         dword ptr [ebp-4],edx
 005973FC    inc         esi
 005973FD    dec         ebx
>005973FE    jne         005973C2
 00597400    xor         eax,eax
 00597402    pop         edx
 00597403    pop         ecx
 00597404    pop         ecx
 00597405    mov         dword ptr fs:[eax],edx
 00597408    push        59741D
 0059740D    lea         eax,[ebp-0C]
 00597410    call        @UStrClr
 00597415    ret
>00597416    jmp         @HandleFinally
>0059741B    jmp         0059740D
 0059741D    mov         eax,dword ptr [ebp-8]
 00597420    mov         edx,dword ptr [ebp-4]
 00597423    pop         edi
 00597424    pop         esi
 00597425    pop         ebx
 00597426    mov         esp,ebp
 00597428    pop         ebp
 00597429    ret
*}
end;

//0059742C
procedure CopyTIdBytes(const ASource:TBytes; const ASourceIndex:Integer; var VDest:TBytes; const ADestIndex:Integer; const ALength:Integer);
begin
{*
 0059742C    push        ebp
 0059742D    mov         ebp,esp
 0059742F    push        ecx
 00597430    push        ebx
 00597431    push        esi
 00597432    push        edi
 00597433    mov         dword ptr [ebp-4],ecx
 00597436    mov         ebx,edx
 00597438    mov         esi,eax
 0059743A    mov         edi,dword ptr [ebp+8]
 0059743D    test        ebx,ebx
>0059743F    jge         00597455
 00597441    mov         ecx,0BEC
 00597446    mov         edx,5974A0;'C:\Builds\TP\indysockets\lib\system\IdGlobal.pas'
 0059744B    mov         eax,597510;'Assertion failure'
 00597450    call        @Assert
 00597455    mov         eax,esi
 00597457    call        @DynArrayLength
 0059745C    lea         edx,[edi+ebx]
 0059745F    cmp         eax,edx
>00597461    jge         00597477
 00597463    mov         ecx,0BED
 00597468    mov         edx,5974A0;'C:\Builds\TP\indysockets\lib\system\IdGlobal.pas'
 0059746D    mov         eax,597510;'Assertion failure'
 00597472    call        @Assert
 00597477    mov         eax,dword ptr [ebp-4]
 0059747A    mov         eax,dword ptr [eax]
 0059747C    mov         edx,dword ptr [ebp+0C]
 0059747F    lea         edx,[eax+edx]
 00597482    lea         eax,[esi+ebx]
 00597485    mov         ecx,edi
 00597487    call        Move
 0059748C    pop         edi
 0059748D    pop         esi
 0059748E    pop         ebx
 0059748F    pop         ecx
 00597490    pop         ebp
 00597491    ret         8
*}
end;

//00597534
procedure CopyTIdShort(const ASource:SHORT; var VDest:TBytes; const ADestIndex:Integer);
begin
{*
 00597534    mov         edx,dword ptr [edx]
 00597536    add         edx,ecx
 00597538    mov         word ptr [edx],ax
 0059753B    ret
*}
end;

//0059753C
procedure CopyTIdLongWord(const ASource:LongWord; var VDest:TBytes; const ADestIndex:Integer);
begin
{*
 0059753C    mov         edx,dword ptr [edx]
 0059753E    add         edx,ecx
 00597540    mov         dword ptr [edx],eax
 00597542    ret
*}
end;

//00597544
procedure CopyTIdInt64(var VDest:TBytes; const ADestIndex:Integer; const ASource:Int64);
begin
{*
 00597544    push        ebp
 00597545    mov         ebp,esp
 00597547    mov         eax,dword ptr [eax]
 00597549    add         eax,edx
 0059754B    mov         edx,dword ptr [ebp+8]
 0059754E    mov         dword ptr [eax],edx
 00597550    mov         edx,dword ptr [ebp+0C]
 00597553    mov         dword ptr [eax+4],edx
 00597556    pop         ebp
 00597557    ret         8
*}
end;

//0059755C
procedure CopyTIdIPV6Address(const ASource:TIdIPv6Address; var VDest:TBytes; const ADestIndex:Integer);
begin
{*
 0059755C    mov         edx,dword ptr [edx]
 0059755E    add         edx,ecx
 00597560    mov         ecx,10
 00597565    call        Move
 0059756A    ret
*}
end;

//0059756C
function Fetch(var AInput:UnicodeString; const ADelim:UnicodeString; const ADelete:Boolean; const ACaseSensitive:Boolean):UnicodeString;
begin
{*
 0059756C    push        ebp
 0059756D    mov         ebp,esp
 0059756F    push        ecx
 00597570    push        ebx
 00597571    push        esi
 00597572    push        edi
 00597573    mov         byte ptr [ebp-1],cl
 00597576    mov         esi,edx
 00597578    mov         ebx,eax
 0059757A    cmp         byte ptr [ebp+0C],0
>0059757E    je          005975F8
 00597580    mov         eax,esi
 00597582    mov         edx,597620;''
 00597587    call        @UStrEqual
>0059758C    jne         0059759B
 0059758E    mov         edx,dword ptr [ebx]
 00597590    mov         eax,esi
 00597592    call        Pos
 00597597    mov         edi,eax
>00597599    jmp         005975A7
 0059759B    mov         edx,dword ptr [ebx]
 0059759D    mov         eax,esi
 0059759F    call        dword ptr ds:[789BA0]
 005975A5    mov         edi,eax
 005975A7    test        edi,edi
>005975A9    jne         005975C4
 005975AB    mov         eax,dword ptr [ebp+8]
 005975AE    mov         edx,dword ptr [ebx]
 005975B0    call        @UStrAsg
 005975B5    cmp         byte ptr [ebp-1],0
>005975B9    je          00597609
 005975BB    mov         eax,ebx
 005975BD    call        @UStrClr
>005975C2    jmp         00597609
 005975C4    mov         eax,dword ptr [ebp+8]
 005975C7    push        eax
 005975C8    mov         ecx,edi
 005975CA    dec         ecx
 005975CB    mov         eax,dword ptr [ebx]
 005975CD    mov         edx,1
 005975D2    call        @UStrCopy
 005975D7    cmp         byte ptr [ebp-1],0
>005975DB    je          00597609
 005975DD    test        esi,esi
>005975DF    je          005975E6
 005975E1    sub         esi,4
 005975E4    mov         esi,dword ptr [esi]
 005975E6    push        ebx
 005975E7    lea         edx,[esi+edi]
 005975EA    mov         eax,dword ptr [ebx]
 005975EC    mov         ecx,7FFFFFFF
 005975F1    call        @UStrCopy
>005975F6    jmp         00597609
 005975F8    mov         eax,dword ptr [ebp+8]
 005975FB    push        eax
 005975FC    mov         eax,ebx
 005975FE    movzx       ecx,byte ptr [ebp-1]
 00597602    mov         edx,esi
 00597604    call        FetchCaseInsensitive
 00597609    pop         edi
 0059760A    pop         esi
 0059760B    pop         ebx
 0059760C    pop         ecx
 0059760D    pop         ebp
 0059760E    ret         8
*}
end;

//00597624
function FetchCaseInsensitive(var AInput:UnicodeString; const ADelim:UnicodeString; const ADelete:Boolean):UnicodeString;
begin
{*
 00597624    push        ebp
 00597625    mov         ebp,esp
 00597627    push        0
 00597629    push        0
 0059762B    push        0
 0059762D    push        ebx
 0059762E    push        esi
 0059762F    push        edi
 00597630    mov         byte ptr [ebp-1],cl
 00597633    mov         edi,edx
 00597635    mov         ebx,eax
 00597637    xor         eax,eax
 00597639    push        ebp
 0059763A    push        5976EE
 0059763F    push        dword ptr fs:[eax]
 00597642    mov         dword ptr fs:[eax],esp
 00597645    mov         eax,edi
 00597647    mov         edx,59770C;''
 0059764C    call        @UStrEqual
>00597651    jne         00597660
 00597653    mov         edx,dword ptr [ebx]
 00597655    mov         eax,edi
 00597657    call        Pos
 0059765C    mov         esi,eax
>0059765E    jmp         00597684
 00597660    lea         edx,[ebp-8]
 00597663    mov         eax,dword ptr [ebx]
 00597665    call        UpperCase
 0059766A    mov         eax,dword ptr [ebp-8]
 0059766D    push        eax
 0059766E    lea         edx,[ebp-0C]
 00597671    mov         eax,edi
 00597673    call        UpperCase
 00597678    mov         eax,dword ptr [ebp-0C]
 0059767B    pop         edx
 0059767C    call        dword ptr ds:[789BA0]
 00597682    mov         esi,eax
 00597684    test        esi,esi
>00597686    jne         005976A1
 00597688    mov         eax,dword ptr [ebp+8]
 0059768B    mov         edx,dword ptr [ebx]
 0059768D    call        @UStrAsg
 00597692    cmp         byte ptr [ebp-1],0
>00597696    je          005976D3
 00597698    mov         eax,ebx
 0059769A    call        @UStrClr
>0059769F    jmp         005976D3
 005976A1    mov         eax,dword ptr [ebp+8]
 005976A4    push        eax
 005976A5    mov         ecx,esi
 005976A7    dec         ecx
 005976A8    mov         eax,dword ptr [ebx]
 005976AA    mov         edx,1
 005976AF    call        @UStrCopy
 005976B4    cmp         byte ptr [ebp-1],0
>005976B8    je          005976D3
 005976BA    test        edi,edi
>005976BC    je          005976C3
 005976BE    sub         edi,4
 005976C1    mov         edi,dword ptr [edi]
 005976C3    push        ebx
 005976C4    lea         edx,[edi+esi]
 005976C7    mov         eax,dword ptr [ebx]
 005976C9    mov         ecx,7FFFFFFF
 005976CE    call        @UStrCopy
 005976D3    xor         eax,eax
 005976D5    pop         edx
 005976D6    pop         ecx
 005976D7    pop         ecx
 005976D8    mov         dword ptr fs:[eax],edx
 005976DB    push        5976F5
 005976E0    lea         eax,[ebp-0C]
 005976E3    mov         edx,2
 005976E8    call        @UStrArrayClr
 005976ED    ret
>005976EE    jmp         @HandleFinally
>005976F3    jmp         005976E0
 005976F5    pop         edi
 005976F6    pop         esi
 005976F7    pop         ebx
 005976F8    mov         esp,ebp
 005976FA    pop         ebp
 005976FB    ret         4
*}
end;

//00597710
function Ticks:LongWord;
begin
{*
 00597710    call        kernel32.GetTickCount
 00597715    ret
*}
end;

//00597718
function GetTickDiff(const AOldTickCount:LongWord; const ANewTickCount:LongWord):LongWord;
begin
{*
 00597718    cmp         eax,edx
>0059771A    ja          00597721
 0059771C    sub         edx,eax
 0059771E    mov         eax,edx
 00597720    ret
 00597721    or          ecx,0FFFFFFFF
 00597724    sub         ecx,eax
 00597726    add         edx,ecx
 00597728    mov         eax,edx
 0059772A    ret
*}
end;

//0059772C
function iif(ATest:Boolean; const ATrue:Integer; const AFalse:Integer):Integer;
begin
{*
 0059772C    test        al,al
>0059772E    je          00597733
 00597730    mov         eax,edx
 00597732    ret
 00597733    mov         eax,ecx
 00597735    ret
*}
end;

//00597738
function iif(const AEncoding:TEncoding; const ADefEncoding:TEncoding; ADefEncodingType:IdAnsiEncodingType):TEncoding;
begin
{*
 00597738    push        ecx
 00597739    mov         dword ptr [esp],eax
 0059773C    cmp         dword ptr [esp],0
>00597740    jne         0059774E
 00597742    mov         dword ptr [esp],edx
 00597745    mov         eax,esp
 00597747    mov         edx,ecx
 00597749    call        EnsureEncoding
 0059774E    mov         eax,dword ptr [esp]
 00597751    pop         edx
 00597752    ret
*}
end;

//00597754
function InMainThread:Boolean;
begin
{*
 00597754    call        kernel32.GetCurrentThreadId
 00597759    mov         edx,dword ptr ds:[78DB78];MainThreadID:Cardinal
 0059775F    cmp         eax,dword ptr [edx]
 00597761    sete        al
 00597764    ret
*}
end;

//00597768
function IsNumeric(const AString:UnicodeString):Boolean;
begin
{*
 00597768    push        ebx
 00597769    add         esp,0FFFFFFF0
 0059776C    mov         ebx,eax
 0059776E    mov         edx,esp
 00597770    mov         eax,ebx
 00597772    call        @ValInt64
 00597777    cmp         dword ptr [esp],0
 0059777B    sete        al
 0059777E    add         esp,10
 00597781    pop         ebx
 00597782    ret
*}
end;

//00597784
function IsNumeric(const AChar:Char):Boolean;
begin
{*
 00597784    cmp         ax,30
>00597788    jb          00597790
 0059778A    cmp         ax,39
>0059778E    jbe         00597793
 00597790    xor         eax,eax
 00597792    ret
 00597793    mov         al,1
 00597795    ret
*}
end;

//00597798
function IPv4ToDWord(const AIPAddress:UnicodeString; var VErr:Boolean):LongWord;
begin
{*
 00597798    push        ebp
 00597799    mov         ebp,esp
 0059779B    add         esp,0FFFFFFA4
 0059779E    push        ebx
 0059779F    push        esi
 005977A0    push        edi
 005977A1    xor         ecx,ecx
 005977A3    mov         dword ptr [ebp-4C],ecx
 005977A6    mov         dword ptr [ebp-4],ecx
 005977A9    mov         dword ptr [ebp-8],ecx
 005977AC    mov         dword ptr [ebp-0C],ecx
 005977AF    mov         dword ptr [ebp-10],edx
 005977B2    mov         ebx,eax
 005977B4    xor         eax,eax
 005977B6    push        ebp
 005977B7    push        597ABC
 005977BC    push        dword ptr fs:[eax]
 005977BF    mov         dword ptr fs:[eax],esp
 005977C2    mov         eax,dword ptr [ebp-10]
 005977C5    mov         byte ptr [eax],1
 005977C8    xor         eax,eax
 005977CA    mov         dword ptr [ebp-14],eax
 005977CD    mov         edi,4
 005977D2    lea         eax,[ebp-8]
 005977D5    mov         edx,ebx
 005977D7    call        @UStrLAsg
 005977DC    mov         edx,dword ptr [ebp-8]
 005977DF    mov         eax,597ADC;'.'
 005977E4    call        dword ptr ds:[789BA0]
 005977EA    mov         ebx,eax
 005977EC    test        ebx,ebx
>005977EE    jne         00597805
 005977F0    lea         eax,[ebp-0C]
 005977F3    mov         edx,dword ptr [ebp-8]
 005977F6    call        @UStrLAsg
 005977FB    lea         eax,[ebp-8]
 005977FE    call        @UStrClr
>00597803    jmp         0059783B
 00597805    lea         eax,[ebp-0C]
 00597808    push        eax
 00597809    mov         ecx,ebx
 0059780B    dec         ecx
 0059780C    mov         edx,1
 00597811    mov         eax,dword ptr [ebp-8]
 00597814    call        @UStrCopy
 00597819    mov         esi,597ADC;'.'
 0059781E    test        esi,esi
>00597820    je          00597827
 00597822    sub         esi,4
 00597825    mov         esi,dword ptr [esi]
 00597827    lea         eax,[ebp-8]
 0059782A    push        eax
 0059782B    lea         edx,[esi+ebx]
 0059782E    mov         ecx,7FFFFFFF
 00597833    mov         eax,dword ptr [ebp-8]
 00597836    call        @UStrCopy
 0059783B    lea         eax,[ebp-4]
 0059783E    mov         edx,dword ptr [ebp-0C]
 00597841    call        @UStrLAsg
 00597846    cmp         dword ptr [ebp-4],0
>0059784A    je          00597A93
 00597850    cmp         dword ptr [ebp-8],0
>00597854    jne         0059786B
 00597856    cmp         edi,1
>00597859    jle         0059786B
 0059785B    mov         dword ptr [ebp-18],edi
 0059785E    mov         ecx,edi
 00597860    add         ecx,ecx
 00597862    add         ecx,ecx
 00597864    add         ecx,ecx
 00597866    shl         dword ptr [ebp-14],cl
>00597869    jmp         00597876
 0059786B    mov         dword ptr [ebp-18],1
 00597872    shl         dword ptr [ebp-14],8
 00597876    mov         edx,597AEC;'0x'
 0059787B    mov         eax,dword ptr [ebp-4]
 0059787E    call        TextStartsWith
 00597883    test        al,al
>00597885    je          0059798D
 0059788B    lea         eax,[ebp-4C]
 0059788E    push        eax
 0059788F    mov         ecx,7FFFFFFF
 00597894    mov         edx,3
 00597899    mov         eax,dword ptr [ebp-4]
 0059789C    call        @UStrCopy
 005978A1    mov         esi,dword ptr [ebp-4C]
 005978A4    mov         byte ptr [ebp-19],0
 005978A8    mov         ecx,1
 005978AD    or          edx,0FFFFFFFF
 005978B0    mov         dword ptr [ebp-50],esi
 005978B3    mov         eax,dword ptr [ebp-50]
 005978B6    call        IndyLength
 005978BB    mov         dword ptr [ebp-20],eax
 005978BE    cmp         dword ptr [ebp-20],0
>005978C2    jle         00597937
 005978C4    mov         eax,dword ptr [ebp-20]
 005978C7    dec         eax
 005978C8    test        eax,eax
>005978CA    jl          00597933
 005978CC    inc         eax
 005978CD    mov         dword ptr [ebp-24],eax
 005978D0    xor         ebx,ebx
 005978D2    lea         eax,[ebx+1]
 005978D5    mov         dword ptr [ebp-50],esi
 005978D8    mov         edx,dword ptr [ebp-50]
 005978DB    movzx       eax,word ptr [edx+eax*2-2]
 005978E0    call        IsNumeric
 005978E5    test        al,al
>005978E7    jne         0059792D
 005978E9    lea         eax,[ebx+1]
 005978EC    mov         dword ptr [ebp-50],esi
 005978EF    mov         edx,dword ptr [ebp-50]
 005978F2    cmp         word ptr [edx+eax*2-2],41
>005978F8    jb          0059790B
 005978FA    lea         eax,[ebx+1]
 005978FD    mov         dword ptr [ebp-54],esi
 00597900    mov         edx,dword ptr [ebp-54]
 00597903    cmp         word ptr [edx+eax*2-2],46
>00597909    jbe         0059792D
 0059790B    lea         eax,[ebx+1]
 0059790E    mov         dword ptr [ebp-58],esi
 00597911    mov         edx,dword ptr [ebp-58]
 00597914    cmp         word ptr [edx+eax*2-2],61
>0059791A    jb          00597937
 0059791C    lea         eax,[ebx+1]
 0059791F    mov         dword ptr [ebp-5C],esi
 00597922    mov         edx,dword ptr [ebp-5C]
 00597925    cmp         word ptr [edx+eax*2-2],66
>0059792B    ja          00597937
 0059792D    inc         ebx
 0059792E    dec         dword ptr [ebp-24]
>00597931    jne         005978D2
 00597933    mov         byte ptr [ebp-19],1
 00597937    cmp         byte ptr [ebp-19],0
>0059793B    je          00597A99
 00597941    push        0
 00597943    push        0
 00597945    mov         eax,dword ptr [ebp-4]
 00597948    call        StrToInt64Def
 0059794D    mov         dword ptr [ebp-30],eax
 00597950    mov         dword ptr [ebp-2C],edx
 00597953    mov         eax,dword ptr [ebp-18]
 00597956    sub         eax,2
>00597959    je          00597973
 0059795B    dec         eax
>0059795C    je          00597969
 0059795E    dec         eax
>0059795F    jne         0059797D
 00597961    mov         eax,dword ptr [ebp-30]
 00597964    and         eax,0FFFFFFFF
>00597967    jmp         00597985
 00597969    mov         eax,dword ptr [ebp-30]
 0059796C    and         eax,0FFFFFF
>00597971    jmp         00597985
 00597973    mov         eax,dword ptr [ebp-30]
 00597976    and         eax,0FFFF
>0059797B    jmp         00597985
 0059797D    mov         eax,dword ptr [ebp-30]
 00597980    and         eax,0FF
 00597985    add         dword ptr [ebp-14],eax
>00597988    jmp         00597A8D
 0059798D    mov         eax,dword ptr [ebp-4]
 00597990    call        IsNumeric
 00597995    test        al,al
>00597997    je          00597A99
 0059799D    mov         edx,597B00;'0'
 005979A2    mov         eax,dword ptr [ebp-4]
 005979A5    call        TextStartsWith
 005979AA    test        al,al
>005979AC    je          005979FB
 005979AE    mov         byte ptr [ebp-31],0
 005979B2    mov         ecx,1
 005979B7    or          edx,0FFFFFFFF
 005979BA    mov         eax,dword ptr [ebp-4]
 005979BD    call        IndyLength
 005979C2    mov         dword ptr [ebp-38],eax
 005979C5    cmp         dword ptr [ebp-38],0
>005979C9    jle         005979F5
 005979CB    mov         ecx,dword ptr [ebp-38]
 005979CE    dec         ecx
 005979CF    test        ecx,ecx
>005979D1    jl          005979F1
 005979D3    inc         ecx
 005979D4    xor         eax,eax
 005979D6    lea         edx,[eax+1]
 005979D9    mov         ebx,dword ptr [ebp-4]
 005979DC    movzx       edx,word ptr [ebx+edx*2-2]
 005979E1    cmp         dx,30
>005979E5    jb          005979F5
 005979E7    cmp         dx,37
>005979EB    ja          005979F5
 005979ED    inc         eax
 005979EE    dec         ecx
>005979EF    jne         005979D6
 005979F1    mov         byte ptr [ebp-31],1
 005979F5    movzx       eax,byte ptr [ebp-31]
>005979F9    jmp         005979FD
 005979FB    xor         eax,eax
 005979FD    test        al,al
>005979FF    je          00597A46
 00597A01    mov         eax,dword ptr [ebp-4]
 00597A04    call        OctalToInt64
 00597A09    mov         dword ptr [ebp-40],eax
 00597A0C    mov         dword ptr [ebp-3C],edx
 00597A0F    mov         eax,dword ptr [ebp-18]
 00597A12    sub         eax,2
>00597A15    je          00597A2F
 00597A17    dec         eax
>00597A18    je          00597A25
 00597A1A    dec         eax
>00597A1B    jne         00597A39
 00597A1D    mov         eax,dword ptr [ebp-40]
 00597A20    and         eax,0FFFFFFFF
>00597A23    jmp         00597A41
 00597A25    mov         eax,dword ptr [ebp-40]
 00597A28    and         eax,0FFFFFF
>00597A2D    jmp         00597A41
 00597A2F    mov         eax,dword ptr [ebp-40]
 00597A32    and         eax,0FFFF
>00597A37    jmp         00597A41
 00597A39    mov         eax,dword ptr [ebp-40]
 00597A3C    and         eax,0FF
 00597A41    add         dword ptr [ebp-14],eax
>00597A44    jmp         00597A8D
 00597A46    push        0
 00597A48    push        0
 00597A4A    mov         eax,dword ptr [ebp-4]
 00597A4D    call        StrToInt64Def
 00597A52    mov         dword ptr [ebp-48],eax
 00597A55    mov         dword ptr [ebp-44],edx
 00597A58    mov         eax,dword ptr [ebp-18]
 00597A5B    sub         eax,2
>00597A5E    je          00597A78
 00597A60    dec         eax
>00597A61    je          00597A6E
 00597A63    dec         eax
>00597A64    jne         00597A82
 00597A66    mov         eax,dword ptr [ebp-48]
 00597A69    and         eax,0FFFFFFFF
>00597A6C    jmp         00597A8A
 00597A6E    mov         eax,dword ptr [ebp-48]
 00597A71    and         eax,0FFFFFF
>00597A76    jmp         00597A8A
 00597A78    mov         eax,dword ptr [ebp-48]
 00597A7B    and         eax,0FFFF
>00597A80    jmp         00597A8A
 00597A82    mov         eax,dword ptr [ebp-48]
 00597A85    and         eax,0FF
 00597A8A    add         dword ptr [ebp-14],eax
 00597A8D    dec         edi
>00597A8E    jmp         005977DC
 00597A93    mov         eax,dword ptr [ebp-10]
 00597A96    mov         byte ptr [eax],0
 00597A99    xor         eax,eax
 00597A9B    pop         edx
 00597A9C    pop         ecx
 00597A9D    pop         ecx
 00597A9E    mov         dword ptr fs:[eax],edx
 00597AA1    push        597AC3
 00597AA6    lea         eax,[ebp-4C]
 00597AA9    call        @UStrClr
 00597AAE    lea         eax,[ebp-0C]
 00597AB1    mov         edx,3
 00597AB6    call        @UStrArrayClr
 00597ABB    ret
>00597ABC    jmp         @HandleFinally
>00597AC1    jmp         00597AA6
 00597AC3    mov         eax,dword ptr [ebp-14]
 00597AC6    pop         edi
 00597AC7    pop         esi
 00597AC8    pop         ebx
 00597AC9    mov         esp,ebp
 00597ACB    pop         ebp
 00597ACC    ret
*}
end;

//00597B04
function IPv6AddressToStr(const AValue:TIdIPv6Address):UnicodeString;
begin
{*
 00597B04    push        ebp
 00597B05    mov         ebp,esp
 00597B07    add         esp,0FFFFFFF8
 00597B0A    push        ebx
 00597B0B    push        esi
 00597B0C    push        edi
 00597B0D    xor         ecx,ecx
 00597B0F    mov         dword ptr [ebp-8],ecx
 00597B12    mov         edi,edx
 00597B14    mov         dword ptr [ebp-4],eax
 00597B17    xor         eax,eax
 00597B19    push        ebp
 00597B1A    push        597B76
 00597B1F    push        dword ptr fs:[eax]
 00597B22    mov         dword ptr fs:[eax],esp
 00597B25    mov         eax,edi
 00597B27    call        @UStrClr
 00597B2C    mov         esi,8
 00597B31    mov         ebx,dword ptr [ebp-4]
 00597B34    push        dword ptr [edi]
 00597B36    push        597B90;':'
 00597B3B    lea         ecx,[ebp-8]
 00597B3E    movzx       eax,word ptr [ebx]
 00597B41    mov         edx,4
 00597B46    call        IntToHex
 00597B4B    push        dword ptr [ebp-8]
 00597B4E    mov         eax,edi
 00597B50    mov         edx,3
 00597B55    call        @UStrCatN
 00597B5A    add         ebx,2
 00597B5D    dec         esi
>00597B5E    jne         00597B34
 00597B60    xor         eax,eax
 00597B62    pop         edx
 00597B63    pop         ecx
 00597B64    pop         ecx
 00597B65    mov         dword ptr fs:[eax],edx
 00597B68    push        597B7D
 00597B6D    lea         eax,[ebp-8]
 00597B70    call        @UStrClr
 00597B75    ret
>00597B76    jmp         @HandleFinally
>00597B7B    jmp         00597B6D
 00597B7D    pop         edi
 00597B7E    pop         esi
 00597B7F    pop         ebx
 00597B80    pop         ecx
 00597B81    pop         ecx
 00597B82    pop         ebp
 00597B83    ret
*}
end;

//00597B94
function MakeCanonicalIPv6Address(const AAddr:UnicodeString):UnicodeString;
begin
{*
 00597B94    push        ebp
 00597B95    mov         ebp,esp
 00597B97    mov         ecx,11
 00597B9C    push        0
 00597B9E    push        0
 00597BA0    dec         ecx
>00597BA1    jne         00597B9C
 00597BA3    push        ebx
 00597BA4    push        esi
 00597BA5    push        edi
 00597BA6    mov         esi,edx
 00597BA8    mov         ebx,eax
 00597BAA    xor         eax,eax
 00597BAC    push        ebp
 00597BAD    push        598076
 00597BB2    push        dword ptr fs:[eax]
 00597BB5    mov         dword ptr fs:[eax],esp
 00597BB8    mov         eax,esi
 00597BBA    call        @UStrClr
 00597BBF    lea         eax,[ebp-4]
 00597BC2    mov         edx,ebx
 00597BC4    call        @UStrLAsg
 00597BC9    mov         eax,dword ptr [ebp-4]
 00597BCC    test        eax,eax
>00597BCE    je          00597BD5
 00597BD0    sub         eax,4
 00597BD3    mov         eax,dword ptr [eax]
 00597BD5    test        eax,eax
>00597BD7    je          00598050
 00597BDD    mov         edx,598090;':'
 00597BE2    mov         eax,dword ptr [ebp-4]
 00597BE5    call        TextStartsWith
 00597BEA    test        al,al
>00597BEC    je          00597BFE
 00597BEE    lea         eax,[ebp-4]
 00597BF1    mov         ecx,dword ptr [ebp-4]
 00597BF4    mov         edx,5980A0;'0'
 00597BF9    call        @UStrCat3
 00597BFE    mov         edx,598090;':'
 00597C03    mov         eax,dword ptr [ebp-4]
 00597C06    call        TextEndsWith
 00597C0B    test        al,al
>00597C0D    je          00597C1C
 00597C0F    lea         eax,[ebp-4]
 00597C12    mov         edx,5980A0;'0'
 00597C17    call        @UStrCat
 00597C1C    xor         eax,eax
 00597C1E    mov         dword ptr [ebp-8],eax
 00597C21    xor         eax,eax
 00597C23    mov         dword ptr [ebp-0C],eax
 00597C26    mov         eax,dword ptr [ebp-4]
 00597C29    test        eax,eax
>00597C2B    je          00597C32
 00597C2D    sub         eax,4
 00597C30    mov         eax,dword ptr [eax]
 00597C32    test        eax,eax
>00597C34    jle         00597CB0
 00597C36    mov         dword ptr [ebp-14],eax
 00597C39    mov         eax,1
 00597C3E    mov         edx,dword ptr [ebp-4]
 00597C41    movzx       edx,word ptr [edx+eax*2-2]
 00597C46    cmp         edx,3A
>00597C49    jg          00597C5F
>00597C4B    je          00597C8A
 00597C4D    sub         edx,2E
>00597C50    je          00597C74
 00597C52    add         edx,0FFFFFFFE
 00597C55    sub         edx,0A
>00597C58    jb          00597CAA
>00597C5A    jmp         00598050
 00597C5F    add         edx,0FFFFFFBF
 00597C62    sub         edx,6
>00597C65    jb          00597CA0
 00597C67    add         edx,0FFFFFFE6
 00597C6A    sub         edx,6
>00597C6D    jb          00597CA0
>00597C6F    jmp         00598050
 00597C74    inc         dword ptr [ebp-8]
 00597C77    cmp         dword ptr [ebp-8],4
>00597C7B    jge         00598050
 00597C81    mov         edx,dword ptr [ebp-8]
 00597C84    mov         dword ptr [ebp+edx*4-44],eax
>00597C88    jmp         00597CAA
 00597C8A    inc         dword ptr [ebp-0C]
 00597C8D    cmp         dword ptr [ebp-0C],8
>00597C91    jge         00598050
 00597C97    mov         edx,dword ptr [ebp-0C]
 00597C9A    mov         dword ptr [ebp+edx*4-38],eax
>00597C9E    jmp         00597CAA
 00597CA0    cmp         dword ptr [ebp-8],0
>00597CA4    jg          00598050
 00597CAA    inc         eax
 00597CAB    dec         dword ptr [ebp-14]
>00597CAE    jne         00597C3E
 00597CB0    mov         eax,dword ptr [ebp-8]
 00597CB3    test        eax,eax
>00597CB5    je          00597CC0
 00597CB7    sub         eax,3
>00597CBA    jne         00598050
 00597CC0    cmp         dword ptr [ebp-8],3
>00597CC4    jne         00597CE7
 00597CC6    mov         eax,dword ptr [ebp-0C]
 00597CC9    add         eax,0FFFFFFFE
 00597CCC    sub         eax,5
>00597CCF    jae         00598050
 00597CD5    mov         eax,dword ptr [ebp-0C]
 00597CD8    mov         eax,dword ptr [ebp+eax*4-38]
 00597CDC    cmp         eax,dword ptr [ebp-40]
>00597CDF    jg          00598050
>00597CE5    jmp         00597CF6
 00597CE7    mov         eax,dword ptr [ebp-0C]
 00597CEA    add         eax,0FFFFFFFE
 00597CED    sub         eax,6
>00597CF0    jae         00598050
 00597CF6    lea         eax,[ebp-48]
 00597CF9    push        eax
 00597CFA    mov         ecx,dword ptr [ebp-34]
 00597CFD    dec         ecx
 00597CFE    mov         edx,1
 00597D03    mov         eax,dword ptr [ebp-4]
 00597D06    call        @UStrCopy
 00597D0B    mov         ecx,dword ptr [ebp-48]
 00597D0E    lea         eax,[ebp-44]
 00597D11    mov         edx,5980B0;'$'
 00597D16    call        @UStrCat3
 00597D1B    mov         eax,dword ptr [ebp-44]
 00597D1E    or          edx,0FFFFFFFF
 00597D21    call        IndyStrToInt
 00597D26    mov         edi,eax
 00597D28    test        edi,edi
>00597D2A    jl          00598050
 00597D30    cmp         edi,0FFFF
>00597D36    jg          00598050
 00597D3C    lea         ecx,[ebp-4C]
 00597D3F    mov         edx,1
 00597D44    mov         eax,edi
 00597D46    call        IntToHex
 00597D4B    mov         edx,dword ptr [ebp-4C]
 00597D4E    mov         eax,esi
 00597D50    mov         ecx,598090;':'
 00597D55    call        @UStrCat3
 00597D5A    mov         byte ptr [ebp-0D],0
 00597D5E    mov         eax,dword ptr [ebp-0C]
 00597D61    sub         eax,2
>00597D64    jl          00597E38
 00597D6A    inc         eax
 00597D6B    mov         dword ptr [ebp-14],eax
 00597D6E    lea         ebx,[ebp-34]
 00597D71    mov         eax,dword ptr [ebx+4]
 00597D74    dec         eax
 00597D75    mov         edi,dword ptr [ebx]
 00597D77    cmp         eax,edi
>00597D79    jne         00597DBD
 00597D7B    cmp         byte ptr [ebp-0D],0
>00597D7F    je          00597D8D
 00597D81    mov         eax,esi
 00597D83    call        @UStrClr
>00597D88    jmp         00598050
 00597D8D    mov         byte ptr [ebp-0D],1
 00597D91    mov         eax,8
 00597D96    sub         eax,dword ptr [ebp-0C]
 00597D99    cmp         dword ptr [ebp-8],0
>00597D9D    jle         00597DA2
 00597D9F    sub         eax,2
 00597DA2    mov         edi,eax
 00597DA4    test        edi,edi
>00597DA6    jle         00597E2C
 00597DAC    mov         eax,esi
 00597DAE    mov         edx,5980C0;'0:'
 00597DB3    call        @UStrCat
 00597DB8    dec         edi
>00597DB9    jne         00597DAC
>00597DBB    jmp         00597E2C
 00597DBD    lea         eax,[ebp-54]
 00597DC0    push        eax
 00597DC1    mov         ecx,dword ptr [ebx+4]
 00597DC4    sub         ecx,edi
 00597DC6    dec         ecx
 00597DC7    mov         edx,edi
 00597DC9    inc         edx
 00597DCA    mov         eax,dword ptr [ebp-4]
 00597DCD    call        @UStrCopy
 00597DD2    mov         ecx,dword ptr [ebp-54]
 00597DD5    lea         eax,[ebp-50]
 00597DD8    mov         edx,5980B0;'$'
 00597DDD    call        @UStrCat3
 00597DE2    mov         eax,dword ptr [ebp-50]
 00597DE5    or          edx,0FFFFFFFF
 00597DE8    call        IndyStrToInt
 00597DED    mov         edi,eax
 00597DEF    test        edi,edi
>00597DF1    jl          00597DFB
 00597DF3    cmp         edi,0FFFF
>00597DF9    jle         00597E07
 00597DFB    mov         eax,esi
 00597DFD    call        @UStrClr
>00597E02    jmp         00598050
 00597E07    push        dword ptr [esi]
 00597E09    lea         ecx,[ebp-58]
 00597E0C    mov         edx,1
 00597E11    mov         eax,edi
 00597E13    call        IntToHex
 00597E18    push        dword ptr [ebp-58]
 00597E1B    push        598090;':'
 00597E20    mov         eax,esi
 00597E22    mov         edx,3
 00597E27    call        @UStrCatN
 00597E2C    add         ebx,4
 00597E2F    dec         dword ptr [ebp-14]
>00597E32    jne         00597D71
 00597E38    cmp         dword ptr [ebp-8],0
>00597E3C    jne         00597EB1
 00597E3E    lea         eax,[ebp-60]
 00597E41    push        eax
 00597E42    mov         eax,dword ptr [ebp-0C]
 00597E45    mov         edx,dword ptr [ebp+eax*4-38]
 00597E49    inc         edx
 00597E4A    mov         ecx,7FFFFFFF
 00597E4F    mov         eax,dword ptr [ebp-4]
 00597E52    call        @UStrCopy
 00597E57    mov         ecx,dword ptr [ebp-60]
 00597E5A    lea         eax,[ebp-5C]
 00597E5D    mov         edx,5980B0;'$'
 00597E62    call        @UStrCat3
 00597E67    mov         eax,dword ptr [ebp-5C]
 00597E6A    or          edx,0FFFFFFFF
 00597E6D    call        IndyStrToInt
 00597E72    mov         edi,eax
 00597E74    test        edi,edi
>00597E76    jl          00597E80
 00597E78    cmp         edi,0FFFF
>00597E7E    jle         00597E8C
 00597E80    mov         eax,esi
 00597E82    call        @UStrClr
>00597E87    jmp         00598050
 00597E8C    push        dword ptr [esi]
 00597E8E    lea         ecx,[ebp-64]
 00597E91    mov         edx,1
 00597E96    mov         eax,edi
 00597E98    call        IntToHex
 00597E9D    push        dword ptr [ebp-64]
 00597EA0    push        598090;':'
 00597EA5    mov         eax,esi
 00597EA7    mov         edx,3
 00597EAC    call        @UStrCatN
 00597EB1    cmp         dword ptr [ebp-8],0
>00597EB5    jle         0059802F
 00597EBB    lea         eax,[ebp-68]
 00597EBE    push        eax
 00597EBF    mov         eax,dword ptr [ebp-0C]
 00597EC2    mov         ebx,dword ptr [ebp+eax*4-38]
 00597EC6    mov         ecx,dword ptr [ebp-40]
 00597EC9    sub         ecx,ebx
 00597ECB    dec         ecx
 00597ECC    mov         edx,ebx
 00597ECE    inc         edx
 00597ECF    mov         eax,dword ptr [ebp-4]
 00597ED2    call        @UStrCopy
 00597ED7    mov         eax,dword ptr [ebp-68]
 00597EDA    or          edx,0FFFFFFFF
 00597EDD    call        IndyStrToInt
 00597EE2    mov         edi,eax
 00597EE4    test        edi,edi
>00597EE6    jl          00597EF0
 00597EE8    cmp         edi,0FF
>00597EEE    jle         00597EFC
 00597EF0    mov         eax,esi
 00597EF2    call        @UStrClr
>00597EF7    jmp         00598050
 00597EFC    lea         ecx,[ebp-6C]
 00597EFF    mov         edx,2
 00597F04    mov         eax,edi
 00597F06    call        IntToHex
 00597F0B    mov         edx,dword ptr [ebp-6C]
 00597F0E    mov         eax,esi
 00597F10    call        @UStrCat
 00597F15    lea         eax,[ebp-70]
 00597F18    push        eax
 00597F19    mov         ecx,dword ptr [ebp-3C]
 00597F1C    mov         ebx,dword ptr [ebp-40]
 00597F1F    sub         ecx,ebx
 00597F21    dec         ecx
 00597F22    mov         edx,ebx
 00597F24    inc         edx
 00597F25    mov         eax,dword ptr [ebp-4]
 00597F28    call        @UStrCopy
 00597F2D    mov         eax,dword ptr [ebp-70]
 00597F30    or          edx,0FFFFFFFF
 00597F33    call        IndyStrToInt
 00597F38    mov         edi,eax
 00597F3A    test        edi,edi
>00597F3C    jl          00597F46
 00597F3E    cmp         edi,0FF
>00597F44    jle         00597F52
 00597F46    mov         eax,esi
 00597F48    call        @UStrClr
>00597F4D    jmp         00598050
 00597F52    push        dword ptr [esi]
 00597F54    lea         ecx,[ebp-74]
 00597F57    mov         edx,2
 00597F5C    mov         eax,edi
 00597F5E    call        IntToHex
 00597F63    push        dword ptr [ebp-74]
 00597F66    push        598090;':'
 00597F6B    mov         eax,esi
 00597F6D    mov         edx,3
 00597F72    call        @UStrCatN
 00597F77    lea         eax,[ebp-78]
 00597F7A    push        eax
 00597F7B    mov         ecx,dword ptr [ebp-38]
 00597F7E    mov         ebx,dword ptr [ebp-3C]
 00597F81    sub         ecx,ebx
 00597F83    dec         ecx
 00597F84    mov         edx,ebx
 00597F86    inc         edx
 00597F87    mov         eax,dword ptr [ebp-4]
 00597F8A    call        @UStrCopy
 00597F8F    mov         eax,dword ptr [ebp-78]
 00597F92    or          edx,0FFFFFFFF
 00597F95    call        IndyStrToInt
 00597F9A    mov         edi,eax
 00597F9C    test        edi,edi
>00597F9E    jl          00597FA8
 00597FA0    cmp         edi,0FF
>00597FA6    jle         00597FB4
 00597FA8    mov         eax,esi
 00597FAA    call        @UStrClr
>00597FAF    jmp         00598050
 00597FB4    lea         ecx,[ebp-7C]
 00597FB7    mov         edx,2
 00597FBC    mov         eax,edi
 00597FBE    call        IntToHex
 00597FC3    mov         edx,dword ptr [ebp-7C]
 00597FC6    mov         eax,esi
 00597FC8    call        @UStrCat
 00597FCD    lea         eax,[ebp-80]
 00597FD0    push        eax
 00597FD1    mov         edx,dword ptr [ebp-38]
 00597FD4    inc         edx
 00597FD5    mov         ecx,3
 00597FDA    mov         eax,dword ptr [ebp-4]
 00597FDD    call        @UStrCopy
 00597FE2    mov         eax,dword ptr [ebp-80]
 00597FE5    or          edx,0FFFFFFFF
 00597FE8    call        IndyStrToInt
 00597FED    mov         edi,eax
 00597FEF    test        edi,edi
>00597FF1    jl          00597FFB
 00597FF3    cmp         edi,0FF
>00597FF9    jle         00598004
 00597FFB    mov         eax,esi
 00597FFD    call        @UStrClr
>00598002    jmp         00598050
 00598004    push        dword ptr [esi]
 00598006    lea         ecx,[ebp-84]
 0059800C    mov         edx,2
 00598011    mov         eax,edi
 00598013    call        IntToHex
 00598018    push        dword ptr [ebp-84]
 0059801E    push        598090;':'
 00598023    mov         eax,esi
 00598025    mov         edx,3
 0059802A    call        @UStrCatN
 0059802F    mov         eax,dword ptr [esi]
 00598031    mov         dword ptr [ebp-88],eax
 00598037    mov         eax,dword ptr [ebp-88]
 0059803D    test        eax,eax
>0059803F    je          00598046
 00598041    sub         eax,4
 00598044    mov         eax,dword ptr [eax]
 00598046    mov         edx,eax
 00598048    dec         edx
 00598049    mov         eax,esi
 0059804B    call        @UStrSetLength
 00598050    xor         eax,eax
 00598052    pop         edx
 00598053    pop         ecx
 00598054    pop         ecx
 00598055    mov         dword ptr fs:[eax],edx
 00598058    push        59807D
 0059805D    lea         eax,[ebp-84]
 00598063    mov         edx,11
 00598068    call        @UStrArrayClr
 0059806D    lea         eax,[ebp-4]
 00598070    call        @UStrClr
 00598075    ret
>00598076    jmp         @HandleFinally
>0059807B    jmp         0059805D
 0059807D    pop         edi
 0059807E    pop         esi
 0059807F    pop         ebx
 00598080    mov         esp,ebp
 00598082    pop         ebp
 00598083    ret
*}
end;

//005980C8
procedure IPv6ToIdIPv6Address(const AIPAddress:UnicodeString; var VAddress:TIdIPv6Address);
begin
{*
 005980C8    push        ebp
 005980C9    mov         ebp,esp
 005980CB    add         esp,0FFFFFFF0
 005980CE    push        ebx
 005980CF    xor         ecx,ecx
 005980D1    mov         dword ptr [ebp-10],ecx
 005980D4    mov         ebx,eax
 005980D6    xor         eax,eax
 005980D8    push        ebp
 005980D9    push        598138
 005980DE    push        dword ptr fs:[eax]
 005980E1    mov         dword ptr fs:[eax],esp
 005980E4    lea         ecx,[ebp-1]
 005980E7    mov         eax,ebx
 005980E9    call        IPv6ToIdIPv6Address
 005980EE    cmp         byte ptr [ebp-1],0
>005980F2    je          00598122
 005980F4    mov         dword ptr [ebp-0C],ebx
 005980F7    mov         byte ptr [ebp-8],11
 005980FB    lea         eax,[ebp-0C]
 005980FE    push        eax
 005980FF    push        0
 00598101    lea         edx,[ebp-10]
 00598104    mov         eax,[0078D250];^SResString660:TResStringRec
 00598109    call        LoadResString
 0059810E    mov         ecx,dword ptr [ebp-10]
 00598111    mov         dl,1
 00598113    mov         eax,[00597154];EIdInvalidIPv6Address
 00598118    call        Exception.CreateFmt
 0059811D    call        @RaiseExcept
 00598122    xor         eax,eax
 00598124    pop         edx
 00598125    pop         ecx
 00598126    pop         ecx
 00598127    mov         dword ptr fs:[eax],edx
 0059812A    push        59813F
 0059812F    lea         eax,[ebp-10]
 00598132    call        @UStrClr
 00598137    ret
>00598138    jmp         @HandleFinally
>0059813D    jmp         0059812F
 0059813F    pop         ebx
 00598140    mov         esp,ebp
 00598142    pop         ebp
 00598143    ret
*}
end;

//00598144
procedure IPv6ToIdIPv6Address(const AIPAddress:UnicodeString; var VAddress:TIdIPv6Address; var VErr:Boolean);
begin
{*
 00598144    push        ebp
 00598145    mov         ebp,esp
 00598147    push        0
 00598149    push        0
 0059814B    push        0
 0059814D    push        0
 0059814F    push        0
 00598151    push        ebx
 00598152    push        esi
 00598153    push        edi
 00598154    mov         ebx,ecx
 00598156    mov         dword ptr [ebp-0C],edx
 00598159    mov         esi,eax
 0059815B    xor         eax,eax
 0059815D    push        ebp
 0059815E    push        598241
 00598163    push        dword ptr fs:[eax]
 00598166    mov         dword ptr fs:[eax],esp
 00598169    lea         edx,[ebp-4]
 0059816C    mov         eax,esi
 0059816E    call        MakeCanonicalIPv6Address
 00598173    cmp         dword ptr [ebp-4],0
 00598177    sete        byte ptr [ebx]
 0059817A    cmp         byte ptr [ebx],0
>0059817D    jne         0059821E
 00598183    mov         edi,8
 00598188    mov         ebx,dword ptr [ebp-0C]
 0059818B    mov         edx,dword ptr [ebp-4]
 0059818E    mov         eax,59825C;':'
 00598193    call        dword ptr ds:[789BA0]
 00598199    mov         esi,eax
 0059819B    test        esi,esi
>0059819D    jne         005981B4
 0059819F    lea         eax,[ebp-8]
 005981A2    mov         edx,dword ptr [ebp-4]
 005981A5    call        @UStrLAsg
 005981AA    lea         eax,[ebp-4]
 005981AD    call        @UStrClr
>005981B2    jmp         005981F7
 005981B4    lea         eax,[ebp-8]
 005981B7    push        eax
 005981B8    mov         ecx,esi
 005981BA    dec         ecx
 005981BB    mov         edx,1
 005981C0    mov         eax,dword ptr [ebp-4]
 005981C3    call        @UStrCopy
 005981C8    mov         eax,59825C;':'
 005981CD    mov         dword ptr [ebp-10],eax
 005981D0    cmp         dword ptr [ebp-10],0
>005981D4    je          005981E1
 005981D6    mov         eax,dword ptr [ebp-10]
 005981D9    sub         eax,4
 005981DC    mov         eax,dword ptr [eax]
 005981DE    mov         dword ptr [ebp-10],eax
 005981E1    lea         eax,[ebp-4]
 005981E4    push        eax
 005981E5    mov         edx,dword ptr [ebp-10]
 005981E8    add         edx,esi
 005981EA    mov         ecx,7FFFFFFF
 005981EF    mov         eax,dword ptr [ebp-4]
 005981F2    call        @UStrCopy
 005981F7    lea         eax,[ebp-14]
 005981FA    mov         ecx,dword ptr [ebp-8]
 005981FD    mov         edx,59826C;'$'
 00598202    call        @UStrCat3
 00598207    mov         eax,dword ptr [ebp-14]
 0059820A    xor         edx,edx
 0059820C    call        IndyStrToInt
 00598211    mov         word ptr [ebx],ax
 00598214    add         ebx,2
 00598217    dec         edi
>00598218    jne         0059818B
 0059821E    xor         eax,eax
 00598220    pop         edx
 00598221    pop         ecx
 00598222    pop         ecx
 00598223    mov         dword ptr fs:[eax],edx
 00598226    push        598248
 0059822B    lea         eax,[ebp-14]
 0059822E    call        @UStrClr
 00598233    lea         eax,[ebp-8]
 00598236    mov         edx,2
 0059823B    call        @UStrArrayClr
 00598240    ret
>00598241    jmp         @HandleFinally
>00598246    jmp         0059822B
 00598248    pop         edi
 00598249    pop         esi
 0059824A    pop         ebx
 0059824B    mov         esp,ebp
 0059824D    pop         ebp
 0059824E    ret
*}
end;

//00598270
function IndyMax(const AValueOne:LongInt; const AValueTwo:LongInt):LongInt;
begin
{*
 00598270    cmp         edx,eax
>00598272    jle         00598276
 00598274    mov         eax,edx
 00598276    ret
*}
end;

//00598278
function IndyMin(const AValueOne:LongInt; const AValueTwo:LongInt):LongInt;
begin
{*
 00598278    cmp         edx,eax
>0059827A    jge         0059827E
 0059827C    mov         eax,edx
 0059827E    ret
*}
end;

//00598280
function IndyMin(const AValueOne:Int64; const AValueTwo:Int64):Int64;
begin
{*
 00598280    push        ebp
 00598281    mov         ebp,esp
 00598283    add         esp,0FFFFFFF8
 00598286    mov         eax,dword ptr [ebp+10]
 00598289    mov         edx,dword ptr [ebp+14]
 0059828C    cmp         edx,dword ptr [ebp+0C]
>0059828F    jne         00598298
 00598291    cmp         eax,dword ptr [ebp+8]
>00598294    jbe         005982A8
>00598296    jmp         0059829A
>00598298    jle         005982A8
 0059829A    mov         eax,dword ptr [ebp+8]
 0059829D    mov         dword ptr [ebp-8],eax
 005982A0    mov         eax,dword ptr [ebp+0C]
 005982A3    mov         dword ptr [ebp-4],eax
>005982A6    jmp         005982B4
 005982A8    mov         eax,dword ptr [ebp+10]
 005982AB    mov         dword ptr [ebp-8],eax
 005982AE    mov         eax,dword ptr [ebp+14]
 005982B1    mov         dword ptr [ebp-4],eax
 005982B4    mov         eax,dword ptr [ebp-8]
 005982B7    mov         edx,dword ptr [ebp-4]
 005982BA    pop         ecx
 005982BB    pop         ecx
 005982BC    pop         ebp
 005982BD    ret         10
*}
end;

//005982C0
function SBPos(const Substr:UnicodeString; const S:UnicodeString):LongInt;
begin
{*
 005982C0    call        Pos
 005982C5    ret
*}
end;

//005982C8
function InternalAnsiPos(const Substr:UnicodeString; const S:UnicodeString):LongInt;
begin
{*
 005982C8    call        AnsiPos
 005982CD    ret
*}
end;

//005982D0
procedure IndySleep(ATime:LongWord);
begin
{*
 005982D0    push        eax
 005982D1    call        kernel32.Sleep
 005982D6    ret
*}
end;

//005982D8
procedure SetThreadName(const AName:UnicodeString; AThreadID:LongWord);
begin
{*
 005982D8    push        ebp
 005982D9    mov         ebp,esp
 005982DB    push        0
 005982DD    push        ebx
 005982DE    push        esi
 005982DF    mov         esi,edx
 005982E1    mov         ebx,eax
 005982E3    xor         eax,eax
 005982E5    push        ebp
 005982E6    push        598320
 005982EB    push        dword ptr fs:[eax]
 005982EE    mov         dword ptr fs:[eax],esp
 005982F1    lea         eax,[ebp-4]
 005982F4    mov         edx,ebx
 005982F6    mov         ecx,0
 005982FB    call        @LStrFromUStr
 00598300    mov         eax,dword ptr [ebp-4]
 00598303    mov         edx,esi
 00598305    call        TThread.NameThreadForDebugging
 0059830A    xor         eax,eax
 0059830C    pop         edx
 0059830D    pop         ecx
 0059830E    pop         ecx
 0059830F    mov         dword ptr fs:[eax],edx
 00598312    push        598327
 00598317    lea         eax,[ebp-4]
 0059831A    call        @LStrClr
 0059831F    ret
>00598320    jmp         @HandleFinally
>00598325    jmp         00598317
 00598327    pop         esi
 00598328    pop         ebx
 00598329    pop         ecx
 0059832A    pop         ebp
 0059832B    ret
*}
end;

//0059832C
function IndyLength(const ABuffer:UnicodeString; const ALength:Integer; const AIndex:Integer):Integer;
begin
{*
 0059832C    push        ebx
 0059832D    push        esi
 0059832E    push        edi
 0059832F    mov         ebx,ecx
 00598331    mov         esi,edx
 00598333    mov         edi,eax
 00598335    cmp         ebx,1
>00598338    jge         0059834E
 0059833A    mov         ecx,1238
 0059833F    mov         edx,598384;'C:\Builds\TP\indysockets\lib\system\IdGlobal.pas'
 00598344    mov         eax,5983F4;'Assertion failure'
 00598349    call        @Assert
 0059834E    mov         eax,edi
 00598350    test        eax,eax
>00598352    je          00598359
 00598354    sub         eax,4
 00598357    mov         eax,dword ptr [eax]
 00598359    mov         edx,eax
 0059835B    sub         edx,ebx
 0059835D    inc         edx
 0059835E    test        edx,edx
>00598360    jge         00598366
 00598362    xor         eax,eax
>00598364    jmp         00598368
 00598366    mov         eax,edx
 00598368    test        esi,esi
>0059836A    jl          00598372
 0059836C    cmp         esi,eax
>0059836E    jge         00598372
 00598370    mov         eax,esi
 00598372    pop         edi
 00598373    pop         esi
 00598374    pop         ebx
 00598375    ret
*}
end;

//00598418
function IndyLength(const ABuffer:TBytes; const ALength:Integer; const AIndex:Integer):Integer;
begin
{*
 00598418    push        ebx
 00598419    push        esi
 0059841A    push        edi
 0059841B    mov         ebx,ecx
 0059841D    mov         esi,edx
 0059841F    mov         edi,eax
 00598421    test        ebx,ebx
>00598423    jge         00598439
 00598425    mov         ecx,1246
 0059842A    mov         edx,598464;'C:\Builds\TP\indysockets\lib\system\IdGlobal.pas'
 0059842F    mov         eax,5984D4;'Assertion failure'
 00598434    call        @Assert
 00598439    mov         eax,edi
 0059843B    call        @DynArrayLength
 00598440    sub         eax,ebx
 00598442    test        eax,eax
>00598444    jge         00598448
 00598446    xor         eax,eax
 00598448    test        esi,esi
>0059844A    jl          00598452
 0059844C    cmp         esi,eax
>0059844E    jge         00598452
 00598450    mov         eax,esi
 00598452    pop         edi
 00598453    pop         esi
 00598454    pop         ebx
 00598455    ret
*}
end;

//00598674
function IndyFormat(const AFormat:UnicodeString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1):UnicodeString;
begin
{*
 00598674    push        ebp
 00598675    mov         ebp,esp
 00598677    add         esp,0FFFFFE74
 0059867D    push        ebx
 0059867E    push        esi
 0059867F    push        edi
 00598680    mov         dword ptr [ebp-18C],ecx
 00598686    mov         edi,edx
 00598688    mov         esi,eax
 0059868A    lea         eax,[ebp-0C4]
 00598690    mov         edx,dword ptr ds:[41AB24];TFormatSettings
 00598696    call        @InitializeRecord
 0059869B    lea         eax,[ebp-188]
 005986A1    mov         edx,dword ptr ds:[41AB24];TFormatSettings
 005986A7    call        @InitializeRecord
 005986AC    mov         ebx,789BC8;^'Jan'
 005986B1    xor         eax,eax
 005986B3    push        ebp
 005986B4    push        598A14
 005986B9    push        dword ptr fs:[eax]
 005986BC    mov         dword ptr fs:[eax],esp
 005986BF    mov         byte ptr [ebp-184],0
 005986C6    mov         byte ptr [ebp-0C6],0
 005986CD    lea         eax,[ebp-188]
 005986D3    mov         edx,598A30;'$'
 005986D8    call        @UStrLAsg
 005986DD    mov         byte ptr [ebp-183],2
 005986E4    mov         word ptr [ebp-0CC],2C
 005986ED    mov         word ptr [ebp-0CA],2E
 005986F6    mov         word ptr [ebp-182],2F
 005986FF    lea         eax,[ebp-17C]
 00598705    mov         edx,598A40;'M/d/yyyy'
 0059870A    call        @UStrLAsg
 0059870F    lea         eax,[ebp-178]
 00598715    mov         edx,598A60;'dddd, MMMM dd, yyyy'
 0059871A    call        @UStrLAsg
 0059871F    mov         word ptr [ebp-180],3A
 00598728    lea         eax,[ebp-174]
 0059872E    mov         edx,598A94;'AM'
 00598733    call        @UStrLAsg
 00598738    lea         eax,[ebp-170]
 0059873E    mov         edx,598AA8;^TStatusPanel.ParentBiDiModeChanged
 00598743    call        @UStrLAsg
 00598748    lea         eax,[ebp-168]
 0059874E    mov         edx,598ABC;'h:mm:ss AMPM'
 00598753    call        @UStrLAsg
 00598758    lea         eax,[ebp-16C]
 0059875E    mov         edx,598AE4;'h:mm AMPM'
 00598763    call        @UStrLAsg
 00598768    lea         eax,[ebp-164]
 0059876E    mov         edx,dword ptr [ebx]
 00598770    call        @UStrLAsg
 00598775    lea         eax,[ebp-160]
 0059877B    mov         edx,dword ptr [ebx+4]
 0059877E    call        @UStrLAsg
 00598783    lea         eax,[ebp-15C]
 00598789    mov         edx,dword ptr [ebx+8]
 0059878C    call        @UStrLAsg
 00598791    lea         eax,[ebp-158]
 00598797    mov         edx,dword ptr [ebx+0C]
 0059879A    call        @UStrLAsg
 0059879F    lea         eax,[ebp-154]
 005987A5    mov         edx,dword ptr [ebx+10]
 005987A8    call        @UStrLAsg
 005987AD    lea         eax,[ebp-150]
 005987B3    mov         edx,dword ptr [ebx+14]
 005987B6    call        @UStrLAsg
 005987BB    lea         eax,[ebp-14C]
 005987C1    mov         edx,dword ptr [ebx+18]
 005987C4    call        @UStrLAsg
 005987C9    lea         eax,[ebp-148]
 005987CF    mov         edx,dword ptr [ebx+1C]
 005987D2    call        @UStrLAsg
 005987D7    lea         eax,[ebp-144]
 005987DD    mov         edx,dword ptr [ebx+20]
 005987E0    call        @UStrLAsg
 005987E5    lea         eax,[ebp-140]
 005987EB    mov         edx,dword ptr [ebx+24]
 005987EE    call        @UStrLAsg
 005987F3    lea         eax,[ebp-13C]
 005987F9    mov         edx,dword ptr [ebx+28]
 005987FC    call        @UStrLAsg
 00598801    lea         eax,[ebp-138]
 00598807    mov         edx,dword ptr [ebx+2C]
 0059880A    call        @UStrLAsg
 0059880F    lea         eax,[ebp-134]
 00598815    mov         edx,598B04;'January'
 0059881A    call        @UStrLAsg
 0059881F    lea         eax,[ebp-130]
 00598825    mov         edx,598B20;'February'
 0059882A    call        @UStrLAsg
 0059882F    lea         eax,[ebp-12C]
 00598835    mov         edx,598B40;'March'
 0059883A    call        @UStrLAsg
 0059883F    lea         eax,[ebp-128]
 00598845    mov         edx,598B58;'April'
 0059884A    call        @UStrLAsg
 0059884F    lea         eax,[ebp-124]
 00598855    mov         edx,598B70;'May'
 0059885A    call        @UStrLAsg
 0059885F    lea         eax,[ebp-120]
 00598865    mov         edx,598B84;'June'
 0059886A    call        @UStrLAsg
 0059886F    lea         eax,[ebp-11C]
 00598875    mov         edx,598B9C;'July'
 0059887A    call        @UStrLAsg
 0059887F    lea         eax,[ebp-118]
 00598885    mov         edx,598BB4;'August'
 0059888A    call        @UStrLAsg
 0059888F    lea         eax,[ebp-114]
 00598895    mov         edx,598BD0;'September'
 0059889A    call        @UStrLAsg
 0059889F    lea         eax,[ebp-110]
 005988A5    mov         edx,598BF0;'October'
 005988AA    call        @UStrLAsg
 005988AF    lea         eax,[ebp-10C]
 005988B5    mov         edx,598C0C;'November'
 005988BA    call        @UStrLAsg
 005988BF    lea         eax,[ebp-108]
 005988C5    mov         edx,598C2C;'December'
 005988CA    call        @UStrLAsg
 005988CF    lea         eax,[ebp-104]
 005988D5    mov         edx,dword ptr ds:[789BAC];^'Sun'
 005988DB    call        @UStrLAsg
 005988E0    lea         eax,[ebp-100]
 005988E6    mov         edx,dword ptr ds:[789BB0];^'Mon'
 005988EC    call        @UStrLAsg
 005988F1    lea         eax,[ebp-0FC]
 005988F7    mov         edx,dword ptr ds:[789BB4];^'Tue'
 005988FD    call        @UStrLAsg
 00598902    lea         eax,[ebp-0F8]
 00598908    mov         edx,dword ptr ds:[789BB8];^'Wed'
 0059890E    call        @UStrLAsg
 00598913    lea         eax,[ebp-0F4]
 00598919    mov         edx,dword ptr ds:[789BBC];^'Thu'
 0059891F    call        @UStrLAsg
 00598924    lea         eax,[ebp-0F0]
 0059892A    mov         edx,dword ptr ds:[789BC0];^'Fri'
 00598930    call        @UStrLAsg
 00598935    lea         eax,[ebp-0EC]
 0059893B    mov         edx,dword ptr ds:[789BC4];^'Sat'
 00598941    call        @UStrLAsg
 00598946    lea         eax,[ebp-0E8]
 0059894C    mov         edx,598C4C;'Sunday'
 00598951    call        @UStrLAsg
 00598956    lea         eax,[ebp-0E4]
 0059895C    mov         edx,598C68;'Monday'
 00598961    call        @UStrLAsg
 00598966    lea         eax,[ebp-0E0]
 0059896C    mov         edx,598C84;'Tuesday'
 00598971    call        @UStrLAsg
 00598976    lea         eax,[ebp-0DC]
 0059897C    mov         edx,598CA0;'Wednesday'
 00598981    call        @UStrLAsg
 00598986    lea         eax,[ebp-0D8]
 0059898C    mov         edx,598CC0;'Thursday'
 00598991    call        @UStrLAsg
 00598996    lea         eax,[ebp-0D4]
 0059899C    mov         edx,598CE0;'Friday'
 005989A1    call        @UStrLAsg
 005989A6    lea         eax,[ebp-0D0]
 005989AC    mov         edx,598CFC;'Saturday'
 005989B1    call        @UStrLAsg
 005989B6    mov         word ptr [ebp-17E],2C
 005989BF    lea         eax,[ebp-0C4]
 005989C5    lea         edx,[ebp-188]
 005989CB    mov         ecx,dword ptr ds:[41AB24];TFormatSettings
 005989D1    call        @CopyRecord
 005989D6    lea         eax,[ebp-0C4]
 005989DC    push        eax
 005989DD    mov         eax,dword ptr [ebp+8]
 005989E0    push        eax
 005989E1    mov         edx,edi
 005989E3    mov         ecx,dword ptr [ebp-18C]
 005989E9    mov         eax,esi
 005989EB    call        Format
 005989F0    xor         eax,eax
 005989F2    pop         edx
 005989F3    pop         ecx
 005989F4    pop         ecx
 005989F5    mov         dword ptr fs:[eax],edx
 005989F8    push        598A1B
 005989FD    lea         eax,[ebp-188]
 00598A03    mov         edx,dword ptr ds:[41AB24];TFormatSettings
 00598A09    mov         ecx,2
 00598A0E    call        @FinalizeArray
 00598A13    ret
>00598A14    jmp         @HandleFinally
>00598A19    jmp         005989FD
 00598A1B    pop         edi
 00598A1C    pop         esi
 00598A1D    pop         ebx
 00598A1E    mov         esp,ebp
 00598A20    pop         ebp
 00598A21    ret         4
*}
end;

//00598D10
function ReplaceOnlyFirst(const S:UnicodeString; const OldPattern:UnicodeString; const NewPattern:UnicodeString):UnicodeString;
begin
{*
 00598D10    push        ebp
 00598D11    mov         ebp,esp
 00598D13    push        ebx
 00598D14    push        esi
 00598D15    push        edi
 00598D16    mov         edi,ecx
 00598D18    mov         esi,edx
 00598D1A    mov         ebx,eax
 00598D1C    movzx       eax,byte ptr ds:[598D3C]
 00598D23    push        eax
 00598D24    mov         eax,dword ptr [ebp+8]
 00598D27    push        eax
 00598D28    mov         ecx,edi
 00598D2A    mov         edx,esi
 00598D2C    mov         eax,ebx
 00598D2E    call        StringReplace
 00598D33    pop         edi
 00598D34    pop         esi
 00598D35    pop         ebx
 00598D36    pop         ebp
 00598D37    ret         4
*}
end;

//00598D40
function IndyStrToInt(const S:UnicodeString):Integer;
begin
{*
 00598D40    push        ebp
 00598D41    mov         ebp,esp
 00598D43    push        0
 00598D45    push        ebx
 00598D46    mov         ebx,eax
 00598D48    xor         eax,eax
 00598D4A    push        ebp
 00598D4B    push        598D80
 00598D50    push        dword ptr fs:[eax]
 00598D53    mov         dword ptr fs:[eax],esp
 00598D56    lea         edx,[ebp-4]
 00598D59    mov         eax,ebx
 00598D5B    call        Trim
 00598D60    mov         eax,dword ptr [ebp-4]
 00598D63    call        StrToInt
 00598D68    mov         ebx,eax
 00598D6A    xor         eax,eax
 00598D6C    pop         edx
 00598D6D    pop         ecx
 00598D6E    pop         ecx
 00598D6F    mov         dword ptr fs:[eax],edx
 00598D72    push        598D87
 00598D77    lea         eax,[ebp-4]
 00598D7A    call        @UStrClr
 00598D7F    ret
>00598D80    jmp         @HandleFinally
>00598D85    jmp         00598D77
 00598D87    mov         eax,ebx
 00598D89    pop         ebx
 00598D8A    pop         ecx
 00598D8B    pop         ebp
 00598D8C    ret
*}
end;

//00598D90
function IndyStrToInt(const S:UnicodeString; ADefault:Integer):Integer;
begin
{*
 00598D90    push        ebp
 00598D91    mov         ebp,esp
 00598D93    push        0
 00598D95    push        ebx
 00598D96    push        esi
 00598D97    mov         esi,edx
 00598D99    mov         ebx,eax
 00598D9B    xor         eax,eax
 00598D9D    push        ebp
 00598D9E    push        598DD5
 00598DA3    push        dword ptr fs:[eax]
 00598DA6    mov         dword ptr fs:[eax],esp
 00598DA9    lea         edx,[ebp-4]
 00598DAC    mov         eax,ebx
 00598DAE    call        Trim
 00598DB3    mov         eax,dword ptr [ebp-4]
 00598DB6    mov         edx,esi
 00598DB8    call        StrToIntDef
 00598DBD    mov         ebx,eax
 00598DBF    xor         eax,eax
 00598DC1    pop         edx
 00598DC2    pop         ecx
 00598DC3    pop         ecx
 00598DC4    mov         dword ptr fs:[eax],edx
 00598DC7    push        598DDC
 00598DCC    lea         eax,[ebp-4]
 00598DCF    call        @UStrClr
 00598DD4    ret
>00598DD5    jmp         @HandleFinally
>00598DDA    jmp         00598DCC
 00598DDC    mov         eax,ebx
 00598DDE    pop         esi
 00598DDF    pop         ebx
 00598DE0    pop         ecx
 00598DE1    pop         ebp
 00598DE2    ret
*}
end;

//00598DE4
function ToBytes(const AValue:UnicodeString; ADestEncoding:TEncoding):TBytes;
begin
{*
 00598DE4    push        ebp
 00598DE5    mov         ebp,esp
 00598DE7    push        0
 00598DE9    push        ebx
 00598DEA    push        esi
 00598DEB    push        edi
 00598DEC    mov         edi,ecx
 00598DEE    mov         esi,edx
 00598DF0    mov         ebx,eax
 00598DF2    xor         eax,eax
 00598DF4    push        ebp
 00598DF5    push        598E40
 00598DFA    push        dword ptr fs:[eax]
 00598DFD    mov         dword ptr fs:[eax],esp
 00598E00    push        esi
 00598E01    lea         eax,[ebp-4]
 00598E04    push        eax
 00598E05    mov         ecx,1
 00598E0A    or          edx,0FFFFFFFF
 00598E0D    mov         eax,ebx
 00598E0F    call        ToBytes
 00598E14    mov         edx,dword ptr [ebp-4]
 00598E17    mov         eax,edi
 00598E19    mov         ecx,dword ptr ds:[418988];TArray<System.Byte>
 00598E1F    call        @DynArrayAsg
 00598E24    xor         eax,eax
 00598E26    pop         edx
 00598E27    pop         ecx
 00598E28    pop         ecx
 00598E29    mov         dword ptr fs:[eax],edx
 00598E2C    push        598E47
 00598E31    lea         eax,[ebp-4]
 00598E34    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00598E3A    call        @DynArrayClear
 00598E3F    ret
>00598E40    jmp         @HandleFinally
>00598E45    jmp         00598E31
 00598E47    pop         edi
 00598E48    pop         esi
 00598E49    pop         ebx
 00598E4A    pop         ecx
 00598E4B    pop         ebp
 00598E4C    ret
*}
end;

//00598E50
function ToBytes(const AValue:UnicodeString; const ALength:Integer; const AIndex:Integer; ADestEncoding:TEncoding):TBytes;
begin
{*
 00598E50    push        ebp
 00598E51    mov         ebp,esp
 00598E53    push        0
 00598E55    push        0
 00598E57    push        0
 00598E59    push        ebx
 00598E5A    push        esi
 00598E5B    mov         ebx,ecx
 00598E5D    mov         esi,edx
 00598E5F    mov         dword ptr [ebp-4],eax
 00598E62    xor         eax,eax
 00598E64    push        ebp
 00598E65    push        598F2B
 00598E6A    push        dword ptr fs:[eax]
 00598E6D    mov         dword ptr fs:[eax],esp
 00598E70    cmp         ebx,1
>00598E73    jge         00598E89
 00598E75    mov         ecx,1238
 00598E7A    mov         edx,598F48;'C:\Builds\TP\indysockets\lib\system\IdGlobal.pas'
 00598E7F    mov         eax,598FB8;'Assertion failure'
 00598E84    call        @Assert
 00598E89    mov         eax,dword ptr [ebp-4]
 00598E8C    test        eax,eax
>00598E8E    je          00598E95
 00598E90    sub         eax,4
 00598E93    mov         eax,dword ptr [eax]
 00598E95    mov         edx,eax
 00598E97    sub         edx,ebx
 00598E99    inc         edx
 00598E9A    test        edx,edx
>00598E9C    jge         00598EA2
 00598E9E    xor         eax,eax
>00598EA0    jmp         00598EA4
 00598EA2    mov         eax,edx
 00598EA4    test        esi,esi
>00598EA6    jl          00598EAE
 00598EA8    cmp         esi,eax
>00598EAA    jge         00598EAE
 00598EAC    mov         eax,esi
 00598EAE    mov         esi,eax
 00598EB0    test        esi,esi
>00598EB2    jle         00598EEF
 00598EB4    lea         eax,[ebp+0C]
 00598EB7    mov         dl,1
 00598EB9    call        EnsureEncoding
 00598EBE    lea         eax,[ebp-0C]
 00598EC1    push        eax
 00598EC2    mov         ecx,esi
 00598EC4    mov         edx,ebx
 00598EC6    mov         eax,dword ptr [ebp-4]
 00598EC9    call        @UStrCopy
 00598ECE    mov         edx,dword ptr [ebp-0C]
 00598ED1    lea         ecx,[ebp-8]
 00598ED4    mov         eax,dword ptr [ebp+0C]
 00598ED7    call        TEncoding.GetBytes
 00598EDC    mov         edx,dword ptr [ebp-8]
 00598EDF    mov         eax,dword ptr [ebp+8]
 00598EE2    mov         ecx,dword ptr ds:[418988];TArray<System.Byte>
 00598EE8    call        @DynArrayAsg
>00598EED    jmp         00598F07
 00598EEF    push        0
 00598EF1    mov         eax,dword ptr [ebp+8]
 00598EF4    mov         ecx,1
 00598EF9    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00598EFF    call        @DynArraySetLength
 00598F04    add         esp,4
 00598F07    xor         eax,eax
 00598F09    pop         edx
 00598F0A    pop         ecx
 00598F0B    pop         ecx
 00598F0C    mov         dword ptr fs:[eax],edx
 00598F0F    push        598F32
 00598F14    lea         eax,[ebp-0C]
 00598F17    call        @UStrClr
 00598F1C    lea         eax,[ebp-8]
 00598F1F    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00598F25    call        @DynArrayClear
 00598F2A    ret
>00598F2B    jmp         @HandleFinally
>00598F30    jmp         00598F14
 00598F32    pop         esi
 00598F33    pop         ebx
 00598F34    mov         esp,ebp
 00598F36    pop         ebp
 00598F37    ret         8
*}
end;

//00598FDC
function ToBytes(const AValue:Char; ADestEncoding:TEncoding):TBytes;
begin
{*
 00598FDC    push        ebp
 00598FDD    mov         ebp,esp
 00598FDF    push        0
 00598FE1    push        0
 00598FE3    push        0
 00598FE5    push        ebx
 00598FE6    push        esi
 00598FE7    mov         esi,ecx
 00598FE9    mov         dword ptr [ebp-8],edx
 00598FEC    mov         ebx,eax
 00598FEE    xor         eax,eax
 00598FF0    push        ebp
 00598FF1    push        59906C
 00598FF6    push        dword ptr fs:[eax]
 00598FF9    mov         dword ptr fs:[eax],esp
 00598FFC    lea         eax,[ebp-8]
 00598FFF    mov         dl,1
 00599001    call        EnsureEncoding
 00599006    push        1
 00599008    lea         eax,[ebp-4]
 0059900B    mov         ecx,1
 00599010    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 00599016    call        @DynArraySetLength
 0059901B    add         esp,4
 0059901E    mov         eax,dword ptr [ebp-4]
 00599021    mov         word ptr [eax],bx
 00599024    lea         ecx,[ebp-0C]
 00599027    mov         edx,dword ptr [ebp-4]
 0059902A    mov         eax,dword ptr [ebp-8]
 0059902D    call        TEncoding.GetBytes
 00599032    mov         edx,dword ptr [ebp-0C]
 00599035    mov         eax,esi
 00599037    mov         ecx,dword ptr ds:[418988];TArray<System.Byte>
 0059903D    call        @DynArrayAsg
 00599042    xor         eax,eax
 00599044    pop         edx
 00599045    pop         ecx
 00599046    pop         ecx
 00599047    mov         dword ptr fs:[eax],edx
 0059904A    push        599073
 0059904F    lea         eax,[ebp-0C]
 00599052    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00599058    call        @DynArrayClear
 0059905D    lea         eax,[ebp-4]
 00599060    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 00599066    call        @DynArrayClear
 0059906B    ret
>0059906C    jmp         @HandleFinally
>00599071    jmp         0059904F
 00599073    pop         esi
 00599074    pop         ebx
 00599075    mov         esp,ebp
 00599077    pop         ebp
 00599078    ret
*}
end;

//0059907C
function ToBytes(const AValue:Int64):TBytes;
begin
{*
 0059907C    push        ebp
 0059907D    mov         ebp,esp
 0059907F    push        ebx
 00599080    mov         ebx,eax
 00599082    push        8
 00599084    mov         eax,ebx
 00599086    mov         ecx,1
 0059908B    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00599091    call        @DynArraySetLength
 00599096    add         esp,4
 00599099    mov         eax,dword ptr [ebx]
 0059909B    mov         edx,dword ptr [ebp+8]
 0059909E    mov         dword ptr [eax],edx
 005990A0    mov         edx,dword ptr [ebp+0C]
 005990A3    mov         dword ptr [eax+4],edx
 005990A6    pop         ebx
 005990A7    pop         ebp
 005990A8    ret         8
*}
end;

//005990AC
function ToBytes(const AValue:LongWord):TBytes;
begin
{*
 005990AC    push        ebx
 005990AD    push        esi
 005990AE    mov         ebx,edx
 005990B0    mov         esi,eax
 005990B2    push        4
 005990B4    mov         eax,ebx
 005990B6    mov         ecx,1
 005990BB    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005990C1    call        @DynArraySetLength
 005990C6    add         esp,4
 005990C9    mov         eax,dword ptr [ebx]
 005990CB    mov         dword ptr [eax],esi
 005990CD    pop         esi
 005990CE    pop         ebx
 005990CF    ret
*}
end;

//005990D0
function ToBytes(const AValue:LongInt):TBytes;
begin
{*
 005990D0    push        ebx
 005990D1    push        esi
 005990D2    mov         ebx,edx
 005990D4    mov         esi,eax
 005990D6    push        4
 005990D8    mov         eax,ebx
 005990DA    mov         ecx,1
 005990DF    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005990E5    call        @DynArraySetLength
 005990EA    add         esp,4
 005990ED    mov         eax,dword ptr [ebx]
 005990EF    mov         dword ptr [eax],esi
 005990F1    pop         esi
 005990F2    pop         ebx
 005990F3    ret
*}
end;

//005990F4
function ToBytes(const AValue:SHORT):TBytes;
begin
{*
 005990F4    push        ebx
 005990F5    push        esi
 005990F6    mov         ebx,edx
 005990F8    mov         esi,eax
 005990FA    push        2
 005990FC    mov         eax,ebx
 005990FE    mov         ecx,1
 00599103    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00599109    call        @DynArraySetLength
 0059910E    add         esp,4
 00599111    mov         eax,dword ptr [ebx]
 00599113    mov         word ptr [eax],si
 00599116    pop         esi
 00599117    pop         ebx
 00599118    ret
*}
end;

//0059911C
function ToBytes(const AValue:Word):TBytes;
begin
{*
 0059911C    push        ebx
 0059911D    push        esi
 0059911E    mov         ebx,edx
 00599120    mov         esi,eax
 00599122    push        2
 00599124    mov         eax,ebx
 00599126    mov         ecx,1
 0059912B    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00599131    call        @DynArraySetLength
 00599136    add         esp,4
 00599139    mov         eax,dword ptr [ebx]
 0059913B    mov         word ptr [eax],si
 0059913E    pop         esi
 0059913F    pop         ebx
 00599140    ret
*}
end;

//00599144
function ToBytes(const AValue:Byte):TBytes;
begin
{*
 00599144    push        ebx
 00599145    push        esi
 00599146    mov         esi,edx
 00599148    mov         ebx,eax
 0059914A    push        1
 0059914C    mov         eax,esi
 0059914E    mov         ecx,1
 00599153    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00599159    call        @DynArraySetLength
 0059915E    add         esp,4
 00599161    mov         eax,dword ptr [esi]
 00599163    mov         byte ptr [eax],bl
 00599165    pop         esi
 00599166    pop         ebx
 00599167    ret
*}
end;

//00599168
function ToBytes(const AValue:TBytes; const ASize:Integer; const AIndex:Integer):TBytes;
begin
{*
 00599168    push        ebp
 00599169    mov         ebp,esp
 0059916B    add         esp,0FFFFFFF8
 0059916E    push        ebx
 0059916F    push        esi
 00599170    xor         ebx,ebx
 00599172    mov         dword ptr [ebp-4],ebx
 00599175    mov         esi,ecx
 00599177    mov         ebx,edx
 00599179    mov         dword ptr [ebp-8],eax
 0059917C    xor         eax,eax
 0059917E    push        ebp
 0059917F    push        599257
 00599184    push        dword ptr fs:[eax]
 00599187    mov         dword ptr fs:[eax],esp
 0059918A    test        esi,esi
>0059918C    jge         005991A2
 0059918E    mov         ecx,1246
 00599193    mov         edx,599274;'C:\Builds\TP\indysockets\lib\system\IdGlobal.pas'
 00599198    mov         eax,5992E4;'Assertion failure'
 0059919D    call        @Assert
 005991A2    mov         eax,dword ptr [ebp-8]
 005991A5    call        @DynArrayLength
 005991AA    sub         eax,esi
 005991AC    test        eax,eax
>005991AE    jge         005991B2
 005991B0    xor         eax,eax
 005991B2    test        ebx,ebx
>005991B4    jl          005991BC
 005991B6    cmp         ebx,eax
>005991B8    jge         005991BC
 005991BA    mov         eax,ebx
 005991BC    mov         ebx,eax
 005991BE    push        ebx
 005991BF    mov         eax,dword ptr [ebp+8]
 005991C2    mov         ecx,1
 005991C7    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005991CD    call        @DynArraySetLength
 005991D2    add         esp,4
 005991D5    test        ebx,ebx
>005991D7    jle         0059923B
 005991D9    lea         eax,[ebp-4]
 005991DC    mov         edx,dword ptr [ebp-8]
 005991DF    mov         ecx,dword ptr ds:[418988];TArray<System.Byte>
 005991E5    call        @DynArrayAsg
 005991EA    test        esi,esi
>005991EC    jge         00599202
 005991EE    mov         ecx,0BEC
 005991F3    mov         edx,599274;'C:\Builds\TP\indysockets\lib\system\IdGlobal.pas'
 005991F8    mov         eax,5992E4;'Assertion failure'
 005991FD    call        @Assert
 00599202    mov         eax,dword ptr [ebp-4]
 00599205    call        @DynArrayLength
 0059920A    lea         edx,[ebx+esi]
 0059920D    cmp         eax,edx
>0059920F    jge         00599225
 00599211    mov         ecx,0BED
 00599216    mov         edx,599274;'C:\Builds\TP\indysockets\lib\system\IdGlobal.pas'
 0059921B    mov         eax,5992E4;'Assertion failure'
 00599220    call        @Assert
 00599225    mov         eax,dword ptr [ebp+8]
 00599228    mov         eax,dword ptr [eax]
 0059922A    xor         edx,edx
 0059922C    lea         edx,[eax+edx]
 0059922F    mov         eax,dword ptr [ebp-4]
 00599232    add         eax,esi
 00599234    mov         ecx,ebx
 00599236    call        Move
 0059923B    xor         eax,eax
 0059923D    pop         edx
 0059923E    pop         ecx
 0059923F    pop         ecx
 00599240    mov         dword ptr fs:[eax],edx
 00599243    push        59925E
 00599248    lea         eax,[ebp-4]
 0059924B    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00599251    call        @DynArrayClear
 00599256    ret
>00599257    jmp         @HandleFinally
>0059925C    jmp         00599248
 0059925E    pop         esi
 0059925F    pop         ebx
 00599260    pop         ecx
 00599261    pop         ecx
 00599262    pop         ebp
 00599263    ret         4
*}
end;

//00599308
function BytesToLongInt(const AValue:TBytes; const AIndex:Integer):LongInt;
begin
{*
 00599308    push        ebx
 00599309    push        esi
 0059930A    mov         esi,edx
 0059930C    mov         ebx,eax
 0059930E    mov         eax,ebx
 00599310    call        @DynArrayLength
 00599315    lea         edx,[esi+4]
 00599318    cmp         eax,edx
>0059931A    jge         00599330
 0059931C    mov         ecx,1559
 00599321    mov         edx,599344;'C:\Builds\TP\indysockets\lib\system\IdGlobal.pas'
 00599326    mov         eax,5993B4;'Assertion failure'
 0059932B    call        @Assert
 00599330    lea         eax,[ebx+esi]
 00599333    mov         eax,dword ptr [eax]
 00599335    pop         esi
 00599336    pop         ebx
 00599337    ret
*}
end;

//005993D8
function BytesToInt64(const AValue:TBytes; const AIndex:Integer):Int64;
begin
{*
 005993D8    push        ebx
 005993D9    push        esi
 005993DA    add         esp,0FFFFFFF8
 005993DD    mov         esi,edx
 005993DF    mov         ebx,eax
 005993E1    mov         eax,ebx
 005993E3    call        @DynArrayLength
 005993E8    lea         edx,[esi+8]
 005993EB    cmp         eax,edx
>005993ED    jge         00599403
 005993EF    mov         ecx,1564
 005993F4    mov         edx,59942C;'C:\Builds\TP\indysockets\lib\system\IdGlobal.pas'
 005993F9    mov         eax,59949C;'Assertion failure'
 005993FE    call        @Assert
 00599403    lea         eax,[ebx+esi]
 00599406    mov         edx,dword ptr [eax]
 00599408    mov         dword ptr [esp],edx
 0059940B    mov         edx,dword ptr [eax+4]
 0059940E    mov         dword ptr [esp+4],edx
 00599412    mov         eax,dword ptr [esp]
 00599415    mov         edx,dword ptr [esp+4]
 00599419    pop         ecx
 0059941A    pop         edx
 0059941B    pop         esi
 0059941C    pop         ebx
 0059941D    ret
*}
end;

//005994C0
function BytesToWord(const AValue:TBytes; const AIndex:Integer):Word;
begin
{*
 005994C0    push        ebx
 005994C1    push        esi
 005994C2    mov         esi,edx
 005994C4    mov         ebx,eax
 005994C6    mov         eax,ebx
 005994C8    call        @DynArrayLength
 005994CD    lea         edx,[esi+2]
 005994D0    cmp         eax,edx
>005994D2    jge         005994E8
 005994D4    mov         ecx,156F
 005994D9    mov         edx,599500;'C:\Builds\TP\indysockets\lib\system\IdGlobal.pas'
 005994DE    mov         eax,599570;'Assertion failure'
 005994E3    call        @Assert
 005994E8    lea         eax,[ebx+esi]
 005994EB    movzx       eax,word ptr [eax]
 005994EE    pop         esi
 005994EF    pop         ebx
 005994F0    ret
*}
end;

//00599594
function BytesToShort(const AValue:TBytes; const AIndex:Integer):SHORT;
begin
{*
 00599594    push        ebx
 00599595    push        esi
 00599596    mov         esi,edx
 00599598    mov         ebx,eax
 0059959A    mov         eax,ebx
 0059959C    call        @DynArrayLength
 005995A1    lea         edx,[esi+2]
 005995A4    cmp         eax,edx
>005995A6    jge         005995BC
 005995A8    mov         ecx,157A
 005995AD    mov         edx,5995D4;'C:\Builds\TP\indysockets\lib\system\IdGlobal.pas'
 005995B2    mov         eax,599644;'Assertion failure'
 005995B7    call        @Assert
 005995BC    lea         eax,[ebx+esi]
 005995BF    movzx       eax,word ptr [eax]
 005995C2    pop         esi
 005995C3    pop         ebx
 005995C4    ret
*}
end;

//00599668
procedure BytesToIPv6(const AValue:TBytes; var VAddress:TIdIPv6Address; const AIndex:Integer);
begin
{*
 00599668    push        ebx
 00599669    push        esi
 0059966A    push        edi
 0059966B    mov         esi,ecx
 0059966D    mov         edi,edx
 0059966F    mov         ebx,eax
 00599671    mov         eax,ebx
 00599673    call        @DynArrayLength
 00599678    lea         edx,[esi+10]
 0059967B    cmp         eax,edx
>0059967D    jge         00599693
 0059967F    mov         ecx,1594
 00599684    mov         edx,5996B4;'C:\Builds\TP\indysockets\lib\system\IdGlobal.pas'
 00599689    mov         eax,599724;'Assertion failure'
 0059968E    call        @Assert
 00599693    mov         edx,edi
 00599695    lea         eax,[ebx+esi]
 00599698    mov         ecx,10
 0059969D    call        Move
 005996A2    pop         edi
 005996A3    pop         esi
 005996A4    pop         ebx
 005996A5    ret
*}
end;

//00599748
function BytesToLongWord(const AValue:TBytes; const AIndex:Integer):LongWord;
begin
{*
 00599748    push        ebx
 00599749    push        esi
 0059974A    mov         esi,edx
 0059974C    mov         ebx,eax
 0059974E    mov         eax,ebx
 00599750    call        @DynArrayLength
 00599755    lea         edx,[esi+4]
 00599758    cmp         eax,edx
>0059975A    jge         00599770
 0059975C    mov         ecx,15A1
 00599761    mov         edx,599784;'C:\Builds\TP\indysockets\lib\system\IdGlobal.pas'
 00599766    mov         eax,5997F4;'Assertion failure'
 0059976B    call        @Assert
 00599770    lea         eax,[ebx+esi]
 00599773    mov         eax,dword ptr [eax]
 00599775    pop         esi
 00599776    pop         ebx
 00599777    ret
*}
end;

//00599818
function BytesToString(const AValue:TBytes; AByteEncoding:TEncoding):UnicodeString;
begin
{*
 00599818    push        ebx
 00599819    push        esi
 0059981A    push        edi
 0059981B    mov         edi,ecx
 0059981D    mov         esi,edx
 0059981F    mov         ebx,eax
 00599821    push        esi
 00599822    push        edi
 00599823    or          ecx,0FFFFFFFF
 00599826    xor         edx,edx
 00599828    mov         eax,ebx
 0059982A    call        BytesToString
 0059982F    pop         edi
 00599830    pop         esi
 00599831    pop         ebx
 00599832    ret
*}
end;

//00599834
function BytesToString(const AValue:TBytes; const AStartIndex:Integer; const ALength:Integer; AByteEncoding:TEncoding):UnicodeString;
begin
{*
 00599834    push        ebp
 00599835    mov         ebp,esp
 00599837    push        ecx
 00599838    push        ebx
 00599839    push        esi
 0059983A    mov         esi,ecx
 0059983C    mov         ebx,edx
 0059983E    mov         dword ptr [ebp-4],eax
 00599841    xor         eax,eax
 00599843    push        ebp
 00599844    push        5998BB
 00599849    push        dword ptr fs:[eax]
 0059984C    mov         dword ptr fs:[eax],esp
 0059984F    test        ebx,ebx
>00599851    jge         00599867
 00599853    mov         ecx,1246
 00599858    mov         edx,5998D8;'C:\Builds\TP\indysockets\lib\system\IdGlobal.pas'
 0059985D    mov         eax,599948;'Assertion failure'
 00599862    call        @Assert
 00599867    mov         eax,dword ptr [ebp-4]
 0059986A    call        @DynArrayLength
 0059986F    sub         eax,ebx
 00599871    test        eax,eax
>00599873    jge         00599877
 00599875    xor         eax,eax
 00599877    test        esi,esi
>00599879    jl          00599881
 0059987B    cmp         esi,eax
>0059987D    jge         00599881
 0059987F    mov         eax,esi
 00599881    mov         esi,eax
 00599883    test        esi,esi
>00599885    jle         005998A5
 00599887    lea         eax,[ebp+0C]
 0059988A    mov         dl,1
 0059988C    call        EnsureEncoding
 00599891    push        esi
 00599892    mov         eax,dword ptr [ebp+8]
 00599895    push        eax
 00599896    mov         ecx,ebx
 00599898    mov         edx,dword ptr [ebp-4]
 0059989B    mov         eax,dword ptr [ebp+0C]
 0059989E    call        TEncoding.GetString
>005998A3    jmp         005998AD
 005998A5    mov         eax,dword ptr [ebp+8]
 005998A8    call        @UStrClr
 005998AD    xor         eax,eax
 005998AF    pop         edx
 005998B0    pop         ecx
 005998B1    pop         ecx
 005998B2    mov         dword ptr fs:[eax],edx
 005998B5    push        5998C2
 005998BA    ret
>005998BB    jmp         @HandleFinally
>005998C0    jmp         005998BA
 005998C2    pop         esi
 005998C3    pop         ebx
 005998C4    pop         ecx
 005998C5    pop         ebp
 005998C6    ret         8
*}
end;

//0059996C
procedure WriteStringToStream(AStream:TStream; const AStr:UnicodeString; ADestEncoding:TEncoding);
begin
{*
 0059996C    push        1
 0059996E    push        ecx
 0059996F    or          ecx,0FFFFFFFF
 00599972    call        WriteStringToStream
 00599977    ret
*}
end;

//00599978
procedure WriteStringToStream(AStream:TStream; const AStr:UnicodeString; const ALength:Integer; const AIndex:Integer; ADestEncoding:TEncoding);
begin
{*
 00599978    push        ebp
 00599979    mov         ebp,esp
 0059997B    add         esp,0FFFFFFF4
 0059997E    push        ebx
 0059997F    push        esi
 00599980    xor         ebx,ebx
 00599982    mov         dword ptr [ebp-4],ebx
 00599985    mov         esi,ecx
 00599987    mov         dword ptr [ebp-0C],edx
 0059998A    mov         dword ptr [ebp-8],eax
 0059998D    mov         ebx,dword ptr [ebp+0C]
 00599990    xor         eax,eax
 00599992    push        ebp
 00599993    push        599A34
 00599998    push        dword ptr fs:[eax]
 0059999B    mov         dword ptr fs:[eax],esp
 0059999E    lea         eax,[ebp-4]
 005999A1    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005999A7    call        @DynArrayClear
 005999AC    cmp         ebx,1
>005999AF    jge         005999C5
 005999B1    mov         ecx,1238
 005999B6    mov         edx,599A50;'C:\Builds\TP\indysockets\lib\system\IdGlobal.pas'
 005999BB    mov         eax,599AC0;'Assertion failure'
 005999C0    call        @Assert
 005999C5    mov         eax,dword ptr [ebp-0C]
 005999C8    test        eax,eax
>005999CA    je          005999D1
 005999CC    sub         eax,4
 005999CF    mov         eax,dword ptr [eax]
 005999D1    mov         edx,eax
 005999D3    sub         edx,ebx
 005999D5    inc         edx
 005999D6    test        edx,edx
>005999D8    jge         005999DE
 005999DA    xor         eax,eax
>005999DC    jmp         005999E0
 005999DE    mov         eax,edx
 005999E0    test        esi,esi
>005999E2    jl          005999EA
 005999E4    cmp         esi,eax
>005999E6    jge         005999EA
 005999E8    mov         eax,esi
 005999EA    mov         esi,eax
 005999EC    test        esi,esi
>005999EE    jle         00599A18
 005999F0    mov         eax,dword ptr [ebp+8]
 005999F3    push        eax
 005999F4    lea         eax,[ebp-4]
 005999F7    push        eax
 005999F8    mov         ecx,ebx
 005999FA    mov         edx,esi
 005999FC    mov         eax,dword ptr [ebp-0C]
 005999FF    call        ToBytes
 00599A04    push        0FF
 00599A06    push        0
 00599A08    mov         ecx,dword ptr [ebp-4]
 00599A0B    mov         edx,dword ptr [ebp-8]
 00599A0E    mov         eax,[00596BE0];TIdStreamHelperVCL
 00599A13    call        TIdStreamHelperVCL.Write
 00599A18    xor         eax,eax
 00599A1A    pop         edx
 00599A1B    pop         ecx
 00599A1C    pop         ecx
 00599A1D    mov         dword ptr fs:[eax],edx
 00599A20    push        599A3B
 00599A25    lea         eax,[ebp-4]
 00599A28    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00599A2E    call        @DynArrayClear
 00599A33    ret
>00599A34    jmp         @HandleFinally
>00599A39    jmp         00599A25
 00599A3B    pop         esi
 00599A3C    pop         ebx
 00599A3D    mov         esp,ebp
 00599A3F    pop         ebp
 00599A40    ret         8
*}
end;

//00599AE4
function TextIsSame(const A1:UnicodeString; const A2:UnicodeString):Boolean;
begin
{*
 00599AE4    push        ebx
 00599AE5    push        esi
 00599AE6    mov         esi,edx
 00599AE8    mov         ebx,eax
 00599AEA    mov         edx,esi
 00599AEC    mov         eax,ebx
 00599AEE    call        AnsiCompareText
 00599AF3    test        eax,eax
 00599AF5    sete        al
 00599AF8    pop         esi
 00599AF9    pop         ebx
 00599AFA    ret
*}
end;

//00599AFC
function TextStartsWith(const S:UnicodeString; const SubS:UnicodeString):Boolean;
begin
{*
 00599AFC    push        ebx
 00599AFD    push        esi
 00599AFE    push        edi
 00599AFF    mov         edi,edx
 00599B01    mov         esi,eax
 00599B03    mov         eax,edi
 00599B05    test        eax,eax
>00599B07    je          00599B0E
 00599B09    sub         eax,4
 00599B0C    mov         eax,dword ptr [eax]
 00599B0E    mov         ebx,eax
 00599B10    mov         eax,esi
 00599B12    test        eax,eax
>00599B14    je          00599B1B
 00599B16    sub         eax,4
 00599B19    mov         eax,dword ptr [eax]
 00599B1B    cmp         eax,ebx
 00599B1D    setge       al
 00599B20    test        al,al
>00599B22    je          00599B4C
 00599B24    mov         eax,esi
 00599B26    call        @UStrToPWChar
 00599B2B    mov         esi,eax
 00599B2D    mov         eax,edi
 00599B2F    call        @UStrToPWChar
 00599B34    mov         edi,eax
 00599B36    push        ebx
 00599B37    push        edi
 00599B38    push        ebx
 00599B39    push        esi
 00599B3A    push        1
 00599B3C    push        400
 00599B41    call        kernel32.CompareStringW
 00599B46    cmp         eax,2
 00599B49    sete        al
 00599B4C    pop         edi
 00599B4D    pop         esi
 00599B4E    pop         ebx
 00599B4F    ret
*}
end;

//00599B50
function TextEndsWith(const S:UnicodeString; const SubS:UnicodeString):Boolean;
begin
{*
 00599B50    push        ebx
 00599B51    push        esi
 00599B52    push        edi
 00599B53    push        ebp
 00599B54    mov         ebp,edx
 00599B56    mov         esi,eax
 00599B58    mov         eax,ebp
 00599B5A    test        eax,eax
>00599B5C    je          00599B63
 00599B5E    sub         eax,4
 00599B61    mov         eax,dword ptr [eax]
 00599B63    mov         ebx,eax
 00599B65    mov         eax,esi
 00599B67    test        eax,eax
>00599B69    je          00599B70
 00599B6B    sub         eax,4
 00599B6E    mov         eax,dword ptr [eax]
 00599B70    cmp         eax,ebx
 00599B72    setge       al
 00599B75    test        al,al
>00599B77    je          00599BB2
 00599B79    mov         eax,esi
 00599B7B    call        @UStrToPWChar
 00599B80    mov         edi,eax
 00599B82    mov         eax,ebp
 00599B84    call        @UStrToPWChar
 00599B89    mov         ebp,eax
 00599B8B    mov         eax,esi
 00599B8D    test        eax,eax
>00599B8F    je          00599B96
 00599B91    sub         eax,4
 00599B94    mov         eax,dword ptr [eax]
 00599B96    sub         eax,ebx
 00599B98    add         eax,eax
 00599B9A    add         edi,eax
 00599B9C    push        ebx
 00599B9D    push        ebp
 00599B9E    push        ebx
 00599B9F    push        edi
 00599BA0    push        1
 00599BA2    push        400
 00599BA7    call        kernel32.CompareStringW
 00599BAC    cmp         eax,2
 00599BAF    sete        al
 00599BB2    pop         ebp
 00599BB3    pop         edi
 00599BB4    pop         esi
 00599BB5    pop         ebx
 00599BB6    ret
*}
end;

//00599BB8
function CharIsInSet(const AString:UnicodeString; const ACharPos:Integer; const ASet:UnicodeString):Boolean;
begin
{*
 00599BB8    push        ebx
 00599BB9    push        esi
 00599BBA    push        edi
 00599BBB    push        ebp
 00599BBC    mov         esi,ecx
 00599BBE    mov         edi,edx
 00599BC0    mov         ebp,eax
 00599BC2    xor         ebx,ebx
 00599BC4    cmp         edi,1
>00599BC7    jge         00599BD8
 00599BC9    mov         edx,599C28;'Invalid ACharPos'
 00599BCE    mov         eax,[005961F8];EIdException
 00599BD3    call        EIdException.Toss
 00599BD8    mov         eax,ebp
 00599BDA    test        eax,eax
>00599BDC    je          00599BE3
 00599BDE    sub         eax,4
 00599BE1    mov         eax,dword ptr [eax]
 00599BE3    cmp         eax,edi
>00599BE5    jl          00599C11
 00599BE7    movzx       edx,word ptr [ebp+edi*2-2]
 00599BEC    mov         edi,esi
 00599BEE    test        edi,edi
>00599BF0    je          00599BF7
 00599BF2    sub         edi,4
 00599BF5    mov         edi,dword ptr [edi]
 00599BF7    mov         ebp,edi
 00599BF9    test        ebp,ebp
>00599BFB    jle         00599C11
 00599BFD    mov         eax,1
 00599C02    cmp         dx,word ptr [esi+eax*2-2]
>00599C07    jne         00599C0D
 00599C09    mov         ebx,eax
>00599C0B    jmp         00599C11
 00599C0D    inc         eax
 00599C0E    dec         ebp
>00599C0F    jne         00599C02
 00599C11    test        ebx,ebx
 00599C13    setg        al
 00599C16    pop         ebp
 00599C17    pop         edi
 00599C18    pop         esi
 00599C19    pop         ebx
 00599C1A    ret
*}
end;

//00599C4C
function IndyRegisterExpectedMemoryLeak(AAddress:Pointer):Boolean;
begin
{*
 00599C4C    call        RegisterExpectedMemoryLeak
 00599C51    ret
*}
end;

Initialization
//007814E8
{*
 007814E8    sub         dword ptr ds:[815590],1
>007814EF    jae         0078151A
 007814F1    mov         eax,[0078DB28]
 007814F6    mov         edx,78151C
 007814FB    mov         cl,20
 007814FD    call        @SetEq
>00781502    jne         00781510
 00781504    mov         dword ptr ds:[789BA0],5982C0
>0078150E    jmp         0078151A
 00781510    mov         dword ptr ds:[789BA0],5982C8
 0078151A    ret
*}
Finalization
//00599C54
{*
 00599C54    push        ebp
 00599C55    mov         ebp,esp
 00599C57    xor         eax,eax
 00599C59    push        ebp
 00599C5A    push        599CC9
 00599C5F    push        dword ptr fs:[eax]
 00599C62    mov         dword ptr fs:[eax],esp
 00599C65    inc         dword ptr ds:[815590]
>00599C6B    jne         00599CBB
 00599C6D    mov         eax,[00789BA4]
 00599C72    xor         edx,edx
 00599C74    mov         dword ptr ds:[789BA4],edx
 00599C7A    call        TObject.Free
 00599C7F    mov         eax,[00789BA8]
 00599C84    xor         edx,edx
 00599C86    mov         dword ptr ds:[789BA8],edx
 00599C8C    call        TObject.Free
 00599C91    mov         eax,789BAC;^'Sun'
 00599C96    mov         ecx,7
 00599C9B    mov         edx,dword ptr ds:[40128C];string
 00599CA1    call        @FinalizeArray
 00599CA6    mov         eax,789BC8;^'Jan'
 00599CAB    mov         ecx,0C
 00599CB0    mov         edx,dword ptr ds:[40128C];string
 00599CB6    call        @FinalizeArray
 00599CBB    xor         eax,eax
 00599CBD    pop         edx
 00599CBE    pop         ecx
 00599CBF    pop         ecx
 00599CC0    mov         dword ptr fs:[eax],edx
 00599CC3    push        599CD0
 00599CC8    ret
>00599CC9    jmp         @HandleFinally
>00599CCE    jmp         00599CC8
 00599CD0    pop         ebp
 00599CD1    ret
*}
end.