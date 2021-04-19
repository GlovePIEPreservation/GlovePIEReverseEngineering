//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit147;

interface

uses
  SysUtils, Classes, SYNCTRLLib_TLB, PieTouchpad;

type
  TSynAPICtrlOnNotify = procedure(ASender:TObject; eReason:TOleEnum) of object;;
  TSynAPICtrl = class(TOleControl)
  published
    procedure Activate;//0070D3FC
    procedure HardwareBroadcast(lAction:Integer);//0070D3A8
    procedure PersistState(lStateFlags:Integer);//0070D44C
    procedure Deactivate;//0070D4F4
    procedure RestoreState(lStateFlags:Integer);//0070D4A0
    function FindDevice(eConnectionType:TOleEnum; eDeviceType:TOleEnum; lLast:Integer):Integer;//0070D218
    procedure Initialize;//0070D1C8
    function GetLongProperty(eProperty:TOleEnum):Integer;//0070D288
    //procedure GetStringProperty(eProperty:TOleEnum; ?:?);//0070D348
    procedure SetLongProperty(eProperty:TOleEnum; newVal:Integer);//0070D2EC
  public
    FOnNotify:TSynAPICtrlOnNotify;//f2F0
    FIntf:ISynAPICtrl;//f2F8
    procedure vF4; virtual;//vF4//0070D0E8
  end;
  TSynPacketCtrl = class(TOleControl)
  published
    procedure Copy(pFrom:ISynPacketCtrl);//0070D6D4
    procedure SetLongProperty(eProperty:TOleEnum; newVal:Integer);//0070D678
    function GetLongProperty(eProperty:TOleEnum):Integer;//0070D614
  public
    FIntf:ISynPacketCtrl;//f2F0
    procedure vF4; virtual;//vF4//0070D544
  end;
  TSynDeviceCtrl = class(TOleControl)
  published
    function GetLongPropertyDefault(eProperty:TOleEnum):Integer;//0070DBDC
    procedure BulkTransaction(ulWriteLength:Integer; var write:PSafeArray; var read:PSafeArray; ulReadLength:Integer);//0070DC40
    procedure Activate;//0070DB3C
    procedure Deactivate;//0070DB8C
    procedure SetAddressableProperty(eProperty:TOleEnum; lAddress:Integer; newVal:Integer);//0070DD74
    procedure ForceMotionWithWheel(lDeltaX:Integer; lDeltaY:Integer; lDeltaWheel:Integer; lButtonState:Integer);//0070DDD4
    procedure DiagnosticTransaction(ulWriteLength:Integer; var write:PSafeArray; var read:PSafeArray; ulReadLength:Integer);//0070DCA4
    function GetAddressableProperty(eProperty:TOleEnum; lAddress:Integer):Integer;//0070DD08
    procedure Unacquire;//0070DAEC
    procedure SetLongProperty(eProperty:TOleEnum; newVal:Integer);//0070D8C4
    //procedure GetStringProperty(eProperty:TOleEnum; ?:?);//0070D920
    procedure Select(lDeviceHandle:Integer);//0070D80C
    function GetLongProperty(eProperty:TOleEnum):Integer;//0070D860
    procedure ForcePacket(pPacket:ISynPacketCtrl);//0070DA44
    procedure Acquire(lFlags:Integer);//0070DA98
    function LoadPacket(pPacket:ISynPacketCtrl):Integer;//0070D980
    procedure ForceMotion(lDeltaX:Integer; lDeltaY:Integer; lButtonState:Integer);//0070D9E4
  public
    FOnPacket:TNotifyEvent;//f2F0
    f2F4:TTouchPadController;//f2F4
    FIntf:ISynDeviceCtrl;//f2F8
    procedure vF4; virtual;//vF4//0070D72C
  end;
  TSynDisplayCtrlOnMessage = procedure(ASender:TObject; eMessage:TOleEnum) of object;;
  TSynDisplayCtrl = class(TOleControl)
  published
    procedure SendPicture(pVal:IDispatch);//0070E124
    procedure Unacquire;//0070E0D4
    procedure Deactivate;//0070E1C8
    procedure Activate;//0070E178
    procedure Acquire(eMethod:TOleEnum);//0070E080
    procedure SetLongProperty(eProperty:TOleEnum; newVal:Integer);//0070DF7C
    function GetLongProperty(eProperty:TOleEnum):Integer;//0070DF18
    procedure Flush(eMethod:TOleEnum);//0070E02C
    procedure Select(lDeviceHandle:Integer);//0070DFD8
  public
    FOnMessage:TSynDisplayCtrlOnMessage;//f2F0
    FIntf:ISynDisplayCtrl;//f2F8
    procedure vF4; virtual;//vF4//0070DE38
  end;
  TTouchPadController = class(TObject)
  published
    destructor Destroy();//0070EF04
    constructor Create(AOwner:TWinControl);//0070ED2C
    procedure DoPacket(Sender:TObject);//0070EF58
  public
    DeviceHandle:Integer;//f4
    ZTouchThreshold:Integer;//f8
    Xmin:Integer;//fC
    Xmax:Integer;//f10
    Ymin:Integer;//f14
    Ymax:Integer;//f18
    Exists:Boolean;//f1C
    Touching:Boolean;//f1D
    Swallowed:Boolean;//f1E
    LMB:Boolean;//f1F
    RMB:Boolean;//f20
    MMB:Boolean;//f21
    x:Integer;//f24
    y:Integer;//f28
    z:Integer;//f2C
    w:Integer;//f30
    zx:Integer;//f34
    zy:Integer;//f38
    xraw:Integer;//f3C
    yraw:Integer;//f40
    zraw:Integer;//f44
    FingerState:Integer;//f48
    ButtonState:Integer;//f4C
    ExtendedState:Integer;//f50
    fx:Double;//f58
    fy:Double;//f60
    SynAPICtrl1:TSynAPICtrl;//f68
    SynDeviceCtrl1:TSynDeviceCtrl;//f6C
    SynDisplayCtrl1:TSynDisplayCtrl;//f70
    SynPacketCtrl1:TSynPacketCtrl;//f74
  end;
  TTouchpadValue = class(TObjectValue)
  published
    function GetUnits:TUnits;//0070F26C
    //procedure GetString(?:?);//0070F244
    procedure FillClone(c:TExpression);//0070F1DC
    function Module:TObject;//0070F5DC
    function GetPerUnits2:TUnits;//0070F234
    function GetPerUnits1:TUnits;//0070F224
    //function SetValue(NewValue:Double; ?:?):Boolean;//0070F5E4
    function CanSet:Boolean;//0070F1C8
    function GetDataType:TDataType;//0070F1FC
    procedure CreateClone;//0070F1CC
    procedure GetValue;//0070F27C
    //procedure ToString(?:?);//0070F794
  public
    ....................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//0070F794
    procedure GetValue; virtual;//v2C//0070F27C
    //procedure GetString(?:?); virtual;//v38//0070F244
    function GetDataType:TDataType; virtual;//v44//0070F1FC
    function GetUnits:TUnits; virtual;//v48//0070F26C
    function GetPerUnits1:TUnits; virtual;//v4C//0070F224
    function GetPerUnits2:TUnits; virtual;//v50//0070F234
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//0070F5E4
    function CanSet:Boolean; virtual;//v68//0070F1C8
    procedure CreateClone; virtual;//v80//0070F1CC
    procedure FillClone(c:TExpression); virtual;//v84//0070F1DC
    function Module:TObject; virtual;//v98//0070F5DC
  end;
  TModuleTouchpad = class(TPieModule)
  published
    function Read:Boolean;//00710190
    procedure ClearRead;//0070FE0C
    function CreateValue(Identifier:string):TExpression;//0070FE78
    function GetDefaultFormat(field:string):TGuiFormat;//0070FECC
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//00710174
    function GetGoodFields:TStringList;//0070FF28
    procedure StartCompiletime;//00710194
    procedure StopRuntime;//007101C8
    procedure StartRuntime;//007101A0
    procedure AddFields;//0070F87C
    constructor Create;//0070FE14
    procedure StopCompiletime;//007101B4
  public
    function CreateValue(Identifier:string):TExpression; virtual;//v14//0070FE78
    function GetGoodFields:TStringList; virtual;//v1C//0070FF28
    procedure AddFields; virtual;//v24//0070F87C
    procedure StartCompiletime; virtual;//v28//00710194
    procedure StopCompiletime; virtual;//v2C//007101B4
    procedure StartRuntime; virtual;//v30//007101A0
    procedure StopRuntime; virtual;//v34//007101C8
    procedure ClearRead; virtual;//v38//0070FE0C
    function Read:Boolean; virtual;//v3C//00710190
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//00710174
    function GetDefaultFormat(field:string):TGuiFormat; virtual;//v44//0070FECC
  end;
    procedure sub_0070D0E8;//0070D0E8
    //procedure sub_0070D104(?:?);//0070D104
    //procedure sub_0070D188(?:?);//0070D188
    //procedure sub_0070D1A8(?:TSynAPICtrl; ?:?);//0070D1A8
    procedure sub_0070D544;//0070D544
    //procedure sub_0070D550(?:?);//0070D550
    //procedure sub_0070D5D4(?:?);//0070D5D4
    //procedure sub_0070D5F4(?:TSynPacketCtrl; ?:?);//0070D5F4
    procedure sub_0070D72C;//0070D72C
    //procedure sub_0070D748(?:?);//0070D748
    //procedure sub_0070D7CC(?:?);//0070D7CC
    //procedure sub_0070D7EC(?:TSynDeviceCtrl; ?:?);//0070D7EC
    procedure sub_0070DE38;//0070DE38
    //procedure sub_0070DE54(?:?);//0070DE54
    //procedure sub_0070DED8(?:?);//0070DED8
    //procedure sub_0070DEF8(?:TSynDisplayCtrl; ?:?);//0070DEF8
    //function sub_0070F0D0(?:string):?;//0070F0D0
    procedure sub_0070F814;//0070F814
    procedure sub_0070F81C;//0070F81C
    //procedure sub_0070F820(?:?);//0070F820
    procedure sub_0070F854;//0070F854

implementation

//0070D0E8
procedure sub_0070D0E8;
begin
{*
 0070D0E8    mov         edx,78C410
 0070D0ED    mov         dword ptr [eax+270],edx;TSynAPICtrl.FControlData:PControlData
 0070D0F3    lea         edx,[eax+2F0];TSynAPICtrl.FOnNotify:TSynAPICtrlOnNotify
 0070D0F9    sub         edx,eax
 0070D0FB    mov         dword ptr ds:[78C460],edx;gvar_0078C460
 0070D101    ret
*}
end;

//0070D104
{*procedure sub_0070D104(?:?);
begin
 0070D104    push        ebp
 0070D105    mov         ebp,esp
 0070D107    xor         ecx,ecx
 0070D109    push        ecx
 0070D10A    push        ecx
 0070D10B    push        ecx
 0070D10C    push        ecx
 0070D10D    push        ecx
 0070D10E    xor         eax,eax
 0070D110    push        ebp
 0070D111    push        70D16B
 0070D116    push        dword ptr fs:[eax]
 0070D119    mov         dword ptr fs:[eax],esp
 0070D11C    lea         edx,[ebp-14]
 0070D11F    mov         eax,dword ptr [ebp+8]
 0070D122    mov         eax,dword ptr [eax-4]
 0070D125    call        TOleControl.GetOleObject
 0070D12A    lea         edx,[ebp-14]
 0070D12D    lea         eax,[ebp-4]
 0070D130    call        @VarToIntf
 0070D135    mov         edx,dword ptr [ebp-4]
 0070D138    mov         eax,dword ptr [ebp+8]
 0070D13B    mov         eax,dword ptr [eax-4]
 0070D13E    add         eax,2F8
 0070D143    mov         ecx,70D178;['{5C66C161-9F39-42E2-A0E8-B0787560F058}']
 0070D148    call        @IntfCast
 0070D14D    xor         eax,eax
 0070D14F    pop         edx
 0070D150    pop         ecx
 0070D151    pop         ecx
 0070D152    mov         dword ptr fs:[eax],edx
 0070D155    push        70D172
 0070D15A    lea         eax,[ebp-14]
 0070D15D    call        @VarClr
 0070D162    lea         eax,[ebp-4]
 0070D165    call        @IntfClear
 0070D16A    ret
>0070D16B    jmp         @HandleFinally
>0070D170    jmp         0070D15A
 0070D172    mov         esp,ebp
 0070D174    pop         ebp
 0070D175    ret
end;*}

//0070D188
{*procedure sub_0070D188(?:?);
begin
 0070D188    push        ebp
 0070D189    mov         ebp,esp
 0070D18B    push        ecx
 0070D18C    mov         dword ptr [ebp-4],eax
 0070D18F    mov         eax,dword ptr [ebp-4]
 0070D192    cmp         dword ptr [eax+2F8],0
>0070D199    jne         0070D1A2
 0070D19B    push        ebp
 0070D19C    call        0070D104
 0070D1A1    pop         ecx
 0070D1A2    pop         ecx
 0070D1A3    pop         ebp
 0070D1A4    ret
end;*}

//0070D1A8
{*procedure sub_0070D1A8(?:TSynAPICtrl; ?:?);
begin
 0070D1A8    push        ebx
 0070D1A9    push        esi
 0070D1AA    mov         esi,edx
 0070D1AC    mov         ebx,eax
 0070D1AE    mov         eax,ebx
 0070D1B0    call        0070D188
 0070D1B5    mov         eax,esi
 0070D1B7    mov         edx,dword ptr [ebx+2F8]
 0070D1BD    call        @IntfCopy
 0070D1C2    pop         esi
 0070D1C3    pop         ebx
 0070D1C4    ret
end;*}

//0070D1C8
procedure TSynAPICtrl.Initialize;
begin
{*
 0070D1C8    push        ebp
 0070D1C9    mov         ebp,esp
 0070D1CB    push        0
 0070D1CD    push        ebx
 0070D1CE    mov         ebx,eax
 0070D1D0    xor         eax,eax
 0070D1D2    push        ebp
 0070D1D3    push        70D20C
 0070D1D8    push        dword ptr fs:[eax]
 0070D1DB    mov         dword ptr fs:[eax],esp
 0070D1DE    lea         edx,[ebp-4]
 0070D1E1    mov         eax,ebx
 0070D1E3    call        0070D1A8
 0070D1E8    mov         eax,dword ptr [ebp-4]
 0070D1EB    push        eax
 0070D1EC    mov         eax,dword ptr [eax]
 0070D1EE    call        dword ptr [eax+1C]
 0070D1F1    call        @CheckAutoResult
 0070D1F6    xor         eax,eax
 0070D1F8    pop         edx
 0070D1F9    pop         ecx
 0070D1FA    pop         ecx
 0070D1FB    mov         dword ptr fs:[eax],edx
 0070D1FE    push        70D213
 0070D203    lea         eax,[ebp-4]
 0070D206    call        @IntfClear
 0070D20B    ret
>0070D20C    jmp         @HandleFinally
>0070D211    jmp         0070D203
 0070D213    pop         ebx
 0070D214    pop         ecx
 0070D215    pop         ebp
 0070D216    ret
*}
end;

//0070D218
function TSynAPICtrl.FindDevice(eConnectionType:TOleEnum; eDeviceType:TOleEnum; lLast:Integer):Integer;
begin
{*
 0070D218    push        ebp
 0070D219    mov         ebp,esp
 0070D21B    add         esp,0FFFFFFF8
 0070D21E    push        ebx
 0070D21F    push        esi
 0070D220    push        edi
 0070D221    xor         ebx,ebx
 0070D223    mov         dword ptr [ebp-8],ebx
 0070D226    mov         edi,ecx
 0070D228    mov         esi,edx
 0070D22A    mov         ebx,eax
 0070D22C    xor         eax,eax
 0070D22E    push        ebp
 0070D22F    push        70D275
 0070D234    push        dword ptr fs:[eax]
 0070D237    mov         dword ptr fs:[eax],esp
 0070D23A    lea         eax,[ebp-4]
 0070D23D    push        eax
 0070D23E    mov         eax,dword ptr [ebp+8]
 0070D241    push        eax
 0070D242    push        edi
 0070D243    push        esi
 0070D244    lea         edx,[ebp-8]
 0070D247    mov         eax,ebx
 0070D249    call        0070D1A8
 0070D24E    mov         eax,dword ptr [ebp-8]
 0070D251    push        eax
 0070D252    mov         eax,dword ptr [eax]
 0070D254    call        dword ptr [eax+20]
 0070D257    call        @CheckAutoResult
 0070D25C    mov         ebx,dword ptr [ebp-4]
 0070D25F    xor         eax,eax
 0070D261    pop         edx
 0070D262    pop         ecx
 0070D263    pop         ecx
 0070D264    mov         dword ptr fs:[eax],edx
 0070D267    push        70D27C
 0070D26C    lea         eax,[ebp-8]
 0070D26F    call        @IntfClear
 0070D274    ret
>0070D275    jmp         @HandleFinally
>0070D27A    jmp         0070D26C
 0070D27C    mov         eax,ebx
 0070D27E    pop         edi
 0070D27F    pop         esi
 0070D280    pop         ebx
 0070D281    pop         ecx
 0070D282    pop         ecx
 0070D283    pop         ebp
 0070D284    ret         4
*}
end;

//0070D288
function TSynAPICtrl.GetLongProperty(eProperty:TOleEnum):Integer;
begin
{*
 0070D288    push        ebp
 0070D289    mov         ebp,esp
 0070D28B    add         esp,0FFFFFFF8
 0070D28E    push        ebx
 0070D28F    push        esi
 0070D290    xor         ecx,ecx
 0070D292    mov         dword ptr [ebp-8],ecx
 0070D295    mov         esi,edx
 0070D297    mov         ebx,eax
 0070D299    xor         eax,eax
 0070D29B    push        ebp
 0070D29C    push        70D2DD
 0070D2A1    push        dword ptr fs:[eax]
 0070D2A4    mov         dword ptr fs:[eax],esp
 0070D2A7    lea         eax,[ebp-4]
 0070D2AA    push        eax
 0070D2AB    push        esi
 0070D2AC    lea         edx,[ebp-8]
 0070D2AF    mov         eax,ebx
 0070D2B1    call        0070D1A8
 0070D2B6    mov         eax,dword ptr [ebp-8]
 0070D2B9    push        eax
 0070D2BA    mov         eax,dword ptr [eax]
 0070D2BC    call        dword ptr [eax+24]
 0070D2BF    call        @CheckAutoResult
 0070D2C4    mov         ebx,dword ptr [ebp-4]
 0070D2C7    xor         eax,eax
 0070D2C9    pop         edx
 0070D2CA    pop         ecx
 0070D2CB    pop         ecx
 0070D2CC    mov         dword ptr fs:[eax],edx
 0070D2CF    push        70D2E4
 0070D2D4    lea         eax,[ebp-8]
 0070D2D7    call        @IntfClear
 0070D2DC    ret
>0070D2DD    jmp         @HandleFinally
>0070D2E2    jmp         0070D2D4
 0070D2E4    mov         eax,ebx
 0070D2E6    pop         esi
 0070D2E7    pop         ebx
 0070D2E8    pop         ecx
 0070D2E9    pop         ecx
 0070D2EA    pop         ebp
 0070D2EB    ret
*}
end;

