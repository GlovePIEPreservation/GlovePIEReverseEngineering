//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieAny;

interface

uses
  SysUtils, Classes;

type
  TAnyValue = class(TObjectValue)
  published
    function GetPerUnits1:TUnits;//006F8A34
    function GetUnits:TUnits;//006F8B2C
    //procedure GetString(?:?);//006F8B04
    function GetPerUnits2:TUnits;//006F8A48
    procedure GetRotMat(m:TRotMat);//006F8A5C
    procedure GetVector(x:Double; y:Double; z:Double);//006FBB28
    function Module:TObject;//006FC0E8
    //function SetValue(NewValue:Double; ?:?):Boolean;//006FC0F0
    function CanSet:Boolean;//006F896C
    function GetDataType:TDataType;//006F89B8
    //procedure ToString(?:?);//006FC2E0
    procedure FillClone(c:TExpression);//006F8998
    procedure CreateClone;//006F8988
    procedure GetValue;//006F8C68
  public
    ............................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//006FC2E0
    procedure GetValue; virtual;//v2C//006F8C68
    //procedure GetString(?:?); virtual;//v38//006F8B04
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//006FBB28
    procedure GetRotMat(m:TRotMat); virtual;//v40//006F8A5C
    function GetDataType:TDataType; virtual;//v44//006F89B8
    function GetUnits:TUnits; virtual;//v48//006F8B2C
    function GetPerUnits1:TUnits; virtual;//v4C//006F8A34
    function GetPerUnits2:TUnits; virtual;//v50//006F8A48
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//006FC0F0
    function CanSet:Boolean; virtual;//v68//006F896C
    procedure CreateClone; virtual;//v80//006F8988
    procedure FillClone(c:TExpression); virtual;//v84//006F8998
    function Module:TObject; virtual;//v98//006FC0E8
  end;
  TModuleAny = class(TPieModule)
  published
    procedure MonitorFrame;//00700894
    procedure PrepareForMonitoring;//0070089C
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//00700878
    function GetDefaultFormat(field:string):TGuiFormat;//00700294
    procedure PrepareForGUI;//00700898
    procedure StartGUI;//007008B0
    procedure StopGUI;//00700920
    procedure StartMonitoring;//007008BC
    procedure StopMonitoring;//00700928
    function GetGoodFields:TStringList;//00700308
    procedure StartCompiletime;//007008A4
    procedure StopCompiletime;//0070090C
    procedure StartRuntime;//007008D8
    procedure StopRuntime;//00700930
    constructor Create;//007001E8
    procedure ClearRead;//007001E0
    function Read:Boolean;//007008A0
    procedure AddFields;//006FC3E0
    function CreateValue(Identifier:string):TExpression;//00700240
  public
    function CreateValue(Identifier:string):TExpression; virtual;//v14//00700240
    function GetGoodFields:TStringList; virtual;//v1C//00700308
    procedure AddFields; virtual;//v24//006FC3E0
    procedure StartCompiletime; virtual;//v28//007008A4
    procedure StopCompiletime; virtual;//v2C//0070090C
    procedure StartRuntime; virtual;//v30//007008D8
    procedure StopRuntime; virtual;//v34//00700930
    procedure ClearRead; virtual;//v38//007001E0
    function Read:Boolean; virtual;//v3C//007008A0
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//00700878
    function GetDefaultFormat(field:string):TGuiFormat; virtual;//v44//00700294
    procedure PrepareForGUI; virtual;//v50//00700898
    procedure StartGUI; virtual;//v54//007008B0
    procedure StopGUI; virtual;//v58//00700920
    procedure PrepareForMonitoring; virtual;//v5C//0070089C
    procedure StartMonitoring; virtual;//v60//007008BC
    procedure StopMonitoring; virtual;//v64//00700928
    procedure MonitorFrame; virtual;//v68//00700894
  end;
    //function sub_006F8818(?:string):?;//006F8818
    procedure sub_006F8B48;//006F8B48
    procedure sub_006F8B90;//006F8B90
    procedure sub_006F8BD8;//006F8BD8
    procedure sub_006F8C20;//006F8C20
    procedure sub_006FC3C8;//006FC3C8
    procedure sub_006FC3DC;//006FC3DC

implementation

//006F8818
{*function sub_006F8818(?:string):?;
begin
 006F8818    push        ebp
 006F8819    mov         ebp,esp
 006F881B    add         esp,0FFFFFFF8
 006F881E    push        ebx
 006F881F    push        esi
 006F8820    push        edi
 006F8821    xor         edx,edx
 006F8823    mov         dword ptr [ebp-8],edx
 006F8826    mov         dword ptr [ebp-4],eax
 006F8829    mov         eax,dword ptr [ebp-4]
 006F882C    call        @UStrAddRef
 006F8831    xor         eax,eax
 006F8833    push        ebp
 006F8834    push        6F8935
 006F8839    push        dword ptr fs:[eax]
 006F883C    mov         dword ptr fs:[eax],esp
 006F883F    xor         esi,esi
 006F8841    lea         eax,[ebp-8]
 006F8844    mov         edx,dword ptr [ebp-4]
 006F8847    call        @UStrLAsg
 006F884C    lea         eax,[ebp-8]
 006F884F    mov         edx,6F8954;'Any'
 006F8854    call        004F9BD0
 006F8859    test        al,al
>006F885B    je          006F891A
 006F8861    lea         eax,[ebp-8]
 006F8864    call        004F9D00
 006F8869    mov         ebx,eax
 006F886B    lea         eax,[ebp-8]
 006F886E    mov         edx,6F8968;'.'
 006F8873    call        004F9BD0
 006F8878    test        al,al
>006F887A    je          006F891A
 006F8880    mov         eax,[008229A4];gvar_008229A4:TModuleAny
 006F8885    mov         eax,dword ptr [eax+1C]
 006F8888    mov         edx,dword ptr [ebp-8]
 006F888B    call        THashTable.Get
 006F8890    mov         edi,eax
 006F8892    test        edi,edi
>006F8894    jl          006F891A
 006F889A    mov         eax,[008229A4];gvar_008229A4:TModuleAny
 006F889F    mov         byte ptr [eax+24],1
 006F88A3    mov         dl,1
 006F88A5    mov         eax,[006F7EA8];TAnyValue
 006F88AA    call        TObject.Create;TAnyValue.Create
 006F88AF    mov         esi,eax
 006F88B1    mov         dword ptr [esi+20],edi;TAnyValue..............................Item:Integer
 006F88B4    test        ebx,ebx
>006F88B6    jge         006F88BA
 006F88B8    xor         ebx,ebx
 006F88BA    mov         dword ptr [esi+18],ebx;TAnyValue...........................................................
 006F88BD    cmp         byte ptr ds:[82299C],0;gvar_0082299C
>006F88C4    jne         006F88CB
 006F88C6    call        00694AB8
 006F88CB    mov         byte ptr ds:[82299C],1;gvar_0082299C
 006F88D2    call        00654E50
 006F88D7    call        0062D1C8
 006F88DC    mov         eax,[0078CDA8];^gvar_0082276C
 006F88E1    mov         byte ptr [eax],1
 006F88E4    mov         eax,[0078DBAC];^gvar_00817844
 006F88E9    mov         byte ptr [eax],1
 006F88EC    add         edi,0FFFFFFD3
 006F88EF    sub         edi,2
>006F88F2    jb          006F8900
 006F88F4    sub         edi,27
>006F88F7    je          006F890E
 006F88F9    sub         edi,10
>006F88FC    je          006F890E
>006F88FE    jmp         006F891A
 006F8900    call        0074BF10
 006F8905    mov         edx,ebx
 006F8907    call        TWiimoteManager.UseDualShock3
>006F890C    jmp         006F891A
 006F890E    call        0074BF10
 006F8913    mov         edx,ebx
 006F8915    call        TWiimoteManager.UseSixaxisGyro
 006F891A    xor         eax,eax
 006F891C    pop         edx
 006F891D    pop         ecx
 006F891E    pop         ecx
 006F891F    mov         dword ptr fs:[eax],edx
 006F8922    push        6F893C
 006F8927    lea         eax,[ebp-8]
 006F892A    mov         edx,2
 006F892F    call        @UStrArrayClr
 006F8934    ret
>006F8935    jmp         @HandleFinally
>006F893A    jmp         006F8927
 006F893C    mov         eax,esi
 006F893E    pop         edi
 006F893F    pop         esi
 006F8940    pop         ebx
 006F8941    pop         ecx
 006F8942    pop         ecx
 006F8943    pop         ebp
 006F8944    ret
end;*}

//006F896C
function TAnyValue.CanSet:Boolean;
begin
{*
 006F896C    mov         eax,dword ptr [eax+20];TAnyValue...............................Item:Integer
 006F896F    add         eax,0FFFFFFD3
 006F8972    sub         eax,2
>006F8975    jb          006F897E
 006F8977    sub         eax,2A
>006F897A    je          006F8981
>006F897C    jmp         006F8984
 006F897E    mov         al,1
 006F8980    ret
 006F8981    mov         al,1
 006F8983    ret
 006F8984    xor         eax,eax
 006F8986    ret
*}
end;

//006F8988
procedure TAnyValue.CreateClone;
begin
{*
 006F8988    mov         dl,1
 006F898A    mov         eax,[006F7EA8];TAnyValue
 006F898F    call        TObject.Create;TAnyValue.Create
 006F8994    ret
*}
end;

//006F8998
procedure TAnyValue.FillClone(c:TExpression);
begin
{*
 006F8998    push        ebx
 006F8999    push        esi
 006F899A    mov         esi,edx
 006F899C    mov         ebx,eax
 006F899E    mov         edx,esi
 006F89A0    mov         eax,ebx
 006F89A2    call        TExpression.FillClone
 006F89A7    mov         eax,esi
 006F89A9    mov         edx,dword ptr [ebx+20];TAnyValue................................Item:Integer
 006F89AC    mov         dword ptr [eax+20],edx
 006F89AF    mov         edx,dword ptr [ebx+18];TAnyValue...........................................................
 006F89B2    mov         dword ptr [eax+18],edx
 006F89B5    pop         esi
 006F89B6    pop         ebx
 006F89B7    ret
*}
end;

//006F89B8
function TAnyValue.GetDataType:TDataType;
begin
{*
 006F89B8    mov         eax,dword ptr [eax+20];TAnyValue.................................Item:Integer
 006F89BB    cmp         eax,3F
>006F89BE    jge         006F89EB
 006F89C0    cmp         eax,2D
>006F89C3    jge         006F89D1
 006F89C5    sub         eax,1
>006F89C8    jb          006F8A19
 006F89CA    sub         eax,4
>006F89CD    jb          006F8A1C
>006F89CF    jmp         006F8A2E
 006F89D1    add         eax,0FFFFFFD3
 006F89D4    sub         eax,2
>006F89D7    jb          006F8A22
 006F89D9    add         eax,0FFFFFFFE
 006F89DC    sub         eax,2
>006F89DF    jb          006F8A1F
 006F89E1    add         eax,0FFFFFFFE
 006F89E4    sub         eax,6
>006F89E7    jb          006F8A1C
>006F89E9    jmp         006F8A2E
 006F89EB    cmp         eax,63
>006F89EE    jge         006F8A07
 006F89F0    add         eax,0FFFFFFC1
 006F89F3    sub         eax,2
>006F89F6    jb          006F8A1C
 006F89F8    add         eax,0FFFFFFED
 006F89FB    sub         eax,0C
>006F89FE    jb          006F8A25
 006F8A00    sub         eax,3
>006F8A03    jb          006F8A28
>006F8A05    jmp         006F8A2E
 006F8A07    add         eax,0FFFFFF9D
 006F8A0A    sub         eax,3
>006F8A0D    jb          006F8A25
>006F8A0F    je          006F8A2B
 006F8A11    dec         eax
 006F8A12    sub         eax,6
>006F8A15    jb          006F8A28
>006F8A17    jmp         006F8A2E
 006F8A19    mov         al,3
 006F8A1B    ret
 006F8A1C    xor         eax,eax
 006F8A1E    ret
 006F8A1F    xor         eax,eax
 006F8A21    ret
 006F8A22    xor         eax,eax
 006F8A24    ret
 006F8A25    xor         eax,eax
 006F8A27    ret
 006F8A28    mov         al,5
 006F8A2A    ret
 006F8A2B    mov         al,6
 006F8A2D    ret
 006F8A2E    mov         al,3
 006F8A30    ret
*}
end;

//006F8A34
function TAnyValue.GetPerUnits1:TUnits;
begin
{*
 006F8A34    mov         eax,dword ptr [eax+20];TAnyValue..................................Item:Integer
 006F8A37    add         eax,0FFFFFFA6
 006F8A3A    sub         eax,8
>006F8A3D    jae         006F8A42
 006F8A3F    mov         al,11
 006F8A41    ret
 006F8A42    xor         eax,eax
 006F8A44    ret
*}
end;

//006F8A48
function TAnyValue.GetPerUnits2:TUnits;
begin
{*
 006F8A48    mov         eax,dword ptr [eax+20];TAnyValue...................................Item:Integer
 006F8A4B    add         eax,0FFFFFFA6
 006F8A4E    sub         eax,8
>006F8A51    jae         006F8A56
 006F8A53    mov         al,11
 006F8A55    ret
 006F8A56    xor         eax,eax
 006F8A58    ret
*}
end;

//006F8A5C
procedure TAnyValue.GetRotMat(m:TRotMat);
begin
{*
 006F8A5C    push        ebx
 006F8A5D    push        esi
 006F8A5E    push        edi
 006F8A5F    add         esp,0FFFFFFF4
 006F8A62    mov         dword ptr [esp],edx
 006F8A65    mov         esi,eax
 006F8A67    call        0074BF10
 006F8A6C    mov         edx,dword ptr [esi+18];TAnyValue...........................................................
 006F8A6F    call        TWiimoteManager.GetAny
 006F8A74    mov         ebx,eax
 006F8A76    mov         eax,dword ptr [esi+20];TAnyValue....................................Item:Integer
 006F8A79    sub         eax,66
>006F8A7C    jne         006F8AF0
 006F8A7E    test        ebx,ebx
>006F8A80    jne         006F8AB2
 006F8A82    xor         ecx,ecx
 006F8A84    mov         esi,dword ptr [esp]
 006F8A87    xor         eax,eax
 006F8A89    mov         edx,esi
 006F8A8B    cmp         eax,ecx
 006F8A8D    sete        bl
 006F8A90    movsx       ebx,bl
 006F8A93    mov         dword ptr [esp+8],ebx
 006F8A97    fild        dword ptr [esp+8]
 006F8A9B    fstp        qword ptr [edx]
 006F8A9D    wait
 006F8A9E    inc         eax
 006F8A9F    add         edx,8
 006F8AA2    cmp         eax,3
>006F8AA5    jne         006F8A8B
 006F8AA7    inc         ecx
 006F8AA8    add         esi,18
 006F8AAB    cmp         ecx,3
>006F8AAE    jne         006F8A87
>006F8AB0    jmp         006F8AFA
 006F8AB2    xor         ecx,ecx
 006F8AB4    mov         eax,dword ptr [esp]
 006F8AB7    mov         dword ptr [esp+4],eax
 006F8ABB    xor         eax,eax
 006F8ABD    mov         edx,dword ptr [esp+4]
 006F8AC1    lea         esi,[ecx+ecx*2]
 006F8AC4    lea         esi,[ebx+esi*8]
 006F8AC7    mov         edi,dword ptr [esi+eax*8+370]
 006F8ACE    mov         dword ptr [edx],edi
 006F8AD0    mov         edi,dword ptr [esi+eax*8+374]
 006F8AD7    mov         dword ptr [edx+4],edi
 006F8ADA    inc         eax
 006F8ADB    add         edx,8
 006F8ADE    cmp         eax,3
>006F8AE1    jne         006F8AC1
 006F8AE3    inc         ecx
 006F8AE4    add         dword ptr [esp+4],18
 006F8AE9    cmp         ecx,3
>006F8AEC    jne         006F8ABB
>006F8AEE    jmp         006F8AFA
 006F8AF0    mov         edx,dword ptr [esp]
 006F8AF3    mov         eax,esi
 006F8AF5    call        TExpression.GetRotMat
 006F8AFA    add         esp,0C
 006F8AFD    pop         edi
 006F8AFE    pop         esi
 006F8AFF    pop         ebx
 006F8B00    ret
*}
end;

//006F8B04
{*procedure TAnyValue.GetString(?:?);
begin
 006F8B04    push        ebx
 006F8B05    push        esi
 006F8B06    mov         esi,edx
 006F8B08    mov         ebx,eax
 006F8B0A    mov         eax,dword ptr [ebx+20];TAnyValue.....................................Item:Integer
 006F8B0D    sub         eax,1
>006F8B10    jae         006F8B1E
 006F8B12    mov         edx,esi
 006F8B14    mov         eax,ebx
 006F8B16    call        TExpression.GetString
 006F8B1B    pop         esi
 006F8B1C    pop         ebx
 006F8B1D    ret
 006F8B1E    mov         edx,esi
 006F8B20    mov         eax,ebx
 006F8B22    call        TExpression.GetString
 006F8B27    pop         esi
 006F8B28    pop         ebx
 006F8B29    ret
end;*}

//006F8B2C
function TAnyValue.GetUnits:TUnits;
begin
{*
 006F8B2C    mov         eax,dword ptr [eax+20];TAnyValue......................................Item:Integer
 006F8B2F    add         eax,0FFFFFFAC
 006F8B32    sub         eax,6
>006F8B35    jb          006F8B3E
 006F8B37    sub         eax,8
>006F8B3A    jb          006F8B41
>006F8B3C    jmp         006F8B44
 006F8B3E    mov         al,18
 006F8B40    ret
 006F8B41    mov         al,5
 006F8B43    ret
 006F8B44    xor         eax,eax
 006F8B46    ret
*}
end;

//006F8B48
procedure sub_006F8B48;
begin
{*
 006F8B48    add         esp,0FFFFFFE4
 006F8B4B    xor         edx,edx
 006F8B4D    mov         dword ptr [esp],edx
 006F8B50    mov         dword ptr [esp+4],edx
 006F8B54    call        00690118
 006F8B59    fstp        qword ptr [esp+8]
 006F8B5D    wait
 006F8B5E    fld         qword ptr [esp+8]
 006F8B62    fabs
 006F8B64    fstp        tbyte ptr [esp+10]
 006F8B68    wait
 006F8B69    fld         qword ptr [esp]
 006F8B6C    fabs
 006F8B6E    fld         tbyte ptr [esp+10]
 006F8B72    fcompp
 006F8B74    wait
 006F8B75    fnstsw      al
 006F8B77    sahf
>006F8B78    jbe         006F8B89
 006F8B7A    mov         eax,dword ptr [esp+8]
 006F8B7E    mov         dword ptr [esp],eax
 006F8B81    mov         eax,dword ptr [esp+0C]
 006F8B85    mov         dword ptr [esp+4],eax
 006F8B89    fld         qword ptr [esp]
 006F8B8C    add         esp,1C
 006F8B8F    ret
*}
end;

//006F8B90
procedure sub_006F8B90;
begin
{*
 006F8B90    add         esp,0FFFFFFE4
 006F8B93    xor         edx,edx
 006F8B95    mov         dword ptr [esp],edx
 006F8B98    mov         dword ptr [esp+4],edx
 006F8B9C    call        00690340
 006F8BA1    fstp        qword ptr [esp+8]
 006F8BA5    wait
 006F8BA6    fld         qword ptr [esp+8]
 006F8BAA    fabs
 006F8BAC    fstp        tbyte ptr [esp+10]
 006F8BB0    wait
 006F8BB1    fld         qword ptr [esp]
 006F8BB4    fabs
 006F8BB6    fld         tbyte ptr [esp+10]
 006F8BBA    fcompp
 006F8BBC    wait
 006F8BBD    fnstsw      al
 006F8BBF    sahf
>006F8BC0    jbe         006F8BD1
 006F8BC2    mov         eax,dword ptr [esp+8]
 006F8BC6    mov         dword ptr [esp],eax
 006F8BC9    mov         eax,dword ptr [esp+0C]
 006F8BCD    mov         dword ptr [esp+4],eax
 006F8BD1    fld         qword ptr [esp]
 006F8BD4    add         esp,1C
 006F8BD7    ret
*}
end;

//006F8BD8
procedure sub_006F8BD8;
begin
{*
 006F8BD8    add         esp,0FFFFFFE4
 006F8BDB    xor         edx,edx
 006F8BDD    mov         dword ptr [esp],edx
 006F8BE0    mov         dword ptr [esp+4],edx
 006F8BE4    call        00690790
 006F8BE9    fstp        qword ptr [esp+8]
 006F8BED    wait
 006F8BEE    fld         qword ptr [esp+8]
 006F8BF2    fabs
 006F8BF4    fstp        tbyte ptr [esp+10]
 006F8BF8    wait
 006F8BF9    fld         qword ptr [esp]
 006F8BFC    fabs
 006F8BFE    fld         tbyte ptr [esp+10]
 006F8C02    fcompp
 006F8C04    wait
 006F8C05    fnstsw      al
 006F8C07    sahf
>006F8C08    jbe         006F8C19
 006F8C0A    mov         eax,dword ptr [esp+8]
 006F8C0E    mov         dword ptr [esp],eax
 006F8C11    mov         eax,dword ptr [esp+0C]
 006F8C15    mov         dword ptr [esp+4],eax
 006F8C19    fld         qword ptr [esp]
 006F8C1C    add         esp,1C
 006F8C1F    ret
*}
end;

//006F8C20
procedure sub_006F8C20;
begin
{*
 006F8C20    add         esp,0FFFFFFE4
 006F8C23    xor         edx,edx
 006F8C25    mov         dword ptr [esp],edx
 006F8C28    mov         dword ptr [esp+4],edx
 006F8C2C    call        00690568
 006F8C31    fstp        qword ptr [esp+8]
 006F8C35    wait
 006F8C36    fld         qword ptr [esp+8]
 006F8C3A    fabs
 006F8C3C    fstp        tbyte ptr [esp+10]
 006F8C40    wait
 006F8C41    fld         qword ptr [esp]
 006F8C44    fabs
 006F8C46    fld         tbyte ptr [esp+10]
 006F8C4A    fcompp
 006F8C4C    wait
 006F8C4D    fnstsw      al
 006F8C4F    sahf
>006F8C50    jbe         006F8C61
 006F8C52    mov         eax,dword ptr [esp+8]
 006F8C56    mov         dword ptr [esp],eax
 006F8C59    mov         eax,dword ptr [esp+0C]
 006F8C5D    mov         dword ptr [esp+4],eax
 006F8C61    fld         qword ptr [esp]
 006F8C64    add         esp,1C
 006F8C67    ret
*}
end;

