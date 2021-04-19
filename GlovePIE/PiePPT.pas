//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PiePPT;

interface

uses
  SysUtils, Classes;

type
  TPPTValue = class(TObjectValue)
  published
    function GetUnits:TUnits;//006DDAFC
    //procedure GetString(?:?);//006DDAD4
    procedure FillClone(c:TExpression);//006DDA44
    function Module:TObject;//006DDE60
    function GetPerUnits2:TUnits;//006DDAC4
    function GetPerUnits1:TUnits;//006DDAA8
    procedure SetValue(NewValue:Double);//006DDE68
    function CanSet:Boolean;//006DDA30
    function GetDataType:TDataType;//006DDA6C
    procedure CreateClone;//006DDA34
    procedure GetValue;//006DDB20
    //procedure ToString(?:?);//006DDE80
  public
    ComPort:Integer;//f20
    Item:Integer;//f24
    //procedure ToString(?:?); virtual;//006DDE80
    procedure GetValue; virtual;//v2C//006DDB20
    //procedure GetString(?:?); virtual;//v38//006DDAD4
    function GetDataType:TDataType; virtual;//v44//006DDA6C
    function GetUnits:TUnits; virtual;//v48//006DDAFC
    function GetPerUnits1:TUnits; virtual;//v4C//006DDAA8
    function GetPerUnits2:TUnits; virtual;//v50//006DDAC4
    procedure SetValue(NewValue:Double); virtual;//v58//006DDE68
    function CanSet:Boolean; virtual;//v68//006DDA30
    procedure CreateClone; virtual;//v80//006DDA34
    procedure FillClone(c:TExpression); virtual;//v84//006DDA44
    function Module:TObject; virtual;//v98//006DDE60
  end;
  TModulePPT = class(TPieModule)
  published
    function GetDefaultFormat(field:string):TGuiFormat;//006DEAEC
    function IsIdentifier(s:string):Boolean;//006DEB74
    procedure GetGoodFields;//006DEB50
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//006DEB58
    procedure PrepareForGUI;//006DEBC0
    procedure StopMonitoring;//006DEC00
    procedure StartMonitoring;//006DEBDC
    procedure PrepareForMonitoring;//006DEBC4
    procedure Read;//006DEBC8
    procedure StartCompiletime;//006DEBD0
    procedure StopCompiletime;//006DEBEC
    procedure StartRuntime;//006DEBE0
    procedure StopRuntime;//006DEC04
    function CreateValue(Identifier:string):TExpression;//006DEA98
    procedure ClearRead;//006DEA38
    constructor Create;//006DEA40
    procedure AddFields;//006DE3DC
  public
    function IsIdentifier(s:string):Boolean; virtual;//v10//006DEB74
    function CreateValue(Identifier:string):TExpression; virtual;//v14//006DEA98
    procedure GetGoodFields; virtual;//v1C//006DEB50
    procedure AddFields; virtual;//v24//006DE3DC
    procedure StartCompiletime; virtual;//v28//006DEBD0
    procedure StopCompiletime; virtual;//v2C//006DEBEC
    procedure StartRuntime; virtual;//v30//006DEBE0
    procedure StopRuntime; virtual;//v34//006DEC04
    procedure ClearRead; virtual;//v38//006DEA38
    procedure Read; virtual;//v3C//006DEBC8
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//006DEB58
    function GetDefaultFormat(field:string):TGuiFormat; virtual;//v44//006DEAEC
    procedure PrepareForGUI; virtual;//v50//006DEBC0
    procedure PrepareForMonitoring; virtual;//v5C//006DEBC4
    procedure StartMonitoring; virtual;//v60//006DEBDC
    procedure StopMonitoring; virtual;//v64//006DEC00
  end;
    //function PPT_Connect:?;//006DCFF8
    PPT_Disconnect;//006DD000
    //function PPT_GetData:?;//006DD008
    //function sub_006DD8B0(?:string):?;//006DD8B0
    procedure sub_006DDF98;//006DDF98
    procedure sub_006DDFAC;//006DDFAC
    procedure sub_006DDFB0;//006DDFB0
    procedure sub_006DE0D4;//006DE0D4
    //function sub_006DE0F0:?;//006DE0F0
    //function sub_006DE1A0(?:UnicodeString):?;//006DE1A0
    //procedure sub_006DE1F4(?:Integer; ?:?);//006DE1F4
    //function sub_006DE210:?;//006DE210
    //function sub_006DE2FC(?:string):?;//006DE2FC

implementation

//006DCFF8
{*function ppt.PPT_Connect:?;
begin
 006DCFF8    jmp         dword ptr ds:[826928]
end;*}

//006DD008
{*function ppt.PPT_GetData:?;
begin
 006DD008    jmp         dword ptr ds:[826920]
end;*}

//006DD8B0
{*function sub_006DD8B0(?:string):?;
begin
 006DD8B0    push        ebp
 006DD8B1    mov         ebp,esp
 006DD8B3    add         esp,0FFFFFFF4
 006DD8B6    push        ebx
 006DD8B7    push        esi
 006DD8B8    push        edi
 006DD8B9    xor         edx,edx
 006DD8BB    mov         dword ptr [ebp-8],edx
 006DD8BE    mov         dword ptr [ebp-4],eax
 006DD8C1    mov         eax,dword ptr [ebp-4]
 006DD8C4    call        @UStrAddRef
 006DD8C9    xor         eax,eax
 006DD8CB    push        ebp
 006DD8CC    push        6DD9E5
 006DD8D1    push        dword ptr fs:[eax]
 006DD8D4    mov         dword ptr fs:[eax],esp
 006DD8D7    xor         esi,esi
 006DD8D9    lea         eax,[ebp-8]
 006DD8DC    mov         edx,dword ptr [ebp-4]
 006DD8DF    call        @UStrLAsg
 006DD8E4    lea         eax,[ebp-8]
 006DD8E7    mov         edx,6DDA04;'com'
 006DD8EC    call        004F9BD0
 006DD8F1    test        al,al
>006DD8F3    je          006DD91E
 006DD8F5    lea         eax,[ebp-8]
 006DD8F8    call        004F9D00
 006DD8FD    mov         ebx,eax
 006DD8FF    test        ebx,ebx
>006DD901    jl          006DD9CA
 006DD907    lea         eax,[ebp-8]
 006DD90A    mov         edx,6DDA18;'.'
 006DD90F    call        004F9BD0
 006DD914    test        al,al
>006DD916    je          006DD9CA
>006DD91C    jmp         006DD920
 006DD91E    xor         ebx,ebx
 006DD920    lea         eax,[ebp-8]
 006DD923    mov         edx,6DDA28;'PPT'
 006DD928    call        004F9BD0
 006DD92D    test        al,al
>006DD92F    je          006DD9CA
 006DD935    lea         eax,[ebp-8]
 006DD938    call        004F9D00
 006DD93D    mov         edi,eax
 006DD93F    cmp         edi,20
>006DD942    jg          006DD9CA
 006DD948    lea         eax,[ebp-8]
 006DD94B    mov         edx,6DDA18;'.'
 006DD950    call        004F9BD0
 006DD955    test        al,al
>006DD957    je          006DD9CA
 006DD959    lea         eax,[ebp-8]
 006DD95C    mov         edx,6DDA04;'com'
 006DD961    call        004F9BD0
 006DD966    test        al,al
>006DD968    je          006DD985
 006DD96A    lea         eax,[ebp-8]
 006DD96D    call        004F9D00
 006DD972    mov         ebx,eax
 006DD974    lea         eax,[ebp-8]
 006DD977    mov         edx,6DDA18;'.'
 006DD97C    call        004F9BD0
 006DD981    test        al,al
>006DD983    je          006DD9CA
 006DD985    test        ebx,ebx
>006DD987    jl          006DD9CA
 006DD989    mov         eax,dword ptr [ebp-8]
 006DD98C    call        006DE1A0
 006DD991    mov         dword ptr [ebp-0C],eax
 006DD994    cmp         dword ptr [ebp-0C],0
>006DD998    jl          006DD9CA
 006DD99A    mov         dl,1
 006DD99C    mov         eax,[006DD010];TPPTValue
 006DD9A1    call        TObject.Create;TPPTValue.Create
 006DD9A6    mov         esi,eax
 006DD9A8    mov         eax,dword ptr [ebp-0C]
 006DD9AB    mov         dword ptr [esi+24],eax;TPPTValue.Item:Integer
 006DD9AE    test        edi,edi
>006DD9B0    jg          006DD9B7
 006DD9B2    mov         edi,1
 006DD9B7    mov         dword ptr [esi+18],edi;TPPTValue...........................................................
 006DD9BA    mov         dword ptr [esi+20],ebx;TPPTValue.ComPort:Integer
 006DD9BD    mov         dword ptr ds:[78C2D0],ebx;gvar_0078C2D0:Single
 006DD9C3    mov         byte ptr ds:[821514],1;gvar_00821514
 006DD9CA    xor         eax,eax
 006DD9CC    pop         edx
 006DD9CD    pop         ecx
 006DD9CE    pop         ecx
 006DD9CF    mov         dword ptr fs:[eax],edx
 006DD9D2    push        6DD9EC
 006DD9D7    lea         eax,[ebp-8]
 006DD9DA    mov         edx,2
 006DD9DF    call        @UStrArrayClr
 006DD9E4    ret
>006DD9E5    jmp         @HandleFinally
>006DD9EA    jmp         006DD9D7
 006DD9EC    mov         eax,esi
 006DD9EE    pop         edi
 006DD9EF    pop         esi
 006DD9F0    pop         ebx
 006DD9F1    mov         esp,ebp
 006DD9F3    pop         ebp
 006DD9F4    ret
end;*}

