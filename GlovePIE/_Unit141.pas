//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit141;

interface

uses
  SysUtils, Classes;

type
  TAccelerometerReading = procedure(ASender:TObject; const piReading:IMeterReading) of object;;
  TAccelerometer = class(TOleServer)
  published
    function Calibrate3:WordBool;//006F54B0
    function Calibrate2:WordBool;//006F5450
    function Calibrate1:WordBool;//006F53F0
    function RegisterForMotion:WordBool;//006F5510
    procedure CalculateCalibratedValues(RawX:Integer; RawY:Integer; var pReturnZ:Single; var pReturnY:Single; var pReturnX:Single; RawZ:Integer);//006F5614
    procedure FireOnMotion(piReading:IMeterReading);//006F55C0
    procedure UnregisterForMotion;//006F5570
    procedure Connect;//006F4ED0
    destructor Destroy();//006F501C
    constructor Create(AOwner:TComponent);//006F4FE4
    procedure ConnectTo(svrIntf:IAccelerometer);//006F4F44
    //procedure GetReading(?:?);//006F5394
    function FindHidDevice(lVendorId:Integer; lProductId:Integer):WordBool;//006F5328
    procedure Disconnect;//006F4FA4
  public
    FOnReading:TAccelerometerReading;//f58
    FIntf:IAccelerometer;//f60
    destructor Destroy(); virtual;//006F501C
    constructor Create(AOwner:TComponent); virtual;//v2C//006F4FE4
    procedure v34; virtual;//v34//006F4EC4
    //procedure v3C(?:?); virtual;//v3C//006F5044
    procedure Connect; virtual;//v40//006F4ED0
    procedure Disconnect; virtual;//v44//006F4FA4
  end;
  TLaptopValue = class(TObjectValue)
  published
    function GetUnits:TUnits;//006F5EF8
    //procedure GetString(?:?);//006F5ED0
    procedure FillClone(c:TExpression);//006F5E58
    procedure GetVector(x:Double; y:Double; z:Double);//006F617C
    function GetPerUnits2:TUnits;//006F5EB4
    function GetPerUnits1:TUnits;//006F5E98
    procedure SetValue(NewValue:Double);//006F62F0
    function CanSet:Boolean;//006F5E44
    function GetDataType:TDataType;//006F5E78
    procedure CreateClone;//006F5E48
    procedure GetValue;//006F5F1C
    //procedure ToString(?:?);//006F6318
  public
    ............................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//006F6318
    procedure GetValue; virtual;//v2C//006F5F1C
    //procedure GetString(?:?); virtual;//v38//006F5ED0
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//006F617C
    function GetDataType:TDataType; virtual;//v44//006F5E78
    function GetUnits:TUnits; virtual;//v48//006F5EF8
    function GetPerUnits1:TUnits; virtual;//v4C//006F5E98
    function GetPerUnits2:TUnits; virtual;//v50//006F5EB4
    procedure SetValue(NewValue:Double); virtual;//v58//006F62F0
    function CanSet:Boolean; virtual;//v68//006F5E44
    procedure CreateClone; virtual;//v80//006F5E48
    procedure FillClone(c:TExpression); virtual;//v84//006F5E58
  end;
    procedure sub_006F4EC4;//006F4EC4
    //procedure sub_006F4FC4(?:TAccelerometer; ?:?);//006F4FC4
    //procedure sub_006F5044(?:?);//006F5044
    procedure sub_006F5A70;//006F5A70
    //function sub_006F5D58(?:?):?;//006F5D58
    procedure sub_006F63FC;//006F63FC
    procedure sub_006F64CC;//006F64CC
    //function sub_006F64F8:?;//006F64F8
    //function sub_006F66D4(?:UnicodeString):?;//006F66D4
    //procedure sub_006F6724(?:Integer; ?:?);//006F6724
    //function sub_006F673C:?;//006F673C
    //function sub_006F67B0(?:?):?;//006F67B0

implementation

//006F4EC4
procedure sub_006F4EC4;
begin
{*
 006F4EC4    mov         edx,78C374
 006F4EC9    mov         dword ptr [eax+34],edx;TAccelerometer.FServerData:PServerData
 006F4ECC    ret
*}
end;

//006F4ED0
procedure TAccelerometer.Connect;
begin
{*
 006F4ED0    push        ebp
 006F4ED1    mov         ebp,esp
 006F4ED3    push        0
 006F4ED5    push        ebx
 006F4ED6    mov         ebx,eax
 006F4ED8    xor         eax,eax
 006F4EDA    push        ebp
 006F4EDB    push        6F4F26
 006F4EE0    push        dword ptr fs:[eax]
 006F4EE3    mov         dword ptr fs:[eax],esp
 006F4EE6    cmp         dword ptr [ebx+60],0;TAccelerometer.FIntf:IAccelerometer
>006F4EEA    jne         006F4F10
 006F4EEC    lea         edx,[ebp-4]
 006F4EEF    mov         eax,ebx
 006F4EF1    mov         ecx,dword ptr [eax]
 006F4EF3    call        dword ptr [ecx+38];TOleServer.GetServer
 006F4EF6    mov         edx,dword ptr [ebp-4]
 006F4EF9    mov         eax,ebx
 006F4EFB    call        TOleServer.ConnectEvents
 006F4F00    lea         eax,[ebx+60];TAccelerometer.FIntf:IAccelerometer
 006F4F03    mov         edx,dword ptr [ebp-4]
 006F4F06    mov         ecx,6F4F34;['{6670CA25-CFCE-4D70-93C8-2D1004EB7FFA}']
 006F4F0B    call        @IntfCast
 006F4F10    xor         eax,eax
 006F4F12    pop         edx
 006F4F13    pop         ecx
 006F4F14    pop         ecx
 006F4F15    mov         dword ptr fs:[eax],edx
 006F4F18    push        6F4F2D
 006F4F1D    lea         eax,[ebp-4]
 006F4F20    call        @IntfClear
 006F4F25    ret
>006F4F26    jmp         @HandleFinally
>006F4F2B    jmp         006F4F1D
 006F4F2D    pop         ebx
 006F4F2E    pop         ecx
 006F4F2F    pop         ebp
 006F4F30    ret
*}
end;

//006F4F44
procedure TAccelerometer.ConnectTo(svrIntf:IAccelerometer);
begin
{*
 006F4F44    push        ebp
 006F4F45    mov         ebp,esp
 006F4F47    push        ecx
 006F4F48    push        ebx
 006F4F49    mov         dword ptr [ebp-4],edx
 006F4F4C    mov         ebx,eax
 006F4F4E    mov         eax,dword ptr [ebp-4]
 006F4F51    call        @IntfAddRef
 006F4F56    xor         eax,eax
 006F4F58    push        ebp
 006F4F59    push        6F4F96
 006F4F5E    push        dword ptr fs:[eax]
 006F4F61    mov         dword ptr fs:[eax],esp
 006F4F64    mov         eax,ebx
 006F4F66    mov         edx,dword ptr [eax]
 006F4F68    call        dword ptr [edx+44];TAccelerometer.Disconnect
 006F4F6B    lea         eax,[ebx+60];TAccelerometer.FIntf:IAccelerometer
 006F4F6E    mov         edx,dword ptr [ebp-4]
 006F4F71    call        @IntfCopy
 006F4F76    mov         edx,dword ptr [ebx+60];TAccelerometer.FIntf:IAccelerometer
 006F4F79    mov         eax,ebx
 006F4F7B    call        TOleServer.ConnectEvents
 006F4F80    xor         eax,eax
 006F4F82    pop         edx
 006F4F83    pop         ecx
 006F4F84    pop         ecx
 006F4F85    mov         dword ptr fs:[eax],edx
 006F4F88    push        6F4F9D
 006F4F8D    lea         eax,[ebp-4]
 006F4F90    call        @IntfClear
 006F4F95    ret
>006F4F96    jmp         @HandleFinally
>006F4F9B    jmp         006F4F8D
 006F4F9D    pop         ebx
 006F4F9E    pop         ecx
 006F4F9F    pop         ebp
 006F4FA0    ret
*}
end;

//006F4FA4
procedure TAccelerometer.Disconnect;
begin
{*
 006F4FA4    push        ebx
 006F4FA5    mov         ebx,eax
 006F4FA7    cmp         dword ptr [ebx+60],0;TAccelerometer.FIntf:IAccelerometer
>006F4FAB    je          006F4FBF
 006F4FAD    mov         edx,dword ptr [ebx+60];TAccelerometer.FIntf:IAccelerometer
 006F4FB0    mov         eax,ebx
 006F4FB2    call        TOleServer.DisconnectEvents
 006F4FB7    lea         eax,[ebx+60];TAccelerometer.FIntf:IAccelerometer
 006F4FBA    call        @IntfClear
 006F4FBF    pop         ebx
 006F4FC0    ret
*}
end;

