//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit106;

interface

uses
  SysUtils, Classes;

type
  TFakeness = (fNeitherFakeNorReal, fFake, FReal);
  TKey = class(TObjectValue)
  published
    procedure Swallow;//005F3E58
    function GetUnits:TUnits;//005F23C0
    procedure FillClone(c:TExpression);//005F22F4
    constructor Create;//005F22A8
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;//005F3BF0
    function Module:TObject;//005F32E0
    function GetPerUnits1:TUnits;//005F23A8
    procedure GetVector(x:Double; y:Double; z:Double);//005F2F88
    function CanSet:Boolean;//005F22A4
    //function SetValue(NewValue:Double; ?:?):Boolean;//005F36B8
    function GetDataType:TDataType;//005F2314
    procedure GetValue;//005F23D8
    function ToString:string;//005F4D30
    procedure CreateClone;//005F22E4
    procedure Press;//005F33F4
    procedure Release;//005F3508
  public
    ScanCode:Integer;//f20
    UnicodeNumber:Cardinal;//f24
    PrevX:SmallInt;//f28
    PrevY:SmallInt;//f2A
    FakeOrReal:TFakeness;//f2C
    function ToString:string; virtual;//005F4D30
    procedure GetValue; virtual;//v2C//005F23D8
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//005F2F88
    function GetDataType:TDataType; virtual;//v44//005F2314
    function GetUnits:TUnits; virtual;//v48//005F23C0
    function GetPerUnits1:TUnits; virtual;//v4C//005F23A8
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//005F36B8
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean; virtual;//v60//005F3BF0
    function CanSet:Boolean; virtual;//v68//005F22A4
    procedure Press; virtual;//v6C//005F33F4
    procedure Release; virtual;//v70//005F3508
    procedure CreateClone; virtual;//v80//005F22E4
    procedure FillClone(c:TExpression); virtual;//v84//005F22F4
    procedure Swallow; virtual;//v88//005F3E58
    function Module:TObject; virtual;//v98//005F32E0
  end;
  TModuleKeyboard = class(TPieModule)
  published
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//005FC698
    function IsIdentifier(s:string):Boolean;//005FC6B0
    procedure GetGoodFields;//005FC690
    procedure PrepareForMonitoring;//005FCA2C
    procedure MonitorFrame;//005FC8F0
    function GetDefaultFormat(field:string):TGuiFormat;//005FC628
    procedure Read;//005FCA3C
    procedure StartCompiletime;//005FCA44
    procedure StopRuntime;//005FCA5C
    procedure StartRuntime;//005FCA50
    function CreateValue(Identifier:string):TExpression;//005FC5CC
    procedure AddFields;//005F4E88
    constructor Create;//005FC4FC
  public
    function IsIdentifier(s:string):Boolean; virtual;//v10//005FC6B0
    function CreateValue(Identifier:string):TExpression; virtual;//v14//005FC5CC
    procedure GetGoodFields; virtual;//v1C//005FC690
    procedure AddFields; virtual;//v24//005F4E88
    procedure StartCompiletime; virtual;//v28//005FCA44
    procedure StartRuntime; virtual;//v30//005FCA50
    procedure StopRuntime; virtual;//v34//005FCA5C
    procedure Read; virtual;//v3C//005FCA3C
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//005FC698
    function GetDefaultFormat(field:string):TGuiFormat; virtual;//v44//005FC628
    procedure PrepareForMonitoring; virtual;//v5C//005FCA2C
    procedure MonitorFrame; virtual;//v68//005FC8F0
  end;
    //function sub_005F192C(?:?):?;//005F192C
    //function sub_005F1980(?:?; ?:?; ?:?):?;//005F1980
    procedure sub_005F1A20;//005F1A20
    procedure sub_005F1A78;//005F1A78
    procedure sub_005F1AC8;//005F1AC8
    //procedure sub_005F1B0C(?:?);//005F1B0C
    //function sub_005F1B30(?:?):?;//005F1B30
    //function sub_005F1D80(?:string):?;//005F1D80
    procedure sub_005F20D8;//005F20D8
    //function sub_005F20F0(?:UnicodeString):?;//005F20F0
    //procedure sub_005F2178(?:Integer; ?:?);//005F2178
    //procedure sub_005F21C8(?:Integer; ?:?);//005F21C8
    //function sub_005F21E0:?;//005F21E0
    procedure sub_005F32E8(?:Integer);//005F32E8
    procedure sub_005F3410(?:Integer);//005F3410
    //procedure sub_005F3520(?:?; ?:?);//005F3520
    procedure sub_005F3F94;//005F3F94
    //function sub_005F4328:?;//005F4328
    //function sub_005F445C:?;//005F445C
    //function sub_005F4464(?:?):?;//005F4464
    //function sub_005F4490:?;//005F4490
    //function sub_005F44D0(?:?):?;//005F44D0
    //function sub_005F465C(?:?):?;//005F465C
    //function sub_005F48D4(?:?):?;//005F48D4
    //procedure sub_005F491C(?:?);//005F491C
    //function sub_005F49B0:?;//005F49B0
    procedure sub_005F4DA0;//005F4DA0

implementation

//005F192C
{*function sub_005F192C(?:?):?;
begin
 005F192C    movzx       edx,ax
 005F192F    cmp         edx,90
>005F1935    jg          005F1948
>005F1937    je          005F1969
 005F1939    sub         edx,1A
>005F193C    je          005F195A
 005F193E    dec         edx
>005F193F    je          005F195F
 005F1941    sub         edx,10
>005F1944    je          005F1964
>005F1946    jmp         005F197C
 005F1948    sub         edx,91
>005F194E    je          005F196E
 005F1950    dec         edx
>005F1951    je          005F1973
 005F1953    sub         edx,2
>005F1956    je          005F1978
>005F1958    jmp         005F197C
 005F195A    mov         ax,1B
 005F195E    ret
 005F195F    mov         ax,2B
 005F1963    ret
 005F1964    mov         ax,55
 005F1968    ret
 005F1969    mov         ax,0D
 005F196D    ret
 005F196E    mov         ax,1A
 005F1972    ret
 005F1973    mov         ax,28
 005F1977    ret
 005F1978    mov         ax,29
 005F197C    ret
end;*}

//005F1980
{*function sub_005F1980(?:?; ?:?; ?:?):?;
begin
 005F1980    push        ebp
 005F1981    mov         ebp,esp
 005F1983    push        ebx
 005F1984    push        esi
 005F1985    xor         esi,esi
 005F1987    mov         eax,dword ptr [ebp+10]
 005F198A    movzx       ebx,byte ptr [eax+4]
 005F198E    mov         edx,dword ptr [eax+8]
 005F1991    test        dl,1
>005F1994    je          005F199E
 005F1996    cmp         bl,36
>005F1999    je          005F199E
 005F199B    add         bl,80
 005F199E    mov         ecx,edx
 005F19A0    and         ecx,80
 005F19A6    test        ecx,ecx
 005F19A8    mov         ecx,edx
 005F19AA    and         ecx,10
 005F19AD    test        ecx,ecx
 005F19AF    test        ecx,ecx
>005F19B1    je          005F19B7
 005F19B3    xor         esi,esi
>005F19B5    jmp         005F19D4
 005F19B7    cmp         byte ptr ds:[81640C],0;gvar_0081640C:Boolean
>005F19BE    je          005F19C5
 005F19C0    or          esi,0FFFFFFFF
>005F19C3    jmp         005F19D4
 005F19C5    movzx       edx,bl
 005F19C8    cmp         byte ptr [edx+81640F],0;gvar_0081640F
>005F19CF    je          005F19D4
 005F19D1    or          esi,0FFFFFFFF
 005F19D4    test        esi,esi
>005F19D6    jne         005F19F3
 005F19D8    mov         eax,dword ptr [ebp+10]
 005F19DB    push        eax
 005F19DC    mov         eax,dword ptr [ebp+0C]
 005F19DF    push        eax
 005F19E0    mov         eax,dword ptr [ebp+8]
 005F19E3    push        eax
 005F19E4    mov         eax,[00816408];gvar_00816408:HHOOK
 005F19E9    push        eax
 005F19EA    call        user32.CallNextHookEx
 005F19EF    mov         esi,eax
>005F19F1    jmp         005F1A15
 005F19F3    mov         eax,dword ptr [eax+8]
 005F19F6    and         eax,80
 005F19FB    test        eax,eax
>005F19FD    je          005F1A0B
 005F19FF    movzx       ebx,bl
 005F1A02    btr         dword ptr ds:[81660F],ebx;gvar_0081660F
>005F1A09    jmp         005F1A15
 005F1A0B    movzx       ebx,bl
 005F1A0E    bts         dword ptr ds:[81660F],ebx;gvar_0081660F
 005F1A15    mov         eax,esi
 005F1A17    pop         esi
 005F1A18    pop         ebx
 005F1A19    pop         ebp
 005F1A1A    ret         0C
end;*}

//005F1A20
procedure sub_005F1A20;
begin
{*
 005F1A20    push        ebp
 005F1A21    mov         ebp,esp
 005F1A23    push        ebx
 005F1A24    push        esi
 005F1A25    push        edi
 005F1A26    xor         edx,edx
 005F1A28    push        ebp
 005F1A29    push        5F1A58
 005F1A2E    push        dword ptr fs:[edx]
 005F1A31    mov         dword ptr fs:[edx],esp
 005F1A34    push        0
 005F1A36    mov         eax,[00790C38];gvar_00790C38
 005F1A3B    push        eax
 005F1A3C    mov         eax,5F1980;sub_005F1980
 005F1A41    push        eax
 005F1A42    push        0D
 005F1A44    call        user32.SetWindowsHookExW
 005F1A49    mov         [00816408],eax;gvar_00816408:HHOOK
 005F1A4E    xor         eax,eax
 005F1A50    pop         edx
 005F1A51    pop         ecx
 005F1A52    pop         ecx
 005F1A53    mov         dword ptr fs:[eax],edx
>005F1A56    jmp         005F1A73
>005F1A58    jmp         @HandleOnException
 005F1A5D    dd          1
 005F1A61    dd          00418C04;Exception
 005F1A65    dd          005F1A69
 005F1A69    call        004FA644
 005F1A6E    call        @DoneExcept
 005F1A73    pop         edi
 005F1A74    pop         esi
 005F1A75    pop         ebx
 005F1A76    pop         ebp
 005F1A77    ret
*}
end;

//005F1A78
procedure sub_005F1A78;
begin
{*
 005F1A78    push        ebp
 005F1A79    mov         ebp,esp
 005F1A7B    push        ebx
 005F1A7C    push        esi
 005F1A7D    push        edi
 005F1A7E    xor         edx,edx
 005F1A80    push        ebp
 005F1A81    push        5F1AA1
 005F1A86    push        dword ptr fs:[edx]
 005F1A89    mov         dword ptr fs:[edx],esp
 005F1A8C    mov         eax,[00816408];gvar_00816408:HHOOK
 005F1A91    push        eax
 005F1A92    call        user32.UnhookWindowsHookEx
 005F1A97    xor         eax,eax
 005F1A99    pop         edx
 005F1A9A    pop         ecx
 005F1A9B    pop         ecx
 005F1A9C    mov         dword ptr fs:[eax],edx
>005F1A9F    jmp         005F1ABC
>005F1AA1    jmp         @HandleOnException
 005F1AA6    dd          1
 005F1AAA    dd          00418C04;Exception
 005F1AAE    dd          005F1AB2
 005F1AB2    call        004FA644
 005F1AB7    call        @DoneExcept
 005F1ABC    xor         eax,eax
 005F1ABE    mov         [00816408],eax;gvar_00816408:HHOOK
 005F1AC3    pop         edi
 005F1AC4    pop         esi
 005F1AC5    pop         ebx
 005F1AC6    pop         ebp
 005F1AC7    ret
*}
end;

//005F1AC8
procedure sub_005F1AC8;
begin
{*
 005F1AC8    push        esi
 005F1AC9    push        edi
 005F1ACA    mov         esi,81650F;gvar_0081650F:Pointer
 005F1ACF    mov         edi,81640F;gvar_0081640F
 005F1AD4    mov         ecx,40
 005F1AD9    rep movs    dword ptr [edi],dword ptr [esi]
 005F1ADB    mov         eax,81650F;gvar_0081650F:Pointer
 005F1AE0    xor         ecx,ecx
 005F1AE2    mov         edx,100
 005F1AE7    call        @FillChar
 005F1AEC    cmp         byte ptr ds:[81640E],0;gvar_0081640E
>005F1AF3    jne         005F1B08
 005F1AF5    movzx       eax,byte ptr ds:[81640D];gvar_0081640D
 005F1AFC    mov         [0081640C],al;gvar_0081640C:Boolean
 005F1B01    mov         byte ptr ds:[81640D],0;gvar_0081640D
 005F1B08    pop         edi
 005F1B09    pop         esi
 005F1B0A    ret
*}
end;

//005F1B0C
{*procedure sub_005F1B0C(?:?);
begin
 005F1B0C    test        eax,eax
>005F1B0E    jle         005F1B2E
 005F1B10    cmp         eax,34
>005F1B13    jg          005F1B2E
 005F1B15    cmp         byte ptr [eax+8162C0],0;gvar_008162C0:Pointer
>005F1B1C    jne         005F1B27
 005F1B1E    mov         byte ptr [eax+8162C0],3;gvar_008162C0:Pointer
>005F1B25    jmp         005F1B2E
 005F1B27    mov         byte ptr [eax+8162C0],1;gvar_008162C0:Pointer
 005F1B2E    ret
end;*}

//005F1B30
{*function sub_005F1B30(?:?):?;
begin
 005F1B30    add         esp,0FFFFFFF8
 005F1B33    cmp         eax,0ED
>005F1B38    ja          005F1D6C
 005F1B3E    movzx       eax,byte ptr [eax+5F1B4C]
 005F1B45    jmp         dword ptr [eax*4+5F1C3A]
 005F1B45    db          0
 005F1B45    db          3
 005F1B45    db          4
 005F1B45    db          4
 005F1B45    db          4
 005F1B45    db          4
 005F1B45    db          4
 005F1B45    db          4
 005F1B45    db          4
 005F1B45    db          4
 005F1B45    db          4
 005F1B45    db          4
 005F1B45    db          4
 005F1B45    db          4
 005F1B45    db          4
 005F1B45    db          6
 005F1B45    db          6
 005F1B45    db          6
 005F1B45    db          6
 005F1B45    db          6
 005F1B45    db          6
 005F1B45    db          6
 005F1B45    db          6
 005F1B45    db          6
 005F1B45    db          6
 005F1B45    db          6
 005F1B45    db          6
 005F1B45    db          6
 005F1B45    db          9
 005F1B45    db          14
 005F1B45    db          9
 005F1B45    db          9
 005F1B45    db          9
 005F1B45    db          9
 005F1B45    db          9
 005F1B45    db          9
 005F1B45    db          9
 005F1B45    db          9
 005F1B45    db          9
 005F1B45    db          9
 005F1B45    db          9
 005F1B45    db          4
 005F1B45    db          11
 005F1B45    db          1
 005F1B45    db          11
 005F1B45    db          11
 005F1B45    db          11
 005F1B45    db          11
 005F1B45    db          11
 005F1B45    db          11
 005F1B45    db          11
 005F1B45    db          11
 005F1B45    db          11
 005F1B45    db          11
 005F1B45    db          11
 005F1B45    db          5
 005F1B45    db          14
 005F1B45    db          14
 005F1B45    db          9
 005F1B45    db          3
 005F1B45    db          3
 005F1B45    db          3
 005F1B45    db          3
 005F1B45    db          3
 005F1B45    db          3
 005F1B45    db          3
 005F1B45    db          3
 005F1B45    db          3
 005F1B45    db          3
 005F1B45    db          5
 005F1B45    db          3
 005F1B45    db          7
 005F1B45    db          7
 005F1B45    db          7
 005F1B45    db          5
 005F1B45    db          10
 005F1B45    db          10
 005F1B45    db          10
 005F1B45    db          8
 005F1B45    db          12
 005F1B45    db          12
 005F1B45    db          12
 005F1B45    db          15
 005F1B45    db          15
 005F1B45    db          3
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          3
 005F1B45    db          3
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          2
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          2
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          3
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          2
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          13
 005F1B45    db          14
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          2
 005F1B45    db          3
 005F1B45    db          2
 005F1B45    db          0
 005F1B45    db          2
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          2
 005F1B45    db          0
 005F1B45    db          2
 005F1B45    db          0
 005F1B45    db          2
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          5
 005F1B45    db          0
 005F1B45    db          3
 005F1B45    db          14
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          2
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          3
 005F1B45    db          3
 005F1B45    db          5
 005F1B45    db          12
 005F1B45    db          5
 005F1B45    db          0
 005F1B45    db          15
 005F1B45    db          0
 005F1B45    db          15
 005F1B45    db          0
 005F1B45    db          7
 005F1B45    db          15
 005F1B45    db          7
 005F1B45    db          5
 005F1B45    db          7
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          14
 005F1B45    db          14
 005F1B45    db          14
 005F1B45    db          3
 005F1B45    db          3
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          3
 005F1B45    db          2
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          0
 005F1B45    db          2
 005F1B45    db          2
 005F1B45    db          2
 005F1B45    dd          005F1D6C
 005F1B45    dd          005F1C7A
 005F1B45    dd          005F1C8C
 005F1B45    dd          005F1C9A
 005F1B45    dd          005F1CAC
 005F1B45    dd          005F1CBE
 005F1B45    dd          005F1CD0
 005F1B45    dd          005F1CE2
 005F1B45    dd          005F1CF4
 005F1B45    dd          005F1D03
 005F1B45    dd          005F1D12
 005F1B45    dd          005F1D21
 005F1B45    dd          005F1D30
 005F1B45    dd          005F1D3F
 005F1B45    dd          005F1D4E
 005F1B45    dd          005F1D5D
 005F1C7A    xor         eax,eax
 005F1C7C    mov         dword ptr [esp],eax
 005F1C7F    mov         dword ptr [esp+4],0BFF00000
>005F1C87    jmp         005F1D79
 005F1C8C    xor         eax,eax
 005F1C8E    mov         dword ptr [esp],eax
 005F1C91    mov         dword ptr [esp+4],eax
>005F1C95    jmp         005F1D79
 005F1C9A    xor         eax,eax
 005F1C9C    mov         dword ptr [esp],eax
 005F1C9F    mov         dword ptr [esp+4],3FF00000
>005F1CA7    jmp         005F1D79
 005F1CAC    xor         eax,eax
 005F1CAE    mov         dword ptr [esp],eax
 005F1CB1    mov         dword ptr [esp+4],40000000
>005F1CB9    jmp         005F1D79
 005F1CBE    xor         eax,eax
 005F1CC0    mov         dword ptr [esp],eax
 005F1CC3    mov         dword ptr [esp+4],40000000
>005F1CCB    jmp         005F1D79
 005F1CD0    xor         eax,eax
 005F1CD2    mov         dword ptr [esp],eax
 005F1CD5    mov         dword ptr [esp+4],40080000
>005F1CDD    jmp         005F1D79
 005F1CE2    xor         eax,eax
 005F1CE4    mov         dword ptr [esp],eax
 005F1CE7    mov         dword ptr [esp+4],40080000
>005F1CEF    jmp         005F1D79
 005F1CF4    xor         eax,eax
 005F1CF6    mov         dword ptr [esp],eax
 005F1CF9    mov         dword ptr [esp+4],400C0000
>005F1D01    jmp         005F1D79
 005F1D03    xor         eax,eax
 005F1D05    mov         dword ptr [esp],eax
 005F1D08    mov         dword ptr [esp+4],40100000
>005F1D10    jmp         005F1D79
 005F1D12    xor         eax,eax
 005F1D14    mov         dword ptr [esp],eax
 005F1D17    mov         dword ptr [esp+4],40100000
>005F1D1F    jmp         005F1D79
 005F1D21    xor         eax,eax
 005F1D23    mov         dword ptr [esp],eax
 005F1D26    mov         dword ptr [esp+4],40140000
>005F1D2E    jmp         005F1D79
 005F1D30    xor         eax,eax
 005F1D32    mov         dword ptr [esp],eax
 005F1D35    mov         dword ptr [esp+4],40140000
>005F1D3D    jmp         005F1D79
 005F1D3F    xor         eax,eax
 005F1D41    mov         dword ptr [esp],eax
 005F1D44    mov         dword ptr [esp+4],40160000
>005F1D4C    jmp         005F1D79
 005F1D4E    xor         eax,eax
 005F1D50    mov         dword ptr [esp],eax
 005F1D53    mov         dword ptr [esp+4],40180000
>005F1D5B    jmp         005F1D79
 005F1D5D    xor         eax,eax
 005F1D5F    mov         dword ptr [esp],eax
 005F1D62    mov         dword ptr [esp+4],40180000
>005F1D6A    jmp         005F1D79
 005F1D6C    xor         eax,eax
 005F1D6E    mov         dword ptr [esp],eax
 005F1D71    mov         dword ptr [esp+4],0BFF00000
 005F1D79    fld         qword ptr [esp]
 005F1D7C    pop         ecx
 005F1D7D    pop         edx
 005F1D7E    ret
end;*}

//005F1D80
{*function sub_005F1D80(?:string):?;
begin
 005F1D80    push        ebp
 005F1D81    mov         ebp,esp
 005F1D83    add         esp,0FFFFFFEC
 005F1D86    push        ebx
 005F1D87    push        esi
 005F1D88    push        edi
 005F1D89    xor         edx,edx
 005F1D8B    mov         dword ptr [ebp-8],edx
 005F1D8E    mov         dword ptr [ebp-4],eax
 005F1D91    mov         eax,dword ptr [ebp-4]
 005F1D94    call        @UStrAddRef
 005F1D99    xor         eax,eax
 005F1D9B    push        ebp
 005F1D9C    push        5F1FE8
 005F1DA1    push        dword ptr fs:[eax]
 005F1DA4    mov         dword ptr fs:[eax],esp
 005F1DA7    xor         eax,eax
 005F1DA9    mov         dword ptr [ebp-0C],eax
 005F1DAC    lea         edx,[ebp-8]
 005F1DAF    mov         eax,dword ptr [ebp-4]
 005F1DB2    call        LowerCase
 005F1DB7    lea         eax,[ebp-8]
 005F1DBA    mov         edx,5F2008;'fake'
 005F1DBF    call        004F9BD0
 005F1DC4    test        al,al
>005F1DC6    je          005F1DCC
 005F1DC8    mov         bl,1
>005F1DCA    jmp         005F1DE3
 005F1DCC    lea         eax,[ebp-8]
 005F1DCF    mov         edx,5F2020;'real'
 005F1DD4    call        004F9BD0
 005F1DD9    test        al,al
>005F1DDB    je          005F1DE1
 005F1DDD    mov         bl,2
>005F1DDF    jmp         005F1DE3
 005F1DE1    xor         ebx,ebx
 005F1DE3    lea         eax,[ebp-8]
 005F1DE6    mov         edx,5F2038;'keyboards'
 005F1DEB    call        004F9BD0
 005F1DF0    test        al,al
>005F1DF2    jne         005F1E38
 005F1DF4    lea         eax,[ebp-8]
 005F1DF7    mov         edx,5F2058;'keyboard'
 005F1DFC    call        004F9BD0
 005F1E01    test        al,al
>005F1E03    jne         005F1E38
 005F1E05    lea         eax,[ebp-8]
 005F1E08    mov         edx,5F2078;'keys'
 005F1E0D    call        004F9BD0
 005F1E12    test        al,al
>005F1E14    jne         005F1E38
 005F1E16    lea         eax,[ebp-8]
 005F1E19    mov         edx,5F2090;'key'
 005F1E1E    call        004F9BD0
 005F1E23    test        al,al
>005F1E25    jne         005F1E38
 005F1E27    lea         eax,[ebp-8]
 005F1E2A    mov         edx,5F20A4;'kbd'
 005F1E2F    call        004F9BD0
 005F1E34    test        al,al
>005F1E36    je          005F1E5A
 005F1E38    lea         eax,[ebp-8]
 005F1E3B    call        004F9D00
 005F1E40    mov         dword ptr [ebp-10],eax
 005F1E43    lea         eax,[ebp-8]
 005F1E46    mov         edx,5F20B8;'.'
 005F1E4B    call        004F9BD0
 005F1E50    test        al,al
>005F1E52    je          005F1FCD
>005F1E58    jmp         005F1E61
 005F1E5A    mov         dword ptr [ebp-10],0FFFFFFFF
 005F1E61    mov         eax,dword ptr [ebp-8]
 005F1E64    call        005F20F0
 005F1E69    mov         dword ptr [ebp-14],eax
 005F1E6C    cmp         dword ptr [ebp-14],0
>005F1E70    jl          005F1FCD
 005F1E76    mov         dl,1
 005F1E78    mov         eax,[005F1024];TKey
 005F1E7D    call        TKey.Create;TKey.Create
 005F1E82    mov         dword ptr [ebp-0C],eax
 005F1E85    mov         eax,dword ptr [ebp-0C]
 005F1E88    mov         edx,dword ptr [ebp-14]
 005F1E8B    mov         dword ptr [eax+20],edx;TKey.ScanCode:Integer
 005F1E8E    mov         eax,dword ptr [ebp-0C]
 005F1E91    xor         edx,edx
 005F1E93    mov         dword ptr [eax+24],edx;TKey.UnicodeNumber:Cardinal
 005F1E96    mov         eax,dword ptr [ebp-0C]
 005F1E99    mov         byte ptr [eax+2C],bl;TKey.FakeOrReal:TFakeness
 005F1E9C    cmp         dword ptr [ebp-14],11C
>005F1EA3    jne         005F1EF3
 005F1EA5    lea         eax,[ebp-8]
 005F1EA8    mov         edx,5F20C8;'unicode'
 005F1EAD    call        004F9BD0
 005F1EB2    xor         edx,edx
 005F1EB4    push        ebp
 005F1EB5    push        5F1ED8
 005F1EBA    push        dword ptr fs:[edx]
 005F1EBD    mov         dword ptr fs:[edx],esp
 005F1EC0    mov         eax,dword ptr [ebp-8]
 005F1EC3    call        004F936C
 005F1EC8    mov         edx,dword ptr [ebp-0C]
 005F1ECB    mov         dword ptr [edx+24],eax;TKey.UnicodeNumber:Cardinal
 005F1ECE    xor         eax,eax
 005F1ED0    pop         edx
 005F1ED1    pop         ecx
 005F1ED2    pop         ecx
 005F1ED3    mov         dword ptr fs:[eax],edx
>005F1ED6    jmp         005F1EF3
>005F1ED8    jmp         @HandleOnException
 005F1EDD    dd          1
 005F1EE1    dd          00418C04;Exception
 005F1EE5    dd          005F1EE9
 005F1EE9    call        004FA644
 005F1EEE    call        @DoneExcept
 005F1EF3    mov         eax,dword ptr [ebp-0C]
 005F1EF6    mov         edx,dword ptr [ebp-10]
 005F1EF9    mov         dword ptr [eax+18],edx;TKey................................................................
 005F1EFC    mov         byte ptr ds:[8162F6],1;gvar_008162F6
 005F1F03    cmp         dword ptr [ebp-10],0
>005F1F07    jl          005F1F10
 005F1F09    mov         byte ptr ds:[8162F7],1;gvar_008162F7
 005F1F10    cmp         dword ptr [ebp-14],108
>005F1F17    jne         005F1F20
 005F1F19    mov         byte ptr ds:[8162F7],1;gvar_008162F7
 005F1F20    cmp         dword ptr [ebp-14],117
>005F1F27    jne         005F1F30
 005F1F29    mov         byte ptr ds:[8162F8],1;gvar_008162F8
 005F1F30    cmp         dword ptr [ebp-14],141
>005F1F37    jl          005F1F49
 005F1F39    cmp         dword ptr [ebp-14],144
>005F1F40    jg          005F1F49
 005F1F42    mov         byte ptr ds:[8162F9],1;gvar_008162F9
 005F1F49    call        005FCD64
 005F1F4E    test        al,al
>005F1F50    je          005F1FBC
 005F1F52    mov         eax,dword ptr [ebp-14]
 005F1F55    cmp         eax,0B2
>005F1F5A    jg          005F1F89
>005F1F5C    je          005F1FB5
 005F1F5E    cmp         eax,0AA
>005F1F63    jg          005F1F7B
>005F1F65    je          005F1FB5
 005F1F67    add         eax,0FFFFFF6F
 005F1F6C    sub         eax,4
>005F1F6F    jb          005F1FB5
 005F1F71    add         eax,0FFFFFFF6
 005F1F74    sub         eax,3
>005F1F77    jb          005F1FB5
>005F1F79    jmp         005F1FBC
 005F1F7B    sub         eax,0AE
>005F1F80    je          005F1FB5
 005F1F82    sub         eax,2
>005F1F85    je          005F1FB5
>005F1F87    jmp         005F1FBC
 005F1F89    cmp         eax,0E5
>005F1F8E    jge         005F1F9E
 005F1F90    sub         eax,0B6
>005F1F95    je          005F1FB5
 005F1F97    sub         eax,0F
>005F1F9A    je          005F1FB5
>005F1F9C    jmp         005F1FBC
 005F1F9E    add         eax,0FFFFFF1B
 005F1FA3    sub         eax,9
>005F1FA6    jb          005F1FB5
 005F1FA8    add         eax,0FFFFFFEA
 005F1FAB    sub         eax,4
>005F1FAE    jb          005F1FB5
 005F1FB0    sub         eax,8
>005F1FB3    jne         005F1FBC
 005F1FB5    mov         byte ptr ds:[8162F7],1;gvar_008162F7
 005F1FBC    cmp         byte ptr ds:[8162F7],0;gvar_008162F7
>005F1FC3    je          005F1FCD
 005F1FC5    mov         eax,[0078CBF8];^gvar_008161F9
 005F1FCA    mov         byte ptr [eax],1
 005F1FCD    xor         eax,eax
 005F1FCF    pop         edx
 005F1FD0    pop         ecx
 005F1FD1    pop         ecx
 005F1FD2    mov         dword ptr fs:[eax],edx
 005F1FD5    push        5F1FEF
 005F1FDA    lea         eax,[ebp-8]
 005F1FDD    mov         edx,2
 005F1FE2    call        @UStrArrayClr
 005F1FE7    ret
>005F1FE8    jmp         @HandleFinally
>005F1FED    jmp         005F1FDA
 005F1FEF    mov         eax,dword ptr [ebp-0C]
 005F1FF2    pop         edi
 005F1FF3    pop         esi
 005F1FF4    pop         ebx
 005F1FF5    mov         esp,ebp
 005F1FF7    pop         ebp
 005F1FF8    ret
end;*}

//005F20D8
procedure sub_005F20D8;
begin
{*
 005F20D8    mov         byte ptr ds:[8162F6],0;gvar_008162F6
 005F20DF    mov         byte ptr ds:[8162F7],0;gvar_008162F7
 005F20E6    mov         byte ptr ds:[8162F8],0;gvar_008162F8
 005F20ED    ret
*}
end;

//005F20F0
{*function sub_005F20F0(?:UnicodeString):?;
begin
 005F20F0    push        ebp
 005F20F1    mov         ebp,esp
 005F20F3    push        ecx
 005F20F4    push        ebx
 005F20F5    mov         dword ptr [ebp-4],eax
 005F20F8    mov         eax,dword ptr [ebp-4]
 005F20FB    call        @UStrAddRef
 005F2100    xor         eax,eax
 005F2102    push        ebp
 005F2103    push        5F214E
 005F2108    push        dword ptr fs:[eax]
 005F210B    mov         dword ptr fs:[eax],esp
 005F210E    mov         edx,5F2168;'unicode'
 005F2113    mov         eax,dword ptr [ebp-4]
 005F2116    call        004F9A58
 005F211B    test        al,al
>005F211D    je          005F2126
 005F211F    mov         ebx,11C
>005F2124    jmp         005F2138
 005F2126    mov         eax,[00816300];gvar_00816300:TModuleKeyboard
 005F212B    mov         eax,dword ptr [eax+1C]
 005F212E    mov         edx,dword ptr [ebp-4]
 005F2131    call        THashTable.Get
 005F2136    mov         ebx,eax
 005F2138    xor         eax,eax
 005F213A    pop         edx
 005F213B    pop         ecx
 005F213C    pop         ecx
 005F213D    mov         dword ptr fs:[eax],edx
 005F2140    push        5F2155
 005F2145    lea         eax,[ebp-4]
 005F2148    call        @UStrClr
 005F214D    ret
>005F214E    jmp         @HandleFinally
>005F2153    jmp         005F2145
 005F2155    mov         eax,ebx
 005F2157    pop         ebx
 005F2158    pop         ecx
 005F2159    pop         ebp
 005F215A    ret
end;*}

//005F2178
{*procedure sub_005F2178(?:Integer; ?:?);
begin
 005F2178    push        ebx
 005F2179    push        esi
 005F217A    mov         esi,edx
 005F217C    mov         ebx,eax
 005F217E    cmp         ebx,11C
>005F2184    jne         005F2195
 005F2186    mov         eax,esi
 005F2188    mov         edx,5F21B8;'Unicode'
 005F218D    call        @UStrAsg
 005F2192    pop         esi
 005F2193    pop         ebx
 005F2194    ret
 005F2195    mov         ecx,esi
 005F2197    mov         eax,[00816300];gvar_00816300:TModuleKeyboard
 005F219C    mov         eax,dword ptr [eax+1C]
 005F219F    mov         edx,ebx
 005F21A1    call        THashTable.Get
 005F21A6    pop         esi
 005F21A7    pop         ebx
 005F21A8    ret
end;*}

//005F21C8
{*procedure sub_005F21C8(?:Integer; ?:?);
begin
 005F21C8    push        ebx
 005F21C9    push        esi
 005F21CA    mov         esi,edx
 005F21CC    call        005FD518
 005F21D1    mov         ebx,eax
 005F21D3    mov         edx,esi
 005F21D5    mov         eax,ebx
 005F21D7    call        005F2178
 005F21DC    pop         esi
 005F21DD    pop         ebx
 005F21DE    ret
end;*}

//005F21E0
{*function sub_005F21E0:?;
begin
 005F21E0    push        ebp
 005F21E1    mov         ebp,esp
 005F21E3    push        0
 005F21E5    push        0
 005F21E7    push        ebx
 005F21E8    push        esi
 005F21E9    xor         eax,eax
 005F21EB    push        ebp
 005F21EC    push        5F227B
 005F21F1    push        dword ptr fs:[eax]
 005F21F4    mov         dword ptr fs:[eax],esp
 005F21F7    mov         dl,1
 005F21F9    mov         eax,[0043C7BC];TStringList
 005F21FE    call        TStringList.Create;TStringList.Create
 005F2203    mov         esi,eax
 005F2205    mov         dl,1
 005F2207    mov         eax,esi
 005F2209    call        TStringList.SetSorted
 005F220E    xor         ebx,ebx
 005F2210    lea         ecx,[ebp-4]
 005F2213    mov         eax,[00816300];gvar_00816300:TModuleKeyboard
 005F2218    mov         eax,dword ptr [eax+1C]
 005F221B    mov         edx,ebx
 005F221D    call        THashTable.Get
 005F2222    cmp         dword ptr [ebp-4],0
>005F2226    je          005F2257
 005F2228    lea         eax,[ebp-8]
 005F222B    push        eax
 005F222C    mov         ecx,4
 005F2231    mov         edx,1
 005F2236    mov         eax,dword ptr [ebp-4]
 005F2239    call        @UStrCopy
 005F223E    mov         eax,dword ptr [ebp-8]
 005F2241    mov         edx,5F2298;'Scan'
 005F2246    call        @UStrEqual
>005F224B    je          005F2257
 005F224D    mov         edx,dword ptr [ebp-4]
 005F2250    mov         eax,esi
 005F2252    mov         ecx,dword ptr [eax]
 005F2254    call        dword ptr [ecx+38];TStringList.Add
 005F2257    inc         ebx
 005F2258    cmp         ebx,15F
>005F225E    jne         005F2210
 005F2260    xor         eax,eax
 005F2262    pop         edx
 005F2263    pop         ecx
 005F2264    pop         ecx
 005F2265    mov         dword ptr fs:[eax],edx
 005F2268    push        5F2282
 005F226D    lea         eax,[ebp-8]
 005F2270    mov         edx,2
 005F2275    call        @UStrArrayClr
 005F227A    ret
>005F227B    jmp         @HandleFinally
>005F2280    jmp         005F226D
 005F2282    mov         eax,esi
 005F2284    pop         esi
 005F2285    pop         ebx
 005F2286    pop         ecx
 005F2287    pop         ecx
 005F2288    pop         ebp
 005F2289    ret
end;*}

//005F22A4
function TKey.CanSet:Boolean;
begin
{*
 005F22A4    mov         al,1
 005F22A6    ret
*}
end;

//005F22A8
constructor TKey.Create;
begin
{*
 005F22A8    push        ebx
 005F22A9    push        esi
 005F22AA    test        dl,dl
>005F22AC    je          005F22B6
 005F22AE    add         esp,0FFFFFFF0
 005F22B1    call        @ClassCreate
 005F22B6    mov         ebx,edx
 005F22B8    mov         esi,eax
 005F22BA    xor         edx,edx
 005F22BC    mov         eax,esi
 005F22BE    call        TObject.Create
 005F22C3    mov         byte ptr ds:[8162F6],1;gvar_008162F6
 005F22CA    mov         eax,esi
 005F22CC    test        bl,bl
>005F22CE    je          005F22DF
 005F22D0    call        @AfterConstruction
 005F22D5    pop         dword ptr fs:[0]
 005F22DC    add         esp,0C
 005F22DF    mov         eax,esi
 005F22E1    pop         esi
 005F22E2    pop         ebx
 005F22E3    ret
*}
end;

//005F22E4
procedure TKey.CreateClone;
begin
{*
 005F22E4    mov         dl,1
 005F22E6    mov         eax,[005F1024];TKey
 005F22EB    call        TKey.Create;TKey.Create
 005F22F0    ret
*}
end;

//005F22F4
procedure TKey.FillClone(c:TExpression);
begin
{*
 005F22F4    push        ebx
 005F22F5    push        esi
 005F22F6    mov         esi,edx
 005F22F8    mov         ebx,eax
 005F22FA    mov         edx,esi
 005F22FC    mov         eax,ebx
 005F22FE    call        TExpression.FillClone
 005F2303    mov         eax,esi
 005F2305    mov         edx,dword ptr [ebx+18];TKey................................................................
 005F2308    mov         dword ptr [eax+18],edx
 005F230B    mov         edx,dword ptr [ebx+20];TKey.ScanCode:Integer
 005F230E    mov         dword ptr [eax+20],edx
 005F2311    pop         esi
 005F2312    pop         ebx
 005F2313    ret
*}
end;