//0070D2EC
procedure TSynAPICtrl.SetLongProperty(eProperty:TOleEnum; newVal:Integer);
begin
{*
 0070D2EC    push        ebp
 0070D2ED    mov         ebp,esp
 0070D2EF    push        0
 0070D2F1    push        ebx
 0070D2F2    push        esi
 0070D2F3    push        edi
 0070D2F4    mov         edi,ecx
 0070D2F6    mov         esi,edx
 0070D2F8    mov         ebx,eax
 0070D2FA    xor         eax,eax
 0070D2FC    push        ebp
 0070D2FD    push        70D338
 0070D302    push        dword ptr fs:[eax]
 0070D305    mov         dword ptr fs:[eax],esp
 0070D308    push        edi
 0070D309    push        esi
 0070D30A    lea         edx,[ebp-4]
 0070D30D    mov         eax,ebx
 0070D30F    call        0070D1A8
 0070D314    mov         eax,dword ptr [ebp-4]
 0070D317    push        eax
 0070D318    mov         eax,dword ptr [eax]
 0070D31A    call        dword ptr [eax+28]
 0070D31D    call        @CheckAutoResult
 0070D322    xor         eax,eax
 0070D324    pop         edx
 0070D325    pop         ecx
 0070D326    pop         ecx
 0070D327    mov         dword ptr fs:[eax],edx
 0070D32A    push        70D33F
 0070D32F    lea         eax,[ebp-4]
 0070D332    call        @IntfClear
 0070D337    ret
>0070D338    jmp         @HandleFinally
>0070D33D    jmp         0070D32F
 0070D33F    pop         edi
 0070D340    pop         esi
 0070D341    pop         ebx
 0070D342    pop         ecx
 0070D343    pop         ebp
 0070D344    ret
*}
end;

//0070D348
{*procedure TSynAPICtrl.GetStringProperty(eProperty:TOleEnum; ?:?);
begin
 0070D348    push        ebp
 0070D349    mov         ebp,esp
 0070D34B    push        0
 0070D34D    push        ebx
 0070D34E    push        esi
 0070D34F    push        edi
 0070D350    mov         edi,ecx
 0070D352    mov         esi,edx
 0070D354    mov         ebx,eax
 0070D356    xor         eax,eax
 0070D358    push        ebp
 0070D359    push        70D39B
 0070D35E    push        dword ptr fs:[eax]
 0070D361    mov         dword ptr fs:[eax],esp
 0070D364    mov         eax,edi
 0070D366    call        @WStrClr
 0070D36B    push        eax
 0070D36C    push        esi
 0070D36D    lea         edx,[ebp-4]
 0070D370    mov         eax,ebx
 0070D372    call        0070D1A8
 0070D377    mov         eax,dword ptr [ebp-4]
 0070D37A    push        eax
 0070D37B    mov         eax,dword ptr [eax]
 0070D37D    call        dword ptr [eax+2C]
 0070D380    call        @CheckAutoResult
 0070D385    xor         eax,eax
 0070D387    pop         edx
 0070D388    pop         ecx
 0070D389    pop         ecx
 0070D38A    mov         dword ptr fs:[eax],edx
 0070D38D    push        70D3A2
 0070D392    lea         eax,[ebp-4]
 0070D395    call        @IntfClear
 0070D39A    ret
>0070D39B    jmp         @HandleFinally
>0070D3A0    jmp         0070D392
 0070D3A2    pop         edi
 0070D3A3    pop         esi
 0070D3A4    pop         ebx
 0070D3A5    pop         ecx
 0070D3A6    pop         ebp
 0070D3A7    ret
end;*}

//0070D3A8
procedure TSynAPICtrl.HardwareBroadcast(lAction:Integer);
begin
{*
 0070D3A8    push        ebp
 0070D3A9    mov         ebp,esp
 0070D3AB    push        0
 0070D3AD    push        ebx
 0070D3AE    push        esi
 0070D3AF    mov         esi,edx
 0070D3B1    mov         ebx,eax
 0070D3B3    xor         eax,eax
 0070D3B5    push        ebp
 0070D3B6    push        70D3F0
 0070D3BB    push        dword ptr fs:[eax]
 0070D3BE    mov         dword ptr fs:[eax],esp
 0070D3C1    push        esi
 0070D3C2    lea         edx,[ebp-4]
 0070D3C5    mov         eax,ebx
 0070D3C7    call        0070D1A8
 0070D3CC    mov         eax,dword ptr [ebp-4]
 0070D3CF    push        eax
 0070D3D0    mov         eax,dword ptr [eax]
 0070D3D2    call        dword ptr [eax+30]
 0070D3D5    call        @CheckAutoResult
 0070D3DA    xor         eax,eax
 0070D3DC    pop         edx
 0070D3DD    pop         ecx
 0070D3DE    pop         ecx
 0070D3DF    mov         dword ptr fs:[eax],edx
 0070D3E2    push        70D3F7
 0070D3E7    lea         eax,[ebp-4]
 0070D3EA    call        @IntfClear
 0070D3EF    ret
>0070D3F0    jmp         @HandleFinally
>0070D3F5    jmp         0070D3E7
 0070D3F7    pop         esi
 0070D3F8    pop         ebx
 0070D3F9    pop         ecx
 0070D3FA    pop         ebp
 0070D3FB    ret
*}
end;

//0070D3FC
procedure TSynAPICtrl.Activate;
begin
{*
 0070D3FC    push        ebp
 0070D3FD    mov         ebp,esp
 0070D3FF    push        0
 0070D401    push        ebx
 0070D402    mov         ebx,eax
 0070D404    xor         eax,eax
 0070D406    push        ebp
 0070D407    push        70D440
 0070D40C    push        dword ptr fs:[eax]
 0070D40F    mov         dword ptr fs:[eax],esp
 0070D412    lea         edx,[ebp-4]
 0070D415    mov         eax,ebx
 0070D417    call        0070D1A8
 0070D41C    mov         eax,dword ptr [ebp-4]
 0070D41F    push        eax
 0070D420    mov         eax,dword ptr [eax]
 0070D422    call        dword ptr [eax+34]
 0070D425    call        @CheckAutoResult
 0070D42A    xor         eax,eax
 0070D42C    pop         edx
 0070D42D    pop         ecx
 0070D42E    pop         ecx
 0070D42F    mov         dword ptr fs:[eax],edx
 0070D432    push        70D447
 0070D437    lea         eax,[ebp-4]
 0070D43A    call        @IntfClear
 0070D43F    ret
>0070D440    jmp         @HandleFinally
>0070D445    jmp         0070D437
 0070D447    pop         ebx
 0070D448    pop         ecx
 0070D449    pop         ebp
 0070D44A    ret
*}
end;

//0070D44C
procedure TSynAPICtrl.PersistState(lStateFlags:Integer);
begin
{*
 0070D44C    push        ebp
 0070D44D    mov         ebp,esp
 0070D44F    push        0
 0070D451    push        ebx
 0070D452    push        esi
 0070D453    mov         esi,edx
 0070D455    mov         ebx,eax
 0070D457    xor         eax,eax
 0070D459    push        ebp
 0070D45A    push        70D494
 0070D45F    push        dword ptr fs:[eax]
 0070D462    mov         dword ptr fs:[eax],esp
 0070D465    push        esi
 0070D466    lea         edx,[ebp-4]
 0070D469    mov         eax,ebx
 0070D46B    call        0070D1A8
 0070D470    mov         eax,dword ptr [ebp-4]
 0070D473    push        eax
 0070D474    mov         eax,dword ptr [eax]
 0070D476    call        dword ptr [eax+38]
 0070D479    call        @CheckAutoResult
 0070D47E    xor         eax,eax
 0070D480    pop         edx
 0070D481    pop         ecx
 0070D482    pop         ecx
 0070D483    mov         dword ptr fs:[eax],edx
 0070D486    push        70D49B
 0070D48B    lea         eax,[ebp-4]
 0070D48E    call        @IntfClear
 0070D493    ret
>0070D494    jmp         @HandleFinally
>0070D499    jmp         0070D48B
 0070D49B    pop         esi
 0070D49C    pop         ebx
 0070D49D    pop         ecx
 0070D49E    pop         ebp
 0070D49F    ret
*}
end;

//0070D4A0
procedure TSynAPICtrl.RestoreState(lStateFlags:Integer);
begin
{*
 0070D4A0    push        ebp
 0070D4A1    mov         ebp,esp
 0070D4A3    push        0
 0070D4A5    push        ebx
 0070D4A6    push        esi
 0070D4A7    mov         esi,edx
 0070D4A9    mov         ebx,eax
 0070D4AB    xor         eax,eax
 0070D4AD    push        ebp
 0070D4AE    push        70D4E8
 0070D4B3    push        dword ptr fs:[eax]
 0070D4B6    mov         dword ptr fs:[eax],esp
 0070D4B9    push        esi
 0070D4BA    lea         edx,[ebp-4]
 0070D4BD    mov         eax,ebx
 0070D4BF    call        0070D1A8
 0070D4C4    mov         eax,dword ptr [ebp-4]
 0070D4C7    push        eax
 0070D4C8    mov         eax,dword ptr [eax]
 0070D4CA    call        dword ptr [eax+3C]
 0070D4CD    call        @CheckAutoResult
 0070D4D2    xor         eax,eax
 0070D4D4    pop         edx
 0070D4D5    pop         ecx
 0070D4D6    pop         ecx
 0070D4D7    mov         dword ptr fs:[eax],edx
 0070D4DA    push        70D4EF
 0070D4DF    lea         eax,[ebp-4]
 0070D4E2    call        @IntfClear
 0070D4E7    ret
>0070D4E8    jmp         @HandleFinally
>0070D4ED    jmp         0070D4DF
 0070D4EF    pop         esi
 0070D4F0    pop         ebx
 0070D4F1    pop         ecx
 0070D4F2    pop         ebp
 0070D4F3    ret
*}
end;

//0070D4F4
procedure TSynAPICtrl.Deactivate;
begin
{*
 0070D4F4    push        ebp
 0070D4F5    mov         ebp,esp
 0070D4F7    push        0
 0070D4F9    push        ebx
 0070D4FA    mov         ebx,eax
 0070D4FC    xor         eax,eax
 0070D4FE    push        ebp
 0070D4FF    push        70D538
 0070D504    push        dword ptr fs:[eax]
 0070D507    mov         dword ptr fs:[eax],esp
 0070D50A    lea         edx,[ebp-4]
 0070D50D    mov         eax,ebx
 0070D50F    call        0070D1A8
 0070D514    mov         eax,dword ptr [ebp-4]
 0070D517    push        eax
 0070D518    mov         eax,dword ptr [eax]
 0070D51A    call        dword ptr [eax+40]
 0070D51D    call        @CheckAutoResult
 0070D522    xor         eax,eax
 0070D524    pop         edx
 0070D525    pop         ecx
 0070D526    pop         ecx
 0070D527    mov         dword ptr fs:[eax],edx
 0070D52A    push        70D53F
 0070D52F    lea         eax,[ebp-4]
 0070D532    call        @IntfClear
 0070D537    ret
>0070D538    jmp         @HandleFinally
>0070D53D    jmp         0070D52F
 0070D53F    pop         ebx
 0070D540    pop         ecx
 0070D541    pop         ebp
 0070D542    ret
*}
end;

//0070D544
procedure sub_0070D544;
begin
{*
 0070D544    mov         edx,78C464
 0070D549    mov         dword ptr [eax+270],edx;TSynPacketCtrl.FControlData:PControlData
 0070D54F    ret
*}
end;

//0070D550
{*procedure sub_0070D550(?:?);
begin
 0070D550    push        ebp
 0070D551    mov         ebp,esp
 0070D553    xor         ecx,ecx
 0070D555    push        ecx
 0070D556    push        ecx
 0070D557    push        ecx
 0070D558    push        ecx
 0070D559    push        ecx
 0070D55A    xor         eax,eax
 0070D55C    push        ebp
 0070D55D    push        70D5B7
 0070D562    push        dword ptr fs:[eax]
 0070D565    mov         dword ptr fs:[eax],esp
 0070D568    lea         edx,[ebp-14]
 0070D56B    mov         eax,dword ptr [ebp+8]
 0070D56E    mov         eax,dword ptr [eax-4]
 0070D571    call        TOleControl.GetOleObject
 0070D576    lea         edx,[ebp-14]
 0070D579    lea         eax,[ebp-4]
 0070D57C    call        @VarToIntf
 0070D581    mov         edx,dword ptr [ebp-4]
 0070D584    mov         eax,dword ptr [ebp+8]
 0070D587    mov         eax,dword ptr [eax-4]
 0070D58A    add         eax,2F0
 0070D58F    mov         ecx,70D5C4;['{F9765B3B-73D0-4A8F-B321-A66206A7780A}']
 0070D594    call        @IntfCast
 0070D599    xor         eax,eax
 0070D59B    pop         edx
 0070D59C    pop         ecx
 0070D59D    pop         ecx
 0070D59E    mov         dword ptr fs:[eax],edx
 0070D5A1    push        70D5BE
 0070D5A6    lea         eax,[ebp-14]
 0070D5A9    call        @VarClr
 0070D5AE    lea         eax,[ebp-4]
 0070D5B1    call        @IntfClear
 0070D5B6    ret
>0070D5B7    jmp         @HandleFinally
>0070D5BC    jmp         0070D5A6
 0070D5BE    mov         esp,ebp
 0070D5C0    pop         ebp
 0070D5C1    ret
end;*}

//0070D5D4
{*procedure sub_0070D5D4(?:?);
begin
 0070D5D4    push        ebp
 0070D5D5    mov         ebp,esp
 0070D5D7    push        ecx
 0070D5D8    mov         dword ptr [ebp-4],eax
 0070D5DB    mov         eax,dword ptr [ebp-4]
 0070D5DE    cmp         dword ptr [eax+2F0],0
>0070D5E5    jne         0070D5EE
 0070D5E7    push        ebp
 0070D5E8    call        0070D550
 0070D5ED    pop         ecx
 0070D5EE    pop         ecx
 0070D5EF    pop         ebp
 0070D5F0    ret
end;*}

//0070D5F4
{*procedure sub_0070D5F4(?:TSynPacketCtrl; ?:?);
begin
 0070D5F4    push        ebx
 0070D5F5    push        esi
 0070D5F6    mov         esi,edx
 0070D5F8    mov         ebx,eax
 0070D5FA    mov         eax,ebx
 0070D5FC    call        0070D5D4
 0070D601    mov         eax,esi
 0070D603    mov         edx,dword ptr [ebx+2F0]
 0070D609    call        @IntfCopy
 0070D60E    pop         esi
 0070D60F    pop         ebx
 0070D610    ret
end;*}

//0070D614
function TSynPacketCtrl.GetLongProperty(eProperty:TOleEnum):Integer;
begin
{*
 0070D614    push        ebp
 0070D615    mov         ebp,esp
 0070D617    add         esp,0FFFFFFF8
 0070D61A    push        ebx
 0070D61B    push        esi
 0070D61C    xor         ecx,ecx
 0070D61E    mov         dword ptr [ebp-8],ecx
 0070D621    mov         esi,edx
 0070D623    mov         ebx,eax
 0070D625    xor         eax,eax
 0070D627    push        ebp
 0070D628    push        70D669
 0070D62D    push        dword ptr fs:[eax]
 0070D630    mov         dword ptr fs:[eax],esp
 0070D633    lea         eax,[ebp-4]
 0070D636    push        eax
 0070D637    push        esi
 0070D638    lea         edx,[ebp-8]
 0070D63B    mov         eax,ebx
 0070D63D    call        0070D5F4
 0070D642    mov         eax,dword ptr [ebp-8]
 0070D645    push        eax
 0070D646    mov         eax,dword ptr [eax]
 0070D648    call        dword ptr [eax+1C]
 0070D64B    call        @CheckAutoResult
 0070D650    mov         ebx,dword ptr [ebp-4]
 0070D653    xor         eax,eax
 0070D655    pop         edx
 0070D656    pop         ecx
 0070D657    pop         ecx
 0070D658    mov         dword ptr fs:[eax],edx
 0070D65B    push        70D670
 0070D660    lea         eax,[ebp-8]
 0070D663    call        @IntfClear
 0070D668    ret
>0070D669    jmp         @HandleFinally
>0070D66E    jmp         0070D660
 0070D670    mov         eax,ebx
 0070D672    pop         esi
 0070D673    pop         ebx
 0070D674    pop         ecx
 0070D675    pop         ecx
 0070D676    pop         ebp
 0070D677    ret
*}
end;

//0070D678
procedure TSynPacketCtrl.SetLongProperty(eProperty:TOleEnum; newVal:Integer);
begin
{*
 0070D678    push        ebp
 0070D679    mov         ebp,esp
 0070D67B    push        0
 0070D67D    push        ebx
 0070D67E    push        esi
 0070D67F    push        edi
 0070D680    mov         edi,ecx
 0070D682    mov         esi,edx
 0070D684    mov         ebx,eax
 0070D686    xor         eax,eax
 0070D688    push        ebp
 0070D689    push        70D6C4
 0070D68E    push        dword ptr fs:[eax]
 0070D691    mov         dword ptr fs:[eax],esp
 0070D694    push        edi
 0070D695    push        esi
 0070D696    lea         edx,[ebp-4]
 0070D699    mov         eax,ebx
 0070D69B    call        0070D5F4
 0070D6A0    mov         eax,dword ptr [ebp-4]
 0070D6A3    push        eax
 0070D6A4    mov         eax,dword ptr [eax]
 0070D6A6    call        dword ptr [eax+20]
 0070D6A9    call        @CheckAutoResult
 0070D6AE    xor         eax,eax
 0070D6B0    pop         edx
 0070D6B1    pop         ecx
 0070D6B2    pop         ecx
 0070D6B3    mov         dword ptr fs:[eax],edx
 0070D6B6    push        70D6CB
 0070D6BB    lea         eax,[ebp-4]
 0070D6BE    call        @IntfClear
 0070D6C3    ret
>0070D6C4    jmp         @HandleFinally
>0070D6C9    jmp         0070D6BB
 0070D6CB    pop         edi
 0070D6CC    pop         esi
 0070D6CD    pop         ebx
 0070D6CE    pop         ecx
 0070D6CF    pop         ebp
 0070D6D0    ret
*}
end;

//0070D6D4
procedure TSynPacketCtrl.Copy(pFrom:ISynPacketCtrl);
begin
{*
 0070D6D4    push        ebp
 0070D6D5    mov         ebp,esp
 0070D6D7    push        0
 0070D6D9    push        ebx
 0070D6DA    push        esi
 0070D6DB    mov         esi,edx
 0070D6DD    mov         ebx,eax
 0070D6DF    xor         eax,eax
 0070D6E1    push        ebp
 0070D6E2    push        70D71F
 0070D6E7    push        dword ptr fs:[eax]
 0070D6EA    mov         dword ptr fs:[eax],esp
 0070D6ED    push        esi
 0070D6EE    lea         edx,[ebp-4]
 0070D6F1    mov         eax,ebx
 0070D6F3    call        0070D5F4
 0070D6F8    mov         eax,dword ptr [ebp-4]
 0070D6FB    push        eax
 0070D6FC    mov         eax,dword ptr [eax]
 0070D6FE    call        dword ptr [eax+0C4]
 0070D704    call        @CheckAutoResult
 0070D709    xor         eax,eax
 0070D70B    pop         edx
 0070D70C    pop         ecx
 0070D70D    pop         ecx
 0070D70E    mov         dword ptr fs:[eax],edx
 0070D711    push        70D726
 0070D716    lea         eax,[ebp-4]
 0070D719    call        @IntfClear
 0070D71E    ret
>0070D71F    jmp         @HandleFinally
>0070D724    jmp         0070D716
 0070D726    pop         esi
 0070D727    pop         ebx
 0070D728    pop         ecx
 0070D729    pop         ebp
 0070D72A    ret
*}
end;