//006F4FC4
{*procedure sub_006F4FC4(?:TAccelerometer; ?:?);
begin
 006F4FC4    push        ebx
 006F4FC5    push        esi
 006F4FC6    mov         esi,edx
 006F4FC8    mov         ebx,eax
 006F4FCA    cmp         dword ptr [ebx+60],0
>006F4FCE    jne         006F4FD7
 006F4FD0    mov         eax,ebx
 006F4FD2    mov         edx,dword ptr [eax]
 006F4FD4    call        dword ptr [edx+40]
 006F4FD7    mov         eax,esi
 006F4FD9    mov         edx,dword ptr [ebx+60]
 006F4FDC    call        @IntfCopy
 006F4FE1    pop         esi
 006F4FE2    pop         ebx
 006F4FE3    ret
end;*}

//006F4FE4
constructor TAccelerometer.Create(AOwner:TComponent);
begin
{*
 006F4FE4    push        ebx
 006F4FE5    push        esi
 006F4FE6    test        dl,dl
>006F4FE8    je          006F4FF2
 006F4FEA    add         esp,0FFFFFFF0
 006F4FED    call        @ClassCreate
 006F4FF2    mov         ebx,edx
 006F4FF4    mov         esi,eax
 006F4FF6    xor         edx,edx
 006F4FF8    mov         eax,esi
 006F4FFA    call        TOleServer.Create
 006F4FFF    mov         eax,esi
 006F5001    test        bl,bl
>006F5003    je          006F5014
 006F5005    call        @AfterConstruction
 006F500A    pop         dword ptr fs:[0]
 006F5011    add         esp,0C
 006F5014    mov         eax,esi
 006F5016    pop         esi
 006F5017    pop         ebx
 006F5018    ret
*}
end;

//006F501C
destructor TAccelerometer.Destroy();
begin
{*
 006F501C    push        ebx
 006F501D    push        esi
 006F501E    call        @BeforeDestruction
 006F5023    mov         ebx,edx
 006F5025    mov         esi,eax
 006F5027    mov         edx,ebx
 006F5029    and         dl,0FC
 006F502C    mov         eax,esi
 006F502E    call        TOleServer.Destroy
 006F5033    test        bl,bl
>006F5035    jle         006F503E
 006F5037    mov         eax,esi
 006F5039    call        @ClassDestroy
 006F503E    pop         esi
 006F503F    pop         ebx
 006F5040    ret
*}
end;

//006F5044
{*procedure sub_006F5044(?:?);
begin
 006F5044    sub         edx,0FFFFFFFF
 006F5047    ret
end;*}

//006F5328
function TAccelerometer.FindHidDevice(lVendorId:Integer; lProductId:Integer):WordBool;
begin
{*
 006F5328    push        ebp
 006F5329    mov         ebp,esp
 006F532B    add         esp,0FFFFFFF8
 006F532E    push        ebx
 006F532F    push        esi
 006F5330    push        edi
 006F5331    xor         ebx,ebx
 006F5333    mov         dword ptr [ebp-8],ebx
 006F5336    mov         edi,ecx
 006F5338    mov         esi,edx
 006F533A    mov         ebx,eax
 006F533C    xor         eax,eax
 006F533E    push        ebp
 006F533F    push        6F5382
 006F5344    push        dword ptr fs:[eax]
 006F5347    mov         dword ptr fs:[eax],esp
 006F534A    lea         eax,[ebp-4]
 006F534D    push        eax
 006F534E    push        edi
 006F534F    push        esi
 006F5350    lea         edx,[ebp-8]
 006F5353    mov         eax,ebx
 006F5355    call        006F4FC4
 006F535A    mov         eax,dword ptr [ebp-8]
 006F535D    push        eax
 006F535E    mov         eax,dword ptr [eax]
 006F5360    call        dword ptr [eax+1C]
 006F5363    call        @CheckAutoResult
 006F5368    movzx       ebx,word ptr [ebp-4]
 006F536C    xor         eax,eax
 006F536E    pop         edx
 006F536F    pop         ecx
 006F5370    pop         ecx
 006F5371    mov         dword ptr fs:[eax],edx
 006F5374    push        6F5389
 006F5379    lea         eax,[ebp-8]
 006F537C    call        @IntfClear
 006F5381    ret
>006F5382    jmp         @HandleFinally
>006F5387    jmp         006F5379
 006F5389    mov         eax,ebx
 006F538B    pop         edi
 006F538C    pop         esi
 006F538D    pop         ebx
 006F538E    pop         ecx
 006F538F    pop         ecx
 006F5390    pop         ebp
 006F5391    ret
*}
end;

//006F5394
{*procedure TAccelerometer.GetReading(?:?);
begin
 006F5394    push        ebp
 006F5395    mov         ebp,esp
 006F5397    push        0
 006F5399    push        ebx
 006F539A    push        esi
 006F539B    mov         esi,edx
 006F539D    mov         ebx,eax
 006F539F    xor         eax,eax
 006F53A1    push        ebp
 006F53A2    push        6F53E3
 006F53A7    push        dword ptr fs:[eax]
 006F53AA    mov         dword ptr fs:[eax],esp
 006F53AD    mov         eax,esi
 006F53AF    call        @IntfClear
 006F53B4    push        eax
 006F53B5    lea         edx,[ebp-4]
 006F53B8    mov         eax,ebx
 006F53BA    call        006F4FC4
 006F53BF    mov         eax,dword ptr [ebp-4]
 006F53C2    push        eax
 006F53C3    mov         eax,dword ptr [eax]
 006F53C5    call        dword ptr [eax+20]
 006F53C8    call        @CheckAutoResult
 006F53CD    xor         eax,eax
 006F53CF    pop         edx
 006F53D0    pop         ecx
 006F53D1    pop         ecx
 006F53D2    mov         dword ptr fs:[eax],edx
 006F53D5    push        6F53EA
 006F53DA    lea         eax,[ebp-4]
 006F53DD    call        @IntfClear
 006F53E2    ret
>006F53E3    jmp         @HandleFinally
>006F53E8    jmp         006F53DA
 006F53EA    pop         esi
 006F53EB    pop         ebx
 006F53EC    pop         ecx
 006F53ED    pop         ebp
 006F53EE    ret
end;*}

//006F53F0
function TAccelerometer.Calibrate1:WordBool;
begin
{*
 006F53F0    push        ebp
 006F53F1    mov         ebp,esp
 006F53F3    add         esp,0FFFFFFF8
 006F53F6    push        ebx
 006F53F7    xor         edx,edx
 006F53F9    mov         dword ptr [ebp-8],edx
 006F53FC    mov         ebx,eax
 006F53FE    xor         eax,eax
 006F5400    push        ebp
 006F5401    push        6F5442
 006F5406    push        dword ptr fs:[eax]
 006F5409    mov         dword ptr fs:[eax],esp
 006F540C    lea         eax,[ebp-4]
 006F540F    push        eax
 006F5410    lea         edx,[ebp-8]
 006F5413    mov         eax,ebx
 006F5415    call        006F4FC4
 006F541A    mov         eax,dword ptr [ebp-8]
 006F541D    push        eax
 006F541E    mov         eax,dword ptr [eax]
 006F5420    call        dword ptr [eax+24]
 006F5423    call        @CheckAutoResult
 006F5428    movzx       ebx,word ptr [ebp-4]
 006F542C    xor         eax,eax
 006F542E    pop         edx
 006F542F    pop         ecx
 006F5430    pop         ecx
 006F5431    mov         dword ptr fs:[eax],edx
 006F5434    push        6F5449
 006F5439    lea         eax,[ebp-8]
 006F543C    call        @IntfClear
 006F5441    ret
>006F5442    jmp         @HandleFinally
>006F5447    jmp         006F5439
 006F5449    mov         eax,ebx
 006F544B    pop         ebx
 006F544C    pop         ecx
 006F544D    pop         ecx
 006F544E    pop         ebp
 006F544F    ret
*}
end;

//006F5450
function TAccelerometer.Calibrate2:WordBool;
begin
{*
 006F5450    push        ebp
 006F5451    mov         ebp,esp
 006F5453    add         esp,0FFFFFFF8
 006F5456    push        ebx
 006F5457    xor         edx,edx
 006F5459    mov         dword ptr [ebp-8],edx
 006F545C    mov         ebx,eax
 006F545E    xor         eax,eax
 006F5460    push        ebp
 006F5461    push        6F54A2
 006F5466    push        dword ptr fs:[eax]
 006F5469    mov         dword ptr fs:[eax],esp
 006F546C    lea         eax,[ebp-4]
 006F546F    push        eax
 006F5470    lea         edx,[ebp-8]
 006F5473    mov         eax,ebx
 006F5475    call        006F4FC4
 006F547A    mov         eax,dword ptr [ebp-8]
 006F547D    push        eax
 006F547E    mov         eax,dword ptr [eax]
 006F5480    call        dword ptr [eax+28]
 006F5483    call        @CheckAutoResult
 006F5488    movzx       ebx,word ptr [ebp-4]
 006F548C    xor         eax,eax
 006F548E    pop         edx
 006F548F    pop         ecx
 006F5490    pop         ecx
 006F5491    mov         dword ptr fs:[eax],edx
 006F5494    push        6F54A9
 006F5499    lea         eax,[ebp-8]
 006F549C    call        @IntfClear
 006F54A1    ret
>006F54A2    jmp         @HandleFinally
>006F54A7    jmp         006F5499
 006F54A9    mov         eax,ebx
 006F54AB    pop         ebx
 006F54AC    pop         ecx
 006F54AD    pop         ecx
 006F54AE    pop         ebp
 006F54AF    ret
*}
end;

