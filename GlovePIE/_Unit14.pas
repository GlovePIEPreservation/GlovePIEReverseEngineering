//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit14;

interface

uses
  SysUtils, Classes;

type
  TTimeSpan = TTimeSpan = record//size=8
FTicks:Int64;//f0
end;;
  TWaitResult = (wrSignaled, wrTimeout, wrAbandoned, wrError, wrIOCompletion);
  TSynchroObject = class(TObject)
  published
    function WaitFor(Timeout:Cardinal):TWaitResult;//00456474
    function WaitFor(Timeout:TTimeSpan):TWaitResult;//00456478
    procedure Acquire;//00456464
    procedure Release;//00456470
  public
    procedure Acquire; virtual;//v0//00456464
    procedure Release; virtual;//v4//00456470
    function WaitFor(Timeout:Cardinal):TWaitResult; virtual;//v8//00456474
  end;
  THandleObjectArray = array of THandleObject;
//elSize = 4;
  THandleObject = class(TSynchroObject)
  published
    function WaitFor(Timeout:Cardinal):TWaitResult;//004565A4
    function WaitForMultiple(HandleObjs:THandleObjectArray; Timeout:Cardinal; Len:Integer; UseCOMWait:Boolean; SignaledObj:THandleObject; AAll:Boolean):TWaitResult;//00456670
    constructor Create;//00456530
    destructor Destroy();//00456574
  public
    FHandle:Cardinal;//f4
    FLastError:Integer;//f8
    FUseCOMWait:Boolean;//fC
    destructor Destroy(); virtual;//00456574
    function WaitFor(Timeout:Cardinal):TWaitResult; virtual;//v8//004565A4
  end;
  TEvent = class(THandleObject)
  published
    procedure SetEvent;//004568BC
    procedure ResetEvent;//004568C8
    constructor Create(UseCOMWait:Boolean; Name:string; InitialState:Boolean; ManualReset:Boolean);//00456814
    constructor Create;//0045687C
  end;
  TCriticalSection = class(TSynchroObject)
  published
    function TryEnter:Boolean;//0045695C
    procedure Enter;//00456970
    procedure Leave;//00456978
    procedure Release;//00456950
    constructor Create();//004568D4
    destructor Destroy();//00456914
    procedure Acquire;//00456944
  public
    FSection:_RTL_CRITICAL_SECTION;//f4
    destructor Destroy(); virtual;//00456914
    procedure Acquire; virtual;//v0//00456944
    procedure Release; virtual;//v4//00456950
  end;
  :THandleObject.:1 = array of Cardinal;
//elSize = 4
//varType equivalent: varInteger;
    function &op_Explicit:UnicodeString;//004556F0
    function GetTotalMilliseconds:Double;//00455704
    function ToString:UnicodeString;//00455780
    function GetOleThreadWindow:HWND;//004561F8
    function InternalCoWaitForMultipleHandles(dwFlags:DWORD; dwTimeOut:DWORD; cHandles:LongWord; var Handles:void ; var lpdwIndex:DWORD):HRESULT; stdcall;//004562CC
    procedure LookupProc;//004563B0
    function CoWaitForMultipleHandles(dwFlags:DWORD; dwTimeOut:DWORD; cHandles:LongWord; var Handles:void ; var lpdwIndex:DWORD):HRESULT;//00456430
    procedure InternalInitConditionVariable(var ConditionVariable:TRTLConditionVariable); stdcall;//00456980
    procedure InternalWakeConditionVariable(var ConditionVariable:TRTLConditionVariable); stdcall;//00456990
    procedure InternalWakeAllConditionVariable(var ConditionVariable:TRTLConditionVariable); stdcall;//004569A0
    function InternalSleepConditionVariableCS(var ConditionVariable:TRTLConditionVariable; var CriticalSection:TRTLCriticalSection; dwMilliseconds:DWORD):BOOL; stdcall;//004569B0
    function DequeueWaiter:PWaitingThread;//004569CC
    function DequeueWaiterNoLock(var WaitQueue:PWaitingThread):PWaitingThread;//00456A24
    function LockQueue:PWaitingThread;//00456A40
    procedure QueueWaiter(var WaitingThread:TWaitingThread);//00456AA4
    procedure RemoveWaiter(var WaitingThread:TWaitingThread);//00456BAC
    function SleepCriticalSection(var CriticalSection:TRTLCriticalSection; Timeout:DWORD):Boolean;//00456C38
    procedure UnlockQueue(WaitQueue:PWaitingThread);//00456D30
    procedure Wake;//00456D38
    procedure WakeAll;//00456D4C
    function Add(Increment:Integer):Integer;//00456DC0
    function Exchange(Value:Integer):Integer;//00456DCC
    procedure InitConditionVariableProcs;//00456DD8

implementation

//004556F0
function TTimeSpan.&op_Explicit:UnicodeString;
begin
{*
 004556F0    push        ebx
 004556F1    push        esi
 004556F2    mov         esi,edx
 004556F4    mov         ebx,eax
 004556F6    mov         edx,esi
 004556F8    mov         eax,ebx
 004556FA    call        TTimeSpan.ToString
 004556FF    pop         esi
 00455700    pop         ebx
 00455701    ret
*}
end;

//00455704
function TTimeSpan.GetTotalMilliseconds:Double;
begin
{*
 00455704    add         esp,0FFFFFFF8
 00455707    mov         ecx,eax
 00455709    fild        qword ptr [ecx]
 0045570B    fld         tbyte ptr ds:[45575C]
 00455711    fmulp       st(1),st
 00455713    fstp        qword ptr [esp]
 00455716    wait
 00455717    fld         tbyte ptr ds:[455768]
 0045571D    fcomp       qword ptr [esp]
 00455720    wait
 00455721    fnstsw      al
 00455723    sahf
>00455724    jae         00455737
 00455726    mov         dword ptr [esp],0EB1C4328
 0045572D    mov         dword ptr [esp+4],430A36E2
>00455735    jmp         00455755
 00455737    fld         tbyte ptr ds:[455774]
 0045573D    fcomp       qword ptr [esp]
 00455740    wait
 00455741    fnstsw      al
 00455743    sahf
>00455744    jbe         00455755
 00455746    mov         dword ptr [esp],0EB1C4328
 0045574D    mov         dword ptr [esp+4],0C30A36E2
 00455755    fld         qword ptr [esp]
 00455758    pop         ecx
 00455759    pop         edx
 0045575A    ret
*}
end;