//0070D72C
procedure sub_0070D72C;
begin
{*
 0070D72C    mov         edx,78C4BC
 0070D731    mov         dword ptr [eax+270],edx;TSynDeviceCtrl.FControlData:PControlData
 0070D737    lea         edx,[eax+2F0];TSynDeviceCtrl.FOnPacket:TNotifyEvent
 0070D73D    sub         edx,eax
 0070D73F    mov         dword ptr ds:[78C50C],edx;gvar_0078C50C
 0070D745    ret
*}
end;

//0070D748
{*procedure sub_0070D748(?:?);
begin
 0070D748    push        ebp
 0070D749    mov         ebp,esp
 0070D74B    xor         ecx,ecx
 0070D74D    push        ecx
 0070D74E    push        ecx
 0070D74F    push        ecx
 0070D750    push        ecx
 0070D751    push        ecx
 0070D752    xor         eax,eax
 0070D754    push        ebp
 0070D755    push        70D7AF
 0070D75A    push        dword ptr fs:[eax]
 0070D75D    mov         dword ptr fs:[eax],esp
 0070D760    lea         edx,[ebp-14]
 0070D763    mov         eax,dword ptr [ebp+8]
 0070D766    mov         eax,dword ptr [eax-4]
 0070D769    call        TOleControl.GetOleObject
 0070D76E    lea         edx,[ebp-14]
 0070D771    lea         eax,[ebp-4]
 0070D774    call        @VarToIntf
 0070D779    mov         edx,dword ptr [ebp-4]
 0070D77C    mov         eax,dword ptr [ebp+8]
 0070D77F    mov         eax,dword ptr [eax-4]
 0070D782    add         eax,2F8
 0070D787    mov         ecx,70D7BC;['{8317C718-98AB-484A-A12F-EDEB48C8B39F}']
 0070D78C    call        @IntfCast
 0070D791    xor         eax,eax
 0070D793    pop         edx
 0070D794    pop         ecx
 0070D795    pop         ecx
 0070D796    mov         dword ptr fs:[eax],edx
 0070D799    push        70D7B6
 0070D79E    lea         eax,[ebp-14]
 0070D7A1    call        @VarClr
 0070D7A6    lea         eax,[ebp-4]
 0070D7A9    call        @IntfClear
 0070D7AE    ret
>0070D7AF    jmp         @HandleFinally
>0070D7B4    jmp         0070D79E
 0070D7B6    mov         esp,ebp
 0070D7B8    pop         ebp
 0070D7B9    ret
end;*}

//0070D7CC
{*procedure sub_0070D7CC(?:?);
begin
 0070D7CC    push        ebp
 0070D7CD    mov         ebp,esp
 0070D7CF    push        ecx
 0070D7D0    mov         dword ptr [ebp-4],eax
 0070D7D3    mov         eax,dword ptr [ebp-4]
 0070D7D6    cmp         dword ptr [eax+2F8],0
>0070D7DD    jne         0070D7E6
 0070D7DF    push        ebp
 0070D7E0    call        0070D748
 0070D7E5    pop         ecx
 0070D7E6    pop         ecx
 0070D7E7    pop         ebp
 0070D7E8    ret
end;*}

//0070D7EC
{*procedure sub_0070D7EC(?:TSynDeviceCtrl; ?:?);
begin
 0070D7EC    push        ebx
 0070D7ED    push        esi
 0070D7EE    mov         esi,edx
 0070D7F0    mov         ebx,eax
 0070D7F2    mov         eax,ebx
 0070D7F4    call        0070D7CC
 0070D7F9    mov         eax,esi
 0070D7FB    mov         edx,dword ptr [ebx+2F8]
 0070D801    call        @IntfCopy
 0070D806    pop         esi
 0070D807    pop         ebx
 0070D808    ret
end;*}

//0070D80C
procedure TSynDeviceCtrl.Select(lDeviceHandle:Integer);
begin
{*
 0070D80C    push        ebp
 0070D80D    mov         ebp,esp
 0070D80F    push        0
 0070D811    push        ebx
 0070D812    push        esi
 0070D813    mov         esi,edx
 0070D815    mov         ebx,eax
 0070D817    xor         eax,eax
 0070D819    push        ebp
 0070D81A    push        70D854
 0070D81F    push        dword ptr fs:[eax]
 0070D822    mov         dword ptr fs:[eax],esp
 0070D825    push        esi
 0070D826    lea         edx,[ebp-4]
 0070D829    mov         eax,ebx
 0070D82B    call        0070D7EC
 0070D830    mov         eax,dword ptr [ebp-4]
 0070D833    push        eax
 0070D834    mov         eax,dword ptr [eax]
 0070D836    call        dword ptr [eax+1C]
 0070D839    call        @CheckAutoResult
 0070D83E    xor         eax,eax
 0070D840    pop         edx
 0070D841    pop         ecx
 0070D842    pop         ecx
 0070D843    mov         dword ptr fs:[eax],edx
 0070D846    push        70D85B
 0070D84B    lea         eax,[ebp-4]
 0070D84E    call        @IntfClear
 0070D853    ret
>0070D854    jmp         @HandleFinally
>0070D859    jmp         0070D84B
 0070D85B    pop         esi
 0070D85C    pop         ebx
 0070D85D    pop         ecx
 0070D85E    pop         ebp
 0070D85F    ret
*}
end;

//0070D860
function TSynDeviceCtrl.GetLongProperty(eProperty:TOleEnum):Integer;
begin
{*
 0070D860    push        ebp
 0070D861    mov         ebp,esp
 0070D863    add         esp,0FFFFFFF8
 0070D866    push        ebx
 0070D867    push        esi
 0070D868    xor         ecx,ecx
 0070D86A    mov         dword ptr [ebp-8],ecx
 0070D86D    mov         esi,edx
 0070D86F    mov         ebx,eax
 0070D871    xor         eax,eax
 0070D873    push        ebp
 0070D874    push        70D8B5
 0070D879    push        dword ptr fs:[eax]
 0070D87C    mov         dword ptr fs:[eax],esp
 0070D87F    lea         eax,[ebp-4]
 0070D882    push        eax
 0070D883    push        esi
 0070D884    lea         edx,[ebp-8]
 0070D887    mov         eax,ebx
 0070D889    call        0070D7EC
 0070D88E    mov         eax,dword ptr [ebp-8]
 0070D891    push        eax
 0070D892    mov         eax,dword ptr [eax]
 0070D894    call        dword ptr [eax+20]
 0070D897    call        @CheckAutoResult
 0070D89C    mov         ebx,dword ptr [ebp-4]
 0070D89F    xor         eax,eax
 0070D8A1    pop         edx
 0070D8A2    pop         ecx
 0070D8A3    pop         ecx
 0070D8A4    mov         dword ptr fs:[eax],edx
 0070D8A7    push        70D8BC
 0070D8AC    lea         eax,[ebp-8]
 0070D8AF    call        @IntfClear
 0070D8B4    ret
>0070D8B5    jmp         @HandleFinally
>0070D8BA    jmp         0070D8AC
 0070D8BC    mov         eax,ebx
 0070D8BE    pop         esi
 0070D8BF    pop         ebx
 0070D8C0    pop         ecx
 0070D8C1    pop         ecx
 0070D8C2    pop         ebp
 0070D8C3    ret
*}
end;

//0070D8C4
procedure TSynDeviceCtrl.SetLongProperty(eProperty:TOleEnum; newVal:Integer);
begin
{*
 0070D8C4    push        ebp
 0070D8C5    mov         ebp,esp
 0070D8C7    push        0
 0070D8C9    push        ebx
 0070D8CA    push        esi
 0070D8CB    push        edi
 0070D8CC    mov         edi,ecx
 0070D8CE    mov         esi,edx
 0070D8D0    mov         ebx,eax
 0070D8D2    xor         eax,eax
 0070D8D4    push        ebp
 0070D8D5    push        70D910
 0070D8DA    push        dword ptr fs:[eax]
 0070D8DD    mov         dword ptr fs:[eax],esp
 0070D8E0    push        edi
 0070D8E1    push        esi
 0070D8E2    lea         edx,[ebp-4]
 0070D8E5    mov         eax,ebx
 0070D8E7    call        0070D7EC
 0070D8EC    mov         eax,dword ptr [ebp-4]
 0070D8EF    push        eax
 0070D8F0    mov         eax,dword ptr [eax]
 0070D8F2    call        dword ptr [eax+24]
 0070D8F5    call        @CheckAutoResult
 0070D8FA    xor         eax,eax
 0070D8FC    pop         edx
 0070D8FD    pop         ecx
 0070D8FE    pop         ecx
 0070D8FF    mov         dword ptr fs:[eax],edx
 0070D902    push        70D917
 0070D907    lea         eax,[ebp-4]
 0070D90A    call        @IntfClear
 0070D90F    ret
>0070D910    jmp         @HandleFinally
>0070D915    jmp         0070D907
 0070D917    pop         edi
 0070D918    pop         esi
 0070D919    pop         ebx
 0070D91A    pop         ecx
 0070D91B    pop         ebp
 0070D91C    ret
*}
end;

//0070D920
{*procedure TSynDeviceCtrl.GetStringProperty(eProperty:TOleEnum; ?:?);
begin
 0070D920    push        ebp
 0070D921    mov         ebp,esp
 0070D923    push        0
 0070D925    push        ebx
 0070D926    push        esi
 0070D927    push        edi
 0070D928    mov         edi,ecx
 0070D92A    mov         esi,edx
 0070D92C    mov         ebx,eax
 0070D92E    xor         eax,eax
 0070D930    push        ebp
 0070D931    push        70D973
 0070D936    push        dword ptr fs:[eax]
 0070D939    mov         dword ptr fs:[eax],esp
 0070D93C    mov         eax,edi
 0070D93E    call        @WStrClr
 0070D943    push        eax
 0070D944    push        esi
 0070D945    lea         edx,[ebp-4]
 0070D948    mov         eax,ebx
 0070D94A    call        0070D7EC
 0070D94F    mov         eax,dword ptr [ebp-4]
 0070D952    push        eax
 0070D953    mov         eax,dword ptr [eax]
 0070D955    call        dword ptr [eax+28]
 0070D958    call        @CheckAutoResult
 0070D95D    xor         eax,eax
 0070D95F    pop         edx
 0070D960    pop         ecx
 0070D961    pop         ecx
 0070D962    mov         dword ptr fs:[eax],edx
 0070D965    push        70D97A
 0070D96A    lea         eax,[ebp-4]
 0070D96D    call        @IntfClear
 0070D972    ret
>0070D973    jmp         @HandleFinally
>0070D978    jmp         0070D96A
 0070D97A    pop         edi
 0070D97B    pop         esi
 0070D97C    pop         ebx
 0070D97D    pop         ecx
 0070D97E    pop         ebp
 0070D97F    ret
end;*}

//0070D980
function TSynDeviceCtrl.LoadPacket(pPacket:ISynPacketCtrl):Integer;
begin
{*
 0070D980    push        ebp
 0070D981    mov         ebp,esp
 0070D983    add         esp,0FFFFFFF8
 0070D986    push        ebx
 0070D987    push        esi
 0070D988    xor         ecx,ecx
 0070D98A    mov         dword ptr [ebp-8],ecx
 0070D98D    mov         esi,edx
 0070D98F    mov         ebx,eax
 0070D991    xor         eax,eax
 0070D993    push        ebp
 0070D994    push        70D9D5
 0070D999    push        dword ptr fs:[eax]
 0070D99C    mov         dword ptr fs:[eax],esp
 0070D99F    lea         eax,[ebp-4]
 0070D9A2    push        eax
 0070D9A3    push        esi
 0070D9A4    lea         edx,[ebp-8]
 0070D9A7    mov         eax,ebx
 0070D9A9    call        0070D7EC
 0070D9AE    mov         eax,dword ptr [ebp-8]
 0070D9B1    push        eax
 0070D9B2    mov         eax,dword ptr [eax]
 0070D9B4    call        dword ptr [eax+2C]
 0070D9B7    call        @CheckAutoResult
 0070D9BC    mov         ebx,dword ptr [ebp-4]
 0070D9BF    xor         eax,eax
 0070D9C1    pop         edx
 0070D9C2    pop         ecx
 0070D9C3    pop         ecx
 0070D9C4    mov         dword ptr fs:[eax],edx
 0070D9C7    push        70D9DC
 0070D9CC    lea         eax,[ebp-8]
 0070D9CF    call        @IntfClear
 0070D9D4    ret
>0070D9D5    jmp         @HandleFinally
>0070D9DA    jmp         0070D9CC
 0070D9DC    mov         eax,ebx
 0070D9DE    pop         esi
 0070D9DF    pop         ebx
 0070D9E0    pop         ecx
 0070D9E1    pop         ecx
 0070D9E2    pop         ebp
 0070D9E3    ret
*}
end;

//0070D9E4
procedure TSynDeviceCtrl.ForceMotion(lDeltaX:Integer; lDeltaY:Integer; lButtonState:Integer);
begin
{*
 0070D9E4    push        ebp
 0070D9E5    mov         ebp,esp
 0070D9E7    push        0
 0070D9E9    push        ebx
 0070D9EA    push        esi
 0070D9EB    push        edi
 0070D9EC    mov         edi,ecx
 0070D9EE    mov         esi,edx
 0070D9F0    mov         ebx,eax
 0070D9F2    xor         eax,eax
 0070D9F4    push        ebp
 0070D9F5    push        70DA34
 0070D9FA    push        dword ptr fs:[eax]
 0070D9FD    mov         dword ptr fs:[eax],esp
 0070DA00    mov         eax,dword ptr [ebp+8]
 0070DA03    push        eax
 0070DA04    push        edi
 0070DA05    push        esi
 0070DA06    lea         edx,[ebp-4]
 0070DA09    mov         eax,ebx
 0070DA0B    call        0070D7EC
 0070DA10    mov         eax,dword ptr [ebp-4]
 0070DA13    push        eax
 0070DA14    mov         eax,dword ptr [eax]
 0070DA16    call        dword ptr [eax+30]
 0070DA19    call        @CheckAutoResult
 0070DA1E    xor         eax,eax
 0070DA20    pop         edx
 0070DA21    pop         ecx
 0070DA22    pop         ecx
 0070DA23    mov         dword ptr fs:[eax],edx
 0070DA26    push        70DA3B
 0070DA2B    lea         eax,[ebp-4]
 0070DA2E    call        @IntfClear
 0070DA33    ret
>0070DA34    jmp         @HandleFinally
>0070DA39    jmp         0070DA2B
 0070DA3B    pop         edi
 0070DA3C    pop         esi
 0070DA3D    pop         ebx
 0070DA3E    pop         ecx
 0070DA3F    pop         ebp
 0070DA40    ret         4
*}
end;

//0070DA44
procedure TSynDeviceCtrl.ForcePacket(pPacket:ISynPacketCtrl);
begin
{*
 0070DA44    push        ebp
 0070DA45    mov         ebp,esp
 0070DA47    push        0
 0070DA49    push        ebx
 0070DA4A    push        esi
 0070DA4B    mov         esi,edx
 0070DA4D    mov         ebx,eax
 0070DA4F    xor         eax,eax
 0070DA51    push        ebp
 0070DA52    push        70DA8C
 0070DA57    push        dword ptr fs:[eax]
 0070DA5A    mov         dword ptr fs:[eax],esp
 0070DA5D    push        esi
 0070DA5E    lea         edx,[ebp-4]
 0070DA61    mov         eax,ebx
 0070DA63    call        0070D7EC
 0070DA68    mov         eax,dword ptr [ebp-4]
 0070DA6B    push        eax
 0070DA6C    mov         eax,dword ptr [eax]
 0070DA6E    call        dword ptr [eax+34]
 0070DA71    call        @CheckAutoResult
 0070DA76    xor         eax,eax
 0070DA78    pop         edx
 0070DA79    pop         ecx
 0070DA7A    pop         ecx
 0070DA7B    mov         dword ptr fs:[eax],edx
 0070DA7E    push        70DA93
 0070DA83    lea         eax,[ebp-4]
 0070DA86    call        @IntfClear
 0070DA8B    ret
>0070DA8C    jmp         @HandleFinally
>0070DA91    jmp         0070DA83
 0070DA93    pop         esi
 0070DA94    pop         ebx
 0070DA95    pop         ecx
 0070DA96    pop         ebp
 0070DA97    ret
*}
end;

//0070DA98
procedure TSynDeviceCtrl.Acquire(lFlags:Integer);
begin
{*
 0070DA98    push        ebp
 0070DA99    mov         ebp,esp
 0070DA9B    push        0
 0070DA9D    push        ebx
 0070DA9E    push        esi
 0070DA9F    mov         esi,edx
 0070DAA1    mov         ebx,eax
 0070DAA3    xor         eax,eax
 0070DAA5    push        ebp
 0070DAA6    push        70DAE0
 0070DAAB    push        dword ptr fs:[eax]
 0070DAAE    mov         dword ptr fs:[eax],esp
 0070DAB1    push        esi
 0070DAB2    lea         edx,[ebp-4]
 0070DAB5    mov         eax,ebx
 0070DAB7    call        0070D7EC
 0070DABC    mov         eax,dword ptr [ebp-4]
 0070DABF    push        eax
 0070DAC0    mov         eax,dword ptr [eax]
 0070DAC2    call        dword ptr [eax+38]
 0070DAC5    call        @CheckAutoResult
 0070DACA    xor         eax,eax
 0070DACC    pop         edx
 0070DACD    pop         ecx
 0070DACE    pop         ecx
 0070DACF    mov         dword ptr fs:[eax],edx
 0070DAD2    push        70DAE7
 0070DAD7    lea         eax,[ebp-4]
 0070DADA    call        @IntfClear
 0070DADF    ret
>0070DAE0    jmp         @HandleFinally
>0070DAE5    jmp         0070DAD7
 0070DAE7    pop         esi
 0070DAE8    pop         ebx
 0070DAE9    pop         ecx
 0070DAEA    pop         ebp
 0070DAEB    ret
*}
end;

//0070DAEC
procedure TSynDeviceCtrl.Unacquire;
begin
{*
 0070DAEC    push        ebp
 0070DAED    mov         ebp,esp
 0070DAEF    push        0
 0070DAF1    push        ebx
 0070DAF2    mov         ebx,eax
 0070DAF4    xor         eax,eax
 0070DAF6    push        ebp
 0070DAF7    push        70DB30
 0070DAFC    push        dword ptr fs:[eax]
 0070DAFF    mov         dword ptr fs:[eax],esp
 0070DB02    lea         edx,[ebp-4]
 0070DB05    mov         eax,ebx
 0070DB07    call        0070D7EC
 0070DB0C    mov         eax,dword ptr [ebp-4]
 0070DB0F    push        eax
 0070DB10    mov         eax,dword ptr [eax]
 0070DB12    call        dword ptr [eax+3C]
 0070DB15    call        @CheckAutoResult
 0070DB1A    xor         eax,eax
 0070DB1C    pop         edx
 0070DB1D    pop         ecx
 0070DB1E    pop         ecx
 0070DB1F    mov         dword ptr fs:[eax],edx
 0070DB22    push        70DB37
 0070DB27    lea         eax,[ebp-4]
 0070DB2A    call        @IntfClear
 0070DB2F    ret
>0070DB30    jmp         @HandleFinally
>0070DB35    jmp         0070DB27
 0070DB37    pop         ebx
 0070DB38    pop         ecx
 0070DB39    pop         ebp
 0070DB3A    ret
*}
end;