//006F8C68
procedure TAnyValue.GetValue;
begin
{*
 006F8C68    push        ebx
 006F8C69    push        esi
 006F8C6A    push        edi
 006F8C6B    push        ebp
 006F8C6C    add         esp,0FFFFFFBC
 006F8C6F    mov         edi,eax
 006F8C71    call        0074BF10
 006F8C76    mov         esi,eax
 006F8C78    mov         eax,esi
 006F8C7A    call        TWiimoteManager.AnyCount
 006F8C7F    mov         ebp,eax
 006F8C81    call        006EE450
 006F8C86    mov         dword ptr [esp+0C],eax
 006F8C8A    mov         ebx,dword ptr [edi+18];TAnyValue...........................................................
 006F8C8D    mov         edx,ebx
 006F8C8F    mov         eax,esi
 006F8C91    call        TWiimoteManager.GetAny
 006F8C96    mov         dword ptr [esp+10],eax
 006F8C9A    test        ebx,ebx
>006F8C9C    jg          006F8CA6
 006F8C9E    xor         eax,eax
 006F8CA0    mov         dword ptr [esp+8],eax
>006F8CA4    jmp         006F8CBC
 006F8CA6    cmp         ebp,ebx
>006F8CA8    jl          006F8CB4
 006F8CAA    mov         dword ptr [esp+8],0FFFFFFFF
>006F8CB2    jmp         006F8CBC
 006F8CB4    mov         eax,ebx
 006F8CB6    sub         eax,ebp
 006F8CB8    mov         dword ptr [esp+8],eax
 006F8CBC    test        ebx,ebx
>006F8CBE    jg          006F8CC4
 006F8CC0    xor         ebp,ebp
>006F8CC2    jmp         006F8CDD
 006F8CC4    mov         eax,dword ptr [esp+0C]
 006F8CC8    add         eax,ebp
 006F8CCA    cmp         ebx,eax
>006F8CCC    jg          006F8CD3
 006F8CCE    or          ebp,0FFFFFFFF
>006F8CD1    jmp         006F8CDD
 006F8CD3    mov         eax,ebx
 006F8CD5    sub         eax,ebp
 006F8CD7    sub         eax,dword ptr [esp+0C]
 006F8CDB    mov         ebp,eax
 006F8CDD    mov         eax,dword ptr [edi+20];TAnyValue.......................................Item:Integer
 006F8CE0    cmp         eax,10C
>006F8CE5    ja          006FBAEE
 006F8CEB    jmp         dword ptr [eax*4+6F8CF2]
 006F8CEB    dd          006F9126
 006F8CEB    dd          006F978C
 006F8CEB    dd          006F97AE
 006F8CEB    dd          006F97D0
 006F8CEB    dd          006F97F2
 006F8CEB    dd          006F9814
 006F8CEB    dd          006F99B0
 006F8CEB    dd          006F9A51
 006F8CEB    dd          006F98F1
 006F8CEB    dd          006FA388
 006F8CEB    dd          006FA3CF
 006F8CEB    dd          006FA66A
 006F8CEB    dd          006FA258
 006F8CEB    dd          006FA2E6
 006F8CEB    dd          006FA29F
 006F8CEB    dd          006FA337
 006F8CEB    dd          006FA13C
 006F8CEB    dd          006FA0F5
 006F8CEB    dd          006FA183
 006F8CEB    dd          006FA0AE
 006F8CEB    dd          006FA416
 006F8CEB    dd          006FA45D
 006F8CEB    dd          006FA4A4
 006F8CEB    dd          006FA4F5
 006F8CEB    dd          006FA685
 006F8CEB    dd          006FA6CC
 006F8CEB    dd          006FA713
 006F8CEB    dd          006FA75A
 006F8CEB    dd          006FA7A1
 006F8CEB    dd          006FA7E8
 006F8CEB    dd          006F9B80
 006F8CEB    dd          006F9BC7
 006F8CEB    dd          006F9AF2
 006F8CEB    dd          006F9B39
 006F8CEB    dd          006F99F2
 006F8CEB    dd          006F9A93
 006F8CEB    dd          006F9874
 006F8CEB    dd          006F9951
 006F8CEB    dd          006FA82F
 006F8CEB    dd          006FA876
 006F8CEB    dd          006FA8BD
 006F8CEB    dd          006F9874
 006F8CEB    dd          006F9951
 006F8CEB    dd          006F99F2
 006F8CEB    dd          006F9A93
 006F8CEB    dd          006F914F
 006F8CEB    dd          006F9161
 006F8CEB    dd          006F9C0E
 006F8CEB    dd          006F9C6C
 006F8CEB    dd          006FA591
 006F8CEB    dd          006FA546
 006F8CEB    dd          006FA5DC
 006F8CEB    dd          006FA623
 006F8CEB    dd          006F9E0A
 006F8CEB    dd          006F9E9A
 006F8CEB    dd          006F9F2A
 006F8CEB    dd          006F9FCA
 006F8CEB    dd          006FA06A
 006F8CEB    dd          006FA08C
 006F8CEB    dd          006F9670
 006F8CEB    dd          006F96B7
 006F8CEB    dd          006F96FE
 006F8CEB    dd          006F9745
 006F8CEB    dd          006F9CCA
 006F8CEB    dd          006F9D6A
 006F8CEB    dd          006FA1CA
 006F8CEB    dd          006FA211
 006F8CEB    dd          006F91DB
 006F8CEB    dd          006F9222
 006F8CEB    dd          006F9269
 006F8CEB    dd          006F92B0
 006F8CEB    dd          006F92F7
 006F8CEB    dd          006F933E
 006F8CEB    dd          006F9385
 006F8CEB    dd          006F93D6
 006F8CEB    dd          006F9427
 006F8CEB    dd          006F946E
 006F8CEB    dd          006F94B5
 006F8CEB    dd          006F94FC
 006F8CEB    dd          006F9543
 006F8CEB    dd          006F958A
 006F8CEB    dd          006F95D1
 006F8CEB    dd          006F9606
 006F8CEB    dd          006F963B
 006F8CEB    dd          006F916F
 006F8CEB    dd          006F9181
 006F8CEB    dd          006F9193
 006F8CEB    dd          006F91B7
 006F8CEB    dd          006F91C9
 006F8CEB    dd          006F91A5
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FA8FF
 006F8CEB    dd          006FAA3A
 006F8CEB    dd          006FAA68
 006F8CEB    dd          006FAA96
 006F8CEB    dd          006FAB20
 006F8CEB    dd          006FA926
 006F8CEB    dd          006FA954
 006F8CEB    dd          006FA982
 006F8CEB    dd          006FA9B0
 006F8CEB    dd          006FAAC4
 006F8CEB    dd          006FAAF2
 006F8CEB    dd          006FA9DE
 006F8CEB    dd          006FAA0C
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FBAEE
 006F8CEB    dd          006FAB4E
 006F8CEB    dd          006FADF6
 006F8CEB    dd          006FAB70
 006F8CEB    dd          006FAE18
 006F8CEB    dd          006FAB92
 006F8CEB    dd          006FAE3A
 006F8CEB    dd          006FABB4
 006F8CEB    dd          006FAE5C
 006F8CEB    dd          006FABD6
 006F8CEB    dd          006FACA2
 006F8CEB    dd          006FAF06
 006F8CEB    dd          006FACC4
 006F8CEB    dd          006FAF28
 006F8CEB    dd          006FACE6
 006F8CEB    dd          006FAF4A
 006F8CEB    dd          006FAD08
 006F8CEB    dd          006FAF6C
 006F8CEB    dd          006FAD2A
 006F8CEB    dd          006FABF8
 006F8CEB    dd          006FAE7E
 006F8CEB    dd          006FAC1A
 006F8CEB    dd          006FAEA0
 006F8CEB    dd          006FAC3C
 006F8CEB    dd          006FAEC2
 006F8CEB    dd          006FAC5E
 006F8CEB    dd          006FAEE4
 006F8CEB    dd          006FAC80
 006F8CEB    dd          006FAD4C
 006F8CEB    dd          006FAF8E
 006F8CEB    dd          006FAD6E
 006F8CEB    dd          006FAFB0
 006F8CEB    dd          006FAD90
 006F8CEB    dd          006FAFD2
 006F8CEB    dd          006FADB2
 006F8CEB    dd          006FAFF4
 006F8CEB    dd          006FADD4
 006F8CEB    dd          006FB016
 006F8CEB    dd          006FB676
 006F8CEB    dd          006FB038
 006F8CEB    dd          006FB698
 006F8CEB    dd          006FB05A
 006F8CEB    dd          006FB6BA
 006F8CEB    dd          006FB07C
 006F8CEB    dd          006FB6DC
 006F8CEB    dd          006FB09E
 006F8CEB    dd          006FB0C0
 006F8CEB    dd          006FB0E2
 006F8CEB    dd          006FB6FE
 006F8CEB    dd          006FB104
 006F8CEB    dd          006FB720
 006F8CEB    dd          006FB126
 006F8CEB    dd          006FB742
 006F8CEB    dd          006FB148
 006F8CEB    dd          006FB764
 006F8CEB    dd          006FB16A
 006F8CEB    dd          006FB18C
 006F8CEB    dd          006FBACF
 006F8CEB    dd          006FBAB0
 006F8CEB    dd          006FB1AE
 006F8CEB    dd          006FB786
 006F8CEB    dd          006FB1D0
 006F8CEB    dd          006FB7A8
 006F8CEB    dd          006FB1F2
 006F8CEB    dd          006FB7CA
 006F8CEB    dd          006FB214
 006F8CEB    dd          006FB7EC
 006F8CEB    dd          006FB236
 006F8CEB    dd          006FB258
 006F8CEB    dd          006FB27A
 006F8CEB    dd          006FB80E
 006F8CEB    dd          006FB29C
 006F8CEB    dd          006FB830
 006F8CEB    dd          006FB2BE
 006F8CEB    dd          006FB852
 006F8CEB    dd          006FB2E0
 006F8CEB    dd          006FB874
 006F8CEB    dd          006FB302
 006F8CEB    dd          006FB324
 006F8CEB    dd          006FB346
 006F8CEB    dd          006FB896
 006F8CEB    dd          006FB368
 006F8CEB    dd          006FB8B8
 006F8CEB    dd          006FB38A
 006F8CEB    dd          006FB8DA
 006F8CEB    dd          006FB3AC
 006F8CEB    dd          006FB8FC
 006F8CEB    dd          006FB3CE
 006F8CEB    dd          006FB3F0
 006F8CEB    dd          006FB412
 006F8CEB    dd          006FB91E
 006F8CEB    dd          006FB434
 006F8CEB    dd          006FB940
 006F8CEB    dd          006FB456
 006F8CEB    dd          006FB962
 006F8CEB    dd          006FB478
 006F8CEB    dd          006FB984
 006F8CEB    dd          006FB49A
 006F8CEB    dd          006FB4BC
 006F8CEB    dd          006FB4DE
 006F8CEB    dd          006FB9A6
 006F8CEB    dd          006FB500
 006F8CEB    dd          006FB9C8
 006F8CEB    dd          006FB522
 006F8CEB    dd          006FB9EA
 006F8CEB    dd          006FB544
 006F8CEB    dd          006FBA0C
 006F8CEB    dd          006FB566
 006F8CEB    dd          006FB588
 006F8CEB    dd          006FB5AA
 006F8CEB    dd          006FBA2E
 006F8CEB    dd          006FB5CC
 006F8CEB    dd          006FBA50
 006F8CEB    dd          006FB5EE
 006F8CEB    dd          006FBA72
 006F8CEB    dd          006FB610
 006F8CEB    dd          006FBA91
 006F8CEB    dd          006FB632
 006F8CEB    dd          006FB654
 006F9126    cmp         byte ptr ds:[82299D],0;gvar_0082299D
>006F912D    jne         006F913F
 006F912F    xor         eax,eax
 006F9131    call        00686074
 006F9136    fstp        qword ptr [esp]
 006F9139    wait
>006F913A    jmp         006FBAF7
 006F913F    mov         al,1
 006F9141    call        00686074
 006F9146    fstp        qword ptr [esp]
 006F9149    wait
>006F914A    jmp         006FBAF7
 006F914F    mov         edx,ebx
 006F9151    mov         eax,esi
 006F9153    call        TWiimoteManager.AnyGetRumble
 006F9158    fstp        qword ptr [esp]
 006F915B    wait
>006F915C    jmp         006FBAF7
 006F9161    xor         eax,eax
 006F9163    mov         dword ptr [esp],eax
 006F9166    mov         dword ptr [esp+4],eax
>006F916A    jmp         006FBAF7
 006F916F    mov         edx,ebx
 006F9171    mov         eax,esi
 006F9173    call        TWiimoteManager.AnyPitch
 006F9178    fstp        qword ptr [esp]
 006F917B    wait
>006F917C    jmp         006FBAF7
 006F9181    mov         edx,ebx
 006F9183    mov         eax,esi
 006F9185    call        TWiimoteManager.AnyRoll
 006F918A    fstp        qword ptr [esp]
 006F918D    wait
>006F918E    jmp         006FBAF7
 006F9193    mov         edx,ebx
 006F9195    mov         eax,esi
 006F9197    call        TWiimoteManager.AnyYaw
 006F919C    fstp        qword ptr [esp]
 006F919F    wait
>006F91A0    jmp         006FBAF7
 006F91A5    mov         edx,ebx
 006F91A7    mov         eax,esi
 006F91A9    call        TWiimoteManager.AnySteeringAngle
 006F91AE    fstp        qword ptr [esp]
 006F91B1    wait
>006F91B2    jmp         006FBAF7
 006F91B7    mov         edx,ebx
 006F91B9    mov         eax,esi
 006F91BB    call        TWiimoteManager.AnySmoothPitch
 006F91C0    fstp        qword ptr [esp]
 006F91C3    wait
>006F91C4    jmp         006FBAF7
 006F91C9    mov         edx,ebx
 006F91CB    mov         eax,esi
 006F91CD    call        TWiimoteManager.AnySmoothRoll
 006F91D2    fstp        qword ptr [esp]
 006F91D5    wait
>006F91D6    jmp         006FBAF7
 006F91DB    mov         edx,ebx
 006F91DD    mov         eax,esi
 006F91DF    call        TWiimoteManager.AnyButton1
 006F91E4    test        al,al
>006F91E6    jne         006F920E
 006F91E8    mov         edx,1000
 006F91ED    mov         eax,dword ptr [esp+8]
 006F91F1    call        006EE46C
 006F91F6    test        al,al
>006F91F8    jne         006F920E
 006F91FA    mov         edx,1
 006F91FF    mov         eax,ebp
 006F9201    call        0068FD18
 006F9206    test        al,al
>006F9208    jne         006F920E
 006F920A    xor         eax,eax
>006F920C    jmp         006F9210
 006F920E    mov         al,1
 006F9210    mov         ebx,eax
 006F9212    mov         eax,ebx
 006F9214    call        00686074
 006F9219    fstp        qword ptr [esp]
 006F921C    wait
>006F921D    jmp         006FBAF7
 006F9222    mov         edx,ebx
 006F9224    mov         eax,esi
 006F9226    call        TWiimoteManager.AnyButton2
 006F922B    test        al,al
>006F922D    jne         006F9255
 006F922F    mov         edx,2000
 006F9234    mov         eax,dword ptr [esp+8]
 006F9238    call        006EE46C
 006F923D    test        al,al
>006F923F    jne         006F9255
 006F9241    mov         edx,2
 006F9246    mov         eax,ebp
 006F9248    call        0068FD18
 006F924D    test        al,al
>006F924F    jne         006F9255
 006F9251    xor         eax,eax
>006F9253    jmp         006F9257
 006F9255    mov         al,1
 006F9257    mov         ebx,eax
 006F9259    mov         eax,ebx
 006F925B    call        00686074
 006F9260    fstp        qword ptr [esp]
 006F9263    wait
>006F9264    jmp         006FBAF7
 006F9269    mov         edx,ebx
 006F926B    mov         eax,esi
 006F926D    call        TWiimoteManager.AnyButton3
 006F9272    test        al,al
>006F9274    jne         006F929C
 006F9276    mov         edx,4000
 006F927B    mov         eax,dword ptr [esp+8]
 006F927F    call        006EE46C
 006F9284    test        al,al
>006F9286    jne         006F929C
 006F9288    mov         edx,3
 006F928D    mov         eax,ebp
 006F928F    call        0068FD18
 006F9294    test        al,al
>006F9296    jne         006F929C
 006F9298    xor         eax,eax
>006F929A    jmp         006F929E
 006F929C    mov         al,1
 006F929E    mov         ebx,eax
 006F92A0    mov         eax,ebx
 006F92A2    call        00686074
 006F92A7    fstp        qword ptr [esp]
 006F92AA    wait
>006F92AB    jmp         006FBAF7
 006F92B0    mov         edx,ebx
 006F92B2    mov         eax,esi
 006F92B4    call        TWiimoteManager.AnyButton4
 006F92B9    test        al,al
>006F92BB    jne         006F92E3
 006F92BD    mov         edx,8000
 006F92C2    mov         eax,dword ptr [esp+8]
 006F92C6    call        006EE46C
 006F92CB    test        al,al
>006F92CD    jne         006F92E3
 006F92CF    mov         edx,4
 006F92D4    mov         eax,ebp
 006F92D6    call        0068FD18
 006F92DB    test        al,al
>006F92DD    jne         006F92E3
 006F92DF    xor         eax,eax
>006F92E1    jmp         006F92E5
 006F92E3    mov         al,1
 006F92E5    mov         ebx,eax
 006F92E7    mov         eax,ebx
 006F92E9    call        00686074
 006F92EE    fstp        qword ptr [esp]
 006F92F1    wait
>006F92F2    jmp         006FBAF7
 006F92F7    mov         edx,ebx
 006F92F9    mov         eax,esi
 006F92FB    call        TWiimoteManager.AnyButton5
 006F9300    test        al,al
>006F9302    jne         006F932A
 006F9304    mov         edx,100
 006F9309    mov         eax,dword ptr [esp+8]
 006F930D    call        006EE46C
 006F9312    test        al,al
>006F9314    jne         006F932A
 006F9316    mov         edx,5
 006F931B    mov         eax,ebp
 006F931D    call        0068FD18
 006F9322    test        al,al
>006F9324    jne         006F932A
 006F9326    xor         eax,eax
>006F9328    jmp         006F932C
 006F932A    mov         al,1
 006F932C    mov         ebx,eax
 006F932E    mov         eax,ebx
 006F9330    call        00686074
 006F9335    fstp        qword ptr [esp]
 006F9338    wait
>006F9339    jmp         006FBAF7
 006F933E    mov         edx,ebx
 006F9340    mov         eax,esi
 006F9342    call        TWiimoteManager.AnyButton6
 006F9347    test        al,al
>006F9349    jne         006F9371
 006F934B    mov         edx,200
 006F9350    mov         eax,dword ptr [esp+8]
 006F9354    call        006EE46C
 006F9359    test        al,al
>006F935B    jne         006F9371
 006F935D    mov         edx,6
 006F9362    mov         eax,ebp
 006F9364    call        0068FD18
 006F9369    test        al,al
>006F936B    jne         006F9371
 006F936D    xor         eax,eax
>006F936F    jmp         006F9373
 006F9371    mov         al,1
 006F9373    mov         ebx,eax
 006F9375    mov         eax,ebx
 006F9377    call        00686074
 006F937C    fstp        qword ptr [esp]
 006F937F    wait
>006F9380    jmp         006FBAF7
 006F9385    mov         edx,ebx
 006F9387    mov         eax,esi
 006F9389    call        TWiimoteManager.AnyButton7
 006F938E    test        al,al
>006F9390    jne         006F93C2
 006F9392    mov         edx,1
 006F9397    mov         eax,dword ptr [esp+8]
 006F939B    call        006EE4E4
 006F93A0    fld         tbyte ptr ds:[6FBB04];0.3:Extended
 006F93A6    fcompp
 006F93A8    wait
 006F93A9    fnstsw      al
 006F93AB    sahf
>006F93AC    jbe         006F93C2
 006F93AE    mov         edx,7
 006F93B3    mov         eax,ebp
 006F93B5    call        0068FD18
 006F93BA    test        al,al
>006F93BC    jne         006F93C2
 006F93BE    xor         eax,eax
>006F93C0    jmp         006F93C4
 006F93C2    mov         al,1
 006F93C4    mov         ebx,eax
 006F93C6    mov         eax,ebx
 006F93C8    call        00686074
 006F93CD    fstp        qword ptr [esp]
 006F93D0    wait
>006F93D1    jmp         006FBAF7
 006F93D6    mov         edx,ebx
 006F93D8    mov         eax,esi
 006F93DA    call        TWiimoteManager.AnyButton8
 006F93DF    test        al,al
>006F93E1    jne         006F9413
 006F93E3    mov         edx,2
 006F93E8    mov         eax,dword ptr [esp+8]
 006F93EC    call        006EE4E4
 006F93F1    fld         tbyte ptr ds:[6FBB04];0.3:Extended
 006F93F7    fcompp
 006F93F9    wait
 006F93FA    fnstsw      al
 006F93FC    sahf
>006F93FD    jbe         006F9413
 006F93FF    mov         edx,8
 006F9404    mov         eax,ebp
 006F9406    call        0068FD18
 006F940B    test        al,al
>006F940D    jne         006F9413
 006F940F    xor         eax,eax
>006F9411    jmp         006F9415
 006F9413    mov         al,1
 006F9415    mov         ebx,eax
 006F9417    mov         eax,ebx
 006F9419    call        00686074
 006F941E    fstp        qword ptr [esp]
 006F9421    wait
>006F9422    jmp         006FBAF7
 006F9427    mov         edx,ebx
 006F9429    mov         eax,esi
 006F942B    call        TWiimoteManager.AnyButton9
 006F9430    test        al,al
>006F9432    jne         006F945A
 006F9434    mov         edx,40
 006F9439    mov         eax,dword ptr [esp+8]
 006F943D    call        006EE46C
 006F9442    test        al,al
>006F9444    jne         006F945A
 006F9446    mov         edx,9
 006F944B    mov         eax,ebp
 006F944D    call        0068FD18
 006F9452    test        al,al
>006F9454    jne         006F945A
 006F9456    xor         eax,eax
>006F9458    jmp         006F945C
 006F945A    mov         al,1
 006F945C    mov         ebx,eax
 006F945E    mov         eax,ebx
 006F9460    call        00686074
 006F9465    fstp        qword ptr [esp]
 006F9468    wait
>006F9469    jmp         006FBAF7
 006F946E    mov         edx,ebx
 006F9470    mov         eax,esi
 006F9472    call        TWiimoteManager.AnyButton10
 006F9477    test        al,al
>006F9479    jne         006F94A1
 006F947B    mov         edx,80
 006F9480    mov         eax,dword ptr [esp+8]
 006F9484    call        006EE46C
 006F9489    test        al,al
>006F948B    jne         006F94A1
 006F948D    mov         edx,0A
 006F9492    mov         eax,ebp
 006F9494    call        0068FD18
 006F9499    test        al,al
>006F949B    jne         006F94A1
 006F949D    xor         eax,eax
>006F949F    jmp         006F94A3
 006F94A1    mov         al,1
 006F94A3    mov         ebx,eax
 006F94A5    mov         eax,ebx
 006F94A7    call        00686074
 006F94AC    fstp        qword ptr [esp]
 006F94AF    wait
>006F94B0    jmp         006FBAF7
 006F94B5    mov         edx,ebx
 006F94B7    mov         eax,esi
 006F94B9    call        TWiimoteManager.AnyButton11
 006F94BE    test        al,al
>006F94C0    jne         006F94E8
 006F94C2    mov         edx,1
 006F94C7    mov         eax,dword ptr [esp+8]
 006F94CB    call        006EE46C
 006F94D0    test        al,al
>006F94D2    jne         006F94E8
 006F94D4    mov         edx,0B
 006F94D9    mov         eax,ebp
 006F94DB    call        0068FD18
 006F94E0    test        al,al
>006F94E2    jne         006F94E8
 006F94E4    xor         eax,eax
>006F94E6    jmp         006F94EA
 006F94E8    mov         al,1
 006F94EA    mov         ebx,eax
 006F94EC    mov         eax,ebx
 006F94EE    call        00686074
 006F94F3    fstp        qword ptr [esp]
 006F94F6    wait
>006F94F7    jmp         006FBAF7
 006F94FC    mov         edx,ebx
 006F94FE    mov         eax,esi
 006F9500    call        TWiimoteManager.AnyButton12
 006F9505    test        al,al
>006F9507    jne         006F952F
 006F9509    mov         edx,2
 006F950E    mov         eax,dword ptr [esp+8]
 006F9512    call        006EE46C
 006F9517    test        al,al
>006F9519    jne         006F952F
 006F951B    mov         edx,0C
 006F9520    mov         eax,ebp
 006F9522    call        0068FD18
 006F9527    test        al,al
>006F9529    jne         006F952F
 006F952B    xor         eax,eax
>006F952D    jmp         006F9531
 006F952F    mov         al,1
 006F9531    mov         ebx,eax
 006F9533    mov         eax,ebx
 006F9535    call        00686074
 006F953A    fstp        qword ptr [esp]
 006F953D    wait
>006F953E    jmp         006FBAF7
 006F9543    mov         edx,ebx
 006F9545    mov         eax,esi
 006F9547    call        TWiimoteManager.AnyButton13
 006F954C    test        al,al
>006F954E    jne         006F9576
 006F9550    mov         edx,4
 006F9555    mov         eax,dword ptr [esp+8]
 006F9559    call        006EE46C
 006F955E    test        al,al
>006F9560    jne         006F9576
 006F9562    mov         edx,0D
 006F9567    mov         eax,ebp
 006F9569    call        0068FD18
 006F956E    test        al,al
>006F9570    jne         006F9576
 006F9572    xor         eax,eax
>006F9574    jmp         006F9578
 006F9576    mov         al,1
 006F9578    mov         ebx,eax
 006F957A    mov         eax,ebx
 006F957C    call        00686074
 006F9581    fstp        qword ptr [esp]
 006F9584    wait
>006F9585    jmp         006FBAF7
 006F958A    mov         edx,ebx
 006F958C    mov         eax,esi
 006F958E    call        TWiimoteManager.AnyButton14
 006F9593    test        al,al
>006F9595    jne         006F95BD
 006F9597    mov         edx,8
 006F959C    mov         eax,dword ptr [esp+8]
 006F95A0    call        006EE46C
 006F95A5    test        al,al
>006F95A7    jne         006F95BD
 006F95A9    mov         edx,0E
 006F95AE    mov         eax,ebp
 006F95B0    call        0068FD18
 006F95B5    test        al,al
>006F95B7    jne         006F95BD
 006F95B9    xor         eax,eax
>006F95BB    jmp         006F95BF
 006F95BD    mov         al,1
 006F95BF    mov         ebx,eax
 006F95C1    mov         eax,ebx
 006F95C3    call        00686074
 006F95C8    fstp        qword ptr [esp]
 006F95CB    wait
>006F95CC    jmp         006FBAF7
 006F95D1    mov         edx,ebx
 006F95D3    mov         eax,esi
 006F95D5    call        TWiimoteManager.AnyButton15
 006F95DA    test        al,al
>006F95DC    jne         006F95F2
 006F95DE    mov         edx,0F
 006F95E3    mov         eax,ebp
 006F95E5    call        0068FD18
 006F95EA    test        al,al
>006F95EC    jne         006F95F2
 006F95EE    xor         eax,eax
>006F95F0    jmp         006F95F4
 006F95F2    mov         al,1
 006F95F4    mov         ebx,eax
 006F95F6    mov         eax,ebx
 006F95F8    call        00686074
 006F95FD    fstp        qword ptr [esp]
 006F9600    wait
>006F9601    jmp         006FBAF7
 006F9606    mov         edx,ebx
 006F9608    mov         eax,esi
 006F960A    call        TWiimoteManager.AnyButton16
 006F960F    test        al,al
>006F9611    jne         006F9627
 006F9613    mov         edx,10
 006F9618    mov         eax,ebp
 006F961A    call        0068FD18
 006F961F    test        al,al
>006F9621    jne         006F9627
 006F9623    xor         eax,eax
>006F9625    jmp         006F9629
 006F9627    mov         al,1
 006F9629    mov         ebx,eax
 006F962B    mov         eax,ebx
 006F962D    call        00686074
 006F9632    fstp        qword ptr [esp]
 006F9635    wait
>006F9636    jmp         006FBAF7
 006F963B    mov         edx,ebx
 006F963D    mov         eax,esi
 006F963F    call        TWiimoteManager.AnyButton17
 006F9644    test        al,al
>006F9646    jne         006F965C
 006F9648    mov         edx,11
 006F964D    mov         eax,ebp
 006F964F    call        0068FD18
 006F9654    test        al,al
>006F9656    jne         006F965C
 006F9658    xor         eax,eax
>006F965A    jmp         006F965E
 006F965C    mov         al,1
 006F965E    mov         ebx,eax
 006F9660    mov         eax,ebx
 006F9662    call        00686074
 006F9667    fstp        qword ptr [esp]
 006F966A    wait
>006F966B    jmp         006FBAF7
 006F9670    mov         edx,ebx
 006F9672    mov         eax,esi
 006F9674    call        TWiimoteManager.AnyOKButton
 006F9679    test        al,al
>006F967B    jne         006F96A3
 006F967D    mov         edx,1000
 006F9682    mov         eax,dword ptr [esp+8]
 006F9686    call        006EE46C
 006F968B    test        al,al
>006F968D    jne         006F96A3
 006F968F    mov         edx,1
 006F9694    mov         eax,ebp
 006F9696    call        0068FD18
 006F969B    test        al,al
>006F969D    jne         006F96A3
 006F969F    xor         eax,eax
>006F96A1    jmp         006F96A5
 006F96A3    mov         al,1
 006F96A5    mov         ebx,eax
 006F96A7    mov         eax,ebx
 006F96A9    call        00686074
 006F96AE    fstp        qword ptr [esp]
 006F96B1    wait
>006F96B2    jmp         006FBAF7
 006F96B7    mov         edx,ebx
 006F96B9    mov         eax,esi
 006F96BB    call        TWiimoteManager.AnyOKButton
 006F96C0    test        al,al
>006F96C2    jne         006F96EA
 006F96C4    mov         edx,20
 006F96C9    mov         eax,dword ptr [esp+8]
 006F96CD    call        006EE46C
 006F96D2    test        al,al
>006F96D4    jne         006F96EA
 006F96D6    mov         edx,2
 006F96DB    mov         eax,ebp
 006F96DD    call        0068FD18
 006F96E2    test        al,al
>006F96E4    jne         006F96EA
 006F96E6    xor         eax,eax
>006F96E8    jmp         006F96EC
 006F96EA    mov         al,1
 006F96EC    mov         ebx,eax
 006F96EE    mov         eax,ebx
 006F96F0    call        00686074
 006F96F5    fstp        qword ptr [esp]
 006F96F8    wait
>006F96F9    jmp         006FBAF7
 006F96FE    mov         edx,ebx
 006F9700    mov         eax,esi
 006F9702    call        TWiimoteManager.AnyOtherButton1
 006F9707    test        al,al
>006F9709    jne         006F9731
 006F970B    mov         edx,2000
 006F9710    mov         eax,dword ptr [esp+8]
 006F9714    call        006EE46C
 006F9719    test        al,al
>006F971B    jne         006F9731
 006F971D    mov         edx,3
 006F9722    mov         eax,ebp
 006F9724    call        0068FD18
 006F9729    test        al,al
>006F972B    jne         006F9731
 006F972D    xor         eax,eax
>006F972F    jmp         006F9733
 006F9731    mov         al,1
 006F9733    mov         ebx,eax
 006F9735    mov         eax,ebx
 006F9737    call        00686074
 006F973C    fstp        qword ptr [esp]
 006F973F    wait
>006F9740    jmp         006FBAF7
 006F9745    mov         edx,ebx
 006F9747    mov         eax,esi
 006F9749    call        TWiimoteManager.AnyOtherButton2
 006F974E    test        al,al
>006F9750    jne         006F9778
 006F9752    mov         edx,4000
 006F9757    mov         eax,dword ptr [esp+8]
 006F975B    call        006EE46C
 006F9760    test        al,al
>006F9762    jne         006F9778
 006F9764    mov         edx,4
 006F9769    mov         eax,ebp
 006F976B    call        0068FD18
 006F9770    test        al,al
>006F9772    jne         006F9778
 006F9774    xor         eax,eax
>006F9776    jmp         006F977A
 006F9778    mov         al,1
 006F977A    mov         ebx,eax
 006F977C    mov         eax,ebx
 006F977E    call        00686074
 006F9783    fstp        qword ptr [esp]
 006F9786    wait
>006F9787    jmp         006FBAF7
 006F978C    mov         edx,ebx
 006F978E    mov         eax,esi
 006F9790    call        TWiimoteManager.AnyLeftStickX
 006F9795    fstp        qword ptr [esp+14]
 006F9799    wait
 006F979A    mov         eax,ebp
 006F979C    call        006F8B48
 006F97A1    fadd        qword ptr [esp+14]
 006F97A5    fstp        qword ptr [esp]
 006F97A8    wait
>006F97A9    jmp         006FBAF7
 006F97AE    mov         edx,ebx
 006F97B0    mov         eax,esi
 006F97B2    call        TWiimoteManager.AnyLeftStickY
 006F97B7    fstp        qword ptr [esp+14]
 006F97BB    wait
 006F97BC    mov         eax,ebp
 006F97BE    call        006F8B90
 006F97C3    fadd        qword ptr [esp+14]
 006F97C7    fstp        qword ptr [esp]
 006F97CA    wait
>006F97CB    jmp         006FBAF7
 006F97D0    mov         edx,ebx
 006F97D2    mov         eax,esi
 006F97D4    call        TWiimoteManager.AnyRightStickX
 006F97D9    fstp        qword ptr [esp+14]
 006F97DD    wait
 006F97DE    mov         eax,ebp
 006F97E0    call        006F8BD8
 006F97E5    fadd        qword ptr [esp+14]
 006F97E9    fstp        qword ptr [esp]
 006F97EC    wait
>006F97ED    jmp         006FBAF7
 006F97F2    mov         edx,ebx
 006F97F4    mov         eax,esi
 006F97F6    call        TWiimoteManager.AnyRightStickY
 006F97FB    fstp        qword ptr [esp+14]
 006F97FF    wait
 006F9800    mov         eax,ebp
 006F9802    call        006F8C20
 006F9807    fadd        qword ptr [esp+14]
 006F980B    fstp        qword ptr [esp]
 006F980E    wait
>006F980F    jmp         006FBAF7
 006F9814    mov         edx,ebx
 006F9816    mov         eax,esi
 006F9818    call        TWiimoteManager.AnyDPadLeft
 006F981D    test        al,al
>006F981F    jne         006F9842
 006F9821    mov         edx,4
 006F9826    mov         eax,dword ptr [esp+8]
 006F982A    call        006EE46C
 006F982F    test        al,al
>006F9831    jne         006F9842
 006F9833    mov         eax,ebp
 006F9835    call        0068FF78
 006F983A    test        al,al
>006F983C    jne         006F9842
 006F983E    xor         eax,eax
>006F9840    jmp         006F9844
 006F9842    mov         al,1
 006F9844    mov         ebx,eax
 006F9846    test        bl,bl
>006F9848    jne         006F9864
 006F984A    test        bl,bl
>006F984C    jne         006F9860
 006F984E    mov         eax,57
 006F9853    call        0060459C
 006F9858    test        al,al
>006F985A    jne         006F9860
 006F985C    xor         eax,eax
>006F985E    jmp         006F9862
 006F9860    mov         al,1
 006F9862    mov         ebx,eax
 006F9864    mov         eax,ebx
 006F9866    call        00686074
 006F986B    fstp        qword ptr [esp]
 006F986E    wait
>006F986F    jmp         006FBAF7
 006F9874    mov         edx,ebx
 006F9876    mov         eax,esi
 006F9878    call        TWiimoteManager.AnyLeft
 006F987D    test        al,al
>006F987F    jne         006F98A2
 006F9881    mov         edx,4
 006F9886    mov         eax,dword ptr [esp+8]
 006F988A    call        006EE46C
 006F988F    test        al,al
>006F9891    jne         006F98A2
 006F9893    mov         eax,ebp
 006F9895    call        0068FF78
 006F989A    test        al,al
>006F989C    jne         006F98A2
 006F989E    xor         eax,eax
>006F98A0    jmp         006F98A4
 006F98A2    mov         al,1
 006F98A4    mov         ebx,eax
 006F98A6    test        bl,bl
>006F98A8    jne         006F98C4
 006F98AA    test        bl,bl
>006F98AC    jne         006F98C0
 006F98AE    mov         eax,57
 006F98B3    call        0060459C
 006F98B8    test        al,al
>006F98BA    jne         006F98C0
 006F98BC    xor         eax,eax
>006F98BE    jmp         006F98C2
 006F98C0    mov         al,1
 006F98C2    mov         ebx,eax
 006F98C4    test        bl,bl
>006F98C6    jne         006F98E1
 006F98C8    mov         eax,ebp
 006F98CA    call        006F8B48
 006F98CF    fld         tbyte ptr ds:[6FBB10];-0.3:Extended
 006F98D5    fcompp
 006F98D7    wait
 006F98D8    fnstsw      al
 006F98DA    sahf
>006F98DB    ja          006F98E1
 006F98DD    xor         eax,eax
>006F98DF    jmp         006F98E3
 006F98E1    mov         al,1
 006F98E3    call        00686074
 006F98E8    fstp        qword ptr [esp]
 006F98EB    wait
>006F98EC    jmp         006FBAF7
 006F98F1    mov         edx,ebx
 006F98F3    mov         eax,esi
 006F98F5    call        TWiimoteManager.AnyDPadRight
 006F98FA    test        al,al
>006F98FC    jne         006F991F
 006F98FE    mov         edx,8
 006F9903    mov         eax,dword ptr [esp+8]
 006F9907    call        006EE46C
 006F990C    test        al,al
>006F990E    jne         006F991F
 006F9910    mov         eax,ebp
 006F9912    call        00690048
 006F9917    test        al,al
>006F9919    jne         006F991F
 006F991B    xor         eax,eax
>006F991D    jmp         006F9921
 006F991F    mov         al,1
 006F9921    mov         ebx,eax
 006F9923    test        bl,bl
>006F9925    jne         006F9941
 006F9927    test        bl,bl
>006F9929    jne         006F993D
 006F992B    mov         eax,55
 006F9930    call        0060459C
 006F9935    test        al,al
>006F9937    jne         006F993D
 006F9939    xor         eax,eax
>006F993B    jmp         006F993F
 006F993D    mov         al,1
 006F993F    mov         ebx,eax
 006F9941    mov         eax,ebx
 006F9943    call        00686074
 006F9948    fstp        qword ptr [esp]
 006F994B    wait
>006F994C    jmp         006FBAF7
 006F9951    mov         edx,ebx
 006F9953    mov         eax,esi
 006F9955    call        TWiimoteManager.AnyRight
 006F995A    test        al,al
>006F995C    jne         006F997F
 006F995E    mov         edx,8
 006F9963    mov         eax,dword ptr [esp+8]
 006F9967    call        006EE46C
 006F996C    test        al,al
>006F996E    jne         006F997F
 006F9970    mov         eax,ebp
 006F9972    call        00690048
 006F9977    test        al,al
>006F9979    jne         006F997F
 006F997B    xor         eax,eax
>006F997D    jmp         006F9981
 006F997F    mov         al,1
 006F9981    mov         ebx,eax
 006F9983    test        bl,bl
>006F9985    jne         006F99A0
 006F9987    mov         eax,ebp
 006F9989    call        006F8B48
 006F998E    fld         tbyte ptr ds:[6FBB04];0.3:Extended
 006F9994    fcompp
 006F9996    wait
 006F9997    fnstsw      al
 006F9999    sahf
>006F999A    jb          006F99A0
 006F999C    xor         eax,eax
>006F999E    jmp         006F99A2
 006F99A0    mov         al,1
 006F99A2    call        00686074
 006F99A7    fstp        qword ptr [esp]
 006F99AA    wait
>006F99AB    jmp         006FBAF7
 006F99B0    mov         edx,ebx
 006F99B2    mov         eax,esi
 006F99B4    call        TWiimoteManager.AnyDPadUp
 006F99B9    test        al,al
>006F99BB    jne         006F99DE
 006F99BD    mov         edx,1
 006F99C2    mov         eax,dword ptr [esp+8]
 006F99C6    call        006EE46C
 006F99CB    test        al,al
>006F99CD    jne         006F99DE
 006F99CF    mov         eax,ebp
 006F99D1    call        0068FD94
 006F99D6    test        al,al
>006F99D8    jne         006F99DE
 006F99DA    xor         eax,eax
>006F99DC    jmp         006F99E0
 006F99DE    mov         al,1
 006F99E0    mov         ebx,eax
 006F99E2    mov         eax,ebx
 006F99E4    call        00686074
 006F99E9    fstp        qword ptr [esp]
 006F99EC    wait
>006F99ED    jmp         006FBAF7
 006F99F2    mov         edx,ebx
 006F99F4    mov         eax,esi
 006F99F6    call        TWiimoteManager.AnyUp
 006F99FB    test        al,al
>006F99FD    jne         006F9A20
 006F99FF    mov         edx,1
 006F9A04    mov         eax,dword ptr [esp+8]
 006F9A08    call        006EE46C
 006F9A0D    test        al,al
>006F9A0F    jne         006F9A20
 006F9A11    mov         eax,ebp
 006F9A13    call        0068FD94
 006F9A18    test        al,al
>006F9A1A    jne         006F9A20
 006F9A1C    xor         eax,eax
>006F9A1E    jmp         006F9A22
 006F9A20    mov         al,1
 006F9A22    mov         ebx,eax
 006F9A24    test        bl,bl
>006F9A26    jne         006F9A41
 006F9A28    mov         eax,ebp
 006F9A2A    call        006F8B90
 006F9A2F    fld         tbyte ptr ds:[6FBB10];-0.3:Extended
 006F9A35    fcompp
 006F9A37    wait
 006F9A38    fnstsw      al
 006F9A3A    sahf
>006F9A3B    ja          006F9A41
 006F9A3D    xor         eax,eax
>006F9A3F    jmp         006F9A43
 006F9A41    mov         al,1
 006F9A43    call        00686074
 006F9A48    fstp        qword ptr [esp]
 006F9A4B    wait
>006F9A4C    jmp         006FBAF7
 006F9A51    mov         edx,ebx
 006F9A53    mov         eax,esi
 006F9A55    call        TWiimoteManager.AnyDPadDown
 006F9A5A    test        al,al
>006F9A5C    jne         006F9A7F
 006F9A5E    mov         edx,2
 006F9A63    mov         eax,dword ptr [esp+8]
 006F9A67    call        006EE46C
 006F9A6C    test        al,al
>006F9A6E    jne         006F9A7F
 006F9A70    mov         eax,ebp
 006F9A72    call        0068FEA8
 006F9A77    test        al,al
>006F9A79    jne         006F9A7F
 006F9A7B    xor         eax,eax
>006F9A7D    jmp         006F9A81
 006F9A7F    mov         al,1
 006F9A81    mov         ebx,eax
 006F9A83    mov         eax,ebx
 006F9A85    call        00686074
 006F9A8A    fstp        qword ptr [esp]
 006F9A8D    wait
>006F9A8E    jmp         006FBAF7
 006F9A93    mov         edx,ebx
 006F9A95    mov         eax,esi
 006F9A97    call        TWiimoteManager.AnyDown
 006F9A9C    test        al,al
>006F9A9E    jne         006F9AC1
 006F9AA0    mov         edx,2
 006F9AA5    mov         eax,dword ptr [esp+8]
 006F9AA9    call        006EE46C
 006F9AAE    test        al,al
>006F9AB0    jne         006F9AC1
 006F9AB2    mov         eax,ebp
 006F9AB4    call        0068FEA8
 006F9AB9    test        al,al
>006F9ABB    jne         006F9AC1
 006F9ABD    xor         eax,eax
>006F9ABF    jmp         006F9AC3
 006F9AC1    mov         al,1
 006F9AC3    mov         ebx,eax
 006F9AC5    test        bl,bl
>006F9AC7    jne         006F9AE2
 006F9AC9    mov         eax,ebp
 006F9ACB    call        006F8B90
 006F9AD0    fld         tbyte ptr ds:[6FBB04];0.3:Extended
 006F9AD6    fcompp
 006F9AD8    wait
 006F9AD9    fnstsw      al
 006F9ADB    sahf
>006F9ADC    jb          006F9AE2
 006F9ADE    xor         eax,eax
>006F9AE0    jmp         006F9AE4
 006F9AE2    mov         al,1
 006F9AE4    call        00686074
 006F9AE9    fstp        qword ptr [esp]
 006F9AEC    wait
>006F9AED    jmp         006FBAF7
 006F9AF2    mov         edx,ebx
 006F9AF4    mov         eax,esi
 006F9AF6    call        TWiimoteManager.AnyRightThumbX
 006F9AFB    fld         tbyte ptr ds:[6FBB10];-0.3:Extended
 006F9B01    fcompp
 006F9B03    wait
 006F9B04    fnstsw      al
 006F9B06    sahf
 006F9B07    seta        al
 006F9B0A    mov         ebx,eax
 006F9B0C    test        bl,bl
>006F9B0E    jne         006F9B29
 006F9B10    mov         eax,ebp
 006F9B12    call        006F8BD8
 006F9B17    fld         tbyte ptr ds:[6FBB10];-0.3:Extended
 006F9B1D    fcompp
 006F9B1F    wait
 006F9B20    fnstsw      al
 006F9B22    sahf
>006F9B23    ja          006F9B29
 006F9B25    xor         eax,eax
>006F9B27    jmp         006F9B2B
 006F9B29    mov         al,1
 006F9B2B    call        00686074
 006F9B30    fstp        qword ptr [esp]
 006F9B33    wait
>006F9B34    jmp         006FBAF7
 006F9B39    mov         edx,ebx
 006F9B3B    mov         eax,esi
 006F9B3D    call        TWiimoteManager.AnyRightThumbX
 006F9B42    fld         tbyte ptr ds:[6FBB04];0.3:Extended
 006F9B48    fcompp
 006F9B4A    wait
 006F9B4B    fnstsw      al
 006F9B4D    sahf
 006F9B4E    setb        al
 006F9B51    mov         ebx,eax
 006F9B53    test        bl,bl
>006F9B55    jne         006F9B70
 006F9B57    mov         eax,ebp
 006F9B59    call        006F8BD8
 006F9B5E    fld         tbyte ptr ds:[6FBB04];0.3:Extended
 006F9B64    fcompp
 006F9B66    wait
 006F9B67    fnstsw      al
 006F9B69    sahf
>006F9B6A    jb          006F9B70
 006F9B6C    xor         eax,eax
>006F9B6E    jmp         006F9B72
 006F9B70    mov         al,1
 006F9B72    call        00686074
 006F9B77    fstp        qword ptr [esp]
 006F9B7A    wait
>006F9B7B    jmp         006FBAF7
 006F9B80    mov         edx,ebx
 006F9B82    mov         eax,esi
 006F9B84    call        TWiimoteManager.AnyRightThumbY
 006F9B89    fld         tbyte ptr ds:[6FBB10];-0.3:Extended
 006F9B8F    fcompp
 006F9B91    wait
 006F9B92    fnstsw      al
 006F9B94    sahf
 006F9B95    seta        al
 006F9B98    mov         ebx,eax
 006F9B9A    test        bl,bl
>006F9B9C    jne         006F9BB7
 006F9B9E    mov         eax,ebp
 006F9BA0    call        006F8C20
 006F9BA5    fld         tbyte ptr ds:[6FBB10];-0.3:Extended
 006F9BAB    fcompp
 006F9BAD    wait
 006F9BAE    fnstsw      al
 006F9BB0    sahf
>006F9BB1    ja          006F9BB7
 006F9BB3    xor         eax,eax
>006F9BB5    jmp         006F9BB9
 006F9BB7    mov         al,1
 006F9BB9    call        00686074
 006F9BBE    fstp        qword ptr [esp]
 006F9BC1    wait
>006F9BC2    jmp         006FBAF7
 006F9BC7    mov         edx,ebx
 006F9BC9    mov         eax,esi
 006F9BCB    call        TWiimoteManager.AnyRightThumbY
 006F9BD0    fld         tbyte ptr ds:[6FBB04];0.3:Extended
 006F9BD6    fcompp
 006F9BD8    wait
 006F9BD9    fnstsw      al
 006F9BDB    sahf
 006F9BDC    setb        al
 006F9BDF    mov         ebx,eax
 006F9BE1    test        bl,bl
>006F9BE3    jne         006F9BFE
 006F9BE5    mov         eax,ebp
 006F9BE7    call        006F8C20
 006F9BEC    fld         tbyte ptr ds:[6FBB04];0.3:Extended
 006F9BF2    fcompp
 006F9BF4    wait
 006F9BF5    fnstsw      al
 006F9BF7    sahf
>006F9BF8    jb          006F9BFE
 006F9BFA    xor         eax,eax
>006F9BFC    jmp         006F9C00
 006F9BFE    mov         al,1
 006F9C00    call        00686074
 006F9C05    fstp        qword ptr [esp]
 006F9C08    wait
>006F9C09    jmp         006FBAF7
 006F9C0E    xor         edx,edx
 006F9C10    mov         eax,esi
 006F9C12    call        TWiimoteManager.AnyLeftStickX
 006F9C17    fstp        qword ptr [esp+14]
 006F9C1B    wait
 006F9C1C    mov         eax,ebp
 006F9C1E    call        006F8B48
 006F9C23    fadd        qword ptr [esp+14]
 006F9C27    fmul        st,st(0)
 006F9C29    fstp        tbyte ptr [esp+1C]
 006F9C2D    wait
 006F9C2E    xor         edx,edx
 006F9C30    mov         eax,esi
 006F9C32    call        TWiimoteManager.AnyLeftStickY
 006F9C37    fstp        qword ptr [esp+28]
 006F9C3B    wait
 006F9C3C    mov         eax,ebp
 006F9C3E    call        006F8B90
 006F9C43    fadd        qword ptr [esp+28]
 006F9C47    fmul        st,st(0)
 006F9C49    fld         tbyte ptr [esp+1C]
 006F9C4D    faddp       st(1),st
 006F9C4F    fld         tbyte ptr ds:[6FBB1C];0.49:Extended
 006F9C55    fcompp
 006F9C57    wait
 006F9C58    fnstsw      al
 006F9C5A    sahf
 006F9C5B    setb        al
 006F9C5E    call        00686074
 006F9C63    fstp        qword ptr [esp]
 006F9C66    wait
>006F9C67    jmp         006FBAF7
 006F9C6C    xor         edx,edx
 006F9C6E    mov         eax,esi
 006F9C70    call        TWiimoteManager.AnyRightStickX
 006F9C75    fstp        qword ptr [esp+14]
 006F9C79    wait
 006F9C7A    mov         eax,ebp
 006F9C7C    call        006F8BD8
 006F9C81    fadd        qword ptr [esp+14]
 006F9C85    fmul        st,st(0)
 006F9C87    fstp        tbyte ptr [esp+1C]
 006F9C8B    wait
 006F9C8C    xor         edx,edx
 006F9C8E    mov         eax,esi
 006F9C90    call        TWiimoteManager.AnyRightStickY
 006F9C95    fstp        qword ptr [esp+28]
 006F9C99    wait
 006F9C9A    mov         eax,ebp
 006F9C9C    call        006F8C20
 006F9CA1    fadd        qword ptr [esp+28]
 006F9CA5    fmul        st,st(0)
 006F9CA7    fld         tbyte ptr [esp+1C]
 006F9CAB    faddp       st(1),st
 006F9CAD    fld         tbyte ptr ds:[6FBB1C];0.49:Extended
 006F9CB3    fcompp
 006F9CB5    wait
 006F9CB6    fnstsw      al
 006F9CB8    sahf
 006F9CB9    setb        al
 006F9CBC    call        00686074
 006F9CC1    fstp        qword ptr [esp]
 006F9CC4    wait
>006F9CC5    jmp         006FBAF7
 006F9CCA    mov         edx,ebx
 006F9CCC    mov         eax,esi
 006F9CCE    call        TWiimoteManager.AnyX
 006F9CD3    fstp        qword ptr [esp+14]
 006F9CD7    wait
 006F9CD8    mov         eax,ebp
 006F9CDA    call        006F8B48
 006F9CDF    fadd        qword ptr [esp+14]
 006F9CE3    fstp        tbyte ptr [esp+1C]
 006F9CE7    wait
 006F9CE8    mov         edx,8
 006F9CED    mov         eax,dword ptr [esp+8]
 006F9CF1    call        006EE46C
 006F9CF6    movsx       eax,al
 006F9CF9    mov         dword ptr [esp+30],eax
 006F9CFD    fild        dword ptr [esp+30]
 006F9D01    fld         tbyte ptr [esp+1C]
 006F9D05    faddp       st(1),st
 006F9D07    fstp        tbyte ptr [esp+34]
 006F9D0B    wait
 006F9D0C    mov         edx,4
 006F9D11    mov         eax,dword ptr [esp+8]
 006F9D15    call        006EE46C
 006F9D1A    movsx       eax,al
 006F9D1D    mov         dword ptr [esp+40],eax
 006F9D21    fild        dword ptr [esp+40]
 006F9D25    fld         tbyte ptr [esp+34]
 006F9D29    fsubrp      st(1),st
 006F9D2B    fstp        qword ptr [esp]
 006F9D2E    wait
 006F9D2F    mov         eax,ebp
 006F9D31    call        00690048
 006F9D36    movsx       eax,al
 006F9D39    mov         dword ptr [esp+30],eax
 006F9D3D    fild        dword ptr [esp+30]
 006F9D41    fadd        qword ptr [esp]
 006F9D44    fstp        tbyte ptr [esp+1C]
 006F9D48    wait
 006F9D49    mov         eax,ebp
 006F9D4B    call        0068FF78
 006F9D50    movsx       eax,al
 006F9D53    mov         dword ptr [esp+40],eax
 006F9D57    fild        dword ptr [esp+40]
 006F9D5B    fld         tbyte ptr [esp+1C]
 006F9D5F    fsubrp      st(1),st
 006F9D61    fstp        qword ptr [esp]
 006F9D64    wait
>006F9D65    jmp         006FBAF7
 006F9D6A    mov         edx,ebx
 006F9D6C    mov         eax,esi
 006F9D6E    call        TWiimoteManager.AnyY
 006F9D73    fstp        qword ptr [esp+14]
 006F9D77    wait
 006F9D78    mov         eax,ebp
 006F9D7A    call        006F8B90
 006F9D7F    fadd        qword ptr [esp+14]
 006F9D83    fstp        tbyte ptr [esp+1C]
 006F9D87    wait
 006F9D88    mov         edx,2
 006F9D8D    mov         eax,dword ptr [esp+8]
 006F9D91    call        006EE46C
 006F9D96    movsx       eax,al
 006F9D99    mov         dword ptr [esp+30],eax
 006F9D9D    fild        dword ptr [esp+30]
 006F9DA1    fld         tbyte ptr [esp+1C]
 006F9DA5    faddp       st(1),st
 006F9DA7    fstp        tbyte ptr [esp+34]
 006F9DAB    wait
 006F9DAC    mov         edx,1
 006F9DB1    mov         eax,dword ptr [esp+8]
 006F9DB5    call        006EE46C
 006F9DBA    movsx       eax,al
 006F9DBD    mov         dword ptr [esp+40],eax
 006F9DC1    fild        dword ptr [esp+40]
 006F9DC5    fld         tbyte ptr [esp+34]
 006F9DC9    fsubrp      st(1),st
 006F9DCB    fstp        qword ptr [esp]
 006F9DCE    wait
 006F9DCF    mov         eax,ebp
 006F9DD1    call        0068FEA8
 006F9DD6    movsx       eax,al
 006F9DD9    mov         dword ptr [esp+30],eax
 006F9DDD    fild        dword ptr [esp+30]
 006F9DE1    fadd        qword ptr [esp]
 006F9DE4    fstp        tbyte ptr [esp+1C]
 006F9DE8    wait
 006F9DE9    mov         eax,ebp
 006F9DEB    call        0068FD94
 006F9DF0    movsx       eax,al
 006F9DF3    mov         dword ptr [esp+40],eax
 006F9DF7    fild        dword ptr [esp+40]
 006F9DFB    fld         tbyte ptr [esp+1C]
 006F9DFF    fsubrp      st(1),st
 006F9E01    fstp        qword ptr [esp]
 006F9E04    wait
>006F9E05    jmp         006FBAF7
 006F9E0A    mov         edx,8
 006F9E0F    mov         eax,dword ptr [esp+8]
 006F9E13    call        006EE46C
 006F9E18    movsx       eax,al
 006F9E1B    mov         dword ptr [esp+30],eax
 006F9E1F    fild        dword ptr [esp+30]
 006F9E23    fstp        tbyte ptr [esp+1C]
 006F9E27    wait
 006F9E28    mov         edx,ebx
 006F9E2A    mov         eax,esi
 006F9E2C    call        TWiimoteManager.AnyDPadX
 006F9E31    fld         tbyte ptr [esp+1C]
 006F9E35    faddp       st(1),st
 006F9E37    fstp        tbyte ptr [esp+34]
 006F9E3B    wait
 006F9E3C    mov         edx,4
 006F9E41    mov         eax,dword ptr [esp+8]
 006F9E45    call        006EE46C
 006F9E4A    movsx       eax,al
 006F9E4D    mov         dword ptr [esp+40],eax
 006F9E51    fild        dword ptr [esp+40]
 006F9E55    fld         tbyte ptr [esp+34]
 006F9E59    fsubrp      st(1),st
 006F9E5B    fstp        qword ptr [esp]
 006F9E5E    wait
 006F9E5F    mov         eax,ebp
 006F9E61    call        00690048
 006F9E66    movsx       eax,al
 006F9E69    mov         dword ptr [esp+30],eax
 006F9E6D    fild        dword ptr [esp+30]
 006F9E71    fadd        qword ptr [esp]
 006F9E74    fstp        tbyte ptr [esp+1C]
 006F9E78    wait
 006F9E79    mov         eax,ebp
 006F9E7B    call        0068FF78
 006F9E80    movsx       eax,al
 006F9E83    mov         dword ptr [esp+40],eax
 006F9E87    fild        dword ptr [esp+40]
 006F9E8B    fld         tbyte ptr [esp+1C]
 006F9E8F    fsubrp      st(1),st
 006F9E91    fstp        qword ptr [esp]
 006F9E94    wait
>006F9E95    jmp         006FBAF7
 006F9E9A    mov         edx,2
 006F9E9F    mov         eax,dword ptr [esp+8]
 006F9EA3    call        006EE46C
 006F9EA8    movsx       eax,al
 006F9EAB    mov         dword ptr [esp+30],eax
 006F9EAF    fild        dword ptr [esp+30]
 006F9EB3    fstp        tbyte ptr [esp+1C]
 006F9EB7    wait
 006F9EB8    mov         edx,ebx
 006F9EBA    mov         eax,esi
 006F9EBC    call        TWiimoteManager.AnyDPadY
 006F9EC1    fld         tbyte ptr [esp+1C]
 006F9EC5    faddp       st(1),st
 006F9EC7    fstp        tbyte ptr [esp+34]
 006F9ECB    wait
 006F9ECC    mov         edx,1
 006F9ED1    mov         eax,dword ptr [esp+8]
 006F9ED5    call        006EE46C
 006F9EDA    movsx       eax,al
 006F9EDD    mov         dword ptr [esp+40],eax
 006F9EE1    fild        dword ptr [esp+40]
 006F9EE5    fld         tbyte ptr [esp+34]
 006F9EE9    fsubrp      st(1),st
 006F9EEB    fstp        qword ptr [esp]
 006F9EEE    wait
 006F9EEF    mov         eax,ebp
 006F9EF1    call        0068FEA8
 006F9EF6    movsx       eax,al
 006F9EF9    mov         dword ptr [esp+30],eax
 006F9EFD    fild        dword ptr [esp+30]
 006F9F01    fadd        qword ptr [esp]
 006F9F04    fstp        tbyte ptr [esp+1C]
 006F9F08    wait
 006F9F09    mov         eax,ebp
 006F9F0B    call        0068FD94
 006F9F10    movsx       eax,al
 006F9F13    mov         dword ptr [esp+40],eax
 006F9F17    fild        dword ptr [esp+40]
 006F9F1B    fld         tbyte ptr [esp+1C]
 006F9F1F    fsubrp      st(1),st
 006F9F21    fstp        qword ptr [esp]
 006F9F24    wait
>006F9F25    jmp         006FBAF7
 006F9F2A    mov         edx,ebx
 006F9F2C    mov         eax,esi
 006F9F2E    call        TWiimoteManager.AnyLeftThumbX
 006F9F33    fstp        qword ptr [esp+14]
 006F9F37    wait
 006F9F38    mov         eax,ebp
 006F9F3A    call        006F8B48
 006F9F3F    fadd        qword ptr [esp+14]
 006F9F43    fstp        tbyte ptr [esp+1C]
 006F9F47    wait
 006F9F48    mov         edx,8
 006F9F4D    mov         eax,dword ptr [esp+8]
 006F9F51    call        006EE46C
 006F9F56    movsx       eax,al
 006F9F59    mov         dword ptr [esp+30],eax
 006F9F5D    fild        dword ptr [esp+30]
 006F9F61    fld         tbyte ptr [esp+1C]
 006F9F65    faddp       st(1),st
 006F9F67    fstp        tbyte ptr [esp+34]
 006F9F6B    wait
 006F9F6C    mov         edx,4
 006F9F71    mov         eax,dword ptr [esp+8]
 006F9F75    call        006EE46C
 006F9F7A    movsx       eax,al
 006F9F7D    mov         dword ptr [esp+40],eax
 006F9F81    fild        dword ptr [esp+40]
 006F9F85    fld         tbyte ptr [esp+34]
 006F9F89    fsubrp      st(1),st
 006F9F8B    fstp        qword ptr [esp]
 006F9F8E    wait
 006F9F8F    mov         eax,ebp
 006F9F91    call        00690048
 006F9F96    movsx       eax,al
 006F9F99    mov         dword ptr [esp+30],eax
 006F9F9D    fild        dword ptr [esp+30]
 006F9FA1    fadd        qword ptr [esp]
 006F9FA4    fstp        tbyte ptr [esp+1C]
 006F9FA8    wait
 006F9FA9    mov         eax,ebp
 006F9FAB    call        0068FF78
 006F9FB0    movsx       eax,al
 006F9FB3    mov         dword ptr [esp+40],eax
 006F9FB7    fild        dword ptr [esp+40]
 006F9FBB    fld         tbyte ptr [esp+1C]
 006F9FBF    fsubrp      st(1),st
 006F9FC1    fstp        qword ptr [esp]
 006F9FC4    wait
>006F9FC5    jmp         006FBAF7
 006F9FCA    mov         edx,ebx
 006F9FCC    mov         eax,esi
 006F9FCE    call        TWiimoteManager.AnyLeftThumbY
 006F9FD3    fstp        qword ptr [esp+14]
 006F9FD7    wait
 006F9FD8    mov         eax,ebp
 006F9FDA    call        006F8B90
 006F9FDF    fadd        qword ptr [esp+14]
 006F9FE3    fstp        tbyte ptr [esp+1C]
 006F9FE7    wait
 006F9FE8    mov         edx,2
 006F9FED    mov         eax,dword ptr [esp+8]
 006F9FF1    call        006EE46C
 006F9FF6    movsx       eax,al
 006F9FF9    mov         dword ptr [esp+30],eax
 006F9FFD    fild        dword ptr [esp+30]
 006FA001    fld         tbyte ptr [esp+1C]
 006FA005    faddp       st(1),st
 006FA007    fstp        tbyte ptr [esp+34]
 006FA00B    wait
 006FA00C    mov         edx,1
 006FA011    mov         eax,dword ptr [esp+8]
 006FA015    call        006EE46C
 006FA01A    movsx       eax,al
 006FA01D    mov         dword ptr [esp+40],eax
 006FA021    fild        dword ptr [esp+40]
 006FA025    fld         tbyte ptr [esp+34]
 006FA029    fsubrp      st(1),st
 006FA02B    fstp        qword ptr [esp]
 006FA02E    wait
 006FA02F    mov         eax,ebp
 006FA031    call        0068FEA8
 006FA036    movsx       eax,al
 006FA039    mov         dword ptr [esp+30],eax
 006FA03D    fild        dword ptr [esp+30]
 006FA041    fadd        qword ptr [esp]
 006FA044    fstp        tbyte ptr [esp+1C]
 006FA048    wait
 006FA049    mov         eax,ebp
 006FA04B    call        0068FD94
 006FA050    movsx       eax,al
 006FA053    mov         dword ptr [esp+40],eax
 006FA057    fild        dword ptr [esp+40]
 006FA05B    fld         tbyte ptr [esp+1C]
 006FA05F    fsubrp      st(1),st
 006FA061    fstp        qword ptr [esp]
 006FA064    wait
>006FA065    jmp         006FBAF7
 006FA06A    mov         edx,ebx
 006FA06C    mov         eax,esi
 006FA06E    call        TWiimoteManager.AnyRightThumbX
 006FA073    fstp        qword ptr [esp+14]
 006FA077    wait
 006FA078    mov         eax,ebp
 006FA07A    call        006F8BD8
 006FA07F    fadd        qword ptr [esp+14]
 006FA083    fstp        qword ptr [esp]
 006FA086    wait
>006FA087    jmp         006FBAF7
 006FA08C    mov         edx,ebx
 006FA08E    mov         eax,esi
 006FA090    call        TWiimoteManager.AnyRightThumbY
 006FA095    fstp        qword ptr [esp+14]
 006FA099    wait
 006FA09A    mov         eax,ebp
 006FA09C    call        006F8C20
 006FA0A1    fadd        qword ptr [esp+14]
 006FA0A5    fstp        qword ptr [esp]
 006FA0A8    wait
>006FA0A9    jmp         006FBAF7
 006FA0AE    mov         edx,ebx
 006FA0B0    mov         eax,esi
 006FA0B2    call        TWiimoteManager.AnyTriangle
 006FA0B7    test        al,al
>006FA0B9    jne         006FA0E1
 006FA0BB    mov         edx,8000
 006FA0C0    mov         eax,dword ptr [esp+8]
 006FA0C4    call        006EE46C
 006FA0C9    test        al,al
>006FA0CB    jne         006FA0E1
 006FA0CD    mov         edx,1
 006FA0D2    mov         eax,ebp
 006FA0D4    call        0068FD18
 006FA0D9    test        al,al
>006FA0DB    jne         006FA0E1
 006FA0DD    xor         eax,eax
>006FA0DF    jmp         006FA0E3
 006FA0E1    mov         al,1
 006FA0E3    mov         ebx,eax
 006FA0E5    mov         eax,ebx
 006FA0E7    call        00686074
 006FA0EC    fstp        qword ptr [esp]
 006FA0EF    wait
>006FA0F0    jmp         006FBAF7
 006FA0F5    mov         edx,ebx
 006FA0F7    mov         eax,esi
 006FA0F9    call        TWiimoteManager.AnyCircle
 006FA0FE    test        al,al
>006FA100    jne         006FA128
 006FA102    mov         edx,2000
 006FA107    mov         eax,dword ptr [esp+8]
 006FA10B    call        006EE46C
 006FA110    test        al,al
>006FA112    jne         006FA128
 006FA114    mov         edx,2
 006FA119    mov         eax,ebp
 006FA11B    call        0068FD18
 006FA120    test        al,al
>006FA122    jne         006FA128
 006FA124    xor         eax,eax
>006FA126    jmp         006FA12A
 006FA128    mov         al,1
 006FA12A    mov         ebx,eax
 006FA12C    mov         eax,ebx
 006FA12E    call        00686074
 006FA133    fstp        qword ptr [esp]
 006FA136    wait
>006FA137    jmp         006FBAF7
 006FA13C    mov         edx,ebx
 006FA13E    mov         eax,esi
 006FA140    call        TWiimoteManager.AnyCross
 006FA145    test        al,al
>006FA147    jne         006FA16F
 006FA149    mov         edx,1000
 006FA14E    mov         eax,dword ptr [esp+8]
 006FA152    call        006EE46C
 006FA157    test        al,al
>006FA159    jne         006FA16F
 006FA15B    mov         edx,3
 006FA160    mov         eax,ebp
 006FA162    call        0068FD18
 006FA167    test        al,al
>006FA169    jne         006FA16F
 006FA16B    xor         eax,eax
>006FA16D    jmp         006FA171
 006FA16F    mov         al,1
 006FA171    mov         ebx,eax
 006FA173    mov         eax,ebx
 006FA175    call        00686074
 006FA17A    fstp        qword ptr [esp]
 006FA17D    wait
>006FA17E    jmp         006FBAF7
 006FA183    mov         edx,ebx
 006FA185    mov         eax,esi
 006FA187    call        TWiimoteManager.AnySquare
 006FA18C    test        al,al
>006FA18E    jne         006FA1B6
 006FA190    mov         edx,4000
 006FA195    mov         eax,dword ptr [esp+8]
 006FA199    call        006EE46C
 006FA19E    test        al,al
>006FA1A0    jne         006FA1B6
 006FA1A2    mov         edx,4
 006FA1A7    mov         eax,ebp
 006FA1A9    call        0068FD18
 006FA1AE    test        al,al
>006FA1B0    jne         006FA1B6
 006FA1B2    xor         eax,eax
>006FA1B4    jmp         006FA1B8
 006FA1B6    mov         al,1
 006FA1B8    mov         ebx,eax
 006FA1BA    mov         eax,ebx
 006FA1BC    call        00686074
 006FA1C1    fstp        qword ptr [esp]
 006FA1C4    wait
>006FA1C5    jmp         006FBAF7
 006FA1CA    mov         edx,ebx
 006FA1CC    mov         eax,esi
 006FA1CE    call        TWiimoteManager.AnySecondBestLeftTrigger
 006FA1D3    test        al,al
>006FA1D5    jne         006FA1FD
 006FA1D7    mov         edx,100
 006FA1DC    mov         eax,dword ptr [esp+8]
 006FA1E0    call        006EE46C
 006FA1E5    test        al,al
>006FA1E7    jne         006FA1FD
 006FA1E9    mov         edx,7
 006FA1EE    mov         eax,ebp
 006FA1F0    call        0068FD18
 006FA1F5    test        al,al
>006FA1F7    jne         006FA1FD
 006FA1F9    xor         eax,eax
>006FA1FB    jmp         006FA1FF
 006FA1FD    mov         al,1
 006FA1FF    mov         ebx,eax
 006FA201    mov         eax,ebx
 006FA203    call        00686074
 006FA208    fstp        qword ptr [esp]
 006FA20B    wait
>006FA20C    jmp         006FBAF7
 006FA211    mov         edx,ebx
 006FA213    mov         eax,esi
 006FA215    call        TWiimoteManager.AnySecondBestRightTrigger
 006FA21A    test        al,al
>006FA21C    jne         006FA244
 006FA21E    mov         edx,200
 006FA223    mov         eax,dword ptr [esp+8]
 006FA227    call        006EE46C
 006FA22C    test        al,al
>006FA22E    jne         006FA244
 006FA230    mov         edx,8
 006FA235    mov         eax,ebp
 006FA237    call        0068FD18
 006FA23C    test        al,al
>006FA23E    jne         006FA244
 006FA240    xor         eax,eax
>006FA242    jmp         006FA246
 006FA244    mov         al,1
 006FA246    mov         ebx,eax
 006FA248    mov         eax,ebx
 006FA24A    call        00686074
 006FA24F    fstp        qword ptr [esp]
 006FA252    wait
>006FA253    jmp         006FBAF7
 006FA258    mov         edx,ebx
 006FA25A    mov         eax,esi
 006FA25C    call        TWiimoteManager.AnyTopLeftTrigger
 006FA261    test        al,al
>006FA263    jne         006FA28B
 006FA265    mov         edx,100
 006FA26A    mov         eax,dword ptr [esp+8]
 006FA26E    call        006EE46C
 006FA273    test        al,al
>006FA275    jne         006FA28B
 006FA277    mov         edx,5
 006FA27C    mov         eax,ebp
 006FA27E    call        0068FD18
 006FA283    test        al,al
>006FA285    jne         006FA28B
 006FA287    xor         eax,eax
>006FA289    jmp         006FA28D
 006FA28B    mov         al,1
 006FA28D    mov         ebx,eax
 006FA28F    mov         eax,ebx
 006FA291    call        00686074
 006FA296    fstp        qword ptr [esp]
 006FA299    wait
>006FA29A    jmp         006FBAF7
 006FA29F    mov         edx,ebx
 006FA2A1    mov         eax,esi
 006FA2A3    call        TWiimoteManager.AnyTopRightTrigger
 006FA2A8    test        al,al
>006FA2AA    jne         006FA2D2
 006FA2AC    mov         edx,200
 006FA2B1    mov         eax,dword ptr [esp+8]
 006FA2B5    call        006EE46C
 006FA2BA    test        al,al
>006FA2BC    jne         006FA2D2
 006FA2BE    mov         edx,6
 006FA2C3    mov         eax,ebp
 006FA2C5    call        0068FD18
 006FA2CA    test        al,al
>006FA2CC    jne         006FA2D2
 006FA2CE    xor         eax,eax
>006FA2D0    jmp         006FA2D4
 006FA2D2    mov         al,1
 006FA2D4    mov         ebx,eax
 006FA2D6    mov         eax,ebx
 006FA2D8    call        00686074
 006FA2DD    fstp        qword ptr [esp]
 006FA2E0    wait
>006FA2E1    jmp         006FBAF7
 006FA2E6    mov         edx,ebx
 006FA2E8    mov         eax,esi
 006FA2EA    call        TWiimoteManager.AnyBottomLeftTrigger
 006FA2EF    test        al,al
>006FA2F1    jne         006FA323
 006FA2F3    mov         edx,1
 006FA2F8    mov         eax,dword ptr [esp+8]
 006FA2FC    call        006EE4E4
 006FA301    fld         tbyte ptr ds:[6FBB04];0.3:Extended
 006FA307    fcompp
 006FA309    wait
 006FA30A    fnstsw      al
 006FA30C    sahf
>006FA30D    jb          006FA323
 006FA30F    mov         edx,7
 006FA314    mov         eax,ebp
 006FA316    call        0068FD18
 006FA31B    test        al,al
>006FA31D    jne         006FA323
 006FA31F    xor         eax,eax
>006FA321    jmp         006FA325
 006FA323    mov         al,1
 006FA325    mov         ebx,eax
 006FA327    mov         eax,ebx
 006FA329    call        00686074
 006FA32E    fstp        qword ptr [esp]
 006FA331    wait
>006FA332    jmp         006FBAF7
 006FA337    mov         edx,ebx
 006FA339    mov         eax,esi
 006FA33B    call        TWiimoteManager.AnyBottomRightTrigger
 006FA340    test        al,al
>006FA342    jne         006FA374
 006FA344    mov         edx,2
 006FA349    mov         eax,dword ptr [esp+8]
 006FA34D    call        006EE4E4
 006FA352    fld         tbyte ptr ds:[6FBB04];0.3:Extended
 006FA358    fcompp
 006FA35A    wait
 006FA35B    fnstsw      al
 006FA35D    sahf
>006FA35E    jb          006FA374
 006FA360    mov         edx,8
 006FA365    mov         eax,ebp
 006FA367    call        0068FD18
 006FA36C    test        al,al
>006FA36E    jne         006FA374
 006FA370    xor         eax,eax
>006FA372    jmp         006FA376
 006FA374    mov         al,1
 006FA376    mov         ebx,eax
 006FA378    mov         eax,ebx
 006FA37A    call        00686074
 006FA37F    fstp        qword ptr [esp]
 006FA382    wait
>006FA383    jmp         006FBAF7
 006FA388    mov         edx,ebx
 006FA38A    mov         eax,esi
 006FA38C    call        TWiimoteManager.AnySelect
 006FA391    test        al,al
>006FA393    jne         006FA3BB
 006FA395    mov         edx,20
 006FA39A    mov         eax,dword ptr [esp+8]
 006FA39E    call        006EE46C
 006FA3A3    test        al,al
>006FA3A5    jne         006FA3BB
 006FA3A7    mov         edx,9
 006FA3AC    mov         eax,ebp
 006FA3AE    call        0068FD18
 006FA3B3    test        al,al
>006FA3B5    jne         006FA3BB
 006FA3B7    xor         eax,eax
>006FA3B9    jmp         006FA3BD
 006FA3BB    mov         al,1
 006FA3BD    mov         ebx,eax
 006FA3BF    mov         eax,ebx
 006FA3C1    call        00686074
 006FA3C6    fstp        qword ptr [esp]
 006FA3C9    wait
>006FA3CA    jmp         006FBAF7
 006FA3CF    mov         edx,ebx
 006FA3D1    mov         eax,esi
 006FA3D3    call        TWiimoteManager.AnyStart
 006FA3D8    test        al,al
>006FA3DA    jne         006FA402
 006FA3DC    mov         edx,10
 006FA3E1    mov         eax,dword ptr [esp+8]
 006FA3E5    call        006EE46C
 006FA3EA    test        al,al
>006FA3EC    jne         006FA402
 006FA3EE    mov         edx,0A
 006FA3F3    mov         eax,ebp
 006FA3F5    call        0068FD18
 006FA3FA    test        al,al
>006FA3FC    jne         006FA402
 006FA3FE    xor         eax,eax
>006FA400    jmp         006FA404
 006FA402    mov         al,1
 006FA404    mov         ebx,eax
 006FA406    mov         eax,ebx
 006FA408    call        00686074
 006FA40D    fstp        qword ptr [esp]
 006FA410    wait
>006FA411    jmp         006FBAF7
 006FA416    mov         edx,ebx
 006FA418    mov         eax,esi
 006FA41A    call        TWiimoteManager.AnyL3
 006FA41F    test        al,al
>006FA421    jne         006FA449
 006FA423    mov         edx,40
 006FA428    mov         eax,dword ptr [esp+8]
 006FA42C    call        006EE46C
 006FA431    test        al,al
>006FA433    jne         006FA449
 006FA435    mov         edx,0B
 006FA43A    mov         eax,ebp
 006FA43C    call        0068FD18
 006FA441    test        al,al
>006FA443    jne         006FA449
 006FA445    xor         eax,eax
>006FA447    jmp         006FA44B
 006FA449    mov         al,1
 006FA44B    mov         ebx,eax
 006FA44D    mov         eax,ebx
 006FA44F    call        00686074
 006FA454    fstp        qword ptr [esp]
 006FA457    wait
>006FA458    jmp         006FBAF7
 006FA45D    mov         edx,ebx
 006FA45F    mov         eax,esi
 006FA461    call        TWiimoteManager.AnyR3
 006FA466    test        al,al
>006FA468    jne         006FA490
 006FA46A    mov         edx,80
 006FA46F    mov         eax,dword ptr [esp+8]
 006FA473    call        006EE46C
 006FA478    test        al,al
>006FA47A    jne         006FA490
 006FA47C    mov         edx,0C
 006FA481    mov         eax,ebp
 006FA483    call        0068FD18
 006FA488    test        al,al
>006FA48A    jne         006FA490
 006FA48C    xor         eax,eax
>006FA48E    jmp         006FA492
 006FA490    mov         al,1
 006FA492    mov         ebx,eax
 006FA494    mov         eax,ebx
 006FA496    call        00686074
 006FA49B    fstp        qword ptr [esp]
 006FA49E    wait
>006FA49F    jmp         006FBAF7
 006FA4A4    mov         edx,ebx
 006FA4A6    mov         eax,esi
 006FA4A8    call        TWiimoteManager.AnyBestRightTrigger
 006FA4AD    test        al,al
>006FA4AF    jne         006FA4E1
 006FA4B1    mov         edx,2
 006FA4B6    mov         eax,dword ptr [esp+8]
 006FA4BA    call        006EE4E4
 006FA4BF    fld         tbyte ptr ds:[6FBB04];0.3:Extended
 006FA4C5    fcompp
 006FA4C7    wait
 006FA4C8    fnstsw      al
 006FA4CA    sahf
>006FA4CB    jb          006FA4E1
 006FA4CD    mov         edx,6
 006FA4D2    mov         eax,ebp
 006FA4D4    call        0068FD18
 006FA4D9    test        al,al
>006FA4DB    jne         006FA4E1
 006FA4DD    xor         eax,eax
>006FA4DF    jmp         006FA4E3
 006FA4E1    mov         al,1
 006FA4E3    mov         ebx,eax
 006FA4E5    mov         eax,ebx
 006FA4E7    call        00686074
 006FA4EC    fstp        qword ptr [esp]
 006FA4EF    wait
>006FA4F0    jmp         006FBAF7
 006FA4F5    mov         edx,ebx
 006FA4F7    mov         eax,esi
 006FA4F9    call        TWiimoteManager.AnyBestLeftTrigger
 006FA4FE    test        al,al
>006FA500    jne         006FA532
 006FA502    mov         edx,1
 006FA507    mov         eax,dword ptr [esp+8]
 006FA50B    call        006EE4E4
 006FA510    fld         tbyte ptr ds:[6FBB04];0.3:Extended
 006FA516    fcompp
 006FA518    wait
 006FA519    fnstsw      al
 006FA51B    sahf
>006FA51C    jb          006FA532
 006FA51E    mov         edx,5
 006FA523    mov         eax,ebp
 006FA525    call        0068FD18
 006FA52A    test        al,al
>006FA52C    jne         006FA532
 006FA52E    xor         eax,eax
>006FA530    jmp         006FA534
 006FA532    mov         al,1
 006FA534    mov         ebx,eax
 006FA536    mov         eax,ebx
 006FA538    call        00686074
 006FA53D    fstp        qword ptr [esp]
 006FA540    wait
>006FA541    jmp         006FBAF7
 006FA546    mov         edx,ebx
 006FA548    mov         eax,esi
 006FA54A    call        TWiimoteManager.AnyAnalogLeftTrigger
 006FA54F    fstp        qword ptr [esp+14]
 006FA553    wait
 006FA554    mov         edx,1
 006FA559    mov         eax,dword ptr [esp+8]
 006FA55D    call        006EE4E4
 006FA562    fadd        qword ptr [esp+14]
 006FA566    fstp        tbyte ptr [esp+1C]
 006FA56A    wait
 006FA56B    mov         edx,7
 006FA570    mov         eax,ebp
 006FA572    call        0068FD18
 006FA577    movsx       eax,al
 006FA57A    mov         dword ptr [esp+30],eax
 006FA57E    fild        dword ptr [esp+30]
 006FA582    fld         tbyte ptr [esp+1C]
 006FA586    faddp       st(1),st
 006FA588    fstp        qword ptr [esp]
 006FA58B    wait
>006FA58C    jmp         006FBAF7
 006FA591    mov         edx,ebx
 006FA593    mov         eax,esi
 006FA595    call        TWiimoteManager.AnyAnalogRightTrigger
 006FA59A    fstp        qword ptr [esp+14]
 006FA59E    wait
 006FA59F    mov         edx,2
 006FA5A4    mov         eax,dword ptr [esp+8]
 006FA5A8    call        006EE4E4
 006FA5AD    fadd        qword ptr [esp+14]
 006FA5B1    fstp        tbyte ptr [esp+1C]
 006FA5B5    wait
 006FA5B6    mov         edx,8
 006FA5BB    mov         eax,ebp
 006FA5BD    call        0068FD18
 006FA5C2    movsx       eax,al
 006FA5C5    mov         dword ptr [esp+30],eax
 006FA5C9    fild        dword ptr [esp+30]
 006FA5CD    fld         tbyte ptr [esp+1C]
 006FA5D1    faddp       st(1),st
 006FA5D3    fstp        qword ptr [esp]
 006FA5D6    wait
>006FA5D7    jmp         006FBAF7
 006FA5DC    mov         edx,ebx
 006FA5DE    mov         eax,esi
 006FA5E0    call        TWiimoteManager.AnyDigitalLeftTrigger
 006FA5E5    test        al,al
>006FA5E7    jne         006FA60F
 006FA5E9    mov         edx,100
 006FA5EE    mov         eax,dword ptr [esp+8]
 006FA5F2    call        006EE46C
 006FA5F7    test        al,al
>006FA5F9    jne         006FA60F
 006FA5FB    mov         edx,5
 006FA600    mov         eax,ebp
 006FA602    call        0068FD18
 006FA607    test        al,al
>006FA609    jne         006FA60F
 006FA60B    xor         eax,eax
>006FA60D    jmp         006FA611
 006FA60F    mov         al,1
 006FA611    mov         ebx,eax
 006FA613    mov         eax,ebx
 006FA615    call        00686074
 006FA61A    fstp        qword ptr [esp]
 006FA61D    wait
>006FA61E    jmp         006FBAF7
 006FA623    mov         edx,ebx
 006FA625    mov         eax,esi
 006FA627    call        TWiimoteManager.AnyDigitalRightTrigger
 006FA62C    test        al,al
>006FA62E    jne         006FA656
 006FA630    mov         edx,200
 006FA635    mov         eax,dword ptr [esp+8]
 006FA639    call        006EE46C
 006FA63E    test        al,al
>006FA640    jne         006FA656
 006FA642    mov         edx,6
 006FA647    mov         eax,ebp
 006FA649    call        0068FD18
 006FA64E    test        al,al
>006FA650    jne         006FA656
 006FA652    xor         eax,eax
>006FA654    jmp         006FA658
 006FA656    mov         al,1
 006FA658    mov         ebx,eax
 006FA65A    mov         eax,ebx
 006FA65C    call        00686074
 006FA661    fstp        qword ptr [esp]
 006FA664    wait
>006FA665    jmp         006FBAF7
 006FA66A    mov         edx,ebx
 006FA66C    mov         eax,esi
 006FA66E    call        TWiimoteManager.AnyHome
 006FA673    mov         ebx,eax
 006FA675    mov         eax,ebx
 006FA677    call        00686074
 006FA67C    fstp        qword ptr [esp]
 006FA67F    wait
>006FA680    jmp         006FBAF7
 006FA685    mov         edx,ebx
 006FA687    mov         eax,esi
 006FA689    call        TWiimoteManager.AnyRightThumbButton1
 006FA68E    test        al,al
>006FA690    jne         006FA6B8
 006FA692    mov         edx,1000
 006FA697    mov         eax,dword ptr [esp+8]
 006FA69B    call        006EE46C
 006FA6A0    test        al,al
>006FA6A2    jne         006FA6B8
 006FA6A4    mov         edx,1
 006FA6A9    mov         eax,ebp
 006FA6AB    call        0068FD18
 006FA6B0    test        al,al
>006FA6B2    jne         006FA6B8
 006FA6B4    xor         eax,eax
>006FA6B6    jmp         006FA6BA
 006FA6B8    mov         al,1
 006FA6BA    mov         ebx,eax
 006FA6BC    mov         eax,ebx
 006FA6BE    call        00686074
 006FA6C3    fstp        qword ptr [esp]
 006FA6C6    wait
>006FA6C7    jmp         006FBAF7
 006FA6CC    mov         edx,ebx
 006FA6CE    mov         eax,esi
 006FA6D0    call        TWiimoteManager.AnyRightThumbButton2
 006FA6D5    test        al,al
>006FA6D7    jne         006FA6FF
 006FA6D9    mov         edx,2000
 006FA6DE    mov         eax,dword ptr [esp+8]
 006FA6E2    call        006EE46C
 006FA6E7    test        al,al
>006FA6E9    jne         006FA6FF
 006FA6EB    mov         edx,2
 006FA6F0    mov         eax,ebp
 006FA6F2    call        0068FD18
 006FA6F7    test        al,al
>006FA6F9    jne         006FA6FF
 006FA6FB    xor         eax,eax
>006FA6FD    jmp         006FA701
 006FA6FF    mov         al,1
 006FA701    mov         ebx,eax
 006FA703    mov         eax,ebx
 006FA705    call        00686074
 006FA70A    fstp        qword ptr [esp]
 006FA70D    wait
>006FA70E    jmp         006FBAF7
 006FA713    mov         edx,ebx
 006FA715    mov         eax,esi
 006FA717    call        TWiimoteManager.AnyRightThumbButton3
 006FA71C    test        al,al
>006FA71E    jne         006FA746
 006FA720    mov         edx,4000
 006FA725    mov         eax,dword ptr [esp+8]
 006FA729    call        006EE46C
 006FA72E    test        al,al
>006FA730    jne         006FA746
 006FA732    mov         edx,3
 006FA737    mov         eax,ebp
 006FA739    call        0068FD18
 006FA73E    test        al,al
>006FA740    jne         006FA746
 006FA742    xor         eax,eax
>006FA744    jmp         006FA748
 006FA746    mov         al,1
 006FA748    mov         ebx,eax
 006FA74A    mov         eax,ebx
 006FA74C    call        00686074
 006FA751    fstp        qword ptr [esp]
 006FA754    wait
>006FA755    jmp         006FBAF7
 006FA75A    mov         edx,ebx
 006FA75C    mov         eax,esi
 006FA75E    call        TWiimoteManager.AnyRightThumbButton4
 006FA763    test        al,al
>006FA765    jne         006FA78D
 006FA767    mov         edx,8000
 006FA76C    mov         eax,dword ptr [esp+8]
 006FA770    call        006EE46C
 006FA775    test        al,al
>006FA777    jne         006FA78D
 006FA779    mov         edx,4
 006FA77E    mov         eax,ebp
 006FA780    call        0068FD18
 006FA785    test        al,al
>006FA787    jne         006FA78D
 006FA789    xor         eax,eax
>006FA78B    jmp         006FA78F
 006FA78D    mov         al,1
 006FA78F    mov         ebx,eax
 006FA791    mov         eax,ebx
 006FA793    call        00686074
 006FA798    fstp        qword ptr [esp]
 006FA79B    wait
>006FA79C    jmp         006FBAF7
 006FA7A1    mov         edx,ebx
 006FA7A3    mov         eax,esi
 006FA7A5    call        TWiimoteManager.AnyRightThumbButton5
 006FA7AA    test        al,al
>006FA7AC    jne         006FA7D4
 006FA7AE    mov         edx,10
 006FA7B3    mov         eax,dword ptr [esp+8]
 006FA7B7    call        006EE46C
 006FA7BC    test        al,al
>006FA7BE    jne         006FA7D4
 006FA7C0    mov         edx,0A
 006FA7C5    mov         eax,ebp
 006FA7C7    call        0068FD18
 006FA7CC    test        al,al
>006FA7CE    jne         006FA7D4
 006FA7D0    xor         eax,eax
>006FA7D2    jmp         006FA7D6
 006FA7D4    mov         al,1
 006FA7D6    mov         ebx,eax
 006FA7D8    mov         eax,ebx
 006FA7DA    call        00686074
 006FA7DF    fstp        qword ptr [esp]
 006FA7E2    wait
>006FA7E3    jmp         006FBAF7
 006FA7E8    mov         edx,ebx
 006FA7EA    mov         eax,esi
 006FA7EC    call        TWiimoteManager.AnyRightThumbButton6
 006FA7F1    test        al,al
>006FA7F3    jne         006FA81B
 006FA7F5    mov         edx,20
 006FA7FA    mov         eax,dword ptr [esp+8]
 006FA7FE    call        006EE46C
 006FA803    test        al,al
>006FA805    jne         006FA81B
 006FA807    mov         edx,0C
 006FA80C    mov         eax,ebp
 006FA80E    call        0068FD18
 006FA813    test        al,al
>006FA815    jne         006FA81B
 006FA817    xor         eax,eax
>006FA819    jmp         006FA81D
 006FA81B    mov         al,1
 006FA81D    mov         ebx,eax
 006FA81F    mov         eax,ebx
 006FA821    call        00686074
 006FA826    fstp        qword ptr [esp]
 006FA829    wait
>006FA82A    jmp         006FBAF7
 006FA82F    mov         edx,ebx
 006FA831    mov         eax,esi
 006FA833    call        TWiimoteManager.AnyLeftThumbButton1
 006FA838    test        al,al
>006FA83A    jne         006FA862
 006FA83C    mov         edx,20
 006FA841    mov         eax,dword ptr [esp+8]
 006FA845    call        006EE46C
 006FA84A    test        al,al
>006FA84C    jne         006FA862
 006FA84E    mov         edx,9
 006FA853    mov         eax,ebp
 006FA855    call        0068FD18
 006FA85A    test        al,al
>006FA85C    jne         006FA862
 006FA85E    xor         eax,eax
>006FA860    jmp         006FA864
 006FA862    mov         al,1
 006FA864    mov         ebx,eax
 006FA866    mov         eax,ebx
 006FA868    call        00686074
 006FA86D    fstp        qword ptr [esp]
 006FA870    wait
>006FA871    jmp         006FBAF7
 006FA876    mov         edx,ebx
 006FA878    mov         eax,esi
 006FA87A    call        TWiimoteManager.AnyLeftThumbButton2
 006FA87F    test        al,al
>006FA881    jne         006FA8A9
 006FA883    mov         edx,10
 006FA888    mov         eax,dword ptr [esp+8]
 006FA88C    call        006EE46C
 006FA891    test        al,al
>006FA893    jne         006FA8A9
 006FA895    mov         edx,0B
 006FA89A    mov         eax,ebp
 006FA89C    call        0068FD18
 006FA8A1    test        al,al
>006FA8A3    jne         006FA8A9
 006FA8A5    xor         eax,eax
>006FA8A7    jmp         006FA8AB
 006FA8A9    mov         al,1
 006FA8AB    mov         ebx,eax
 006FA8AD    mov         eax,ebx
 006FA8AF    call        00686074
 006FA8B4    fstp        qword ptr [esp]
 006FA8B7    wait
>006FA8B8    jmp         006FBAF7
 006FA8BD    mov         edx,ebx
 006FA8BF    mov         eax,esi
 006FA8C1    call        TWiimoteManager.AnyLeftThumbButton3
 006FA8C6    test        al,al
>006FA8C8    jne         006FA8EB
 006FA8CA    mov         edx,8
 006FA8CF    mov         eax,dword ptr [esp+8]
 006FA8D3    call        006EE46C
 006FA8D8    test        al,al
>006FA8DA    jne         006FA8EB
 006FA8DC    mov         eax,ebp
 006FA8DE    call        00690048
 006FA8E3    test        al,al
>006FA8E5    jne         006FA8EB
 006FA8E7    xor         eax,eax
>006FA8E9    jmp         006FA8ED
 006FA8EB    mov         al,1
 006FA8ED    mov         ebx,eax
 006FA8EF    mov         eax,ebx
 006FA8F1    call        00686074
 006FA8F6    fstp        qword ptr [esp]
 006FA8F9    wait
>006FA8FA    jmp         006FBAF7
 006FA8FF    cmp         dword ptr [esp+10],0
>006FA904    je          006FA918
 006FA906    mov         eax,dword ptr [esp+10]
 006FA90A    call        TAccelerometerObject.Shakiness
 006FA90F    fstp        qword ptr [esp]
 006FA912    wait
>006FA913    jmp         006FBAF7
 006FA918    xor         eax,eax
 006FA91A    mov         dword ptr [esp],eax
 006FA91D    mov         dword ptr [esp+4],eax
>006FA921    jmp         006FBAF7
 006FA926    cmp         dword ptr [esp+10],0
>006FA92B    je          006FA93A
 006FA92D    mov         eax,dword ptr [esp+10]
 006FA931    call        TAccelerometerObject.SwingHorizontally
 006FA936    test        al,al
>006FA938    jne         006FA93E
 006FA93A    xor         eax,eax
>006FA93C    jmp         006FA940
 006FA93E    mov         al,1
 006FA940    movsx       eax,al
 006FA943    mov         dword ptr [esp+30],eax
 006FA947    fild        dword ptr [esp+30]
 006FA94B    fstp        qword ptr [esp]
 006FA94E    wait
>006FA94F    jmp         006FBAF7
 006FA954    cmp         dword ptr [esp+10],0
>006FA959    je          006FA968
 006FA95B    mov         eax,dword ptr [esp+10]
 006FA95F    mov         edx,dword ptr [eax]
 006FA961    call        dword ptr [edx+0C]
 006FA964    test        al,al
>006FA966    jne         006FA96C
 006FA968    xor         eax,eax
>006FA96A    jmp         006FA96E
 006FA96C    mov         al,1
 006FA96E    movsx       eax,al
 006FA971    mov         dword ptr [esp+30],eax
 006FA975    fild        dword ptr [esp+30]
 006FA979    fstp        qword ptr [esp]
 006FA97C    wait
>006FA97D    jmp         006FBAF7
 006FA982    cmp         dword ptr [esp+10],0
>006FA987    je          006FA996
 006FA989    mov         eax,dword ptr [esp+10]
 006FA98D    call        TAccelerometerObject.Stabbing
 006FA992    test        al,al
>006FA994    jne         006FA99A
 006FA996    xor         eax,eax
>006FA998    jmp         006FA99C
 006FA99A    mov         al,1
 006FA99C    movsx       eax,al
 006FA99F    mov         dword ptr [esp+30],eax
 006FA9A3    fild        dword ptr [esp+30]
 006FA9A7    fstp        qword ptr [esp]
 006FA9AA    wait
>006FA9AB    jmp         006FBAF7
 006FA9B0    cmp         dword ptr [esp+10],0
>006FA9B5    je          006FA9C4
 006FA9B7    mov         eax,dword ptr [esp+10]
 006FA9BB    call        TAccelerometerObject.DrumBeat
 006FA9C0    test        al,al
>006FA9C2    jne         006FA9C8
 006FA9C4    xor         eax,eax
>006FA9C6    jmp         006FA9CA
 006FA9C8    mov         al,1
 006FA9CA    movsx       eax,al
 006FA9CD    mov         dword ptr [esp+30],eax
 006FA9D1    fild        dword ptr [esp+30]
 006FA9D5    fstp        qword ptr [esp]
 006FA9D8    wait
>006FA9D9    jmp         006FBAF7
 006FA9DE    cmp         dword ptr [esp+10],0
>006FA9E3    je          006FA9F2
 006FA9E5    mov         eax,dword ptr [esp+10]
 006FA9E9    mov         edx,dword ptr [eax]
 006FA9EB    call        dword ptr [edx+10]
 006FA9EE    test        al,al
>006FA9F0    jne         006FA9F6
 006FA9F2    xor         eax,eax
>006FA9F4    jmp         006FA9F8
 006FA9F6    mov         al,1
 006FA9F8    movsx       eax,al
 006FA9FB    mov         dword ptr [esp+30],eax
 006FA9FF    fild        dword ptr [esp+30]
 006FAA03    fstp        qword ptr [esp]
 006FAA06    wait
>006FAA07    jmp         006FBAF7
 006FAA0C    cmp         dword ptr [esp+10],0
>006FAA11    je          006FAA20
 006FAA13    mov         eax,dword ptr [esp+10]
 006FAA17    mov         edx,dword ptr [eax]
 006FAA19    call        dword ptr [edx+14]
 006FAA1C    test        al,al
>006FAA1E    jne         006FAA24
 006FAA20    xor         eax,eax
>006FAA22    jmp         006FAA26
 006FAA24    mov         al,1
 006FAA26    movsx       eax,al
 006FAA29    mov         dword ptr [esp+30],eax
 006FAA2D    fild        dword ptr [esp+30]
 006FAA31    fstp        qword ptr [esp]
 006FAA34    wait
>006FAA35    jmp         006FBAF7
 006FAA3A    cmp         dword ptr [esp+10],0
>006FAA3F    je          006FAA4E
 006FAA41    mov         eax,dword ptr [esp+10]
 006FAA45    call        TAccelerometerObject.OnTable
 006FAA4A    test        al,al
>006FAA4C    jne         006FAA52
 006FAA4E    xor         eax,eax
>006FAA50    jmp         006FAA54
 006FAA52    mov         al,1
 006FAA54    movsx       eax,al
 006FAA57    mov         dword ptr [esp+30],eax
 006FAA5B    fild        dword ptr [esp+30]
 006FAA5F    fstp        qword ptr [esp]
 006FAA62    wait
>006FAA63    jmp         006FBAF7
 006FAA68    cmp         dword ptr [esp+10],0
>006FAA6D    je          006FAA7C
 006FAA6F    mov         eax,dword ptr [esp+10]
 006FAA73    cmp         byte ptr [eax+430],0
>006FAA7A    jne         006FAA80
 006FAA7C    xor         eax,eax
>006FAA7E    jmp         006FAA82
 006FAA80    mov         al,1
 006FAA82    movsx       eax,al
 006FAA85    mov         dword ptr [esp+30],eax
 006FAA89    fild        dword ptr [esp+30]
 006FAA8D    fstp        qword ptr [esp]
 006FAA90    wait
>006FAA91    jmp         006FBAF7
 006FAA96    cmp         dword ptr [esp+10],0
>006FAA9B    je          006FAAAA
 006FAA9D    mov         eax,dword ptr [esp+10]
 006FAAA1    cmp         byte ptr [eax+431],0
>006FAAA8    jne         006FAAAE
 006FAAAA    xor         eax,eax
>006FAAAC    jmp         006FAAB0
 006FAAAE    mov         al,1
 006FAAB0    movsx       eax,al
 006FAAB3    mov         dword ptr [esp+30],eax
 006FAAB7    fild        dword ptr [esp+30]
 006FAABB    fstp        qword ptr [esp]
 006FAABE    wait
>006FAABF    jmp         006FBAF7
 006FAAC4    cmp         dword ptr [esp+10],0
>006FAAC9    je          006FAAD8
 006FAACB    mov         eax,dword ptr [esp+10]
 006FAACF    cmp         byte ptr [eax+432],0
>006FAAD6    jne         006FAADC
 006FAAD8    xor         eax,eax
>006FAADA    jmp         006FAADE
 006FAADC    mov         al,1
 006FAADE    movsx       eax,al
 006FAAE1    mov         dword ptr [esp+30],eax
 006FAAE5    fild        dword ptr [esp+30]
 006FAAE9    fstp        qword ptr [esp]
 006FAAEC    wait
>006FAAED    jmp         006FBAF7
 006FAAF2    cmp         dword ptr [esp+10],0
>006FAAF7    je          006FAB06
 006FAAF9    mov         eax,dword ptr [esp+10]
 006FAAFD    cmp         byte ptr [eax+433],0
>006FAB04    jne         006FAB0A
 006FAB06    xor         eax,eax
>006FAB08    jmp         006FAB0C
 006FAB0A    mov         al,1
 006FAB0C    movsx       eax,al
 006FAB0F    mov         dword ptr [esp+30],eax
 006FAB13    fild        dword ptr [esp+30]
 006FAB17    fstp        qword ptr [esp]
 006FAB1A    wait
>006FAB1B    jmp         006FBAF7
 006FAB20    cmp         dword ptr [esp+10],0
>006FAB25    je          006FAB34
 006FAB27    mov         eax,dword ptr [esp+10]
 006FAB2B    cmp         byte ptr [eax+434],0
>006FAB32    jne         006FAB38
 006FAB34    xor         eax,eax
>006FAB36    jmp         006FAB3A
 006FAB38    mov         al,1
 006FAB3A    movsx       eax,al
 006FAB3D    mov         dword ptr [esp+30],eax
 006FAB41    fild        dword ptr [esp+30]
 006FAB45    fstp        qword ptr [esp]
 006FAB48    wait
>006FAB49    jmp         006FBAF7
 006FAB4E    mov         edx,ebx
 006FAB50    mov         eax,esi
 006FAB52    call        TWiimoteManager.AnyPartialGesture
 006FAB57    cmp         al,1
 006FAB59    sete        al
 006FAB5C    movsx       eax,al
 006FAB5F    mov         dword ptr [esp+30],eax
 006FAB63    fild        dword ptr [esp+30]
 006FAB67    fstp        qword ptr [esp]
 006FAB6A    wait
>006FAB6B    jmp         006FBAF7
 006FAB70    mov         edx,ebx
 006FAB72    mov         eax,esi
 006FAB74    call        TWiimoteManager.AnyPartialGesture
 006FAB79    cmp         al,2
 006FAB7B    sete        al
 006FAB7E    movsx       eax,al
 006FAB81    mov         dword ptr [esp+30],eax
 006FAB85    fild        dword ptr [esp+30]
 006FAB89    fstp        qword ptr [esp]
 006FAB8C    wait
>006FAB8D    jmp         006FBAF7
 006FAB92    mov         edx,ebx
 006FAB94    mov         eax,esi
 006FAB96    call        TWiimoteManager.AnyPartialGesture
 006FAB9B    cmp         al,3
 006FAB9D    sete        al
 006FABA0    movsx       eax,al
 006FABA3    mov         dword ptr [esp+30],eax
 006FABA7    fild        dword ptr [esp+30]
 006FABAB    fstp        qword ptr [esp]
 006FABAE    wait
>006FABAF    jmp         006FBAF7
 006FABB4    mov         edx,ebx
 006FABB6    mov         eax,esi
 006FABB8    call        TWiimoteManager.AnyPartialGesture
 006FABBD    cmp         al,4
 006FABBF    sete        al
 006FABC2    movsx       eax,al
 006FABC5    mov         dword ptr [esp+30],eax
 006FABC9    fild        dword ptr [esp+30]
 006FABCD    fstp        qword ptr [esp]
 006FABD0    wait
>006FABD1    jmp         006FBAF7
 006FABD6    mov         edx,ebx
 006FABD8    mov         eax,esi
 006FABDA    call        TWiimoteManager.AnyPartialGesture
 006FABDF    cmp         al,5
 006FABE1    sete        al
 006FABE4    movsx       eax,al
 006FABE7    mov         dword ptr [esp+30],eax
 006FABEB    fild        dword ptr [esp+30]
 006FABEF    fstp        qword ptr [esp]
 006FABF2    wait
>006FABF3    jmp         006FBAF7
 006FABF8    mov         edx,ebx
 006FABFA    mov         eax,esi
 006FABFC    call        TWiimoteManager.AnyPartialGesture
 006FAC01    cmp         al,23
 006FAC03    sete        al
 006FAC06    movsx       eax,al
 006FAC09    mov         dword ptr [esp+30],eax
 006FAC0D    fild        dword ptr [esp+30]
 006FAC11    fstp        qword ptr [esp]
 006FAC14    wait
>006FAC15    jmp         006FBAF7
 006FAC1A    mov         edx,ebx
 006FAC1C    mov         eax,esi
 006FAC1E    call        TWiimoteManager.AnyPartialGesture
 006FAC23    cmp         al,24
 006FAC25    sete        al
 006FAC28    movsx       eax,al
 006FAC2B    mov         dword ptr [esp+30],eax
 006FAC2F    fild        dword ptr [esp+30]
 006FAC33    fstp        qword ptr [esp]
 006FAC36    wait
>006FAC37    jmp         006FBAF7
 006FAC3C    mov         edx,ebx
 006FAC3E    mov         eax,esi
 006FAC40    call        TWiimoteManager.AnyPartialGesture
 006FAC45    cmp         al,25
 006FAC47    sete        al
 006FAC4A    movsx       eax,al
 006FAC4D    mov         dword ptr [esp+30],eax
 006FAC51    fild        dword ptr [esp+30]
 006FAC55    fstp        qword ptr [esp]
 006FAC58    wait
>006FAC59    jmp         006FBAF7
 006FAC5E    mov         edx,ebx
 006FAC60    mov         eax,esi
 006FAC62    call        TWiimoteManager.AnyPartialGesture
 006FAC67    cmp         al,26
 006FAC69    sete        al
 006FAC6C    movsx       eax,al
 006FAC6F    mov         dword ptr [esp+30],eax
 006FAC73    fild        dword ptr [esp+30]
 006FAC77    fstp        qword ptr [esp]
 006FAC7A    wait
>006FAC7B    jmp         006FBAF7
 006FAC80    mov         edx,ebx
 006FAC82    mov         eax,esi
 006FAC84    call        TWiimoteManager.AnyPartialGesture
 006FAC89    cmp         al,27
 006FAC8B    sete        al
 006FAC8E    movsx       eax,al
 006FAC91    mov         dword ptr [esp+30],eax
 006FAC95    fild        dword ptr [esp+30]
 006FAC99    fstp        qword ptr [esp]
 006FAC9C    wait
>006FAC9D    jmp         006FBAF7
 006FACA2    mov         edx,ebx
 006FACA4    mov         eax,esi
 006FACA6    call        TWiimoteManager.AnyPartialGesture
 006FACAB    cmp         al,12
 006FACAD    sete        al
 006FACB0    movsx       eax,al
 006FACB3    mov         dword ptr [esp+30],eax
 006FACB7    fild        dword ptr [esp+30]
 006FACBB    fstp        qword ptr [esp]
 006FACBE    wait
>006FACBF    jmp         006FBAF7
 006FACC4    mov         edx,ebx
 006FACC6    mov         eax,esi
 006FACC8    call        TWiimoteManager.AnyPartialGesture
 006FACCD    cmp         al,13
 006FACCF    sete        al
 006FACD2    movsx       eax,al
 006FACD5    mov         dword ptr [esp+30],eax
 006FACD9    fild        dword ptr [esp+30]
 006FACDD    fstp        qword ptr [esp]
 006FACE0    wait
>006FACE1    jmp         006FBAF7
 006FACE6    mov         edx,ebx
 006FACE8    mov         eax,esi
 006FACEA    call        TWiimoteManager.AnyPartialGesture
 006FACEF    cmp         al,14
 006FACF1    sete        al
 006FACF4    movsx       eax,al
 006FACF7    mov         dword ptr [esp+30],eax
 006FACFB    fild        dword ptr [esp+30]
 006FACFF    fstp        qword ptr [esp]
 006FAD02    wait
>006FAD03    jmp         006FBAF7
 006FAD08    mov         edx,ebx
 006FAD0A    mov         eax,esi
 006FAD0C    call        TWiimoteManager.AnyPartialGesture
 006FAD11    cmp         al,15
 006FAD13    sete        al
 006FAD16    movsx       eax,al
 006FAD19    mov         dword ptr [esp+30],eax
 006FAD1D    fild        dword ptr [esp+30]
 006FAD21    fstp        qword ptr [esp]
 006FAD24    wait
>006FAD25    jmp         006FBAF7
 006FAD2A    mov         edx,ebx
 006FAD2C    mov         eax,esi
 006FAD2E    call        TWiimoteManager.AnyPartialGesture
 006FAD33    cmp         al,16
 006FAD35    sete        al
 006FAD38    movsx       eax,al
 006FAD3B    mov         dword ptr [esp+30],eax
 006FAD3F    fild        dword ptr [esp+30]
 006FAD43    fstp        qword ptr [esp]
 006FAD46    wait
>006FAD47    jmp         006FBAF7
 006FAD4C    mov         edx,ebx
 006FAD4E    mov         eax,esi
 006FAD50    call        TWiimoteManager.AnyPartialGesture
 006FAD55    cmp         al,34
 006FAD57    sete        al
 006FAD5A    movsx       eax,al
 006FAD5D    mov         dword ptr [esp+30],eax
 006FAD61    fild        dword ptr [esp+30]
 006FAD65    fstp        qword ptr [esp]
 006FAD68    wait
>006FAD69    jmp         006FBAF7
 006FAD6E    mov         edx,ebx
 006FAD70    mov         eax,esi
 006FAD72    call        TWiimoteManager.AnyPartialGesture
 006FAD77    cmp         al,35
 006FAD79    sete        al
 006FAD7C    movsx       eax,al
 006FAD7F    mov         dword ptr [esp+30],eax
 006FAD83    fild        dword ptr [esp+30]
 006FAD87    fstp        qword ptr [esp]
 006FAD8A    wait
>006FAD8B    jmp         006FBAF7
 006FAD90    mov         edx,ebx
 006FAD92    mov         eax,esi
 006FAD94    call        TWiimoteManager.AnyPartialGesture
 006FAD99    cmp         al,36
 006FAD9B    sete        al
 006FAD9E    movsx       eax,al
 006FADA1    mov         dword ptr [esp+30],eax
 006FADA5    fild        dword ptr [esp+30]
 006FADA9    fstp        qword ptr [esp]
 006FADAC    wait
>006FADAD    jmp         006FBAF7
 006FADB2    mov         edx,ebx
 006FADB4    mov         eax,esi
 006FADB6    call        TWiimoteManager.AnyPartialGesture
 006FADBB    cmp         al,37
 006FADBD    sete        al
 006FADC0    movsx       eax,al
 006FADC3    mov         dword ptr [esp+30],eax
 006FADC7    fild        dword ptr [esp+30]
 006FADCB    fstp        qword ptr [esp]
 006FADCE    wait
>006FADCF    jmp         006FBAF7
 006FADD4    mov         edx,ebx
 006FADD6    mov         eax,esi
 006FADD8    call        TWiimoteManager.AnyPartialGesture
 006FADDD    cmp         al,38
 006FADDF    sete        al
 006FADE2    movsx       eax,al
 006FADE5    mov         dword ptr [esp+30],eax
 006FADE9    fild        dword ptr [esp+30]
 006FADED    fstp        qword ptr [esp]
 006FADF0    wait
>006FADF1    jmp         006FBAF7
 006FADF6    mov         edx,ebx
 006FADF8    mov         eax,esi
 006FADFA    call        TWiimoteManager.AnyWaggleGesture
 006FADFF    cmp         al,1
 006FAE01    sete        al
 006FAE04    movsx       eax,al
 006FAE07    mov         dword ptr [esp+30],eax
 006FAE0B    fild        dword ptr [esp+30]
 006FAE0F    fstp        qword ptr [esp]
 006FAE12    wait
>006FAE13    jmp         006FBAF7
 006FAE18    mov         edx,ebx
 006FAE1A    mov         eax,esi
 006FAE1C    call        TWiimoteManager.AnyWaggleGesture
 006FAE21    cmp         al,2
 006FAE23    sete        al
 006FAE26    movsx       eax,al
 006FAE29    mov         dword ptr [esp+30],eax
 006FAE2D    fild        dword ptr [esp+30]
 006FAE31    fstp        qword ptr [esp]
 006FAE34    wait
>006FAE35    jmp         006FBAF7
 006FAE3A    mov         edx,ebx
 006FAE3C    mov         eax,esi
 006FAE3E    call        TWiimoteManager.AnyWaggleGesture
 006FAE43    cmp         al,3
 006FAE45    sete        al
 006FAE48    movsx       eax,al
 006FAE4B    mov         dword ptr [esp+30],eax
 006FAE4F    fild        dword ptr [esp+30]
 006FAE53    fstp        qword ptr [esp]
 006FAE56    wait
>006FAE57    jmp         006FBAF7
 006FAE5C    mov         edx,ebx
 006FAE5E    mov         eax,esi
 006FAE60    call        TWiimoteManager.AnyWaggleGesture
 006FAE65    cmp         al,4
 006FAE67    sete        al
 006FAE6A    movsx       eax,al
 006FAE6D    mov         dword ptr [esp+30],eax
 006FAE71    fild        dword ptr [esp+30]
 006FAE75    fstp        qword ptr [esp]
 006FAE78    wait
>006FAE79    jmp         006FBAF7
 006FAE7E    mov         edx,ebx
 006FAE80    mov         eax,esi
 006FAE82    call        TWiimoteManager.AnyWaggleGesture
 006FAE87    cmp         al,23
 006FAE89    sete        al
 006FAE8C    movsx       eax,al
 006FAE8F    mov         dword ptr [esp+30],eax
 006FAE93    fild        dword ptr [esp+30]
 006FAE97    fstp        qword ptr [esp]
 006FAE9A    wait
>006FAE9B    jmp         006FBAF7
 006FAEA0    mov         edx,ebx
 006FAEA2    mov         eax,esi
 006FAEA4    call        TWiimoteManager.AnyWaggleGesture
 006FAEA9    cmp         al,24
 006FAEAB    sete        al
 006FAEAE    movsx       eax,al
 006FAEB1    mov         dword ptr [esp+30],eax
 006FAEB5    fild        dword ptr [esp+30]
 006FAEB9    fstp        qword ptr [esp]
 006FAEBC    wait
>006FAEBD    jmp         006FBAF7
 006FAEC2    mov         edx,ebx
 006FAEC4    mov         eax,esi
 006FAEC6    call        TWiimoteManager.AnyWaggleGesture
 006FAECB    cmp         al,25
 006FAECD    sete        al
 006FAED0    movsx       eax,al
 006FAED3    mov         dword ptr [esp+30],eax
 006FAED7    fild        dword ptr [esp+30]
 006FAEDB    fstp        qword ptr [esp]
 006FAEDE    wait
>006FAEDF    jmp         006FBAF7
 006FAEE4    mov         edx,ebx
 006FAEE6    mov         eax,esi
 006FAEE8    call        TWiimoteManager.AnyWaggleGesture
 006FAEED    cmp         al,26
 006FAEEF    sete        al
 006FAEF2    movsx       eax,al
 006FAEF5    mov         dword ptr [esp+30],eax
 006FAEF9    fild        dword ptr [esp+30]
 006FAEFD    fstp        qword ptr [esp]
 006FAF00    wait
>006FAF01    jmp         006FBAF7
 006FAF06    mov         edx,ebx
 006FAF08    mov         eax,esi
 006FAF0A    call        TWiimoteManager.AnyWaggleGesture
 006FAF0F    cmp         al,12
 006FAF11    sete        al
 006FAF14    movsx       eax,al
 006FAF17    mov         dword ptr [esp+30],eax
 006FAF1B    fild        dword ptr [esp+30]
 006FAF1F    fstp        qword ptr [esp]
 006FAF22    wait
>006FAF23    jmp         006FBAF7
 006FAF28    mov         edx,ebx
 006FAF2A    mov         eax,esi
 006FAF2C    call        TWiimoteManager.AnyWaggleGesture
 006FAF31    cmp         al,13
 006FAF33    sete        al
 006FAF36    movsx       eax,al
 006FAF39    mov         dword ptr [esp+30],eax
 006FAF3D    fild        dword ptr [esp+30]
 006FAF41    fstp        qword ptr [esp]
 006FAF44    wait
>006FAF45    jmp         006FBAF7
 006FAF4A    mov         edx,ebx
 006FAF4C    mov         eax,esi
 006FAF4E    call        TWiimoteManager.AnyWaggleGesture
 006FAF53    cmp         al,14
 006FAF55    sete        al
 006FAF58    movsx       eax,al
 006FAF5B    mov         dword ptr [esp+30],eax
 006FAF5F    fild        dword ptr [esp+30]
 006FAF63    fstp        qword ptr [esp]
 006FAF66    wait
>006FAF67    jmp         006FBAF7
 006FAF6C    mov         edx,ebx
 006FAF6E    mov         eax,esi
 006FAF70    call        TWiimoteManager.AnyWaggleGesture
 006FAF75    cmp         al,15
 006FAF77    sete        al
 006FAF7A    movsx       eax,al
 006FAF7D    mov         dword ptr [esp+30],eax
 006FAF81    fild        dword ptr [esp+30]
 006FAF85    fstp        qword ptr [esp]
 006FAF88    wait
>006FAF89    jmp         006FBAF7
 006FAF8E    mov         edx,ebx
 006FAF90    mov         eax,esi
 006FAF92    call        TWiimoteManager.AnyWaggleGesture
 006FAF97    cmp         al,34
 006FAF99    sete        al
 006FAF9C    movsx       eax,al
 006FAF9F    mov         dword ptr [esp+30],eax
 006FAFA3    fild        dword ptr [esp+30]
 006FAFA7    fstp        qword ptr [esp]
 006FAFAA    wait
>006FAFAB    jmp         006FBAF7
 006FAFB0    mov         edx,ebx
 006FAFB2    mov         eax,esi
 006FAFB4    call        TWiimoteManager.AnyWaggleGesture
 006FAFB9    cmp         al,35
 006FAFBB    sete        al
 006FAFBE    movsx       eax,al
 006FAFC1    mov         dword ptr [esp+30],eax
 006FAFC5    fild        dword ptr [esp+30]
 006FAFC9    fstp        qword ptr [esp]
 006FAFCC    wait
>006FAFCD    jmp         006FBAF7
 006FAFD2    mov         edx,ebx
 006FAFD4    mov         eax,esi
 006FAFD6    call        TWiimoteManager.AnyWaggleGesture
 006FAFDB    cmp         al,36
 006FAFDD    sete        al
 006FAFE0    movsx       eax,al
 006FAFE3    mov         dword ptr [esp+30],eax
 006FAFE7    fild        dword ptr [esp+30]
 006FAFEB    fstp        qword ptr [esp]
 006FAFEE    wait
>006FAFEF    jmp         006FBAF7
 006FAFF4    mov         edx,ebx
 006FAFF6    mov         eax,esi
 006FAFF8    call        TWiimoteManager.AnyWaggleGesture
 006FAFFD    cmp         al,37
 006FAFFF    sete        al
 006FB002    movsx       eax,al
 006FB005    mov         dword ptr [esp+30],eax
 006FB009    fild        dword ptr [esp+30]
 006FB00D    fstp        qword ptr [esp]
 006FB010    wait
>006FB011    jmp         006FBAF7
 006FB016    mov         edx,ebx
 006FB018    mov         eax,esi
 006FB01A    call        TWiimoteManager.AnyPartialGesture
 006FB01F    cmp         al,6
 006FB021    sete        al
 006FB024    movsx       eax,al
 006FB027    mov         dword ptr [esp+30],eax
 006FB02B    fild        dword ptr [esp+30]
 006FB02F    fstp        qword ptr [esp]
 006FB032    wait
>006FB033    jmp         006FBAF7
 006FB038    mov         edx,ebx
 006FB03A    mov         eax,esi
 006FB03C    call        TWiimoteManager.AnyPartialGesture
 006FB041    cmp         al,7
 006FB043    sete        al
 006FB046    movsx       eax,al
 006FB049    mov         dword ptr [esp+30],eax
 006FB04D    fild        dword ptr [esp+30]
 006FB051    fstp        qword ptr [esp]
 006FB054    wait
>006FB055    jmp         006FBAF7
 006FB05A    mov         edx,ebx
 006FB05C    mov         eax,esi
 006FB05E    call        TWiimoteManager.AnyPartialGesture
 006FB063    cmp         al,8
 006FB065    sete        al
 006FB068    movsx       eax,al
 006FB06B    mov         dword ptr [esp+30],eax
 006FB06F    fild        dword ptr [esp+30]
 006FB073    fstp        qword ptr [esp]
 006FB076    wait
>006FB077    jmp         006FBAF7
 006FB07C    mov         edx,ebx
 006FB07E    mov         eax,esi
 006FB080    call        TWiimoteManager.AnyPartialGesture
 006FB085    cmp         al,0A
 006FB087    sete        al
 006FB08A    movsx       eax,al
 006FB08D    mov         dword ptr [esp+30],eax
 006FB091    fild        dword ptr [esp+30]
 006FB095    fstp        qword ptr [esp]
 006FB098    wait
>006FB099    jmp         006FBAF7
 006FB09E    mov         edx,ebx
 006FB0A0    mov         eax,esi
 006FB0A2    call        TWiimoteManager.AnyPartialGesture
 006FB0A7    cmp         al,0B
 006FB0A9    sete        al
 006FB0AC    movsx       eax,al
 006FB0AF    mov         dword ptr [esp+30],eax
 006FB0B3    fild        dword ptr [esp+30]
 006FB0B7    fstp        qword ptr [esp]
 006FB0BA    wait
>006FB0BB    jmp         006FBAF7
 006FB0C0    mov         edx,ebx
 006FB0C2    mov         eax,esi
 006FB0C4    call        TWiimoteManager.AnyPartialGesture
 006FB0C9    cmp         al,9
 006FB0CB    sete        al
 006FB0CE    movsx       eax,al
 006FB0D1    mov         dword ptr [esp+30],eax
 006FB0D5    fild        dword ptr [esp+30]
 006FB0D9    fstp        qword ptr [esp]
 006FB0DC    wait
>006FB0DD    jmp         006FBAF7
 006FB0E2    mov         edx,ebx
 006FB0E4    mov         eax,esi
 006FB0E6    call        TWiimoteManager.AnyPartialGesture
 006FB0EB    cmp         al,0C
 006FB0ED    sete        al
 006FB0F0    movsx       eax,al
 006FB0F3    mov         dword ptr [esp+30],eax
 006FB0F7    fild        dword ptr [esp+30]
 006FB0FB    fstp        qword ptr [esp]
 006FB0FE    wait
>006FB0FF    jmp         006FBAF7
 006FB104    mov         edx,ebx
 006FB106    mov         eax,esi
 006FB108    call        TWiimoteManager.AnyPartialGesture
 006FB10D    cmp         al,0D
 006FB10F    sete        al
 006FB112    movsx       eax,al
 006FB115    mov         dword ptr [esp+30],eax
 006FB119    fild        dword ptr [esp+30]
 006FB11D    fstp        qword ptr [esp]
 006FB120    wait
>006FB121    jmp         006FBAF7
 006FB126    mov         edx,ebx
 006FB128    mov         eax,esi
 006FB12A    call        TWiimoteManager.AnyPartialGesture
 006FB12F    cmp         al,0E
 006FB131    sete        al
 006FB134    movsx       eax,al
 006FB137    mov         dword ptr [esp+30],eax
 006FB13B    fild        dword ptr [esp+30]
 006FB13F    fstp        qword ptr [esp]
 006FB142    wait
>006FB143    jmp         006FBAF7
 006FB148    mov         edx,ebx
 006FB14A    mov         eax,esi
 006FB14C    call        TWiimoteManager.AnyPartialGesture
 006FB151    cmp         al,10
 006FB153    sete        al
 006FB156    movsx       eax,al
 006FB159    mov         dword ptr [esp+30],eax
 006FB15D    fild        dword ptr [esp+30]
 006FB161    fstp        qword ptr [esp]
 006FB164    wait
>006FB165    jmp         006FBAF7
 006FB16A    mov         edx,ebx
 006FB16C    mov         eax,esi
 006FB16E    call        TWiimoteManager.AnyPartialGesture
 006FB173    cmp         al,11
 006FB175    sete        al
 006FB178    movsx       eax,al
 006FB17B    mov         dword ptr [esp+30],eax
 006FB17F    fild        dword ptr [esp+30]
 006FB183    fstp        qword ptr [esp]
 006FB186    wait
>006FB187    jmp         006FBAF7
 006FB18C    mov         edx,ebx
 006FB18E    mov         eax,esi
 006FB190    call        TWiimoteManager.AnyPartialGesture
 006FB195    cmp         al,0F
 006FB197    sete        al
 006FB19A    movsx       eax,al
 006FB19D    mov         dword ptr [esp+30],eax
 006FB1A1    fild        dword ptr [esp+30]
 006FB1A5    fstp        qword ptr [esp]
 006FB1A8    wait
>006FB1A9    jmp         006FBAF7
 006FB1AE    mov         edx,ebx
 006FB1B0    mov         eax,esi
 006FB1B2    call        TWiimoteManager.AnyPartialGesture
 006FB1B7    cmp         al,17
 006FB1B9    sete        al
 006FB1BC    movsx       eax,al
 006FB1BF    mov         dword ptr [esp+30],eax
 006FB1C3    fild        dword ptr [esp+30]
 006FB1C7    fstp        qword ptr [esp]
 006FB1CA    wait
>006FB1CB    jmp         006FBAF7
 006FB1D0    mov         edx,ebx
 006FB1D2    mov         eax,esi
 006FB1D4    call        TWiimoteManager.AnyPartialGesture
 006FB1D9    cmp         al,18
 006FB1DB    sete        al
 006FB1DE    movsx       eax,al
 006FB1E1    mov         dword ptr [esp+30],eax
 006FB1E5    fild        dword ptr [esp+30]
 006FB1E9    fstp        qword ptr [esp]
 006FB1EC    wait
>006FB1ED    jmp         006FBAF7
 006FB1F2    mov         edx,ebx
 006FB1F4    mov         eax,esi
 006FB1F6    call        TWiimoteManager.AnyPartialGesture
 006FB1FB    cmp         al,19
 006FB1FD    sete        al
 006FB200    movsx       eax,al
 006FB203    mov         dword ptr [esp+30],eax
 006FB207    fild        dword ptr [esp+30]
 006FB20B    fstp        qword ptr [esp]
 006FB20E    wait
>006FB20F    jmp         006FBAF7
 006FB214    mov         edx,ebx
 006FB216    mov         eax,esi
 006FB218    call        TWiimoteManager.AnyPartialGesture
 006FB21D    cmp         al,1B
 006FB21F    sete        al
 006FB222    movsx       eax,al
 006FB225    mov         dword ptr [esp+30],eax
 006FB229    fild        dword ptr [esp+30]
 006FB22D    fstp        qword ptr [esp]
 006FB230    wait
>006FB231    jmp         006FBAF7
 006FB236    mov         edx,ebx
 006FB238    mov         eax,esi
 006FB23A    call        TWiimoteManager.AnyPartialGesture
 006FB23F    cmp         al,1C
 006FB241    sete        al
 006FB244    movsx       eax,al
 006FB247    mov         dword ptr [esp+30],eax
 006FB24B    fild        dword ptr [esp+30]
 006FB24F    fstp        qword ptr [esp]
 006FB252    wait
>006FB253    jmp         006FBAF7
 006FB258    mov         edx,ebx
 006FB25A    mov         eax,esi
 006FB25C    call        TWiimoteManager.AnyPartialGesture
 006FB261    cmp         al,1A
 006FB263    sete        al
 006FB266    movsx       eax,al
 006FB269    mov         dword ptr [esp+30],eax
 006FB26D    fild        dword ptr [esp+30]
 006FB271    fstp        qword ptr [esp]
 006FB274    wait
>006FB275    jmp         006FBAF7
 006FB27A    mov         edx,ebx
 006FB27C    mov         eax,esi
 006FB27E    call        TWiimoteManager.AnyPartialGesture
 006FB283    cmp         al,1D
 006FB285    sete        al
 006FB288    movsx       eax,al
 006FB28B    mov         dword ptr [esp+30],eax
 006FB28F    fild        dword ptr [esp+30]
 006FB293    fstp        qword ptr [esp]
 006FB296    wait
>006FB297    jmp         006FBAF7
 006FB29C    mov         edx,ebx
 006FB29E    mov         eax,esi
 006FB2A0    call        TWiimoteManager.AnyPartialGesture
 006FB2A5    cmp         al,1E
 006FB2A7    sete        al
 006FB2AA    movsx       eax,al
 006FB2AD    mov         dword ptr [esp+30],eax
 006FB2B1    fild        dword ptr [esp+30]
 006FB2B5    fstp        qword ptr [esp]
 006FB2B8    wait
>006FB2B9    jmp         006FBAF7
 006FB2BE    mov         edx,ebx
 006FB2C0    mov         eax,esi
 006FB2C2    call        TWiimoteManager.AnyPartialGesture
 006FB2C7    cmp         al,1F
 006FB2C9    sete        al
 006FB2CC    movsx       eax,al
 006FB2CF    mov         dword ptr [esp+30],eax
 006FB2D3    fild        dword ptr [esp+30]
 006FB2D7    fstp        qword ptr [esp]
 006FB2DA    wait
>006FB2DB    jmp         006FBAF7
 006FB2E0    mov         edx,ebx
 006FB2E2    mov         eax,esi
 006FB2E4    call        TWiimoteManager.AnyPartialGesture
 006FB2E9    cmp         al,21
 006FB2EB    sete        al
 006FB2EE    movsx       eax,al
 006FB2F1    mov         dword ptr [esp+30],eax
 006FB2F5    fild        dword ptr [esp+30]
 006FB2F9    fstp        qword ptr [esp]
 006FB2FC    wait
>006FB2FD    jmp         006FBAF7
 006FB302    mov         edx,ebx
 006FB304    mov         eax,esi
 006FB306    call        TWiimoteManager.AnyPartialGesture
 006FB30B    cmp         al,22
 006FB30D    sete        al
 006FB310    movsx       eax,al
 006FB313    mov         dword ptr [esp+30],eax
 006FB317    fild        dword ptr [esp+30]
 006FB31B    fstp        qword ptr [esp]
 006FB31E    wait
>006FB31F    jmp         006FBAF7
 006FB324    mov         edx,ebx
 006FB326    mov         eax,esi
 006FB328    call        TWiimoteManager.AnyPartialGesture
 006FB32D    cmp         al,20
 006FB32F    sete        al
 006FB332    movsx       eax,al
 006FB335    mov         dword ptr [esp+30],eax
 006FB339    fild        dword ptr [esp+30]
 006FB33D    fstp        qword ptr [esp]
 006FB340    wait
>006FB341    jmp         006FBAF7
 006FB346    mov         edx,ebx
 006FB348    mov         eax,esi
 006FB34A    call        TWiimoteManager.AnyPartialGesture
 006FB34F    cmp         al,28
 006FB351    sete        al
 006FB354    movsx       eax,al
 006FB357    mov         dword ptr [esp+30],eax
 006FB35B    fild        dword ptr [esp+30]
 006FB35F    fstp        qword ptr [esp]
 006FB362    wait
>006FB363    jmp         006FBAF7
 006FB368    mov         edx,ebx
 006FB36A    mov         eax,esi
 006FB36C    call        TWiimoteManager.AnyPartialGesture
 006FB371    cmp         al,29
 006FB373    sete        al
 006FB376    movsx       eax,al
 006FB379    mov         dword ptr [esp+30],eax
 006FB37D    fild        dword ptr [esp+30]
 006FB381    fstp        qword ptr [esp]
 006FB384    wait
>006FB385    jmp         006FBAF7
 006FB38A    mov         edx,ebx
 006FB38C    mov         eax,esi
 006FB38E    call        TWiimoteManager.AnyPartialGesture
 006FB393    cmp         al,2A
 006FB395    sete        al
 006FB398    movsx       eax,al
 006FB39B    mov         dword ptr [esp+30],eax
 006FB39F    fild        dword ptr [esp+30]
 006FB3A3    fstp        qword ptr [esp]
 006FB3A6    wait
>006FB3A7    jmp         006FBAF7
 006FB3AC    mov         edx,ebx
 006FB3AE    mov         eax,esi
 006FB3B0    call        TWiimoteManager.AnyPartialGesture
 006FB3B5    cmp         al,2C
 006FB3B7    sete        al
 006FB3BA    movsx       eax,al
 006FB3BD    mov         dword ptr [esp+30],eax
 006FB3C1    fild        dword ptr [esp+30]
 006FB3C5    fstp        qword ptr [esp]
 006FB3C8    wait
>006FB3C9    jmp         006FBAF7
 006FB3CE    mov         edx,ebx
 006FB3D0    mov         eax,esi
 006FB3D2    call        TWiimoteManager.AnyPartialGesture
 006FB3D7    cmp         al,2D
 006FB3D9    sete        al
 006FB3DC    movsx       eax,al
 006FB3DF    mov         dword ptr [esp+30],eax
 006FB3E3    fild        dword ptr [esp+30]
 006FB3E7    fstp        qword ptr [esp]
 006FB3EA    wait
>006FB3EB    jmp         006FBAF7
 006FB3F0    mov         edx,ebx
 006FB3F2    mov         eax,esi
 006FB3F4    call        TWiimoteManager.AnyPartialGesture
 006FB3F9    cmp         al,2B
 006FB3FB    sete        al
 006FB3FE    movsx       eax,al
 006FB401    mov         dword ptr [esp+30],eax
 006FB405    fild        dword ptr [esp+30]
 006FB409    fstp        qword ptr [esp]
 006FB40C    wait
>006FB40D    jmp         006FBAF7
 006FB412    mov         edx,ebx
 006FB414    mov         eax,esi
 006FB416    call        TWiimoteManager.AnyPartialGesture
 006FB41B    cmp         al,2E
 006FB41D    sete        al
 006FB420    movsx       eax,al
 006FB423    mov         dword ptr [esp+30],eax
 006FB427    fild        dword ptr [esp+30]
 006FB42B    fstp        qword ptr [esp]
 006FB42E    wait
>006FB42F    jmp         006FBAF7
 006FB434    mov         edx,ebx
 006FB436    mov         eax,esi
 006FB438    call        TWiimoteManager.AnyPartialGesture
 006FB43D    cmp         al,2F
 006FB43F    sete        al
 006FB442    movsx       eax,al
 006FB445    mov         dword ptr [esp+30],eax
 006FB449    fild        dword ptr [esp+30]
 006FB44D    fstp        qword ptr [esp]
 006FB450    wait
>006FB451    jmp         006FBAF7
 006FB456    mov         edx,ebx
 006FB458    mov         eax,esi
 006FB45A    call        TWiimoteManager.AnyPartialGesture
 006FB45F    cmp         al,30
 006FB461    sete        al
 006FB464    movsx       eax,al
 006FB467    mov         dword ptr [esp+30],eax
 006FB46B    fild        dword ptr [esp+30]
 006FB46F    fstp        qword ptr [esp]
 006FB472    wait
>006FB473    jmp         006FBAF7
 006FB478    mov         edx,ebx
 006FB47A    mov         eax,esi
 006FB47C    call        TWiimoteManager.AnyPartialGesture
 006FB481    cmp         al,32
 006FB483    sete        al
 006FB486    movsx       eax,al
 006FB489    mov         dword ptr [esp+30],eax
 006FB48D    fild        dword ptr [esp+30]
 006FB491    fstp        qword ptr [esp]
 006FB494    wait
>006FB495    jmp         006FBAF7
 006FB49A    mov         edx,ebx
 006FB49C    mov         eax,esi
 006FB49E    call        TWiimoteManager.AnyPartialGesture
 006FB4A3    cmp         al,33
 006FB4A5    sete        al
 006FB4A8    movsx       eax,al
 006FB4AB    mov         dword ptr [esp+30],eax
 006FB4AF    fild        dword ptr [esp+30]
 006FB4B3    fstp        qword ptr [esp]
 006FB4B6    wait
>006FB4B7    jmp         006FBAF7
 006FB4BC    mov         edx,ebx
 006FB4BE    mov         eax,esi
 006FB4C0    call        TWiimoteManager.AnyPartialGesture
 006FB4C5    cmp         al,31
 006FB4C7    sete        al
 006FB4CA    movsx       eax,al
 006FB4CD    mov         dword ptr [esp+30],eax
 006FB4D1    fild        dword ptr [esp+30]
 006FB4D5    fstp        qword ptr [esp]
 006FB4D8    wait
>006FB4D9    jmp         006FBAF7
 006FB4DE    mov         edx,ebx
 006FB4E0    mov         eax,esi
 006FB4E2    call        TWiimoteManager.AnyPartialGesture
 006FB4E7    cmp         al,39
 006FB4E9    sete        al
 006FB4EC    movsx       eax,al
 006FB4EF    mov         dword ptr [esp+30],eax
 006FB4F3    fild        dword ptr [esp+30]
 006FB4F7    fstp        qword ptr [esp]
 006FB4FA    wait
>006FB4FB    jmp         006FBAF7
 006FB500    mov         edx,ebx
 006FB502    mov         eax,esi
 006FB504    call        TWiimoteManager.AnyPartialGesture
 006FB509    cmp         al,3A
 006FB50B    sete        al
 006FB50E    movsx       eax,al
 006FB511    mov         dword ptr [esp+30],eax
 006FB515    fild        dword ptr [esp+30]
 006FB519    fstp        qword ptr [esp]
 006FB51C    wait
>006FB51D    jmp         006FBAF7
 006FB522    mov         edx,ebx
 006FB524    mov         eax,esi
 006FB526    call        TWiimoteManager.AnyPartialGesture
 006FB52B    cmp         al,3B
 006FB52D    sete        al
 006FB530    movsx       eax,al
 006FB533    mov         dword ptr [esp+30],eax
 006FB537    fild        dword ptr [esp+30]
 006FB53B    fstp        qword ptr [esp]
 006FB53E    wait
>006FB53F    jmp         006FBAF7
 006FB544    mov         edx,ebx
 006FB546    mov         eax,esi
 006FB548    call        TWiimoteManager.AnyPartialGesture
 006FB54D    cmp         al,3D
 006FB54F    sete        al
 006FB552    movsx       eax,al
 006FB555    mov         dword ptr [esp+30],eax
 006FB559    fild        dword ptr [esp+30]
 006FB55D    fstp        qword ptr [esp]
 006FB560    wait
>006FB561    jmp         006FBAF7
 006FB566    mov         edx,ebx
 006FB568    mov         eax,esi
 006FB56A    call        TWiimoteManager.AnyPartialGesture
 006FB56F    cmp         al,3E
 006FB571    sete        al
 006FB574    movsx       eax,al
 006FB577    mov         dword ptr [esp+30],eax
 006FB57B    fild        dword ptr [esp+30]
 006FB57F    fstp        qword ptr [esp]
 006FB582    wait
>006FB583    jmp         006FBAF7
 006FB588    mov         edx,ebx
 006FB58A    mov         eax,esi
 006FB58C    call        TWiimoteManager.AnyPartialGesture
 006FB591    cmp         al,3C
 006FB593    sete        al
 006FB596    movsx       eax,al
 006FB599    mov         dword ptr [esp+30],eax
 006FB59D    fild        dword ptr [esp+30]
 006FB5A1    fstp        qword ptr [esp]
 006FB5A4    wait
>006FB5A5    jmp         006FBAF7
 006FB5AA    mov         edx,ebx
 006FB5AC    mov         eax,esi
 006FB5AE    call        TWiimoteManager.AnyPartialGesture
 006FB5B3    cmp         al,3F
 006FB5B5    sete        al
 006FB5B8    movsx       eax,al
 006FB5BB    mov         dword ptr [esp+30],eax
 006FB5BF    fild        dword ptr [esp+30]
 006FB5C3    fstp        qword ptr [esp]
 006FB5C6    wait
>006FB5C7    jmp         006FBAF7
 006FB5CC    mov         edx,ebx
 006FB5CE    mov         eax,esi
 006FB5D0    call        TWiimoteManager.AnyPartialGesture
 006FB5D5    cmp         al,40
 006FB5D7    sete        al
 006FB5DA    movsx       eax,al
 006FB5DD    mov         dword ptr [esp+30],eax
 006FB5E1    fild        dword ptr [esp+30]
 006FB5E5    fstp        qword ptr [esp]
 006FB5E8    wait
>006FB5E9    jmp         006FBAF7
 006FB5EE    mov         edx,ebx
 006FB5F0    mov         eax,esi
 006FB5F2    call        TWiimoteManager.AnyPartialGesture
 006FB5F7    cmp         al,41
 006FB5F9    sete        al
 006FB5FC    movsx       eax,al
 006FB5FF    mov         dword ptr [esp+30],eax
 006FB603    fild        dword ptr [esp+30]
 006FB607    fstp        qword ptr [esp]
 006FB60A    wait
>006FB60B    jmp         006FBAF7
 006FB610    mov         edx,ebx
 006FB612    mov         eax,esi
 006FB614    call        TWiimoteManager.AnyPartialGesture
 006FB619    cmp         al,43
 006FB61B    sete        al
 006FB61E    movsx       eax,al
 006FB621    mov         dword ptr [esp+30],eax
 006FB625    fild        dword ptr [esp+30]
 006FB629    fstp        qword ptr [esp]
 006FB62C    wait
>006FB62D    jmp         006FBAF7
 006FB632    mov         edx,ebx
 006FB634    mov         eax,esi
 006FB636    call        TWiimoteManager.AnyPartialGesture
 006FB63B    cmp         al,44
 006FB63D    sete        al
 006FB640    movsx       eax,al
 006FB643    mov         dword ptr [esp+30],eax
 006FB647    fild        dword ptr [esp+30]
 006FB64B    fstp        qword ptr [esp]
 006FB64E    wait
>006FB64F    jmp         006FBAF7
 006FB654    mov         edx,ebx
 006FB656    mov         eax,esi
 006FB658    call        TWiimoteManager.AnyPartialGesture
 006FB65D    cmp         al,42
 006FB65F    sete        al
 006FB662    movsx       eax,al
 006FB665    mov         dword ptr [esp+30],eax
 006FB669    fild        dword ptr [esp+30]
 006FB66D    fstp        qword ptr [esp]
 006FB670    wait
>006FB671    jmp         006FBAF7
 006FB676    mov         edx,ebx
 006FB678    mov         eax,esi
 006FB67A    call        TWiimoteManager.AnyWaggleGesture
 006FB67F    cmp         al,6
 006FB681    sete        al
 006FB684    movsx       eax,al
 006FB687    mov         dword ptr [esp+30],eax
 006FB68B    fild        dword ptr [esp+30]
 006FB68F    fstp        qword ptr [esp]
 006FB692    wait
>006FB693    jmp         006FBAF7
 006FB698    mov         edx,ebx
 006FB69A    mov         eax,esi
 006FB69C    call        TWiimoteManager.AnyWaggleGesture
 006FB6A1    cmp         al,7
 006FB6A3    sete        al
 006FB6A6    movsx       eax,al
 006FB6A9    mov         dword ptr [esp+30],eax
 006FB6AD    fild        dword ptr [esp+30]
 006FB6B1    fstp        qword ptr [esp]
 006FB6B4    wait
>006FB6B5    jmp         006FBAF7
 006FB6BA    mov         edx,ebx
 006FB6BC    mov         eax,esi
 006FB6BE    call        TWiimoteManager.AnyWaggleGesture
 006FB6C3    cmp         al,8
 006FB6C5    sete        al
 006FB6C8    movsx       eax,al
 006FB6CB    mov         dword ptr [esp+30],eax
 006FB6CF    fild        dword ptr [esp+30]
 006FB6D3    fstp        qword ptr [esp]
 006FB6D6    wait
>006FB6D7    jmp         006FBAF7
 006FB6DC    mov         edx,ebx
 006FB6DE    mov         eax,esi
 006FB6E0    call        TWiimoteManager.AnyWaggleGesture
 006FB6E5    cmp         al,0A
 006FB6E7    sete        al
 006FB6EA    movsx       eax,al
 006FB6ED    mov         dword ptr [esp+30],eax
 006FB6F1    fild        dword ptr [esp+30]
 006FB6F5    fstp        qword ptr [esp]
 006FB6F8    wait
>006FB6F9    jmp         006FBAF7
 006FB6FE    mov         edx,ebx
 006FB700    mov         eax,esi
 006FB702    call        TWiimoteManager.AnyWaggleGesture
 006FB707    cmp         al,0C
 006FB709    sete        al
 006FB70C    movsx       eax,al
 006FB70F    mov         dword ptr [esp+30],eax
 006FB713    fild        dword ptr [esp+30]
 006FB717    fstp        qword ptr [esp]
 006FB71A    wait
>006FB71B    jmp         006FBAF7
 006FB720    mov         edx,ebx
 006FB722    mov         eax,esi
 006FB724    call        TWiimoteManager.AnyWaggleGesture
 006FB729    cmp         al,0D
 006FB72B    sete        al
 006FB72E    movsx       eax,al
 006FB731    mov         dword ptr [esp+30],eax
 006FB735    fild        dword ptr [esp+30]
 006FB739    fstp        qword ptr [esp]
 006FB73C    wait
>006FB73D    jmp         006FBAF7
 006FB742    mov         edx,ebx
 006FB744    mov         eax,esi
 006FB746    call        TWiimoteManager.AnyWaggleGesture
 006FB74B    cmp         al,0E
 006FB74D    sete        al
 006FB750    movsx       eax,al
 006FB753    mov         dword ptr [esp+30],eax
 006FB757    fild        dword ptr [esp+30]
 006FB75B    fstp        qword ptr [esp]
 006FB75E    wait
>006FB75F    jmp         006FBAF7
 006FB764    mov         edx,ebx
 006FB766    mov         eax,esi
 006FB768    call        TWiimoteManager.AnyWaggleGesture
 006FB76D    cmp         al,10
 006FB76F    sete        al
 006FB772    movsx       eax,al
 006FB775    mov         dword ptr [esp+30],eax
 006FB779    fild        dword ptr [esp+30]
 006FB77D    fstp        qword ptr [esp]
 006FB780    wait
>006FB781    jmp         006FBAF7
 006FB786    mov         edx,ebx
 006FB788    mov         eax,esi
 006FB78A    call        TWiimoteManager.AnyWaggleGesture
 006FB78F    cmp         al,17
 006FB791    sete        al
 006FB794    movsx       eax,al
 006FB797    mov         dword ptr [esp+30],eax
 006FB79B    fild        dword ptr [esp+30]
 006FB79F    fstp        qword ptr [esp]
 006FB7A2    wait
>006FB7A3    jmp         006FBAF7
 006FB7A8    mov         edx,ebx
 006FB7AA    mov         eax,esi
 006FB7AC    call        TWiimoteManager.AnyWaggleGesture
 006FB7B1    cmp         al,18
 006FB7B3    sete        al
 006FB7B6    movsx       eax,al
 006FB7B9    mov         dword ptr [esp+30],eax
 006FB7BD    fild        dword ptr [esp+30]
 006FB7C1    fstp        qword ptr [esp]
 006FB7C4    wait
>006FB7C5    jmp         006FBAF7
 006FB7CA    mov         edx,ebx
 006FB7CC    mov         eax,esi
 006FB7CE    call        TWiimoteManager.AnyWaggleGesture
 006FB7D3    cmp         al,19
 006FB7D5    sete        al
 006FB7D8    movsx       eax,al
 006FB7DB    mov         dword ptr [esp+30],eax
 006FB7DF    fild        dword ptr [esp+30]
 006FB7E3    fstp        qword ptr [esp]
 006FB7E6    wait
>006FB7E7    jmp         006FBAF7
 006FB7EC    mov         edx,ebx
 006FB7EE    mov         eax,esi
 006FB7F0    call        TWiimoteManager.AnyWaggleGesture
 006FB7F5    cmp         al,1B
 006FB7F7    sete        al
 006FB7FA    movsx       eax,al
 006FB7FD    mov         dword ptr [esp+30],eax
 006FB801    fild        dword ptr [esp+30]
 006FB805    fstp        qword ptr [esp]
 006FB808    wait
>006FB809    jmp         006FBAF7
 006FB80E    mov         edx,ebx
 006FB810    mov         eax,esi
 006FB812    call        TWiimoteManager.AnyWaggleGesture
 006FB817    cmp         al,1D
 006FB819    sete        al
 006FB81C    movsx       eax,al
 006FB81F    mov         dword ptr [esp+30],eax
 006FB823    fild        dword ptr [esp+30]
 006FB827    fstp        qword ptr [esp]
 006FB82A    wait
>006FB82B    jmp         006FBAF7
 006FB830    mov         edx,ebx
 006FB832    mov         eax,esi
 006FB834    call        TWiimoteManager.AnyWaggleGesture
 006FB839    cmp         al,1E
 006FB83B    sete        al
 006FB83E    movsx       eax,al
 006FB841    mov         dword ptr [esp+30],eax
 006FB845    fild        dword ptr [esp+30]
 006FB849    fstp        qword ptr [esp]
 006FB84C    wait
>006FB84D    jmp         006FBAF7
 006FB852    mov         edx,ebx
 006FB854    mov         eax,esi
 006FB856    call        TWiimoteManager.AnyWaggleGesture
 006FB85B    cmp         al,1F
 006FB85D    sete        al
 006FB860    movsx       eax,al
 006FB863    mov         dword ptr [esp+30],eax
 006FB867    fild        dword ptr [esp+30]
 006FB86B    fstp        qword ptr [esp]
 006FB86E    wait
>006FB86F    jmp         006FBAF7
 006FB874    mov         edx,ebx
 006FB876    mov         eax,esi
 006FB878    call        TWiimoteManager.AnyWaggleGesture
 006FB87D    cmp         al,21
 006FB87F    sete        al
 006FB882    movsx       eax,al
 006FB885    mov         dword ptr [esp+30],eax
 006FB889    fild        dword ptr [esp+30]
 006FB88D    fstp        qword ptr [esp]
 006FB890    wait
>006FB891    jmp         006FBAF7
 006FB896    mov         edx,ebx
 006FB898    mov         eax,esi
 006FB89A    call        TWiimoteManager.AnyWaggleGesture
 006FB89F    cmp         al,28
 006FB8A1    sete        al
 006FB8A4    movsx       eax,al
 006FB8A7    mov         dword ptr [esp+30],eax
 006FB8AB    fild        dword ptr [esp+30]
 006FB8AF    fstp        qword ptr [esp]
 006FB8B2    wait
>006FB8B3    jmp         006FBAF7
 006FB8B8    mov         edx,ebx
 006FB8BA    mov         eax,esi
 006FB8BC    call        TWiimoteManager.AnyWaggleGesture
 006FB8C1    cmp         al,29
 006FB8C3    sete        al
 006FB8C6    movsx       eax,al
 006FB8C9    mov         dword ptr [esp+30],eax
 006FB8CD    fild        dword ptr [esp+30]
 006FB8D1    fstp        qword ptr [esp]
 006FB8D4    wait
>006FB8D5    jmp         006FBAF7
 006FB8DA    mov         edx,ebx
 006FB8DC    mov         eax,esi
 006FB8DE    call        TWiimoteManager.AnyWaggleGesture
 006FB8E3    cmp         al,2A
 006FB8E5    sete        al
 006FB8E8    movsx       eax,al
 006FB8EB    mov         dword ptr [esp+30],eax
 006FB8EF    fild        dword ptr [esp+30]
 006FB8F3    fstp        qword ptr [esp]
 006FB8F6    wait
>006FB8F7    jmp         006FBAF7
 006FB8FC    mov         edx,ebx
 006FB8FE    mov         eax,esi
 006FB900    call        TWiimoteManager.AnyWaggleGesture
 006FB905    cmp         al,2C
 006FB907    sete        al
 006FB90A    movsx       eax,al
 006FB90D    mov         dword ptr [esp+30],eax
 006FB911    fild        dword ptr [esp+30]
 006FB915    fstp        qword ptr [esp]
 006FB918    wait
>006FB919    jmp         006FBAF7
 006FB91E    mov         edx,ebx
 006FB920    mov         eax,esi
 006FB922    call        TWiimoteManager.AnyWaggleGesture
 006FB927    cmp         al,2E
 006FB929    sete        al
 006FB92C    movsx       eax,al
 006FB92F    mov         dword ptr [esp+30],eax
 006FB933    fild        dword ptr [esp+30]
 006FB937    fstp        qword ptr [esp]
 006FB93A    wait
>006FB93B    jmp         006FBAF7
 006FB940    mov         edx,ebx
 006FB942    mov         eax,esi
 006FB944    call        TWiimoteManager.AnyWaggleGesture
 006FB949    cmp         al,2F
 006FB94B    sete        al
 006FB94E    movsx       eax,al
 006FB951    mov         dword ptr [esp+30],eax
 006FB955    fild        dword ptr [esp+30]
 006FB959    fstp        qword ptr [esp]
 006FB95C    wait
>006FB95D    jmp         006FBAF7
 006FB962    mov         edx,ebx
 006FB964    mov         eax,esi
 006FB966    call        TWiimoteManager.AnyWaggleGesture
 006FB96B    cmp         al,30
 006FB96D    sete        al
 006FB970    movsx       eax,al
 006FB973    mov         dword ptr [esp+30],eax
 006FB977    fild        dword ptr [esp+30]
 006FB97B    fstp        qword ptr [esp]
 006FB97E    wait
>006FB97F    jmp         006FBAF7
 006FB984    mov         edx,ebx
 006FB986    mov         eax,esi
 006FB988    call        TWiimoteManager.AnyWaggleGesture
 006FB98D    cmp         al,32
 006FB98F    sete        al
 006FB992    movsx       eax,al
 006FB995    mov         dword ptr [esp+30],eax
 006FB999    fild        dword ptr [esp+30]
 006FB99D    fstp        qword ptr [esp]
 006FB9A0    wait
>006FB9A1    jmp         006FBAF7
 006FB9A6    mov         edx,ebx
 006FB9A8    mov         eax,esi
 006FB9AA    call        TWiimoteManager.AnyWaggleGesture
 006FB9AF    cmp         al,39
 006FB9B1    sete        al
 006FB9B4    movsx       eax,al
 006FB9B7    mov         dword ptr [esp+30],eax
 006FB9BB    fild        dword ptr [esp+30]
 006FB9BF    fstp        qword ptr [esp]
 006FB9C2    wait
>006FB9C3    jmp         006FBAF7
 006FB9C8    mov         edx,ebx
 006FB9CA    mov         eax,esi
 006FB9CC    call        TWiimoteManager.AnyWaggleGesture
 006FB9D1    cmp         al,3A
 006FB9D3    sete        al
 006FB9D6    movsx       eax,al
 006FB9D9    mov         dword ptr [esp+30],eax
 006FB9DD    fild        dword ptr [esp+30]
 006FB9E1    fstp        qword ptr [esp]
 006FB9E4    wait
>006FB9E5    jmp         006FBAF7
 006FB9EA    mov         edx,ebx
 006FB9EC    mov         eax,esi
 006FB9EE    call        TWiimoteManager.AnyWaggleGesture
 006FB9F3    cmp         al,3B
 006FB9F5    sete        al
 006FB9F8    movsx       eax,al
 006FB9FB    mov         dword ptr [esp+30],eax
 006FB9FF    fild        dword ptr [esp+30]
 006FBA03    fstp        qword ptr [esp]
 006FBA06    wait
>006FBA07    jmp         006FBAF7
 006FBA0C    mov         edx,ebx
 006FBA0E    mov         eax,esi
 006FBA10    call        TWiimoteManager.AnyWaggleGesture
 006FBA15    cmp         al,3D
 006FBA17    sete        al
 006FBA1A    movsx       eax,al
 006FBA1D    mov         dword ptr [esp+30],eax
 006FBA21    fild        dword ptr [esp+30]
 006FBA25    fstp        qword ptr [esp]
 006FBA28    wait
>006FBA29    jmp         006FBAF7
 006FBA2E    mov         edx,ebx
 006FBA30    mov         eax,esi
 006FBA32    call        TWiimoteManager.AnyWaggleGesture
 006FBA37    cmp         al,3F
 006FBA39    sete        al
 006FBA3C    movsx       eax,al
 006FBA3F    mov         dword ptr [esp+30],eax
 006FBA43    fild        dword ptr [esp+30]
 006FBA47    fstp        qword ptr [esp]
 006FBA4A    wait
>006FBA4B    jmp         006FBAF7
 006FBA50    mov         edx,ebx
 006FBA52    mov         eax,esi
 006FBA54    call        TWiimoteManager.AnyWaggleGesture
 006FBA59    cmp         al,40
 006FBA5B    sete        al
 006FBA5E    movsx       eax,al
 006FBA61    mov         dword ptr [esp+30],eax
 006FBA65    fild        dword ptr [esp+30]
 006FBA69    fstp        qword ptr [esp]
 006FBA6C    wait
>006FBA6D    jmp         006FBAF7
 006FBA72    mov         edx,ebx
 006FBA74    mov         eax,esi
 006FBA76    call        TWiimoteManager.AnyWaggleGesture
 006FBA7B    cmp         al,41
 006FBA7D    sete        al
 006FBA80    movsx       eax,al
 006FBA83    mov         dword ptr [esp+30],eax
 006FBA87    fild        dword ptr [esp+30]
 006FBA8B    fstp        qword ptr [esp]
 006FBA8E    wait
>006FBA8F    jmp         006FBAF7
 006FBA91    mov         edx,ebx
 006FBA93    mov         eax,esi
 006FBA95    call        TWiimoteManager.AnyWaggleGesture
 006FBA9A    cmp         al,43
 006FBA9C    sete        al
 006FBA9F    movsx       eax,al
 006FBAA2    mov         dword ptr [esp+30],eax
 006FBAA6    fild        dword ptr [esp+30]
 006FBAAA    fstp        qword ptr [esp]
 006FBAAD    wait
>006FBAAE    jmp         006FBAF7
 006FBAB0    mov         edx,ebx
 006FBAB2    mov         eax,esi
 006FBAB4    call        TWiimoteManager.AnyPartialGesture
 006FBAB9    cmp         al,46
 006FBABB    sete        al
 006FBABE    movsx       eax,al
 006FBAC1    mov         dword ptr [esp+30],eax
 006FBAC5    fild        dword ptr [esp+30]
 006FBAC9    fstp        qword ptr [esp]
 006FBACC    wait
>006FBACD    jmp         006FBAF7
 006FBACF    mov         edx,ebx
 006FBAD1    mov         eax,esi
 006FBAD3    call        TWiimoteManager.AnyPartialGesture
 006FBAD8    cmp         al,45
 006FBADA    sete        al
 006FBADD    movsx       eax,al
 006FBAE0    mov         dword ptr [esp+30],eax
 006FBAE4    fild        dword ptr [esp+30]
 006FBAE8    fstp        qword ptr [esp]
 006FBAEB    wait
>006FBAEC    jmp         006FBAF7
 006FBAEE    xor         eax,eax
 006FBAF0    mov         dword ptr [esp],eax
 006FBAF3    mov         dword ptr [esp+4],eax
 006FBAF7    fld         qword ptr [esp]
 006FBAFA    add         esp,44
 006FBAFD    pop         ebp
 006FBAFE    pop         edi
 006FBAFF    pop         esi
 006FBB00    pop         ebx
 006FBB01    ret
*}
end;

