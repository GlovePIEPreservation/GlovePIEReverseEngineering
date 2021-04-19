//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieRower;

interface

uses
  SysUtils, Classes;

type
  TRowerValue = class(TObjectValue)
  published
    function GetUnits:TUnits;//006E666C
    //procedure GetString(?:?);//006E6644
    procedure FillClone(c:TExpression);//006E65A4
    function Module:TObject;//006E6914
    function GetPerUnits2:TUnits;//006E6634
    function GetPerUnits1:TUnits;//006E6610
    procedure SetValue(NewValue:Double);//006E691C
    function CanSet:Boolean;//006E6590
    function GetDataType:TDataType;//006E65C4
    procedure CreateClone;//006E6594
    procedure GetValue;//006E66AC
    //procedure ToString(?:?);//006E6934
  public
    ......................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//006E6934
    procedure GetValue; virtual;//v2C//006E66AC
    //procedure GetString(?:?); virtual;//v38//006E6644
    function GetDataType:TDataType; virtual;//v44//006E65C4
    function GetUnits:TUnits; virtual;//v48//006E666C
    function GetPerUnits1:TUnits; virtual;//v4C//006E6610
    function GetPerUnits2:TUnits; virtual;//v50//006E6634
    procedure SetValue(NewValue:Double); virtual;//v58//006E691C
    function CanSet:Boolean; virtual;//v68//006E6590
    procedure CreateClone; virtual;//v80//006E6594
    procedure FillClone(c:TExpression); virtual;//v84//006E65A4
    function Module:TObject; virtual;//v98//006E6914
  end;
  TModuleRower = class(TPieModule)
  published
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//006E79D8
    function GetDefaultFormat(field:string):TGuiFormat;//006E7974
    procedure Read;//006E79EC
    procedure GetGoodFields;//006E79D0
    procedure PrepareForGUI;//006E79E4
    procedure StopMonitoring;//006E7A24
    procedure StartMonitoring;//006E7A00
    procedure PrepareForMonitoring;//006E79E8
    procedure StartCompiletime;//006E79F4
    procedure StopCompiletime;//006E7A10
    procedure StartRuntime;//006E7A04
    procedure StopRuntime;//006E7A28
    function CreateValue(Identifier:string):TExpression;//006E7920
    procedure ClearRead;//006E788C
    constructor Create;//006E7894
    procedure AddFields;//006E75A4
  public
    function CreateValue(Identifier:string):TExpression; virtual;//v14//006E7920
    procedure GetGoodFields; virtual;//v1C//006E79D0
    procedure AddFields; virtual;//v24//006E75A4
    procedure StartCompiletime; virtual;//v28//006E79F4
    procedure StopCompiletime; virtual;//v2C//006E7A10
    procedure StartRuntime; virtual;//v30//006E7A04
    procedure StopRuntime; virtual;//v34//006E7A28
    procedure ClearRead; virtual;//v38//006E788C
    procedure Read; virtual;//v3C//006E79EC
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//006E79D8
    function GetDefaultFormat(field:string):TGuiFormat; virtual;//v44//006E7974
    procedure PrepareForGUI; virtual;//v50//006E79E4
    procedure PrepareForMonitoring; virtual;//v5C//006E79E8
    procedure StartMonitoring; virtual;//v60//006E7A00
    procedure StopMonitoring; virtual;//v64//006E7A24
  end;
    tkcmdsetDDI_get_error_name;//006E5B08
    tkcmdsetDDI_get_error_text;//006E5B10
    //function tkcmdsetDDI_init:?;//006E5B18
    //function tkcmdsetDDI_discover_pm3s:?;//006E5B20
    //function tkcmdsetDDI_serial_number:?;//006E5B28
    tkcmdsetDDI_shutdown;//006E5B30
    //function tkcmdsetCSAFE_init_protocol:?;//006E5B38
    //function tkcmdsetCSAFE_command:?;//006E5B40
    //function sub_006E63A4(?:string):?;//006E63A4
    procedure sub_006E6A14;//006E6A14
    procedure sub_006E6A64;//006E6A64
    procedure sub_006E6A68;//006E6A68
    procedure sub_006E7034;//006E7034
    procedure sub_006E7054;//006E7054
    //function sub_006E74F4(?:UnicodeString):?;//006E74F4
    //procedure sub_006E7548(?:Integer; ?:?);//006E7548
    //function sub_006E7564:?;//006E7564

implementation

//006E5B18
{*function RPPM3DDI.tkcmdsetDDI_init:?;
begin
 006E5B18    jmp         dword ptr ds:[82693C]
end;*}

//006E5B20
{*function RPPM3DDI.tkcmdsetDDI_discover_pm3s:?;
begin
 006E5B20    jmp         dword ptr ds:[826938]
end;*}

//006E5B28
{*function RPPM3DDI.tkcmdsetDDI_serial_number:?;
begin
 006E5B28    jmp         dword ptr ds:[826934]
end;*}

//006E5B38
{*function RPPM3Csafe.tkcmdsetCSAFE_init_protocol:?;
begin
 006E5B38    jmp         dword ptr ds:[826950]
end;*}

//006E5B40
{*function RPPM3Csafe.tkcmdsetCSAFE_command:?;
begin
 006E5B40    jmp         dword ptr ds:[82694C]
end;*}

//006E63A4
{*function sub_006E63A4(?:string):?;
begin
 006E63A4    push        ebp
 006E63A5    mov         ebp,esp
 006E63A7    add         esp,0FFFFFFF8
 006E63AA    push        ebx
 006E63AB    push        esi
 006E63AC    push        edi
 006E63AD    xor         edx,edx
 006E63AF    mov         dword ptr [ebp-8],edx
 006E63B2    mov         dword ptr [ebp-4],eax
 006E63B5    mov         eax,dword ptr [ebp-4]
 006E63B8    call        @UStrAddRef
 006E63BD    xor         eax,eax
 006E63BF    push        ebp
 006E63C0    push        6E6529
 006E63C5    push        dword ptr fs:[eax]
 006E63C8    mov         dword ptr fs:[eax],esp
 006E63CB    xor         ebx,ebx
 006E63CD    lea         eax,[ebp-8]
 006E63D0    mov         edx,dword ptr [ebp-4]
 006E63D3    call        @UStrLAsg
 006E63D8    lea         eax,[ebp-8]
 006E63DB    mov         edx,6E6548;'Rower'
 006E63E0    call        004F9BD0
 006E63E5    test        al,al
>006E63E7    jne         006E640F
 006E63E9    lea         eax,[ebp-8]
 006E63EC    mov         edx,6E6560;'Ergo'
 006E63F1    call        004F9BD0
 006E63F6    test        al,al
>006E63F8    jne         006E640F
 006E63FA    lea         eax,[ebp-8]
 006E63FD    mov         edx,6E6578;'Erg'
 006E6402    call        004F9BD0
 006E6407    test        al,al
>006E6409    je          006E650E
 006E640F    lea         eax,[ebp-8]
 006E6412    call        004F9D00
 006E6417    mov         edi,eax
 006E6419    lea         eax,[ebp-8]
 006E641C    mov         edx,6E658C;'.'
 006E6421    call        004F9BD0
 006E6426    test        al,al
>006E6428    je          006E650E
 006E642E    mov         eax,dword ptr [ebp-8]
 006E6431    call        006E74F4
 006E6436    mov         esi,eax
 006E6438    test        esi,esi
>006E643A    jl          006E650E
 006E6440    mov         eax,esi
 006E6442    cmp         eax,0F
>006E6445    ja          006E64EA
 006E644B    jmp         dword ptr [eax*4+6E6452]
 006E644B    dd          006E64EA
 006E644B    dd          006E64EA
 006E644B    dd          006E6492
 006E644B    dd          006E649B
 006E644B    dd          006E64A4
 006E644B    dd          006E64AD
 006E644B    dd          006E64D1
 006E644B    dd          006E64B6
 006E644B    dd          006E64BF
 006E644B    dd          006E64DA
 006E644B    dd          006E64C8
 006E644B    dd          006E64E3
 006E644B    dd          006E64DA
 006E644B    dd          006E64E3
 006E644B    dd          006E64E3
 006E644B    dd          006E64E3
 006E6492    mov         byte ptr ds:[822710],1;gvar_00822710
>006E6499    jmp         006E64EA
 006E649B    mov         byte ptr ds:[822711],1;gvar_00822711
>006E64A2    jmp         006E64EA
 006E64A4    mov         byte ptr ds:[822712],1;gvar_00822712
>006E64AB    jmp         006E64EA
 006E64AD    mov         byte ptr ds:[822713],1;gvar_00822713
>006E64B4    jmp         006E64EA
 006E64B6    mov         byte ptr ds:[822715],1;gvar_00822715
>006E64BD    jmp         006E64EA
 006E64BF    mov         byte ptr ds:[822716],1;gvar_00822716
>006E64C6    jmp         006E64EA
 006E64C8    mov         byte ptr ds:[822718],1;gvar_00822718
>006E64CF    jmp         006E64EA
 006E64D1    mov         byte ptr ds:[822714],1;gvar_00822714
>006E64D8    jmp         006E64EA
 006E64DA    mov         byte ptr ds:[822717],1;gvar_00822717
>006E64E1    jmp         006E64EA
 006E64E3    mov         byte ptr ds:[822719],1;gvar_00822719
 006E64EA    mov         dl,1
 006E64EC    mov         eax,[006E5B48];TRowerValue
 006E64F1    call        TObject.Create;TRowerValue.Create
 006E64F6    mov         ebx,eax
 006E64F8    mov         dword ptr [ebx+20],esi;TRowerValue........................Item:Integer
 006E64FB    test        edi,edi
>006E64FD    jg          006E6504
 006E64FF    mov         edi,1
 006E6504    mov         dword ptr [ebx+18],edi;TRowerValue.........................................................
 006E6507    mov         byte ptr ds:[8226A8],1;gvar_008226A8
 006E650E    xor         eax,eax
 006E6510    pop         edx
 006E6511    pop         ecx
 006E6512    pop         ecx
 006E6513    mov         dword ptr fs:[eax],edx
 006E6516    push        6E6530
 006E651B    lea         eax,[ebp-8]
 006E651E    mov         edx,2
 006E6523    call        @UStrArrayClr
 006E6528    ret
>006E6529    jmp         @HandleFinally
>006E652E    jmp         006E651B
 006E6530    mov         eax,ebx
 006E6532    pop         edi
 006E6533    pop         esi
 006E6534    pop         ebx
 006E6535    pop         ecx
 006E6536    pop         ecx
 006E6537    pop         ebp
 006E6538    ret
end;*}