//0070DB3C
procedure TSynDeviceCtrl.Activate;
begin
{*
 0070DB3C    push        ebp
 0070DB3D    mov         ebp,esp
 0070DB3F    push        0
 0070DB41    push        ebx
 0070DB42    mov         ebx,eax
 0070DB44    xor         eax,eax
 0070DB46    push        ebp
 0070DB47    push        70DB80
 0070DB4C    push        dword ptr fs:[eax]
 0070DB4F    mov         dword ptr fs:[eax],esp
 0070DB52    lea         edx,[ebp-4]
 0070DB55    mov         eax,ebx
 0070DB57    call        0070D7EC
 0070DB5C    mov         eax,dword ptr [ebp-4]
 0070DB5F    push        eax
 0070DB60    mov         eax,dword ptr [eax]
 0070DB62    call        dword ptr [eax+40]
 0070DB65    call        @CheckAutoResult
 0070DB6A    xor         eax,eax
 0070DB6C    pop         edx
 0070DB6D    pop         ecx
 0070DB6E    pop         ecx
 0070DB6F    mov         dword ptr fs:[eax],edx
 0070DB72    push        70DB87
 0070DB77    lea         eax,[ebp-4]
 0070DB7A    call        @IntfClear
 0070DB7F    ret
>0070DB80    jmp         @HandleFinally
>0070DB85    jmp         0070DB77
 0070DB87    pop         ebx
 0070DB88    pop         ecx
 0070DB89    pop         ebp
 0070DB8A    ret
*}
end;

//0070DB8C
procedure TSynDeviceCtrl.Deactivate;
begin
{*
 0070DB8C    push        ebp
 0070DB8D    mov         ebp,esp
 0070DB8F    push        0
 0070DB91    push        ebx
 0070DB92    mov         ebx,eax
 0070DB94    xor         eax,eax
 0070DB96    push        ebp
 0070DB97    push        70DBD0
 0070DB9C    push        dword ptr fs:[eax]
 0070DB9F    mov         dword ptr fs:[eax],esp
 0070DBA2    lea         edx,[ebp-4]
 0070DBA5    mov         eax,ebx
 0070DBA7    call        0070D7EC
 0070DBAC    mov         eax,dword ptr [ebp-4]
 0070DBAF    push        eax
 0070DBB0    mov         eax,dword ptr [eax]
 0070DBB2    call        dword ptr [eax+44]
 0070DBB5    call        @CheckAutoResult
 0070DBBA    xor         eax,eax
 0070DBBC    pop         edx
 0070DBBD    pop         ecx
 0070DBBE    pop         ecx
 0070DBBF    mov         dword ptr fs:[eax],edx
 0070DBC2    push        70DBD7
 0070DBC7    lea         eax,[ebp-4]
 0070DBCA    call        @IntfClear
 0070DBCF    ret
>0070DBD0    jmp         @HandleFinally
>0070DBD5    jmp         0070DBC7
 0070DBD7    pop         ebx
 0070DBD8    pop         ecx
 0070DBD9    pop         ebp
 0070DBDA    ret
*}
end;

//0070DBDC
function TSynDeviceCtrl.GetLongPropertyDefault(eProperty:TOleEnum):Integer;
begin
{*
 0070DBDC    push        ebp
 0070DBDD    mov         ebp,esp
 0070DBDF    add         esp,0FFFFFFF8
 0070DBE2    push        ebx
 0070DBE3    push        esi
 0070DBE4    xor         ecx,ecx
 0070DBE6    mov         dword ptr [ebp-8],ecx
 0070DBE9    mov         esi,edx
 0070DBEB    mov         ebx,eax
 0070DBED    xor         eax,eax
 0070DBEF    push        ebp
 0070DBF0    push        70DC31
 0070DBF5    push        dword ptr fs:[eax]
 0070DBF8    mov         dword ptr fs:[eax],esp
 0070DBFB    lea         eax,[ebp-4]
 0070DBFE    push        eax
 0070DBFF    push        esi
 0070DC00    lea         edx,[ebp-8]
 0070DC03    mov         eax,ebx
 0070DC05    call        0070D7EC
 0070DC0A    mov         eax,dword ptr [ebp-8]
 0070DC0D    push        eax
 0070DC0E    mov         eax,dword ptr [eax]
 0070DC10    call        dword ptr [eax+48]
 0070DC13    call        @CheckAutoResult
 0070DC18    mov         ebx,dword ptr [ebp-4]
 0070DC1B    xor         eax,eax
 0070DC1D    pop         edx
 0070DC1E    pop         ecx
 0070DC1F    pop         ecx
 0070DC20    mov         dword ptr fs:[eax],edx
 0070DC23    push        70DC38
 0070DC28    lea         eax,[ebp-8]
 0070DC2B    call        @IntfClear
 0070DC30    ret
>0070DC31    jmp         @HandleFinally
>0070DC36    jmp         0070DC28
 0070DC38    mov         eax,ebx
 0070DC3A    pop         esi
 0070DC3B    pop         ebx
 0070DC3C    pop         ecx
 0070DC3D    pop         ecx
 0070DC3E    pop         ebp
 0070DC3F    ret
*}
end;

//0070DC40
procedure TSynDeviceCtrl.BulkTransaction(ulWriteLength:Integer; var write:PSafeArray; var read:PSafeArray; ulReadLength:Integer);
begin
{*
 0070DC40    push        ebp
 0070DC41    mov         ebp,esp
 0070DC43    push        0
 0070DC45    push        ebx
 0070DC46    push        esi
 0070DC47    push        edi
 0070DC48    mov         edi,ecx
 0070DC4A    mov         esi,edx
 0070DC4C    mov         ebx,eax
 0070DC4E    xor         eax,eax
 0070DC50    push        ebp
 0070DC51    push        70DC94
 0070DC56    push        dword ptr fs:[eax]
 0070DC59    mov         dword ptr fs:[eax],esp
 0070DC5C    mov         eax,dword ptr [ebp+8]
 0070DC5F    push        eax
 0070DC60    mov         eax,dword ptr [ebp+0C]
 0070DC63    push        eax
 0070DC64    push        edi
 0070DC65    push        esi
 0070DC66    lea         edx,[ebp-4]
 0070DC69    mov         eax,ebx
 0070DC6B    call        0070D7EC
 0070DC70    mov         eax,dword ptr [ebp-4]
 0070DC73    push        eax
 0070DC74    mov         eax,dword ptr [eax]
 0070DC76    call        dword ptr [eax+4C]
 0070DC79    call        @CheckAutoResult
 0070DC7E    xor         eax,eax
 0070DC80    pop         edx
 0070DC81    pop         ecx
 0070DC82    pop         ecx
 0070DC83    mov         dword ptr fs:[eax],edx
 0070DC86    push        70DC9B
 0070DC8B    lea         eax,[ebp-4]
 0070DC8E    call        @IntfClear
 0070DC93    ret
>0070DC94    jmp         @HandleFinally
>0070DC99    jmp         0070DC8B
 0070DC9B    pop         edi
 0070DC9C    pop         esi
 0070DC9D    pop         ebx
 0070DC9E    pop         ecx
 0070DC9F    pop         ebp
 0070DCA0    ret         8
*}
end;

//0070DCA4
procedure TSynDeviceCtrl.DiagnosticTransaction(ulWriteLength:Integer; var write:PSafeArray; var read:PSafeArray; ulReadLength:Integer);
begin
{*
 0070DCA4    push        ebp
 0070DCA5    mov         ebp,esp
 0070DCA7    push        0
 0070DCA9    push        ebx
 0070DCAA    push        esi
 0070DCAB    push        edi
 0070DCAC    mov         edi,ecx
 0070DCAE    mov         esi,edx
 0070DCB0    mov         ebx,eax
 0070DCB2    xor         eax,eax
 0070DCB4    push        ebp
 0070DCB5    push        70DCF8
 0070DCBA    push        dword ptr fs:[eax]
 0070DCBD    mov         dword ptr fs:[eax],esp
 0070DCC0    mov         eax,dword ptr [ebp+8]
 0070DCC3    push        eax
 0070DCC4    mov         eax,dword ptr [ebp+0C]
 0070DCC7    push        eax
 0070DCC8    push        edi
 0070DCC9    push        esi
 0070DCCA    lea         edx,[ebp-4]
 0070DCCD    mov         eax,ebx
 0070DCCF    call        0070D7EC
 0070DCD4    mov         eax,dword ptr [ebp-4]
 0070DCD7    push        eax
 0070DCD8    mov         eax,dword ptr [eax]
 0070DCDA    call        dword ptr [eax+50]
 0070DCDD    call        @CheckAutoResult
 0070DCE2    xor         eax,eax
 0070DCE4    pop         edx
 0070DCE5    pop         ecx
 0070DCE6    pop         ecx
 0070DCE7    mov         dword ptr fs:[eax],edx
 0070DCEA    push        70DCFF
 0070DCEF    lea         eax,[ebp-4]
 0070DCF2    call        @IntfClear
 0070DCF7    ret
>0070DCF8    jmp         @HandleFinally
>0070DCFD    jmp         0070DCEF
 0070DCFF    pop         edi
 0070DD00    pop         esi
 0070DD01    pop         ebx
 0070DD02    pop         ecx
 0070DD03    pop         ebp
 0070DD04    ret         8
*}
end;

//0070DD08
function TSynDeviceCtrl.GetAddressableProperty(eProperty:TOleEnum; lAddress:Integer):Integer;
begin
{*
 0070DD08    push        ebp
 0070DD09    mov         ebp,esp
 0070DD0B    add         esp,0FFFFFFF8
 0070DD0E    push        ebx
 0070DD0F    push        esi
 0070DD10    push        edi
 0070DD11    xor         ebx,ebx
 0070DD13    mov         dword ptr [ebp-8],ebx
 0070DD16    mov         edi,ecx
 0070DD18    mov         esi,edx
 0070DD1A    mov         ebx,eax
 0070DD1C    xor         eax,eax
 0070DD1E    push        ebp
 0070DD1F    push        70DD61
 0070DD24    push        dword ptr fs:[eax]
 0070DD27    mov         dword ptr fs:[eax],esp
 0070DD2A    lea         eax,[ebp-4]
 0070DD2D    push        eax
 0070DD2E    push        edi
 0070DD2F    push        esi
 0070DD30    lea         edx,[ebp-8]
 0070DD33    mov         eax,ebx
 0070DD35    call        0070D7EC
 0070DD3A    mov         eax,dword ptr [ebp-8]
 0070DD3D    push        eax
 0070DD3E    mov         eax,dword ptr [eax]
 0070DD40    call        dword ptr [eax+54]
 0070DD43    call        @CheckAutoResult
 0070DD48    mov         ebx,dword ptr [ebp-4]
 0070DD4B    xor         eax,eax
 0070DD4D    pop         edx
 0070DD4E    pop         ecx
 0070DD4F    pop         ecx
 0070DD50    mov         dword ptr fs:[eax],edx
 0070DD53    push        70DD68
 0070DD58    lea         eax,[ebp-8]
 0070DD5B    call        @IntfClear
 0070DD60    ret
>0070DD61    jmp         @HandleFinally
>0070DD66    jmp         0070DD58
 0070DD68    mov         eax,ebx
 0070DD6A    pop         edi
 0070DD6B    pop         esi
 0070DD6C    pop         ebx
 0070DD6D    pop         ecx
 0070DD6E    pop         ecx
 0070DD6F    pop         ebp
 0070DD70    ret
*}
end;

//0070DD74
procedure TSynDeviceCtrl.SetAddressableProperty(eProperty:TOleEnum; lAddress:Integer; newVal:Integer);
begin
{*
 0070DD74    push        ebp
 0070DD75    mov         ebp,esp
 0070DD77    push        0
 0070DD79    push        ebx
 0070DD7A    push        esi
 0070DD7B    push        edi
 0070DD7C    mov         edi,ecx
 0070DD7E    mov         esi,edx
 0070DD80    mov         ebx,eax
 0070DD82    xor         eax,eax
 0070DD84    push        ebp
 0070DD85    push        70DDC4
 0070DD8A    push        dword ptr fs:[eax]
 0070DD8D    mov         dword ptr fs:[eax],esp
 0070DD90    mov         eax,dword ptr [ebp+8]
 0070DD93    push        eax
 0070DD94    push        edi
 0070DD95    push        esi
 0070DD96    lea         edx,[ebp-4]
 0070DD99    mov         eax,ebx
 0070DD9B    call        0070D7EC
 0070DDA0    mov         eax,dword ptr [ebp-4]
 0070DDA3    push        eax
 0070DDA4    mov         eax,dword ptr [eax]
 0070DDA6    call        dword ptr [eax+58]
 0070DDA9    call        @CheckAutoResult
 0070DDAE    xor         eax,eax
 0070DDB0    pop         edx
 0070DDB1    pop         ecx
 0070DDB2    pop         ecx
 0070DDB3    mov         dword ptr fs:[eax],edx
 0070DDB6    push        70DDCB
 0070DDBB    lea         eax,[ebp-4]
 0070DDBE    call        @IntfClear
 0070DDC3    ret
>0070DDC4    jmp         @HandleFinally
>0070DDC9    jmp         0070DDBB
 0070DDCB    pop         edi
 0070DDCC    pop         esi
 0070DDCD    pop         ebx
 0070DDCE    pop         ecx
 0070DDCF    pop         ebp
 0070DDD0    ret         4
*}
end;

//0070DDD4
procedure TSynDeviceCtrl.ForceMotionWithWheel(lDeltaX:Integer; lDeltaY:Integer; lDeltaWheel:Integer; lButtonState:Integer);
begin
{*
 0070DDD4    push        ebp
 0070DDD5    mov         ebp,esp
 0070DDD7    push        0
 0070DDD9    push        ebx
 0070DDDA    push        esi
 0070DDDB    push        edi
 0070DDDC    mov         edi,ecx
 0070DDDE    mov         esi,edx
 0070DDE0    mov         ebx,eax
 0070DDE2    xor         eax,eax
 0070DDE4    push        ebp
 0070DDE5    push        70DE28
 0070DDEA    push        dword ptr fs:[eax]
 0070DDED    mov         dword ptr fs:[eax],esp
 0070DDF0    mov         eax,dword ptr [ebp+8]
 0070DDF3    push        eax
 0070DDF4    mov         eax,dword ptr [ebp+0C]
 0070DDF7    push        eax
 0070DDF8    push        edi
 0070DDF9    push        esi
 0070DDFA    lea         edx,[ebp-4]
 0070DDFD    mov         eax,ebx
 0070DDFF    call        0070D7EC
 0070DE04    mov         eax,dword ptr [ebp-4]
 0070DE07    push        eax
 0070DE08    mov         eax,dword ptr [eax]
 0070DE0A    call        dword ptr [eax+5C]
 0070DE0D    call        @CheckAutoResult
 0070DE12    xor         eax,eax
 0070DE14    pop         edx
 0070DE15    pop         ecx
 0070DE16    pop         ecx
 0070DE17    mov         dword ptr fs:[eax],edx
 0070DE1A    push        70DE2F
 0070DE1F    lea         eax,[ebp-4]
 0070DE22    call        @IntfClear
 0070DE27    ret
>0070DE28    jmp         @HandleFinally
>0070DE2D    jmp         0070DE1F
 0070DE2F    pop         edi
 0070DE30    pop         esi
 0070DE31    pop         ebx
 0070DE32    pop         ecx
 0070DE33    pop         ebp
 0070DE34    ret         8
*}
end;

//0070DE38
procedure sub_0070DE38;
begin
{*
 0070DE38    mov         edx,78C514
 0070DE3D    mov         dword ptr [eax+270],edx;TSynDisplayCtrl.FControlData:PControlData
 0070DE43    lea         edx,[eax+2F0];TSynDisplayCtrl.FOnMessage:TSynDisplayCtrlOnMessage
 0070DE49    sub         edx,eax
 0070DE4B    mov         dword ptr ds:[78C564],edx;gvar_0078C564
 0070DE51    ret
*}
end;

//0070DE54
{*procedure sub_0070DE54(?:?);
begin
 0070DE54    push        ebp
 0070DE55    mov         ebp,esp
 0070DE57    xor         ecx,ecx
 0070DE59    push        ecx
 0070DE5A    push        ecx
 0070DE5B    push        ecx
 0070DE5C    push        ecx
 0070DE5D    push        ecx
 0070DE5E    xor         eax,eax
 0070DE60    push        ebp
 0070DE61    push        70DEBB
 0070DE66    push        dword ptr fs:[eax]
 0070DE69    mov         dword ptr fs:[eax],esp
 0070DE6C    lea         edx,[ebp-14]
 0070DE6F    mov         eax,dword ptr [ebp+8]
 0070DE72    mov         eax,dword ptr [eax-4]
 0070DE75    call        TOleControl.GetOleObject
 0070DE7A    lea         edx,[ebp-14]
 0070DE7D    lea         eax,[ebp-4]
 0070DE80    call        @VarToIntf
 0070DE85    mov         edx,dword ptr [ebp-4]
 0070DE88    mov         eax,dword ptr [ebp+8]
 0070DE8B    mov         eax,dword ptr [eax-4]
 0070DE8E    add         eax,2F8
 0070DE93    mov         ecx,70DEC8;['{338CF912-683E-438E-9641-76AAD2D62E22}']
 0070DE98    call        @IntfCast
 0070DE9D    xor         eax,eax
 0070DE9F    pop         edx
 0070DEA0    pop         ecx
 0070DEA1    pop         ecx
 0070DEA2    mov         dword ptr fs:[eax],edx
 0070DEA5    push        70DEC2
 0070DEAA    lea         eax,[ebp-14]
 0070DEAD    call        @VarClr
 0070DEB2    lea         eax,[ebp-4]
 0070DEB5    call        @IntfClear
 0070DEBA    ret
>0070DEBB    jmp         @HandleFinally
>0070DEC0    jmp         0070DEAA
 0070DEC2    mov         esp,ebp
 0070DEC4    pop         ebp
 0070DEC5    ret
end;*}

//0070DED8
{*procedure sub_0070DED8(?:?);
begin
 0070DED8    push        ebp
 0070DED9    mov         ebp,esp
 0070DEDB    push        ecx
 0070DEDC    mov         dword ptr [ebp-4],eax
 0070DEDF    mov         eax,dword ptr [ebp-4]
 0070DEE2    cmp         dword ptr [eax+2F8],0
>0070DEE9    jne         0070DEF2
 0070DEEB    push        ebp
 0070DEEC    call        0070DE54
 0070DEF1    pop         ecx
 0070DEF2    pop         ecx
 0070DEF3    pop         ebp
 0070DEF4    ret
end;*}