//006FBB28
procedure TAnyValue.GetVector(x:Double; y:Double; z:Double);
begin
{*
 006FBB28    push        ebp
 006FBB29    mov         ebp,esp
 006FBB2B    add         esp,0FFFFFFC0
 006FBB2E    push        ebx
 006FBB2F    push        esi
 006FBB30    push        edi
 006FBB31    mov         dword ptr [ebp-0C],ecx
 006FBB34    mov         dword ptr [ebp-8],edx
 006FBB37    mov         dword ptr [ebp-4],eax
 006FBB3A    call        0074BF10
 006FBB3F    mov         esi,eax
 006FBB41    mov         eax,esi
 006FBB43    call        TWiimoteManager.AnyCount
 006FBB48    mov         edi,eax
 006FBB4A    call        006EE450
 006FBB4F    mov         dword ptr [ebp-18],eax
 006FBB52    mov         eax,dword ptr [ebp-4]
 006FBB55    mov         ebx,dword ptr [eax+18];TAnyValue...........................................................
 006FBB58    mov         edx,ebx
 006FBB5A    mov         eax,esi
 006FBB5C    call        TWiimoteManager.GetAny
 006FBB61    mov         dword ptr [ebp-10],eax
 006FBB64    test        ebx,ebx
>006FBB66    jg          006FBB6F
 006FBB68    xor         eax,eax
 006FBB6A    mov         dword ptr [ebp-14],eax
>006FBB6D    jmp         006FBB83
 006FBB6F    cmp         edi,ebx
>006FBB71    jl          006FBB7C
 006FBB73    mov         dword ptr [ebp-14],0FFFFFFFF
>006FBB7A    jmp         006FBB83
 006FBB7C    mov         eax,ebx
 006FBB7E    sub         eax,edi
 006FBB80    mov         dword ptr [ebp-14],eax
 006FBB83    test        ebx,ebx
>006FBB85    jg          006FBB8B
 006FBB87    xor         edi,edi
>006FBB89    jmp         006FBBA2
 006FBB8B    mov         eax,dword ptr [ebp-18]
 006FBB8E    add         eax,edi
 006FBB90    cmp         ebx,eax
>006FBB92    jg          006FBB99
 006FBB94    or          edi,0FFFFFFFF
>006FBB97    jmp         006FBBA2
 006FBB99    mov         eax,ebx
 006FBB9B    sub         eax,edi
 006FBB9D    sub         eax,dword ptr [ebp-18]
 006FBBA0    mov         edi,eax
 006FBBA2    mov         eax,dword ptr [ebp-8]
 006FBBA5    xor         edx,edx
 006FBBA7    mov         dword ptr [eax],edx
 006FBBA9    mov         dword ptr [eax+4],edx
 006FBBAC    mov         eax,dword ptr [ebp-0C]
 006FBBAF    xor         edx,edx
 006FBBB1    mov         dword ptr [eax],edx
 006FBBB3    mov         dword ptr [eax+4],edx
 006FBBB6    mov         eax,dword ptr [ebp+8]
 006FBBB9    xor         edx,edx
 006FBBBB    mov         dword ptr [eax],edx
 006FBBBD    mov         dword ptr [eax+4],edx
 006FBBC0    mov         eax,dword ptr [ebp-4]
 006FBBC3    mov         eax,dword ptr [eax+20];TAnyValue........................................Item:Integer
 006FBBC6    add         eax,0FFFFFFA0
 006FBBC9    cmp         eax,0C
>006FBBCC    ja          006FC0CC
 006FBBD2    jmp         dword ptr [eax*4+6FBBD9]
 006FBBD2    dd          006FC09A
 006FBBD2    dd          006FC068
 006FBBD2    dd          006FC017
 006FBBD2    dd          006FC0CC
 006FBBD2    dd          006FC0CC
 006FBBD2    dd          006FC0CC
 006FBBD2    dd          006FC0CC
 006FBBD2    dd          006FBC0D
 006FBBD2    dd          006FBD30
 006FBBD2    dd          006FBE37
 006FBBD2    dd          006FBE76
 006FBBD2    dd          006FBEB5
 006FBBD2    dd          006FBFD8
 006FBC0D    mov         edx,ebx
 006FBC0F    mov         eax,esi
 006FBC11    call        TWiimoteManager.AnyX
 006FBC16    fstp        qword ptr [ebp-20]
 006FBC19    wait
 006FBC1A    mov         eax,edi
 006FBC1C    call        006F8B48
 006FBC21    fadd        qword ptr [ebp-20]
 006FBC24    fstp        tbyte ptr [ebp-2C]
 006FBC27    wait
 006FBC28    mov         edx,8
 006FBC2D    mov         eax,dword ptr [ebp-14]
 006FBC30    call        006EE46C
 006FBC35    movsx       eax,al
 006FBC38    mov         dword ptr [ebp-30],eax
 006FBC3B    fild        dword ptr [ebp-30]
 006FBC3E    fld         tbyte ptr [ebp-2C]
 006FBC41    faddp       st(1),st
 006FBC43    fstp        tbyte ptr [ebp-3C]
 006FBC46    wait
 006FBC47    mov         edx,4
 006FBC4C    mov         eax,dword ptr [ebp-14]
 006FBC4F    call        006EE46C
 006FBC54    movsx       eax,al
 006FBC57    mov         dword ptr [ebp-40],eax
 006FBC5A    fild        dword ptr [ebp-40]
 006FBC5D    fld         tbyte ptr [ebp-3C]
 006FBC60    fsubrp      st(1),st
 006FBC62    mov         eax,dword ptr [ebp-8]
 006FBC65    fstp        qword ptr [eax]
 006FBC67    wait
 006FBC68    mov         eax,edi
 006FBC6A    call        00690048
 006FBC6F    movsx       eax,al
 006FBC72    mov         dword ptr [ebp-30],eax
 006FBC75    fild        dword ptr [ebp-30]
 006FBC78    mov         eax,dword ptr [ebp-8]
 006FBC7B    fadd        qword ptr [eax]
 006FBC7D    fstp        tbyte ptr [ebp-2C]
 006FBC80    wait
 006FBC81    mov         eax,edi
 006FBC83    call        0068FF78
 006FBC88    movsx       eax,al
 006FBC8B    mov         dword ptr [ebp-40],eax
 006FBC8E    fild        dword ptr [ebp-40]
 006FBC91    fld         tbyte ptr [ebp-2C]
 006FBC94    fsubrp      st(1),st
 006FBC96    mov         eax,dword ptr [ebp-8]
 006FBC99    fstp        qword ptr [eax]
 006FBC9B    wait
 006FBC9C    mov         edx,ebx
 006FBC9E    mov         eax,esi
 006FBCA0    call        TWiimoteManager.AnyY
 006FBCA5    fstp        qword ptr [ebp-20]
 006FBCA8    wait
 006FBCA9    mov         eax,edi
 006FBCAB    call        006F8B90
 006FBCB0    fadd        qword ptr [ebp-20]
 006FBCB3    fstp        tbyte ptr [ebp-2C]
 006FBCB6    wait
 006FBCB7    mov         edx,2
 006FBCBC    mov         eax,dword ptr [ebp-14]
 006FBCBF    call        006EE46C
 006FBCC4    movsx       eax,al
 006FBCC7    mov         dword ptr [ebp-30],eax
 006FBCCA    fild        dword ptr [ebp-30]
 006FBCCD    fld         tbyte ptr [ebp-2C]
 006FBCD0    faddp       st(1),st
 006FBCD2    fstp        tbyte ptr [ebp-3C]
 006FBCD5    wait
 006FBCD6    mov         edx,1
 006FBCDB    mov         eax,dword ptr [ebp-14]
 006FBCDE    call        006EE46C
 006FBCE3    movsx       eax,al
 006FBCE6    mov         dword ptr [ebp-40],eax
 006FBCE9    fild        dword ptr [ebp-40]
 006FBCEC    fld         tbyte ptr [ebp-3C]
 006FBCEF    fsubrp      st(1),st
 006FBCF1    mov         eax,dword ptr [ebp-0C]
 006FBCF4    fstp        qword ptr [eax]
 006FBCF6    wait
 006FBCF7    mov         eax,edi
 006FBCF9    call        0068FEA8
 006FBCFE    movsx       eax,al
 006FBD01    mov         dword ptr [ebp-30],eax
 006FBD04    fild        dword ptr [ebp-30]
 006FBD07    mov         eax,dword ptr [ebp-0C]
 006FBD0A    fadd        qword ptr [eax]
 006FBD0C    fstp        tbyte ptr [ebp-2C]
 006FBD0F    wait
 006FBD10    mov         eax,edi
 006FBD12    call        0068FD94
 006FBD17    movsx       eax,al
 006FBD1A    mov         dword ptr [ebp-40],eax
 006FBD1D    fild        dword ptr [ebp-40]
 006FBD20    fld         tbyte ptr [ebp-2C]
 006FBD23    fsubrp      st(1),st
 006FBD25    mov         eax,dword ptr [ebp-0C]
 006FBD28    fstp        qword ptr [eax]
 006FBD2A    wait
>006FBD2B    jmp         006FC0DE
 006FBD30    mov         edx,8
 006FBD35    mov         eax,dword ptr [ebp-14]
 006FBD38    call        006EE46C
 006FBD3D    movsx       eax,al
 006FBD40    mov         dword ptr [ebp-30],eax
 006FBD43    fild        dword ptr [ebp-30]
 006FBD46    fstp        tbyte ptr [ebp-2C]
 006FBD49    wait
 006FBD4A    mov         edx,ebx
 006FBD4C    mov         eax,esi
 006FBD4E    call        TWiimoteManager.AnyDPadX
 006FBD53    fld         tbyte ptr [ebp-2C]
 006FBD56    faddp       st(1),st
 006FBD58    fstp        tbyte ptr [ebp-3C]
 006FBD5B    wait
 006FBD5C    mov         edx,4
 006FBD61    mov         eax,dword ptr [ebp-14]
 006FBD64    call        006EE46C
 006FBD69    movsx       eax,al
 006FBD6C    mov         dword ptr [ebp-40],eax
 006FBD6F    fild        dword ptr [ebp-40]
 006FBD72    fld         tbyte ptr [ebp-3C]
 006FBD75    fsubrp      st(1),st
 006FBD77    mov         eax,dword ptr [ebp-8]
 006FBD7A    fstp        qword ptr [eax]
 006FBD7C    wait
 006FBD7D    mov         eax,edi
 006FBD7F    call        00690048
 006FBD84    movsx       eax,al
 006FBD87    mov         dword ptr [ebp-30],eax
 006FBD8A    fild        dword ptr [ebp-30]
 006FBD8D    mov         eax,dword ptr [ebp-8]
 006FBD90    fadd        qword ptr [eax]
 006FBD92    fstp        tbyte ptr [ebp-2C]
 006FBD95    wait
 006FBD96    mov         eax,edi
 006FBD98    call        0068FF78
 006FBD9D    movsx       eax,al
 006FBDA0    mov         dword ptr [ebp-40],eax
 006FBDA3    fild        dword ptr [ebp-40]
 006FBDA6    fld         tbyte ptr [ebp-2C]
 006FBDA9    fsubrp      st(1),st
 006FBDAB    mov         eax,dword ptr [ebp-8]
 006FBDAE    fstp        qword ptr [eax]
 006FBDB0    wait
 006FBDB1    mov         edx,2
 006FBDB6    mov         eax,dword ptr [ebp-14]
 006FBDB9    call        006EE46C
 006FBDBE    movsx       eax,al
 006FBDC1    mov         dword ptr [ebp-30],eax
 006FBDC4    fild        dword ptr [ebp-30]
 006FBDC7    fstp        tbyte ptr [ebp-2C]
 006FBDCA    wait
 006FBDCB    mov         edx,ebx
 006FBDCD    mov         eax,esi
 006FBDCF    call        TWiimoteManager.AnyDPadY
 006FBDD4    fld         tbyte ptr [ebp-2C]
 006FBDD7    faddp       st(1),st
 006FBDD9    fstp        tbyte ptr [ebp-3C]
 006FBDDC    wait
 006FBDDD    mov         edx,1
 006FBDE2    mov         eax,dword ptr [ebp-14]
 006FBDE5    call        006EE46C
 006FBDEA    movsx       eax,al
 006FBDED    mov         dword ptr [ebp-40],eax
 006FBDF0    fild        dword ptr [ebp-40]
 006FBDF3    fld         tbyte ptr [ebp-3C]
 006FBDF6    fsubrp      st(1),st
 006FBDF8    mov         eax,dword ptr [ebp-0C]
 006FBDFB    fstp        qword ptr [eax]
 006FBDFD    wait
 006FBDFE    mov         eax,edi
 006FBE00    call        0068FEA8
 006FBE05    movsx       eax,al
 006FBE08    mov         dword ptr [ebp-30],eax
 006FBE0B    fild        dword ptr [ebp-30]
 006FBE0E    mov         eax,dword ptr [ebp-0C]
 006FBE11    fadd        qword ptr [eax]
 006FBE13    fstp        tbyte ptr [ebp-2C]
 006FBE16    wait
 006FBE17    mov         eax,edi
 006FBE19    call        0068FD94
 006FBE1E    movsx       eax,al
 006FBE21    mov         dword ptr [ebp-40],eax
 006FBE24    fild        dword ptr [ebp-40]
 006FBE27    fld         tbyte ptr [ebp-2C]
 006FBE2A    fsubrp      st(1),st
 006FBE2C    mov         eax,dword ptr [ebp-0C]
 006FBE2F    fstp        qword ptr [eax]
 006FBE31    wait
>006FBE32    jmp         006FC0DE
 006FBE37    mov         edx,ebx
 006FBE39    mov         eax,esi
 006FBE3B    call        TWiimoteManager.AnyLeftStickX
 006FBE40    fstp        qword ptr [ebp-20]
 006FBE43    wait
 006FBE44    mov         eax,edi
 006FBE46    call        006F8B48
 006FBE4B    fadd        qword ptr [ebp-20]
 006FBE4E    mov         eax,dword ptr [ebp-8]
 006FBE51    fstp        qword ptr [eax]
 006FBE53    wait
 006FBE54    mov         edx,ebx
 006FBE56    mov         eax,esi
 006FBE58    call        TWiimoteManager.AnyLeftStickY
 006FBE5D    fstp        qword ptr [ebp-20]
 006FBE60    wait
 006FBE61    mov         eax,edi
 006FBE63    call        006F8B90
 006FBE68    fadd        qword ptr [ebp-20]
 006FBE6B    mov         eax,dword ptr [ebp-0C]
 006FBE6E    fstp        qword ptr [eax]
 006FBE70    wait
>006FBE71    jmp         006FC0DE
 006FBE76    mov         edx,ebx
 006FBE78    mov         eax,esi
 006FBE7A    call        TWiimoteManager.AnyRightStickX
 006FBE7F    fstp        qword ptr [ebp-20]
 006FBE82    wait
 006FBE83    mov         eax,edi
 006FBE85    call        006F8BD8
 006FBE8A    fadd        qword ptr [ebp-20]
 006FBE8D    mov         eax,dword ptr [ebp-8]
 006FBE90    fstp        qword ptr [eax]
 006FBE92    wait
 006FBE93    mov         edx,ebx
 006FBE95    mov         eax,esi
 006FBE97    call        TWiimoteManager.AnyRightStickY
 006FBE9C    fstp        qword ptr [ebp-20]
 006FBE9F    wait
 006FBEA0    mov         eax,edi
 006FBEA2    call        006F8C20
 006FBEA7    fadd        qword ptr [ebp-20]
 006FBEAA    mov         eax,dword ptr [ebp-0C]
 006FBEAD    fstp        qword ptr [eax]
 006FBEAF    wait
>006FBEB0    jmp         006FC0DE
 006FBEB5    mov         edx,ebx
 006FBEB7    mov         eax,esi
 006FBEB9    call        TWiimoteManager.AnyLeftThumbX
 006FBEBE    fstp        qword ptr [ebp-20]
 006FBEC1    wait
 006FBEC2    mov         eax,edi
 006FBEC4    call        006F8B48
 006FBEC9    fadd        qword ptr [ebp-20]
 006FBECC    fstp        tbyte ptr [ebp-2C]
 006FBECF    wait
 006FBED0    mov         edx,8
 006FBED5    mov         eax,dword ptr [ebp-14]
 006FBED8    call        006EE46C
 006FBEDD    movsx       eax,al
 006FBEE0    mov         dword ptr [ebp-30],eax
 006FBEE3    fild        dword ptr [ebp-30]
 006FBEE6    fld         tbyte ptr [ebp-2C]
 006FBEE9    faddp       st(1),st
 006FBEEB    fstp        tbyte ptr [ebp-3C]
 006FBEEE    wait
 006FBEEF    mov         edx,4
 006FBEF4    mov         eax,dword ptr [ebp-14]
 006FBEF7    call        006EE46C
 006FBEFC    movsx       eax,al
 006FBEFF    mov         dword ptr [ebp-40],eax
 006FBF02    fild        dword ptr [ebp-40]
 006FBF05    fld         tbyte ptr [ebp-3C]
 006FBF08    fsubrp      st(1),st
 006FBF0A    mov         eax,dword ptr [ebp-8]
 006FBF0D    fstp        qword ptr [eax]
 006FBF0F    wait
 006FBF10    mov         eax,edi
 006FBF12    call        00690048
 006FBF17    movsx       eax,al
 006FBF1A    mov         dword ptr [ebp-30],eax
 006FBF1D    fild        dword ptr [ebp-30]
 006FBF20    mov         eax,dword ptr [ebp-8]
 006FBF23    fadd        qword ptr [eax]
 006FBF25    fstp        tbyte ptr [ebp-2C]
 006FBF28    wait
 006FBF29    mov         eax,edi
 006FBF2B    call        0068FF78
 006FBF30    movsx       eax,al
 006FBF33    mov         dword ptr [ebp-40],eax
 006FBF36    fild        dword ptr [ebp-40]
 006FBF39    fld         tbyte ptr [ebp-2C]
 006FBF3C    fsubrp      st(1),st
 006FBF3E    mov         eax,dword ptr [ebp-8]
 006FBF41    fstp        qword ptr [eax]
 006FBF43    wait
 006FBF44    mov         edx,ebx
 006FBF46    mov         eax,esi
 006FBF48    call        TWiimoteManager.AnyLeftThumbY
 006FBF4D    fstp        qword ptr [ebp-20]
 006FBF50    wait
 006FBF51    mov         eax,edi
 006FBF53    call        006F8B90
 006FBF58    fadd        qword ptr [ebp-20]
 006FBF5B    fstp        tbyte ptr [ebp-2C]
 006FBF5E    wait
 006FBF5F    mov         edx,2
 006FBF64    mov         eax,dword ptr [ebp-14]
 006FBF67    call        006EE46C
 006FBF6C    movsx       eax,al
 006FBF6F    mov         dword ptr [ebp-30],eax
 006FBF72    fild        dword ptr [ebp-30]
 006FBF75    fld         tbyte ptr [ebp-2C]
 006FBF78    faddp       st(1),st
 006FBF7A    fstp        tbyte ptr [ebp-3C]
 006FBF7D    wait
 006FBF7E    mov         edx,1
 006FBF83    mov         eax,dword ptr [ebp-14]
 006FBF86    call        006EE46C
 006FBF8B    movsx       eax,al
 006FBF8E    mov         dword ptr [ebp-40],eax
 006FBF91    fild        dword ptr [ebp-40]
 006FBF94    fld         tbyte ptr [ebp-3C]
 006FBF97    fsubrp      st(1),st
 006FBF99    mov         eax,dword ptr [ebp-0C]
 006FBF9C    fstp        qword ptr [eax]
 006FBF9E    wait
 006FBF9F    mov         eax,edi
 006FBFA1    call        0068FEA8
 006FBFA6    movsx       eax,al
 006FBFA9    mov         dword ptr [ebp-30],eax
 006FBFAC    fild        dword ptr [ebp-30]
 006FBFAF    mov         eax,dword ptr [ebp-0C]
 006FBFB2    fadd        qword ptr [eax]
 006FBFB4    fstp        tbyte ptr [ebp-2C]
 006FBFB7    wait
 006FBFB8    mov         eax,edi
 006FBFBA    call        0068FD94
 006FBFBF    movsx       eax,al
 006FBFC2    mov         dword ptr [ebp-40],eax
 006FBFC5    fild        dword ptr [ebp-40]
 006FBFC8    fld         tbyte ptr [ebp-2C]
 006FBFCB    fsubrp      st(1),st
 006FBFCD    mov         eax,dword ptr [ebp-0C]
 006FBFD0    fstp        qword ptr [eax]
 006FBFD2    wait
>006FBFD3    jmp         006FC0DE
 006FBFD8    mov         edx,ebx
 006FBFDA    mov         eax,esi
 006FBFDC    call        TWiimoteManager.AnyRightThumbX
 006FBFE1    fstp        qword ptr [ebp-20]
 006FBFE4    wait
 006FBFE5    mov         eax,edi
 006FBFE7    call        006F8BD8
 006FBFEC    fadd        qword ptr [ebp-20]
 006FBFEF    mov         eax,dword ptr [ebp-8]
 006FBFF2    fstp        qword ptr [eax]
 006FBFF4    wait
 006FBFF5    mov         edx,ebx
 006FBFF7    mov         eax,esi
 006FBFF9    call        TWiimoteManager.AnyRightThumbY
 006FBFFE    fstp        qword ptr [ebp-20]
 006FC001    wait
 006FC002    mov         eax,edi
 006FC004    call        006F8C20
 006FC009    fadd        qword ptr [ebp-20]
 006FC00C    mov         eax,dword ptr [ebp-0C]
 006FC00F    fstp        qword ptr [eax]
 006FC011    wait
>006FC012    jmp         006FC0DE
 006FC017    cmp         dword ptr [ebp-10],0
>006FC01B    je          006FC0DE
 006FC021    mov         eax,dword ptr [ebp-8]
 006FC024    mov         edx,dword ptr [ebp-10]
 006FC027    mov         ecx,dword ptr [edx+338];TAccelerometerObject.gx:Double
 006FC02D    mov         dword ptr [eax],ecx
 006FC02F    mov         ecx,dword ptr [edx+33C];TAccelerometerObject.?f33C:dword
 006FC035    mov         dword ptr [eax+4],ecx
 006FC038    mov         eax,dword ptr [ebp-0C]
 006FC03B    mov         edx,dword ptr [ebp-10]
 006FC03E    mov         ecx,dword ptr [edx+340];TAccelerometerObject.gy:Double
 006FC044    mov         dword ptr [eax],ecx
 006FC046    mov         ecx,dword ptr [edx+344];TAccelerometerObject.?f344:dword
 006FC04C    mov         dword ptr [eax+4],ecx
 006FC04F    mov         eax,dword ptr [ebp+8]
 006FC052    mov         edx,dword ptr [ebp-10]
 006FC055    mov         ecx,dword ptr [edx+348];TAccelerometerObject.gz:Double
 006FC05B    mov         dword ptr [eax],ecx
 006FC05D    mov         ecx,dword ptr [edx+34C];TAccelerometerObject.?f34C:dword
 006FC063    mov         dword ptr [eax+4],ecx
>006FC066    jmp         006FC0DE
 006FC068    cmp         dword ptr [ebp-10],0
>006FC06C    je          006FC0DE
 006FC06E    mov         eax,dword ptr [ebp-10]
 006FC071    call        TAccelerometerObject.RawAccX
 006FC076    mov         eax,dword ptr [ebp-8]
 006FC079    fstp        qword ptr [eax]
 006FC07B    wait
 006FC07C    mov         eax,dword ptr [ebp-10]
 006FC07F    call        TAccelerometerObject.RawAccY
 006FC084    mov         eax,dword ptr [ebp-0C]
 006FC087    fstp        qword ptr [eax]
 006FC089    wait
 006FC08A    mov         eax,dword ptr [ebp-10]
 006FC08D    call        TAccelerometerObject.RawAccZ
 006FC092    mov         eax,dword ptr [ebp+8]
 006FC095    fstp        qword ptr [eax]
 006FC097    wait
>006FC098    jmp         006FC0DE
 006FC09A    cmp         dword ptr [ebp-10],0
>006FC09E    je          006FC0DE
 006FC0A0    mov         eax,dword ptr [ebp-10]
 006FC0A3    call        TAccelerometerObject.RelAccX
 006FC0A8    mov         eax,dword ptr [ebp-8]
 006FC0AB    fstp        qword ptr [eax]
 006FC0AD    wait
 006FC0AE    mov         eax,dword ptr [ebp-10]
 006FC0B1    call        TAccelerometerObject.RelAccY
 006FC0B6    mov         eax,dword ptr [ebp-0C]
 006FC0B9    fstp        qword ptr [eax]
 006FC0BB    wait
 006FC0BC    mov         eax,dword ptr [ebp-10]
 006FC0BF    call        TAccelerometerObject.RelAccZ
 006FC0C4    mov         eax,dword ptr [ebp+8]
 006FC0C7    fstp        qword ptr [eax]
 006FC0C9    wait
>006FC0CA    jmp         006FC0DE
 006FC0CC    mov         eax,dword ptr [ebp+8]
 006FC0CF    push        eax
 006FC0D0    mov         ecx,dword ptr [ebp-0C]
 006FC0D3    mov         edx,dword ptr [ebp-8]
 006FC0D6    mov         eax,dword ptr [ebp-4]
 006FC0D9    call        TExpression.GetVector
 006FC0DE    pop         edi
 006FC0DF    pop         esi
 006FC0E0    pop         ebx
 006FC0E1    mov         esp,ebp
 006FC0E3    pop         ebp
 006FC0E4    ret         4
*}
end;

