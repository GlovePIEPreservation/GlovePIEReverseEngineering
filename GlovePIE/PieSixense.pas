//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieSixense;

interface

uses
  SysUtils, Classes;

type
  TSixenseValue = class(TObjectValue)
  published
    function GetUnits:TUnits;//0076B0B4
    //procedure GetString(?:?);//0076B08C
    procedure FillClone(c:TExpression);//0076B03C
    function Module:TObject;//0076B11C
    function GetPerUnits2:TUnits;//0076B07C
    function GetPerUnits1:TUnits;//0076B06C
    procedure SetValue(NewValue:Double);//0076B124
    function CanSet:Boolean;//0076B028
    function GetDataType:TDataType;//0076B05C
    procedure CreateClone;//0076B02C
    procedure GetValue;//0076B0C4
    //procedure ToString(?:?);//0076B14C
  public
    ......................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//0076B14C
    procedure GetValue; virtual;//v2C//0076B0C4
    //procedure GetString(?:?); virtual;//v38//0076B08C
    function GetDataType:TDataType; virtual;//v44//0076B05C
    function GetUnits:TUnits; virtual;//v48//0076B0B4
    function GetPerUnits1:TUnits; virtual;//v4C//0076B06C
    function GetPerUnits2:TUnits; virtual;//v50//0076B07C
    procedure SetValue(NewValue:Double); virtual;//v58//0076B124
    function CanSet:Boolean; virtual;//v68//0076B028
    procedure CreateClone; virtual;//v80//0076B02C
    procedure FillClone(c:TExpression); virtual;//v84//0076B03C
    function Module:TObject; virtual;//v98//0076B11C
  end;
  TModuleSixense = class(TPieModule)
  published
    procedure Read;//0076B490
    procedure ClearRead;//0076B354
    function CreateValue(Identifier:string):TExpression;//0076B3BC
    function GetDefaultFormat(field:string):TGuiFormat;//0076B410
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//0076B474
    procedure GetGoodFields;//0076B46C
    procedure StartCompiletime;//0076B498
    procedure StopRuntime;//0076B4C4
    procedure StartRuntime;//0076B4A4
    procedure AddFields;//0076B31C
    constructor Create;//0076B35C
    procedure StopCompiletime;//0076B4B0
  public
    function CreateValue(Identifier:string):TExpression; virtual;//v14//0076B3BC
    procedure GetGoodFields; virtual;//v1C//0076B46C
    procedure AddFields; virtual;//v24//0076B31C
    procedure StartCompiletime; virtual;//v28//0076B498
    procedure StopCompiletime; virtual;//v2C//0076B4B0
    procedure StartRuntime; virtual;//v30//0076B4A4
    procedure StopRuntime; virtual;//v34//0076B4C4
    procedure ClearRead; virtual;//v38//0076B354
    procedure Read; virtual;//v3C//0076B490
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//0076B474
    function GetDefaultFormat(field:string):TGuiFormat; virtual;//v44//0076B410
  end;
    //function sub_0076AF3C(?:string):?;//0076AF3C
    procedure sub_0076B234;//0076B234
    procedure sub_0076B23C;//0076B23C
    procedure sub_0076B240;//0076B240
    procedure sub_0076B254;//0076B254
    //function sub_0076B26C:?;//0076B26C
    //function sub_0076B270(?:UnicodeString):?;//0076B270
    //procedure sub_0076B2C4(?:Integer; ?:?);//0076B2C4
    //function sub_0076B2E0:?;//0076B2E0

implementation

