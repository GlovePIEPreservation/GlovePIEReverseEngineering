//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieP5;

interface

uses
  SysUtils, Classes;

type
  TGloveValue = class(TObjectValue)
  published
    constructor Create;//00699BE8
    procedure CreateClone;//00699C1C
    //procedure ToString(?:?);//0069DE20
    function GetLLLLL(v:Integer):Boolean;//0069A470
    procedure GetRotMat(m:TRotMat);//0069A5C8
    function Module:TObject;//0069DC10
    procedure FillClone(c:TExpression);//00699C2C
    procedure GetVector(x:Double; y:Double; z:Double);//0069D730
    procedure GetBoolean;//00699C4C
    function CanSet:Boolean;//00699BE4
    function GetDataType:TDataType;//0069A164
    procedure GetValue;//0069A878
    function GetPerUnits1:TUnits;//0069A528
    function GetPerUnits2:TUnits;//0069A59C
    //function SetValue(NewValue:Double; ?:?):Boolean;//0069DC18
    function GetUnits:TUnits;//0069A664
  public
    ..........................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//0069DE20
    procedure GetValue; virtual;//v2C//0069A878
    procedure GetBoolean; virtual;//v30//00699C4C
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//0069D730
    procedure GetRotMat(m:TRotMat); virtual;//v40//0069A5C8
    function GetDataType:TDataType; virtual;//v44//0069A164
    function GetUnits:TUnits; virtual;//v48//0069A664
    function GetPerUnits1:TUnits; virtual;//v4C//0069A528
    function GetPerUnits2:TUnits; virtual;//v50//0069A59C
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//0069DC18
    function CanSet:Boolean; virtual;//v68//00699BE4
    procedure CreateClone; virtual;//v80//00699C1C
    procedure FillClone(c:TExpression); virtual;//v84//00699C2C
    function Module:TObject; virtual;//v98//0069DC10
  end;
  TModuleP5 = class(TPieModule)
  published
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//006A69C0
    procedure GetGoodFields;//006A69B8
    function Read:Boolean;//006A6C44
    function GetDefaultFormat(field:string):TGuiFormat;//006A694C
    procedure MonitorFrame;//006A69DC
    procedure PrepareForMonitoring;//006A6C34
    procedure GetFields;//006A69B0
    procedure ClearRead;//006A6860
    procedure StartCompiletime;//006A6C4C
    procedure StopRuntime;//006A6C78
    procedure StartRuntime;//006A6C58
    procedure StopCompiletime;//006A6C64
    function CreateValue(Identifier:string):TExpression;//006A68F8
    procedure AddFields;//0069E6A4
    constructor Create;//006A6868
  public
    function CreateValue(Identifier:string):TExpression; virtual;//v14//006A68F8
    procedure GetFields; virtual;//v18//006A69B0
    procedure GetGoodFields; virtual;//v1C//006A69B8
    procedure AddFields; virtual;//v24//0069E6A4
    procedure StartCompiletime; virtual;//v28//006A6C4C
    procedure StopCompiletime; virtual;//v2C//006A6C64
    procedure StartRuntime; virtual;//v30//006A6C58
    procedure StopRuntime; virtual;//v34//006A6C78
    procedure ClearRead; virtual;//v38//006A6860
    function Read:Boolean; virtual;//v3C//006A6C44
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//006A69C0
    function GetDefaultFormat(field:string):TGuiFormat; virtual;//v44//006A694C
    procedure PrepareForMonitoring; virtual;//v5C//006A6C34
    procedure MonitorFrame; virtual;//v68//006A69DC
  end;
  :4 = array of Boolean;
//elSize = 1;
  :5 = array of Integer;
//elSize = 4
//varType equivalent: varInteger;
    //procedure sub_00698D68(?:?; ?:?);//00698D68
    procedure sub_00698E04;//00698E04
    procedure sub_00698EA4;//00698EA4
    //function sub_00698EA8(?:?):?;//00698EA8
    //function sub_00698F14(?:?):?;//00698F14
    //function sub_00698F6C(?:?):?;//00698F6C
    //function sub_00698FC4(?:?):?;//00698FC4
    //function sub_0069901C(?:?):?;//0069901C
    //function sub_00699068(?:?):?;//00699068
    //function sub_006990B4(?:?):?;//006990B4
    //function sub_0069915C(?:?):?;//0069915C
    //procedure sub_00699220(?:?; ?:?);//00699220
    //function sub_00699278(?:UnicodeString):?;//00699278
    //procedure sub_006992EC(?:Integer; ?:?);//006992EC
    //function sub_00699320:?;//00699320
    //function sub_00699644:?;//00699644
    function sub_00699BD8:Boolean;//00699BD8
    procedure sub_0069DE8C;//0069DE8C
    procedure sub_0069E0E0;//0069E0E0
    procedure sub_0069E178;//0069E178
    //function sub_0069E220(?:string):?;//0069E220
    procedure sub_0069E438;//0069E438

implementation

//00698D68
{*procedure sub_00698D68(?:?; ?:?);
begin
 00698D68    push        ebx
 00698D69    push        esi
 00698D6A    push        edi
 00698D6B    add         esp,0FFFFFFD4
 00698D6E    mov         esi,eax
 00698D70    lea         edi,[esp+8]
 00698D74    mov         ecx,9
 00698D79    rep movs    dword ptr [edi],dword ptr [esi]
 00698D7B    mov         dword ptr [esp],edx
 00698D7E    mov         esi,3
 00698D83    lea         edx,[esp+8]
 00698D87    mov         eax,dword ptr [esp]
 00698D8A    mov         dword ptr [esp+4],eax
 00698D8E    mov         ebx,3
 00698D93    mov         eax,edx
 00698D95    mov         ecx,dword ptr [esp+4]
 00698D99    fld         dword ptr [eax]
 00698D9B    fstp        qword ptr [ecx]
 00698D9D    wait
 00698D9E    add         ecx,8
 00698DA1    add         eax,4
 00698DA4    dec         ebx
>00698DA5    jne         00698D99
 00698DA7    add         dword ptr [esp+4],18
 00698DAC    add         edx,0C
 00698DAF    dec         esi
>00698DB0    jne         00698D8E
 00698DB2    add         esp,2C
 00698DB5    pop         edi
 00698DB6    pop         esi
 00698DB7    pop         ebx
 00698DB8    ret
end;*}

//00698E04
procedure sub_00698E04;
begin
{*
 00698E04    push        ebp
 00698E05    mov         ebp,esp
 00698E07    push        0
 00698E09    push        0
 00698E0B    xor         eax,eax
 00698E0D    push        ebp
 00698E0E    push        698E64
 00698E13    push        dword ptr fs:[eax]
 00698E16    mov         dword ptr fs:[eax],esp
 00698E19    lea         ecx,[ebp-8]
 00698E1C    mov         dl,1
 00698E1E    movzx       eax,byte ptr ds:[78BE00];0x0 gvar_0078BE00
 00698E25    call        BoolToStr
 00698E2A    mov         ecx,dword ptr [ebp-8]
 00698E2D    lea         eax,[ebp-4]
 00698E30    mov         edx,698E7C;'StartCompileTimeP5 '
 00698E35    call        @UStrCat3
 00698E3A    mov         eax,dword ptr [ebp-4]
 00698E3D    call        004FA5FC
 00698E42    mov         byte ptr ds:[78BE00],0;gvar_0078BE00
 00698E49    xor         eax,eax
 00698E4B    pop         edx
 00698E4C    pop         ecx
 00698E4D    pop         ecx
 00698E4E    mov         dword ptr fs:[eax],edx
 00698E51    push        698E6B
 00698E56    lea         eax,[ebp-8]
 00698E59    mov         edx,2
 00698E5E    call        @UStrArrayClr
 00698E63    ret
>00698E64    jmp         @HandleFinally
>00698E69    jmp         00698E56
 00698E6B    pop         ecx
 00698E6C    pop         ecx
 00698E6D    pop         ebp
 00698E6E    ret
*}
end;

//00698EA4
procedure sub_00698EA4;
begin
{*
 00698EA4    ret
*}
end;

//00698EA8
{*function sub_00698EA8(?:?):?;
begin
 00698EA8    push        ebx
 00698EA9    add         esp,0FFFFFFEC
 00698EAC    mov         ebx,eax
 00698EAE    mov         dword ptr [esp+4],ebx
 00698EB2    fild        dword ptr [esp+4]
 00698EB6    add         esp,0FFFFFFF4
 00698EB9    fstp        tbyte ptr [esp]
 00698EBC    wait
 00698EBD    push        3FFF
 00698EC2    push        0CCCCCCCC
 00698EC7    push        0CCCCCCCD
 00698ECC    call        00454C48
 00698ED1    fstp        tbyte ptr [esp+8]
 00698ED5    wait
 00698ED6    push        4004
 00698EDB    push        0FC000000
 00698EE0    push        0
 00698EE2    push        3FFF
 00698EE7    push        0CCCCCCCC
 00698EEC    push        0CCCCCCCD
 00698EF1    call        00454C48
 00698EF6    fld         tbyte ptr [esp+8]
 00698EFA    fdivrp      st(1),st
 00698EFC    fmul        dword ptr ds:[698F10];61:Single
 00698F02    fstp        dword ptr [esp]
 00698F05    wait
 00698F06    fld         dword ptr [esp]
 00698F09    add         esp,14
 00698F0C    pop         ebx
 00698F0D    ret
end;*}

//00698F14
{*function sub_00698F14(?:?):?;
begin
 00698F14    push        ebx
 00698F15    add         esp,0FFFFFFF8
 00698F18    mov         ebx,eax
 00698F1A    mov         dword ptr [esp+4],ebx
 00698F1E    fild        dword ptr [esp+4]
 00698F22    add         esp,0FFFFFFFC
 00698F25    fstp        dword ptr [esp]
 00698F28    wait
 00698F29    push        40800000
 00698F2E    call        00454D50
 00698F33    fstp        dword ptr [esp+4]
 00698F37    wait
 00698F38    push        427C0000
 00698F3D    push        40800000
 00698F42    call        00454D50
 00698F47    fdivr       dword ptr [esp+4]
 00698F4B    fmul        dword ptr ds:[698F64];53:Single
 00698F51    fsub        dword ptr ds:[698F68];30:Single
 00698F57    fstp        dword ptr [esp]
 00698F5A    wait
 00698F5B    fld         dword ptr [esp]
 00698F5E    pop         ecx
 00698F5F    pop         edx
 00698F60    pop         ebx
 00698F61    ret
end;*}

//00698F6C
{*function sub_00698F6C(?:?):?;
begin
 00698F6C    push        ebx
 00698F6D    add         esp,0FFFFFFF8
 00698F70    mov         ebx,eax
 00698F72    mov         dword ptr [esp+4],ebx
 00698F76    fild        dword ptr [esp+4]
 00698F7A    add         esp,0FFFFFFFC
 00698F7D    fstp        dword ptr [esp]
 00698F80    wait
 00698F81    push        41000000
 00698F86    call        00454D50
 00698F8B    fstp        dword ptr [esp+4]
 00698F8F    wait
 00698F90    push        427C0000
 00698F95    push        41000000
 00698F9A    call        00454D50
 00698F9F    fdivr       dword ptr [esp+4]
 00698FA3    fmul        dword ptr ds:[698FBC];60:Single
 00698FA9    fsub        dword ptr ds:[698FC0];30:Single
 00698FAF    fstp        dword ptr [esp]
 00698FB2    wait
 00698FB3    fld         dword ptr [esp]
 00698FB6    pop         ecx
 00698FB7    pop         edx
 00698FB8    pop         ebx
 00698FB9    ret
end;*}

//00698FC4
{*function sub_00698FC4(?:?):?;
begin
 00698FC4    push        ebx
 00698FC5    add         esp,0FFFFFFF8
 00698FC8    mov         ebx,eax
 00698FCA    mov         dword ptr [esp+4],ebx
 00698FCE    fild        dword ptr [esp+4]
 00698FD2    add         esp,0FFFFFFFC
 00698FD5    fstp        dword ptr [esp]
 00698FD8    wait
 00698FD9    push        41000000
 00698FDE    call        00454D50
 00698FE3    fstp        dword ptr [esp+4]
 00698FE7    wait
 00698FE8    push        427C0000
 00698FED    push        41000000
 00698FF2    call        00454D50
 00698FF7    fdivr       dword ptr [esp+4]
 00698FFB    fmul        dword ptr ds:[699014];70:Single
 00699001    fsub        dword ptr ds:[699018];30:Single
 00699007    fstp        dword ptr [esp]
 0069900A    wait
 0069900B    fld         dword ptr [esp]
 0069900E    pop         ecx
 0069900F    pop         edx
 00699010    pop         ebx
 00699011    ret
end;*}

//0069901C
{*function sub_0069901C(?:?):?;
begin
 0069901C    push        ebx
 0069901D    add         esp,0FFFFFFF8
 00699020    mov         ebx,eax
 00699022    mov         dword ptr [esp+4],ebx
 00699026    fild        dword ptr [esp+4]
 0069902A    add         esp,0FFFFFFFC
 0069902D    fstp        dword ptr [esp]
 00699030    wait
 00699031    push        40400000
 00699036    call        00454D50
 0069903B    fstp        dword ptr [esp+4]
 0069903F    wait
 00699040    push        427C0000
 00699045    push        40400000
 0069904A    call        00454D50
 0069904F    fdivr       dword ptr [esp+4]
 00699053    fmul        dword ptr ds:[699064];113:Single
 00699059    fstp        dword ptr [esp]
 0069905C    wait
 0069905D    fld         dword ptr [esp]
 00699060    pop         ecx
 00699061    pop         edx
 00699062    pop         ebx
 00699063    ret
end;*}

//00699068
{*function sub_00699068(?:?):?;
begin
 00699068    push        ebx
 00699069    add         esp,0FFFFFFF8
 0069906C    mov         ebx,eax
 0069906E    mov         dword ptr [esp+4],ebx
 00699072    fild        dword ptr [esp+4]
 00699076    add         esp,0FFFFFFFC
 00699079    fstp        dword ptr [esp]
 0069907C    wait
 0069907D    push        40400000
 00699082    call        00454D50
 00699087    fstp        dword ptr [esp+4]
 0069908B    wait
 0069908C    push        427C0000
 00699091    push        40400000
 00699096    call        00454D50
 0069909B    fdivr       dword ptr [esp+4]
 0069909F    fmul        dword ptr ds:[6990B0];72:Single
 006990A5    fstp        dword ptr [esp]
 006990A8    wait
 006990A9    fld         dword ptr [esp]
 006990AC    pop         ecx
 006990AD    pop         edx
 006990AE    pop         ebx
 006990AF    ret
end;*}

//006990B4
{*function sub_006990B4(?:?):?;
begin
 006990B4    push        ebp
 006990B5    mov         ebp,esp
 006990B7    push        ecx
 006990B8    push        ebx
 006990B9    push        esi
 006990BA    mov         dword ptr [ebp-4],eax
 006990BD    mov         eax,dword ptr [ebp-4]
 006990C0    call        @UStrAddRef
 006990C5    xor         eax,eax
 006990C7    push        ebp
 006990C8    push        69912B
 006990CD    push        dword ptr fs:[eax]
 006990D0    mov         dword ptr fs:[eax],esp
 006990D3    xor         ebx,ebx
 006990D5    mov         eax,dword ptr [ebp-4]
 006990D8    test        eax,eax
>006990DA    je          006990E1
 006990DC    sub         eax,4
 006990DF    mov         eax,dword ptr [eax]
 006990E1    cmp         eax,5
>006990E4    jne         00699115
 006990E6    mov         esi,1
 006990EB    mov         edx,69913C;gvar_0069913C
 006990F0    mov         eax,dword ptr [ebp-4]
 006990F3    movzx       eax,word ptr [eax+esi*2-2]
 006990F8    cmp         ax,0FF
>006990FC    ja          00699104
 006990FE    movzx       eax,ax
 00699101    bt          dword ptr [edx],eax
 00699104    setb        al
 00699107    mov         edx,eax
 00699109    test        dl,dl
>0069910B    je          00699115
 0069910D    inc         esi
 0069910E    cmp         esi,6
>00699111    jne         006990EB
 00699113    mov         bl,1
 00699115    xor         eax,eax
 00699117    pop         edx
 00699118    pop         ecx
 00699119    pop         ecx
 0069911A    mov         dword ptr fs:[eax],edx
 0069911D    push        699132
 00699122    lea         eax,[ebp-4]
 00699125    call        @UStrClr
 0069912A    ret
>0069912B    jmp         @HandleFinally
>00699130    jmp         00699122
 00699132    mov         eax,ebx
 00699134    pop         esi
 00699135    pop         ebx
 00699136    pop         ecx
 00699137    pop         ebp
 00699138    ret
end;*}

//0069915C
{*function sub_0069915C(?:?):?;
begin
 0069915C    push        ebp
 0069915D    mov         ebp,esp
 0069915F    push        ecx
 00699160    push        ebx
 00699161    mov         dword ptr [ebp-4],eax
 00699164    mov         eax,dword ptr [ebp-4]
 00699167    call        @UStrAddRef
 0069916C    xor         eax,eax
 0069916E    push        ebp
 0069916F    push        699213
 00699174    push        dword ptr fs:[eax]
 00699177    mov         dword ptr fs:[eax],esp
 0069917A    xor         ebx,ebx
 0069917C    mov         eax,5
 00699181    mov         edx,dword ptr [ebp-4]
 00699184    movzx       edx,word ptr [edx+eax*2-2]
 00699189    cmp         dx,6C
>0069918D    je          00699195
 0069918F    cmp         dx,4C
>00699193    jne         0069919D
 00699195    mov         edx,ebx
 00699197    add         edx,edx
 00699199    add         edx,edx
 0069919B    mov         ebx,edx
 0069919D    mov         edx,dword ptr [ebp-4]
 006991A0    movzx       edx,word ptr [edx+eax*2-2]
 006991A5    cmp         dx,72
>006991A9    je          006991B1
 006991AB    cmp         dx,52
>006991AF    jne         006991BA
 006991B1    mov         edx,ebx
 006991B3    add         edx,edx
 006991B5    add         edx,edx
 006991B7    inc         edx
 006991B8    mov         ebx,edx
 006991BA    mov         edx,dword ptr [ebp-4]
 006991BD    movzx       edx,word ptr [edx+eax*2-2]
 006991C2    cmp         dx,6E
>006991C6    je          006991CE
 006991C8    cmp         dx,4E
>006991CC    jne         006991D9
 006991CE    mov         edx,ebx
 006991D0    add         edx,edx
 006991D2    add         edx,edx
 006991D4    add         edx,2
 006991D7    mov         ebx,edx
 006991D9    mov         edx,dword ptr [ebp-4]
 006991DC    movzx       edx,word ptr [edx+eax*2-2]
 006991E1    cmp         dx,78
>006991E5    je          006991ED
 006991E7    cmp         dx,58
>006991EB    jne         006991F8
 006991ED    mov         edx,ebx
 006991EF    add         edx,edx
 006991F1    add         edx,edx
 006991F3    add         edx,3
 006991F6    mov         ebx,edx
 006991F8    dec         eax
 006991F9    test        eax,eax
>006991FB    jne         00699181
 006991FD    xor         eax,eax
 006991FF    pop         edx
 00699200    pop         ecx
 00699201    pop         ecx
 00699202    mov         dword ptr fs:[eax],edx
 00699205    push        69921A
 0069920A    lea         eax,[ebp-4]
 0069920D    call        @UStrClr
 00699212    ret
>00699213    jmp         @HandleFinally
>00699218    jmp         0069920A
 0069921A    mov         eax,ebx
 0069921C    pop         ebx
 0069921D    pop         ecx
 0069921E    pop         ebp
 0069921F    ret
end;*}

//00699220
{*procedure sub_00699220(?:?; ?:?);
begin
 00699220    push        ebx
 00699221    push        esi
 00699222    push        edi
 00699223    mov         edi,edx
 00699225    mov         esi,eax
 00699227    mov         eax,edi
 00699229    mov         edx,69926C;'lllll'
 0069922E    call        @UStrAsg
 00699233    mov         ebx,1
 00699238    mov         eax,edi
 0069923A    call        @UniqueStringU
 0069923F    mov         edx,esi
 00699241    and         edx,3
 00699244    movzx       edx,word ptr [edx*2+78BE10]
 0069924C    mov         word ptr [eax+ebx*2-2],dx
 00699251    shr         esi,2
 00699254    inc         ebx
 00699255    cmp         ebx,6
>00699258    jne         00699238
 0069925A    pop         edi
 0069925B    pop         esi
 0069925C    pop         ebx
 0069925D    ret
end;*}

//00699278
{*function sub_00699278(?:UnicodeString):?;
begin
 00699278    push        ebp
 00699279    mov         ebp,esp
 0069927B    push        ecx
 0069927C    push        ebx
 0069927D    mov         dword ptr [ebp-4],eax
 00699280    mov         eax,dword ptr [ebp-4]
 00699283    call        @UStrAddRef
 00699288    xor         eax,eax
 0069928A    push        ebp
 0069928B    push        6992DC
 00699290    push        dword ptr fs:[eax]
 00699293    mov         dword ptr fs:[eax],esp
 00699296    mov         eax,dword ptr [ebp-4]
 00699299    call        006990B4
 0069929E    test        al,al
>006992A0    je          006992B4
 006992A2    mov         eax,dword ptr [ebp-4]
 006992A5    call        0069915C
 006992AA    mov         ebx,eax
 006992AC    add         ebx,3E8
>006992B2    jmp         006992C6
 006992B4    mov         eax,[0081ED64];gvar_0081ED64:TModuleP5
 006992B9    mov         eax,dword ptr [eax+1C]
 006992BC    mov         edx,dword ptr [ebp-4]
 006992BF    call        THashTable.Get
 006992C4    mov         ebx,eax
 006992C6    xor         eax,eax
 006992C8    pop         edx
 006992C9    pop         ecx
 006992CA    pop         ecx
 006992CB    mov         dword ptr fs:[eax],edx
 006992CE    push        6992E3
 006992D3    lea         eax,[ebp-4]
 006992D6    call        @UStrClr
 006992DB    ret
>006992DC    jmp         @HandleFinally
>006992E1    jmp         006992D3
 006992E3    mov         eax,ebx
 006992E5    pop         ebx
 006992E6    pop         ecx
 006992E7    pop         ebp
 006992E8    ret
end;*}

//006992EC
{*procedure sub_006992EC(?:Integer; ?:?);
begin
 006992EC    push        ebx
 006992ED    push        esi
 006992EE    mov         esi,edx
 006992F0    mov         ebx,eax
 006992F2    cmp         ebx,3E8
>006992F8    jl          0069930B
 006992FA    mov         edx,esi
 006992FC    mov         eax,ebx
 006992FE    sub         eax,3E8
 00699303    call        00699220
 00699308    pop         esi
 00699309    pop         ebx
 0069930A    ret
 0069930B    mov         ecx,esi
 0069930D    mov         eax,[0081ED64];gvar_0081ED64:TModuleP5
 00699312    mov         eax,dword ptr [eax+1C]
 00699315    mov         edx,ebx
 00699317    call        THashTable.Get
 0069931C    pop         esi
 0069931D    pop         ebx
 0069931E    ret
end;*}

//00699320
{*function sub_00699320:?;
begin
 00699320    push        ebp
 00699321    mov         ebp,esp
 00699323    push        0
 00699325    push        ebx
 00699326    push        esi
 00699327    xor         eax,eax
 00699329    push        ebp
 0069932A    push        69946B
 0069932F    push        dword ptr fs:[eax]
 00699332    mov         dword ptr fs:[eax],esp
 00699335    mov         dl,1
 00699337    mov         eax,[0043C7BC];TStringList
 0069933C    call        TStringList.Create;TStringList.Create
 00699341    mov         ebx,eax
 00699343    mov         dl,1
 00699345    mov         eax,ebx
 00699347    call        TStringList.SetSorted
 0069934C    xor         esi,esi
 0069934E    lea         edx,[ebp-4]
 00699351    mov         eax,esi
 00699353    call        006992EC
 00699358    cmp         dword ptr [ebp-4],0
>0069935C    je          00699368
 0069935E    mov         edx,dword ptr [ebp-4]
 00699361    mov         eax,ebx
 00699363    mov         ecx,dword ptr [eax]
 00699365    call        dword ptr [ecx+38];TStringList.Add
 00699368    inc         esi
 00699369    cmp         esi,2BD
>0069936F    jne         0069934E
 00699371    mov         edx,699488;'lllll'
 00699376    mov         eax,ebx
 00699378    mov         ecx,dword ptr [eax]
 0069937A    call        dword ptr [ecx+38];TStringList.Add
 0069937D    mov         edx,6994A0;'rrrrr'
 00699382    mov         eax,ebx
 00699384    mov         ecx,dword ptr [eax]
 00699386    call        dword ptr [ecx+38];TStringList.Add
 00699389    mov         edx,6994B8;'nnnnn'
 0069938E    mov         eax,ebx
 00699390    mov         ecx,dword ptr [eax]
 00699392    call        dword ptr [ecx+38];TStringList.Add
 00699395    mov         edx,6994D0;'xnnnn'
 0069939A    mov         eax,ebx
 0069939C    mov         ecx,dword ptr [eax]
 0069939E    call        dword ptr [ecx+38];TStringList.Add
 006993A1    mov         edx,6994E8;'xnnnl'
 006993A6    mov         eax,ebx
 006993A8    mov         ecx,dword ptr [eax]
 006993AA    call        dword ptr [ecx+38];TStringList.Add
 006993AD    mov         edx,699500;'xnnln'
 006993B2    mov         eax,ebx
 006993B4    mov         ecx,dword ptr [eax]
 006993B6    call        dword ptr [ecx+38];TStringList.Add
 006993B9    mov         edx,699518;'xnnll'
 006993BE    mov         eax,ebx
 006993C0    mov         ecx,dword ptr [eax]
 006993C2    call        dword ptr [ecx+38];TStringList.Add
 006993C5    mov         edx,699530;'xnlnn'
 006993CA    mov         eax,ebx
 006993CC    mov         ecx,dword ptr [eax]
 006993CE    call        dword ptr [ecx+38];TStringList.Add
 006993D1    mov         edx,699548;'xnlnl'
 006993D6    mov         eax,ebx
 006993D8    mov         ecx,dword ptr [eax]
 006993DA    call        dword ptr [ecx+38];TStringList.Add
 006993DD    mov         edx,699560;'xnlln'
 006993E2    mov         eax,ebx
 006993E4    mov         ecx,dword ptr [eax]
 006993E6    call        dword ptr [ecx+38];TStringList.Add
 006993E9    mov         edx,699578;'xnlll'
 006993EE    mov         eax,ebx
 006993F0    mov         ecx,dword ptr [eax]
 006993F2    call        dword ptr [ecx+38];TStringList.Add
 006993F5    mov         edx,699590;'xlnnn'
 006993FA    mov         eax,ebx
 006993FC    mov         ecx,dword ptr [eax]
 006993FE    call        dword ptr [ecx+38];TStringList.Add
 00699401    mov         edx,6995A8;'xlnnl'
 00699406    mov         eax,ebx
 00699408    mov         ecx,dword ptr [eax]
 0069940A    call        dword ptr [ecx+38];TStringList.Add
 0069940D    mov         edx,6995C0;'xlnln'
 00699412    mov         eax,ebx
 00699414    mov         ecx,dword ptr [eax]
 00699416    call        dword ptr [ecx+38];TStringList.Add
 00699419    mov         edx,6995D8;'xlnll'
 0069941E    mov         eax,ebx
 00699420    mov         ecx,dword ptr [eax]
 00699422    call        dword ptr [ecx+38];TStringList.Add
 00699425    mov         edx,6995F0;'xllnn'
 0069942A    mov         eax,ebx
 0069942C    mov         ecx,dword ptr [eax]
 0069942E    call        dword ptr [ecx+38];TStringList.Add
 00699431    mov         edx,699608;'xllnl'
 00699436    mov         eax,ebx
 00699438    mov         ecx,dword ptr [eax]
 0069943A    call        dword ptr [ecx+38];TStringList.Add
 0069943D    mov         edx,699620;'xllln'
 00699442    mov         eax,ebx
 00699444    mov         ecx,dword ptr [eax]
 00699446    call        dword ptr [ecx+38];TStringList.Add
 00699449    mov         edx,699638;'xllll'
 0069944E    mov         eax,ebx
 00699450    mov         ecx,dword ptr [eax]
 00699452    call        dword ptr [ecx+38];TStringList.Add
 00699455    xor         eax,eax
 00699457    pop         edx
 00699458    pop         ecx
 00699459    pop         ecx
 0069945A    mov         dword ptr fs:[eax],edx
 0069945D    push        699472
 00699462    lea         eax,[ebp-4]
 00699465    call        @UStrClr
 0069946A    ret
>0069946B    jmp         @HandleFinally
>00699470    jmp         00699462
 00699472    mov         eax,ebx
 00699474    pop         esi
 00699475    pop         ebx
 00699476    pop         ecx
 00699477    pop         ebp
 00699478    ret
end;*}

//00699644
{*function sub_00699644:?;
begin
 00699644    push        ebx
 00699645    mov         dl,1
 00699647    mov         eax,[0043C7BC];TStringList
 0069964C    call        TStringList.Create;TStringList.Create
 00699651    mov         ebx,eax
 00699653    mov         edx,6997FC;'thumb'
 00699658    mov         eax,ebx
 0069965A    mov         ecx,dword ptr [eax]
 0069965C    call        dword ptr [ecx+38];TStringList.Add
 0069965F    mov         edx,699814;'index'
 00699664    mov         eax,ebx
 00699666    mov         ecx,dword ptr [eax]
 00699668    call        dword ptr [ecx+38];TStringList.Add
 0069966B    mov         edx,69982C;'middle'
 00699670    mov         eax,ebx
 00699672    mov         ecx,dword ptr [eax]
 00699674    call        dword ptr [ecx+38];TStringList.Add
 00699677    mov         edx,699848;'ring'
 0069967C    mov         eax,ebx
 0069967E    mov         ecx,dword ptr [eax]
 00699680    call        dword ptr [ecx+38];TStringList.Add
 00699683    mov         edx,699860;'pinky'
 00699688    mov         eax,ebx
 0069968A    mov         ecx,dword ptr [eax]
 0069968C    call        dword ptr [ecx+38];TStringList.Add
 0069968F    mov         edx,699878;'A'
 00699694    mov         eax,ebx
 00699696    mov         ecx,dword ptr [eax]
 00699698    call        dword ptr [ecx+38];TStringList.Add
 0069969B    mov         edx,699888;'B'
 006996A0    mov         eax,ebx
 006996A2    mov         ecx,dword ptr [eax]
 006996A4    call        dword ptr [ecx+38];TStringList.Add
 006996A7    mov         edx,699898;'C'
 006996AC    mov         eax,ebx
 006996AE    mov         ecx,dword ptr [eax]
 006996B0    call        dword ptr [ecx+38];TStringList.Add
 006996B3    mov         edx,6998A8;'D'
 006996B8    mov         eax,ebx
 006996BA    mov         ecx,dword ptr [eax]
 006996BC    call        dword ptr [ecx+38];TStringList.Add
 006996BF    mov         edx,6998B8;'x'
 006996C4    mov         eax,ebx
 006996C6    mov         ecx,dword ptr [eax]
 006996C8    call        dword ptr [ecx+38];TStringList.Add
 006996CB    mov         edx,6998C8;'y'
 006996D0    mov         eax,ebx
 006996D2    mov         ecx,dword ptr [eax]
 006996D4    call        dword ptr [ecx+38];TStringList.Add
 006996D7    mov         edx,6998D8;'z'
 006996DC    mov         eax,ebx
 006996DE    mov         ecx,dword ptr [eax]
 006996E0    call        dword ptr [ecx+38];TStringList.Add
 006996E3    mov         edx,6998E8;'pitch'
 006996E8    mov         eax,ebx
 006996EA    mov         ecx,dword ptr [eax]
 006996EC    call        dword ptr [ecx+38];TStringList.Add
 006996EF    mov         edx,699900;'yaw'
 006996F4    mov         eax,ebx
 006996F6    mov         ecx,dword ptr [eax]
 006996F8    call        dword ptr [ecx+38];TStringList.Add
 006996FB    mov         edx,699914;'roll'
 00699700    mov         eax,ebx
 00699702    mov         ecx,dword ptr [eax]
 00699704    call        dword ptr [ecx+38];TStringList.Add
 00699707    mov         edx,69992C;'lllll'
 0069970C    mov         eax,ebx
 0069970E    mov         ecx,dword ptr [eax]
 00699710    call        dword ptr [ecx+38];TStringList.Add
 00699713    mov         edx,699944;'rrrrr'
 00699718    mov         eax,ebx
 0069971A    mov         ecx,dword ptr [eax]
 0069971C    call        dword ptr [ecx+38];TStringList.Add
 0069971F    mov         edx,69995C;'nnnnn'
 00699724    mov         eax,ebx
 00699726    mov         ecx,dword ptr [eax]
 00699728    call        dword ptr [ecx+38];TStringList.Add
 0069972B    mov         edx,699974;'xnnnn'
 00699730    mov         eax,ebx
 00699732    mov         ecx,dword ptr [eax]
 00699734    call        dword ptr [ecx+38];TStringList.Add
 00699737    mov         edx,69998C;'xnnnl'
 0069973C    mov         eax,ebx
 0069973E    mov         ecx,dword ptr [eax]
 00699740    call        dword ptr [ecx+38];TStringList.Add
 00699743    mov         edx,6999A4;'xnnln'
 00699748    mov         eax,ebx
 0069974A    mov         ecx,dword ptr [eax]
 0069974C    call        dword ptr [ecx+38];TStringList.Add
 0069974F    mov         edx,6999BC;'xnnll'
 00699754    mov         eax,ebx
 00699756    mov         ecx,dword ptr [eax]
 00699758    call        dword ptr [ecx+38];TStringList.Add
 0069975B    mov         edx,6999D4;'xnlnn'
 00699760    mov         eax,ebx
 00699762    mov         ecx,dword ptr [eax]
 00699764    call        dword ptr [ecx+38];TStringList.Add
 00699767    mov         edx,6999EC;'xnlnl'
 0069976C    mov         eax,ebx
 0069976E    mov         ecx,dword ptr [eax]
 00699770    call        dword ptr [ecx+38];TStringList.Add
 00699773    mov         edx,699A04;'xnlln'
 00699778    mov         eax,ebx
 0069977A    mov         ecx,dword ptr [eax]
 0069977C    call        dword ptr [ecx+38];TStringList.Add
 0069977F    mov         edx,699A1C;'xnlll'
 00699784    mov         eax,ebx
 00699786    mov         ecx,dword ptr [eax]
 00699788    call        dword ptr [ecx+38];TStringList.Add
 0069978B    mov         edx,699A34;'xlnnn'
 00699790    mov         eax,ebx
 00699792    mov         ecx,dword ptr [eax]
 00699794    call        dword ptr [ecx+38];TStringList.Add
 00699797    mov         edx,699A4C;'xlnnl'
 0069979C    mov         eax,ebx
 0069979E    mov         ecx,dword ptr [eax]
 006997A0    call        dword ptr [ecx+38];TStringList.Add
 006997A3    mov         edx,699A64;'xlnln'
 006997A8    mov         eax,ebx
 006997AA    mov         ecx,dword ptr [eax]
 006997AC    call        dword ptr [ecx+38];TStringList.Add
 006997AF    mov         edx,699A7C;'xlnll'
 006997B4    mov         eax,ebx
 006997B6    mov         ecx,dword ptr [eax]
 006997B8    call        dword ptr [ecx+38];TStringList.Add
 006997BB    mov         edx,699A94;'xllnn'
 006997C0    mov         eax,ebx
 006997C2    mov         ecx,dword ptr [eax]
 006997C4    call        dword ptr [ecx+38];TStringList.Add
 006997C7    mov         edx,699AAC;'xllnl'
 006997CC    mov         eax,ebx
 006997CE    mov         ecx,dword ptr [eax]
 006997D0    call        dword ptr [ecx+38];TStringList.Add
 006997D3    mov         edx,699AC4;'xllln'
 006997D8    mov         eax,ebx
 006997DA    mov         ecx,dword ptr [eax]
 006997DC    call        dword ptr [ecx+38];TStringList.Add
 006997DF    mov         edx,699ADC;'xllll'
 006997E4    mov         eax,ebx
 006997E6    mov         ecx,dword ptr [eax]
 006997E8    call        dword ptr [ecx+38];TStringList.Add
 006997EB    mov         eax,ebx
 006997ED    pop         ebx
 006997EE    ret
end;*}

//00699BD8
function sub_00699BD8:Boolean;
begin
{*
 00699BD8    cmp         dword ptr ds:[78BE04],0;gvar_0078BE04:Pointer
 00699BDF    setne       al
 00699BE2    ret
*}
end;

//00699BE4
function TGloveValue.CanSet:Boolean;
begin
{*
 00699BE4    xor         eax,eax
 00699BE6    ret
*}
end;

//00699BE8
constructor TGloveValue.Create;
begin
{*
 00699BE8    test        dl,dl
>00699BEA    je          00699BF4
 00699BEC    add         esp,0FFFFFFF0
 00699BEF    call        @ClassCreate
 00699BF4    mov         dword ptr ds:[78BE0C],30;gvar_0078BE0C:Single
 00699BFE    mov         dword ptr ds:[78BE08],1B;gvar_0078BE08:Single
 00699C08    test        dl,dl
>00699C0A    je          00699C1B
 00699C0C    call        @AfterConstruction
 00699C11    pop         dword ptr fs:[0]
 00699C18    add         esp,0C
 00699C1B    ret
*}
end;

//00699C1C
procedure TGloveValue.CreateClone;
begin
{*
 00699C1C    mov         dl,1
 00699C1E    mov         eax,[00698468];TGloveValue
 00699C23    call        TGloveValue.Create;TGloveValue.Create
 00699C28    ret
*}
end;

//00699C2C
procedure TGloveValue.FillClone(c:TExpression);
begin
{*
 00699C2C    push        ebx
 00699C2D    push        esi
 00699C2E    mov         esi,edx
 00699C30    mov         ebx,eax
 00699C32    mov         edx,esi
 00699C34    mov         eax,ebx
 00699C36    call        TExpression.FillClone
 00699C3B    mov         eax,esi
 00699C3D    mov         edx,dword ptr [ebx+18];TGloveValue.........................................................
 00699C40    mov         dword ptr [eax+18],edx
 00699C43    mov         edx,dword ptr [ebx+20];TGloveValue............................Item:Integer
 00699C46    mov         dword ptr [eax+20],edx
 00699C49    pop         esi
 00699C4A    pop         ebx
 00699C4B    ret
*}
end;

//00699C4C
procedure TGloveValue.GetBoolean;
begin
{*
 00699C4C    push        ebx
 00699C4D    push        ecx
 00699C4E    mov         ebx,eax
 00699C50    mov         eax,dword ptr [ebx+18];TGloveValue.........................................................
 00699C53    cmp         eax,dword ptr ds:[81ED78];gvar_0081ED78:Single
>00699C59    jl          00699C60
 00699C5B    xor         eax,eax
 00699C5D    pop         edx
 00699C5E    pop         ebx
 00699C5F    ret
 00699C60    mov         ax,133F
 00699C64    call        Set8087CW
 00699C69    mov         eax,dword ptr [ebx+18];TGloveValue.........................................................
 00699C6C    push        eax
 00699C6D    call        P5DLL.P5_GetStatePointer
 00699C72    test        eax,eax
>00699C74    jne         00699C7B
 00699C76    xor         eax,eax
 00699C78    pop         edx
 00699C79    pop         ebx
 00699C7A    ret
 00699C7B    mov         edx,dword ptr [ebx+20];TGloveValue.............................Item:Integer
 00699C7E    mov         ecx,edx
 00699C80    cmp         ecx,14
>00699C83    jg          00699CEB
>00699C85    je          00699F6F
 00699C8B    cmp         ecx,13
>00699C8E    ja          0069A14A
 00699C94    jmp         dword ptr [ecx*4+699C9B]
 00699C94    dd          0069A14A
 00699C94    dd          00699DB3
 00699C94    dd          00699DC2
 00699C94    dd          00699DD1
 00699C94    dd          00699DE0
 00699C94    dd          00699DEF
 00699C94    dd          00699DFE
 00699C94    dd          00699E0A
 00699C94    dd          00699E16
 00699C94    dd          00699E22
 00699C94    dd          00699E2E
 00699C94    dd          00699E48
 00699C94    dd          00699E62
 00699C94    dd          00699E7C
 00699C94    dd          00699E99
 00699C94    dd          00699EB6
 00699C94    dd          00699ED3
 00699C94    dd          00699EED
 00699C94    dd          00699F07
 00699C94    dd          00699F8D
 00699CEB    cmp         ecx,0AB
>00699CF1    jg          00699D4C
>00699CF3    je          0069A021
 00699CF9    cmp         ecx,4A
>00699CFC    jg          00699D27
>00699CFE    je          00699FB2
 00699D04    sub         ecx,15
>00699D07    je          00699F21
 00699D0D    dec         ecx
>00699D0E    je          00699F3B
 00699D14    dec         ecx
>00699D15    je          00699F55
 00699D1B    dec         ecx
>00699D1C    je          00699F7E
>00699D22    jmp         0069A14A
 00699D27    sub         ecx,4B
>00699D2A    je          00699FBE
 00699D30    sub         ecx,4F
>00699D33    je          00699FDC
 00699D39    dec         ecx
>00699D3A    je          00699FE3
 00699D40    dec         ecx
>00699D41    je          0069A000
>00699D47    jmp         0069A14A
 00699D4C    cmp         ecx,0B0
>00699D52    jg          00699D80
>00699D54    je          0069A0D2
 00699D5A    sub         ecx,0AC
>00699D60    je          0069A045
 00699D66    dec         ecx
>00699D67    je          0069A069
 00699D6D    dec         ecx
>00699D6E    je          0069A08D
 00699D74    dec         ecx
>00699D75    je          0069A0B1
>00699D7B    jmp         0069A14A
 00699D80    sub         ecx,0B1
>00699D86    je          0069A0F0
 00699D8C    dec         ecx
>00699D8D    je          0069A10E
 00699D93    sub         ecx,36
>00699D96    je          0069A12C
 00699D9C    add         ecx,0FFFFFD00
 00699DA2    sub         ecx,400
>00699DA8    jb          00699FCA
>00699DAE    jmp         0069A14A
 00699DB3    cmp         byte ptr [eax+0C4],20
 00699DBA    setae       al
>00699DBD    jmp         0069A151
 00699DC2    cmp         byte ptr [eax+0C5],20
 00699DC9    setae       al
>00699DCC    jmp         0069A151
 00699DD1    cmp         byte ptr [eax+0C6],20
 00699DD8    setae       al
>00699DDB    jmp         0069A151
 00699DE0    cmp         byte ptr [eax+0C7],20
 00699DE7    setae       al
>00699DEA    jmp         0069A151
 00699DEF    cmp         byte ptr [eax+0C8],20
 00699DF6    setae       al
>00699DF9    jmp         0069A151
 00699DFE    movzx       eax,byte ptr [eax+0FC]
>00699E05    jmp         0069A151
 00699E0A    movzx       eax,byte ptr [eax+0FD]
>00699E11    jmp         0069A151
 00699E16    movzx       eax,byte ptr [eax+0FE]
>00699E1D    jmp         0069A151
 00699E22    movzx       eax,byte ptr [eax+0FF]
>00699E29    jmp         0069A151
 00699E2E    fld         dword ptr [eax+24]
 00699E31    fdiv        dword ptr ds:[69A154];100:Single
 00699E37    add         esp,0FFFFFFF8
 00699E3A    fstp        qword ptr [esp]
 00699E3D    wait
 00699E3E    call        00686060
>00699E43    jmp         0069A151
 00699E48    fld         dword ptr [eax+28]
 00699E4B    fdiv        dword ptr ds:[69A154];100:Single
 00699E51    add         esp,0FFFFFFF8
 00699E54    fstp        qword ptr [esp]
 00699E57    wait
 00699E58    call        00686060
>00699E5D    jmp         0069A151
 00699E62    fld         dword ptr [eax+2C]
 00699E65    fdiv        dword ptr ds:[69A154];100:Single
 00699E6B    add         esp,0FFFFFFF8
 00699E6E    fstp        qword ptr [esp]
 00699E71    wait
 00699E72    call        00686060
>00699E77    jmp         0069A151
 00699E7C    fld         dword ptr [eax+9C]
 00699E82    fdiv        dword ptr ds:[69A158];50:Single
 00699E88    add         esp,0FFFFFFF8
 00699E8B    fstp        qword ptr [esp]
 00699E8E    wait
 00699E8F    call        00686060
>00699E94    jmp         0069A151
 00699E99    fld         dword ptr [eax+0A0]
 00699E9F    fdiv        dword ptr ds:[69A158];50:Single
 00699EA5    add         esp,0FFFFFFF8
 00699EA8    fstp        qword ptr [esp]
 00699EAB    wait
 00699EAC    call        00686060
>00699EB1    jmp         0069A151
 00699EB6    fld         dword ptr [eax+0A4]
 00699EBC    fdiv        dword ptr ds:[69A158];50:Single
 00699EC2    add         esp,0FFFFFFF8
 00699EC5    fstp        qword ptr [esp]
 00699EC8    wait
 00699EC9    call        00686060
>00699ECE    jmp         0069A151
 00699ED3    fld         dword ptr [eax+30]
 00699ED6    fdiv        dword ptr ds:[69A15C];2000:Single
 00699EDC    add         esp,0FFFFFFF8
 00699EDF    fstp        qword ptr [esp]
 00699EE2    wait
 00699EE3    call        00686060
>00699EE8    jmp         0069A151
 00699EED    fld         dword ptr [eax+34]
 00699EF0    fdiv        dword ptr ds:[69A15C];2000:Single
 00699EF6    add         esp,0FFFFFFF8
 00699EF9    fstp        qword ptr [esp]
 00699EFC    wait
 00699EFD    call        00686060
>00699F02    jmp         0069A151
 00699F07    fld         dword ptr [eax+38]
 00699F0A    fdiv        dword ptr ds:[69A15C];2000:Single
 00699F10    add         esp,0FFFFFFF8
 00699F13    fstp        qword ptr [esp]
 00699F16    wait
 00699F17    call        00686060
>00699F1C    jmp         0069A151
 00699F21    fld         dword ptr [eax+3C]
 00699F24    fdiv        dword ptr ds:[69A160];1000:Single
 00699F2A    add         esp,0FFFFFFF8
 00699F2D    fstp        qword ptr [esp]
 00699F30    wait
 00699F31    call        00686060
>00699F36    jmp         0069A151
 00699F3B    fld         dword ptr [eax+40]
 00699F3E    fdiv        dword ptr ds:[69A160];1000:Single
 00699F44    add         esp,0FFFFFFF8
 00699F47    fstp        qword ptr [esp]
 00699F4A    wait
 00699F4B    call        00686060
>00699F50    jmp         0069A151
 00699F55    fld         dword ptr [eax+44]
 00699F58    fdiv        dword ptr ds:[69A160];1000:Single
 00699F5E    add         esp,0FFFFFFF8
 00699F61    fstp        qword ptr [esp]
 00699F64    wait
 00699F65    call        00686060
>00699F6A    jmp         0069A151
 00699F6F    cmp         dword ptr [eax+0C0],1
 00699F76    sbb         eax,eax
 00699F78    inc         eax
>00699F79    jmp         0069A151
 00699F7E    cmp         dword ptr [eax+0C0],1
 00699F85    sbb         eax,eax
 00699F87    inc         eax
>00699F88    jmp         0069A151
 00699F8D    mov         ax,133F
 00699F91    call        Set8087CW
 00699F96    call        P5DLL.P5_GetCount
 00699F9B    mov         dword ptr [esp],eax
 00699F9E    fild        dword ptr [esp]
 00699FA1    add         esp,0FFFFFFF8
 00699FA4    fstp        qword ptr [esp]
 00699FA7    wait
 00699FA8    call        00686060
>00699FAD    jmp         0069A151
 00699FB2    movzx       eax,byte ptr ds:[81ED68];gvar_0081ED68:Boolean
>00699FB9    jmp         0069A151
 00699FBE    movzx       eax,byte ptr ds:[81ED69];gvar_0081ED69:Boolean
>00699FC5    jmp         0069A151
 00699FCA    sub         edx,3E8
 00699FD0    mov         eax,ebx
 00699FD2    call        TGloveValue.GetLLLLL
>00699FD7    jmp         0069A151
 00699FDC    mov         al,1
>00699FDE    jmp         0069A151
 00699FE3    mov         ax,133F
 00699FE7    call        Set8087CW
 00699FEC    mov         eax,dword ptr [ebx+18];TGloveValue.........................................................
 00699FEF    push        eax
 00699FF0    call        P5DLL.P5_GetMouseState
 00699FF5    cmp         eax,1
 00699FF8    sbb         eax,eax
 00699FFA    inc         eax
>00699FFB    jmp         0069A151
 0069A000    mov         eax,dword ptr [ebx+18];TGloveValue.........................................................
 0069A003    cmp         eax,dword ptr ds:[81ED78];gvar_0081ED78:Single
>0069A009    jl          0069A012
 0069A00B    xor         eax,eax
>0069A00D    jmp         0069A151
 0069A012    mov         edx,dword ptr ds:[81ED7C];gvar_0081ED7C:?
 0069A018    movzx       eax,byte ptr [edx+eax]
>0069A01C    jmp         0069A151
 0069A021    cmp         dword ptr [eax+0C0],0
>0069A028    jne         0069A03E
 0069A02A    mov         eax,[0081ED80];gvar_0081ED80:?
 0069A02F    mov         edx,dword ptr [ebx+18];TGloveValue.........................................................
 0069A032    cmp         dword ptr [eax+edx*4],1
 0069A036    sete        al
>0069A039    jmp         0069A151
 0069A03E    xor         eax,eax
>0069A040    jmp         0069A151
 0069A045    cmp         dword ptr [eax+0C0],0
>0069A04C    jne         0069A062
 0069A04E    mov         eax,[0081ED80];gvar_0081ED80:?
 0069A053    mov         edx,dword ptr [ebx+18];TGloveValue.........................................................
 0069A056    cmp         dword ptr [eax+edx*4],2
 0069A05A    sete        al
>0069A05D    jmp         0069A151
 0069A062    xor         eax,eax
>0069A064    jmp         0069A151
 0069A069    cmp         dword ptr [eax+0C0],0
>0069A070    jne         0069A086
 0069A072    mov         eax,[0081ED80];gvar_0081ED80:?
 0069A077    mov         edx,dword ptr [ebx+18];TGloveValue.........................................................
 0069A07A    cmp         dword ptr [eax+edx*4],3
 0069A07E    sete        al
>0069A081    jmp         0069A151
 0069A086    xor         eax,eax
>0069A088    jmp         0069A151
 0069A08D    cmp         dword ptr [eax+0C0],0
>0069A094    jne         0069A0AA
 0069A096    mov         eax,[0081ED80];gvar_0081ED80:?
 0069A09B    mov         edx,dword ptr [ebx+18];TGloveValue.........................................................
 0069A09E    cmp         dword ptr [eax+edx*4],4
 0069A0A2    sete        al
>0069A0A5    jmp         0069A151
 0069A0AA    xor         eax,eax
>0069A0AC    jmp         0069A151
 0069A0B1    cmp         dword ptr [eax+0C0],0
>0069A0B8    jne         0069A0CE
 0069A0BA    mov         eax,[0081ED80];gvar_0081ED80:?
 0069A0BF    mov         edx,dword ptr [ebx+18];TGloveValue.........................................................
 0069A0C2    cmp         dword ptr [eax+edx*4],5
 0069A0C6    sete        al
>0069A0C9    jmp         0069A151
 0069A0CE    xor         eax,eax
>0069A0D0    jmp         0069A151
 0069A0D2    cmp         dword ptr [eax+0C0],0
>0069A0D9    jne         0069A0EC
 0069A0DB    mov         eax,[0081ED80];gvar_0081ED80:?
 0069A0E0    mov         edx,dword ptr [ebx+18];TGloveValue.........................................................
 0069A0E3    cmp         dword ptr [eax+edx*4],6
 0069A0E7    sete        al
>0069A0EA    jmp         0069A151
 0069A0EC    xor         eax,eax
>0069A0EE    jmp         0069A151
 0069A0F0    cmp         dword ptr [eax+0C0],0
>0069A0F7    jne         0069A10A
 0069A0F9    mov         eax,[0081ED80];gvar_0081ED80:?
 0069A0FE    mov         edx,dword ptr [ebx+18];TGloveValue.........................................................
 0069A101    cmp         dword ptr [eax+edx*4],8
 0069A105    sete        al
>0069A108    jmp         0069A151
 0069A10A    xor         eax,eax
>0069A10C    jmp         0069A151
 0069A10E    cmp         dword ptr [eax+0C0],0
>0069A115    jne         0069A128
 0069A117    mov         eax,[0081ED80];gvar_0081ED80:?
 0069A11C    mov         edx,dword ptr [ebx+18];TGloveValue.........................................................
 0069A11F    cmp         dword ptr [eax+edx*4],0
 0069A123    sete        al
>0069A126    jmp         0069A151
 0069A128    xor         eax,eax
>0069A12A    jmp         0069A151
 0069A12C    cmp         dword ptr [eax+0C0],0
>0069A133    jne         0069A146
 0069A135    mov         eax,[0081ED80];gvar_0081ED80:?
 0069A13A    mov         edx,dword ptr [ebx+18];TGloveValue.........................................................
 0069A13D    cmp         dword ptr [eax+edx*4],9
 0069A141    sete        al
>0069A144    jmp         0069A151
 0069A146    xor         eax,eax
>0069A148    jmp         0069A151
 0069A14A    mov         eax,ebx
 0069A14C    call        TExpression.GetBoolean
 0069A151    pop         edx
 0069A152    pop         ebx
 0069A153    ret
*}
end;

//0069A164
function TGloveValue.GetDataType:TDataType;
begin
{*
 0069A164    mov         eax,dword ptr [eax+20];TGloveValue..............................Item:Integer
 0069A167    cmp         eax,90
>0069A16C    jge         0069A2D9
 0069A172    cmp         eax,70
>0069A175    jge         0069A246
 0069A17B    cmp         eax,4E
>0069A17E    jge         0069A1F4
 0069A180    cmp         eax,18
>0069A183    ja          0069A46A
 0069A189    jmp         dword ptr [eax*4+69A190]
 0069A189    dd          0069A46A
 0069A189    dd          0069A437
 0069A189    dd          0069A437
 0069A189    dd          0069A437
 0069A189    dd          0069A437
 0069A189    dd          0069A437
 0069A189    dd          0069A43A
 0069A189    dd          0069A43A
 0069A189    dd          0069A43A
 0069A189    dd          0069A43A
 0069A189    dd          0069A43D
 0069A189    dd          0069A43D
 0069A189    dd          0069A43D
 0069A189    dd          0069A449
 0069A189    dd          0069A449
 0069A189    dd          0069A449
 0069A189    dd          0069A46A
 0069A189    dd          0069A46A
 0069A189    dd          0069A46A
 0069A189    dd          0069A46A
 0069A189    dd          0069A45B
 0069A189    dd          0069A46A
 0069A189    dd          0069A46A
 0069A189    dd          0069A46A
 0069A189    dd          0069A45E
 0069A1F4    cmp         eax,66
>0069A1F7    jge         0069A21C
 0069A1F9    add         eax,0FFFFFFB2
 0069A1FC    sub         eax,12
>0069A1FF    jb          0069A44C
 0069A205    add         eax,0FFFFFFFE
 0069A208    sub         eax,3
>0069A20B    jb          0069A440
>0069A211    je          0069A443
>0069A217    jmp         0069A46A
 0069A21C    add         eax,0FFFFFF9A
 0069A21F    sub         eax,3
>0069A222    jb          0069A446
 0069A228    sub         eax,3
>0069A22B    jb          0069A440
>0069A231    je          0069A443
 0069A237    dec         eax
 0069A238    sub         eax,3
>0069A23B    jb          0069A446
>0069A241    jmp         0069A46A
 0069A246    add         eax,0FFFFFF90
 0069A249    cmp         eax,1F
>0069A24C    ja          0069A46A
 0069A252    jmp         dword ptr [eax*4+69A259]
 0069A252    dd          0069A440
 0069A252    dd          0069A440
 0069A252    dd          0069A440
 0069A252    dd          0069A443
 0069A252    dd          0069A446
 0069A252    dd          0069A446
 0069A252    dd          0069A446
 0069A252    dd          0069A440
 0069A252    dd          0069A440
 0069A252    dd          0069A440
 0069A252    dd          0069A443
 0069A252    dd          0069A446
 0069A252    dd          0069A446
 0069A252    dd          0069A446
 0069A252    dd          0069A440
 0069A252    dd          0069A440
 0069A252    dd          0069A440
 0069A252    dd          0069A443
 0069A252    dd          0069A446
 0069A252    dd          0069A446
 0069A252    dd          0069A446
 0069A252    dd          0069A440
 0069A252    dd          0069A440
 0069A252    dd          0069A440
 0069A252    dd          0069A443
 0069A252    dd          0069A446
 0069A252    dd          0069A446
 0069A252    dd          0069A446
 0069A252    dd          0069A440
 0069A252    dd          0069A440
 0069A252    dd          0069A440
 0069A252    dd          0069A443
 0069A2D9    cmp         eax,14A
>0069A2DE    jge         0069A39F
 0069A2E4    cmp         eax,0DA
>0069A2E9    jge         0069A348
 0069A2EB    cmp         eax,97
>0069A2F0    jge         0069A314
 0069A2F2    add         eax,0FFFFFF70
 0069A2F7    sub         eax,3
>0069A2FA    jb          0069A446
 0069A300    sub         eax,3
>0069A303    jb          0069A440
>0069A309    je          0069A443
>0069A30F    jmp         0069A46A
 0069A314    add         eax,0FFFFFF69
 0069A319    sub         eax,3
>0069A31C    jb          0069A446
 0069A322    sub         eax,3
>0069A325    jb          0069A44F
 0069A32B    add         eax,0FFFFFFF2
 0069A32E    sub         eax,8
>0069A331    jb          0069A461
 0069A337    add         eax,0FFFFFFEB
 0069A33A    sub         eax,12
>0069A33D    jb          0069A464
>0069A343    jmp         0069A46A
 0069A348    cmp         eax,0E9
>0069A34D    jg          0069A377
>0069A34F    je          0069A464
 0069A355    add         eax,0FFFFFF26
 0069A35A    sub         eax,2
>0069A35D    jb          0069A467
 0069A363    sub         eax,0C
>0069A366    jb          0069A431
>0069A36C    je          0069A461
>0069A372    jmp         0069A46A
 0069A377    add         eax,0FFFFFF10
 0069A37C    sub         eax,0A
>0069A37F    jb          0069A434
 0069A385    sub         eax,3
>0069A388    jb          0069A431
 0069A38E    add         eax,0FFFFFFD1
 0069A391    sub         eax,1B
>0069A394    jb          0069A452
>0069A39A    jmp         0069A46A
 0069A39F    cmp         eax,212
>0069A3A4    jge         0069A3F6
 0069A3A6    cmp         eax,1AE
>0069A3AB    jge         0069A3D8
 0069A3AD    add         eax,0FFFFFEB6
 0069A3B2    sub         eax,1B
>0069A3B5    jb          0069A452
 0069A3BB    add         eax,0FFFFFFFD
 0069A3BE    sub         eax,1B
>0069A3C1    jb          0069A452
 0069A3C7    add         eax,0FFFFFFF3
 0069A3CA    sub         eax,1B
>0069A3CD    jb          0069A455
>0069A3D3    jmp         0069A46A
 0069A3D8    add         eax,0FFFFFE52
 0069A3DD    sub         eax,1B
>0069A3E0    jb          0069A455
 0069A3E2    add         eax,0FFFFFFFD
 0069A3E5    sub         eax,1B
>0069A3E8    jb          0069A455
 0069A3EA    add         eax,0FFFFFFF3
 0069A3ED    sub         eax,1B
>0069A3F0    jb          0069A455
>0069A3F2    je          0069A458
>0069A3F4    jmp         0069A46A
 0069A3F6    cmp         eax,24B
>0069A3FB    jg          0069A415
>0069A3FD    je          0069A458
 0069A3FF    add         eax,0FFFFFDEE
 0069A404    sub         eax,1B
>0069A407    jb          0069A455
>0069A409    je          0069A458
 0069A40B    add         eax,0FFFFFFFD
 0069A40E    sub         eax,1B
>0069A411    jb          0069A455
>0069A413    jmp         0069A46A
 0069A415    add         eax,0FFFFFDA8
 0069A41A    sub         eax,1B
>0069A41D    jb          0069A455
 0069A41F    add         eax,0FFFFFFFD
 0069A422    sub         eax,1B
>0069A425    jb          0069A455
 0069A427    add         eax,0FFFFFFFD
 0069A42A    sub         eax,1B
>0069A42D    jb          0069A455
>0069A42F    jmp         0069A46A
 0069A431    xor         eax,eax
 0069A433    ret
 0069A434    mov         al,5
 0069A436    ret
 0069A437    mov         al,2
 0069A439    ret
 0069A43A    mov         al,3
 0069A43C    ret
 0069A43D    xor         eax,eax
 0069A43F    ret
 0069A440    xor         eax,eax
 0069A442    ret
 0069A443    mov         al,3
 0069A445    ret
 0069A446    mov         al,2
 0069A448    ret
 0069A449    mov         al,1
 0069A44B    ret
 0069A44C    mov         al,3
 0069A44E    ret
 0069A44F    mov         al,3
 0069A451    ret
 0069A452    mov         al,1
 0069A454    ret
 0069A455    mov         al,3
 0069A457    ret
 0069A458    mov         al,2
 0069A45A    ret
 0069A45B    mov         al,3
 0069A45D    ret
 0069A45E    mov         al,2
 0069A460    ret
 0069A461    mov         al,3
 0069A463    ret
 0069A464    mov         al,5
 0069A466    ret
 0069A467    mov         al,6
 0069A469    ret
 0069A46A    xor         eax,eax
 0069A46C    ret
*}
end;

//0069A470
function TGloveValue.GetLLLLL(v:Integer):Boolean;
begin
{*
 0069A470    push        ebx
 0069A471    push        esi
 0069A472    push        edi
 0069A473    mov         esi,edx
 0069A475    mov         ebx,eax
 0069A477    mov         ax,133F
 0069A47B    call        Set8087CW
 0069A480    mov         eax,dword ptr [ebx+18];TGloveValue.........................................................
 0069A483    push        eax
 0069A484    call        P5DLL.P5_GetStatePointer
 0069A489    mov         edi,eax
 0069A48B    test        edi,edi
>0069A48D    jne         0069A496
 0069A48F    xor         ecx,ecx
>0069A491    jmp         0069A522
 0069A496    mov         cl,1
 0069A498    xor         eax,eax
 0069A49A    mov         edx,esi
 0069A49C    and         edx,3
 0069A49F    shr         esi,2
 0069A4A2    test        edx,edx
>0069A4A4    jne         0069A4C4
 0069A4A6    test        cl,cl
>0069A4A8    je          0069A4BA
 0069A4AA    movzx       edx,byte ptr [edi+eax+0C4]
 0069A4B2    cmp         edx,dword ptr ds:[78BE08];0x1B gvar_0078BE08:Single
>0069A4B8    jle         0069A4BE
 0069A4BA    xor         edx,edx
>0069A4BC    jmp         0069A4C0
 0069A4BE    mov         dl,1
 0069A4C0    mov         ecx,edx
>0069A4C2    jmp         0069A518
 0069A4C4    cmp         edx,1
>0069A4C7    jne         0069A4F7
 0069A4C9    test        cl,cl
>0069A4CB    je          0069A4ED
 0069A4CD    movzx       edx,byte ptr [edi+eax+0C4]
 0069A4D5    cmp         edx,dword ptr ds:[78BE08];0x1B gvar_0078BE08:Single
>0069A4DB    jle         0069A4ED
 0069A4DD    movzx       edx,byte ptr [edi+eax+0C4]
 0069A4E5    cmp         edx,dword ptr ds:[78BE0C];0x30 gvar_0078BE0C:Single
>0069A4EB    jl          0069A4F1
 0069A4ED    xor         edx,edx
>0069A4EF    jmp         0069A4F3
 0069A4F1    mov         dl,1
 0069A4F3    mov         ecx,edx
>0069A4F5    jmp         0069A518
 0069A4F7    cmp         edx,2
>0069A4FA    jne         0069A518
 0069A4FC    test        cl,cl
>0069A4FE    je          0069A510
 0069A500    movzx       edx,byte ptr [edi+eax+0C4]
 0069A508    cmp         edx,dword ptr ds:[78BE0C];0x30 gvar_0078BE0C:Single
>0069A50E    jge         0069A514
 0069A510    xor         edx,edx
>0069A512    jmp         0069A516
 0069A514    mov         dl,1
 0069A516    mov         ecx,edx
 0069A518    inc         eax
 0069A519    cmp         eax,5
>0069A51C    jne         0069A49A
 0069A522    mov         eax,ecx
 0069A524    pop         edi
 0069A525    pop         esi
 0069A526    pop         ebx
 0069A527    ret
*}
end;

//0069A528
function TGloveValue.GetPerUnits1:TUnits;
begin
{*
 0069A528    mov         eax,dword ptr [eax+20];TGloveValue...............................Item:Integer
 0069A52B    cmp         eax,41
>0069A52E    jge         0069A55E
 0069A530    cmp         eax,31
>0069A533    jge         0069A547
 0069A535    add         eax,0FFFFFFF0
 0069A538    sub         eax,3
>0069A53B    jb          0069A588
 0069A53D    add         eax,0FFFFFFFE
 0069A540    sub         eax,3
>0069A543    jb          0069A58B
>0069A545    jmp         0069A597
 0069A547    add         eax,0FFFFFFCF
 0069A54A    sub         eax,3
>0069A54D    jb          0069A58E
 0069A54F    add         eax,0FFFFFFFB
 0069A552    sub         eax,5
>0069A555    jb          0069A582
 0069A557    sub         eax,3
>0069A55A    jb          0069A591
>0069A55C    jmp         0069A597
 0069A55E    cmp         eax,0A9
>0069A563    jg          0069A576
>0069A565    je          0069A588
 0069A567    add         eax,0FFFFFFBF
 0069A56A    sub         eax,5
>0069A56D    jb          0069A585
 0069A56F    sub         eax,2
>0069A572    je          0069A594
>0069A574    jmp         0069A597
 0069A576    sub         eax,0C9
>0069A57B    je          0069A582
 0069A57D    dec         eax
>0069A57E    je          0069A58B
>0069A580    jmp         0069A597
 0069A582    mov         al,11
 0069A584    ret
 0069A585    mov         al,11
 0069A587    ret
 0069A588    mov         al,11
 0069A58A    ret
 0069A58B    mov         al,11
 0069A58D    ret
 0069A58E    mov         al,11
 0069A590    ret
 0069A591    mov         al,11
 0069A593    ret
 0069A594    mov         al,11
 0069A596    ret
 0069A597    xor         eax,eax
 0069A599    ret
*}
end;

//0069A59C
function TGloveValue.GetPerUnits2:TUnits;
begin
{*
 0069A59C    mov         eax,dword ptr [eax+20];TGloveValue................................Item:Integer
 0069A59F    add         eax,0FFFFFFEB
 0069A5A2    sub         eax,3
>0069A5A5    jb          0069A5BE
 0069A5A7    add         eax,0FFFFFFDA
 0069A5AA    sub         eax,3
>0069A5AD    jb          0069A5C1
 0069A5AF    sub         eax,5
>0069A5B2    jb          0069A5BB
 0069A5B4    sub         eax,84
>0069A5B9    jne         0069A5C4
 0069A5BB    mov         al,11
 0069A5BD    ret
 0069A5BE    mov         al,11
 0069A5C0    ret
 0069A5C1    mov         al,11
 0069A5C3    ret
 0069A5C4    xor         eax,eax
 0069A5C6    ret
*}
end;

//0069A5C8
procedure TGloveValue.GetRotMat(m:TRotMat);
begin
{*
 0069A5C8    push        ebx
 0069A5C9    push        esi
 0069A5CA    push        edi
 0069A5CB    add         esp,0FFFFFFF8
 0069A5CE    mov         esi,edx
 0069A5D0    mov         edi,eax
 0069A5D2    mov         ax,133F
 0069A5D6    call        Set8087CW
 0069A5DB    mov         eax,dword ptr [edi+18];TGloveValue.........................................................
 0069A5DE    push        eax
 0069A5DF    call        P5DLL.P5_GetStatePointer
 0069A5E4    mov         ebx,eax
 0069A5E6    test        ebx,ebx
>0069A5E8    je          0069A65D
 0069A5EA    mov         eax,dword ptr [edi+20];TGloveValue.................................Item:Integer
 0069A5ED    sub         eax,0DA
>0069A5F2    je          0069A5F9
 0069A5F4    dec         eax
>0069A5F5    je          0069A625
>0069A5F7    jmp         0069A654
 0069A5F9    xor         ecx,ecx
 0069A5FB    mov         dword ptr [esp],esi
 0069A5FE    xor         eax,eax
 0069A600    mov         edx,dword ptr [esp]
 0069A603    lea         edi,[ecx+ecx*2]
 0069A606    lea         edi,[ebx+edi*4]
 0069A609    fld         dword ptr [edi+eax*4+78]
 0069A60D    fstp        qword ptr [edx]
 0069A60F    wait
 0069A610    inc         eax
 0069A611    add         edx,8
 0069A614    cmp         eax,3
>0069A617    jne         0069A603
 0069A619    inc         ecx
 0069A61A    add         dword ptr [esp],18
 0069A61E    cmp         ecx,3
>0069A621    jne         0069A5FE
>0069A623    jmp         0069A65D
 0069A625    xor         ecx,ecx
 0069A627    mov         dword ptr [esp+4],esi
 0069A62B    xor         eax,eax
 0069A62D    mov         edx,dword ptr [esp+4]
 0069A631    lea         edi,[ecx+ecx*2]
 0069A634    lea         edi,[ebx+edi*4]
 0069A637    fld         dword ptr [edi+eax*4+48]
 0069A63B    fstp        qword ptr [edx]
 0069A63D    wait
 0069A63E    inc         eax
 0069A63F    add         edx,8
 0069A642    cmp         eax,3
>0069A645    jne         0069A631
 0069A647    inc         ecx
 0069A648    add         dword ptr [esp+4],18
 0069A64D    cmp         ecx,3
>0069A650    jne         0069A62B
>0069A652    jmp         0069A65D
 0069A654    mov         edx,esi
 0069A656    mov         eax,edi
 0069A658    call        TExpression.GetRotMat
 0069A65D    pop         ecx
 0069A65E    pop         edx
 0069A65F    pop         edi
 0069A660    pop         esi
 0069A661    pop         ebx
 0069A662    ret
*}
end;

//0069A664
function TGloveValue.GetUnits:TUnits;
begin
{*
 0069A664    mov         eax,dword ptr [eax+20];TGloveValue..................................Item:Integer
 0069A667    cmp         eax,69
>0069A66A    jge         0069A74B
 0069A670    cmp         eax,39
>0069A673    jge         0069A6ED
 0069A675    cmp         eax,15
>0069A678    jge         0069A6A7
 0069A67A    dec         eax
 0069A67B    sub         eax,5
>0069A67E    jb          0069A834
 0069A684    add         eax,0FFFFFFFC
 0069A687    sub         eax,3
>0069A68A    jb          0069A840
 0069A690    sub         eax,3
>0069A693    jb          0069A85B
 0069A699    sub         eax,3
>0069A69C    jb          0069A84C
>0069A6A2    jmp         0069A873
 0069A6A7    cmp         eax,1C
>0069A6AA    jge         0069A6C7
 0069A6AC    add         eax,0FFFFFFEB
 0069A6AF    sub         eax,3
>0069A6B2    jb          0069A84F
 0069A6B8    dec         eax
 0069A6B9    sub         eax,3
>0069A6BC    jb          0069A846
>0069A6C2    jmp         0069A873
 0069A6C7    add         eax,0FFFFFFE4
 0069A6CA    sub         eax,3
>0069A6CD    jb          0069A849
 0069A6D3    add         eax,0FFFFFFEE
 0069A6D6    sub         eax,3
>0069A6D9    jb          0069A85E
 0069A6DF    sub         eax,5
>0069A6E2    jb          0069A837
>0069A6E8    jmp         0069A873
 0069A6ED    cmp         eax,47
>0069A6F0    jg          0069A721
>0069A6F2    je          0069A870
 0069A6F8    add         eax,0FFFFFFC7
 0069A6FB    sub         eax,5
>0069A6FE    jb          0069A83A
 0069A704    sub         eax,3
>0069A707    jb          0069A861
 0069A70D    sub         eax,5
>0069A710    jb          0069A83D
>0069A716    je          0069A867
>0069A71C    jmp         0069A873
 0069A721    sub         eax,48
>0069A724    je          0069A86A
 0069A72A    sub         eax,4
>0069A72D    je          0069A86D
 0069A733    dec         eax
>0069A734    je          0069A852
 0069A73A    add         eax,0FFFFFFEB
 0069A73D    sub         eax,3
>0069A740    jb          0069A858
>0069A746    jmp         0069A873
 0069A74B    cmp         eax,0B7
>0069A750    jg          0069A7DE
>0069A756    je          0069A828
 0069A75C    cmp         eax,85
>0069A761    jge         0069A798
 0069A763    add         eax,0FFFFFF97
 0069A766    sub         eax,3
>0069A769    jb          0069A858
 0069A76F    add         eax,0FFFFFFFC
 0069A772    sub         eax,3
>0069A775    jb          0069A858
 0069A77B    add         eax,0FFFFFFFC
 0069A77E    sub         eax,3
>0069A781    jb          0069A858
 0069A787    add         eax,0FFFFFFFC
 0069A78A    sub         eax,3
>0069A78D    jb          0069A858
>0069A793    jmp         0069A873
 0069A798    cmp         eax,93
>0069A79D    jge         0069A7BE
 0069A79F    add         eax,0FFFFFF7B
 0069A7A4    sub         eax,3
>0069A7A7    jb          0069A858
 0069A7AD    add         eax,0FFFFFFFC
 0069A7B0    sub         eax,3
>0069A7B3    jb          0069A858
>0069A7B9    jmp         0069A873
 0069A7BE    add         eax,0FFFFFF6D
 0069A7C3    sub         eax,3
>0069A7C6    jb          0069A858
 0069A7CC    sub         eax,13
>0069A7CF    je          0069A84C
 0069A7D1    add         eax,0FFFFFFF6
 0069A7D4    sub         eax,4
>0069A7D7    jb          0069A82B
>0069A7D9    jmp         0069A873
 0069A7DE    cmp         eax,0FA
>0069A7E3    jge         0069A804
 0069A7E5    add         eax,0FFFFFF38
 0069A7EA    sub         eax,0D
>0069A7ED    jb          0069A843
 0069A7EF    add         eax,0FFFFFFF9
 0069A7F2    sub         eax,0C
>0069A7F5    jb          0069A82E
 0069A7F7    dec         eax
>0069A7F8    je          0069A855
 0069A7FA    add         eax,0FFFFFFF9
 0069A7FD    sub         eax,0A
>0069A800    jb          0069A831
>0069A802    jmp         0069A873
 0069A804    add         eax,0FFFFFF06
 0069A809    sub         eax,3
>0069A80C    jb          0069A82E
 0069A80E    add         eax,0FFFFFFD1
 0069A811    sub         eax,1B
>0069A814    jb          0069A864
 0069A816    add         eax,0FFFFFFFD
 0069A819    sub         eax,1B
>0069A81C    jb          0069A864
 0069A81E    add         eax,0FFFFFFFD
 0069A821    sub         eax,1B
>0069A824    jb          0069A864
>0069A826    jmp         0069A873
 0069A828    mov         al,0B
 0069A82A    ret
 0069A82B    mov         al,18
 0069A82D    ret
 0069A82E    mov         al,18
 0069A830    ret
 0069A831    mov         al,0B
 0069A833    ret
 0069A834    xor         eax,eax
 0069A836    ret
 0069A837    xor         eax,eax
 0069A839    ret
 0069A83A    xor         eax,eax
 0069A83C    ret
 0069A83D    xor         eax,eax
 0069A83F    ret
 0069A840    mov         al,0B
 0069A842    ret
 0069A843    mov         al,0B
 0069A845    ret
 0069A846    mov         al,0B
 0069A848    ret
 0069A849    mov         al,0B
 0069A84B    ret
 0069A84C    mov         al,0B
 0069A84E    ret
 0069A84F    mov         al,0B
 0069A851    ret
 0069A852    mov         al,0B
 0069A854    ret
 0069A855    mov         al,0B
 0069A857    ret
 0069A858    mov         al,0B
 0069A85A    ret
 0069A85B    mov         al,18
 0069A85D    ret
 0069A85E    mov         al,18
 0069A860    ret
 0069A861    mov         al,18
 0069A863    ret
 0069A864    mov         al,18
 0069A866    ret
 0069A867    xor         eax,eax
 0069A869    ret
 0069A86A    xor         eax,eax
 0069A86C    ret
 0069A86D    xor         eax,eax
 0069A86F    ret
 0069A870    mov         al,11
 0069A872    ret
 0069A873    xor         eax,eax
 0069A875    ret
*}
end;

//0069A878
procedure TGloveValue.GetValue;
begin
{*
 0069A878    push        ebx
 0069A879    push        esi
 0069A87A    push        edi
 0069A87B    add         esp,0FFFFFFAC
 0069A87E    mov         esi,eax
 0069A880    mov         eax,dword ptr [esi+18];TGloveValue.........................................................
 0069A883    cmp         eax,dword ptr ds:[81ED78];gvar_0081ED78:Single
>0069A889    jle         0069A899
 0069A88B    xor         eax,eax
 0069A88D    mov         dword ptr [esp],eax
 0069A890    mov         dword ptr [esp+4],eax
>0069A894    jmp         0069D70C
 0069A899    mov         ax,133F
 0069A89D    call        Set8087CW
 0069A8A2    mov         eax,dword ptr [esi+18];TGloveValue.........................................................
 0069A8A5    push        eax
 0069A8A6    call        P5DLL.P5_GetStatePointer
 0069A8AB    mov         ebx,eax
 0069A8AD    mov         eax,dword ptr [esi+18];TGloveValue.........................................................
 0069A8B0    push        eax
 0069A8B1    call        P5DLL.P5_GetInfoPointer
 0069A8B6    test        ebx,ebx
>0069A8B8    jne         0069A8C8
 0069A8BA    xor         eax,eax
 0069A8BC    mov         dword ptr [esp],eax
 0069A8BF    mov         dword ptr [esp+4],eax
>0069A8C3    jmp         0069D70C
 0069A8C8    mov         edi,dword ptr [esi+20];TGloveValue...................................Item:Integer
 0069A8CB    mov         edx,edi
 0069A8CD    cmp         edx,6B
>0069A8D0    jg          0069AA98
>0069A8D6    je          0069C164
 0069A8DC    cmp         edx,6A
>0069A8DF    ja          0069D703
 0069A8E5    jmp         dword ptr [edx*4+69A8EC]
 0069A8E5    dd          0069D703
 0069A8E5    dd          0069AEE6
 0069A8E5    dd          0069AEFE
 0069A8E5    dd          0069AF16
 0069A8E5    dd          0069AF2E
 0069A8E5    dd          0069AF46
 0069A8E5    dd          0069AF5E
 0069A8E5    dd          0069AF73
 0069A8E5    dd          0069AF88
 0069A8E5    dd          0069AF9D
 0069A8E5    dd          0069AFB2
 0069A8E5    dd          0069AFBE
 0069A8E5    dd          0069AFCA
 0069A8E5    dd          0069AFD6
 0069A8E5    dd          0069AFE5
 0069A8E5    dd          0069AFF4
 0069A8E5    dd          0069B003
 0069A8E5    dd          0069B00F
 0069A8E5    dd          0069B01B
 0069A8E5    dd          0069B0BF
 0069A8E5    dd          0069B0CE
 0069A8E5    dd          0069B061
 0069A8E5    dd          0069B06D
 0069A8E5    dd          0069B079
 0069A8E5    dd          0069D41C
 0069A8E5    dd          0069B122
 0069A8E5    dd          0069B12E
 0069A8E5    dd          0069B13A
 0069A8E5    dd          0069B146
 0069A8E5    dd          0069B151
 0069A8E5    dd          0069B15D
 0069A8E5    dd          0069B169
 0069A8E5    dd          0069B175
 0069A8E5    dd          0069B181
 0069A8E5    dd          0069B190
 0069A8E5    dd          0069B19F
 0069A8E5    dd          0069B1AE
 0069A8E5    dd          0069B1BD
 0069A8E5    dd          0069B1CC
 0069A8E5    dd          0069B1DB
 0069A8E5    dd          0069B1EA
 0069A8E5    dd          0069B1F6
 0069A8E5    dd          0069B202
 0069A8E5    dd          0069B20E
 0069A8E5    dd          0069B21A
 0069A8E5    dd          0069B226
 0069A8E5    dd          0069B232
 0069A8E5    dd          0069B23E
 0069A8E5    dd          0069B24A
 0069A8E5    dd          0069B256
 0069A8E5    dd          0069B265
 0069A8E5    dd          0069B274
 0069A8E5    dd          0069B283
 0069A8E5    dd          0069B292
 0069A8E5    dd          0069B2A1
 0069A8E5    dd          0069B2B0
 0069A8E5    dd          0069B2BF
 0069A8E5    dd          0069B2CE
 0069A8E5    dd          0069B2DD
 0069A8E5    dd          0069B2EC
 0069A8E5    dd          0069B2FB
 0069A8E5    dd          0069B30A
 0069A8E5    dd          0069B364
 0069A8E5    dd          0069B373
 0069A8E5    dd          0069B382
 0069A8E5    dd          0069B319
 0069A8E5    dd          0069B328
 0069A8E5    dd          0069B337
 0069A8E5    dd          0069B346
 0069A8E5    dd          0069B355
 0069A8E5    dd          0069B0DD
 0069A8E5    dd          0069B0FB
 0069A8E5    dd          0069B0EC
 0069A8E5    dd          0069B113
 0069A8E5    dd          0069B391
 0069A8E5    dd          0069B3A6
 0069A8E5    dd          0069B3D3
 0069A8E5    dd          0069B3BB
 0069A8E5    dd          0069B3E2
 0069A8E5    dd          0069B44A
 0069A8E5    dd          0069B4B2
 0069A8E5    dd          0069B51A
 0069A8E5    dd          0069B582
 0069A8E5    dd          0069B5EA
 0069A8E5    dd          0069B8C2
 0069A8E5    dd          0069B949
 0069A8E5    dd          0069B9D0
 0069A8E5    dd          0069BA57
 0069A8E5    dd          0069BADE
 0069A8E5    dd          0069BB6E
 0069A8E5    dd          0069BBFE
 0069A8E5    dd          0069BC66
 0069A8E5    dd          0069BCCE
 0069A8E5    dd          0069BD36
 0069A8E5    dd          0069BD9E
 0069A8E5    dd          0069BE06
 0069A8E5    dd          0069C0DE
 0069A8E5    dd          0069C0ED
 0069A8E5    dd          0069C119
 0069A8E5    dd          0069C128
 0069A8E5    dd          0069C137
 0069A8E5    dd          0069C281
 0069A8E5    dd          0069C329
 0069A8E5    dd          0069C699
 0069A8E5    dd          0069CA09
 0069A8E5    dd          0069C146
 0069A8E5    dd          0069C155
 0069AA98    cmp         edx,0A1
>0069AA9E    jg          0069AB91
>0069AAA4    je          0069B7F2
 0069AAAA    add         edx,0FFFFFF94
 0069AAAD    cmp         edx,34
>0069AAB0    ja          0069D703
 0069AAB6    jmp         dword ptr [edx*4+69AABD]
 0069AAB6    dd          0069C296
 0069AAB6    dd          0069C397
 0069AAB6    dd          0069C707
 0069AAB6    dd          0069CA77
 0069AAB6    dd          0069C173
 0069AAB6    dd          0069C182
 0069AAB6    dd          0069C191
 0069AAB6    dd          0069C2AB
 0069AAB6    dd          0069C405
 0069AAB6    dd          0069C775
 0069AAB6    dd          0069CAE5
 0069AAB6    dd          0069C1A0
 0069AAB6    dd          0069C1AF
 0069AAB6    dd          0069C1BE
 0069AAB6    dd          0069C2C0
 0069AAB6    dd          0069C473
 0069AAB6    dd          0069C7E3
 0069AAB6    dd          0069CB53
 0069AAB6    dd          0069C1CD
 0069AAB6    dd          0069C1DC
 0069AAB6    dd          0069C1EB
 0069AAB6    dd          0069C2D5
 0069AAB6    dd          0069C4E1
 0069AAB6    dd          0069C851
 0069AAB6    dd          0069CBC1
 0069AAB6    dd          0069C1FA
 0069AAB6    dd          0069C209
 0069AAB6    dd          0069C218
 0069AAB6    dd          0069C2EA
 0069AAB6    dd          0069C54F
 0069AAB6    dd          0069C8BF
 0069AAB6    dd          0069CC2F
 0069AAB6    dd          0069C227
 0069AAB6    dd          0069C236
 0069AAB6    dd          0069C245
 0069AAB6    dd          0069C2FF
 0069AAB6    dd          0069C5BD
 0069AAB6    dd          0069C92D
 0069AAB6    dd          0069CC9D
 0069AAB6    dd          0069C254
 0069AAB6    dd          0069C263
 0069AAB6    dd          0069C272
 0069AAB6    dd          0069C314
 0069AAB6    dd          0069C62B
 0069AAB6    dd          0069C99B
 0069AAB6    dd          0069CD0B
 0069AAB6    dd          0069CD79
 0069AAB6    dd          0069CD89
 0069AAB6    dd          0069CDAF
 0069AAB6    dd          0069B652
 0069AAB6    dd          0069B6BA
 0069AAB6    dd          0069B722
 0069AAB6    dd          0069B78A
 0069AB91    cmp         edx,0DE
>0069AB97    jg          0069ACA9
>0069AB9D    je          0069D646
 0069ABA3    add         edx,0FFFFFF5E
 0069ABA9    cmp         edx,3B
>0069ABAC    ja          0069D703
 0069ABB2    jmp         dword ptr [edx*4+69ABB9]
 0069ABB2    dd          0069B85A
 0069ABB2    dd          0069BE6E
 0069ABB2    dd          0069BED6
 0069ABB2    dd          0069BF3E
 0069ABB2    dd          0069BFA6
 0069ABB2    dd          0069C00E
 0069ABB2    dd          0069C076
 0069ABB2    dd          0069B027
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D42B
 0069ABB2    dd          0069D45F
 0069ABB2    dd          0069D493
 0069ABB2    dd          0069D4C7
 0069ABB2    dd          0069D4FB
 0069ABB2    dd          0069D52F
 0069ABB2    dd          0069D563
 0069ABB2    dd          0069D597
 0069ABB2    dd          0069AE1D
 0069ABB2    dd          0069AE3E
 0069ABB2    dd          0069AE69
 0069ABB2    dd          0069AE8A
 0069ABB2    dd          0069AEB5
 0069ABB2    dd          0069AED6
 0069ABB2    dd          0069AED6
 0069ABB2    dd          0069AED6
 0069ABB2    dd          0069AED6
 0069ABB2    dd          0069AED6
 0069ABB2    dd          0069AED6
 0069ABB2    dd          0069AED6
 0069ABB2    dd          0069AED6
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069B085
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D703
 0069ABB2    dd          0069D5CB
 0069ABB2    dd          0069D5CB
 0069ABB2    dd          0069D61C
 0069ABB2    dd          0069D631
 0069ACA9    cmp         edx,12C
>0069ACAF    jge         0069AD43
 0069ACB5    add         edx,0FFFFFF21
 0069ACBB    cmp         edx,1D
>0069ACBE    ja          0069D703
 0069ACC4    jmp         dword ptr [edx*4+69ACCB]
 0069ACC4    dd          0069D65B
 0069ACC4    dd          0069D670
 0069ACC4    dd          0069D685
 0069ACC4    dd          0069D697
 0069ACC4    dd          0069D6A9
 0069ACC4    dd          0069D6BB
 0069ACC4    dd          0069D6CD
 0069ACC4    dd          0069D6DF
 0069ACC4    dd          0069D6F1
 0069ACC4    dd          0069D703
 0069ACC4    dd          0069D703
 0069ACC4    dd          0069D703
 0069ACC4    dd          0069D703
 0069ACC4    dd          0069D703
 0069ACC4    dd          0069D703
 0069ACC4    dd          0069D703
 0069ACC4    dd          0069D703
 0069ACC4    dd          0069D703
 0069ACC4    dd          0069D703
 0069ACC4    dd          0069D703
 0069ACC4    dd          0069D703
 0069ACC4    dd          0069D703
 0069ACC4    dd          0069D703
 0069ACC4    dd          0069D703
 0069ACC4    dd          0069D703
 0069ACC4    dd          0069D703
 0069ACC4    dd          0069D703
 0069ACC4    dd          0069D5DD
 0069ACC4    dd          0069D5F2
 0069ACC4    dd          0069D607
 0069AD43    cmp         edx,1F4
>0069AD49    jge         0069ADAB
 0069AD4B    cmp         edx,190
>0069AD51    jge         0069AD7F
 0069AD53    add         edx,0FFFFFED4
 0069AD59    sub         edx,1B
>0069AD5C    jb          0069D2B6
 0069AD62    add         edx,0FFFFFFFD
 0069AD65    sub         edx,1B
>0069AD68    jb          0069D31D
 0069AD6E    add         edx,0FFFFFFFD
 0069AD71    sub         edx,1B
>0069AD74    jb          0069D38A
>0069AD7A    jmp         0069D703
 0069AD7F    add         edx,0FFFFFE70
 0069AD85    sub         edx,1B
>0069AD88    jb          0069D11A
 0069AD8E    add         edx,0FFFFFFFD
 0069AD91    sub         edx,1B
>0069AD94    jb          0069D193
 0069AD9A    add         edx,0FFFFFFFD
 0069AD9D    sub         edx,1B
>0069ADA0    jb          0069D212
>0069ADA6    jmp         0069D703
 0069ADAB    cmp         edx,258
>0069ADB1    jge         0069ADDF
 0069ADB3    add         edx,0FFFFFE0C
 0069ADB9    sub         edx,1C
>0069ADBC    jb          0069CDE2
 0069ADC2    add         edx,0FFFFFFFE
 0069ADC5    sub         edx,1C
>0069ADC8    jb          0069CE5B
 0069ADCE    add         edx,0FFFFFFFE
 0069ADD1    sub         edx,1C
>0069ADD4    jb          0069CEDA
>0069ADDA    jmp         0069D703
 0069ADDF    add         edx,0FFFFFDA8
 0069ADE5    sub         edx,1B
>0069ADE8    jb          0069CF7E
 0069ADEE    add         edx,0FFFFFFFD
 0069ADF1    sub         edx,1B
>0069ADF4    jb          0069CFF7
 0069ADFA    add         edx,0FFFFFFFD
 0069ADFD    sub         edx,1B
>0069AE00    jb          0069D076
 0069AE06    add         edx,0FFFFFEC7
 0069AE0C    sub         edx,400
>0069AE12    jb          0069C0FC
>0069AE18    jmp         0069D703
 0069AE1D    test        eax,eax
>0069AE1F    jne         0069AE2F
 0069AE21    xor         eax,eax
 0069AE23    mov         dword ptr [esp],eax
 0069AE26    mov         dword ptr [esp+4],eax
>0069AE2A    jmp         0069D70C
 0069AE2F    fld         dword ptr [eax+954]
 0069AE35    fstp        qword ptr [esp]
 0069AE38    wait
>0069AE39    jmp         0069D70C
 0069AE3E    test        eax,eax
>0069AE40    jne         0069AE54
 0069AE42    xor         eax,eax
 0069AE44    mov         dword ptr [esp],eax
 0069AE47    mov         dword ptr [esp+4],0C0240000
>0069AE4F    jmp         0069D70C
 0069AE54    fld         dword ptr ds:[69D718];-10:Single
 0069AE5A    fadd        dword ptr [eax+950]
 0069AE60    fstp        qword ptr [esp]
 0069AE63    wait
>0069AE64    jmp         0069D70C
 0069AE69    test        eax,eax
>0069AE6B    jne         0069AE7B
 0069AE6D    xor         eax,eax
 0069AE6F    mov         dword ptr [esp],eax
 0069AE72    mov         dword ptr [esp+4],eax
>0069AE76    jmp         0069D70C
 0069AE7B    fld         dword ptr [eax+95C]
 0069AE81    fstp        qword ptr [esp]
 0069AE84    wait
>0069AE85    jmp         0069D70C
 0069AE8A    test        eax,eax
>0069AE8C    jne         0069AEA0
 0069AE8E    xor         eax,eax
 0069AE90    mov         dword ptr [esp],eax
 0069AE93    mov         dword ptr [esp+4],40310000
>0069AE9B    jmp         0069D70C
 0069AEA0    fld         dword ptr ds:[69D71C];17:Single
 0069AEA6    fadd        dword ptr [eax+958]
 0069AEAC    fstp        qword ptr [esp]
 0069AEAF    wait
>0069AEB0    jmp         0069D70C
 0069AEB5    test        eax,eax
>0069AEB7    jne         0069AEC7
 0069AEB9    xor         eax,eax
 0069AEBB    mov         dword ptr [esp],eax
 0069AEBE    mov         dword ptr [esp+4],eax
>0069AEC2    jmp         0069D70C
 0069AEC7    fld         dword ptr [eax+960]
 0069AECD    fstp        qword ptr [esp]
 0069AED0    wait
>0069AED1    jmp         0069D70C
 0069AED6    fld         dword ptr [ebx+edi*4-0F0]
 0069AEDD    fstp        qword ptr [esp]
 0069AEE0    wait
>0069AEE1    jmp         0069D70C
 0069AEE6    movzx       eax,byte ptr [ebx+0C4]
 0069AEED    mov         dword ptr [esp+38],eax
 0069AEF1    fild        dword ptr [esp+38]
 0069AEF5    fstp        qword ptr [esp]
 0069AEF8    wait
>0069AEF9    jmp         0069D70C
 0069AEFE    movzx       eax,byte ptr [ebx+0C5]
 0069AF05    mov         dword ptr [esp+38],eax
 0069AF09    fild        dword ptr [esp+38]
 0069AF0D    fstp        qword ptr [esp]
 0069AF10    wait
>0069AF11    jmp         0069D70C
 0069AF16    movzx       eax,byte ptr [ebx+0C6]
 0069AF1D    mov         dword ptr [esp+38],eax
 0069AF21    fild        dword ptr [esp+38]
 0069AF25    fstp        qword ptr [esp]
 0069AF28    wait
>0069AF29    jmp         0069D70C
 0069AF2E    movzx       eax,byte ptr [ebx+0C7]
 0069AF35    mov         dword ptr [esp+38],eax
 0069AF39    fild        dword ptr [esp+38]
 0069AF3D    fstp        qword ptr [esp]
 0069AF40    wait
>0069AF41    jmp         0069D70C
 0069AF46    movzx       eax,byte ptr [ebx+0C8]
 0069AF4D    mov         dword ptr [esp+38],eax
 0069AF51    fild        dword ptr [esp+38]
 0069AF55    fstp        qword ptr [esp]
 0069AF58    wait
>0069AF59    jmp         0069D70C
 0069AF5E    movzx       eax,byte ptr [ebx+0FC]
 0069AF65    call        00686074
 0069AF6A    fstp        qword ptr [esp]
 0069AF6D    wait
>0069AF6E    jmp         0069D70C
 0069AF73    movzx       eax,byte ptr [ebx+0FD]
 0069AF7A    call        00686074
 0069AF7F    fstp        qword ptr [esp]
 0069AF82    wait
>0069AF83    jmp         0069D70C
 0069AF88    movzx       eax,byte ptr [ebx+0FE]
 0069AF8F    call        00686074
 0069AF94    fstp        qword ptr [esp]
 0069AF97    wait
>0069AF98    jmp         0069D70C
 0069AF9D    movzx       eax,byte ptr [ebx+0FF]
 0069AFA4    call        00686074
 0069AFA9    fstp        qword ptr [esp]
 0069AFAC    wait
>0069AFAD    jmp         0069D70C
 0069AFB2    fld         dword ptr [ebx+24]
 0069AFB5    fstp        qword ptr [esp]
 0069AFB8    wait
>0069AFB9    jmp         0069D70C
 0069AFBE    fld         dword ptr [ebx+28]
 0069AFC1    fstp        qword ptr [esp]
 0069AFC4    wait
>0069AFC5    jmp         0069D70C
 0069AFCA    fld         dword ptr [ebx+2C]
 0069AFCD    fstp        qword ptr [esp]
 0069AFD0    wait
>0069AFD1    jmp         0069D70C
 0069AFD6    fld         dword ptr [ebx+9C]
 0069AFDC    fstp        qword ptr [esp]
 0069AFDF    wait
>0069AFE0    jmp         0069D70C
 0069AFE5    fld         dword ptr [ebx+0A0]
 0069AFEB    fstp        qword ptr [esp]
 0069AFEE    wait
>0069AFEF    jmp         0069D70C
 0069AFF4    fld         dword ptr [ebx+0A4]
 0069AFFA    fstp        qword ptr [esp]
 0069AFFD    wait
>0069AFFE    jmp         0069D70C
 0069B003    fld         dword ptr [ebx+30]
 0069B006    fstp        qword ptr [esp]
 0069B009    wait
>0069B00A    jmp         0069D70C
 0069B00F    fld         dword ptr [ebx+34]
 0069B012    fstp        qword ptr [esp]
 0069B015    wait
>0069B016    jmp         0069D70C
 0069B01B    fld         dword ptr [ebx+38]
 0069B01E    fstp        qword ptr [esp]
 0069B021    wait
>0069B022    jmp         0069D70C
 0069B027    fld         dword ptr [ebx+30]
 0069B02A    fmul        st,st(0)
 0069B02C    fstp        tbyte ptr [esp+3C]
 0069B030    wait
 0069B031    fld         dword ptr [ebx+34]
 0069B034    fmul        st,st(0)
 0069B036    fld         tbyte ptr [esp+3C]
 0069B03A    faddp       st(1),st
 0069B03C    fstp        tbyte ptr [esp+48]
 0069B040    wait
 0069B041    fld         dword ptr [ebx+38]
 0069B044    fmul        st,st(0)
 0069B046    fld         tbyte ptr [esp+48]
 0069B04A    faddp       st(1),st
 0069B04C    add         esp,0FFFFFFF4
 0069B04F    fstp        tbyte ptr [esp]
 0069B052    wait
 0069B053    call        Sqrt
 0069B058    fstp        qword ptr [esp]
 0069B05B    wait
>0069B05C    jmp         0069D70C
 0069B061    fld         dword ptr [ebx+3C]
 0069B064    fstp        qword ptr [esp]
 0069B067    wait
>0069B068    jmp         0069D70C
 0069B06D    fld         dword ptr [ebx+40]
 0069B070    fstp        qword ptr [esp]
 0069B073    wait
>0069B074    jmp         0069D70C
 0069B079    fld         dword ptr [ebx+44]
 0069B07C    fstp        qword ptr [esp]
 0069B07F    wait
>0069B080    jmp         0069D70C
 0069B085    fld         dword ptr [ebx+3C]
 0069B088    fmul        st,st(0)
 0069B08A    fstp        tbyte ptr [esp+3C]
 0069B08E    wait
 0069B08F    fld         dword ptr [ebx+40]
 0069B092    fmul        st,st(0)
 0069B094    fld         tbyte ptr [esp+3C]
 0069B098    faddp       st(1),st
 0069B09A    fstp        tbyte ptr [esp+48]
 0069B09E    wait
 0069B09F    fld         dword ptr [ebx+44]
 0069B0A2    fmul        st,st(0)
 0069B0A4    fld         tbyte ptr [esp+48]
 0069B0A8    faddp       st(1),st
 0069B0AA    add         esp,0FFFFFFF4
 0069B0AD    fstp        tbyte ptr [esp]
 0069B0B0    wait
 0069B0B1    call        Sqrt
 0069B0B6    fstp        qword ptr [esp]
 0069B0B9    wait
>0069B0BA    jmp         0069D70C
 0069B0BF    fild        dword ptr ds:[81ED78];gvar_0081ED78:Single
 0069B0C5    fstp        qword ptr [esp]
 0069B0C8    wait
>0069B0C9    jmp         0069D70C
 0069B0CE    fild        dword ptr [ebx+228]
 0069B0D4    fstp        qword ptr [esp]
 0069B0D7    wait
>0069B0D8    jmp         0069D70C
 0069B0DD    fild        qword ptr [ebx+2D0]
 0069B0E3    fstp        qword ptr [esp]
 0069B0E6    wait
>0069B0E7    jmp         0069D70C
 0069B0EC    fld         dword ptr [ebx+2C8]
 0069B0F2    fstp        qword ptr [esp]
 0069B0F5    wait
>0069B0F6    jmp         0069D70C
 0069B0FB    mov         eax,dword ptr [ebx+2C0]
 0069B101    mov         dword ptr [esp],eax
 0069B104    mov         eax,dword ptr [ebx+2C4]
 0069B10A    mov         dword ptr [esp+4],eax
>0069B10E    jmp         0069D70C
 0069B113    fild        dword ptr [ebx+224]
 0069B119    fstp        qword ptr [esp]
 0069B11C    wait
>0069B11D    jmp         0069D70C
 0069B122    fld         dword ptr [ebx+0C]
 0069B125    fstp        qword ptr [esp]
 0069B128    wait
>0069B129    jmp         0069D70C
 0069B12E    fld         dword ptr [ebx+10]
 0069B131    fstp        qword ptr [esp]
 0069B134    wait
>0069B135    jmp         0069D70C
 0069B13A    fld         dword ptr [ebx+14]
 0069B13D    fstp        qword ptr [esp]
 0069B140    wait
>0069B141    jmp         0069D70C
 0069B146    fld         dword ptr [ebx]
 0069B148    fstp        qword ptr [esp]
 0069B14B    wait
>0069B14C    jmp         0069D70C
 0069B151    fld         dword ptr [ebx+4]
 0069B154    fstp        qword ptr [esp]
 0069B157    wait
>0069B158    jmp         0069D70C
 0069B15D    fld         dword ptr [ebx+8]
 0069B160    fstp        qword ptr [esp]
 0069B163    wait
>0069B164    jmp         0069D70C
 0069B169    fld         dword ptr [ebx+78]
 0069B16C    fstp        qword ptr [esp]
 0069B16F    wait
>0069B170    jmp         0069D70C
 0069B175    fld         dword ptr [ebx+7C]
 0069B178    fstp        qword ptr [esp]
 0069B17B    wait
>0069B17C    jmp         0069D70C
 0069B181    fld         dword ptr [ebx+80]
 0069B187    fstp        qword ptr [esp]
 0069B18A    wait
>0069B18B    jmp         0069D70C
 0069B190    fld         dword ptr [ebx+84]
 0069B196    fstp        qword ptr [esp]
 0069B199    wait
>0069B19A    jmp         0069D70C
 0069B19F    fld         dword ptr [ebx+88]
 0069B1A5    fstp        qword ptr [esp]
 0069B1A8    wait
>0069B1A9    jmp         0069D70C
 0069B1AE    fld         dword ptr [ebx+8C]
 0069B1B4    fstp        qword ptr [esp]
 0069B1B7    wait
>0069B1B8    jmp         0069D70C
 0069B1BD    fld         dword ptr [ebx+90]
 0069B1C3    fstp        qword ptr [esp]
 0069B1C6    wait
>0069B1C7    jmp         0069D70C
 0069B1CC    fld         dword ptr [ebx+94]
 0069B1D2    fstp        qword ptr [esp]
 0069B1D5    wait
>0069B1D6    jmp         0069D70C
 0069B1DB    fld         dword ptr [ebx+98]
 0069B1E1    fstp        qword ptr [esp]
 0069B1E4    wait
>0069B1E5    jmp         0069D70C
 0069B1EA    fld         dword ptr [ebx+48]
 0069B1ED    fstp        qword ptr [esp]
 0069B1F0    wait
>0069B1F1    jmp         0069D70C
 0069B1F6    fld         dword ptr [ebx+4C]
 0069B1F9    fstp        qword ptr [esp]
 0069B1FC    wait
>0069B1FD    jmp         0069D70C
 0069B202    fld         dword ptr [ebx+50]
 0069B205    fstp        qword ptr [esp]
 0069B208    wait
>0069B209    jmp         0069D70C
 0069B20E    fld         dword ptr [ebx+54]
 0069B211    fstp        qword ptr [esp]
 0069B214    wait
>0069B215    jmp         0069D70C
 0069B21A    fld         dword ptr [ebx+58]
 0069B21D    fstp        qword ptr [esp]
 0069B220    wait
>0069B221    jmp         0069D70C
 0069B226    fld         dword ptr [ebx+5C]
 0069B229    fstp        qword ptr [esp]
 0069B22C    wait
>0069B22D    jmp         0069D70C
 0069B232    fld         dword ptr [ebx+60]
 0069B235    fstp        qword ptr [esp]
 0069B238    wait
>0069B239    jmp         0069D70C
 0069B23E    fld         dword ptr [ebx+64]
 0069B241    fstp        qword ptr [esp]
 0069B244    wait
>0069B245    jmp         0069D70C
 0069B24A    fld         dword ptr [ebx+68]
 0069B24D    fstp        qword ptr [esp]
 0069B250    wait
>0069B251    jmp         0069D70C
 0069B256    fld         dword ptr [ebx+0A8]
 0069B25C    fstp        qword ptr [esp]
 0069B25F    wait
>0069B260    jmp         0069D70C
 0069B265    fld         dword ptr [ebx+0AC]
 0069B26B    fstp        qword ptr [esp]
 0069B26E    wait
>0069B26F    jmp         0069D70C
 0069B274    fld         dword ptr [ebx+0B0]
 0069B27A    fstp        qword ptr [esp]
 0069B27D    wait
>0069B27E    jmp         0069D70C
 0069B283    fild        word ptr [ebx+0CA]
 0069B289    fstp        qword ptr [esp]
 0069B28C    wait
>0069B28D    jmp         0069D70C
 0069B292    fild        word ptr [ebx+0CC]
 0069B298    fstp        qword ptr [esp]
 0069B29B    wait
>0069B29C    jmp         0069D70C
 0069B2A1    fild        word ptr [ebx+0CE]
 0069B2A7    fstp        qword ptr [esp]
 0069B2AA    wait
>0069B2AB    jmp         0069D70C
 0069B2B0    fild        word ptr [ebx+0D0]
 0069B2B6    fstp        qword ptr [esp]
 0069B2B9    wait
>0069B2BA    jmp         0069D70C
 0069B2BF    fild        word ptr [ebx+0D2]
 0069B2C5    fstp        qword ptr [esp]
 0069B2C8    wait
>0069B2C9    jmp         0069D70C
 0069B2CE    fld         dword ptr [ebx+0D4]
 0069B2D4    fstp        qword ptr [esp]
 0069B2D7    wait
>0069B2D8    jmp         0069D70C
 0069B2DD    fld         dword ptr [ebx+0D8]
 0069B2E3    fstp        qword ptr [esp]
 0069B2E6    wait
>0069B2E7    jmp         0069D70C
 0069B2EC    fld         dword ptr [ebx+0DC]
 0069B2F2    fstp        qword ptr [esp]
 0069B2F5    wait
>0069B2F6    jmp         0069D70C
 0069B2FB    fld         dword ptr [ebx+0E0]
 0069B301    fstp        qword ptr [esp]
 0069B304    wait
>0069B305    jmp         0069D70C
 0069B30A    fld         dword ptr [ebx+0E4]
 0069B310    fstp        qword ptr [esp]
 0069B313    wait
>0069B314    jmp         0069D70C
 0069B319    fld         dword ptr [ebx+0E8]
 0069B31F    fstp        qword ptr [esp]
 0069B322    wait
>0069B323    jmp         0069D70C
 0069B328    fld         dword ptr [ebx+0EC]
 0069B32E    fstp        qword ptr [esp]
 0069B331    wait
>0069B332    jmp         0069D70C
 0069B337    fld         dword ptr [ebx+0F0]
 0069B33D    fstp        qword ptr [esp]
 0069B340    wait
>0069B341    jmp         0069D70C
 0069B346    fld         dword ptr [ebx+0F4]
 0069B34C    fstp        qword ptr [esp]
 0069B34F    wait
>0069B350    jmp         0069D70C
 0069B355    fld         dword ptr [ebx+0F8]
 0069B35B    fstp        qword ptr [esp]
 0069B35E    wait
>0069B35F    jmp         0069D70C
 0069B364    fld         dword ptr [ebx+0B4]
 0069B36A    fstp        qword ptr [esp]
 0069B36D    wait
>0069B36E    jmp         0069D70C
 0069B373    fld         dword ptr [ebx+0B8]
 0069B379    fstp        qword ptr [esp]
 0069B37C    wait
>0069B37D    jmp         0069D70C
 0069B382    fld         dword ptr [ebx+0BC]
 0069B388    fstp        qword ptr [esp]
 0069B38B    wait
>0069B38C    jmp         0069D70C
 0069B391    movzx       eax,byte ptr ds:[81ED68];gvar_0081ED68:Boolean
 0069B398    call        00686074
 0069B39D    fstp        qword ptr [esp]
 0069B3A0    wait
>0069B3A1    jmp         0069D70C
 0069B3A6    movzx       eax,byte ptr ds:[81ED69];gvar_0081ED69:Boolean
 0069B3AD    call        00686074
 0069B3B2    fstp        qword ptr [esp]
 0069B3B5    wait
>0069B3B6    jmp         0069D70C
 0069B3BB    mov         eax,dword ptr ds:[81ED70];gvar_0081ED70:Double
 0069B3C1    mov         dword ptr [esp],eax
 0069B3C4    mov         eax,dword ptr ds:[81ED74];gvar_0081ED74
 0069B3CA    mov         dword ptr [esp+4],eax
>0069B3CE    jmp         0069D70C
 0069B3D3    fild        dword ptr ds:[81ED6C];gvar_0081ED6C:Single
 0069B3D9    fstp        qword ptr [esp]
 0069B3DC    wait
>0069B3DD    jmp         0069D70C
 0069B3E2    fld         dword ptr [ebx+94]
 0069B3E8    fabs
 0069B3EA    fstp        tbyte ptr [esp+3C]
 0069B3EE    wait
 0069B3EF    fld         dword ptr [ebx+90]
 0069B3F5    fabs
 0069B3F7    fld         tbyte ptr [esp+3C]
 0069B3FB    fcompp
 0069B3FD    wait
 0069B3FE    fnstsw      al
 0069B400    sahf
>0069B401    jbe         0069B436
 0069B403    fld         dword ptr [ebx+94]
 0069B409    fabs
 0069B40B    fstp        tbyte ptr [esp+48]
 0069B40F    wait
 0069B410    fld         dword ptr [ebx+98]
 0069B416    fabs
 0069B418    fld         tbyte ptr [esp+48]
 0069B41C    fcompp
 0069B41E    wait
 0069B41F    fnstsw      al
 0069B421    sahf
>0069B422    jbe         0069B436
 0069B424    fld         dword ptr [ebx+94]
 0069B42A    fcomp       dword ptr ds:[69D720];0:Single
 0069B430    wait
 0069B431    fnstsw      al
 0069B433    sahf
>0069B434    ja          0069B43A
 0069B436    xor         eax,eax
>0069B438    jmp         0069B43C
 0069B43A    mov         al,1
 0069B43C    call        00686074
 0069B441    fstp        qword ptr [esp]
 0069B444    wait
>0069B445    jmp         0069D70C
 0069B44A    fld         dword ptr [ebx+94]
 0069B450    fabs
 0069B452    fstp        tbyte ptr [esp+3C]
 0069B456    wait
 0069B457    fld         dword ptr [ebx+90]
 0069B45D    fabs
 0069B45F    fld         tbyte ptr [esp+3C]
 0069B463    fcompp
 0069B465    wait
 0069B466    fnstsw      al
 0069B468    sahf
>0069B469    jbe         0069B49E
 0069B46B    fld         dword ptr [ebx+94]
 0069B471    fabs
 0069B473    fstp        tbyte ptr [esp+48]
 0069B477    wait
 0069B478    fld         dword ptr [ebx+98]
 0069B47E    fabs
 0069B480    fld         tbyte ptr [esp+48]
 0069B484    fcompp
 0069B486    wait
 0069B487    fnstsw      al
 0069B489    sahf
>0069B48A    jbe         0069B49E
 0069B48C    fld         dword ptr [ebx+94]
 0069B492    fcomp       dword ptr ds:[69D720];0:Single
 0069B498    wait
 0069B499    fnstsw      al
 0069B49B    sahf
>0069B49C    jb          0069B4A2
 0069B49E    xor         eax,eax
>0069B4A0    jmp         0069B4A4
 0069B4A2    mov         al,1
 0069B4A4    call        00686074
 0069B4A9    fstp        qword ptr [esp]
 0069B4AC    wait
>0069B4AD    jmp         0069D70C
 0069B4B2    fld         dword ptr [ebx+90]
 0069B4B8    fabs
 0069B4BA    fstp        tbyte ptr [esp+3C]
 0069B4BE    wait
 0069B4BF    fld         dword ptr [ebx+94]
 0069B4C5    fabs
 0069B4C7    fld         tbyte ptr [esp+3C]
 0069B4CB    fcompp
 0069B4CD    wait
 0069B4CE    fnstsw      al
 0069B4D0    sahf
>0069B4D1    jbe         0069B506
 0069B4D3    fld         dword ptr [ebx+90]
 0069B4D9    fabs
 0069B4DB    fstp        tbyte ptr [esp+48]
 0069B4DF    wait
 0069B4E0    fld         dword ptr [ebx+98]
 0069B4E6    fabs
 0069B4E8    fld         tbyte ptr [esp+48]
 0069B4EC    fcompp
 0069B4EE    wait
 0069B4EF    fnstsw      al
 0069B4F1    sahf
>0069B4F2    jbe         0069B506
 0069B4F4    fld         dword ptr [ebx+90]
 0069B4FA    fcomp       dword ptr ds:[69D720];0:Single
 0069B500    wait
 0069B501    fnstsw      al
 0069B503    sahf
>0069B504    jb          0069B50A
 0069B506    xor         eax,eax
>0069B508    jmp         0069B50C
 0069B50A    mov         al,1
 0069B50C    call        00686074
 0069B511    fstp        qword ptr [esp]
 0069B514    wait
>0069B515    jmp         0069D70C
 0069B51A    fld         dword ptr [ebx+90]
 0069B520    fabs
 0069B522    fstp        tbyte ptr [esp+3C]
 0069B526    wait
 0069B527    fld         dword ptr [ebx+94]
 0069B52D    fabs
 0069B52F    fld         tbyte ptr [esp+3C]
 0069B533    fcompp
 0069B535    wait
 0069B536    fnstsw      al
 0069B538    sahf
>0069B539    jbe         0069B56E
 0069B53B    fld         dword ptr [ebx+90]
 0069B541    fabs
 0069B543    fstp        tbyte ptr [esp+48]
 0069B547    wait
 0069B548    fld         dword ptr [ebx+98]
 0069B54E    fabs
 0069B550    fld         tbyte ptr [esp+48]
 0069B554    fcompp
 0069B556    wait
 0069B557    fnstsw      al
 0069B559    sahf
>0069B55A    jbe         0069B56E
 0069B55C    fld         dword ptr [ebx+90]
 0069B562    fcomp       dword ptr ds:[69D720];0:Single
 0069B568    wait
 0069B569    fnstsw      al
 0069B56B    sahf
>0069B56C    ja          0069B572
 0069B56E    xor         eax,eax
>0069B570    jmp         0069B574
 0069B572    mov         al,1
 0069B574    call        00686074
 0069B579    fstp        qword ptr [esp]
 0069B57C    wait
>0069B57D    jmp         0069D70C
 0069B582    fld         dword ptr [ebx+98]
 0069B588    fabs
 0069B58A    fstp        tbyte ptr [esp+3C]
 0069B58E    wait
 0069B58F    fld         dword ptr [ebx+94]
 0069B595    fabs
 0069B597    fld         tbyte ptr [esp+3C]
 0069B59B    fcompp
 0069B59D    wait
 0069B59E    fnstsw      al
 0069B5A0    sahf
>0069B5A1    jbe         0069B5D6
 0069B5A3    fld         dword ptr [ebx+98]
 0069B5A9    fabs
 0069B5AB    fstp        tbyte ptr [esp+48]
 0069B5AF    wait
 0069B5B0    fld         dword ptr [ebx+90]
 0069B5B6    fabs
 0069B5B8    fld         tbyte ptr [esp+48]
 0069B5BC    fcompp
 0069B5BE    wait
 0069B5BF    fnstsw      al
 0069B5C1    sahf
>0069B5C2    jbe         0069B5D6
 0069B5C4    fld         dword ptr [ebx+98]
 0069B5CA    fcomp       dword ptr ds:[69D720];0:Single
 0069B5D0    wait
 0069B5D1    fnstsw      al
 0069B5D3    sahf
>0069B5D4    ja          0069B5DA
 0069B5D6    xor         eax,eax
>0069B5D8    jmp         0069B5DC
 0069B5DA    mov         al,1
 0069B5DC    call        00686074
 0069B5E1    fstp        qword ptr [esp]
 0069B5E4    wait
>0069B5E5    jmp         0069D70C
 0069B5EA    fld         dword ptr [ebx+98]
 0069B5F0    fabs
 0069B5F2    fstp        tbyte ptr [esp+3C]
 0069B5F6    wait
 0069B5F7    fld         dword ptr [ebx+94]
 0069B5FD    fabs
 0069B5FF    fld         tbyte ptr [esp+3C]
 0069B603    fcompp
 0069B605    wait
 0069B606    fnstsw      al
 0069B608    sahf
>0069B609    jbe         0069B63E
 0069B60B    fld         dword ptr [ebx+98]
 0069B611    fabs
 0069B613    fstp        tbyte ptr [esp+48]
 0069B617    wait
 0069B618    fld         dword ptr [ebx+90]
 0069B61E    fabs
 0069B620    fld         tbyte ptr [esp+48]
 0069B624    fcompp
 0069B626    wait
 0069B627    fnstsw      al
 0069B629    sahf
>0069B62A    jbe         0069B63E
 0069B62C    fld         dword ptr [ebx+98]
 0069B632    fcomp       dword ptr ds:[69D720];0:Single
 0069B638    wait
 0069B639    fnstsw      al
 0069B63B    sahf
>0069B63C    jb          0069B642
 0069B63E    xor         eax,eax
>0069B640    jmp         0069B644
 0069B642    mov         al,1
 0069B644    call        00686074
 0069B649    fstp        qword ptr [esp]
 0069B64C    wait
>0069B64D    jmp         0069D70C
 0069B652    fld         dword ptr [ebx+94]
 0069B658    fabs
 0069B65A    fstp        tbyte ptr [esp+3C]
 0069B65E    wait
 0069B65F    fld         dword ptr [ebx+90]
 0069B665    fabs
 0069B667    fld         tbyte ptr [esp+3C]
 0069B66B    fcompp
 0069B66D    wait
 0069B66E    fnstsw      al
 0069B670    sahf
>0069B671    jbe         0069B6A6
 0069B673    fld         dword ptr [ebx+94]
 0069B679    fabs
 0069B67B    fstp        tbyte ptr [esp+48]
 0069B67F    wait
 0069B680    fld         dword ptr [ebx+98]
 0069B686    fabs
 0069B688    fld         tbyte ptr [esp+48]
 0069B68C    fcompp
 0069B68E    wait
 0069B68F    fnstsw      al
 0069B691    sahf
>0069B692    jbe         0069B6A6
 0069B694    fld         dword ptr [ebx+94]
 0069B69A    fcomp       dword ptr ds:[69D720];0:Single
 0069B6A0    wait
 0069B6A1    fnstsw      al
 0069B6A3    sahf
>0069B6A4    jb          0069B6AA
 0069B6A6    xor         eax,eax
>0069B6A8    jmp         0069B6AC
 0069B6AA    mov         al,1
 0069B6AC    call        00686074
 0069B6B1    fstp        qword ptr [esp]
 0069B6B4    wait
>0069B6B5    jmp         0069D70C
 0069B6BA    fld         dword ptr [ebx+94]
 0069B6C0    fabs
 0069B6C2    fstp        tbyte ptr [esp+3C]
 0069B6C6    wait
 0069B6C7    fld         dword ptr [ebx+90]
 0069B6CD    fabs
 0069B6CF    fld         tbyte ptr [esp+3C]
 0069B6D3    fcompp
 0069B6D5    wait
 0069B6D6    fnstsw      al
 0069B6D8    sahf
>0069B6D9    jbe         0069B70E
 0069B6DB    fld         dword ptr [ebx+94]
 0069B6E1    fabs
 0069B6E3    fstp        tbyte ptr [esp+48]
 0069B6E7    wait
 0069B6E8    fld         dword ptr [ebx+98]
 0069B6EE    fabs
 0069B6F0    fld         tbyte ptr [esp+48]
 0069B6F4    fcompp
 0069B6F6    wait
 0069B6F7    fnstsw      al
 0069B6F9    sahf
>0069B6FA    jbe         0069B70E
 0069B6FC    fld         dword ptr [ebx+94]
 0069B702    fcomp       dword ptr ds:[69D720];0:Single
 0069B708    wait
 0069B709    fnstsw      al
 0069B70B    sahf
>0069B70C    ja          0069B712
 0069B70E    xor         eax,eax
>0069B710    jmp         0069B714
 0069B712    mov         al,1
 0069B714    call        00686074
 0069B719    fstp        qword ptr [esp]
 0069B71C    wait
>0069B71D    jmp         0069D70C
 0069B722    fld         dword ptr [ebx+90]
 0069B728    fabs
 0069B72A    fstp        tbyte ptr [esp+3C]
 0069B72E    wait
 0069B72F    fld         dword ptr [ebx+94]
 0069B735    fabs
 0069B737    fld         tbyte ptr [esp+3C]
 0069B73B    fcompp
 0069B73D    wait
 0069B73E    fnstsw      al
 0069B740    sahf
>0069B741    jbe         0069B776
 0069B743    fld         dword ptr [ebx+90]
 0069B749    fabs
 0069B74B    fstp        tbyte ptr [esp+48]
 0069B74F    wait
 0069B750    fld         dword ptr [ebx+98]
 0069B756    fabs
 0069B758    fld         tbyte ptr [esp+48]
 0069B75C    fcompp
 0069B75E    wait
 0069B75F    fnstsw      al
 0069B761    sahf
>0069B762    jbe         0069B776
 0069B764    fld         dword ptr [ebx+90]
 0069B76A    fcomp       dword ptr ds:[69D720];0:Single
 0069B770    wait
 0069B771    fnstsw      al
 0069B773    sahf
>0069B774    ja          0069B77A
 0069B776    xor         eax,eax
>0069B778    jmp         0069B77C
 0069B77A    mov         al,1
 0069B77C    call        00686074
 0069B781    fstp        qword ptr [esp]
 0069B784    wait
>0069B785    jmp         0069D70C
 0069B78A    fld         dword ptr [ebx+90]
 0069B790    fabs
 0069B792    fstp        tbyte ptr [esp+3C]
 0069B796    wait
 0069B797    fld         dword ptr [ebx+94]
 0069B79D    fabs
 0069B79F    fld         tbyte ptr [esp+3C]
 0069B7A3    fcompp
 0069B7A5    wait
 0069B7A6    fnstsw      al
 0069B7A8    sahf
>0069B7A9    jbe         0069B7DE
 0069B7AB    fld         dword ptr [ebx+90]
 0069B7B1    fabs
 0069B7B3    fstp        tbyte ptr [esp+48]
 0069B7B7    wait
 0069B7B8    fld         dword ptr [ebx+98]
 0069B7BE    fabs
 0069B7C0    fld         tbyte ptr [esp+48]
 0069B7C4    fcompp
 0069B7C6    wait
 0069B7C7    fnstsw      al
 0069B7C9    sahf
>0069B7CA    jbe         0069B7DE
 0069B7CC    fld         dword ptr [ebx+90]
 0069B7D2    fcomp       dword ptr ds:[69D720];0:Single
 0069B7D8    wait
 0069B7D9    fnstsw      al
 0069B7DB    sahf
>0069B7DC    jb          0069B7E2
 0069B7DE    xor         eax,eax
>0069B7E0    jmp         0069B7E4
 0069B7E2    mov         al,1
 0069B7E4    call        00686074
 0069B7E9    fstp        qword ptr [esp]
 0069B7EC    wait
>0069B7ED    jmp         0069D70C
 0069B7F2    fld         dword ptr [ebx+98]
 0069B7F8    fabs
 0069B7FA    fstp        tbyte ptr [esp+3C]
 0069B7FE    wait
 0069B7FF    fld         dword ptr [ebx+94]
 0069B805    fabs
 0069B807    fld         tbyte ptr [esp+3C]
 0069B80B    fcompp
 0069B80D    wait
 0069B80E    fnstsw      al
 0069B810    sahf
>0069B811    jbe         0069B846
 0069B813    fld         dword ptr [ebx+98]
 0069B819    fabs
 0069B81B    fstp        tbyte ptr [esp+48]
 0069B81F    wait
 0069B820    fld         dword ptr [ebx+90]
 0069B826    fabs
 0069B828    fld         tbyte ptr [esp+48]
 0069B82C    fcompp
 0069B82E    wait
 0069B82F    fnstsw      al
 0069B831    sahf
>0069B832    jbe         0069B846
 0069B834    fld         dword ptr [ebx+98]
 0069B83A    fcomp       dword ptr ds:[69D720];0:Single
 0069B840    wait
 0069B841    fnstsw      al
 0069B843    sahf
>0069B844    jb          0069B84A
 0069B846    xor         eax,eax
>0069B848    jmp         0069B84C
 0069B84A    mov         al,1
 0069B84C    call        00686074
 0069B851    fstp        qword ptr [esp]
 0069B854    wait
>0069B855    jmp         0069D70C
 0069B85A    fld         dword ptr [ebx+98]
 0069B860    fabs
 0069B862    fstp        tbyte ptr [esp+3C]
 0069B866    wait
 0069B867    fld         dword ptr [ebx+94]
 0069B86D    fabs
 0069B86F    fld         tbyte ptr [esp+3C]
 0069B873    fcompp
 0069B875    wait
 0069B876    fnstsw      al
 0069B878    sahf
>0069B879    jbe         0069B8AE
 0069B87B    fld         dword ptr [ebx+98]
 0069B881    fabs
 0069B883    fstp        tbyte ptr [esp+48]
 0069B887    wait
 0069B888    fld         dword ptr [ebx+90]
 0069B88E    fabs
 0069B890    fld         tbyte ptr [esp+48]
 0069B894    fcompp
 0069B896    wait
 0069B897    fnstsw      al
 0069B899    sahf
>0069B89A    jbe         0069B8AE
 0069B89C    fld         dword ptr [ebx+98]
 0069B8A2    fcomp       dword ptr ds:[69D720];0:Single
 0069B8A8    wait
 0069B8A9    fnstsw      al
 0069B8AB    sahf
>0069B8AC    ja          0069B8B2
 0069B8AE    xor         eax,eax
>0069B8B0    jmp         0069B8B4
 0069B8B2    mov         al,1
 0069B8B4    call        00686074
 0069B8B9    fstp        qword ptr [esp]
 0069B8BC    wait
>0069B8BD    jmp         0069D70C
 0069B8C2    fld         dword ptr [ebx+7C]
 0069B8C5    fabs
 0069B8C7    fstp        tbyte ptr [esp+3C]
 0069B8CB    wait
 0069B8CC    fld         dword ptr [ebx+78]
 0069B8CF    fabs
 0069B8D1    fld         tbyte ptr [esp+3C]
 0069B8D5    fcompp
 0069B8D7    wait
 0069B8D8    fnstsw      al
 0069B8DA    sahf
>0069B8DB    jbe         0069B935
 0069B8DD    fld         dword ptr [ebx+7C]
 0069B8E0    fabs
 0069B8E2    fstp        tbyte ptr [esp+48]
 0069B8E6    wait
 0069B8E7    fld         dword ptr [ebx+80]
 0069B8ED    fabs
 0069B8EF    fld         tbyte ptr [esp+48]
 0069B8F3    fcompp
 0069B8F5    wait
 0069B8F6    fnstsw      al
 0069B8F8    sahf
>0069B8F9    jbe         0069B935
 0069B8FB    fld         dword ptr [ebx+7C]
 0069B8FE    fcomp       dword ptr ds:[69D720];0:Single
 0069B904    wait
 0069B905    fnstsw      al
 0069B907    sahf
>0069B908    jae         0069B918
 0069B90A    mov         eax,[0081ED7C];gvar_0081ED7C:?
 0069B90F    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069B912    cmp         byte ptr [eax+edx],0
>0069B916    jne         0069B939
 0069B918    fld         dword ptr [ebx+7C]
 0069B91B    fcomp       dword ptr ds:[69D720];0:Single
 0069B921    wait
 0069B922    fnstsw      al
 0069B924    sahf
>0069B925    jbe         0069B935
 0069B927    mov         eax,[0081ED7C];gvar_0081ED7C:?
 0069B92C    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069B92F    cmp         byte ptr [eax+edx],0
>0069B933    je          0069B939
 0069B935    xor         eax,eax
>0069B937    jmp         0069B93B
 0069B939    mov         al,1
 0069B93B    call        00686074
 0069B940    fstp        qword ptr [esp]
 0069B943    wait
>0069B944    jmp         0069D70C
 0069B949    fld         dword ptr [ebx+7C]
 0069B94C    fabs
 0069B94E    fstp        tbyte ptr [esp+3C]
 0069B952    wait
 0069B953    fld         dword ptr [ebx+78]
 0069B956    fabs
 0069B958    fld         tbyte ptr [esp+3C]
 0069B95C    fcompp
 0069B95E    wait
 0069B95F    fnstsw      al
 0069B961    sahf
>0069B962    jbe         0069B9BC
 0069B964    fld         dword ptr [ebx+7C]
 0069B967    fabs
 0069B969    fstp        tbyte ptr [esp+48]
 0069B96D    wait
 0069B96E    fld         dword ptr [ebx+80]
 0069B974    fabs
 0069B976    fld         tbyte ptr [esp+48]
 0069B97A    fcompp
 0069B97C    wait
 0069B97D    fnstsw      al
 0069B97F    sahf
>0069B980    jbe         0069B9BC
 0069B982    fld         dword ptr [ebx+7C]
 0069B985    fcomp       dword ptr ds:[69D720];0:Single
 0069B98B    wait
 0069B98C    fnstsw      al
 0069B98E    sahf
>0069B98F    jae         0069B99F
 0069B991    mov         eax,[0081ED7C];gvar_0081ED7C:?
 0069B996    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069B999    cmp         byte ptr [eax+edx],0
>0069B99D    jne         0069B9C0
 0069B99F    fld         dword ptr [ebx+7C]
 0069B9A2    fcomp       dword ptr ds:[69D720];0:Single
 0069B9A8    wait
 0069B9A9    fnstsw      al
 0069B9AB    sahf
>0069B9AC    jbe         0069B9BC
 0069B9AE    mov         eax,[0081ED7C];gvar_0081ED7C:?
 0069B9B3    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069B9B6    cmp         byte ptr [eax+edx],0
>0069B9BA    je          0069B9C0
 0069B9BC    xor         eax,eax
>0069B9BE    jmp         0069B9C2
 0069B9C0    mov         al,1
 0069B9C2    call        00686074
 0069B9C7    fstp        qword ptr [esp]
 0069B9CA    wait
>0069B9CB    jmp         0069D70C
 0069B9D0    fld         dword ptr [ebx+78]
 0069B9D3    fabs
 0069B9D5    fstp        tbyte ptr [esp+3C]
 0069B9D9    wait
 0069B9DA    fld         dword ptr [ebx+7C]
 0069B9DD    fabs
 0069B9DF    fld         tbyte ptr [esp+3C]
 0069B9E3    fcompp
 0069B9E5    wait
 0069B9E6    fnstsw      al
 0069B9E8    sahf
>0069B9E9    jbe         0069BA43
 0069B9EB    fld         dword ptr [ebx+78]
 0069B9EE    fabs
 0069B9F0    fstp        tbyte ptr [esp+48]
 0069B9F4    wait
 0069B9F5    fld         dword ptr [ebx+80]
 0069B9FB    fabs
 0069B9FD    fld         tbyte ptr [esp+48]
 0069BA01    fcompp
 0069BA03    wait
 0069BA04    fnstsw      al
 0069BA06    sahf
>0069BA07    jbe         0069BA43
 0069BA09    fld         dword ptr [ebx+78]
 0069BA0C    fcomp       dword ptr ds:[69D720];0:Single
 0069BA12    wait
 0069BA13    fnstsw      al
 0069BA15    sahf
>0069BA16    jae         0069BA26
 0069BA18    mov         eax,[0081ED7C];gvar_0081ED7C:?
 0069BA1D    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069BA20    cmp         byte ptr [eax+edx],0
>0069BA24    jne         0069BA47
 0069BA26    fld         dword ptr [ebx+78]
 0069BA29    fcomp       dword ptr ds:[69D720];0:Single
 0069BA2F    wait
 0069BA30    fnstsw      al
 0069BA32    sahf
>0069BA33    jbe         0069BA43
 0069BA35    mov         eax,[0081ED7C];gvar_0081ED7C:?
 0069BA3A    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069BA3D    cmp         byte ptr [eax+edx],0
>0069BA41    je          0069BA47
 0069BA43    xor         eax,eax
>0069BA45    jmp         0069BA49
 0069BA47    mov         al,1
 0069BA49    call        00686074
 0069BA4E    fstp        qword ptr [esp]
 0069BA51    wait
>0069BA52    jmp         0069D70C
 0069BA57    fld         dword ptr [ebx+78]
 0069BA5A    fabs
 0069BA5C    fstp        tbyte ptr [esp+3C]
 0069BA60    wait
 0069BA61    fld         dword ptr [ebx+7C]
 0069BA64    fabs
 0069BA66    fld         tbyte ptr [esp+3C]
 0069BA6A    fcompp
 0069BA6C    wait
 0069BA6D    fnstsw      al
 0069BA6F    sahf
>0069BA70    jbe         0069BACA
 0069BA72    fld         dword ptr [ebx+78]
 0069BA75    fabs
 0069BA77    fstp        tbyte ptr [esp+48]
 0069BA7B    wait
 0069BA7C    fld         dword ptr [ebx+80]
 0069BA82    fabs
 0069BA84    fld         tbyte ptr [esp+48]
 0069BA88    fcompp
 0069BA8A    wait
 0069BA8B    fnstsw      al
 0069BA8D    sahf
>0069BA8E    jbe         0069BACA
 0069BA90    fld         dword ptr [ebx+78]
 0069BA93    fcomp       dword ptr ds:[69D720];0:Single
 0069BA99    wait
 0069BA9A    fnstsw      al
 0069BA9C    sahf
>0069BA9D    jbe         0069BAAD
 0069BA9F    mov         eax,[0081ED7C];gvar_0081ED7C:?
 0069BAA4    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069BAA7    cmp         byte ptr [eax+edx],0
>0069BAAB    jne         0069BACE
 0069BAAD    fld         dword ptr [ebx+78]
 0069BAB0    fcomp       dword ptr ds:[69D720];0:Single
 0069BAB6    wait
 0069BAB7    fnstsw      al
 0069BAB9    sahf
>0069BABA    jae         0069BACA
 0069BABC    mov         eax,[0081ED7C];gvar_0081ED7C:?
 0069BAC1    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069BAC4    cmp         byte ptr [eax+edx],0
>0069BAC8    je          0069BACE
 0069BACA    xor         eax,eax
>0069BACC    jmp         0069BAD0
 0069BACE    mov         al,1
 0069BAD0    call        00686074
 0069BAD5    fstp        qword ptr [esp]
 0069BAD8    wait
>0069BAD9    jmp         0069D70C
 0069BADE    fld         dword ptr [ebx+80]
 0069BAE4    fabs
 0069BAE6    fstp        tbyte ptr [esp+3C]
 0069BAEA    wait
 0069BAEB    fld         dword ptr [ebx+7C]
 0069BAEE    fabs
 0069BAF0    fld         tbyte ptr [esp+3C]
 0069BAF4    fcompp
 0069BAF6    wait
 0069BAF7    fnstsw      al
 0069BAF9    sahf
>0069BAFA    jbe         0069BB5A
 0069BAFC    fld         dword ptr [ebx+80]
 0069BB02    fabs
 0069BB04    fstp        tbyte ptr [esp+48]
 0069BB08    wait
 0069BB09    fld         dword ptr [ebx+78]
 0069BB0C    fabs
 0069BB0E    fld         tbyte ptr [esp+48]
 0069BB12    fcompp
 0069BB14    wait
 0069BB15    fnstsw      al
 0069BB17    sahf
>0069BB18    jbe         0069BB5A
 0069BB1A    fld         dword ptr [ebx+80]
 0069BB20    fcomp       dword ptr ds:[69D720];0:Single
 0069BB26    wait
 0069BB27    fnstsw      al
 0069BB29    sahf
>0069BB2A    jbe         0069BB3A
 0069BB2C    mov         eax,[0081ED7C];gvar_0081ED7C:?
 0069BB31    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069BB34    cmp         byte ptr [eax+edx],0
>0069BB38    jne         0069BB5E
 0069BB3A    fld         dword ptr [ebx+80]
 0069BB40    fcomp       dword ptr ds:[69D720];0:Single
 0069BB46    wait
 0069BB47    fnstsw      al
 0069BB49    sahf
>0069BB4A    jae         0069BB5A
 0069BB4C    mov         eax,[0081ED7C];gvar_0081ED7C:?
 0069BB51    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069BB54    cmp         byte ptr [eax+edx],0
>0069BB58    je          0069BB5E
 0069BB5A    xor         eax,eax
>0069BB5C    jmp         0069BB60
 0069BB5E    mov         al,1
 0069BB60    call        00686074
 0069BB65    fstp        qword ptr [esp]
 0069BB68    wait
>0069BB69    jmp         0069D70C
 0069BB6E    fld         dword ptr [ebx+80]
 0069BB74    fabs
 0069BB76    fstp        tbyte ptr [esp+3C]
 0069BB7A    wait
 0069BB7B    fld         dword ptr [ebx+7C]
 0069BB7E    fabs
 0069BB80    fld         tbyte ptr [esp+3C]
 0069BB84    fcompp
 0069BB86    wait
 0069BB87    fnstsw      al
 0069BB89    sahf
>0069BB8A    jbe         0069BBEA
 0069BB8C    fld         dword ptr [ebx+80]
 0069BB92    fabs
 0069BB94    fstp        tbyte ptr [esp+48]
 0069BB98    wait
 0069BB99    fld         dword ptr [ebx+78]
 0069BB9C    fabs
 0069BB9E    fld         tbyte ptr [esp+48]
 0069BBA2    fcompp
 0069BBA4    wait
 0069BBA5    fnstsw      al
 0069BBA7    sahf
>0069BBA8    jbe         0069BBEA
 0069BBAA    fld         dword ptr [ebx+80]
 0069BBB0    fcomp       dword ptr ds:[69D720];0:Single
 0069BBB6    wait
 0069BBB7    fnstsw      al
 0069BBB9    sahf
>0069BBBA    jae         0069BBCA
 0069BBBC    mov         eax,[0081ED7C];gvar_0081ED7C:?
 0069BBC1    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069BBC4    cmp         byte ptr [eax+edx],0
>0069BBC8    jne         0069BBEE
 0069BBCA    fld         dword ptr [ebx+80]
 0069BBD0    fcomp       dword ptr ds:[69D720];0:Single
 0069BBD6    wait
 0069BBD7    fnstsw      al
 0069BBD9    sahf
>0069BBDA    jbe         0069BBEA
 0069BBDC    mov         eax,[0081ED7C];gvar_0081ED7C:?
 0069BBE1    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069BBE4    cmp         byte ptr [eax+edx],0
>0069BBE8    je          0069BBEE
 0069BBEA    xor         eax,eax
>0069BBEC    jmp         0069BBF0
 0069BBEE    mov         al,1
 0069BBF0    call        00686074
 0069BBF5    fstp        qword ptr [esp]
 0069BBF8    wait
>0069BBF9    jmp         0069D70C
 0069BBFE    fld         dword ptr [ebx+88]
 0069BC04    fabs
 0069BC06    fstp        tbyte ptr [esp+3C]
 0069BC0A    wait
 0069BC0B    fld         dword ptr [ebx+84]
 0069BC11    fabs
 0069BC13    fld         tbyte ptr [esp+3C]
 0069BC17    fcompp
 0069BC19    wait
 0069BC1A    fnstsw      al
 0069BC1C    sahf
>0069BC1D    jbe         0069BC52
 0069BC1F    fld         dword ptr [ebx+88]
 0069BC25    fabs
 0069BC27    fstp        tbyte ptr [esp+48]
 0069BC2B    wait
 0069BC2C    fld         dword ptr [ebx+8C]
 0069BC32    fabs
 0069BC34    fld         tbyte ptr [esp+48]
 0069BC38    fcompp
 0069BC3A    wait
 0069BC3B    fnstsw      al
 0069BC3D    sahf
>0069BC3E    jbe         0069BC52
 0069BC40    fld         dword ptr [ebx+88]
 0069BC46    fcomp       dword ptr ds:[69D720];0:Single
 0069BC4C    wait
 0069BC4D    fnstsw      al
 0069BC4F    sahf
>0069BC50    jb          0069BC56
 0069BC52    xor         eax,eax
>0069BC54    jmp         0069BC58
 0069BC56    mov         al,1
 0069BC58    call        00686074
 0069BC5D    fstp        qword ptr [esp]
 0069BC60    wait
>0069BC61    jmp         0069D70C
 0069BC66    fld         dword ptr [ebx+88]
 0069BC6C    fabs
 0069BC6E    fstp        tbyte ptr [esp+3C]
 0069BC72    wait
 0069BC73    fld         dword ptr [ebx+84]
 0069BC79    fabs
 0069BC7B    fld         tbyte ptr [esp+3C]
 0069BC7F    fcompp
 0069BC81    wait
 0069BC82    fnstsw      al
 0069BC84    sahf
>0069BC85    jbe         0069BCBA
 0069BC87    fld         dword ptr [ebx+88]
 0069BC8D    fabs
 0069BC8F    fstp        tbyte ptr [esp+48]
 0069BC93    wait
 0069BC94    fld         dword ptr [ebx+8C]
 0069BC9A    fabs
 0069BC9C    fld         tbyte ptr [esp+48]
 0069BCA0    fcompp
 0069BCA2    wait
 0069BCA3    fnstsw      al
 0069BCA5    sahf
>0069BCA6    jbe         0069BCBA
 0069BCA8    fld         dword ptr [ebx+88]
 0069BCAE    fcomp       dword ptr ds:[69D720];0:Single
 0069BCB4    wait
 0069BCB5    fnstsw      al
 0069BCB7    sahf
>0069BCB8    ja          0069BCBE
 0069BCBA    xor         eax,eax
>0069BCBC    jmp         0069BCC0
 0069BCBE    mov         al,1
 0069BCC0    call        00686074
 0069BCC5    fstp        qword ptr [esp]
 0069BCC8    wait
>0069BCC9    jmp         0069D70C
 0069BCCE    fld         dword ptr [ebx+84]
 0069BCD4    fabs
 0069BCD6    fstp        tbyte ptr [esp+3C]
 0069BCDA    wait
 0069BCDB    fld         dword ptr [ebx+88]
 0069BCE1    fabs
 0069BCE3    fld         tbyte ptr [esp+3C]
 0069BCE7    fcompp
 0069BCE9    wait
 0069BCEA    fnstsw      al
 0069BCEC    sahf
>0069BCED    jbe         0069BD22
 0069BCEF    fld         dword ptr [ebx+84]
 0069BCF5    fabs
 0069BCF7    fstp        tbyte ptr [esp+48]
 0069BCFB    wait
 0069BCFC    fld         dword ptr [ebx+8C]
 0069BD02    fabs
 0069BD04    fld         tbyte ptr [esp+48]
 0069BD08    fcompp
 0069BD0A    wait
 0069BD0B    fnstsw      al
 0069BD0D    sahf
>0069BD0E    jbe         0069BD22
 0069BD10    fld         dword ptr [ebx+84]
 0069BD16    fcomp       dword ptr ds:[69D720];0:Single
 0069BD1C    wait
 0069BD1D    fnstsw      al
 0069BD1F    sahf
>0069BD20    ja          0069BD26
 0069BD22    xor         eax,eax
>0069BD24    jmp         0069BD28
 0069BD26    mov         al,1
 0069BD28    call        00686074
 0069BD2D    fstp        qword ptr [esp]
 0069BD30    wait
>0069BD31    jmp         0069D70C
 0069BD36    fld         dword ptr [ebx+84]
 0069BD3C    fabs
 0069BD3E    fstp        tbyte ptr [esp+3C]
 0069BD42    wait
 0069BD43    fld         dword ptr [ebx+88]
 0069BD49    fabs
 0069BD4B    fld         tbyte ptr [esp+3C]
 0069BD4F    fcompp
 0069BD51    wait
 0069BD52    fnstsw      al
 0069BD54    sahf
>0069BD55    jbe         0069BD8A
 0069BD57    fld         dword ptr [ebx+84]
 0069BD5D    fabs
 0069BD5F    fstp        tbyte ptr [esp+48]
 0069BD63    wait
 0069BD64    fld         dword ptr [ebx+8C]
 0069BD6A    fabs
 0069BD6C    fld         tbyte ptr [esp+48]
 0069BD70    fcompp
 0069BD72    wait
 0069BD73    fnstsw      al
 0069BD75    sahf
>0069BD76    jbe         0069BD8A
 0069BD78    fld         dword ptr [ebx+84]
 0069BD7E    fcomp       dword ptr ds:[69D720];0:Single
 0069BD84    wait
 0069BD85    fnstsw      al
 0069BD87    sahf
>0069BD88    jb          0069BD8E
 0069BD8A    xor         eax,eax
>0069BD8C    jmp         0069BD90
 0069BD8E    mov         al,1
 0069BD90    call        00686074
 0069BD95    fstp        qword ptr [esp]
 0069BD98    wait
>0069BD99    jmp         0069D70C
 0069BD9E    fld         dword ptr [ebx+8C]
 0069BDA4    fabs
 0069BDA6    fstp        tbyte ptr [esp+3C]
 0069BDAA    wait
 0069BDAB    fld         dword ptr [ebx+88]
 0069BDB1    fabs
 0069BDB3    fld         tbyte ptr [esp+3C]
 0069BDB7    fcompp
 0069BDB9    wait
 0069BDBA    fnstsw      al
 0069BDBC    sahf
>0069BDBD    jbe         0069BDF2
 0069BDBF    fld         dword ptr [ebx+8C]
 0069BDC5    fabs
 0069BDC7    fstp        tbyte ptr [esp+48]
 0069BDCB    wait
 0069BDCC    fld         dword ptr [ebx+84]
 0069BDD2    fabs
 0069BDD4    fld         tbyte ptr [esp+48]
 0069BDD8    fcompp
 0069BDDA    wait
 0069BDDB    fnstsw      al
 0069BDDD    sahf
>0069BDDE    jbe         0069BDF2
 0069BDE0    fld         dword ptr [ebx+8C]
 0069BDE6    fcomp       dword ptr ds:[69D720];0:Single
 0069BDEC    wait
 0069BDED    fnstsw      al
 0069BDEF    sahf
>0069BDF0    jb          0069BDF6
 0069BDF2    xor         eax,eax
>0069BDF4    jmp         0069BDF8
 0069BDF6    mov         al,1
 0069BDF8    call        00686074
 0069BDFD    fstp        qword ptr [esp]
 0069BE00    wait
>0069BE01    jmp         0069D70C
 0069BE06    fld         dword ptr [ebx+8C]
 0069BE0C    fabs
 0069BE0E    fstp        tbyte ptr [esp+3C]
 0069BE12    wait
 0069BE13    fld         dword ptr [ebx+88]
 0069BE19    fabs
 0069BE1B    fld         tbyte ptr [esp+3C]
 0069BE1F    fcompp
 0069BE21    wait
 0069BE22    fnstsw      al
 0069BE24    sahf
>0069BE25    jbe         0069BE5A
 0069BE27    fld         dword ptr [ebx+8C]
 0069BE2D    fabs
 0069BE2F    fstp        tbyte ptr [esp+48]
 0069BE33    wait
 0069BE34    fld         dword ptr [ebx+84]
 0069BE3A    fabs
 0069BE3C    fld         tbyte ptr [esp+48]
 0069BE40    fcompp
 0069BE42    wait
 0069BE43    fnstsw      al
 0069BE45    sahf
>0069BE46    jbe         0069BE5A
 0069BE48    fld         dword ptr [ebx+8C]
 0069BE4E    fcomp       dword ptr ds:[69D720];0:Single
 0069BE54    wait
 0069BE55    fnstsw      al
 0069BE57    sahf
>0069BE58    ja          0069BE5E
 0069BE5A    xor         eax,eax
>0069BE5C    jmp         0069BE60
 0069BE5E    mov         al,1
 0069BE60    call        00686074
 0069BE65    fstp        qword ptr [esp]
 0069BE68    wait
>0069BE69    jmp         0069D70C
 0069BE6E    fld         dword ptr [ebx+88]
 0069BE74    fabs
 0069BE76    fstp        tbyte ptr [esp+3C]
 0069BE7A    wait
 0069BE7B    fld         dword ptr [ebx+84]
 0069BE81    fabs
 0069BE83    fld         tbyte ptr [esp+3C]
 0069BE87    fcompp
 0069BE89    wait
 0069BE8A    fnstsw      al
 0069BE8C    sahf
>0069BE8D    jbe         0069BEC2
 0069BE8F    fld         dword ptr [ebx+88]
 0069BE95    fabs
 0069BE97    fstp        tbyte ptr [esp+48]
 0069BE9B    wait
 0069BE9C    fld         dword ptr [ebx+8C]
 0069BEA2    fabs
 0069BEA4    fld         tbyte ptr [esp+48]
 0069BEA8    fcompp
 0069BEAA    wait
 0069BEAB    fnstsw      al
 0069BEAD    sahf
>0069BEAE    jbe         0069BEC2
 0069BEB0    fld         dword ptr [ebx+88]
 0069BEB6    fcomp       dword ptr ds:[69D720];0:Single
 0069BEBC    wait
 0069BEBD    fnstsw      al
 0069BEBF    sahf
>0069BEC0    ja          0069BEC6
 0069BEC2    xor         eax,eax
>0069BEC4    jmp         0069BEC8
 0069BEC6    mov         al,1
 0069BEC8    call        00686074
 0069BECD    fstp        qword ptr [esp]
 0069BED0    wait
>0069BED1    jmp         0069D70C
 0069BED6    fld         dword ptr [ebx+88]
 0069BEDC    fabs
 0069BEDE    fstp        tbyte ptr [esp+3C]
 0069BEE2    wait
 0069BEE3    fld         dword ptr [ebx+84]
 0069BEE9    fabs
 0069BEEB    fld         tbyte ptr [esp+3C]
 0069BEEF    fcompp
 0069BEF1    wait
 0069BEF2    fnstsw      al
 0069BEF4    sahf
>0069BEF5    jbe         0069BF2A
 0069BEF7    fld         dword ptr [ebx+88]
 0069BEFD    fabs
 0069BEFF    fstp        tbyte ptr [esp+48]
 0069BF03    wait
 0069BF04    fld         dword ptr [ebx+8C]
 0069BF0A    fabs
 0069BF0C    fld         tbyte ptr [esp+48]
 0069BF10    fcompp
 0069BF12    wait
 0069BF13    fnstsw      al
 0069BF15    sahf
>0069BF16    jbe         0069BF2A
 0069BF18    fld         dword ptr [ebx+88]
 0069BF1E    fcomp       dword ptr ds:[69D720];0:Single
 0069BF24    wait
 0069BF25    fnstsw      al
 0069BF27    sahf
>0069BF28    jb          0069BF2E
 0069BF2A    xor         eax,eax
>0069BF2C    jmp         0069BF30
 0069BF2E    mov         al,1
 0069BF30    call        00686074
 0069BF35    fstp        qword ptr [esp]
 0069BF38    wait
>0069BF39    jmp         0069D70C
 0069BF3E    fld         dword ptr [ebx+84]
 0069BF44    fabs
 0069BF46    fstp        tbyte ptr [esp+3C]
 0069BF4A    wait
 0069BF4B    fld         dword ptr [ebx+88]
 0069BF51    fabs
 0069BF53    fld         tbyte ptr [esp+3C]
 0069BF57    fcompp
 0069BF59    wait
 0069BF5A    fnstsw      al
 0069BF5C    sahf
>0069BF5D    jbe         0069BF92
 0069BF5F    fld         dword ptr [ebx+84]
 0069BF65    fabs
 0069BF67    fstp        tbyte ptr [esp+48]
 0069BF6B    wait
 0069BF6C    fld         dword ptr [ebx+8C]
 0069BF72    fabs
 0069BF74    fld         tbyte ptr [esp+48]
 0069BF78    fcompp
 0069BF7A    wait
 0069BF7B    fnstsw      al
 0069BF7D    sahf
>0069BF7E    jbe         0069BF92
 0069BF80    fld         dword ptr [ebx+84]
 0069BF86    fcomp       dword ptr ds:[69D720];0:Single
 0069BF8C    wait
 0069BF8D    fnstsw      al
 0069BF8F    sahf
>0069BF90    jb          0069BF96
 0069BF92    xor         eax,eax
>0069BF94    jmp         0069BF98
 0069BF96    mov         al,1
 0069BF98    call        00686074
 0069BF9D    fstp        qword ptr [esp]
 0069BFA0    wait
>0069BFA1    jmp         0069D70C
 0069BFA6    fld         dword ptr [ebx+84]
 0069BFAC    fabs
 0069BFAE    fstp        tbyte ptr [esp+3C]
 0069BFB2    wait
 0069BFB3    fld         dword ptr [ebx+88]
 0069BFB9    fabs
 0069BFBB    fld         tbyte ptr [esp+3C]
 0069BFBF    fcompp
 0069BFC1    wait
 0069BFC2    fnstsw      al
 0069BFC4    sahf
>0069BFC5    jbe         0069BFFA
 0069BFC7    fld         dword ptr [ebx+84]
 0069BFCD    fabs
 0069BFCF    fstp        tbyte ptr [esp+48]
 0069BFD3    wait
 0069BFD4    fld         dword ptr [ebx+8C]
 0069BFDA    fabs
 0069BFDC    fld         tbyte ptr [esp+48]
 0069BFE0    fcompp
 0069BFE2    wait
 0069BFE3    fnstsw      al
 0069BFE5    sahf
>0069BFE6    jbe         0069BFFA
 0069BFE8    fld         dword ptr [ebx+84]
 0069BFEE    fcomp       dword ptr ds:[69D720];0:Single
 0069BFF4    wait
 0069BFF5    fnstsw      al
 0069BFF7    sahf
>0069BFF8    ja          0069BFFE
 0069BFFA    xor         eax,eax
>0069BFFC    jmp         0069C000
 0069BFFE    mov         al,1
 0069C000    call        00686074
 0069C005    fstp        qword ptr [esp]
 0069C008    wait
>0069C009    jmp         0069D70C
 0069C00E    fld         dword ptr [ebx+8C]
 0069C014    fabs
 0069C016    fstp        tbyte ptr [esp+3C]
 0069C01A    wait
 0069C01B    fld         dword ptr [ebx+88]
 0069C021    fabs
 0069C023    fld         tbyte ptr [esp+3C]
 0069C027    fcompp
 0069C029    wait
 0069C02A    fnstsw      al
 0069C02C    sahf
>0069C02D    jbe         0069C062
 0069C02F    fld         dword ptr [ebx+8C]
 0069C035    fabs
 0069C037    fstp        tbyte ptr [esp+48]
 0069C03B    wait
 0069C03C    fld         dword ptr [ebx+84]
 0069C042    fabs
 0069C044    fld         tbyte ptr [esp+48]
 0069C048    fcompp
 0069C04A    wait
 0069C04B    fnstsw      al
 0069C04D    sahf
>0069C04E    jbe         0069C062
 0069C050    fld         dword ptr [ebx+8C]
 0069C056    fcomp       dword ptr ds:[69D720];0:Single
 0069C05C    wait
 0069C05D    fnstsw      al
 0069C05F    sahf
>0069C060    ja          0069C066
 0069C062    xor         eax,eax
>0069C064    jmp         0069C068
 0069C066    mov         al,1
 0069C068    call        00686074
 0069C06D    fstp        qword ptr [esp]
 0069C070    wait
>0069C071    jmp         0069D70C
 0069C076    fld         dword ptr [ebx+8C]
 0069C07C    fabs
 0069C07E    fstp        tbyte ptr [esp+3C]
 0069C082    wait
 0069C083    fld         dword ptr [ebx+88]
 0069C089    fabs
 0069C08B    fld         tbyte ptr [esp+3C]
 0069C08F    fcompp
 0069C091    wait
 0069C092    fnstsw      al
 0069C094    sahf
>0069C095    jbe         0069C0CA
 0069C097    fld         dword ptr [ebx+8C]
 0069C09D    fabs
 0069C09F    fstp        tbyte ptr [esp+48]
 0069C0A3    wait
 0069C0A4    fld         dword ptr [ebx+84]
 0069C0AA    fabs
 0069C0AC    fld         tbyte ptr [esp+48]
 0069C0B0    fcompp
 0069C0B2    wait
 0069C0B3    fnstsw      al
 0069C0B5    sahf
>0069C0B6    jbe         0069C0CA
 0069C0B8    fld         dword ptr [ebx+8C]
 0069C0BE    fcomp       dword ptr ds:[69D720];0:Single
 0069C0C4    wait
 0069C0C5    fnstsw      al
 0069C0C7    sahf
>0069C0C8    jb          0069C0CE
 0069C0CA    xor         eax,eax
>0069C0CC    jmp         0069C0D0
 0069C0CE    mov         al,1
 0069C0D0    call        00686074
 0069C0D5    fstp        qword ptr [esp]
 0069C0D8    wait
>0069C0D9    jmp         0069D70C
 0069C0DE    fild        dword ptr ds:[78BE08];gvar_0078BE08:Single
 0069C0E4    fstp        qword ptr [esp]
 0069C0E7    wait
>0069C0E8    jmp         0069D70C
 0069C0ED    fild        dword ptr ds:[78BE0C];gvar_0078BE0C:Single
 0069C0F3    fstp        qword ptr [esp]
 0069C0F6    wait
>0069C0F7    jmp         0069D70C
 0069C0FC    mov         edx,edi
 0069C0FE    sub         edx,3E8
 0069C104    mov         eax,esi
 0069C106    call        TGloveValue.GetLLLLL
 0069C10B    call        00686074
 0069C110    fstp        qword ptr [esp]
 0069C113    wait
>0069C114    jmp         0069D70C
 0069C119    fld         dword ptr [ebx+100]
 0069C11F    fstp        qword ptr [esp]
 0069C122    wait
>0069C123    jmp         0069D70C
 0069C128    fld         dword ptr [ebx+104]
 0069C12E    fstp        qword ptr [esp]
 0069C131    wait
>0069C132    jmp         0069D70C
 0069C137    fld         dword ptr [ebx+108]
 0069C13D    fstp        qword ptr [esp]
 0069C140    wait
>0069C141    jmp         0069D70C
 0069C146    fld         dword ptr [ebx+10C]
 0069C14C    fstp        qword ptr [esp]
 0069C14F    wait
>0069C150    jmp         0069D70C
 0069C155    fld         dword ptr [ebx+110]
 0069C15B    fstp        qword ptr [esp]
 0069C15E    wait
>0069C15F    jmp         0069D70C
 0069C164    fld         dword ptr [ebx+114]
 0069C16A    fstp        qword ptr [esp]
 0069C16D    wait
>0069C16E    jmp         0069D70C
 0069C173    fld         dword ptr [ebx+118]
 0069C179    fstp        qword ptr [esp]
 0069C17C    wait
>0069C17D    jmp         0069D70C
 0069C182    fld         dword ptr [ebx+11C]
 0069C188    fstp        qword ptr [esp]
 0069C18B    wait
>0069C18C    jmp         0069D70C
 0069C191    fld         dword ptr [ebx+120]
 0069C197    fstp        qword ptr [esp]
 0069C19A    wait
>0069C19B    jmp         0069D70C
 0069C1A0    fld         dword ptr [ebx+124]
 0069C1A6    fstp        qword ptr [esp]
 0069C1A9    wait
>0069C1AA    jmp         0069D70C
 0069C1AF    fld         dword ptr [ebx+128]
 0069C1B5    fstp        qword ptr [esp]
 0069C1B8    wait
>0069C1B9    jmp         0069D70C
 0069C1BE    fld         dword ptr [ebx+12C]
 0069C1C4    fstp        qword ptr [esp]
 0069C1C7    wait
>0069C1C8    jmp         0069D70C
 0069C1CD    fld         dword ptr [ebx+130]
 0069C1D3    fstp        qword ptr [esp]
 0069C1D6    wait
>0069C1D7    jmp         0069D70C
 0069C1DC    fld         dword ptr [ebx+134]
 0069C1E2    fstp        qword ptr [esp]
 0069C1E5    wait
>0069C1E6    jmp         0069D70C
 0069C1EB    fld         dword ptr [ebx+138]
 0069C1F1    fstp        qword ptr [esp]
 0069C1F4    wait
>0069C1F5    jmp         0069D70C
 0069C1FA    fld         dword ptr [ebx+13C]
 0069C200    fstp        qword ptr [esp]
 0069C203    wait
>0069C204    jmp         0069D70C
 0069C209    fld         dword ptr [ebx+140]
 0069C20F    fstp        qword ptr [esp]
 0069C212    wait
>0069C213    jmp         0069D70C
 0069C218    fld         dword ptr [ebx+144]
 0069C21E    fstp        qword ptr [esp]
 0069C221    wait
>0069C222    jmp         0069D70C
 0069C227    fld         dword ptr [ebx+148]
 0069C22D    fstp        qword ptr [esp]
 0069C230    wait
>0069C231    jmp         0069D70C
 0069C236    fld         dword ptr [ebx+14C]
 0069C23C    fstp        qword ptr [esp]
 0069C23F    wait
>0069C240    jmp         0069D70C
 0069C245    fld         dword ptr [ebx+150]
 0069C24B    fstp        qword ptr [esp]
 0069C24E    wait
>0069C24F    jmp         0069D70C
 0069C254    fld         dword ptr [ebx+154]
 0069C25A    fstp        qword ptr [esp]
 0069C25D    wait
>0069C25E    jmp         0069D70C
 0069C263    fld         dword ptr [ebx+158]
 0069C269    fstp        qword ptr [esp]
 0069C26C    wait
>0069C26D    jmp         0069D70C
 0069C272    fld         dword ptr [ebx+15C]
 0069C278    fstp        qword ptr [esp]
 0069C27B    wait
>0069C27C    jmp         0069D70C
 0069C281    movzx       eax,byte ptr [ebx+218]
 0069C288    call        00686074
 0069C28D    fstp        qword ptr [esp]
 0069C290    wait
>0069C291    jmp         0069D70C
 0069C296    movzx       eax,byte ptr [ebx+219]
 0069C29D    call        00686074
 0069C2A2    fstp        qword ptr [esp]
 0069C2A5    wait
>0069C2A6    jmp         0069D70C
 0069C2AB    movzx       eax,byte ptr [ebx+21A]
 0069C2B2    call        00686074
 0069C2B7    fstp        qword ptr [esp]
 0069C2BA    wait
>0069C2BB    jmp         0069D70C
 0069C2C0    movzx       eax,byte ptr [ebx+21B]
 0069C2C7    call        00686074
 0069C2CC    fstp        qword ptr [esp]
 0069C2CF    wait
>0069C2D0    jmp         0069D70C
 0069C2D5    movzx       eax,byte ptr [ebx+21C]
 0069C2DC    call        00686074
 0069C2E1    fstp        qword ptr [esp]
 0069C2E4    wait
>0069C2E5    jmp         0069D70C
 0069C2EA    movzx       eax,byte ptr [ebx+21D]
 0069C2F1    call        00686074
 0069C2F6    fstp        qword ptr [esp]
 0069C2F9    wait
>0069C2FA    jmp         0069D70C
 0069C2FF    movzx       eax,byte ptr [ebx+21E]
 0069C306    call        00686074
 0069C30B    fstp        qword ptr [esp]
 0069C30E    wait
>0069C30F    jmp         0069D70C
 0069C314    movzx       eax,byte ptr [ebx+21F]
 0069C31B    call        00686074
 0069C320    fstp        qword ptr [esp]
 0069C323    wait
>0069C324    jmp         0069D70C
 0069C329    cmp         byte ptr [ebx+22C],0
>0069C330    jne         0069C341
 0069C332    fild        dword ptr [ebx+238]
 0069C338    fstp        qword ptr [esp]
 0069C33B    wait
>0069C33C    jmp         0069D70C
 0069C341    cmp         byte ptr [ebx+22D],0
>0069C348    jne         0069C359
 0069C34A    fild        dword ptr [ebx+244]
 0069C350    fstp        qword ptr [esp]
 0069C353    wait
>0069C354    jmp         0069D70C
 0069C359    cmp         byte ptr [ebx+22E],0
>0069C360    jne         0069C371
 0069C362    fild        dword ptr [ebx+250]
 0069C368    fstp        qword ptr [esp]
 0069C36B    wait
>0069C36C    jmp         0069D70C
 0069C371    cmp         byte ptr [ebx+22F],0
>0069C378    jne         0069C389
 0069C37A    fild        dword ptr [ebx+25C]
 0069C380    fstp        qword ptr [esp]
 0069C383    wait
>0069C384    jmp         0069D70C
 0069C389    xor         eax,eax
 0069C38B    mov         dword ptr [esp],eax
 0069C38E    mov         dword ptr [esp+4],eax
>0069C392    jmp         0069D70C
 0069C397    cmp         byte ptr [ebx+22C],1
>0069C39E    jne         0069C3AF
 0069C3A0    fild        dword ptr [ebx+238]
 0069C3A6    fstp        qword ptr [esp]
 0069C3A9    wait
>0069C3AA    jmp         0069D70C
 0069C3AF    cmp         byte ptr [ebx+22D],1
>0069C3B6    jne         0069C3C7
 0069C3B8    fild        dword ptr [ebx+244]
 0069C3BE    fstp        qword ptr [esp]
 0069C3C1    wait
>0069C3C2    jmp         0069D70C
 0069C3C7    cmp         byte ptr [ebx+22E],1
>0069C3CE    jne         0069C3DF
 0069C3D0    fild        dword ptr [ebx+250]
 0069C3D6    fstp        qword ptr [esp]
 0069C3D9    wait
>0069C3DA    jmp         0069D70C
 0069C3DF    cmp         byte ptr [ebx+22F],1
>0069C3E6    jne         0069C3F7
 0069C3E8    fild        dword ptr [ebx+25C]
 0069C3EE    fstp        qword ptr [esp]
 0069C3F1    wait
>0069C3F2    jmp         0069D70C
 0069C3F7    xor         eax,eax
 0069C3F9    mov         dword ptr [esp],eax
 0069C3FC    mov         dword ptr [esp+4],eax
>0069C400    jmp         0069D70C
 0069C405    cmp         byte ptr [ebx+22C],2
>0069C40C    jne         0069C41D
 0069C40E    fild        dword ptr [ebx+238]
 0069C414    fstp        qword ptr [esp]
 0069C417    wait
>0069C418    jmp         0069D70C
 0069C41D    cmp         byte ptr [ebx+22D],2
>0069C424    jne         0069C435
 0069C426    fild        dword ptr [ebx+244]
 0069C42C    fstp        qword ptr [esp]
 0069C42F    wait
>0069C430    jmp         0069D70C
 0069C435    cmp         byte ptr [ebx+22E],2
>0069C43C    jne         0069C44D
 0069C43E    fild        dword ptr [ebx+250]
 0069C444    fstp        qword ptr [esp]
 0069C447    wait
>0069C448    jmp         0069D70C
 0069C44D    cmp         byte ptr [ebx+22F],2
>0069C454    jne         0069C465
 0069C456    fild        dword ptr [ebx+25C]
 0069C45C    fstp        qword ptr [esp]
 0069C45F    wait
>0069C460    jmp         0069D70C
 0069C465    xor         eax,eax
 0069C467    mov         dword ptr [esp],eax
 0069C46A    mov         dword ptr [esp+4],eax
>0069C46E    jmp         0069D70C
 0069C473    cmp         byte ptr [ebx+22C],3
>0069C47A    jne         0069C48B
 0069C47C    fild        dword ptr [ebx+238]
 0069C482    fstp        qword ptr [esp]
 0069C485    wait
>0069C486    jmp         0069D70C
 0069C48B    cmp         byte ptr [ebx+22D],3
>0069C492    jne         0069C4A3
 0069C494    fild        dword ptr [ebx+244]
 0069C49A    fstp        qword ptr [esp]
 0069C49D    wait
>0069C49E    jmp         0069D70C
 0069C4A3    cmp         byte ptr [ebx+22E],3
>0069C4AA    jne         0069C4BB
 0069C4AC    fild        dword ptr [ebx+250]
 0069C4B2    fstp        qword ptr [esp]
 0069C4B5    wait
>0069C4B6    jmp         0069D70C
 0069C4BB    cmp         byte ptr [ebx+22F],3
>0069C4C2    jne         0069C4D3
 0069C4C4    fild        dword ptr [ebx+25C]
 0069C4CA    fstp        qword ptr [esp]
 0069C4CD    wait
>0069C4CE    jmp         0069D70C
 0069C4D3    xor         eax,eax
 0069C4D5    mov         dword ptr [esp],eax
 0069C4D8    mov         dword ptr [esp+4],eax
>0069C4DC    jmp         0069D70C
 0069C4E1    cmp         byte ptr [ebx+22C],4
>0069C4E8    jne         0069C4F9
 0069C4EA    fild        dword ptr [ebx+238]
 0069C4F0    fstp        qword ptr [esp]
 0069C4F3    wait
>0069C4F4    jmp         0069D70C
 0069C4F9    cmp         byte ptr [ebx+22D],4
>0069C500    jne         0069C511
 0069C502    fild        dword ptr [ebx+244]
 0069C508    fstp        qword ptr [esp]
 0069C50B    wait
>0069C50C    jmp         0069D70C
 0069C511    cmp         byte ptr [ebx+22E],4
>0069C518    jne         0069C529
 0069C51A    fild        dword ptr [ebx+250]
 0069C520    fstp        qword ptr [esp]
 0069C523    wait
>0069C524    jmp         0069D70C
 0069C529    cmp         byte ptr [ebx+22F],4
>0069C530    jne         0069C541
 0069C532    fild        dword ptr [ebx+25C]
 0069C538    fstp        qword ptr [esp]
 0069C53B    wait
>0069C53C    jmp         0069D70C
 0069C541    xor         eax,eax
 0069C543    mov         dword ptr [esp],eax
 0069C546    mov         dword ptr [esp+4],eax
>0069C54A    jmp         0069D70C
 0069C54F    cmp         byte ptr [ebx+22C],5
>0069C556    jne         0069C567
 0069C558    fild        dword ptr [ebx+238]
 0069C55E    fstp        qword ptr [esp]
 0069C561    wait
>0069C562    jmp         0069D70C
 0069C567    cmp         byte ptr [ebx+22D],5
>0069C56E    jne         0069C57F
 0069C570    fild        dword ptr [ebx+244]
 0069C576    fstp        qword ptr [esp]
 0069C579    wait
>0069C57A    jmp         0069D70C
 0069C57F    cmp         byte ptr [ebx+22E],5
>0069C586    jne         0069C597
 0069C588    fild        dword ptr [ebx+250]
 0069C58E    fstp        qword ptr [esp]
 0069C591    wait
>0069C592    jmp         0069D70C
 0069C597    cmp         byte ptr [ebx+22F],5
>0069C59E    jne         0069C5AF
 0069C5A0    fild        dword ptr [ebx+25C]
 0069C5A6    fstp        qword ptr [esp]
 0069C5A9    wait
>0069C5AA    jmp         0069D70C
 0069C5AF    xor         eax,eax
 0069C5B1    mov         dword ptr [esp],eax
 0069C5B4    mov         dword ptr [esp+4],eax
>0069C5B8    jmp         0069D70C
 0069C5BD    cmp         byte ptr [ebx+22C],6
>0069C5C4    jne         0069C5D5
 0069C5C6    fild        dword ptr [ebx+238]
 0069C5CC    fstp        qword ptr [esp]
 0069C5CF    wait
>0069C5D0    jmp         0069D70C
 0069C5D5    cmp         byte ptr [ebx+22D],6
>0069C5DC    jne         0069C5ED
 0069C5DE    fild        dword ptr [ebx+244]
 0069C5E4    fstp        qword ptr [esp]
 0069C5E7    wait
>0069C5E8    jmp         0069D70C
 0069C5ED    cmp         byte ptr [ebx+22E],6
>0069C5F4    jne         0069C605
 0069C5F6    fild        dword ptr [ebx+250]
 0069C5FC    fstp        qword ptr [esp]
 0069C5FF    wait
>0069C600    jmp         0069D70C
 0069C605    cmp         byte ptr [ebx+22F],6
>0069C60C    jne         0069C61D
 0069C60E    fild        dword ptr [ebx+25C]
 0069C614    fstp        qword ptr [esp]
 0069C617    wait
>0069C618    jmp         0069D70C
 0069C61D    xor         eax,eax
 0069C61F    mov         dword ptr [esp],eax
 0069C622    mov         dword ptr [esp+4],eax
>0069C626    jmp         0069D70C
 0069C62B    cmp         byte ptr [ebx+22C],7
>0069C632    jne         0069C643
 0069C634    fild        dword ptr [ebx+238]
 0069C63A    fstp        qword ptr [esp]
 0069C63D    wait
>0069C63E    jmp         0069D70C
 0069C643    cmp         byte ptr [ebx+22D],7
>0069C64A    jne         0069C65B
 0069C64C    fild        dword ptr [ebx+244]
 0069C652    fstp        qword ptr [esp]
 0069C655    wait
>0069C656    jmp         0069D70C
 0069C65B    cmp         byte ptr [ebx+22E],7
>0069C662    jne         0069C673
 0069C664    fild        dword ptr [ebx+250]
 0069C66A    fstp        qword ptr [esp]
 0069C66D    wait
>0069C66E    jmp         0069D70C
 0069C673    cmp         byte ptr [ebx+22F],7
>0069C67A    jne         0069C68B
 0069C67C    fild        dword ptr [ebx+25C]
 0069C682    fstp        qword ptr [esp]
 0069C685    wait
>0069C686    jmp         0069D70C
 0069C68B    xor         eax,eax
 0069C68D    mov         dword ptr [esp],eax
 0069C690    mov         dword ptr [esp+4],eax
>0069C694    jmp         0069D70C
 0069C699    cmp         byte ptr [ebx+22C],0
>0069C6A0    jne         0069C6B1
 0069C6A2    fild        dword ptr [ebx+230]
 0069C6A8    fstp        qword ptr [esp]
 0069C6AB    wait
>0069C6AC    jmp         0069D70C
 0069C6B1    cmp         byte ptr [ebx+22D],0
>0069C6B8    jne         0069C6C9
 0069C6BA    fild        dword ptr [ebx+23C]
 0069C6C0    fstp        qword ptr [esp]
 0069C6C3    wait
>0069C6C4    jmp         0069D70C
 0069C6C9    cmp         byte ptr [ebx+22E],0
>0069C6D0    jne         0069C6E1
 0069C6D2    fild        dword ptr [ebx+248]
 0069C6D8    fstp        qword ptr [esp]
 0069C6DB    wait
>0069C6DC    jmp         0069D70C
 0069C6E1    cmp         byte ptr [ebx+22F],0
>0069C6E8    jne         0069C6F9
 0069C6EA    fild        dword ptr [ebx+254]
 0069C6F0    fstp        qword ptr [esp]
 0069C6F3    wait
>0069C6F4    jmp         0069D70C
 0069C6F9    xor         eax,eax
 0069C6FB    mov         dword ptr [esp],eax
 0069C6FE    mov         dword ptr [esp+4],eax
>0069C702    jmp         0069D70C
 0069C707    cmp         byte ptr [ebx+22C],1
>0069C70E    jne         0069C71F
 0069C710    fild        dword ptr [ebx+230]
 0069C716    fstp        qword ptr [esp]
 0069C719    wait
>0069C71A    jmp         0069D70C
 0069C71F    cmp         byte ptr [ebx+22D],1
>0069C726    jne         0069C737
 0069C728    fild        dword ptr [ebx+23C]
 0069C72E    fstp        qword ptr [esp]
 0069C731    wait
>0069C732    jmp         0069D70C
 0069C737    cmp         byte ptr [ebx+22E],1
>0069C73E    jne         0069C74F
 0069C740    fild        dword ptr [ebx+248]
 0069C746    fstp        qword ptr [esp]
 0069C749    wait
>0069C74A    jmp         0069D70C
 0069C74F    cmp         byte ptr [ebx+22F],1
>0069C756    jne         0069C767
 0069C758    fild        dword ptr [ebx+254]
 0069C75E    fstp        qword ptr [esp]
 0069C761    wait
>0069C762    jmp         0069D70C
 0069C767    xor         eax,eax
 0069C769    mov         dword ptr [esp],eax
 0069C76C    mov         dword ptr [esp+4],eax
>0069C770    jmp         0069D70C
 0069C775    cmp         byte ptr [ebx+22C],2
>0069C77C    jne         0069C78D
 0069C77E    fild        dword ptr [ebx+230]
 0069C784    fstp        qword ptr [esp]
 0069C787    wait
>0069C788    jmp         0069D70C
 0069C78D    cmp         byte ptr [ebx+22D],2
>0069C794    jne         0069C7A5
 0069C796    fild        dword ptr [ebx+23C]
 0069C79C    fstp        qword ptr [esp]
 0069C79F    wait
>0069C7A0    jmp         0069D70C
 0069C7A5    cmp         byte ptr [ebx+22E],2
>0069C7AC    jne         0069C7BD
 0069C7AE    fild        dword ptr [ebx+248]
 0069C7B4    fstp        qword ptr [esp]
 0069C7B7    wait
>0069C7B8    jmp         0069D70C
 0069C7BD    cmp         byte ptr [ebx+22F],2
>0069C7C4    jne         0069C7D5
 0069C7C6    fild        dword ptr [ebx+254]
 0069C7CC    fstp        qword ptr [esp]
 0069C7CF    wait
>0069C7D0    jmp         0069D70C
 0069C7D5    xor         eax,eax
 0069C7D7    mov         dword ptr [esp],eax
 0069C7DA    mov         dword ptr [esp+4],eax
>0069C7DE    jmp         0069D70C
 0069C7E3    cmp         byte ptr [ebx+22C],3
>0069C7EA    jne         0069C7FB
 0069C7EC    fild        dword ptr [ebx+230]
 0069C7F2    fstp        qword ptr [esp]
 0069C7F5    wait
>0069C7F6    jmp         0069D70C
 0069C7FB    cmp         byte ptr [ebx+22D],3
>0069C802    jne         0069C813
 0069C804    fild        dword ptr [ebx+23C]
 0069C80A    fstp        qword ptr [esp]
 0069C80D    wait
>0069C80E    jmp         0069D70C
 0069C813    cmp         byte ptr [ebx+22E],3
>0069C81A    jne         0069C82B
 0069C81C    fild        dword ptr [ebx+248]
 0069C822    fstp        qword ptr [esp]
 0069C825    wait
>0069C826    jmp         0069D70C
 0069C82B    cmp         byte ptr [ebx+22F],3
>0069C832    jne         0069C843
 0069C834    fild        dword ptr [ebx+254]
 0069C83A    fstp        qword ptr [esp]
 0069C83D    wait
>0069C83E    jmp         0069D70C
 0069C843    xor         eax,eax
 0069C845    mov         dword ptr [esp],eax
 0069C848    mov         dword ptr [esp+4],eax
>0069C84C    jmp         0069D70C
 0069C851    cmp         byte ptr [ebx+22C],4
>0069C858    jne         0069C869
 0069C85A    fild        dword ptr [ebx+230]
 0069C860    fstp        qword ptr [esp]
 0069C863    wait
>0069C864    jmp         0069D70C
 0069C869    cmp         byte ptr [ebx+22D],4
>0069C870    jne         0069C881
 0069C872    fild        dword ptr [ebx+23C]
 0069C878    fstp        qword ptr [esp]
 0069C87B    wait
>0069C87C    jmp         0069D70C
 0069C881    cmp         byte ptr [ebx+22E],4
>0069C888    jne         0069C899
 0069C88A    fild        dword ptr [ebx+248]
 0069C890    fstp        qword ptr [esp]
 0069C893    wait
>0069C894    jmp         0069D70C
 0069C899    cmp         byte ptr [ebx+22F],4
>0069C8A0    jne         0069C8B1
 0069C8A2    fild        dword ptr [ebx+254]
 0069C8A8    fstp        qword ptr [esp]
 0069C8AB    wait
>0069C8AC    jmp         0069D70C
 0069C8B1    xor         eax,eax
 0069C8B3    mov         dword ptr [esp],eax
 0069C8B6    mov         dword ptr [esp+4],eax
>0069C8BA    jmp         0069D70C
 0069C8BF    cmp         byte ptr [ebx+22C],5
>0069C8C6    jne         0069C8D7
 0069C8C8    fild        dword ptr [ebx+230]
 0069C8CE    fstp        qword ptr [esp]
 0069C8D1    wait
>0069C8D2    jmp         0069D70C
 0069C8D7    cmp         byte ptr [ebx+22D],5
>0069C8DE    jne         0069C8EF
 0069C8E0    fild        dword ptr [ebx+23C]
 0069C8E6    fstp        qword ptr [esp]
 0069C8E9    wait
>0069C8EA    jmp         0069D70C
 0069C8EF    cmp         byte ptr [ebx+22E],5
>0069C8F6    jne         0069C907
 0069C8F8    fild        dword ptr [ebx+248]
 0069C8FE    fstp        qword ptr [esp]
 0069C901    wait
>0069C902    jmp         0069D70C
 0069C907    cmp         byte ptr [ebx+22F],5
>0069C90E    jne         0069C91F
 0069C910    fild        dword ptr [ebx+254]
 0069C916    fstp        qword ptr [esp]
 0069C919    wait
>0069C91A    jmp         0069D70C
 0069C91F    xor         eax,eax
 0069C921    mov         dword ptr [esp],eax
 0069C924    mov         dword ptr [esp+4],eax
>0069C928    jmp         0069D70C
 0069C92D    cmp         byte ptr [ebx+22C],6
>0069C934    jne         0069C945
 0069C936    fild        dword ptr [ebx+230]
 0069C93C    fstp        qword ptr [esp]
 0069C93F    wait
>0069C940    jmp         0069D70C
 0069C945    cmp         byte ptr [ebx+22D],6
>0069C94C    jne         0069C95D
 0069C94E    fild        dword ptr [ebx+23C]
 0069C954    fstp        qword ptr [esp]
 0069C957    wait
>0069C958    jmp         0069D70C
 0069C95D    cmp         byte ptr [ebx+22E],6
>0069C964    jne         0069C975
 0069C966    fild        dword ptr [ebx+248]
 0069C96C    fstp        qword ptr [esp]
 0069C96F    wait
>0069C970    jmp         0069D70C
 0069C975    cmp         byte ptr [ebx+22F],6
>0069C97C    jne         0069C98D
 0069C97E    fild        dword ptr [ebx+254]
 0069C984    fstp        qword ptr [esp]
 0069C987    wait
>0069C988    jmp         0069D70C
 0069C98D    xor         eax,eax
 0069C98F    mov         dword ptr [esp],eax
 0069C992    mov         dword ptr [esp+4],eax
>0069C996    jmp         0069D70C
 0069C99B    cmp         byte ptr [ebx+22C],7
>0069C9A2    jne         0069C9B3
 0069C9A4    fild        dword ptr [ebx+230]
 0069C9AA    fstp        qword ptr [esp]
 0069C9AD    wait
>0069C9AE    jmp         0069D70C
 0069C9B3    cmp         byte ptr [ebx+22D],7
>0069C9BA    jne         0069C9CB
 0069C9BC    fild        dword ptr [ebx+23C]
 0069C9C2    fstp        qword ptr [esp]
 0069C9C5    wait
>0069C9C6    jmp         0069D70C
 0069C9CB    cmp         byte ptr [ebx+22E],7
>0069C9D2    jne         0069C9E3
 0069C9D4    fild        dword ptr [ebx+248]
 0069C9DA    fstp        qword ptr [esp]
 0069C9DD    wait
>0069C9DE    jmp         0069D70C
 0069C9E3    cmp         byte ptr [ebx+22F],7
>0069C9EA    jne         0069C9FB
 0069C9EC    fild        dword ptr [ebx+254]
 0069C9F2    fstp        qword ptr [esp]
 0069C9F5    wait
>0069C9F6    jmp         0069D70C
 0069C9FB    xor         eax,eax
 0069C9FD    mov         dword ptr [esp],eax
 0069CA00    mov         dword ptr [esp+4],eax
>0069CA04    jmp         0069D70C
 0069CA09    cmp         byte ptr [ebx+22C],0
>0069CA10    jne         0069CA21
 0069CA12    fild        dword ptr [ebx+234]
 0069CA18    fstp        qword ptr [esp]
 0069CA1B    wait
>0069CA1C    jmp         0069D70C
 0069CA21    cmp         byte ptr [ebx+22D],0
>0069CA28    jne         0069CA39
 0069CA2A    fild        dword ptr [ebx+240]
 0069CA30    fstp        qword ptr [esp]
 0069CA33    wait
>0069CA34    jmp         0069D70C
 0069CA39    cmp         byte ptr [ebx+22E],0
>0069CA40    jne         0069CA51
 0069CA42    fild        dword ptr [ebx+24C]
 0069CA48    fstp        qword ptr [esp]
 0069CA4B    wait
>0069CA4C    jmp         0069D70C
 0069CA51    cmp         byte ptr [ebx+22F],0
>0069CA58    jne         0069CA69
 0069CA5A    fild        dword ptr [ebx+258]
 0069CA60    fstp        qword ptr [esp]
 0069CA63    wait
>0069CA64    jmp         0069D70C
 0069CA69    xor         eax,eax
 0069CA6B    mov         dword ptr [esp],eax
 0069CA6E    mov         dword ptr [esp+4],eax
>0069CA72    jmp         0069D70C
 0069CA77    cmp         byte ptr [ebx+22C],1
>0069CA7E    jne         0069CA8F
 0069CA80    fild        dword ptr [ebx+234]
 0069CA86    fstp        qword ptr [esp]
 0069CA89    wait
>0069CA8A    jmp         0069D70C
 0069CA8F    cmp         byte ptr [ebx+22D],1
>0069CA96    jne         0069CAA7
 0069CA98    fild        dword ptr [ebx+240]
 0069CA9E    fstp        qword ptr [esp]
 0069CAA1    wait
>0069CAA2    jmp         0069D70C
 0069CAA7    cmp         byte ptr [ebx+22E],1
>0069CAAE    jne         0069CABF
 0069CAB0    fild        dword ptr [ebx+24C]
 0069CAB6    fstp        qword ptr [esp]
 0069CAB9    wait
>0069CABA    jmp         0069D70C
 0069CABF    cmp         byte ptr [ebx+22F],1
>0069CAC6    jne         0069CAD7
 0069CAC8    fild        dword ptr [ebx+258]
 0069CACE    fstp        qword ptr [esp]
 0069CAD1    wait
>0069CAD2    jmp         0069D70C
 0069CAD7    xor         eax,eax
 0069CAD9    mov         dword ptr [esp],eax
 0069CADC    mov         dword ptr [esp+4],eax
>0069CAE0    jmp         0069D70C
 0069CAE5    cmp         byte ptr [ebx+22C],2
>0069CAEC    jne         0069CAFD
 0069CAEE    fild        dword ptr [ebx+234]
 0069CAF4    fstp        qword ptr [esp]
 0069CAF7    wait
>0069CAF8    jmp         0069D70C
 0069CAFD    cmp         byte ptr [ebx+22D],2
>0069CB04    jne         0069CB15
 0069CB06    fild        dword ptr [ebx+240]
 0069CB0C    fstp        qword ptr [esp]
 0069CB0F    wait
>0069CB10    jmp         0069D70C
 0069CB15    cmp         byte ptr [ebx+22E],2
>0069CB1C    jne         0069CB2D
 0069CB1E    fild        dword ptr [ebx+24C]
 0069CB24    fstp        qword ptr [esp]
 0069CB27    wait
>0069CB28    jmp         0069D70C
 0069CB2D    cmp         byte ptr [ebx+22F],2
>0069CB34    jne         0069CB45
 0069CB36    fild        dword ptr [ebx+258]
 0069CB3C    fstp        qword ptr [esp]
 0069CB3F    wait
>0069CB40    jmp         0069D70C
 0069CB45    xor         eax,eax
 0069CB47    mov         dword ptr [esp],eax
 0069CB4A    mov         dword ptr [esp+4],eax
>0069CB4E    jmp         0069D70C
 0069CB53    cmp         byte ptr [ebx+22C],3
>0069CB5A    jne         0069CB6B
 0069CB5C    fild        dword ptr [ebx+234]
 0069CB62    fstp        qword ptr [esp]
 0069CB65    wait
>0069CB66    jmp         0069D70C
 0069CB6B    cmp         byte ptr [ebx+22D],3
>0069CB72    jne         0069CB83
 0069CB74    fild        dword ptr [ebx+240]
 0069CB7A    fstp        qword ptr [esp]
 0069CB7D    wait
>0069CB7E    jmp         0069D70C
 0069CB83    cmp         byte ptr [ebx+22E],3
>0069CB8A    jne         0069CB9B
 0069CB8C    fild        dword ptr [ebx+24C]
 0069CB92    fstp        qword ptr [esp]
 0069CB95    wait
>0069CB96    jmp         0069D70C
 0069CB9B    cmp         byte ptr [ebx+22F],3
>0069CBA2    jne         0069CBB3
 0069CBA4    fild        dword ptr [ebx+258]
 0069CBAA    fstp        qword ptr [esp]
 0069CBAD    wait
>0069CBAE    jmp         0069D70C
 0069CBB3    xor         eax,eax
 0069CBB5    mov         dword ptr [esp],eax
 0069CBB8    mov         dword ptr [esp+4],eax
>0069CBBC    jmp         0069D70C
 0069CBC1    cmp         byte ptr [ebx+22C],4
>0069CBC8    jne         0069CBD9
 0069CBCA    fild        dword ptr [ebx+234]
 0069CBD0    fstp        qword ptr [esp]
 0069CBD3    wait
>0069CBD4    jmp         0069D70C
 0069CBD9    cmp         byte ptr [ebx+22D],4
>0069CBE0    jne         0069CBF1
 0069CBE2    fild        dword ptr [ebx+240]
 0069CBE8    fstp        qword ptr [esp]
 0069CBEB    wait
>0069CBEC    jmp         0069D70C
 0069CBF1    cmp         byte ptr [ebx+22E],4
>0069CBF8    jne         0069CC09
 0069CBFA    fild        dword ptr [ebx+24C]
 0069CC00    fstp        qword ptr [esp]
 0069CC03    wait
>0069CC04    jmp         0069D70C
 0069CC09    cmp         byte ptr [ebx+22F],4
>0069CC10    jne         0069CC21
 0069CC12    fild        dword ptr [ebx+258]
 0069CC18    fstp        qword ptr [esp]
 0069CC1B    wait
>0069CC1C    jmp         0069D70C
 0069CC21    xor         eax,eax
 0069CC23    mov         dword ptr [esp],eax
 0069CC26    mov         dword ptr [esp+4],eax
>0069CC2A    jmp         0069D70C
 0069CC2F    cmp         byte ptr [ebx+22C],5
>0069CC36    jne         0069CC47
 0069CC38    fild        dword ptr [ebx+234]
 0069CC3E    fstp        qword ptr [esp]
 0069CC41    wait
>0069CC42    jmp         0069D70C
 0069CC47    cmp         byte ptr [ebx+22D],5
>0069CC4E    jne         0069CC5F
 0069CC50    fild        dword ptr [ebx+240]
 0069CC56    fstp        qword ptr [esp]
 0069CC59    wait
>0069CC5A    jmp         0069D70C
 0069CC5F    cmp         byte ptr [ebx+22E],5
>0069CC66    jne         0069CC77
 0069CC68    fild        dword ptr [ebx+24C]
 0069CC6E    fstp        qword ptr [esp]
 0069CC71    wait
>0069CC72    jmp         0069D70C
 0069CC77    cmp         byte ptr [ebx+22F],5
>0069CC7E    jne         0069CC8F
 0069CC80    fild        dword ptr [ebx+258]
 0069CC86    fstp        qword ptr [esp]
 0069CC89    wait
>0069CC8A    jmp         0069D70C
 0069CC8F    xor         eax,eax
 0069CC91    mov         dword ptr [esp],eax
 0069CC94    mov         dword ptr [esp+4],eax
>0069CC98    jmp         0069D70C
 0069CC9D    cmp         byte ptr [ebx+22C],6
>0069CCA4    jne         0069CCB5
 0069CCA6    fild        dword ptr [ebx+234]
 0069CCAC    fstp        qword ptr [esp]
 0069CCAF    wait
>0069CCB0    jmp         0069D70C
 0069CCB5    cmp         byte ptr [ebx+22D],6
>0069CCBC    jne         0069CCCD
 0069CCBE    fild        dword ptr [ebx+240]
 0069CCC4    fstp        qword ptr [esp]
 0069CCC7    wait
>0069CCC8    jmp         0069D70C
 0069CCCD    cmp         byte ptr [ebx+22E],6
>0069CCD4    jne         0069CCE5
 0069CCD6    fild        dword ptr [ebx+24C]
 0069CCDC    fstp        qword ptr [esp]
 0069CCDF    wait
>0069CCE0    jmp         0069D70C
 0069CCE5    cmp         byte ptr [ebx+22F],6
>0069CCEC    jne         0069CCFD
 0069CCEE    fild        dword ptr [ebx+258]
 0069CCF4    fstp        qword ptr [esp]
 0069CCF7    wait
>0069CCF8    jmp         0069D70C
 0069CCFD    xor         eax,eax
 0069CCFF    mov         dword ptr [esp],eax
 0069CD02    mov         dword ptr [esp+4],eax
>0069CD06    jmp         0069D70C
 0069CD0B    cmp         byte ptr [ebx+22C],7
>0069CD12    jne         0069CD23
 0069CD14    fild        dword ptr [ebx+234]
 0069CD1A    fstp        qword ptr [esp]
 0069CD1D    wait
>0069CD1E    jmp         0069D70C
 0069CD23    cmp         byte ptr [ebx+22D],7
>0069CD2A    jne         0069CD3B
 0069CD2C    fild        dword ptr [ebx+240]
 0069CD32    fstp        qword ptr [esp]
 0069CD35    wait
>0069CD36    jmp         0069D70C
 0069CD3B    cmp         byte ptr [ebx+22E],7
>0069CD42    jne         0069CD53
 0069CD44    fild        dword ptr [ebx+24C]
 0069CD4A    fstp        qword ptr [esp]
 0069CD4D    wait
>0069CD4E    jmp         0069D70C
 0069CD53    cmp         byte ptr [ebx+22F],7
>0069CD5A    jne         0069CD6B
 0069CD5C    fild        dword ptr [ebx+258]
 0069CD62    fstp        qword ptr [esp]
 0069CD65    wait
>0069CD66    jmp         0069D70C
 0069CD6B    xor         eax,eax
 0069CD6D    mov         dword ptr [esp],eax
 0069CD70    mov         dword ptr [esp+4],eax
>0069CD74    jmp         0069D70C
 0069CD79    mov         al,1
 0069CD7B    call        00686074
 0069CD80    fstp        qword ptr [esp]
 0069CD83    wait
>0069CD84    jmp         0069D70C
 0069CD89    mov         ax,133F
 0069CD8D    call        Set8087CW
 0069CD92    mov         eax,dword ptr [esi+18];TGloveValue.........................................................
 0069CD95    push        eax
 0069CD96    call        P5DLL.P5_GetMouseState
 0069CD9B    cmp         eax,1
 0069CD9E    sbb         eax,eax
 0069CDA0    inc         eax
 0069CDA1    call        00686074
 0069CDA6    fstp        qword ptr [esp]
 0069CDA9    wait
>0069CDAA    jmp         0069D70C
 0069CDAF    mov         eax,dword ptr [esi+18];TGloveValue.........................................................
 0069CDB2    cmp         eax,dword ptr ds:[81ED78];gvar_0081ED78:Single
>0069CDB8    jl          0069CDCA
 0069CDBA    xor         eax,eax
 0069CDBC    call        00686074
 0069CDC1    fstp        qword ptr [esp]
 0069CDC4    wait
>0069CDC5    jmp         0069D70C
 0069CDCA    mov         edx,dword ptr ds:[81ED7C];gvar_0081ED7C:?
 0069CDD0    movzx       eax,byte ptr [edx+eax]
 0069CDD4    call        00686074
 0069CDD9    fstp        qword ptr [esp]
 0069CDDC    wait
>0069CDDD    jmp         0069D70C
 0069CDE2    sub         edi,1F4
 0069CDE8    lea         edx,[esp+8]
 0069CDEC    mov         eax,edi
 0069CDEE    call        005C37C4
 0069CDF3    fld         dword ptr [ebx+90]
 0069CDF9    fstp        qword ptr [esp+20]
 0069CDFD    wait
 0069CDFE    fld         dword ptr [ebx+94]
 0069CE04    fstp        qword ptr [esp+28]
 0069CE08    wait
 0069CE09    fld         dword ptr [ebx+98]
 0069CE0F    fstp        qword ptr [esp+30]
 0069CE13    wait
 0069CE14    cmp         edi,1B
>0069CE17    jne         0069CE33
 0069CE19    lea         eax,[esp+20]
 0069CE1D    call        005C390C
 0069CE22    mov         dword ptr [esp+38],eax
 0069CE26    fild        dword ptr [esp+38]
 0069CE2A    fstp        qword ptr [esp]
 0069CE2D    wait
>0069CE2E    jmp         0069D70C
 0069CE33    lea         edx,[esp+8]
 0069CE37    lea         eax,[esp+20]
 0069CE3B    call        005C3880
 0069CE40    fcomp       dword ptr ds:[69D724];22.5:Single
 0069CE46    wait
 0069CE47    fnstsw      al
 0069CE49    sahf
 0069CE4A    setb        al
 0069CE4D    call        00686074
 0069CE52    fstp        qword ptr [esp]
 0069CE55    wait
>0069CE56    jmp         0069D70C
 0069CE5B    sub         edi,212
 0069CE61    lea         edx,[esp+8]
 0069CE65    mov         eax,edi
 0069CE67    call        005C37C4
 0069CE6C    fld         dword ptr [ebx+84]
 0069CE72    fchs
 0069CE74    fstp        qword ptr [esp+20]
 0069CE78    wait
 0069CE79    fld         dword ptr [ebx+88]
 0069CE7F    fchs
 0069CE81    fstp        qword ptr [esp+28]
 0069CE85    wait
 0069CE86    fld         dword ptr [ebx+8C]
 0069CE8C    fchs
 0069CE8E    fstp        qword ptr [esp+30]
 0069CE92    wait
 0069CE93    cmp         edi,1B
>0069CE96    jne         0069CEB2
 0069CE98    lea         eax,[esp+20]
 0069CE9C    call        005C390C
 0069CEA1    mov         dword ptr [esp+38],eax
 0069CEA5    fild        dword ptr [esp+38]
 0069CEA9    fstp        qword ptr [esp]
 0069CEAC    wait
>0069CEAD    jmp         0069D70C
 0069CEB2    lea         edx,[esp+8]
 0069CEB6    lea         eax,[esp+20]
 0069CEBA    call        005C3880
 0069CEBF    fcomp       dword ptr ds:[69D724];22.5:Single
 0069CEC5    wait
 0069CEC6    fnstsw      al
 0069CEC8    sahf
 0069CEC9    setb        al
 0069CECC    call        00686074
 0069CED1    fstp        qword ptr [esp]
 0069CED4    wait
>0069CED5    jmp         0069D70C
 0069CEDA    sub         edi,230
 0069CEE0    lea         edx,[esp+8]
 0069CEE4    mov         eax,edi
 0069CEE6    call        005C37C4
 0069CEEB    mov         eax,[0081ED7C];gvar_0081ED7C:?
 0069CEF0    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069CEF3    cmp         byte ptr [eax+edx],0
>0069CEF7    je          0069CF16
 0069CEF9    fld         dword ptr [ebx+78]
 0069CEFC    fstp        qword ptr [esp+20]
 0069CF00    wait
 0069CF01    fld         dword ptr [ebx+7C]
 0069CF04    fstp        qword ptr [esp+28]
 0069CF08    wait
 0069CF09    fld         dword ptr [ebx+80]
 0069CF0F    fstp        qword ptr [esp+30]
 0069CF13    wait
>0069CF14    jmp         0069CF37
 0069CF16    fld         dword ptr [ebx+78]
 0069CF19    fchs
 0069CF1B    fstp        qword ptr [esp+20]
 0069CF1F    wait
 0069CF20    fld         dword ptr [ebx+7C]
 0069CF23    fchs
 0069CF25    fstp        qword ptr [esp+28]
 0069CF29    wait
 0069CF2A    fld         dword ptr [ebx+80]
 0069CF30    fchs
 0069CF32    fstp        qword ptr [esp+30]
 0069CF36    wait
 0069CF37    cmp         edi,1B
>0069CF3A    jne         0069CF56
 0069CF3C    lea         eax,[esp+20]
 0069CF40    call        005C390C
 0069CF45    mov         dword ptr [esp+38],eax
 0069CF49    fild        dword ptr [esp+38]
 0069CF4D    fstp        qword ptr [esp]
 0069CF50    wait
>0069CF51    jmp         0069D70C
 0069CF56    lea         edx,[esp+8]
 0069CF5A    lea         eax,[esp+20]
 0069CF5E    call        005C3880
 0069CF63    fcomp       dword ptr ds:[69D724];22.5:Single
 0069CF69    wait
 0069CF6A    fnstsw      al
 0069CF6C    sahf
 0069CF6D    setb        al
 0069CF70    call        00686074
 0069CF75    fstp        qword ptr [esp]
 0069CF78    wait
>0069CF79    jmp         0069D70C
 0069CF7E    sub         edi,258
 0069CF84    lea         edx,[esp+8]
 0069CF88    mov         eax,edi
 0069CF8A    call        005C37C4
 0069CF8F    fld         dword ptr [ebx+90]
 0069CF95    fstp        qword ptr [esp+20]
 0069CF99    wait
 0069CF9A    fld         dword ptr [ebx+94]
 0069CFA0    fstp        qword ptr [esp+28]
 0069CFA4    wait
 0069CFA5    fld         dword ptr [ebx+98]
 0069CFAB    fstp        qword ptr [esp+30]
 0069CFAF    wait
 0069CFB0    cmp         edi,0D
>0069CFB3    jne         0069CFCF
 0069CFB5    lea         eax,[esp+20]
 0069CFB9    call        005C390C
 0069CFBE    mov         dword ptr [esp+38],eax
 0069CFC2    fild        dword ptr [esp+38]
 0069CFC6    fstp        qword ptr [esp]
 0069CFC9    wait
>0069CFCA    jmp         0069D70C
 0069CFCF    lea         edx,[esp+8]
 0069CFD3    lea         eax,[esp+20]
 0069CFD7    call        005C3880
 0069CFDC    fcomp       dword ptr ds:[69D728];90:Single
 0069CFE2    wait
 0069CFE3    fnstsw      al
 0069CFE5    sahf
 0069CFE6    setb        al
 0069CFE9    call        00686074
 0069CFEE    fstp        qword ptr [esp]
 0069CFF1    wait
>0069CFF2    jmp         0069D70C
 0069CFF7    sub         edi,276
 0069CFFD    lea         edx,[esp+8]
 0069D001    mov         eax,edi
 0069D003    call        005C37C4
 0069D008    fld         dword ptr [ebx+84]
 0069D00E    fchs
 0069D010    fstp        qword ptr [esp+20]
 0069D014    wait
 0069D015    fld         dword ptr [ebx+88]
 0069D01B    fchs
 0069D01D    fstp        qword ptr [esp+28]
 0069D021    wait
 0069D022    fld         dword ptr [ebx+8C]
 0069D028    fchs
 0069D02A    fstp        qword ptr [esp+30]
 0069D02E    wait
 0069D02F    cmp         edi,0D
>0069D032    jne         0069D04E
 0069D034    lea         eax,[esp+20]
 0069D038    call        005C390C
 0069D03D    mov         dword ptr [esp+38],eax
 0069D041    fild        dword ptr [esp+38]
 0069D045    fstp        qword ptr [esp]
 0069D048    wait
>0069D049    jmp         0069D70C
 0069D04E    lea         edx,[esp+8]
 0069D052    lea         eax,[esp+20]
 0069D056    call        005C3880
 0069D05B    fcomp       dword ptr ds:[69D728];90:Single
 0069D061    wait
 0069D062    fnstsw      al
 0069D064    sahf
 0069D065    setb        al
 0069D068    call        00686074
 0069D06D    fstp        qword ptr [esp]
 0069D070    wait
>0069D071    jmp         0069D70C
 0069D076    sub         edi,294
 0069D07C    lea         edx,[esp+8]
 0069D080    mov         eax,edi
 0069D082    call        005C37C4
 0069D087    mov         eax,[0081ED7C];gvar_0081ED7C:?
 0069D08C    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069D08F    cmp         byte ptr [eax+edx],0
>0069D093    je          0069D0B2
 0069D095    fld         dword ptr [ebx+78]
 0069D098    fstp        qword ptr [esp+20]
 0069D09C    wait
 0069D09D    fld         dword ptr [ebx+7C]
 0069D0A0    fstp        qword ptr [esp+28]
 0069D0A4    wait
 0069D0A5    fld         dword ptr [ebx+80]
 0069D0AB    fstp        qword ptr [esp+30]
 0069D0AF    wait
>0069D0B0    jmp         0069D0D3
 0069D0B2    fld         dword ptr [ebx+78]
 0069D0B5    fchs
 0069D0B7    fstp        qword ptr [esp+20]
 0069D0BB    wait
 0069D0BC    fld         dword ptr [ebx+7C]
 0069D0BF    fchs
 0069D0C1    fstp        qword ptr [esp+28]
 0069D0C5    wait
 0069D0C6    fld         dword ptr [ebx+80]
 0069D0CC    fchs
 0069D0CE    fstp        qword ptr [esp+30]
 0069D0D2    wait
 0069D0D3    cmp         edi,0D
>0069D0D6    jne         0069D0F2
 0069D0D8    lea         eax,[esp+20]
 0069D0DC    call        005C390C
 0069D0E1    mov         dword ptr [esp+38],eax
 0069D0E5    fild        dword ptr [esp+38]
 0069D0E9    fstp        qword ptr [esp]
 0069D0EC    wait
>0069D0ED    jmp         0069D70C
 0069D0F2    lea         edx,[esp+8]
 0069D0F6    lea         eax,[esp+20]
 0069D0FA    call        005C3880
 0069D0FF    fcomp       dword ptr ds:[69D728];90:Single
 0069D105    wait
 0069D106    fnstsw      al
 0069D108    sahf
 0069D109    setb        al
 0069D10C    call        00686074
 0069D111    fstp        qword ptr [esp]
 0069D114    wait
>0069D115    jmp         0069D70C
 0069D11A    sub         edi,190
 0069D120    lea         edx,[esp+8]
 0069D124    mov         eax,edi
 0069D126    call        005C37C4
 0069D12B    fld         dword ptr [ebx+90]
 0069D131    fstp        qword ptr [esp+20]
 0069D135    wait
 0069D136    fld         dword ptr [ebx+94]
 0069D13C    fstp        qword ptr [esp+28]
 0069D140    wait
 0069D141    fld         dword ptr [ebx+98]
 0069D147    fstp        qword ptr [esp+30]
 0069D14B    wait
 0069D14C    cmp         edi,0D
>0069D14F    jne         0069D16B
 0069D151    lea         eax,[esp+20]
 0069D155    call        005C390C
 0069D15A    mov         dword ptr [esp+38],eax
 0069D15E    fild        dword ptr [esp+38]
 0069D162    fstp        qword ptr [esp]
 0069D165    wait
>0069D166    jmp         0069D70C
 0069D16B    lea         edx,[esp+8]
 0069D16F    lea         eax,[esp+20]
 0069D173    call        005C3880
 0069D178    fcomp       dword ptr ds:[69D72C];45:Single
 0069D17E    wait
 0069D17F    fnstsw      al
 0069D181    sahf
 0069D182    setb        al
 0069D185    call        00686074
 0069D18A    fstp        qword ptr [esp]
 0069D18D    wait
>0069D18E    jmp         0069D70C
 0069D193    sub         edi,1AE
 0069D199    lea         edx,[esp+8]
 0069D19D    mov         eax,edi
 0069D19F    call        005C37C4
 0069D1A4    fld         dword ptr [ebx+84]
 0069D1AA    fchs
 0069D1AC    fstp        qword ptr [esp+20]
 0069D1B0    wait
 0069D1B1    fld         dword ptr [ebx+88]
 0069D1B7    fchs
 0069D1B9    fstp        qword ptr [esp+28]
 0069D1BD    wait
 0069D1BE    fld         dword ptr [ebx+8C]
 0069D1C4    fchs
 0069D1C6    fstp        qword ptr [esp+30]
 0069D1CA    wait
 0069D1CB    cmp         edi,0D
>0069D1CE    jne         0069D1EA
 0069D1D0    lea         eax,[esp+20]
 0069D1D4    call        005C390C
 0069D1D9    mov         dword ptr [esp+38],eax
 0069D1DD    fild        dword ptr [esp+38]
 0069D1E1    fstp        qword ptr [esp]
 0069D1E4    wait
>0069D1E5    jmp         0069D70C
 0069D1EA    lea         edx,[esp+8]
 0069D1EE    lea         eax,[esp+20]
 0069D1F2    call        005C3880
 0069D1F7    fcomp       dword ptr ds:[69D72C];45:Single
 0069D1FD    wait
 0069D1FE    fnstsw      al
 0069D200    sahf
 0069D201    setb        al
 0069D204    call        00686074
 0069D209    fstp        qword ptr [esp]
 0069D20C    wait
>0069D20D    jmp         0069D70C
 0069D212    sub         edi,1CC
 0069D218    lea         edx,[esp+8]
 0069D21C    mov         eax,edi
 0069D21E    call        005C37C4
 0069D223    mov         eax,[0081ED7C];gvar_0081ED7C:?
 0069D228    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069D22B    cmp         byte ptr [eax+edx],0
>0069D22F    je          0069D24E
 0069D231    fld         dword ptr [ebx+78]
 0069D234    fstp        qword ptr [esp+20]
 0069D238    wait
 0069D239    fld         dword ptr [ebx+7C]
 0069D23C    fstp        qword ptr [esp+28]
 0069D240    wait
 0069D241    fld         dword ptr [ebx+80]
 0069D247    fstp        qword ptr [esp+30]
 0069D24B    wait
>0069D24C    jmp         0069D26F
 0069D24E    fld         dword ptr [ebx+78]
 0069D251    fchs
 0069D253    fstp        qword ptr [esp+20]
 0069D257    wait
 0069D258    fld         dword ptr [ebx+7C]
 0069D25B    fchs
 0069D25D    fstp        qword ptr [esp+28]
 0069D261    wait
 0069D262    fld         dword ptr [ebx+80]
 0069D268    fchs
 0069D26A    fstp        qword ptr [esp+30]
 0069D26E    wait
 0069D26F    cmp         edi,0D
>0069D272    jne         0069D28E
 0069D274    lea         eax,[esp+20]
 0069D278    call        005C390C
 0069D27D    mov         dword ptr [esp+38],eax
 0069D281    fild        dword ptr [esp+38]
 0069D285    fstp        qword ptr [esp]
 0069D288    wait
>0069D289    jmp         0069D70C
 0069D28E    lea         edx,[esp+8]
 0069D292    lea         eax,[esp+20]
 0069D296    call        005C3880
 0069D29B    fcomp       dword ptr ds:[69D72C];45:Single
 0069D2A1    wait
 0069D2A2    fnstsw      al
 0069D2A4    sahf
 0069D2A5    setb        al
 0069D2A8    call        00686074
 0069D2AD    fstp        qword ptr [esp]
 0069D2B0    wait
>0069D2B1    jmp         0069D70C
 0069D2B6    sub         edi,12C
 0069D2BC    lea         edx,[esp+8]
 0069D2C0    mov         eax,edi
 0069D2C2    call        005C37C4
 0069D2C7    fld         dword ptr [ebx+90]
 0069D2CD    fstp        qword ptr [esp+20]
 0069D2D1    wait
 0069D2D2    fld         dword ptr [ebx+94]
 0069D2D8    fstp        qword ptr [esp+28]
 0069D2DC    wait
 0069D2DD    fld         dword ptr [ebx+98]
 0069D2E3    fstp        qword ptr [esp+30]
 0069D2E7    wait
 0069D2E8    cmp         edi,0D
>0069D2EB    jne         0069D307
 0069D2ED    lea         eax,[esp+20]
 0069D2F1    call        005C390C
 0069D2F6    mov         dword ptr [esp+38],eax
 0069D2FA    fild        dword ptr [esp+38]
 0069D2FE    fstp        qword ptr [esp]
 0069D301    wait
>0069D302    jmp         0069D70C
 0069D307    lea         edx,[esp+8]
 0069D30B    lea         eax,[esp+20]
 0069D30F    call        005C3880
 0069D314    fstp        qword ptr [esp]
 0069D317    wait
>0069D318    jmp         0069D70C
 0069D31D    sub         edi,14A
 0069D323    lea         edx,[esp+8]
 0069D327    mov         eax,edi
 0069D329    call        005C37C4
 0069D32E    fld         dword ptr [ebx+84]
 0069D334    fchs
 0069D336    fstp        qword ptr [esp+20]
 0069D33A    wait
 0069D33B    fld         dword ptr [ebx+88]
 0069D341    fchs
 0069D343    fstp        qword ptr [esp+28]
 0069D347    wait
 0069D348    fld         dword ptr [ebx+8C]
 0069D34E    fchs
 0069D350    fstp        qword ptr [esp+30]
 0069D354    wait
 0069D355    cmp         edi,0D
>0069D358    jne         0069D374
 0069D35A    lea         eax,[esp+20]
 0069D35E    call        005C390C
 0069D363    mov         dword ptr [esp+38],eax
 0069D367    fild        dword ptr [esp+38]
 0069D36B    fstp        qword ptr [esp]
 0069D36E    wait
>0069D36F    jmp         0069D70C
 0069D374    lea         edx,[esp+8]
 0069D378    lea         eax,[esp+20]
 0069D37C    call        005C3880
 0069D381    fstp        qword ptr [esp]
 0069D384    wait
>0069D385    jmp         0069D70C
 0069D38A    sub         edi,168
 0069D390    lea         edx,[esp+8]
 0069D394    mov         eax,edi
 0069D396    call        005C37C4
 0069D39B    mov         eax,[0081ED7C];gvar_0081ED7C:?
 0069D3A0    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069D3A3    cmp         byte ptr [eax+edx],0
>0069D3A7    je          0069D3C6
 0069D3A9    fld         dword ptr [ebx+78]
 0069D3AC    fstp        qword ptr [esp+20]
 0069D3B0    wait
 0069D3B1    fld         dword ptr [ebx+7C]
 0069D3B4    fstp        qword ptr [esp+28]
 0069D3B8    wait
 0069D3B9    fld         dword ptr [ebx+80]
 0069D3BF    fstp        qword ptr [esp+30]
 0069D3C3    wait
>0069D3C4    jmp         0069D3E7
 0069D3C6    fld         dword ptr [ebx+78]
 0069D3C9    fchs
 0069D3CB    fstp        qword ptr [esp+20]
 0069D3CF    wait
 0069D3D0    fld         dword ptr [ebx+7C]
 0069D3D3    fchs
 0069D3D5    fstp        qword ptr [esp+28]
 0069D3D9    wait
 0069D3DA    fld         dword ptr [ebx+80]
 0069D3E0    fchs
 0069D3E2    fstp        qword ptr [esp+30]
 0069D3E6    wait
 0069D3E7    cmp         edi,0D
>0069D3EA    jne         0069D406
 0069D3EC    lea         eax,[esp+20]
 0069D3F0    call        005C390C
 0069D3F5    mov         dword ptr [esp+38],eax
 0069D3F9    fild        dword ptr [esp+38]
 0069D3FD    fstp        qword ptr [esp]
 0069D400    wait
>0069D401    jmp         0069D70C
 0069D406    lea         edx,[esp+8]
 0069D40A    lea         eax,[esp+20]
 0069D40E    call        005C3880
 0069D413    fstp        qword ptr [esp]
 0069D416    wait
>0069D417    jmp         0069D70C
 0069D41C    fild        dword ptr [ebx+228]
 0069D422    fstp        qword ptr [esp]
 0069D425    wait
>0069D426    jmp         0069D70C
 0069D42B    cmp         dword ptr [ebx+0C0],0
>0069D432    jne         0069D451
 0069D434    mov         eax,[0081ED80];gvar_0081ED80:?
 0069D439    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069D43C    cmp         dword ptr [eax+edx*4],1
 0069D440    sete        al
 0069D443    call        00686074
 0069D448    fstp        qword ptr [esp]
 0069D44B    wait
>0069D44C    jmp         0069D70C
 0069D451    xor         eax,eax
 0069D453    mov         dword ptr [esp],eax
 0069D456    mov         dword ptr [esp+4],eax
>0069D45A    jmp         0069D70C
 0069D45F    cmp         dword ptr [ebx+0C0],0
>0069D466    jne         0069D485
 0069D468    mov         eax,[0081ED80];gvar_0081ED80:?
 0069D46D    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069D470    cmp         dword ptr [eax+edx*4],2
 0069D474    sete        al
 0069D477    call        00686074
 0069D47C    fstp        qword ptr [esp]
 0069D47F    wait
>0069D480    jmp         0069D70C
 0069D485    xor         eax,eax
 0069D487    mov         dword ptr [esp],eax
 0069D48A    mov         dword ptr [esp+4],eax
>0069D48E    jmp         0069D70C
 0069D493    cmp         dword ptr [ebx+0C0],0
>0069D49A    jne         0069D4B9
 0069D49C    mov         eax,[0081ED80];gvar_0081ED80:?
 0069D4A1    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069D4A4    cmp         dword ptr [eax+edx*4],3
 0069D4A8    sete        al
 0069D4AB    call        00686074
 0069D4B0    fstp        qword ptr [esp]
 0069D4B3    wait
>0069D4B4    jmp         0069D70C
 0069D4B9    xor         eax,eax
 0069D4BB    mov         dword ptr [esp],eax
 0069D4BE    mov         dword ptr [esp+4],eax
>0069D4C2    jmp         0069D70C
 0069D4C7    cmp         dword ptr [ebx+0C0],0
>0069D4CE    jne         0069D4ED
 0069D4D0    mov         eax,[0081ED80];gvar_0081ED80:?
 0069D4D5    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069D4D8    cmp         dword ptr [eax+edx*4],4
 0069D4DC    sete        al
 0069D4DF    call        00686074
 0069D4E4    fstp        qword ptr [esp]
 0069D4E7    wait
>0069D4E8    jmp         0069D70C
 0069D4ED    xor         eax,eax
 0069D4EF    mov         dword ptr [esp],eax
 0069D4F2    mov         dword ptr [esp+4],eax
>0069D4F6    jmp         0069D70C
 0069D4FB    cmp         dword ptr [ebx+0C0],0
>0069D502    jne         0069D521
 0069D504    mov         eax,[0081ED80];gvar_0081ED80:?
 0069D509    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069D50C    cmp         dword ptr [eax+edx*4],5
 0069D510    sete        al
 0069D513    call        00686074
 0069D518    fstp        qword ptr [esp]
 0069D51B    wait
>0069D51C    jmp         0069D70C
 0069D521    xor         eax,eax
 0069D523    mov         dword ptr [esp],eax
 0069D526    mov         dword ptr [esp+4],eax
>0069D52A    jmp         0069D70C
 0069D52F    cmp         dword ptr [ebx+0C0],0
>0069D536    jne         0069D555
 0069D538    mov         eax,[0081ED80];gvar_0081ED80:?
 0069D53D    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069D540    cmp         dword ptr [eax+edx*4],6
 0069D544    sete        al
 0069D547    call        00686074
 0069D54C    fstp        qword ptr [esp]
 0069D54F    wait
>0069D550    jmp         0069D70C
 0069D555    xor         eax,eax
 0069D557    mov         dword ptr [esp],eax
 0069D55A    mov         dword ptr [esp+4],eax
>0069D55E    jmp         0069D70C
 0069D563    cmp         dword ptr [ebx+0C0],0
>0069D56A    jne         0069D589
 0069D56C    mov         eax,[0081ED80];gvar_0081ED80:?
 0069D571    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069D574    cmp         dword ptr [eax+edx*4],8
 0069D578    sete        al
 0069D57B    call        00686074
 0069D580    fstp        qword ptr [esp]
 0069D583    wait
>0069D584    jmp         0069D70C
 0069D589    xor         eax,eax
 0069D58B    mov         dword ptr [esp],eax
 0069D58E    mov         dword ptr [esp+4],eax
>0069D592    jmp         0069D70C
 0069D597    cmp         dword ptr [ebx+0C0],0
>0069D59E    jne         0069D5BD
 0069D5A0    mov         eax,[0081ED80];gvar_0081ED80:?
 0069D5A5    mov         edx,dword ptr [esi+18];TGloveValue.........................................................
 0069D5A8    cmp         dword ptr [eax+edx*4],0
 0069D5AC    sete        al
 0069D5AF    call        00686074
 0069D5B4    fstp        qword ptr [esp]
 0069D5B7    wait
>0069D5B8    jmp         0069D70C
 0069D5BD    xor         eax,eax
 0069D5BF    mov         dword ptr [esp],eax
 0069D5C2    mov         dword ptr [esp+4],eax
>0069D5C6    jmp         0069D70C
 0069D5CB    xor         eax,eax
 0069D5CD    mov         dword ptr [esp],eax
 0069D5D0    mov         dword ptr [esp+4],3FF00000
>0069D5D8    jmp         0069D70C
 0069D5DD    movzx       eax,byte ptr [ebx+0C4]
 0069D5E4    call        00698F14
 0069D5E9    fstp        qword ptr [esp]
 0069D5EC    wait
>0069D5ED    jmp         0069D70C
 0069D5F2    movzx       eax,byte ptr [ebx+0C4]
 0069D5F9    call        00698F6C
 0069D5FE    fstp        qword ptr [esp]
 0069D601    wait
>0069D602    jmp         0069D70C
 0069D607    movzx       eax,byte ptr [ebx+0C4]
 0069D60E    call        00698FC4
 0069D613    fstp        qword ptr [esp]
 0069D616    wait
>0069D617    jmp         0069D70C
 0069D61C    movzx       eax,byte ptr [ebx+0C5]
 0069D623    call        00698EA8
 0069D628    fstp        qword ptr [esp]
 0069D62B    wait
>0069D62C    jmp         0069D70C
 0069D631    movzx       eax,byte ptr [ebx+0C5]
 0069D638    call        0069901C
 0069D63D    fstp        qword ptr [esp]
 0069D640    wait
>0069D641    jmp         0069D70C
 0069D646    movzx       eax,byte ptr [ebx+0C5]
 0069D64D    call        00699068
 0069D652    fstp        qword ptr [esp]
 0069D655    wait
>0069D656    jmp         0069D70C
 0069D65B    movzx       eax,byte ptr [ebx+0C6]
 0069D662    call        00698EA8
 0069D667    fstp        qword ptr [esp]
 0069D66A    wait
>0069D66B    jmp         0069D70C
 0069D670    movzx       eax,byte ptr [ebx+0C6]
 0069D677    call        0069901C
 0069D67C    fstp        qword ptr [esp]
 0069D67F    wait
>0069D680    jmp         0069D70C
 0069D685    movzx       eax,byte ptr [ebx+0C6]
 0069D68C    call        00699068
 0069D691    fstp        qword ptr [esp]
 0069D694    wait
>0069D695    jmp         0069D70C
 0069D697    movzx       eax,byte ptr [ebx+0C7]
 0069D69E    call        00698EA8
 0069D6A3    fstp        qword ptr [esp]
 0069D6A6    wait
>0069D6A7    jmp         0069D70C
 0069D6A9    movzx       eax,byte ptr [ebx+0C7]
 0069D6B0    call        0069901C
 0069D6B5    fstp        qword ptr [esp]
 0069D6B8    wait
>0069D6B9    jmp         0069D70C
 0069D6BB    movzx       eax,byte ptr [ebx+0C7]
 0069D6C2    call        00699068
 0069D6C7    fstp        qword ptr [esp]
 0069D6CA    wait
>0069D6CB    jmp         0069D70C
 0069D6CD    movzx       eax,byte ptr [ebx+0C8]
 0069D6D4    call        00698EA8
 0069D6D9    fstp        qword ptr [esp]
 0069D6DC    wait
>0069D6DD    jmp         0069D70C
 0069D6DF    movzx       eax,byte ptr [ebx+0C8]
 0069D6E6    call        0069901C
 0069D6EB    fstp        qword ptr [esp]
 0069D6EE    wait
>0069D6EF    jmp         0069D70C
 0069D6F1    movzx       eax,byte ptr [ebx+0C8]
 0069D6F8    call        00699068
 0069D6FD    fstp        qword ptr [esp]
 0069D700    wait
>0069D701    jmp         0069D70C
 0069D703    xor         eax,eax
 0069D705    mov         dword ptr [esp],eax
 0069D708    mov         dword ptr [esp+4],eax
 0069D70C    fld         qword ptr [esp]
 0069D70F    add         esp,54
 0069D712    pop         edi
 0069D713    pop         esi
 0069D714    pop         ebx
 0069D715    ret
*}
end;

//0069D730
procedure TGloveValue.GetVector(x:Double; y:Double; z:Double);
begin
{*
 0069D730    push        ebp
 0069D731    mov         ebp,esp
 0069D733    add         esp,0FFFFFF68
 0069D739    push        ebx
 0069D73A    push        esi
 0069D73B    push        edi
 0069D73C    mov         dword ptr [ebp-4],ecx
 0069D73F    mov         edi,edx
 0069D741    mov         ebx,eax
 0069D743    xor         eax,eax
 0069D745    mov         dword ptr [edi],eax
 0069D747    mov         dword ptr [edi+4],eax
 0069D74A    mov         eax,dword ptr [ebp-4]
 0069D74D    xor         edx,edx
 0069D74F    mov         dword ptr [eax],edx
 0069D751    mov         dword ptr [eax+4],edx
 0069D754    mov         eax,dword ptr [ebp+8]
 0069D757    xor         edx,edx
 0069D759    mov         dword ptr [eax],edx
 0069D75B    mov         dword ptr [eax+4],edx
 0069D75E    mov         eax,dword ptr [ebx+18];TGloveValue.........................................................
 0069D761    cmp         eax,dword ptr ds:[81ED78];gvar_0081ED78:Single
>0069D767    jg          0069DBDD
 0069D76D    mov         ax,133F
 0069D771    call        Set8087CW
 0069D776    mov         eax,dword ptr [ebx+18];TGloveValue.........................................................
 0069D779    push        eax
 0069D77A    call        P5DLL.P5_GetStatePointer
 0069D77F    mov         esi,eax
 0069D781    mov         eax,dword ptr [ebx+18];TGloveValue.........................................................
 0069D784    push        eax
 0069D785    call        P5DLL.P5_GetInfoPointer
 0069D78A    mov         dword ptr [ebp-8],eax
 0069D78D    test        esi,esi
>0069D78F    je          0069DBDD
 0069D795    mov         eax,ebx
 0069D797    mov         edx,dword ptr [eax]
 0069D799    call        dword ptr [edx+44];TGloveValue.GetDataType
 0069D79C    cmp         al,6
>0069D79E    jne         0069D7D4
 0069D7A0    lea         edx,[ebp-98]
 0069D7A6    mov         eax,ebx
 0069D7A8    mov         ecx,dword ptr [eax]
 0069D7AA    call        dword ptr [ecx+40];TGloveValue.GetRotMat
 0069D7AD    mov         eax,dword ptr [ebp-68]
 0069D7B0    mov         dword ptr [edi],eax
 0069D7B2    mov         eax,dword ptr [ebp-64]
 0069D7B5    mov         dword ptr [edi+4],eax
 0069D7B8    mov         eax,dword ptr [ebp-4]
 0069D7BB    mov         edx,dword ptr [ebp-60]
 0069D7BE    mov         dword ptr [eax],edx
 0069D7C0    mov         edx,dword ptr [ebp-5C]
 0069D7C3    mov         dword ptr [eax+4],edx
 0069D7C6    mov         eax,dword ptr [ebp+8]
 0069D7C9    mov         edx,dword ptr [ebp-58]
 0069D7CC    mov         dword ptr [eax],edx
 0069D7CE    mov         edx,dword ptr [ebp-54]
 0069D7D1    mov         dword ptr [eax+4],edx
 0069D7D4    mov         eax,ebx
 0069D7D6    mov         edx,dword ptr [eax]
 0069D7D8    call        dword ptr [edx+44];TGloveValue.GetDataType
 0069D7DB    cmp         al,5
>0069D7DD    je          0069D7F4
 0069D7DF    mov         eax,dword ptr [ebp+8]
 0069D7E2    push        eax
 0069D7E3    mov         ecx,dword ptr [ebp-4]
 0069D7E6    mov         edx,edi
 0069D7E8    mov         eax,ebx
 0069D7EA    call        TExpression.GetVector
>0069D7EF    jmp         0069DBDD
 0069D7F4    mov         eax,dword ptr [ebx+20];TGloveValue....................................Item:Integer
 0069D7F7    mov         edx,eax
 0069D7F9    add         edx,0FFFFFF38
 0069D7FF    cmp         edx,31
>0069D802    ja          0069DBCD
 0069D808    movzx       edx,byte ptr [edx+69D816]
 0069D80F    jmp         dword ptr [edx*4+69D848]
 0069D80F    db          2
 0069D80F    db          3
 0069D80F    db          4
 0069D80F    db          5
 0069D80F    db          6
 0069D80F    db          7
 0069D80F    db          7
 0069D80F    db          7
 0069D80F    db          7
 0069D80F    db          7
 0069D80F    db          7
 0069D80F    db          7
 0069D80F    db          7
 0069D80F    db          10
 0069D80F    db          8
 0069D80F    db          11
 0069D80F    db          12
 0069D80F    db          9
 0069D80F    db          0
 0069D80F    db          0
 0069D80F    db          0
 0069D80F    db          0
 0069D80F    db          0
 0069D80F    db          0
 0069D80F    db          0
 0069D80F    db          0
 0069D80F    db          0
 0069D80F    db          0
 0069D80F    db          0
 0069D80F    db          0
 0069D80F    db          0
 0069D80F    db          0
 0069D80F    db          0
 0069D80F    db          13
 0069D80F    db          0
 0069D80F    db          0
 0069D80F    db          0
 0069D80F    db          0
 0069D80F    db          0
 0069D80F    db          0
 0069D80F    db          1
 0069D80F    db          1
 0069D80F    db          1
 0069D80F    db          1
 0069D80F    db          1
 0069D80F    db          1
 0069D80F    db          1
 0069D80F    db          1
 0069D80F    db          1
 0069D80F    db          1
 0069D80F    dd          0069DBCD
 0069D80F    dd          0069D880
 0069D80F    dd          0069D8BA
 0069D80F    dd          0069D8D7
 0069D80F    dd          0069D8F4
 0069D80F    dd          0069D911
 0069D80F    dd          0069D92E
 0069D80F    dd          0069D94A
 0069D80F    dd          0069D976
 0069D80F    dd          0069D99C
 0069D80F    dd          0069D9C8
 0069D80F    dd          0069D9EE
 0069D80F    dd          0069DA1A
 0069D80F    dd          0069DA40
 0069D880    sub         eax,0F0
 0069D885    lea         edx,[eax+eax*2]
 0069D888    mov         ecx,dword ptr [ebp-8]
 0069D88B    fld         dword ptr [ecx+edx*4+748]
 0069D892    fstp        qword ptr [edi]
 0069D894    wait
 0069D895    mov         ecx,dword ptr [ebp-8]
 0069D898    fld         dword ptr [ecx+edx*4+74C]
 0069D89F    mov         ecx,dword ptr [ebp-4]
 0069D8A2    fstp        qword ptr [ecx]
 0069D8A4    wait
 0069D8A5    mov         eax,dword ptr [ebp-8]
 0069D8A8    fld         dword ptr [eax+edx*4+750]
 0069D8AF    mov         eax,dword ptr [ebp+8]
 0069D8B2    fstp        qword ptr [eax]
 0069D8B4    wait
>0069D8B5    jmp         0069DBDD
 0069D8BA    fld         dword ptr [esi+24]
 0069D8BD    fstp        qword ptr [edi]
 0069D8BF    wait
 0069D8C0    fld         dword ptr [esi+28]
 0069D8C3    mov         eax,dword ptr [ebp-4]
 0069D8C6    fstp        qword ptr [eax]
 0069D8C8    wait
 0069D8C9    fld         dword ptr [esi+2C]
 0069D8CC    mov         eax,dword ptr [ebp+8]
 0069D8CF    fstp        qword ptr [eax]
 0069D8D1    wait
>0069D8D2    jmp         0069DBDD
 0069D8D7    fld         dword ptr [esi+30]
 0069D8DA    fstp        qword ptr [edi]
 0069D8DC    wait
 0069D8DD    fld         dword ptr [esi+34]
 0069D8E0    mov         eax,dword ptr [ebp-4]
 0069D8E3    fstp        qword ptr [eax]
 0069D8E5    wait
 0069D8E6    fld         dword ptr [esi+38]
 0069D8E9    mov         eax,dword ptr [ebp+8]
 0069D8EC    fstp        qword ptr [eax]
 0069D8EE    wait
>0069D8EF    jmp         0069DBDD
 0069D8F4    fld         dword ptr [esi+3C]
 0069D8F7    fstp        qword ptr [edi]
 0069D8F9    wait
 0069D8FA    fld         dword ptr [esi+40]
 0069D8FD    mov         eax,dword ptr [ebp-4]
 0069D900    fstp        qword ptr [eax]
 0069D902    wait
 0069D903    fld         dword ptr [esi+44]
 0069D906    mov         eax,dword ptr [ebp+8]
 0069D909    fstp        qword ptr [eax]
 0069D90B    wait
>0069D90C    jmp         0069DBDD
 0069D911    fld         dword ptr [esi+0C]
 0069D914    fstp        qword ptr [edi]
 0069D916    wait
 0069D917    fld         dword ptr [esi+10]
 0069D91A    mov         eax,dword ptr [ebp-4]
 0069D91D    fstp        qword ptr [eax]
 0069D91F    wait
 0069D920    fld         dword ptr [esi+14]
 0069D923    mov         eax,dword ptr [ebp+8]
 0069D926    fstp        qword ptr [eax]
 0069D928    wait
>0069D929    jmp         0069DBDD
 0069D92E    fld         dword ptr [esi]
 0069D930    fstp        qword ptr [edi]
 0069D932    wait
 0069D933    fld         dword ptr [esi+4]
 0069D936    mov         eax,dword ptr [ebp-4]
 0069D939    fstp        qword ptr [eax]
 0069D93B    wait
 0069D93C    fld         dword ptr [esi+8]
 0069D93F    mov         eax,dword ptr [ebp+8]
 0069D942    fstp        qword ptr [eax]
 0069D944    wait
>0069D945    jmp         0069DBDD
 0069D94A    lea         edx,[eax+eax*2]
 0069D94D    fld         dword ptr [esi+edx*4-89C]
 0069D954    fstp        qword ptr [edi]
 0069D956    wait
 0069D957    fld         dword ptr [esi+edx*4-898]
 0069D95E    mov         eax,dword ptr [ebp-4]
 0069D961    fstp        qword ptr [eax]
 0069D963    wait
 0069D964    fld         dword ptr [esi+edx*4-894]
 0069D96B    mov         eax,dword ptr [ebp+8]
 0069D96E    fstp        qword ptr [eax]
 0069D970    wait
>0069D971    jmp         0069DBDD
 0069D976    fld         dword ptr [esi+90]
 0069D97C    fstp        qword ptr [edi]
 0069D97E    wait
 0069D97F    fld         dword ptr [esi+94]
 0069D985    mov         eax,dword ptr [ebp-4]
 0069D988    fstp        qword ptr [eax]
 0069D98A    wait
 0069D98B    fld         dword ptr [esi+98]
 0069D991    mov         eax,dword ptr [ebp+8]
 0069D994    fstp        qword ptr [eax]
 0069D996    wait
>0069D997    jmp         0069DBDD
 0069D99C    fld         dword ptr [esi+84]
 0069D9A2    fchs
 0069D9A4    fstp        qword ptr [edi]
 0069D9A6    wait
 0069D9A7    fld         dword ptr [esi+88]
 0069D9AD    fchs
 0069D9AF    mov         eax,dword ptr [ebp-4]
 0069D9B2    fstp        qword ptr [eax]
 0069D9B4    wait
 0069D9B5    fld         dword ptr [esi+8C]
 0069D9BB    fchs
 0069D9BD    mov         eax,dword ptr [ebp+8]
 0069D9C0    fstp        qword ptr [eax]
 0069D9C2    wait
>0069D9C3    jmp         0069DBDD
 0069D9C8    fld         dword ptr [esi+78]
 0069D9CB    fchs
 0069D9CD    fstp        qword ptr [edi]
 0069D9CF    wait
 0069D9D0    fld         dword ptr [esi+7C]
 0069D9D3    fchs
 0069D9D5    mov         eax,dword ptr [ebp-4]
 0069D9D8    fstp        qword ptr [eax]
 0069D9DA    wait
 0069D9DB    fld         dword ptr [esi+80]
 0069D9E1    fchs
 0069D9E3    mov         eax,dword ptr [ebp+8]
 0069D9E6    fstp        qword ptr [eax]
 0069D9E8    wait
>0069D9E9    jmp         0069DBDD
 0069D9EE    fld         dword ptr [esi+90]
 0069D9F4    fchs
 0069D9F6    fstp        qword ptr [edi]
 0069D9F8    wait
 0069D9F9    fld         dword ptr [esi+94]
 0069D9FF    fchs
 0069DA01    mov         eax,dword ptr [ebp-4]
 0069DA04    fstp        qword ptr [eax]
 0069DA06    wait
 0069DA07    fld         dword ptr [esi+98]
 0069DA0D    fchs
 0069DA0F    mov         eax,dword ptr [ebp+8]
 0069DA12    fstp        qword ptr [eax]
 0069DA14    wait
>0069DA15    jmp         0069DBDD
 0069DA1A    fld         dword ptr [esi+84]
 0069DA20    fstp        qword ptr [edi]
 0069DA22    wait
 0069DA23    fld         dword ptr [esi+88]
 0069DA29    mov         eax,dword ptr [ebp-4]
 0069DA2C    fstp        qword ptr [eax]
 0069DA2E    wait
 0069DA2F    fld         dword ptr [esi+8C]
 0069DA35    mov         eax,dword ptr [ebp+8]
 0069DA38    fstp        qword ptr [eax]
 0069DA3A    wait
>0069DA3B    jmp         0069DBDD
 0069DA40    movzx       eax,byte ptr [esi+0C5]
 0069DA47    call        00698EA8
 0069DA4C    fld         tbyte ptr ds:[69DBE8];0.0174532925199433:Extended
 0069DA52    fmulp       st(1),st
 0069DA54    fstp        qword ptr [ebp-10]
 0069DA57    wait
 0069DA58    movzx       eax,byte ptr [esi+0C5]
 0069DA5F    call        0069901C
 0069DA64    fld         tbyte ptr ds:[69DBE8];0.0174532925199433:Extended
 0069DA6A    fmulp       st(1),st
 0069DA6C    fstp        qword ptr [ebp-18]
 0069DA6F    wait
 0069DA70    movzx       eax,byte ptr [esi+0C5]
 0069DA77    call        00699068
 0069DA7C    fld         tbyte ptr ds:[69DBE8];0.0174532925199433:Extended
 0069DA82    fmulp       st(1),st
 0069DA84    fstp        qword ptr [ebp-20]
 0069DA87    wait
 0069DA88    fld         qword ptr [ebp-10]
 0069DA8B    add         esp,0FFFFFFF4
 0069DA8E    fstp        tbyte ptr [esp]
 0069DA91    wait
 0069DA92    call        Sin
 0069DA97    fchs
 0069DA99    fmul        dword ptr ds:[69DBF4];5:Single
 0069DA9F    fstp        qword ptr [ebp-28]
 0069DAA2    wait
 0069DAA3    fld         qword ptr [ebp-10]
 0069DAA6    add         esp,0FFFFFFF4
 0069DAA9    fstp        tbyte ptr [esp]
 0069DAAC    wait
 0069DAAD    call        Cos
 0069DAB2    fmul        dword ptr ds:[69DBF4];5:Single
 0069DAB8    fstp        qword ptr [ebp-30]
 0069DABB    wait
 0069DABC    fld         qword ptr [ebp-10]
 0069DABF    fadd        qword ptr [ebp-18]
 0069DAC2    add         esp,0FFFFFFF4
 0069DAC5    fstp        tbyte ptr [esp]
 0069DAC8    wait
 0069DAC9    call        Sin
 0069DACE    fchs
 0069DAD0    fmul        dword ptr ds:[69DBF8];2:Single
 0069DAD6    fstp        qword ptr [ebp-38]
 0069DAD9    wait
 0069DADA    fld         qword ptr [ebp-10]
 0069DADD    fadd        qword ptr [ebp-18]
 0069DAE0    add         esp,0FFFFFFF4
 0069DAE3    fstp        tbyte ptr [esp]
 0069DAE6    wait
 0069DAE7    call        Cos
 0069DAEC    fmul        dword ptr ds:[69DBF8];2:Single
 0069DAF2    fstp        qword ptr [ebp-40]
 0069DAF5    wait
 0069DAF6    fld         qword ptr [ebp-10]
 0069DAF9    fadd        qword ptr [ebp-18]
 0069DAFC    fadd        qword ptr [ebp-20]
 0069DAFF    add         esp,0FFFFFFF4
 0069DB02    fstp        tbyte ptr [esp]
 0069DB05    wait
 0069DB06    call        Sin
 0069DB0B    fchs
 0069DB0D    fmul        dword ptr ds:[69DBFC];2.5:Single
 0069DB13    fstp        qword ptr [ebp-48]
 0069DB16    wait
 0069DB17    fld         qword ptr [ebp-10]
 0069DB1A    fadd        qword ptr [ebp-18]
 0069DB1D    fadd        qword ptr [ebp-20]
 0069DB20    add         esp,0FFFFFFF4
 0069DB23    fstp        tbyte ptr [esp]
 0069DB26    wait
 0069DB27    call        Cos
 0069DB2C    fmul        dword ptr ds:[69DBFC];2.5:Single
 0069DB32    fstp        qword ptr [ebp-50]
 0069DB35    wait
 0069DB36    lea         edx,[ebp-98]
 0069DB3C    lea         eax,[esi+78]
 0069DB3F    call        00698D68
 0069DB44    push        40442850
 0069DB49    push        0A142850A
 0069DB4E    fld         qword ptr [ebp-28]
 0069DB51    fadd        qword ptr [ebp-38]
 0069DB54    fadd        qword ptr [ebp-48]
 0069DB57    fsub        dword ptr ds:[69DC00];1.5:Single
 0069DB5D    fld         tbyte ptr ds:[69DC04];0.049609375:Extended
 0069DB63    fdivp       st(1),st
 0069DB65    add         esp,0FFFFFFF8
 0069DB68    fstp        qword ptr [esp]
 0069DB6B    wait
 0069DB6C    fld         qword ptr [ebp-30]
 0069DB6F    fadd        qword ptr [ebp-40]
 0069DB72    fadd        qword ptr [ebp-50]
 0069DB75    fsub        dword ptr ds:[69DBF8];2:Single
 0069DB7B    fld         tbyte ptr ds:[69DC04];0.049609375:Extended
 0069DB81    fdivp       st(1),st
 0069DB83    add         esp,0FFFFFFF8
 0069DB86    fstp        qword ptr [esp]
 0069DB89    wait
 0069DB8A    lea         eax,[ebp-98]
 0069DB90    push        eax
 0069DB91    mov         ecx,dword ptr [ebp+8]
 0069DB94    mov         edx,dword ptr [ebp-4]
 0069DB97    mov         eax,edi
 0069DB99    call        005C3ECC
 0069DB9E    fld         qword ptr [edi]
 0069DBA0    fadd        dword ptr [esi+130]
 0069DBA6    fstp        qword ptr [edi]
 0069DBA8    wait
 0069DBA9    mov         eax,dword ptr [ebp-4]
 0069DBAC    fld         qword ptr [eax]
 0069DBAE    fadd        dword ptr [esi+134]
 0069DBB4    mov         eax,dword ptr [ebp-4]
 0069DBB7    fstp        qword ptr [eax]
 0069DBB9    wait
 0069DBBA    mov         eax,dword ptr [ebp+8]
 0069DBBD    fld         qword ptr [eax]
 0069DBBF    fadd        dword ptr [esi+138]
 0069DBC5    mov         eax,dword ptr [ebp+8]
 0069DBC8    fstp        qword ptr [eax]
 0069DBCA    wait
>0069DBCB    jmp         0069DBDD
 0069DBCD    mov         eax,dword ptr [ebp+8]
 0069DBD0    push        eax
 0069DBD1    mov         ecx,dword ptr [ebp-4]
 0069DBD4    mov         edx,edi
 0069DBD6    mov         eax,ebx
 0069DBD8    call        TExpression.GetVector
 0069DBDD    pop         edi
 0069DBDE    pop         esi
 0069DBDF    pop         ebx
 0069DBE0    mov         esp,ebp
 0069DBE2    pop         ebp
 0069DBE3    ret         4
*}
end;

//0069DC10
function TGloveValue.Module:TObject;
begin
{*
 0069DC10    mov         eax,[0081ED64];gvar_0081ED64:TModuleP5
 0069DC15    ret
*}
end;

//0069DC18
{*function TGloveValue.SetValue(NewValue:Double; ?:?):Boolean;
begin
 0069DC18    push        ebp
 0069DC19    mov         ebp,esp
 0069DC1B    push        ebx
 0069DC1C    push        esi
 0069DC1D    mov         esi,eax
 0069DC1F    mov         bl,1
 0069DC21    mov         eax,dword ptr [esi+20];TGloveValue.....................................Item:Integer
 0069DC24    cmp         eax,4C
>0069DC27    jne         0069DC3E
 0069DC29    fild        dword ptr ds:[81ED6C];gvar_0081ED6C:Single
 0069DC2F    fcomp       qword ptr [ebp+8]
 0069DC32    wait
 0069DC33    fnstsw      al
 0069DC35    sahf
>0069DC36    je          0069DE17
>0069DC3C    jmp         0069DCAA
 0069DC3E    cmp         eax,4D
>0069DC41    jne         0069DC58
 0069DC43    fld         qword ptr [ebp+8]
 0069DC46    fcomp       qword ptr ds:[81ED70];gvar_0081ED70:Double
 0069DC4C    wait
 0069DC4D    fnstsw      al
 0069DC4F    sahf
>0069DC50    je          0069DE17
>0069DC56    jmp         0069DCAA
 0069DC58    cmp         eax,4A
>0069DC5B    jne         0069DC76
 0069DC5D    push        dword ptr [ebp+0C]
 0069DC60    push        dword ptr [ebp+8]
 0069DC63    call        00686060
 0069DC68    cmp         al,byte ptr ds:[81ED68];gvar_0081ED68:Boolean
>0069DC6E    je          0069DE17
>0069DC74    jmp         0069DCAA
 0069DC76    cmp         eax,4B
>0069DC79    jne         0069DC94
 0069DC7B    push        dword ptr [ebp+0C]
 0069DC7E    push        dword ptr [ebp+8]
 0069DC81    call        00686060
 0069DC86    cmp         al,byte ptr ds:[81ED69];gvar_0081ED69:Boolean
>0069DC8C    je          0069DE17
>0069DC92    jmp         0069DCAA
 0069DC94    cmp         byte ptr [esi+10],0;TGloveValue.Iffy:Boolean
>0069DC98    jne         0069DCAA
 0069DC9A    fld         qword ptr [ebp+8]
 0069DC9D    fcomp       qword ptr [esi+8];TGloveValue.PreviousValue:Double
 0069DCA0    wait
 0069DCA1    fnstsw      al
 0069DCA3    sahf
>0069DCA4    je          0069DE17
 0069DCAA    mov         eax,dword ptr [esi+20];TGloveValue......................................Item:Integer
 0069DCAD    cmp         eax,4D
>0069DCB0    jg          0069DCD0
>0069DCB2    je          0069DD86
 0069DCB8    sub         eax,4A
>0069DCBB    je          0069DD0A
 0069DCBD    dec         eax
>0069DCBE    je          0069DD48
 0069DCC4    dec         eax
>0069DCC5    je          0069DDBD
>0069DCCB    jmp         0069DE15
 0069DCD0    sub         eax,60
>0069DCD3    je          0069DCE6
 0069DCD5    dec         eax
>0069DCD6    je          0069DCF8
 0069DCD8    sub         eax,3A
>0069DCDB    je          0069DDEF
>0069DCE1    jmp         0069DE15
 0069DCE6    fld         qword ptr [ebp+8]
 0069DCE9    call        @ROUND
 0069DCEE    mov         [0078BE08],eax;gvar_0078BE08:Single
>0069DCF3    jmp         0069DE17
 0069DCF8    fld         qword ptr [ebp+8]
 0069DCFB    call        @ROUND
 0069DD00    mov         [0078BE0C],eax;gvar_0078BE0C:Single
>0069DD05    jmp         0069DE17
 0069DD0A    mov         bl,1
 0069DD0C    xor         esi,esi
 0069DD0E    push        dword ptr [ebp+0C]
 0069DD11    push        dword ptr [ebp+8]
 0069DD14    call        00686060
 0069DD19    mov         [0081ED68],al;gvar_0081ED68:Boolean
 0069DD1E    cmp         byte ptr ds:[81ED68],0;gvar_0081ED68:Boolean
>0069DD25    je          0069DD2A
 0069DD27    add         esi,2
 0069DD2A    cmp         byte ptr ds:[81ED69],0;gvar_0081ED69:Boolean
>0069DD31    je          0069DD34
 0069DD33    inc         esi
 0069DD34    mov         ax,133F
 0069DD38    call        Set8087CW
 0069DD3D    push        esi
 0069DD3E    call        P5DLL.P5_SetFilterMode
>0069DD43    jmp         0069DE17
 0069DD48    mov         bl,1
 0069DD4A    xor         esi,esi
 0069DD4C    push        dword ptr [ebp+0C]
 0069DD4F    push        dword ptr [ebp+8]
 0069DD52    call        00686060
 0069DD57    mov         [0081ED69],al;gvar_0081ED69:Boolean
 0069DD5C    cmp         byte ptr ds:[81ED68],0;gvar_0081ED68:Boolean
>0069DD63    je          0069DD68
 0069DD65    add         esi,2
 0069DD68    cmp         byte ptr ds:[81ED69],0;gvar_0081ED69:Boolean
>0069DD6F    je          0069DD72
 0069DD71    inc         esi
 0069DD72    mov         ax,133F
 0069DD76    call        Set8087CW
 0069DD7B    push        esi
 0069DD7C    call        P5DLL.P5_SetFilterMode
>0069DD81    jmp         0069DE17
 0069DD86    mov         bl,1
 0069DD88    mov         eax,dword ptr [ebp+8]
 0069DD8B    mov         dword ptr ds:[81ED70],eax;gvar_0081ED70:Double
 0069DD91    mov         eax,dword ptr [ebp+0C]
 0069DD94    mov         dword ptr ds:[81ED74],eax;gvar_0081ED74
 0069DD9A    mov         ax,133F
 0069DD9E    call        Set8087CW
 0069DDA3    fld         qword ptr ds:[81ED70];gvar_0081ED70:Double
 0069DDA9    add         esp,0FFFFFFFC
 0069DDAC    fstp        dword ptr [esp]
 0069DDAF    wait
 0069DDB0    mov         eax,[0081ED6C];gvar_0081ED6C:Single
 0069DDB5    push        eax
 0069DDB6    call        P5DLL.P5_SetFilterAmount
>0069DDBB    jmp         0069DE17
 0069DDBD    mov         bl,1
 0069DDBF    fld         qword ptr [ebp+8]
 0069DDC2    call        @ROUND
 0069DDC7    mov         [0081ED6C],eax;gvar_0081ED6C:Single
 0069DDCC    mov         ax,133F
 0069DDD0    call        Set8087CW
 0069DDD5    fld         qword ptr ds:[81ED70];gvar_0081ED70:Double
 0069DDDB    add         esp,0FFFFFFFC
 0069DDDE    fstp        dword ptr [esp]
 0069DDE1    wait
 0069DDE2    mov         eax,[0081ED6C];gvar_0081ED6C:Single
 0069DDE7    push        eax
 0069DDE8    call        P5DLL.P5_SetFilterAmount
>0069DDED    jmp         0069DE17
 0069DDEF    mov         bl,1
 0069DDF1    mov         ax,133F
 0069DDF5    call        Set8087CW
 0069DDFA    push        dword ptr [ebp+0C]
 0069DDFD    push        dword ptr [ebp+8]
 0069DE00    call        00686060
 0069DE05    neg         al
 0069DE07    sbb         eax,eax
 0069DE09    push        eax
 0069DE0A    mov         eax,dword ptr [esi+18];TGloveValue.........................................................
 0069DE0D    push        eax
 0069DE0E    call        P5DLL.P5_SetMouseState
>0069DE13    jmp         0069DE17
 0069DE15    xor         ebx,ebx
 0069DE17    mov         eax,ebx
 0069DE19    pop         esi
 0069DE1A    pop         ebx
 0069DE1B    pop         ebp
 0069DE1C    ret         8
end;*}

//0069DE20
{*procedure TGloveValue.ToString(?:?);
begin
 0069DE20    push        ebp
 0069DE21    mov         ebp,esp
 0069DE23    push        0
 0069DE25    push        ebx
 0069DE26    push        esi
 0069DE27    mov         esi,edx
 0069DE29    mov         ebx,eax
 0069DE2B    xor         eax,eax
 0069DE2D    push        ebp
 0069DE2E    push        69DE69
 0069DE33    push        dword ptr fs:[eax]
 0069DE36    mov         dword ptr fs:[eax],esp
 0069DE39    lea         edx,[ebp-4]
 0069DE3C    mov         eax,dword ptr [ebx+20];TGloveValue.......................................Item:Integer
 0069DE3F    call        006992EC
 0069DE44    mov         ecx,dword ptr [ebp-4]
 0069DE47    mov         eax,esi
 0069DE49    mov         edx,69DE84;'P5.'
 0069DE4E    call        @UStrCat3
 0069DE53    xor         eax,eax
 0069DE55    pop         edx
 0069DE56    pop         ecx
 0069DE57    pop         ecx
 0069DE58    mov         dword ptr fs:[eax],edx
 0069DE5B    push        69DE70
 0069DE60    lea         eax,[ebp-4]
 0069DE63    call        @UStrClr
 0069DE68    ret
>0069DE69    jmp         @HandleFinally
>0069DE6E    jmp         0069DE60
 0069DE70    pop         esi
 0069DE71    pop         ebx
 0069DE72    pop         ecx
 0069DE73    pop         ebp
 0069DE74    ret
end;*}

//0069DE8C
procedure sub_0069DE8C;
begin
{*
 0069DE8C    push        ebp
 0069DE8D    mov         ebp,esp
 0069DE8F    push        0
 0069DE91    push        0
 0069DE93    push        0
 0069DE95    push        ebx
 0069DE96    push        esi
 0069DE97    push        edi
 0069DE98    xor         eax,eax
 0069DE9A    push        ebp
 0069DE9B    push        69E057
 0069DEA0    push        dword ptr fs:[eax]
 0069DEA3    mov         dword ptr fs:[eax],esp
 0069DEA6    lea         ecx,[ebp-0C]
 0069DEA9    mov         dl,1
 0069DEAB    movzx       eax,byte ptr ds:[78BE00];0x0 gvar_0078BE00
 0069DEB2    call        BoolToStr
 0069DEB7    mov         ecx,dword ptr [ebp-0C]
 0069DEBA    lea         eax,[ebp-8]
 0069DEBD    mov         edx,69E074;'************************* '
 0069DEC2    call        @UStrCat3
 0069DEC7    mov         eax,dword ptr [ebp-8]
 0069DECA    call        004FA5FC
 0069DECF    cmp         byte ptr ds:[78BE00],0;gvar_0078BE00
>0069DED6    jne         0069DEE4
 0069DED8    xor         eax,eax
 0069DEDA    mov         [0078BE04],eax;gvar_0078BE04:Pointer
>0069DEDF    jmp         0069E03C
 0069DEE4    mov         eax,69E0B8;'Start Glove Monitor'
 0069DEE9    call        004FA5FC
 0069DEEE    call        00699BD8
 0069DEF3    test        al,al
>0069DEF5    jne         0069E03C
 0069DEFB    mov         eax,[0078DAD4];^gvar_00784024
 0069DF00    movzx       eax,word ptr [eax]
 0069DF03    mov         word ptr [ebp-2],ax
 0069DF07    mov         ax,133F
 0069DF0B    call        Set8087CW
 0069DF10    xor         eax,eax
 0069DF12    push        ebp
 0069DF13    push        69DF2D
 0069DF18    push        dword ptr fs:[eax]
 0069DF1B    mov         dword ptr fs:[eax],esp
 0069DF1E    call        P5DLL.P5_Init
 0069DF23    xor         eax,eax
 0069DF25    pop         edx
 0069DF26    pop         ecx
 0069DF27    pop         ecx
 0069DF28    mov         dword ptr fs:[eax],edx
>0069DF2B    jmp         0069DF37
>0069DF2D    jmp         @HandleAnyException
 0069DF32    call        @DoneExcept
 0069DF37    call        P5DLL.P5_GetCount
 0069DF3C    mov         [0081ED78],eax;gvar_0081ED78:Single
 0069DF41    cmp         dword ptr ds:[81ED78],0;gvar_0081ED78:Single
>0069DF48    jle         0069DFE0
 0069DF4E    push        3
 0069DF50    call        P5DLL.P5_SetFilterMode
 0069DF55    push        40E00000
 0069DF5A    push        14
 0069DF5C    call        P5DLL.P5_SetFilterAmount
 0069DF61    push        0
 0069DF63    call        P5DLL.P5_GetStatePointer
 0069DF68    mov         [0078BE04],eax;gvar_0078BE04:Pointer
 0069DF6D    mov         eax,[0081ED78];gvar_0081ED78:Single
 0069DF72    push        eax
 0069DF73    mov         eax,81ED7C;gvar_0081ED7C:?
 0069DF78    mov         ecx,1
 0069DF7D    mov         edx,dword ptr ds:[698DBC];:4
 0069DF83    call        @DynArraySetLength
 0069DF88    add         esp,4
 0069DF8B    mov         eax,[0081ED78];gvar_0081ED78:Single
 0069DF90    push        eax
 0069DF91    mov         eax,81ED80;gvar_0081ED80:?
 0069DF96    mov         ecx,1
 0069DF9B    mov         edx,dword ptr ds:[698DE0];:5
 0069DFA1    call        @DynArraySetLength
 0069DFA6    add         esp,4
 0069DFA9    mov         esi,dword ptr ds:[81ED78];gvar_0081ED78:Single
 0069DFAF    dec         esi
 0069DFB0    test        esi,esi
>0069DFB2    jl          0069E009
 0069DFB4    inc         esi
 0069DFB5    xor         ebx,ebx
 0069DFB7    push        ebx
 0069DFB8    call        P5DLL.P5_GetInfoPointer
 0069DFBD    cmp         dword ptr [eax+744],1
 0069DFC4    sete        al
 0069DFC7    mov         edx,dword ptr ds:[81ED7C];gvar_0081ED7C:?
 0069DFCD    mov         byte ptr [edx+ebx],al
 0069DFD0    mov         eax,[0081ED80];gvar_0081ED80:?
 0069DFD5    xor         edx,edx
 0069DFD7    mov         dword ptr [eax+ebx*4],edx
 0069DFDA    inc         ebx
 0069DFDB    dec         esi
>0069DFDC    jne         0069DFB7
>0069DFDE    jmp         0069E009
 0069DFE0    mov         eax,2D8
 0069DFE5    call        @GetMem
 0069DFEA    mov         [0078BE04],eax;gvar_0078BE04:Pointer
 0069DFEF    push        0
 0069DFF1    mov         eax,81ED7C;gvar_0081ED7C:?
 0069DFF6    mov         ecx,1
 0069DFFB    mov         edx,dword ptr ds:[698DBC];:4
 0069E001    call        @DynArraySetLength
 0069E006    add         esp,4
 0069E009    movzx       eax,word ptr [ebp-2]
 0069E00D    call        Set8087CW
 0069E012    mov         byte ptr ds:[81ED68],1;gvar_0081ED68:Boolean
 0069E019    mov         byte ptr ds:[81ED69],1;gvar_0081ED69:Boolean
 0069E020    mov         dword ptr ds:[81ED6C],14;gvar_0081ED6C:Single
 0069E02A    xor         eax,eax
 0069E02C    mov         dword ptr ds:[81ED70],eax;gvar_0081ED70:Double
 0069E032    mov         dword ptr ds:[81ED74],401C0000;gvar_0081ED74
 0069E03C    xor         eax,eax
 0069E03E    pop         edx
 0069E03F    pop         ecx
 0069E040    pop         ecx
 0069E041    mov         dword ptr fs:[eax],edx
 0069E044    push        69E05E
 0069E049    lea         eax,[ebp-0C]
 0069E04C    mov         edx,2
 0069E051    call        @UStrArrayClr
 0069E056    ret
>0069E057    jmp         @HandleFinally
>0069E05C    jmp         0069E049
 0069E05E    pop         edi
 0069E05F    pop         esi
 0069E060    pop         ebx
 0069E061    mov         esp,ebp
 0069E063    pop         ebp
 0069E064    ret
*}
end;

//0069E0E0
procedure sub_0069E0E0;
begin
{*
 0069E0E0    push        ebp
 0069E0E1    mov         ebp,esp
 0069E0E3    push        ebx
 0069E0E4    push        esi
 0069E0E5    push        edi
 0069E0E6    call        00699BD8
 0069E0EB    test        al,al
>0069E0ED    je          0069E140
 0069E0EF    mov         eax,69E154;'StopGloveMonitor'
 0069E0F4    call        004FA5FC
 0069E0F9    xor         eax,eax
 0069E0FB    push        ebp
 0069E0FC    push        69E136
 0069E101    push        dword ptr fs:[eax]
 0069E104    mov         dword ptr fs:[eax],esp
 0069E107    xor         eax,eax
 0069E109    mov         [0078BE04],eax;gvar_0078BE04:Pointer
 0069E10E    mov         ebx,dword ptr ds:[78DAD4];^gvar_00784024
 0069E114    movzx       ebx,word ptr [ebx]
 0069E117    mov         ax,133F
 0069E11B    call        Set8087CW
 0069E120    call        P5DLL.P5_Close
 0069E125    mov         eax,ebx
 0069E127    call        Set8087CW
 0069E12C    xor         eax,eax
 0069E12E    pop         edx
 0069E12F    pop         ecx
 0069E130    pop         ecx
 0069E131    mov         dword ptr fs:[eax],edx
>0069E134    jmp         0069E140
>0069E136    jmp         @HandleAnyException
 0069E13B    call        @DoneExcept
 0069E140    pop         edi
 0069E141    pop         esi
 0069E142    pop         ebx
 0069E143    pop         ebp
 0069E144    ret
*}
end;

//0069E178
procedure sub_0069E178;
begin
{*
 0069E178    push        ebx
 0069E179    push        esi
 0069E17A    push        ecx
 0069E17B    mov         eax,69E1F8;^338:Single
 0069E180    call        004FA5FC
 0069E185    call        00699BD8
 0069E18A    mov         ebx,eax
 0069E18C    xor         bl,1
 0069E18F    movzx       eax,byte ptr ds:[78BE00];0x0 gvar_0078BE00
 0069E196    mov         byte ptr [esp],al
 0069E199    test        bl,bl
>0069E19B    je          0069E1A9
 0069E19D    mov         byte ptr ds:[78BE00],1;gvar_0078BE00
 0069E1A4    call        0069DE8C
 0069E1A9    mov         esi,dword ptr ds:[78DAD4];^gvar_00784024
 0069E1AF    movzx       esi,word ptr [esi]
 0069E1B2    mov         ax,133F
 0069E1B6    call        Set8087CW
 0069E1BB    cmp         dword ptr ds:[81ED78],0;gvar_0081ED78:Single
>0069E1C2    jle         0069E1CD
 0069E1C4    push        0
 0069E1C6    push        0FF
 0069E1C8    call        P5DLL.P5_SetMouseState
 0069E1CD    mov         eax,esi
 0069E1CF    call        Set8087CW
 0069E1D4    test        bl,bl
>0069E1D6    je          0069E1E6
 0069E1D8    call        0069E0E0
 0069E1DD    movzx       eax,byte ptr [esp]
 0069E1E1    mov         [0078BE00],al;gvar_0078BE00
 0069E1E6    pop         edx
 0069E1E7    pop         esi
 0069E1E8    pop         ebx
 0069E1E9    ret
*}
end;

//0069E220
{*function sub_0069E220(?:string):?;
begin
 0069E220    push        ebp
 0069E221    mov         ebp,esp
 0069E223    add         esp,0FFFFFFF8
 0069E226    push        ebx
 0069E227    push        esi
 0069E228    push        edi
 0069E229    xor         edx,edx
 0069E22B    mov         dword ptr [ebp-8],edx
 0069E22E    mov         dword ptr [ebp-4],eax
 0069E231    mov         eax,dword ptr [ebp-4]
 0069E234    call        @UStrAddRef
 0069E239    xor         eax,eax
 0069E23B    push        ebp
 0069E23C    push        69E358
 0069E241    push        dword ptr fs:[eax]
 0069E244    mov         dword ptr fs:[eax],esp
 0069E247    xor         esi,esi
 0069E249    lea         eax,[ebp-8]
 0069E24C    mov         edx,dword ptr [ebp-4]
 0069E24F    call        @UStrLAsg
 0069E254    lea         eax,[ebp-8]
 0069E257    mov         edx,69E374;'p5'
 0069E25C    call        004F9BD0
 0069E261    test        al,al
>0069E263    jne         0069E2B6
 0069E265    lea         eax,[ebp-8]
 0069E268    mov         edx,69E388;'glove'
 0069E26D    call        004F9BD0
 0069E272    test        al,al
>0069E274    jne         0069E2B6
 0069E276    lea         eax,[ebp-8]
 0069E279    mov         edx,69E3A0;'p5glove'
 0069E27E    call        004F9BD0
 0069E283    test        al,al
>0069E285    jne         0069E2B6
 0069E287    lea         eax,[ebp-8]
 0069E28A    mov         edx,69E3BC;'lefthand'
 0069E28F    call        004F9BD0
 0069E294    test        al,al
>0069E296    jne         0069E33D
 0069E29C    lea         eax,[ebp-8]
 0069E29F    mov         edx,69E3DC;'righthand'
 0069E2A4    call        004F9BD0
 0069E2A9    test        al,al
>0069E2AB    jne         0069E33D
>0069E2B1    jmp         0069E33D
 0069E2B6    lea         eax,[ebp-8]
 0069E2B9    call        004F9D00
 0069E2BE    mov         ebx,eax
 0069E2C0    dec         ebx
 0069E2C1    lea         eax,[ebp-8]
 0069E2C4    mov         edx,69E3FC;'.'
 0069E2C9    call        004F9BD0
 0069E2CE    test        al,al
>0069E2D0    je          0069E33D
 0069E2D2    cmp         ebx,0FFFFFFFF
>0069E2D5    jge         0069E304
 0069E2D7    lea         eax,[ebp-8]
 0069E2DA    mov         edx,69E388;'glove'
 0069E2DF    call        004F9BD0
 0069E2E4    test        al,al
>0069E2E6    je          0069E304
 0069E2E8    lea         eax,[ebp-8]
 0069E2EB    call        004F9D00
 0069E2F0    mov         ebx,eax
 0069E2F2    dec         ebx
 0069E2F3    lea         eax,[ebp-8]
 0069E2F6    mov         edx,69E3FC;'.'
 0069E2FB    call        004F9BD0
 0069E300    test        al,al
>0069E302    je          0069E33D
 0069E304    mov         eax,dword ptr [ebp-8]
 0069E307    call        00699278
 0069E30C    mov         edi,eax
 0069E30E    test        edi,edi
>0069E310    jl          0069E33D
 0069E312    mov         dl,1
 0069E314    mov         eax,[00698468];TGloveValue
 0069E319    call        TGloveValue.Create;TGloveValue.Create
 0069E31E    mov         esi,eax
 0069E320    mov         dword ptr [esi+20],edi;TGloveValue........................................Item:Integer
 0069E323    test        ebx,ebx
>0069E325    jge         0069E329
 0069E327    xor         ebx,ebx
 0069E329    mov         dword ptr [esi+18],ebx;TGloveValue.........................................................
 0069E32C    mov         eax,69E40C;'Creating glove value'
 0069E331    call        004FA5FC
 0069E336    mov         byte ptr ds:[78BE00],1;gvar_0078BE00
 0069E33D    xor         eax,eax
 0069E33F    pop         edx
 0069E340    pop         ecx
 0069E341    pop         ecx
 0069E342    mov         dword ptr fs:[eax],edx
 0069E345    push        69E35F
 0069E34A    lea         eax,[ebp-8]
 0069E34D    mov         edx,2
 0069E352    call        @UStrArrayClr
 0069E357    ret
>0069E358    jmp         @HandleFinally
>0069E35D    jmp         0069E34A
 0069E35F    mov         eax,esi
 0069E361    pop         edi
 0069E362    pop         esi
 0069E363    pop         ebx
 0069E364    pop         ecx
 0069E365    pop         ecx
 0069E366    pop         ebp
 0069E367    ret
end;*}

//0069E438
procedure sub_0069E438;
begin
{*
 0069E438    push        ebx
 0069E439    push        esi
 0069E43A    push        edi
 0069E43B    push        ebp
 0069E43C    add         esp,0FFFFFFB8
 0069E43F    cmp         byte ptr ds:[78BE00],0;gvar_0078BE00
>0069E446    je          0069E690
 0069E44C    mov         edi,dword ptr ds:[81ED78];gvar_0081ED78:Single
 0069E452    dec         edi
 0069E453    test        edi,edi
>0069E455    jl          0069E690
 0069E45B    inc         edi
 0069E45C    xor         esi,esi
 0069E45E    mov         ebp,dword ptr ds:[78DAD4];^gvar_00784024
 0069E464    movzx       ebp,word ptr [ebp]
 0069E468    mov         ax,133F
 0069E46C    call        Set8087CW
 0069E471    push        esi
 0069E472    call        P5DLL.P5_GetStatePointer
 0069E477    mov         ebx,eax
 0069E479    mov         eax,ebp
 0069E47B    call        Set8087CW
 0069E480    test        ebx,ebx
>0069E482    je          0069E688
 0069E488    cmp         dword ptr [ebx+0C0],0
>0069E48F    je          0069E688
 0069E495    mov         eax,[0081ED80];gvar_0081ED80:?
 0069E49A    xor         edx,edx
 0069E49C    mov         dword ptr [eax+esi*4],edx
 0069E49F    xor         eax,eax
 0069E4A1    cmp         byte ptr [ebx+eax+22C],0FF
>0069E4A9    je          0069E517
 0069E4AB    lea         edx,[eax+eax*2]
 0069E4AE    mov         ecx,dword ptr [ebx+edx*4+238]
 0069E4B5    cmp         ecx,15E
>0069E4BB    jl          0069E4CC
 0069E4BD    mov         ecx,dword ptr ds:[81ED80];gvar_0081ED80:?
 0069E4C3    mov         dword ptr [ecx+esi*4],1
>0069E4CA    jmp         0069E4E1
 0069E4CC    cmp         ecx,0FFFFFEA2
>0069E4D2    jg          0069E4E1
 0069E4D4    mov         ecx,dword ptr ds:[81ED80];gvar_0081ED80:?
 0069E4DA    mov         dword ptr [ecx+esi*4],2
 0069E4E1    cmp         dword ptr [ebx+edx*4+230],15E
>0069E4EC    jl          0069E4FD
 0069E4EE    mov         edx,dword ptr ds:[81ED80];gvar_0081ED80:?
 0069E4F4    mov         dword ptr [edx+esi*4],3
>0069E4FB    jmp         0069E517
 0069E4FD    cmp         dword ptr [ebx+edx*4+234],0FFFFFEA2
>0069E508    jg          0069E517
 0069E50A    mov         edx,dword ptr ds:[81ED80];gvar_0081ED80:?
 0069E510    mov         dword ptr [edx+esi*4],4
 0069E517    inc         eax
 0069E518    cmp         eax,4
>0069E51B    jne         0069E4A1
 0069E51D    fld         dword ptr [ebx+2C]
 0069E520    fcomp       dword ptr ds:[69E698];-300:Single
 0069E526    wait
 0069E527    fnstsw      al
 0069E529    sahf
>0069E52A    jbe         0069E53A
 0069E52C    mov         eax,[0081ED80];gvar_0081ED80:?
 0069E531    mov         dword ptr [eax+esi*4],5
>0069E538    jmp         0069E555
 0069E53A    fld         dword ptr [ebx+2C]
 0069E53D    fcomp       dword ptr ds:[69E69C];-2100:Single
 0069E543    wait
 0069E544    fnstsw      al
 0069E546    sahf
>0069E547    jae         0069E555
 0069E549    mov         eax,[0081ED80];gvar_0081ED80:?
 0069E54E    mov         dword ptr [eax+esi*4],6
 0069E555    mov         eax,[0081ED80];gvar_0081ED80:?
 0069E55A    cmp         dword ptr [eax+esi*4],0
>0069E55E    jne         0069E688
 0069E564    cmp         dword ptr [ebx+228],3
>0069E56B    jl          0069E57E
 0069E56D    mov         eax,[0081ED80];gvar_0081ED80:?
 0069E572    mov         dword ptr [eax+esi*4],8
>0069E579    jmp         0069E688
 0069E57E    fld         dword ptr [ebx+8C]
 0069E584    fabs
 0069E586    fstp        tbyte ptr [esp]
 0069E589    wait
 0069E58A    fld         dword ptr [ebx+88]
 0069E590    fabs
 0069E592    fld         tbyte ptr [esp]
 0069E595    fcompp
 0069E597    wait
 0069E598    fnstsw      al
 0069E59A    sahf
>0069E59B    jbe         0069E628
 0069E5A1    fld         dword ptr [ebx+8C]
 0069E5A7    fabs
 0069E5A9    fstp        tbyte ptr [esp+0C]
 0069E5AD    wait
 0069E5AE    fld         dword ptr [ebx+84]
 0069E5B4    fabs
 0069E5B6    fld         tbyte ptr [esp+0C]
 0069E5BA    fcompp
 0069E5BC    wait
 0069E5BD    fnstsw      al
 0069E5BF    sahf
>0069E5C0    jbe         0069E628
 0069E5C2    fld         dword ptr [ebx+8C]
 0069E5C8    fcomp       dword ptr ds:[69E6A0];0:Single
 0069E5CE    wait
 0069E5CF    fnstsw      al
 0069E5D1    sahf
>0069E5D2    jae         0069E628
 0069E5D4    fld         dword ptr [ebx+94]
 0069E5DA    fabs
 0069E5DC    fstp        tbyte ptr [esp+18]
 0069E5E0    wait
 0069E5E1    fld         dword ptr [ebx+90]
 0069E5E7    fabs
 0069E5E9    fld         tbyte ptr [esp+18]
 0069E5ED    fcompp
 0069E5EF    wait
 0069E5F0    fnstsw      al
 0069E5F2    sahf
>0069E5F3    jbe         0069E628
 0069E5F5    fld         dword ptr [ebx+94]
 0069E5FB    fabs
 0069E5FD    fstp        tbyte ptr [esp+24]
 0069E601    wait
 0069E602    fld         dword ptr [ebx+98]
 0069E608    fabs
 0069E60A    fld         tbyte ptr [esp+24]
 0069E60E    fcompp
 0069E610    wait
 0069E611    fnstsw      al
 0069E613    sahf
>0069E614    jbe         0069E628
 0069E616    fld         dword ptr [ebx+94]
 0069E61C    fcomp       dword ptr ds:[69E6A0];0:Single
 0069E622    wait
 0069E623    fnstsw      al
 0069E625    sahf
>0069E626    ja          0069E67C
 0069E628    fld         dword ptr [ebx+98]
 0069E62E    fabs
 0069E630    fstp        tbyte ptr [esp+30]
 0069E634    wait
 0069E635    fld         dword ptr [ebx+94]
 0069E63B    fabs
 0069E63D    fld         tbyte ptr [esp+30]
 0069E641    fcompp
 0069E643    wait
 0069E644    fnstsw      al
 0069E646    sahf
>0069E647    jbe         0069E688
 0069E649    fld         dword ptr [ebx+98]
 0069E64F    fabs
 0069E651    fstp        tbyte ptr [esp+3C]
 0069E655    wait
 0069E656    fld         dword ptr [ebx+90]
 0069E65C    fabs
 0069E65E    fld         tbyte ptr [esp+3C]
 0069E662    fcompp
 0069E664    wait
 0069E665    fnstsw      al
 0069E667    sahf
>0069E668    jbe         0069E688
 0069E66A    fld         dword ptr [ebx+98]
 0069E670    fcomp       dword ptr ds:[69E6A0];0:Single
 0069E676    wait
 0069E677    fnstsw      al
 0069E679    sahf
>0069E67A    jae         0069E688
 0069E67C    mov         eax,[0081ED80];gvar_0081ED80:?
 0069E681    mov         dword ptr [eax+esi*4],9
 0069E688    inc         esi
 0069E689    dec         edi
>0069E68A    jne         0069E45E
 0069E690    add         esp,48
 0069E693    pop         ebp
 0069E694    pop         edi
 0069E695    pop         esi
 0069E696    pop         ebx
 0069E697    ret
*}
end;

//0069E6A4
procedure TModuleP5.AddFields;
begin
{*
 0069E6A4    push        ebp
 0069E6A5    mov         ebp,esp
 0069E6A7    mov         ecx,54
 0069E6AC    push        0
 0069E6AE    push        0
 0069E6B0    dec         ecx
>0069E6B1    jne         0069E6AC
 0069E6B3    push        ecx
 0069E6B4    push        ebx
 0069E6B5    push        esi
 0069E6B6    push        edi
 0069E6B7    mov         dword ptr [ebp-4],eax
 0069E6BA    xor         eax,eax
 0069E6BC    push        ebp
 0069E6BD    push        6A32D9
 0069E6C2    push        dword ptr fs:[eax]
 0069E6C5    mov         dword ptr fs:[eax],esp
 0069E6C8    mov         eax,dword ptr [ebp-4]
 0069E6CB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E6CE    mov         ecx,1
 0069E6D3    mov         edx,6A32F4;'Thumb'
 0069E6D8    call        THashTable.Add
 0069E6DD    mov         eax,dword ptr [ebp-4]
 0069E6E0    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E6E3    mov         ecx,2
 0069E6E8    mov         edx,6A330C;'Index'
 0069E6ED    call        THashTable.Add
 0069E6F2    mov         eax,dword ptr [ebp-4]
 0069E6F5    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E6F8    mov         ecx,3
 0069E6FD    mov         edx,6A3324;'Middle'
 0069E702    call        THashTable.Add
 0069E707    mov         eax,dword ptr [ebp-4]
 0069E70A    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E70D    mov         ecx,4
 0069E712    mov         edx,6A3340;'Ring'
 0069E717    call        THashTable.Add
 0069E71C    mov         eax,dword ptr [ebp-4]
 0069E71F    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E722    mov         ecx,5
 0069E727    mov         edx,6A3358;'Pinky'
 0069E72C    call        THashTable.Add
 0069E731    mov         eax,dword ptr [ebp-4]
 0069E734    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E737    mov         ecx,6
 0069E73C    mov         edx,6A3370;'A'
 0069E741    call        THashTable.Add
 0069E746    mov         eax,dword ptr [ebp-4]
 0069E749    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E74C    mov         ecx,7
 0069E751    mov         edx,6A3380;'B'
 0069E756    call        THashTable.Add
 0069E75B    mov         eax,dword ptr [ebp-4]
 0069E75E    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E761    mov         ecx,8
 0069E766    mov         edx,6A3390;'C'
 0069E76B    call        THashTable.Add
 0069E770    mov         eax,dword ptr [ebp-4]
 0069E773    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E776    mov         ecx,9
 0069E77B    mov         edx,6A33A0;'D'
 0069E780    call        THashTable.Add
 0069E785    mov         eax,dword ptr [ebp-4]
 0069E788    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E78B    mov         ecx,0A
 0069E790    mov         edx,6A33B0;'x'
 0069E795    call        THashTable.Add
 0069E79A    mov         eax,dword ptr [ebp-4]
 0069E79D    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E7A0    mov         ecx,0B
 0069E7A5    mov         edx,6A33C0;'y'
 0069E7AA    call        THashTable.Add
 0069E7AF    mov         eax,dword ptr [ebp-4]
 0069E7B2    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E7B5    mov         ecx,0C
 0069E7BA    mov         edx,6A33D0;'z'
 0069E7BF    call        THashTable.Add
 0069E7C4    mov         eax,dword ptr [ebp-4]
 0069E7C7    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E7CA    mov         ecx,0D
 0069E7CF    mov         edx,6A33E0;'pitch'
 0069E7D4    call        THashTable.Add
 0069E7D9    mov         eax,dword ptr [ebp-4]
 0069E7DC    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E7DF    mov         ecx,0E
 0069E7E4    mov         edx,6A33F8;'yaw'
 0069E7E9    call        THashTable.Add
 0069E7EE    mov         eax,dword ptr [ebp-4]
 0069E7F1    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E7F4    mov         ecx,0F
 0069E7F9    mov         edx,6A340C;'roll'
 0069E7FE    call        THashTable.Add
 0069E803    mov         eax,dword ptr [ebp-4]
 0069E806    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E809    mov         ecx,10
 0069E80E    mov         edx,6A3424;'XVelocity'
 0069E813    call        THashTable.Add
 0069E818    mov         eax,dword ptr [ebp-4]
 0069E81B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E81E    mov         ecx,11
 0069E823    mov         edx,6A3444;'YVelocity'
 0069E828    call        THashTable.Add
 0069E82D    mov         eax,dword ptr [ebp-4]
 0069E830    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E833    mov         ecx,12
 0069E838    mov         edx,6A3464;'ZVelocity'
 0069E83D    call        THashTable.Add
 0069E842    mov         eax,dword ptr [ebp-4]
 0069E845    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E848    mov         ecx,10
 0069E84D    mov         edx,6A3484;'xv'
 0069E852    call        THashTable.Add
 0069E857    mov         eax,dword ptr [ebp-4]
 0069E85A    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E85D    mov         ecx,11
 0069E862    mov         edx,6A3498;'yv'
 0069E867    call        THashTable.Add
 0069E86C    mov         eax,dword ptr [ebp-4]
 0069E86F    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E872    mov         ecx,12
 0069E877    mov         edx,6A34AC;'zv'
 0069E87C    call        THashTable.Add
 0069E881    mov         eax,dword ptr [ebp-4]
 0069E884    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E887    mov         ecx,1
 0069E88C    mov         edx,6A34C0;'Finger0'
 0069E891    call        THashTable.Add
 0069E896    mov         eax,dword ptr [ebp-4]
 0069E899    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E89C    mov         ecx,2
 0069E8A1    mov         edx,6A34DC;'Finger1'
 0069E8A6    call        THashTable.Add
 0069E8AB    mov         eax,dword ptr [ebp-4]
 0069E8AE    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E8B1    mov         ecx,3
 0069E8B6    mov         edx,6A34F8;'Finger2'
 0069E8BB    call        THashTable.Add
 0069E8C0    mov         eax,dword ptr [ebp-4]
 0069E8C3    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E8C6    mov         ecx,4
 0069E8CB    mov         edx,6A3514;'Finger3'
 0069E8D0    call        THashTable.Add
 0069E8D5    mov         eax,dword ptr [ebp-4]
 0069E8D8    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E8DB    mov         ecx,5
 0069E8E0    mov         edx,6A3530;'Finger4'
 0069E8E5    call        THashTable.Add
 0069E8EA    mov         eax,dword ptr [ebp-4]
 0069E8ED    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E8F0    mov         ecx,6
 0069E8F5    mov         edx,6A354C;'AButton'
 0069E8FA    call        THashTable.Add
 0069E8FF    mov         eax,dword ptr [ebp-4]
 0069E902    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E905    mov         ecx,7
 0069E90A    mov         edx,6A3568;'BButton'
 0069E90F    call        THashTable.Add
 0069E914    mov         eax,dword ptr [ebp-4]
 0069E917    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E91A    mov         ecx,8
 0069E91F    mov         edx,6A3584;'CButton'
 0069E924    call        THashTable.Add
 0069E929    mov         eax,dword ptr [ebp-4]
 0069E92C    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E92F    mov         ecx,9
 0069E934    mov         edx,6A35A0;'DButton'
 0069E939    call        THashTable.Add
 0069E93E    mov         eax,dword ptr [ebp-4]
 0069E941    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E944    mov         ecx,6
 0069E949    mov         edx,6A35BC;'ButtonA'
 0069E94E    call        THashTable.Add
 0069E953    mov         eax,dword ptr [ebp-4]
 0069E956    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E959    mov         ecx,7
 0069E95E    mov         edx,6A35D8;'ButtonB'
 0069E963    call        THashTable.Add
 0069E968    mov         eax,dword ptr [ebp-4]
 0069E96B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E96E    mov         ecx,8
 0069E973    mov         edx,6A35F4;'ButtonC'
 0069E978    call        THashTable.Add
 0069E97D    mov         eax,dword ptr [ebp-4]
 0069E980    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E983    mov         ecx,9
 0069E988    mov         edx,6A3610;'ButtonD'
 0069E98D    call        THashTable.Add
 0069E992    mov         eax,dword ptr [ebp-4]
 0069E995    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E998    mov         ecx,6
 0069E99D    mov         edx,6A362C;'Button1'
 0069E9A2    call        THashTable.Add
 0069E9A7    mov         eax,dword ptr [ebp-4]
 0069E9AA    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E9AD    mov         ecx,7
 0069E9B2    mov         edx,6A3648;'Button2'
 0069E9B7    call        THashTable.Add
 0069E9BC    mov         eax,dword ptr [ebp-4]
 0069E9BF    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E9C2    mov         ecx,8
 0069E9C7    mov         edx,6A3664;'Button3'
 0069E9CC    call        THashTable.Add
 0069E9D1    mov         eax,dword ptr [ebp-4]
 0069E9D4    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E9D7    mov         ecx,9
 0069E9DC    mov         edx,6A3680;'Button4'
 0069E9E1    call        THashTable.Add
 0069E9E6    mov         eax,dword ptr [ebp-4]
 0069E9E9    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069E9EC    mov         ecx,9
 0069E9F1    mov         edx,6A369C;'PowerButton'
 0069E9F6    call        THashTable.Add
 0069E9FB    mov         eax,dword ptr [ebp-4]
 0069E9FE    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EA01    mov         ecx,0A
 0069EA06    mov         edx,6A36C0;'FilterX'
 0069EA0B    call        THashTable.Add
 0069EA10    mov         eax,dword ptr [ebp-4]
 0069EA13    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EA16    mov         ecx,0B
 0069EA1B    mov         edx,6A36DC;'FilterY'
 0069EA20    call        THashTable.Add
 0069EA25    mov         eax,dword ptr [ebp-4]
 0069EA28    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EA2B    mov         ecx,0C
 0069EA30    mov         edx,6A36F8;'FilterZ'
 0069EA35    call        THashTable.Add
 0069EA3A    mov         eax,dword ptr [ebp-4]
 0069EA3D    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EA40    mov         ecx,0D
 0069EA45    mov         edx,6A3714;'FilterPitch'
 0069EA4A    call        THashTable.Add
 0069EA4F    mov         eax,dword ptr [ebp-4]
 0069EA52    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EA55    mov         ecx,0E
 0069EA5A    mov         edx,6A3738;'FilterYaw'
 0069EA5F    call        THashTable.Add
 0069EA64    mov         eax,dword ptr [ebp-4]
 0069EA67    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EA6A    mov         ecx,0F
 0069EA6F    mov         edx,6A3758;'FilterRoll'
 0069EA74    call        THashTable.Add
 0069EA79    mov         eax,dword ptr [ebp-4]
 0069EA7C    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EA7F    mov         ecx,10
 0069EA84    mov         edx,6A377C;'VelocityX'
 0069EA89    call        THashTable.Add
 0069EA8E    mov         eax,dword ptr [ebp-4]
 0069EA91    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EA94    mov         ecx,11
 0069EA99    mov         edx,6A379C;'VelocityY'
 0069EA9E    call        THashTable.Add
 0069EAA3    mov         eax,dword ptr [ebp-4]
 0069EAA6    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EAA9    mov         ecx,12
 0069EAAE    mov         edx,6A37BC;'VelocityZ'
 0069EAB3    call        THashTable.Add
 0069EAB8    mov         eax,dword ptr [ebp-4]
 0069EABB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EABE    mov         ecx,13
 0069EAC3    mov         edx,6A37DC;'Count'
 0069EAC8    call        THashTable.Add
 0069EACD    mov         eax,dword ptr [ebp-4]
 0069EAD0    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EAD3    mov         ecx,14
 0069EAD8    mov         edx,6A37F4;'InRange'
 0069EADD    call        THashTable.Add
 0069EAE2    mov         eax,dword ptr [ebp-4]
 0069EAE5    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EAE8    mov         ecx,14
 0069EAED    mov         edx,6A3810;'Visible'
 0069EAF2    call        THashTable.Add
 0069EAF7    mov         eax,dword ptr [ebp-4]
 0069EAFA    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EAFD    mov         ecx,18
 0069EB02    mov         edx,6A382C;'LedsVisible'
 0069EB07    call        THashTable.Add
 0069EB0C    mov         eax,dword ptr [ebp-4]
 0069EB0F    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EB12    mov         ecx,18
 0069EB17    mov         edx,6A3850;'LedsInRange'
 0069EB1C    call        THashTable.Add
 0069EB21    mov         eax,dword ptr [ebp-4]
 0069EB24    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EB27    mov         ecx,15
 0069EB2C    mov         edx,6A3874;'XAcceleration'
 0069EB31    call        THashTable.Add
 0069EB36    mov         eax,dword ptr [ebp-4]
 0069EB39    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EB3C    mov         ecx,16
 0069EB41    mov         edx,6A389C;'YAcceleration'
 0069EB46    call        THashTable.Add
 0069EB4B    mov         eax,dword ptr [ebp-4]
 0069EB4E    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EB51    mov         ecx,17
 0069EB56    mov         edx,6A38C4;'ZAcceleration'
 0069EB5B    call        THashTable.Add
 0069EB60    mov         eax,dword ptr [ebp-4]
 0069EB63    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EB66    mov         ecx,15
 0069EB6B    mov         edx,6A38EC;'AccelerationX'
 0069EB70    call        THashTable.Add
 0069EB75    mov         eax,dword ptr [ebp-4]
 0069EB78    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EB7B    mov         ecx,16
 0069EB80    mov         edx,6A3914;'AccelerationY'
 0069EB85    call        THashTable.Add
 0069EB8A    mov         eax,dword ptr [ebp-4]
 0069EB8D    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EB90    mov         ecx,17
 0069EB95    mov         edx,6A393C;'AccelerationZ'
 0069EB9A    call        THashTable.Add
 0069EB9F    mov         eax,dword ptr [ebp-4]
 0069EBA2    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EBA5    mov         ecx,15
 0069EBAA    mov         edx,6A3964;'xacc'
 0069EBAF    call        THashTable.Add
 0069EBB4    mov         eax,dword ptr [ebp-4]
 0069EBB7    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EBBA    mov         ecx,16
 0069EBBF    mov         edx,6A397C;'yacc'
 0069EBC4    call        THashTable.Add
 0069EBC9    mov         eax,dword ptr [ebp-4]
 0069EBCC    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EBCF    mov         ecx,17
 0069EBD4    mov         edx,6A3994;'zacc'
 0069EBD9    call        THashTable.Add
 0069EBDE    mov         eax,dword ptr [ebp-4]
 0069EBE1    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EBE4    mov         ecx,19
 0069EBE9    mov         edx,6A39AC;'RelativeX'
 0069EBEE    call        THashTable.Add
 0069EBF3    mov         eax,dword ptr [ebp-4]
 0069EBF6    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EBF9    mov         ecx,1A
 0069EBFE    mov         edx,6A39CC;'RelativeY'
 0069EC03    call        THashTable.Add
 0069EC08    mov         eax,dword ptr [ebp-4]
 0069EC0B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EC0E    mov         ecx,1B
 0069EC13    mov         edx,6A39EC;'RelativeZ'
 0069EC18    call        THashTable.Add
 0069EC1D    mov         eax,dword ptr [ebp-4]
 0069EC20    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EC23    mov         ecx,19
 0069EC28    mov         edx,6A3A0C;'RelX'
 0069EC2D    call        THashTable.Add
 0069EC32    mov         eax,dword ptr [ebp-4]
 0069EC35    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EC38    mov         ecx,1A
 0069EC3D    mov         edx,6A3A24;'RelY'
 0069EC42    call        THashTable.Add
 0069EC47    mov         eax,dword ptr [ebp-4]
 0069EC4A    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EC4D    mov         ecx,1B
 0069EC52    mov         edx,6A3A3C;'RelZ'
 0069EC57    call        THashTable.Add
 0069EC5C    mov         eax,dword ptr [ebp-4]
 0069EC5F    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EC62    mov         ecx,19
 0069EC67    mov         edx,6A3A54;'XRelative'
 0069EC6C    call        THashTable.Add
 0069EC71    mov         eax,dword ptr [ebp-4]
 0069EC74    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EC77    mov         ecx,1A
 0069EC7C    mov         edx,6A3A74;'YRelative'
 0069EC81    call        THashTable.Add
 0069EC86    mov         eax,dword ptr [ebp-4]
 0069EC89    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EC8C    mov         ecx,1B
 0069EC91    mov         edx,6A3A94;'ZRelative'
 0069EC96    call        THashTable.Add
 0069EC9B    mov         eax,dword ptr [ebp-4]
 0069EC9E    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069ECA1    mov         ecx,19
 0069ECA6    mov         edx,6A3AB4;'Relative.X'
 0069ECAB    call        THashTable.Add
 0069ECB0    mov         eax,dword ptr [ebp-4]
 0069ECB3    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069ECB6    mov         ecx,1A
 0069ECBB    mov         edx,6A3AD8;'Relative.Y'
 0069ECC0    call        THashTable.Add
 0069ECC5    mov         eax,dword ptr [ebp-4]
 0069ECC8    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069ECCB    mov         ecx,1B
 0069ECD0    mov         edx,6A3AFC;'Relative.Z'
 0069ECD5    call        THashTable.Add
 0069ECDA    mov         eax,dword ptr [ebp-4]
 0069ECDD    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069ECE0    mov         ecx,19
 0069ECE5    mov         edx,6A3B20;'RelativePos.X'
 0069ECEA    call        THashTable.Add
 0069ECEF    mov         eax,dword ptr [ebp-4]
 0069ECF2    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069ECF5    mov         ecx,1A
 0069ECFA    mov         edx,6A3B48;'RelativePos.Y'
 0069ECFF    call        THashTable.Add
 0069ED04    mov         eax,dword ptr [ebp-4]
 0069ED07    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069ED0A    mov         ecx,1B
 0069ED0F    mov         edx,6A3B70;'RelativePos.Z'
 0069ED14    call        THashTable.Add
 0069ED19    mov         eax,dword ptr [ebp-4]
 0069ED1C    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069ED1F    mov         ecx,19
 0069ED24    mov         edx,6A3B98;'RelativePosX'
 0069ED29    call        THashTable.Add
 0069ED2E    mov         eax,dword ptr [ebp-4]
 0069ED31    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069ED34    mov         ecx,1A
 0069ED39    mov         edx,6A3BC0;'RelativePosY'
 0069ED3E    call        THashTable.Add
 0069ED43    mov         eax,dword ptr [ebp-4]
 0069ED46    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069ED49    mov         ecx,1B
 0069ED4E    mov         edx,6A3BE8;'RelativePosZ'
 0069ED53    call        THashTable.Add
 0069ED58    mov         eax,dword ptr [ebp-4]
 0069ED5B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069ED5E    mov         ecx,1C
 0069ED63    mov         edx,6A3C10;'AbsoluteX'
 0069ED68    call        THashTable.Add
 0069ED6D    mov         eax,dword ptr [ebp-4]
 0069ED70    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069ED73    mov         ecx,1D
 0069ED78    mov         edx,6A3C30;'AbsoluteY'
 0069ED7D    call        THashTable.Add
 0069ED82    mov         eax,dword ptr [ebp-4]
 0069ED85    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069ED88    mov         ecx,1E
 0069ED8D    mov         edx,6A3C50;'AbsoluteZ'
 0069ED92    call        THashTable.Add
 0069ED97    mov         eax,dword ptr [ebp-4]
 0069ED9A    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069ED9D    mov         ecx,1C
 0069EDA2    mov         edx,6A3C70;'AbsX'
 0069EDA7    call        THashTable.Add
 0069EDAC    mov         eax,dword ptr [ebp-4]
 0069EDAF    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EDB2    mov         ecx,1D
 0069EDB7    mov         edx,6A3C88;'AbsY'
 0069EDBC    call        THashTable.Add
 0069EDC1    mov         eax,dword ptr [ebp-4]
 0069EDC4    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EDC7    mov         ecx,1E
 0069EDCC    mov         edx,6A3CA0;'AbsZ'
 0069EDD1    call        THashTable.Add
 0069EDD6    mov         eax,dword ptr [ebp-4]
 0069EDD9    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EDDC    mov         ecx,1C
 0069EDE1    mov         edx,6A3CB8;'XAbsolute'
 0069EDE6    call        THashTable.Add
 0069EDEB    mov         eax,dword ptr [ebp-4]
 0069EDEE    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EDF1    mov         ecx,1D
 0069EDF6    mov         edx,6A3CD8;'YAbsolute'
 0069EDFB    call        THashTable.Add
 0069EE00    mov         eax,dword ptr [ebp-4]
 0069EE03    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EE06    mov         ecx,1E
 0069EE0B    mov         edx,6A3CF8;'ZAbsolute'
 0069EE10    call        THashTable.Add
 0069EE15    mov         eax,dword ptr [ebp-4]
 0069EE18    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EE1B    mov         ecx,1C
 0069EE20    mov         edx,6A3D18;'AbsolutePos.X'
 0069EE25    call        THashTable.Add
 0069EE2A    mov         eax,dword ptr [ebp-4]
 0069EE2D    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EE30    mov         ecx,1D
 0069EE35    mov         edx,6A3D40;'AbsolutePos.Y'
 0069EE3A    call        THashTable.Add
 0069EE3F    mov         eax,dword ptr [ebp-4]
 0069EE42    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EE45    mov         ecx,1E
 0069EE4A    mov         edx,6A3D68;'AbsolutePos.Z'
 0069EE4F    call        THashTable.Add
 0069EE54    mov         eax,dword ptr [ebp-4]
 0069EE57    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EE5A    mov         ecx,1C
 0069EE5F    mov         edx,6A3D90;'UnfilteredX'
 0069EE64    call        THashTable.Add
 0069EE69    mov         eax,dword ptr [ebp-4]
 0069EE6C    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EE6F    mov         ecx,1D
 0069EE74    mov         edx,6A3DB4;'UnfilteredY'
 0069EE79    call        THashTable.Add
 0069EE7E    mov         eax,dword ptr [ebp-4]
 0069EE81    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EE84    mov         ecx,1E
 0069EE89    mov         edx,6A3DD8;'UnfilteredZ'
 0069EE8E    call        THashTable.Add
 0069EE93    mov         eax,dword ptr [ebp-4]
 0069EE96    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EE99    mov         ecx,0B3
 0069EE9E    mov         edx,6A3DFC;'TopSensorHAngle'
 0069EEA3    call        THashTable.Add
 0069EEA8    mov         eax,dword ptr [ebp-4]
 0069EEAB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EEAE    mov         ecx,0B4
 0069EEB3    mov         edx,6A3E28;'TopSensorVAngle'
 0069EEB8    call        THashTable.Add
 0069EEBD    mov         eax,dword ptr [ebp-4]
 0069EEC0    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EEC3    mov         ecx,0B5
 0069EEC8    mov         edx,6A3E54;'BottomSensorHAngle'
 0069EECD    call        THashTable.Add
 0069EED2    mov         eax,dword ptr [ebp-4]
 0069EED5    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EED8    mov         ecx,0B6
 0069EEDD    mov         edx,6A3E88;'BottomSensorVAngle'
 0069EEE2    call        THashTable.Add
 0069EEE7    mov         eax,dword ptr [ebp-4]
 0069EEEA    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EEED    mov         ecx,0B7
 0069EEF2    mov         edx,6A3EBC;'HeadSeparation'
 0069EEF7    call        THashTable.Add
 0069EEFC    mov         eax,dword ptr [ebp-4]
 0069EEFF    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EF02    mov         ecx,1F
 0069EF07    mov         edx,6A3EE8;'mat11'
 0069EF0C    call        THashTable.Add
 0069EF11    mov         eax,dword ptr [ebp-4]
 0069EF14    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EF17    mov         ecx,20
 0069EF1C    mov         edx,6A3F00;'mat12'
 0069EF21    call        THashTable.Add
 0069EF26    mov         eax,dword ptr [ebp-4]
 0069EF29    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EF2C    mov         ecx,21
 0069EF31    mov         edx,6A3F18;'mat13'
 0069EF36    call        THashTable.Add
 0069EF3B    mov         eax,dword ptr [ebp-4]
 0069EF3E    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EF41    mov         ecx,22
 0069EF46    mov         edx,6A3F30;'mat21'
 0069EF4B    call        THashTable.Add
 0069EF50    mov         eax,dword ptr [ebp-4]
 0069EF53    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EF56    mov         ecx,23
 0069EF5B    mov         edx,6A3F48;'mat22'
 0069EF60    call        THashTable.Add
 0069EF65    mov         eax,dword ptr [ebp-4]
 0069EF68    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EF6B    mov         ecx,24
 0069EF70    mov         edx,6A3F60;'mat23'
 0069EF75    call        THashTable.Add
 0069EF7A    mov         eax,dword ptr [ebp-4]
 0069EF7D    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EF80    mov         ecx,25
 0069EF85    mov         edx,6A3F78;'mat31'
 0069EF8A    call        THashTable.Add
 0069EF8F    mov         eax,dword ptr [ebp-4]
 0069EF92    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EF95    mov         ecx,26
 0069EF9A    mov         edx,6A3F90;'mat32'
 0069EF9F    call        THashTable.Add
 0069EFA4    mov         eax,dword ptr [ebp-4]
 0069EFA7    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EFAA    mov         ecx,27
 0069EFAF    mov         edx,6A3FA8;'mat33'
 0069EFB4    call        THashTable.Add
 0069EFB9    mov         eax,dword ptr [ebp-4]
 0069EFBC    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EFBF    mov         ecx,1F
 0069EFC4    mov         edx,6A3FC0;'RotMat11'
 0069EFC9    call        THashTable.Add
 0069EFCE    mov         eax,dword ptr [ebp-4]
 0069EFD1    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EFD4    mov         ecx,20
 0069EFD9    mov         edx,6A3FE0;'RotMat12'
 0069EFDE    call        THashTable.Add
 0069EFE3    mov         eax,dword ptr [ebp-4]
 0069EFE6    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EFE9    mov         ecx,21
 0069EFEE    mov         edx,6A4000;'RotMat13'
 0069EFF3    call        THashTable.Add
 0069EFF8    mov         eax,dword ptr [ebp-4]
 0069EFFB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069EFFE    mov         ecx,22
 0069F003    mov         edx,6A4020;'RotMat21'
 0069F008    call        THashTable.Add
 0069F00D    mov         eax,dword ptr [ebp-4]
 0069F010    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F013    mov         ecx,23
 0069F018    mov         edx,6A4040;'RotMat22'
 0069F01D    call        THashTable.Add
 0069F022    mov         eax,dword ptr [ebp-4]
 0069F025    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F028    mov         ecx,24
 0069F02D    mov         edx,6A4060;'RotMat23'
 0069F032    call        THashTable.Add
 0069F037    mov         eax,dword ptr [ebp-4]
 0069F03A    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F03D    mov         ecx,25
 0069F042    mov         edx,6A4080;'RotMat31'
 0069F047    call        THashTable.Add
 0069F04C    mov         eax,dword ptr [ebp-4]
 0069F04F    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F052    mov         ecx,26
 0069F057    mov         edx,6A40A0;'RotMat32'
 0069F05C    call        THashTable.Add
 0069F061    mov         eax,dword ptr [ebp-4]
 0069F064    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F067    mov         ecx,27
 0069F06C    mov         edx,6A40C0;'RotMat33'
 0069F071    call        THashTable.Add
 0069F076    mov         eax,dword ptr [ebp-4]
 0069F079    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F07C    mov         ecx,1F
 0069F081    mov         edx,6A40E0;'FilterRotMat11'
 0069F086    call        THashTable.Add
 0069F08B    mov         eax,dword ptr [ebp-4]
 0069F08E    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F091    mov         ecx,20
 0069F096    mov         edx,6A410C;'FilterRotMat12'
 0069F09B    call        THashTable.Add
 0069F0A0    mov         eax,dword ptr [ebp-4]
 0069F0A3    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F0A6    mov         ecx,21
 0069F0AB    mov         edx,6A4138;'FilterRotMat13'
 0069F0B0    call        THashTable.Add
 0069F0B5    mov         eax,dword ptr [ebp-4]
 0069F0B8    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F0BB    mov         ecx,22
 0069F0C0    mov         edx,6A4164;'FilterRotMat21'
 0069F0C5    call        THashTable.Add
 0069F0CA    mov         eax,dword ptr [ebp-4]
 0069F0CD    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F0D0    mov         ecx,23
 0069F0D5    mov         edx,6A4190;'FilterRotMat22'
 0069F0DA    call        THashTable.Add
 0069F0DF    mov         eax,dword ptr [ebp-4]
 0069F0E2    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F0E5    mov         ecx,24
 0069F0EA    mov         edx,6A41BC;'FilterRotMat23'
 0069F0EF    call        THashTable.Add
 0069F0F4    mov         eax,dword ptr [ebp-4]
 0069F0F7    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F0FA    mov         ecx,25
 0069F0FF    mov         edx,6A41E8;'FilterRotMat31'
 0069F104    call        THashTable.Add
 0069F109    mov         eax,dword ptr [ebp-4]
 0069F10C    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F10F    mov         ecx,26
 0069F114    mov         edx,6A4214;'FilterRotMat32'
 0069F119    call        THashTable.Add
 0069F11E    mov         eax,dword ptr [ebp-4]
 0069F121    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F124    mov         ecx,27
 0069F129    mov         edx,6A4240;'FilterRotMat33'
 0069F12E    call        THashTable.Add
 0069F133    mov         eax,dword ptr [ebp-4]
 0069F136    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F139    mov         ecx,28
 0069F13E    mov         edx,6A426C;'UnfilteredRotMat11'
 0069F143    call        THashTable.Add
 0069F148    mov         eax,dword ptr [ebp-4]
 0069F14B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F14E    mov         ecx,29
 0069F153    mov         edx,6A42A0;'UnfilteredRotMat12'
 0069F158    call        THashTable.Add
 0069F15D    mov         eax,dword ptr [ebp-4]
 0069F160    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F163    mov         ecx,2A
 0069F168    mov         edx,6A42D4;'UnfilteredRotMat13'
 0069F16D    call        THashTable.Add
 0069F172    mov         eax,dword ptr [ebp-4]
 0069F175    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F178    mov         ecx,2B
 0069F17D    mov         edx,6A4308;'UnfilteredRotMat21'
 0069F182    call        THashTable.Add
 0069F187    mov         eax,dword ptr [ebp-4]
 0069F18A    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F18D    mov         ecx,2C
 0069F192    mov         edx,6A433C;'UnfilteredRotMat22'
 0069F197    call        THashTable.Add
 0069F19C    mov         eax,dword ptr [ebp-4]
 0069F19F    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F1A2    mov         ecx,2D
 0069F1A7    mov         edx,6A4370;'UnfilteredRotMat23'
 0069F1AC    call        THashTable.Add
 0069F1B1    mov         eax,dword ptr [ebp-4]
 0069F1B4    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F1B7    mov         ecx,2E
 0069F1BC    mov         edx,6A43A4;'UnfilteredRotMat31'
 0069F1C1    call        THashTable.Add
 0069F1C6    mov         eax,dword ptr [ebp-4]
 0069F1C9    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F1CC    mov         ecx,2F
 0069F1D1    mov         edx,6A43D8;'UnfilteredRotMat32'
 0069F1D6    call        THashTable.Add
 0069F1DB    mov         eax,dword ptr [ebp-4]
 0069F1DE    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F1E1    mov         ecx,30
 0069F1E6    mov         edx,6A440C;'UnfilteredRotMat33'
 0069F1EB    call        THashTable.Add
 0069F1F0    mov         eax,dword ptr [ebp-4]
 0069F1F3    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F1F6    mov         ecx,31
 0069F1FB    mov         edx,6A4440;'PitchVelocity'
 0069F200    call        THashTable.Add
 0069F205    mov         eax,dword ptr [ebp-4]
 0069F208    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F20B    mov         ecx,32
 0069F210    mov         edx,6A4468;'YawVelocity'
 0069F215    call        THashTable.Add
 0069F21A    mov         eax,dword ptr [ebp-4]
 0069F21D    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F220    mov         ecx,33
 0069F225    mov         edx,6A448C;'RollVelocity'
 0069F22A    call        THashTable.Add
 0069F22F    mov         eax,dword ptr [ebp-4]
 0069F232    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F235    mov         ecx,31
 0069F23A    mov         edx,6A44B4;'PitchV'
 0069F23F    call        THashTable.Add
 0069F244    mov         eax,dword ptr [ebp-4]
 0069F247    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F24A    mov         ecx,32
 0069F24F    mov         edx,6A44D0;'YawV'
 0069F254    call        THashTable.Add
 0069F259    mov         eax,dword ptr [ebp-4]
 0069F25C    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F25F    mov         ecx,33
 0069F264    mov         edx,6A44E8;'RollV'
 0069F269    call        THashTable.Add
 0069F26E    mov         eax,dword ptr [ebp-4]
 0069F271    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F274    mov         ecx,31
 0069F279    mov         edx,6A4500;'VPitch'
 0069F27E    call        THashTable.Add
 0069F283    mov         eax,dword ptr [ebp-4]
 0069F286    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F289    mov         ecx,32
 0069F28E    mov         edx,6A451C;'VYaw'
 0069F293    call        THashTable.Add
 0069F298    mov         eax,dword ptr [ebp-4]
 0069F29B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F29E    mov         ecx,33
 0069F2A3    mov         edx,6A4534;'VRoll'
 0069F2A8    call        THashTable.Add
 0069F2AD    mov         eax,dword ptr [ebp-4]
 0069F2B0    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F2B3    mov         ecx,31
 0069F2B8    mov         edx,6A454C;'XRotationVelocity'
 0069F2BD    call        THashTable.Add
 0069F2C2    mov         eax,dword ptr [ebp-4]
 0069F2C5    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F2C8    mov         ecx,32
 0069F2CD    mov         edx,6A457C;'YRotationVelocity'
 0069F2D2    call        THashTable.Add
 0069F2D7    mov         eax,dword ptr [ebp-4]
 0069F2DA    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F2DD    mov         ecx,33
 0069F2E2    mov         edx,6A45AC;'ZRotationVelocity'
 0069F2E7    call        THashTable.Add
 0069F2EC    mov         eax,dword ptr [ebp-4]
 0069F2EF    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F2F2    mov         ecx,31
 0069F2F7    mov         edx,6A45DC;'XAngularVelocity'
 0069F2FC    call        THashTable.Add
 0069F301    mov         eax,dword ptr [ebp-4]
 0069F304    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F307    mov         ecx,32
 0069F30C    mov         edx,6A460C;'YAngularVelocity'
 0069F311    call        THashTable.Add
 0069F316    mov         eax,dword ptr [ebp-4]
 0069F319    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F31C    mov         ecx,33
 0069F321    mov         edx,6A463C;'ZAngularVelocity'
 0069F326    call        THashTable.Add
 0069F32B    mov         eax,dword ptr [ebp-4]
 0069F32E    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F331    mov         ecx,31
 0069F336    mov         edx,6A466C;'AngularVelocityX'
 0069F33B    call        THashTable.Add
 0069F340    mov         eax,dword ptr [ebp-4]
 0069F343    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F346    mov         ecx,32
 0069F34B    mov         edx,6A469C;'AngularVelocityY'
 0069F350    call        THashTable.Add
 0069F355    mov         eax,dword ptr [ebp-4]
 0069F358    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F35B    mov         ecx,33
 0069F360    mov         edx,6A46CC;'AngularVelocityZ'
 0069F365    call        THashTable.Add
 0069F36A    mov         eax,dword ptr [ebp-4]
 0069F36D    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F370    mov         ecx,31
 0069F375    mov         edx,6A46FC;'AngularVelocityPitch'
 0069F37A    call        THashTable.Add
 0069F37F    mov         eax,dword ptr [ebp-4]
 0069F382    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F385    mov         ecx,32
 0069F38A    mov         edx,6A4734;'AngularVelocityYaw'
 0069F38F    call        THashTable.Add
 0069F394    mov         eax,dword ptr [ebp-4]
 0069F397    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F39A    mov         ecx,33
 0069F39F    mov         edx,6A4768;'AngularVelocityRoll'
 0069F3A4    call        THashTable.Add
 0069F3A9    mov         eax,dword ptr [ebp-4]
 0069F3AC    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F3AF    mov         ecx,31
 0069F3B4    mov         edx,6A479C;'VRX'
 0069F3B9    call        THashTable.Add
 0069F3BE    mov         eax,dword ptr [ebp-4]
 0069F3C1    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F3C4    mov         ecx,32
 0069F3C9    mov         edx,6A47B0;'VRY'
 0069F3CE    call        THashTable.Add
 0069F3D3    mov         eax,dword ptr [ebp-4]
 0069F3D6    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F3D9    mov         ecx,33
 0069F3DE    mov         edx,6A47C4;'VRZ'
 0069F3E3    call        THashTable.Add
 0069F3E8    mov         eax,dword ptr [ebp-4]
 0069F3EB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F3EE    mov         ecx,31
 0069F3F3    mov         edx,6A47D8;'RXV'
 0069F3F8    call        THashTable.Add
 0069F3FD    mov         eax,dword ptr [ebp-4]
 0069F400    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F403    mov         ecx,32
 0069F408    mov         edx,6A47EC;'RYV'
 0069F40D    call        THashTable.Add
 0069F412    mov         eax,dword ptr [ebp-4]
 0069F415    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F418    mov         ecx,33
 0069F41D    mov         edx,6A4800;'RZV'
 0069F422    call        THashTable.Add
 0069F427    mov         eax,dword ptr [ebp-4]
 0069F42A    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F42D    mov         ecx,34
 0069F432    mov         edx,6A4814;'AbsoluteThumb'
 0069F437    call        THashTable.Add
 0069F43C    mov         eax,dword ptr [ebp-4]
 0069F43F    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F442    mov         ecx,35
 0069F447    mov         edx,6A483C;'AbsoluteIndex'
 0069F44C    call        THashTable.Add
 0069F451    mov         eax,dword ptr [ebp-4]
 0069F454    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F457    mov         ecx,36
 0069F45C    mov         edx,6A4864;'AbsoluteMiddle'
 0069F461    call        THashTable.Add
 0069F466    mov         eax,dword ptr [ebp-4]
 0069F469    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F46C    mov         ecx,37
 0069F471    mov         edx,6A4890;'AbsoluteRing'
 0069F476    call        THashTable.Add
 0069F47B    mov         eax,dword ptr [ebp-4]
 0069F47E    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F481    mov         ecx,38
 0069F486    mov         edx,6A48B8;'AbsolutePinky'
 0069F48B    call        THashTable.Add
 0069F490    mov         eax,dword ptr [ebp-4]
 0069F493    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F496    mov         ecx,34
 0069F49B    mov         edx,6A48E0;'AbsoluteFinger0'
 0069F4A0    call        THashTable.Add
 0069F4A5    mov         eax,dword ptr [ebp-4]
 0069F4A8    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F4AB    mov         ecx,35
 0069F4B0    mov         edx,6A490C;'AbsoluteFinger1'
 0069F4B5    call        THashTable.Add
 0069F4BA    mov         eax,dword ptr [ebp-4]
 0069F4BD    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F4C0    mov         ecx,36
 0069F4C5    mov         edx,6A4938;'AbsoluteFinger2'
 0069F4CA    call        THashTable.Add
 0069F4CF    mov         eax,dword ptr [ebp-4]
 0069F4D2    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F4D5    mov         ecx,37
 0069F4DA    mov         edx,6A4964;'AbsoluteFinger3'
 0069F4DF    call        THashTable.Add
 0069F4E4    mov         eax,dword ptr [ebp-4]
 0069F4E7    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F4EA    mov         ecx,38
 0069F4EF    mov         edx,6A4990;'AbsoluteFinger4'
 0069F4F4    call        THashTable.Add
 0069F4F9    mov         eax,dword ptr [ebp-4]
 0069F4FC    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F4FF    mov         ecx,34
 0069F504    mov         edx,6A49BC;'AFinger0'
 0069F509    call        THashTable.Add
 0069F50E    mov         eax,dword ptr [ebp-4]
 0069F511    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F514    mov         ecx,35
 0069F519    mov         edx,6A49DC;'AFinger1'
 0069F51E    call        THashTable.Add
 0069F523    mov         eax,dword ptr [ebp-4]
 0069F526    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F529    mov         ecx,36
 0069F52E    mov         edx,6A49FC;'AFinger2'
 0069F533    call        THashTable.Add
 0069F538    mov         eax,dword ptr [ebp-4]
 0069F53B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F53E    mov         ecx,37
 0069F543    mov         edx,6A4A1C;'AFinger3'
 0069F548    call        THashTable.Add
 0069F54D    mov         eax,dword ptr [ebp-4]
 0069F550    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F553    mov         ecx,38
 0069F558    mov         edx,6A4A3C;'AFinger4'
 0069F55D    call        THashTable.Add
 0069F562    mov         eax,dword ptr [ebp-4]
 0069F565    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F568    mov         ecx,34
 0069F56D    mov         edx,6A4A5C;'AThumb'
 0069F572    call        THashTable.Add
 0069F577    mov         eax,dword ptr [ebp-4]
 0069F57A    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F57D    mov         ecx,35
 0069F582    mov         edx,6A4A78;'AIndex'
 0069F587    call        THashTable.Add
 0069F58C    mov         eax,dword ptr [ebp-4]
 0069F58F    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F592    mov         ecx,36
 0069F597    mov         edx,6A4A94;'AMiddle'
 0069F59C    call        THashTable.Add
 0069F5A1    mov         eax,dword ptr [ebp-4]
 0069F5A4    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F5A7    mov         ecx,37
 0069F5AC    mov         edx,6A4AB0;'ARing'
 0069F5B1    call        THashTable.Add
 0069F5B6    mov         eax,dword ptr [ebp-4]
 0069F5B9    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F5BC    mov         ecx,38
 0069F5C1    mov         edx,6A4AC8;'APinky'
 0069F5C6    call        THashTable.Add
 0069F5CB    mov         eax,dword ptr [ebp-4]
 0069F5CE    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F5D1    mov         ecx,34
 0069F5D6    mov         edx,6A4AE4;'AbsThumb'
 0069F5DB    call        THashTable.Add
 0069F5E0    mov         eax,dword ptr [ebp-4]
 0069F5E3    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F5E6    mov         ecx,35
 0069F5EB    mov         edx,6A4B04;'AbsIndex'
 0069F5F0    call        THashTable.Add
 0069F5F5    mov         eax,dword ptr [ebp-4]
 0069F5F8    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F5FB    mov         ecx,36
 0069F600    mov         edx,6A4B24;'AbsMiddle'
 0069F605    call        THashTable.Add
 0069F60A    mov         eax,dword ptr [ebp-4]
 0069F60D    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F610    mov         ecx,37
 0069F615    mov         edx,6A4B44;'AbsRing'
 0069F61A    call        THashTable.Add
 0069F61F    mov         eax,dword ptr [ebp-4]
 0069F622    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F625    mov         ecx,38
 0069F62A    mov         edx,6A4B60;'AbsPinky'
 0069F62F    call        THashTable.Add
 0069F634    mov         eax,dword ptr [ebp-4]
 0069F637    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F63A    mov         ecx,39
 0069F63F    mov         edx,6A4B80;'FingerVelocity0'
 0069F644    call        THashTable.Add
 0069F649    mov         eax,dword ptr [ebp-4]
 0069F64C    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F64F    mov         ecx,3A
 0069F654    mov         edx,6A4BAC;'FingerVelocity1'
 0069F659    call        THashTable.Add
 0069F65E    mov         eax,dword ptr [ebp-4]
 0069F661    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F664    mov         ecx,3B
 0069F669    mov         edx,6A4BD8;'FingerVelocity2'
 0069F66E    call        THashTable.Add
 0069F673    mov         eax,dword ptr [ebp-4]
 0069F676    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F679    mov         ecx,3C
 0069F67E    mov         edx,6A4C04;'FingerVelocity3'
 0069F683    call        THashTable.Add
 0069F688    mov         eax,dword ptr [ebp-4]
 0069F68B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F68E    mov         ecx,3D
 0069F693    mov         edx,6A4C30;'FingerVelocity4'
 0069F698    call        THashTable.Add
 0069F69D    mov         eax,dword ptr [ebp-4]
 0069F6A0    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F6A3    mov         ecx,39
 0069F6A8    mov         edx,6A4C5C;'ThumbVelocity'
 0069F6AD    call        THashTable.Add
 0069F6B2    mov         eax,dword ptr [ebp-4]
 0069F6B5    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F6B8    mov         ecx,3A
 0069F6BD    mov         edx,6A4C84;'IndexVelocity'
 0069F6C2    call        THashTable.Add
 0069F6C7    mov         eax,dword ptr [ebp-4]
 0069F6CA    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F6CD    mov         ecx,3B
 0069F6D2    mov         edx,6A4CAC;'MiddleVelocity'
 0069F6D7    call        THashTable.Add
 0069F6DC    mov         eax,dword ptr [ebp-4]
 0069F6DF    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F6E2    mov         ecx,3C
 0069F6E7    mov         edx,6A4CD8;'RingVelocity'
 0069F6EC    call        THashTable.Add
 0069F6F1    mov         eax,dword ptr [ebp-4]
 0069F6F4    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F6F7    mov         ecx,3D
 0069F6FC    mov         edx,6A4D00;'PinkyVelocity'
 0069F701    call        THashTable.Add
 0069F706    mov         eax,dword ptr [ebp-4]
 0069F709    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F70C    mov         ecx,3E
 0069F711    mov         edx,6A4D28;'PitchAcceleration'
 0069F716    call        THashTable.Add
 0069F71B    mov         eax,dword ptr [ebp-4]
 0069F71E    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F721    mov         ecx,3F
 0069F726    mov         edx,6A4D58;'YawAcceleration'
 0069F72B    call        THashTable.Add
 0069F730    mov         eax,dword ptr [ebp-4]
 0069F733    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F736    mov         ecx,40
 0069F73B    mov         edx,6A4D84;'RollAcceleration'
 0069F740    call        THashTable.Add
 0069F745    mov         eax,dword ptr [ebp-4]
 0069F748    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F74B    mov         ecx,3E
 0069F750    mov         edx,6A4DB4;'PitchAcc'
 0069F755    call        THashTable.Add
 0069F75A    mov         eax,dword ptr [ebp-4]
 0069F75D    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F760    mov         ecx,3F
 0069F765    mov         edx,6A4DD4;'YawAcc'
 0069F76A    call        THashTable.Add
 0069F76F    mov         eax,dword ptr [ebp-4]
 0069F772    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F775    mov         ecx,40
 0069F77A    mov         edx,6A4DF0;'RollAcc'
 0069F77F    call        THashTable.Add
 0069F784    mov         eax,dword ptr [ebp-4]
 0069F787    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F78A    mov         ecx,3E
 0069F78F    mov         edx,6A4E0C;'AccPitch'
 0069F794    call        THashTable.Add
 0069F799    mov         eax,dword ptr [ebp-4]
 0069F79C    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F79F    mov         ecx,3F
 0069F7A4    mov         edx,6A4E2C;'AccYaw'
 0069F7A9    call        THashTable.Add
 0069F7AE    mov         eax,dword ptr [ebp-4]
 0069F7B1    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F7B4    mov         ecx,40
 0069F7B9    mov         edx,6A4E48;'AccRoll'
 0069F7BE    call        THashTable.Add
 0069F7C3    mov         eax,dword ptr [ebp-4]
 0069F7C6    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F7C9    mov         ecx,3E
 0069F7CE    mov         edx,6A4E64;'XRotationAcceleration'
 0069F7D3    call        THashTable.Add
 0069F7D8    mov         eax,dword ptr [ebp-4]
 0069F7DB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F7DE    mov         ecx,3F
 0069F7E3    mov         edx,6A4E9C;'YRotationAcceleration'
 0069F7E8    call        THashTable.Add
 0069F7ED    mov         eax,dword ptr [ebp-4]
 0069F7F0    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F7F3    mov         ecx,40
 0069F7F8    mov         edx,6A4ED4;'ZRotationAcceleration'
 0069F7FD    call        THashTable.Add
 0069F802    mov         eax,dword ptr [ebp-4]
 0069F805    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F808    mov         ecx,3E
 0069F80D    mov         edx,6A4F0C;'XAngularAcceleration'
 0069F812    call        THashTable.Add
 0069F817    mov         eax,dword ptr [ebp-4]
 0069F81A    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F81D    mov         ecx,3F
 0069F822    mov         edx,6A4F44;'YAngularAcceleration'
 0069F827    call        THashTable.Add
 0069F82C    mov         eax,dword ptr [ebp-4]
 0069F82F    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F832    mov         ecx,40
 0069F837    mov         edx,6A4F7C;'ZAngularAcceleration'
 0069F83C    call        THashTable.Add
 0069F841    mov         eax,dword ptr [ebp-4]
 0069F844    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F847    mov         ecx,3E
 0069F84C    mov         edx,6A4FB4;'AngularAccelerationX'
 0069F851    call        THashTable.Add
 0069F856    mov         eax,dword ptr [ebp-4]
 0069F859    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F85C    mov         ecx,3F
 0069F861    mov         edx,6A4FEC;'AngularAccelerationY'
 0069F866    call        THashTable.Add
 0069F86B    mov         eax,dword ptr [ebp-4]
 0069F86E    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F871    mov         ecx,40
 0069F876    mov         edx,6A5024;'AngularAccelerationZ'
 0069F87B    call        THashTable.Add
 0069F880    mov         eax,dword ptr [ebp-4]
 0069F883    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F886    mov         ecx,3E
 0069F88B    mov         edx,6A505C;'AngularAccelerationPitch'
 0069F890    call        THashTable.Add
 0069F895    mov         eax,dword ptr [ebp-4]
 0069F898    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F89B    mov         ecx,3F
 0069F8A0    mov         edx,6A509C;'AngularAccelerationYaw'
 0069F8A5    call        THashTable.Add
 0069F8AA    mov         eax,dword ptr [ebp-4]
 0069F8AD    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F8B0    mov         ecx,40
 0069F8B5    mov         edx,6A50D8;'AngularValocityRoll'
 0069F8BA    call        THashTable.Add
 0069F8BF    mov         eax,dword ptr [ebp-4]
 0069F8C2    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F8C5    mov         ecx,3E
 0069F8CA    mov         edx,6A510C;'AccRX'
 0069F8CF    call        THashTable.Add
 0069F8D4    mov         eax,dword ptr [ebp-4]
 0069F8D7    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F8DA    mov         ecx,3F
 0069F8DF    mov         edx,6A5124;'AccRY'
 0069F8E4    call        THashTable.Add
 0069F8E9    mov         eax,dword ptr [ebp-4]
 0069F8EC    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F8EF    mov         ecx,40
 0069F8F4    mov         edx,6A513C;'AccRZ'
 0069F8F9    call        THashTable.Add
 0069F8FE    mov         eax,dword ptr [ebp-4]
 0069F901    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F904    mov         ecx,3E
 0069F909    mov         edx,6A5154;'RXAcc'
 0069F90E    call        THashTable.Add
 0069F913    mov         eax,dword ptr [ebp-4]
 0069F916    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F919    mov         ecx,3F
 0069F91E    mov         edx,6A516C;'RYAcc'
 0069F923    call        THashTable.Add
 0069F928    mov         eax,dword ptr [ebp-4]
 0069F92B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F92E    mov         ecx,40
 0069F933    mov         edx,6A5184;'RZAcc'
 0069F938    call        THashTable.Add
 0069F93D    mov         eax,dword ptr [ebp-4]
 0069F940    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F943    mov         ecx,41
 0069F948    mov         edx,6A519C;'FingerAcceleration0'
 0069F94D    call        THashTable.Add
 0069F952    mov         eax,dword ptr [ebp-4]
 0069F955    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F958    mov         ecx,42
 0069F95D    mov         edx,6A51D0;'FingerAcceleration1'
 0069F962    call        THashTable.Add
 0069F967    mov         eax,dword ptr [ebp-4]
 0069F96A    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F96D    mov         ecx,43
 0069F972    mov         edx,6A5204;'FingerAcceleration2'
 0069F977    call        THashTable.Add
 0069F97C    mov         eax,dword ptr [ebp-4]
 0069F97F    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F982    mov         ecx,44
 0069F987    mov         edx,6A5238;'FingerAcceleration3'
 0069F98C    call        THashTable.Add
 0069F991    mov         eax,dword ptr [ebp-4]
 0069F994    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F997    mov         ecx,45
 0069F99C    mov         edx,6A526C;'FingerAcceleration4'
 0069F9A1    call        THashTable.Add
 0069F9A6    mov         eax,dword ptr [ebp-4]
 0069F9A9    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F9AC    mov         ecx,41
 0069F9B1    mov         edx,6A52A0;'ThumbAcceleration'
 0069F9B6    call        THashTable.Add
 0069F9BB    mov         eax,dword ptr [ebp-4]
 0069F9BE    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F9C1    mov         ecx,42
 0069F9C6    mov         edx,6A52D0;'IndexAcceleration'
 0069F9CB    call        THashTable.Add
 0069F9D0    mov         eax,dword ptr [ebp-4]
 0069F9D3    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F9D6    mov         ecx,43
 0069F9DB    mov         edx,6A5300;'MiddleAcceleration'
 0069F9E0    call        THashTable.Add
 0069F9E5    mov         eax,dword ptr [ebp-4]
 0069F9E8    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069F9EB    mov         ecx,44
 0069F9F0    mov         edx,6A5334;'RingAcceleration'
 0069F9F5    call        THashTable.Add
 0069F9FA    mov         eax,dword ptr [ebp-4]
 0069F9FD    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FA00    mov         ecx,45
 0069FA05    mov         edx,6A5364;'PinkyAcceleration'
 0069FA0A    call        THashTable.Add
 0069FA0F    mov         eax,dword ptr [ebp-4]
 0069FA12    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FA15    mov         ecx,46
 0069FA1A    mov         edx,6A5394;'Frame'
 0069FA1F    call        THashTable.Add
 0069FA24    mov         eax,dword ptr [ebp-4]
 0069FA27    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FA2A    mov         ecx,47
 0069FA2F    mov         edx,6A53AC;'Time'
 0069FA34    call        THashTable.Add
 0069FA39    mov         eax,dword ptr [ebp-4]
 0069FA3C    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FA3F    mov         ecx,48
 0069FA44    mov         edx,6A53C4;'FrameRate'
 0069FA49    call        THashTable.Add
 0069FA4E    mov         eax,dword ptr [ebp-4]
 0069FA51    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FA54    mov         ecx,49
 0069FA59    mov         edx,6A53E4;'TrackedLed'
 0069FA5E    call        THashTable.Add
 0069FA63    mov         eax,dword ptr [ebp-4]
 0069FA66    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FA69    mov         ecx,4D
 0069FA6E    mov         edx,6A5408;'FilterDistance'
 0069FA73    call        THashTable.Add
 0069FA78    mov         eax,dword ptr [ebp-4]
 0069FA7B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FA7E    mov         ecx,4D
 0069FA83    mov         edx,6A5434;'DeadbandDistance'
 0069FA88    call        THashTable.Add
 0069FA8D    mov         eax,dword ptr [ebp-4]
 0069FA90    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FA93    mov         ecx,4D
 0069FA98    mov         edx,6A5464;'DeadbandFilterDistance'
 0069FA9D    call        THashTable.Add
 0069FAA2    mov         eax,dword ptr [ebp-4]
 0069FAA5    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FAA8    mov         ecx,4C
 0069FAAD    mov         edx,6A54A0;'FilterFrames'
 0069FAB2    call        THashTable.Add
 0069FAB7    mov         eax,dword ptr [ebp-4]
 0069FABA    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FABD    mov         ecx,4C
 0069FAC2    mov         edx,6A54C8;'AveragingFrames'
 0069FAC7    call        THashTable.Add
 0069FACC    mov         eax,dword ptr [ebp-4]
 0069FACF    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FAD2    mov         ecx,4C
 0069FAD7    mov         edx,6A54F4;'AverageFrames'
 0069FADC    call        THashTable.Add
 0069FAE1    mov         eax,dword ptr [ebp-4]
 0069FAE4    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FAE7    mov         ecx,4C
 0069FAEC    mov         edx,6A551C;'FramesToAverage'
 0069FAF1    call        THashTable.Add
 0069FAF6    mov         eax,dword ptr [ebp-4]
 0069FAF9    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FAFC    mov         ecx,4A
 0069FB01    mov         edx,6A5548;'AveragingFilter'
 0069FB06    call        THashTable.Add
 0069FB0B    mov         eax,dword ptr [ebp-4]
 0069FB0E    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FB11    mov         ecx,4A
 0069FB16    mov         edx,6A5574;'AverageFilter'
 0069FB1B    call        THashTable.Add
 0069FB20    mov         eax,dword ptr [ebp-4]
 0069FB23    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FB26    mov         ecx,4B
 0069FB2B    mov         edx,6A559C;'DeadbandFilter'
 0069FB30    call        THashTable.Add
 0069FB35    mov         eax,dword ptr [ebp-4]
 0069FB38    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FB3B    mov         ecx,4E
 0069FB40    mov         edx,6A55C8;'FingersUp'
 0069FB45    call        THashTable.Add
 0069FB4A    mov         eax,dword ptr [ebp-4]
 0069FB4D    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FB50    mov         ecx,4F
 0069FB55    mov         edx,6A55E8;'FingersDown'
 0069FB5A    call        THashTable.Add
 0069FB5F    mov         eax,dword ptr [ebp-4]
 0069FB62    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FB65    mov         ecx,50
 0069FB6A    mov         edx,6A560C;'FingersLeft'
 0069FB6F    call        THashTable.Add
 0069FB74    mov         eax,dword ptr [ebp-4]
 0069FB77    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FB7A    mov         ecx,51
 0069FB7F    mov         edx,6A5630;'FingersRight'
 0069FB84    call        THashTable.Add
 0069FB89    mov         eax,dword ptr [ebp-4]
 0069FB8C    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FB8F    mov         ecx,52
 0069FB94    mov         edx,6A5658;'FingersForward'
 0069FB99    call        THashTable.Add
 0069FB9E    mov         eax,dword ptr [ebp-4]
 0069FBA1    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FBA4    mov         ecx,52
 0069FBA9    mov         edx,6A5684;'FingersForwards'
 0069FBAE    call        THashTable.Add
 0069FBB3    mov         eax,dword ptr [ebp-4]
 0069FBB6    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FBB9    mov         ecx,53
 0069FBBE    mov         edx,6A56B0;'FingersBack'
 0069FBC3    call        THashTable.Add
 0069FBC8    mov         eax,dword ptr [ebp-4]
 0069FBCB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FBCE    mov         ecx,53
 0069FBD3    mov         edx,6A56D4;'FingersBackward'
 0069FBD8    call        THashTable.Add
 0069FBDD    mov         eax,dword ptr [ebp-4]
 0069FBE0    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FBE3    mov         ecx,52
 0069FBE8    mov         edx,6A5700;'FingersOut'
 0069FBED    call        THashTable.Add
 0069FBF2    mov         eax,dword ptr [ebp-4]
 0069FBF5    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FBF8    mov         ecx,53
 0069FBFD    mov         edx,6A5724;'FingersIn'
 0069FC02    call        THashTable.Add
 0069FC07    mov         eax,dword ptr [ebp-4]
 0069FC0A    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FC0D    mov         ecx,9D
 0069FC12    mov         edx,6A5744;'WristUp'
 0069FC17    call        THashTable.Add
 0069FC1C    mov         eax,dword ptr [ebp-4]
 0069FC1F    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FC22    mov         ecx,9E
 0069FC27    mov         edx,6A5760;'WristDown'
 0069FC2C    call        THashTable.Add
 0069FC31    mov         eax,dword ptr [ebp-4]
 0069FC34    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FC37    mov         ecx,9F
 0069FC3C    mov         edx,6A5780;'WristLeft'
 0069FC41    call        THashTable.Add
 0069FC46    mov         eax,dword ptr [ebp-4]
 0069FC49    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FC4C    mov         ecx,0A0
 0069FC51    mov         edx,6A57A0;'WristRight'
 0069FC56    call        THashTable.Add
 0069FC5B    mov         eax,dword ptr [ebp-4]
 0069FC5E    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FC61    mov         ecx,0A1
 0069FC66    mov         edx,6A57C4;'WristForward'
 0069FC6B    call        THashTable.Add
 0069FC70    mov         eax,dword ptr [ebp-4]
 0069FC73    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FC76    mov         ecx,0A1
 0069FC7B    mov         edx,6A57EC;'WristForwards'
 0069FC80    call        THashTable.Add
 0069FC85    mov         eax,dword ptr [ebp-4]
 0069FC88    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FC8B    mov         ecx,0A2
 0069FC90    mov         edx,6A5814;'WristBack'
 0069FC95    call        THashTable.Add
 0069FC9A    mov         eax,dword ptr [ebp-4]
 0069FC9D    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FCA0    mov         ecx,0A2
 0069FCA5    mov         edx,6A5834;'WristBackward'
 0069FCAA    call        THashTable.Add
 0069FCAF    mov         eax,dword ptr [ebp-4]
 0069FCB2    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FCB5    mov         ecx,0A1
 0069FCBA    mov         edx,6A585C;'WristOut'
 0069FCBF    call        THashTable.Add
 0069FCC4    mov         eax,dword ptr [ebp-4]
 0069FCC7    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FCCA    mov         ecx,0A2
 0069FCCF    mov         edx,6A587C;'WristIn'
 0069FCD4    call        THashTable.Add
 0069FCD9    mov         eax,dword ptr [ebp-4]
 0069FCDC    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FCDF    mov         ecx,54
 0069FCE4    mov         edx,6A5898;'ThumbUp'
 0069FCE9    call        THashTable.Add
 0069FCEE    mov         eax,dword ptr [ebp-4]
 0069FCF1    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FCF4    mov         ecx,55
 0069FCF9    mov         edx,6A58B4;'ThumbDown'
 0069FCFE    call        THashTable.Add
 0069FD03    mov         eax,dword ptr [ebp-4]
 0069FD06    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FD09    mov         ecx,56
 0069FD0E    mov         edx,6A58D4;'ThumbLeft'
 0069FD13    call        THashTable.Add
 0069FD18    mov         eax,dword ptr [ebp-4]
 0069FD1B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FD1E    mov         ecx,57
 0069FD23    mov         edx,6A58F4;'ThumbRight'
 0069FD28    call        THashTable.Add
 0069FD2D    mov         eax,dword ptr [ebp-4]
 0069FD30    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FD33    mov         ecx,58
 0069FD38    mov         edx,6A5918;'ThumbForward'
 0069FD3D    call        THashTable.Add
 0069FD42    mov         eax,dword ptr [ebp-4]
 0069FD45    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FD48    mov         ecx,58
 0069FD4D    mov         edx,6A5940;'ThumbForwards'
 0069FD52    call        THashTable.Add
 0069FD57    mov         eax,dword ptr [ebp-4]
 0069FD5A    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FD5D    mov         ecx,59
 0069FD62    mov         edx,6A5968;'ThumbBack'
 0069FD67    call        THashTable.Add
 0069FD6C    mov         eax,dword ptr [ebp-4]
 0069FD6F    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FD72    mov         ecx,59
 0069FD77    mov         edx,6A5988;'ThumbBackward'
 0069FD7C    call        THashTable.Add
 0069FD81    mov         eax,dword ptr [ebp-4]
 0069FD84    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FD87    mov         ecx,58
 0069FD8C    mov         edx,6A59B0;'ThumbOut'
 0069FD91    call        THashTable.Add
 0069FD96    mov         eax,dword ptr [ebp-4]
 0069FD99    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FD9C    mov         ecx,59
 0069FDA1    mov         edx,6A59D0;'ThumbIn'
 0069FDA6    call        THashTable.Add
 0069FDAB    mov         eax,dword ptr [ebp-4]
 0069FDAE    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FDB1    mov         ecx,0A3
 0069FDB6    mov         edx,6A59EC;'BackOfHandUp'
 0069FDBB    call        THashTable.Add
 0069FDC0    mov         eax,dword ptr [ebp-4]
 0069FDC3    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FDC6    mov         ecx,0A4
 0069FDCB    mov         edx,6A5A14;'BackOfHandDown'
 0069FDD0    call        THashTable.Add
 0069FDD5    mov         eax,dword ptr [ebp-4]
 0069FDD8    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FDDB    mov         ecx,0A5
 0069FDE0    mov         edx,6A5A40;'BackOfHandLeft'
 0069FDE5    call        THashTable.Add
 0069FDEA    mov         eax,dword ptr [ebp-4]
 0069FDED    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FDF0    mov         ecx,0A6
 0069FDF5    mov         edx,6A5A6C;'BackOfHandRight'
 0069FDFA    call        THashTable.Add
 0069FDFF    mov         eax,dword ptr [ebp-4]
 0069FE02    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FE05    mov         ecx,0A7
 0069FE0A    mov         edx,6A5A98;'BackOfHandForward'
 0069FE0F    call        THashTable.Add
 0069FE14    mov         eax,dword ptr [ebp-4]
 0069FE17    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FE1A    mov         ecx,0A7
 0069FE1F    mov         edx,6A5AC8;'BackOfHandForwards'
 0069FE24    call        THashTable.Add
 0069FE29    mov         eax,dword ptr [ebp-4]
 0069FE2C    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FE2F    mov         ecx,0A8
 0069FE34    mov         edx,6A5AFC;'BackOfHandBack'
 0069FE39    call        THashTable.Add
 0069FE3E    mov         eax,dword ptr [ebp-4]
 0069FE41    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FE44    mov         ecx,0A8
 0069FE49    mov         edx,6A5B28;'BackOfHandBackward'
 0069FE4E    call        THashTable.Add
 0069FE53    mov         eax,dword ptr [ebp-4]
 0069FE56    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FE59    mov         ecx,0A7
 0069FE5E    mov         edx,6A5B5C;'BackOfHandOut'
 0069FE63    call        THashTable.Add
 0069FE68    mov         eax,dword ptr [ebp-4]
 0069FE6B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FE6E    mov         ecx,0A8
 0069FE73    mov         edx,6A5B84;'BackOfHandIn'
 0069FE78    call        THashTable.Add
 0069FE7D    mov         eax,dword ptr [ebp-4]
 0069FE80    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FE83    mov         ecx,0A3
 0069FE88    mov         edx,6A5BAC;'BackUp'
 0069FE8D    call        THashTable.Add
 0069FE92    mov         eax,dword ptr [ebp-4]
 0069FE95    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FE98    mov         ecx,0A4
 0069FE9D    mov         edx,6A5BC8;'BackDown'
 0069FEA2    call        THashTable.Add
 0069FEA7    mov         eax,dword ptr [ebp-4]
 0069FEAA    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FEAD    mov         ecx,0A5
 0069FEB2    mov         edx,6A5BE8;'BackLeft'
 0069FEB7    call        THashTable.Add
 0069FEBC    mov         eax,dword ptr [ebp-4]
 0069FEBF    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FEC2    mov         ecx,0A6
 0069FEC7    mov         edx,6A5C08;'BackRight'
 0069FECC    call        THashTable.Add
 0069FED1    mov         eax,dword ptr [ebp-4]
 0069FED4    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FED7    mov         ecx,0A7
 0069FEDC    mov         edx,6A5C28;'BackForward'
 0069FEE1    call        THashTable.Add
 0069FEE6    mov         eax,dword ptr [ebp-4]
 0069FEE9    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FEEC    mov         ecx,0A7
 0069FEF1    mov         edx,6A5C4C;'BackForwards'
 0069FEF6    call        THashTable.Add
 0069FEFB    mov         eax,dword ptr [ebp-4]
 0069FEFE    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FF01    mov         ecx,0A8
 0069FF06    mov         edx,6A5C74;'BackBack'
 0069FF0B    call        THashTable.Add
 0069FF10    mov         eax,dword ptr [ebp-4]
 0069FF13    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FF16    mov         ecx,0A8
 0069FF1B    mov         edx,6A5C94;'BackBackward'
 0069FF20    call        THashTable.Add
 0069FF25    mov         eax,dword ptr [ebp-4]
 0069FF28    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FF2B    mov         ecx,0A7
 0069FF30    mov         edx,6A5CBC;'BackOut'
 0069FF35    call        THashTable.Add
 0069FF3A    mov         eax,dword ptr [ebp-4]
 0069FF3D    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FF40    mov         ecx,0A8
 0069FF45    mov         edx,6A5CD8;'BackIn'
 0069FF4A    call        THashTable.Add
 0069FF4F    mov         eax,dword ptr [ebp-4]
 0069FF52    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FF55    mov         ecx,5A
 0069FF5A    mov         edx,6A5CF4;'PalmUp'
 0069FF5F    call        THashTable.Add
 0069FF64    mov         eax,dword ptr [ebp-4]
 0069FF67    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FF6A    mov         ecx,5B
 0069FF6F    mov         edx,6A5D10;'PalmDown'
 0069FF74    call        THashTable.Add
 0069FF79    mov         eax,dword ptr [ebp-4]
 0069FF7C    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FF7F    mov         ecx,5C
 0069FF84    mov         edx,6A5D30;'PalmLeft'
 0069FF89    call        THashTable.Add
 0069FF8E    mov         eax,dword ptr [ebp-4]
 0069FF91    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FF94    mov         ecx,5D
 0069FF99    mov         edx,6A5D50;'PalmRight'
 0069FF9E    call        THashTable.Add
 0069FFA3    mov         eax,dword ptr [ebp-4]
 0069FFA6    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FFA9    mov         ecx,5E
 0069FFAE    mov         edx,6A5D70;'PalmForward'
 0069FFB3    call        THashTable.Add
 0069FFB8    mov         eax,dword ptr [ebp-4]
 0069FFBB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FFBE    mov         ecx,5E
 0069FFC3    mov         edx,6A5D94;'PalmForwards'
 0069FFC8    call        THashTable.Add
 0069FFCD    mov         eax,dword ptr [ebp-4]
 0069FFD0    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FFD3    mov         ecx,5F
 0069FFD8    mov         edx,6A5DBC;'PalmBack'
 0069FFDD    call        THashTable.Add
 0069FFE2    mov         eax,dword ptr [ebp-4]
 0069FFE5    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FFE8    mov         ecx,5F
 0069FFED    mov         edx,6A5DDC;'PalmBackward'
 0069FFF2    call        THashTable.Add
 0069FFF7    mov         eax,dword ptr [ebp-4]
 0069FFFA    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 0069FFFD    mov         ecx,5E
 006A0002    mov         edx,6A5E04;'PalmOut'
 006A0007    call        THashTable.Add
 006A000C    mov         eax,dword ptr [ebp-4]
 006A000F    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0012    mov         ecx,5F
 006A0017    mov         edx,6A5E20;'PalmIn'
 006A001C    call        THashTable.Add
 006A0021    mov         eax,dword ptr [ebp-4]
 006A0024    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0027    mov         ecx,61
 006A002C    mov         edx,6A5E3C;'minn'
 006A0031    call        THashTable.Add
 006A0036    mov         eax,dword ptr [ebp-4]
 006A0039    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A003C    mov         ecx,60
 006A0041    mov         edx,6A5E54;'maxl'
 006A0046    call        THashTable.Add
 006A004B    mov         eax,dword ptr [ebp-4]
 006A004E    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0051    mov         ecx,9A
 006A0056    mov         edx,6A5E6C;'exists'
 006A005B    call        THashTable.Add
 006A0060    mov         eax,dword ptr [ebp-4]
 006A0063    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0066    mov         ecx,9A
 006A006B    mov         edx,6A5E88;'connected'
 006A0070    call        THashTable.Add
 006A0075    mov         eax,dword ptr [ebp-4]
 006A0078    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A007B    mov         ecx,9A
 006A0080    mov         edx,6A5EA8;'PluggedIn'
 006A0085    call        THashTable.Add
 006A008A    mov         eax,dword ptr [ebp-4]
 006A008D    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0090    mov         ecx,9A
 006A0095    mov         edx,6A5EC8;'valid'
 006A009A    call        THashTable.Add
 006A009F    mov         eax,dword ptr [ebp-4]
 006A00A2    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A00A5    mov         ecx,9A
 006A00AA    mov         edx,6A5EE0;'IsValid'
 006A00AF    call        THashTable.Add
 006A00B4    mov         eax,dword ptr [ebp-4]
 006A00B7    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A00BA    mov         ecx,9B
 006A00BF    mov         edx,6A5EFC;'MouseMode'
 006A00C4    call        THashTable.Add
 006A00C9    mov         eax,dword ptr [ebp-4]
 006A00CC    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A00CF    mov         ecx,9B
 006A00D4    mov         edx,6A5F1C;'MouseState'
 006A00D9    call        THashTable.Add
 006A00DE    mov         eax,dword ptr [ebp-4]
 006A00E1    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A00E4    mov         ecx,9C
 006A00E9    mov         edx,6A5F40;'LeftHand'
 006A00EE    call        THashTable.Add
 006A00F3    mov         eax,dword ptr [ebp-4]
 006A00F6    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A00F9    mov         ecx,9C
 006A00FE    mov         edx,6A5F60;'LeftHanded'
 006A0103    call        THashTable.Add
 006A0108    xor         ebx,ebx
 006A010A    push        6A5F84;'led'
 006A010F    lea         edx,[ebp-24]
 006A0112    mov         eax,ebx
 006A0114    call        IntToStr
 006A0119    push        dword ptr [ebp-24]
 006A011C    push        6A33B0;'x'
 006A0121    lea         eax,[ebp-20]
 006A0124    mov         edx,3
 006A0129    call        @UStrCatN
 006A012E    mov         edx,dword ptr [ebp-20]
 006A0131    mov         esi,ebx
 006A0133    add         esi,esi
 006A0135    add         esi,esi
 006A0137    add         esi,esi
 006A0139    sub         esi,ebx
 006A013B    mov         ecx,esi
 006A013D    add         ecx,62
 006A0140    mov         eax,dword ptr [ebp-4]
 006A0143    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0146    call        THashTable.Add
 006A014B    push        6A5F84;'led'
 006A0150    lea         edx,[ebp-2C]
 006A0153    mov         eax,ebx
 006A0155    call        IntToStr
 006A015A    push        dword ptr [ebp-2C]
 006A015D    push        6A33C0;'y'
 006A0162    lea         eax,[ebp-28]
 006A0165    mov         edx,3
 006A016A    call        @UStrCatN
 006A016F    mov         edx,dword ptr [ebp-28]
 006A0172    mov         ecx,esi
 006A0174    add         ecx,63
 006A0177    mov         eax,dword ptr [ebp-4]
 006A017A    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A017D    call        THashTable.Add
 006A0182    push        6A5F84;'led'
 006A0187    lea         edx,[ebp-34]
 006A018A    mov         eax,ebx
 006A018C    call        IntToStr
 006A0191    push        dword ptr [ebp-34]
 006A0194    push        6A33D0;'z'
 006A0199    lea         eax,[ebp-30]
 006A019C    mov         edx,3
 006A01A1    call        @UStrCatN
 006A01A6    mov         edx,dword ptr [ebp-30]
 006A01A9    mov         ecx,esi
 006A01AB    add         ecx,64
 006A01AE    mov         eax,dword ptr [ebp-4]
 006A01B1    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A01B4    call        THashTable.Add
 006A01B9    push        6A5F84;'led'
 006A01BE    lea         edx,[ebp-3C]
 006A01C1    mov         eax,ebx
 006A01C3    call        IntToStr
 006A01C8    push        dword ptr [ebp-3C]
 006A01CB    push        6A5F98;'h'
 006A01D0    lea         eax,[ebp-38]
 006A01D3    mov         edx,3
 006A01D8    call        @UStrCatN
 006A01DD    mov         edx,dword ptr [ebp-38]
 006A01E0    mov         ecx,esi
 006A01E2    add         ecx,66
 006A01E5    mov         eax,dword ptr [ebp-4]
 006A01E8    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A01EB    call        THashTable.Add
 006A01F0    push        6A5F84;'led'
 006A01F5    lea         edx,[ebp-44]
 006A01F8    mov         eax,ebx
 006A01FA    call        IntToStr
 006A01FF    push        dword ptr [ebp-44]
 006A0202    push        6A5FA8;'v1'
 006A0207    lea         eax,[ebp-40]
 006A020A    mov         edx,3
 006A020F    call        @UStrCatN
 006A0214    mov         edx,dword ptr [ebp-40]
 006A0217    mov         ecx,esi
 006A0219    add         ecx,67
 006A021C    mov         eax,dword ptr [ebp-4]
 006A021F    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0222    call        THashTable.Add
 006A0227    push        6A5F84;'led'
 006A022C    lea         edx,[ebp-4C]
 006A022F    mov         eax,ebx
 006A0231    call        IntToStr
 006A0236    push        dword ptr [ebp-4C]
 006A0239    push        6A5FBC;'v2'
 006A023E    lea         eax,[ebp-48]
 006A0241    mov         edx,3
 006A0246    call        @UStrCatN
 006A024B    mov         edx,dword ptr [ebp-48]
 006A024E    mov         ecx,esi
 006A0250    add         ecx,68
 006A0253    mov         eax,dword ptr [ebp-4]
 006A0256    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0259    call        THashTable.Add
 006A025E    push        6A5F84;'led'
 006A0263    lea         edx,[ebp-54]
 006A0266    mov         eax,ebx
 006A0268    call        IntToStr
 006A026D    push        dword ptr [ebp-54]
 006A0270    push        6A5FD0;'vis'
 006A0275    lea         eax,[ebp-50]
 006A0278    mov         edx,3
 006A027D    call        @UStrCatN
 006A0282    mov         edx,dword ptr [ebp-50]
 006A0285    mov         ecx,esi
 006A0287    add         ecx,65
 006A028A    mov         eax,dword ptr [ebp-4]
 006A028D    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0290    call        THashTable.Add
 006A0295    push        6A5F84;'led'
 006A029A    lea         edx,[ebp-5C]
 006A029D    mov         eax,ebx
 006A029F    call        IntToStr
 006A02A4    push        dword ptr [ebp-5C]
 006A02A7    push        6A5FE4;'err'
 006A02AC    lea         eax,[ebp-58]
 006A02AF    mov         edx,3
 006A02B4    call        @UStrCatN
 006A02B9    mov         edx,dword ptr [ebp-58]
 006A02BC    lea         ecx,[ebx+0B8]
 006A02C2    mov         eax,dword ptr [ebp-4]
 006A02C5    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A02C8    call        THashTable.Add
 006A02CD    inc         ebx
 006A02CE    cmp         ebx,8
>006A02D1    jne         006A010A
 006A02D7    mov         eax,dword ptr [ebp-4]
 006A02DA    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A02DD    mov         ecx,0A9
 006A02E2    mov         edx,6A5FF8;'Speed'
 006A02E7    call        THashTable.Add
 006A02EC    mov         eax,dword ptr [ebp-4]
 006A02EF    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A02F2    mov         ecx,0AB
 006A02F7    mov         edx,6A6010;'TooFarLeft'
 006A02FC    call        THashTable.Add
 006A0301    mov         eax,dword ptr [ebp-4]
 006A0304    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0307    mov         ecx,0AC
 006A030C    mov         edx,6A6034;'TooFarRight'
 006A0311    call        THashTable.Add
 006A0316    mov         eax,dword ptr [ebp-4]
 006A0319    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A031C    mov         ecx,0AD
 006A0321    mov         edx,6A6058;'TooFarUp'
 006A0326    call        THashTable.Add
 006A032B    mov         eax,dword ptr [ebp-4]
 006A032E    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0331    mov         ecx,0AE
 006A0336    mov         edx,6A6078;'TooFarDown'
 006A033B    call        THashTable.Add
 006A0340    mov         eax,dword ptr [ebp-4]
 006A0343    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0346    mov         ecx,0AF
 006A034B    mov         edx,6A609C;'TooFarForward'
 006A0350    call        THashTable.Add
 006A0355    mov         eax,dword ptr [ebp-4]
 006A0358    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A035B    mov         ecx,0B0
 006A0360    mov         edx,6A60C4;'TooFarBack'
 006A0365    call        THashTable.Add
 006A036A    mov         eax,dword ptr [ebp-4]
 006A036D    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0370    mov         ecx,0B1
 006A0375    mov         edx,6A60E8;'SwitchedOff'
 006A037A    call        THashTable.Add
 006A037F    mov         eax,dword ptr [ebp-4]
 006A0382    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0385    mov         ecx,0B2
 006A038A    mov         edx,6A610C;'BehindSomething'
 006A038F    call        THashTable.Add
 006A0394    mov         eax,dword ptr [ebp-4]
 006A0397    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A039A    mov         ecx,0E8
 006A039F    mov         edx,6A6138;'UntrackableAngle'
 006A03A4    call        THashTable.Add
 006A03A9    mov         eax,dword ptr [ebp-4]
 006A03AC    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A03AF    mov         ecx,0E9
 006A03B4    mov         edx,6A6168;'IndexPos'
 006A03B9    call        THashTable.Add
 006A03BE    mov         eax,dword ptr [ebp-4]
 006A03C1    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A03C4    mov         ecx,0C8
 006A03C9    mov         edx,6A6188;'Pos'
 006A03CE    call        THashTable.Add
 006A03D3    mov         eax,dword ptr [ebp-4]
 006A03D6    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A03D9    mov         ecx,0C9
 006A03DE    mov         edx,6A619C;'Velocity'
 006A03E3    call        THashTable.Add
 006A03E8    mov         eax,dword ptr [ebp-4]
 006A03EB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A03EE    mov         ecx,0CA
 006A03F3    mov         edx,6A61BC;'Acceleration'
 006A03F8    call        THashTable.Add
 006A03FD    mov         eax,dword ptr [ebp-4]
 006A0400    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0403    mov         ecx,0CB
 006A0408    mov         edx,6A61E4;'RelativePos'
 006A040D    call        THashTable.Add
 006A0412    mov         eax,dword ptr [ebp-4]
 006A0415    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0418    mov         ecx,0CC
 006A041D    mov         edx,6A6208;'AbsPos'
 006A0422    call        THashTable.Add
 006A0427    mov         eax,dword ptr [ebp-4]
 006A042A    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A042D    mov         ecx,0CD
 006A0432    mov         edx,6A6224;'Led0Pos'
 006A0437    call        THashTable.Add
 006A043C    mov         eax,dword ptr [ebp-4]
 006A043F    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0442    mov         ecx,0CE
 006A0447    mov         edx,6A6240;'Led1Pos'
 006A044C    call        THashTable.Add
 006A0451    mov         eax,dword ptr [ebp-4]
 006A0454    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0457    mov         ecx,0CF
 006A045C    mov         edx,6A625C;'Led2Pos'
 006A0461    call        THashTable.Add
 006A0466    mov         eax,dword ptr [ebp-4]
 006A0469    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A046C    mov         ecx,0D0
 006A0471    mov         edx,6A6278;'Led3Pos'
 006A0476    call        THashTable.Add
 006A047B    mov         eax,dword ptr [ebp-4]
 006A047E    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0481    mov         ecx,0D1
 006A0486    mov         edx,6A6294;'Led4Pos'
 006A048B    call        THashTable.Add
 006A0490    mov         eax,dword ptr [ebp-4]
 006A0493    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0496    mov         ecx,0D2
 006A049B    mov         edx,6A62B0;'Led5Pos'
 006A04A0    call        THashTable.Add
 006A04A5    mov         eax,dword ptr [ebp-4]
 006A04A8    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A04AB    mov         ecx,0D3
 006A04B0    mov         edx,6A62CC;'Led6Pos'
 006A04B5    call        THashTable.Add
 006A04BA    mov         eax,dword ptr [ebp-4]
 006A04BD    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A04C0    mov         ecx,0D4
 006A04C5    mov         edx,6A62E8;'Led7Pos'
 006A04CA    call        THashTable.Add
 006A04CF    mov         eax,dword ptr [ebp-4]
 006A04D2    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A04D5    mov         ecx,0D5
 006A04DA    mov         edx,6A6304;'ThumbDir'
 006A04DF    call        THashTable.Add
 006A04E4    mov         eax,dword ptr [ebp-4]
 006A04E7    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A04EA    mov         ecx,0D6
 006A04EF    mov         edx,6A6324;'FingersDir'
 006A04F4    call        THashTable.Add
 006A04F9    mov         eax,dword ptr [ebp-4]
 006A04FC    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A04FF    mov         ecx,0D9
 006A0504    mov         edx,6A6348;'PalmDir'
 006A0509    call        THashTable.Add
 006A050E    mov         eax,dword ptr [ebp-4]
 006A0511    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0514    mov         ecx,0D7
 006A0519    mov         edx,6A6364;'WristDir'
 006A051E    call        THashTable.Add
 006A0523    mov         eax,dword ptr [ebp-4]
 006A0526    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0529    mov         ecx,0D8
 006A052E    mov         edx,6A6384;'BackOfHandDir'
 006A0533    call        THashTable.Add
 006A0538    mov         eax,dword ptr [ebp-4]
 006A053B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A053E    mov         ecx,0D5
 006A0543    mov         edx,6A6304;'ThumbDir'
 006A0548    call        THashTable.Add
 006A054D    mov         eax,dword ptr [ebp-4]
 006A0550    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0553    mov         ecx,0DA
 006A0558    mov         edx,6A63AC;'Rotation'
 006A055D    call        THashTable.Add
 006A0562    mov         eax,dword ptr [ebp-4]
 006A0565    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0568    mov         ecx,0DA
 006A056D    mov         edx,6A63CC;'Orientation'
 006A0572    call        THashTable.Add
 006A0577    mov         eax,dword ptr [ebp-4]
 006A057A    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A057D    mov         ecx,0DA
 006A0582    mov         edx,6A63F0;'RotMat'
 006A0587    call        THashTable.Add
 006A058C    mov         eax,dword ptr [ebp-4]
 006A058F    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0592    mov         ecx,0DA
 006A0597    mov         edx,6A640C;'FilterRotMat'
 006A059C    call        THashTable.Add
 006A05A1    mov         eax,dword ptr [ebp-4]
 006A05A4    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A05A7    mov         ecx,0DB
 006A05AC    mov         edx,6A6434;'UnfilteredRotMat'
 006A05B1    call        THashTable.Add
 006A05B6    mov         eax,dword ptr [ebp-4]
 006A05B9    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A05BC    mov         ecx,0FA
 006A05C1    mov         edx,6A6464;'ThumbProximal'
 006A05C6    call        THashTable.Add
 006A05CB    mov         eax,dword ptr [ebp-4]
 006A05CE    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A05D1    mov         ecx,0FB
 006A05D6    mov         edx,6A648C;'ThumbMiddle'
 006A05DB    call        THashTable.Add
 006A05E0    mov         eax,dword ptr [ebp-4]
 006A05E3    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A05E6    mov         ecx,0FB
 006A05EB    mov         edx,6A64B0;'ThumbMedial'
 006A05F0    call        THashTable.Add
 006A05F5    mov         eax,dword ptr [ebp-4]
 006A05F8    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A05FB    mov         ecx,0FC
 006A0600    mov         edx,6A64D4;'ThumbDistal'
 006A0605    call        THashTable.Add
 006A060A    mov         eax,dword ptr [ebp-4]
 006A060D    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0610    mov         ecx,0DC
 006A0615    mov         edx,6A64F8;'IndexProximal'
 006A061A    call        THashTable.Add
 006A061F    mov         eax,dword ptr [ebp-4]
 006A0622    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0625    mov         ecx,0DD
 006A062A    mov         edx,6A6520;'IndexMiddle'
 006A062F    call        THashTable.Add
 006A0634    mov         eax,dword ptr [ebp-4]
 006A0637    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A063A    mov         ecx,0DD
 006A063F    mov         edx,6A6544;'IndexMedial'
 006A0644    call        THashTable.Add
 006A0649    mov         eax,dword ptr [ebp-4]
 006A064C    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A064F    mov         ecx,0DE
 006A0654    mov         edx,6A6568;'IndexDistal'
 006A0659    call        THashTable.Add
 006A065E    mov         eax,dword ptr [ebp-4]
 006A0661    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0664    mov         ecx,0DF
 006A0669    mov         edx,6A658C;'MiddleProximal'
 006A066E    call        THashTable.Add
 006A0673    mov         eax,dword ptr [ebp-4]
 006A0676    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0679    mov         ecx,0E0
 006A067E    mov         edx,6A65B8;'MiddleMiddle'
 006A0683    call        THashTable.Add
 006A0688    mov         eax,dword ptr [ebp-4]
 006A068B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A068E    mov         ecx,0DD
 006A0693    mov         edx,6A65E0;'MiddleMedial'
 006A0698    call        THashTable.Add
 006A069D    mov         eax,dword ptr [ebp-4]
 006A06A0    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A06A3    mov         ecx,0E1
 006A06A8    mov         edx,6A6608;'MiddleDistal'
 006A06AD    call        THashTable.Add
 006A06B2    mov         eax,dword ptr [ebp-4]
 006A06B5    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A06B8    mov         ecx,0E2
 006A06BD    mov         edx,6A6630;'RingProximal'
 006A06C2    call        THashTable.Add
 006A06C7    mov         eax,dword ptr [ebp-4]
 006A06CA    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A06CD    mov         ecx,0E3
 006A06D2    mov         edx,6A6658;'RingMiddle'
 006A06D7    call        THashTable.Add
 006A06DC    mov         eax,dword ptr [ebp-4]
 006A06DF    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A06E2    mov         ecx,0DD
 006A06E7    mov         edx,6A667C;'RingMedial'
 006A06EC    call        THashTable.Add
 006A06F1    mov         eax,dword ptr [ebp-4]
 006A06F4    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A06F7    mov         ecx,0E4
 006A06FC    mov         edx,6A66A0;'RingDistal'
 006A0701    call        THashTable.Add
 006A0706    mov         eax,dword ptr [ebp-4]
 006A0709    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A070C    mov         ecx,0E5
 006A0711    mov         edx,6A66C4;'PinkyProximal'
 006A0716    call        THashTable.Add
 006A071B    mov         eax,dword ptr [ebp-4]
 006A071E    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0721    mov         ecx,0E6
 006A0726    mov         edx,6A66EC;'PinkyMiddle'
 006A072B    call        THashTable.Add
 006A0730    mov         eax,dword ptr [ebp-4]
 006A0733    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0736    mov         ecx,0E6
 006A073B    mov         edx,6A6710;'PinkyMedial'
 006A0740    call        THashTable.Add
 006A0745    mov         eax,dword ptr [ebp-4]
 006A0748    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A074B    mov         ecx,0E7
 006A0750    mov         edx,6A6734;'PinkyDistal'
 006A0755    call        THashTable.Add
 006A075A    xor         ebx,ebx
 006A075C    lea         edx,[ebp-64]
 006A075F    mov         eax,ebx
 006A0761    call        IntToStr
 006A0766    mov         ecx,dword ptr [ebp-64]
 006A0769    lea         eax,[ebp-60]
 006A076C    mov         edx,6A6758;'ActualLedPos'
 006A0771    call        @UStrCat3
 006A0776    mov         edx,dword ptr [ebp-60]
 006A0779    lea         ecx,[ebx+0F0]
 006A077F    mov         eax,dword ptr [ebp-4]
 006A0782    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0785    call        THashTable.Add
 006A078A    inc         ebx
 006A078B    cmp         ebx,0A
>006A078E    jne         006A075C
 006A0790    xor         eax,eax
 006A0792    mov         dword ptr [ebp-8],eax
 006A0795    mov         dword ptr [ebp-14],78BE18;^'Left'
 006A079C    mov         dword ptr [ebp-18],78BE3C;^'L'
 006A07A3    xor         eax,eax
 006A07A5    mov         dword ptr [ebp-0C],eax
 006A07A8    mov         edi,78BE24;^'Down'
 006A07AD    mov         dword ptr [ebp-1C],78BE48;^'D'
 006A07B4    xor         eax,eax
 006A07B6    mov         dword ptr [ebp-10],eax
 006A07B9    mov         ebx,78BE30;^'Back'
 006A07BE    mov         esi,78BE54;^'B'
 006A07C3    cmp         dword ptr [ebp-8],1
>006A07C7    jne         006A07D9
 006A07C9    cmp         dword ptr [ebp-0C],1
>006A07CD    jne         006A07D9
 006A07CF    cmp         dword ptr [ebp-10],1
>006A07D3    je          006A326F
 006A07D9    push        6A6780;'Fingers'
 006A07DE    mov         eax,dword ptr [ebp-14]
 006A07E1    push        dword ptr [eax]
 006A07E3    push        dword ptr [edi]
 006A07E5    push        dword ptr [ebx]
 006A07E7    push        6A679C;'Strict'
 006A07EC    lea         eax,[ebp-68]
 006A07EF    mov         edx,5
 006A07F4    call        @UStrCatN
 006A07F9    mov         edx,dword ptr [ebp-68]
 006A07FC    mov         ecx,dword ptr [ebp-8]
 006A07FF    add         ecx,1F4
 006A0805    mov         eax,dword ptr [ebp-0C]
 006A0808    lea         eax,[eax+eax*2]
 006A080B    add         ecx,eax
 006A080D    mov         eax,dword ptr [ebp-10]
 006A0810    lea         eax,[eax+eax*8]
 006A0813    add         ecx,eax
 006A0815    mov         eax,dword ptr [ebp-4]
 006A0818    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A081B    call        THashTable.Add
 006A0820    push        6A67B8;'Palm'
 006A0825    mov         eax,dword ptr [ebp-14]
 006A0828    push        dword ptr [eax]
 006A082A    push        dword ptr [edi]
 006A082C    push        dword ptr [ebx]
 006A082E    push        6A679C;'Strict'
 006A0833    lea         eax,[ebp-6C]
 006A0836    mov         edx,5
 006A083B    call        @UStrCatN
 006A0840    mov         edx,dword ptr [ebp-6C]
 006A0843    mov         ecx,dword ptr [ebp-8]
 006A0846    add         ecx,212
 006A084C    mov         eax,dword ptr [ebp-0C]
 006A084F    lea         eax,[eax+eax*2]
 006A0852    add         ecx,eax
 006A0854    mov         eax,dword ptr [ebp-10]
 006A0857    lea         eax,[eax+eax*8]
 006A085A    add         ecx,eax
 006A085C    mov         eax,dword ptr [ebp-4]
 006A085F    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0862    call        THashTable.Add
 006A0867    push        6A32F4;'Thumb'
 006A086C    mov         eax,dword ptr [ebp-14]
 006A086F    push        dword ptr [eax]
 006A0871    push        dword ptr [edi]
 006A0873    push        dword ptr [ebx]
 006A0875    push        6A679C;'Strict'
 006A087A    lea         eax,[ebp-70]
 006A087D    mov         edx,5
 006A0882    call        @UStrCatN
 006A0887    mov         edx,dword ptr [ebp-70]
 006A088A    mov         ecx,dword ptr [ebp-8]
 006A088D    add         ecx,230
 006A0893    mov         eax,dword ptr [ebp-0C]
 006A0896    lea         eax,[eax+eax*2]
 006A0899    add         ecx,eax
 006A089B    mov         eax,dword ptr [ebp-10]
 006A089E    lea         eax,[eax+eax*8]
 006A08A1    add         ecx,eax
 006A08A3    mov         eax,dword ptr [ebp-4]
 006A08A6    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A08A9    call        THashTable.Add
 006A08AE    push        6A6780;'Fingers'
 006A08B3    push        dword ptr [edi]
 006A08B5    mov         eax,dword ptr [ebp-14]
 006A08B8    push        dword ptr [eax]
 006A08BA    push        dword ptr [ebx]
 006A08BC    push        6A679C;'Strict'
 006A08C1    lea         eax,[ebp-74]
 006A08C4    mov         edx,5
 006A08C9    call        @UStrCatN
 006A08CE    mov         edx,dword ptr [ebp-74]
 006A08D1    mov         ecx,dword ptr [ebp-8]
 006A08D4    add         ecx,1F4
 006A08DA    mov         eax,dword ptr [ebp-0C]
 006A08DD    lea         eax,[eax+eax*2]
 006A08E0    add         ecx,eax
 006A08E2    mov         eax,dword ptr [ebp-10]
 006A08E5    lea         eax,[eax+eax*8]
 006A08E8    add         ecx,eax
 006A08EA    mov         eax,dword ptr [ebp-4]
 006A08ED    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A08F0    call        THashTable.Add
 006A08F5    push        6A67B8;'Palm'
 006A08FA    push        dword ptr [edi]
 006A08FC    mov         eax,dword ptr [ebp-14]
 006A08FF    push        dword ptr [eax]
 006A0901    push        dword ptr [ebx]
 006A0903    push        6A679C;'Strict'
 006A0908    lea         eax,[ebp-78]
 006A090B    mov         edx,5
 006A0910    call        @UStrCatN
 006A0915    mov         edx,dword ptr [ebp-78]
 006A0918    mov         ecx,dword ptr [ebp-8]
 006A091B    add         ecx,212
 006A0921    mov         eax,dword ptr [ebp-0C]
 006A0924    lea         eax,[eax+eax*2]
 006A0927    add         ecx,eax
 006A0929    mov         eax,dword ptr [ebp-10]
 006A092C    lea         eax,[eax+eax*8]
 006A092F    add         ecx,eax
 006A0931    mov         eax,dword ptr [ebp-4]
 006A0934    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0937    call        THashTable.Add
 006A093C    push        6A32F4;'Thumb'
 006A0941    push        dword ptr [edi]
 006A0943    mov         eax,dword ptr [ebp-14]
 006A0946    push        dword ptr [eax]
 006A0948    push        dword ptr [ebx]
 006A094A    push        6A679C;'Strict'
 006A094F    lea         eax,[ebp-7C]
 006A0952    mov         edx,5
 006A0957    call        @UStrCatN
 006A095C    mov         edx,dword ptr [ebp-7C]
 006A095F    mov         ecx,dword ptr [ebp-8]
 006A0962    add         ecx,230
 006A0968    mov         eax,dword ptr [ebp-0C]
 006A096B    lea         eax,[eax+eax*2]
 006A096E    add         ecx,eax
 006A0970    mov         eax,dword ptr [ebp-10]
 006A0973    lea         eax,[eax+eax*8]
 006A0976    add         ecx,eax
 006A0978    mov         eax,dword ptr [ebp-4]
 006A097B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A097E    call        THashTable.Add
 006A0983    push        6A6780;'Fingers'
 006A0988    push        dword ptr [edi]
 006A098A    push        dword ptr [ebx]
 006A098C    mov         eax,dword ptr [ebp-14]
 006A098F    push        dword ptr [eax]
 006A0991    push        6A679C;'Strict'
 006A0996    lea         eax,[ebp-80]
 006A0999    mov         edx,5
 006A099E    call        @UStrCatN
 006A09A3    mov         edx,dword ptr [ebp-80]
 006A09A6    mov         ecx,dword ptr [ebp-8]
 006A09A9    add         ecx,1F4
 006A09AF    mov         eax,dword ptr [ebp-0C]
 006A09B2    lea         eax,[eax+eax*2]
 006A09B5    add         ecx,eax
 006A09B7    mov         eax,dword ptr [ebp-10]
 006A09BA    lea         eax,[eax+eax*8]
 006A09BD    add         ecx,eax
 006A09BF    mov         eax,dword ptr [ebp-4]
 006A09C2    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A09C5    call        THashTable.Add
 006A09CA    push        6A67B8;'Palm'
 006A09CF    push        dword ptr [edi]
 006A09D1    push        dword ptr [ebx]
 006A09D3    mov         eax,dword ptr [ebp-14]
 006A09D6    push        dword ptr [eax]
 006A09D8    push        6A679C;'Strict'
 006A09DD    lea         eax,[ebp-84]
 006A09E3    mov         edx,5
 006A09E8    call        @UStrCatN
 006A09ED    mov         edx,dword ptr [ebp-84]
 006A09F3    mov         ecx,dword ptr [ebp-8]
 006A09F6    add         ecx,212
 006A09FC    mov         eax,dword ptr [ebp-0C]
 006A09FF    lea         eax,[eax+eax*2]
 006A0A02    add         ecx,eax
 006A0A04    mov         eax,dword ptr [ebp-10]
 006A0A07    lea         eax,[eax+eax*8]
 006A0A0A    add         ecx,eax
 006A0A0C    mov         eax,dword ptr [ebp-4]
 006A0A0F    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0A12    call        THashTable.Add
 006A0A17    push        6A32F4;'Thumb'
 006A0A1C    push        dword ptr [edi]
 006A0A1E    push        dword ptr [ebx]
 006A0A20    mov         eax,dword ptr [ebp-14]
 006A0A23    push        dword ptr [eax]
 006A0A25    push        6A679C;'Strict'
 006A0A2A    lea         eax,[ebp-88]
 006A0A30    mov         edx,5
 006A0A35    call        @UStrCatN
 006A0A3A    mov         edx,dword ptr [ebp-88]
 006A0A40    mov         ecx,dword ptr [ebp-8]
 006A0A43    add         ecx,230
 006A0A49    mov         eax,dword ptr [ebp-0C]
 006A0A4C    lea         eax,[eax+eax*2]
 006A0A4F    add         ecx,eax
 006A0A51    mov         eax,dword ptr [ebp-10]
 006A0A54    lea         eax,[eax+eax*8]
 006A0A57    add         ecx,eax
 006A0A59    mov         eax,dword ptr [ebp-4]
 006A0A5C    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0A5F    call        THashTable.Add
 006A0A64    push        6A6780;'Fingers'
 006A0A69    push        dword ptr [ebx]
 006A0A6B    push        dword ptr [edi]
 006A0A6D    mov         eax,dword ptr [ebp-14]
 006A0A70    push        dword ptr [eax]
 006A0A72    push        6A679C;'Strict'
 006A0A77    lea         eax,[ebp-8C]
 006A0A7D    mov         edx,5
 006A0A82    call        @UStrCatN
 006A0A87    mov         edx,dword ptr [ebp-8C]
 006A0A8D    mov         ecx,dword ptr [ebp-8]
 006A0A90    add         ecx,1F4
 006A0A96    mov         eax,dword ptr [ebp-0C]
 006A0A99    lea         eax,[eax+eax*2]
 006A0A9C    add         ecx,eax
 006A0A9E    mov         eax,dword ptr [ebp-10]
 006A0AA1    lea         eax,[eax+eax*8]
 006A0AA4    add         ecx,eax
 006A0AA6    mov         eax,dword ptr [ebp-4]
 006A0AA9    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0AAC    call        THashTable.Add
 006A0AB1    push        6A67B8;'Palm'
 006A0AB6    push        dword ptr [ebx]
 006A0AB8    push        dword ptr [edi]
 006A0ABA    mov         eax,dword ptr [ebp-14]
 006A0ABD    push        dword ptr [eax]
 006A0ABF    push        6A679C;'Strict'
 006A0AC4    lea         eax,[ebp-90]
 006A0ACA    mov         edx,5
 006A0ACF    call        @UStrCatN
 006A0AD4    mov         edx,dword ptr [ebp-90]
 006A0ADA    mov         ecx,dword ptr [ebp-8]
 006A0ADD    add         ecx,212
 006A0AE3    mov         eax,dword ptr [ebp-0C]
 006A0AE6    lea         eax,[eax+eax*2]
 006A0AE9    add         ecx,eax
 006A0AEB    mov         eax,dword ptr [ebp-10]
 006A0AEE    lea         eax,[eax+eax*8]
 006A0AF1    add         ecx,eax
 006A0AF3    mov         eax,dword ptr [ebp-4]
 006A0AF6    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0AF9    call        THashTable.Add
 006A0AFE    push        6A32F4;'Thumb'
 006A0B03    push        dword ptr [ebx]
 006A0B05    push        dword ptr [edi]
 006A0B07    mov         eax,dword ptr [ebp-14]
 006A0B0A    push        dword ptr [eax]
 006A0B0C    push        6A679C;'Strict'
 006A0B11    lea         eax,[ebp-94]
 006A0B17    mov         edx,5
 006A0B1C    call        @UStrCatN
 006A0B21    mov         edx,dword ptr [ebp-94]
 006A0B27    mov         ecx,dword ptr [ebp-8]
 006A0B2A    add         ecx,230
 006A0B30    mov         eax,dword ptr [ebp-0C]
 006A0B33    lea         eax,[eax+eax*2]
 006A0B36    add         ecx,eax
 006A0B38    mov         eax,dword ptr [ebp-10]
 006A0B3B    lea         eax,[eax+eax*8]
 006A0B3E    add         ecx,eax
 006A0B40    mov         eax,dword ptr [ebp-4]
 006A0B43    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0B46    call        THashTable.Add
 006A0B4B    push        6A6780;'Fingers'
 006A0B50    push        dword ptr [ebx]
 006A0B52    mov         eax,dword ptr [ebp-14]
 006A0B55    push        dword ptr [eax]
 006A0B57    push        dword ptr [edi]
 006A0B59    push        6A679C;'Strict'
 006A0B5E    lea         eax,[ebp-98]
 006A0B64    mov         edx,5
 006A0B69    call        @UStrCatN
 006A0B6E    mov         edx,dword ptr [ebp-98]
 006A0B74    mov         ecx,dword ptr [ebp-8]
 006A0B77    add         ecx,1F4
 006A0B7D    mov         eax,dword ptr [ebp-0C]
 006A0B80    lea         eax,[eax+eax*2]
 006A0B83    add         ecx,eax
 006A0B85    mov         eax,dword ptr [ebp-10]
 006A0B88    lea         eax,[eax+eax*8]
 006A0B8B    add         ecx,eax
 006A0B8D    mov         eax,dword ptr [ebp-4]
 006A0B90    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0B93    call        THashTable.Add
 006A0B98    push        6A67B8;'Palm'
 006A0B9D    push        dword ptr [ebx]
 006A0B9F    mov         eax,dword ptr [ebp-14]
 006A0BA2    push        dword ptr [eax]
 006A0BA4    push        dword ptr [edi]
 006A0BA6    push        6A679C;'Strict'
 006A0BAB    lea         eax,[ebp-9C]
 006A0BB1    mov         edx,5
 006A0BB6    call        @UStrCatN
 006A0BBB    mov         edx,dword ptr [ebp-9C]
 006A0BC1    mov         ecx,dword ptr [ebp-8]
 006A0BC4    add         ecx,212
 006A0BCA    mov         eax,dword ptr [ebp-0C]
 006A0BCD    lea         eax,[eax+eax*2]
 006A0BD0    add         ecx,eax
 006A0BD2    mov         eax,dword ptr [ebp-10]
 006A0BD5    lea         eax,[eax+eax*8]
 006A0BD8    add         ecx,eax
 006A0BDA    mov         eax,dword ptr [ebp-4]
 006A0BDD    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0BE0    call        THashTable.Add
 006A0BE5    push        6A32F4;'Thumb'
 006A0BEA    push        dword ptr [ebx]
 006A0BEC    mov         eax,dword ptr [ebp-14]
 006A0BEF    push        dword ptr [eax]
 006A0BF1    push        dword ptr [edi]
 006A0BF3    push        6A679C;'Strict'
 006A0BF8    lea         eax,[ebp-0A0]
 006A0BFE    mov         edx,5
 006A0C03    call        @UStrCatN
 006A0C08    mov         edx,dword ptr [ebp-0A0]
 006A0C0E    mov         ecx,dword ptr [ebp-8]
 006A0C11    add         ecx,230
 006A0C17    mov         eax,dword ptr [ebp-0C]
 006A0C1A    lea         eax,[eax+eax*2]
 006A0C1D    add         ecx,eax
 006A0C1F    mov         eax,dword ptr [ebp-10]
 006A0C22    lea         eax,[eax+eax*8]
 006A0C25    add         ecx,eax
 006A0C27    mov         eax,dword ptr [ebp-4]
 006A0C2A    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0C2D    call        THashTable.Add
 006A0C32    push        6A6780;'Fingers'
 006A0C37    mov         eax,dword ptr [ebp-14]
 006A0C3A    push        dword ptr [eax]
 006A0C3C    push        dword ptr [ebx]
 006A0C3E    push        dword ptr [edi]
 006A0C40    push        6A679C;'Strict'
 006A0C45    lea         eax,[ebp-0A4]
 006A0C4B    mov         edx,5
 006A0C50    call        @UStrCatN
 006A0C55    mov         edx,dword ptr [ebp-0A4]
 006A0C5B    mov         ecx,dword ptr [ebp-8]
 006A0C5E    add         ecx,1F4
 006A0C64    mov         eax,dword ptr [ebp-0C]
 006A0C67    lea         eax,[eax+eax*2]
 006A0C6A    add         ecx,eax
 006A0C6C    mov         eax,dword ptr [ebp-10]
 006A0C6F    lea         eax,[eax+eax*8]
 006A0C72    add         ecx,eax
 006A0C74    mov         eax,dword ptr [ebp-4]
 006A0C77    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0C7A    call        THashTable.Add
 006A0C7F    push        6A67B8;'Palm'
 006A0C84    mov         eax,dword ptr [ebp-14]
 006A0C87    push        dword ptr [eax]
 006A0C89    push        dword ptr [ebx]
 006A0C8B    push        dword ptr [edi]
 006A0C8D    push        6A679C;'Strict'
 006A0C92    lea         eax,[ebp-0A8]
 006A0C98    mov         edx,5
 006A0C9D    call        @UStrCatN
 006A0CA2    mov         edx,dword ptr [ebp-0A8]
 006A0CA8    mov         ecx,dword ptr [ebp-8]
 006A0CAB    add         ecx,212
 006A0CB1    mov         eax,dword ptr [ebp-0C]
 006A0CB4    lea         eax,[eax+eax*2]
 006A0CB7    add         ecx,eax
 006A0CB9    mov         eax,dword ptr [ebp-10]
 006A0CBC    lea         eax,[eax+eax*8]
 006A0CBF    add         ecx,eax
 006A0CC1    mov         eax,dword ptr [ebp-4]
 006A0CC4    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0CC7    call        THashTable.Add
 006A0CCC    push        6A32F4;'Thumb'
 006A0CD1    mov         eax,dword ptr [ebp-14]
 006A0CD4    push        dword ptr [eax]
 006A0CD6    push        dword ptr [ebx]
 006A0CD8    push        dword ptr [edi]
 006A0CDA    push        6A679C;'Strict'
 006A0CDF    lea         eax,[ebp-0AC]
 006A0CE5    mov         edx,5
 006A0CEA    call        @UStrCatN
 006A0CEF    mov         edx,dword ptr [ebp-0AC]
 006A0CF5    mov         ecx,dword ptr [ebp-8]
 006A0CF8    add         ecx,230
 006A0CFE    mov         eax,dword ptr [ebp-0C]
 006A0D01    lea         eax,[eax+eax*2]
 006A0D04    add         ecx,eax
 006A0D06    mov         eax,dword ptr [ebp-10]
 006A0D09    lea         eax,[eax+eax*8]
 006A0D0C    add         ecx,eax
 006A0D0E    mov         eax,dword ptr [ebp-4]
 006A0D11    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0D14    call        THashTable.Add
 006A0D19    push        6A6780;'Fingers'
 006A0D1E    mov         eax,dword ptr [ebp-14]
 006A0D21    push        dword ptr [eax]
 006A0D23    push        dword ptr [edi]
 006A0D25    push        dword ptr [ebx]
 006A0D27    push        6A67D0;'Vague'
 006A0D2C    lea         eax,[ebp-0B0]
 006A0D32    mov         edx,5
 006A0D37    call        @UStrCatN
 006A0D3C    mov         edx,dword ptr [ebp-0B0]
 006A0D42    mov         ecx,dword ptr [ebp-8]
 006A0D45    add         ecx,258
 006A0D4B    mov         eax,dword ptr [ebp-0C]
 006A0D4E    lea         eax,[eax+eax*2]
 006A0D51    add         ecx,eax
 006A0D53    mov         eax,dword ptr [ebp-10]
 006A0D56    lea         eax,[eax+eax*8]
 006A0D59    add         ecx,eax
 006A0D5B    mov         eax,dword ptr [ebp-4]
 006A0D5E    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0D61    call        THashTable.Add
 006A0D66    push        6A67B8;'Palm'
 006A0D6B    mov         eax,dword ptr [ebp-14]
 006A0D6E    push        dword ptr [eax]
 006A0D70    push        dword ptr [edi]
 006A0D72    push        dword ptr [ebx]
 006A0D74    push        6A67D0;'Vague'
 006A0D79    lea         eax,[ebp-0B4]
 006A0D7F    mov         edx,5
 006A0D84    call        @UStrCatN
 006A0D89    mov         edx,dword ptr [ebp-0B4]
 006A0D8F    mov         ecx,dword ptr [ebp-8]
 006A0D92    add         ecx,276
 006A0D98    mov         eax,dword ptr [ebp-0C]
 006A0D9B    lea         eax,[eax+eax*2]
 006A0D9E    add         ecx,eax
 006A0DA0    mov         eax,dword ptr [ebp-10]
 006A0DA3    lea         eax,[eax+eax*8]
 006A0DA6    add         ecx,eax
 006A0DA8    mov         eax,dword ptr [ebp-4]
 006A0DAB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0DAE    call        THashTable.Add
 006A0DB3    push        6A32F4;'Thumb'
 006A0DB8    mov         eax,dword ptr [ebp-14]
 006A0DBB    push        dword ptr [eax]
 006A0DBD    push        dword ptr [edi]
 006A0DBF    push        dword ptr [ebx]
 006A0DC1    push        6A67D0;'Vague'
 006A0DC6    lea         eax,[ebp-0B8]
 006A0DCC    mov         edx,5
 006A0DD1    call        @UStrCatN
 006A0DD6    mov         edx,dword ptr [ebp-0B8]
 006A0DDC    mov         ecx,dword ptr [ebp-8]
 006A0DDF    add         ecx,294
 006A0DE5    mov         eax,dword ptr [ebp-0C]
 006A0DE8    lea         eax,[eax+eax*2]
 006A0DEB    add         ecx,eax
 006A0DED    mov         eax,dword ptr [ebp-10]
 006A0DF0    lea         eax,[eax+eax*8]
 006A0DF3    add         ecx,eax
 006A0DF5    mov         eax,dword ptr [ebp-4]
 006A0DF8    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0DFB    call        THashTable.Add
 006A0E00    push        6A6780;'Fingers'
 006A0E05    push        dword ptr [edi]
 006A0E07    mov         eax,dword ptr [ebp-14]
 006A0E0A    push        dword ptr [eax]
 006A0E0C    push        dword ptr [ebx]
 006A0E0E    push        6A67D0;'Vague'
 006A0E13    lea         eax,[ebp-0BC]
 006A0E19    mov         edx,5
 006A0E1E    call        @UStrCatN
 006A0E23    mov         edx,dword ptr [ebp-0BC]
 006A0E29    mov         ecx,dword ptr [ebp-8]
 006A0E2C    add         ecx,258
 006A0E32    mov         eax,dword ptr [ebp-0C]
 006A0E35    lea         eax,[eax+eax*2]
 006A0E38    add         ecx,eax
 006A0E3A    mov         eax,dword ptr [ebp-10]
 006A0E3D    lea         eax,[eax+eax*8]
 006A0E40    add         ecx,eax
 006A0E42    mov         eax,dword ptr [ebp-4]
 006A0E45    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0E48    call        THashTable.Add
 006A0E4D    push        6A67B8;'Palm'
 006A0E52    push        dword ptr [edi]
 006A0E54    mov         eax,dword ptr [ebp-14]
 006A0E57    push        dword ptr [eax]
 006A0E59    push        dword ptr [ebx]
 006A0E5B    push        6A67D0;'Vague'
 006A0E60    lea         eax,[ebp-0C0]
 006A0E66    mov         edx,5
 006A0E6B    call        @UStrCatN
 006A0E70    mov         edx,dword ptr [ebp-0C0]
 006A0E76    mov         ecx,dword ptr [ebp-8]
 006A0E79    add         ecx,276
 006A0E7F    mov         eax,dword ptr [ebp-0C]
 006A0E82    lea         eax,[eax+eax*2]
 006A0E85    add         ecx,eax
 006A0E87    mov         eax,dword ptr [ebp-10]
 006A0E8A    lea         eax,[eax+eax*8]
 006A0E8D    add         ecx,eax
 006A0E8F    mov         eax,dword ptr [ebp-4]
 006A0E92    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0E95    call        THashTable.Add
 006A0E9A    push        6A32F4;'Thumb'
 006A0E9F    push        dword ptr [edi]
 006A0EA1    mov         eax,dword ptr [ebp-14]
 006A0EA4    push        dword ptr [eax]
 006A0EA6    push        dword ptr [ebx]
 006A0EA8    push        6A67D0;'Vague'
 006A0EAD    lea         eax,[ebp-0C4]
 006A0EB3    mov         edx,5
 006A0EB8    call        @UStrCatN
 006A0EBD    mov         edx,dword ptr [ebp-0C4]
 006A0EC3    mov         ecx,dword ptr [ebp-8]
 006A0EC6    add         ecx,294
 006A0ECC    mov         eax,dword ptr [ebp-0C]
 006A0ECF    lea         eax,[eax+eax*2]
 006A0ED2    add         ecx,eax
 006A0ED4    mov         eax,dword ptr [ebp-10]
 006A0ED7    lea         eax,[eax+eax*8]
 006A0EDA    add         ecx,eax
 006A0EDC    mov         eax,dword ptr [ebp-4]
 006A0EDF    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0EE2    call        THashTable.Add
 006A0EE7    push        6A6780;'Fingers'
 006A0EEC    push        dword ptr [edi]
 006A0EEE    push        dword ptr [ebx]
 006A0EF0    mov         eax,dword ptr [ebp-14]
 006A0EF3    push        dword ptr [eax]
 006A0EF5    push        6A67D0;'Vague'
 006A0EFA    lea         eax,[ebp-0C8]
 006A0F00    mov         edx,5
 006A0F05    call        @UStrCatN
 006A0F0A    mov         edx,dword ptr [ebp-0C8]
 006A0F10    mov         ecx,dword ptr [ebp-8]
 006A0F13    add         ecx,258
 006A0F19    mov         eax,dword ptr [ebp-0C]
 006A0F1C    lea         eax,[eax+eax*2]
 006A0F1F    add         ecx,eax
 006A0F21    mov         eax,dword ptr [ebp-10]
 006A0F24    lea         eax,[eax+eax*8]
 006A0F27    add         ecx,eax
 006A0F29    mov         eax,dword ptr [ebp-4]
 006A0F2C    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0F2F    call        THashTable.Add
 006A0F34    push        6A67B8;'Palm'
 006A0F39    push        dword ptr [edi]
 006A0F3B    push        dword ptr [ebx]
 006A0F3D    mov         eax,dword ptr [ebp-14]
 006A0F40    push        dword ptr [eax]
 006A0F42    push        6A67D0;'Vague'
 006A0F47    lea         eax,[ebp-0CC]
 006A0F4D    mov         edx,5
 006A0F52    call        @UStrCatN
 006A0F57    mov         edx,dword ptr [ebp-0CC]
 006A0F5D    mov         ecx,dword ptr [ebp-8]
 006A0F60    add         ecx,276
 006A0F66    mov         eax,dword ptr [ebp-0C]
 006A0F69    lea         eax,[eax+eax*2]
 006A0F6C    add         ecx,eax
 006A0F6E    mov         eax,dword ptr [ebp-10]
 006A0F71    lea         eax,[eax+eax*8]
 006A0F74    add         ecx,eax
 006A0F76    mov         eax,dword ptr [ebp-4]
 006A0F79    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0F7C    call        THashTable.Add
 006A0F81    push        6A32F4;'Thumb'
 006A0F86    push        dword ptr [edi]
 006A0F88    push        dword ptr [ebx]
 006A0F8A    mov         eax,dword ptr [ebp-14]
 006A0F8D    push        dword ptr [eax]
 006A0F8F    push        6A67D0;'Vague'
 006A0F94    lea         eax,[ebp-0D0]
 006A0F9A    mov         edx,5
 006A0F9F    call        @UStrCatN
 006A0FA4    mov         edx,dword ptr [ebp-0D0]
 006A0FAA    mov         ecx,dword ptr [ebp-8]
 006A0FAD    add         ecx,294
 006A0FB3    mov         eax,dword ptr [ebp-0C]
 006A0FB6    lea         eax,[eax+eax*2]
 006A0FB9    add         ecx,eax
 006A0FBB    mov         eax,dword ptr [ebp-10]
 006A0FBE    lea         eax,[eax+eax*8]
 006A0FC1    add         ecx,eax
 006A0FC3    mov         eax,dword ptr [ebp-4]
 006A0FC6    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A0FC9    call        THashTable.Add
 006A0FCE    push        6A6780;'Fingers'
 006A0FD3    push        dword ptr [ebx]
 006A0FD5    push        dword ptr [edi]
 006A0FD7    mov         eax,dword ptr [ebp-14]
 006A0FDA    push        dword ptr [eax]
 006A0FDC    push        6A67D0;'Vague'
 006A0FE1    lea         eax,[ebp-0D4]
 006A0FE7    mov         edx,5
 006A0FEC    call        @UStrCatN
 006A0FF1    mov         edx,dword ptr [ebp-0D4]
 006A0FF7    mov         ecx,dword ptr [ebp-8]
 006A0FFA    add         ecx,258
 006A1000    mov         eax,dword ptr [ebp-0C]
 006A1003    lea         eax,[eax+eax*2]
 006A1006    add         ecx,eax
 006A1008    mov         eax,dword ptr [ebp-10]
 006A100B    lea         eax,[eax+eax*8]
 006A100E    add         ecx,eax
 006A1010    mov         eax,dword ptr [ebp-4]
 006A1013    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1016    call        THashTable.Add
 006A101B    push        6A67B8;'Palm'
 006A1020    push        dword ptr [ebx]
 006A1022    push        dword ptr [edi]
 006A1024    mov         eax,dword ptr [ebp-14]
 006A1027    push        dword ptr [eax]
 006A1029    push        6A67D0;'Vague'
 006A102E    lea         eax,[ebp-0D8]
 006A1034    mov         edx,5
 006A1039    call        @UStrCatN
 006A103E    mov         edx,dword ptr [ebp-0D8]
 006A1044    mov         ecx,dword ptr [ebp-8]
 006A1047    add         ecx,276
 006A104D    mov         eax,dword ptr [ebp-0C]
 006A1050    lea         eax,[eax+eax*2]
 006A1053    add         ecx,eax
 006A1055    mov         eax,dword ptr [ebp-10]
 006A1058    lea         eax,[eax+eax*8]
 006A105B    add         ecx,eax
 006A105D    mov         eax,dword ptr [ebp-4]
 006A1060    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1063    call        THashTable.Add
 006A1068    push        6A32F4;'Thumb'
 006A106D    push        dword ptr [ebx]
 006A106F    push        dword ptr [edi]
 006A1071    mov         eax,dword ptr [ebp-14]
 006A1074    push        dword ptr [eax]
 006A1076    push        6A67D0;'Vague'
 006A107B    lea         eax,[ebp-0DC]
 006A1081    mov         edx,5
 006A1086    call        @UStrCatN
 006A108B    mov         edx,dword ptr [ebp-0DC]
 006A1091    mov         ecx,dword ptr [ebp-8]
 006A1094    add         ecx,294
 006A109A    mov         eax,dword ptr [ebp-0C]
 006A109D    lea         eax,[eax+eax*2]
 006A10A0    add         ecx,eax
 006A10A2    mov         eax,dword ptr [ebp-10]
 006A10A5    lea         eax,[eax+eax*8]
 006A10A8    add         ecx,eax
 006A10AA    mov         eax,dword ptr [ebp-4]
 006A10AD    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A10B0    call        THashTable.Add
 006A10B5    push        6A6780;'Fingers'
 006A10BA    push        dword ptr [ebx]
 006A10BC    mov         eax,dword ptr [ebp-14]
 006A10BF    push        dword ptr [eax]
 006A10C1    push        dword ptr [edi]
 006A10C3    push        6A67D0;'Vague'
 006A10C8    lea         eax,[ebp-0E0]
 006A10CE    mov         edx,5
 006A10D3    call        @UStrCatN
 006A10D8    mov         edx,dword ptr [ebp-0E0]
 006A10DE    mov         ecx,dword ptr [ebp-8]
 006A10E1    add         ecx,258
 006A10E7    mov         eax,dword ptr [ebp-0C]
 006A10EA    lea         eax,[eax+eax*2]
 006A10ED    add         ecx,eax
 006A10EF    mov         eax,dword ptr [ebp-10]
 006A10F2    lea         eax,[eax+eax*8]
 006A10F5    add         ecx,eax
 006A10F7    mov         eax,dword ptr [ebp-4]
 006A10FA    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A10FD    call        THashTable.Add
 006A1102    push        6A67B8;'Palm'
 006A1107    push        dword ptr [ebx]
 006A1109    mov         eax,dword ptr [ebp-14]
 006A110C    push        dword ptr [eax]
 006A110E    push        dword ptr [edi]
 006A1110    push        6A67D0;'Vague'
 006A1115    lea         eax,[ebp-0E4]
 006A111B    mov         edx,5
 006A1120    call        @UStrCatN
 006A1125    mov         edx,dword ptr [ebp-0E4]
 006A112B    mov         ecx,dword ptr [ebp-8]
 006A112E    add         ecx,276
 006A1134    mov         eax,dword ptr [ebp-0C]
 006A1137    lea         eax,[eax+eax*2]
 006A113A    add         ecx,eax
 006A113C    mov         eax,dword ptr [ebp-10]
 006A113F    lea         eax,[eax+eax*8]
 006A1142    add         ecx,eax
 006A1144    mov         eax,dword ptr [ebp-4]
 006A1147    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A114A    call        THashTable.Add
 006A114F    push        6A32F4;'Thumb'
 006A1154    push        dword ptr [ebx]
 006A1156    mov         eax,dword ptr [ebp-14]
 006A1159    push        dword ptr [eax]
 006A115B    push        dword ptr [edi]
 006A115D    push        6A67D0;'Vague'
 006A1162    lea         eax,[ebp-0E8]
 006A1168    mov         edx,5
 006A116D    call        @UStrCatN
 006A1172    mov         edx,dword ptr [ebp-0E8]
 006A1178    mov         ecx,dword ptr [ebp-8]
 006A117B    add         ecx,294
 006A1181    mov         eax,dword ptr [ebp-0C]
 006A1184    lea         eax,[eax+eax*2]
 006A1187    add         ecx,eax
 006A1189    mov         eax,dword ptr [ebp-10]
 006A118C    lea         eax,[eax+eax*8]
 006A118F    add         ecx,eax
 006A1191    mov         eax,dword ptr [ebp-4]
 006A1194    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1197    call        THashTable.Add
 006A119C    push        6A6780;'Fingers'
 006A11A1    mov         eax,dword ptr [ebp-14]
 006A11A4    push        dword ptr [eax]
 006A11A6    push        dword ptr [ebx]
 006A11A8    push        dword ptr [edi]
 006A11AA    push        6A67D0;'Vague'
 006A11AF    lea         eax,[ebp-0EC]
 006A11B5    mov         edx,5
 006A11BA    call        @UStrCatN
 006A11BF    mov         edx,dword ptr [ebp-0EC]
 006A11C5    mov         ecx,dword ptr [ebp-8]
 006A11C8    add         ecx,258
 006A11CE    mov         eax,dword ptr [ebp-0C]
 006A11D1    lea         eax,[eax+eax*2]
 006A11D4    add         ecx,eax
 006A11D6    mov         eax,dword ptr [ebp-10]
 006A11D9    lea         eax,[eax+eax*8]
 006A11DC    add         ecx,eax
 006A11DE    mov         eax,dword ptr [ebp-4]
 006A11E1    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A11E4    call        THashTable.Add
 006A11E9    push        6A67B8;'Palm'
 006A11EE    mov         eax,dword ptr [ebp-14]
 006A11F1    push        dword ptr [eax]
 006A11F3    push        dword ptr [ebx]
 006A11F5    push        dword ptr [edi]
 006A11F7    push        6A67D0;'Vague'
 006A11FC    lea         eax,[ebp-0F0]
 006A1202    mov         edx,5
 006A1207    call        @UStrCatN
 006A120C    mov         edx,dword ptr [ebp-0F0]
 006A1212    mov         ecx,dword ptr [ebp-8]
 006A1215    add         ecx,276
 006A121B    mov         eax,dword ptr [ebp-0C]
 006A121E    lea         eax,[eax+eax*2]
 006A1221    add         ecx,eax
 006A1223    mov         eax,dword ptr [ebp-10]
 006A1226    lea         eax,[eax+eax*8]
 006A1229    add         ecx,eax
 006A122B    mov         eax,dword ptr [ebp-4]
 006A122E    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1231    call        THashTable.Add
 006A1236    push        6A32F4;'Thumb'
 006A123B    mov         eax,dword ptr [ebp-14]
 006A123E    push        dword ptr [eax]
 006A1240    push        dword ptr [ebx]
 006A1242    push        dword ptr [edi]
 006A1244    push        6A67D0;'Vague'
 006A1249    lea         eax,[ebp-0F4]
 006A124F    mov         edx,5
 006A1254    call        @UStrCatN
 006A1259    mov         edx,dword ptr [ebp-0F4]
 006A125F    mov         ecx,dword ptr [ebp-8]
 006A1262    add         ecx,294
 006A1268    mov         eax,dword ptr [ebp-0C]
 006A126B    lea         eax,[eax+eax*2]
 006A126E    add         ecx,eax
 006A1270    mov         eax,dword ptr [ebp-10]
 006A1273    lea         eax,[eax+eax*8]
 006A1276    add         ecx,eax
 006A1278    mov         eax,dword ptr [ebp-4]
 006A127B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A127E    call        THashTable.Add
 006A1283    push        6A6780;'Fingers'
 006A1288    mov         eax,dword ptr [ebp-14]
 006A128B    push        dword ptr [eax]
 006A128D    push        dword ptr [edi]
 006A128F    push        dword ptr [ebx]
 006A1291    lea         eax,[ebp-0F8]
 006A1297    mov         edx,4
 006A129C    call        @UStrCatN
 006A12A1    mov         edx,dword ptr [ebp-0F8]
 006A12A7    mov         ecx,dword ptr [ebp-8]
 006A12AA    add         ecx,190
 006A12B0    mov         eax,dword ptr [ebp-0C]
 006A12B3    lea         eax,[eax+eax*2]
 006A12B6    add         ecx,eax
 006A12B8    mov         eax,dword ptr [ebp-10]
 006A12BB    lea         eax,[eax+eax*8]
 006A12BE    add         ecx,eax
 006A12C0    mov         eax,dword ptr [ebp-4]
 006A12C3    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A12C6    call        THashTable.Add
 006A12CB    push        6A67B8;'Palm'
 006A12D0    mov         eax,dword ptr [ebp-14]
 006A12D3    push        dword ptr [eax]
 006A12D5    push        dword ptr [edi]
 006A12D7    push        dword ptr [ebx]
 006A12D9    lea         eax,[ebp-0FC]
 006A12DF    mov         edx,4
 006A12E4    call        @UStrCatN
 006A12E9    mov         edx,dword ptr [ebp-0FC]
 006A12EF    mov         ecx,dword ptr [ebp-8]
 006A12F2    add         ecx,1AE
 006A12F8    mov         eax,dword ptr [ebp-0C]
 006A12FB    lea         eax,[eax+eax*2]
 006A12FE    add         ecx,eax
 006A1300    mov         eax,dword ptr [ebp-10]
 006A1303    lea         eax,[eax+eax*8]
 006A1306    add         ecx,eax
 006A1308    mov         eax,dword ptr [ebp-4]
 006A130B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A130E    call        THashTable.Add
 006A1313    push        6A32F4;'Thumb'
 006A1318    mov         eax,dword ptr [ebp-14]
 006A131B    push        dword ptr [eax]
 006A131D    push        dword ptr [edi]
 006A131F    push        dword ptr [ebx]
 006A1321    lea         eax,[ebp-100]
 006A1327    mov         edx,4
 006A132C    call        @UStrCatN
 006A1331    mov         edx,dword ptr [ebp-100]
 006A1337    mov         ecx,dword ptr [ebp-8]
 006A133A    add         ecx,1CC
 006A1340    mov         eax,dword ptr [ebp-0C]
 006A1343    lea         eax,[eax+eax*2]
 006A1346    add         ecx,eax
 006A1348    mov         eax,dword ptr [ebp-10]
 006A134B    lea         eax,[eax+eax*8]
 006A134E    add         ecx,eax
 006A1350    mov         eax,dword ptr [ebp-4]
 006A1353    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1356    call        THashTable.Add
 006A135B    push        6A6780;'Fingers'
 006A1360    push        dword ptr [edi]
 006A1362    mov         eax,dword ptr [ebp-14]
 006A1365    push        dword ptr [eax]
 006A1367    push        dword ptr [ebx]
 006A1369    lea         eax,[ebp-104]
 006A136F    mov         edx,4
 006A1374    call        @UStrCatN
 006A1379    mov         edx,dword ptr [ebp-104]
 006A137F    mov         ecx,dword ptr [ebp-8]
 006A1382    add         ecx,190
 006A1388    mov         eax,dword ptr [ebp-0C]
 006A138B    lea         eax,[eax+eax*2]
 006A138E    add         ecx,eax
 006A1390    mov         eax,dword ptr [ebp-10]
 006A1393    lea         eax,[eax+eax*8]
 006A1396    add         ecx,eax
 006A1398    mov         eax,dword ptr [ebp-4]
 006A139B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A139E    call        THashTable.Add
 006A13A3    push        6A67B8;'Palm'
 006A13A8    push        dword ptr [edi]
 006A13AA    mov         eax,dword ptr [ebp-14]
 006A13AD    push        dword ptr [eax]
 006A13AF    push        dword ptr [ebx]
 006A13B1    lea         eax,[ebp-108]
 006A13B7    mov         edx,4
 006A13BC    call        @UStrCatN
 006A13C1    mov         edx,dword ptr [ebp-108]
 006A13C7    mov         ecx,dword ptr [ebp-8]
 006A13CA    add         ecx,1AE
 006A13D0    mov         eax,dword ptr [ebp-0C]
 006A13D3    lea         eax,[eax+eax*2]
 006A13D6    add         ecx,eax
 006A13D8    mov         eax,dword ptr [ebp-10]
 006A13DB    lea         eax,[eax+eax*8]
 006A13DE    add         ecx,eax
 006A13E0    mov         eax,dword ptr [ebp-4]
 006A13E3    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A13E6    call        THashTable.Add
 006A13EB    push        6A32F4;'Thumb'
 006A13F0    push        dword ptr [edi]
 006A13F2    mov         eax,dword ptr [ebp-14]
 006A13F5    push        dword ptr [eax]
 006A13F7    push        dword ptr [ebx]
 006A13F9    lea         eax,[ebp-10C]
 006A13FF    mov         edx,4
 006A1404    call        @UStrCatN
 006A1409    mov         edx,dword ptr [ebp-10C]
 006A140F    mov         ecx,dword ptr [ebp-8]
 006A1412    add         ecx,1CC
 006A1418    mov         eax,dword ptr [ebp-0C]
 006A141B    lea         eax,[eax+eax*2]
 006A141E    add         ecx,eax
 006A1420    mov         eax,dword ptr [ebp-10]
 006A1423    lea         eax,[eax+eax*8]
 006A1426    add         ecx,eax
 006A1428    mov         eax,dword ptr [ebp-4]
 006A142B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A142E    call        THashTable.Add
 006A1433    push        6A6780;'Fingers'
 006A1438    push        dword ptr [edi]
 006A143A    push        dword ptr [ebx]
 006A143C    mov         eax,dword ptr [ebp-14]
 006A143F    push        dword ptr [eax]
 006A1441    lea         eax,[ebp-110]
 006A1447    mov         edx,4
 006A144C    call        @UStrCatN
 006A1451    mov         edx,dword ptr [ebp-110]
 006A1457    mov         ecx,dword ptr [ebp-8]
 006A145A    add         ecx,190
 006A1460    mov         eax,dword ptr [ebp-0C]
 006A1463    lea         eax,[eax+eax*2]
 006A1466    add         ecx,eax
 006A1468    mov         eax,dword ptr [ebp-10]
 006A146B    lea         eax,[eax+eax*8]
 006A146E    add         ecx,eax
 006A1470    mov         eax,dword ptr [ebp-4]
 006A1473    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1476    call        THashTable.Add
 006A147B    push        6A67B8;'Palm'
 006A1480    push        dword ptr [edi]
 006A1482    push        dword ptr [ebx]
 006A1484    mov         eax,dword ptr [ebp-14]
 006A1487    push        dword ptr [eax]
 006A1489    lea         eax,[ebp-114]
 006A148F    mov         edx,4
 006A1494    call        @UStrCatN
 006A1499    mov         edx,dword ptr [ebp-114]
 006A149F    mov         ecx,dword ptr [ebp-8]
 006A14A2    add         ecx,1AE
 006A14A8    mov         eax,dword ptr [ebp-0C]
 006A14AB    lea         eax,[eax+eax*2]
 006A14AE    add         ecx,eax
 006A14B0    mov         eax,dword ptr [ebp-10]
 006A14B3    lea         eax,[eax+eax*8]
 006A14B6    add         ecx,eax
 006A14B8    mov         eax,dword ptr [ebp-4]
 006A14BB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A14BE    call        THashTable.Add
 006A14C3    push        6A32F4;'Thumb'
 006A14C8    push        dword ptr [edi]
 006A14CA    push        dword ptr [ebx]
 006A14CC    mov         eax,dword ptr [ebp-14]
 006A14CF    push        dword ptr [eax]
 006A14D1    lea         eax,[ebp-118]
 006A14D7    mov         edx,4
 006A14DC    call        @UStrCatN
 006A14E1    mov         edx,dword ptr [ebp-118]
 006A14E7    mov         ecx,dword ptr [ebp-8]
 006A14EA    add         ecx,1CC
 006A14F0    mov         eax,dword ptr [ebp-0C]
 006A14F3    lea         eax,[eax+eax*2]
 006A14F6    add         ecx,eax
 006A14F8    mov         eax,dword ptr [ebp-10]
 006A14FB    lea         eax,[eax+eax*8]
 006A14FE    add         ecx,eax
 006A1500    mov         eax,dword ptr [ebp-4]
 006A1503    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1506    call        THashTable.Add
 006A150B    push        6A6780;'Fingers'
 006A1510    push        dword ptr [ebx]
 006A1512    push        dword ptr [edi]
 006A1514    mov         eax,dword ptr [ebp-14]
 006A1517    push        dword ptr [eax]
 006A1519    lea         eax,[ebp-11C]
 006A151F    mov         edx,4
 006A1524    call        @UStrCatN
 006A1529    mov         edx,dword ptr [ebp-11C]
 006A152F    mov         ecx,dword ptr [ebp-8]
 006A1532    add         ecx,190
 006A1538    mov         eax,dword ptr [ebp-0C]
 006A153B    lea         eax,[eax+eax*2]
 006A153E    add         ecx,eax
 006A1540    mov         eax,dword ptr [ebp-10]
 006A1543    lea         eax,[eax+eax*8]
 006A1546    add         ecx,eax
 006A1548    mov         eax,dword ptr [ebp-4]
 006A154B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A154E    call        THashTable.Add
 006A1553    push        6A67B8;'Palm'
 006A1558    push        dword ptr [ebx]
 006A155A    push        dword ptr [edi]
 006A155C    mov         eax,dword ptr [ebp-14]
 006A155F    push        dword ptr [eax]
 006A1561    lea         eax,[ebp-120]
 006A1567    mov         edx,4
 006A156C    call        @UStrCatN
 006A1571    mov         edx,dword ptr [ebp-120]
 006A1577    mov         ecx,dword ptr [ebp-8]
 006A157A    add         ecx,1AE
 006A1580    mov         eax,dword ptr [ebp-0C]
 006A1583    lea         eax,[eax+eax*2]
 006A1586    add         ecx,eax
 006A1588    mov         eax,dword ptr [ebp-10]
 006A158B    lea         eax,[eax+eax*8]
 006A158E    add         ecx,eax
 006A1590    mov         eax,dword ptr [ebp-4]
 006A1593    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1596    call        THashTable.Add
 006A159B    push        6A32F4;'Thumb'
 006A15A0    push        dword ptr [ebx]
 006A15A2    push        dword ptr [edi]
 006A15A4    mov         eax,dword ptr [ebp-14]
 006A15A7    push        dword ptr [eax]
 006A15A9    lea         eax,[ebp-124]
 006A15AF    mov         edx,4
 006A15B4    call        @UStrCatN
 006A15B9    mov         edx,dword ptr [ebp-124]
 006A15BF    mov         ecx,dword ptr [ebp-8]
 006A15C2    add         ecx,1CC
 006A15C8    mov         eax,dword ptr [ebp-0C]
 006A15CB    lea         eax,[eax+eax*2]
 006A15CE    add         ecx,eax
 006A15D0    mov         eax,dword ptr [ebp-10]
 006A15D3    lea         eax,[eax+eax*8]
 006A15D6    add         ecx,eax
 006A15D8    mov         eax,dword ptr [ebp-4]
 006A15DB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A15DE    call        THashTable.Add
 006A15E3    push        6A6780;'Fingers'
 006A15E8    push        dword ptr [ebx]
 006A15EA    mov         eax,dword ptr [ebp-14]
 006A15ED    push        dword ptr [eax]
 006A15EF    push        dword ptr [edi]
 006A15F1    lea         eax,[ebp-128]
 006A15F7    mov         edx,4
 006A15FC    call        @UStrCatN
 006A1601    mov         edx,dword ptr [ebp-128]
 006A1607    mov         ecx,dword ptr [ebp-8]
 006A160A    add         ecx,190
 006A1610    mov         eax,dword ptr [ebp-0C]
 006A1613    lea         eax,[eax+eax*2]
 006A1616    add         ecx,eax
 006A1618    mov         eax,dword ptr [ebp-10]
 006A161B    lea         eax,[eax+eax*8]
 006A161E    add         ecx,eax
 006A1620    mov         eax,dword ptr [ebp-4]
 006A1623    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1626    call        THashTable.Add
 006A162B    push        6A67B8;'Palm'
 006A1630    push        dword ptr [ebx]
 006A1632    mov         eax,dword ptr [ebp-14]
 006A1635    push        dword ptr [eax]
 006A1637    push        dword ptr [edi]
 006A1639    lea         eax,[ebp-12C]
 006A163F    mov         edx,4
 006A1644    call        @UStrCatN
 006A1649    mov         edx,dword ptr [ebp-12C]
 006A164F    mov         ecx,dword ptr [ebp-8]
 006A1652    add         ecx,1AE
 006A1658    mov         eax,dword ptr [ebp-0C]
 006A165B    lea         eax,[eax+eax*2]
 006A165E    add         ecx,eax
 006A1660    mov         eax,dword ptr [ebp-10]
 006A1663    lea         eax,[eax+eax*8]
 006A1666    add         ecx,eax
 006A1668    mov         eax,dword ptr [ebp-4]
 006A166B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A166E    call        THashTable.Add
 006A1673    push        6A32F4;'Thumb'
 006A1678    push        dword ptr [ebx]
 006A167A    mov         eax,dword ptr [ebp-14]
 006A167D    push        dword ptr [eax]
 006A167F    push        dword ptr [edi]
 006A1681    lea         eax,[ebp-130]
 006A1687    mov         edx,4
 006A168C    call        @UStrCatN
 006A1691    mov         edx,dword ptr [ebp-130]
 006A1697    mov         ecx,dword ptr [ebp-8]
 006A169A    add         ecx,1CC
 006A16A0    mov         eax,dword ptr [ebp-0C]
 006A16A3    lea         eax,[eax+eax*2]
 006A16A6    add         ecx,eax
 006A16A8    mov         eax,dword ptr [ebp-10]
 006A16AB    lea         eax,[eax+eax*8]
 006A16AE    add         ecx,eax
 006A16B0    mov         eax,dword ptr [ebp-4]
 006A16B3    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A16B6    call        THashTable.Add
 006A16BB    push        6A6780;'Fingers'
 006A16C0    mov         eax,dword ptr [ebp-14]
 006A16C3    push        dword ptr [eax]
 006A16C5    push        dword ptr [ebx]
 006A16C7    push        dword ptr [edi]
 006A16C9    lea         eax,[ebp-134]
 006A16CF    mov         edx,4
 006A16D4    call        @UStrCatN
 006A16D9    mov         edx,dword ptr [ebp-134]
 006A16DF    mov         ecx,dword ptr [ebp-8]
 006A16E2    add         ecx,190
 006A16E8    mov         eax,dword ptr [ebp-0C]
 006A16EB    lea         eax,[eax+eax*2]
 006A16EE    add         ecx,eax
 006A16F0    mov         eax,dword ptr [ebp-10]
 006A16F3    lea         eax,[eax+eax*8]
 006A16F6    add         ecx,eax
 006A16F8    mov         eax,dword ptr [ebp-4]
 006A16FB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A16FE    call        THashTable.Add
 006A1703    push        6A67B8;'Palm'
 006A1708    mov         eax,dword ptr [ebp-14]
 006A170B    push        dword ptr [eax]
 006A170D    push        dword ptr [ebx]
 006A170F    push        dword ptr [edi]
 006A1711    lea         eax,[ebp-138]
 006A1717    mov         edx,4
 006A171C    call        @UStrCatN
 006A1721    mov         edx,dword ptr [ebp-138]
 006A1727    mov         ecx,dword ptr [ebp-8]
 006A172A    add         ecx,1AE
 006A1730    mov         eax,dword ptr [ebp-0C]
 006A1733    lea         eax,[eax+eax*2]
 006A1736    add         ecx,eax
 006A1738    mov         eax,dword ptr [ebp-10]
 006A173B    lea         eax,[eax+eax*8]
 006A173E    add         ecx,eax
 006A1740    mov         eax,dword ptr [ebp-4]
 006A1743    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1746    call        THashTable.Add
 006A174B    push        6A32F4;'Thumb'
 006A1750    mov         eax,dword ptr [ebp-14]
 006A1753    push        dword ptr [eax]
 006A1755    push        dword ptr [ebx]
 006A1757    push        dword ptr [edi]
 006A1759    lea         eax,[ebp-13C]
 006A175F    mov         edx,4
 006A1764    call        @UStrCatN
 006A1769    mov         edx,dword ptr [ebp-13C]
 006A176F    mov         ecx,dword ptr [ebp-8]
 006A1772    add         ecx,1CC
 006A1778    mov         eax,dword ptr [ebp-0C]
 006A177B    lea         eax,[eax+eax*2]
 006A177E    add         ecx,eax
 006A1780    mov         eax,dword ptr [ebp-10]
 006A1783    lea         eax,[eax+eax*8]
 006A1786    add         ecx,eax
 006A1788    mov         eax,dword ptr [ebp-4]
 006A178B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A178E    call        THashTable.Add
 006A1793    push        6A67E8;'FingersAngleFrom'
 006A1798    mov         eax,dword ptr [ebp-14]
 006A179B    push        dword ptr [eax]
 006A179D    push        dword ptr [edi]
 006A179F    push        dword ptr [ebx]
 006A17A1    lea         eax,[ebp-140]
 006A17A7    mov         edx,4
 006A17AC    call        @UStrCatN
 006A17B1    mov         edx,dword ptr [ebp-140]
 006A17B7    mov         ecx,dword ptr [ebp-8]
 006A17BA    add         ecx,12C
 006A17C0    mov         eax,dword ptr [ebp-0C]
 006A17C3    lea         eax,[eax+eax*2]
 006A17C6    add         ecx,eax
 006A17C8    mov         eax,dword ptr [ebp-10]
 006A17CB    lea         eax,[eax+eax*8]
 006A17CE    add         ecx,eax
 006A17D0    mov         eax,dword ptr [ebp-4]
 006A17D3    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A17D6    call        THashTable.Add
 006A17DB    push        6A6818;'PalmAngleFrom'
 006A17E0    mov         eax,dword ptr [ebp-14]
 006A17E3    push        dword ptr [eax]
 006A17E5    push        dword ptr [edi]
 006A17E7    push        dword ptr [ebx]
 006A17E9    lea         eax,[ebp-144]
 006A17EF    mov         edx,4
 006A17F4    call        @UStrCatN
 006A17F9    mov         edx,dword ptr [ebp-144]
 006A17FF    mov         ecx,dword ptr [ebp-8]
 006A1802    add         ecx,14A
 006A1808    mov         eax,dword ptr [ebp-0C]
 006A180B    lea         eax,[eax+eax*2]
 006A180E    add         ecx,eax
 006A1810    mov         eax,dword ptr [ebp-10]
 006A1813    lea         eax,[eax+eax*8]
 006A1816    add         ecx,eax
 006A1818    mov         eax,dword ptr [ebp-4]
 006A181B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A181E    call        THashTable.Add
 006A1823    push        6A6840;'ThumbAngleFrom'
 006A1828    mov         eax,dword ptr [ebp-14]
 006A182B    push        dword ptr [eax]
 006A182D    push        dword ptr [edi]
 006A182F    push        dword ptr [ebx]
 006A1831    lea         eax,[ebp-148]
 006A1837    mov         edx,4
 006A183C    call        @UStrCatN
 006A1841    mov         edx,dword ptr [ebp-148]
 006A1847    mov         ecx,dword ptr [ebp-8]
 006A184A    add         ecx,168
 006A1850    mov         eax,dword ptr [ebp-0C]
 006A1853    lea         eax,[eax+eax*2]
 006A1856    add         ecx,eax
 006A1858    mov         eax,dword ptr [ebp-10]
 006A185B    lea         eax,[eax+eax*8]
 006A185E    add         ecx,eax
 006A1860    mov         eax,dword ptr [ebp-4]
 006A1863    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1866    call        THashTable.Add
 006A186B    push        6A67E8;'FingersAngleFrom'
 006A1870    push        dword ptr [edi]
 006A1872    mov         eax,dword ptr [ebp-14]
 006A1875    push        dword ptr [eax]
 006A1877    push        dword ptr [ebx]
 006A1879    lea         eax,[ebp-14C]
 006A187F    mov         edx,4
 006A1884    call        @UStrCatN
 006A1889    mov         edx,dword ptr [ebp-14C]
 006A188F    mov         ecx,dword ptr [ebp-8]
 006A1892    add         ecx,12C
 006A1898    mov         eax,dword ptr [ebp-0C]
 006A189B    lea         eax,[eax+eax*2]
 006A189E    add         ecx,eax
 006A18A0    mov         eax,dword ptr [ebp-10]
 006A18A3    lea         eax,[eax+eax*8]
 006A18A6    add         ecx,eax
 006A18A8    mov         eax,dword ptr [ebp-4]
 006A18AB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A18AE    call        THashTable.Add
 006A18B3    push        6A6818;'PalmAngleFrom'
 006A18B8    push        dword ptr [edi]
 006A18BA    mov         eax,dword ptr [ebp-14]
 006A18BD    push        dword ptr [eax]
 006A18BF    push        dword ptr [ebx]
 006A18C1    lea         eax,[ebp-150]
 006A18C7    mov         edx,4
 006A18CC    call        @UStrCatN
 006A18D1    mov         edx,dword ptr [ebp-150]
 006A18D7    mov         ecx,dword ptr [ebp-8]
 006A18DA    add         ecx,14A
 006A18E0    mov         eax,dword ptr [ebp-0C]
 006A18E3    lea         eax,[eax+eax*2]
 006A18E6    add         ecx,eax
 006A18E8    mov         eax,dword ptr [ebp-10]
 006A18EB    lea         eax,[eax+eax*8]
 006A18EE    add         ecx,eax
 006A18F0    mov         eax,dword ptr [ebp-4]
 006A18F3    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A18F6    call        THashTable.Add
 006A18FB    push        6A6840;'ThumbAngleFrom'
 006A1900    push        dword ptr [edi]
 006A1902    mov         eax,dword ptr [ebp-14]
 006A1905    push        dword ptr [eax]
 006A1907    push        dword ptr [ebx]
 006A1909    lea         eax,[ebp-154]
 006A190F    mov         edx,4
 006A1914    call        @UStrCatN
 006A1919    mov         edx,dword ptr [ebp-154]
 006A191F    mov         ecx,dword ptr [ebp-8]
 006A1922    add         ecx,168
 006A1928    mov         eax,dword ptr [ebp-0C]
 006A192B    lea         eax,[eax+eax*2]
 006A192E    add         ecx,eax
 006A1930    mov         eax,dword ptr [ebp-10]
 006A1933    lea         eax,[eax+eax*8]
 006A1936    add         ecx,eax
 006A1938    mov         eax,dword ptr [ebp-4]
 006A193B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A193E    call        THashTable.Add
 006A1943    push        6A67E8;'FingersAngleFrom'
 006A1948    push        dword ptr [edi]
 006A194A    push        dword ptr [ebx]
 006A194C    mov         eax,dword ptr [ebp-14]
 006A194F    push        dword ptr [eax]
 006A1951    lea         eax,[ebp-158]
 006A1957    mov         edx,4
 006A195C    call        @UStrCatN
 006A1961    mov         edx,dword ptr [ebp-158]
 006A1967    mov         ecx,dword ptr [ebp-8]
 006A196A    add         ecx,12C
 006A1970    mov         eax,dword ptr [ebp-0C]
 006A1973    lea         eax,[eax+eax*2]
 006A1976    add         ecx,eax
 006A1978    mov         eax,dword ptr [ebp-10]
 006A197B    lea         eax,[eax+eax*8]
 006A197E    add         ecx,eax
 006A1980    mov         eax,dword ptr [ebp-4]
 006A1983    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1986    call        THashTable.Add
 006A198B    push        6A6818;'PalmAngleFrom'
 006A1990    push        dword ptr [edi]
 006A1992    push        dword ptr [ebx]
 006A1994    mov         eax,dword ptr [ebp-14]
 006A1997    push        dword ptr [eax]
 006A1999    lea         eax,[ebp-15C]
 006A199F    mov         edx,4
 006A19A4    call        @UStrCatN
 006A19A9    mov         edx,dword ptr [ebp-15C]
 006A19AF    mov         ecx,dword ptr [ebp-8]
 006A19B2    add         ecx,14A
 006A19B8    mov         eax,dword ptr [ebp-0C]
 006A19BB    lea         eax,[eax+eax*2]
 006A19BE    add         ecx,eax
 006A19C0    mov         eax,dword ptr [ebp-10]
 006A19C3    lea         eax,[eax+eax*8]
 006A19C6    add         ecx,eax
 006A19C8    mov         eax,dword ptr [ebp-4]
 006A19CB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A19CE    call        THashTable.Add
 006A19D3    push        6A6840;'ThumbAngleFrom'
 006A19D8    push        dword ptr [edi]
 006A19DA    push        dword ptr [ebx]
 006A19DC    mov         eax,dword ptr [ebp-14]
 006A19DF    push        dword ptr [eax]
 006A19E1    lea         eax,[ebp-160]
 006A19E7    mov         edx,4
 006A19EC    call        @UStrCatN
 006A19F1    mov         edx,dword ptr [ebp-160]
 006A19F7    mov         ecx,dword ptr [ebp-8]
 006A19FA    add         ecx,168
 006A1A00    mov         eax,dword ptr [ebp-0C]
 006A1A03    lea         eax,[eax+eax*2]
 006A1A06    add         ecx,eax
 006A1A08    mov         eax,dword ptr [ebp-10]
 006A1A0B    lea         eax,[eax+eax*8]
 006A1A0E    add         ecx,eax
 006A1A10    mov         eax,dword ptr [ebp-4]
 006A1A13    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1A16    call        THashTable.Add
 006A1A1B    push        6A67E8;'FingersAngleFrom'
 006A1A20    push        dword ptr [ebx]
 006A1A22    push        dword ptr [edi]
 006A1A24    mov         eax,dword ptr [ebp-14]
 006A1A27    push        dword ptr [eax]
 006A1A29    lea         eax,[ebp-164]
 006A1A2F    mov         edx,4
 006A1A34    call        @UStrCatN
 006A1A39    mov         edx,dword ptr [ebp-164]
 006A1A3F    mov         ecx,dword ptr [ebp-8]
 006A1A42    add         ecx,12C
 006A1A48    mov         eax,dword ptr [ebp-0C]
 006A1A4B    lea         eax,[eax+eax*2]
 006A1A4E    add         ecx,eax
 006A1A50    mov         eax,dword ptr [ebp-10]
 006A1A53    lea         eax,[eax+eax*8]
 006A1A56    add         ecx,eax
 006A1A58    mov         eax,dword ptr [ebp-4]
 006A1A5B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1A5E    call        THashTable.Add
 006A1A63    push        6A6818;'PalmAngleFrom'
 006A1A68    push        dword ptr [ebx]
 006A1A6A    push        dword ptr [edi]
 006A1A6C    mov         eax,dword ptr [ebp-14]
 006A1A6F    push        dword ptr [eax]
 006A1A71    lea         eax,[ebp-168]
 006A1A77    mov         edx,4
 006A1A7C    call        @UStrCatN
 006A1A81    mov         edx,dword ptr [ebp-168]
 006A1A87    mov         ecx,dword ptr [ebp-8]
 006A1A8A    add         ecx,14A
 006A1A90    mov         eax,dword ptr [ebp-0C]
 006A1A93    lea         eax,[eax+eax*2]
 006A1A96    add         ecx,eax
 006A1A98    mov         eax,dword ptr [ebp-10]
 006A1A9B    lea         eax,[eax+eax*8]
 006A1A9E    add         ecx,eax
 006A1AA0    mov         eax,dword ptr [ebp-4]
 006A1AA3    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1AA6    call        THashTable.Add
 006A1AAB    push        6A6840;'ThumbAngleFrom'
 006A1AB0    push        dword ptr [ebx]
 006A1AB2    push        dword ptr [edi]
 006A1AB4    mov         eax,dword ptr [ebp-14]
 006A1AB7    push        dword ptr [eax]
 006A1AB9    lea         eax,[ebp-16C]
 006A1ABF    mov         edx,4
 006A1AC4    call        @UStrCatN
 006A1AC9    mov         edx,dword ptr [ebp-16C]
 006A1ACF    mov         ecx,dword ptr [ebp-8]
 006A1AD2    add         ecx,168
 006A1AD8    mov         eax,dword ptr [ebp-0C]
 006A1ADB    lea         eax,[eax+eax*2]
 006A1ADE    add         ecx,eax
 006A1AE0    mov         eax,dword ptr [ebp-10]
 006A1AE3    lea         eax,[eax+eax*8]
 006A1AE6    add         ecx,eax
 006A1AE8    mov         eax,dword ptr [ebp-4]
 006A1AEB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1AEE    call        THashTable.Add
 006A1AF3    push        6A67E8;'FingersAngleFrom'
 006A1AF8    push        dword ptr [ebx]
 006A1AFA    mov         eax,dword ptr [ebp-14]
 006A1AFD    push        dword ptr [eax]
 006A1AFF    push        dword ptr [edi]
 006A1B01    lea         eax,[ebp-170]
 006A1B07    mov         edx,4
 006A1B0C    call        @UStrCatN
 006A1B11    mov         edx,dword ptr [ebp-170]
 006A1B17    mov         ecx,dword ptr [ebp-8]
 006A1B1A    add         ecx,12C
 006A1B20    mov         eax,dword ptr [ebp-0C]
 006A1B23    lea         eax,[eax+eax*2]
 006A1B26    add         ecx,eax
 006A1B28    mov         eax,dword ptr [ebp-10]
 006A1B2B    lea         eax,[eax+eax*8]
 006A1B2E    add         ecx,eax
 006A1B30    mov         eax,dword ptr [ebp-4]
 006A1B33    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1B36    call        THashTable.Add
 006A1B3B    push        6A6818;'PalmAngleFrom'
 006A1B40    push        dword ptr [ebx]
 006A1B42    mov         eax,dword ptr [ebp-14]
 006A1B45    push        dword ptr [eax]
 006A1B47    push        dword ptr [edi]
 006A1B49    lea         eax,[ebp-174]
 006A1B4F    mov         edx,4
 006A1B54    call        @UStrCatN
 006A1B59    mov         edx,dword ptr [ebp-174]
 006A1B5F    mov         ecx,dword ptr [ebp-8]
 006A1B62    add         ecx,14A
 006A1B68    mov         eax,dword ptr [ebp-0C]
 006A1B6B    lea         eax,[eax+eax*2]
 006A1B6E    add         ecx,eax
 006A1B70    mov         eax,dword ptr [ebp-10]
 006A1B73    lea         eax,[eax+eax*8]
 006A1B76    add         ecx,eax
 006A1B78    mov         eax,dword ptr [ebp-4]
 006A1B7B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1B7E    call        THashTable.Add
 006A1B83    push        6A6840;'ThumbAngleFrom'
 006A1B88    push        dword ptr [ebx]
 006A1B8A    mov         eax,dword ptr [ebp-14]
 006A1B8D    push        dword ptr [eax]
 006A1B8F    push        dword ptr [edi]
 006A1B91    lea         eax,[ebp-178]
 006A1B97    mov         edx,4
 006A1B9C    call        @UStrCatN
 006A1BA1    mov         edx,dword ptr [ebp-178]
 006A1BA7    mov         ecx,dword ptr [ebp-8]
 006A1BAA    add         ecx,168
 006A1BB0    mov         eax,dword ptr [ebp-0C]
 006A1BB3    lea         eax,[eax+eax*2]
 006A1BB6    add         ecx,eax
 006A1BB8    mov         eax,dword ptr [ebp-10]
 006A1BBB    lea         eax,[eax+eax*8]
 006A1BBE    add         ecx,eax
 006A1BC0    mov         eax,dword ptr [ebp-4]
 006A1BC3    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1BC6    call        THashTable.Add
 006A1BCB    push        6A67E8;'FingersAngleFrom'
 006A1BD0    mov         eax,dword ptr [ebp-14]
 006A1BD3    push        dword ptr [eax]
 006A1BD5    push        dword ptr [ebx]
 006A1BD7    push        dword ptr [edi]
 006A1BD9    lea         eax,[ebp-17C]
 006A1BDF    mov         edx,4
 006A1BE4    call        @UStrCatN
 006A1BE9    mov         edx,dword ptr [ebp-17C]
 006A1BEF    mov         ecx,dword ptr [ebp-8]
 006A1BF2    add         ecx,12C
 006A1BF8    mov         eax,dword ptr [ebp-0C]
 006A1BFB    lea         eax,[eax+eax*2]
 006A1BFE    add         ecx,eax
 006A1C00    mov         eax,dword ptr [ebp-10]
 006A1C03    lea         eax,[eax+eax*8]
 006A1C06    add         ecx,eax
 006A1C08    mov         eax,dword ptr [ebp-4]
 006A1C0B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1C0E    call        THashTable.Add
 006A1C13    push        6A6818;'PalmAngleFrom'
 006A1C18    mov         eax,dword ptr [ebp-14]
 006A1C1B    push        dword ptr [eax]
 006A1C1D    push        dword ptr [ebx]
 006A1C1F    push        dword ptr [edi]
 006A1C21    lea         eax,[ebp-180]
 006A1C27    mov         edx,4
 006A1C2C    call        @UStrCatN
 006A1C31    mov         edx,dword ptr [ebp-180]
 006A1C37    mov         ecx,dword ptr [ebp-8]
 006A1C3A    add         ecx,14A
 006A1C40    mov         eax,dword ptr [ebp-0C]
 006A1C43    lea         eax,[eax+eax*2]
 006A1C46    add         ecx,eax
 006A1C48    mov         eax,dword ptr [ebp-10]
 006A1C4B    lea         eax,[eax+eax*8]
 006A1C4E    add         ecx,eax
 006A1C50    mov         eax,dword ptr [ebp-4]
 006A1C53    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1C56    call        THashTable.Add
 006A1C5B    push        6A6840;'ThumbAngleFrom'
 006A1C60    mov         eax,dword ptr [ebp-14]
 006A1C63    push        dword ptr [eax]
 006A1C65    push        dword ptr [ebx]
 006A1C67    push        dword ptr [edi]
 006A1C69    lea         eax,[ebp-184]
 006A1C6F    mov         edx,4
 006A1C74    call        @UStrCatN
 006A1C79    mov         edx,dword ptr [ebp-184]
 006A1C7F    mov         ecx,dword ptr [ebp-8]
 006A1C82    add         ecx,168
 006A1C88    mov         eax,dword ptr [ebp-0C]
 006A1C8B    lea         eax,[eax+eax*2]
 006A1C8E    add         ecx,eax
 006A1C90    mov         eax,dword ptr [ebp-10]
 006A1C93    lea         eax,[eax+eax*8]
 006A1C96    add         ecx,eax
 006A1C98    mov         eax,dword ptr [ebp-4]
 006A1C9B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1C9E    call        THashTable.Add
 006A1CA3    push        6A6780;'Fingers'
 006A1CA8    mov         eax,dword ptr [ebp-18]
 006A1CAB    push        dword ptr [eax]
 006A1CAD    mov         eax,dword ptr [ebp-1C]
 006A1CB0    push        dword ptr [eax]
 006A1CB2    push        dword ptr [esi]
 006A1CB4    push        6A679C;'Strict'
 006A1CB9    lea         eax,[ebp-188]
 006A1CBF    mov         edx,5
 006A1CC4    call        @UStrCatN
 006A1CC9    mov         edx,dword ptr [ebp-188]
 006A1CCF    mov         ecx,dword ptr [ebp-8]
 006A1CD2    add         ecx,1F4
 006A1CD8    mov         eax,dword ptr [ebp-0C]
 006A1CDB    lea         eax,[eax+eax*2]
 006A1CDE    add         ecx,eax
 006A1CE0    mov         eax,dword ptr [ebp-10]
 006A1CE3    lea         eax,[eax+eax*8]
 006A1CE6    add         ecx,eax
 006A1CE8    mov         eax,dword ptr [ebp-4]
 006A1CEB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1CEE    call        THashTable.Add
 006A1CF3    push        6A67B8;'Palm'
 006A1CF8    mov         eax,dword ptr [ebp-18]
 006A1CFB    push        dword ptr [eax]
 006A1CFD    mov         eax,dword ptr [ebp-1C]
 006A1D00    push        dword ptr [eax]
 006A1D02    push        dword ptr [esi]
 006A1D04    push        6A679C;'Strict'
 006A1D09    lea         eax,[ebp-18C]
 006A1D0F    mov         edx,5
 006A1D14    call        @UStrCatN
 006A1D19    mov         edx,dword ptr [ebp-18C]
 006A1D1F    mov         ecx,dword ptr [ebp-8]
 006A1D22    add         ecx,212
 006A1D28    mov         eax,dword ptr [ebp-0C]
 006A1D2B    lea         eax,[eax+eax*2]
 006A1D2E    add         ecx,eax
 006A1D30    mov         eax,dword ptr [ebp-10]
 006A1D33    lea         eax,[eax+eax*8]
 006A1D36    add         ecx,eax
 006A1D38    mov         eax,dword ptr [ebp-4]
 006A1D3B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1D3E    call        THashTable.Add
 006A1D43    push        6A32F4;'Thumb'
 006A1D48    mov         eax,dword ptr [ebp-18]
 006A1D4B    push        dword ptr [eax]
 006A1D4D    mov         eax,dword ptr [ebp-1C]
 006A1D50    push        dword ptr [eax]
 006A1D52    push        dword ptr [esi]
 006A1D54    push        6A679C;'Strict'
 006A1D59    lea         eax,[ebp-190]
 006A1D5F    mov         edx,5
 006A1D64    call        @UStrCatN
 006A1D69    mov         edx,dword ptr [ebp-190]
 006A1D6F    mov         ecx,dword ptr [ebp-8]
 006A1D72    add         ecx,230
 006A1D78    mov         eax,dword ptr [ebp-0C]
 006A1D7B    lea         eax,[eax+eax*2]
 006A1D7E    add         ecx,eax
 006A1D80    mov         eax,dword ptr [ebp-10]
 006A1D83    lea         eax,[eax+eax*8]
 006A1D86    add         ecx,eax
 006A1D88    mov         eax,dword ptr [ebp-4]
 006A1D8B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1D8E    call        THashTable.Add
 006A1D93    push        6A6780;'Fingers'
 006A1D98    mov         eax,dword ptr [ebp-1C]
 006A1D9B    push        dword ptr [eax]
 006A1D9D    mov         eax,dword ptr [ebp-18]
 006A1DA0    push        dword ptr [eax]
 006A1DA2    push        dword ptr [esi]
 006A1DA4    push        6A679C;'Strict'
 006A1DA9    lea         eax,[ebp-194]
 006A1DAF    mov         edx,5
 006A1DB4    call        @UStrCatN
 006A1DB9    mov         edx,dword ptr [ebp-194]
 006A1DBF    mov         ecx,dword ptr [ebp-8]
 006A1DC2    add         ecx,1F4
 006A1DC8    mov         eax,dword ptr [ebp-0C]
 006A1DCB    lea         eax,[eax+eax*2]
 006A1DCE    add         ecx,eax
 006A1DD0    mov         eax,dword ptr [ebp-10]
 006A1DD3    lea         eax,[eax+eax*8]
 006A1DD6    add         ecx,eax
 006A1DD8    mov         eax,dword ptr [ebp-4]
 006A1DDB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1DDE    call        THashTable.Add
 006A1DE3    push        6A67B8;'Palm'
 006A1DE8    mov         eax,dword ptr [ebp-1C]
 006A1DEB    push        dword ptr [eax]
 006A1DED    mov         eax,dword ptr [ebp-18]
 006A1DF0    push        dword ptr [eax]
 006A1DF2    push        dword ptr [esi]
 006A1DF4    push        6A679C;'Strict'
 006A1DF9    lea         eax,[ebp-198]
 006A1DFF    mov         edx,5
 006A1E04    call        @UStrCatN
 006A1E09    mov         edx,dword ptr [ebp-198]
 006A1E0F    mov         ecx,dword ptr [ebp-8]
 006A1E12    add         ecx,212
 006A1E18    mov         eax,dword ptr [ebp-0C]
 006A1E1B    lea         eax,[eax+eax*2]
 006A1E1E    add         ecx,eax
 006A1E20    mov         eax,dword ptr [ebp-10]
 006A1E23    lea         eax,[eax+eax*8]
 006A1E26    add         ecx,eax
 006A1E28    mov         eax,dword ptr [ebp-4]
 006A1E2B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1E2E    call        THashTable.Add
 006A1E33    push        6A32F4;'Thumb'
 006A1E38    mov         eax,dword ptr [ebp-1C]
 006A1E3B    push        dword ptr [eax]
 006A1E3D    mov         eax,dword ptr [ebp-18]
 006A1E40    push        dword ptr [eax]
 006A1E42    push        dword ptr [esi]
 006A1E44    push        6A679C;'Strict'
 006A1E49    lea         eax,[ebp-19C]
 006A1E4F    mov         edx,5
 006A1E54    call        @UStrCatN
 006A1E59    mov         edx,dword ptr [ebp-19C]
 006A1E5F    mov         ecx,dword ptr [ebp-8]
 006A1E62    add         ecx,230
 006A1E68    mov         eax,dword ptr [ebp-0C]
 006A1E6B    lea         eax,[eax+eax*2]
 006A1E6E    add         ecx,eax
 006A1E70    mov         eax,dword ptr [ebp-10]
 006A1E73    lea         eax,[eax+eax*8]
 006A1E76    add         ecx,eax
 006A1E78    mov         eax,dword ptr [ebp-4]
 006A1E7B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1E7E    call        THashTable.Add
 006A1E83    push        6A6780;'Fingers'
 006A1E88    mov         eax,dword ptr [ebp-1C]
 006A1E8B    push        dword ptr [eax]
 006A1E8D    push        dword ptr [esi]
 006A1E8F    mov         eax,dword ptr [ebp-18]
 006A1E92    push        dword ptr [eax]
 006A1E94    push        6A679C;'Strict'
 006A1E99    lea         eax,[ebp-1A0]
 006A1E9F    mov         edx,5
 006A1EA4    call        @UStrCatN
 006A1EA9    mov         edx,dword ptr [ebp-1A0]
 006A1EAF    mov         ecx,dword ptr [ebp-8]
 006A1EB2    add         ecx,1F4
 006A1EB8    mov         eax,dword ptr [ebp-0C]
 006A1EBB    lea         eax,[eax+eax*2]
 006A1EBE    add         ecx,eax
 006A1EC0    mov         eax,dword ptr [ebp-10]
 006A1EC3    lea         eax,[eax+eax*8]
 006A1EC6    add         ecx,eax
 006A1EC8    mov         eax,dword ptr [ebp-4]
 006A1ECB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1ECE    call        THashTable.Add
 006A1ED3    push        6A67B8;'Palm'
 006A1ED8    mov         eax,dword ptr [ebp-1C]
 006A1EDB    push        dword ptr [eax]
 006A1EDD    push        dword ptr [esi]
 006A1EDF    mov         eax,dword ptr [ebp-18]
 006A1EE2    push        dword ptr [eax]
 006A1EE4    push        6A679C;'Strict'
 006A1EE9    lea         eax,[ebp-1A4]
 006A1EEF    mov         edx,5
 006A1EF4    call        @UStrCatN
 006A1EF9    mov         edx,dword ptr [ebp-1A4]
 006A1EFF    mov         ecx,dword ptr [ebp-8]
 006A1F02    add         ecx,212
 006A1F08    mov         eax,dword ptr [ebp-0C]
 006A1F0B    lea         eax,[eax+eax*2]
 006A1F0E    add         ecx,eax
 006A1F10    mov         eax,dword ptr [ebp-10]
 006A1F13    lea         eax,[eax+eax*8]
 006A1F16    add         ecx,eax
 006A1F18    mov         eax,dword ptr [ebp-4]
 006A1F1B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1F1E    call        THashTable.Add
 006A1F23    push        6A32F4;'Thumb'
 006A1F28    mov         eax,dword ptr [ebp-1C]
 006A1F2B    push        dword ptr [eax]
 006A1F2D    push        dword ptr [esi]
 006A1F2F    mov         eax,dword ptr [ebp-18]
 006A1F32    push        dword ptr [eax]
 006A1F34    push        6A679C;'Strict'
 006A1F39    lea         eax,[ebp-1A8]
 006A1F3F    mov         edx,5
 006A1F44    call        @UStrCatN
 006A1F49    mov         edx,dword ptr [ebp-1A8]
 006A1F4F    mov         ecx,dword ptr [ebp-8]
 006A1F52    add         ecx,230
 006A1F58    mov         eax,dword ptr [ebp-0C]
 006A1F5B    lea         eax,[eax+eax*2]
 006A1F5E    add         ecx,eax
 006A1F60    mov         eax,dword ptr [ebp-10]
 006A1F63    lea         eax,[eax+eax*8]
 006A1F66    add         ecx,eax
 006A1F68    mov         eax,dword ptr [ebp-4]
 006A1F6B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1F6E    call        THashTable.Add
 006A1F73    push        6A6780;'Fingers'
 006A1F78    push        dword ptr [esi]
 006A1F7A    mov         eax,dword ptr [ebp-1C]
 006A1F7D    push        dword ptr [eax]
 006A1F7F    mov         eax,dword ptr [ebp-18]
 006A1F82    push        dword ptr [eax]
 006A1F84    push        6A679C;'Strict'
 006A1F89    lea         eax,[ebp-1AC]
 006A1F8F    mov         edx,5
 006A1F94    call        @UStrCatN
 006A1F99    mov         edx,dword ptr [ebp-1AC]
 006A1F9F    mov         ecx,dword ptr [ebp-8]
 006A1FA2    add         ecx,1F4
 006A1FA8    mov         eax,dword ptr [ebp-0C]
 006A1FAB    lea         eax,[eax+eax*2]
 006A1FAE    add         ecx,eax
 006A1FB0    mov         eax,dword ptr [ebp-10]
 006A1FB3    lea         eax,[eax+eax*8]
 006A1FB6    add         ecx,eax
 006A1FB8    mov         eax,dword ptr [ebp-4]
 006A1FBB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A1FBE    call        THashTable.Add
 006A1FC3    push        6A67B8;'Palm'
 006A1FC8    push        dword ptr [esi]
 006A1FCA    mov         eax,dword ptr [ebp-1C]
 006A1FCD    push        dword ptr [eax]
 006A1FCF    mov         eax,dword ptr [ebp-18]
 006A1FD2    push        dword ptr [eax]
 006A1FD4    push        6A679C;'Strict'
 006A1FD9    lea         eax,[ebp-1B0]
 006A1FDF    mov         edx,5
 006A1FE4    call        @UStrCatN
 006A1FE9    mov         edx,dword ptr [ebp-1B0]
 006A1FEF    mov         ecx,dword ptr [ebp-8]
 006A1FF2    add         ecx,212
 006A1FF8    mov         eax,dword ptr [ebp-0C]
 006A1FFB    lea         eax,[eax+eax*2]
 006A1FFE    add         ecx,eax
 006A2000    mov         eax,dword ptr [ebp-10]
 006A2003    lea         eax,[eax+eax*8]
 006A2006    add         ecx,eax
 006A2008    mov         eax,dword ptr [ebp-4]
 006A200B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A200E    call        THashTable.Add
 006A2013    push        6A32F4;'Thumb'
 006A2018    push        dword ptr [esi]
 006A201A    mov         eax,dword ptr [ebp-1C]
 006A201D    push        dword ptr [eax]
 006A201F    mov         eax,dword ptr [ebp-18]
 006A2022    push        dword ptr [eax]
 006A2024    push        6A679C;'Strict'
 006A2029    lea         eax,[ebp-1B4]
 006A202F    mov         edx,5
 006A2034    call        @UStrCatN
 006A2039    mov         edx,dword ptr [ebp-1B4]
 006A203F    mov         ecx,dword ptr [ebp-8]
 006A2042    add         ecx,230
 006A2048    mov         eax,dword ptr [ebp-0C]
 006A204B    lea         eax,[eax+eax*2]
 006A204E    add         ecx,eax
 006A2050    mov         eax,dword ptr [ebp-10]
 006A2053    lea         eax,[eax+eax*8]
 006A2056    add         ecx,eax
 006A2058    mov         eax,dword ptr [ebp-4]
 006A205B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A205E    call        THashTable.Add
 006A2063    push        6A6780;'Fingers'
 006A2068    push        dword ptr [esi]
 006A206A    mov         eax,dword ptr [ebp-18]
 006A206D    push        dword ptr [eax]
 006A206F    mov         eax,dword ptr [ebp-1C]
 006A2072    push        dword ptr [eax]
 006A2074    push        6A679C;'Strict'
 006A2079    lea         eax,[ebp-1B8]
 006A207F    mov         edx,5
 006A2084    call        @UStrCatN
 006A2089    mov         edx,dword ptr [ebp-1B8]
 006A208F    mov         ecx,dword ptr [ebp-8]
 006A2092    add         ecx,1F4
 006A2098    mov         eax,dword ptr [ebp-0C]
 006A209B    lea         eax,[eax+eax*2]
 006A209E    add         ecx,eax
 006A20A0    mov         eax,dword ptr [ebp-10]
 006A20A3    lea         eax,[eax+eax*8]
 006A20A6    add         ecx,eax
 006A20A8    mov         eax,dword ptr [ebp-4]
 006A20AB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A20AE    call        THashTable.Add
 006A20B3    push        6A67B8;'Palm'
 006A20B8    push        dword ptr [esi]
 006A20BA    mov         eax,dword ptr [ebp-18]
 006A20BD    push        dword ptr [eax]
 006A20BF    mov         eax,dword ptr [ebp-1C]
 006A20C2    push        dword ptr [eax]
 006A20C4    push        6A679C;'Strict'
 006A20C9    lea         eax,[ebp-1BC]
 006A20CF    mov         edx,5
 006A20D4    call        @UStrCatN
 006A20D9    mov         edx,dword ptr [ebp-1BC]
 006A20DF    mov         ecx,dword ptr [ebp-8]
 006A20E2    add         ecx,212
 006A20E8    mov         eax,dword ptr [ebp-0C]
 006A20EB    lea         eax,[eax+eax*2]
 006A20EE    add         ecx,eax
 006A20F0    mov         eax,dword ptr [ebp-10]
 006A20F3    lea         eax,[eax+eax*8]
 006A20F6    add         ecx,eax
 006A20F8    mov         eax,dword ptr [ebp-4]
 006A20FB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A20FE    call        THashTable.Add
 006A2103    push        6A32F4;'Thumb'
 006A2108    push        dword ptr [esi]
 006A210A    mov         eax,dword ptr [ebp-18]
 006A210D    push        dword ptr [eax]
 006A210F    mov         eax,dword ptr [ebp-1C]
 006A2112    push        dword ptr [eax]
 006A2114    push        6A679C;'Strict'
 006A2119    lea         eax,[ebp-1C0]
 006A211F    mov         edx,5
 006A2124    call        @UStrCatN
 006A2129    mov         edx,dword ptr [ebp-1C0]
 006A212F    mov         ecx,dword ptr [ebp-8]
 006A2132    add         ecx,230
 006A2138    mov         eax,dword ptr [ebp-0C]
 006A213B    lea         eax,[eax+eax*2]
 006A213E    add         ecx,eax
 006A2140    mov         eax,dword ptr [ebp-10]
 006A2143    lea         eax,[eax+eax*8]
 006A2146    add         ecx,eax
 006A2148    mov         eax,dword ptr [ebp-4]
 006A214B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A214E    call        THashTable.Add
 006A2153    push        6A6780;'Fingers'
 006A2158    mov         eax,dword ptr [ebp-18]
 006A215B    push        dword ptr [eax]
 006A215D    push        dword ptr [esi]
 006A215F    mov         eax,dword ptr [ebp-1C]
 006A2162    push        dword ptr [eax]
 006A2164    push        6A679C;'Strict'
 006A2169    lea         eax,[ebp-1C4]
 006A216F    mov         edx,5
 006A2174    call        @UStrCatN
 006A2179    mov         edx,dword ptr [ebp-1C4]
 006A217F    mov         ecx,dword ptr [ebp-8]
 006A2182    add         ecx,1F4
 006A2188    mov         eax,dword ptr [ebp-0C]
 006A218B    lea         eax,[eax+eax*2]
 006A218E    add         ecx,eax
 006A2190    mov         eax,dword ptr [ebp-10]
 006A2193    lea         eax,[eax+eax*8]
 006A2196    add         ecx,eax
 006A2198    mov         eax,dword ptr [ebp-4]
 006A219B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A219E    call        THashTable.Add
 006A21A3    push        6A67B8;'Palm'
 006A21A8    mov         eax,dword ptr [ebp-18]
 006A21AB    push        dword ptr [eax]
 006A21AD    push        dword ptr [esi]
 006A21AF    mov         eax,dword ptr [ebp-1C]
 006A21B2    push        dword ptr [eax]
 006A21B4    push        6A679C;'Strict'
 006A21B9    lea         eax,[ebp-1C8]
 006A21BF    mov         edx,5
 006A21C4    call        @UStrCatN
 006A21C9    mov         edx,dword ptr [ebp-1C8]
 006A21CF    mov         ecx,dword ptr [ebp-8]
 006A21D2    add         ecx,212
 006A21D8    mov         eax,dword ptr [ebp-0C]
 006A21DB    lea         eax,[eax+eax*2]
 006A21DE    add         ecx,eax
 006A21E0    mov         eax,dword ptr [ebp-10]
 006A21E3    lea         eax,[eax+eax*8]
 006A21E6    add         ecx,eax
 006A21E8    mov         eax,dword ptr [ebp-4]
 006A21EB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A21EE    call        THashTable.Add
 006A21F3    push        6A32F4;'Thumb'
 006A21F8    mov         eax,dword ptr [ebp-18]
 006A21FB    push        dword ptr [eax]
 006A21FD    push        dword ptr [esi]
 006A21FF    mov         eax,dword ptr [ebp-1C]
 006A2202    push        dword ptr [eax]
 006A2204    push        6A679C;'Strict'
 006A2209    lea         eax,[ebp-1CC]
 006A220F    mov         edx,5
 006A2214    call        @UStrCatN
 006A2219    mov         edx,dword ptr [ebp-1CC]
 006A221F    mov         ecx,dword ptr [ebp-8]
 006A2222    add         ecx,230
 006A2228    mov         eax,dword ptr [ebp-0C]
 006A222B    lea         eax,[eax+eax*2]
 006A222E    add         ecx,eax
 006A2230    mov         eax,dword ptr [ebp-10]
 006A2233    lea         eax,[eax+eax*8]
 006A2236    add         ecx,eax
 006A2238    mov         eax,dword ptr [ebp-4]
 006A223B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A223E    call        THashTable.Add
 006A2243    push        6A6780;'Fingers'
 006A2248    mov         eax,dword ptr [ebp-18]
 006A224B    push        dword ptr [eax]
 006A224D    mov         eax,dword ptr [ebp-1C]
 006A2250    push        dword ptr [eax]
 006A2252    push        dword ptr [esi]
 006A2254    push        6A67D0;'Vague'
 006A2259    lea         eax,[ebp-1D0]
 006A225F    mov         edx,5
 006A2264    call        @UStrCatN
 006A2269    mov         edx,dword ptr [ebp-1D0]
 006A226F    mov         ecx,dword ptr [ebp-8]
 006A2272    add         ecx,258
 006A2278    mov         eax,dword ptr [ebp-0C]
 006A227B    lea         eax,[eax+eax*2]
 006A227E    add         ecx,eax
 006A2280    mov         eax,dword ptr [ebp-10]
 006A2283    lea         eax,[eax+eax*8]
 006A2286    add         ecx,eax
 006A2288    mov         eax,dword ptr [ebp-4]
 006A228B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A228E    call        THashTable.Add
 006A2293    push        6A67B8;'Palm'
 006A2298    mov         eax,dword ptr [ebp-18]
 006A229B    push        dword ptr [eax]
 006A229D    mov         eax,dword ptr [ebp-1C]
 006A22A0    push        dword ptr [eax]
 006A22A2    push        dword ptr [esi]
 006A22A4    push        6A67D0;'Vague'
 006A22A9    lea         eax,[ebp-1D4]
 006A22AF    mov         edx,5
 006A22B4    call        @UStrCatN
 006A22B9    mov         edx,dword ptr [ebp-1D4]
 006A22BF    mov         ecx,dword ptr [ebp-8]
 006A22C2    add         ecx,276
 006A22C8    mov         eax,dword ptr [ebp-0C]
 006A22CB    lea         eax,[eax+eax*2]
 006A22CE    add         ecx,eax
 006A22D0    mov         eax,dword ptr [ebp-10]
 006A22D3    lea         eax,[eax+eax*8]
 006A22D6    add         ecx,eax
 006A22D8    mov         eax,dword ptr [ebp-4]
 006A22DB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A22DE    call        THashTable.Add
 006A22E3    push        6A32F4;'Thumb'
 006A22E8    mov         eax,dword ptr [ebp-18]
 006A22EB    push        dword ptr [eax]
 006A22ED    mov         eax,dword ptr [ebp-1C]
 006A22F0    push        dword ptr [eax]
 006A22F2    push        dword ptr [esi]
 006A22F4    push        6A67D0;'Vague'
 006A22F9    lea         eax,[ebp-1D8]
 006A22FF    mov         edx,5
 006A2304    call        @UStrCatN
 006A2309    mov         edx,dword ptr [ebp-1D8]
 006A230F    mov         ecx,dword ptr [ebp-8]
 006A2312    add         ecx,294
 006A2318    mov         eax,dword ptr [ebp-0C]
 006A231B    lea         eax,[eax+eax*2]
 006A231E    add         ecx,eax
 006A2320    mov         eax,dword ptr [ebp-10]
 006A2323    lea         eax,[eax+eax*8]
 006A2326    add         ecx,eax
 006A2328    mov         eax,dword ptr [ebp-4]
 006A232B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A232E    call        THashTable.Add
 006A2333    push        6A6780;'Fingers'
 006A2338    mov         eax,dword ptr [ebp-1C]
 006A233B    push        dword ptr [eax]
 006A233D    mov         eax,dword ptr [ebp-18]
 006A2340    push        dword ptr [eax]
 006A2342    push        dword ptr [esi]
 006A2344    push        6A67D0;'Vague'
 006A2349    lea         eax,[ebp-1DC]
 006A234F    mov         edx,5
 006A2354    call        @UStrCatN
 006A2359    mov         edx,dword ptr [ebp-1DC]
 006A235F    mov         ecx,dword ptr [ebp-8]
 006A2362    add         ecx,258
 006A2368    mov         eax,dword ptr [ebp-0C]
 006A236B    lea         eax,[eax+eax*2]
 006A236E    add         ecx,eax
 006A2370    mov         eax,dword ptr [ebp-10]
 006A2373    lea         eax,[eax+eax*8]
 006A2376    add         ecx,eax
 006A2378    mov         eax,dword ptr [ebp-4]
 006A237B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A237E    call        THashTable.Add
 006A2383    push        6A67B8;'Palm'
 006A2388    mov         eax,dword ptr [ebp-1C]
 006A238B    push        dword ptr [eax]
 006A238D    mov         eax,dword ptr [ebp-18]
 006A2390    push        dword ptr [eax]
 006A2392    push        dword ptr [esi]
 006A2394    push        6A67D0;'Vague'
 006A2399    lea         eax,[ebp-1E0]
 006A239F    mov         edx,5
 006A23A4    call        @UStrCatN
 006A23A9    mov         edx,dword ptr [ebp-1E0]
 006A23AF    mov         ecx,dword ptr [ebp-8]
 006A23B2    add         ecx,276
 006A23B8    mov         eax,dword ptr [ebp-0C]
 006A23BB    lea         eax,[eax+eax*2]
 006A23BE    add         ecx,eax
 006A23C0    mov         eax,dword ptr [ebp-10]
 006A23C3    lea         eax,[eax+eax*8]
 006A23C6    add         ecx,eax
 006A23C8    mov         eax,dword ptr [ebp-4]
 006A23CB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A23CE    call        THashTable.Add
 006A23D3    push        6A32F4;'Thumb'
 006A23D8    mov         eax,dword ptr [ebp-1C]
 006A23DB    push        dword ptr [eax]
 006A23DD    mov         eax,dword ptr [ebp-18]
 006A23E0    push        dword ptr [eax]
 006A23E2    push        dword ptr [esi]
 006A23E4    push        6A67D0;'Vague'
 006A23E9    lea         eax,[ebp-1E4]
 006A23EF    mov         edx,5
 006A23F4    call        @UStrCatN
 006A23F9    mov         edx,dword ptr [ebp-1E4]
 006A23FF    mov         ecx,dword ptr [ebp-8]
 006A2402    add         ecx,294
 006A2408    mov         eax,dword ptr [ebp-0C]
 006A240B    lea         eax,[eax+eax*2]
 006A240E    add         ecx,eax
 006A2410    mov         eax,dword ptr [ebp-10]
 006A2413    lea         eax,[eax+eax*8]
 006A2416    add         ecx,eax
 006A2418    mov         eax,dword ptr [ebp-4]
 006A241B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A241E    call        THashTable.Add
 006A2423    push        6A6780;'Fingers'
 006A2428    mov         eax,dword ptr [ebp-1C]
 006A242B    push        dword ptr [eax]
 006A242D    push        dword ptr [esi]
 006A242F    mov         eax,dword ptr [ebp-18]
 006A2432    push        dword ptr [eax]
 006A2434    push        6A67D0;'Vague'
 006A2439    lea         eax,[ebp-1E8]
 006A243F    mov         edx,5
 006A2444    call        @UStrCatN
 006A2449    mov         edx,dword ptr [ebp-1E8]
 006A244F    mov         ecx,dword ptr [ebp-8]
 006A2452    add         ecx,258
 006A2458    mov         eax,dword ptr [ebp-0C]
 006A245B    lea         eax,[eax+eax*2]
 006A245E    add         ecx,eax
 006A2460    mov         eax,dword ptr [ebp-10]
 006A2463    lea         eax,[eax+eax*8]
 006A2466    add         ecx,eax
 006A2468    mov         eax,dword ptr [ebp-4]
 006A246B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A246E    call        THashTable.Add
 006A2473    push        6A67B8;'Palm'
 006A2478    mov         eax,dword ptr [ebp-1C]
 006A247B    push        dword ptr [eax]
 006A247D    push        dword ptr [esi]
 006A247F    mov         eax,dword ptr [ebp-18]
 006A2482    push        dword ptr [eax]
 006A2484    push        6A67D0;'Vague'
 006A2489    lea         eax,[ebp-1EC]
 006A248F    mov         edx,5
 006A2494    call        @UStrCatN
 006A2499    mov         edx,dword ptr [ebp-1EC]
 006A249F    mov         ecx,dword ptr [ebp-8]
 006A24A2    add         ecx,276
 006A24A8    mov         eax,dword ptr [ebp-0C]
 006A24AB    lea         eax,[eax+eax*2]
 006A24AE    add         ecx,eax
 006A24B0    mov         eax,dword ptr [ebp-10]
 006A24B3    lea         eax,[eax+eax*8]
 006A24B6    add         ecx,eax
 006A24B8    mov         eax,dword ptr [ebp-4]
 006A24BB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A24BE    call        THashTable.Add
 006A24C3    push        6A32F4;'Thumb'
 006A24C8    mov         eax,dword ptr [ebp-1C]
 006A24CB    push        dword ptr [eax]
 006A24CD    push        dword ptr [esi]
 006A24CF    mov         eax,dword ptr [ebp-18]
 006A24D2    push        dword ptr [eax]
 006A24D4    push        6A67D0;'Vague'
 006A24D9    lea         eax,[ebp-1F0]
 006A24DF    mov         edx,5
 006A24E4    call        @UStrCatN
 006A24E9    mov         edx,dword ptr [ebp-1F0]
 006A24EF    mov         ecx,dword ptr [ebp-8]
 006A24F2    add         ecx,294
 006A24F8    mov         eax,dword ptr [ebp-0C]
 006A24FB    lea         eax,[eax+eax*2]
 006A24FE    add         ecx,eax
 006A2500    mov         eax,dword ptr [ebp-10]
 006A2503    lea         eax,[eax+eax*8]
 006A2506    add         ecx,eax
 006A2508    mov         eax,dword ptr [ebp-4]
 006A250B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A250E    call        THashTable.Add
 006A2513    push        6A6780;'Fingers'
 006A2518    push        dword ptr [esi]
 006A251A    mov         eax,dword ptr [ebp-1C]
 006A251D    push        dword ptr [eax]
 006A251F    mov         eax,dword ptr [ebp-18]
 006A2522    push        dword ptr [eax]
 006A2524    push        6A67D0;'Vague'
 006A2529    lea         eax,[ebp-1F4]
 006A252F    mov         edx,5
 006A2534    call        @UStrCatN
 006A2539    mov         edx,dword ptr [ebp-1F4]
 006A253F    mov         ecx,dword ptr [ebp-8]
 006A2542    add         ecx,258
 006A2548    mov         eax,dword ptr [ebp-0C]
 006A254B    lea         eax,[eax+eax*2]
 006A254E    add         ecx,eax
 006A2550    mov         eax,dword ptr [ebp-10]
 006A2553    lea         eax,[eax+eax*8]
 006A2556    add         ecx,eax
 006A2558    mov         eax,dword ptr [ebp-4]
 006A255B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A255E    call        THashTable.Add
 006A2563    push        6A67B8;'Palm'
 006A2568    push        dword ptr [esi]
 006A256A    mov         eax,dword ptr [ebp-1C]
 006A256D    push        dword ptr [eax]
 006A256F    mov         eax,dword ptr [ebp-18]
 006A2572    push        dword ptr [eax]
 006A2574    push        6A67D0;'Vague'
 006A2579    lea         eax,[ebp-1F8]
 006A257F    mov         edx,5
 006A2584    call        @UStrCatN
 006A2589    mov         edx,dword ptr [ebp-1F8]
 006A258F    mov         ecx,dword ptr [ebp-8]
 006A2592    add         ecx,276
 006A2598    mov         eax,dword ptr [ebp-0C]
 006A259B    lea         eax,[eax+eax*2]
 006A259E    add         ecx,eax
 006A25A0    mov         eax,dword ptr [ebp-10]
 006A25A3    lea         eax,[eax+eax*8]
 006A25A6    add         ecx,eax
 006A25A8    mov         eax,dword ptr [ebp-4]
 006A25AB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A25AE    call        THashTable.Add
 006A25B3    push        6A32F4;'Thumb'
 006A25B8    push        dword ptr [esi]
 006A25BA    mov         eax,dword ptr [ebp-1C]
 006A25BD    push        dword ptr [eax]
 006A25BF    mov         eax,dword ptr [ebp-18]
 006A25C2    push        dword ptr [eax]
 006A25C4    push        6A67D0;'Vague'
 006A25C9    lea         eax,[ebp-1FC]
 006A25CF    mov         edx,5
 006A25D4    call        @UStrCatN
 006A25D9    mov         edx,dword ptr [ebp-1FC]
 006A25DF    mov         ecx,dword ptr [ebp-8]
 006A25E2    add         ecx,294
 006A25E8    mov         eax,dword ptr [ebp-0C]
 006A25EB    lea         eax,[eax+eax*2]
 006A25EE    add         ecx,eax
 006A25F0    mov         eax,dword ptr [ebp-10]
 006A25F3    lea         eax,[eax+eax*8]
 006A25F6    add         ecx,eax
 006A25F8    mov         eax,dword ptr [ebp-4]
 006A25FB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A25FE    call        THashTable.Add
 006A2603    push        6A6780;'Fingers'
 006A2608    push        dword ptr [esi]
 006A260A    mov         eax,dword ptr [ebp-18]
 006A260D    push        dword ptr [eax]
 006A260F    mov         eax,dword ptr [ebp-1C]
 006A2612    push        dword ptr [eax]
 006A2614    push        6A67D0;'Vague'
 006A2619    lea         eax,[ebp-200]
 006A261F    mov         edx,5
 006A2624    call        @UStrCatN
 006A2629    mov         edx,dword ptr [ebp-200]
 006A262F    mov         ecx,dword ptr [ebp-8]
 006A2632    add         ecx,258
 006A2638    mov         eax,dword ptr [ebp-0C]
 006A263B    lea         eax,[eax+eax*2]
 006A263E    add         ecx,eax
 006A2640    mov         eax,dword ptr [ebp-10]
 006A2643    lea         eax,[eax+eax*8]
 006A2646    add         ecx,eax
 006A2648    mov         eax,dword ptr [ebp-4]
 006A264B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A264E    call        THashTable.Add
 006A2653    push        6A67B8;'Palm'
 006A2658    push        dword ptr [esi]
 006A265A    mov         eax,dword ptr [ebp-18]
 006A265D    push        dword ptr [eax]
 006A265F    mov         eax,dword ptr [ebp-1C]
 006A2662    push        dword ptr [eax]
 006A2664    push        6A67D0;'Vague'
 006A2669    lea         eax,[ebp-204]
 006A266F    mov         edx,5
 006A2674    call        @UStrCatN
 006A2679    mov         edx,dword ptr [ebp-204]
 006A267F    mov         ecx,dword ptr [ebp-8]
 006A2682    add         ecx,276
 006A2688    mov         eax,dword ptr [ebp-0C]
 006A268B    lea         eax,[eax+eax*2]
 006A268E    add         ecx,eax
 006A2690    mov         eax,dword ptr [ebp-10]
 006A2693    lea         eax,[eax+eax*8]
 006A2696    add         ecx,eax
 006A2698    mov         eax,dword ptr [ebp-4]
 006A269B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A269E    call        THashTable.Add
 006A26A3    push        6A32F4;'Thumb'
 006A26A8    push        dword ptr [esi]
 006A26AA    mov         eax,dword ptr [ebp-18]
 006A26AD    push        dword ptr [eax]
 006A26AF    mov         eax,dword ptr [ebp-1C]
 006A26B2    push        dword ptr [eax]
 006A26B4    push        6A67D0;'Vague'
 006A26B9    lea         eax,[ebp-208]
 006A26BF    mov         edx,5
 006A26C4    call        @UStrCatN
 006A26C9    mov         edx,dword ptr [ebp-208]
 006A26CF    mov         ecx,dword ptr [ebp-8]
 006A26D2    add         ecx,294
 006A26D8    mov         eax,dword ptr [ebp-0C]
 006A26DB    lea         eax,[eax+eax*2]
 006A26DE    add         ecx,eax
 006A26E0    mov         eax,dword ptr [ebp-10]
 006A26E3    lea         eax,[eax+eax*8]
 006A26E6    add         ecx,eax
 006A26E8    mov         eax,dword ptr [ebp-4]
 006A26EB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A26EE    call        THashTable.Add
 006A26F3    push        6A6780;'Fingers'
 006A26F8    mov         eax,dword ptr [ebp-18]
 006A26FB    push        dword ptr [eax]
 006A26FD    push        dword ptr [esi]
 006A26FF    mov         eax,dword ptr [ebp-1C]
 006A2702    push        dword ptr [eax]
 006A2704    push        6A67D0;'Vague'
 006A2709    lea         eax,[ebp-20C]
 006A270F    mov         edx,5
 006A2714    call        @UStrCatN
 006A2719    mov         edx,dword ptr [ebp-20C]
 006A271F    mov         ecx,dword ptr [ebp-8]
 006A2722    add         ecx,258
 006A2728    mov         eax,dword ptr [ebp-0C]
 006A272B    lea         eax,[eax+eax*2]
 006A272E    add         ecx,eax
 006A2730    mov         eax,dword ptr [ebp-10]
 006A2733    lea         eax,[eax+eax*8]
 006A2736    add         ecx,eax
 006A2738    mov         eax,dword ptr [ebp-4]
 006A273B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A273E    call        THashTable.Add
 006A2743    push        6A67B8;'Palm'
 006A2748    mov         eax,dword ptr [ebp-18]
 006A274B    push        dword ptr [eax]
 006A274D    push        dword ptr [esi]
 006A274F    mov         eax,dword ptr [ebp-1C]
 006A2752    push        dword ptr [eax]
 006A2754    push        6A67D0;'Vague'
 006A2759    lea         eax,[ebp-210]
 006A275F    mov         edx,5
 006A2764    call        @UStrCatN
 006A2769    mov         edx,dword ptr [ebp-210]
 006A276F    mov         ecx,dword ptr [ebp-8]
 006A2772    add         ecx,276
 006A2778    mov         eax,dword ptr [ebp-0C]
 006A277B    lea         eax,[eax+eax*2]
 006A277E    add         ecx,eax
 006A2780    mov         eax,dword ptr [ebp-10]
 006A2783    lea         eax,[eax+eax*8]
 006A2786    add         ecx,eax
 006A2788    mov         eax,dword ptr [ebp-4]
 006A278B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A278E    call        THashTable.Add
 006A2793    push        6A32F4;'Thumb'
 006A2798    mov         eax,dword ptr [ebp-18]
 006A279B    push        dword ptr [eax]
 006A279D    push        dword ptr [esi]
 006A279F    mov         eax,dword ptr [ebp-1C]
 006A27A2    push        dword ptr [eax]
 006A27A4    push        6A67D0;'Vague'
 006A27A9    lea         eax,[ebp-214]
 006A27AF    mov         edx,5
 006A27B4    call        @UStrCatN
 006A27B9    mov         edx,dword ptr [ebp-214]
 006A27BF    mov         ecx,dword ptr [ebp-8]
 006A27C2    add         ecx,294
 006A27C8    mov         eax,dword ptr [ebp-0C]
 006A27CB    lea         eax,[eax+eax*2]
 006A27CE    add         ecx,eax
 006A27D0    mov         eax,dword ptr [ebp-10]
 006A27D3    lea         eax,[eax+eax*8]
 006A27D6    add         ecx,eax
 006A27D8    mov         eax,dword ptr [ebp-4]
 006A27DB    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A27DE    call        THashTable.Add
 006A27E3    push        6A6780;'Fingers'
 006A27E8    mov         eax,dword ptr [ebp-18]
 006A27EB    push        dword ptr [eax]
 006A27ED    mov         eax,dword ptr [ebp-1C]
 006A27F0    push        dword ptr [eax]
 006A27F2    push        dword ptr [esi]
 006A27F4    lea         eax,[ebp-218]
 006A27FA    mov         edx,4
 006A27FF    call        @UStrCatN
 006A2804    mov         edx,dword ptr [ebp-218]
 006A280A    mov         ecx,dword ptr [ebp-8]
 006A280D    add         ecx,190
 006A2813    mov         eax,dword ptr [ebp-0C]
 006A2816    lea         eax,[eax+eax*2]
 006A2819    add         ecx,eax
 006A281B    mov         eax,dword ptr [ebp-10]
 006A281E    lea         eax,[eax+eax*8]
 006A2821    add         ecx,eax
 006A2823    mov         eax,dword ptr [ebp-4]
 006A2826    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2829    call        THashTable.Add
 006A282E    push        6A67B8;'Palm'
 006A2833    mov         eax,dword ptr [ebp-18]
 006A2836    push        dword ptr [eax]
 006A2838    mov         eax,dword ptr [ebp-1C]
 006A283B    push        dword ptr [eax]
 006A283D    push        dword ptr [esi]
 006A283F    lea         eax,[ebp-21C]
 006A2845    mov         edx,4
 006A284A    call        @UStrCatN
 006A284F    mov         edx,dword ptr [ebp-21C]
 006A2855    mov         ecx,dword ptr [ebp-8]
 006A2858    add         ecx,1AE
 006A285E    mov         eax,dword ptr [ebp-0C]
 006A2861    lea         eax,[eax+eax*2]
 006A2864    add         ecx,eax
 006A2866    mov         eax,dword ptr [ebp-10]
 006A2869    lea         eax,[eax+eax*8]
 006A286C    add         ecx,eax
 006A286E    mov         eax,dword ptr [ebp-4]
 006A2871    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2874    call        THashTable.Add
 006A2879    push        6A32F4;'Thumb'
 006A287E    mov         eax,dword ptr [ebp-18]
 006A2881    push        dword ptr [eax]
 006A2883    mov         eax,dword ptr [ebp-1C]
 006A2886    push        dword ptr [eax]
 006A2888    push        dword ptr [esi]
 006A288A    lea         eax,[ebp-220]
 006A2890    mov         edx,4
 006A2895    call        @UStrCatN
 006A289A    mov         edx,dword ptr [ebp-220]
 006A28A0    mov         ecx,dword ptr [ebp-8]
 006A28A3    add         ecx,1CC
 006A28A9    mov         eax,dword ptr [ebp-0C]
 006A28AC    lea         eax,[eax+eax*2]
 006A28AF    add         ecx,eax
 006A28B1    mov         eax,dword ptr [ebp-10]
 006A28B4    lea         eax,[eax+eax*8]
 006A28B7    add         ecx,eax
 006A28B9    mov         eax,dword ptr [ebp-4]
 006A28BC    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A28BF    call        THashTable.Add
 006A28C4    push        6A6780;'Fingers'
 006A28C9    mov         eax,dword ptr [ebp-1C]
 006A28CC    push        dword ptr [eax]
 006A28CE    mov         eax,dword ptr [ebp-18]
 006A28D1    push        dword ptr [eax]
 006A28D3    push        dword ptr [esi]
 006A28D5    lea         eax,[ebp-224]
 006A28DB    mov         edx,4
 006A28E0    call        @UStrCatN
 006A28E5    mov         edx,dword ptr [ebp-224]
 006A28EB    mov         ecx,dword ptr [ebp-8]
 006A28EE    add         ecx,190
 006A28F4    mov         eax,dword ptr [ebp-0C]
 006A28F7    lea         eax,[eax+eax*2]
 006A28FA    add         ecx,eax
 006A28FC    mov         eax,dword ptr [ebp-10]
 006A28FF    lea         eax,[eax+eax*8]
 006A2902    add         ecx,eax
 006A2904    mov         eax,dword ptr [ebp-4]
 006A2907    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A290A    call        THashTable.Add
 006A290F    push        6A67B8;'Palm'
 006A2914    mov         eax,dword ptr [ebp-1C]
 006A2917    push        dword ptr [eax]
 006A2919    mov         eax,dword ptr [ebp-18]
 006A291C    push        dword ptr [eax]
 006A291E    push        dword ptr [esi]
 006A2920    lea         eax,[ebp-228]
 006A2926    mov         edx,4
 006A292B    call        @UStrCatN
 006A2930    mov         edx,dword ptr [ebp-228]
 006A2936    mov         ecx,dword ptr [ebp-8]
 006A2939    add         ecx,1AE
 006A293F    mov         eax,dword ptr [ebp-0C]
 006A2942    lea         eax,[eax+eax*2]
 006A2945    add         ecx,eax
 006A2947    mov         eax,dword ptr [ebp-10]
 006A294A    lea         eax,[eax+eax*8]
 006A294D    add         ecx,eax
 006A294F    mov         eax,dword ptr [ebp-4]
 006A2952    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2955    call        THashTable.Add
 006A295A    push        6A32F4;'Thumb'
 006A295F    mov         eax,dword ptr [ebp-1C]
 006A2962    push        dword ptr [eax]
 006A2964    mov         eax,dword ptr [ebp-18]
 006A2967    push        dword ptr [eax]
 006A2969    push        dword ptr [esi]
 006A296B    lea         eax,[ebp-22C]
 006A2971    mov         edx,4
 006A2976    call        @UStrCatN
 006A297B    mov         edx,dword ptr [ebp-22C]
 006A2981    mov         ecx,dword ptr [ebp-8]
 006A2984    add         ecx,1CC
 006A298A    mov         eax,dword ptr [ebp-0C]
 006A298D    lea         eax,[eax+eax*2]
 006A2990    add         ecx,eax
 006A2992    mov         eax,dword ptr [ebp-10]
 006A2995    lea         eax,[eax+eax*8]
 006A2998    add         ecx,eax
 006A299A    mov         eax,dword ptr [ebp-4]
 006A299D    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A29A0    call        THashTable.Add
 006A29A5    push        6A6780;'Fingers'
 006A29AA    mov         eax,dword ptr [ebp-1C]
 006A29AD    push        dword ptr [eax]
 006A29AF    push        dword ptr [esi]
 006A29B1    mov         eax,dword ptr [ebp-18]
 006A29B4    push        dword ptr [eax]
 006A29B6    lea         eax,[ebp-230]
 006A29BC    mov         edx,4
 006A29C1    call        @UStrCatN
 006A29C6    mov         edx,dword ptr [ebp-230]
 006A29CC    mov         ecx,dword ptr [ebp-8]
 006A29CF    add         ecx,190
 006A29D5    mov         eax,dword ptr [ebp-0C]
 006A29D8    lea         eax,[eax+eax*2]
 006A29DB    add         ecx,eax
 006A29DD    mov         eax,dword ptr [ebp-10]
 006A29E0    lea         eax,[eax+eax*8]
 006A29E3    add         ecx,eax
 006A29E5    mov         eax,dword ptr [ebp-4]
 006A29E8    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A29EB    call        THashTable.Add
 006A29F0    push        6A67B8;'Palm'
 006A29F5    mov         eax,dword ptr [ebp-1C]
 006A29F8    push        dword ptr [eax]
 006A29FA    push        dword ptr [esi]
 006A29FC    mov         eax,dword ptr [ebp-18]
 006A29FF    push        dword ptr [eax]
 006A2A01    lea         eax,[ebp-234]
 006A2A07    mov         edx,4
 006A2A0C    call        @UStrCatN
 006A2A11    mov         edx,dword ptr [ebp-234]
 006A2A17    mov         ecx,dword ptr [ebp-8]
 006A2A1A    add         ecx,1AE
 006A2A20    mov         eax,dword ptr [ebp-0C]
 006A2A23    lea         eax,[eax+eax*2]
 006A2A26    add         ecx,eax
 006A2A28    mov         eax,dword ptr [ebp-10]
 006A2A2B    lea         eax,[eax+eax*8]
 006A2A2E    add         ecx,eax
 006A2A30    mov         eax,dword ptr [ebp-4]
 006A2A33    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2A36    call        THashTable.Add
 006A2A3B    push        6A32F4;'Thumb'
 006A2A40    mov         eax,dword ptr [ebp-1C]
 006A2A43    push        dword ptr [eax]
 006A2A45    push        dword ptr [esi]
 006A2A47    mov         eax,dword ptr [ebp-18]
 006A2A4A    push        dword ptr [eax]
 006A2A4C    lea         eax,[ebp-238]
 006A2A52    mov         edx,4
 006A2A57    call        @UStrCatN
 006A2A5C    mov         edx,dword ptr [ebp-238]
 006A2A62    mov         ecx,dword ptr [ebp-8]
 006A2A65    add         ecx,1CC
 006A2A6B    mov         eax,dword ptr [ebp-0C]
 006A2A6E    lea         eax,[eax+eax*2]
 006A2A71    add         ecx,eax
 006A2A73    mov         eax,dword ptr [ebp-10]
 006A2A76    lea         eax,[eax+eax*8]
 006A2A79    add         ecx,eax
 006A2A7B    mov         eax,dword ptr [ebp-4]
 006A2A7E    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2A81    call        THashTable.Add
 006A2A86    push        6A6780;'Fingers'
 006A2A8B    push        dword ptr [esi]
 006A2A8D    mov         eax,dword ptr [ebp-1C]
 006A2A90    push        dword ptr [eax]
 006A2A92    mov         eax,dword ptr [ebp-18]
 006A2A95    push        dword ptr [eax]
 006A2A97    lea         eax,[ebp-23C]
 006A2A9D    mov         edx,4
 006A2AA2    call        @UStrCatN
 006A2AA7    mov         edx,dword ptr [ebp-23C]
 006A2AAD    mov         ecx,dword ptr [ebp-8]
 006A2AB0    add         ecx,190
 006A2AB6    mov         eax,dword ptr [ebp-0C]
 006A2AB9    lea         eax,[eax+eax*2]
 006A2ABC    add         ecx,eax
 006A2ABE    mov         eax,dword ptr [ebp-10]
 006A2AC1    lea         eax,[eax+eax*8]
 006A2AC4    add         ecx,eax
 006A2AC6    mov         eax,dword ptr [ebp-4]
 006A2AC9    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2ACC    call        THashTable.Add
 006A2AD1    push        6A67B8;'Palm'
 006A2AD6    push        dword ptr [esi]
 006A2AD8    mov         eax,dword ptr [ebp-1C]
 006A2ADB    push        dword ptr [eax]
 006A2ADD    mov         eax,dword ptr [ebp-18]
 006A2AE0    push        dword ptr [eax]
 006A2AE2    lea         eax,[ebp-240]
 006A2AE8    mov         edx,4
 006A2AED    call        @UStrCatN
 006A2AF2    mov         edx,dword ptr [ebp-240]
 006A2AF8    mov         ecx,dword ptr [ebp-8]
 006A2AFB    add         ecx,1AE
 006A2B01    mov         eax,dword ptr [ebp-0C]
 006A2B04    lea         eax,[eax+eax*2]
 006A2B07    add         ecx,eax
 006A2B09    mov         eax,dword ptr [ebp-10]
 006A2B0C    lea         eax,[eax+eax*8]
 006A2B0F    add         ecx,eax
 006A2B11    mov         eax,dword ptr [ebp-4]
 006A2B14    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2B17    call        THashTable.Add
 006A2B1C    push        6A32F4;'Thumb'
 006A2B21    push        dword ptr [esi]
 006A2B23    mov         eax,dword ptr [ebp-1C]
 006A2B26    push        dword ptr [eax]
 006A2B28    mov         eax,dword ptr [ebp-18]
 006A2B2B    push        dword ptr [eax]
 006A2B2D    lea         eax,[ebp-244]
 006A2B33    mov         edx,4
 006A2B38    call        @UStrCatN
 006A2B3D    mov         edx,dword ptr [ebp-244]
 006A2B43    mov         ecx,dword ptr [ebp-8]
 006A2B46    add         ecx,1CC
 006A2B4C    mov         eax,dword ptr [ebp-0C]
 006A2B4F    lea         eax,[eax+eax*2]
 006A2B52    add         ecx,eax
 006A2B54    mov         eax,dword ptr [ebp-10]
 006A2B57    lea         eax,[eax+eax*8]
 006A2B5A    add         ecx,eax
 006A2B5C    mov         eax,dword ptr [ebp-4]
 006A2B5F    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2B62    call        THashTable.Add
 006A2B67    push        6A6780;'Fingers'
 006A2B6C    push        dword ptr [esi]
 006A2B6E    mov         eax,dword ptr [ebp-18]
 006A2B71    push        dword ptr [eax]
 006A2B73    mov         eax,dword ptr [ebp-1C]
 006A2B76    push        dword ptr [eax]
 006A2B78    lea         eax,[ebp-248]
 006A2B7E    mov         edx,4
 006A2B83    call        @UStrCatN
 006A2B88    mov         edx,dword ptr [ebp-248]
 006A2B8E    mov         ecx,dword ptr [ebp-8]
 006A2B91    add         ecx,190
 006A2B97    mov         eax,dword ptr [ebp-0C]
 006A2B9A    lea         eax,[eax+eax*2]
 006A2B9D    add         ecx,eax
 006A2B9F    mov         eax,dword ptr [ebp-10]
 006A2BA2    lea         eax,[eax+eax*8]
 006A2BA5    add         ecx,eax
 006A2BA7    mov         eax,dword ptr [ebp-4]
 006A2BAA    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2BAD    call        THashTable.Add
 006A2BB2    push        6A67B8;'Palm'
 006A2BB7    push        dword ptr [esi]
 006A2BB9    mov         eax,dword ptr [ebp-18]
 006A2BBC    push        dword ptr [eax]
 006A2BBE    mov         eax,dword ptr [ebp-1C]
 006A2BC1    push        dword ptr [eax]
 006A2BC3    lea         eax,[ebp-24C]
 006A2BC9    mov         edx,4
 006A2BCE    call        @UStrCatN
 006A2BD3    mov         edx,dword ptr [ebp-24C]
 006A2BD9    mov         ecx,dword ptr [ebp-8]
 006A2BDC    add         ecx,1AE
 006A2BE2    mov         eax,dword ptr [ebp-0C]
 006A2BE5    lea         eax,[eax+eax*2]
 006A2BE8    add         ecx,eax
 006A2BEA    mov         eax,dword ptr [ebp-10]
 006A2BED    lea         eax,[eax+eax*8]
 006A2BF0    add         ecx,eax
 006A2BF2    mov         eax,dword ptr [ebp-4]
 006A2BF5    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2BF8    call        THashTable.Add
 006A2BFD    push        6A32F4;'Thumb'
 006A2C02    push        dword ptr [esi]
 006A2C04    mov         eax,dword ptr [ebp-18]
 006A2C07    push        dword ptr [eax]
 006A2C09    mov         eax,dword ptr [ebp-1C]
 006A2C0C    push        dword ptr [eax]
 006A2C0E    lea         eax,[ebp-250]
 006A2C14    mov         edx,4
 006A2C19    call        @UStrCatN
 006A2C1E    mov         edx,dword ptr [ebp-250]
 006A2C24    mov         ecx,dword ptr [ebp-8]
 006A2C27    add         ecx,1CC
 006A2C2D    mov         eax,dword ptr [ebp-0C]
 006A2C30    lea         eax,[eax+eax*2]
 006A2C33    add         ecx,eax
 006A2C35    mov         eax,dword ptr [ebp-10]
 006A2C38    lea         eax,[eax+eax*8]
 006A2C3B    add         ecx,eax
 006A2C3D    mov         eax,dword ptr [ebp-4]
 006A2C40    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2C43    call        THashTable.Add
 006A2C48    push        6A6780;'Fingers'
 006A2C4D    mov         eax,dword ptr [ebp-18]
 006A2C50    push        dword ptr [eax]
 006A2C52    push        dword ptr [esi]
 006A2C54    mov         eax,dword ptr [ebp-1C]
 006A2C57    push        dword ptr [eax]
 006A2C59    lea         eax,[ebp-254]
 006A2C5F    mov         edx,4
 006A2C64    call        @UStrCatN
 006A2C69    mov         edx,dword ptr [ebp-254]
 006A2C6F    mov         ecx,dword ptr [ebp-8]
 006A2C72    add         ecx,190
 006A2C78    mov         eax,dword ptr [ebp-0C]
 006A2C7B    lea         eax,[eax+eax*2]
 006A2C7E    add         ecx,eax
 006A2C80    mov         eax,dword ptr [ebp-10]
 006A2C83    lea         eax,[eax+eax*8]
 006A2C86    add         ecx,eax
 006A2C88    mov         eax,dword ptr [ebp-4]
 006A2C8B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2C8E    call        THashTable.Add
 006A2C93    push        6A67B8;'Palm'
 006A2C98    mov         eax,dword ptr [ebp-18]
 006A2C9B    push        dword ptr [eax]
 006A2C9D    push        dword ptr [esi]
 006A2C9F    mov         eax,dword ptr [ebp-1C]
 006A2CA2    push        dword ptr [eax]
 006A2CA4    lea         eax,[ebp-258]
 006A2CAA    mov         edx,4
 006A2CAF    call        @UStrCatN
 006A2CB4    mov         edx,dword ptr [ebp-258]
 006A2CBA    mov         ecx,dword ptr [ebp-8]
 006A2CBD    add         ecx,1AE
 006A2CC3    mov         eax,dword ptr [ebp-0C]
 006A2CC6    lea         eax,[eax+eax*2]
 006A2CC9    add         ecx,eax
 006A2CCB    mov         eax,dword ptr [ebp-10]
 006A2CCE    lea         eax,[eax+eax*8]
 006A2CD1    add         ecx,eax
 006A2CD3    mov         eax,dword ptr [ebp-4]
 006A2CD6    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2CD9    call        THashTable.Add
 006A2CDE    push        6A32F4;'Thumb'
 006A2CE3    mov         eax,dword ptr [ebp-18]
 006A2CE6    push        dword ptr [eax]
 006A2CE8    push        dword ptr [esi]
 006A2CEA    mov         eax,dword ptr [ebp-1C]
 006A2CED    push        dword ptr [eax]
 006A2CEF    lea         eax,[ebp-25C]
 006A2CF5    mov         edx,4
 006A2CFA    call        @UStrCatN
 006A2CFF    mov         edx,dword ptr [ebp-25C]
 006A2D05    mov         ecx,dword ptr [ebp-8]
 006A2D08    add         ecx,1CC
 006A2D0E    mov         eax,dword ptr [ebp-0C]
 006A2D11    lea         eax,[eax+eax*2]
 006A2D14    add         ecx,eax
 006A2D16    mov         eax,dword ptr [ebp-10]
 006A2D19    lea         eax,[eax+eax*8]
 006A2D1C    add         ecx,eax
 006A2D1E    mov         eax,dword ptr [ebp-4]
 006A2D21    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2D24    call        THashTable.Add
 006A2D29    push        6A67E8;'FingersAngleFrom'
 006A2D2E    mov         eax,dword ptr [ebp-18]
 006A2D31    push        dword ptr [eax]
 006A2D33    mov         eax,dword ptr [ebp-1C]
 006A2D36    push        dword ptr [eax]
 006A2D38    push        dword ptr [esi]
 006A2D3A    lea         eax,[ebp-260]
 006A2D40    mov         edx,4
 006A2D45    call        @UStrCatN
 006A2D4A    mov         edx,dword ptr [ebp-260]
 006A2D50    mov         ecx,dword ptr [ebp-8]
 006A2D53    add         ecx,12C
 006A2D59    mov         eax,dword ptr [ebp-0C]
 006A2D5C    lea         eax,[eax+eax*2]
 006A2D5F    add         ecx,eax
 006A2D61    mov         eax,dword ptr [ebp-10]
 006A2D64    lea         eax,[eax+eax*8]
 006A2D67    add         ecx,eax
 006A2D69    mov         eax,dword ptr [ebp-4]
 006A2D6C    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2D6F    call        THashTable.Add
 006A2D74    push        6A6818;'PalmAngleFrom'
 006A2D79    mov         eax,dword ptr [ebp-18]
 006A2D7C    push        dword ptr [eax]
 006A2D7E    mov         eax,dword ptr [ebp-1C]
 006A2D81    push        dword ptr [eax]
 006A2D83    push        dword ptr [esi]
 006A2D85    lea         eax,[ebp-264]
 006A2D8B    mov         edx,4
 006A2D90    call        @UStrCatN
 006A2D95    mov         edx,dword ptr [ebp-264]
 006A2D9B    mov         ecx,dword ptr [ebp-8]
 006A2D9E    add         ecx,14A
 006A2DA4    mov         eax,dword ptr [ebp-0C]
 006A2DA7    lea         eax,[eax+eax*2]
 006A2DAA    add         ecx,eax
 006A2DAC    mov         eax,dword ptr [ebp-10]
 006A2DAF    lea         eax,[eax+eax*8]
 006A2DB2    add         ecx,eax
 006A2DB4    mov         eax,dword ptr [ebp-4]
 006A2DB7    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2DBA    call        THashTable.Add
 006A2DBF    push        6A6840;'ThumbAngleFrom'
 006A2DC4    mov         eax,dword ptr [ebp-18]
 006A2DC7    push        dword ptr [eax]
 006A2DC9    mov         eax,dword ptr [ebp-1C]
 006A2DCC    push        dword ptr [eax]
 006A2DCE    push        dword ptr [esi]
 006A2DD0    lea         eax,[ebp-268]
 006A2DD6    mov         edx,4
 006A2DDB    call        @UStrCatN
 006A2DE0    mov         edx,dword ptr [ebp-268]
 006A2DE6    mov         ecx,dword ptr [ebp-8]
 006A2DE9    add         ecx,168
 006A2DEF    mov         eax,dword ptr [ebp-0C]
 006A2DF2    lea         eax,[eax+eax*2]
 006A2DF5    add         ecx,eax
 006A2DF7    mov         eax,dword ptr [ebp-10]
 006A2DFA    lea         eax,[eax+eax*8]
 006A2DFD    add         ecx,eax
 006A2DFF    mov         eax,dword ptr [ebp-4]
 006A2E02    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2E05    call        THashTable.Add
 006A2E0A    push        6A67E8;'FingersAngleFrom'
 006A2E0F    mov         eax,dword ptr [ebp-1C]
 006A2E12    push        dword ptr [eax]
 006A2E14    mov         eax,dword ptr [ebp-18]
 006A2E17    push        dword ptr [eax]
 006A2E19    push        dword ptr [esi]
 006A2E1B    lea         eax,[ebp-26C]
 006A2E21    mov         edx,4
 006A2E26    call        @UStrCatN
 006A2E2B    mov         edx,dword ptr [ebp-26C]
 006A2E31    mov         ecx,dword ptr [ebp-8]
 006A2E34    add         ecx,12C
 006A2E3A    mov         eax,dword ptr [ebp-0C]
 006A2E3D    lea         eax,[eax+eax*2]
 006A2E40    add         ecx,eax
 006A2E42    mov         eax,dword ptr [ebp-10]
 006A2E45    lea         eax,[eax+eax*8]
 006A2E48    add         ecx,eax
 006A2E4A    mov         eax,dword ptr [ebp-4]
 006A2E4D    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2E50    call        THashTable.Add
 006A2E55    push        6A6818;'PalmAngleFrom'
 006A2E5A    mov         eax,dword ptr [ebp-1C]
 006A2E5D    push        dword ptr [eax]
 006A2E5F    mov         eax,dword ptr [ebp-18]
 006A2E62    push        dword ptr [eax]
 006A2E64    push        dword ptr [esi]
 006A2E66    lea         eax,[ebp-270]
 006A2E6C    mov         edx,4
 006A2E71    call        @UStrCatN
 006A2E76    mov         edx,dword ptr [ebp-270]
 006A2E7C    mov         ecx,dword ptr [ebp-8]
 006A2E7F    add         ecx,14A
 006A2E85    mov         eax,dword ptr [ebp-0C]
 006A2E88    lea         eax,[eax+eax*2]
 006A2E8B    add         ecx,eax
 006A2E8D    mov         eax,dword ptr [ebp-10]
 006A2E90    lea         eax,[eax+eax*8]
 006A2E93    add         ecx,eax
 006A2E95    mov         eax,dword ptr [ebp-4]
 006A2E98    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2E9B    call        THashTable.Add
 006A2EA0    push        6A6840;'ThumbAngleFrom'
 006A2EA5    mov         eax,dword ptr [ebp-1C]
 006A2EA8    push        dword ptr [eax]
 006A2EAA    mov         eax,dword ptr [ebp-18]
 006A2EAD    push        dword ptr [eax]
 006A2EAF    push        dword ptr [esi]
 006A2EB1    lea         eax,[ebp-274]
 006A2EB7    mov         edx,4
 006A2EBC    call        @UStrCatN
 006A2EC1    mov         edx,dword ptr [ebp-274]
 006A2EC7    mov         ecx,dword ptr [ebp-8]
 006A2ECA    add         ecx,168
 006A2ED0    mov         eax,dword ptr [ebp-0C]
 006A2ED3    lea         eax,[eax+eax*2]
 006A2ED6    add         ecx,eax
 006A2ED8    mov         eax,dword ptr [ebp-10]
 006A2EDB    lea         eax,[eax+eax*8]
 006A2EDE    add         ecx,eax
 006A2EE0    mov         eax,dword ptr [ebp-4]
 006A2EE3    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2EE6    call        THashTable.Add
 006A2EEB    push        6A67E8;'FingersAngleFrom'
 006A2EF0    mov         eax,dword ptr [ebp-1C]
 006A2EF3    push        dword ptr [eax]
 006A2EF5    push        dword ptr [esi]
 006A2EF7    mov         eax,dword ptr [ebp-18]
 006A2EFA    push        dword ptr [eax]
 006A2EFC    lea         eax,[ebp-278]
 006A2F02    mov         edx,4
 006A2F07    call        @UStrCatN
 006A2F0C    mov         edx,dword ptr [ebp-278]
 006A2F12    mov         ecx,dword ptr [ebp-8]
 006A2F15    add         ecx,12C
 006A2F1B    mov         eax,dword ptr [ebp-0C]
 006A2F1E    lea         eax,[eax+eax*2]
 006A2F21    add         ecx,eax
 006A2F23    mov         eax,dword ptr [ebp-10]
 006A2F26    lea         eax,[eax+eax*8]
 006A2F29    add         ecx,eax
 006A2F2B    mov         eax,dword ptr [ebp-4]
 006A2F2E    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2F31    call        THashTable.Add
 006A2F36    push        6A6818;'PalmAngleFrom'
 006A2F3B    mov         eax,dword ptr [ebp-1C]
 006A2F3E    push        dword ptr [eax]
 006A2F40    push        dword ptr [esi]
 006A2F42    mov         eax,dword ptr [ebp-18]
 006A2F45    push        dword ptr [eax]
 006A2F47    lea         eax,[ebp-27C]
 006A2F4D    mov         edx,4
 006A2F52    call        @UStrCatN
 006A2F57    mov         edx,dword ptr [ebp-27C]
 006A2F5D    mov         ecx,dword ptr [ebp-8]
 006A2F60    add         ecx,14A
 006A2F66    mov         eax,dword ptr [ebp-0C]
 006A2F69    lea         eax,[eax+eax*2]
 006A2F6C    add         ecx,eax
 006A2F6E    mov         eax,dword ptr [ebp-10]
 006A2F71    lea         eax,[eax+eax*8]
 006A2F74    add         ecx,eax
 006A2F76    mov         eax,dword ptr [ebp-4]
 006A2F79    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2F7C    call        THashTable.Add
 006A2F81    push        6A6840;'ThumbAngleFrom'
 006A2F86    mov         eax,dword ptr [ebp-1C]
 006A2F89    push        dword ptr [eax]
 006A2F8B    push        dword ptr [esi]
 006A2F8D    mov         eax,dword ptr [ebp-18]
 006A2F90    push        dword ptr [eax]
 006A2F92    lea         eax,[ebp-280]
 006A2F98    mov         edx,4
 006A2F9D    call        @UStrCatN
 006A2FA2    mov         edx,dword ptr [ebp-280]
 006A2FA8    mov         ecx,dword ptr [ebp-8]
 006A2FAB    add         ecx,168
 006A2FB1    mov         eax,dword ptr [ebp-0C]
 006A2FB4    lea         eax,[eax+eax*2]
 006A2FB7    add         ecx,eax
 006A2FB9    mov         eax,dword ptr [ebp-10]
 006A2FBC    lea         eax,[eax+eax*8]
 006A2FBF    add         ecx,eax
 006A2FC1    mov         eax,dword ptr [ebp-4]
 006A2FC4    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A2FC7    call        THashTable.Add
 006A2FCC    push        6A67E8;'FingersAngleFrom'
 006A2FD1    push        dword ptr [esi]
 006A2FD3    mov         eax,dword ptr [ebp-1C]
 006A2FD6    push        dword ptr [eax]
 006A2FD8    mov         eax,dword ptr [ebp-18]
 006A2FDB    push        dword ptr [eax]
 006A2FDD    lea         eax,[ebp-284]
 006A2FE3    mov         edx,4
 006A2FE8    call        @UStrCatN
 006A2FED    mov         edx,dword ptr [ebp-284]
 006A2FF3    mov         ecx,dword ptr [ebp-8]
 006A2FF6    add         ecx,12C
 006A2FFC    mov         eax,dword ptr [ebp-0C]
 006A2FFF    lea         eax,[eax+eax*2]
 006A3002    add         ecx,eax
 006A3004    mov         eax,dword ptr [ebp-10]
 006A3007    lea         eax,[eax+eax*8]
 006A300A    add         ecx,eax
 006A300C    mov         eax,dword ptr [ebp-4]
 006A300F    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A3012    call        THashTable.Add
 006A3017    push        6A6818;'PalmAngleFrom'
 006A301C    push        dword ptr [esi]
 006A301E    mov         eax,dword ptr [ebp-1C]
 006A3021    push        dword ptr [eax]
 006A3023    mov         eax,dword ptr [ebp-18]
 006A3026    push        dword ptr [eax]
 006A3028    lea         eax,[ebp-288]
 006A302E    mov         edx,4
 006A3033    call        @UStrCatN
 006A3038    mov         edx,dword ptr [ebp-288]
 006A303E    mov         ecx,dword ptr [ebp-8]
 006A3041    add         ecx,14A
 006A3047    mov         eax,dword ptr [ebp-0C]
 006A304A    lea         eax,[eax+eax*2]
 006A304D    add         ecx,eax
 006A304F    mov         eax,dword ptr [ebp-10]
 006A3052    lea         eax,[eax+eax*8]
 006A3055    add         ecx,eax
 006A3057    mov         eax,dword ptr [ebp-4]
 006A305A    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A305D    call        THashTable.Add
 006A3062    push        6A6840;'ThumbAngleFrom'
 006A3067    push        dword ptr [esi]
 006A3069    mov         eax,dword ptr [ebp-1C]
 006A306C    push        dword ptr [eax]
 006A306E    mov         eax,dword ptr [ebp-18]
 006A3071    push        dword ptr [eax]
 006A3073    lea         eax,[ebp-28C]
 006A3079    mov         edx,4
 006A307E    call        @UStrCatN
 006A3083    mov         edx,dword ptr [ebp-28C]
 006A3089    mov         ecx,dword ptr [ebp-8]
 006A308C    add         ecx,168
 006A3092    mov         eax,dword ptr [ebp-0C]
 006A3095    lea         eax,[eax+eax*2]
 006A3098    add         ecx,eax
 006A309A    mov         eax,dword ptr [ebp-10]
 006A309D    lea         eax,[eax+eax*8]
 006A30A0    add         ecx,eax
 006A30A2    mov         eax,dword ptr [ebp-4]
 006A30A5    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A30A8    call        THashTable.Add
 006A30AD    push        6A67E8;'FingersAngleFrom'
 006A30B2    push        dword ptr [esi]
 006A30B4    mov         eax,dword ptr [ebp-18]
 006A30B7    push        dword ptr [eax]
 006A30B9    mov         eax,dword ptr [ebp-1C]
 006A30BC    push        dword ptr [eax]
 006A30BE    lea         eax,[ebp-290]
 006A30C4    mov         edx,4
 006A30C9    call        @UStrCatN
 006A30CE    mov         edx,dword ptr [ebp-290]
 006A30D4    mov         ecx,dword ptr [ebp-8]
 006A30D7    add         ecx,12C
 006A30DD    mov         eax,dword ptr [ebp-0C]
 006A30E0    lea         eax,[eax+eax*2]
 006A30E3    add         ecx,eax
 006A30E5    mov         eax,dword ptr [ebp-10]
 006A30E8    lea         eax,[eax+eax*8]
 006A30EB    add         ecx,eax
 006A30ED    mov         eax,dword ptr [ebp-4]
 006A30F0    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A30F3    call        THashTable.Add
 006A30F8    push        6A6818;'PalmAngleFrom'
 006A30FD    push        dword ptr [esi]
 006A30FF    mov         eax,dword ptr [ebp-18]
 006A3102    push        dword ptr [eax]
 006A3104    mov         eax,dword ptr [ebp-1C]
 006A3107    push        dword ptr [eax]
 006A3109    lea         eax,[ebp-294]
 006A310F    mov         edx,4
 006A3114    call        @UStrCatN
 006A3119    mov         edx,dword ptr [ebp-294]
 006A311F    mov         ecx,dword ptr [ebp-8]
 006A3122    add         ecx,14A
 006A3128    mov         eax,dword ptr [ebp-0C]
 006A312B    lea         eax,[eax+eax*2]
 006A312E    add         ecx,eax
 006A3130    mov         eax,dword ptr [ebp-10]
 006A3133    lea         eax,[eax+eax*8]
 006A3136    add         ecx,eax
 006A3138    mov         eax,dword ptr [ebp-4]
 006A313B    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A313E    call        THashTable.Add
 006A3143    push        6A6840;'ThumbAngleFrom'
 006A3148    push        dword ptr [esi]
 006A314A    mov         eax,dword ptr [ebp-18]
 006A314D    push        dword ptr [eax]
 006A314F    mov         eax,dword ptr [ebp-1C]
 006A3152    push        dword ptr [eax]
 006A3154    lea         eax,[ebp-298]
 006A315A    mov         edx,4
 006A315F    call        @UStrCatN
 006A3164    mov         edx,dword ptr [ebp-298]
 006A316A    mov         ecx,dword ptr [ebp-8]
 006A316D    add         ecx,168
 006A3173    mov         eax,dword ptr [ebp-0C]
 006A3176    lea         eax,[eax+eax*2]
 006A3179    add         ecx,eax
 006A317B    mov         eax,dword ptr [ebp-10]
 006A317E    lea         eax,[eax+eax*8]
 006A3181    add         ecx,eax
 006A3183    mov         eax,dword ptr [ebp-4]
 006A3186    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A3189    call        THashTable.Add
 006A318E    push        6A67E8;'FingersAngleFrom'
 006A3193    mov         eax,dword ptr [ebp-18]
 006A3196    push        dword ptr [eax]
 006A3198    push        dword ptr [esi]
 006A319A    mov         eax,dword ptr [ebp-1C]
 006A319D    push        dword ptr [eax]
 006A319F    lea         eax,[ebp-29C]
 006A31A5    mov         edx,4
 006A31AA    call        @UStrCatN
 006A31AF    mov         edx,dword ptr [ebp-29C]
 006A31B5    mov         ecx,dword ptr [ebp-8]
 006A31B8    add         ecx,12C
 006A31BE    mov         eax,dword ptr [ebp-0C]
 006A31C1    lea         eax,[eax+eax*2]
 006A31C4    add         ecx,eax
 006A31C6    mov         eax,dword ptr [ebp-10]
 006A31C9    lea         eax,[eax+eax*8]
 006A31CC    add         ecx,eax
 006A31CE    mov         eax,dword ptr [ebp-4]
 006A31D1    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A31D4    call        THashTable.Add
 006A31D9    push        6A6818;'PalmAngleFrom'
 006A31DE    mov         eax,dword ptr [ebp-18]
 006A31E1    push        dword ptr [eax]
 006A31E3    push        dword ptr [esi]
 006A31E5    mov         eax,dword ptr [ebp-1C]
 006A31E8    push        dword ptr [eax]
 006A31EA    lea         eax,[ebp-2A0]
 006A31F0    mov         edx,4
 006A31F5    call        @UStrCatN
 006A31FA    mov         edx,dword ptr [ebp-2A0]
 006A3200    mov         ecx,dword ptr [ebp-8]
 006A3203    add         ecx,14A
 006A3209    mov         eax,dword ptr [ebp-0C]
 006A320C    lea         eax,[eax+eax*2]
 006A320F    add         ecx,eax
 006A3211    mov         eax,dword ptr [ebp-10]
 006A3214    lea         eax,[eax+eax*8]
 006A3217    add         ecx,eax
 006A3219    mov         eax,dword ptr [ebp-4]
 006A321C    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A321F    call        THashTable.Add
 006A3224    push        6A6840;'ThumbAngleFrom'
 006A3229    mov         eax,dword ptr [ebp-18]
 006A322C    push        dword ptr [eax]
 006A322E    push        dword ptr [esi]
 006A3230    mov         eax,dword ptr [ebp-1C]
 006A3233    push        dword ptr [eax]
 006A3235    lea         eax,[ebp-2A4]
 006A323B    mov         edx,4
 006A3240    call        @UStrCatN
 006A3245    mov         edx,dword ptr [ebp-2A4]
 006A324B    mov         ecx,dword ptr [ebp-8]
 006A324E    add         ecx,168
 006A3254    mov         eax,dword ptr [ebp-0C]
 006A3257    lea         eax,[eax+eax*2]
 006A325A    add         ecx,eax
 006A325C    mov         eax,dword ptr [ebp-10]
 006A325F    lea         eax,[eax+eax*8]
 006A3262    add         ecx,eax
 006A3264    mov         eax,dword ptr [ebp-4]
 006A3267    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A326A    call        THashTable.Add
 006A326F    inc         dword ptr [ebp-10]
 006A3272    add         esi,4
 006A3275    add         ebx,4
 006A3278    cmp         dword ptr [ebp-10],3
>006A327C    jne         006A07C3
 006A3282    inc         dword ptr [ebp-0C]
 006A3285    add         dword ptr [ebp-1C],4
 006A3289    add         edi,4
 006A328C    cmp         dword ptr [ebp-0C],3
>006A3290    jne         006A07B4
 006A3296    inc         dword ptr [ebp-8]
 006A3299    add         dword ptr [ebp-18],4
 006A329D    add         dword ptr [ebp-14],4
 006A32A1    cmp         dword ptr [ebp-8],3
>006A32A5    jne         006A07A3
 006A32AB    xor         eax,eax
 006A32AD    pop         edx
 006A32AE    pop         ecx
 006A32AF    pop         ecx
 006A32B0    mov         dword ptr fs:[eax],edx
 006A32B3    push        6A32E0
 006A32B8    lea         eax,[ebp-2A4]
 006A32BE    mov         edx,64
 006A32C3    call        @UStrArrayClr
 006A32C8    lea         eax,[ebp-114]
 006A32CE    mov         edx,3E
 006A32D3    call        @UStrArrayClr
 006A32D8    ret
>006A32D9    jmp         @HandleFinally
>006A32DE    jmp         006A32B8
 006A32E0    pop         edi
 006A32E1    pop         esi
 006A32E2    pop         ebx
 006A32E3    mov         esp,ebp
 006A32E5    pop         ebp
 006A32E6    ret
*}
end;

//006A6860
procedure TModuleP5.ClearRead;
begin
{*
 006A6860    call        TPieModule.ClearRead
 006A6865    ret
*}
end;

//006A6868
constructor TModuleP5.Create;
begin
{*
 006A6868    push        ebx
 006A6869    push        esi
 006A686A    test        dl,dl
>006A686C    je          006A6876
 006A686E    add         esp,0FFFFFFF0
 006A6871    call        @ClassCreate
 006A6876    mov         ebx,edx
 006A6878    mov         esi,eax
 006A687A    push        6A68BC;'P5'
 006A687F    push        6A68D0;'P5Glove'
 006A6884    push        0
 006A6886    push        0
 006A6888    mov         ecx,6A68EC;'Glove'
 006A688D    xor         edx,edx
 006A688F    mov         eax,esi
 006A6891    call        005E4830
 006A6896    mov         eax,esi
 006A6898    test        bl,bl
>006A689A    je          006A68AB
 006A689C    call        @AfterConstruction
 006A68A1    pop         dword ptr fs:[0]
 006A68A8    add         esp,0C
 006A68AB    mov         eax,esi
 006A68AD    pop         esi
 006A68AE    pop         ebx
 006A68AF    ret
*}
end;

//006A68F8
function TModuleP5.CreateValue(Identifier:string):TExpression;
begin
{*
 006A68F8    push        ebp
 006A68F9    mov         ebp,esp
 006A68FB    push        ecx
 006A68FC    push        ebx
 006A68FD    mov         dword ptr [ebp-4],edx
 006A6900    mov         ebx,eax
 006A6902    mov         eax,dword ptr [ebp-4]
 006A6905    call        @UStrAddRef
 006A690A    xor         eax,eax
 006A690C    push        ebp
 006A690D    push        6A693C
 006A6912    push        dword ptr fs:[eax]
 006A6915    mov         dword ptr fs:[eax],esp
 006A6918    mov         byte ptr [ebx+24],1;TModuleP5.Used:Boolean
 006A691C    mov         eax,dword ptr [ebp-4]
 006A691F    call        0069E220
 006A6924    mov         ebx,eax
 006A6926    xor         eax,eax
 006A6928    pop         edx
 006A6929    pop         ecx
 006A692A    pop         ecx
 006A692B    mov         dword ptr fs:[eax],edx
 006A692E    push        6A6943
 006A6933    lea         eax,[ebp-4]
 006A6936    call        @UStrClr
 006A693B    ret
>006A693C    jmp         @HandleFinally
>006A6941    jmp         006A6933
 006A6943    mov         eax,ebx
 006A6945    pop         ebx
 006A6946    pop         ecx
 006A6947    pop         ebp
 006A6948    ret
*}
end;

//006A694C
function TModuleP5.GetDefaultFormat(field:string):TGuiFormat;
begin
{*
 006A694C    push        ebp
 006A694D    mov         ebp,esp
 006A694F    push        ecx
 006A6950    push        ebx
 006A6951    mov         dword ptr [ebp-4],edx
 006A6954    mov         ebx,eax
 006A6956    mov         eax,dword ptr [ebp-4]
 006A6959    call        @UStrAddRef
 006A695E    xor         eax,eax
 006A6960    push        ebp
 006A6961    push        6A69A2
 006A6966    push        dword ptr fs:[eax]
 006A6969    mov         dword ptr fs:[eax],esp
 006A696C    mov         edx,dword ptr [ebp-4]
 006A696F    mov         eax,dword ptr [ebx+1C];TModuleP5.Fields:THashTable
 006A6972    call        THashTable.Get
 006A6977    add         eax,0FFFFFFFA
 006A697A    sub         eax,4
>006A697D    jb          006A6986
 006A697F    sub         eax,90
>006A6984    jne         006A698A
 006A6986    xor         ebx,ebx
>006A6988    jmp         006A698C
 006A698A    mov         bl,9
 006A698C    xor         eax,eax
 006A698E    pop         edx
 006A698F    pop         ecx
 006A6990    pop         ecx
 006A6991    mov         dword ptr fs:[eax],edx
 006A6994    push        6A69A9
 006A6999    lea         eax,[ebp-4]
 006A699C    call        @UStrClr
 006A69A1    ret
>006A69A2    jmp         @HandleFinally
>006A69A7    jmp         006A6999
 006A69A9    mov         eax,ebx
 006A69AB    pop         ebx
 006A69AC    pop         ecx
 006A69AD    pop         ebp
 006A69AE    ret
*}
end;

//006A69B0
procedure TModuleP5.GetFields;
begin
{*
 006A69B0    call        00699320
 006A69B5    ret
*}
end;

//006A69B8
procedure TModuleP5.GetGoodFields;
begin
{*
 006A69B8    call        00699644
 006A69BD    ret
*}
end;

//006A69C0
procedure TModuleP5.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 006A69C0    push        ebp
 006A69C1    mov         ebp,esp
 006A69C3    mov         byte ptr [edx],1
 006A69C6    mov         dword ptr [ecx],1
 006A69CC    mov         eax,dword ptr [ebp+8]
 006A69CF    mov         dword ptr [eax],14
 006A69D5    pop         ebp
 006A69D6    ret         4
*}
end;

//006A69DC
procedure TModuleP5.MonitorFrame;
begin
{*
 006A69DC    push        ebp
 006A69DD    mov         ebp,esp
 006A69DF    mov         ecx,8
 006A69E4    push        0
 006A69E6    push        0
 006A69E8    dec         ecx
>006A69E9    jne         006A69E4
 006A69EB    push        ebx
 006A69EC    push        esi
 006A69ED    push        edi
 006A69EE    mov         dword ptr [ebp-8],eax
 006A69F1    xor         eax,eax
 006A69F3    push        ebp
 006A69F4    push        6A6BE9
 006A69F9    push        dword ptr fs:[eax]
 006A69FC    mov         dword ptr fs:[eax],esp
 006A69FF    mov         eax,[0081ED78];gvar_0081ED78:Single
 006A6A04    dec         eax
 006A6A05    test        eax,eax
>006A6A07    jl          006A6BC6
 006A6A0D    inc         eax
 006A6A0E    mov         dword ptr [ebp-14],eax
 006A6A11    mov         dword ptr [ebp-0C],0
 006A6A18    mov         dword ptr [ebp-18],81ED84
 006A6A1F    mov         dword ptr [ebp-1C],81EDA4
 006A6A26    cmp         dword ptr [ebp-0C],7
>006A6A2A    jg          006A6BC6
 006A6A30    mov         eax,dword ptr [ebp-0C]
 006A6A33    push        eax
 006A6A34    call        P5DLL.P5_GetStatePointer
 006A6A39    mov         edi,eax
 006A6A3B    test        edi,edi
>006A6A3D    je          006A6BB2
 006A6A43    cmp         dword ptr [edi+0C0],0
>006A6A4A    je          006A6BB2
 006A6A50    cmp         dword ptr [ebp-0C],0
>006A6A54    jne         006A6A65
 006A6A56    lea         eax,[ebp-4]
 006A6A59    mov         edx,6A6C04;'P5.'
 006A6A5E    call        @UStrLAsg
>006A6A63    jmp         006A6A8B
 006A6A65    push        6A6C18;'Glove'
 006A6A6A    lea         edx,[ebp-20]
 006A6A6D    mov         eax,dword ptr [ebp-0C]
 006A6A70    inc         eax
 006A6A71    call        IntToStr
 006A6A76    push        dword ptr [ebp-20]
 006A6A79    push        6A6C30;'.'
 006A6A7E    lea         eax,[ebp-4]
 006A6A81    mov         edx,3
 006A6A86    call        @UStrCatN
 006A6A8B    xor         ebx,ebx
 006A6A8D    mov         eax,dword ptr [ebp-18]
 006A6A90    mov         esi,eax
 006A6A92    cmp         byte ptr [edi+ebx+0FC],0
>006A6A9A    je          006A6ACA
 006A6A9C    cmp         byte ptr [esi],0
>006A6A9F    jne         006A6ACA
 006A6AA1    lea         eax,[ebp-28]
 006A6AA4    mov         edx,ebx
 006A6AA6    add         dx,41
 006A6AAA    call        @UStrFromWChar
 006A6AAF    mov         ecx,dword ptr [ebp-28]
 006A6AB2    lea         eax,[ebp-24]
 006A6AB5    mov         edx,dword ptr [ebp-4]
 006A6AB8    call        @UStrCat3
 006A6ABD    mov         edx,dword ptr [ebp-24]
 006A6AC0    mov         eax,dword ptr [ebp-8]
 006A6AC3    call        005E4F6C
>006A6AC8    jmp         006A6B00
 006A6ACA    cmp         byte ptr [edi+ebx+0FC],0
>006A6AD2    jne         006A6B00
 006A6AD4    cmp         byte ptr [esi],0
>006A6AD7    je          006A6B00
 006A6AD9    lea         eax,[ebp-30]
 006A6ADC    mov         edx,ebx
 006A6ADE    add         dx,41
 006A6AE2    call        @UStrFromWChar
 006A6AE7    mov         ecx,dword ptr [ebp-30]
 006A6AEA    lea         eax,[ebp-2C]
 006A6AED    mov         edx,dword ptr [ebp-4]
 006A6AF0    call        @UStrCat3
 006A6AF5    mov         edx,dword ptr [ebp-2C]
 006A6AF8    mov         eax,dword ptr [ebp-8]
 006A6AFB    call        005E4FB4
 006A6B00    movzx       eax,byte ptr [edi+ebx+0FC]
 006A6B08    mov         byte ptr [esi],al
 006A6B0A    inc         ebx
 006A6B0B    inc         esi
 006A6B0C    cmp         ebx,4
>006A6B0F    jne         006A6A92
 006A6B11    xor         ebx,ebx
 006A6B13    mov         eax,dword ptr [ebp-1C]
 006A6B16    mov         esi,eax
 006A6B18    test        ebx,ebx
>006A6B1A    jne         006A6B29
 006A6B1C    cmp         byte ptr [edi+0C4],37
 006A6B23    seta        byte ptr [ebp-0D]
>006A6B27    jmp         006A6B35
 006A6B29    cmp         byte ptr [edi+ebx+0C4],30
 006A6B31    seta        byte ptr [ebp-0D]
 006A6B35    cmp         byte ptr [ebp-0D],0
>006A6B39    je          006A6B6C
 006A6B3B    cmp         byte ptr [esi],0
>006A6B3E    jne         006A6B6C
 006A6B40    lea         ecx,[ebp-38]
 006A6B43    lea         edx,[ebx+1]
 006A6B46    mov         eax,dword ptr [ebp-8]
 006A6B49    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A6B4C    call        THashTable.Get
 006A6B51    mov         ecx,dword ptr [ebp-38]
 006A6B54    lea         eax,[ebp-34]
 006A6B57    mov         edx,dword ptr [ebp-4]
 006A6B5A    call        @UStrCat3
 006A6B5F    mov         edx,dword ptr [ebp-34]
 006A6B62    mov         eax,dword ptr [ebp-8]
 006A6B65    call        005E4E90
>006A6B6A    jmp         006A6BA1
 006A6B6C    cmp         byte ptr [ebp-0D],0
>006A6B70    jne         006A6BA1
 006A6B72    cmp         byte ptr [esi],0
>006A6B75    je          006A6BA1
 006A6B77    lea         ecx,[ebp-40]
 006A6B7A    lea         edx,[ebx+1]
 006A6B7D    mov         eax,dword ptr [ebp-8]
 006A6B80    mov         eax,dword ptr [eax+1C];TModuleP5.Fields:THashTable
 006A6B83    call        THashTable.Get
 006A6B88    mov         ecx,dword ptr [ebp-40]
 006A6B8B    lea         eax,[ebp-3C]
 006A6B8E    mov         edx,dword ptr [ebp-4]
 006A6B91    call        @UStrCat3
 006A6B96    mov         edx,dword ptr [ebp-3C]
 006A6B99    mov         eax,dword ptr [ebp-8]
 006A6B9C    call        005E4ED8
 006A6BA1    movzx       eax,byte ptr [ebp-0D]
 006A6BA5    mov         byte ptr [esi],al
 006A6BA7    inc         ebx
 006A6BA8    inc         esi
 006A6BA9    cmp         ebx,5
>006A6BAC    jne         006A6B18
 006A6BB2    inc         dword ptr [ebp-0C]
 006A6BB5    add         dword ptr [ebp-1C],5
 006A6BB9    add         dword ptr [ebp-18],4
 006A6BBD    dec         dword ptr [ebp-14]
>006A6BC0    jne         006A6A26
 006A6BC6    xor         eax,eax
 006A6BC8    pop         edx
 006A6BC9    pop         ecx
 006A6BCA    pop         ecx
 006A6BCB    mov         dword ptr fs:[eax],edx
 006A6BCE    push        6A6BF0
 006A6BD3    lea         eax,[ebp-40]
 006A6BD6    mov         edx,9
 006A6BDB    call        @UStrArrayClr
 006A6BE0    lea         eax,[ebp-4]
 006A6BE3    call        @UStrClr
 006A6BE8    ret
>006A6BE9    jmp         @HandleFinally
>006A6BEE    jmp         006A6BD3
 006A6BF0    pop         edi
 006A6BF1    pop         esi
 006A6BF2    pop         ebx
 006A6BF3    mov         esp,ebp
 006A6BF5    pop         ebp
 006A6BF6    ret
*}
end;

//006A6C34
procedure TModuleP5.PrepareForMonitoring;
begin
{*
 006A6C34    call        TPieModule.PrepareForMonitoring
 006A6C39    mov         byte ptr ds:[78BE00],1;gvar_0078BE00
 006A6C40    ret
*}
end;

//006A6C44
function TModuleP5.Read:Boolean;
begin
{*
 006A6C44    call        0069E438
 006A6C49    mov         al,1
 006A6C4B    ret
*}
end;

//006A6C4C
procedure TModuleP5.StartCompiletime;
begin
{*
 006A6C4C    call        TPieModule.StartCompiletime
 006A6C51    call        00698E04
 006A6C56    ret
*}
end;

//006A6C58
procedure TModuleP5.StartRuntime;
begin
{*
 006A6C58    call        TPieModule.StartRuntime
 006A6C5D    call        0069DE8C
 006A6C62    ret
*}
end;

//006A6C64
procedure TModuleP5.StopCompiletime;
begin
{*
 006A6C64    push        ebx
 006A6C65    mov         ebx,eax
 006A6C67    call        00698EA4
 006A6C6C    mov         eax,ebx
 006A6C6E    call        TPieModule.StopCompiletime
 006A6C73    pop         ebx
 006A6C74    ret
*}
end;

//006A6C78
procedure TModuleP5.StopRuntime;
begin
{*
 006A6C78    push        ebx
 006A6C79    mov         ebx,eax
 006A6C7B    call        0069E0E0
 006A6C80    mov         eax,ebx
 006A6C82    call        TPieModule.StopRuntime
 006A6C87    pop         ebx
 006A6C88    ret
*}
end;

Initialization
//007821AC
{*
 007821AC    push        ebp
 007821AD    mov         ebp,esp
 007821AF    push        ebx
 007821B0    push        esi
 007821B1    push        edi
 007821B2    xor         eax,eax
 007821B4    push        ebp
 007821B5    push        78222F
 007821BA    push        dword ptr fs:[eax]
 007821BD    mov         dword ptr fs:[eax],esp
 007821C0    sub         dword ptr ds:[81ED60],1
>007821C7    jae         00782221
 007821C9    xor         edx,edx
 007821CB    push        ebp
 007821CC    push        782206
 007821D1    push        dword ptr fs:[edx]
 007821D4    mov         dword ptr fs:[edx],esp
 007821D7    mov         eax,782248;'Initializing PieP5'
 007821DC    call        004FA5FC
 007821E1    mov         dl,1
 007821E3    mov         eax,[0069891C];TModuleP5
 007821E8    call        TModuleP5.Create;TModuleP5.Create
 007821ED    mov         [0081ED64],eax;gvar_0081ED64:TModuleP5
 007821F2    mov         eax,[0081ED64];gvar_0081ED64:TModuleP5
 007821F7    call        005E31AC
 007821FC    xor         eax,eax
 007821FE    pop         edx
 007821FF    pop         ecx
 00782200    pop         ecx
 00782201    mov         dword ptr fs:[eax],edx
>00782204    jmp         00782221
>00782206    jmp         @HandleOnException
 0078220B    dd          1
 0078220F    dd          00418C04;Exception
 00782213    dd          00782217
 00782217    call        004FA644
 0078221C    call        @DoneExcept
 00782221    xor         eax,eax
 00782223    pop         edx
 00782224    pop         ecx
 00782225    pop         ecx
 00782226    mov         dword ptr fs:[eax],edx
 00782229    push        782236
 0078222E    ret
>0078222F    jmp         @HandleFinally
>00782234    jmp         0078222E
 00782236    pop         edi
 00782237    pop         esi
 00782238    pop         ebx
 00782239    pop         ebp
 0078223A    ret
*}
Finalization
//006A6C8C
{*
 006A6C8C    push        ebp
 006A6C8D    mov         ebp,esp
 006A6C8F    push        ebx
 006A6C90    push        esi
 006A6C91    push        edi
 006A6C92    xor         eax,eax
 006A6C94    push        ebp
 006A6C95    push        6A6D9A
 006A6C9A    push        dword ptr fs:[eax]
 006A6C9D    mov         dword ptr fs:[eax],esp
 006A6CA0    inc         dword ptr ds:[81ED60]
>006A6CA6    jne         006A6D8C
 006A6CAC    xor         edx,edx
 006A6CAE    push        ebp
 006A6CAF    push        6A6CD3
 006A6CB4    push        dword ptr fs:[edx]
 006A6CB7    mov         dword ptr fs:[edx],esp
 006A6CBA    mov         eax,6A6DB4;'Finalizing PieP5'
 006A6CBF    call        004FA5FC
 006A6CC4    call        0069E0E0
 006A6CC9    xor         eax,eax
 006A6CCB    pop         edx
 006A6CCC    pop         ecx
 006A6CCD    pop         ecx
 006A6CCE    mov         dword ptr fs:[eax],edx
>006A6CD1    jmp         006A6CEE
>006A6CD3    jmp         @HandleOnException
 006A6CD8    dd          1
 006A6CDC    dd          00418C04;Exception
 006A6CE0    dd          006A6CE4
 006A6CE4    call        004FA644
 006A6CE9    call        @DoneExcept
 006A6CEE    mov         eax,81ED7C;gvar_0081ED7C:?
 006A6CF3    mov         edx,dword ptr ds:[698DBC];:4
 006A6CF9    call        @DynArrayClear
 006A6CFE    mov         eax,81ED80;gvar_0081ED80:?
 006A6D03    mov         edx,dword ptr ds:[698DE0];:5
 006A6D09    call        @DynArrayClear
 006A6D0E    mov         eax,78BE18;^'Left'
 006A6D13    mov         ecx,3
 006A6D18    mov         edx,dword ptr ds:[40128C];string
 006A6D1E    call        @FinalizeArray
 006A6D23    mov         eax,78BE24;^'Down'
 006A6D28    mov         ecx,3
 006A6D2D    mov         edx,dword ptr ds:[40128C];string
 006A6D33    call        @FinalizeArray
 006A6D38    mov         eax,78BE30;^'Back'
 006A6D3D    mov         ecx,3
 006A6D42    mov         edx,dword ptr ds:[40128C];string
 006A6D48    call        @FinalizeArray
 006A6D4D    mov         eax,78BE3C;^'L'
 006A6D52    mov         ecx,3
 006A6D57    mov         edx,dword ptr ds:[40128C];string
 006A6D5D    call        @FinalizeArray
 006A6D62    mov         eax,78BE48;^'D'
 006A6D67    mov         ecx,3
 006A6D6C    mov         edx,dword ptr ds:[40128C];string
 006A6D72    call        @FinalizeArray
 006A6D77    mov         eax,78BE54;^'B'
 006A6D7C    mov         ecx,3
 006A6D81    mov         edx,dword ptr ds:[40128C];string
 006A6D87    call        @FinalizeArray
 006A6D8C    xor         eax,eax
 006A6D8E    pop         edx
 006A6D8F    pop         ecx
 006A6D90    pop         ecx
 006A6D91    mov         dword ptr fs:[eax],edx
 006A6D94    push        6A6DA1
 006A6D99    ret
>006A6D9A    jmp         @HandleFinally
>006A6D9F    jmp         006A6D99
 006A6DA1    pop         edi
 006A6DA2    pop         esi
 006A6DA3    pop         ebx
 006A6DA4    pop         ebp
 006A6DA5    ret
*}
end.