//006FC0E8
function TAnyValue.Module:TObject;
begin
{*
 006FC0E8    mov         eax,[008229A4];gvar_008229A4:TModuleAny
 006FC0ED    ret
*}
end;

//006FC0F0
{*function TAnyValue.SetValue(NewValue:Double; ?:?):Boolean;
begin
 006FC0F0    push        ebp
 006FC0F1    mov         ebp,esp
 006FC0F3    add         esp,0FFFFFFF4
 006FC0F6    push        ebx
 006FC0F7    push        esi
 006FC0F8    push        edi
 006FC0F9    mov         esi,eax
 006FC0FB    call        0074BF10
 006FC100    mov         edi,eax
 006FC102    mov         eax,edi
 006FC104    call        TWiimoteManager.AnyCount
 006FC109    mov         dword ptr [ebp-8],eax
 006FC10C    call        006EE450
 006FC111    mov         dword ptr [ebp-0C],eax
 006FC114    mov         ebx,dword ptr [esi+18];TAnyValue...........................................................
 006FC117    mov         edx,ebx
 006FC119    mov         eax,edi
 006FC11B    call        TWiimoteManager.GetAny
 006FC120    test        ebx,ebx
>006FC122    jg          006FC12B
 006FC124    xor         edx,edx
 006FC126    mov         dword ptr [ebp-4],edx
>006FC129    jmp         006FC141
 006FC12B    cmp         ebx,dword ptr [ebp-8]
>006FC12E    jg          006FC139
 006FC130    mov         dword ptr [ebp-4],0FFFFFFFF
>006FC137    jmp         006FC141
 006FC139    mov         edx,ebx
 006FC13B    sub         edx,dword ptr [ebp-8]
 006FC13E    mov         dword ptr [ebp-4],edx
 006FC141    test        ebx,ebx
>006FC143    jg          006FC149
 006FC145    xor         ebx,ebx
>006FC147    jmp         006FC15E
 006FC149    mov         edx,dword ptr [ebp-8]
 006FC14C    add         edx,dword ptr [ebp-0C]
 006FC14F    cmp         ebx,edx
>006FC151    jg          006FC158
 006FC153    or          ebx,0FFFFFFFF
>006FC156    jmp         006FC15E
 006FC158    sub         ebx,dword ptr [ebp-8]
 006FC15B    sub         ebx,dword ptr [ebp-0C]
 006FC15E    mov         edx,dword ptr [esi+20];TAnyValue.........................................Item:Integer
 006FC161    cmp         edx,2E
>006FC164    jg          006FC17B
>006FC166    je          006FC255
 006FC16C    sub         edx,1
>006FC16F    jb          006FC18A
 006FC171    sub         edx,2C
>006FC174    je          006FC1CB
>006FC176    jmp         006FC2CF
 006FC17B    sub         edx,56
>006FC17E    je          006FC1AE
 006FC180    sub         edx,3
>006FC183    je          006FC191
>006FC185    jmp         006FC2CF
 006FC18A    xor         eax,eax
>006FC18C    jmp         006FC2D1
 006FC191    test        eax,eax
>006FC193    je          006FC1A7
 006FC195    mov         edx,dword ptr [ebp+8]
 006FC198    mov         dword ptr [eax+3E0],edx;TAccelerometerObject.SteeringAngle:Double
 006FC19E    mov         edx,dword ptr [ebp+0C]
 006FC1A1    mov         dword ptr [eax+3E4],edx;TAccelerometerObject.?f3E4:dword
 006FC1A7    mov         al,1
>006FC1A9    jmp         006FC2D1
 006FC1AE    test        eax,eax
>006FC1B0    je          006FC1C4
 006FC1B2    mov         edx,dword ptr [ebp+8]
 006FC1B5    mov         dword ptr [eax+3C8],edx;TAccelerometerObject.Yaw:Double
 006FC1BB    mov         edx,dword ptr [ebp+0C]
 006FC1BE    mov         dword ptr [eax+3CC],edx;TAccelerometerObject.?f3CC:dword
 006FC1C4    mov         al,1
>006FC1C6    jmp         006FC2D1
 006FC1CB    push        dword ptr [ebp+0C]
 006FC1CE    push        dword ptr [ebp+8]
 006FC1D1    mov         edx,dword ptr [esi+18];TAnyValue...........................................................
 006FC1D4    mov         eax,edi
 006FC1D6    call        TWiimoteManager.AnySetRumble
 006FC1DB    cmp         dword ptr [ebp-4],1
>006FC1DF    jl          006FC23F
 006FC1E1    mov         eax,dword ptr [ebp-4]
 006FC1E4    cmp         eax,dword ptr [ebp-0C]
>006FC1E7    jg          006FC23F
 006FC1E9    fld         qword ptr [ebp+8]
 006FC1EC    fabs
 006FC1EE    fmul        dword ptr ds:[6FC2DC];65535:Single
 006FC1F4    fstp        qword ptr [ebp+8]
 006FC1F7    wait
 006FC1F8    fld         qword ptr [ebp+8]
 006FC1FB    fcomp       dword ptr ds:[6FC2DC];65535:Single
 006FC201    wait
 006FC202    fnstsw      al
 006FC204    sahf
>006FC205    jbe         006FC213
 006FC207    xor         eax,eax
 006FC209    mov         dword ptr [ebp+8],eax
 006FC20C    mov         dword ptr [ebp+0C],40EFFFE0
 006FC213    fld         qword ptr [ebp+8]
 006FC216    call        @ROUND
 006FC21B    mov         edx,dword ptr ds:[78D49C];^gvar_008227B4
 006FC221    mov         ebx,dword ptr [esi+18];TAnyValue...........................................................
 006FC224    mov         word ptr [edx+ebx*4-4],ax
 006FC229    mov         eax,[0078D49C];^gvar_008227B4
 006FC22E    lea         eax,[eax+ebx*4]
 006FC231    push        eax
 006FC232    dec         ebx
 006FC233    push        ebx
 006FC234    mov         eax,[0078D720];^gvar_0082274C:Pointer
 006FC239    mov         eax,dword ptr [eax]
 006FC23B    call        eax
>006FC23D    jmp         006FC251
 006FC23F    cmp         ebx,1
>006FC242    jl          006FC251
 006FC244    push        dword ptr [ebp+0C]
 006FC247    push        dword ptr [ebp+8]
 006FC24A    mov         eax,ebx
 006FC24C    call        00693E80
 006FC251    mov         al,1
>006FC253    jmp         006FC2D1
 006FC255    cmp         dword ptr [ebp-4],1
>006FC259    jl          006FC2B9
 006FC25B    mov         eax,dword ptr [ebp-4]
 006FC25E    cmp         eax,dword ptr [ebp-0C]
>006FC261    jg          006FC2B9
 006FC263    fld         qword ptr [ebp+8]
 006FC266    fabs
 006FC268    fmul        dword ptr ds:[6FC2DC];65535:Single
 006FC26E    fstp        qword ptr [ebp+8]
 006FC271    wait
 006FC272    fld         qword ptr [ebp+8]
 006FC275    fcomp       dword ptr ds:[6FC2DC];65535:Single
 006FC27B    wait
 006FC27C    fnstsw      al
 006FC27E    sahf
>006FC27F    jbe         006FC28D
 006FC281    xor         eax,eax
 006FC283    mov         dword ptr [ebp+8],eax
 006FC286    mov         dword ptr [ebp+0C],40EFFFE0
 006FC28D    fld         qword ptr [ebp+8]
 006FC290    call        @ROUND
 006FC295    mov         edx,dword ptr ds:[78D49C];^gvar_008227B4
 006FC29B    mov         ebx,dword ptr [esi+18];TAnyValue...........................................................
 006FC29E    mov         word ptr [edx+ebx*4-4],ax
 006FC2A3    mov         eax,[0078D49C];^gvar_008227B4
 006FC2A8    lea         eax,[eax+ebx*4]
 006FC2AB    push        eax
 006FC2AC    dec         ebx
 006FC2AD    push        ebx
 006FC2AE    mov         eax,[0078D720];^gvar_0082274C:Pointer
 006FC2B3    mov         eax,dword ptr [eax]
 006FC2B5    call        eax
>006FC2B7    jmp         006FC2CB
 006FC2B9    cmp         ebx,1
>006FC2BC    jl          006FC2CB
 006FC2BE    push        dword ptr [ebp+0C]
 006FC2C1    push        dword ptr [ebp+8]
 006FC2C4    mov         eax,ebx
 006FC2C6    call        00693EA0
 006FC2CB    mov         al,1
>006FC2CD    jmp         006FC2D1
 006FC2CF    xor         eax,eax
 006FC2D1    pop         edi
 006FC2D2    pop         esi
 006FC2D3    pop         ebx
 006FC2D4    mov         esp,ebp
 006FC2D6    pop         ebp
 006FC2D7    ret         8
end;*}