//006E6590
function TRowerValue.CanSet:Boolean;
begin
{*
 006E6590    xor         eax,eax
 006E6592    ret
*}
end;

//006E6594
procedure TRowerValue.CreateClone;
begin
{*
 006E6594    mov         dl,1
 006E6596    mov         eax,[006E5B48];TRowerValue
 006E659B    call        TObject.Create;TRowerValue.Create
 006E65A0    ret
*}
end;

//006E65A4
procedure TRowerValue.FillClone(c:TExpression);
begin
{*
 006E65A4    push        ebx
 006E65A5    push        esi
 006E65A6    mov         esi,edx
 006E65A8    mov         ebx,eax
 006E65AA    mov         edx,esi
 006E65AC    mov         eax,ebx
 006E65AE    call        TExpression.FillClone
 006E65B3    mov         eax,esi
 006E65B5    mov         edx,dword ptr [ebx+20];TRowerValue.........................Item:Integer
 006E65B8    mov         dword ptr [eax+20],edx
 006E65BB    mov         edx,dword ptr [ebx+18];TRowerValue.........................................................
 006E65BE    mov         dword ptr [eax+18],edx
 006E65C1    pop         esi
 006E65C2    pop         ebx
 006E65C3    ret
*}
end;

//006E65C4
function TRowerValue.GetDataType:TDataType;
begin
{*
 006E65C4    mov         eax,dword ptr [eax+20];TRowerValue..........................Item:Integer
 006E65C7    cmp         eax,0F
>006E65CA    ja          006E660A
 006E65CC    movzx       eax,byte ptr [eax+6E65DA]
 006E65D3    jmp         dword ptr [eax*4+6E65EA]
 006E65D3    db          1
 006E65D3    db          2
 006E65D3    db          3
 006E65D3    db          0
 006E65D3    db          0
 006E65D3    db          0
 006E65D3    db          0
 006E65D3    db          0
 006E65D3    db          0
 006E65D3    db          0
 006E65D3    db          0
 006E65D3    db          4
 006E65D3    db          0
 006E65D3    db          1
 006E65D3    db          1
 006E65D3    db          1
 006E65D3    dd          006E660A
 006E65D3    dd          006E65FE
 006E65D3    dd          006E6601
 006E65D3    dd          006E6604
 006E65D3    dd          006E6607
 006E65FE    mov         al,3
 006E6600    ret
 006E6601    mov         al,2
 006E6603    ret
 006E6604    mov         al,2
 006E6606    ret
 006E6607    mov         al,2
 006E6609    ret
 006E660A    xor         eax,eax
 006E660C    ret
*}
end;

//006E6610
function TRowerValue.GetPerUnits1:TUnits;
begin
{*
 006E6610    mov         eax,dword ptr [eax+20];TRowerValue...........................Item:Integer
 006E6613    sub         eax,1
>006E6616    jb          006E6627
 006E6618    sub         eax,2
>006E661B    je          006E662D
 006E661D    dec         eax
>006E661E    je          006E662A
 006E6620    sub         eax,2
>006E6623    je          006E662A
>006E6625    jmp         006E6630
 006E6627    xor         eax,eax
 006E6629    ret
 006E662A    mov         al,12
 006E662C    ret
 006E662D    mov         al,6
 006E662F    ret
 006E6630    xor         eax,eax
 006E6632    ret
*}
end;

//006E6634
function TRowerValue.GetPerUnits2:TUnits;
begin
{*
 006E6634    mov         eax,dword ptr [eax+20];TRowerValue............................Item:Integer
 006E6637    sub         eax,1
>006E663A    jae         006E663F
 006E663C    xor         eax,eax
 006E663E    ret
 006E663F    xor         eax,eax
 006E6641    ret
*}
end;

//006E6644
{*procedure TRowerValue.GetString(?:?);
begin
 006E6644    push        ebx
 006E6645    push        esi
 006E6646    mov         esi,edx
 006E6648    mov         ebx,eax
 006E664A    mov         eax,dword ptr [ebx+20];TRowerValue.............................Item:Integer
 006E664D    sub         eax,1
>006E6650    jae         006E665E
 006E6652    mov         edx,esi
 006E6654    mov         eax,ebx
 006E6656    call        TExpression.GetString
 006E665B    pop         esi
 006E665C    pop         ebx
 006E665D    ret
 006E665E    mov         edx,esi
 006E6660    mov         eax,ebx
 006E6662    call        TExpression.GetString
 006E6667    pop         esi
 006E6668    pop         ebx
 006E6669    ret
end;*}

//006E666C
function TRowerValue.GetUnits:TUnits;
begin
{*
 006E666C    mov         eax,dword ptr [eax+20];TRowerValue..............................Item:Integer
 006E666F    cmp         eax,0A
>006E6672    ja          006E66A6
 006E6674    movzx       eax,byte ptr [eax+6E6682]
 006E667B    jmp         dword ptr [eax*4+6E668D]
 006E667B    db          0
 006E667B    db          0
 006E667B    db          1
 006E667B    db          3
 006E667B    db          0
 006E667B    db          0
 006E667B    db          0
 006E667B    db          2
 006E667B    db          0
 006E667B    db          1
 006E667B    db          2
 006E667B    dd          006E66A6
 006E667B    dd          006E669D
 006E667B    dd          006E66A0
 006E667B    dd          006E66A3
 006E669D    mov         al,5
 006E669F    ret
 006E66A0    mov         al,11
 006E66A2    ret
 006E66A3    mov         al,11
 006E66A5    ret
 006E66A6    xor         eax,eax
 006E66A8    ret
*}
end;

