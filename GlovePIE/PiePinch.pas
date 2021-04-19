//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PiePinch;

interface

uses
  SysUtils, Classes;

type
  TPinchValue = class(TObjectValue)
  published
    //procedure GetString(?:?);//006E3F48
    procedure FillClone(c:TExpression);//006E3EF0
    function GetUnits:TUnits;//006E3F70
    function GetPerUnits2:TUnits;//006E3F38
    function GetPerUnits1:TUnits;//006E3F28
    procedure CreateClone;//006E3EE0
    function CanSet:Boolean;//006E3EDC
    function GetDataType:TDataType;//006E3F18
    procedure SetValue(NewValue:Double);//006E4080
    procedure GetValue;//006E3F80
    //procedure ToString(?:?);//006E4098
  public
    ComPort:Integer;//f20
    Item:Integer;//f24
    //procedure ToString(?:?); virtual;//006E4098
    procedure GetValue; virtual;//v2C//006E3F80
    //procedure GetString(?:?); virtual;//v38//006E3F48
    function GetDataType:TDataType; virtual;//v44//006E3F18
    function GetUnits:TUnits; virtual;//v48//006E3F70
    function GetPerUnits1:TUnits; virtual;//v4C//006E3F28
    function GetPerUnits2:TUnits; virtual;//v50//006E3F38
    procedure SetValue(NewValue:Double); virtual;//v58//006E4080
    function CanSet:Boolean; virtual;//v68//006E3EDC
    procedure CreateClone; virtual;//v80//006E3EE0
    procedure FillClone(c:TExpression); virtual;//v84//006E3EF0
  end;
    procedure sub_006E3B1C;//006E3B1C
    //function sub_006E3CD4(?:?):?;//006E3CD4
    procedure sub_006E4240;//006E4240
    procedure sub_006E4270;//006E4270
    procedure sub_006E4274;//006E4274
    procedure sub_006E4498;//006E4498
    //function sub_006E44FC(?:?):?;//006E44FC
    //function sub_006E4728:?;//006E4728
    //function sub_006E4814(?:UnicodeString):?;//006E4814
    //procedure sub_006E4864(?:Integer; ?:?);//006E4864
    //function sub_006E487C:?;//006E487C
    //function sub_006E48F0:?;//006E48F0
    //function sub_006E590C(?:?):?;//006E590C

implementation

//006E3B1C
procedure sub_006E3B1C;
begin
{*
 006E3B1C    push        ebp
 006E3B1D    mov         ebp,esp
 006E3B1F    xor         ecx,ecx
 006E3B21    push        ecx
 006E3B22    push        ecx
 006E3B23    push        ecx
 006E3B24    push        ecx
 006E3B25    push        ebx
 006E3B26    push        esi
 006E3B27    push        edi
 006E3B28    xor         eax,eax
 006E3B2A    push        ebp
 006E3B2B    push        6E3C27
 006E3B30    push        dword ptr fs:[eax]
 006E3B33    mov         dword ptr fs:[eax],esp
 006E3B36    xor         esi,esi
 006E3B38    mov         dword ptr [ebp-4],78C33C;^'LeftThumb'
 006E3B3F    xor         ebx,ebx
 006E3B41    mov         edi,78C33C;^'LeftThumb'
 006E3B46    cmp         ebx,esi
>006E3B48    je          006E3B6F
 006E3B4A    mov         ecx,dword ptr [edi]
 006E3B4C    mov         eax,dword ptr [ebp-4]
 006E3B4F    mov         edx,dword ptr [eax]
 006E3B51    lea         eax,[ebp-8]
 006E3B54    call        @UStrCat3
 006E3B59    mov         edx,dword ptr [ebp-8]
 006E3B5C    mov         ecx,esi
 006E3B5E    add         ecx,ecx
 006E3B60    lea         ecx,[ecx+ecx*4]
 006E3B63    add         ecx,ebx
 006E3B65    mov         eax,[00822408];gvar_00822408:THashTable
 006E3B6A    call        THashTable.Add
 006E3B6F    inc         ebx
 006E3B70    add         edi,4
 006E3B73    cmp         ebx,0A
>006E3B76    jne         006E3B46
 006E3B78    inc         esi
 006E3B79    add         dword ptr [ebp-4],4
 006E3B7D    cmp         esi,0A
>006E3B80    jne         006E3B3F
 006E3B82    mov         ecx,64
 006E3B87    mov         edx,6E3C44;'exists'
 006E3B8C    mov         eax,[00822408];gvar_00822408:THashTable
 006E3B91    call        THashTable.Add
 006E3B96    mov         ecx,65
 006E3B9B    mov         edx,6E3C60;'any'
 006E3BA0    mov         eax,[00822408];gvar_00822408:THashTable
 006E3BA5    call        THashTable.Add
 006E3BAA    mov         ecx,67
 006E3BAF    mov         edx,6E3C74;'ContactCount'
 006E3BB4    mov         eax,[00822408];gvar_00822408:THashTable
 006E3BB9    call        THashTable.Add
 006E3BBE    mov         ecx,66
 006E3BC3    mov         edx,6E3C9C;'SpiderOnMirror'
 006E3BC8    mov         eax,[00822408];gvar_00822408:THashTable
 006E3BCD    call        THashTable.Add
 006E3BD2    xor         esi,esi
 006E3BD4    mov         ebx,78C300
 006E3BD9    lea         edx,[ebp-10]
 006E3BDC    mov         eax,dword ptr [ebx]
 006E3BDE    call        IntToStr
 006E3BE3    mov         ecx,dword ptr [ebp-10]
 006E3BE6    lea         eax,[ebp-0C]
 006E3BE9    mov         edx,6E3CC8;'baud'
 006E3BEE    call        @UStrCat3
 006E3BF3    mov         edx,dword ptr [ebp-0C]
 006E3BF6    lea         ecx,[esi+6E]
 006E3BF9    mov         eax,[00822408];gvar_00822408:THashTable
 006E3BFE    call        THashTable.Add
 006E3C03    inc         esi
 006E3C04    add         ebx,4
 006E3C07    cmp         esi,0E
>006E3C0A    jne         006E3BD9
 006E3C0C    xor         eax,eax
 006E3C0E    pop         edx
 006E3C0F    pop         ecx
 006E3C10    pop         ecx
 006E3C11    mov         dword ptr fs:[eax],edx
 006E3C14    push        6E3C2E
 006E3C19    lea         eax,[ebp-10]
 006E3C1C    mov         edx,3
 006E3C21    call        @UStrArrayClr
 006E3C26    ret
>006E3C27    jmp         @HandleFinally
>006E3C2C    jmp         006E3C19
 006E3C2E    pop         edi
 006E3C2F    pop         esi
 006E3C30    pop         ebx
 006E3C31    mov         esp,ebp
 006E3C33    pop         ebp
 006E3C34    ret
*}
end;

//006E3CD4
{*function sub_006E3CD4(?:?):?;
begin
 006E3CD4    push        ebp
 006E3CD5    mov         ebp,esp
 006E3CD7    add         esp,0FFFFFFF4
 006E3CDA    push        ebx
 006E3CDB    push        esi
 006E3CDC    push        edi
 006E3CDD    xor         edx,edx
 006E3CDF    mov         dword ptr [ebp-8],edx
 006E3CE2    mov         dword ptr [ebp-4],eax
 006E3CE5    mov         eax,dword ptr [ebp-4]
 006E3CE8    call        @UStrAddRef
 006E3CED    xor         eax,eax
 006E3CEF    push        ebp
 006E3CF0    push        6E3E26
 006E3CF5    push        dword ptr fs:[eax]
 006E3CF8    mov         dword ptr fs:[eax],esp
 006E3CFB    xor         ebx,ebx
 006E3CFD    lea         eax,[ebp-8]
 006E3D00    mov         edx,dword ptr [ebp-4]
 006E3D03    call        @UStrLAsg
 006E3D08    lea         eax,[ebp-8]
 006E3D0B    mov         edx,6E3E44;'Pinch'
 006E3D10    call        004F9BD0
 006E3D15    test        al,al
>006E3D17    jne         006E3D50
 006E3D19    lea         eax,[ebp-8]
 006E3D1C    mov         edx,6E3E5C;'PinchGloves'
 006E3D21    call        004F9BD0
 006E3D26    test        al,al
>006E3D28    jne         006E3D50
 006E3D2A    lea         eax,[ebp-8]
 006E3D2D    mov         edx,6E3E80;'PinchGlove'
 006E3D32    call        004F9BD0
 006E3D37    test        al,al
>006E3D39    jne         006E3D50
 006E3D3B    lea         eax,[ebp-8]
 006E3D3E    mov         edx,6E3EA4;'FakeSpace'
 006E3D43    call        004F9BD0
 006E3D48    test        al,al
>006E3D4A    je          006E3E0B
 006E3D50    lea         eax,[ebp-8]
 006E3D53    call        004F9D00
 006E3D58    mov         esi,eax
 006E3D5A    cmp         esi,1
>006E3D5D    jg          006E3E0B
 006E3D63    lea         eax,[ebp-8]
 006E3D66    mov         edx,6E3EC4;'.'
 006E3D6B    call        004F9BD0
 006E3D70    test        al,al
>006E3D72    je          006E3E0B
 006E3D78    lea         eax,[ebp-8]
 006E3D7B    mov         edx,6E3ED4;'com'
 006E3D80    call        004F9BD0
 006E3D85    test        al,al
>006E3D87    je          006E3DB3
 006E3D89    lea         eax,[ebp-8]
 006E3D8C    call        004F9D00
 006E3D91    mov         dword ptr [ebp-0C],eax
 006E3D94    cmp         dword ptr [ebp-0C],0
>006E3D98    jl          006E3E0B
 006E3D9A    cmp         dword ptr [ebp-0C],8
>006E3D9E    jg          006E3E0B
 006E3DA0    lea         eax,[ebp-8]
 006E3DA3    mov         edx,6E3EC4;'.'
 006E3DA8    call        004F9BD0
 006E3DAD    test        al,al
>006E3DAF    je          006E3E0B
>006E3DB1    jmp         006E3DB8
 006E3DB3    xor         eax,eax
 006E3DB5    mov         dword ptr [ebp-0C],eax
 006E3DB8    mov         eax,dword ptr [ebp-8]
 006E3DBB    call        006E4814
 006E3DC0    mov         edi,eax
 006E3DC2    test        edi,edi
>006E3DC4    jl          006E3E0B
 006E3DC6    cmp         edi,6E
>006E3DC9    jl          006E3DD7
 006E3DCB    mov         eax,dword ptr [edi*4+78C148];^'ICL'
 006E3DD2    mov         [0078C338],eax;gvar_0078C338
 006E3DD7    mov         dl,1
 006E3DD9    mov         eax,[006E3618];TPinchValue
 006E3DDE    call        TObject.Create;TPinchValue.Create
 006E3DE3    mov         ebx,eax
 006E3DE5    mov         dword ptr [ebx+24],edi;TPinchValue.Item:Integer
 006E3DE8    test        esi,esi
>006E3DEA    jg          006E3DF1
 006E3DEC    mov         esi,1
 006E3DF1    mov         dword ptr [ebx+18],esi;TPinchValue.........................................................
 006E3DF4    mov         eax,dword ptr [ebp-0C]
 006E3DF7    mov         dword ptr [ebx+20],eax;TPinchValue.ComPort:Integer
 006E3DFA    mov         eax,dword ptr [ebp-0C]
 006E3DFD    mov         byte ptr [eax+822414],1;gvar_00822414
 006E3E04    mov         byte ptr ds:[82240C],1;gvar_0082240C
 006E3E0B    xor         eax,eax
 006E3E0D    pop         edx
 006E3E0E    pop         ecx
 006E3E0F    pop         ecx
 006E3E10    mov         dword ptr fs:[eax],edx
 006E3E13    push        6E3E2D
 006E3E18    lea         eax,[ebp-8]
 006E3E1B    mov         edx,2
 006E3E20    call        @UStrArrayClr
 006E3E25    ret
>006E3E26    jmp         @HandleFinally
>006E3E2B    jmp         006E3E18
 006E3E2D    mov         eax,ebx
 006E3E2F    pop         edi
 006E3E30    pop         esi
 006E3E31    pop         ebx
 006E3E32    mov         esp,ebp
 006E3E34    pop         ebp
 006E3E35    ret
end;*}