//006FC2E0
{*procedure TAnyValue.ToString(?:?);
begin
 006FC2E0    push        ebp
 006FC2E1    mov         ebp,esp
 006FC2E3    push        0
 006FC2E5    push        0
 006FC2E7    push        0
 006FC2E9    push        ebx
 006FC2EA    push        esi
 006FC2EB    push        edi
 006FC2EC    mov         esi,edx
 006FC2EE    mov         ebx,eax
 006FC2F0    xor         eax,eax
 006FC2F2    push        ebp
 006FC2F3    push        6FC37D
 006FC2F8    push        dword ptr fs:[eax]
 006FC2FB    mov         dword ptr fs:[eax],esp
 006FC2FE    mov         edi,dword ptr [ebx+18];TAnyValue...........................................................
 006FC301    test        edi,edi
>006FC303    jle         006FC340
 006FC305    push        6FC398;'Any'
 006FC30A    lea         edx,[ebp-4]
 006FC30D    mov         eax,edi
 006FC30F    call        IntToStr
 006FC314    push        dword ptr [ebp-4]
 006FC317    push        6FC3AC;'.'
 006FC31C    lea         ecx,[ebp-8]
 006FC31F    mov         eax,[008229A4];gvar_008229A4:TModuleAny
 006FC324    mov         eax,dword ptr [eax+1C]
 006FC327    mov         edx,dword ptr [ebx+20];TAnyValue..........................................Item:Integer
 006FC32A    call        THashTable.Get
 006FC32F    push        dword ptr [ebp-8]
 006FC332    mov         eax,esi
 006FC334    mov         edx,4
 006FC339    call        @UStrCatN
>006FC33E    jmp         006FC362
 006FC340    lea         ecx,[ebp-0C]
 006FC343    mov         eax,[008229A4];gvar_008229A4:TModuleAny
 006FC348    mov         eax,dword ptr [eax+1C]
 006FC34B    mov         edx,dword ptr [ebx+20];TAnyValue...........................................Item:Integer
 006FC34E    call        THashTable.Get
 006FC353    mov         ecx,dword ptr [ebp-0C]
 006FC356    mov         eax,esi
 006FC358    mov         edx,6FC3BC;'Any.'
 006FC35D    call        @UStrCat3
 006FC362    xor         eax,eax
 006FC364    pop         edx
 006FC365    pop         ecx
 006FC366    pop         ecx
 006FC367    mov         dword ptr fs:[eax],edx
 006FC36A    push        6FC384
 006FC36F    lea         eax,[ebp-0C]
 006FC372    mov         edx,3
 006FC377    call        @UStrArrayClr
 006FC37C    ret
>006FC37D    jmp         @HandleFinally
>006FC382    jmp         006FC36F
 006FC384    pop         edi
 006FC385    pop         esi
 006FC386    pop         ebx
 006FC387    mov         esp,ebp
 006FC389    pop         ebp
 006FC38A    ret
end;*}