//006E66AC
procedure TRowerValue.GetValue;
begin
{*
 006E66AC    add         esp,0FFFFFFF8
 006E66AF    movzx       edx,byte ptr ds:[8226A9];gvar_008226A9
 006E66B6    xor         dl,1
 006E66B9    test        dl,dl
>006E66BB    je          006E66CB
 006E66BD    xor         eax,eax
 006E66BF    mov         dword ptr [esp],eax
 006E66C2    mov         dword ptr [esp+4],eax
>006E66C6    jmp         006E690D
 006E66CB    mov         eax,dword ptr [eax+20];TRowerValue...............................Item:Integer
 006E66CE    cmp         eax,0F
>006E66D1    ja          006E6904
 006E66D7    jmp         dword ptr [eax*4+6E66DE]
 006E66D7    dd          006E677E
 006E66D7    dd          006E67A2
 006E66D7    dd          006E67C3
 006E66D7    dd          006E680E
 006E66D7    dd          006E682F
 006E66D7    dd          006E6850
 006E66D7    dd          006E6871
 006E66D7    dd          006E68AA
 006E66D7    dd          006E688F
 006E66D7    dd          006E67E4
 006E66D7    dd          006E68C5
 006E66D7    dd          006E68E9
 006E66D7    dd          006E6766
 006E66D7    dd          006E671E
 006E66D7    dd          006E6736
 006E66D7    dd          006E674E
 006E671E    cmp         dword ptr ds:[822708],2;gvar_00822708:Single
 006E6725    sete        al
 006E6728    call        00686074
 006E672D    fstp        qword ptr [esp]
 006E6730    wait
>006E6731    jmp         006E690D
 006E6736    cmp         dword ptr ds:[822708],3;gvar_00822708:Single
 006E673D    sete        al
 006E6740    call        00686074
 006E6745    fstp        qword ptr [esp]
 006E6748    wait
>006E6749    jmp         006E690D
 006E674E    cmp         dword ptr ds:[822708],4;gvar_00822708:Single
 006E6755    sete        al
 006E6758    call        00686074
 006E675D    fstp        qword ptr [esp]
 006E6760    wait
>006E6761    jmp         006E690D
 006E6766    mov         eax,dword ptr ds:[822700];gvar_00822700:Double
 006E676C    mov         dword ptr [esp],eax
 006E676F    mov         eax,dword ptr ds:[822704];gvar_00822704
 006E6775    mov         dword ptr [esp+4],eax
>006E6779    jmp         006E690D
 006E677E    test        dl,dl
>006E6780    je          006E6792
 006E6782    xor         eax,eax
 006E6784    call        00686074
 006E6789    fstp        qword ptr [esp]
 006E678C    wait
>006E678D    jmp         006E690D
 006E6792    mov         al,1
 006E6794    call        00686074
 006E6799    fstp        qword ptr [esp]
 006E679C    wait
>006E679D    jmp         006E690D
 006E67A2    test        dl,dl
>006E67A4    je          006E67B4
 006E67A6    xor         eax,eax
 006E67A8    mov         dword ptr [esp],eax
 006E67AB    mov         dword ptr [esp+4],eax
>006E67AF    jmp         006E690D
 006E67B4    fild        dword ptr ds:[8226AC];gvar_008226AC:Single
 006E67BA    fstp        qword ptr [esp]
 006E67BD    wait
>006E67BE    jmp         006E690D
 006E67C3    test        dl,dl
>006E67C5    je          006E67D5
 006E67C7    xor         eax,eax
 006E67C9    mov         dword ptr [esp],eax
 006E67CC    mov         dword ptr [esp+4],eax
>006E67D0    jmp         006E690D
 006E67D5    fild        dword ptr ds:[8226B0];gvar_008226B0:Single
 006E67DB    fstp        qword ptr [esp]
 006E67DE    wait
>006E67DF    jmp         006E690D
 006E67E4    test        dl,dl
>006E67E6    je          006E67F6
 006E67E8    xor         eax,eax
 006E67EA    mov         dword ptr [esp],eax
 006E67ED    mov         dword ptr [esp+4],eax
>006E67F1    jmp         006E690D
 006E67F6    mov         eax,dword ptr ds:[8226D0];gvar_008226D0:Double
 006E67FC    mov         dword ptr [esp],eax
 006E67FF    mov         eax,dword ptr ds:[8226D4];gvar_008226D4
 006E6805    mov         dword ptr [esp+4],eax
>006E6809    jmp         006E690D
 006E680E    test        dl,dl
>006E6810    je          006E6820
 006E6812    xor         eax,eax
 006E6814    mov         dword ptr [esp],eax
 006E6817    mov         dword ptr [esp+4],eax
>006E681B    jmp         006E690D
 006E6820    fild        dword ptr ds:[8226B4];gvar_008226B4:Single
 006E6826    fstp        qword ptr [esp]
 006E6829    wait
>006E682A    jmp         006E690D
 006E682F    test        dl,dl
>006E6831    je          006E6841
 006E6833    xor         eax,eax
 006E6835    mov         dword ptr [esp],eax
 006E6838    mov         dword ptr [esp+4],eax
>006E683C    jmp         006E690D
 006E6841    fild        dword ptr ds:[8226B8];gvar_008226B8:Single
 006E6847    fstp        qword ptr [esp]
 006E684A    wait
>006E684B    jmp         006E690D
 006E6850    test        dl,dl
>006E6852    je          006E6862
 006E6854    xor         eax,eax
 006E6856    mov         dword ptr [esp],eax
 006E6859    mov         dword ptr [esp+4],eax
>006E685D    jmp         006E690D
 006E6862    fild        dword ptr ds:[8226BC];gvar_008226BC:Single
 006E6868    fstp        qword ptr [esp]
 006E686B    wait
>006E686C    jmp         006E690D
 006E6871    test        dl,dl
>006E6873    je          006E6883
 006E6875    xor         eax,eax
 006E6877    mov         dword ptr [esp],eax
 006E687A    mov         dword ptr [esp+4],eax
>006E687E    jmp         006E690D
 006E6883    fild        dword ptr ds:[8226C0];gvar_008226C0:Single
 006E6889    fstp        qword ptr [esp]
 006E688C    wait
>006E688D    jmp         006E690D
 006E688F    test        dl,dl
>006E6891    je          006E689E
 006E6893    xor         eax,eax
 006E6895    mov         dword ptr [esp],eax
 006E6898    mov         dword ptr [esp+4],eax
>006E689C    jmp         006E690D
 006E689E    fild        dword ptr ds:[8226C8];gvar_008226C8:Single
 006E68A4    fstp        qword ptr [esp]
 006E68A7    wait
>006E68A8    jmp         006E690D
 006E68AA    test        dl,dl
>006E68AC    je          006E68B9
 006E68AE    xor         eax,eax
 006E68B0    mov         dword ptr [esp],eax
 006E68B3    mov         dword ptr [esp+4],eax
>006E68B7    jmp         006E690D
 006E68B9    fild        dword ptr ds:[8226C4];gvar_008226C4:Single
 006E68BF    fstp        qword ptr [esp]
 006E68C2    wait
>006E68C3    jmp         006E690D
 006E68C5    test        dl,dl
>006E68C7    je          006E68D4
 006E68C9    xor         eax,eax
 006E68CB    mov         dword ptr [esp],eax
 006E68CE    mov         dword ptr [esp+4],eax
>006E68D2    jmp         006E690D
 006E68D4    mov         eax,dword ptr ds:[8226D8];gvar_008226D8:Double
 006E68DA    mov         dword ptr [esp],eax
 006E68DD    mov         eax,dword ptr ds:[8226DC];gvar_008226DC
 006E68E3    mov         dword ptr [esp+4],eax
>006E68E7    jmp         006E690D
 006E68E9    test        dl,dl
>006E68EB    je          006E68F8
 006E68ED    xor         eax,eax
 006E68EF    mov         dword ptr [esp],eax
 006E68F2    mov         dword ptr [esp+4],eax
>006E68F6    jmp         006E690D
 006E68F8    fild        dword ptr ds:[822708];gvar_00822708:Single
 006E68FE    fstp        qword ptr [esp]
 006E6901    wait
>006E6902    jmp         006E690D
 006E6904    xor         eax,eax
 006E6906    mov         dword ptr [esp],eax
 006E6909    mov         dword ptr [esp+4],eax
 006E690D    fld         qword ptr [esp]
 006E6910    pop         ecx
 006E6911    pop         edx
 006E6912    ret
*}
end;

//006E6914
function TRowerValue.Module:TObject;
begin
{*
 006E6914    mov         eax,[00822720];gvar_00822720:TModuleRower
 006E6919    ret
*}
end;

//006E691C
procedure TRowerValue.SetValue(NewValue:Double);
begin
{*
 006E691C    push        ebp
 006E691D    mov         ebp,esp
 006E691F    mov         eax,dword ptr [eax+20];TRowerValue................................Item:Integer
 006E6922    sub         eax,1
>006E6925    jae         006E692B
 006E6927    xor         eax,eax
>006E6929    jmp         006E692D
 006E692B    xor         eax,eax
 006E692D    pop         ebp
 006E692E    ret         8
*}
end;