//0076AF3C
{*function sub_0076AF3C(?:string):?;
begin
 0076AF3C    push        ebp
 0076AF3D    mov         ebp,esp
 0076AF3F    add         esp,0FFFFFFF8
 0076AF42    push        ebx
 0076AF43    push        esi
 0076AF44    push        edi
 0076AF45    xor         edx,edx
 0076AF47    mov         dword ptr [ebp-8],edx
 0076AF4A    mov         dword ptr [ebp-4],eax
 0076AF4D    mov         eax,dword ptr [ebp-4]
 0076AF50    call        @UStrAddRef
 0076AF55    xor         eax,eax
 0076AF57    push        ebp
 0076AF58    push        76AFE9
 0076AF5D    push        dword ptr fs:[eax]
 0076AF60    mov         dword ptr fs:[eax],esp
 0076AF63    xor         ebx,ebx
 0076AF65    lea         eax,[ebp-8]
 0076AF68    mov         edx,dword ptr [ebp-4]
 0076AF6B    call        @UStrLAsg
 0076AF70    lea         eax,[ebp-8]
 0076AF73    mov         edx,76B008;'Sixense'
 0076AF78    call        004F9BD0
 0076AF7D    test        al,al
>0076AF7F    je          0076AFCE
 0076AF81    lea         eax,[ebp-8]
 0076AF84    call        004F9D00
 0076AF89    mov         esi,eax
 0076AF8B    lea         eax,[ebp-8]
 0076AF8E    mov         edx,76B024;'.'
 0076AF93    call        004F9BD0
 0076AF98    test        al,al
>0076AF9A    je          0076AFCE
 0076AF9C    mov         eax,dword ptr [ebp-8]
 0076AF9F    call        0076B270
 0076AFA4    mov         edi,eax
 0076AFA6    test        edi,edi
>0076AFA8    jl          0076AFCE
 0076AFAA    mov         dl,1
 0076AFAC    mov         eax,[0076A7B0];TSixenseValue
 0076AFB1    call        TObject.Create;TSixenseValue.Create
 0076AFB6    mov         ebx,eax
 0076AFB8    mov         dword ptr [ebx+20],edi;TSixenseValue........................Item:Integer
 0076AFBB    test        esi,esi
>0076AFBD    jg          0076AFC4
 0076AFBF    mov         esi,1
 0076AFC4    mov         dword ptr [ebx+18],esi;TSixenseValue.......................................................
 0076AFC7    mov         byte ptr ds:[822D60],1;gvar_00822D60
 0076AFCE    xor         eax,eax
 0076AFD0    pop         edx
 0076AFD1    pop         ecx
 0076AFD2    pop         ecx
 0076AFD3    mov         dword ptr fs:[eax],edx
 0076AFD6    push        76AFF0
 0076AFDB    lea         eax,[ebp-8]
 0076AFDE    mov         edx,2
 0076AFE3    call        @UStrArrayClr
 0076AFE8    ret
>0076AFE9    jmp         @HandleFinally
>0076AFEE    jmp         0076AFDB
 0076AFF0    mov         eax,ebx
 0076AFF2    pop         edi
 0076AFF3    pop         esi
 0076AFF4    pop         ebx
 0076AFF5    pop         ecx
 0076AFF6    pop         ecx
 0076AFF7    pop         ebp
 0076AFF8    ret
end;*}

//0076B028
function TSixenseValue.CanSet:Boolean;
begin
{*
 0076B028    xor         eax,eax
 0076B02A    ret
*}
end;

//0076B02C
procedure TSixenseValue.CreateClone;
begin
{*
 0076B02C    mov         dl,1
 0076B02E    mov         eax,[0076A7B0];TSixenseValue
 0076B033    call        TObject.Create;TSixenseValue.Create
 0076B038    ret
*}
end;

//0076B03C
procedure TSixenseValue.FillClone(c:TExpression);
begin
{*
 0076B03C    push        ebx
 0076B03D    push        esi
 0076B03E    mov         esi,edx
 0076B040    mov         ebx,eax
 0076B042    mov         edx,esi
 0076B044    mov         eax,ebx
 0076B046    call        TExpression.FillClone
 0076B04B    mov         eax,esi
 0076B04D    mov         edx,dword ptr [ebx+20];TSixenseValue.........................Item:Integer
 0076B050    mov         dword ptr [eax+20],edx
 0076B053    mov         edx,dword ptr [ebx+18];TSixenseValue.......................................................
 0076B056    mov         dword ptr [eax+18],edx
 0076B059    pop         esi
 0076B05A    pop         ebx
 0076B05B    ret
*}
end;