//006FC3C8
procedure sub_006FC3C8;
begin
{*
 006FC3C8    mov         byte ptr ds:[82299C],0;gvar_0082299C
 006FC3CF    call        0074BF10
 006FC3D4    call        TWiimoteManager.StartCompileTime
 006FC3D9    ret
*}
end;

//006FC3DC
procedure sub_006FC3DC;
begin
{*
 006FC3DC    ret
*}
end;

//006FC3E0
procedure TModuleAny.AddFields;
begin
{*
 006FC3E0    push        ebp
 006FC3E1    mov         ebp,esp
 006FC3E3    push        0
 006FC3E5    push        0
 006FC3E7    push        ebx
 006FC3E8    push        esi
 006FC3E9    mov         ebx,eax
 006FC3EB    xor         eax,eax
 006FC3ED    push        ebp
 006FC3EE    push        6FD668
 006FC3F3    push        dword ptr fs:[eax]
 006FC3F6    mov         dword ptr fs:[eax],esp
 006FC3F9    xor         ecx,ecx
 006FC3FB    mov         edx,6FD684;'Exists'
 006FC400    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC403    call        THashTable.Add
 006FC408    mov         esi,1
 006FC40D    lea         edx,[ebp-8]
 006FC410    mov         eax,esi
 006FC412    call        IntToStr
 006FC417    mov         ecx,dword ptr [ebp-8]
 006FC41A    lea         eax,[ebp-4]
 006FC41D    mov         edx,6FD6A0;'Button'
 006FC422    call        @UStrCat3
 006FC427    mov         edx,dword ptr [ebp-4]
 006FC42A    lea         ecx,[esi+42]
 006FC42D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC430    call        THashTable.Add
 006FC435    inc         esi
 006FC436    cmp         esi,12
>006FC439    jne         006FC40D
 006FC43B    mov         ecx,69
 006FC440    mov         edx,6FD6BC;'LeftStick'
 006FC445    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC448    call        THashTable.Add
 006FC44D    mov         ecx,1
 006FC452    mov         edx,6FD6DC;'LeftStickX'
 006FC457    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC45A    call        THashTable.Add
 006FC45F    mov         ecx,2
 006FC464    mov         edx,6FD700;'LeftStickY'
 006FC469    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC46C    call        THashTable.Add
 006FC471    mov         ecx,69
 006FC476    mov         edx,6FD724;'Joy1'
 006FC47B    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC47E    call        THashTable.Add
 006FC483    mov         ecx,1
 006FC488    mov         edx,6FD73C;'Joy1x'
 006FC48D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC490    call        THashTable.Add
 006FC495    mov         ecx,2
 006FC49A    mov         edx,6FD754;'Joy1y'
 006FC49F    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC4A2    call        THashTable.Add
 006FC4A7    mov         ecx,1
 006FC4AC    mov         edx,6FD76C;'JoyX'
 006FC4B1    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC4B4    call        THashTable.Add
 006FC4B9    mov         ecx,2
 006FC4BE    mov         edx,6FD784;'JoyY'
 006FC4C3    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC4C6    call        THashTable.Add
 006FC4CB    mov         ecx,6A
 006FC4D0    mov         edx,6FD79C;'RightStick'
 006FC4D5    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC4D8    call        THashTable.Add
 006FC4DD    mov         ecx,3
 006FC4E2    mov         edx,6FD7C0;'RightStickX'
 006FC4E7    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC4EA    call        THashTable.Add
 006FC4EF    mov         ecx,4
 006FC4F4    mov         edx,6FD7E4;'RightStickY'
 006FC4F9    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC4FC    call        THashTable.Add
 006FC501    mov         ecx,6A
 006FC506    mov         edx,6FD808;'Joy2'
 006FC50B    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC50E    call        THashTable.Add
 006FC513    mov         ecx,3
 006FC518    mov         edx,6FD820;'Joy2x'
 006FC51D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC520    call        THashTable.Add
 006FC525    mov         ecx,4
 006FC52A    mov         edx,6FD838;'Joy2y'
 006FC52F    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC532    call        THashTable.Add
 006FC537    mov         ecx,68
 006FC53C    mov         edx,6FD850;'DPad'
 006FC541    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC544    call        THashTable.Add
 006FC549    mov         ecx,5
 006FC54E    mov         edx,6FD868;'DPadLeft'
 006FC553    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC556    call        THashTable.Add
 006FC55B    mov         ecx,8
 006FC560    mov         edx,6FD888;'DPadRight'
 006FC565    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC568    call        THashTable.Add
 006FC56D    mov         ecx,6
 006FC572    mov         edx,6FD8A8;'DPadUp'
 006FC577    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC57A    call        THashTable.Add
 006FC57F    mov         ecx,7
 006FC584    mov         edx,6FD8C4;'DPadDown'
 006FC589    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC58C    call        THashTable.Add
 006FC591    mov         ecx,35
 006FC596    mov         edx,6FD8E4;'DPadX'
 006FC59B    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC59E    call        THashTable.Add
 006FC5A3    mov         ecx,36
 006FC5A8    mov         edx,6FD8FC;'DPadY'
 006FC5AD    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC5B0    call        THashTable.Add
 006FC5B5    mov         ecx,29
 006FC5BA    mov         edx,6FD914;'Left'
 006FC5BF    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC5C2    call        THashTable.Add
 006FC5C7    mov         ecx,2A
 006FC5CC    mov         edx,6FD92C;'Right'
 006FC5D1    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC5D4    call        THashTable.Add
 006FC5D9    mov         ecx,2B
 006FC5DE    mov         edx,6FD944;'Up'
 006FC5E3    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC5E6    call        THashTable.Add
 006FC5EB    mov         ecx,2C
 006FC5F0    mov         edx,6FD958;'Down'
 006FC5F5    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC5F8    call        THashTable.Add
 006FC5FD    mov         ecx,67
 006FC602    mov         edx,6FD970;'XY'
 006FC607    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC60A    call        THashTable.Add
 006FC60F    mov         ecx,3F
 006FC614    mov         edx,6FD984;'X'
 006FC619    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC61C    call        THashTable.Add
 006FC621    mov         ecx,40
 006FC626    mov         edx,6FD994;'Y'
 006FC62B    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC62E    call        THashTable.Add
 006FC633    mov         ecx,24
 006FC638    mov         edx,6FD9A4;'LeftThumbLeft'
 006FC63D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC640    call        THashTable.Add
 006FC645    mov         ecx,25
 006FC64A    mov         edx,6FD9CC;'LeftThumbRight'
 006FC64F    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC652    call        THashTable.Add
 006FC657    mov         ecx,22
 006FC65C    mov         edx,6FD9F8;'LeftThumbUp'
 006FC661    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC664    call        THashTable.Add
 006FC669    mov         ecx,23
 006FC66E    mov         edx,6FDA1C;'LeftThumbDown'
 006FC673    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC676    call        THashTable.Add
 006FC67B    mov         ecx,6B
 006FC680    mov         edx,6FDA44;'LeftThumbXY'
 006FC685    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC688    call        THashTable.Add
 006FC68D    mov         ecx,37
 006FC692    mov         edx,6FDA68;'LeftThumbX'
 006FC697    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC69A    call        THashTable.Add
 006FC69F    mov         ecx,38
 006FC6A4    mov         edx,6FDA8C;'LeftThumbY'
 006FC6A9    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC6AC    call        THashTable.Add
 006FC6B1    mov         ecx,20
 006FC6B6    mov         edx,6FDAB0;'RightThumbLeft'
 006FC6BB    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC6BE    call        THashTable.Add
 006FC6C3    mov         ecx,21
 006FC6C8    mov         edx,6FDADC;'RightThumbRight'
 006FC6CD    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC6D0    call        THashTable.Add
 006FC6D5    mov         ecx,1E
 006FC6DA    mov         edx,6FDB08;'RightThumbUp'
 006FC6DF    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC6E2    call        THashTable.Add
 006FC6E7    mov         ecx,1F
 006FC6EC    mov         edx,6FDB30;'RightThumbDown'
 006FC6F1    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC6F4    call        THashTable.Add
 006FC6F9    mov         ecx,6C
 006FC6FE    mov         edx,6FDB5C;'RightThumbXY'
 006FC703    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC706    call        THashTable.Add
 006FC70B    mov         ecx,39
 006FC710    mov         edx,6FDB84;'RightThumbX'
 006FC715    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC718    call        THashTable.Add
 006FC71D    mov         ecx,3A
 006FC722    mov         edx,6FDBA8;'RightThumbY'
 006FC727    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC72A    call        THashTable.Add
 006FC72F    mov         ecx,0C
 006FC734    mov         edx,6FDBCC;'TopLeftTrigger'
 006FC739    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC73C    call        THashTable.Add
 006FC741    mov         ecx,0C
 006FC746    mov         edx,6FDBF8;'L1'
 006FC74B    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC74E    call        THashTable.Add
 006FC753    mov         ecx,0C
 006FC758    mov         edx,6FDC0C;'L'
 006FC75D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC760    call        THashTable.Add
 006FC765    mov         ecx,0C
 006FC76A    mov         edx,6FDC1C;'CButton'
 006FC76F    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC772    call        THashTable.Add
 006FC777    mov         ecx,0D
 006FC77C    mov         edx,6FDC38;'BottomLeftTrigger'
 006FC781    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC784    call        THashTable.Add
 006FC789    mov         ecx,0D
 006FC78E    mov         edx,6FDC68;'L2'
 006FC793    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC796    call        THashTable.Add
 006FC79B    mov         ecx,0D
 006FC7A0    mov         edx,6FDC7C;'ZL'
 006FC7A5    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC7A8    call        THashTable.Add
 006FC7AD    mov         ecx,0D
 006FC7B2    mov         edx,6FDC90;'ZButton'
 006FC7B7    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC7BA    call        THashTable.Add
 006FC7BF    mov         ecx,14
 006FC7C4    mov         edx,6FDCAC;'L3'
 006FC7C9    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC7CC    call        THashTable.Add
 006FC7D1    mov         ecx,0E
 006FC7D6    mov         edx,6FDCC0;'TopRightTrigger'
 006FC7DB    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC7DE    call        THashTable.Add
 006FC7E3    mov         ecx,0E
 006FC7E8    mov         edx,6FDCEC;'R1'
 006FC7ED    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC7F0    call        THashTable.Add
 006FC7F5    mov         ecx,0E
 006FC7FA    mov         edx,6FDD00;'R'
 006FC7FF    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC802    call        THashTable.Add
 006FC807    mov         ecx,0F
 006FC80C    mov         edx,6FDD10;'BottomRightTrigger'
 006FC811    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC814    call        THashTable.Add
 006FC819    mov         ecx,0F
 006FC81E    mov         edx,6FDD44;'R2'
 006FC823    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC826    call        THashTable.Add
 006FC82B    mov         ecx,0F
 006FC830    mov         edx,6FDD58;'ZR'
 006FC835    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC838    call        THashTable.Add
 006FC83D    mov         ecx,15
 006FC842    mov         edx,6FDD6C;'R3'
 006FC847    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC84A    call        THashTable.Add
 006FC84F    mov         ecx,16
 006FC854    mov         edx,6FDD80;'RightTrigger'
 006FC859    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC85C    call        THashTable.Add
 006FC861    mov         ecx,16
 006FC866    mov         edx,6FDDA8;'BestRightTrigger'
 006FC86B    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC86E    call        THashTable.Add
 006FC873    mov         ecx,17
 006FC878    mov         edx,6FDDD8;'LeftTrigger'
 006FC87D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC880    call        THashTable.Add
 006FC885    mov         ecx,17
 006FC88A    mov         edx,6FDDFC;'BestLeftTrigger'
 006FC88F    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC892    call        THashTable.Add
 006FC897    mov         ecx,41
 006FC89C    mov         edx,6FDE28;'WorseLeftTrigger'
 006FC8A1    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC8A4    call        THashTable.Add
 006FC8A9    mov         ecx,42
 006FC8AE    mov         edx,6FDE58;'WorseRightTrigger'
 006FC8B3    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC8B6    call        THashTable.Add
 006FC8BB    mov         ecx,32
 006FC8C0    mov         edx,6FDE88;'AnalogLeftTrigger'
 006FC8C5    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC8C8    call        THashTable.Add
 006FC8CD    mov         ecx,31
 006FC8D2    mov         edx,6FDEB8;'AnalogRightTrigger'
 006FC8D7    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC8DA    call        THashTable.Add
 006FC8DF    mov         ecx,33
 006FC8E4    mov         edx,6FDEEC;^338:Single
 006FC8E9    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC8EC    call        THashTable.Add
 006FC8F1    mov         ecx,34
 006FC8F6    mov         edx,6FDF20;^338:Single
 006FC8FB    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC8FE    call        THashTable.Add
 006FC903    mov         ecx,9
 006FC908    mov         edx,6FDF54;'Select'
 006FC90D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC910    call        THashTable.Add
 006FC915    mov         ecx,9
 006FC91A    mov         edx,6FDF70;'Minus'
 006FC91F    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC922    call        THashTable.Add
 006FC927    mov         ecx,0A
 006FC92C    mov         edx,6FDF88;'Start'
 006FC931    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC934    call        THashTable.Add
 006FC939    mov         ecx,0A
 006FC93E    mov         edx,6FDFA0;'Plus'
 006FC943    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC946    call        THashTable.Add
 006FC94B    mov         ecx,0B
 006FC950    mov         edx,6FDFB8;'Home'
 006FC955    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC958    call        THashTable.Add
 006FC95D    mov         ecx,0B
 006FC962    mov         edx,6FDFD0;'PS'
 006FC967    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC96A    call        THashTable.Add
 006FC96F    mov         ecx,10
 006FC974    mov         edx,6FDFE4;'Cross'
 006FC979    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC97C    call        THashTable.Add
 006FC981    mov         ecx,11
 006FC986    mov         edx,6FDFFC;'Circle'
 006FC98B    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC98E    call        THashTable.Add
 006FC993    mov         ecx,12
 006FC998    mov         edx,6FE018;'Square'
 006FC99D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC9A0    call        THashTable.Add
 006FC9A5    mov         ecx,13
 006FC9AA    mov         edx,6FE034;'Triangle'
 006FC9AF    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC9B2    call        THashTable.Add
 006FC9B7    mov         ecx,18
 006FC9BC    mov         edx,6FE054;'RightThumbButton1'
 006FC9C1    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC9C4    call        THashTable.Add
 006FC9C9    mov         ecx,19
 006FC9CE    mov         edx,6FE084;'RightThumbButton2'
 006FC9D3    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC9D6    call        THashTable.Add
 006FC9DB    mov         ecx,1A
 006FC9E0    mov         edx,6FE0B4;'RightThumbButton3'
 006FC9E5    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC9E8    call        THashTable.Add
 006FC9ED    mov         ecx,1B
 006FC9F2    mov         edx,6FE0E4;'RightThumbButton4'
 006FC9F7    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FC9FA    call        THashTable.Add
 006FC9FF    mov         ecx,1C
 006FCA04    mov         edx,6FE114;'RightThumbButton5'
 006FCA09    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCA0C    call        THashTable.Add
 006FCA11    mov         ecx,1D
 006FCA16    mov         edx,6FE144;'RightThumbButton6'
 006FCA1B    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCA1E    call        THashTable.Add
 006FCA23    mov         ecx,26
 006FCA28    mov         edx,6FE174;'LeftThumbButton1'
 006FCA2D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCA30    call        THashTable.Add
 006FCA35    mov         ecx,27
 006FCA3A    mov         edx,6FE1A4;'LeftThumbButton2'
 006FCA3F    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCA42    call        THashTable.Add
 006FCA47    mov         ecx,28
 006FCA4C    mov         edx,6FE1D4;'LeftThumbButton3'
 006FCA51    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCA54    call        THashTable.Add
 006FCA59    mov         ecx,2F
 006FCA5E    mov         edx,6FE204;'LeftStickRun'
 006FCA63    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCA66    call        THashTable.Add
 006FCA6B    mov         ecx,2F
 006FCA70    mov         edx,6FE22C;'Joy1Run'
 006FCA75    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCA78    call        THashTable.Add
 006FCA7D    mov         ecx,30
 006FCA82    mov         edx,6FE248;'RightStickRun'
 006FCA87    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCA8A    call        THashTable.Add
 006FCA8F    mov         ecx,30
 006FCA94    mov         edx,6FE270;'Joy2Run'
 006FCA99    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCA9C    call        THashTable.Add
 006FCAA1    mov         ecx,2D
 006FCAA6    mov         edx,6FE28C;'Rumble'
 006FCAAB    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCAAE    call        THashTable.Add
 006FCAB3    mov         ecx,2D
 006FCAB8    mov         edx,6FE2A8;'Vibration1'
 006FCABD    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCAC0    call        THashTable.Add
 006FCAC5    mov         ecx,2E
 006FCACA    mov         edx,6FE2CC;'Vibration2'
 006FCACF    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCAD2    call        THashTable.Add
 006FCAD7    mov         ecx,3B
 006FCADC    mov         edx,6FE2F0;'OK'
 006FCAE1    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCAE4    call        THashTable.Add
 006FCAE9    mov         ecx,3C
 006FCAEE    mov         edx,6FE304;'Cancel'
 006FCAF3    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCAF6    call        THashTable.Add
 006FCAFB    mov         ecx,3D
 006FCB00    mov         edx,6FE320;'OtherButton1'
 006FCB05    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCB08    call        THashTable.Add
 006FCB0D    mov         ecx,3E
 006FCB12    mov         edx,6FE348;'OtherButton2'
 006FCB17    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCB1A    call        THashTable.Add
 006FCB1F    mov         ecx,54
 006FCB24    mov         edx,6FE370;'Pitch'
 006FCB29    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCB2C    call        THashTable.Add
 006FCB31    mov         ecx,55
 006FCB36    mov         edx,6FE388;'Roll'
 006FCB3B    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCB3E    call        THashTable.Add
 006FCB43    mov         ecx,56
 006FCB48    mov         edx,6FE3A0;'Yaw'
 006FCB4D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCB50    call        THashTable.Add
 006FCB55    mov         ecx,57
 006FCB5A    mov         edx,6FE3B4;'SmoothPitch'
 006FCB5F    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCB62    call        THashTable.Add
 006FCB67    mov         ecx,58
 006FCB6C    mov         edx,6FE3D8;'SmoothRoll'
 006FCB71    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCB74    call        THashTable.Add
 006FCB79    mov         ecx,59
 006FCB7E    mov         edx,6FE3FC;'SteeringAngle'
 006FCB83    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCB86    call        THashTable.Add
 006FCB8B    mov         ecx,63
 006FCB90    mov         edx,6FE424;'gx'
 006FCB95    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCB98    call        THashTable.Add
 006FCB9D    mov         ecx,64
 006FCBA2    mov         edx,6FE438;'gy'
 006FCBA7    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCBAA    call        THashTable.Add
 006FCBAF    mov         ecx,65
 006FCBB4    mov         edx,6FE44C;'gz'
 006FCBB9    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCBBC    call        THashTable.Add
 006FCBC1    mov         ecx,5D
 006FCBC6    mov         edx,6FE460;'RawAccX'
 006FCBCB    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCBCE    call        THashTable.Add
 006FCBD3    mov         ecx,5E
 006FCBD8    mov         edx,6FE47C;'RawAccY'
 006FCBDD    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCBE0    call        THashTable.Add
 006FCBE5    mov         ecx,5F
 006FCBEA    mov         edx,6FE498;'RawAccZ'
 006FCBEF    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCBF2    call        THashTable.Add
 006FCBF7    mov         ecx,5A
 006FCBFC    mov         edx,6FE4B4;'RelAccX'
 006FCC01    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCC04    call        THashTable.Add
 006FCC09    mov         ecx,5B
 006FCC0E    mov         edx,6FE4D0;'RelAccY'
 006FCC13    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCC16    call        THashTable.Add
 006FCC1B    mov         ecx,5C
 006FCC20    mov         edx,6FE4EC;'RelAccZ'
 006FCC25    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCC28    call        THashTable.Add
 006FCC2D    mov         ecx,60
 006FCC32    mov         edx,6FE508;'RelAcc'
 006FCC37    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCC3A    call        THashTable.Add
 006FCC3F    mov         ecx,61
 006FCC44    mov         edx,6FE524;'RawAcc'
 006FCC49    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCC4C    call        THashTable.Add
 006FCC51    mov         ecx,62
 006FCC56    mov         edx,6FE540;'g'
 006FCC5B    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCC5E    call        THashTable.Add
 006FCC63    mov         ecx,7F
 006FCC68    mov         edx,6FE550;'Shakiness'
 006FCC6D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCC70    call        THashTable.Add
 006FCC75    mov         ecx,84
 006FCC7A    mov         edx,6FE570;'SwingHorizontal'
 006FCC7F    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCC82    call        THashTable.Add
 006FCC87    mov         ecx,85
 006FCC8C    mov         edx,6FE59C;'SwingVertical'
 006FCC91    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCC94    call        THashTable.Add
 006FCC99    mov         ecx,86
 006FCC9E    mov         edx,6FE5C4;'Stabbing'
 006FCCA3    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCCA6    call        THashTable.Add
 006FCCAB    mov         ecx,87
 006FCCB0    mov         edx,6FE5E4;'DrumBeat'
 006FCCB5    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCCB8    call        THashTable.Add
 006FCCBD    mov         ecx,80
 006FCCC2    mov         edx,6FE604;'OnTable'
 006FCCC7    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCCCA    call        THashTable.Add
 006FCCCF    mov         ecx,81
 006FCCD4    mov         edx,6FE620;'LookingAtWatch'
 006FCCD9    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCCDC    call        THashTable.Add
 006FCCE1    mov         ecx,82
 006FCCE6    mov         edx,6FE64C;'LookingAtRightWatch'
 006FCCEB    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCCEE    call        THashTable.Add
 006FCCF3    mov         ecx,88
 006FCCF8    mov         edx,6FE680;'LookingAtLeftPalm'
 006FCCFD    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCD00    call        THashTable.Add
 006FCD05    mov         ecx,89
 006FCD0A    mov         edx,6FE6B0;'LookingAtRightPalm'
 006FCD0F    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCD12    call        THashTable.Add
 006FCD17    mov         ecx,83
 006FCD1C    mov         edx,6FE6E4;'UpsidedownOnShoulder'
 006FCD21    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCD24    call        THashTable.Add
 006FCD29    mov         ecx,97
 006FCD2E    mov         edx,6FE71C;'SwingDown'
 006FCD33    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCD36    call        THashTable.Add
 006FCD3B    mov         ecx,98
 006FCD40    mov         edx,6FE73C;'SwingDownStop'
 006FCD45    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCD48    call        THashTable.Add
 006FCD4D    mov         ecx,99
 006FCD52    mov         edx,6FE764;'SwingDownUp'
 006FCD57    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCD5A    call        THashTable.Add
 006FCD5F    mov         ecx,9A
 006FCD64    mov         edx,6FE788;'SwingDownUpStop'
 006FCD69    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCD6C    call        THashTable.Add
 006FCD71    mov         ecx,9B
 006FCD76    mov         edx,6FE7B4;'SwingDownUpDown'
 006FCD7B    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCD7E    call        THashTable.Add
 006FCD83    mov         ecx,9C
 006FCD88    mov         edx,6FE7E0;'SwingDownUpDownStop'
 006FCD8D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCD90    call        THashTable.Add
 006FCD95    mov         ecx,9D
 006FCD9A    mov         edx,6FE814;'SwingDownUpDownUp'
 006FCD9F    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCDA2    call        THashTable.Add
 006FCDA7    mov         ecx,9E
 006FCDAC    mov         edx,6FE844;'SwingDownUpDownUpStop'
 006FCDB1    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCDB4    call        THashTable.Add
 006FCDB9    mov         ecx,9F
 006FCDBE    mov         edx,6FE87C;'SwingDownUpDownUpDown'
 006FCDC3    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCDC6    call        THashTable.Add
 006FCDCB    mov         ecx,0A9
 006FCDD0    mov         edx,6FE8B4;'SwingLeft'
 006FCDD5    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCDD8    call        THashTable.Add
 006FCDDD    mov         ecx,0AA
 006FCDE2    mov         edx,6FE8D4;'SwingLeftStop'
 006FCDE7    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCDEA    call        THashTable.Add
 006FCDEF    mov         ecx,0AB
 006FCDF4    mov         edx,6FE8FC;'SwingLeftRight'
 006FCDF9    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCDFC    call        THashTable.Add
 006FCE01    mov         ecx,0AC
 006FCE06    mov         edx,6FE928;'SwingLeftRightStop'
 006FCE0B    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCE0E    call        THashTable.Add
 006FCE13    mov         ecx,0AD
 006FCE18    mov         edx,6FE95C;'SwingLeftRightLeft'
 006FCE1D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCE20    call        THashTable.Add
 006FCE25    mov         ecx,0AE
 006FCE2A    mov         edx,6FE990;'SwingLeftRightLeftStop'
 006FCE2F    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCE32    call        THashTable.Add
 006FCE37    mov         ecx,0AF
 006FCE3C    mov         edx,6FE9CC;'SwingLeftRightLeftRight'
 006FCE41    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCE44    call        THashTable.Add
 006FCE49    mov         ecx,0B0
 006FCE4E    mov         edx,6FEA08;'SwingLeftRightLeftRightStop'
 006FCE53    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCE56    call        THashTable.Add
 006FCE5B    mov         ecx,0B1
 006FCE60    mov         edx,6FEA4C;'SwingLeftRightLeftRightLeft'
 006FCE65    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCE68    call        THashTable.Add
 006FCE6D    mov         ecx,0B2
 006FCE72    mov         edx,6FEA90;'SwingRight'
 006FCE77    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCE7A    call        THashTable.Add
 006FCE7F    mov         ecx,0B3
 006FCE84    mov         edx,6FEAB4;'SwingRightStop'
 006FCE89    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCE8C    call        THashTable.Add
 006FCE91    mov         ecx,0B4
 006FCE96    mov         edx,6FEAE0;'SwingRightLeft'
 006FCE9B    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCE9E    call        THashTable.Add
 006FCEA3    mov         ecx,0B5
 006FCEA8    mov         edx,6FEB0C;'SwingRightLeftStop'
 006FCEAD    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCEB0    call        THashTable.Add
 006FCEB5    mov         ecx,0B6
 006FCEBA    mov         edx,6FEB40;'SwingRightLeftRight'
 006FCEBF    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCEC2    call        THashTable.Add
 006FCEC7    mov         ecx,0B7
 006FCECC    mov         edx,6FEB74;'SwingRightLeftRightStop'
 006FCED1    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCED4    call        THashTable.Add
 006FCED9    mov         ecx,0B8
 006FCEDE    mov         edx,6FEBB0;'SwingRightLeftRightLeft'
 006FCEE3    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCEE6    call        THashTable.Add
 006FCEEB    mov         ecx,0B9
 006FCEF0    mov         edx,6FEBEC;'SwingRightLeftRightLeftStop'
 006FCEF5    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCEF8    call        THashTable.Add
 006FCEFD    mov         ecx,0BA
 006FCF02    mov         edx,6FEC30;'SwingRightLeftRightLeftRight'
 006FCF07    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCF0A    call        THashTable.Add
 006FCF0F    mov         ecx,0A0
 006FCF14    mov         edx,6FEC78;'SwingUp'
 006FCF19    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCF1C    call        THashTable.Add
 006FCF21    mov         ecx,0A1
 006FCF26    mov         edx,6FEC94;'SwingUpStop'
 006FCF2B    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCF2E    call        THashTable.Add
 006FCF33    mov         ecx,0A2
 006FCF38    mov         edx,6FECB8;'SwingUpDown'
 006FCF3D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCF40    call        THashTable.Add
 006FCF45    mov         ecx,0A3
 006FCF4A    mov         edx,6FECDC;'SwingUpDownStop'
 006FCF4F    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCF52    call        THashTable.Add
 006FCF57    mov         ecx,0A4
 006FCF5C    mov         edx,6FED08;'SwingUpDownUp'
 006FCF61    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCF64    call        THashTable.Add
 006FCF69    mov         ecx,0A5
 006FCF6E    mov         edx,6FED30;'SwingUpDownUpStop'
 006FCF73    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCF76    call        THashTable.Add
 006FCF7B    mov         ecx,0A6
 006FCF80    mov         edx,6FED60;'SwingUpDownUpDown'
 006FCF85    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCF88    call        THashTable.Add
 006FCF8D    mov         ecx,0A7
 006FCF92    mov         edx,6FED90;'SwingUpDownUpDownStop'
 006FCF97    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCF9A    call        THashTable.Add
 006FCF9F    mov         ecx,0A8
 006FCFA4    mov         edx,6FEDC8;'SwingUpDownUpDownUp'
 006FCFA9    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCFAC    call        THashTable.Add
 006FCFB1    mov         ecx,0BB
 006FCFB6    mov         edx,6FEDFC;'CurveDownRight'
 006FCFBB    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCFBE    call        THashTable.Add
 006FCFC3    mov         ecx,0BC
 006FCFC8    mov         edx,6FEE28;'CurveDownRightStop'
 006FCFCD    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCFD0    call        THashTable.Add
 006FCFD5    mov         ecx,0BD
 006FCFDA    mov         edx,6FEE5C;'CurveDownRightUp'
 006FCFDF    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCFE2    call        THashTable.Add
 006FCFE7    mov         ecx,0BE
 006FCFEC    mov         edx,6FEE8C;'CurveDownRightUpStop'
 006FCFF1    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FCFF4    call        THashTable.Add
 006FCFF9    mov         ecx,0BF
 006FCFFE    mov         edx,6FEEC4;'SwishAndFlick'
 006FD003    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD006    call        THashTable.Add
 006FD00B    mov         ecx,0BF
 006FD010    mov         edx,6FEEEC;'CurveDownRightUpDown'
 006FD015    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD018    call        THashTable.Add
 006FD01D    mov         ecx,0C0
 006FD022    mov         edx,6FEF24;'SwishAndFlickStop'
 006FD027    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD02A    call        THashTable.Add
 006FD02F    mov         ecx,0C0
 006FD034    mov         edx,6FEF54;'CurveDownRightUpDownStop'
 006FD039    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD03C    call        THashTable.Add
 006FD041    mov         ecx,0C1
 006FD046    mov         edx,6FEF94;'CurveDownRightUpDownRight'
 006FD04B    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD04E    call        THashTable.Add
 006FD053    mov         ecx,0C2
 006FD058    mov         edx,6FEFD4;'CurveDownRightUpDownRightStop'
 006FD05D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD060    call        THashTable.Add
 006FD065    mov         ecx,0C3
 006FD06A    mov         edx,6FF01C;'CurvyW'
 006FD06F    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD072    call        THashTable.Add
 006FD077    mov         ecx,0C3
 006FD07C    mov         edx,6FF038;'CurlyW'
 006FD081    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD084    call        THashTable.Add
 006FD089    mov         ecx,0C3
 006FD08E    mov         edx,6FF054;'CurveDownRightUpDownRightUp'
 006FD093    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD096    call        THashTable.Add
 006FD09B    mov         ecx,0C4
 006FD0A0    mov         edx,6FF098;'SwishAndFlickAndUp'
 006FD0A5    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD0A8    call        THashTable.Add
 006FD0AD    mov         ecx,0C4
 006FD0B2    mov         edx,6FF0CC;'CurveDownRightUpDownUp'
 006FD0B7    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD0BA    call        THashTable.Add
 006FD0BF    mov         ecx,0C5
 006FD0C4    mov         edx,6FF108;'CurveDownLeft'
 006FD0C9    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD0CC    call        THashTable.Add
 006FD0D1    mov         ecx,0C6
 006FD0D6    mov         edx,6FF130;'CurveDownLeftStop'
 006FD0DB    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD0DE    call        THashTable.Add
 006FD0E3    mov         ecx,0C7
 006FD0E8    mov         edx,6FF160;'CurveDownLeftUp'
 006FD0ED    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD0F0    call        THashTable.Add
 006FD0F5    mov         ecx,0C8
 006FD0FA    mov         edx,6FF18C;'CurveDownLeftUpStop'
 006FD0FF    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD102    call        THashTable.Add
 006FD107    mov         ecx,0C9
 006FD10C    mov         edx,6FF1C0;'CurveDownLeftUpDown'
 006FD111    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD114    call        THashTable.Add
 006FD119    mov         ecx,0CA
 006FD11E    mov         edx,6FF1F4;'CurveDownLeftUpDownStop'
 006FD123    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD126    call        THashTable.Add
 006FD12B    mov         ecx,0CB
 006FD130    mov         edx,6FF230;'CurveDownLeftUpDownLeft'
 006FD135    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD138    call        THashTable.Add
 006FD13D    mov         ecx,0CC
 006FD142    mov         edx,6FF26C;'CurveDownLeftUpDownLeftStop'
 006FD147    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD14A    call        THashTable.Add
 006FD14F    mov         ecx,0CD
 006FD154    mov         edx,6FF2B0;'CurveDownLeftUpDownLeftUp'
 006FD159    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD15C    call        THashTable.Add
 006FD161    mov         ecx,0CE
 006FD166    mov         edx,6FF2F0;'CurveDownLeftUpDownUp'
 006FD16B    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD16E    call        THashTable.Add
 006FD173    mov         ecx,0D1
 006FD178    mov         edx,6FF328;'CurveUpRight'
 006FD17D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD180    call        THashTable.Add
 006FD185    mov         ecx,0D2
 006FD18A    mov         edx,6FF350;'CurveUpRightStop'
 006FD18F    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD192    call        THashTable.Add
 006FD197    mov         ecx,0D3
 006FD19C    mov         edx,6FF380;'CurveUpRightDown'
 006FD1A1    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD1A4    call        THashTable.Add
 006FD1A9    mov         ecx,0D4
 006FD1AE    mov         edx,6FF3B0;'CurveUpRightDownStop'
 006FD1B3    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD1B6    call        THashTable.Add
 006FD1BB    mov         ecx,0D5
 006FD1C0    mov         edx,6FF3E8;'CurveUpRightDownUp'
 006FD1C5    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD1C8    call        THashTable.Add
 006FD1CD    mov         ecx,0D6
 006FD1D2    mov         edx,6FF41C;'CurveUpRightDownUpStop'
 006FD1D7    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD1DA    call        THashTable.Add
 006FD1DF    mov         ecx,0D7
 006FD1E4    mov         edx,6FF458;'CurveUpRightDownUpRight'
 006FD1E9    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD1EC    call        THashTable.Add
 006FD1F1    mov         ecx,0D8
 006FD1F6    mov         edx,6FF494;'CurveUpRightDownUpRightStop'
 006FD1FB    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD1FE    call        THashTable.Add
 006FD203    mov         ecx,0D9
 006FD208    mov         edx,6FF4D8;'CurvyM'
 006FD20D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD210    call        THashTable.Add
 006FD215    mov         ecx,0D9
 006FD21A    mov         edx,6FF4F4;'CurlyM'
 006FD21F    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD222    call        THashTable.Add
 006FD227    mov         ecx,0D9
 006FD22C    mov         edx,6FF510;'CurveUpRightDownUpRightDown'
 006FD231    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD234    call        THashTable.Add
 006FD239    mov         ecx,0DA
 006FD23E    mov         edx,6FF554;'CurveUpRightDownUpDown'
 006FD243    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD246    call        THashTable.Add
 006FD24B    mov         ecx,0DB
 006FD250    mov         edx,6FF590;'CurveUpLeft'
 006FD255    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD258    call        THashTable.Add
 006FD25D    mov         ecx,0DC
 006FD262    mov         edx,6FF5B4;'CurveUpLeftStop'
 006FD267    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD26A    call        THashTable.Add
 006FD26F    mov         ecx,0DD
 006FD274    mov         edx,6FF5E0;'CurveUpLeftDown'
 006FD279    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD27C    call        THashTable.Add
 006FD281    mov         ecx,0DE
 006FD286    mov         edx,6FF60C;'CurveUpLeftDownStop'
 006FD28B    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD28E    call        THashTable.Add
 006FD293    mov         ecx,0DF
 006FD298    mov         edx,6FF640;'CurveUpLeftDownUp'
 006FD29D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD2A0    call        THashTable.Add
 006FD2A5    mov         ecx,0E0
 006FD2AA    mov         edx,6FF670;'CurveUpLeftDownUpStop'
 006FD2AF    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD2B2    call        THashTable.Add
 006FD2B7    mov         ecx,0E1
 006FD2BC    mov         edx,6FF6A8;'CurveUpLeftDownUpLeft'
 006FD2C1    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD2C4    call        THashTable.Add
 006FD2C9    mov         ecx,0E2
 006FD2CE    mov         edx,6FF6E0;'CurveUpLeftDownUpLeftStop'
 006FD2D3    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD2D6    call        THashTable.Add
 006FD2DB    mov         ecx,0E3
 006FD2E0    mov         edx,6FF720;'CurveUpLeftDownUpLeftDown'
 006FD2E5    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD2E8    call        THashTable.Add
 006FD2ED    mov         ecx,0E4
 006FD2F2    mov         edx,6FF760;'CurveUpLeftDownUpDown'
 006FD2F7    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD2FA    call        THashTable.Add
 006FD2FF    mov         ecx,0E5
 006FD304    mov         edx,6FF798;'CurveLeftUp'
 006FD309    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD30C    call        THashTable.Add
 006FD311    mov         ecx,0E6
 006FD316    mov         edx,6FF7BC;'CurveLeftUpStop'
 006FD31B    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD31E    call        THashTable.Add
 006FD323    mov         ecx,0E7
 006FD328    mov         edx,6FF7E8;'CurveLeftUpRight'
 006FD32D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD330    call        THashTable.Add
 006FD335    mov         ecx,0E8
 006FD33A    mov         edx,6FF818;'CurveLeftUpRightStop'
 006FD33F    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD342    call        THashTable.Add
 006FD347    mov         ecx,0E9
 006FD34C    mov         edx,6FF850;'CurveLeftUpRightLeft'
 006FD351    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD354    call        THashTable.Add
 006FD359    mov         ecx,0EA
 006FD35E    mov         edx,6FF888;'CurveLeftUpRightLeftStop'
 006FD363    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD366    call        THashTable.Add
 006FD36B    mov         ecx,0EB
 006FD370    mov         edx,6FF8C8;'CurveLeftUpRightLeftUp'
 006FD375    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD378    call        THashTable.Add
 006FD37D    mov         ecx,0EC
 006FD382    mov         edx,6FF904;'CurveLeftUpRightLeftUpStop'
 006FD387    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD38A    call        THashTable.Add
 006FD38F    mov         ecx,0ED
 006FD394    mov         edx,6FF948;'CurveLeftUpRightLeftUpRight'
 006FD399    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD39C    call        THashTable.Add
 006FD3A1    mov         ecx,0EE
 006FD3A6    mov         edx,6FF98C;'CurveLeftUpRightLeftRight'
 006FD3AB    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD3AE    call        THashTable.Add
 006FD3B3    mov         ecx,0EF
 006FD3B8    mov         edx,6FF9CC;'CurveLeftDown'
 006FD3BD    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD3C0    call        THashTable.Add
 006FD3C5    mov         ecx,0F0
 006FD3CA    mov         edx,6FF9F4;'CurveLeftDownStop'
 006FD3CF    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD3D2    call        THashTable.Add
 006FD3D7    mov         ecx,0F1
 006FD3DC    mov         edx,6FFA24;'CurveLeftDownRight'
 006FD3E1    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD3E4    call        THashTable.Add
 006FD3E9    mov         ecx,0F2
 006FD3EE    mov         edx,6FFA58;'CurveLeftDownRightStop'
 006FD3F3    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD3F6    call        THashTable.Add
 006FD3FB    mov         ecx,0F3
 006FD400    mov         edx,6FFA94;'CurveLeftDownRightLeft'
 006FD405    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD408    call        THashTable.Add
 006FD40D    mov         ecx,0F4
 006FD412    mov         edx,6FFAD0;'CurveLeftDownRightLeftStop'
 006FD417    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD41A    call        THashTable.Add
 006FD41F    mov         ecx,0F5
 006FD424    mov         edx,6FFB14;'CurveLeftDownRightLeftDown'
 006FD429    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD42C    call        THashTable.Add
 006FD431    mov         ecx,0F6
 006FD436    mov         edx,6FFB58;'CurveLeftDownRightLeftDownStop'
 006FD43B    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD43E    call        THashTable.Add
 006FD443    mov         ecx,0F7
 006FD448    mov         edx,6FFBA4;'CurvyE'
 006FD44D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD450    call        THashTable.Add
 006FD455    mov         ecx,0F7
 006FD45A    mov         edx,6FFBC0;'CurlyE'
 006FD45F    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD462    call        THashTable.Add
 006FD467    mov         ecx,0F7
 006FD46C    mov         edx,6FFBDC;'CurveLeftDownRightLeftDownRight'
 006FD471    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD474    call        THashTable.Add
 006FD479    mov         ecx,0F8
 006FD47E    mov         edx,6FFC28;'CurveLeftDownRightLeftRight'
 006FD483    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD486    call        THashTable.Add
 006FD48B    mov         ecx,0F9
 006FD490    mov         edx,6FFC6C;'CurveRightUp'
 006FD495    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD498    call        THashTable.Add
 006FD49D    mov         ecx,0FA
 006FD4A2    mov         edx,6FFC94;'CurveRightUpStop'
 006FD4A7    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD4AA    call        THashTable.Add
 006FD4AF    mov         ecx,0FB
 006FD4B4    mov         edx,6FFCC4;'CurveRightUpLeft'
 006FD4B9    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD4BC    call        THashTable.Add
 006FD4C1    mov         ecx,0FC
 006FD4C6    mov         edx,6FFCF4;'CurveRightUpLeftStop'
 006FD4CB    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD4CE    call        THashTable.Add
 006FD4D3    mov         ecx,0FD
 006FD4D8    mov         edx,6FFD2C;'CurveRightUpLeftRight'
 006FD4DD    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD4E0    call        THashTable.Add
 006FD4E5    mov         ecx,0FE
 006FD4EA    mov         edx,6FFD64;'CurveRightUpLeftRightStop'
 006FD4EF    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD4F2    call        THashTable.Add
 006FD4F7    mov         ecx,0FF
 006FD4FC    mov         edx,6FFDA4;'CurveRightUpLeftRightUp'
 006FD501    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD504    call        THashTable.Add
 006FD509    mov         ecx,100
 006FD50E    mov         edx,6FFDE0;'CurveRightUpLeftRightUpStop'
 006FD513    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD516    call        THashTable.Add
 006FD51B    mov         ecx,101
 006FD520    mov         edx,6FFE24;'CurveRightUpLeftRightUpLeft'
 006FD525    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD528    call        THashTable.Add
 006FD52D    mov         ecx,102
 006FD532    mov         edx,6FFE68;'CurveRightUpLeftRightLeft'
 006FD537    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD53A    call        THashTable.Add
 006FD53F    mov         ecx,103
 006FD544    mov         edx,6FFEA8;'CurveRightDown'
 006FD549    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD54C    call        THashTable.Add
 006FD551    mov         ecx,104
 006FD556    mov         edx,6FFED4;'CurveRightDownStop'
 006FD55B    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD55E    call        THashTable.Add
 006FD563    mov         ecx,105
 006FD568    mov         edx,6FFF08;'CurveRightDownLeft'
 006FD56D    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD570    call        THashTable.Add
 006FD575    mov         ecx,106
 006FD57A    mov         edx,6FFF3C;'CurveRightDownLeftStop'
 006FD57F    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD582    call        THashTable.Add
 006FD587    mov         ecx,107
 006FD58C    mov         edx,6FFF78;'CurveRightDownLeftRight'
 006FD591    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD594    call        THashTable.Add
 006FD599    mov         ecx,108
 006FD59E    mov         edx,6FFFB4;'CurveRightDownLeftRightStop'
 006FD5A3    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD5A6    call        THashTable.Add
 006FD5AB    mov         ecx,109
 006FD5B0    mov         edx,6FFFF8;'CurveRightDownLeftRightDown'
 006FD5B5    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD5B8    call        THashTable.Add
 006FD5BD    mov         ecx,10A
 006FD5C2    mov         edx,70003C;'CurveRightDownLeftRightDownStop'
 006FD5C7    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD5CA    call        THashTable.Add
 006FD5CF    mov         ecx,10B
 006FD5D4    mov         edx,700088;'Curvy3'
 006FD5D9    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD5DC    call        THashTable.Add
 006FD5E1    mov         ecx,10B
 006FD5E6    mov         edx,7000A4;'Curly3'
 006FD5EB    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD5EE    call        THashTable.Add
 006FD5F3    mov         ecx,10B
 006FD5F8    mov         edx,7000C0;'CurveRightDownLeftRightDownLeft'
 006FD5FD    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD600    call        THashTable.Add
 006FD605    mov         ecx,10C
 006FD60A    mov         edx,70010C;'CurveRightDownLeftRightLeft'
 006FD60F    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD612    call        THashTable.Add
 006FD617    mov         ecx,0CF
 006FD61C    mov         edx,700150;'CircleAnticlockwise'
 006FD621    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD624    call        THashTable.Add
 006FD629    mov         ecx,0CF
 006FD62E    mov         edx,700184;'CircleCounterClockwise'
 006FD633    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD636    call        THashTable.Add
 006FD63B    mov         ecx,0D0
 006FD640    mov         edx,7001C0;'CircleClockwise'
 006FD645    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 006FD648    call        THashTable.Add
 006FD64D    xor         eax,eax
 006FD64F    pop         edx
 006FD650    pop         ecx
 006FD651    pop         ecx
 006FD652    mov         dword ptr fs:[eax],edx
 006FD655    push        6FD66F
 006FD65A    lea         eax,[ebp-8]
 006FD65D    mov         edx,2
 006FD662    call        @UStrArrayClr
 006FD667    ret
>006FD668    jmp         @HandleFinally
>006FD66D    jmp         006FD65A
 006FD66F    pop         esi
 006FD670    pop         ebx
 006FD671    pop         ecx
 006FD672    pop         ecx
 006FD673    pop         ebp
 006FD674    ret
*}
end;

