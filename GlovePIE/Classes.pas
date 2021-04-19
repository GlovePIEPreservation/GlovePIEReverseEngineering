//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Classes;

interface

uses
  SysUtils, Classes;

type
  TComponent.FindComponent$1499$ActRec = class(TInterfacedObject)
  end;
    procedure AfterConstruction;//00451C98
    function CheckTerminated:Boolean;//00451CAC
    procedure CheckThreadError(ErrCode:Integer);//00451CE4
    procedure CheckThreadError(Success:Boolean);//00451D60
    procedure CallOnTerminate;//00451D78
    procedure DoTerminate;//00451D8C
    function GetCurrentThread:TThread;//00451DA0
    procedure InternalStart(Force:Boolean);//00451E14
    function GetPriority:TThreadPriority;//00451EC0
    procedure SetPriority(Value:TThreadPriority);//00451EFC
    procedure Queue(AMethod:TThreadMethod);//00451F28
    procedure Queue(AThreadProc:TThreadProcedure);//00451FB4
    procedure Queue(AMethod:TThreadMethod);//00452080
    procedure RemoveQueuedEvents(AMethod:TThreadMethod);//00452120
    procedure SetReturnValue;//004521F4
    procedure StaticQueue(AMethod:TThreadMethod);//00452230
    procedure Synchronize(ASyncRec:PSynchronizeRecord; QueueEvent:Boolean);//00452244
    procedure Synchronize(AMethod:TThreadMethod);//004523EC
    procedure Synchronize(AThreadProc:TThreadProcedure);//00452420
    procedure Synchronize(AMethod:TThreadMethod);//00452488
    procedure Queue(AThreadProc:TThreadProcedure);//00452518
    procedure Synchronize(AThreadProc:TThreadProcedure);//004525FC
    procedure StaticSynchronize(AMethod:TThreadMethod);//00452698
    procedure RemoveQueuedEvents;//004526AC
    procedure RemoveQueuedEvents;//00452760
    procedure SetSuspended(Value:Boolean);//00452774
    procedure SpinWait;//0045278C
    procedure Sleep;//004527A8
    procedure Yield;//004527B0
    procedure Start;//004527B8
    procedure Suspend;//004527C0
    procedure Resume;//00452830
    procedure Terminate;//00452858
    function WaitFor:Cardinal;//0045287C
    procedure NameThreadForDebugging(AThreadID:Cardinal);//00452940
    constructor Create;//004529E0
    function GetCurrent:TComponent;//00452A24
    function MoveNext:Boolean;//00452A30
    constructor Create;//00452A4C
    destructor Destroy();//00452A98
    procedure BeforeDestruction;//00452AE0
    procedure RemoveFreeNotifications;//00452AEC
    procedure FreeNotification(AComponent:TComponent);//00452B2C
    procedure ReadLeft(Reader:TReader);//00452CC0
    procedure ReadTop(Reader:TReader);//00452CD4
    procedure WriteLeft(Writer:TWriter);//00452CE8
    procedure WriteTop(Writer:TWriter);//00452CF4
    procedure Insert(AComponent:TComponent);//00452D00
    procedure Remove(AComponent:TComponent);//00452D3C
    procedure InsertComponent(AComponent:TComponent);//00452DB4
    procedure RemoveComponent(AComponent:TComponent);//00452E18
    procedure DestroyComponents;//00452E50
    procedure Destroying;//00452EBC
    procedure RemoveNotification(AComponent:TComponent);//00452EF8
    procedure RemoveFreeNotification(AComponent:TComponent);//00452F50
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00452F6C
    procedure DefineProperties(Filer:TFiler);//00452FCC
    procedure HasParent;//00453064
    procedure sub_00453068;//00453068
    procedure sub_00453070;//00453070
    procedure sub_00453074;//00453074
    function GetEnumerator:TComponentEnumerator;//00453078
    procedure GetNamePath;//00453088
    procedure sub_00446E30;//0045309C
    procedure sub_004530A0;//004530A0
    procedure GetParentComponent;//004530A4
    procedure sub_004530A8;//004530A8
    procedure Updating;//004530AC
    procedure Updated;//004530B8
    procedure Loaded;//004530C4
    procedure sub_004530D0;//004530D0
    procedure ReadState(Reader:TReader);//004530D4
    //procedure sub_004530DC(?:?);//004530DC
    procedure ValidateRename(AComponent:TComponent; const CurName:UnicodeString; const NewName:UnicodeString);//004530E4
    procedure ValidateContainer(AComponent:TComponent);//0045316C
    procedure sub_00453180;//00453180
    function FindComponent$1499$ActRec.$0$Body(Item1:Pointer; Item2:Pointer):Integer;//004532F4
    function FindComponent(AName:string):TComponent;//00453300
    function FindSortedComponent(const AName:UnicodeString; var Index:Integer):TComponent;//004533EC
    procedure AddSortedComponent(AComponent:TComponent);//00453464
    procedure SetName(const NewName:TComponentName);//00453488
    procedure ChangeName(const NewName:TComponentName);//00453518
    function GetComponentIndex:Integer;//00453550
    function GetComponent(AIndex:Integer):TComponent;//0045356C
    function GetComponentCount:Integer;//00453598
    procedure SetComponentIndex(Value:Integer);//004535A8
    procedure SetDesigning(Value:Boolean; SetChildren:Boolean);//004535FC
    procedure SetReference(Enable:Boolean);//0045364C
    procedure ExecuteAction(Action:TBasicAction);//00453674
    function UpdateAction(Action:TBasicAction):Boolean;//0045369C
    procedure SetSubComponent(IsSubComponent:Boolean);//004536C4
    function GetComObject:IUnknown;//004536D8
    function SafeCallException(ExceptObject:TObject; ExceptAddr:Pointer):HRESULT;//00453790
    procedure FreeOnRelease;//004537A8
    procedure sub_004537B8;//004537B8
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;//004537C0
    function _AddRef:Integer; stdcall;//00453800
    function _Release:Integer; stdcall;//00453820
    procedure sub_00453840;//00453840
    function IsImplementorOf(I:IInterface):Boolean;//00453844
    function ReferenceInterface(I:IInterface; Operation:TOperation):Boolean;//004538C4
    constructor Create;//0045396C
    procedure sub_004539B0;//004539B0
    destructor Destroy();//004539B4
    procedure Change;//004539E8
    function Execute(AComponent:TComponent):Boolean;//00453A00
    procedure SetAction(Value:TBasicAction);//00453A1C
    function IsOnExecuteLinked:Boolean;//00453A48
    procedure sub_00453A4C;//00453A4C
    function Update:Boolean;//00453A54
    constructor Create;//00453A60
    destructor Destroy();//00453AA4
    function HandlesTarget(Target:TObject):Boolean;//00453B0C
    procedure ExecuteTarget(Target:TObject);//00453B10
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00453B14
    procedure UpdateTarget(Target:TObject);//00453B3C
    procedure Execute;//00453B40
    function Update:Boolean;//00453B5C
    procedure SetOnExecute(Value:TNotifyEvent);//00453B78
    procedure Change;//00453BD4
    procedure RegisterChanges(Value:TBasicActionLink);//00453BE8
    procedure UnRegisterChanges(Value:TBasicActionLink);//00453BF4
    procedure SetActionComponent(const Value:TComponent);//00453C34
    constructor Create(Ownership:TStreamOwnership);//00453C60
    destructor Destroy();//00453CAC
    function Read(pv:Pointer; cb:Integer; pcbRead:PLongInt):HRESULT; stdcall;//00453CE4
    function Write(pv:Pointer; cb:Integer; pcbWritten:PLongInt):HRESULT; stdcall;//00453D4C
    function Seek(dlibMove:Int64; dwOrigin:Integer; libNewPosition:Int64):HRESULT; stdcall;//00453DB4
    function SetSize(libNewSize:Int64):HRESULT; stdcall;//00453E38
    function CopyTo(stm:IStream; cb:Int64; cbRead:Int64; cbWritten:Int64):HRESULT; stdcall;//00453E9C
    function Commit(grfCommitFlags:Integer):HRESULT; stdcall;//004540A4
    function Revert:HRESULT; stdcall;//004540B0
    function LockRegion(libOffset:Int64; cb:Int64; dwLockType:Integer):HRESULT; stdcall;//004540BC
    function UnlockRegion(libOffset:Int64; cb:Int64; dwLockType:Integer):HRESULT; stdcall;//004540C8
    function Stat(statstg:tagSTATSTG; grfStatFlag:Integer):HRESULT; stdcall;//004540D4
    function Clone(stm:IStream):HRESULT; stdcall;//00454150
    procedure FreeIntConstList;//00454168
    procedure ModuleUnload(Instance:LongInt);//004541D8
    function StdWndProc(Window:HWND; Message:LongInt; WParam:LongInt; LParam:LongInt):LongInt; stdcall;//004541E0
    function CalcJmpOffset(Src:Pointer; Dest:Pointer):LongInt;//00454200
    function MakeObjectInstance(AMethod:TWndMethod):Pointer;//00454208
    procedure FreeObjectInstance(ObjectInstance:Pointer);//004542A0
    procedure CleanupInstFreeList(BlockStart:PByte; BlockEnd:PByte);//004542B4
    function GetFreeInstBlockItemCount(Item:PObjectInstance; Block:PInstanceBlock):Integer;//004542F0
    procedure ReleaseObjectInstanceBlocks;//00454320
    function AllocateHWnd(AMethod:TWndMethod):HWND;//004543A0
    procedure DeallocateHWnd(Wnd:HWND);//00454454
    constructor Create(FileName:string);//0045447C

implementation

//00451C98
procedure TThread.AfterConstruction;
begin
{*
 00451C98    cmp         byte ptr [eax+0C],0
>00451C9C    jne         00451CAB
 00451C9E    cmp         byte ptr [eax+3C],0
>00451CA2    jne         00451CAB
 00451CA4    mov         dl,1
 00451CA6    call        TThread.InternalStart
 00451CAB    ret
*}
end;

//00451CAC
function TThread.CheckTerminated:Boolean;
begin
{*
 00451CAC    push        ebx
 00451CAD    call        TThread.GetCurrentThread
 00451CB2    mov         ebx,eax
 00451CB4    mov         eax,ebx
 00451CB6    mov         edx,dword ptr ds:[45144C];TExternalThread
 00451CBC    call        @IsClass
 00451CC1    test        al,al
>00451CC3    je          00451CDC
 00451CC5    mov         ecx,dword ptr ds:[78D840];^SResString152:TResStringRec
 00451CCB    mov         dl,1
 00451CCD    mov         eax,[00441338];EThreadExternalException
 00451CD2    call        Exception.CreateRes
 00451CD7    call        @RaiseExcept
 00451CDC    movzx       eax,byte ptr [ebx+0D]
 00451CE0    pop         ebx
 00451CE1    ret
*}
end;

//00451CE4
procedure TThread.CheckThreadError(ErrCode:Integer);
begin
{*
 00451CE4    push        ebp
 00451CE5    mov         ebp,esp
 00451CE7    add         esp,0FFFFFFEC
 00451CEA    push        ebx
 00451CEB    xor         ecx,ecx
 00451CED    mov         dword ptr [ebp-14],ecx
 00451CF0    mov         ebx,edx
 00451CF2    xor         eax,eax
 00451CF4    push        ebp
 00451CF5    push        451D52
 00451CFA    push        dword ptr fs:[eax]
 00451CFD    mov         dword ptr fs:[eax],esp
 00451D00    test        ebx,ebx
>00451D02    je          00451D3C
 00451D04    lea         edx,[ebp-14]
 00451D07    mov         eax,ebx
 00451D09    call        SysErrorMessage
 00451D0E    mov         eax,dword ptr [ebp-14]
 00451D11    mov         dword ptr [ebp-10],eax
 00451D14    mov         byte ptr [ebp-0C],11
 00451D18    mov         dword ptr [ebp-8],ebx
 00451D1B    mov         byte ptr [ebp-4],0
 00451D1F    lea         eax,[ebp-10]
 00451D22    push        eax
 00451D23    push        1
 00451D25    mov         ecx,dword ptr ds:[78D208];^SResString148:TResStringRec
 00451D2B    mov         dl,1
 00451D2D    mov         eax,[004412A8];EThread
 00451D32    call        Exception.CreateResFmt
 00451D37    call        @RaiseExcept
 00451D3C    xor         eax,eax
 00451D3E    pop         edx
 00451D3F    pop         ecx
 00451D40    pop         ecx
 00451D41    mov         dword ptr fs:[eax],edx
 00451D44    push        451D59
 00451D49    lea         eax,[ebp-14]
 00451D4C    call        @UStrClr
 00451D51    ret
>00451D52    jmp         @HandleFinally
>00451D57    jmp         00451D49
 00451D59    pop         ebx
 00451D5A    mov         esp,ebp
 00451D5C    pop         ebp
 00451D5D    ret
*}
end;

//00451D60
procedure TThread.CheckThreadError(Success:Boolean);
begin
{*
 00451D60    push        ebx
 00451D61    mov         ebx,eax
 00451D63    test        dl,dl
>00451D65    jne         00451D75
 00451D67    call        kernel32.GetLastError
 00451D6C    mov         edx,eax
 00451D6E    mov         eax,ebx
 00451D70    call        TThread.CheckThreadError
 00451D75    pop         ebx
 00451D76    ret
*}
end;

//00451D78
procedure TThread.CallOnTerminate;
begin
{*
 00451D78    push        ebx
 00451D79    cmp         word ptr [eax+1A],0
>00451D7E    je          00451D8A
 00451D80    mov         ebx,eax
 00451D82    mov         edx,eax
 00451D84    mov         eax,dword ptr [ebx+1C]
 00451D87    call        dword ptr [ebx+18]
 00451D8A    pop         ebx
 00451D8B    ret
*}
end;

//00451D8C
procedure TThread.DoTerminate;
begin
{*
 00451D8C    cmp         word ptr [eax+1A],0
>00451D91    je          00451D9E
 00451D93    push        eax
 00451D94    push        451D78;TThread.CallOnTerminate
 00451D99    call        TThread.Synchronize
 00451D9E    ret
*}
end;

//00451DA0
function TThread.GetCurrentThread:TThread;
begin
{*
 00451DA0    push        ebx
 00451DA1    push        esi
 00451DA2    call        @GetTls
 00451DA7    cmp         dword ptr [eax+8],0;{TThread.FCurrentThread:TThread}
>00451DAE    jne         00451E05
 00451DB0    mov         dl,1
 00451DB2    mov         eax,[0045144C];TExternalThread
 00451DB7    call        TExternalThread.Create
 00451DBC    mov         ebx,eax
 00451DBE    cmp         dword ptr ds:[792FE8],0
>00451DC5    jne         00451DEE
 00451DC7    mov         dl,1
 00451DC9    mov         eax,[00439D58];TThreadList
 00451DCE    call        TThreadList.Create
 00451DD3    mov         esi,eax
 00451DD5    mov         eax,792FE8
 00451DDA    xor         ecx,ecx
 00451DDC    mov         edx,esi
 00451DDE    call        InterlockedCompareExchangePointer
 00451DE3    test        eax,eax
>00451DE5    je          00451DEE
 00451DE7    mov         eax,esi
 00451DE9    call        TObject.Free
 00451DEE    mov         edx,ebx
 00451DF0    mov         eax,[00792FE8]
 00451DF5    call        TThreadList.Add
 00451DFA    call        @GetTls
 00451DFF    mov         dword ptr [eax+8],ebx;{TThread.FCurrentThread:TThread}
 00451E05    call        @GetTls
 00451E0A    mov         eax,dword ptr [eax+8];{TThread.FCurrentThread:TThread}
 00451E10    pop         esi
 00451E11    pop         ebx
 00451E12    ret
*}
end;

//00451E14
procedure TThread.InternalStart(Force:Boolean);
begin
{*
 00451E14    push        ebp
 00451E15    mov         ebp,esp
 00451E17    push        0
 00451E19    push        0
 00451E1B    push        ebx
 00451E1C    mov         ebx,eax
 00451E1E    xor         eax,eax
 00451E20    push        ebp
 00451E21    push        451EB2
 00451E26    push        dword ptr fs:[eax]
 00451E29    mov         dword ptr fs:[eax],esp
 00451E2C    or          dl,byte ptr [ebx+0C]
>00451E2F    je          00451E76
 00451E31    cmp         byte ptr [ebx+10],0
>00451E35    jne         00451E76
 00451E37    cmp         byte ptr [ebx+3C],0
>00451E3B    jne         00451E76
 00451E3D    mov         byte ptr [ebx+0E],0
 00451E41    mov         byte ptr [ebx+0C],0
 00451E45    mov         eax,dword ptr [ebx+4]
 00451E48    push        eax
 00451E49    call        kernel32.ResumeThread
 00451E4E    cmp         eax,1
>00451E51    je          00451E97
 00451E53    lea         edx,[ebp-4]
 00451E56    mov         eax,[0078D600];^SResString151:TResStringRec
 00451E5B    call        LoadResString
 00451E60    mov         ecx,dword ptr [ebp-4]
 00451E63    mov         dl,1
 00451E65    mov         eax,[004412A8];EThread
 00451E6A    call        Exception.Create
 00451E6F    call        @RaiseExcept
>00451E74    jmp         00451E97
 00451E76    lea         edx,[ebp-8]
 00451E79    mov         eax,[0078D600];^SResString151:TResStringRec
 00451E7E    call        LoadResString
 00451E83    mov         ecx,dword ptr [ebp-8]
 00451E86    mov         dl,1
 00451E88    mov         eax,[004412A8];EThread
 00451E8D    call        Exception.Create
 00451E92    call        @RaiseExcept
 00451E97    xor         eax,eax
 00451E99    pop         edx
 00451E9A    pop         ecx
 00451E9B    pop         ecx
 00451E9C    mov         dword ptr fs:[eax],edx
 00451E9F    push        451EB9
 00451EA4    lea         eax,[ebp-8]
 00451EA7    mov         edx,2
 00451EAC    call        @UStrArrayClr
 00451EB1    ret
>00451EB2    jmp         @HandleFinally
>00451EB7    jmp         00451EA4
 00451EB9    pop         ebx
 00451EBA    pop         ecx
 00451EBB    pop         ecx
 00451EBC    pop         ebp
 00451EBD    ret
*}
end;

//00451EC0
function TThread.GetPriority:TThreadPriority;
begin
{*
 00451EC0    push        ebx
 00451EC1    push        esi
 00451EC2    mov         ebx,eax
 00451EC4    mov         eax,dword ptr [ebx+4]
 00451EC7    push        eax
 00451EC8    call        kernel32.GetThreadPriority
 00451ECD    mov         esi,eax
 00451ECF    cmp         esi,7FFFFFFF
 00451ED5    setne       dl
 00451ED8    mov         eax,ebx
 00451EDA    call        TThread.CheckThreadError
 00451EDF    mov         al,3
 00451EE1    xor         edx,edx
 00451EE3    mov         ecx,785140
 00451EE8    cmp         esi,dword ptr [ecx]
>00451EEA    jne         00451EEE
 00451EEC    mov         eax,edx
 00451EEE    inc         edx
 00451EEF    add         ecx,4
 00451EF2    cmp         dl,7
>00451EF5    jne         00451EE8
 00451EF7    pop         esi
 00451EF8    pop         ebx
 00451EF9    ret
*}
end;

//00451EFC
procedure TThread.SetPriority(Value:TThreadPriority);
begin
{*
 00451EFC    push        ebx
 00451EFD    push        esi
 00451EFE    mov         ebx,edx
 00451F00    mov         esi,eax
 00451F02    movzx       eax,bl
 00451F05    mov         eax,dword ptr [eax*4+785140]
 00451F0C    push        eax
 00451F0D    mov         eax,dword ptr [esi+4]
 00451F10    push        eax
 00451F11    call        kernel32.SetThreadPriority
 00451F16    cmp         eax,1
 00451F19    sbb         edx,edx
 00451F1B    inc         edx
 00451F1C    mov         eax,esi
 00451F1E    call        TThread.CheckThreadError
 00451F23    pop         esi
 00451F24    pop         ebx
 00451F25    ret
*}
end;

//00451F28
procedure TThread.Queue(AMethod:TThreadMethod);
begin
{*
 00451F28    push        ebp
 00451F29    mov         ebp,esp
 00451F2B    push        ecx
 00451F2C    push        ebx
 00451F2D    mov         ebx,eax
 00451F2F    mov         edx,dword ptr ds:[4414BC];TThread.TSynchronizeRecord
 00451F35    mov         eax,18
 00451F3A    call        @New
 00451F3F    mov         dword ptr [ebp-4],eax
 00451F42    xor         eax,eax
 00451F44    push        ebp
 00451F45    push        451FA6
 00451F4A    push        dword ptr fs:[eax]
 00451F4D    mov         dword ptr fs:[eax],esp
 00451F50    mov         eax,dword ptr [ebp-4]
 00451F53    mov         dword ptr [eax],ebx
 00451F55    mov         eax,dword ptr [ebp-4]
 00451F58    xor         edx,edx
 00451F5A    mov         dword ptr [eax+14],edx
 00451F5D    mov         eax,dword ptr [ebp-4]
 00451F60    mov         edx,dword ptr [ebp+8]
 00451F63    mov         dword ptr [eax+8],edx
 00451F66    mov         edx,dword ptr [ebp+0C]
 00451F69    mov         dword ptr [eax+0C],edx
 00451F6C    mov         eax,dword ptr [ebx]
 00451F6E    mov         cl,1
 00451F70    mov         edx,dword ptr [ebp-4]
 00451F73    call        TThread.Synchronize
 00451F78    xor         eax,eax
 00451F7A    pop         edx
 00451F7B    pop         ecx
 00451F7C    pop         ecx
 00451F7D    mov         dword ptr fs:[eax],edx
 00451F80    push        451FAD
 00451F85    call        TThread.GetCurrentThread
 00451F8A    mov         eax,dword ptr [eax+8]
 00451F8D    mov         edx,dword ptr ds:[78DB78];MainThreadID:Cardinal
 00451F93    cmp         eax,dword ptr [edx]
>00451F95    jne         00451FA5
 00451F97    mov         edx,dword ptr ds:[4414BC];TThread.TSynchronizeRecord
 00451F9D    mov         eax,dword ptr [ebp-4]
 00451FA0    call        @Dispose
 00451FA5    ret
>00451FA6    jmp         @HandleFinally
>00451FAB    jmp         00451F85
 00451FAD    pop         ebx
 00451FAE    pop         ecx
 00451FAF    pop         ebp
 00451FB0    ret         8
*}
end;

