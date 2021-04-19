//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieIntersense;

interface

uses
  SysUtils, Classes;

type
  TIntersenseValue = class(TObjectValue)
  published
    //procedure GetString(?:?);//006DAD90
    procedure FillClone(c:TExpression);//006DAD28
    function GetUnits:TUnits;//006DADB8
    function GetPerUnits2:TUnits;//006DAD80
    function GetPerUnits1:TUnits;//006DAD70
    procedure CreateClone;//006DAD18
    function CanSet:Boolean;//006DAD14
    function GetDataType:TDataType;//006DAD48
    procedure SetValue(NewValue:Double);//006DB050
    procedure GetValue;//006DADD8
    //procedure ToString(?:?);//006DB068
  public
    ComPort:Integer;//f20
    Item:Integer;//f24
    //procedure ToString(?:?); virtual;//006DB068
    procedure GetValue; virtual;//v2C//006DADD8
    //procedure GetString(?:?); virtual;//v38//006DAD90
    function GetDataType:TDataType; virtual;//v44//006DAD48
    function GetUnits:TUnits; virtual;//v48//006DADB8
    function GetPerUnits1:TUnits; virtual;//v4C//006DAD70
    function GetPerUnits2:TUnits; virtual;//v50//006DAD80
    procedure SetValue(NewValue:Double); virtual;//v58//006DB050
    function CanSet:Boolean; virtual;//v68//006DAD14
    procedure CreateClone; virtual;//v80//006DAD18
    procedure FillClone(c:TExpression); virtual;//v84//006DAD28
  end;
    //function sub_006D9F30(?:?):?;//006D9F30
    procedure sub_006D9F3C;//006D9F3C
    //function sub_006D9F44:?;//006D9F44
    procedure sub_006D9F50;//006D9F50
    //function sub_006D9FF0:?;//006D9FF0
    //function sub_006DA3F0(?:?; ?:?; ?:?; ?:?):?;//006DA3F0
    //function sub_006DA438(?:?):?;//006DA438
    //function sub_006DA488(?:?):?;//006DA488
    procedure sub_006DA4A4;//006DA4A4
    //procedure sub_006DA4C0(?:?);//006DA4C0
    //procedure sub_006DA4E8(?:?);//006DA4E8
    procedure sub_006DA510;//006DA510
    procedure sub_006DA8E8;//006DA8E8
    //function sub_006DAB8C(?:?):?;//006DAB8C
    procedure sub_006DB15C;//006DB15C
    procedure sub_006DB164;//006DB164
    procedure sub_006DB168;//006DB168
    procedure sub_006DB21C;//006DB21C
    //function sub_006DB23C:?;//006DB23C
    //function sub_006DB260(?:UnicodeString):?;//006DB260
    //procedure sub_006DB2B0(?:Integer; ?:?);//006DB2B0
    //function sub_006DB2C8:?;//006DB2C8
    //function sub_006DB33C:?;//006DB33C
    //function sub_006DB57C(?:?):?;//006DB57C

implementation

//006D9F30
{*function sub_006D9F30(?:?):?;
begin
 006D9F30    push        ebx
 006D9F31    mov         ebx,eax
 006D9F33    push        ebx
 006D9F34    call        kernel32.LoadLibraryW
 006D9F39    pop         ebx
 006D9F3A    ret
end;*}

//006D9F3C
procedure sub_006D9F3C;
begin
{*
 006D9F3C    push        eax
 006D9F3D    call        kernel32.FreeLibrary
 006D9F42    ret
*}
end;

//006D9F44
{*function sub_006D9F44:?;
begin
 006D9F44    push        edx
 006D9F45    push        eax
 006D9F46    call        GetProcAddress
 006D9F4B    test        eax,eax
 006D9F4D    ret
end;*}

//006D9F50
procedure sub_006D9F50;
begin
{*
 006D9F50    mov         byte ptr ds:[81F958],0;gvar_0081F958
 006D9F57    xor         eax,eax
 006D9F59    mov         [0078C288],eax;gvar_0078C288
 006D9F5E    xor         eax,eax
 006D9F60    mov         [0078C28C],eax;gvar_0078C28C
 006D9F65    xor         eax,eax
 006D9F67    mov         [0078C290],eax;gvar_0078C290
 006D9F6C    xor         eax,eax
 006D9F6E    mov         [0078C29C],eax;gvar_0078C29C
 006D9F73    xor         eax,eax
 006D9F75    mov         [0078C294],eax;gvar_0078C294
 006D9F7A    xor         eax,eax
 006D9F7C    mov         [0078C298],eax;gvar_0078C298
 006D9F81    xor         eax,eax
 006D9F83    mov         [0078C2A4],eax;gvar_0078C2A4
 006D9F88    xor         eax,eax
 006D9F8A    mov         [0078C2A0],eax;gvar_0078C2A0
 006D9F8F    xor         eax,eax
 006D9F91    mov         [0078C2AC],eax;gvar_0078C2AC
 006D9F96    xor         eax,eax
 006D9F98    mov         [0078C2B0],eax;gvar_0078C2B0
 006D9F9D    xor         eax,eax
 006D9F9F    mov         [0078C2C0],eax;gvar_0078C2C0
 006D9FA4    xor         eax,eax
 006D9FA6    mov         [0078C2C8],eax;gvar_0078C2C8
 006D9FAB    xor         eax,eax
 006D9FAD    mov         [0078C2B4],eax;gvar_0078C2B4
 006D9FB2    xor         eax,eax
 006D9FB4    mov         [0078C2BC],eax;gvar_0078C2BC
 006D9FB9    xor         eax,eax
 006D9FBB    mov         [0078C2B8],eax;gvar_0078C2B8
 006D9FC0    xor         eax,eax
 006D9FC2    mov         [0078C2CC],eax;gvar_0078C2CC
 006D9FC7    xor         eax,eax
 006D9FC9    mov         [0078C2A8],eax;gvar_0078C2A8
 006D9FCE    xor         eax,eax
 006D9FD0    mov         [0078C2C4],eax;gvar_0078C2C4
 006D9FD5    cmp         dword ptr ds:[78C284],0;gvar_0078C284
>006D9FDC    je          006D9FEF
 006D9FDE    mov         eax,[0078C284];0x0 gvar_0078C284
 006D9FE3    call        006D9F3C
 006D9FE8    xor         eax,eax
 006D9FEA    mov         [0078C284],eax;gvar_0078C284
 006D9FEF    ret
*}
end;