//0070DEF8
{*procedure sub_0070DEF8(?:TSynDisplayCtrl; ?:?);
begin
 0070DEF8    push        ebx
 0070DEF9    push        esi
 0070DEFA    mov         esi,edx
 0070DEFC    mov         ebx,eax
 0070DEFE    mov         eax,ebx
 0070DF00    call        0070DED8
 0070DF05    mov         eax,esi
 0070DF07    mov         edx,dword ptr [ebx+2F8]
 0070DF0D    call        @IntfCopy
 0070DF12    pop         esi
 0070DF13    pop         ebx
 0070DF14    ret
end;*}

//0070DF18
function TSynDisplayCtrl.GetLongProperty(eProperty:TOleEnum):Integer;
begin
{*
 0070DF18    push        ebp
 0070DF19    mov         ebp,esp
 0070DF1B    add         esp,0FFFFFFF8
 0070DF1E    push        ebx
 0070DF1F    push        esi
 0070DF20    xor         ecx,ecx
 0070DF22    mov         dword ptr [ebp-8],ecx
 0070DF25    mov         esi,edx
 0070DF27    mov         ebx,eax
 0070DF29    xor         eax,eax
 0070DF2B    push        ebp
 0070DF2C    push        70DF6D
 0070DF31    push        dword ptr fs:[eax]
 0070DF34    mov         dword ptr fs:[eax],esp
 0070DF37    lea         eax,[ebp-4]
 0070DF3A    push        eax
 0070DF3B    push        esi
 0070DF3C    lea         edx,[ebp-8]
 0070DF3F    mov         eax,ebx
 0070DF41    call        0070DEF8
 0070DF46    mov         eax,dword ptr [ebp-8]
 0070DF49    push        eax
 0070DF4A    mov         eax,dword ptr [eax]
 0070DF4C    call        dword ptr [eax+1C]
 0070DF4F    call        @CheckAutoResult
 0070DF54    mov         ebx,dword ptr [ebp-4]
 0070DF57    xor         eax,eax
 0070DF59    pop         edx
 0070DF5A    pop         ecx
 0070DF5B    pop         ecx
 0070DF5C    mov         dword ptr fs:[eax],edx
 0070DF5F    push        70DF74
 0070DF64    lea         eax,[ebp-8]
 0070DF67    call        @IntfClear
 0070DF6C    ret
>0070DF6D    jmp         @HandleFinally
>0070DF72    jmp         0070DF64
 0070DF74    mov         eax,ebx
 0070DF76    pop         esi
 0070DF77    pop         ebx
 0070DF78    pop         ecx
 0070DF79    pop         ecx
 0070DF7A    pop         ebp
 0070DF7B    ret
*}
end;

//0070DF7C
procedure TSynDisplayCtrl.SetLongProperty(eProperty:TOleEnum; newVal:Integer);
begin
{*
 0070DF7C    push        ebp
 0070DF7D    mov         ebp,esp
 0070DF7F    push        0
 0070DF81    push        ebx
 0070DF82    push        esi
 0070DF83    push        edi
 0070DF84    mov         edi,ecx
 0070DF86    mov         esi,edx
 0070DF88    mov         ebx,eax
 0070DF8A    xor         eax,eax
 0070DF8C    push        ebp
 0070DF8D    push        70DFC8
 0070DF92    push        dword ptr fs:[eax]
 0070DF95    mov         dword ptr fs:[eax],esp
 0070DF98    push        edi
 0070DF99    push        esi
 0070DF9A    lea         edx,[ebp-4]
 0070DF9D    mov         eax,ebx
 0070DF9F    call        0070DEF8
 0070DFA4    mov         eax,dword ptr [ebp-4]
 0070DFA7    push        eax
 0070DFA8    mov         eax,dword ptr [eax]
 0070DFAA    call        dword ptr [eax+20]
 0070DFAD    call        @CheckAutoResult
 0070DFB2    xor         eax,eax
 0070DFB4    pop         edx
 0070DFB5    pop         ecx
 0070DFB6    pop         ecx
 0070DFB7    mov         dword ptr fs:[eax],edx
 0070DFBA    push        70DFCF
 0070DFBF    lea         eax,[ebp-4]
 0070DFC2    call        @IntfClear
 0070DFC7    ret
>0070DFC8    jmp         @HandleFinally
>0070DFCD    jmp         0070DFBF
 0070DFCF    pop         edi
 0070DFD0    pop         esi
 0070DFD1    pop         ebx
 0070DFD2    pop         ecx
 0070DFD3    pop         ebp
 0070DFD4    ret
*}
end;

//0070DFD8
procedure TSynDisplayCtrl.Select(lDeviceHandle:Integer);
begin
{*
 0070DFD8    push        ebp
 0070DFD9    mov         ebp,esp
 0070DFDB    push        0
 0070DFDD    push        ebx
 0070DFDE    push        esi
 0070DFDF    mov         esi,edx
 0070DFE1    mov         ebx,eax
 0070DFE3    xor         eax,eax
 0070DFE5    push        ebp
 0070DFE6    push        70E020
 0070DFEB    push        dword ptr fs:[eax]
 0070DFEE    mov         dword ptr fs:[eax],esp
 0070DFF1    push        esi
 0070DFF2    lea         edx,[ebp-4]
 0070DFF5    mov         eax,ebx
 0070DFF7    call        0070DEF8
 0070DFFC    mov         eax,dword ptr [ebp-4]
 0070DFFF    push        eax
 0070E000    mov         eax,dword ptr [eax]
 0070E002    call        dword ptr [eax+24]
 0070E005    call        @CheckAutoResult
 0070E00A    xor         eax,eax
 0070E00C    pop         edx
 0070E00D    pop         ecx
 0070E00E    pop         ecx
 0070E00F    mov         dword ptr fs:[eax],edx
 0070E012    push        70E027
 0070E017    lea         eax,[ebp-4]
 0070E01A    call        @IntfClear
 0070E01F    ret
>0070E020    jmp         @HandleFinally
>0070E025    jmp         0070E017
 0070E027    pop         esi
 0070E028    pop         ebx
 0070E029    pop         ecx
 0070E02A    pop         ebp
 0070E02B    ret
*}
end;

//0070E02C
procedure TSynDisplayCtrl.Flush(eMethod:TOleEnum);
begin
{*
 0070E02C    push        ebp
 0070E02D    mov         ebp,esp
 0070E02F    push        0
 0070E031    push        ebx
 0070E032    push        esi
 0070E033    mov         esi,edx
 0070E035    mov         ebx,eax
 0070E037    xor         eax,eax
 0070E039    push        ebp
 0070E03A    push        70E074
 0070E03F    push        dword ptr fs:[eax]
 0070E042    mov         dword ptr fs:[eax],esp
 0070E045    push        esi
 0070E046    lea         edx,[ebp-4]
 0070E049    mov         eax,ebx
 0070E04B    call        0070DEF8
 0070E050    mov         eax,dword ptr [ebp-4]
 0070E053    push        eax
 0070E054    mov         eax,dword ptr [eax]
 0070E056    call        dword ptr [eax+28]
 0070E059    call        @CheckAutoResult
 0070E05E    xor         eax,eax
 0070E060    pop         edx
 0070E061    pop         ecx
 0070E062    pop         ecx
 0070E063    mov         dword ptr fs:[eax],edx
 0070E066    push        70E07B
 0070E06B    lea         eax,[ebp-4]
 0070E06E    call        @IntfClear
 0070E073    ret
>0070E074    jmp         @HandleFinally
>0070E079    jmp         0070E06B
 0070E07B    pop         esi
 0070E07C    pop         ebx
 0070E07D    pop         ecx
 0070E07E    pop         ebp
 0070E07F    ret
*}
end;

//0070E080
procedure TSynDisplayCtrl.Acquire(eMethod:TOleEnum);
begin
{*
 0070E080    push        ebp
 0070E081    mov         ebp,esp
 0070E083    push        0
 0070E085    push        ebx
 0070E086    push        esi
 0070E087    mov         esi,edx
 0070E089    mov         ebx,eax
 0070E08B    xor         eax,eax
 0070E08D    push        ebp
 0070E08E    push        70E0C8
 0070E093    push        dword ptr fs:[eax]
 0070E096    mov         dword ptr fs:[eax],esp
 0070E099    push        esi
 0070E09A    lea         edx,[ebp-4]
 0070E09D    mov         eax,ebx
 0070E09F    call        0070DEF8
 0070E0A4    mov         eax,dword ptr [ebp-4]
 0070E0A7    push        eax
 0070E0A8    mov         eax,dword ptr [eax]
 0070E0AA    call        dword ptr [eax+2C]
 0070E0AD    call        @CheckAutoResult
 0070E0B2    xor         eax,eax
 0070E0B4    pop         edx
 0070E0B5    pop         ecx
 0070E0B6    pop         ecx
 0070E0B7    mov         dword ptr fs:[eax],edx
 0070E0BA    push        70E0CF
 0070E0BF    lea         eax,[ebp-4]
 0070E0C2    call        @IntfClear
 0070E0C7    ret
>0070E0C8    jmp         @HandleFinally
>0070E0CD    jmp         0070E0BF
 0070E0CF    pop         esi
 0070E0D0    pop         ebx
 0070E0D1    pop         ecx
 0070E0D2    pop         ebp
 0070E0D3    ret
*}
end;

//0070E0D4
procedure TSynDisplayCtrl.Unacquire;
begin
{*
 0070E0D4    push        ebp
 0070E0D5    mov         ebp,esp
 0070E0D7    push        0
 0070E0D9    push        ebx
 0070E0DA    mov         ebx,eax
 0070E0DC    xor         eax,eax
 0070E0DE    push        ebp
 0070E0DF    push        70E118
 0070E0E4    push        dword ptr fs:[eax]
 0070E0E7    mov         dword ptr fs:[eax],esp
 0070E0EA    lea         edx,[ebp-4]
 0070E0ED    mov         eax,ebx
 0070E0EF    call        0070DEF8
 0070E0F4    mov         eax,dword ptr [ebp-4]
 0070E0F7    push        eax
 0070E0F8    mov         eax,dword ptr [eax]
 0070E0FA    call        dword ptr [eax+30]
 0070E0FD    call        @CheckAutoResult
 0070E102    xor         eax,eax
 0070E104    pop         edx
 0070E105    pop         ecx
 0070E106    pop         ecx
 0070E107    mov         dword ptr fs:[eax],edx
 0070E10A    push        70E11F
 0070E10F    lea         eax,[ebp-4]
 0070E112    call        @IntfClear
 0070E117    ret
>0070E118    jmp         @HandleFinally
>0070E11D    jmp         0070E10F
 0070E11F    pop         ebx
 0070E120    pop         ecx
 0070E121    pop         ebp
 0070E122    ret
*}
end;

//0070E124
procedure TSynDisplayCtrl.SendPicture(pVal:IDispatch);
begin
{*
 0070E124    push        ebp
 0070E125    mov         ebp,esp
 0070E127    push        0
 0070E129    push        ebx
 0070E12A    push        esi
 0070E12B    mov         esi,edx
 0070E12D    mov         ebx,eax
 0070E12F    xor         eax,eax
 0070E131    push        ebp
 0070E132    push        70E16C
 0070E137    push        dword ptr fs:[eax]
 0070E13A    mov         dword ptr fs:[eax],esp
 0070E13D    push        esi
 0070E13E    lea         edx,[ebp-4]
 0070E141    mov         eax,ebx
 0070E143    call        0070DEF8
 0070E148    mov         eax,dword ptr [ebp-4]
 0070E14B    push        eax
 0070E14C    mov         eax,dword ptr [eax]
 0070E14E    call        dword ptr [eax+34]
 0070E151    call        @CheckAutoResult
 0070E156    xor         eax,eax
 0070E158    pop         edx
 0070E159    pop         ecx
 0070E15A    pop         ecx
 0070E15B    mov         dword ptr fs:[eax],edx
 0070E15E    push        70E173
 0070E163    lea         eax,[ebp-4]
 0070E166    call        @IntfClear
 0070E16B    ret
>0070E16C    jmp         @HandleFinally
>0070E171    jmp         0070E163
 0070E173    pop         esi
 0070E174    pop         ebx
 0070E175    pop         ecx
 0070E176    pop         ebp
 0070E177    ret
*}
end;

//0070E178
procedure TSynDisplayCtrl.Activate;
begin
{*
 0070E178    push        ebp
 0070E179    mov         ebp,esp
 0070E17B    push        0
 0070E17D    push        ebx
 0070E17E    mov         ebx,eax
 0070E180    xor         eax,eax
 0070E182    push        ebp
 0070E183    push        70E1BC
 0070E188    push        dword ptr fs:[eax]
 0070E18B    mov         dword ptr fs:[eax],esp
 0070E18E    lea         edx,[ebp-4]
 0070E191    mov         eax,ebx
 0070E193    call        0070DEF8
 0070E198    mov         eax,dword ptr [ebp-4]
 0070E19B    push        eax
 0070E19C    mov         eax,dword ptr [eax]
 0070E19E    call        dword ptr [eax+48]
 0070E1A1    call        @CheckAutoResult
 0070E1A6    xor         eax,eax
 0070E1A8    pop         edx
 0070E1A9    pop         ecx
 0070E1AA    pop         ecx
 0070E1AB    mov         dword ptr fs:[eax],edx
 0070E1AE    push        70E1C3
 0070E1B3    lea         eax,[ebp-4]
 0070E1B6    call        @IntfClear
 0070E1BB    ret
>0070E1BC    jmp         @HandleFinally
>0070E1C1    jmp         0070E1B3
 0070E1C3    pop         ebx
 0070E1C4    pop         ecx
 0070E1C5    pop         ebp
 0070E1C6    ret
*}
end;

//0070E1C8
procedure TSynDisplayCtrl.Deactivate;
begin
{*
 0070E1C8    push        ebp
 0070E1C9    mov         ebp,esp
 0070E1CB    push        0
 0070E1CD    push        ebx
 0070E1CE    mov         ebx,eax
 0070E1D0    xor         eax,eax
 0070E1D2    push        ebp
 0070E1D3    push        70E20C
 0070E1D8    push        dword ptr fs:[eax]
 0070E1DB    mov         dword ptr fs:[eax],esp
 0070E1DE    lea         edx,[ebp-4]
 0070E1E1    mov         eax,ebx
 0070E1E3    call        0070DEF8
 0070E1E8    mov         eax,dword ptr [ebp-4]
 0070E1EB    push        eax
 0070E1EC    mov         eax,dword ptr [eax]
 0070E1EE    call        dword ptr [eax+4C]
 0070E1F1    call        @CheckAutoResult
 0070E1F6    xor         eax,eax
 0070E1F8    pop         edx
 0070E1F9    pop         ecx
 0070E1FA    pop         ecx
 0070E1FB    mov         dword ptr fs:[eax],edx
 0070E1FE    push        70E213
 0070E203    lea         eax,[ebp-4]
 0070E206    call        @IntfClear
 0070E20B    ret
>0070E20C    jmp         @HandleFinally
>0070E211    jmp         0070E203
 0070E213    pop         ebx
 0070E214    pop         ecx
 0070E215    pop         ebp
 0070E216    ret
*}
end;

