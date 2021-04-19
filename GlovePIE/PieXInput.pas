//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieXInput;

interface

uses
  SysUtils, Classes;

type
  TXInputValue = class(TObjectValue)
  published
    function GetPerUnits1:TUnits;//006EE884
    function GetUnits:TUnits;//006EE8CC
    //procedure GetString(?:?);//006EE8A4
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;//006EEEBC
    procedure GetVector(x:Double; y:Double; z:Double);//006EEC14
    function GetPerUnits2:TUnits;//006EE894
    procedure FillClone(c:TExpression);//006EE824
    //function SetValue(NewValue:Double; ?:?):Boolean;//006EED78
    function CanSet:Boolean;//006EE810
    function GetDataType:TDataType;//006EE844
    procedure CreateClone;//006EE814
    procedure GetValue;//006EE8DC
    //procedure ToString(?:?);//006EEF20
  public
    ..........................................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//006EEF20
    procedure GetValue; virtual;//v2C//006EE8DC
    //procedure GetString(?:?); virtual;//v38//006EE8A4
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//006EEC14
    function GetDataType:TDataType; virtual;//v44//006EE844
    function GetUnits:TUnits; virtual;//v48//006EE8CC
    function GetPerUnits1:TUnits; virtual;//v4C//006EE884
    function GetPerUnits2:TUnits; virtual;//v50//006EE894
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//006EED78
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean; virtual;//v60//006EEEBC
    function CanSet:Boolean; virtual;//v68//006EE810
    procedure CreateClone; virtual;//v80//006EE814
    procedure FillClone(c:TExpression); virtual;//v84//006EE824
  end;
  TModuleXInput = class(TPieModule)
  published
    function GetFields:TStringList;//006F04F4
    function IsIdentifier(s:string):Boolean;//006F08CC
    procedure Read;//006F0E8C
    function GetGoodFields:TStringList;//006F0570
    procedure PrepareForMonitoring;//006F0E7C
    procedure MonitorFrame;//006F0918
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//006F08B0
    function GetDefaultFormat(field:string):TGuiFormat;//006F046C
    procedure StartCompiletime;//006F0E94
    procedure StopCompiletime;//006F0EAC
    procedure StartRuntime;//006F0EA0
    procedure StopRuntime;//006F0EC0
    function CreateValue(Identifier:string):TExpression;//006F0418
    procedure ClearRead;//006F0360
    constructor Create;//006F0368
    procedure AddFields;//006EF21C
  public
    function IsIdentifier(s:string):Boolean; virtual;//v10//006F08CC
    function CreateValue(Identifier:string):TExpression; virtual;//v14//006F0418
    function GetFields:TStringList; virtual;//v18//006F04F4
    function GetGoodFields:TStringList; virtual;//v1C//006F0570
    procedure AddFields; virtual;//v24//006EF21C
    procedure StartCompiletime; virtual;//v28//006F0E94
    procedure StopCompiletime; virtual;//v2C//006F0EAC
    procedure StartRuntime; virtual;//v30//006F0EA0
    procedure StopRuntime; virtual;//v34//006F0EC0
    procedure ClearRead; virtual;//v38//006F0360
    procedure Read; virtual;//v3C//006F0E8C
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//006F08B0
    function GetDefaultFormat(field:string):TGuiFormat; virtual;//v44//006F046C
    procedure PrepareForMonitoring; virtual;//v5C//006F0E7C
    procedure MonitorFrame; virtual;//v68//006F0918
  end;
    //function sub_006EE450:?;//006EE450
    //function sub_006EE46C(?:?; ?:?):?;//006EE46C
    //procedure sub_006EE4E4(?:?; ?:?);//006EE4E4
    //function sub_006EE610(?:string):?;//006EE610
    procedure sub_006EF004;//006EF004
    procedure sub_006EF00C;//006EF00C
    procedure sub_006EF010;//006EF010
    procedure sub_006EF024;//006EF024
    //function sub_006EF040:?;//006EF040
    //function sub_006EF078(?:UnicodeString):?;//006EF078
    //procedure sub_006EF0CC(?:Integer; ?:?);//006EF0CC
    //function sub_006EF0E8(?:string):?;//006EF0E8

implementation

//006EE450
{*function sub_006EE450:?;
begin
 006EE450    xor         ecx,ecx
 006EE452    mov         edx,4
 006EE457    mov         eax,8227B0;gvar_008227B0
 006EE45C    cmp         byte ptr [eax],0
>006EE45F    je          006EE462
 006EE461    inc         ecx
 006EE462    inc         eax
 006EE463    dec         edx
>006EE464    jne         006EE45C
 006EE466    mov         eax,ecx
 006EE468    ret
end;*}

//006EE46C
{*function sub_006EE46C(?:?; ?:?):?;
begin
 006EE46C    push        ebx
 006EE46D    push        esi
 006EE46E    push        edi
 006EE46F    mov         esi,edx
 006EE471    mov         ebx,eax
 006EE473    test        ebx,ebx
>006EE475    jl          006EE480
 006EE477    call        006EE450
 006EE47C    cmp         ebx,eax
>006EE47E    jle         006EE484
 006EE480    xor         ecx,ecx
>006EE482    jmp         006EE4DB
 006EE484    test        ebx,ebx
>006EE486    jle         006EE4A9
 006EE488    cmp         byte ptr [ebx+8227AF],0
>006EE48F    je          006EE4A1
 006EE491    mov         eax,ebx
 006EE493    add         eax,eax
 006EE495    movzx       eax,word ptr [eax*8+822764];gvar_00822764:Single
 006EE49D    test        eax,esi
>006EE49F    jne         006EE4A5
 006EE4A1    xor         ecx,ecx
>006EE4A3    jmp         006EE4DB
 006EE4A5    mov         cl,1
>006EE4A7    jmp         006EE4DB
 006EE4A9    xor         ecx,ecx
 006EE4AB    mov         edi,4
 006EE4B0    mov         eax,8227B0;gvar_008227B0
 006EE4B5    mov         edx,822774;gvar_00822774
 006EE4BA    test        cl,cl
>006EE4BC    jne         006EE4CE
 006EE4BE    cmp         byte ptr [eax],0
>006EE4C1    je          006EE4CA
 006EE4C3    movzx       ecx,word ptr [edx]
 006EE4C6    test        ecx,esi
>006EE4C8    jne         006EE4CE
 006EE4CA    xor         ecx,ecx
>006EE4CC    jmp         006EE4D0
 006EE4CE    mov         cl,1
 006EE4D0    test        cl,cl
>006EE4D2    jne         006EE4DB
 006EE4D4    add         edx,10
 006EE4D7    inc         eax
 006EE4D8    dec         edi
>006EE4D9    jne         006EE4BA
 006EE4DB    mov         eax,ecx
 006EE4DD    pop         edi
 006EE4DE    pop         esi
 006EE4DF    pop         ebx
 006EE4E0    ret
end;*}

//006EE4E4
{*procedure sub_006EE4E4(?:?; ?:?);
begin
 006EE4E4    push        ebx
 006EE4E5    push        esi
 006EE4E6    add         esp,0FFFFFFF4
 006EE4E9    mov         esi,edx
 006EE4EB    mov         ebx,eax
 006EE4ED    test        ebx,ebx
>006EE4EF    jl          006EE4FA
 006EE4F1    call        006EE450
 006EE4F6    cmp         ebx,eax
>006EE4F8    jle         006EE508
 006EE4FA    xor         eax,eax
 006EE4FC    mov         dword ptr [esp],eax
 006EE4FF    mov         dword ptr [esp+4],eax
>006EE503    jmp         006EE5FF
 006EE508    test        ebx,ebx
>006EE50A    jle         006EE534
 006EE50C    cmp         esi,1
>006EE50F    jne         006EE534
 006EE511    mov         eax,ebx
 006EE513    add         eax,eax
 006EE515    movzx       eax,byte ptr [eax*8+822766];gvar_00822766
 006EE51D    mov         dword ptr [esp+8],eax
 006EE521    fild        dword ptr [esp+8]
 006EE525    fdiv        dword ptr ds:[6EE608];255:Single
 006EE52B    fstp        qword ptr [esp]
 006EE52E    wait
>006EE52F    jmp         006EE5FF
 006EE534    test        ebx,ebx
>006EE536    jle         006EE560
 006EE538    cmp         esi,2
>006EE53B    jne         006EE560
 006EE53D    mov         eax,ebx
 006EE53F    add         eax,eax
 006EE541    movzx       eax,byte ptr [eax*8+822767];gvar_00822767
 006EE549    mov         dword ptr [esp+8],eax
 006EE54D    fild        dword ptr [esp+8]
 006EE551    fdiv        dword ptr ds:[6EE608];255:Single
 006EE557    fstp        qword ptr [esp]
 006EE55A    wait
>006EE55B    jmp         006EE5FF
 006EE560    xor         eax,eax
 006EE562    mov         dword ptr [esp],eax
 006EE565    mov         dword ptr [esp+4],eax
 006EE569    cmp         esi,1
>006EE56C    jne         006EE597
 006EE56E    mov         eax,4
 006EE573    mov         edx,ebx
 006EE575    add         edx,edx
 006EE577    movzx       edx,byte ptr [edx*8+822766];gvar_00822766
 006EE57F    mov         dword ptr [esp+8],edx
 006EE583    fild        dword ptr [esp+8]
 006EE587    fdiv        dword ptr ds:[6EE608];255:Single
 006EE58D    fadd        qword ptr [esp]
 006EE590    fstp        qword ptr [esp]
 006EE593    wait
 006EE594    dec         eax
>006EE595    jne         006EE573
 006EE597    cmp         esi,2
>006EE59A    jne         006EE5C5
 006EE59C    mov         eax,4
 006EE5A1    mov         edx,ebx
 006EE5A3    add         edx,edx
 006EE5A5    movzx       edx,byte ptr [edx*8+822767];gvar_00822767
 006EE5AD    mov         dword ptr [esp+8],edx
 006EE5B1    fild        dword ptr [esp+8]
 006EE5B5    fdiv        dword ptr ds:[6EE608];255:Single
 006EE5BB    fadd        qword ptr [esp]
 006EE5BE    fstp        qword ptr [esp]
 006EE5C1    wait
 006EE5C2    dec         eax
>006EE5C3    jne         006EE5A1
 006EE5C5    fld         qword ptr [esp]
 006EE5C8    fcomp       dword ptr ds:[6EE60C];1:Single
 006EE5CE    wait
 006EE5CF    fnstsw      al
 006EE5D1    sahf
>006EE5D2    jbe         006EE5E3
 006EE5D4    xor         eax,eax
 006EE5D6    mov         dword ptr [esp],eax
 006EE5D9    mov         dword ptr [esp+4],3FF00000
>006EE5E1    jmp         006EE5FF
 006EE5E3    fld         qword ptr [esp]
 006EE5E6    fcomp       dword ptr ds:[6EE60C];1:Single
 006EE5EC    wait
 006EE5ED    fnstsw      al
 006EE5EF    sahf
>006EE5F0    jae         006EE5FF
 006EE5F2    xor         eax,eax
 006EE5F4    mov         dword ptr [esp],eax
 006EE5F7    mov         dword ptr [esp+4],0BFF00000
 006EE5FF    fld         qword ptr [esp]
 006EE602    add         esp,0C
 006EE605    pop         esi
 006EE606    pop         ebx
 006EE607    ret
end;*}