//006D9FF0
{*function sub_006D9FF0:?;
begin
 006D9FF0    push        ebx
 006D9FF1    mov         ebx,78C284;gvar_0078C284
 006D9FF6    mov         byte ptr ds:[81F958],1;gvar_0081F958
 006D9FFD    mov         eax,6DA148
 006DA002    call        006D9F30
 006DA007    mov         dword ptr [ebx],eax
 006DA009    cmp         dword ptr [ebx],0
>006DA00C    je          006DA144
 006DA012    mov         edx,6DA160
 006DA017    mov         eax,dword ptr [ebx]
 006DA019    call        006D9F44
 006DA01E    mov         [0078C288],eax;gvar_0078C288
 006DA023    mov         edx,6DA180
 006DA028    mov         eax,dword ptr [ebx]
 006DA02A    call        006D9F44
 006DA02F    mov         [0078C28C],eax;gvar_0078C28C
 006DA034    mov         edx,6DA1A8
 006DA039    mov         eax,dword ptr [ebx]
 006DA03B    call        006D9F44
 006DA040    mov         [0078C290],eax;gvar_0078C290
 006DA045    mov         edx,6DA1CC
 006DA04A    mov         eax,dword ptr [ebx]
 006DA04C    call        006D9F44
 006DA051    mov         [0078C29C],eax;gvar_0078C29C
 006DA056    mov         edx,6DA1EC
 006DA05B    mov         eax,dword ptr [ebx]
 006DA05D    call        006D9F44
 006DA062    mov         [0078C294],eax;gvar_0078C294
 006DA067    mov         edx,6DA218
 006DA06C    mov         eax,dword ptr [ebx]
 006DA06E    call        006D9F44
 006DA073    mov         [0078C298],eax;gvar_0078C298
 006DA078    mov         edx,6DA244
 006DA07D    mov         eax,dword ptr [ebx]
 006DA07F    call        006D9F44
 006DA084    mov         [0078C2A4],eax;gvar_0078C2A4
 006DA089    mov         edx,6DA270
 006DA08E    mov         eax,dword ptr [ebx]
 006DA090    call        006D9F44
 006DA095    mov         [0078C2A0],eax;gvar_0078C2A0
 006DA09A    mov         edx,6DA29C
 006DA09F    mov         eax,dword ptr [ebx]
 006DA0A1    call        006D9F44
 006DA0A6    mov         [0078C2AC],eax;gvar_0078C2AC
 006DA0AB    mov         edx,6DA2B4
 006DA0B0    mov         eax,dword ptr [ebx]
 006DA0B2    call        006D9F44
 006DA0B7    mov         [0078C2B0],eax;gvar_0078C2B0
 006DA0BC    mov         edx,6DA2D8
 006DA0C1    mov         eax,dword ptr [ebx]
 006DA0C3    call        006D9F44
 006DA0C8    mov         [0078C2C0],eax;gvar_0078C2C0
 006DA0CD    mov         edx,6DA2F8
 006DA0D2    mov         eax,dword ptr [ebx]
 006DA0D4    call        006D9F44
 006DA0D9    mov         [0078C2C8],eax;gvar_0078C2C8
 006DA0DE    mov         edx,6DA320
 006DA0E3    mov         eax,dword ptr [ebx]
 006DA0E5    call        006D9F44
 006DA0EA    mov         [0078C2B4],eax;gvar_0078C2B4
 006DA0EF    mov         edx,6DA344
 006DA0F4    mov         eax,dword ptr [ebx]
 006DA0F6    call        006D9F44
 006DA0FB    mov         [0078C2BC],eax;gvar_0078C2BC
 006DA100    mov         edx,6DA360
 006DA105    mov         eax,dword ptr [ebx]
 006DA107    call        006D9F44
 006DA10C    mov         [0078C2B8],eax;gvar_0078C2B8
 006DA111    mov         edx,6DA390
 006DA116    mov         eax,dword ptr [ebx]
 006DA118    call        006D9F44
 006DA11D    mov         [0078C2CC],eax;gvar_0078C2CC
 006DA122    mov         edx,6DA3A8
 006DA127    mov         eax,dword ptr [ebx]
 006DA129    call        006D9F44
 006DA12E    mov         [0078C2A8],eax;gvar_0078C2A8
 006DA133    mov         edx,6DA3D4
 006DA138    mov         eax,dword ptr [ebx]
 006DA13A    call        006D9F44
 006DA13F    mov         [0078C2C4],eax;gvar_0078C2C4
 006DA144    mov         eax,dword ptr [ebx]
 006DA146    pop         ebx
 006DA147    ret
end;*}

//006DA3F0
{*function sub_006DA3F0(?:?; ?:?; ?:?; ?:?):?;
begin
 006DA3F0    push        ebp
 006DA3F1    mov         ebp,esp
 006DA3F3    push        ebx
 006DA3F4    push        esi
 006DA3F5    push        edi
 006DA3F6    mov         edi,ecx
 006DA3F8    mov         esi,edx
 006DA3FA    mov         ebx,eax
 006DA3FC    cmp         dword ptr ds:[78C288],0;gvar_0078C288
>006DA403    jne         006DA421
 006DA405    cmp         byte ptr ds:[81F958],0;gvar_0081F958
>006DA40C    jne         006DA413
 006DA40E    call        006D9FF0
 006DA413    cmp         dword ptr ds:[78C288],0;gvar_0078C288
>006DA41A    jne         006DA421
 006DA41C    or          eax,0FFFFFFFF
>006DA41F    jmp         006DA431
 006DA421    mov         eax,dword ptr [ebp+8]
 006DA424    push        eax
 006DA425    push        edi
 006DA426    push        esi
 006DA427    push        ebx
 006DA428    call        dword ptr ds:[78C288]
 006DA42E    add         esp,10
 006DA431    pop         edi
 006DA432    pop         esi
 006DA433    pop         ebx
 006DA434    pop         ebp
 006DA435    ret         4
end;*}

//006DA438
{*function sub_006DA438(?:?):?;
begin
 006DA438    push        ebx
 006DA439    push        ecx
 006DA43A    mov         ebx,eax
 006DA43C    cmp         dword ptr ds:[78C28C],0;gvar_0078C28C
>006DA443    jne         006DA460
 006DA445    cmp         byte ptr ds:[81F958],0;gvar_0081F958
>006DA44C    jne         006DA453
 006DA44E    call        006D9FF0
 006DA453    cmp         dword ptr ds:[78C28C],0;gvar_0078C28C
>006DA45A    jne         006DA460
 006DA45C    xor         ebx,ebx
>006DA45E    jmp         006DA481
 006DA460    push        ebx
 006DA461    call        dword ptr ds:[78C290]
 006DA467    pop         ecx
 006DA468    mov         ebx,eax
 006DA46A    mov         eax,esp
 006DA46C    call        006DA488
 006DA471    test        eax,eax
>006DA473    je          006DA481
 006DA475    cmp         word ptr [esp],0
>006DA47A    jne         006DA481
 006DA47C    call        006D9F50
 006DA481    mov         eax,ebx
 006DA483    pop         edx
 006DA484    pop         ebx
 006DA485    ret
end;*}

//006DA488
{*function sub_006DA488(?:?):?;
begin
 006DA488    cmp         dword ptr ds:[78C2C8],0;gvar_0078C2C8
>006DA48F    jne         006DA499
 006DA491    mov         word ptr [eax],0
 006DA496    xor         eax,eax
 006DA498    ret
 006DA499    push        eax
 006DA49A    call        dword ptr ds:[78C2C8]
 006DA4A0    pop         ecx
 006DA4A1    ret
end;*}

//006DA4A4
procedure sub_006DA4A4;
begin
{*
 006DA4A4    cmp         dword ptr ds:[78C294],0;gvar_0078C294
>006DA4AB    jne         006DA4B0
 006DA4AD    xor         eax,eax
 006DA4AF    ret
 006DA4B0    push        ecx
 006DA4B1    push        edx
 006DA4B2    push        eax
 006DA4B3    call        dword ptr ds:[78C294]
 006DA4B9    add         esp,0C
 006DA4BC    ret
*}
end;

