//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit99;

interface

uses
  SysUtils, Classes, PieDebug, OleServer;

type
  TKalmanFilter = TKalmanFilter = record//size=48
TimeStamp:Double;//f0
AccVariance:Double;//f8
NoiseVariance:Double;//f10
Position:Double;//f18
Velocity:Double;//f20
P11:Double;//f28
P12:Double;//f30
P21:Double;//f38
P22:Double;//f40
end;;
  TDebugValue = class(TExpression)
  published
    //procedure GetString(?:?);//005C47E4
    //procedure ToString(?:?);//005C48FC
    procedure FillClone(c:TExpression);//005C47D8
    procedure CreateClone;//005C47C8
    function SetString(NewValue:string):Boolean;//005C481C
    procedure GetValue;//005C4808
    function GetDataType:TDataType;//005C47E0
    //function SetValue(NewValue:Double; ?:?):Boolean;//005C4878
    function CanSet:Boolean;//005C47C4
  public
    //procedure ToString(?:?); virtual;//005C48FC
    procedure GetValue; virtual;//v2C//005C4808
    //procedure GetString(?:?); virtual;//v38//005C47E4
    function GetDataType:TDataType; virtual;//v44//005C47E0
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//005C4878
    function SetString(NewValue:string):Boolean; virtual;//v5C//005C481C
    function CanSet:Boolean; virtual;//v68//005C47C4
    procedure CreateClone; virtual;//v80//005C47C8
    procedure FillClone(c:TExpression); virtual;//v84//005C47D8
  end;
  TVariantArray = array of OleVariant;
//elSize = 10
//varType equivalent: varVariant;
  TConnectKind = (ckRunningOrNew, ckNewInstance, ckRunningInstance, ckRemote, ckAttachToInterface);
  TServerEventDispatch = class(TObject)
  published
    constructor Create;//005C4FE0
  public
    FServer:TOleServer;//f4
    InternalRefCount:Integer;//f8
    function _AddRef:Integer; stdcall;//005C5070
    function _Release:Integer; stdcall;//005C5090
    function GetTypeInfoCount(var Count:Integer):HRESULT; stdcall;//005C50B0
    function GetTypeInfo(Index:Integer; LocaleID:Integer; var TypeInfo:void ):HRESULT; stdcall;//005C50C0
    function GetIDsOfNames(const IID:TGUID; Names:Pointer; NameCount:Integer; LocaleID:Integer; DispIDs:Pointer):HRESULT; stdcall;//005C50D4
    function Invoke(DispID:Integer; const IID:TGUID; LocaleID:Integer; Flags:Word; var Params:void ; VarResult:Pointer; ExcepInfo:Pointer; ArgErr:Pointer):HRESULT; stdcall;//005C50E0
    function ServerDisconnect:Boolean;//005C5280
  end;
  TServerData = TServerData = record//size=3C
ClassID:TGUID;//f0
IntfIID:TGUID;//f10
EventIID:TGUID;//f20
LicenseKey:Pointer;//f30
Version:Integer;//f34
InstanceCount:Integer;//f38
end;;
  TOleServer = class(TComponent)
  published
    procedure Connect;//005C4FD0
    procedure Disconnect;//005C4FD8
    constructor Create;//005C5290
    destructor Destroy();//005C537C
  public
    FServerData:PServerData;//f34
    FRefCount:Integer;//f38
    FEventDispatch:TServerEventDispatch;//f3C
    FEventsConnection:Integer;//f40
    FAutoConnect:Boolean;//f44
    FRemoteMachineName:string;//f48
    FConnectKind:TConnectKind;//f4C
    destructor Destroy(); virtual;//005C537C
    procedure Loaded; virtual;//vC//005C53CC
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; virtual; stdcall;//v28//005C55AC
    constructor Create; virtual;//v2C//005C5290
    procedure v34; virtual; abstract;//v34//00404A58
    function GetServer:IUnknown; virtual;//v38//005C53F4
    procedure v3C; virtual;//v3C//005C53F0
    procedure Connect; virtual; abstract;//v40//00404A58
    procedure Disconnect; virtual; abstract;//v44//00404A58
    procedure ConnectEvents(const Obj:IUnknown);//005C554C
    procedure DisconnectEvents(const Obj:IUnknown);//005C5568
    function GetConnectKind:TConnectKind;//005C5578
    procedure SetConnectKind(Value:TConnectKind);//005C558C
    function GetAutoConnect:Boolean;//005C5590
    procedure SetAutoConnect(Value:Boolean);//005C55A8
    function _AddRef:Integer; stdcall;//005C55D4
    function _Release:Integer; stdcall;//005C55E4
  end;
    //procedure sub_005C4280(?:?; ?:?; ?:?; ?:?);//005C4280
    //procedure sub_005C4308(?:?; ?:?; ?:?; ?:?);//005C4308
    //function sub_005C4480(?:?; ?:?):?;//005C4480
    //function sub_005C500C(?:?; ?:?; ?:?):?;//005C500C
    procedure Loaded;//005C53CC
    procedure sub_005C53F0;//005C53F0
    function GetServer:IUnknown;//005C53F4
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;//005C55AC

implementation