//006EE610
{*function sub_006EE610(?:string):?;
begin
 006EE610    push        ebp
 006EE611    mov         ebp,esp
 006EE613    add         esp,0FFFFFFF4
 006EE616    push        ebx
 006EE617    push        esi
 006EE618    push        edi
 006EE619    xor         edx,edx
 006EE61B    mov         dword ptr [ebp-8],edx
 006EE61E    mov         dword ptr [ebp-4],eax
 006EE621    mov         eax,dword ptr [ebp-4]
 006EE624    call        @UStrAddRef
 006EE629    xor         eax,eax
 006EE62B    push        ebp
 006EE62C    push        6EE755
 006EE631    push        dword ptr fs:[eax]
 006EE634    mov         dword ptr fs:[eax],esp
 006EE637    xor         ebx,ebx
 006EE639    lea         eax,[ebp-8]
 006EE63C    mov         edx,dword ptr [ebp-4]
 006EE63F    call        @UStrLAsg
 006EE644    lea         eax,[ebp-8]
 006EE647    mov         edx,6EE774;'Real'
 006EE64C    call        004F9BD0
 006EE651    mov         byte ptr [ebp-9],al
 006EE654    lea         eax,[ebp-8]
 006EE657    mov         edx,6EE78C;'Fake'
 006EE65C    call        004F9BD0
 006EE661    mov         byte ptr [ebp-0A],al
 006EE664    cmp         byte ptr [ebp-0A],0
>006EE668    jne         006EE73A
 006EE66E    lea         eax,[ebp-8]
 006EE671    mov         edx,6EE7A4;'XInput'
 006EE676    call        004F9BD0
 006EE67B    test        al,al
>006EE67D    jne         006EE6A5
 006EE67F    lea         eax,[ebp-8]
 006EE682    mov         edx,6EE7C0;'XBox360Controller'
 006EE687    call        004F9BD0
 006EE68C    test        al,al
>006EE68E    jne         006EE6A5
 006EE690    lea         eax,[ebp-8]
 006EE693    mov         edx,6EE7F0;'XBox360'
 006EE698    call        004F9BD0
 006EE69D    test        al,al
>006EE69F    je          006EE73A
 006EE6A5    lea         eax,[ebp-8]
 006EE6A8    call        004F9D00
 006EE6AD    mov         esi,eax
 006EE6AF    lea         eax,[ebp-8]
 006EE6B2    mov         edx,6EE80C;'.'
 006EE6B7    call        004F9BD0
 006EE6BC    test        al,al
>006EE6BE    je          006EE73A
 006EE6C0    cmp         byte ptr [ebp-9],0
>006EE6C4    je          006EE6E5
 006EE6C6    lea         eax,[ebp-8]
 006EE6C9    mov         edx,6EE774;'Real'
 006EE6CE    call        004F9BD0
 006EE6D3    lea         eax,[ebp-8]
 006EE6D6    mov         ecx,dword ptr [ebp-8]
 006EE6D9    mov         edx,6EE774;'Real'
 006EE6DE    call        @UStrCat3
>006EE6E3    jmp         006EE708
 006EE6E5    cmp         byte ptr [ebp-0A],0
>006EE6E9    je          006EE708
 006EE6EB    lea         eax,[ebp-8]
 006EE6EE    mov         edx,6EE78C;'Fake'
 006EE6F3    call        004F9BD0
 006EE6F8    lea         eax,[ebp-8]
 006EE6FB    mov         ecx,dword ptr [ebp-8]
 006EE6FE    mov         edx,6EE78C;'Fake'
 006EE703    call        @UStrCat3
 006EE708    mov         eax,dword ptr [ebp-8]
 006EE70B    call        006EF078
 006EE710    mov         edi,eax
 006EE712    test        edi,edi
>006EE714    jl          006EE73A
 006EE716    mov         dl,1
 006EE718    mov         eax,[006EDB78];TXInputValue
 006EE71D    call        TObject.Create;TXInputValue.Create
 006EE722    mov         ebx,eax
 006EE724    mov         dword ptr [ebx+20],edi;TXInputValue............................................Item:Inte...
 006EE727    test        esi,esi
>006EE729    jg          006EE730
 006EE72B    mov         esi,1
 006EE730    mov         dword ptr [ebx+18],esi;TXInputValue........................................................
 006EE733    mov         byte ptr ds:[82276C],1;gvar_0082276C
 006EE73A    xor         eax,eax
 006EE73C    pop         edx
 006EE73D    pop         ecx
 006EE73E    pop         ecx
 006EE73F    mov         dword ptr fs:[eax],edx
 006EE742    push        6EE75C
 006EE747    lea         eax,[ebp-8]
 006EE74A    mov         edx,2
 006EE74F    call        @UStrArrayClr
 006EE754    ret
>006EE755    jmp         @HandleFinally
>006EE75A    jmp         006EE747
 006EE75C    mov         eax,ebx
 006EE75E    pop         edi
 006EE75F    pop         esi
 006EE760    pop         ebx
 006EE761    mov         esp,ebp
 006EE763    pop         ebp
 006EE764    ret
end;*}

//006EE810
function TXInputValue.CanSet:Boolean;
begin
{*
 006EE810    mov         al,1
 006EE812    ret
*}
end;

//006EE814
procedure TXInputValue.CreateClone;
begin
{*
 006EE814    mov         dl,1
 006EE816    mov         eax,[006EDB78];TXInputValue
 006EE81B    call        TObject.Create;TXInputValue.Create
 006EE820    ret
*}
end;

//006EE824
procedure TXInputValue.FillClone(c:TExpression);
begin
{*
 006EE824    push        ebx
 006EE825    push        esi
 006EE826    mov         esi,edx
 006EE828    mov         ebx,eax
 006EE82A    mov         edx,esi
 006EE82C    mov         eax,ebx
 006EE82E    call        TExpression.FillClone
 006EE833    mov         eax,esi
 006EE835    mov         edx,dword ptr [ebx+20];TXInputValue.............................................Item:Int...
 006EE838    mov         dword ptr [eax+20],edx
 006EE83B    mov         edx,dword ptr [ebx+18];TXInputValue........................................................
 006EE83E    mov         dword ptr [eax+18],edx
 006EE841    pop         esi
 006EE842    pop         ebx
 006EE843    ret
*}
end;

//006EE844
function TXInputValue.GetDataType:TDataType;
begin
{*
 006EE844    mov         ecx,eax
 006EE846    mov         eax,dword ptr [ecx+20];TXInputValue..............................................Item:In...
 006EE849    mov         ecx,32
 006EE84E    cdq
 006EE84F    idiv        eax,ecx
 006EE851    cmp         edx,1E
>006EE854    jg          006EE869
>006EE856    je          006EE87E
 006EE858    sub         edx,10
>006EE85B    jb          006EE87B
>006EE85D    je          006EE878
 006EE85F    add         edx,0FFFFFFF7
 006EE862    sub         edx,2
>006EE865    jb          006EE87E
>006EE867    jmp         006EE881
 006EE869    add         edx,0FFFFFFE1
 006EE86C    sub         edx,2
>006EE86F    jb          006EE878
 006EE871    sub         edx,2
>006EE874    jb          006EE87E
>006EE876    jmp         006EE881
 006EE878    mov         al,3
 006EE87A    ret
 006EE87B    mov         al,3
 006EE87D    ret
 006EE87E    mov         al,2
 006EE880    ret
 006EE881    xor         eax,eax
 006EE883    ret
*}
end;

//006EE884
function TXInputValue.GetPerUnits1:TUnits;
begin
{*
 006EE884    mov         eax,dword ptr [eax+20];TXInputValue...............................................Item:I...
 006EE887    sub         eax,10
>006EE88A    jne         006EE88F
 006EE88C    xor         eax,eax
 006EE88E    ret
 006EE88F    xor         eax,eax
 006EE891    ret
*}
end;

//006EE894
function TXInputValue.GetPerUnits2:TUnits;
begin
{*
 006EE894    mov         eax,dword ptr [eax+20];TXInputValue................................................Item:...
 006EE897    sub         eax,10
>006EE89A    jne         006EE89F
 006EE89C    xor         eax,eax
 006EE89E    ret
 006EE89F    xor         eax,eax
 006EE8A1    ret
*}
end;

//006EE8A4
{*procedure TXInputValue.GetString(?:?);
begin
 006EE8A4    push        ebx
 006EE8A5    push        esi
 006EE8A6    mov         esi,edx
 006EE8A8    mov         ebx,eax
 006EE8AA    mov         eax,dword ptr [ebx+20];TXInputValue.................................................Item...
 006EE8AD    sub         eax,10
>006EE8B0    jne         006EE8BE
 006EE8B2    mov         edx,esi
 006EE8B4    mov         eax,ebx
 006EE8B6    call        TExpression.GetString
 006EE8BB    pop         esi
 006EE8BC    pop         ebx
 006EE8BD    ret
 006EE8BE    mov         edx,esi
 006EE8C0    mov         eax,ebx
 006EE8C2    call        TExpression.GetString
 006EE8C7    pop         esi
 006EE8C8    pop         ebx
 006EE8C9    ret
end;*}

//006EE8CC
function TXInputValue.GetUnits:TUnits;
begin
{*
 006EE8CC    mov         eax,dword ptr [eax+20];TXInputValue..................................................Ite...
 006EE8CF    sub         eax,10
>006EE8D2    jne         006EE8D7
 006EE8D4    xor         eax,eax
 006EE8D6    ret
 006EE8D7    xor         eax,eax
 006EE8D9    ret
*}
end;