//006DDA30
function TPPTValue.CanSet:Boolean;
begin
{*
 006DDA30    xor         eax,eax
 006DDA32    ret
*}
end;

//006DDA34
procedure TPPTValue.CreateClone;
begin
{*
 006DDA34    mov         dl,1
 006DDA36    mov         eax,[006DD010];TPPTValue
 006DDA3B    call        TObject.Create;TPPTValue.Create
 006DDA40    ret
*}
end;

//006DDA44
procedure TPPTValue.FillClone(c:TExpression);
begin
{*
 006DDA44    push        ebx
 006DDA45    push        esi
 006DDA46    mov         esi,edx
 006DDA48    mov         ebx,eax
 006DDA4A    mov         edx,esi
 006DDA4C    mov         eax,ebx
 006DDA4E    call        TExpression.FillClone
 006DDA53    mov         eax,esi
 006DDA55    mov         edx,dword ptr [ebx+24];TPPTValue.Item:Integer
 006DDA58    mov         dword ptr [eax+24],edx
 006DDA5B    mov         edx,dword ptr [ebx+20];TPPTValue.ComPort:Integer
 006DDA5E    mov         dword ptr [eax+20],edx
 006DDA61    mov         edx,dword ptr [ebx+18];TPPTValue...........................................................
 006DDA64    mov         dword ptr [eax+18],edx
 006DDA67    pop         esi
 006DDA68    pop         ebx
 006DDA69    ret
*}
end;

//006DDA6C
function TPPTValue.GetDataType:TDataType;
begin
{*
 006DDA6C    mov         eax,dword ptr [eax+24];TPPTValue.Item:Integer
 006DDA6F    cmp         eax,0F
>006DDA72    ja          006DDAA4
 006DDA74    movzx       eax,byte ptr [eax+6DDA82]
 006DDA7B    jmp         dword ptr [eax*4+6DDA92]
 006DDA7B    db          1
 006DDA7B    db          2
 006DDA7B    db          0
 006DDA7B    db          0
 006DDA7B    db          0
 006DDA7B    db          0
 006DDA7B    db          0
 006DDA7B    db          0
 006DDA7B    db          0
 006DDA7B    db          1
 006DDA7B    db          1
 006DDA7B    db          1
 006DDA7B    db          1
 006DDA7B    db          2
 006DDA7B    db          0
 006DDA7B    db          1
 006DDA7B    dd          006DDAA4
 006DDA7B    dd          006DDA9E
 006DDA7B    dd          006DDAA1
 006DDA9E    mov         al,3
 006DDAA0    ret
 006DDAA1    mov         al,2
 006DDAA3    ret
 006DDAA4    xor         eax,eax
 006DDAA6    ret
*}
end;

//006DDAA8
function TPPTValue.GetPerUnits1:TUnits;
begin
{*
 006DDAA8    mov         eax,dword ptr [eax+24];TPPTValue.Item:Integer
 006DDAAB    sub         eax,1
>006DDAAE    jb          006DDABA
 006DDAB0    add         eax,0FFFFFFF1
 006DDAB3    sub         eax,3
>006DDAB6    jb          006DDABD
>006DDAB8    jmp         006DDAC0
 006DDABA    xor         eax,eax
 006DDABC    ret
 006DDABD    mov         al,11
 006DDABF    ret
 006DDAC0    xor         eax,eax
 006DDAC2    ret
*}
end;

//006DDAC4
function TPPTValue.GetPerUnits2:TUnits;
begin
{*
 006DDAC4    mov         eax,dword ptr [eax+24];TPPTValue.Item:Integer
 006DDAC7    sub         eax,1
>006DDACA    jae         006DDACF
 006DDACC    xor         eax,eax
 006DDACE    ret
 006DDACF    xor         eax,eax
 006DDAD1    ret
*}
end;

//006DDAD4
{*procedure TPPTValue.GetString(?:?);
begin
 006DDAD4    push        ebx
 006DDAD5    push        esi
 006DDAD6    mov         esi,edx
 006DDAD8    mov         ebx,eax
 006DDADA    mov         eax,dword ptr [ebx+24];TPPTValue.Item:Integer
 006DDADD    sub         eax,1
>006DDAE0    jae         006DDAEE
 006DDAE2    mov         edx,esi
 006DDAE4    mov         eax,ebx
 006DDAE6    call        TExpression.GetString
 006DDAEB    pop         esi
 006DDAEC    pop         ebx
 006DDAED    ret
 006DDAEE    mov         edx,esi
 006DDAF0    mov         eax,ebx
 006DDAF2    call        TExpression.GetString
 006DDAF7    pop         esi
 006DDAF8    pop         ebx
 006DDAF9    ret
end;*}

//006DDAFC
function TPPTValue.GetUnits:TUnits;
begin
{*
 006DDAFC    mov         eax,dword ptr [eax+24];TPPTValue.Item:Integer
 006DDAFF    sub         eax,1
>006DDB02    jb          006DDB14
 006DDB04    dec         eax
 006DDB05    sub         eax,3
>006DDB08    jb          006DDB17
 006DDB0A    add         eax,0FFFFFFF5
 006DDB0D    sub         eax,3
>006DDB10    jb          006DDB1A
>006DDB12    jmp         006DDB1D
 006DDB14    xor         eax,eax
 006DDB16    ret
 006DDB17    mov         al,5
 006DDB19    ret
 006DDB1A    mov         al,5
 006DDB1C    ret
 006DDB1D    xor         eax,eax
 006DDB1F    ret
*}
end;