//006E6934
{*procedure TRowerValue.ToString(?:?);
begin
 006E6934    push        ebp
 006E6935    mov         ebp,esp
 006E6937    push        0
 006E6939    push        0
 006E693B    push        0
 006E693D    push        ebx
 006E693E    push        esi
 006E693F    push        edi
 006E6940    mov         esi,edx
 006E6942    mov         ebx,eax
 006E6944    xor         eax,eax
 006E6946    push        ebp
 006E6947    push        6E69C1
 006E694C    push        dword ptr fs:[eax]
 006E694F    mov         dword ptr fs:[eax],esp
 006E6952    mov         edi,dword ptr [ebx+18];TRowerValue.........................................................
 006E6955    test        edi,edi
>006E6957    jle         006E698C
 006E6959    push        6E69DC;'Rower'
 006E695E    lea         edx,[ebp-4]
 006E6961    mov         eax,edi
 006E6963    call        IntToStr
 006E6968    push        dword ptr [ebp-4]
 006E696B    push        6E69F4;'.'
 006E6970    lea         edx,[ebp-8]
 006E6973    mov         eax,dword ptr [ebx+20];TRowerValue.................................Item:Integer
 006E6976    call        006E7548
 006E697B    push        dword ptr [ebp-8]
 006E697E    mov         eax,esi
 006E6980    mov         edx,4
 006E6985    call        @UStrCatN
>006E698A    jmp         006E69A6
 006E698C    lea         edx,[ebp-0C]
 006E698F    mov         eax,dword ptr [ebx+20];TRowerValue..................................Item:Integer
 006E6992    call        006E7548
 006E6997    mov         ecx,dword ptr [ebp-0C]
 006E699A    mov         eax,esi
 006E699C    mov         edx,6E6A04;'Rower.'
 006E69A1    call        @UStrCat3
 006E69A6    xor         eax,eax
 006E69A8    pop         edx
 006E69A9    pop         ecx
 006E69AA    pop         ecx
 006E69AB    mov         dword ptr fs:[eax],edx
 006E69AE    push        6E69C8
 006E69B3    lea         eax,[ebp-0C]
 006E69B6    mov         edx,3
 006E69BB    call        @UStrArrayClr
 006E69C0    ret
>006E69C1    jmp         @HandleFinally
>006E69C6    jmp         006E69B3
 006E69C8    pop         edi
 006E69C9    pop         esi
 006E69CA    pop         ebx
 006E69CB    mov         esp,ebp
 006E69CD    pop         ebp
 006E69CE    ret
end;*}

//006E6A14
procedure sub_006E6A14;
begin
{*
 006E6A14    mov         byte ptr ds:[8226A8],0;gvar_008226A8
 006E6A1B    mov         byte ptr ds:[822717],0;gvar_00822717
 006E6A22    mov         byte ptr ds:[822719],0;gvar_00822719
 006E6A29    mov         byte ptr ds:[822714],0;gvar_00822714
 006E6A30    mov         byte ptr ds:[822710],0;gvar_00822710
 006E6A37    mov         byte ptr ds:[822711],0;gvar_00822711
 006E6A3E    mov         byte ptr ds:[822712],0;gvar_00822712
 006E6A45    mov         byte ptr ds:[822713],0;gvar_00822713
 006E6A4C    mov         byte ptr ds:[822715],0;gvar_00822715
 006E6A53    mov         byte ptr ds:[822716],0;gvar_00822716
 006E6A5A    mov         byte ptr ds:[822718],0;gvar_00822718
 006E6A61    ret
*}
end;

//006E6A64
procedure sub_006E6A64;
begin
{*
 006E6A64    ret
*}
end;

//006E6A68
procedure sub_006E6A68;
begin
{*
 006E6A68    push        ebp
 006E6A69    mov         ebp,esp
 006E6A6B    add         esp,0FFFFF3EC
 006E6A71    push        ebx
 006E6A72    push        esi
 006E6A73    push        edi
 006E6A74    xor         eax,eax
 006E6A76    mov         dword ptr [ebp-0C08],eax
 006E6A7C    mov         dword ptr [ebp-0C0C],eax
 006E6A82    mov         dword ptr [ebp-0C10],eax
 006E6A88    mov         dword ptr [ebp-0C14],eax
 006E6A8E    xor         eax,eax
 006E6A90    push        ebp
 006E6A91    push        6E6D59
 006E6A96    push        dword ptr fs:[eax]
 006E6A99    mov         dword ptr fs:[eax],esp
 006E6A9C    mov         byte ptr ds:[8226A9],0;gvar_008226A9
 006E6AA3    cmp         byte ptr ds:[8226A8],0;gvar_008226A8
>006E6AAA    je          006E6D3B
 006E6AB0    xor         eax,eax
 006E6AB2    mov         [008226AC],eax;gvar_008226AC:Single
 006E6AB7    xor         eax,eax
 006E6AB9    mov         dword ptr ds:[822700],eax;gvar_00822700:Double
 006E6ABF    mov         dword ptr ds:[822704],eax;gvar_00822704
 006E6AC5    call        RPPM3DDI.tkcmdsetDDI_init
 006E6ACA    movsx       ebx,ax
 006E6ACD    test        ebx,ebx
>006E6ACF    jne         006E6C92
 006E6AD5    xor         edx,edx
 006E6AD7    push        ebp
 006E6AD8    push        6E6B03
 006E6ADD    push        dword ptr fs:[edx]
 006E6AE0    mov         dword ptr fs:[edx],esp
 006E6AE3    lea         eax,[ebp-2]
 006E6AE6    push        eax
 006E6AE7    push        0
 006E6AE9    push        6E6D68
 006E6AEE    call        RPPM3DDI.tkcmdsetDDI_discover_pm3s
 006E6AF3    add         esp,0C
 006E6AF6    movsx       ebx,ax
 006E6AF9    xor         eax,eax
 006E6AFB    pop         edx
 006E6AFC    pop         ecx
 006E6AFD    pop         ecx
 006E6AFE    mov         dword ptr fs:[eax],edx
>006E6B01    jmp         006E6B52
>006E6B03    jmp         @HandleOnException
 006E6B08    dd          1
 006E6B0C    dd          00418C04;Exception
 006E6B10    dd          006E6B14
 006E6B14    mov         eax,6E6DC0;'To use the rower, you need to run GlovePIE as administrator!'
 006E6B19    call        004FA048
 006E6B1E    mov         eax,6E6E48;'Right-click GlovePIE.exe and choose "run as administrator"'
 006E6B23    call        004FA048
 006E6B28    mov         eax,6E6ECC;'Or choose properites, compatability, run as administrator.'
 006E6B2D    call        004FA048
 006E6B32    mov         eax,6E6F50;'You should exit now and run as administrator.'
 006E6B37    call        004FA048
 006E6B3C    xor         eax,eax
 006E6B3E    mov         [008226AC],eax;gvar_008226AC:Single
 006E6B43    call        @DoneExcept
>006E6B48    jmp         006E6D3B
 006E6B4D    call        @DoneExcept
 006E6B52    test        ebx,ebx
>006E6B54    je          006E6BD3
 006E6B56    xor         edx,edx
 006E6B58    push        ebp
 006E6B59    push        6E6B84
 006E6B5E    push        dword ptr fs:[edx]
 006E6B61    mov         dword ptr fs:[edx],esp
 006E6B64    lea         eax,[ebp-2]
 006E6B67    push        eax
 006E6B68    push        0
 006E6B6A    push        6E6FAC
 006E6B6F    call        RPPM3DDI.tkcmdsetDDI_discover_pm3s
 006E6B74    add         esp,0C
 006E6B77    movsx       ebx,ax
 006E6B7A    xor         eax,eax
 006E6B7C    pop         edx
 006E6B7D    pop         ecx
 006E6B7E    pop         ecx
 006E6B7F    mov         dword ptr fs:[eax],edx
>006E6B82    jmp         006E6BD3
>006E6B84    jmp         @HandleOnException
 006E6B89    dd          1
 006E6B8D    dd          00418C04;Exception
 006E6B91    dd          006E6B95
 006E6B95    mov         eax,6E6DC0;'To use the rower, you need to run GlovePIE as administrator!'
 006E6B9A    call        004FA048
 006E6B9F    mov         eax,6E6E48;'Right-click GlovePIE.exe and choose "run as administrator"'
 006E6BA4    call        004FA048
 006E6BA9    mov         eax,6E6ECC;'Or choose properites, compatability, run as administrator.'
 006E6BAE    call        004FA048
 006E6BB3    mov         eax,6E6F50;'You should exit now and run as administrator.'
 006E6BB8    call        004FA048
 006E6BBD    xor         eax,eax
 006E6BBF    mov         [008226AC],eax;gvar_008226AC:Single
 006E6BC4    call        @DoneExcept
>006E6BC9    jmp         006E6D3B
 006E6BCE    call        @DoneExcept
 006E6BD3    test        ebx,ebx
>006E6BD5    jne         006E6C8C
 006E6BDB    movzx       eax,word ptr [ebp-2]
 006E6BDF    mov         [008226AC],eax;gvar_008226AC:Single
 006E6BE4    cmp         word ptr [ebp-2],0
>006E6BE9    jbe         006E6BF2
 006E6BEB    mov         byte ptr ds:[8226A9],1;gvar_008226A9
 006E6BF2    movzx       esi,word ptr [ebp-2]
 006E6BF6    dec         esi
 006E6BF7    test        si,si
>006E6BFA    jb          006E6C36
 006E6BFC    inc         esi
 006E6BFD    xor         edi,edi
 006E6BFF    lea         eax,[ebp-204]
 006E6C05    push        eax
 006E6C06    push        edi
 006E6C07    call        RPPM3DDI.tkcmdsetDDI_serial_number
 006E6C0C    add         esp,8
 006E6C0F    movsx       ebx,ax
 006E6C12    test        ebx,ebx
>006E6C14    jne         006E6C30
 006E6C16    test        di,di
>006E6C19    jne         006E6C30
 006E6C1B    mov         eax,82270C;gvar_0082270C:UnicodeString
 006E6C20    lea         edx,[ebp-204]
 006E6C26    mov         ecx,100
 006E6C2B    call        @UStrFromWArray
 006E6C30    inc         edi
 006E6C31    dec         si
>006E6C34    jne         006E6BFF
 006E6C36    push        64
 006E6C38    call        RPPM3Csafe.tkcmdsetCSAFE_init_protocol
 006E6C3D    pop         ecx
 006E6C3E    movsx       ebx,ax
 006E6C41    test        ebx,ebx
>006E6C43    jne         006E6C92
 006E6C45    mov         dword ptr [ebp-804],0A1
 006E6C4F    mov         word ptr [ebp-4],0D5
 006E6C55    lea         eax,[ebp-0C04]
 006E6C5B    push        eax
 006E6C5C    lea         eax,[ebp-4]
 006E6C5F    push        eax
 006E6C60    lea         eax,[ebp-804]
 006E6C66    push        eax
 006E6C67    push        1
 006E6C69    push        0
 006E6C6B    call        RPPM3Csafe.tkcmdsetCSAFE_command
 006E6C70    add         esp,14
 006E6C73    movsx       ebx,ax
 006E6C76    test        ebx,ebx
>006E6C78    jne         006E6C92
 006E6C7A    movzx       esi,word ptr [ebp-4]
 006E6C7E    dec         esi
 006E6C7F    test        si,si
>006E6C82    jb          006E6C92
 006E6C84    inc         esi
 006E6C85    dec         si
>006E6C88    jne         006E6C85
>006E6C8A    jmp         006E6C92
 006E6C8C    mov         word ptr [ebp-2],0
 006E6C92    test        ebx,ebx
>006E6C94    je          006E6D3B
 006E6C9A    push        200
 006E6C9F    lea         eax,[ebp-204]
 006E6CA5    push        eax
 006E6CA6    mov         esi,ebx
 006E6CA8    push        esi
 006E6CA9    call        RPPM3DDI.tkcmdsetDDI_get_error_name
 006E6CAE    add         esp,0C
 006E6CB1    push        200
 006E6CB6    lea         eax,[ebp-404]
 006E6CBC    push        eax
 006E6CBD    push        esi
 006E6CBE    call        RPPM3DDI.tkcmdsetDDI_get_error_text
 006E6CC3    add         esp,0C
 006E6CC6    push        6E7004;'Rower Error '
 006E6CCB    lea         edx,[ebp-0C0C]
 006E6CD1    mov         eax,ebx
 006E6CD3    call        IntToStr
 006E6CD8    push        dword ptr [ebp-0C0C]
 006E6CDE    push        6E702C;': '
 006E6CE3    lea         eax,[ebp-0C10]
 006E6CE9    lea         edx,[ebp-204]
 006E6CEF    mov         ecx,100
 006E6CF4    call        @UStrFromWArray
 006E6CF9    push        dword ptr [ebp-0C10]
 006E6CFF    push        6E702C;': '
 006E6D04    lea         eax,[ebp-0C14]
 006E6D0A    lea         edx,[ebp-404]
 006E6D10    mov         ecx,100
 006E6D15    call        @UStrFromWArray
 006E6D1A    push        dword ptr [ebp-0C14]
 006E6D20    lea         eax,[ebp-0C08]
 006E6D26    mov         edx,6
 006E6D2B    call        @UStrCatN
 006E6D30    mov         eax,dword ptr [ebp-0C08]
 006E6D36    call        004FA048
 006E6D3B    xor         eax,eax
 006E6D3D    pop         edx
 006E6D3E    pop         ecx
 006E6D3F    pop         ecx
 006E6D40    mov         dword ptr fs:[eax],edx
 006E6D43    push        6E6D60
 006E6D48    lea         eax,[ebp-0C14]
 006E6D4E    mov         edx,4
 006E6D53    call        @UStrArrayClr
 006E6D58    ret
>006E6D59    jmp         @HandleFinally
>006E6D5E    jmp         006E6D48
 006E6D60    pop         edi
 006E6D61    pop         esi
 006E6D62    pop         ebx
 006E6D63    mov         esp,ebp
 006E6D65    pop         ebp
 006E6D66    ret
*}
end;

