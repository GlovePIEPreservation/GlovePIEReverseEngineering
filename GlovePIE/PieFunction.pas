//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieFunction;

interface

uses
  SysUtils, Classes, Contnrs, UxTheme, CommCtrl;

type
  TMathsFunction = class(TExpression)
  published
    destructor Destroy();//00670774
    //procedure ToString(?:?);//006771C0
    constructor Create;//00670734
    procedure ppu(i:Integer);//00676D30
    procedure pppu(i:Integer);//00676CF8
    procedure CreateClone;//006772B8
    procedure GetRotMat(m:TRotMat);//006779FC
    procedure Swallow;//00677330
    //procedure GetString(?:?);//0067768C
    procedure FillClone(c:TExpression);//006772C8
    procedure GetVector(x:Double; y:Double; z:Double);//00677360
    function GetPerUnits2:TUnits;//00676F9C
    procedure GetValue;//00670D30
    function GetPerUnits1:TUnits;//00676D68
    function GetDataType:TDataType;//006707AC
    function GetUnits:TUnits;//00676A20
    function p(i:Integer):Double;//00670C14
    procedure sp(i:Integer; ?:UnicodeString);//006772F0
    procedure pu(i:Integer);//00676CC0
    procedure bp(i:Integer);//00670CF8
    function ap(i:Integer):Double;//00670C94
    function ip(i:Integer):Integer;//00670C5C
  public
    Parameters:TObjectList;//f18
    FunctionNumber:Integer;//f1C
    //procedure ToString(?:?); virtual;//006771C0
    destructor Destroy(); virtual;//00670774
    procedure GetValue; virtual;//v2C//00670D30
    //procedure GetString(?:?); virtual;//v38//0067768C
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//00677360
    procedure GetRotMat(m:TRotMat); virtual;//v40//006779FC
    function GetDataType:TDataType; virtual;//v44//006707AC
    function GetUnits:TUnits; virtual;//v48//00676A20
    function GetPerUnits1:TUnits; virtual;//v4C//00676D68
    function GetPerUnits2:TUnits; virtual;//v50//00676F9C
    procedure CreateClone; virtual;//v80//006772B8
    procedure FillClone(c:TExpression); virtual;//v84//006772C8
    procedure Swallow; virtual;//v88//00677330
  end;
  TProcedureExpression = class(TMathsFunction)
  published
    function CanSet:Boolean;//00677B80
    function GetDataType:TDataType;//00679644
    //procedure GetString(?:?);//00679648
    //function SetValue(NewValue:Double; ?:?):Boolean;//0067968C
    function Execute(Background:Boolean):Boolean;//00677B94
    procedure FillClone(c:TExpression);//0067963C
    procedure CreateClone;//00677B84
    //procedure ToString(?:?);//006796F0
    procedure GetValue;//00679668
  public
    //procedure ToString(?:?); virtual;//006796F0
    procedure GetValue; virtual;//v2C//00679668
    //procedure GetString(?:?); virtual;//v38//00679648
    function GetDataType:TDataType; virtual;//v44//00679644
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//0067968C
    function CanSet:Boolean; virtual;//v68//00677B80
    procedure CreateClone; virtual;//v80//00677B84
    procedure FillClone(c:TExpression); virtual;//v84//0067963C
    function Execute(Background:Boolean):Boolean; virtual;//v98//00677B94
  end;
    //function sub_00670448(?:?; ?:?; ?:?; ?:?; ?:?):?;//00670448
    //function sub_0067048C(?:?; ?:?; ?:Integer):?;//0067048C
    //procedure sub_0067050C(?:?; ?:Integer; ?:?);//0067050C
    //procedure sub_00670528(?:?; ?:Integer; ?:?);//00670528
    //function sub_00670554:?;//00670554
    //function sub_006705CC:?;//006705CC
    //procedure sub_00670644(?:Integer; ?:?);//00670644
    //procedure sub_0067065C(?:Integer; ?:?);//0067065C
    //function sub_00670674(?:UnicodeString):?;//00670674
    //function sub_006706E4(?:UnicodeString):?;//006706E4
    procedure sub_00673308;//00673308
    procedure sub_00673E34;//00673E34

implementation

//00670448
{*function sub_00670448(?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 00670448    push        ebp
 00670449    mov         ebp,esp
 0067044B    add         esp,0FFFFFFF0
 0067044E    fld         qword ptr [ebp+28]
 00670451    fsub        qword ptr [ebp+20]
 00670454    fstp        qword ptr [ebp-10]
 00670457    wait
 00670458    fld         qword ptr [ebp+18]
 0067045B    fsub        qword ptr [ebp+20]
 0067045E    fdivr       qword ptr [ebp-10]
 00670461    fld         qword ptr [ebp+8]
 00670464    fsub        qword ptr [ebp+10]
 00670467    fmulp       st(1),st
 00670469    fstp        qword ptr [ebp-10]
 0067046C    wait
 0067046D    fld         qword ptr [ebp-10]
 00670470    fadd        qword ptr [ebp+10]
 00670473    fstp        qword ptr [ebp-10]
 00670476    wait
 00670477    mov         eax,dword ptr [ebp-10]
 0067047A    mov         dword ptr [ebp-8],eax
 0067047D    mov         eax,dword ptr [ebp-0C]
 00670480    mov         dword ptr [ebp-4],eax
 00670483    fld         qword ptr [ebp-8]
 00670486    mov         esp,ebp
 00670488    pop         ebp
 00670489    ret         28
end;*}

//0067048C
{*function sub_0067048C(?:?; ?:?; ?:Integer):?;
begin
 0067048C    push        ebp
 0067048D    mov         ebp,esp
 0067048F    add         esp,0FFFFFFF8
 00670492    push        ebx
 00670493    push        esi
 00670494    mov         esi,ecx
 00670496    mov         dword ptr [ebp-8],edx
 00670499    mov         dword ptr [ebp-4],eax
 0067049C    mov         eax,dword ptr [ebp-4]
 0067049F    call        @UStrAddRef
 006704A4    mov         eax,dword ptr [ebp-8]
 006704A7    call        @UStrAddRef
 006704AC    xor         eax,eax
 006704AE    push        ebp
 006704AF    push        6704FA
 006704B4    push        dword ptr fs:[eax]
 006704B7    mov         dword ptr fs:[eax],esp
 006704BA    mov         edx,dword ptr [ebp-8]
 006704BD    mov         eax,dword ptr [ebp-4]
 006704C0    call        Pos
 006704C5    mov         ebx,eax
 006704C7    lea         eax,[ebp-8]
 006704CA    mov         ecx,ebx
 006704CC    mov         edx,1
 006704D1    call        @UStrDelete
 006704D6    cmp         ebx,1
>006704D9    jl          006704DF
 006704DB    cmp         esi,ebx
>006704DD    jg          006704BA
 006704DF    xor         eax,eax
 006704E1    pop         edx
 006704E2    pop         ecx
 006704E3    pop         ecx
 006704E4    mov         dword ptr fs:[eax],edx
 006704E7    push        670501
 006704EC    lea         eax,[ebp-8]
 006704EF    mov         edx,2
 006704F4    call        @UStrArrayClr
 006704F9    ret
>006704FA    jmp         @HandleFinally
>006704FF    jmp         006704EC
 00670501    mov         eax,ebx
 00670503    pop         esi
 00670504    pop         ebx
 00670505    pop         ecx
 00670506    pop         ecx
 00670507    pop         ebp
 00670508    ret
end;*}

//0067050C
{*procedure sub_0067050C(?:?; ?:Integer; ?:?);
begin
 0067050C    push        ebx
 0067050D    push        esi
 0067050E    push        edi
 0067050F    mov         edi,ecx
 00670511    mov         esi,edx
 00670513    mov         ebx,eax
 00670515    push        edi
 00670516    mov         ecx,esi
 00670518    mov         edx,1
 0067051D    mov         eax,ebx
 0067051F    call        @UStrCopy
 00670524    pop         edi
 00670525    pop         esi
 00670526    pop         ebx
 00670527    ret
end;*}

//00670528
{*procedure sub_00670528(?:?; ?:Integer; ?:?);
begin
 00670528    push        ebx
 00670529    push        esi
 0067052A    push        edi
 0067052B    push        ebp
 0067052C    mov         ebp,ecx
 0067052E    mov         edi,edx
 00670530    mov         esi,eax
 00670532    mov         ebx,esi
 00670534    test        ebx,ebx
>00670536    je          0067053D
 00670538    sub         ebx,4
 0067053B    mov         ebx,dword ptr [ebx]
 0067053D    push        ebp
 0067053E    mov         edx,ebx
 00670540    sub         edx,edi
 00670542    inc         edx
 00670543    mov         ecx,edi
 00670545    mov         eax,esi
 00670547    call        @UStrCopy
 0067054C    pop         ebp
 0067054D    pop         edi
 0067054E    pop         esi
 0067054F    pop         ebx
 00670550    ret
end;*}

//00670554
{*function sub_00670554:?;
begin
 00670554    push        ebp
 00670555    mov         ebp,esp
 00670557    push        0
 00670559    push        ebx
 0067055A    push        esi
 0067055B    xor         eax,eax
 0067055D    push        ebp
 0067055E    push        6705BB
 00670563    push        dword ptr fs:[eax]
 00670566    mov         dword ptr fs:[eax],esp
 00670569    mov         dl,1
 0067056B    mov         eax,[0043C7BC];TStringList
 00670570    call        TStringList.Create;TStringList.Create
 00670575    mov         esi,eax
 00670577    mov         dl,1
 00670579    mov         eax,esi
 0067057B    call        TStringList.SetSorted
 00670580    xor         ebx,ebx
 00670582    lea         edx,[ebp-4]
 00670585    mov         eax,ebx
 00670587    call        00670644
 0067058C    cmp         dword ptr [ebp-4],0
>00670590    je          0067059C
 00670592    mov         edx,dword ptr [ebp-4]
 00670595    mov         eax,esi
 00670597    mov         ecx,dword ptr [eax]
 00670599    call        dword ptr [ecx+38];TStringList.Add
 0067059C    inc         ebx
 0067059D    cmp         ebx,100
>006705A3    jne         00670582
 006705A5    xor         eax,eax
 006705A7    pop         edx
 006705A8    pop         ecx
 006705A9    pop         ecx
 006705AA    mov         dword ptr fs:[eax],edx
 006705AD    push        6705C2
 006705B2    lea         eax,[ebp-4]
 006705B5    call        @UStrClr
 006705BA    ret
>006705BB    jmp         @HandleFinally
>006705C0    jmp         006705B2
 006705C2    mov         eax,esi
 006705C4    pop         esi
 006705C5    pop         ebx
 006705C6    pop         ecx
 006705C7    pop         ebp
 006705C8    ret
end;*}

//006705CC
{*function sub_006705CC:?;
begin
 006705CC    push        ebp
 006705CD    mov         ebp,esp
 006705CF    push        0
 006705D1    push        ebx
 006705D2    push        esi
 006705D3    xor         eax,eax
 006705D5    push        ebp
 006705D6    push        670633
 006705DB    push        dword ptr fs:[eax]
 006705DE    mov         dword ptr fs:[eax],esp
 006705E1    mov         dl,1
 006705E3    mov         eax,[0043C7BC];TStringList
 006705E8    call        TStringList.Create;TStringList.Create
 006705ED    mov         esi,eax
 006705EF    mov         dl,1
 006705F1    mov         eax,esi
 006705F3    call        TStringList.SetSorted
 006705F8    xor         ebx,ebx
 006705FA    lea         edx,[ebp-4]
 006705FD    mov         eax,ebx
 006705FF    call        0067065C
 00670604    cmp         dword ptr [ebp-4],0
>00670608    je          00670614
 0067060A    mov         edx,dword ptr [ebp-4]
 0067060D    mov         eax,esi
 0067060F    mov         ecx,dword ptr [eax]
 00670611    call        dword ptr [ecx+38];TStringList.Add
 00670614    inc         ebx
 00670615    cmp         ebx,100
>0067061B    jne         006705FA
 0067061D    xor         eax,eax
 0067061F    pop         edx
 00670620    pop         ecx
 00670621    pop         ecx
 00670622    mov         dword ptr fs:[eax],edx
 00670625    push        67063A
 0067062A    lea         eax,[ebp-4]
 0067062D    call        @UStrClr
 00670632    ret
>00670633    jmp         @HandleFinally
>00670638    jmp         0067062A
 0067063A    mov         eax,esi
 0067063C    pop         esi
 0067063D    pop         ebx
 0067063E    pop         ecx
 0067063F    pop         ebp
 00670640    ret
end;*}

//00670644
{*procedure sub_00670644(?:Integer; ?:?);
begin
 00670644    push        ebx
 00670645    push        esi
 00670646    mov         esi,edx
 00670648    mov         ebx,eax
 0067064A    mov         ecx,esi
 0067064C    mov         edx,ebx
 0067064E    mov         eax,[0081ECD0];gvar_0081ECD0:THashTable
 00670653    call        THashTable.Get
 00670658    pop         esi
 00670659    pop         ebx
 0067065A    ret
end;*}

//0067065C
{*procedure sub_0067065C(?:Integer; ?:?);
begin
 0067065C    push        ebx
 0067065D    push        esi
 0067065E    mov         esi,edx
 00670660    mov         ebx,eax
 00670662    mov         ecx,esi
 00670664    mov         edx,ebx
 00670666    mov         eax,[0081ECD4];gvar_0081ECD4:THashTable
 0067066B    call        THashTable.Get
 00670670    pop         esi
 00670671    pop         ebx
 00670672    ret
end;*}

//00670674
{*function sub_00670674(?:UnicodeString):?;
begin
 00670674    push        ebp
 00670675    mov         ebp,esp
 00670677    push        ecx
 00670678    push        ebx
 00670679    mov         dword ptr [ebp-4],eax
 0067067C    mov         eax,dword ptr [ebp-4]
 0067067F    call        @UStrAddRef
 00670684    xor         eax,eax
 00670686    push        ebp
 00670687    push        6706C4
 0067068C    push        dword ptr fs:[eax]
 0067068F    mov         dword ptr fs:[eax],esp
 00670692    lea         eax,[ebp-4]
 00670695    mov         edx,6706E0;'$'
 0067069A    call        004F9D9C
 0067069F    mov         edx,dword ptr [ebp-4]
 006706A2    mov         eax,[0081ECD0];gvar_0081ECD0:THashTable
 006706A7    call        THashTable.Get
 006706AC    mov         ebx,eax
 006706AE    xor         eax,eax
 006706B0    pop         edx
 006706B1    pop         ecx
 006706B2    pop         ecx
 006706B3    mov         dword ptr fs:[eax],edx
 006706B6    push        6706CB
 006706BB    lea         eax,[ebp-4]
 006706BE    call        @UStrClr
 006706C3    ret
>006706C4    jmp         @HandleFinally
>006706C9    jmp         006706BB
 006706CB    mov         eax,ebx
 006706CD    pop         ebx
 006706CE    pop         ecx
 006706CF    pop         ebp
 006706D0    ret
end;*}

//006706E4
{*function sub_006706E4(?:UnicodeString):?;
begin
 006706E4    push        ebp
 006706E5    mov         ebp,esp
 006706E7    push        ecx
 006706E8    push        ebx
 006706E9    mov         dword ptr [ebp-4],eax
 006706EC    mov         eax,dword ptr [ebp-4]
 006706EF    call        @UStrAddRef
 006706F4    xor         eax,eax
 006706F6    push        ebp
 006706F7    push        670727
 006706FC    push        dword ptr fs:[eax]
 006706FF    mov         dword ptr fs:[eax],esp
 00670702    mov         edx,dword ptr [ebp-4]
 00670705    mov         eax,[0081ECD4];gvar_0081ECD4:THashTable
 0067070A    call        THashTable.Get
 0067070F    mov         ebx,eax
 00670711    xor         eax,eax
 00670713    pop         edx
 00670714    pop         ecx
 00670715    pop         ecx
 00670716    mov         dword ptr fs:[eax],edx
 00670719    push        67072E
 0067071E    lea         eax,[ebp-4]
 00670721    call        @UStrClr
 00670726    ret
>00670727    jmp         @HandleFinally
>0067072C    jmp         0067071E
 0067072E    mov         eax,ebx
 00670730    pop         ebx
 00670731    pop         ecx
 00670732    pop         ebp
 00670733    ret
end;*}

//00670734
constructor TMathsFunction.Create;
begin
{*
 00670734    push        ebx
 00670735    push        esi
 00670736    test        dl,dl
>00670738    je          00670742
 0067073A    add         esp,0FFFFFFF0
 0067073D    call        @ClassCreate
 00670742    mov         ebx,edx
 00670744    mov         esi,eax
 00670746    mov         cl,1
 00670748    mov         dl,1
 0067074A    mov         eax,[00471630];TObjectList
 0067074F    call        TObjectList.Create;TObjectList.Create
 00670754    mov         dword ptr [esi+18],eax;TMathsFunction.Parameters:TObjectList
 00670757    mov         eax,esi
 00670759    test        bl,bl
>0067075B    je          0067076C
 0067075D    call        @AfterConstruction
 00670762    pop         dword ptr fs:[0]
 00670769    add         esp,0C
 0067076C    mov         eax,esi
 0067076E    pop         esi
 0067076F    pop         ebx
 00670770    ret
*}
end;

//00670774
destructor TMathsFunction.Destroy();
begin
{*
 00670774    push        ebx
 00670775    push        esi
 00670776    call        @BeforeDestruction
 0067077B    mov         ebx,edx
 0067077D    mov         esi,eax
 0067077F    lea         eax,[esi+18];TMathsFunction.Parameters:TObjectList
 00670782    mov         edx,dword ptr [eax]
 00670784    xor         ecx,ecx
 00670786    mov         dword ptr [eax],ecx
 00670788    mov         eax,edx
 0067078A    call        TObject.Free
 0067078F    mov         edx,ebx
 00670791    and         dl,0FC
 00670794    mov         eax,esi
 00670796    call        TObject.Destroy
 0067079B    test        bl,bl
>0067079D    jle         006707A6
 0067079F    mov         eax,esi
 006707A1    call        @ClassDestroy
 006707A6    pop         esi
 006707A7    pop         ebx
 006707A8    ret
*}
end;

//006707AC
function TMathsFunction.GetDataType:TDataType;
begin
{*
 006707AC    push        ebx
 006707AD    push        esi
 006707AE    mov         ebx,eax
 006707B0    mov         eax,dword ptr [ebx+1C];TMathsFunction.FunctionNumber:Integer
 006707B3    cmp         eax,92
>006707B8    ja          00670C0D
 006707BE    jmp         dword ptr [eax*4+6707C5]
 006707BE    dd          00670A11
 006707BE    dd          00670A20
 006707BE    dd          00670A4E
 006707BE    dd          00670A53
 006707BE    dd          00670A58
 006707BE    dd          00670A5D
 006707BE    dd          00670A62
 006707BE    dd          00670A67
 006707BE    dd          00670A6C
 006707BE    dd          00670A71
 006707BE    dd          00670A76
 006707BE    dd          00670A7B
 006707BE    dd          00670A80
 006707BE    dd          00670A85
 006707BE    dd          00670A8A
 006707BE    dd          00670A8F
 006707BE    dd          00670A94
 006707BE    dd          00670A99
 006707BE    dd          00670A9E
 006707BE    dd          00670AA3
 006707BE    dd          00670AA8
 006707BE    dd          00670AAD
 006707BE    dd          00670AB2
 006707BE    dd          00670AB7
 006707BE    dd          00670ABC
 006707BE    dd          00670AC1
 006707BE    dd          00670AC6
 006707BE    dd          00670ACB
 006707BE    dd          00670AD0
 006707BE    dd          00670AD5
 006707BE    dd          00670ADA
 006707BE    dd          00670ADF
 006707BE    dd          00670AE4
 006707BE    dd          00670AE9
 006707BE    dd          00670AFE
 006707BE    dd          00670B03
 006707BE    dd          00670B08
 006707BE    dd          00670B0D
 006707BE    dd          00670B12
 006707BE    dd          00670B17
 006707BE    dd          00670B1C
 006707BE    dd          00670B1C
 006707BE    dd          00670B1C
 006707BE    dd          00670B1C
 006707BE    dd          00670B1C
 006707BE    dd          00670B1C
 006707BE    dd          00670B1C
 006707BE    dd          00670B1C
 006707BE    dd          00670B1C
 006707BE    dd          00670B1C
 006707BE    dd          00670B26
 006707BE    dd          00670B21
 006707BE    dd          00670B21
 006707BE    dd          00670B21
 006707BE    dd          00670B21
 006707BE    dd          00670B21
 006707BE    dd          00670B2B
 006707BE    dd          00670B2B
 006707BE    dd          00670B2B
 006707BE    dd          00670B2B
 006707BE    dd          00670B2B
 006707BE    dd          00670B2B
 006707BE    dd          00670B2B
 006707BE    dd          00670B2B
 006707BE    dd          00670B2B
 006707BE    dd          00670B2B
 006707BE    dd          00670B2B
 006707BE    dd          00670B2B
 006707BE    dd          00670B2B
 006707BE    dd          00670B30
 006707BE    dd          00670B35
 006707BE    dd          00670B3A
 006707BE    dd          00670B3F
 006707BE    dd          00670B3F
 006707BE    dd          00670B3F
 006707BE    dd          00670B3F
 006707BE    dd          00670B3F
 006707BE    dd          00670B44
 006707BE    dd          00670B44
 006707BE    dd          00670B44
 006707BE    dd          00670B44
 006707BE    dd          00670B49
 006707BE    dd          00670B4E
 006707BE    dd          00670B4E
 006707BE    dd          00670B4E
 006707BE    dd          00670B4E
 006707BE    dd          00670B53
 006707BE    dd          00670B58
 006707BE    dd          00670B5D
 006707BE    dd          00670B67
 006707BE    dd          00670B62
 006707BE    dd          00670B76
 006707BE    dd          00670B6C
 006707BE    dd          00670B71
 006707BE    dd          00670B7B
 006707BE    dd          00670B8D
 006707BE    dd          00670B92
 006707BE    dd          00670B92
 006707BE    dd          00670B97
 006707BE    dd          00670B9C
 006707BE    dd          00670B97
 006707BE    dd          00670B97
 006707BE    dd          00670B97
 006707BE    dd          00670B97
 006707BE    dd          00670B97
 006707BE    dd          00670B9C
 006707BE    dd          00670B97
 006707BE    dd          00670BA6
 006707BE    dd          00670B9C
 006707BE    dd          00670B9C
 006707BE    dd          00670B97
 006707BE    dd          00670B97
 006707BE    dd          00670B9C
 006707BE    dd          00670B9C
 006707BE    dd          00670B97
 006707BE    dd          00670B9C
 006707BE    dd          00670B97
 006707BE    dd          00670B97
 006707BE    dd          00670B97
 006707BE    dd          00670B97
 006707BE    dd          00670BA1
 006707BE    dd          00670BA1
 006707BE    dd          00670BAB
 006707BE    dd          00670BB5
 006707BE    dd          00670BBF
 006707BE    dd          00670A49
 006707BE    dd          00670BB5
 006707BE    dd          00670BB5
 006707BE    dd          00670BB5
 006707BE    dd          00670A49
 006707BE    dd          00670A44
 006707BE    dd          00670A44
 006707BE    dd          00670A44
 006707BE    dd          00670A44
 006707BE    dd          00670A44
 006707BE    dd          00670BB0
 006707BE    dd          00670BBA
 006707BE    dd          00670BF9
 006707BE    dd          00670BFE
 006707BE    dd          00670C0D
 006707BE    dd          00670BDB
 006707BE    dd          00670C08
 006707BE    dd          00670C03
 006707BE    dd          00670A1B
 006707BE    dd          00670A1B
 006707BE    dd          00670A1B
 006707BE    dd          00670A16
 00670A11    xor         eax,eax
 00670A13    pop         esi
 00670A14    pop         ebx
 00670A15    ret
 00670A16    mov         al,2
 00670A18    pop         esi
 00670A19    pop         ebx
 00670A1A    ret
 00670A1B    xor         eax,eax
 00670A1D    pop         esi
 00670A1E    pop         ebx
 00670A1F    ret
 00670A20    xor         edx,edx
 00670A22    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00670A25    call        TList.Get
 00670A2A    mov         edx,dword ptr [eax]
 00670A2C    call        dword ptr [edx+44]
 00670A2F    cmp         al,6
>00670A31    je          00670A3F
 00670A33    cmp         al,5
>00670A35    je          00670A3F
 00670A37    cmp         al,4
>00670A39    jne         00670C0F
 00670A3F    xor         eax,eax
 00670A41    pop         esi
 00670A42    pop         ebx
 00670A43    ret
 00670A44    mov         al,6
 00670A46    pop         esi
 00670A47    pop         ebx
 00670A48    ret
 00670A49    xor         eax,eax
 00670A4B    pop         esi
 00670A4C    pop         ebx
 00670A4D    ret
 00670A4E    mov         al,2
 00670A50    pop         esi
 00670A51    pop         ebx
 00670A52    ret
 00670A53    mov         al,2
 00670A55    pop         esi
 00670A56    pop         ebx
 00670A57    ret
 00670A58    xor         eax,eax
 00670A5A    pop         esi
 00670A5B    pop         ebx
 00670A5C    ret
 00670A5D    mov         al,2
 00670A5F    pop         esi
 00670A60    pop         ebx
 00670A61    ret
 00670A62    xor         eax,eax
 00670A64    pop         esi
 00670A65    pop         ebx
 00670A66    ret
 00670A67    xor         eax,eax
 00670A69    pop         esi
 00670A6A    pop         ebx
 00670A6B    ret
 00670A6C    mov         al,2
 00670A6E    pop         esi
 00670A6F    pop         ebx
 00670A70    ret
 00670A71    xor         eax,eax
 00670A73    pop         esi
 00670A74    pop         ebx
 00670A75    ret
 00670A76    mov         al,3
 00670A78    pop         esi
 00670A79    pop         ebx
 00670A7A    ret
 00670A7B    mov         al,3
 00670A7D    pop         esi
 00670A7E    pop         ebx
 00670A7F    ret
 00670A80    mov         al,3
 00670A82    pop         esi
 00670A83    pop         ebx
 00670A84    ret
 00670A85    xor         eax,eax
 00670A87    pop         esi
 00670A88    pop         ebx
 00670A89    ret
 00670A8A    xor         eax,eax
 00670A8C    pop         esi
 00670A8D    pop         ebx
 00670A8E    ret
 00670A8F    xor         eax,eax
 00670A91    pop         esi
 00670A92    pop         ebx
 00670A93    ret
 00670A94    xor         eax,eax
 00670A96    pop         esi
 00670A97    pop         ebx
 00670A98    ret
 00670A99    xor         eax,eax
 00670A9B    pop         esi
 00670A9C    pop         ebx
 00670A9D    ret
 00670A9E    xor         eax,eax
 00670AA0    pop         esi
 00670AA1    pop         ebx
 00670AA2    ret
 00670AA3    xor         eax,eax
 00670AA5    pop         esi
 00670AA6    pop         ebx
 00670AA7    ret
 00670AA8    xor         eax,eax
 00670AAA    pop         esi
 00670AAB    pop         ebx
 00670AAC    ret
 00670AAD    xor         eax,eax
 00670AAF    pop         esi
 00670AB0    pop         ebx
 00670AB1    ret
 00670AB2    xor         eax,eax
 00670AB4    pop         esi
 00670AB5    pop         ebx
 00670AB6    ret
 00670AB7    xor         eax,eax
 00670AB9    pop         esi
 00670ABA    pop         ebx
 00670ABB    ret
 00670ABC    mov         al,2
 00670ABE    pop         esi
 00670ABF    pop         ebx
 00670AC0    ret
 00670AC1    xor         eax,eax
 00670AC3    pop         esi
 00670AC4    pop         ebx
 00670AC5    ret
 00670AC6    mov         al,3
 00670AC8    pop         esi
 00670AC9    pop         ebx
 00670ACA    ret
 00670ACB    mov         al,2
 00670ACD    pop         esi
 00670ACE    pop         ebx
 00670ACF    ret
 00670AD0    xor         eax,eax
 00670AD2    pop         esi
 00670AD3    pop         ebx
 00670AD4    ret
 00670AD5    xor         eax,eax
 00670AD7    pop         esi
 00670AD8    pop         ebx
 00670AD9    ret
 00670ADA    xor         eax,eax
 00670ADC    pop         esi
 00670ADD    pop         ebx
 00670ADE    ret
 00670ADF    mov         al,2
 00670AE1    pop         esi
 00670AE2    pop         ebx
 00670AE3    ret
 00670AE4    xor         eax,eax
 00670AE6    pop         esi
 00670AE7    pop         ebx
 00670AE8    ret
 00670AE9    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00670AEC    cmp         dword ptr [eax+8],1;TObjectList.FCount:Integer
>00670AF0    jge         00670AF9
 00670AF2    xor         eax,eax
>00670AF4    jmp         00670C0F
 00670AF9    mov         al,2
 00670AFB    pop         esi
 00670AFC    pop         ebx
 00670AFD    ret
 00670AFE    mov         al,2
 00670B00    pop         esi
 00670B01    pop         ebx
 00670B02    ret
 00670B03    xor         eax,eax
 00670B05    pop         esi
 00670B06    pop         ebx
 00670B07    ret
 00670B08    mov         al,3
 00670B0A    pop         esi
 00670B0B    pop         ebx
 00670B0C    ret
 00670B0D    mov         al,3
 00670B0F    pop         esi
 00670B10    pop         ebx
 00670B11    ret
 00670B12    mov         al,2
 00670B14    pop         esi
 00670B15    pop         ebx
 00670B16    ret
 00670B17    mov         al,2
 00670B19    pop         esi
 00670B1A    pop         ebx
 00670B1B    ret
 00670B1C    xor         eax,eax
 00670B1E    pop         esi
 00670B1F    pop         ebx
 00670B20    ret
 00670B21    xor         eax,eax
 00670B23    pop         esi
 00670B24    pop         ebx
 00670B25    ret
 00670B26    xor         eax,eax
 00670B28    pop         esi
 00670B29    pop         ebx
 00670B2A    ret
 00670B2B    mov         al,1
 00670B2D    pop         esi
 00670B2E    pop         ebx
 00670B2F    ret
 00670B30    mov         al,2
 00670B32    pop         esi
 00670B33    pop         ebx
 00670B34    ret
 00670B35    mov         al,2
 00670B37    pop         esi
 00670B38    pop         ebx
 00670B39    ret
 00670B3A    mov         al,2
 00670B3C    pop         esi
 00670B3D    pop         ebx
 00670B3E    ret
 00670B3F    mov         al,2
 00670B41    pop         esi
 00670B42    pop         ebx
 00670B43    ret
 00670B44    mov         al,2
 00670B46    pop         esi
 00670B47    pop         ebx
 00670B48    ret
 00670B49    xor         eax,eax
 00670B4B    pop         esi
 00670B4C    pop         ebx
 00670B4D    ret
 00670B4E    mov         al,2
 00670B50    pop         esi
 00670B51    pop         ebx
 00670B52    ret
 00670B53    mov         al,2
 00670B55    pop         esi
 00670B56    pop         ebx
 00670B57    ret
 00670B58    xor         eax,eax
 00670B5A    pop         esi
 00670B5B    pop         ebx
 00670B5C    ret
 00670B5D    xor         eax,eax
 00670B5F    pop         esi
 00670B60    pop         ebx
 00670B61    ret
 00670B62    xor         eax,eax
 00670B64    pop         esi
 00670B65    pop         ebx
 00670B66    ret
 00670B67    xor         eax,eax
 00670B69    pop         esi
 00670B6A    pop         ebx
 00670B6B    ret
 00670B6C    xor         eax,eax
 00670B6E    pop         esi
 00670B6F    pop         ebx
 00670B70    ret
 00670B71    xor         eax,eax
 00670B73    pop         esi
 00670B74    pop         ebx
 00670B75    ret
 00670B76    xor         eax,eax
 00670B78    pop         esi
 00670B79    pop         ebx
 00670B7A    ret
 00670B7B    xor         edx,edx
 00670B7D    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00670B80    call        TList.Get
 00670B85    mov         edx,dword ptr [eax]
 00670B87    call        dword ptr [edx+44]
 00670B8A    pop         esi
 00670B8B    pop         ebx
 00670B8C    ret
 00670B8D    mov         al,3
 00670B8F    pop         esi
 00670B90    pop         ebx
 00670B91    ret
 00670B92    xor         eax,eax
 00670B94    pop         esi
 00670B95    pop         ebx
 00670B96    ret
 00670B97    mov         al,4
 00670B99    pop         esi
 00670B9A    pop         ebx
 00670B9B    ret
 00670B9C    mov         al,2
 00670B9E    pop         esi
 00670B9F    pop         ebx
 00670BA0    ret
 00670BA1    mov         al,3
 00670BA3    pop         esi
 00670BA4    pop         ebx
 00670BA5    ret
 00670BA6    xor         eax,eax
 00670BA8    pop         esi
 00670BA9    pop         ebx
 00670BAA    ret
 00670BAB    xor         eax,eax
 00670BAD    pop         esi
 00670BAE    pop         ebx
 00670BAF    ret
 00670BB0    xor         eax,eax
 00670BB2    pop         esi
 00670BB3    pop         ebx
 00670BB4    ret
 00670BB5    mov         al,5
 00670BB7    pop         esi
 00670BB8    pop         ebx
 00670BB9    ret
 00670BBA    xor         eax,eax
 00670BBC    pop         esi
 00670BBD    pop         ebx
 00670BBE    ret
 00670BBF    xor         edx,edx
 00670BC1    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00670BC4    call        TList.Get
 00670BC9    mov         edx,dword ptr [eax]
 00670BCB    call        dword ptr [edx+44]
 00670BCE    cmp         al,6
>00670BD0    jne         00670BD6
 00670BD2    mov         al,6
>00670BD4    jmp         00670C0F
 00670BD6    mov         al,5
 00670BD8    pop         esi
 00670BD9    pop         ebx
 00670BDA    ret
 00670BDB    mov         esi,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00670BDE    cmp         dword ptr [esi+8],0;TObjectList.FCount:Integer
>00670BE2    jg          00670BE8
 00670BE4    xor         eax,eax
>00670BE6    jmp         00670C0F
 00670BE8    xor         edx,edx
 00670BEA    mov         eax,esi
 00670BEC    call        TList.Get
 00670BF1    mov         edx,dword ptr [eax]
 00670BF3    call        dword ptr [edx+44]
 00670BF6    pop         esi
 00670BF7    pop         ebx
 00670BF8    ret
 00670BF9    mov         al,2
 00670BFB    pop         esi
 00670BFC    pop         ebx
 00670BFD    ret
 00670BFE    xor         eax,eax
 00670C00    pop         esi
 00670C01    pop         ebx
 00670C02    ret
 00670C03    mov         al,3
 00670C05    pop         esi
 00670C06    pop         ebx
 00670C07    ret
 00670C08    xor         eax,eax
 00670C0A    pop         esi
 00670C0B    pop         ebx
 00670C0C    ret
 00670C0D    xor         eax,eax
 00670C0F    pop         esi
 00670C10    pop         ebx
 00670C11    ret
*}
end;

//00670C14
function TMathsFunction.p(i:Integer):Double;
begin
{*
 00670C14    push        ebx
 00670C15    push        esi
 00670C16    add         esp,0FFFFFFF8
 00670C19    mov         esi,edx
 00670C1B    mov         ebx,eax
 00670C1D    test        esi,esi
>00670C1F    jle         00670C29
 00670C21    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00670C24    cmp         esi,dword ptr [eax+8];TObjectList.FCount:Integer
>00670C27    jle         00670C34
 00670C29    xor         eax,eax
 00670C2B    mov         dword ptr [esp],eax
 00670C2E    mov         dword ptr [esp+4],eax
>00670C32    jmp         00670C52
 00670C34    mov         edx,esi
 00670C36    dec         edx
 00670C37    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00670C3A    call        TList.Get
 00670C3F    mov         edx,dword ptr ds:[67DB04];TExpression
 00670C45    call        @AsClass
 00670C4A    mov         edx,dword ptr [eax]
 00670C4C    call        dword ptr [edx];TExpression.Evaluate
 00670C4E    fstp        qword ptr [esp]
 00670C51    wait
 00670C52    fld         qword ptr [esp]
 00670C55    pop         ecx
 00670C56    pop         edx
 00670C57    pop         esi
 00670C58    pop         ebx
 00670C59    ret
*}
end;

//00670C5C
function TMathsFunction.ip(i:Integer):Integer;
begin
{*
 00670C5C    push        ebx
 00670C5D    push        esi
 00670C5E    mov         esi,edx
 00670C60    mov         ebx,eax
 00670C62    test        esi,esi
>00670C64    jle         00670C6E
 00670C66    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00670C69    cmp         esi,dword ptr [eax+8];TObjectList.FCount:Integer
>00670C6C    jle         00670C73
 00670C6E    xor         eax,eax
 00670C70    pop         esi
 00670C71    pop         ebx
 00670C72    ret
 00670C73    mov         edx,esi
 00670C75    dec         edx
 00670C76    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00670C79    call        TList.Get
 00670C7E    mov         edx,dword ptr ds:[67DB04];TExpression
 00670C84    call        @AsClass
 00670C89    mov         edx,dword ptr [eax]
 00670C8B    call        dword ptr [edx+8];TExpression.EvaluateInteger
 00670C8E    pop         esi
 00670C8F    pop         ebx
 00670C90    ret
*}
end;

//00670C94
function TMathsFunction.ap(i:Integer):Double;
begin
{*
 00670C94    push        ebx
 00670C95    push        esi
 00670C96    add         esp,0FFFFFFF8
 00670C99    mov         esi,edx
 00670C9B    mov         ebx,eax
 00670C9D    test        esi,esi
>00670C9F    jle         00670CA9
 00670CA1    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00670CA4    cmp         esi,dword ptr [eax+8];TObjectList.FCount:Integer
>00670CA7    jle         00670CB4
 00670CA9    xor         eax,eax
 00670CAB    mov         dword ptr [esp],eax
 00670CAE    mov         dword ptr [esp+4],eax
>00670CB2    jmp         00670CE1
 00670CB4    push        0
 00670CB6    mov         edx,esi
 00670CB8    dec         edx
 00670CB9    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00670CBC    call        TList.Get
 00670CC1    mov         edx,dword ptr ds:[67DB04];TExpression
 00670CC7    call        @AsClass
 00670CCC    xor         ecx,ecx
 00670CCE    mov         dl,18
 00670CD0    mov         ebx,dword ptr [eax]
 00670CD2    call        dword ptr [ebx+10];TExpression.EvaluateUnits
 00670CD5    fld         tbyte ptr ds:[670CEC];0.0174532925199433:Extended
 00670CDB    fmulp       st(1),st
 00670CDD    fstp        qword ptr [esp]
 00670CE0    wait
 00670CE1    fld         qword ptr [esp]
 00670CE4    pop         ecx
 00670CE5    pop         edx
 00670CE6    pop         esi
 00670CE7    pop         ebx
 00670CE8    ret
*}
end;

//00670CF8
procedure TMathsFunction.bp(i:Integer);
begin
{*
 00670CF8    push        ebx
 00670CF9    push        esi
 00670CFA    mov         esi,edx
 00670CFC    mov         ebx,eax
 00670CFE    test        esi,esi
>00670D00    jle         00670D0A
 00670D02    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00670D05    cmp         esi,dword ptr [eax+8];TObjectList.FCount:Integer
>00670D08    jle         00670D0F
 00670D0A    xor         eax,eax
 00670D0C    pop         esi
 00670D0D    pop         ebx
 00670D0E    ret
 00670D0F    mov         edx,esi
 00670D11    dec         edx
 00670D12    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00670D15    call        TList.Get
 00670D1A    mov         edx,dword ptr ds:[67DB04];TExpression
 00670D20    call        @AsClass
 00670D25    mov         edx,dword ptr [eax]
 00670D27    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 00670D2A    pop         esi
 00670D2B    pop         ebx
 00670D2C    ret
*}
end;

//00670D30
procedure TMathsFunction.GetValue;
begin
{*
 00670D30    push        ebp
 00670D31    mov         ebp,esp
 00670D33    mov         ecx,5C
 00670D38    push        0
 00670D3A    push        0
 00670D3C    dec         ecx
>00670D3D    jne         00670D38
 00670D3F    push        ebx
 00670D40    push        esi
 00670D41    mov         ebx,eax
 00670D43    xor         eax,eax
 00670D45    push        ebp
 00670D46    push        6732B0
 00670D4B    push        dword ptr fs:[eax]
 00670D4E    mov         dword ptr fs:[eax],esp
 00670D51    mov         eax,dword ptr [ebx+1C];TMathsFunction.FunctionNumber:Integer
 00670D54    cmp         eax,93
>00670D59    ja          00673282
 00670D5F    jmp         dword ptr [eax*4+670D66]
 00670D5F    dd          00670FB6
 00670D5F    dd          0067112C
 00670D5F    dd          006711BE
 00670D5F    dd          006711EB
 00670D5F    dd          006711F8
 00670D5F    dd          00671352
 00670D5F    dd          0067137F
 00670D5F    dd          006713A0
 00670D5F    dd          006713AD
 00670D5F    dd          00671405
 00670D5F    dd          00671432
 00670D5F    dd          00671458
 00670D5F    dd          0067147E
 00670D5F    dd          006714EA
 00670D5F    dd          0067151C
 00670D5F    dd          0067153D
 00670D5F    dd          0067155E
 00670D5F    dd          0067157F
 00670D5F    dd          006715A0
 00670D5F    dd          006715D4
 00670D5F    dd          00671655
 00670D5F    dd          006716D6
 00670D5F    dd          00671717
 00670D5F    dd          00671927
 00670D5F    dd          0067195B
 00670D5F    dd          00671987
 00670D5F    dd          006719B4
 00670D5F    dd          00671A46
 00670D5F    dd          00671A76
 00670D5F    dd          00671ACF
 00670D5F    dd          00671AE6
 00670D5F    dd          00671B07
 00670D5F    dd          00671B33
 00670D5F    dd          00671B8F
 00670D5F    dd          00671BCC
 00670D5F    dd          00671C00
 00670D5F    dd          00671C47
 00670D5F    dd          00671CB6
 00670D5F    dd          00671CD2
 00670D5F    dd          00671CF4
 00670D5F    dd          00671D16
 00670D5F    dd          00671D37
 00670D5F    dd          00671D58
 00670D5F    dd          00671D79
 00670D5F    dd          00671D9A
 00670D5F    dd          00671DBB
 00670D5F    dd          00671DFD
 00670D5F    dd          00671E1E
 00670D5F    dd          00671E66
 00670D5F    dd          00671EA8
 00670D5F    dd          00671EF0
 00670D5F    dd          00671FF2
 00670D5F    dd          00672034
 00670D5F    dd          00672055
 00670D5F    dd          0067209D
 00670D5F    dd          006720BE
 00670D5F    dd          006720DF
 00670D5F    dd          00672108
 00670D5F    dd          00672131
 00670D5F    dd          0067215A
 00670D5F    dd          00672183
 00670D5F    dd          006721AC
 00670D5F    dd          006721D5
 00670D5F    dd          006721FE
 00670D5F    dd          00672227
 00670D5F    dd          00672250
 00670D5F    dd          00672279
 00670D5F    dd          006722A2
 00670D5F    dd          006722DE
 00670D5F    dd          00672307
 00670D5F    dd          00672324
 00670D5F    dd          00672332
 00670D5F    dd          00672380
 00670D5F    dd          006723C7
 00670D5F    dd          006723F7
 00670D5F    dd          00672427
 00670D5F    dd          00672457
 00670D5F    dd          00672497
 00670D5F    dd          006724CE
 00670D5F    dd          0067251D
 00670D5F    dd          00672559
 00670D5F    dd          006725A5
 00670D5F    dd          006725D9
 00670D5F    dd          00672620
 00670D5F    dd          00672650
 00670D5F    dd          00672680
 00670D5F    dd          006726B0
 00670D5F    dd          006726F6
 00670D5F    dd          0067272A
 00670D5F    dd          006727ED
 00670D5F    dd          006727DF
 00670D5F    dd          00672817
 00670D5F    dd          006727FB
 00670D5F    dd          00672809
 00670D5F    dd          0067285A
 00670D5F    dd          0067286F
 00670D5F    dd          006728D5
 00670D5F    dd          006729D3
 00670D5F    dd          00673282
 00670D5F    dd          00672EA9
 00670D5F    dd          00673282
 00670D5F    dd          00673282
 00670D5F    dd          00673282
 00670D5F    dd          00673282
 00670D5F    dd          00673282
 00670D5F    dd          00672AE0
 00670D5F    dd          00673282
 00670D5F    dd          00672F81
 00670D5F    dd          00672CE6
 00670D5F    dd          00672B84
 00670D5F    dd          00672E94
 00670D5F    dd          00672E94
 00670D5F    dd          00672D97
 00670D5F    dd          00672E48
 00670D5F    dd          00673282
 00670D5F    dd          00672C35
 00670D5F    dd          00673282
 00670D5F    dd          00673282
 00670D5F    dd          00673282
 00670D5F    dd          00673282
 00670D5F    dd          00672FDA
 00670D5F    dd          0067301F
 00670D5F    dd          00673064
 00670D5F    dd          00673282
 00670D5F    dd          00673282
 00670D5F    dd          006731C3
 00670D5F    dd          006731F0
 00670D5F    dd          006731F0
 00670D5F    dd          006731F0
 00670D5F    dd          006731D6
 00670D5F    dd          00673201
 00670D5F    dd          0067321D
 00670D5F    dd          0067320F
 00670D5F    dd          0067323F
 00670D5F    dd          00673227
 00670D5F    dd          006730CE
 00670D5F    dd          00672F28
 00670D5F    dd          00673251
 00670D5F    dd          00671219
 00670D5F    dd          00671344
 00670D5F    dd          0067117F
 00670D5F    dd          006710FE
 00670D5F    dd          00671113
 00670D5F    dd          00670FE0
 00670D5F    dd          0067101B
 00670D5F    dd          00671056
 00670D5F    dd          00671091
 00670D5F    dd          00670FC3
 00670FB6    xor         eax,eax
 00670FB8    mov         dword ptr [ebp-10],eax
 00670FBB    mov         dword ptr [ebp-0C],eax
>00670FBE    jmp         0067328A
 00670FC3    mov         edx,1
 00670FC8    mov         eax,ebx
 00670FCA    call        TMathsFunction.ip
 00670FCF    mov         dword ptr [ebp-14],eax
 00670FD2    lea         eax,[ebp-14]
 00670FD5    fld         dword ptr [eax]
 00670FD7    fstp        qword ptr [ebp-10]
 00670FDA    wait
>00670FDB    jmp         0067328A
 00670FE0    xor         edx,edx
 00670FE2    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00670FE5    call        TList.Get
 00670FEA    lea         edx,[ebp-1F0]
 00670FF0    mov         ecx,dword ptr [eax]
 00670FF2    call        dword ptr [ecx+40]
 00670FF5    lea         eax,[ebp-50]
 00670FF8    push        eax
 00670FF9    lea         ecx,[ebp-40]
 00670FFC    lea         edx,[ebp-48]
 00670FFF    lea         eax,[ebp-1F0]
 00671005    call        005C3550
 0067100A    mov         eax,dword ptr [ebp-48]
 0067100D    mov         dword ptr [ebp-10],eax
 00671010    mov         eax,dword ptr [ebp-44]
 00671013    mov         dword ptr [ebp-0C],eax
>00671016    jmp         0067328A
 0067101B    xor         edx,edx
 0067101D    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00671020    call        TList.Get
 00671025    lea         edx,[ebp-1F0]
 0067102B    mov         ecx,dword ptr [eax]
 0067102D    call        dword ptr [ecx+40]
 00671030    lea         eax,[ebp-50]
 00671033    push        eax
 00671034    lea         ecx,[ebp-40]
 00671037    lea         edx,[ebp-48]
 0067103A    lea         eax,[ebp-1F0]
 00671040    call        005C3550
 00671045    mov         eax,dword ptr [ebp-40]
 00671048    mov         dword ptr [ebp-10],eax
 0067104B    mov         eax,dword ptr [ebp-3C]
 0067104E    mov         dword ptr [ebp-0C],eax
>00671051    jmp         0067328A
 00671056    xor         edx,edx
 00671058    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 0067105B    call        TList.Get
 00671060    lea         edx,[ebp-1F0]
 00671066    mov         ecx,dword ptr [eax]
 00671068    call        dword ptr [ecx+40]
 0067106B    lea         eax,[ebp-50]
 0067106E    push        eax
 0067106F    lea         ecx,[ebp-40]
 00671072    lea         edx,[ebp-48]
 00671075    lea         eax,[ebp-1F0]
 0067107B    call        005C3550
 00671080    mov         eax,dword ptr [ebp-50]
 00671083    mov         dword ptr [ebp-10],eax
 00671086    mov         eax,dword ptr [ebp-4C]
 00671089    mov         dword ptr [ebp-0C],eax
>0067108C    jmp         0067328A
 00671091    push        0
 00671093    call        user32.GetDC
 00671098    mov         esi,eax
 0067109A    mov         edx,2
 0067109F    mov         eax,ebx
 006710A1    call        TMathsFunction.ip
 006710A6    push        eax
 006710A7    mov         edx,1
 006710AC    mov         eax,ebx
 006710AE    call        TMathsFunction.ip
 006710B3    push        eax
 006710B4    push        esi
 006710B5    call        gdi32.GetPixel
 006710BA    mov         edx,eax
 006710BC    and         edx,0FF
 006710C2    shl         edx,10
 006710C5    mov         ecx,eax
 006710C7    shr         ecx,10
 006710CA    and         ecx,0FF
 006710D0    or          edx,ecx
 006710D2    and         eax,0FF00
 006710D7    or          edx,eax
 006710D9    mov         dword ptr [ebp-1F8],edx
 006710DF    xor         eax,eax
 006710E1    mov         dword ptr [ebp-1F4],eax
 006710E7    fild        qword ptr [ebp-1F8]
 006710ED    fstp        qword ptr [ebp-10]
 006710F0    wait
 006710F1    push        esi
 006710F2    push        0
 006710F4    call        user32.ReleaseDC
>006710F9    jmp         0067328A
 006710FE    mov         eax,[0078D560];^gvar_0078BDC8:Double
 00671103    mov         edx,dword ptr [eax]
 00671105    mov         dword ptr [ebp-10],edx
 00671108    mov         edx,dword ptr [eax+4]
 0067110B    mov         dword ptr [ebp-0C],edx
>0067110E    jmp         0067328A
 00671113    mov         eax,[0078CB88];^gvar_0078BDC0
 00671118    cmp         dword ptr [eax],0
 0067111B    sete        al
 0067111E    call        00686074
 00671123    fstp        qword ptr [ebp-10]
 00671126    wait
>00671127    jmp         0067328A
 0067112C    xor         edx,edx
 0067112E    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00671131    call        TList.Get
 00671136    mov         edx,dword ptr [eax]
 00671138    call        dword ptr [edx+44]
 0067113B    cmp         al,6
>0067113D    jne         00671168
 0067113F    xor         edx,edx
 00671141    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00671144    call        TList.Get
 00671149    lea         edx,[ebp-1F0]
 0067114F    mov         ecx,dword ptr [eax]
 00671151    call        dword ptr [ecx+40]
 00671154    lea         eax,[ebp-1F0]
 0067115A    call        005C3B88
 0067115F    fstp        qword ptr [ebp-10]
 00671162    wait
>00671163    jmp         0067328A
 00671168    mov         edx,1
 0067116D    mov         eax,ebx
 0067116F    call        TMathsFunction.p
 00671174    fabs
 00671176    fstp        qword ptr [ebp-10]
 00671179    wait
>0067117A    jmp         0067328A
 0067117F    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00671182    cmp         dword ptr [eax+8],1;TObjectList.FCount:Integer
>00671186    jl          006711B1
 00671188    xor         edx,edx
 0067118A    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 0067118D    call        TList.Get
 00671192    mov         edx,dword ptr [eax]
 00671194    call        dword ptr [edx+88]
 0067119A    xor         edx,edx
 0067119C    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 0067119F    call        TList.Get
 006711A4    mov         edx,dword ptr [eax]
 006711A6    call        dword ptr [edx]
 006711A8    fstp        qword ptr [ebp-10]
 006711AB    wait
>006711AC    jmp         0067328A
 006711B1    xor         eax,eax
 006711B3    mov         dword ptr [ebp-10],eax
 006711B6    mov         dword ptr [ebp-0C],eax
>006711B9    jmp         0067328A
 006711BE    mov         edx,1
 006711C3    mov         eax,ebx
 006711C5    call        TMathsFunction.p
 006711CA    add         esp,0FFFFFFF8
 006711CD    fstp        qword ptr [esp]
 006711D0    wait
 006711D1    call        00454B60
 006711D6    mov         dword ptr [ebp-1FC],eax
 006711DC    fild        dword ptr [ebp-1FC]
 006711E2    fstp        qword ptr [ebp-10]
 006711E5    wait
>006711E6    jmp         0067328A
 006711EB    xor         eax,eax
 006711ED    mov         dword ptr [ebp-10],eax
 006711F0    mov         dword ptr [ebp-0C],eax
>006711F3    jmp         0067328A
 006711F8    mov         edx,1
 006711FD    mov         eax,ebx
 006711FF    call        TMathsFunction.p
 00671204    add         esp,0FFFFFFF4
 00671207    fstp        tbyte ptr [esp]
 0067120A    wait
 0067120B    call        Exp
 00671210    fstp        qword ptr [ebp-10]
 00671213    wait
>00671214    jmp         0067328A
 00671219    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 0067121C    cmp         dword ptr [eax+8],2;TObjectList.FCount:Integer
>00671220    jne         006712D5
 00671226    mov         edx,1
 0067122B    mov         eax,ebx
 0067122D    call        TMathsFunction.p
 00671232    fstp        qword ptr [ebp-40]
 00671235    wait
 00671236    mov         edx,2
 0067123B    mov         eax,ebx
 0067123D    call        TMathsFunction.p
 00671242    fabs
 00671244    fstp        qword ptr [ebp-48]
 00671247    wait
 00671248    fld         qword ptr [ebp-48]
 0067124B    fcomp       dword ptr ds:[6732C0];1:Single
 00671251    wait
 00671252    fnstsw      al
 00671254    sahf
>00671255    jne         0067127A
 00671257    push        dword ptr [ebp-3C]
 0067125A    push        dword ptr [ebp-40]
 0067125D    call        004553A0
 00671262    movsx       eax,al
 00671265    mov         dword ptr [ebp-1FC],eax
 0067126B    fild        dword ptr [ebp-1FC]
 00671271    fstp        qword ptr [ebp-10]
 00671274    wait
>00671275    jmp         0067328A
 0067127A    fld         qword ptr [ebp-40]
 0067127D    fcomp       qword ptr [ebp-48]
 00671280    wait
 00671281    fnstsw      al
 00671283    sahf
>00671284    jbe         006712A0
 00671286    fld         qword ptr [ebp-40]
 00671289    fsub        qword ptr [ebp-48]
 0067128C    fld         dword ptr ds:[6732C0];1:Single
 00671292    fsub        qword ptr [ebp-48]
 00671295    fdivp       st(1),st
 00671297    fstp        qword ptr [ebp-10]
 0067129A    wait
>0067129B    jmp         0067328A
 006712A0    fld         qword ptr [ebp-48]
 006712A3    fchs
 006712A5    fcomp       qword ptr [ebp-40]
 006712A8    wait
 006712A9    fnstsw      al
 006712AB    sahf
>006712AC    jbe         006712C8
 006712AE    fld         qword ptr [ebp-40]
 006712B1    fadd        qword ptr [ebp-48]
 006712B4    fld         dword ptr ds:[6732C0];1:Single
 006712BA    fsub        qword ptr [ebp-48]
 006712BD    fdivp       st(1),st
 006712BF    fstp        qword ptr [ebp-10]
 006712C2    wait
>006712C3    jmp         0067328A
 006712C8    xor         eax,eax
 006712CA    mov         dword ptr [ebp-10],eax
 006712CD    mov         dword ptr [ebp-0C],eax
>006712D0    jmp         0067328A
 006712D5    mov         edx,1
 006712DA    mov         eax,ebx
 006712DC    call        TMathsFunction.p
 006712E1    fstp        qword ptr [ebp-40]
 006712E4    wait
 006712E5    fld         tbyte ptr ds:[6732C4];0.1:Extended
 006712EB    fcomp       qword ptr [ebp-40]
 006712EE    wait
 006712EF    fnstsw      al
 006712F1    sahf
>006712F2    jae         0067130E
 006712F4    fld         tbyte ptr ds:[6732C4];0.1:Extended
 006712FA    fsubr       qword ptr [ebp-40]
 006712FD    fld         tbyte ptr ds:[6732D0];0.9:Extended
 00671303    fdivp       st(1),st
 00671305    fstp        qword ptr [ebp-10]
 00671308    wait
>00671309    jmp         0067328A
 0067130E    fld         tbyte ptr ds:[6732DC];-0.1:Extended
 00671314    fcomp       qword ptr [ebp-40]
 00671317    wait
 00671318    fnstsw      al
 0067131A    sahf
>0067131B    jbe         00671337
 0067131D    fld         tbyte ptr ds:[6732C4];0.1:Extended
 00671323    fadd        qword ptr [ebp-40]
 00671326    fld         tbyte ptr ds:[6732D0];0.9:Extended
 0067132C    fdivp       st(1),st
 0067132E    fstp        qword ptr [ebp-10]
 00671331    wait
>00671332    jmp         0067328A
 00671337    xor         eax,eax
 00671339    mov         dword ptr [ebp-10],eax
 0067133C    mov         dword ptr [ebp-0C],eax
>0067133F    jmp         0067328A
 00671344    call        00682F08
 00671349    fstp        qword ptr [ebp-10]
 0067134C    wait
>0067134D    jmp         0067328A
 00671352    mov         edx,1
 00671357    mov         eax,ebx
 00671359    call        TMathsFunction.p
 0067135E    add         esp,0FFFFFFF8
 00671361    fstp        qword ptr [esp]
 00671364    wait
 00671365    call        00454B98
 0067136A    mov         dword ptr [ebp-1FC],eax
 00671370    fild        dword ptr [ebp-1FC]
 00671376    fstp        qword ptr [ebp-10]
 00671379    wait
>0067137A    jmp         0067328A
 0067137F    mov         edx,1
 00671384    mov         eax,ebx
 00671386    call        TMathsFunction.p
 0067138B    add         esp,0FFFFFFF4
 0067138E    fstp        tbyte ptr [esp]
 00671391    wait
 00671392    call        Frac
 00671397    fstp        qword ptr [ebp-10]
 0067139A    wait
>0067139B    jmp         0067328A
 006713A0    xor         eax,eax
 006713A2    mov         dword ptr [ebp-10],eax
 006713A5    mov         dword ptr [ebp-0C],eax
>006713A8    jmp         0067328A
 006713AD    xor         edx,edx
 006713AF    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 006713B2    call        TList.Get
 006713B7    mov         edx,dword ptr [eax]
 006713B9    call        dword ptr [edx+44]
 006713BC    test        al,al
>006713BE    jne         006713E1
 006713C0    mov         edx,1
 006713C5    mov         eax,ebx
 006713C7    call        TMathsFunction.p
 006713CC    add         esp,0FFFFFFF4
 006713CF    fstp        tbyte ptr [esp]
 006713D2    wait
 006713D3    call        Int
 006713D8    fstp        qword ptr [ebp-10]
 006713DB    wait
>006713DC    jmp         0067328A
 006713E1    xor         edx,edx
 006713E3    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 006713E6    call        TList.Get
 006713EB    mov         edx,dword ptr [eax]
 006713ED    call        dword ptr [edx+8]
 006713F0    mov         dword ptr [ebp-1FC],eax
 006713F6    fild        dword ptr [ebp-1FC]
 006713FC    fstp        qword ptr [ebp-10]
 006713FF    wait
>00671400    jmp         0067328A
 00671405    mov         edx,1
 0067140A    mov         eax,ebx
 0067140C    call        TMathsFunction.p
 00671411    add         esp,0FFFFFFF8
 00671414    fstp        qword ptr [esp]
 00671417    wait
 00671418    mov         edx,2
 0067141D    mov         eax,ebx
 0067141F    call        TMathsFunction.ip
 00671424    call        004549DC
 00671429    fstp        qword ptr [ebp-10]
 0067142C    wait
>0067142D    jmp         0067328A
 00671432    mov         edx,1
 00671437    mov         eax,ebx
 00671439    call        TMathsFunction.p
 0067143E    add         esp,0FFFFFFF8
 00671441    fstp        qword ptr [esp]
 00671444    wait
 00671445    call        0045534C
 0067144A    call        00686074
 0067144F    fstp        qword ptr [ebp-10]
 00671452    wait
>00671453    jmp         0067328A
 00671458    mov         edx,1
 0067145D    mov         eax,ebx
 0067145F    call        TMathsFunction.p
 00671464    add         esp,0FFFFFFF8
 00671467    fstp        qword ptr [esp]
 0067146A    wait
 0067146B    call        004552D4
 00671470    call        00686074
 00671475    fstp        qword ptr [ebp-10]
 00671478    wait
>00671479    jmp         0067328A
 0067147E    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00671481    cmp         dword ptr [eax+8],1;TObjectList.FCount:Integer
>00671485    jle         006714C0
 00671487    mov         edx,1
 0067148C    mov         eax,ebx
 0067148E    call        TMathsFunction.p
 00671493    add         esp,0FFFFFFF8
 00671496    fstp        qword ptr [esp]
 00671499    wait
 0067149A    mov         edx,2
 0067149F    mov         eax,ebx
 006714A1    call        TMathsFunction.p
 006714A6    add         esp,0FFFFFFF8
 006714A9    fstp        qword ptr [esp]
 006714AC    wait
 006714AD    call        004554D4
 006714B2    call        00686074
 006714B7    fstp        qword ptr [ebp-10]
 006714BA    wait
>006714BB    jmp         0067328A
 006714C0    mov         edx,1
 006714C5    mov         eax,ebx
 006714C7    call        TMathsFunction.p
 006714CC    add         esp,0FFFFFFF8
 006714CF    fstp        qword ptr [esp]
 006714D2    wait
 006714D3    push        0
 006714D5    push        0
 006714D7    call        004554D4
 006714DC    call        00686074
 006714E1    fstp        qword ptr [ebp-10]
 006714E4    wait
>006714E5    jmp         0067328A
 006714EA    mov         edx,1
 006714EF    mov         eax,ebx
 006714F1    call        TMathsFunction.p
 006714F6    add         esp,0FFFFFFF8
 006714F9    fstp        qword ptr [esp]
 006714FC    wait
 006714FD    mov         edx,2
 00671502    mov         eax,ebx
 00671504    call        TMathsFunction.p
 00671509    call        @ROUND
 0067150E    call        00454B4C
 00671513    fstp        qword ptr [ebp-10]
 00671516    wait
>00671517    jmp         0067328A
 0067151C    mov         edx,1
 00671521    mov         eax,ebx
 00671523    call        TMathsFunction.p
 00671528    add         esp,0FFFFFFF4
 0067152B    fstp        tbyte ptr [esp]
 0067152E    wait
 0067152F    call        Ln
 00671534    fstp        qword ptr [ebp-10]
 00671537    wait
>00671538    jmp         0067328A
 0067153D    mov         edx,1
 00671542    mov         eax,ebx
 00671544    call        TMathsFunction.p
 00671549    add         esp,0FFFFFFF8
 0067154C    fstp        qword ptr [esp]
 0067154F    wait
 00671550    call        00454988
 00671555    fstp        qword ptr [ebp-10]
 00671558    wait
>00671559    jmp         0067328A
 0067155E    mov         edx,1
 00671563    mov         eax,ebx
 00671565    call        TMathsFunction.p
 0067156A    add         esp,0FFFFFFF8
 0067156D    fstp        qword ptr [esp]
 00671570    wait
 00671571    call        00454BD0
 00671576    fstp        qword ptr [ebp-10]
 00671579    wait
>0067157A    jmp         0067328A
 0067157F    mov         edx,1
 00671584    mov         eax,ebx
 00671586    call        TMathsFunction.p
 0067158B    add         esp,0FFFFFFF8
 0067158E    fstp        qword ptr [esp]
 00671591    wait
 00671592    call        00454BE0
 00671597    fstp        qword ptr [ebp-10]
 0067159A    wait
>0067159B    jmp         0067328A
 006715A0    mov         edx,1
 006715A5    mov         eax,ebx
 006715A7    call        TMathsFunction.p
 006715AC    add         esp,0FFFFFFF8
 006715AF    fstp        qword ptr [esp]
 006715B2    wait
 006715B3    mov         edx,2
 006715B8    mov         eax,ebx
 006715BA    call        TMathsFunction.p
 006715BF    add         esp,0FFFFFFF8
 006715C2    fstp        qword ptr [esp]
 006715C5    wait
 006715C6    call        00454BF0
 006715CB    fstp        qword ptr [ebp-10]
 006715CE    wait
>006715CF    jmp         0067328A
 006715D4    mov         edx,1
 006715D9    mov         eax,ebx
 006715DB    call        TMathsFunction.p
 006715E0    fstp        qword ptr [ebp-88]
 006715E6    wait
 006715E7    mov         edx,2
 006715EC    mov         eax,ebx
 006715EE    call        TMathsFunction.p
 006715F3    fstp        qword ptr [ebp-90]
 006715F9    wait
 006715FA    fld         qword ptr [ebp-88]
 00671600    fcomp       qword ptr [ebp-90]
 00671606    wait
 00671607    fnstsw      al
 00671609    sahf
>0067160A    jbe         00671626
 0067160C    mov         eax,dword ptr [ebp-88]
 00671612    mov         dword ptr [ebp-98],eax
 00671618    mov         eax,dword ptr [ebp-84]
 0067161E    mov         dword ptr [ebp-94],eax
>00671624    jmp         0067163E
 00671626    mov         eax,dword ptr [ebp-90]
 0067162C    mov         dword ptr [ebp-98],eax
 00671632    mov         eax,dword ptr [ebp-8C]
 00671638    mov         dword ptr [ebp-94],eax
 0067163E    mov         eax,dword ptr [ebp-98]
 00671644    mov         dword ptr [ebp-10],eax
 00671647    mov         eax,dword ptr [ebp-94]
 0067164D    mov         dword ptr [ebp-0C],eax
>00671650    jmp         0067328A
 00671655    mov         edx,1
 0067165A    mov         eax,ebx
 0067165C    call        TMathsFunction.p
 00671661    fstp        qword ptr [ebp-0A0]
 00671667    wait
 00671668    mov         edx,2
 0067166D    mov         eax,ebx
 0067166F    call        TMathsFunction.p
 00671674    fstp        qword ptr [ebp-0A8]
 0067167A    wait
 0067167B    fld         qword ptr [ebp-0A0]
 00671681    fcomp       qword ptr [ebp-0A8]
 00671687    wait
 00671688    fnstsw      al
 0067168A    sahf
>0067168B    jae         006716A7
 0067168D    mov         eax,dword ptr [ebp-0A0]
 00671693    mov         dword ptr [ebp-0B0],eax
 00671699    mov         eax,dword ptr [ebp-9C]
 0067169F    mov         dword ptr [ebp-0AC],eax
>006716A5    jmp         006716BF
 006716A7    mov         eax,dword ptr [ebp-0A8]
 006716AD    mov         dword ptr [ebp-0B0],eax
 006716B3    mov         eax,dword ptr [ebp-0A4]
 006716B9    mov         dword ptr [ebp-0AC],eax
 006716BF    mov         eax,dword ptr [ebp-0B0]
 006716C5    mov         dword ptr [ebp-10],eax
 006716C8    mov         eax,dword ptr [ebp-0AC]
 006716CE    mov         dword ptr [ebp-0C],eax
>006716D1    jmp         0067328A
 006716D6    mov         edx,3
 006716DB    mov         eax,ebx
 006716DD    call        TMathsFunction.ip
 006716E2    push        eax
 006716E3    mov         edx,2
 006716E8    mov         eax,ebx
 006716EA    call        TMathsFunction.ip
 006716EF    push        eax
 006716F0    mov         edx,1
 006716F5    mov         eax,ebx
 006716F7    call        TMathsFunction.ip
 006716FC    push        eax
 006716FD    call        kernel32.MulDiv
 00671702    mov         dword ptr [ebp-1FC],eax
 00671708    fild        dword ptr [ebp-1FC]
 0067170E    fstp        qword ptr [ebp-10]
 00671711    wait
>00671712    jmp         0067328A
 00671717    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 0067171A    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 0067171D    cmp         eax,2
>00671720    jg          0067175E
 00671722    mov         edx,1
 00671727    mov         eax,ebx
 00671729    call        TMathsFunction.p
 0067172E    add         esp,0FFFFFFF8
 00671731    fstp        qword ptr [esp]
 00671734    wait
 00671735    mov         edx,2
 0067173A    mov         eax,ebx
 0067173C    call        TMathsFunction.p
 00671741    fstp        qword ptr [ebp-1F8]
 00671747    wait
 00671748    lea         eax,[ebp-1F8]
 0067174E    xor         edx,edx
 00671750    call        00454C08
 00671755    fstp        qword ptr [ebp-10]
 00671758    wait
>00671759    jmp         0067328A
 0067175E    cmp         eax,3
>00671761    jne         006717B5
 00671763    mov         edx,1
 00671768    mov         eax,ebx
 0067176A    call        TMathsFunction.p
 0067176F    add         esp,0FFFFFFF8
 00671772    fstp        qword ptr [esp]
 00671775    wait
 00671776    mov         edx,2
 0067177B    mov         eax,ebx
 0067177D    call        TMathsFunction.p
 00671782    fstp        qword ptr [ebp-20C]
 00671788    wait
 00671789    mov         edx,3
 0067178E    mov         eax,ebx
 00671790    call        TMathsFunction.p
 00671795    fstp        qword ptr [ebp-204]
 0067179B    wait
 0067179C    lea         eax,[ebp-20C]
 006717A2    mov         edx,1
 006717A7    call        00454C08
 006717AC    fstp        qword ptr [ebp-10]
 006717AF    wait
>006717B0    jmp         0067328A
 006717B5    cmp         eax,4
>006717B8    jne         0067181F
 006717BA    mov         edx,1
 006717BF    mov         eax,ebx
 006717C1    call        TMathsFunction.p
 006717C6    add         esp,0FFFFFFF8
 006717C9    fstp        qword ptr [esp]
 006717CC    wait
 006717CD    mov         edx,2
 006717D2    mov         eax,ebx
 006717D4    call        TMathsFunction.p
 006717D9    fstp        qword ptr [ebp-224]
 006717DF    wait
 006717E0    mov         edx,3
 006717E5    mov         eax,ebx
 006717E7    call        TMathsFunction.p
 006717EC    fstp        qword ptr [ebp-21C]
 006717F2    wait
 006717F3    mov         edx,4
 006717F8    mov         eax,ebx
 006717FA    call        TMathsFunction.p
 006717FF    fstp        qword ptr [ebp-214]
 00671805    wait
 00671806    lea         eax,[ebp-224]
 0067180C    mov         edx,2
 00671811    call        00454C08
 00671816    fstp        qword ptr [ebp-10]
 00671819    wait
>0067181A    jmp         0067328A
 0067181F    cmp         eax,5
>00671822    jne         0067189C
 00671824    mov         edx,1
 00671829    mov         eax,ebx
 0067182B    call        TMathsFunction.p
 00671830    add         esp,0FFFFFFF8
 00671833    fstp        qword ptr [esp]
 00671836    wait
 00671837    mov         edx,2
 0067183C    mov         eax,ebx
 0067183E    call        TMathsFunction.p
 00671843    fstp        qword ptr [ebp-244]
 00671849    wait
 0067184A    mov         edx,3
 0067184F    mov         eax,ebx
 00671851    call        TMathsFunction.p
 00671856    fstp        qword ptr [ebp-23C]
 0067185C    wait
 0067185D    mov         edx,4
 00671862    mov         eax,ebx
 00671864    call        TMathsFunction.p
 00671869    fstp        qword ptr [ebp-234]
 0067186F    wait
 00671870    mov         edx,5
 00671875    mov         eax,ebx
 00671877    call        TMathsFunction.p
 0067187C    fstp        qword ptr [ebp-22C]
 00671882    wait
 00671883    lea         eax,[ebp-244]
 00671889    mov         edx,3
 0067188E    call        00454C08
 00671893    fstp        qword ptr [ebp-10]
 00671896    wait
>00671897    jmp         0067328A
 0067189C    mov         edx,1
 006718A1    mov         eax,ebx
 006718A3    call        TMathsFunction.p
 006718A8    add         esp,0FFFFFFF8
 006718AB    fstp        qword ptr [esp]
 006718AE    wait
 006718AF    mov         edx,2
 006718B4    mov         eax,ebx
 006718B6    call        TMathsFunction.p
 006718BB    fstp        qword ptr [ebp-26C]
 006718C1    wait
 006718C2    mov         edx,3
 006718C7    mov         eax,ebx
 006718C9    call        TMathsFunction.p
 006718CE    fstp        qword ptr [ebp-264]
 006718D4    wait
 006718D5    mov         edx,4
 006718DA    mov         eax,ebx
 006718DC    call        TMathsFunction.p
 006718E1    fstp        qword ptr [ebp-25C]
 006718E7    wait
 006718E8    mov         edx,5
 006718ED    mov         eax,ebx
 006718EF    call        TMathsFunction.p
 006718F4    fstp        qword ptr [ebp-254]
 006718FA    wait
 006718FB    mov         edx,6
 00671900    mov         eax,ebx
 00671902    call        TMathsFunction.p
 00671907    fstp        qword ptr [ebp-24C]
 0067190D    wait
 0067190E    lea         eax,[ebp-26C]
 00671914    mov         edx,4
 00671919    call        00454C08
 0067191E    fstp        qword ptr [ebp-10]
 00671921    wait
>00671922    jmp         0067328A
 00671927    mov         edx,1
 0067192C    mov         eax,ebx
 0067192E    call        TMathsFunction.p
 00671933    add         esp,0FFFFFFF8
 00671936    fstp        qword ptr [esp]
 00671939    wait
 0067193A    mov         edx,2
 0067193F    mov         eax,ebx
 00671941    call        TMathsFunction.p
 00671946    add         esp,0FFFFFFF8
 00671949    fstp        qword ptr [esp]
 0067194C    wait
 0067194D    call        00454CCC
 00671952    fstp        qword ptr [ebp-10]
 00671955    wait
>00671956    jmp         0067328A
 0067195B    mov         edx,1
 00671960    mov         eax,ebx
 00671962    call        TMathsFunction.p
 00671967    call        @ROUND
 0067196C    mov         dword ptr [ebp-1F8],eax
 00671972    mov         dword ptr [ebp-1F4],edx
 00671978    fild        qword ptr [ebp-1F8]
 0067197E    fstp        qword ptr [ebp-10]
 00671981    wait
>00671982    jmp         0067328A
 00671987    mov         edx,1
 0067198C    mov         eax,ebx
 0067198E    call        TMathsFunction.p
 00671993    add         esp,0FFFFFFF4
 00671996    fstp        tbyte ptr [esp]
 00671999    wait
 0067199A    mov         edx,2
 0067199F    mov         eax,ebx
 006719A1    call        TMathsFunction.ip
 006719A6    call        004548BC
 006719AB    fstp        qword ptr [ebp-10]
 006719AE    wait
>006719AF    jmp         0067328A
 006719B4    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 006719B7    cmp         dword ptr [eax+8],2;TObjectList.FCount:Integer
>006719BB    jle         00671A09
 006719BD    mov         edx,1
 006719C2    mov         eax,ebx
 006719C4    call        TMathsFunction.p
 006719C9    add         esp,0FFFFFFF8
 006719CC    fstp        qword ptr [esp]
 006719CF    wait
 006719D0    mov         edx,2
 006719D5    mov         eax,ebx
 006719D7    call        TMathsFunction.p
 006719DC    add         esp,0FFFFFFF8
 006719DF    fstp        qword ptr [esp]
 006719E2    wait
 006719E3    mov         edx,3
 006719E8    mov         eax,ebx
 006719EA    call        TMathsFunction.p
 006719EF    add         esp,0FFFFFFF8
 006719F2    fstp        qword ptr [esp]
 006719F5    wait
 006719F6    call        004553E8
 006719FB    call        00686074
 00671A00    fstp        qword ptr [ebp-10]
 00671A03    wait
>00671A04    jmp         0067328A
 00671A09    mov         edx,1
 00671A0E    mov         eax,ebx
 00671A10    call        TMathsFunction.p
 00671A15    add         esp,0FFFFFFF8
 00671A18    fstp        qword ptr [esp]
 00671A1B    wait
 00671A1C    mov         edx,2
 00671A21    mov         eax,ebx
 00671A23    call        TMathsFunction.p
 00671A28    add         esp,0FFFFFFF8
 00671A2B    fstp        qword ptr [esp]
 00671A2E    wait
 00671A2F    push        0
 00671A31    push        0
 00671A33    call        004553E8
 00671A38    call        00686074
 00671A3D    fstp        qword ptr [ebp-10]
 00671A40    wait
>00671A41    jmp         0067328A
 00671A46    mov         edx,1
 00671A4B    mov         eax,ebx
 00671A4D    call        TMathsFunction.p
 00671A52    add         esp,0FFFFFFF8
 00671A55    fstp        qword ptr [esp]
 00671A58    wait
 00671A59    call        004553A0
 00671A5E    movsx       eax,al
 00671A61    mov         dword ptr [ebp-1FC],eax
 00671A67    fild        dword ptr [ebp-1FC]
 00671A6D    fstp        qword ptr [ebp-10]
 00671A70    wait
>00671A71    jmp         0067328A
 00671A76    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00671A79    cmp         dword ptr [eax+8],1;TObjectList.FCount:Integer
>00671A7D    jle         00671AAC
 00671A7F    mov         edx,1
 00671A84    mov         eax,ebx
 00671A86    call        TMathsFunction.p
 00671A8B    add         esp,0FFFFFFF8
 00671A8E    fstp        qword ptr [esp]
 00671A91    wait
 00671A92    mov         edx,2
 00671A97    mov         eax,ebx
 00671A99    call        TMathsFunction.ip
 00671A9E    call        00454908
 00671AA3    fstp        qword ptr [ebp-10]
 00671AA6    wait
>00671AA7    jmp         0067328A
 00671AAC    mov         edx,1
 00671AB1    mov         eax,ebx
 00671AB3    call        TMathsFunction.p
 00671AB8    add         esp,0FFFFFFF8
 00671ABB    fstp        qword ptr [esp]
 00671ABE    wait
 00671ABF    mov         al,0FE
 00671AC1    call        00454908
 00671AC6    fstp        qword ptr [ebp-10]
 00671AC9    wait
>00671ACA    jmp         0067328A
 00671ACF    mov         edx,1
 00671AD4    mov         eax,ebx
 00671AD6    call        TMathsFunction.p
 00671ADB    fmul        st,st(0)
 00671ADD    fstp        qword ptr [ebp-10]
 00671AE0    wait
>00671AE1    jmp         0067328A
 00671AE6    mov         edx,1
 00671AEB    mov         eax,ebx
 00671AED    call        TMathsFunction.p
 00671AF2    add         esp,0FFFFFFF4
 00671AF5    fstp        tbyte ptr [esp]
 00671AF8    wait
 00671AF9    call        Sqrt
 00671AFE    fstp        qword ptr [ebp-10]
 00671B01    wait
>00671B02    jmp         0067328A
 00671B07    mov         edx,1
 00671B0C    mov         eax,ebx
 00671B0E    call        TMathsFunction.p
 00671B13    call        @TRUNC
 00671B18    mov         dword ptr [ebp-1F8],eax
 00671B1E    mov         dword ptr [ebp-1F4],edx
 00671B24    fild        qword ptr [ebp-1F8]
 00671B2A    fstp        qword ptr [ebp-10]
 00671B2D    wait
>00671B2E    jmp         0067328A
 00671B33    mov         edx,1
 00671B38    mov         eax,ebx
 00671B3A    call        TMathsFunction.p
 00671B3F    add         esp,0FFFFFFF8
 00671B42    fstp        qword ptr [esp]
 00671B45    wait
 00671B46    xor         edx,edx
 00671B48    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00671B4B    call        TList.Get
 00671B50    mov         edx,dword ptr ds:[67DB04];TExpression
 00671B56    call        @AsClass
 00671B5B    push        eax
 00671B5C    mov         edx,1
 00671B61    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00671B64    call        TList.Get
 00671B69    mov         edx,dword ptr ds:[67DB04];TExpression
 00671B6F    call        @AsClass
 00671B74    pop         edx
 00671B75    mov         ecx,dword ptr [eax]
 00671B77    call        dword ptr [ecx+14];TExpression.EvaluateToMatch
 00671B7A    add         esp,0FFFFFFF8
 00671B7D    fstp        qword ptr [esp]
 00671B80    wait
 00671B81    call        00455620
 00671B86    fstp        qword ptr [ebp-10]
 00671B89    wait
>00671B8A    jmp         0067328A
 00671B8F    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00671B92    cmp         dword ptr [eax+8],1;TObjectList.FCount:Integer
>00671B96    jge         00671BA6
 00671B98    call        Random
 00671B9D    fstp        qword ptr [ebp-10]
 00671BA0    wait
>00671BA1    jmp         0067328A
 00671BA6    mov         edx,1
 00671BAB    mov         eax,ebx
 00671BAD    call        TMathsFunction.ip
 00671BB2    call        Random
 00671BB7    mov         dword ptr [ebp-1FC],eax
 00671BBD    fild        dword ptr [ebp-1FC]
 00671BC3    fstp        qword ptr [ebp-10]
 00671BC6    wait
>00671BC7    jmp         0067328A
 00671BCC    mov         edx,2
 00671BD1    mov         eax,ebx
 00671BD3    call        TMathsFunction.ip
 00671BD8    push        eax
 00671BD9    mov         edx,1
 00671BDE    mov         eax,ebx
 00671BE0    call        TMathsFunction.ip
 00671BE5    pop         edx
 00671BE6    call        0045550C
 00671BEB    mov         dword ptr [ebp-1FC],eax
 00671BF1    fild        dword ptr [ebp-1FC]
 00671BF7    fstp        qword ptr [ebp-10]
 00671BFA    wait
>00671BFB    jmp         0067328A
 00671C00    mov         edx,1
 00671C05    mov         eax,ebx
 00671C07    call        TMathsFunction.p
 00671C0C    add         esp,0FFFFFFF8
 00671C0F    fstp        qword ptr [esp]
 00671C12    wait
 00671C13    mov         edx,2
 00671C18    mov         eax,ebx
 00671C1A    call        TMathsFunction.p
 00671C1F    add         esp,0FFFFFFF8
 00671C22    fstp        qword ptr [esp]
 00671C25    wait
 00671C26    mov         edx,3
 00671C2B    mov         eax,ebx
 00671C2D    call        TMathsFunction.p
 00671C32    add         esp,0FFFFFFF8
 00671C35    fstp        qword ptr [esp]
 00671C38    wait
 00671C39    call        00455534
 00671C3E    fstp        qword ptr [ebp-10]
 00671C41    wait
>00671C42    jmp         0067328A
 00671C47    mov         edx,1
 00671C4C    mov         eax,ebx
 00671C4E    call        TMathsFunction.p
 00671C53    fstp        qword ptr [ebp-0B8]
 00671C59    wait
 00671C5A    mov         edx,2
 00671C5F    mov         eax,ebx
 00671C61    call        TMathsFunction.p
 00671C66    fstp        qword ptr [ebp-0C0]
 00671C6C    wait
 00671C6D    mov         edx,3
 00671C72    mov         eax,ebx
 00671C74    call        TMathsFunction.p
 00671C79    fstp        qword ptr [ebp-0C8]
 00671C7F    wait
 00671C80    fld         qword ptr [ebp-0B8]
 00671C86    fcomp       qword ptr [ebp-0C0]
 00671C8C    wait
 00671C8D    fnstsw      al
 00671C8F    sahf
 00671C90    setae       dl
 00671C93    fld         qword ptr [ebp-0B8]
 00671C99    fcomp       qword ptr [ebp-0C8]
 00671C9F    wait
 00671CA0    fnstsw      al
 00671CA2    sahf
 00671CA3    setbe       al
 00671CA6    and         al,dl
 00671CA8    call        00686074
 00671CAD    fstp        qword ptr [ebp-10]
 00671CB0    wait
>00671CB1    jmp         0067328A
 00671CB6    mov         edx,1
 00671CBB    mov         eax,ebx
 00671CBD    call        TMathsFunction.ip
 00671CC2    and         al,1
 00671CC4    call        00686074
 00671CC9    fstp        qword ptr [ebp-10]
 00671CCC    wait
>00671CCD    jmp         0067328A
 00671CD2    mov         edx,1
 00671CD7    mov         eax,ebx
 00671CD9    call        TMathsFunction.ip
 00671CDE    dec         eax
 00671CDF    mov         dword ptr [ebp-1FC],eax
 00671CE5    fild        dword ptr [ebp-1FC]
 00671CEB    fstp        qword ptr [ebp-10]
 00671CEE    wait
>00671CEF    jmp         0067328A
 00671CF4    mov         edx,1
 00671CF9    mov         eax,ebx
 00671CFB    call        TMathsFunction.ip
 00671D00    inc         eax
 00671D01    mov         dword ptr [ebp-1FC],eax
 00671D07    fild        dword ptr [ebp-1FC]
 00671D0D    fstp        qword ptr [ebp-10]
 00671D10    wait
>00671D11    jmp         0067328A
 00671D16    mov         edx,1
 00671D1B    mov         eax,ebx
 00671D1D    call        TMathsFunction.ap
 00671D22    add         esp,0FFFFFFF4
 00671D25    fstp        tbyte ptr [esp]
 00671D28    wait
 00671D29    call        Sin
 00671D2E    fstp        qword ptr [ebp-10]
 00671D31    wait
>00671D32    jmp         0067328A
 00671D37    mov         edx,1
 00671D3C    mov         eax,ebx
 00671D3E    call        TMathsFunction.ap
 00671D43    add         esp,0FFFFFFF4
 00671D46    fstp        tbyte ptr [esp]
 00671D49    wait
 00671D4A    call        Cos
 00671D4F    fstp        qword ptr [ebp-10]
 00671D52    wait
>00671D53    jmp         0067328A
 00671D58    mov         edx,1
 00671D5D    mov         eax,ebx
 00671D5F    call        TMathsFunction.ap
 00671D64    add         esp,0FFFFFFF8
 00671D67    fstp        qword ptr [esp]
 00671D6A    wait
 00671D6B    call        00454ABC
 00671D70    fstp        qword ptr [ebp-10]
 00671D73    wait
>00671D74    jmp         0067328A
 00671D79    mov         edx,1
 00671D7E    mov         eax,ebx
 00671D80    call        TMathsFunction.ap
 00671D85    add         esp,0FFFFFFF8
 00671D88    fstp        qword ptr [esp]
 00671D8B    wait
 00671D8C    call        00454B00
 00671D91    fstp        qword ptr [ebp-10]
 00671D94    wait
>00671D95    jmp         0067328A
 00671D9A    mov         edx,1
 00671D9F    mov         eax,ebx
 00671DA1    call        TMathsFunction.ap
 00671DA6    add         esp,0FFFFFFF8
 00671DA9    fstp        qword ptr [esp]
 00671DAC    wait
 00671DAD    call        00454DD4
 00671DB2    fstp        qword ptr [ebp-10]
 00671DB5    wait
>00671DB6    jmp         0067328A
 00671DBB    mov         edx,1
 00671DC0    mov         eax,ebx
 00671DC2    call        TMathsFunction.ap
 00671DC7    fstp        qword ptr [ebp-0D0]
 00671DCD    wait
 00671DCE    push        dword ptr [ebp-0CC]
 00671DD4    push        dword ptr [ebp-0D0]
 00671DDA    call        00454ADC
 00671DDF    fstp        qword ptr [ebp-0D8]
 00671DE5    wait
 00671DE6    mov         eax,dword ptr [ebp-0D8]
 00671DEC    mov         dword ptr [ebp-10],eax
 00671DEF    mov         eax,dword ptr [ebp-0D4]
 00671DF5    mov         dword ptr [ebp-0C],eax
>00671DF8    jmp         0067328A
 00671DFD    mov         edx,1
 00671E02    mov         eax,ebx
 00671E04    call        TMathsFunction.ap
 00671E09    add         esp,0FFFFFFF8
 00671E0C    fstp        qword ptr [esp]
 00671E0F    wait
 00671E10    call        00454ADC
 00671E15    fstp        qword ptr [ebp-10]
 00671E18    wait
>00671E19    jmp         0067328A
 00671E1E    mov         edx,1
 00671E23    mov         eax,ebx
 00671E25    call        TMathsFunction.ap
 00671E2A    fstp        qword ptr [ebp-0E0]
 00671E30    wait
 00671E31    push        dword ptr [ebp-0DC]
 00671E37    push        dword ptr [ebp-0E0]
 00671E3D    call        00454EA0
 00671E42    fdivr       dword ptr ds:[6732C0];1:Single
 00671E48    fstp        qword ptr [ebp-0E8]
 00671E4E    wait
 00671E4F    mov         eax,dword ptr [ebp-0E8]
 00671E55    mov         dword ptr [ebp-10],eax
 00671E58    mov         eax,dword ptr [ebp-0E4]
 00671E5E    mov         dword ptr [ebp-0C],eax
>00671E61    jmp         0067328A
 00671E66    mov         edx,1
 00671E6B    mov         eax,ebx
 00671E6D    call        TMathsFunction.ap
 00671E72    fstp        qword ptr [ebp-0F0]
 00671E78    wait
 00671E79    push        dword ptr [ebp-0EC]
 00671E7F    push        dword ptr [ebp-0F0]
 00671E85    call        00454B00
 00671E8A    fstp        qword ptr [ebp-0F8]
 00671E90    wait
 00671E91    mov         eax,dword ptr [ebp-0F8]
 00671E97    mov         dword ptr [ebp-10],eax
 00671E9A    mov         eax,dword ptr [ebp-0F4]
 00671EA0    mov         dword ptr [ebp-0C],eax
>00671EA3    jmp         0067328A
 00671EA8    mov         edx,1
 00671EAD    mov         eax,ebx
 00671EAF    call        TMathsFunction.ap
 00671EB4    fstp        qword ptr [ebp-100]
 00671EBA    wait
 00671EBB    push        dword ptr [ebp-0FC]
 00671EC1    push        dword ptr [ebp-100]
 00671EC7    call        00454E3C
 00671ECC    fdivr       dword ptr ds:[6732C0];1:Single
 00671ED2    fstp        qword ptr [ebp-108]
 00671ED8    wait
 00671ED9    mov         eax,dword ptr [ebp-108]
 00671EDF    mov         dword ptr [ebp-10],eax
 00671EE2    mov         eax,dword ptr [ebp-104]
 00671EE8    mov         dword ptr [ebp-0C],eax
>00671EEB    jmp         0067328A
 00671EF0    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00671EF3    cmp         dword ptr [eax+8],1;TObjectList.FCount:Integer
>00671EF7    jne         00671F54
 00671EF9    lea         eax,[ebp-50]
 00671EFC    push        eax
 00671EFD    xor         edx,edx
 00671EFF    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00671F02    call        TList.Get
 00671F07    lea         ecx,[ebp-48]
 00671F0A    lea         edx,[ebp-40]
 00671F0D    mov         ebx,dword ptr [eax]
 00671F0F    call        dword ptr [ebx+20]
 00671F12    fld         qword ptr [ebp-40]
 00671F15    fmul        st,st(0)
 00671F17    fstp        tbyte ptr [ebp-278]
 00671F1D    wait
 00671F1E    fld         qword ptr [ebp-48]
 00671F21    fmul        st,st(0)
 00671F23    fld         tbyte ptr [ebp-278]
 00671F29    faddp       st(1),st
 00671F2B    fstp        tbyte ptr [ebp-284]
 00671F31    wait
 00671F32    fld         qword ptr [ebp-50]
 00671F35    fmul        st,st(0)
 00671F37    fld         tbyte ptr [ebp-284]
 00671F3D    faddp       st(1),st
 00671F3F    add         esp,0FFFFFFF4
 00671F42    fstp        tbyte ptr [esp]
 00671F45    wait
 00671F46    call        Sqrt
 00671F4B    fstp        qword ptr [ebp-10]
 00671F4E    wait
>00671F4F    jmp         0067328A
 00671F54    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00671F57    cmp         dword ptr [eax+8],3;TObjectList.FCount:Integer
>00671F5B    jge         00671F95
 00671F5D    mov         edx,1
 00671F62    mov         eax,ebx
 00671F64    call        TMathsFunction.p
 00671F69    add         esp,0FFFFFFF8
 00671F6C    fstp        qword ptr [esp]
 00671F6F    wait
 00671F70    mov         edx,2
 00671F75    mov         eax,ebx
 00671F77    call        TMathsFunction.p
 00671F7C    add         esp,0FFFFFFF8
 00671F7F    fstp        qword ptr [esp]
 00671F82    wait
 00671F83    push        0
 00671F85    push        0
 00671F87    call        005C4070
 00671F8C    fstp        qword ptr [ebp-10]
 00671F8F    wait
>00671F90    jmp         0067328A
 00671F95    mov         edx,1
 00671F9A    mov         eax,ebx
 00671F9C    call        TMathsFunction.p
 00671FA1    fmul        st,st(0)
 00671FA3    fstp        tbyte ptr [ebp-278]
 00671FA9    wait
 00671FAA    mov         edx,2
 00671FAF    mov         eax,ebx
 00671FB1    call        TMathsFunction.p
 00671FB6    fmul        st,st(0)
 00671FB8    fld         tbyte ptr [ebp-278]
 00671FBE    faddp       st(1),st
 00671FC0    fstp        tbyte ptr [ebp-284]
 00671FC6    wait
 00671FC7    mov         edx,3
 00671FCC    mov         eax,ebx
 00671FCE    call        TMathsFunction.p
 00671FD3    fmul        st,st(0)
 00671FD5    fld         tbyte ptr [ebp-284]
 00671FDB    faddp       st(1),st
 00671FDD    add         esp,0FFFFFFF4
 00671FE0    fstp        tbyte ptr [esp]
 00671FE3    wait
 00671FE4    call        Sqrt
 00671FE9    fstp        qword ptr [ebp-10]
 00671FEC    wait
>00671FED    jmp         0067328A
 00671FF2    mov         edx,1
 00671FF7    mov         eax,ebx
 00671FF9    call        TMathsFunction.ap
 00671FFE    fstp        qword ptr [ebp-110]
 00672004    wait
 00672005    push        dword ptr [ebp-10C]
 0067200B    push        dword ptr [ebp-110]
 00672011    call        00454AEC
 00672016    fstp        qword ptr [ebp-118]
 0067201C    wait
 0067201D    mov         eax,dword ptr [ebp-118]
 00672023    mov         dword ptr [ebp-10],eax
 00672026    mov         eax,dword ptr [ebp-114]
 0067202C    mov         dword ptr [ebp-0C],eax
>0067202F    jmp         0067328A
 00672034    mov         edx,1
 00672039    mov         eax,ebx
 0067203B    call        TMathsFunction.ap
 00672040    add         esp,0FFFFFFF8
 00672043    fstp        qword ptr [esp]
 00672046    wait
 00672047    call        00454AEC
 0067204C    fstp        qword ptr [ebp-10]
 0067204F    wait
>00672050    jmp         0067328A
 00672055    mov         edx,1
 0067205A    mov         eax,ebx
 0067205C    call        TMathsFunction.ap
 00672061    fstp        qword ptr [ebp-120]
 00672067    wait
 00672068    push        dword ptr [ebp-11C]
 0067206E    push        dword ptr [ebp-120]
 00672074    call        00454DD4
 00672079    fdivr       dword ptr ds:[6732C0];1:Single
 0067207F    fstp        qword ptr [ebp-128]
 00672085    wait
 00672086    mov         eax,dword ptr [ebp-128]
 0067208C    mov         dword ptr [ebp-10],eax
 0067208F    mov         eax,dword ptr [ebp-124]
 00672095    mov         dword ptr [ebp-0C],eax
>00672098    jmp         0067328A
 0067209D    mov         edx,1
 006720A2    mov         eax,ebx
 006720A4    call        TMathsFunction.ap
 006720A9    add         esp,0FFFFFFF8
 006720AC    fstp        qword ptr [esp]
 006720AF    wait
 006720B0    call        00454E3C
 006720B5    fstp        qword ptr [ebp-10]
 006720B8    wait
>006720B9    jmp         0067328A
 006720BE    mov         edx,1
 006720C3    mov         eax,ebx
 006720C5    call        TMathsFunction.ap
 006720CA    add         esp,0FFFFFFF8
 006720CD    fstp        qword ptr [esp]
 006720D0    wait
 006720D1    call        00454EA0
 006720D6    fstp        qword ptr [ebp-10]
 006720D9    wait
>006720DA    jmp         0067328A
 006720DF    mov         edx,1
 006720E4    mov         eax,ebx
 006720E6    call        TMathsFunction.p
 006720EB    add         esp,0FFFFFFF8
 006720EE    fstp        qword ptr [esp]
 006720F1    wait
 006720F2    call        00454A28
 006720F7    fld         tbyte ptr ds:[6732E8];57.2957795130823:Extended
 006720FD    fmulp       st(1),st
 006720FF    fstp        qword ptr [ebp-10]
 00672102    wait
>00672103    jmp         0067328A
 00672108    mov         edx,1
 0067210D    mov         eax,ebx
 0067210F    call        TMathsFunction.p
 00672114    add         esp,0FFFFFFF8
 00672117    fstp        qword ptr [esp]
 0067211A    wait
 0067211B    call        00454EF0
 00672120    fld         tbyte ptr ds:[6732E8];57.2957795130823:Extended
 00672126    fmulp       st(1),st
 00672128    fstp        qword ptr [ebp-10]
 0067212B    wait
>0067212C    jmp         0067328A
 00672131    mov         edx,1
 00672136    mov         eax,ebx
 00672138    call        TMathsFunction.p
 0067213D    add         esp,0FFFFFFF8
 00672140    fstp        qword ptr [esp]
 00672143    wait
 00672144    call        00455018
 00672149    fld         tbyte ptr ds:[6732E8];57.2957795130823:Extended
 0067214F    fmulp       st(1),st
 00672151    fstp        qword ptr [ebp-10]
 00672154    wait
>00672155    jmp         0067328A
 0067215A    mov         edx,1
 0067215F    mov         eax,ebx
 00672161    call        TMathsFunction.p
 00672166    add         esp,0FFFFFFF8
 00672169    fstp        qword ptr [esp]
 0067216C    wait
 0067216D    call        00455108
 00672172    fld         tbyte ptr ds:[6732E8];57.2957795130823:Extended
 00672178    fmulp       st(1),st
 0067217A    fstp        qword ptr [ebp-10]
 0067217D    wait
>0067217E    jmp         0067328A
 00672183    mov         edx,1
 00672188    mov         eax,ebx
 0067218A    call        TMathsFunction.p
 0067218F    add         esp,0FFFFFFF8
 00672192    fstp        qword ptr [esp]
 00672195    wait
 00672196    call        004550B8
 0067219B    fld         tbyte ptr ds:[6732E8];57.2957795130823:Extended
 006721A1    fmulp       st(1),st
 006721A3    fstp        qword ptr [ebp-10]
 006721A6    wait
>006721A7    jmp         0067328A
 006721AC    mov         edx,1
 006721B1    mov         eax,ebx
 006721B3    call        TMathsFunction.p
 006721B8    add         esp,0FFFFFFF8
 006721BB    fstp        qword ptr [esp]
 006721BE    wait
 006721BF    call        00455228
 006721C4    fld         tbyte ptr ds:[6732E8];57.2957795130823:Extended
 006721CA    fmulp       st(1),st
 006721CC    fstp        qword ptr [ebp-10]
 006721CF    wait
>006721D0    jmp         0067328A
 006721D5    mov         edx,1
 006721DA    mov         eax,ebx
 006721DC    call        TMathsFunction.p
 006721E1    add         esp,0FFFFFFF8
 006721E4    fstp        qword ptr [esp]
 006721E7    wait
 006721E8    call        00455068
 006721ED    fld         tbyte ptr ds:[6732E8];57.2957795130823:Extended
 006721F3    fmulp       st(1),st
 006721F5    fstp        qword ptr [ebp-10]
 006721F8    wait
>006721F9    jmp         0067328A
 006721FE    mov         edx,1
 00672203    mov         eax,ebx
 00672205    call        TMathsFunction.p
 0067220A    add         esp,0FFFFFFF8
 0067220D    fstp        qword ptr [esp]
 00672210    wait
 00672211    call        0045519C
 00672216    fld         tbyte ptr ds:[6732E8];57.2957795130823:Extended
 0067221C    fmulp       st(1),st
 0067221E    fstp        qword ptr [ebp-10]
 00672221    wait
>00672222    jmp         0067328A
 00672227    mov         edx,1
 0067222C    mov         eax,ebx
 0067222E    call        TMathsFunction.p
 00672233    add         esp,0FFFFFFF8
 00672236    fstp        qword ptr [esp]
 00672239    wait
 0067223A    call        00454A5C
 0067223F    fld         tbyte ptr ds:[6732E8];57.2957795130823:Extended
 00672245    fmulp       st(1),st
 00672247    fstp        qword ptr [ebp-10]
 0067224A    wait
>0067224B    jmp         0067328A
 00672250    mov         edx,1
 00672255    mov         eax,ebx
 00672257    call        TMathsFunction.p
 0067225C    add         esp,0FFFFFFF8
 0067225F    fstp        qword ptr [esp]
 00672262    wait
 00672263    call        00454F44
 00672268    fld         tbyte ptr ds:[6732E8];57.2957795130823:Extended
 0067226E    fmulp       st(1),st
 00672270    fstp        qword ptr [ebp-10]
 00672273    wait
>00672274    jmp         0067328A
 00672279    mov         edx,1
 0067227E    mov         eax,ebx
 00672280    call        TMathsFunction.p
 00672285    add         esp,0FFFFFFF4
 00672288    fstp        tbyte ptr [esp]
 0067228B    wait
 0067228C    call        ArcTan
 00672291    fld         tbyte ptr ds:[6732E8];57.2957795130823:Extended
 00672297    fmulp       st(1),st
 00672299    fstp        qword ptr [ebp-10]
 0067229C    wait
>0067229D    jmp         0067328A
 006722A2    mov         edx,1
 006722A7    mov         eax,ebx
 006722A9    call        TMathsFunction.p
 006722AE    add         esp,0FFFFFFF8
 006722B1    fstp        qword ptr [esp]
 006722B4    wait
 006722B5    mov         edx,2
 006722BA    mov         eax,ebx
 006722BC    call        TMathsFunction.p
 006722C1    add         esp,0FFFFFFF8
 006722C4    fstp        qword ptr [esp]
 006722C7    wait
 006722C8    call        00454A9C
 006722CD    fld         tbyte ptr ds:[6732E8];57.2957795130823:Extended
 006722D3    fmulp       st(1),st
 006722D5    fstp        qword ptr [ebp-10]
 006722D8    wait
>006722D9    jmp         0067328A
 006722DE    mov         edx,1
 006722E3    mov         eax,ebx
 006722E5    call        TMathsFunction.p
 006722EA    add         esp,0FFFFFFF8
 006722ED    fstp        qword ptr [esp]
 006722F0    wait
 006722F1    call        00454F84
 006722F6    fld         tbyte ptr ds:[6732E8];57.2957795130823:Extended
 006722FC    fmulp       st(1),st
 006722FE    fstp        qword ptr [ebp-10]
 00672301    wait
>00672302    jmp         0067328A
 00672307    call        CurrentYear
 0067230C    movzx       eax,ax
 0067230F    mov         dword ptr [ebp-1FC],eax
 00672315    fild        dword ptr [ebp-1FC]
 0067231B    fstp        qword ptr [ebp-10]
 0067231E    wait
>0067231F    jmp         0067328A
 00672324    call        Date
 00672329    fstp        qword ptr [ebp-10]
 0067232C    wait
>0067232D    jmp         0067328A
 00672332    mov         edx,1
 00672337    mov         eax,ebx
 00672339    call        TMathsFunction.p
 0067233E    fstp        qword ptr [ebp-130]
 00672344    wait
 00672345    fld         qword ptr [ebp-130]
 0067234B    call        @TRUNC
 00672350    mov         dword ptr [ebp-1F8],eax
 00672356    mov         dword ptr [ebp-1F4],edx
 0067235C    fild        qword ptr [ebp-1F8]
 00672362    fstp        qword ptr [ebp-138]
 00672368    wait
 00672369    mov         eax,dword ptr [ebp-138]
 0067236F    mov         dword ptr [ebp-10],eax
 00672372    mov         eax,dword ptr [ebp-134]
 00672378    mov         dword ptr [ebp-0C],eax
>0067237B    jmp         0067328A
 00672380    mov         edx,1
 00672385    mov         eax,ebx
 00672387    call        TMathsFunction.p
 0067238C    fstp        qword ptr [ebp-140]
 00672392    wait
 00672393    push        dword ptr [ebp-13C]
 00672399    push        dword ptr [ebp-140]
 0067239F    call        004570F4
 006723A4    mov         word ptr [ebp-142],ax
 006723AB    movzx       eax,word ptr [ebp-142]
 006723B2    mov         dword ptr [ebp-1FC],eax
 006723B8    fild        dword ptr [ebp-1FC]
 006723BE    fstp        qword ptr [ebp-10]
 006723C1    wait
>006723C2    jmp         0067328A
 006723C7    mov         edx,1
 006723CC    mov         eax,ebx
 006723CE    call        TMathsFunction.p
 006723D3    add         esp,0FFFFFFF8
 006723D6    fstp        qword ptr [esp]
 006723D9    wait
 006723DA    call        00457210
 006723DF    movzx       eax,ax
 006723E2    mov         dword ptr [ebp-1FC],eax
 006723E8    fild        dword ptr [ebp-1FC]
 006723EE    fstp        qword ptr [ebp-10]
 006723F1    wait
>006723F2    jmp         0067328A
 006723F7    mov         edx,1
 006723FC    mov         eax,ebx
 006723FE    call        TMathsFunction.p
 00672403    add         esp,0FFFFFFF8
 00672406    fstp        qword ptr [esp]
 00672409    wait
 0067240A    call        00457188
 0067240F    movzx       eax,ax
 00672412    mov         dword ptr [ebp-1FC],eax
 00672418    fild        dword ptr [ebp-1FC]
 0067241E    fstp        qword ptr [ebp-10]
 00672421    wait
>00672422    jmp         0067328A
 00672427    mov         edx,1
 0067242C    mov         eax,ebx
 0067242E    call        TMathsFunction.p
 00672433    add         esp,0FFFFFFF8
 00672436    fstp        qword ptr [esp]
 00672439    wait
 0067243A    call        DayOfWeek
 0067243F    movzx       eax,ax
 00672442    mov         dword ptr [ebp-1FC],eax
 00672448    fild        dword ptr [ebp-1FC]
 0067244E    fstp        qword ptr [ebp-10]
 00672451    wait
>00672452    jmp         0067328A
 00672457    mov         edx,1
 0067245C    mov         eax,ebx
 0067245E    call        TMathsFunction.p
 00672463    add         esp,0FFFFFFF8
 00672466    fstp        qword ptr [esp]
 00672469    wait
 0067246A    mov         edx,2
 0067246F    mov         eax,ebx
 00672471    call        TMathsFunction.p
 00672476    add         esp,0FFFFFFF8
 00672479    fstp        qword ptr [esp]
 0067247C    wait
 0067247D    call        004572C0
 00672482    mov         dword ptr [ebp-1FC],eax
 00672488    fild        dword ptr [ebp-1FC]
 0067248E    fstp        qword ptr [ebp-10]
 00672491    wait
>00672492    jmp         0067328A
 00672497    mov         edx,2
 0067249C    mov         eax,ebx
 0067249E    call        TMathsFunction.ip
 006724A3    push        eax
 006724A4    mov         edx,1
 006724A9    mov         eax,ebx
 006724AB    call        TMathsFunction.ip
 006724B0    pop         edx
 006724B1    call        00457060
 006724B6    movzx       eax,ax
 006724B9    mov         dword ptr [ebp-1FC],eax
 006724BF    fild        dword ptr [ebp-1FC]
 006724C5    fstp        qword ptr [ebp-10]
 006724C8    wait
>006724C9    jmp         0067328A
 006724CE    mov         edx,1
 006724D3    mov         eax,ebx
 006724D5    call        TMathsFunction.ip
 006724DA    mov         word ptr [ebp-144],ax
 006724E1    movzx       eax,word ptr [ebp-144]
 006724E8    call        IsLeapYear
 006724ED    and         eax,7F
 006724F0    mov         edx,dword ptr ds:[78CEFC];^gvar_00785570
 006724F6    movzx       eax,word ptr [edx+eax*2]
 006724FA    mov         word ptr [ebp-146],ax
 00672501    movzx       eax,word ptr [ebp-146]
 00672508    mov         dword ptr [ebp-1FC],eax
 0067250E    fild        dword ptr [ebp-1FC]
 00672514    fstp        qword ptr [ebp-10]
 00672517    wait
>00672518    jmp         0067328A
 0067251D    mov         edx,1
 00672522    mov         eax,ebx
 00672524    call        TMathsFunction.ip
 00672529    mov         dword ptr [ebp-1FC],eax
 0067252F    fild        dword ptr [ebp-1FC]
 00672535    add         esp,0FFFFFFF8
 00672538    fstp        qword ptr [esp]
 0067253B    wait
 0067253C    call        00457030
 00672541    movzx       eax,ax
 00672544    mov         dword ptr [ebp-1FC],eax
 0067254A    fild        dword ptr [ebp-1FC]
 00672550    fstp        qword ptr [ebp-10]
 00672553    wait
>00672554    jmp         0067328A
 00672559    mov         edx,1
 0067255E    mov         eax,ebx
 00672560    call        TMathsFunction.p
 00672565    fstp        qword ptr [ebp-150]
 0067256B    wait
 0067256C    push        dword ptr [ebp-14C]
 00672572    push        dword ptr [ebp-150]
 00672578    call        004570D0
 0067257D    call        00457018
 00672582    mov         word ptr [ebp-152],ax
 00672589    movzx       eax,word ptr [ebp-152]
 00672590    mov         dword ptr [ebp-1FC],eax
 00672596    fild        dword ptr [ebp-1FC]
 0067259C    fstp        qword ptr [ebp-10]
 0067259F    wait
>006725A0    jmp         0067328A
 006725A5    mov         edx,1
 006725AA    mov         eax,ebx
 006725AC    call        TMathsFunction.p
 006725B1    add         esp,0FFFFFFF8
 006725B4    fstp        qword ptr [esp]
 006725B7    wait
 006725B8    mov         edx,2
 006725BD    mov         eax,ebx
 006725BF    call        TMathsFunction.p
 006725C4    add         esp,0FFFFFFF8
 006725C7    fstp        qword ptr [esp]
 006725CA    wait
 006725CB    call        004573D4
 006725D0    fstp        qword ptr [ebp-10]
 006725D3    wait
>006725D4    jmp         0067328A
 006725D9    mov         edx,1
 006725DE    mov         eax,ebx
 006725E0    call        TMathsFunction.p
 006725E5    fstp        qword ptr [ebp-160]
 006725EB    wait
 006725EC    push        dword ptr [ebp-15C]
 006725F2    push        dword ptr [ebp-160]
 006725F8    call        00457118
 006725FD    mov         word ptr [ebp-162],ax
 00672604    movzx       eax,word ptr [ebp-162]
 0067260B    mov         dword ptr [ebp-1FC],eax
 00672611    fild        dword ptr [ebp-1FC]
 00672617    fstp        qword ptr [ebp-10]
 0067261A    wait
>0067261B    jmp         0067328A
 00672620    mov         edx,1
 00672625    mov         eax,ebx
 00672627    call        TMathsFunction.p
 0067262C    add         esp,0FFFFFFF8
 0067262F    fstp        qword ptr [esp]
 00672632    wait
 00672633    call        004571E0
 00672638    movzx       eax,ax
 0067263B    mov         dword ptr [ebp-1FC],eax
 00672641    fild        dword ptr [ebp-1FC]
 00672647    fstp        qword ptr [ebp-10]
 0067264A    wait
>0067264B    jmp         0067328A
 00672650    mov         edx,1
 00672655    mov         eax,ebx
 00672657    call        TMathsFunction.p
 0067265C    add         esp,0FFFFFFF8
 0067265F    fstp        qword ptr [esp]
 00672662    wait
 00672663    call        0045723C
 00672668    movzx       eax,ax
 0067266B    mov         dword ptr [ebp-1FC],eax
 00672671    fild        dword ptr [ebp-1FC]
 00672677    fstp        qword ptr [ebp-10]
 0067267A    wait
>0067267B    jmp         0067328A
 00672680    mov         edx,1
 00672685    mov         eax,ebx
 00672687    call        TMathsFunction.p
 0067268C    add         esp,0FFFFFFF8
 0067268F    fstp        qword ptr [esp]
 00672692    wait
 00672693    call        004571B0
 00672698    movzx       eax,ax
 0067269B    mov         dword ptr [ebp-1FC],eax
 006726A1    fild        dword ptr [ebp-1FC]
 006726A7    fstp        qword ptr [ebp-10]
 006726AA    wait
>006726AB    jmp         0067328A
 006726B0    mov         edx,1
 006726B5    mov         eax,ebx
 006726B7    call        TMathsFunction.p
 006726BC    add         esp,0FFFFFFF8
 006726BF    fstp        qword ptr [esp]
 006726C2    wait
 006726C3    mov         edx,2
 006726C8    mov         eax,ebx
 006726CA    call        TMathsFunction.p
 006726CF    add         esp,0FFFFFFF8
 006726D2    fstp        qword ptr [esp]
 006726D5    wait
 006726D6    call        00457300
 006726DB    mov         dword ptr [ebp-1F8],eax
 006726E1    mov         dword ptr [ebp-1F4],edx
 006726E7    fild        qword ptr [ebp-1F8]
 006726ED    fstp        qword ptr [ebp-10]
 006726F0    wait
>006726F1    jmp         0067328A
 006726F6    mov         edx,1
 006726FB    mov         eax,ebx
 006726FD    call        TMathsFunction.p
 00672702    add         esp,0FFFFFFF8
 00672705    fstp        qword ptr [esp]
 00672708    wait
 00672709    mov         edx,2
 0067270E    mov         eax,ebx
 00672710    call        TMathsFunction.p
 00672715    add         esp,0FFFFFFF8
 00672718    fstp        qword ptr [esp]
 0067271B    wait
 0067271C    call        004573F8
 00672721    fstp        qword ptr [ebp-10]
 00672724    wait
>00672725    jmp         0067328A
 0067272A    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 0067272D    cmp         dword ptr [eax+8],1;TObjectList.FCount:Integer
>00672731    jle         00672799
 00672733    mov         edx,1
 00672738    mov         eax,ebx
 0067273A    call        TMathsFunction.p
 0067273F    fstp        qword ptr [ebp-170]
 00672745    wait
 00672746    mov         edx,1
 0067274B    mov         eax,ebx
 0067274D    call        TMathsFunction.ip
 00672752    mov         dword ptr [ebp-174],eax
 00672758    push        dword ptr [ebp-16C]
 0067275E    push        dword ptr [ebp-170]
 00672764    mov         eax,dword ptr [ebp-174]
 0067276A    add         eax,eax
 0067276C    add         eax,eax
 0067276E    add         eax,eax
 00672770    lea         eax,[eax+eax*2]
 00672773    cdq
 00672774    push        edx
 00672775    push        eax
 00672776    call        00457428
 0067277B    fstp        qword ptr [ebp-180]
 00672781    wait
 00672782    mov         eax,dword ptr [ebp-180]
 00672788    mov         dword ptr [ebp-10],eax
 0067278B    mov         eax,dword ptr [ebp-17C]
 00672791    mov         dword ptr [ebp-0C],eax
>00672794    jmp         0067328A
 00672799    mov         edx,1
 0067279E    mov         eax,ebx
 006727A0    call        TMathsFunction.p
 006727A5    fstp        qword ptr [ebp-188]
 006727AB    wait
 006727AC    push        dword ptr [ebp-184]
 006727B2    push        dword ptr [ebp-188]
 006727B8    push        0
 006727BA    push        18
 006727BC    call        00457428
 006727C1    fstp        qword ptr [ebp-190]
 006727C7    wait
 006727C8    mov         eax,dword ptr [ebp-190]
 006727CE    mov         dword ptr [ebp-10],eax
 006727D1    mov         eax,dword ptr [ebp-18C]
 006727D7    mov         dword ptr [ebp-0C],eax
>006727DA    jmp         0067328A
 006727DF    call        Time
 006727E4    fstp        qword ptr [ebp-10]
 006727E7    wait
>006727E8    jmp         0067328A
 006727ED    call        Now
 006727F2    fstp        qword ptr [ebp-10]
 006727F5    wait
>006727F6    jmp         0067328A
 006727FB    call        004570B4
 00672800    fstp        qword ptr [ebp-10]
 00672803    wait
>00672804    jmp         0067328A
 00672809    call        00457098
 0067280E    fstp        qword ptr [ebp-10]
 00672811    wait
>00672812    jmp         0067328A
 00672817    mov         edx,1
 0067281C    mov         eax,ebx
 0067281E    call        TMathsFunction.p
 00672823    fstp        qword ptr [ebp-198]
 00672829    wait
 0067282A    fld         qword ptr [ebp-198]
 00672830    add         esp,0FFFFFFF4
 00672833    fstp        tbyte ptr [esp]
 00672836    wait
 00672837    call        Frac
 0067283C    fstp        qword ptr [ebp-1A0]
 00672842    wait
 00672843    mov         eax,dword ptr [ebp-1A0]
 00672849    mov         dword ptr [ebp-10],eax
 0067284C    mov         eax,dword ptr [ebp-19C]
 00672852    mov         dword ptr [ebp-0C],eax
>00672855    jmp         0067328A
 0067285A    mov         edx,1
 0067285F    mov         eax,ebx
 00672861    call        TMathsFunction.p
 00672866    fstp        qword ptr [ebp-10]
 00672869    wait
>0067286A    jmp         0067328A
 0067286F    xor         eax,eax
 00672871    call        00686074
 00672876    fstp        qword ptr [ebp-10]
 00672879    wait
 0067287A    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 0067287D    mov         esi,dword ptr [eax+8];TObjectList.FCount:Integer
 00672880    sub         esi,2
>00672883    jl          0067328A
 00672889    inc         esi
 0067288A    mov         dword ptr [ebp-14],2
 00672891    mov         edx,1
 00672896    mov         eax,ebx
 00672898    call        TMathsFunction.p
 0067289D    fstp        qword ptr [ebp-1F8]
 006728A3    wait
 006728A4    mov         edx,dword ptr [ebp-14]
 006728A7    mov         eax,ebx
 006728A9    call        TMathsFunction.p
 006728AE    fcomp       qword ptr [ebp-1F8]
 006728B4    wait
 006728B5    fnstsw      al
 006728B7    sahf
>006728B8    jne         006728CA
 006728BA    mov         al,1
 006728BC    call        00686074
 006728C1    fstp        qword ptr [ebp-10]
 006728C4    wait
>006728C5    jmp         0067328A
 006728CA    inc         dword ptr [ebp-14]
 006728CD    dec         esi
>006728CE    jne         00672891
>006728D0    jmp         0067328A
 006728D5    xor         edx,edx
 006728D7    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 006728DA    call        TList.Get
 006728DF    mov         edx,dword ptr ds:[67DB04];TExpression
 006728E5    call        @AsClass
 006728EA    push        eax
 006728EB    mov         edx,1
 006728F0    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 006728F3    call        TList.Get
 006728F8    mov         edx,dword ptr ds:[67DB04];TExpression
 006728FE    call        @AsClass
 00672903    pop         edx
 00672904    mov         ecx,dword ptr [eax]
 00672906    call        dword ptr [ecx+14];TExpression.EvaluateToMatch
 00672909    fstp        qword ptr [ebp-20]
 0067290C    wait
 0067290D    xor         edx,edx
 0067290F    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00672912    call        TList.Get
 00672917    mov         edx,dword ptr ds:[67DB04];TExpression
 0067291D    call        @AsClass
 00672922    push        eax
 00672923    mov         edx,2
 00672928    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 0067292B    call        TList.Get
 00672930    mov         edx,dword ptr ds:[67DB04];TExpression
 00672936    call        @AsClass
 0067293B    pop         edx
 0067293C    mov         ecx,dword ptr [eax]
 0067293E    call        dword ptr [ecx+14];TExpression.EvaluateToMatch
 00672941    fstp        qword ptr [ebp-28]
 00672944    wait
 00672945    mov         edx,4
 0067294A    mov         eax,ebx
 0067294C    call        TMathsFunction.p
 00672951    fstp        qword ptr [ebp-30]
 00672954    wait
 00672955    mov         edx,3
 0067295A    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 0067295D    call        TList.Get
 00672962    mov         edx,dword ptr ds:[67DB04];TExpression
 00672968    call        @AsClass
 0067296D    push        eax
 0067296E    mov         edx,4
 00672973    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00672976    call        TList.Get
 0067297B    mov         edx,dword ptr ds:[67DB04];TExpression
 00672981    call        @AsClass
 00672986    pop         edx
 00672987    mov         ecx,dword ptr [eax]
 00672989    call        dword ptr [ecx+14];TExpression.EvaluateToMatch
 0067298C    fstp        qword ptr [ebp-38]
 0067298F    wait
 00672990    mov         edx,1
 00672995    mov         eax,ebx
 00672997    call        TMathsFunction.p
 0067299C    fsub        qword ptr [ebp-20]
 0067299F    fstp        qword ptr [ebp-40]
 006729A2    wait
 006729A3    fld         qword ptr [ebp-28]
 006729A6    fsub        qword ptr [ebp-20]
 006729A9    fdivr       qword ptr [ebp-40]
 006729AC    fld         qword ptr [ebp-38]
 006729AF    fsub        qword ptr [ebp-30]
 006729B2    fmulp       st(1),st
 006729B4    fstp        qword ptr [ebp-40]
 006729B7    wait
 006729B8    fld         qword ptr [ebp-40]
 006729BB    fadd        qword ptr [ebp-30]
 006729BE    fstp        qword ptr [ebp-40]
 006729C1    wait
 006729C2    mov         eax,dword ptr [ebp-40]
 006729C5    mov         dword ptr [ebp-10],eax
 006729C8    mov         eax,dword ptr [ebp-3C]
 006729CB    mov         dword ptr [ebp-0C],eax
>006729CE    jmp         0067328A
 006729D3    xor         edx,edx
 006729D5    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 006729D8    call        TList.Get
 006729DD    mov         edx,dword ptr ds:[67DB04];TExpression
 006729E3    call        @AsClass
 006729E8    push        eax
 006729E9    mov         edx,1
 006729EE    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 006729F1    call        TList.Get
 006729F6    mov         edx,dword ptr ds:[67DB04];TExpression
 006729FC    call        @AsClass
 00672A01    pop         edx
 00672A02    mov         ecx,dword ptr [eax]
 00672A04    call        dword ptr [ecx+14];TExpression.EvaluateToMatch
 00672A07    fstp        qword ptr [ebp-20]
 00672A0A    wait
 00672A0B    xor         edx,edx
 00672A0D    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00672A10    call        TList.Get
 00672A15    mov         edx,dword ptr ds:[67DB04];TExpression
 00672A1B    call        @AsClass
 00672A20    push        eax
 00672A21    mov         edx,2
 00672A26    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00672A29    call        TList.Get
 00672A2E    mov         edx,dword ptr ds:[67DB04];TExpression
 00672A34    call        @AsClass
 00672A39    pop         edx
 00672A3A    mov         ecx,dword ptr [eax]
 00672A3C    call        dword ptr [ecx+14];TExpression.EvaluateToMatch
 00672A3F    fstp        qword ptr [ebp-28]
 00672A42    wait
 00672A43    mov         edx,4
 00672A48    mov         eax,ebx
 00672A4A    call        TMathsFunction.p
 00672A4F    fstp        qword ptr [ebp-30]
 00672A52    wait
 00672A53    mov         edx,3
 00672A58    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00672A5B    call        TList.Get
 00672A60    mov         edx,dword ptr ds:[67DB04];TExpression
 00672A66    call        @AsClass
 00672A6B    push        eax
 00672A6C    mov         edx,4
 00672A71    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00672A74    call        TList.Get
 00672A79    mov         edx,dword ptr ds:[67DB04];TExpression
 00672A7F    call        @AsClass
 00672A84    pop         edx
 00672A85    mov         ecx,dword ptr [eax]
 00672A87    call        dword ptr [ecx+14];TExpression.EvaluateToMatch
 00672A8A    fstp        qword ptr [ebp-38]
 00672A8D    wait
 00672A8E    mov         edx,1
 00672A93    mov         eax,ebx
 00672A95    call        TMathsFunction.p
 00672A9A    fsub        qword ptr [ebp-20]
 00672A9D    fstp        qword ptr [ebp-40]
 00672AA0    wait
 00672AA1    fld         qword ptr [ebp-28]
 00672AA4    fsub        qword ptr [ebp-20]
 00672AA7    fdivr       qword ptr [ebp-40]
 00672AAA    fld         qword ptr [ebp-38]
 00672AAD    fsub        qword ptr [ebp-30]
 00672AB0    fmulp       st(1),st
 00672AB2    fstp        qword ptr [ebp-40]
 00672AB5    wait
 00672AB6    fld         qword ptr [ebp-40]
 00672AB9    fadd        qword ptr [ebp-30]
 00672ABC    fstp        qword ptr [ebp-40]
 00672ABF    wait
 00672AC0    push        dword ptr [ebp-3C]
 00672AC3    push        dword ptr [ebp-40]
 00672AC6    push        dword ptr [ebp-2C]
 00672AC9    push        dword ptr [ebp-30]
 00672ACC    push        dword ptr [ebp-34]
 00672ACF    push        dword ptr [ebp-38]
 00672AD2    call        00455534
 00672AD7    fstp        qword ptr [ebp-10]
 00672ADA    wait
>00672ADB    jmp         0067328A
 00672AE0    xor         edx,edx
 00672AE2    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00672AE5    call        TList.Get
 00672AEA    mov         edx,dword ptr ds:[67DB04];TExpression
 00672AF0    call        @AsClass
 00672AF5    mov         edx,dword ptr [eax]
 00672AF7    call        dword ptr [edx+44];TExpression.GetDataType
 00672AFA    sub         al,5
>00672AFC    jne         00672B42
 00672AFE    lea         eax,[ebp-50]
 00672B01    push        eax
 00672B02    xor         edx,edx
 00672B04    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00672B07    call        TList.Get
 00672B0C    mov         edx,dword ptr ds:[67DB04];TExpression
 00672B12    call        @AsClass
 00672B17    lea         ecx,[ebp-48]
 00672B1A    lea         edx,[ebp-40]
 00672B1D    mov         ebx,dword ptr [eax]
 00672B1F    call        dword ptr [ebx+3C];TExpression.GetVector
 00672B22    push        dword ptr [ebp-3C]
 00672B25    push        dword ptr [ebp-40]
 00672B28    push        dword ptr [ebp-44]
 00672B2B    push        dword ptr [ebp-48]
 00672B2E    push        dword ptr [ebp-4C]
 00672B31    push        dword ptr [ebp-50]
 00672B34    call        005C4070
 00672B39    fstp        qword ptr [ebp-10]
 00672B3C    wait
>00672B3D    jmp         0067328A
 00672B42    lea         ecx,[ebp-288]
 00672B48    mov         edx,1
 00672B4D    mov         eax,ebx
 00672B4F    call        TMathsFunction.sp
 00672B54    mov         eax,dword ptr [ebp-288]
 00672B5A    mov         dword ptr [ebp-1A4],eax
 00672B60    mov         eax,dword ptr [ebp-1A4]
 00672B66    test        eax,eax
>00672B68    je          00672B6F
 00672B6A    sub         eax,4
 00672B6D    mov         eax,dword ptr [eax]
 00672B6F    mov         dword ptr [ebp-1FC],eax
 00672B75    fild        dword ptr [ebp-1FC]
 00672B7B    fstp        qword ptr [ebp-10]
 00672B7E    wait
>00672B7F    jmp         0067328A
 00672B84    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00672B87    cmp         dword ptr [eax+8],3;TObjectList.FCount:Integer
>00672B8B    jl          00672BE9
 00672B8D    lea         ecx,[ebp-28C]
 00672B93    mov         edx,2
 00672B98    mov         eax,ebx
 00672B9A    call        TMathsFunction.sp
 00672B9F    mov         eax,dword ptr [ebp-28C]
 00672BA5    push        eax
 00672BA6    lea         ecx,[ebp-290]
 00672BAC    mov         edx,1
 00672BB1    mov         eax,ebx
 00672BB3    call        TMathsFunction.sp
 00672BB8    mov         eax,dword ptr [ebp-290]
 00672BBE    push        eax
 00672BBF    mov         edx,3
 00672BC4    mov         eax,ebx
 00672BC6    call        TMathsFunction.ip
 00672BCB    mov         ecx,eax
 00672BCD    pop         eax
 00672BCE    pop         edx
 00672BCF    call        0067048C
 00672BD4    mov         dword ptr [ebp-1FC],eax
 00672BDA    fild        dword ptr [ebp-1FC]
 00672BE0    fstp        qword ptr [ebp-10]
 00672BE3    wait
>00672BE4    jmp         0067328A
 00672BE9    lea         ecx,[ebp-294]
 00672BEF    mov         edx,2
 00672BF4    mov         eax,ebx
 00672BF6    call        TMathsFunction.sp
 00672BFB    mov         eax,dword ptr [ebp-294]
 00672C01    push        eax
 00672C02    lea         ecx,[ebp-298]
 00672C08    mov         edx,1
 00672C0D    mov         eax,ebx
 00672C0F    call        TMathsFunction.sp
 00672C14    mov         eax,dword ptr [ebp-298]
 00672C1A    pop         edx
 00672C1B    call        Pos
 00672C20    mov         dword ptr [ebp-1FC],eax
 00672C26    fild        dword ptr [ebp-1FC]
 00672C2C    fstp        qword ptr [ebp-10]
 00672C2F    wait
>00672C30    jmp         0067328A
 00672C35    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00672C38    cmp         dword ptr [eax+8],3;TObjectList.FCount:Integer
>00672C3C    jl          00672C9A
 00672C3E    lea         ecx,[ebp-29C]
 00672C44    mov         edx,2
 00672C49    mov         eax,ebx
 00672C4B    call        TMathsFunction.sp
 00672C50    mov         eax,dword ptr [ebp-29C]
 00672C56    push        eax
 00672C57    lea         ecx,[ebp-2A0]
 00672C5D    mov         edx,1
 00672C62    mov         eax,ebx
 00672C64    call        TMathsFunction.sp
 00672C69    mov         eax,dword ptr [ebp-2A0]
 00672C6F    push        eax
 00672C70    mov         edx,3
 00672C75    mov         eax,ebx
 00672C77    call        TMathsFunction.ip
 00672C7C    mov         ecx,eax
 00672C7E    pop         eax
 00672C7F    pop         edx
 00672C80    call        004F91C4
 00672C85    mov         dword ptr [ebp-1FC],eax
 00672C8B    fild        dword ptr [ebp-1FC]
 00672C91    fstp        qword ptr [ebp-10]
 00672C94    wait
>00672C95    jmp         0067328A
 00672C9A    lea         ecx,[ebp-2A4]
 00672CA0    mov         edx,2
 00672CA5    mov         eax,ebx
 00672CA7    call        TMathsFunction.sp
 00672CAC    mov         eax,dword ptr [ebp-2A4]
 00672CB2    push        eax
 00672CB3    lea         ecx,[ebp-2A8]
 00672CB9    mov         edx,1
 00672CBE    mov         eax,ebx
 00672CC0    call        TMathsFunction.sp
 00672CC5    mov         eax,dword ptr [ebp-2A8]
 00672CCB    pop         edx
 00672CCC    call        004F9230
 00672CD1    mov         dword ptr [ebp-1FC],eax
 00672CD7    fild        dword ptr [ebp-1FC]
 00672CDD    fstp        qword ptr [ebp-10]
 00672CE0    wait
>00672CE1    jmp         0067328A
 00672CE6    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00672CE9    cmp         dword ptr [eax+8],3;TObjectList.FCount:Integer
>00672CED    jl          00672D4B
 00672CEF    lea         ecx,[ebp-2AC]
 00672CF5    mov         edx,2
 00672CFA    mov         eax,ebx
 00672CFC    call        TMathsFunction.sp
 00672D01    mov         eax,dword ptr [ebp-2AC]
 00672D07    push        eax
 00672D08    lea         ecx,[ebp-2B0]
 00672D0E    mov         edx,3
 00672D13    mov         eax,ebx
 00672D15    call        TMathsFunction.sp
 00672D1A    mov         eax,dword ptr [ebp-2B0]
 00672D20    push        eax
 00672D21    mov         edx,1
 00672D26    mov         eax,ebx
 00672D28    call        TMathsFunction.ip
 00672D2D    mov         ecx,eax
 00672D2F    pop         eax
 00672D30    pop         edx
 00672D31    call        0067048C
 00672D36    mov         dword ptr [ebp-1FC],eax
 00672D3C    fild        dword ptr [ebp-1FC]
 00672D42    fstp        qword ptr [ebp-10]
 00672D45    wait
>00672D46    jmp         0067328A
 00672D4B    lea         ecx,[ebp-2B4]
 00672D51    mov         edx,1
 00672D56    mov         eax,ebx
 00672D58    call        TMathsFunction.sp
 00672D5D    mov         eax,dword ptr [ebp-2B4]
 00672D63    push        eax
 00672D64    lea         ecx,[ebp-2B8]
 00672D6A    mov         edx,2
 00672D6F    mov         eax,ebx
 00672D71    call        TMathsFunction.sp
 00672D76    mov         eax,dword ptr [ebp-2B8]
 00672D7C    pop         edx
 00672D7D    call        Pos
 00672D82    mov         dword ptr [ebp-1FC],eax
 00672D88    fild        dword ptr [ebp-1FC]
 00672D8E    fstp        qword ptr [ebp-10]
 00672D91    wait
>00672D92    jmp         0067328A
 00672D97    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00672D9A    cmp         dword ptr [eax+8],3;TObjectList.FCount:Integer
>00672D9E    jl          00672DFC
 00672DA0    lea         ecx,[ebp-2BC]
 00672DA6    mov         edx,1
 00672DAB    mov         eax,ebx
 00672DAD    call        TMathsFunction.sp
 00672DB2    mov         eax,dword ptr [ebp-2BC]
 00672DB8    push        eax
 00672DB9    lea         ecx,[ebp-2C0]
 00672DBF    mov         edx,2
 00672DC4    mov         eax,ebx
 00672DC6    call        TMathsFunction.sp
 00672DCB    mov         eax,dword ptr [ebp-2C0]
 00672DD1    push        eax
 00672DD2    mov         edx,3
 00672DD7    mov         eax,ebx
 00672DD9    call        TMathsFunction.ip
 00672DDE    mov         ecx,eax
 00672DE0    pop         eax
 00672DE1    pop         edx
 00672DE2    call        004F91C4
 00672DE7    mov         dword ptr [ebp-1FC],eax
 00672DED    fild        dword ptr [ebp-1FC]
 00672DF3    fstp        qword ptr [ebp-10]
 00672DF6    wait
>00672DF7    jmp         0067328A
 00672DFC    lea         ecx,[ebp-2C4]
 00672E02    mov         edx,1
 00672E07    mov         eax,ebx
 00672E09    call        TMathsFunction.sp
 00672E0E    mov         eax,dword ptr [ebp-2C4]
 00672E14    push        eax
 00672E15    lea         ecx,[ebp-2C8]
 00672E1B    mov         edx,2
 00672E20    mov         eax,ebx
 00672E22    call        TMathsFunction.sp
 00672E27    mov         eax,dword ptr [ebp-2C8]
 00672E2D    pop         edx
 00672E2E    call        004F9230
 00672E33    mov         dword ptr [ebp-1FC],eax
 00672E39    fild        dword ptr [ebp-1FC]
 00672E3F    fstp        qword ptr [ebp-10]
 00672E42    wait
>00672E43    jmp         0067328A
 00672E48    lea         ecx,[ebp-2CC]
 00672E4E    mov         edx,2
 00672E53    mov         eax,ebx
 00672E55    call        TMathsFunction.sp
 00672E5A    mov         eax,dword ptr [ebp-2CC]
 00672E60    push        eax
 00672E61    lea         ecx,[ebp-2D0]
 00672E67    mov         edx,1
 00672E6C    mov         eax,ebx
 00672E6E    call        TMathsFunction.sp
 00672E73    mov         eax,dword ptr [ebp-2D0]
 00672E79    pop         edx
 00672E7A    call        CompareStr
 00672E7F    mov         dword ptr [ebp-1FC],eax
 00672E85    fild        dword ptr [ebp-1FC]
 00672E8B    fstp        qword ptr [ebp-10]
 00672E8E    wait
>00672E8F    jmp         0067328A
 00672E94    mov         edx,1
 00672E99    mov         eax,ebx
 00672E9B    call        TMathsFunction.p
 00672EA0    fstp        qword ptr [ebp-10]
 00672EA3    wait
>00672EA4    jmp         0067328A
 00672EA9    xor         edx,edx
 00672EAB    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00672EAE    call        TList.Get
 00672EB3    mov         edx,dword ptr ds:[67DB04];TExpression
 00672EB9    call        @AsClass
 00672EBE    mov         edx,dword ptr [eax]
 00672EC0    call        dword ptr [edx+44];TExpression.GetDataType
 00672EC3    sub         al,4
>00672EC5    jne         00672F07
 00672EC7    lea         ecx,[ebp-4]
 00672ECA    mov         edx,1
 00672ECF    mov         eax,ebx
 00672ED1    call        TMathsFunction.sp
 00672ED6    cmp         dword ptr [ebp-4],0
>00672EDA    je          00672EFA
 00672EDC    mov         eax,dword ptr [ebp-4]
 00672EDF    movzx       eax,word ptr [eax]
 00672EE2    movzx       eax,ax
 00672EE5    mov         dword ptr [ebp-1FC],eax
 00672EEB    fild        dword ptr [ebp-1FC]
 00672EF1    fstp        qword ptr [ebp-10]
 00672EF4    wait
>00672EF5    jmp         0067328A
 00672EFA    xor         eax,eax
 00672EFC    mov         dword ptr [ebp-10],eax
 00672EFF    mov         dword ptr [ebp-0C],eax
>00672F02    jmp         0067328A
 00672F07    mov         edx,1
 00672F0C    mov         eax,ebx
 00672F0E    call        TMathsFunction.ip
 00672F13    mov         dword ptr [ebp-1FC],eax
 00672F19    fild        dword ptr [ebp-1FC]
 00672F1F    fstp        qword ptr [ebp-10]
 00672F22    wait
>00672F23    jmp         0067328A
 00672F28    xor         edx,edx
 00672F2A    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00672F2D    call        TList.Get
 00672F32    mov         edx,dword ptr ds:[67DB04];TExpression
 00672F38    call        @AsClass
 00672F3D    mov         edx,dword ptr [eax]
 00672F3F    call        dword ptr [edx+44];TExpression.GetDataType
 00672F42    sub         al,4
>00672F44    jne         00672F6C
 00672F46    lea         ecx,[ebp-4]
 00672F49    mov         edx,1
 00672F4E    mov         eax,ebx
 00672F50    call        TMathsFunction.sp
 00672F55    push        0
 00672F57    push        0
 00672F59    push        0
 00672F5B    mov         eax,dword ptr [ebp-4]
 00672F5E    call        004F8DB8
 00672F63    fstp        qword ptr [ebp-10]
 00672F66    wait
>00672F67    jmp         0067328A
 00672F6C    mov         edx,1
 00672F71    mov         eax,ebx
 00672F73    call        TMathsFunction.p
 00672F78    fstp        qword ptr [ebp-10]
 00672F7B    wait
>00672F7C    jmp         0067328A
 00672F81    xor         edx,edx
 00672F83    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00672F86    call        TList.Get
 00672F8B    mov         edx,dword ptr ds:[67DB04];TExpression
 00672F91    call        @AsClass
 00672F96    mov         edx,dword ptr [eax]
 00672F98    call        dword ptr [edx+44];TExpression.GetDataType
 00672F9B    sub         al,4
>00672F9D    jne         00672FC5
 00672F9F    lea         ecx,[ebp-4]
 00672FA2    mov         edx,1
 00672FA7    mov         eax,ebx
 00672FA9    call        TMathsFunction.sp
 00672FAE    push        0
 00672FB0    push        0
 00672FB2    push        0
 00672FB4    mov         eax,dword ptr [ebp-4]
 00672FB7    call        004F8DB8
 00672FBC    fstp        qword ptr [ebp-10]
 00672FBF    wait
>00672FC0    jmp         0067328A
 00672FC5    mov         edx,1
 00672FCA    mov         eax,ebx
 00672FCC    call        TMathsFunction.p
 00672FD1    fstp        qword ptr [ebp-10]
 00672FD4    wait
>00672FD5    jmp         0067328A
 00672FDA    lea         ecx,[ebp-2D4]
 00672FE0    mov         edx,2
 00672FE5    mov         eax,ebx
 00672FE7    call        TMathsFunction.sp
 00672FEC    mov         eax,dword ptr [ebp-2D4]
 00672FF2    push        eax
 00672FF3    lea         ecx,[ebp-2D8]
 00672FF9    mov         edx,1
 00672FFE    mov         eax,ebx
 00673000    call        TMathsFunction.sp
 00673005    mov         eax,dword ptr [ebp-2D8]
 0067300B    pop         edx
 0067300C    call        004F9A58
 00673011    call        00686074
 00673016    fstp        qword ptr [ebp-10]
 00673019    wait
>0067301A    jmp         0067328A
 0067301F    lea         ecx,[ebp-2DC]
 00673025    mov         edx,2
 0067302A    mov         eax,ebx
 0067302C    call        TMathsFunction.sp
 00673031    mov         eax,dword ptr [ebp-2DC]
 00673037    push        eax
 00673038    lea         ecx,[ebp-2E0]
 0067303E    mov         edx,1
 00673043    mov         eax,ebx
 00673045    call        TMathsFunction.sp
 0067304A    mov         eax,dword ptr [ebp-2E0]
 00673050    pop         edx
 00673051    call        004F9A58
 00673056    call        00686074
 0067305B    fstp        qword ptr [ebp-10]
 0067305E    wait
>0067305F    jmp         0067328A
 00673064    lea         eax,[ebp-68]
 00673067    push        eax
 00673068    xor         edx,edx
 0067306A    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 0067306D    call        TList.Get
 00673072    mov         edx,dword ptr ds:[67DB04];TExpression
 00673078    call        @AsClass
 0067307D    lea         ecx,[ebp-60]
 00673080    lea         edx,[ebp-58]
 00673083    mov         esi,dword ptr [eax]
 00673085    call        dword ptr [esi+20];TExpression.EvaluateVector
 00673088    lea         eax,[ebp-80]
 0067308B    push        eax
 0067308C    mov         edx,1
 00673091    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00673094    call        TList.Get
 00673099    mov         edx,dword ptr ds:[67DB04];TExpression
 0067309F    call        @AsClass
 006730A4    lea         ecx,[ebp-78]
 006730A7    lea         edx,[ebp-70]
 006730AA    mov         ebx,dword ptr [eax]
 006730AC    call        dword ptr [ebx+20];TExpression.EvaluateVector
 006730AF    fld         qword ptr [ebp-58]
 006730B2    fmul        qword ptr [ebp-70]
 006730B5    fld         qword ptr [ebp-60]
 006730B8    fmul        qword ptr [ebp-78]
 006730BB    faddp       st(1),st
 006730BD    fld         qword ptr [ebp-68]
 006730C0    fmul        qword ptr [ebp-80]
 006730C3    faddp       st(1),st
 006730C5    fstp        qword ptr [ebp-10]
 006730C8    wait
>006730C9    jmp         0067328A
 006730CE    lea         eax,[ebp-68]
 006730D1    push        eax
 006730D2    xor         edx,edx
 006730D4    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 006730D7    call        TList.Get
 006730DC    mov         edx,dword ptr ds:[67DB04];TExpression
 006730E2    call        @AsClass
 006730E7    lea         ecx,[ebp-60]
 006730EA    lea         edx,[ebp-58]
 006730ED    mov         esi,dword ptr [eax]
 006730EF    call        dword ptr [esi+20];TExpression.EvaluateVector
 006730F2    lea         eax,[ebp-80]
 006730F5    push        eax
 006730F6    mov         edx,1
 006730FB    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 006730FE    call        TList.Get
 00673103    mov         edx,dword ptr ds:[67DB04];TExpression
 00673109    call        @AsClass
 0067310E    lea         ecx,[ebp-78]
 00673111    lea         edx,[ebp-70]
 00673114    mov         ebx,dword ptr [eax]
 00673116    call        dword ptr [ebx+20];TExpression.EvaluateVector
 00673119    push        dword ptr [ebp-54]
 0067311C    push        dword ptr [ebp-58]
 0067311F    push        dword ptr [ebp-5C]
 00673122    push        dword ptr [ebp-60]
 00673125    push        dword ptr [ebp-64]
 00673128    push        dword ptr [ebp-68]
 0067312B    call        005C4070
 00673130    fstp        qword ptr [ebp-40]
 00673133    wait
 00673134    push        dword ptr [ebp-6C]
 00673137    push        dword ptr [ebp-70]
 0067313A    push        dword ptr [ebp-74]
 0067313D    push        dword ptr [ebp-78]
 00673140    push        dword ptr [ebp-7C]
 00673143    push        dword ptr [ebp-80]
 00673146    call        005C4070
 0067314B    fstp        qword ptr [ebp-48]
 0067314E    wait
 0067314F    fld         qword ptr [ebp-40]
 00673152    fcomp       dword ptr ds:[6732F4];0:Single
 00673158    wait
 00673159    fnstsw      al
 0067315B    sahf
>0067315C    je          0067316D
 0067315E    fld         qword ptr [ebp-48]
 00673161    fcomp       dword ptr ds:[6732F4];0:Single
 00673167    wait
 00673168    fnstsw      al
 0067316A    sahf
>0067316B    jne         0067317A
 0067316D    xor         eax,eax
 0067316F    mov         dword ptr [ebp-10],eax
 00673172    mov         dword ptr [ebp-0C],eax
>00673175    jmp         0067328A
 0067317A    fld         qword ptr [ebp-58]
 0067317D    fmul        qword ptr [ebp-70]
 00673180    fld         qword ptr [ebp-60]
 00673183    fmul        qword ptr [ebp-78]
 00673186    faddp       st(1),st
 00673188    fld         qword ptr [ebp-68]
 0067318B    fmul        qword ptr [ebp-80]
 0067318E    faddp       st(1),st
 00673190    fstp        qword ptr [ebp-50]
 00673193    wait
 00673194    fld         qword ptr [ebp-40]
 00673197    fmul        qword ptr [ebp-48]
 0067319A    fdivr       qword ptr [ebp-50]
 0067319D    fstp        qword ptr [ebp-50]
 006731A0    wait
 006731A1    push        dword ptr [ebp-4C]
 006731A4    push        dword ptr [ebp-50]
 006731A7    call        00454A28
 006731AC    fmul        dword ptr ds:[6732F8];180:Single
 006731B2    fld         tbyte ptr ds:[6732FC];3.14159265358979:Extended
 006731B8    fdivp       st(1),st
 006731BA    fstp        qword ptr [ebp-10]
 006731BD    wait
>006731BE    jmp         0067328A
 006731C3    mov         dword ptr [ebp-10],54442D18
 006731CA    mov         dword ptr [ebp-0C],400921FB
>006731D1    jmp         0067328A
 006731D6    push        3FFF
 006731DB    push        80000000
 006731E0    push        0
 006731E2    call        Exp
 006731E7    fstp        qword ptr [ebp-10]
 006731EA    wait
>006731EB    jmp         0067328A
 006731F0    xor         eax,eax
 006731F2    mov         dword ptr [ebp-10],eax
 006731F5    mov         dword ptr [ebp-0C],3FF00000
>006731FC    jmp         0067328A
 00673201    xor         eax,eax
 00673203    mov         dword ptr [ebp-10],eax
 00673206    mov         dword ptr [ebp-0C],3FF00000
>0067320D    jmp         0067328A
 0067320F    xor         eax,eax
 00673211    mov         dword ptr [ebp-10],eax
 00673214    mov         dword ptr [ebp-0C],3FF00000
>0067321B    jmp         0067328A
 0067321D    xor         eax,eax
 0067321F    mov         dword ptr [ebp-10],eax
 00673222    mov         dword ptr [ebp-0C],eax
>00673225    jmp         0067328A
 00673227    mov         edx,1
 0067322C    mov         eax,ebx
 0067322E    call        TMathsFunction.p
 00673233    fdivr       dword ptr ds:[6732C0];1:Single
 00673239    fstp        qword ptr [ebp-10]
 0067323C    wait
>0067323D    jmp         0067328A
 0067323F    mov         edx,1
 00673244    mov         eax,ebx
 00673246    call        TMathsFunction.p
 0067324B    fstp        qword ptr [ebp-10]
 0067324E    wait
>0067324F    jmp         0067328A
 00673251    mov         edx,2
 00673256    mov         eax,ebx
 00673258    call        TMathsFunction.ip
 0067325D    push        eax
 0067325E    mov         edx,1
 00673263    mov         eax,ebx
 00673265    call        TMathsFunction.ip
 0067326A    pop         edx
 0067326B    call        0065C7AC
 00673270    mov         dword ptr [ebp-1FC],eax
 00673276    fild        dword ptr [ebp-1FC]
 0067327C    fstp        qword ptr [ebp-10]
 0067327F    wait
>00673280    jmp         0067328A
 00673282    xor         eax,eax
 00673284    mov         dword ptr [ebp-10],eax
 00673287    mov         dword ptr [ebp-0C],eax
 0067328A    xor         eax,eax
 0067328C    pop         edx
 0067328D    pop         ecx
 0067328E    pop         ecx
 0067328F    mov         dword ptr fs:[eax],edx
 00673292    push        6732B7
 00673297    lea         eax,[ebp-2E0]
 0067329D    mov         edx,17
 006732A2    call        @UStrArrayClr
 006732A7    lea         eax,[ebp-4]
 006732AA    call        @UStrClr
 006732AF    ret
>006732B0    jmp         @HandleFinally
>006732B5    jmp         00673297
 006732B7    fld         qword ptr [ebp-10]
 006732BA    pop         esi
 006732BB    pop         ebx
 006732BC    mov         esp,ebp
 006732BE    pop         ebp
 006732BF    ret
*}
end;

//00673308
procedure sub_00673308;
begin
{*
 00673308    push        ebx
 00673309    mov         ebx,81ECD4;gvar_0081ECD4:THashTable
 0067330E    mov         ecx,31
 00673313    mov         edx,6736B4;'Assign'
 00673318    mov         eax,dword ptr [ebx]
 0067331A    call        THashTable.Add
 0067331F    mov         ecx,31
 00673324    mov         edx,6736D0;'SetValue'
 00673329    mov         eax,dword ptr [ebx]
 0067332B    call        THashTable.Add
 00673330    mov         ecx,2C
 00673335    mov         edx,6736F0;'DebugPrint'
 0067333A    mov         eax,dword ptr [ebx]
 0067333C    call        THashTable.Add
 00673341    mov         ecx,2E
 00673346    mov         edx,673714;'OutputToFile'
 0067334B    mov         eax,dword ptr [ebx]
 0067334D    call        THashTable.Add
 00673352    mov         ecx,2A
 00673357    mov         edx,67373C;'WiimotePoke'
 0067335C    mov         eax,dword ptr [ebx]
 0067335E    call        THashTable.Add
 00673363    mov         ecx,2B
 00673368    mov         edx,673760;'WiimoteSend'
 0067336D    mov         eax,dword ptr [ebx]
 0067336F    call        THashTable.Add
 00673374    mov         ecx,2D
 00673379    mov         edx,673784;'WiimoteDumpBytes'
 0067337E    mov         eax,dword ptr [ebx]
 00673380    call        THashTable.Add
 00673385    mov         ecx,1
 0067338A    mov         edx,6737B4;'Say'
 0067338F    mov         eax,dword ptr [ebx]
 00673391    call        THashTable.Add
 00673396    mov         ecx,2
 0067339B    mov         edx,6737C8;^338:Single
 006733A0    mov         eax,dword ptr [ebx]
 006733A2    call        THashTable.Add
 006733A7    mov         ecx,3
 006733AC    mov         edx,6737E4;'ControlPanel'
 006733B1    mov         eax,dword ptr [ebx]
 006733B3    call        THashTable.Add
 006733B8    mov         ecx,4
 006733BD    mov         edx,67380C;'StopScript'
 006733C2    mov         eax,dword ptr [ebx]
 006733C4    call        THashTable.Add
 006733C9    mov         ecx,4
 006733CE    mov         edx,673830;'ExitScript'
 006733D3    mov         eax,dword ptr [ebx]
 006733D5    call        THashTable.Add
 006733DA    mov         ecx,4
 006733DF    mov         edx,673854;'ExitProgram'
 006733E4    mov         eax,dword ptr [ebx]
 006733E6    call        THashTable.Add
 006733EB    mov         ecx,32
 006733F0    mov         edx,673878;'RestartScript'
 006733F5    mov         eax,dword ptr [ebx]
 006733F7    call        THashTable.Add
 006733FC    mov         ecx,5
 00673401    mov         edx,6738A0;'ExitPIE'
 00673406    mov         eax,dword ptr [ebx]
 00673408    call        THashTable.Add
 0067340D    mov         ecx,6
 00673412    mov         edx,6738BC;'Execute'
 00673417    mov         eax,dword ptr [ebx]
 00673419    call        THashTable.Add
 0067341E    mov         ecx,7
 00673423    mov         edx,6738D8;'AddCodeLine'
 00673428    mov         eax,dword ptr [ebx]
 0067342A    call        THashTable.Add
 0067342F    mov         ecx,8
 00673434    mov         edx,6738FC;'ControlPanelKeyboard'
 00673439    mov         eax,dword ptr [ebx]
 0067343B    call        THashTable.Add
 00673440    mov         ecx,9
 00673445    mov         edx,673934;'ControlPanelMouse'
 0067344A    mov         eax,dword ptr [ebx]
 0067344C    call        THashTable.Add
 00673451    mov         ecx,0A
 00673456    mov         edx,673964;'ControlPanelJoystick'
 0067345B    mov         eax,dword ptr [ebx]
 0067345D    call        THashTable.Add
 00673462    mov         ecx,0B
 00673467    mov         edx,67399C;'ControlPanelP5'
 0067346C    mov         eax,dword ptr [ebx]
 0067346E    call        THashTable.Add
 00673473    mov         ecx,0C
 00673478    mov         edx,6739C8;'ControlPanelPPJoy'
 0067347D    mov         eax,dword ptr [ebx]
 0067347F    call        THashTable.Add
 00673484    mov         ecx,0D
 00673489    mov         edx,6739F8;'ControlPanelSpeech'
 0067348E    mov         eax,dword ptr [ebx]
 00673490    call        THashTable.Add
 00673495    mov         ecx,0E
 0067349A    mov         edx,673A2C;'ControlPanelMidi'
 0067349F    mov         eax,dword ptr [ebx]
 006734A1    call        THashTable.Add
 006734A6    mov         ecx,0F
 006734AB    mov         edx,673A5C;'ControlPanelDisplay'
 006734B0    mov         eax,dword ptr [ebx]
 006734B2    call        THashTable.Add
 006734B7    mov         ecx,10
 006734BC    mov         edx,673A90;'PlaySound'
 006734C1    mov         eax,dword ptr [ebx]
 006734C3    call        THashTable.Add
 006734C8    mov         ecx,11
 006734CD    mov         edx,673AB0;'Beep'
 006734D2    mov         eax,dword ptr [ebx]
 006734D4    call        THashTable.Add
 006734D9    mov         ecx,12
 006734DE    mov         edx,673AC8;'BeepAsterisk'
 006734E3    mov         eax,dword ptr [ebx]
 006734E5    call        THashTable.Add
 006734EA    mov         ecx,13
 006734EF    mov         edx,673AF0;'BeepExclamation'
 006734F4    mov         eax,dword ptr [ebx]
 006734F6    call        THashTable.Add
 006734FB    mov         ecx,14
 00673500    mov         edx,673B1C;'BeepHand'
 00673505    mov         eax,dword ptr [ebx]
 00673507    call        THashTable.Add
 0067350C    mov         ecx,15
 00673511    mov         edx,673B3C;'BeepQuestion'
 00673516    mov         eax,dword ptr [ebx]
 00673518    call        THashTable.Add
 0067351D    mov         ecx,16
 00673522    mov         edx,673B64;'BeepDefault'
 00673527    mov         eax,dword ptr [ebx]
 00673529    call        THashTable.Add
 0067352E    mov         ecx,17
 00673533    mov         edx,673B88;'FlashPieWindow'
 00673538    mov         eax,dword ptr [ebx]
 0067353A    call        THashTable.Add
 0067353F    mov         ecx,19
 00673544    mov         edx,673BB4;'HidePie'
 00673549    mov         eax,dword ptr [ebx]
 0067354B    call        THashTable.Add
 00673550    mov         ecx,1A
 00673555    mov         edx,673BD0;'ShowPie'
 0067355A    mov         eax,dword ptr [ebx]
 0067355C    call        THashTable.Add
 00673561    mov         ecx,1B
 00673566    mov         edx,673BEC;'MinimizePie'
 0067356B    mov         eax,dword ptr [ebx]
 0067356D    call        THashTable.Add
 00673572    mov         ecx,1C
 00673577    mov         edx,673C10;'MaximizePie'
 0067357C    mov         eax,dword ptr [ebx]
 0067357E    call        THashTable.Add
 00673583    mov         ecx,1D
 00673588    mov         edx,673C34;'RestorePie'
 0067358D    mov         eax,dword ptr [ebx]
 0067358F    call        THashTable.Add
 00673594    mov         ecx,1E
 00673599    mov         edx,673C58;'UnMinimizePie'
 0067359E    mov         eax,dword ptr [ebx]
 006735A0    call        THashTable.Add
 006735A5    mov         ecx,1F
 006735AA    mov         edx,673C80;'UnMaximizePie'
 006735AF    mov         eax,dword ptr [ebx]
 006735B1    call        THashTable.Add
 006735B6    mov         ecx,18
 006735BB    mov         edx,673CA8;'Chain'
 006735C0    mov         eax,dword ptr [ebx]
 006735C2    call        THashTable.Add
 006735C7    mov         ecx,18
 006735CC    mov         edx,673CC0;'ChainScript'
 006735D1    mov         eax,dword ptr [ebx]
 006735D3    call        THashTable.Add
 006735D8    mov         ecx,20
 006735DD    mov         edx,673CE4;'Press'
 006735E2    mov         eax,dword ptr [ebx]
 006735E4    call        THashTable.Add
 006735E9    mov         ecx,21
 006735EE    mov         edx,673CFC;'Release'
 006735F3    mov         eax,dword ptr [ebx]
 006735F5    call        THashTable.Add
 006735FA    mov         ecx,22
 006735FF    mov         edx,673D18;'Wait'
 00673604    mov         eax,dword ptr [ebx]
 00673606    call        THashTable.Add
 0067360B    mov         ecx,23
 00673610    mov         edx,673D30;'Toggle'
 00673615    mov         eax,dword ptr [ebx]
 00673617    call        THashTable.Add
 0067361C    mov         ecx,24
 00673621    mov         edx,673D4C;'Inc'
 00673626    mov         eax,dword ptr [ebx]
 00673628    call        THashTable.Add
 0067362D    mov         ecx,25
 00673632    mov         edx,673D60;'Dec'
 00673637    mov         eax,dword ptr [ebx]
 00673639    call        THashTable.Add
 0067363E    mov         ecx,26
 00673643    mov         edx,673D74;'Type'
 00673648    mov         eax,dword ptr [ebx]
 0067364A    call        THashTable.Add
 0067364F    mov         ecx,26
 00673654    mov         edx,673D8C;'TypeDirectInput'
 00673659    mov         eax,dword ptr [ebx]
 0067365B    call        THashTable.Add
 00673660    mov         ecx,26
 00673665    mov         edx,673DB8;'TypeFast'
 0067366A    mov         eax,dword ptr [ebx]
 0067366C    call        THashTable.Add
 00673671    mov         ecx,27
 00673676    mov         edx,673DD8;'TypeUnicode'
 0067367B    mov         eax,dword ptr [ebx]
 0067367D    call        THashTable.Add
 00673682    mov         ecx,28
 00673687    mov         edx,673DFC;'SendOsc'
 0067368C    mov         eax,dword ptr [ebx]
 0067368E    call        THashTable.Add
 00673693    mov         ecx,29
 00673698    mov         edx,673E18;'BroadcastOsc'
 0067369D    mov         eax,dword ptr [ebx]
 0067369F    call        THashTable.Add
 006736A4    pop         ebx
 006736A5    ret
*}
end;

//00673E34
procedure sub_00673E34;
begin
{*
 00673E34    push        ebx
 00673E35    mov         ebx,81ECD0;gvar_0081ECD0:THashTable
 00673E3A    mov         ecx,92
 00673E3F    mov         edx,674EC0;'ScreenPixel'
 00673E44    mov         eax,dword ptr [ebx]
 00673E46    call        THashTable.Add
 00673E4B    mov         ecx,8E
 00673E50    mov         edx,674EE4;'Starting'
 00673E55    mov         eax,dword ptr [ebx]
 00673E57    call        THashTable.Add
 00673E5C    mov         ecx,8C
 00673E61    mov         edx,674F04;'Swallow'
 00673E66    mov         eax,dword ptr [ebx]
 00673E68    call        THashTable.Add
 00673E6D    mov         ecx,89
 00673E72    mov         edx,674F20;'WiimotePeek'
 00673E77    mov         eax,dword ptr [ebx]
 00673E79    call        THashTable.Add
 00673E7E    mov         ecx,1
 00673E83    mov         edx,674F44;'abs'
 00673E88    mov         eax,dword ptr [ebx]
 00673E8A    call        THashTable.Add
 00673E8F    mov         ecx,1
 00673E94    mov         edx,674F58;'modulus'
 00673E99    mov         eax,dword ptr [ebx]
 00673E9B    call        THashTable.Add
 00673EA0    mov         ecx,1
 00673EA5    mov         edx,674F74;'fabs'
 00673EAA    mov         eax,dword ptr [ebx]
 00673EAC    call        THashTable.Add
 00673EB1    mov         ecx,1
 00673EB6    mov         edx,674F8C;'det'
 00673EBB    mov         eax,dword ptr [ebx]
 00673EBD    call        THashTable.Add
 00673EC2    mov         ecx,2
 00673EC7    mov         edx,674FA0;'ceil'
 00673ECC    mov         eax,dword ptr [ebx]
 00673ECE    call        THashTable.Add
 00673ED3    mov         ecx,3
 00673ED8    mov         edx,674FB8;^338:Single
 00673EDD    mov         eax,dword ptr [ebx]
 00673EDF    call        THashTable.Add
 00673EE4    mov         ecx,4
 00673EE9    mov         edx,674FD4;'exp'
 00673EEE    mov         eax,dword ptr [ebx]
 00673EF0    call        THashTable.Add
 00673EF5    mov         ecx,5
 00673EFA    mov         edx,674FE8;'floor'
 00673EFF    mov         eax,dword ptr [ebx]
 00673F01    call        THashTable.Add
 00673F06    mov         ecx,6
 00673F0B    mov         edx,675000;'frac'
 00673F10    mov         eax,dword ptr [ebx]
 00673F12    call        THashTable.Add
 00673F17    mov         ecx,7
 00673F1C    mov         edx,675018;'frexp'
 00673F21    mov         eax,dword ptr [ebx]
 00673F23    call        THashTable.Add
 00673F28    mov         ecx,8
 00673F2D    mov         edx,675030;'int'
 00673F32    mov         eax,dword ptr [ebx]
 00673F34    call        THashTable.Add
 00673F39    mov         ecx,9
 00673F3E    mov         edx,675044;'IntPower'
 00673F43    mov         eax,dword ptr [ebx]
 00673F45    call        THashTable.Add
 00673F4A    mov         ecx,0A
 00673F4F    mov         edx,675064;'IsInfinite'
 00673F54    mov         eax,dword ptr [ebx]
 00673F56    call        THashTable.Add
 00673F5B    mov         ecx,0B
 00673F60    mov         edx,675088;'IsNan'
 00673F65    mov         eax,dword ptr [ebx]
 00673F67    call        THashTable.Add
 00673F6C    mov         ecx,0C
 00673F71    mov         edx,6750A0;'IsZero'
 00673F76    mov         eax,dword ptr [ebx]
 00673F78    call        THashTable.Add
 00673F7D    mov         ecx,0D
 00673F82    mov         edx,6750BC;'ldexp'
 00673F87    mov         eax,dword ptr [ebx]
 00673F89    call        THashTable.Add
 00673F8E    mov         ecx,0E
 00673F93    mov         edx,6750D4;'ln'
 00673F98    mov         eax,dword ptr [ebx]
 00673F9A    call        THashTable.Add
 00673F9F    mov         ecx,0F
 00673FA4    mov         edx,6750E8;'lnxp1'
 00673FA9    mov         eax,dword ptr [ebx]
 00673FAB    call        THashTable.Add
 00673FB0    mov         ecx,10
 00673FB5    mov         edx,675100;'log10'
 00673FBA    mov         eax,dword ptr [ebx]
 00673FBC    call        THashTable.Add
 00673FC1    mov         ecx,11
 00673FC6    mov         edx,675118;'log2'
 00673FCB    mov         eax,dword ptr [ebx]
 00673FCD    call        THashTable.Add
 00673FD2    mov         ecx,12
 00673FD7    mov         edx,675130;'logn'
 00673FDC    mov         eax,dword ptr [ebx]
 00673FDE    call        THashTable.Add
 00673FE3    mov         ecx,13
 00673FE8    mov         edx,675148;'max'
 00673FED    mov         eax,dword ptr [ebx]
 00673FEF    call        THashTable.Add
 00673FF4    mov         ecx,13
 00673FF9    mov         edx,67515C;'maximum'
 00673FFE    mov         eax,dword ptr [ebx]
 00674000    call        THashTable.Add
 00674005    mov         ecx,14
 0067400A    mov         edx,675178;'min'
 0067400F    mov         eax,dword ptr [ebx]
 00674011    call        THashTable.Add
 00674016    mov         ecx,14
 0067401B    mov         edx,67518C;'minimum'
 00674020    mov         eax,dword ptr [ebx]
 00674022    call        THashTable.Add
 00674027    mov         ecx,15
 0067402C    mov         edx,6751A8;'MulDiv'
 00674031    mov         eax,dword ptr [ebx]
 00674033    call        THashTable.Add
 00674038    mov         ecx,16
 0067403D    mov         edx,6751C4;^'RealLeftStick'
 00674042    mov         eax,dword ptr [ebx]
 00674044    call        THashTable.Add
 00674049    mov         ecx,17
 0067404E    mov         edx,6751DC;^'RealLeftStick'
 00674053    mov         eax,dword ptr [ebx]
 00674055    call        THashTable.Add
 0067405A    mov         ecx,18
 0067405F    mov         edx,6751F4;'round'
 00674064    mov         eax,dword ptr [ebx]
 00674066    call        THashTable.Add
 0067406B    mov         ecx,19
 00674070    mov         edx,67520C;'RoundTo'
 00674075    mov         eax,dword ptr [ebx]
 00674077    call        THashTable.Add
 0067407C    mov         ecx,1A
 00674081    mov         edx,675228;'SameValue'
 00674086    mov         eax,dword ptr [ebx]
 00674088    call        THashTable.Add
 0067408D    mov         ecx,1B
 00674092    mov         edx,675248;'sign'
 00674097    mov         eax,dword ptr [ebx]
 00674099    call        THashTable.Add
 0067409E    mov         ecx,1C
 006740A3    mov         edx,675260;'SimpleRoundTo'
 006740A8    mov         eax,dword ptr [ebx]
 006740AA    call        THashTable.Add
 006740AF    mov         ecx,1D
 006740B4    mov         edx,675288;'sqr'
 006740B9    mov         eax,dword ptr [ebx]
 006740BB    call        THashTable.Add
 006740C0    mov         ecx,1D
 006740C5    mov         edx,67529C;'square'
 006740CA    mov         eax,dword ptr [ebx]
 006740CC    call        THashTable.Add
 006740D1    mov         ecx,1E
 006740D6    mov         edx,6752B8;'sqrt'
 006740DB    mov         eax,dword ptr [ebx]
 006740DD    call        THashTable.Add
 006740E2    mov         ecx,1E
 006740E7    mov         edx,6752D0;'SquareRoot'
 006740EC    mov         eax,dword ptr [ebx]
 006740EE    call        THashTable.Add
 006740F3    mov         ecx,1F
 006740F8    mov         edx,6752F4;'trunc'
 006740FD    mov         eax,dword ptr [ebx]
 006740FF    call        THashTable.Add
 00674104    mov         ecx,1F
 00674109    mov         edx,67530C;'Truncate'
 0067410E    mov         eax,dword ptr [ebx]
 00674110    call        THashTable.Add
 00674115    mov         ecx,20
 0067411A    mov         edx,67532C;'RandG'
 0067411F    mov         eax,dword ptr [ebx]
 00674121    call        THashTable.Add
 00674126    mov         ecx,21
 0067412B    mov         edx,675344;'random'
 00674130    mov         eax,dword ptr [ebx]
 00674132    call        THashTable.Add
 00674137    mov         ecx,22
 0067413C    mov         edx,675360;'RandomRange'
 00674141    mov         eax,dword ptr [ebx]
 00674143    call        THashTable.Add
 00674148    mov         ecx,23
 0067414D    mov         edx,675384;'EnsureRange'
 00674152    mov         eax,dword ptr [ebx]
 00674154    call        THashTable.Add
 00674159    mov         ecx,24
 0067415E    mov         edx,6753A8;'InRange'
 00674163    mov         eax,dword ptr [ebx]
 00674165    call        THashTable.Add
 0067416A    mov         ecx,25
 0067416F    mov         edx,6753C4;'odd'
 00674174    mov         eax,dword ptr [ebx]
 00674176    call        THashTable.Add
 0067417B    mov         ecx,26
 00674180    mov         edx,6753D8;'pred'
 00674185    mov         eax,dword ptr [ebx]
 00674187    call        THashTable.Add
 0067418C    mov         ecx,27
 00674191    mov         edx,6753F0;'succ'
 00674196    mov         eax,dword ptr [ebx]
 00674198    call        THashTable.Add
 0067419D    mov         ecx,28
 006741A2    mov         edx,675408;'sin'
 006741A7    mov         eax,dword ptr [ebx]
 006741A9    call        THashTable.Add
 006741AE    mov         ecx,28
 006741B3    mov         edx,67541C;'sine'
 006741B8    mov         eax,dword ptr [ebx]
 006741BA    call        THashTable.Add
 006741BF    mov         ecx,29
 006741C4    mov         edx,675434;'cos'
 006741C9    mov         eax,dword ptr [ebx]
 006741CB    call        THashTable.Add
 006741D0    mov         ecx,29
 006741D5    mov         edx,675448;'cosine'
 006741DA    mov         eax,dword ptr [ebx]
 006741DC    call        THashTable.Add
 006741E1    mov         ecx,2A
 006741E6    mov         edx,675464;'tan'
 006741EB    mov         eax,dword ptr [ebx]
 006741ED    call        THashTable.Add
 006741F2    mov         ecx,2A
 006741F7    mov         edx,675478;'tangent'
 006741FC    mov         eax,dword ptr [ebx]
 006741FE    call        THashTable.Add
 00674203    mov         ecx,2B
 00674208    mov         edx,675494;'cosecant'
 0067420D    mov         eax,dword ptr [ebx]
 0067420F    call        THashTable.Add
 00674214    mov         ecx,2B
 00674219    mov         edx,6754B4;'cosec'
 0067421E    mov         eax,dword ptr [ebx]
 00674220    call        THashTable.Add
 00674225    mov         ecx,2C
 0067422A    mov         edx,6754CC;'cosh'
 0067422F    mov         eax,dword ptr [ebx]
 00674231    call        THashTable.Add
 00674236    mov         ecx,2D
 0067423B    mov         edx,6754E4;'cot'
 00674240    mov         eax,dword ptr [ebx]
 00674242    call        THashTable.Add
 00674247    mov         ecx,2E
 0067424C    mov         edx,6754F8;'cotan'
 00674251    mov         eax,dword ptr [ebx]
 00674253    call        THashTable.Add
 00674258    mov         ecx,2F
 0067425D    mov         edx,675510;'coth'
 00674262    mov         eax,dword ptr [ebx]
 00674264    call        THashTable.Add
 00674269    mov         ecx,30
 0067426E    mov         edx,675528;'csc'
 00674273    mov         eax,dword ptr [ebx]
 00674275    call        THashTable.Add
 0067427A    mov         ecx,31
 0067427F    mov         edx,67553C;'csch'
 00674284    mov         eax,dword ptr [ebx]
 00674286    call        THashTable.Add
 0067428B    mov         ecx,32
 00674290    mov         edx,675554;'hypot'
 00674295    mov         eax,dword ptr [ebx]
 00674297    call        THashTable.Add
 0067429C    mov         ecx,33
 006742A1    mov         edx,67556C;'sec'
 006742A6    mov         eax,dword ptr [ebx]
 006742A8    call        THashTable.Add
 006742AD    mov         ecx,34
 006742B2    mov         edx,675580;'secant'
 006742B7    mov         eax,dword ptr [ebx]
 006742B9    call        THashTable.Add
 006742BE    mov         ecx,35
 006742C3    mov         edx,67559C;'sech'
 006742C8    mov         eax,dword ptr [ebx]
 006742CA    call        THashTable.Add
 006742CF    mov         ecx,36
 006742D4    mov         edx,6755B4;'sinh'
 006742D9    mov         eax,dword ptr [ebx]
 006742DB    call        THashTable.Add
 006742E0    mov         ecx,37
 006742E5    mov         edx,6755CC;'tanh'
 006742EA    mov         eax,dword ptr [ebx]
 006742EC    call        THashTable.Add
 006742F1    mov         ecx,38
 006742F6    mov         edx,6755E4;'ArcCos'
 006742FB    mov         eax,dword ptr [ebx]
 006742FD    call        THashTable.Add
 00674302    mov         ecx,39
 00674307    mov         edx,675600;'ArcCosh'
 0067430C    mov         eax,dword ptr [ebx]
 0067430E    call        THashTable.Add
 00674313    mov         ecx,3A
 00674318    mov         edx,67561C;'ArcCot'
 0067431D    mov         eax,dword ptr [ebx]
 0067431F    call        THashTable.Add
 00674324    mov         ecx,3B
 00674329    mov         edx,675638;'ArcCoth'
 0067432E    mov         eax,dword ptr [ebx]
 00674330    call        THashTable.Add
 00674335    mov         ecx,3C
 0067433A    mov         edx,675654;'ArcSsc'
 0067433F    mov         eax,dword ptr [ebx]
 00674341    call        THashTable.Add
 00674346    mov         ecx,3D
 0067434B    mov         edx,675670;'ArcScsh'
 00674350    mov         eax,dword ptr [ebx]
 00674352    call        THashTable.Add
 00674357    mov         ecx,3E
 0067435C    mov         edx,67568C;'ArcSec'
 00674361    mov         eax,dword ptr [ebx]
 00674363    call        THashTable.Add
 00674368    mov         ecx,3F
 0067436D    mov         edx,6756A8;'ArcSech'
 00674372    mov         eax,dword ptr [ebx]
 00674374    call        THashTable.Add
 00674379    mov         ecx,40
 0067437E    mov         edx,6756C4;'ArcSin'
 00674383    mov         eax,dword ptr [ebx]
 00674385    call        THashTable.Add
 0067438A    mov         ecx,41
 0067438F    mov         edx,6756E0;'ArcSinh'
 00674394    mov         eax,dword ptr [ebx]
 00674396    call        THashTable.Add
 0067439B    mov         ecx,42
 006743A0    mov         edx,6756FC;'ArcTan'
 006743A5    mov         eax,dword ptr [ebx]
 006743A7    call        THashTable.Add
 006743AC    mov         ecx,43
 006743B1    mov         edx,675718;'ArcTan2'
 006743B6    mov         eax,dword ptr [ebx]
 006743B8    call        THashTable.Add
 006743BD    mov         ecx,44
 006743C2    mov         edx,675734;'ArcTanh'
 006743C7    mov         eax,dword ptr [ebx]
 006743C9    call        THashTable.Add
 006743CE    mov         ecx,38
 006743D3    mov         edx,675750;'InvCos'
 006743D8    mov         eax,dword ptr [ebx]
 006743DA    call        THashTable.Add
 006743DF    mov         ecx,39
 006743E4    mov         edx,67576C;'InvCosh'
 006743E9    mov         eax,dword ptr [ebx]
 006743EB    call        THashTable.Add
 006743F0    mov         ecx,3A
 006743F5    mov         edx,675788;'InvCot'
 006743FA    mov         eax,dword ptr [ebx]
 006743FC    call        THashTable.Add
 00674401    mov         ecx,3B
 00674406    mov         edx,6757A4;'InvCoth'
 0067440B    mov         eax,dword ptr [ebx]
 0067440D    call        THashTable.Add
 00674412    mov         ecx,3C
 00674417    mov         edx,6757C0;'InvSsc'
 0067441C    mov         eax,dword ptr [ebx]
 0067441E    call        THashTable.Add
 00674423    mov         ecx,3D
 00674428    mov         edx,6757DC;'InvScsh'
 0067442D    mov         eax,dword ptr [ebx]
 0067442F    call        THashTable.Add
 00674434    mov         ecx,3E
 00674439    mov         edx,6757F8;'InvSec'
 0067443E    mov         eax,dword ptr [ebx]
 00674440    call        THashTable.Add
 00674445    mov         ecx,3F
 0067444A    mov         edx,675814;'InvSech'
 0067444F    mov         eax,dword ptr [ebx]
 00674451    call        THashTable.Add
 00674456    mov         ecx,40
 0067445B    mov         edx,675830;'InvSin'
 00674460    mov         eax,dword ptr [ebx]
 00674462    call        THashTable.Add
 00674467    mov         ecx,41
 0067446C    mov         edx,67584C;'InvSinh'
 00674471    mov         eax,dword ptr [ebx]
 00674473    call        THashTable.Add
 00674478    mov         ecx,42
 0067447D    mov         edx,675868;'InvTan'
 00674482    mov         eax,dword ptr [ebx]
 00674484    call        THashTable.Add
 00674489    mov         ecx,43
 0067448E    mov         edx,675884;'InvTan2'
 00674493    mov         eax,dword ptr [ebx]
 00674495    call        THashTable.Add
 0067449A    mov         ecx,44
 0067449F    mov         edx,6758A0;'InvTanh'
 006744A4    mov         eax,dword ptr [ebx]
 006744A6    call        THashTable.Add
 006744AB    mov         ecx,38
 006744B0    mov         edx,6758BC;'acos'
 006744B5    mov         eax,dword ptr [ebx]
 006744B7    call        THashTable.Add
 006744BC    mov         ecx,39
 006744C1    mov         edx,6758D4;'acosh'
 006744C6    mov         eax,dword ptr [ebx]
 006744C8    call        THashTable.Add
 006744CD    mov         ecx,3A
 006744D2    mov         edx,6758EC;'acot'
 006744D7    mov         eax,dword ptr [ebx]
 006744D9    call        THashTable.Add
 006744DE    mov         ecx,3B
 006744E3    mov         edx,675904;'acoth'
 006744E8    mov         eax,dword ptr [ebx]
 006744EA    call        THashTable.Add
 006744EF    mov         ecx,3C
 006744F4    mov         edx,67591C;'acsc'
 006744F9    mov         eax,dword ptr [ebx]
 006744FB    call        THashTable.Add
 00674500    mov         ecx,3D
 00674505    mov         edx,675934;'ascsh'
 0067450A    mov         eax,dword ptr [ebx]
 0067450C    call        THashTable.Add
 00674511    mov         ecx,3E
 00674516    mov         edx,67594C;'asec'
 0067451B    mov         eax,dword ptr [ebx]
 0067451D    call        THashTable.Add
 00674522    mov         ecx,3F
 00674527    mov         edx,675964;'asech'
 0067452C    mov         eax,dword ptr [ebx]
 0067452E    call        THashTable.Add
 00674533    mov         ecx,40
 00674538    mov         edx,67597C;'asin'
 0067453D    mov         eax,dword ptr [ebx]
 0067453F    call        THashTable.Add
 00674544    mov         ecx,41
 00674549    mov         edx,675994;'asinh'
 0067454E    mov         eax,dword ptr [ebx]
 00674550    call        THashTable.Add
 00674555    mov         ecx,42
 0067455A    mov         edx,6759AC;'atan'
 0067455F    mov         eax,dword ptr [ebx]
 00674561    call        THashTable.Add
 00674566    mov         ecx,43
 0067456B    mov         edx,6759C4;'atan2'
 00674570    mov         eax,dword ptr [ebx]
 00674572    call        THashTable.Add
 00674577    mov         ecx,44
 0067457C    mov         edx,6759DC;'atanh'
 00674581    mov         eax,dword ptr [ebx]
 00674583    call        THashTable.Add
 00674588    mov         ecx,8D
 0067458D    mov         edx,6759F4;'DeltaTime'
 00674592    mov         eax,dword ptr [ebx]
 00674594    call        THashTable.Add
 00674599    mov         ecx,8D
 0067459E    mov         edx,675A14;'FrameTime'
 006745A3    mov         eax,dword ptr [ebx]
 006745A5    call        THashTable.Add
 006745AA    mov         ecx,8B
 006745AF    mov         edx,675A34;'TimeStamp'
 006745B4    mov         eax,dword ptr [ebx]
 006745B6    call        THashTable.Add
 006745BB    mov         ecx,8B
 006745C0    mov         edx,675A54;'GetTimeStamp'
 006745C5    mov         eax,dword ptr [ebx]
 006745C7    call        THashTable.Add
 006745CC    mov         ecx,45
 006745D1    mov         edx,675A7C;'CurrentYear'
 006745D6    mov         eax,dword ptr [ebx]
 006745D8    call        THashTable.Add
 006745DD    mov         ecx,46
 006745E2    mov         edx,675AA0;'date'
 006745E7    mov         eax,dword ptr [ebx]
 006745E9    call        THashTable.Add
 006745EE    mov         ecx,46
 006745F3    mov         edx,675AB8;'Today'
 006745F8    mov         eax,dword ptr [ebx]
 006745FA    call        THashTable.Add
 006745FF    mov         ecx,47
 00674604    mov         edx,675AD0;'DateOf'
 00674609    mov         eax,dword ptr [ebx]
 0067460B    call        THashTable.Add
 00674610    mov         ecx,48
 00674615    mov         edx,675AEC;'DayOfTheMonth'
 0067461A    mov         eax,dword ptr [ebx]
 0067461C    call        THashTable.Add
 00674621    mov         ecx,49
 00674626    mov         edx,675B14;'DayOfTheWeek'
 0067462B    mov         eax,dword ptr [ebx]
 0067462D    call        THashTable.Add
 00674632    mov         ecx,4A
 00674637    mov         edx,675B3C;'DayOfTheYear'
 0067463C    mov         eax,dword ptr [ebx]
 0067463E    call        THashTable.Add
 00674643    mov         ecx,4B
 00674648    mov         edx,675B64;'DayOfWeek'
 0067464D    mov         eax,dword ptr [ebx]
 0067464F    call        THashTable.Add
 00674654    mov         ecx,4C
 00674659    mov         edx,675B84;'DaysBetween'
 0067465E    mov         eax,dword ptr [ebx]
 00674660    call        THashTable.Add
 00674665    mov         ecx,4D
 0067466A    mov         edx,675BA8;'DaysInAMonth'
 0067466F    mov         eax,dword ptr [ebx]
 00674671    call        THashTable.Add
 00674676    mov         ecx,4E
 0067467B    mov         edx,675BD0;'DaysInAYear'
 00674680    mov         eax,dword ptr [ebx]
 00674682    call        THashTable.Add
 00674687    mov         ecx,4F
 0067468C    mov         edx,675BF4;'DaysInMonth'
 00674691    mov         eax,dword ptr [ebx]
 00674693    call        THashTable.Add
 00674698    mov         ecx,50
 0067469D    mov         edx,675C18;'DaysInYear'
 006746A2    mov         eax,dword ptr [ebx]
 006746A4    call        THashTable.Add
 006746A9    mov         ecx,51
 006746AE    mov         edx,675C3C;'DaySpan'
 006746B3    mov         eax,dword ptr [ebx]
 006746B5    call        THashTable.Add
 006746BA    mov         ecx,52
 006746BF    mov         edx,675C58;'HourOfTheDay'
 006746C4    mov         eax,dword ptr [ebx]
 006746C6    call        THashTable.Add
 006746CB    mov         ecx,53
 006746D0    mov         edx,675C80;'HourOfTheMonth'
 006746D5    mov         eax,dword ptr [ebx]
 006746D7    call        THashTable.Add
 006746DC    mov         ecx,54
 006746E1    mov         edx,675CAC;'HourOfTheWeek'
 006746E6    mov         eax,dword ptr [ebx]
 006746E8    call        THashTable.Add
 006746ED    mov         ecx,55
 006746F2    mov         edx,675CD4;'HourOfTheYear'
 006746F7    mov         eax,dword ptr [ebx]
 006746F9    call        THashTable.Add
 006746FE    mov         ecx,56
 00674703    mov         edx,675CFC;'HoursBetween'
 00674708    mov         eax,dword ptr [ebx]
 0067470A    call        THashTable.Add
 0067470F    mov         ecx,57
 00674714    mov         edx,675D24;'HourSpan'
 00674719    mov         eax,dword ptr [ebx]
 0067471B    call        THashTable.Add
 00674720    mov         ecx,58
 00674725    mov         edx,675D44;'IncDay'
 0067472A    mov         eax,dword ptr [ebx]
 0067472C    call        THashTable.Add
 00674731    mov         ecx,5A
 00674736    mov         edx,675D60;'Time'
 0067473B    mov         eax,dword ptr [ebx]
 0067473D    call        THashTable.Add
 00674742    mov         ecx,5A
 00674747    mov         edx,675D78;'GetTime'
 0067474C    mov         eax,dword ptr [ebx]
 0067474E    call        THashTable.Add
 00674753    mov         ecx,59
 00674758    mov         edx,675D94;'Now'
 0067475D    mov         eax,dword ptr [ebx]
 0067475F    call        THashTable.Add
 00674764    mov         ecx,5C
 00674769    mov         edx,675DA8;'Tomorrow'
 0067476E    mov         eax,dword ptr [ebx]
 00674770    call        THashTable.Add
 00674775    mov         ecx,5D
 0067477A    mov         edx,675DC8;'Yesterday'
 0067477F    mov         eax,dword ptr [ebx]
 00674781    call        THashTable.Add
 00674786    mov         ecx,5B
 0067478B    mov         edx,675DE8;'TimeOf'
 00674790    mov         eax,dword ptr [ebx]
 00674792    call        THashTable.Add
 00674797    mov         ecx,5E
 0067479C    mov         edx,675E04;'RemoveUnits'
 006747A1    mov         eax,dword ptr [ebx]
 006747A3    call        THashTable.Add
 006747A8    mov         ecx,5F
 006747AD    mov         edx,675E28;'InSet'
 006747B2    mov         eax,dword ptr [ebx]
 006747B4    call        THashTable.Add
 006747B9    mov         ecx,5F
 006747BE    mov         edx,675E40;'In'
 006747C3    mov         eax,dword ptr [ebx]
 006747C5    call        THashTable.Add
 006747CA    mov         ecx,5F
 006747CF    mov         edx,675E54;'IsIn'
 006747D4    mov         eax,dword ptr [ebx]
 006747D6    call        THashTable.Add
 006747DB    mov         ecx,60
 006747E0    mov         edx,675E6C;'MapRange'
 006747E5    mov         eax,dword ptr [ebx]
 006747E7    call        THashTable.Add
 006747EC    mov         ecx,60
 006747F1    mov         edx,675E8C;'Map'
 006747F6    mov         eax,dword ptr [ebx]
 006747F8    call        THashTable.Add
 006747FD    mov         ecx,61
 00674802    mov         edx,675EA0;'EnsureMapRange'
 00674807    mov         eax,dword ptr [ebx]
 00674809    call        THashTable.Add
 0067480E    mov         ecx,61
 00674813    mov         edx,675ECC;'MapEnsureRange'
 00674818    mov         eax,dword ptr [ebx]
 0067481A    call        THashTable.Add
 0067481F    mov         ecx,61
 00674824    mov         edx,675EF8;'EnsureMap'
 00674829    mov         eax,dword ptr [ebx]
 0067482B    call        THashTable.Add
 00674830    mov         ecx,61
 00674835    mov         edx,675F18;'MapEnsure'
 0067483A    mov         eax,dword ptr [ebx]
 0067483C    call        THashTable.Add
 00674841    mov         ecx,63
 00674846    mov         edx,675F38;'Ord'
 0067484B    mov         eax,dword ptr [ebx]
 0067484D    call        THashTable.Add
 00674852    mov         ecx,63
 00674857    mov         edx,675F4C;'Asc'
 0067485C    mov         eax,dword ptr [ebx]
 0067485E    call        THashTable.Add
 00674863    mov         ecx,62
 00674868    mov         edx,675F60;'Chr'
 0067486D    mov         eax,dword ptr [ebx]
 0067486F    call        THashTable.Add
 00674874    mov         ecx,62
 00674879    mov         edx,675F74;'Char'
 0067487E    mov         eax,dword ptr [ebx]
 00674880    call        THashTable.Add
 00674885    mov         ecx,64
 0067488A    mov         edx,675F8C;'Trim'
 0067488F    mov         eax,dword ptr [ebx]
 00674891    call        THashTable.Add
 00674896    mov         ecx,65
 0067489B    mov         edx,675FA4;'TrimLeft'
 006748A0    mov         eax,dword ptr [ebx]
 006748A2    call        THashTable.Add
 006748A7    mov         ecx,65
 006748AC    mov         edx,675FC4;'LTrim'
 006748B1    mov         eax,dword ptr [ebx]
 006748B3    call        THashTable.Add
 006748B8    mov         ecx,66
 006748BD    mov         edx,675FDC;'TrimRight'
 006748C2    mov         eax,dword ptr [ebx]
 006748C4    call        THashTable.Add
 006748C9    mov         ecx,66
 006748CE    mov         edx,675FFC;'RTrim'
 006748D3    mov         eax,dword ptr [ebx]
 006748D5    call        THashTable.Add
 006748DA    mov         ecx,67
 006748DF    mov         edx,676014;'LowerCase'
 006748E4    mov         eax,dword ptr [ebx]
 006748E6    call        THashTable.Add
 006748EB    mov         ecx,68
 006748F0    mov         edx,676034;'UpperCase'
 006748F5    mov         eax,dword ptr [ebx]
 006748F7    call        THashTable.Add
 006748FC    mov         ecx,67
 00674901    mov         edx,676054;'LowCase'
 00674906    mov         eax,dword ptr [ebx]
 00674908    call        THashTable.Add
 0067490D    mov         ecx,68
 00674912    mov         edx,676070;'UpCase'
 00674917    mov         eax,dword ptr [ebx]
 00674919    call        THashTable.Add
 0067491E    mov         ecx,67
 00674923    mov         edx,67608C;'LCase'
 00674928    mov         eax,dword ptr [ebx]
 0067492A    call        THashTable.Add
 0067492F    mov         ecx,68
 00674934    mov         edx,6760A4;'UCase'
 00674939    mov         eax,dword ptr [ebx]
 0067493B    call        THashTable.Add
 00674940    mov         ecx,67
 00674945    mov         edx,6760BC;'toLowerCase'
 0067494A    mov         eax,dword ptr [ebx]
 0067494C    call        THashTable.Add
 00674951    mov         ecx,68
 00674956    mov         edx,6760E0;'toUpperCase'
 0067495B    mov         eax,dword ptr [ebx]
 0067495D    call        THashTable.Add
 00674962    mov         ecx,69
 00674967    mov         edx,676104;'Length'
 0067496C    mov         eax,dword ptr [ebx]
 0067496E    call        THashTable.Add
 00674973    mov         ecx,69
 00674978    mov         edx,676120;'Len'
 0067497D    mov         eax,dword ptr [ebx]
 0067497F    call        THashTable.Add
 00674984    mov         ecx,69
 00674989    mov         edx,676134;'strlen'
 0067498E    mov         eax,dword ptr [ebx]
 00674990    call        THashTable.Add
 00674995    mov         ecx,6A
 0067499A    mov         edx,676150;'Str'
 0067499F    mov         eax,dword ptr [ebx]
 006749A1    call        THashTable.Add
 006749A6    mov         ecx,6A
 006749AB    mov         edx,676164;'CStr'
 006749B0    mov         eax,dword ptr [ebx]
 006749B2    call        THashTable.Add
 006749B7    mov         ecx,6A
 006749BC    mov         edx,67617C;'toString'
 006749C1    mov         eax,dword ptr [ebx]
 006749C3    call        THashTable.Add
 006749C8    mov         ecx,6A
 006749CD    mov         edx,67619C;'IntToStr'
 006749D2    mov         eax,dword ptr [ebx]
 006749D4    call        THashTable.Add
 006749D9    mov         ecx,6A
 006749DE    mov         edx,6761BC;'FloatToStr'
 006749E3    mov         eax,dword ptr [ebx]
 006749E5    call        THashTable.Add
 006749EA    mov         ecx,6A
 006749EF    mov         edx,6761E0;'BoolToStr'
 006749F4    mov         eax,dword ptr [ebx]
 006749F6    call        THashTable.Add
 006749FB    mov         ecx,6B
 00674A00    mov         edx,676200;'Val'
 00674A05    mov         eax,dword ptr [ebx]
 00674A07    call        THashTable.Add
 00674A0C    mov         ecx,88
 00674A11    mov         edx,676214;'Float'
 00674A16    mov         eax,dword ptr [ebx]
 00674A18    call        THashTable.Add
 00674A1D    mov         ecx,88
 00674A22    mov         edx,67622C;'IntToFloat'
 00674A27    mov         eax,dword ptr [ebx]
 00674A29    call        THashTable.Add
 00674A2E    mov         ecx,6B
 00674A33    mov         edx,676250;'StrToInt'
 00674A38    mov         eax,dword ptr [ebx]
 00674A3A    call        THashTable.Add
 00674A3F    mov         ecx,6B
 00674A44    mov         edx,676270;'StrToFloat'
 00674A49    mov         eax,dword ptr [ebx]
 00674A4B    call        THashTable.Add
 00674A50    mov         ecx,6C
 00674A55    mov         edx,676294;'InStr'
 00674A5A    mov         eax,dword ptr [ebx]
 00674A5C    call        THashTable.Add
 00674A61    mov         ecx,6D
 00674A66    mov         edx,6762AC;'Pos'
 00674A6B    mov         eax,dword ptr [ebx]
 00674A6D    call        THashTable.Add
 00674A72    mov         ecx,6D
 00674A77    mov         edx,6762C0;'PosEx'
 00674A7C    mov         eax,dword ptr [ebx]
 00674A7E    call        THashTable.Add
 00674A83    mov         ecx,6E
 00674A88    mov         edx,6762D8;'Hex'
 00674A8D    mov         eax,dword ptr [ebx]
 00674A8F    call        THashTable.Add
 00674A94    mov         ecx,6E
 00674A99    mov         edx,6762EC;'Hexadecimal'
 00674A9E    mov         eax,dword ptr [ebx]
 00674AA0    call        THashTable.Add
 00674AA5    mov         ecx,6E
 00674AAA    mov         edx,676310;'IntToHex'
 00674AAF    mov         eax,dword ptr [ebx]
 00674AB1    call        THashTable.Add
 00674AB6    mov         ecx,6E
 00674ABB    mov         edx,676330;'toHexString'
 00674AC0    mov         eax,dword ptr [ebx]
 00674AC2    call        THashTable.Add
 00674AC7    mov         ecx,70
 00674ACC    mov         edx,676354;'InStrRev'
 00674AD1    mov         eax,dword ptr [ebx]
 00674AD3    call        THashTable.Add
 00674AD8    mov         ecx,70
 00674ADD    mov         edx,676374;'lastIndexOf'
 00674AE2    mov         eax,dword ptr [ebx]
 00674AE4    call        THashTable.Add
 00674AE9    mov         ecx,71
 00674AEE    mov         edx,676398;'strcmp'
 00674AF3    mov         eax,dword ptr [ebx]
 00674AF5    call        THashTable.Add
 00674AFA    mov         ecx,71
 00674AFF    mov         edx,6763B4;'StrComp'
 00674B04    mov         eax,dword ptr [ebx]
 00674B06    call        THashTable.Add
 00674B0B    mov         ecx,71
 00674B10    mov         edx,6763D0;'CompareStr'
 00674B15    mov         eax,dword ptr [ebx]
 00674B17    call        THashTable.Add
 00674B1C    mov         ecx,72
 00674B21    mov         edx,6763F4;'MidStr'
 00674B26    mov         eax,dword ptr [ebx]
 00674B28    call        THashTable.Add
 00674B2D    mov         ecx,72
 00674B32    mov         edx,676410;'Copy'
 00674B37    mov         eax,dword ptr [ebx]
 00674B39    call        THashTable.Add
 00674B3E    mov         ecx,72
 00674B43    mov         edx,676428;'Mid'
 00674B48    mov         eax,dword ptr [ebx]
 00674B4A    call        THashTable.Add
 00674B4F    mov         ecx,73
 00674B54    mov         edx,67643C;'RPos'
 00674B59    mov         eax,dword ptr [ebx]
 00674B5B    call        THashTable.Add
 00674B60    mov         ecx,73
 00674B65    mov         edx,676454;'RPosEx'
 00674B6A    mov         eax,dword ptr [ebx]
 00674B6C    call        THashTable.Add
 00674B71    mov         ecx,6F
 00674B76    mov         edx,676470;'Oct'
 00674B7B    mov         eax,dword ptr [ebx]
 00674B7D    call        THashTable.Add
 00674B82    mov         ecx,6F
 00674B87    mov         edx,676484;'Octal'
 00674B8C    mov         eax,dword ptr [ebx]
 00674B8E    call        THashTable.Add
 00674B93    mov         ecx,6F
 00674B98    mov         edx,67649C;'IntToOctal'
 00674B9D    mov         eax,dword ptr [ebx]
 00674B9F    call        THashTable.Add
 00674BA4    mov         ecx,6F
 00674BA9    mov         edx,6764C0;'toOctalString'
 00674BAE    mov         eax,dword ptr [ebx]
 00674BB0    call        THashTable.Add
 00674BB5    mov         ecx,74
 00674BBA    mov         edx,6764E8;'ReverseString'
 00674BBF    mov         eax,dword ptr [ebx]
 00674BC1    call        THashTable.Add
 00674BC6    mov         ecx,74
 00674BCB    mov         edx,676510;'StrReverse'
 00674BD0    mov         eax,dword ptr [ebx]
 00674BD2    call        THashTable.Add
 00674BD7    mov         ecx,75
 00674BDC    mov         edx,676534;'Replace'
 00674BE1    mov         eax,dword ptr [ebx]
 00674BE3    call        THashTable.Add
 00674BE8    mov         ecx,75
 00674BED    mov         edx,676550;'StringReplace'
 00674BF2    mov         eax,dword ptr [ebx]
 00674BF4    call        THashTable.Add
 00674BF9    mov         ecx,76
 00674BFE    mov         edx,676578;'LeftStr'
 00674C03    mov         eax,dword ptr [ebx]
 00674C05    call        THashTable.Add
 00674C0A    mov         ecx,76
 00674C0F    mov         edx,676594;'Left'
 00674C14    mov         eax,dword ptr [ebx]
 00674C16    call        THashTable.Add
 00674C1B    mov         ecx,76
 00674C20    mov         edx,6765AC;'AnsiLeftStr'
 00674C25    mov         eax,dword ptr [ebx]
 00674C27    call        THashTable.Add
 00674C2C    mov         ecx,77
 00674C31    mov         edx,6765D0;'RightStr'
 00674C36    mov         eax,dword ptr [ebx]
 00674C38    call        THashTable.Add
 00674C3D    mov         ecx,77
 00674C42    mov         edx,6765F0;'Right'
 00674C47    mov         eax,dword ptr [ebx]
 00674C49    call        THashTable.Add
 00674C4E    mov         ecx,77
 00674C53    mov         edx,676608;'AnsiRightStr'
 00674C58    mov         eax,dword ptr [ebx]
 00674C5A    call        THashTable.Add
 00674C5F    mov         ecx,78
 00674C64    mov         edx,676630;'BeginsWith'
 00674C69    mov         eax,dword ptr [ebx]
 00674C6B    call        THashTable.Add
 00674C70    mov         ecx,79
 00674C75    mov         edx,676654;'EndsWith'
 00674C7A    mov         eax,dword ptr [ebx]
 00674C7C    call        THashTable.Add
 00674C81    mov         ecx,7A
 00674C86    mov         edx,676674;'DotProduct'
 00674C8B    mov         eax,dword ptr [ebx]
 00674C8D    call        THashTable.Add
 00674C92    mov         ecx,7A
 00674C97    mov         edx,676698;'DotMultiply'
 00674C9C    mov         eax,dword ptr [ebx]
 00674C9E    call        THashTable.Add
 00674CA3    mov         ecx,7A
 00674CA8    mov         edx,6766BC;'ScalarProduct'
 00674CAD    mov         eax,dword ptr [ebx]
 00674CAF    call        THashTable.Add
 00674CB4    mov         ecx,7B
 00674CB9    mov         edx,6766E4;'CrossProduct'
 00674CBE    mov         eax,dword ptr [ebx]
 00674CC0    call        THashTable.Add
 00674CC5    mov         ecx,7B
 00674CCA    mov         edx,67670C;'VectorProduct'
 00674CCF    mov         eax,dword ptr [ebx]
 00674CD1    call        THashTable.Add
 00674CD6    mov         ecx,7B
 00674CDB    mov         edx,676734;'CrossMultiply'
 00674CE0    mov         eax,dword ptr [ebx]
 00674CE2    call        THashTable.Add
 00674CE7    mov         ecx,7C
 00674CEC    mov         edx,67675C;'Normalize'
 00674CF1    mov         eax,dword ptr [ebx]
 00674CF3    call        THashTable.Add
 00674CF8    mov         ecx,7C
 00674CFD    mov         edx,67677C;'Normalise'
 00674D02    mov         eax,dword ptr [ebx]
 00674D04    call        THashTable.Add
 00674D09    mov         ecx,7C
 00674D0E    mov         edx,67679C;'UnitVector'
 00674D13    mov         eax,dword ptr [ebx]
 00674D15    call        THashTable.Add
 00674D1A    mov         ecx,7C
 00674D1F    mov         edx,6767C0;'norm'
 00674D24    mov         eax,dword ptr [ebx]
 00674D26    call        THashTable.Add
 00674D2B    mov         ecx,7E
 00674D30    mov         edx,6767D8;'XAxis'
 00674D35    mov         eax,dword ptr [ebx]
 00674D37    call        THashTable.Add
 00674D3C    mov         ecx,7F
 00674D41    mov         edx,6767F0;'YAxis'
 00674D46    mov         eax,dword ptr [ebx]
 00674D48    call        THashTable.Add
 00674D4D    mov         ecx,80
 00674D52    mov         edx,676808;'ZAxis'
 00674D57    mov         eax,dword ptr [ebx]
 00674D59    call        THashTable.Add
 00674D5E    mov         ecx,7E
 00674D63    mov         edx,676820;'i'
 00674D68    mov         eax,dword ptr [ebx]
 00674D6A    call        THashTable.Add
 00674D6F    mov         ecx,7F
 00674D74    mov         edx,676830;'j'
 00674D79    mov         eax,dword ptr [ebx]
 00674D7B    call        THashTable.Add
 00674D80    mov         ecx,80
 00674D85    mov         edx,676840;'k'
 00674D8A    mov         eax,dword ptr [ebx]
 00674D8C    call        THashTable.Add
 00674D91    mov         ecx,7D
 00674D96    mov         edx,676850;'pi'
 00674D9B    mov         eax,dword ptr [ebx]
 00674D9D    call        THashTable.Add
 00674DA2    mov         ecx,81
 00674DA7    mov         edx,676864;'e'
 00674DAC    mov         eax,dword ptr [ebx]
 00674DAE    call        THashTable.Add
 00674DB3    mov         ecx,82
 00674DB8    mov         edx,676874;'Identity'
 00674DBD    mov         eax,dword ptr [ebx]
 00674DBF    call        THashTable.Add
 00674DC4    mov         ecx,82
 00674DC9    mov         edx,676894;'IdentityMatrix'
 00674DCE    mov         eax,dword ptr [ebx]
 00674DD0    call        THashTable.Add
 00674DD5    mov         ecx,82
 00674DDA    mov         edx,6768C0;'eye'
 00674DDF    mov         eax,dword ptr [ebx]
 00674DE1    call        THashTable.Add
 00674DE6    mov         ecx,83
 00674DEB    mov         edx,6768D4;'zeros'
 00674DF0    mov         eax,dword ptr [ebx]
 00674DF2    call        THashTable.Add
 00674DF7    mov         ecx,84
 00674DFC    mov         edx,6768EC;'ones'
 00674E01    mov         eax,dword ptr [ebx]
 00674E03    call        THashTable.Add
 00674E08    mov         ecx,85
 00674E0D    mov         edx,676904;'Transpose'
 00674E12    mov         eax,dword ptr [ebx]
 00674E14    call        THashTable.Add
 00674E19    mov         ecx,86
 00674E1E    mov         edx,676924;'inv'
 00674E23    mov         eax,dword ptr [ebx]
 00674E25    call        THashTable.Add
 00674E2A    mov         ecx,86
 00674E2F    mov         edx,676938;'inverse'
 00674E34    mov         eax,dword ptr [ebx]
 00674E36    call        THashTable.Add
 00674E3B    mov         ecx,86
 00674E40    mov         edx,676954;'invert'
 00674E45    mov         eax,dword ptr [ebx]
 00674E47    call        THashTable.Add
 00674E4C    mov         ecx,8F
 00674E51    mov         edx,676970;'GetYaw'
 00674E56    mov         eax,dword ptr [ebx]
 00674E58    call        THashTable.Add
 00674E5D    mov         ecx,90
 00674E62    mov         edx,67698C;'GetPitch'
 00674E67    mov         eax,dword ptr [ebx]
 00674E69    call        THashTable.Add
 00674E6E    mov         ecx,91
 00674E73    mov         edx,6769AC;'GetRoll'
 00674E78    mov         eax,dword ptr [ebx]
 00674E7A    call        THashTable.Add
 00674E7F    mov         ecx,87
 00674E84    mov         edx,6769C8;'AngleBetween'
 00674E89    mov         eax,dword ptr [ebx]
 00674E8B    call        THashTable.Add
 00674E90    mov         ecx,8A
 00674E95    mov         edx,6769F0;'Deadzone'
 00674E9A    mov         eax,dword ptr [ebx]
 00674E9C    call        THashTable.Add
 00674EA1    mov         ecx,93
 00674EA6    mov         edx,676A10;'Single'
 00674EAB    mov         eax,dword ptr [ebx]
 00674EAD    call        THashTable.Add
 00674EB2    pop         ebx
 00674EB3    ret
*}
end;

//00676A20
function TMathsFunction.GetUnits:TUnits;
begin
{*
 00676A20    mov         edx,dword ptr [eax+1C];TMathsFunction.FunctionNumber:Integer
 00676A23    cmp         edx,93
>00676A29    ja          00676CBC
 00676A2F    movzx       edx,byte ptr [edx+676A3D]
 00676A36    jmp         dword ptr [edx*4+676AD1]
 00676A36    db          1
 00676A36    db          6
 00676A36    db          7
 00676A36    db          0
 00676A36    db          11
 00676A36    db          7
 00676A36    db          7
 00676A36    db          12
 00676A36    db          7
 00676A36    db          13
 00676A36    db          25
 00676A36    db          26
 00676A36    db          27
 00676A36    db          14
 00676A36    db          15
 00676A36    db          16
 00676A36    db          17
 00676A36    db          18
 00676A36    db          19
 00676A36    db          8
 00676A36    db          8
 00676A36    db          20
 00676A36    db          21
 00676A36    db          22
 00676A36    db          7
 00676A36    db          7
 00676A36    db          28
 00676A36    db          53
 00676A36    db          7
 00676A36    db          23
 00676A36    db          24
 00676A36    db          9
 00676A36    db          31
 00676A36    db          32
 00676A36    db          33
 00676A36    db          10
 00676A36    db          29
 00676A36    db          30
 00676A36    db          9
 00676A36    db          9
 00676A36    db          34
 00676A36    db          34
 00676A36    db          34
 00676A36    db          34
 00676A36    db          34
 00676A36    db          34
 00676A36    db          34
 00676A36    db          34
 00676A36    db          34
 00676A36    db          34
 00676A36    db          55
 00676A36    db          35
 00676A36    db          35
 00676A36    db          35
 00676A36    db          35
 00676A36    db          35
 00676A36    db          36
 00676A36    db          36
 00676A36    db          36
 00676A36    db          36
 00676A36    db          36
 00676A36    db          36
 00676A36    db          36
 00676A36    db          36
 00676A36    db          36
 00676A36    db          36
 00676A36    db          36
 00676A36    db          36
 00676A36    db          36
 00676A36    db          38
 00676A36    db          39
 00676A36    db          40
 00676A36    db          41
 00676A36    db          41
 00676A36    db          41
 00676A36    db          41
 00676A36    db          41
 00676A36    db          42
 00676A36    db          42
 00676A36    db          42
 00676A36    db          42
 00676A36    db          43
 00676A36    db          44
 00676A36    db          44
 00676A36    db          44
 00676A36    db          44
 00676A36    db          45
 00676A36    db          46
 00676A36    db          47
 00676A36    db          49
 00676A36    db          48
 00676A36    db          52
 00676A36    db          50
 00676A36    db          51
 00676A36    db          54
 00676A36    db          0
 00676A36    db          56
 00676A36    db          56
 00676A36    db          0
 00676A36    db          6
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          6
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          6
 00676A36    db          6
 00676A36    db          0
 00676A36    db          4
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          0
 00676A36    db          5
 00676A36    db          0
 00676A36    db          0
 00676A36    db          7
 00676A36    db          37
 00676A36    db          57
 00676A36    db          3
 00676A36    db          0
 00676A36    db          2
 00676A36    db          2
 00676A36    db          2
 00676A36    db          0
 00676A36    db          9
 00676A36    dd          00676CBC
 00676A36    dd          00676BB9
 00676A36    dd          00676BBC
 00676A36    dd          00676BBF
 00676A36    dd          00676BC2
 00676A36    dd          00676BC5
 00676A36    dd          00676BC8
 00676A36    dd          00676BD3
 00676A36    dd          00676BDE
 00676A36    dd          00676BE9
 00676A36    dd          00676BF4
 00676A36    dd          00676BFF
 00676A36    dd          00676C02
 00676A36    dd          00676C05
 00676A36    dd          00676C08
 00676A36    dd          00676C0B
 00676A36    dd          00676C0E
 00676A36    dd          00676C11
 00676A36    dd          00676C14
 00676A36    dd          00676C17
 00676A36    dd          00676C1A
 00676A36    dd          00676C1D
 00676A36    dd          00676C20
 00676A36    dd          00676C23
 00676A36    dd          00676C2E
 00676A36    dd          00676C39
 00676A36    dd          00676C3C
 00676A36    dd          00676C3F
 00676A36    dd          00676C42
 00676A36    dd          00676C45
 00676A36    dd          00676C48
 00676A36    dd          00676C4B
 00676A36    dd          00676C56
 00676A36    dd          00676C59
 00676A36    dd          00676C5C
 00676A36    dd          00676C5F
 00676A36    dd          00676C62
 00676A36    dd          00676C65
 00676A36    dd          00676C68
 00676A36    dd          00676C6B
 00676A36    dd          00676C6E
 00676A36    dd          00676C71
 00676A36    dd          00676C74
 00676A36    dd          00676C77
 00676A36    dd          00676C7A
 00676A36    dd          00676C7D
 00676A36    dd          00676C80
 00676A36    dd          00676C83
 00676A36    dd          00676C86
 00676A36    dd          00676C89
 00676A36    dd          00676C8C
 00676A36    dd          00676C8F
 00676A36    dd          00676C92
 00676A36    dd          00676C95
 00676A36    dd          00676C98
 00676A36    dd          00676C9B
 00676A36    dd          00676CA6
 00676A36    dd          00676CB1
 00676BB9    xor         eax,eax
 00676BBB    ret
 00676BBC    mov         al,18
 00676BBE    ret
 00676BBF    mov         al,11
 00676BC1    ret
 00676BC2    mov         al,17
 00676BC4    ret
 00676BC5    mov         al,18
 00676BC7    ret
 00676BC8    mov         edx,1
 00676BCD    call        TMathsFunction.pu
 00676BD2    ret
 00676BD3    mov         edx,1
 00676BD8    call        TMathsFunction.pu
 00676BDD    ret
 00676BDE    mov         edx,1
 00676BE3    call        TMathsFunction.pu
 00676BE8    ret
 00676BE9    mov         edx,1
 00676BEE    call        TMathsFunction.pu
 00676BF3    ret
 00676BF4    mov         edx,1
 00676BF9    call        TMathsFunction.pu
 00676BFE    ret
 00676BFF    xor         eax,eax
 00676C01    ret
 00676C02    xor         eax,eax
 00676C04    ret
 00676C05    xor         eax,eax
 00676C07    ret
 00676C08    xor         eax,eax
 00676C0A    ret
 00676C0B    xor         eax,eax
 00676C0D    ret
 00676C0E    xor         eax,eax
 00676C10    ret
 00676C11    xor         eax,eax
 00676C13    ret
 00676C14    xor         eax,eax
 00676C16    ret
 00676C17    xor         eax,eax
 00676C19    ret
 00676C1A    xor         eax,eax
 00676C1C    ret
 00676C1D    xor         eax,eax
 00676C1F    ret
 00676C20    xor         eax,eax
 00676C22    ret
 00676C23    mov         edx,1
 00676C28    call        TMathsFunction.pu
 00676C2D    ret
 00676C2E    mov         edx,1
 00676C33    call        TMathsFunction.pu
 00676C38    ret
 00676C39    xor         eax,eax
 00676C3B    ret
 00676C3C    xor         eax,eax
 00676C3E    ret
 00676C3F    xor         eax,eax
 00676C41    ret
 00676C42    xor         eax,eax
 00676C44    ret
 00676C45    xor         eax,eax
 00676C47    ret
 00676C48    xor         eax,eax
 00676C4A    ret
 00676C4B    mov         edx,1
 00676C50    call        TMathsFunction.pu
 00676C55    ret
 00676C56    xor         eax,eax
 00676C58    ret
 00676C59    xor         eax,eax
 00676C5B    ret
 00676C5C    xor         eax,eax
 00676C5E    ret
 00676C5F    xor         eax,eax
 00676C61    ret
 00676C62    mov         al,18
 00676C64    ret
 00676C65    mov         al,11
 00676C67    ret
 00676C68    mov         al,15
 00676C6A    ret
 00676C6B    mov         al,14
 00676C6D    ret
 00676C6E    mov         al,14
 00676C70    ret
 00676C71    mov         al,14
 00676C73    ret
 00676C74    mov         al,14
 00676C76    ret
 00676C77    mov         al,14
 00676C79    ret
 00676C7A    mov         al,13
 00676C7C    ret
 00676C7D    mov         al,13
 00676C7F    ret
 00676C80    mov         al,13
 00676C82    ret
 00676C83    mov         al,14
 00676C85    ret
 00676C86    mov         al,14
 00676C88    ret
 00676C89    mov         al,14
 00676C8B    ret
 00676C8C    mov         al,14
 00676C8E    ret
 00676C8F    mov         al,14
 00676C91    ret
 00676C92    mov         al,14
 00676C94    ret
 00676C95    xor         eax,eax
 00676C97    ret
 00676C98    xor         eax,eax
 00676C9A    ret
 00676C9B    mov         edx,1
 00676CA0    call        TMathsFunction.pu
 00676CA5    ret
 00676CA6    mov         edx,4
 00676CAB    call        TMathsFunction.pu
 00676CB0    ret
 00676CB1    mov         edx,1
 00676CB6    call        TMathsFunction.pu
 00676CBB    ret
 00676CBC    xor         eax,eax
 00676CBE    ret
*}
end;

//00676CC0
procedure TMathsFunction.pu(i:Integer);
begin
{*
 00676CC0    push        ebx
 00676CC1    push        esi
 00676CC2    mov         esi,edx
 00676CC4    mov         ebx,eax
 00676CC6    test        esi,esi
>00676CC8    jle         00676CD2
 00676CCA    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00676CCD    cmp         esi,dword ptr [eax+8];TObjectList.FCount:Integer
>00676CD0    jle         00676CD7
 00676CD2    xor         eax,eax
 00676CD4    pop         esi
 00676CD5    pop         ebx
 00676CD6    ret
 00676CD7    mov         edx,esi
 00676CD9    dec         edx
 00676CDA    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00676CDD    call        TList.Get
 00676CE2    mov         edx,dword ptr ds:[67DB04];TExpression
 00676CE8    call        @AsClass
 00676CED    mov         edx,dword ptr [eax]
 00676CEF    call        dword ptr [edx+48];TExpression.GetUnits
 00676CF2    pop         esi
 00676CF3    pop         ebx
 00676CF4    ret
*}
end;

//00676CF8
procedure TMathsFunction.pppu(i:Integer);
begin
{*
 00676CF8    push        ebx
 00676CF9    push        esi
 00676CFA    mov         esi,edx
 00676CFC    mov         ebx,eax
 00676CFE    test        esi,esi
>00676D00    jle         00676D0A
 00676D02    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00676D05    cmp         esi,dword ptr [eax+8];TObjectList.FCount:Integer
>00676D08    jle         00676D0F
 00676D0A    xor         eax,eax
 00676D0C    pop         esi
 00676D0D    pop         ebx
 00676D0E    ret
 00676D0F    mov         edx,esi
 00676D11    dec         edx
 00676D12    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00676D15    call        TList.Get
 00676D1A    mov         edx,dword ptr ds:[67DB04];TExpression
 00676D20    call        @AsClass
 00676D25    mov         edx,dword ptr [eax]
 00676D27    call        dword ptr [edx+50];TExpression.GetPerUnits2
 00676D2A    pop         esi
 00676D2B    pop         ebx
 00676D2C    ret
*}
end;

//00676D30
procedure TMathsFunction.ppu(i:Integer);
begin
{*
 00676D30    push        ebx
 00676D31    push        esi
 00676D32    mov         esi,edx
 00676D34    mov         ebx,eax
 00676D36    test        esi,esi
>00676D38    jle         00676D42
 00676D3A    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00676D3D    cmp         esi,dword ptr [eax+8];TObjectList.FCount:Integer
>00676D40    jle         00676D47
 00676D42    xor         eax,eax
 00676D44    pop         esi
 00676D45    pop         ebx
 00676D46    ret
 00676D47    mov         edx,esi
 00676D49    dec         edx
 00676D4A    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00676D4D    call        TList.Get
 00676D52    mov         edx,dword ptr ds:[67DB04];TExpression
 00676D58    call        @AsClass
 00676D5D    mov         edx,dword ptr [eax]
 00676D5F    call        dword ptr [edx+4C];TExpression.GetPerUnits1
 00676D62    pop         esi
 00676D63    pop         ebx
 00676D64    ret
*}
end;

//00676D68
function TMathsFunction.GetPerUnits1:TUnits;
begin
{*
 00676D68    mov         edx,dword ptr [eax+1C];TMathsFunction.FunctionNumber:Integer
 00676D6B    cmp         edx,8C
>00676D71    ja          00676F97
 00676D77    movzx       edx,byte ptr [edx+676D85]
 00676D7E    jmp         dword ptr [edx*4+676E12]
 00676D7E    db          1
 00676D7E    db          3
 00676D7E    db          4
 00676D7E    db          0
 00676D7E    db          10
 00676D7E    db          4
 00676D7E    db          4
 00676D7E    db          11
 00676D7E    db          4
 00676D7E    db          12
 00676D7E    db          24
 00676D7E    db          25
 00676D7E    db          26
 00676D7E    db          13
 00676D7E    db          14
 00676D7E    db          15
 00676D7E    db          16
 00676D7E    db          17
 00676D7E    db          18
 00676D7E    db          5
 00676D7E    db          5
 00676D7E    db          19
 00676D7E    db          20
 00676D7E    db          21
 00676D7E    db          4
 00676D7E    db          4
 00676D7E    db          27
 00676D7E    db          36
 00676D7E    db          4
 00676D7E    db          22
 00676D7E    db          23
 00676D7E    db          6
 00676D7E    db          30
 00676D7E    db          31
 00676D7E    db          32
 00676D7E    db          9
 00676D7E    db          28
 00676D7E    db          29
 00676D7E    db          7
 00676D7E    db          8
 00676D7E    db          33
 00676D7E    db          33
 00676D7E    db          33
 00676D7E    db          33
 00676D7E    db          33
 00676D7E    db          33
 00676D7E    db          33
 00676D7E    db          33
 00676D7E    db          33
 00676D7E    db          33
 00676D7E    db          38
 00676D7E    db          34
 00676D7E    db          34
 00676D7E    db          34
 00676D7E    db          34
 00676D7E    db          34
 00676D7E    db          35
 00676D7E    db          35
 00676D7E    db          35
 00676D7E    db          35
 00676D7E    db          35
 00676D7E    db          35
 00676D7E    db          35
 00676D7E    db          35
 00676D7E    db          35
 00676D7E    db          35
 00676D7E    db          35
 00676D7E    db          35
 00676D7E    db          35
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          37
 00676D7E    db          0
 00676D7E    db          39
 00676D7E    db          39
 00676D7E    db          0
 00676D7E    db          3
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          3
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          3
 00676D7E    db          3
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          0
 00676D7E    db          2
 00676D7E    dd          00676F97
 00676D7E    dd          00676EB2
 00676D7E    dd          00676EB5
 00676D7E    dd          00676EC0
 00676D7E    dd          00676ECB
 00676D7E    dd          00676ED6
 00676D7E    dd          00676EE1
 00676D7E    dd          00676EEC
 00676D7E    dd          00676EF7
 00676D7E    dd          00676F02
 00676D7E    dd          00676F0D
 00676D7E    dd          00676F10
 00676D7E    dd          00676F13
 00676D7E    dd          00676F16
 00676D7E    dd          00676F19
 00676D7E    dd          00676F1C
 00676D7E    dd          00676F1F
 00676D7E    dd          00676F22
 00676D7E    dd          00676F25
 00676D7E    dd          00676F28
 00676D7E    dd          00676F2B
 00676D7E    dd          00676F2E
 00676D7E    dd          00676F31
 00676D7E    dd          00676F34
 00676D7E    dd          00676F37
 00676D7E    dd          00676F3A
 00676D7E    dd          00676F3D
 00676D7E    dd          00676F40
 00676D7E    dd          00676F43
 00676D7E    dd          00676F46
 00676D7E    dd          00676F49
 00676D7E    dd          00676F54
 00676D7E    dd          00676F57
 00676D7E    dd          00676F5A
 00676D7E    dd          00676F65
 00676D7E    dd          00676F70
 00676D7E    dd          00676F7B
 00676D7E    dd          00676F7E
 00676D7E    dd          00676F81
 00676D7E    dd          00676F8C
 00676EB2    xor         eax,eax
 00676EB4    ret
 00676EB5    mov         edx,1
 00676EBA    call        TMathsFunction.ppu
 00676EBF    ret
 00676EC0    mov         edx,1
 00676EC5    call        TMathsFunction.ppu
 00676ECA    ret
 00676ECB    mov         edx,1
 00676ED0    call        TMathsFunction.ppu
 00676ED5    ret
 00676ED6    mov         edx,1
 00676EDB    call        TMathsFunction.ppu
 00676EE0    ret
 00676EE1    mov         edx,1
 00676EE6    call        TMathsFunction.ppu
 00676EEB    ret
 00676EEC    mov         edx,1
 00676EF1    call        TMathsFunction.ppu
 00676EF6    ret
 00676EF7    mov         edx,1
 00676EFC    call        TMathsFunction.ppu
 00676F01    ret
 00676F02    mov         edx,1
 00676F07    call        TMathsFunction.ppu
 00676F0C    ret
 00676F0D    xor         eax,eax
 00676F0F    ret
 00676F10    xor         eax,eax
 00676F12    ret
 00676F13    xor         eax,eax
 00676F15    ret
 00676F16    xor         eax,eax
 00676F18    ret
 00676F19    xor         eax,eax
 00676F1B    ret
 00676F1C    xor         eax,eax
 00676F1E    ret
 00676F1F    xor         eax,eax
 00676F21    ret
 00676F22    xor         eax,eax
 00676F24    ret
 00676F25    xor         eax,eax
 00676F27    ret
 00676F28    xor         eax,eax
 00676F2A    ret
 00676F2B    xor         eax,eax
 00676F2D    ret
 00676F2E    xor         eax,eax
 00676F30    ret
 00676F31    xor         eax,eax
 00676F33    ret
 00676F34    xor         eax,eax
 00676F36    ret
 00676F37    xor         eax,eax
 00676F39    ret
 00676F3A    xor         eax,eax
 00676F3C    ret
 00676F3D    xor         eax,eax
 00676F3F    ret
 00676F40    xor         eax,eax
 00676F42    ret
 00676F43    xor         eax,eax
 00676F45    ret
 00676F46    xor         eax,eax
 00676F48    ret
 00676F49    mov         edx,1
 00676F4E    call        TMathsFunction.ppu
 00676F53    ret
 00676F54    xor         eax,eax
 00676F56    ret
 00676F57    xor         eax,eax
 00676F59    ret
 00676F5A    mov         edx,1
 00676F5F    call        TMathsFunction.ppu
 00676F64    ret
 00676F65    mov         edx,1
 00676F6A    call        TMathsFunction.ppu
 00676F6F    ret
 00676F70    mov         edx,1
 00676F75    call        TMathsFunction.ppu
 00676F7A    ret
 00676F7B    xor         eax,eax
 00676F7D    ret
 00676F7E    xor         eax,eax
 00676F80    ret
 00676F81    mov         edx,1
 00676F86    call        TMathsFunction.ppu
 00676F8B    ret
 00676F8C    mov         edx,4
 00676F91    call        TMathsFunction.ppu
 00676F96    ret
 00676F97    xor         eax,eax
 00676F99    ret
*}
end;

//00676F9C
function TMathsFunction.GetPerUnits2:TUnits;
begin
{*
 00676F9C    mov         edx,dword ptr [eax+1C];TMathsFunction.FunctionNumber:Integer
 00676F9F    cmp         edx,8C
>00676FA5    ja          006771BC
 00676FAB    movzx       edx,byte ptr [edx+676FB9]
 00676FB2    jmp         dword ptr [edx*4+677046]
 00676FB2    db          1
 00676FB2    db          3
 00676FB2    db          4
 00676FB2    db          0
 00676FB2    db          10
 00676FB2    db          4
 00676FB2    db          4
 00676FB2    db          11
 00676FB2    db          4
 00676FB2    db          12
 00676FB2    db          24
 00676FB2    db          25
 00676FB2    db          26
 00676FB2    db          13
 00676FB2    db          14
 00676FB2    db          15
 00676FB2    db          16
 00676FB2    db          17
 00676FB2    db          18
 00676FB2    db          5
 00676FB2    db          5
 00676FB2    db          19
 00676FB2    db          20
 00676FB2    db          21
 00676FB2    db          4
 00676FB2    db          4
 00676FB2    db          27
 00676FB2    db          35
 00676FB2    db          4
 00676FB2    db          22
 00676FB2    db          23
 00676FB2    db          6
 00676FB2    db          30
 00676FB2    db          31
 00676FB2    db          32
 00676FB2    db          9
 00676FB2    db          28
 00676FB2    db          29
 00676FB2    db          7
 00676FB2    db          8
 00676FB2    db          33
 00676FB2    db          33
 00676FB2    db          33
 00676FB2    db          33
 00676FB2    db          33
 00676FB2    db          33
 00676FB2    db          33
 00676FB2    db          33
 00676FB2    db          33
 00676FB2    db          33
 00676FB2    db          37
 00676FB2    db          33
 00676FB2    db          33
 00676FB2    db          33
 00676FB2    db          33
 00676FB2    db          33
 00676FB2    db          34
 00676FB2    db          34
 00676FB2    db          34
 00676FB2    db          34
 00676FB2    db          34
 00676FB2    db          34
 00676FB2    db          34
 00676FB2    db          34
 00676FB2    db          34
 00676FB2    db          34
 00676FB2    db          34
 00676FB2    db          34
 00676FB2    db          34
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          36
 00676FB2    db          0
 00676FB2    db          38
 00676FB2    db          38
 00676FB2    db          0
 00676FB2    db          3
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          3
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          3
 00676FB2    db          3
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          0
 00676FB2    db          2
 00676FB2    dd          006771BC
 00676FB2    dd          006770E2
 00676FB2    dd          006770E5
 00676FB2    dd          006770F0
 00676FB2    dd          006770FB
 00676FB2    dd          00677106
 00676FB2    dd          00677111
 00676FB2    dd          0067711C
 00676FB2    dd          00677127
 00676FB2    dd          00677132
 00676FB2    dd          0067713D
 00676FB2    dd          00677140
 00676FB2    dd          00677143
 00676FB2    dd          00677146
 00676FB2    dd          00677149
 00676FB2    dd          0067714C
 00676FB2    dd          0067714F
 00676FB2    dd          00677152
 00676FB2    dd          00677155
 00676FB2    dd          00677158
 00676FB2    dd          0067715B
 00676FB2    dd          0067715E
 00676FB2    dd          00677161
 00676FB2    dd          00677164
 00676FB2    dd          00677167
 00676FB2    dd          0067716A
 00676FB2    dd          0067716D
 00676FB2    dd          00677170
 00676FB2    dd          00677173
 00676FB2    dd          00677176
 00676FB2    dd          00677179
 00676FB2    dd          00677184
 00676FB2    dd          00677187
 00676FB2    dd          0067718A
 00676FB2    dd          00677195
 00676FB2    dd          006771A0
 00676FB2    dd          006771A3
 00676FB2    dd          006771A6
 00676FB2    dd          006771B1
 006770E2    xor         eax,eax
 006770E4    ret
 006770E5    mov         edx,1
 006770EA    call        TMathsFunction.pppu
 006770EF    ret
 006770F0    mov         edx,1
 006770F5    call        TMathsFunction.pppu
 006770FA    ret
 006770FB    mov         edx,1
 00677100    call        TMathsFunction.pppu
 00677105    ret
 00677106    mov         edx,1
 0067710B    call        TMathsFunction.pppu
 00677110    ret
 00677111    mov         edx,1
 00677116    call        TMathsFunction.pppu
 0067711B    ret
 0067711C    mov         edx,1
 00677121    call        TMathsFunction.pppu
 00677126    ret
 00677127    mov         edx,1
 0067712C    call        TMathsFunction.pppu
 00677131    ret
 00677132    mov         edx,1
 00677137    call        TMathsFunction.pppu
 0067713C    ret
 0067713D    xor         eax,eax
 0067713F    ret
 00677140    xor         eax,eax
 00677142    ret
 00677143    xor         eax,eax
 00677145    ret
 00677146    xor         eax,eax
 00677148    ret
 00677149    xor         eax,eax
 0067714B    ret
 0067714C    xor         eax,eax
 0067714E    ret
 0067714F    xor         eax,eax
 00677151    ret
 00677152    xor         eax,eax
 00677154    ret
 00677155    xor         eax,eax
 00677157    ret
 00677158    xor         eax,eax
 0067715A    ret
 0067715B    xor         eax,eax
 0067715D    ret
 0067715E    xor         eax,eax
 00677160    ret
 00677161    xor         eax,eax
 00677163    ret
 00677164    xor         eax,eax
 00677166    ret
 00677167    xor         eax,eax
 00677169    ret
 0067716A    xor         eax,eax
 0067716C    ret
 0067716D    xor         eax,eax
 0067716F    ret
 00677170    xor         eax,eax
 00677172    ret
 00677173    xor         eax,eax
 00677175    ret
 00677176    xor         eax,eax
 00677178    ret
 00677179    mov         edx,1
 0067717E    call        TMathsFunction.pppu
 00677183    ret
 00677184    xor         eax,eax
 00677186    ret
 00677187    xor         eax,eax
 00677189    ret
 0067718A    mov         edx,1
 0067718F    call        TMathsFunction.pppu
 00677194    ret
 00677195    mov         edx,1
 0067719A    call        TMathsFunction.pppu
 0067719F    ret
 006771A0    xor         eax,eax
 006771A2    ret
 006771A3    xor         eax,eax
 006771A5    ret
 006771A6    mov         edx,1
 006771AB    call        TMathsFunction.pppu
 006771B0    ret
 006771B1    mov         edx,4
 006771B6    call        TMathsFunction.pppu
 006771BB    ret
 006771BC    xor         eax,eax
 006771BE    ret
*}
end;

//006771C0
{*procedure TMathsFunction.ToString(?:?);
begin
 006771C0    push        ebp
 006771C1    mov         ebp,esp
 006771C3    push        0
 006771C5    push        0
 006771C7    push        0
 006771C9    push        ebx
 006771CA    push        esi
 006771CB    push        edi
 006771CC    mov         ebx,edx
 006771CE    mov         edi,eax
 006771D0    xor         eax,eax
 006771D2    push        ebp
 006771D3    push        677274
 006771D8    push        dword ptr fs:[eax]
 006771DB    mov         dword ptr fs:[eax],esp
 006771DE    lea         edx,[ebp-8]
 006771E1    mov         eax,dword ptr [edi+1C];TMathsFunction.FunctionNumber:Integer
 006771E4    call        00670644
 006771E9    mov         edx,dword ptr [ebp-8]
 006771EC    mov         eax,ebx
 006771EE    mov         ecx,677290;'('
 006771F3    call        @UStrCat3
 006771F8    mov         eax,dword ptr [edi+18];TMathsFunction.Parameters:TObjectList
 006771FB    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 006771FE    dec         eax
 006771FF    test        eax,eax
>00677201    jl          0067724D
 00677203    inc         eax
 00677204    mov         dword ptr [ebp-4],eax
 00677207    xor         esi,esi
 00677209    mov         eax,dword ptr [edi+18];TMathsFunction.Parameters:TObjectList
 0067720C    mov         edx,esi
 0067720E    call        TList.Get
 00677213    mov         edx,dword ptr ds:[67DB04];TExpression
 00677219    call        @AsClass
 0067721E    lea         edx,[ebp-0C]
 00677221    mov         ecx,dword ptr [eax]
 00677223    call        dword ptr [ecx-24];TExpression.ToString
 00677226    mov         edx,dword ptr [ebp-0C]
 00677229    mov         eax,ebx
 0067722B    call        @UStrCat
 00677230    mov         eax,dword ptr [edi+18];TMathsFunction.Parameters:TObjectList
 00677233    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 00677236    dec         eax
 00677237    cmp         esi,eax
>00677239    je          00677247
 0067723B    mov         eax,ebx
 0067723D    mov         edx,6772A0;', '
 00677242    call        @UStrCat
 00677247    inc         esi
 00677248    dec         dword ptr [ebp-4]
>0067724B    jne         00677209
 0067724D    mov         eax,ebx
 0067724F    mov         edx,6772B4;')'
 00677254    call        @UStrCat
 00677259    xor         eax,eax
 0067725B    pop         edx
 0067725C    pop         ecx
 0067725D    pop         ecx
 0067725E    mov         dword ptr fs:[eax],edx
 00677261    push        67727B
 00677266    lea         eax,[ebp-0C]
 00677269    mov         edx,2
 0067726E    call        @UStrArrayClr
 00677273    ret
>00677274    jmp         @HandleFinally
>00677279    jmp         00677266
 0067727B    pop         edi
 0067727C    pop         esi
 0067727D    pop         ebx
 0067727E    mov         esp,ebp
 00677280    pop         ebp
 00677281    ret
end;*}

//006772B8
procedure TMathsFunction.CreateClone;
begin
{*
 006772B8    mov         dl,1
 006772BA    mov         eax,[0066FAE8];TMathsFunction
 006772BF    call        TMathsFunction.Create;TMathsFunction.Create
 006772C4    ret
*}
end;

//006772C8
procedure TMathsFunction.FillClone(c:TExpression);
begin
{*
 006772C8    push        ebx
 006772C9    push        esi
 006772CA    push        edi
 006772CB    mov         esi,edx
 006772CD    mov         ebx,eax
 006772CF    mov         edx,esi
 006772D1    mov         eax,ebx
 006772D3    call        TExpression.FillClone
 006772D8    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 006772DB    call        00682EC4
 006772E0    mov         edi,esi
 006772E2    mov         dword ptr [edi+18],eax
 006772E5    mov         eax,dword ptr [ebx+1C];TMathsFunction.FunctionNumber:Integer
 006772E8    mov         dword ptr [edi+1C],eax
 006772EB    pop         edi
 006772EC    pop         esi
 006772ED    pop         ebx
 006772EE    ret
*}
end;

//006772F0
procedure TMathsFunction.sp(i:Integer; ?:UnicodeString);
begin
{*
 006772F0    push        ebx
 006772F1    push        esi
 006772F2    push        edi
 006772F3    mov         edi,ecx
 006772F5    mov         esi,edx
 006772F7    mov         ebx,eax
 006772F9    test        esi,esi
>006772FB    jle         00677305
 006772FD    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00677300    cmp         esi,dword ptr [eax+8];TObjectList.FCount:Integer
>00677303    jle         0067730E
 00677305    mov         eax,edi
 00677307    call        @UStrClr
>0067730C    jmp         0067732B
 0067730E    mov         edx,esi
 00677310    dec         edx
 00677311    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00677314    call        TList.Get
 00677319    mov         edx,dword ptr ds:[67DB04];TExpression
 0067731F    call        @AsClass
 00677324    mov         edx,edi
 00677326    mov         ecx,dword ptr [eax]
 00677328    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0067732B    pop         edi
 0067732C    pop         esi
 0067732D    pop         ebx
 0067732E    ret
*}
end;

//00677330
procedure TMathsFunction.Swallow;
begin
{*
 00677330    push        ebx
 00677331    push        esi
 00677332    push        edi
 00677333    mov         edi,eax
 00677335    mov         eax,dword ptr [edi+18];TMathsFunction.Parameters:TObjectList
 00677338    mov         ebx,dword ptr [eax+8];TObjectList.FCount:Integer
 0067733B    dec         ebx
 0067733C    test        ebx,ebx
>0067733E    jl          00677359
 00677340    inc         ebx
 00677341    xor         esi,esi
 00677343    mov         eax,dword ptr [edi+18];TMathsFunction.Parameters:TObjectList
 00677346    mov         edx,esi
 00677348    call        TList.Get
 0067734D    mov         edx,dword ptr [eax]
 0067734F    call        dword ptr [edx+88]
 00677355    inc         esi
 00677356    dec         ebx
>00677357    jne         00677343
 00677359    pop         edi
 0067735A    pop         esi
 0067735B    pop         ebx
 0067735C    ret
*}
end;

//00677360
procedure TMathsFunction.GetVector(x:Double; y:Double; z:Double);
begin
{*
 00677360    push        ebp
 00677361    mov         ebp,esp
 00677363    add         esp,0FFFFFFC0
 00677366    push        ebx
 00677367    push        esi
 00677368    push        edi
 00677369    mov         dword ptr [ebp-8],ecx
 0067736C    mov         dword ptr [ebp-4],edx
 0067736F    mov         ebx,eax
 00677371    mov         esi,dword ptr [ebp+8]
 00677374    mov         eax,dword ptr [ebx+1C];TMathsFunction.FunctionNumber:Integer
 00677377    cmp         eax,7F
>0067737A    jg          006773A9
>0067737C    je          00677627
 00677382    sub         eax,5E
>00677385    je          00677487
 0067738B    sub         eax,1D
>0067738E    je          006774A2
 00677394    dec         eax
>00677395    je          00677515
 0067739B    sub         eax,2
>0067739E    je          00677606
>006773A4    jmp         00677669
 006773A9    sub         eax,80
>006773AE    je          00677648
 006773B4    sub         eax,0C
>006773B7    je          0067745A
 006773BD    sub         eax,6
>006773C0    jne         00677669
 006773C6    push        0
 006773C8    call        user32.GetDC
 006773CD    mov         edi,eax
 006773CF    mov         edx,2
 006773D4    mov         eax,ebx
 006773D6    call        TMathsFunction.ip
 006773DB    push        eax
 006773DC    mov         edx,1
 006773E1    mov         eax,ebx
 006773E3    call        TMathsFunction.ip
 006773E8    push        eax
 006773E9    push        edi
 006773EA    call        gdi32.GetPixel
 006773EF    mov         ebx,eax
 006773F1    push        edi
 006773F2    push        0
 006773F4    call        user32.ReleaseDC
 006773F9    mov         eax,ebx
 006773FB    and         eax,0FF
 00677400    mov         dword ptr [ebp-40],eax
 00677403    xor         eax,eax
 00677405    mov         dword ptr [ebp-3C],eax
 00677408    fild        qword ptr [ebp-40]
 0067740B    fdiv        dword ptr ds:[677680];255:Single
 00677411    mov         eax,dword ptr [ebp-4]
 00677414    fstp        qword ptr [eax]
 00677416    wait
 00677417    mov         eax,ebx
 00677419    shr         eax,8
 0067741C    and         eax,0FF
 00677421    mov         dword ptr [ebp-40],eax
 00677424    xor         eax,eax
 00677426    mov         dword ptr [ebp-3C],eax
 00677429    fild        qword ptr [ebp-40]
 0067742C    fdiv        dword ptr ds:[677680];255:Single
 00677432    mov         eax,dword ptr [ebp-8]
 00677435    fstp        qword ptr [eax]
 00677437    wait
 00677438    shr         ebx,10
 0067743B    and         ebx,0FF
 00677441    mov         dword ptr [ebp-40],ebx
 00677444    xor         eax,eax
 00677446    mov         dword ptr [ebp-3C],eax
 00677449    fild        qword ptr [ebp-40]
 0067744C    fdiv        dword ptr ds:[677680];255:Single
 00677452    fstp        qword ptr [esi]
 00677454    wait
>00677455    jmp         00677677
 0067745A    xor         edx,edx
 0067745C    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 0067745F    call        TList.Get
 00677464    mov         edx,dword ptr [eax]
 00677466    call        dword ptr [edx+88]
 0067746C    push        esi
 0067746D    xor         edx,edx
 0067746F    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00677472    call        TList.Get
 00677477    mov         ecx,dword ptr [ebp-8]
 0067747A    mov         edx,dword ptr [ebp-4]
 0067747D    mov         ebx,dword ptr [eax]
 0067747F    call        dword ptr [ebx+20]
>00677482    jmp         00677677
 00677487    push        esi
 00677488    xor         edx,edx
 0067748A    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 0067748D    call        TList.Get
 00677492    mov         ecx,dword ptr [ebp-8]
 00677495    mov         edx,dword ptr [ebp-4]
 00677498    mov         ebx,dword ptr [eax]
 0067749A    call        dword ptr [ebx+20]
>0067749D    jmp         00677677
 006774A2    lea         eax,[ebp-20]
 006774A5    push        eax
 006774A6    xor         edx,edx
 006774A8    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 006774AB    call        TList.Get
 006774B0    lea         ecx,[ebp-18]
 006774B3    lea         edx,[ebp-10]
 006774B6    mov         edi,dword ptr [eax]
 006774B8    call        dword ptr [edi+20]
 006774BB    lea         eax,[ebp-38]
 006774BE    push        eax
 006774BF    mov         edx,1
 006774C4    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 006774C7    call        TList.Get
 006774CC    lea         ecx,[ebp-30]
 006774CF    lea         edx,[ebp-28]
 006774D2    mov         ebx,dword ptr [eax]
 006774D4    call        dword ptr [ebx+20]
 006774D7    fld         qword ptr [ebp-18]
 006774DA    fmul        qword ptr [ebp-38]
 006774DD    fld         qword ptr [ebp-30]
 006774E0    fmul        qword ptr [ebp-20]
 006774E3    fsubp       st(1),st
 006774E5    mov         eax,dword ptr [ebp-4]
 006774E8    fstp        qword ptr [eax]
 006774EA    wait
 006774EB    fld         qword ptr [ebp-20]
 006774EE    fmul        qword ptr [ebp-28]
 006774F1    fld         qword ptr [ebp-38]
 006774F4    fmul        qword ptr [ebp-10]
 006774F7    fsubp       st(1),st
 006774F9    mov         eax,dword ptr [ebp-8]
 006774FC    fstp        qword ptr [eax]
 006774FE    wait
 006774FF    fld         qword ptr [ebp-10]
 00677502    fmul        qword ptr [ebp-30]
 00677505    fld         qword ptr [ebp-28]
 00677508    fmul        qword ptr [ebp-18]
 0067750B    fsubp       st(1),st
 0067750D    fstp        qword ptr [esi]
 0067750F    wait
>00677510    jmp         00677677
 00677515    push        esi
 00677516    xor         edx,edx
 00677518    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 0067751B    call        TList.Get
 00677520    mov         ecx,dword ptr [ebp-8]
 00677523    mov         edx,dword ptr [ebp-4]
 00677526    mov         ebx,dword ptr [eax]
 00677528    call        dword ptr [ebx+20]
 0067752B    mov         eax,dword ptr [ebp-4]
 0067752E    fld         qword ptr [eax]
 00677530    fcomp       dword ptr ds:[677684];0:Single
 00677536    wait
 00677537    fnstsw      al
 00677539    sahf
>0067753A    jne         0067756B
 0067753C    mov         eax,dword ptr [ebp-8]
 0067753F    fld         qword ptr [eax]
 00677541    fcomp       dword ptr ds:[677684];0:Single
 00677547    wait
 00677548    fnstsw      al
 0067754A    sahf
>0067754B    jne         0067756B
 0067754D    fld         qword ptr [esi]
 0067754F    fcomp       dword ptr ds:[677684];0:Single
 00677555    wait
 00677556    fnstsw      al
 00677558    sahf
>00677559    jne         0067756B
 0067755B    xor         eax,eax
 0067755D    mov         dword ptr [esi],eax
 0067755F    mov         dword ptr [esi+4],3FF00000
>00677566    jmp         00677677
 0067756B    mov         eax,dword ptr [ebp-4]
 0067756E    push        dword ptr [eax+4]
 00677571    push        dword ptr [eax]
 00677573    mov         eax,dword ptr [ebp-8]
 00677576    push        dword ptr [eax+4]
 00677579    push        dword ptr [eax]
 0067757B    push        dword ptr [esi+4]
 0067757E    push        dword ptr [esi]
 00677580    call        005C4070
 00677585    fstp        qword ptr [ebp-10]
 00677588    wait
 00677589    mov         eax,dword ptr [ebp-4]
 0067758C    fld         qword ptr [eax]
 0067758E    fdiv        qword ptr [ebp-10]
 00677591    mov         eax,dword ptr [ebp-4]
 00677594    fstp        qword ptr [eax]
 00677596    wait
 00677597    mov         eax,dword ptr [ebp-8]
 0067759A    fld         qword ptr [eax]
 0067759C    fdiv        qword ptr [ebp-10]
 0067759F    mov         eax,dword ptr [ebp-8]
 006775A2    fstp        qword ptr [eax]
 006775A4    wait
 006775A5    fld         qword ptr [esi]
 006775A7    fdiv        qword ptr [ebp-10]
 006775AA    fstp        qword ptr [esi]
 006775AC    wait
 006775AD    mov         eax,dword ptr [ebp-4]
 006775B0    fld         qword ptr [eax]
 006775B2    fcomp       dword ptr ds:[677688];1:Single
 006775B8    wait
 006775B9    fnstsw      al
 006775BB    sahf
>006775BC    jbe         006775CC
 006775BE    mov         eax,dword ptr [ebp-4]
 006775C1    xor         edx,edx
 006775C3    mov         dword ptr [eax],edx
 006775C5    mov         dword ptr [eax+4],3FF00000
 006775CC    mov         eax,dword ptr [ebp-8]
 006775CF    fld         qword ptr [eax]
 006775D1    fcomp       dword ptr ds:[677688];1:Single
 006775D7    wait
 006775D8    fnstsw      al
 006775DA    sahf
>006775DB    jbe         006775EB
 006775DD    mov         eax,dword ptr [ebp-8]
 006775E0    xor         edx,edx
 006775E2    mov         dword ptr [eax],edx
 006775E4    mov         dword ptr [eax+4],3FF00000
 006775EB    fld         qword ptr [esi]
 006775ED    fcomp       dword ptr ds:[677688];1:Single
 006775F3    wait
 006775F4    fnstsw      al
 006775F6    sahf
>006775F7    jbe         00677677
 006775F9    xor         eax,eax
 006775FB    mov         dword ptr [esi],eax
 006775FD    mov         dword ptr [esi+4],3FF00000
>00677604    jmp         00677677
 00677606    mov         eax,dword ptr [ebp-4]
 00677609    xor         edx,edx
 0067760B    mov         dword ptr [eax],edx
 0067760D    mov         dword ptr [eax+4],3FF00000
 00677614    mov         eax,dword ptr [ebp-8]
 00677617    xor         edx,edx
 00677619    mov         dword ptr [eax],edx
 0067761B    mov         dword ptr [eax+4],edx
 0067761E    xor         eax,eax
 00677620    mov         dword ptr [esi],eax
 00677622    mov         dword ptr [esi+4],eax
>00677625    jmp         00677677
 00677627    mov         eax,dword ptr [ebp-4]
 0067762A    xor         edx,edx
 0067762C    mov         dword ptr [eax],edx
 0067762E    mov         dword ptr [eax+4],edx
 00677631    mov         eax,dword ptr [ebp-8]
 00677634    xor         edx,edx
 00677636    mov         dword ptr [eax],edx
 00677638    mov         dword ptr [eax+4],3FF00000
 0067763F    xor         eax,eax
 00677641    mov         dword ptr [esi],eax
 00677643    mov         dword ptr [esi+4],eax
>00677646    jmp         00677677
 00677648    mov         eax,dword ptr [ebp-4]
 0067764B    xor         edx,edx
 0067764D    mov         dword ptr [eax],edx
 0067764F    mov         dword ptr [eax+4],edx
 00677652    mov         eax,dword ptr [ebp-8]
 00677655    xor         edx,edx
 00677657    mov         dword ptr [eax],edx
 00677659    mov         dword ptr [eax+4],edx
 0067765C    xor         eax,eax
 0067765E    mov         dword ptr [esi],eax
 00677660    mov         dword ptr [esi+4],3FF00000
>00677667    jmp         00677677
 00677669    push        esi
 0067766A    mov         ecx,dword ptr [ebp-8]
 0067766D    mov         edx,dword ptr [ebp-4]
 00677670    mov         eax,ebx
 00677672    call        TExpression.GetVector
 00677677    pop         edi
 00677678    pop         esi
 00677679    pop         ebx
 0067767A    mov         esp,ebp
 0067767C    pop         ebp
 0067767D    ret         4
*}
end;

//0067768C
{*procedure TMathsFunction.GetString(?:?);
begin
 0067768C    push        ebp
 0067768D    mov         ebp,esp
 0067768F    mov         ecx,7
 00677694    push        0
 00677696    push        0
 00677698    dec         ecx
>00677699    jne         00677694
 0067769B    push        ebx
 0067769C    push        esi
 0067769D    push        edi
 0067769E    mov         esi,edx
 006776A0    mov         ebx,eax
 006776A2    xor         eax,eax
 006776A4    push        ebp
 006776A5    push        6779E8
 006776AA    push        dword ptr fs:[eax]
 006776AD    mov         dword ptr fs:[eax],esp
 006776B0    mov         eax,dword ptr [ebx+1C];TMathsFunction.FunctionNumber:Integer
 006776B3    add         eax,0FFFFFF9E
 006776B6    cmp         eax,15
>006776B9    ja          006779B7
 006776BF    jmp         dword ptr [eax*4+6776C6]
 006776BF    dd          0067771E
 006776BF    dd          006779B7
 006776BF    dd          00677750
 006776BF    dd          0067776E
 006776BF    dd          0067778C
 006776BF    dd          006777AA
 006776BF    dd          006777C8
 006776BF    dd          006779B7
 006776BF    dd          006777E6
 006776BF    dd          006779B7
 006776BF    dd          006779B7
 006776BF    dd          006779B7
 006776BF    dd          0067792B
 006776BF    dd          00677971
 006776BF    dd          006779B7
 006776BF    dd          006779B7
 006776BF    dd          00677817
 006776BF    dd          006779B7
 006776BF    dd          006777F9
 006776BF    dd          006778DE
 006776BF    dd          00677882
 006776BF    dd          006778B0
 0067771E    mov         edx,1
 00677723    mov         eax,ebx
 00677725    call        TMathsFunction.ip
 0067772A    mov         edi,eax
 0067772C    cmp         edi,0FF
>00677732    jg          00677742
 00677734    mov         eax,esi
 00677736    mov         edx,edi
 00677738    call        @UStrFromWChar
>0067773D    jmp         006779C0
 00677742    mov         eax,esi
 00677744    mov         edx,edi
 00677746    call        @UStrFromWChar
>0067774B    jmp         006779C0
 00677750    lea         ecx,[ebp-4]
 00677753    mov         edx,1
 00677758    mov         eax,ebx
 0067775A    call        TMathsFunction.sp
 0067775F    mov         eax,dword ptr [ebp-4]
 00677762    mov         edx,esi
 00677764    call        Trim
>00677769    jmp         006779C0
 0067776E    lea         ecx,[ebp-8]
 00677771    mov         edx,1
 00677776    mov         eax,ebx
 00677778    call        TMathsFunction.sp
 0067777D    mov         eax,dword ptr [ebp-8]
 00677780    mov         edx,esi
 00677782    call        TrimLeft
>00677787    jmp         006779C0
 0067778C    lea         ecx,[ebp-0C]
 0067778F    mov         edx,1
 00677794    mov         eax,ebx
 00677796    call        TMathsFunction.sp
 0067779B    mov         eax,dword ptr [ebp-0C]
 0067779E    mov         edx,esi
 006777A0    call        TrimRight
>006777A5    jmp         006779C0
 006777AA    lea         ecx,[ebp-10]
 006777AD    mov         edx,1
 006777B2    mov         eax,ebx
 006777B4    call        TMathsFunction.sp
 006777B9    mov         eax,dword ptr [ebp-10]
 006777BC    mov         edx,esi
 006777BE    call        LowerCase
>006777C3    jmp         006779C0
 006777C8    lea         ecx,[ebp-14]
 006777CB    mov         edx,1
 006777D0    mov         eax,ebx
 006777D2    call        TMathsFunction.sp
 006777D7    mov         eax,dword ptr [ebp-14]
 006777DA    mov         edx,esi
 006777DC    call        UpperCase
>006777E1    jmp         006779C0
 006777E6    mov         ecx,esi
 006777E8    mov         edx,1
 006777ED    mov         eax,ebx
 006777EF    call        TMathsFunction.sp
>006777F4    jmp         006779C0
 006777F9    lea         ecx,[ebp-18]
 006777FC    mov         edx,1
 00677801    mov         eax,ebx
 00677803    call        TMathsFunction.sp
 00677808    mov         eax,dword ptr [ebp-18]
 0067780B    mov         edx,esi
 0067780D    call        ReverseString
>00677812    jmp         006779C0
 00677817    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 0067781A    cmp         dword ptr [eax+8],3;TObjectList.FCount:Integer
>0067781E    jl          00677830
 00677820    mov         edx,3
 00677825    mov         eax,ebx
 00677827    call        TMathsFunction.ip
 0067782C    mov         edi,eax
>0067782E    jmp         00677853
 00677830    lea         ecx,[ebp-1C]
 00677833    mov         edx,1
 00677838    mov         eax,ebx
 0067783A    call        TMathsFunction.sp
 0067783F    mov         eax,dword ptr [ebp-1C]
 00677842    mov         dword ptr [ebp-20],eax
 00677845    mov         eax,dword ptr [ebp-20]
 00677848    test        eax,eax
>0067784A    je          00677851
 0067784C    sub         eax,4
 0067784F    mov         eax,dword ptr [eax]
 00677851    mov         edi,eax
 00677853    push        esi
 00677854    lea         ecx,[ebp-24]
 00677857    mov         edx,1
 0067785C    mov         eax,ebx
 0067785E    call        TMathsFunction.sp
 00677863    mov         eax,dword ptr [ebp-24]
 00677866    push        eax
 00677867    mov         edx,2
 0067786C    mov         eax,ebx
 0067786E    call        TMathsFunction.ip
 00677873    mov         edx,eax
 00677875    mov         ecx,edi
 00677877    pop         eax
 00677878    call        @UStrCopy
>0067787D    jmp         006779C0
 00677882    lea         ecx,[ebp-28]
 00677885    mov         edx,1
 0067788A    mov         eax,ebx
 0067788C    call        TMathsFunction.sp
 00677891    mov         eax,dword ptr [ebp-28]
 00677894    push        eax
 00677895    mov         edx,2
 0067789A    mov         eax,ebx
 0067789C    call        TMathsFunction.ip
 006778A1    mov         edx,eax
 006778A3    mov         ecx,esi
 006778A5    pop         eax
 006778A6    call        0067050C
>006778AB    jmp         006779C0
 006778B0    lea         ecx,[ebp-2C]
 006778B3    mov         edx,1
 006778B8    mov         eax,ebx
 006778BA    call        TMathsFunction.sp
 006778BF    mov         eax,dword ptr [ebp-2C]
 006778C2    push        eax
 006778C3    mov         edx,2
 006778C8    mov         eax,ebx
 006778CA    call        TMathsFunction.ip
 006778CF    mov         edx,eax
 006778D1    mov         ecx,esi
 006778D3    pop         eax
 006778D4    call        00670528
>006778D9    jmp         006779C0
 006778DE    movzx       eax,byte ptr ds:[6779F8];0x1 gvar_006779F8
 006778E5    push        eax
 006778E6    push        esi
 006778E7    lea         ecx,[ebp-30]
 006778EA    mov         edx,3
 006778EF    mov         eax,ebx
 006778F1    call        TMathsFunction.sp
 006778F6    mov         eax,dword ptr [ebp-30]
 006778F9    push        eax
 006778FA    lea         ecx,[ebp-34]
 006778FD    mov         edx,2
 00677902    mov         eax,ebx
 00677904    call        TMathsFunction.sp
 00677909    mov         eax,dword ptr [ebp-34]
 0067790C    push        eax
 0067790D    lea         ecx,[ebp-38]
 00677910    mov         edx,1
 00677915    mov         eax,ebx
 00677917    call        TMathsFunction.sp
 0067791C    mov         eax,dword ptr [ebp-38]
 0067791F    pop         edx
 00677920    pop         ecx
 00677921    call        StringReplace
>00677926    jmp         006779C0
 0067792B    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 0067792E    cmp         dword ptr [eax+8],2;TObjectList.FCount:Integer
>00677932    jl          00677957
 00677934    mov         edx,2
 00677939    mov         eax,ebx
 0067793B    call        TMathsFunction.ip
 00677940    push        eax
 00677941    mov         edx,1
 00677946    mov         eax,ebx
 00677948    call        TMathsFunction.ip
 0067794D    mov         ecx,esi
 0067794F    pop         edx
 00677950    call        IntToHex
>00677955    jmp         006779C0
 00677957    mov         edx,1
 0067795C    mov         eax,ebx
 0067795E    call        TMathsFunction.ip
 00677963    mov         ecx,esi
 00677965    mov         edx,1
 0067796A    call        IntToHex
>0067796F    jmp         006779C0
 00677971    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00677974    cmp         dword ptr [eax+8],2;TObjectList.FCount:Integer
>00677978    jl          0067799D
 0067797A    mov         edx,2
 0067797F    mov         eax,ebx
 00677981    call        TMathsFunction.ip
 00677986    push        eax
 00677987    mov         edx,1
 0067798C    mov         eax,ebx
 0067798E    call        TMathsFunction.ip
 00677993    mov         ecx,esi
 00677995    pop         edx
 00677996    call        004FA0A0
>0067799B    jmp         006779C0
 0067799D    mov         edx,1
 006779A2    mov         eax,ebx
 006779A4    call        TMathsFunction.ip
 006779A9    mov         ecx,esi
 006779AB    mov         edx,1
 006779B0    call        004FA0A0
>006779B5    jmp         006779C0
 006779B7    mov         edx,esi
 006779B9    mov         eax,ebx
 006779BB    call        TExpression.GetString
 006779C0    xor         eax,eax
 006779C2    pop         edx
 006779C3    pop         ecx
 006779C4    pop         ecx
 006779C5    mov         dword ptr fs:[eax],edx
 006779C8    push        6779EF
 006779CD    lea         eax,[ebp-38]
 006779D0    mov         edx,6
 006779D5    call        @UStrArrayClr
 006779DA    lea         eax,[ebp-1C]
 006779DD    mov         edx,7
 006779E2    call        @UStrArrayClr
 006779E7    ret
>006779E8    jmp         @HandleFinally
>006779ED    jmp         006779CD
 006779EF    pop         edi
 006779F0    pop         esi
 006779F1    pop         ebx
 006779F2    mov         esp,ebp
 006779F4    pop         ebp
 006779F5    ret
end;*}

//006779FC
procedure TMathsFunction.GetRotMat(m:TRotMat);
begin
{*
 006779FC    push        ebx
 006779FD    push        esi
 006779FE    add         esp,0FFFFFFA4
 00677A01    mov         dword ptr [esp],edx
 00677A04    mov         ebx,eax
 00677A06    mov         eax,ebx
 00677A08    mov         edx,dword ptr [eax]
 00677A0A    call        dword ptr [edx+44];TMathsFunction.GetDataType
 00677A0D    cmp         al,6
>00677A0F    je          00677A20
 00677A11    mov         edx,dword ptr [esp]
 00677A14    mov         eax,ebx
 00677A16    call        TExpression.GetRotMat
>00677A1B    jmp         00677B78
 00677A20    mov         eax,dword ptr [ebx+1C];TMathsFunction.FunctionNumber:Integer
 00677A23    cmp         eax,83
>00677A28    jg          00677A48
>00677A2A    je          00677A91
 00677A2C    sub         eax,1D
>00677A2F    je          00677B39
 00677A35    sub         eax,5F
>00677A38    je          00677B5E
 00677A3E    sub         eax,6
>00677A41    je          00677A5E
>00677A43    jmp         00677B78
 00677A48    sub         eax,84
>00677A4D    je          00677AB8
 00677A4F    dec         eax
 00677A50    sub         eax,2
>00677A53    jb          00677AE3
>00677A59    jmp         00677B78
 00677A5E    xor         esi,esi
 00677A60    mov         ecx,dword ptr [esp]
 00677A63    xor         eax,eax
 00677A65    mov         edx,ecx
 00677A67    cmp         eax,esi
 00677A69    sete        bl
 00677A6C    movsx       ebx,bl
 00677A6F    mov         dword ptr [esp+58],ebx
 00677A73    fild        dword ptr [esp+58]
 00677A77    fstp        qword ptr [edx]
 00677A79    wait
 00677A7A    inc         eax
 00677A7B    add         edx,8
 00677A7E    cmp         eax,3
>00677A81    jne         00677A67
 00677A83    inc         esi
 00677A84    add         ecx,18
 00677A87    cmp         esi,3
>00677A8A    jne         00677A63
>00677A8C    jmp         00677B78
 00677A91    mov         esi,3
 00677A96    mov         ecx,dword ptr [esp]
 00677A99    mov         eax,3
 00677A9E    mov         edx,ecx
 00677AA0    xor         ebx,ebx
 00677AA2    mov         dword ptr [edx],ebx
 00677AA4    mov         dword ptr [edx+4],ebx
 00677AA7    add         edx,8
 00677AAA    dec         eax
>00677AAB    jne         00677AA0
 00677AAD    add         ecx,18
 00677AB0    dec         esi
>00677AB1    jne         00677A99
>00677AB3    jmp         00677B78
 00677AB8    mov         esi,3
 00677ABD    mov         ecx,dword ptr [esp]
 00677AC0    mov         eax,3
 00677AC5    mov         edx,ecx
 00677AC7    xor         ebx,ebx
 00677AC9    mov         dword ptr [edx],ebx
 00677ACB    mov         dword ptr [edx+4],3FF00000
 00677AD2    add         edx,8
 00677AD5    dec         eax
>00677AD6    jne         00677AC7
 00677AD8    add         ecx,18
 00677ADB    dec         esi
>00677ADC    jne         00677AC0
>00677ADE    jmp         00677B78
 00677AE3    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00677AE6    xor         edx,edx
 00677AE8    call        TList.Get
 00677AED    lea         edx,[esp+10]
 00677AF1    mov         ecx,dword ptr [eax]
 00677AF3    call        dword ptr [ecx+40]
 00677AF6    mov         esi,3
 00677AFB    lea         eax,[esp+10]
 00677AFF    mov         dword ptr [esp+4],eax
 00677B03    mov         eax,dword ptr [esp]
 00677B06    mov         dword ptr [esp+8],eax
 00677B0A    mov         eax,3
 00677B0F    mov         edx,dword ptr [esp+4]
 00677B13    mov         ecx,dword ptr [esp+8]
 00677B17    mov         ebx,dword ptr [edx]
 00677B19    mov         dword ptr [ecx],ebx
 00677B1B    mov         ebx,dword ptr [edx+4]
 00677B1E    mov         dword ptr [ecx+4],ebx
 00677B21    add         ecx,8
 00677B24    add         edx,18
 00677B27    dec         eax
>00677B28    jne         00677B17
 00677B2A    add         dword ptr [esp+8],18
 00677B2F    add         dword ptr [esp+4],8
 00677B34    dec         esi
>00677B35    jne         00677B0A
>00677B37    jmp         00677B78
 00677B39    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00677B3C    xor         edx,edx
 00677B3E    call        TList.Get
 00677B43    lea         edx,[esp+10]
 00677B47    mov         ecx,dword ptr [eax]
 00677B49    call        dword ptr [ecx+40]
 00677B4C    mov         eax,dword ptr [esp]
 00677B4F    lea         ecx,[esp+10]
 00677B53    lea         edx,[esp+10]
 00677B57    call        005C3CB0
>00677B5C    jmp         00677B78
 00677B5E    mov         eax,dword ptr [ebx+18];TMathsFunction.Parameters:TObjectList
 00677B61    xor         edx,edx
 00677B63    call        TList.Get
 00677B68    mov         edx,dword ptr [esp]
 00677B6B    mov         ecx,dword ptr [eax]
 00677B6D    call        dword ptr [ecx+40]
 00677B70    mov         eax,dword ptr [esp]
 00677B73    call        005C3D90
 00677B78    add         esp,5C
 00677B7B    pop         esi
 00677B7C    pop         ebx
 00677B7D    ret
*}
end;

//00677B80
function TProcedureExpression.CanSet:Boolean;
begin
{*
 00677B80    mov         al,1
 00677B82    ret
*}
end;

//00677B84
procedure TProcedureExpression.CreateClone;
begin
{*
 00677B84    mov         dl,1
 00677B86    mov         eax,[00670104];TProcedureExpression
 00677B8B    call        TMathsFunction.Create;TProcedureExpression.Create
 00677B90    ret
*}
end;

//00677B94
function TProcedureExpression.Execute(Background:Boolean):Boolean;
begin
{*
 00677B94    push        ebp
 00677B95    mov         ebp,esp
 00677B97    mov         ecx,39
 00677B9C    push        0
 00677B9E    push        0
 00677BA0    dec         ecx
>00677BA1    jne         00677B9C
 00677BA3    push        ecx
 00677BA4    push        ebx
 00677BA5    push        esi
 00677BA6    push        edi
 00677BA7    mov         esi,eax
 00677BA9    xor         eax,eax
 00677BAB    push        ebp
 00677BAC    push        6791C3
 00677BB1    push        dword ptr fs:[eax]
 00677BB4    mov         dword ptr fs:[eax],esp
 00677BB7    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00677BBC    mov         eax,dword ptr [eax]
 00677BBE    call        TWinControl.GetHandle
 00677BC3    mov         ebx,eax
 00677BC5    mov         byte ptr [ebp-15],1
 00677BC9    mov         eax,dword ptr [esi+1C];TProcedureExpression.FunctionNumber:Integer
 00677BCC    cmp         eax,32
>00677BCF    ja          0067907E
 00677BD5    jmp         dword ptr [eax*4+677BDC]
 00677BD5    dd          0067907E
 00677BD5    dd          00677CFD
 00677BD5    dd          00677D2A
 00677BD5    dd          00677DF8
 00677BD5    dd          00677D8B
 00677BD5    dd          00677D76
 00677BD5    dd          00678085
 00677BD5    dd          00677DAD
 00677BD5    dd          00677E1F
 00677BD5    dd          00677E6E
 00677BD5    dd          00677EBD
 00677BD5    dd          00677F76
 00677BD5    dd          00677F0C
 00677BD5    dd          00677FC5
 00677BD5    dd          00677F5B
 00677BD5    dd          00678014
 00677BD5    dd          006780D2
 00677BD5    dd          006780FE
 00677BD5    dd          0067816B
 00677BD5    dd          00678177
 00677BD5    dd          00678183
 00677BD5    dd          0067818F
 00677BD5    dd          0067819B
 00677BD5    dd          006781A7
 00677BD5    dd          0067822D
 00677BD5    dd          00678273
 00677BD5    dd          00678262
 00677BD5    dd          00678284
 00677BD5    dd          00678295
 00677BD5    dd          006782A8
 00677BD5    dd          006782C7
 00677BD5    dd          006782D8
 00677BD5    dd          006782EB
 00677BD5    dd          0067830D
 00677BD5    dd          00678391
 00677BD5    dd          0067832F
 00677BD5    dd          006783CE
 00677BD5    dd          0067842D
 00677BD5    dd          0067848C
 00677BD5    dd          006784AE
 00677BD5    dd          006784E1
 00677BD5    dd          00678BD8
 00677BD5    dd          006789D6
 00677BD5    dd          00678B15
 00677BD5    dd          00678063
 00677BD5    dd          00678A5A
 00677BD5    dd          00678B7C
 00677BD5    dd          00677CCB
 00677BD5    dd          0067907E
 00677BD5    dd          00677CA8
 00677BD5    dd          00677D98
 00677CA8    mov         edx,1
 00677CAD    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00677CB0    call        TList.Get
 00677CB5    push        eax
 00677CB6    xor         edx,edx
 00677CB8    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00677CBB    call        TList.Get
 00677CC0    pop         edx
 00677CC1    call        0067B3E4
>00677CC6    jmp         0067907E
 00677CCB    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00677CCE    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 00677CD1    dec         eax
 00677CD2    test        eax,eax
>00677CD4    jl          0067907E
 00677CDA    inc         eax
 00677CDB    mov         dword ptr [ebp-34],eax
 00677CDE    xor         ebx,ebx
 00677CE0    mov         edx,ebx
 00677CE2    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00677CE5    call        TList.Get
 00677CEA    mov         edx,dword ptr [eax]
 00677CEC    call        dword ptr [edx+88]
 00677CF2    inc         ebx
 00677CF3    dec         dword ptr [ebp-34]
>00677CF6    jne         00677CE0
>00677CF8    jmp         0067907E
 00677CFD    xor         edx,edx
 00677CFF    xor         eax,eax
 00677D01    call        005D0620
 00677D06    lea         ecx,[ebp-0AC]
 00677D0C    mov         edx,1
 00677D11    mov         eax,esi
 00677D13    call        TMathsFunction.sp
 00677D18    mov         eax,dword ptr [ebp-0AC]
 00677D1E    xor         edx,edx
 00677D20    call        005D0620
>00677D25    jmp         0067907E
 00677D2A    lea         ecx,[ebp-4]
 00677D2D    mov         edx,1
 00677D32    mov         eax,esi
 00677D34    call        TMathsFunction.sp
 00677D39    mov         eax,[0078D7E4];^gvar_008155DC:TTntEdit
 00677D3E    cmp         dword ptr [eax],0
>00677D41    je          00677D67
 00677D43    lea         ecx,[ebp-0B0]
 00677D49    mov         edx,1
 00677D4E    mov         eax,esi
 00677D50    call        TMathsFunction.sp
 00677D55    mov         edx,dword ptr [ebp-0B0]
 00677D5B    mov         eax,[0078D7E4];^gvar_008155DC:TTntEdit
 00677D60    mov         eax,dword ptr [eax]
 00677D62    call        TControl.SetText
 00677D67    xor         edx,edx
 00677D69    mov         eax,dword ptr [ebp-4]
 00677D6C    call        005D0620
>00677D71    jmp         0067907E
 00677D76    mov         eax,[0078D7B0];^gvar_0078C988
 00677D7B    mov         byte ptr [eax],1
 00677D7E    mov         eax,[0078CE90];^gvar_0078C989
 00677D83    mov         byte ptr [eax],1
>00677D86    jmp         0067907E
 00677D8B    mov         eax,[0078D7B0];^gvar_0078C988
 00677D90    mov         byte ptr [eax],1
>00677D93    jmp         0067907E
 00677D98    mov         eax,[0078D7B0];^gvar_0078C988
 00677D9D    mov         byte ptr [eax],1
 00677DA0    mov         eax,[0078D7D4];^gvar_0078C98A
 00677DA5    mov         byte ptr [eax],1
>00677DA8    jmp         0067907E
 00677DAD    lea         ecx,[ebp-0B8]
 00677DB3    mov         edx,1
 00677DB8    mov         eax,esi
 00677DBA    call        TMathsFunction.sp
 00677DBF    mov         ecx,dword ptr [ebp-0B8]
 00677DC5    lea         eax,[ebp-0B4]
 00677DCB    mov         edx,6791E4;'// '
 00677DD0    call        @UStrCat3
 00677DD5    mov         edx,dword ptr [ebp-0B4]
 00677DDB    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00677DE0    mov         eax,dword ptr [eax]
 00677DE2    mov         eax,dword ptr [eax+394]
 00677DE8    mov         eax,dword ptr [eax+2A4]
 00677DEE    mov         ecx,dword ptr [eax]
 00677DF0    call        dword ptr [ecx+38]
>00677DF3    jmp         0067907E
 00677DF8    push        5
 00677DFA    push        0
 00677DFC    push        6791EC
 00677E01    push        679224;'rundll32.exe'
 00677E06    push        0
 00677E08    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00677E0D    mov         eax,dword ptr [eax]
 00677E0F    call        TWinControl.GetHandle
 00677E14    push        eax
 00677E15    call        shell32.ShellExecuteW
>00677E1A    jmp         0067907E
 00677E1F    push        5
 00677E21    push        0
 00677E23    mov         edx,1
 00677E28    mov         eax,esi
 00677E2A    call        TMathsFunction.ip
 00677E2F    lea         edx,[ebp-0C0]
 00677E35    call        IntToStr
 00677E3A    mov         ecx,dword ptr [ebp-0C0]
 00677E40    lea         eax,[ebp-0BC]
 00677E46    mov         edx,67924C;'shell32.dll,Control_RunDLL main.cpl,Keyboard,'
 00677E4B    call        @UStrCat3
 00677E50    mov         eax,dword ptr [ebp-0BC]
 00677E56    call        @UStrToPWChar
 00677E5B    push        eax
 00677E5C    push        679224;'rundll32.exe'
 00677E61    push        0
 00677E63    push        ebx
 00677E64    call        shell32.ShellExecuteW
>00677E69    jmp         0067907E
 00677E6E    push        5
 00677E70    push        0
 00677E72    mov         edx,1
 00677E77    mov         eax,esi
 00677E79    call        TMathsFunction.ip
 00677E7E    lea         edx,[ebp-0C8]
 00677E84    call        IntToStr
 00677E89    mov         ecx,dword ptr [ebp-0C8]
 00677E8F    lea         eax,[ebp-0C4]
 00677E95    mov         edx,6792B4;'shell32.dll,Control_RunDLL main.cpl,,'
 00677E9A    call        @UStrCat3
 00677E9F    mov         eax,dword ptr [ebp-0C4]
 00677EA5    call        @UStrToPWChar
 00677EAA    push        eax
 00677EAB    push        679224;'rundll32.exe'
 00677EB0    push        0
 00677EB2    push        ebx
 00677EB3    call        shell32.ShellExecuteW
>00677EB8    jmp         0067907E
 00677EBD    push        5
 00677EBF    push        0
 00677EC1    mov         edx,1
 00677EC6    mov         eax,esi
 00677EC8    call        TMathsFunction.ip
 00677ECD    lea         edx,[ebp-0D0]
 00677ED3    call        IntToStr
 00677ED8    mov         ecx,dword ptr [ebp-0D0]
 00677EDE    lea         eax,[ebp-0CC]
 00677EE4    mov         edx,67930C;'shell32.dll,Control_RunDLL joy.cpl,,'
 00677EE9    call        @UStrCat3
 00677EEE    mov         eax,dword ptr [ebp-0CC]
 00677EF4    call        @UStrToPWChar
 00677EF9    push        eax
 00677EFA    push        679224;'rundll32.exe'
 00677EFF    push        0
 00677F01    push        ebx
 00677F02    call        shell32.ShellExecuteW
>00677F07    jmp         0067907E
 00677F0C    push        5
 00677F0E    push        0
 00677F10    mov         edx,1
 00677F15    mov         eax,esi
 00677F17    call        TMathsFunction.ip
 00677F1C    lea         edx,[ebp-0D8]
 00677F22    call        IntToStr
 00677F27    mov         ecx,dword ptr [ebp-0D8]
 00677F2D    lea         eax,[ebp-0D4]
 00677F33    mov         edx,679364;'shell32.dll,Control_RunDLL pportjoy.cpl,,'
 00677F38    call        @UStrCat3
 00677F3D    mov         eax,dword ptr [ebp-0D4]
 00677F43    call        @UStrToPWChar
 00677F48    push        eax
 00677F49    push        679224;'rundll32.exe'
 00677F4E    push        0
 00677F50    push        ebx
 00677F51    call        shell32.ShellExecuteW
>00677F56    jmp         0067907E
 00677F5B    push        5
 00677F5D    push        0
 00677F5F    push        6793B8;'shell32.dll,Control_RunDLL mmsys.cpl,,2'
 00677F64    push        679224;'rundll32.exe'
 00677F69    push        0
 00677F6B    push        ebx
 00677F6C    call        shell32.ShellExecuteW
>00677F71    jmp         0067907E
 00677F76    push        5
 00677F78    push        0
 00677F7A    mov         edx,1
 00677F7F    mov         eax,esi
 00677F81    call        TMathsFunction.ip
 00677F86    lea         edx,[ebp-0E0]
 00677F8C    call        IntToStr
 00677F91    mov         ecx,dword ptr [ebp-0E0]
 00677F97    lea         eax,[ebp-0DC]
 00677F9D    mov         edx,679414;'shell32.dll,Control_RunDLL glovecpl.cpl,,'
 00677FA2    call        @UStrCat3
 00677FA7    mov         eax,dword ptr [ebp-0DC]
 00677FAD    call        @UStrToPWChar
 00677FB2    push        eax
 00677FB3    push        679224;'rundll32.exe'
 00677FB8    push        0
 00677FBA    push        ebx
 00677FBB    call        shell32.ShellExecuteW
>00677FC0    jmp         0067907E
 00677FC5    push        5
 00677FC7    push        0
 00677FC9    mov         edx,1
 00677FCE    mov         eax,esi
 00677FD0    call        TMathsFunction.ip
 00677FD5    lea         edx,[ebp-0E8]
 00677FDB    call        IntToStr
 00677FE0    mov         ecx,dword ptr [ebp-0E8]
 00677FE6    lea         eax,[ebp-0E4]
 00677FEC    mov         edx,679474;'shell32.dll,Control_RunDLL "C:\Program Files\Common Files\Microsoft Shared\S...
 00677FF1    call        @UStrCat3
 00677FF6    mov         eax,dword ptr [ebp-0E4]
 00677FFC    call        @UStrToPWChar
 00678001    push        eax
 00678002    push        679224;'rundll32.exe'
 00678007    push        0
 00678009    push        ebx
 0067800A    call        shell32.ShellExecuteW
>0067800F    jmp         0067907E
 00678014    push        5
 00678016    push        0
 00678018    mov         edx,1
 0067801D    mov         eax,esi
 0067801F    call        TMathsFunction.ip
 00678024    lea         edx,[ebp-0F0]
 0067802A    call        IntToStr
 0067802F    mov         ecx,dword ptr [ebp-0F0]
 00678035    lea         eax,[ebp-0EC]
 0067803B    mov         edx,67953C;'shell32.dll,Control_RunDLL desk.cpl,,'
 00678040    call        @UStrCat3
 00678045    mov         eax,dword ptr [ebp-0EC]
 0067804B    call        @UStrToPWChar
 00678050    push        eax
 00678051    push        679224;'rundll32.exe'
 00678056    push        0
 00678058    push        ebx
 00678059    call        shell32.ShellExecuteW
>0067805E    jmp         0067907E
 00678063    lea         ecx,[ebp-0F4]
 00678069    mov         edx,1
 0067806E    mov         eax,esi
 00678070    call        TMathsFunction.sp
 00678075    mov         eax,dword ptr [ebp-0F4]
 0067807B    call        004F9EA0
>00678080    jmp         0067907E
 00678085    push        5
 00678087    push        0
 00678089    lea         ecx,[ebp-0F8]
 0067808F    mov         edx,2
 00678094    mov         eax,esi
 00678096    call        TMathsFunction.sp
 0067809B    mov         eax,dword ptr [ebp-0F8]
 006780A1    call        @UStrToPWChar
 006780A6    push        eax
 006780A7    lea         ecx,[ebp-0FC]
 006780AD    mov         edx,1
 006780B2    mov         eax,esi
 006780B4    call        TMathsFunction.sp
 006780B9    mov         eax,dword ptr [ebp-0FC]
 006780BF    call        @UStrToPWChar
 006780C4    push        eax
 006780C5    push        0
 006780C7    push        ebx
 006780C8    call        shell32.ShellExecuteW
>006780CD    jmp         0067907E
 006780D2    push        3
 006780D4    push        0
 006780D6    lea         ecx,[ebp-100]
 006780DC    mov         edx,1
 006780E1    mov         eax,esi
 006780E3    call        TMathsFunction.sp
 006780E8    mov         eax,dword ptr [ebp-100]
 006780EE    call        @UStrToPWChar
 006780F3    push        eax
 006780F4    call        winmm.PlaySoundW
>006780F9    jmp         0067907E
 006780FE    mov         ebx,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678101    cmp         dword ptr [ebx+8],2;TObjectList.FCount:Integer
>00678105    jl          0067815F
 00678107    push        0
 00678109    mov         edx,1
 0067810E    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678111    call        TList.Get
 00678116    mov         edx,dword ptr ds:[67DB04];TExpression
 0067811C    call        @AsClass
 00678121    xor         ecx,ecx
 00678123    mov         dl,10
 00678125    mov         edi,dword ptr [eax]
 00678127    call        dword ptr [edi+10];TExpression.EvaluateUnits
 0067812A    call        @ROUND
 0067812F    push        eax
 00678130    push        0
 00678132    xor         edx,edx
 00678134    mov         eax,ebx
 00678136    call        TList.Get
 0067813B    mov         edx,dword ptr ds:[67DB04];TExpression
 00678141    call        @AsClass
 00678146    mov         cl,11
 00678148    xor         edx,edx
 0067814A    mov         ebx,dword ptr [eax]
 0067814C    call        dword ptr [ebx+10];TExpression.EvaluateUnits
 0067814F    call        @ROUND
 00678154    push        eax
 00678155    call        kernel32.Beep
>0067815A    jmp         0067907E
 0067815F    push        0FF
 00678161    call        user32.MessageBeep
>00678166    jmp         0067907E
 0067816B    push        40
 0067816D    call        user32.MessageBeep
>00678172    jmp         0067907E
 00678177    push        30
 00678179    call        user32.MessageBeep
>0067817E    jmp         0067907E
 00678183    push        10
 00678185    call        user32.MessageBeep
>0067818A    jmp         0067907E
 0067818F    push        20
 00678191    call        user32.MessageBeep
>00678196    jmp         0067907E
 0067819B    push        0
 0067819D    call        user32.MessageBeep
>006781A2    jmp         0067907E
 006781A7    mov         dword ptr [ebp-48],14
 006781AE    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006781B3    mov         eax,dword ptr [eax]
 006781B5    call        TWinControl.GetHandle
 006781BA    mov         dword ptr [ebp-44],eax
 006781BD    mov         dword ptr [ebp-40],3
 006781C4    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 006781C7    cmp         dword ptr [eax+8],1;TObjectList.FCount:Integer
>006781CB    jl          006781DE
 006781CD    mov         edx,1
 006781D2    mov         eax,esi
 006781D4    call        TMathsFunction.ip
 006781D9    mov         dword ptr [ebp-3C],eax
>006781DC    jmp         006781E5
 006781DE    mov         dword ptr [ebp-3C],5
 006781E5    mov         ebx,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 006781E8    cmp         dword ptr [ebx+8],2;TObjectList.FCount:Integer
>006781EC    jl          0067821A
 006781EE    push        0
 006781F0    mov         edx,1
 006781F5    mov         eax,ebx
 006781F7    call        TList.Get
 006781FC    mov         edx,dword ptr ds:[67DB04];TExpression
 00678202    call        @AsClass
 00678207    xor         ecx,ecx
 00678209    mov         dl,10
 0067820B    mov         ebx,dword ptr [eax]
 0067820D    call        dword ptr [ebx+10];TExpression.EvaluateUnits
 00678210    call        @ROUND
 00678215    mov         dword ptr [ebp-38],eax
>00678218    jmp         0067821F
 0067821A    xor         eax,eax
 0067821C    mov         dword ptr [ebp-38],eax
 0067821F    lea         eax,[ebp-48]
 00678222    push        eax
 00678223    call        user32.FlashWindowEx
>00678228    jmp         0067907E
 0067822D    xor         edx,edx
 0067822F    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678232    call        TList.Get
 00678237    mov         edx,dword ptr ds:[67DB04];TExpression
 0067823D    call        @AsClass
 00678242    lea         edx,[ebp-104]
 00678248    mov         ecx,dword ptr [eax]
 0067824A    call        dword ptr [ecx+0C];TExpression.EvaluateString
 0067824D    mov         edx,dword ptr [ebp-104]
 00678253    mov         eax,[0078D5E4];^gvar_00822CA8:UnicodeString
 00678258    call        @UStrAsg
>0067825D    jmp         0067907E
 00678262    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00678267    mov         eax,dword ptr [eax]
 00678269    call        TCustomForm.Show
>0067826E    jmp         0067907E
 00678273    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00678278    mov         eax,dword ptr [eax]
 0067827A    call        TCustomForm.Hide
>0067827F    jmp         0067907E
 00678284    mov         eax,[0078D590];^Application:TApplication
 00678289    mov         eax,dword ptr [eax]
 0067828B    call        TApplication.Minimize
>00678290    jmp         0067907E
 00678295    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 0067829A    mov         eax,dword ptr [eax]
 0067829C    mov         dl,2
 0067829E    call        TCustomForm.SetWindowState
>006782A3    jmp         0067907E
 006782A8    mov         eax,[0078D590];^Application:TApplication
 006782AD    mov         eax,dword ptr [eax]
 006782AF    call        TApplication.Restore
 006782B4    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006782B9    mov         eax,dword ptr [eax]
 006782BB    xor         edx,edx
 006782BD    call        TCustomForm.SetWindowState
>006782C2    jmp         0067907E
 006782C7    mov         eax,[0078D590];^Application:TApplication
 006782CC    mov         eax,dword ptr [eax]
 006782CE    call        TApplication.Restore
>006782D3    jmp         0067907E
 006782D8    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006782DD    mov         eax,dword ptr [eax]
 006782DF    xor         edx,edx
 006782E1    call        TCustomForm.SetWindowState
>006782E6    jmp         0067907E
 006782EB    xor         edx,edx
 006782ED    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 006782F0    call        TList.Get
 006782F5    mov         edx,dword ptr ds:[67DB04];TExpression
 006782FB    call        @AsClass
 00678300    mov         edx,dword ptr [eax]
 00678302    call        dword ptr [edx+6C];TExpression.Press
 00678305    mov         byte ptr [ebp-15],al
>00678308    jmp         0067907E
 0067830D    xor         edx,edx
 0067830F    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678312    call        TList.Get
 00678317    mov         edx,dword ptr ds:[67DB04];TExpression
 0067831D    call        @AsClass
 00678322    mov         edx,dword ptr [eax]
 00678324    call        dword ptr [edx+70];TExpression.Release
 00678327    mov         byte ptr [ebp-15],al
>0067832A    jmp         0067907E
 0067832F    xor         edx,edx
 00678331    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678334    call        TList.Get
 00678339    mov         edx,dword ptr ds:[67DB04];TExpression
 0067833F    call        @AsClass
 00678344    mov         edx,dword ptr [eax]
 00678346    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 00678349    test        al,al
>0067834B    je          0067836F
 0067834D    xor         edx,edx
 0067834F    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678352    call        TList.Get
 00678357    mov         edx,dword ptr ds:[67DB04];TExpression
 0067835D    call        @AsClass
 00678362    mov         edx,dword ptr [eax]
 00678364    call        dword ptr [edx+70];TExpression.Release
 00678367    mov         byte ptr [ebp-15],al
>0067836A    jmp         0067907E
 0067836F    xor         edx,edx
 00678371    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678374    call        TList.Get
 00678379    mov         edx,dword ptr ds:[67DB04];TExpression
 0067837F    call        @AsClass
 00678384    mov         edx,dword ptr [eax]
 00678386    call        dword ptr [edx+6C];TExpression.Press
 00678389    mov         byte ptr [ebp-15],al
>0067838C    jmp         0067907E
 00678391    push        0
 00678393    xor         edx,edx
 00678395    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678398    call        TList.Get
 0067839D    mov         edx,dword ptr ds:[67DB04];TExpression
 006783A3    call        @AsClass
 006783A8    xor         ecx,ecx
 006783AA    mov         dl,11
 006783AC    mov         ebx,dword ptr [eax]
 006783AE    call        dword ptr [ebx+10];TExpression.EvaluateUnits
 006783B1    add         esp,0FFFFFFF8
 006783B4    fstp        qword ptr [esp]
 006783B7    wait
 006783B8    mov         dl,1
 006783BA    mov         eax,[00679898];EWait
 006783BF    call        EWait.Create;EWait.Create
 006783C4    call        @RaiseExcept
>006783C9    jmp         0067907E
 006783CE    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 006783D1    cmp         dword ptr [eax+8],1;TObjectList.FCount:Integer
>006783D5    jle         006783E9
 006783D7    mov         edx,2
 006783DC    mov         eax,esi
 006783DE    call        TMathsFunction.p
 006783E3    fstp        qword ptr [ebp-20]
 006783E6    wait
>006783E7    jmp         006783F5
 006783E9    xor         eax,eax
 006783EB    mov         dword ptr [ebp-20],eax
 006783EE    mov         dword ptr [ebp-1C],3FF00000
 006783F5    mov         edx,1
 006783FA    mov         eax,esi
 006783FC    call        TMathsFunction.p
 00678401    fadd        qword ptr [ebp-20]
 00678404    add         esp,0FFFFFFF8
 00678407    fstp        qword ptr [esp]
 0067840A    wait
 0067840B    xor         edx,edx
 0067840D    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678410    call        TList.Get
 00678415    mov         edx,dword ptr ds:[67DB04];TExpression
 0067841B    call        @AsClass
 00678420    mov         edx,dword ptr [eax]
 00678422    call        dword ptr [edx+58];TExpression.SetValue
 00678425    mov         byte ptr [ebp-15],al
>00678428    jmp         0067907E
 0067842D    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678430    cmp         dword ptr [eax+8],1;TObjectList.FCount:Integer
>00678434    jle         00678448
 00678436    mov         edx,2
 0067843B    mov         eax,esi
 0067843D    call        TMathsFunction.p
 00678442    fstp        qword ptr [ebp-20]
 00678445    wait
>00678446    jmp         00678454
 00678448    xor         eax,eax
 0067844A    mov         dword ptr [ebp-20],eax
 0067844D    mov         dword ptr [ebp-1C],3FF00000
 00678454    mov         edx,1
 00678459    mov         eax,esi
 0067845B    call        TMathsFunction.p
 00678460    fsub        qword ptr [ebp-20]
 00678463    add         esp,0FFFFFFF8
 00678466    fstp        qword ptr [esp]
 00678469    wait
 0067846A    xor         edx,edx
 0067846C    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 0067846F    call        TList.Get
 00678474    mov         edx,dword ptr ds:[67DB04];TExpression
 0067847A    call        @AsClass
 0067847F    mov         edx,dword ptr [eax]
 00678481    call        dword ptr [edx+58];TExpression.SetValue
 00678484    mov         byte ptr [ebp-15],al
>00678487    jmp         0067907E
 0067848C    lea         ecx,[ebp-108]
 00678492    mov         edx,1
 00678497    mov         eax,esi
 00678499    call        TMathsFunction.sp
 0067849E    mov         eax,dword ptr [ebp-108]
 006784A4    call        006007EC
>006784A9    jmp         0067907E
 006784AE    lea         ecx,[ebp-110]
 006784B4    mov         edx,1
 006784B9    mov         eax,esi
 006784BB    call        TMathsFunction.sp
 006784C0    mov         edx,dword ptr [ebp-110]
 006784C6    lea         eax,[ebp-10C]
 006784CC    call        @WStrFromUStr
 006784D1    mov         eax,dword ptr [ebp-10C]
 006784D7    call        0060090C
>006784DC    jmp         0067907E
 006784E1    lea         eax,[ebp-0C]
 006784E4    mov         edx,679594;','
 006784E9    call        @LStrLAsg
 006784EE    lea         eax,[ebp-10]
 006784F1    call        @LStrClr
 006784F6    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 006784F9    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 006784FC    dec         eax
 006784FD    sub         eax,3
>00678500    jl          00678888
 00678506    inc         eax
 00678507    mov         dword ptr [ebp-34],eax
 0067850A    mov         ebx,3
 0067850F    mov         edx,ebx
 00678511    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678514    call        TList.Get
 00678519    mov         edx,dword ptr ds:[67DB04];TExpression
 0067851F    call        @AsClass
 00678524    mov         edx,dword ptr [eax]
 00678526    call        dword ptr [edx+44];TExpression.GetDataType
 00678529    and         eax,7F
 0067852C    cmp         eax,6
>0067852F    ja          0067887E
 00678535    jmp         dword ptr [eax*4+67853C]
 00678535    dd          00678558
 00678535    dd          00678558
 00678535    dd          006785A3
 00678535    dd          006785E8
 00678535    dd          0067862A
 00678535    dd          00678691
 00678535    dd          00678728
 00678558    lea         eax,[ebp-0C]
 0067855B    mov         edx,6795A4;'f'
 00678560    call        @LStrCat
 00678565    mov         edx,ebx
 00678567    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 0067856A    call        TList.Get
 0067856F    mov         edx,dword ptr ds:[67DB04];TExpression
 00678575    call        @AsClass
 0067857A    mov         edx,dword ptr [eax]
 0067857C    call        dword ptr [edx];TExpression.Evaluate
 0067857E    add         esp,0FFFFFFFC
 00678581    fstp        dword ptr [esp]
 00678584    wait
 00678585    lea         eax,[ebp-114]
 0067858B    call        00616010
 00678590    mov         edx,dword ptr [ebp-114]
 00678596    lea         eax,[ebp-10]
 00678599    call        @LStrCat
>0067859E    jmp         0067887E
 006785A3    lea         eax,[ebp-0C]
 006785A6    mov         edx,6795B4;'i'
 006785AB    call        @LStrCat
 006785B0    mov         edx,ebx
 006785B2    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 006785B5    call        TList.Get
 006785BA    mov         edx,dword ptr ds:[67DB04];TExpression
 006785C0    call        @AsClass
 006785C5    mov         edx,dword ptr [eax]
 006785C7    call        dword ptr [edx+8];TExpression.EvaluateInteger
 006785CA    lea         edx,[ebp-118]
 006785D0    call        00615FA4
 006785D5    mov         edx,dword ptr [ebp-118]
 006785DB    lea         eax,[ebp-10]
 006785DE    call        @LStrCat
>006785E3    jmp         0067887E
 006785E8    mov         edx,ebx
 006785EA    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 006785ED    call        TList.Get
 006785F2    mov         edx,dword ptr ds:[67DB04];TExpression
 006785F8    call        @AsClass
 006785FD    mov         edx,dword ptr [eax]
 006785FF    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 00678602    test        al,al
>00678604    je          00678618
 00678606    lea         eax,[ebp-0C]
 00678609    mov         edx,6795C4;'T'
 0067860E    call        @LStrCat
>00678613    jmp         0067887E
 00678618    lea         eax,[ebp-0C]
 0067861B    mov         edx,6795D4;'F'
 00678620    call        @LStrCat
>00678625    jmp         0067887E
 0067862A    lea         eax,[ebp-0C]
 0067862D    mov         edx,6795E4;'s'
 00678632    call        @LStrCat
 00678637    mov         edx,ebx
 00678639    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 0067863C    call        TList.Get
 00678641    mov         edx,dword ptr ds:[67DB04];TExpression
 00678647    call        @AsClass
 0067864C    lea         edx,[ebp-124]
 00678652    mov         ecx,dword ptr [eax]
 00678654    call        dword ptr [ecx+0C];TExpression.EvaluateString
 00678657    mov         edx,dword ptr [ebp-124]
 0067865D    lea         eax,[ebp-120]
 00678663    mov         ecx,0
 00678668    call        @LStrFromUStr
 0067866D    mov         eax,dword ptr [ebp-120]
 00678673    lea         edx,[ebp-11C]
 00678679    call        00615F54
 0067867E    mov         edx,dword ptr [ebp-11C]
 00678684    lea         eax,[ebp-10]
 00678687    call        @LStrCat
>0067868C    jmp         0067887E
 00678691    lea         eax,[ebp-0C]
 00678694    mov         edx,6795F4;'[fff]'
 00678699    call        @LStrCat
 0067869E    lea         eax,[ebp-30]
 006786A1    push        eax
 006786A2    mov         edx,ebx
 006786A4    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 006786A7    call        TList.Get
 006786AC    mov         edx,dword ptr ds:[67DB04];TExpression
 006786B2    call        @AsClass
 006786B7    lea         ecx,[ebp-28]
 006786BA    lea         edx,[ebp-20]
 006786BD    mov         edi,dword ptr [eax]
 006786BF    call        dword ptr [edi+20];TExpression.EvaluateVector
 006786C2    push        dword ptr [ebp-10]
 006786C5    fld         qword ptr [ebp-20]
 006786C8    add         esp,0FFFFFFFC
 006786CB    fstp        dword ptr [esp]
 006786CE    wait
 006786CF    lea         eax,[ebp-128]
 006786D5    call        00616010
 006786DA    push        dword ptr [ebp-128]
 006786E0    fld         qword ptr [ebp-28]
 006786E3    add         esp,0FFFFFFFC
 006786E6    fstp        dword ptr [esp]
 006786E9    wait
 006786EA    lea         eax,[ebp-12C]
 006786F0    call        00616010
 006786F5    push        dword ptr [ebp-12C]
 006786FB    fld         qword ptr [ebp-30]
 006786FE    add         esp,0FFFFFFFC
 00678701    fstp        dword ptr [esp]
 00678704    wait
 00678705    lea         eax,[ebp-130]
 0067870B    call        00616010
 00678710    push        dword ptr [ebp-130]
 00678716    lea         eax,[ebp-10]
 00678719    mov         edx,4
 0067871E    call        @LStrCatN
>00678723    jmp         0067887E
 00678728    lea         eax,[ebp-0C]
 0067872B    mov         edx,679608;'[[fff][fff][fff]]'
 00678730    call        @LStrCat
 00678735    mov         edx,ebx
 00678737    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 0067873A    call        TList.Get
 0067873F    mov         edx,dword ptr ds:[67DB04];TExpression
 00678745    call        @AsClass
 0067874A    lea         edx,[ebp-90]
 00678750    mov         ecx,dword ptr [eax]
 00678752    call        dword ptr [ecx+40];TExpression.GetRotMat
 00678755    push        dword ptr [ebp-10]
 00678758    fld         qword ptr [ebp-90]
 0067875E    add         esp,0FFFFFFFC
 00678761    fstp        dword ptr [esp]
 00678764    wait
 00678765    lea         eax,[ebp-134]
 0067876B    call        00616010
 00678770    push        dword ptr [ebp-134]
 00678776    fld         qword ptr [ebp-88]
 0067877C    add         esp,0FFFFFFFC
 0067877F    fstp        dword ptr [esp]
 00678782    wait
 00678783    lea         eax,[ebp-138]
 00678789    call        00616010
 0067878E    push        dword ptr [ebp-138]
 00678794    fld         qword ptr [ebp-80]
 00678797    add         esp,0FFFFFFFC
 0067879A    fstp        dword ptr [esp]
 0067879D    wait
 0067879E    lea         eax,[ebp-13C]
 006787A4    call        00616010
 006787A9    push        dword ptr [ebp-13C]
 006787AF    lea         eax,[ebp-10]
 006787B2    mov         edx,4
 006787B7    call        @LStrCatN
 006787BC    push        dword ptr [ebp-10]
 006787BF    fld         qword ptr [ebp-78]
 006787C2    add         esp,0FFFFFFFC
 006787C5    fstp        dword ptr [esp]
 006787C8    wait
 006787C9    lea         eax,[ebp-140]
 006787CF    call        00616010
 006787D4    push        dword ptr [ebp-140]
 006787DA    fld         qword ptr [ebp-70]
 006787DD    add         esp,0FFFFFFFC
 006787E0    fstp        dword ptr [esp]
 006787E3    wait
 006787E4    lea         eax,[ebp-144]
 006787EA    call        00616010
 006787EF    push        dword ptr [ebp-144]
 006787F5    fld         qword ptr [ebp-68]
 006787F8    add         esp,0FFFFFFFC
 006787FB    fstp        dword ptr [esp]
 006787FE    wait
 006787FF    lea         eax,[ebp-148]
 00678805    call        00616010
 0067880A    push        dword ptr [ebp-148]
 00678810    lea         eax,[ebp-10]
 00678813    mov         edx,4
 00678818    call        @LStrCatN
 0067881D    push        dword ptr [ebp-10]
 00678820    fld         qword ptr [ebp-60]
 00678823    add         esp,0FFFFFFFC
 00678826    fstp        dword ptr [esp]
 00678829    wait
 0067882A    lea         eax,[ebp-14C]
 00678830    call        00616010
 00678835    push        dword ptr [ebp-14C]
 0067883B    fld         qword ptr [ebp-58]
 0067883E    add         esp,0FFFFFFFC
 00678841    fstp        dword ptr [esp]
 00678844    wait
 00678845    lea         eax,[ebp-150]
 0067884B    call        00616010
 00678850    push        dword ptr [ebp-150]
 00678856    fld         qword ptr [ebp-50]
 00678859    add         esp,0FFFFFFFC
 0067885C    fstp        dword ptr [esp]
 0067885F    wait
 00678860    lea         eax,[ebp-154]
 00678866    call        00616010
 0067886B    push        dword ptr [ebp-154]
 00678871    lea         eax,[ebp-10]
 00678874    mov         edx,4
 00678879    call        @LStrCatN
 0067887E    inc         ebx
 0067887F    dec         dword ptr [ebp-34]
>00678882    jne         0067850F
 00678888    lea         ecx,[ebp-8]
 0067888B    mov         edx,3
 00678890    mov         eax,esi
 00678892    call        TMathsFunction.sp
 00678897    lea         eax,[ebp-158]
 0067889D    push        eax
 0067889E    mov         ecx,1
 006788A3    mov         edx,1
 006788A8    mov         eax,dword ptr [ebp-8]
 006788AB    call        @UStrCopy
 006788B0    mov         eax,dword ptr [ebp-158]
 006788B6    mov         edx,679628;'/'
 006788BB    call        @UStrEqual
>006788C0    je          00678901
 006788C2    mov         edx,dword ptr [ebp-8]
 006788C5    mov         eax,679628;'/'
 006788CA    call        Pos
 006788CF    test        eax,eax
>006788D1    jle         006788E5
 006788D3    lea         eax,[ebp-8]
 006788D6    mov         ecx,dword ptr [ebp-8]
 006788D9    mov         edx,679628;'/'
 006788DE    call        @UStrCat3
>006788E3    jmp         00678901
 006788E5    lea         edx,[ebp-15C]
 006788EB    mov         eax,dword ptr [ebp-8]
 006788EE    call        00615E48
 006788F3    mov         edx,dword ptr [ebp-15C]
 006788F9    lea         eax,[ebp-8]
 006788FC    call        @UStrFromLStr
 00678901    lea         eax,[ebp-164]
 00678907    mov         edx,dword ptr [ebp-8]
 0067890A    mov         ecx,0
 0067890F    call        @LStrFromUStr
 00678914    mov         eax,dword ptr [ebp-164]
 0067891A    lea         edx,[ebp-160]
 00678920    call        00615F54
 00678925    push        dword ptr [ebp-160]
 0067892B    lea         edx,[ebp-168]
 00678931    mov         eax,dword ptr [ebp-0C]
 00678934    call        00615F54
 00678939    push        dword ptr [ebp-168]
 0067893F    push        dword ptr [ebp-10]
 00678942    lea         eax,[ebp-10]
 00678945    mov         edx,3
 0067894A    call        @LStrCatN
 0067894F    mov         ebx,dword ptr [ebp-10]
 00678952    test        ebx,ebx
>00678954    je          0067895B
 00678956    sub         ebx,4
 00678959    mov         ebx,dword ptr [ebx]
 0067895B    push        ebx
 0067895C    lea         eax,[ebp-14]
 0067895F    mov         ecx,1
 00678964    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0067896A    call        @DynArraySetLength
 0067896F    add         esp,4
 00678972    lea         eax,[ebp-10]
 00678975    call        @UniqueStringA
 0067897A    mov         edx,eax
 0067897C    mov         eax,dword ptr [ebp-10]
 0067897F    test        eax,eax
>00678981    je          00678988
 00678983    sub         eax,4
 00678986    mov         eax,dword ptr [eax]
 00678988    mov         ecx,dword ptr [ebp-14]
 0067898B    xchg        ecx,edx
 0067898D    xchg        eax,ecx
 0067898E    call        Move
 00678993    mov         eax,dword ptr [ebp-14]
 00678996    push        eax
 00678997    lea         ecx,[ebp-16C]
 0067899D    mov         edx,1
 006789A2    mov         eax,esi
 006789A4    call        TMathsFunction.sp
 006789A9    mov         eax,dword ptr [ebp-16C]
 006789AF    push        eax
 006789B0    mov         edx,2
 006789B5    mov         eax,esi
 006789B7    call        TMathsFunction.ip
 006789BC    mov         ecx,eax
 006789BE    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006789C3    mov         eax,dword ptr [eax]
 006789C5    mov         eax,dword ptr [eax+500]
 006789CB    pop         edx
 006789CC    mov         ebx,dword ptr [eax]
 006789CE    call        dword ptr [ebx+78]
>006789D1    jmp         0067907E
 006789D6    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 006789D9    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 006789DC    cmp         eax,3
>006789DF    jl          00678A26
 006789E1    mov         edx,3
 006789E6    mov         eax,esi
 006789E8    call        TMathsFunction.ip
 006789ED    push        eax
 006789EE    mov         edx,2
 006789F3    mov         eax,esi
 006789F5    call        TMathsFunction.ip
 006789FA    push        eax
 006789FB    mov         edx,1
 00678A00    mov         eax,esi
 00678A02    call        TMathsFunction.ip
 00678A07    imul        eax,eax,0BA
 00678A0D    mov         edx,dword ptr ds:[78D490];^gvar_0078D490
 00678A13    lea         eax,[edx+eax*8-5D0]
 00678A1A    pop         edx
 00678A1B    pop         ecx
 00678A1C    call        00608F5C
>00678A21    jmp         0067907E
 00678A26    cmp         eax,2
>00678A29    jne         0067907E
 00678A2F    mov         edx,2
 00678A34    mov         eax,esi
 00678A36    call        TMathsFunction.ip
 00678A3B    push        eax
 00678A3C    mov         edx,1
 00678A41    mov         eax,esi
 00678A43    call        TMathsFunction.ip
 00678A48    mov         edx,eax
 00678A4A    mov         eax,[0078D490];^gvar_0078D490
 00678A4F    pop         ecx
 00678A50    call        00608F5C
>00678A55    jmp         0067907E
 00678A5A    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678A5D    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 00678A60    cmp         eax,3
>00678A63    jl          00678AAA
 00678A65    mov         edx,3
 00678A6A    mov         eax,esi
 00678A6C    call        TMathsFunction.ip
 00678A71    push        eax
 00678A72    mov         edx,2
 00678A77    mov         eax,esi
 00678A79    call        TMathsFunction.ip
 00678A7E    push        eax
 00678A7F    mov         edx,1
 00678A84    mov         eax,esi
 00678A86    call        TMathsFunction.ip
 00678A8B    imul        eax,eax,0BA
 00678A91    mov         edx,dword ptr ds:[78D490];^gvar_0078D490
 00678A97    lea         eax,[edx+eax*8-5D0]
 00678A9E    pop         edx
 00678A9F    pop         ecx
 00678AA0    call        00608D50
>00678AA5    jmp         0067907E
 00678AAA    cmp         eax,2
>00678AAD    jne         00678ADA
 00678AAF    mov         edx,2
 00678AB4    mov         eax,esi
 00678AB6    call        TMathsFunction.ip
 00678ABB    push        eax
 00678ABC    mov         edx,1
 00678AC1    mov         eax,esi
 00678AC3    call        TMathsFunction.ip
 00678AC8    mov         edx,eax
 00678ACA    mov         eax,[0078D490];^gvar_0078D490
 00678ACF    pop         ecx
 00678AD0    call        00608D50
>00678AD5    jmp         0067907E
 00678ADA    dec         eax
>00678ADB    jne         00678AFF
 00678ADD    mov         edx,1
 00678AE2    mov         eax,esi
 00678AE4    call        TMathsFunction.ip
 00678AE9    mov         edx,eax
 00678AEB    mov         eax,[0078D490];^gvar_0078D490
 00678AF0    mov         ecx,100
 00678AF5    call        00608D50
>00678AFA    jmp         0067907E
 00678AFF    mov         eax,[0078D490];^gvar_0078D490
 00678B04    mov         ecx,100
 00678B09    xor         edx,edx
 00678B0B    call        00608D50
>00678B10    jmp         0067907E
 00678B15    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678B18    cmp         dword ptr [eax+8],3;TObjectList.FCount:Integer
>00678B1C    jl          0067907E
 00678B22    lea         eax,[ebp-0A6]
 00678B28    xor         ecx,ecx
 00678B2A    mov         edx,16
 00678B2F    call        @FillChar
 00678B34    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678B37    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 00678B3A    sub         eax,2
>00678B3D    jl          00678B60
 00678B3F    inc         eax
 00678B40    mov         dword ptr [ebp-34],eax
 00678B43    mov         ebx,2
 00678B48    lea         edi,[ebp-0A6]
 00678B4E    mov         edx,ebx
 00678B50    mov         eax,esi
 00678B52    call        TMathsFunction.ip
 00678B57    mov         byte ptr [edi],al
 00678B59    inc         ebx
 00678B5A    inc         edi
 00678B5B    dec         dword ptr [ebp-34]
>00678B5E    jne         00678B4E
 00678B60    mov         edx,1
 00678B65    mov         eax,esi
 00678B67    call        TMathsFunction.ip
 00678B6C    lea         edx,[ebp-0A6]
 00678B72    call        0065C7D0
>00678B77    jmp         0067907E
 00678B7C    lea         eax,[ebp-4]
 00678B7F    call        @UStrClr
 00678B84    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678B87    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 00678B8A    test        eax,eax
>00678B8C    jle         00678BCB
 00678B8E    mov         dword ptr [ebp-34],eax
 00678B91    mov         ebx,1
 00678B96    cmp         ebx,1
>00678B99    je          00678BA8
 00678B9B    lea         eax,[ebp-4]
 00678B9E    mov         edx,679638;','
 00678BA3    call        @UStrCat
 00678BA8    lea         ecx,[ebp-170]
 00678BAE    mov         edx,ebx
 00678BB0    mov         eax,esi
 00678BB2    call        TMathsFunction.sp
 00678BB7    mov         edx,dword ptr [ebp-170]
 00678BBD    lea         eax,[ebp-4]
 00678BC0    call        @UStrCat
 00678BC5    inc         ebx
 00678BC6    dec         dword ptr [ebp-34]
>00678BC9    jne         00678B96
 00678BCB    mov         eax,dword ptr [ebp-4]
 00678BCE    call        004FA220
>00678BD3    jmp         0067907E
 00678BD8    lea         eax,[ebp-0C]
 00678BDB    mov         edx,679594;','
 00678BE0    call        @LStrLAsg
 00678BE5    lea         eax,[ebp-10]
 00678BE8    call        @LStrClr
 00678BED    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678BF0    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 00678BF3    dec         eax
 00678BF4    sub         eax,2
>00678BF7    jl          00678F7F
 00678BFD    inc         eax
 00678BFE    mov         dword ptr [ebp-34],eax
 00678C01    mov         ebx,2
 00678C06    mov         edx,ebx
 00678C08    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678C0B    call        TList.Get
 00678C10    mov         edx,dword ptr ds:[67DB04];TExpression
 00678C16    call        @AsClass
 00678C1B    mov         edx,dword ptr [eax]
 00678C1D    call        dword ptr [edx+44];TExpression.GetDataType
 00678C20    and         eax,7F
 00678C23    cmp         eax,6
>00678C26    ja          00678F75
 00678C2C    jmp         dword ptr [eax*4+678C33]
 00678C2C    dd          00678C4F
 00678C2C    dd          00678C4F
 00678C2C    dd          00678C9A
 00678C2C    dd          00678CDF
 00678C2C    dd          00678D21
 00678C2C    dd          00678D88
 00678C2C    dd          00678E1F
 00678C4F    lea         eax,[ebp-0C]
 00678C52    mov         edx,6795A4;'f'
 00678C57    call        @LStrCat
 00678C5C    mov         edx,ebx
 00678C5E    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678C61    call        TList.Get
 00678C66    mov         edx,dword ptr ds:[67DB04];TExpression
 00678C6C    call        @AsClass
 00678C71    mov         edx,dword ptr [eax]
 00678C73    call        dword ptr [edx];TExpression.Evaluate
 00678C75    add         esp,0FFFFFFFC
 00678C78    fstp        dword ptr [esp]
 00678C7B    wait
 00678C7C    lea         eax,[ebp-174]
 00678C82    call        00616010
 00678C87    mov         edx,dword ptr [ebp-174]
 00678C8D    lea         eax,[ebp-10]
 00678C90    call        @LStrCat
>00678C95    jmp         00678F75
 00678C9A    lea         eax,[ebp-0C]
 00678C9D    mov         edx,6795B4;'i'
 00678CA2    call        @LStrCat
 00678CA7    mov         edx,ebx
 00678CA9    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678CAC    call        TList.Get
 00678CB1    mov         edx,dword ptr ds:[67DB04];TExpression
 00678CB7    call        @AsClass
 00678CBC    mov         edx,dword ptr [eax]
 00678CBE    call        dword ptr [edx+8];TExpression.EvaluateInteger
 00678CC1    lea         edx,[ebp-178]
 00678CC7    call        00615FA4
 00678CCC    mov         edx,dword ptr [ebp-178]
 00678CD2    lea         eax,[ebp-10]
 00678CD5    call        @LStrCat
>00678CDA    jmp         00678F75
 00678CDF    mov         edx,ebx
 00678CE1    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678CE4    call        TList.Get
 00678CE9    mov         edx,dword ptr ds:[67DB04];TExpression
 00678CEF    call        @AsClass
 00678CF4    mov         edx,dword ptr [eax]
 00678CF6    call        dword ptr [edx+4];TExpression.EvaluateBoolean
 00678CF9    test        al,al
>00678CFB    je          00678D0F
 00678CFD    lea         eax,[ebp-0C]
 00678D00    mov         edx,6795C4;'T'
 00678D05    call        @LStrCat
>00678D0A    jmp         00678F75
 00678D0F    lea         eax,[ebp-0C]
 00678D12    mov         edx,6795D4;'F'
 00678D17    call        @LStrCat
>00678D1C    jmp         00678F75
 00678D21    lea         eax,[ebp-0C]
 00678D24    mov         edx,6795E4;'s'
 00678D29    call        @LStrCat
 00678D2E    mov         edx,ebx
 00678D30    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678D33    call        TList.Get
 00678D38    mov         edx,dword ptr ds:[67DB04];TExpression
 00678D3E    call        @AsClass
 00678D43    lea         edx,[ebp-184]
 00678D49    mov         ecx,dword ptr [eax]
 00678D4B    call        dword ptr [ecx+0C];TExpression.EvaluateString
 00678D4E    mov         edx,dword ptr [ebp-184]
 00678D54    lea         eax,[ebp-180]
 00678D5A    mov         ecx,0
 00678D5F    call        @LStrFromUStr
 00678D64    mov         eax,dword ptr [ebp-180]
 00678D6A    lea         edx,[ebp-17C]
 00678D70    call        00615F54
 00678D75    mov         edx,dword ptr [ebp-17C]
 00678D7B    lea         eax,[ebp-10]
 00678D7E    call        @LStrCat
>00678D83    jmp         00678F75
 00678D88    lea         eax,[ebp-0C]
 00678D8B    mov         edx,6795F4;'[fff]'
 00678D90    call        @LStrCat
 00678D95    lea         eax,[ebp-30]
 00678D98    push        eax
 00678D99    mov         edx,ebx
 00678D9B    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678D9E    call        TList.Get
 00678DA3    mov         edx,dword ptr ds:[67DB04];TExpression
 00678DA9    call        @AsClass
 00678DAE    lea         ecx,[ebp-28]
 00678DB1    lea         edx,[ebp-20]
 00678DB4    mov         edi,dword ptr [eax]
 00678DB6    call        dword ptr [edi+20];TExpression.EvaluateVector
 00678DB9    push        dword ptr [ebp-10]
 00678DBC    fld         qword ptr [ebp-20]
 00678DBF    add         esp,0FFFFFFFC
 00678DC2    fstp        dword ptr [esp]
 00678DC5    wait
 00678DC6    lea         eax,[ebp-188]
 00678DCC    call        00616010
 00678DD1    push        dword ptr [ebp-188]
 00678DD7    fld         qword ptr [ebp-28]
 00678DDA    add         esp,0FFFFFFFC
 00678DDD    fstp        dword ptr [esp]
 00678DE0    wait
 00678DE1    lea         eax,[ebp-18C]
 00678DE7    call        00616010
 00678DEC    push        dword ptr [ebp-18C]
 00678DF2    fld         qword ptr [ebp-30]
 00678DF5    add         esp,0FFFFFFFC
 00678DF8    fstp        dword ptr [esp]
 00678DFB    wait
 00678DFC    lea         eax,[ebp-190]
 00678E02    call        00616010
 00678E07    push        dword ptr [ebp-190]
 00678E0D    lea         eax,[ebp-10]
 00678E10    mov         edx,4
 00678E15    call        @LStrCatN
>00678E1A    jmp         00678F75
 00678E1F    lea         eax,[ebp-0C]
 00678E22    mov         edx,679608;'[[fff][fff][fff]]'
 00678E27    call        @LStrCat
 00678E2C    mov         edx,ebx
 00678E2E    mov         eax,dword ptr [esi+18];TProcedureExpression.Parameters:TObjectList
 00678E31    call        TList.Get
 00678E36    mov         edx,dword ptr ds:[67DB04];TExpression
 00678E3C    call        @AsClass
 00678E41    lea         edx,[ebp-90]
 00678E47    mov         ecx,dword ptr [eax]
 00678E49    call        dword ptr [ecx+40];TExpression.GetRotMat
 00678E4C    push        dword ptr [ebp-10]
 00678E4F    fld         qword ptr [ebp-90]
 00678E55    add         esp,0FFFFFFFC
 00678E58    fstp        dword ptr [esp]
 00678E5B    wait
 00678E5C    lea         eax,[ebp-194]
 00678E62    call        00616010
 00678E67    push        dword ptr [ebp-194]
 00678E6D    fld         qword ptr [ebp-88]
 00678E73    add         esp,0FFFFFFFC
 00678E76    fstp        dword ptr [esp]
 00678E79    wait
 00678E7A    lea         eax,[ebp-198]
 00678E80    call        00616010
 00678E85    push        dword ptr [ebp-198]
 00678E8B    fld         qword ptr [ebp-80]
 00678E8E    add         esp,0FFFFFFFC
 00678E91    fstp        dword ptr [esp]
 00678E94    wait
 00678E95    lea         eax,[ebp-19C]
 00678E9B    call        00616010
 00678EA0    push        dword ptr [ebp-19C]
 00678EA6    lea         eax,[ebp-10]
 00678EA9    mov         edx,4
 00678EAE    call        @LStrCatN
 00678EB3    push        dword ptr [ebp-10]
 00678EB6    fld         qword ptr [ebp-78]
 00678EB9    add         esp,0FFFFFFFC
 00678EBC    fstp        dword ptr [esp]
 00678EBF    wait
 00678EC0    lea         eax,[ebp-1A0]
 00678EC6    call        00616010
 00678ECB    push        dword ptr [ebp-1A0]
 00678ED1    fld         qword ptr [ebp-70]
 00678ED4    add         esp,0FFFFFFFC
 00678ED7    fstp        dword ptr [esp]
 00678EDA    wait
 00678EDB    lea         eax,[ebp-1A4]
 00678EE1    call        00616010
 00678EE6    push        dword ptr [ebp-1A4]
 00678EEC    fld         qword ptr [ebp-68]
 00678EEF    add         esp,0FFFFFFFC
 00678EF2    fstp        dword ptr [esp]
 00678EF5    wait
 00678EF6    lea         eax,[ebp-1A8]
 00678EFC    call        00616010
 00678F01    push        dword ptr [ebp-1A8]
 00678F07    lea         eax,[ebp-10]
 00678F0A    mov         edx,4
 00678F0F    call        @LStrCatN
 00678F14    push        dword ptr [ebp-10]
 00678F17    fld         qword ptr [ebp-60]
 00678F1A    add         esp,0FFFFFFFC
 00678F1D    fstp        dword ptr [esp]
 00678F20    wait
 00678F21    lea         eax,[ebp-1AC]
 00678F27    call        00616010
 00678F2C    push        dword ptr [ebp-1AC]
 00678F32    fld         qword ptr [ebp-58]
 00678F35    add         esp,0FFFFFFFC
 00678F38    fstp        dword ptr [esp]
 00678F3B    wait
 00678F3C    lea         eax,[ebp-1B0]
 00678F42    call        00616010
 00678F47    push        dword ptr [ebp-1B0]
 00678F4D    fld         qword ptr [ebp-50]
 00678F50    add         esp,0FFFFFFFC
 00678F53    fstp        dword ptr [esp]
 00678F56    wait
 00678F57    lea         eax,[ebp-1B4]
 00678F5D    call        00616010
 00678F62    push        dword ptr [ebp-1B4]
 00678F68    lea         eax,[ebp-10]
 00678F6B    mov         edx,4
 00678F70    call        @LStrCatN
 00678F75    inc         ebx
 00678F76    dec         dword ptr [ebp-34]
>00678F79    jne         00678C06
 00678F7F    lea         ecx,[ebp-8]
 00678F82    mov         edx,2
 00678F87    mov         eax,esi
 00678F89    call        TMathsFunction.sp
 00678F8E    lea         eax,[ebp-1B8]
 00678F94    push        eax
 00678F95    mov         ecx,1
 00678F9A    mov         edx,1
 00678F9F    mov         eax,dword ptr [ebp-8]
 00678FA2    call        @UStrCopy
 00678FA7    mov         eax,dword ptr [ebp-1B8]
 00678FAD    mov         edx,679628;'/'
 00678FB2    call        @UStrEqual
>00678FB7    je          00678FF8
 00678FB9    mov         edx,dword ptr [ebp-8]
 00678FBC    mov         eax,679628;'/'
 00678FC1    call        Pos
 00678FC6    test        eax,eax
>00678FC8    jle         00678FDC
 00678FCA    lea         eax,[ebp-8]
 00678FCD    mov         ecx,dword ptr [ebp-8]
 00678FD0    mov         edx,679628;'/'
 00678FD5    call        @UStrCat3
>00678FDA    jmp         00678FF8
 00678FDC    lea         edx,[ebp-1BC]
 00678FE2    mov         eax,dword ptr [ebp-8]
 00678FE5    call        00615E48
 00678FEA    mov         edx,dword ptr [ebp-1BC]
 00678FF0    lea         eax,[ebp-8]
 00678FF3    call        @UStrFromLStr
 00678FF8    lea         eax,[ebp-1C4]
 00678FFE    mov         edx,dword ptr [ebp-8]
 00679001    mov         ecx,0
 00679006    call        @LStrFromUStr
 0067900B    mov         eax,dword ptr [ebp-1C4]
 00679011    lea         edx,[ebp-1C0]
 00679017    call        00615F54
 0067901C    push        dword ptr [ebp-1C0]
 00679022    lea         edx,[ebp-1C8]
 00679028    mov         eax,dword ptr [ebp-0C]
 0067902B    call        00615F54
 00679030    push        dword ptr [ebp-1C8]
 00679036    push        dword ptr [ebp-10]
 00679039    lea         eax,[ebp-10]
 0067903C    mov         edx,3
 00679041    call        @LStrCatN
 00679046    push        0
 00679048    push        0
 0067904A    mov         edx,1
 0067904F    mov         eax,esi
 00679051    call        TMathsFunction.ip
 00679056    push        eax
 00679057    lea         eax,[ebp-1CC]
 0067905D    mov         edx,dword ptr [ebp-10]
 00679060    call        @UStrFromLStr
 00679065    mov         edx,dword ptr [ebp-1CC]
 0067906B    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 00679070    mov         eax,dword ptr [eax]
 00679072    mov         eax,dword ptr [eax+500]
 00679078    pop         ecx
 00679079    call        TIdUDPBase.Broadcast
 0067907E    xor         eax,eax
 00679080    pop         edx
 00679081    pop         ecx
 00679082    pop         ecx
 00679083    mov         dword ptr fs:[eax],edx
 00679086    push        6791CD
 0067908B    lea         eax,[ebp-1CC]
 00679091    call        @UStrClr
 00679096    lea         eax,[ebp-1C8]
 0067909C    call        @LStrClr
 006790A1    lea         eax,[ebp-1C4]
 006790A7    call        @LStrClr
 006790AC    lea         eax,[ebp-1C0]
 006790B2    mov         edx,2
 006790B7    call        @LStrArrayClr
 006790BC    lea         eax,[ebp-1B8]
 006790C2    call        @UStrClr
 006790C7    lea         eax,[ebp-1B4]
 006790CD    mov         edx,0C
 006790D2    call        @LStrArrayClr
 006790D7    lea         eax,[ebp-184]
 006790DD    call        @UStrClr
 006790E2    lea         eax,[ebp-180]
 006790E8    call        @LStrClr
 006790ED    lea         eax,[ebp-17C]
 006790F3    mov         edx,3
 006790F8    call        @LStrArrayClr
 006790FD    lea         eax,[ebp-170]
 00679103    mov         edx,2
 00679108    call        @UStrArrayClr
 0067910D    lea         eax,[ebp-168]
 00679113    call        @LStrClr
 00679118    lea         eax,[ebp-164]
 0067911E    call        @LStrClr
 00679123    lea         eax,[ebp-160]
 00679129    mov         edx,2
 0067912E    call        @LStrArrayClr
 00679133    lea         eax,[ebp-158]
 00679139    call        @UStrClr
 0067913E    lea         eax,[ebp-154]
 00679144    mov         edx,0C
 00679149    call        @LStrArrayClr
 0067914E    lea         eax,[ebp-124]
 00679154    call        @UStrClr
 00679159    lea         eax,[ebp-120]
 0067915F    call        @LStrClr
 00679164    lea         eax,[ebp-11C]
 0067916A    mov         edx,3
 0067916F    call        @LStrArrayClr
 00679174    lea         eax,[ebp-110]
 0067917A    call        @UStrClr
 0067917F    lea         eax,[ebp-10C]
 00679185    call        @WStrClr
 0067918A    lea         eax,[ebp-108]
 00679190    mov         edx,18
 00679195    call        @UStrArrayClr
 0067919A    lea         eax,[ebp-14]
 0067919D    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 006791A3    call        @DynArrayClear
 006791A8    lea         eax,[ebp-10]
 006791AB    mov         edx,2
 006791B0    call        @LStrArrayClr
 006791B5    lea         eax,[ebp-8]
 006791B8    mov         edx,2
 006791BD    call        @UStrArrayClr
 006791C2    ret
>006791C3    jmp         @HandleFinally
>006791C8    jmp         0067908B
 006791CD    movzx       eax,byte ptr [ebp-15]
 006791D1    pop         edi
 006791D2    pop         esi
 006791D3    pop         ebx
 006791D4    mov         esp,ebp
 006791D6    pop         ebp
 006791D7    ret
*}
end;

//0067963C
procedure TProcedureExpression.FillClone(c:TExpression);
begin
{*
 0067963C    call        TMathsFunction.FillClone
 00679641    ret
*}
end;

//00679644
function TProcedureExpression.GetDataType:TDataType;
begin
{*
 00679644    mov         al,3
 00679646    ret
*}
end;

//00679648
{*procedure TProcedureExpression.GetString(?:?);
begin
 00679648    push        ebx
 00679649    push        esi
 0067964A    mov         esi,edx
 0067964C    mov         ebx,eax
 0067964E    xor         edx,edx
 00679650    mov         eax,ebx
 00679652    mov         ecx,dword ptr [eax]
 00679654    call        dword ptr [ecx+98];TProcedureExpression.Execute
 0067965A    mov         ecx,esi
 0067965C    mov         dl,1
 0067965E    call        BoolToStr
 00679663    pop         esi
 00679664    pop         ebx
 00679665    ret
end;*}

//00679668
procedure TProcedureExpression.GetValue;
begin
{*
 00679668    push        ebx
 00679669    add         esp,0FFFFFFF8
 0067966C    mov         ebx,eax
 0067966E    xor         edx,edx
 00679670    mov         eax,ebx
 00679672    mov         ecx,dword ptr [eax]
 00679674    call        dword ptr [ecx+98];TProcedureExpression.Execute
 0067967A    call        00686074
 0067967F    fstp        qword ptr [esp]
 00679682    wait
 00679683    fld         qword ptr [esp]
 00679686    pop         ecx
 00679687    pop         edx
 00679688    pop         ebx
 00679689    ret
*}
end;

//0067968C
{*function TProcedureExpression.SetValue(NewValue:Double; ?:?):Boolean;
begin
 0067968C    push        ebp
 0067968D    mov         ebp,esp
 0067968F    push        ecx
 00679690    push        ebx
 00679691    push        esi
 00679692    mov         esi,eax
 00679694    mov         byte ptr [ebp-1],1
 00679698    push        dword ptr [ebp+0C]
 0067969B    push        dword ptr [ebp+8]
 0067969E    call        00686060
 006796A3    mov         ebx,eax
 006796A5    push        dword ptr [esi+0C];TProcedureExpression.?fC:dword
 006796A8    push        dword ptr [esi+8];TProcedureExpression.PreviousValue:Double
 006796AB    call        00686060
 006796B0    cmp         bl,al
>006796B2    jne         006796C7
 006796B4    cmp         byte ptr [esi+10],0;TProcedureExpression.Iffy:Boolean
>006796B8    jne         006796C7
 006796BA    mov         eax,ebx
 006796BC    call        00686074
 006796C1    fstp        qword ptr [esi+8];TProcedureExpression.PreviousValue:Double
 006796C4    wait
>006796C5    jmp         006796E5
 006796C7    mov         eax,ebx
 006796C9    call        00686074
 006796CE    fstp        qword ptr [esi+8];TProcedureExpression.PreviousValue:Double
 006796D1    wait
 006796D2    test        bl,bl
>006796D4    je          006796E5
 006796D6    xor         edx,edx
 006796D8    mov         eax,esi
 006796DA    mov         ecx,dword ptr [eax]
 006796DC    call        dword ptr [ecx+98];TProcedureExpression.Execute
 006796E2    mov         byte ptr [ebp-1],al
 006796E5    movzx       eax,byte ptr [ebp-1]
 006796E9    pop         esi
 006796EA    pop         ebx
 006796EB    pop         ecx
 006796EC    pop         ebp
 006796ED    ret         8
end;*}

//006796F0
{*procedure TProcedureExpression.ToString(?:?);
begin
 006796F0    push        ebp
 006796F1    mov         ebp,esp
 006796F3    push        0
 006796F5    push        0
 006796F7    push        0
 006796F9    push        ebx
 006796FA    push        esi
 006796FB    push        edi
 006796FC    mov         ebx,edx
 006796FE    mov         edi,eax
 00679700    xor         eax,eax
 00679702    push        ebp
 00679703    push        6797A4
 00679708    push        dword ptr fs:[eax]
 0067970B    mov         dword ptr fs:[eax],esp
 0067970E    lea         edx,[ebp-8]
 00679711    mov         eax,dword ptr [edi+1C];TProcedureExpression.FunctionNumber:Integer
 00679714    call        0067065C
 00679719    mov         edx,dword ptr [ebp-8]
 0067971C    mov         eax,ebx
 0067971E    mov         ecx,6797C0;'('
 00679723    call        @UStrCat3
 00679728    mov         eax,dword ptr [edi+18];TProcedureExpression.Parameters:TObjectList
 0067972B    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 0067972E    dec         eax
 0067972F    test        eax,eax
>00679731    jl          0067977D
 00679733    inc         eax
 00679734    mov         dword ptr [ebp-4],eax
 00679737    xor         esi,esi
 00679739    mov         eax,dword ptr [edi+18];TProcedureExpression.Parameters:TObjectList
 0067973C    mov         edx,esi
 0067973E    call        TList.Get
 00679743    mov         edx,dword ptr ds:[67DB04];TExpression
 00679749    call        @AsClass
 0067974E    lea         edx,[ebp-0C]
 00679751    mov         ecx,dword ptr [eax]
 00679753    call        dword ptr [ecx-24];TExpression.ToString
 00679756    mov         edx,dword ptr [ebp-0C]
 00679759    mov         eax,ebx
 0067975B    call        @UStrCat
 00679760    mov         eax,dword ptr [edi+18];TProcedureExpression.Parameters:TObjectList
 00679763    mov         eax,dword ptr [eax+8];TObjectList.FCount:Integer
 00679766    dec         eax
 00679767    cmp         esi,eax
>00679769    je          00679777
 0067976B    mov         eax,ebx
 0067976D    mov         edx,6797D0;', '
 00679772    call        @UStrCat
 00679777    inc         esi
 00679778    dec         dword ptr [ebp-4]
>0067977B    jne         00679739
 0067977D    mov         eax,ebx
 0067977F    mov         edx,6797E4;')'
 00679784    call        @UStrCat
 00679789    xor         eax,eax
 0067978B    pop         edx
 0067978C    pop         ecx
 0067978D    pop         ecx
 0067978E    mov         dword ptr fs:[eax],edx
 00679791    push        6797AB
 00679796    lea         eax,[ebp-0C]
 00679799    mov         edx,2
 0067979E    call        @UStrArrayClr
 006797A3    ret
>006797A4    jmp         @HandleFinally
>006797A9    jmp         00679796
 006797AB    pop         edi
 006797AC    pop         esi
 006797AD    pop         ebx
 006797AE    mov         esp,ebp
 006797B0    pop         ebp
 006797B1    ret
end;*}

Initialization
//00781E80
{*
 00781E80    push        ebp
 00781E81    mov         ebp,esp
 00781E83    push        ebx
 00781E84    push        esi
 00781E85    push        edi
 00781E86    sub         dword ptr ds:[81ECD8],1
>00781E8D    jae         00781EF8
 00781E8F    xor         edx,edx
 00781E91    push        ebp
 00781E92    push        781EDD
 00781E97    push        dword ptr fs:[edx]
 00781E9A    mov         dword ptr fs:[edx],esp
 00781E9D    mov         eax,781F0C;'Initializing PieFunction'
 00781EA2    call        004FA5FC
 00781EA7    mov         dl,1
 00781EA9    mov         eax,[0067D4A4];THashTable
 00781EAE    call        THashTable.Create;THashTable.Create
 00781EB3    mov         [0081ECD0],eax;gvar_0081ECD0:THashTable
 00781EB8    mov         dl,1
 00781EBA    mov         eax,[0067D4A4];THashTable
 00781EBF    call        THashTable.Create;THashTable.Create
 00781EC4    mov         [0081ECD4],eax;gvar_0081ECD4:THashTable
 00781EC9    call        00673E34
 00781ECE    call        00673308
 00781ED3    xor         eax,eax
 00781ED5    pop         edx
 00781ED6    pop         ecx
 00781ED7    pop         ecx
 00781ED8    mov         dword ptr fs:[eax],edx
>00781EDB    jmp         00781EF8
>00781EDD    jmp         @HandleOnException
 00781EE2    dd          1
 00781EE6    dd          00418C04;Exception
 00781EEA    dd          00781EEE
 00781EEE    call        004FA644
 00781EF3    call        @DoneExcept
 00781EF8    pop         edi
 00781EF9    pop         esi
 00781EFA    pop         ebx
 00781EFB    pop         ebp
 00781EFC    ret
*}
Finalization
//006797E8
{*
 006797E8    push        ebp
 006797E9    mov         ebp,esp
 006797EB    push        ebx
 006797EC    push        esi
 006797ED    push        edi
 006797EE    inc         dword ptr ds:[81ECD8]
>006797F4    jne         00679857
 006797F6    xor         edx,edx
 006797F8    push        ebp
 006797F9    push        67983C
 006797FE    push        dword ptr fs:[edx]
 00679801    mov         dword ptr fs:[edx],esp
 00679804    mov         eax,679868;'Finalizing PieFunction'
 00679809    call        004FA5FC
 0067980E    mov         eax,[0081ECD0];gvar_0081ECD0:THashTable
 00679813    xor         edx,edx
 00679815    mov         dword ptr ds:[81ECD0],edx;gvar_0081ECD0:THashTable
 0067981B    call        TObject.Free
 00679820    mov         eax,[0081ECD4];gvar_0081ECD4:THashTable
 00679825    xor         edx,edx
 00679827    mov         dword ptr ds:[81ECD4],edx;gvar_0081ECD4:THashTable
 0067982D    call        TObject.Free
 00679832    xor         eax,eax
 00679834    pop         edx
 00679835    pop         ecx
 00679836    pop         ecx
 00679837    mov         dword ptr fs:[eax],edx
>0067983A    jmp         00679857
>0067983C    jmp         @HandleOnException
 00679841    dd          1
 00679845    dd          00418C04;Exception
 00679849    dd          0067984D
 0067984D    call        004FA644
 00679852    call        @DoneExcept
 00679857    pop         edi
 00679858    pop         esi
 00679859    pop         ebx
 0067985A    pop         ebp
 0067985B    ret
*}
end.