//005C4280
{*procedure sub_005C4280(?:?; ?:?; ?:?; ?:?);
begin
 005C4280    push        ebp
 005C4281    mov         ebp,esp
 005C4283    add         esp,0FFFFFFF8
 005C4286    push        ebx
 005C4287    mov         ebx,eax
 005C4289    xor         eax,eax
 005C428B    mov         dword ptr [ebx],eax
 005C428D    mov         dword ptr [ebx+4],eax
 005C4290    fld         qword ptr [ebp+18]
 005C4293    fmul        st,st(0)
 005C4295    fstp        qword ptr [ebx+8]
 005C4298    wait
 005C4299    fld         qword ptr [ebp+10]
 005C429C    fmul        st,st(0)
 005C429E    fstp        qword ptr [ebx+10]
 005C42A1    wait
 005C42A2    xor         eax,eax
 005C42A4    mov         dword ptr [ebx+18],eax
 005C42A7    mov         dword ptr [ebx+1C],eax
 005C42AA    xor         eax,eax
 005C42AC    mov         dword ptr [ebx+20],eax
 005C42AF    mov         dword ptr [ebx+24],eax
 005C42B2    fld         qword ptr [ebp+8]
 005C42B5    fmul        st,st(0)
 005C42B7    fmul        qword ptr [ebx+8]
 005C42BA    fstp        qword ptr [ebp-8]
 005C42BD    wait
 005C42BE    fld         qword ptr [ebp-8]
 005C42C1    fmul        qword ptr [ebp+8]
 005C42C4    fmul        qword ptr [ebp+8]
 005C42C7    fmul        dword ptr ds:[5C4300];0.25:Single
 005C42CD    fstp        qword ptr [ebx+28]
 005C42D0    wait
 005C42D1    fld         qword ptr [ebp-8]
 005C42D4    fmul        qword ptr [ebp+8]
 005C42D7    fmul        dword ptr ds:[5C4304];0.5:Single
 005C42DD    fstp        qword ptr [ebx+30]
 005C42E0    wait
 005C42E1    mov         eax,dword ptr [ebx+30]
 005C42E4    mov         dword ptr [ebx+38],eax
 005C42E7    mov         eax,dword ptr [ebx+34]
 005C42EA    mov         dword ptr [ebx+3C],eax
 005C42ED    mov         eax,dword ptr [ebp-8]
 005C42F0    mov         dword ptr [ebx+40],eax
 005C42F3    mov         eax,dword ptr [ebp-4]
 005C42F6    mov         dword ptr [ebx+44],eax
 005C42F9    pop         ebx
 005C42FA    pop         ecx
 005C42FB    pop         ecx
 005C42FC    pop         ebp
 005C42FD    ret         18
end;*}

//005C4308
{*procedure sub_005C4308(?:?; ?:?; ?:?; ?:?);
begin
 005C4308    push        ebp
 005C4309    mov         ebp,esp
 005C430B    add         esp,0FFFFFFB8
 005C430E    push        ebx
 005C430F    mov         ebx,eax
 005C4311    fld         qword ptr [ebp+8]
 005C4314    fsub        qword ptr [ebx]
 005C4316    fstp        qword ptr [ebp-8]
 005C4319    wait
 005C431A    fld         qword ptr [ebp-8]
 005C431D    fcomp       dword ptr ds:[5C4474];0:Single
 005C4323    wait
 005C4324    fnstsw      al
 005C4326    sahf
>005C4327    jbe         005C446D
 005C432D    fld         qword ptr [ebp+8]
 005C4330    fcomp       dword ptr ds:[5C4474];0:Single
 005C4336    wait
 005C4337    fnstsw      al
 005C4339    sahf
>005C433A    je          005C446D
 005C4340    fld         qword ptr [ebp-8]
 005C4343    fmul        qword ptr [ebx+20]
 005C4346    fadd        qword ptr [ebx+18]
 005C4349    fstp        qword ptr [ebp-30]
 005C434C    wait
 005C434D    mov         eax,dword ptr [ebx+20]
 005C4350    mov         dword ptr [ebp-38],eax
 005C4353    mov         eax,dword ptr [ebx+24]
 005C4356    mov         dword ptr [ebp-34],eax
 005C4359    fld         qword ptr [ebp-8]
 005C435C    fmul        st,st(0)
 005C435E    fmul        st,st(0)
 005C4360    fmul        dword ptr ds:[5C4478];0.25:Single
 005C4366    fld         qword ptr [ebp-8]
 005C4369    fmul        qword ptr [ebx+38]
 005C436C    fadd        qword ptr [ebx+28]
 005C436F    faddp       st(1),st
 005C4371    fstp        qword ptr [ebp-40]
 005C4374    wait
 005C4375    fld         qword ptr [ebp-8]
 005C4378    fmul        st,st(0)
 005C437A    fmul        qword ptr [ebp-8]
 005C437D    fmul        dword ptr ds:[5C447C];0.5:Single
 005C4383    fld         qword ptr [ebp-8]
 005C4386    fmul        qword ptr [ebx+40]
 005C4389    fadd        qword ptr [ebx+38]
 005C438C    faddp       st(1),st
 005C438E    fstp        qword ptr [ebp-48]
 005C4391    wait
 005C4392    fld         qword ptr [ebp+10]
 005C4395    fsub        qword ptr [ebp-30]
 005C4398    fstp        qword ptr [ebp-10]
 005C439B    wait
 005C439C    fld         qword ptr [ebx+10]
 005C439F    fadd        qword ptr [ebp-40]
 005C43A2    fstp        qword ptr [ebp-18]
 005C43A5    wait
 005C43A6    fld         qword ptr [ebp-40]
 005C43A9    fdiv        qword ptr [ebp-18]
 005C43AC    fstp        qword ptr [ebp-20]
 005C43AF    wait
 005C43B0    fld         qword ptr [ebp-48]
 005C43B3    fdiv        qword ptr [ebp-18]
 005C43B6    fstp        qword ptr [ebp-28]
 005C43B9    wait
 005C43BA    fld         qword ptr [ebp-20]
 005C43BD    fmul        qword ptr [ebp-10]
 005C43C0    fadd        qword ptr [ebp-30]
 005C43C3    fstp        qword ptr [ebx+18]
 005C43C6    wait
 005C43C7    fld         qword ptr [ebp-28]
 005C43CA    fmul        qword ptr [ebp-10]
 005C43CD    fadd        qword ptr [ebp-38]
 005C43D0    fstp        qword ptr [ebx+20]
 005C43D3    wait
 005C43D4    fld         qword ptr [ebp-8]
 005C43D7    fmul        st,st(0)
 005C43D9    fmul        st,st(0)
 005C43DB    fmul        dword ptr ds:[5C4478];0.25:Single
 005C43E1    fld         qword ptr [ebp-8]
 005C43E4    fmul        qword ptr [ebx+38]
 005C43E7    fadd        qword ptr [ebx+28]
 005C43EA    fld         qword ptr [ebp-8]
 005C43ED    fmul        qword ptr [ebx+30]
 005C43F0    fadd        qword ptr [ebx+28]
 005C43F3    fmul        qword ptr [ebp-20]
 005C43F6    fsubp       st(1),st
 005C43F8    faddp       st(1),st
 005C43FA    fstp        qword ptr [ebx+28]
 005C43FD    wait
 005C43FE    fld         qword ptr [ebp-8]
 005C4401    fmul        st,st(0)
 005C4403    fmul        qword ptr [ebp-8]
 005C4406    fmul        dword ptr ds:[5C447C];0.5:Single
 005C440C    fld         qword ptr [ebp-8]
 005C440F    fmul        qword ptr [ebx+40]
 005C4412    fadd        qword ptr [ebx+38]
 005C4415    fld         qword ptr [ebp-8]
 005C4418    fmul        qword ptr [ebx+30]
 005C441B    fadd        qword ptr [ebx+28]
 005C441E    fmul        qword ptr [ebp-28]
 005C4421    fsubp       st(1),st
 005C4423    faddp       st(1),st
 005C4425    fstp        qword ptr [ebx+38]
 005C4428    wait
 005C4429    fld         qword ptr [ebp-8]
 005C442C    fmul        st,st(0)
 005C442E    fmul        qword ptr [ebp-8]
 005C4431    fmul        dword ptr ds:[5C447C];0.5:Single
 005C4437    fld         qword ptr [ebp-8]
 005C443A    fmul        qword ptr [ebx+40]
 005C443D    fadd        qword ptr [ebx+30]
 005C4440    fld         qword ptr [ebp-20]
 005C4443    fmul        qword ptr [ebx+30]
 005C4446    fsubp       st(1),st
 005C4448    faddp       st(1),st
 005C444A    fstp        qword ptr [ebx+30]
 005C444D    wait
 005C444E    fld         qword ptr [ebp-8]
 005C4451    fmul        st,st(0)
 005C4453    fld         qword ptr [ebp-28]
 005C4456    fmul        qword ptr [ebx+30]
 005C4459    fsubr       qword ptr [ebx+40]
 005C445C    faddp       st(1),st
 005C445E    fstp        qword ptr [ebx+40]
 005C4461    wait
 005C4462    mov         eax,dword ptr [ebp+8]
 005C4465    mov         dword ptr [ebx],eax
 005C4467    mov         eax,dword ptr [ebp+0C]
 005C446A    mov         dword ptr [ebx+4],eax
 005C446D    pop         ebx
 005C446E    mov         esp,ebp
 005C4470    pop         ebp
 005C4471    ret         10
end;*}