//006DDB20
procedure TPPTValue.GetValue;
begin
{*
 006DDB20    add         esp,0FFFFFFEC
 006DDB23    mov         edx,eax
 006DDB25    mov         ecx,dword ptr [edx+18];TPPTValue...........................................................
 006DDB28    cmp         ecx,1
>006DDB2B    jl          006DDB32
 006DDB2D    cmp         ecx,20
>006DDB30    jle         006DDB40
 006DDB32    xor         eax,eax
 006DDB34    mov         dword ptr [esp],eax
 006DDB37    mov         dword ptr [esp+4],eax
>006DDB3B    jmp         006DDE54
 006DDB40    mov         eax,dword ptr [edx+24];TPPTValue.Item:Integer
 006DDB43    cmp         eax,12
>006DDB46    ja          006DDE4B
 006DDB4C    jmp         dword ptr [eax*4+6DDB53]
 006DDB4C    dd          006DDB9F
 006DDB4C    dd          006DDBFB
 006DDB4C    dd          006DDC2A
 006DDB4C    dd          006DDC40
 006DDB4C    dd          006DDC56
 006DDB4C    dd          006DDC6C
 006DDB4C    dd          006DDC82
 006DDB4C    dd          006DDC98
 006DDB4C    dd          006DDCAE
 006DDB4C    dd          006DDCC4
 006DDB4C    dd          006DDCE3
 006DDB4C    dd          006DDD02
 006DDB4C    dd          006DDD21
 006DDB4C    dd          006DDD40
 006DDB4C    dd          006DDD4F
 006DDB4C    dd          006DDBD2
 006DDB4C    dd          006DDD67
 006DDB4C    dd          006DDDB7
 006DDB4C    dd          006DDE01
 006DDB9F    cmp         byte ptr ds:[821515],0;gvar_00821515
>006DDBA6    jne         006DDBB8
 006DDBA8    xor         eax,eax
 006DDBAA    call        00686074
 006DDBAF    fstp        qword ptr [esp]
 006DDBB2    wait
>006DDBB3    jmp         006DDE54
 006DDBB8    movzx       eax,byte ptr ds:[821522];gvar_00821522
 006DDBBF    cmp         ecx,eax
 006DDBC1    setle       al
 006DDBC4    call        00686074
 006DDBC9    fstp        qword ptr [esp]
 006DDBCC    wait
>006DDBCD    jmp         006DDE54
 006DDBD2    cmp         byte ptr ds:[821515],0;gvar_00821515
>006DDBD9    jne         006DDBEB
 006DDBDB    xor         eax,eax
 006DDBDD    call        00686074
 006DDBE2    fstp        qword ptr [esp]
 006DDBE5    wait
>006DDBE6    jmp         006DDE54
 006DDBEB    mov         al,1
 006DDBED    call        00686074
 006DDBF2    fstp        qword ptr [esp]
 006DDBF5    wait
>006DDBF6    jmp         006DDE54
 006DDBFB    cmp         byte ptr ds:[821515],0;gvar_00821515
>006DDC02    jne         006DDC12
 006DDC04    xor         eax,eax
 006DDC06    mov         dword ptr [esp],eax
 006DDC09    mov         dword ptr [esp+4],eax
>006DDC0D    jmp         006DDE54
 006DDC12    movzx       eax,byte ptr ds:[821522];gvar_00821522
 006DDC19    mov         dword ptr [esp+10],eax
 006DDC1D    fild        dword ptr [esp+10]
 006DDC21    fstp        qword ptr [esp]
 006DDC24    wait
>006DDC25    jmp         006DDE54
 006DDC2A    mov         eax,ecx
 006DDC2C    add         eax,eax
 006DDC2E    add         eax,eax
 006DDC30    fld         dword ptr [eax*8+821508]
 006DDC37    fstp        qword ptr [esp]
 006DDC3A    wait
>006DDC3B    jmp         006DDE54
 006DDC40    mov         eax,ecx
 006DDC42    add         eax,eax
 006DDC44    add         eax,eax
 006DDC46    fld         dword ptr [eax*8+82150C]
 006DDC4D    fstp        qword ptr [esp]
 006DDC50    wait
>006DDC51    jmp         006DDE54
 006DDC56    mov         eax,ecx
 006DDC58    add         eax,eax
 006DDC5A    add         eax,eax
 006DDC5C    fld         dword ptr [eax*8+821510];gvar_00821510
 006DDC63    fstp        qword ptr [esp]
 006DDC66    wait
>006DDC67    jmp         006DDE54
 006DDC6C    mov         eax,ecx
 006DDC6E    add         eax,eax
 006DDC70    add         eax,eax
 006DDC72    fld         dword ptr [eax*8+821514];gvar_00821514
 006DDC79    fstp        qword ptr [esp]
 006DDC7C    wait
>006DDC7D    jmp         006DDE54
 006DDC82    mov         eax,ecx
 006DDC84    add         eax,eax
 006DDC86    add         eax,eax
 006DDC88    fld         dword ptr [eax*8+821518]
 006DDC8F    fstp        qword ptr [esp]
 006DDC92    wait
>006DDC93    jmp         006DDE54
 006DDC98    mov         eax,ecx
 006DDC9A    add         eax,eax
 006DDC9C    add         eax,eax
 006DDC9E    fld         dword ptr [eax*8+82151C];gvar_0082151C:TModulePPT
 006DDCA5    fstp        qword ptr [esp]
 006DDCA8    wait
>006DDCA9    jmp         006DDE54
 006DDCAE    mov         eax,ecx
 006DDCB0    add         eax,eax
 006DDCB2    add         eax,eax
 006DDCB4    fld         dword ptr [eax*8+821520];gvar_00821520
 006DDCBB    fstp        qword ptr [esp]
 006DDCBE    wait
>006DDCBF    jmp         006DDE54
 006DDCC4    mov         eax,ecx
 006DDCC6    add         eax,eax
 006DDCC8    add         eax,eax
 006DDCCA    test        byte ptr [eax*8+821504],1
 006DDCD2    seta        al
 006DDCD5    call        00686074
 006DDCDA    fstp        qword ptr [esp]
 006DDCDD    wait
>006DDCDE    jmp         006DDE54
 006DDCE3    mov         eax,ecx
 006DDCE5    add         eax,eax
 006DDCE7    add         eax,eax
 006DDCE9    test        byte ptr [eax*8+821504],2
 006DDCF1    seta        al
 006DDCF4    call        00686074
 006DDCF9    fstp        qword ptr [esp]
 006DDCFC    wait
>006DDCFD    jmp         006DDE54
 006DDD02    mov         eax,ecx
 006DDD04    add         eax,eax
 006DDD06    add         eax,eax
 006DDD08    test        byte ptr [eax*8+821504],4
 006DDD10    seta        al
 006DDD13    call        00686074
 006DDD18    fstp        qword ptr [esp]
 006DDD1B    wait
>006DDD1C    jmp         006DDE54
 006DDD21    mov         eax,ecx
 006DDD23    add         eax,eax
 006DDD25    add         eax,eax
 006DDD27    test        byte ptr [eax*8+821504],8
 006DDD2F    seta        al
 006DDD32    call        00686074
 006DDD37    fstp        qword ptr [esp]
 006DDD3A    wait
>006DDD3B    jmp         006DDE54
 006DDD40    fild        dword ptr ds:[78C2D0];gvar_0078C2D0:Single
 006DDD46    fstp        qword ptr [esp]
 006DDD49    wait
>006DDD4A    jmp         006DDE54
 006DDD4F    movzx       eax,word ptr ds:[821520];gvar_00821520
 006DDD56    mov         dword ptr [esp+10],eax
 006DDD5A    fild        dword ptr [esp+10]
 006DDD5E    fstp        qword ptr [esp]
 006DDD61    wait
>006DDD62    jmp         006DDE54
 006DDD67    fld         qword ptr ds:[821D28];gvar_00821D28:Double
 006DDD6D    fsub        qword ptr ds:[821D30];gvar_00821D30:Double
 006DDD73    fstp        qword ptr [esp+8]
 006DDD77    wait
 006DDD78    fld         qword ptr [esp+8]
 006DDD7C    fcomp       dword ptr ds:[6DDE5C];0:Single
 006DDD82    wait
 006DDD83    fnstsw      al
 006DDD85    sahf
>006DDD86    jne         006DDD96
 006DDD88    xor         eax,eax
 006DDD8A    mov         dword ptr [esp],eax
 006DDD8D    mov         dword ptr [esp+4],eax
>006DDD91    jmp         006DDE54
 006DDD96    mov         eax,ecx
 006DDD98    add         eax,eax
 006DDD9A    add         eax,eax
 006DDD9C    fld         dword ptr [eax*8+821508]
 006DDDA3    fsub        dword ptr [eax*8+82190C]
 006DDDAA    fdiv        qword ptr [esp+8]
 006DDDAE    fstp        qword ptr [esp]
 006DDDB1    wait
>006DDDB2    jmp         006DDE54
 006DDDB7    fld         qword ptr ds:[821D28];gvar_00821D28:Double
 006DDDBD    fsub        qword ptr ds:[821D30];gvar_00821D30:Double
 006DDDC3    fstp        qword ptr [esp+8]
 006DDDC7    wait
 006DDDC8    fld         qword ptr [esp+8]
 006DDDCC    fcomp       dword ptr ds:[6DDE5C];0:Single
 006DDDD2    wait
 006DDDD3    fnstsw      al
 006DDDD5    sahf
>006DDDD6    jne         006DDDE3
 006DDDD8    xor         eax,eax
 006DDDDA    mov         dword ptr [esp],eax
 006DDDDD    mov         dword ptr [esp+4],eax
>006DDDE1    jmp         006DDE54
 006DDDE3    mov         eax,ecx
 006DDDE5    add         eax,eax
 006DDDE7    add         eax,eax
 006DDDE9    fld         dword ptr [eax*8+82150C]
 006DDDF0    fsub        dword ptr [eax*8+821910]
 006DDDF7    fdiv        qword ptr [esp+8]
 006DDDFB    fstp        qword ptr [esp]
 006DDDFE    wait
>006DDDFF    jmp         006DDE54
 006DDE01    fld         qword ptr ds:[821D28];gvar_00821D28:Double
 006DDE07    fsub        qword ptr ds:[821D30];gvar_00821D30:Double
 006DDE0D    fstp        qword ptr [esp+8]
 006DDE11    wait
 006DDE12    fld         qword ptr [esp+8]
 006DDE16    fcomp       dword ptr ds:[6DDE5C];0:Single
 006DDE1C    wait
 006DDE1D    fnstsw      al
 006DDE1F    sahf
>006DDE20    jne         006DDE2D
 006DDE22    xor         eax,eax
 006DDE24    mov         dword ptr [esp],eax
 006DDE27    mov         dword ptr [esp+4],eax
>006DDE2B    jmp         006DDE54
 006DDE2D    mov         eax,ecx
 006DDE2F    add         eax,eax
 006DDE31    add         eax,eax
 006DDE33    fld         dword ptr [eax*8+821510];gvar_00821510
 006DDE3A    fsub        dword ptr [eax*8+821914]
 006DDE41    fdiv        qword ptr [esp+8]
 006DDE45    fstp        qword ptr [esp]
 006DDE48    wait
>006DDE49    jmp         006DDE54
 006DDE4B    xor         eax,eax
 006DDE4D    mov         dword ptr [esp],eax
 006DDE50    mov         dword ptr [esp+4],eax
 006DDE54    fld         qword ptr [esp]
 006DDE57    add         esp,14
 006DDE5A    ret
*}
end;

