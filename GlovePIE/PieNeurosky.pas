//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieNeurosky;

interface

uses
  SysUtils, Classes;

type
  TNeuroskyValue = class(TObjectValue)
  published
    function GetUnits:TUnits;//00769CC4
    //procedure GetString(?:?);//00769C9C
    procedure FillClone(c:TExpression);//00769C44
    function Module:TObject;//00769E64
    function GetPerUnits2:TUnits;//00769C8C
    function GetPerUnits1:TUnits;//00769C7C
    procedure SetValue(NewValue:Double);//00769E6C
    function CanSet:Boolean;//00769C30
    function GetDataType:TDataType;//00769C6C
    procedure CreateClone;//00769C34
    procedure GetValue;//00769CD4
    //procedure ToString(?:?);//00769E94
  public
    Item:Integer;//f20
    ComPort:Integer;//f24
    //procedure ToString(?:?); virtual;//00769E94
    procedure GetValue; virtual;//v2C//00769CD4
    //procedure GetString(?:?); virtual;//v38//00769C9C
    function GetDataType:TDataType; virtual;//v44//00769C6C
    function GetUnits:TUnits; virtual;//v48//00769CC4
    function GetPerUnits1:TUnits; virtual;//v4C//00769C7C
    function GetPerUnits2:TUnits; virtual;//v50//00769C8C
    procedure SetValue(NewValue:Double); virtual;//v58//00769E6C
    function CanSet:Boolean; virtual;//v68//00769C30
    procedure CreateClone; virtual;//v80//00769C34
    procedure FillClone(c:TExpression); virtual;//v84//00769C44
    function Module:TObject; virtual;//v98//00769E64
  end;
  TModuleNeurosky = class(TPieModule)
  published
    procedure Read;//0076A760
    procedure ClearRead;//0076A5FC
    function CreateValue(Identifier:string):TExpression;//0076A68C
    function GetDefaultFormat(field:string):TGuiFormat;//0076A6E0
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//0076A744
    procedure GetGoodFields;//0076A73C
    procedure StartCompiletime;//0076A768
    procedure StopRuntime;//0076A794
    procedure StartRuntime;//0076A774
    procedure AddFields;//0076A314
    constructor Create;//0076A604
    procedure StopCompiletime;//0076A780
  public
    function CreateValue(Identifier:string):TExpression; virtual;//v14//0076A68C
    procedure GetGoodFields; virtual;//v1C//0076A73C
    procedure AddFields; virtual;//v24//0076A314
    procedure StartCompiletime; virtual;//v28//0076A768
    procedure StopCompiletime; virtual;//v2C//0076A780
    procedure StartRuntime; virtual;//v30//0076A774
    procedure StopRuntime; virtual;//v34//0076A794
    procedure ClearRead; virtual;//v38//0076A5FC
    procedure Read; virtual;//v3C//0076A760
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//0076A744
    function GetDefaultFormat(field:string):TGuiFormat; virtual;//v44//0076A6E0
  end;
    //function sub_00769AB4(?:string):?;//00769AB4
    procedure sub_00769F88;//00769F88
    procedure sub_00769FB0;//00769FB0
    //procedure sub_00769FB4(?:?; ?:?);//00769FB4
    procedure sub_0076A05C;//0076A05C
    procedure sub_0076A1A8;//0076A1A8
    //function sub_0076A1E0:?;//0076A1E0
    //function sub_0076A228(?:UnicodeString):?;//0076A228
    //procedure sub_0076A27C(?:Integer; ?:?);//0076A27C
    //function sub_0076A298:?;//0076A298

implementation

