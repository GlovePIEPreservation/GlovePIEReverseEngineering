//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit IdUDPServer;

interface

uses
  SysUtils, Classes, IdAntiFreezeBase, IdSocketHandle, IdUDPBase, IdBuffer, IdExceptionCore, IdIntercept, IdIOHandler, System, IdUDPServer, PieWiimoteForm, PieSixaxisForm, PieEditorUnit;

type
  TIdUDPListenerThread = class(TIdThread)
  published
    procedure UDPRead;//005C2C40
    procedure UDPException;//005C2C5C
    constructor Create(ABinding:TIdSocketHandle);//005C2A00
    destructor Destroy();//005C2A70
  public
    FBinding:TIdSocketHandle;//f70
    FAcceptWait:Integer;//f74
    FBuffer:?;//f78
    FCurrentException:string;//f7C
    FCurrentExceptionClass:TClass;//f80
    FData:TObject;//f84
    FServer:TIdUDPServer;//f88
    destructor Destroy(); virtual;//005C2A70
    procedure AfterRun; virtual;//v8//005C29EC
    procedure Run; virtual;//v28//005C2AB0
    constructor Create(ABinding:TIdSocketHandle); virtual;//v40//005C2A00
  end;
  TIdUDPExceptionEvent = procedure(AThread:TIdUDPListenerThread; ABinding:TIdSocketHandle; const AMessage:string; const AExceptionClass:TClass) of object;;
  TUDPReadEvent = procedure(AThread:TIdUDPListenerThread; AData:TArray<System.Byte>; ABinding:TIdSocketHandle) of object;;
  TIdUDPServer = class(TIdUDPBase)
  published
    destructor Destroy();//005C2658
  public
    FBindings:TIdSocketHandles;//fB0
    FCurrentBinding:TIdSocketHandle;//fB4
    FListenerThreads:TThreadList;//fB8
    FThreadClass:TIdUDPListenerThreadClass;//fBC
    FThreadedEvent:Boolean;//fC0
    FOnBeforeBind:TIdSocketHandleEvent;//fC8
    FOnAfterBind:TNotifyEvent;//fD0
    FOnUDPRead:TUDPReadEvent;//fD8
    fDC:TEditorForm;//fDC
    FOnUDPException:TIdUDPExceptionEvent;//fE0
    destructor Destroy(); virtual;//005C2658
    procedure InitComponent; virtual;//v34//005C2990
    procedure CloseBinding; virtual;//v44//005C25BC
    function GetActive:Boolean; virtual;//v48//005C273C
    function GetBinding:TIdSocketHandle; virtual;//v4C//005C275C
    procedure DoBeforeBind(AHandle:TIdSocketHandle); virtual;//v7C//005C26AC
    procedure DoAfterBind; virtual;//v80//005C26C8
    procedure DoOnUDPException(AThread:TIdUDPListenerThread; ABinding:TIdSocketHandle; const AMessage:UnicodeString; const AExceptionClass:TClass); virtual;//v84//005C26E8
    procedure DoUDPRead(AThread:TIdUDPListenerThread; const AData:TIdBytes; ABinding:TIdSocketHandle); virtual;//v88//005C2714
    procedure BroadcastEnabledChanged; dynamic;//005C2578
    function GetDefaultPort:TIdPort;//005C2984
    procedure SetBindings(const Value:TIdSocketHandles);//005C29D0
    procedure SetDefaultPort(const AValue:TIdPort);//005C29E0
  end;
  _D3DCOLORVALUE = _D3DCOLORVALUE = record//size=10
r:Single;//f0
g:Single;//f4
b:Single;//f8
a:Single;//fC
end;;
  _D3DMATRIX = _D3DMATRIX = record//size=40
_11:Single;//f0
_12:Single;//f4
_13:Single;//f8
_14:Single;//fC
_21:Single;//f10
_22:Single;//f14
_23:Single;//f18
_24:Single;//f1C
_31:Single;//f20
_32:Single;//f24
_33:Single;//f28
_34:Single;//f2C
_41:Single;//f30
_42:Single;//f34
_43:Single;//f38
_44:Single;//f3C
m:?;//f0
end;;
  _D3DMATERIAL9 = _D3DMATERIAL9 = record//size=44
Diffuse:_D3DCOLORVALUE;//f0
Ambient:_D3DCOLORVALUE;//f10
Specular:_D3DCOLORVALUE;//f20
Emissive:_D3DCOLORVALUE;//f30
Power:Single;//f40
end;;
  _D3DMULTISAMPLE_TYPE = (D3DMULTISAMPLE_NONE, D3DMULTISAMPLE_NONMASKABLE, D3DMULTISAMPLE_2_SAMPLES, D3DMULTISAMPLE_3_SAMPLES, D3DMULTISAMPLE_4_SAMPLES, D3DMULTISAMPLE_5_SAMPLES, D3DMULTISAMPLE_6_SAMPLES, D3DMULTISAMPLE_7_SAMPLES, D3DMULTISAMPLE_8_SAMPLES, D3DMULTISAMPLE_9_SAMPLES, D3DMULTISAMPLE_10_SAMPLES, D3DMULTISAMPLE_11_SAMPLES, D3DMULTISAMPLE_12_SAMPLES, D3DMULTISAMPLE_13_SAMPLES, D3DMULTISAMPLE_14_SAMPLES, D3DMULTISAMPLE_15_SAMPLES, D3DMULTISAMPLE_16_SAMPLES);
  _D3DPRESENT_PARAMETERS_ = _D3DPRESENT_PARAMETERS_ = record//size=38
BackBufferWidth:Cardinal;//f0
BackBufferHeight:Cardinal;//f4
BackBufferFormat:_D3DFORMAT;//f8
BackBufferCount:Cardinal;//fC
MultiSampleType:_D3DMULTISAMPLE_TYPE;//f10
MultiSampleQuality:Cardinal;//f14
SwapEffect:?;//f18
hDeviceWindow:HWND;//f1C
Windowed:LongBool;//f20
EnableAutoDepthStencil:LongBool;//f24
AutoDepthStencilFormat:_D3DFORMAT;//f28
Flags:Integer;//f2C
FullScreen_RefreshRateInHz:Cardinal;//f30
PresentationInterval:Cardinal;//f34
end;;
  TRotMat = array [1..?,1..?] of Double;
    procedure BroadcastEnabledChanged;//005C2578
    procedure CloseBinding;//005C25BC
    procedure DoBeforeBind(AHandle:TIdSocketHandle);//005C26AC
    procedure DoAfterBind;//005C26C8
    procedure DoOnUDPException(AThread:TIdUDPListenerThread; ABinding:TIdSocketHandle; const AMessage:UnicodeString; const AExceptionClass:TClass);//005C26E8
    procedure DoUDPRead(AThread:TIdUDPListenerThread; const AData:TIdBytes; ABinding:TIdSocketHandle);//005C2714
    function GetActive:Boolean;//005C273C
    function GetBinding:TIdSocketHandle;//005C275C
    procedure InitComponent;//005C2990
    procedure AfterRun;//005C29EC
    procedure Run;//005C2AB0
    P5_Init;//005C2C80
    P5_Close;//005C2C88
    //function P5_GetCount:?;//005C2C90
    //function P5_GetStatePointer:?;//005C2C98
    //function P5_GetInfoPointer:?;//005C2CA0
    //function P5_GetMouseState:?;//005C2CA8
    P5_SetMouseState;//005C2CB0
    P5_SetFilterMode;//005C2CB8
    P5_SetFilterAmount;//005C2CC0
    function Direct3DCreate9:IDirect3D9; stdcall;//005C33A0
    //procedure sub_005C33A8(?:?; ?:?);//005C33A8
    //procedure sub_005C34E8(?:?; ?:?);//005C34E8
    //procedure sub_005C3550(?:?; ?:Double; ?:Double; ?:?);//005C3550
    //procedure sub_005C361C(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//005C361C
    //function sub_005C3780(?:?):?;//005C3780
    //procedure sub_005C37C4(?:?; ?:?);//005C37C4
    //function sub_005C3880(?:?; ?:?):?;//005C3880
    //function sub_005C390C(?:?):?;//005C390C
    //procedure sub_005C3A28(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//005C3A28
    //function sub_005C3B88(?:?):?;//005C3B88
    //procedure sub_005C3BEC(?:?);//005C3BEC
    //function sub_005C3C20(?:?; ?:?; ?:?; ?:?):?;//005C3C20
    //procedure sub_005C3CB0(?:TRotMat; ?:TRotMat; ?:?);//005C3CB0
    //procedure sub_005C3D20(?:TRotMat; ?:TRotMat; ?:?);//005C3D20
    //procedure sub_005C3D90(?:?);//005C3D90
    //procedure sub_005C3ECC(?:?; ?:?; ?:?; ?:?);//005C3ECC
    //procedure sub_005C3F38(?:?; ?:?; ?:?; ?:?);//005C3F38
    //procedure sub_005C3FA4(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//005C3FA4
    //procedure sub_005C3FE0(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//005C3FE0
    //function sub_005C4070(?:?; ?:?; ?:?):?;//005C4070
    //procedure sub_005C40B0(?:?; ?:?; ?:?; ?:?; ?:?);//005C40B0

implementation

//005C2578
procedure TIdUDPServer.BroadcastEnabledChanged;
begin
{*
 005C2578    push        ebx
 005C2579    push        esi
 005C257A    push        edi
 005C257B    mov         ebx,eax
 005C257D    cmp         dword ptr [ebx+0B4],0
>005C2584    je          005C25B7
 005C2586    mov         eax,dword ptr [ebx+0B0]
 005C258C    mov         eax,dword ptr [eax+8]
 005C258F    mov         esi,dword ptr [eax+8]
 005C2592    dec         esi
 005C2593    test        esi,esi
>005C2595    jl          005C25B7
 005C2597    inc         esi
 005C2598    xor         edi,edi
 005C259A    mov         edx,edi
 005C259C    mov         eax,dword ptr [ebx+0B0]
 005C25A2    call        TIdSocketHandles.GetItem
 005C25A7    movzx       edx,byte ptr [ebx+0A9]
 005C25AE    call        TIdSocketHandle.SetBroadcastEnabled
 005C25B3    inc         edi
 005C25B4    dec         esi
>005C25B5    jne         005C259A
 005C25B7    pop         edi
 005C25B8    pop         esi
 005C25B9    pop         ebx
 005C25BA    ret
*}
end;

//005C25BC
procedure TIdUDPServer.CloseBinding;
begin
{*
 005C25BC    push        ebp
 005C25BD    mov         ebp,esp
 005C25BF    push        ecx
 005C25C0    push        ebx
 005C25C1    push        esi
 005C25C2    mov         dword ptr [ebp-4],eax
 005C25C5    mov         eax,dword ptr [ebp-4]
 005C25C8    mov         eax,dword ptr [eax+0B8]
 005C25CE    test        eax,eax
>005C25D0    je          005C2646
 005C25D2    call        TThreadList.LockList
 005C25D7    mov         esi,eax
 005C25D9    xor         eax,eax
 005C25DB    push        ebp
 005C25DC    push        5C263F
 005C25E1    push        dword ptr fs:[eax]
 005C25E4    mov         dword ptr fs:[eax],esp
>005C25E7    jmp         005C261A
 005C25E9    xor         edx,edx
 005C25EB    mov         eax,esi
 005C25ED    call        TList.Get
 005C25F2    mov         ebx,eax
 005C25F4    mov         eax,ebx
 005C25F6    mov         edx,dword ptr [eax]
 005C25F8    call        dword ptr [edx+34]
 005C25FB    mov         eax,dword ptr [ebx+70]
 005C25FE    mov         edx,dword ptr [eax]
 005C2600    call        dword ptr [edx+24]
 005C2603    mov         eax,ebx
 005C2605    call        TThread.WaitFor
 005C260A    mov         eax,ebx
 005C260C    call        TObject.Free
 005C2611    xor         edx,edx
 005C2613    mov         eax,esi
 005C2615    call        TList.Delete
 005C261A    cmp         dword ptr [esi+8],0
>005C261E    jg          005C25E9
 005C2620    xor         eax,eax
 005C2622    pop         edx
 005C2623    pop         ecx
 005C2624    pop         ecx
 005C2625    mov         dword ptr fs:[eax],edx
 005C2628    push        5C2646
 005C262D    mov         eax,dword ptr [ebp-4]
 005C2630    mov         eax,dword ptr [eax+0B8]
 005C2636    mov         eax,dword ptr [eax+8]
 005C2639    call        TMonitor.Exit
 005C263E    ret
>005C263F    jmp         @HandleFinally
>005C2644    jmp         005C262D
 005C2646    mov         eax,dword ptr [ebp-4]
 005C2649    xor         edx,edx
 005C264B    mov         dword ptr [eax+0B4],edx
 005C2651    pop         esi
 005C2652    pop         ebx
 005C2653    pop         ecx
 005C2654    pop         ebp
 005C2655    ret
*}
end;