//006E7034
procedure sub_006E7034;
begin
{*
 006E7034    movzx       eax,byte ptr ds:[8226A8];gvar_008226A8
 006E703B    and         al,byte ptr ds:[8226A9];gvar_008226A9
>006E7041    je          006E7052
 006E7043    push        0
 006E7045    call        RPPM3DDI.tkcmdsetDDI_shutdown
 006E704A    pop         ecx
 006E704B    mov         byte ptr ds:[8226A9],0;gvar_008226A9
 006E7052    ret
*}
end;

//006E7054
procedure sub_006E7054;
begin
{*
 006E7054    push        ebx
 006E7055    add         esp,0FFFFFDEC
 006E705B    xor         ebx,ebx
 006E705D    movzx       eax,byte ptr ds:[8226A8];gvar_008226A8
 006E7064    and         al,byte ptr ds:[8226A9];gvar_008226A9
>006E706A    je          006E74C5
 006E7070    cmp         byte ptr ds:[822715],0;gvar_00822715
>006E7077    je          006E70C3
 006E7079    mov         dword ptr [esp+4],0A0
 006E7081    lea         eax,[esp+104]
 006E7088    push        eax
 006E7089    lea         eax,[esp+4]
 006E708D    push        eax
 006E708E    lea         eax,[esp+0C]
 006E7092    push        eax
 006E7093    push        1
 006E7095    push        0
 006E7097    call        RPPM3Csafe.tkcmdsetCSAFE_command
 006E709C    add         esp,14
 006E709F    movsx       ebx,ax
 006E70A2    imul        eax,dword ptr [esp+10C],168
 006E70AD    imul        edx,dword ptr [esp+110],3C
 006E70B5    add         eax,edx
 006E70B7    add         eax,dword ptr [esp+114]
 006E70BE    mov         [008226C4],eax;gvar_008226C4:Single
 006E70C3    cmp         byte ptr ds:[822710],0;gvar_00822710
>006E70CA    je          006E710B
 006E70CC    mov         dword ptr [esp+4],0A1
 006E70D4    lea         eax,[esp+104]
 006E70DB    push        eax
 006E70DC    lea         eax,[esp+4]
 006E70E0    push        eax
 006E70E1    lea         eax,[esp+0C]
 006E70E5    push        eax
 006E70E6    push        1
 006E70E8    push        0
 006E70EA    call        RPPM3Csafe.tkcmdsetCSAFE_command
 006E70EF    add         esp,14
 006E70F2    movsx       ebx,ax
 006E70F5    mov         eax,dword ptr [esp+110]
 006E70FC    shl         eax,8
 006E70FF    add         eax,dword ptr [esp+10C]
 006E7106    mov         [008226B0],eax;gvar_008226B0:Single
 006E710B    cmp         byte ptr ds:[822713],0;gvar_00822713
>006E7112    je          006E7153
 006E7114    mov         dword ptr [esp+4],0A3
 006E711C    lea         eax,[esp+104]
 006E7123    push        eax
 006E7124    lea         eax,[esp+4]
 006E7128    push        eax
 006E7129    lea         eax,[esp+0C]
 006E712D    push        eax
 006E712E    push        1
 006E7130    push        0
 006E7132    call        RPPM3Csafe.tkcmdsetCSAFE_command
 006E7137    add         esp,14
 006E713A    movsx       ebx,ax
 006E713D    mov         eax,dword ptr [esp+110]
 006E7144    shl         eax,8
 006E7147    add         eax,dword ptr [esp+10C]
 006E714E    mov         [008226BC],eax;gvar_008226BC:Single
 006E7153    cmp         byte ptr ds:[822711],0;gvar_00822711
>006E715A    je          006E719B
 006E715C    mov         dword ptr [esp+4],0A6
 006E7164    lea         eax,[esp+104]
 006E716B    push        eax
 006E716C    lea         eax,[esp+4]
 006E7170    push        eax
 006E7171    lea         eax,[esp+0C]
 006E7175    push        eax
 006E7176    push        1
 006E7178    push        0
 006E717A    call        RPPM3Csafe.tkcmdsetCSAFE_command
 006E717F    add         esp,14
 006E7182    movsx       ebx,ax
 006E7185    mov         eax,dword ptr [esp+110]
 006E718C    shl         eax,8
 006E718F    add         eax,dword ptr [esp+10C]
 006E7196    mov         [008226B4],eax;gvar_008226B4:Single
 006E719B    cmp         byte ptr ds:[822712],0;gvar_00822712
>006E71A2    je          006E71E3
 006E71A4    mov         dword ptr [esp+4],0A7
 006E71AC    lea         eax,[esp+104]
 006E71B3    push        eax
 006E71B4    lea         eax,[esp+4]
 006E71B8    push        eax
 006E71B9    lea         eax,[esp+0C]
 006E71BD    push        eax
 006E71BE    push        1
 006E71C0    push        0
 006E71C2    call        RPPM3Csafe.tkcmdsetCSAFE_command
 006E71C7    add         esp,14
 006E71CA    movsx       ebx,ax
 006E71CD    mov         eax,dword ptr [esp+110]
 006E71D4    shl         eax,8
 006E71D7    add         eax,dword ptr [esp+10C]
 006E71DE    mov         [008226B8],eax;gvar_008226B8:Single
 006E71E3    cmp         byte ptr ds:[822714],0;gvar_00822714
>006E71EA    je          006E7221
 006E71EC    mov         dword ptr [esp+4],0B0
 006E71F4    lea         eax,[esp+104]
 006E71FB    push        eax
 006E71FC    lea         eax,[esp+4]
 006E7200    push        eax
 006E7201    lea         eax,[esp+0C]
 006E7205    push        eax
 006E7206    push        1
 006E7208    push        0
 006E720A    call        RPPM3Csafe.tkcmdsetCSAFE_command
 006E720F    add         esp,14
 006E7212    movsx       ebx,ax
 006E7215    mov         eax,dword ptr [esp+10C]
 006E721C    mov         [008226C0],eax;gvar_008226C0:Single
 006E7221    cmp         byte ptr ds:[822716],0;gvar_00822716
>006E7228    je          006E7269
 006E722A    mov         dword ptr [esp+4],0B4
 006E7232    lea         eax,[esp+104]
 006E7239    push        eax
 006E723A    lea         eax,[esp+4]
 006E723E    push        eax
 006E723F    lea         eax,[esp+0C]
 006E7243    push        eax
 006E7244    push        1
 006E7246    push        0
 006E7248    call        RPPM3Csafe.tkcmdsetCSAFE_command
 006E724D    add         esp,14
 006E7250    movsx       ebx,ax
 006E7253    mov         eax,dword ptr [esp+110]
 006E725A    shl         eax,8
 006E725D    add         eax,dword ptr [esp+10C]
 006E7264    mov         [008226C8],eax;gvar_008226C8:Single
 006E7269    cmp         byte ptr ds:[822717],0;gvar_00822717
>006E7270    je          006E73B1
 006E7276    mov         eax,[0078CB88];^gvar_0078BDC0
 006E727B    test        byte ptr [eax],3
>006E727E    jne         006E72A4
 006E7280    call        00682F08
 006E7285    fstp        qword ptr ds:[8226E8];gvar_008226E8:Double
 006E728B    wait
 006E728C    mov         eax,dword ptr ds:[8226D0];gvar_008226D0:Double
 006E7292    mov         dword ptr ds:[8226E0],eax;gvar_008226E0:Double
 006E7298    mov         eax,dword ptr ds:[8226D4];gvar_008226D4
 006E729E    mov         dword ptr ds:[8226E4],eax;gvar_008226E4
 006E72A4    mov         dword ptr [esp+4],1A
 006E72AC    mov         dword ptr [esp+8],1
 006E72B4    mov         dword ptr [esp+0C],0A3
 006E72BC    lea         eax,[esp+104]
 006E72C3    push        eax
 006E72C4    lea         eax,[esp+4]
 006E72C8    push        eax
 006E72C9    lea         eax,[esp+0C]
 006E72CD    push        eax
 006E72CE    push        3
 006E72D0    push        0
 006E72D2    call        RPPM3Csafe.tkcmdsetCSAFE_command
 006E72D7    add         esp,14
 006E72DA    movsx       ebx,ax
 006E72DD    mov         eax,dword ptr [esp+118]
 006E72E4    shl         eax,8
 006E72E7    add         eax,dword ptr [esp+114]
 006E72EE    mov         edx,dword ptr [esp+11C]
 006E72F5    shl         edx,8
 006E72F8    shl         edx,8
 006E72FB    add         eax,edx
 006E72FD    mov         edx,dword ptr [esp+120]
 006E7304    shl         edx,8
 006E7307    shl         edx,8
 006E730A    shl         edx,8
 006E730D    add         eax,edx
 006E730F    mov         dword ptr [esp+204],eax
 006E7316    xor         eax,eax
 006E7318    mov         dword ptr [esp+208],eax
 006E731F    fild        qword ptr [esp+204]
 006E7326    fld         tbyte ptr ds:[6E74D8];0.1:Extended
 006E732C    fmulp       st(1),st
 006E732E    mov         eax,dword ptr [esp+124]
 006E7335    mov         dword ptr [esp+20C],eax
 006E733C    xor         eax,eax
 006E733E    mov         dword ptr [esp+210],eax
 006E7345    fild        qword ptr [esp+20C]
 006E734C    fld         tbyte ptr ds:[6E74D8];0.1:Extended
 006E7352    fmulp       st(1),st
 006E7354    faddp       st(1),st
 006E7356    fstp        qword ptr ds:[8226D0];gvar_008226D0:Double
 006E735C    wait
 006E735D    mov         eax,[0078CB88];^gvar_0078BDC0
 006E7362    test        byte ptr [eax],3F
>006E7365    jne         006E73B1
 006E7367    call        00682F08
 006E736C    fsub        qword ptr ds:[8226E8];gvar_008226E8:Double
 006E7372    fstp        qword ptr ds:[8226F8];gvar_008226F8:Double
 006E7378    wait
 006E7379    fld         qword ptr ds:[8226D0];gvar_008226D0:Double
 006E737F    fsub        qword ptr ds:[8226E0];gvar_008226E0:Double
 006E7385    fstp        qword ptr ds:[8226F0];gvar_008226F0:Double
 006E738B    wait
 006E738C    fld         qword ptr ds:[8226F8];gvar_008226F8:Double
 006E7392    fcomp       dword ptr ds:[6E74E4];0:Single
 006E7398    wait
 006E7399    fnstsw      al
 006E739B    sahf
>006E739C    jbe         006E73B1
 006E739E    fld         qword ptr ds:[8226F0];gvar_008226F0:Double
 006E73A4    fdiv        qword ptr ds:[8226F8];gvar_008226F8:Double
 006E73AA    fstp        qword ptr ds:[822700];gvar_00822700:Double
 006E73B0    wait
 006E73B1    cmp         byte ptr ds:[822718],0;gvar_00822718
>006E73B8    je          006E7477
 006E73BE    mov         dword ptr [esp+4],1A
 006E73C6    mov         dword ptr [esp+8],1
 006E73CE    mov         dword ptr [esp+0C],0A0
 006E73D6    lea         eax,[esp+104]
 006E73DD    push        eax
 006E73DE    lea         eax,[esp+4]
 006E73E2    push        eax
 006E73E3    lea         eax,[esp+0C]
 006E73E7    push        eax
 006E73E8    push        3
 006E73EA    push        0
 006E73EC    call        RPPM3Csafe.tkcmdsetCSAFE_command
 006E73F1    add         esp,14
 006E73F4    movsx       ebx,ax
 006E73F7    mov         eax,dword ptr [esp+118]
 006E73FE    shl         eax,8
 006E7401    add         eax,dword ptr [esp+114]
 006E7408    mov         edx,dword ptr [esp+11C]
 006E740F    shl         edx,8
 006E7412    shl         edx,8
 006E7415    add         eax,edx
 006E7417    mov         edx,dword ptr [esp+120]
 006E741E    shl         edx,8
 006E7421    shl         edx,8
 006E7424    shl         edx,8
 006E7427    add         eax,edx
 006E7429    mov         dword ptr [esp+204],eax
 006E7430    xor         eax,eax
 006E7432    mov         dword ptr [esp+208],eax
 006E7439    fild        qword ptr [esp+204]
 006E7440    fld         tbyte ptr ds:[6E74E8];0.01:Extended
 006E7446    fmulp       st(1),st
 006E7448    mov         eax,dword ptr [esp+124]
 006E744F    mov         dword ptr [esp+20C],eax
 006E7456    xor         eax,eax
 006E7458    mov         dword ptr [esp+210],eax
 006E745F    fild        qword ptr [esp+20C]
 006E7466    fld         tbyte ptr ds:[6E74E8];0.01:Extended
 006E746C    fmulp       st(1),st
 006E746E    faddp       st(1),st
 006E7470    fstp        qword ptr ds:[8226D8];gvar_008226D8:Double
 006E7476    wait
 006E7477    cmp         byte ptr ds:[822719],0;gvar_00822719
>006E747E    je          006E74C5
 006E7480    mov         dword ptr [esp+4],1A
 006E7488    mov         dword ptr [esp+8],1
 006E7490    mov         dword ptr [esp+0C],0BF
 006E7498    lea         eax,[esp+104]
 006E749F    push        eax
 006E74A0    lea         eax,[esp+4]
 006E74A4    push        eax
 006E74A5    lea         eax,[esp+0C]
 006E74A9    push        eax
 006E74AA    push        3
 006E74AC    push        0
 006E74AE    call        RPPM3Csafe.tkcmdsetCSAFE_command
 006E74B3    add         esp,14
 006E74B6    movsx       ebx,ax
 006E74B9    mov         eax,dword ptr [esp+114]
 006E74C0    mov         [00822708],eax;gvar_00822708:Single
 006E74C5    test        ebx,ebx
>006E74C7    je          006E74CD
 006E74C9    xor         eax,eax
>006E74CB    jmp         006E74CF
 006E74CD    mov         al,1
 006E74CF    add         esp,214
 006E74D5    pop         ebx
 006E74D6    ret
*}
end;