//007001E0
procedure TModuleAny.ClearRead;
begin
{*
 007001E0    call        TPieModule.ClearRead
 007001E5    ret
*}
end;

//007001E8
constructor TModuleAny.Create;
begin
{*
 007001E8    push        ebx
 007001E9    push        esi
 007001EA    test        dl,dl
>007001EC    je          007001F6
 007001EE    add         esp,0FFFFFFF0
 007001F1    call        @ClassCreate
 007001F6    mov         ebx,edx
 007001F8    mov         esi,eax
 007001FA    push        0
 007001FC    push        0
 007001FE    push        0
 00700200    push        0
 00700202    mov         ecx,700238;'Any'
 00700207    xor         edx,edx
 00700209    mov         eax,esi
 0070020B    call        005E4830
 00700210    mov         eax,esi
 00700212    test        bl,bl
>00700214    je          00700225
 00700216    call        @AfterConstruction
 0070021B    pop         dword ptr fs:[0]
 00700222    add         esp,0C
 00700225    mov         eax,esi
 00700227    pop         esi
 00700228    pop         ebx
 00700229    ret
*}
end;

//00700240
function TModuleAny.CreateValue(Identifier:string):TExpression;
begin
{*
 00700240    push        ebp
 00700241    mov         ebp,esp
 00700243    push        ecx
 00700244    push        ebx
 00700245    mov         dword ptr [ebp-4],edx
 00700248    mov         ebx,eax
 0070024A    mov         eax,dword ptr [ebp-4]
 0070024D    call        @UStrAddRef
 00700252    xor         eax,eax
 00700254    push        ebp
 00700255    push        700284
 0070025A    push        dword ptr fs:[eax]
 0070025D    mov         dword ptr fs:[eax],esp
 00700260    mov         byte ptr [ebx+24],1;TModuleAny.Used:Boolean
 00700264    mov         eax,dword ptr [ebp-4]
 00700267    call        006F8818
 0070026C    mov         ebx,eax
 0070026E    xor         eax,eax
 00700270    pop         edx
 00700271    pop         ecx
 00700272    pop         ecx
 00700273    mov         dword ptr fs:[eax],edx
 00700276    push        70028B
 0070027B    lea         eax,[ebp-4]
 0070027E    call        @UStrClr
 00700283    ret
>00700284    jmp         @HandleFinally
>00700289    jmp         0070027B
 0070028B    mov         eax,ebx
 0070028D    pop         ebx
 0070028E    pop         ecx
 0070028F    pop         ebp
 00700290    ret
*}
end;