//0076B05C
function TSixenseValue.GetDataType:TDataType;
begin
{*
 0076B05C    mov         eax,dword ptr [eax+20];TSixenseValue..........................Item:Integer
 0076B05F    sub         eax,1
>0076B062    jae         0076B067
 0076B064    mov         al,3
 0076B066    ret
 0076B067    xor         eax,eax
 0076B069    ret
*}
end;

//0076B06C
function TSixenseValue.GetPerUnits1:TUnits;
begin
{*
 0076B06C    mov         eax,dword ptr [eax+20];TSixenseValue...........................Item:Integer
 0076B06F    sub         eax,1
>0076B072    jae         0076B077
 0076B074    xor         eax,eax
 0076B076    ret
 0076B077    xor         eax,eax
 0076B079    ret
*}
end;

//0076B07C
function TSixenseValue.GetPerUnits2:TUnits;
begin
{*
 0076B07C    mov         eax,dword ptr [eax+20];TSixenseValue............................Item:Integer
 0076B07F    sub         eax,1
>0076B082    jae         0076B087
 0076B084    xor         eax,eax
 0076B086    ret
 0076B087    xor         eax,eax
 0076B089    ret
*}
end;

//0076B08C
{*procedure TSixenseValue.GetString(?:?);
begin
 0076B08C    push        ebx
 0076B08D    push        esi
 0076B08E    mov         esi,edx
 0076B090    mov         ebx,eax
 0076B092    mov         eax,dword ptr [ebx+20];TSixenseValue.............................Item:Integer
 0076B095    sub         eax,1
>0076B098    jae         0076B0A6
 0076B09A    mov         edx,esi
 0076B09C    mov         eax,ebx
 0076B09E    call        TExpression.GetString
 0076B0A3    pop         esi
 0076B0A4    pop         ebx
 0076B0A5    ret
 0076B0A6    mov         edx,esi
 0076B0A8    mov         eax,ebx
 0076B0AA    call        TExpression.GetString
 0076B0AF    pop         esi
 0076B0B0    pop         ebx
 0076B0B1    ret
end;*}

//0076B0B4
function TSixenseValue.GetUnits:TUnits;
begin
{*
 0076B0B4    mov         eax,dword ptr [eax+20];TSixenseValue..............................Item:Integer
 0076B0B7    sub         eax,1
>0076B0BA    jae         0076B0BF
 0076B0BC    xor         eax,eax
 0076B0BE    ret
 0076B0BF    xor         eax,eax
 0076B0C1    ret
*}
end;

//0076B0C4
procedure TSixenseValue.GetValue;
begin
{*
 0076B0C4    add         esp,0FFFFFFF8
 0076B0C7    mov         edx,dword ptr [eax+18];TSixenseValue.......................................................
 0076B0CA    test        edx,edx
>0076B0CC    jl          0076B0D6
 0076B0CE    cmp         edx,3E7
>0076B0D4    jle         0076B0E1
 0076B0D6    xor         eax,eax
 0076B0D8    mov         dword ptr [esp],eax
 0076B0DB    mov         dword ptr [esp+4],eax
>0076B0DF    jmp         0076B115
 0076B0E1    mov         eax,dword ptr [eax+20];TSixenseValue...............................Item:Integer
 0076B0E4    sub         eax,1
>0076B0E7    jae         0076B10C
 0076B0E9    cmp         byte ptr ds:[822D61],0;gvar_00822D61
>0076B0F0    jne         0076B0FF
 0076B0F2    xor         eax,eax
 0076B0F4    call        00686074
 0076B0F9    fstp        qword ptr [esp]
 0076B0FC    wait
>0076B0FD    jmp         0076B115
 0076B0FF    mov         al,1
 0076B101    call        00686074
 0076B106    fstp        qword ptr [esp]
 0076B109    wait
>0076B10A    jmp         0076B115
 0076B10C    xor         eax,eax
 0076B10E    mov         dword ptr [esp],eax
 0076B111    mov         dword ptr [esp+4],eax
 0076B115    fld         qword ptr [esp]
 0076B118    pop         ecx
 0076B119    pop         edx
 0076B11A    ret
*}
end;