//006F54B0
function TAccelerometer.Calibrate3:WordBool;
begin
{*
 006F54B0    push        ebp
 006F54B1    mov         ebp,esp
 006F54B3    add         esp,0FFFFFFF8
 006F54B6    push        ebx
 006F54B7    xor         edx,edx
 006F54B9    mov         dword ptr [ebp-8],edx
 006F54BC    mov         ebx,eax
 006F54BE    xor         eax,eax
 006F54C0    push        ebp
 006F54C1    push        6F5502
 006F54C6    push        dword ptr fs:[eax]
 006F54C9    mov         dword ptr fs:[eax],esp
 006F54CC    lea         eax,[ebp-4]
 006F54CF    push        eax
 006F54D0    lea         edx,[ebp-8]
 006F54D3    mov         eax,ebx
 006F54D5    call        006F4FC4
 006F54DA    mov         eax,dword ptr [ebp-8]
 006F54DD    push        eax
 006F54DE    mov         eax,dword ptr [eax]
 006F54E0    call        dword ptr [eax+2C]
 006F54E3    call        @CheckAutoResult
 006F54E8    movzx       ebx,word ptr [ebp-4]
 006F54EC    xor         eax,eax
 006F54EE    pop         edx
 006F54EF    pop         ecx
 006F54F0    pop         ecx
 006F54F1    mov         dword ptr fs:[eax],edx
 006F54F4    push        6F5509
 006F54F9    lea         eax,[ebp-8]
 006F54FC    call        @IntfClear
 006F5501    ret
>006F5502    jmp         @HandleFinally
>006F5507    jmp         006F54F9
 006F5509    mov         eax,ebx
 006F550B    pop         ebx
 006F550C    pop         ecx
 006F550D    pop         ecx
 006F550E    pop         ebp
 006F550F    ret
*}
end;

//006F5510
function TAccelerometer.RegisterForMotion:WordBool;
begin
{*
 006F5510    push        ebp
 006F5511    mov         ebp,esp
 006F5513    add         esp,0FFFFFFF8
 006F5516    push        ebx
 006F5517    xor         edx,edx
 006F5519    mov         dword ptr [ebp-8],edx
 006F551C    mov         ebx,eax
 006F551E    xor         eax,eax
 006F5520    push        ebp
 006F5521    push        6F5562
 006F5526    push        dword ptr fs:[eax]
 006F5529    mov         dword ptr fs:[eax],esp
 006F552C    lea         eax,[ebp-4]
 006F552F    push        eax
 006F5530    lea         edx,[ebp-8]
 006F5533    mov         eax,ebx
 006F5535    call        006F4FC4
 006F553A    mov         eax,dword ptr [ebp-8]
 006F553D    push        eax
 006F553E    mov         eax,dword ptr [eax]
 006F5540    call        dword ptr [eax+48]
 006F5543    call        @CheckAutoResult
 006F5548    movzx       ebx,word ptr [ebp-4]
 006F554C    xor         eax,eax
 006F554E    pop         edx
 006F554F    pop         ecx
 006F5550    pop         ecx
 006F5551    mov         dword ptr fs:[eax],edx
 006F5554    push        6F5569
 006F5559    lea         eax,[ebp-8]
 006F555C    call        @IntfClear
 006F5561    ret
>006F5562    jmp         @HandleFinally
>006F5567    jmp         006F5559
 006F5569    mov         eax,ebx
 006F556B    pop         ebx
 006F556C    pop         ecx
 006F556D    pop         ecx
 006F556E    pop         ebp
 006F556F    ret
*}
end;

//006F5570
procedure TAccelerometer.UnregisterForMotion;
begin
{*
 006F5570    push        ebp
 006F5571    mov         ebp,esp
 006F5573    push        0
 006F5575    push        ebx
 006F5576    mov         ebx,eax
 006F5578    xor         eax,eax
 006F557A    push        ebp
 006F557B    push        6F55B4
 006F5580    push        dword ptr fs:[eax]
 006F5583    mov         dword ptr fs:[eax],esp
 006F5586    lea         edx,[ebp-4]
 006F5589    mov         eax,ebx
 006F558B    call        006F4FC4
 006F5590    mov         eax,dword ptr [ebp-4]
 006F5593    push        eax
 006F5594    mov         eax,dword ptr [eax]
 006F5596    call        dword ptr [eax+4C]
 006F5599    call        @CheckAutoResult
 006F559E    xor         eax,eax
 006F55A0    pop         edx
 006F55A1    pop         ecx
 006F55A2    pop         ecx
 006F55A3    mov         dword ptr fs:[eax],edx
 006F55A6    push        6F55BB
 006F55AB    lea         eax,[ebp-4]
 006F55AE    call        @IntfClear
 006F55B3    ret
>006F55B4    jmp         @HandleFinally
>006F55B9    jmp         006F55AB
 006F55BB    pop         ebx
 006F55BC    pop         ecx
 006F55BD    pop         ebp
 006F55BE    ret
*}
end;

//006F55C0
procedure TAccelerometer.FireOnMotion(piReading:IMeterReading);
begin
{*
 006F55C0    push        ebp
 006F55C1    mov         ebp,esp
 006F55C3    push        0
 006F55C5    push        ebx
 006F55C6    push        esi
 006F55C7    mov         esi,edx
 006F55C9    mov         ebx,eax
 006F55CB    xor         eax,eax
 006F55CD    push        ebp
 006F55CE    push        6F5608
 006F55D3    push        dword ptr fs:[eax]
 006F55D6    mov         dword ptr fs:[eax],esp
 006F55D9    push        esi
 006F55DA    lea         edx,[ebp-4]
 006F55DD    mov         eax,ebx
 006F55DF    call        006F4FC4
 006F55E4    mov         eax,dword ptr [ebp-4]
 006F55E7    push        eax
 006F55E8    mov         eax,dword ptr [eax]
 006F55EA    call        dword ptr [eax+50]
 006F55ED    call        @CheckAutoResult
 006F55F2    xor         eax,eax
 006F55F4    pop         edx
 006F55F5    pop         ecx
 006F55F6    pop         ecx
 006F55F7    mov         dword ptr fs:[eax],edx
 006F55FA    push        6F560F
 006F55FF    lea         eax,[ebp-4]
 006F5602    call        @IntfClear
 006F5607    ret
>006F5608    jmp         @HandleFinally
>006F560D    jmp         006F55FF
 006F560F    pop         esi
 006F5610    pop         ebx
 006F5611    pop         ecx
 006F5612    pop         ebp
 006F5613    ret
*}
end;

//006F5614
procedure TAccelerometer.CalculateCalibratedValues(RawX:Integer; RawY:Integer; var pReturnZ:Single; var pReturnY:Single; var pReturnX:Single; RawZ:Integer);
begin
{*
 006F5614    push        ebp
 006F5615    mov         ebp,esp
 006F5617    push        0
 006F5619    push        ebx
 006F561A    push        esi
 006F561B    push        edi
 006F561C    mov         edi,ecx
 006F561E    mov         esi,edx
 006F5620    mov         ebx,eax
 006F5622    xor         eax,eax
 006F5624    push        ebp
 006F5625    push        6F5670
 006F562A    push        dword ptr fs:[eax]
 006F562D    mov         dword ptr fs:[eax],esp
 006F5630    mov         eax,dword ptr [ebp+8]
 006F5633    push        eax
 006F5634    mov         eax,dword ptr [ebp+0C]
 006F5637    push        eax
 006F5638    mov         eax,dword ptr [ebp+10]
 006F563B    push        eax
 006F563C    mov         eax,dword ptr [ebp+14]
 006F563F    push        eax
 006F5640    push        edi
 006F5641    push        esi
 006F5642    lea         edx,[ebp-4]
 006F5645    mov         eax,ebx
 006F5647    call        006F4FC4
 006F564C    mov         eax,dword ptr [ebp-4]
 006F564F    push        eax
 006F5650    mov         eax,dword ptr [eax]
 006F5652    call        dword ptr [eax+58]
 006F5655    call        @CheckAutoResult
 006F565A    xor         eax,eax
 006F565C    pop         edx
 006F565D    pop         ecx
 006F565E    pop         ecx
 006F565F    mov         dword ptr fs:[eax],edx
 006F5662    push        6F5677
 006F5667    lea         eax,[ebp-4]
 006F566A    call        @IntfClear
 006F566F    ret
>006F5670    jmp         @HandleFinally
>006F5675    jmp         006F5667
 006F5677    pop         edi
 006F5678    pop         esi
 006F5679    pop         ebx
 006F567A    pop         ecx
 006F567B    pop         ebp
 006F567C    ret         10
*}
end;