//005C4480
{*function sub_005C4480(?:?; ?:?):?;
begin
 005C4480    push        ebp
 005C4481    mov         ebp,esp
 005C4483    add         esp,0FFFFFFF8
 005C4486    fld         qword ptr [eax+20]
 005C4489    fmul        qword ptr [ebp+8]
 005C448C    fadd        qword ptr [eax+18]
 005C448F    fstp        qword ptr [ebp-8]
 005C4492    wait
 005C4493    fld         qword ptr [ebp-8]
 005C4496    pop         ecx
 005C4497    pop         ecx
 005C4498    pop         ebp
 005C4499    ret         8
end;*}

//005C47C4
function TDebugValue.CanSet:Boolean;
begin
{*
 005C47C4    mov         al,1
 005C47C6    ret
*}
end;

//005C47C8
procedure TDebugValue.CreateClone;
begin
{*
 005C47C8    mov         dl,1
 005C47CA    mov         eax,[005C449C];TDebugValue
 005C47CF    call        TObject.Create;TDebugValue.Create
 005C47D4    ret
*}
end;

//005C47D8
procedure TDebugValue.FillClone(c:TExpression);
begin
{*
 005C47D8    call        TExpression.FillClone
 005C47DD    ret
*}
end;

//005C47E0
function TDebugValue.GetDataType:TDataType;
begin
{*
 005C47E0    mov         al,4
 005C47E2    ret
*}
end;

//005C47E4
{*procedure TDebugValue.GetString(?:?);
begin
 005C47E4    push        ebx
 005C47E5    mov         ebx,edx
 005C47E7    cmp         dword ptr ds:[8155DC],0;gvar_008155DC:TTntEdit
>005C47EE    je          005C47FE
 005C47F0    mov         edx,ebx
 005C47F2    mov         eax,[008155DC];gvar_008155DC:TTntEdit
 005C47F7    call        TControl.GetText
 005C47FC    pop         ebx
 005C47FD    ret
 005C47FE    mov         eax,ebx
 005C4800    call        @UStrClr
 005C4805    pop         ebx
 005C4806    ret
end;*}

//005C4808
procedure TDebugValue.GetValue;
begin
{*
 005C4808    add         esp,0FFFFFFF8
 005C480B    xor         eax,eax
 005C480D    mov         dword ptr [esp],eax
 005C4810    mov         dword ptr [esp+4],eax
 005C4814    fld         qword ptr [esp]
 005C4817    pop         ecx
 005C4818    pop         edx
 005C4819    ret
*}
end;

//005C481C
function TDebugValue.SetString(NewValue:string):Boolean;
begin
{*
 005C481C    push        ebp
 005C481D    mov         ebp,esp
 005C481F    push        ecx
 005C4820    push        ebx
 005C4821    mov         dword ptr [ebp-4],edx
 005C4824    mov         eax,dword ptr [ebp-4]
 005C4827    call        @UStrAddRef
 005C482C    xor         eax,eax
 005C482E    push        ebp
 005C482F    push        5C4868
 005C4834    push        dword ptr fs:[eax]
 005C4837    mov         dword ptr fs:[eax],esp
 005C483A    cmp         dword ptr ds:[8155DC],0;gvar_008155DC:TTntEdit
>005C4841    je          005C4850
 005C4843    mov         edx,dword ptr [ebp-4]
 005C4846    mov         eax,[008155DC];gvar_008155DC:TTntEdit
 005C484B    call        TControl.SetText
 005C4850    mov         bl,1
 005C4852    xor         eax,eax
 005C4854    pop         edx
 005C4855    pop         ecx
 005C4856    pop         ecx
 005C4857    mov         dword ptr fs:[eax],edx
 005C485A    push        5C486F
 005C485F    lea         eax,[ebp-4]
 005C4862    call        @UStrClr
 005C4867    ret
>005C4868    jmp         @HandleFinally
>005C486D    jmp         005C485F
 005C486F    mov         eax,ebx
 005C4871    pop         ebx
 005C4872    pop         ecx
 005C4873    pop         ebp
 005C4874    ret
*}
end;