//00769AB4
{*function sub_00769AB4(?:string):?;
begin
 00769AB4    push        ebp
 00769AB5    mov         ebp,esp
 00769AB7    add         esp,0FFFFFFF4
 00769ABA    push        ebx
 00769ABB    push        esi
 00769ABC    push        edi
 00769ABD    xor         edx,edx
 00769ABF    mov         dword ptr [ebp-8],edx
 00769AC2    mov         dword ptr [ebp-4],eax
 00769AC5    mov         eax,dword ptr [ebp-4]
 00769AC8    call        @UStrAddRef
 00769ACD    xor         eax,eax
 00769ACF    push        ebp
 00769AD0    push        769BB9
 00769AD5    push        dword ptr fs:[eax]
 00769AD8    mov         dword ptr fs:[eax],esp
 00769ADB    xor         esi,esi
 00769ADD    lea         eax,[ebp-8]
 00769AE0    mov         edx,dword ptr [ebp-4]
 00769AE3    call        @UStrLAsg
 00769AE8    lea         eax,[ebp-8]
 00769AEB    mov         edx,769BD8;'Neurosky'
 00769AF0    call        004F9BD0
 00769AF5    test        al,al
>00769AF7    jne         00769B0E
 00769AF9    lea         eax,[ebp-8]
 00769AFC    mov         edx,769BF8;'ThinkGear'
 00769B01    call        004F9BD0
 00769B06    test        al,al
>00769B08    je          00769B9E
 00769B0E    or          edi,0FFFFFFFF
 00769B11    lea         eax,[ebp-8]
 00769B14    mov         edx,769C18;'.'
 00769B19    call        004F9BD0
 00769B1E    test        al,al
>00769B20    je          00769B9E
 00769B22    or          ebx,0FFFFFFFF
 00769B25    lea         eax,[ebp-8]
 00769B28    mov         edx,769C28;'com'
 00769B2D    call        004F9BD0
 00769B32    test        al,al
>00769B34    je          00769B56
 00769B36    lea         eax,[ebp-8]
 00769B39    call        004F9D00
 00769B3E    mov         ebx,eax
 00769B40    lea         eax,[ebp-8]
 00769B43    mov         edx,769C18;'.'
 00769B48    call        004F9BD0
 00769B4D    test        al,al
>00769B4F    je          00769B9E
 00769B51    cmp         ebx,0F
>00769B54    jg          00769B9E
 00769B56    mov         eax,dword ptr [ebp-8]
 00769B59    call        0076A228
 00769B5E    mov         dword ptr [ebp-0C],eax
 00769B61    cmp         dword ptr [ebp-0C],0
>00769B65    jl          00769B9E
 00769B67    mov         dl,1
 00769B69    mov         eax,[00769310];TNeuroskyValue
 00769B6E    call        TObject.Create;TNeuroskyValue.Create
 00769B73    mov         esi,eax
 00769B75    mov         eax,dword ptr [ebp-0C]
 00769B78    mov         dword ptr [esi+20],eax;TNeuroskyValue.Item:Integer
 00769B7B    test        edi,edi
>00769B7D    jg          00769B84
 00769B7F    mov         edi,1
 00769B84    mov         dword ptr [esi+18],edi;TNeuroskyValue......................................................
 00769B87    test        ebx,ebx
>00769B89    jg          00769B8D
 00769B8B    xor         ebx,ebx
 00769B8D    mov         byte ptr [ebx+822D00],1;gvar_00822D00
 00769B94    mov         dword ptr [esi+24],ebx;TNeuroskyValue.ComPort:Integer
 00769B97    mov         byte ptr ds:[822CF4],1;gvar_00822CF4
 00769B9E    xor         eax,eax
 00769BA0    pop         edx
 00769BA1    pop         ecx
 00769BA2    pop         ecx
 00769BA3    mov         dword ptr fs:[eax],edx
 00769BA6    push        769BC0
 00769BAB    lea         eax,[ebp-8]
 00769BAE    mov         edx,2
 00769BB3    call        @UStrArrayClr
 00769BB8    ret
>00769BB9    jmp         @HandleFinally
>00769BBE    jmp         00769BAB
 00769BC0    mov         eax,esi
 00769BC2    pop         edi
 00769BC3    pop         esi
 00769BC4    pop         ebx
 00769BC5    mov         esp,ebp
 00769BC7    pop         ebp
 00769BC8    ret
end;*}

//00769C30
function TNeuroskyValue.CanSet:Boolean;
begin
{*
 00769C30    xor         eax,eax
 00769C32    ret
*}
end;

//00769C34
procedure TNeuroskyValue.CreateClone;
begin
{*
 00769C34    mov         dl,1
 00769C36    mov         eax,[00769310];TNeuroskyValue
 00769C3B    call        TObject.Create;TNeuroskyValue.Create
 00769C40    ret
*}
end;

//00769C44
procedure TNeuroskyValue.FillClone(c:TExpression);
begin
{*
 00769C44    push        ebx
 00769C45    push        esi
 00769C46    mov         esi,edx
 00769C48    mov         ebx,eax
 00769C4A    mov         edx,esi
 00769C4C    mov         eax,ebx
 00769C4E    call        TExpression.FillClone
 00769C53    mov         eax,esi
 00769C55    mov         edx,dword ptr [ebx+20];TNeuroskyValue.Item:Integer
 00769C58    mov         dword ptr [eax+20],edx
 00769C5B    mov         edx,dword ptr [ebx+18];TNeuroskyValue......................................................
 00769C5E    mov         dword ptr [eax+18],edx
 00769C61    mov         edx,dword ptr [ebx+24];TNeuroskyValue.ComPort:Integer
 00769C64    mov         dword ptr [eax+24],edx
 00769C67    pop         esi
 00769C68    pop         ebx
 00769C69    ret
*}
end;

//00769C6C
function TNeuroskyValue.GetDataType:TDataType;
begin
{*
 00769C6C    mov         eax,dword ptr [eax+20];TNeuroskyValue.Item:Integer
 00769C6F    sub         eax,1
>00769C72    jae         00769C77
 00769C74    mov         al,3
 00769C76    ret
 00769C77    xor         eax,eax
 00769C79    ret
*}
end;

//00769C7C
function TNeuroskyValue.GetPerUnits1:TUnits;
begin
{*
 00769C7C    mov         eax,dword ptr [eax+20];TNeuroskyValue.Item:Integer
 00769C7F    sub         eax,1
>00769C82    jae         00769C87
 00769C84    xor         eax,eax
 00769C86    ret
 00769C87    xor         eax,eax
 00769C89    ret
*}
end;

//00769C8C
function TNeuroskyValue.GetPerUnits2:TUnits;
begin
{*
 00769C8C    mov         eax,dword ptr [eax+20];TNeuroskyValue.Item:Integer
 00769C8F    sub         eax,1
>00769C92    jae         00769C97
 00769C94    xor         eax,eax
 00769C96    ret
 00769C97    xor         eax,eax
 00769C99    ret
*}
end;

//00769C9C
{*procedure TNeuroskyValue.GetString(?:?);
begin
 00769C9C    push        ebx
 00769C9D    push        esi
 00769C9E    mov         esi,edx
 00769CA0    mov         ebx,eax
 00769CA2    mov         eax,dword ptr [ebx+20];TNeuroskyValue.Item:Integer
 00769CA5    sub         eax,1
>00769CA8    jae         00769CB6
 00769CAA    mov         edx,esi
 00769CAC    mov         eax,ebx
 00769CAE    call        TExpression.GetString
 00769CB3    pop         esi
 00769CB4    pop         ebx
 00769CB5    ret
 00769CB6    mov         edx,esi
 00769CB8    mov         eax,ebx
 00769CBA    call        TExpression.GetString
 00769CBF    pop         esi
 00769CC0    pop         ebx
 00769CC1    ret
end;*}