//005C2658
destructor TIdUDPServer.Destroy();
begin
{*
 005C2658    push        ebx
 005C2659    push        esi
 005C265A    call        @BeforeDestruction
 005C265F    mov         ebx,edx
 005C2661    mov         esi,eax
 005C2663    xor         edx,edx
 005C2665    mov         eax,esi
 005C2667    call        TIdUDPBase.SetActive
 005C266C    lea         eax,[esi+0B0]
 005C2672    mov         edx,dword ptr [eax]
 005C2674    xor         ecx,ecx
 005C2676    mov         dword ptr [eax],ecx
 005C2678    mov         eax,edx
 005C267A    call        TObject.Free
 005C267F    lea         eax,[esi+0B8]
 005C2685    mov         edx,dword ptr [eax]
 005C2687    xor         ecx,ecx
 005C2689    mov         dword ptr [eax],ecx
 005C268B    mov         eax,edx
 005C268D    call        TObject.Free
 005C2692    mov         edx,ebx
 005C2694    and         dl,0FC
 005C2697    mov         eax,esi
 005C2699    call        TIdUDPBase.Destroy
 005C269E    test        bl,bl
>005C26A0    jle         005C26A9
 005C26A2    mov         eax,esi
 005C26A4    call        @ClassDestroy
 005C26A9    pop         esi
 005C26AA    pop         ebx
 005C26AB    ret
*}
end;

//005C26AC
procedure TIdUDPServer.DoBeforeBind(AHandle:TIdSocketHandle);
begin
{*
 005C26AC    push        ebx
 005C26AD    cmp         word ptr [eax+0CA],0
>005C26B5    je          005C26C5
 005C26B7    mov         ebx,eax
 005C26B9    mov         eax,dword ptr [ebx+0CC]
 005C26BF    call        dword ptr [ebx+0C8]
 005C26C5    pop         ebx
 005C26C6    ret
*}
end;

//005C26C8
procedure TIdUDPServer.DoAfterBind;
begin
{*
 005C26C8    push        ebx
 005C26C9    cmp         word ptr [eax+0D2],0
>005C26D1    je          005C26E3
 005C26D3    mov         ebx,eax
 005C26D5    mov         edx,eax
 005C26D7    mov         eax,dword ptr [ebx+0D4]
 005C26DD    call        dword ptr [ebx+0D0]
 005C26E3    pop         ebx
 005C26E4    ret
*}
end;

//005C26E8
procedure TIdUDPServer.DoOnUDPException(AThread:TIdUDPListenerThread; ABinding:TIdSocketHandle; const AMessage:UnicodeString; const AExceptionClass:TClass);
begin
{*
 005C26E8    push        ebp
 005C26E9    mov         ebp,esp
 005C26EB    push        ebx
 005C26EC    cmp         word ptr [eax+0E2],0
>005C26F4    je          005C270C
 005C26F6    mov         ebx,dword ptr [ebp+0C]
 005C26F9    push        ebx
 005C26FA    mov         ebx,dword ptr [ebp+8]
 005C26FD    push        ebx
 005C26FE    mov         ebx,eax
 005C2700    mov         eax,dword ptr [ebx+0E4]
 005C2706    call        dword ptr [ebx+0E0]
 005C270C    pop         ebx
 005C270D    pop         ebp
 005C270E    ret         8
*}
end;

//005C2714
procedure TIdUDPServer.DoUDPRead(AThread:TIdUDPListenerThread; const AData:TIdBytes; ABinding:TIdSocketHandle);
begin
{*
 005C2714    push        ebp
 005C2715    mov         ebp,esp
 005C2717    push        ebx
 005C2718    cmp         word ptr [eax+0DA],0
>005C2720    je          005C2734
 005C2722    mov         ebx,dword ptr [ebp+8]
 005C2725    push        ebx
 005C2726    mov         ebx,eax
 005C2728    mov         eax,dword ptr [ebx+0DC]
 005C272E    call        dword ptr [ebx+0D8]
 005C2734    pop         ebx
 005C2735    pop         ebp
 005C2736    ret         4
*}
end;

//005C273C
function TIdUDPServer.GetActive:Boolean;
begin
{*
 005C273C    push        ebx
 005C273D    mov         ebx,eax
 005C273F    mov         eax,ebx
 005C2741    call        TIdUDPBase.GetActive
 005C2746    test        al,al
>005C2748    jne         005C2758
 005C274A    mov         edx,dword ptr [ebx+0B4]
 005C2750    test        edx,edx
>005C2752    je          005C2758
 005C2754    movzx       eax,byte ptr [edx+14]
 005C2758    pop         ebx
 005C2759    ret
*}
end;

//005C275C
function TIdUDPServer.GetBinding:TIdSocketHandle;
begin
{*
 005C275C    push        ebp
 005C275D    mov         ebp,esp
 005C275F    add         esp,0FFFFFFF4
 005C2762    push        ebx
 005C2763    push        esi
 005C2764    push        edi
 005C2765    xor         edx,edx
 005C2767    mov         dword ptr [ebp-0C],edx
 005C276A    mov         dword ptr [ebp-4],eax
 005C276D    xor         eax,eax
 005C276F    push        ebp
 005C2770    push        5C294D
 005C2775    push        dword ptr fs:[eax]
 005C2778    mov         dword ptr fs:[eax],esp
 005C277B    mov         eax,dword ptr [ebp-4]
 005C277E    cmp         dword ptr [eax+0B4],0
>005C2785    jne         005C292E
 005C278B    mov         eax,dword ptr [ebp-4]
 005C278E    mov         eax,dword ptr [eax+0B0]
 005C2794    mov         edx,dword ptr [eax+8]
 005C2797    cmp         dword ptr [edx+8],0
>005C279B    jne         005C27CA
 005C279D    call        TIdSocketHandles.Add
 005C27A2    mov         eax,[0078D940];^gvar_00789ED0
 005C27A7    mov         eax,dword ptr [eax]
 005C27A9    mov         edx,dword ptr [eax]
 005C27AB    call        dword ptr [edx+80]
 005C27B1    test        al,al
>005C27B3    je          005C27CA
 005C27B5    mov         eax,dword ptr [ebp-4]
 005C27B8    mov         eax,dword ptr [eax+0B0]
 005C27BE    call        TIdSocketHandles.Add
 005C27C3    mov         dl,1
 005C27C5    call        TIdSocketHandle.SetIPVersion
 005C27CA    xor         eax,eax
 005C27CC    mov         dword ptr [ebp-8],eax
 005C27CF    xor         eax,eax
 005C27D1    push        ebp
 005C27D2    push        5C2842
 005C27D7    push        dword ptr fs:[eax]
 005C27DA    mov         dword ptr fs:[eax],esp
>005C27DD    jmp         005C2825
 005C27DF    mov         eax,dword ptr [ebp-4]
 005C27E2    mov         eax,dword ptr [eax+0B0]
 005C27E8    mov         edx,dword ptr [ebp-8]
 005C27EB    call        TIdSocketHandles.GetItem
 005C27F0    mov         ebx,eax
 005C27F2    xor         ecx,ecx
 005C27F4    mov         edx,2
 005C27F9    mov         eax,ebx
 005C27FB    call        TIdSocketHandle.AllocateSocket
 005C2800    mov         eax,dword ptr [ebp-4]
 005C2803    mov         eax,dword ptr [eax+0B0]
 005C2809    mov         edx,dword ptr [ebp-8]
 005C280C    call        TIdSocketHandles.GetItem
 005C2811    mov         edx,eax
 005C2813    mov         eax,dword ptr [ebp-4]
 005C2816    mov         ecx,dword ptr [eax]
 005C2818    call        dword ptr [ecx+7C]
 005C281B    mov         eax,ebx
 005C281D    call        TIdSocketHandle.Bind
 005C2822    inc         dword ptr [ebp-8]
 005C2825    mov         eax,dword ptr [ebp-4]
 005C2828    mov         eax,dword ptr [eax+0B0]
 005C282E    call        TCollection.GetCount
 005C2833    cmp         eax,dword ptr [ebp-8]
>005C2836    jg          005C27DF
 005C2838    xor         eax,eax
 005C283A    pop         edx
 005C283B    pop         ecx
 005C283C    pop         ecx
 005C283D    mov         dword ptr fs:[eax],edx
>005C2840    jmp         005C2879
>005C2842    jmp         @HandleAnyException
 005C2847    dec         dword ptr [ebp-8]
 005C284A    cmp         dword ptr [ebp-8],0
>005C284E    jl          005C286F
 005C2850    mov         eax,dword ptr [ebp-4]
 005C2853    mov         eax,dword ptr [eax+0B0]
 005C2859    mov         edx,dword ptr [ebp-8]
 005C285C    call        TIdSocketHandles.GetItem
 005C2861    mov         edx,dword ptr [eax]
 005C2863    call        dword ptr [edx+24]
 005C2866    dec         dword ptr [ebp-8]
 005C2869    cmp         dword ptr [ebp-8],0
>005C286D    jge         005C2850
 005C286F    call        @RaiseAgain
 005C2874    call        @DoneExcept
 005C2879    mov         eax,dword ptr [ebp-4]
 005C287C    mov         edx,dword ptr [eax]
 005C287E    call        dword ptr [edx+80]
 005C2884    mov         eax,dword ptr [ebp-4]
 005C2887    mov         eax,dword ptr [eax+0B0]
 005C288D    mov         eax,dword ptr [eax+8]
 005C2890    mov         esi,dword ptr [eax+8]
 005C2893    dec         esi
 005C2894    test        esi,esi
>005C2896    jl          005C2909
 005C2898    inc         esi
 005C2899    mov         dword ptr [ebp-8],0
 005C28A0    mov         eax,dword ptr [ebp-4]
 005C28A3    mov         eax,dword ptr [eax+0B0]
 005C28A9    mov         edx,dword ptr [ebp-8]
 005C28AC    call        TIdSocketHandles.GetItem
 005C28B1    push        eax
 005C28B2    mov         eax,dword ptr [ebp-4]
 005C28B5    mov         eax,dword ptr [eax+0BC]
 005C28BB    mov         ecx,dword ptr [ebp-4]
 005C28BE    mov         dl,1
 005C28C0    call        dword ptr [eax+40]
 005C28C3    mov         ebx,eax
 005C28C5    mov         eax,dword ptr [ebp-4]
 005C28C8    push        dword ptr [eax+8]
 005C28CB    push        5C296C;' Listener #'
 005C28D0    lea         edx,[ebp-0C]
 005C28D3    mov         eax,dword ptr [ebp-8]
 005C28D6    inc         eax
 005C28D7    call        IntToStr
 005C28DC    push        dword ptr [ebp-0C]
 005C28DF    lea         eax,[ebx+4C]
 005C28E2    mov         edx,3
 005C28E7    call        @UStrCatN
 005C28EC    mov         eax,dword ptr [ebp-4]
 005C28EF    mov         eax,dword ptr [eax+0B8]
 005C28F5    mov         edx,ebx
 005C28F7    call        TThreadList.Add
 005C28FC    mov         eax,ebx
 005C28FE    mov         edx,dword ptr [eax]
 005C2900    call        dword ptr [edx+30]
 005C2903    inc         dword ptr [ebp-8]
 005C2906    dec         esi
>005C2907    jne         005C28A0
 005C2909    mov         eax,dword ptr [ebp-4]
 005C290C    mov         eax,dword ptr [eax+0B0]
 005C2912    xor         edx,edx
 005C2914    call        TIdSocketHandles.GetItem
 005C2919    mov         edx,dword ptr [ebp-4]
 005C291C    mov         dword ptr [edx+0B4],eax
 005C2922    mov         eax,dword ptr [ebp-4]
 005C2925    mov         si,0FFF0
 005C2929    call        @CallDynaInst
 005C292E    mov         eax,dword ptr [ebp-4]
 005C2931    mov         ebx,dword ptr [eax+0B4]
 005C2937    xor         eax,eax
 005C2939    pop         edx
 005C293A    pop         ecx
 005C293B    pop         ecx
 005C293C    mov         dword ptr fs:[eax],edx
 005C293F    push        5C2954
 005C2944    lea         eax,[ebp-0C]
 005C2947    call        @UStrClr
 005C294C    ret
>005C294D    jmp         @HandleFinally
>005C2952    jmp         005C2944
 005C2954    mov         eax,ebx
 005C2956    pop         edi
 005C2957    pop         esi
 005C2958    pop         ebx
 005C2959    mov         esp,ebp
 005C295B    pop         ebp
 005C295C    ret
*}
end;