//006EE8DC
procedure TXInputValue.GetValue;
begin
{*
 006EE8DC    push        ebx
 006EE8DD    add         esp,0FFFFFFEC
 006EE8E0    cmp         dword ptr [eax+20],1A;TXInputValue...................................................Ite...
>006EE8E4    jne         006EE8F6
 006EE8E6    mov         eax,[0078CCE0];^gvar_00822764:Single
 006EE8EB    fild        dword ptr [eax]
 006EE8ED    fstp        qword ptr [esp]
 006EE8F0    wait
>006EE8F1    jmp         006EEBFA
 006EE8F6    mov         edx,dword ptr [eax+18];TXInputValue........................................................
 006EE8F9    test        edx,edx
>006EE8FB    jne         006EE901
 006EE8FD    xor         edx,edx
>006EE8FF    jmp         006EE902
 006EE901    dec         edx
 006EE902    mov         ecx,dword ptr [eax+18];TXInputValue........................................................
 006EE905    test        ecx,ecx
>006EE907    jl          006EE90E
 006EE909    cmp         ecx,4
>006EE90C    jle         006EE91C
 006EE90E    xor         eax,eax
 006EE910    mov         dword ptr [esp],eax
 006EE913    mov         dword ptr [esp+4],eax
>006EE917    jmp         006EEBFA
 006EE91C    cmp         dword ptr [eax+20],64;TXInputValue....................................................It...
>006EE920    jge         006EE94B
 006EE922    cmp         byte ptr [edx+8227B0],0;gvar_008227B0
>006EE929    jne         006EE94B
 006EE92B    mov         ecx,dword ptr [eax+20];TXInputValue........................................................
 006EE92E    cmp         ecx,17
>006EE931    je          006EE94B
 006EE933    cmp         ecx,18
>006EE936    je          006EE94B
 006EE938    cmp         ecx,1F
>006EE93B    je          006EE94B
 006EE93D    xor         eax,eax
 006EE93F    mov         dword ptr [esp],eax
 006EE942    mov         dword ptr [esp+4],eax
>006EE946    jmp         006EEBFA
 006EE94B    mov         ebx,dword ptr [eax+20];TXInputValue........................................................
 006EE94E    mov         ecx,ebx
 006EE950    cmp         ecx,54
>006EE953    ja          006EEBF1
 006EE959    movzx       ecx,byte ptr [ecx+6EE967]
 006EE960    jmp         dword ptr [ecx*4+6EE9BC]
 006EE960    db          2
 006EE960    db          2
 006EE960    db          2
 006EE960    db          2
 006EE960    db          2
 006EE960    db          2
 006EE960    db          2
 006EE960    db          2
 006EE960    db          2
 006EE960    db          2
 006EE960    db          2
 006EE960    db          2
 006EE960    db          2
 006EE960    db          2
 006EE960    db          2
 006EE960    db          2
 006EE960    db          1
 006EE960    db          4
 006EE960    db          5
 006EE960    db          6
 006EE960    db          7
 006EE960    db          8
 006EE960    db          9
 006EE960    db          0
 006EE960    db          0
 006EE960    db          10
 006EE960    db          0
 006EE960    db          0
 006EE960    db          0
 006EE960    db          0
 006EE960    db          14
 006EE960    db          0
 006EE960    db          0
 006EE960    db          17
 006EE960    db          0
 006EE960    db          0
 006EE960    db          0
 006EE960    db          0
 006EE960    db          0
 006EE960    db          0
 006EE960    db          0
 006EE960    db          0
 006EE960    db          0
 006EE960    db          0
 006EE960    db          0
 006EE960    db          0
 006EE960    db          0
 006EE960    db          0
 006EE960    db          0
 006EE960    db          0
 006EE960    db          3
 006EE960    db          3
 006EE960    db          3
 006EE960    db          3
 006EE960    db          3
 006EE960    db          3
 006EE960    db          3
 006EE960    db          3
 006EE960    db          3
 006EE960    db          3
 006EE960    db          3
 006EE960    db          3
 006EE960    db          3
 006EE960    db          3
 006EE960    db          3
 006EE960    db          3
 006EE960    db          1
 006EE960    db          4
 006EE960    db          5
 006EE960    db          6
 006EE960    db          7
 006EE960    db          8
 006EE960    db          9
 006EE960    db          11
 006EE960    db          12
 006EE960    db          10
 006EE960    db          0
 006EE960    db          0
 006EE960    db          0
 006EE960    db          0
 006EE960    db          14
 006EE960    db          13
 006EE960    db          15
 006EE960    db          17
 006EE960    db          16
 006EE960    dd          006EEBF1
 006EE960    dd          006EEA04
 006EE960    dd          006EEA19
 006EE960    dd          006EEA3F
 006EE960    dd          006EEA68
 006EE960    dd          006EEA8B
 006EE960    dd          006EEAAE
 006EE960    dd          006EEAC8
 006EE960    dd          006EEAE2
 006EE960    dd          006EEAFC
 006EE960    dd          006EEB16
 006EE960    dd          006EEB38
 006EE960    dd          006EEB57
 006EE960    dd          006EEB76
 006EE960    dd          006EEB8E
 006EE960    dd          006EEBA8
 006EE960    dd          006EEBB7
 006EE960    dd          006EEBC6
 006EEA04    movzx       eax,byte ptr [edx+8227B0];gvar_008227B0
 006EEA0B    call        00686074
 006EEA10    fstp        qword ptr [esp]
 006EEA13    wait
>006EEA14    jmp         006EEBFA
 006EEA19    mov         ecx,ebx
 006EEA1B    mov         eax,1
 006EEA20    shl         eax,cl
 006EEA22    add         edx,edx
 006EEA24    movzx       edx,word ptr [edx*8+822774];gvar_00822774
 006EEA2C    and         eax,edx
 006EEA2E    setne       al
 006EEA31    call        00686074
 006EEA36    fstp        qword ptr [esp]
 006EEA39    wait
>006EEA3A    jmp         006EEBFA
 006EEA3F    mov         ecx,ebx
 006EEA41    sub         ecx,32
 006EEA44    mov         eax,1
 006EEA49    shl         eax,cl
 006EEA4B    add         edx,edx
 006EEA4D    movzx       edx,word ptr [edx*8+822774];gvar_00822774
 006EEA55    and         eax,edx
 006EEA57    setne       al
 006EEA5A    call        00686074
 006EEA5F    fstp        qword ptr [esp]
 006EEA62    wait
>006EEA63    jmp         006EEBFA
 006EEA68    mov         eax,edx
 006EEA6A    add         eax,eax
 006EEA6C    movzx       eax,byte ptr [eax*8+822776];gvar_00822776
 006EEA74    mov         dword ptr [esp+8],eax
 006EEA78    fild        dword ptr [esp+8]
 006EEA7C    fdiv        dword ptr ds:[6EEC04];255:Single
 006EEA82    fstp        qword ptr [esp]
 006EEA85    wait
>006EEA86    jmp         006EEBFA
 006EEA8B    mov         eax,edx
 006EEA8D    add         eax,eax
 006EEA8F    movzx       eax,byte ptr [eax*8+822777];gvar_00822777
 006EEA97    mov         dword ptr [esp+8],eax
 006EEA9B    fild        dword ptr [esp+8]
 006EEA9F    fdiv        dword ptr ds:[6EEC04];255:Single
 006EEAA5    fstp        qword ptr [esp]
 006EEAA8    wait
>006EEAA9    jmp         006EEBFA
 006EEAAE    mov         eax,edx
 006EEAB0    add         eax,eax
 006EEAB2    fild        word ptr [eax*8+822778]
 006EEAB9    fdiv        dword ptr ds:[6EEC08];32767:Single
 006EEABF    fstp        qword ptr [esp]
 006EEAC2    wait
>006EEAC3    jmp         006EEBFA
 006EEAC8    mov         eax,edx
 006EEACA    add         eax,eax
 006EEACC    fild        word ptr [eax*8+82277A]
 006EEAD3    fdiv        dword ptr ds:[6EEC08];32767:Single
 006EEAD9    fstp        qword ptr [esp]
 006EEADC    wait
>006EEADD    jmp         006EEBFA
 006EEAE2    mov         eax,edx
 006EEAE4    add         eax,eax
 006EEAE6    fild        word ptr [eax*8+82277C]
 006EEAED    fdiv        dword ptr ds:[6EEC08];32767:Single
 006EEAF3    fstp        qword ptr [esp]
 006EEAF6    wait
>006EEAF7    jmp         006EEBFA
 006EEAFC    mov         eax,edx
 006EEAFE    add         eax,eax
 006EEB00    fild        word ptr [eax*8+82277E]
 006EEB07    fdiv        dword ptr ds:[6EEC08];32767:Single
 006EEB0D    fstp        qword ptr [esp]
 006EEB10    wait
>006EEB11    jmp         006EEBFA
 006EEB16    mov         eax,edx
 006EEB18    add         eax,eax
 006EEB1A    mov         eax,dword ptr [eax*8+822770];gvar_00822770
 006EEB21    mov         dword ptr [esp+0C],eax
 006EEB25    xor         eax,eax
 006EEB27    mov         dword ptr [esp+10],eax
 006EEB2B    fild        qword ptr [esp+0C]
 006EEB2F    fstp        qword ptr [esp]
 006EEB32    wait
>006EEB33    jmp         006EEBFA
 006EEB38    movzx       eax,word ptr [edx*4+8227B4];gvar_008227B4
 006EEB40    mov         dword ptr [esp+8],eax
 006EEB44    fild        dword ptr [esp+8]
 006EEB48    fdiv        dword ptr ds:[6EEC0C];65535:Single
 006EEB4E    fstp        qword ptr [esp]
 006EEB51    wait
>006EEB52    jmp         006EEBFA
 006EEB57    movzx       eax,word ptr [edx*4+8227B6];gvar_008227B6
 006EEB5F    mov         dword ptr [esp+8],eax
 006EEB63    fild        dword ptr [esp+8]
 006EEB67    fdiv        dword ptr ds:[6EEC0C];65535:Single
 006EEB6D    fstp        qword ptr [esp]
 006EEB70    wait
>006EEB71    jmp         006EEBFA
 006EEB76    movzx       eax,byte ptr ds:[78C370];0x0 gvar_0078C370:Boolean
 006EEB7D    movsx       eax,al
 006EEB80    mov         dword ptr [esp+8],eax
 006EEB84    fild        dword ptr [esp+8]
 006EEB88    fstp        qword ptr [esp]
 006EEB8B    wait
>006EEB8C    jmp         006EEBFA
 006EEB8E    mov         eax,edx
 006EEB90    add         eax,eax
 006EEB92    movzx       eax,word ptr [eax*8+822774];gvar_00822774
 006EEB9A    mov         dword ptr [esp+8],eax
 006EEB9E    fild        dword ptr [esp+8]
 006EEBA2    fstp        qword ptr [esp]
 006EEBA5    wait
>006EEBA6    jmp         006EEBFA
 006EEBA8    xor         eax,eax
 006EEBAA    mov         dword ptr [esp],eax
 006EEBAD    mov         dword ptr [esp+4],3FF00000
>006EEBB5    jmp         006EEBFA
 006EEBB7    xor         eax,eax
 006EEBB9    mov         dword ptr [esp],eax
 006EEBBC    mov         dword ptr [esp+4],40100000
>006EEBC4    jmp         006EEBFA
 006EEBC6    xor         eax,eax
 006EEBC8    mov         dword ptr [esp],eax
 006EEBCB    mov         dword ptr [esp+4],eax
 006EEBCF    mov         edx,4
 006EEBD4    mov         eax,8227B0;gvar_008227B0
 006EEBD9    cmp         byte ptr [eax],0
>006EEBDC    je          006EEBEB
 006EEBDE    fld         qword ptr [esp]
 006EEBE1    fadd        dword ptr ds:[6EEC10];1:Single
 006EEBE7    fstp        qword ptr [esp]
 006EEBEA    wait
 006EEBEB    inc         eax
 006EEBEC    dec         edx
>006EEBED    jne         006EEBD9
>006EEBEF    jmp         006EEBFA
 006EEBF1    xor         eax,eax
 006EEBF3    mov         dword ptr [esp],eax
 006EEBF6    mov         dword ptr [esp+4],eax
 006EEBFA    fld         qword ptr [esp]
 006EEBFD    add         esp,14
 006EEC00    pop         ebx
 006EEC01    ret
*}
end;

//006EEC14
procedure TXInputValue.GetVector(x:Double; y:Double; z:Double);
begin
{*
 006EEC14    push        ebp
 006EEC15    mov         ebp,esp
 006EEC17    push        ecx
 006EEC18    push        ebx
 006EEC19    push        esi
 006EEC1A    push        edi
 006EEC1B    mov         edi,edx
 006EEC1D    mov         ebx,eax
 006EEC1F    xor         eax,eax
 006EEC21    mov         dword ptr [edi],eax
 006EEC23    mov         dword ptr [edi+4],eax
 006EEC26    xor         eax,eax
 006EEC28    mov         dword ptr [ecx],eax
 006EEC2A    mov         dword ptr [ecx+4],eax
 006EEC2D    mov         eax,dword ptr [ebp+8]
 006EEC30    xor         edx,edx
 006EEC32    mov         dword ptr [eax],edx
 006EEC34    mov         dword ptr [eax+4],edx
 006EEC37    mov         eax,dword ptr [ebx+18];TXInputValue........................................................
 006EEC3A    cmp         eax,1
>006EEC3D    jge         006EEC43
 006EEC3F    xor         esi,esi
>006EEC41    jmp         006EEC46
 006EEC43    mov         esi,eax
 006EEC45    dec         esi
 006EEC46    cmp         dword ptr [ebx+18],4;TXInputValue..........................................................
>006EEC4A    jle         006EEC86
 006EEC4C    mov         eax,dword ptr [ebx+20];TXInputValue........................................................
 006EEC4F    push        ecx
 006EEC50    mov         ecx,32
 006EEC55    cdq
 006EEC56    idiv        eax,ecx
 006EEC58    pop         ecx
 006EEC59    cmp         edx,1A
>006EEC5C    je          006EEC86
 006EEC5E    mov         eax,dword ptr [ebx+20];TXInputValue........................................................
 006EEC61    push        ecx
 006EEC62    mov         ecx,32
 006EEC67    cdq
 006EEC68    idiv        eax,ecx
 006EEC6A    pop         ecx
 006EEC6B    cmp         edx,21
>006EEC6E    je          006EEC86
 006EEC70    mov         eax,dword ptr [ebx+20];TXInputValue........................................................
 006EEC73    push        ecx
 006EEC74    mov         ecx,32
 006EEC79    cdq
 006EEC7A    idiv        eax,ecx
 006EEC7C    pop         ecx
 006EEC7D    cmp         edx,22
>006EEC80    jne         006EED6B
 006EEC86    mov         eax,dword ptr [ebx+20];TXInputValue........................................................
 006EEC89    cmp         eax,4D
>006EEC8C    jg          006EECA0
>006EEC8E    je          006EECFC
 006EEC90    sub         eax,1B
>006EEC93    je          006EECFC
 006EEC95    dec         eax
>006EEC96    je          006EECAD
 006EEC98    dec         eax
>006EEC99    je          006EECD6
>006EEC9B    jmp         006EED5E
 006EECA0    sub         eax,4E
>006EECA3    je          006EECAD
 006EECA5    dec         eax
>006EECA6    je          006EECD6
>006EECA8    jmp         006EED5E
 006EECAD    mov         eax,esi
 006EECAF    add         eax,eax
 006EECB1    fild        word ptr [eax*8+822778]
 006EECB8    fdiv        dword ptr ds:[6EED74];32767:Single
 006EECBE    fstp        qword ptr [edi]
 006EECC0    wait
 006EECC1    fild        word ptr [eax*8+82277A]
 006EECC8    fdiv        dword ptr ds:[6EED74];32767:Single
 006EECCE    fstp        qword ptr [ecx]
 006EECD0    wait
>006EECD1    jmp         006EED6B
 006EECD6    mov         eax,esi
 006EECD8    add         eax,eax
 006EECDA    fild        word ptr [eax*8+82277C]
 006EECE1    fdiv        dword ptr ds:[6EED74];32767:Single
 006EECE7    fstp        qword ptr [edi]
 006EECE9    wait
 006EECEA    fild        word ptr [eax*8+82277E]
 006EECF1    fdiv        dword ptr ds:[6EED74];32767:Single
 006EECF7    fstp        qword ptr [ecx]
 006EECF9    wait
>006EECFA    jmp         006EED6B
 006EECFC    mov         eax,esi
 006EECFE    add         eax,eax
 006EED00    test        byte ptr [eax*8+822774],8;gvar_00822774
 006EED08    setne       al
 006EED0B    and         eax,7F
 006EED0E    mov         edx,dword ptr [ebx+18];TXInputValue........................................................
 006EED11    add         edx,edx
 006EED13    test        byte ptr [edx*8+822764],4;gvar_00822764:Single
 006EED1B    setne       dl
 006EED1E    and         edx,7F
 006EED21    sub         eax,edx
 006EED23    mov         dword ptr [ebp-4],eax
 006EED26    fild        dword ptr [ebp-4]
 006EED29    fstp        qword ptr [edi]
 006EED2B    wait
 006EED2C    mov         eax,esi
 006EED2E    add         eax,eax
 006EED30    test        byte ptr [eax*8+822774],2;gvar_00822774
 006EED38    setne       al
 006EED3B    and         eax,7F
 006EED3E    mov         edx,dword ptr [ebx+18];TXInputValue........................................................
 006EED41    add         edx,edx
 006EED43    test        byte ptr [edx*8+822764],1;gvar_00822764:Single
 006EED4B    setne       dl
 006EED4E    and         edx,7F
 006EED51    sub         eax,edx
 006EED53    mov         dword ptr [ebp-4],eax
 006EED56    fild        dword ptr [ebp-4]
 006EED59    fstp        qword ptr [ecx]
 006EED5B    wait
>006EED5C    jmp         006EED6B
 006EED5E    mov         eax,dword ptr [ebp+8]
 006EED61    push        eax
 006EED62    mov         edx,edi
 006EED64    mov         eax,ebx
 006EED66    call        TExpression.GetVector
 006EED6B    pop         edi
 006EED6C    pop         esi
 006EED6D    pop         ebx
 006EED6E    pop         ecx
 006EED6F    pop         ebp
 006EED70    ret         4
*}
end;