//00451FB4
procedure TThread.Queue(AThreadProc:TThreadProcedure);
begin
{*
 00451FB4    push        ebp
 00451FB5    mov         ebp,esp
 00451FB7    add         esp,0FFFFFFF8
 00451FBA    push        ebx
 00451FBB    mov         dword ptr [ebp-4],edx
 00451FBE    mov         ebx,eax
 00451FC0    mov         eax,dword ptr [ebp-4]
 00451FC3    call        @IntfAddRef
 00451FC8    xor         eax,eax
 00451FCA    push        ebp
 00451FCB    push        452074
 00451FD0    push        dword ptr fs:[eax]
 00451FD3    mov         dword ptr fs:[eax],esp
 00451FD6    mov         edx,dword ptr ds:[4414BC];TThread.TSynchronizeRecord
 00451FDC    mov         eax,18
 00451FE1    call        @New
 00451FE6    mov         dword ptr [ebp-8],eax
 00451FE9    xor         eax,eax
 00451FEB    push        ebp
 00451FEC    push        452057
 00451FF1    push        dword ptr fs:[eax]
 00451FF4    mov         dword ptr fs:[eax],esp
 00451FF7    mov         eax,dword ptr [ebp-8]
 00451FFA    mov         dword ptr [eax],ebx
 00451FFC    mov         eax,dword ptr [ebp-8]
 00451FFF    xor         edx,edx
 00452001    mov         dword ptr [eax+14],edx
 00452004    mov         eax,dword ptr [ebp-8]
 00452007    xor         edx,edx
 00452009    mov         dword ptr [eax+8],edx
 0045200C    mov         dword ptr [eax+0C],edx
 0045200F    mov         eax,dword ptr [ebp-8]
 00452012    add         eax,10
 00452015    mov         edx,dword ptr [ebp-4]
 00452018    call        @IntfCopy
 0045201D    mov         eax,dword ptr [ebx]
 0045201F    mov         cl,1
 00452021    mov         edx,dword ptr [ebp-8]
 00452024    call        TThread.Synchronize
 00452029    xor         eax,eax
 0045202B    pop         edx
 0045202C    pop         ecx
 0045202D    pop         ecx
 0045202E    mov         dword ptr fs:[eax],edx
 00452031    push        45205E
 00452036    call        TThread.GetCurrentThread
 0045203B    mov         eax,dword ptr [eax+8]
 0045203E    mov         edx,dword ptr ds:[78DB78];MainThreadID:Cardinal
 00452044    cmp         eax,dword ptr [edx]
>00452046    jne         00452056
 00452048    mov         edx,dword ptr ds:[4414BC];TThread.TSynchronizeRecord
 0045204E    mov         eax,dword ptr [ebp-8]
 00452051    call        @Dispose
 00452056    ret
>00452057    jmp         @HandleFinally
>0045205C    jmp         00452036
 0045205E    xor         eax,eax
 00452060    pop         edx
 00452061    pop         ecx
 00452062    pop         ecx
 00452063    mov         dword ptr fs:[eax],edx
 00452066    push        45207B
 0045206B    lea         eax,[ebp-4]
 0045206E    call        @IntfClear
 00452073    ret
>00452074    jmp         @HandleFinally
>00452079    jmp         0045206B
 0045207B    pop         ebx
 0045207C    pop         ecx
 0045207D    pop         ecx
 0045207E    pop         ebp
 0045207F    ret
*}
end;

//00452080
procedure TThread.Queue(AMethod:TThreadMethod);
begin
{*
 00452080    push        ebp
 00452081    mov         ebp,esp
 00452083    push        ecx
 00452084    test        eax,eax
>00452086    je          00452098
 00452088    push        dword ptr [ebp+0C]
 0045208B    push        dword ptr [ebp+8]
 0045208E    call        TThread.Queue
>00452093    jmp         0045211B
 00452098    mov         edx,dword ptr ds:[4414BC];TThread.TSynchronizeRecord
 0045209E    mov         eax,18
 004520A3    call        @New
 004520A8    mov         dword ptr [ebp-4],eax
 004520AB    xor         eax,eax
 004520AD    push        ebp
 004520AE    push        452114
 004520B3    push        dword ptr fs:[eax]
 004520B6    mov         dword ptr fs:[eax],esp
 004520B9    mov         eax,dword ptr [ebp-4]
 004520BC    xor         edx,edx
 004520BE    mov         dword ptr [eax],edx
 004520C0    mov         eax,dword ptr [ebp-4]
 004520C3    xor         edx,edx
 004520C5    mov         dword ptr [eax+14],edx
 004520C8    mov         eax,dword ptr [ebp-4]
 004520CB    mov         edx,dword ptr [ebp+8]
 004520CE    mov         dword ptr [eax+8],edx
 004520D1    mov         edx,dword ptr [ebp+0C]
 004520D4    mov         dword ptr [eax+0C],edx
 004520D7    mov         cl,1
 004520D9    mov         edx,dword ptr [ebp-4]
 004520DC    mov         eax,[00441550];TThread
 004520E1    call        TThread.Synchronize
 004520E6    xor         eax,eax
 004520E8    pop         edx
 004520E9    pop         ecx
 004520EA    pop         ecx
 004520EB    mov         dword ptr fs:[eax],edx
 004520EE    push        45211B
 004520F3    call        TThread.GetCurrentThread
 004520F8    mov         eax,dword ptr [eax+8]
 004520FB    mov         edx,dword ptr ds:[78DB78];MainThreadID:Cardinal
 00452101    cmp         eax,dword ptr [edx]
>00452103    jne         00452113
 00452105    mov         edx,dword ptr ds:[4414BC];TThread.TSynchronizeRecord
 0045210B    mov         eax,dword ptr [ebp-4]
 0045210E    call        @Dispose
 00452113    ret
>00452114    jmp         @HandleFinally
>00452119    jmp         004520F3
 0045211B    pop         ecx
 0045211C    pop         ebp
 0045211D    ret         8
*}
end;

//00452120
procedure TThread.RemoveQueuedEvents(AMethod:TThreadMethod);
begin
{*
 00452120    push        ebp
 00452121    mov         ebp,esp
 00452123    push        ebx
 00452124    push        esi
 00452125    push        edi
 00452126    mov         edi,eax
 00452128    mov         ebx,dword ptr ds:[792FE4]
 0045212E    call        TMonitor.CheckMonitorSupport
 00452133    mov         eax,ebx
 00452135    call        TMonitor.GetMonitor
 0045213A    or          edx,0FFFFFFFF
 0045213D    call        TMonitor.Enter
 00452142    xor         eax,eax
 00452144    push        ebp
 00452145    push        4521E3
 0045214A    push        dword ptr fs:[eax]
 0045214D    mov         dword ptr fs:[eax],esp
 00452150    cmp         dword ptr ds:[78513C],0;gvar_0078513C
>00452157    je          004521CB
 00452159    mov         eax,[0078513C];gvar_0078513C
 0045215E    mov         esi,dword ptr [eax+8]
 00452161    dec         esi
 00452162    cmp         esi,0
>00452165    jl          004521CB
 00452167    mov         edx,esi
 00452169    mov         eax,[0078513C];gvar_0078513C
 0045216E    call        TList.Get
 00452173    mov         ebx,eax
 00452175    cmp         dword ptr [ebx+8],0
>00452179    jne         004521C5
 0045217B    test        edi,edi
>0045217D    je          00452185
 0045217F    mov         eax,dword ptr [ebx]
 00452181    cmp         edi,dword ptr [eax]
>00452183    je          004521A0
 00452185    cmp         word ptr [ebp+0A],0
>0045218A    je          004521C5
 0045218C    mov         eax,dword ptr [ebx]
 0045218E    mov         eax,dword ptr [eax+8]
 00452191    cmp         eax,dword ptr [ebp+8]
>00452194    jne         004521C5
 00452196    mov         eax,dword ptr [ebx]
 00452198    mov         eax,dword ptr [eax+0C]
 0045219B    cmp         eax,dword ptr [ebp+0C]
>0045219E    jne         004521C5
 004521A0    mov         edx,esi
 004521A2    mov         eax,[0078513C];gvar_0078513C
 004521A7    call        TList.Delete
 004521AC    mov         eax,dword ptr [ebx]
 004521AE    mov         edx,dword ptr ds:[4414BC];TThread.TSynchronizeRecord
 004521B4    call        @Dispose
 004521B9    mov         edx,0C
 004521BE    mov         eax,ebx
 004521C0    call        @FreeMem
 004521C5    dec         esi
 004521C6    cmp         esi,0FFFFFFFF
>004521C9    jne         00452167
 004521CB    xor         eax,eax
 004521CD    pop         edx
 004521CE    pop         ecx
 004521CF    pop         ecx
 004521D0    mov         dword ptr fs:[eax],edx
 004521D3    push        4521EA
 004521D8    mov         eax,[00792FE4]
 004521DD    call        TMonitor.Exit
 004521E2    ret
>004521E3    jmp         @HandleFinally
>004521E8    jmp         004521D8
 004521EA    pop         edi
 004521EB    pop         esi
 004521EC    pop         ebx
 004521ED    pop         ebp
 004521EE    ret         8
*}
end;

//004521F4
procedure TThread.SetReturnValue;
begin
{*
 004521F4    push        ebx
 004521F5    push        esi
 004521F6    mov         esi,eax
 004521F8    call        TThread.GetCurrentThread
 004521FD    mov         ebx,eax
 004521FF    mov         eax,ebx
 00452201    mov         edx,dword ptr ds:[45144C];TExternalThread
 00452207    call        @IsClass
 0045220C    test        al,al
>0045220E    je          00452227
 00452210    mov         ecx,dword ptr ds:[78D0D0];^SResString153:TResStringRec
 00452216    mov         dl,1
 00452218    mov         eax,[00441338];EThreadExternalException
 0045221D    call        Exception.CreateRes
 00452222    call        @RaiseExcept
 00452227    mov         dword ptr [ebx+14],esi
 0045222A    pop         esi
 0045222B    pop         ebx
 0045222C    ret
*}
end;

//00452230
procedure TThread.StaticQueue(AMethod:TThreadMethod);
begin
{*
 00452230    push        ebp
 00452231    mov         ebp,esp
 00452233    push        dword ptr [ebp+0C]
 00452236    push        dword ptr [ebp+8]
 00452239    call        TThread.Queue
 0045223E    pop         ebp
 0045223F    ret         8
*}
end;

//00452244
procedure TThread.Synchronize(ASyncRec:PSynchronizeRecord; QueueEvent:Boolean);
begin
{*
 00452244    push        ebp
 00452245    mov         ebp,esp
 00452247    add         esp,0FFFFFFE8
 0045224A    push        ebx
 0045224B    push        esi
 0045224C    mov         byte ptr [ebp-5],cl
 0045224F    mov         dword ptr [ebp-4],edx
 00452252    call        TThread.GetCurrentThread
 00452257    mov         eax,dword ptr [eax+8]
 0045225A    mov         edx,dword ptr ds:[78DB78];MainThreadID:Cardinal
 00452260    cmp         eax,dword ptr [edx]
>00452262    jne         00452299
 00452264    mov         eax,dword ptr [ebp-4]
 00452267    cmp         word ptr [eax+0A],0
>0045226C    je          0045227C
 0045226E    mov         ebx,dword ptr [ebp-4]
 00452271    mov         eax,dword ptr [ebx+0C]
 00452274    call        dword ptr [ebx+8]
>00452277    jmp         004523E3
 0045227C    mov         eax,dword ptr [ebp-4]
 0045227F    cmp         dword ptr [eax+10],0
>00452283    je          004523E3
 00452289    mov         eax,dword ptr [ebp-4]
 0045228C    mov         eax,dword ptr [eax+10]
 0045228F    mov         edx,dword ptr [eax]
 00452291    call        dword ptr [edx+0C]
>00452294    jmp         004523E3
 00452299    cmp         byte ptr [ebp-5],0
>0045229D    je          004522AE
 0045229F    mov         eax,0C
 004522A4    call        @GetMem
 004522A9    mov         dword ptr [ebp-0C],eax
>004522AC    jmp         004522B4
 004522AE    lea         eax,[ebp-18]
 004522B1    mov         dword ptr [ebp-0C],eax
 004522B4    movzx       ebx,byte ptr [ebp-5]
 004522B8    xor         bl,1
 004522BB    test        bl,bl
>004522BD    je          004522D3
 004522BF    mov         dl,1
 004522C1    mov         eax,[004014B0];TObject
 004522C6    call        TObject.Create
 004522CB    mov         edx,dword ptr [ebp-0C]
 004522CE    mov         dword ptr [edx+8],eax
>004522D1    jmp         004522DB
 004522D3    mov         eax,dword ptr [ebp-0C]
 004522D6    xor         edx,edx
 004522D8    mov         dword ptr [eax+8],edx
 004522DB    xor         eax,eax
 004522DD    push        ebp
 004522DE    push        4523C2
 004522E3    push        dword ptr fs:[eax]
 004522E6    mov         dword ptr fs:[eax],esp
 004522E9    mov         esi,dword ptr ds:[792FE4]
 004522EF    call        TMonitor.CheckMonitorSupport
 004522F4    mov         eax,esi
 004522F6    call        TMonitor.GetMonitor
 004522FB    or          edx,0FFFFFFFF
 004522FE    call        TMonitor.Enter
 00452303    xor         eax,eax
 00452305    push        ebp
 00452306    push        45239C
 0045230B    push        dword ptr fs:[eax]
 0045230E    mov         dword ptr fs:[eax],esp
 00452311    mov         eax,dword ptr [ebp-0C]
 00452314    movzx       edx,byte ptr [ebp-5]
 00452318    mov         byte ptr [eax+4],dl
 0045231B    cmp         dword ptr ds:[78513C],0;gvar_0078513C
>00452322    jne         00452335
 00452324    mov         dl,1
 00452326    mov         eax,[00439644];TList
 0045232B    call        TObject.Create
 00452330    mov         [0078513C],eax;gvar_0078513C
 00452335    mov         eax,dword ptr [ebp-0C]
 00452338    mov         edx,dword ptr [ebp-4]
 0045233B    mov         dword ptr [eax],edx
 0045233D    mov         edx,dword ptr [ebp-0C]
 00452340    mov         eax,[0078513C];gvar_0078513C
 00452345    call        TList.Add
 0045234A    call        SignalSyncEvent
 0045234F    cmp         word ptr ds:[78507A],0
>00452357    je          0045236C
 00452359    mov         eax,dword ptr [ebp-0C]
 0045235C    mov         eax,dword ptr [eax]
 0045235E    mov         edx,dword ptr [eax]
 00452360    mov         eax,dword ptr ds:[78507C]
 00452366    call        dword ptr ds:[785078]
 0045236C    test        bl,bl
>0045236E    je          00452384
 00452370    mov         eax,dword ptr [ebp-0C]
 00452373    mov         eax,dword ptr [eax+8]
 00452376    or          ecx,0FFFFFFFF
 00452379    mov         edx,dword ptr ds:[792FE4]
 0045237F    call        TMonitor.Wait
 00452384    xor         eax,eax
 00452386    pop         edx
 00452387    pop         ecx
 00452388    pop         ecx
 00452389    mov         dword ptr fs:[eax],edx
 0045238C    push        4523A3
 00452391    mov         eax,[00792FE4]
 00452396    call        TMonitor.Exit
 0045239B    ret
>0045239C    jmp         @HandleFinally
>004523A1    jmp         00452391
 004523A3    xor         eax,eax
 004523A5    pop         edx
 004523A6    pop         ecx
 004523A7    pop         ecx
 004523A8    mov         dword ptr fs:[eax],edx
 004523AB    push        4523C9
 004523B0    cmp         byte ptr [ebp-5],0
>004523B4    jne         004523C1
 004523B6    mov         eax,dword ptr [ebp-0C]
 004523B9    mov         eax,dword ptr [eax+8]
 004523BC    call        TObject.Free
 004523C1    ret
>004523C2    jmp         @HandleFinally
>004523C7    jmp         004523B0
 004523C9    cmp         byte ptr [ebp-5],0
>004523CD    jne         004523E3
 004523CF    mov         eax,dword ptr [ebp-4]
 004523D2    cmp         dword ptr [eax+14],0
>004523D6    je          004523E3
 004523D8    mov         eax,dword ptr [ebp-4]
 004523DB    mov         eax,dword ptr [eax+14]
 004523DE    call        @RaiseExcept
 004523E3    pop         esi
 004523E4    pop         ebx
 004523E5    mov         esp,ebp
 004523E7    pop         ebp
 004523E8    ret
*}
end;

//004523EC
procedure TThread.Synchronize(AMethod:TThreadMethod);
begin
{*
 004523EC    push        ebp
 004523ED    mov         ebp,esp
 004523EF    push        ebx
 004523F0    mov         ebx,eax
 004523F2    mov         dword ptr [ebx+20],ebx
 004523F5    xor         eax,eax
 004523F7    mov         dword ptr [ebx+34],eax
 004523FA    mov         eax,dword ptr [ebp+8]
 004523FD    mov         dword ptr [ebx+28],eax
 00452400    mov         eax,dword ptr [ebp+0C]
 00452403    mov         dword ptr [ebx+2C],eax
 00452406    lea         eax,[ebx+30]
 00452409    call        @IntfClear
 0045240E    lea         edx,[ebx+20]
 00452411    xor         ecx,ecx
 00452413    mov         eax,dword ptr [ebx]
 00452415    call        TThread.Synchronize
 0045241A    pop         ebx
 0045241B    pop         ebp
 0045241C    ret         8
*}
end;

//00452420
procedure TThread.Synchronize(AThreadProc:TThreadProcedure);
begin
{*
 00452420    push        ebp
 00452421    mov         ebp,esp
 00452423    push        ecx
 00452424    push        ebx
 00452425    mov         dword ptr [ebp-4],edx
 00452428    mov         ebx,eax
 0045242A    mov         eax,dword ptr [ebp-4]
 0045242D    call        @IntfAddRef
 00452432    xor         eax,eax
 00452434    push        ebp
 00452435    push        45247D
 0045243A    push        dword ptr fs:[eax]
 0045243D    mov         dword ptr fs:[eax],esp
 00452440    mov         dword ptr [ebx+20],ebx
 00452443    xor         eax,eax
 00452445    mov         dword ptr [ebx+34],eax
 00452448    xor         eax,eax
 0045244A    mov         dword ptr [ebx+28],eax
 0045244D    mov         dword ptr [ebx+2C],eax
 00452450    lea         eax,[ebx+30]
 00452453    mov         edx,dword ptr [ebp-4]
 00452456    call        @IntfCopy
 0045245B    lea         edx,[ebx+20]
 0045245E    xor         ecx,ecx
 00452460    mov         eax,dword ptr [ebx]
 00452462    call        TThread.Synchronize
 00452467    xor         eax,eax
 00452469    pop         edx
 0045246A    pop         ecx
 0045246B    pop         ecx
 0045246C    mov         dword ptr fs:[eax],edx
 0045246F    push        452484
 00452474    lea         eax,[ebp-4]
 00452477    call        @IntfClear
 0045247C    ret
>0045247D    jmp         @HandleFinally
>00452482    jmp         00452474
 00452484    pop         ebx
 00452485    pop         ecx
 00452486    pop         ebp
 00452487    ret
*}
end;

//00452488
procedure TThread.Synchronize(AMethod:TThreadMethod);
begin
{*
 00452488    push        ebp
 00452489    mov         ebp,esp
 0045248B    add         esp,0FFFFFFE8
 0045248E    push        ebx
 0045248F    mov         ebx,eax
 00452491    lea         eax,[ebp-18]
 00452494    mov         edx,dword ptr ds:[4414BC];TThread.TSynchronizeRecord
 0045249A    call        @InitializeRecord
 0045249F    xor         eax,eax
 004524A1    push        ebp
 004524A2    push        452509
 004524A7    push        dword ptr fs:[eax]
 004524AA    mov         dword ptr fs:[eax],esp
 004524AD    test        ebx,ebx
>004524AF    je          004524C0
 004524B1    push        dword ptr [ebp+0C]
 004524B4    push        dword ptr [ebp+8]
 004524B7    mov         eax,ebx
 004524B9    call        TThread.Synchronize
>004524BE    jmp         004524ED
 004524C0    xor         eax,eax
 004524C2    mov         dword ptr [ebp-18],eax
 004524C5    xor         eax,eax
 004524C7    mov         dword ptr [ebp-4],eax
 004524CA    mov         eax,dword ptr [ebp+8]
 004524CD    mov         dword ptr [ebp-10],eax
 004524D0    mov         eax,dword ptr [ebp+0C]
 004524D3    mov         dword ptr [ebp-0C],eax
 004524D6    lea         eax,[ebp-8]
 004524D9    call        @IntfClear
 004524DE    lea         edx,[ebp-18]
 004524E1    xor         ecx,ecx
 004524E3    mov         eax,[00441550];TThread
 004524E8    call        TThread.Synchronize
 004524ED    xor         eax,eax
 004524EF    pop         edx
 004524F0    pop         ecx
 004524F1    pop         ecx
 004524F2    mov         dword ptr fs:[eax],edx
 004524F5    push        452510
 004524FA    lea         eax,[ebp-18]
 004524FD    mov         edx,dword ptr ds:[4414BC];TThread.TSynchronizeRecord
 00452503    call        @FinalizeRecord
 00452508    ret
>00452509    jmp         @HandleFinally
>0045250E    jmp         004524FA
 00452510    pop         ebx
 00452511    mov         esp,ebp
 00452513    pop         ebp
 00452514    ret         8
*}
end;