//005C4878
{*function TDebugValue.SetValue(NewValue:Double; ?:?):Boolean;
begin
 005C4878    push        ebp
 005C4879    mov         ebp,esp
 005C487B    add         esp,0FFFFFFF0
 005C487E    push        ebx
 005C487F    xor         edx,edx
 005C4881    mov         dword ptr [ebp-4],edx
 005C4884    xor         eax,eax
 005C4886    push        ebp
 005C4887    push        5C48E9
 005C488C    push        dword ptr fs:[eax]
 005C488F    mov         dword ptr fs:[eax],esp
 005C4892    cmp         dword ptr ds:[8155DC],0;gvar_008155DC:TTntEdit
>005C4899    je          005C48D1
 005C489B    push        dword ptr [ebp+0C]
 005C489E    push        dword ptr [ebp+8]
 005C48A1    mov         al,0FE
 005C48A3    call        00454908
 005C48A8    fstp        tbyte ptr [ebp-10]
 005C48AB    wait
 005C48AC    movzx       eax,word ptr [ebp-8]
 005C48B0    push        eax
 005C48B1    push        dword ptr [ebp-0C]
 005C48B4    push        dword ptr [ebp-10]
 005C48B7    lea         edx,[ebp-4]
 005C48BA    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 005C48BF    call        FloatToStr
 005C48C4    mov         edx,dword ptr [ebp-4]
 005C48C7    mov         eax,[008155DC];gvar_008155DC:TTntEdit
 005C48CC    call        TControl.SetText
 005C48D1    mov         bl,1
 005C48D3    xor         eax,eax
 005C48D5    pop         edx
 005C48D6    pop         ecx
 005C48D7    pop         ecx
 005C48D8    mov         dword ptr fs:[eax],edx
 005C48DB    push        5C48F0
 005C48E0    lea         eax,[ebp-4]
 005C48E3    call        @UStrClr
 005C48E8    ret
>005C48E9    jmp         @HandleFinally
>005C48EE    jmp         005C48E0
 005C48F0    mov         eax,ebx
 005C48F2    pop         ebx
 005C48F3    mov         esp,ebp
 005C48F5    pop         ebp
 005C48F6    ret         8
end;*}

//005C48FC
{*procedure TDebugValue.ToString(?:?);
begin
 005C48FC    push        ebx
 005C48FD    mov         ebx,edx
 005C48FF    mov         eax,ebx
 005C4901    mov         edx,5C491C;'Debug'
 005C4906    call        @UStrAsg
 005C490B    pop         ebx
 005C490C    ret
end;*}

//005C4FD0
procedure TOleServer.Connect;
begin
{*
>005C4FD0    jmp         @AbstractError
*}
end;

//005C4FD8
procedure TOleServer.Disconnect;
begin
{*
>005C4FD8    jmp         @AbstractError
*}
end;

//005C4FE0
constructor TServerEventDispatch.Create;
begin
{*
 005C4FE0    test        dl,dl
>005C4FE2    je          005C4FEC
 005C4FE4    add         esp,0FFFFFFF0
 005C4FE7    call        @ClassCreate
 005C4FEC    mov         dword ptr [eax+4],ecx
 005C4FEF    mov         dword ptr [eax+8],1
 005C4FF6    test        dl,dl
>005C4FF8    je          005C5009
 005C4FFA    call        @AfterConstruction
 005C4FFF    pop         dword ptr fs:[0]
 005C5006    add         esp,0C
 005C5009    ret
*}
end;

//005C500C
{*function sub_005C500C(?:?; ?:?; ?:?):?;
begin
 005C500C    push        ebp
 005C500D    mov         ebp,esp
 005C500F    push        ebx
 005C5010    push        esi
 005C5011    push        edi
 005C5012    mov         edi,dword ptr [ebp+10]
 005C5015    mov         esi,dword ptr [ebp+0C]
 005C5018    mov         ebx,dword ptr [ebp+8]
 005C501B    mov         ecx,edi
 005C501D    mov         edx,esi
 005C501F    mov         eax,ebx
 005C5021    call        TObject.GetInterface
 005C5026    test        al,al
>005C5028    je          005C502E
 005C502A    xor         eax,eax
>005C502C    jmp         005C5059
 005C502E    mov         eax,dword ptr [ebx+4]
 005C5031    mov         eax,dword ptr [eax+34]
 005C5034    add         eax,20
 005C5037    push        eax
 005C5038    push        esi
 005C5039    call        ole32.IsEqualGUID
 005C503E    test        al,al
>005C5040    je          005C5054
 005C5042    mov         ecx,edi
 005C5044    mov         edx,5C5060;['{00020400-0000-0000-C000-000000000046}']
 005C5049    mov         eax,ebx
 005C504B    call        TObject.GetInterface
 005C5050    xor         eax,eax
>005C5052    jmp         005C5059
 005C5054    mov         eax,80004002
 005C5059    pop         edi
 005C505A    pop         esi
 005C505B    pop         ebx
 005C505C    pop         ebp
 005C505D    ret         0C
end;*}