//006F5A70
procedure sub_006F5A70;
begin
{*
 006F5A70    push        ebx
 006F5A71    mov         ebx,822938;gvar_00822938:THashTable
 006F5A76    xor         ecx,ecx
 006F5A78    mov         edx,6F5BA4;'Exists'
 006F5A7D    mov         eax,dword ptr [ebx]
 006F5A7F    call        THashTable.Add
 006F5A84    mov         ecx,1
 006F5A89    mov         edx,6F5BC0;'gx'
 006F5A8E    mov         eax,dword ptr [ebx]
 006F5A90    call        THashTable.Add
 006F5A95    mov         ecx,2
 006F5A9A    mov         edx,6F5BD4;'gy'
 006F5A9F    mov         eax,dword ptr [ebx]
 006F5AA1    call        THashTable.Add
 006F5AA6    mov         ecx,3
 006F5AAB    mov         edx,6F5BE8;'gz'
 006F5AB0    mov         eax,dword ptr [ebx]
 006F5AB2    call        THashTable.Add
 006F5AB7    mov         ecx,4
 006F5ABC    mov         edx,6F5BFC;'g'
 006F5AC1    mov         eax,dword ptr [ebx]
 006F5AC3    call        THashTable.Add
 006F5AC8    mov         ecx,0C
 006F5ACD    mov         edx,6F5C0C;'RelAccX'
 006F5AD2    mov         eax,dword ptr [ebx]
 006F5AD4    call        THashTable.Add
 006F5AD9    mov         ecx,0D
 006F5ADE    mov         edx,6F5C28;'RelAccY'
 006F5AE3    mov         eax,dword ptr [ebx]
 006F5AE5    call        THashTable.Add
 006F5AEA    mov         ecx,0E
 006F5AEF    mov         edx,6F5C44;'RelAccZ'
 006F5AF4    mov         eax,dword ptr [ebx]
 006F5AF6    call        THashTable.Add
 006F5AFB    mov         ecx,10
 006F5B00    mov         edx,6F5C60;'RelAcc'
 006F5B05    mov         eax,dword ptr [ebx]
 006F5B07    call        THashTable.Add
 006F5B0C    mov         ecx,9
 006F5B11    mov         edx,6F5C7C;'RawAccx'
 006F5B16    mov         eax,dword ptr [ebx]
 006F5B18    call        THashTable.Add
 006F5B1D    mov         ecx,0A
 006F5B22    mov         edx,6F5C98;'RawAccy'
 006F5B27    mov         eax,dword ptr [ebx]
 006F5B29    call        THashTable.Add
 006F5B2E    mov         ecx,0B
 006F5B33    mov         edx,6F5CB4;'RawAccz'
 006F5B38    mov         eax,dword ptr [ebx]
 006F5B3A    call        THashTable.Add
 006F5B3F    mov         ecx,0F
 006F5B44    mov         edx,6F5CD0;'RawAcc'
 006F5B49    mov         eax,dword ptr [ebx]
 006F5B4B    call        THashTable.Add
 006F5B50    mov         ecx,6
 006F5B55    mov         edx,6F5CEC;'roll'
 006F5B5A    mov         eax,dword ptr [ebx]
 006F5B5C    call        THashTable.Add
 006F5B61    mov         ecx,5
 006F5B66    mov         edx,6F5D04;'pitch'
 006F5B6B    mov         eax,dword ptr [ebx]
 006F5B6D    call        THashTable.Add
 006F5B72    mov         ecx,8
 006F5B77    mov         edx,6F5D1C;'SmoothRoll'
 006F5B7C    mov         eax,dword ptr [ebx]
 006F5B7E    call        THashTable.Add
 006F5B83    mov         ecx,7
 006F5B88    mov         edx,6F5D40;'SmoothPitch'
 006F5B8D    mov         eax,dword ptr [ebx]
 006F5B8F    call        THashTable.Add
 006F5B94    pop         ebx
 006F5B95    ret
*}
end;

//006F5D58
{*function sub_006F5D58(?:?):?;
begin
 006F5D58    push        ebp
 006F5D59    mov         ebp,esp
 006F5D5B    add         esp,0FFFFFFF8
 006F5D5E    push        ebx
 006F5D5F    push        esi
 006F5D60    push        edi
 006F5D61    xor         edx,edx
 006F5D63    mov         dword ptr [ebp-8],edx
 006F5D66    mov         dword ptr [ebp-4],eax
 006F5D69    mov         eax,dword ptr [ebp-4]
 006F5D6C    call        @UStrAddRef
 006F5D71    xor         eax,eax
 006F5D73    push        ebp
 006F5D74    push        6F5E05
 006F5D79    push        dword ptr fs:[eax]
 006F5D7C    mov         dword ptr fs:[eax],esp
 006F5D7F    xor         ebx,ebx
 006F5D81    lea         eax,[ebp-8]
 006F5D84    mov         edx,dword ptr [ebp-4]
 006F5D87    call        @UStrLAsg
 006F5D8C    lea         eax,[ebp-8]
 006F5D8F    mov         edx,6F5E24;'Laptop'
 006F5D94    call        004F9BD0
 006F5D99    test        al,al
>006F5D9B    je          006F5DEA
 006F5D9D    lea         eax,[ebp-8]
 006F5DA0    call        004F9D00
 006F5DA5    mov         esi,eax
 006F5DA7    lea         eax,[ebp-8]
 006F5DAA    mov         edx,6F5E40;'.'
 006F5DAF    call        004F9BD0
 006F5DB4    test        al,al
>006F5DB6    je          006F5DEA
 006F5DB8    mov         eax,dword ptr [ebp-8]
 006F5DBB    call        006F66D4
 006F5DC0    mov         edi,eax
 006F5DC2    test        edi,edi
>006F5DC4    jl          006F5DEA
 006F5DC6    mov         dl,1
 006F5DC8    mov         eax,[006F5680];TLaptopValue
 006F5DCD    call        TObject.Create;TLaptopValue.Create
 006F5DD2    mov         ebx,eax
 006F5DD4    mov         dword ptr [ebx+20],edi;TLaptopValue..............................Item:Integer
 006F5DD7    test        esi,esi
>006F5DD9    jg          006F5DE0
 006F5DDB    mov         esi,1
 006F5DE0    mov         dword ptr [ebx+18],esi;TLaptopValue........................................................
 006F5DE3    mov         byte ptr ds:[82293C],1;gvar_0082293C
 006F5DEA    xor         eax,eax
 006F5DEC    pop         edx
 006F5DED    pop         ecx
 006F5DEE    pop         ecx
 006F5DEF    mov         dword ptr fs:[eax],edx
 006F5DF2    push        6F5E0C
 006F5DF7    lea         eax,[ebp-8]
 006F5DFA    mov         edx,2
 006F5DFF    call        @UStrArrayClr
 006F5E04    ret
>006F5E05    jmp         @HandleFinally
>006F5E0A    jmp         006F5DF7
 006F5E0C    mov         eax,ebx
 006F5E0E    pop         edi
 006F5E0F    pop         esi
 006F5E10    pop         ebx
 006F5E11    pop         ecx
 006F5E12    pop         ecx
 006F5E13    pop         ebp
 006F5E14    ret
end;*}

//006F5E44
function TLaptopValue.CanSet:Boolean;
begin
{*
 006F5E44    xor         eax,eax
 006F5E46    ret
*}
end;

//006F5E48
procedure TLaptopValue.CreateClone;
begin
{*
 006F5E48    mov         dl,1
 006F5E4A    mov         eax,[006F5680];TLaptopValue
 006F5E4F    call        TObject.Create;TLaptopValue.Create
 006F5E54    ret
*}
end;

//006F5E58
procedure TLaptopValue.FillClone(c:TExpression);
begin
{*
 006F5E58    push        ebx
 006F5E59    push        esi
 006F5E5A    mov         esi,edx
 006F5E5C    mov         ebx,eax
 006F5E5E    mov         edx,esi
 006F5E60    mov         eax,ebx
 006F5E62    call        TExpression.FillClone
 006F5E67    mov         eax,esi
 006F5E69    mov         edx,dword ptr [ebx+20];TLaptopValue...............................Item:Integer
 006F5E6C    mov         dword ptr [eax+20],edx
 006F5E6F    mov         edx,dword ptr [ebx+18];TLaptopValue........................................................
 006F5E72    mov         dword ptr [eax+18],edx
 006F5E75    pop         esi
 006F5E76    pop         ebx
 006F5E77    ret
*}
end;

//006F5E78
function TLaptopValue.GetDataType:TDataType;
begin
{*
 006F5E78    mov         eax,dword ptr [eax+20];TLaptopValue................................Item:Integer
 006F5E7B    sub         eax,1
>006F5E7E    jb          006F5E8F
 006F5E80    sub         eax,3
>006F5E83    je          006F5E92
 006F5E85    add         eax,0FFFFFFF5
 006F5E88    sub         eax,2
>006F5E8B    jb          006F5E92
>006F5E8D    jmp         006F5E95
 006F5E8F    mov         al,3
 006F5E91    ret
 006F5E92    mov         al,5
 006F5E94    ret
 006F5E95    xor         eax,eax
 006F5E97    ret
*}
end;

//006F5E98
function TLaptopValue.GetPerUnits1:TUnits;
begin
{*
 006F5E98    mov         eax,dword ptr [eax+20];TLaptopValue.................................Item:Integer
 006F5E9B    sub         eax,1
>006F5E9E    jb          006F5EAA
 006F5EA0    add         eax,0FFFFFFF8
 006F5EA3    sub         eax,8
>006F5EA6    jb          006F5EAD
>006F5EA8    jmp         006F5EB0
 006F5EAA    xor         eax,eax
 006F5EAC    ret
 006F5EAD    mov         al,11
 006F5EAF    ret
 006F5EB0    xor         eax,eax
 006F5EB2    ret
*}
end;

