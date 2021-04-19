//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit JclSynch;

interface

uses
  SysUtils, Classes;

type
  TJclWaitResult = (wrAbandoned, wrError, wrIoCompletion, wrSignaled, wrTimeout);
  TJclDispatcherObject = class(TObject)
  published
    procedure WaitAlertable(TimeOut:Cardinal);//00537ED8
    procedure WaitFor(TimeOut:Cardinal);//00537EF4
    procedure WaitForever(?:Boolean);//00537F0C
    constructor sub_00537E30(AHandle:Cardinal);//00537E30
    destructor Destroy();//00537E78
    procedure SignalAndWait(Obj:TJclDispatcherObject; TimeOut:Cardinal; Alertable:Boolean);//00537EA8
  public
    FExisted:Boolean;//f4
    FHandle:Cardinal;//f8
    FName:string;//fC
  end;
  TJclCriticalSection = class(TObject)
  published
    procedure Enter;//00537FBC
    procedure Leave;//00537FC8
    procedure CreateAndEnter(var CS:TJclCriticalSection);//00537F88
    constructor Create;//00537F18
    destructor Destroy();//00537F58
  public
    ........FCriticalSection:_RTL_CRITICAL_SECTION;//f4
    destructor Destroy(); virtual;//00537F58
    constructor Create; virtual;//v0//00537F18
  end;
  TJclMutex = class(TJclDispatcherObject)
  published
    function Acquire(TimeOut:Cardinal):Boolean;//00537FD4
    procedure Release;//0053811C
    constructor Create(SecAttr:PSecurityAttributes; Name:string; InitialOwner:Boolean);//00537FEC
    constructor sub_00538088(Access:Cardinal; Name:string; Inheritable:Boolean);//00538088
  end;
  EJclMutexError = class(EJclWin32Error)
  end;
    //function sub_00537DF4(?:TJclCriticalSection; ?:TJclCriticalSection; ?:?):?;//00537DF4
    //function sub_00537DFC(?:DWORD):?;//00537DFC

implementation

//00537DF4
{*function sub_00537DF4(?:TJclCriticalSection; ?:TJclCriticalSection; ?:?):?;
begin
 00537DF4    xchg        eax,ecx
 00537DF5    lock cmpxchgdword ptr [ecx],edx
 00537DF9    ret
end;*}

//00537DFC
{*function sub_00537DFC(?:DWORD):?;
begin
 00537DFC    cmp         eax,80
>00537E01    jg          00537E0F
>00537E03    je          00537E1D
 00537E05    sub         eax,0FFFFFFFF
>00537E08    je          00537E29
 00537E0A    dec         eax
>00537E0B    je          00537E20
>00537E0D    jmp         00537E2C
 00537E0F    sub         eax,0C0
>00537E14    je          00537E26
 00537E16    sub         eax,42
>00537E19    je          00537E23
>00537E1B    jmp         00537E2C
 00537E1D    xor         eax,eax
 00537E1F    ret
 00537E20    mov         al,3
 00537E22    ret
 00537E23    mov         al,4
 00537E25    ret
 00537E26    mov         al,2
 00537E28    ret
 00537E29    mov         al,1
 00537E2B    ret
 00537E2C    mov         al,1
 00537E2E    ret
end;*}