//006E3EDC
function TPinchValue.CanSet:Boolean;
begin
{*
 006E3EDC    xor         eax,eax
 006E3EDE    ret
*}
end;

//006E3EE0
procedure TPinchValue.CreateClone;
begin
{*
 006E3EE0    mov         dl,1
 006E3EE2    mov         eax,[006E3618];TPinchValue
 006E3EE7    call        TObject.Create;TPinchValue.Create
 006E3EEC    ret
*}
end;

//006E3EF0
procedure TPinchValue.FillClone(c:TExpression);
begin
{*
 006E3EF0    push        ebx
 006E3EF1    push        esi
 006E3EF2    mov         esi,edx
 006E3EF4    mov         ebx,eax
 006E3EF6    mov         edx,esi
 006E3EF8    mov         eax,ebx
 006E3EFA    call        TExpression.FillClone
 006E3EFF    mov         eax,esi
 006E3F01    mov         edx,dword ptr [ebx+24];TPinchValue.Item:Integer
 006E3F04    mov         dword ptr [eax+24],edx
 006E3F07    mov         edx,dword ptr [ebx+18];TPinchValue.........................................................
 006E3F0A    mov         dword ptr [eax+18],edx
 006E3F0D    mov         edx,dword ptr [ebx+20];TPinchValue.ComPort:Integer
 006E3F10    mov         dword ptr [eax+20],edx
 006E3F13    pop         esi
 006E3F14    pop         ebx
 006E3F15    ret
*}
end;

//006E3F18
function TPinchValue.GetDataType:TDataType;
begin
{*
 006E3F18    mov         eax,dword ptr [eax+24];TPinchValue.Item:Integer
 006E3F1B    sub         eax,67
>006E3F1E    jne         006E3F23
 006E3F20    mov         al,2
 006E3F22    ret
 006E3F23    mov         al,3
 006E3F25    ret
*}
end;

//006E3F28
function TPinchValue.GetPerUnits1:TUnits;
begin
{*
 006E3F28    mov         eax,dword ptr [eax+24];TPinchValue.Item:Integer
 006E3F2B    sub         eax,64
>006E3F2E    jne         006E3F33
 006E3F30    xor         eax,eax
 006E3F32    ret
 006E3F33    xor         eax,eax
 006E3F35    ret
*}
end;

//006E3F38
function TPinchValue.GetPerUnits2:TUnits;
begin
{*
 006E3F38    mov         eax,dword ptr [eax+24];TPinchValue.Item:Integer
 006E3F3B    sub         eax,64
>006E3F3E    jne         006E3F43
 006E3F40    xor         eax,eax
 006E3F42    ret
 006E3F43    xor         eax,eax
 006E3F45    ret
*}
end;

//006E3F48
{*procedure TPinchValue.GetString(?:?);
begin
 006E3F48    push        ebx
 006E3F49    push        esi
 006E3F4A    mov         esi,edx
 006E3F4C    mov         ebx,eax
 006E3F4E    mov         eax,dword ptr [ebx+24];TPinchValue.Item:Integer
 006E3F51    sub         eax,64
>006E3F54    jne         006E3F62
 006E3F56    mov         edx,esi
 006E3F58    mov         eax,ebx
 006E3F5A    call        TExpression.GetString
 006E3F5F    pop         esi
 006E3F60    pop         ebx
 006E3F61    ret
 006E3F62    mov         edx,esi
 006E3F64    mov         eax,ebx
 006E3F66    call        TExpression.GetString
 006E3F6B    pop         esi
 006E3F6C    pop         ebx
 006E3F6D    ret
end;*}

//006E3F70
function TPinchValue.GetUnits:TUnits;
begin
{*
 006E3F70    mov         eax,dword ptr [eax+24];TPinchValue.Item:Integer
 006E3F73    sub         eax,64
>006E3F76    jne         006E3F7B
 006E3F78    xor         eax,eax
 006E3F7A    ret
 006E3F7B    xor         eax,eax
 006E3F7D    ret
*}
end;

//006E3F80
procedure TPinchValue.GetValue;
begin
{*
 006E3F80    push        ebx
 006E3F81    push        esi
 006E3F82    add         esp,0FFFFFFF8
 006E3F85    mov         ecx,eax
 006E3F87    mov         eax,dword ptr [ecx+20];TPinchValue.ComPort:Integer
 006E3F8A    cmp         dword ptr [eax*4+822420],0FFFFFFFF;gvar_00822420
>006E3F92    jne         006E3FA2
 006E3F94    xor         eax,eax
 006E3F96    mov         dword ptr [esp],eax
 006E3F99    mov         dword ptr [esp+4],eax
>006E3F9D    jmp         006E4077
 006E3FA2    mov         ebx,dword ptr [ecx+24];TPinchValue.Item:Integer
 006E3FA5    mov         eax,ebx
 006E3FA7    cmp         eax,65
>006E3FAA    jg          006E3FBA
>006E3FAC    je          006E4006
 006E3FAE    sub         eax,64
>006E3FB1    jb          006E3FD7
>006E3FB3    je          006E3FC7
>006E3FB5    jmp         006E406E
 006E3FBA    sub         eax,66
>006E3FBD    je          006E4027
 006E3FBF    dec         eax
>006E3FC0    je          006E401B
>006E3FC2    jmp         006E406E
 006E3FC7    mov         al,1
 006E3FC9    call        00686074
 006E3FCE    fstp        qword ptr [esp]
 006E3FD1    wait
>006E3FD2    jmp         006E4077
 006E3FD7    mov         eax,ebx
 006E3FD9    mov         esi,0A
 006E3FDE    cdq
 006E3FDF    idiv        eax,esi
 006E3FE1    mov         esi,edx
 006E3FE3    mov         eax,ebx
 006E3FE5    mov         ecx,0A
 006E3FEA    cdq
 006E3FEB    idiv        eax,ecx
 006E3FED    lea         eax,[eax+eax*4]
 006E3FF0    lea         eax,[eax*2+822640];gvar_00822640
 006E3FF7    movzx       eax,byte ptr [eax+esi]
 006E3FFB    call        00686074
 006E4000    fstp        qword ptr [esp]
 006E4003    wait
>006E4004    jmp         006E4077
 006E4006    cmp         dword ptr ds:[8226A4],0;gvar_008226A4:Single
 006E400D    setg        al
 006E4010    call        00686074
 006E4015    fstp        qword ptr [esp]
 006E4018    wait
>006E4019    jmp         006E4077
 006E401B    fild        dword ptr ds:[8226A4];gvar_008226A4:Single
 006E4021    fstp        qword ptr [esp]
 006E4024    wait
>006E4025    jmp         006E4077
 006E4027    cmp         dword ptr ds:[8226A4],5;gvar_008226A4:Single
>006E402E    jne         006E405D
 006E4030    cmp         byte ptr ds:[822645],0;gvar_00822645
>006E4037    je          006E405D
 006E4039    cmp         byte ptr ds:[822650],0;gvar_00822650
>006E4040    je          006E405D
 006E4042    cmp         byte ptr ds:[82265B],0;gvar_0082265B
>006E4049    je          006E405D
 006E404B    cmp         byte ptr ds:[822666],0;gvar_00822666
>006E4052    je          006E405D
 006E4054    cmp         byte ptr ds:[822671],0;gvar_00822671
>006E405B    jne         006E4061
 006E405D    xor         eax,eax
>006E405F    jmp         006E4063
 006E4061    mov         al,1
 006E4063    call        00686074
 006E4068    fstp        qword ptr [esp]
 006E406B    wait
>006E406C    jmp         006E4077
 006E406E    xor         eax,eax
 006E4070    mov         dword ptr [esp],eax
 006E4073    mov         dword ptr [esp+4],eax
 006E4077    fld         qword ptr [esp]
 006E407A    pop         ecx
 006E407B    pop         edx
 006E407C    pop         esi
 006E407D    pop         ebx
 006E407E    ret
*}
end;