//005F2314
function TKey.GetDataType:TDataType;
begin
{*
 005F2314    mov         eax,dword ptr [eax+20];TKey.ScanCode:Integer
 005F2317    cmp         eax,110
>005F231C    jge         005F234C
 005F231E    cmp         eax,10A
>005F2323    jge         005F2338
 005F2325    sub         eax,100
>005F232A    jb          005F238D
 005F232C    sub         eax,8
>005F232F    jb          005F2390
>005F2331    je          005F2393
 005F2333    dec         eax
>005F2334    je          005F239C
>005F2336    jmp         005F23A5
 005F2338    add         eax,0FFFFFEF6
 005F233D    sub         eax,3
>005F2340    jb          005F2393
>005F2342    je          005F2396
 005F2344    dec         eax
>005F2345    je          005F2399
 005F2347    dec         eax
>005F2348    je          005F2393
>005F234A    jmp         005F23A5
 005F234C    cmp         eax,117
>005F2351    jg          005F236E
>005F2353    je          005F239C
 005F2355    add         eax,0FFFFFEF0
 005F235A    sub         eax,2
>005F235D    jb          005F239C
 005F235F    sub         eax,2
>005F2362    jb          005F2393
>005F2364    je          005F2399
 005F2366    dec         eax
 005F2367    sub         eax,2
>005F236A    jb          005F2393
>005F236C    jmp         005F23A5
 005F236E    add         eax,0FFFFFEE8
 005F2373    sub         eax,2
>005F2376    jb          005F2399
 005F2378    sub         eax,2
>005F237B    jb          005F2390
 005F237D    dec         eax
 005F237E    sub         eax,3
>005F2381    jb          005F239F
 005F2383    add         eax,0FFFFFFE4
 005F2386    sub         eax,9
>005F2389    jb          005F23A2
>005F238B    jmp         005F23A5
 005F238D    mov         al,3
 005F238F    ret
 005F2390    mov         al,3
 005F2392    ret
 005F2393    mov         al,2
 005F2395    ret
 005F2396    mov         al,4
 005F2398    ret
 005F2399    xor         eax,eax
 005F239B    ret
 005F239C    mov         al,3
 005F239E    ret
 005F239F    mov         al,5
 005F23A1    ret
 005F23A2    mov         al,3
 005F23A4    ret
 005F23A5    xor         eax,eax
 005F23A7    ret
*}
end;

//005F23A8
function TKey.GetPerUnits1:TUnits;
begin
{*
 005F23A8    mov         eax,dword ptr [eax+20];TKey.ScanCode:Integer
 005F23AB    sub         eax,118
>005F23B0    je          005F23B7
 005F23B2    dec         eax
>005F23B3    je          005F23BA
>005F23B5    jmp         005F23BD
 005F23B7    mov         al,11
 005F23B9    ret
 005F23BA    xor         eax,eax
 005F23BC    ret
 005F23BD    xor         eax,eax
 005F23BF    ret
*}
end;

//005F23C0
function TKey.GetUnits:TUnits;
begin
{*
 005F23C0    mov         eax,dword ptr [eax+20];TKey.ScanCode:Integer
 005F23C3    sub         eax,118
>005F23C8    je          005F23CF
 005F23CA    dec         eax
>005F23CB    je          005F23D2
>005F23CD    jmp         005F23D5
 005F23CF    xor         eax,eax
 005F23D1    ret
 005F23D2    mov         al,11
 005F23D4    ret
 005F23D5    xor         eax,eax
 005F23D7    ret
*}
end;

//005F23D8
procedure TKey.GetValue;
begin
{*
 005F23D8    push        ebx
 005F23D9    push        esi
 005F23DA    add         esp,0FFFFFFEC
 005F23DD    mov         ebx,eax
 005F23DF    mov         eax,dword ptr [ebx+20];TKey.ScanCode:Integer
 005F23E2    mov         edx,eax
 005F23E4    cmp         edx,112
>005F23EA    jg          005F2491
>005F23F0    je          005F2858
 005F23F6    cmp         edx,106
>005F23FC    jg          005F244F
>005F23FE    je          005F2C31
 005F2404    cmp         edx,102
>005F240A    jg          005F2430
>005F240C    je          005F2D37
 005F2412    sub         edx,100
>005F2418    jb          005F2EA1
>005F241E    je          005F2A17
 005F2424    dec         edx
>005F2425    je          005F2C82
>005F242B    jmp         005F2F55
 005F2430    sub         edx,103
>005F2436    je          005F2DEC
 005F243C    dec         edx
>005F243D    je          005F2ACC
 005F2443    dec         edx
>005F2444    je          005F2BE0
>005F244A    jmp         005F2F55
 005F244F    add         edx,0FFFFFEF9
 005F2455    cmp         edx,0A
>005F2458    ja          005F2F55
 005F245E    jmp         dword ptr [edx*4+5F2465]
 005F245E    dd          005F2B77
 005F245E    dd          005F2655
 005F245E    dd          005F268A
 005F245E    dd          005F26BA
 005F245E    dd          005F2F55
 005F245E    dd          005F2F55
 005F245E    dd          005F2F55
 005F245E    dd          005F2F55
 005F245E    dd          005F2F55
 005F245E    dd          005F26E4
 005F245E    dd          005F26F9
 005F2491    add         edx,0FFFFFEED
 005F2497    cmp         edx,2D
>005F249A    ja          005F2F55
 005F24A0    jmp         dword ptr [edx*4+5F24A7]
 005F24A0    dd          005F292D
 005F24A0    dd          005F27AF
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2640
 005F24A0    dd          005F25E6
 005F24A0    dd          005F25FE
 005F24A0    dd          005F2616
 005F24A0    dd          005F262B
 005F24A0    dd          005F26D6
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F2F55
 005F24A0    dd          005F255F
 005F24A0    dd          005F257A
 005F24A0    dd          005F2595
 005F24A0    dd          005F25B0
 005F24A0    dd          005F25CB
 005F255F    movzx       eax,byte ptr ds:[816E91];gvar_00816E91
 005F2566    movsx       eax,al
 005F2569    mov         dword ptr [esp+8],eax
 005F256D    fild        dword ptr [esp+8]
 005F2571    fstp        qword ptr [esp]
 005F2574    wait
>005F2575    jmp         005F2F5E
 005F257A    movzx       eax,byte ptr ds:[816E90];gvar_00816E90
 005F2581    movsx       eax,al
 005F2584    mov         dword ptr [esp+8],eax
 005F2588    fild        dword ptr [esp+8]
 005F258C    fstp        qword ptr [esp]
 005F258F    wait
>005F2590    jmp         005F2F5E
 005F2595    movzx       eax,byte ptr ds:[816E92];gvar_00816E92
 005F259C    movsx       eax,al
 005F259F    mov         dword ptr [esp+8],eax
 005F25A3    fild        dword ptr [esp+8]
 005F25A7    fstp        qword ptr [esp]
 005F25AA    wait
>005F25AB    jmp         005F2F5E
 005F25B0    movzx       eax,byte ptr ds:[816E93];gvar_00816E93
 005F25B7    movsx       eax,al
 005F25BA    mov         dword ptr [esp+8],eax
 005F25BE    fild        dword ptr [esp+8]
 005F25C2    fstp        qword ptr [esp]
 005F25C5    wait
>005F25C6    jmp         005F2F5E
 005F25CB    movzx       eax,byte ptr ds:[816E94];gvar_00816E94
 005F25D2    movsx       eax,al
 005F25D5    mov         dword ptr [esp+8],eax
 005F25D9    fild        dword ptr [esp+8]
 005F25DD    fstp        qword ptr [esp]
 005F25E0    wait
>005F25E1    jmp         005F2F5E
 005F25E6    mov         eax,dword ptr ds:[816648];gvar_00816648:Double
 005F25EC    mov         dword ptr [esp],eax
 005F25EF    mov         eax,dword ptr ds:[81664C];gvar_0081664C
 005F25F5    mov         dword ptr [esp+4],eax
>005F25F9    jmp         005F2F5E
 005F25FE    mov         eax,dword ptr ds:[816640];gvar_00816640:Double
 005F2604    mov         dword ptr [esp],eax
 005F2607    mov         eax,dword ptr ds:[816644];gvar_00816644
 005F260D    mov         dword ptr [esp+4],eax
>005F2611    jmp         005F2F5E
 005F2616    movzx       eax,byte ptr ds:[816658];gvar_00816658:Boolean
 005F261D    call        00686074
 005F2622    fstp        qword ptr [esp]
 005F2625    wait
>005F2626    jmp         005F2F5E
 005F262B    movzx       eax,byte ptr ds:[816659];gvar_00816659:Boolean
 005F2632    call        00686074
 005F2637    fstp        qword ptr [esp]
 005F263A    wait
>005F263B    jmp         005F2F5E
 005F2640    movzx       eax,byte ptr ds:[81640C];gvar_0081640C:Boolean
 005F2647    call        00686074
 005F264C    fstp        qword ptr [esp]
 005F264F    wait
>005F2650    jmp         005F2F5E
 005F2655    mov         eax,[0078CE98];^gvar_008177F4
 005F265A    cmp         dword ptr [eax],1
>005F265D    jg          005F2671
 005F265F    xor         eax,eax
 005F2661    mov         dword ptr [esp],eax
 005F2664    mov         dword ptr [esp+4],3FF00000
>005F266C    jmp         005F2F5E
 005F2671    mov         eax,[0078CE98];^gvar_008177F4
 005F2676    mov         eax,dword ptr [eax]
 005F2678    dec         eax
 005F2679    mov         dword ptr [esp+8],eax
 005F267D    fild        dword ptr [esp+8]
 005F2681    fstp        qword ptr [esp]
 005F2684    wait
>005F2685    jmp         005F2F5E
 005F268A    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F268D    test        eax,eax
>005F268F    jg          005F26A1
 005F2691    mov         al,1
 005F2693    call        00686074
 005F2698    fstp        qword ptr [esp]
 005F269B    wait
>005F269C    jmp         005F2F5E
 005F26A1    mov         edx,dword ptr ds:[78CE98];^gvar_008177F4
 005F26A7    cmp         eax,dword ptr [edx]
 005F26A9    setl        al
 005F26AC    call        00686074
 005F26B1    fstp        qword ptr [esp]
 005F26B4    wait
>005F26B5    jmp         005F2F5E
 005F26BA    call        kernel32.GetOEMCP
 005F26BF    mov         dword ptr [esp+0C],eax
 005F26C3    xor         eax,eax
 005F26C5    mov         dword ptr [esp+10],eax
 005F26C9    fild        qword ptr [esp+0C]
 005F26CD    fstp        qword ptr [esp]
 005F26D0    wait
>005F26D1    jmp         005F2F5E
 005F26D6    xor         eax,eax
 005F26D8    mov         dword ptr [esp],eax
 005F26DB    mov         dword ptr [esp+4],eax
>005F26DF    jmp         005F2F5E
 005F26E4    movzx       eax,byte ptr ds:[8162F7];gvar_008162F7
 005F26EB    call        00686074
 005F26F0    fstp        qword ptr [esp]
 005F26F3    wait
>005F26F4    jmp         005F2F5E
 005F26F9    mov         esi,dword ptr [ebx+18];TKey................................................................
 005F26FC    test        esi,esi
>005F26FE    jge         005F2768
 005F2700    cmp         byte ptr [ebx+2C],1;TKey.FakeOrReal:TFakeness
>005F2704    je          005F272B
 005F2706    mov         esi,100
 005F270B    mov         eax,816304;gvar_00816304:Pointer
 005F2710    test        byte ptr [eax],80
>005F2713    jbe         005F2725
 005F2715    mov         al,1
 005F2717    call        00686074
 005F271C    fstp        qword ptr [esp]
 005F271F    wait
>005F2720    jmp         005F2F5E
 005F2725    inc         eax
 005F2726    dec         esi
>005F2727    jne         005F2710
>005F2729    jmp         005F2758
 005F272B    xor         esi,esi
 005F272D    mov         eax,esi
 005F272F    cmp         eax,0FF
>005F2734    ja          005F273D
 005F2736    bt          dword ptr ds:[816E70],eax;gvar_00816E70:Integer
>005F273D    jae         005F274F
 005F273F    mov         al,1
 005F2741    call        00686074
 005F2746    fstp        qword ptr [esp]
 005F2749    wait
>005F274A    jmp         005F2F5E
 005F274F    inc         esi
 005F2750    cmp         esi,100
>005F2756    jne         005F272D
 005F2758    xor         eax,eax
 005F275A    call        00686074
 005F275F    fstp        qword ptr [esp]
 005F2762    wait
>005F2763    jmp         005F2F5E
 005F2768    mov         eax,[0078CE98];^gvar_008177F4
 005F276D    cmp         esi,dword ptr [eax]
>005F276F    jl          005F2781
 005F2771    xor         eax,eax
 005F2773    call        00686074
 005F2778    fstp        qword ptr [esp]
 005F277B    wait
>005F277C    jmp         005F2F5E
 005F2781    mov         eax,esi
 005F2783    shl         eax,4
 005F2786    sub         eax,esi
 005F2788    mov         edx,dword ptr ds:[78CC38];^gvar_00817070
 005F278E    lea         eax,[edx+eax*8+4F]
 005F2792    mov         edx,5F2F68
 005F2797    mov         cl,20
 005F2799    call        @SetEq
 005F279E    setne       al
 005F27A1    call        00686074
 005F27A6    fstp        qword ptr [esp]
 005F27A9    wait
>005F27AA    jmp         005F2F5E
 005F27AF    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F27B2    test        eax,eax
>005F27B4    jge         005F27EE
 005F27B6    xor         esi,esi
 005F27B8    mov         eax,816304;gvar_00816304:Pointer
 005F27BD    test        byte ptr [eax],80
>005F27C0    jbe         005F27D2
 005F27C2    mov         eax,esi
 005F27C4    call        005F1B30
 005F27C9    fstp        qword ptr [esp]
 005F27CC    wait
>005F27CD    jmp         005F2F5E
 005F27D2    inc         esi
 005F27D3    inc         eax
 005F27D4    cmp         esi,100
>005F27DA    jne         005F27BD
 005F27DC    xor         eax,eax
 005F27DE    mov         dword ptr [esp],eax
 005F27E1    mov         dword ptr [esp+4],0BFF00000
>005F27E9    jmp         005F2F5E
 005F27EE    mov         edx,dword ptr ds:[78CE98];^gvar_008177F4
 005F27F4    cmp         eax,dword ptr [edx]
>005F27F6    jl          005F280A
 005F27F8    xor         eax,eax
 005F27FA    mov         dword ptr [esp],eax
 005F27FD    mov         dword ptr [esp+4],0BFF00000
>005F2805    jmp         005F2F5E
 005F280A    xor         esi,esi
 005F280C    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F280F    mov         edx,eax
 005F2811    shl         eax,4
 005F2814    sub         eax,edx
 005F2816    mov         edx,dword ptr ds:[78CC38];^gvar_00817070
 005F281C    mov         ecx,esi
 005F281E    cmp         ecx,0FF
>005F2824    ja          005F282B
 005F2826    bt          dword ptr [edx+eax*8+4F],ecx
>005F282B    jae         005F283D
 005F282D    mov         eax,esi
 005F282F    call        005F1B30
 005F2834    fstp        qword ptr [esp]
 005F2837    wait
>005F2838    jmp         005F2F5E
 005F283D    inc         esi
 005F283E    cmp         esi,100
>005F2844    jne         005F280C
 005F2846    xor         eax,eax
 005F2848    mov         dword ptr [esp],eax
 005F284B    mov         dword ptr [esp+4],0BFF00000
>005F2853    jmp         005F2F5E
 005F2858    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F285B    test        eax,eax
>005F285D    jge         005F28CA
 005F285F    cmp         byte ptr [ebx+2C],1;TKey.FakeOrReal:TFakeness
>005F2863    jne         005F2895
 005F2865    xor         esi,esi
 005F2867    mov         eax,esi
 005F2869    cmp         eax,0FF
>005F286E    ja          005F2877
 005F2870    bt          dword ptr ds:[816E70],eax;gvar_00816E70:Integer
>005F2877    jae         005F288A
 005F2879    mov         dword ptr [esp+8],esi
 005F287D    fild        dword ptr [esp+8]
 005F2881    fstp        qword ptr [esp]
 005F2884    wait
>005F2885    jmp         005F2F5E
 005F288A    inc         esi
 005F288B    cmp         esi,100
>005F2891    jne         005F2867
>005F2893    jmp         005F28BC
 005F2895    xor         esi,esi
 005F2897    mov         eax,816304;gvar_00816304:Pointer
 005F289C    test        byte ptr [eax],80
>005F289F    jbe         005F28B2
 005F28A1    mov         dword ptr [esp+8],esi
 005F28A5    fild        dword ptr [esp+8]
 005F28A9    fstp        qword ptr [esp]
 005F28AC    wait
>005F28AD    jmp         005F2F5E
 005F28B2    inc         esi
 005F28B3    inc         eax
 005F28B4    cmp         esi,100
>005F28BA    jne         005F289C
 005F28BC    xor         eax,eax
 005F28BE    mov         dword ptr [esp],eax
 005F28C1    mov         dword ptr [esp+4],eax
>005F28C5    jmp         005F2F5E
 005F28CA    mov         edx,dword ptr ds:[78CE98];^gvar_008177F4
 005F28D0    cmp         eax,dword ptr [edx]
>005F28D2    jl          005F28E2
 005F28D4    xor         eax,eax
 005F28D6    mov         dword ptr [esp],eax
 005F28D9    mov         dword ptr [esp+4],eax
>005F28DD    jmp         005F2F5E
 005F28E2    xor         esi,esi
 005F28E4    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F28E7    mov         edx,eax
 005F28E9    shl         eax,4
 005F28EC    sub         eax,edx
 005F28EE    mov         edx,dword ptr ds:[78CC38];^gvar_00817070
 005F28F4    mov         ecx,esi
 005F28F6    cmp         ecx,0FF
>005F28FC    ja          005F2903
 005F28FE    bt          dword ptr [edx+eax*8+4F],ecx
>005F2903    jae         005F2916
 005F2905    mov         dword ptr [esp+8],esi
 005F2909    fild        dword ptr [esp+8]
 005F290D    fstp        qword ptr [esp]
 005F2910    wait
>005F2911    jmp         005F2F5E
 005F2916    inc         esi
 005F2917    cmp         esi,100
>005F291D    jne         005F28E4
 005F291F    xor         eax,eax
 005F2921    mov         dword ptr [esp],eax
 005F2924    mov         dword ptr [esp+4],eax
>005F2928    jmp         005F2F5E
 005F292D    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F2930    test        eax,eax
>005F2932    jge         005F29AD
 005F2934    cmp         byte ptr [ebx+2C],1;TKey.FakeOrReal:TFakeness
>005F2938    jne         005F2971
 005F293A    xor         esi,esi
 005F293C    mov         eax,esi
 005F293E    cmp         eax,0FF
>005F2943    ja          005F294C
 005F2945    bt          dword ptr ds:[816E70],eax;gvar_00816E70:Integer
>005F294C    jae         005F2966
 005F294E    mov         eax,esi
 005F2950    call        005FCDC8
 005F2955    mov         dword ptr [esp+8],eax
 005F2959    fild        dword ptr [esp+8]
 005F295D    fstp        qword ptr [esp]
 005F2960    wait
>005F2961    jmp         005F2F5E
 005F2966    inc         esi
 005F2967    cmp         esi,100
>005F296D    jne         005F293C
>005F296F    jmp         005F299F
 005F2971    xor         esi,esi
 005F2973    mov         eax,816304;gvar_00816304:Pointer
 005F2978    test        byte ptr [eax],80
>005F297B    jbe         005F2995
 005F297D    mov         eax,esi
 005F297F    call        005FCDC8
 005F2984    mov         dword ptr [esp+8],eax
 005F2988    fild        dword ptr [esp+8]
 005F298C    fstp        qword ptr [esp]
 005F298F    wait
>005F2990    jmp         005F2F5E
 005F2995    inc         esi
 005F2996    inc         eax
 005F2997    cmp         esi,100
>005F299D    jne         005F2978
 005F299F    xor         eax,eax
 005F29A1    mov         dword ptr [esp],eax
 005F29A4    mov         dword ptr [esp+4],eax
>005F29A8    jmp         005F2F5E
 005F29AD    mov         edx,dword ptr ds:[78CE98];^gvar_008177F4
 005F29B3    cmp         eax,dword ptr [edx]
>005F29B5    jl          005F29C5
 005F29B7    xor         eax,eax
 005F29B9    mov         dword ptr [esp],eax
 005F29BC    mov         dword ptr [esp+4],eax
>005F29C0    jmp         005F2F5E
 005F29C5    xor         esi,esi
 005F29C7    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F29CA    mov         edx,eax
 005F29CC    shl         eax,4
 005F29CF    sub         eax,edx
 005F29D1    mov         edx,dword ptr ds:[78CC38];^gvar_00817070
 005F29D7    mov         ecx,esi
 005F29D9    cmp         ecx,0FF
>005F29DF    ja          005F29E6
 005F29E1    bt          dword ptr [edx+eax*8+4F],ecx
>005F29E6    jae         005F2A00
 005F29E8    mov         eax,esi
 005F29EA    call        005FCDC8
 005F29EF    mov         dword ptr [esp+8],eax
 005F29F3    fild        dword ptr [esp+8]
 005F29F7    fstp        qword ptr [esp]
 005F29FA    wait
>005F29FB    jmp         005F2F5E
 005F2A00    inc         esi
 005F2A01    cmp         esi,100
>005F2A07    jne         005F29C7
 005F2A09    xor         eax,eax
 005F2A0B    mov         dword ptr [esp],eax
 005F2A0E    mov         dword ptr [esp+4],eax
>005F2A12    jmp         005F2F5E
 005F2A17    cmp         byte ptr [ebx+2C],1;TKey.FakeOrReal:TFakeness
>005F2A1B    jne         005F2A43
 005F2A1D    test        byte ptr ds:[816E75],4;gvar_00816E75
>005F2A24    jne         005F2A33
 005F2A26    test        byte ptr ds:[816E76],40;gvar_00816E76
>005F2A2D    jne         005F2A33
 005F2A2F    xor         eax,eax
>005F2A31    jmp         005F2A35
 005F2A33    mov         al,1
 005F2A35    call        00686074
 005F2A3A    fstp        qword ptr [esp]
 005F2A3D    wait
>005F2A3E    jmp         005F2F5E
 005F2A43    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F2A46    test        eax,eax
>005F2A48    jge         005F2A70
 005F2A4A    test        byte ptr ds:[81632E],80;gvar_0081632E
>005F2A51    ja          005F2A60
 005F2A53    test        byte ptr ds:[81633A],80;gvar_0081633A
>005F2A5A    ja          005F2A60
 005F2A5C    xor         eax,eax
>005F2A5E    jmp         005F2A62
 005F2A60    mov         al,1
 005F2A62    call        00686074
 005F2A67    fstp        qword ptr [esp]
 005F2A6A    wait
>005F2A6B    jmp         005F2F5E
 005F2A70    mov         edx,dword ptr ds:[78CE98];^gvar_008177F4
 005F2A76    cmp         eax,dword ptr [edx]
>005F2A78    jl          005F2A8A
 005F2A7A    xor         eax,eax
 005F2A7C    call        00686074
 005F2A81    fstp        qword ptr [esp]
 005F2A84    wait
>005F2A85    jmp         005F2F5E
 005F2A8A    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F2A8D    mov         edx,eax
 005F2A8F    shl         eax,4
 005F2A92    sub         eax,edx
 005F2A94    mov         edx,dword ptr ds:[78CC38];^gvar_00817070
 005F2A9A    test        byte ptr [edx+eax*8+54],4
>005F2A9F    jne         005F2ABC
 005F2AA1    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F2AA4    mov         edx,eax
 005F2AA6    shl         eax,4
 005F2AA9    sub         eax,edx
 005F2AAB    mov         edx,dword ptr ds:[78CC38];^gvar_00817070
 005F2AB1    test        byte ptr [edx+eax*8+55],40
>005F2AB6    jne         005F2ABC
 005F2AB8    xor         eax,eax
>005F2ABA    jmp         005F2ABE
 005F2ABC    mov         al,1
 005F2ABE    call        00686074
 005F2AC3    fstp        qword ptr [esp]
 005F2AC6    wait
>005F2AC7    jmp         005F2F5E
 005F2ACC    cmp         byte ptr [ebx+2C],1;TKey.FakeOrReal:TFakeness
>005F2AD0    jne         005F2AF8
 005F2AD2    test        byte ptr ds:[816E85],4;gvar_00816E85
>005F2AD9    jne         005F2AE8
 005F2ADB    test        byte ptr ds:[816E86],40;gvar_00816E86
>005F2AE2    jne         005F2AE8
 005F2AE4    xor         eax,eax
>005F2AE6    jmp         005F2AEA
 005F2AE8    mov         al,1
 005F2AEA    call        00686074
 005F2AEF    fstp        qword ptr [esp]
 005F2AF2    wait
>005F2AF3    jmp         005F2F5E
 005F2AF8    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F2AFB    test        eax,eax
>005F2AFD    jge         005F2B25
 005F2AFF    test        byte ptr ds:[8163AE],80;gvar_008163AE
>005F2B06    ja          005F2B15
 005F2B08    test        byte ptr ds:[8163BA],80;gvar_008163BA
>005F2B0F    ja          005F2B15
 005F2B11    xor         eax,eax
>005F2B13    jmp         005F2B17
 005F2B15    mov         al,1
 005F2B17    call        00686074
 005F2B1C    fstp        qword ptr [esp]
 005F2B1F    wait
>005F2B20    jmp         005F2F5E
 005F2B25    mov         edx,dword ptr ds:[78CE98];^gvar_008177F4
 005F2B2B    cmp         eax,dword ptr [edx]
>005F2B2D    jl          005F2B3F
 005F2B2F    xor         eax,eax
 005F2B31    call        00686074
 005F2B36    fstp        qword ptr [esp]
 005F2B39    wait
>005F2B3A    jmp         005F2F5E
 005F2B3F    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F2B42    mov         edx,eax
 005F2B44    shl         eax,4
 005F2B47    sub         eax,edx
 005F2B49    mov         edx,dword ptr ds:[78CC38];^gvar_00817070
 005F2B4F    cmp         byte ptr [edx+eax*8+4],0
>005F2B54    jne         005F2B67
 005F2B56    mov         edx,dword ptr ds:[78CC38];^gvar_00817070
 005F2B5C    cmp         byte ptr [edx+eax*8+5],0
>005F2B61    jne         005F2B67
 005F2B63    xor         eax,eax
>005F2B65    jmp         005F2B69
 005F2B67    mov         al,1
 005F2B69    call        00686074
 005F2B6E    fstp        qword ptr [esp]
 005F2B71    wait
>005F2B72    jmp         005F2F5E
 005F2B77    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F2B7A    test        eax,eax
>005F2B7C    jge         005F2B8E
 005F2B7E    xor         eax,eax
 005F2B80    call        00686074
 005F2B85    fstp        qword ptr [esp]
 005F2B88    wait
>005F2B89    jmp         005F2F5E
 005F2B8E    mov         edx,dword ptr ds:[78CE98];^gvar_008177F4
 005F2B94    cmp         eax,dword ptr [edx]
>005F2B96    jl          005F2BA8
 005F2B98    xor         eax,eax
 005F2B9A    call        00686074
 005F2B9F    fstp        qword ptr [esp]
 005F2BA2    wait
>005F2BA3    jmp         005F2F5E
 005F2BA8    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F2BAB    mov         edx,eax
 005F2BAD    shl         eax,4
 005F2BB0    sub         eax,edx
 005F2BB2    mov         edx,dword ptr ds:[78CC38];^gvar_00817070
 005F2BB8    cmp         byte ptr [edx+eax*8+6],0
>005F2BBD    jne         005F2BD0
 005F2BBF    mov         edx,dword ptr ds:[78CC38];^gvar_00817070
 005F2BC5    cmp         byte ptr [edx+eax*8+7],0
>005F2BCA    jne         005F2BD0
 005F2BCC    xor         eax,eax
>005F2BCE    jmp         005F2BD2
 005F2BD0    mov         al,1
 005F2BD2    call        00686074
 005F2BD7    fstp        qword ptr [esp]
 005F2BDA    wait
>005F2BDB    jmp         005F2F5E
 005F2BE0    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F2BE3    test        eax,eax
>005F2BE5    jge         005F2BF7
 005F2BE7    xor         eax,eax
 005F2BE9    call        00686074
 005F2BEE    fstp        qword ptr [esp]
 005F2BF1    wait
>005F2BF2    jmp         005F2F5E
 005F2BF7    mov         edx,dword ptr ds:[78CE98];^gvar_008177F4
 005F2BFD    cmp         eax,dword ptr [edx]
>005F2BFF    jl          005F2C11
 005F2C01    xor         eax,eax
 005F2C03    call        00686074
 005F2C08    fstp        qword ptr [esp]
 005F2C0B    wait
>005F2C0C    jmp         005F2F5E
 005F2C11    mov         edx,eax
 005F2C13    shl         eax,4
 005F2C16    sub         eax,edx
 005F2C18    mov         edx,dword ptr ds:[78CC38];^gvar_00817070
 005F2C1E    movzx       eax,byte ptr [edx+eax*8+6]
 005F2C23    call        00686074
 005F2C28    fstp        qword ptr [esp]
 005F2C2B    wait
>005F2C2C    jmp         005F2F5E
 005F2C31    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F2C34    test        eax,eax
>005F2C36    jge         005F2C48
 005F2C38    xor         eax,eax
 005F2C3A    call        00686074
 005F2C3F    fstp        qword ptr [esp]
 005F2C42    wait
>005F2C43    jmp         005F2F5E
 005F2C48    mov         edx,dword ptr ds:[78CE98];^gvar_008177F4
 005F2C4E    cmp         eax,dword ptr [edx]
>005F2C50    jl          005F2C62
 005F2C52    xor         eax,eax
 005F2C54    call        00686074
 005F2C59    fstp        qword ptr [esp]
 005F2C5C    wait
>005F2C5D    jmp         005F2F5E
 005F2C62    mov         edx,eax
 005F2C64    shl         eax,4
 005F2C67    sub         eax,edx
 005F2C69    mov         edx,dword ptr ds:[78CC38];^gvar_00817070
 005F2C6F    movzx       eax,byte ptr [edx+eax*8+7]
 005F2C74    call        00686074
 005F2C79    fstp        qword ptr [esp]
 005F2C7C    wait
>005F2C7D    jmp         005F2F5E
 005F2C82    cmp         byte ptr [ebx+2C],1;TKey.FakeOrReal:TFakeness
>005F2C86    jne         005F2CAE
 005F2C88    test        byte ptr ds:[816E73],20;gvar_00816E73
>005F2C8F    jne         005F2C9E
 005F2C91    test        byte ptr ds:[816E83],20;gvar_00816E83
>005F2C98    jne         005F2C9E
 005F2C9A    xor         eax,eax
>005F2C9C    jmp         005F2CA0
 005F2C9E    mov         al,1
 005F2CA0    call        00686074
 005F2CA5    fstp        qword ptr [esp]
 005F2CA8    wait
>005F2CA9    jmp         005F2F5E
 005F2CAE    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F2CB1    test        eax,eax
>005F2CB3    jge         005F2CDB
 005F2CB5    test        byte ptr ds:[816321],80;gvar_00816321
>005F2CBC    ja          005F2CCB
 005F2CBE    test        byte ptr ds:[8163A1],80;gvar_008163A1
>005F2CC5    ja          005F2CCB
 005F2CC7    xor         eax,eax
>005F2CC9    jmp         005F2CCD
 005F2CCB    mov         al,1
 005F2CCD    call        00686074
 005F2CD2    fstp        qword ptr [esp]
 005F2CD5    wait
>005F2CD6    jmp         005F2F5E
 005F2CDB    mov         edx,dword ptr ds:[78CE98];^gvar_008177F4
 005F2CE1    cmp         eax,dword ptr [edx]
>005F2CE3    jl          005F2CF5
 005F2CE5    xor         eax,eax
 005F2CE7    call        00686074
 005F2CEC    fstp        qword ptr [esp]
 005F2CEF    wait
>005F2CF0    jmp         005F2F5E
 005F2CF5    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F2CF8    mov         edx,eax
 005F2CFA    shl         eax,4
 005F2CFD    sub         eax,edx
 005F2CFF    mov         edx,dword ptr ds:[78CC38];^gvar_00817070
 005F2D05    test        byte ptr [edx+eax*8+52],20
>005F2D0A    jne         005F2D27
 005F2D0C    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F2D0F    mov         edx,eax
 005F2D11    shl         eax,4
 005F2D14    sub         eax,edx
 005F2D16    mov         edx,dword ptr ds:[78CC38];^gvar_00817070
 005F2D1C    test        byte ptr [edx+eax*8+62],20
>005F2D21    jne         005F2D27
 005F2D23    xor         eax,eax
>005F2D25    jmp         005F2D29
 005F2D27    mov         al,1
 005F2D29    call        00686074
 005F2D2E    fstp        qword ptr [esp]
 005F2D31    wait
>005F2D32    jmp         005F2F5E
 005F2D37    cmp         byte ptr [ebx+2C],1;TKey.FakeOrReal:TFakeness
>005F2D3B    jne         005F2D63
 005F2D3D    test        byte ptr ds:[816E77],1;gvar_00816E77
>005F2D44    jne         005F2D53
 005F2D46    test        byte ptr ds:[816E87],1;gvar_00816E87
>005F2D4D    jne         005F2D53
 005F2D4F    xor         eax,eax
>005F2D51    jmp         005F2D55
 005F2D53    mov         al,1
 005F2D55    call        00686074
 005F2D5A    fstp        qword ptr [esp]
 005F2D5D    wait
>005F2D5E    jmp         005F2F5E
 005F2D63    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F2D66    test        eax,eax
>005F2D68    jge         005F2D90
 005F2D6A    test        byte ptr ds:[81633C],80;gvar_0081633C
>005F2D71    ja          005F2D80
 005F2D73    test        byte ptr ds:[8163BC],80;gvar_008163BC
>005F2D7A    ja          005F2D80
 005F2D7C    xor         eax,eax
>005F2D7E    jmp         005F2D82
 005F2D80    mov         al,1
 005F2D82    call        00686074
 005F2D87    fstp        qword ptr [esp]
 005F2D8A    wait
>005F2D8B    jmp         005F2F5E
 005F2D90    mov         edx,dword ptr ds:[78CE98];^gvar_008177F4
 005F2D96    cmp         eax,dword ptr [edx]
>005F2D98    jl          005F2DAA
 005F2D9A    xor         eax,eax
 005F2D9C    call        00686074
 005F2DA1    fstp        qword ptr [esp]
 005F2DA4    wait
>005F2DA5    jmp         005F2F5E
 005F2DAA    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F2DAD    mov         edx,eax
 005F2DAF    shl         eax,4
 005F2DB2    sub         eax,edx
 005F2DB4    mov         edx,dword ptr ds:[78CC38];^gvar_00817070
 005F2DBA    test        byte ptr [edx+eax*8+56],1
>005F2DBF    jne         005F2DDC
 005F2DC1    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F2DC4    mov         edx,eax
 005F2DC6    shl         eax,4
 005F2DC9    sub         eax,edx
 005F2DCB    mov         edx,dword ptr ds:[78CC38];^gvar_00817070
 005F2DD1    test        byte ptr [edx+eax*8+66],1
>005F2DD6    jne         005F2DDC
 005F2DD8    xor         eax,eax
>005F2DDA    jmp         005F2DDE
 005F2DDC    mov         al,1
 005F2DDE    call        00686074
 005F2DE3    fstp        qword ptr [esp]
 005F2DE6    wait
>005F2DE7    jmp         005F2F5E
 005F2DEC    cmp         byte ptr [ebx+2C],1;TKey.FakeOrReal:TFakeness
>005F2DF0    jne         005F2E18
 005F2DF2    test        byte ptr ds:[816E8B],8;gvar_00816E8B
>005F2DF9    jne         005F2E08
 005F2DFB    test        byte ptr ds:[816E8B],10;gvar_00816E8B
>005F2E02    jne         005F2E08
 005F2E04    xor         eax,eax
>005F2E06    jmp         005F2E0A
 005F2E08    mov         al,1
 005F2E0A    call        00686074
 005F2E0F    fstp        qword ptr [esp]
 005F2E12    wait
>005F2E13    jmp         005F2F5E
 005F2E18    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F2E1B    test        eax,eax
>005F2E1D    jge         005F2E45
 005F2E1F    test        byte ptr ds:[8163DF],80;gvar_008163DF
>005F2E26    ja          005F2E35
 005F2E28    test        byte ptr ds:[8163E0],80;gvar_008163E0
>005F2E2F    ja          005F2E35
 005F2E31    xor         eax,eax
>005F2E33    jmp         005F2E37
 005F2E35    mov         al,1
 005F2E37    call        00686074
 005F2E3C    fstp        qword ptr [esp]
 005F2E3F    wait
>005F2E40    jmp         005F2F5E
 005F2E45    mov         edx,dword ptr ds:[78CE98];^gvar_008177F4
 005F2E4B    cmp         eax,dword ptr [edx]
>005F2E4D    jl          005F2E5F
 005F2E4F    xor         eax,eax
 005F2E51    call        00686074
 005F2E56    fstp        qword ptr [esp]
 005F2E59    wait
>005F2E5A    jmp         005F2F5E
 005F2E5F    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F2E62    mov         edx,eax
 005F2E64    shl         eax,4
 005F2E67    sub         eax,edx
 005F2E69    mov         edx,dword ptr ds:[78CC38];^gvar_00817070
 005F2E6F    test        byte ptr [edx+eax*8+6A],8
>005F2E74    jne         005F2E91
 005F2E76    mov         eax,dword ptr [ebx+18];TKey................................................................
 005F2E79    mov         edx,eax
 005F2E7B    shl         eax,4
 005F2E7E    sub         eax,edx
 005F2E80    mov         edx,dword ptr ds:[78CC38];^gvar_00817070
 005F2E86    test        byte ptr [edx+eax*8+6A],10
>005F2E8B    jne         005F2E91
 005F2E8D    xor         eax,eax
>005F2E8F    jmp         005F2E93
 005F2E91    mov         al,1
 005F2E93    call        00686074
 005F2E98    fstp        qword ptr [esp]
 005F2E9B    wait
>005F2E9C    jmp         005F2F5E
 005F2EA1    movzx       edx,byte ptr [ebx+2C];TKey.FakeOrReal:TFakeness
 005F2EA5    cmp         dl,1
>005F2EA8    jne         005F2EC9
 005F2EAA    cmp         eax,0FF
>005F2EAF    ja          005F2EB8
 005F2EB1    bt          dword ptr ds:[816E70],eax;gvar_00816E70:Integer
 005F2EB8    setb        al
 005F2EBB    call        00686074
 005F2EC0    fstp        qword ptr [esp]
 005F2EC3    wait
>005F2EC4    jmp         005F2F5E
 005F2EC9    mov         esi,dword ptr [ebx+18];TKey................................................................
 005F2ECC    test        esi,esi
>005F2ECE    jge         005F2F17
 005F2ED0    cmp         dl,2
>005F2ED3    jne         005F2F02
 005F2ED5    mov         eax,dword ptr [ebx+20];TKey.ScanCode:Integer
 005F2ED8    test        byte ptr [eax+816304],80;gvar_00816304:Pointer
>005F2EDF    jbe         005F2EF1
 005F2EE1    cmp         eax,0FF
>005F2EE6    ja          005F2EEF
 005F2EE8    bt          dword ptr ds:[816E70],eax;gvar_00816E70:Integer
>005F2EEF    jae         005F2EF5
 005F2EF1    xor         eax,eax
>005F2EF3    jmp         005F2EF7
 005F2EF5    mov         al,1
 005F2EF7    call        00686074
 005F2EFC    fstp        qword ptr [esp]
 005F2EFF    wait
>005F2F00    jmp         005F2F5E
 005F2F02    test        byte ptr [eax+816304],80;gvar_00816304:Pointer
 005F2F09    seta        al
 005F2F0C    call        00686074
 005F2F11    fstp        qword ptr [esp]
 005F2F14    wait
>005F2F15    jmp         005F2F5E
 005F2F17    mov         edx,dword ptr ds:[78CE98];^gvar_008177F4
 005F2F1D    cmp         esi,dword ptr [edx]
>005F2F1F    jl          005F2F2C
 005F2F21    xor         eax,eax
 005F2F23    mov         dword ptr [esp],eax
 005F2F26    mov         dword ptr [esp+4],eax
>005F2F2A    jmp         005F2F5E
 005F2F2C    mov         edx,esi
 005F2F2E    shl         edx,4
 005F2F31    sub         edx,esi
 005F2F33    mov         ecx,dword ptr ds:[78CC38];^gvar_00817070
 005F2F39    lea         ecx,[ecx+edx*8+4F]
 005F2F3D    cmp         eax,0FF
>005F2F42    ja          005F2F47
 005F2F44    bt          dword ptr [ecx],eax
 005F2F47    setb        al
 005F2F4A    call        00686074
 005F2F4F    fstp        qword ptr [esp]
 005F2F52    wait
>005F2F53    jmp         005F2F5E
 005F2F55    xor         eax,eax
 005F2F57    mov         dword ptr [esp],eax
 005F2F5A    mov         dword ptr [esp+4],eax
 005F2F5E    fld         qword ptr [esp]
 005F2F61    add         esp,14
 005F2F64    pop         esi
 005F2F65    pop         ebx
 005F2F66    ret
*}
end;