//0076B11C
function TSixenseValue.Module:TObject;
begin
{*
 0076B11C    mov         eax,[00822D68];gvar_00822D68:TModuleSixense
 0076B121    ret
*}
end;

//0076B124
procedure TSixenseValue.SetValue(NewValue:Double);
begin
{*
 0076B124    push        ebp
 0076B125    mov         ebp,esp
 0076B127    mov         edx,dword ptr [eax+18];TSixenseValue.......................................................
 0076B12A    test        edx,edx
>0076B12C    jl          0076B136
 0076B12E    cmp         edx,3E7
>0076B134    jle         0076B13A
 0076B136    xor         eax,eax
>0076B138    jmp         0076B148
 0076B13A    mov         eax,dword ptr [eax+20];TSixenseValue................................Item:Integer
 0076B13D    sub         eax,1
>0076B140    jae         0076B146
 0076B142    xor         eax,eax
>0076B144    jmp         0076B148
 0076B146    xor         eax,eax
 0076B148    pop         ebp
 0076B149    ret         8
*}
end;

//0076B14C
{*procedure TSixenseValue.ToString(?:?);
begin
 0076B14C    push        ebp
 0076B14D    mov         ebp,esp
 0076B14F    push        0
 0076B151    push        0
 0076B153    push        0
 0076B155    push        ebx
 0076B156    push        esi
 0076B157    push        edi
 0076B158    mov         esi,edx
 0076B15A    mov         ebx,eax
 0076B15C    xor         eax,eax
 0076B15E    push        ebp
 0076B15F    push        76B1D9
 0076B164    push        dword ptr fs:[eax]
 0076B167    mov         dword ptr fs:[eax],esp
 0076B16A    mov         edi,dword ptr [ebx+18];TSixenseValue.......................................................
 0076B16D    test        edi,edi
>0076B16F    jle         0076B1A4
 0076B171    push        76B1F4;'Sixense'
 0076B176    lea         edx,[ebp-4]
 0076B179    mov         eax,edi
 0076B17B    call        IntToStr
 0076B180    push        dword ptr [ebp-4]
 0076B183    push        76B210;'.'
 0076B188    lea         edx,[ebp-8]
 0076B18B    mov         eax,dword ptr [ebx+20];TSixenseValue.................................Item:Integer
 0076B18E    call        0076B2C4
 0076B193    push        dword ptr [ebp-8]
 0076B196    mov         eax,esi
 0076B198    mov         edx,4
 0076B19D    call        @UStrCatN
>0076B1A2    jmp         0076B1BE
 0076B1A4    lea         edx,[ebp-0C]
 0076B1A7    mov         eax,dword ptr [ebx+20];TSixenseValue..................................Item:Integer
 0076B1AA    call        0076B2C4
 0076B1AF    mov         ecx,dword ptr [ebp-0C]
 0076B1B2    mov         eax,esi
 0076B1B4    mov         edx,76B220;'Sixense.'
 0076B1B9    call        @UStrCat3
 0076B1BE    xor         eax,eax
 0076B1C0    pop         edx
 0076B1C1    pop         ecx
 0076B1C2    pop         ecx
 0076B1C3    mov         dword ptr fs:[eax],edx
 0076B1C6    push        76B1E0
 0076B1CB    lea         eax,[ebp-0C]
 0076B1CE    mov         edx,3
 0076B1D3    call        @UStrArrayClr
 0076B1D8    ret
>0076B1D9    jmp         @HandleFinally
>0076B1DE    jmp         0076B1CB
 0076B1E0    pop         edi
 0076B1E1    pop         esi
 0076B1E2    pop         ebx
 0076B1E3    mov         esp,ebp
 0076B1E5    pop         ebp
 0076B1E6    ret
end;*}