//006E4080
procedure TPinchValue.SetValue(NewValue:Double);
begin
{*
 006E4080    push        ebp
 006E4081    mov         ebp,esp
 006E4083    mov         eax,dword ptr [eax+24];TPinchValue.Item:Integer
 006E4086    sub         eax,64
>006E4089    jne         006E408F
 006E408B    xor         eax,eax
>006E408D    jmp         006E4091
 006E408F    xor         eax,eax
 006E4091    pop         ebp
 006E4092    ret         8
*}
end;

//006E4098
{*procedure TPinchValue.ToString(?:?);
begin
 006E4098    push        ebp
 006E4099    mov         ebp,esp
 006E409B    xor         ecx,ecx
 006E409D    push        ecx
 006E409E    push        ecx
 006E409F    push        ecx
 006E40A0    push        ecx
 006E40A1    push        ecx
 006E40A2    push        ecx
 006E40A3    push        ecx
 006E40A4    push        ecx
 006E40A5    push        ebx
 006E40A6    push        esi
 006E40A7    push        edi
 006E40A8    mov         esi,edx
 006E40AA    mov         ebx,eax
 006E40AC    xor         eax,eax
 006E40AE    push        ebp
 006E40AF    push        6E41B6
 006E40B4    push        dword ptr fs:[eax]
 006E40B7    mov         dword ptr fs:[eax],esp
 006E40BA    mov         edi,dword ptr [ebx+18];TPinchValue.........................................................
 006E40BD    test        edi,edi
>006E40BF    jle         006E4147
 006E40C5    cmp         dword ptr [ebx+20],0;TPinchValue.ComPort:Integer
>006E40C9    jle         006E4114
 006E40CB    push        6E41D0;'Pinch'
 006E40D0    lea         edx,[ebp-4]
 006E40D3    mov         eax,edi
 006E40D5    call        IntToStr
 006E40DA    push        dword ptr [ebp-4]
 006E40DD    push        6E41E8;'.Com'
 006E40E2    lea         edx,[ebp-8]
 006E40E5    mov         eax,dword ptr [ebx+20];TPinchValue.ComPort:Integer
 006E40E8    call        IntToStr
 006E40ED    push        dword ptr [ebp-8]
 006E40F0    push        6E4200;'.'
 006E40F5    lea         edx,[ebp-0C]
 006E40F8    mov         eax,dword ptr [ebx+24];TPinchValue.Item:Integer
 006E40FB    call        006E4864
 006E4100    push        dword ptr [ebp-0C]
 006E4103    mov         eax,esi
 006E4105    mov         edx,6
 006E410A    call        @UStrCatN
>006E410F    jmp         006E419B
 006E4114    push        6E41D0;'Pinch'
 006E4119    lea         edx,[ebp-10]
 006E411C    mov         eax,edi
 006E411E    call        IntToStr
 006E4123    push        dword ptr [ebp-10]
 006E4126    push        6E4200;'.'
 006E412B    lea         edx,[ebp-14]
 006E412E    mov         eax,dword ptr [ebx+24];TPinchValue.Item:Integer
 006E4131    call        006E4864
 006E4136    push        dword ptr [ebp-14]
 006E4139    mov         eax,esi
 006E413B    mov         edx,4
 006E4140    call        @UStrCatN
>006E4145    jmp         006E419B
 006E4147    mov         edi,dword ptr [ebx+20];TPinchValue.ComPort:Integer
 006E414A    test        edi,edi
>006E414C    jle         006E4181
 006E414E    push        6E4210;'Pinch.Com'
 006E4153    lea         edx,[ebp-18]
 006E4156    mov         eax,edi
 006E4158    call        IntToStr
 006E415D    push        dword ptr [ebp-18]
 006E4160    push        6E4200;'.'
 006E4165    lea         edx,[ebp-1C]
 006E4168    mov         eax,dword ptr [ebx+24];TPinchValue.Item:Integer
 006E416B    call        006E4864
 006E4170    push        dword ptr [ebp-1C]
 006E4173    mov         eax,esi
 006E4175    mov         edx,4
 006E417A    call        @UStrCatN
>006E417F    jmp         006E419B
 006E4181    lea         edx,[ebp-20]
 006E4184    mov         eax,dword ptr [ebx+24];TPinchValue.Item:Integer
 006E4187    call        006E4864
 006E418C    mov         ecx,dword ptr [ebp-20]
 006E418F    mov         eax,esi
 006E4191    mov         edx,6E4230;'Pinch.'
 006E4196    call        @UStrCat3
 006E419B    xor         eax,eax
 006E419D    pop         edx
 006E419E    pop         ecx
 006E419F    pop         ecx
 006E41A0    mov         dword ptr fs:[eax],edx
 006E41A3    push        6E41BD
 006E41A8    lea         eax,[ebp-20]
 006E41AB    mov         edx,8
 006E41B0    call        @UStrArrayClr
 006E41B5    ret
>006E41B6    jmp         @HandleFinally
>006E41BB    jmp         006E41A8
 006E41BD    pop         edi
 006E41BE    pop         esi
 006E41BF    pop         ebx
 006E41C0    mov         esp,ebp
 006E41C2    pop         ebp
 006E41C3    ret
end;*}

//006E4240
procedure sub_006E4240;
begin
{*
 006E4240    mov         byte ptr ds:[82240C],0;gvar_0082240C
 006E4247    mov         ecx,9
 006E424C    mov         eax,822414;gvar_00822414
 006E4251    mov         edx,822420;gvar_00822420
 006E4256    mov         byte ptr [eax],0
 006E4259    mov         dword ptr [edx],0FFFFFFFF
 006E425F    add         edx,4
 006E4262    inc         eax
 006E4263    dec         ecx
>006E4264    jne         006E4256
 006E4266    xor         eax,eax
 006E4268    mov         [00822618],eax;gvar_00822618
 006E426D    ret
*}
end;

//006E4270
procedure sub_006E4270;
begin
{*
 006E4270    ret
*}
end;