//005C5070
function TServerEventDispatch._AddRef:Integer; stdcall;
begin
{*
 005C5070    push        ebp
 005C5071    mov         ebp,esp
 005C5073    push        ebx
 005C5074    mov         ebx,dword ptr [ebp+8]
 005C5077    mov         eax,dword ptr [ebx+4]
 005C507A    test        eax,eax
>005C507C    je          005C5084
 005C507E    push        eax
 005C507F    call        TOleServer._AddRef
 005C5084    inc         dword ptr [ebx+8]
 005C5087    mov         eax,dword ptr [ebx+8]
 005C508A    pop         ebx
 005C508B    pop         ebp
 005C508C    ret         4
*}
end;

//005C5090
function TServerEventDispatch._Release:Integer; stdcall;
begin
{*
 005C5090    push        ebp
 005C5091    mov         ebp,esp
 005C5093    push        ebx
 005C5094    mov         ebx,dword ptr [ebp+8]
 005C5097    mov         eax,dword ptr [ebx+4]
 005C509A    test        eax,eax
>005C509C    je          005C50A4
 005C509E    push        eax
 005C509F    call        TOleServer._Release
 005C50A4    dec         dword ptr [ebx+8]
 005C50A7    mov         eax,dword ptr [ebx+8]
 005C50AA    pop         ebx
 005C50AB    pop         ebp
 005C50AC    ret         4
*}
end;

//005C50B0
function TServerEventDispatch.GetTypeInfoCount(var Count:Integer):HRESULT; stdcall;
begin
{*
 005C50B0    push        ebp
 005C50B1    mov         ebp,esp
 005C50B3    mov         eax,dword ptr [ebp+0C]
 005C50B6    xor         edx,edx
 005C50B8    mov         dword ptr [eax],edx
 005C50BA    xor         eax,eax
 005C50BC    pop         ebp
 005C50BD    ret         8
*}
end;

//005C50C0
function TServerEventDispatch.GetTypeInfo(Index:Integer; LocaleID:Integer; var TypeInfo:void ):HRESULT; stdcall;
begin
{*
 005C50C0    push        ebp
 005C50C1    mov         ebp,esp
 005C50C3    mov         eax,dword ptr [ebp+14]
 005C50C6    xor         edx,edx
 005C50C8    mov         dword ptr [eax],edx
 005C50CA    mov         eax,80004001
 005C50CF    pop         ebp
 005C50D0    ret         10
*}
end;

//005C50D4
function TServerEventDispatch.GetIDsOfNames(const IID:TGUID; Names:Pointer; NameCount:Integer; LocaleID:Integer; DispIDs:Pointer):HRESULT; stdcall;
begin
{*
 005C50D4    push        ebp
 005C50D5    mov         ebp,esp
 005C50D7    mov         eax,80004001
 005C50DC    pop         ebp
 005C50DD    ret         18
*}
end;