//00455780
function TTimeSpan.ToString:UnicodeString;
begin
{*
 00455780    push        ebp
 00455781    mov         ebp,esp
 00455783    add         esp,0FFFFFFB0
 00455786    push        ebx
 00455787    push        esi
 00455788    push        edi
 00455789    xor         ecx,ecx
 0045578B    mov         dword ptr [ebp-4],ecx
 0045578E    mov         edi,edx
 00455790    mov         ebx,eax
 00455792    xor         eax,eax
 00455794    push        ebp
 00455795    push        4558EE
 0045579A    push        dword ptr fs:[eax]
 0045579D    mov         dword ptr fs:[eax],esp
 004557A0    lea         eax,[ebp-4]
 004557A3    mov         edx,455908;'%1:.2d:%2:.2d:%3:.2d'
 004557A8    call        @UStrLAsg
 004557AD    push        0C9
 004557B2    push        2A69C000
 004557B7    mov         eax,dword ptr [ebx]
 004557B9    mov         edx,dword ptr [ebx+4]
 004557BC    call        @_lldiv
 004557C1    mov         esi,eax
 004557C3    push        0C9
 004557C8    push        2A69C000
 004557CD    mov         eax,dword ptr [ebx]
 004557CF    mov         edx,dword ptr [ebx+4]
 004557D2    call        @_llmod
 004557D7    mov         dword ptr [ebp-10],eax
 004557DA    mov         dword ptr [ebp-0C],edx
 004557DD    cmp         dword ptr [ebx+4],0
>004557E1    jne         004557EA
 004557E3    cmp         dword ptr [ebx],0
>004557E6    jae         004557FF
>004557E8    jmp         004557EC
>004557EA    jge         004557FF
 004557EC    mov         eax,dword ptr [ebp-10]
 004557EF    mov         edx,dword ptr [ebp-0C]
 004557F2    neg         eax
 004557F4    adc         edx,0
 004557F7    neg         edx
 004557F9    mov         dword ptr [ebp-10],eax
 004557FC    mov         dword ptr [ebp-0C],edx
 004557FF    test        esi,esi
>00455801    je          00455813
 00455803    lea         eax,[ebp-4]
 00455806    mov         ecx,dword ptr [ebp-4]
 00455809    mov         edx,455940;'%0:d.'
 0045580E    call        @UStrCat3
 00455813    push        0
 00455815    push        989680
 0045581A    mov         eax,dword ptr [ebp-10]
 0045581D    mov         edx,dword ptr [ebp-0C]
 00455820    call        @_llmod
 00455825    mov         ebx,eax
 00455827    test        ebx,ebx
>00455829    je          00455838
 0045582B    lea         eax,[ebp-4]
 0045582E    mov         edx,455958;'.%4:.7d'
 00455833    call        @UStrCat
 00455838    push        edi
 00455839    mov         dword ptr [ebp-38],esi
 0045583C    mov         byte ptr [ebp-34],0
 00455840    push        0
 00455842    push        18
 00455844    push        8
 00455846    push        61C46800
 0045584B    mov         eax,dword ptr [ebp-10]
 0045584E    mov         edx,dword ptr [ebp-0C]
 00455851    call        @_lldiv
 00455856    call        @_llmod
 0045585B    mov         dword ptr [ebp-40],eax
 0045585E    mov         dword ptr [ebp-3C],edx
 00455861    lea         eax,[ebp-40]
 00455864    mov         dword ptr [ebp-30],eax
 00455867    mov         byte ptr [ebp-2C],10
 0045586B    push        0
 0045586D    push        3C
 0045586F    push        0
 00455871    push        23C34600
 00455876    mov         eax,dword ptr [ebp-10]
 00455879    mov         edx,dword ptr [ebp-0C]
 0045587C    call        @_lldiv
 00455881    call        @_llmod
 00455886    mov         dword ptr [ebp-48],eax
 00455889    mov         dword ptr [ebp-44],edx
 0045588C    lea         eax,[ebp-48]
 0045588F    mov         dword ptr [ebp-28],eax
 00455892    mov         byte ptr [ebp-24],10
 00455896    push        0
 00455898    push        3C
 0045589A    push        0
 0045589C    push        989680
 004558A1    mov         eax,dword ptr [ebp-10]
 004558A4    mov         edx,dword ptr [ebp-0C]
 004558A7    call        @_lldiv
 004558AC    call        @_llmod
 004558B1    mov         dword ptr [ebp-50],eax
 004558B4    mov         dword ptr [ebp-4C],edx
 004558B7    lea         eax,[ebp-50]
 004558BA    mov         dword ptr [ebp-20],eax
 004558BD    mov         byte ptr [ebp-1C],10
 004558C1    mov         dword ptr [ebp-18],ebx
 004558C4    mov         byte ptr [ebp-14],0
 004558C8    lea         edx,[ebp-38]
 004558CB    mov         ecx,4
 004558D0    mov         eax,dword ptr [ebp-4]
 004558D3    call        Format
 004558D8    xor         eax,eax
 004558DA    pop         edx
 004558DB    pop         ecx
 004558DC    pop         ecx
 004558DD    mov         dword ptr fs:[eax],edx
 004558E0    push        4558F5
 004558E5    lea         eax,[ebp-4]
 004558E8    call        @UStrClr
 004558ED    ret
>004558EE    jmp         @HandleFinally
>004558F3    jmp         004558E5
 004558F5    pop         edi
 004558F6    pop         esi
 004558F7    pop         ebx
 004558F8    mov         esp,ebp
 004558FA    pop         ebp
 004558FB    ret
*}
end;

//004561F8
function GetOleThreadWindow:HWND;
begin
{*
 004561F8    push        ebx
 004561F9    push        esi
 004561FA    push        edi
 004561FB    call        @GetTls
 00456200    cmp         dword ptr [eax+14],0;{OleThreadWnd:HWND}
>00456207    je          0045621E
 00456209    call        @GetTls
 0045620E    mov         eax,dword ptr [eax+14];{OleThreadWnd:HWND}
 00456214    push        eax
 00456215    call        user32.IsWindow
 0045621A    test        eax,eax
>0045621C    jne         0045628F
 0045621E    mov         eax,[0078DB58];^gvar_00784C7C
 00456223    cmp         dword ptr [eax],2
>00456226    jne         00456239
 00456228    mov         eax,[0078D080];^gvar_00784C80
 0045622D    cmp         dword ptr [eax],5
>00456230    jl          00456239
 00456232    mov         esi,0FFFFFFFD
>00456237    jmp         0045623B
 00456239    xor         esi,esi
 0045623B    xor         ebx,ebx
 0045623D    push        0
 0045623F    push        4562A0
 00456244    push        ebx
 00456245    push        esi
 00456246    call        user32.FindWindowExW
 0045624B    mov         ebx,eax
 0045624D    call        @GetTls
 00456252    mov         dword ptr [eax+14],ebx;{OleThreadWnd:HWND}
 00456258    call        @GetTls
 0045625D    mov         ebx,dword ptr [eax+14];{OleThreadWnd:HWND}
 00456263    call        @GetTls
 00456268    cmp         dword ptr [eax+14],0;{OleThreadWnd:HWND}
>0045626F    je          0045628F
 00456271    push        0
 00456273    call        @GetTls
 00456278    mov         eax,dword ptr [eax+14];{OleThreadWnd:HWND}
 0045627E    push        eax
 0045627F    call        user32.GetWindowThreadProcessId
 00456284    mov         edi,eax
 00456286    call        kernel32.GetCurrentThreadId
 0045628B    cmp         edi,eax
>0045628D    jne         0045623D
 0045628F    call        @GetTls
 00456294    mov         eax,dword ptr [eax+14];{OleThreadWnd:HWND}
 0045629A    pop         edi
 0045629B    pop         esi
 0045629C    pop         ebx
 0045629D    ret
*}
end;