//006DA4C0
{*procedure sub_006DA4C0(?:?);
begin
 006DA4C0    push        ebp
 006DA4C1    mov         ebp,esp
 006DA4C3    push        ebx
 006DA4C4    cmp         dword ptr ds:[78C2A0],0;gvar_0078C2A0
>006DA4CB    jne         006DA4D1
 006DA4CD    xor         eax,eax
>006DA4CF    jmp         006DA4E1
 006DA4D1    mov         ebx,dword ptr [ebp+8]
 006DA4D4    push        ebx
 006DA4D5    push        ecx
 006DA4D6    push        edx
 006DA4D7    push        eax
 006DA4D8    call        dword ptr ds:[78C2A0]
 006DA4DE    add         esp,10
 006DA4E1    pop         ebx
 006DA4E2    pop         ebp
 006DA4E3    ret         4
end;*}

//006DA4E8
{*procedure sub_006DA4E8(?:?);
begin
 006DA4E8    push        ebp
 006DA4E9    mov         ebp,esp
 006DA4EB    push        ebx
 006DA4EC    cmp         dword ptr ds:[78C2A4],0;gvar_0078C2A4
>006DA4F3    jne         006DA4F9
 006DA4F5    xor         eax,eax
>006DA4F7    jmp         006DA509
 006DA4F9    mov         ebx,dword ptr [ebp+8]
 006DA4FC    push        ebx
 006DA4FD    push        ecx
 006DA4FE    push        edx
 006DA4FF    push        eax
 006DA500    call        dword ptr ds:[78C2A4]
 006DA506    add         esp,10
 006DA509    pop         ebx
 006DA50A    pop         ebp
 006DA50B    ret         4
end;*}

//006DA510
procedure sub_006DA510;
begin
{*
 006DA510    cmp         dword ptr ds:[78C2AC],0;gvar_0078C2AC
>006DA517    jne         006DA51C
 006DA519    xor         eax,eax
 006DA51B    ret
 006DA51C    push        edx
 006DA51D    push        eax
 006DA51E    call        dword ptr ds:[78C2AC]
 006DA524    add         esp,8
 006DA527    ret
*}
end;

//006DA8E8
procedure sub_006DA8E8;
begin
{*
 006DA8E8    push        ebp
 006DA8E9    mov         ebp,esp
 006DA8EB    mov         ecx,5
 006DA8F0    push        0
 006DA8F2    push        0
 006DA8F4    dec         ecx
>006DA8F5    jne         006DA8F0
 006DA8F7    push        ebx
 006DA8F8    push        esi
 006DA8F9    mov         esi,81F95C;gvar_0081F95C:THashTable
 006DA8FE    xor         eax,eax
 006DA900    push        ebp
 006DA901    push        6DAA6D
 006DA906    push        dword ptr fs:[eax]
 006DA909    mov         dword ptr fs:[eax],esp
 006DA90C    xor         ecx,ecx
 006DA90E    mov         edx,6DAA88;'Exists'
 006DA913    mov         eax,dword ptr [esi]
 006DA915    call        THashTable.Add
 006DA91A    mov         ebx,1
 006DA91F    lea         edx,[ebp-8]
 006DA922    mov         eax,ebx
 006DA924    call        IntToStr
 006DA929    mov         ecx,dword ptr [ebp-8]
 006DA92C    lea         eax,[ebp-4]
 006DA92F    mov         edx,6DAAA4;'Pos'
 006DA934    call        @UStrCat3
 006DA939    mov         edx,dword ptr [ebp-4]
 006DA93C    lea         ecx,[ebx+1]
 006DA93F    dec         ecx
 006DA940    mov         eax,dword ptr [esi]
 006DA942    call        THashTable.Add
 006DA947    lea         edx,[ebp-10]
 006DA94A    mov         eax,ebx
 006DA94C    call        IntToStr
 006DA951    mov         ecx,dword ptr [ebp-10]
 006DA954    lea         eax,[ebp-0C]
 006DA957    mov         edx,6DAAB8;'Angle'
 006DA95C    call        @UStrCat3
 006DA961    mov         edx,dword ptr [ebp-0C]
 006DA964    lea         ecx,[ebx+4]
 006DA967    dec         ecx
 006DA968    mov         eax,dword ptr [esi]
 006DA96A    call        THashTable.Add
 006DA96F    inc         ebx
 006DA970    cmp         ebx,4
>006DA973    jne         006DA91F
 006DA975    mov         ebx,1
 006DA97A    lea         edx,[ebp-18]
 006DA97D    mov         eax,ebx
 006DA97F    call        IntToStr
 006DA984    mov         ecx,dword ptr [ebp-18]
 006DA987    lea         eax,[ebp-14]
 006DA98A    mov         edx,6DAAD0;'Button'
 006DA98F    call        @UStrCat3
 006DA994    mov         edx,dword ptr [ebp-14]
 006DA997    lea         ecx,[ebx+7]
 006DA99A    dec         ecx
 006DA99B    mov         eax,dword ptr [esi]
 006DA99D    call        THashTable.Add
 006DA9A2    inc         ebx
 006DA9A3    cmp         ebx,9
>006DA9A6    jne         006DA97A
 006DA9A8    mov         ecx,0F
 006DA9AD    mov         edx,6DAAEC;'JoystickX'
 006DA9B2    mov         eax,dword ptr [esi]
 006DA9B4    call        THashTable.Add
 006DA9B9    mov         ecx,10
 006DA9BE    mov         edx,6DAB0C;'JoystickY'
 006DA9C3    mov         eax,dword ptr [esi]
 006DA9C5    call        THashTable.Add
 006DA9CA    mov         ecx,0F
 006DA9CF    mov         edx,6DAB2C;'JoyX'
 006DA9D4    mov         eax,dword ptr [esi]
 006DA9D6    call        THashTable.Add
 006DA9DB    mov         ecx,10
 006DA9E0    mov         edx,6DAB44;'JoyY'
 006DA9E5    mov         eax,dword ptr [esi]
 006DA9E7    call        THashTable.Add
 006DA9EC    mov         ebx,1
 006DA9F1    lea         edx,[ebp-20]
 006DA9F4    mov         eax,ebx
 006DA9F6    call        IntToStr
 006DA9FB    mov         ecx,dword ptr [ebp-20]
 006DA9FE    lea         eax,[ebp-1C]
 006DAA01    mov         edx,6DAB5C;'Analog'
 006DAA06    call        @UStrCat3
 006DAA0B    mov         edx,dword ptr [ebp-1C]
 006DAA0E    lea         ecx,[ebx+0F]
 006DAA11    dec         ecx
 006DAA12    mov         eax,dword ptr [esi]
 006DAA14    call        THashTable.Add
 006DAA19    inc         ebx
 006DAA1A    cmp         ebx,0B
>006DAA1D    jne         006DA9F1
 006DAA1F    mov         ebx,1
 006DAA24    lea         edx,[ebp-28]
 006DAA27    mov         eax,ebx
 006DAA29    call        IntToStr
 006DAA2E    mov         ecx,dword ptr [ebp-28]
 006DAA31    lea         eax,[ebp-24]
 006DAA34    mov         edx,6DAB78;'AuxInput'
 006DAA39    call        @UStrCat3
 006DAA3E    mov         edx,dword ptr [ebp-24]
 006DAA41    lea         ecx,[ebx+19]
 006DAA44    dec         ecx
 006DAA45    mov         eax,dword ptr [esi]
 006DAA47    call        THashTable.Add
 006DAA4C    inc         ebx
 006DAA4D    cmp         ebx,5
>006DAA50    jne         006DAA24
 006DAA52    xor         eax,eax
 006DAA54    pop         edx
 006DAA55    pop         ecx
 006DAA56    pop         ecx
 006DAA57    mov         dword ptr fs:[eax],edx
 006DAA5A    push        6DAA74
 006DAA5F    lea         eax,[ebp-28]
 006DAA62    mov         edx,0A
 006DAA67    call        @UStrArrayClr
 006DAA6C    ret
>006DAA6D    jmp         @HandleFinally
>006DAA72    jmp         006DAA5F
 006DAA74    pop         esi
 006DAA75    pop         ebx
 006DAA76    mov         esp,ebp
 006DAA78    pop         ebp
 006DAA79    ret
*}
end;