//005C50E0
function TServerEventDispatch.Invoke(DispID:Integer; const IID:TGUID; LocaleID:Integer; Flags:Word; var Params:void ; VarResult:Pointer; ExcepInfo:Pointer; ArgErr:Pointer):HRESULT; stdcall;
begin
{*
 005C50E0    push        ebp
 005C50E1    mov         ebp,esp
 005C50E3    add         esp,0FFFFFFF0
 005C50E6    push        ebx
 005C50E7    push        esi
 005C50E8    push        edi
 005C50E9    xor         eax,eax
 005C50EB    mov         dword ptr [ebp-4],eax
 005C50EE    xor         eax,eax
 005C50F0    push        ebp
 005C50F1    push        5C526E
 005C50F6    push        dword ptr fs:[eax]
 005C50F9    mov         dword ptr fs:[eax],esp
 005C50FC    mov         eax,dword ptr [ebp+1C]
 005C50FF    mov         dword ptr [ebp-8],eax
 005C5102    mov         eax,dword ptr [ebp-8]
 005C5105    mov         eax,dword ptr [eax+8]
 005C5108    push        eax
 005C5109    lea         eax,[ebp-4]
 005C510C    mov         ecx,1
 005C5111    mov         edx,dword ptr ds:[5C4958];TVariantArray
 005C5117    call        @DynArraySetLength
 005C511C    add         esp,4
 005C511F    xor         eax,eax
 005C5121    mov         dword ptr [ebp-0C],eax
 005C5124    mov         eax,dword ptr [ebp-4]
 005C5127    call        @DynArrayHigh
 005C512C    mov         dword ptr [ebp-10],eax
 005C512F    mov         eax,dword ptr [ebp-8]
 005C5132    cmp         dword ptr [eax+0C],0
>005C5136    jle         005C516D
 005C5138    mov         ebx,dword ptr [ebp-0C]
 005C513B    mov         edi,dword ptr [ebp-10]
 005C513E    sub         edi,ebx
>005C5140    jl          005C519C
 005C5142    inc         edi
 005C5143    mov         eax,ebx
 005C5145    add         eax,eax
 005C5147    mov         edx,dword ptr [ebp-8]
 005C514A    mov         edx,dword ptr [edx]
 005C514C    lea         esi,[edx+eax*8]
 005C514F    mov         eax,dword ptr [ebp-8]
 005C5152    mov         eax,dword ptr [eax+4]
 005C5155    mov         eax,dword ptr [eax+ebx*4]
 005C5158    add         eax,eax
 005C515A    mov         edx,dword ptr [ebp-4]
 005C515D    lea         eax,[edx+eax*8]
 005C5160    mov         edx,esi
 005C5162    call        @VarCopy
 005C5167    inc         ebx
 005C5168    dec         edi
>005C5169    jne         005C5143
>005C516B    jmp         005C519C
 005C516D    mov         ebx,dword ptr [ebp-0C]
 005C5170    mov         edi,dword ptr [ebp-10]
 005C5173    sub         edi,ebx
>005C5175    jl          005C519C
 005C5177    inc         edi
 005C5178    mov         eax,ebx
 005C517A    add         eax,eax
 005C517C    mov         edx,dword ptr [ebp-8]
 005C517F    mov         edx,dword ptr [edx]
 005C5181    lea         esi,[edx+eax*8]
 005C5184    mov         eax,dword ptr [ebp-10]
 005C5187    sub         eax,ebx
 005C5189    add         eax,eax
 005C518B    mov         edx,dword ptr [ebp-4]
 005C518E    lea         eax,[edx+eax*8]
 005C5191    mov         edx,esi
 005C5193    call        @VarCopy
 005C5198    inc         ebx
 005C5199    dec         edi
>005C519A    jne         005C5178
 005C519C    mov         eax,dword ptr [ebp+8]
 005C519F    mov         eax,dword ptr [eax+4]
 005C51A2    test        eax,eax
>005C51A4    je          005C51B1
 005C51A6    lea         ecx,[ebp-4]
 005C51A9    mov         edx,dword ptr [ebp+0C]
 005C51AC    mov         ebx,dword ptr [eax]
 005C51AE    call        dword ptr [ebx+3C]
 005C51B1    mov         eax,dword ptr [ebp-8]
 005C51B4    cmp         dword ptr [eax+0C],0
>005C51B8    jle         005C51FC
 005C51BA    mov         ebx,dword ptr [ebp-0C]
 005C51BD    mov         edi,dword ptr [ebp-10]
 005C51C0    sub         edi,ebx
>005C51C2    jl          005C5238
 005C51C4    inc         edi
 005C51C5    mov         eax,ebx
 005C51C7    add         eax,eax
 005C51C9    mov         edx,dword ptr [ebp-8]
 005C51CC    mov         edx,dword ptr [edx]
 005C51CE    lea         esi,[edx+eax*8]
 005C51D1    movzx       eax,word ptr [esi]
 005C51D4    and         ax,4000
 005C51D8    cmp         ax,4000
>005C51DC    jne         005C51F6
 005C51DE    mov         eax,esi
 005C51E0    mov         edx,dword ptr [ebp-8]
 005C51E3    mov         edx,dword ptr [edx+4]
 005C51E6    mov         edx,dword ptr [edx+ebx*4]
 005C51E9    add         edx,edx
 005C51EB    mov         ecx,dword ptr [ebp-4]
 005C51EE    lea         edx,[ecx+edx*8]
 005C51F1    call        @VarCopy
 005C51F6    inc         ebx
 005C51F7    dec         edi
>005C51F8    jne         005C51C5
>005C51FA    jmp         005C5238
 005C51FC    mov         ebx,dword ptr [ebp-0C]
 005C51FF    mov         edi,dword ptr [ebp-10]
 005C5202    sub         edi,ebx
>005C5204    jl          005C5238
 005C5206    inc         edi
 005C5207    mov         eax,ebx
 005C5209    add         eax,eax
 005C520B    mov         edx,dword ptr [ebp-8]
 005C520E    mov         edx,dword ptr [edx]
 005C5210    lea         esi,[edx+eax*8]
 005C5213    movzx       eax,word ptr [esi]
 005C5216    and         ax,4000
 005C521A    cmp         ax,4000
>005C521E    jne         005C5234
 005C5220    mov         eax,esi
 005C5222    mov         edx,dword ptr [ebp-10]
 005C5225    sub         edx,ebx
 005C5227    add         edx,edx
 005C5229    mov         ecx,dword ptr [ebp-4]
 005C522C    lea         edx,[ecx+edx*8]
 005C522F    call        @VarCopy
 005C5234    inc         ebx
 005C5235    dec         edi
>005C5236    jne         005C5207
 005C5238    push        0
 005C523A    lea         eax,[ebp-4]
 005C523D    mov         ecx,1
 005C5242    mov         edx,dword ptr ds:[5C4958];TVariantArray
 005C5248    call        @DynArraySetLength
 005C524D    add         esp,4
 005C5250    xor         ebx,ebx
 005C5252    xor         eax,eax
 005C5254    pop         edx
 005C5255    pop         ecx
 005C5256    pop         ecx
 005C5257    mov         dword ptr fs:[eax],edx
 005C525A    push        5C5275
 005C525F    lea         eax,[ebp-4]
 005C5262    mov         edx,dword ptr ds:[5C4958];TVariantArray
 005C5268    call        @DynArrayClear
 005C526D    ret
>005C526E    jmp         @HandleFinally
>005C5273    jmp         005C525F
 005C5275    mov         eax,ebx
 005C5277    pop         edi
 005C5278    pop         esi
 005C5279    pop         ebx
 005C527A    mov         esp,ebp
 005C527C    pop         ebp
 005C527D    ret         24
*}
end;

//005C5280
function TServerEventDispatch.ServerDisconnect:Boolean;
begin
{*
 005C5280    xor         edx,edx
 005C5282    mov         dword ptr [eax+4],edx
 005C5285    test        edx,edx
>005C5287    je          005C528C
 005C5289    xor         eax,eax
 005C528B    ret
 005C528C    mov         al,1
 005C528E    ret
*}
end;

//005C5290
constructor TOleServer.Create;
begin
{*
 005C5290    push        ebx
 005C5291    push        esi
 005C5292    test        dl,dl
>005C5294    je          005C529E
 005C5296    add         esp,0FFFFFFF0
 005C5299    call        @ClassCreate
 005C529E    mov         ebx,edx
 005C52A0    mov         esi,eax
 005C52A2    xor         edx,edx
 005C52A4    mov         eax,esi
 005C52A6    call        TComponent.Create
 005C52AB    mov         eax,esi
 005C52AD    mov         edx,dword ptr [eax]
 005C52AF    call        dword ptr [edx+34]
 005C52B2    cmp         dword ptr [esi+34],0
>005C52B6    jne         005C52CC
 005C52B8    mov         ecx,0F9
 005C52BD    mov         edx,5C530C;'C:\Builds\TP\vcl\OleServer.pas'
 005C52C2    mov         eax,5C5358;'Assertion failure'
 005C52C7    call        @Assert
 005C52CC    mov         eax,dword ptr [esi+34]
 005C52CF    inc         dword ptr [eax+38]
 005C52D2    mov         ecx,esi
 005C52D4    mov         dl,1
 005C52D6    mov         eax,[005C4AAC];TServerEventDispatch
 005C52DB    call        TServerEventDispatch.Create
 005C52E0    mov         dword ptr [esi+3C],eax
 005C52E3    mov         eax,esi
 005C52E5    test        bl,bl
>005C52E7    je          005C52F8
 005C52E9    call        @AfterConstruction
 005C52EE    pop         dword ptr fs:[0]
 005C52F5    add         esp,0C
 005C52F8    mov         eax,esi
 005C52FA    pop         esi
 005C52FB    pop         ebx
 005C52FC    ret
*}
end;