//006EED78
{*function TXInputValue.SetValue(NewValue:Double; ?:?):Boolean;
begin
 006EED78    push        ebp
 006EED79    mov         ebp,esp
 006EED7B    push        ecx
 006EED7C    push        ebx
 006EED7D    push        esi
 006EED7E    mov         bl,1
 006EED80    mov         edx,dword ptr [eax+18];TXInputValue........................................................
 006EED83    cmp         edx,4
>006EED86    jg          006EEEAF
 006EED8C    cmp         edx,1
>006EED8F    jge         006EED95
 006EED91    xor         esi,esi
>006EED93    jmp         006EED98
 006EED95    mov         esi,edx
 006EED97    dec         esi
 006EED98    mov         eax,dword ptr [eax+20];TXInputValue........................................................
 006EED9B    cmp         eax,49
>006EED9E    jg          006EEDB8
>006EEDA0    je          006EEDCB
 006EEDA2    sub         eax,17
>006EEDA5    je          006EEDCB
 006EEDA7    dec         eax
>006EEDA8    je          006EEE1C
 006EEDAA    sub         eax,7
>006EEDAD    je          006EEE6A
>006EEDB3    jmp         006EEEAD
 006EEDB8    sub         eax,4A
>006EEDBB    je          006EEE1C
 006EEDBD    sub         eax,7
>006EEDC0    je          006EEE6A
>006EEDC6    jmp         006EEEAD
 006EEDCB    fld         qword ptr [ebp+8]
 006EEDCE    fabs
 006EEDD0    fmul        dword ptr ds:[6EEEB8];65535:Single
 006EEDD6    fstp        qword ptr [ebp+8]
 006EEDD9    wait
 006EEDDA    fld         qword ptr [ebp+8]
 006EEDDD    fcomp       dword ptr ds:[6EEEB8];65535:Single
 006EEDE3    wait
 006EEDE4    fnstsw      al
 006EEDE6    sahf
>006EEDE7    jbe         006EEDF5
 006EEDE9    xor         eax,eax
 006EEDEB    mov         dword ptr [ebp+8],eax
 006EEDEE    mov         dword ptr [ebp+0C],40EFFFE0
 006EEDF5    fld         qword ptr [ebp+8]
 006EEDF8    call        @ROUND
 006EEDFD    mov         word ptr [esi*4+8227B4],ax;gvar_008227B4
 006EEE05    lea         eax,[esi*4+8227B4];gvar_008227B4
 006EEE0C    push        eax
 006EEE0D    push        esi
 006EEE0E    mov         eax,[0078D720];^gvar_0082274C:Pointer
 006EEE13    mov         eax,dword ptr [eax]
 006EEE15    call        eax
>006EEE17    jmp         006EEEAF
 006EEE1C    fld         qword ptr [ebp+8]
 006EEE1F    fabs
 006EEE21    fmul        dword ptr ds:[6EEEB8];65535:Single
 006EEE27    fstp        qword ptr [ebp+8]
 006EEE2A    wait
 006EEE2B    fld         qword ptr [ebp+8]
 006EEE2E    fcomp       dword ptr ds:[6EEEB8];65535:Single
 006EEE34    wait
 006EEE35    fnstsw      al
 006EEE37    sahf
>006EEE38    jbe         006EEE46
 006EEE3A    xor         eax,eax
 006EEE3C    mov         dword ptr [ebp+8],eax
 006EEE3F    mov         dword ptr [ebp+0C],40EFFFE0
 006EEE46    fld         qword ptr [ebp+8]
 006EEE49    call        @ROUND
 006EEE4E    mov         word ptr [esi*4+8227B6],ax;gvar_008227B6
 006EEE56    lea         eax,[esi*4+8227B4];gvar_008227B4
 006EEE5D    push        eax
 006EEE5E    push        esi
 006EEE5F    mov         eax,[0078D720];^gvar_0082274C:Pointer
 006EEE64    mov         eax,dword ptr [eax]
 006EEE66    call        eax
>006EEE68    jmp         006EEEAF
 006EEE6A    push        dword ptr [ebp+0C]
 006EEE6D    push        dword ptr [ebp+8]
 006EEE70    call        00686060
 006EEE75    mov         byte ptr [ebp-1],al
 006EEE78    movzx       eax,byte ptr [ebp-1]
 006EEE7C    cmp         al,byte ptr ds:[78C370];0x0 gvar_0078C370:Boolean
>006EEE82    je          006EEEAF
 006EEE84    mov         eax,[0078D77C];^gvar_00822754:Pointer
 006EEE89    cmp         dword ptr [eax],0
>006EEE8C    je          006EEEA2
 006EEE8E    movzx       eax,byte ptr [ebp-1]
 006EEE92    xor         al,1
 006EEE94    neg         al
 006EEE96    sbb         eax,eax
 006EEE98    push        eax
 006EEE99    mov         eax,[0078D77C];^gvar_00822754:Pointer
 006EEE9E    mov         eax,dword ptr [eax]
 006EEEA0    call        eax
 006EEEA2    movzx       eax,byte ptr [ebp-1]
 006EEEA6    mov         [0078C370],al;gvar_0078C370:Boolean
>006EEEAB    jmp         006EEEAF
 006EEEAD    xor         ebx,ebx
 006EEEAF    mov         eax,ebx
 006EEEB1    pop         esi
 006EEEB2    pop         ebx
 006EEEB3    pop         ecx
 006EEEB4    pop         ebp
 006EEEB5    ret         8
end;*}

//006EEEBC
{*function TXInputValue.SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;
begin
 006EEEBC    push        ebp
 006EEEBD    mov         ebp,esp
 006EEEBF    push        ebx
 006EEEC0    push        esi
 006EEEC1    mov         ecx,eax
 006EEEC3    mov         bl,1
 006EEEC5    cmp         dword ptr [ecx+18],4;TXInputValue..........................................................
>006EEEC9    jle         006EEEFB
 006EEECB    mov         eax,dword ptr [ecx+20];TXInputValue........................................................
 006EEECE    mov         esi,32
 006EEED3    cdq
 006EEED4    idiv        eax,esi
 006EEED6    cmp         edx,1A
>006EEED9    je          006EEEFB
 006EEEDB    mov         eax,dword ptr [ecx+20];TXInputValue........................................................
 006EEEDE    mov         esi,32
 006EEEE3    cdq
 006EEEE4    idiv        eax,esi
 006EEEE6    cmp         edx,21
>006EEEE9    je          006EEEFB
 006EEEEB    mov         eax,dword ptr [ecx+20];TXInputValue........................................................
 006EEEEE    mov         esi,32
 006EEEF3    cdq
 006EEEF4    idiv        eax,esi
 006EEEF6    cmp         edx,22
>006EEEF9    jne         006EEF16
 006EEEFB    push        dword ptr [ebp+1C]
 006EEEFE    push        dword ptr [ebp+18]
 006EEF01    push        dword ptr [ebp+14]
 006EEF04    push        dword ptr [ebp+10]
 006EEF07    push        dword ptr [ebp+0C]
 006EEF0A    push        dword ptr [ebp+8]
 006EEF0D    mov         eax,ecx
 006EEF0F    call        TExpression.SetVector
 006EEF14    mov         ebx,eax
 006EEF16    mov         eax,ebx
 006EEF18    pop         esi
 006EEF19    pop         ebx
 006EEF1A    pop         ebp
 006EEF1B    ret         18
end;*}

//006EEF20
{*procedure TXInputValue.ToString(?:?);
begin
 006EEF20    push        ebp
 006EEF21    mov         ebp,esp
 006EEF23    push        0
 006EEF25    push        0
 006EEF27    push        0
 006EEF29    push        ebx
 006EEF2A    push        esi
 006EEF2B    push        edi
 006EEF2C    mov         esi,edx
 006EEF2E    mov         ebx,eax
 006EEF30    xor         eax,eax
 006EEF32    push        ebp
 006EEF33    push        6EEFAD
 006EEF38    push        dword ptr fs:[eax]
 006EEF3B    mov         dword ptr fs:[eax],esp
 006EEF3E    mov         edi,dword ptr [ebx+18];TXInputValue........................................................
 006EEF41    test        edi,edi
>006EEF43    jle         006EEF78
 006EEF45    push        6EEFC8;'XInput'
 006EEF4A    lea         edx,[ebp-4]
 006EEF4D    mov         eax,edi
 006EEF4F    call        IntToStr
 006EEF54    push        dword ptr [ebp-4]
 006EEF57    push        6EEFE4;'.'
 006EEF5C    lea         edx,[ebp-8]
 006EEF5F    mov         eax,dword ptr [ebx+20];TXInputValue........................................................
 006EEF62    call        006EF0CC
 006EEF67    push        dword ptr [ebp-8]
 006EEF6A    mov         eax,esi
 006EEF6C    mov         edx,4
 006EEF71    call        @UStrCatN
>006EEF76    jmp         006EEF92
 006EEF78    lea         edx,[ebp-0C]
 006EEF7B    mov         eax,dword ptr [ebx+20];TXInputValue........................................................
 006EEF7E    call        006EF0CC
 006EEF83    mov         ecx,dword ptr [ebp-0C]
 006EEF86    mov         eax,esi
 006EEF88    mov         edx,6EEFF4;'XInput.'
 006EEF8D    call        @UStrCat3
 006EEF92    xor         eax,eax
 006EEF94    pop         edx
 006EEF95    pop         ecx
 006EEF96    pop         ecx
 006EEF97    mov         dword ptr fs:[eax],edx
 006EEF9A    push        6EEFB4
 006EEF9F    lea         eax,[ebp-0C]
 006EEFA2    mov         edx,3
 006EEFA7    call        @UStrArrayClr
 006EEFAC    ret
>006EEFAD    jmp         @HandleFinally
>006EEFB2    jmp         006EEF9F
 006EEFB4    pop         edi
 006EEFB5    pop         esi
 006EEFB6    pop         ebx
 006EEFB7    mov         esp,ebp
 006EEFB9    pop         ebp
 006EEFBA    ret
end;*}