//006DAB8C
{*function sub_006DAB8C(?:?):?;
begin
 006DAB8C    push        ebp
 006DAB8D    mov         ebp,esp
 006DAB8F    add         esp,0FFFFFFF4
 006DAB92    push        ebx
 006DAB93    push        esi
 006DAB94    push        edi
 006DAB95    xor         edx,edx
 006DAB97    mov         dword ptr [ebp-8],edx
 006DAB9A    mov         dword ptr [ebp-4],eax
 006DAB9D    mov         eax,dword ptr [ebp-4]
 006DABA0    call        @UStrAddRef
 006DABA5    xor         eax,eax
 006DABA7    push        ebp
 006DABA8    push        6DACA0
 006DABAD    push        dword ptr fs:[eax]
 006DABB0    mov         dword ptr fs:[eax],esp
 006DABB3    xor         esi,esi
 006DABB5    lea         eax,[ebp-8]
 006DABB8    mov         edx,dword ptr [ebp-4]
 006DABBB    call        @UStrLAsg
 006DABC0    lea         eax,[ebp-8]
 006DABC3    mov         edx,6DACBC;'Intersense'
 006DABC8    call        004F9BD0
 006DABCD    test        al,al
>006DABCF    jne         006DABE6
 006DABD1    lea         eax,[ebp-8]
 006DABD4    mov         edx,6DACE0;'ISense'
 006DABD9    call        004F9BD0
 006DABDE    test        al,al
>006DABE0    je          006DAC85
 006DABE6    lea         eax,[ebp-8]
 006DABE9    call        004F9D00
 006DABEE    mov         ebx,eax
 006DABF0    lea         eax,[ebp-8]
 006DABF3    mov         edx,6DACFC;'.'
 006DABF8    call        004F9BD0
 006DABFD    test        al,al
>006DABFF    je          006DAC85
 006DAC05    lea         eax,[ebp-8]
 006DAC08    mov         edx,6DAD0C;'com'
 006DAC0D    call        004F9BD0
 006DAC12    test        al,al
>006DAC14    je          006DAC3E
 006DAC16    lea         eax,[ebp-8]
 006DAC19    call        004F9D00
 006DAC1E    mov         edi,eax
 006DAC20    test        edi,edi
>006DAC22    jge         006DAC26
 006DAC24    xor         edi,edi
 006DAC26    cmp         edi,8
>006DAC29    jg          006DAC85
 006DAC2B    lea         eax,[ebp-8]
 006DAC2E    mov         edx,6DACFC;'.'
 006DAC33    call        004F9BD0
 006DAC38    test        al,al
>006DAC3A    je          006DAC85
>006DAC3C    jmp         006DAC40
 006DAC3E    xor         edi,edi
 006DAC40    mov         eax,dword ptr [ebp-8]
 006DAC43    call        006DB260
 006DAC48    mov         dword ptr [ebp-0C],eax
 006DAC4B    cmp         dword ptr [ebp-0C],0
>006DAC4F    jl          006DAC85
 006DAC51    mov         dl,1
 006DAC53    mov         eax,[006DA528];TIntersenseValue
 006DAC58    call        TObject.Create;TIntersenseValue.Create
 006DAC5D    mov         esi,eax
 006DAC5F    mov         eax,dword ptr [ebp-0C]
 006DAC62    mov         dword ptr [esi+24],eax;TIntersenseValue.Item:Integer
 006DAC65    test        ebx,ebx
>006DAC67    jg          006DAC6E
 006DAC69    mov         ebx,1
 006DAC6E    cmp         ebx,8
>006DAC71    jle         006DAC78
 006DAC73    mov         ebx,8
 006DAC78    mov         dword ptr [esi+18],ebx;TIntersenseValue....................................................
 006DAC7B    mov         dword ptr [esi+20],edi;TIntersenseValue.ComPort:Integer
 006DAC7E    mov         byte ptr ds:[81F960],1;gvar_0081F960
 006DAC85    xor         eax,eax
 006DAC87    pop         edx
 006DAC88    pop         ecx
 006DAC89    pop         ecx
 006DAC8A    mov         dword ptr fs:[eax],edx
 006DAC8D    push        6DACA7
 006DAC92    lea         eax,[ebp-8]
 006DAC95    mov         edx,2
 006DAC9A    call        @UStrArrayClr
 006DAC9F    ret
>006DACA0    jmp         @HandleFinally
>006DACA5    jmp         006DAC92
 006DACA7    mov         eax,esi
 006DACA9    pop         edi
 006DACAA    pop         esi
 006DACAB    pop         ebx
 006DACAC    mov         esp,ebp
 006DACAE    pop         ebp
 006DACAF    ret
end;*}

//006DAD14
function TIntersenseValue.CanSet:Boolean;
begin
{*
 006DAD14    xor         eax,eax
 006DAD16    ret
*}
end;

//006DAD18
procedure TIntersenseValue.CreateClone;
begin
{*
 006DAD18    mov         dl,1
 006DAD1A    mov         eax,[006DA528];TIntersenseValue
 006DAD1F    call        TObject.Create;TIntersenseValue.Create
 006DAD24    ret
*}
end;

//006DAD28
procedure TIntersenseValue.FillClone(c:TExpression);
begin
{*
 006DAD28    push        ebx
 006DAD29    push        esi
 006DAD2A    mov         esi,edx
 006DAD2C    mov         ebx,eax
 006DAD2E    mov         edx,esi
 006DAD30    mov         eax,ebx
 006DAD32    call        TExpression.FillClone
 006DAD37    mov         eax,esi
 006DAD39    mov         edx,dword ptr [ebx+24];TIntersenseValue.Item:Integer
 006DAD3C    mov         dword ptr [eax+24],edx
 006DAD3F    mov         edx,dword ptr [ebx+18];TIntersenseValue....................................................
 006DAD42    mov         dword ptr [eax+18],edx
 006DAD45    pop         esi
 006DAD46    pop         ebx
 006DAD47    ret
*}
end;

//006DAD48
function TIntersenseValue.GetDataType:TDataType;
begin
{*
 006DAD48    mov         eax,dword ptr [eax+24];TIntersenseValue.Item:Integer
 006DAD4B    sub         eax,1
>006DAD4E    jb          006DAD62
 006DAD50    add         eax,0FFFFFFFA
 006DAD53    sub         eax,8
>006DAD56    jb          006DAD65
 006DAD58    add         eax,0FFFFFFF6
 006DAD5B    sub         eax,4
>006DAD5E    jb          006DAD68
>006DAD60    jmp         006DAD6B
 006DAD62    mov         al,3
 006DAD64    ret
 006DAD65    mov         al,3
 006DAD67    ret
 006DAD68    mov         al,2
 006DAD6A    ret
 006DAD6B    xor         eax,eax
 006DAD6D    ret
*}
end;