//005C537C
destructor TOleServer.Destroy();
begin
{*
 005C537C    push        ebx
 005C537D    push        esi
 005C537E    call        @BeforeDestruction
 005C5383    mov         ebx,edx
 005C5385    mov         esi,eax
 005C5387    mov         eax,esi
 005C5389    mov         edx,dword ptr [eax]
 005C538B    call        dword ptr [edx+44]
 005C538E    mov         eax,dword ptr [esi+3C]
 005C5391    call        TServerEventDispatch.ServerDisconnect
 005C5396    mov         eax,dword ptr [esi+3C]
 005C5399    push        eax
 005C539A    call        TServerEventDispatch._Release
 005C539F    test        eax,eax
>005C53A1    jne         005C53AB
 005C53A3    mov         eax,dword ptr [esi+3C]
 005C53A6    call        TObject.Free
 005C53AB    mov         eax,dword ptr [esi+34]
 005C53AE    dec         dword ptr [eax+38]
 005C53B1    mov         edx,ebx
 005C53B3    and         dl,0FC
 005C53B6    mov         eax,esi
 005C53B8    call        TComponent.Destroy
 005C53BD    test        bl,bl
>005C53BF    jle         005C53C8
 005C53C1    mov         eax,esi
 005C53C3    call        @ClassDestroy
 005C53C8    pop         esi
 005C53C9    pop         ebx
 005C53CA    ret
*}
end;

//005C53CC
procedure TOleServer.Loaded;
begin
{*
 005C53CC    push        ebx
 005C53CD    mov         ebx,eax
 005C53CF    mov         eax,ebx
 005C53D1    call        TComponent.Loaded
 005C53D6    test        byte ptr [ebx+1C],10
>005C53DA    jne         005C53EE
 005C53DC    mov         eax,ebx
 005C53DE    call        TOleServer.GetAutoConnect
 005C53E3    test        al,al
>005C53E5    je          005C53EE
 005C53E7    mov         eax,ebx
 005C53E9    mov         edx,dword ptr [eax]
 005C53EB    call        dword ptr [edx+40]
 005C53EE    pop         ebx
 005C53EF    ret
*}
end;

//005C53F0
procedure sub_005C53F0;
begin
{*
 005C53F0    ret
*}
end;

//005C53F4
function TOleServer.GetServer:IUnknown;
begin
{*
 005C53F4    push        ebp
 005C53F5    mov         ebp,esp
 005C53F7    mov         ecx,4
 005C53FC    push        0
 005C53FE    push        0
 005C5400    dec         ecx
>005C5401    jne         005C53FC
 005C5403    push        ecx
 005C5404    push        ebx
 005C5405    push        esi
 005C5406    mov         esi,edx
 005C5408    mov         ebx,eax
 005C540A    xor         eax,eax
 005C540C    push        ebp
 005C540D    push        5C553E
 005C5412    push        dword ptr fs:[eax]
 005C5415    mov         dword ptr fs:[eax],esp
 005C5418    mov         eax,ebx
 005C541A    call        TOleServer.GetConnectKind
 005C541F    sub         al,1
>005C5421    jb          005C54D0
>005C5427    je          005C543A
 005C5429    dec         al
>005C542B    je          005C5449
 005C542D    dec         al
>005C542F    je          005C54FB
>005C5435    jmp         005C5513
 005C543A    mov         edx,esi
 005C543C    mov         eax,dword ptr [ebx+34]
 005C543F    call        CreateComObject
>005C5444    jmp         005C5513
 005C5449    mov         eax,esi
 005C544B    call        @IntfClear
 005C5450    push        eax
 005C5451    push        0
 005C5453    mov         eax,dword ptr [ebx+34]
 005C5456    push        eax
 005C5457    call        oleaut32.GetActiveObject
 005C545C    mov         esi,eax
 005C545E    test        esi,80000000
>005C5464    je          005C5513
 005C546A    lea         eax,[ebp-4]
 005C546D    push        eax
 005C546E    lea         edx,[ebp-18]
 005C5471    mov         eax,dword ptr [ebx+34]
 005C5474    call        ClassIDToProgID
 005C5479    mov         eax,dword ptr [ebp-18]
 005C547C    mov         dword ptr [ebp-14],eax
 005C547F    mov         byte ptr [ebp-10],11
 005C5483    lea         edx,[ebp-1C]
 005C5486    mov         eax,dword ptr [ebx+34]
 005C5489    call        GUIDToString
 005C548E    mov         eax,dword ptr [ebp-1C]
 005C5491    mov         dword ptr [ebp-0C],eax
 005C5494    mov         byte ptr [ebp-8],11
 005C5498    lea         eax,[ebp-14]
 005C549B    push        eax
 005C549C    lea         edx,[ebp-20]
 005C549F    mov         eax,[0078D8D0];^SResString712:TResStringRec
 005C54A4    call        LoadResString
 005C54A9    mov         eax,dword ptr [ebp-20]
 005C54AC    mov         ecx,1
 005C54B1    pop         edx
 005C54B2    call        Format
 005C54B7    push        esi
 005C54B8    push        0
 005C54BA    mov         ecx,dword ptr [ebp-4]
 005C54BD    mov         dl,1
 005C54BF    mov         eax,[0052E794];EOleSysError
 005C54C4    call        EOleSysError.Create
 005C54C9    call        @RaiseExcept
>005C54CE    jmp         005C5513
 005C54D0    mov         eax,esi
 005C54D2    call        @IntfClear
 005C54D7    push        eax
 005C54D8    push        0
 005C54DA    mov         eax,dword ptr [ebx+34]
 005C54DD    push        eax
 005C54DE    call        oleaut32.GetActiveObject
 005C54E3    test        eax,80000000
 005C54E8    sete        al
 005C54EB    test        al,al
>005C54ED    jne         005C5513
 005C54EF    mov         edx,esi
 005C54F1    mov         eax,dword ptr [ebx+34]
 005C54F4    call        CreateComObject
>005C54F9    jmp         005C5513
 005C54FB    lea         eax,[ebp-24]
 005C54FE    mov         edx,dword ptr [ebx+48]
 005C5501    call        @WStrFromUStr
 005C5506    mov         eax,dword ptr [ebp-24]
 005C5509    mov         ecx,esi
 005C550B    mov         edx,dword ptr [ebx+34]
 005C550E    call        CreateRemoteComObject
 005C5513    xor         eax,eax
 005C5515    pop         edx
 005C5516    pop         ecx
 005C5517    pop         ecx
 005C5518    mov         dword ptr fs:[eax],edx
 005C551B    push        5C5545
 005C5520    lea         eax,[ebp-24]
 005C5523    call        @WStrClr
 005C5528    lea         eax,[ebp-20]
 005C552B    mov         edx,3
 005C5530    call        @UStrArrayClr
 005C5535    lea         eax,[ebp-4]
 005C5538    call        @UStrClr
 005C553D    ret
>005C553E    jmp         @HandleFinally
>005C5543    jmp         005C5520
 005C5545    pop         esi
 005C5546    pop         ebx
 005C5547    mov         esp,ebp
 005C5549    pop         ebp
 005C554A    ret
*}
end;