//006E4274
procedure sub_006E4274;
begin
{*
 006E4274    push        ebp
 006E4275    mov         ebp,esp
 006E4277    add         esp,0FFFFFFC0
 006E427A    push        ebx
 006E427B    push        esi
 006E427C    push        edi
 006E427D    xor         eax,eax
 006E427F    mov         dword ptr [ebp-40],eax
 006E4282    mov         dword ptr [ebp-4],eax
 006E4285    xor         eax,eax
 006E4287    push        ebp
 006E4288    push        6E4465
 006E428D    push        dword ptr fs:[eax]
 006E4290    mov         dword ptr fs:[eax],esp
 006E4293    mov         byte ptr ds:[82240D],0;gvar_0082240D
 006E429A    cmp         byte ptr ds:[82240C],0;gvar_0082240C
>006E42A1    je          006E4447
 006E42A7    mov         dword ptr [ebp-8],1
 006E42AE    mov         dword ptr [ebp-0C],822415
 006E42B5    mov         ebx,822424;gvar_00822424:Integer
 006E42BA    mov         esi,822460;gvar_00822460
 006E42BF    mov         edi,822554;gvar_00822554
 006E42C4    mov         eax,dword ptr [ebp-0C]
 006E42C7    cmp         byte ptr [eax],0
>006E42CA    jne         006E42E6
 006E42CC    cmp         byte ptr ds:[822414],0;gvar_00822414
>006E42D3    je          006E442E
 006E42D9    cmp         dword ptr ds:[822420],0FFFFFFFF;gvar_00822420
>006E42E0    jne         006E442E
 006E42E6    push        6E4480;'COM'
 006E42EB    lea         edx,[ebp-40]
 006E42EE    mov         eax,dword ptr [ebp-8]
 006E42F1    call        IntToStr
 006E42F6    push        dword ptr [ebp-40]
 006E42F9    push        6E4494;':'
 006E42FE    lea         eax,[ebp-4]
 006E4301    mov         edx,3
 006E4306    call        @UStrCatN
 006E430B    push        0
 006E430D    push        0
 006E430F    push        3
 006E4311    push        0
 006E4313    push        0
 006E4315    push        0C0000000
 006E431A    mov         eax,dword ptr [ebp-4]
 006E431D    call        @UStrToPWChar
 006E4322    push        eax
 006E4323    call        kernel32.CreateFileW
 006E4328    mov         dword ptr [ebx],eax
 006E432A    cmp         dword ptr [ebx],0FFFFFFFF
>006E432D    je          006E442E
 006E4333    mov         dword ptr [esi],1C
 006E4339    push        esi
 006E433A    mov         eax,dword ptr [ebx]
 006E433C    push        eax
 006E433D    call        kernel32.GetCommState
 006E4342    test        eax,eax
>006E4344    jne         006E4359
 006E4346    mov         eax,dword ptr [ebx]
 006E4348    push        eax
 006E4349    call        kernel32.CloseHandle
 006E434E    mov         dword ptr [ebx],0FFFFFFFF
>006E4354    jmp         006E442E
 006E4359    push        edi
 006E435A    mov         eax,dword ptr [ebx]
 006E435C    push        eax
 006E435D    call        kernel32.GetCommTimeouts
 006E4362    test        eax,eax
>006E4364    jne         006E4379
 006E4366    mov         eax,dword ptr [ebx]
 006E4368    push        eax
 006E4369    call        kernel32.CloseHandle
 006E436E    mov         dword ptr [ebx],0FFFFFFFF
>006E4374    jmp         006E442E
 006E4379    push        esi
 006E437A    push        edi
 006E437B    mov         esi,edi
 006E437D    lea         edi,[ebp-3C]
 006E4380    movs        dword ptr [edi],dword ptr [esi]
 006E4381    movs        dword ptr [edi],dword ptr [esi]
 006E4382    movs        dword ptr [edi],dword ptr [esi]
 006E4383    movs        dword ptr [edi],dword ptr [esi]
 006E4384    movs        dword ptr [edi],dword ptr [esi]
 006E4385    pop         edi
 006E4386    pop         esi
 006E4387    push        esi
 006E4388    push        edi
 006E4389    lea         edi,[ebp-28]
 006E438C    mov         ecx,7
 006E4391    rep movs    dword ptr [edi],dword ptr [esi]
 006E4393    pop         edi
 006E4394    pop         esi
 006E4395    mov         eax,[0078C338];0x2580 gvar_0078C338
 006E439A    mov         dword ptr [ebp-24],eax
 006E439D    mov         byte ptr [ebp-16],8
 006E43A1    mov         byte ptr [ebp-15],0
 006E43A5    mov         byte ptr [ebp-14],0
 006E43A9    mov         eax,dword ptr [ebp-20]
 006E43AC    or          eax,1
 006E43AF    or          eax,2
 006E43B2    mov         dword ptr [ebp-20],eax
 006E43B5    lea         eax,[ebp-28]
 006E43B8    push        eax
 006E43B9    mov         eax,dword ptr [ebx]
 006E43BB    push        eax
 006E43BC    call        kernel32.SetCommState
 006E43C1    test        eax,eax
>006E43C3    jne         006E43D5
 006E43C5    mov         eax,dword ptr [ebx]
 006E43C7    push        eax
 006E43C8    call        kernel32.CloseHandle
 006E43CD    mov         dword ptr [ebx],0FFFFFFFF
>006E43D3    jmp         006E442E
 006E43D5    mov         dword ptr [ebp-3C],0FFFFFFFF
 006E43DC    xor         eax,eax
 006E43DE    mov         dword ptr [ebp-38],eax
 006E43E1    xor         eax,eax
 006E43E3    mov         dword ptr [ebp-34],eax
 006E43E6    lea         eax,[ebp-3C]
 006E43E9    push        eax
 006E43EA    mov         eax,dword ptr [ebx]
 006E43EC    push        eax
 006E43ED    call        kernel32.SetCommTimeouts
 006E43F2    test        eax,eax
>006E43F4    jne         006E440F
 006E43F6    push        esi
 006E43F7    mov         eax,dword ptr [ebx]
 006E43F9    push        eax
 006E43FA    call        kernel32.SetCommState
 006E43FF    mov         eax,dword ptr [ebx]
 006E4401    push        eax
 006E4402    call        kernel32.CloseHandle
 006E4407    mov         dword ptr [ebx],0FFFFFFFF
>006E440D    jmp         006E442E
 006E440F    mov         byte ptr ds:[82240D],1;gvar_0082240D
 006E4416    cmp         dword ptr ds:[822420],0FFFFFFFF;gvar_00822420
>006E441D    jne         006E442E
 006E441F    mov         eax,dword ptr [ebx]
 006E4421    mov         [00822420],eax;gvar_00822420
 006E4426    mov         eax,dword ptr [ebp-8]
 006E4429    mov         [00822618],eax;gvar_00822618
 006E442E    inc         dword ptr [ebp-8]
 006E4431    add         edi,14
 006E4434    add         esi,1C
 006E4437    add         ebx,4
 006E443A    inc         dword ptr [ebp-0C]
 006E443D    cmp         dword ptr [ebp-8],9
>006E4441    jne         006E42C4
 006E4447    xor         eax,eax
 006E4449    pop         edx
 006E444A    pop         ecx
 006E444B    pop         ecx
 006E444C    mov         dword ptr fs:[eax],edx
 006E444F    push        6E446C
 006E4454    lea         eax,[ebp-40]
 006E4457    call        @UStrClr
 006E445C    lea         eax,[ebp-4]
 006E445F    call        @UStrClr
 006E4464    ret
>006E4465    jmp         @HandleFinally
>006E446A    jmp         006E4454
 006E446C    pop         edi
 006E446D    pop         esi
 006E446E    pop         ebx
 006E446F    mov         esp,ebp
 006E4471    pop         ebp
 006E4472    ret
*}
end;

//006E4498
procedure sub_006E4498;
begin
{*
 006E4498    push        ebx
 006E4499    push        esi
 006E449A    push        edi
 006E449B    push        ebp
 006E449C    movzx       eax,byte ptr ds:[82240C];gvar_0082240C
 006E44A3    and         al,byte ptr ds:[82240D];gvar_0082240D
>006E44A9    je          006E44F7
 006E44AB    mov         ebp,8
 006E44B0    mov         ebx,822424;gvar_00822424:Integer
 006E44B5    mov         esi,822460;gvar_00822460
 006E44BA    mov         edi,822554;gvar_00822554
 006E44BF    mov         eax,dword ptr [ebx]
 006E44C1    cmp         eax,0FFFFFFFF
>006E44C4    je          006E44E4
 006E44C6    push        esi
 006E44C7    push        eax
 006E44C8    call        kernel32.SetCommState
 006E44CD    push        edi
 006E44CE    mov         eax,dword ptr [ebx]
 006E44D0    push        eax
 006E44D1    call        kernel32.SetCommTimeouts
 006E44D6    mov         eax,dword ptr [ebx]
 006E44D8    push        eax
 006E44D9    call        kernel32.CloseHandle
 006E44DE    mov         dword ptr [ebx],0FFFFFFFF
 006E44E4    add         edi,14
 006E44E7    add         esi,1C
 006E44EA    add         ebx,4
 006E44ED    dec         ebp
>006E44EE    jne         006E44BF
 006E44F0    mov         byte ptr ds:[82240D],0;gvar_0082240D
 006E44F7    pop         ebp
 006E44F8    pop         edi
 006E44F9    pop         esi
 006E44FA    pop         ebx
 006E44FB    ret
*}
end;