//006F5EB4
function TLaptopValue.GetPerUnits2:TUnits;
begin
{*
 006F5EB4    mov         eax,dword ptr [eax+20];TLaptopValue..................................Item:Integer
 006F5EB7    sub         eax,1
>006F5EBA    jb          006F5EC6
 006F5EBC    add         eax,0FFFFFFF8
 006F5EBF    sub         eax,8
>006F5EC2    jb          006F5EC9
>006F5EC4    jmp         006F5ECC
 006F5EC6    xor         eax,eax
 006F5EC8    ret
 006F5EC9    mov         al,11
 006F5ECB    ret
 006F5ECC    xor         eax,eax
 006F5ECE    ret
*}
end;

//006F5ED0
{*procedure TLaptopValue.GetString(?:?);
begin
 006F5ED0    push        ebx
 006F5ED1    push        esi
 006F5ED2    mov         esi,edx
 006F5ED4    mov         ebx,eax
 006F5ED6    mov         eax,dword ptr [ebx+20];TLaptopValue...................................Item:Integer
 006F5ED9    sub         eax,1
>006F5EDC    jae         006F5EEA
 006F5EDE    mov         edx,esi
 006F5EE0    mov         eax,ebx
 006F5EE2    call        TExpression.GetString
 006F5EE7    pop         esi
 006F5EE8    pop         ebx
 006F5EE9    ret
 006F5EEA    mov         edx,esi
 006F5EEC    mov         eax,ebx
 006F5EEE    call        TExpression.GetString
 006F5EF3    pop         esi
 006F5EF4    pop         ebx
 006F5EF5    ret
end;*}

//006F5EF8
function TLaptopValue.GetUnits:TUnits;
begin
{*
 006F5EF8    mov         eax,dword ptr [eax+20];TLaptopValue....................................Item:Integer
 006F5EFB    sub         eax,1
>006F5EFE    jb          006F5F0F
 006F5F00    add         eax,0FFFFFFFC
 006F5F03    sub         eax,4
>006F5F06    jb          006F5F15
 006F5F08    sub         eax,8
>006F5F0B    jb          006F5F12
>006F5F0D    jmp         006F5F18
 006F5F0F    xor         eax,eax
 006F5F11    ret
 006F5F12    mov         al,5
 006F5F14    ret
 006F5F15    mov         al,18
 006F5F17    ret
 006F5F18    xor         eax,eax
 006F5F1A    ret
*}
end;

//006F5F1C
procedure TLaptopValue.GetValue;
begin
{*
 006F5F1C    add         esp,0FFFFFFD8
 006F5F1F    mov         edx,dword ptr [eax+18];TLaptopValue........................................................
 006F5F22    test        edx,edx
>006F5F24    jl          006F5F37
 006F5F26    cmp         edx,3E7
>006F5F2C    jg          006F5F37
 006F5F2E    cmp         byte ptr ds:[82293D],0;gvar_0082293D
>006F5F35    jne         006F5F5D
 006F5F37    cmp         dword ptr [eax+20],2;TLaptopValue.....................................Item:Integer
>006F5F3B    jne         006F5F4F
 006F5F3D    xor         eax,eax
 006F5F3F    mov         dword ptr [esp],eax
 006F5F42    mov         dword ptr [esp+4],3FF00000
>006F5F4A    jmp         006F615C
 006F5F4F    xor         eax,eax
 006F5F51    mov         dword ptr [esp],eax
 006F5F54    mov         dword ptr [esp+4],eax
>006F5F58    jmp         006F615C
 006F5F5D    mov         eax,dword ptr [eax+20];TLaptopValue......................................Item:Integer
 006F5F60    cmp         eax,0E
>006F5F63    ja          006F6153
 006F5F69    jmp         dword ptr [eax*4+6F5F70]
 006F5F69    dd          006F5FAC
 006F5F69    dd          006F5FD5
 006F5F69    dd          006F5FED
 006F5F69    dd          006F6005
 006F5F69    dd          006F6153
 006F5F69    dd          006F6035
 006F5F69    dd          006F601D
 006F5F69    dd          006F611D
 006F5F69    dd          006F60E0
 006F5F69    dd          006F604D
 006F5F69    dd          006F6062
 006F5F69    dd          006F6077
 006F5F69    dd          006F608C
 006F5F69    dd          006F60A9
 006F5F69    dd          006F60C6
 006F5FAC    cmp         byte ptr ds:[82293D],0;gvar_0082293D
>006F5FB3    jne         006F5FC5
 006F5FB5    xor         eax,eax
 006F5FB7    call        00686074
 006F5FBC    fstp        qword ptr [esp]
 006F5FBF    wait
>006F5FC0    jmp         006F615C
 006F5FC5    mov         al,1
 006F5FC7    call        00686074
 006F5FCC    fstp        qword ptr [esp]
 006F5FCF    wait
>006F5FD0    jmp         006F615C
 006F5FD5    mov         eax,dword ptr ds:[822940];gvar_00822940:Double
 006F5FDB    mov         dword ptr [esp],eax
 006F5FDE    mov         eax,dword ptr ds:[822944];gvar_00822944
 006F5FE4    mov         dword ptr [esp+4],eax
>006F5FE8    jmp         006F615C
 006F5FED    mov         eax,dword ptr ds:[822948];gvar_00822948:Double
 006F5FF3    mov         dword ptr [esp],eax
 006F5FF6    mov         eax,dword ptr ds:[82294C];gvar_0082294C
 006F5FFC    mov         dword ptr [esp+4],eax
>006F6000    jmp         006F615C
 006F6005    mov         eax,dword ptr ds:[822950];gvar_00822950:Double
 006F600B    mov         dword ptr [esp],eax
 006F600E    mov         eax,dword ptr ds:[822954];gvar_00822954
 006F6014    mov         dword ptr [esp+4],eax
>006F6018    jmp         006F615C
 006F601D    mov         eax,dword ptr ds:[822970];gvar_00822970:Double
 006F6023    mov         dword ptr [esp],eax
 006F6026    mov         eax,dword ptr ds:[822974];gvar_00822974
 006F602C    mov         dword ptr [esp+4],eax
>006F6030    jmp         006F615C
 006F6035    mov         eax,dword ptr ds:[822978];gvar_00822978:Double
 006F603B    mov         dword ptr [esp],eax
 006F603E    mov         eax,dword ptr ds:[82297C];gvar_0082297C
 006F6044    mov         dword ptr [esp+4],eax
>006F6048    jmp         006F615C
 006F604D    fld         tbyte ptr ds:[6F6164];9.8:Extended
 006F6053    fmul        qword ptr ds:[822940];gvar_00822940:Double
 006F6059    fstp        qword ptr [esp]
 006F605C    wait
>006F605D    jmp         006F615C
 006F6062    fld         tbyte ptr ds:[6F6164];9.8:Extended
 006F6068    fmul        qword ptr ds:[822948];gvar_00822948:Double
 006F606E    fstp        qword ptr [esp]
 006F6071    wait
>006F6072    jmp         006F615C
 006F6077    fld         tbyte ptr ds:[6F6164];9.8:Extended
 006F607D    fmul        qword ptr ds:[822950];gvar_00822950:Double
 006F6083    fstp        qword ptr [esp]
 006F6086    wait
>006F6087    jmp         006F615C
 006F608C    fld         qword ptr ds:[822940];gvar_00822940:Double
 006F6092    fsub        qword ptr ds:[822958];gvar_00822958:Double
 006F6098    fld         tbyte ptr ds:[6F6164];9.8:Extended
 006F609E    fmulp       st(1),st
 006F60A0    fstp        qword ptr [esp]
 006F60A3    wait
>006F60A4    jmp         006F615C
 006F60A9    fld         qword ptr ds:[822948];gvar_00822948:Double
 006F60AF    fsub        qword ptr ds:[822960];gvar_00822960:Double
 006F60B5    fld         tbyte ptr ds:[6F6164];9.8:Extended
 006F60BB    fmulp       st(1),st
 006F60BD    fstp        qword ptr [esp]
 006F60C0    wait
>006F60C1    jmp         006F615C
 006F60C6    fld         qword ptr ds:[822950];gvar_00822950:Double
 006F60CC    fsub        qword ptr ds:[822968];gvar_00822968:Double
 006F60D2    fld         tbyte ptr ds:[6F6164];9.8:Extended
 006F60D8    fmulp       st(1),st
 006F60DA    fstp        qword ptr [esp]
 006F60DD    wait
>006F60DE    jmp         006F615C
 006F60E0    push        dword ptr ds:[822944];gvar_00822944
 006F60E6    push        dword ptr ds:[822940];gvar_00822940:Double
 006F60EC    push        dword ptr ds:[82294C];gvar_0082294C
 006F60F2    push        dword ptr ds:[822948];gvar_00822948:Double
 006F60F8    call        00454A9C
 006F60FD    fstp        qword ptr [esp+8]
 006F6101    wait
 006F6102    fld         tbyte ptr ds:[6F6170];57.2957795130823:Extended
 006F6108    fmul        qword ptr [esp+8]
 006F610C    fstp        qword ptr [esp+10]
 006F6110    wait
 006F6111    fld         qword ptr [esp+10]
 006F6115    fchs
 006F6117    fstp        qword ptr [esp]
 006F611A    wait
>006F611B    jmp         006F615C
 006F611D    push        dword ptr ds:[822954];gvar_00822954
 006F6123    push        dword ptr ds:[822950];gvar_00822950:Double
 006F6129    call        00454A5C
 006F612E    fstp        qword ptr [esp+18]
 006F6132    wait
 006F6133    fld         tbyte ptr ds:[6F6170];57.2957795130823:Extended
 006F6139    fmul        qword ptr [esp+18]
 006F613D    fstp        qword ptr [esp+20]
 006F6141    wait
 006F6142    mov         eax,dword ptr [esp+20]
 006F6146    mov         dword ptr [esp],eax
 006F6149    mov         eax,dword ptr [esp+24]
 006F614D    mov         dword ptr [esp+4],eax
>006F6151    jmp         006F615C
 006F6153    xor         eax,eax
 006F6155    mov         dword ptr [esp],eax
 006F6158    mov         dword ptr [esp+4],eax
 006F615C    fld         qword ptr [esp]
 006F615F    add         esp,28
 006F6162    ret
*}
end;