//004562CC
function InternalCoWaitForMultipleHandles(dwFlags:DWORD; dwTimeOut:DWORD; cHandles:LongWord; var Handles:void ; var lpdwIndex:DWORD):HRESULT; stdcall;
begin
{*
 004562CC    push        ebp
 004562CD    mov         ebp,esp
 004562CF    add         esp,0FFFFFFE0
 004562D2    push        ebx
 004562D3    push        esi
 004562D4    push        edi
 004562D5    mov         esi,dword ptr [ebp+10]
 004562D8    mov         edi,dword ptr [ebp+8]
 004562DB    xor         ebx,ebx
 004562DD    call        GetOleThreadWindow
 004562E2    mov         dword ptr [ebp-4],eax
 004562E5    cmp         dword ptr [ebp-4],0
>004562E9    je          00456332
 004562EB    push        edi
 004562EC    push        0BF
 004562F1    mov         eax,dword ptr [ebp+0C]
 004562F4    push        eax
 004562F5    mov         eax,dword ptr [ebp+14]
 004562F8    push        eax
 004562F9    push        esi
 004562FA    call        user32.MsgWaitForMultipleObjectsEx
 004562FF    mov         ebx,eax
 00456301    lea         eax,[esi]
 00456303    cmp         ebx,eax
>00456305    jne         0045635E
 00456307    push        1
 00456309    push        0
 0045630B    push        0
 0045630D    mov         eax,dword ptr [ebp-4]
 00456310    push        eax
 00456311    lea         eax,[ebp-20]
 00456314    push        eax
 00456315    call        user32.PeekMessageW
 0045631A    test        eax,eax
>0045631C    je          004562EB
 0045631E    lea         eax,[ebp-20]
 00456321    push        eax
 00456322    call        user32.TranslateMessage
 00456327    lea         eax,[ebp-20]
 0045632A    push        eax
 0045632B    call        user32.DispatchMessageW
>00456330    jmp         004562EB
 00456332    test        edi,2
 00456338    setne       al
 0045633B    neg         al
 0045633D    sbb         eax,eax
 0045633F    push        eax
 00456340    mov         eax,dword ptr [ebp+0C]
 00456343    push        eax
 00456344    test        edi,1
 0045634A    setne       al
 0045634D    neg         al
 0045634F    sbb         eax,eax
 00456351    push        eax
 00456352    mov         eax,dword ptr [ebp+14]
 00456355    push        eax
 00456356    push        esi
 00456357    call        kernel32.WaitForMultipleObjectsEx
 0045635C    mov         ebx,eax
 0045635E    cmp         ebx,102
>00456364    jne         0045636D
 00456366    mov         eax,8001011F
>0045636B    jmp         004563A5
 0045636D    cmp         ebx,0C0
>00456373    jne         0045637C
 00456375    mov         eax,80010115
>0045637A    jmp         004563A5
 0045637C    xor         eax,eax
 0045637E    cmp         ebx,80
>00456384    jb          0045639D
 00456386    add         esi,80
 0045638C    cmp         ebx,esi
>0045638E    jae         0045639D
 00456390    sub         ebx,80
 00456396    mov         edx,dword ptr [ebp+18]
 00456399    mov         dword ptr [edx],ebx
>0045639B    jmp         004563A5
 0045639D    sub         ebx,0
 004563A0    mov         edx,dword ptr [ebp+18]
 004563A3    mov         dword ptr [edx],ebx
 004563A5    pop         edi
 004563A6    pop         esi
 004563A7    pop         ebx
 004563A8    mov         esp,ebp
 004563AA    pop         ebp
 004563AB    ret         14
*}
end;

//004563B0
procedure LookupProc;
begin
{*
 004563B0    push        ebx
 004563B1    push        4563E8
 004563B6    call        kernel32.GetModuleHandleW
 004563BB    mov         ebx,eax
 004563BD    test        ebx,ebx
>004563BF    je          004563D1
 004563C1    push        4563FC
 004563C6    push        ebx
 004563C7    call        GetProcAddress
 004563CC    mov         [0079300C],eax
 004563D1    cmp         dword ptr ds:[79300C],0
>004563D8    jne         004563E4
 004563DA    mov         dword ptr ds:[79300C],4562CC
 004563E4    pop         ebx
 004563E5    ret
*}
end;

//00456430
function CoWaitForMultipleHandles(dwFlags:DWORD; dwTimeOut:DWORD; cHandles:LongWord; var Handles:void ; var lpdwIndex:DWORD):HRESULT;
begin
{*
 00456430    push        ebp
 00456431    mov         ebp,esp
 00456433    push        ebx
 00456434    push        esi
 00456435    push        edi
 00456436    mov         edi,ecx
 00456438    mov         esi,edx
 0045643A    mov         ebx,eax
 0045643C    cmp         dword ptr ds:[79300C],0
>00456443    jne         0045644A
 00456445    call        LookupProc
 0045644A    mov         eax,dword ptr [ebp+8]
 0045644D    push        eax
 0045644E    mov         eax,dword ptr [ebp+0C]
 00456451    push        eax
 00456452    push        edi
 00456453    push        esi
 00456454    push        ebx
 00456455    call        dword ptr ds:[79300C]
 0045645B    pop         edi
 0045645C    pop         esi
 0045645D    pop         ebx
 0045645E    pop         ebp
 0045645F    ret         8
*}
end;

//00456464
procedure TSynchroObject.Acquire;
begin
{*
 00456464    or          edx,0FFFFFFFF
 00456467    mov         ecx,dword ptr [eax]
 00456469    call        dword ptr [ecx+8]
 0045646C    ret
*}
end;

//00456470
procedure TSynchroObject.Release;
begin
{*
 00456470    ret
*}
end;

//00456474
function TSynchroObject.WaitFor(Timeout:Cardinal):TWaitResult;
begin
{*
 00456474    mov         al,3
 00456476    ret
*}
end;

//00456478
function TSynchroObject.WaitFor(Timeout:TTimeSpan):TWaitResult;
begin
{*
 00456478    push        ebp
 00456479    mov         ebp,esp
 0045647B    add         esp,0FFFFFFEC
 0045647E    push        ebx
 0045647F    push        esi
 00456480    xor         ecx,ecx
 00456482    mov         dword ptr [ebp-14],ecx
 00456485    mov         esi,edx
 00456487    mov         ebx,eax
 00456489    xor         eax,eax
 0045648B    push        ebp
 0045648C    push        456521
 00456491    push        dword ptr fs:[eax]
 00456494    mov         dword ptr fs:[eax],esp
 00456497    mov         eax,esi
 00456499    call        TTimeSpan.GetTotalMilliseconds
 0045649E    call        @TRUNC
 004564A3    mov         dword ptr [ebp-8],eax
 004564A6    mov         dword ptr [ebp-4],edx
 004564A9    cmp         dword ptr [ebp-4],0
>004564AD    jne         004564B7
 004564AF    cmp         dword ptr [ebp-8],0
>004564B3    jb          004564CC
>004564B5    jmp         004564B9
>004564B7    jl          004564CC
 004564B9    cmp         dword ptr [ebp-4],0
>004564BD    jne         004564CA
 004564BF    cmp         dword ptr [ebp-8],7FFFFFFF
>004564C6    jbe         004564FD
>004564C8    jmp         004564CC
>004564CA    jle         004564FD
 004564CC    lea         edx,[ebp-14]
 004564CF    mov         eax,esi
 004564D1    call        TTimeSpan.&op_Explicit
 004564D6    mov         eax,dword ptr [ebp-14]
 004564D9    mov         dword ptr [ebp-10],eax
 004564DC    mov         byte ptr [ebp-0C],11
 004564E0    lea         eax,[ebp-10]
 004564E3    push        eax
 004564E4    push        0
 004564E6    mov         ecx,dword ptr ds:[78D574];^SResString164:TResStringRec
 004564EC    mov         dl,1
 004564EE    mov         eax,[00419274];EArgumentOutOfRangeException
 004564F3    call        Exception.CreateResFmt
 004564F8    call        @RaiseExcept
 004564FD    mov         eax,dword ptr [ebp-8]
 00456500    mov         edx,eax
 00456502    mov         eax,ebx
 00456504    mov         ecx,dword ptr [eax]
 00456506    call        dword ptr [ecx+8]
 00456509    mov         ebx,eax
 0045650B    xor         eax,eax
 0045650D    pop         edx
 0045650E    pop         ecx
 0045650F    pop         ecx
 00456510    mov         dword ptr fs:[eax],edx
 00456513    push        456528
 00456518    lea         eax,[ebp-14]
 0045651B    call        @UStrClr
 00456520    ret
>00456521    jmp         @HandleFinally
>00456526    jmp         00456518
 00456528    mov         eax,ebx
 0045652A    pop         esi
 0045652B    pop         ebx
 0045652C    mov         esp,ebp
 0045652E    pop         ebp
 0045652F    ret
*}
end;