//00769CC4
function TNeuroskyValue.GetUnits:TUnits;
begin
{*
 00769CC4    mov         eax,dword ptr [eax+20];TNeuroskyValue.Item:Integer
 00769CC7    sub         eax,1
>00769CCA    jae         00769CCF
 00769CCC    xor         eax,eax
 00769CCE    ret
 00769CCF    xor         eax,eax
 00769CD1    ret
*}
end;

//00769CD4
procedure TNeuroskyValue.GetValue;
begin
{*
 00769CD4    push        ebx
 00769CD5    add         esp,0FFFFFFF4
 00769CD8    mov         edx,dword ptr [eax+24];TNeuroskyValue.ComPort:Integer
 00769CDB    cmp         byte ptr [edx+822D10],0;gvar_00822D10
>00769CE2    jne         00769CF2
 00769CE4    xor         eax,eax
 00769CE6    mov         dword ptr [esp],eax
 00769CE9    mov         dword ptr [esp+4],eax
>00769CED    jmp         00769E5A
 00769CF2    mov         ebx,dword ptr [edx*4+822D20];gvar_00822D20
 00769CF9    mov         edx,dword ptr [eax+20];TNeuroskyValue.Item:Integer
 00769CFC    cmp         edx,0D
>00769CFF    ja          00769E51
 00769D05    jmp         dword ptr [edx*4+769D0C]
 00769D05    dd          00769E36
 00769D05    dd          00769D44
 00769D05    dd          00769D58
 00769D05    dd          00769D6C
 00769D05    dd          00769D80
 00769D05    dd          00769D94
 00769D05    dd          00769DA8
 00769D05    dd          00769DBC
 00769D05    dd          00769DD0
 00769D05    dd          00769DE1
 00769D05    dd          00769DF2
 00769D05    dd          00769E03
 00769D05    dd          00769E14
 00769D05    dd          00769E25
 00769D44    push        0
 00769D46    push        ebx
 00769D47    call        thinkgear.TG_GetValue
 00769D4C    add         esp,8
 00769D4F    fstp        qword ptr [esp]
 00769D52    wait
>00769D53    jmp         00769E5A
 00769D58    push        1
 00769D5A    push        ebx
 00769D5B    call        thinkgear.TG_GetValue
 00769D60    add         esp,8
 00769D63    fstp        qword ptr [esp]
 00769D66    wait
>00769D67    jmp         00769E5A
 00769D6C    push        2
 00769D6E    push        ebx
 00769D6F    call        thinkgear.TG_GetValue
 00769D74    add         esp,8
 00769D77    fstp        qword ptr [esp]
 00769D7A    wait
>00769D7B    jmp         00769E5A
 00769D80    push        3
 00769D82    push        ebx
 00769D83    call        thinkgear.TG_GetValue
 00769D88    add         esp,8
 00769D8B    fstp        qword ptr [esp]
 00769D8E    wait
>00769D8F    jmp         00769E5A
 00769D94    push        4
 00769D96    push        ebx
 00769D97    call        thinkgear.TG_GetValue
 00769D9C    add         esp,8
 00769D9F    fstp        qword ptr [esp]
 00769DA2    wait
>00769DA3    jmp         00769E5A
 00769DA8    push        5
 00769DAA    push        ebx
 00769DAB    call        thinkgear.TG_GetValue
 00769DB0    add         esp,8
 00769DB3    fstp        qword ptr [esp]
 00769DB6    wait
>00769DB7    jmp         00769E5A
 00769DBC    push        6
 00769DBE    push        ebx
 00769DBF    call        thinkgear.TG_GetValue
 00769DC4    add         esp,8
 00769DC7    fstp        qword ptr [esp]
 00769DCA    wait
>00769DCB    jmp         00769E5A
 00769DD0    push        7
 00769DD2    push        ebx
 00769DD3    call        thinkgear.TG_GetValue
 00769DD8    add         esp,8
 00769DDB    fstp        qword ptr [esp]
 00769DDE    wait
>00769DDF    jmp         00769E5A
 00769DE1    push        8
 00769DE3    push        ebx
 00769DE4    call        thinkgear.TG_GetValue
 00769DE9    add         esp,8
 00769DEC    fstp        qword ptr [esp]
 00769DEF    wait
>00769DF0    jmp         00769E5A
 00769DF2    push        9
 00769DF4    push        ebx
 00769DF5    call        thinkgear.TG_GetValue
 00769DFA    add         esp,8
 00769DFD    fstp        qword ptr [esp]
 00769E00    wait
>00769E01    jmp         00769E5A
 00769E03    push        0A
 00769E05    push        ebx
 00769E06    call        thinkgear.TG_GetValue
 00769E0B    add         esp,8
 00769E0E    fstp        qword ptr [esp]
 00769E11    wait
>00769E12    jmp         00769E5A
 00769E14    push        0B
 00769E16    push        ebx
 00769E17    call        thinkgear.TG_GetValue
 00769E1C    add         esp,8
 00769E1F    fstp        qword ptr [esp]
 00769E22    wait
>00769E23    jmp         00769E5A
 00769E25    push        0C
 00769E27    push        ebx
 00769E28    call        thinkgear.TG_GetValue
 00769E2D    add         esp,8
 00769E30    fstp        qword ptr [esp]
 00769E33    wait
>00769E34    jmp         00769E5A
 00769E36    mov         eax,dword ptr [eax+24];TNeuroskyValue.ComPort:Integer
 00769E39    movzx       eax,byte ptr [eax+822D10];gvar_00822D10
 00769E40    movsx       eax,al
 00769E43    mov         dword ptr [esp+8],eax
 00769E47    fild        dword ptr [esp+8]
 00769E4B    fstp        qword ptr [esp]
 00769E4E    wait
>00769E4F    jmp         00769E5A
 00769E51    xor         eax,eax
 00769E53    mov         dword ptr [esp],eax
 00769E56    mov         dword ptr [esp+4],eax
 00769E5A    fld         qword ptr [esp]
 00769E5D    add         esp,0C
 00769E60    pop         ebx
 00769E61    ret
*}
end;