//006DDE60
function TPPTValue.Module:TObject;
begin
{*
 006DDE60    mov         eax,[0082151C];gvar_0082151C:TModulePPT
 006DDE65    ret
*}
end;

//006DDE68
procedure TPPTValue.SetValue(NewValue:Double);
begin
{*
 006DDE68    push        ebp
 006DDE69    mov         ebp,esp
 006DDE6B    mov         eax,dword ptr [eax+24];TPPTValue.Item:Integer
 006DDE6E    sub         eax,1
>006DDE71    jae         006DDE77
 006DDE73    xor         eax,eax
>006DDE75    jmp         006DDE79
 006DDE77    xor         eax,eax
 006DDE79    pop         ebp
 006DDE7A    ret         8
*}
end;

//006DDE80
{*procedure TPPTValue.ToString(?:?);
begin
 006DDE80    push        ebp
 006DDE81    mov         ebp,esp
 006DDE83    xor         ecx,ecx
 006DDE85    push        ecx
 006DDE86    push        ecx
 006DDE87    push        ecx
 006DDE88    push        ecx
 006DDE89    push        ebx
 006DDE8A    push        esi
 006DDE8B    push        edi
 006DDE8C    mov         esi,edx
 006DDE8E    mov         ebx,eax
 006DDE90    xor         eax,eax
 006DDE92    push        ebp
 006DDE93    push        6DDF39
 006DDE98    push        dword ptr fs:[eax]
 006DDE9B    mov         dword ptr fs:[eax],esp
 006DDE9E    mov         edi,dword ptr [ebx+18];TPPTValue...........................................................
 006DDEA1    test        edi,edi
>006DDEA3    jle         006DDED8
 006DDEA5    push        6DDF54;'PPT'
 006DDEAA    lea         edx,[ebp-4]
 006DDEAD    mov         eax,edi
 006DDEAF    call        IntToStr
 006DDEB4    push        dword ptr [ebp-4]
 006DDEB7    push        6DDF68;'.'
 006DDEBC    lea         edx,[ebp-8]
 006DDEBF    mov         eax,dword ptr [ebx+24];TPPTValue.Item:Integer
 006DDEC2    call        006DE1F4
 006DDEC7    push        dword ptr [ebp-8]
 006DDECA    mov         eax,esi
 006DDECC    mov         edx,4
 006DDED1    call        @UStrCatN
>006DDED6    jmp         006DDEF2
 006DDED8    lea         edx,[ebp-0C]
 006DDEDB    mov         eax,dword ptr [ebx+24];TPPTValue.Item:Integer
 006DDEDE    call        006DE1F4
 006DDEE3    mov         ecx,dword ptr [ebp-0C]
 006DDEE6    mov         eax,esi
 006DDEE8    mov         edx,6DDF78;'PPT.'
 006DDEED    call        @UStrCat3
 006DDEF2    mov         edi,dword ptr [ebx+20];TPPTValue.ComPort:Integer
 006DDEF5    test        edi,edi
>006DDEF7    jle         006DDF1E
 006DDEF9    push        6DDF90;'COM'
 006DDEFE    lea         edx,[ebp-10]
 006DDF01    mov         eax,edi
 006DDF03    call        IntToStr
 006DDF08    push        dword ptr [ebp-10]
 006DDF0B    push        6DDF68;'.'
 006DDF10    push        dword ptr [esi]
 006DDF12    mov         eax,esi
 006DDF14    mov         edx,4
 006DDF19    call        @UStrCatN
 006DDF1E    xor         eax,eax
 006DDF20    pop         edx
 006DDF21    pop         ecx
 006DDF22    pop         ecx
 006DDF23    mov         dword ptr fs:[eax],edx
 006DDF26    push        6DDF40
 006DDF2B    lea         eax,[ebp-10]
 006DDF2E    mov         edx,4
 006DDF33    call        @UStrArrayClr
 006DDF38    ret
>006DDF39    jmp         @HandleFinally
>006DDF3E    jmp         006DDF2B
 006DDF40    pop         edi
 006DDF41    pop         esi
 006DDF42    pop         ebx
 006DDF43    mov         esp,ebp
 006DDF45    pop         ebp
 006DDF46    ret
end;*}