//0070ED2C
constructor TTouchPadController.Create(AOwner:TWinControl);
begin
{*
 0070ED2C    push        ebp
 0070ED2D    mov         ebp,esp
 0070ED2F    add         esp,0FFFFFFF8
 0070ED32    push        ebx
 0070ED33    push        esi
 0070ED34    push        edi
 0070ED35    test        dl,dl
>0070ED37    je          0070ED41
 0070ED39    add         esp,0FFFFFFF0
 0070ED3C    call        @ClassCreate
 0070ED41    mov         ebx,ecx
 0070ED43    mov         byte ptr [ebp-5],dl
 0070ED46    mov         dword ptr [ebp-4],eax
 0070ED49    xor         eax,eax
 0070ED4B    push        ebp
 0070ED4C    push        70EECF
 0070ED51    push        dword ptr fs:[eax]
 0070ED54    mov         dword ptr fs:[eax],esp
 0070ED57    mov         ecx,ebx
 0070ED59    mov         dl,1
 0070ED5B    mov         eax,[0070B74C];TSynAPICtrl
 0070ED60    call        TOleControl.Create;TSynAPICtrl.Create
 0070ED65    mov         esi,eax
 0070ED67    mov         eax,dword ptr [ebp-4]
 0070ED6A    mov         dword ptr [eax+68],esi;TTouchPadController.SynAPICtrl1:TSynAPICtrl
 0070ED6D    mov         eax,esi
 0070ED6F    mov         edx,ebx
 0070ED71    mov         ecx,dword ptr [eax]
 0070ED73    call        dword ptr [ecx+78];TOleControl.SetParent
 0070ED76    mov         ecx,ebx
 0070ED78    mov         dl,1
 0070ED7A    mov         eax,[0070C334];TSynDeviceCtrl
 0070ED7F    call        TOleControl.Create;TSynDeviceCtrl.Create
 0070ED84    mov         esi,eax
 0070ED86    mov         eax,dword ptr [ebp-4]
 0070ED89    mov         dword ptr [eax+6C],esi;TTouchPadController.SynDeviceCtrl1:TSynDeviceCtrl
 0070ED8C    mov         eax,esi
 0070ED8E    mov         edx,ebx
 0070ED90    mov         ecx,dword ptr [eax]
 0070ED92    call        dword ptr [ecx+78];TOleControl.SetParent
 0070ED95    mov         ecx,ebx
 0070ED97    mov         dl,1
 0070ED99    mov         eax,[0070CC0C];TSynDisplayCtrl
 0070ED9E    call        TOleControl.Create;TSynDisplayCtrl.Create
 0070EDA3    mov         esi,eax
 0070EDA5    mov         eax,dword ptr [ebp-4]
 0070EDA8    mov         dword ptr [eax+70],esi;TTouchPadController.SynDisplayCtrl1:TSynDisplayCtrl
 0070EDAB    mov         eax,esi
 0070EDAD    mov         edx,ebx
 0070EDAF    mov         ecx,dword ptr [eax]
 0070EDB1    call        dword ptr [ecx+78];TOleControl.SetParent
 0070EDB4    mov         ecx,ebx
 0070EDB6    mov         dl,1
 0070EDB8    mov         eax,[0070BCC0];TSynPacketCtrl
 0070EDBD    call        TOleControl.Create;TSynPacketCtrl.Create
 0070EDC2    mov         esi,eax
 0070EDC4    mov         eax,dword ptr [ebp-4]
 0070EDC7    mov         dword ptr [eax+74],esi;TTouchPadController.SynPacketCtrl1:TSynPacketCtrl
 0070EDCA    mov         eax,esi
 0070EDCC    mov         edx,ebx
 0070EDCE    mov         ecx,dword ptr [eax]
 0070EDD0    call        dword ptr [ecx+78];TOleControl.SetParent
 0070EDD3    mov         eax,dword ptr [ebp-4]
 0070EDD6    mov         eax,dword ptr [eax+68];TTouchPadController.SynAPICtrl1:TSynAPICtrl
 0070EDD9    call        TSynAPICtrl.Initialize
 0070EDDE    mov         eax,dword ptr [ebp-4]
 0070EDE1    mov         eax,dword ptr [eax+68];TTouchPadController.SynAPICtrl1:TSynAPICtrl
 0070EDE4    call        TSynAPICtrl.Activate
 0070EDE9    push        0FF
 0070EDEB    mov         eax,dword ptr [ebp-4]
 0070EDEE    mov         eax,dword ptr [eax+68];TTouchPadController.SynAPICtrl1:TSynAPICtrl
 0070EDF1    mov         ecx,2
 0070EDF6    xor         edx,edx
 0070EDF8    call        TSynAPICtrl.FindDevice
 0070EDFD    mov         ebx,eax
 0070EDFF    mov         eax,dword ptr [ebp-4]
 0070EE02    mov         dword ptr [eax+4],ebx;TTouchPadController.DeviceHandle:Integer
 0070EE05    inc         ebx
>0070EE06    jne         0070EE14
 0070EE08    mov         eax,dword ptr [ebp-4]
 0070EE0B    mov         byte ptr [eax+1C],0;TTouchPadController.Exists:Boolean
 0070EE0F    call        @Halt0
 0070EE14    mov         eax,dword ptr [ebp-4]
 0070EE17    mov         edx,dword ptr [eax+4];TTouchPadController.DeviceHandle:Integer
 0070EE1A    mov         eax,dword ptr [ebp-4]
 0070EE1D    mov         eax,dword ptr [eax+6C];TTouchPadController.SynDeviceCtrl1:TSynDeviceCtrl
 0070EE20    call        TSynDeviceCtrl.Select
 0070EE25    mov         eax,dword ptr [ebp-4]
 0070EE28    mov         eax,dword ptr [eax+6C];TTouchPadController.SynDeviceCtrl1:TSynDeviceCtrl
 0070EE2B    call        TSynDeviceCtrl.Activate
 0070EE30    mov         eax,dword ptr [ebp-4]
 0070EE33    mov         eax,dword ptr [eax+6C];TTouchPadController.SynDeviceCtrl1:TSynDeviceCtrl
 0070EE36    mov         edx,10000128
 0070EE3B    call        TSynDeviceCtrl.GetLongProperty
 0070EE40    mov         edx,dword ptr [ebp-4]
 0070EE43    mov         dword ptr [edx+8],eax;TTouchPadController.ZTouchThreshold:Integer
 0070EE46    mov         eax,dword ptr [ebp-4]
 0070EE49    mov         eax,dword ptr [eax+6C];TTouchPadController.SynDeviceCtrl1:TSynDeviceCtrl
 0070EE4C    mov         edx,10000115
 0070EE51    call        TSynDeviceCtrl.GetLongProperty
 0070EE56    mov         edx,dword ptr [ebp-4]
 0070EE59    mov         dword ptr [edx+0C],eax;TTouchPadController.Xmin:Integer
 0070EE5C    mov         eax,dword ptr [ebp-4]
 0070EE5F    mov         eax,dword ptr [eax+6C];TTouchPadController.SynDeviceCtrl1:TSynDeviceCtrl
 0070EE62    mov         edx,10000117
 0070EE67    call        TSynDeviceCtrl.GetLongProperty
 0070EE6C    mov         edx,dword ptr [ebp-4]
 0070EE6F    mov         dword ptr [edx+10],eax;TTouchPadController.Xmax:Integer
 0070EE72    mov         eax,dword ptr [ebp-4]
 0070EE75    mov         eax,dword ptr [eax+6C];TTouchPadController.SynDeviceCtrl1:TSynDeviceCtrl
 0070EE78    mov         edx,10000116
 0070EE7D    call        TSynDeviceCtrl.GetLongProperty
 0070EE82    mov         edx,dword ptr [ebp-4]
 0070EE85    mov         dword ptr [edx+14],eax;TTouchPadController.Ymin:Integer
 0070EE88    mov         eax,dword ptr [ebp-4]
 0070EE8B    mov         eax,dword ptr [eax+6C];TTouchPadController.SynDeviceCtrl1:TSynDeviceCtrl
 0070EE8E    mov         edx,10000118
 0070EE93    call        TSynDeviceCtrl.GetLongProperty
 0070EE98    mov         edx,dword ptr [ebp-4]
 0070EE9B    mov         dword ptr [edx+18],eax;TTouchPadController.Ymax:Integer
 0070EE9E    mov         eax,dword ptr [ebp-4]
 0070EEA1    mov         eax,dword ptr [eax+6C];TTouchPadController.SynDeviceCtrl1:TSynDeviceCtrl
 0070EEA4    mov         edx,dword ptr [ebp-4]
 0070EEA7    mov         dword ptr [eax+2F4],edx;TSynDeviceCtrl.?f2F4:TTouchPadController
 0070EEAD    mov         dword ptr [eax+2F0],70EF58;TSynDeviceCtrl.FOnPacket:TNotifyEvent TTouchPadController.DoP...
 0070EEB7    mov         eax,dword ptr [ebp-4]
 0070EEBA    mov         byte ptr [eax+1C],1;TTouchPadController.Exists:Boolean
 0070EEBE    mov         eax,dword ptr [ebp-4]
 0070EEC1    mov         byte ptr [eax+1E],0;TTouchPadController.Swallowed:Boolean
 0070EEC5    xor         eax,eax
 0070EEC7    pop         edx
 0070EEC8    pop         ecx
 0070EEC9    pop         ecx
 0070EECA    mov         dword ptr fs:[eax],edx
>0070EECD    jmp         0070EEE0
>0070EECF    jmp         @HandleAnyException
 0070EED4    mov         eax,dword ptr [ebp-4]
 0070EED7    mov         byte ptr [eax+1C],0;TTouchPadController.Exists:Boolean
 0070EEDB    call        @DoneExcept
 0070EEE0    mov         eax,dword ptr [ebp-4]
 0070EEE3    cmp         byte ptr [ebp-5],0
>0070EEE7    je          0070EEF8
 0070EEE9    call        @AfterConstruction
 0070EEEE    pop         dword ptr fs:[0]
 0070EEF5    add         esp,0C
 0070EEF8    mov         eax,dword ptr [ebp-4]
 0070EEFB    pop         edi
 0070EEFC    pop         esi
 0070EEFD    pop         ebx
 0070EEFE    pop         ecx
 0070EEFF    pop         ecx
 0070EF00    pop         ebp
 0070EF01    ret
*}
end;

//0070EF04
destructor TTouchPadController.Destroy();
begin
{*
 0070EF04    push        ebx
 0070EF05    push        esi
 0070EF06    call        @BeforeDestruction
 0070EF0B    mov         ebx,edx
 0070EF0D    mov         esi,eax
 0070EF0F    cmp         byte ptr [esi+1E],0;TTouchPadController.Swallowed:Boolean
>0070EF13    je          0070EF1D
 0070EF15    mov         eax,dword ptr [esi+6C];TTouchPadController.SynDeviceCtrl1:TSynDeviceCtrl
 0070EF18    call        TSynDeviceCtrl.Unacquire
 0070EF1D    mov         eax,dword ptr [esi+68];TTouchPadController.SynAPICtrl1:TSynAPICtrl
 0070EF20    call        TObject.Free
 0070EF25    mov         eax,dword ptr [esi+6C];TTouchPadController.SynDeviceCtrl1:TSynDeviceCtrl
 0070EF28    call        TObject.Free
 0070EF2D    mov         eax,dword ptr [esi+70];TTouchPadController.SynDisplayCtrl1:TSynDisplayCtrl
 0070EF30    call        TObject.Free
 0070EF35    mov         eax,dword ptr [esi+74];TTouchPadController.SynPacketCtrl1:TSynPacketCtrl
 0070EF38    call        TObject.Free
 0070EF3D    mov         edx,ebx
 0070EF3F    and         dl,0FC
 0070EF42    mov         eax,esi
 0070EF44    call        TObject.Destroy
 0070EF49    test        bl,bl
>0070EF4B    jle         0070EF54
 0070EF4D    mov         eax,esi
 0070EF4F    call        @ClassDestroy
 0070EF54    pop         esi
 0070EF55    pop         ebx
 0070EF56    ret
*}
end;

//0070EF58
procedure TTouchPadController.DoPacket(Sender:TObject);
begin
{*
 0070EF58    push        ebp
 0070EF59    mov         ebp,esp
 0070EF5B    add         esp,0FFFFFFF4
 0070EF5E    push        ebx
 0070EF5F    xor         ecx,ecx
 0070EF61    mov         dword ptr [ebp-4],ecx
 0070EF64    mov         ebx,eax
 0070EF66    xor         eax,eax
 0070EF68    push        ebp
 0070EF69    push        70F0BE
 0070EF6E    push        dword ptr fs:[eax]
 0070EF71    mov         dword ptr fs:[eax],esp
 0070EF74    lea         edx,[ebp-4]
 0070EF77    mov         eax,dword ptr [ebx+74];TTouchPadController.SynPacketCtrl1:TSynPacketCtrl
 0070EF7A    call        0070D5F4
 0070EF7F    mov         edx,dword ptr [ebp-4]
 0070EF82    mov         eax,dword ptr [ebx+6C];TTouchPadController.SynDeviceCtrl1:TSynDeviceCtrl
 0070EF85    call        TSynDeviceCtrl.LoadPacket
 0070EF8A    mov         edx,14
 0070EF8F    mov         eax,dword ptr [ebx+74];TTouchPadController.SynPacketCtrl1:TSynPacketCtrl
 0070EF92    call        TOleControl.GetIntegerProp
 0070EF97    mov         dword ptr [ebx+48],eax;TTouchPadController.FingerState:Integer
 0070EF9A    mov         edx,16
 0070EF9F    mov         eax,dword ptr [ebx+74];TTouchPadController.SynPacketCtrl1:TSynPacketCtrl
 0070EFA2    call        TOleControl.GetIntegerProp
 0070EFA7    mov         dword ptr [ebx+4C],eax;TTouchPadController.ButtonState:Integer
 0070EFAA    mov         edx,15
 0070EFAF    mov         eax,dword ptr [ebx+74];TTouchPadController.SynPacketCtrl1:TSynPacketCtrl
 0070EFB2    call        TOleControl.GetIntegerProp
 0070EFB7    mov         dword ptr [ebx+50],eax;TTouchPadController.ExtendedState:Integer
 0070EFBA    mov         edx,0B
 0070EFBF    mov         eax,dword ptr [ebx+74];TTouchPadController.SynPacketCtrl1:TSynPacketCtrl
 0070EFC2    call        TOleControl.GetIntegerProp
 0070EFC7    mov         dword ptr [ebx+24],eax;TTouchPadController.x:Integer
 0070EFCA    mov         edx,0C
 0070EFCF    mov         eax,dword ptr [ebx+74];TTouchPadController.SynPacketCtrl1:TSynPacketCtrl
 0070EFD2    call        TOleControl.GetIntegerProp
 0070EFD7    mov         dword ptr [ebx+28],eax;TTouchPadController.y:Integer
 0070EFDA    mov         edx,0D
 0070EFDF    mov         eax,dword ptr [ebx+74];TTouchPadController.SynPacketCtrl1:TSynPacketCtrl
 0070EFE2    call        TOleControl.GetIntegerProp
 0070EFE7    mov         dword ptr [ebx+2C],eax;TTouchPadController.z:Integer
 0070EFEA    mov         eax,dword ptr [ebx+24];TTouchPadController.x:Integer
 0070EFED    cmp         eax,dword ptr [ebx+0C];TTouchPadController.Xmin:Integer
>0070EFF0    jne         0070F000
 0070EFF2    mov         eax,dword ptr [ebx+28];TTouchPadController.y:Integer
 0070EFF5    cmp         eax,dword ptr [ebx+14];TTouchPadController.Ymin:Integer
>0070EFF8    jne         0070F000
 0070EFFA    mov         byte ptr [ebx+1D],0;TTouchPadController.Touching:Boolean
>0070EFFE    jmp         0070F048
 0070F000    mov         byte ptr [ebx+1D],1;TTouchPadController.Touching:Boolean
 0070F004    mov         edx,dword ptr [ebx+24];TTouchPadController.x:Integer
 0070F007    mov         eax,dword ptr [ebx+0C];TTouchPadController.Xmin:Integer
 0070F00A    sub         edx,eax
 0070F00C    mov         dword ptr [ebp-8],edx
 0070F00F    fild        dword ptr [ebp-8]
 0070F012    mov         edx,dword ptr [ebx+10];TTouchPadController.Xmax:Integer
 0070F015    sub         edx,eax
 0070F017    mov         dword ptr [ebp-0C],edx
 0070F01A    fild        dword ptr [ebp-0C]
 0070F01D    fdivp       st(1),st
 0070F01F    fstp        qword ptr [ebx+58];TTouchPadController.fx:Double
 0070F022    wait
 0070F023    mov         edx,dword ptr [ebx+28];TTouchPadController.y:Integer
 0070F026    mov         eax,dword ptr [ebx+14];TTouchPadController.Ymin:Integer
 0070F029    sub         edx,eax
 0070F02B    mov         dword ptr [ebp-8],edx
 0070F02E    fild        dword ptr [ebp-8]
 0070F031    mov         edx,dword ptr [ebx+18];TTouchPadController.Ymax:Integer
 0070F034    sub         edx,eax
 0070F036    mov         dword ptr [ebp-0C],edx
 0070F039    fild        dword ptr [ebp-0C]
 0070F03C    fdivp       st(1),st
 0070F03E    fsubr       dword ptr ds:[70F0CC];1:Single
 0070F044    fstp        qword ptr [ebx+60];TTouchPadController.fy:Double
 0070F047    wait
 0070F048    mov         edx,0A
 0070F04D    mov         eax,dword ptr [ebx+74];TTouchPadController.SynPacketCtrl1:TSynPacketCtrl
 0070F050    call        TOleControl.GetIntegerProp
 0070F055    mov         dword ptr [ebx+30],eax;TTouchPadController.w:Integer
 0070F058    mov         edx,6
 0070F05D    mov         eax,dword ptr [ebx+74];TTouchPadController.SynPacketCtrl1:TSynPacketCtrl
 0070F060    call        TOleControl.GetIntegerProp
 0070F065    mov         dword ptr [ebx+3C],eax;TTouchPadController.xraw:Integer
 0070F068    mov         edx,7
 0070F06D    mov         eax,dword ptr [ebx+74];TTouchPadController.SynPacketCtrl1:TSynPacketCtrl
 0070F070    call        TOleControl.GetIntegerProp
 0070F075    mov         dword ptr [ebx+40],eax;TTouchPadController.yraw:Integer
 0070F078    mov         edx,8
 0070F07D    mov         eax,dword ptr [ebx+74];TTouchPadController.SynPacketCtrl1:TSynPacketCtrl
 0070F080    call        TOleControl.GetIntegerProp
 0070F085    mov         dword ptr [ebx+44],eax;TTouchPadController.zraw:Integer
 0070F088    mov         edx,17
 0070F08D    mov         eax,dword ptr [ebx+74];TTouchPadController.SynPacketCtrl1:TSynPacketCtrl
 0070F090    call        TOleControl.GetIntegerProp
 0070F095    mov         dword ptr [ebx+34],eax;TTouchPadController.zx:Integer
 0070F098    mov         edx,9
 0070F09D    mov         eax,dword ptr [ebx+74];TTouchPadController.SynPacketCtrl1:TSynPacketCtrl
 0070F0A0    call        TOleControl.GetIntegerProp
 0070F0A5    mov         dword ptr [ebx+38],eax;TTouchPadController.zy:Integer
 0070F0A8    xor         eax,eax
 0070F0AA    pop         edx
 0070F0AB    pop         ecx
 0070F0AC    pop         ecx
 0070F0AD    mov         dword ptr fs:[eax],edx
 0070F0B0    push        70F0C5
 0070F0B5    lea         eax,[ebp-4]
 0070F0B8    call        @IntfClear
 0070F0BD    ret
>0070F0BE    jmp         @HandleFinally
>0070F0C3    jmp         0070F0B5
 0070F0C5    pop         ebx
 0070F0C6    mov         esp,ebp
 0070F0C8    pop         ebp
 0070F0C9    ret
*}
end;

//0070F0D0
{*function sub_0070F0D0(?:string):?;
begin
 0070F0D0    push        ebp
 0070F0D1    mov         ebp,esp
 0070F0D3    add         esp,0FFFFFFF8
 0070F0D6    push        ebx
 0070F0D7    push        esi
 0070F0D8    push        edi
 0070F0D9    xor         edx,edx
 0070F0DB    mov         dword ptr [ebp-8],edx
 0070F0DE    mov         dword ptr [ebp-4],eax
 0070F0E1    mov         eax,dword ptr [ebp-4]
 0070F0E4    call        @UStrAddRef
 0070F0E9    xor         eax,eax
 0070F0EB    push        ebp
 0070F0EC    push        70F185
 0070F0F1    push        dword ptr fs:[eax]
 0070F0F4    mov         dword ptr fs:[eax],esp
 0070F0F7    xor         ebx,ebx
 0070F0F9    lea         eax,[ebp-8]
 0070F0FC    mov         edx,dword ptr [ebp-4]
 0070F0FF    call        @UStrLAsg
 0070F104    lea         eax,[ebp-8]
 0070F107    mov         edx,70F1A4;'Touchpad'
 0070F10C    call        004F9BD0
 0070F111    test        al,al
>0070F113    je          0070F16A
 0070F115    lea         eax,[ebp-8]
 0070F118    call        004F9D00
 0070F11D    mov         esi,eax
 0070F11F    lea         eax,[ebp-8]
 0070F122    mov         edx,70F1C4;'.'
 0070F127    call        004F9BD0
 0070F12C    test        al,al
>0070F12E    je          0070F16A
 0070F130    mov         eax,[008229F4];gvar_008229F4:TModuleTouchpad
 0070F135    mov         eax,dword ptr [eax+1C]
 0070F138    mov         edx,dword ptr [ebp-8]
 0070F13B    call        THashTable.Get
 0070F140    mov         edi,eax
 0070F142    test        edi,edi
>0070F144    jl          0070F16A
 0070F146    mov         dl,1
 0070F148    mov         eax,[0070E59C];TTouchpadValue
 0070F14D    call        TObject.Create;TTouchpadValue.Create
 0070F152    mov         ebx,eax
 0070F154    mov         dword ptr [ebx+20],edi;TTouchpadValue......................Item:Integer
 0070F157    test        esi,esi
>0070F159    jg          0070F160
 0070F15B    mov         esi,1
 0070F160    mov         dword ptr [ebx+18],esi;TTouchpadValue......................................................
 0070F163    mov         byte ptr ds:[8229EC],1;gvar_008229EC
 0070F16A    xor         eax,eax
 0070F16C    pop         edx
 0070F16D    pop         ecx
 0070F16E    pop         ecx
 0070F16F    mov         dword ptr fs:[eax],edx
 0070F172    push        70F18C
 0070F177    lea         eax,[ebp-8]
 0070F17A    mov         edx,2
 0070F17F    call        @UStrArrayClr
 0070F184    ret
>0070F185    jmp         @HandleFinally
>0070F18A    jmp         0070F177
 0070F18C    mov         eax,ebx
 0070F18E    pop         edi
 0070F18F    pop         esi
 0070F190    pop         ebx
 0070F191    pop         ecx
 0070F192    pop         ecx
 0070F193    pop         ebp
 0070F194    ret
end;*}

//0070F1C8
function TTouchpadValue.CanSet:Boolean;
begin
{*
 0070F1C8    xor         eax,eax
 0070F1CA    ret
*}
end;

//0070F1CC
procedure TTouchpadValue.CreateClone;
begin
{*
 0070F1CC    mov         dl,1
 0070F1CE    mov         eax,[0070E59C];TTouchpadValue
 0070F1D3    call        TObject.Create;TTouchpadValue.Create
 0070F1D8    ret
*}
end;