//006EF004
procedure sub_006EF004;
begin
{*
 006EF004    mov         byte ptr ds:[82276C],0;gvar_0082276C
 006EF00B    ret
*}
end;

//006EF00C
procedure sub_006EF00C;
begin
{*
 006EF00C    ret
*}
end;

//006EF010
procedure sub_006EF010;
begin
{*
 006EF010    cmp         byte ptr ds:[82276C],0;gvar_0082276C
>006EF017    je          006EF023
 006EF019    call        006ED888
 006EF01E    mov         [0082276D],al;gvar_0082276D
 006EF023    ret
*}
end;

//006EF024
procedure sub_006EF024;
begin
{*
 006EF024    movzx       eax,byte ptr ds:[82276C];gvar_0082276C
 006EF02B    and         al,byte ptr ds:[82276D];gvar_0082276D
>006EF031    je          006EF03F
 006EF033    call        006ED7F8
 006EF038    mov         byte ptr ds:[82276D],0;gvar_0082276D
 006EF03F    ret
*}
end;

//006EF040
{*function sub_006EF040:?;
begin
 006EF040    push        ebx
 006EF041    push        esi
 006EF042    push        edi
 006EF043    push        ebp
 006EF044    mov         bl,1
 006EF046    xor         edi,edi
 006EF048    mov         ebp,822770;gvar_00822770
 006EF04D    mov         esi,8227B0;gvar_008227B0
 006EF052    push        ebp
 006EF053    push        edi
 006EF054    mov         eax,[0078CE54];^gvar_00822748:Pointer
 006EF059    mov         eax,dword ptr [eax]
 006EF05B    call        eax
 006EF05D    test        eax,eax
 006EF05F    sete        al
 006EF062    mov         byte ptr [esi],al
 006EF064    inc         edi
 006EF065    inc         esi
 006EF066    add         ebp,10
 006EF069    cmp         edi,4
>006EF06C    jne         006EF052
 006EF06E    mov         eax,ebx
 006EF070    pop         ebp
 006EF071    pop         edi
 006EF072    pop         esi
 006EF073    pop         ebx
 006EF074    ret
end;*}

//006EF078
{*function sub_006EF078(?:UnicodeString):?;
begin
 006EF078    push        ebp
 006EF079    mov         ebp,esp
 006EF07B    push        ecx
 006EF07C    push        ebx
 006EF07D    mov         dword ptr [ebp-4],eax
 006EF080    mov         eax,dword ptr [ebp-4]
 006EF083    call        @UStrAddRef
 006EF088    xor         eax,eax
 006EF08A    push        ebp
 006EF08B    push        6EF0BE
 006EF090    push        dword ptr fs:[eax]
 006EF093    mov         dword ptr fs:[eax],esp
 006EF096    mov         eax,[008227C4];gvar_008227C4:TModuleXInput
 006EF09B    mov         eax,dword ptr [eax+1C]
 006EF09E    mov         edx,dword ptr [ebp-4]
 006EF0A1    call        THashTable.Get
 006EF0A6    mov         ebx,eax
 006EF0A8    xor         eax,eax
 006EF0AA    pop         edx
 006EF0AB    pop         ecx
 006EF0AC    pop         ecx
 006EF0AD    mov         dword ptr fs:[eax],edx
 006EF0B0    push        6EF0C5
 006EF0B5    lea         eax,[ebp-4]
 006EF0B8    call        @UStrClr
 006EF0BD    ret
>006EF0BE    jmp         @HandleFinally
>006EF0C3    jmp         006EF0B5
 006EF0C5    mov         eax,ebx
 006EF0C7    pop         ebx
 006EF0C8    pop         ecx
 006EF0C9    pop         ebp
 006EF0CA    ret
end;*}

//006EF0CC
{*procedure sub_006EF0CC(?:Integer; ?:?);
begin
 006EF0CC    push        ebx
 006EF0CD    push        esi
 006EF0CE    mov         esi,edx
 006EF0D0    mov         ebx,eax
 006EF0D2    mov         ecx,esi
 006EF0D4    mov         eax,[008227C4];gvar_008227C4:TModuleXInput
 006EF0D9    mov         eax,dword ptr [eax+1C]
 006EF0DC    mov         edx,ebx
 006EF0DE    call        THashTable.Get
 006EF0E3    pop         esi
 006EF0E4    pop         ebx
 006EF0E5    ret
end;*}

//006EF0E8
{*function sub_006EF0E8(?:string):?;
begin
 006EF0E8    push        ebp
 006EF0E9    mov         ebp,esp
 006EF0EB    push        ecx
 006EF0EC    push        ebx
 006EF0ED    mov         dword ptr [ebp-4],eax
 006EF0F0    mov         eax,dword ptr [ebp-4]
 006EF0F3    call        @UStrAddRef
 006EF0F8    xor         eax,eax
 006EF0FA    push        ebp
 006EF0FB    push        6EF17F
 006EF100    push        dword ptr fs:[eax]
 006EF103    mov         dword ptr fs:[eax],esp
 006EF106    lea         eax,[ebp-4]
 006EF109    mov         edx,6EF198;'Real'
 006EF10E    call        004F9BD0
 006EF113    lea         eax,[ebp-4]
 006EF116    mov         edx,6EF1B0;'XInput'
 006EF11B    call        004F9BD0
 006EF120    test        al,al
>006EF122    jne         006EF14A
 006EF124    lea         eax,[ebp-4]
 006EF127    mov         edx,6EF1CC;'XBox360Controller'
 006EF12C    call        004F9BD0
 006EF131    test        al,al
>006EF133    jne         006EF14A
 006EF135    lea         eax,[ebp-4]
 006EF138    mov         edx,6EF1FC;'XBox360'
 006EF13D    call        004F9BD0
 006EF142    test        al,al
>006EF144    jne         006EF14A
 006EF146    xor         ebx,ebx
>006EF148    jmp         006EF169
 006EF14A    lea         eax,[ebp-4]
 006EF14D    call        004F9D00
 006EF152    lea         eax,[ebp-4]
 006EF155    mov         edx,6EF218;'.'
 006EF15A    call        004F9BD0
 006EF15F    test        al,al
>006EF161    jne         006EF167
 006EF163    xor         ebx,ebx
>006EF165    jmp         006EF169
 006EF167    mov         bl,1
 006EF169    xor         eax,eax
 006EF16B    pop         edx
 006EF16C    pop         ecx
 006EF16D    pop         ecx
 006EF16E    mov         dword ptr fs:[eax],edx
 006EF171    push        6EF186
 006EF176    lea         eax,[ebp-4]
 006EF179    call        @UStrClr
 006EF17E    ret
>006EF17F    jmp         @HandleFinally
>006EF184    jmp         006EF176
 006EF186    mov         eax,ebx
 006EF188    pop         ebx
 006EF189    pop         ecx
 006EF18A    pop         ebp
 006EF18B    ret
end;*}