//00769E64
function TNeuroskyValue.Module:TObject;
begin
{*
 00769E64    mov         eax,[00822CFC];gvar_00822CFC:TModuleNeurosky
 00769E69    ret
*}
end;

//00769E6C
procedure TNeuroskyValue.SetValue(NewValue:Double);
begin
{*
 00769E6C    push        ebp
 00769E6D    mov         ebp,esp
 00769E6F    mov         edx,dword ptr [eax+18];TNeuroskyValue......................................................
 00769E72    test        edx,edx
>00769E74    jl          00769E7E
 00769E76    cmp         edx,3E7
>00769E7C    jle         00769E82
 00769E7E    xor         eax,eax
>00769E80    jmp         00769E90
 00769E82    mov         eax,dword ptr [eax+20];TNeuroskyValue.Item:Integer
 00769E85    sub         eax,1
>00769E88    jae         00769E8E
 00769E8A    xor         eax,eax
>00769E8C    jmp         00769E90
 00769E8E    xor         eax,eax
 00769E90    pop         ebp
 00769E91    ret         8
*}
end;

//00769E94
{*procedure TNeuroskyValue.ToString(?:?);
begin
 00769E94    push        ebp
 00769E95    mov         ebp,esp
 00769E97    push        0
 00769E99    push        0
 00769E9B    push        0
 00769E9D    push        ebx
 00769E9E    push        esi
 00769E9F    push        edi
 00769EA0    mov         esi,edx
 00769EA2    mov         ebx,eax
 00769EA4    xor         eax,eax
 00769EA6    push        ebp
 00769EA7    push        769F21
 00769EAC    push        dword ptr fs:[eax]
 00769EAF    mov         dword ptr fs:[eax],esp
 00769EB2    mov         edi,dword ptr [ebx+24];TNeuroskyValue.ComPort:Integer
 00769EB5    test        edi,edi
>00769EB7    jle         00769EEC
 00769EB9    push        769F3C;'Neurosky.Com'
 00769EBE    lea         edx,[ebp-4]
 00769EC1    mov         eax,edi
 00769EC3    call        IntToStr
 00769EC8    push        dword ptr [ebp-4]
 00769ECB    push        769F64;'.'
 00769ED0    lea         edx,[ebp-8]
 00769ED3    mov         eax,dword ptr [ebx+20];TNeuroskyValue.Item:Integer
 00769ED6    call        0076A27C
 00769EDB    push        dword ptr [ebp-8]
 00769EDE    mov         eax,esi
 00769EE0    mov         edx,4
 00769EE5    call        @UStrCatN
>00769EEA    jmp         00769F06
 00769EEC    lea         edx,[ebp-0C]
 00769EEF    mov         eax,dword ptr [ebx+20];TNeuroskyValue.Item:Integer
 00769EF2    call        0076A27C
 00769EF7    mov         ecx,dword ptr [ebp-0C]
 00769EFA    mov         eax,esi
 00769EFC    mov         edx,769F74;'Neurosky.'
 00769F01    call        @UStrCat3
 00769F06    xor         eax,eax
 00769F08    pop         edx
 00769F09    pop         ecx
 00769F0A    pop         ecx
 00769F0B    mov         dword ptr fs:[eax],edx
 00769F0E    push        769F28
 00769F13    lea         eax,[ebp-0C]
 00769F16    mov         edx,3
 00769F1B    call        @UStrArrayClr
 00769F20    ret
>00769F21    jmp         @HandleFinally
>00769F26    jmp         00769F13
 00769F28    pop         edi
 00769F29    pop         esi
 00769F2A    pop         ebx
 00769F2B    mov         esp,ebp
 00769F2D    pop         ebp
 00769F2E    ret
end;*}

//00769F88
procedure sub_00769F88;
begin
{*
 00769F88    push        ebx
 00769F89    mov         byte ptr ds:[822CF4],0;gvar_00822CF4
 00769F90    mov         ecx,10
 00769F95    mov         eax,822D00;gvar_00822D00
 00769F9A    mov         edx,822D20;gvar_00822D20
 00769F9F    mov         byte ptr [eax],0
 00769FA2    xor         ebx,ebx
 00769FA4    mov         dword ptr [edx],ebx
 00769FA6    add         edx,4
 00769FA9    inc         eax
 00769FAA    dec         ecx
>00769FAB    jne         00769F9F
 00769FAD    pop         ebx
 00769FAE    ret
*}
end;

//00769FB0
procedure sub_00769FB0;
begin
{*
 00769FB0    ret
*}
end;