//005C2984
function TIdUDPServer.GetDefaultPort:TIdPort;
begin
{*
 005C2984    mov         eax,dword ptr [eax+0B0]
 005C298A    movzx       eax,word ptr [eax+1C]
 005C298E    ret
*}
end;

//005C2990
procedure TIdUDPServer.InitComponent;
begin
{*
 005C2990    push        ebx
 005C2991    mov         ebx,eax
 005C2993    mov         eax,ebx
 005C2995    call        TIdUDPBase.InitComponent
 005C299A    mov         ecx,ebx
 005C299C    mov         dl,1
 005C299E    mov         eax,[005AB0B0];TIdSocketHandles
 005C29A3    call        TIdSocketHandles.Create
 005C29A8    mov         dword ptr [ebx+0B0],eax
 005C29AE    mov         dl,1
 005C29B0    mov         eax,[00439D58];TThreadList
 005C29B5    call        TThreadList.Create
 005C29BA    mov         dword ptr [ebx+0B8],eax
 005C29C0    mov         eax,[005C1D0C];TIdUDPListenerThread
 005C29C5    mov         dword ptr [ebx+0BC],eax
 005C29CB    pop         ebx
 005C29CC    ret
*}
end;

//005C29D0
procedure TIdUDPServer.SetBindings(const Value:TIdSocketHandles);
begin
{*
 005C29D0    push        esi
 005C29D1    mov         esi,eax
 005C29D3    mov         eax,dword ptr [esi+0B0]
 005C29D9    mov         ecx,dword ptr [eax]
 005C29DB    call        dword ptr [ecx+8]
 005C29DE    pop         esi
 005C29DF    ret
*}
end;

//005C29E0
procedure TIdUDPServer.SetDefaultPort(const AValue:TIdPort);
begin
{*
 005C29E0    mov         eax,dword ptr [eax+0B0]
 005C29E6    mov         word ptr [eax+1C],dx
 005C29EA    ret
*}
end;

//005C29EC
procedure TIdUDPListenerThread.AfterRun;
begin
{*
 005C29EC    push        ebx
 005C29ED    mov         ebx,eax
 005C29EF    mov         eax,ebx
 005C29F1    call        TIdThread.AfterRun
 005C29F6    mov         eax,dword ptr [ebx+70]
 005C29F9    mov         edx,dword ptr [eax]
 005C29FB    call        dword ptr [edx+24]
 005C29FE    pop         ebx
 005C29FF    ret
*}
end;

//005C2A00
constructor TIdUDPListenerThread.Create(ABinding:TIdSocketHandle);
begin
{*
 005C2A00    push        ebp
 005C2A01    mov         ebp,esp
 005C2A03    push        ebx
 005C2A04    push        esi
 005C2A05    push        edi
 005C2A06    test        dl,dl
>005C2A08    je          005C2A12
 005C2A0A    add         esp,0FFFFFFF0
 005C2A0D    call        @ClassCreate
 005C2A12    mov         esi,ecx
 005C2A14    mov         ebx,edx
 005C2A16    mov         edi,eax
 005C2A18    push        1
 005C2A1A    push        0
 005C2A1C    mov         cl,1
 005C2A1E    xor         edx,edx
 005C2A20    mov         eax,edi
 005C2A22    call        TIdThread.Create
 005C2A27    mov         dword ptr [edi+74],3E8
 005C2A2E    mov         eax,dword ptr [ebp+8]
 005C2A31    mov         dword ptr [edi+70],eax
 005C2A34    mov         dword ptr [edi+88],esi
 005C2A3A    push        0
 005C2A3C    lea         eax,[edi+78]
 005C2A3F    mov         ecx,1
 005C2A44    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005C2A4A    call        @DynArraySetLength
 005C2A4F    add         esp,4
 005C2A52    mov         eax,edi
 005C2A54    test        bl,bl
>005C2A56    je          005C2A67
 005C2A58    call        @AfterConstruction
 005C2A5D    pop         dword ptr fs:[0]
 005C2A64    add         esp,0C
 005C2A67    mov         eax,edi
 005C2A69    pop         edi
 005C2A6A    pop         esi
 005C2A6B    pop         ebx
 005C2A6C    pop         ebp
 005C2A6D    ret         4
*}
end;

//005C2A70
destructor TIdUDPListenerThread.Destroy();
begin
{*
 005C2A70    push        ebx
 005C2A71    push        esi
 005C2A72    call        @BeforeDestruction
 005C2A77    mov         ebx,edx
 005C2A79    mov         esi,eax
 005C2A7B    push        0
 005C2A7D    lea         eax,[esi+78]
 005C2A80    mov         ecx,1
 005C2A85    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005C2A8B    call        @DynArraySetLength
 005C2A90    add         esp,4
 005C2A93    mov         edx,ebx
 005C2A95    and         dl,0FC
 005C2A98    mov         eax,esi
 005C2A9A    call        TIdThread.Destroy
 005C2A9F    test        bl,bl
>005C2AA1    jle         005C2AAA
 005C2AA3    mov         eax,esi
 005C2AA5    call        @ClassDestroy
 005C2AAA    pop         esi
 005C2AAB    pop         ebx
 005C2AAC    ret
*}
end;

//005C2AB0
procedure TIdUDPListenerThread.Run;
begin
{*
 005C2AB0    push        ebp
 005C2AB1    mov         ebp,esp
 005C2AB3    add         esp,0FFFFFFF4
 005C2AB6    push        ebx
 005C2AB7    push        esi
 005C2AB8    push        edi
 005C2AB9    xor         edx,edx
 005C2ABB    mov         dword ptr [ebp-4],edx
 005C2ABE    mov         dword ptr [ebp-8],eax
 005C2AC1    xor         eax,eax
 005C2AC3    push        ebp
 005C2AC4    push        5C2C2F
 005C2AC9    push        dword ptr fs:[eax]
 005C2ACC    mov         dword ptr fs:[eax],esp
 005C2ACF    mov         eax,dword ptr [ebp-8]
 005C2AD2    mov         edx,dword ptr [eax+74]
 005C2AD5    mov         eax,dword ptr [ebp-8]
 005C2AD8    mov         eax,dword ptr [eax+70]
 005C2ADB    call        TIdSocketHandle.Select
 005C2AE0    test        al,al
>005C2AE2    je          005C2C19
 005C2AE8    xor         edx,edx
 005C2AEA    push        ebp
 005C2AEB    push        5C2BB9
 005C2AF0    push        dword ptr fs:[edx]
 005C2AF3    mov         dword ptr fs:[edx],esp
 005C2AF6    mov         eax,dword ptr [ebp-8]
 005C2AF9    call        TIdThread.GetStopped
 005C2AFE    test        al,al
>005C2B00    jne         005C2BAF
 005C2B06    mov         eax,dword ptr [ebp-8]
 005C2B09    mov         eax,dword ptr [eax+88]
 005C2B0F    mov         eax,dword ptr [eax+94]
 005C2B15    push        eax
 005C2B16    mov         eax,dword ptr [ebp-8]
 005C2B19    add         eax,78
 005C2B1C    mov         ecx,1
 005C2B21    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005C2B27    call        @DynArraySetLength
 005C2B2C    add         esp,4
 005C2B2F    lea         eax,[ebp-0A]
 005C2B32    push        eax
 005C2B33    lea         eax,[ebp-0B]
 005C2B36    push        eax
 005C2B37    lea         ecx,[ebp-4]
 005C2B3A    mov         eax,dword ptr [ebp-8]
 005C2B3D    lea         edx,[eax+78]
 005C2B40    mov         eax,dword ptr [ebp-8]
 005C2B43    mov         eax,dword ptr [eax+70]
 005C2B46    call        TIdSocketHandle.RecvFrom
 005C2B4B    mov         ebx,eax
 005C2B4D    movzx       eax,byte ptr [ebp-0B]
 005C2B51    push        eax
 005C2B52    mov         eax,dword ptr [ebp-8]
 005C2B55    mov         eax,dword ptr [eax+70]
 005C2B58    movzx       ecx,word ptr [ebp-0A]
 005C2B5C    mov         edx,dword ptr [ebp-4]
 005C2B5F    call        TIdSocketHandle.SetPeer
 005C2B64    test        ebx,ebx
>005C2B66    jle         005C2BAF
 005C2B68    push        ebx
 005C2B69    mov         eax,dword ptr [ebp-8]
 005C2B6C    add         eax,78
 005C2B6F    mov         ecx,1
 005C2B74    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 005C2B7A    call        @DynArraySetLength
 005C2B7F    add         esp,4
 005C2B82    mov         eax,dword ptr [ebp-8]
 005C2B85    mov         eax,dword ptr [eax+88]
 005C2B8B    cmp         byte ptr [eax+0C0],0
>005C2B92    je          005C2B9E
 005C2B94    mov         eax,dword ptr [ebp-8]
 005C2B97    call        TIdUDPListenerThread.UDPRead
>005C2B9C    jmp         005C2BAF
 005C2B9E    mov         eax,dword ptr [ebp-8]
 005C2BA1    push        eax
 005C2BA2    push        5C2C40;TIdUDPListenerThread.UDPRead
 005C2BA7    mov         eax,dword ptr [ebp-8]
 005C2BAA    call        TIdThread.Synchronize
 005C2BAF    xor         eax,eax
 005C2BB1    pop         edx
 005C2BB2    pop         ecx
 005C2BB3    pop         ecx
 005C2BB4    mov         dword ptr fs:[eax],edx
>005C2BB7    jmp         005C2C19
>005C2BB9    jmp         @HandleOnException
 005C2BBE    dd          1
 005C2BC2    dd          00418C04;Exception
 005C2BC6    dd          005C2BCA
 005C2BCA    mov         ebx,eax
 005C2BCC    mov         eax,dword ptr [ebp-8]
 005C2BCF    add         eax,7C
 005C2BD2    mov         edx,dword ptr [ebx+4]
 005C2BD5    call        @UStrAsg
 005C2BDA    mov         edx,dword ptr [ebx]
 005C2BDC    mov         eax,edx
 005C2BDE    mov         edx,dword ptr [ebp-8]
 005C2BE1    mov         dword ptr [edx+80],eax
 005C2BE7    mov         eax,dword ptr [ebp-8]
 005C2BEA    mov         eax,dword ptr [eax+88]
 005C2BF0    cmp         byte ptr [eax+0C0],0
>005C2BF7    je          005C2C03
 005C2BF9    mov         eax,dword ptr [ebp-8]
 005C2BFC    call        TIdUDPListenerThread.UDPException
>005C2C01    jmp         005C2C14
 005C2C03    mov         eax,dword ptr [ebp-8]
 005C2C06    push        eax
 005C2C07    push        5C2C5C;TIdUDPListenerThread.UDPException
 005C2C0C    mov         eax,dword ptr [ebp-8]
 005C2C0F    call        TIdThread.Synchronize
 005C2C14    call        @DoneExcept
 005C2C19    xor         eax,eax
 005C2C1B    pop         edx
 005C2C1C    pop         ecx
 005C2C1D    pop         ecx
 005C2C1E    mov         dword ptr fs:[eax],edx
 005C2C21    push        5C2C36
 005C2C26    lea         eax,[ebp-4]
 005C2C29    call        @UStrClr
 005C2C2E    ret
>005C2C2F    jmp         @HandleFinally
>005C2C34    jmp         005C2C26
 005C2C36    pop         edi
 005C2C37    pop         esi
 005C2C38    pop         ebx
 005C2C39    mov         esp,ebp
 005C2C3B    pop         ebp
 005C2C3C    ret
*}
end;