//006EF21C
procedure TModuleXInput.AddFields;
begin
{*
 006EF21C    push        ebx
 006EF21D    mov         ebx,eax
 006EF21F    mov         ecx,10
 006EF224    mov         edx,6EF834;'Exists'
 006EF229    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF22C    call        THashTable.Add
 006EF231    xor         ecx,ecx
 006EF233    mov         edx,6EF850;'Up'
 006EF238    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF23B    call        THashTable.Add
 006EF240    mov         ecx,1
 006EF245    mov         edx,6EF864;'Down'
 006EF24A    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF24D    call        THashTable.Add
 006EF252    mov         ecx,2
 006EF257    mov         edx,6EF87C;'Left'
 006EF25C    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF25F    call        THashTable.Add
 006EF264    mov         ecx,3
 006EF269    mov         edx,6EF894;'Right'
 006EF26E    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF271    call        THashTable.Add
 006EF276    xor         ecx,ecx
 006EF278    mov         edx,6EF8AC;'DPadUp'
 006EF27D    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF280    call        THashTable.Add
 006EF285    mov         ecx,1
 006EF28A    mov         edx,6EF8C8;'DPadDown'
 006EF28F    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF292    call        THashTable.Add
 006EF297    mov         ecx,2
 006EF29C    mov         edx,6EF8E8;'DPadLeft'
 006EF2A1    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF2A4    call        THashTable.Add
 006EF2A9    mov         ecx,3
 006EF2AE    mov         edx,6EF908;'DPadRight'
 006EF2B3    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF2B6    call        THashTable.Add
 006EF2BB    mov         ecx,4
 006EF2C0    mov         edx,6EF928;'Start'
 006EF2C5    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF2C8    call        THashTable.Add
 006EF2CD    mov         ecx,5
 006EF2D2    mov         edx,6EF940;'Back'
 006EF2D7    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF2DA    call        THashTable.Add
 006EF2DF    mov         ecx,6
 006EF2E4    mov         edx,6EF958;'LeftThumb'
 006EF2E9    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF2EC    call        THashTable.Add
 006EF2F1    mov         ecx,7
 006EF2F6    mov         edx,6EF978;'RightThumb'
 006EF2FB    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF2FE    call        THashTable.Add
 006EF303    mov         ecx,8
 006EF308    mov         edx,6EF99C;'LeftShoulder'
 006EF30D    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF310    call        THashTable.Add
 006EF315    mov         ecx,9
 006EF31A    mov         edx,6EF9C4;'RightShoulder'
 006EF31F    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF322    call        THashTable.Add
 006EF327    mov         ecx,0A
 006EF32C    mov         edx,6EF9EC;'ExtraButton1'
 006EF331    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF334    call        THashTable.Add
 006EF339    mov         ecx,0B
 006EF33E    mov         edx,6EFA14;'ExtraButton2'
 006EF343    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF346    call        THashTable.Add
 006EF34B    mov         ecx,0C
 006EF350    mov         edx,6EFA3C;'A'
 006EF355    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF358    call        THashTable.Add
 006EF35D    mov         ecx,0D
 006EF362    mov         edx,6EFA4C;'B'
 006EF367    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF36A    call        THashTable.Add
 006EF36F    mov         ecx,0E
 006EF374    mov         edx,6EFA5C;'X'
 006EF379    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF37C    call        THashTable.Add
 006EF381    mov         ecx,0F
 006EF386    mov         edx,6EFA6C;'Y'
 006EF38B    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF38E    call        THashTable.Add
 006EF393    mov         ecx,11
 006EF398    mov         edx,6EFA7C;'LeftTrigger'
 006EF39D    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF3A0    call        THashTable.Add
 006EF3A5    mov         ecx,12
 006EF3AA    mov         edx,6EFAA0;'RightTrigger'
 006EF3AF    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF3B2    call        THashTable.Add
 006EF3B7    mov         ecx,1C
 006EF3BC    mov         edx,6EFAC8;'LeftStick'
 006EF3C1    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF3C4    call        THashTable.Add
 006EF3C9    mov         ecx,1D
 006EF3CE    mov         edx,6EFAE8;'RightStick'
 006EF3D3    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF3D6    call        THashTable.Add
 006EF3DB    mov         ecx,13
 006EF3E0    mov         edx,6EFB0C;'LeftStickX'
 006EF3E5    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF3E8    call        THashTable.Add
 006EF3ED    mov         ecx,14
 006EF3F2    mov         edx,6EFB30;'LeftStickY'
 006EF3F7    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF3FA    call        THashTable.Add
 006EF3FF    mov         ecx,15
 006EF404    mov         edx,6EFB54;'RightStickX'
 006EF409    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF40C    call        THashTable.Add
 006EF411    mov         ecx,16
 006EF416    mov         edx,6EFB78;'RightStickY'
 006EF41B    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF41E    call        THashTable.Add
 006EF423    mov         ecx,1B
 006EF428    mov         edx,6EFB9C;'DPad'
 006EF42D    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF430    call        THashTable.Add
 006EF435    mov         ecx,1C
 006EF43A    mov         edx,6EFBB4;'Joy1'
 006EF43F    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF442    call        THashTable.Add
 006EF447    mov         ecx,1D
 006EF44C    mov         edx,6EFBCC;'Joy2'
 006EF451    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF454    call        THashTable.Add
 006EF459    mov         ecx,13
 006EF45E    mov         edx,6EFBE4;'Joy1X'
 006EF463    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF466    call        THashTable.Add
 006EF46B    mov         ecx,14
 006EF470    mov         edx,6EFBFC;'Joy1Y'
 006EF475    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF478    call        THashTable.Add
 006EF47D    mov         ecx,15
 006EF482    mov         edx,6EFC14;'Joy2X'
 006EF487    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF48A    call        THashTable.Add
 006EF48F    mov         ecx,16
 006EF494    mov         edx,6EFC2C;'Joy2Y'
 006EF499    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF49C    call        THashTable.Add
 006EF4A1    mov         ecx,17
 006EF4A6    mov         edx,6EFC44;'Vibration1'
 006EF4AB    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF4AE    call        THashTable.Add
 006EF4B3    mov         ecx,18
 006EF4B8    mov         edx,6EFC68;'Vibration2'
 006EF4BD    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF4C0    call        THashTable.Add
 006EF4C5    mov         ecx,19
 006EF4CA    mov         edx,6EFC8C;'PacketNumber'
 006EF4CF    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF4D2    call        THashTable.Add
 006EF4D7    mov         ecx,1A
 006EF4DC    mov         edx,6EFCB4;'Version'
 006EF4E1    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF4E4    call        THashTable.Add
 006EF4E9    mov         ecx,1E
 006EF4EE    mov         edx,6EFCD0;'Buttons'
 006EF4F3    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF4F6    call        THashTable.Add
 006EF4FB    mov         ecx,1F
 006EF500    mov         edx,6EFCEC;^338:Single
 006EF505    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF508    call        THashTable.Add
 006EF50D    mov         ecx,21
 006EF512    mov         edx,6EFD0C;'Count'
 006EF517    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF51A    call        THashTable.Add
 006EF51F    mov         ecx,42
 006EF524    mov         edx,6EFD24;'RealExists'
 006EF529    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF52C    call        THashTable.Add
 006EF531    mov         ecx,32
 006EF536    mov         edx,6EFD48;'RealUp'
 006EF53B    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF53E    call        THashTable.Add
 006EF543    mov         ecx,33
 006EF548    mov         edx,6EFD64;'RealDown'
 006EF54D    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF550    call        THashTable.Add
 006EF555    mov         ecx,34
 006EF55A    mov         edx,6EFD84;'RealLeft'
 006EF55F    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF562    call        THashTable.Add
 006EF567    mov         ecx,35
 006EF56C    mov         edx,6EFDA4;'RealRight'
 006EF571    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF574    call        THashTable.Add
 006EF579    mov         ecx,32
 006EF57E    mov         edx,6EFDC4;'RealDPadUp'
 006EF583    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF586    call        THashTable.Add
 006EF58B    mov         ecx,33
 006EF590    mov         edx,6EFDE8;'RealDPadDown'
 006EF595    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF598    call        THashTable.Add
 006EF59D    mov         ecx,34
 006EF5A2    mov         edx,6EFE10;'RealDPadLeft'
 006EF5A7    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF5AA    call        THashTable.Add
 006EF5AF    mov         ecx,35
 006EF5B4    mov         edx,6EFE38;'RealDPadRight'
 006EF5B9    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF5BC    call        THashTable.Add
 006EF5C1    mov         ecx,36
 006EF5C6    mov         edx,6EFE60;'RealStart'
 006EF5CB    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF5CE    call        THashTable.Add
 006EF5D3    mov         ecx,37
 006EF5D8    mov         edx,6EFE80;'RealBack'
 006EF5DD    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF5E0    call        THashTable.Add
 006EF5E5    mov         ecx,38
 006EF5EA    mov         edx,6EFEA0;'RealLeftThumb'
 006EF5EF    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF5F2    call        THashTable.Add
 006EF5F7    mov         ecx,39
 006EF5FC    mov         edx,6EFEC8;'RealRightThumb'
 006EF601    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF604    call        THashTable.Add
 006EF609    mov         ecx,3A
 006EF60E    mov         edx,6EFEF4;'RealLeftShoulder'
 006EF613    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF616    call        THashTable.Add
 006EF61B    mov         ecx,3B
 006EF620    mov         edx,6EFF24;'RealRightShoulder'
 006EF625    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF628    call        THashTable.Add
 006EF62D    mov         ecx,3C
 006EF632    mov         edx,6EFF54;'RealExtraButton1'
 006EF637    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF63A    call        THashTable.Add
 006EF63F    mov         ecx,3D
 006EF644    mov         edx,6EFF84;'RealExtraButton2'
 006EF649    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF64C    call        THashTable.Add
 006EF651    mov         ecx,3E
 006EF656    mov         edx,6EFFB4;'RealA'
 006EF65B    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF65E    call        THashTable.Add
 006EF663    mov         ecx,3F
 006EF668    mov         edx,6EFFCC;'RealB'
 006EF66D    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF670    call        THashTable.Add
 006EF675    mov         ecx,40
 006EF67A    mov         edx,6EFFE4;'RealX'
 006EF67F    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF682    call        THashTable.Add
 006EF687    mov         ecx,41
 006EF68C    mov         edx,6EFFFC;'RealY'
 006EF691    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF694    call        THashTable.Add
 006EF699    mov         ecx,43
 006EF69E    mov         edx,6F0014;'RealLeftTrigger'
 006EF6A3    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF6A6    call        THashTable.Add
 006EF6AB    mov         ecx,44
 006EF6B0    mov         edx,6F0040;'RealRightTrigger'
 006EF6B5    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF6B8    call        THashTable.Add
 006EF6BD    mov         ecx,4E
 006EF6C2    mov         edx,6F0070;'RealLeftStick'
 006EF6C7    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF6CA    call        THashTable.Add
 006EF6CF    mov         ecx,4F
 006EF6D4    mov         edx,6F0098;'RealRightStick'
 006EF6D9    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF6DC    call        THashTable.Add
 006EF6E1    mov         ecx,45
 006EF6E6    mov         edx,6F00C4;'RealLeftStickX'
 006EF6EB    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF6EE    call        THashTable.Add
 006EF6F3    mov         ecx,46
 006EF6F8    mov         edx,6F00F0;'RealLeftStickY'
 006EF6FD    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF700    call        THashTable.Add
 006EF705    mov         ecx,47
 006EF70A    mov         edx,6F011C;'RealRightStickX'
 006EF70F    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF712    call        THashTable.Add
 006EF717    mov         ecx,48
 006EF71C    mov         edx,6F0148;'RealRightStickY'
 006EF721    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF724    call        THashTable.Add
 006EF729    mov         ecx,4D
 006EF72E    mov         edx,6F0174;'RealDPad'
 006EF733    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF736    call        THashTable.Add
 006EF73B    mov         ecx,4E
 006EF740    mov         edx,6F0194;'RealJoy1'
 006EF745    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF748    call        THashTable.Add
 006EF74D    mov         ecx,4F
 006EF752    mov         edx,6F01B4;'RealJoy2'
 006EF757    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF75A    call        THashTable.Add
 006EF75F    mov         ecx,45
 006EF764    mov         edx,6F01D4;'RealJoy1X'
 006EF769    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF76C    call        THashTable.Add
 006EF771    mov         ecx,46
 006EF776    mov         edx,6F01F4;'RealJoy1Y'
 006EF77B    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF77E    call        THashTable.Add
 006EF783    mov         ecx,47
 006EF788    mov         edx,6F0214;'RealJoy2X'
 006EF78D    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF790    call        THashTable.Add
 006EF795    mov         ecx,48
 006EF79A    mov         edx,6F0234;'RealJoy2Y'
 006EF79F    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF7A2    call        THashTable.Add
 006EF7A7    mov         ecx,49
 006EF7AC    mov         edx,6F0254;'RealVibration1'
 006EF7B1    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF7B4    call        THashTable.Add
 006EF7B9    mov         ecx,4A
 006EF7BE    mov         edx,6F0280;'RealVibration2'
 006EF7C3    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF7C6    call        THashTable.Add
 006EF7CB    mov         ecx,4B
 006EF7D0    mov         edx,6F02AC;'RealPacketNumber'
 006EF7D5    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF7D8    call        THashTable.Add
 006EF7DD    mov         ecx,4C
 006EF7E2    mov         edx,6F02DC;'RealVersion'
 006EF7E7    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF7EA    call        THashTable.Add
 006EF7EF    mov         ecx,50
 006EF7F4    mov         edx,6F0300;'RealButtons'
 006EF7F9    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF7FC    call        THashTable.Add
 006EF801    mov         ecx,51
 006EF806    mov         edx,6F0324;'RealDisabled'
 006EF80B    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF80E    call        THashTable.Add
 006EF813    mov         ecx,53
 006EF818    mov         edx,6F034C;'RealCount'
 006EF81D    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006EF820    call        THashTable.Add
 006EF825    pop         ebx
 006EF826    ret
*}
end;

//006F0360
procedure TModuleXInput.ClearRead;
begin
{*
 006F0360    call        TPieModule.ClearRead
 006F0365    ret
*}
end;

//006F0368
constructor TModuleXInput.Create;
begin
{*
 006F0368    push        ebx
 006F0369    push        esi
 006F036A    test        dl,dl
>006F036C    je          006F0376
 006F036E    add         esp,0FFFFFFF0
 006F0371    call        @ClassCreate
 006F0376    mov         ebx,edx
 006F0378    mov         esi,eax
 006F037A    push        6F03BC;'Xbox360Controller'
 006F037F    push        6F03EC;'Xbox360'
 006F0384    push        0
 006F0386    push        0
 006F0388    mov         ecx,6F0408;'XInput'
 006F038D    xor         edx,edx
 006F038F    mov         eax,esi
 006F0391    call        005E4830
 006F0396    mov         eax,esi
 006F0398    test        bl,bl
>006F039A    je          006F03AB
 006F039C    call        @AfterConstruction
 006F03A1    pop         dword ptr fs:[0]
 006F03A8    add         esp,0C
 006F03AB    mov         eax,esi
 006F03AD    pop         esi
 006F03AE    pop         ebx
 006F03AF    ret
*}
end;

//006F0418
function TModuleXInput.CreateValue(Identifier:string):TExpression;
begin
{*
 006F0418    push        ebp
 006F0419    mov         ebp,esp
 006F041B    push        ecx
 006F041C    push        ebx
 006F041D    mov         dword ptr [ebp-4],edx
 006F0420    mov         ebx,eax
 006F0422    mov         eax,dword ptr [ebp-4]
 006F0425    call        @UStrAddRef
 006F042A    xor         eax,eax
 006F042C    push        ebp
 006F042D    push        6F045C
 006F0432    push        dword ptr fs:[eax]
 006F0435    mov         dword ptr fs:[eax],esp
 006F0438    mov         byte ptr [ebx+24],1;TModuleXInput.Used:Boolean
 006F043C    mov         eax,dword ptr [ebp-4]
 006F043F    call        006EE610
 006F0444    mov         ebx,eax
 006F0446    xor         eax,eax
 006F0448    pop         edx
 006F0449    pop         ecx
 006F044A    pop         ecx
 006F044B    mov         dword ptr fs:[eax],edx
 006F044E    push        6F0463
 006F0453    lea         eax,[ebp-4]
 006F0456    call        @UStrClr
 006F045B    ret
>006F045C    jmp         @HandleFinally
>006F0461    jmp         006F0453
 006F0463    mov         eax,ebx
 006F0465    pop         ebx
 006F0466    pop         ecx
 006F0467    pop         ebp
 006F0468    ret
*}
end;