//006F617C
procedure TLaptopValue.GetVector(x:Double; y:Double; z:Double);
begin
{*
 006F617C    push        ebp
 006F617D    mov         ebp,esp
 006F617F    push        ebx
 006F6180    push        esi
 006F6181    mov         esi,dword ptr [eax+18];TLaptopValue........................................................
 006F6184    test        esi,esi
>006F6186    jl          006F6199
 006F6188    cmp         esi,3E7
>006F618E    jg          006F6199
 006F6190    cmp         byte ptr ds:[82293D],0;gvar_0082293D
>006F6197    jne         006F6207
 006F6199    mov         ebx,dword ptr [eax+20];TLaptopValue.......................................Item:Integer
 006F619C    cmp         ebx,4
>006F619F    jne         006F61C2
 006F61A1    xor         eax,eax
 006F61A3    mov         dword ptr [edx],eax
 006F61A5    mov         dword ptr [edx+4],eax
 006F61A8    xor         eax,eax
 006F61AA    mov         dword ptr [ecx],eax
 006F61AC    mov         dword ptr [ecx+4],3FF00000
 006F61B3    mov         eax,dword ptr [ebp+8]
 006F61B6    xor         edx,edx
 006F61B8    mov         dword ptr [eax],edx
 006F61BA    mov         dword ptr [eax+4],edx
>006F61BD    jmp         006F62DC
 006F61C2    cmp         ebx,0F
>006F61C5    jne         006F61EA
 006F61C7    xor         eax,eax
 006F61C9    mov         dword ptr [edx],eax
 006F61CB    mov         dword ptr [edx+4],eax
 006F61CE    mov         dword ptr [ecx],9999999A
 006F61D4    mov         dword ptr [ecx+4],40239999
 006F61DB    mov         eax,dword ptr [ebp+8]
 006F61DE    xor         edx,edx
 006F61E0    mov         dword ptr [eax],edx
 006F61E2    mov         dword ptr [eax+4],edx
>006F61E5    jmp         006F62DC
 006F61EA    xor         eax,eax
 006F61EC    mov         dword ptr [edx],eax
 006F61EE    mov         dword ptr [edx+4],eax
 006F61F1    xor         eax,eax
 006F61F3    mov         dword ptr [ecx],eax
 006F61F5    mov         dword ptr [ecx+4],eax
 006F61F8    mov         eax,dword ptr [ebp+8]
 006F61FB    xor         edx,edx
 006F61FD    mov         dword ptr [eax],edx
 006F61FF    mov         dword ptr [eax+4],edx
>006F6202    jmp         006F62DC
 006F6207    mov         ebx,dword ptr [eax+20];TLaptopValue........................................Item:Integer
 006F620A    sub         ebx,4
>006F620D    je          006F621C
 006F620F    sub         ebx,0B
>006F6212    je          006F6257
 006F6214    dec         ebx
>006F6215    je          006F6289
>006F6217    jmp         006F62D3
 006F621C    mov         eax,dword ptr ds:[822940];gvar_00822940:Double
 006F6222    mov         dword ptr [edx],eax
 006F6224    mov         eax,dword ptr ds:[822944];gvar_00822944
 006F622A    mov         dword ptr [edx+4],eax
 006F622D    mov         eax,dword ptr ds:[822948];gvar_00822948:Double
 006F6233    mov         dword ptr [ecx],eax
 006F6235    mov         eax,dword ptr ds:[82294C];gvar_0082294C
 006F623B    mov         dword ptr [ecx+4],eax
 006F623E    mov         eax,dword ptr [ebp+8]
 006F6241    mov         edx,dword ptr ds:[822950];gvar_00822950:Double
 006F6247    mov         dword ptr [eax],edx
 006F6249    mov         edx,dword ptr ds:[822954];gvar_00822954
 006F624F    mov         dword ptr [eax+4],edx
>006F6252    jmp         006F62DC
 006F6257    fld         tbyte ptr ds:[6F62E4];9.8:Extended
 006F625D    fmul        qword ptr ds:[822940];gvar_00822940:Double
 006F6263    fstp        qword ptr [edx]
 006F6265    wait
 006F6266    fld         tbyte ptr ds:[6F62E4];9.8:Extended
 006F626C    fmul        qword ptr ds:[822948];gvar_00822948:Double
 006F6272    fstp        qword ptr [ecx]
 006F6274    wait
 006F6275    fld         tbyte ptr ds:[6F62E4];9.8:Extended
 006F627B    fmul        qword ptr ds:[822950];gvar_00822950:Double
 006F6281    mov         eax,dword ptr [ebp+8]
 006F6284    fstp        qword ptr [eax]
 006F6286    wait
>006F6287    jmp         006F62DC
 006F6289    fld         qword ptr ds:[822940];gvar_00822940:Double
 006F628F    fsub        qword ptr ds:[822958];gvar_00822958:Double
 006F6295    fld         tbyte ptr ds:[6F62E4];9.8:Extended
 006F629B    fmulp       st(1),st
 006F629D    fstp        qword ptr [edx]
 006F629F    wait
 006F62A0    fld         qword ptr ds:[822948];gvar_00822948:Double
 006F62A6    fsub        qword ptr ds:[822960];gvar_00822960:Double
 006F62AC    fld         tbyte ptr ds:[6F62E4];9.8:Extended
 006F62B2    fmulp       st(1),st
 006F62B4    fstp        qword ptr [ecx]
 006F62B6    wait
 006F62B7    fld         qword ptr ds:[822950];gvar_00822950:Double
 006F62BD    fsub        qword ptr ds:[822968];gvar_00822968:Double
 006F62C3    fld         tbyte ptr ds:[6F62E4];9.8:Extended
 006F62C9    fmulp       st(1),st
 006F62CB    mov         eax,dword ptr [ebp+8]
 006F62CE    fstp        qword ptr [eax]
 006F62D0    wait
>006F62D1    jmp         006F62DC
 006F62D3    mov         ebx,dword ptr [ebp+8]
 006F62D6    push        ebx
 006F62D7    call        TExpression.GetVector
 006F62DC    pop         esi
 006F62DD    pop         ebx
 006F62DE    pop         ebp
 006F62DF    ret         4
*}
end;

//006F62F0
procedure TLaptopValue.SetValue(NewValue:Double);
begin
{*
 006F62F0    push        ebp
 006F62F1    mov         ebp,esp
 006F62F3    mov         edx,dword ptr [eax+18];TLaptopValue........................................................
 006F62F6    test        edx,edx
>006F62F8    jl          006F6302
 006F62FA    cmp         edx,3E7
>006F6300    jle         006F6306
 006F6302    xor         eax,eax
>006F6304    jmp         006F6314
 006F6306    mov         eax,dword ptr [eax+20];TLaptopValue.........................................Item:Integer
 006F6309    sub         eax,1
>006F630C    jae         006F6312
 006F630E    xor         eax,eax
>006F6310    jmp         006F6314
 006F6312    xor         eax,eax
 006F6314    pop         ebp
 006F6315    ret         8
*}
end;