//0076B234
procedure sub_0076B234;
begin
{*
 0076B234    mov         byte ptr ds:[822D60],0;gvar_00822D60
 0076B23B    ret
*}
end;

//0076B23C
procedure sub_0076B23C;
begin
{*
 0076B23C    ret
*}
end;

//0076B240
procedure sub_0076B240;
begin
{*
 0076B240    cmp         byte ptr ds:[822D60],0;gvar_00822D60
>0076B247    je          0076B250
 0076B249    mov         byte ptr ds:[822D61],1;gvar_00822D61
 0076B250    ret
*}
end;

//0076B254
procedure sub_0076B254;
begin
{*
 0076B254    movzx       eax,byte ptr ds:[822D60];gvar_00822D60
 0076B25B    and         al,byte ptr ds:[822D61];gvar_00822D61
>0076B261    je          0076B26A
 0076B263    mov         byte ptr ds:[822D61],0;gvar_00822D61
 0076B26A    ret
*}
end;

//0076B26C
{*function sub_0076B26C:?;
begin
 0076B26C    mov         al,1
 0076B26E    ret
end;*}

//0076B270
{*function sub_0076B270(?:UnicodeString):?;
begin
 0076B270    push        ebp
 0076B271    mov         ebp,esp
 0076B273    push        ecx
 0076B274    push        ebx
 0076B275    mov         dword ptr [ebp-4],eax
 0076B278    mov         eax,dword ptr [ebp-4]
 0076B27B    call        @UStrAddRef
 0076B280    xor         eax,eax
 0076B282    push        ebp
 0076B283    push        76B2B6
 0076B288    push        dword ptr fs:[eax]
 0076B28B    mov         dword ptr fs:[eax],esp
 0076B28E    mov         eax,[00822D68];gvar_00822D68:TModuleSixense
 0076B293    mov         eax,dword ptr [eax+1C]
 0076B296    mov         edx,dword ptr [ebp-4]
 0076B299    call        THashTable.Get
 0076B29E    mov         ebx,eax
 0076B2A0    xor         eax,eax
 0076B2A2    pop         edx
 0076B2A3    pop         ecx
 0076B2A4    pop         ecx
 0076B2A5    mov         dword ptr fs:[eax],edx
 0076B2A8    push        76B2BD
 0076B2AD    lea         eax,[ebp-4]
 0076B2B0    call        @UStrClr
 0076B2B5    ret
>0076B2B6    jmp         @HandleFinally
>0076B2BB    jmp         0076B2AD
 0076B2BD    mov         eax,ebx
 0076B2BF    pop         ebx
 0076B2C0    pop         ecx
 0076B2C1    pop         ebp
 0076B2C2    ret
end;*}

//0076B2C4
{*procedure sub_0076B2C4(?:Integer; ?:?);
begin
 0076B2C4    push        ebx
 0076B2C5    push        esi
 0076B2C6    mov         esi,edx
 0076B2C8    mov         ebx,eax
 0076B2CA    mov         ecx,esi
 0076B2CC    mov         eax,[00822D68];gvar_00822D68:TModuleSixense
 0076B2D1    mov         eax,dword ptr [eax+1C]
 0076B2D4    mov         edx,ebx
 0076B2D6    call        THashTable.Get
 0076B2DB    pop         esi
 0076B2DC    pop         ebx
 0076B2DD    ret
end;*}

//0076B2E0
{*function sub_0076B2E0:?;
begin
 0076B2E0    push        ebx
 0076B2E1    mov         dl,1
 0076B2E3    mov         eax,[0043C7BC];TStringList
 0076B2E8    call        TStringList.Create;TStringList.Create
 0076B2ED    mov         ebx,eax
 0076B2EF    mov         edx,76B30C;'Exists'
 0076B2F4    mov         eax,ebx
 0076B2F6    mov         ecx,dword ptr [eax]
 0076B2F8    call        dword ptr [ecx+38];TStringList.Add
 0076B2FB    mov         eax,ebx
 0076B2FD    pop         ebx
 0076B2FE    ret
end;*}