//00456530
constructor THandleObject.Create;
begin
{*
 00456530    push        ebp
 00456531    mov         ebp,esp
 00456533    push        ecx
 00456534    push        ebx
 00456535    push        esi
 00456536    test        dl,dl
>00456538    je          00456542
 0045653A    add         esp,0FFFFFFF0
 0045653D    call        @ClassCreate
 00456542    mov         ebx,ecx
 00456544    mov         byte ptr [ebp-1],dl
 00456547    mov         esi,eax
 00456549    xor         edx,edx
 0045654B    mov         eax,esi
 0045654D    call        TObject.Create
 00456552    mov         byte ptr [esi+0C],bl
 00456555    mov         eax,esi
 00456557    cmp         byte ptr [ebp-1],0
>0045655B    je          0045656C
 0045655D    call        @AfterConstruction
 00456562    pop         dword ptr fs:[0]
 00456569    add         esp,0C
 0045656C    mov         eax,esi
 0045656E    pop         esi
 0045656F    pop         ebx
 00456570    pop         ecx
 00456571    pop         ebp
 00456572    ret
*}
end;

//00456574
destructor THandleObject.Destroy();
begin
{*
 00456574    push        ebx
 00456575    push        esi
 00456576    call        @BeforeDestruction
 0045657B    mov         ebx,edx
 0045657D    mov         esi,eax
 0045657F    mov         eax,dword ptr [esi+4]
 00456582    push        eax
 00456583    call        kernel32.CloseHandle
 00456588    mov         edx,ebx
 0045658A    and         dl,0FC
 0045658D    mov         eax,esi
 0045658F    call        TObject.Destroy
 00456594    test        bl,bl
>00456596    jle         0045659F
 00456598    mov         eax,esi
 0045659A    call        @ClassDestroy
 0045659F    pop         esi
 004565A0    pop         ebx
 004565A1    ret
*}
end;

//004565A4
function THandleObject.WaitFor(Timeout:Cardinal):TWaitResult;
begin
{*
 004565A4    push        ebx
 004565A5    push        esi
 004565A6    push        ecx
 004565A7    mov         esi,eax
 004565A9    cmp         byte ptr [esi+0C],0
>004565AD    je          004565EF
 004565AF    lea         eax,[esi+4]
 004565B2    push        eax
 004565B3    lea         eax,[esp+4]
 004565B7    push        eax
 004565B8    mov         ecx,1
 004565BD    xor         eax,eax
 004565BF    call        CoWaitForMultipleHandles
 004565C4    sub         eax,80010115
>004565C9    je          004565DB
 004565CB    sub         eax,0A
>004565CE    je          004565DF
 004565D0    sub         eax,7FFEFEE1
>004565D5    jne         004565E3
 004565D7    xor         ebx,ebx
>004565D9    jmp         00456631
 004565DB    mov         bl,4
>004565DD    jmp         00456631
 004565DF    mov         bl,1
>004565E1    jmp         00456631
 004565E3    mov         bl,3
 004565E5    call        kernel32.GetLastError
 004565EA    mov         dword ptr [esi+8],eax
>004565ED    jmp         00456631
 004565EF    push        0
 004565F1    push        edx
 004565F2    push        0FF
 004565F4    lea         eax,[esi+4]
 004565F7    push        eax
 004565F8    push        1
 004565FA    call        kernel32.WaitForMultipleObjectsEx
 004565FF    sub         eax,0FFFFFFFF
>00456602    je          00456623
 00456604    dec         eax
>00456605    je          0045661B
 00456607    sub         eax,80
>0045660C    je          00456617
 0045660E    sub         eax,82
>00456613    je          0045661F
>00456615    jmp         0045662F
 00456617    mov         bl,2
>00456619    jmp         00456631
 0045661B    xor         ebx,ebx
>0045661D    jmp         00456631
 0045661F    mov         bl,1
>00456621    jmp         00456631
 00456623    mov         bl,3
 00456625    call        kernel32.GetLastError
 0045662A    mov         dword ptr [esi+8],eax
>0045662D    jmp         00456631
 0045662F    mov         bl,3
 00456631    mov         eax,ebx
 00456633    pop         edx
 00456634    pop         esi
 00456635    pop         ebx
 00456636    ret
*}
end;