//006DAD70
function TIntersenseValue.GetPerUnits1:TUnits;
begin
{*
 006DAD70    mov         eax,dword ptr [eax+24];TIntersenseValue.Item:Integer
 006DAD73    sub         eax,1
>006DAD76    jae         006DAD7B
 006DAD78    xor         eax,eax
 006DAD7A    ret
 006DAD7B    xor         eax,eax
 006DAD7D    ret
*}
end;

//006DAD80
function TIntersenseValue.GetPerUnits2:TUnits;
begin
{*
 006DAD80    mov         eax,dword ptr [eax+24];TIntersenseValue.Item:Integer
 006DAD83    sub         eax,1
>006DAD86    jae         006DAD8B
 006DAD88    xor         eax,eax
 006DAD8A    ret
 006DAD8B    xor         eax,eax
 006DAD8D    ret
*}
end;

//006DAD90
{*procedure TIntersenseValue.GetString(?:?);
begin
 006DAD90    push        ebx
 006DAD91    push        esi
 006DAD92    mov         esi,edx
 006DAD94    mov         ebx,eax
 006DAD96    mov         eax,dword ptr [ebx+24];TIntersenseValue.Item:Integer
 006DAD99    sub         eax,1
>006DAD9C    jae         006DADAA
 006DAD9E    mov         edx,esi
 006DADA0    mov         eax,ebx
 006DADA2    call        TExpression.GetString
 006DADA7    pop         esi
 006DADA8    pop         ebx
 006DADA9    ret
 006DADAA    mov         edx,esi
 006DADAC    mov         eax,ebx
 006DADAE    call        TExpression.GetString
 006DADB3    pop         esi
 006DADB4    pop         ebx
 006DADB5    ret
end;*}

//006DADB8
function TIntersenseValue.GetUnits:TUnits;
begin
{*
 006DADB8    mov         eax,dword ptr [eax+24];TIntersenseValue.Item:Integer
 006DADBB    sub         eax,1
>006DADBE    jb          006DADCC
 006DADC0    sub         eax,3
>006DADC3    jb          006DADCF
 006DADC5    sub         eax,3
>006DADC8    jb          006DADD2
>006DADCA    jmp         006DADD5
 006DADCC    xor         eax,eax
 006DADCE    ret
 006DADCF    mov         al,5
 006DADD1    ret
 006DADD2    mov         al,18
 006DADD4    ret
 006DADD5    xor         eax,eax
 006DADD7    ret
*}
end;

//006DADD8
procedure TIntersenseValue.GetValue;
begin
{*
 006DADD8    push        ebx
 006DADD9    add         esp,0FFFFFFF4
 006DADDC    mov         edx,dword ptr [eax+18];TIntersenseValue....................................................
 006DADDF    test        edx,edx
>006DADE1    jle         006DADE8
 006DADE3    cmp         edx,8
>006DADE6    jle         006DADF6
 006DADE8    xor         eax,eax
 006DADEA    mov         dword ptr [esp],eax
 006DADED    mov         dword ptr [esp+4],eax
>006DADF1    jmp         006DB042
 006DADF6    mov         ecx,dword ptr [eax+24];TIntersenseValue.Item:Integer
 006DADF9    mov         ebx,ecx
 006DADFB    cmp         ebx,1C
>006DADFE    ja          006DB039
 006DAE04    movzx       ebx,byte ptr [ebx+6DAE12]
 006DAE0B    jmp         dword ptr [ebx*4+6DAE2F]
 006DAE0B    db          1
 006DAE0B    db          2
 006DAE0B    db          3
 006DAE0B    db          4
 006DAE0B    db          5
 006DAE0B    db          6
 006DAE0B    db          7
 006DAE0B    db          8
 006DAE0B    db          8
 006DAE0B    db          8
 006DAE0B    db          8
 006DAE0B    db          8
 006DAE0B    db          8
 006DAE0B    db          8
 006DAE0B    db          8
 006DAE0B    db          10
 006DAE0B    db          10
 006DAE0B    db          10
 006DAE0B    db          10
 006DAE0B    db          10
 006DAE0B    db          10
 006DAE0B    db          10
 006DAE0B    db          10
 006DAE0B    db          10
 006DAE0B    db          10
 006DAE0B    db          9
 006DAE0B    db          9
 006DAE0B    db          9
 006DAE0B    db          9
 006DAE0B    dd          006DB039
 006DAE0B    dd          006DAE5B
 006DAE0B    dd          006DAE84
 006DAE0B    dd          006DAEB2
 006DAE0B    dd          006DAEE0
 006DAE0B    dd          006DAF0E
 006DAE0B    dd          006DAF3C
 006DAE0B    dd          006DAF6A
 006DAE0B    dd          006DAF98
 006DAE0B    dd          006DAFD2
 006DAE0B    dd          006DB007
 006DAE5B    cmp         byte ptr ds:[81F961],0;gvar_0081F961
>006DAE62    jne         006DAE74
 006DAE64    xor         eax,eax
 006DAE66    call        00686074
 006DAE6B    fstp        qword ptr [esp]
 006DAE6E    wait
>006DAE6F    jmp         006DB042
 006DAE74    mov         al,1
 006DAE76    call        00686074
 006DAE7B    fstp        qword ptr [esp]
 006DAE7E    wait
>006DAE7F    jmp         006DB042
 006DAE84    cmp         byte ptr ds:[81F961],0;gvar_0081F961
>006DAE8B    jne         006DAE9B
 006DAE8D    xor         eax,eax
 006DAE8F    mov         dword ptr [esp],eax
 006DAE92    mov         dword ptr [esp+4],eax
>006DAE96    jmp         006DB042
 006DAE9B    mov         eax,edx
 006DAE9D    shl         eax,4
 006DAEA0    add         eax,edx
 006DAEA2    fld         dword ptr [eax*8+81FC4C]
 006DAEA9    fstp        qword ptr [esp]
 006DAEAC    wait
>006DAEAD    jmp         006DB042
 006DAEB2    cmp         byte ptr ds:[81F961],0;gvar_0081F961
>006DAEB9    jne         006DAEC9
 006DAEBB    xor         eax,eax
 006DAEBD    mov         dword ptr [esp],eax
 006DAEC0    mov         dword ptr [esp+4],eax
>006DAEC4    jmp         006DB042
 006DAEC9    mov         eax,edx
 006DAECB    shl         eax,4
 006DAECE    add         eax,edx
 006DAED0    fld         dword ptr [eax*8+81FC50]
 006DAED7    fstp        qword ptr [esp]
 006DAEDA    wait
>006DAEDB    jmp         006DB042
 006DAEE0    cmp         byte ptr ds:[81F961],0;gvar_0081F961
>006DAEE7    jne         006DAEF7
 006DAEE9    xor         eax,eax
 006DAEEB    mov         dword ptr [esp],eax
 006DAEEE    mov         dword ptr [esp+4],eax
>006DAEF2    jmp         006DB042
 006DAEF7    mov         eax,edx
 006DAEF9    shl         eax,4
 006DAEFC    add         eax,edx
 006DAEFE    fld         dword ptr [eax*8+81FC54]
 006DAF05    fstp        qword ptr [esp]
 006DAF08    wait
>006DAF09    jmp         006DB042
 006DAF0E    cmp         byte ptr ds:[81F961],0;gvar_0081F961
>006DAF15    jne         006DAF25
 006DAF17    xor         eax,eax
 006DAF19    mov         dword ptr [esp],eax
 006DAF1C    mov         dword ptr [esp+4],eax
>006DAF20    jmp         006DB042
 006DAF25    mov         eax,edx
 006DAF27    shl         eax,4
 006DAF2A    add         eax,edx
 006DAF2C    fld         dword ptr [eax*8+81FC3C]
 006DAF33    fstp        qword ptr [esp]
 006DAF36    wait
>006DAF37    jmp         006DB042
 006DAF3C    cmp         byte ptr ds:[81F961],0;gvar_0081F961
>006DAF43    jne         006DAF53
 006DAF45    xor         eax,eax
 006DAF47    mov         dword ptr [esp],eax
 006DAF4A    mov         dword ptr [esp+4],eax
>006DAF4E    jmp         006DB042
 006DAF53    mov         eax,edx
 006DAF55    shl         eax,4
 006DAF58    add         eax,edx
 006DAF5A    fld         dword ptr [eax*8+81FC40]
 006DAF61    fstp        qword ptr [esp]
 006DAF64    wait
>006DAF65    jmp         006DB042
 006DAF6A    cmp         byte ptr ds:[81F961],0;gvar_0081F961
>006DAF71    jne         006DAF81
 006DAF73    xor         eax,eax
 006DAF75    mov         dword ptr [esp],eax
 006DAF78    mov         dword ptr [esp+4],eax
>006DAF7C    jmp         006DB042
 006DAF81    mov         eax,edx
 006DAF83    shl         eax,4
 006DAF86    add         eax,edx
 006DAF88    fld         dword ptr [eax*8+81FC44]
 006DAF8F    fstp        qword ptr [esp]
 006DAF92    wait
>006DAF93    jmp         006DB042
 006DAF98    cmp         byte ptr ds:[81F961],0;gvar_0081F961
>006DAF9F    jne         006DAFB1
 006DAFA1    xor         eax,eax
 006DAFA3    call        00686074
 006DAFA8    fstp        qword ptr [esp]
 006DAFAB    wait
>006DAFAC    jmp         006DB042
 006DAFB1    mov         ebx,edx
 006DAFB3    shl         edx,4
 006DAFB6    add         edx,ebx
 006DAFB8    lea         edx,[edx*8+81FCC0];gvar_0081FCC0
 006DAFBF    cmp         dword ptr [edx+ecx*4-80],1
 006DAFC4    sbb         eax,eax
 006DAFC6    inc         eax
 006DAFC7    call        00686074
 006DAFCC    fstp        qword ptr [esp]
 006DAFCF    wait
>006DAFD0    jmp         006DB042
 006DAFD2    cmp         byte ptr ds:[81F961],0;gvar_0081F961
>006DAFD9    jne         006DAFE6
 006DAFDB    xor         eax,eax
 006DAFDD    mov         dword ptr [esp],eax
 006DAFE0    mov         dword ptr [esp+4],eax
>006DAFE4    jmp         006DB042
 006DAFE6    mov         ebx,edx
 006DAFE8    shl         edx,4
 006DAFEB    add         edx,ebx
 006DAFED    lea         edx,[edx*8+81FCC0];gvar_0081FCC0
 006DAFF4    movzx       eax,byte ptr [edx+ecx-49]
 006DAFF9    mov         dword ptr [esp+8],eax
 006DAFFD    fild        dword ptr [esp+8]
 006DB001    fstp        qword ptr [esp]
 006DB004    wait
>006DB005    jmp         006DB042
 006DB007    cmp         byte ptr ds:[81F961],0;gvar_0081F961
>006DB00E    jne         006DB01B
 006DB010    xor         eax,eax
 006DB012    mov         dword ptr [esp],eax
 006DB015    mov         dword ptr [esp+4],eax
>006DB019    jmp         006DB042
 006DB01B    mov         ebx,edx
 006DB01D    shl         edx,4
 006DB020    add         edx,ebx
 006DB022    lea         edx,[edx*8+81FCC0];gvar_0081FCC0
 006DB029    fild        word ptr [edx+ecx*2-62]
 006DB02D    fdiv        dword ptr ds:[6DB04C];32767:Single
 006DB033    fstp        qword ptr [esp]
 006DB036    wait
>006DB037    jmp         006DB042
 006DB039    xor         eax,eax
 006DB03B    mov         dword ptr [esp],eax
 006DB03E    mov         dword ptr [esp+4],eax
 006DB042    fld         qword ptr [esp]
 006DB045    add         esp,0C
 006DB048    pop         ebx
 006DB049    ret
*}
end;