//00769FB4
{*procedure sub_00769FB4(?:?; ?:?);
begin
 00769FB4    push        ebp
 00769FB5    mov         ebp,esp
 00769FB7    push        0
 00769FB9    push        0
 00769FBB    push        ebx
 00769FBC    push        esi
 00769FBD    mov         ebx,edx
 00769FBF    mov         esi,eax
 00769FC1    xor         eax,eax
 00769FC3    push        ebp
 00769FC4    push        76A029
 00769FC9    push        dword ptr fs:[eax]
 00769FCC    mov         dword ptr fs:[eax],esp
 00769FCF    lea         edx,[ebp-8]
 00769FD2    mov         eax,esi
 00769FD4    call        IntToStr
 00769FD9    mov         edx,dword ptr [ebp-8]
 00769FDC    lea         eax,[ebp-4]
 00769FDF    mov         ecx,0
 00769FE4    call        @LStrFromUStr
 00769FE9    mov         ecx,dword ptr [ebp-4]
 00769FEC    mov         eax,ebx
 00769FEE    mov         edx,76A044;'COM'
 00769FF3    call        @LStrCat3
 00769FF8    cmp         esi,9
>00769FFB    jle         0076A00B
 00769FFD    mov         ecx,dword ptr [ebx]
 00769FFF    mov         eax,ebx
 0076A001    mov         edx,76A054;'\\.\'
 0076A006    call        @LStrCat3
 0076A00B    xor         eax,eax
 0076A00D    pop         edx
 0076A00E    pop         ecx
 0076A00F    pop         ecx
 0076A010    mov         dword ptr fs:[eax],edx
 0076A013    push        76A030
 0076A018    lea         eax,[ebp-8]
 0076A01B    call        @UStrClr
 0076A020    lea         eax,[ebp-4]
 0076A023    call        @LStrClr
 0076A028    ret
>0076A029    jmp         @HandleFinally
>0076A02E    jmp         0076A018
 0076A030    pop         esi
 0076A031    pop         ebx
 0076A032    pop         ecx
 0076A033    pop         ecx
 0076A034    pop         ebp
 0076A035    ret
end;*}

//0076A05C
procedure sub_0076A05C;
begin
{*
 0076A05C    push        ebp
 0076A05D    mov         ebp,esp
 0076A05F    add         esp,0FFFFFFF0
 0076A062    push        ebx
 0076A063    push        esi
 0076A064    push        edi
 0076A065    xor         eax,eax
 0076A067    mov         dword ptr [ebp-10],eax
 0076A06A    mov         dword ptr [ebp-0C],eax
 0076A06D    xor         eax,eax
 0076A06F    push        ebp
 0076A070    push        76A199
 0076A075    push        dword ptr fs:[eax]
 0076A078    mov         dword ptr fs:[eax],esp
 0076A07B    cmp         byte ptr ds:[822CF4],0;gvar_00822CF4
>0076A082    je          0076A17E
 0076A088    mov         ebx,1
 0076A08D    mov         edi,822D01;gvar_00822D01
 0076A092    mov         dword ptr [ebp-8],822D24;gvar_00822D24
 0076A099    mov         esi,822D11;gvar_00822D11
 0076A09E    cmp         byte ptr [edi],0
>0076A0A1    je          0076A0E2
 0076A0A3    call        thinkgear.TG_GetNewConnectionId
 0076A0A8    mov         dword ptr [ebp-4],eax
 0076A0AB    mov         eax,dword ptr [ebp-8]
 0076A0AE    mov         edx,dword ptr [ebp-4]
 0076A0B1    mov         dword ptr [eax],edx
 0076A0B3    push        0
 0076A0B5    push        2580
 0076A0BA    lea         edx,[ebp-0C]
 0076A0BD    mov         eax,ebx
 0076A0BF    call        00769FB4
 0076A0C4    mov         eax,dword ptr [ebp-0C]
 0076A0C7    call        @LStrToPChar
 0076A0CC    push        eax
 0076A0CD    mov         eax,dword ptr [ebp-4]
 0076A0D0    push        eax
 0076A0D1    call        thinkgear.TG_Connect
 0076A0D6    add         esp,10
 0076A0D9    test        eax,eax
 0076A0DB    sete        al
 0076A0DE    mov         byte ptr [esi],al
>0076A0E0    jmp         0076A0E5
 0076A0E2    mov         byte ptr [esi],0
 0076A0E5    inc         ebx
 0076A0E6    inc         esi
 0076A0E7    add         dword ptr [ebp-8],4
 0076A0EB    inc         edi
 0076A0EC    cmp         ebx,10
>0076A0EF    jne         0076A09E
 0076A0F1    mov         byte ptr ds:[822D10],0;gvar_00822D10
 0076A0F8    cmp         byte ptr ds:[822D00],0;gvar_00822D00
>0076A0FF    je          0076A17E
 0076A101    mov         ebx,1
 0076A106    mov         eax,822D11;gvar_00822D11
 0076A10B    mov         edx,822D24;gvar_00822D24
 0076A110    cmp         byte ptr [eax],0
>0076A113    je          0076A125
 0076A115    mov         eax,dword ptr [edx]
 0076A117    mov         [00822D20],eax;gvar_00822D20
 0076A11C    mov         byte ptr ds:[822D10],1;gvar_00822D10
>0076A123    jmp         0076A12F
 0076A125    inc         ebx
 0076A126    add         edx,4
 0076A129    inc         eax
 0076A12A    cmp         ebx,10
>0076A12D    jne         0076A110
 0076A12F    cmp         byte ptr ds:[822D10],0;gvar_00822D10
>0076A136    jne         0076A17E
 0076A138    call        thinkgear.TG_GetNewConnectionId
 0076A13D    mov         dword ptr [ebp-4],eax
 0076A140    mov         eax,dword ptr [ebp-4]
 0076A143    mov         dword ptr [ebx*4+822D20],eax;gvar_00822D20
 0076A14A    push        0
 0076A14C    push        2580
 0076A151    lea         edx,[ebp-10]
 0076A154    mov         eax,5
 0076A159    call        00769FB4
 0076A15E    mov         eax,dword ptr [ebp-10]
 0076A161    call        @LStrToPChar
 0076A166    push        eax
 0076A167    mov         eax,dword ptr [ebp-4]
 0076A16A    push        eax
 0076A16B    call        thinkgear.TG_Connect
 0076A170    add         esp,10
 0076A173    test        eax,eax
 0076A175    sete        al
 0076A178    mov         byte ptr [ebx+822D10],al;gvar_00822D10
 0076A17E    xor         eax,eax
 0076A180    pop         edx
 0076A181    pop         ecx
 0076A182    pop         ecx
 0076A183    mov         dword ptr fs:[eax],edx
 0076A186    push        76A1A0
 0076A18B    lea         eax,[ebp-10]
 0076A18E    mov         edx,2
 0076A193    call        @LStrArrayClr
 0076A198    ret
>0076A199    jmp         @HandleFinally
>0076A19E    jmp         0076A18B
 0076A1A0    pop         edi
 0076A1A1    pop         esi
 0076A1A2    pop         ebx
 0076A1A3    mov         esp,ebp
 0076A1A5    pop         ebp
 0076A1A6    ret
*}
end;