//00456670
function THandleObject.WaitForMultiple(HandleObjs:THandleObjectArray; Timeout:Cardinal; Len:Integer; UseCOMWait:Boolean; SignaledObj:THandleObject; AAll:Boolean):TWaitResult;
begin
{*
 00456670    push        ebp
 00456671    mov         ebp,esp
 00456673    add         esp,0FFFFFFF4
 00456676    push        ebx
 00456677    push        esi
 00456678    push        edi
 00456679    xor         ebx,ebx
 0045667B    mov         dword ptr [ebp-4],ebx
 0045667E    mov         esi,ecx
 00456680    mov         ebx,edx
 00456682    mov         edi,dword ptr [ebp+8]
 00456685    xor         eax,eax
 00456687    push        ebp
 00456688    push        4567FE
 0045668D    push        dword ptr fs:[eax]
 00456690    mov         dword ptr fs:[eax],esp
 00456693    test        edi,edi
>00456695    jle         004566A8
 00456697    mov         eax,ebx
 00456699    call        @DynArrayLength
 0045669E    cmp         eax,edi
>004566A0    jle         004566A4
 004566A2    mov         eax,edi
 004566A4    mov         edi,eax
>004566A6    jmp         004566B1
 004566A8    mov         eax,ebx
 004566AA    call        @DynArrayLength
 004566AF    mov         edi,eax
 004566B1    push        edi
 004566B2    lea         eax,[ebp-4]
 004566B5    mov         ecx,1
 004566BA    mov         edx,dword ptr ds:[456638];:THandleObject.:1
 004566C0    call        @DynArraySetLength
 004566C5    add         esp,4
 004566C8    mov         eax,dword ptr [ebp-4]
 004566CB    call        @DynArrayHigh
 004566D0    mov         edx,eax
 004566D2    test        edx,edx
>004566D4    jl          004566E9
 004566D6    inc         edx
 004566D7    xor         eax,eax
 004566D9    mov         ecx,dword ptr [ebx+eax*4]
 004566DC    mov         ecx,dword ptr [ecx+4]
 004566DF    mov         edi,dword ptr [ebp-4]
 004566E2    mov         dword ptr [edi+eax*4],ecx
 004566E5    inc         eax
 004566E6    dec         edx
>004566E7    jne         004566D9
 004566E9    cmp         byte ptr [ebp+0C],0
>004566ED    je          00456767
 004566EF    cmp         byte ptr [ebp+14],0
>004566F3    je          004566FC
 004566F5    mov         edi,1
>004566FA    jmp         004566FE
 004566FC    xor         edi,edi
 004566FE    mov         eax,dword ptr [ebp-4]
 00456701    push        eax
 00456702    lea         eax,[ebp-0C]
 00456705    push        eax
 00456706    mov         eax,dword ptr [ebp-4]
 00456709    call        @DynArrayLength
 0045670E    mov         ecx,eax
 00456710    mov         edx,esi
 00456712    mov         eax,edi
 00456714    call        CoWaitForMultipleHandles
 00456719    sub         eax,80010115
>0045671E    je          00456732
 00456720    sub         eax,0A
>00456723    je          00456738
 00456725    sub         eax,7FFEFEE1
>0045672A    jne         0045673E
 0045672C    mov         byte ptr [ebp-5],0
>00456730    jmp         00456742
 00456732    mov         byte ptr [ebp-5],4
>00456736    jmp         00456742
 00456738    mov         byte ptr [ebp-5],1
>0045673C    jmp         00456742
 0045673E    mov         byte ptr [ebp-5],3
 00456742    cmp         byte ptr [ebp+14],0
>00456746    jne         0045675E
 00456748    cmp         byte ptr [ebp-5],0
>0045674C    jne         0045675E
 0045674E    mov         eax,dword ptr [ebp-0C]
 00456751    mov         eax,dword ptr [ebx+eax*4]
 00456754    mov         edx,dword ptr [ebp+10]
 00456757    mov         dword ptr [edx],eax
>00456759    jmp         004567E2
 0045675E    mov         eax,dword ptr [ebp+10]
 00456761    xor         edx,edx
 00456763    mov         dword ptr [eax],edx
>00456765    jmp         004567E2
 00456767    push        0
 00456769    push        esi
 0045676A    cmp         byte ptr [ebp+14],1
 0045676E    cmc
 0045676F    sbb         eax,eax
 00456771    push        eax
 00456772    mov         eax,dword ptr [ebp-4]
 00456775    push        eax
 00456776    mov         eax,dword ptr [ebp-4]
 00456779    call        @DynArrayLength
 0045677E    push        eax
 0045677F    call        kernel32.WaitForMultipleObjectsEx
 00456784    mov         edx,eax
 00456786    cmp         edx,80
>0045678C    jge         0045679B
 0045678E    sub         edx,0FFFFFFFF
>00456791    je          004567C4
 00456793    dec         edx
 00456794    sub         edx,40
>00456797    jb          004567D0
>00456799    jmp         004567DE
 0045679B    add         edx,0FFFFFF80
 0045679E    sub         edx,40
>004567A1    jb          004567AC
>004567A3    je          004567CA
 004567A5    sub         edx,42
>004567A8    je          004567BE
>004567AA    jmp         004567DE
 004567AC    mov         byte ptr [ebp-5],2
 004567B0    mov         eax,dword ptr [ebx+eax*4-200]
 004567B7    mov         edx,dword ptr [ebp+10]
 004567BA    mov         dword ptr [edx],eax
>004567BC    jmp         004567E2
 004567BE    mov         byte ptr [ebp-5],1
>004567C2    jmp         004567E2
 004567C4    mov         byte ptr [ebp-5],3
>004567C8    jmp         004567E2
 004567CA    mov         byte ptr [ebp-5],4
>004567CE    jmp         004567E2
 004567D0    mov         byte ptr [ebp-5],0
 004567D4    mov         eax,dword ptr [ebx+eax*4]
 004567D7    mov         edx,dword ptr [ebp+10]
 004567DA    mov         dword ptr [edx],eax
>004567DC    jmp         004567E2
 004567DE    mov         byte ptr [ebp-5],3
 004567E2    xor         eax,eax
 004567E4    pop         edx
 004567E5    pop         ecx
 004567E6    pop         ecx
 004567E7    mov         dword ptr fs:[eax],edx
 004567EA    push        456805
 004567EF    lea         eax,[ebp-4]
 004567F2    mov         edx,dword ptr ds:[456638];:THandleObject.:1
 004567F8    call        @DynArrayClear
 004567FD    ret
>004567FE    jmp         @HandleFinally
>00456803    jmp         004567EF
 00456805    movzx       eax,byte ptr [ebp-5]
 00456809    pop         edi
 0045680A    pop         esi
 0045680B    pop         ebx
 0045680C    mov         esp,ebp
 0045680E    pop         ebp
 0045680F    ret         10
*}
end;

//00456814
constructor TEvent.Create(UseCOMWait:Boolean; Name:string; InitialState:Boolean; ManualReset:Boolean);
begin
{*
 00456814    push        ebp
 00456815    mov         ebp,esp
 00456817    push        ebx
 00456818    push        esi
 00456819    push        edi
 0045681A    test        dl,dl
>0045681C    je          00456826
 0045681E    add         esp,0FFFFFFF0
 00456821    call        @ClassCreate
 00456826    mov         esi,ecx
 00456828    mov         ebx,edx
 0045682A    mov         edi,eax
 0045682C    movzx       ecx,byte ptr [ebp+8]
 00456830    xor         edx,edx
 00456832    mov         eax,edi
 00456834    call        THandleObject.Create
 00456839    mov         eax,dword ptr [ebp+0C]
 0045683C    call        @UStrToPWChar
 00456841    push        eax
 00456842    cmp         byte ptr [ebp+10],1
 00456846    cmc
 00456847    sbb         eax,eax
 00456849    push        eax
 0045684A    cmp         byte ptr [ebp+14],1
 0045684E    cmc
 0045684F    sbb         eax,eax
 00456851    push        eax
 00456852    push        esi
 00456853    call        kernel32.CreateEventW
 00456858    mov         dword ptr [edi+4],eax
 0045685B    mov         eax,edi
 0045685D    test        bl,bl
>0045685F    je          00456870
 00456861    call        @AfterConstruction
 00456866    pop         dword ptr fs:[0]
 0045686D    add         esp,0C
 00456870    mov         eax,edi
 00456872    pop         edi
 00456873    pop         esi
 00456874    pop         ebx
 00456875    pop         ebp
 00456876    ret         10
*}
end;

//0045687C
constructor TEvent.Create;
begin
{*
 0045687C    push        ebx
 0045687D    push        esi
 0045687E    test        dl,dl
>00456880    je          0045688A
 00456882    add         esp,0FFFFFFF0
 00456885    call        @ClassCreate
 0045688A    mov         ebx,edx
 0045688C    mov         esi,eax
 0045688E    push        1
 00456890    push        0
 00456892    push        0
 00456894    push        ecx
 00456895    xor         edx,edx
 00456897    mov         eax,esi
 00456899    xor         ecx,ecx
 0045689B    call        TEvent.Create
 004568A0    mov         eax,esi
 004568A2    test        bl,bl
>004568A4    je          004568B5
 004568A6    call        @AfterConstruction
 004568AB    pop         dword ptr fs:[0]
 004568B2    add         esp,0C
 004568B5    mov         eax,esi
 004568B7    pop         esi
 004568B8    pop         ebx
 004568B9    ret
*}
end;

//004568BC
procedure TEvent.SetEvent;
begin
{*
 004568BC    mov         eax,dword ptr [eax+4]
 004568BF    push        eax
 004568C0    call        kernel32.SetEvent
 004568C5    ret
*}
end;

//004568C8
procedure TEvent.ResetEvent;
begin
{*
 004568C8    mov         eax,dword ptr [eax+4]
 004568CB    push        eax
 004568CC    call        kernel32.ResetEvent
 004568D1    ret
*}
end;

//004568D4
constructor TCriticalSection.Create();
begin
{*
 004568D4    push        ebx
 004568D5    push        esi
 004568D6    test        dl,dl
>004568D8    je          004568E2
 004568DA    add         esp,0FFFFFFF0
 004568DD    call        @ClassCreate
 004568E2    mov         ebx,edx
 004568E4    mov         esi,eax
 004568E6    xor         edx,edx
 004568E8    mov         eax,esi
 004568EA    call        TObject.Create
 004568EF    lea         eax,[esi+4]
 004568F2    push        eax
 004568F3    call        kernel32.InitializeCriticalSection
 004568F8    mov         eax,esi
 004568FA    test        bl,bl
>004568FC    je          0045690D
 004568FE    call        @AfterConstruction
 00456903    pop         dword ptr fs:[0]
 0045690A    add         esp,0C
 0045690D    mov         eax,esi
 0045690F    pop         esi
 00456910    pop         ebx
 00456911    ret
*}
end;