//006E74F4
{*function sub_006E74F4(?:UnicodeString):?;
begin
 006E74F4    push        ebp
 006E74F5    mov         ebp,esp
 006E74F7    push        ecx
 006E74F8    push        ebx
 006E74F9    mov         dword ptr [ebp-4],eax
 006E74FC    mov         eax,dword ptr [ebp-4]
 006E74FF    call        @UStrAddRef
 006E7504    xor         eax,eax
 006E7506    push        ebp
 006E7507    push        6E753A
 006E750C    push        dword ptr fs:[eax]
 006E750F    mov         dword ptr fs:[eax],esp
 006E7512    mov         eax,[00822720];gvar_00822720:TModuleRower
 006E7517    mov         eax,dword ptr [eax+1C]
 006E751A    mov         edx,dword ptr [ebp-4]
 006E751D    call        THashTable.Get
 006E7522    mov         ebx,eax
 006E7524    xor         eax,eax
 006E7526    pop         edx
 006E7527    pop         ecx
 006E7528    pop         ecx
 006E7529    mov         dword ptr fs:[eax],edx
 006E752C    push        6E7541
 006E7531    lea         eax,[ebp-4]
 006E7534    call        @UStrClr
 006E7539    ret
>006E753A    jmp         @HandleFinally
>006E753F    jmp         006E7531
 006E7541    mov         eax,ebx
 006E7543    pop         ebx
 006E7544    pop         ecx
 006E7545    pop         ebp
 006E7546    ret
end;*}