//006DDF98
procedure sub_006DDF98;
begin
{*
 006DDF98    mov         byte ptr ds:[821514],0;gvar_00821514
 006DDF9F    mov         dword ptr ds:[78C2D0],0FFFFFFFF;gvar_0078C2D0:Single
 006DDFA9    ret
*}
end;

//006DDFAC
procedure sub_006DDFAC;
begin
{*
 006DDFAC    ret
*}
end;

//006DDFB0
procedure sub_006DDFB0;
begin
{*
 006DDFB0    push        ebp
 006DDFB1    mov         ebp,esp
 006DDFB3    xor         ecx,ecx
 006DDFB5    push        ecx
 006DDFB6    push        ecx
 006DDFB7    push        ecx
 006DDFB8    push        ecx
 006DDFB9    push        ebx
 006DDFBA    xor         eax,eax
 006DDFBC    push        ebp
 006DDFBD    push        6DE0B1
 006DDFC2    push        dword ptr fs:[eax]
 006DDFC5    mov         dword ptr fs:[eax],esp
 006DDFC8    mov         byte ptr ds:[821515],0;gvar_00821515
 006DDFCF    cmp         byte ptr ds:[821514],0;gvar_00821514
>006DDFD6    je          006DE096
 006DDFDC    cmp         dword ptr ds:[78C2D0],0;gvar_0078C2D0:Single
>006DDFE3    jg          006DE02D
 006DDFE5    mov         ebx,1
 006DDFEA    lea         edx,[ebp-8]
 006DDFED    mov         eax,ebx
 006DDFEF    call        IntToStr
 006DDFF4    mov         ecx,dword ptr [ebp-8]
 006DDFF7    lea         eax,[ebp-4]
 006DDFFA    mov         edx,6DE0CC;'COM'
 006DDFFF    call        @UStrCat3
 006DE004    mov         eax,dword ptr [ebp-4]
 006DE007    call        @UStrToPWChar
 006DE00C    push        eax
 006DE00D    call        ppt.PPT_Connect
 006DE012    test        al,al
>006DE014    je          006DE025
 006DE016    mov         byte ptr ds:[821515],1;gvar_00821515
 006DE01D    mov         dword ptr ds:[78C2D0],ebx;gvar_0078C2D0:Single
>006DE023    jmp         006DE096
 006DE025    inc         ebx
 006DE026    cmp         ebx,11
>006DE029    jne         006DDFEA
>006DE02B    jmp         006DE062
 006DE02D    lea         edx,[ebp-10]
 006DE030    mov         eax,[0078C2D0];0xFFFFFFFF gvar_0078C2D0:Single
 006DE035    call        IntToStr
 006DE03A    mov         ecx,dword ptr [ebp-10]
 006DE03D    lea         eax,[ebp-0C]
 006DE040    mov         edx,6DE0CC;'COM'
 006DE045    call        @UStrCat3
 006DE04A    mov         eax,dword ptr [ebp-0C]
 006DE04D    call        @UStrToPWChar
 006DE052    push        eax
 006DE053    call        ppt.PPT_Connect
 006DE058    cmp         al,1
 006DE05A    sbb         eax,eax
 006DE05C    inc         eax
 006DE05D    mov         [00821515],al;gvar_00821515
 006DE062    mov         word ptr ds:[821520],0;gvar_00821520
 006DE06B    mov         byte ptr ds:[821522],0;gvar_00821522
 006DE072    mov         ecx,20
 006DE077    mov         edx,821524;gvar_00821524
 006DE07C    mov         eax,edx
 006DE07E    mov         byte ptr [eax],0
 006DE081    xor         ebx,ebx
 006DE083    mov         dword ptr [eax+4],ebx
 006DE086    xor         ebx,ebx
 006DE088    mov         dword ptr [eax+8],ebx
 006DE08B    xor         ebx,ebx
 006DE08D    mov         dword ptr [eax+0C],ebx
 006DE090    add         edx,20
 006DE093    dec         ecx
>006DE094    jne         006DE07C
 006DE096    xor         eax,eax
 006DE098    pop         edx
 006DE099    pop         ecx
 006DE09A    pop         ecx
 006DE09B    mov         dword ptr fs:[eax],edx
 006DE09E    push        6DE0B8
 006DE0A3    lea         eax,[ebp-10]
 006DE0A6    mov         edx,4
 006DE0AB    call        @UStrArrayClr
 006DE0B0    ret
>006DE0B1    jmp         @HandleFinally
>006DE0B6    jmp         006DE0A3
 006DE0B8    pop         ebx
 006DE0B9    mov         esp,ebp
 006DE0BB    pop         ebp
 006DE0BC    ret
*}
end;

//006DE0D4
procedure sub_006DE0D4;
begin
{*
 006DE0D4    movzx       eax,byte ptr ds:[821514];gvar_00821514
 006DE0DB    and         al,byte ptr ds:[821515];gvar_00821515
>006DE0E1    je          006DE0EF
 006DE0E3    call        ppt.PPT_Disconnect
 006DE0E8    mov         byte ptr ds:[821515],0;gvar_00821515
 006DE0EF    ret
*}
end;

//006DE0F0
{*function sub_006DE0F0:?;
begin
 006DE0F0    push        ebx
 006DE0F1    push        esi
 006DE0F2    push        edi
 006DE0F3    movzx       eax,byte ptr ds:[821514];gvar_00821514
 006DE0FA    and         al,byte ptr ds:[821515];gvar_00821515
>006DE100    je          006DE199
 006DE106    mov         esi,821520;gvar_00821520
 006DE10B    mov         edi,821924;gvar_00821924
 006DE110    mov         ecx,101
 006DE115    rep movs    dword ptr [edi],dword ptr [esi]
 006DE117    mov         eax,dword ptr ds:[821D28];gvar_00821D28:Double
 006DE11D    mov         dword ptr ds:[821D30],eax;gvar_00821D30:Double
 006DE123    mov         eax,dword ptr ds:[821D2C];gvar_00821D2C
 006DE129    mov         dword ptr ds:[821D34],eax;gvar_00821D34
 006DE12F    call        00682F08
 006DE134    fstp        qword ptr ds:[821D28];gvar_00821D28:Double
 006DE13A    wait
 006DE13B    push        821D38;gvar_00821D38
 006DE140    call        ppt.PPT_GetData
 006DE145    test        al,al
>006DE147    je          006DE199
 006DE149    cmp         byte ptr ds:[821D3A],20;gvar_00821D3A
>006DE150    jbe         006DE159
 006DE152    mov         byte ptr ds:[821D3A],20;gvar_00821D3A
 006DE159    movzx       eax,word ptr ds:[821D38];gvar_00821D38
 006DE160    mov         [00821520],ax;gvar_00821520
 006DE166    movzx       eax,byte ptr ds:[821D3A];gvar_00821D3A
 006DE16D    mov         [00821522],al;gvar_00821522
 006DE172    movzx       ebx,al
 006DE175    dec         ebx
 006DE176    test        ebx,ebx
>006DE178    jl          006DE199
 006DE17A    inc         ebx
 006DE17B    mov         eax,821D3C;gvar_00821D3C
 006DE180    mov         edx,821524;gvar_00821524
 006DE185    mov         esi,eax
 006DE187    mov         edi,edx
 006DE189    mov         ecx,8
 006DE18E    rep movs    dword ptr [edi],dword ptr [esi]
 006DE190    add         edx,20
 006DE193    add         eax,20
 006DE196    dec         ebx
>006DE197    jne         006DE185
 006DE199    mov         al,1
 006DE19B    pop         edi
 006DE19C    pop         esi
 006DE19D    pop         ebx
 006DE19E    ret
end;*}