//00456914
destructor TCriticalSection.Destroy();
begin
{*
 00456914    push        ebx
 00456915    push        esi
 00456916    call        @BeforeDestruction
 0045691B    mov         ebx,edx
 0045691D    mov         esi,eax
 0045691F    lea         eax,[esi+4]
 00456922    push        eax
 00456923    call        kernel32.DeleteCriticalSection
 00456928    mov         edx,ebx
 0045692A    and         dl,0FC
 0045692D    mov         eax,esi
 0045692F    call        TObject.Destroy
 00456934    test        bl,bl
>00456936    jle         0045693F
 00456938    mov         eax,esi
 0045693A    call        @ClassDestroy
 0045693F    pop         esi
 00456940    pop         ebx
 00456941    ret
*}
end;

//00456944
procedure TCriticalSection.Acquire;
begin
{*
 00456944    add         eax,4
 00456947    push        eax
 00456948    call        kernel32.EnterCriticalSection
 0045694D    ret
*}
end;

//00456950
procedure TCriticalSection.Release;
begin
{*
 00456950    add         eax,4
 00456953    push        eax
 00456954    call        kernel32.LeaveCriticalSection
 00456959    ret
*}
end;

//0045695C
function TCriticalSection.TryEnter:Boolean;
begin
{*
 0045695C    push        ebx
 0045695D    lea         ebx,[eax+4]
 00456960    push        ebx
 00456961    call        kernel32.TryEnterCriticalSection
 00456966    cmp         eax,1
 00456969    sbb         eax,eax
 0045696B    inc         eax
 0045696C    pop         ebx
 0045696D    ret
*}
end;

//00456970
procedure TCriticalSection.Enter;
begin
{*
 00456970    mov         edx,dword ptr [eax]
 00456972    call        dword ptr [edx]
 00456974    ret
*}
end;

//00456978
procedure TCriticalSection.Leave;
begin
{*
 00456978    mov         edx,dword ptr [eax]
 0045697A    call        dword ptr [edx+4]
 0045697D    ret
*}
end;

//00456980
procedure InternalInitConditionVariable(var ConditionVariable:TRTLConditionVariable); stdcall;
begin
{*
 00456980    push        ebp
 00456981    mov         ebp,esp
 00456983    mov         eax,dword ptr [ebp+8]
 00456986    xor         edx,edx
 00456988    mov         dword ptr [eax],edx
 0045698A    pop         ebp
 0045698B    ret         4
*}
end;

//00456990
procedure InternalWakeConditionVariable(var ConditionVariable:TRTLConditionVariable); stdcall;
begin
{*
 00456990    push        ebp
 00456991    mov         ebp,esp
 00456993    mov         eax,dword ptr [ebp+8]
 00456996    call        TInternalConditionVariable.Wake
 0045699B    pop         ebp
 0045699C    ret         4
*}
end;

//004569A0
procedure InternalWakeAllConditionVariable(var ConditionVariable:TRTLConditionVariable); stdcall;
begin
{*
 004569A0    push        ebp
 004569A1    mov         ebp,esp
 004569A3    mov         eax,dword ptr [ebp+8]
 004569A6    call        TInternalConditionVariable.WakeAll
 004569AB    pop         ebp
 004569AC    ret         4
*}
end;

//004569B0
function InternalSleepConditionVariableCS(var ConditionVariable:TRTLConditionVariable; var CriticalSection:TRTLCriticalSection; dwMilliseconds:DWORD):BOOL; stdcall;
begin
{*
 004569B0    push        ebp
 004569B1    mov         ebp,esp
 004569B3    mov         edx,dword ptr [ebp+0C]
 004569B6    mov         eax,dword ptr [ebp+8]
 004569B9    mov         ecx,dword ptr [ebp+10]
 004569BC    call        TInternalConditionVariable.SleepCriticalSection
 004569C1    neg         al
 004569C3    sbb         eax,eax
 004569C5    pop         ebp
 004569C6    ret         0C
*}
end;

//004569CC
function TInternalConditionVariable.DequeueWaiter:PWaitingThread;
begin
{*
 004569CC    push        ebp
 004569CD    mov         ebp,esp
 004569CF    add         esp,0FFFFFFF4
 004569D2    mov         dword ptr [ebp-4],eax
 004569D5    mov         eax,dword ptr [ebp-4]
 004569D8    call        TInternalConditionVariable.LockQueue
 004569DD    mov         dword ptr [ebp-0C],eax
 004569E0    xor         eax,eax
 004569E2    push        ebp
 004569E3    push        456A15
 004569E8    push        dword ptr fs:[eax]
 004569EB    mov         dword ptr fs:[eax],esp
 004569EE    lea         edx,[ebp-0C]
 004569F1    mov         eax,dword ptr [ebp-4]
 004569F4    call        TInternalConditionVariable.DequeueWaiterNoLock
 004569F9    mov         dword ptr [ebp-8],eax
 004569FC    xor         eax,eax
 004569FE    pop         edx
 004569FF    pop         ecx
 00456A00    pop         ecx
 00456A01    mov         dword ptr fs:[eax],edx
 00456A04    push        456A1C
 00456A09    mov         eax,dword ptr [ebp-4]
 00456A0C    mov         edx,dword ptr [ebp-0C]
 00456A0F    call        TInternalConditionVariable.UnlockQueue
 00456A14    ret
>00456A15    jmp         @HandleFinally
>00456A1A    jmp         00456A09
 00456A1C    mov         eax,dword ptr [ebp-8]
 00456A1F    mov         esp,ebp
 00456A21    pop         ebp
 00456A22    ret
*}
end;

//00456A24
function TInternalConditionVariable.DequeueWaiterNoLock(var WaitQueue:PWaitingThread):PWaitingThread;
begin
{*
 00456A24    mov         eax,dword ptr [edx]
 00456A26    test        eax,eax
>00456A28    je          00456A2E
 00456A2A    cmp         eax,dword ptr [eax]
>00456A2C    jne         00456A33
 00456A2E    xor         ecx,ecx
 00456A30    mov         dword ptr [edx],ecx
 00456A32    ret
 00456A33    mov         eax,dword ptr [edx]
 00456A35    mov         ecx,dword ptr [eax]
 00456A37    mov         eax,ecx
 00456A39    mov         ecx,dword ptr [ecx]
 00456A3B    mov         edx,dword ptr [edx]
 00456A3D    mov         dword ptr [edx],ecx
 00456A3F    ret
*}
end;

//00456A40
function TInternalConditionVariable.LockQueue:PWaitingThread;
begin
{*
 00456A40    push        ebx
 00456A41    push        esi
 00456A42    push        edi
 00456A43    push        ebp
 00456A44    push        ecx
 00456A45    mov         ebp,eax
 00456A47    mov         eax,[0078D9C0];^CPUCount:Integer
 00456A4C    cmp         dword ptr [eax],1
 00456A4F    setg        byte ptr [esp]
 00456A53    cmp         byte ptr [esp],0
>00456A57    je          00456A60
 00456A59    mov         edi,0FA0
>00456A5E    jmp         00456A63
 00456A60    or          edi,0FFFFFFFF
 00456A63    mov         ebx,dword ptr [ebp]
 00456A66    and         ebx,0FFFFFFFE
 00456A69    mov         esi,ebx
 00456A6B    push        esi
 00456A6C    mov         eax,esi
 00456A6E    or          eax,1
 00456A71    push        eax
 00456A72    push        ebp
 00456A73    call        kernel32.InterlockedCompareExchange
 00456A78    cmp         eax,esi
>00456A7A    je          00456A9B
 00456A7C    test        edi,edi
>00456A7E    jge         00456A96
 00456A80    call        kernel32.SwitchToThread
 00456A85    cmp         byte ptr [esp],0
>00456A89    je          00456A92
 00456A8B    mov         edi,0FA0
>00456A90    jmp         00456A98
 00456A92    xor         edi,edi
>00456A94    jmp         00456A98
 00456A96    rep nop
 00456A98    dec         edi
>00456A99    jmp         00456A63
 00456A9B    mov         eax,ebx
 00456A9D    pop         edx
 00456A9E    pop         ebp
 00456A9F    pop         edi
 00456AA0    pop         esi
 00456AA1    pop         ebx
 00456AA2    ret
*}
end;