//006DB050
procedure TIntersenseValue.SetValue(NewValue:Double);
begin
{*
 006DB050    push        ebp
 006DB051    mov         ebp,esp
 006DB053    mov         eax,dword ptr [eax+24];TIntersenseValue.Item:Integer
 006DB056    sub         eax,1
>006DB059    jae         006DB05F
 006DB05B    xor         eax,eax
>006DB05D    jmp         006DB061
 006DB05F    xor         eax,eax
 006DB061    pop         ebp
 006DB062    ret         8
*}
end;

//006DB068
{*procedure TIntersenseValue.ToString(?:?);
begin
 006DB068    push        ebp
 006DB069    mov         ebp,esp
 006DB06B    push        0
 006DB06D    push        0
 006DB06F    push        0
 006DB071    push        ebx
 006DB072    push        esi
 006DB073    push        edi
 006DB074    mov         esi,edx
 006DB076    mov         ebx,eax
 006DB078    xor         eax,eax
 006DB07A    push        ebp
 006DB07B    push        6DB0F5
 006DB080    push        dword ptr fs:[eax]
 006DB083    mov         dword ptr fs:[eax],esp
 006DB086    mov         edi,dword ptr [ebx+18];TIntersenseValue....................................................
 006DB089    test        edi,edi
>006DB08B    jle         006DB0C0
 006DB08D    push        6DB110;'Intersense'
 006DB092    lea         edx,[ebp-4]
 006DB095    mov         eax,edi
 006DB097    call        IntToStr
 006DB09C    push        dword ptr [ebp-4]
 006DB09F    push        6DB134;'.'
 006DB0A4    lea         edx,[ebp-8]
 006DB0A7    mov         eax,dword ptr [ebx+24];TIntersenseValue.Item:Integer
 006DB0AA    call        006DB2B0
 006DB0AF    push        dword ptr [ebp-8]
 006DB0B2    mov         eax,esi
 006DB0B4    mov         edx,4
 006DB0B9    call        @UStrCatN
>006DB0BE    jmp         006DB0DA
 006DB0C0    lea         edx,[ebp-0C]
 006DB0C3    mov         eax,dword ptr [ebx+24];TIntersenseValue.Item:Integer
 006DB0C6    call        006DB2B0
 006DB0CB    mov         ecx,dword ptr [ebp-0C]
 006DB0CE    mov         eax,esi
 006DB0D0    mov         edx,6DB144;'Intersense.'
 006DB0D5    call        @UStrCat3
 006DB0DA    xor         eax,eax
 006DB0DC    pop         edx
 006DB0DD    pop         ecx
 006DB0DE    pop         ecx
 006DB0DF    mov         dword ptr fs:[eax],edx
 006DB0E2    push        6DB0FC
 006DB0E7    lea         eax,[ebp-0C]
 006DB0EA    mov         edx,3
 006DB0EF    call        @UStrArrayClr
 006DB0F4    ret
>006DB0F5    jmp         @HandleFinally
>006DB0FA    jmp         006DB0E7
 006DB0FC    pop         edi
 006DB0FD    pop         esi
 006DB0FE    pop         ebx
 006DB0FF    mov         esp,ebp
 006DB101    pop         ebp
 006DB102    ret
end;*}