//006DE1A0
{*function sub_006DE1A0(?:UnicodeString):?;
begin
 006DE1A0    push        ebp
 006DE1A1    mov         ebp,esp
 006DE1A3    push        ecx
 006DE1A4    push        ebx
 006DE1A5    mov         dword ptr [ebp-4],eax
 006DE1A8    mov         eax,dword ptr [ebp-4]
 006DE1AB    call        @UStrAddRef
 006DE1B0    xor         eax,eax
 006DE1B2    push        ebp
 006DE1B3    push        6DE1E6
 006DE1B8    push        dword ptr fs:[eax]
 006DE1BB    mov         dword ptr fs:[eax],esp
 006DE1BE    mov         eax,[0082151C];gvar_0082151C:TModulePPT
 006DE1C3    mov         eax,dword ptr [eax+1C]
 006DE1C6    mov         edx,dword ptr [ebp-4]
 006DE1C9    call        THashTable.Get
 006DE1CE    mov         ebx,eax
 006DE1D0    xor         eax,eax
 006DE1D2    pop         edx
 006DE1D3    pop         ecx
 006DE1D4    pop         ecx
 006DE1D5    mov         dword ptr fs:[eax],edx
 006DE1D8    push        6DE1ED
 006DE1DD    lea         eax,[ebp-4]
 006DE1E0    call        @UStrClr
 006DE1E5    ret
>006DE1E6    jmp         @HandleFinally
>006DE1EB    jmp         006DE1DD
 006DE1ED    mov         eax,ebx
 006DE1EF    pop         ebx
 006DE1F0    pop         ecx
 006DE1F1    pop         ebp
 006DE1F2    ret
end;*}

//006DE1F4
{*procedure sub_006DE1F4(?:Integer; ?:?);
begin
 006DE1F4    push        ebx
 006DE1F5    push        esi
 006DE1F6    mov         esi,edx
 006DE1F8    mov         ebx,eax
 006DE1FA    mov         ecx,esi
 006DE1FC    mov         eax,[0082151C];gvar_0082151C:TModulePPT
 006DE201    mov         eax,dword ptr [eax+1C]
 006DE204    mov         edx,ebx
 006DE206    call        THashTable.Get
 006DE20B    pop         esi
 006DE20C    pop         ebx
 006DE20D    ret
end;*}

//006DE210
{*function sub_006DE210:?;
begin
 006DE210    push        ebx
 006DE211    mov         dl,1
 006DE213    mov         eax,[0043C7BC];TStringList
 006DE218    call        TStringList.Create;TStringList.Create
 006DE21D    mov         ebx,eax
 006DE21F    mov         edx,6DE278;'x'
 006DE224    mov         eax,ebx
 006DE226    mov         ecx,dword ptr [eax]
 006DE228    call        dword ptr [ecx+38];TStringList.Add
 006DE22B    mov         edx,6DE288;'y'
 006DE230    mov         eax,ebx
 006DE232    mov         ecx,dword ptr [eax]
 006DE234    call        dword ptr [ecx+38];TStringList.Add
 006DE237    mov         edx,6DE298;'z'
 006DE23C    mov         eax,ebx
 006DE23E    mov         ecx,dword ptr [eax]
 006DE240    call        dword ptr [ecx+38];TStringList.Add
 006DE243    mov         edx,6DE2A8;'xVelocity'
 006DE248    mov         eax,ebx
 006DE24A    mov         ecx,dword ptr [eax]
 006DE24C    call        dword ptr [ecx+38];TStringList.Add
 006DE24F    mov         edx,6DE2C8;'yVelocity'
 006DE254    mov         eax,ebx
 006DE256    mov         ecx,dword ptr [eax]
 006DE258    call        dword ptr [ecx+38];TStringList.Add
 006DE25B    mov         edx,6DE2E8;'zVelocity'
 006DE260    mov         eax,ebx
 006DE262    mov         ecx,dword ptr [eax]
 006DE264    call        dword ptr [ecx+38];TStringList.Add
 006DE267    mov         eax,ebx
 006DE269    pop         ebx
 006DE26A    ret
end;*}

//006DE2FC
{*function sub_006DE2FC(?:string):?;
begin
 006DE2FC    push        ebp
 006DE2FD    mov         ebp,esp
 006DE2FF    push        ecx
 006DE300    push        ebx
 006DE301    mov         dword ptr [ebp-4],eax
 006DE304    mov         eax,dword ptr [ebp-4]
 006DE307    call        @UStrAddRef
 006DE30C    xor         eax,eax
 006DE30E    push        ebp
 006DE30F    push        6DE396
 006DE314    push        dword ptr fs:[eax]
 006DE317    mov         dword ptr fs:[eax],esp
 006DE31A    lea         eax,[ebp-4]
 006DE31D    mov         edx,6DE3B0;'com'
 006DE322    call        004F9BD0
 006DE327    test        al,al
>006DE329    je          006DE34C
 006DE32B    lea         eax,[ebp-4]
 006DE32E    call        004F9D00
 006DE333    test        eax,eax
>006DE335    jl          006DE348
 006DE337    lea         eax,[ebp-4]
 006DE33A    mov         edx,6DE3C4;'.'
 006DE33F    call        004F9BD0
 006DE344    test        al,al
>006DE346    jne         006DE34C
 006DE348    xor         ebx,ebx
>006DE34A    jmp         006DE380
 006DE34C    lea         eax,[ebp-4]
 006DE34F    mov         edx,6DE3D4;'PPT'
 006DE354    call        004F9BD0
 006DE359    test        al,al
>006DE35B    jne         006DE361
 006DE35D    xor         ebx,ebx
>006DE35F    jmp         006DE380
 006DE361    lea         eax,[ebp-4]
 006DE364    call        004F9D00
 006DE369    lea         eax,[ebp-4]
 006DE36C    mov         edx,6DE3C4;'.'
 006DE371    call        004F9BD0
 006DE376    test        al,al
>006DE378    jne         006DE37E
 006DE37A    xor         ebx,ebx
>006DE37C    jmp         006DE380
 006DE37E    mov         bl,1
 006DE380    xor         eax,eax
 006DE382    pop         edx
 006DE383    pop         ecx
 006DE384    pop         ecx
 006DE385    mov         dword ptr fs:[eax],edx
 006DE388    push        6DE39D
 006DE38D    lea         eax,[ebp-4]
 006DE390    call        @UStrClr
 006DE395    ret
>006DE396    jmp         @HandleFinally
>006DE39B    jmp         006DE38D
 006DE39D    mov         eax,ebx
 006DE39F    pop         ebx
 006DE3A0    pop         ecx
 006DE3A1    pop         ebp
 006DE3A2    ret
end;*}