//005F2F88
procedure TKey.GetVector(x:Double; y:Double; z:Double);
begin
{*
 005F2F88    push        ebp
 005F2F89    mov         ebp,esp
 005F2F8B    add         esp,0FFFFFFF8
 005F2F8E    push        ebx
 005F2F8F    push        esi
 005F2F90    mov         dword ptr [ebp-4],ecx
 005F2F93    mov         ecx,dword ptr [ebp+8]
 005F2F96    xor         ebx,ebx
 005F2F98    mov         dword ptr [ecx],ebx
 005F2F9A    mov         dword ptr [ecx+4],ebx
 005F2F9D    mov         ebx,dword ptr [eax+20];TKey.ScanCode:Integer
 005F2FA0    sub         ebx,11D
>005F2FA6    je          005F2FBB
 005F2FA8    dec         ebx
>005F2FA9    je          005F30C2
 005F2FAF    dec         ebx
>005F2FB0    je          005F31C9
>005F2FB6    jmp         005F32CD
 005F2FBB    cmp         dword ptr [eax+18],0;TKey..................................................................
>005F2FBF    jge         005F3013
 005F2FC1    test        byte ptr ds:[8163D1],80;gvar_008163D1
 005F2FC8    seta        al
 005F2FCB    and         eax,7F
 005F2FCE    test        byte ptr ds:[8163CF],80;gvar_008163CF
 005F2FD5    seta        cl
 005F2FD8    and         ecx,7F
 005F2FDB    sub         eax,ecx
 005F2FDD    mov         dword ptr [ebp-8],eax
 005F2FE0    fild        dword ptr [ebp-8]
 005F2FE3    fstp        qword ptr [edx]
 005F2FE5    wait
 005F2FE6    test        byte ptr ds:[8163D4],80;gvar_008163D4
 005F2FED    seta        al
 005F2FF0    and         eax,7F
 005F2FF3    test        byte ptr ds:[8163CC],80;gvar_008163CC
 005F2FFA    seta        dl
 005F2FFD    and         edx,7F
 005F3000    sub         eax,edx
 005F3002    mov         dword ptr [ebp-8],eax
 005F3005    fild        dword ptr [ebp-8]
 005F3008    mov         eax,dword ptr [ebp-4]
 005F300B    fstp        qword ptr [eax]
 005F300D    wait
>005F300E    jmp         005F32D6
 005F3013    mov         ecx,dword ptr ds:[78CE98];^gvar_008177F4
 005F3019    mov         ecx,dword ptr [ecx]
 005F301B    cmp         ecx,dword ptr [eax+18];TKey................................................................
>005F301E    jg          005F3036
 005F3020    xor         eax,eax
 005F3022    mov         dword ptr [edx],eax
 005F3024    mov         dword ptr [edx+4],eax
 005F3027    mov         eax,dword ptr [ebp-4]
 005F302A    xor         edx,edx
 005F302C    mov         dword ptr [eax],edx
 005F302E    mov         dword ptr [eax+4],edx
>005F3031    jmp         005F32D6
 005F3036    mov         ecx,dword ptr [eax+18];TKey................................................................
 005F3039    mov         ebx,ecx
 005F303B    shl         ecx,4
 005F303E    sub         ecx,ebx
 005F3040    mov         ebx,dword ptr ds:[78CC38];^gvar_00817070
 005F3046    test        byte ptr [ebx+ecx*8+68],20
 005F304B    setne       cl
 005F304E    mov         esi,ecx
 005F3050    and         esi,7F
 005F3053    mov         ecx,dword ptr [eax+18];TKey................................................................
 005F3056    mov         ebx,ecx
 005F3058    shl         ecx,4
 005F305B    sub         ecx,ebx
 005F305D    mov         ebx,dword ptr ds:[78CC38];^gvar_00817070
 005F3063    test        byte ptr [ebx+ecx*8+68],8
 005F3068    setne       cl
 005F306B    and         ecx,7F
 005F306E    sub         esi,ecx
 005F3070    mov         dword ptr [ebp-8],esi
 005F3073    fild        dword ptr [ebp-8]
 005F3076    fstp        qword ptr [edx]
 005F3078    wait
 005F3079    mov         edx,dword ptr [eax+18];TKey................................................................
 005F307C    mov         ecx,edx
 005F307E    shl         edx,4
 005F3081    sub         edx,ecx
 005F3083    mov         ecx,dword ptr ds:[78CC38];^gvar_00817070
 005F3089    test        byte ptr [ecx+edx*8+69],1
 005F308E    setne       dl
 005F3091    and         edx,7F
 005F3094    mov         eax,dword ptr [eax+18];TKey................................................................
 005F3097    mov         ecx,eax
 005F3099    shl         eax,4
 005F309C    sub         eax,ecx
 005F309E    mov         ecx,dword ptr ds:[78CC38];^gvar_00817070
 005F30A4    test        byte ptr [ecx+eax*8+68],1
 005F30A9    setne       al
 005F30AC    and         eax,7F
 005F30AF    sub         edx,eax
 005F30B1    mov         dword ptr [ebp-8],edx
 005F30B4    fild        dword ptr [ebp-8]
 005F30B7    mov         eax,dword ptr [ebp-4]
 005F30BA    fstp        qword ptr [eax]
 005F30BC    wait
>005F30BD    jmp         005F32D6
 005F30C2    cmp         dword ptr [eax+18],0;TKey..................................................................
>005F30C6    jge         005F311A
 005F30C8    test        byte ptr ds:[816324],80;gvar_00816324
 005F30CF    seta        al
 005F30D2    and         eax,7F
 005F30D5    test        byte ptr ds:[816322],80;gvar_00816322
 005F30DC    seta        cl
 005F30DF    and         ecx,7F
 005F30E2    sub         eax,ecx
 005F30E4    mov         dword ptr [ebp-8],eax
 005F30E7    fild        dword ptr [ebp-8]
 005F30EA    fstp        qword ptr [edx]
 005F30EC    wait
 005F30ED    test        byte ptr ds:[816323],80;gvar_00816323
 005F30F4    seta        al
 005F30F7    and         eax,7F
 005F30FA    test        byte ptr ds:[816315],80;gvar_00816315
 005F3101    seta        dl
 005F3104    and         edx,7F
 005F3107    sub         eax,edx
 005F3109    mov         dword ptr [ebp-8],eax
 005F310C    fild        dword ptr [ebp-8]
 005F310F    mov         eax,dword ptr [ebp-4]
 005F3112    fstp        qword ptr [eax]
 005F3114    wait
>005F3115    jmp         005F32D6
 005F311A    mov         ecx,dword ptr ds:[78CE98];^gvar_008177F4
 005F3120    mov         ecx,dword ptr [ecx]
 005F3122    cmp         ecx,dword ptr [eax+18];TKey................................................................
>005F3125    jg          005F313D
 005F3127    xor         eax,eax
 005F3129    mov         dword ptr [edx],eax
 005F312B    mov         dword ptr [edx+4],eax
 005F312E    mov         eax,dword ptr [ebp-4]
 005F3131    xor         edx,edx
 005F3133    mov         dword ptr [eax],edx
 005F3135    mov         dword ptr [eax+4],edx
>005F3138    jmp         005F32D6
 005F313D    mov         ecx,dword ptr [eax+18];TKey................................................................
 005F3140    mov         ebx,ecx
 005F3142    shl         ecx,4
 005F3145    sub         ecx,ebx
 005F3147    mov         ebx,dword ptr ds:[78CC38];^gvar_00817070
 005F314D    test        byte ptr [ebx+ecx*8+53],1
 005F3152    setne       cl
 005F3155    mov         esi,ecx
 005F3157    and         esi,7F
 005F315A    mov         ecx,dword ptr [eax+18];TKey................................................................
 005F315D    mov         ebx,ecx
 005F315F    shl         ecx,4
 005F3162    sub         ecx,ebx
 005F3164    mov         ebx,dword ptr ds:[78CC38];^gvar_00817070
 005F316A    test        byte ptr [ebx+ecx*8+52],40
 005F316F    setne       cl
 005F3172    and         ecx,7F
 005F3175    sub         esi,ecx
 005F3177    mov         dword ptr [ebp-8],esi
 005F317A    fild        dword ptr [ebp-8]
 005F317D    fstp        qword ptr [edx]
 005F317F    wait
 005F3180    mov         edx,dword ptr [eax+18];TKey................................................................
 005F3183    mov         ecx,edx
 005F3185    shl         edx,4
 005F3188    sub         edx,ecx
 005F318A    mov         ecx,dword ptr ds:[78CC38];^gvar_00817070
 005F3190    test        byte ptr [ecx+edx*8+52],80
 005F3195    setne       dl
 005F3198    and         edx,7F
 005F319B    mov         eax,dword ptr [eax+18];TKey................................................................
 005F319E    mov         ecx,eax
 005F31A0    shl         eax,4
 005F31A3    sub         eax,ecx
 005F31A5    mov         ecx,dword ptr ds:[78CC38];^gvar_00817070
 005F31AB    test        byte ptr [ecx+eax*8+51],2
 005F31B0    setne       al
 005F31B3    and         eax,7F
 005F31B6    sub         edx,eax
 005F31B8    mov         dword ptr [ebp-8],edx
 005F31BB    fild        dword ptr [ebp-8]
 005F31BE    mov         eax,dword ptr [ebp-4]
 005F31C1    fstp        qword ptr [eax]
 005F31C3    wait
>005F31C4    jmp         005F32D6
 005F31C9    cmp         dword ptr [eax+18],0;TKey..................................................................
>005F31CD    jge         005F3221
 005F31CF    test        byte ptr ds:[816351],80;gvar_00816351
 005F31D6    seta        al
 005F31D9    and         eax,7F
 005F31DC    test        byte ptr ds:[81634F],80;gvar_0081634F
 005F31E3    seta        cl
 005F31E6    and         ecx,7F
 005F31E9    sub         eax,ecx
 005F31EB    mov         dword ptr [ebp-8],eax
 005F31EE    fild        dword ptr [ebp-8]
 005F31F1    fstp        qword ptr [edx]
 005F31F3    wait
 005F31F4    test        byte ptr ds:[816354],80;gvar_00816354
 005F31FB    seta        al
 005F31FE    and         eax,7F
 005F3201    test        byte ptr ds:[81634C],80;gvar_0081634C
 005F3208    seta        dl
 005F320B    and         edx,7F
 005F320E    sub         eax,edx
 005F3210    mov         dword ptr [ebp-8],eax
 005F3213    fild        dword ptr [ebp-8]
 005F3216    mov         eax,dword ptr [ebp-4]
 005F3219    fstp        qword ptr [eax]
 005F321B    wait
>005F321C    jmp         005F32D6
 005F3221    mov         ecx,dword ptr ds:[78CE98];^gvar_008177F4
 005F3227    mov         ecx,dword ptr [ecx]
 005F3229    cmp         ecx,dword ptr [eax+18];TKey................................................................
>005F322C    jg          005F3244
 005F322E    xor         eax,eax
 005F3230    mov         dword ptr [edx],eax
 005F3232    mov         dword ptr [edx+4],eax
 005F3235    mov         eax,dword ptr [ebp-4]
 005F3238    xor         edx,edx
 005F323A    mov         dword ptr [eax],edx
 005F323C    mov         dword ptr [eax+4],edx
>005F323F    jmp         005F32D6
 005F3244    mov         ecx,dword ptr [eax+18];TKey................................................................
 005F3247    mov         ebx,ecx
 005F3249    shl         ecx,4
 005F324C    sub         ecx,ebx
 005F324E    mov         ebx,dword ptr ds:[78CC38];^gvar_00817070
 005F3254    test        byte ptr [ebx+ecx*8+58],20
 005F3259    setne       cl
 005F325C    mov         esi,ecx
 005F325E    and         esi,7F
 005F3261    mov         ecx,dword ptr [eax+18];TKey................................................................
 005F3264    mov         ebx,ecx
 005F3266    shl         ecx,4
 005F3269    sub         ecx,ebx
 005F326B    mov         ebx,dword ptr ds:[78CC38];^gvar_00817070
 005F3271    test        byte ptr [ebx+ecx*8+58],8
 005F3276    setne       cl
 005F3279    and         ecx,7F
 005F327C    sub         esi,ecx
 005F327E    mov         dword ptr [ebp-8],esi
 005F3281    fild        dword ptr [ebp-8]
 005F3284    fstp        qword ptr [edx]
 005F3286    wait
 005F3287    mov         edx,dword ptr [eax+18];TKey................................................................
 005F328A    mov         ecx,edx
 005F328C    shl         edx,4
 005F328F    sub         edx,ecx
 005F3291    mov         ecx,dword ptr ds:[78CC38];^gvar_00817070
 005F3297    test        byte ptr [ecx+edx*8+59],1
 005F329C    setne       dl
 005F329F    and         edx,7F
 005F32A2    mov         eax,dword ptr [eax+18];TKey................................................................
 005F32A5    mov         ecx,eax
 005F32A7    shl         eax,4
 005F32AA    sub         eax,ecx
 005F32AC    mov         ecx,dword ptr ds:[78CC38];^gvar_00817070
 005F32B2    test        byte ptr [ecx+eax*8+58],1
 005F32B7    setne       al
 005F32BA    and         eax,7F
 005F32BD    sub         edx,eax
 005F32BF    mov         dword ptr [ebp-8],edx
 005F32C2    fild        dword ptr [ebp-8]
 005F32C5    mov         eax,dword ptr [ebp-4]
 005F32C8    fstp        qword ptr [eax]
 005F32CA    wait
>005F32CB    jmp         005F32D6
 005F32CD    push        ecx
 005F32CE    mov         ecx,dword ptr [ebp-4]
 005F32D1    call        TExpression.GetVector
 005F32D6    pop         esi
 005F32D7    pop         ebx
 005F32D8    pop         ecx
 005F32D9    pop         ecx
 005F32DA    pop         ebp
 005F32DB    ret         4
*}
end;

//005F32E0
function TKey.Module:TObject;
begin
{*
 005F32E0    mov         eax,[00816300];gvar_00816300:TModuleKeyboard
 005F32E5    ret
*}
end;

//005F32E8
procedure sub_005F32E8(?:Integer);
begin
{*
 005F32E8    push        ebx
 005F32E9    push        esi
 005F32EA    add         esp,0FFFFFFE4
 005F32ED    mov         esi,eax
 005F32EF    mov         dword ptr [esp],1
 005F32F6    call        005FCDA0
 005F32FB    test        al,al
>005F32FD    je          005F3321
 005F32FF    mov         word ptr [esp+4],0
 005F3306    mov         eax,esi
 005F3308    call        0060058C
 005F330D    and         al,7F
 005F330F    movzx       eax,al
 005F3312    mov         word ptr [esp+6],ax
 005F3317    mov         dword ptr [esp+8],8
>005F331F    jmp         005F3344
 005F3321    mov         eax,esi
 005F3323    call        005FCDC8
 005F3328    mov         word ptr [esp+4],ax
 005F332D    mov         eax,esi
 005F332F    call        0060058C
 005F3334    and         al,7F
 005F3336    movzx       eax,al
 005F3339    mov         word ptr [esp+6],ax
 005F333E    xor         eax,eax
 005F3340    mov         dword ptr [esp+8],eax
 005F3344    xor         eax,eax
 005F3346    mov         dword ptr [esp+0C],eax
 005F334A    xor         eax,eax
 005F334C    mov         dword ptr [esp+10],eax
 005F3350    mov         eax,esi
 005F3352    call        0060058C
 005F3357    cmp         al,80
>005F3359    jb          005F3360
 005F335B    or          dword ptr [esp+8],1
 005F3360    push        1C
 005F3362    lea         eax,[esp+4]
 005F3366    push        eax
 005F3367    push        1
 005F3369    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005F336E    mov         eax,dword ptr [eax]
 005F3370    call        eax
 005F3372    dec         eax
 005F3373    sete        bl
 005F3376    mov         eax,esi
 005F3378    call        0060058C
 005F337D    movzx       eax,al
 005F3380    or          byte ptr [eax+816304],80;gvar_00816304:Pointer
 005F3387    mov         eax,esi
 005F3389    call        0060058C
 005F338E    movzx       eax,al
 005F3391    bts         dword ptr ds:[816E70],eax;gvar_00816E70:Integer
 005F3398    cmp         byte ptr ds:[816658],0;gvar_00816658:Boolean
>005F339F    je          005F33EB
 005F33A1    cmp         byte ptr ds:[816659],0;gvar_00816659:Boolean
>005F33A8    je          005F33CD
 005F33AA    mov         eax,esi
 005F33AC    call        0060058C
 005F33B1    movzx       eax,al
 005F33B4    lea         eax,[eax*8+816660];gvar_00816660:Pointer
 005F33BB    push        eax
 005F33BC    call        00682F08
 005F33C1    fadd        qword ptr ds:[816640];gvar_00816640:Double
 005F33C7    pop         eax
 005F33C8    fstp        qword ptr [eax]
 005F33CA    wait
>005F33CB    jmp         005F33EB
 005F33CD    mov         eax,esi
 005F33CF    call        0060058C
 005F33D4    mov         [00816E60],al;gvar_00816E60
 005F33D9    call        00682F08
 005F33DE    fadd        qword ptr ds:[816640];gvar_00816640:Double
 005F33E4    fstp        qword ptr ds:[816E68];gvar_00816E68:Double
 005F33EA    wait
 005F33EB    mov         eax,ebx
 005F33ED    add         esp,1C
 005F33F0    pop         esi
 005F33F1    pop         ebx
 005F33F2    ret
*}
end;

//005F33F4
procedure TKey.Press;
begin
{*
 005F33F4    push        ebx
 005F33F5    mov         ebx,eax
 005F33F7    mov         eax,dword ptr [ebx+20];TKey.ScanCode:Integer
 005F33FA    call        005F32E8
 005F33FF    xor         edx,edx
 005F3401    mov         dword ptr [ebx+8],edx;TKey.PreviousValue:Double
 005F3404    mov         dword ptr [ebx+0C],3FF00000;TKey.?fC:dword
 005F340B    pop         ebx
 005F340C    ret
*}
end;

//005F3410
procedure sub_005F3410(?:Integer);
begin
{*
 005F3410    push        ebx
 005F3411    push        esi
 005F3412    add         esp,0FFFFFFE4
 005F3415    mov         esi,eax
 005F3417    mov         dword ptr [esp],1
 005F341E    call        005FCDA0
 005F3423    test        al,al
>005F3425    je          005F3449
 005F3427    mov         word ptr [esp+4],0
 005F342E    mov         eax,esi
 005F3430    call        0060058C
 005F3435    and         al,7F
 005F3437    movzx       eax,al
 005F343A    mov         word ptr [esp+6],ax
 005F343F    mov         dword ptr [esp+8],8
>005F3447    jmp         005F346C
 005F3449    mov         eax,esi
 005F344B    call        005FCDC8
 005F3450    mov         word ptr [esp+4],ax
 005F3455    mov         eax,esi
 005F3457    call        0060058C
 005F345C    and         al,7F
 005F345E    movzx       eax,al
 005F3461    mov         word ptr [esp+6],ax
 005F3466    xor         eax,eax
 005F3468    mov         dword ptr [esp+8],eax
 005F346C    xor         eax,eax
 005F346E    mov         dword ptr [esp+0C],eax
 005F3472    xor         eax,eax
 005F3474    mov         dword ptr [esp+10],eax
 005F3478    or          dword ptr [esp+8],2
 005F347D    mov         eax,esi
 005F347F    call        0060058C
 005F3484    cmp         al,80
>005F3486    jb          005F348D
 005F3488    or          dword ptr [esp+8],1
 005F348D    push        1C
 005F348F    lea         eax,[esp+4]
 005F3493    push        eax
 005F3494    push        1
 005F3496    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005F349B    mov         eax,dword ptr [eax]
 005F349D    call        eax
 005F349F    dec         eax
 005F34A0    sete        bl
 005F34A3    mov         eax,esi
 005F34A5    call        0060058C
 005F34AA    movzx       eax,al
 005F34AD    and         byte ptr [eax+816304],7F;gvar_00816304:Pointer
 005F34B4    mov         eax,esi
 005F34B6    call        0060058C
 005F34BB    movzx       eax,al
 005F34BE    btr         dword ptr ds:[816E70],eax;gvar_00816E70:Integer
 005F34C5    cmp         byte ptr ds:[816658],0;gvar_00816658:Boolean
>005F34CC    je          005F34FD
 005F34CE    mov         eax,esi
 005F34D0    call        0060058C
 005F34D5    movzx       eax,al
 005F34D8    xor         edx,edx
 005F34DA    mov         dword ptr [eax*8+816660],edx;gvar_00816660:Pointer
 005F34E1    mov         dword ptr [eax*8+816664],edx
 005F34E8    xor         eax,eax
 005F34EA    mov         dword ptr ds:[816650],eax;gvar_00816650:Double
 005F34F0    mov         dword ptr ds:[816654],eax;gvar_00816654
 005F34F6    mov         byte ptr ds:[816E60],0;gvar_00816E60
 005F34FD    mov         eax,ebx
 005F34FF    add         esp,1C
 005F3502    pop         esi
 005F3503    pop         ebx
 005F3504    ret
*}
end;

//005F3508
procedure TKey.Release;
begin
{*
 005F3508    push        ebx
 005F3509    mov         ebx,eax
 005F350B    mov         eax,dword ptr [ebx+20];TKey.ScanCode:Integer
 005F350E    call        005F3410
 005F3513    xor         edx,edx
 005F3515    mov         dword ptr [ebx+8],edx;TKey.PreviousValue:Double
 005F3518    mov         dword ptr [ebx+0C],edx;TKey.?fC:dword
 005F351B    pop         ebx
 005F351C    ret
*}
end;

//005F3520
{*procedure sub_005F3520(?:?; ?:?);
begin
 005F3520    push        ebx
 005F3521    push        esi
 005F3522    push        edi
 005F3523    push        ebp
 005F3524    add         esp,0FFFFFFC8
 005F3527    mov         ebp,edx
 005F3529    mov         edi,eax
 005F352B    mov         esi,2
 005F3530    mov         ebx,esp
 005F3532    mov         dword ptr [ebx],1
 005F3538    mov         word ptr [ebx+4],0
 005F353E    call        005FCDA0
 005F3543    test        al,al
>005F3545    je          005F3550
 005F3547    mov         dword ptr [ebx+8],8
>005F354E    jmp         005F3555
 005F3550    xor         eax,eax
 005F3552    mov         dword ptr [ebx+8],eax
 005F3555    xor         eax,eax
 005F3557    mov         dword ptr [ebx+0C],eax
 005F355A    xor         eax,eax
 005F355C    mov         dword ptr [ebx+10],eax
 005F355F    add         ebx,1C
 005F3562    dec         esi
>005F3563    jne         005F3532
 005F3565    mov         eax,edi
 005F3567    call        0060058C
 005F356C    and         al,7F
 005F356E    movzx       eax,al
 005F3571    mov         word ptr [esp+6],ax
 005F3576    mov         eax,ebp
 005F3578    call        0060058C
 005F357D    and         al,7F
 005F357F    movzx       eax,al
 005F3582    mov         word ptr [esp+22],ax
 005F3587    call        005FCDA0
 005F358C    test        al,al
>005F358E    jne         005F35B8
 005F3590    mov         eax,edi
 005F3592    call        0060058C
 005F3597    movzx       eax,al
 005F359A    call        005FCDC8
 005F359F    mov         word ptr [esp+4],ax
 005F35A4    mov         eax,ebp
 005F35A6    call        0060058C
 005F35AB    movzx       eax,al
 005F35AE    call        005FCDC8
 005F35B3    mov         word ptr [esp+20],ax
 005F35B8    or          dword ptr [esp+8],2
 005F35BD    mov         eax,edi
 005F35BF    call        0060058C
 005F35C4    cmp         al,80
>005F35C6    jb          005F35CD
 005F35C8    or          dword ptr [esp+8],1
 005F35CD    mov         eax,ebp
 005F35CF    call        0060058C
 005F35D4    cmp         al,80
>005F35D6    jb          005F35DD
 005F35D8    or          dword ptr [esp+24],1
 005F35DD    test        edi,edi
>005F35DF    jne         005F35F5
 005F35E1    push        1C
 005F35E3    lea         eax,[esp+20]
 005F35E7    push        eax
 005F35E8    push        1
 005F35EA    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005F35EF    mov         eax,dword ptr [eax]
 005F35F1    call        eax
>005F35F3    jmp         005F361F
 005F35F5    test        ebp,ebp
>005F35F7    jne         005F360D
 005F35F9    push        1C
 005F35FB    lea         eax,[esp+4]
 005F35FF    push        eax
 005F3600    push        1
 005F3602    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005F3607    mov         eax,dword ptr [eax]
 005F3609    call        eax
>005F360B    jmp         005F361F
 005F360D    push        1C
 005F360F    lea         eax,[esp+4]
 005F3613    push        eax
 005F3614    push        2
 005F3616    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005F361B    mov         eax,dword ptr [eax]
 005F361D    call        eax
 005F361F    mov         eax,edi
 005F3621    call        0060058C
 005F3626    movzx       eax,al
 005F3629    btr         dword ptr ds:[816E70],eax;gvar_00816E70:Integer
 005F3630    mov         eax,ebp
 005F3632    call        0060058C
 005F3637    movzx       eax,al
 005F363A    bts         dword ptr ds:[816E70],eax;gvar_00816E70:Integer
 005F3641    cmp         byte ptr ds:[816658],0;gvar_00816658:Boolean
>005F3648    je          005F36AE
 005F364A    mov         eax,edi
 005F364C    call        0060058C
 005F3651    movzx       eax,al
 005F3654    xor         edx,edx
 005F3656    mov         dword ptr [eax*8+816660],edx;gvar_00816660:Pointer
 005F365D    mov         dword ptr [eax*8+816664],edx
 005F3664    cmp         byte ptr ds:[816659],0;gvar_00816659:Boolean
>005F366B    je          005F3690
 005F366D    mov         eax,ebp
 005F366F    call        0060058C
 005F3674    movzx       eax,al
 005F3677    lea         eax,[eax*8+816660];gvar_00816660:Pointer
 005F367E    push        eax
 005F367F    call        00682F08
 005F3684    fadd        qword ptr ds:[816640];gvar_00816640:Double
 005F368A    pop         eax
 005F368B    fstp        qword ptr [eax]
 005F368D    wait
>005F368E    jmp         005F36AE
 005F3690    mov         eax,ebp
 005F3692    call        0060058C
 005F3697    mov         [00816E60],al;gvar_00816E60
 005F369C    call        00682F08
 005F36A1    fadd        qword ptr ds:[816640];gvar_00816640:Double
 005F36A7    fstp        qword ptr ds:[816650];gvar_00816650:Double
 005F36AD    wait
 005F36AE    add         esp,38
 005F36B1    pop         ebp
 005F36B2    pop         edi
 005F36B3    pop         esi
 005F36B4    pop         ebx
 005F36B5    ret
end;*}

//005F36B8
{*function TKey.SetValue(NewValue:Double; ?:?):Boolean;
begin
 005F36B8    push        ebp
 005F36B9    mov         ebp,esp
 005F36BB    add         esp,0FFFFFED8
 005F36C1    push        ebx
 005F36C2    push        esi
 005F36C3    push        edi
 005F36C4    mov         esi,eax
 005F36C6    push        dword ptr [ebp+0C]
 005F36C9    push        dword ptr [ebp+8]
 005F36CC    call        00686060
 005F36D1    mov         byte ptr [ebp-1],al
 005F36D4    mov         eax,dword ptr [esi+20];TKey.ScanCode:Integer
 005F36D7    cmp         eax,114
>005F36DC    je          005F36E5
 005F36DE    cmp         eax,110
>005F36E3    jne         005F36EC
 005F36E5    xor         ebx,ebx
>005F36E7    jmp         005F3BDD
 005F36EC    cmp         eax,117
>005F36F1    jne         005F3711
 005F36F3    mov         byte ptr ds:[81640E],1;gvar_0081640E
 005F36FA    push        dword ptr [ebp+0C]
 005F36FD    push        dword ptr [ebp+8]
 005F3700    call        00686060
 005F3705    mov         [0081640C],al;gvar_0081640C:Boolean
 005F370A    mov         bl,1
>005F370C    jmp         005F3BDD
 005F3711    cmp         eax,11A
>005F3716    jne         005F372F
 005F3718    push        dword ptr [ebp+0C]
 005F371B    push        dword ptr [ebp+8]
 005F371E    call        00686060
 005F3723    mov         [00816658],al;gvar_00816658:Boolean
 005F3728    mov         bl,1
>005F372A    jmp         005F3BDD
 005F372F    cmp         eax,11B
>005F3734    jne         005F374D
 005F3736    push        dword ptr [ebp+0C]
 005F3739    push        dword ptr [ebp+8]
 005F373C    call        00686060
 005F3741    mov         [00816659],al;gvar_00816659:Boolean
 005F3746    mov         bl,1
>005F3748    jmp         005F3BDD
 005F374D    cmp         eax,141
>005F3752    jne         005F37C0
 005F3754    push        dword ptr [ebp+0C]
 005F3757    push        dword ptr [ebp+8]
 005F375A    call        00686060
 005F375F    mov         byte ptr [ebp-2],al
 005F3762    mov         bl,1
 005F3764    movzx       eax,byte ptr ds:[816E95];gvar_00816E95:Boolean
 005F376B    cmp         al,byte ptr [ebp-2]
>005F376E    je          005F3BDD
 005F3774    lea         eax,[ebp-11E]
 005F377A    push        eax
 005F377B    call        user32.GetKeyboardState
 005F3780    push        0
 005F3782    push        0
 005F3784    push        0
 005F3786    push        14
 005F3788    call        user32.keybd_event
 005F378D    movzx       eax,byte ptr [ebp-2]
 005F3791    mov         [00816E95],al;gvar_00816E95:Boolean
 005F3796    push        0
 005F3798    push        2
 005F379A    push        0
 005F379C    push        14
 005F379E    call        user32.keybd_event
 005F37A3    mov         eax,[0078D590];^Application:TApplication
 005F37A8    mov         eax,dword ptr [eax]
 005F37AA    call        TApplication.ProcessMessages
 005F37AF    lea         eax,[ebp-11E]
 005F37B5    push        eax
 005F37B6    call        user32.SetKeyboardState
>005F37BB    jmp         005F3BDD
 005F37C0    cmp         eax,142
>005F37C5    jne         005F3839
 005F37C7    push        dword ptr [ebp+0C]
 005F37CA    push        dword ptr [ebp+8]
 005F37CD    call        00686060
 005F37D2    mov         byte ptr [ebp-2],al
 005F37D5    mov         bl,1
 005F37D7    movzx       eax,byte ptr ds:[816E96];gvar_00816E96:Boolean
 005F37DE    cmp         al,byte ptr [ebp-2]
>005F37E1    je          005F3BDD
 005F37E7    lea         eax,[ebp-11E]
 005F37ED    push        eax
 005F37EE    call        user32.GetKeyboardState
 005F37F3    push        0
 005F37F5    push        0
 005F37F7    push        0
 005F37F9    push        90
 005F37FE    call        user32.keybd_event
 005F3803    movzx       eax,byte ptr [ebp-2]
 005F3807    mov         [00816E96],al;gvar_00816E96:Boolean
 005F380C    push        0
 005F380E    push        2
 005F3810    push        0
 005F3812    push        90
 005F3817    call        user32.keybd_event
 005F381C    mov         eax,[0078D590];^Application:TApplication
 005F3821    mov         eax,dword ptr [eax]
 005F3823    call        TApplication.ProcessMessages
 005F3828    lea         eax,[ebp-11E]
 005F382E    push        eax
 005F382F    call        user32.SetKeyboardState
>005F3834    jmp         005F3BDD
 005F3839    cmp         byte ptr [esi+2C],2;TKey.FakeOrReal:TFakeness
>005F383D    jne         005F3846
 005F383F    xor         ebx,ebx
>005F3841    jmp         005F3BDD
 005F3846    mov         eax,dword ptr [esi+20];TKey.ScanCode:Integer
 005F3849    cmp         eax,112
>005F384E    jne         005F3924
 005F3854    fld         qword ptr [ebp+8]
 005F3857    fcomp       dword ptr ds:[5F3BE8];57344:Single
 005F385D    wait
 005F385E    fnstsw      al
 005F3860    sahf
>005F3861    jb          005F38D4
 005F3863    fld         qword ptr [ebp+8]
 005F3866    fcomp       dword ptr ds:[5F3BEC];57600:Single
 005F386C    wait
 005F386D    fnstsw      al
 005F386F    sahf
>005F3870    jb          005F38A0
 005F3872    fld         qword ptr [ebp+8]
 005F3875    fsub        dword ptr ds:[5F3BEC];57600:Single
 005F387B    call        @ROUND
 005F3880    and         eax,7F
 005F3886    xor         edx,edx
 005F3888    mov         dword ptr [ebp-128],eax
 005F388E    mov         dword ptr [ebp-124],edx
 005F3894    fild        qword ptr [ebp-128]
 005F389A    fstp        qword ptr [ebp+8]
 005F389D    wait
>005F389E    jmp         005F38D4
 005F38A0    fld         qword ptr [ebp+8]
 005F38A3    fsub        dword ptr ds:[5F3BE8];57344:Single
 005F38A9    call        @ROUND
 005F38AE    and         eax,7F
 005F38B4    xor         edx,edx
 005F38B6    add         eax,80
 005F38BB    adc         edx,0
 005F38BE    mov         dword ptr [ebp-128],eax
 005F38C4    mov         dword ptr [ebp-124],edx
 005F38CA    fild        qword ptr [ebp-128]
 005F38D0    fstp        qword ptr [ebp+8]
 005F38D3    wait
 005F38D4    fld         qword ptr [ebp+8]
 005F38D7    call        @ROUND
 005F38DC    push        edx
 005F38DD    push        eax
 005F38DE    movzx       eax,byte ptr ds:[8162F5];gvar_008162F5
 005F38E5    xor         edx,edx
 005F38E7    cmp         edx,dword ptr [esp+4]
>005F38EB    jne         005F38F0
 005F38ED    cmp         eax,dword ptr [esp]
 005F38F0    setne       al
 005F38F3    add         esp,8
 005F38F6    test        al,al
>005F38F8    je          005F391D
 005F38FA    fld         qword ptr [ebp+8]
 005F38FD    call        @ROUND
 005F3902    mov         edx,eax
 005F3904    movzx       eax,byte ptr ds:[8162F5];gvar_008162F5
 005F390B    call        005F3520
 005F3910    fld         qword ptr [ebp+8]
 005F3913    call        @ROUND
 005F3918    mov         [008162F5],al;gvar_008162F5
 005F391D    mov         bl,1
>005F391F    jmp         005F3BDD
 005F3924    cmp         eax,113
>005F3929    jne         005F397F
 005F392B    fld         qword ptr [ebp+8]
 005F392E    call        @ROUND
 005F3933    mov         ebx,eax
 005F3935    mov         eax,ebx
 005F3937    call        005FD518
 005F393C    movzx       esi,byte ptr ds:[8162F5];gvar_008162F5
 005F3943    cmp         eax,esi
 005F3945    setne       al
 005F3948    test        al,al
>005F394A    je          005F3978
 005F394C    fld         qword ptr [ebp+8]
 005F394F    call        @ROUND
 005F3954    mov         eax,ebx
 005F3956    call        005FD518
 005F395B    mov         edx,eax
 005F395D    mov         eax,esi
 005F395F    call        005F3520
 005F3964    fld         qword ptr [ebp+8]
 005F3967    call        @ROUND
 005F396C    mov         eax,ebx
 005F396E    call        005FD518
 005F3973    mov         [008162F5],al;gvar_008162F5
 005F3978    mov         bl,1
>005F397A    jmp         005F3BDD
 005F397F    cmp         byte ptr [esi+10],0;TKey.Iffy:Boolean
>005F3983    je          005F39E2
 005F3985    cmp         eax,103
>005F398A    jg          005F39C2
 005F398C    mov         eax,dword ptr [esi+20];TKey.ScanCode:Integer
 005F398F    call        0060058C
 005F3994    movzx       eax,al
 005F3997    test        byte ptr [eax+816304],80;gvar_00816304:Pointer
>005F399E    ja          005F39B8
 005F39A0    mov         eax,dword ptr [esi+20];TKey.ScanCode:Integer
 005F39A3    call        0060058C
 005F39A8    movzx       eax,al
 005F39AB    bt          dword ptr ds:[816E70],eax;gvar_00816E70:Integer
>005F39B2    jb          005F39B8
 005F39B4    xor         eax,eax
>005F39B6    jmp         005F39BA
 005F39B8    mov         al,1
 005F39BA    cmp         al,byte ptr [ebp-1]
 005F39BD    setne       al
>005F39C0    jmp         005F39F3
 005F39C2    mov         eax,dword ptr [esi+20];TKey.ScanCode:Integer
 005F39C5    cmp         eax,107
>005F39CA    je          005F39DA
 005F39CC    cmp         eax,105
>005F39D1    je          005F39DA
 005F39D3    cmp         eax,106
>005F39D8    jne         005F39DE
 005F39DA    xor         eax,eax
>005F39DC    jmp         005F39F3
 005F39DE    mov         al,1
>005F39E0    jmp         005F39F3
 005F39E2    push        dword ptr [esi+0C];TKey.?fC:dword
 005F39E5    push        dword ptr [esi+8];TKey.PreviousValue:Double
 005F39E8    call        00686060
 005F39ED    cmp         al,byte ptr [ebp-1]
 005F39F0    setne       al
 005F39F3    test        al,al
>005F39F5    je          005F3B69
 005F39FB    mov         dword ptr [ebp-1E],1
 005F3A02    call        005FCDA0
 005F3A07    test        al,al
>005F3A09    je          005F3A4C
 005F3A0B    mov         ebx,dword ptr [esi+20];TKey.ScanCode:Integer
 005F3A0E    cmp         ebx,11C
>005F3A14    jne         005F3A2D
 005F3A16    mov         word ptr [ebp-1A],0
 005F3A1C    movzx       eax,word ptr [esi+24];TKey.UnicodeNumber:Cardinal
 005F3A20    mov         word ptr [ebp-18],ax
 005F3A24    mov         dword ptr [ebp-16],4
>005F3A2B    jmp         005F3A90
 005F3A2D    mov         word ptr [ebp-1A],0
 005F3A33    mov         eax,ebx
 005F3A35    call        0060058C
 005F3A3A    and         al,7F
 005F3A3C    movzx       eax,al
 005F3A3F    mov         word ptr [ebp-18],ax
 005F3A43    mov         dword ptr [ebp-16],8
>005F3A4A    jmp         005F3A90
 005F3A4C    mov         ebx,dword ptr [esi+20];TKey.ScanCode:Integer
 005F3A4F    cmp         ebx,11C
>005F3A55    jne         005F3A6F
 005F3A57    xor         ebx,ebx
>005F3A59    jmp         005F3BDD
 005F3A5E    mov         word ptr [ebp-1A],0
 005F3A64    mov         word ptr [ebp-18],0
 005F3A6A    xor         eax,eax
 005F3A6C    mov         dword ptr [ebp-16],eax
 005F3A6F    mov         eax,ebx
 005F3A71    call        005FCDC8
 005F3A76    mov         word ptr [ebp-1A],ax
 005F3A7A    mov         eax,dword ptr [esi+20];TKey.ScanCode:Integer
 005F3A7D    call        0060058C
 005F3A82    and         al,7F
 005F3A84    movzx       eax,al
 005F3A87    mov         word ptr [ebp-18],ax
 005F3A8B    xor         eax,eax
 005F3A8D    mov         dword ptr [ebp-16],eax
 005F3A90    xor         eax,eax
 005F3A92    mov         dword ptr [ebp-12],eax
 005F3A95    xor         eax,eax
 005F3A97    mov         dword ptr [ebp-0E],eax
 005F3A9A    cmp         byte ptr [ebp-1],0
>005F3A9E    jne         005F3AE3
 005F3AA0    or          dword ptr [ebp-16],2
 005F3AA4    cmp         byte ptr ds:[816658],0;gvar_00816658:Boolean
>005F3AAB    je          005F3B38
 005F3AB1    mov         eax,dword ptr [esi+20];TKey.ScanCode:Integer
 005F3AB4    call        0060058C
 005F3AB9    movzx       eax,al
 005F3ABC    xor         edx,edx
 005F3ABE    mov         dword ptr [eax*8+816660],edx;gvar_00816660:Pointer
 005F3AC5    mov         dword ptr [eax*8+816664],edx
 005F3ACC    mov         byte ptr ds:[816E60],0;gvar_00816E60
 005F3AD3    xor         eax,eax
 005F3AD5    mov         dword ptr ds:[816E68],eax;gvar_00816E68:Double
 005F3ADB    mov         dword ptr ds:[816E6C],eax;gvar_00816E6C
>005F3AE1    jmp         005F3B38
 005F3AE3    cmp         byte ptr ds:[816658],0;gvar_00816658:Boolean
>005F3AEA    je          005F3B38
 005F3AEC    cmp         byte ptr ds:[816659],0;gvar_00816659:Boolean
>005F3AF3    je          005F3B19
 005F3AF5    mov         eax,dword ptr [esi+20];TKey.ScanCode:Integer
 005F3AF8    call        0060058C
 005F3AFD    movzx       eax,al
 005F3B00    lea         eax,[eax*8+816660];gvar_00816660:Pointer
 005F3B07    push        eax
 005F3B08    call        00682F08
 005F3B0D    fadd        qword ptr ds:[816640];gvar_00816640:Double
 005F3B13    pop         eax
 005F3B14    fstp        qword ptr [eax]
 005F3B16    wait
>005F3B17    jmp         005F3B38
 005F3B19    mov         eax,dword ptr [esi+20];TKey.ScanCode:Integer
 005F3B1C    call        0060058C
 005F3B21    mov         [00816E60],al;gvar_00816E60
 005F3B26    call        00682F08
 005F3B2B    fadd        qword ptr ds:[816640];gvar_00816640:Double
 005F3B31    fstp        qword ptr ds:[816E68];gvar_00816E68:Double
 005F3B37    wait
 005F3B38    mov         ebx,dword ptr [esi+20];TKey.ScanCode:Integer
 005F3B3B    cmp         ebx,103
>005F3B41    jg          005F3B52
 005F3B43    mov         eax,ebx
 005F3B45    call        0060058C
 005F3B4A    cmp         al,80
>005F3B4C    jb          005F3B52
 005F3B4E    or          dword ptr [ebp-16],1
 005F3B52    push        1C
 005F3B54    lea         eax,[ebp-1E]
 005F3B57    push        eax
 005F3B58    push        1
 005F3B5A    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005F3B5F    mov         eax,dword ptr [eax]
 005F3B61    call        eax
 005F3B63    dec         eax
 005F3B64    sete        bl
>005F3B67    jmp         005F3B6B
 005F3B69    mov         bl,1
 005F3B6B    movzx       eax,byte ptr [ebp-1]
 005F3B6F    call        00686074
 005F3B74    fstp        qword ptr [esi+8];TKey.PreviousValue:Double
 005F3B77    wait
 005F3B78    mov         edi,dword ptr [esi+20];TKey.ScanCode:Integer
 005F3B7B    cmp         edi,103
>005F3B81    jg          005F3BDD
 005F3B83    cmp         byte ptr [ebp-1],0
>005F3B87    je          005F3BB4
 005F3B89    mov         eax,edi
 005F3B8B    call        0060058C
 005F3B90    movzx       eax,al
 005F3B93    bts         dword ptr ds:[816E70],eax;gvar_00816E70:Integer
 005F3B9A    cmp         byte ptr [esi+10],0;TKey.Iffy:Boolean
>005F3B9E    je          005F3BDD
 005F3BA0    mov         eax,dword ptr [esi+20];TKey.ScanCode:Integer
 005F3BA3    call        0060058C
 005F3BA8    movzx       eax,al
 005F3BAB    or          byte ptr [eax+816304],80;gvar_00816304:Pointer
>005F3BB2    jmp         005F3BDD
 005F3BB4    mov         eax,edi
 005F3BB6    call        0060058C
 005F3BBB    movzx       eax,al
 005F3BBE    btr         dword ptr ds:[816E70],eax;gvar_00816E70:Integer
 005F3BC5    cmp         byte ptr [esi+10],0;TKey.Iffy:Boolean
>005F3BC9    je          005F3BDD
 005F3BCB    mov         eax,dword ptr [esi+20];TKey.ScanCode:Integer
 005F3BCE    call        0060058C
 005F3BD3    movzx       eax,al
 005F3BD6    and         byte ptr [eax+816304],7F;gvar_00816304:Pointer
 005F3BDD    mov         eax,ebx
 005F3BDF    pop         edi
 005F3BE0    pop         esi
 005F3BE1    pop         ebx
 005F3BE2    mov         esp,ebp
 005F3BE4    pop         ebp
 005F3BE5    ret         8
end;*}