//00537E30
constructor sub_00537E30(AHandle:Cardinal);
begin
{*
 00537E30    push        ebx
 00537E31    push        esi
 00537E32    push        edi
 00537E33    test        dl,dl
>00537E35    je          00537E3F
 00537E37    add         esp,0FFFFFFF0
 00537E3A    call        @ClassCreate
 00537E3F    mov         esi,ecx
 00537E41    mov         ebx,edx
 00537E43    mov         edi,eax
 00537E45    xor         edx,edx
 00537E47    mov         eax,edi
 00537E49    call        TObject.Create
 00537E4E    mov         byte ptr [edi+4],1;TJclDispatcherObject.FExisted:Boolean
 00537E52    mov         dword ptr [edi+8],esi;TJclDispatcherObject.FHandle:Cardinal
 00537E55    lea         eax,[edi+0C];TJclDispatcherObject.FName:string
 00537E58    call        @UStrClr
 00537E5D    mov         eax,edi
 00537E5F    test        bl,bl
>00537E61    je          00537E72
 00537E63    call        @AfterConstruction
 00537E68    pop         dword ptr fs:[0]
 00537E6F    add         esp,0C
 00537E72    mov         eax,edi
 00537E74    pop         edi
 00537E75    pop         esi
 00537E76    pop         ebx
 00537E77    ret
*}
end;

//00537E78
destructor TJclDispatcherObject.Destroy();
begin
{*
 00537E78    push        ebx
 00537E79    push        esi
 00537E7A    call        @BeforeDestruction
 00537E7F    mov         ebx,edx
 00537E81    mov         esi,eax
 00537E83    mov         eax,dword ptr [esi+8];TJclDispatcherObject.FHandle:Cardinal
 00537E86    push        eax
 00537E87    call        kernel32.CloseHandle
 00537E8C    mov         edx,ebx
 00537E8E    and         dl,0FC
 00537E91    mov         eax,esi
 00537E93    call        TObject.Destroy
 00537E98    test        bl,bl
>00537E9A    jle         00537EA3
 00537E9C    mov         eax,esi
 00537E9E    call        @ClassDestroy
 00537EA3    pop         esi
 00537EA4    pop         ebx
 00537EA5    ret
*}
end;

//00537EA8
procedure TJclDispatcherObject.SignalAndWait(Obj:TJclDispatcherObject; TimeOut:Cardinal; Alertable:Boolean);
begin
{*
 00537EA8    push        ebp
 00537EA9    mov         ebp,esp
 00537EAB    push        ebx
 00537EAC    push        esi
 00537EAD    push        edi
 00537EAE    mov         edi,ecx
 00537EB0    mov         esi,edx
 00537EB2    mov         ebx,eax
 00537EB4    cmp         byte ptr [ebp+8],1
 00537EB8    cmc
 00537EB9    sbb         eax,eax
 00537EBB    push        eax
 00537EBC    push        edi
 00537EBD    mov         eax,dword ptr [ebx+8];TJclDispatcherObject.FHandle:Cardinal
 00537EC0    push        eax
 00537EC1    mov         eax,dword ptr [esi+8];TJclDispatcherObject.FHandle:Cardinal
 00537EC4    push        eax
 00537EC5    call        kernel32.SignalObjectAndWait
 00537ECA    call        00537DFC
 00537ECF    pop         edi
 00537ED0    pop         esi
 00537ED1    pop         ebx
 00537ED2    pop         ebp
 00537ED3    ret         4
*}
end;

//00537ED8
procedure TJclDispatcherObject.WaitAlertable(TimeOut:Cardinal);
begin
{*
 00537ED8    push        ebx
 00537ED9    push        esi
 00537EDA    mov         esi,edx
 00537EDC    mov         ebx,eax
 00537EDE    push        0FF
 00537EE0    push        esi
 00537EE1    mov         eax,dword ptr [ebx+8];TJclDispatcherObject.FHandle:Cardinal
 00537EE4    push        eax
 00537EE5    call        kernel32.WaitForSingleObjectEx
 00537EEA    call        00537DFC
 00537EEF    pop         esi
 00537EF0    pop         ebx
 00537EF1    ret
*}
end;

//00537EF4
procedure TJclDispatcherObject.WaitFor(TimeOut:Cardinal);
begin
{*
 00537EF4    push        ebx
 00537EF5    push        esi
 00537EF6    mov         esi,edx
 00537EF8    mov         ebx,eax
 00537EFA    push        esi
 00537EFB    mov         eax,dword ptr [ebx+8];TJclDispatcherObject.FHandle:Cardinal
 00537EFE    push        eax
 00537EFF    call        kernel32.WaitForSingleObject
 00537F04    call        00537DFC
 00537F09    pop         esi
 00537F0A    pop         ebx
 00537F0B    ret
*}
end;