//006DE3DC
procedure TModulePPT.AddFields;
begin
{*
 006DE3DC    push        ebx
 006DE3DD    mov         ebx,eax
 006DE3DF    xor         ecx,ecx
 006DE3E1    mov         edx,6DE650;'Exists'
 006DE3E6    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE3E9    call        THashTable.Add
 006DE3EE    mov         ecx,2
 006DE3F3    mov         edx,6DE66C;'x'
 006DE3F8    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE3FB    call        THashTable.Add
 006DE400    mov         ecx,3
 006DE405    mov         edx,6DE67C;'y'
 006DE40A    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE40D    call        THashTable.Add
 006DE412    mov         ecx,4
 006DE417    mov         edx,6DE68C;'z'
 006DE41C    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE41F    call        THashTable.Add
 006DE424    mov         ecx,5
 006DE429    mov         edx,6DE69C;'quat1'
 006DE42E    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE431    call        THashTable.Add
 006DE436    mov         ecx,6
 006DE43B    mov         edx,6DE6B4;'quat2'
 006DE440    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE443    call        THashTable.Add
 006DE448    mov         ecx,7
 006DE44D    mov         edx,6DE6CC;'quat3'
 006DE452    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE455    call        THashTable.Add
 006DE45A    mov         ecx,8
 006DE45F    mov         edx,6DE6E4;'quat4'
 006DE464    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE467    call        THashTable.Add
 006DE46C    mov         ecx,1
 006DE471    mov         edx,6DE6FC;'VisibleCount'
 006DE476    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE479    call        THashTable.Add
 006DE47E    mov         ecx,1
 006DE483    mov         edx,6DE724;'numTargets'
 006DE488    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE48B    call        THashTable.Add
 006DE490    mov         ecx,1
 006DE495    mov         edx,6DE748;'numVisible'
 006DE49A    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE49D    call        THashTable.Add
 006DE4A2    mov         ecx,1
 006DE4A7    mov         edx,6DE76C;'Count'
 006DE4AC    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE4AF    call        THashTable.Add
 006DE4B4    mov         ecx,0E
 006DE4B9    mov         edx,6DE784;'Frame'
 006DE4BE    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE4C1    call        THashTable.Add
 006DE4C6    mov         ecx,0F
 006DE4CB    mov         edx,6DE79C;'PluggedIn'
 006DE4D0    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE4D3    call        THashTable.Add
 006DE4D8    mov         ecx,0D
 006DE4DD    mov         edx,6DE7BC;'ComPort'
 006DE4E2    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE4E5    call        THashTable.Add
 006DE4EA    mov         ecx,9
 006DE4EF    mov         edx,6DE7D8;'HasPosition'
 006DE4F4    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE4F7    call        THashTable.Add
 006DE4FC    mov         ecx,0A
 006DE501    mov         edx,6DE7FC;'HasOrientation'
 006DE506    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE509    call        THashTable.Add
 006DE50E    mov         ecx,0A
 006DE513    mov         edx,6DE828;'HasRotation'
 006DE518    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE51B    call        THashTable.Add
 006DE520    mov         ecx,0B
 006DE525    mov         edx,6DE84C;'HasGoodPosition'
 006DE52A    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE52D    call        THashTable.Add
 006DE532    mov         ecx,0C
 006DE537    mov         edx,6DE878;'HasGoodOrientation'
 006DE53C    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE53F    call        THashTable.Add
 006DE544    mov         ecx,0C
 006DE549    mov         edx,6DE8AC;'HasGoodRotation'
 006DE54E    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE551    call        THashTable.Add
 006DE556    mov         ecx,9
 006DE55B    mov         edx,6DE8D8;'HasPos'
 006DE560    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE563    call        THashTable.Add
 006DE568    mov         ecx,0A
 006DE56D    mov         edx,6DE8F4;'HasOri'
 006DE572    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE575    call        THashTable.Add
 006DE57A    mov         ecx,0B
 006DE57F    mov         edx,6DE910;'GoodPos'
 006DE584    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE587    call        THashTable.Add
 006DE58C    mov         ecx,0C
 006DE591    mov         edx,6DE92C;'GoodOri'
 006DE596    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE599    call        THashTable.Add
 006DE59E    mov         ecx,10
 006DE5A3    mov         edx,6DE948;'XVelocity'
 006DE5A8    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE5AB    call        THashTable.Add
 006DE5B0    mov         ecx,11
 006DE5B5    mov         edx,6DE968;'YVelocity'
 006DE5BA    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE5BD    call        THashTable.Add
 006DE5C2    mov         ecx,12
 006DE5C7    mov         edx,6DE988;'ZVelocity'
 006DE5CC    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE5CF    call        THashTable.Add
 006DE5D4    mov         ecx,10
 006DE5D9    mov         edx,6DE9A8;'xv'
 006DE5DE    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE5E1    call        THashTable.Add
 006DE5E6    mov         ecx,11
 006DE5EB    mov         edx,6DE9BC;'yv'
 006DE5F0    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE5F3    call        THashTable.Add
 006DE5F8    mov         ecx,12
 006DE5FD    mov         edx,6DE9D0;'zv'
 006DE602    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE605    call        THashTable.Add
 006DE60A    mov         ecx,10
 006DE60F    mov         edx,6DE9E4;'VelocityX'
 006DE614    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE617    call        THashTable.Add
 006DE61C    mov         ecx,11
 006DE621    mov         edx,6DEA04;'VelocityY'
 006DE626    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE629    call        THashTable.Add
 006DE62E    mov         ecx,12
 006DE633    mov         edx,6DEA24;'VelocityZ'
 006DE638    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DE63B    call        THashTable.Add
 006DE640    pop         ebx
 006DE641    ret
*}
end;

//006DEA38
procedure TModulePPT.ClearRead;
begin
{*
 006DEA38    call        TPieModule.ClearRead
 006DEA3D    ret
*}
end;

//006DEA40
constructor TModulePPT.Create;
begin
{*
 006DEA40    push        ebx
 006DEA41    push        esi
 006DEA42    test        dl,dl
>006DEA44    je          006DEA4E
 006DEA46    add         esp,0FFFFFFF0
 006DEA49    call        @ClassCreate
 006DEA4E    mov         ebx,edx
 006DEA50    mov         esi,eax
 006DEA52    push        0
 006DEA54    push        0
 006DEA56    push        0
 006DEA58    push        0
 006DEA5A    mov         ecx,6DEA90;'PPT'
 006DEA5F    xor         edx,edx
 006DEA61    mov         eax,esi
 006DEA63    call        005E48EC
 006DEA68    mov         eax,esi
 006DEA6A    test        bl,bl
>006DEA6C    je          006DEA7D
 006DEA6E    call        @AfterConstruction
 006DEA73    pop         dword ptr fs:[0]
 006DEA7A    add         esp,0C
 006DEA7D    mov         eax,esi
 006DEA7F    pop         esi
 006DEA80    pop         ebx
 006DEA81    ret
*}
end;