//005C2C40
procedure TIdUDPListenerThread.UDPRead;
begin
{*
 005C2C40    push        ebx
 005C2C41    mov         edx,dword ptr [eax+70]
 005C2C44    push        edx
 005C2C45    mov         ecx,dword ptr [eax+78]
 005C2C48    mov         edx,eax
 005C2C4A    mov         eax,dword ptr [eax+88]
 005C2C50    mov         ebx,dword ptr [eax]
 005C2C52    call        dword ptr [ebx+88]
 005C2C58    pop         ebx
 005C2C59    ret
*}
end;

//005C2C5C
procedure TIdUDPListenerThread.UDPException;
begin
{*
 005C2C5C    push        ebx
 005C2C5D    mov         edx,dword ptr [eax+7C]
 005C2C60    push        edx
 005C2C61    mov         edx,dword ptr [eax+80]
 005C2C67    push        edx
 005C2C68    mov         ecx,dword ptr [eax+70]
 005C2C6B    mov         edx,eax
 005C2C6D    mov         eax,dword ptr [eax+88]
 005C2C73    mov         ebx,dword ptr [eax]
 005C2C75    call        dword ptr [ebx+84]
 005C2C7B    pop         ebx
 005C2C7C    ret
*}
end;

//005C2C90
{*function P5DLL.P5_GetCount:?;
begin
 005C2C90    jmp         dword ptr ds:[8268E8]
end;*}

//005C2C98
{*function P5DLL.P5_GetStatePointer:?;
begin
 005C2C98    jmp         dword ptr ds:[8268E4]
end;*}

//005C2CA0
{*function P5DLL.P5_GetInfoPointer:?;
begin
 005C2CA0    jmp         dword ptr ds:[8268E0]
end;*}

//005C2CA8
{*function P5DLL.P5_GetMouseState:?;
begin
 005C2CA8    jmp         dword ptr ds:[8268DC]
end;*}

//005C33A0
function d3d9.Direct3DCreate9:IDirect3D9; stdcall;
begin
{*
 005C33A0    jmp         dword ptr ds:[8268F8]
*}
end;

//005C33A8
{*procedure sub_005C33A8(?:?; ?:?);
begin
 005C33A8    push        ebp
 005C33A9    mov         ebp,esp
 005C33AB    push        ebx
 005C33AC    mov         ebx,dword ptr [ebp+8]
 005C33AF    mov         eax,dword ptr [ebp+0C]
 005C33B2    push        eax
 005C33B3    call        d3d9.Direct3DCreate9
 005C33B8    mov         edx,eax
 005C33BA    mov         eax,ebx
 005C33BC    call        @IntfCopy
 005C33C1    cmp         dword ptr [ebx],0
>005C33C4    je          005C33CE
 005C33C6    mov         eax,dword ptr [ebx]
 005C33C8    push        eax
 005C33C9    mov         eax,dword ptr [eax]
 005C33CB    call        dword ptr [eax+8]
 005C33CE    pop         ebx
 005C33CF    pop         ebp
 005C33D0    ret         8
end;*}

//005C34E8
{*procedure sub_005C34E8(?:?; ?:?);
begin
 005C34E8    push        ebx
 005C34E9    push        esi
 005C34EA    push        edi
 005C34EB    add         esp,0FFFFFFB0
 005C34EE    mov         esi,eax
 005C34F0    lea         edi,[esp+8]
 005C34F4    mov         ecx,12
 005C34F9    rep movs    dword ptr [edi],dword ptr [esi]
 005C34FB    mov         esi,edx
 005C34FD    mov         eax,esi
 005C34FF    xor         ecx,ecx
 005C3501    mov         edx,40
 005C3506    call        @FillChar
 005C350B    mov         dword ptr [esi+3C],3F800000
 005C3512    mov         ebx,3
 005C3517    lea         eax,[esp+8]
 005C351B    mov         dword ptr [esp],eax
 005C351E    mov         dword ptr [esp+4],esi
 005C3522    mov         ecx,3
 005C3527    mov         eax,dword ptr [esp]
 005C352A    mov         edx,dword ptr [esp+4]
 005C352E    fld         qword ptr [eax]
 005C3530    fstp        dword ptr [edx]
 005C3532    wait
 005C3533    add         edx,4
 005C3536    add         eax,8
 005C3539    dec         ecx
>005C353A    jne         005C352E
 005C353C    add         dword ptr [esp+4],10
 005C3541    add         dword ptr [esp],18
 005C3545    dec         ebx
>005C3546    jne         005C3522
 005C3548    add         esp,50
 005C354B    pop         edi
 005C354C    pop         esi
 005C354D    pop         ebx
 005C354E    ret
end;*}

//005C3550
{*procedure sub_005C3550(?:?; ?:Double; ?:Double; ?:?);
begin
 005C3550    push        ebp
 005C3551    mov         ebp,esp
 005C3553    add         esp,0FFFFFFE8
 005C3556    push        ebx
 005C3557    push        esi
 005C3558    push        edi
 005C3559    mov         esi,ecx
 005C355B    mov         edi,edx
 005C355D    mov         ebx,eax
 005C355F    push        dword ptr [ebx+3C]
 005C3562    push        dword ptr [ebx+38]
 005C3565    call        00454A5C
 005C356A    fstp        qword ptr [esi]
 005C356C    wait
 005C356D    fld         qword ptr [esi]
 005C356F    add         esp,0FFFFFFF4
 005C3572    fstp        tbyte ptr [esp]
 005C3575    wait
 005C3576    call        Cos
 005C357B    fstp        qword ptr [ebp-18]
 005C357E    wait
 005C357F    fld         qword ptr [esi]
 005C3581    fmul        dword ptr ds:[5C360C];180:Single
 005C3587    fld         tbyte ptr ds:[5C3610];3.14159265358979:Extended
 005C358D    fdivp       st(1),st
 005C358F    fstp        qword ptr [esi]
 005C3591    wait
 005C3592    fld         qword ptr [ebx+30]
 005C3595    fdiv        qword ptr [ebp-18]
 005C3598    fstp        qword ptr [ebp-8]
 005C359B    wait
 005C359C    fld         qword ptr [ebx+40]
 005C359F    fdiv        qword ptr [ebp-18]
 005C35A2    fstp        qword ptr [ebp-10]
 005C35A5    wait
 005C35A6    push        dword ptr [ebp-4]
 005C35A9    push        dword ptr [ebp-8]
 005C35AC    push        dword ptr [ebp-0C]
 005C35AF    push        dword ptr [ebp-10]
 005C35B2    call        00454A9C
 005C35B7    fmul        dword ptr ds:[5C360C];180:Single
 005C35BD    fld         tbyte ptr ds:[5C3610];3.14159265358979:Extended
 005C35C3    fdivp       st(1),st
 005C35C5    fstp        qword ptr [edi]
 005C35C7    wait
 005C35C8    fld         qword ptr [ebx+8]
 005C35CB    fchs
 005C35CD    fdiv        qword ptr [ebp-18]
 005C35D0    fstp        qword ptr [ebp-8]
 005C35D3    wait
 005C35D4    fld         qword ptr [ebx+20]
 005C35D7    fdiv        qword ptr [ebp-18]
 005C35DA    fstp        qword ptr [ebp-10]
 005C35DD    wait
 005C35DE    push        dword ptr [ebp-4]
 005C35E1    push        dword ptr [ebp-8]
 005C35E4    push        dword ptr [ebp-0C]
 005C35E7    push        dword ptr [ebp-10]
 005C35EA    call        00454A9C
 005C35EF    fmul        dword ptr ds:[5C360C];180:Single
 005C35F5    fld         tbyte ptr ds:[5C3610];3.14159265358979:Extended
 005C35FB    fdivp       st(1),st
 005C35FD    mov         eax,dword ptr [ebp+8]
 005C3600    fstp        qword ptr [eax]
 005C3602    wait
 005C3603    pop         edi
 005C3604    pop         esi
 005C3605    pop         ebx
 005C3606    mov         esp,ebp
 005C3608    pop         ebp
 005C3609    ret         4
end;*}