//006DB15C
procedure sub_006DB15C;
begin
{*
 006DB15C    mov         byte ptr ds:[81F960],0;gvar_0081F960
 006DB163    ret
*}
end;

//006DB164
procedure sub_006DB164;
begin
{*
 006DB164    ret
*}
end;

//006DB168
procedure sub_006DB168;
begin
{*
 006DB168    push        ebx
 006DB169    push        esi
 006DB16A    push        edi
 006DB16B    mov         byte ptr ds:[81F961],0;gvar_0081F961
 006DB172    cmp         byte ptr ds:[81F960],0;gvar_0081F960
>006DB179    je          006DB215
 006DB17F    push        0
 006DB181    xor         ecx,ecx
 006DB183    xor         edx,edx
 006DB185    xor         eax,eax
 006DB187    call        006DA3F0
 006DB18C    mov         [0081F968],eax;gvar_0081F968
 006DB191    cmp         dword ptr ds:[81F968],0FFFFFFFF;gvar_0081F968
>006DB198    je          006DB215
 006DB19A    cmp         dword ptr ds:[81F968],0;gvar_0081F968
>006DB1A1    je          006DB215
 006DB1A3    mov         byte ptr ds:[81F961],1;gvar_0081F961
 006DB1AA    mov         edx,81F96C;gvar_0081F96C
 006DB1AF    xor         ecx,ecx
 006DB1B1    mov         eax,[0081F968];gvar_0081F968
 006DB1B6    call        006DA4A4
 006DB1BB    cmp         dword ptr ds:[81F970],1;gvar_0081F970
>006DB1C2    jne         006DB215
 006DB1C4    mov         esi,1
 006DB1C9    mov         ebx,81F9C0;gvar_0081F9C0
 006DB1CE    push        0
 006DB1D0    mov         edx,ebx
 006DB1D2    mov         edi,esi
 006DB1D4    mov         ecx,edi
 006DB1D6    mov         eax,[0081F968];gvar_0081F968
 006DB1DB    call        006DA4E8
 006DB1E0    mov         dword ptr [ebx+1C],1
 006DB1E7    mov         dword ptr [ebx+20],0FFFFFFFF
 006DB1EE    mov         dword ptr [ebx+24],0FFFFFFFF
 006DB1F5    mov         dword ptr [ebx+54],0FFFFFFFF
 006DB1FC    push        0
 006DB1FE    mov         edx,ebx
 006DB200    mov         ecx,edi
 006DB202    mov         eax,[0081F968];gvar_0081F968
 006DB207    call        006DA4C0
 006DB20C    inc         esi
 006DB20D    add         ebx,60
 006DB210    cmp         esi,9
>006DB213    jne         006DB1CE
 006DB215    pop         edi
 006DB216    pop         esi
 006DB217    pop         ebx
 006DB218    ret
*}
end;

//006DB21C
procedure sub_006DB21C;
begin
{*
 006DB21C    movzx       eax,byte ptr ds:[81F960];gvar_0081F960
 006DB223    and         al,byte ptr ds:[81F961];gvar_0081F961
>006DB229    je          006DB239
 006DB22B    xor         eax,eax
 006DB22D    call        006DA438
 006DB232    mov         byte ptr ds:[81F961],0;gvar_0081F961
 006DB239    ret
*}
end;

//006DB23C
{*function sub_006DB23C:?;
begin
 006DB23C    movzx       eax,byte ptr ds:[81F960];gvar_0081F960
 006DB243    and         al,byte ptr ds:[81F961];gvar_0081F961
>006DB249    je          006DB25A
 006DB24B    mov         edx,81FCC0;gvar_0081FCC0
 006DB250    mov         eax,[0081F968];gvar_0081F968
 006DB255    call        006DA510
 006DB25A    mov         al,1
 006DB25C    ret
end;*}

//006DB260
{*function sub_006DB260(?:UnicodeString):?;
begin
 006DB260    push        ebp
 006DB261    mov         ebp,esp
 006DB263    push        ecx
 006DB264    push        ebx
 006DB265    mov         dword ptr [ebp-4],eax
 006DB268    mov         eax,dword ptr [ebp-4]
 006DB26B    call        @UStrAddRef
 006DB270    xor         eax,eax
 006DB272    push        ebp
 006DB273    push        6DB2A3
 006DB278    push        dword ptr fs:[eax]
 006DB27B    mov         dword ptr fs:[eax],esp
 006DB27E    mov         edx,dword ptr [ebp-4]
 006DB281    mov         eax,[0081F95C];gvar_0081F95C:THashTable
 006DB286    call        THashTable.Get
 006DB28B    mov         ebx,eax
 006DB28D    xor         eax,eax
 006DB28F    pop         edx
 006DB290    pop         ecx
 006DB291    pop         ecx
 006DB292    mov         dword ptr fs:[eax],edx
 006DB295    push        6DB2AA
 006DB29A    lea         eax,[ebp-4]
 006DB29D    call        @UStrClr
 006DB2A2    ret
>006DB2A3    jmp         @HandleFinally
>006DB2A8    jmp         006DB29A
 006DB2AA    mov         eax,ebx
 006DB2AC    pop         ebx
 006DB2AD    pop         ecx
 006DB2AE    pop         ebp
 006DB2AF    ret
end;*}

//006DB2B0
{*procedure sub_006DB2B0(?:Integer; ?:?);
begin
 006DB2B0    push        ebx
 006DB2B1    push        esi
 006DB2B2    mov         esi,edx
 006DB2B4    mov         ebx,eax
 006DB2B6    mov         ecx,esi
 006DB2B8    mov         edx,ebx
 006DB2BA    mov         eax,[0081F95C];gvar_0081F95C:THashTable
 006DB2BF    call        THashTable.Get
 006DB2C4    pop         esi
 006DB2C5    pop         ebx
 006DB2C6    ret
end;*}

//006DB2C8
{*function sub_006DB2C8:?;
begin
 006DB2C8    push        ebp
 006DB2C9    mov         ebp,esp
 006DB2CB    push        0
 006DB2CD    push        ebx
 006DB2CE    push        esi
 006DB2CF    xor         eax,eax
 006DB2D1    push        ebp
 006DB2D2    push        6DB32C
 006DB2D7    push        dword ptr fs:[eax]
 006DB2DA    mov         dword ptr fs:[eax],esp
 006DB2DD    mov         dl,1
 006DB2DF    mov         eax,[0043C7BC];TStringList
 006DB2E4    call        TStringList.Create;TStringList.Create
 006DB2E9    mov         esi,eax
 006DB2EB    mov         dl,1
 006DB2ED    mov         eax,esi
 006DB2EF    call        TStringList.SetSorted
 006DB2F4    xor         ebx,ebx
 006DB2F6    lea         edx,[ebp-4]
 006DB2F9    mov         eax,ebx
 006DB2FB    call        006DB2B0
 006DB300    cmp         dword ptr [ebp-4],0
>006DB304    je          006DB310
 006DB306    mov         edx,dword ptr [ebp-4]
 006DB309    mov         eax,esi
 006DB30B    mov         ecx,dword ptr [eax]
 006DB30D    call        dword ptr [ecx+38];TStringList.Add
 006DB310    inc         ebx
 006DB311    cmp         ebx,1D
>006DB314    jne         006DB2F6
 006DB316    xor         eax,eax
 006DB318    pop         edx
 006DB319    pop         ecx
 006DB31A    pop         ecx
 006DB31B    mov         dword ptr fs:[eax],edx
 006DB31E    push        6DB333
 006DB323    lea         eax,[ebp-4]
 006DB326    call        @UStrClr
 006DB32B    ret
>006DB32C    jmp         @HandleFinally
>006DB331    jmp         006DB323
 006DB333    mov         eax,esi
 006DB335    pop         esi
 006DB336    pop         ebx
 006DB337    pop         ecx
 006DB338    pop         ebp
 006DB339    ret
end;*}