//0070F1DC
procedure TTouchpadValue.FillClone(c:TExpression);
begin
{*
 0070F1DC    push        ebx
 0070F1DD    push        esi
 0070F1DE    mov         esi,edx
 0070F1E0    mov         ebx,eax
 0070F1E2    mov         edx,esi
 0070F1E4    mov         eax,ebx
 0070F1E6    call        TExpression.FillClone
 0070F1EB    mov         eax,esi
 0070F1ED    mov         edx,dword ptr [ebx+20];TTouchpadValue.......................Item:Integer
 0070F1F0    mov         dword ptr [eax+20],edx
 0070F1F3    mov         edx,dword ptr [ebx+18];TTouchpadValue......................................................
 0070F1F6    mov         dword ptr [eax+18],edx
 0070F1F9    pop         esi
 0070F1FA    pop         ebx
 0070F1FB    ret
*}
end;

//0070F1FC
function TTouchpadValue.GetDataType:TDataType;
begin
{*
 0070F1FC    mov         eax,dword ptr [eax+20];TTouchpadValue........................Item:Integer
 0070F1FF    sub         eax,1
>0070F202    jb          0070F215
 0070F204    sub         eax,2
>0070F207    jb          0070F218
 0070F209    sub         eax,0A
>0070F20C    jb          0070F21B
 0070F20E    sub         eax,11
>0070F211    jb          0070F21E
>0070F213    jmp         0070F221
 0070F215    mov         al,3
 0070F217    ret
 0070F218    xor         eax,eax
 0070F21A    ret
 0070F21B    mov         al,2
 0070F21D    ret
 0070F21E    mov         al,3
 0070F220    ret
 0070F221    xor         eax,eax
 0070F223    ret
*}
end;

//0070F224
function TTouchpadValue.GetPerUnits1:TUnits;
begin
{*
 0070F224    mov         eax,dword ptr [eax+20];TTouchpadValue.........................Item:Integer
 0070F227    sub         eax,1
>0070F22A    jae         0070F22F
 0070F22C    xor         eax,eax
 0070F22E    ret
 0070F22F    xor         eax,eax
 0070F231    ret
*}
end;

//0070F234
function TTouchpadValue.GetPerUnits2:TUnits;
begin
{*
 0070F234    mov         eax,dword ptr [eax+20];TTouchpadValue..........................Item:Integer
 0070F237    sub         eax,1
>0070F23A    jae         0070F23F
 0070F23C    xor         eax,eax
 0070F23E    ret
 0070F23F    xor         eax,eax
 0070F241    ret
*}
end;

//0070F244
{*procedure TTouchpadValue.GetString(?:?);
begin
 0070F244    push        ebx
 0070F245    push        esi
 0070F246    mov         esi,edx
 0070F248    mov         ebx,eax
 0070F24A    mov         eax,dword ptr [ebx+20];TTouchpadValue...........................Item:Integer
 0070F24D    sub         eax,1
>0070F250    jae         0070F25E
 0070F252    mov         edx,esi
 0070F254    mov         eax,ebx
 0070F256    call        TExpression.GetString
 0070F25B    pop         esi
 0070F25C    pop         ebx
 0070F25D    ret
 0070F25E    mov         edx,esi
 0070F260    mov         eax,ebx
 0070F262    call        TExpression.GetString
 0070F267    pop         esi
 0070F268    pop         ebx
 0070F269    ret
end;*}

//0070F26C
function TTouchpadValue.GetUnits:TUnits;
begin
{*
 0070F26C    mov         eax,dword ptr [eax+20];TTouchpadValue............................Item:Integer
 0070F26F    sub         eax,1
>0070F272    jae         0070F277
 0070F274    xor         eax,eax
 0070F276    ret
 0070F277    xor         eax,eax
 0070F279    ret
*}
end;

//0070F27C
procedure TTouchpadValue.GetValue;
begin
{*
 0070F27C    add         esp,0FFFFFFF8
 0070F27F    movzx       edx,byte ptr ds:[8229ED];gvar_008229ED
 0070F286    xor         dl,1
 0070F289    test        dl,dl
>0070F28B    je          0070F29B
 0070F28D    xor         eax,eax
 0070F28F    mov         dword ptr [esp],eax
 0070F292    mov         dword ptr [esp+4],eax
>0070F296    jmp         0070F5D4
 0070F29B    mov         eax,dword ptr [eax+20];TTouchpadValue.............................Item:Integer
 0070F29E    cmp         eax,1D
>0070F2A1    ja          0070F5CB
 0070F2A7    jmp         dword ptr [eax*4+70F2AE]
 0070F2A7    dd          0070F326
 0070F2A7    dd          0070F351
 0070F2A7    dd          0070F368
 0070F2A7    dd          0070F37F
 0070F2A7    dd          0070F3B2
 0070F2A7    dd          0070F390
 0070F2A7    dd          0070F3A1
 0070F2A7    dd          0070F3C3
 0070F2A7    dd          0070F3D4
 0070F2A7    dd          0070F3E5
 0070F2A7    dd          0070F3F6
 0070F2A7    dd          0070F407
 0070F2A7    dd          0070F418
 0070F2A7    dd          0070F429
 0070F2A7    dd          0070F443
 0070F2A7    dd          0070F45D
 0070F2A7    dd          0070F477
 0070F2A7    dd          0070F491
 0070F2A7    dd          0070F4AB
 0070F2A7    dd          0070F4C5
 0070F2A7    dd          0070F4DF
 0070F2A7    dd          0070F4F9
 0070F2A7    dd          0070F513
 0070F2A7    dd          0070F52D
 0070F2A7    dd          0070F547
 0070F2A7    dd          0070F55E
 0070F2A7    dd          0070F575
 0070F2A7    dd          0070F58C
 0070F2A7    dd          0070F5A3
 0070F2A7    dd          0070F5B7
 0070F326    test        dl,dl
>0070F328    je          0070F33A
 0070F32A    xor         eax,eax
 0070F32C    call        00686074
 0070F331    fstp        qword ptr [esp]
 0070F334    wait
>0070F335    jmp         0070F5D4
 0070F33A    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F33F    movzx       eax,byte ptr [eax+1C]
 0070F343    call        00686074
 0070F348    fstp        qword ptr [esp]
 0070F34B    wait
>0070F34C    jmp         0070F5D4
 0070F351    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F356    mov         edx,dword ptr [eax+58]
 0070F359    mov         dword ptr [esp],edx
 0070F35C    mov         edx,dword ptr [eax+5C]
 0070F35F    mov         dword ptr [esp+4],edx
>0070F363    jmp         0070F5D4
 0070F368    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F36D    mov         edx,dword ptr [eax+60]
 0070F370    mov         dword ptr [esp],edx
 0070F373    mov         edx,dword ptr [eax+64]
 0070F376    mov         dword ptr [esp+4],edx
>0070F37A    jmp         0070F5D4
 0070F37F    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F384    fild        dword ptr [eax+2C]
 0070F387    fstp        qword ptr [esp]
 0070F38A    wait
>0070F38B    jmp         0070F5D4
 0070F390    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F395    fild        dword ptr [eax+34]
 0070F398    fstp        qword ptr [esp]
 0070F39B    wait
>0070F39C    jmp         0070F5D4
 0070F3A1    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F3A6    fild        dword ptr [eax+38]
 0070F3A9    fstp        qword ptr [esp]
 0070F3AC    wait
>0070F3AD    jmp         0070F5D4
 0070F3B2    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F3B7    fild        dword ptr [eax+30]
 0070F3BA    fstp        qword ptr [esp]
 0070F3BD    wait
>0070F3BE    jmp         0070F5D4
 0070F3C3    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F3C8    fild        dword ptr [eax+3C]
 0070F3CB    fstp        qword ptr [esp]
 0070F3CE    wait
>0070F3CF    jmp         0070F5D4
 0070F3D4    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F3D9    fild        dword ptr [eax+40]
 0070F3DC    fstp        qword ptr [esp]
 0070F3DF    wait
>0070F3E0    jmp         0070F5D4
 0070F3E5    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F3EA    fild        dword ptr [eax+44]
 0070F3ED    fstp        qword ptr [esp]
 0070F3F0    wait
>0070F3F1    jmp         0070F5D4
 0070F3F6    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F3FB    fild        dword ptr [eax+48]
 0070F3FE    fstp        qword ptr [esp]
 0070F401    wait
>0070F402    jmp         0070F5D4
 0070F407    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F40C    fild        dword ptr [eax+4C]
 0070F40F    fstp        qword ptr [esp]
 0070F412    wait
>0070F413    jmp         0070F5D4
 0070F418    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F41D    fild        dword ptr [eax+50]
 0070F420    fstp        qword ptr [esp]
 0070F423    wait
>0070F424    jmp         0070F5D4
 0070F429    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F42E    test        byte ptr [eax+4C],1
 0070F432    setne       al
 0070F435    call        00686074
 0070F43A    fstp        qword ptr [esp]
 0070F43D    wait
>0070F43E    jmp         0070F5D4
 0070F443    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F448    test        byte ptr [eax+4C],2
 0070F44C    setne       al
 0070F44F    call        00686074
 0070F454    fstp        qword ptr [esp]
 0070F457    wait
>0070F458    jmp         0070F5D4
 0070F45D    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F462    test        byte ptr [eax+4C],4
 0070F466    setne       al
 0070F469    call        00686074
 0070F46E    fstp        qword ptr [esp]
 0070F471    wait
>0070F472    jmp         0070F5D4
 0070F477    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F47C    test        byte ptr [eax+4C],10
 0070F480    setne       al
 0070F483    call        00686074
 0070F488    fstp        qword ptr [esp]
 0070F48B    wait
>0070F48C    jmp         0070F5D4
 0070F491    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F496    test        byte ptr [eax+4C],20
 0070F49A    setne       al
 0070F49D    call        00686074
 0070F4A2    fstp        qword ptr [esp]
 0070F4A5    wait
>0070F4A6    jmp         0070F5D4
 0070F4AB    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F4B0    test        byte ptr [eax+4D],1
 0070F4B4    setne       al
 0070F4B7    call        00686074
 0070F4BC    fstp        qword ptr [esp]
 0070F4BF    wait
>0070F4C0    jmp         0070F5D4
 0070F4C5    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F4CA    test        byte ptr [eax+4D],2
 0070F4CE    setne       al
 0070F4D1    call        00686074
 0070F4D6    fstp        qword ptr [esp]
 0070F4D9    wait
>0070F4DA    jmp         0070F5D4
 0070F4DF    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F4E4    test        byte ptr [eax+4D],4
 0070F4E8    setne       al
 0070F4EB    call        00686074
 0070F4F0    fstp        qword ptr [esp]
 0070F4F3    wait
>0070F4F4    jmp         0070F5D4
 0070F4F9    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F4FE    test        byte ptr [eax+4D],8
 0070F502    setne       al
 0070F505    call        00686074
 0070F50A    fstp        qword ptr [esp]
 0070F50D    wait
>0070F50E    jmp         0070F5D4
 0070F513    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F518    test        byte ptr [eax+4D],10
 0070F51C    setne       al
 0070F51F    call        00686074
 0070F524    fstp        qword ptr [esp]
 0070F527    wait
>0070F528    jmp         0070F5D4
 0070F52D    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F532    test        byte ptr [eax+4D],20
 0070F536    setne       al
 0070F539    call        00686074
 0070F53E    fstp        qword ptr [esp]
 0070F541    wait
>0070F542    jmp         0070F5D4
 0070F547    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F54C    test        byte ptr [eax+4D],40
 0070F550    setne       al
 0070F553    call        00686074
 0070F558    fstp        qword ptr [esp]
 0070F55B    wait
>0070F55C    jmp         0070F5D4
 0070F55E    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F563    test        byte ptr [eax+4D],80
 0070F567    setne       al
 0070F56A    call        00686074
 0070F56F    fstp        qword ptr [esp]
 0070F572    wait
>0070F573    jmp         0070F5D4
 0070F575    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F57A    test        byte ptr [eax+49],20
 0070F57E    setne       al
 0070F581    call        00686074
 0070F586    fstp        qword ptr [esp]
 0070F589    wait
>0070F58A    jmp         0070F5D4
 0070F58C    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F591    test        byte ptr [eax+49],80
 0070F595    setne       al
 0070F598    call        00686074
 0070F59D    fstp        qword ptr [esp]
 0070F5A0    wait
>0070F5A1    jmp         0070F5D4
 0070F5A3    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F5A8    movzx       eax,byte ptr [eax+1D]
 0070F5AC    call        00686074
 0070F5B1    fstp        qword ptr [esp]
 0070F5B4    wait
>0070F5B5    jmp         0070F5D4
 0070F5B7    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F5BC    movzx       eax,byte ptr [eax+1E]
 0070F5C0    call        00686074
 0070F5C5    fstp        qword ptr [esp]
 0070F5C8    wait
>0070F5C9    jmp         0070F5D4
 0070F5CB    xor         eax,eax
 0070F5CD    mov         dword ptr [esp],eax
 0070F5D0    mov         dword ptr [esp+4],eax
 0070F5D4    fld         qword ptr [esp]
 0070F5D7    pop         ecx
 0070F5D8    pop         edx
 0070F5D9    ret
*}
end;

//0070F5DC
function TTouchpadValue.Module:TObject;
begin
{*
 0070F5DC    mov         eax,[008229F4];gvar_008229F4:TModuleTouchpad
 0070F5E1    ret
*}
end;

//0070F5E4
{*function TTouchpadValue.SetValue(NewValue:Double; ?:?):Boolean;
begin
 0070F5E4    push        ebp
 0070F5E5    mov         ebp,esp
 0070F5E7    push        ebx
 0070F5E8    mov         eax,dword ptr [eax+20];TTouchpadValue..............................Item:Integer
 0070F5EB    cmp         eax,0E
>0070F5EE    jg          0070F605
>0070F5F0    je          0070F685
 0070F5F6    sub         eax,1
>0070F5F9    jb          0070F61C
 0070F5FB    sub         eax,0C
>0070F5FE    je          0070F623
>0070F600    jmp         0070F78D
 0070F605    sub         eax,0F
>0070F608    je          0070F6E7
 0070F60E    sub         eax,0E
>0070F611    je          0070F746
>0070F617    jmp         0070F78D
 0070F61C    xor         eax,eax
>0070F61E    jmp         0070F78F
 0070F623    push        dword ptr [ebp+0C]
 0070F626    push        dword ptr [ebp+8]
 0070F629    call        00686060
 0070F62E    mov         ebx,eax
 0070F630    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F635    movzx       edx,byte ptr [eax+1F]
 0070F639    cmp         bl,dl
>0070F63B    je          0070F67E
 0070F63D    xor         eax,eax
 0070F63F    test        dl,dl
>0070F641    je          0070F646
 0070F643    or          eax,1
 0070F646    mov         edx,dword ptr ds:[8229E8];gvar_008229E8:TTouchPadController
 0070F64C    cmp         byte ptr [edx+20],0
>0070F650    je          0070F655
 0070F652    or          eax,2
 0070F655    mov         edx,dword ptr ds:[8229E8];gvar_008229E8:TTouchPadController
 0070F65B    cmp         byte ptr [edx+21],0
>0070F65F    je          0070F664
 0070F661    or          eax,4
 0070F664    push        eax
 0070F665    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F66A    mov         eax,dword ptr [eax+6C]
 0070F66D    xor         ecx,ecx
 0070F66F    xor         edx,edx
 0070F671    call        TSynDeviceCtrl.ForceMotion
 0070F676    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F67B    mov         byte ptr [eax+1F],bl
 0070F67E    mov         al,1
>0070F680    jmp         0070F78F
 0070F685    push        dword ptr [ebp+0C]
 0070F688    push        dword ptr [ebp+8]
 0070F68B    call        00686060
 0070F690    mov         ebx,eax
 0070F692    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F697    movzx       edx,byte ptr [eax+20]
 0070F69B    cmp         bl,dl
>0070F69D    je          0070F6E0
 0070F69F    xor         eax,eax
 0070F6A1    mov         ecx,dword ptr ds:[8229E8];gvar_008229E8:TTouchPadController
 0070F6A7    cmp         byte ptr [ecx+1F],0
>0070F6AB    je          0070F6B0
 0070F6AD    or          eax,1
 0070F6B0    test        dl,dl
>0070F6B2    je          0070F6B7
 0070F6B4    or          eax,2
 0070F6B7    mov         edx,dword ptr ds:[8229E8];gvar_008229E8:TTouchPadController
 0070F6BD    cmp         byte ptr [edx+21],0
>0070F6C1    je          0070F6C6
 0070F6C3    or          eax,4
 0070F6C6    push        eax
 0070F6C7    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F6CC    mov         eax,dword ptr [eax+6C]
 0070F6CF    xor         ecx,ecx
 0070F6D1    xor         edx,edx
 0070F6D3    call        TSynDeviceCtrl.ForceMotion
 0070F6D8    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F6DD    mov         byte ptr [eax+20],bl
 0070F6E0    mov         al,1
>0070F6E2    jmp         0070F78F
 0070F6E7    push        dword ptr [ebp+0C]
 0070F6EA    push        dword ptr [ebp+8]
 0070F6ED    call        00686060
 0070F6F2    mov         ebx,eax
 0070F6F4    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F6F9    movzx       edx,byte ptr [eax+21]
 0070F6FD    cmp         bl,dl
>0070F6FF    je          0070F742
 0070F701    xor         eax,eax
 0070F703    mov         ecx,dword ptr ds:[8229E8];gvar_008229E8:TTouchPadController
 0070F709    cmp         byte ptr [ecx+1F],0
>0070F70D    je          0070F712
 0070F70F    or          eax,1
 0070F712    mov         ecx,dword ptr ds:[8229E8];gvar_008229E8:TTouchPadController
 0070F718    cmp         byte ptr [ecx+20],0
>0070F71C    je          0070F721
 0070F71E    or          eax,2
 0070F721    test        dl,dl
>0070F723    je          0070F728
 0070F725    or          eax,4
 0070F728    push        eax
 0070F729    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F72E    mov         eax,dword ptr [eax+6C]
 0070F731    xor         ecx,ecx
 0070F733    xor         edx,edx
 0070F735    call        TSynDeviceCtrl.ForceMotion
 0070F73A    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F73F    mov         byte ptr [eax+21],bl
 0070F742    mov         al,1
>0070F744    jmp         0070F78F
 0070F746    push        dword ptr [ebp+0C]
 0070F749    push        dword ptr [ebp+8]
 0070F74C    call        00686060
 0070F751    mov         ebx,eax
 0070F753    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F758    cmp         bl,byte ptr [eax+1E]
>0070F75B    je          0070F789
 0070F75D    test        bl,bl
>0070F75F    je          0070F772
 0070F761    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F766    mov         eax,dword ptr [eax+6C]
 0070F769    xor         edx,edx
 0070F76B    call        TSynDeviceCtrl.Acquire
>0070F770    jmp         0070F781
 0070F772    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F777    mov         eax,dword ptr [eax+6C]
 0070F77A    xor         edx,edx
 0070F77C    call        TSynDeviceCtrl.Acquire
 0070F781    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F786    mov         byte ptr [eax+1E],bl
 0070F789    mov         al,1
>0070F78B    jmp         0070F78F
 0070F78D    xor         eax,eax
 0070F78F    pop         ebx
 0070F790    pop         ebp
 0070F791    ret         8
end;*}