//00452518
procedure TThread.Queue(AThreadProc:TThreadProcedure);
begin
{*
 00452518    push        ebp
 00452519    mov         ebp,esp
 0045251B    add         esp,0FFFFFFF8
 0045251E    push        ebx
 0045251F    mov         dword ptr [ebp-4],edx
 00452522    mov         ebx,eax
 00452524    mov         eax,dword ptr [ebp-4]
 00452527    call        @IntfAddRef
 0045252C    xor         eax,eax
 0045252E    push        ebp
 0045252F    push        4525F0
 00452534    push        dword ptr fs:[eax]
 00452537    mov         dword ptr fs:[eax],esp
 0045253A    test        ebx,ebx
>0045253C    je          0045254D
 0045253E    mov         edx,dword ptr [ebp-4]
 00452541    mov         eax,ebx
 00452543    call        TThread.Queue
>00452548    jmp         004525DA
 0045254D    mov         edx,dword ptr ds:[4414BC];TThread.TSynchronizeRecord
 00452553    mov         eax,18
 00452558    call        @New
 0045255D    mov         dword ptr [ebp-8],eax
 00452560    xor         eax,eax
 00452562    push        ebp
 00452563    push        4525D3
 00452568    push        dword ptr fs:[eax]
 0045256B    mov         dword ptr fs:[eax],esp
 0045256E    mov         eax,dword ptr [ebp-8]
 00452571    xor         edx,edx
 00452573    mov         dword ptr [eax],edx
 00452575    mov         eax,dword ptr [ebp-8]
 00452578    xor         edx,edx
 0045257A    mov         dword ptr [eax+14],edx
 0045257D    mov         eax,dword ptr [ebp-8]
 00452580    xor         edx,edx
 00452582    mov         dword ptr [eax+8],edx
 00452585    mov         dword ptr [eax+0C],edx
 00452588    mov         eax,dword ptr [ebp-8]
 0045258B    add         eax,10
 0045258E    mov         edx,dword ptr [ebp-4]
 00452591    call        @IntfCopy
 00452596    mov         cl,1
 00452598    mov         edx,dword ptr [ebp-8]
 0045259B    mov         eax,[00441550];TThread
 004525A0    call        TThread.Synchronize
 004525A5    xor         eax,eax
 004525A7    pop         edx
 004525A8    pop         ecx
 004525A9    pop         ecx
 004525AA    mov         dword ptr fs:[eax],edx
 004525AD    push        4525DA
 004525B2    call        TThread.GetCurrentThread
 004525B7    mov         eax,dword ptr [eax+8]
 004525BA    mov         edx,dword ptr ds:[78DB78];MainThreadID:Cardinal
 004525C0    cmp         eax,dword ptr [edx]
>004525C2    jne         004525D2
 004525C4    mov         edx,dword ptr ds:[4414BC];TThread.TSynchronizeRecord
 004525CA    mov         eax,dword ptr [ebp-8]
 004525CD    call        @Dispose
 004525D2    ret
>004525D3    jmp         @HandleFinally
>004525D8    jmp         004525B2
 004525DA    xor         eax,eax
 004525DC    pop         edx
 004525DD    pop         ecx
 004525DE    pop         ecx
 004525DF    mov         dword ptr fs:[eax],edx
 004525E2    push        4525F7
 004525E7    lea         eax,[ebp-4]
 004525EA    call        @IntfClear
 004525EF    ret
>004525F0    jmp         @HandleFinally
>004525F5    jmp         004525E7
 004525F7    pop         ebx
 004525F8    pop         ecx
 004525F9    pop         ecx
 004525FA    pop         ebp
 004525FB    ret
*}
end;

//004525FC
procedure TThread.Synchronize(AThreadProc:TThreadProcedure);
begin
{*
 004525FC    push        ebp
 004525FD    mov         ebp,esp
 004525FF    add         esp,0FFFFFFE0
 00452602    push        ebx
 00452603    mov         dword ptr [ebp-4],edx
 00452606    mov         ebx,eax
 00452608    mov         eax,dword ptr [ebp-4]
 0045260B    call        @IntfAddRef
 00452610    lea         eax,[ebp-20]
 00452613    mov         edx,dword ptr ds:[4414BC];TThread.TSynchronizeRecord
 00452619    call        @InitializeRecord
 0045261E    xor         eax,eax
 00452620    push        ebp
 00452621    push        45268C
 00452626    push        dword ptr fs:[eax]
 00452629    mov         dword ptr fs:[eax],esp
 0045262C    test        ebx,ebx
>0045262E    je          0045263C
 00452630    mov         edx,dword ptr [ebp-4]
 00452633    mov         eax,ebx
 00452635    call        TThread.Synchronize
>0045263A    jmp         00452668
 0045263C    xor         eax,eax
 0045263E    mov         dword ptr [ebp-20],eax
 00452641    xor         eax,eax
 00452643    mov         dword ptr [ebp-0C],eax
 00452646    xor         eax,eax
 00452648    mov         dword ptr [ebp-18],eax
 0045264B    mov         dword ptr [ebp-14],eax
 0045264E    lea         eax,[ebp-10]
 00452651    mov         edx,dword ptr [ebp-4]
 00452654    call        @IntfCopy
 00452659    lea         edx,[ebp-20]
 0045265C    xor         ecx,ecx
 0045265E    mov         eax,[00441550];TThread
 00452663    call        TThread.Synchronize
 00452668    xor         eax,eax
 0045266A    pop         edx
 0045266B    pop         ecx
 0045266C    pop         ecx
 0045266D    mov         dword ptr fs:[eax],edx
 00452670    push        452693
 00452675    lea         eax,[ebp-20]
 00452678    mov         edx,dword ptr ds:[4414BC];TThread.TSynchronizeRecord
 0045267E    call        @FinalizeRecord
 00452683    lea         eax,[ebp-4]
 00452686    call        @IntfClear
 0045268B    ret
>0045268C    jmp         @HandleFinally
>00452691    jmp         00452675
 00452693    pop         ebx
 00452694    mov         esp,ebp
 00452696    pop         ebp
 00452697    ret
*}
end;

//00452698
procedure TThread.StaticSynchronize(AMethod:TThreadMethod);
begin
{*
 00452698    push        ebp
 00452699    mov         ebp,esp
 0045269B    push        dword ptr [ebp+0C]
 0045269E    push        dword ptr [ebp+8]
 004526A1    call        TThread.Synchronize
 004526A6    pop         ebp
 004526A7    ret         8
*}
end;

//004526AC
procedure TThread.RemoveQueuedEvents;
begin
{*
 004526AC    push        ebp
 004526AD    mov         ebp,esp
 004526AF    push        ebx
 004526B0    push        esi
 004526B1    push        edi
 004526B2    mov         edi,eax
 004526B4    mov         ebx,dword ptr ds:[792FE4]
 004526BA    call        TMonitor.CheckMonitorSupport
 004526BF    mov         eax,ebx
 004526C1    call        TMonitor.GetMonitor
 004526C6    or          edx,0FFFFFFFF
 004526C9    call        TMonitor.Enter
 004526CE    xor         eax,eax
 004526D0    push        ebp
 004526D1    push        452754
 004526D6    push        dword ptr fs:[eax]
 004526D9    mov         dword ptr fs:[eax],esp
 004526DC    cmp         dword ptr ds:[78513C],0;gvar_0078513C
>004526E3    je          0045273C
 004526E5    mov         eax,[0078513C];gvar_0078513C
 004526EA    mov         esi,dword ptr [eax+8]
 004526ED    dec         esi
 004526EE    cmp         esi,0
>004526F1    jl          0045273C
 004526F3    mov         edx,esi
 004526F5    mov         eax,[0078513C];gvar_0078513C
 004526FA    call        TList.Get
 004526FF    mov         ebx,eax
 00452701    cmp         dword ptr [ebx+8],0
>00452705    jne         00452736
 00452707    test        edi,edi
>00452709    je          00452736
 0045270B    mov         eax,dword ptr [ebx]
 0045270D    cmp         edi,dword ptr [eax]
>0045270F    jne         00452736
 00452711    mov         edx,esi
 00452713    mov         eax,[0078513C];gvar_0078513C
 00452718    call        TList.Delete
 0045271D    mov         eax,dword ptr [ebx]
 0045271F    mov         edx,dword ptr ds:[4414BC];TThread.TSynchronizeRecord
 00452725    call        @Dispose
 0045272A    mov         edx,0C
 0045272F    mov         eax,ebx
 00452731    call        @FreeMem
 00452736    dec         esi
 00452737    cmp         esi,0FFFFFFFF
>0045273A    jne         004526F3
 0045273C    xor         eax,eax
 0045273E    pop         edx
 0045273F    pop         ecx
 00452740    pop         ecx
 00452741    mov         dword ptr fs:[eax],edx
 00452744    push        45275B
 00452749    mov         eax,[00792FE4]
 0045274E    call        TMonitor.Exit
 00452753    ret
>00452754    jmp         @HandleFinally
>00452759    jmp         00452749
 0045275B    pop         edi
 0045275C    pop         esi
 0045275D    pop         ebx
 0045275E    pop         ebp
 0045275F    ret
*}
end;

//00452760
procedure TThread.RemoveQueuedEvents;
begin
{*
 00452760    push        ebp
 00452761    mov         ebp,esp
 00452763    push        dword ptr [ebp+0C]
 00452766    push        dword ptr [ebp+8]
 00452769    xor         eax,eax
 0045276B    call        TThread.RemoveQueuedEvents
 00452770    pop         ebp
 00452771    ret         8
*}
end;

//00452774
procedure TThread.SetSuspended(Value:Boolean);
begin
{*
 00452774    cmp         dl,byte ptr [eax+0E]
>00452777    je          00452789
 00452779    test        dl,dl
>0045277B    je          00452784
 0045277D    call        TThread.Suspend
>00452782    jmp         00452789
 00452784    call        TThread.Resume
 00452789    ret
*}
end;

//0045278C
procedure TThread.SpinWait;
begin
{*
 0045278C    push        ebp
 0045278D    mov         ebp,esp
 0045278F    push        ecx
 00452790    mov         dword ptr [ebp-4],eax
 00452793    cmp         dword ptr [ebp-4],0
>00452797    jle         004527A4
 00452799    rep nop
 0045279B    dec         dword ptr [ebp-4]
 0045279E    cmp         dword ptr [ebp-4],0
>004527A2    jg          00452799
 004527A4    pop         ecx
 004527A5    pop         ebp
 004527A6    ret
*}
end;

//004527A8
procedure TThread.Sleep;
begin
{*
 004527A8    push        eax
 004527A9    call        kernel32.Sleep
 004527AE    ret
*}
end;

//004527B0
procedure TThread.Yield;
begin
{*
 004527B0    call        kernel32.SwitchToThread
 004527B5    ret
*}
end;

//004527B8
procedure TThread.Start;
begin
{*
 004527B8    xor         edx,edx
 004527BA    call        TThread.InternalStart
 004527BF    ret
*}
end;

//004527C0
procedure TThread.Suspend;
begin
{*
 004527C0    push        ebp
 004527C1    mov         ebp,esp
 004527C3    add         esp,0FFFFFFF8
 004527C6    push        ebx
 004527C7    push        esi
 004527C8    push        edi
 004527C9    mov         dword ptr [ebp-4],eax
 004527CC    mov         eax,dword ptr [ebp-4]
 004527CF    movzx       eax,byte ptr [eax+0E]
 004527D3    mov         byte ptr [ebp-5],al
 004527D6    xor         eax,eax
 004527D8    push        ebp
 004527D9    push        45280E
 004527DE    push        dword ptr fs:[eax]
 004527E1    mov         dword ptr fs:[eax],esp
 004527E4    mov         eax,dword ptr [ebp-4]
 004527E7    mov         byte ptr [eax+0E],1
 004527EB    mov         eax,dword ptr [ebp-4]
 004527EE    mov         eax,dword ptr [eax+4]
 004527F1    push        eax
 004527F2    call        kernel32.SuspendThread
 004527F7    test        eax,eax
 004527F9    setge       dl
 004527FC    mov         eax,dword ptr [ebp-4]
 004527FF    call        TThread.CheckThreadError
 00452804    xor         eax,eax
 00452806    pop         edx
 00452807    pop         ecx
 00452808    pop         ecx
 00452809    mov         dword ptr fs:[eax],edx
>0045280C    jmp         00452827
>0045280E    jmp         @HandleAnyException
 00452813    mov         eax,dword ptr [ebp-4]
 00452816    movzx       edx,byte ptr [ebp-5]
 0045281A    mov         byte ptr [eax+0E],dl
 0045281D    call        @RaiseAgain
 00452822    call        @DoneExcept
 00452827    pop         edi
 00452828    pop         esi
 00452829    pop         ebx
 0045282A    pop         ecx
 0045282B    pop         ecx
 0045282C    pop         ebp
 0045282D    ret
*}
end;

//00452830
procedure TThread.Resume;
begin
{*
 00452830    push        ebx
 00452831    push        esi
 00452832    mov         ebx,eax
 00452834    mov         eax,dword ptr [ebx+4]
 00452837    push        eax
 00452838    call        kernel32.ResumeThread
 0045283D    mov         esi,eax
 0045283F    test        esi,esi
 00452841    setge       dl
 00452844    mov         eax,ebx
 00452846    call        TThread.CheckThreadError
 0045284B    dec         esi
>0045284C    jne         00452852
 0045284E    mov         byte ptr [ebx+0E],0
 00452852    pop         esi
 00452853    pop         ebx
 00452854    ret
*}
end;

//00452858
procedure TThread.Terminate;
begin
{*
 00452858    cmp         byte ptr [eax+3C],0
>0045285C    je          00452875
 0045285E    mov         ecx,dword ptr ds:[78CE04];^SResString149:TResStringRec
 00452864    mov         dl,1
 00452866    mov         eax,[004412A8];EThread
 0045286B    call        Exception.CreateRes
 00452870    call        @RaiseExcept
 00452875    mov         byte ptr [eax+0D],1
 00452879    ret
*}
end;

//0045287C
function TThread.WaitFor:Cardinal;
begin
{*
 0045287C    push        ebx
 0045287D    push        esi
 0045287E    add         esp,0FFFFFFD8
 00452881    mov         esi,eax
 00452883    cmp         byte ptr [esi+3C],0
>00452887    je          004528A0
 00452889    mov         ecx,dword ptr ds:[78D378];^SResString150:TResStringRec
 0045288F    mov         dl,1
 00452891    mov         eax,[004412A8];EThread
 00452896    call        Exception.CreateRes
 0045289B    call        @RaiseExcept
 004528A0    mov         eax,dword ptr [esi+4]
 004528A3    mov         dword ptr [esp+4],eax
 004528A7    call        TThread.GetCurrentThread
 004528AC    mov         eax,dword ptr [eax+8]
 004528AF    mov         edx,dword ptr ds:[78DB78];MainThreadID:Cardinal
 004528B5    cmp         eax,dword ptr [edx]
>004528B7    jne         00452911
 004528B9    xor         ebx,ebx
 004528BB    mov         eax,[00792FCC]
 004528C0    mov         dword ptr [esp+8],eax
 004528C4    cmp         ebx,2
>004528C7    jne         004528DB
 004528C9    push        0
 004528CB    push        0
 004528CD    push        0
 004528CF    push        0
 004528D1    lea         eax,[esp+1C]
 004528D5    push        eax
 004528D6    call        user32.PeekMessageW
 004528DB    push        40
 004528DD    push        3E8
 004528E2    push        0
 004528E4    lea         eax,[esp+10]
 004528E8    push        eax
 004528E9    push        2
 004528EB    call        user32.MsgWaitForMultipleObjects
 004528F0    mov         ebx,eax
 004528F2    cmp         ebx,0FFFFFFFF
 004528F5    setne       dl
 004528F8    mov         eax,esi
 004528FA    call        TThread.CheckThreadError
 004528FF    cmp         ebx,1
>00452902    jne         0045290B
 00452904    xor         eax,eax
 00452906    call        CheckSynchronize
 0045290B    test        ebx,ebx
>0045290D    jne         004528C4
>0045290F    jmp         0045291D
 00452911    push        0FF
 00452913    mov         eax,dword ptr [esp+8]
 00452917    push        eax
 00452918    call        kernel32.WaitForSingleObject
 0045291D    push        esp
 0045291E    mov         eax,dword ptr [esp+8]
 00452922    push        eax
 00452923    call        kernel32.GetExitCodeThread
 00452928    cmp         eax,1
 0045292B    sbb         edx,edx
 0045292D    inc         edx
 0045292E    mov         eax,esi
 00452930    call        TThread.CheckThreadError
 00452935    mov         eax,dword ptr [esp]
 00452938    add         esp,28
 0045293B    pop         esi
 0045293C    pop         ebx
 0045293D    ret
*}
end;

//00452940
procedure TThread.NameThreadForDebugging(AThreadID:Cardinal);
begin
{*
 00452940    push        ebp
 00452941    mov         ebp,esp
 00452943    add         esp,0FFFFFFEC
 00452946    push        ebx
 00452947    push        esi
 00452948    push        edi
 00452949    mov         ebx,edx
 0045294B    mov         dword ptr [ebp-4],eax
 0045294E    mov         eax,dword ptr [ebp-4]
 00452951    call        @LStrAddRef
 00452956    xor         eax,eax
 00452958    push        ebp
 00452959    push        4529D1
 0045295E    push        dword ptr fs:[eax]
 00452961    mov         dword ptr fs:[eax],esp
 00452964    call        kernel32.IsDebuggerPresent
 00452969    test        eax,eax
>0045296B    je          004529BB
 0045296D    mov         dword ptr [ebp-14],1000
 00452974    mov         eax,dword ptr [ebp-4]
 00452977    call        @LStrToPChar
 0045297C    mov         dword ptr [ebp-10],eax
 0045297F    mov         dword ptr [ebp-0C],ebx
 00452982    xor         eax,eax
 00452984    mov         dword ptr [ebp-8],eax
 00452987    xor         eax,eax
 00452989    push        ebp
 0045298A    push        4529B1
 0045298F    push        dword ptr fs:[eax]
 00452992    mov         dword ptr fs:[eax],esp
 00452995    lea         eax,[ebp-14]
 00452998    push        eax
 00452999    push        4
 0045299B    push        0
 0045299D    push        406D1388
 004529A2    call        kernel32.RaiseException
 004529A7    xor         eax,eax
 004529A9    pop         edx
 004529AA    pop         ecx
 004529AB    pop         ecx
 004529AC    mov         dword ptr fs:[eax],edx
>004529AF    jmp         004529BB
>004529B1    jmp         @HandleAnyException
 004529B6    call        @DoneExcept
 004529BB    xor         eax,eax
 004529BD    pop         edx
 004529BE    pop         ecx
 004529BF    pop         ecx
 004529C0    mov         dword ptr fs:[eax],edx
 004529C3    push        4529D8
 004529C8    lea         eax,[ebp-4]
 004529CB    call        @LStrClr
 004529D0    ret
>004529D1    jmp         @HandleFinally
>004529D6    jmp         004529C8
 004529D8    pop         edi
 004529D9    pop         esi
 004529DA    pop         ebx
 004529DB    mov         esp,ebp
 004529DD    pop         ebp
 004529DE    ret
*}
end;

//004529E0
constructor TStringsEnumerator.Create;
begin
{*
 004529E0    push        ebx
 004529E1    push        esi
 004529E2    push        edi
 004529E3    test        dl,dl
>004529E5    je          004529EF
 004529E7    add         esp,0FFFFFFF0
 004529EA    call        @ClassCreate
 004529EF    mov         esi,ecx
 004529F1    mov         ebx,edx
 004529F3    mov         edi,eax
 004529F5    xor         edx,edx
 004529F7    mov         eax,edi
 004529F9    call        TObject.Create
 004529FE    mov         dword ptr [edi+4],0FFFFFFFF
 00452A05    mov         dword ptr [edi+8],esi
 00452A08    mov         eax,edi
 00452A0A    test        bl,bl
>00452A0C    je          00452A1D
 00452A0E    call        @AfterConstruction
 00452A13    pop         dword ptr fs:[0]
 00452A1A    add         esp,0C
 00452A1D    mov         eax,edi
 00452A1F    pop         edi
 00452A20    pop         esi
 00452A21    pop         ebx
 00452A22    ret
*}
end;

//00452A24
function TComponentEnumerator.GetCurrent:TComponent;
begin
{*
 00452A24    mov         edx,dword ptr [eax+4]
 00452A27    mov         eax,dword ptr [eax+8]
 00452A2A    call        TComponent.GetComponent
 00452A2F    ret
*}
end;

//00452A30
function TComponentEnumerator.MoveNext:Boolean;
begin
{*
 00452A30    push        ebx
 00452A31    mov         ebx,eax
 00452A33    mov         eax,dword ptr [ebx+8]
 00452A36    call        TComponent.GetComponentCount
 00452A3B    dec         eax
 00452A3C    cmp         eax,dword ptr [ebx+4]
 00452A3F    setg        al
 00452A42    test        al,al
>00452A44    je          00452A49
 00452A46    inc         dword ptr [ebx+4]
 00452A49    pop         ebx
 00452A4A    ret
*}
end;

//00452A4C
constructor TComponent.Create;
begin
{*
 00452A4C    push        ebx
 00452A4D    push        esi
 00452A4E    push        edi
 00452A4F    test        dl,dl
>00452A51    je          00452A5B
 00452A53    add         esp,0FFFFFFF0
 00452A56    call        @ClassCreate
 00452A5B    mov         esi,ecx
 00452A5D    mov         ebx,edx
 00452A5F    mov         edi,eax
 00452A61    movzx       eax,byte ptr ds:[452A94]
 00452A68    mov         byte ptr [edi+24],al
 00452A6B    test        esi,esi
>00452A6D    je          00452A78
 00452A6F    mov         edx,edi
 00452A71    mov         eax,esi
 00452A73    call        TComponent.InsertComponent
 00452A78    mov         eax,edi
 00452A7A    test        bl,bl
>00452A7C    je          00452A8D
 00452A7E    call        @AfterConstruction
 00452A83    pop         dword ptr fs:[0]
 00452A8A    add         esp,0C
 00452A8D    mov         eax,edi
 00452A8F    pop         edi
 00452A90    pop         esi
 00452A91    pop         ebx
 00452A92    ret
*}
end;

//00452A98
destructor TComponent.Destroy();
begin
{*
 00452A98    push        ebx
 00452A99    push        esi
 00452A9A    call        @BeforeDestruction
 00452A9F    mov         ebx,edx
 00452AA1    mov         esi,eax
 00452AA3    mov         eax,esi
 00452AA5    call        TComponent.Destroying
 00452AAA    mov         eax,esi
 00452AAC    call        TComponent.RemoveFreeNotifications
 00452AB1    mov         eax,esi
 00452AB3    call        TComponent.DestroyComponents
 00452AB8    mov         eax,dword ptr [esi+4]
 00452ABB    test        eax,eax
>00452ABD    je          00452AC6
 00452ABF    mov         edx,esi
 00452AC1    call        TComponent.RemoveComponent
 00452AC6    mov         edx,ebx
 00452AC8    and         dl,0FC
 00452ACB    mov         eax,esi
 00452ACD    call        TMemoryStream.Destroy
 00452AD2    test        bl,bl
>00452AD4    jle         00452ADD
 00452AD6    mov         eax,esi
 00452AD8    call        @ClassDestroy
 00452ADD    pop         esi
 00452ADE    pop         ebx
 00452ADF    ret
*}
end;