//00456AA4
procedure TInternalConditionVariable.QueueWaiter(var WaitingThread:TWaitingThread);
begin
{*
 00456AA4    push        ebp
 00456AA5    mov         ebp,esp
 00456AA7    add         esp,0FFFFFFF8
 00456AAA    push        ebx
 00456AAB    mov         ebx,edx
 00456AAD    mov         dword ptr [ebp-4],eax
 00456AB0    test        bl,1
>00456AB3    je          00456AC9
 00456AB5    mov         ecx,683
 00456ABA    mov         edx,456B30;'C:\Builds\TP\rtl\common\SyncObjs.pas'
 00456ABF    mov         eax,456B88;'Assertion failure'
 00456AC4    call        @Assert
 00456AC9    mov         eax,dword ptr [ebp-4]
 00456ACC    call        TInternalConditionVariable.LockQueue
 00456AD1    mov         dword ptr [ebp-8],eax
 00456AD4    xor         eax,eax
 00456AD6    push        ebp
 00456AD7    push        456B17
 00456ADC    push        dword ptr fs:[eax]
 00456ADF    mov         dword ptr fs:[eax],esp
 00456AE2    cmp         dword ptr [ebp-8],0
>00456AE6    jne         00456AEF
 00456AE8    mov         dword ptr [ebp-8],ebx
 00456AEB    mov         dword ptr [ebx],ebx
>00456AED    jmp         00456AFE
 00456AEF    mov         eax,dword ptr [ebp-8]
 00456AF2    mov         eax,dword ptr [eax]
 00456AF4    mov         dword ptr [ebx],eax
 00456AF6    mov         eax,dword ptr [ebp-8]
 00456AF9    mov         dword ptr [eax],ebx
 00456AFB    mov         dword ptr [ebp-8],ebx
 00456AFE    xor         eax,eax
 00456B00    pop         edx
 00456B01    pop         ecx
 00456B02    pop         ecx
 00456B03    mov         dword ptr fs:[eax],edx
 00456B06    push        456B1E
 00456B0B    mov         eax,dword ptr [ebp-4]
 00456B0E    mov         edx,dword ptr [ebp-8]
 00456B11    call        TInternalConditionVariable.UnlockQueue
 00456B16    ret
>00456B17    jmp         @HandleFinally
>00456B1C    jmp         00456B0B
 00456B1E    pop         ebx
 00456B1F    pop         ecx
 00456B20    pop         ecx
 00456B21    pop         ebp
 00456B22    ret
*}
end;

//00456BAC
procedure TInternalConditionVariable.RemoveWaiter(var WaitingThread:TWaitingThread);
begin
{*
 00456BAC    push        ebp
 00456BAD    mov         ebp,esp
 00456BAF    add         esp,0FFFFFFF8
 00456BB2    push        ebx
 00456BB3    mov         ebx,edx
 00456BB5    mov         dword ptr [ebp-4],eax
 00456BB8    mov         eax,dword ptr [ebp-4]
 00456BBB    mov         eax,dword ptr [eax]
 00456BBD    and         eax,0FFFFFFFE
 00456BC0    test        eax,eax
>00456BC2    je          00456C33
 00456BC4    mov         eax,dword ptr [ebp-4]
 00456BC7    call        TInternalConditionVariable.LockQueue
 00456BCC    mov         dword ptr [ebp-8],eax
 00456BCF    xor         ecx,ecx
 00456BD1    push        ebp
 00456BD2    push        456C2C
 00456BD7    push        dword ptr fs:[ecx]
 00456BDA    mov         dword ptr fs:[ecx],esp
 00456BDD    mov         eax,dword ptr [ebp-8]
 00456BE0    mov         edx,dword ptr [eax]
 00456BE2    mov         eax,dword ptr [edx]
 00456BE4    cmp         eax,dword ptr [ebp-8]
>00456BE7    je          00456BFC
 00456BE9    cmp         eax,ebx
>00456BEB    jne         00456BF3
 00456BED    mov         ecx,dword ptr [eax]
 00456BEF    mov         dword ptr [edx],ecx
>00456BF1    jmp         00456BFC
 00456BF3    mov         edx,eax
 00456BF5    mov         eax,dword ptr [eax]
 00456BF7    cmp         eax,dword ptr [ebp-8]
>00456BFA    jne         00456BE9
 00456BFC    cmp         eax,dword ptr [ebp-8]
>00456BFF    jne         00456C13
 00456C01    cmp         eax,ebx
>00456C03    jne         00456C13
 00456C05    cmp         eax,dword ptr [eax]
>00456C07    jne         00456C10
 00456C09    xor         eax,eax
 00456C0B    mov         dword ptr [ebp-8],eax
>00456C0E    jmp         00456C13
 00456C10    mov         dword ptr [ebp-8],edx
 00456C13    xor         eax,eax
 00456C15    pop         edx
 00456C16    pop         ecx
 00456C17    pop         ecx
 00456C18    mov         dword ptr fs:[eax],edx
 00456C1B    push        456C33
 00456C20    mov         eax,dword ptr [ebp-4]
 00456C23    mov         edx,dword ptr [ebp-8]
 00456C26    call        TInternalConditionVariable.UnlockQueue
 00456C2B    ret
>00456C2C    jmp         @HandleFinally
>00456C31    jmp         00456C20
 00456C33    pop         ebx
 00456C34    pop         ecx
 00456C35    pop         ecx
 00456C36    pop         ebp
 00456C37    ret
*}
end;