//006E44FC
{*function sub_006E44FC(?:?):?;
begin
 006E44FC    push        ebp
 006E44FD    mov         ebp,esp
 006E44FF    add         esp,0FFFFFFE0
 006E4502    push        ebx
 006E4503    push        esi
 006E4504    push        edi
 006E4505    xor         edx,edx
 006E4507    mov         dword ptr [ebp-4],edx
 006E450A    mov         ebx,eax
 006E450C    mov         esi,8225F4;gvar_008225F4:AnsiString
 006E4511    xor         eax,eax
 006E4513    push        ebp
 006E4514    push        6E4703
 006E4519    push        dword ptr fs:[eax]
 006E451C    mov         dword ptr fs:[eax],esp
>006E451F    jmp         006E4533
 006E4521    lea         eax,[esi+ebx*4]
 006E4524    mov         ecx,1
 006E4529    mov         edx,1
 006E452E    call        @LStrDelete
 006E4533    mov         eax,dword ptr [esi+ebx*4]
 006E4536    call        @LStrLen
 006E453B    test        eax,eax
>006E453D    jle         006E454B
 006E453F    mov         eax,dword ptr [esi+ebx*4]
 006E4542    movzx       eax,byte ptr [eax]
 006E4545    add         al,80
 006E4547    sub         al,3
>006E4549    jae         006E4521
 006E454B    mov         edx,dword ptr [esi+ebx*4]
 006E454E    mov         eax,6E4724;''
 006E4553    call        Pos
 006E4558    mov         edi,eax
 006E455A    test        edi,edi
>006E455C    jne         006E4567
 006E455E    mov         byte ptr [ebp-5],0
>006E4562    jmp         006E46ED
 006E4567    mov         byte ptr [ebp-5],1
 006E456B    lea         eax,[ebp-4]
 006E456E    push        eax
 006E456F    mov         ecx,edi
 006E4571    sub         ecx,2
 006E4574    mov         eax,dword ptr [esi+ebx*4]
 006E4577    mov         edx,2
 006E457C    call        @LStrCopy
 006E4581    mov         eax,dword ptr [esi+ebx*4]
 006E4584    movzx       eax,byte ptr [eax]
 006E4587    mov         byte ptr [ebp-6],al
 006E458A    lea         eax,[esi+ebx*4]
 006E458D    mov         ecx,edi
 006E458F    mov         edx,1
 006E4594    call        @LStrDelete
 006E4599    movzx       eax,byte ptr [ebp-6]
 006E459D    add         al,80
 006E459F    sub         al,2
>006E45A1    jb          006E45C7
>006E45A3    jne         006E46ED
 006E45A9    cmp         dword ptr [ebp-4],0
>006E45AD    je          006E46ED
 006E45B3    lea         eax,[ebx*4+82261C];gvar_0082261C:array[9] of ?
 006E45BA    mov         edx,dword ptr [ebp-4]
 006E45BD    call        @LStrAsg
>006E45C2    jmp         006E46ED
 006E45C7    cmp         byte ptr [ebp-6],81
>006E45CB    jne         006E45EF
 006E45CD    mov         ebx,dword ptr [ebp-4]
 006E45D0    test        ebx,ebx
>006E45D2    je          006E45D9
 006E45D4    sub         ebx,4
 006E45D7    mov         ebx,dword ptr [ebx]
 006E45D9    lea         eax,[ebp-4]
 006E45DC    push        eax
 006E45DD    mov         ecx,ebx
 006E45DF    sub         ecx,2
 006E45E2    mov         edx,1
 006E45E7    mov         eax,dword ptr [ebp-4]
 006E45EA    call        @LStrCopy
 006E45EF    mov         esi,0A
 006E45F4    mov         eax,822640;gvar_00822640
 006E45F9    mov         ecx,0A
 006E45FE    mov         edx,eax
 006E4600    mov         byte ptr [edx],0
 006E4603    inc         edx
 006E4604    dec         ecx
>006E4605    jne         006E4600
 006E4607    add         eax,0A
 006E460A    dec         esi
>006E460B    jne         006E45F9
 006E460D    mov         eax,dword ptr [ebp-4]
 006E4610    test        eax,eax
>006E4612    je          006E4619
 006E4614    sub         eax,4
 006E4617    mov         eax,dword ptr [eax]
 006E4619    sar         eax,1
>006E461B    jns         006E4620
 006E461D    adc         eax,0
 006E4620    mov         [008226A4],eax;gvar_008226A4:Single
 006E4625    mov         eax,[008226A4];gvar_008226A4:Single
 006E462A    test        eax,eax
>006E462C    jle         006E46ED
 006E4632    mov         dword ptr [ebp-1C],eax
 006E4635    mov         dword ptr [ebp-0C],1
 006E463C    mov         edx,dword ptr [ebp-0C]
 006E463F    add         edx,edx
 006E4641    mov         eax,dword ptr [ebp-4]
 006E4644    movzx       eax,byte ptr [eax+edx-2]
 006E4649    mov         ecx,dword ptr [ebp-4]
 006E464C    movzx       edx,byte ptr [ecx+edx-1]
 006E4651    test        al,10
 006E4654    seta        cl
 006E4657    mov         byte ptr [ebp-16],cl
 006E465A    test        al,8
 006E465D    seta        cl
 006E4660    mov         byte ptr [ebp-15],cl
 006E4663    test        al,4
 006E4666    seta        cl
 006E4669    mov         byte ptr [ebp-14],cl
 006E466C    test        al,2
 006E466F    seta        cl
 006E4672    mov         byte ptr [ebp-13],cl
 006E4675    test        al,1
 006E4678    seta        al
 006E467B    mov         byte ptr [ebp-12],al
 006E467E    test        dl,10
 006E4681    seta        al
 006E4684    mov         byte ptr [ebp-11],al
 006E4687    test        dl,8
 006E468A    seta        al
 006E468D    mov         byte ptr [ebp-10],al
 006E4690    test        dl,4
 006E4693    seta        al
 006E4696    mov         byte ptr [ebp-0F],al
 006E4699    test        dl,2
 006E469C    seta        al
 006E469F    mov         byte ptr [ebp-0E],al
 006E46A2    test        dl,1
 006E46A5    seta        al
 006E46A8    mov         byte ptr [ebp-0D],al
 006E46AB    mov         esi,0A
 006E46B0    lea         edx,[ebp-16]
 006E46B3    mov         dword ptr [ebp-20],822640;gvar_00822640
 006E46BA    mov         ecx,0A
 006E46BF    lea         eax,[ebp-16]
 006E46C2    mov         ebx,dword ptr [ebp-20]
 006E46C5    mov         edi,ebx
 006E46C7    cmp         byte ptr [edx],0
>006E46CA    je          006E46D4
 006E46CC    cmp         byte ptr [eax],0
>006E46CF    je          006E46D4
 006E46D1    mov         byte ptr [edi],1
 006E46D4    inc         edi
 006E46D5    inc         eax
 006E46D6    dec         ecx
>006E46D7    jne         006E46C7
 006E46D9    add         dword ptr [ebp-20],0A
 006E46DD    inc         edx
 006E46DE    dec         esi
>006E46DF    jne         006E46BA
 006E46E1    inc         dword ptr [ebp-0C]
 006E46E4    dec         dword ptr [ebp-1C]
>006E46E7    jne         006E463C
 006E46ED    xor         eax,eax
 006E46EF    pop         edx
 006E46F0    pop         ecx
 006E46F1    pop         ecx
 006E46F2    mov         dword ptr fs:[eax],edx
 006E46F5    push        6E470A
 006E46FA    lea         eax,[ebp-4]
 006E46FD    call        @LStrClr
 006E4702    ret
>006E4703    jmp         @HandleFinally
>006E4708    jmp         006E46FA
 006E470A    movzx       eax,byte ptr [ebp-5]
 006E470E    pop         edi
 006E470F    pop         esi
 006E4710    pop         ebx
 006E4711    mov         esp,ebp
 006E4713    pop         ebp
 006E4714    ret
end;*}

//006E4728
{*function sub_006E4728:?;
begin
 006E4728    push        ebp
 006E4729    mov         ebp,esp
 006E472B    add         esp,0FFFFFFEC
 006E472E    push        ebx
 006E472F    push        esi
 006E4730    push        edi
 006E4731    xor         eax,eax
 006E4733    mov         dword ptr [ebp-14],eax
 006E4736    mov         dword ptr [ebp-4],eax
 006E4739    xor         eax,eax
 006E473B    push        ebp
 006E473C    push        6E4804
 006E4741    push        dword ptr fs:[eax]
 006E4744    mov         dword ptr fs:[eax],esp
 006E4747    movzx       eax,byte ptr ds:[82240C];gvar_0082240C
 006E474E    and         al,byte ptr ds:[82240D];gvar_0082240D
>006E4754    je          006E47E4
 006E475A    xor         edi,edi
 006E475C    mov         dword ptr [ebp-10],822414;gvar_00822414
 006E4763    mov         ebx,822420;gvar_00822420
 006E4768    mov         esi,8225F4;gvar_008225F4:AnsiString
 006E476D    mov         eax,dword ptr [ebp-10]
 006E4770    cmp         byte ptr [eax],0
>006E4773    je          006E47D5
 006E4775    cmp         dword ptr [ebx],0FFFFFFFF
>006E4778    je          006E47D5
 006E477A    lea         eax,[ebp-4]
 006E477D    call        @LStrClr
 006E4782    push        0
 006E4784    lea         eax,[ebp-0C]
 006E4787    push        eax
 006E4788    push        1
 006E478A    lea         eax,[ebp-5]
 006E478D    push        eax
 006E478E    mov         eax,dword ptr [ebx]
 006E4790    push        eax
 006E4791    call        kernel32.ReadFile
 006E4796    test        eax,eax
>006E4798    jne         006E479E
 006E479A    xor         ebx,ebx
>006E479C    jmp         006E47E6
 006E479E    lea         eax,[ebp-14]
 006E47A1    movzx       edx,byte ptr [ebp-5]
 006E47A5    mov         ecx,0
 006E47AA    call        @LStrFromChar
 006E47AF    mov         edx,dword ptr [ebp-14]
 006E47B2    lea         eax,[ebp-4]
 006E47B5    call        @LStrCat
 006E47BA    cmp         dword ptr [ebp-0C],0
>006E47BE    jne         006E4782
 006E47C0    mov         eax,esi
 006E47C2    mov         edx,dword ptr [ebp-4]
 006E47C5    call        @LStrCat
 006E47CA    mov         eax,edi
 006E47CC    call        006E44FC
 006E47D1    test        al,al
>006E47D3    jne         006E47CA
 006E47D5    inc         edi
 006E47D6    add         esi,4
 006E47D9    add         ebx,4
 006E47DC    inc         dword ptr [ebp-10]
 006E47DF    cmp         edi,9
>006E47E2    jne         006E476D
 006E47E4    mov         bl,1
 006E47E6    xor         eax,eax
 006E47E8    pop         edx
 006E47E9    pop         ecx
 006E47EA    pop         ecx
 006E47EB    mov         dword ptr fs:[eax],edx
 006E47EE    push        6E480B
 006E47F3    lea         eax,[ebp-14]
 006E47F6    call        @LStrClr
 006E47FB    lea         eax,[ebp-4]
 006E47FE    call        @LStrClr
 006E4803    ret
>006E4804    jmp         @HandleFinally
>006E4809    jmp         006E47F3
 006E480B    mov         eax,ebx
 006E480D    pop         edi
 006E480E    pop         esi
 006E480F    pop         ebx
 006E4810    mov         esp,ebp
 006E4812    pop         ebp
 006E4813    ret
end;*}

//006E4814
{*function sub_006E4814(?:UnicodeString):?;
begin
 006E4814    push        ebp
 006E4815    mov         ebp,esp
 006E4817    push        ecx
 006E4818    push        ebx
 006E4819    mov         dword ptr [ebp-4],eax
 006E481C    mov         eax,dword ptr [ebp-4]
 006E481F    call        @UStrAddRef
 006E4824    xor         eax,eax
 006E4826    push        ebp
 006E4827    push        6E4857
 006E482C    push        dword ptr fs:[eax]
 006E482F    mov         dword ptr fs:[eax],esp
 006E4832    mov         edx,dword ptr [ebp-4]
 006E4835    mov         eax,[00822408];gvar_00822408:THashTable
 006E483A    call        THashTable.Get
 006E483F    mov         ebx,eax
 006E4841    xor         eax,eax
 006E4843    pop         edx
 006E4844    pop         ecx
 006E4845    pop         ecx
 006E4846    mov         dword ptr fs:[eax],edx
 006E4849    push        6E485E
 006E484E    lea         eax,[ebp-4]
 006E4851    call        @UStrClr
 006E4856    ret
>006E4857    jmp         @HandleFinally
>006E485C    jmp         006E484E
 006E485E    mov         eax,ebx
 006E4860    pop         ebx
 006E4861    pop         ecx
 006E4862    pop         ebp
 006E4863    ret
end;*}