//0076A1A8
procedure sub_0076A1A8;
begin
{*
 0076A1A8    push        ebx
 0076A1A9    push        esi
 0076A1AA    push        edi
 0076A1AB    cmp         byte ptr ds:[822CF4],0;gvar_00822CF4
>0076A1B2    je          0076A1DC
 0076A1B4    mov         edi,10
 0076A1B9    mov         esi,822D00;gvar_00822D00
 0076A1BE    mov         ebx,822D20;gvar_00822D20
 0076A1C3    cmp         byte ptr [esi],0
>0076A1C6    je          0076A1D5
 0076A1C8    mov         eax,dword ptr [ebx]
 0076A1CA    push        eax
 0076A1CB    call        thinkgear.TG_FreeConnection
 0076A1D0    pop         ecx
 0076A1D1    xor         eax,eax
 0076A1D3    mov         dword ptr [ebx],eax
 0076A1D5    add         ebx,4
 0076A1D8    inc         esi
 0076A1D9    dec         edi
>0076A1DA    jne         0076A1C3
 0076A1DC    pop         edi
 0076A1DD    pop         esi
 0076A1DE    pop         ebx
 0076A1DF    ret
*}
end;

//0076A1E0
{*function sub_0076A1E0:?;
begin
 0076A1E0    push        ebx
 0076A1E1    push        esi
 0076A1E2    push        edi
 0076A1E3    push        ebp
 0076A1E4    cmp         byte ptr ds:[822CF4],0;gvar_00822CF4
>0076A1EB    je          0076A220
 0076A1ED    mov         ebp,10
 0076A1F2    mov         ebx,822D00;gvar_00822D00
 0076A1F7    mov         esi,822D10;gvar_00822D10
 0076A1FC    mov         edi,822D20;gvar_00822D20
 0076A201    cmp         byte ptr [ebx],0
>0076A204    je          0076A218
 0076A206    cmp         byte ptr [esi],0
>0076A209    je          0076A218
 0076A20B    push        0FF
 0076A20D    mov         eax,dword ptr [edi]
 0076A20F    push        eax
 0076A210    call        thinkgear.TG_ReadPackets
 0076A215    add         esp,8
 0076A218    add         edi,4
 0076A21B    inc         esi
 0076A21C    inc         ebx
 0076A21D    dec         ebp
>0076A21E    jne         0076A201
 0076A220    mov         al,1
 0076A222    pop         ebp
 0076A223    pop         edi
 0076A224    pop         esi
 0076A225    pop         ebx
 0076A226    ret
end;*}

//0076A228
{*function sub_0076A228(?:UnicodeString):?;
begin
 0076A228    push        ebp
 0076A229    mov         ebp,esp
 0076A22B    push        ecx
 0076A22C    push        ebx
 0076A22D    mov         dword ptr [ebp-4],eax
 0076A230    mov         eax,dword ptr [ebp-4]
 0076A233    call        @UStrAddRef
 0076A238    xor         eax,eax
 0076A23A    push        ebp
 0076A23B    push        76A26E
 0076A240    push        dword ptr fs:[eax]
 0076A243    mov         dword ptr fs:[eax],esp
 0076A246    mov         eax,[00822CFC];gvar_00822CFC:TModuleNeurosky
 0076A24B    mov         eax,dword ptr [eax+1C]
 0076A24E    mov         edx,dword ptr [ebp-4]
 0076A251    call        THashTable.Get
 0076A256    mov         ebx,eax
 0076A258    xor         eax,eax
 0076A25A    pop         edx
 0076A25B    pop         ecx
 0076A25C    pop         ecx
 0076A25D    mov         dword ptr fs:[eax],edx
 0076A260    push        76A275
 0076A265    lea         eax,[ebp-4]
 0076A268    call        @UStrClr
 0076A26D    ret
>0076A26E    jmp         @HandleFinally
>0076A273    jmp         0076A265
 0076A275    mov         eax,ebx
 0076A277    pop         ebx
 0076A278    pop         ecx
 0076A279    pop         ebp
 0076A27A    ret
end;*}

//0076A27C
{*procedure sub_0076A27C(?:Integer; ?:?);
begin
 0076A27C    push        ebx
 0076A27D    push        esi
 0076A27E    mov         esi,edx
 0076A280    mov         ebx,eax
 0076A282    mov         ecx,esi
 0076A284    mov         eax,[00822CFC];gvar_00822CFC:TModuleNeurosky
 0076A289    mov         eax,dword ptr [eax+1C]
 0076A28C    mov         edx,ebx
 0076A28E    call        THashTable.Get
 0076A293    pop         esi
 0076A294    pop         ebx
 0076A295    ret
end;*}

//0076A298
{*function sub_0076A298:?;
begin
 0076A298    push        ebx
 0076A299    mov         dl,1
 0076A29B    mov         eax,[0043C7BC];TStringList
 0076A2A0    call        TStringList.Create;TStringList.Create
 0076A2A5    mov         ebx,eax
 0076A2A7    mov         edx,76A2D0;'RawAttention'
 0076A2AC    mov         eax,ebx
 0076A2AE    mov         ecx,dword ptr [eax]
 0076A2B0    call        dword ptr [ecx+38];TStringList.Add
 0076A2B3    mov         edx,76A2F8;'RawMeditation'
 0076A2B8    mov         eax,ebx
 0076A2BA    mov         ecx,dword ptr [eax]
 0076A2BC    call        dword ptr [ecx+38];TStringList.Add
 0076A2BF    mov         eax,ebx
 0076A2C1    pop         ebx
 0076A2C2    ret
end;*}