//006F046C
function TModuleXInput.GetDefaultFormat(field:string):TGuiFormat;
begin
{*
 006F046C    push        ebp
 006F046D    mov         ebp,esp
 006F046F    push        ecx
 006F0470    push        ebx
 006F0471    mov         dword ptr [ebp-4],edx
 006F0474    mov         ebx,eax
 006F0476    mov         eax,dword ptr [ebp-4]
 006F0479    call        @UStrAddRef
 006F047E    xor         eax,eax
 006F0480    push        ebp
 006F0481    push        6F04E7
 006F0486    push        dword ptr fs:[eax]
 006F0489    mov         dword ptr fs:[eax],esp
 006F048C    mov         edx,dword ptr [ebp-4]
 006F048F    mov         eax,dword ptr [ebx+1C];TModuleXInput.Fields:THashTable
 006F0492    call        THashTable.Get
 006F0497    mov         ecx,eax
 006F0499    mov         eax,ecx
 006F049B    mov         ecx,32
 006F04A0    cdq
 006F04A1    idiv        eax,ecx
 006F04A3    cmp         edx,17
>006F04A6    jge         006F04B4
 006F04A8    sub         edx,13
>006F04AB    jb          006F04C7
 006F04AD    sub         edx,4
>006F04B0    jb          006F04CB
>006F04B2    jmp         006F04CF
 006F04B4    add         edx,0FFFFFFE9
 006F04B7    sub         edx,2
>006F04BA    jb          006F04C7
 006F04BC    add         edx,0FFFFFFFE
 006F04BF    sub         edx,3
>006F04C2    jb          006F04CB
 006F04C4    dec         edx
>006F04C5    jne         006F04CF
 006F04C7    xor         ebx,ebx
>006F04C9    jmp         006F04D1
 006F04CB    mov         bl,6
>006F04CD    jmp         006F04D1
 006F04CF    mov         bl,9
 006F04D1    xor         eax,eax
 006F04D3    pop         edx
 006F04D4    pop         ecx
 006F04D5    pop         ecx
 006F04D6    mov         dword ptr fs:[eax],edx
 006F04D9    push        6F04EE
 006F04DE    lea         eax,[ebp-4]
 006F04E1    call        @UStrClr
 006F04E6    ret
>006F04E7    jmp         @HandleFinally
>006F04EC    jmp         006F04DE
 006F04EE    mov         eax,ebx
 006F04F0    pop         ebx
 006F04F1    pop         ecx
 006F04F2    pop         ebp
 006F04F3    ret
*}
end;

//006F04F4
function TModuleXInput.GetFields:TStringList;
begin
{*
 006F04F4    push        ebp
 006F04F5    mov         ebp,esp
 006F04F7    push        0
 006F04F9    push        ebx
 006F04FA    push        esi
 006F04FB    push        edi
 006F04FC    mov         esi,eax
 006F04FE    xor         eax,eax
 006F0500    push        ebp
 006F0501    push        6F055E
 006F0506    push        dword ptr fs:[eax]
 006F0509    mov         dword ptr fs:[eax],esp
 006F050C    mov         dl,1
 006F050E    mov         eax,[0043C7BC];TStringList
 006F0513    call        TStringList.Create;TStringList.Create
 006F0518    mov         edi,eax
 006F051A    mov         dl,1
 006F051C    mov         eax,edi
 006F051E    call        TStringList.SetSorted
 006F0523    xor         ebx,ebx
 006F0525    lea         ecx,[ebp-4]
 006F0528    mov         edx,ebx
 006F052A    mov         eax,dword ptr [esi+1C];TModuleXInput.Fields:THashTable
 006F052D    call        THashTable.Get
 006F0532    cmp         dword ptr [ebp-4],0
>006F0536    je          006F0542
 006F0538    mov         edx,dword ptr [ebp-4]
 006F053B    mov         eax,edi
 006F053D    mov         ecx,dword ptr [eax]
 006F053F    call        dword ptr [ecx+38];TStringList.Add
 006F0542    inc         ebx
 006F0543    cmp         ebx,23
>006F0546    jne         006F0525
 006F0548    xor         eax,eax
 006F054A    pop         edx
 006F054B    pop         ecx
 006F054C    pop         ecx
 006F054D    mov         dword ptr fs:[eax],edx
 006F0550    push        6F0565
 006F0555    lea         eax,[ebp-4]
 006F0558    call        @UStrClr
 006F055D    ret
>006F055E    jmp         @HandleFinally
>006F0563    jmp         006F0555
 006F0565    mov         eax,edi
 006F0567    pop         edi
 006F0568    pop         esi
 006F0569    pop         ebx
 006F056A    pop         ecx
 006F056B    pop         ebp
 006F056C    ret
*}
end;

//006F0570
function TModuleXInput.GetGoodFields:TStringList;
begin
{*
 006F0570    push        ebx
 006F0571    mov         dl,1
 006F0573    mov         eax,[0043C7BC];TStringList
 006F0578    call        TStringList.Create;TStringList.Create
 006F057D    mov         ebx,eax
 006F057F    mov         edx,6F0680;'A'
 006F0584    mov         eax,ebx
 006F0586    mov         ecx,dword ptr [eax]
 006F0588    call        dword ptr [ecx+38];TStringList.Add
 006F058B    mov         edx,6F0690;'B'
 006F0590    mov         eax,ebx
 006F0592    mov         ecx,dword ptr [eax]
 006F0594    call        dword ptr [ecx+38];TStringList.Add
 006F0597    mov         edx,6F06A0;'X'
 006F059C    mov         eax,ebx
 006F059E    mov         ecx,dword ptr [eax]
 006F05A0    call        dword ptr [ecx+38];TStringList.Add
 006F05A3    mov         edx,6F06B0;'Y'
 006F05A8    mov         eax,ebx
 006F05AA    mov         ecx,dword ptr [eax]
 006F05AC    call        dword ptr [ecx+38];TStringList.Add
 006F05AF    mov         edx,6F06C0;'Start'
 006F05B4    mov         eax,ebx
 006F05B6    mov         ecx,dword ptr [eax]
 006F05B8    call        dword ptr [ecx+38];TStringList.Add
 006F05BB    mov         edx,6F06D8;'Back'
 006F05C0    mov         eax,ebx
 006F05C2    mov         ecx,dword ptr [eax]
 006F05C4    call        dword ptr [ecx+38];TStringList.Add
 006F05C7    mov         edx,6F06F0;'LeftShoulder'
 006F05CC    mov         eax,ebx
 006F05CE    mov         ecx,dword ptr [eax]
 006F05D0    call        dword ptr [ecx+38];TStringList.Add
 006F05D3    mov         edx,6F0718;'RightShoulder'
 006F05D8    mov         eax,ebx
 006F05DA    mov         ecx,dword ptr [eax]
 006F05DC    call        dword ptr [ecx+38];TStringList.Add
 006F05DF    mov         edx,6F0740;'LeftTrigger'
 006F05E4    mov         eax,ebx
 006F05E6    mov         ecx,dword ptr [eax]
 006F05E8    call        dword ptr [ecx+38];TStringList.Add
 006F05EB    mov         edx,6F0764;'RightTrigger'
 006F05F0    mov         eax,ebx
 006F05F2    mov         ecx,dword ptr [eax]
 006F05F4    call        dword ptr [ecx+38];TStringList.Add
 006F05F7    mov         edx,6F078C;'LeftThumb'
 006F05FC    mov         eax,ebx
 006F05FE    mov         ecx,dword ptr [eax]
 006F0600    call        dword ptr [ecx+38];TStringList.Add
 006F0603    mov         edx,6F07AC;'RightThumb'
 006F0608    mov         eax,ebx
 006F060A    mov         ecx,dword ptr [eax]
 006F060C    call        dword ptr [ecx+38];TStringList.Add
 006F060F    mov         edx,6F07D0;'Up'
 006F0614    mov         eax,ebx
 006F0616    mov         ecx,dword ptr [eax]
 006F0618    call        dword ptr [ecx+38];TStringList.Add
 006F061B    mov         edx,6F07E4;'Down'
 006F0620    mov         eax,ebx
 006F0622    mov         ecx,dword ptr [eax]
 006F0624    call        dword ptr [ecx+38];TStringList.Add
 006F0627    mov         edx,6F07FC;'Left'
 006F062C    mov         eax,ebx
 006F062E    mov         ecx,dword ptr [eax]
 006F0630    call        dword ptr [ecx+38];TStringList.Add
 006F0633    mov         edx,6F0814;'Right'
 006F0638    mov         eax,ebx
 006F063A    mov         ecx,dword ptr [eax]
 006F063C    call        dword ptr [ecx+38];TStringList.Add
 006F063F    mov         edx,6F082C;'LeftStickX'
 006F0644    mov         eax,ebx
 006F0646    mov         ecx,dword ptr [eax]
 006F0648    call        dword ptr [ecx+38];TStringList.Add
 006F064B    mov         edx,6F0850;'LeftStickY'
 006F0650    mov         eax,ebx
 006F0652    mov         ecx,dword ptr [eax]
 006F0654    call        dword ptr [ecx+38];TStringList.Add
 006F0657    mov         edx,6F0874;'RightStickX'
 006F065C    mov         eax,ebx
 006F065E    mov         ecx,dword ptr [eax]
 006F0660    call        dword ptr [ecx+38];TStringList.Add
 006F0663    mov         edx,6F0898;'RightStickY'
 006F0668    mov         eax,ebx
 006F066A    mov         ecx,dword ptr [eax]
 006F066C    call        dword ptr [ecx+38];TStringList.Add
 006F066F    mov         eax,ebx
 006F0671    pop         ebx
 006F0672    ret
*}
end;

//006F08B0
procedure TModuleXInput.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 006F08B0    push        ebp
 006F08B1    mov         ebp,esp
 006F08B3    mov         byte ptr [edx],1
 006F08B6    mov         dword ptr [ecx],1
 006F08BC    mov         eax,dword ptr [ebp+8]
 006F08BF    mov         dword ptr [eax],4
 006F08C5    pop         ebp
 006F08C6    ret         4
*}
end;

//006F08CC
function TModuleXInput.IsIdentifier(s:string):Boolean;
begin
{*
 006F08CC    push        ebp
 006F08CD    mov         ebp,esp
 006F08CF    push        ecx
 006F08D0    push        ebx
 006F08D1    mov         dword ptr [ebp-4],edx
 006F08D4    mov         eax,dword ptr [ebp-4]
 006F08D7    call        @UStrAddRef
 006F08DC    xor         eax,eax
 006F08DE    push        ebp
 006F08DF    push        6F090A
 006F08E4    push        dword ptr fs:[eax]
 006F08E7    mov         dword ptr fs:[eax],esp
 006F08EA    mov         eax,dword ptr [ebp-4]
 006F08ED    call        006EF0E8
 006F08F2    mov         ebx,eax
 006F08F4    xor         eax,eax
 006F08F6    pop         edx
 006F08F7    pop         ecx
 006F08F8    pop         ecx
 006F08F9    mov         dword ptr fs:[eax],edx
 006F08FC    push        6F0911
 006F0901    lea         eax,[ebp-4]
 006F0904    call        @UStrClr
 006F0909    ret
>006F090A    jmp         @HandleFinally
>006F090F    jmp         006F0901
 006F0911    mov         eax,ebx
 006F0913    pop         ebx
 006F0914    pop         ecx
 006F0915    pop         ebp
 006F0916    ret
*}
end;