//0076B31C
procedure TModuleSixense.AddFields;
begin
{*
 0076B31C    push        ebx
 0076B31D    mov         ebx,eax
 0076B31F    mov         eax,ebx
 0076B321    call        TPieModule.AddFields
 0076B326    xor         ecx,ecx
 0076B328    mov         edx,76B344;'Exists'
 0076B32D    mov         eax,dword ptr [ebx+1C];TModuleSixense.Fields:THashTable
 0076B330    call        THashTable.Add
 0076B335    pop         ebx
 0076B336    ret
*}
end;

//0076B354
procedure TModuleSixense.ClearRead;
begin
{*
 0076B354    call        TPieModule.ClearRead
 0076B359    ret
*}
end;

//0076B35C
constructor TModuleSixense.Create;
begin
{*
 0076B35C    push        ebx
 0076B35D    push        esi
 0076B35E    test        dl,dl
>0076B360    je          0076B36A
 0076B362    add         esp,0FFFFFFF0
 0076B365    call        @ClassCreate
 0076B36A    mov         ebx,edx
 0076B36C    mov         esi,eax
 0076B36E    push        0
 0076B370    push        0
 0076B372    push        0
 0076B374    push        0
 0076B376    mov         ecx,76B3AC;'Sixense'
 0076B37B    xor         edx,edx
 0076B37D    mov         eax,esi
 0076B37F    call        005E48EC
 0076B384    mov         eax,esi
 0076B386    test        bl,bl
>0076B388    je          0076B399
 0076B38A    call        @AfterConstruction
 0076B38F    pop         dword ptr fs:[0]
 0076B396    add         esp,0C
 0076B399    mov         eax,esi
 0076B39B    pop         esi
 0076B39C    pop         ebx
 0076B39D    ret
*}
end;

//0076B3BC
function TModuleSixense.CreateValue(Identifier:string):TExpression;
begin
{*
 0076B3BC    push        ebp
 0076B3BD    mov         ebp,esp
 0076B3BF    push        ecx
 0076B3C0    push        ebx
 0076B3C1    mov         dword ptr [ebp-4],edx
 0076B3C4    mov         ebx,eax
 0076B3C6    mov         eax,dword ptr [ebp-4]
 0076B3C9    call        @UStrAddRef
 0076B3CE    xor         eax,eax
 0076B3D0    push        ebp
 0076B3D1    push        76B400
 0076B3D6    push        dword ptr fs:[eax]
 0076B3D9    mov         dword ptr fs:[eax],esp
 0076B3DC    mov         byte ptr [ebx+24],1;TModuleSixense.Used:Boolean
 0076B3E0    mov         eax,dword ptr [ebp-4]
 0076B3E3    call        0076AF3C
 0076B3E8    mov         ebx,eax
 0076B3EA    xor         eax,eax
 0076B3EC    pop         edx
 0076B3ED    pop         ecx
 0076B3EE    pop         ecx
 0076B3EF    mov         dword ptr fs:[eax],edx
 0076B3F2    push        76B407
 0076B3F7    lea         eax,[ebp-4]
 0076B3FA    call        @UStrClr
 0076B3FF    ret
>0076B400    jmp         @HandleFinally
>0076B405    jmp         0076B3F7
 0076B407    mov         eax,ebx
 0076B409    pop         ebx
 0076B40A    pop         ecx
 0076B40B    pop         ebp
 0076B40C    ret
*}
end;