//006E4864
{*procedure sub_006E4864(?:Integer; ?:?);
begin
 006E4864    push        ebx
 006E4865    push        esi
 006E4866    mov         esi,edx
 006E4868    mov         ebx,eax
 006E486A    mov         ecx,esi
 006E486C    mov         edx,ebx
 006E486E    mov         eax,[00822408];gvar_00822408:THashTable
 006E4873    call        THashTable.Get
 006E4878    pop         esi
 006E4879    pop         ebx
 006E487A    ret
end;*}

//006E487C
{*function sub_006E487C:?;
begin
 006E487C    push        ebp
 006E487D    mov         ebp,esp
 006E487F    push        0
 006E4881    push        ebx
 006E4882    push        esi
 006E4883    xor         eax,eax
 006E4885    push        ebp
 006E4886    push        6E48E0
 006E488B    push        dword ptr fs:[eax]
 006E488E    mov         dword ptr fs:[eax],esp
 006E4891    mov         dl,1
 006E4893    mov         eax,[0043C7BC];TStringList
 006E4898    call        TStringList.Create;TStringList.Create
 006E489D    mov         esi,eax
 006E489F    mov         dl,1
 006E48A1    mov         eax,esi
 006E48A3    call        TStringList.SetSorted
 006E48A8    xor         ebx,ebx
 006E48AA    lea         edx,[ebp-4]
 006E48AD    mov         eax,ebx
 006E48AF    call        006E4864
 006E48B4    cmp         dword ptr [ebp-4],0
>006E48B8    je          006E48C4
 006E48BA    mov         edx,dword ptr [ebp-4]
 006E48BD    mov         eax,esi
 006E48BF    mov         ecx,dword ptr [eax]
 006E48C1    call        dword ptr [ecx+38];TStringList.Add
 006E48C4    inc         ebx
 006E48C5    cmp         ebx,7C
>006E48C8    jne         006E48AA
 006E48CA    xor         eax,eax
 006E48CC    pop         edx
 006E48CD    pop         ecx
 006E48CE    pop         ecx
 006E48CF    mov         dword ptr fs:[eax],edx
 006E48D2    push        6E48E7
 006E48D7    lea         eax,[ebp-4]
 006E48DA    call        @UStrClr
 006E48DF    ret
>006E48E0    jmp         @HandleFinally
>006E48E5    jmp         006E48D7
 006E48E7    mov         eax,esi
 006E48E9    pop         esi
 006E48EA    pop         ebx
 006E48EB    pop         ecx
 006E48EC    pop         ebp
 006E48ED    ret
end;*}