//0070F794
{*procedure TTouchpadValue.ToString(?:?);
begin
 0070F794    push        ebp
 0070F795    mov         ebp,esp
 0070F797    push        0
 0070F799    push        ebx
 0070F79A    push        esi
 0070F79B    mov         esi,edx
 0070F79D    mov         ebx,eax
 0070F79F    xor         eax,eax
 0070F7A1    push        ebp
 0070F7A2    push        70F7E5
 0070F7A7    push        dword ptr fs:[eax]
 0070F7AA    mov         dword ptr fs:[eax],esp
 0070F7AD    lea         ecx,[ebp-4]
 0070F7B0    mov         eax,[008229F4];gvar_008229F4:TModuleTouchpad
 0070F7B5    mov         eax,dword ptr [eax+1C]
 0070F7B8    mov         edx,dword ptr [ebx+20];TTouchpadValue...............................Item:Integer
 0070F7BB    call        THashTable.Get
 0070F7C0    mov         ecx,dword ptr [ebp-4]
 0070F7C3    mov         eax,esi
 0070F7C5    mov         edx,70F800;'Touchpad.'
 0070F7CA    call        @UStrCat3
 0070F7CF    xor         eax,eax
 0070F7D1    pop         edx
 0070F7D2    pop         ecx
 0070F7D3    pop         ecx
 0070F7D4    mov         dword ptr fs:[eax],edx
 0070F7D7    push        70F7EC
 0070F7DC    lea         eax,[ebp-4]
 0070F7DF    call        @UStrClr
 0070F7E4    ret
>0070F7E5    jmp         @HandleFinally
>0070F7EA    jmp         0070F7DC
 0070F7EC    pop         esi
 0070F7ED    pop         ebx
 0070F7EE    pop         ecx
 0070F7EF    pop         ebp
 0070F7F0    ret
end;*}

//0070F814
procedure sub_0070F814;
begin
{*
 0070F814    mov         byte ptr ds:[8229EC],0;gvar_008229EC
 0070F81B    ret
*}
end;

//0070F81C
procedure sub_0070F81C;
begin
{*
 0070F81C    ret
*}
end;

//0070F820
{*procedure sub_0070F820(?:?);
begin
 0070F820    push        ebx
 0070F821    mov         ebx,eax
 0070F823    cmp         byte ptr ds:[8229EC],0;gvar_008229EC
>0070F82A    je          0070F851
 0070F82C    mov         ecx,ebx
 0070F82E    mov         dl,1
 0070F830    mov         eax,[0070E218];TTouchPadController
 0070F835    call        TTouchPadController.Create;TTouchPadController.Create
 0070F83A    mov         [008229E8],eax;gvar_008229E8:TTouchPadController
 0070F83F    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F844    cmp         byte ptr [eax+1C],0
>0070F848    je          0070F851
 0070F84A    mov         byte ptr ds:[8229ED],1;gvar_008229ED
 0070F851    pop         ebx
 0070F852    ret
end;*}

//0070F854
procedure sub_0070F854;
begin
{*
 0070F854    movzx       eax,byte ptr ds:[8229EC];gvar_008229EC
 0070F85B    and         al,byte ptr ds:[8229ED];gvar_008229ED
>0070F861    je          0070F87B
 0070F863    mov         eax,[008229E8];gvar_008229E8:TTouchPadController
 0070F868    call        TObject.Free
 0070F86D    xor         eax,eax
 0070F86F    mov         [008229E8],eax;gvar_008229E8:TTouchPadController
 0070F874    mov         byte ptr ds:[8229ED],0;gvar_008229ED
 0070F87B    ret
*}
end;

//0070F87C
procedure TModuleTouchpad.AddFields;
begin
{*
 0070F87C    push        ebx
 0070F87D    mov         ebx,eax
 0070F87F    mov         eax,ebx
 0070F881    call        TPieModule.AddFields
 0070F886    xor         ecx,ecx
 0070F888    mov         edx,70FAB0;'Exists'
 0070F88D    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F890    call        THashTable.Add
 0070F895    mov         ecx,1
 0070F89A    mov         edx,70FACC;'x'
 0070F89F    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F8A2    call        THashTable.Add
 0070F8A7    mov         ecx,2
 0070F8AC    mov         edx,70FADC;'y'
 0070F8B1    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F8B4    call        THashTable.Add
 0070F8B9    mov         ecx,3
 0070F8BE    mov         edx,70FAEC;'z'
 0070F8C3    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F8C6    call        THashTable.Add
 0070F8CB    mov         ecx,4
 0070F8D0    mov         edx,70FAFC;'w'
 0070F8D5    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F8D8    call        THashTable.Add
 0070F8DD    mov         ecx,5
 0070F8E2    mov         edx,70FB0C;'zx'
 0070F8E7    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F8EA    call        THashTable.Add
 0070F8EF    mov         ecx,6
 0070F8F4    mov         edx,70FB20;'zy'
 0070F8F9    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F8FC    call        THashTable.Add
 0070F901    mov         ecx,7
 0070F906    mov         edx,70FB34;'xraw'
 0070F90B    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F90E    call        THashTable.Add
 0070F913    mov         ecx,8
 0070F918    mov         edx,70FB4C;'yraw'
 0070F91D    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F920    call        THashTable.Add
 0070F925    mov         ecx,9
 0070F92A    mov         edx,70FB64;'zraw'
 0070F92F    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F932    call        THashTable.Add
 0070F937    mov         ecx,0A
 0070F93C    mov         edx,70FB7C;'FingerState'
 0070F941    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F944    call        THashTable.Add
 0070F949    mov         ecx,0B
 0070F94E    mov         edx,70FBA0;'ButtonState'
 0070F953    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F956    call        THashTable.Add
 0070F95B    mov         ecx,0C
 0070F960    mov         edx,70FBC4;'ExtendedState'
 0070F965    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F968    call        THashTable.Add
 0070F96D    mov         ecx,0D
 0070F972    mov         edx,70FBEC;'LeftButton'
 0070F977    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F97A    call        THashTable.Add
 0070F97F    mov         ecx,0E
 0070F984    mov         edx,70FC10;'RightButton'
 0070F989    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F98C    call        THashTable.Add
 0070F991    mov         ecx,0F
 0070F996    mov         edx,70FC34;'MiddleButton'
 0070F99B    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F99E    call        THashTable.Add
 0070F9A3    mov         ecx,10
 0070F9A8    mov         edx,70FC5C;'UpButton'
 0070F9AD    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F9B0    call        THashTable.Add
 0070F9B5    mov         ecx,11
 0070F9BA    mov         edx,70FC7C;'DownButton'
 0070F9BF    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F9C2    call        THashTable.Add
 0070F9C7    mov         ecx,12
 0070F9CC    mov         edx,70FCA0;'DPadUp'
 0070F9D1    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F9D4    call        THashTable.Add
 0070F9D9    mov         ecx,13
 0070F9DE    mov         edx,70FCBC;'DPadDown'
 0070F9E3    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F9E6    call        THashTable.Add
 0070F9EB    mov         ecx,14
 0070F9F0    mov         edx,70FCDC;'DPadLeft'
 0070F9F5    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070F9F8    call        THashTable.Add
 0070F9FD    mov         ecx,15
 0070FA02    mov         edx,70FCFC;'DPadRight'
 0070FA07    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070FA0A    call        THashTable.Add
 0070FA0F    mov         ecx,16
 0070FA14    mov         edx,70FD1C;'Button5'
 0070FA19    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070FA1C    call        THashTable.Add
 0070FA21    mov         ecx,17
 0070FA26    mov         edx,70FD38;'Button6'
 0070FA2B    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070FA2E    call        THashTable.Add
 0070FA33    mov         ecx,18
 0070FA38    mov         edx,70FD54;'Button7'
 0070FA3D    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070FA40    call        THashTable.Add
 0070FA45    mov         ecx,19
 0070FA4A    mov         edx,70FD70;'Button8'
 0070FA4F    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070FA52    call        THashTable.Add
 0070FA57    mov         ecx,1A
 0070FA5C    mov         edx,70FD8C;'FingerPresent'
 0070FA61    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070FA64    call        THashTable.Add
 0070FA69    mov         ecx,1B
 0070FA6E    mov         edx,70FDB4;'StylusPresent'
 0070FA73    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070FA76    call        THashTable.Add
 0070FA7B    mov         ecx,1C
 0070FA80    mov         edx,70FDDC;'Touching'
 0070FA85    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070FA88    call        THashTable.Add
 0070FA8D    mov         ecx,1D
 0070FA92    mov         edx,70FDFC;'Swallow'
 0070FA97    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070FA9A    call        THashTable.Add
 0070FA9F    pop         ebx
 0070FAA0    ret
*}
end;

//0070FE0C
procedure TModuleTouchpad.ClearRead;
begin
{*
 0070FE0C    call        TPieModule.ClearRead
 0070FE11    ret
*}
end;

//0070FE14
constructor TModuleTouchpad.Create;
begin
{*
 0070FE14    push        ebx
 0070FE15    push        esi
 0070FE16    test        dl,dl
>0070FE18    je          0070FE22
 0070FE1A    add         esp,0FFFFFFF0
 0070FE1D    call        @ClassCreate
 0070FE22    mov         ebx,edx
 0070FE24    mov         esi,eax
 0070FE26    push        0
 0070FE28    push        0
 0070FE2A    push        0
 0070FE2C    push        0
 0070FE2E    mov         ecx,70FE64;'Touchpad'
 0070FE33    xor         edx,edx
 0070FE35    mov         eax,esi
 0070FE37    call        005E48EC
 0070FE3C    mov         eax,esi
 0070FE3E    test        bl,bl
>0070FE40    je          0070FE51
 0070FE42    call        @AfterConstruction
 0070FE47    pop         dword ptr fs:[0]
 0070FE4E    add         esp,0C
 0070FE51    mov         eax,esi
 0070FE53    pop         esi
 0070FE54    pop         ebx
 0070FE55    ret
*}
end;

//0070FE78
function TModuleTouchpad.CreateValue(Identifier:string):TExpression;
begin
{*
 0070FE78    push        ebp
 0070FE79    mov         ebp,esp
 0070FE7B    push        ecx
 0070FE7C    push        ebx
 0070FE7D    mov         dword ptr [ebp-4],edx
 0070FE80    mov         ebx,eax
 0070FE82    mov         eax,dword ptr [ebp-4]
 0070FE85    call        @UStrAddRef
 0070FE8A    xor         eax,eax
 0070FE8C    push        ebp
 0070FE8D    push        70FEBC
 0070FE92    push        dword ptr fs:[eax]
 0070FE95    mov         dword ptr fs:[eax],esp
 0070FE98    mov         byte ptr [ebx+24],1;TModuleTouchpad.Used:Boolean
 0070FE9C    mov         eax,dword ptr [ebp-4]
 0070FE9F    call        0070F0D0
 0070FEA4    mov         ebx,eax
 0070FEA6    xor         eax,eax
 0070FEA8    pop         edx
 0070FEA9    pop         ecx
 0070FEAA    pop         ecx
 0070FEAB    mov         dword ptr fs:[eax],edx
 0070FEAE    push        70FEC3
 0070FEB3    lea         eax,[ebp-4]
 0070FEB6    call        @UStrClr
 0070FEBB    ret
>0070FEBC    jmp         @HandleFinally
>0070FEC1    jmp         0070FEB3
 0070FEC3    mov         eax,ebx
 0070FEC5    pop         ebx
 0070FEC6    pop         ecx
 0070FEC7    pop         ebp
 0070FEC8    ret
*}
end;

//0070FECC
function TModuleTouchpad.GetDefaultFormat(field:string):TGuiFormat;
begin
{*
 0070FECC    push        ebp
 0070FECD    mov         ebp,esp
 0070FECF    push        ecx
 0070FED0    push        ebx
 0070FED1    mov         dword ptr [ebp-4],edx
 0070FED4    mov         ebx,eax
 0070FED6    mov         eax,dword ptr [ebp-4]
 0070FED9    call        @UStrAddRef
 0070FEDE    xor         eax,eax
 0070FEE0    push        ebp
 0070FEE1    push        70FF18
 0070FEE6    push        dword ptr fs:[eax]
 0070FEE9    mov         dword ptr fs:[eax],esp
 0070FEEC    mov         edx,dword ptr [ebp-4]
 0070FEEF    mov         eax,dword ptr [ebx+1C];TModuleTouchpad.Fields:THashTable
 0070FEF2    call        THashTable.Get
 0070FEF7    sub         eax,1
>0070FEFA    jae         0070FF00
 0070FEFC    xor         ebx,ebx
>0070FEFE    jmp         0070FF02
 0070FF00    mov         bl,9
 0070FF02    xor         eax,eax
 0070FF04    pop         edx
 0070FF05    pop         ecx
 0070FF06    pop         ecx
 0070FF07    mov         dword ptr fs:[eax],edx
 0070FF0A    push        70FF1F
 0070FF0F    lea         eax,[ebp-4]
 0070FF12    call        @UStrClr
 0070FF17    ret
>0070FF18    jmp         @HandleFinally
>0070FF1D    jmp         0070FF0F
 0070FF1F    mov         eax,ebx
 0070FF21    pop         ebx
 0070FF22    pop         ecx
 0070FF23    pop         ebp
 0070FF24    ret
*}
end;

//0070FF28
function TModuleTouchpad.GetGoodFields:TStringList;
begin
{*
 0070FF28    push        ebx
 0070FF29    mov         dl,1
 0070FF2B    mov         eax,[0043C7BC];TStringList
 0070FF30    call        TStringList.Create;TStringList.Create
 0070FF35    mov         ebx,eax
 0070FF37    mov         edx,70FFF0;'x'
 0070FF3C    mov         eax,ebx
 0070FF3E    mov         ecx,dword ptr [eax]
 0070FF40    call        dword ptr [ecx+38];TStringList.Add
 0070FF43    mov         edx,710000;'y'
 0070FF48    mov         eax,ebx
 0070FF4A    mov         ecx,dword ptr [eax]
 0070FF4C    call        dword ptr [ecx+38];TStringList.Add
 0070FF4F    mov         edx,710010;'z'
 0070FF54    mov         eax,ebx
 0070FF56    mov         ecx,dword ptr [eax]
 0070FF58    call        dword ptr [ecx+38];TStringList.Add
 0070FF5B    mov         edx,710020;'w'
 0070FF60    mov         eax,ebx
 0070FF62    mov         ecx,dword ptr [eax]
 0070FF64    call        dword ptr [ecx+38];TStringList.Add
 0070FF67    mov         edx,710030;'Touching'
 0070FF6C    mov         eax,ebx
 0070FF6E    mov         ecx,dword ptr [eax]
 0070FF70    call        dword ptr [ecx+38];TStringList.Add
 0070FF73    mov         edx,710050;'LeftButton'
 0070FF78    mov         eax,ebx
 0070FF7A    mov         ecx,dword ptr [eax]
 0070FF7C    call        dword ptr [ecx+38];TStringList.Add
 0070FF7F    mov         edx,710074;'RightButton'
 0070FF84    mov         eax,ebx
 0070FF86    mov         ecx,dword ptr [eax]
 0070FF88    call        dword ptr [ecx+38];TStringList.Add
 0070FF8B    mov         edx,710098;'MiddleButton'
 0070FF90    mov         eax,ebx
 0070FF92    mov         ecx,dword ptr [eax]
 0070FF94    call        dword ptr [ecx+38];TStringList.Add
 0070FF97    mov         edx,7100C0;'DPadUp'
 0070FF9C    mov         eax,ebx
 0070FF9E    mov         ecx,dword ptr [eax]
 0070FFA0    call        dword ptr [ecx+38];TStringList.Add
 0070FFA3    mov         edx,7100DC;'DPadDown'
 0070FFA8    mov         eax,ebx
 0070FFAA    mov         ecx,dword ptr [eax]
 0070FFAC    call        dword ptr [ecx+38];TStringList.Add
 0070FFAF    mov         edx,7100FC;'DPadLeft'
 0070FFB4    mov         eax,ebx
 0070FFB6    mov         ecx,dword ptr [eax]
 0070FFB8    call        dword ptr [ecx+38];TStringList.Add
 0070FFBB    mov         edx,71011C;'DPadRight'
 0070FFC0    mov         eax,ebx
 0070FFC2    mov         ecx,dword ptr [eax]
 0070FFC4    call        dword ptr [ecx+38];TStringList.Add
 0070FFC7    mov         edx,71013C;'UpButton'
 0070FFCC    mov         eax,ebx
 0070FFCE    mov         ecx,dword ptr [eax]
 0070FFD0    call        dword ptr [ecx+38];TStringList.Add
 0070FFD3    mov         edx,71015C;'DownButton'
 0070FFD8    mov         eax,ebx
 0070FFDA    mov         ecx,dword ptr [eax]
 0070FFDC    call        dword ptr [ecx+38];TStringList.Add
 0070FFDF    mov         eax,ebx
 0070FFE1    pop         ebx
 0070FFE2    ret
*}
end;

//00710174
procedure TModuleTouchpad.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 00710174    push        ebp
 00710175    mov         ebp,esp
 00710177    mov         byte ptr [edx],1
 0071017A    mov         dword ptr [ecx],0FFFFFFFF
 00710180    mov         eax,dword ptr [ebp+8]
 00710183    mov         dword ptr [eax],0FFFFFFFF
 00710189    pop         ebp
 0071018A    ret         4
*}
end;

//00710190
function TModuleTouchpad.Read:Boolean;
begin
{*
 00710190    mov         al,1
 00710192    ret
*}
end;

//00710194
procedure TModuleTouchpad.StartCompiletime;
begin
{*
 00710194    call        TPieModule.StartCompiletime
 00710199    call        0070F814
 0071019E    ret
*}
end;

//007101A0
procedure TModuleTouchpad.StartRuntime;
begin
{*
 007101A0    call        TPieModule.StartRuntime
 007101A5    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 007101AA    mov         eax,dword ptr [eax]
 007101AC    call        0070F820
 007101B1    ret
*}
end;

//007101B4
procedure TModuleTouchpad.StopCompiletime;
begin
{*
 007101B4    push        ebx
 007101B5    mov         ebx,eax
 007101B7    call        0070F81C
 007101BC    mov         eax,ebx
 007101BE    call        TPieModule.StopCompiletime
 007101C3    pop         ebx
 007101C4    ret
*}
end;

//007101C8
procedure TModuleTouchpad.StopRuntime;
begin
{*
 007101C8    push        ebx
 007101C9    mov         ebx,eax
 007101CB    call        0070F854
 007101D0    mov         eax,ebx
 007101D2    call        TPieModule.StopRuntime
 007101D7    pop         ebx
 007101D8    ret
*}
end;

Initialization
//00782E34
{*
 00782E34    sub         dword ptr ds:[8229F0],1
>00782E3B    jae         00782E58
 00782E3D    mov         dl,1
 00782E3F    mov         eax,[0070E970];TModuleTouchpad
 00782E44    call        TModuleTouchpad.Create;TModuleTouchpad.Create
 00782E49    mov         [008229F4],eax;gvar_008229F4:TModuleTouchpad
 00782E4E    mov         eax,[008229F4];gvar_008229F4:TModuleTouchpad
 00782E53    call        005E31AC
 00782E58    ret
*}
Finalization
end.