//00700294
function TModuleAny.GetDefaultFormat(field:string):TGuiFormat;
begin
{*
 00700294    push        ebp
 00700295    mov         ebp,esp
 00700297    push        ecx
 00700298    push        ebx
 00700299    mov         dword ptr [ebp-4],edx
 0070029C    mov         ebx,eax
 0070029E    mov         eax,dword ptr [ebp-4]
 007002A1    call        @UStrAddRef
 007002A6    xor         eax,eax
 007002A8    push        ebp
 007002A9    push        7002FA
 007002AE    push        dword ptr fs:[eax]
 007002B1    mov         dword ptr fs:[eax],esp
 007002B4    mov         edx,dword ptr [ebp-4]
 007002B7    mov         eax,dword ptr [ebx+1C];TModuleAny.Fields:THashTable
 007002BA    call        THashTable.Get
 007002BF    sub         eax,1
>007002C2    jb          007002D6
 007002C4    add         eax,0FFFFFFAD
 007002C7    sub         eax,5
>007002CA    jb          007002DA
 007002CC    add         eax,0FFFFFFDB
 007002CF    sub         eax,2
>007002D2    jb          007002DE
>007002D4    jmp         007002E2
 007002D6    xor         ebx,ebx
>007002D8    jmp         007002E4
 007002DA    mov         bl,9
>007002DC    jmp         007002E4
 007002DE    mov         bl,9
>007002E0    jmp         007002E4
 007002E2    xor         ebx,ebx
 007002E4    xor         eax,eax
 007002E6    pop         edx
 007002E7    pop         ecx
 007002E8    pop         ecx
 007002E9    mov         dword ptr fs:[eax],edx
 007002EC    push        700301
 007002F1    lea         eax,[ebp-4]
 007002F4    call        @UStrClr
 007002F9    ret
>007002FA    jmp         @HandleFinally
>007002FF    jmp         007002F1
 00700301    mov         eax,ebx
 00700303    pop         ebx
 00700304    pop         ecx
 00700305    pop         ebp
 00700306    ret
*}
end;

//00700308
function TModuleAny.GetGoodFields:TStringList;
begin
{*
 00700308    push        ebx
 00700309    mov         dl,1
 0070030B    mov         eax,[0043C7BC];TStringList
 00700310    call        TStringList.Create;TStringList.Create
 00700315    mov         ebx,eax
 00700317    mov         edx,70049C;'OK'
 0070031C    mov         eax,ebx
 0070031E    mov         ecx,dword ptr [eax]
 00700320    call        dword ptr [ecx+38];TStringList.Add
 00700323    mov         edx,7004B0;'Cancel'
 00700328    mov         eax,ebx
 0070032A    mov         ecx,dword ptr [eax]
 0070032C    call        dword ptr [ecx+38];TStringList.Add
 0070032F    mov         edx,7004CC;'OtherButton1'
 00700334    mov         eax,ebx
 00700336    mov         ecx,dword ptr [eax]
 00700338    call        dword ptr [ecx+38];TStringList.Add
 0070033B    mov         edx,7004F4;'OtherButton2'
 00700340    mov         eax,ebx
 00700342    mov         ecx,dword ptr [eax]
 00700344    call        dword ptr [ecx+38];TStringList.Add
 00700347    mov         edx,70051C;'LeftTrigger'
 0070034C    mov         eax,ebx
 0070034E    mov         ecx,dword ptr [eax]
 00700350    call        dword ptr [ecx+38];TStringList.Add
 00700353    mov         edx,700540;'RightTrigger'
 00700358    mov         eax,ebx
 0070035A    mov         ecx,dword ptr [eax]
 0070035C    call        dword ptr [ecx+38];TStringList.Add
 0070035F    mov         edx,700568;'WorseLeftTrigger'
 00700364    mov         eax,ebx
 00700366    mov         ecx,dword ptr [eax]
 00700368    call        dword ptr [ecx+38];TStringList.Add
 0070036B    mov         edx,700598;'WorseRightTrigger'
 00700370    mov         eax,ebx
 00700372    mov         ecx,dword ptr [eax]
 00700374    call        dword ptr [ecx+38];TStringList.Add
 00700377    mov         edx,7005C8;'Select'
 0070037C    mov         eax,ebx
 0070037E    mov         ecx,dword ptr [eax]
 00700380    call        dword ptr [ecx+38];TStringList.Add
 00700383    mov         edx,7005E4;'Start'
 00700388    mov         eax,ebx
 0070038A    mov         ecx,dword ptr [eax]
 0070038C    call        dword ptr [ecx+38];TStringList.Add
 0070038F    mov         edx,7005FC;'Home'
 00700394    mov         eax,ebx
 00700396    mov         ecx,dword ptr [eax]
 00700398    call        dword ptr [ecx+38];TStringList.Add
 0070039B    mov         edx,700614;'L3'
 007003A0    mov         eax,ebx
 007003A2    mov         ecx,dword ptr [eax]
 007003A4    call        dword ptr [ecx+38];TStringList.Add
 007003A7    mov         edx,700628;'R3'
 007003AC    mov         eax,ebx
 007003AE    mov         ecx,dword ptr [eax]
 007003B0    call        dword ptr [ecx+38];TStringList.Add
 007003B3    mov         edx,70063C;'Circle'
 007003B8    mov         eax,ebx
 007003BA    mov         ecx,dword ptr [eax]
 007003BC    call        dword ptr [ecx+38];TStringList.Add
 007003BF    mov         edx,700658;'Cross'
 007003C4    mov         eax,ebx
 007003C6    mov         ecx,dword ptr [eax]
 007003C8    call        dword ptr [ecx+38];TStringList.Add
 007003CB    mov         edx,700670;'Triangle'
 007003D0    mov         eax,ebx
 007003D2    mov         ecx,dword ptr [eax]
 007003D4    call        dword ptr [ecx+38];TStringList.Add
 007003D7    mov         edx,700690;'Square'
 007003DC    mov         eax,ebx
 007003DE    mov         ecx,dword ptr [eax]
 007003E0    call        dword ptr [ecx+38];TStringList.Add
 007003E3    mov         edx,7006AC;'TopLeftTrigger'
 007003E8    mov         eax,ebx
 007003EA    mov         ecx,dword ptr [eax]
 007003EC    call        dword ptr [ecx+38];TStringList.Add
 007003EF    mov         edx,7006D8;'BottomLeftTrigger'
 007003F4    mov         eax,ebx
 007003F6    mov         ecx,dword ptr [eax]
 007003F8    call        dword ptr [ecx+38];TStringList.Add
 007003FB    mov         edx,700708;'TopRightTrigger'
 00700400    mov         eax,ebx
 00700402    mov         ecx,dword ptr [eax]
 00700404    call        dword ptr [ecx+38];TStringList.Add
 00700407    mov         edx,700734;'BottomRightTrigger'
 0070040C    mov         eax,ebx
 0070040E    mov         ecx,dword ptr [eax]
 00700410    call        dword ptr [ecx+38];TStringList.Add
 00700413    mov         edx,700768;'Left'
 00700418    mov         eax,ebx
 0070041A    mov         ecx,dword ptr [eax]
 0070041C    call        dword ptr [ecx+38];TStringList.Add
 0070041F    mov         edx,700780;'Right'
 00700424    mov         eax,ebx
 00700426    mov         ecx,dword ptr [eax]
 00700428    call        dword ptr [ecx+38];TStringList.Add
 0070042B    mov         edx,700798;'Up'
 00700430    mov         eax,ebx
 00700432    mov         ecx,dword ptr [eax]
 00700434    call        dword ptr [ecx+38];TStringList.Add
 00700437    mov         edx,7007AC;'Down'
 0070043C    mov         eax,ebx
 0070043E    mov         ecx,dword ptr [eax]
 00700440    call        dword ptr [ecx+38];TStringList.Add
 00700443    mov         edx,7007C4;'DPadX'
 00700448    mov         eax,ebx
 0070044A    mov         ecx,dword ptr [eax]
 0070044C    call        dword ptr [ecx+38];TStringList.Add
 0070044F    mov         edx,7007DC;'DPadY'
 00700454    mov         eax,ebx
 00700456    mov         ecx,dword ptr [eax]
 00700458    call        dword ptr [ecx+38];TStringList.Add
 0070045B    mov         edx,7007F4;'LeftStickX'
 00700460    mov         eax,ebx
 00700462    mov         ecx,dword ptr [eax]
 00700464    call        dword ptr [ecx+38];TStringList.Add
 00700467    mov         edx,700818;'LeftStickY'
 0070046C    mov         eax,ebx
 0070046E    mov         ecx,dword ptr [eax]
 00700470    call        dword ptr [ecx+38];TStringList.Add
 00700473    mov         edx,70083C;'RightStickX'
 00700478    mov         eax,ebx
 0070047A    mov         ecx,dword ptr [eax]
 0070047C    call        dword ptr [ecx+38];TStringList.Add
 0070047F    mov         edx,700860;'RightStickY'
 00700484    mov         eax,ebx
 00700486    mov         ecx,dword ptr [eax]
 00700488    call        dword ptr [ecx+38];TStringList.Add
 0070048B    mov         eax,ebx
 0070048D    pop         ebx
 0070048E    ret
*}
end;

//00700878
procedure TModuleAny.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 00700878    push        ebp
 00700879    mov         ebp,esp
 0070087B    mov         byte ptr [edx],1
 0070087E    mov         dword ptr [ecx],1
 00700884    mov         eax,dword ptr [ebp+8]
 00700887    mov         dword ptr [eax],14
 0070088D    pop         ebp
 0070088E    ret         4
*}
end;

//00700894
procedure TModuleAny.MonitorFrame;
begin
{*
 00700894    ret
*}
end;

//00700898
procedure TModuleAny.PrepareForGUI;
begin
{*
 00700898    ret
*}
end;

//0070089C
procedure TModuleAny.PrepareForMonitoring;
begin
{*
 0070089C    ret
*}
end;

//007008A0
function TModuleAny.Read:Boolean;
begin
{*
 007008A0    mov         al,1
 007008A2    ret
*}
end;

//007008A4
procedure TModuleAny.StartCompiletime;
begin
{*
 007008A4    call        TPieModule.StartCompiletime
 007008A9    call        006FC3C8
 007008AE    ret
*}
end;

//007008B0
procedure TModuleAny.StartGUI;
begin
{*
 007008B0    call        0074BF10
 007008B5    call        TWiimoteManager.StartGUI
 007008BA    ret
*}
end;

//007008BC
procedure TModuleAny.StartMonitoring;
begin
{*
 007008BC    push        ebx
 007008BD    mov         ebx,eax
 007008BF    mov         byte ptr [ebx+28],1;TModuleAny.Monitoring:Boolean
 007008C3    mov         eax,dword ptr [ebx+30];TModuleAny.OldButtonsDown:TStringList
 007008C6    mov         edx,dword ptr [eax]
 007008C8    call        dword ptr [edx+44];TStringList.Clear
 007008CB    mov         eax,dword ptr [ebx+2C];TModuleAny.ButtonsDown:TStringList
 007008CE    mov         edx,dword ptr [eax]
 007008D0    call        dword ptr [edx+44];TStringList.Clear
 007008D3    pop         ebx
 007008D4    ret
*}
end;

//007008D8
procedure TModuleAny.StartRuntime;
begin
{*
 007008D8    push        ebx
 007008D9    mov         ebx,eax
 007008DB    mov         eax,ebx
 007008DD    call        TPieModule.StartRuntime
 007008E2    cmp         byte ptr [ebx+24],0;TModuleAny.Used:Boolean
>007008E6    je          007008F9
 007008E8    call        0074BF10
 007008ED    call        TWiimoteManager.StartRuntime
 007008F2    mov         byte ptr ds:[82299D],1;gvar_0082299D
 007008F9    cmp         byte ptr [ebx+24],0;TModuleAny.Used:Boolean
>007008FD    je          00700909
 007008FF    call        0074BF10
 00700904    call        TWiimoteManager.StartRuntime
 00700909    pop         ebx
 0070090A    ret
*}
end;

//0070090C
procedure TModuleAny.StopCompiletime;
begin
{*
 0070090C    push        ebx
 0070090D    mov         ebx,eax
 0070090F    call        006FC3DC
 00700914    mov         eax,ebx
 00700916    call        TPieModule.StopCompiletime
 0070091B    pop         ebx
 0070091C    ret
*}
end;

//00700920
procedure TModuleAny.StopGUI;
begin
{*
 00700920    mov         edx,dword ptr [eax]
 00700922    call        dword ptr [edx+34];TModuleAny.StopRuntime
 00700925    ret
*}
end;

//00700928
procedure TModuleAny.StopMonitoring;
begin
{*
 00700928    mov         byte ptr [eax+28],0;TModuleAny.Monitoring:Boolean
 0070092C    ret
*}
end;

//00700930
procedure TModuleAny.StopRuntime;
begin
{*
 00700930    push        ebx
 00700931    mov         ebx,eax
 00700933    cmp         byte ptr [ebx+24],0;TModuleAny.Used:Boolean
>00700937    je          00700943
 00700939    call        0074BF10
 0070093E    call        TWiimoteManager.StopRuntime
 00700943    mov         byte ptr ds:[82299D],0;gvar_0082299D
 0070094A    mov         eax,ebx
 0070094C    call        TPieModule.StopRuntime
 00700951    pop         ebx
 00700952    ret
*}
end;

Initialization
//00782D80
{*
 00782D80    sub         dword ptr ds:[8229A0],1
>00782D87    jae         00782DA4
 00782D89    mov         dl,1
 00782D8B    mov         eax,[006F82FC];TModuleAny
 00782D90    call        TModuleAny.Create;TModuleAny.Create
 00782D95    mov         [008229A4],eax;gvar_008229A4:TModuleAny
 00782D9A    mov         eax,[008229A4];gvar_008229A4:TModuleAny
 00782D9F    call        005E31AC
 00782DA4    ret
*}
Finalization
end.