//006E48F0
{*function sub_006E48F0:?;
begin
 006E48F0    push        ebx
 006E48F1    mov         dl,1
 006E48F3    mov         eax,[0043C7BC];TStringList
 006E48F8    call        TStringList.Create;TStringList.Create
 006E48FD    mov         ebx,eax
 006E48FF    mov         edx,6E4CD8;'Any'
 006E4904    mov         eax,ebx
 006E4906    mov         ecx,dword ptr [eax]
 006E4908    call        dword ptr [ecx+38];TStringList.Add
 006E490B    mov         edx,6E4CEC;'SpiderOnMirror'
 006E4910    mov         eax,ebx
 006E4912    mov         ecx,dword ptr [eax]
 006E4914    call        dword ptr [ecx+38];TStringList.Add
 006E4917    xor         edx,edx
 006E4919    mov         eax,ebx
 006E491B    mov         ecx,dword ptr [eax]
 006E491D    call        dword ptr [ecx+38];TStringList.Add
 006E4920    mov         edx,6E4D18;'LeftIndexLeftThumb'
 006E4925    mov         eax,ebx
 006E4927    mov         ecx,dword ptr [eax]
 006E4929    call        dword ptr [ecx+38];TStringList.Add
 006E492C    mov         edx,6E4D4C;'LeftMiddleLeftThumb'
 006E4931    mov         eax,ebx
 006E4933    mov         ecx,dword ptr [eax]
 006E4935    call        dword ptr [ecx+38];TStringList.Add
 006E4938    mov         edx,6E4D80;'LeftRingLeftThumb'
 006E493D    mov         eax,ebx
 006E493F    mov         ecx,dword ptr [eax]
 006E4941    call        dword ptr [ecx+38];TStringList.Add
 006E4944    mov         edx,6E4DB0;'LeftPinkyLeftThumb'
 006E4949    mov         eax,ebx
 006E494B    mov         ecx,dword ptr [eax]
 006E494D    call        dword ptr [ecx+38];TStringList.Add
 006E4950    xor         edx,edx
 006E4952    mov         eax,ebx
 006E4954    mov         ecx,dword ptr [eax]
 006E4956    call        dword ptr [ecx+38];TStringList.Add
 006E4959    mov         edx,6E4DE4;'RightIndexRightThumb'
 006E495E    mov         eax,ebx
 006E4960    mov         ecx,dword ptr [eax]
 006E4962    call        dword ptr [ecx+38];TStringList.Add
 006E4965    mov         edx,6E4E1C;'RightMiddleRightThumb'
 006E496A    mov         eax,ebx
 006E496C    mov         ecx,dword ptr [eax]
 006E496E    call        dword ptr [ecx+38];TStringList.Add
 006E4971    mov         edx,6E4E54;'RightRingRightThumb'
 006E4976    mov         eax,ebx
 006E4978    mov         ecx,dword ptr [eax]
 006E497A    call        dword ptr [ecx+38];TStringList.Add
 006E497D    mov         edx,6E4E88;'RightPinkyRightThumb'
 006E4982    mov         eax,ebx
 006E4984    mov         ecx,dword ptr [eax]
 006E4986    call        dword ptr [ecx+38];TStringList.Add
 006E4989    xor         edx,edx
 006E498B    mov         eax,ebx
 006E498D    mov         ecx,dword ptr [eax]
 006E498F    call        dword ptr [ecx+38];TStringList.Add
 006E4992    mov         edx,6E4EC0;'RightIndexLeftThumb'
 006E4997    mov         eax,ebx
 006E4999    mov         ecx,dword ptr [eax]
 006E499B    call        dword ptr [ecx+38];TStringList.Add
 006E499E    mov         edx,6E4EF4;'RightIndexLeftIndex'
 006E49A3    mov         eax,ebx
 006E49A5    mov         ecx,dword ptr [eax]
 006E49A7    call        dword ptr [ecx+38];TStringList.Add
 006E49AA    mov         edx,6E4F28;'RightIndexLeftMiddle'
 006E49AF    mov         eax,ebx
 006E49B1    mov         ecx,dword ptr [eax]
 006E49B3    call        dword ptr [ecx+38];TStringList.Add
 006E49B6    mov         edx,6E4F60;'RightIndexLeftRing'
 006E49BB    mov         eax,ebx
 006E49BD    mov         ecx,dword ptr [eax]
 006E49BF    call        dword ptr [ecx+38];TStringList.Add
 006E49C2    mov         edx,6E4F94;'RightIndexLeftPinky'
 006E49C7    mov         eax,ebx
 006E49C9    mov         ecx,dword ptr [eax]
 006E49CB    call        dword ptr [ecx+38];TStringList.Add
 006E49CE    xor         edx,edx
 006E49D0    mov         eax,ebx
 006E49D2    mov         ecx,dword ptr [eax]
 006E49D4    call        dword ptr [ecx+38];TStringList.Add
 006E49D7    mov         edx,6E4FC8;'LeftIndexRightThumb'
 006E49DC    mov         eax,ebx
 006E49DE    mov         ecx,dword ptr [eax]
 006E49E0    call        dword ptr [ecx+38];TStringList.Add
 006E49E3    mov         edx,6E4FFC;'LeftIndexRightIndex'
 006E49E8    mov         eax,ebx
 006E49EA    mov         ecx,dword ptr [eax]
 006E49EC    call        dword ptr [ecx+38];TStringList.Add
 006E49EF    mov         edx,6E5030;'LeftIndexRightMiddle'
 006E49F4    mov         eax,ebx
 006E49F6    mov         ecx,dword ptr [eax]
 006E49F8    call        dword ptr [ecx+38];TStringList.Add
 006E49FB    mov         edx,6E5068;'LeftIndexRightRing'
 006E4A00    mov         eax,ebx
 006E4A02    mov         ecx,dword ptr [eax]
 006E4A04    call        dword ptr [ecx+38];TStringList.Add
 006E4A07    mov         edx,6E509C;'LeftIndexRightPinky'
 006E4A0C    mov         eax,ebx
 006E4A0E    mov         ecx,dword ptr [eax]
 006E4A10    call        dword ptr [ecx+38];TStringList.Add
 006E4A13    xor         edx,edx
 006E4A15    mov         eax,ebx
 006E4A17    mov         ecx,dword ptr [eax]
 006E4A19    call        dword ptr [ecx+38];TStringList.Add
 006E4A1C    mov         edx,6E50D0;'RightThumbLeftThumb'
 006E4A21    mov         eax,ebx
 006E4A23    mov         ecx,dword ptr [eax]
 006E4A25    call        dword ptr [ecx+38];TStringList.Add
 006E4A28    mov         edx,6E5104;'RightThumbLeftIndex'
 006E4A2D    mov         eax,ebx
 006E4A2F    mov         ecx,dword ptr [eax]
 006E4A31    call        dword ptr [ecx+38];TStringList.Add
 006E4A34    mov         edx,6E5138;'RightThumbLeftMiddle'
 006E4A39    mov         eax,ebx
 006E4A3B    mov         ecx,dword ptr [eax]
 006E4A3D    call        dword ptr [ecx+38];TStringList.Add
 006E4A40    mov         edx,6E5170;'RightThumbLeftRing'
 006E4A45    mov         eax,ebx
 006E4A47    mov         ecx,dword ptr [eax]
 006E4A49    call        dword ptr [ecx+38];TStringList.Add
 006E4A4C    mov         edx,6E51A4;'RightThumbLeftPinky'
 006E4A51    mov         eax,ebx
 006E4A53    mov         ecx,dword ptr [eax]
 006E4A55    call        dword ptr [ecx+38];TStringList.Add
 006E4A58    xor         edx,edx
 006E4A5A    mov         eax,ebx
 006E4A5C    mov         ecx,dword ptr [eax]
 006E4A5E    call        dword ptr [ecx+38];TStringList.Add
 006E4A61    mov         edx,6E51D8;'LeftThumbRightThumb'
 006E4A66    mov         eax,ebx
 006E4A68    mov         ecx,dword ptr [eax]
 006E4A6A    call        dword ptr [ecx+38];TStringList.Add
 006E4A6D    mov         edx,6E520C;'LeftThumbRightIndex'
 006E4A72    mov         eax,ebx
 006E4A74    mov         ecx,dword ptr [eax]
 006E4A76    call        dword ptr [ecx+38];TStringList.Add
 006E4A79    mov         edx,6E5240;'LeftThumbRightMiddle'
 006E4A7E    mov         eax,ebx
 006E4A80    mov         ecx,dword ptr [eax]
 006E4A82    call        dword ptr [ecx+38];TStringList.Add
 006E4A85    mov         edx,6E5278;'LeftThumbRightRing'
 006E4A8A    mov         eax,ebx
 006E4A8C    mov         ecx,dword ptr [eax]
 006E4A8E    call        dword ptr [ecx+38];TStringList.Add
 006E4A91    mov         edx,6E52AC;'LeftThumbRightPinky'
 006E4A96    mov         eax,ebx
 006E4A98    mov         ecx,dword ptr [eax]
 006E4A9A    call        dword ptr [ecx+38];TStringList.Add
 006E4A9D    xor         edx,edx
 006E4A9F    mov         eax,ebx
 006E4AA1    mov         ecx,dword ptr [eax]
 006E4AA3    call        dword ptr [ecx+38];TStringList.Add
 006E4AA6    mov         edx,6E50D0;'RightThumbLeftThumb'
 006E4AAB    mov         eax,ebx
 006E4AAD    mov         ecx,dword ptr [eax]
 006E4AAF    call        dword ptr [ecx+38];TStringList.Add
 006E4AB2    mov         edx,6E5104;'RightThumbLeftIndex'
 006E4AB7    mov         eax,ebx
 006E4AB9    mov         ecx,dword ptr [eax]
 006E4ABB    call        dword ptr [ecx+38];TStringList.Add
 006E4ABE    mov         edx,6E5138;'RightThumbLeftMiddle'
 006E4AC3    mov         eax,ebx
 006E4AC5    mov         ecx,dword ptr [eax]
 006E4AC7    call        dword ptr [ecx+38];TStringList.Add
 006E4ACA    mov         edx,6E5170;'RightThumbLeftRing'
 006E4ACF    mov         eax,ebx
 006E4AD1    mov         ecx,dword ptr [eax]
 006E4AD3    call        dword ptr [ecx+38];TStringList.Add
 006E4AD6    mov         edx,6E51A4;'RightThumbLeftPinky'
 006E4ADB    mov         eax,ebx
 006E4ADD    mov         ecx,dword ptr [eax]
 006E4ADF    call        dword ptr [ecx+38];TStringList.Add
 006E4AE2    xor         edx,edx
 006E4AE4    mov         eax,ebx
 006E4AE6    mov         ecx,dword ptr [eax]
 006E4AE8    call        dword ptr [ecx+38];TStringList.Add
 006E4AEB    mov         edx,6E51D8;'LeftThumbRightThumb'
 006E4AF0    mov         eax,ebx
 006E4AF2    mov         ecx,dword ptr [eax]
 006E4AF4    call        dword ptr [ecx+38];TStringList.Add
 006E4AF7    mov         edx,6E520C;'LeftThumbRightIndex'
 006E4AFC    mov         eax,ebx
 006E4AFE    mov         ecx,dword ptr [eax]
 006E4B00    call        dword ptr [ecx+38];TStringList.Add
 006E4B03    mov         edx,6E5240;'LeftThumbRightMiddle'
 006E4B08    mov         eax,ebx
 006E4B0A    mov         ecx,dword ptr [eax]
 006E4B0C    call        dword ptr [ecx+38];TStringList.Add
 006E4B0F    mov         edx,6E5278;'LeftThumbRightRing'
 006E4B14    mov         eax,ebx
 006E4B16    mov         ecx,dword ptr [eax]
 006E4B18    call        dword ptr [ecx+38];TStringList.Add
 006E4B1B    mov         edx,6E52AC;'LeftThumbRightPinky'
 006E4B20    mov         eax,ebx
 006E4B22    mov         ecx,dword ptr [eax]
 006E4B24    call        dword ptr [ecx+38];TStringList.Add
 006E4B27    xor         edx,edx
 006E4B29    mov         eax,ebx
 006E4B2B    mov         ecx,dword ptr [eax]
 006E4B2D    call        dword ptr [ecx+38];TStringList.Add
 006E4B30    mov         edx,6E52E0;'RightMiddleLeftThumb'
 006E4B35    mov         eax,ebx
 006E4B37    mov         ecx,dword ptr [eax]
 006E4B39    call        dword ptr [ecx+38];TStringList.Add
 006E4B3C    mov         edx,6E5318;'RightMiddleLeftIndex'
 006E4B41    mov         eax,ebx
 006E4B43    mov         ecx,dword ptr [eax]
 006E4B45    call        dword ptr [ecx+38];TStringList.Add
 006E4B48    mov         edx,6E5350;'RightMiddleLeftMiddle'
 006E4B4D    mov         eax,ebx
 006E4B4F    mov         ecx,dword ptr [eax]
 006E4B51    call        dword ptr [ecx+38];TStringList.Add
 006E4B54    mov         edx,6E5388;'RightMiddleLeftRing'
 006E4B59    mov         eax,ebx
 006E4B5B    mov         ecx,dword ptr [eax]
 006E4B5D    call        dword ptr [ecx+38];TStringList.Add
 006E4B60    mov         edx,6E53BC;'RightMiddleLeftPinky'
 006E4B65    mov         eax,ebx
 006E4B67    mov         ecx,dword ptr [eax]
 006E4B69    call        dword ptr [ecx+38];TStringList.Add
 006E4B6C    xor         edx,edx
 006E4B6E    mov         eax,ebx
 006E4B70    mov         ecx,dword ptr [eax]
 006E4B72    call        dword ptr [ecx+38];TStringList.Add
 006E4B75    mov         edx,6E53F4;'LeftMiddleRightThumb'
 006E4B7A    mov         eax,ebx
 006E4B7C    mov         ecx,dword ptr [eax]
 006E4B7E    call        dword ptr [ecx+38];TStringList.Add
 006E4B81    mov         edx,6E542C;'LeftMiddleRightIndex'
 006E4B86    mov         eax,ebx
 006E4B88    mov         ecx,dword ptr [eax]
 006E4B8A    call        dword ptr [ecx+38];TStringList.Add
 006E4B8D    mov         edx,6E5464;'LeftMiddleRightMiddle'
 006E4B92    mov         eax,ebx
 006E4B94    mov         ecx,dword ptr [eax]
 006E4B96    call        dword ptr [ecx+38];TStringList.Add
 006E4B99    mov         edx,6E549C;'LeftMiddleRightRing'
 006E4B9E    mov         eax,ebx
 006E4BA0    mov         ecx,dword ptr [eax]
 006E4BA2    call        dword ptr [ecx+38];TStringList.Add
 006E4BA5    mov         edx,6E54D0;'LeftMiddleRightPinky'
 006E4BAA    mov         eax,ebx
 006E4BAC    mov         ecx,dword ptr [eax]
 006E4BAE    call        dword ptr [ecx+38];TStringList.Add
 006E4BB1    xor         edx,edx
 006E4BB3    mov         eax,ebx
 006E4BB5    mov         ecx,dword ptr [eax]
 006E4BB7    call        dword ptr [ecx+38];TStringList.Add
 006E4BBA    mov         edx,6E5508;'RightRingLeftThumb'
 006E4BBF    mov         eax,ebx
 006E4BC1    mov         ecx,dword ptr [eax]
 006E4BC3    call        dword ptr [ecx+38];TStringList.Add
 006E4BC6    mov         edx,6E553C;'RightRingLeftIndex'
 006E4BCB    mov         eax,ebx
 006E4BCD    mov         ecx,dword ptr [eax]
 006E4BCF    call        dword ptr [ecx+38];TStringList.Add
 006E4BD2    mov         edx,6E5570;'RightRingLeftMiddle'
 006E4BD7    mov         eax,ebx
 006E4BD9    mov         ecx,dword ptr [eax]
 006E4BDB    call        dword ptr [ecx+38];TStringList.Add
 006E4BDE    mov         edx,6E55A4;'RightRingLeftRing'
 006E4BE3    mov         eax,ebx
 006E4BE5    mov         ecx,dword ptr [eax]
 006E4BE7    call        dword ptr [ecx+38];TStringList.Add
 006E4BEA    mov         edx,6E55D4;'RightRingLeftPinky'
 006E4BEF    mov         eax,ebx
 006E4BF1    mov         ecx,dword ptr [eax]
 006E4BF3    call        dword ptr [ecx+38];TStringList.Add
 006E4BF6    xor         edx,edx
 006E4BF8    mov         eax,ebx
 006E4BFA    mov         ecx,dword ptr [eax]
 006E4BFC    call        dword ptr [ecx+38];TStringList.Add
 006E4BFF    mov         edx,6E5608;'LeftRingRightThumb'
 006E4C04    mov         eax,ebx
 006E4C06    mov         ecx,dword ptr [eax]
 006E4C08    call        dword ptr [ecx+38];TStringList.Add
 006E4C0B    mov         edx,6E563C;'LeftRingRightIndex'
 006E4C10    mov         eax,ebx
 006E4C12    mov         ecx,dword ptr [eax]
 006E4C14    call        dword ptr [ecx+38];TStringList.Add
 006E4C17    mov         edx,6E5670;'LeftRingRightMiddle'
 006E4C1C    mov         eax,ebx
 006E4C1E    mov         ecx,dword ptr [eax]
 006E4C20    call        dword ptr [ecx+38];TStringList.Add
 006E4C23    mov         edx,6E56A4;'LeftRingRightRing'
 006E4C28    mov         eax,ebx
 006E4C2A    mov         ecx,dword ptr [eax]
 006E4C2C    call        dword ptr [ecx+38];TStringList.Add
 006E4C2F    mov         edx,6E56D4;'LeftRingRightPinky'
 006E4C34    mov         eax,ebx
 006E4C36    mov         ecx,dword ptr [eax]
 006E4C38    call        dword ptr [ecx+38];TStringList.Add
 006E4C3B    xor         edx,edx
 006E4C3D    mov         eax,ebx
 006E4C3F    mov         ecx,dword ptr [eax]
 006E4C41    call        dword ptr [ecx+38];TStringList.Add
 006E4C44    mov         edx,6E5708;'RightPinkyLeftThumb'
 006E4C49    mov         eax,ebx
 006E4C4B    mov         ecx,dword ptr [eax]
 006E4C4D    call        dword ptr [ecx+38];TStringList.Add
 006E4C50    mov         edx,6E573C;'RightPinkyLeftIndex'
 006E4C55    mov         eax,ebx
 006E4C57    mov         ecx,dword ptr [eax]
 006E4C59    call        dword ptr [ecx+38];TStringList.Add
 006E4C5C    mov         edx,6E5770;'RightPinkyLeftMiddle'
 006E4C61    mov         eax,ebx
 006E4C63    mov         ecx,dword ptr [eax]
 006E4C65    call        dword ptr [ecx+38];TStringList.Add
 006E4C68    mov         edx,6E57A8;'RightPinkyLeftRing'
 006E4C6D    mov         eax,ebx
 006E4C6F    mov         ecx,dword ptr [eax]
 006E4C71    call        dword ptr [ecx+38];TStringList.Add
 006E4C74    mov         edx,6E57DC;'RightPinkyLeftPinky'
 006E4C79    mov         eax,ebx
 006E4C7B    mov         ecx,dword ptr [eax]
 006E4C7D    call        dword ptr [ecx+38];TStringList.Add
 006E4C80    xor         edx,edx
 006E4C82    mov         eax,ebx
 006E4C84    mov         ecx,dword ptr [eax]
 006E4C86    call        dword ptr [ecx+38];TStringList.Add
 006E4C89    mov         edx,6E5810;'LeftPinkyRightThumb'
 006E4C8E    mov         eax,ebx
 006E4C90    mov         ecx,dword ptr [eax]
 006E4C92    call        dword ptr [ecx+38];TStringList.Add
 006E4C95    mov         edx,6E5844;'LeftPinkyRightIndex'
 006E4C9A    mov         eax,ebx
 006E4C9C    mov         ecx,dword ptr [eax]
 006E4C9E    call        dword ptr [ecx+38];TStringList.Add
 006E4CA1    mov         edx,6E5878;'LeftPinkyRightMiddle'
 006E4CA6    mov         eax,ebx
 006E4CA8    mov         ecx,dword ptr [eax]
 006E4CAA    call        dword ptr [ecx+38];TStringList.Add
 006E4CAD    mov         edx,6E58B0;'LeftPinkyRightRing'
 006E4CB2    mov         eax,ebx
 006E4CB4    mov         ecx,dword ptr [eax]
 006E4CB6    call        dword ptr [ecx+38];TStringList.Add
 006E4CB9    mov         edx,6E58E4;'LeftPinkyRightPinky'
 006E4CBE    mov         eax,ebx
 006E4CC0    mov         ecx,dword ptr [eax]
 006E4CC2    call        dword ptr [ecx+38];TStringList.Add
 006E4CC5    mov         eax,ebx
 006E4CC7    pop         ebx
 006E4CC8    ret
end;*}