//00537F0C
procedure TJclDispatcherObject.WaitForever(?:Boolean);
begin
{*
 00537F0C    or          edx,0FFFFFFFF
 00537F0F    call        TJclDispatcherObject.WaitFor
 00537F14    ret
*}
end;

//00537F18
constructor TJclCriticalSection.Create;
begin
{*
 00537F18    push        ebx
 00537F19    push        esi
 00537F1A    test        dl,dl
>00537F1C    je          00537F26
 00537F1E    add         esp,0FFFFFFF0
 00537F21    call        @ClassCreate
 00537F26    mov         ebx,edx
 00537F28    mov         esi,eax
 00537F2A    xor         edx,edx
 00537F2C    mov         eax,esi
 00537F2E    call        TObject.Create
 00537F33    lea         eax,[esi+4];TJclCriticalSection..........FCriticalSection:_RTL_CRITICAL_SECTION
 00537F36    push        eax
 00537F37    call        kernel32.InitializeCriticalSection
 00537F3C    mov         eax,esi
 00537F3E    test        bl,bl
>00537F40    je          00537F51
 00537F42    call        @AfterConstruction
 00537F47    pop         dword ptr fs:[0]
 00537F4E    add         esp,0C
 00537F51    mov         eax,esi
 00537F53    pop         esi
 00537F54    pop         ebx
 00537F55    ret
*}
end;

//00537F58
destructor TJclCriticalSection.Destroy();
begin
{*
 00537F58    push        ebx
 00537F59    push        esi
 00537F5A    call        @BeforeDestruction
 00537F5F    mov         ebx,edx
 00537F61    mov         esi,eax
 00537F63    lea         eax,[esi+4];TJclCriticalSection...........FCriticalSection:_RTL_CRITICAL_SECTION
 00537F66    push        eax
 00537F67    call        kernel32.DeleteCriticalSection
 00537F6C    mov         edx,ebx
 00537F6E    and         dl,0FC
 00537F71    mov         eax,esi
 00537F73    call        TObject.Destroy
 00537F78    test        bl,bl
>00537F7A    jle         00537F83
 00537F7C    mov         eax,esi
 00537F7E    call        @ClassDestroy
 00537F83    pop         esi
 00537F84    pop         ebx
 00537F85    ret
*}
end;

//00537F88
procedure TJclCriticalSection.CreateAndEnter(var CS:TJclCriticalSection);
begin
{*
 00537F88    push        ebx
 00537F89    push        esi
 00537F8A    mov         esi,edx
 00537F8C    mov         dl,1
 00537F8E    mov         eax,[00537808];TJclCriticalSection
 00537F93    call        TJclCriticalSection.Create;TJclCriticalSection.Create
 00537F98    mov         ebx,eax
 00537F9A    mov         eax,esi
 00537F9C    xor         ecx,ecx
 00537F9E    mov         edx,ebx
 00537FA0    call        00537DF4
 00537FA5    test        eax,eax
>00537FA7    je          00537FB0
 00537FA9    mov         eax,ebx
 00537FAB    call        TObject.Free
 00537FB0    mov         eax,dword ptr [esi]
 00537FB2    call        TJclCriticalSection.Enter
 00537FB7    pop         esi
 00537FB8    pop         ebx
 00537FB9    ret
*}
end;

//00537FBC
procedure TJclCriticalSection.Enter;
begin
{*
 00537FBC    add         eax,4;TJclCriticalSection............FCriticalSection:_RTL_CRITICAL_SECTION
 00537FBF    push        eax
 00537FC0    call        kernel32.EnterCriticalSection
 00537FC5    ret
*}
end;