//006F6318
{*procedure TLaptopValue.ToString(?:?);
begin
 006F6318    push        ebp
 006F6319    mov         ebp,esp
 006F631B    push        0
 006F631D    push        0
 006F631F    push        0
 006F6321    push        ebx
 006F6322    push        esi
 006F6323    push        edi
 006F6324    mov         esi,edx
 006F6326    mov         ebx,eax
 006F6328    xor         eax,eax
 006F632A    push        ebp
 006F632B    push        6F63A5
 006F6330    push        dword ptr fs:[eax]
 006F6333    mov         dword ptr fs:[eax],esp
 006F6336    mov         edi,dword ptr [ebx+18];TLaptopValue........................................................
 006F6339    test        edi,edi
>006F633B    jle         006F6370
 006F633D    push        6F63C0;'Laptop'
 006F6342    lea         edx,[ebp-4]
 006F6345    mov         eax,edi
 006F6347    call        IntToStr
 006F634C    push        dword ptr [ebp-4]
 006F634F    push        6F63DC;'.'
 006F6354    lea         edx,[ebp-8]
 006F6357    mov         eax,dword ptr [ebx+20];TLaptopValue..........................................Item:Intege...
 006F635A    call        006F6724
 006F635F    push        dword ptr [ebp-8]
 006F6362    mov         eax,esi
 006F6364    mov         edx,4
 006F6369    call        @UStrCatN
>006F636E    jmp         006F638A
 006F6370    lea         edx,[ebp-0C]
 006F6373    mov         eax,dword ptr [ebx+20];TLaptopValue...........................................Item:Integ...
 006F6376    call        006F6724
 006F637B    mov         ecx,dword ptr [ebp-0C]
 006F637E    mov         eax,esi
 006F6380    mov         edx,6F63EC;'Laptop.'
 006F6385    call        @UStrCat3
 006F638A    xor         eax,eax
 006F638C    pop         edx
 006F638D    pop         ecx
 006F638E    pop         ecx
 006F638F    mov         dword ptr fs:[eax],edx
 006F6392    push        6F63AC
 006F6397    lea         eax,[ebp-0C]
 006F639A    mov         edx,3
 006F639F    call        @UStrArrayClr
 006F63A4    ret
>006F63A5    jmp         @HandleFinally
>006F63AA    jmp         006F6397
 006F63AC    pop         edi
 006F63AD    pop         esi
 006F63AE    pop         ebx
 006F63AF    mov         esp,ebp
 006F63B1    pop         ebp
 006F63B2    ret
end;*}

//006F63FC
procedure sub_006F63FC;
begin
{*
 006F63FC    push        ebp
 006F63FD    mov         ebp,esp
 006F63FF    push        ebx
 006F6400    push        esi
 006F6401    push        edi
 006F6402    mov         byte ptr ds:[82293D],0;gvar_0082293D
 006F6409    cmp         byte ptr ds:[82293C],0;gvar_0082293C
>006F6410    je          006F64C6
 006F6416    xor         eax,eax
 006F6418    push        ebp
 006F6419    push        6F6441
 006F641E    push        dword ptr fs:[eax]
 006F6421    mov         dword ptr fs:[eax],esp
 006F6424    xor         ecx,ecx
 006F6426    mov         dl,1
 006F6428    mov         eax,[006F4888];TAccelerometer
 006F642D    call        TAccelerometer.Create;TAccelerometer.Create
 006F6432    mov         [00822984],eax;gvar_00822984:TAccelerometer
 006F6437    xor         eax,eax
 006F6439    pop         edx
 006F643A    pop         ecx
 006F643B    pop         ecx
 006F643C    mov         dword ptr fs:[eax],edx
>006F643F    jmp         006F6459
>006F6441    jmp         @HandleAnyException
 006F6446    xor         eax,eax
 006F6448    mov         [00822984],eax;gvar_00822984:TAccelerometer
 006F644D    call        @DoneExcept
>006F6452    jmp         006F64C6
 006F6454    call        @DoneExcept
 006F6459    cmp         dword ptr ds:[822984],0;gvar_00822984:TAccelerometer
>006F6460    je          006F64C6
 006F6462    mov         ecx,101B
 006F6467    mov         edx,8086
 006F646C    mov         eax,[00822984];gvar_00822984:TAccelerometer
 006F6471    call        TAccelerometer.FindHidDevice
 006F6476    cmp         ax,1
 006F647A    sbb         eax,eax
 006F647C    inc         eax
 006F647D    mov         [0082293D],al;gvar_0082293D
 006F6482    cmp         byte ptr ds:[82293D],0;gvar_0082293D
>006F6489    jne         006F64AB
 006F648B    mov         ecx,101B
 006F6490    mov         edx,8086
 006F6495    mov         eax,[00822984];gvar_00822984:TAccelerometer
 006F649A    call        TAccelerometer.FindHidDevice
 006F649F    cmp         ax,1
 006F64A3    sbb         eax,eax
 006F64A5    inc         eax
 006F64A6    mov         [0082293D],al;gvar_0082293D
 006F64AB    cmp         byte ptr ds:[82293D],0;gvar_0082293D
>006F64B2    jne         006F64C6
 006F64B4    mov         eax,[00822984];gvar_00822984:TAccelerometer
 006F64B9    xor         edx,edx
 006F64BB    mov         dword ptr ds:[822984],edx;gvar_00822984:TAccelerometer
 006F64C1    call        TObject.Free
 006F64C6    pop         edi
 006F64C7    pop         esi
 006F64C8    pop         ebx
 006F64C9    pop         ebp
 006F64CA    ret
*}
end;

//006F64CC
procedure sub_006F64CC;
begin
{*
 006F64CC    movzx       eax,byte ptr ds:[82293C];gvar_0082293C
 006F64D3    and         al,byte ptr ds:[82293D];gvar_0082293D
>006F64D9    je          006F64F4
 006F64DB    mov         byte ptr ds:[82293D],0;gvar_0082293D
 006F64E2    mov         eax,[00822984];gvar_00822984:TAccelerometer
 006F64E7    xor         edx,edx
 006F64E9    mov         dword ptr ds:[822984],edx;gvar_00822984:TAccelerometer
 006F64EF    call        TObject.Free
 006F64F4    ret
*}
end;

//006F64F8
{*function sub_006F64F8:?;
begin
 006F64F8    push        ebp
 006F64F9    mov         ebp,esp
 006F64FB    add         esp,0FFFFFFB4
 006F64FE    push        ebx
 006F64FF    xor         eax,eax
 006F6501    mov         dword ptr [ebp-4],eax
 006F6504    xor         eax,eax
 006F6506    push        ebp
 006F6507    push        6F66A2
 006F650C    push        dword ptr fs:[eax]
 006F650F    mov         dword ptr fs:[eax],esp
 006F6512    movzx       eax,byte ptr ds:[82293C];gvar_0082293C
 006F6519    and         al,byte ptr ds:[82293D];gvar_0082293D
>006F651F    je          006F668A
 006F6525    lea         edx,[ebp-4]
 006F6528    mov         eax,[00822984];gvar_00822984:TAccelerometer
 006F652D    call        TAccelerometer.GetReading
 006F6532    lea         eax,[ebp-34]
 006F6535    push        eax
 006F6536    mov         eax,dword ptr [ebp-4]
 006F6539    push        eax
 006F653A    mov         eax,dword ptr [eax]
 006F653C    call        dword ptr [eax+30]
 006F653F    call        @CheckAutoResult
 006F6544    fld         dword ptr [ebp-34]
 006F6547    fchs
 006F6549    fstp        qword ptr ds:[822940];gvar_00822940:Double
 006F654F    wait
 006F6550    lea         eax,[ebp-34]
 006F6553    push        eax
 006F6554    mov         eax,dword ptr [ebp-4]
 006F6557    push        eax
 006F6558    mov         eax,dword ptr [eax]
 006F655A    call        dword ptr [eax+38]
 006F655D    call        @CheckAutoResult
 006F6562    fld         dword ptr [ebp-34]
 006F6565    fchs
 006F6567    fstp        qword ptr ds:[822948];gvar_00822948:Double
 006F656D    wait
 006F656E    lea         eax,[ebp-34]
 006F6571    push        eax
 006F6572    mov         eax,dword ptr [ebp-4]
 006F6575    push        eax
 006F6576    mov         eax,dword ptr [eax]
 006F6578    call        dword ptr [eax+34]
 006F657B    call        @CheckAutoResult
 006F6580    fld         dword ptr [ebp-34]
 006F6583    fchs
 006F6585    fstp        qword ptr ds:[822950];gvar_00822950:Double
 006F658B    wait
 006F658C    fld         qword ptr ds:[822940];gvar_00822940:Double
 006F6592    fmul        st,st(0)
 006F6594    fstp        tbyte ptr [ebp-40]
 006F6597    wait
 006F6598    fld         qword ptr ds:[822948];gvar_00822948:Double
 006F659E    fmul        st,st(0)
 006F65A0    fld         tbyte ptr [ebp-40]
 006F65A3    faddp       st(1),st
 006F65A5    fstp        tbyte ptr [ebp-4C]
 006F65A8    wait
 006F65A9    fld         qword ptr ds:[822950];gvar_00822950:Double
 006F65AF    fmul        st,st(0)
 006F65B1    fld         tbyte ptr [ebp-4C]
 006F65B4    faddp       st(1),st
 006F65B6    add         esp,0FFFFFFF4
 006F65B9    fstp        tbyte ptr [esp]
 006F65BC    wait
 006F65BD    call        Sqrt
 006F65C2    fstp        qword ptr [ebp-10]
 006F65C5    wait
 006F65C6    fld         tbyte ptr ds:[6F66B0];0.95:Extended
 006F65CC    fcomp       qword ptr [ebp-10]
 006F65CF    wait
 006F65D0    fnstsw      al
 006F65D2    sahf
>006F65D3    ja          006F668A
 006F65D9    fld         tbyte ptr ds:[6F66BC];1.05:Extended
 006F65DF    fcomp       qword ptr [ebp-10]
 006F65E2    wait
 006F65E3    fnstsw      al
 006F65E5    sahf
>006F65E6    jb          006F668A
 006F65EC    fld         qword ptr ds:[822940];gvar_00822940:Double
 006F65F2    fdiv        qword ptr [ebp-10]
 006F65F5    fstp        qword ptr ds:[822958];gvar_00822958:Double
 006F65FB    wait
 006F65FC    fld         qword ptr ds:[822948];gvar_00822948:Double
 006F6602    fdiv        qword ptr [ebp-10]
 006F6605    fstp        qword ptr ds:[822960];gvar_00822960:Double
 006F660B    wait
 006F660C    fld         qword ptr ds:[822950];gvar_00822950:Double
 006F6612    fdiv        qword ptr [ebp-10]
 006F6615    fstp        qword ptr ds:[822968];gvar_00822968:Double
 006F661B    wait
 006F661C    push        dword ptr ds:[82295C]
 006F6622    push        dword ptr ds:[822958];gvar_00822958:Double
 006F6628    push        dword ptr ds:[822964]
 006F662E    push        dword ptr ds:[822960];gvar_00822960:Double
 006F6634    call        00454A9C
 006F6639    fstp        qword ptr [ebp-18]
 006F663C    wait
 006F663D    fld         tbyte ptr ds:[6F66C8];57.2957795130823:Extended
 006F6643    fmul        qword ptr [ebp-18]
 006F6646    fstp        qword ptr [ebp-20]
 006F6649    wait
 006F664A    fld         qword ptr [ebp-20]
 006F664D    fchs
 006F664F    fstp        qword ptr ds:[822970];gvar_00822970:Double
 006F6655    wait
 006F6656    push        dword ptr ds:[82296C]
 006F665C    push        dword ptr ds:[822968];gvar_00822968:Double
 006F6662    call        00454A5C
 006F6667    fstp        qword ptr [ebp-28]
 006F666A    wait
 006F666B    fld         tbyte ptr ds:[6F66C8];57.2957795130823:Extended
 006F6671    fmul        qword ptr [ebp-28]
 006F6674    fstp        qword ptr [ebp-30]
 006F6677    wait
 006F6678    mov         eax,dword ptr [ebp-30]
 006F667B    mov         dword ptr ds:[822978],eax;gvar_00822978:Double
 006F6681    mov         eax,dword ptr [ebp-2C]
 006F6684    mov         dword ptr ds:[82297C],eax;gvar_0082297C
 006F668A    mov         bl,1
 006F668C    xor         eax,eax
 006F668E    pop         edx
 006F668F    pop         ecx
 006F6690    pop         ecx
 006F6691    mov         dword ptr fs:[eax],edx
 006F6694    push        6F66A9
 006F6699    lea         eax,[ebp-4]
 006F669C    call        @IntfClear
 006F66A1    ret
>006F66A2    jmp         @HandleFinally
>006F66A7    jmp         006F6699
 006F66A9    mov         eax,ebx
 006F66AB    pop         ebx
 006F66AC    mov         esp,ebp
 006F66AE    pop         ebp
 006F66AF    ret
end;*}