//005F3BF0
{*function TKey.SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;
begin
 005F3BF0    push        ebp
 005F3BF1    mov         ebp,esp
 005F3BF3    add         esp,0FFFFFFF8
 005F3BF6    push        ebx
 005F3BF7    push        esi
 005F3BF8    push        edi
 005F3BF9    mov         ebx,eax
 005F3BFB    xor         edx,edx
 005F3BFD    mov         byte ptr [ebp-2],0
 005F3C01    mov         byte ptr [ebp-3],0
 005F3C05    mov         byte ptr [ebp-4],0
 005F3C09    fld         qword ptr [ebp+18]
 005F3C0C    fcomp       dword ptr ds:[5F3E50];0.5:Single
 005F3C12    wait
 005F3C13    fnstsw      al
 005F3C15    sahf
>005F3C16    jb          005F3C1E
 005F3C18    mov         si,1
>005F3C1C    jmp         005F3C34
 005F3C1E    fld         qword ptr [ebp+18]
 005F3C21    fcomp       dword ptr ds:[5F3E54];-0.5:Single
 005F3C27    wait
 005F3C28    fnstsw      al
 005F3C2A    sahf
>005F3C2B    ja          005F3C32
 005F3C2D    or          esi,0FFFFFFFF
>005F3C30    jmp         005F3C34
 005F3C32    xor         esi,esi
 005F3C34    fld         qword ptr [ebp+10]
 005F3C37    fcomp       dword ptr ds:[5F3E50];0.5:Single
 005F3C3D    wait
 005F3C3E    fnstsw      al
 005F3C40    sahf
>005F3C41    jb          005F3C49
 005F3C43    mov         di,1
>005F3C47    jmp         005F3C5F
 005F3C49    fld         qword ptr [ebp+10]
 005F3C4C    fcomp       dword ptr ds:[5F3E54];-0.5:Single
 005F3C52    wait
 005F3C53    fnstsw      al
 005F3C55    sahf
>005F3C56    ja          005F3C5D
 005F3C58    or          edi,0FFFFFFFF
>005F3C5B    jmp         005F3C5F
 005F3C5D    xor         edi,edi
 005F3C5F    mov         eax,dword ptr [ebx+20];TKey.ScanCode:Integer
 005F3C62    cmp         eax,11E
>005F3C67    jne         005F3C79
 005F3C69    mov         al,1E
 005F3C6B    mov         byte ptr [ebp-5],20
 005F3C6F    mov         byte ptr [ebp-6],11
 005F3C73    mov         byte ptr [ebp-7],1F
>005F3C77    jmp         005F3CC8
 005F3C79    cmp         eax,11D
>005F3C7E    jne         005F3C90
 005F3C80    mov         al,0CB
 005F3C82    mov         byte ptr [ebp-5],0CD
 005F3C86    mov         byte ptr [ebp-6],0C8
 005F3C8A    mov         byte ptr [ebp-7],0D0
>005F3C8E    jmp         005F3CC8
 005F3C90    cmp         eax,11F
>005F3C95    jne         005F3CA7
 005F3C97    mov         al,4B
 005F3C99    mov         byte ptr [ebp-5],4D
 005F3C9D    mov         byte ptr [ebp-6],48
 005F3CA1    mov         byte ptr [ebp-7],50
>005F3CA5    jmp         005F3CC8
 005F3CA7    push        dword ptr [ebp+1C]
 005F3CAA    push        dword ptr [ebp+18]
 005F3CAD    push        dword ptr [ebp+14]
 005F3CB0    push        dword ptr [ebp+10]
 005F3CB3    push        dword ptr [ebp+0C]
 005F3CB6    push        dword ptr [ebp+8]
 005F3CB9    mov         eax,ebx
 005F3CBB    call        TExpression.SetVector
 005F3CC0    mov         byte ptr [ebp-1],al
>005F3CC3    jmp         005F3E41
 005F3CC8    mov         byte ptr [ebp-1],1
 005F3CCC    cmp         byte ptr [ebx+10],0;TKey.Iffy:Boolean
>005F3CD0    je          005F3D92
 005F3CD6    movzx       ecx,al
 005F3CD9    movzx       ecx,byte ptr [ecx+816304];gvar_00816304:Pointer
 005F3CE0    and         cl,80
 005F3CE3    test        cl,cl
>005F3CE5    je          005F3CFF
 005F3CE7    movzx       ecx,byte ptr [ebp-5]
 005F3CEB    test        byte ptr [ecx+816304],80;gvar_00816304:Pointer
>005F3CF2    je          005F3CFF
 005F3CF4    mov         ecx,esi
 005F3CF6    neg         cx
 005F3CF9    mov         word ptr [ebx+28],cx;TKey.PrevX:SmallInt
>005F3CFD    jmp         005F3D33
 005F3CFF    movzx       ecx,al
 005F3D02    movzx       ecx,byte ptr [ecx+816304];gvar_00816304:Pointer
 005F3D09    and         cl,80
 005F3D0C    test        cl,cl
>005F3D0E    je          005F3D18
 005F3D10    mov         word ptr [ebx+28],0FFFF;TKey.PrevX:SmallInt
>005F3D16    jmp         005F3D33
 005F3D18    movzx       ecx,byte ptr [ebp-5]
 005F3D1C    test        byte ptr [ecx+816304],80;gvar_00816304:Pointer
>005F3D23    je          005F3D2D
 005F3D25    mov         word ptr [ebx+28],1;TKey.PrevX:SmallInt
>005F3D2B    jmp         005F3D33
 005F3D2D    mov         word ptr [ebx+28],0;TKey.PrevX:SmallInt
 005F3D33    movzx       ecx,byte ptr [ebp-6]
 005F3D37    movzx       ecx,byte ptr [ecx+816304];gvar_00816304:Pointer
 005F3D3E    and         cl,80
 005F3D41    test        cl,cl
>005F3D43    je          005F3D5D
 005F3D45    movzx       ecx,byte ptr [ebp-7]
 005F3D49    test        byte ptr [ecx+816304],80;gvar_00816304:Pointer
>005F3D50    je          005F3D5D
 005F3D52    mov         ecx,edi
 005F3D54    neg         cx
 005F3D57    mov         word ptr [ebx+2A],cx;TKey.PrevY:SmallInt
>005F3D5B    jmp         005F3D92
 005F3D5D    movzx       ecx,byte ptr [ebp-6]
 005F3D61    movzx       ecx,byte ptr [ecx+816304];gvar_00816304:Pointer
 005F3D68    and         cl,80
 005F3D6B    test        cl,cl
>005F3D6D    je          005F3D77
 005F3D6F    mov         word ptr [ebx+2A],0FFFF;TKey.PrevY:SmallInt
>005F3D75    jmp         005F3D92
 005F3D77    movzx       ecx,byte ptr [ebp-7]
 005F3D7B    test        byte ptr [ecx+816304],80;gvar_00816304:Pointer
>005F3D82    je          005F3D8C
 005F3D84    mov         word ptr [ebx+2A],1;TKey.PrevY:SmallInt
>005F3D8A    jmp         005F3D92
 005F3D8C    mov         word ptr [ebx+2A],0;TKey.PrevY:SmallInt
 005F3D92    movzx       ecx,word ptr [ebx+28];TKey.PrevX:SmallInt
 005F3D96    cmp         si,cx
>005F3D99    je          005F3DC3
 005F3D9B    test        cx,cx
>005F3D9E    jge         005F3DA4
 005F3DA0    mov         edx,eax
>005F3DA2    jmp         005F3DAD
 005F3DA4    test        cx,cx
>005F3DA7    jle         005F3DAD
 005F3DA9    movzx       edx,byte ptr [ebp-5]
 005F3DAD    test        si,si
>005F3DB0    jge         005F3DB7
 005F3DB2    mov         byte ptr [ebp-2],al
>005F3DB5    jmp         005F3DC3
 005F3DB7    test        si,si
>005F3DBA    jle         005F3DC3
 005F3DBC    movzx       eax,byte ptr [ebp-5]
 005F3DC0    mov         byte ptr [ebp-2],al
 005F3DC3    movzx       eax,word ptr [ebx+2A];TKey.PrevY:SmallInt
 005F3DC7    cmp         di,ax
>005F3DCA    je          005F3E00
 005F3DCC    test        ax,ax
>005F3DCF    jge         005F3DDA
 005F3DD1    movzx       eax,byte ptr [ebp-6]
 005F3DD5    mov         byte ptr [ebp-3],al
>005F3DD8    jmp         005F3DE6
 005F3DDA    test        ax,ax
>005F3DDD    jle         005F3DE6
 005F3DDF    movzx       eax,byte ptr [ebp-7]
 005F3DE3    mov         byte ptr [ebp-3],al
 005F3DE6    test        di,di
>005F3DE9    jge         005F3DF4
 005F3DEB    movzx       eax,byte ptr [ebp-6]
 005F3DEF    mov         byte ptr [ebp-4],al
>005F3DF2    jmp         005F3E00
 005F3DF4    test        di,di
>005F3DF7    jle         005F3E00
 005F3DF9    movzx       eax,byte ptr [ebp-7]
 005F3DFD    mov         byte ptr [ebp-4],al
 005F3E00    test        dl,dl
>005F3E02    je          005F3E0C
 005F3E04    movzx       eax,dl
 005F3E07    call        005F3410
 005F3E0C    cmp         byte ptr [ebp-3],0
>005F3E10    je          005F3E1B
 005F3E12    movzx       eax,byte ptr [ebp-3]
 005F3E16    call        005F3410
 005F3E1B    cmp         byte ptr [ebp-2],0
>005F3E1F    je          005F3E2A
 005F3E21    movzx       eax,byte ptr [ebp-2]
 005F3E25    call        005F32E8
 005F3E2A    cmp         byte ptr [ebp-4],0
>005F3E2E    je          005F3E39
 005F3E30    movzx       eax,byte ptr [ebp-4]
 005F3E34    call        005F32E8
 005F3E39    mov         word ptr [ebx+28],si;TKey.PrevX:SmallInt
 005F3E3D    mov         word ptr [ebx+2A],di;TKey.PrevY:SmallInt
 005F3E41    movzx       eax,byte ptr [ebp-1]
 005F3E45    pop         edi
 005F3E46    pop         esi
 005F3E47    pop         ebx
 005F3E48    pop         ecx
 005F3E49    pop         ecx
 005F3E4A    pop         ebp
 005F3E4B    ret         18
end;*}

//005F3E58
procedure TKey.Swallow;
begin
{*
 005F3E58    mov         edx,dword ptr [eax+20];TKey.ScanCode:Integer
 005F3E5B    mov         ecx,edx
 005F3E5D    cmp         ecx,111
>005F3E63    jge         005F3E9E
 005F3E65    cmp         ecx,101
>005F3E6B    jg          005F3E86
>005F3E6D    je          005F3F5E
 005F3E73    sub         ecx,100
>005F3E79    jb          005F3EF0
>005F3E7B    je          005F3F4F
>005F3E81    jmp         005F3F92
 005F3E86    sub         ecx,102
>005F3E8C    je          005F3F6D
 005F3E92    dec         ecx
>005F3E93    je          005F3F7C
>005F3E99    jmp         005F3F92
 005F3E9E    add         ecx,0FFFFFEEF
 005F3EA4    cmp         ecx,0E
>005F3EA7    ja          005F3F92
 005F3EAD    jmp         dword ptr [ecx*4+5F3EB4]
 005F3EAD    dd          005F3F8B
 005F3EAD    dd          005F3F8B
 005F3EAD    dd          005F3F8B
 005F3EAD    dd          005F3F92
 005F3EAD    dd          005F3F8B
 005F3EAD    dd          005F3F8B
 005F3EAD    dd          005F3F92
 005F3EAD    dd          005F3F92
 005F3EAD    dd          005F3F92
 005F3EAD    dd          005F3F92
 005F3EAD    dd          005F3F92
 005F3EAD    dd          005F3F92
 005F3EAD    dd          005F3F15
 005F3EAD    dd          005F3EF8
 005F3EAD    dd          005F3F32
 005F3EF0    mov         byte ptr [edx+81650F],1;gvar_0081650F:Pointer
 005F3EF7    ret
 005F3EF8    mov         byte ptr ds:[816520],1;gvar_00816520
 005F3EFF    mov         byte ptr ds:[81652D],1;gvar_0081652D
 005F3F06    mov         byte ptr ds:[81652E],1;gvar_0081652E
 005F3F0D    mov         byte ptr ds:[81652F],1;gvar_0081652F
 005F3F14    ret
 005F3F15    mov         byte ptr ds:[8165D7],1;gvar_008165D7
 005F3F1C    mov         byte ptr ds:[8165DF],1;gvar_008165DF
 005F3F23    mov         byte ptr ds:[8165DA],1;gvar_008165DA
 005F3F2A    mov         byte ptr ds:[8165DC],1;gvar_008165DC
 005F3F31    ret
 005F3F32    mov         byte ptr ds:[816557],1;gvar_00816557
 005F3F39    mov         byte ptr ds:[81655A],1;gvar_0081655A
 005F3F40    mov         byte ptr ds:[81655F],1;gvar_0081655F
 005F3F47    mov         byte ptr ds:[81655C],1;gvar_0081655C
 005F3F4E    ret
 005F3F4F    mov         byte ptr ds:[816539],1;gvar_00816539
 005F3F56    mov         byte ptr ds:[816545],1;gvar_00816545
 005F3F5D    ret
 005F3F5E    mov         byte ptr ds:[81652C],1;gvar_0081652C
 005F3F65    mov         byte ptr ds:[8165AC],1;gvar_008165AC
 005F3F6C    ret
 005F3F6D    mov         byte ptr ds:[816547],1;gvar_00816547
 005F3F74    mov         byte ptr ds:[8165C7],1;gvar_008165C7
 005F3F7B    ret
 005F3F7C    mov         byte ptr ds:[8165EA],1;gvar_008165EA
 005F3F83    mov         byte ptr ds:[8165EB],1;gvar_008165EB
 005F3F8A    ret
 005F3F8B    mov         byte ptr ds:[81640D],1;gvar_0081640D
 005F3F92    ret
*}
end;

//005F3F94
procedure sub_005F3F94;
begin
{*
 005F3F94    push        esi
 005F3F95    push        edi
 005F3F96    add         esp,0FFFFFDA8
 005F3F9C    mov         esi,5F42A8
 005F3FA1    mov         edi,81660F;gvar_0081660F
 005F3FA6    mov         ecx,8
 005F3FAB    rep movs    dword ptr [edi],dword ptr [esi]
 005F3FAD    mov         esi,5F42A8
 005F3FB2    mov         edi,816E70;gvar_00816E70:Integer
 005F3FB7    mov         ecx,8
 005F3FBC    rep movs    dword ptr [edi],dword ptr [esi]
 005F3FBE    cmp         byte ptr ds:[8162F6],0;gvar_008162F6
>005F3FC5    jne         005F3FCE
 005F3FC7    xor         eax,eax
>005F3FC9    jmp         005F429D
 005F3FCE    call        005F445C
 005F3FD3    test        al,al
>005F3FD5    je          005F3FDE
 005F3FD7    xor         eax,eax
>005F3FD9    jmp         005F429D
 005F3FDE    mov         eax,5F42D4;'StartKeyboardMonitor'
 005F3FE3    call        004FA5FC
 005F3FE8    cmp         byte ptr ds:[8162F8],0;gvar_008162F8
>005F3FEF    je          005F3FF6
 005F3FF1    call        005F1A20
 005F3FF6    push        0
 005F3FF8    push        816630;gvar_00816630:Single
 005F3FFD    push        0
 005F3FFF    push        0A
 005F4001    call        user32.SystemParametersInfoW
 005F4006    push        0
 005F4008    push        816634;gvar_00816634:Single
 005F400D    push        0
 005F400F    push        16
 005F4011    call        user32.SystemParametersInfoW
 005F4016    mov         eax,[00816630];gvar_00816630:Single
 005F401B    mov         [00816638],eax;gvar_00816638
 005F4020    mov         eax,[00816634];gvar_00816634:Single
 005F4025    mov         [0081663C],eax;gvar_0081663C
 005F402A    fild        dword ptr ds:[816630];gvar_00816630:Single
 005F4030    add         esp,0FFFFFFF8
 005F4033    fstp        qword ptr [esp]
 005F4036    wait
 005F4037    push        0
 005F4039    push        0
 005F403B    push        403F0000
 005F4040    push        0
 005F4042    push        40040000
 005F4047    push        0
 005F4049    push        403E0000
 005F404E    push        0
 005F4050    call        00670448
 005F4055    fstp        qword ptr ds:[816648];gvar_00816648:Double
 005F405B    wait
 005F405C    fild        dword ptr ds:[816634];gvar_00816634:Single
 005F4062    add         esp,0FFFFFFF8
 005F4065    fstp        qword ptr [esp]
 005F4068    wait
 005F4069    push        0
 005F406B    push        0
 005F406D    push        40080000
 005F4072    push        0
 005F4074    push        3FD00000
 005F4079    push        0
 005F407B    push        3FF00000
 005F4080    push        0
 005F4082    call        00670448
 005F4087    fstp        qword ptr ds:[816640];gvar_00816640:Double
 005F408D    wait
 005F408E    fld         qword ptr ds:[816648];gvar_00816648:Double
 005F4094    fcomp       dword ptr ds:[5F4300];0:Single
 005F409A    wait
 005F409B    fnstsw      al
 005F409D    sahf
>005F409E    jne         005F40B4
 005F40A0    xor         eax,eax
 005F40A2    mov         dword ptr ds:[816650],eax;gvar_00816650:Double
 005F40A8    mov         dword ptr ds:[816654],404E0000;gvar_00816654
>005F40B2    jmp         005F40C7
 005F40B4    fld         dword ptr ds:[5F4304];1:Single
 005F40BA    fdiv        qword ptr ds:[816648];gvar_00816648:Double
 005F40C0    fstp        qword ptr ds:[816650];gvar_00816650:Double
 005F40C6    wait
 005F40C7    mov         byte ptr ds:[816658],1;gvar_00816658:Boolean
 005F40CE    mov         byte ptr ds:[816659],0;gvar_00816659:Boolean
 005F40D5    mov         eax,816660;gvar_00816660:Pointer
 005F40DA    xor         ecx,ecx
 005F40DC    mov         edx,800
 005F40E1    call        @FillChar
 005F40E6    xor         eax,eax
 005F40E8    mov         dword ptr ds:[816650],eax;gvar_00816650:Double
 005F40EE    mov         dword ptr ds:[816654],eax;gvar_00816654
 005F40F4    mov         byte ptr ds:[816E60],0;gvar_00816E60
 005F40FB    mov         byte ptr ds:[816404],1;gvar_00816404
 005F4102    mov         eax,8162C0;gvar_008162C0:Pointer
 005F4107    xor         ecx,ecx
 005F4109    mov         edx,35
 005F410E    call        @FillChar
 005F4113    mov         eax,5F4314;'keyboard'
 005F4118    call        005FCBA0
 005F411D    mov         eax,78BCFC;gvar_0078BCFC:IInterface
 005F4122    call        @IntfClear
 005F4127    cmp         byte ptr ds:[8162F7],0;gvar_008162F7
>005F412E    je          005F41BF
 005F4134    mov         eax,[0078D818];^gvar_0078BD00:HWND
 005F4139    mov         eax,dword ptr [eax]
 005F413B    call        005FD6CC
 005F4140    test        eax,eax
>005F4142    jne         005F429B
 005F4148    mov         byte ptr ds:[8162F7],0;gvar_008162F7
 005F414F    push        0
 005F4151    mov         eax,78BCFC;gvar_0078BCFC:IInterface
 005F4156    call        @IntfClear
 005F415B    push        eax
 005F415C    mov         eax,[0078CE34];^gvar_0078A0F8
 005F4161    push        eax
 005F4162    mov         eax,[0078D628];^gvar_0078BD08:IInterface
 005F4167    mov         eax,dword ptr [eax]
 005F4169    push        eax
 005F416A    mov         eax,dword ptr [eax]
 005F416C    call        dword ptr [eax+0C]
 005F416F    call        OleCheck
 005F4174    push        0A
 005F4176    mov         eax,[0078D590];^Application:TApplication
 005F417B    mov         eax,dword ptr [eax]
 005F417D    mov         eax,dword ptr [eax+170];TApplication.FHandle:HWND
 005F4183    push        eax
 005F4184    mov         eax,[0078BCFC];0x0 gvar_0078BCFC:IInterface
 005F4189    push        eax
 005F418A    mov         eax,dword ptr [eax]
 005F418C    call        dword ptr [eax+34]
 005F418F    call        OleCheck
 005F4194    mov         eax,[0078CBD0];^gvar_0078B1E0
 005F4199    push        eax
 005F419A    mov         eax,[0078BCFC];0x0 gvar_0078BCFC:IInterface
 005F419F    push        eax
 005F41A0    mov         eax,dword ptr [eax]
 005F41A2    call        dword ptr [eax+2C]
 005F41A5    call        OleCheck
 005F41AA    mov         eax,[0078BCFC];0x0 gvar_0078BCFC:IInterface
 005F41AF    push        eax
 005F41B0    mov         eax,dword ptr [eax]
 005F41B2    call        dword ptr [eax+1C]
 005F41B5    call        OleCheck
>005F41BA    jmp         005F429B
 005F41BF    push        0
 005F41C1    mov         eax,78BCFC;gvar_0078BCFC:IInterface
 005F41C6    call        @IntfClear
 005F41CB    push        eax
 005F41CC    mov         eax,[0078CE34];^gvar_0078A0F8
 005F41D1    push        eax
 005F41D2    mov         eax,[0078D628];^gvar_0078BD08:IInterface
 005F41D7    mov         eax,dword ptr [eax]
 005F41D9    push        eax
 005F41DA    mov         eax,dword ptr [eax]
 005F41DC    call        dword ptr [eax+0C]
 005F41DF    call        OleCheck
 005F41E4    push        esp
 005F41E5    mov         eax,[0078BCFC];0x0 gvar_0078BCFC:IInterface
 005F41EA    push        eax
 005F41EB    mov         eax,dword ptr [eax]
 005F41ED    call        dword ptr [eax+3C]
 005F41F0    push        0A
 005F41F2    mov         eax,[0078D590];^Application:TApplication
 005F41F7    mov         eax,dword ptr [eax]
 005F41F9    mov         eax,dword ptr [eax+170];TApplication.FHandle:HWND
 005F41FF    push        eax
 005F4200    mov         eax,[0078BCFC];0x0 gvar_0078BCFC:IInterface
 005F4205    push        eax
 005F4206    mov         eax,dword ptr [eax]
 005F4208    call        dword ptr [eax+34]
 005F420B    call        OleCheck
 005F4210    mov         eax,[0078CBD0];^gvar_0078B1E0
 005F4215    push        eax
 005F4216    mov         eax,[0078BCFC];0x0 gvar_0078BCFC:IInterface
 005F421B    push        eax
 005F421C    mov         eax,dword ptr [eax]
 005F421E    call        dword ptr [eax+2C]
 005F4221    call        OleCheck
 005F4226    mov         eax,[0078BCFC];0x0 gvar_0078BCFC:IInterface
 005F422B    push        eax
 005F422C    mov         eax,dword ptr [eax]
 005F422E    call        dword ptr [eax+1C]
 005F4231    call        OleCheck
 005F4236    mov         dword ptr [esp+244],14
 005F4241    mov         dword ptr [esp+248],10
 005F424C    mov         dword ptr [esp+250],1
 005F4257    mov         dword ptr [esp+24C],94
 005F4262    lea         eax,[esp+244]
 005F4269    push        eax
 005F426A    push        17
 005F426C    mov         eax,[0078BCFC];0x0 gvar_0078BCFC:IInterface
 005F4271    push        eax
 005F4272    mov         eax,dword ptr [eax]
 005F4274    call        dword ptr [eax+14]
 005F4277    test        eax,80000000
 005F427C    sete        al
 005F427F    neg         al
 005F4281    sbb         eax,eax
 005F4283    test        eax,eax
>005F4285    je          005F4294
 005F4287    cmp         dword ptr [esp+254],29
 005F428F    sete        al
>005F4292    jmp         005F4296
 005F4294    xor         eax,eax
 005F4296    mov         [0081665A],al;gvar_0081665A
 005F429B    mov         al,1
 005F429D    add         esp,258
 005F42A3    pop         edi
 005F42A4    pop         esi
 005F42A5    ret
*}
end;

//005F4328
{*function sub_005F4328:?;
begin
 005F4328    push        esi
 005F4329    push        edi
 005F432A    call        005F445C
 005F432F    test        al,al
>005F4331    jne         005F4338
 005F4333    xor         eax,eax
 005F4335    pop         edi
 005F4336    pop         esi
 005F4337    ret
 005F4338    mov         eax,5F43C4;'StopKeyboardMonitor'
 005F433D    call        004FA5FC
 005F4342    cmp         byte ptr ds:[8162F8],0;gvar_008162F8
>005F4349    je          005F4350
 005F434B    call        005F1A78
 005F4350    mov         byte ptr ds:[8162F8],0;gvar_008162F8
 005F4357    mov         byte ptr ds:[816404],0;gvar_00816404
 005F435E    cmp         dword ptr ds:[78BCFC],0;gvar_0078BCFC:IInterface
>005F4365    je          005F437E
 005F4367    mov         eax,[0078BCFC];0x0 gvar_0078BCFC:IInterface
 005F436C    push        eax
 005F436D    mov         eax,dword ptr [eax]
 005F436F    call        dword ptr [eax+20]
 005F4372    mov         edx,eax
 005F4374    mov         eax,5F43F8;'Unaquire keyboard'
 005F4379    call        005FF2AC
 005F437E    cmp         byte ptr ds:[8162F7],0;gvar_008162F7
>005F4385    je          005F438C
 005F4387    call        005FD5B0
 005F438C    mov         eax,78BCFC;gvar_0078BCFC:IInterface
 005F4391    call        @IntfClear
 005F4396    mov         eax,5F4428;'Keyboard'
 005F439B    call        005FCC94
 005F43A0    mov         esi,5F443C
 005F43A5    mov         edi,81660F;gvar_0081660F
 005F43AA    mov         ecx,8
 005F43AF    rep movs    dword ptr [edi],dword ptr [esi]
 005F43B1    mov         al,1
 005F43B3    pop         edi
 005F43B4    pop         esi
 005F43B5    ret
end;*}

//005F445C
{*function sub_005F445C:?;
begin
 005F445C    movzx       eax,byte ptr ds:[816404];gvar_00816404
 005F4463    ret
end;*}

//005F4464
{*function sub_005F4464(?:?):?;
begin
 005F4464    push        ebx
 005F4465    mov         ebx,eax
 005F4467    call        005F445C
 005F446C    test        al,al
>005F446E    jne         005F4474
 005F4470    xor         eax,eax
 005F4472    pop         ebx
 005F4473    ret
 005F4474    push        ebx
 005F4475    push        100
 005F447A    mov         eax,[0078BCFC];0x0 gvar_0078BCFC:IInterface
 005F447F    push        eax
 005F4480    mov         eax,dword ptr [eax]
 005F4482    call        dword ptr [eax+24]
 005F4485    call        OleCheck
 005F448A    mov         al,1
 005F448C    pop         ebx
 005F448D    ret
end;*}

//005F4490
{*function sub_005F4490:?;
begin
 005F4490    cmp         byte ptr ds:[81631D],7F;gvar_0081631D
>005F4497    jbe         005F44AB
 005F4499    cmp         byte ptr ds:[81631B],7F;gvar_0081631B
>005F44A0    jbe         005F44AB
 005F44A2    cmp         byte ptr ds:[816316],7F;gvar_00816316
>005F44A9    ja          005F44AF
 005F44AB    xor         eax,eax
>005F44AD    jmp         005F44B1
 005F44AF    mov         al,1
 005F44B1    test        al,al
>005F44B3    je          005F44C7
 005F44B5    cmp         byte ptr ds:[81632E],7F;gvar_0081632E
>005F44BC    ja          005F44CA
 005F44BE    cmp         byte ptr ds:[81633A],7F;gvar_0081633A
>005F44C5    ja          005F44CA
 005F44C7    xor         eax,eax
 005F44C9    ret
 005F44CA    mov         al,1
 005F44CC    ret
end;*}

//005F44D0
{*function sub_005F44D0(?:?):?;
begin
 005F44D0    cmp         eax,2F
>005F44D3    ja          005F4657
 005F44D9    jmp         dword ptr [eax*4+5F44E0]
 005F44D9    dd          005F4657
 005F44D9    dd          005F45A0
 005F44D9    dd          005F45A6
 005F44D9    dd          005F45AC
 005F44D9    dd          005F45B2
 005F44D9    dd          005F45B8
 005F44D9    dd          005F45BE
 005F44D9    dd          005F45C4
 005F44D9    dd          005F45CA
 005F44D9    dd          005F45D0
 005F44D9    dd          005F45D6
 005F44D9    dd          005F45DC
 005F44D9    dd          005F45E2
 005F44D9    dd          005F45E8
 005F44D9    dd          005F45EE
 005F44D9    dd          005F45F4
 005F44D9    dd          005F45FA
 005F44D9    dd          005F4657
 005F44D9    dd          005F4657
 005F44D9    dd          005F4657
 005F44D9    dd          005F4657
 005F44D9    dd          005F4657
 005F44D9    dd          005F4657
 005F44D9    dd          005F4657
 005F44D9    dd          005F4657
 005F44D9    dd          005F4657
 005F44D9    dd          005F4657
 005F44D9    dd          005F4600
 005F44D9    dd          005F4606
 005F44D9    dd          005F4609
 005F44D9    dd          005F460F
 005F44D9    dd          005F4615
 005F44D9    dd          005F461B
 005F44D9    dd          005F4621
 005F44D9    dd          005F4627
 005F44D9    dd          005F462D
 005F44D9    dd          005F4657
 005F44D9    dd          005F4633
 005F44D9    dd          005F4657
 005F44D9    dd          005F4639
 005F44D9    dd          005F463F
 005F44D9    dd          005F4645
 005F44D9    dd          005F464B
 005F44D9    dd          005F4657
 005F44D9    dd          005F4657
 005F44D9    dd          005F4657
 005F44D9    dd          005F4651
 005F44D9    dd          005F4651
 005F45A0    mov         eax,0EA
 005F45A5    ret
 005F45A6    mov         eax,0E9
 005F45AB    ret
 005F45AC    mov         eax,0E7
 005F45B1    ret
 005F45B2    mov         eax,0E8
 005F45B7    ret
 005F45B8    mov         eax,0E5
 005F45BD    ret
 005F45BE    mov         eax,0E6
 005F45C3    ret
 005F45C4    mov         eax,0B2
 005F45C9    ret
 005F45CA    mov         eax,0A0
 005F45CF    ret
 005F45D0    mov         eax,0AE
 005F45D5    ret
 005F45D6    mov         eax,0B0
 005F45DB    ret
 005F45DC    mov         eax,99
 005F45E1    ret
 005F45E2    mov         eax,90
 005F45E7    ret
 005F45E8    mov         eax,0A4
 005F45ED    ret
 005F45EE    mov         eax,0A2
 005F45F3    ret
 005F45F4    mov         eax,0EC
 005F45F9    ret
 005F45FA    mov         eax,0ED
 005F45FF    ret
 005F4600    mov         eax,0BB
 005F4605    ret
 005F4606    xor         eax,eax
 005F4608    ret
 005F4609    mov         eax,0BE
 005F460E    ret
 005F460F    mov         eax,0BF
 005F4614    ret
 005F4615    mov         eax,0C0
 005F461A    ret
 005F461B    mov         eax,0D7
 005F4620    ret
 005F4621    mov         eax,0D8
 005F4626    ret
 005F4627    mov         eax,88
 005F462C    ret
 005F462D    mov         eax,87
 005F4632    ret
 005F4633    mov         eax,97
 005F4638    ret
 005F4639    mov         eax,0C1
 005F463E    ret
 005F463F    mov         eax,0C2
 005F4644    ret
 005F4645    mov         eax,0C3
 005F464A    ret
 005F464B    mov         eax,0A3
 005F4650    ret
 005F4651    mov         eax,0A2
 005F4656    ret
 005F4657    xor         eax,eax
 005F4659    ret
end;*}