//00537FC8
procedure TJclCriticalSection.Leave;
begin
{*
 00537FC8    add         eax,4;TJclCriticalSection.............FCriticalSection:_RTL_CRITICAL_SECTION
 00537FCB    push        eax
 00537FCC    call        kernel32.LeaveCriticalSection
 00537FD1    ret
*}
end;

//00537FD4
function TJclMutex.Acquire(TimeOut:Cardinal):Boolean;
begin
{*
 00537FD4    push        ebx
 00537FD5    push        esi
 00537FD6    mov         esi,edx
 00537FD8    mov         ebx,eax
 00537FDA    mov         edx,esi
 00537FDC    mov         eax,ebx
 00537FDE    call        TJclDispatcherObject.WaitFor
 00537FE3    cmp         al,3
 00537FE5    sete        al
 00537FE8    pop         esi
 00537FE9    pop         ebx
 00537FEA    ret
*}
end;

//00537FEC
constructor TJclMutex.Create(SecAttr:PSecurityAttributes; Name:string; InitialOwner:Boolean);
begin
{*
 00537FEC    push        ebp
 00537FED    mov         ebp,esp
 00537FEF    add         esp,0FFFFFFF8
 00537FF2    push        ebx
 00537FF3    push        esi
 00537FF4    push        edi
 00537FF5    test        dl,dl
>00537FF7    je          00538001
 00537FF9    add         esp,0FFFFFFF0
 00537FFC    call        @ClassCreate
 00538001    mov         dword ptr [ebp-8],ecx
 00538004    mov         byte ptr [ebp-1],dl
 00538007    mov         ebx,eax
 00538009    mov         esi,dword ptr [ebp+8]
 0053800C    xor         edx,edx
 0053800E    mov         eax,ebx
 00538010    call        TObject.Create
 00538015    lea         eax,[ebx+0C];TJclMutex.FName:string
 00538018    mov         edx,esi
 0053801A    call        @UStrAsg
 0053801F    mov         eax,esi
 00538021    call        @UStrToPWChar
 00538026    push        eax
 00538027    movzx       eax,byte ptr [ebp+0C]
 0053802B    push        eax
 0053802C    mov         eax,dword ptr [ebp-8]
 0053802F    push        eax
 00538030    call        kernel32.CreateMutexW
 00538035    mov         edi,eax
 00538037    mov         dword ptr [ebx+8],edi;TJclMutex.FHandle:Cardinal
 0053803A    test        edi,edi
>0053803C    jne         00538055
 0053803E    mov         ecx,dword ptr ds:[78D880];^SResString466:TResStringRec
 00538044    mov         dl,1
 00538046    mov         eax,[00537B90];EJclMutexError
 0053804B    call        EJclWin32Error.Create;EJclMutexError.Create
 00538050    call        @RaiseExcept
 00538055    call        kernel32.GetLastError
 0053805A    cmp         eax,0B7
 0053805F    sete        al
 00538062    mov         byte ptr [ebx+4],al;TJclMutex.FExisted:Boolean
 00538065    mov         eax,ebx
 00538067    cmp         byte ptr [ebp-1],0
>0053806B    je          0053807C
 0053806D    call        @AfterConstruction
 00538072    pop         dword ptr fs:[0]
 00538079    add         esp,0C
 0053807C    mov         eax,ebx
 0053807E    pop         edi
 0053807F    pop         esi
 00538080    pop         ebx
 00538081    pop         ecx
 00538082    pop         ecx
 00538083    pop         ebp
 00538084    ret         8
*}
end;