//006E590C
{*function sub_006E590C(?:?):?;
begin
 006E590C    push        ebp
 006E590D    mov         ebp,esp
 006E590F    push        ecx
 006E5910    push        ebx
 006E5911    mov         dword ptr [ebp-4],eax
 006E5914    mov         eax,dword ptr [ebp-4]
 006E5917    call        @UStrAddRef
 006E591C    xor         eax,eax
 006E591E    push        ebp
 006E591F    push        6E59A7
 006E5924    push        dword ptr fs:[eax]
 006E5927    mov         dword ptr fs:[eax],esp
 006E592A    lea         eax,[ebp-4]
 006E592D    mov         edx,6E59C0;'Pinch'
 006E5932    call        004F9BD0
 006E5937    test        al,al
>006E5939    jne         006E5972
 006E593B    lea         eax,[ebp-4]
 006E593E    mov         edx,6E59D8;'PinchGloves'
 006E5943    call        004F9BD0
 006E5948    test        al,al
>006E594A    jne         006E5972
 006E594C    lea         eax,[ebp-4]
 006E594F    mov         edx,6E59FC;'PinchGlove'
 006E5954    call        004F9BD0
 006E5959    test        al,al
>006E595B    jne         006E5972
 006E595D    lea         eax,[ebp-4]
 006E5960    mov         edx,6E5A20;'FakeSpace'
 006E5965    call        004F9BD0
 006E596A    test        al,al
>006E596C    jne         006E5972
 006E596E    xor         ebx,ebx
>006E5970    jmp         006E5991
 006E5972    lea         eax,[ebp-4]
 006E5975    call        004F9D00
 006E597A    lea         eax,[ebp-4]
 006E597D    mov         edx,6E5A40;'.'
 006E5982    call        004F9BD0
 006E5987    test        al,al
>006E5989    jne         006E598F
 006E598B    xor         ebx,ebx
>006E598D    jmp         006E5991
 006E598F    mov         bl,1
 006E5991    xor         eax,eax
 006E5993    pop         edx
 006E5994    pop         ecx
 006E5995    pop         ecx
 006E5996    mov         dword ptr fs:[eax],edx
 006E5999    push        6E59AE
 006E599E    lea         eax,[ebp-4]
 006E59A1    call        @UStrClr
 006E59A6    ret
>006E59A7    jmp         @HandleFinally
>006E59AC    jmp         006E599E
 006E59AE    mov         eax,ebx
 006E59B0    pop         ebx
 006E59B1    pop         ecx
 006E59B2    pop         ebp
 006E59B3    ret
end;*}

Initialization
//00782B54
{*
 00782B54    push        ebp
 00782B55    mov         ebp,esp
 00782B57    xor         eax,eax
 00782B59    push        ebp
 00782B5A    push        782B9C
 00782B5F    push        dword ptr fs:[eax]
 00782B62    mov         dword ptr fs:[eax],esp
 00782B65    sub         dword ptr ds:[822410],1
>00782B6C    jae         00782B8E
 00782B6E    mov         eax,782BB4;'Initializing PiePinch'
 00782B73    call        004FA5FC
 00782B78    mov         dl,1
 00782B7A    mov         eax,[0067D4A4];THashTable
 00782B7F    call        THashTable.Create;THashTable.Create
 00782B84    mov         [00822408],eax;gvar_00822408:THashTable
 00782B89    call        006E3B1C
 00782B8E    xor         eax,eax
 00782B90    pop         edx
 00782B91    pop         ecx
 00782B92    pop         ecx
 00782B93    mov         dword ptr fs:[eax],edx
 00782B96    push        782BA3
 00782B9B    ret
>00782B9C    jmp         @HandleFinally
>00782BA1    jmp         00782B9B
 00782BA3    pop         ebp
 00782BA4    ret
*}
Finalization
//006E5A44
{*
 006E5A44    push        ebp
 006E5A45    mov         ebp,esp
 006E5A47    xor         eax,eax
 006E5A49    push        ebp
 006E5A4A    push        6E5ACB
 006E5A4F    push        dword ptr fs:[eax]
 006E5A52    mov         dword ptr fs:[eax],esp
 006E5A55    inc         dword ptr ds:[822410]
>006E5A5B    jne         006E5ABD
 006E5A5D    mov         eax,6E5AE0;'Finalizing PiePinch'
 006E5A62    call        004FA5FC
 006E5A67    mov         eax,[00822408];gvar_00822408:THashTable
 006E5A6C    xor         edx,edx
 006E5A6E    mov         dword ptr ds:[822408],edx;gvar_00822408:THashTable
 006E5A74    call        TObject.Free
 006E5A79    call        006E4498
 006E5A7E    mov         eax,8225F4;gvar_008225F4:AnsiString
 006E5A83    mov         ecx,9
 006E5A88    mov         edx,dword ptr ds:[4012B0];AnsiString
 006E5A8E    call        @FinalizeArray
 006E5A93    mov         eax,82261C;gvar_0082261C:array[9] of ?
 006E5A98    mov         ecx,9
 006E5A9D    mov         edx,dword ptr ds:[4012B0];AnsiString
 006E5AA3    call        @FinalizeArray
 006E5AA8    mov         eax,78C33C;^'LeftThumb'
 006E5AAD    mov         ecx,0A
 006E5AB2    mov         edx,dword ptr ds:[40128C];string
 006E5AB8    call        @FinalizeArray
 006E5ABD    xor         eax,eax
 006E5ABF    pop         edx
 006E5AC0    pop         ecx
 006E5AC1    pop         ecx
 006E5AC2    mov         dword ptr fs:[eax],edx
 006E5AC5    push        6E5AD2
 006E5ACA    ret
>006E5ACB    jmp         @HandleFinally
>006E5AD0    jmp         006E5ACA
 006E5AD2    pop         ebp
 006E5AD3    ret
*}
end.