//00452AE0
procedure TComponent.BeforeDestruction;
begin
{*
 00452AE0    test        byte ptr [eax+1C],8
>00452AE4    jne         00452AEB
 00452AE6    call        TComponent.Destroying
 00452AEB    ret
*}
end;

//00452AEC
procedure TComponent.RemoveFreeNotifications;
begin
{*
 00452AEC    push        ebx
 00452AED    push        esi
 00452AEE    mov         ebx,eax
 00452AF0    cmp         dword ptr [ebx+14],0
>00452AF4    je          00452B29
>00452AF6    jmp         00452B0C
 00452AF8    mov         edx,dword ptr [esi+8]
 00452AFB    dec         edx
 00452AFC    mov         eax,esi
 00452AFE    call        TList.Get
 00452B03    mov         cl,1
 00452B05    mov         edx,ebx
 00452B07    mov         esi,dword ptr [eax]
 00452B09    call        dword ptr [esi+10]
 00452B0C    mov         esi,dword ptr [ebx+14]
 00452B0F    test        esi,esi
>00452B11    je          00452B19
 00452B13    cmp         dword ptr [esi+8],0
>00452B17    jg          00452AF8
 00452B19    lea         eax,[ebx+14]
 00452B1C    mov         edx,dword ptr [eax]
 00452B1E    xor         ecx,ecx
 00452B20    mov         dword ptr [eax],ecx
 00452B22    mov         eax,edx
 00452B24    call        TObject.Free
 00452B29    pop         esi
 00452B2A    pop         ebx
 00452B2B    ret
*}
end;

//00452B2C
procedure TComponent.FreeNotification(AComponent:TComponent);
begin
{*
 00452B2C    push        ebp
 00452B2D    mov         ebp,esp
 00452B2F    push        0
 00452B31    push        0
 00452B33    push        ebx
 00452B34    push        esi
 00452B35    mov         esi,edx
 00452B37    mov         ebx,eax
 00452B39    xor         eax,eax
 00452B3B    push        ebp
 00452B3C    push        452BEF
 00452B41    push        dword ptr fs:[eax]
 00452B44    mov         dword ptr fs:[eax],esp
 00452B47    mov         eax,dword ptr [ebx+4]
 00452B4A    test        eax,eax
>00452B4C    je          00452B53
 00452B4E    cmp         eax,dword ptr [esi+4]
>00452B51    je          00452BCE
 00452B53    movzx       eax,word ptr [esi+1C]
 00452B57    or          ax,word ptr [ebx+1C]
 00452B5B    test        al,8
>00452B5D    je          00452B98
 00452B5F    push        452C08;'Component already destroyed: '
 00452B64    push        dword ptr [ebx+8]
 00452B67    push        452C50;' ClassName: '
 00452B6C    lea         edx,[ebp-8]
 00452B6F    mov         eax,dword ptr [ebx]
 00452B71    call        TObject.ClassName
 00452B76    push        dword ptr [ebp-8]
 00452B79    lea         eax,[ebp-4]
 00452B7C    mov         edx,4
 00452B81    call        @UStrCatN
 00452B86    mov         eax,dword ptr [ebp-4]
 00452B89    mov         ecx,2FBB
 00452B8E    mov         edx,452C78;'C:\Builds\TP\rtl\common\Classes.pas'
 00452B93    call        @Assert
 00452B98    cmp         dword ptr [ebx+14],0
>00452B9C    jne         00452BAD
 00452B9E    mov         dl,1
 00452BA0    mov         eax,[00439644];TList
 00452BA5    call        TObject.Create
 00452BAA    mov         dword ptr [ebx+14],eax
 00452BAD    mov         edx,esi
 00452BAF    mov         eax,dword ptr [ebx+14]
 00452BB2    call        TList.IndexOf
 00452BB7    test        eax,eax
>00452BB9    jge         00452BCE
 00452BBB    mov         edx,esi
 00452BBD    mov         eax,dword ptr [ebx+14]
 00452BC0    call        TList.Add
 00452BC5    mov         edx,ebx
 00452BC7    mov         eax,esi
 00452BC9    call        TComponent.FreeNotification
 00452BCE    or          word ptr [ebx+1C],100
 00452BD4    xor         eax,eax
 00452BD6    pop         edx
 00452BD7    pop         ecx
 00452BD8    pop         ecx
 00452BD9    mov         dword ptr fs:[eax],edx
 00452BDC    push        452BF6
 00452BE1    lea         eax,[ebp-8]
 00452BE4    mov         edx,2
 00452BE9    call        @UStrArrayClr
 00452BEE    ret
>00452BEF    jmp         @HandleFinally
>00452BF4    jmp         00452BE1
 00452BF6    pop         esi
 00452BF7    pop         ebx
 00452BF8    pop         ecx
 00452BF9    pop         ecx
 00452BFA    pop         ebp
 00452BFB    ret
*}
end;

//00452CC0
procedure TComponent.ReadLeft(Reader:TReader);
begin
{*
 00452CC0    push        ebx
 00452CC1    push        esi
 00452CC2    mov         esi,edx
 00452CC4    mov         ebx,eax
 00452CC6    mov         eax,esi
 00452CC8    call        TReader.ReadInteger
 00452CCD    mov         word ptr [ebx+18],ax
 00452CD1    pop         esi
 00452CD2    pop         ebx
 00452CD3    ret
*}
end;

//00452CD4
procedure TComponent.ReadTop(Reader:TReader);
begin
{*
 00452CD4    push        ebx
 00452CD5    push        esi
 00452CD6    mov         esi,edx
 00452CD8    mov         ebx,eax
 00452CDA    mov         eax,esi
 00452CDC    call        TReader.ReadInteger
 00452CE1    mov         word ptr [ebx+1A],ax
 00452CE5    pop         esi
 00452CE6    pop         ebx
 00452CE7    ret
*}
end;

//00452CE8
procedure TComponent.WriteLeft(Writer:TWriter);
begin
{*
 00452CE8    movzx       eax,word ptr [eax+18]
 00452CEC    xchg        eax,edx
 00452CED    call        TWriter.WriteInteger
 00452CF2    ret
*}
end;

//00452CF4
procedure TComponent.WriteTop(Writer:TWriter);
begin
{*
 00452CF4    movzx       eax,word ptr [eax+1A]
 00452CF8    xchg        eax,edx
 00452CF9    call        TWriter.WriteInteger
 00452CFE    ret
*}
end;

//00452D00
procedure TComponent.Insert(AComponent:TComponent);
begin
{*
 00452D00    push        ebx
 00452D01    push        esi
 00452D02    mov         esi,edx
 00452D04    mov         ebx,eax
 00452D06    cmp         dword ptr [ebx+10],0
>00452D0A    jne         00452D1B
 00452D0C    mov         dl,1
 00452D0E    mov         eax,[00439644];TList
 00452D13    call        TObject.Create
 00452D18    mov         dword ptr [ebx+10],eax
 00452D1B    mov         edx,esi
 00452D1D    mov         eax,dword ptr [ebx+10]
 00452D20    call        TList.Add
 00452D25    cmp         dword ptr [ebx+28],0
>00452D29    je          00452D34
 00452D2B    mov         edx,esi
 00452D2D    mov         eax,ebx
 00452D2F    call        TComponent.AddSortedComponent
 00452D34    mov         dword ptr [esi+4],ebx
 00452D37    pop         esi
 00452D38    pop         ebx
 00452D39    ret
*}
end;

//00452D3C
procedure TComponent.Remove(AComponent:TComponent);
begin
{*
 00452D3C    push        ebx
 00452D3D    push        esi
 00452D3E    push        edi
 00452D3F    push        ebp
 00452D40    mov         edi,edx
 00452D42    mov         ebx,eax
 00452D44    xor         eax,eax
 00452D46    mov         dword ptr [edi+4],eax
 00452D49    mov         ebp,dword ptr [ebx+10]
 00452D4C    mov         esi,dword ptr [ebp+8]
 00452D4F    test        esi,esi
>00452D51    jle         00452D8A
 00452D53    mov         edx,esi
 00452D55    dec         edx
 00452D56    mov         eax,ebp
 00452D58    call        TList.Get
 00452D5D    cmp         edi,eax
>00452D5F    jne         00452D6E
 00452D61    mov         edx,esi
 00452D63    dec         edx
 00452D64    mov         eax,dword ptr [ebx+10]
 00452D67    call        TList.Delete
>00452D6C    jmp         00452D7A
 00452D6E    mov         edx,edi
 00452D70    xor         ecx,ecx
 00452D72    mov         eax,dword ptr [ebx+10]
 00452D75    call        TList.RemoveItem
 00452D7A    mov         eax,dword ptr [ebx+28]
 00452D7D    test        eax,eax
>00452D7F    je          00452D8A
 00452D81    mov         edx,edi
 00452D83    xor         ecx,ecx
 00452D85    call        TList.RemoveItem
 00452D8A    mov         eax,dword ptr [ebx+10]
 00452D8D    cmp         dword ptr [eax+8],0
>00452D91    jne         00452DAD
 00452D93    mov         eax,dword ptr [ebx+28]
 00452D96    call        TObject.Free
 00452D9B    xor         eax,eax
 00452D9D    mov         dword ptr [ebx+28],eax
 00452DA0    mov         eax,dword ptr [ebx+10]
 00452DA3    call        TObject.Free
 00452DA8    xor         eax,eax
 00452DAA    mov         dword ptr [ebx+10],eax
 00452DAD    pop         ebp
 00452DAE    pop         edi
 00452DAF    pop         esi
 00452DB0    pop         ebx
 00452DB1    ret
*}
end;

//00452DB4
procedure TComponent.InsertComponent(AComponent:TComponent);
begin
{*
 00452DB4    push        ebx
 00452DB5    push        esi
 00452DB6    push        edi
 00452DB7    mov         ebx,edx
 00452DB9    mov         edi,eax
 00452DBB    mov         edx,edi
 00452DBD    mov         eax,ebx
 00452DBF    mov         si,0FFF5
 00452DC3    call        @CallDynaInst
 00452DC8    mov         eax,dword ptr [ebx+4]
 00452DCB    test        eax,eax
>00452DCD    je          00452DD6
 00452DCF    mov         edx,ebx
 00452DD1    call        TComponent.RemoveComponent
 00452DD6    mov         eax,dword ptr [ebx+8]
 00452DD9    push        eax
 00452DDA    xor         ecx,ecx
 00452DDC    mov         edx,ebx
 00452DDE    mov         eax,edi
 00452DE0    mov         esi,dword ptr [eax]
 00452DE2    call        dword ptr [esi+20]
 00452DE5    mov         edx,ebx
 00452DE7    mov         eax,edi
 00452DE9    call        TComponent.Insert
 00452DEE    mov         dl,1
 00452DF0    mov         eax,ebx
 00452DF2    call        TComponent.SetReference
 00452DF7    test        byte ptr [edi+1C],10
>00452DFB    je          00452E08
 00452DFD    mov         cl,1
 00452DFF    mov         dl,1
 00452E01    mov         eax,ebx
 00452E03    call        TComponent.SetDesigning
 00452E08    xor         ecx,ecx
 00452E0A    mov         edx,ebx
 00452E0C    mov         eax,edi
 00452E0E    mov         ebx,dword ptr [eax]
 00452E10    call        dword ptr [ebx+10]
 00452E13    pop         edi
 00452E14    pop         esi
 00452E15    pop         ebx
 00452E16    ret
*}
end;

//00452E18
procedure TComponent.RemoveComponent(AComponent:TComponent);
begin
{*
 00452E18    push        ebx
 00452E19    push        esi
 00452E1A    push        edi
 00452E1B    mov         ebx,edx
 00452E1D    mov         esi,eax
 00452E1F    push        0
 00452E21    mov         ecx,dword ptr [ebx+8]
 00452E24    mov         edx,ebx
 00452E26    mov         eax,esi
 00452E28    mov         edi,dword ptr [eax]
 00452E2A    call        dword ptr [edi+20]
 00452E2D    mov         cl,1
 00452E2F    mov         edx,ebx
 00452E31    mov         eax,esi
 00452E33    mov         edi,dword ptr [eax]
 00452E35    call        dword ptr [edi+10]
 00452E38    xor         edx,edx
 00452E3A    mov         eax,ebx
 00452E3C    call        TComponent.SetReference
 00452E41    mov         edx,ebx
 00452E43    mov         eax,esi
 00452E45    call        TComponent.Remove
 00452E4A    pop         edi
 00452E4B    pop         esi
 00452E4C    pop         ebx
 00452E4D    ret
*}
end;

//00452E50
procedure TComponent.DestroyComponents;
begin
{*
 00452E50    push        ebx
 00452E51    push        esi
 00452E52    push        edi
 00452E53    mov         esi,eax
 00452E55    lea         eax,[esi+28]
 00452E58    mov         edx,dword ptr [eax]
 00452E5A    xor         ecx,ecx
 00452E5C    mov         dword ptr [eax],ecx
 00452E5E    mov         eax,edx
 00452E60    call        TObject.Free
>00452E65    jmp         00452EAA
 00452E67    mov         eax,ebx
 00452E69    call        TList.Last
 00452E6E    mov         edi,eax
 00452E70    test        byte ptr [edi+1D],1
>00452E74    jne         00452E8D
 00452E76    movzx       eax,word ptr ds:[452EB8]
 00452E7D    and         ax,word ptr [esi+1C]
 00452E81    movzx       edx,word ptr ds:[452EB8]
 00452E88    cmp         dx,ax
>00452E8B    jne         00452E98
 00452E8D    mov         edx,edi
 00452E8F    mov         eax,esi
 00452E91    call        TComponent.RemoveComponent
>00452E96    jmp         00452EA1
 00452E98    mov         edx,edi
 00452E9A    mov         eax,esi
 00452E9C    call        TComponent.Remove
 00452EA1    mov         dl,1
 00452EA3    mov         eax,edi
 00452EA5    mov         ecx,dword ptr [eax]
 00452EA7    call        dword ptr [ecx-4]
 00452EAA    mov         ebx,dword ptr [esi+10]
 00452EAD    test        ebx,ebx
>00452EAF    jne         00452E67
 00452EB1    pop         edi
 00452EB2    pop         esi
 00452EB3    pop         ebx
 00452EB4    ret
*}
end;

//00452EBC
procedure TComponent.Destroying;
begin
{*
 00452EBC    push        ebx
 00452EBD    push        esi
 00452EBE    push        edi
 00452EBF    mov         ebx,eax
 00452EC1    test        byte ptr [ebx+1C],8
>00452EC5    jne         00452EF1
 00452EC7    or          word ptr [ebx+1C],8
 00452ECC    mov         eax,dword ptr [ebx+10]
 00452ECF    test        eax,eax
>00452ED1    je          00452EF1
 00452ED3    mov         esi,dword ptr [eax+8]
 00452ED6    dec         esi
 00452ED7    test        esi,esi
>00452ED9    jl          00452EF1
 00452EDB    inc         esi
 00452EDC    xor         edi,edi
 00452EDE    mov         edx,edi
 00452EE0    mov         eax,dword ptr [ebx+10]
 00452EE3    call        TList.Get
 00452EE8    call        TComponent.Destroying
 00452EED    inc         edi
 00452EEE    dec         esi
>00452EEF    jne         00452EDE
 00452EF1    pop         edi
 00452EF2    pop         esi
 00452EF3    pop         ebx
 00452EF4    ret
*}
end;

//00452EF8
procedure TComponent.RemoveNotification(AComponent:TComponent);
begin
{*
 00452EF8    push        ebx
 00452EF9    push        esi
 00452EFA    push        edi
 00452EFB    push        ebp
 00452EFC    mov         ebp,edx
 00452EFE    mov         ebx,eax
 00452F00    mov         edi,dword ptr [ebx+14]
 00452F03    test        edi,edi
>00452F05    je          00452F48
 00452F07    mov         esi,dword ptr [edi+8]
 00452F0A    test        esi,esi
>00452F0C    jle         00452F35
 00452F0E    mov         edx,esi
 00452F10    dec         edx
 00452F11    mov         eax,edi
 00452F13    call        TList.Get
 00452F18    cmp         ebp,eax
>00452F1A    jne         00452F29
 00452F1C    mov         edx,esi
 00452F1E    dec         edx
 00452F1F    mov         eax,dword ptr [ebx+14]
 00452F22    call        TList.Delete
>00452F27    jmp         00452F35
 00452F29    mov         edx,ebp
 00452F2B    xor         ecx,ecx
 00452F2D    mov         eax,dword ptr [ebx+14]
 00452F30    call        TList.RemoveItem
 00452F35    mov         eax,dword ptr [ebx+14]
 00452F38    cmp         dword ptr [eax+8],0
>00452F3C    jne         00452F48
 00452F3E    call        TObject.Free
 00452F43    xor         eax,eax
 00452F45    mov         dword ptr [ebx+14],eax
 00452F48    pop         ebp
 00452F49    pop         edi
 00452F4A    pop         esi
 00452F4B    pop         ebx
 00452F4C    ret
*}
end;

//00452F50
procedure TComponent.RemoveFreeNotification(AComponent:TComponent);
begin
{*
 00452F50    push        ebx
 00452F51    push        esi
 00452F52    mov         esi,edx
 00452F54    mov         ebx,eax
 00452F56    mov         edx,esi
 00452F58    mov         eax,ebx
 00452F5A    call        TComponent.RemoveNotification
 00452F5F    mov         edx,ebx
 00452F61    mov         eax,esi
 00452F63    call        TComponent.RemoveNotification
 00452F68    pop         esi
 00452F69    pop         ebx
 00452F6A    ret
*}
end;

//00452F6C
procedure TComponent.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00452F6C    push        ebx
 00452F6D    push        esi
 00452F6E    push        edi
 00452F6F    push        ebp
 00452F70    push        ecx
 00452F71    mov         byte ptr [esp],cl
 00452F74    mov         edi,edx
 00452F76    mov         esi,eax
 00452F78    cmp         byte ptr [esp],1
>00452F7C    jne         00452F8B
 00452F7E    test        edi,edi
>00452F80    je          00452F8B
 00452F82    mov         edx,edi
 00452F84    mov         eax,esi
 00452F86    call        TComponent.RemoveFreeNotification
 00452F8B    mov         eax,dword ptr [esi+10]
 00452F8E    test        eax,eax
>00452F90    je          00452FC3
 00452F92    mov         ebx,dword ptr [eax+8]
 00452F95    dec         ebx
 00452F96    test        ebx,ebx
>00452F98    jl          00452FC3
 00452F9A    mov         edx,ebx
 00452F9C    mov         eax,dword ptr [esi+10]
 00452F9F    call        TList.Get
 00452FA4    movzx       ecx,byte ptr [esp]
 00452FA8    mov         edx,edi
 00452FAA    mov         ebp,dword ptr [eax]
 00452FAC    call        dword ptr [ebp+10]
 00452FAF    dec         ebx
 00452FB0    mov         eax,dword ptr [esi+10]
 00452FB3    cmp         ebx,dword ptr [eax+8]
>00452FB6    jl          00452FBF
 00452FB8    mov         eax,dword ptr [esi+10]
 00452FBB    mov         ebx,dword ptr [eax+8]
 00452FBE    dec         ebx
 00452FBF    test        ebx,ebx
>00452FC1    jge         00452F9A
 00452FC3    pop         edx
 00452FC4    pop         ebp
 00452FC5    pop         edi
 00452FC6    pop         esi
 00452FC7    pop         ebx
 00452FC8    ret
*}
end;

//00452FCC
procedure TComponent.DefineProperties(Filer:TFiler);
begin
{*
 00452FCC    push        ebp
 00452FCD    mov         ebp,esp
 00452FCF    push        ecx
 00452FD0    push        ebx
 00452FD1    push        esi
 00452FD2    push        edi
 00452FD3    mov         esi,edx
 00452FD5    mov         ebx,eax
 00452FD7    xor         eax,eax
 00452FD9    mov         dword ptr [ebp-4],eax
 00452FDC    mov         eax,dword ptr [esi+20]
 00452FDF    test        eax,eax
>00452FE1    je          00452FE9
 00452FE3    mov         eax,dword ptr [eax+18]
 00452FE6    mov         dword ptr [ebp-4],eax
 00452FE9    push        ebx
 00452FEA    push        452CC0;TComponent.ReadLeft
 00452FEF    push        ebx
 00452FF0    push        452CE8;TComponent.WriteLeft
 00452FF5    movzx       eax,word ptr [ebx+18]
 00452FF9    cmp         ax,word ptr [ebp-4]
 00452FFD    setne       cl
 00453000    mov         edx,453044;'Left'
 00453005    mov         eax,esi
 00453007    mov         edi,dword ptr [eax]
 00453009    call        dword ptr [edi+4]
 0045300C    push        ebx
 0045300D    push        452CD4;TComponent.ReadTop
 00453012    push        ebx
 00453013    push        452CF4;TComponent.WriteTop
 00453018    movzx       eax,word ptr [ebp-2]
 0045301C    cmp         ax,word ptr [ebx+1A]
 00453020    setne       cl
 00453023    mov         edx,45305C;'Top'
 00453028    mov         eax,esi
 0045302A    mov         ebx,dword ptr [eax]
 0045302C    call        dword ptr [ebx+4]
 0045302F    pop         edi
 00453030    pop         esi
 00453031    pop         ebx
 00453032    pop         ecx
 00453033    pop         ebp
 00453034    ret
*}
end;

//00453064
procedure TComponent.HasParent;
begin
{*
 00453064    xor         eax,eax
 00453066    ret
*}
end;

//00453068
procedure TComponent.sub_00453068;
begin
{*
 00453068    push        ebp
 00453069    mov         ebp,esp
 0045306B    pop         ebp
 0045306C    ret         8
*}
end;

//00453070
procedure TComponent.sub_00453070;
begin
{*
 00453070    xor         eax,eax
 00453072    ret
*}
end;

//00453074
procedure TComponent.sub_00453074;
begin
{*
 00453074    ret
*}
end;

//00453078
function TComponent.GetEnumerator:TComponentEnumerator;
begin
{*
 00453078    mov         ecx,eax
 0045307A    mov         dl,1
 0045307C    mov         eax,[00441E68];TComponentEnumerator
 00453081    call        TStringsEnumerator.Create
 00453086    ret
*}
end;

//00453088
procedure TComponent.GetNamePath;
begin
{*
 00453088    push        ebx
 00453089    push        esi
 0045308A    mov         esi,edx
 0045308C    mov         ebx,eax
 0045308E    mov         eax,esi
 00453090    mov         edx,dword ptr [ebx+8]
 00453093    call        @UStrAsg
 00453098    pop         esi
 00453099    pop         ebx
 0045309A    ret
*}
end;