//005F465C
{*function sub_005F465C(?:?):?;
begin
 005F465C    cmp         eax,0BF
>005F4661    jg          005F474E
>005F4667    je          005F488D
 005F466D    cmp         eax,0A2
>005F4672    jg          005F46C9
>005F4674    je          005F4869
 005F467A    cmp         eax,90
>005F467F    jg          005F46A7
>005F4681    je          005F485D
 005F4687    sub         eax,1
>005F468A    jb          005F4881
 005F4690    sub         eax,86
>005F4695    je          005F48AB
 005F469B    dec         eax
>005F469C    je          005F48A5
>005F46A2    jmp         005F48CF
 005F46A7    sub         eax,97
>005F46AC    je          005F48B1
 005F46B2    sub         eax,2
>005F46B5    je          005F4857
 005F46BB    sub         eax,7
>005F46BE    je          005F4845
>005F46C4    jmp         005F48CF
 005F46C9    add         eax,0FFFFFF5D
 005F46CE    cmp         eax,1B
>005F46D1    ja          005F48CF
 005F46D7    jmp         dword ptr [eax*4+5F46DE]
 005F46D7    dd          005F48C9
 005F46D7    dd          005F4863
 005F46D7    dd          005F48CF
 005F46D7    dd          005F48CF
 005F46D7    dd          005F48CF
 005F46D7    dd          005F48CF
 005F46D7    dd          005F48CF
 005F46D7    dd          005F48CF
 005F46D7    dd          005F48CF
 005F46D7    dd          005F48CF
 005F46D7    dd          005F48CF
 005F46D7    dd          005F484B
 005F46D7    dd          005F48CF
 005F46D7    dd          005F4851
 005F46D7    dd          005F48CF
 005F46D7    dd          005F483F
 005F46D7    dd          005F48CF
 005F46D7    dd          005F48CF
 005F46D7    dd          005F48CF
 005F46D7    dd          005F48CF
 005F46D7    dd          005F48CF
 005F46D7    dd          005F48CF
 005F46D7    dd          005F48CF
 005F46D7    dd          005F48CF
 005F46D7    dd          005F487B
 005F46D7    dd          005F48CF
 005F46D7    dd          005F48CF
 005F46D7    dd          005F4887
 005F474E    add         eax,0FFFFFF40
 005F4753    cmp         eax,2D
>005F4756    ja          005F48CF
 005F475C    jmp         dword ptr [eax*4+5F4763]
 005F475C    dd          005F4893
 005F475C    dd          005F48B7
 005F475C    dd          005F48BD
 005F475C    dd          005F48C3
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F4899
 005F475C    dd          005F489F
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F48CF
 005F475C    dd          005F4833
 005F475C    dd          005F4839
 005F475C    dd          005F4827
 005F475C    dd          005F482D
 005F475C    dd          005F4821
 005F475C    dd          005F481B
 005F475C    dd          005F48CF
 005F475C    dd          005F486F
 005F475C    dd          005F4875
 005F481B    mov         eax,1
 005F4820    ret
 005F4821    mov         eax,2
 005F4826    ret
 005F4827    mov         eax,3
 005F482C    ret
 005F482D    mov         eax,4
 005F4832    ret
 005F4833    mov         eax,5
 005F4838    ret
 005F4839    mov         eax,6
 005F483E    ret
 005F483F    mov         eax,7
 005F4844    ret
 005F4845    mov         eax,8
 005F484A    ret
 005F484B    mov         eax,9
 005F4850    ret
 005F4851    mov         eax,0A
 005F4856    ret
 005F4857    mov         eax,0B
 005F485C    ret
 005F485D    mov         eax,0C
 005F4862    ret
 005F4863    mov         eax,0D
 005F4868    ret
 005F4869    mov         eax,0E
 005F486E    ret
 005F486F    mov         eax,0F
 005F4874    ret
 005F4875    mov         eax,10
 005F487A    ret
 005F487B    mov         eax,1B
 005F4880    ret
 005F4881    mov         eax,1C
 005F4886    ret
 005F4887    mov         eax,1D
 005F488C    ret
 005F488D    mov         eax,1E
 005F4892    ret
 005F4893    mov         eax,1F
 005F4898    ret
 005F4899    mov         eax,20
 005F489E    ret
 005F489F    mov         eax,21
 005F48A4    ret
 005F48A5    mov         eax,22
 005F48AA    ret
 005F48AB    mov         eax,23
 005F48B0    ret
 005F48B1    mov         eax,25
 005F48B6    ret
 005F48B7    mov         eax,27
 005F48BC    ret
 005F48BD    mov         eax,28
 005F48C2    ret
 005F48C3    mov         eax,29
 005F48C8    ret
 005F48C9    mov         eax,2A
 005F48CE    ret
 005F48CF    xor         eax,eax
 005F48D1    ret
end;*}

//005F48D4
{*function sub_005F48D4(?:?):?;
begin
 005F48D4    cmp         eax,25
>005F48D7    jg          005F48EB
>005F48D9    je          005F4909
 005F48DB    dec         eax
 005F48DC    sub         eax,10
>005F48DF    jb          005F48FD
 005F48E1    add         eax,0FFFFFFF6
 005F48E4    sub         eax,9
>005F48E7    jb          005F4903
>005F48E9    jmp         005F4915
 005F48EB    add         eax,0FFFFFFD9
 005F48EE    sub         eax,4
>005F48F1    jb          005F4909
 005F48F3    add         eax,0FFFFFFFD
 005F48F6    sub         eax,2
>005F48F9    jb          005F490F
>005F48FB    jmp         005F4915
 005F48FD    mov         eax,0FE
 005F4902    ret
 005F4903    mov         eax,14
 005F4908    ret
 005F4909    mov         eax,14
 005F490E    ret
 005F490F    mov         eax,0FE
 005F4914    ret
 005F4915    mov         eax,14
 005F491A    ret
end;*}

//005F491C
{*procedure sub_005F491C(?:?);
begin
 005F491C    push        ebx
 005F491D    add         esp,0FFFFFFE0
 005F4920    mov         ebx,eax
 005F4922    mov         dword ptr [esp+4],1
 005F492A    call        005FCDA0
 005F492F    test        al,al
>005F4931    je          005F4955
 005F4933    mov         word ptr [esp+8],0
 005F493A    mov         eax,ebx
 005F493C    call        0060058C
 005F4941    and         al,7F
 005F4943    movzx       eax,al
 005F4946    mov         word ptr [esp+0A],ax
 005F494B    mov         dword ptr [esp+0C],8
>005F4953    jmp         005F4978
 005F4955    mov         eax,ebx
 005F4957    call        005FCDC8
 005F495C    mov         word ptr [esp+8],ax
 005F4961    mov         eax,ebx
 005F4963    call        0060058C
 005F4968    and         al,7F
 005F496A    movzx       eax,al
 005F496D    mov         word ptr [esp+0A],ax
 005F4972    xor         eax,eax
 005F4974    mov         dword ptr [esp+0C],eax
 005F4978    xor         eax,eax
 005F497A    mov         dword ptr [esp+10],eax
 005F497E    xor         eax,eax
 005F4980    mov         dword ptr [esp+14],eax
 005F4984    mov         eax,ebx
 005F4986    call        0060058C
 005F498B    cmp         al,80
>005F498D    jb          005F4994
 005F498F    or          dword ptr [esp+0C],1
 005F4994    push        1C
 005F4996    lea         eax,[esp+8]
 005F499A    push        eax
 005F499B    push        1
 005F499D    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005F49A2    mov         eax,dword ptr [eax]
 005F49A4    call        eax
 005F49A6    mov         dword ptr [esp],eax
 005F49A9    add         esp,20
 005F49AC    pop         ebx
 005F49AD    ret
end;*}

//005F49B0
{*function sub_005F49B0:?;
begin
 005F49B0    push        ebx
 005F49B1    push        esi
 005F49B2    push        edi
 005F49B3    push        ebp
 005F49B4    add         esp,0FFFFFED4
 005F49BA    call        00682F08
 005F49BF    fstp        qword ptr [esp]
 005F49C2    wait
 005F49C3    push        90
 005F49C8    call        user32.GetKeyState
 005F49CD    test        al,1
 005F49CF    setne       byte ptr ds:[816E90];gvar_00816E90
 005F49D6    push        14
 005F49D8    call        user32.GetKeyState
 005F49DD    test        al,1
 005F49DF    setne       byte ptr ds:[816E91];gvar_00816E91
 005F49E6    push        91
 005F49EB    call        user32.GetKeyState
 005F49F0    test        al,1
 005F49F2    setne       byte ptr ds:[816E92];gvar_00816E92
 005F49F9    push        15
 005F49FB    call        user32.GetKeyState
 005F4A00    test        al,1
 005F4A02    setne       byte ptr ds:[816E93];gvar_00816E93
 005F4A09    push        2D
 005F4A0B    call        user32.GetKeyState
 005F4A10    test        al,1
 005F4A12    setne       byte ptr ds:[816E94];gvar_00816E94
 005F4A19    cmp         byte ptr ds:[8162F7],0;gvar_008162F7
>005F4A20    je          005F4B51
 005F4A26    mov         edi,dword ptr ds:[78CE98];^gvar_008177F4
 005F4A2C    mov         edi,dword ptr [edi]
 005F4A2E    dec         edi
 005F4A2F    test        edi,edi
>005F4A31    jl          005F4AF6
 005F4A37    inc         edi
 005F4A38    mov         ebx,dword ptr ds:[78CC38];^gvar_00817070
 005F4A3E    add         ebx,0F
 005F4A41    push        edi
 005F4A42    mov         esi,ebx
 005F4A44    lea         edi,[esp+110]
 005F4A4B    mov         ecx,8
 005F4A50    rep movs    dword ptr [edi],dword ptr [esi]
 005F4A52    pop         edi
 005F4A53    lea         eax,[esp+10C]
 005F4A5A    lea         edx,[ebx+20]
 005F4A5D    mov         cl,20
 005F4A5F    call        @SetUnion
 005F4A64    push        edi
 005F4A65    lea         esi,[esp+110]
 005F4A6C    lea         edi,[ebx+40]
 005F4A6F    mov         ecx,8
 005F4A74    rep movs    dword ptr [edi],dword ptr [esi]
 005F4A76    pop         edi
 005F4A77    push        edi
 005F4A78    mov         esi,5F4CE0
 005F4A7D    lea         edi,[ebx+20]
 005F4A80    mov         ecx,8
 005F4A85    rep movs    dword ptr [edi],dword ptr [esi]
 005F4A87    pop         edi
 005F4A88    fld         qword ptr [ebx+61]
 005F4A8B    fcomp       dword ptr ds:[5F4D00];0:Single
 005F4A91    wait
 005F4A92    fnstsw      al
 005F4A94    sahf
>005F4A95    je          005F4AEC
 005F4A97    fld         qword ptr [esp]
 005F4A9A    fsub        qword ptr [ebx+61]
 005F4A9D    fabs
 005F4A9F    fld         tbyte ptr ds:[5F4D04];0.1:Extended
 005F4AA5    fcompp
 005F4AA7    wait
 005F4AA8    fnstsw      al
 005F4AAA    sahf
>005F4AAB    jae         005F4AEC
 005F4AAD    push        edi
 005F4AAE    mov         esi,ebx
 005F4AB0    lea         edi,[esp+110]
 005F4AB7    mov         ecx,8
 005F4ABC    rep movs    dword ptr [edi],dword ptr [esi]
 005F4ABE    pop         edi
 005F4ABF    lea         eax,[esp+10C]
 005F4AC6    mov         edx,5F4D10
 005F4ACB    mov         cl,20
 005F4ACD    call        @SetSub
 005F4AD2    push        edi
 005F4AD3    lea         esi,[esp+110]
 005F4ADA    mov         edi,ebx
 005F4ADC    mov         ecx,8
 005F4AE1    rep movs    dword ptr [edi],dword ptr [esi]
 005F4AE3    pop         edi
 005F4AE4    xor         eax,eax
 005F4AE6    mov         dword ptr [ebx+61],eax
 005F4AE9    mov         dword ptr [ebx+65],eax
 005F4AEC    add         ebx,78
 005F4AEF    dec         edi
>005F4AF0    jne         005F4A41
 005F4AF6    xor         esi,esi
 005F4AF8    mov         dword ptr [esp+8],816304;gvar_00816304:Pointer
 005F4B00    xor         edx,edx
 005F4B02    mov         edi,dword ptr ds:[78CE98];^gvar_008177F4
 005F4B08    mov         edi,dword ptr [edi]
 005F4B0A    dec         edi
 005F4B0B    test        edi,edi
>005F4B0D    jl          005F4B37
 005F4B0F    inc         edi
 005F4B10    mov         eax,[0078CC38];^gvar_00817070
 005F4B15    add         eax,4F
 005F4B18    test        dl,dl
>005F4B1A    jne         005F4B2F
 005F4B1C    mov         edx,esi
 005F4B1E    cmp         edx,0FF
>005F4B24    ja          005F4B29
 005F4B26    bt          dword ptr [eax],edx
>005F4B29    jb          005F4B2F
 005F4B2B    xor         edx,edx
>005F4B2D    jmp         005F4B31
 005F4B2F    mov         dl,1
 005F4B31    add         eax,78
 005F4B34    dec         edi
>005F4B35    jne         005F4B18
 005F4B37    shl         edx,7
 005F4B3A    mov         eax,dword ptr [esp+8]
 005F4B3E    mov         byte ptr [eax],dl
 005F4B40    inc         esi
 005F4B41    inc         dword ptr [esp+8]
 005F4B45    cmp         esi,100
>005F4B4B    jne         005F4B00
 005F4B4D    mov         bl,1
>005F4B4F    jmp         005F4BAF
 005F4B51    cmp         byte ptr ds:[81665A],0;gvar_0081665A
>005F4B58    je          005F4BA3
 005F4B5A    lea         eax,[esp+0C]
 005F4B5E    call        005F4464
 005F4B63    mov         ebx,eax
 005F4B65    xor         esi,esi
 005F4B67    lea         edi,[esp+0C]
 005F4B6B    mov         eax,esi
 005F4B6D    call        005F192C
 005F4B72    movzx       ebp,ax
 005F4B75    cmp         esi,1A
>005F4B78    je          005F4B7F
 005F4B7A    cmp         esi,1B
>005F4B7D    jne         005F4B8A
 005F4B7F    movzx       eax,byte ptr [edi]
 005F4B82    mov         byte ptr [ebp+816304],al;gvar_00816304:Pointer
>005F4B88    jmp         005F4B97
 005F4B8A    movzx       eax,byte ptr [edi]
 005F4B8D    or          al,byte ptr [esp+ebp+0C]
 005F4B91    mov         byte ptr [ebp+816304],al;gvar_00816304:Pointer
 005F4B97    inc         esi
 005F4B98    inc         edi
 005F4B99    cmp         esi,100
>005F4B9F    jne         005F4B6B
>005F4BA1    jmp         005F4BAF
 005F4BA3    mov         eax,816304;gvar_00816304:Pointer
 005F4BA8    call        005F4464
 005F4BAD    mov         ebx,eax
 005F4BAF    mov         ebp,1
 005F4BB4    mov         edi,8162C1;gvar_008162C1
 005F4BB9    cmp         byte ptr [edi],0
>005F4BBC    jbe         005F4BFD
 005F4BBE    inc         byte ptr [edi]
 005F4BC0    cmp         byte ptr ds:[8162F7],0;gvar_008162F7
>005F4BC7    je          005F4BDC
 005F4BC9    mov         eax,ebp
 005F4BCB    call        005F48D4
 005F4BD0    movzx       edx,byte ptr [edi]
 005F4BD3    cmp         eax,edx
>005F4BD5    jge         005F4BE4
 005F4BD7    mov         byte ptr [edi],0
>005F4BDA    jmp         005F4BE4
 005F4BDC    cmp         byte ptr [edi],14
>005F4BDF    jbe         005F4BE4
 005F4BE1    mov         byte ptr [edi],0
 005F4BE4    mov         eax,ebp
 005F4BE6    call        005F44D0
 005F4BEB    mov         esi,eax
 005F4BED    test        esi,esi
>005F4BEF    jle         005F4BFD
 005F4BF1    cmp         byte ptr [edi],3
>005F4BF4    jbe         005F4BFD
 005F4BF6    or          byte ptr [esi+816304],80;gvar_00816304:Pointer
 005F4BFD    inc         ebp
 005F4BFE    inc         edi
 005F4BFF    cmp         ebp,35
>005F4C02    jne         005F4BB9
 005F4C04    xor         esi,esi
 005F4C06    mov         eax,816304;gvar_00816304:Pointer
 005F4C0B    mov         edx,esi
 005F4C0D    cmp         edx,0FF
>005F4C13    ja          005F4C1C
 005F4C15    bt          dword ptr ds:[81660F],edx;gvar_0081660F
>005F4C1C    jae         005F4C21
 005F4C1E    or          byte ptr [eax],80
 005F4C21    inc         esi
 005F4C22    inc         eax
 005F4C23    cmp         esi,100
>005F4C29    jne         005F4C0B
 005F4C2B    call        005F4490
 005F4C30    test        al,al
>005F4C32    je          005F4C3C
 005F4C34    mov         eax,[0078D7B0];^gvar_0078C988
 005F4C39    mov         byte ptr [eax],1
 005F4C3C    cmp         byte ptr ds:[816658],0;gvar_00816658:Boolean
>005F4C43    je          005F4CD0
 005F4C49    cmp         byte ptr ds:[816659],0;gvar_00816659:Boolean
>005F4C50    je          005F4C93
 005F4C52    xor         esi,esi
 005F4C54    mov         edi,816660;gvar_00816660:Pointer
 005F4C59    fld         qword ptr [edi]
 005F4C5B    fcomp       dword ptr ds:[5F4D00];0:Single
 005F4C61    wait
 005F4C62    fnstsw      al
 005F4C64    sahf
>005F4C65    je          005F4C85
 005F4C67    fld         qword ptr [edi]
 005F4C69    fcomp       qword ptr [esp]
 005F4C6C    wait
 005F4C6D    fnstsw      al
 005F4C6F    sahf
>005F4C70    ja          005F4C85
 005F4C72    fld         qword ptr [esp]
 005F4C75    fadd        qword ptr ds:[816650];gvar_00816650:Double
 005F4C7B    fstp        qword ptr [edi]
 005F4C7D    wait
 005F4C7E    mov         eax,esi
 005F4C80    call        005F491C
 005F4C85    inc         esi
 005F4C86    add         edi,8
 005F4C89    cmp         esi,100
>005F4C8F    jne         005F4C59
>005F4C91    jmp         005F4CD0
 005F4C93    fld         qword ptr ds:[816E68];gvar_00816E68:Double
 005F4C99    fcomp       dword ptr ds:[5F4D00];0:Single
 005F4C9F    wait
 005F4CA0    fnstsw      al
 005F4CA2    sahf
>005F4CA3    je          005F4CD0
 005F4CA5    fld         qword ptr ds:[816E68];gvar_00816E68:Double
 005F4CAB    fcomp       qword ptr [esp]
 005F4CAE    wait
 005F4CAF    fnstsw      al
 005F4CB1    sahf
>005F4CB2    ja          005F4CD0
 005F4CB4    fld         qword ptr [esp]
 005F4CB7    fadd        qword ptr ds:[816650];gvar_00816650:Double
 005F4CBD    fstp        qword ptr ds:[816E68];gvar_00816E68:Double
 005F4CC3    wait
 005F4CC4    movzx       eax,byte ptr ds:[816E60];gvar_00816E60
 005F4CCB    call        005F491C
 005F4CD0    mov         eax,ebx
 005F4CD2    add         esp,12C
 005F4CD8    pop         ebp
 005F4CD9    pop         edi
 005F4CDA    pop         esi
 005F4CDB    pop         ebx
 005F4CDC    ret
end;*}

//005F4D30
function TKey.ToString:string;
begin
{*
 005F4D30    push        ebp
 005F4D31    mov         ebp,esp
 005F4D33    push        0
 005F4D35    push        ebx
 005F4D36    push        esi
 005F4D37    mov         esi,edx
 005F4D39    mov         ebx,eax
 005F4D3B    xor         eax,eax
 005F4D3D    push        ebp
 005F4D3E    push        5F4D79
 005F4D43    push        dword ptr fs:[eax]
 005F4D46    mov         dword ptr fs:[eax],esp
 005F4D49    lea         edx,[ebp-4];{@FillChar}
 005F4D4C    mov         eax,dword ptr [ebx+20]
 005F4D4F    call        005F2178
 005F4D54    mov         ecx,dword ptr [ebp-4]
 005F4D57    mov         eax,esi
 005F4D59    mov         edx,5F4D94;'Key.'
 005F4D5E    call        @UStrCat3
 005F4D63    xor         eax,eax
 005F4D65    pop         edx
 005F4D66    pop         ecx
 005F4D67    pop         ecx
 005F4D68    mov         dword ptr fs:[eax],edx
 005F4D6B    push        5F4D80
 005F4D70    lea         eax,[ebp-4];{InternalToUnicode}
 005F4D73    call        @UStrClr
 005F4D78    ret
>005F4D79    jmp         @HandleFinally
>005F4D7E    jmp         005F4D70
 005F4D80    pop         esi
 005F4D81    pop         ebx
 005F4D82    pop         ecx
 005F4D83    pop         ebp
 005F4D84    ret
*}
end;

//005F4DA0
procedure sub_005F4DA0;
begin
{*
 005F4DA0    push        ebx
 005F4DA1    push        esi
 005F4DA2    push        edi
 005F4DA3    add         esp,0FFFFFFE4
 005F4DA6    mov         edi,esp
 005F4DA8    mov         eax,816660;gvar_00816660:Pointer
 005F4DAD    xor         ecx,ecx
 005F4DAF    mov         edx,800
 005F4DB4    call        @FillChar
 005F4DB9    xor         ebx,ebx
 005F4DBB    mov         esi,816304;gvar_00816304:Pointer
 005F4DC0    test        byte ptr [esi],80
>005F4DC3    ja          005F4DD7
 005F4DC5    mov         eax,ebx
 005F4DC7    cmp         eax,0FF
>005F4DCC    ja          005F4DD5
 005F4DCE    bt          dword ptr ds:[816E70],eax;gvar_00816E70:Integer
>005F4DD5    jae         005F4E41
 005F4DD7    mov         dword ptr [edi],1
 005F4DDD    call        005FCDA0
 005F4DE2    test        al,al
>005F4DE4    je          005F4DFF
 005F4DE6    mov         word ptr [edi+4],0
 005F4DEC    mov         eax,ebx
 005F4DEE    and         ax,7F
 005F4DF2    mov         word ptr [edi+6],ax
 005F4DF6    mov         dword ptr [edi+8],8
>005F4DFD    jmp         005F4E19
 005F4DFF    mov         eax,ebx
 005F4E01    call        005FCDC8
 005F4E06    mov         word ptr [edi+4],ax
 005F4E0A    mov         eax,ebx
 005F4E0C    and         ax,7F
 005F4E10    mov         word ptr [edi+6],ax
 005F4E14    xor         eax,eax
 005F4E16    mov         dword ptr [edi+8],eax
 005F4E19    or          dword ptr [edi+8],2
 005F4E1D    xor         eax,eax
 005F4E1F    mov         dword ptr [edi+0C],eax
 005F4E22    xor         eax,eax
 005F4E24    mov         dword ptr [edi+10],eax
 005F4E27    cmp         ebx,80
>005F4E2D    jl          005F4E33
 005F4E2F    or          dword ptr [edi+8],1
 005F4E33    push        1C
 005F4E35    push        edi
 005F4E36    push        1
 005F4E38    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005F4E3D    mov         eax,dword ptr [eax]
 005F4E3F    call        eax
 005F4E41    inc         ebx
 005F4E42    inc         esi
 005F4E43    cmp         ebx,100
>005F4E49    jne         005F4DC0
 005F4E4F    mov         esi,5F4E68
 005F4E54    mov         edi,816E70;gvar_00816E70:Integer
 005F4E59    mov         ecx,8
 005F4E5E    rep movs    dword ptr [edi],dword ptr [esi]
 005F4E60    add         esp,1C
 005F4E63    pop         edi
 005F4E64    pop         esi
 005F4E65    pop         ebx
 005F4E66    ret
*}
end;