//00538088
constructor sub_00538088(Access:Cardinal; Name:string; Inheritable:Boolean);
begin
{*
 00538088    push        ebp
 00538089    mov         ebp,esp
 0053808B    add         esp,0FFFFFFF8
 0053808E    push        ebx
 0053808F    push        esi
 00538090    push        edi
 00538091    test        dl,dl
>00538093    je          0053809D
 00538095    add         esp,0FFFFFFF0
 00538098    call        @ClassCreate
 0053809D    mov         dword ptr [ebp-8],ecx
 005380A0    mov         byte ptr [ebp-1],dl
 005380A3    mov         ebx,eax
 005380A5    mov         esi,dword ptr [ebp+8]
 005380A8    xor         edx,edx
 005380AA    mov         eax,ebx
 005380AC    call        TObject.Create
 005380B1    lea         eax,[ebx+0C];TJclMutex.FName:string
 005380B4    mov         edx,esi
 005380B6    call        @UStrAsg
 005380BB    mov         byte ptr [ebx+4],1;TJclMutex.FExisted:Boolean
 005380BF    mov         eax,esi
 005380C1    call        @UStrToPWChar
 005380C6    push        eax
 005380C7    cmp         byte ptr [ebp+0C],1
 005380CB    cmc
 005380CC    sbb         eax,eax
 005380CE    push        eax
 005380CF    mov         eax,dword ptr [ebp-8]
 005380D2    push        eax
 005380D3    call        kernel32.OpenMutexW
 005380D8    mov         edi,eax
 005380DA    mov         dword ptr [ebx+8],edi;TJclMutex.FHandle:Cardinal
 005380DD    test        edi,edi
>005380DF    jne         005380F8
 005380E1    mov         ecx,dword ptr ds:[78D8F0];^SResString467:TResStringRec
 005380E7    mov         dl,1
 005380E9    mov         eax,[00537B90];EJclMutexError
 005380EE    call        EJclWin32Error.Create;EJclMutexError.Create
 005380F3    call        @RaiseExcept
 005380F8    mov         eax,ebx
 005380FA    cmp         byte ptr [ebp-1],0
>005380FE    je          0053810F
 00538100    call        @AfterConstruction
 00538105    pop         dword ptr fs:[0]
 0053810C    add         esp,0C
 0053810F    mov         eax,ebx
 00538111    pop         edi
 00538112    pop         esi
 00538113    pop         ebx
 00538114    pop         ecx
 00538115    pop         ecx
 00538116    pop         ebp
 00538117    ret         8
*}
end;

//0053811C
procedure TJclMutex.Release;
begin
{*
 0053811C    push        ebx
 0053811D    mov         ebx,eax
 0053811F    mov         eax,dword ptr [ebx+8];TJclMutex.FHandle:Cardinal
 00538122    push        eax
 00538123    call        kernel32.ReleaseMutex
 00538128    cmp         eax,1
 0053812B    sbb         eax,eax
 0053812D    inc         eax
 0053812E    pop         ebx
 0053812F    ret
*}
end;

Initialization
//0078102C
{*
 0078102C    sub         dword ptr ds:[794F98],1
>00781033    jae         00781044
 00781035    mov         edx,788B50;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 0078103A    mov         eax,[00790C38];gvar_00790C38
 0078103F    call        0053F424
 00781044    ret
*}
Finalization
//00538130
{*
 00538130    push        ebp
 00538131    mov         ebp,esp
 00538133    xor         eax,eax
 00538135    push        ebp
 00538136    push        538171
 0053813B    push        dword ptr fs:[eax]
 0053813E    mov         dword ptr fs:[eax],esp
 00538141    inc         dword ptr ds:[794F98]
>00538147    jne         00538163
 00538149    mov         eax,[00790C38];gvar_00790C38
 0053814E    call        0053F440
 00538153    mov         eax,788B50;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00538158    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 0053815E    call        @FinalizeRecord
 00538163    xor         eax,eax
 00538165    pop         edx
 00538166    pop         ecx
 00538167    pop         ecx
 00538168    mov         dword ptr fs:[eax],edx
 0053816B    push        538178
 00538170    ret
>00538171    jmp         @HandleFinally
>00538176    jmp         00538170
 00538178    pop         ebp
 00538179    ret
*}
end.