//006DB33C
{*function sub_006DB33C:?;
begin
 006DB33C    push        ebx
 006DB33D    mov         dl,1
 006DB33F    mov         eax,[0043C7BC];TStringList
 006DB344    call        TStringList.Create;TStringList.Create
 006DB349    mov         ebx,eax
 006DB34B    mov         edx,6DB404;'Pos1'
 006DB350    mov         eax,ebx
 006DB352    mov         ecx,dword ptr [eax]
 006DB354    call        dword ptr [ecx+38];TStringList.Add
 006DB357    mov         edx,6DB41C;'Pos2'
 006DB35C    mov         eax,ebx
 006DB35E    mov         ecx,dword ptr [eax]
 006DB360    call        dword ptr [ecx+38];TStringList.Add
 006DB363    mov         edx,6DB434;'Pos3'
 006DB368    mov         eax,ebx
 006DB36A    mov         ecx,dword ptr [eax]
 006DB36C    call        dword ptr [ecx+38];TStringList.Add
 006DB36F    mov         edx,6DB44C;'Angle1'
 006DB374    mov         eax,ebx
 006DB376    mov         ecx,dword ptr [eax]
 006DB378    call        dword ptr [ecx+38];TStringList.Add
 006DB37B    mov         edx,6DB468;'Angle2'
 006DB380    mov         eax,ebx
 006DB382    mov         ecx,dword ptr [eax]
 006DB384    call        dword ptr [ecx+38];TStringList.Add
 006DB387    mov         edx,6DB484;'Angle3'
 006DB38C    mov         eax,ebx
 006DB38E    mov         ecx,dword ptr [eax]
 006DB390    call        dword ptr [ecx+38];TStringList.Add
 006DB393    mov         edx,6DB4A0;'Button1'
 006DB398    mov         eax,ebx
 006DB39A    mov         ecx,dword ptr [eax]
 006DB39C    call        dword ptr [ecx+38];TStringList.Add
 006DB39F    mov         edx,6DB4BC;'Button2'
 006DB3A4    mov         eax,ebx
 006DB3A6    mov         ecx,dword ptr [eax]
 006DB3A8    call        dword ptr [ecx+38];TStringList.Add
 006DB3AB    mov         edx,6DB4D8;'Button3'
 006DB3B0    mov         eax,ebx
 006DB3B2    mov         ecx,dword ptr [eax]
 006DB3B4    call        dword ptr [ecx+38];TStringList.Add
 006DB3B7    mov         edx,6DB4F4;'Button4'
 006DB3BC    mov         eax,ebx
 006DB3BE    mov         ecx,dword ptr [eax]
 006DB3C0    call        dword ptr [ecx+38];TStringList.Add
 006DB3C3    mov         edx,6DB510;'Button5'
 006DB3C8    mov         eax,ebx
 006DB3CA    mov         ecx,dword ptr [eax]
 006DB3CC    call        dword ptr [ecx+38];TStringList.Add
 006DB3CF    mov         edx,6DB52C;'Button6'
 006DB3D4    mov         eax,ebx
 006DB3D6    mov         ecx,dword ptr [eax]
 006DB3D8    call        dword ptr [ecx+38];TStringList.Add
 006DB3DB    mov         edx,6DB548;'JoystickX'
 006DB3E0    mov         eax,ebx
 006DB3E2    mov         ecx,dword ptr [eax]
 006DB3E4    call        dword ptr [ecx+38];TStringList.Add
 006DB3E7    mov         edx,6DB568;'JoystickY'
 006DB3EC    mov         eax,ebx
 006DB3EE    mov         ecx,dword ptr [eax]
 006DB3F0    call        dword ptr [ecx+38];TStringList.Add
 006DB3F3    mov         eax,ebx
 006DB3F5    pop         ebx
 006DB3F6    ret
end;*}

//006DB57C
{*function sub_006DB57C(?:?):?;
begin
 006DB57C    push        ebp
 006DB57D    mov         ebp,esp
 006DB57F    push        ecx
 006DB580    push        ebx
 006DB581    mov         dword ptr [ebp-4],eax
 006DB584    mov         eax,dword ptr [ebp-4]
 006DB587    call        @UStrAddRef
 006DB58C    xor         eax,eax
 006DB58E    push        ebp
 006DB58F    push        6DB5F5
 006DB594    push        dword ptr fs:[eax]
 006DB597    mov         dword ptr fs:[eax],esp
 006DB59A    lea         eax,[ebp-4]
 006DB59D    mov         edx,6DB610;'Intersense'
 006DB5A2    call        004F9BD0
 006DB5A7    test        al,al
>006DB5A9    jne         006DB5C0
 006DB5AB    lea         eax,[ebp-4]
 006DB5AE    mov         edx,6DB634;'ISense'
 006DB5B3    call        004F9BD0
 006DB5B8    test        al,al
>006DB5BA    jne         006DB5C0
 006DB5BC    xor         ebx,ebx
>006DB5BE    jmp         006DB5DF
 006DB5C0    lea         eax,[ebp-4]
 006DB5C3    call        004F9D00
 006DB5C8    lea         eax,[ebp-4]
 006DB5CB    mov         edx,6DB650;'.'
 006DB5D0    call        004F9BD0
 006DB5D5    test        al,al
>006DB5D7    jne         006DB5DD
 006DB5D9    xor         ebx,ebx
>006DB5DB    jmp         006DB5DF
 006DB5DD    mov         bl,1
 006DB5DF    xor         eax,eax
 006DB5E1    pop         edx
 006DB5E2    pop         ecx
 006DB5E3    pop         ecx
 006DB5E4    mov         dword ptr fs:[eax],edx
 006DB5E7    push        6DB5FC
 006DB5EC    lea         eax,[ebp-4]
 006DB5EF    call        @UStrClr
 006DB5F4    ret
>006DB5F5    jmp         @HandleFinally
>006DB5FA    jmp         006DB5EC
 006DB5FC    mov         eax,ebx
 006DB5FE    pop         ebx
 006DB5FF    pop         ecx
 006DB600    pop         ebp
 006DB601    ret
end;*}

Initialization
//00782928
{*
 00782928    sub         dword ptr ds:[81F964],1
>0078292F    jae         00782951
 00782931    mov         eax,782960;'Initializing PieIntersense'
 00782936    call        004FA5FC
 0078293B    mov         dl,1
 0078293D    mov         eax,[0067D4A4];THashTable
 00782942    call        THashTable.Create;THashTable.Create
 00782947    mov         [0081F95C],eax;gvar_0081F95C:THashTable
 0078294C    call        006DA8E8
 00782951    ret
*}
Finalization
end.