//005F4E88
procedure TModuleKeyboard.AddFields;
begin
{*
 005F4E88    push        ebp
 005F4E89    mov         ebp,esp
 005F4E8B    xor         ecx,ecx
 005F4E8D    push        ecx
 005F4E8E    push        ecx
 005F4E8F    push        ecx
 005F4E90    push        ecx
 005F4E91    push        ecx
 005F4E92    push        ecx
 005F4E93    push        ebx
 005F4E94    push        esi
 005F4E95    mov         ebx,eax
 005F4E97    xor         eax,eax
 005F4E99    push        ebp
 005F4E9A    push        5F7F59
 005F4E9F    push        dword ptr fs:[eax]
 005F4EA2    mov         dword ptr fs:[eax],esp
 005F4EA5    xor         ecx,ecx
 005F4EA7    mov         edx,5F7F74;'Scan00'
 005F4EAC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F4EAF    call        THashTable.Add
 005F4EB4    mov         ecx,1
 005F4EB9    mov         edx,5F7F90;'Escape'
 005F4EBE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F4EC1    call        THashTable.Add
 005F4EC6    mov         ecx,2
 005F4ECB    mov         edx,5F7FAC;'One'
 005F4ED0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F4ED3    call        THashTable.Add
 005F4ED8    mov         ecx,3
 005F4EDD    mov         edx,5F7FC0;'Two'
 005F4EE2    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F4EE5    call        THashTable.Add
 005F4EEA    mov         ecx,4
 005F4EEF    mov         edx,5F7FD4;'Three'
 005F4EF4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F4EF7    call        THashTable.Add
 005F4EFC    mov         ecx,5
 005F4F01    mov         edx,5F7FEC;'Four'
 005F4F06    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F4F09    call        THashTable.Add
 005F4F0E    mov         ecx,6
 005F4F13    mov         edx,5F8004;'Five'
 005F4F18    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F4F1B    call        THashTable.Add
 005F4F20    mov         ecx,7
 005F4F25    mov         edx,5F801C;'Six'
 005F4F2A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F4F2D    call        THashTable.Add
 005F4F32    mov         ecx,8
 005F4F37    mov         edx,5F8030;'Seven'
 005F4F3C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F4F3F    call        THashTable.Add
 005F4F44    mov         ecx,9
 005F4F49    mov         edx,5F8048;'Eight'
 005F4F4E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F4F51    call        THashTable.Add
 005F4F56    mov         ecx,0A
 005F4F5B    mov         edx,5F8060;'Nine'
 005F4F60    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F4F63    call        THashTable.Add
 005F4F68    mov         ecx,0B
 005F4F6D    mov         edx,5F8078;'Zero'
 005F4F72    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F4F75    call        THashTable.Add
 005F4F7A    mov         ecx,2
 005F4F7F    mov         edx,5F8090;'1'
 005F4F84    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F4F87    call        THashTable.Add
 005F4F8C    mov         ecx,3
 005F4F91    mov         edx,5F80A0;'2'
 005F4F96    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F4F99    call        THashTable.Add
 005F4F9E    mov         ecx,4
 005F4FA3    mov         edx,5F80B0;'3'
 005F4FA8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F4FAB    call        THashTable.Add
 005F4FB0    mov         ecx,5
 005F4FB5    mov         edx,5F80C0;'4'
 005F4FBA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F4FBD    call        THashTable.Add
 005F4FC2    mov         ecx,6
 005F4FC7    mov         edx,5F80D0;'5'
 005F4FCC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F4FCF    call        THashTable.Add
 005F4FD4    mov         ecx,7
 005F4FD9    mov         edx,5F80E0;'6'
 005F4FDE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F4FE1    call        THashTable.Add
 005F4FE6    mov         ecx,8
 005F4FEB    mov         edx,5F80F0;'7'
 005F4FF0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F4FF3    call        THashTable.Add
 005F4FF8    mov         ecx,9
 005F4FFD    mov         edx,5F8100;'8'
 005F5002    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5005    call        THashTable.Add
 005F500A    mov         ecx,0A
 005F500F    mov         edx,5F8110;'9'
 005F5014    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5017    call        THashTable.Add
 005F501C    mov         ecx,0B
 005F5021    mov         edx,5F8120;'0'
 005F5026    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5029    call        THashTable.Add
 005F502E    mov         ecx,0C
 005F5033    mov         edx,5F8130;'Minus'
 005F5038    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F503B    call        THashTable.Add
 005F5040    mov         ecx,0D
 005F5045    mov         edx,5F8148;'Equals'
 005F504A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F504D    call        THashTable.Add
 005F5052    mov         ecx,0E
 005F5057    mov         edx,5F8164;'BackSpace'
 005F505C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F505F    call        THashTable.Add
 005F5064    mov         ecx,0E
 005F5069    mov         edx,5F8184;'Back'
 005F506E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5071    call        THashTable.Add
 005F5076    mov         ecx,0F
 005F507B    mov         edx,5F819C;'Tab'
 005F5080    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5083    call        THashTable.Add
 005F5088    mov         ecx,10
 005F508D    mov         edx,5F81B0;'Q'
 005F5092    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5095    call        THashTable.Add
 005F509A    mov         ecx,11
 005F509F    mov         edx,5F81C0;'W'
 005F50A4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F50A7    call        THashTable.Add
 005F50AC    mov         ecx,12
 005F50B1    mov         edx,5F81D0;'E'
 005F50B6    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F50B9    call        THashTable.Add
 005F50BE    mov         ecx,13
 005F50C3    mov         edx,5F81E0;'R'
 005F50C8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F50CB    call        THashTable.Add
 005F50D0    mov         ecx,14
 005F50D5    mov         edx,5F81F0;'T'
 005F50DA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F50DD    call        THashTable.Add
 005F50E2    mov         ecx,15
 005F50E7    mov         edx,5F8200;'Y'
 005F50EC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F50EF    call        THashTable.Add
 005F50F4    mov         ecx,16
 005F50F9    mov         edx,5F8210;'U'
 005F50FE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5101    call        THashTable.Add
 005F5106    mov         ecx,17
 005F510B    mov         edx,5F8220;'I'
 005F5110    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5113    call        THashTable.Add
 005F5118    mov         ecx,18
 005F511D    mov         edx,5F8230;'O'
 005F5122    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5125    call        THashTable.Add
 005F512A    mov         ecx,19
 005F512F    mov         edx,5F8240;'P'
 005F5134    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5137    call        THashTable.Add
 005F513C    mov         ecx,1A
 005F5141    mov         edx,5F8250;'LeftBracket'
 005F5146    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5149    call        THashTable.Add
 005F514E    mov         ecx,1B
 005F5153    mov         edx,5F8274;'RightBracket'
 005F5158    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F515B    call        THashTable.Add
 005F5160    mov         ecx,1A
 005F5165    mov         edx,5F829C;'LBracket'
 005F516A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F516D    call        THashTable.Add
 005F5172    mov         ecx,1B
 005F5177    mov         edx,5F82BC;'RBracket'
 005F517C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F517F    call        THashTable.Add
 005F5184    mov         ecx,1C
 005F5189    mov         edx,5F82DC;'Enter'
 005F518E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5191    call        THashTable.Add
 005F5196    mov         ecx,1C
 005F519B    mov         edx,5F82F4;'Return'
 005F51A0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F51A3    call        THashTable.Add
 005F51A8    mov         ecx,1D
 005F51AD    mov         edx,5F8310;'LeftControl'
 005F51B2    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F51B5    call        THashTable.Add
 005F51BA    mov         ecx,1D
 005F51BF    mov         edx,5F8334;'LControl'
 005F51C4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F51C7    call        THashTable.Add
 005F51CC    mov         ecx,1E
 005F51D1    mov         edx,5F8354;'A'
 005F51D6    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F51D9    call        THashTable.Add
 005F51DE    mov         ecx,1F
 005F51E3    mov         edx,5F8364;'S'
 005F51E8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F51EB    call        THashTable.Add
 005F51F0    mov         ecx,20
 005F51F5    mov         edx,5F8374;'D'
 005F51FA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F51FD    call        THashTable.Add
 005F5202    mov         ecx,21
 005F5207    mov         edx,5F8384;'F'
 005F520C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F520F    call        THashTable.Add
 005F5214    mov         ecx,22
 005F5219    mov         edx,5F8394;'G'
 005F521E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5221    call        THashTable.Add
 005F5226    mov         ecx,23
 005F522B    mov         edx,5F83A4;'H'
 005F5230    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5233    call        THashTable.Add
 005F5238    mov         ecx,24
 005F523D    mov         edx,5F83B4;'J'
 005F5242    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5245    call        THashTable.Add
 005F524A    mov         ecx,25
 005F524F    mov         edx,5F83C4;'K'
 005F5254    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5257    call        THashTable.Add
 005F525C    mov         ecx,26
 005F5261    mov         edx,5F83D4;'L'
 005F5266    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5269    call        THashTable.Add
 005F526E    mov         ecx,27
 005F5273    mov         edx,5F83E4;'Semicolon'
 005F5278    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F527B    call        THashTable.Add
 005F5280    mov         ecx,28
 005F5285    mov         edx,5F8404;'Apostrophe'
 005F528A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F528D    call        THashTable.Add
 005F5292    mov         ecx,28
 005F5297    mov         edx,5F8428;'Apostophe'
 005F529C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F529F    call        THashTable.Add
 005F52A4    mov         ecx,29
 005F52A9    mov         edx,5F8448;'Console'
 005F52AE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F52B1    call        THashTable.Add
 005F52B6    mov         ecx,29
 005F52BB    mov         edx,5F8464;'Grave'
 005F52C0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F52C3    call        THashTable.Add
 005F52C8    mov         ecx,2A
 005F52CD    mov         edx,5F847C;'LeftShift'
 005F52D2    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F52D5    call        THashTable.Add
 005F52DA    mov         ecx,2A
 005F52DF    mov         edx,5F849C;'LShift'
 005F52E4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F52E7    call        THashTable.Add
 005F52EC    mov         ecx,2B
 005F52F1    mov         edx,5F84B8;'Backslash'
 005F52F6    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F52F9    call        THashTable.Add
 005F52FE    mov         ecx,2C
 005F5303    mov         edx,5F84D8;'Z'
 005F5308    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F530B    call        THashTable.Add
 005F5310    mov         ecx,2D
 005F5315    mov         edx,5F84E8;'X'
 005F531A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F531D    call        THashTable.Add
 005F5322    mov         ecx,2E
 005F5327    mov         edx,5F84F8;'C'
 005F532C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F532F    call        THashTable.Add
 005F5334    mov         ecx,2F
 005F5339    mov         edx,5F8508;'V'
 005F533E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5341    call        THashTable.Add
 005F5346    mov         ecx,30
 005F534B    mov         edx,5F8518;'B'
 005F5350    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5353    call        THashTable.Add
 005F5358    mov         ecx,31
 005F535D    mov         edx,5F8528;'N'
 005F5362    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5365    call        THashTable.Add
 005F536A    mov         ecx,32
 005F536F    mov         edx,5F8538;'M'
 005F5374    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5377    call        THashTable.Add
 005F537C    mov         ecx,33
 005F5381    mov         edx,5F8548;'Comma'
 005F5386    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5389    call        THashTable.Add
 005F538E    mov         ecx,34
 005F5393    mov         edx,5F8560;'Dot'
 005F5398    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F539B    call        THashTable.Add
 005F53A0    mov         ecx,34
 005F53A5    mov         edx,5F8574;'Period'
 005F53AA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F53AD    call        THashTable.Add
 005F53B2    mov         ecx,34
 005F53B7    mov         edx,5F8590;'FullStop'
 005F53BC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F53BF    call        THashTable.Add
 005F53C4    mov         ecx,35
 005F53C9    mov         edx,5F85B0;'Slash'
 005F53CE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F53D1    call        THashTable.Add
 005F53D6    mov         ecx,36
 005F53DB    mov         edx,5F85C8;'RightShift'
 005F53E0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F53E3    call        THashTable.Add
 005F53E8    mov         ecx,36
 005F53ED    mov         edx,5F85EC;'RShift'
 005F53F2    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F53F5    call        THashTable.Add
 005F53FA    mov         ecx,37
 005F53FF    mov         edx,5F8608;'Multiply'
 005F5404    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5407    call        THashTable.Add
 005F540C    mov         ecx,38
 005F5411    mov         edx,5F8628;'LeftAlt'
 005F5416    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5419    call        THashTable.Add
 005F541E    mov         ecx,38
 005F5423    mov         edx,5F8644;'LMenu'
 005F5428    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F542B    call        THashTable.Add
 005F5430    mov         ecx,39
 005F5435    mov         edx,5F865C;'Space'
 005F543A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F543D    call        THashTable.Add
 005F5442    mov         ecx,3A
 005F5447    mov         edx,5F8674;'CapsLock'
 005F544C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F544F    call        THashTable.Add
 005F5454    mov         ecx,3A
 005F5459    mov         edx,5F8694;'Capital'
 005F545E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5461    call        THashTable.Add
 005F5466    mov         ecx,3B
 005F546B    mov         edx,5F86B0;'F1'
 005F5470    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5473    call        THashTable.Add
 005F5478    mov         ecx,3C
 005F547D    mov         edx,5F86C4;'F2'
 005F5482    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5485    call        THashTable.Add
 005F548A    mov         ecx,3D
 005F548F    mov         edx,5F86D8;'F3'
 005F5494    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5497    call        THashTable.Add
 005F549C    mov         ecx,3E
 005F54A1    mov         edx,5F86EC;'F4'
 005F54A6    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F54A9    call        THashTable.Add
 005F54AE    mov         ecx,3F
 005F54B3    mov         edx,5F8700;'F5'
 005F54B8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F54BB    call        THashTable.Add
 005F54C0    mov         ecx,40
 005F54C5    mov         edx,5F8714;'F6'
 005F54CA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F54CD    call        THashTable.Add
 005F54D2    mov         ecx,41
 005F54D7    mov         edx,5F8728;'F7'
 005F54DC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F54DF    call        THashTable.Add
 005F54E4    mov         ecx,42
 005F54E9    mov         edx,5F873C;'F8'
 005F54EE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F54F1    call        THashTable.Add
 005F54F6    mov         ecx,43
 005F54FB    mov         edx,5F8750;'F9'
 005F5500    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5503    call        THashTable.Add
 005F5508    mov         ecx,44
 005F550D    mov         edx,5F8764;'F10'
 005F5512    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5515    call        THashTable.Add
 005F551A    mov         ecx,45
 005F551F    mov         edx,5F8778;'NumLock'
 005F5524    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5527    call        THashTable.Add
 005F552C    mov         ecx,45
 005F5531    mov         edx,5F8794;'Num_Lock'
 005F5536    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5539    call        THashTable.Add
 005F553E    mov         ecx,46
 005F5543    mov         edx,5F87B4;'ScrollLock'
 005F5548    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F554B    call        THashTable.Add
 005F5550    mov         ecx,46
 005F5555    mov         edx,5F87D8;'Scroll'
 005F555A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F555D    call        THashTable.Add
 005F5562    mov         ecx,47
 005F5567    mov         edx,5F87F4;'NUMPAD7'
 005F556C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F556F    call        THashTable.Add
 005F5574    mov         ecx,47
 005F5579    mov         edx,5F8810;'NumPadHome'
 005F557E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5581    call        THashTable.Add
 005F5586    mov         ecx,48
 005F558B    mov         edx,5F8834;'NUMPAD8'
 005F5590    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5593    call        THashTable.Add
 005F5598    mov         ecx,48
 005F559D    mov         edx,5F8850;'NumPadUp'
 005F55A2    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F55A5    call        THashTable.Add
 005F55AA    mov         ecx,49
 005F55AF    mov         edx,5F8870;'NUMPAD9'
 005F55B4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F55B7    call        THashTable.Add
 005F55BC    mov         ecx,49
 005F55C1    mov         edx,5F888C;'NumPadPageUp'
 005F55C6    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F55C9    call        THashTable.Add
 005F55CE    mov         ecx,49
 005F55D3    mov         edx,5F88B4;'NumPadPgUp'
 005F55D8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F55DB    call        THashTable.Add
 005F55E0    mov         ecx,4A
 005F55E5    mov         edx,5F88D8;'NumpadMinus'
 005F55EA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F55ED    call        THashTable.Add
 005F55F2    mov         ecx,4A
 005F55F7    mov         edx,5F88FC;'Subtract'
 005F55FC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F55FF    call        THashTable.Add
 005F5604    mov         ecx,4B
 005F5609    mov         edx,5F891C;'NUMPAD4'
 005F560E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5611    call        THashTable.Add
 005F5616    mov         ecx,4B
 005F561B    mov         edx,5F8938;'NumPadLeft'
 005F5620    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5623    call        THashTable.Add
 005F5628    mov         ecx,4C
 005F562D    mov         edx,5F895C;'NUMPAD5'
 005F5632    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5635    call        THashTable.Add
 005F563A    mov         ecx,4D
 005F563F    mov         edx,5F8978;'NUMPAD6'
 005F5644    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5647    call        THashTable.Add
 005F564C    mov         ecx,4D
 005F5651    mov         edx,5F8994;'NumPadRight'
 005F5656    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5659    call        THashTable.Add
 005F565E    mov         ecx,4E
 005F5663    mov         edx,5F89B8;'NumpadPlus'
 005F5668    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F566B    call        THashTable.Add
 005F5670    mov         ecx,4E
 005F5675    mov         edx,5F89DC;'Add'
 005F567A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F567D    call        THashTable.Add
 005F5682    mov         ecx,4F
 005F5687    mov         edx,5F89F0;'NUMPAD1'
 005F568C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F568F    call        THashTable.Add
 005F5694    mov         ecx,4F
 005F5699    mov         edx,5F8A0C;'NumPadEnd'
 005F569E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F56A1    call        THashTable.Add
 005F56A6    mov         ecx,50
 005F56AB    mov         edx,5F8A2C;'NUMPAD2'
 005F56B0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F56B3    call        THashTable.Add
 005F56B8    mov         ecx,50
 005F56BD    mov         edx,5F8A48;'NumPadDown'
 005F56C2    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F56C5    call        THashTable.Add
 005F56CA    mov         ecx,51
 005F56CF    mov         edx,5F8A6C;'NUMPAD3'
 005F56D4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F56D7    call        THashTable.Add
 005F56DC    mov         ecx,51
 005F56E1    mov         edx,5F8A88;'NumPadPageDown'
 005F56E6    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F56E9    call        THashTable.Add
 005F56EE    mov         ecx,51
 005F56F3    mov         edx,5F8AB4;'NumPadPgDn'
 005F56F8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F56FB    call        THashTable.Add
 005F5700    mov         ecx,52
 005F5705    mov         edx,5F8AD8;'NUMPAD0'
 005F570A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F570D    call        THashTable.Add
 005F5712    mov         ecx,52
 005F5717    mov         edx,5F8AF4;'NumPadIns'
 005F571C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F571F    call        THashTable.Add
 005F5724    mov         ecx,52
 005F5729    mov         edx,5F8B14;'NumPadInsert'
 005F572E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5731    call        THashTable.Add
 005F5736    mov         ecx,53
 005F573B    mov         edx,5F8B3C;'NumPadDot'
 005F5740    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5743    call        THashTable.Add
 005F5748    mov         ecx,53
 005F574D    mov         edx,5F8B5C;'NumPadDecimal'
 005F5752    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5755    call        THashTable.Add
 005F575A    mov         ecx,53
 005F575F    mov         edx,5F8B84;'NumPadDel'
 005F5764    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5767    call        THashTable.Add
 005F576C    mov         ecx,53
 005F5771    mov         edx,5F8BA4;'NumPadDelete'
 005F5776    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5779    call        THashTable.Add
 005F577E    mov         ecx,53
 005F5783    mov         edx,5F8BCC;'Decimal'
 005F5788    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F578B    call        THashTable.Add
 005F5790    mov         ecx,53
 005F5795    mov         edx,5F8BE8;'DecimalPoint'
 005F579A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F579D    call        THashTable.Add
 005F57A2    mov         ecx,54
 005F57A7    mov         edx,5F8C10;'SysReq'
 005F57AC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F57AF    call        THashTable.Add
 005F57B4    mov         ecx,54
 005F57B9    mov         edx,5F8C2C;'SysRq'
 005F57BE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F57C1    call        THashTable.Add
 005F57C6    mov         ecx,54
 005F57CB    mov         edx,5F8C44;'AltSysReq'
 005F57D0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F57D3    call        THashTable.Add
 005F57D8    mov         ecx,54
 005F57DD    mov         edx,5F8C64;'Scan54'
 005F57E2    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F57E5    call        THashTable.Add
 005F57EA    mov         ecx,55
 005F57EF    mov         edx,5F8C80;'Scan55'
 005F57F4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F57F7    call        THashTable.Add
 005F57FC    mov         ecx,55
 005F5801    mov         edx,5F8C9C;'CherryF11'
 005F5806    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5809    call        THashTable.Add
 005F580E    mov         ecx,56
 005F5813    mov         edx,5F8CBC;'OEM_102'
 005F5818    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F581B    call        THashTable.Add
 005F5820    mov         ecx,56
 005F5825    mov         edx,5F8CD8;'Scan56'
 005F582A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F582D    call        THashTable.Add
 005F5832    mov         ecx,56
 005F5837    mov         edx,5F8CF4;'CherryF12'
 005F583C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F583F    call        THashTable.Add
 005F5844    mov         ecx,57
 005F5849    mov         edx,5F8D14;'F11'
 005F584E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5851    call        THashTable.Add
 005F5856    mov         ecx,57
 005F585B    mov         edx,5F8D28;'CherryF13'
 005F5860    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5863    call        THashTable.Add
 005F5868    mov         ecx,58
 005F586D    mov         edx,5F8D48;'F12'
 005F5872    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5875    call        THashTable.Add
 005F587A    mov         ecx,58
 005F587F    mov         edx,5F8D5C;'CherryF14'
 005F5884    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5887    call        THashTable.Add
 005F588C    mov         ecx,59
 005F5891    mov         edx,5F8D7C;'Scan59'
 005F5896    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5899    call        THashTable.Add
 005F589E    mov         ecx,59
 005F58A3    mov         edx,5F8D98;'CherryF15'
 005F58A8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F58AB    call        THashTable.Add
 005F58B0    mov         ecx,5A
 005F58B5    mov         edx,5F8DB8;'Scan5A'
 005F58BA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F58BD    call        THashTable.Add
 005F58C2    mov         ecx,5B
 005F58C7    mov         edx,5F8DD4;'Scan5B'
 005F58CC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F58CF    call        THashTable.Add
 005F58D4    mov         ecx,5C
 005F58D9    mov         edx,5F8DF0;'Scan5C'
 005F58DE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F58E1    call        THashTable.Add
 005F58E6    mov         ecx,5D
 005F58EB    mov         edx,5F8E0C;'Scan5D'
 005F58F0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F58F3    call        THashTable.Add
 005F58F8    mov         ecx,5D
 005F58FD    mov         edx,5F8E28;'KEY_Begin'
 005F5902    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5905    call        THashTable.Add
 005F590A    mov         ecx,5E
 005F590F    mov         edx,5F8E48;'Scan5E'
 005F5914    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5917    call        THashTable.Add
 005F591C    mov         ecx,5F
 005F5921    mov         edx,5F8E64;'Scan5F'
 005F5926    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5929    call        THashTable.Add
 005F592E    mov         ecx,60
 005F5933    mov         edx,5F8E80;'Scan60'
 005F5938    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F593B    call        THashTable.Add
 005F5940    mov         ecx,61
 005F5945    mov         edx,5F8E9C;'Scan61'
 005F594A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F594D    call        THashTable.Add
 005F5952    mov         ecx,62
 005F5957    mov         edx,5F8EB8;'Scan62'
 005F595C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F595F    call        THashTable.Add
 005F5964    mov         ecx,63
 005F5969    mov         edx,5F8ED4;'Scan63'
 005F596E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5971    call        THashTable.Add
 005F5976    mov         ecx,64
 005F597B    mov         edx,5F8EF0;'F13'
 005F5980    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5983    call        THashTable.Add
 005F5988    mov         ecx,65
 005F598D    mov         edx,5F8F04;'F14'
 005F5992    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5995    call        THashTable.Add
 005F599A    mov         ecx,66
 005F599F    mov         edx,5F8F18;'F15'
 005F59A4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F59A7    call        THashTable.Add
 005F59AC    mov         ecx,67
 005F59B1    mov         edx,5F8F2C;'F16'
 005F59B6    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F59B9    call        THashTable.Add
 005F59BE    mov         ecx,68
 005F59C3    mov         edx,5F8F40;'F17'
 005F59C8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F59CB    call        THashTable.Add
 005F59D0    mov         ecx,69
 005F59D5    mov         edx,5F8F54;'F18'
 005F59DA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F59DD    call        THashTable.Add
 005F59E2    mov         ecx,6A
 005F59E7    mov         edx,5F8F68;'F19'
 005F59EC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F59EF    call        THashTable.Add
 005F59F4    mov         ecx,6B
 005F59F9    mov         edx,5F8F7C;'F20'
 005F59FE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5A01    call        THashTable.Add
 005F5A06    mov         ecx,6C
 005F5A0B    mov         edx,5F8F90;'F21'
 005F5A10    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5A13    call        THashTable.Add
 005F5A18    mov         ecx,6D
 005F5A1D    mov         edx,5F8FA4;'F22'
 005F5A22    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5A25    call        THashTable.Add
 005F5A2A    mov         ecx,6E
 005F5A2F    mov         edx,5F8FB8;'F23'
 005F5A34    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5A37    call        THashTable.Add
 005F5A3C    mov         ecx,6F
 005F5A41    mov         edx,5F8FCC;'Scan6F'
 005F5A46    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5A49    call        THashTable.Add
 005F5A4E    mov         ecx,70
 005F5A53    mov         edx,5F8FE8;'Kana'
 005F5A58    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5A5B    call        THashTable.Add
 005F5A60    mov         ecx,71
 005F5A65    mov         edx,5F9000;'Scan71'
 005F5A6A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5A6D    call        THashTable.Add
 005F5A72    mov         ecx,72
 005F5A77    mov         edx,5F901C;'CrSel'
 005F5A7C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5A7F    call        THashTable.Add
 005F5A84    mov         ecx,73
 005F5A89    mov         edx,5F9034;'ABNT_C1'
 005F5A8E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5A91    call        THashTable.Add
 005F5A96    mov         ecx,74
 005F5A9B    mov         edx,5F9050;'ExSel'
 005F5AA0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5AA3    call        THashTable.Add
 005F5AA8    mov         ecx,75
 005F5AAD    mov         edx,5F9068;'SetUp'
 005F5AB2    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5AB5    call        THashTable.Add
 005F5ABA    mov         ecx,76
 005F5ABF    mov         edx,5F9080;'F24'
 005F5AC4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5AC7    call        THashTable.Add
 005F5ACC    mov         ecx,77
 005F5AD1    mov         edx,5F9094;'Scan77'
 005F5AD6    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5AD9    call        THashTable.Add
 005F5ADE    mov         ecx,78
 005F5AE3    mov         edx,5F90B0;'Scan78'
 005F5AE8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5AEB    call        THashTable.Add
 005F5AF0    mov         ecx,79
 005F5AF5    mov         edx,5F90CC;'Convert'
 005F5AFA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5AFD    call        THashTable.Add
 005F5B02    mov         ecx,7A
 005F5B07    mov         edx,5F90E8;'Scan7A'
 005F5B0C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5B0F    call        THashTable.Add
 005F5B14    mov         ecx,7B
 005F5B19    mov         edx,5F9104;'NoConvert'
 005F5B1E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5B21    call        THashTable.Add
 005F5B26    mov         ecx,7C
 005F5B2B    mov         edx,5F9124;'Scan7C'
 005F5B30    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5B33    call        THashTable.Add
 005F5B38    mov         ecx,7D
 005F5B3D    mov         edx,5F9140;'Yen'
 005F5B42    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5B45    call        THashTable.Add
 005F5B4A    mov         ecx,7E
 005F5B4F    mov         edx,5F9154;'ABNT_C2'
 005F5B54    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5B57    call        THashTable.Add
 005F5B5C    mov         ecx,7F
 005F5B61    mov         edx,5F9170;'Scan7F'
 005F5B66    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5B69    call        THashTable.Add
 005F5B6E    mov         ecx,80
 005F5B73    mov         edx,5F918C;'Scan80'
 005F5B78    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5B7B    call        THashTable.Add
 005F5B80    mov         ecx,81
 005F5B85    mov         edx,5F91A8;'Scan81'
 005F5B8A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5B8D    call        THashTable.Add
 005F5B92    mov         ecx,82
 005F5B97    mov         edx,5F91C4;'Scan82'
 005F5B9C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5B9F    call        THashTable.Add
 005F5BA4    mov         ecx,83
 005F5BA9    mov         edx,5F91E0;'Scan83'
 005F5BAE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5BB1    call        THashTable.Add
 005F5BB6    mov         ecx,84
 005F5BBB    mov         edx,5F91FC;'Scan84'
 005F5BC0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5BC3    call        THashTable.Add
 005F5BC8    mov         ecx,85
 005F5BCD    mov         edx,5F9218;'Messenger'
 005F5BD2    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5BD5    call        THashTable.Add
 005F5BDA    mov         ecx,86
 005F5BDF    mov         edx,5F9238;'Scan86'
 005F5BE4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5BE7    call        THashTable.Add
 005F5BEC    mov         ecx,87
 005F5BF1    mov         edx,5F9254;'Redo'
 005F5BF6    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5BF9    call        THashTable.Add
 005F5BFE    mov         ecx,88
 005F5C03    mov         edx,5F926C;'Undo'
 005F5C08    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5C0B    call        THashTable.Add
 005F5C10    mov         ecx,89
 005F5C15    mov         edx,5F9284;'PrevAppLeft'
 005F5C1A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5C1D    call        THashTable.Add
 005F5C22    mov         ecx,8A
 005F5C27    mov         edx,5F92A8;'Scan8A'
 005F5C2C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5C2F    call        THashTable.Add
 005F5C34    mov         ecx,8B
 005F5C39    mov         edx,5F92C4;'ScrollUpNormal'
 005F5C3E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5C41    call        THashTable.Add
 005F5C46    mov         ecx,8C
 005F5C4B    mov         edx,5F92F0;'Scan8C'
 005F5C50    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5C53    call        THashTable.Add
 005F5C58    mov         ecx,8D
 005F5C5D    mov         edx,5F930C;'NumPadEquals'
 005F5C62    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5C65    call        THashTable.Add
 005F5C6A    mov         ecx,8E
 005F5C6F    mov         edx,5F9334;'Scan8E'
 005F5C74    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5C77    call        THashTable.Add
 005F5C7C    mov         ecx,8F
 005F5C81    mov         edx,5F9350;'Scan8F'
 005F5C86    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5C89    call        THashTable.Add
 005F5C8E    mov         ecx,90
 005F5C93    mov         edx,5F936C;'PrevTrack'
 005F5C98    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5C9B    call        THashTable.Add
 005F5CA0    mov         ecx,90
 005F5CA5    mov         edx,5F938C;'Media_Prev_Track'
 005F5CAA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5CAD    call        THashTable.Add
 005F5CB2    mov         ecx,91
 005F5CB7    mov         edx,5F93BC;'ScrollUpFast'
 005F5CBC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5CBF    call        THashTable.Add
 005F5CC4    mov         ecx,91
 005F5CC9    mov         edx,5F9218;'Messenger'
 005F5CCE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5CD1    call        THashTable.Add
 005F5CD6    mov         ecx,91
 005F5CDB    mov         edx,5F93E4;'At'
 005F5CE0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5CE3    call        THashTable.Add
 005F5CE8    mov         ecx,92
 005F5CED    mov         edx,5F93F8;'ScrollUpFaster'
 005F5CF2    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5CF5    call        THashTable.Add
 005F5CFA    mov         ecx,92
 005F5CFF    mov         edx,5F9424;'WebcamKey'
 005F5D04    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5D07    call        THashTable.Add
 005F5D0C    mov         ecx,92
 005F5D11    mov         edx,5F9444;'Colon'
 005F5D16    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5D19    call        THashTable.Add
 005F5D1E    mov         ecx,93
 005F5D23    mov         edx,5F945C;'Word'
 005F5D28    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5D2B    call        THashTable.Add
 005F5D30    mov         ecx,93
 005F5D35    mov         edx,5F9474;'Underline'
 005F5D3A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5D3D    call        THashTable.Add
 005F5D42    mov         ecx,93
 005F5D47    mov         edx,5F9494;'iTouch'
 005F5D4C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5D4F    call        THashTable.Add
 005F5D54    mov         ecx,94
 005F5D59    mov         edx,5F94B0;'Excel'
 005F5D5E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5D61    call        THashTable.Add
 005F5D66    mov         ecx,94
 005F5D6B    mov         edx,5F94C8;'Kanji'
 005F5D70    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5D73    call        THashTable.Add
 005F5D78    mov         ecx,94
 005F5D7D    mov         edx,5F94E0;'Shopping'
 005F5D82    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5D85    call        THashTable.Add
 005F5D8A    mov         ecx,95
 005F5D8F    mov         edx,5F9500;'Stop'
 005F5D94    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5D97    call        THashTable.Add
 005F5D9C    mov         ecx,96
 005F5DA1    mov         edx,5F9518;'LogOff'
 005F5DA6    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5DA9    call        THashTable.Add
 005F5DAE    mov         ecx,96
 005F5DB3    mov         edx,5F9534;'AX'
 005F5DB8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5DBB    call        THashTable.Add
 005F5DC0    mov         ecx,97
 005F5DC5    mov         edx,5F9548;'Cut'
 005F5DCA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5DCD    call        THashTable.Add
 005F5DD2    mov         ecx,97
 005F5DD7    mov         edx,5F955C;'Unlabeled'
 005F5DDC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5DDF    call        THashTable.Add
 005F5DE4    mov         ecx,97
 005F5DE9    mov         edx,5F957C;'Purple'
 005F5DEE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5DF1    call        THashTable.Add
 005F5DF6    mov         ecx,98
 005F5DFB    mov         edx,5F9598;'Scan98'
 005F5E00    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5E03    call        THashTable.Add
 005F5E08    mov         ecx,99
 005F5E0D    mov         edx,5F95B4;'NextTrack'
 005F5E12    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5E15    call        THashTable.Add
 005F5E1A    mov         ecx,99
 005F5E1F    mov         edx,5F95D4;'Media_Next_Track'
 005F5E24    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5E27    call        THashTable.Add
 005F5E2C    mov         ecx,9A
 005F5E31    mov         edx,5F9604;'Scan9A'
 005F5E36    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5E39    call        THashTable.Add
 005F5E3E    mov         ecx,9B
 005F5E43    mov         edx,5F9620;'Scan9B'
 005F5E48    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5E4B    call        THashTable.Add
 005F5E50    mov         ecx,9C
 005F5E55    mov         edx,5F963C;'NumPadEnter'
 005F5E5A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5E5D    call        THashTable.Add
 005F5E62    mov         ecx,9D
 005F5E67    mov         edx,5F9660;'RightControl'
 005F5E6C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5E6F    call        THashTable.Add
 005F5E74    mov         ecx,9D
 005F5E79    mov         edx,5F9688;'RControl'
 005F5E7E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5E81    call        THashTable.Add
 005F5E86    mov         ecx,9E
 005F5E8B    mov         edx,5F96A8;'NextAppRight'
 005F5E90    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5E93    call        THashTable.Add
 005F5E98    mov         ecx,9F
 005F5E9D    mov         edx,5F96D0;'ScrollUpFastest'
 005F5EA2    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5EA5    call        THashTable.Add
 005F5EAA    mov         ecx,9F
 005F5EAF    mov         edx,5F96FC;'FavouriteApplicationLaunch'
 005F5EB4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5EB7    call        THashTable.Add
 005F5EBC    mov         ecx,9F
 005F5EC1    mov         edx,5F9740;'Racket'
 005F5EC6    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5EC9    call        THashTable.Add
 005F5ECE    mov         ecx,0A0
 005F5ED3    mov         edx,5F975C;'Mute'
 005F5ED8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5EDB    call        THashTable.Add
 005F5EE0    mov         ecx,0A0
 005F5EE5    mov         edx,5F9774;'VolumeMute'
 005F5EEA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5EED    call        THashTable.Add
 005F5EF2    mov         ecx,0A0
 005F5EF7    mov         edx,5F9798;'Volume_Mute'
 005F5EFC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5EFF    call        THashTable.Add
 005F5F04    mov         ecx,0A1
 005F5F09    mov         edx,5F97BC;'Calculator'
 005F5F0E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5F11    call        THashTable.Add
 005F5F16    mov         ecx,0A2
 005F5F1B    mov         edx,5F97E0;'PlayPause'
 005F5F20    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5F23    call        THashTable.Add
 005F5F28    mov         ecx,0A2
 005F5F2D    mov         edx,5F9800;'Media_Play_Pause'
 005F5F32    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5F35    call        THashTable.Add
 005F5F3A    mov         ecx,0A3
 005F5F3F    mov         edx,5F9830;'Spell'
 005F5F44    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5F47    call        THashTable.Add
 005F5F4C    mov         ecx,0A4
 005F5F51    mov         edx,5F9848;'MediaStop'
 005F5F56    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5F59    call        THashTable.Add
 005F5F5E    mov         ecx,0A4
 005F5F63    mov         edx,5F9868;'Media_Stop'
 005F5F68    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5F6B    call        THashTable.Add
 005F5F70    mov         ecx,0A5
 005F5F75    mov         edx,5F988C;'ScanA5'
 005F5F7A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5F7D    call        THashTable.Add
 005F5F82    mov         ecx,0A5
 005F5F87    mov         edx,5F98A8;'GreenInternet'
 005F5F8C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5F8F    call        THashTable.Add
 005F5F94    mov         ecx,0A6
 005F5F99    mov         edx,5F98D0;'ScanA6'
 005F5F9E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5FA1    call        THashTable.Add
 005F5FA6    mov         ecx,0A6
 005F5FAB    mov         edx,5F98EC;'IbmHelp'
 005F5FB0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5FB3    call        THashTable.Add
 005F5FB8    mov         ecx,0A6
 005F5FBD    mov         edx,5F9908;'BlueShopping'
 005F5FC2    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5FC5    call        THashTable.Add
 005F5FCA    mov         ecx,0A7
 005F5FCF    mov         edx,5F9930;'ScanA7'
 005F5FD4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5FD7    call        THashTable.Add
 005F5FDC    mov         ecx,0A8
 005F5FE1    mov         edx,5F994C;'ScanA8'
 005F5FE6    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5FE9    call        THashTable.Add
 005F5FEE    mov         ecx,0A9
 005F5FF3    mov         edx,5F9968;'ScanA9'
 005F5FF8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F5FFB    call        THashTable.Add
 005F6000    mov         ecx,0AA
 005F6005    mov         edx,5F9984;'FakeLeftShift'
 005F600A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F600D    call        THashTable.Add
 005F6012    mov         ecx,0AA
 005F6017    mov         edx,5F99AC;'FakeLShift'
 005F601C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F601F    call        THashTable.Add
 005F6024    mov         ecx,0AA
 005F6029    mov         edx,5F99D0;'ScanAA'
 005F602E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6031    call        THashTable.Add
 005F6036    mov         ecx,0AB
 005F603B    mov         edx,5F99EC;'ScanAB'
 005F6040    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6043    call        THashTable.Add
 005F6048    mov         ecx,0AC
 005F604D    mov         edx,5F9A08;'Eject'
 005F6052    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6055    call        THashTable.Add
 005F605A    mov         ecx,0AD
 005F605F    mov         edx,5F9A20;'ScanAD'
 005F6064    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6067    call        THashTable.Add
 005F606C    mov         ecx,0AE
 005F6071    mov         edx,5F9A3C;'VolumeDown'
 005F6076    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6079    call        THashTable.Add
 005F607E    mov         ecx,0AE
 005F6083    mov         edx,5F9A60;'Volume_Down'
 005F6088    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F608B    call        THashTable.Add
 005F6090    mov         ecx,0AE
 005F6095    mov         edx,5F9A84;'CyanHelp'
 005F609A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F609D    call        THashTable.Add
 005F60A2    mov         ecx,0AF
 005F60A7    mov         edx,5F9AA4;'ScanAF'
 005F60AC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F60AF    call        THashTable.Add
 005F60B4    mov         ecx,0B0
 005F60B9    mov         edx,5F9AC0;'VolumeUp'
 005F60BE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F60C1    call        THashTable.Add
 005F60C6    mov         ecx,0B0
 005F60CB    mov         edx,5F9AE0;'Volume_Up'
 005F60D0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F60D3    call        THashTable.Add
 005F60D8    mov         ecx,0B1
 005F60DD    mov         edx,5F9B00;'ScanB1'
 005F60E2    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F60E5    call        THashTable.Add
 005F60EA    mov         ecx,0B2
 005F60EF    mov         edx,5F9B1C;'WebHome'
 005F60F4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F60F7    call        THashTable.Add
 005F60FC    mov         ecx,0B2
 005F6101    mov         edx,5F9B38;'WWW'
 005F6106    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6109    call        THashTable.Add
 005F610E    mov         ecx,0B2
 005F6113    mov         edx,5F9B4C;'BrowserHome'
 005F6118    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F611B    call        THashTable.Add
 005F6120    mov         ecx,0B2
 005F6125    mov         edx,5F9B70;'Browser_Home'
 005F612A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F612D    call        THashTable.Add
 005F6132    mov         ecx,0B2
 005F6137    mov         edx,5F9B98;'YellowWebSupport'
 005F613C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F613F    call        THashTable.Add
 005F6144    mov         ecx,0B3
 005F6149    mov         edx,5F9BC8;'Euro'
 005F614E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6151    call        THashTable.Add
 005F6156    mov         ecx,0B3
 005F615B    mov         edx,5F9BE0;'Euros'
 005F6160    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6163    call        THashTable.Add
 005F6168    mov         ecx,0B3
 005F616D    mov         edx,5F9BF8;'NumPadComma'
 005F6172    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6175    call        THashTable.Add
 005F617A    mov         ecx,0B4
 005F617F    mov         edx,5F9C1C;'Dollar'
 005F6184    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6187    call        THashTable.Add
 005F618C    mov         ecx,0B4
 005F6191    mov         edx,5F9C38;'Dollars'
 005F6196    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6199    call        THashTable.Add
 005F619E    mov         ecx,0B5
 005F61A3    mov         edx,5F9C54;^338:Single
 005F61A8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F61AB    call        THashTable.Add
 005F61B0    mov         ecx,0B6
 005F61B5    mov         edx,5F9C70;'FakeRightShift'
 005F61BA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F61BD    call        THashTable.Add
 005F61C2    mov         ecx,0B6
 005F61C7    mov         edx,5F9C9C;'FakeRShift'
 005F61CC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F61CF    call        THashTable.Add
 005F61D4    mov         ecx,0B6
 005F61D9    mov         edx,5F9CC0;'ScanB6'
 005F61DE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F61E1    call        THashTable.Add
 005F61E6    mov         ecx,0B7
 005F61EB    mov         edx,5F9CDC;'PrintScreen'
 005F61F0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F61F3    call        THashTable.Add
 005F61F8    mov         ecx,0B7
 005F61FD    mov         edx,5F9D00;'Print_Screen'
 005F6202    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6205    call        THashTable.Add
 005F620A    mov         ecx,0B7
 005F620F    mov         edx,5F9D28;'CtrlPrintScreen'
 005F6214    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6217    call        THashTable.Add
 005F621C    mov         ecx,0B7
 005F6221    mov         edx,5F9D54;'ControlPrintScreen'
 005F6226    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6229    call        THashTable.Add
 005F622E    mov         ecx,0B8
 005F6233    mov         edx,5F9D88;'RightAlt'
 005F6238    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F623B    call        THashTable.Add
 005F6240    mov         ecx,0B8
 005F6245    mov         edx,5F9DA8;'RMenu'
 005F624A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F624D    call        THashTable.Add
 005F6252    mov         ecx,0B9
 005F6257    mov         edx,5F9DC0;'ScanB9'
 005F625C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F625F    call        THashTable.Add
 005F6264    mov         ecx,0BA
 005F6269    mov         edx,5F9DDC;'ScanBA'
 005F626E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6271    call        THashTable.Add
 005F6276    mov         ecx,0BB
 005F627B    mov         edx,5F9DF8;'Help'
 005F6280    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6283    call        THashTable.Add
 005F6288    mov         ecx,0BC
 005F628D    mov         edx,5F9E10;'MyMusic'
 005F6292    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6295    call        THashTable.Add
 005F629A    mov         ecx,0BC
 005F629F    mov         edx,5F9E2C;'OfficeHome'
 005F62A4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F62A7    call        THashTable.Add
 005F62AC    mov         ecx,0BD
 005F62B1    mov         edx,5F9E50;'TaskPane'
 005F62B6    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F62B9    call        THashTable.Add
 005F62BE    mov         ecx,0BD
 005F62C3    mov         edx,5F9E70;'ScanBD'
 005F62C8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F62CB    call        THashTable.Add
 005F62D0    mov         ecx,0BE
 005F62D5    mov         edx,5F9E8C;'New'
 005F62DA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F62DD    call        THashTable.Add
 005F62E2    mov         ecx,0BF
 005F62E7    mov         edx,5F9EA0;'Open'
 005F62EC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F62EF    call        THashTable.Add
 005F62F4    mov         ecx,0C0
 005F62F9    mov         edx,5F9EB8;'Close'
 005F62FE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6301    call        THashTable.Add
 005F6306    mov         ecx,0C1
 005F630B    mov         edx,5F9ED0;'Reply'
 005F6310    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6313    call        THashTable.Add
 005F6318    mov         ecx,0C2
 005F631D    mov         edx,5F9EE8;'Forward'
 005F6322    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6325    call        THashTable.Add
 005F632A    mov         ecx,0C3
 005F632F    mov         edx,5F9F04;'Send'
 005F6334    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6337    call        THashTable.Add
 005F633C    mov         ecx,0C4
 005F6341    mov         edx,5F9F1C;'ScanC4'
 005F6346    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6349    call        THashTable.Add
 005F634E    mov         ecx,0C5
 005F6353    mov         edx,5F9F38;'Pause'
 005F6358    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F635B    call        THashTable.Add
 005F6360    mov         ecx,0C6
 005F6365    mov         edx,5F9F50;'Break'
 005F636A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F636D    call        THashTable.Add
 005F6372    mov         ecx,0C6
 005F6377    mov         edx,5F9F68;'CtrlBreak'
 005F637C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F637F    call        THashTable.Add
 005F6384    mov         ecx,0C6
 005F6389    mov         edx,5F9F88;'ControlBreak'
 005F638E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6391    call        THashTable.Add
 005F6396    mov         ecx,0C6
 005F639B    mov         edx,5F9FB0;'ScanC6'
 005F63A0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F63A3    call        THashTable.Add
 005F63A8    mov         ecx,0C7
 005F63AD    mov         edx,5F9FCC;'Home'
 005F63B2    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F63B5    call        THashTable.Add
 005F63BA    mov         ecx,0C8
 005F63BF    mov         edx,5F9FE4;'Up'
 005F63C4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F63C7    call        THashTable.Add
 005F63CC    mov         ecx,0C9
 005F63D1    mov         edx,5F9FF8;'PageUp'
 005F63D6    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F63D9    call        THashTable.Add
 005F63DE    mov         ecx,0C9
 005F63E3    mov         edx,5FA014;'Prior'
 005F63E8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F63EB    call        THashTable.Add
 005F63F0    mov         ecx,0CA
 005F63F5    mov         edx,5FA02C;'ScanCA'
 005F63FA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F63FD    call        THashTable.Add
 005F6402    mov         ecx,0CB
 005F6407    mov         edx,5FA048;'Left'
 005F640C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F640F    call        THashTable.Add
 005F6414    mov         ecx,0CC
 005F6419    mov         edx,5FA060;'Rule'
 005F641E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6421    call        THashTable.Add
 005F6426    mov         ecx,0CD
 005F642B    mov         edx,5FA078;'Right'
 005F6430    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6433    call        THashTable.Add
 005F6438    mov         ecx,0CE
 005F643D    mov         edx,5FA090;'ScanCE'
 005F6442    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6445    call        THashTable.Add
 005F644A    mov         ecx,0CF
 005F644F    mov         edx,5FA0AC;'End'
 005F6454    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6457    call        THashTable.Add
 005F645C    mov         ecx,0D0
 005F6461    mov         edx,5FA0C0;'Down'
 005F6466    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6469    call        THashTable.Add
 005F646E    mov         ecx,0D1
 005F6473    mov         edx,5FA0D8;'PageDown'
 005F6478    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F647B    call        THashTable.Add
 005F6480    mov         ecx,0D1
 005F6485    mov         edx,5FA0F8;'Next'
 005F648A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F648D    call        THashTable.Add
 005F6492    mov         ecx,0D2
 005F6497    mov         edx,5FA110;'Insert'
 005F649C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F649F    call        THashTable.Add
 005F64A4    mov         ecx,0D3
 005F64A9    mov         edx,5FA12C;'Delete'
 005F64AE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F64B1    call        THashTable.Add
 005F64B6    mov         ecx,0D4
 005F64BB    mov         edx,5FA148;'ScanD4'
 005F64C0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F64C3    call        THashTable.Add
 005F64C8    mov         ecx,0D5
 005F64CD    mov         edx,5FA164;'ScanD5'
 005F64D2    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F64D5    call        THashTable.Add
 005F64DA    mov         ecx,0D6
 005F64DF    mov         edx,5FA180;'ScanD6'
 005F64E4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F64E7    call        THashTable.Add
 005F64EC    mov         ecx,0D7
 005F64F1    mov         edx,5FA19C;'Save'
 005F64F6    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F64F9    call        THashTable.Add
 005F64FE    mov         ecx,0D8
 005F6503    mov         edx,5FA1B4;'Print'
 005F6508    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F650B    call        THashTable.Add
 005F6510    mov         ecx,0D9
 005F6515    mov         edx,5FA1CC;'ScanD9'
 005F651A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F651D    call        THashTable.Add
 005F6522    mov         ecx,0DA
 005F6527    mov         edx,5FA1E8;'ScanDA'
 005F652C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F652F    call        THashTable.Add
 005F6534    mov         ecx,0DB
 005F6539    mov         edx,5FA204;'LeftWindows'
 005F653E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6541    call        THashTable.Add
 005F6546    mov         ecx,0DC
 005F654B    mov         edx,5FA228;'RightWindows'
 005F6550    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6553    call        THashTable.Add
 005F6558    mov         ecx,0DB
 005F655D    mov         edx,5FA250;'LWin'
 005F6562    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6565    call        THashTable.Add
 005F656A    mov         ecx,0DC
 005F656F    mov         edx,5FA268;'RWin'
 005F6574    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6577    call        THashTable.Add
 005F657C    mov         ecx,0DD
 005F6581    mov         edx,5FA280;'AppMenu'
 005F6586    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6589    call        THashTable.Add
 005F658E    mov         ecx,0DD
 005F6593    mov         edx,5FA29C;'Apps'
 005F6598    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F659B    call        THashTable.Add
 005F65A0    mov         ecx,0DE
 005F65A5    mov         edx,5FA2B4;'Power'
 005F65AA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F65AD    call        THashTable.Add
 005F65B2    mov         ecx,0DF
 005F65B7    mov         edx,5FA2CC;'Sleep'
 005F65BC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F65BF    call        THashTable.Add
 005F65C4    mov         ecx,0DF
 005F65C9    mov         edx,5FA2E4;'WhiteStandby'
 005F65CE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F65D1    call        THashTable.Add
 005F65D6    mov         ecx,0E0
 005F65DB    mov         edx,5FA30C;'ScanE0'
 005F65E0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F65E3    call        THashTable.Add
 005F65E8    mov         ecx,0E1
 005F65ED    mov         edx,5FA328;'ScanE1'
 005F65F2    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F65F5    call        THashTable.Add
 005F65FA    mov         ecx,0E2
 005F65FF    mov         edx,5FA344;'ScanE2'
 005F6604    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6607    call        THashTable.Add
 005F660C    mov         ecx,0E3
 005F6611    mov         edx,5FA360;'Wake'
 005F6616    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6619    call        THashTable.Add
 005F661E    mov         ecx,0E3
 005F6623    mov         edx,5FA378;'Fn'
 005F6628    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F662B    call        THashTable.Add
 005F6630    mov         ecx,0E4
 005F6635    mov         edx,5FA38C;'MyPictures'
 005F663A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F663D    call        THashTable.Add
 005F6642    mov         ecx,0E5
 005F6647    mov         edx,5FA3B0;'WebSearch'
 005F664C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F664F    call        THashTable.Add
 005F6654    mov         ecx,0E5
 005F6659    mov         edx,5FA3D0;'Search'
 005F665E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6661    call        THashTable.Add
 005F6666    mov         ecx,0E5
 005F666B    mov         edx,5FA3EC;'BrowserSearch'
 005F6670    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6673    call        THashTable.Add
 005F6678    mov         ecx,0E5
 005F667D    mov         edx,5FA414;'Browser_Search'
 005F6682    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6685    call        THashTable.Add
 005F668A    mov         ecx,0E6
 005F668F    mov         edx,5FA440;'WebFavorites'
 005F6694    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6697    call        THashTable.Add
 005F669C    mov         ecx,0E6
 005F66A1    mov         edx,5FA468;'WebBookmarks'
 005F66A6    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F66A9    call        THashTable.Add
 005F66AE    mov         ecx,0E6
 005F66B3    mov         edx,5FA490;'Bookmarks'
 005F66B8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F66BB    call        THashTable.Add
 005F66C0    mov         ecx,0E7
 005F66C5    mov         edx,5FA4B0;'WebRefresh'
 005F66CA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F66CD    call        THashTable.Add
 005F66D2    mov         ecx,0E7
 005F66D7    mov         edx,5FA4D4;'Refresh'
 005F66DC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F66DF    call        THashTable.Add
 005F66E4    mov         ecx,0E7
 005F66E9    mov         edx,5FA4F0;'Reload'
 005F66EE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F66F1    call        THashTable.Add
 005F66F6    mov         ecx,0E7
 005F66FB    mov         edx,5FA50C;'WebReload'
 005F6700    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6703    call        THashTable.Add
 005F6708    mov         ecx,0E7
 005F670D    mov         edx,5FA52C;'BrowserReload'
 005F6712    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6715    call        THashTable.Add
 005F671A    mov         ecx,0E7
 005F671F    mov         edx,5FA554;'BrowserRefresh'
 005F6724    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6727    call        THashTable.Add
 005F672C    mov         ecx,0E7
 005F6731    mov         edx,5FA580;'Browser_Refresh'
 005F6736    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6739    call        THashTable.Add
 005F673E    mov         ecx,0E8
 005F6743    mov         edx,5FA5AC;'WebStop'
 005F6748    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F674B    call        THashTable.Add
 005F6750    mov         ecx,0E8
 005F6755    mov         edx,5FA5C8;'BrowserStop'
 005F675A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F675D    call        THashTable.Add
 005F6762    mov         ecx,0E8
 005F6767    mov         edx,5FA5EC;'Browser_Stop'
 005F676C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F676F    call        THashTable.Add
 005F6774    mov         ecx,0E8
 005F6779    mov         edx,5FA614;'QuickPrint'
 005F677E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6781    call        THashTable.Add
 005F6786    mov         ecx,0E9
 005F678B    mov         edx,5FA638;'WebForward'
 005F6790    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6793    call        THashTable.Add
 005F6798    mov         ecx,0E9
 005F679D    mov         edx,5FA65C;'BrowserForward'
 005F67A2    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F67A5    call        THashTable.Add
 005F67AA    mov         ecx,0E9
 005F67AF    mov         edx,5FA688;'Browser_Forward'
 005F67B4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F67B7    call        THashTable.Add
 005F67BC    mov         ecx,0EA
 005F67C1    mov         edx,5FA6B4;'WebBack'
 005F67C6    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F67C9    call        THashTable.Add
 005F67CE    mov         ecx,0EA
 005F67D3    mov         edx,5FA6D0;'BrowserBack'
 005F67D8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F67DB    call        THashTable.Add
 005F67E0    mov         ecx,0EA
 005F67E5    mov         edx,5FA6F4;'Browser_Back'
 005F67EA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F67ED    call        THashTable.Add
 005F67F2    mov         ecx,0EB
 005F67F7    mov         edx,5FA71C;'MyComputer'
 005F67FC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F67FF    call        THashTable.Add
 005F6804    mov         ecx,0EC
 005F6809    mov         edx,5FA740;'Mail'
 005F680E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6811    call        THashTable.Add
 005F6816    mov         ecx,0EC
 005F681B    mov         edx,5FA758;'Email'
 005F6820    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6823    call        THashTable.Add
 005F6828    mov         ecx,0EC
 005F682D    mov         edx,5FA770;'LaunchMail'
 005F6832    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6835    call        THashTable.Add
 005F683A    mov         ecx,0EC
 005F683F    mov         edx,5FA794;'Launch_Mail'
 005F6844    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6847    call        THashTable.Add
 005F684C    mov         ecx,0ED
 005F6851    mov         edx,5FA7B8;'MediaSelect'
 005F6856    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6859    call        THashTable.Add
 005F685E    mov         ecx,0ED
 005F6863    mov         edx,5FA7DC;'LaunchMediaSelect'
 005F6868    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F686B    call        THashTable.Add
 005F6870    mov         ecx,0ED
 005F6875    mov         edx,5FA80C;'Launch_Media_Select'
 005F687A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F687D    call        THashTable.Add
 005F6882    mov         ecx,0EE
 005F6887    mov         edx,5FA840;'ScanEE'
 005F688C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F688F    call        THashTable.Add
 005F6894    mov         ecx,0EF
 005F6899    mov         edx,5FA85C;'ScanEF'
 005F689E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F68A1    call        THashTable.Add
 005F68A6    mov         ecx,0F0
 005F68AB    mov         edx,5FA878;'ScanF0'
 005F68B0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F68B3    call        THashTable.Add
 005F68B8    mov         ecx,0F1
 005F68BD    mov         edx,5FA894;'ScanF1'
 005F68C2    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F68C5    call        THashTable.Add
 005F68CA    mov         ecx,0F2
 005F68CF    mov         edx,5FA8B0;'ScanF2'
 005F68D4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F68D7    call        THashTable.Add
 005F68DC    mov         ecx,0F3
 005F68E1    mov         edx,5FA8CC;'ScanF3'
 005F68E6    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F68E9    call        THashTable.Add
 005F68EE    mov         ecx,0F4
 005F68F3    mov         edx,5FA8E8;'ScanF4'
 005F68F8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F68FB    call        THashTable.Add
 005F6900    mov         ecx,0F5
 005F6905    mov         edx,5FA904;'ScanF5'
 005F690A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F690D    call        THashTable.Add
 005F6912    mov         ecx,0F6
 005F6917    mov         edx,5FA920;'ScanF6'
 005F691C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F691F    call        THashTable.Add
 005F6924    mov         ecx,0F7
 005F6929    mov         edx,5FA93C;'ScanF7'
 005F692E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6931    call        THashTable.Add
 005F6936    mov         ecx,0F8
 005F693B    mov         edx,5FA958;'ScanF8'
 005F6940    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6943    call        THashTable.Add
 005F6948    mov         ecx,0F9
 005F694D    mov         edx,5FA974;'ScanF9'
 005F6952    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6955    call        THashTable.Add
 005F695A    mov         ecx,0FA
 005F695F    mov         edx,5FA990;'ScanFA'
 005F6964    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6967    call        THashTable.Add
 005F696C    mov         ecx,0FB
 005F6971    mov         edx,5FA9AC;'ScanFB'
 005F6976    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6979    call        THashTable.Add
 005F697E    mov         ecx,0FC
 005F6983    mov         edx,5FA9C8;'ScanFC'
 005F6988    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F698B    call        THashTable.Add
 005F6990    mov         ecx,0FD
 005F6995    mov         edx,5FA9E4;'ScanFD'
 005F699A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F699D    call        THashTable.Add
 005F69A2    mov         ecx,0FE
 005F69A7    mov         edx,5FAA00;'ScanFE'
 005F69AC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F69AF    call        THashTable.Add
 005F69B4    mov         ecx,0FF
 005F69B9    mov         edx,5FAA1C;'ScanFF'
 005F69BE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F69C1    call        THashTable.Add
 005F69C6    mov         ecx,100
 005F69CB    mov         edx,5FAA38;'Shift'
 005F69D0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F69D3    call        THashTable.Add
 005F69D8    mov         ecx,101
 005F69DD    mov         edx,5FAA50;'Ctrl'
 005F69E2    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F69E5    call        THashTable.Add
 005F69EA    mov         ecx,102
 005F69EF    mov         edx,5FAA68;'Alt'
 005F69F4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F69F7    call        THashTable.Add
 005F69FC    mov         ecx,103
 005F6A01    mov         edx,5FAA7C;'Windows'
 005F6A06    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6A09    call        THashTable.Add
 005F6A0E    mov         ecx,104
 005F6A13    mov         edx,5FAA98;'FakeShift'
 005F6A18    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6A1B    call        THashTable.Add
 005F6A20    mov         ecx,105
 005F6A25    mov         edx,5FAAB8;'FakeLeftCtrl'
 005F6A2A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6A2D    call        THashTable.Add
 005F6A32    mov         ecx,106
 005F6A37    mov         edx,5FAAE0;'FakeRightCtrl'
 005F6A3C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6A3F    call        THashTable.Add
 005F6A44    mov         ecx,107
 005F6A49    mov         edx,5FAB08;'FakeCtrl'
 005F6A4E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6A51    call        THashTable.Add
 005F6A56    mov         ecx,108
 005F6A5B    mov         edx,5FAB28;'Count'
 005F6A60    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6A63    call        THashTable.Add
 005F6A68    mov         ecx,109
 005F6A6D    mov         edx,5FAB40;'Exists'
 005F6A72    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6A75    call        THashTable.Add
 005F6A7A    mov         ecx,109
 005F6A7F    mov         edx,5FAB5C;'Present'
 005F6A84    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6A87    call        THashTable.Add
 005F6A8C    mov         ecx,11C
 005F6A91    mov         edx,5FAB78;'Unicode0000'
 005F6A96    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6A99    call        THashTable.Add
 005F6A9E    mov         ecx,110
 005F6AA3    mov         edx,5FAB9C;'RawInput'
 005F6AA8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6AAB    call        THashTable.Add
 005F6AB0    mov         ecx,112
 005F6AB5    mov         edx,5FABBC;'ScanCode'
 005F6ABA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6ABD    call        THashTable.Add
 005F6AC2    mov         ecx,114
 005F6AC7    mov         edx,5FABDC;'Row'
 005F6ACC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6ACF    call        THashTable.Add
 005F6AD4    mov         ecx,113
 005F6AD9    mov         edx,5FABF0;'VK'
 005F6ADE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6AE1    call        THashTable.Add
 005F6AE6    mov         ecx,111
 005F6AEB    mov         edx,5FAC04;'AnyKey'
 005F6AF0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6AF3    call        THashTable.Add
 005F6AF8    mov         ecx,117
 005F6AFD    mov         edx,5FAC20;'Swallow'
 005F6B02    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6B05    call        THashTable.Add
 005F6B0A    mov         ecx,118
 005F6B0F    mov         edx,5FAC3C;'RepeatRate'
 005F6B14    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6B17    call        THashTable.Add
 005F6B1C    mov         ecx,119
 005F6B21    mov         edx,5FAC60;'RepeatDelay'
 005F6B26    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6B29    call        THashTable.Add
 005F6B2E    mov         ecx,11A
 005F6B33    mov         edx,5FAC84;'RepeatFakeKeys'
 005F6B38    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6B3B    call        THashTable.Add
 005F6B40    mov         ecx,11B
 005F6B45    mov         edx,5FACB0;'RepeatMultipleFakeKeys'
 005F6B4A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6B4D    call        THashTable.Add
 005F6B52    mov         ecx,11D
 005F6B57    mov         edx,5FACEC;'ArrowKeys'
 005F6B5C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6B5F    call        THashTable.Add
 005F6B64    mov         ecx,11D
 005F6B69    mov         edx,5FAD0C;'CursorPad'
 005F6B6E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6B71    call        THashTable.Add
 005F6B76    mov         ecx,11E
 005F6B7B    mov         edx,5FAD2C;'WASD'
 005F6B80    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6B83    call        THashTable.Add
 005F6B88    mov         ecx,11F
 005F6B8D    mov         edx,5FAD44;'NumPad'
 005F6B92    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6B95    call        THashTable.Add
 005F6B9A    mov         esi,1
 005F6B9F    lea         edx,[ebp-8]
 005F6BA2    mov         eax,esi
 005F6BA4    call        IntToStr
 005F6BA9    mov         ecx,dword ptr [ebp-8]
 005F6BAC    lea         eax,[ebp-4]
 005F6BAF    mov         edx,5F8394;'G'
 005F6BB4    call        @UStrCat3
 005F6BB9    mov         edx,dword ptr [ebp-4]
 005F6BBC    lea         ecx,[esi+120]
 005F6BC2    dec         ecx
 005F6BC3    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6BC6    call        THashTable.Add
 005F6BCB    inc         esi
 005F6BCC    cmp         esi,13
>005F6BCF    jne         005F6B9F
 005F6BD1    mov         esi,1
 005F6BD6    lea         edx,[ebp-10]
 005F6BD9    mov         eax,esi
 005F6BDB    call        IntToStr
 005F6BE0    mov         ecx,dword ptr [ebp-10]
 005F6BE3    lea         eax,[ebp-0C]
 005F6BE6    mov         edx,5F8538;'M'
 005F6BEB    call        @UStrCat3
 005F6BF0    mov         edx,dword ptr [ebp-0C]
 005F6BF3    lea         ecx,[esi+132]
 005F6BF9    dec         ecx
 005F6BFA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6BFD    call        THashTable.Add
 005F6C02    inc         esi
 005F6C03    cmp         esi,4
>005F6C06    jne         005F6BD6
 005F6C08    mov         ecx,135
 005F6C0D    mov         edx,5FAD60;'MR'
 005F6C12    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6C15    call        THashTable.Add
 005F6C1A    xor         esi,esi
 005F6C1C    lea         edx,[ebp-18]
 005F6C1F    mov         eax,esi
 005F6C21    call        IntToStr
 005F6C26    mov         ecx,dword ptr [ebp-18]
 005F6C29    lea         eax,[ebp-14]
 005F6C2C    mov         edx,5FAD74;'DB'
 005F6C31    call        @UStrCat3
 005F6C36    mov         edx,dword ptr [ebp-14]
 005F6C39    lea         ecx,[esi+136]
 005F6C3F    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6C42    call        THashTable.Add
 005F6C47    inc         esi
 005F6C48    cmp         esi,5
>005F6C4B    jne         005F6C1C
 005F6C4D    mov         ecx,13B
 005F6C52    mov         edx,5FAD88;'BulbKey'
 005F6C57    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6C5A    call        THashTable.Add
 005F6C5F    mov         edx,5FADA4;'MULTIPLY'
 005F6C64    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6C67    mov         eax,esi
 005F6C69    call        THashTable.Get
 005F6C6E    mov         ecx,eax
 005F6C70    mov         edx,5FADC4;'NumPadStar'
 005F6C75    mov         eax,esi
 005F6C77    call        THashTable.Add
 005F6C7C    mov         edx,5FADA4;'MULTIPLY'
 005F6C81    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6C84    mov         eax,esi
 005F6C86    call        THashTable.Get
 005F6C8B    mov         ecx,eax
 005F6C8D    mov         edx,5FADE8;'NumPadMultiply'
 005F6C92    mov         eax,esi
 005F6C94    call        THashTable.Add
 005F6C99    mov         edx,5FAE14;'LMENU'
 005F6C9E    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6CA1    mov         eax,esi
 005F6CA3    call        THashTable.Get
 005F6CA8    mov         ecx,eax
 005F6CAA    mov         edx,5FAE2C;'LAlt'
 005F6CAF    mov         eax,esi
 005F6CB1    call        THashTable.Add
 005F6CB6    mov         edx,5FAE44;'CAPITAL'
 005F6CBB    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6CBE    mov         eax,esi
 005F6CC0    call        THashTable.Get
 005F6CC5    mov         ecx,eax
 005F6CC7    mov         edx,5F8674;'CapsLock'
 005F6CCC    mov         eax,esi
 005F6CCE    call        THashTable.Add
 005F6CD3    mov         edx,5FAE44;'CAPITAL'
 005F6CD8    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6CDB    mov         eax,esi
 005F6CDD    call        THashTable.Get
 005F6CE2    mov         ecx,eax
 005F6CE4    mov         edx,5FAE60;'Caps_Lock'
 005F6CE9    mov         eax,esi
 005F6CEB    call        THashTable.Add
 005F6CF0    mov         edx,5FAE80;'SUBTRACT'
 005F6CF5    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6CF8    mov         eax,esi
 005F6CFA    call        THashTable.Get
 005F6CFF    mov         ecx,eax
 005F6D01    mov         edx,5FAEA0;'NumPadMinus'
 005F6D06    mov         eax,esi
 005F6D08    call        THashTable.Add
 005F6D0D    mov         edx,5FAEC4;'ADD'
 005F6D12    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6D15    mov         eax,esi
 005F6D17    call        THashTable.Get
 005F6D1C    mov         ecx,eax
 005F6D1E    mov         edx,5FAED8;'NumPadPlus'
 005F6D23    mov         eax,esi
 005F6D25    call        THashTable.Add
 005F6D2A    mov         edx,5FAEFC;'DECIMAL'
 005F6D2F    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6D32    mov         eax,esi
 005F6D34    call        THashTable.Get
 005F6D39    mov         ecx,eax
 005F6D3B    mov         edx,5FAF18;'NumPadPeriod'
 005F6D40    mov         eax,esi
 005F6D42    call        THashTable.Add
 005F6D47    mov         edx,5FAF40;'DIVIDE'
 005F6D4C    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6D4F    mov         eax,esi
 005F6D51    call        THashTable.Get
 005F6D56    mov         ecx,eax
 005F6D58    mov         edx,5FAF5C;'NumPadSlash'
 005F6D5D    mov         eax,esi
 005F6D5F    call        THashTable.Add
 005F6D64    mov         edx,5FAF40;'DIVIDE'
 005F6D69    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6D6C    mov         eax,esi
 005F6D6E    call        THashTable.Get
 005F6D73    mov         ecx,eax
 005F6D75    mov         edx,5FAF80;'NumPadDivide'
 005F6D7A    mov         eax,esi
 005F6D7C    call        THashTable.Add
 005F6D81    mov         edx,5FAFA8;'RMENU'
 005F6D86    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6D89    mov         eax,esi
 005F6D8B    call        THashTable.Get
 005F6D90    mov         ecx,eax
 005F6D92    mov         edx,5FAFC0;'RAlt'
 005F6D97    mov         eax,esi
 005F6D99    call        THashTable.Add
 005F6D9E    mov         edx,5FAFD8;'PRIOR'
 005F6DA3    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6DA6    mov         eax,esi
 005F6DA8    call        THashTable.Get
 005F6DAD    mov         ecx,eax
 005F6DAF    mov         edx,5FAFF0;'PgUp'
 005F6DB4    mov         eax,esi
 005F6DB6    call        THashTable.Add
 005F6DBB    mov         edx,5FB008;'NEXT'
 005F6DC0    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6DC3    mov         eax,esi
 005F6DC5    call        THashTable.Get
 005F6DCA    mov         ecx,eax
 005F6DCC    mov         edx,5FB020;'PgDn'
 005F6DD1    mov         eax,esi
 005F6DD3    call        THashTable.Add
 005F6DD8    mov         edx,5FAFD8;'PRIOR'
 005F6DDD    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6DE0    mov         eax,esi
 005F6DE2    call        THashTable.Get
 005F6DE7    mov         ecx,eax
 005F6DE9    mov         edx,5FB038;'Page_Up'
 005F6DEE    mov         eax,esi
 005F6DF0    call        THashTable.Add
 005F6DF5    mov         edx,5FB008;'NEXT'
 005F6DFA    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6DFD    mov         eax,esi
 005F6DFF    call        THashTable.Get
 005F6E04    mov         ecx,eax
 005F6E06    mov         edx,5FB054;'Page_Down'
 005F6E0B    mov         eax,esi
 005F6E0D    call        THashTable.Add
 005F6E12    mov         edx,5FB074;'UP'
 005F6E17    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6E1A    mov         eax,esi
 005F6E1C    call        THashTable.Get
 005F6E21    mov         ecx,eax
 005F6E23    mov         edx,5FB088;'UpArrow'
 005F6E28    mov         eax,esi
 005F6E2A    call        THashTable.Add
 005F6E2F    mov         edx,5FB0A4;'LEFT'
 005F6E34    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6E37    mov         eax,esi
 005F6E39    call        THashTable.Get
 005F6E3E    mov         ecx,eax
 005F6E40    mov         edx,5FB0BC;'LeftArrow'
 005F6E45    mov         eax,esi
 005F6E47    call        THashTable.Add
 005F6E4C    mov         edx,5FB0DC;'RIGHT'
 005F6E51    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6E54    mov         eax,esi
 005F6E56    call        THashTable.Get
 005F6E5B    mov         ecx,eax
 005F6E5D    mov         edx,5FB0F4;'RightArrow'
 005F6E62    mov         eax,esi
 005F6E64    call        THashTable.Add
 005F6E69    mov         edx,5FB118;'DOWN'
 005F6E6E    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6E71    mov         eax,esi
 005F6E73    call        THashTable.Get
 005F6E78    mov         ecx,eax
 005F6E7A    mov         edx,5FB130;'DownArrow'
 005F6E7F    mov         eax,esi
 005F6E81    call        THashTable.Add
 005F6E86    mov         edx,5FB074;'UP'
 005F6E8B    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6E8E    mov         eax,esi
 005F6E90    call        THashTable.Get
 005F6E95    mov         ecx,eax
 005F6E97    mov         edx,5FB150;'Up_Arrow'
 005F6E9C    mov         eax,esi
 005F6E9E    call        THashTable.Add
 005F6EA3    mov         edx,5FB0A4;'LEFT'
 005F6EA8    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6EAB    mov         eax,esi
 005F6EAD    call        THashTable.Get
 005F6EB2    mov         ecx,eax
 005F6EB4    mov         edx,5FB170;'Left_Arrow'
 005F6EB9    mov         eax,esi
 005F6EBB    call        THashTable.Add
 005F6EC0    mov         edx,5FB0DC;'RIGHT'
 005F6EC5    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6EC8    mov         eax,esi
 005F6ECA    call        THashTable.Get
 005F6ECF    mov         ecx,eax
 005F6ED1    mov         edx,5FB194;'Right_Arrow'
 005F6ED6    mov         eax,esi
 005F6ED8    call        THashTable.Add
 005F6EDD    mov         edx,5FB118;'DOWN'
 005F6EE2    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6EE5    mov         eax,esi
 005F6EE7    call        THashTable.Get
 005F6EEC    mov         ecx,eax
 005F6EEE    mov         edx,5FB1B8;'Down_Arrow'
 005F6EF3    mov         eax,esi
 005F6EF5    call        THashTable.Add
 005F6EFA    mov         edx,5FB1DC;'PREVTRACK'
 005F6EFF    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6F02    mov         eax,esi
 005F6F04    call        THashTable.Get
 005F6F09    mov         ecx,eax
 005F6F0B    mov         edx,5FB1FC;'Circumflex'
 005F6F10    mov         eax,esi
 005F6F12    call        THashTable.Add
 005F6F17    mov         edx,5FAA50;'Ctrl'
 005F6F1C    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6F1F    mov         eax,esi
 005F6F21    call        THashTable.Get
 005F6F26    mov         ecx,eax
 005F6F28    mov         edx,5FB220;'Control'
 005F6F2D    mov         eax,esi
 005F6F2F    call        THashTable.Add
 005F6F34    mov         edx,5FAA50;'Ctrl'
 005F6F39    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6F3C    mov         eax,esi
 005F6F3E    call        THashTable.Get
 005F6F43    mov         ecx,eax
 005F6F45    mov         edx,5FB23C;'EitherControl'
 005F6F4A    mov         eax,esi
 005F6F4C    call        THashTable.Add
 005F6F51    mov         edx,5FAA50;'Ctrl'
 005F6F56    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6F59    mov         eax,esi
 005F6F5B    call        THashTable.Get
 005F6F60    mov         ecx,eax
 005F6F62    mov         edx,5FB264;'EitherCtrl'
 005F6F67    mov         eax,esi
 005F6F69    call        THashTable.Add
 005F6F6E    mov         edx,5FAA38;'Shift'
 005F6F73    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6F76    mov         eax,esi
 005F6F78    call        THashTable.Get
 005F6F7D    mov         ecx,eax
 005F6F7F    mov         edx,5FB288;'EitherShift'
 005F6F84    mov         eax,esi
 005F6F86    call        THashTable.Add
 005F6F8B    mov         edx,5FAA68;'Alt'
 005F6F90    mov         esi,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6F93    mov         eax,esi
 005F6F95    call        THashTable.Get
 005F6F9A    mov         ecx,eax
 005F6F9C    mov         edx,5FB2AC;'EitherAlt'
 005F6FA1    mov         eax,esi
 005F6FA3    call        THashTable.Add
 005F6FA8    mov         edx,5FB2CC;'LCONTROL'
 005F6FAD    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6FB0    call        THashTable.Get
 005F6FB5    mov         ecx,eax
 005F6FB7    mov         edx,5F8310;'LeftControl'
 005F6FBC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6FBF    call        THashTable.Add
 005F6FC4    mov         edx,5FB2EC;'LSHIFT'
 005F6FC9    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6FCC    call        THashTable.Get
 005F6FD1    mov         ecx,eax
 005F6FD3    mov         edx,5F847C;'LeftShift'
 005F6FD8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6FDB    call        THashTable.Add
 005F6FE0    mov         edx,5FB308;'LALT'
 005F6FE5    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6FE8    call        THashTable.Get
 005F6FED    mov         ecx,eax
 005F6FEF    mov         edx,5F8628;'LeftAlt'
 005F6FF4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F6FF7    call        THashTable.Add
 005F6FFC    mov         edx,5FB320;'LWIN'
 005F7001    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7004    call        THashTable.Get
 005F7009    mov         ecx,eax
 005F700B    mov         edx,5FA204;'LeftWindows'
 005F7010    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7013    call        THashTable.Add
 005F7018    mov         edx,5FB338;'RCONTROL'
 005F701D    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7020    call        THashTable.Get
 005F7025    mov         ecx,eax
 005F7027    mov         edx,5F9660;'RightControl'
 005F702C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F702F    call        THashTable.Add
 005F7034    mov         edx,5FB358;'RSHIFT'
 005F7039    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F703C    call        THashTable.Get
 005F7041    mov         ecx,eax
 005F7043    mov         edx,5F85C8;'RightShift'
 005F7048    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F704B    call        THashTable.Add
 005F7050    mov         edx,5FB374;'RALT'
 005F7055    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7058    call        THashTable.Get
 005F705D    mov         ecx,eax
 005F705F    mov         edx,5F9D88;'RightAlt'
 005F7064    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7067    call        THashTable.Add
 005F706C    mov         edx,5FB38C;'RWIN'
 005F7071    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7074    call        THashTable.Get
 005F7079    mov         ecx,eax
 005F707B    mov         edx,5FA228;'RightWindows'
 005F7080    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7083    call        THashTable.Add
 005F7088    mov         edx,5FB220;'Control'
 005F708D    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7090    call        THashTable.Get
 005F7095    mov         ecx,eax
 005F7097    mov         edx,5FAA50;'Ctrl'
 005F709C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F709F    call        THashTable.Add
 005F70A4    mov         edx,5F8334;'LControl'
 005F70A9    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F70AC    call        THashTable.Get
 005F70B1    mov         ecx,eax
 005F70B3    mov         edx,5FB3A4;'LCtrl'
 005F70B8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F70BB    call        THashTable.Add
 005F70C0    mov         edx,5F9688;'RControl'
 005F70C5    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F70C8    call        THashTable.Get
 005F70CD    mov         ecx,eax
 005F70CF    mov         edx,5FB3BC;'RCtrl'
 005F70D4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F70D7    call        THashTable.Add
 005F70DC    mov         edx,5F8334;'LControl'
 005F70E1    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F70E4    call        THashTable.Get
 005F70E9    mov         ecx,eax
 005F70EB    mov         edx,5FB3D4;'LeftCtrl'
 005F70F0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F70F3    call        THashTable.Add
 005F70F8    mov         edx,5F9688;'RControl'
 005F70FD    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7100    call        THashTable.Get
 005F7105    mov         ecx,eax
 005F7107    mov         edx,5FB3F4;'RightCtrl'
 005F710C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F710F    call        THashTable.Add
 005F7114    mov         edx,5FAA7C;'Windows'
 005F7119    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F711C    call        THashTable.Get
 005F7121    mov         ecx,eax
 005F7123    mov         edx,5FB414;'Win'
 005F7128    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F712B    call        THashTable.Add
 005F7130    mov         edx,5FB320;'LWIN'
 005F7135    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7138    call        THashTable.Get
 005F713D    mov         ecx,eax
 005F713F    mov         edx,5FB428;'LeftWin'
 005F7144    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7147    call        THashTable.Add
 005F714C    mov         edx,5FB38C;'RWIN'
 005F7151    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7154    call        THashTable.Get
 005F7159    mov         ecx,eax
 005F715B    mov         edx,5FB444;'RightWin'
 005F7160    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7163    call        THashTable.Add
 005F7168    mov         edx,5FB320;'LWIN'
 005F716D    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7170    call        THashTable.Get
 005F7175    mov         ecx,eax
 005F7177    mov         edx,5FB464;'LWindows'
 005F717C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F717F    call        THashTable.Add
 005F7184    mov         edx,5FB38C;'RWIN'
 005F7189    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F718C    call        THashTable.Get
 005F7191    mov         ecx,eax
 005F7193    mov         edx,5FB484;'RWindows'
 005F7198    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F719B    call        THashTable.Add
 005F71A0    mov         edx,5FAA7C;'Windows'
 005F71A5    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F71A8    call        THashTable.Get
 005F71AD    mov         ecx,eax
 005F71AF    mov         edx,5FB4A4;'Start'
 005F71B4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F71B7    call        THashTable.Add
 005F71BC    mov         edx,5FB320;'LWIN'
 005F71C1    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F71C4    call        THashTable.Get
 005F71C9    mov         ecx,eax
 005F71CB    mov         edx,5FB4BC;'LeftStart'
 005F71D0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F71D3    call        THashTable.Add
 005F71D8    mov         edx,5FB38C;'RWIN'
 005F71DD    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F71E0    call        THashTable.Get
 005F71E5    mov         ecx,eax
 005F71E7    mov         edx,5FB4DC;'RightStart'
 005F71EC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F71EF    call        THashTable.Add
 005F71F4    mov         edx,5FB320;'LWIN'
 005F71F9    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F71FC    call        THashTable.Get
 005F7201    mov         ecx,eax
 005F7203    mov         edx,5FB500;'LStart'
 005F7208    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F720B    call        THashTable.Add
 005F7210    mov         edx,5FB38C;'RWIN'
 005F7215    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7218    call        THashTable.Get
 005F721D    mov         ecx,eax
 005F721F    mov         edx,5FB51C;'RStart'
 005F7224    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7227    call        THashTable.Add
 005F722C    mov         edx,5FB538;'APPS'
 005F7231    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7234    call        THashTable.Get
 005F7239    mov         ecx,eax
 005F723B    mov         edx,5FB550;'AppsMenu'
 005F7240    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7243    call        THashTable.Add
 005F7248    mov         edx,5FB538;'APPS'
 005F724D    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7250    call        THashTable.Get
 005F7255    mov         ecx,eax
 005F7257    mov         edx,5FA280;'AppMenu'
 005F725C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F725F    call        THashTable.Add
 005F7264    mov         edx,5FB538;'APPS'
 005F7269    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F726C    call        THashTable.Get
 005F7271    mov         ecx,eax
 005F7273    mov         edx,5FB570;'ApplicationMenu'
 005F7278    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F727B    call        THashTable.Add
 005F7280    mov         edx,5FB538;'APPS'
 005F7285    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7288    call        THashTable.Get
 005F728D    mov         ecx,eax
 005F728F    mov         edx,5FB59C;'Application'
 005F7294    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7297    call        THashTable.Add
 005F729C    mov         edx,5FB538;'APPS'
 005F72A1    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F72A4    call        THashTable.Get
 005F72A9    mov         ecx,eax
 005F72AB    mov         edx,5FB5C0;'Menu'
 005F72B0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F72B3    call        THashTable.Add
 005F72B8    mov         edx,5FB538;'APPS'
 005F72BD    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F72C0    call        THashTable.Get
 005F72C5    mov         ecx,eax
 005F72C7    mov         edx,5FB5D8;'RightClickMenu'
 005F72CC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F72CF    call        THashTable.Add
 005F72D4    mov         edx,5FB538;'APPS'
 005F72D9    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F72DC    call        THashTable.Get
 005F72E1    mov         ecx,eax
 005F72E3    mov         edx,5FB604;'RClickMenu'
 005F72E8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F72EB    call        THashTable.Add
 005F72F0    mov         edx,5FB628;'SPACE'
 005F72F5    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F72F8    call        THashTable.Get
 005F72FD    mov         ecx,eax
 005F72FF    mov         edx,5FB640;'SpaceBar'
 005F7304    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7307    call        THashTable.Add
 005F730C    mov         edx,5F7F90;'Escape'
 005F7311    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7314    call        THashTable.Get
 005F7319    mov         ecx,eax
 005F731B    mov         edx,5FB660;'Esc'
 005F7320    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7323    call        THashTable.Add
 005F7328    mov         edx,5F9CDC;'PrintScreen'
 005F732D    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7330    call        THashTable.Get
 005F7335    mov         ecx,eax
 005F7337    mov         edx,5FB674;'PrntScrn'
 005F733C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F733F    call        THashTable.Add
 005F7344    mov         edx,5F9CDC;'PrintScreen'
 005F7349    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F734C    call        THashTable.Get
 005F7351    mov         ecx,eax
 005F7353    mov         edx,5FB694;'PrtSc'
 005F7358    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F735B    call        THashTable.Add
 005F7360    mov         edx,5FB6AC;'SCROLL'
 005F7365    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7368    call        THashTable.Get
 005F736D    mov         ecx,eax
 005F736F    mov         edx,5F87B4;'ScrollLock'
 005F7374    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7377    call        THashTable.Add
 005F737C    mov         edx,5FB6AC;'SCROLL'
 005F7381    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7384    call        THashTable.Get
 005F7389    mov         ecx,eax
 005F738B    mov         edx,5FB6C8;'Scroll_Lock'
 005F7390    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7393    call        THashTable.Add
 005F7398    mov         edx,5FB6AC;'SCROLL'
 005F739D    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F73A0    call        THashTable.Get
 005F73A5    mov         ecx,eax
 005F73A7    mov         edx,5FB6EC;'ScrLk'
 005F73AC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F73AF    call        THashTable.Add
 005F73B4    mov         edx,5F87B4;'ScrollLock'
 005F73B9    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F73BC    call        THashTable.Get
 005F73C1    mov         ecx,eax
 005F73C3    mov         edx,5FB704;'Scrlock'
 005F73C8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F73CB    call        THashTable.Add
 005F73D0    mov         edx,5FB720;'PGUP'
 005F73D5    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F73D8    call        THashTable.Get
 005F73DD    mov         ecx,eax
 005F73DF    mov         edx,5F9FF8;'PageUp'
 005F73E4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F73E7    call        THashTable.Add
 005F73EC    mov         edx,5FB738;'PGDN'
 005F73F1    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F73F4    call        THashTable.Get
 005F73F9    mov         ecx,eax
 005F73FB    mov         edx,5FA0D8;'PageDown'
 005F7400    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7403    call        THashTable.Add
 005F7408    mov         edx,5FB738;'PGDN'
 005F740D    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7410    call        THashTable.Get
 005F7415    mov         ecx,eax
 005F7417    mov         edx,5FB750;'PageDn'
 005F741C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F741F    call        THashTable.Add
 005F7424    mov         edx,5FA110;'Insert'
 005F7429    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F742C    call        THashTable.Get
 005F7431    mov         ecx,eax
 005F7433    mov         edx,5FB76C;'Ins'
 005F7438    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F743B    call        THashTable.Add
 005F7440    mov         edx,5FA12C;'Delete'
 005F7445    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7448    call        THashTable.Get
 005F744D    mov         ecx,eax
 005F744F    mov         edx,5FB780;'Del'
 005F7454    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7457    call        THashTable.Add
 005F745C    mov         edx,5F9FE4;'Up'
 005F7461    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7464    call        THashTable.Get
 005F7469    mov         ecx,eax
 005F746B    mov         edx,5FB794;'CursorUp'
 005F7470    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7473    call        THashTable.Add
 005F7478    mov         edx,5FA0C0;'Down'
 005F747D    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7480    call        THashTable.Get
 005F7485    mov         ecx,eax
 005F7487    mov         edx,5FB7B4;'CursorDown'
 005F748C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F748F    call        THashTable.Add
 005F7494    mov         edx,5FA048;'Left'
 005F7499    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F749C    call        THashTable.Get
 005F74A1    mov         ecx,eax
 005F74A3    mov         edx,5FB7D8;'CursorLeft'
 005F74A8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F74AB    call        THashTable.Add
 005F74B0    mov         edx,5FA078;'Right'
 005F74B5    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F74B8    call        THashTable.Get
 005F74BD    mov         ecx,eax
 005F74BF    mov         edx,5FB7FC;'CursorRight'
 005F74C4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F74C7    call        THashTable.Add
 005F74CC    mov         edx,5F9FE4;'Up'
 005F74D1    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F74D4    call        THashTable.Get
 005F74D9    mov         ecx,eax
 005F74DB    mov         edx,5FB820;'CursorPadUp'
 005F74E0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F74E3    call        THashTable.Add
 005F74E8    mov         edx,5FA0C0;'Down'
 005F74ED    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F74F0    call        THashTable.Get
 005F74F5    mov         ecx,eax
 005F74F7    mov         edx,5FB844;'CursorPadDown'
 005F74FC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F74FF    call        THashTable.Add
 005F7504    mov         edx,5FA048;'Left'
 005F7509    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F750C    call        THashTable.Get
 005F7511    mov         ecx,eax
 005F7513    mov         edx,5FB86C;'CursorPadLeft'
 005F7518    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F751B    call        THashTable.Add
 005F7520    mov         edx,5FA078;'Right'
 005F7525    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7528    call        THashTable.Get
 005F752D    mov         ecx,eax
 005F752F    mov         edx,5FB894;'CursorPadRight'
 005F7534    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7537    call        THashTable.Add
 005F753C    mov         edx,5F97E0;'PlayPause'
 005F7541    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7544    call        THashTable.Get
 005F7549    mov         ecx,eax
 005F754B    mov         edx,5FB8C0;'Play'
 005F7550    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7553    call        THashTable.Add
 005F7558    mov         edx,5F97E0;'PlayPause'
 005F755D    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7560    call        THashTable.Get
 005F7565    mov         ecx,eax
 005F7567    mov         edx,5FB8D8;'MediaPlay'
 005F756C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F756F    call        THashTable.Add
 005F7574    mov         edx,5F97E0;'PlayPause'
 005F7579    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F757C    call        THashTable.Get
 005F7581    mov         ecx,eax
 005F7583    mov         edx,5FB8F8;'MediaPause'
 005F7588    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F758B    call        THashTable.Add
 005F7590    mov         edx,5F97E0;'PlayPause'
 005F7595    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7598    call        THashTable.Get
 005F759D    mov         ecx,eax
 005F759F    mov         edx,5FB91C;'MediaPlayPause'
 005F75A4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F75A7    call        THashTable.Add
 005F75AC    mov         edx,5F9A3C;'VolumeDown'
 005F75B1    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F75B4    call        THashTable.Get
 005F75B9    mov         ecx,eax
 005F75BB    mov         edx,5FB948;'VolumeMinus'
 005F75C0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F75C3    call        THashTable.Add
 005F75C8    mov         edx,5F9AC0;'VolumeUp'
 005F75CD    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F75D0    call        THashTable.Get
 005F75D5    mov         ecx,eax
 005F75D7    mov         edx,5FB96C;'VolumePlus'
 005F75DC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F75DF    call        THashTable.Add
 005F75E4    mov         edx,5F9A3C;'VolumeDown'
 005F75E9    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F75EC    call        THashTable.Get
 005F75F1    mov         ecx,eax
 005F75F3    mov         edx,5FB990;'MinusVolume'
 005F75F8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F75FB    call        THashTable.Add
 005F7600    mov         edx,5F9AC0;'VolumeUp'
 005F7605    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7608    call        THashTable.Get
 005F760D    mov         ecx,eax
 005F760F    mov         edx,5FB9B4;'PlusVolume'
 005F7614    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7617    call        THashTable.Add
 005F761C    mov         edx,5F9A3C;'VolumeDown'
 005F7621    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7624    call        THashTable.Get
 005F7629    mov         ecx,eax
 005F762B    mov         edx,5FB9D8;'MediaMinusVolume'
 005F7630    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7633    call        THashTable.Add
 005F7638    mov         edx,5F9AC0;'VolumeUp'
 005F763D    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7640    call        THashTable.Get
 005F7645    mov         ecx,eax
 005F7647    mov         edx,5FBA08;'MediaPlusVolume'
 005F764C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F764F    call        THashTable.Add
 005F7654    mov         edx,5F9A3C;'VolumeDown'
 005F7659    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F765C    call        THashTable.Get
 005F7661    mov         ecx,eax
 005F7663    mov         edx,5FBA34;'MediaVolumeMinus'
 005F7668    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F766B    call        THashTable.Add
 005F7670    mov         edx,5F9AC0;'VolumeUp'
 005F7675    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7678    call        THashTable.Get
 005F767D    mov         ecx,eax
 005F767F    mov         edx,5FBA64;'MediaVolumePlus'
 005F7684    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7687    call        THashTable.Add
 005F768C    mov         edx,5F9A3C;'VolumeDown'
 005F7691    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7694    call        THashTable.Get
 005F7699    mov         ecx,eax
 005F769B    mov         edx,5FBA90;'MediaVolumeDown'
 005F76A0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F76A3    call        THashTable.Add
 005F76A8    mov         edx,5F9AC0;'VolumeUp'
 005F76AD    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F76B0    call        THashTable.Get
 005F76B5    mov         ecx,eax
 005F76B7    mov         edx,5FBABC;'MediaVolumeUp'
 005F76BC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F76BF    call        THashTable.Add
 005F76C4    mov         edx,5F9A3C;'VolumeDown'
 005F76C9    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F76CC    call        THashTable.Get
 005F76D1    mov         ecx,eax
 005F76D3    mov         edx,5FBAE4;'MediaMinus'
 005F76D8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F76DB    call        THashTable.Add
 005F76E0    mov         edx,5F9AC0;'VolumeUp'
 005F76E5    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F76E8    call        THashTable.Get
 005F76ED    mov         ecx,eax
 005F76EF    mov         edx,5FBB08;'MediaPlus'
 005F76F4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F76F7    call        THashTable.Add
 005F76FC    mov         edx,5F9AC0;'VolumeUp'
 005F7701    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7704    call        THashTable.Get
 005F7709    mov         ecx,eax
 005F770B    mov         edx,5FBB08;'MediaPlus'
 005F7710    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7713    call        THashTable.Add
 005F7718    mov         edx,5F936C;'PrevTrack'
 005F771D    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7720    call        THashTable.Get
 005F7725    mov         ecx,eax
 005F7727    mov         edx,5FBB28;'MediaPrev'
 005F772C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F772F    call        THashTable.Add
 005F7734    mov         edx,5F95B4;'NextTrack'
 005F7739    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F773C    call        THashTable.Get
 005F7741    mov         ecx,eax
 005F7743    mov         edx,5FBB48;'MediaNext'
 005F7748    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F774B    call        THashTable.Add
 005F7750    mov         edx,5F936C;'PrevTrack'
 005F7755    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7758    call        THashTable.Get
 005F775D    mov         ecx,eax
 005F775F    mov         edx,5FBB68;'MediaPrevTrack'
 005F7764    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7767    call        THashTable.Add
 005F776C    mov         edx,5F95B4;'NextTrack'
 005F7771    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7774    call        THashTable.Get
 005F7779    mov         ecx,eax
 005F777B    mov         edx,5FBB94;'MediaNextTrack'
 005F7780    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7783    call        THashTable.Add
 005F7788    mov         edx,5F936C;'PrevTrack'
 005F778D    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7790    call        THashTable.Get
 005F7795    mov         ecx,eax
 005F7797    mov         edx,5FBBC0;'MediaPrevious'
 005F779C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F779F    call        THashTable.Add
 005F77A4    mov         edx,5F936C;'PrevTrack'
 005F77A9    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F77AC    call        THashTable.Get
 005F77B1    mov         ecx,eax
 005F77B3    mov         edx,5FBBE8;'MediaPreviousTrack'
 005F77B8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F77BB    call        THashTable.Add
 005F77C0    mov         edx,5F936C;'PrevTrack'
 005F77C5    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F77C8    call        THashTable.Get
 005F77CD    mov         ecx,eax
 005F77CF    mov         edx,5FBC1C;'PreviousTrack'
 005F77D4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F77D7    call        THashTable.Add
 005F77DC    mov         edx,5FA7B8;'MediaSelect'
 005F77E1    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F77E4    call        THashTable.Get
 005F77E9    mov         ecx,eax
 005F77EB    mov         edx,5FBC44;'Media'
 005F77F0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F77F3    call        THashTable.Add
 005F77F8    mov         edx,5FA7B8;'MediaSelect'
 005F77FD    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7800    call        THashTable.Get
 005F7805    mov         ecx,eax
 005F7807    mov         edx,5FBC5C;'Multimedia'
 005F780C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F780F    call        THashTable.Add
 005F7814    mov         edx,5FA7B8;'MediaSelect'
 005F7819    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F781C    call        THashTable.Get
 005F7821    mov         ecx,eax
 005F7823    mov         edx,5FBC80;'MediaPlayer'
 005F7828    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F782B    call        THashTable.Add
 005F7830    mov         edx,5FBCA4;'mail'
 005F7835    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7838    call        THashTable.Get
 005F783D    mov         ecx,eax
 005F783F    mov         edx,5FA758;'Email'
 005F7844    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7847    call        THashTable.Add
 005F784C    mov         edx,5FBCA4;'mail'
 005F7851    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7854    call        THashTable.Get
 005F7859    mov         ecx,eax
 005F785B    mov         edx,5FBCBC;'Inbox'
 005F7860    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7863    call        THashTable.Add
 005F7868    mov         edx,5F9B1C;'WebHome'
 005F786D    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7870    call        THashTable.Get
 005F7875    mov         ecx,eax
 005F7877    mov         edx,5FBCD4;'Web'
 005F787C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F787F    call        THashTable.Add
 005F7884    mov         edx,5F9B1C;'WebHome'
 005F7889    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F788C    call        THashTable.Get
 005F7891    mov         ecx,eax
 005F7893    mov         edx,5FBCE8;'HomePage'
 005F7898    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F789B    call        THashTable.Add
 005F78A0    mov         edx,5F9B1C;'WebHome'
 005F78A5    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F78A8    call        THashTable.Get
 005F78AD    mov         ecx,eax
 005F78AF    mov         edx,5FBD08;'Internet'
 005F78B4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F78B7    call        THashTable.Add
 005F78BC    mov         edx,5F97BC;'Calculator'
 005F78C1    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F78C4    call        THashTable.Get
 005F78C9    mov         ecx,eax
 005F78CB    mov         edx,5FBD28;'Calc'
 005F78D0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F78D3    call        THashTable.Add
 005F78D8    mov         edx,5FA2CC;'Sleep'
 005F78DD    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F78E0    call        THashTable.Get
 005F78E5    mov         ecx,eax
 005F78E7    mov         edx,5FBD40;'Moon'
 005F78EC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F78EF    call        THashTable.Add
 005F78F4    mov         edx,5FA2CC;'Sleep'
 005F78F9    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F78FC    call        THashTable.Get
 005F7901    mov         ecx,eax
 005F7903    mov         edx,5FBD58;'SystemSleep'
 005F7908    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F790B    call        THashTable.Add
 005F7910    mov         edx,5FA2B4;'Power'
 005F7915    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7918    call        THashTable.Get
 005F791D    mov         ecx,eax
 005F791F    mov         edx,5FBD7C;'SystemPower'
 005F7924    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7927    call        THashTable.Add
 005F792C    mov         edx,5FA360;'Wake'
 005F7931    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7934    call        THashTable.Get
 005F7939    mov         ecx,eax
 005F793B    mov         edx,5FBDA0;'SystemWake'
 005F7940    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7943    call        THashTable.Add
 005F7948    mov         edx,5FA360;'Wake'
 005F794D    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7950    call        THashTable.Get
 005F7955    mov         ecx,eax
 005F7957    mov         edx,5FBDC4;'SystemWakeUp'
 005F795C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F795F    call        THashTable.Add
 005F7964    mov         edx,5FA360;'Wake'
 005F7969    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F796C    call        THashTable.Get
 005F7971    mov         ecx,eax
 005F7973    mov         edx,5FBDEC;'WakeUp'
 005F7978    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F797B    call        THashTable.Add
 005F7980    mov         edx,5FA360;'Wake'
 005F7985    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7988    call        THashTable.Get
 005F798D    mov         ecx,eax
 005F798F    mov         edx,5FBE08;'Awaken'
 005F7994    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7997    call        THashTable.Add
 005F799C    mov         edx,5FA3B0;'WebSearch'
 005F79A1    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F79A4    call        THashTable.Get
 005F79A9    mov         ecx,eax
 005F79AB    mov         edx,5FA3D0;'Search'
 005F79B0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F79B3    call        THashTable.Add
 005F79B8    mov         edx,5FA440;'WebFavorites'
 005F79BD    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F79C0    call        THashTable.Get
 005F79C5    mov         ecx,eax
 005F79C7    mov         edx,5FBE24;'Favorites'
 005F79CC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F79CF    call        THashTable.Add
 005F79D4    mov         edx,5FA440;'WebFavorites'
 005F79D9    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F79DC    call        THashTable.Get
 005F79E1    mov         ecx,eax
 005F79E3    mov         edx,5FBE44;'Favourites'
 005F79E8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F79EB    call        THashTable.Add
 005F79F0    mov         edx,5FA440;'WebFavorites'
 005F79F5    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F79F8    call        THashTable.Get
 005F79FD    mov         ecx,eax
 005F79FF    mov         edx,5FBE68;'WebFavourites'
 005F7A04    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7A07    call        THashTable.Add
 005F7A0C    mov         edx,5FA440;'WebFavorites'
 005F7A11    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7A14    call        THashTable.Get
 005F7A19    mov         ecx,eax
 005F7A1B    mov         edx,5FBE90;'BrowserFavourites'
 005F7A20    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7A23    call        THashTable.Add
 005F7A28    mov         edx,5FA440;'WebFavorites'
 005F7A2D    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7A30    call        THashTable.Get
 005F7A35    mov         ecx,eax
 005F7A37    mov         edx,5FBEC0;'BrowserFavorites'
 005F7A3C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7A3F    call        THashTable.Add
 005F7A44    mov         edx,5FA440;'WebFavorites'
 005F7A49    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7A4C    call        THashTable.Get
 005F7A51    mov         ecx,eax
 005F7A53    mov         edx,5FBEF0;'Browser_Favourites'
 005F7A58    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7A5B    call        THashTable.Add
 005F7A60    mov         edx,5FA440;'WebFavorites'
 005F7A65    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7A68    call        THashTable.Get
 005F7A6D    mov         ecx,eax
 005F7A6F    mov         edx,5FBF24;'Browser_Favorites'
 005F7A74    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7A77    call        THashTable.Add
 005F7A7C    mov         edx,5FA440;'WebFavorites'
 005F7A81    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7A84    call        THashTable.Get
 005F7A89    mov         ecx,eax
 005F7A8B    mov         edx,5FA490;'Bookmarks'
 005F7A90    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7A93    call        THashTable.Add
 005F7A98    mov         edx,5FA4B0;'WebRefresh'
 005F7A9D    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7AA0    call        THashTable.Get
 005F7AA5    mov         ecx,eax
 005F7AA7    mov         edx,5FA4D4;'Refresh'
 005F7AAC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7AAF    call        THashTable.Add
 005F7AB4    mov         edx,5FA4B0;'WebRefresh'
 005F7AB9    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7ABC    call        THashTable.Get
 005F7AC1    mov         ecx,eax
 005F7AC3    mov         edx,5FA4F0;'Reload'
 005F7AC8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7ACB    call        THashTable.Add
 005F7AD0    mov         edx,5FA4B0;'WebRefresh'
 005F7AD5    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7AD8    call        THashTable.Get
 005F7ADD    mov         ecx,eax
 005F7ADF    mov         edx,5FA50C;'WebReload'
 005F7AE4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7AE7    call        THashTable.Add
 005F7AEC    mov         edx,5FBF54;'BACK'
 005F7AF1    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7AF4    call        THashTable.Get
 005F7AF9    mov         ecx,eax
 005F7AFB    mov         edx,5FBF6C;'BckSpc'
 005F7B00    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7B03    call        THashTable.Add
 005F7B08    mov         edx,5F82F4;'Return'
 005F7B0D    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7B10    call        THashTable.Get
 005F7B15    mov         ecx,eax
 005F7B17    mov         edx,5F82DC;'Enter'
 005F7B1C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7B1F    call        THashTable.Add
 005F7B24    mov         edx,5F82F4;'Return'
 005F7B29    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7B2C    call        THashTable.Get
 005F7B31    mov         ecx,eax
 005F7B33    mov         edx,5FBF88;'MainEnter'
 005F7B38    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7B3B    call        THashTable.Add
 005F7B40    mov         edx,5F85B0;'Slash'
 005F7B45    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7B48    call        THashTable.Get
 005F7B4D    mov         ecx,eax
 005F7B4F    mov         edx,5FBFA8;'ForwardSlash'
 005F7B54    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7B57    call        THashTable.Add
 005F7B5C    mov         edx,5F85B0;'Slash'
 005F7B61    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7B64    call        THashTable.Get
 005F7B69    mov         ecx,eax
 005F7B6B    mov         edx,5FBFD0;'Question'
 005F7B70    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7B73    call        THashTable.Add
 005F7B78    mov         edx,5F85B0;'Slash'
 005F7B7D    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7B80    call        THashTable.Get
 005F7B85    mov         ecx,eax
 005F7B87    mov         edx,5FBFF0;'QuestionMark'
 005F7B8C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7B8F    call        THashTable.Add
 005F7B94    mov         edx,5F8574;'Period'
 005F7B99    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7B9C    call        THashTable.Get
 005F7BA1    mov         ecx,eax
 005F7BA3    mov         edx,5FC018;'GreaterThan'
 005F7BA8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7BAB    call        THashTable.Add
 005F7BB0    mov         edx,5F8548;'Comma'
 005F7BB5    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7BB8    call        THashTable.Get
 005F7BBD    mov         ecx,eax
 005F7BBF    mov         edx,5FC03C;'LessThan'
 005F7BC4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7BC7    call        THashTable.Add
 005F7BCC    mov         edx,5F8404;'Apostrophe'
 005F7BD1    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7BD4    call        THashTable.Get
 005F7BD9    mov         ecx,eax
 005F7BDB    mov         edx,5FC05C;'Quote'
 005F7BE0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7BE3    call        THashTable.Add
 005F7BE8    mov         edx,5F8404;'Apostrophe'
 005F7BED    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7BF0    call        THashTable.Get
 005F7BF5    mov         ecx,eax
 005F7BF7    mov         edx,5FC074;'RightQuote'
 005F7BFC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7BFF    call        THashTable.Add
 005F7C04    mov         edx,5F8404;'Apostrophe'
 005F7C09    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7C0C    call        THashTable.Get
 005F7C11    mov         ecx,eax
 005F7C13    mov         edx,5FC098;'SingleQuote'
 005F7C18    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7C1B    call        THashTable.Add
 005F7C20    mov         edx,5F8404;'Apostrophe'
 005F7C25    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7C28    call        THashTable.Get
 005F7C2D    mov         ecx,eax
 005F7C2F    mov         edx,5FC0BC;'QuotationMark'
 005F7C34    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7C37    call        THashTable.Add
 005F7C3C    mov         edx,5F8464;'Grave'
 005F7C41    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7C44    call        THashTable.Get
 005F7C49    mov         ecx,eax
 005F7C4B    mov         edx,5F8448;'Console'
 005F7C50    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7C53    call        THashTable.Add
 005F7C58    mov         edx,5F8464;'Grave'
 005F7C5D    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7C60    call        THashTable.Get
 005F7C65    mov         ecx,eax
 005F7C67    mov         edx,5FC0E4;'Tilde'
 005F7C6C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7C6F    call        THashTable.Add
 005F7C74    mov         edx,5F8464;'Grave'
 005F7C79    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7C7C    call        THashTable.Get
 005F7C81    mov         ecx,eax
 005F7C83    mov         edx,5FC0FC;'LeftQuote'
 005F7C88    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7C8B    call        THashTable.Add
 005F7C90    mov         edx,5F829C;'LBracket'
 005F7C95    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7C98    call        THashTable.Get
 005F7C9D    mov         ecx,eax
 005F7C9F    mov         edx,5F8250;'LeftBracket'
 005F7CA4    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7CA7    call        THashTable.Add
 005F7CAC    mov         edx,5F82BC;'RBracket'
 005F7CB1    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7CB4    call        THashTable.Get
 005F7CB9    mov         ecx,eax
 005F7CBB    mov         edx,5F8274;'RightBracket'
 005F7CC0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7CC3    call        THashTable.Add
 005F7CC8    mov         edx,5F829C;'LBracket'
 005F7CCD    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7CD0    call        THashTable.Get
 005F7CD5    mov         ecx,eax
 005F7CD7    mov         edx,5FC11C;'LeftBrackets'
 005F7CDC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7CDF    call        THashTable.Add
 005F7CE4    mov         edx,5F82BC;'RBracket'
 005F7CE9    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7CEC    call        THashTable.Get
 005F7CF1    mov         ecx,eax
 005F7CF3    mov         edx,5FC144;'RightBrackets'
 005F7CF8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7CFB    call        THashTable.Add
 005F7D00    mov         edx,5F829C;'LBracket'
 005F7D05    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7D08    call        THashTable.Get
 005F7D0D    mov         ecx,eax
 005F7D0F    mov         edx,5FC16C;'LeftSquareBracket'
 005F7D14    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7D17    call        THashTable.Add
 005F7D1C    mov         edx,5F82BC;'RBracket'
 005F7D21    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7D24    call        THashTable.Get
 005F7D29    mov         ecx,eax
 005F7D2B    mov         edx,5FC19C;'RightSquareBracket'
 005F7D30    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7D33    call        THashTable.Add
 005F7D38    mov         edx,5F829C;'LBracket'
 005F7D3D    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7D40    call        THashTable.Get
 005F7D45    mov         ecx,eax
 005F7D47    mov         edx,5FC1D0;'LSquareBracket'
 005F7D4C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7D4F    call        THashTable.Add
 005F7D54    mov         edx,5F82BC;'RBracket'
 005F7D59    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7D5C    call        THashTable.Get
 005F7D61    mov         ecx,eax
 005F7D63    mov         edx,5FC1FC;'RSquareBracket'
 005F7D68    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7D6B    call        THashTable.Add
 005F7D70    mov         edx,5F829C;'LBracket'
 005F7D75    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7D78    call        THashTable.Get
 005F7D7D    mov         ecx,eax
 005F7D7F    mov         edx,5FC228;'LBrackets'
 005F7D84    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7D87    call        THashTable.Add
 005F7D8C    mov         edx,5F82BC;'RBracket'
 005F7D91    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7D94    call        THashTable.Get
 005F7D99    mov         ecx,eax
 005F7D9B    mov         edx,5FC248;'RBrackets'
 005F7DA0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7DA3    call        THashTable.Add
 005F7DA8    mov         edx,5F83E4;'Semicolon'
 005F7DAD    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7DB0    call        THashTable.Get
 005F7DB5    mov         ecx,eax
 005F7DB7    mov         edx,5FC268;'SmCln'
 005F7DBC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7DBF    call        THashTable.Add
 005F7DC4    mov         ecx,79
 005F7DC9    mov         edx,5FC280;'Henkan'
 005F7DCE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7DD1    call        THashTable.Add
 005F7DD6    mov         ecx,7B
 005F7DDB    mov         edx,5FC29C;'Muhenkan'
 005F7DE0    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7DE3    call        THashTable.Add
 005F7DE8    mov         ecx,47
 005F7DED    mov         edx,5FC2BC;'Pad7'
 005F7DF2    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7DF5    call        THashTable.Add
 005F7DFA    mov         ecx,48
 005F7DFF    mov         edx,5FC2D4;'Pad8'
 005F7E04    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7E07    call        THashTable.Add
 005F7E0C    mov         ecx,49
 005F7E11    mov         edx,5FC2EC;'Pad9'
 005F7E16    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7E19    call        THashTable.Add
 005F7E1E    mov         ecx,4B
 005F7E23    mov         edx,5FC304;'Pad4'
 005F7E28    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7E2B    call        THashTable.Add
 005F7E30    mov         ecx,4C
 005F7E35    mov         edx,5FC31C;'Pad5'
 005F7E3A    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7E3D    call        THashTable.Add
 005F7E42    mov         ecx,4D
 005F7E47    mov         edx,5FC334;'Pad6'
 005F7E4C    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7E4F    call        THashTable.Add
 005F7E54    mov         ecx,4F
 005F7E59    mov         edx,5FC34C;'Pad1'
 005F7E5E    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7E61    call        THashTable.Add
 005F7E66    mov         ecx,50
 005F7E6B    mov         edx,5FC364;'Pad2'
 005F7E70    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7E73    call        THashTable.Add
 005F7E78    mov         ecx,51
 005F7E7D    mov         edx,5FC37C;'Pad3'
 005F7E82    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7E85    call        THashTable.Add
 005F7E8A    mov         ecx,52
 005F7E8F    mov         edx,5FC394;'Pad0'
 005F7E94    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7E97    call        THashTable.Add
 005F7E9C    mov         ecx,13C
 005F7EA1    mov         edx,5FC3AC;'CapsLockState'
 005F7EA6    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7EA9    call        THashTable.Add
 005F7EAE    mov         ecx,13D
 005F7EB3    mov         edx,5FC3D4;'NumLockState'
 005F7EB8    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7EBB    call        THashTable.Add
 005F7EC0    mov         ecx,13E
 005F7EC5    mov         edx,5FC3FC;'ScrollLockState'
 005F7ECA    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7ECD    call        THashTable.Add
 005F7ED2    mov         ecx,13F
 005F7ED7    mov         edx,5FC428;'KanaLockState'
 005F7EDC    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7EDF    call        THashTable.Add
 005F7EE4    mov         ecx,140
 005F7EE9    mov         edx,5FC450;'InsertState'
 005F7EEE    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7EF1    call        THashTable.Add
 005F7EF6    mov         ecx,141
 005F7EFB    mov         edx,5FC474;'CapsLockLED'
 005F7F00    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7F03    call        THashTable.Add
 005F7F08    mov         ecx,142
 005F7F0D    mov         edx,5FC498;'NumLockLED'
 005F7F12    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7F15    call        THashTable.Add
 005F7F1A    mov         ecx,143
 005F7F1F    mov         edx,5FC4BC;'ScrollLockLED'
 005F7F24    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7F27    call        THashTable.Add
 005F7F2C    mov         ecx,144
 005F7F31    mov         edx,5FC4E4;'KanaLockLED'
 005F7F36    mov         eax,dword ptr [ebx+1C];TModuleKeyboard.Fields:THashTable
 005F7F39    call        THashTable.Add
 005F7F3E    xor         eax,eax
 005F7F40    pop         edx
 005F7F41    pop         ecx
 005F7F42    pop         ecx
 005F7F43    mov         dword ptr fs:[eax],edx
 005F7F46    push        5F7F60
 005F7F4B    lea         eax,[ebp-18]
 005F7F4E    mov         edx,6
 005F7F53    call        @UStrArrayClr
 005F7F58    ret
>005F7F59    jmp         @HandleFinally
>005F7F5E    jmp         005F7F4B
 005F7F60    pop         esi
 005F7F61    pop         ebx
 005F7F62    mov         esp,ebp
 005F7F64    pop         ebp
 005F7F65    ret
*}
end;