//00456C38
function TInternalConditionVariable.SleepCriticalSection(var CriticalSection:TRTLCriticalSection; Timeout:DWORD):Boolean;
begin
{*
 00456C38    push        ebp
 00456C39    mov         ebp,esp
 00456C3B    add         esp,0FFFFFFEC
 00456C3E    push        ebx
 00456C3F    push        esi
 00456C40    push        edi
 00456C41    mov         dword ptr [ebp-4],ecx
 00456C44    mov         ebx,edx
 00456C46    mov         edi,eax
 00456C48    call        kernel32.GetCurrentThreadId
 00456C4D    cmp         eax,dword ptr [ebx+0C]
>00456C50    jne         00456D20
 00456C56    xor         eax,eax
 00456C58    mov         dword ptr [ebp-14],eax
 00456C5B    mov         eax,dword ptr [ebx+0C]
 00456C5E    mov         dword ptr [ebp-10],eax
 00456C61    push        0
 00456C63    push        0
 00456C65    push        0
 00456C67    push        0
 00456C69    call        kernel32.CreateEventW
 00456C6E    mov         dword ptr [ebp-0C],eax
 00456C71    xor         eax,eax
 00456C73    push        ebp
 00456C74    push        456D19
 00456C79    push        dword ptr fs:[eax]
 00456C7C    mov         dword ptr fs:[eax],esp
 00456C7F    mov         esi,dword ptr [ebx+8]
 00456C82    lea         edx,[ebp-14]
 00456C85    mov         eax,edi
 00456C87    call        TInternalConditionVariable.QueueWaiter
 00456C8C    mov         dword ptr [ebx+8],1
 00456C93    mov         eax,esi
 00456C95    dec         eax
 00456C96    neg         eax
 00456C98    push        eax
 00456C99    lea         eax,[ebx+4]
 00456C9C    push        eax
 00456C9D    call        kernel32.InterlockedExchangeAdd
 00456CA2    push        ebx
 00456CA3    call        kernel32.LeaveCriticalSection
 00456CA8    mov         eax,dword ptr [ebp-4]
 00456CAB    push        eax
 00456CAC    mov         eax,dword ptr [ebp-0C]
 00456CAF    push        eax
 00456CB0    call        kernel32.WaitForSingleObject
 00456CB5    sub         eax,1
>00456CB8    jb          00456CD1
 00456CBA    sub         eax,101
>00456CBF    jne         00456CD7
 00456CC1    mov         byte ptr [ebp-5],0
 00456CC5    push        5B4
 00456CCA    call        kernel32.SetLastError
>00456CCF    jmp         00456CE2
 00456CD1    mov         byte ptr [ebp-5],1
>00456CD5    jmp         00456CE2
 00456CD7    mov         byte ptr [ebp-5],0
 00456CDB    push        0
 00456CDD    call        kernel32.SetLastError
 00456CE2    push        ebx
 00456CE3    call        kernel32.EnterCriticalSection
 00456CE8    lea         edx,[ebp-14]
 00456CEB    mov         eax,edi
 00456CED    call        TInternalConditionVariable.RemoveWaiter
 00456CF2    mov         eax,esi
 00456CF4    dec         eax
 00456CF5    push        eax
 00456CF6    lea         eax,[ebx+4]
 00456CF9    push        eax
 00456CFA    call        kernel32.InterlockedExchangeAdd
 00456CFF    mov         dword ptr [ebx+8],esi
 00456D02    xor         eax,eax
 00456D04    pop         edx
 00456D05    pop         ecx
 00456D06    pop         ecx
 00456D07    mov         dword ptr fs:[eax],edx
 00456D0A    push        456D24
 00456D0F    mov         eax,dword ptr [ebp-0C]
 00456D12    push        eax
 00456D13    call        kernel32.CloseHandle
 00456D18    ret
>00456D19    jmp         @HandleFinally
>00456D1E    jmp         00456D0F
 00456D20    mov         byte ptr [ebp-5],0
 00456D24    movzx       eax,byte ptr [ebp-5]
 00456D28    pop         edi
 00456D29    pop         esi
 00456D2A    pop         ebx
 00456D2B    mov         esp,ebp
 00456D2D    pop         ebp
 00456D2E    ret
*}
end;

//00456D30
procedure TInternalConditionVariable.UnlockQueue(WaitQueue:PWaitingThread);
begin
{*
 00456D30    and         edx,0FFFFFFFE
 00456D33    mov         dword ptr [eax],edx
 00456D35    ret
*}
end;

//00456D38
procedure TInternalConditionVariable.Wake;
begin
{*
 00456D38    call        TInternalConditionVariable.DequeueWaiter
 00456D3D    test        eax,eax
>00456D3F    je          00456D4A
 00456D41    mov         eax,dword ptr [eax+8]
 00456D44    push        eax
 00456D45    call        kernel32.SetEvent
 00456D4A    ret
*}
end;

//00456D4C
procedure TInternalConditionVariable.WakeAll;
begin
{*
 00456D4C    push        ebp
 00456D4D    mov         ebp,esp
 00456D4F    add         esp,0FFFFFFF8
 00456D52    push        ebx
 00456D53    mov         dword ptr [ebp-4],eax
 00456D56    mov         eax,dword ptr [ebp-4]
 00456D59    call        TInternalConditionVariable.LockQueue
 00456D5E    mov         dword ptr [ebp-8],eax
 00456D61    xor         eax,eax
 00456D63    push        ebp
 00456D64    push        456DB3
 00456D69    push        dword ptr fs:[eax]
 00456D6C    mov         dword ptr fs:[eax],esp
 00456D6F    lea         edx,[ebp-8]
 00456D72    mov         eax,dword ptr [ebp-4]
 00456D75    call        TInternalConditionVariable.DequeueWaiterNoLock
 00456D7A    mov         ebx,eax
 00456D7C    test        ebx,ebx
>00456D7E    je          00456D9A
 00456D80    mov         eax,dword ptr [ebx+8]
 00456D83    push        eax
 00456D84    call        kernel32.SetEvent
 00456D89    lea         edx,[ebp-8]
 00456D8C    mov         eax,dword ptr [ebp-4]
 00456D8F    call        TInternalConditionVariable.DequeueWaiterNoLock
 00456D94    mov         ebx,eax
 00456D96    test        ebx,ebx
>00456D98    jne         00456D80
 00456D9A    xor         eax,eax
 00456D9C    pop         edx
 00456D9D    pop         ecx
 00456D9E    pop         ecx
 00456D9F    mov         dword ptr fs:[eax],edx
 00456DA2    push        456DBA
 00456DA7    mov         eax,dword ptr [ebp-4]
 00456DAA    mov         edx,dword ptr [ebp-8]
 00456DAD    call        TInternalConditionVariable.UnlockQueue
 00456DB2    ret
>00456DB3    jmp         @HandleFinally
>00456DB8    jmp         00456DA7
 00456DBA    pop         ebx
 00456DBB    pop         ecx
 00456DBC    pop         ecx
 00456DBD    pop         ebp
 00456DBE    ret
*}
end;

//00456DC0
function TInterlocked.Add(Increment:Integer):Integer;
begin
{*
 00456DC0    mov         ecx,edx
 00456DC2    xchg        eax,edx
 00456DC3    lock xadd   dword ptr [edx],eax
 00456DC7    add         eax,ecx
 00456DC9    ret
*}
end;

//00456DCC
function TInterlocked.Exchange(Value:Integer):Integer;
begin
{*
 00456DCC    mov         ecx,eax
 00456DCE    mov         eax,dword ptr [ecx]
 00456DD0    lock cmpxchgdword ptr [ecx],edx
>00456DD4    jne         00456DD0
 00456DD6    ret
*}
end;

//00456DD8
procedure InitConditionVariableProcs;
begin
{*
 00456DD8    push        ebx
 00456DD9    push        456E5C
 00456DDE    call        kernel32.GetModuleHandleW
 00456DE3    mov         ebx,eax
 00456DE5    push        456E78
 00456DEA    push        ebx
 00456DEB    call        GetProcAddress
 00456DF0    mov         [00793010],eax
 00456DF5    cmp         dword ptr ds:[793010],0
>00456DFC    jne         00456E28
 00456DFE    mov         dword ptr ds:[793010],456980
 00456E08    mov         dword ptr ds:[793018],456990
 00456E12    mov         dword ptr ds:[79301C],4569A0
 00456E1C    mov         dword ptr ds:[793014],4569B0
 00456E26    pop         ebx
 00456E27    ret
 00456E28    push        456EB0
 00456E2D    push        ebx
 00456E2E    call        GetProcAddress
 00456E33    mov         [00793018],eax
 00456E38    push        456EDC
 00456E3D    push        ebx
 00456E3E    call        GetProcAddress
 00456E43    mov         [0079301C],eax
 00456E48    push        456F10
 00456E4D    push        ebx
 00456E4E    call        GetProcAddress
 00456E53    mov         [00793014],eax
 00456E58    pop         ebx
 00456E59    ret
*}
end;

Initialization
//0078034C
{*
 0078034C    sub         dword ptr ds:[793008],1
>00780353    jae         0078035A
 00780355    call        InitConditionVariableProcs
 0078035A    ret
*}
Finalization
end.