//005C361C
{*procedure sub_005C361C(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 005C361C    push        ebp
 005C361D    mov         ebp,esp
 005C361F    add         esp,0FFFFFFB8
 005C3622    push        ebx
 005C3623    mov         ebx,eax
 005C3625    fld         tbyte ptr ds:[5C3774];0.0174532925199433:Extended
 005C362B    fmul        qword ptr [ebp+18]
 005C362E    fstp        qword ptr [ebp-38]
 005C3631    wait
 005C3632    mov         eax,dword ptr [ebp-38]
 005C3635    mov         dword ptr [ebp+18],eax
 005C3638    mov         eax,dword ptr [ebp-34]
 005C363B    mov         dword ptr [ebp+1C],eax
 005C363E    fld         tbyte ptr ds:[5C3774];0.0174532925199433:Extended
 005C3644    fmul        qword ptr [ebp+10]
 005C3647    fstp        qword ptr [ebp-40]
 005C364A    wait
 005C364B    mov         eax,dword ptr [ebp-40]
 005C364E    mov         dword ptr [ebp+10],eax
 005C3651    mov         eax,dword ptr [ebp-3C]
 005C3654    mov         dword ptr [ebp+14],eax
 005C3657    fld         tbyte ptr ds:[5C3774];0.0174532925199433:Extended
 005C365D    fmul        qword ptr [ebp+8]
 005C3660    fstp        qword ptr [ebp-48]
 005C3663    wait
 005C3664    mov         eax,dword ptr [ebp-48]
 005C3667    mov         dword ptr [ebp+8],eax
 005C366A    mov         eax,dword ptr [ebp-44]
 005C366D    mov         dword ptr [ebp+0C],eax
 005C3670    fld         qword ptr [ebp+8]
 005C3673    add         esp,0FFFFFFF4
 005C3676    fstp        tbyte ptr [esp]
 005C3679    wait
 005C367A    call        Sin
 005C367F    fstp        qword ptr [ebp-8]
 005C3682    wait
 005C3683    fld         qword ptr [ebp+8]
 005C3686    add         esp,0FFFFFFF4
 005C3689    fstp        tbyte ptr [esp]
 005C368C    wait
 005C368D    call        Cos
 005C3692    fstp        qword ptr [ebp-20]
 005C3695    wait
 005C3696    fld         qword ptr [ebp+10]
 005C3699    add         esp,0FFFFFFF4
 005C369C    fstp        tbyte ptr [esp]
 005C369F    wait
 005C36A0    call        Sin
 005C36A5    fstp        qword ptr [ebp-10]
 005C36A8    wait
 005C36A9    fld         qword ptr [ebp+10]
 005C36AC    add         esp,0FFFFFFF4
 005C36AF    fstp        tbyte ptr [esp]
 005C36B2    wait
 005C36B3    call        Cos
 005C36B8    fstp        qword ptr [ebp-28]
 005C36BB    wait
 005C36BC    fld         qword ptr [ebp+18]
 005C36BF    add         esp,0FFFFFFF4
 005C36C2    fstp        tbyte ptr [esp]
 005C36C5    wait
 005C36C6    call        Sin
 005C36CB    fstp        qword ptr [ebp-18]
 005C36CE    wait
 005C36CF    fld         qword ptr [ebp+18]
 005C36D2    add         esp,0FFFFFFF4
 005C36D5    fstp        tbyte ptr [esp]
 005C36D8    wait
 005C36D9    call        Cos
 005C36DE    fstp        qword ptr [ebp-30]
 005C36E1    wait
 005C36E2    fld         qword ptr [ebp-20]
 005C36E5    fmul        qword ptr [ebp-30]
 005C36E8    fld         qword ptr [ebp-8]
 005C36EB    fmul        qword ptr [ebp-10]
 005C36EE    fmul        qword ptr [ebp-18]
 005C36F1    faddp       st(1),st
 005C36F3    fstp        qword ptr [ebx]
 005C36F5    wait
 005C36F6    fld         qword ptr [ebp-8]
 005C36F9    fchs
 005C36FB    fmul        qword ptr [ebp-28]
 005C36FE    fstp        qword ptr [ebx+8]
 005C3701    wait
 005C3702    fld         qword ptr [ebp-30]
 005C3705    fmul        qword ptr [ebp-8]
 005C3708    fmul        qword ptr [ebp-10]
 005C370B    fld         qword ptr [ebp-18]
 005C370E    fmul        qword ptr [ebp-20]
 005C3711    fsubp       st(1),st
 005C3713    fstp        qword ptr [ebx+10]
 005C3716    wait
 005C3717    fld         qword ptr [ebp-8]
 005C371A    fmul        qword ptr [ebp-30]
 005C371D    fld         qword ptr [ebp-10]
 005C3720    fmul        qword ptr [ebp-20]
 005C3723    fmul        qword ptr [ebp-18]
 005C3726    fsubp       st(1),st
 005C3728    fstp        qword ptr [ebx+18]
 005C372B    wait
 005C372C    fld         qword ptr [ebp-20]
 005C372F    fmul        qword ptr [ebp-28]
 005C3732    fstp        qword ptr [ebx+20]
 005C3735    wait
 005C3736    fld         qword ptr [ebp-8]
 005C3739    fchs
 005C373B    fmul        qword ptr [ebp-18]
 005C373E    fld         qword ptr [ebp-10]
 005C3741    fmul        qword ptr [ebp-20]
 005C3744    fmul        qword ptr [ebp-30]
 005C3747    fsubp       st(1),st
 005C3749    fstp        qword ptr [ebx+28]
 005C374C    wait
 005C374D    fld         qword ptr [ebp-28]
 005C3750    fmul        qword ptr [ebp-18]
 005C3753    fstp        qword ptr [ebx+30]
 005C3756    wait
 005C3757    mov         eax,dword ptr [ebp-10]
 005C375A    mov         dword ptr [ebx+38],eax
 005C375D    mov         eax,dword ptr [ebp-0C]
 005C3760    mov         dword ptr [ebx+3C],eax
 005C3763    fld         qword ptr [ebp-28]
 005C3766    fmul        qword ptr [ebp-30]
 005C3769    fstp        qword ptr [ebx+40]
 005C376C    wait
 005C376D    pop         ebx
 005C376E    mov         esp,ebp
 005C3770    pop         ebp
 005C3771    ret         18
end;*}

//005C3780
{*function sub_005C3780(?:?):?;
begin
 005C3780    push        ebx
 005C3781    add         esp,0FFFFFFE0
 005C3784    mov         ebx,eax
 005C3786    fld         qword ptr [ebx]
 005C3788    fmul        st,st(0)
 005C378A    fstp        tbyte ptr [esp+8]
 005C378E    wait
 005C378F    fld         qword ptr [ebx+8]
 005C3792    fmul        st,st(0)
 005C3794    fld         tbyte ptr [esp+8]
 005C3798    faddp       st(1),st
 005C379A    fstp        tbyte ptr [esp+14]
 005C379E    wait
 005C379F    fld         qword ptr [ebx+10]
 005C37A2    fmul        st,st(0)
 005C37A4    fld         tbyte ptr [esp+14]
 005C37A8    faddp       st(1),st
 005C37AA    add         esp,0FFFFFFF4
 005C37AD    fstp        tbyte ptr [esp]
 005C37B0    wait
 005C37B1    call        Sqrt
 005C37B6    fstp        qword ptr [esp]
 005C37B9    wait
 005C37BA    fld         qword ptr [esp]
 005C37BD    add         esp,20
 005C37C0    pop         ebx
 005C37C1    ret
end;*}

//005C37C4
{*procedure sub_005C37C4(?:?; ?:?);
begin
 005C37C4    push        ebx
 005C37C5    push        esi
 005C37C6    push        edi
 005C37C7    add         esp,0FFFFFFDC
 005C37CA    mov         ebx,edx
 005C37CC    mov         ecx,eax
 005C37CE    mov         eax,ecx
 005C37D0    mov         esi,3
 005C37D5    cdq
 005C37D6    idiv        eax,esi
 005C37D8    dec         edx
 005C37D9    mov         dword ptr [esp+20],edx
 005C37DD    fild        dword ptr [esp+20]
 005C37E1    fstp        qword ptr [esp+8]
 005C37E5    wait
 005C37E6    mov         eax,ecx
 005C37E8    mov         esi,3
 005C37ED    cdq
 005C37EE    idiv        eax,esi
 005C37F0    mov         esi,3
 005C37F5    cdq
 005C37F6    idiv        eax,esi
 005C37F8    dec         edx
 005C37F9    mov         dword ptr [esp+20],edx
 005C37FD    fild        dword ptr [esp+20]
 005C3801    fstp        qword ptr [esp+10]
 005C3805    wait
 005C3806    mov         eax,ecx
 005C3808    mov         ecx,9
 005C380D    cdq
 005C380E    idiv        eax,ecx
 005C3810    mov         ecx,3
 005C3815    cdq
 005C3816    idiv        eax,ecx
 005C3818    dec         edx
 005C3819    mov         dword ptr [esp+20],edx
 005C381D    fild        dword ptr [esp+20]
 005C3821    fstp        qword ptr [esp+18]
 005C3825    wait
 005C3826    lea         eax,[esp+8]
 005C382A    call        005C3780
 005C382F    fstp        qword ptr [esp]
 005C3832    wait
 005C3833    fld         qword ptr [esp]
 005C3836    fcomp       dword ptr ds:[5C387C];0:Single
 005C383C    wait
 005C383D    fnstsw      al
 005C383F    sahf
>005C3840    je          005C3866
 005C3842    fld         qword ptr [esp+8]
 005C3846    fdiv        qword ptr [esp]
 005C3849    fstp        qword ptr [esp+8]
 005C384D    wait
 005C384E    fld         qword ptr [esp+10]
 005C3852    fdiv        qword ptr [esp]
 005C3855    fstp        qword ptr [esp+10]
 005C3859    wait
 005C385A    fld         qword ptr [esp+18]
 005C385E    fdiv        qword ptr [esp]
 005C3861    fstp        qword ptr [esp+18]
 005C3865    wait
 005C3866    mov         edi,ebx
 005C3868    lea         esi,[esp+8]
 005C386C    mov         ecx,6
 005C3871    rep movs    dword ptr [edi],dword ptr [esi]
 005C3873    add         esp,24
 005C3876    pop         edi
 005C3877    pop         esi
 005C3878    pop         ebx
 005C3879    ret
end;*}

//005C3880
{*function sub_005C3880(?:?; ?:?):?;
begin
 005C3880    add         esp,0FFFFFFF0
 005C3883    fld         qword ptr [eax]
 005C3885    fmul        qword ptr [edx]
 005C3887    fld         qword ptr [eax+8]
 005C388A    fmul        qword ptr [edx+8]
 005C388D    faddp       st(1),st
 005C388F    fld         qword ptr [eax+10]
 005C3892    fmul        qword ptr [edx+10]
 005C3895    faddp       st(1),st
 005C3897    fstp        qword ptr [esp+8]
 005C389B    wait
 005C389C    fld         qword ptr [esp+8]
 005C38A0    fcomp       dword ptr ds:[5C38F4];-1:Single
 005C38A6    wait
 005C38A7    fnstsw      al
 005C38A9    sahf
>005C38AA    jb          005C38DF
 005C38AC    fld         qword ptr [esp+8]
 005C38B0    fcomp       dword ptr ds:[5C38F8];1:Single
 005C38B6    wait
 005C38B7    fnstsw      al
 005C38B9    sahf
>005C38BA    ja          005C38DF
 005C38BC    push        dword ptr [esp+0C]
 005C38C0    push        dword ptr [esp+0C]
 005C38C4    call        00454A28
 005C38C9    fabs
 005C38CB    fmul        dword ptr ds:[5C38FC];180:Single
 005C38D1    fld         tbyte ptr ds:[5C3900];3.14159265358979:Extended
 005C38D7    fdivp       st(1),st
 005C38D9    fstp        qword ptr [esp]
 005C38DC    wait
>005C38DD    jmp         005C38EC
 005C38DF    xor         eax,eax
 005C38E1    mov         dword ptr [esp],eax
 005C38E4    mov         dword ptr [esp+4],40668000
 005C38EC    fld         qword ptr [esp]
 005C38EF    add         esp,10
 005C38F2    ret
end;*}

//005C390C
{*function sub_005C390C(?:?):?;
begin
 005C390C    push        ebx
 005C390D    push        esi
 005C390E    push        edi
 005C390F    push        ebp
 005C3910    add         esp,0FFFFFFB4
 005C3913    mov         esi,eax
 005C3915    lea         edi,[esp+18]
 005C3919    mov         ecx,6
 005C391E    rep movs    dword ptr [edi],dword ptr [esi]
 005C3920    lea         eax,[esp+18]
 005C3924    call        005C3780
 005C3929    fcomp       dword ptr ds:[5C3A24];0:Single
 005C392F    wait
 005C3930    fnstsw      al
 005C3932    sahf
>005C3933    jne         005C393F
 005C3935    mov         eax,0D
>005C393A    jmp         005C3A1C
 005C393F    xor         eax,eax
 005C3941    mov         dword ptr [esp+10],eax
 005C3945    mov         dword ptr [esp+14],408F4000
 005C394D    mov         dword ptr [esp],0D
 005C3954    or          ebp,0FFFFFFFF
 005C3957    mov         dword ptr [esp+48],ebp
 005C395B    fild        dword ptr [esp+48]
 005C395F    fmul        qword ptr [esp+18]
 005C3963    fcomp       dword ptr ds:[5C3A24];0:Single
 005C3969    wait
 005C396A    fnstsw      al
 005C396C    sahf
>005C396D    jb          005C3A0F
 005C3973    or          esi,0FFFFFFFF
 005C3976    mov         dword ptr [esp+48],esi
 005C397A    fild        dword ptr [esp+48]
 005C397E    fmul        qword ptr [esp+18]
 005C3982    fcomp       dword ptr ds:[5C3A24];0:Single
 005C3988    wait
 005C3989    fnstsw      al
 005C398B    sahf
>005C398C    jb          005C3A05
 005C398E    or          ebx,0FFFFFFFF
 005C3991    mov         dword ptr [esp+48],ebx
 005C3995    fild        dword ptr [esp+48]
 005C3999    fmul        qword ptr [esp+18]
 005C399D    fcomp       dword ptr ds:[5C3A24];0:Single
 005C39A3    wait
 005C39A4    fnstsw      al
 005C39A6    sahf
>005C39A7    jb          005C39FF
 005C39A9    lea         edi,[ebp+1]
 005C39AC    lea         eax,[esi+1]
 005C39AF    lea         eax,[eax+eax*2]
 005C39B2    add         edi,eax
 005C39B4    lea         eax,[ebx+1]
 005C39B7    lea         eax,[eax+eax*8]
 005C39BA    add         edi,eax
 005C39BC    cmp         edi,0D
>005C39BF    je          005C39FF
 005C39C1    lea         edx,[esp+30]
 005C39C5    mov         eax,edi
 005C39C7    call        005C37C4
 005C39CC    lea         edx,[esp+30]
 005C39D0    lea         eax,[esp+18]
 005C39D4    call        005C3880
 005C39D9    fstp        qword ptr [esp+8]
 005C39DD    wait
 005C39DE    fld         qword ptr [esp+8]
 005C39E2    fcomp       qword ptr [esp+10]
 005C39E6    wait
 005C39E7    fnstsw      al
 005C39E9    sahf
>005C39EA    jae         005C39FF
 005C39EC    mov         eax,dword ptr [esp+8]
 005C39F0    mov         dword ptr [esp+10],eax
 005C39F4    mov         eax,dword ptr [esp+0C]
 005C39F8    mov         dword ptr [esp+14],eax
 005C39FC    mov         dword ptr [esp],edi
 005C39FF    inc         ebx
 005C3A00    cmp         ebx,2
>005C3A03    jne         005C3991
 005C3A05    inc         esi
 005C3A06    cmp         esi,2
>005C3A09    jne         005C3976
 005C3A0F    inc         ebp
 005C3A10    cmp         ebp,2
>005C3A13    jne         005C3957
 005C3A19    mov         eax,dword ptr [esp]
 005C3A1C    add         esp,4C
 005C3A1F    pop         ebp
 005C3A20    pop         edi
 005C3A21    pop         esi
 005C3A22    pop         ebx
 005C3A23    ret
end;*}

//005C3A28
{*procedure sub_005C3A28(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 005C3A28    push        ebp
 005C3A29    mov         ebp,esp
 005C3A2B    add         esp,0FFFFFFB8
 005C3A2E    push        ebx
 005C3A2F    mov         ebx,eax
 005C3A31    fld         tbyte ptr ds:[5C3B7C];0.0174532925199433:Extended
 005C3A37    fmul        qword ptr [ebp+18]
 005C3A3A    fstp        qword ptr [ebp-38]
 005C3A3D    wait
 005C3A3E    mov         eax,dword ptr [ebp-38]
 005C3A41    mov         dword ptr [ebp+18],eax
 005C3A44    mov         eax,dword ptr [ebp-34]
 005C3A47    mov         dword ptr [ebp+1C],eax
 005C3A4A    fld         tbyte ptr ds:[5C3B7C];0.0174532925199433:Extended
 005C3A50    fmul        qword ptr [ebp+10]
 005C3A53    fstp        qword ptr [ebp-40]
 005C3A56    wait
 005C3A57    mov         eax,dword ptr [ebp-40]
 005C3A5A    mov         dword ptr [ebp+10],eax
 005C3A5D    mov         eax,dword ptr [ebp-3C]
 005C3A60    mov         dword ptr [ebp+14],eax
 005C3A63    fld         tbyte ptr ds:[5C3B7C];0.0174532925199433:Extended
 005C3A69    fmul        qword ptr [ebp+8]
 005C3A6C    fstp        qword ptr [ebp-48]
 005C3A6F    wait
 005C3A70    mov         eax,dword ptr [ebp-48]
 005C3A73    mov         dword ptr [ebp+8],eax
 005C3A76    mov         eax,dword ptr [ebp-44]
 005C3A79    mov         dword ptr [ebp+0C],eax
 005C3A7C    fld         qword ptr [ebp+8]
 005C3A7F    add         esp,0FFFFFFF4
 005C3A82    fstp        tbyte ptr [esp]
 005C3A85    wait
 005C3A86    call        Sin
 005C3A8B    fstp        qword ptr [ebp-8]
 005C3A8E    wait
 005C3A8F    fld         qword ptr [ebp+8]
 005C3A92    add         esp,0FFFFFFF4
 005C3A95    fstp        tbyte ptr [esp]
 005C3A98    wait
 005C3A99    call        Cos
 005C3A9E    fstp        qword ptr [ebp-20]
 005C3AA1    wait
 005C3AA2    fld         qword ptr [ebp+10]
 005C3AA5    add         esp,0FFFFFFF4
 005C3AA8    fstp        tbyte ptr [esp]
 005C3AAB    wait
 005C3AAC    call        Sin
 005C3AB1    fstp        qword ptr [ebp-10]
 005C3AB4    wait
 005C3AB5    fld         qword ptr [ebp+10]
 005C3AB8    add         esp,0FFFFFFF4
 005C3ABB    fstp        tbyte ptr [esp]
 005C3ABE    wait
 005C3ABF    call        Cos
 005C3AC4    fstp        qword ptr [ebp-28]
 005C3AC7    wait
 005C3AC8    fld         qword ptr [ebp+18]
 005C3ACB    add         esp,0FFFFFFF4
 005C3ACE    fstp        tbyte ptr [esp]
 005C3AD1    wait
 005C3AD2    call        Sin
 005C3AD7    fstp        qword ptr [ebp-18]
 005C3ADA    wait
 005C3ADB    fld         qword ptr [ebp+18]
 005C3ADE    add         esp,0FFFFFFF4
 005C3AE1    fstp        tbyte ptr [esp]
 005C3AE4    wait
 005C3AE5    call        Cos
 005C3AEA    fstp        qword ptr [ebp-30]
 005C3AED    wait
 005C3AEE    fld         qword ptr [ebp-20]
 005C3AF1    fmul        qword ptr [ebp-30]
 005C3AF4    fld         qword ptr [ebp-8]
 005C3AF7    fmul        qword ptr [ebp-10]
 005C3AFA    fmul        qword ptr [ebp-18]
 005C3AFD    faddp       st(1),st
 005C3AFF    fstp        qword ptr [ebx]
 005C3B01    wait
 005C3B02    fld         qword ptr [ebp-8]
 005C3B05    fmul        qword ptr [ebp-28]
 005C3B08    fstp        qword ptr [ebx+8]
 005C3B0B    wait
 005C3B0C    fld         qword ptr [ebp-30]
 005C3B0F    fmul        qword ptr [ebp-8]
 005C3B12    fmul        qword ptr [ebp-10]
 005C3B15    fld         qword ptr [ebp-20]
 005C3B18    fmul        qword ptr [ebp-18]
 005C3B1B    fsubp       st(1),st
 005C3B1D    fstp        qword ptr [ebx+10]
 005C3B20    wait
 005C3B21    fld         qword ptr [ebp-20]
 005C3B24    fmul        qword ptr [ebp-10]
 005C3B27    fmul        qword ptr [ebp-18]
 005C3B2A    fld         qword ptr [ebp-30]
 005C3B2D    fmul        qword ptr [ebp-8]
 005C3B30    fsubp       st(1),st
 005C3B32    fstp        qword ptr [ebx+18]
 005C3B35    wait
 005C3B36    fld         qword ptr [ebp-20]
 005C3B39    fmul        qword ptr [ebp-28]
 005C3B3C    fstp        qword ptr [ebx+20]
 005C3B3F    wait
 005C3B40    fld         qword ptr [ebp-8]
 005C3B43    fmul        qword ptr [ebp-18]
 005C3B46    fld         qword ptr [ebp-20]
 005C3B49    fmul        qword ptr [ebp-10]
 005C3B4C    fmul        qword ptr [ebp-30]
 005C3B4F    faddp       st(1),st
 005C3B51    fstp        qword ptr [ebx+28]
 005C3B54    wait
 005C3B55    fld         qword ptr [ebp-28]
 005C3B58    fmul        qword ptr [ebp-18]
 005C3B5B    fstp        qword ptr [ebx+30]
 005C3B5E    wait
 005C3B5F    fld         qword ptr [ebp-10]
 005C3B62    fchs
 005C3B64    fstp        qword ptr [ebx+38]
 005C3B67    wait
 005C3B68    fld         qword ptr [ebp-28]
 005C3B6B    fmul        qword ptr [ebp-30]
 005C3B6E    fstp        qword ptr [ebx+40]
 005C3B71    wait
 005C3B72    pop         ebx
 005C3B73    mov         esp,ebp
 005C3B75    pop         ebp
 005C3B76    ret         18
end;*}

//005C3B88
{*function sub_005C3B88(?:?):?;
begin
 005C3B88    push        esi
 005C3B89    push        edi
 005C3B8A    add         esp,0FFFFFFB0
 005C3B8D    mov         esi,eax
 005C3B8F    lea         edi,[esp+8]
 005C3B93    mov         ecx,12
 005C3B98    rep movs    dword ptr [edi],dword ptr [esi]
 005C3B9A    lea         eax,[esp+8]
 005C3B9E    fld         qword ptr [eax]
 005C3BA0    fmul        qword ptr [eax+20]
 005C3BA3    fmul        qword ptr [eax+40]
 005C3BA6    fld         qword ptr [eax+8]
 005C3BA9    fmul        qword ptr [eax+28]
 005C3BAC    fmul        qword ptr [eax+30]
 005C3BAF    faddp       st(1),st
 005C3BB1    fld         qword ptr [eax+10]
 005C3BB4    fmul        qword ptr [eax+18]
 005C3BB7    fmul        qword ptr [eax+38]
 005C3BBA    faddp       st(1),st
 005C3BBC    fld         qword ptr [eax]
 005C3BBE    fmul        qword ptr [eax+28]
 005C3BC1    fmul        qword ptr [eax+38]
 005C3BC4    fsubp       st(1),st
 005C3BC6    fld         qword ptr [eax+8]
 005C3BC9    fmul        qword ptr [eax+18]
 005C3BCC    fmul        qword ptr [eax+40]
 005C3BCF    fsubp       st(1),st
 005C3BD1    fld         qword ptr [eax+10]
 005C3BD4    fmul        qword ptr [eax+20]
 005C3BD7    fmul        qword ptr [eax+30]
 005C3BDA    fsubp       st(1),st
 005C3BDC    fstp        qword ptr [esp]
 005C3BDF    wait
 005C3BE0    fld         qword ptr [esp]
 005C3BE3    add         esp,50
 005C3BE6    pop         edi
 005C3BE7    pop         esi
 005C3BE8    ret
end;*}

//005C3BEC
{*procedure sub_005C3BEC(?:?);
begin
 005C3BEC    push        ebx
 005C3BED    push        esi
 005C3BEE    push        edi
 005C3BEF    push        ecx
 005C3BF0    xor         esi,esi
 005C3BF2    mov         edi,eax
 005C3BF4    xor         ecx,ecx
 005C3BF6    mov         edx,edi
 005C3BF8    cmp         ecx,esi
 005C3BFA    sete        bl
 005C3BFD    movsx       ebx,bl
 005C3C00    mov         dword ptr [esp],ebx
 005C3C03    fild        dword ptr [esp]
 005C3C06    fstp        qword ptr [edx]
 005C3C08    wait
 005C3C09    inc         ecx
 005C3C0A    add         edx,8
 005C3C0D    cmp         ecx,3
>005C3C10    jne         005C3BF8
 005C3C12    inc         esi
 005C3C13    add         edi,18
 005C3C16    cmp         esi,3
>005C3C19    jne         005C3BF4
 005C3C1B    pop         edx
 005C3C1C    pop         edi
 005C3C1D    pop         esi
 005C3C1E    pop         ebx
 005C3C1F    ret
end;*}

//005C3C20
{*function sub_005C3C20(?:?; ?:?; ?:?; ?:?):?;
begin
 005C3C20    push        ebp
 005C3C21    mov         ebp,esp
 005C3C23    add         esp,0FFFFFF60
 005C3C29    push        ebx
 005C3C2A    push        esi
 005C3C2B    push        edi
 005C3C2C    mov         esi,edx
 005C3C2E    lea         edi,[ebp-0A0]
 005C3C34    mov         ecx,12
 005C3C39    rep movs    dword ptr [edi],dword ptr [esi]
 005C3C3B    mov         esi,eax
 005C3C3D    lea         edi,[ebp-58]
 005C3C40    mov         ecx,12
 005C3C45    rep movs    dword ptr [edi],dword ptr [esi]
 005C3C47    mov         byte ptr [ebp-1],0
 005C3C4B    mov         dword ptr [ebp-8],3
 005C3C52    lea         eax,[ebp-58]
 005C3C55    mov         dword ptr [ebp-0C],eax
 005C3C58    lea         eax,[ebp-0A0]
 005C3C5E    mov         dword ptr [ebp-10],eax
 005C3C61    mov         edi,3
 005C3C66    mov         eax,dword ptr [ebp-0C]
 005C3C69    mov         ebx,eax
 005C3C6B    mov         eax,dword ptr [ebp-10]
 005C3C6E    mov         esi,eax
 005C3C70    push        dword ptr [ebx+4]
 005C3C73    push        dword ptr [ebx]
 005C3C75    push        dword ptr [esi+4]
 005C3C78    push        dword ptr [esi]
 005C3C7A    push        dword ptr [ebp+0C]
 005C3C7D    push        dword ptr [ebp+8]
 005C3C80    call        004553E8
 005C3C85    test        al,al
>005C3C87    je          005C3CA3
 005C3C89    add         esi,8
 005C3C8C    add         ebx,8
 005C3C8F    dec         edi
>005C3C90    jne         005C3C70
 005C3C92    add         dword ptr [ebp-10],18
 005C3C96    add         dword ptr [ebp-0C],18
 005C3C9A    dec         dword ptr [ebp-8]
>005C3C9D    jne         005C3C61
 005C3C9F    mov         byte ptr [ebp-1],1
 005C3CA3    movzx       eax,byte ptr [ebp-1]
 005C3CA7    pop         edi
 005C3CA8    pop         esi
 005C3CA9    pop         ebx
 005C3CAA    mov         esp,ebp
 005C3CAC    pop         ebp
 005C3CAD    ret         8
end;*}

//005C3CB0
{*procedure sub_005C3CB0(?:TRotMat; ?:TRotMat; ?:?);
begin
 005C3CB0    push        ebx
 005C3CB1    push        esi
 005C3CB2    push        edi
 005C3CB3    add         esp,0FFFFFF68
 005C3CB9    mov         esi,ecx
 005C3CBB    lea         edi,[esp+50]
 005C3CBF    mov         ecx,12
 005C3CC4    rep movs    dword ptr [edi],dword ptr [esi]
 005C3CC6    mov         esi,edx
 005C3CC8    lea         edi,[esp+8]
 005C3CCC    mov         ecx,12
 005C3CD1    rep movs    dword ptr [edi],dword ptr [esi]
 005C3CD3    mov         dword ptr [esp],eax
 005C3CD6    mov         esi,3
 005C3CDB    lea         ecx,[esp+8]
 005C3CDF    mov         eax,dword ptr [esp]
 005C3CE2    mov         edi,3
 005C3CE7    lea         edx,[esp+50]
 005C3CEB    mov         ebx,eax
 005C3CED    fld         qword ptr [ecx]
 005C3CEF    fmul        qword ptr [edx]
 005C3CF1    fld         qword ptr [ecx+8]
 005C3CF4    fmul        qword ptr [edx+18]
 005C3CF7    faddp       st(1),st
 005C3CF9    fld         qword ptr [ecx+10]
 005C3CFC    fmul        qword ptr [edx+30]
 005C3CFF    faddp       st(1),st
 005C3D01    fstp        qword ptr [ebx]
 005C3D03    wait
 005C3D04    add         ebx,8
 005C3D07    add         edx,8
 005C3D0A    dec         edi
>005C3D0B    jne         005C3CED
 005C3D0D    add         eax,18
 005C3D10    add         ecx,18
 005C3D13    dec         esi
>005C3D14    jne         005C3CE2
 005C3D16    add         esp,98
 005C3D1C    pop         edi
 005C3D1D    pop         esi
 005C3D1E    pop         ebx
 005C3D1F    ret
end;*}

//005C3D20
{*procedure sub_005C3D20(?:TRotMat; ?:TRotMat; ?:?);
begin
 005C3D20    push        ebx
 005C3D21    push        esi
 005C3D22    push        edi
 005C3D23    add         esp,0FFFFFF68
 005C3D29    mov         esi,ecx
 005C3D2B    lea         edi,[esp+50]
 005C3D2F    mov         ecx,12
 005C3D34    rep movs    dword ptr [edi],dword ptr [esi]
 005C3D36    mov         esi,edx
 005C3D38    lea         edi,[esp+8]
 005C3D3C    mov         ecx,12
 005C3D41    rep movs    dword ptr [edi],dword ptr [esi]
 005C3D43    mov         dword ptr [esp],eax
 005C3D46    mov         esi,3
 005C3D4B    lea         ecx,[esp+8]
 005C3D4F    mov         eax,dword ptr [esp]
 005C3D52    mov         edi,3
 005C3D57    lea         edx,[esp+50]
 005C3D5B    mov         ebx,eax
 005C3D5D    fld         qword ptr [ecx]
 005C3D5F    fmul        qword ptr [edx]
 005C3D61    fld         qword ptr [ecx+8]
 005C3D64    fmul        qword ptr [edx+8]
 005C3D67    faddp       st(1),st
 005C3D69    fld         qword ptr [ecx+10]
 005C3D6C    fmul        qword ptr [edx+10]
 005C3D6F    faddp       st(1),st
 005C3D71    fstp        qword ptr [ebx]
 005C3D73    wait
 005C3D74    add         ebx,8
 005C3D77    add         edx,18
 005C3D7A    dec         edi
>005C3D7B    jne         005C3D5D
 005C3D7D    add         eax,18
 005C3D80    add         ecx,18
 005C3D83    dec         esi
>005C3D84    jne         005C3D52
 005C3D86    add         esp,98
 005C3D8C    pop         edi
 005C3D8D    pop         esi
 005C3D8E    pop         ebx
 005C3D8F    ret
end;*}

//005C3D90
{*procedure sub_005C3D90(?:?);
begin
 005C3D90    push        ebx
 005C3D91    add         esp,0FFFFFFD8
 005C3D94    mov         ebx,eax
 005C3D96    push        dword ptr [ebx+4]
 005C3D99    push        dword ptr [ebx]
 005C3D9B    push        dword ptr [ebx+0C]
 005C3D9E    push        dword ptr [ebx+8]
 005C3DA1    push        dword ptr [ebx+14]
 005C3DA4    push        dword ptr [ebx+10]
 005C3DA7    call        005C4070
 005C3DAC    fstp        qword ptr [esp]
 005C3DAF    wait
 005C3DB0    push        dword ptr [ebx+1C]
 005C3DB3    push        dword ptr [ebx+18]
 005C3DB6    push        dword ptr [ebx+24]
 005C3DB9    push        dword ptr [ebx+20]
 005C3DBC    push        dword ptr [ebx+2C]
 005C3DBF    push        dword ptr [ebx+28]
 005C3DC2    call        005C4070
 005C3DC7    fstp        qword ptr [esp+8]
 005C3DCB    wait
 005C3DCC    fld         qword ptr [esp]
 005C3DCF    fcomp       dword ptr ds:[5C3EC8];0:Single
 005C3DD5    wait
 005C3DD6    fnstsw      al
 005C3DD8    sahf
>005C3DD9    je          005C3DF9
 005C3DDB    fld         qword ptr [ebx]
 005C3DDD    fdiv        qword ptr [esp]
 005C3DE0    fstp        qword ptr [ebx]
 005C3DE2    wait
 005C3DE3    fld         qword ptr [ebx+8]
 005C3DE6    fdiv        qword ptr [esp]
 005C3DE9    fstp        qword ptr [ebx+8]
 005C3DEC    wait
 005C3DED    fld         qword ptr [ebx+10]
 005C3DF0    fdiv        qword ptr [esp]
 005C3DF3    fstp        qword ptr [ebx+10]
 005C3DF6    wait
>005C3DF7    jmp         005C3E14
 005C3DF9    xor         eax,eax
 005C3DFB    mov         dword ptr [ebx],eax
 005C3DFD    mov         dword ptr [ebx+4],3FF00000
 005C3E04    xor         eax,eax
 005C3E06    mov         dword ptr [ebx+8],eax
 005C3E09    mov         dword ptr [ebx+0C],eax
 005C3E0C    xor         eax,eax
 005C3E0E    mov         dword ptr [ebx+10],eax
 005C3E11    mov         dword ptr [ebx+14],eax
 005C3E14    fld         qword ptr [esp+8]
 005C3E18    fcomp       dword ptr ds:[5C3EC8];0:Single
 005C3E1E    wait
 005C3E1F    fnstsw      al
 005C3E21    sahf
>005C3E22    je          005C3E47
 005C3E24    fld         qword ptr [ebx+18]
 005C3E27    fdiv        qword ptr [esp+8]
 005C3E2B    fstp        qword ptr [ebx+18]
 005C3E2E    wait
 005C3E2F    fld         qword ptr [ebx+20]
 005C3E32    fdiv        qword ptr [esp+8]
 005C3E36    fstp        qword ptr [ebx+20]
 005C3E39    wait
 005C3E3A    fld         qword ptr [ebx+28]
 005C3E3D    fdiv        qword ptr [esp+8]
 005C3E41    fstp        qword ptr [ebx+28]
 005C3E44    wait
>005C3E45    jmp         005C3E63
 005C3E47    xor         eax,eax
 005C3E49    mov         dword ptr [ebx+18],eax
 005C3E4C    mov         dword ptr [ebx+1C],eax
 005C3E4F    xor         eax,eax
 005C3E51    mov         dword ptr [ebx+20],eax
 005C3E54    mov         dword ptr [ebx+24],3FF00000
 005C3E5B    xor         eax,eax
 005C3E5D    mov         dword ptr [ebx+28],eax
 005C3E60    mov         dword ptr [ebx+2C],eax
 005C3E63    push        dword ptr [ebx+4]
 005C3E66    push        dword ptr [ebx]
 005C3E68    push        dword ptr [ebx+0C]
 005C3E6B    push        dword ptr [ebx+8]
 005C3E6E    push        dword ptr [ebx+14]
 005C3E71    push        dword ptr [ebx+10]
 005C3E74    push        dword ptr [ebx+1C]
 005C3E77    push        dword ptr [ebx+18]
 005C3E7A    push        dword ptr [ebx+24]
 005C3E7D    push        dword ptr [ebx+20]
 005C3E80    push        dword ptr [ebx+2C]
 005C3E83    push        dword ptr [ebx+28]
 005C3E86    lea         ecx,[esp+50]
 005C3E8A    lea         edx,[esp+48]
 005C3E8E    lea         eax,[esp+40]
 005C3E92    call        005C3FA4
 005C3E97    mov         eax,dword ptr [esp+10]
 005C3E9B    mov         dword ptr [ebx+30],eax
 005C3E9E    mov         eax,dword ptr [esp+14]
 005C3EA2    mov         dword ptr [ebx+34],eax
 005C3EA5    mov         eax,dword ptr [esp+18]
 005C3EA9    mov         dword ptr [ebx+38],eax
 005C3EAC    mov         eax,dword ptr [esp+1C]
 005C3EB0    mov         dword ptr [ebx+3C],eax
 005C3EB3    mov         eax,dword ptr [esp+20]
 005C3EB7    mov         dword ptr [ebx+40],eax
 005C3EBA    mov         eax,dword ptr [esp+24]
 005C3EBE    mov         dword ptr [ebx+44],eax
 005C3EC1    add         esp,28
 005C3EC4    pop         ebx
 005C3EC5    ret
end;*}

//005C3ECC
{*procedure sub_005C3ECC(?:?; ?:?; ?:?; ?:?);
begin
 005C3ECC    push        ebp
 005C3ECD    mov         ebp,esp
 005C3ECF    add         esp,0FFFFFFB8
 005C3ED2    push        esi
 005C3ED3    push        edi
 005C3ED4    mov         esi,dword ptr [ebp+8]
 005C3ED7    lea         edi,[ebp-48]
 005C3EDA    push        ecx
 005C3EDB    mov         ecx,12
 005C3EE0    rep movs    dword ptr [edi],dword ptr [esi]
 005C3EE2    pop         ecx
 005C3EE3    fld         qword ptr [ebp-48]
 005C3EE6    fmul        qword ptr [ebp+1C]
 005C3EE9    fld         qword ptr [ebp-30]
 005C3EEC    fmul        qword ptr [ebp+14]
 005C3EEF    faddp       st(1),st
 005C3EF1    fld         qword ptr [ebp-18]
 005C3EF4    fmul        qword ptr [ebp+0C]
 005C3EF7    faddp       st(1),st
 005C3EF9    fstp        qword ptr [eax]
 005C3EFB    wait
 005C3EFC    fld         qword ptr [ebp-40]
 005C3EFF    fmul        qword ptr [ebp+1C]
 005C3F02    fld         qword ptr [ebp-28]
 005C3F05    fmul        qword ptr [ebp+14]
 005C3F08    faddp       st(1),st
 005C3F0A    fld         qword ptr [ebp-10]
 005C3F0D    fmul        qword ptr [ebp+0C]
 005C3F10    faddp       st(1),st
 005C3F12    fstp        qword ptr [edx]
 005C3F14    wait
 005C3F15    fld         qword ptr [ebp-38]
 005C3F18    fmul        qword ptr [ebp+1C]
 005C3F1B    fld         qword ptr [ebp-20]
 005C3F1E    fmul        qword ptr [ebp+14]
 005C3F21    faddp       st(1),st
 005C3F23    fld         qword ptr [ebp-8]
 005C3F26    fmul        qword ptr [ebp+0C]
 005C3F29    faddp       st(1),st
 005C3F2B    fstp        qword ptr [ecx]
 005C3F2D    wait
 005C3F2E    pop         edi
 005C3F2F    pop         esi
 005C3F30    mov         esp,ebp
 005C3F32    pop         ebp
 005C3F33    ret         1C
end;*}

//005C3F38
{*procedure sub_005C3F38(?:?; ?:?; ?:?; ?:?);
begin
 005C3F38    push        ebp
 005C3F39    mov         ebp,esp
 005C3F3B    add         esp,0FFFFFFB8
 005C3F3E    push        esi
 005C3F3F    push        edi
 005C3F40    mov         esi,dword ptr [ebp+8]
 005C3F43    lea         edi,[ebp-48]
 005C3F46    push        ecx
 005C3F47    mov         ecx,12
 005C3F4C    rep movs    dword ptr [edi],dword ptr [esi]
 005C3F4E    pop         ecx
 005C3F4F    fld         qword ptr [ebp-48]
 005C3F52    fmul        qword ptr [ebp+1C]
 005C3F55    fld         qword ptr [ebp-40]
 005C3F58    fmul        qword ptr [ebp+14]
 005C3F5B    faddp       st(1),st
 005C3F5D    fld         qword ptr [ebp-38]
 005C3F60    fmul        qword ptr [ebp+0C]
 005C3F63    faddp       st(1),st
 005C3F65    fstp        qword ptr [eax]
 005C3F67    wait
 005C3F68    fld         qword ptr [ebp-30]
 005C3F6B    fmul        qword ptr [ebp+1C]
 005C3F6E    fld         qword ptr [ebp-28]
 005C3F71    fmul        qword ptr [ebp+14]
 005C3F74    faddp       st(1),st
 005C3F76    fld         qword ptr [ebp-20]
 005C3F79    fmul        qword ptr [ebp+0C]
 005C3F7C    faddp       st(1),st
 005C3F7E    fstp        qword ptr [edx]
 005C3F80    wait
 005C3F81    fld         qword ptr [ebp-18]
 005C3F84    fmul        qword ptr [ebp+1C]
 005C3F87    fld         qword ptr [ebp-10]
 005C3F8A    fmul        qword ptr [ebp+14]
 005C3F8D    faddp       st(1),st
 005C3F8F    fld         qword ptr [ebp-8]
 005C3F92    fmul        qword ptr [ebp+0C]
 005C3F95    faddp       st(1),st
 005C3F97    fstp        qword ptr [ecx]
 005C3F99    wait
 005C3F9A    pop         edi
 005C3F9B    pop         esi
 005C3F9C    mov         esp,ebp
 005C3F9E    pop         ebp
 005C3F9F    ret         1C
end;*}

//005C3FA4
{*procedure sub_005C3FA4(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 005C3FA4    push        ebp
 005C3FA5    mov         ebp,esp
 005C3FA7    fld         qword ptr [ebp+28]
 005C3FAA    fmul        qword ptr [ebp+8]
 005C3FAD    fld         qword ptr [ebp+10]
 005C3FB0    fmul        qword ptr [ebp+20]
 005C3FB3    fsubp       st(1),st
 005C3FB5    fstp        qword ptr [eax]
 005C3FB7    wait
 005C3FB8    fld         qword ptr [ebp+20]
 005C3FBB    fmul        qword ptr [ebp+18]
 005C3FBE    fld         qword ptr [ebp+8]
 005C3FC1    fmul        qword ptr [ebp+30]
 005C3FC4    fsubp       st(1),st
 005C3FC6    fstp        qword ptr [edx]
 005C3FC8    wait
 005C3FC9    fld         qword ptr [ebp+30]
 005C3FCC    fmul        qword ptr [ebp+10]
 005C3FCF    fld         qword ptr [ebp+18]
 005C3FD2    fmul        qword ptr [ebp+28]
 005C3FD5    fsubp       st(1),st
 005C3FD7    fstp        qword ptr [ecx]
 005C3FD9    wait
 005C3FDA    pop         ebp
 005C3FDB    ret         30
end;*}

//005C3FE0
{*procedure sub_005C3FE0(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 005C3FE0    push        ebp
 005C3FE1    mov         ebp,esp
 005C3FE3    add         esp,0FFFFFFF8
 005C3FE6    push        ebx
 005C3FE7    push        esi
 005C3FE8    push        edi
 005C3FE9    mov         edi,ecx
 005C3FEB    mov         esi,edx
 005C3FED    mov         ebx,eax
 005C3FEF    fld         qword ptr [ebp+28]
 005C3FF2    fmul        qword ptr [ebp+8]
 005C3FF5    fld         qword ptr [ebp+10]
 005C3FF8    fmul        qword ptr [ebp+20]
 005C3FFB    fsubp       st(1),st
 005C3FFD    fstp        qword ptr [ebx]
 005C3FFF    wait
 005C4000    fld         qword ptr [ebp+20]
 005C4003    fmul        qword ptr [ebp+18]
 005C4006    fld         qword ptr [ebp+8]
 005C4009    fmul        qword ptr [ebp+30]
 005C400C    fsubp       st(1),st
 005C400E    fstp        qword ptr [esi]
 005C4010    wait
 005C4011    fld         qword ptr [ebp+30]
 005C4014    fmul        qword ptr [ebp+10]
 005C4017    fld         qword ptr [ebp+18]
 005C401A    fmul        qword ptr [ebp+28]
 005C401D    fsubp       st(1),st
 005C401F    fstp        qword ptr [edi]
 005C4021    wait
 005C4022    push        dword ptr [ebx+4]
 005C4025    push        dword ptr [ebx]
 005C4027    push        dword ptr [esi+4]
 005C402A    push        dword ptr [esi]
 005C402C    push        dword ptr [edi+4]
 005C402F    push        dword ptr [edi]
 005C4031    call        005C4070
 005C4036    fstp        qword ptr [ebp-8]
 005C4039    wait
 005C403A    fld         qword ptr [ebp-8]
 005C403D    fcomp       dword ptr ds:[5C406C];0:Single
 005C4043    wait
 005C4044    fnstsw      al
 005C4046    sahf
>005C4047    je          005C4061
 005C4049    fld         qword ptr [ebx]
 005C404B    fdiv        qword ptr [ebp-8]
 005C404E    fstp        qword ptr [ebx]
 005C4050    wait
 005C4051    fld         qword ptr [esi]
 005C4053    fdiv        qword ptr [ebp-8]
 005C4056    fstp        qword ptr [esi]
 005C4058    wait
 005C4059    fld         qword ptr [edi]
 005C405B    fdiv        qword ptr [ebp-8]
 005C405E    fstp        qword ptr [edi]
 005C4060    wait
 005C4061    pop         edi
 005C4062    pop         esi
 005C4063    pop         ebx
 005C4064    pop         ecx
 005C4065    pop         ecx
 005C4066    pop         ebp
 005C4067    ret         30
end;*}

//005C4070
{*function sub_005C4070(?:?; ?:?; ?:?):?;
begin
 005C4070    push        ebp
 005C4071    mov         ebp,esp
 005C4073    add         esp,0FFFFFFE0
 005C4076    fld         qword ptr [ebp+18]
 005C4079    fmul        st,st(0)
 005C407B    fstp        tbyte ptr [ebp-14]
 005C407E    wait
 005C407F    fld         qword ptr [ebp+10]
 005C4082    fmul        st,st(0)
 005C4084    fld         tbyte ptr [ebp-14]
 005C4087    faddp       st(1),st
 005C4089    fstp        tbyte ptr [ebp-20]
 005C408C    wait
 005C408D    fld         qword ptr [ebp+8]
 005C4090    fmul        st,st(0)
 005C4092    fld         tbyte ptr [ebp-20]
 005C4095    faddp       st(1),st
 005C4097    add         esp,0FFFFFFF4
 005C409A    fstp        tbyte ptr [esp]
 005C409D    wait
 005C409E    call        Sqrt
 005C40A3    fstp        qword ptr [ebp-8]
 005C40A6    wait
 005C40A7    fld         qword ptr [ebp-8]
 005C40AA    mov         esp,ebp
 005C40AC    pop         ebp
 005C40AD    ret         18
end;*}

//005C40B0
{*procedure sub_005C40B0(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 005C40B0    push        ebp
 005C40B1    mov         ebp,esp
 005C40B3    mov         edx,eax
 005C40B5    fld         qword ptr [ebp+8]
 005C40B8    fcomp       dword ptr ds:[5C4100];0:Single
 005C40BE    wait
 005C40BF    fnstsw      al
 005C40C1    sahf
>005C40C2    jne         005C40CD
 005C40C4    mov         eax,edx
 005C40C6    call        005C3BEC
>005C40CB    jmp         005C40FB
 005C40CD    fld         qword ptr [ebp+20]
 005C40D0    fmul        qword ptr [ebp+8]
 005C40D3    add         esp,0FFFFFFF8
 005C40D6    fstp        qword ptr [esp]
 005C40D9    wait
 005C40DA    fld         qword ptr [ebp+18]
 005C40DD    fmul        qword ptr [ebp+8]
 005C40E0    add         esp,0FFFFFFF8
 005C40E3    fstp        qword ptr [esp]
 005C40E6    wait
 005C40E7    fld         qword ptr [ebp+10]
 005C40EA    fmul        qword ptr [ebp+8]
 005C40ED    add         esp,0FFFFFFF8
 005C40F0    fstp        qword ptr [esp]
 005C40F3    wait
 005C40F4    mov         eax,edx
 005C40F6    call        005C361C
 005C40FB    pop         ebp
 005C40FC    ret         20
end;*}

Initialization
Finalization
//005C4104
{*
 005C4104    push        ebp
 005C4105    mov         ebp,esp
 005C4107    xor         eax,eax
 005C4109    push        ebp
 005C410A    push        5C41A9
 005C410F    push        dword ptr fs:[eax]
 005C4112    mov         dword ptr fs:[eax],esp
 005C4115    inc         dword ptr ds:[8155D8]
>005C411B    jne         005C419B
 005C411D    mov         eax,789F18;^'Left'
 005C4122    mov         ecx,3
 005C4127    mov         edx,dword ptr ds:[40128C];string
 005C412D    call        @FinalizeArray
 005C4132    mov         eax,789F24;^'Down'
 005C4137    mov         ecx,3
 005C413C    mov         edx,dword ptr ds:[40128C];string
 005C4142    call        @FinalizeArray
 005C4147    mov         eax,789F30;^'Back'
 005C414C    mov         ecx,3
 005C4151    mov         edx,dword ptr ds:[40128C];string
 005C4157    call        @FinalizeArray
 005C415C    mov         eax,789F3C;^'L'
 005C4161    mov         ecx,3
 005C4166    mov         edx,dword ptr ds:[40128C];string
 005C416C    call        @FinalizeArray
 005C4171    mov         eax,789F48;^'D'
 005C4176    mov         ecx,3
 005C417B    mov         edx,dword ptr ds:[40128C];string
 005C4181    call        @FinalizeArray
 005C4186    mov         eax,789F54;^'B'
 005C418B    mov         ecx,3
 005C4190    mov         edx,dword ptr ds:[40128C];string
 005C4196    call        @FinalizeArray
 005C419B    xor         eax,eax
 005C419D    pop         edx
 005C419E    pop         ecx
 005C419F    pop         ecx
 005C41A0    mov         dword ptr fs:[eax],edx
 005C41A3    push        5C41B0
 005C41A8    ret
>005C41A9    jmp         @HandleFinally
>005C41AE    jmp         005C41A8
 005C41B0    pop         ebp
 005C41B1    ret
*}
end.