//0045309C
procedure TComponent.sub_00446E30;
begin
{*
 0045309C    mov         eax,dword ptr [eax+4];TComponent.FOwner:TComponent
 0045309F    ret
*}
end;

//004530A0
procedure TComponent.sub_004530A0;
begin
{*
 004530A0    ret
*}
end;

//004530A4
procedure TComponent.GetParentComponent;
begin
{*
 004530A4    xor         eax,eax
 004530A6    ret
*}
end;

//004530A8
procedure TComponent.sub_004530A8;
begin
{*
 004530A8    ret
*}
end;

//004530AC
procedure TComponent.Updating;
begin
{*
 004530AC    push        ebx
 004530AD    mov         ebx,eax
 004530AF    or          word ptr [ebx+1C],40
 004530B4    pop         ebx
 004530B5    ret
*}
end;

//004530B8
procedure TComponent.Updated;
begin
{*
 004530B8    push        ebx
 004530B9    mov         ebx,eax
 004530BB    and         word ptr [ebx+1C],0FFFFFFBF
 004530C0    pop         ebx
 004530C1    ret
*}
end;

//004530C4
procedure TComponent.Loaded;
begin
{*
 004530C4    push        ebx
 004530C5    mov         ebx,eax
 004530C7    and         word ptr [ebx+1C],0FFFFFFFE
 004530CC    pop         ebx
 004530CD    ret
*}
end;

//004530D0
procedure TComponent.sub_004530D0;
begin
{*
 004530D0    ret
*}
end;

//004530D4
procedure TComponent.ReadState(Reader:TReader);
begin
{*
 004530D4    xchg        eax,edx
 004530D5    call        TReader.ReadData
 004530DA    ret
*}
end;

//004530DC
{*procedure sub_004530DC(?:?);
begin
 004530DC    xchg        eax,edx
 004530DD    mov         ecx,dword ptr [eax]
 004530DF    call        dword ptr [ecx+10]
 004530E2    ret
end;*}

//004530E4
procedure TComponent.ValidateRename(AComponent:TComponent; const CurName:UnicodeString; const NewName:UnicodeString);
begin
{*
 004530E4    push        ebp
 004530E5    mov         ebp,esp
 004530E7    add         esp,0FFFFFFF0
 004530EA    push        ebx
 004530EB    push        esi
 004530EC    push        edi
 004530ED    mov         dword ptr [ebp-8],ecx
 004530F0    mov         dword ptr [ebp-4],edx
 004530F3    mov         esi,eax
 004530F5    mov         edi,dword ptr [ebp+8]
 004530F8    cmp         dword ptr [ebp-4],0
>004530FC    je          00453145
 004530FE    mov         edx,edi
 00453100    mov         eax,dword ptr [ebp-8]
 00453103    call        SameText
 00453108    test        al,al
>0045310A    jne         00453145
 0045310C    mov         eax,dword ptr [ebp-4]
 0045310F    cmp         esi,dword ptr [eax+4]
>00453112    jne         00453145
 00453114    mov         edx,edi
 00453116    mov         eax,esi
 00453118    call        TComponent.FindComponent
 0045311D    test        eax,eax
>0045311F    je          00453145
 00453121    mov         dword ptr [ebp-10],edi
 00453124    mov         byte ptr [ebp-0C],11
 00453128    lea         eax,[ebp-10]
 0045312B    push        eax
 0045312C    push        0
 0045312E    mov         ecx,dword ptr ds:[78D4E0];^SResString118:TResStringRec
 00453134    mov         dl,1
 00453136    mov         eax,[0043908C];EComponentError
 0045313B    call        Exception.CreateResFmt
 00453140    call        @RaiseExcept
 00453145    test        byte ptr [esi+1C],10
>00453149    je          00453160
 0045314B    cmp         dword ptr [esi+4],0
>0045314F    je          00453160
 00453151    push        edi
 00453152    mov         ecx,dword ptr [ebp-8]
 00453155    mov         edx,dword ptr [ebp-4]
 00453158    mov         eax,dword ptr [esi+4]
 0045315B    mov         ebx,dword ptr [eax]
 0045315D    call        dword ptr [ebx+20]
 00453160    pop         edi
 00453161    pop         esi
 00453162    pop         ebx
 00453163    mov         esp,ebp
 00453165    pop         ebp
 00453166    ret         4
*}
end;

//0045316C
procedure TComponent.ValidateContainer(AComponent:TComponent);
begin
{*
 0045316C    push        esi
 0045316D    mov         esi,eax
 0045316F    mov         eax,edx
 00453171    mov         edx,esi
 00453173    mov         si,0FFF4
 00453177    call        @CallDynaInst
 0045317C    pop         esi
 0045317D    ret
*}
end;

//00453180
procedure TComponent.sub_00453180;
begin
{*
 00453180    ret
*}
end;

//004532F4
function TComponent.FindComponent$1499$ActRec.$0$Body(Item1:Pointer; Item2:Pointer):Integer;
begin
{*
 004532F4    mov         eax,dword ptr [edx+8]
 004532F7    mov         edx,dword ptr [ecx+8]
 004532FA    call        CompareText
 004532FF    ret
*}
end;

//00453300
function TComponent.FindComponent(AName:string):TComponent;
begin
{*
 00453300    push        ebp
 00453301    mov         ebp,esp
 00453303    add         esp,0FFFFFFF4
 00453306    push        ebx
 00453307    push        esi
 00453308    push        edi
 00453309    xor         ecx,ecx
 0045330B    mov         dword ptr [ebp-4],ecx
 0045330E    mov         dword ptr [ebp-8],edx
 00453311    mov         ebx,eax
 00453313    xor         eax,eax
 00453315    push        ebp
 00453316    push        4533D9
 0045331B    push        dword ptr fs:[eax]
 0045331E    mov         dword ptr fs:[eax],esp
 00453321    mov         dl,1
 00453323    mov         eax,[00453230];TComponent.FindComponent$1499$ActRec
 00453328    call        TObject.Create
 0045332D    mov         edi,eax
 0045332F    lea         eax,[ebp-4]
 00453332    mov         edx,edi
 00453334    test        edx,edx
>00453336    je          0045333B
 00453338    sub         edx,0FFFFFFF8
 0045333B    call        @IntfCopy
 00453340    xor         esi,esi
 00453342    cmp         dword ptr [ebp-8],0
>00453346    je          004533C3
 00453348    cmp         dword ptr [ebx+10],0
>0045334C    je          004533C3
 0045334E    cmp         dword ptr [ebx+28],0
>00453352    jne         004533B4
 00453354    mov         dl,1
 00453356    mov         eax,[00439644];TList
 0045335B    call        TObject.Create
 00453360    mov         esi,eax
 00453362    mov         dword ptr [ebx+28],esi
 00453365    mov         eax,dword ptr [ebx+10]
 00453368    mov         edx,dword ptr [eax+8]
 0045336B    mov         eax,esi
 0045336D    call        TList.SetCount
 00453372    mov         eax,dword ptr [ebx+10]
 00453375    mov         esi,dword ptr [eax+8]
 00453378    dec         esi
 00453379    test        esi,esi
>0045337B    jl          004533A3
 0045337D    inc         esi
 0045337E    mov         dword ptr [ebp-0C],0
 00453385    mov         edx,dword ptr [ebp-0C]
 00453388    mov         eax,dword ptr [ebx+10]
 0045338B    call        TList.Get
 00453390    mov         ecx,eax
 00453392    mov         edx,dword ptr [ebp-0C]
 00453395    mov         eax,dword ptr [ebx+28]
 00453398    call        TList.Put
 0045339D    inc         dword ptr [ebp-0C]
 004533A0    dec         esi
>004533A1    jne         00453385
 004533A3    mov         edx,edi
 004533A5    test        edx,edx
>004533A7    je          004533AC
 004533A9    sub         edx,0FFFFFFF4
 004533AC    mov         eax,dword ptr [ebx+28]
 004533AF    call        TList.SortList
 004533B4    lea         ecx,[ebp-0C]
 004533B7    mov         edx,dword ptr [ebp-8]
 004533BA    mov         eax,ebx
 004533BC    call        TComponent.FindSortedComponent
 004533C1    mov         esi,eax
 004533C3    xor         eax,eax
 004533C5    pop         edx
 004533C6    pop         ecx
 004533C7    pop         ecx
 004533C8    mov         dword ptr fs:[eax],edx
 004533CB    push        4533E0
 004533D0    lea         eax,[ebp-4]
 004533D3    call        @IntfClear
 004533D8    ret
>004533D9    jmp         @HandleFinally
>004533DE    jmp         004533D0
 004533E0    mov         eax,esi
 004533E2    pop         edi
 004533E3    pop         esi
 004533E4    pop         ebx
 004533E5    mov         esp,ebp
 004533E7    pop         ebp
 004533E8    ret
*}
end;

//004533EC
function TComponent.FindSortedComponent(const AName:UnicodeString; var Index:Integer):TComponent;
begin
{*
 004533EC    push        ebx
 004533ED    push        esi
 004533EE    push        edi
 004533EF    push        ebp
 004533F0    add         esp,0FFFFFFF0
 004533F3    mov         dword ptr [esp+4],ecx
 004533F7    mov         dword ptr [esp],edx
 004533FA    xor         esi,esi
 004533FC    mov         edx,dword ptr [eax+28]
 004533FF    mov         edi,dword ptr [edx+8]
 00453402    dec         edi
 00453403    mov         eax,dword ptr [edx+4]
 00453406    mov         dword ptr [esp+0C],eax
 0045340A    cmp         edi,esi
>0045340C    jl          0045344B
 0045340E    lea         ebx,[edi+esi]
 00453411    shr         ebx,1
 00453413    mov         eax,dword ptr [esp+0C]
 00453417    mov         eax,dword ptr [eax+ebx*4]
 0045341A    mov         dword ptr [esp+8],eax
 0045341E    mov         eax,dword ptr [esp+8]
 00453422    mov         eax,dword ptr [eax+8]
 00453425    mov         edx,dword ptr [esp]
 00453428    call        CompareText
 0045342D    mov         ebp,eax
 0045342F    test        ebp,ebp
>00453431    jge         00453438
 00453433    lea         esi,[ebx+1]
>00453436    jmp         00453447
 00453438    mov         edi,ebx
 0045343A    dec         edi
 0045343B    test        ebp,ebp
>0045343D    jne         00453447
 0045343F    mov         eax,dword ptr [esp+4]
 00453443    mov         dword ptr [eax],ebx
>00453445    jmp         00453457
 00453447    cmp         edi,esi
>00453449    jge         0045340E
 0045344B    mov         eax,dword ptr [esp+4]
 0045344F    mov         dword ptr [eax],esi
 00453451    xor         eax,eax
 00453453    mov         dword ptr [esp+8],eax
 00453457    mov         eax,dword ptr [esp+8]
 0045345B    add         esp,10
 0045345E    pop         ebp
 0045345F    pop         edi
 00453460    pop         esi
 00453461    pop         ebx
 00453462    ret
*}
end;

//00453464
procedure TComponent.AddSortedComponent(AComponent:TComponent);
begin
{*
 00453464    push        ebx
 00453465    push        esi
 00453466    push        ecx
 00453467    mov         esi,edx
 00453469    mov         ebx,eax
 0045346B    mov         ecx,esp
 0045346D    mov         edx,dword ptr [esi+8]
 00453470    mov         eax,ebx
 00453472    call        TComponent.FindSortedComponent
 00453477    mov         ecx,esi
 00453479    mov         edx,dword ptr [esp]
 0045347C    mov         eax,dword ptr [ebx+28]
 0045347F    call        TList.Insert
 00453484    pop         edx
 00453485    pop         esi
 00453486    pop         ebx
 00453487    ret
*}
end;

//00453488
procedure TComponent.SetName(const NewName:TComponentName);
begin
{*
 00453488    push        ebx
 00453489    push        esi
 0045348A    push        edi
 0045348B    add         esp,0FFFFFFF8
 0045348E    mov         esi,edx
 00453490    mov         ebx,eax
 00453492    mov         eax,dword ptr [ebx+8]
 00453495    mov         edx,esi
 00453497    call        @UStrEqual
>0045349C    je          0045350F
 0045349E    test        esi,esi
>004534A0    je          004534D1
 004534A2    xor         edx,edx
 004534A4    mov         eax,esi
 004534A6    call        IsValidIdent
 004534AB    test        al,al
>004534AD    jne         004534D1
 004534AF    mov         dword ptr [esp],esi
 004534B2    mov         byte ptr [esp+4],11
 004534B7    push        esp
 004534B8    push        0
 004534BA    mov         ecx,dword ptr ds:[78D2EC];^SResString125:TResStringRec
 004534C0    mov         dl,1
 004534C2    mov         eax,[0043908C];EComponentError
 004534C7    call        Exception.CreateResFmt
 004534CC    call        @RaiseExcept
 004534D1    mov         edi,dword ptr [ebx+4]
 004534D4    test        edi,edi
>004534D6    je          004534E7
 004534D8    push        esi
 004534D9    mov         ecx,dword ptr [ebx+8]
 004534DC    mov         edx,ebx
 004534DE    mov         eax,edi
 004534E0    mov         edi,dword ptr [eax]
 004534E2    call        dword ptr [edi+20]
>004534E5    jmp         004534F4
 004534E7    push        esi
 004534E8    mov         ecx,dword ptr [ebx+8]
 004534EB    xor         edx,edx
 004534ED    mov         eax,ebx
 004534EF    mov         edi,dword ptr [eax]
 004534F1    call        dword ptr [edi+20]
 004534F4    xor         edx,edx
 004534F6    mov         eax,ebx
 004534F8    call        TComponent.SetReference
 004534FD    mov         edx,esi
 004534FF    mov         eax,ebx
 00453501    call        TComponent.ChangeName
 00453506    mov         dl,1
 00453508    mov         eax,ebx
 0045350A    call        TComponent.SetReference
 0045350F    pop         ecx
 00453510    pop         edx
 00453511    pop         edi
 00453512    pop         esi
 00453513    pop         ebx
 00453514    ret
*}
end;

//00453518
procedure TComponent.ChangeName(const NewName:TComponentName);
begin
{*
 00453518    push        ebx
 00453519    push        esi
 0045351A    mov         esi,edx
 0045351C    mov         ebx,eax
 0045351E    lea         eax,[ebx+8]
 00453521    mov         edx,esi
 00453523    call        @UStrAsg
 00453528    mov         eax,dword ptr [ebx+4]
 0045352B    test        eax,eax
>0045352D    je          0045354B
 0045352F    cmp         dword ptr [eax+28],0
>00453533    je          0045354B
 00453535    mov         edx,ebx
 00453537    mov         eax,dword ptr [eax+28]
 0045353A    xor         ecx,ecx
 0045353C    call        TList.RemoveItem
 00453541    mov         edx,ebx
 00453543    mov         eax,dword ptr [ebx+4]
 00453546    call        TComponent.AddSortedComponent
 0045354B    pop         esi
 0045354C    pop         ebx
 0045354D    ret
*}
end;

//00453550
function TComponent.GetComponentIndex:Integer;
begin
{*
 00453550    mov         edx,dword ptr [eax+4]
 00453553    test        edx,edx
>00453555    je          00453567
 00453557    cmp         dword ptr [edx+10],0
>0045355B    je          00453567
 0045355D    mov         edx,dword ptr [edx+10]
 00453560    xchg        eax,edx
 00453561    call        TList.IndexOf
 00453566    ret
 00453567    or          eax,0FFFFFFFF
 0045356A    ret
*}
end;

//0045356C
function TComponent.GetComponent(AIndex:Integer):TComponent;
begin
{*
 0045356C    push        ebx
 0045356D    push        esi
 0045356E    mov         esi,edx
 00453570    mov         ebx,eax
 00453572    cmp         dword ptr [ebx+10],0
>00453576    jne         0045358A
 00453578    mov         edx,dword ptr ds:[78D7A0];^SResString132:TResStringRec
 0045357E    mov         ecx,esi
 00453580    mov         eax,[00439644];TList
 00453585    call        TList.Error
 0045358A    mov         edx,esi
 0045358C    mov         eax,dword ptr [ebx+10]
 0045358F    call        TList.Get
 00453594    pop         esi
 00453595    pop         ebx
 00453596    ret
*}
end;

//00453598
function TComponent.GetComponentCount:Integer;
begin
{*
 00453598    mov         edx,dword ptr [eax+10]
 0045359B    test        edx,edx
>0045359D    je          004535A3
 0045359F    mov         eax,dword ptr [edx+8]
 004535A2    ret
 004535A3    xor         eax,eax
 004535A5    ret
*}
end;

//004535A8
procedure TComponent.SetComponentIndex(Value:Integer);
begin
{*
 004535A8    push        ebx
 004535A9    push        esi
 004535AA    push        edi
 004535AB    mov         esi,edx
 004535AD    mov         ebx,eax
 004535AF    mov         eax,dword ptr [ebx+4]
 004535B2    test        eax,eax
>004535B4    je          004535F5
 004535B6    mov         eax,dword ptr [eax+10]
 004535B9    mov         edx,ebx
 004535BB    call        TList.IndexOf
 004535C0    test        eax,eax
>004535C2    jl          004535F5
 004535C4    mov         edx,dword ptr [ebx+4]
 004535C7    mov         edi,dword ptr [edx+10]
 004535CA    mov         edx,dword ptr [edi+8]
 004535CD    test        esi,esi
>004535CF    jge         004535D3
 004535D1    xor         esi,esi
 004535D3    cmp         edx,esi
>004535D5    jg          004535DA
 004535D7    mov         esi,edx
 004535D9    dec         esi
 004535DA    cmp         eax,esi
>004535DC    je          004535F5
 004535DE    mov         edx,edi
 004535E0    xchg        eax,edx
 004535E1    call        TList.Delete
 004535E6    mov         eax,dword ptr [ebx+4]
 004535E9    mov         eax,dword ptr [eax+10]
 004535EC    mov         ecx,ebx
 004535EE    mov         edx,esi
 004535F0    call        TList.Insert
 004535F5    pop         edi
 004535F6    pop         esi
 004535F7    pop         ebx
 004535F8    ret
*}
end;

//004535FC
procedure TComponent.SetDesigning(Value:Boolean; SetChildren:Boolean);
begin
{*
 004535FC    push        ebx
 004535FD    push        esi
 004535FE    push        edi
 004535FF    push        ebp
 00453600    push        ecx
 00453601    mov         byte ptr [esp],cl
 00453604    mov         ebx,edx
 00453606    mov         esi,eax
 00453608    test        bl,bl
>0045360A    je          00453613
 0045360C    or          word ptr [esi+1C],10
>00453611    jmp         00453618
 00453613    and         word ptr [esi+1C],0FFFFFFEF
 00453618    cmp         byte ptr [esp],0
>0045361C    je          00453645
 0045361E    mov         eax,esi
 00453620    call        TComponent.GetComponentCount
 00453625    mov         ebp,eax
 00453627    dec         ebp
 00453628    test        ebp,ebp
>0045362A    jl          00453645
 0045362C    inc         ebp
 0045362D    xor         edi,edi
 0045362F    mov         edx,edi
 00453631    mov         eax,esi
 00453633    call        TComponent.GetComponent
 00453638    mov         cl,1
 0045363A    mov         edx,ebx
 0045363C    call        TComponent.SetDesigning
 00453641    inc         edi
 00453642    dec         ebp
>00453643    jne         0045362F
 00453645    pop         edx
 00453646    pop         ebp
 00453647    pop         edi
 00453648    pop         esi
 00453649    pop         ebx
 0045364A    ret
*}
end;

//0045364C
procedure TComponent.SetReference(Enable:Boolean);
begin
{*
 0045364C    push        ebx
 0045364D    push        esi
 0045364E    mov         ebx,edx
 00453650    mov         esi,eax
 00453652    mov         eax,dword ptr [esi+4]
 00453655    test        eax,eax
>00453657    je          00453671
 00453659    mov         edx,dword ptr [esi+8]
 0045365C    call        TObject.FieldAddress
 00453661    test        eax,eax
>00453663    je          00453671
 00453665    test        bl,bl
>00453667    je          0045366D
 00453669    mov         dword ptr [eax],esi
>0045366B    jmp         00453671
 0045366D    xor         edx,edx
 0045366F    mov         dword ptr [eax],edx
 00453671    pop         esi
 00453672    pop         ebx
 00453673    ret
*}
end;

//00453674
procedure TComponent.ExecuteAction(Action:TBasicAction);
begin
{*
 00453674    push        ebx
 00453675    push        esi
 00453676    push        edi
 00453677    mov         edi,edx
 00453679    mov         esi,eax
 0045367B    mov         edx,esi
 0045367D    mov         eax,edi
 0045367F    mov         ecx,dword ptr [eax]
 00453681    call        dword ptr [ecx+3C]
 00453684    mov         ebx,eax
 00453686    test        bl,bl
>00453688    je          00453693
 0045368A    mov         edx,esi
 0045368C    mov         eax,edi
 0045368E    mov         ecx,dword ptr [eax]
 00453690    call        dword ptr [ecx+44]
 00453693    mov         eax,ebx
 00453695    pop         edi
 00453696    pop         esi
 00453697    pop         ebx
 00453698    ret
*}
end;

//0045369C
function TComponent.UpdateAction(Action:TBasicAction):Boolean;
begin
{*
 0045369C    push        ebx
 0045369D    push        esi
 0045369E    push        edi
 0045369F    mov         edi,edx
 004536A1    mov         esi,eax
 004536A3    mov         edx,esi
 004536A5    mov         eax,edi
 004536A7    mov         ecx,dword ptr [eax]
 004536A9    call        dword ptr [ecx+3C]
 004536AC    mov         ebx,eax
 004536AE    test        bl,bl
>004536B0    je          004536BB
 004536B2    mov         edx,esi
 004536B4    mov         eax,edi
 004536B6    mov         ecx,dword ptr [eax]
 004536B8    call        dword ptr [ecx+40]
 004536BB    mov         eax,ebx
 004536BD    pop         edi
 004536BE    pop         esi
 004536BF    pop         ebx
 004536C0    ret
*}
end;

//004536C4
procedure TComponent.SetSubComponent(IsSubComponent:Boolean);
begin
{*
 004536C4    push        ebx
 004536C5    mov         ebx,eax
 004536C7    test        dl,dl
>004536C9    je          004536D1
 004536CB    or          byte ptr [ebx+24],4
 004536CF    pop         ebx
 004536D0    ret
 004536D1    and         byte ptr [ebx+24],0FB
 004536D5    pop         ebx
 004536D6    ret
*}
end;