//005FC4FC
constructor TModuleKeyboard.Create;
begin
{*
 005FC4FC    push        ebx
 005FC4FD    push        esi
 005FC4FE    test        dl,dl
>005FC500    je          005FC50A
 005FC502    add         esp,0FFFFFFF0
 005FC505    call        @ClassCreate
 005FC50A    mov         ebx,edx
 005FC50C    mov         esi,eax
 005FC50E    push        5FC558;'Keyboards'
 005FC513    push        5FC578;'Keys'
 005FC518    push        5FC590;'Key'
 005FC51D    push        5FC5A4;'kbd'
 005FC522    mov         ecx,5FC5B8;'Keyboard'
 005FC527    xor         edx,edx
 005FC529    mov         eax,esi
 005FC52B    call        005E48EC
 005FC530    mov         eax,esi
 005FC532    test        bl,bl
>005FC534    je          005FC545
 005FC536    call        @AfterConstruction
 005FC53B    pop         dword ptr fs:[0]
 005FC542    add         esp,0C
 005FC545    mov         eax,esi
 005FC547    pop         esi
 005FC548    pop         ebx
 005FC549    ret
*}
end;

//005FC5CC
function TModuleKeyboard.CreateValue(Identifier:string):TExpression;
begin
{*
 005FC5CC    push        ebp
 005FC5CD    mov         ebp,esp
 005FC5CF    push        ecx
 005FC5D0    push        ebx
 005FC5D1    push        esi
 005FC5D2    mov         dword ptr [ebp-4],edx
 005FC5D5    mov         ebx,eax
 005FC5D7    mov         eax,dword ptr [ebp-4]
 005FC5DA    call        @UStrAddRef
 005FC5DF    xor         eax,eax
 005FC5E1    push        ebp
 005FC5E2    push        5FC618
 005FC5E7    push        dword ptr fs:[eax]
 005FC5EA    mov         dword ptr fs:[eax],esp
 005FC5ED    mov         byte ptr [ebx+24],1;TModuleKeyboard.Used:Boolean
 005FC5F1    mov         eax,dword ptr [ebp-4]
 005FC5F4    call        005F1D80
 005FC5F9    mov         esi,eax
 005FC5FB    mov         dword ptr [ebx+20],11C;TModuleKeyboard.MaxFieldNumber:Integer
 005FC602    xor         eax,eax
 005FC604    pop         edx
 005FC605    pop         ecx
 005FC606    pop         ecx
 005FC607    mov         dword ptr fs:[eax],edx
 005FC60A    push        5FC61F
 005FC60F    lea         eax,[ebp-4]
 005FC612    call        @UStrClr
 005FC617    ret
>005FC618    jmp         @HandleFinally
>005FC61D    jmp         005FC60F
 005FC61F    mov         eax,esi
 005FC621    pop         esi
 005FC622    pop         ebx
 005FC623    pop         ecx
 005FC624    pop         ebp
 005FC625    ret
*}
end;