//0076B410
function TModuleSixense.GetDefaultFormat(field:string):TGuiFormat;
begin
{*
 0076B410    push        ebp
 0076B411    mov         ebp,esp
 0076B413    push        ecx
 0076B414    push        ebx
 0076B415    mov         dword ptr [ebp-4],edx
 0076B418    mov         ebx,eax
 0076B41A    mov         eax,dword ptr [ebp-4]
 0076B41D    call        @UStrAddRef
 0076B422    xor         eax,eax
 0076B424    push        ebp
 0076B425    push        76B45C
 0076B42A    push        dword ptr fs:[eax]
 0076B42D    mov         dword ptr fs:[eax],esp
 0076B430    mov         edx,dword ptr [ebp-4]
 0076B433    mov         eax,dword ptr [ebx+1C];TModuleSixense.Fields:THashTable
 0076B436    call        THashTable.Get
 0076B43B    sub         eax,1
>0076B43E    jae         0076B444
 0076B440    xor         ebx,ebx
>0076B442    jmp         0076B446
 0076B444    mov         bl,9
 0076B446    xor         eax,eax
 0076B448    pop         edx
 0076B449    pop         ecx
 0076B44A    pop         ecx
 0076B44B    mov         dword ptr fs:[eax],edx
 0076B44E    push        76B463
 0076B453    lea         eax,[ebp-4]
 0076B456    call        @UStrClr
 0076B45B    ret
>0076B45C    jmp         @HandleFinally
>0076B461    jmp         0076B453
 0076B463    mov         eax,ebx
 0076B465    pop         ebx
 0076B466    pop         ecx
 0076B467    pop         ebp
 0076B468    ret
*}
end;

//0076B46C
procedure TModuleSixense.GetGoodFields;
begin
{*
 0076B46C    call        0076B2E0
 0076B471    ret
*}
end;

//0076B474
procedure TModuleSixense.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 0076B474    push        ebp
 0076B475    mov         ebp,esp
 0076B477    mov         byte ptr [edx],1
 0076B47A    mov         dword ptr [ecx],1
 0076B480    mov         eax,dword ptr [ebp+8]
 0076B483    mov         dword ptr [eax],14
 0076B489    pop         ebp
 0076B48A    ret         4
*}
end;

//0076B490
procedure TModuleSixense.Read;
begin
{*
 0076B490    call        0076B26C
 0076B495    ret
*}
end;

//0076B498
procedure TModuleSixense.StartCompiletime;
begin
{*
 0076B498    call        TPieModule.StartCompiletime
 0076B49D    call        0076B234
 0076B4A2    ret
*}
end;

//0076B4A4
procedure TModuleSixense.StartRuntime;
begin
{*
 0076B4A4    call        TPieModule.StartRuntime
 0076B4A9    call        0076B240
 0076B4AE    ret
*}
end;

//0076B4B0
procedure TModuleSixense.StopCompiletime;
begin
{*
 0076B4B0    push        ebx
 0076B4B1    mov         ebx,eax
 0076B4B3    call        0076B23C
 0076B4B8    mov         eax,ebx
 0076B4BA    call        TPieModule.StopCompiletime
 0076B4BF    pop         ebx
 0076B4C0    ret
*}
end;

//0076B4C4
procedure TModuleSixense.StopRuntime;
begin
{*
 0076B4C4    push        ebx
 0076B4C5    mov         ebx,eax
 0076B4C7    call        0076B254
 0076B4CC    mov         eax,ebx
 0076B4CE    call        TPieModule.StopRuntime
 0076B4D3    pop         ebx
 0076B4D4    ret
*}
end;

Initialization
//00783044
{*
 00783044    sub         dword ptr ds:[822D64],1
>0078304B    jae         00783068
 0078304D    mov         dl,1
 0078304F    mov         eax,[0076AB84];TModuleSixense
 00783054    call        TModuleSixense.Create;TModuleSixense.Create
 00783059    mov         [00822D68],eax;gvar_00822D68:TModuleSixense
 0078305E    mov         eax,[00822D68];gvar_00822D68:TModuleSixense
 00783063    call        005E31AC
 00783068    ret
*}
Finalization
end.