//004536D8
function TComponent.GetComObject:IUnknown;
begin
{*
 004536D8    push        ebp
 004536D9    mov         ebp,esp
 004536DB    add         esp,0FFFFFFF4
 004536DE    push        ebx
 004536DF    push        esi
 004536E0    xor         ecx,ecx
 004536E2    mov         dword ptr [ebp-0C],ecx
 004536E5    mov         esi,edx
 004536E7    mov         ebx,eax
 004536E9    xor         eax,eax
 004536EB    push        ebp
 004536EC    push        453770
 004536F1    push        dword ptr fs:[eax]
 004536F4    mov         dword ptr fs:[eax],esp
 004536F7    cmp         dword ptr [ebx+20],0
>004536FB    jne         00453745
 004536FD    cmp         dword ptr ds:[785070],0
>00453704    je          0045370E
 00453706    mov         eax,ebx
 00453708    call        dword ptr ds:[785070]
 0045370E    cmp         dword ptr [ebx+20],0
>00453712    jne         00453745
 00453714    lea         edx,[ebp-0C]
 00453717    mov         eax,dword ptr [ebx]
 00453719    call        TObject.ClassName
 0045371E    mov         eax,dword ptr [ebp-0C]
 00453721    mov         dword ptr [ebp-8],eax
 00453724    mov         byte ptr [ebp-4],11
 00453728    lea         eax,[ebp-8]
 0045372B    push        eax
 0045372C    push        0
 0045372E    mov         ecx,dword ptr ds:[78D828];^SResString134:TResStringRec
 00453734    mov         dl,1
 00453736    mov         eax,[0043908C];EComponentError
 0045373B    call        Exception.CreateResFmt
 00453740    call        @RaiseExcept
 00453745    mov         eax,esi
 00453747    call        @IntfClear
 0045374C    push        eax
 0045374D    push        453780
 00453752    mov         eax,dword ptr [ebx+20]
 00453755    push        eax
 00453756    mov         eax,dword ptr [eax]
 00453758    call        dword ptr [eax]
 0045375A    xor         eax,eax
 0045375C    pop         edx
 0045375D    pop         ecx
 0045375E    pop         ecx
 0045375F    mov         dword ptr fs:[eax],edx
 00453762    push        453777
 00453767    lea         eax,[ebp-0C]
 0045376A    call        @UStrClr
 0045376F    ret
>00453770    jmp         @HandleFinally
>00453775    jmp         00453767
 00453777    pop         esi
 00453778    pop         ebx
 00453779    mov         esp,ebp
 0045377B    pop         ebp
 0045377C    ret
*}
end;

//00453790
function TComponent.SafeCallException(ExceptObject:TObject; ExceptAddr:Pointer):HRESULT;
begin
{*
 00453790    push        ebx
 00453791    cmp         dword ptr [eax+20],0
>00453795    je          004537A1
 00453797    mov         eax,dword ptr [eax+20]
 0045379A    mov         ebx,dword ptr [eax]
 0045379C    call        dword ptr [ebx+1C]
 0045379F    pop         ebx
 004537A0    ret
 004537A1    call        TObject.SafeCallException
 004537A6    pop         ebx
 004537A7    ret
*}
end;

//004537A8
procedure TComponent.FreeOnRelease;
begin
{*
 004537A8    cmp         dword ptr [eax+20],0
>004537AC    je          004537B6
 004537AE    mov         eax,dword ptr [eax+20]
 004537B1    mov         edx,dword ptr [eax]
 004537B3    call        dword ptr [edx+20]
 004537B6    ret
*}
end;

//004537B8
procedure sub_004537B8;
begin
{*
 004537B8    push        ebp
 004537B9    mov         ebp,esp
 004537BB    pop         ebp
 004537BC    ret         4
*}
end;

//004537C0
function TComponent.QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;
begin
{*
 004537C0    push        ebp
 004537C1    mov         ebp,esp
 004537C3    push        ebx
 004537C4    push        esi
 004537C5    push        edi
 004537C6    mov         edi,dword ptr [ebp+10]
 004537C9    mov         esi,dword ptr [ebp+0C]
 004537CC    mov         ebx,dword ptr [ebp+8]
 004537CF    cmp         dword ptr [ebx+20],0
>004537D3    jne         004537EF
 004537D5    mov         ecx,edi
 004537D7    mov         edx,esi
 004537D9    mov         eax,ebx
 004537DB    call        TObject.GetInterface
 004537E0    test        al,al
>004537E2    je          004537E8
 004537E4    xor         eax,eax
>004537E6    jmp         004537F9
 004537E8    mov         eax,80004002
>004537ED    jmp         004537F9
 004537EF    push        edi
 004537F0    push        esi
 004537F1    mov         eax,dword ptr [ebx+20]
 004537F4    push        eax
 004537F5    mov         eax,dword ptr [eax]
 004537F7    call        dword ptr [eax]
 004537F9    pop         edi
 004537FA    pop         esi
 004537FB    pop         ebx
 004537FC    pop         ebp
 004537FD    ret         0C
*}
end;

//00453800
function TComponent._AddRef:Integer; stdcall;
begin
{*
 00453800    push        ebp
 00453801    mov         ebp,esp
 00453803    mov         eax,dword ptr [ebp+8]
 00453806    cmp         dword ptr [eax+20],0
>0045380A    jne         00453811
 0045380C    or          eax,0FFFFFFFF
>0045380F    jmp         0045381A
 00453811    mov         eax,dword ptr [eax+20]
 00453814    push        eax
 00453815    mov         eax,dword ptr [eax]
 00453817    call        dword ptr [eax+4]
 0045381A    pop         ebp
 0045381B    ret         4
*}
end;

//00453820
function TComponent._Release:Integer; stdcall;
begin
{*
 00453820    push        ebp
 00453821    mov         ebp,esp
 00453823    mov         eax,dword ptr [ebp+8]
 00453826    cmp         dword ptr [eax+20],0
>0045382A    jne         00453831
 0045382C    or          eax,0FFFFFFFF
>0045382F    jmp         0045383A
 00453831    mov         eax,dword ptr [eax+20]
 00453834    push        eax
 00453835    mov         eax,dword ptr [eax]
 00453837    call        dword ptr [eax+8]
 0045383A    pop         ebp
 0045383B    ret         4
*}
end;

//00453840
procedure sub_00453840;
begin
{*
 00453840    ret
*}
end;

//00453844
function TComponent.IsImplementorOf(I:IInterface):Boolean;
begin
{*
 00453844    push        ebp
 00453845    mov         ebp,esp
 00453847    push        0
 00453849    push        ebx
 0045384A    push        esi
 0045384B    mov         esi,edx
 0045384D    mov         ebx,eax
 0045384F    xor         eax,eax
 00453851    push        ebp
 00453852    push        4538A5
 00453857    push        dword ptr fs:[eax]
 0045385A    mov         dword ptr fs:[eax],esp
 0045385D    test        esi,esi
>0045385F    je          00453887
 00453861    lea         eax,[ebp-4]
 00453864    call        @IntfClear
 00453869    mov         ecx,eax
 0045386B    mov         edx,4538B4
 00453870    mov         eax,esi
 00453872    call        Supports
 00453877    test        al,al
>00453879    je          00453887
 0045387B    mov         eax,dword ptr [ebp-4]
 0045387E    mov         edx,dword ptr [eax]
 00453880    call        dword ptr [edx+0C]
 00453883    cmp         ebx,eax
>00453885    je          0045388B
 00453887    xor         eax,eax
>00453889    jmp         0045388D
 0045388B    mov         al,1
 0045388D    mov         ebx,eax
 0045388F    xor         eax,eax
 00453891    pop         edx
 00453892    pop         ecx
 00453893    pop         ecx
 00453894    mov         dword ptr fs:[eax],edx
 00453897    push        4538AC
 0045389C    lea         eax,[ebp-4]
 0045389F    call        @IntfClear
 004538A4    ret
>004538A5    jmp         @HandleFinally
>004538AA    jmp         0045389C
 004538AC    mov         eax,ebx
 004538AE    pop         esi
 004538AF    pop         ebx
 004538B0    pop         ecx
 004538B1    pop         ebp
 004538B2    ret
*}
end;

//004538C4
function TComponent.ReferenceInterface(I:IInterface; Operation:TOperation):Boolean;
begin
{*
 004538C4    push        ebp
 004538C5    mov         ebp,esp
 004538C7    add         esp,0FFFFFFF8
 004538CA    push        ebx
 004538CB    push        esi
 004538CC    xor         ebx,ebx
 004538CE    mov         dword ptr [ebp-4],ebx
 004538D1    mov         byte ptr [ebp-5],cl
 004538D4    mov         ebx,edx
 004538D6    mov         esi,eax
 004538D8    xor         eax,eax
 004538DA    push        ebp
 004538DB    push        45394C
 004538E0    push        dword ptr fs:[eax]
 004538E3    mov         dword ptr fs:[eax],esp
 004538E6    test        ebx,ebx
>004538E8    je          00453904
 004538EA    lea         eax,[ebp-4]
 004538ED    call        @IntfClear
 004538F2    mov         ecx,eax
 004538F4    mov         edx,45395C
 004538F9    mov         eax,ebx
 004538FB    call        Supports
 00453900    test        al,al
>00453902    jne         00453908
 00453904    xor         eax,eax
>00453906    jmp         0045390A
 00453908    mov         al,1
 0045390A    mov         ebx,eax
 0045390C    test        bl,bl
>0045390E    je          00453936
 00453910    cmp         byte ptr [ebp-5],0
>00453914    jne         00453927
 00453916    mov         eax,dword ptr [ebp-4]
 00453919    mov         edx,dword ptr [eax]
 0045391B    call        dword ptr [edx+0C]
 0045391E    mov         edx,esi
 00453920    call        TComponent.FreeNotification
>00453925    jmp         00453936
 00453927    mov         eax,dword ptr [ebp-4]
 0045392A    mov         edx,dword ptr [eax]
 0045392C    call        dword ptr [edx+0C]
 0045392F    mov         edx,esi
 00453931    call        TComponent.RemoveFreeNotification
 00453936    xor         eax,eax
 00453938    pop         edx
 00453939    pop         ecx
 0045393A    pop         ecx
 0045393B    mov         dword ptr fs:[eax],edx
 0045393E    push        453953
 00453943    lea         eax,[ebp-4]
 00453946    call        @IntfClear
 0045394B    ret
>0045394C    jmp         @HandleFinally
>00453951    jmp         00453943
 00453953    mov         eax,ebx
 00453955    pop         esi
 00453956    pop         ebx
 00453957    pop         ecx
 00453958    pop         ecx
 00453959    pop         ebp
 0045395A    ret
*}
end;

//0045396C
constructor TBasicActionLink.Create;
begin
{*
 0045396C    push        ebx
 0045396D    push        esi
 0045396E    push        edi
 0045396F    test        dl,dl
>00453971    je          0045397B
 00453973    add         esp,0FFFFFFF0
 00453976    call        @ClassCreate
 0045397B    mov         esi,ecx
 0045397D    mov         ebx,edx
 0045397F    mov         edi,eax
 00453981    xor         edx,edx
 00453983    mov         eax,edi
 00453985    call        TObject.Create
 0045398A    mov         edx,esi
 0045398C    mov         eax,edi
 0045398E    mov         ecx,dword ptr [eax]
 00453990    call        dword ptr [ecx]
 00453992    mov         eax,edi
 00453994    test        bl,bl
>00453996    je          004539A7
 00453998    call        @AfterConstruction
 0045399D    pop         dword ptr fs:[0]
 004539A4    add         esp,0C
 004539A7    mov         eax,edi
 004539A9    pop         edi
 004539AA    pop         esi
 004539AB    pop         ebx
 004539AC    ret
*}
end;

//004539B0
procedure sub_004539B0;
begin
{*
 004539B0    ret
*}
end;

//004539B4
destructor TBasicActionLink.Destroy();
begin
{*
 004539B4    push        ebx
 004539B5    push        esi
 004539B6    call        @BeforeDestruction
 004539BB    mov         ebx,edx
 004539BD    mov         esi,eax
 004539BF    mov         eax,dword ptr [esi+10]
 004539C2    test        eax,eax
>004539C4    je          004539CD
 004539C6    mov         edx,esi
 004539C8    call        TBasicAction.UnRegisterChanges
 004539CD    mov         edx,ebx
 004539CF    and         dl,0FC
 004539D2    mov         eax,esi
 004539D4    call        TObject.Destroy
 004539D9    test        bl,bl
>004539DB    jle         004539E4
 004539DD    mov         eax,esi
 004539DF    call        @ClassDestroy
 004539E4    pop         esi
 004539E5    pop         ebx
 004539E6    ret
*}
end;

//004539E8
procedure TBasicActionLink.Change;
begin
{*
 004539E8    push        ebx
 004539E9    cmp         word ptr [eax+0A],0
>004539EE    je          004539FB
 004539F0    mov         ebx,eax
 004539F2    mov         edx,dword ptr [eax+10]
 004539F5    mov         eax,dword ptr [ebx+0C]
 004539F8    call        dword ptr [ebx+8]
 004539FB    pop         ebx
 004539FC    ret
*}
end;

//00453A00
function TBasicActionLink.Execute(AComponent:TComponent):Boolean;
begin
{*
 00453A00    push        ebx
 00453A01    push        esi
 00453A02    mov         ebx,eax
 00453A04    mov         eax,dword ptr [ebx+10]
 00453A07    call        TBasicAction.SetActionComponent
 00453A0C    mov         eax,dword ptr [ebx+10]
 00453A0F    mov         si,0FFF0
 00453A13    call        @CallDynaInst
 00453A18    pop         esi
 00453A19    pop         ebx
 00453A1A    ret
*}
end;

//00453A1C
procedure TBasicActionLink.SetAction(Value:TBasicAction);
begin
{*
 00453A1C    push        ebx
 00453A1D    push        esi
 00453A1E    mov         esi,edx
 00453A20    mov         ebx,eax
 00453A22    mov         eax,dword ptr [ebx+10]
 00453A25    cmp         esi,eax
>00453A27    je          00453A44
 00453A29    test        eax,eax
>00453A2B    je          00453A34
 00453A2D    mov         edx,ebx
 00453A2F    call        TBasicAction.UnRegisterChanges
 00453A34    mov         dword ptr [ebx+10],esi
 00453A37    test        esi,esi
>00453A39    je          00453A44
 00453A3B    mov         edx,ebx
 00453A3D    mov         eax,esi
 00453A3F    call        TBasicAction.RegisterChanges
 00453A44    pop         esi
 00453A45    pop         ebx
 00453A46    ret
*}
end;

//00453A48
function TBasicActionLink.IsOnExecuteLinked:Boolean;
begin
{*
 00453A48    mov         al,1
 00453A4A    ret
*}
end;

//00453A4C
procedure sub_00453A4C;
begin
{*
 00453A4C    push        ebp
 00453A4D    mov         ebp,esp
 00453A4F    pop         ebp
 00453A50    ret         8
*}
end;

//00453A54
function TBasicActionLink.Update:Boolean;
begin
{*
 00453A54    mov         eax,dword ptr [eax+10]
 00453A57    mov         edx,dword ptr [eax]
 00453A59    call        dword ptr [edx+48]
 00453A5C    ret
*}
end;

//00453A60
constructor TBasicAction.Create;
begin
{*
 00453A60    push        ebx
 00453A61    push        esi
 00453A62    test        dl,dl
>00453A64    je          00453A6E
 00453A66    add         esp,0FFFFFFF0
 00453A69    call        @ClassCreate
 00453A6E    mov         ebx,edx
 00453A70    mov         esi,eax
 00453A72    xor         edx,edx
 00453A74    mov         eax,esi
 00453A76    call        TComponent.Create
 00453A7B    mov         dl,1
 00453A7D    mov         eax,[00439644];TList
 00453A82    call        TObject.Create
 00453A87    mov         dword ptr [esi+50],eax
 00453A8A    mov         eax,esi
 00453A8C    test        bl,bl
>00453A8E    je          00453A9F
 00453A90    call        @AfterConstruction
 00453A95    pop         dword ptr fs:[0]
 00453A9C    add         esp,0C
 00453A9F    mov         eax,esi
 00453AA1    pop         esi
 00453AA2    pop         ebx
 00453AA3    ret
*}
end;

//00453AA4
destructor TBasicAction.Destroy();
begin
{*
 00453AA4    push        ebx
 00453AA5    push        esi
 00453AA6    push        edi
 00453AA7    call        @BeforeDestruction
 00453AAC    mov         ebx,edx
 00453AAE    mov         edi,eax
 00453AB0    mov         edx,ebx
 00453AB2    and         dl,0FC
 00453AB5    mov         eax,edi
 00453AB7    call        TComponent.Destroy
 00453ABC    mov         eax,dword ptr [edi+34]
 00453ABF    test        eax,eax
>00453AC1    je          00453ACA
 00453AC3    mov         edx,edi
 00453AC5    call        TComponent.RemoveFreeNotification
 00453ACA    cmp         dword ptr [edi+50],0
>00453ACE    je          00453AEB
>00453AD0    jmp         00453AE2
 00453AD2    mov         eax,esi
 00453AD4    call        TList.Last
 00453AD9    mov         edx,eax
 00453ADB    mov         eax,edi
 00453ADD    call        TBasicAction.UnRegisterChanges
 00453AE2    mov         esi,dword ptr [edi+50]
 00453AE5    cmp         dword ptr [esi+8],0
>00453AE9    jg          00453AD2
 00453AEB    lea         eax,[edi+50]
 00453AEE    mov         edx,dword ptr [eax]
 00453AF0    xor         ecx,ecx
 00453AF2    mov         dword ptr [eax],ecx
 00453AF4    mov         eax,edx
 00453AF6    call        TObject.Free
 00453AFB    test        bl,bl
>00453AFD    jle         00453B06
 00453AFF    mov         eax,edi
 00453B01    call        @ClassDestroy
 00453B06    pop         edi
 00453B07    pop         esi
 00453B08    pop         ebx
 00453B09    ret
*}
end;

//00453B0C
function TBasicAction.HandlesTarget(Target:TObject):Boolean;
begin
{*
 00453B0C    xor         eax,eax
 00453B0E    ret
*}
end;

//00453B10
procedure TBasicAction.ExecuteTarget(Target:TObject);
begin
{*
 00453B10    ret
*}
end;

//00453B14
procedure TBasicAction.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00453B14    push        ebx
 00453B15    push        esi
 00453B16    push        edi
 00453B17    mov         ebx,ecx
 00453B19    mov         esi,edx
 00453B1B    mov         edi,eax
 00453B1D    mov         ecx,ebx
 00453B1F    mov         edx,esi
 00453B21    mov         eax,edi
 00453B23    call        TComponent.Notification
 00453B28    cmp         bl,1
>00453B2B    jne         00453B37
 00453B2D    cmp         esi,dword ptr [edi+34]
>00453B30    jne         00453B37
 00453B32    xor         eax,eax
 00453B34    mov         dword ptr [edi+34],eax
 00453B37    pop         edi
 00453B38    pop         esi
 00453B39    pop         ebx
 00453B3A    ret
*}
end;

//00453B3C
procedure TBasicAction.UpdateTarget(Target:TObject);
begin
{*
 00453B3C    ret
*}
end;

//00453B40
procedure TBasicAction.Execute;
begin
{*
 00453B40    push        ebx
 00453B41    cmp         word ptr [eax+42],0
>00453B46    je          00453B56
 00453B48    mov         ebx,eax
 00453B4A    mov         edx,eax
 00453B4C    mov         eax,dword ptr [ebx+44]
 00453B4F    call        dword ptr [ebx+40]
 00453B52    mov         al,1
 00453B54    pop         ebx
 00453B55    ret
 00453B56    xor         eax,eax
 00453B58    pop         ebx
 00453B59    ret
*}
end;

//00453B5C
function TBasicAction.Update:Boolean;
begin
{*
 00453B5C    push        ebx
 00453B5D    cmp         word ptr [eax+4A],0
>00453B62    je          00453B72
 00453B64    mov         ebx,eax
 00453B66    mov         edx,eax
 00453B68    mov         eax,dword ptr [ebx+4C]
 00453B6B    call        dword ptr [ebx+48]
 00453B6E    mov         al,1
 00453B70    pop         ebx
 00453B71    ret
 00453B72    xor         eax,eax
 00453B74    pop         ebx
 00453B75    ret
*}
end;

//00453B78
procedure TBasicAction.SetOnExecute(Value:TNotifyEvent);
begin
{*
 00453B78    push        ebp
 00453B79    mov         ebp,esp
 00453B7B    push        ebx
 00453B7C    push        esi
 00453B7D    push        edi
 00453B7E    mov         ebx,eax
 00453B80    mov         eax,dword ptr [ebp+8]
 00453B83    cmp         eax,dword ptr [ebx+40]
>00453B86    jne         00453B90
 00453B88    mov         eax,dword ptr [ebp+0C]
 00453B8B    cmp         eax,dword ptr [ebx+44]
>00453B8E    je          00453BCA
 00453B90    mov         eax,dword ptr [ebx+50]
 00453B93    mov         esi,dword ptr [eax+8]
 00453B96    dec         esi
 00453B97    test        esi,esi
>00453B99    jl          00453BB7
 00453B9B    inc         esi
 00453B9C    xor         edi,edi
 00453B9E    push        dword ptr [ebp+0C]
 00453BA1    push        dword ptr [ebp+8]
 00453BA4    mov         edx,edi
 00453BA6    mov         eax,dword ptr [ebx+50]
 00453BA9    call        TList.Get
 00453BAE    mov         edx,dword ptr [eax]
 00453BB0    call        dword ptr [edx+10]
 00453BB3    inc         edi
 00453BB4    dec         esi
>00453BB5    jne         00453B9E
 00453BB7    mov         eax,dword ptr [ebp+8]
 00453BBA    mov         dword ptr [ebx+40],eax
 00453BBD    mov         eax,dword ptr [ebp+0C]
 00453BC0    mov         dword ptr [ebx+44],eax
 00453BC3    mov         eax,ebx
 00453BC5    mov         edx,dword ptr [eax]
 00453BC7    call        dword ptr [edx+34]
 00453BCA    pop         edi
 00453BCB    pop         esi
 00453BCC    pop         ebx
 00453BCD    pop         ebp
 00453BCE    ret         8
*}
end;