//006E7548
{*procedure sub_006E7548(?:Integer; ?:?);
begin
 006E7548    push        ebx
 006E7549    push        esi
 006E754A    mov         esi,edx
 006E754C    mov         ebx,eax
 006E754E    mov         ecx,esi
 006E7550    mov         eax,[00822720];gvar_00822720:TModuleRower
 006E7555    mov         eax,dword ptr [eax+1C]
 006E7558    mov         edx,ebx
 006E755A    call        THashTable.Get
 006E755F    pop         esi
 006E7560    pop         ebx
 006E7561    ret
end;*}

//006E7564
{*function sub_006E7564:?;
begin
 006E7564    push        ebx
 006E7565    mov         dl,1
 006E7567    mov         eax,[0043C7BC];TStringList
 006E756C    call        TStringList.Create;TStringList.Create
 006E7571    mov         ebx,eax
 006E7573    mov         edx,6E7590;^338:Single
 006E7578    mov         eax,ebx
 006E757A    mov         ecx,dword ptr [eax]
 006E757C    call        dword ptr [ecx+38];TStringList.Add
 006E757F    mov         eax,ebx
 006E7581    pop         ebx
 006E7582    ret
end;*}

//006E75A4
procedure TModuleRower.AddFields;
begin
{*
 006E75A4    push        ebx
 006E75A5    mov         ebx,eax
 006E75A7    xor         ecx,ecx
 006E75A9    mov         edx,6E76D4;'Exists'
 006E75AE    mov         eax,dword ptr [ebx+1C];TModuleRower.Fields:THashTable
 006E75B1    call        THashTable.Add
 006E75B6    mov         ecx,1
 006E75BB    mov         edx,6E76F0;'Count'
 006E75C0    mov         eax,dword ptr [ebx+1C];TModuleRower.Fields:THashTable
 006E75C3    call        THashTable.Add
 006E75C8    mov         ecx,2
 006E75CD    mov         edx,6E7708;^338:Single
 006E75D2    mov         eax,dword ptr [ebx+1C];TModuleRower.Fields:THashTable
 006E75D5    call        THashTable.Add
 006E75DA    mov         ecx,3
 006E75DF    mov         edx,6E7728;'Pace'
 006E75E4    mov         eax,dword ptr [ebx+1C];TModuleRower.Fields:THashTable
 006E75E7    call        THashTable.Add
 006E75EC    mov         ecx,4
 006E75F1    mov         edx,6E7740;'Cadence'
 006E75F6    mov         eax,dword ptr [ebx+1C];TModuleRower.Fields:THashTable
 006E75F9    call        THashTable.Add
 006E75FE    mov         ecx,5
 006E7603    mov         edx,6E775C;'Calories'
 006E7608    mov         eax,dword ptr [ebx+1C];TModuleRower.Fields:THashTable
 006E760B    call        THashTable.Add
 006E7610    mov         ecx,6
 006E7615    mov         edx,6E777C;'HeartRate'
 006E761A    mov         eax,dword ptr [ebx+1C];TModuleRower.Fields:THashTable
 006E761D    call        THashTable.Add
 006E7622    mov         ecx,7
 006E7627    mov         edx,6E779C;'Time2'
 006E762C    mov         eax,dword ptr [ebx+1C];TModuleRower.Fields:THashTable
 006E762F    call        THashTable.Add
 006E7634    mov         ecx,0A
 006E7639    mov         edx,6E77B4;'Time'
 006E763E    mov         eax,dword ptr [ebx+1C];TModuleRower.Fields:THashTable
 006E7641    call        THashTable.Add
 006E7646    mov         ecx,8
 006E764B    mov         edx,6E77CC;'Power'
 006E7650    mov         eax,dword ptr [ebx+1C];TModuleRower.Fields:THashTable
 006E7653    call        THashTable.Add
 006E7658    mov         ecx,9
 006E765D    mov         edx,6E77E4;^338:Single
 006E7662    mov         eax,dword ptr [ebx+1C];TModuleRower.Fields:THashTable
 006E7665    call        THashTable.Add
 006E766A    mov         ecx,0C
 006E766F    mov         edx,6E7804;'Speed'
 006E7674    mov         eax,dword ptr [ebx+1C];TModuleRower.Fields:THashTable
 006E7677    call        THashTable.Add
 006E767C    mov         ecx,0B
 006E7681    mov         edx,6E781C;'StrokeState'
 006E7686    mov         eax,dword ptr [ebx+1C];TModuleRower.Fields:THashTable
 006E7689    call        THashTable.Add
 006E768E    mov         ecx,0D
 006E7693    mov         edx,6E7840;'Pulling'
 006E7698    mov         eax,dword ptr [ebx+1C];TModuleRower.Fields:THashTable
 006E769B    call        THashTable.Add
 006E76A0    mov         ecx,0E
 006E76A5    mov         edx,6E785C;'Holding'
 006E76AA    mov         eax,dword ptr [ebx+1C];TModuleRower.Fields:THashTable
 006E76AD    call        THashTable.Add
 006E76B2    mov         ecx,0F
 006E76B7    mov         edx,6E7878;'Releasing'
 006E76BC    mov         eax,dword ptr [ebx+1C];TModuleRower.Fields:THashTable
 006E76BF    call        THashTable.Add
 006E76C4    pop         ebx
 006E76C5    ret
*}
end;

//006E788C
procedure TModuleRower.ClearRead;
begin
{*
 006E788C    call        TPieModule.ClearRead
 006E7891    ret
*}
end;