//006DEA98
function TModulePPT.CreateValue(Identifier:string):TExpression;
begin
{*
 006DEA98    push        ebp
 006DEA99    mov         ebp,esp
 006DEA9B    push        ecx
 006DEA9C    push        ebx
 006DEA9D    mov         dword ptr [ebp-4],edx
 006DEAA0    mov         ebx,eax
 006DEAA2    mov         eax,dword ptr [ebp-4]
 006DEAA5    call        @UStrAddRef
 006DEAAA    xor         eax,eax
 006DEAAC    push        ebp
 006DEAAD    push        6DEADC
 006DEAB2    push        dword ptr fs:[eax]
 006DEAB5    mov         dword ptr fs:[eax],esp
 006DEAB8    mov         byte ptr [ebx+24],1;TModulePPT.Used:Boolean
 006DEABC    mov         eax,dword ptr [ebp-4]
 006DEABF    call        006DD8B0
 006DEAC4    mov         ebx,eax
 006DEAC6    xor         eax,eax
 006DEAC8    pop         edx
 006DEAC9    pop         ecx
 006DEACA    pop         ecx
 006DEACB    mov         dword ptr fs:[eax],edx
 006DEACE    push        6DEAE3
 006DEAD3    lea         eax,[ebp-4]
 006DEAD6    call        @UStrClr
 006DEADB    ret
>006DEADC    jmp         @HandleFinally
>006DEAE1    jmp         006DEAD3
 006DEAE3    mov         eax,ebx
 006DEAE5    pop         ebx
 006DEAE6    pop         ecx
 006DEAE7    pop         ebp
 006DEAE8    ret
*}
end;

//006DEAEC
function TModulePPT.GetDefaultFormat(field:string):TGuiFormat;
begin
{*
 006DEAEC    push        ebp
 006DEAED    mov         ebp,esp
 006DEAEF    push        ecx
 006DEAF0    push        ebx
 006DEAF1    mov         dword ptr [ebp-4],edx
 006DEAF4    mov         ebx,eax
 006DEAF6    mov         eax,dword ptr [ebp-4]
 006DEAF9    call        @UStrAddRef
 006DEAFE    xor         eax,eax
 006DEB00    push        ebp
 006DEB01    push        6DEB40
 006DEB06    push        dword ptr fs:[eax]
 006DEB09    mov         dword ptr fs:[eax],esp
 006DEB0C    mov         edx,dword ptr [ebp-4]
 006DEB0F    mov         eax,dword ptr [ebx+1C];TModulePPT.Fields:THashTable
 006DEB12    call        THashTable.Get
 006DEB17    sub         eax,1
>006DEB1A    jb          006DEB24
 006DEB1C    add         eax,0FFFFFFF8
 006DEB1F    sub         eax,4
>006DEB22    jae         006DEB28
 006DEB24    xor         ebx,ebx
>006DEB26    jmp         006DEB2A
 006DEB28    mov         bl,9
 006DEB2A    xor         eax,eax
 006DEB2C    pop         edx
 006DEB2D    pop         ecx
 006DEB2E    pop         ecx
 006DEB2F    mov         dword ptr fs:[eax],edx
 006DEB32    push        6DEB47
 006DEB37    lea         eax,[ebp-4]
 006DEB3A    call        @UStrClr
 006DEB3F    ret
>006DEB40    jmp         @HandleFinally
>006DEB45    jmp         006DEB37
 006DEB47    mov         eax,ebx
 006DEB49    pop         ebx
 006DEB4A    pop         ecx
 006DEB4B    pop         ebp
 006DEB4C    ret
*}
end;

//006DEB50
procedure TModulePPT.GetGoodFields;
begin
{*
 006DEB50    call        006DE210
 006DEB55    ret
*}
end;

//006DEB58
procedure TModulePPT.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 006DEB58    push        ebp
 006DEB59    mov         ebp,esp
 006DEB5B    mov         byte ptr [edx],1
 006DEB5E    mov         dword ptr [ecx],1
 006DEB64    mov         eax,dword ptr [ebp+8]
 006DEB67    mov         dword ptr [eax],14
 006DEB6D    pop         ebp
 006DEB6E    ret         4
*}
end;

//006DEB74
function TModulePPT.IsIdentifier(s:string):Boolean;
begin
{*
 006DEB74    push        ebp
 006DEB75    mov         ebp,esp
 006DEB77    push        ecx
 006DEB78    push        ebx
 006DEB79    mov         dword ptr [ebp-4],edx
 006DEB7C    mov         eax,dword ptr [ebp-4]
 006DEB7F    call        @UStrAddRef
 006DEB84    xor         eax,eax
 006DEB86    push        ebp
 006DEB87    push        6DEBB2
 006DEB8C    push        dword ptr fs:[eax]
 006DEB8F    mov         dword ptr fs:[eax],esp
 006DEB92    mov         eax,dword ptr [ebp-4]
 006DEB95    call        006DE2FC
 006DEB9A    mov         ebx,eax
 006DEB9C    xor         eax,eax
 006DEB9E    pop         edx
 006DEB9F    pop         ecx
 006DEBA0    pop         ecx
 006DEBA1    mov         dword ptr fs:[eax],edx
 006DEBA4    push        6DEBB9
 006DEBA9    lea         eax,[ebp-4]
 006DEBAC    call        @UStrClr
 006DEBB1    ret
>006DEBB2    jmp         @HandleFinally
>006DEBB7    jmp         006DEBA9
 006DEBB9    mov         eax,ebx
 006DEBBB    pop         ebx
 006DEBBC    pop         ecx
 006DEBBD    pop         ebp
 006DEBBE    ret
*}
end;

//006DEBC0
procedure TModulePPT.PrepareForGUI;
begin
{*
 006DEBC0    ret
*}
end;

//006DEBC4
procedure TModulePPT.PrepareForMonitoring;
begin
{*
 006DEBC4    ret
*}
end;

//006DEBC8
procedure TModulePPT.Read;
begin
{*
 006DEBC8    call        006DE0F0
 006DEBCD    ret
*}
end;

//006DEBD0
procedure TModulePPT.StartCompiletime;
begin
{*
 006DEBD0    call        TPieModule.StartCompiletime
 006DEBD5    call        006DDF98
 006DEBDA    ret
*}
end;

//006DEBDC
procedure TModulePPT.StartMonitoring;
begin
{*
 006DEBDC    ret
*}
end;

//006DEBE0
procedure TModulePPT.StartRuntime;
begin
{*
 006DEBE0    call        TPieModule.StartRuntime
 006DEBE5    call        006DDFB0
 006DEBEA    ret
*}
end;

//006DEBEC
procedure TModulePPT.StopCompiletime;
begin
{*
 006DEBEC    push        ebx
 006DEBED    mov         ebx,eax
 006DEBEF    call        006DDFAC
 006DEBF4    mov         eax,ebx
 006DEBF6    call        TPieModule.StopCompiletime
 006DEBFB    pop         ebx
 006DEBFC    ret
*}
end;

//006DEC00
procedure TModulePPT.StopMonitoring;
begin
{*
 006DEC00    ret
*}
end;

//006DEC04
procedure TModulePPT.StopRuntime;
begin
{*
 006DEC04    push        ebx
 006DEC05    mov         ebx,eax
 006DEC07    call        006DE0D4
 006DEC0C    mov         eax,ebx
 006DEC0E    call        TPieModule.StopRuntime
 006DEC13    pop         ebx
 006DEC14    ret
*}
end;

Initialization
//00782A28
{*
 00782A28    sub         dword ptr ds:[821518],1
>00782A2F    jae         00782A56
 00782A31    mov         eax,782A64;'Initializing PiePPT'
 00782A36    call        004FA5FC
 00782A3B    mov         dl,1
 00782A3D    mov         eax,[006DD3E8];TModulePPT
 00782A42    call        TModulePPT.Create;TModulePPT.Create
 00782A47    mov         [0082151C],eax;gvar_0082151C:TModulePPT
 00782A4C    mov         eax,[0082151C];gvar_0082151C:TModulePPT
 00782A51    call        005E31AC
 00782A56    ret
*}
Finalization
end.