//00453BD4
procedure TBasicAction.Change;
begin
{*
 00453BD4    push        ebx
 00453BD5    cmp         word ptr [eax+3A],0
>00453BDA    je          00453BE6
 00453BDC    mov         ebx,eax
 00453BDE    mov         edx,eax
 00453BE0    mov         eax,dword ptr [ebx+3C]
 00453BE3    call        dword ptr [ebx+38]
 00453BE6    pop         ebx
 00453BE7    ret
*}
end;

//00453BE8
procedure TBasicAction.RegisterChanges(Value:TBasicActionLink);
begin
{*
 00453BE8    mov         dword ptr [edx+10],eax
 00453BEB    mov         eax,dword ptr [eax+50]
 00453BEE    call        TList.Add
 00453BF3    ret
*}
end;

//00453BF4
procedure TBasicAction.UnRegisterChanges(Value:TBasicActionLink);
begin
{*
 00453BF4    push        ebx
 00453BF5    push        esi
 00453BF6    push        edi
 00453BF7    push        ebp
 00453BF8    mov         ebp,edx
 00453BFA    mov         edi,eax
 00453BFC    mov         eax,dword ptr [edi+50]
 00453BFF    mov         esi,dword ptr [eax+8]
 00453C02    dec         esi
 00453C03    test        esi,esi
>00453C05    jl          00453C2D
 00453C07    inc         esi
 00453C08    xor         ebx,ebx
 00453C0A    mov         eax,dword ptr [edi+50]
 00453C0D    mov         edx,ebx
 00453C0F    call        TList.Get
 00453C14    cmp         ebp,eax
>00453C16    jne         00453C29
 00453C18    xor         eax,eax
 00453C1A    mov         dword ptr [ebp+10],eax
 00453C1D    mov         eax,dword ptr [edi+50]
 00453C20    mov         edx,ebx
 00453C22    call        TList.Delete
>00453C27    jmp         00453C2D
 00453C29    inc         ebx
 00453C2A    dec         esi
>00453C2B    jne         00453C0A
 00453C2D    pop         ebp
 00453C2E    pop         edi
 00453C2F    pop         esi
 00453C30    pop         ebx
 00453C31    ret
*}
end;

//00453C34
procedure TBasicAction.SetActionComponent(const Value:TComponent);
begin
{*
 00453C34    push        ebx
 00453C35    push        esi
 00453C36    mov         esi,edx
 00453C38    mov         ebx,eax
 00453C3A    mov         eax,dword ptr [ebx+34]
 00453C3D    cmp         esi,eax
>00453C3F    je          00453C5C
 00453C41    test        eax,eax
>00453C43    je          00453C4C
 00453C45    mov         edx,ebx
 00453C47    call        TComponent.RemoveFreeNotification
 00453C4C    mov         eax,esi
 00453C4E    mov         dword ptr [ebx+34],eax
 00453C51    test        eax,eax
>00453C53    je          00453C5C
 00453C55    mov         edx,ebx
 00453C57    call        TComponent.FreeNotification
 00453C5C    pop         esi
 00453C5D    pop         ebx
 00453C5E    ret
*}
end;

//00453C60
constructor TStreamAdapter.Create(Ownership:TStreamOwnership);
begin
{*
 00453C60    push        ebp
 00453C61    mov         ebp,esp
 00453C63    push        ebx
 00453C64    push        esi
 00453C65    push        edi
 00453C66    test        dl,dl
>00453C68    je          00453C72
 00453C6A    add         esp,0FFFFFFF0
 00453C6D    call        @ClassCreate
 00453C72    mov         esi,ecx
 00453C74    mov         ebx,edx
 00453C76    mov         edi,eax
 00453C78    xor         edx,edx
 00453C7A    mov         eax,edi
 00453C7C    call        TObject.Create
 00453C81    mov         dword ptr [edi+0C],esi
 00453C84    movzx       eax,byte ptr [ebp+8]
 00453C88    mov         byte ptr [edi+10],al
 00453C8B    mov         eax,edi
 00453C8D    test        bl,bl
>00453C8F    je          00453CA0
 00453C91    call        @AfterConstruction
 00453C96    pop         dword ptr fs:[0]
 00453C9D    add         esp,0C
 00453CA0    mov         eax,edi
 00453CA2    pop         edi
 00453CA3    pop         esi
 00453CA4    pop         ebx
 00453CA5    pop         ebp
 00453CA6    ret         4
*}
end;

//00453CAC
destructor TStreamAdapter.Destroy();
begin
{*
 00453CAC    push        ebx
 00453CAD    push        esi
 00453CAE    call        @BeforeDestruction
 00453CB3    mov         ebx,edx
 00453CB5    mov         esi,eax
 00453CB7    cmp         byte ptr [esi+10],1
>00453CBB    jne         00453CCA
 00453CBD    mov         eax,dword ptr [esi+0C]
 00453CC0    call        TObject.Free
 00453CC5    xor         eax,eax
 00453CC7    mov         dword ptr [esi+0C],eax
 00453CCA    mov         edx,ebx
 00453CCC    and         dl,0FC
 00453CCF    mov         eax,esi
 00453CD1    call        TObject.Destroy
 00453CD6    test        bl,bl
>00453CD8    jle         00453CE1
 00453CDA    mov         eax,esi
 00453CDC    call        @ClassDestroy
 00453CE1    pop         esi
 00453CE2    pop         ebx
 00453CE3    ret
*}
end;

//00453CE4
function TStreamAdapter.Read(pv:Pointer; cb:Integer; pcbRead:PLongInt):HRESULT; stdcall;
begin
{*
 00453CE4    push        ebp
 00453CE5    mov         ebp,esp
 00453CE7    push        ebx
 00453CE8    push        esi
 00453CE9    push        edi
 00453CEA    mov         edx,dword ptr [ebp+0C]
 00453CED    mov         eax,dword ptr [ebp+8]
 00453CF0    xor         ecx,ecx
 00453CF2    push        ebp
 00453CF3    push        453D33
 00453CF8    push        dword ptr fs:[ecx]
 00453CFB    mov         dword ptr fs:[ecx],esp
 00453CFE    test        edx,edx
>00453D00    jne         00453D11
 00453D02    mov         ebx,80030009
 00453D07    xor         eax,eax
 00453D09    pop         edx
 00453D0A    pop         ecx
 00453D0B    pop         ecx
 00453D0C    mov         dword ptr fs:[eax],edx
>00453D0F    jmp         00453D42
 00453D11    mov         eax,dword ptr [eax+0C]
 00453D14    mov         ecx,dword ptr [ebp+10]
 00453D17    mov         ebx,dword ptr [eax]
 00453D19    call        dword ptr [ebx+0C]
 00453D1C    cmp         dword ptr [ebp+14],0
>00453D20    je          00453D27
 00453D22    mov         edx,dword ptr [ebp+14]
 00453D25    mov         dword ptr [edx],eax
 00453D27    xor         ebx,ebx
 00453D29    xor         eax,eax
 00453D2B    pop         edx
 00453D2C    pop         ecx
 00453D2D    pop         ecx
 00453D2E    mov         dword ptr fs:[eax],edx
>00453D31    jmp         00453D42
>00453D33    jmp         @HandleAnyException
 00453D38    mov         ebx,1
 00453D3D    call        @DoneExcept
 00453D42    mov         eax,ebx
 00453D44    pop         edi
 00453D45    pop         esi
 00453D46    pop         ebx
 00453D47    pop         ebp
 00453D48    ret         10
*}
end;

//00453D4C
function TStreamAdapter.Write(pv:Pointer; cb:Integer; pcbWritten:PLongInt):HRESULT; stdcall;
begin
{*
 00453D4C    push        ebp
 00453D4D    mov         ebp,esp
 00453D4F    push        ebx
 00453D50    push        esi
 00453D51    push        edi
 00453D52    mov         edx,dword ptr [ebp+0C]
 00453D55    mov         eax,dword ptr [ebp+8]
 00453D58    xor         ecx,ecx
 00453D5A    push        ebp
 00453D5B    push        453D9B
 00453D60    push        dword ptr fs:[ecx]
 00453D63    mov         dword ptr fs:[ecx],esp
 00453D66    test        edx,edx
>00453D68    jne         00453D79
 00453D6A    mov         ebx,80030009
 00453D6F    xor         eax,eax
 00453D71    pop         edx
 00453D72    pop         ecx
 00453D73    pop         ecx
 00453D74    mov         dword ptr fs:[eax],edx
>00453D77    jmp         00453DAA
 00453D79    mov         eax,dword ptr [eax+0C]
 00453D7C    mov         ecx,dword ptr [ebp+10]
 00453D7F    mov         ebx,dword ptr [eax]
 00453D81    call        dword ptr [ebx+10]
 00453D84    cmp         dword ptr [ebp+14],0
>00453D88    je          00453D8F
 00453D8A    mov         edx,dword ptr [ebp+14]
 00453D8D    mov         dword ptr [edx],eax
 00453D8F    xor         ebx,ebx
 00453D91    xor         eax,eax
 00453D93    pop         edx
 00453D94    pop         ecx
 00453D95    pop         ecx
 00453D96    mov         dword ptr fs:[eax],edx
>00453D99    jmp         00453DAA
>00453D9B    jmp         @HandleAnyException
 00453DA0    mov         ebx,80030103
 00453DA5    call        @DoneExcept
 00453DAA    mov         eax,ebx
 00453DAC    pop         edi
 00453DAD    pop         esi
 00453DAE    pop         ebx
 00453DAF    pop         ebp
 00453DB0    ret         10
*}
end;

//00453DB4
function TStreamAdapter.Seek(dlibMove:Int64; dwOrigin:Integer; libNewPosition:Int64):HRESULT; stdcall;
begin
{*
 00453DB4    push        ebp
 00453DB5    mov         ebp,esp
 00453DB7    add         esp,0FFFFFFF8
 00453DBA    push        ebx
 00453DBB    push        esi
 00453DBC    push        edi
 00453DBD    mov         ebx,dword ptr [ebp+14]
 00453DC0    mov         esi,dword ptr [ebp+8]
 00453DC3    xor         eax,eax
 00453DC5    push        ebp
 00453DC6    push        453E1E
 00453DCB    push        dword ptr fs:[eax]
 00453DCE    mov         dword ptr fs:[eax],esp
 00453DD1    test        ebx,ebx
>00453DD3    jl          00453DDA
 00453DD5    cmp         ebx,2
>00453DD8    jle         00453DE9
 00453DDA    mov         ebx,80030001
 00453DDF    xor         eax,eax
 00453DE1    pop         edx
 00453DE2    pop         ecx
 00453DE3    pop         ecx
 00453DE4    mov         dword ptr fs:[eax],edx
>00453DE7    jmp         00453E2D
 00453DE9    mov         eax,dword ptr [esi+0C]
 00453DEC    mov         ecx,ebx
 00453DEE    mov         edx,dword ptr [ebp+0C]
 00453DF1    mov         ebx,dword ptr [eax]
 00453DF3    call        dword ptr [ebx+14]
 00453DF6    cdq
 00453DF7    mov         dword ptr [ebp-8],eax
 00453DFA    mov         dword ptr [ebp-4],edx
 00453DFD    mov         eax,dword ptr [ebp+18]
 00453E00    test        eax,eax
>00453E02    je          00453E12
 00453E04    mov         eax,dword ptr [ebp+18]
 00453E07    mov         edx,dword ptr [ebp-8]
 00453E0A    mov         dword ptr [eax],edx
 00453E0C    mov         edx,dword ptr [ebp-4]
 00453E0F    mov         dword ptr [eax+4],edx
 00453E12    xor         ebx,ebx
 00453E14    xor         eax,eax
 00453E16    pop         edx
 00453E17    pop         ecx
 00453E18    pop         ecx
 00453E19    mov         dword ptr fs:[eax],edx
>00453E1C    jmp         00453E2D
>00453E1E    jmp         @HandleAnyException
 00453E23    mov         ebx,80030009
 00453E28    call        @DoneExcept
 00453E2D    mov         eax,ebx
 00453E2F    pop         edi
 00453E30    pop         esi
 00453E31    pop         ebx
 00453E32    pop         ecx
 00453E33    pop         ecx
 00453E34    pop         ebp
 00453E35    ret         14
*}
end;

//00453E38
function TStreamAdapter.SetSize(libNewSize:Int64):HRESULT; stdcall;
begin
{*
 00453E38    push        ebp
 00453E39    mov         ebp,esp
 00453E3B    push        ebx
 00453E3C    push        esi
 00453E3D    push        edi
 00453E3E    mov         ebx,dword ptr [ebp+8]
 00453E41    xor         eax,eax
 00453E43    push        ebp
 00453E44    push        453E81
 00453E49    push        dword ptr fs:[eax]
 00453E4C    mov         dword ptr fs:[eax],esp
 00453E4F    push        dword ptr [ebp+10]
 00453E52    push        dword ptr [ebp+0C]
 00453E55    mov         eax,dword ptr [ebx+0C]
 00453E58    call        TStream.SetSize64
 00453E5D    mov         eax,dword ptr [ebx+0C]
 00453E60    mov         edx,dword ptr [eax]
 00453E62    call        dword ptr [edx]
 00453E64    cmp         edx,dword ptr [ebp+10]
>00453E67    jne         00453E6C
 00453E69    cmp         eax,dword ptr [ebp+0C]
>00453E6C    je          00453E75
 00453E6E    mov         ebx,80004005
>00453E73    jmp         00453E77
 00453E75    xor         ebx,ebx
 00453E77    xor         eax,eax
 00453E79    pop         edx
 00453E7A    pop         ecx
 00453E7B    pop         ecx
 00453E7C    mov         dword ptr fs:[eax],edx
>00453E7F    jmp         00453E90
>00453E81    jmp         @HandleAnyException
 00453E86    mov         ebx,8000FFFF
 00453E8B    call        @DoneExcept
 00453E90    mov         eax,ebx
 00453E92    pop         edi
 00453E93    pop         esi
 00453E94    pop         ebx
 00453E95    pop         ebp
 00453E96    ret         0C
*}
end;

//00453E9C
function TStreamAdapter.CopyTo(stm:IStream; cb:Int64; cbRead:Int64; cbWritten:Int64):HRESULT; stdcall;
begin
{*
 00453E9C    push        ebp
 00453E9D    mov         ebp,esp
 00453E9F    add         esp,0FFFFFFD8
 00453EA2    push        ebx
 00453EA3    push        esi
 00453EA4    push        edi
 00453EA5    mov         eax,dword ptr [ebp+0C]
 00453EA8    call        @IntfAddRef
 00453EAD    xor         eax,eax
 00453EAF    push        ebp
 00453EB0    push        45408F
 00453EB5    push        dword ptr fs:[eax]
 00453EB8    mov         dword ptr fs:[eax],esp
 00453EBB    xor         eax,eax
 00453EBD    mov         dword ptr [ebp-4],eax
 00453EC0    mov         dword ptr [ebp-18],0
 00453EC7    mov         dword ptr [ebp-14],0
 00453ECE    mov         dword ptr [ebp-20],0
 00453ED5    mov         dword ptr [ebp-1C],0
 00453EDC    xor         eax,eax
 00453EDE    push        ebp
 00453EDF    push        454068
 00453EE4    push        dword ptr fs:[eax]
 00453EE7    mov         dword ptr fs:[eax],esp
 00453EEA    cmp         dword ptr [ebp+14],0
>00453EEE    jne         00453EFB
 00453EF0    cmp         dword ptr [ebp+10],100000
>00453EF7    jbe         00453F06
>00453EF9    jmp         00453EFD
>00453EFB    jle         00453F06
 00453EFD    mov         dword ptr [ebp-0C],100000
>00453F04    jmp         00453F0C
 00453F06    mov         eax,dword ptr [ebp+10]
 00453F09    mov         dword ptr [ebp-0C],eax
 00453F0C    mov         eax,dword ptr [ebp-0C]
 00453F0F    call        @GetMem
 00453F14    mov         dword ptr [ebp-8],eax
 00453F17    xor         eax,eax
 00453F19    push        ebp
 00453F1A    push        454057
 00453F1F    push        dword ptr fs:[eax]
 00453F22    mov         dword ptr fs:[eax],esp
>00453F25    jmp         00453FFF
 00453F2A    cmp         dword ptr [ebp+14],0
>00453F2E    jne         00453F3B
 00453F30    cmp         dword ptr [ebp+10],7FFFFFFF
>00453F37    jbe         00453F44
>00453F39    jmp         00453F3D
>00453F3B    jle         00453F44
 00453F3D    mov         esi,7FFFFFFF
>00453F42    jmp         00453F47
 00453F44    mov         esi,dword ptr [ebp+10]
 00453F47    test        esi,esi
>00453F49    jle         00453FFF
 00453F4F    cmp         esi,dword ptr [ebp-0C]
>00453F52    jle         00453F5C
 00453F54    mov         eax,dword ptr [ebp-0C]
 00453F57    mov         dword ptr [ebp-10],eax
>00453F5A    jmp         00453F5F
 00453F5C    mov         dword ptr [ebp-10],esi
 00453F5F    mov         edx,dword ptr [ebp-8]
 00453F62    mov         eax,dword ptr [ebp+8]
 00453F65    mov         eax,dword ptr [eax+0C]
 00453F68    mov         ecx,dword ptr [ebp-10]
 00453F6B    mov         ebx,dword ptr [eax]
 00453F6D    call        dword ptr [ebx+0C]
 00453F70    mov         ebx,eax
 00453F72    test        ebx,ebx
>00453F74    jne         00453F88
 00453F76    call        @TryFinallyExit
 00453F7B    xor         eax,eax
 00453F7D    pop         edx
 00453F7E    pop         ecx
 00453F7F    pop         ecx
 00453F80    mov         dword ptr fs:[eax],edx
>00453F83    jmp         00454079
 00453F88    mov         eax,ebx
 00453F8A    cdq
 00453F8B    add         dword ptr [ebp-18],eax
 00453F8E    adc         dword ptr [ebp-14],edx
 00453F91    mov         dword ptr [ebp-28],0
 00453F98    mov         dword ptr [ebp-24],0
 00453F9F    lea         eax,[ebp-28]
 00453FA2    push        eax
 00453FA3    push        ebx
 00453FA4    mov         eax,dword ptr [ebp-8]
 00453FA7    push        eax
 00453FA8    mov         eax,dword ptr [ebp+0C]
 00453FAB    push        eax
 00453FAC    mov         eax,dword ptr [eax]
 00453FAE    call        dword ptr [eax+10]
 00453FB1    mov         dword ptr [ebp-4],eax
 00453FB4    mov         eax,dword ptr [ebp-28]
 00453FB7    mov         edx,dword ptr [ebp-24]
 00453FBA    add         dword ptr [ebp-20],eax
 00453FBD    adc         dword ptr [ebp-1C],edx
 00453FC0    cmp         dword ptr [ebp-4],0
>00453FC4    jne         00453FD4
 00453FC6    mov         eax,dword ptr [ebp-28]
 00453FC9    cmp         ebx,eax
>00453FCB    je          00453FD4
 00453FCD    mov         dword ptr [ebp-4],80004005
 00453FD4    cmp         dword ptr [ebp-4],0
>00453FD8    je          00453FEC
 00453FDA    call        @TryFinallyExit
 00453FDF    xor         eax,eax
 00453FE1    pop         edx
 00453FE2    pop         ecx
 00453FE3    pop         ecx
 00453FE4    mov         dword ptr fs:[eax],edx
>00453FE7    jmp         00454079
 00453FEC    sub         esi,ebx
 00453FEE    mov         eax,ebx
 00453FF0    cdq
 00453FF1    sub         dword ptr [ebp+10],eax
 00453FF4    sbb         dword ptr [ebp+14],edx
 00453FF7    test        esi,esi
>00453FF9    jg          00453F4F
 00453FFF    cmp         dword ptr [ebp+14],0
>00454003    jne         00454011
 00454005    cmp         dword ptr [ebp+10],0
>00454009    ja          00453F2A
>0045400F    jmp         00454017
>00454011    jg          00453F2A
 00454017    xor         eax,eax
 00454019    pop         edx
 0045401A    pop         ecx
 0045401B    pop         ecx
 0045401C    mov         dword ptr fs:[eax],edx
 0045401F    push        45405E
 00454024    mov         eax,dword ptr [ebp-8]
 00454027    call        @FreeMem
 0045402C    mov         eax,dword ptr [ebp+1C]
 0045402F    test        eax,eax
>00454031    je          00454041
 00454033    mov         eax,dword ptr [ebp+1C]
 00454036    mov         edx,dword ptr [ebp-20]
 00454039    mov         dword ptr [eax],edx
 0045403B    mov         edx,dword ptr [ebp-1C]
 0045403E    mov         dword ptr [eax+4],edx
 00454041    mov         eax,dword ptr [ebp+18]
 00454044    test        eax,eax
>00454046    je          00454056
 00454048    mov         eax,dword ptr [ebp+18]
 0045404B    mov         edx,dword ptr [ebp-18]
 0045404E    mov         dword ptr [eax],edx
 00454050    mov         edx,dword ptr [ebp-14]
 00454053    mov         dword ptr [eax+4],edx
 00454056    ret
>00454057    jmp         @HandleFinally
>0045405C    jmp         00454024
 0045405E    xor         eax,eax
 00454060    pop         edx
 00454061    pop         ecx
 00454062    pop         ecx
 00454063    mov         dword ptr fs:[eax],edx
>00454066    jmp         00454079
>00454068    jmp         @HandleAnyException
 0045406D    mov         dword ptr [ebp-4],8000FFFF
 00454074    call        @DoneExcept
 00454079    xor         eax,eax
 0045407B    pop         edx
 0045407C    pop         ecx
 0045407D    pop         ecx
 0045407E    mov         dword ptr fs:[eax],edx
 00454081    push        454096
 00454086    lea         eax,[ebp+0C]
 00454089    call        @IntfClear
 0045408E    ret
>0045408F    jmp         @HandleFinally
>00454094    jmp         00454086
 00454096    mov         eax,dword ptr [ebp-4]
 00454099    pop         edi
 0045409A    pop         esi
 0045409B    pop         ebx
 0045409C    mov         esp,ebp
 0045409E    pop         ebp
 0045409F    ret         18
*}
end;

//004540A4
function TStreamAdapter.Commit(grfCommitFlags:Integer):HRESULT; stdcall;
begin
{*
 004540A4    push        ebp
 004540A5    mov         ebp,esp
 004540A7    xor         eax,eax
 004540A9    pop         ebp
 004540AA    ret         8
*}
end;

//004540B0
function TStreamAdapter.Revert:HRESULT; stdcall;
begin
{*
 004540B0    push        ebp
 004540B1    mov         ebp,esp
 004540B3    mov         eax,80030102
 004540B8    pop         ebp
 004540B9    ret         4
*}
end;