//005C554C
procedure TOleServer.ConnectEvents(const Obj:IUnknown);
begin
{*
 005C554C    lea         ecx,[eax+40]
 005C554F    push        ecx
 005C5550    mov         ecx,dword ptr [eax+3C]
 005C5553    test        ecx,ecx
>005C5555    je          005C555A
 005C5557    sub         ecx,0FFFFFFF4
 005C555A    mov         eax,dword ptr [eax+34]
 005C555D    add         eax,20
 005C5560    xchg        eax,edx
 005C5561    call        InterfaceConnect
 005C5566    ret
*}
end;

//005C5568
procedure TOleServer.DisconnectEvents(const Obj:IUnknown);
begin
{*
 005C5568    lea         ecx,[eax+40]
 005C556B    mov         eax,dword ptr [eax+34]
 005C556E    add         eax,20
 005C5571    xchg        eax,edx
 005C5572    call        InterfaceDisconnect
 005C5577    ret
*}
end;

//005C5578
function TOleServer.GetConnectKind:TConnectKind;
begin
{*
 005C5578    push        ebx
 005C5579    mov         ebx,eax
 005C557B    cmp         dword ptr [ebx+48],0
>005C557F    je          005C5585
 005C5581    mov         al,3
 005C5583    pop         ebx
 005C5584    ret
 005C5585    movzx       eax,byte ptr [ebx+4C]
 005C5589    pop         ebx
 005C558A    ret
*}
end;

//005C558C
procedure TOleServer.SetConnectKind(Value:TConnectKind);
begin
{*
 005C558C    mov         byte ptr [eax+4C],dl;TOleServer.FConnectKind:TConnectKind
 005C558F    ret
*}
end;

//005C5590
function TOleServer.GetAutoConnect:Boolean;
begin
{*
 005C5590    push        ebx
 005C5591    mov         ebx,eax
 005C5593    mov         eax,ebx
 005C5595    call        TOleServer.GetConnectKind
 005C559A    cmp         al,4
>005C559C    jne         005C55A2
 005C559E    xor         eax,eax
 005C55A0    pop         ebx
 005C55A1    ret
 005C55A2    movzx       eax,byte ptr [ebx+44]
 005C55A6    pop         ebx
 005C55A7    ret
*}
end;

//005C55A8
procedure TOleServer.SetAutoConnect(Value:Boolean);
begin
{*
 005C55A8    mov         byte ptr [eax+44],dl;TOleServer.FAutoConnect:Boolean
 005C55AB    ret
*}
end;

//005C55AC
function TOleServer.QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;
begin
{*
 005C55AC    push        ebp
 005C55AD    mov         ebp,esp
 005C55AF    push        ebx
 005C55B0    mov         ebx,dword ptr [ebp+8]
 005C55B3    mov         ecx,dword ptr [ebp+10]
 005C55B6    mov         edx,dword ptr [ebp+0C]
 005C55B9    mov         eax,ebx
 005C55BB    call        TObject.GetInterface
 005C55C0    test        al,al
>005C55C2    je          005C55C8
 005C55C4    xor         eax,eax
>005C55C6    jmp         005C55CD
 005C55C8    mov         eax,80004002
 005C55CD    pop         ebx
 005C55CE    pop         ebp
 005C55CF    ret         0C
*}
end;

//005C55D4
function TOleServer._AddRef:Integer; stdcall;
begin
{*
 005C55D4    push        ebp
 005C55D5    mov         ebp,esp
 005C55D7    mov         eax,dword ptr [ebp+8]
 005C55DA    inc         dword ptr [eax+38]
 005C55DD    mov         eax,dword ptr [eax+38]
 005C55E0    pop         ebp
 005C55E1    ret         4
*}
end;

//005C55E4
function TOleServer._Release:Integer; stdcall;
begin
{*
 005C55E4    push        ebp
 005C55E5    mov         ebp,esp
 005C55E7    mov         eax,dword ptr [ebp+8]
 005C55EA    dec         dword ptr [eax+38]
 005C55ED    mov         eax,dword ptr [eax+38]
 005C55F0    pop         ebp
 005C55F1    ret         4
*}
end;

Initialization
//007816C0
{*
 007816C0    sub         dword ptr ds:[8155E0],1
>007816C7    jae         007816D9
 007816C9    mov         edx,dword ptr ds:[47A16C];TControl
 007816CF    mov         eax,[005C4CD0];TOleServer
 007816D4    call        GroupDescendentsWith
 007816D9    ret
*}
Finalization
end.