//006F66D4
{*function sub_006F66D4(?:UnicodeString):?;
begin
 006F66D4    push        ebp
 006F66D5    mov         ebp,esp
 006F66D7    push        ecx
 006F66D8    push        ebx
 006F66D9    mov         dword ptr [ebp-4],eax
 006F66DC    mov         eax,dword ptr [ebp-4]
 006F66DF    call        @UStrAddRef
 006F66E4    xor         eax,eax
 006F66E6    push        ebp
 006F66E7    push        6F6717
 006F66EC    push        dword ptr fs:[eax]
 006F66EF    mov         dword ptr fs:[eax],esp
 006F66F2    mov         edx,dword ptr [ebp-4]
 006F66F5    mov         eax,[00822938];gvar_00822938:THashTable
 006F66FA    call        THashTable.Get
 006F66FF    mov         ebx,eax
 006F6701    xor         eax,eax
 006F6703    pop         edx
 006F6704    pop         ecx
 006F6705    pop         ecx
 006F6706    mov         dword ptr fs:[eax],edx
 006F6709    push        6F671E
 006F670E    lea         eax,[ebp-4]
 006F6711    call        @UStrClr
 006F6716    ret
>006F6717    jmp         @HandleFinally
>006F671C    jmp         006F670E
 006F671E    mov         eax,ebx
 006F6720    pop         ebx
 006F6721    pop         ecx
 006F6722    pop         ebp
 006F6723    ret
end;*}

//006F6724
{*procedure sub_006F6724(?:Integer; ?:?);
begin
 006F6724    push        ebx
 006F6725    push        esi
 006F6726    mov         esi,edx
 006F6728    mov         ebx,eax
 006F672A    mov         ecx,esi
 006F672C    mov         edx,ebx
 006F672E    mov         eax,[00822938];gvar_00822938:THashTable
 006F6733    call        THashTable.Get
 006F6738    pop         esi
 006F6739    pop         ebx
 006F673A    ret
end;*}

//006F673C
{*function sub_006F673C:?;
begin
 006F673C    push        ebp
 006F673D    mov         ebp,esp
 006F673F    push        0
 006F6741    push        ebx
 006F6742    push        esi
 006F6743    xor         eax,eax
 006F6745    push        ebp
 006F6746    push        6F67A0
 006F674B    push        dword ptr fs:[eax]
 006F674E    mov         dword ptr fs:[eax],esp
 006F6751    mov         dl,1
 006F6753    mov         eax,[0043C7BC];TStringList
 006F6758    call        TStringList.Create;TStringList.Create
 006F675D    mov         esi,eax
 006F675F    mov         dl,1
 006F6761    mov         eax,esi
 006F6763    call        TStringList.SetSorted
 006F6768    xor         ebx,ebx
 006F676A    lea         edx,[ebp-4]
 006F676D    mov         eax,ebx
 006F676F    call        006F6724
 006F6774    cmp         dword ptr [ebp-4],0
>006F6778    je          006F6784
 006F677A    mov         edx,dword ptr [ebp-4]
 006F677D    mov         eax,esi
 006F677F    mov         ecx,dword ptr [eax]
 006F6781    call        dword ptr [ecx+38];TStringList.Add
 006F6784    inc         ebx
 006F6785    cmp         ebx,11
>006F6788    jne         006F676A
 006F678A    xor         eax,eax
 006F678C    pop         edx
 006F678D    pop         ecx
 006F678E    pop         ecx
 006F678F    mov         dword ptr fs:[eax],edx
 006F6792    push        6F67A7
 006F6797    lea         eax,[ebp-4]
 006F679A    call        @UStrClr
 006F679F    ret
>006F67A0    jmp         @HandleFinally
>006F67A5    jmp         006F6797
 006F67A7    mov         eax,esi
 006F67A9    pop         esi
 006F67AA    pop         ebx
 006F67AB    pop         ecx
 006F67AC    pop         ebp
 006F67AD    ret
end;*}

//006F67B0
{*function sub_006F67B0(?:?):?;
begin
 006F67B0    push        ebp
 006F67B1    mov         ebp,esp
 006F67B3    push        ecx
 006F67B4    push        ebx
 006F67B5    mov         dword ptr [ebp-4],eax
 006F67B8    mov         eax,dword ptr [ebp-4]
 006F67BB    call        @UStrAddRef
 006F67C0    xor         eax,eax
 006F67C2    push        ebp
 006F67C3    push        6F6818
 006F67C8    push        dword ptr fs:[eax]
 006F67CB    mov         dword ptr fs:[eax],esp
 006F67CE    lea         eax,[ebp-4]
 006F67D1    mov         edx,6F6834;'Laptop'
 006F67D6    call        004F9BD0
 006F67DB    test        al,al
>006F67DD    jne         006F67E3
 006F67DF    xor         ebx,ebx
>006F67E1    jmp         006F6802
 006F67E3    lea         eax,[ebp-4]
 006F67E6    call        004F9D00
 006F67EB    lea         eax,[ebp-4]
 006F67EE    mov         edx,6F6850;'.'
 006F67F3    call        004F9BD0
 006F67F8    test        al,al
>006F67FA    jne         006F6800
 006F67FC    xor         ebx,ebx
>006F67FE    jmp         006F6802
 006F6800    mov         bl,1
 006F6802    xor         eax,eax
 006F6804    pop         edx
 006F6805    pop         ecx
 006F6806    pop         ecx
 006F6807    mov         dword ptr fs:[eax],edx
 006F680A    push        6F681F
 006F680F    lea         eax,[ebp-4]
 006F6812    call        @UStrClr
 006F6817    ret
>006F6818    jmp         @HandleFinally
>006F681D    jmp         006F680F
 006F681F    mov         eax,ebx
 006F6821    pop         ebx
 006F6822    pop         ecx
 006F6823    pop         ebp
 006F6824    ret
end;*}

Initialization
//00782D18
{*
 00782D18    sub         dword ptr ds:[822980],1
>00782D1F    jae         00782D37
 00782D21    mov         dl,1
 00782D23    mov         eax,[0067D4A4];THashTable
 00782D28    call        THashTable.Create;THashTable.Create
 00782D2D    mov         [00822938],eax;gvar_00822938:THashTable
 00782D32    call        006F5A70
 00782D37    ret
*}
Finalization
end.