//006F0918
procedure TModuleXInput.MonitorFrame;
begin
{*
 006F0918    push        ebp
 006F0919    mov         ebp,esp
 006F091B    mov         ecx,0B
 006F0920    push        0
 006F0922    push        0
 006F0924    dec         ecx
>006F0925    jne         006F0920
 006F0927    push        ebx
 006F0928    push        esi
 006F0929    push        edi
 006F092A    mov         esi,eax
 006F092C    xor         eax,eax
 006F092E    push        ebp
 006F092F    push        6F0C2A
 006F0934    push        dword ptr fs:[eax]
 006F0937    mov         dword ptr fs:[eax],esp
 006F093A    cmp         byte ptr [esi+28],0;TModuleXInput.Monitoring:Boolean
>006F093E    je          006F0C07
 006F0944    mov         eax,esi
 006F0946    mov         edx,dword ptr [eax]
 006F0948    call        dword ptr [edx+3C];TModuleXInput.Read
 006F094B    test        al,al
>006F094D    je          006F0C07
 006F0953    xor         eax,eax
 006F0955    mov         dword ptr [ebp-8],eax
 006F0958    mov         edi,822770;gvar_00822770
 006F095D    mov         dword ptr [ebp-0C],8227B0;gvar_008227B0
 006F0964    mov         ebx,edi
 006F0966    mov         eax,dword ptr [ebp-0C]
 006F0969    cmp         byte ptr [eax],0
>006F096C    je          006F0BED
 006F0972    cmp         dword ptr [ebp-8],0
>006F0976    jne         006F0987
 006F0978    lea         eax,[ebp-4]
 006F097B    mov         edx,6F0C44;'XInput.'
 006F0980    call        @UStrLAsg
>006F0985    jmp         006F09AD
 006F0987    push        6F0C60;'XInput'
 006F098C    lea         edx,[ebp-10]
 006F098F    mov         eax,dword ptr [ebp-8]
 006F0992    inc         eax
 006F0993    call        IntToStr
 006F0998    push        dword ptr [ebp-10]
 006F099B    push        6F0C7C;'.'
 006F09A0    lea         eax,[ebp-4]
 006F09A3    mov         edx,3
 006F09A8    call        @UStrCatN
 006F09AD    cmp         byte ptr [ebx+6],1E
>006F09B1    jbe         006F09CD
 006F09B3    lea         eax,[ebp-14]
 006F09B6    mov         ecx,6F0C8C;'LeftTrigger'
 006F09BB    mov         edx,dword ptr [ebp-4]
 006F09BE    call        @UStrCat3
 006F09C3    mov         edx,dword ptr [ebp-14]
 006F09C6    mov         eax,esi
 006F09C8    call        005E4F20
 006F09CD    cmp         byte ptr [ebx+7],1E
>006F09D1    jbe         006F09ED
 006F09D3    lea         eax,[ebp-18]
 006F09D6    mov         ecx,6F0CB0;'RightTrigger'
 006F09DB    mov         edx,dword ptr [ebp-4]
 006F09DE    call        @UStrCat3
 006F09E3    mov         edx,dword ptr [ebp-18]
 006F09E6    mov         eax,esi
 006F09E8    call        005E4F20
 006F09ED    test        byte ptr [ebx+4],1
>006F09F1    je          006F0A0D
 006F09F3    lea         eax,[ebp-1C]
 006F09F6    mov         ecx,6F0CD8;'Up'
 006F09FB    mov         edx,dword ptr [ebp-4]
 006F09FE    call        @UStrCat3
 006F0A03    mov         edx,dword ptr [ebp-1C]
 006F0A06    mov         eax,esi
 006F0A08    call        005E4F20
 006F0A0D    test        byte ptr [ebx+4],2
>006F0A11    je          006F0A2D
 006F0A13    lea         eax,[ebp-20]
 006F0A16    mov         ecx,6F0CEC;'Down'
 006F0A1B    mov         edx,dword ptr [ebp-4]
 006F0A1E    call        @UStrCat3
 006F0A23    mov         edx,dword ptr [ebp-20]
 006F0A26    mov         eax,esi
 006F0A28    call        005E4F20
 006F0A2D    test        byte ptr [ebx+4],4
>006F0A31    je          006F0A4D
 006F0A33    lea         eax,[ebp-24]
 006F0A36    mov         ecx,6F0D04;'Left'
 006F0A3B    mov         edx,dword ptr [ebp-4]
 006F0A3E    call        @UStrCat3
 006F0A43    mov         edx,dword ptr [ebp-24]
 006F0A46    mov         eax,esi
 006F0A48    call        005E4F20
 006F0A4D    test        byte ptr [ebx+4],8
>006F0A51    je          006F0A6D
 006F0A53    lea         eax,[ebp-28]
 006F0A56    mov         ecx,6F0D1C;'Right'
 006F0A5B    mov         edx,dword ptr [ebp-4]
 006F0A5E    call        @UStrCat3
 006F0A63    mov         edx,dword ptr [ebp-28]
 006F0A66    mov         eax,esi
 006F0A68    call        005E4F20
 006F0A6D    test        byte ptr [ebx+4],10
>006F0A71    je          006F0A8D
 006F0A73    lea         eax,[ebp-2C]
 006F0A76    mov         ecx,6F0D34;'Start'
 006F0A7B    mov         edx,dword ptr [ebp-4]
 006F0A7E    call        @UStrCat3
 006F0A83    mov         edx,dword ptr [ebp-2C]
 006F0A86    mov         eax,esi
 006F0A88    call        005E4F20
 006F0A8D    test        byte ptr [ebx+4],20
>006F0A91    je          006F0AAD
 006F0A93    lea         eax,[ebp-30]
 006F0A96    mov         ecx,6F0D4C;'Back'
 006F0A9B    mov         edx,dword ptr [ebp-4]
 006F0A9E    call        @UStrCat3
 006F0AA3    mov         edx,dword ptr [ebp-30]
 006F0AA6    mov         eax,esi
 006F0AA8    call        005E4F20
 006F0AAD    test        byte ptr [ebx+4],40
>006F0AB1    je          006F0ACD
 006F0AB3    lea         eax,[ebp-34]
 006F0AB6    mov         ecx,6F0D64;'LeftThumb'
 006F0ABB    mov         edx,dword ptr [ebp-4]
 006F0ABE    call        @UStrCat3
 006F0AC3    mov         edx,dword ptr [ebp-34]
 006F0AC6    mov         eax,esi
 006F0AC8    call        005E4F20
 006F0ACD    test        byte ptr [ebx+4],80
>006F0AD1    je          006F0AED
 006F0AD3    lea         eax,[ebp-38]
 006F0AD6    mov         ecx,6F0D84;'RightThumb'
 006F0ADB    mov         edx,dword ptr [ebp-4]
 006F0ADE    call        @UStrCat3
 006F0AE3    mov         edx,dword ptr [ebp-38]
 006F0AE6    mov         eax,esi
 006F0AE8    call        005E4F20
 006F0AED    test        byte ptr [ebx+5],1
>006F0AF1    je          006F0B0D
 006F0AF3    lea         eax,[ebp-3C]
 006F0AF6    mov         ecx,6F0DA8;'LeftShoulder'
 006F0AFB    mov         edx,dword ptr [ebp-4]
 006F0AFE    call        @UStrCat3
 006F0B03    mov         edx,dword ptr [ebp-3C]
 006F0B06    mov         eax,esi
 006F0B08    call        005E4F20
 006F0B0D    test        byte ptr [ebx+5],2
>006F0B11    je          006F0B2D
 006F0B13    lea         eax,[ebp-40]
 006F0B16    mov         ecx,6F0DD0;'RightShoulder'
 006F0B1B    mov         edx,dword ptr [ebp-4]
 006F0B1E    call        @UStrCat3
 006F0B23    mov         edx,dword ptr [ebp-40]
 006F0B26    mov         eax,esi
 006F0B28    call        005E4F20
 006F0B2D    test        byte ptr [ebx+5],10
>006F0B31    je          006F0B4D
 006F0B33    lea         eax,[ebp-44]
 006F0B36    mov         ecx,6F0DF8;'A'
 006F0B3B    mov         edx,dword ptr [ebp-4]
 006F0B3E    call        @UStrCat3
 006F0B43    mov         edx,dword ptr [ebp-44]
 006F0B46    mov         eax,esi
 006F0B48    call        005E4F20
 006F0B4D    test        byte ptr [ebx+5],20
>006F0B51    je          006F0B6D
 006F0B53    lea         eax,[ebp-48]
 006F0B56    mov         ecx,6F0E08;'B'
 006F0B5B    mov         edx,dword ptr [ebp-4]
 006F0B5E    call        @UStrCat3
 006F0B63    mov         edx,dword ptr [ebp-48]
 006F0B66    mov         eax,esi
 006F0B68    call        005E4F20
 006F0B6D    test        byte ptr [ebx+5],40
>006F0B71    je          006F0B8D
 006F0B73    lea         eax,[ebp-4C]
 006F0B76    mov         ecx,6F0E18;'X'
 006F0B7B    mov         edx,dword ptr [ebp-4]
 006F0B7E    call        @UStrCat3
 006F0B83    mov         edx,dword ptr [ebp-4C]
 006F0B86    mov         eax,esi
 006F0B88    call        005E4F20
 006F0B8D    test        byte ptr [ebx+5],80
>006F0B91    je          006F0BAD
 006F0B93    lea         eax,[ebp-50]
 006F0B96    mov         ecx,6F0E28;'Y'
 006F0B9B    mov         edx,dword ptr [ebp-4]
 006F0B9E    call        @UStrCat3
 006F0BA3    mov         edx,dword ptr [ebp-50]
 006F0BA6    mov         eax,esi
 006F0BA8    call        005E4F20
 006F0BAD    test        byte ptr [ebx+5],4
>006F0BB1    je          006F0BCD
 006F0BB3    lea         eax,[ebp-54]
 006F0BB6    mov         ecx,6F0E38;'ExtraButton1'
 006F0BBB    mov         edx,dword ptr [ebp-4]
 006F0BBE    call        @UStrCat3
 006F0BC3    mov         edx,dword ptr [ebp-54]
 006F0BC6    mov         eax,esi
 006F0BC8    call        005E4F20
 006F0BCD    test        byte ptr [ebx+5],8
>006F0BD1    je          006F0BED
 006F0BD3    lea         eax,[ebp-58]
 006F0BD6    mov         ecx,6F0E60;'ExtraButton2'
 006F0BDB    mov         edx,dword ptr [ebp-4]
 006F0BDE    call        @UStrCat3
 006F0BE3    mov         edx,dword ptr [ebp-58]
 006F0BE6    mov         eax,esi
 006F0BE8    call        005E4F20
 006F0BED    inc         dword ptr [ebp-8]
 006F0BF0    inc         dword ptr [ebp-0C]
 006F0BF3    add         edi,10
 006F0BF6    cmp         dword ptr [ebp-8],4
>006F0BFA    jne         006F0964
 006F0C00    mov         eax,esi
 006F0C02    call        005E509C
 006F0C07    xor         eax,eax
 006F0C09    pop         edx
 006F0C0A    pop         ecx
 006F0C0B    pop         ecx
 006F0C0C    mov         dword ptr fs:[eax],edx
 006F0C0F    push        6F0C31
 006F0C14    lea         eax,[ebp-58]
 006F0C17    mov         edx,13
 006F0C1C    call        @UStrArrayClr
 006F0C21    lea         eax,[ebp-4]
 006F0C24    call        @UStrClr
 006F0C29    ret
>006F0C2A    jmp         @HandleFinally
>006F0C2F    jmp         006F0C14
 006F0C31    pop         edi
 006F0C32    pop         esi
 006F0C33    pop         ebx
 006F0C34    mov         esp,ebp
 006F0C36    pop         ebp
 006F0C37    ret
*}
end;

//006F0E7C
procedure TModuleXInput.PrepareForMonitoring;
begin
{*
 006F0E7C    call        TPieModule.PrepareForMonitoring
 006F0E81    mov         byte ptr ds:[82276C],1;gvar_0082276C
 006F0E88    ret
*}
end;

//006F0E8C
procedure TModuleXInput.Read;
begin
{*
 006F0E8C    call        006EF040
 006F0E91    ret
*}
end;

//006F0E94
procedure TModuleXInput.StartCompiletime;
begin
{*
 006F0E94    call        TPieModule.StartCompiletime
 006F0E99    call        006EF004
 006F0E9E    ret
*}
end;

//006F0EA0
procedure TModuleXInput.StartRuntime;
begin
{*
 006F0EA0    call        TPieModule.StartRuntime
 006F0EA5    call        006EF010
 006F0EAA    ret
*}
end;

//006F0EAC
procedure TModuleXInput.StopCompiletime;
begin
{*
 006F0EAC    push        ebx
 006F0EAD    mov         ebx,eax
 006F0EAF    call        006EF00C
 006F0EB4    mov         eax,ebx
 006F0EB6    call        TPieModule.StopCompiletime
 006F0EBB    pop         ebx
 006F0EBC    ret
*}
end;

//006F0EC0
procedure TModuleXInput.StopRuntime;
begin
{*
 006F0EC0    push        ebx
 006F0EC1    mov         ebx,eax
 006F0EC3    call        006EF024
 006F0EC8    mov         eax,ebx
 006F0ECA    call        TPieModule.StopRuntime
 006F0ECF    pop         ebx
 006F0ED0    ret
*}
end;

Initialization
//00782C88
{*
 00782C88    sub         dword ptr ds:[8227C8],1
>00782C8F    jae         00782CAC
 00782C91    mov         dl,1
 00782C93    mov         eax,[006EDFBC];TModuleXInput
 00782C98    call        TModuleXInput.Create;TModuleXInput.Create
 00782C9D    mov         [008227C4],eax;gvar_008227C4:TModuleXInput
 00782CA2    mov         eax,[008227C4];gvar_008227C4:TModuleXInput
 00782CA7    call        005E31AC
 00782CAC    ret
*}
Finalization
end.