//006E7894
constructor TModuleRower.Create;
begin
{*
 006E7894    push        ebx
 006E7895    push        esi
 006E7896    test        dl,dl
>006E7898    je          006E78A2
 006E789A    add         esp,0FFFFFFF0
 006E789D    call        @ClassCreate
 006E78A2    mov         ebx,edx
 006E78A4    mov         esi,eax
 006E78A6    push        6E78E8;'Ergo'
 006E78AB    push        6E7900;'Erg'
 006E78B0    push        0
 006E78B2    push        0
 006E78B4    mov         ecx,6E7914;'Rower'
 006E78B9    xor         edx,edx
 006E78BB    mov         eax,esi
 006E78BD    call        005E4830
 006E78C2    mov         eax,esi
 006E78C4    test        bl,bl
>006E78C6    je          006E78D7
 006E78C8    call        @AfterConstruction
 006E78CD    pop         dword ptr fs:[0]
 006E78D4    add         esp,0C
 006E78D7    mov         eax,esi
 006E78D9    pop         esi
 006E78DA    pop         ebx
 006E78DB    ret
*}
end;

//006E7920
function TModuleRower.CreateValue(Identifier:string):TExpression;
begin
{*
 006E7920    push        ebp
 006E7921    mov         ebp,esp
 006E7923    push        ecx
 006E7924    push        ebx
 006E7925    mov         dword ptr [ebp-4],edx
 006E7928    mov         ebx,eax
 006E792A    mov         eax,dword ptr [ebp-4]
 006E792D    call        @UStrAddRef
 006E7932    xor         eax,eax
 006E7934    push        ebp
 006E7935    push        6E7964
 006E793A    push        dword ptr fs:[eax]
 006E793D    mov         dword ptr fs:[eax],esp
 006E7940    mov         byte ptr [ebx+24],1;TModuleRower.Used:Boolean
 006E7944    mov         eax,dword ptr [ebp-4]
 006E7947    call        006E63A4
 006E794C    mov         ebx,eax
 006E794E    xor         eax,eax
 006E7950    pop         edx
 006E7951    pop         ecx
 006E7952    pop         ecx
 006E7953    mov         dword ptr fs:[eax],edx
 006E7956    push        6E796B
 006E795B    lea         eax,[ebp-4]
 006E795E    call        @UStrClr
 006E7963    ret
>006E7964    jmp         @HandleFinally
>006E7969    jmp         006E795B
 006E796B    mov         eax,ebx
 006E796D    pop         ebx
 006E796E    pop         ecx
 006E796F    pop         ebp
 006E7970    ret
*}
end;

//006E7974
function TModuleRower.GetDefaultFormat(field:string):TGuiFormat;
begin
{*
 006E7974    push        ebp
 006E7975    mov         ebp,esp
 006E7977    push        ecx
 006E7978    push        ebx
 006E7979    mov         dword ptr [ebp-4],edx
 006E797C    mov         ebx,eax
 006E797E    mov         eax,dword ptr [ebp-4]
 006E7981    call        @UStrAddRef
 006E7986    xor         eax,eax
 006E7988    push        ebp
 006E7989    push        6E79C0
 006E798E    push        dword ptr fs:[eax]
 006E7991    mov         dword ptr fs:[eax],esp
 006E7994    mov         edx,dword ptr [ebp-4]
 006E7997    mov         eax,dword ptr [ebx+1C];TModuleRower.Fields:THashTable
 006E799A    call        THashTable.Get
 006E799F    sub         eax,1
>006E79A2    jae         006E79A8
 006E79A4    xor         ebx,ebx
>006E79A6    jmp         006E79AA
 006E79A8    mov         bl,9
 006E79AA    xor         eax,eax
 006E79AC    pop         edx
 006E79AD    pop         ecx
 006E79AE    pop         ecx
 006E79AF    mov         dword ptr fs:[eax],edx
 006E79B2    push        6E79C7
 006E79B7    lea         eax,[ebp-4]
 006E79BA    call        @UStrClr
 006E79BF    ret
>006E79C0    jmp         @HandleFinally
>006E79C5    jmp         006E79B7
 006E79C7    mov         eax,ebx
 006E79C9    pop         ebx
 006E79CA    pop         ecx
 006E79CB    pop         ebp
 006E79CC    ret
*}
end;

//006E79D0
procedure TModuleRower.GetGoodFields;
begin
{*
 006E79D0    call        006E7564
 006E79D5    ret
*}
end;

//006E79D8
procedure TModuleRower.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 006E79D8    push        ebp
 006E79D9    mov         ebp,esp
 006E79DB    mov         byte ptr [edx],1
 006E79DE    pop         ebp
 006E79DF    ret         4
*}
end;

//006E79E4
procedure TModuleRower.PrepareForGUI;
begin
{*
 006E79E4    ret
*}
end;

//006E79E8
procedure TModuleRower.PrepareForMonitoring;
begin
{*
 006E79E8    ret
*}
end;

//006E79EC
procedure TModuleRower.Read;
begin
{*
 006E79EC    call        006E7054
 006E79F1    ret
*}
end;

//006E79F4
procedure TModuleRower.StartCompiletime;
begin
{*
 006E79F4    call        TPieModule.StartCompiletime
 006E79F9    call        006E6A14
 006E79FE    ret
*}
end;

//006E7A00
procedure TModuleRower.StartMonitoring;
begin
{*
 006E7A00    ret
*}
end;

//006E7A04
procedure TModuleRower.StartRuntime;
begin
{*
 006E7A04    call        TPieModule.StartRuntime
 006E7A09    call        006E6A68
 006E7A0E    ret
*}
end;

//006E7A10
procedure TModuleRower.StopCompiletime;
begin
{*
 006E7A10    push        ebx
 006E7A11    mov         ebx,eax
 006E7A13    call        006E6A64
 006E7A18    mov         eax,ebx
 006E7A1A    call        TPieModule.StopCompiletime
 006E7A1F    pop         ebx
 006E7A20    ret
*}
end;

//006E7A24
procedure TModuleRower.StopMonitoring;
begin
{*
 006E7A24    ret
*}
end;

//006E7A28
procedure TModuleRower.StopRuntime;
begin
{*
 006E7A28    push        ebx
 006E7A29    mov         ebx,eax
 006E7A2B    call        006E7034
 006E7A30    mov         eax,ebx
 006E7A32    call        TPieModule.StopRuntime
 006E7A37    pop         ebx
 006E7A38    ret
*}
end;

Initialization
//00782BE0
{*
 00782BE0    push        ebp
 00782BE1    mov         ebp,esp
 00782BE3    xor         eax,eax
 00782BE5    push        ebp
 00782BE6    push        782C23
 00782BEB    push        dword ptr fs:[eax]
 00782BEE    mov         dword ptr fs:[eax],esp
 00782BF1    sub         dword ptr ds:[82271C],1
>00782BF8    jae         00782C15
 00782BFA    mov         dl,1
 00782BFC    mov         eax,[006E5F14];TModuleRower
 00782C01    call        TModuleRower.Create;TModuleRower.Create
 00782C06    mov         [00822720],eax;gvar_00822720:TModuleRower
 00782C0B    mov         eax,[00822720];gvar_00822720:TModuleRower
 00782C10    call        005E31AC
 00782C15    xor         eax,eax
 00782C17    pop         edx
 00782C18    pop         ecx
 00782C19    pop         ecx
 00782C1A    mov         dword ptr fs:[eax],edx
 00782C1D    push        782C2A
 00782C22    ret
>00782C23    jmp         @HandleFinally
>00782C28    jmp         00782C22
 00782C2A    pop         ebp
 00782C2B    ret
*}
Finalization
//006E7A3C
{*
 006E7A3C    push        ebp
 006E7A3D    mov         ebp,esp
 006E7A3F    xor         eax,eax
 006E7A41    push        ebp
 006E7A42    push        6E7A72
 006E7A47    push        dword ptr fs:[eax]
 006E7A4A    mov         dword ptr fs:[eax],esp
 006E7A4D    inc         dword ptr ds:[82271C]
>006E7A53    jne         006E7A64
 006E7A55    call        006E7034
 006E7A5A    mov         eax,82270C;gvar_0082270C:UnicodeString
 006E7A5F    call        @UStrClr
 006E7A64    xor         eax,eax
 006E7A66    pop         edx
 006E7A67    pop         ecx
 006E7A68    pop         ecx
 006E7A69    mov         dword ptr fs:[eax],edx
 006E7A6C    push        6E7A79
 006E7A71    ret
>006E7A72    jmp         @HandleFinally
>006E7A77    jmp         006E7A71
 006E7A79    pop         ebp
 006E7A7A    ret
*}
end.