//005FC628
function TModuleKeyboard.GetDefaultFormat(field:string):TGuiFormat;
begin
{*
 005FC628    push        ebp
 005FC629    mov         ebp,esp
 005FC62B    push        ecx
 005FC62C    push        ebx
 005FC62D    mov         dword ptr [ebp-4],edx
 005FC630    mov         eax,dword ptr [ebp-4]
 005FC633    call        @UStrAddRef
 005FC638    xor         eax,eax
 005FC63A    push        ebp
 005FC63B    push        5FC681
 005FC640    push        dword ptr fs:[eax]
 005FC643    mov         dword ptr fs:[eax],esp
 005FC646    mov         eax,dword ptr [ebp-4]
 005FC649    call        005F20F0
 005FC64E    sub         eax,108
>005FC653    je          005FC665
 005FC655    add         eax,0FFFFFFFE
 005FC658    sub         eax,6
>005FC65B    jb          005FC665
 005FC65D    add         eax,0FFFFFFFE
 005FC660    sub         eax,5
>005FC663    jae         005FC669
 005FC665    mov         bl,9
>005FC667    jmp         005FC66B
 005FC669    xor         ebx,ebx
 005FC66B    xor         eax,eax
 005FC66D    pop         edx
 005FC66E    pop         ecx
 005FC66F    pop         ecx
 005FC670    mov         dword ptr fs:[eax],edx
 005FC673    push        5FC688
 005FC678    lea         eax,[ebp-4]
 005FC67B    call        @UStrClr
 005FC680    ret
>005FC681    jmp         @HandleFinally
>005FC686    jmp         005FC678
 005FC688    mov         eax,ebx
 005FC68A    pop         ebx
 005FC68B    pop         ecx
 005FC68C    pop         ebp
 005FC68D    ret
*}
end;

//005FC690
procedure TModuleKeyboard.GetGoodFields;
begin
{*
 005FC690    call        005F21E0
 005FC695    ret
*}
end;

//005FC698
procedure TModuleKeyboard.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 005FC698    push        ebp
 005FC699    mov         ebp,esp
 005FC69B    mov         byte ptr [edx],1
 005FC69E    xor         eax,eax
 005FC6A0    mov         dword ptr [ecx],eax
 005FC6A2    mov         eax,dword ptr [ebp+8]
 005FC6A5    mov         dword ptr [eax],0F
 005FC6AB    pop         ebp
 005FC6AC    ret         4
*}
end;

//005FC6B0
function TModuleKeyboard.IsIdentifier(s:string):Boolean;
begin
{*
 005FC6B0    push        ebp
 005FC6B1    mov         ebp,esp
 005FC6B3    add         esp,0FFFFFFF8
 005FC6B6    push        ebx
 005FC6B7    xor         ecx,ecx
 005FC6B9    mov         dword ptr [ebp-8],ecx
 005FC6BC    mov         dword ptr [ebp-4],edx
 005FC6BF    mov         eax,dword ptr [ebp-4]
 005FC6C2    call        @UStrAddRef
 005FC6C7    xor         eax,eax
 005FC6C9    push        ebp
 005FC6CA    push        5FC7E9
 005FC6CF    push        dword ptr fs:[eax]
 005FC6D2    mov         dword ptr fs:[eax],esp
 005FC6D5    lea         edx,[ebp-8]
 005FC6D8    mov         eax,dword ptr [ebp-4]
 005FC6DB    call        LowerCase
 005FC6E0    mov         edx,dword ptr [ebp-8]
 005FC6E3    lea         eax,[ebp-4]
 005FC6E6    call        @UStrLAsg
 005FC6EB    mov         eax,dword ptr [ebp-4]
 005FC6EE    mov         edx,5FC804;'swallow'
 005FC6F3    call        @UStrEqual
>005FC6F8    jne         005FC701
 005FC6FA    xor         ebx,ebx
>005FC6FC    jmp         005FC7CE
 005FC701    lea         eax,[ebp-4]
 005FC704    mov         edx,5FC820;'fake'
 005FC709    call        004F9BD0
 005FC70E    lea         eax,[ebp-4]
 005FC711    mov         edx,5FC838;'real'
 005FC716    call        004F9BD0
 005FC71B    lea         eax,[ebp-4]
 005FC71E    mov         edx,5FC850;'keyboards'
 005FC723    call        004F9BD0
 005FC728    test        al,al
>005FC72A    jne         005FC770
 005FC72C    lea         eax,[ebp-4]
 005FC72F    mov         edx,5FC870;'keyboard'
 005FC734    call        004F9BD0
 005FC739    test        al,al
>005FC73B    jne         005FC770
 005FC73D    lea         eax,[ebp-4]
 005FC740    mov         edx,5FC890;'keys'
 005FC745    call        004F9BD0
 005FC74A    test        al,al
>005FC74C    jne         005FC770
 005FC74E    lea         eax,[ebp-4]
 005FC751    mov         edx,5FC8A8;'key'
 005FC756    call        004F9BD0
 005FC75B    test        al,al
>005FC75D    jne         005FC770
 005FC75F    lea         eax,[ebp-4]
 005FC762    mov         edx,5FC8BC;'kbd'
 005FC767    call        004F9BD0
 005FC76C    test        al,al
>005FC76E    je          005FC79C
 005FC770    lea         eax,[ebp-4]
 005FC773    call        004F9D00
 005FC778    lea         eax,[ebp-4]
 005FC77B    mov         edx,5FC8D0;'.'
 005FC780    call        004F9BD0
 005FC785    test        al,al
>005FC787    je          005FC798
 005FC789    mov         eax,dword ptr [ebp-4]
 005FC78C    call        005F20F0
 005FC791    test        eax,eax
 005FC793    setge       bl
>005FC796    jmp         005FC7CE
 005FC798    xor         ebx,ebx
>005FC79A    jmp         005FC7CE
 005FC79C    lea         eax,[ebp-4]
 005FC79F    mov         edx,5FC8E0;'unicode'
 005FC7A4    call        004F9BD0
 005FC7A9    test        al,al
>005FC7AB    je          005FC7C1
 005FC7AD    mov         eax,dword ptr [ebp-4]
 005FC7B0    test        eax,eax
>005FC7B2    je          005FC7B9
 005FC7B4    sub         eax,4
 005FC7B7    mov         eax,dword ptr [eax]
 005FC7B9    cmp         eax,4
 005FC7BC    sete        bl
>005FC7BF    jmp         005FC7CE
 005FC7C1    mov         eax,dword ptr [ebp-4]
 005FC7C4    call        005F20F0
 005FC7C9    test        eax,eax
 005FC7CB    setge       bl
 005FC7CE    xor         eax,eax
 005FC7D0    pop         edx
 005FC7D1    pop         ecx
 005FC7D2    pop         ecx
 005FC7D3    mov         dword ptr fs:[eax],edx
 005FC7D6    push        5FC7F0
 005FC7DB    lea         eax,[ebp-8]
 005FC7DE    mov         edx,2
 005FC7E3    call        @UStrArrayClr
 005FC7E8    ret
>005FC7E9    jmp         @HandleFinally
>005FC7EE    jmp         005FC7DB
 005FC7F0    mov         eax,ebx
 005FC7F2    pop         ebx
 005FC7F3    pop         ecx
 005FC7F4    pop         ecx
 005FC7F5    pop         ebp
 005FC7F6    ret
*}
end;

//005FC8F0
procedure TModuleKeyboard.MonitorFrame;
begin
{*
 005FC8F0    push        ebp
 005FC8F1    mov         ebp,esp
 005FC8F3    add         esp,0FFFFFEEC
 005FC8F9    push        ebx
 005FC8FA    push        esi
 005FC8FB    push        edi
 005FC8FC    xor         edx,edx
 005FC8FE    mov         dword ptr [ebp-110],edx
 005FC904    mov         dword ptr [ebp-114],edx
 005FC90A    mov         dword ptr [ebp-108],edx
 005FC910    mov         dword ptr [ebp-10C],edx
 005FC916    mov         dword ptr [ebp-4],eax
 005FC919    xor         eax,eax
 005FC91B    push        ebp
 005FC91C    push        5FC9FB
 005FC921    push        dword ptr fs:[eax]
 005FC924    mov         dword ptr fs:[eax],esp
 005FC927    mov         esi,816304;gvar_00816304:Pointer
 005FC92C    lea         edi,[ebp-104]
 005FC932    mov         ecx,40
 005FC937    rep movs    dword ptr [edi],dword ptr [esi]
 005FC939    call        005F49B0
 005FC93E    test        al,al
>005FC940    je          005FC9DD
 005FC946    mov         edi,1
 005FC94B    mov         ebx,816305;gvar_00816305
 005FC950    lea         esi,[ebp-103]
 005FC956    test        byte ptr [ebx],80
>005FC959    je          005FC993
 005FC95B    test        byte ptr [esi],80
>005FC95E    jne         005FC993
 005FC960    lea         edx,[ebp-10C]
 005FC966    mov         eax,edi
 005FC968    call        005F2178
 005FC96D    mov         ecx,dword ptr [ebp-10C]
 005FC973    lea         eax,[ebp-108]
 005FC979    mov         edx,5FCA18;'Keyboard.'
 005FC97E    call        @UStrCat3
 005FC983    mov         edx,dword ptr [ebp-108]
 005FC989    mov         eax,dword ptr [ebp-4]
 005FC98C    call        005E4F6C
>005FC991    jmp         005FC9CE
 005FC993    test        byte ptr [esi],80
>005FC996    je          005FC9CE
 005FC998    test        byte ptr [ebx],80
>005FC99B    jne         005FC9CE
 005FC99D    lea         edx,[ebp-114]
 005FC9A3    mov         eax,edi
 005FC9A5    call        005F2178
 005FC9AA    mov         ecx,dword ptr [ebp-114]
 005FC9B0    lea         eax,[ebp-110]
 005FC9B6    mov         edx,5FCA18;'Keyboard.'
 005FC9BB    call        @UStrCat3
 005FC9C0    mov         edx,dword ptr [ebp-110]
 005FC9C6    mov         eax,dword ptr [ebp-4]
 005FC9C9    call        005E4FB4
 005FC9CE    inc         edi
 005FC9CF    inc         esi
 005FC9D0    inc         ebx
 005FC9D1    cmp         edi,100
>005FC9D7    jne         005FC956
 005FC9DD    xor         eax,eax
 005FC9DF    pop         edx
 005FC9E0    pop         ecx
 005FC9E1    pop         ecx
 005FC9E2    mov         dword ptr fs:[eax],edx
 005FC9E5    push        5FCA02
 005FC9EA    lea         eax,[ebp-114]
 005FC9F0    mov         edx,4
 005FC9F5    call        @UStrArrayClr
 005FC9FA    ret
>005FC9FB    jmp         @HandleFinally
>005FCA00    jmp         005FC9EA
 005FCA02    pop         edi
 005FCA03    pop         esi
 005FCA04    pop         ebx
 005FCA05    mov         esp,ebp
 005FCA07    pop         ebp
 005FCA08    ret
*}
end;

//005FCA2C
procedure TModuleKeyboard.PrepareForMonitoring;
begin
{*
 005FCA2C    call        TPieModule.PrepareForMonitoring
 005FCA31    mov         byte ptr ds:[8162F6],1;gvar_008162F6
 005FCA38    ret
*}
end;

//005FCA3C
procedure TModuleKeyboard.Read;
begin
{*
 005FCA3C    call        005F49B0
 005FCA41    ret
*}
end;

//005FCA44
procedure TModuleKeyboard.StartCompiletime;
begin
{*
 005FCA44    call        TPieModule.StartCompiletime
 005FCA49    call        005F20D8
 005FCA4E    ret
*}
end;

//005FCA50
procedure TModuleKeyboard.StartRuntime;
begin
{*
 005FCA50    call        TPieModule.StartRuntime
 005FCA55    call        005F3F94
 005FCA5A    ret
*}
end;

//005FCA5C
procedure TModuleKeyboard.StopRuntime;
begin
{*
 005FCA5C    push        ebx
 005FCA5D    mov         ebx,eax
 005FCA5F    call        005F4328
 005FCA64    mov         eax,ebx
 005FCA66    call        TPieModule.StopRuntime
 005FCA6B    pop         ebx
 005FCA6C    ret
*}
end;

Initialization
//00781A30
{*
 00781A30    push        ebp
 00781A31    mov         ebp,esp
 00781A33    push        ebx
 00781A34    push        esi
 00781A35    push        edi
 00781A36    sub         dword ptr ds:[8162FC],1
>00781A3D    jae         00781AA8
 00781A3F    xor         edx,edx
 00781A41    push        ebp
 00781A42    push        781A8D
 00781A47    push        dword ptr fs:[edx]
 00781A4A    mov         dword ptr fs:[edx],esp
 00781A4D    mov         eax,781ABC;'Initializing PieKeyboard'
 00781A52    call        004FA5FC
 00781A57    mov         dl,1
 00781A59    mov         eax,[005F1528];TModuleKeyboard
 00781A5E    call        TModuleKeyboard.Create;TModuleKeyboard.Create
 00781A63    mov         [00816300],eax;gvar_00816300:TModuleKeyboard
 00781A68    mov         eax,[00816300];gvar_00816300:TModuleKeyboard
 00781A6D    call        005E31AC
 00781A72    mov         eax,816304;gvar_00816304:Pointer
 00781A77    xor         ecx,ecx
 00781A79    mov         edx,100
 00781A7E    call        @FillChar
 00781A83    xor         eax,eax
 00781A85    pop         edx
 00781A86    pop         ecx
 00781A87    pop         ecx
 00781A88    mov         dword ptr fs:[eax],edx
>00781A8B    jmp         00781AA8
>00781A8D    jmp         @HandleOnException
 00781A92    dd          1
 00781A96    dd          00418C04;Exception
 00781A9A    dd          00781A9E
 00781A9E    call        004FA644
 00781AA3    call        @DoneExcept
 00781AA8    pop         edi
 00781AA9    pop         esi
 00781AAA    pop         ebx
 00781AAB    pop         ebp
 00781AAC    ret
*}
Finalization
//005FCA70
{*
 005FCA70    push        ebp
 005FCA71    mov         ebp,esp
 005FCA73    push        ebx
 005FCA74    push        esi
 005FCA75    push        edi
 005FCA76    xor         eax,eax
 005FCA78    push        ebp
 005FCA79    push        5FCAE6
 005FCA7E    push        dword ptr fs:[eax]
 005FCA81    mov         dword ptr fs:[eax],esp
 005FCA84    inc         dword ptr ds:[8162FC]
>005FCA8A    jne         005FCAD8
 005FCA8C    xor         edx,edx
 005FCA8E    push        ebp
 005FCA8F    push        5FCAB3
 005FCA94    push        dword ptr fs:[edx]
 005FCA97    mov         dword ptr fs:[edx],esp
 005FCA9A    mov         eax,5FCB00;'Finalizing PieKeyboard'
 005FCA9F    call        004FA5FC
 005FCAA4    call        005F4DA0
 005FCAA9    xor         eax,eax
 005FCAAB    pop         edx
 005FCAAC    pop         ecx
 005FCAAD    pop         ecx
 005FCAAE    mov         dword ptr fs:[eax],edx
>005FCAB1    jmp         005FCACE
>005FCAB3    jmp         @HandleOnException
 005FCAB8    dd          1
 005FCABC    dd          00418C04;Exception
 005FCAC0    dd          005FCAC4
 005FCAC4    call        004FA644
 005FCAC9    call        @DoneExcept
 005FCACE    mov         eax,78BCFC;gvar_0078BCFC:IInterface
 005FCAD3    call        @IntfClear
 005FCAD8    xor         eax,eax
 005FCADA    pop         edx
 005FCADB    pop         ecx
 005FCADC    pop         ecx
 005FCADD    mov         dword ptr fs:[eax],edx
 005FCAE0    push        5FCAED
 005FCAE5    ret
>005FCAE6    jmp         @HandleFinally
>005FCAEB    jmp         005FCAE5
 005FCAED    pop         edi
 005FCAEE    pop         esi
 005FCAEF    pop         ebx
 005FCAF0    pop         ebp
 005FCAF1    ret
*}
end.