//004540BC
function TStreamAdapter.LockRegion(libOffset:Int64; cb:Int64; dwLockType:Integer):HRESULT; stdcall;
begin
{*
 004540BC    push        ebp
 004540BD    mov         ebp,esp
 004540BF    mov         eax,80030001
 004540C4    pop         ebp
 004540C5    ret         18
*}
end;

//004540C8
function TStreamAdapter.UnlockRegion(libOffset:Int64; cb:Int64; dwLockType:Integer):HRESULT; stdcall;
begin
{*
 004540C8    push        ebp
 004540C9    mov         ebp,esp
 004540CB    mov         eax,80030001
 004540D0    pop         ebp
 004540D1    ret         18
*}
end;

//004540D4
function TStreamAdapter.Stat(statstg:tagSTATSTG; grfStatFlag:Integer):HRESULT; stdcall;
begin
{*
 004540D4    push        ebp
 004540D5    mov         ebp,esp
 004540D7    push        ebx
 004540D8    push        esi
 004540D9    push        edi
 004540DA    mov         ebx,dword ptr [ebp+0C]
 004540DD    mov         edi,dword ptr [ebp+8]
 004540E0    xor         esi,esi
 004540E2    xor         eax,eax
 004540E4    push        ebp
 004540E5    push        454137
 004540EA    push        dword ptr fs:[eax]
 004540ED    mov         dword ptr fs:[eax],esp
 004540F0    test        ebx,ebx
>004540F2    je          0045412D
 004540F4    mov         dword ptr [ebx+4],2
 004540FB    mov         eax,dword ptr [edi+0C]
 004540FE    mov         edx,dword ptr [eax]
 00454100    call        dword ptr [edx]
 00454102    mov         dword ptr [ebx+8],eax
 00454105    mov         dword ptr [ebx+0C],edx
 00454108    xor         eax,eax
 0045410A    mov         dword ptr [ebx+10],eax
 0045410D    xor         eax,eax
 0045410F    mov         dword ptr [ebx+14],eax
 00454112    xor         eax,eax
 00454114    mov         dword ptr [ebx+18],eax
 00454117    xor         eax,eax
 00454119    mov         dword ptr [ebx+1C],eax
 0045411C    xor         eax,eax
 0045411E    mov         dword ptr [ebx+20],eax
 00454121    xor         eax,eax
 00454123    mov         dword ptr [ebx+24],eax
 00454126    mov         dword ptr [ebx+2C],1
 0045412D    xor         eax,eax
 0045412F    pop         edx
 00454130    pop         ecx
 00454131    pop         ecx
 00454132    mov         dword ptr fs:[eax],edx
>00454135    jmp         00454146
>00454137    jmp         @HandleAnyException
 0045413C    mov         esi,8000FFFF
 00454141    call        @DoneExcept
 00454146    mov         eax,esi
 00454148    pop         edi
 00454149    pop         esi
 0045414A    pop         ebx
 0045414B    pop         ebp
 0045414C    ret         0C
*}
end;

//00454150
function TStreamAdapter.Clone(stm:IStream):HRESULT; stdcall;
begin
{*
 00454150    push        ebp
 00454151    mov         ebp,esp
 00454153    mov         eax,dword ptr [ebp+0C]
 00454156    test        eax,eax
>00454158    je          0045415E
 0045415A    xor         edx,edx
 0045415C    mov         dword ptr [eax],edx
 0045415E    mov         eax,80004001
 00454163    pop         ebp
 00454164    ret         8
*}
end;

//00454168
procedure FreeIntConstList;
begin
{*
 00454168    push        ebp
 00454169    mov         ebp,esp
 0045416B    push        ebx
 0045416C    push        esi
 0045416D    push        edi
 0045416E    mov         eax,[00792FD4]
 00454173    call        TThreadList.LockList
 00454178    mov         edi,eax
 0045417A    xor         edx,edx
 0045417C    push        ebp
 0045417D    push        4541C0
 00454182    push        dword ptr fs:[edx]
 00454185    mov         dword ptr fs:[edx],esp
 00454188    mov         ebx,dword ptr [edi+8]
 0045418B    dec         ebx
 0045418C    test        ebx,ebx
>0045418E    jl          004541A5
 00454190    inc         ebx
 00454191    xor         esi,esi
 00454193    mov         edx,esi
 00454195    mov         eax,edi
 00454197    call        TList.Get
 0045419C    call        TObject.Free
 004541A1    inc         esi
 004541A2    dec         ebx
>004541A3    jne         00454193
 004541A5    xor         eax,eax
 004541A7    pop         edx
 004541A8    pop         ecx
 004541A9    pop         ecx
 004541AA    mov         dword ptr fs:[eax],edx
 004541AD    push        4541C7
 004541B2    mov         eax,[00792FD4]
 004541B7    mov         eax,dword ptr [eax+8]
 004541BA    call        TMonitor.Exit
 004541BF    ret
>004541C0    jmp         @HandleFinally
>004541C5    jmp         004541B2
 004541C7    mov         eax,[00792FD4]
 004541CC    call        TObject.Free
 004541D1    pop         edi
 004541D2    pop         esi
 004541D3    pop         ebx
 004541D4    pop         ebp
 004541D5    ret
*}
end;

//004541D8
procedure ModuleUnload(Instance:LongInt);
begin
{*
 004541D8    call        UnRegisterModuleClasses
 004541DD    ret
*}
end;

//004541E0
function StdWndProc(Window:HWND; Message:LongInt; WParam:LongInt; LParam:LongInt):LongInt; stdcall;
begin
{*
 004541E0    push        ebp
 004541E1    mov         ebp,esp
 004541E3    xor         eax,eax
 004541E5    push        eax
 004541E6    push        dword ptr [ebp+14]
 004541E9    push        dword ptr [ebp+10]
 004541EC    push        dword ptr [ebp+0C]
 004541EF    mov         edx,esp
 004541F1    mov         eax,dword ptr [ecx+4]
 004541F4    call        dword ptr [ecx]
 004541F6    add         esp,0C
 004541F9    pop         eax
 004541FA    pop         ebp
 004541FB    ret         10
*}
end;

//00454200
function CalcJmpOffset(Src:Pointer; Dest:Pointer):LongInt;
begin
{*
 00454200    add         eax,5
 00454203    sub         edx,eax
 00454205    mov         eax,edx
 00454207    ret
*}
end;

//00454208
function MakeObjectInstance(AMethod:TWndMethod):Pointer;
begin
{*
 00454208    push        ebp
 00454209    mov         ebp,esp
 0045420B    push        ebx
 0045420C    push        esi
 0045420D    push        edi
 0045420E    mov         edi,792FF0
 00454213    cmp         dword ptr [edi],0
>00454216    jne         00454284
 00454218    push        40
 0045421A    push        1000
 0045421F    push        1000
 00454224    push        0
 00454226    call        kernel32.VirtualAlloc
 0045422B    mov         esi,eax
 0045422D    mov         eax,[00792FEC]
 00454232    mov         dword ptr [esi],eax
 00454234    lea         edx,[esi+4]
 00454237    mov         eax,78515C
 0045423C    mov         ecx,2
 00454241    call        Move
 00454246    mov         edx,4541E0;StdWndProc:LongInt
 0045424B    lea         eax,[esi+5]
 0045424E    call        CalcJmpOffset
 00454253    mov         dword ptr [esi+6],eax
 00454256    lea         ebx,[esi+0A]
 00454259    mov         byte ptr [ebx],0E8
 0045425C    lea         edx,[esi+4]
 0045425F    mov         eax,ebx
 00454261    call        CalcJmpOffset
 00454266    mov         dword ptr [ebx+1],eax
 00454269    mov         eax,dword ptr [edi]
 0045426B    mov         dword ptr [ebx+5],eax
 0045426E    mov         dword ptr [edi],ebx
 00454270    add         ebx,0D
 00454273    mov         eax,ebx
 00454275    sub         eax,esi
 00454277    cmp         eax,0FFC
>0045427C    jl          00454259
 0045427E    mov         dword ptr ds:[792FEC],esi
 00454284    mov         eax,dword ptr [edi]
 00454286    mov         ebx,dword ptr [edi]
 00454288    mov         edx,dword ptr [ebx+5]
 0045428B    mov         dword ptr [edi],edx
 0045428D    mov         edx,dword ptr [ebp+8]
 00454290    mov         dword ptr [ebx+5],edx
 00454293    mov         edx,dword ptr [ebp+0C]
 00454296    mov         dword ptr [ebx+9],edx
 00454299    pop         edi
 0045429A    pop         esi
 0045429B    pop         ebx
 0045429C    pop         ebp
 0045429D    ret         8
*}
end;

//004542A0
procedure FreeObjectInstance(ObjectInstance:Pointer);
begin
{*
 004542A0    test        eax,eax
>004542A2    je          004542B2
 004542A4    mov         edx,dword ptr ds:[792FF0]
 004542AA    mov         dword ptr [eax+5],edx
 004542AD    mov         [00792FF0],eax
 004542B2    ret
*}
end;

//004542B4
procedure CleanupInstFreeList(BlockStart:PByte; BlockEnd:PByte);
begin
{*
 004542B4    push        esi
 004542B5    push        edi
 004542B6    push        ebp
 004542B7    xor         esi,esi
 004542B9    mov         ecx,dword ptr ds:[792FF0]
 004542BF    test        ecx,ecx
>004542C1    je          004542E9
 004542C3    mov         edi,dword ptr [ecx+5]
 004542C6    mov         ebp,ecx
 004542C8    cmp         eax,ebp
>004542CA    ja          004542E1
 004542CC    cmp         edx,ebp
>004542CE    jb          004542E1
 004542D0    mov         ecx,esi
 004542D2    test        esi,esi
>004542D4    jne         004542DE
 004542D6    mov         dword ptr ds:[792FF0],edi
>004542DC    jmp         004542E1
 004542DE    mov         dword ptr [esi+5],edi
 004542E1    mov         esi,ecx
 004542E3    mov         ecx,edi
 004542E5    test        ecx,ecx
>004542E7    jne         004542C3
 004542E9    pop         ebp
 004542EA    pop         edi
 004542EB    pop         esi
 004542EC    ret
*}
end;

//004542F0
function GetFreeInstBlockItemCount(Item:PObjectInstance; Block:PInstanceBlock):Integer;
begin
{*
 004542F0    push        ebx
 004542F1    push        esi
 004542F2    xor         ebx,ebx
 004542F4    test        eax,eax
>004542F6    je          00454318
 004542F8    mov         ecx,139
 004542FD    imul        esi,ecx,0D
 00454300    lea         esi,[edx+esi+0A]
 00454304    cmp         eax,esi
>00454306    jne         0045430B
 00454308    inc         ebx
>00454309    jmp         00454311
 0045430B    dec         ecx
 0045430C    cmp         ecx,0FFFFFFFF
>0045430F    jne         004542FD
 00454311    mov         eax,dword ptr [eax+5]
 00454314    test        eax,eax
>00454316    jne         004542F8
 00454318    mov         eax,ebx
 0045431A    pop         esi
 0045431B    pop         ebx
 0045431C    ret
*}
end;

//00454320
procedure ReleaseObjectInstanceBlocks;
begin
{*
 00454320    push        ebx
 00454321    push        esi
 00454322    push        edi
 00454323    push        ebp
 00454324    mov         ebx,dword ptr ds:[792FEC]
 0045432A    xor         esi,esi
 0045432C    test        ebx,ebx
>0045432E    je          0045437D
 00454330    mov         edi,dword ptr [ebx]
 00454332    mov         edx,ebx
 00454334    mov         eax,[00792FF0]
 00454339    call        GetFreeInstBlockItemCount
 0045433E    mov         ebp,eax
 00454340    cmp         ebp,13A
>00454346    jne         00454375
 00454348    mov         edx,ebx
 0045434A    add         edx,0FFC
 00454350    dec         edx
 00454351    mov         eax,ebx
 00454353    call        CleanupInstFreeList
 00454358    push        8000
 0045435D    push        0
 0045435F    push        ebx
 00454360    call        kernel32.VirtualFree
 00454365    mov         ebx,esi
 00454367    test        esi,esi
>00454369    jne         00454373
 0045436B    mov         dword ptr ds:[792FEC],edi
>00454371    jmp         00454375
 00454373    mov         dword ptr [esi],edi
 00454375    mov         esi,ebx
 00454377    mov         ebx,edi
 00454379    test        ebx,ebx
>0045437B    jne         00454330
 0045437D    pop         ebp
 0045437E    pop         edi
 0045437F    pop         esi
 00454380    pop         ebx
 00454381    ret
*}
end;

//004543A0
function AllocateHWnd(AMethod:TWndMethod):HWND;
begin
{*
 004543A0    push        ebp
 004543A1    mov         ebp,esp
 004543A3    add         esp,0FFFFFFD8
 004543A6    push        ebx
 004543A7    mov         eax,[00790C38];gvar_00790C38
 004543AC    mov         [00785170],eax
 004543B1    lea         eax,[ebp-28]
 004543B4    push        eax
 004543B5    mov         eax,[00785184]
 004543BA    push        eax
 004543BB    mov         eax,[00790C38];gvar_00790C38
 004543C0    push        eax
 004543C1    call        user32.GetClassInfoW
 004543C6    cmp         eax,1
 004543C9    sbb         eax,eax
 004543CB    inc         eax
 004543CC    test        al,al
>004543CE    je          004543DA
 004543D0    mov         edx,40DD38;user32.DefWindowProcW:Integer
 004543D5    cmp         edx,dword ptr [ebp-24]
>004543D8    je          004543F9
 004543DA    test        al,al
>004543DC    je          004543EF
 004543DE    mov         eax,[00790C38];gvar_00790C38
 004543E3    push        eax
 004543E4    mov         eax,[00785184]
 004543E9    push        eax
 004543EA    call        user32.UnregisterClassW
 004543EF    push        785160
 004543F4    call        user32.RegisterClassW
 004543F9    push        80000000
 004543FE    push        0
 00454400    push        0
 00454402    push        0
 00454404    push        0
 00454406    push        0
 00454408    push        0
 0045440A    mov         eax,[00790C38];gvar_00790C38
 0045440F    push        eax
 00454410    push        0
 00454412    mov         ecx,454450
 00454417    mov         edx,dword ptr ds:[785184]
 0045441D    mov         eax,80
 00454422    call        CreateWindowEx
 00454427    mov         ebx,eax
 00454429    cmp         word ptr [ebp+0A],0
>0045442E    je          00454444
 00454430    push        dword ptr [ebp+0C]
 00454433    push        dword ptr [ebp+8]
 00454436    call        MakeObjectInstance
 0045443B    push        eax
 0045443C    push        0FC
 0045443E    push        ebx
 0045443F    call        user32.SetWindowLongW
 00454444    mov         eax,ebx
 00454446    pop         ebx
 00454447    mov         esp,ebp
 00454449    pop         ebp
 0045444A    ret         8
*}
end;

//00454454
procedure DeallocateHWnd(Wnd:HWND);
begin
{*
 00454454    push        ebx
 00454455    push        esi
 00454456    mov         esi,eax
 00454458    push        0FC
 0045445A    push        esi
 0045445B    call        user32.GetWindowLongW
 00454460    mov         ebx,eax
 00454462    push        esi
 00454463    call        user32.DestroyWindow
 00454468    cmp         ebx,40DD38;user32.DefWindowProcW:Integer
>0045446E    je          00454477
 00454470    mov         eax,ebx
 00454472    call        FreeObjectInstance
 00454477    pop         esi
 00454478    pop         ebx
 00454479    ret
*}
end;

//0045447C
constructor EFileStreamError.Create(FileName:string);
begin
{*
 0045447C    push        ebp
 0045447D    mov         ebp,esp
 0045447F    add         esp,0FFFFFFE8
 00454482    push        ebx
 00454483    push        esi
 00454484    push        edi
 00454485    xor         ebx,ebx
 00454487    mov         dword ptr [ebp-14],ebx
 0045448A    mov         dword ptr [ebp-18],ebx
 0045448D    test        dl,dl
>0045448F    je          00454499
 00454491    add         esp,0FFFFFFF0
 00454494    call        @ClassCreate
 00454499    mov         esi,ecx
 0045449B    mov         ebx,edx
 0045449D    mov         edi,eax
 0045449F    xor         eax,eax
 004544A1    push        ebp
 004544A2    push        454505
 004544A7    push        dword ptr fs:[eax]
 004544AA    mov         dword ptr fs:[eax],esp
 004544AD    lea         edx,[ebp-14]
 004544B0    mov         eax,dword ptr [ebp+8]
 004544B3    call        ExpandFileName
 004544B8    mov         eax,dword ptr [ebp-14]
 004544BB    mov         dword ptr [ebp-10],eax
 004544BE    mov         byte ptr [ebp-0C],11
 004544C2    call        kernel32.GetLastError
 004544C7    lea         edx,[ebp-18]
 004544CA    call        SysErrorMessage
 004544CF    mov         eax,dword ptr [ebp-18]
 004544D2    mov         dword ptr [ebp-8],eax
 004544D5    mov         byte ptr [ebp-4],11
 004544D9    lea         eax,[ebp-10]
 004544DC    push        eax
 004544DD    push        1
 004544DF    mov         ecx,esi
 004544E1    xor         edx,edx
 004544E3    mov         eax,edi
 004544E5    call        Exception.CreateResFmt
 004544EA    xor         eax,eax
 004544EC    pop         edx
 004544ED    pop         ecx
 004544EE    pop         ecx
 004544EF    mov         dword ptr fs:[eax],edx
 004544F2    push        45450C
 004544F7    lea         eax,[ebp-18]
 004544FA    mov         edx,2
 004544FF    call        @UStrArrayClr
 00454504    ret
>00454505    jmp         @HandleFinally
>0045450A    jmp         004544F7
 0045450C    mov         eax,edi
 0045450E    test        bl,bl
>00454510    je          00454521
 00454512    call        @AfterConstruction
 00454517    pop         dword ptr fs:[0]
 0045451E    add         esp,0C
 00454521    mov         eax,edi
 00454523    pop         edi
 00454524    pop         esi
 00454525    pop         ebx
 00454526    mov         esp,ebp
 00454528    pop         ebp
 00454529    ret         4
*}
end;

Initialization
//00780288
{*
 00780288    push        ebp
 00780289    mov         ebp,esp
 0078028B    xor         eax,eax
 0078028D    push        ebp
 0078028E    push        78030C
 00780293    push        dword ptr fs:[eax]
 00780296    mov         dword ptr fs:[eax],esp
 00780299    sub         dword ptr ds:[792FD0],1
>007802A0    jae         007802FE
 007802A2    mov         eax,4541D8;ModuleUnload
 007802A7    call        AddModuleUnloadProc
 007802AC    mov         dl,1
 007802AE    mov         eax,[0041B0FC];TMultiReadExclusiveWriteSynchronizer
 007802B3    call        TMultiReadExclusiveWriteSynchronizer.Create
 007802B8    mov         edx,eax
 007802BA    test        edx,edx
>007802BC    je          007802C1
 007802BE    sub         edx,0FFFFFFD4
 007802C1    mov         eax,792FC4
 007802C6    call        @IntfCopy
 007802CB    mov         dl,1
 007802CD    mov         eax,[0044388C];TRegGroups
 007802D2    call        TRegGroups.Create
 007802D7    mov         [00792FD8],eax
 007802DC    mov         dl,1
 007802DE    mov         eax,[00439D58];TThreadList
 007802E3    call        TThreadList.Create
 007802E8    mov         [00792FD4],eax
 007802ED    mov         dl,1
 007802EF    mov         eax,[00439D58];TThreadList
 007802F4    call        TThreadList.Create
 007802F9    mov         [00792FE0],eax
 007802FE    xor         eax,eax
 00780300    pop         edx
 00780301    pop         ecx
 00780302    pop         ecx
 00780303    mov         dword ptr fs:[eax],edx
 00780306    push        780313
 0078030B    ret
>0078030C    jmp         @HandleFinally
>00780311    jmp         0078030B
 00780313    pop         ebp
 00780314    ret
*}
Finalization
//0045452C
{*
 0045452C    push        ebp
 0045452D    mov         ebp,esp
 0045452F    push        ebx
 00454530    xor         eax,eax
 00454532    push        ebp
 00454533    push        4545F2
 00454538    push        dword ptr fs:[eax]
 0045453B    mov         dword ptr fs:[eax],esp
 0045453E    inc         dword ptr ds:[792FD0]
>00454544    jne         004545E4
 0045454A    mov         eax,[00790C38];gvar_00790C38
 0045454F    call        UnRegisterModuleClasses
 00454554    mov         eax,[00792FC4]
 00454559    mov         edx,dword ptr [eax]
 0045455B    call        dword ptr [edx+14]
 0045455E    call        FreeIntConstList
 00454563    xor         edx,edx
 00454565    xor         eax,eax
 00454567    call        RemoveFixupReferences
 0045456C    mov         eax,[00792FE0]
 00454571    xor         edx,edx
 00454573    mov         dword ptr ds:[792FE0],edx
 00454579    call        TObject.Free
 0045457E    call        @GetTls
 00454583    mov         ebx,dword ptr [eax+10];{GlobalLists:TList}
 00454589    call        @GetTls
 0045458E    xor         edx,edx
 00454590    mov         dword ptr [eax+10],edx;{GlobalLists:TList}
 00454596    mov         eax,ebx
 00454598    call        TObject.Free
 0045459D    mov         eax,[00792FD8]
 004545A2    xor         edx,edx
 004545A4    mov         dword ptr ds:[792FD8],edx
 004545AA    call        TObject.Free
 004545AF    mov         eax,792FC4
 004545B4    call        @IntfClear
 004545B9    mov         eax,4541D8;ModuleUnload
 004545BE    call        RemoveModuleUnloadProc
 004545C3    mov         eax,[00792FDC]
 004545C8    xor         edx,edx
 004545CA    mov         dword ptr ds:[792FDC],edx
 004545D0    call        TObject.Free
 004545D5    call        ReleaseObjectInstanceBlocks
 004545DA    mov         eax,792FC4
 004545DF    call        @IntfClear
 004545E4    xor         eax,eax
 004545E6    pop         edx
 004545E7    pop         ecx
 004545E8    pop         ecx
 004545E9    mov         dword ptr fs:[eax],edx
 004545EC    push        4545F9
 004545F1    ret
>004545F2    jmp         @HandleFinally
>004545F7    jmp         004545F1
 004545F9    pop         ebx
 004545FA    pop         ebp
 004545FB    ret
*}
end.