//0076A314
procedure TModuleNeurosky.AddFields;
begin
{*
 0076A314    push        ebx
 0076A315    mov         ebx,eax
 0076A317    mov         eax,ebx
 0076A319    call        TPieModule.AddFields
 0076A31E    xor         ecx,ecx
 0076A320    mov         edx,76A428;'Exists'
 0076A325    mov         eax,dword ptr [ebx+1C];TModuleNeurosky.Fields:THashTable
 0076A328    call        THashTable.Add
 0076A32D    mov         ecx,1
 0076A332    mov         edx,76A444;'RawBattery'
 0076A337    mov         eax,dword ptr [ebx+1C];TModuleNeurosky.Fields:THashTable
 0076A33A    call        THashTable.Add
 0076A33F    mov         ecx,2
 0076A344    mov         edx,76A468;'RawPoorSignal'
 0076A349    mov         eax,dword ptr [ebx+1C];TModuleNeurosky.Fields:THashTable
 0076A34C    call        THashTable.Add
 0076A351    mov         ecx,3
 0076A356    mov         edx,76A490;'RawAttention'
 0076A35B    mov         eax,dword ptr [ebx+1C];TModuleNeurosky.Fields:THashTable
 0076A35E    call        THashTable.Add
 0076A363    mov         ecx,3
 0076A368    mov         edx,76A4B8;'RawEngagement'
 0076A36D    mov         eax,dword ptr [ebx+1C];TModuleNeurosky.Fields:THashTable
 0076A370    call        THashTable.Add
 0076A375    mov         ecx,4
 0076A37A    mov         edx,76A4E0;'RawMeditation'
 0076A37F    mov         eax,dword ptr [ebx+1C];TModuleNeurosky.Fields:THashTable
 0076A382    call        THashTable.Add
 0076A387    mov         ecx,6
 0076A38C    mov         edx,76A508;'RawDelta'
 0076A391    mov         eax,dword ptr [ebx+1C];TModuleNeurosky.Fields:THashTable
 0076A394    call        THashTable.Add
 0076A399    mov         ecx,7
 0076A39E    mov         edx,76A528;'RawTheta'
 0076A3A3    mov         eax,dword ptr [ebx+1C];TModuleNeurosky.Fields:THashTable
 0076A3A6    call        THashTable.Add
 0076A3AB    mov         ecx,8
 0076A3B0    mov         edx,76A548;'RawAlpha1'
 0076A3B5    mov         eax,dword ptr [ebx+1C];TModuleNeurosky.Fields:THashTable
 0076A3B8    call        THashTable.Add
 0076A3BD    mov         ecx,9
 0076A3C2    mov         edx,76A568;'RawAlpha2'
 0076A3C7    mov         eax,dword ptr [ebx+1C];TModuleNeurosky.Fields:THashTable
 0076A3CA    call        THashTable.Add
 0076A3CF    mov         ecx,0A
 0076A3D4    mov         edx,76A588;'RawBeta1'
 0076A3D9    mov         eax,dword ptr [ebx+1C];TModuleNeurosky.Fields:THashTable
 0076A3DC    call        THashTable.Add
 0076A3E1    mov         ecx,0B
 0076A3E6    mov         edx,76A5A8;'RawBeta2'
 0076A3EB    mov         eax,dword ptr [ebx+1C];TModuleNeurosky.Fields:THashTable
 0076A3EE    call        THashTable.Add
 0076A3F3    mov         ecx,0C
 0076A3F8    mov         edx,76A5C8;'RawGamma1'
 0076A3FD    mov         eax,dword ptr [ebx+1C];TModuleNeurosky.Fields:THashTable
 0076A400    call        THashTable.Add
 0076A405    mov         ecx,0D
 0076A40A    mov         edx,76A5E8;'RawGamma2'
 0076A40F    mov         eax,dword ptr [ebx+1C];TModuleNeurosky.Fields:THashTable
 0076A412    call        THashTable.Add
 0076A417    pop         ebx
 0076A418    ret
*}
end;

//0076A5FC
procedure TModuleNeurosky.ClearRead;
begin
{*
 0076A5FC    call        TPieModule.ClearRead
 0076A601    ret
*}
end;

//0076A604
constructor TModuleNeurosky.Create;
begin
{*
 0076A604    push        ebx
 0076A605    push        esi
 0076A606    test        dl,dl
>0076A608    je          0076A612
 0076A60A    add         esp,0FFFFFFF0
 0076A60D    call        @ClassCreate
 0076A612    mov         ebx,edx
 0076A614    mov         esi,eax
 0076A616    push        76A658;'ThinkGear'
 0076A61B    push        0
 0076A61D    push        0
 0076A61F    push        0
 0076A621    mov         ecx,76A678;'Neurosky'
 0076A626    xor         edx,edx
 0076A628    mov         eax,esi
 0076A62A    call        005E4830
 0076A62F    mov         eax,esi
 0076A631    test        bl,bl
>0076A633    je          0076A644
 0076A635    call        @AfterConstruction
 0076A63A    pop         dword ptr fs:[0]
 0076A641    add         esp,0C
 0076A644    mov         eax,esi
 0076A646    pop         esi
 0076A647    pop         ebx
 0076A648    ret
*}
end;

//0076A68C
function TModuleNeurosky.CreateValue(Identifier:string):TExpression;
begin
{*
 0076A68C    push        ebp
 0076A68D    mov         ebp,esp
 0076A68F    push        ecx
 0076A690    push        ebx
 0076A691    mov         dword ptr [ebp-4],edx
 0076A694    mov         ebx,eax
 0076A696    mov         eax,dword ptr [ebp-4]
 0076A699    call        @UStrAddRef
 0076A69E    xor         eax,eax
 0076A6A0    push        ebp
 0076A6A1    push        76A6D0
 0076A6A6    push        dword ptr fs:[eax]
 0076A6A9    mov         dword ptr fs:[eax],esp
 0076A6AC    mov         byte ptr [ebx+24],1;TModuleNeurosky.Used:Boolean
 0076A6B0    mov         eax,dword ptr [ebp-4]
 0076A6B3    call        00769AB4
 0076A6B8    mov         ebx,eax
 0076A6BA    xor         eax,eax
 0076A6BC    pop         edx
 0076A6BD    pop         ecx
 0076A6BE    pop         ecx
 0076A6BF    mov         dword ptr fs:[eax],edx
 0076A6C2    push        76A6D7
 0076A6C7    lea         eax,[ebp-4]
 0076A6CA    call        @UStrClr
 0076A6CF    ret
>0076A6D0    jmp         @HandleFinally
>0076A6D5    jmp         0076A6C7
 0076A6D7    mov         eax,ebx
 0076A6D9    pop         ebx
 0076A6DA    pop         ecx
 0076A6DB    pop         ebp
 0076A6DC    ret
*}
end;

//0076A6E0
function TModuleNeurosky.GetDefaultFormat(field:string):TGuiFormat;
begin
{*
 0076A6E0    push        ebp
 0076A6E1    mov         ebp,esp
 0076A6E3    push        ecx
 0076A6E4    push        ebx
 0076A6E5    mov         dword ptr [ebp-4],edx
 0076A6E8    mov         ebx,eax
 0076A6EA    mov         eax,dword ptr [ebp-4]
 0076A6ED    call        @UStrAddRef
 0076A6F2    xor         eax,eax
 0076A6F4    push        ebp
 0076A6F5    push        76A72C
 0076A6FA    push        dword ptr fs:[eax]
 0076A6FD    mov         dword ptr fs:[eax],esp
 0076A700    mov         edx,dword ptr [ebp-4]
 0076A703    mov         eax,dword ptr [ebx+1C];TModuleNeurosky.Fields:THashTable
 0076A706    call        THashTable.Get
 0076A70B    sub         eax,1
>0076A70E    jae         0076A714
 0076A710    xor         ebx,ebx
>0076A712    jmp         0076A716
 0076A714    mov         bl,9
 0076A716    xor         eax,eax
 0076A718    pop         edx
 0076A719    pop         ecx
 0076A71A    pop         ecx
 0076A71B    mov         dword ptr fs:[eax],edx
 0076A71E    push        76A733
 0076A723    lea         eax,[ebp-4]
 0076A726    call        @UStrClr
 0076A72B    ret
>0076A72C    jmp         @HandleFinally
>0076A731    jmp         0076A723
 0076A733    mov         eax,ebx
 0076A735    pop         ebx
 0076A736    pop         ecx
 0076A737    pop         ebp
 0076A738    ret
*}
end;

//0076A73C
procedure TModuleNeurosky.GetGoodFields;
begin
{*
 0076A73C    call        0076A298
 0076A741    ret
*}
end;

//0076A744
procedure TModuleNeurosky.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 0076A744    push        ebp
 0076A745    mov         ebp,esp
 0076A747    mov         byte ptr [edx],1
 0076A74A    mov         dword ptr [ecx],0FFFFFFFF
 0076A750    mov         eax,dword ptr [ebp+8]
 0076A753    mov         dword ptr [eax],0FFFFFFFF
 0076A759    pop         ebp
 0076A75A    ret         4
*}
end;

//0076A760
procedure TModuleNeurosky.Read;
begin
{*
 0076A760    call        0076A1E0
 0076A765    ret
*}
end;

//0076A768
procedure TModuleNeurosky.StartCompiletime;
begin
{*
 0076A768    call        TPieModule.StartCompiletime
 0076A76D    call        00769F88
 0076A772    ret
*}
end;

//0076A774
procedure TModuleNeurosky.StartRuntime;
begin
{*
 0076A774    call        TPieModule.StartRuntime
 0076A779    call        0076A05C
 0076A77E    ret
*}
end;

//0076A780
procedure TModuleNeurosky.StopCompiletime;
begin
{*
 0076A780    push        ebx
 0076A781    mov         ebx,eax
 0076A783    call        00769FB0
 0076A788    mov         eax,ebx
 0076A78A    call        TPieModule.StopCompiletime
 0076A78F    pop         ebx
 0076A790    ret
*}
end;

//0076A794
procedure TModuleNeurosky.StopRuntime;
begin
{*
 0076A794    push        ebx
 0076A795    mov         ebx,eax
 0076A797    call        0076A1A8
 0076A79C    mov         eax,ebx
 0076A79E    call        TPieModule.StopRuntime
 0076A7A3    pop         ebx
 0076A7A4    ret
*}
end;

Initialization
//0078301C
{*
 0078301C    sub         dword ptr ds:[822CF8],1
>00783023    jae         00783040
 00783025    mov         dl,1
 00783027    mov         eax,[007696F8];TModuleNeurosky
 0078302C    call        TModuleNeurosky.Create;TModuleNeurosky.Create
 00783031    mov         [00822CFC],eax;gvar_00822CFC:TModuleNeurosky
 00783036    mov         eax,[00822CFC];gvar_00822CFC:TModuleNeurosky
 0078303B    call        005E31AC
 00783040    ret
*}
Finalization
end.