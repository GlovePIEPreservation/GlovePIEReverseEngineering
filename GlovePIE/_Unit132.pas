//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit132;

interface

uses
  SysUtils, Classes;

type
  CoNPCameraCollection = class(TObject)
  published
    //procedure CreateRemote(MachineName:string; ?:?);//006DEFD8
    //procedure Create(?:?);//006DEF74
  end;
  CoNPVector = class(TObject)
  published
    //procedure CreateRemote(MachineName:string; ?:?);//006DF0BC
    //procedure Create(?:?);//006DF058
  end;
  TTrackIRValue = class(TObjectValue)
  published
    function GetPerUnits1:TUnits;//006E1310
    function GetUnits:TUnits;//006E1594
    //procedure GetString(?:?);//006E1338
    procedure MakeReadWrite;//006E20D0
    procedure MakeWrite;//006E20DC
    function GetPerUnits2:TUnits;//006E1328
    procedure FillClone(c:TExpression);//006E1268
    //function SetValue(NewValue:Double; ?:?):Boolean;//006E215C
    function CanSet:Boolean;//006E1224
    function GetDataType:TDataType;//006E1288
    procedure CreateClone;//006E1258
    procedure GetValue;//006E15F8
    //procedure ToString(?:?);//006E2584
  public
    ..................................................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//006E2584
    procedure GetValue; virtual;//v2C//006E15F8
    //procedure GetString(?:?); virtual;//v38//006E1338
    function GetDataType:TDataType; virtual;//v44//006E1288
    function GetUnits:TUnits; virtual;//v48//006E1594
    function GetPerUnits1:TUnits; virtual;//v4C//006E1310
    function GetPerUnits2:TUnits; virtual;//v50//006E1328
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//006E215C
    function CanSet:Boolean; virtual;//v68//006E1224
    procedure CreateClone; virtual;//v80//006E1258
    procedure FillClone(c:TExpression); virtual;//v84//006E1268
    procedure MakeWrite; virtual;//v90//006E20DC
    procedure MakeReadWrite; virtual;//v94//006E20D0
  end;
    procedure sub_006DF13C;//006DF13C
    //procedure sub_006DF164(?:?);//006DF164
    //procedure sub_006DF330(?:?);//006DF330
    //procedure sub_006DF390(?:UString; ?:?);//006DF390
    procedure sub_006DF45C;//006DF45C
    procedure sub_006DF494;//006DF494
    //function sub_006DF5AC(?:?; ?:?):?;//006DF5AC
    //function sub_006DF648:?;//006DF648
    //function sub_006DF828(?:HWND):?;//006DF828
    //function sub_006DFCA8:?;//006DFCA8
    procedure sub_006E00E4;//006E00E4
    //function sub_006E0F7C(?:?):?;//006E0F7C
    procedure sub_006E266C;//006E266C
    procedure sub_006E26C0;//006E26C0
    procedure sub_006E26C4;//006E26C4
    procedure sub_006E29F4;//006E29F4
    procedure sub_006E2A34;//006E2A34
    //function sub_006E2BAC:?;//006E2BAC
    //function sub_006E2EFC(?:UnicodeString):?;//006E2EFC
    //procedure sub_006E2F4C(?:Integer; ?:?);//006E2F4C
    //function sub_006E2F64:?;//006E2F64
    //function sub_006E2FD8:?;//006E2FD8
    //function sub_006E30D8:?;//006E30D8
    //function sub_006E32BC:?;//006E32BC
    //function sub_006E33BC(?:?):?;//006E33BC

implementation

//006DEF74
{*procedure CoNPCameraCollection.Create(?:?);
begin
 006DEF74    push        ebp
 006DEF75    mov         ebp,esp
 006DEF77    push        0
 006DEF79    push        ebx
 006DEF7A    mov         ebx,edx
 006DEF7C    xor         eax,eax
 006DEF7E    push        ebp
 006DEF7F    push        6DEFBC
 006DEF84    push        dword ptr fs:[eax]
 006DEF87    mov         dword ptr fs:[eax],esp
 006DEF8A    lea         edx,[ebp-4]
 006DEF8D    mov         eax,78C2D4;['{1CA83C6F-70A6-40EB-836F-D9EEC0BD168F}']
 006DEF92    call        CreateComObject
 006DEF97    mov         edx,dword ptr [ebp-4]
 006DEF9A    mov         eax,ebx
 006DEF9C    mov         ecx,6DEFC8;['{28E501BB-FDD9-46CF-A112-741587110F0E}']
 006DEFA1    call        @IntfCast
 006DEFA6    xor         eax,eax
 006DEFA8    pop         edx
 006DEFA9    pop         ecx
 006DEFAA    pop         ecx
 006DEFAB    mov         dword ptr fs:[eax],edx
 006DEFAE    push        6DEFC3
 006DEFB3    lea         eax,[ebp-4]
 006DEFB6    call        @IntfClear
 006DEFBB    ret
>006DEFBC    jmp         @HandleFinally
>006DEFC1    jmp         006DEFB3
 006DEFC3    pop         ebx
 006DEFC4    pop         ecx
 006DEFC5    pop         ebp
 006DEFC6    ret
end;*}

//006DEFD8
{*procedure CoNPCameraCollection.CreateRemote(MachineName:string; ?:?);
begin
 006DEFD8    push        ebp
 006DEFD9    mov         ebp,esp
 006DEFDB    push        0
 006DEFDD    push        0
 006DEFDF    push        ebx
 006DEFE0    push        esi
 006DEFE1    mov         esi,ecx
 006DEFE3    mov         ebx,edx
 006DEFE5    xor         eax,eax
 006DEFE7    push        ebp
 006DEFE8    push        6DF03A
 006DEFED    push        dword ptr fs:[eax]
 006DEFF0    mov         dword ptr fs:[eax],esp
 006DEFF3    lea         eax,[ebp-8]
 006DEFF6    mov         edx,ebx
 006DEFF8    call        @WStrFromUStr
 006DEFFD    mov         eax,dword ptr [ebp-8]
 006DF000    lea         ecx,[ebp-4]
 006DF003    mov         edx,78C2D4;['{1CA83C6F-70A6-40EB-836F-D9EEC0BD168F}']
 006DF008    call        CreateRemoteComObject
 006DF00D    mov         edx,dword ptr [ebp-4]
 006DF010    mov         eax,esi
 006DF012    mov         ecx,6DF048;['{28E501BB-FDD9-46CF-A112-741587110F0E}']
 006DF017    call        @IntfCast
 006DF01C    xor         eax,eax
 006DF01E    pop         edx
 006DF01F    pop         ecx
 006DF020    pop         ecx
 006DF021    mov         dword ptr fs:[eax],edx
 006DF024    push        6DF041
 006DF029    lea         eax,[ebp-8]
 006DF02C    call        @WStrClr
 006DF031    lea         eax,[ebp-4]
 006DF034    call        @IntfClear
 006DF039    ret
>006DF03A    jmp         @HandleFinally
>006DF03F    jmp         006DF029
 006DF041    pop         esi
 006DF042    pop         ebx
 006DF043    pop         ecx
 006DF044    pop         ecx
 006DF045    pop         ebp
 006DF046    ret
end;*}

//006DF058
{*procedure CoNPVector.Create(?:?);
begin
 006DF058    push        ebp
 006DF059    mov         ebp,esp
 006DF05B    push        0
 006DF05D    push        ebx
 006DF05E    mov         ebx,edx
 006DF060    xor         eax,eax
 006DF062    push        ebp
 006DF063    push        6DF0A0
 006DF068    push        dword ptr fs:[eax]
 006DF06B    mov         dword ptr fs:[eax],esp
 006DF06E    lea         edx,[ebp-4]
 006DF071    mov         eax,78C2E4;['{FE7D5FB0-0560-49ED-BF49-CE9996C62A6B}']
 006DF076    call        CreateComObject
 006DF07B    mov         edx,dword ptr [ebp-4]
 006DF07E    mov         eax,ebx
 006DF080    mov         ecx,6DF0AC;['{9124C9A9-9296-4E89-973D-4F3C502E36CA}']
 006DF085    call        @IntfCast
 006DF08A    xor         eax,eax
 006DF08C    pop         edx
 006DF08D    pop         ecx
 006DF08E    pop         ecx
 006DF08F    mov         dword ptr fs:[eax],edx
 006DF092    push        6DF0A7
 006DF097    lea         eax,[ebp-4]
 006DF09A    call        @IntfClear
 006DF09F    ret
>006DF0A0    jmp         @HandleFinally
>006DF0A5    jmp         006DF097
 006DF0A7    pop         ebx
 006DF0A8    pop         ecx
 006DF0A9    pop         ebp
 006DF0AA    ret
end;*}

//006DF0BC
{*procedure CoNPVector.CreateRemote(MachineName:string; ?:?);
begin
 006DF0BC    push        ebp
 006DF0BD    mov         ebp,esp
 006DF0BF    push        0
 006DF0C1    push        0
 006DF0C3    push        ebx
 006DF0C4    push        esi
 006DF0C5    mov         esi,ecx
 006DF0C7    mov         ebx,edx
 006DF0C9    xor         eax,eax
 006DF0CB    push        ebp
 006DF0CC    push        6DF11E
 006DF0D1    push        dword ptr fs:[eax]
 006DF0D4    mov         dword ptr fs:[eax],esp
 006DF0D7    lea         eax,[ebp-8]
 006DF0DA    mov         edx,ebx
 006DF0DC    call        @WStrFromUStr
 006DF0E1    mov         eax,dword ptr [ebp-8]
 006DF0E4    lea         ecx,[ebp-4]
 006DF0E7    mov         edx,78C2E4;['{FE7D5FB0-0560-49ED-BF49-CE9996C62A6B}']
 006DF0EC    call        CreateRemoteComObject
 006DF0F1    mov         edx,dword ptr [ebp-4]
 006DF0F4    mov         eax,esi
 006DF0F6    mov         ecx,6DF12C;['{9124C9A9-9296-4E89-973D-4F3C502E36CA}']
 006DF0FB    call        @IntfCast
 006DF100    xor         eax,eax
 006DF102    pop         edx
 006DF103    pop         ecx
 006DF104    pop         ecx
 006DF105    mov         dword ptr fs:[eax],edx
 006DF108    push        6DF125
 006DF10D    lea         eax,[ebp-8]
 006DF110    call        @WStrClr
 006DF115    lea         eax,[ebp-4]
 006DF118    call        @IntfClear
 006DF11D    ret
>006DF11E    jmp         @HandleFinally
>006DF123    jmp         006DF10D
 006DF125    pop         esi
 006DF126    pop         ebx
 006DF127    pop         ecx
 006DF128    pop         ecx
 006DF129    pop         ebp
 006DF12A    ret
end;*}

//006DF13C
procedure sub_006DF13C;
begin
{*
 006DF13C    push        ebp
 006DF13D    mov         ebp,esp
 006DF13F    xor         eax,eax
 006DF141    push        ebp
 006DF142    push        6DF15B
 006DF147    push        dword ptr fs:[eax]
 006DF14A    mov         dword ptr fs:[eax],esp
 006DF14D    xor         eax,eax
 006DF14F    pop         edx
 006DF150    pop         ecx
 006DF151    pop         ecx
 006DF152    mov         dword ptr fs:[eax],edx
 006DF155    push        6DF162
 006DF15A    ret
>006DF15B    jmp         @HandleFinally
>006DF160    jmp         006DF15A
 006DF162    pop         ebp
 006DF163    ret
*}
end;

//006DF164
{*procedure sub_006DF164(?:?);
begin
 006DF164    push        ebp
 006DF165    mov         ebp,esp
 006DF167    xor         ecx,ecx
 006DF169    push        ecx
 006DF16A    push        ecx
 006DF16B    push        ecx
 006DF16C    push        ecx
 006DF16D    push        ecx
 006DF16E    mov         dword ptr [ebp-8],eax
 006DF171    xor         eax,eax
 006DF173    push        ebp
 006DF174    push        6DF273
 006DF179    push        dword ptr fs:[eax]
 006DF17C    mov         dword ptr fs:[eax],esp
 006DF17F    mov         dl,1
 006DF181    mov         eax,[0045C080];TRegistry
 006DF186    call        TRegistry.Create;TRegistry.Create
 006DF18B    mov         dword ptr [ebp-0C],eax
 006DF18E    xor         eax,eax
 006DF190    push        ebp
 006DF191    push        6DF23E
 006DF196    push        dword ptr fs:[eax]
 006DF199    mov         dword ptr fs:[eax],esp
 006DF19C    mov         edx,80000001
 006DF1A1    mov         eax,dword ptr [ebp-0C]
 006DF1A4    call        TRegistry.SetRootKey
 006DF1A9    xor         ecx,ecx
 006DF1AB    mov         edx,6DF28C;'Software\NaturalPoint\NATURALPOINT\NPClient Location'
 006DF1B0    mov         eax,dword ptr [ebp-0C]
 006DF1B3    call        TRegistry.OpenKey
 006DF1B8    test        al,al
>006DF1BA    je          006DF228
 006DF1BC    mov         edx,6DF304;'RealPath'
 006DF1C1    mov         eax,dword ptr [ebp-0C]
 006DF1C4    call        TRegistry.ValueExists
 006DF1C9    test        al,al
>006DF1CB    je          006DF1EA
 006DF1CD    lea         ecx,[ebp-10]
 006DF1D0    mov         edx,6DF304;'RealPath'
 006DF1D5    mov         eax,dword ptr [ebp-0C]
 006DF1D8    call        TRegistry.ReadString
 006DF1DD    mov         eax,dword ptr [ebp-10]
 006DF1E0    lea         edx,[ebp-4]
 006DF1E3    call        IncludeTrailingPathDelimiter
>006DF1E8    jmp         006DF220
 006DF1EA    mov         edx,6DF324;'Path'
 006DF1EF    mov         eax,dword ptr [ebp-0C]
 006DF1F2    call        TRegistry.ValueExists
 006DF1F7    test        al,al
>006DF1F9    je          006DF218
 006DF1FB    lea         ecx,[ebp-14]
 006DF1FE    mov         edx,6DF324;'Path'
 006DF203    mov         eax,dword ptr [ebp-0C]
 006DF206    call        TRegistry.ReadString
 006DF20B    mov         eax,dword ptr [ebp-14]
 006DF20E    lea         edx,[ebp-4]
 006DF211    call        IncludeTrailingPathDelimiter
>006DF216    jmp         006DF220
 006DF218    lea         eax,[ebp-4]
 006DF21B    call        @UStrClr
 006DF220    mov         eax,dword ptr [ebp-0C]
 006DF223    call        TRegistry.CloseKey
 006DF228    xor         eax,eax
 006DF22A    pop         edx
 006DF22B    pop         ecx
 006DF22C    pop         ecx
 006DF22D    mov         dword ptr fs:[eax],edx
 006DF230    push        6DF245
 006DF235    mov         eax,dword ptr [ebp-0C]
 006DF238    call        TObject.Free
 006DF23D    ret
>006DF23E    jmp         @HandleFinally
>006DF243    jmp         006DF235
 006DF245    mov         eax,dword ptr [ebp-8]
 006DF248    mov         edx,dword ptr [ebp-4]
 006DF24B    call        @UStrAsg
 006DF250    xor         eax,eax
 006DF252    pop         edx
 006DF253    pop         ecx
 006DF254    pop         ecx
 006DF255    mov         dword ptr fs:[eax],edx
 006DF258    push        6DF27A
 006DF25D    lea         eax,[ebp-14]
 006DF260    mov         edx,2
 006DF265    call        @UStrArrayClr
 006DF26A    lea         eax,[ebp-4]
 006DF26D    call        @UStrClr
 006DF272    ret
>006DF273    jmp         @HandleFinally
>006DF278    jmp         006DF25D
 006DF27A    mov         esp,ebp
 006DF27C    pop         ebp
 006DF27D    ret
end;*}

//006DF330
{*procedure sub_006DF330(?:?);
begin
 006DF330    push        ebp
 006DF331    mov         ebp,esp
 006DF333    push        0
 006DF335    push        0
 006DF337    push        ebx
 006DF338    mov         ebx,eax
 006DF33A    xor         eax,eax
 006DF33C    push        ebp
 006DF33D    push        6DF382
 006DF342    push        dword ptr fs:[eax]
 006DF345    mov         dword ptr fs:[eax],esp
 006DF348    lea         edx,[ebp-8]
 006DF34B    xor         eax,eax
 006DF34D    call        ParamStr
 006DF352    mov         eax,dword ptr [ebp-8]
 006DF355    lea         edx,[ebp-4]
 006DF358    call        ExtractFilePath
 006DF35D    mov         eax,dword ptr [ebp-4]
 006DF360    mov         edx,ebx
 006DF362    call        IncludeTrailingPathDelimiter
 006DF367    xor         eax,eax
 006DF369    pop         edx
 006DF36A    pop         ecx
 006DF36B    pop         ecx
 006DF36C    mov         dword ptr fs:[eax],edx
 006DF36F    push        6DF389
 006DF374    lea         eax,[ebp-8]
 006DF377    mov         edx,2
 006DF37C    call        @UStrArrayClr
 006DF381    ret
>006DF382    jmp         @HandleFinally
>006DF387    jmp         006DF374
 006DF389    pop         ebx
 006DF38A    pop         ecx
 006DF38B    pop         ecx
 006DF38C    pop         ebp
 006DF38D    ret
end;*}

//006DF390
{*procedure sub_006DF390(?:UString; ?:?);
begin
 006DF390    push        ebp
 006DF391    mov         ebp,esp
 006DF393    xor         ecx,ecx
 006DF395    push        ecx
 006DF396    push        ecx
 006DF397    push        ecx
 006DF398    push        ecx
 006DF399    push        ebx
 006DF39A    mov         ebx,edx
 006DF39C    mov         dword ptr [ebp-4],eax
 006DF39F    mov         eax,dword ptr [ebp-4]
 006DF3A2    call        @UStrAddRef
 006DF3A7    xor         eax,eax
 006DF3A9    push        ebp
 006DF3AA    push        6DF416
 006DF3AF    push        dword ptr fs:[eax]
 006DF3B2    mov         dword ptr fs:[eax],esp
 006DF3B5    push        dword ptr [ebp-4]
 006DF3B8    push        6DF430;' = '
 006DF3BD    lea         edx,[ebp-0C]
 006DF3C0    mov         eax,ebx
 006DF3C2    call        IntToStr
 006DF3C7    push        dword ptr [ebp-0C]
 006DF3CA    push        6DF444;' ('
 006DF3CF    lea         ecx,[ebp-10]
 006DF3D2    mov         edx,8
 006DF3D7    mov         eax,ebx
 006DF3D9    call        IntToHex
 006DF3DE    push        dword ptr [ebp-10]
 006DF3E1    push        6DF458;')'
 006DF3E6    lea         eax,[ebp-8]
 006DF3E9    mov         edx,6
 006DF3EE    call        @UStrCatN
 006DF3F3    mov         eax,dword ptr [ebp-8]
 006DF3F6    call        006DF13C
 006DF3FB    xor         eax,eax
 006DF3FD    pop         edx
 006DF3FE    pop         ecx
 006DF3FF    pop         ecx
 006DF400    mov         dword ptr fs:[eax],edx
 006DF403    push        6DF41D
 006DF408    lea         eax,[ebp-10]
 006DF40B    mov         edx,4
 006DF410    call        @UStrArrayClr
 006DF415    ret
>006DF416    jmp         @HandleFinally
>006DF41B    jmp         006DF408
 006DF41D    pop         ebx
 006DF41E    mov         esp,ebp
 006DF420    pop         ebp
 006DF421    ret
end;*}

//006DF45C
procedure sub_006DF45C;
begin
{*
 006DF45C    cmp         dword ptr ds:[8221C4],0;gvar_008221C4:HMODULE
>006DF463    je          006DF493
 006DF465    xor         eax,eax
 006DF467    mov         [00822168],eax;gvar_00822168
 006DF46C    xor         eax,eax
 006DF46E    mov         [0082216C],eax;gvar_0082216C
 006DF473    xor         eax,eax
 006DF475    mov         [00822170],eax;gvar_00822170
 006DF47A    xor         eax,eax
 006DF47C    mov         [00822174],eax;gvar_00822174
 006DF481    xor         eax,eax
 006DF483    mov         [008221BC],eax;gvar_008221BC
 006DF488    mov         eax,[008221C4];gvar_008221C4:HMODULE
 006DF48D    push        eax
 006DF48E    call        kernel32.FreeLibrary
 006DF493    ret
*}
end;

//006DF494
procedure sub_006DF494;
begin
{*
 006DF494    push        ebp
 006DF495    mov         ebp,esp
 006DF497    push        ebx
 006DF498    push        esi
 006DF499    push        edi
 006DF49A    cmp         dword ptr ds:[8221C0],0;gvar_008221C0:HMODULE
>006DF4A1    je          006DF56B
 006DF4A7    cmp         dword ptr ds:[822144],0;gvar_00822144
>006DF4AE    je          006DF4C2
 006DF4B0    call        dword ptr ds:[822144]
 006DF4B6    mov         edx,eax
 006DF4B8    mov         eax,6DF57C;'Stop'
 006DF4BD    call        006DF390
 006DF4C2    cmp         dword ptr ds:[822158],0;gvar_00822158
>006DF4C9    je          006DF4DD
 006DF4CB    call        dword ptr ds:[822158]
 006DF4D1    mov         edx,eax
 006DF4D3    mov         eax,6DF594;'Unregister'
 006DF4D8    call        006DF390
 006DF4DD    xor         eax,eax
 006DF4DF    mov         [0082213C],eax;gvar_0082213C
 006DF4E4    xor         eax,eax
 006DF4E6    mov         [00822140],eax;gvar_00822140
 006DF4EB    xor         eax,eax
 006DF4ED    mov         [00822144],eax;gvar_00822144
 006DF4F2    xor         eax,eax
 006DF4F4    mov         [00822148],eax;gvar_00822148
 006DF4F9    xor         eax,eax
 006DF4FB    mov         [0082214C],eax;gvar_0082214C
 006DF500    xor         eax,eax
 006DF502    mov         [00822150],eax;gvar_00822150
 006DF507    xor         eax,eax
 006DF509    mov         [00822154],eax;gvar_00822154
 006DF50E    xor         eax,eax
 006DF510    mov         [00822158],eax;gvar_00822158
 006DF515    xor         eax,eax
 006DF517    mov         [0082215C],eax;gvar_0082215C
 006DF51C    xor         eax,eax
 006DF51E    mov         [00822160],eax;gvar_00822160
 006DF523    xor         eax,eax
 006DF525    mov         [00822164],eax;gvar_00822164
 006DF52A    xor         edx,edx
 006DF52C    push        ebp
 006DF52D    push        6DF54D
 006DF532    push        dword ptr fs:[edx]
 006DF535    mov         dword ptr fs:[edx],esp
 006DF538    mov         eax,[008221C0];gvar_008221C0:HMODULE
 006DF53D    push        eax
 006DF53E    call        kernel32.FreeLibrary
 006DF543    xor         eax,eax
 006DF545    pop         edx
 006DF546    pop         ecx
 006DF547    pop         ecx
 006DF548    mov         dword ptr fs:[eax],edx
>006DF54B    jmp         006DF56B
>006DF54D    jmp         @HandleOnException
 006DF552    dd          1
 006DF556    dd          00418C04;Exception
 006DF55A    dd          006DF55E
 006DF55E    mov         eax,dword ptr [eax+4];Exception.FMessage:string
 006DF561    call        006DF13C
 006DF566    call        @DoneExcept
 006DF56B    pop         edi
 006DF56C    pop         esi
 006DF56D    pop         ebx
 006DF56E    pop         ebp
 006DF56F    ret
*}
end;

//006DF5AC
{*function sub_006DF5AC(?:?; ?:?):?;
begin
 006DF5AC    push        ebp
 006DF5AD    mov         ebp,esp
 006DF5AF    push        0
 006DF5B1    push        0
 006DF5B3    push        0
 006DF5B5    push        ebx
 006DF5B6    push        esi
 006DF5B7    mov         ebx,edx
 006DF5B9    xor         edx,edx
 006DF5BB    push        ebp
 006DF5BC    push        6DF623
 006DF5C1    push        dword ptr fs:[edx]
 006DF5C4    mov         dword ptr fs:[edx],esp
 006DF5C7    push        ebx
 006DF5C8    push        eax
 006DF5C9    call        GetProcAddress
 006DF5CE    mov         esi,eax
 006DF5D0    lea         eax,[ebp-8]
 006DF5D3    mov         edx,ebx
 006DF5D5    call        @UStrFromPWChar
 006DF5DA    push        dword ptr [ebp-8]
 006DF5DD    push        6DF640;' = '
 006DF5E2    mov         eax,esi
 006DF5E4    xor         edx,edx
 006DF5E6    push        edx
 006DF5E7    push        eax
 006DF5E8    lea         eax,[ebp-0C]
 006DF5EB    call        IntToStr
 006DF5F0    push        dword ptr [ebp-0C]
 006DF5F3    lea         eax,[ebp-4]
 006DF5F6    mov         edx,3
 006DF5FB    call        @UStrCatN
 006DF600    mov         eax,dword ptr [ebp-4]
 006DF603    call        006DF13C
 006DF608    xor         eax,eax
 006DF60A    pop         edx
 006DF60B    pop         ecx
 006DF60C    pop         ecx
 006DF60D    mov         dword ptr fs:[eax],edx
 006DF610    push        6DF62A
 006DF615    lea         eax,[ebp-0C]
 006DF618    mov         edx,3
 006DF61D    call        @UStrArrayClr
 006DF622    ret
>006DF623    jmp         @HandleFinally
>006DF628    jmp         006DF615
 006DF62A    mov         eax,esi
 006DF62C    pop         esi
 006DF62D    pop         ebx
 006DF62E    mov         esp,ebp
 006DF630    pop         ebp
 006DF631    ret
end;*}

//006DF648
{*function sub_006DF648:?;
begin
 006DF648    push        ebp
 006DF649    mov         ebp,esp
 006DF64B    push        0
 006DF64D    push        ebx
 006DF64E    push        esi
 006DF64F    mov         esi,8221C4;gvar_008221C4:HMODULE
 006DF654    xor         eax,eax
 006DF656    push        ebp
 006DF657    push        6DF71D
 006DF65C    push        dword ptr fs:[eax]
 006DF65F    mov         dword ptr fs:[eax],esp
 006DF662    lea         eax,[ebp-4]
 006DF665    call        006DF330
 006DF66A    lea         eax,[ebp-4]
 006DF66D    mov         edx,6DF738;'NPClient.dll'
 006DF672    call        @UStrCat
 006DF677    mov         eax,dword ptr [ebp-4]
 006DF67A    mov         edx,8000
 006DF67F    call        SafeLoadLibrary
 006DF684    mov         dword ptr [esi],eax
 006DF686    cmp         dword ptr [esi],0
>006DF689    jne         006DF69E
 006DF68B    mov         eax,6DF760;'Unable to load fake NPClient.dll'
 006DF690    call        006DF13C
 006DF695    call        006DF45C
 006DF69A    xor         ebx,ebx
>006DF69C    jmp         006DF707
 006DF69E    mov         bl,1
 006DF6A0    mov         edx,6DF7A4
 006DF6A5    mov         eax,dword ptr [esi]
 006DF6A7    call        006DF5AC
 006DF6AC    mov         [00822168],eax;gvar_00822168
 006DF6B1    mov         edx,6DF7C4
 006DF6B6    mov         eax,dword ptr [esi]
 006DF6B8    call        006DF5AC
 006DF6BD    mov         [0082216C],eax;gvar_0082216C
 006DF6C2    mov         edx,6DF7DC
 006DF6C7    mov         eax,dword ptr [esi]
 006DF6C9    call        006DF5AC
 006DF6CE    mov         [00822170],eax;gvar_00822170
 006DF6D3    mov         edx,6DF800
 006DF6D8    mov         eax,dword ptr [esi]
 006DF6DA    call        006DF5AC
 006DF6DF    mov         [00822174],eax;gvar_00822174
 006DF6E4    cmp         dword ptr ds:[822170],0;gvar_00822170
>006DF6EB    je          006DF6F3
 006DF6ED    call        dword ptr ds:[822170]
 006DF6F3    cmp         dword ptr ds:[822168],0;gvar_00822168
>006DF6FA    je          006DF707
 006DF6FC    call        dword ptr ds:[822168]
 006DF702    mov         [008221BC],eax;gvar_008221BC
 006DF707    xor         eax,eax
 006DF709    pop         edx
 006DF70A    pop         ecx
 006DF70B    pop         ecx
 006DF70C    mov         dword ptr fs:[eax],edx
 006DF70F    push        6DF724
 006DF714    lea         eax,[ebp-4]
 006DF717    call        @UStrClr
 006DF71C    ret
>006DF71D    jmp         @HandleFinally
>006DF722    jmp         006DF714
 006DF724    mov         eax,ebx
 006DF726    pop         esi
 006DF727    pop         ebx
 006DF728    pop         ecx
 006DF729    pop         ebp
 006DF72A    ret
end;*}

//006DF828
{*function sub_006DF828(?:HWND):?;
begin
 006DF828    push        ebp
 006DF829    mov         ebp,esp
 006DF82B    push        0
 006DF82D    push        0
 006DF82F    push        0
 006DF831    push        ebx
 006DF832    push        esi
 006DF833    push        edi
 006DF834    mov         edi,eax
 006DF836    mov         esi,8221C0;gvar_008221C0:HMODULE
 006DF83B    xor         eax,eax
 006DF83D    push        ebp
 006DF83E    push        6DFA0E
 006DF843    push        dword ptr fs:[eax]
 006DF846    mov         dword ptr fs:[eax],esp
 006DF849    lea         eax,[ebp-4]
 006DF84C    call        006DF164
 006DF851    lea         eax,[ebp-0C]
 006DF854    mov         ecx,6DFA2C;'NPClient.dll'
 006DF859    mov         edx,dword ptr [ebp-4]
 006DF85C    call        @UStrCat3
 006DF861    mov         eax,dword ptr [ebp-0C]
 006DF864    mov         edx,8000
 006DF869    call        SafeLoadLibrary
 006DF86E    mov         dword ptr [esi],eax
 006DF870    cmp         dword ptr [esi],0
>006DF873    jne         006DF886
 006DF875    mov         edx,8000
 006DF87A    mov         eax,6DFA2C;'NPClient.dll'
 006DF87F    call        SafeLoadLibrary
 006DF884    mov         dword ptr [esi],eax
 006DF886    cmp         dword ptr [esi],0
>006DF889    jne         006DF892
 006DF88B    xor         ebx,ebx
>006DF88D    jmp         006DF9F0
 006DF892    mov         bl,1
 006DF894    mov         edx,6DFA48
 006DF899    mov         eax,dword ptr [esi]
 006DF89B    call        006DF5AC
 006DF8A0    mov         [0082213C],eax;gvar_0082213C
 006DF8A5    mov         edx,6DFA68
 006DF8AA    mov         eax,dword ptr [esi]
 006DF8AC    call        006DF5AC
 006DF8B1    mov         [00822140],eax;gvar_00822140
 006DF8B6    mov         edx,6DFA98
 006DF8BB    mov         eax,dword ptr [esi]
 006DF8BD    call        006DF5AC
 006DF8C2    mov         [00822144],eax;gvar_00822144
 006DF8C7    mov         edx,6DFAC8
 006DF8CC    mov         eax,dword ptr [esi]
 006DF8CE    call        006DF5AC
 006DF8D3    mov         [00822148],eax;gvar_00822148
 006DF8D8    mov         edx,6DFAE4
 006DF8DD    mov         eax,dword ptr [esi]
 006DF8DF    call        006DF5AC
 006DF8E4    mov         [0082214C],eax;gvar_0082214C
 006DF8E9    mov         edx,6DFB18
 006DF8EE    mov         eax,dword ptr [esi]
 006DF8F0    call        006DF5AC
 006DF8F5    mov         [00822150],eax;gvar_00822150
 006DF8FA    mov         edx,6DFB38
 006DF8FF    mov         eax,dword ptr [esi]
 006DF901    call        006DF5AC
 006DF906    mov         [00822154],eax;gvar_00822154
 006DF90B    mov         edx,6DFB58
 006DF910    mov         eax,dword ptr [esi]
 006DF912    call        006DF5AC
 006DF917    mov         [00822158],eax;gvar_00822158
 006DF91C    mov         edx,6DFB8C
 006DF921    mov         eax,dword ptr [esi]
 006DF923    call        006DF5AC
 006DF928    mov         [0082215C],eax;gvar_0082215C
 006DF92D    mov         edx,6DFBC4
 006DF932    mov         eax,dword ptr [esi]
 006DF934    call        006DF5AC
 006DF939    mov         [00822160],eax;gvar_00822160
 006DF93E    mov         edx,6DFBE4
 006DF943    mov         eax,dword ptr [esi]
 006DF945    call        006DF5AC
 006DF94A    mov         [00822164],eax;gvar_00822164
 006DF94F    cmp         dword ptr ds:[822140],0;gvar_00822140
>006DF956    je          006DF96B
 006DF958    push        edi
 006DF959    call        dword ptr ds:[822140]
 006DF95F    mov         edx,eax
 006DF961    mov         eax,6DFC08;'Register'
 006DF966    call        006DF390
 006DF96B    cmp         dword ptr ds:[822160],0;gvar_00822160
>006DF972    je          006DF98A
 006DF974    lea         eax,[ebp-6]
 006DF977    push        eax
 006DF978    call        dword ptr ds:[822160]
 006DF97E    mov         edx,eax
 006DF980    mov         eax,6DFC28;'QueryVersion'
 006DF985    call        006DF390
 006DF98A    movzx       edx,word ptr [ebp-6]
 006DF98E    mov         eax,6DFC50;'version'
 006DF993    call        006DF390
 006DF998    cmp         dword ptr ds:[822154],0;gvar_00822154
>006DF99F    je          006DF9B5
 006DF9A1    push        77
 006DF9A3    call        dword ptr ds:[822154]
 006DF9A9    mov         edx,eax
 006DF9AB    mov         eax,6DFC6C;'Req'
 006DF9B0    call        006DF390
 006DF9B5    cmp         dword ptr ds:[82215C],0;gvar_0082215C
>006DF9BC    je          006DF9D5
 006DF9BE    push        3E81
 006DF9C3    call        dword ptr ds:[82215C]
 006DF9C9    mov         edx,eax
 006DF9CB    mov         eax,6DFC80;'RegProf'
 006DF9D0    call        006DF390
 006DF9D5    cmp         dword ptr ds:[82214C],0;gvar_0082214C
>006DF9DC    je          006DF9F0
 006DF9DE    call        dword ptr ds:[82214C]
 006DF9E4    mov         edx,eax
 006DF9E6    mov         eax,6DFC9C;'Start'
 006DF9EB    call        006DF390
 006DF9F0    xor         eax,eax
 006DF9F2    pop         edx
 006DF9F3    pop         ecx
 006DF9F4    pop         ecx
 006DF9F5    mov         dword ptr fs:[eax],edx
 006DF9F8    push        6DFA15
 006DF9FD    lea         eax,[ebp-0C]
 006DFA00    call        @UStrClr
 006DFA05    lea         eax,[ebp-4]
 006DFA08    call        @UStrClr
 006DFA0D    ret
>006DFA0E    jmp         @HandleFinally
>006DFA13    jmp         006DF9FD
 006DFA15    mov         eax,ebx
 006DFA17    pop         edi
 006DFA18    pop         esi
 006DFA19    pop         ebx
 006DFA1A    mov         esp,ebp
 006DFA1C    pop         ebp
 006DFA1D    ret
end;*}

//006DFCA8
{*function sub_006DFCA8:?;
begin
 006DFCA8    cmp         dword ptr ds:[822164],0;gvar_00822164
>006DFCAF    je          006DFCC2
 006DFCB1    push        822178;gvar_00822178:Pointer
 006DFCB6    call        dword ptr ds:[822164]
 006DFCBC    test        eax,eax
 006DFCBE    sete        al
 006DFCC1    ret
 006DFCC2    mov         eax,822178;gvar_00822178:Pointer
 006DFCC7    xor         ecx,ecx
 006DFCC9    mov         edx,44
 006DFCCE    call        @FillChar
 006DFCD3    xor         eax,eax
 006DFCD5    ret
end;*}

//006E00E4
procedure sub_006E00E4;
begin
{*
 006E00E4    push        ebp
 006E00E5    mov         ebp,esp
 006E00E7    mov         ecx,6
 006E00EC    push        0
 006E00EE    push        0
 006E00F0    dec         ecx
>006E00F1    jne         006E00EC
 006E00F3    push        ebx
 006E00F4    push        esi
 006E00F5    push        edi
 006E00F6    mov         esi,8221C8;gvar_008221C8:THashTable
 006E00FB    xor         eax,eax
 006E00FD    push        ebp
 006E00FE    push        6E06C7
 006E0103    push        dword ptr fs:[eax]
 006E0106    mov         dword ptr fs:[eax],esp
 006E0109    xor         ecx,ecx
 006E010B    mov         edx,6E06E4;'Exists'
 006E0110    mov         eax,dword ptr [esi]
 006E0112    call        THashTable.Add
 006E0117    mov         ecx,2
 006E011C    mov         edx,6E0700;'DriverInstalled'
 006E0121    mov         eax,dword ptr [esi]
 006E0123    call        THashTable.Add
 006E0128    mov         ecx,1
 006E012D    mov         edx,6E072C;'Count'
 006E0132    mov         eax,dword ptr [esi]
 006E0134    call        THashTable.Add
 006E0139    mov         ecx,3
 006E013E    mov         edx,6E0744;'Serial'
 006E0143    mov         eax,dword ptr [esi]
 006E0145    call        THashTable.Add
 006E014A    mov         ecx,3
 006E014F    mov         edx,6E0760;'SerialNumber'
 006E0154    mov         eax,dword ptr [esi]
 006E0156    call        THashTable.Add
 006E015B    mov         ecx,4
 006E0160    mov         edx,6E0788;'ModelNumber'
 006E0165    mov         eax,dword ptr [esi]
 006E0167    call        THashTable.Add
 006E016C    mov         ecx,5
 006E0171    mov         edx,6E07AC;'ModelName'
 006E0176    mov         eax,dword ptr [esi]
 006E0178    call        THashTable.Add
 006E017D    mov         ecx,6
 006E0182    mov         edx,6E07CC;'RevisionNumber'
 006E0187    mov         eax,dword ptr [esi]
 006E0189    call        THashTable.Add
 006E018E    mov         ecx,7
 006E0193    mov         edx,6E07F8;'RevisionName'
 006E0198    mov         eax,dword ptr [esi]
 006E019A    call        THashTable.Add
 006E019F    mov         ecx,8
 006E01A4    mov         edx,6E0820;'Width'
 006E01A9    mov         eax,dword ptr [esi]
 006E01AB    call        THashTable.Add
 006E01B0    mov         ecx,9
 006E01B5    mov         edx,6E0838;'Height'
 006E01BA    mov         eax,dword ptr [esi]
 006E01BC    call        THashTable.Add
 006E01C1    mov         ecx,0A
 006E01C6    mov         edx,6E0854;'FrameRate'
 006E01CB    mov         eax,dword ptr [esi]
 006E01CD    call        THashTable.Add
 006E01D2    mov         ecx,0B
 006E01D7    mov         edx,6E0874;'Illumination'
 006E01DC    mov         eax,dword ptr [esi]
 006E01DE    call        THashTable.Add
 006E01E3    mov         ecx,0B
 006E01E8    mov         edx,6E089C;'IlluminationLed'
 006E01ED    mov         eax,dword ptr [esi]
 006E01EF    call        THashTable.Add
 006E01F4    mov         ecx,0B
 006E01F9    mov         edx,6E08C8;'LED1'
 006E01FE    mov         eax,dword ptr [esi]
 006E0200    call        THashTable.Add
 006E0205    mov         ecx,0C
 006E020A    mov         edx,6E08E0;'GreenLed'
 006E020F    mov         eax,dword ptr [esi]
 006E0211    call        THashTable.Add
 006E0216    mov         ecx,0C
 006E021B    mov         edx,6E0900;'StatusLed'
 006E0220    mov         eax,dword ptr [esi]
 006E0222    call        THashTable.Add
 006E0227    mov         ecx,0C
 006E022C    mov         edx,6E0920;'LED2'
 006E0231    mov         eax,dword ptr [esi]
 006E0233    call        THashTable.Add
 006E0238    mov         ecx,0D
 006E023D    mov         edx,6E0938;'RedLed'
 006E0242    mov         eax,dword ptr [esi]
 006E0244    call        THashTable.Add
 006E0249    mov         ecx,0D
 006E024E    mov         edx,6E0954;'LED3'
 006E0253    mov         eax,dword ptr [esi]
 006E0255    call        THashTable.Add
 006E025A    mov         ecx,0E
 006E025F    mov         edx,6E096C;'BlueLed'
 006E0264    mov         eax,dword ptr [esi]
 006E0266    call        THashTable.Add
 006E026B    mov         ecx,0E
 006E0270    mov         edx,6E0988;'LED4'
 006E0275    mov         eax,dword ptr [esi]
 006E0277    call        THashTable.Add
 006E027C    mov         ecx,0F
 006E0281    mov         edx,6E09A0;'DotCount'
 006E0286    mov         eax,dword ptr [esi]
 006E0288    call        THashTable.Add
 006E028D    mov         ecx,10
 006E0292    mov         edx,6E09C0;'SwitchState'
 006E0297    mov         eax,dword ptr [esi]
 006E0299    call        THashTable.Add
 006E029E    mov         ecx,11
 006E02A3    mov         edx,6E09E4;'VectorClipX'
 006E02A8    mov         eax,dword ptr [esi]
 006E02AA    call        THashTable.Add
 006E02AF    mov         ecx,12
 006E02B4    mov         edx,6E0A08;'VectorClipY'
 006E02B9    mov         eax,dword ptr [esi]
 006E02BB    call        THashTable.Add
 006E02C0    mov         ecx,13
 006E02C5    mov         edx,6E0A2C;'VectorClipZ'
 006E02CA    mov         eax,dword ptr [esi]
 006E02CC    call        THashTable.Add
 006E02D1    mov         ecx,14
 006E02D6    mov         edx,6E0A50;'VectorClipYaw'
 006E02DB    mov         eax,dword ptr [esi]
 006E02DD    call        THashTable.Add
 006E02E2    mov         ecx,15
 006E02E7    mov         edx,6E0A78;'VectorClipPitch'
 006E02EC    mov         eax,dword ptr [esi]
 006E02EE    call        THashTable.Add
 006E02F3    mov         ecx,16
 006E02F8    mov         edx,6E0AA4;'VectorClipRoll'
 006E02FD    mov         eax,dword ptr [esi]
 006E02FF    call        THashTable.Add
 006E0304    mov         ecx,17
 006E0309    mov         edx,6E0AD0;^338:Single
 006E030E    mov         eax,dword ptr [esi]
 006E0310    call        THashTable.Add
 006E0315    mov         ecx,18
 006E031A    mov         edx,6E0AEC;^338:Single
 006E031F    mov         eax,dword ptr [esi]
 006E0321    call        THashTable.Add
 006E0326    mov         ecx,19
 006E032B    mov         edx,6E0B08;^338:Single
 006E0330    mov         eax,dword ptr [esi]
 006E0332    call        THashTable.Add
 006E0337    mov         ecx,1A
 006E033C    mov         edx,6E0B24;^338:Single
 006E0341    mov         eax,dword ptr [esi]
 006E0343    call        THashTable.Add
 006E0348    mov         ecx,1B
 006E034D    mov         edx,6E0B40;'AllDotsVisible'
 006E0352    mov         eax,dword ptr [esi]
 006E0354    call        THashTable.Add
 006E0359    mov         ecx,1B
 006E035E    mov         edx,6E0B6C;'AllLedsVisible'
 006E0363    mov         eax,dword ptr [esi]
 006E0365    call        THashTable.Add
 006E036A    xor         ebx,ebx
 006E036C    push        6E0B98;'Dot'
 006E0371    lea         edx,[ebp-8]
 006E0374    mov         eax,ebx
 006E0376    call        IntToStr
 006E037B    push        dword ptr [ebp-8]
 006E037E    push        6E0BAC;'x'
 006E0383    lea         eax,[ebp-4]
 006E0386    mov         edx,3
 006E038B    call        @UStrCatN
 006E0390    mov         edx,dword ptr [ebp-4]
 006E0393    lea         edi,[ebx+1C]
 006E0396    mov         ecx,edi
 006E0398    mov         eax,dword ptr [esi]
 006E039A    call        THashTable.Add
 006E039F    push        6E0B98;'Dot'
 006E03A4    lea         edx,[ebp-10]
 006E03A7    mov         eax,ebx
 006E03A9    call        IntToStr
 006E03AE    push        dword ptr [ebp-10]
 006E03B1    push        6E0BBC;'y'
 006E03B6    lea         eax,[ebp-0C]
 006E03B9    mov         edx,3
 006E03BE    call        @UStrCatN
 006E03C3    mov         edx,dword ptr [ebp-0C]
 006E03C6    lea         ecx,[ebx+1F]
 006E03C9    mov         eax,dword ptr [esi]
 006E03CB    call        THashTable.Add
 006E03D0    push        6E0B98;'Dot'
 006E03D5    lea         edx,[ebp-18]
 006E03D8    mov         eax,ebx
 006E03DA    call        IntToStr
 006E03DF    push        dword ptr [ebp-18]
 006E03E2    push        6E0BCC;'z'
 006E03E7    lea         eax,[ebp-14]
 006E03EA    mov         edx,3
 006E03EF    call        @UStrCatN
 006E03F4    mov         edx,dword ptr [ebp-14]
 006E03F7    lea         ecx,[ebx+22]
 006E03FA    mov         eax,dword ptr [esi]
 006E03FC    call        THashTable.Add
 006E0401    push        6E0BDC;'Led'
 006E0406    lea         edx,[ebp-20]
 006E0409    mov         eax,ebx
 006E040B    call        IntToStr
 006E0410    push        dword ptr [ebp-20]
 006E0413    push        6E0BAC;'x'
 006E0418    lea         eax,[ebp-1C]
 006E041B    mov         edx,3
 006E0420    call        @UStrCatN
 006E0425    mov         edx,dword ptr [ebp-1C]
 006E0428    mov         ecx,edi
 006E042A    mov         eax,dword ptr [esi]
 006E042C    call        THashTable.Add
 006E0431    push        6E0BDC;'Led'
 006E0436    lea         edx,[ebp-28]
 006E0439    mov         eax,ebx
 006E043B    call        IntToStr
 006E0440    push        dword ptr [ebp-28]
 006E0443    push        6E0BBC;'y'
 006E0448    lea         eax,[ebp-24]
 006E044B    mov         edx,3
 006E0450    call        @UStrCatN
 006E0455    mov         edx,dword ptr [ebp-24]
 006E0458    lea         ecx,[ebx+1F]
 006E045B    mov         eax,dword ptr [esi]
 006E045D    call        THashTable.Add
 006E0462    push        6E0BDC;'Led'
 006E0467    lea         edx,[ebp-30]
 006E046A    mov         eax,ebx
 006E046C    call        IntToStr
 006E0471    push        dword ptr [ebp-30]
 006E0474    push        6E0BCC;'z'
 006E0479    lea         eax,[ebp-2C]
 006E047C    mov         edx,3
 006E0481    call        @UStrCatN
 006E0486    mov         edx,dword ptr [ebp-2C]
 006E0489    lea         ecx,[ebx+22]
 006E048C    mov         eax,dword ptr [esi]
 006E048E    call        THashTable.Add
 006E0493    inc         ebx
 006E0494    cmp         ebx,3
>006E0497    jne         006E036C
 006E049D    mov         ecx,29
 006E04A2    mov         edx,6E0BF0;'FakeYaw'
 006E04A7    mov         eax,dword ptr [esi]
 006E04A9    call        THashTable.Add
 006E04AE    mov         ecx,28
 006E04B3    mov         edx,6E0C0C;'FakePitch'
 006E04B8    mov         eax,dword ptr [esi]
 006E04BA    call        THashTable.Add
 006E04BF    mov         ecx,2A
 006E04C4    mov         edx,6E0C2C;'FakeRoll'
 006E04C9    mov         eax,dword ptr [esi]
 006E04CB    call        THashTable.Add
 006E04D0    mov         ecx,25
 006E04D5    mov         edx,6E0C4C;'FakeX'
 006E04DA    mov         eax,dword ptr [esi]
 006E04DC    call        THashTable.Add
 006E04E1    mov         ecx,26
 006E04E6    mov         edx,6E0C64;'FakeY'
 006E04EB    mov         eax,dword ptr [esi]
 006E04ED    call        THashTable.Add
 006E04F2    mov         ecx,27
 006E04F7    mov         edx,6E0C7C;'FakeZ'
 006E04FC    mov         eax,dword ptr [esi]
 006E04FE    call        THashTable.Add
 006E0503    mov         ecx,2B
 006E0508    mov         edx,6E0C94;'FakeVersion'
 006E050D    mov         eax,dword ptr [esi]
 006E050F    call        THashTable.Add
 006E0514    mov         ecx,2D
 006E0519    mov         edx,6E0CB8;'FakeActive'
 006E051E    mov         eax,dword ptr [esi]
 006E0520    call        THashTable.Add
 006E0525    mov         ecx,2E
 006E052A    mov         edx,6E0CDC;'FakeCursor'
 006E052F    mov         eax,dword ptr [esi]
 006E0531    call        THashTable.Add
 006E0536    mov         ecx,2C
 006E053B    mov         edx,6E0D00;'FakeWindowHandle'
 006E0540    mov         eax,dword ptr [esi]
 006E0542    call        THashTable.Add
 006E0547    mov         ecx,2F
 006E054C    mov         edx,6E0D30;'FakeRequestFormat'
 006E0551    mov         eax,dword ptr [esi]
 006E0553    call        THashTable.Add
 006E0558    mov         ecx,30
 006E055D    mov         edx,6E0D60;'FakeProfileID'
 006E0562    mov         eax,dword ptr [esi]
 006E0564    call        THashTable.Add
 006E0569    mov         ecx,35
 006E056E    mov         edx,6E0D88;'RealYaw'
 006E0573    mov         eax,dword ptr [esi]
 006E0575    call        THashTable.Add
 006E057A    mov         ecx,34
 006E057F    mov         edx,6E0DA4;'RealPitch'
 006E0584    mov         eax,dword ptr [esi]
 006E0586    call        THashTable.Add
 006E058B    mov         ecx,36
 006E0590    mov         edx,6E0DC4;'RealRoll'
 006E0595    mov         eax,dword ptr [esi]
 006E0597    call        THashTable.Add
 006E059C    mov         ecx,31
 006E05A1    mov         edx,6E0DE4;'RealX'
 006E05A6    mov         eax,dword ptr [esi]
 006E05A8    call        THashTable.Add
 006E05AD    mov         ecx,32
 006E05B2    mov         edx,6E0DFC;'RealY'
 006E05B7    mov         eax,dword ptr [esi]
 006E05B9    call        THashTable.Add
 006E05BE    mov         ecx,33
 006E05C3    mov         edx,6E0E14;'RealZ'
 006E05C8    mov         eax,dword ptr [esi]
 006E05CA    call        THashTable.Add
 006E05CF    mov         ecx,37
 006E05D4    mov         edx,6E0E2C;'RealVersion'
 006E05D9    mov         eax,dword ptr [esi]
 006E05DB    call        THashTable.Add
 006E05E0    mov         ecx,38
 006E05E5    mov         edx,6E0E50;'Yaw'
 006E05EA    mov         eax,dword ptr [esi]
 006E05EC    call        THashTable.Add
 006E05F1    mov         ecx,39
 006E05F6    mov         edx,6E0E64;'Pitch'
 006E05FB    mov         eax,dword ptr [esi]
 006E05FD    call        THashTable.Add
 006E0602    mov         ecx,3A
 006E0607    mov         edx,6E0E7C;'Roll'
 006E060C    mov         eax,dword ptr [esi]
 006E060E    call        THashTable.Add
 006E0613    mov         ecx,3B
 006E0618    mov         edx,6E0E94;'X'
 006E061D    mov         eax,dword ptr [esi]
 006E061F    call        THashTable.Add
 006E0624    mov         ecx,3C
 006E0629    mov         edx,6E0EA4;'Y'
 006E062E    mov         eax,dword ptr [esi]
 006E0630    call        THashTable.Add
 006E0635    mov         ecx,3D
 006E063A    mov         edx,6E0EB4;'Z'
 006E063F    mov         eax,dword ptr [esi]
 006E0641    call        THashTable.Add
 006E0646    mov         ecx,3E
 006E064B    mov         edx,6E0EC4;'Version'
 006E0650    mov         eax,dword ptr [esi]
 006E0652    call        THashTable.Add
 006E0657    mov         ecx,2D
 006E065C    mov         edx,6E0EE0;'Active'
 006E0661    mov         eax,dword ptr [esi]
 006E0663    call        THashTable.Add
 006E0668    mov         ecx,2E
 006E066D    mov         edx,6E0EFC;'Cursor'
 006E0672    mov         eax,dword ptr [esi]
 006E0674    call        THashTable.Add
 006E0679    mov         ecx,2C
 006E067E    mov         edx,6E0F18;'WindowHandle'
 006E0683    mov         eax,dword ptr [esi]
 006E0685    call        THashTable.Add
 006E068A    mov         ecx,2F
 006E068F    mov         edx,6E0F40;'RequestFormat'
 006E0694    mov         eax,dword ptr [esi]
 006E0696    call        THashTable.Add
 006E069B    mov         ecx,30
 006E06A0    mov         edx,6E0F68;'ProfileID'
 006E06A5    mov         eax,dword ptr [esi]
 006E06A7    call        THashTable.Add
 006E06AC    xor         eax,eax
 006E06AE    pop         edx
 006E06AF    pop         ecx
 006E06B0    pop         ecx
 006E06B1    mov         dword ptr fs:[eax],edx
 006E06B4    push        6E06CE
 006E06B9    lea         eax,[ebp-30]
 006E06BC    mov         edx,0C
 006E06C1    call        @UStrArrayClr
 006E06C6    ret
>006E06C7    jmp         @HandleFinally
>006E06CC    jmp         006E06B9
 006E06CE    pop         edi
 006E06CF    pop         esi
 006E06D0    pop         ebx
 006E06D1    mov         esp,ebp
 006E06D3    pop         ebp
 006E06D4    ret
*}
end;

//006E0F7C
{*function sub_006E0F7C(?:?):?;
begin
 006E0F7C    push        ebp
 006E0F7D    mov         ebp,esp
 006E0F7F    add         esp,0FFFFFFF8
 006E0F82    push        ebx
 006E0F83    push        esi
 006E0F84    push        edi
 006E0F85    xor         edx,edx
 006E0F87    mov         dword ptr [ebp-8],edx
 006E0F8A    mov         dword ptr [ebp-4],eax
 006E0F8D    mov         eax,dword ptr [ebp-4]
 006E0F90    call        @UStrAddRef
 006E0F95    xor         eax,eax
 006E0F97    push        ebp
 006E0F98    push        6E1106
 006E0F9D    push        dword ptr fs:[eax]
 006E0FA0    mov         dword ptr fs:[eax],esp
 006E0FA3    xor         ebx,ebx
 006E0FA5    lea         eax,[ebp-8]
 006E0FA8    mov         edx,dword ptr [ebp-4]
 006E0FAB    call        @UStrLAsg
 006E0FB0    lea         eax,[ebp-8]
 006E0FB3    mov         edx,6E1124;'FakeTrackIR.'
 006E0FB8    call        004F9BD0
 006E0FBD    test        al,al
>006E0FBF    je          006E0FD3
 006E0FC1    lea         eax,[ebp-8]
 006E0FC4    mov         ecx,dword ptr [ebp-8]
 006E0FC7    mov         edx,6E114C;'TrackIR.Fake'
 006E0FCC    call        @UStrCat3
>006E0FD1    jmp         006E0FF4
 006E0FD3    lea         eax,[ebp-8]
 006E0FD6    mov         edx,6E1174;'RealTrackIR.'
 006E0FDB    call        004F9BD0
 006E0FE0    test        al,al
>006E0FE2    je          006E0FF4
 006E0FE4    lea         eax,[ebp-8]
 006E0FE7    mov         ecx,dword ptr [ebp-8]
 006E0FEA    mov         edx,6E119C;'TrackIR.Real'
 006E0FEF    call        @UStrCat3
 006E0FF4    lea         eax,[ebp-8]
 006E0FF7    mov         edx,6E11C4;'TrackIR'
 006E0FFC    call        004F9BD0
 006E1001    test        al,al
>006E1003    jne         006E102B
 006E1005    lea         eax,[ebp-8]
 006E1008    mov         edx,6E11E0;'Optitrack'
 006E100D    call        004F9BD0
 006E1012    test        al,al
>006E1014    jne         006E102B
 006E1016    lea         eax,[ebp-8]
 006E1019    mov         edx,6E1200;'SmartNav'
 006E101E    call        004F9BD0
 006E1023    test        al,al
>006E1025    je          006E10EB
 006E102B    lea         eax,[ebp-8]
 006E102E    call        004F9D00
 006E1033    mov         esi,eax
 006E1035    cmp         esi,8
>006E1038    jg          006E10EB
 006E103E    lea         eax,[ebp-8]
 006E1041    mov         edx,6E1220;'.'
 006E1046    call        004F9BD0
 006E104B    test        al,al
>006E104D    je          006E10EB
 006E1053    mov         eax,dword ptr [ebp-8]
 006E1056    call        006E2EFC
 006E105B    mov         edi,eax
 006E105D    test        edi,edi
>006E105F    jl          006E10EB
 006E1065    mov         dl,1
 006E1067    mov         eax,[006DFCD8];TTrackIRValue
 006E106C    call        TObject.Create;TTrackIRValue.Create
 006E1071    mov         ebx,eax
 006E1073    mov         dword ptr [ebx+20],edi;TTrackIRValue.......................................................
 006E1076    test        esi,esi
>006E1078    jg          006E107F
 006E107A    mov         esi,1
 006E107F    mov         dword ptr [ebx+18],esi;TTrackIRValue.......................................................
 006E1082    mov         byte ptr ds:[8221CC],1;gvar_008221CC
 006E1089    mov         eax,edi
 006E108B    dec         eax
 006E108C    sub         eax,24
>006E108F    jb          006E10A2
 006E1091    sub         eax,0C
>006E1094    jb          006E10C3
 006E1096    sub         eax,7
>006E1099    jb          006E10D1
 006E109B    sub         eax,7
>006E109E    jb          006E10DF
>006E10A0    jmp         006E10EB
 006E10A2    mov         byte ptr ds:[8221CE],1;gvar_008221CE
 006E10A9    cmp         edi,1
>006E10AC    je          006E10BC
 006E10AE    cmp         edi,2
>006E10B1    je          006E10BC
 006E10B3    mov         byte ptr [esi+8221DB],1
>006E10BA    jmp         006E10EB
 006E10BC    xor         eax,eax
 006E10BE    mov         dword ptr [ebx+18],eax;TTrackIRValue.......................................................
>006E10C1    jmp         006E10EB
 006E10C3    mov         byte ptr ds:[8221D4],1;gvar_008221D4
 006E10CA    xor         eax,eax
 006E10CC    mov         dword ptr [ebx+18],eax;TTrackIRValue.......................................................
>006E10CF    jmp         006E10EB
 006E10D1    mov         byte ptr ds:[8221D2],1;gvar_008221D2
 006E10D8    xor         eax,eax
 006E10DA    mov         dword ptr [ebx+18],eax;TTrackIRValue.......................................................
>006E10DD    jmp         006E10EB
 006E10DF    mov         byte ptr ds:[8221D0],1;gvar_008221D0
 006E10E6    xor         eax,eax
 006E10E8    mov         dword ptr [ebx+18],eax;TTrackIRValue.......................................................
 006E10EB    xor         eax,eax
 006E10ED    pop         edx
 006E10EE    pop         ecx
 006E10EF    pop         ecx
 006E10F0    mov         dword ptr fs:[eax],edx
 006E10F3    push        6E110D
 006E10F8    lea         eax,[ebp-8]
 006E10FB    mov         edx,2
 006E1100    call        @UStrArrayClr
 006E1105    ret
>006E1106    jmp         @HandleFinally
>006E110B    jmp         006E10F8
 006E110D    mov         eax,ebx
 006E110F    pop         edi
 006E1110    pop         esi
 006E1111    pop         ebx
 006E1112    pop         ecx
 006E1113    pop         ecx
 006E1114    pop         ebp
 006E1115    ret
end;*}

//006E1224
function TTrackIRValue.CanSet:Boolean;
begin
{*
 006E1224    mov         eax,dword ptr [eax+20];TTrackIRValue.......................................................
 006E1227    add         eax,0FFFFFFF5
 006E122A    sub         eax,4
>006E122D    jb          006E1249
 006E122F    add         eax,0FFFFFFF8
 006E1232    sub         eax,4
>006E1235    jb          006E124C
 006E1237    add         eax,0FFFFFFF6
 006E123A    sub         eax,0C
>006E123D    jb          006E124F
 006E123F    add         eax,0FFFFFFF9
 006E1242    sub         eax,7
>006E1245    jb          006E124F
>006E1247    jmp         006E1252
 006E1249    mov         al,1
 006E124B    ret
 006E124C    mov         al,1
 006E124E    ret
 006E124F    mov         al,1
 006E1251    ret
 006E1252    xor         eax,eax
 006E1254    ret
*}
end;

//006E1258
procedure TTrackIRValue.CreateClone;
begin
{*
 006E1258    mov         dl,1
 006E125A    mov         eax,[006DFCD8];TTrackIRValue
 006E125F    call        TObject.Create;TTrackIRValue.Create
 006E1264    ret
*}
end;

//006E1268
procedure TTrackIRValue.FillClone(c:TExpression);
begin
{*
 006E1268    push        ebx
 006E1269    push        esi
 006E126A    mov         esi,edx
 006E126C    mov         ebx,eax
 006E126E    mov         edx,esi
 006E1270    mov         eax,ebx
 006E1272    call        TExpression.FillClone
 006E1277    mov         eax,esi
 006E1279    mov         edx,dword ptr [ebx+20];TTrackIRValue.......................................................
 006E127C    mov         dword ptr [eax+20],edx
 006E127F    mov         edx,dword ptr [ebx+18];TTrackIRValue.......................................................
 006E1282    mov         dword ptr [eax+18],edx
 006E1285    pop         esi
 006E1286    pop         ebx
 006E1287    ret
*}
end;

//006E1288
function TTrackIRValue.GetDataType:TDataType;
begin
{*
 006E1288    mov         eax,dword ptr [eax+20];TTrackIRValue.......................................................
 006E128B    cmp         eax,37
>006E128E    ja          006E130B
 006E1290    movzx       eax,byte ptr [eax+6E129E]
 006E1297    jmp         dword ptr [eax*4+6E12D6]
 006E1297    db          1
 006E1297    db          2
 006E1297    db          1
 006E1297    db          2
 006E1297    db          2
 006E1297    db          3
 006E1297    db          2
 006E1297    db          3
 006E1297    db          2
 006E1297    db          2
 006E1297    db          2
 006E1297    db          1
 006E1297    db          1
 006E1297    db          1
 006E1297    db          1
 006E1297    db          4
 006E1297    db          4
 006E1297    db          0
 006E1297    db          0
 006E1297    db          0
 006E1297    db          5
 006E1297    db          5
 006E1297    db          5
 006E1297    db          0
 006E1297    db          0
 006E1297    db          0
 006E1297    db          0
 006E1297    db          1
 006E1297    db          0
 006E1297    db          0
 006E1297    db          0
 006E1297    db          0
 006E1297    db          0
 006E1297    db          0
 006E1297    db          0
 006E1297    db          0
 006E1297    db          0
 006E1297    db          0
 006E1297    db          0
 006E1297    db          0
 006E1297    db          0
 006E1297    db          0
 006E1297    db          0
 006E1297    db          7
 006E1297    db          7
 006E1297    db          6
 006E1297    db          6
 006E1297    db          7
 006E1297    db          7
 006E1297    db          0
 006E1297    db          0
 006E1297    db          0
 006E1297    db          0
 006E1297    db          0
 006E1297    db          0
 006E1297    db          7
 006E1297    dd          006E130B
 006E1297    dd          006E12F6
 006E1297    dd          006E12F9
 006E1297    dd          006E12FC
 006E1297    dd          006E12FF
 006E1297    dd          006E1302
 006E1297    dd          006E1305
 006E1297    dd          006E1308
 006E12F6    mov         al,3
 006E12F8    ret
 006E12F9    mov         al,2
 006E12FB    ret
 006E12FC    mov         al,4
 006E12FE    ret
 006E12FF    mov         al,2
 006E1301    ret
 006E1302    mov         al,1
 006E1304    ret
 006E1305    mov         al,3
 006E1307    ret
 006E1308    mov         al,2
 006E130A    ret
 006E130B    xor         eax,eax
 006E130D    ret
*}
end;

//006E1310
function TTrackIRValue.GetPerUnits1:TUnits;
begin
{*
 006E1310    mov         eax,dword ptr [eax+20];TTrackIRValue.......................................................
 006E1313    sub         eax,1
>006E1316    jb          006E1320
 006E1318    sub         eax,9
>006E131B    jne         006E1323
 006E131D    mov         al,11
 006E131F    ret
 006E1320    xor         eax,eax
 006E1322    ret
 006E1323    xor         eax,eax
 006E1325    ret
*}
end;

//006E1328
function TTrackIRValue.GetPerUnits2:TUnits;
begin
{*
 006E1328    mov         eax,dword ptr [eax+20];TTrackIRValue.......................................................
 006E132B    sub         eax,1
>006E132E    jae         006E1333
 006E1330    xor         eax,eax
 006E1332    ret
 006E1333    xor         eax,eax
 006E1335    ret
*}
end;

//006E1338
{*procedure TTrackIRValue.GetString(?:?);
begin
 006E1338    push        ebp
 006E1339    mov         ebp,esp
 006E133B    add         esp,0FFFFFFF8
 006E133E    push        ebx
 006E133F    push        esi
 006E1340    push        edi
 006E1341    mov         dword ptr [ebp-4],edx
 006E1344    mov         ebx,eax
 006E1346    xor         edx,edx
 006E1348    push        ebp
 006E1349    push        6E14CF
 006E134E    push        dword ptr fs:[edx]
 006E1351    mov         dword ptr fs:[edx],esp
 006E1354    mov         eax,dword ptr [ebx+20];TTrackIRValue.......................................................
 006E1357    sub         eax,1
>006E135A    jb          006E136F
 006E135C    sub         eax,4
>006E135F    je          006E137E
 006E1361    sub         eax,2
>006E1364    je          006E1451
>006E136A    jmp         006E14BB
 006E136F    mov         edx,dword ptr [ebp-4]
 006E1372    mov         eax,ebx
 006E1374    call        TExpression.GetString
>006E1379    jmp         006E14C5
 006E137E    mov         eax,dword ptr [ebx+18];TTrackIRValue.......................................................
 006E1381    cmp         dword ptr [eax*4+8221E0],0;gvar_008221E0
>006E1389    jne         006E1398
 006E138B    mov         eax,dword ptr [ebp-4]
 006E138E    call        @UStrClr
>006E1393    jmp         006E14C5
 006E1398    lea         edx,[ebp-8]
 006E139B    push        edx
 006E139C    mov         eax,dword ptr [eax*4+8221E0];gvar_008221E0
 006E13A3    push        eax
 006E13A4    mov         eax,dword ptr [eax]
 006E13A6    call        dword ptr [eax+20]
 006E13A9    call        @CheckAutoResult
 006E13AE    mov         eax,dword ptr [ebp-8]
 006E13B1    cmp         eax,4
>006E13B4    ja          006E142B
 006E13B6    jmp         dword ptr [eax*4+6E13BD]
 006E13B6    dd          006E13D1
 006E13B6    dd          006E13E3
 006E13B6    dd          006E13F5
 006E13B6    dd          006E1407
 006E13B6    dd          006E1419
 006E13D1    mov         eax,dword ptr [ebp-4]
 006E13D4    mov         edx,6E14F4;'Old TrackIR'
 006E13D9    call        @UStrAsg
>006E13DE    jmp         006E14C5
 006E13E3    mov         eax,dword ptr [ebp-4]
 006E13E6    mov         edx,6E1518;'SmartNav'
 006E13EB    call        @UStrAsg
>006E13F0    jmp         006E14C5
 006E13F5    mov         eax,dword ptr [ebp-4]
 006E13F8    mov         edx,6E1538;'TrackIR'
 006E13FD    call        @UStrAsg
>006E1402    jmp         006E14C5
 006E1407    mov         eax,dword ptr [ebp-4]
 006E140A    mov         edx,6E1554;'OptiTrack'
 006E140F    call        @UStrAsg
>006E1414    jmp         006E14C5
 006E1419    mov         eax,dword ptr [ebp-4]
 006E141C    mov         edx,6E1574;'Unknown'
 006E1421    call        @UStrAsg
>006E1426    jmp         006E14C5
 006E142B    lea         eax,[ebp-8]
 006E142E    push        eax
 006E142F    mov         eax,dword ptr [ebx+18];TTrackIRValue.......................................................
 006E1432    mov         eax,dword ptr [eax*4+8221E0];gvar_008221E0
 006E1439    push        eax
 006E143A    mov         eax,dword ptr [eax]
 006E143C    call        dword ptr [eax+20]
 006E143F    call        @CheckAutoResult
 006E1444    mov         eax,dword ptr [ebp-8]
 006E1447    mov         edx,dword ptr [ebp-4]
 006E144A    call        IntToStr
>006E144F    jmp         006E14C5
 006E1451    mov         eax,dword ptr [ebx+18];TTrackIRValue.......................................................
 006E1454    cmp         dword ptr [eax*4+8221E0],0;gvar_008221E0
>006E145C    jne         006E1468
 006E145E    mov         eax,dword ptr [ebp-4]
 006E1461    call        @UStrClr
>006E1466    jmp         006E14C5
 006E1468    lea         edx,[ebp-8]
 006E146B    push        edx
 006E146C    mov         eax,dword ptr [eax*4+8221E0];gvar_008221E0
 006E1473    push        eax
 006E1474    mov         eax,dword ptr [eax]
 006E1476    call        dword ptr [eax+24]
 006E1479    call        @CheckAutoResult
 006E147E    mov         eax,dword ptr [ebp-8]
 006E1481    sub         eax,1
>006E1484    jae         006E1495
 006E1486    mov         eax,dword ptr [ebp-4]
 006E1489    mov         edx,6E1590;'0'
 006E148E    call        @UStrAsg
>006E1493    jmp         006E14C5
 006E1495    lea         eax,[ebp-8]
 006E1498    push        eax
 006E1499    mov         eax,dword ptr [ebx+18];TTrackIRValue.......................................................
 006E149C    mov         eax,dword ptr [eax*4+8221E0];gvar_008221E0
 006E14A3    push        eax
 006E14A4    mov         eax,dword ptr [eax]
 006E14A6    call        dword ptr [eax+24]
 006E14A9    call        @CheckAutoResult
 006E14AE    mov         eax,dword ptr [ebp-8]
 006E14B1    mov         edx,dword ptr [ebp-4]
 006E14B4    call        IntToStr
>006E14B9    jmp         006E14C5
 006E14BB    mov         edx,dword ptr [ebp-4]
 006E14BE    mov         eax,ebx
 006E14C0    call        TExpression.GetString
 006E14C5    xor         eax,eax
 006E14C7    pop         edx
 006E14C8    pop         ecx
 006E14C9    pop         ecx
 006E14CA    mov         dword ptr fs:[eax],edx
>006E14CD    jmp         006E14E1
>006E14CF    jmp         @HandleAnyException
 006E14D4    mov         eax,dword ptr [ebp-4]
 006E14D7    call        @UStrClr
 006E14DC    call        @DoneExcept
 006E14E1    pop         edi
 006E14E2    pop         esi
 006E14E3    pop         ebx
 006E14E4    pop         ecx
 006E14E5    pop         ecx
 006E14E6    pop         ebp
 006E14E7    ret
end;*}

//006E1594
function TTrackIRValue.GetUnits:TUnits;
begin
{*
 006E1594    mov         eax,dword ptr [eax+20];TTrackIRValue.......................................................
 006E1597    cmp         eax,28
>006E159A    jge         006E15B8
 006E159C    add         eax,0FFFFFFF8
 006E159F    sub         eax,2
>006E15A2    jb          006E15E7
>006E15A4    je          006E15E4
 006E15A6    add         eax,0FFFFFFF3
 006E15A9    sub         eax,4
>006E15AC    jb          006E15EA
 006E15AE    add         eax,0FFFFFFF6
 006E15B1    sub         eax,3
>006E15B4    jb          006E15ED
>006E15B6    jmp         006E15F3
 006E15B8    cmp         eax,34
>006E15BB    jge         006E15CF
 006E15BD    add         eax,0FFFFFFD8
 006E15C0    sub         eax,3
>006E15C3    jb          006E15F0
 006E15C5    add         eax,0FFFFFFFA
 006E15C8    sub         eax,3
>006E15CB    jb          006E15ED
>006E15CD    jmp         006E15F3
 006E15CF    add         eax,0FFFFFFCC
 006E15D2    sub         eax,3
>006E15D5    jb          006E15F0
 006E15D7    dec         eax
 006E15D8    sub         eax,3
>006E15DB    jb          006E15F0
 006E15DD    sub         eax,3
>006E15E0    jb          006E15ED
>006E15E2    jmp         006E15F3
 006E15E4    xor         eax,eax
 006E15E6    ret
 006E15E7    mov         al,0C
 006E15E9    ret
 006E15EA    mov         al,3
 006E15EC    ret
 006E15ED    mov         al,5
 006E15EF    ret
 006E15F0    mov         al,18
 006E15F2    ret
 006E15F3    xor         eax,eax
 006E15F5    ret
*}
end;

//006E15F8
procedure TTrackIRValue.GetValue;
begin
{*
 006E15F8    push        ebp
 006E15F9    mov         ebp,esp
 006E15FB    mov         ecx,1B
 006E1600    push        0
 006E1602    push        0
 006E1604    dec         ecx
>006E1605    jne         006E1600
 006E1607    push        ecx
 006E1608    push        ebx
 006E1609    push        esi
 006E160A    push        edi
 006E160B    mov         ebx,eax
 006E160D    xor         eax,eax
 006E160F    push        ebp
 006E1610    push        6E20AF
 006E1615    push        dword ptr fs:[eax]
 006E1618    mov         dword ptr fs:[eax],esp
 006E161B    xor         edx,edx
 006E161D    push        ebp
 006E161E    push        6E2024
 006E1623    push        dword ptr fs:[edx]
 006E1626    mov         dword ptr fs:[edx],esp
 006E1629    mov         esi,dword ptr [ebx+18];TTrackIRValue.......................................................
 006E162C    test        esi,esi
>006E162E    jle         006E1641
 006E1630    lea         eax,[ebp-4]
 006E1633    mov         edx,dword ptr [esi*4+8221E0];gvar_008221E0
 006E163A    call        @IntfCopy
>006E163F    jmp         006E1649
 006E1641    lea         eax,[ebp-4]
 006E1644    call        @IntfClear
 006E1649    mov         eax,dword ptr [ebx+20];TTrackIRValue.......................................................
 006E164C    mov         edx,eax
 006E164E    cmp         edx,3E
>006E1651    ja          006E2012
 006E1657    jmp         dword ptr [edx*4+6E165E]
 006E1657    dd          006E175A
 006E1657    dd          006E1788
 006E1657    dd          006E1797
 006E1657    dd          006E180E
 006E1657    dd          006E183F
 006E1657    dd          006E2012
 006E1657    dd          006E1870
 006E1657    dd          006E2012
 006E1657    dd          006E17AC
 006E1657    dd          006E17DD
 006E1657    dd          006E18A1
 006E1657    dd          006E18D2
 006E1657    dd          006E18D2
 006E1657    dd          006E18D2
 006E1657    dd          006E18D2
 006E1657    dd          006E1902
 006E1657    dd          006E1912
 006E1657    dd          006E1922
 006E1657    dd          006E193B
 006E1657    dd          006E1954
 006E1657    dd          006E1986
 006E1657    dd          006E196D
 006E1657    dd          006E199F
 006E1657    dd          006E19B8
 006E1657    dd          006E19FF
 006E1657    dd          006E1A46
 006E1657    dd          006E1A8D
 006E1657    dd          006E1AD6
 006E1657    dd          006E1B1E
 006E1657    dd          006E1B1E
 006E1657    dd          006E1B1E
 006E1657    dd          006E1BCA
 006E1657    dd          006E1BCA
 006E1657    dd          006E1BCA
 006E1657    dd          006E1C7F
 006E1657    dd          006E1C7F
 006E1657    dd          006E1C7F
 006E1657    dd          006E1D34
 006E1657    dd          006E1D4D
 006E1657    dd          006E1D66
 006E1657    dd          006E1D9E
 006E1657    dd          006E1D7F
 006E1657    dd          006E1DBD
 006E1657    dd          006E1DDC
 006E1657    dd          006E1FAC
 006E1657    dd          006E1FF9
 006E1657    dd          006E1FE0
 006E1657    dd          006E1FD0
 006E1657    dd          006E1F9C
 006E1657    dd          006E1E03
 006E1657    dd          006E1E1A
 006E1657    dd          006E1E31
 006E1657    dd          006E1E65
 006E1657    dd          006E1E48
 006E1657    dd          006E1E82
 006E1657    dd          006E1E9F
 006E1657    dd          006E1F16
 006E1657    dd          006E1F33
 006E1657    dd          006E1F50
 006E1657    dd          006E1ED1
 006E1657    dd          006E1EE8
 006E1657    dd          006E1EFF
 006E1657    dd          006E1F6D
 006E175A    cmp         byte ptr ds:[8221CD],0;gvar_008221CD
>006E1761    jne         006E1773
 006E1763    xor         eax,eax
 006E1765    call        00686074
 006E176A    fstp        qword ptr [ebp-10]
 006E176D    wait
>006E176E    jmp         006E201A
 006E1773    cmp         dword ptr [ebp-4],0
 006E1777    setne       al
 006E177A    call        00686074
 006E177F    fstp        qword ptr [ebp-10]
 006E1782    wait
>006E1783    jmp         006E201A
 006E1788    fild        dword ptr ds:[78C2F4];0:Single
 006E178E    fstp        qword ptr [ebp-10]
 006E1791    wait
>006E1792    jmp         006E201A
 006E1797    movzx       eax,byte ptr ds:[78C2FC];0x0 gvar_0078C2FC
 006E179E    call        00686074
 006E17A3    fstp        qword ptr [ebp-10]
 006E17A6    wait
>006E17A7    jmp         006E201A
 006E17AC    cmp         dword ptr [ebp-4],0
>006E17B0    jne         006E17BF
 006E17B2    xor         eax,eax
 006E17B4    mov         dword ptr [ebp-10],eax
 006E17B7    mov         dword ptr [ebp-0C],eax
>006E17BA    jmp         006E201A
 006E17BF    lea         eax,[ebp-18]
 006E17C2    push        eax
 006E17C3    mov         eax,dword ptr [ebp-4]
 006E17C6    push        eax
 006E17C7    mov         eax,dword ptr [eax]
 006E17C9    call        dword ptr [eax+28]
 006E17CC    call        @CheckAutoResult
 006E17D1    fild        dword ptr [ebp-18]
 006E17D4    fstp        qword ptr [ebp-10]
 006E17D7    wait
>006E17D8    jmp         006E201A
 006E17DD    cmp         dword ptr [ebp-4],0
>006E17E1    jne         006E17F0
 006E17E3    xor         eax,eax
 006E17E5    mov         dword ptr [ebp-10],eax
 006E17E8    mov         dword ptr [ebp-0C],eax
>006E17EB    jmp         006E201A
 006E17F0    lea         eax,[ebp-18]
 006E17F3    push        eax
 006E17F4    mov         eax,dword ptr [ebp-4]
 006E17F7    push        eax
 006E17F8    mov         eax,dword ptr [eax]
 006E17FA    call        dword ptr [eax+2C]
 006E17FD    call        @CheckAutoResult
 006E1802    fild        dword ptr [ebp-18]
 006E1805    fstp        qword ptr [ebp-10]
 006E1808    wait
>006E1809    jmp         006E201A
 006E180E    cmp         dword ptr [ebp-4],0
>006E1812    jne         006E1821
 006E1814    xor         eax,eax
 006E1816    mov         dword ptr [ebp-10],eax
 006E1819    mov         dword ptr [ebp-0C],eax
>006E181C    jmp         006E201A
 006E1821    lea         eax,[ebp-18]
 006E1824    push        eax
 006E1825    mov         eax,dword ptr [ebp-4]
 006E1828    push        eax
 006E1829    mov         eax,dword ptr [eax]
 006E182B    call        dword ptr [eax+1C]
 006E182E    call        @CheckAutoResult
 006E1833    fild        dword ptr [ebp-18]
 006E1836    fstp        qword ptr [ebp-10]
 006E1839    wait
>006E183A    jmp         006E201A
 006E183F    cmp         dword ptr [ebp-4],0
>006E1843    jne         006E1852
 006E1845    xor         eax,eax
 006E1847    mov         dword ptr [ebp-10],eax
 006E184A    mov         dword ptr [ebp-0C],eax
>006E184D    jmp         006E201A
 006E1852    lea         eax,[ebp-18]
 006E1855    push        eax
 006E1856    mov         eax,dword ptr [ebp-4]
 006E1859    push        eax
 006E185A    mov         eax,dword ptr [eax]
 006E185C    call        dword ptr [eax+20]
 006E185F    call        @CheckAutoResult
 006E1864    fild        dword ptr [ebp-18]
 006E1867    fstp        qword ptr [ebp-10]
 006E186A    wait
>006E186B    jmp         006E201A
 006E1870    cmp         dword ptr [ebp-4],0
>006E1874    jne         006E1883
 006E1876    xor         eax,eax
 006E1878    mov         dword ptr [ebp-10],eax
 006E187B    mov         dword ptr [ebp-0C],eax
>006E187E    jmp         006E201A
 006E1883    lea         eax,[ebp-18]
 006E1886    push        eax
 006E1887    mov         eax,dword ptr [ebp-4]
 006E188A    push        eax
 006E188B    mov         eax,dword ptr [eax]
 006E188D    call        dword ptr [eax+24]
 006E1890    call        @CheckAutoResult
 006E1895    fild        dword ptr [ebp-18]
 006E1898    fstp        qword ptr [ebp-10]
 006E189B    wait
>006E189C    jmp         006E201A
 006E18A1    cmp         dword ptr [ebp-4],0
>006E18A5    jne         006E18B4
 006E18A7    xor         eax,eax
 006E18A9    mov         dword ptr [ebp-10],eax
 006E18AC    mov         dword ptr [ebp-0C],eax
>006E18AF    jmp         006E201A
 006E18B4    lea         eax,[ebp-18]
 006E18B7    push        eax
 006E18B8    mov         eax,dword ptr [ebp-4]
 006E18BB    push        eax
 006E18BC    mov         eax,dword ptr [eax]
 006E18BE    call        dword ptr [eax+30]
 006E18C1    call        @CheckAutoResult
 006E18C6    fild        dword ptr [ebp-18]
 006E18C9    fstp        qword ptr [ebp-10]
 006E18CC    wait
>006E18CD    jmp         006E201A
 006E18D2    cmp         dword ptr [ebp-4],0
>006E18D6    jne         006E18E5
 006E18D8    xor         eax,eax
 006E18DA    mov         dword ptr [ebp-10],eax
 006E18DD    mov         dword ptr [ebp-0C],eax
>006E18E0    jmp         006E201A
 006E18E5    lea         edx,[esi*4+822224];gvar_00822224
 006E18EC    cmp         byte ptr [edx+eax-0F],0
 006E18F1    setg        al
 006E18F4    call        00686074
 006E18F9    fstp        qword ptr [ebp-10]
 006E18FC    wait
>006E18FD    jmp         006E201A
 006E1902    fild        dword ptr [esi*4+822260]
 006E1909    fstp        qword ptr [ebp-10]
 006E190C    wait
>006E190D    jmp         006E201A
 006E1912    fild        dword ptr [esi*4+822240]
 006E1919    fstp        qword ptr [ebp-10]
 006E191C    wait
>006E191D    jmp         006E201A
 006E1922    mov         eax,dword ptr [esi*8+822280];gvar_00822280
 006E1929    mov         dword ptr [ebp-10],eax
 006E192C    mov         eax,dword ptr [esi*8+822284];gvar_00822284
 006E1933    mov         dword ptr [ebp-0C],eax
>006E1936    jmp         006E201A
 006E193B    mov         eax,dword ptr [esi*8+8222C0];gvar_008222C0
 006E1942    mov         dword ptr [ebp-10],eax
 006E1945    mov         eax,dword ptr [esi*8+8222C4];gvar_008222C4
 006E194C    mov         dword ptr [ebp-0C],eax
>006E194F    jmp         006E201A
 006E1954    mov         eax,dword ptr [esi*8+822300];gvar_00822300
 006E195B    mov         dword ptr [ebp-10],eax
 006E195E    mov         eax,dword ptr [esi*8+822304];gvar_00822304
 006E1965    mov         dword ptr [ebp-0C],eax
>006E1968    jmp         006E201A
 006E196D    mov         eax,dword ptr [esi*8+822340];gvar_00822340
 006E1974    mov         dword ptr [ebp-10],eax
 006E1977    mov         eax,dword ptr [esi*8+822344];gvar_00822344
 006E197E    mov         dword ptr [ebp-0C],eax
>006E1981    jmp         006E201A
 006E1986    mov         eax,dword ptr [esi*8+822380];gvar_00822380
 006E198D    mov         dword ptr [ebp-10],eax
 006E1990    mov         eax,dword ptr [esi*8+822384];gvar_00822384
 006E1997    mov         dword ptr [ebp-0C],eax
>006E199A    jmp         006E201A
 006E199F    mov         eax,dword ptr [esi*8+8223C0];gvar_008223C0
 006E19A6    mov         dword ptr [ebp-10],eax
 006E19A9    mov         eax,dword ptr [esi*8+8223C4];gvar_008223C4
 006E19B0    mov         dword ptr [ebp-0C],eax
>006E19B3    jmp         006E201A
 006E19B8    cmp         dword ptr [esi*4+822200],0;gvar_00822200
>006E19C0    jne         006E19D3
 006E19C2    xor         eax,eax
 006E19C4    mov         dword ptr [ebp-10],eax
 006E19C7    mov         dword ptr [ebp-0C],405E0000
>006E19CE    jmp         006E201A
 006E19D3    lea         eax,[ebp-28]
 006E19D6    call        @VarClr
 006E19DB    push        eax
 006E19DC    mov         eax,dword ptr [esi*4+822200];gvar_00822200
 006E19E3    push        eax
 006E19E4    mov         eax,dword ptr [eax]
 006E19E6    call        dword ptr [eax+34]
 006E19E9    call        @CheckAutoResult
 006E19EE    lea         eax,[ebp-28]
 006E19F1    call        @VarToReal
 006E19F6    fstp        qword ptr [ebp-10]
 006E19F9    wait
>006E19FA    jmp         006E201A
 006E19FF    cmp         dword ptr [esi*4+822200],0;gvar_00822200
>006E1A07    jne         006E1A1A
 006E1A09    xor         eax,eax
 006E1A0B    mov         dword ptr [ebp-10],eax
 006E1A0E    mov         dword ptr [ebp-0C],405E0000
>006E1A15    jmp         006E201A
 006E1A1A    lea         eax,[ebp-38]
 006E1A1D    call        @VarClr
 006E1A22    push        eax
 006E1A23    mov         eax,dword ptr [esi*4+822200];gvar_00822200
 006E1A2A    push        eax
 006E1A2B    mov         eax,dword ptr [eax]
 006E1A2D    call        dword ptr [eax+3C]
 006E1A30    call        @CheckAutoResult
 006E1A35    lea         eax,[ebp-38]
 006E1A38    call        @VarToReal
 006E1A3D    fstp        qword ptr [ebp-10]
 006E1A40    wait
>006E1A41    jmp         006E201A
 006E1A46    cmp         dword ptr [esi*4+822200],0;gvar_00822200
>006E1A4E    jne         006E1A61
 006E1A50    xor         eax,eax
 006E1A52    mov         dword ptr [ebp-10],eax
 006E1A55    mov         dword ptr [ebp-0C],40518000
>006E1A5C    jmp         006E201A
 006E1A61    lea         eax,[ebp-48]
 006E1A64    call        @VarClr
 006E1A69    push        eax
 006E1A6A    mov         eax,dword ptr [esi*4+822200];gvar_00822200
 006E1A71    push        eax
 006E1A72    mov         eax,dword ptr [eax]
 006E1A74    call        dword ptr [eax+44]
 006E1A77    call        @CheckAutoResult
 006E1A7C    lea         eax,[ebp-48]
 006E1A7F    call        @VarToReal
 006E1A84    fstp        qword ptr [ebp-10]
 006E1A87    wait
>006E1A88    jmp         006E201A
 006E1A8D    cmp         dword ptr [esi*4+822200],0;gvar_00822200
>006E1A95    jne         006E1AAA
 006E1A97    mov         dword ptr [ebp-10],4000000D
 006E1A9E    mov         dword ptr [ebp-0C],405CB333
>006E1AA5    jmp         006E201A
 006E1AAA    lea         eax,[ebp-58]
 006E1AAD    call        @VarClr
 006E1AB2    push        eax
 006E1AB3    mov         eax,dword ptr [esi*4+822200];gvar_00822200
 006E1ABA    push        eax
 006E1ABB    mov         eax,dword ptr [eax]
 006E1ABD    call        dword ptr [eax+4C]
 006E1AC0    call        @CheckAutoResult
 006E1AC5    lea         eax,[ebp-58]
 006E1AC8    call        @VarToReal
 006E1ACD    fstp        qword ptr [ebp-10]
 006E1AD0    wait
>006E1AD1    jmp         006E201A
 006E1AD6    cmp         dword ptr [esi*4+822200],0;gvar_00822200
>006E1ADE    jne         006E1AED
 006E1AE0    xor         eax,eax
 006E1AE2    mov         dword ptr [ebp-10],eax
 006E1AE5    mov         dword ptr [ebp-0C],eax
>006E1AE8    jmp         006E201A
 006E1AED    lea         eax,[ebp-68]
 006E1AF0    call        @VarClr
 006E1AF5    push        eax
 006E1AF6    mov         eax,dword ptr [esi*4+822200];gvar_00822200
 006E1AFD    push        eax
 006E1AFE    mov         eax,dword ptr [eax]
 006E1B00    call        dword ptr [eax+54]
 006E1B03    call        @CheckAutoResult
 006E1B08    lea         eax,[ebp-68]
 006E1B0B    call        @VarToBool
 006E1B10    call        00686074
 006E1B15    fstp        qword ptr [ebp-10]
 006E1B18    wait
>006E1B19    jmp         006E201A
 006E1B1E    cmp         dword ptr [esi*4+822200],0;gvar_00822200
>006E1B26    jne         006E1B35
 006E1B28    xor         eax,eax
 006E1B2A    mov         dword ptr [ebp-10],eax
 006E1B2D    mov         dword ptr [ebp-0C],eax
>006E1B30    jmp         006E201A
 006E1B35    lea         eax,[ebp-78]
 006E1B38    call        @VarClr
 006E1B3D    push        eax
 006E1B3E    mov         eax,dword ptr [esi*4+822200];gvar_00822200
 006E1B45    push        eax
 006E1B46    mov         eax,dword ptr [eax]
 006E1B48    call        dword ptr [eax+54]
 006E1B4B    call        @CheckAutoResult
 006E1B50    lea         eax,[ebp-78]
 006E1B53    call        @VarNeg
 006E1B58    lea         eax,[ebp-78]
 006E1B5B    call        @VarToBool
 006E1B60    test        al,al
>006E1B62    je          006E1B71
 006E1B64    xor         eax,eax
 006E1B66    mov         dword ptr [ebp-10],eax
 006E1B69    mov         dword ptr [ebp-0C],eax
>006E1B6C    jmp         006E201A
 006E1B71    lea         eax,[ebp-88]
 006E1B77    call        @VarClr
 006E1B7C    push        eax
 006E1B7D    lea         eax,[ebp-8C]
 006E1B83    call        @IntfClear
 006E1B88    push        eax
 006E1B89    mov         eax,dword ptr [ebx+20];TTrackIRValue.......................................................
 006E1B8C    sub         eax,1C
 006E1B8F    push        eax
 006E1B90    mov         eax,dword ptr [ebx+18];TTrackIRValue.......................................................
 006E1B93    mov         eax,dword ptr [eax*4+822200];gvar_00822200
 006E1B9A    push        eax
 006E1B9B    mov         eax,dword ptr [eax]
 006E1B9D    call        dword ptr [eax+60]
 006E1BA0    call        @CheckAutoResult
 006E1BA5    mov         eax,dword ptr [ebp-8C]
 006E1BAB    push        eax
 006E1BAC    mov         eax,dword ptr [eax]
 006E1BAE    call        dword ptr [eax+1C]
 006E1BB1    call        @CheckAutoResult
 006E1BB6    lea         eax,[ebp-88]
 006E1BBC    call        @VarToReal
 006E1BC1    fstp        qword ptr [ebp-10]
 006E1BC4    wait
>006E1BC5    jmp         006E201A
 006E1BCA    cmp         dword ptr [esi*4+822200],0;gvar_00822200
>006E1BD2    jne         006E1BE1
 006E1BD4    xor         eax,eax
 006E1BD6    mov         dword ptr [ebp-10],eax
 006E1BD9    mov         dword ptr [ebp-0C],eax
>006E1BDC    jmp         006E201A
 006E1BE1    lea         eax,[ebp-9C]
 006E1BE7    call        @VarClr
 006E1BEC    push        eax
 006E1BED    mov         eax,dword ptr [esi*4+822200];gvar_00822200
 006E1BF4    push        eax
 006E1BF5    mov         eax,dword ptr [eax]
 006E1BF7    call        dword ptr [eax+54]
 006E1BFA    call        @CheckAutoResult
 006E1BFF    lea         eax,[ebp-9C]
 006E1C05    call        @VarNeg
 006E1C0A    lea         eax,[ebp-9C]
 006E1C10    call        @VarToBool
 006E1C15    test        al,al
>006E1C17    je          006E1C26
 006E1C19    xor         eax,eax
 006E1C1B    mov         dword ptr [ebp-10],eax
 006E1C1E    mov         dword ptr [ebp-0C],eax
>006E1C21    jmp         006E201A
 006E1C26    lea         eax,[ebp-0AC]
 006E1C2C    call        @VarClr
 006E1C31    push        eax
 006E1C32    lea         eax,[ebp-0B0]
 006E1C38    call        @IntfClear
 006E1C3D    push        eax
 006E1C3E    mov         eax,dword ptr [ebx+20];TTrackIRValue.......................................................
 006E1C41    sub         eax,1F
 006E1C44    push        eax
 006E1C45    mov         eax,dword ptr [ebx+18];TTrackIRValue.......................................................
 006E1C48    mov         eax,dword ptr [eax*4+822200];gvar_00822200
 006E1C4F    push        eax
 006E1C50    mov         eax,dword ptr [eax]
 006E1C52    call        dword ptr [eax+60]
 006E1C55    call        @CheckAutoResult
 006E1C5A    mov         eax,dword ptr [ebp-0B0]
 006E1C60    push        eax
 006E1C61    mov         eax,dword ptr [eax]
 006E1C63    call        dword ptr [eax+20]
 006E1C66    call        @CheckAutoResult
 006E1C6B    lea         eax,[ebp-0AC]
 006E1C71    call        @VarToReal
 006E1C76    fstp        qword ptr [ebp-10]
 006E1C79    wait
>006E1C7A    jmp         006E201A
 006E1C7F    cmp         dword ptr [esi*4+822200],0;gvar_00822200
>006E1C87    jne         006E1C96
 006E1C89    xor         eax,eax
 006E1C8B    mov         dword ptr [ebp-10],eax
 006E1C8E    mov         dword ptr [ebp-0C],eax
>006E1C91    jmp         006E201A
 006E1C96    lea         eax,[ebp-0C0]
 006E1C9C    call        @VarClr
 006E1CA1    push        eax
 006E1CA2    mov         eax,dword ptr [esi*4+822200];gvar_00822200
 006E1CA9    push        eax
 006E1CAA    mov         eax,dword ptr [eax]
 006E1CAC    call        dword ptr [eax+54]
 006E1CAF    call        @CheckAutoResult
 006E1CB4    lea         eax,[ebp-0C0]
 006E1CBA    call        @VarNeg
 006E1CBF    lea         eax,[ebp-0C0]
 006E1CC5    call        @VarToBool
 006E1CCA    test        al,al
>006E1CCC    je          006E1CDB
 006E1CCE    xor         eax,eax
 006E1CD0    mov         dword ptr [ebp-10],eax
 006E1CD3    mov         dword ptr [ebp-0C],eax
>006E1CD6    jmp         006E201A
 006E1CDB    lea         eax,[ebp-0D0]
 006E1CE1    call        @VarClr
 006E1CE6    push        eax
 006E1CE7    lea         eax,[ebp-0D4]
 006E1CED    call        @IntfClear
 006E1CF2    push        eax
 006E1CF3    mov         eax,dword ptr [ebx+20];TTrackIRValue.......................................................
 006E1CF6    sub         eax,22
 006E1CF9    push        eax
 006E1CFA    mov         eax,dword ptr [ebx+18];TTrackIRValue.......................................................
 006E1CFD    mov         eax,dword ptr [eax*4+822200];gvar_00822200
 006E1D04    push        eax
 006E1D05    mov         eax,dword ptr [eax]
 006E1D07    call        dword ptr [eax+60]
 006E1D0A    call        @CheckAutoResult
 006E1D0F    mov         eax,dword ptr [ebp-0D4]
 006E1D15    push        eax
 006E1D16    mov         eax,dword ptr [eax]
 006E1D18    call        dword ptr [eax+24]
 006E1D1B    call        @CheckAutoResult
 006E1D20    lea         eax,[ebp-0D0]
 006E1D26    call        @VarToReal
 006E1D2B    fstp        qword ptr [ebp-10]
 006E1D2E    wait
>006E1D2F    jmp         006E201A
 006E1D34    mov         eax,[0078D6CC];^gvar_008221BC
 006E1D39    mov         eax,dword ptr [eax]
 006E1D3B    fld         dword ptr [eax+18]
 006E1D3E    fdiv        dword ptr ds:[6E20C0];-32768:Single
 006E1D44    fstp        qword ptr [ebp-10]
 006E1D47    wait
>006E1D48    jmp         006E201A
 006E1D4D    mov         eax,[0078D6CC];^gvar_008221BC
 006E1D52    mov         eax,dword ptr [eax]
 006E1D54    fld         dword ptr [eax+1C]
 006E1D57    fdiv        dword ptr ds:[6E20C4];32768:Single
 006E1D5D    fstp        qword ptr [ebp-10]
 006E1D60    wait
>006E1D61    jmp         006E201A
 006E1D66    mov         eax,[0078D6CC];^gvar_008221BC
 006E1D6B    mov         eax,dword ptr [eax]
 006E1D6D    fld         dword ptr [eax+20]
 006E1D70    fdiv        dword ptr ds:[6E20C0];-32768:Single
 006E1D76    fstp        qword ptr [ebp-10]
 006E1D79    wait
>006E1D7A    jmp         006E201A
 006E1D7F    mov         eax,[0078D6CC];^gvar_008221BC
 006E1D84    mov         eax,dword ptr [eax]
 006E1D86    fld         dword ptr [eax+14]
 006E1D89    fmul        dword ptr ds:[6E20C8];-360:Single
 006E1D8F    fdiv        dword ptr ds:[6E20C4];32768:Single
 006E1D95    fstp        qword ptr [ebp-10]
 006E1D98    wait
>006E1D99    jmp         006E201A
 006E1D9E    mov         eax,[0078D6CC];^gvar_008221BC
 006E1DA3    mov         eax,dword ptr [eax]
 006E1DA5    fld         dword ptr [eax+10]
 006E1DA8    fmul        dword ptr ds:[6E20C8];-360:Single
 006E1DAE    fdiv        dword ptr ds:[6E20C4];32768:Single
 006E1DB4    fstp        qword ptr [ebp-10]
 006E1DB7    wait
>006E1DB8    jmp         006E201A
 006E1DBD    mov         eax,[0078D6CC];^gvar_008221BC
 006E1DC2    mov         eax,dword ptr [eax]
 006E1DC4    fld         dword ptr [eax+0C]
 006E1DC7    fmul        dword ptr ds:[6E20CC];360:Single
 006E1DCD    fdiv        dword ptr ds:[6E20C4];32768:Single
 006E1DD3    fstp        qword ptr [ebp-10]
 006E1DD6    wait
>006E1DD7    jmp         006E201A
 006E1DDC    mov         eax,[0078D6CC];^gvar_008221BC
 006E1DE1    mov         eax,dword ptr [eax]
 006E1DE3    mov         eax,dword ptr [eax+48]
 006E1DE6    mov         dword ptr [ebp-0DC],eax
 006E1DEC    xor         eax,eax
 006E1DEE    mov         dword ptr [ebp-0D8],eax
 006E1DF4    fild        qword ptr [ebp-0DC]
 006E1DFA    fstp        qword ptr [ebp-10]
 006E1DFD    wait
>006E1DFE    jmp         006E201A
 006E1E03    mov         eax,[0078D4CC];^gvar_00822178:Pointer
 006E1E08    fld         dword ptr [eax+14]
 006E1E0B    fdiv        dword ptr ds:[6E20C0];-32768:Single
 006E1E11    fstp        qword ptr [ebp-10]
 006E1E14    wait
>006E1E15    jmp         006E201A
 006E1E1A    mov         eax,[0078D4CC];^gvar_00822178:Pointer
 006E1E1F    fld         dword ptr [eax+18]
 006E1E22    fdiv        dword ptr ds:[6E20C4];32768:Single
 006E1E28    fstp        qword ptr [ebp-10]
 006E1E2B    wait
>006E1E2C    jmp         006E201A
 006E1E31    mov         eax,[0078D4CC];^gvar_00822178:Pointer
 006E1E36    fld         dword ptr [eax+1C]
 006E1E39    fdiv        dword ptr ds:[6E20C0];-32768:Single
 006E1E3F    fstp        qword ptr [ebp-10]
 006E1E42    wait
>006E1E43    jmp         006E201A
 006E1E48    mov         eax,[0078D4CC];^gvar_00822178:Pointer
 006E1E4D    fld         dword ptr [eax+10]
 006E1E50    fmul        dword ptr ds:[6E20C8];-360:Single
 006E1E56    fdiv        dword ptr ds:[6E20C4];32768:Single
 006E1E5C    fstp        qword ptr [ebp-10]
 006E1E5F    wait
>006E1E60    jmp         006E201A
 006E1E65    mov         eax,[0078D4CC];^gvar_00822178:Pointer
 006E1E6A    fld         dword ptr [eax+0C]
 006E1E6D    fmul        dword ptr ds:[6E20C8];-360:Single
 006E1E73    fdiv        dword ptr ds:[6E20C4];32768:Single
 006E1E79    fstp        qword ptr [ebp-10]
 006E1E7C    wait
>006E1E7D    jmp         006E201A
 006E1E82    mov         eax,[0078D4CC];^gvar_00822178:Pointer
 006E1E87    fld         dword ptr [eax+8]
 006E1E8A    fmul        dword ptr ds:[6E20CC];360:Single
 006E1E90    fdiv        dword ptr ds:[6E20C4];32768:Single
 006E1E96    fstp        qword ptr [ebp-10]
 006E1E99    wait
>006E1E9A    jmp         006E201A
 006E1E9F    mov         eax,[0078D9E8];^gvar_00822160
 006E1EA4    cmp         dword ptr [eax],0
>006E1EA7    jne         006E1EB1
 006E1EA9    mov         word ptr [ebp-12],0
>006E1EAF    jmp         006E1EBE
 006E1EB1    lea         eax,[ebp-12]
 006E1EB4    push        eax
 006E1EB5    mov         eax,[0078D9E8];^gvar_00822160
 006E1EBA    mov         eax,dword ptr [eax]
 006E1EBC    call        eax
 006E1EBE    movzx       eax,word ptr [ebp-12]
 006E1EC2    mov         dword ptr [ebp-18],eax
 006E1EC5    fild        dword ptr [ebp-18]
 006E1EC8    fstp        qword ptr [ebp-10]
 006E1ECB    wait
>006E1ECC    jmp         006E201A
 006E1ED1    mov         eax,[0078D4CC];^gvar_00822178:Pointer
 006E1ED6    fld         dword ptr [eax+14]
 006E1ED9    fdiv        dword ptr ds:[6E20C0];-32768:Single
 006E1EDF    fstp        qword ptr [ebp-10]
 006E1EE2    wait
>006E1EE3    jmp         006E201A
 006E1EE8    mov         eax,[0078D4CC];^gvar_00822178:Pointer
 006E1EED    fld         dword ptr [eax+18]
 006E1EF0    fdiv        dword ptr ds:[6E20C4];32768:Single
 006E1EF6    fstp        qword ptr [ebp-10]
 006E1EF9    wait
>006E1EFA    jmp         006E201A
 006E1EFF    mov         eax,[0078D4CC];^gvar_00822178:Pointer
 006E1F04    fld         dword ptr [eax+1C]
 006E1F07    fdiv        dword ptr ds:[6E20C0];-32768:Single
 006E1F0D    fstp        qword ptr [ebp-10]
 006E1F10    wait
>006E1F11    jmp         006E201A
 006E1F16    mov         eax,[0078D4CC];^gvar_00822178:Pointer
 006E1F1B    fld         dword ptr [eax+10]
 006E1F1E    fmul        dword ptr ds:[6E20C8];-360:Single
 006E1F24    fdiv        dword ptr ds:[6E20C4];32768:Single
 006E1F2A    fstp        qword ptr [ebp-10]
 006E1F2D    wait
>006E1F2E    jmp         006E201A
 006E1F33    mov         eax,[0078D4CC];^gvar_00822178:Pointer
 006E1F38    fld         dword ptr [eax+0C]
 006E1F3B    fmul        dword ptr ds:[6E20C8];-360:Single
 006E1F41    fdiv        dword ptr ds:[6E20C4];32768:Single
 006E1F47    fstp        qword ptr [ebp-10]
 006E1F4A    wait
>006E1F4B    jmp         006E201A
 006E1F50    mov         eax,[0078D4CC];^gvar_00822178:Pointer
 006E1F55    fld         dword ptr [eax+8]
 006E1F58    fmul        dword ptr ds:[6E20CC];360:Single
 006E1F5E    fdiv        dword ptr ds:[6E20C4];32768:Single
 006E1F64    fstp        qword ptr [ebp-10]
 006E1F67    wait
>006E1F68    jmp         006E201A
 006E1F6D    mov         eax,[0078D9E8];^gvar_00822160
 006E1F72    cmp         dword ptr [eax],0
>006E1F75    jne         006E1F7F
 006E1F77    mov         word ptr [ebp-12],0
>006E1F7D    jmp         006E1F8C
 006E1F7F    lea         eax,[ebp-12]
 006E1F82    push        eax
 006E1F83    mov         eax,[0078D9E8];^gvar_00822160
 006E1F88    mov         eax,dword ptr [eax]
 006E1F8A    call        eax
 006E1F8C    movzx       eax,word ptr [ebp-12]
 006E1F90    mov         dword ptr [ebp-18],eax
 006E1F93    fild        dword ptr [ebp-18]
 006E1F96    fstp        qword ptr [ebp-10]
 006E1F99    wait
>006E1F9A    jmp         006E201A
 006E1F9C    mov         eax,[0078D6CC];^gvar_008221BC
 006E1FA1    mov         eax,dword ptr [eax]
 006E1FA3    fild        dword ptr [eax+5C]
 006E1FA6    fstp        qword ptr [ebp-10]
 006E1FA9    wait
>006E1FAA    jmp         006E201A
 006E1FAC    mov         eax,[0078D6CC];^gvar_008221BC
 006E1FB1    mov         eax,dword ptr [eax]
 006E1FB3    mov         eax,dword ptr [eax+4C]
 006E1FB6    mov         dword ptr [ebp-0DC],eax
 006E1FBC    xor         eax,eax
 006E1FBE    mov         dword ptr [ebp-0D8],eax
 006E1FC4    fild        qword ptr [ebp-0DC]
 006E1FCA    fstp        qword ptr [ebp-10]
 006E1FCD    wait
>006E1FCE    jmp         006E201A
 006E1FD0    mov         eax,[0078D6CC];^gvar_008221BC
 006E1FD5    mov         eax,dword ptr [eax]
 006E1FD7    fild        dword ptr [eax+58]
 006E1FDA    fstp        qword ptr [ebp-10]
 006E1FDD    wait
>006E1FDE    jmp         006E201A
 006E1FE0    mov         eax,[0078D6CC];^gvar_008221BC
 006E1FE5    mov         eax,dword ptr [eax]
 006E1FE7    cmp         dword ptr [eax+54],1
 006E1FEB    sbb         eax,eax
 006E1FED    inc         eax
 006E1FEE    call        00686074
 006E1FF3    fstp        qword ptr [ebp-10]
 006E1FF6    wait
>006E1FF7    jmp         006E201A
 006E1FF9    mov         eax,[0078D6CC];^gvar_008221BC
 006E1FFE    mov         eax,dword ptr [eax]
 006E2000    cmp         dword ptr [eax+50],1
 006E2004    sbb         eax,eax
 006E2006    inc         eax
 006E2007    call        00686074
 006E200C    fstp        qword ptr [ebp-10]
 006E200F    wait
>006E2010    jmp         006E201A
 006E2012    xor         eax,eax
 006E2014    mov         dword ptr [ebp-10],eax
 006E2017    mov         dword ptr [ebp-0C],eax
 006E201A    xor         eax,eax
 006E201C    pop         edx
 006E201D    pop         ecx
 006E201E    pop         ecx
 006E201F    mov         dword ptr fs:[eax],edx
>006E2022    jmp         006E2036
>006E2024    jmp         @HandleAnyException
 006E2029    xor         eax,eax
 006E202B    mov         dword ptr [ebp-10],eax
 006E202E    mov         dword ptr [ebp-0C],eax
 006E2031    call        @DoneExcept
 006E2036    xor         eax,eax
 006E2038    pop         edx
 006E2039    pop         ecx
 006E203A    pop         ecx
 006E203B    mov         dword ptr fs:[eax],edx
 006E203E    push        6E20B6
 006E2043    lea         eax,[ebp-0D4]
 006E2049    call        @IntfClear
 006E204E    lea         eax,[ebp-0D0]
 006E2054    mov         edx,dword ptr ds:[4012D4];OleVariant
 006E205A    mov         ecx,2
 006E205F    call        @FinalizeArray
 006E2064    lea         eax,[ebp-0B0]
 006E206A    call        @IntfClear
 006E206F    lea         eax,[ebp-0AC]
 006E2075    mov         edx,dword ptr ds:[4012D4];OleVariant
 006E207B    mov         ecx,2
 006E2080    call        @FinalizeArray
 006E2085    lea         eax,[ebp-8C]
 006E208B    call        @IntfClear
 006E2090    lea         eax,[ebp-88]
 006E2096    mov         edx,dword ptr ds:[4012D4];OleVariant
 006E209C    mov         ecx,7
 006E20A1    call        @FinalizeArray
 006E20A6    lea         eax,[ebp-4]
 006E20A9    call        @IntfClear
 006E20AE    ret
>006E20AF    jmp         @HandleFinally
>006E20B4    jmp         006E2043
 006E20B6    fld         qword ptr [ebp-10]
 006E20B9    pop         edi
 006E20BA    pop         esi
 006E20BB    pop         ebx
 006E20BC    mov         esp,ebp
 006E20BE    pop         ebp
 006E20BF    ret
*}
end;

//006E20D0
procedure TTrackIRValue.MakeReadWrite;
begin
{*
 006E20D0    mov         edx,dword ptr [eax]
 006E20D2    call        dword ptr [edx+90];TTrackIRValue.MakeWrite
 006E20D8    ret
*}
end;

//006E20DC
procedure TTrackIRValue.MakeWrite;
begin
{*
 006E20DC    mov         edx,dword ptr [eax+20];TTrackIRValue.......................................................
 006E20DF    cmp         edx,38
>006E20E2    jl          006E215B
 006E20E4    cmp         edx,3E
>006E20E7    jg          006E215B
 006E20E9    mov         byte ptr ds:[8221D4],1;gvar_008221D4
 006E20F0    mov         edx,dword ptr [eax+20];TTrackIRValue.......................................................
 006E20F3    add         edx,0FFFFFFC8
 006E20F6    cmp         edx,6
>006E20F9    ja          006E215B
 006E20FB    jmp         dword ptr [edx*4+6E2102]
 006E20FB    dd          006E211E
 006E20FB    dd          006E2127
 006E20FB    dd          006E2130
 006E20FB    dd          006E2139
 006E20FB    dd          006E2142
 006E20FB    dd          006E214B
 006E20FB    dd          006E2154
 006E211E    mov         dword ptr [eax+20],29;TTrackIRValue........................................................
>006E2125    jmp         006E215B
 006E2127    mov         dword ptr [eax+20],28;TTrackIRValue........................................................
>006E212E    jmp         006E215B
 006E2130    mov         dword ptr [eax+20],2A;TTrackIRValue........................................................
>006E2137    jmp         006E215B
 006E2139    mov         dword ptr [eax+20],25;TTrackIRValue........................................................
>006E2140    jmp         006E215B
 006E2142    mov         dword ptr [eax+20],26;TTrackIRValue........................................................
>006E2149    jmp         006E215B
 006E214B    mov         dword ptr [eax+20],27;TTrackIRValue........................................................
>006E2152    jmp         006E215B
 006E2154    mov         dword ptr [eax+20],2B;TTrackIRValue........................................................
 006E215B    ret
*}
end;

//006E215C
{*function TTrackIRValue.SetValue(NewValue:Double; ?:?):Boolean;
begin
 006E215C    push        ebp
 006E215D    mov         ebp,esp
 006E215F    mov         ecx,8
 006E2164    push        0
 006E2166    push        0
 006E2168    dec         ecx
>006E2169    jne         006E2164
 006E216B    push        ebx
 006E216C    push        esi
 006E216D    push        edi
 006E216E    mov         esi,eax
 006E2170    xor         eax,eax
 006E2172    push        ebp
 006E2173    push        6E2565
 006E2178    push        dword ptr fs:[eax]
 006E217B    mov         dword ptr fs:[eax],esp
 006E217E    mov         bl,1
 006E2180    xor         edx,edx
 006E2182    push        ebp
 006E2183    push        6E2538
 006E2188    push        dword ptr fs:[edx]
 006E218B    mov         dword ptr fs:[edx],esp
 006E218E    mov         eax,dword ptr [esi+20];TTrackIRValue.......................................................
 006E2191    cmp         eax,3E
>006E2194    ja          006E2520
 006E219A    movzx       eax,byte ptr [eax+6E21A8]
 006E21A1    jmp         dword ptr [eax*4+6E21E7]
 006E21A1    db          1
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          6
 006E21A1    db          6
 006E21A1    db          6
 006E21A1    db          6
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          2
 006E21A1    db          3
 006E21A1    db          4
 006E21A1    db          5
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          7
 006E21A1    db          8
 006E21A1    db          9
 006E21A1    db          11
 006E21A1    db          10
 006E21A1    db          12
 006E21A1    db          13
 006E21A1    db          15
 006E21A1    db          18
 006E21A1    db          17
 006E21A1    db          16
 006E21A1    db          14
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          0
 006E21A1    db          10
 006E21A1    db          11
 006E21A1    db          12
 006E21A1    db          7
 006E21A1    db          8
 006E21A1    db          9
 006E21A1    db          13
 006E21A1    dd          006E2520
 006E21A1    dd          006E2233
 006E21A1    dd          006E223A
 006E21A1    dd          006E227C
 006E21A1    dd          006E22BE
 006E21A1    dd          006E2300
 006E21A1    dd          006E2342
 006E21A1    dd          006E23EC
 006E21A1    dd          006E2405
 006E21A1    dd          006E241E
 006E21A1    dd          006E2437
 006E21A1    dd          006E2456
 006E21A1    dd          006E2475
 006E21A1    dd          006E2494
 006E21A1    dd          006E24A9
 006E21A1    dd          006E24BE
 006E21A1    dd          006E24D3
 006E21A1    dd          006E24E8
 006E21A1    dd          006E2504
 006E2233    xor         ebx,ebx
>006E2235    jmp         006E2522
 006E223A    mov         edi,dword ptr [esi+18];TTrackIRValue.......................................................
 006E223D    cmp         dword ptr [edi*4+822200],0;gvar_00822200
>006E2245    jne         006E224E
 006E2247    xor         ebx,ebx
>006E2249    jmp         006E2522
 006E224E    fld         qword ptr [ebp+8]
 006E2251    lea         eax,[ebp-10]
 006E2254    call        @VarFromReal
 006E2259    push        dword ptr [ebp-4]
 006E225C    push        dword ptr [ebp-8]
 006E225F    push        dword ptr [ebp-0C]
 006E2262    push        dword ptr [ebp-10]
 006E2265    mov         eax,dword ptr [edi*4+822200];gvar_00822200
 006E226C    push        eax
 006E226D    mov         eax,dword ptr [eax]
 006E226F    call        dword ptr [eax+38]
 006E2272    call        @CheckAutoResult
>006E2277    jmp         006E2522
 006E227C    mov         edi,dword ptr [esi+18];TTrackIRValue.......................................................
 006E227F    cmp         dword ptr [edi*4+822200],0;gvar_00822200
>006E2287    jne         006E2290
 006E2289    xor         ebx,ebx
>006E228B    jmp         006E2522
 006E2290    fld         qword ptr [ebp+8]
 006E2293    lea         eax,[ebp-20]
 006E2296    call        @VarFromReal
 006E229B    push        dword ptr [ebp-14]
 006E229E    push        dword ptr [ebp-18]
 006E22A1    push        dword ptr [ebp-1C]
 006E22A4    push        dword ptr [ebp-20]
 006E22A7    mov         eax,dword ptr [edi*4+822200];gvar_00822200
 006E22AE    push        eax
 006E22AF    mov         eax,dword ptr [eax]
 006E22B1    call        dword ptr [eax+40]
 006E22B4    call        @CheckAutoResult
>006E22B9    jmp         006E2522
 006E22BE    mov         edi,dword ptr [esi+18];TTrackIRValue.......................................................
 006E22C1    cmp         dword ptr [edi*4+822200],0;gvar_00822200
>006E22C9    jne         006E22D2
 006E22CB    xor         ebx,ebx
>006E22CD    jmp         006E2522
 006E22D2    fld         qword ptr [ebp+8]
 006E22D5    lea         eax,[ebp-30]
 006E22D8    call        @VarFromReal
 006E22DD    push        dword ptr [ebp-24]
 006E22E0    push        dword ptr [ebp-28]
 006E22E3    push        dword ptr [ebp-2C]
 006E22E6    push        dword ptr [ebp-30]
 006E22E9    mov         eax,dword ptr [edi*4+822200];gvar_00822200
 006E22F0    push        eax
 006E22F1    mov         eax,dword ptr [eax]
 006E22F3    call        dword ptr [eax+48]
 006E22F6    call        @CheckAutoResult
>006E22FB    jmp         006E2522
 006E2300    mov         edi,dword ptr [esi+18];TTrackIRValue.......................................................
 006E2303    cmp         dword ptr [edi*4+822200],0;gvar_00822200
>006E230B    jne         006E2314
 006E230D    xor         ebx,ebx
>006E230F    jmp         006E2522
 006E2314    fld         qword ptr [ebp+8]
 006E2317    lea         eax,[ebp-40]
 006E231A    call        @VarFromReal
 006E231F    push        dword ptr [ebp-34]
 006E2322    push        dword ptr [ebp-38]
 006E2325    push        dword ptr [ebp-3C]
 006E2328    push        dword ptr [ebp-40]
 006E232B    mov         eax,dword ptr [edi*4+822200];gvar_00822200
 006E2332    push        eax
 006E2333    mov         eax,dword ptr [eax]
 006E2335    call        dword ptr [eax+50]
 006E2338    call        @CheckAutoResult
>006E233D    jmp         006E2522
 006E2342    push        dword ptr [ebp+0C]
 006E2345    push        dword ptr [ebp+8]
 006E2348    call        00686060
 006E234D    mov         edi,dword ptr [esi+20];TTrackIRValue.......................................................
 006E2350    sub         edi,0B
 006E2353    mov         edx,dword ptr [esi+18];TTrackIRValue.......................................................
 006E2356    lea         edx,[edx*4+822224];gvar_00822224
 006E235D    cmp         byte ptr [edx+edi-4],0
>006E2362    je          006E2396
 006E2364    test        al,al
>006E2366    je          006E2379
 006E2368    mov         edx,dword ptr [esi+18];TTrackIRValue.......................................................
 006E236B    lea         edx,[edx*4+822224];gvar_00822224
 006E2372    cmp         byte ptr [edx+edi-4],0
>006E2377    jl          006E2396
 006E2379    test        al,al
>006E237B    jne         006E2522
 006E2381    mov         edx,dword ptr [esi+18];TTrackIRValue.......................................................
 006E2384    lea         edx,[edx*4+822224];gvar_00822224
 006E238B    cmp         byte ptr [edx+edi-4],0
>006E2390    jle         006E2522
 006E2396    test        al,al
>006E2398    je          006E23AB
 006E239A    mov         edx,dword ptr [esi+18];TTrackIRValue.......................................................
 006E239D    lea         edx,[edx*4+822224];gvar_00822224
 006E23A4    mov         byte ptr [edx+edi-4],1
>006E23A9    jmp         006E23BA
 006E23AB    mov         edx,dword ptr [esi+18];TTrackIRValue.......................................................
 006E23AE    lea         edx,[edx*4+822224];gvar_00822224
 006E23B5    mov         byte ptr [edx+edi-4],0FF
 006E23BA    mov         edx,dword ptr [esi+18];TTrackIRValue.......................................................
 006E23BD    cmp         dword ptr [edx*4+8221E0],0;gvar_008221E0
>006E23C5    je          006E2522
 006E23CB    cmp         al,1
 006E23CD    cmc
 006E23CE    sbb         eax,eax
 006E23D0    push        eax
 006E23D1    push        edi
 006E23D2    mov         eax,dword ptr [esi+18];TTrackIRValue.......................................................
 006E23D5    mov         eax,dword ptr [eax*4+8221E0];gvar_008221E0
 006E23DC    push        eax
 006E23DD    mov         eax,dword ptr [eax]
 006E23DF    call        dword ptr [eax+44]
 006E23E2    call        @CheckAutoResult
>006E23E7    jmp         006E2522
 006E23EC    fld         qword ptr [ebp+8]
 006E23EF    fmul        dword ptr ds:[6E2578];-32768:Single
 006E23F5    mov         eax,[0078D6CC];^gvar_008221BC
 006E23FA    mov         eax,dword ptr [eax]
 006E23FC    fstp        dword ptr [eax+18]
 006E23FF    wait
>006E2400    jmp         006E2522
 006E2405    fld         qword ptr [ebp+8]
 006E2408    fmul        dword ptr ds:[6E257C];32768:Single
 006E240E    mov         eax,[0078D6CC];^gvar_008221BC
 006E2413    mov         eax,dword ptr [eax]
 006E2415    fstp        dword ptr [eax+1C]
 006E2418    wait
>006E2419    jmp         006E2522
 006E241E    fld         qword ptr [ebp+8]
 006E2421    fmul        dword ptr ds:[6E2578];-32768:Single
 006E2427    mov         eax,[0078D6CC];^gvar_008221BC
 006E242C    mov         eax,dword ptr [eax]
 006E242E    fstp        dword ptr [eax+20]
 006E2431    wait
>006E2432    jmp         006E2522
 006E2437    fld         qword ptr [ebp+8]
 006E243A    fmul        dword ptr ds:[6E2578];-32768:Single
 006E2440    fdiv        dword ptr ds:[6E2580];360:Single
 006E2446    mov         eax,[0078D6CC];^gvar_008221BC
 006E244B    mov         eax,dword ptr [eax]
 006E244D    fstp        dword ptr [eax+14]
 006E2450    wait
>006E2451    jmp         006E2522
 006E2456    fld         qword ptr [ebp+8]
 006E2459    fmul        dword ptr ds:[6E2578];-32768:Single
 006E245F    fdiv        dword ptr ds:[6E2580];360:Single
 006E2465    mov         eax,[0078D6CC];^gvar_008221BC
 006E246A    mov         eax,dword ptr [eax]
 006E246C    fstp        dword ptr [eax+10]
 006E246F    wait
>006E2470    jmp         006E2522
 006E2475    fld         qword ptr [ebp+8]
 006E2478    fmul        dword ptr ds:[6E257C];32768:Single
 006E247E    fdiv        dword ptr ds:[6E2580];360:Single
 006E2484    mov         eax,[0078D6CC];^gvar_008221BC
 006E2489    mov         eax,dword ptr [eax]
 006E248B    fstp        dword ptr [eax+0C]
 006E248E    wait
>006E248F    jmp         006E2522
 006E2494    fld         qword ptr [ebp+8]
 006E2497    call        @ROUND
 006E249C    mov         edx,dword ptr ds:[78D6CC];^gvar_008221BC
 006E24A2    mov         edx,dword ptr [edx]
 006E24A4    mov         dword ptr [edx+48],eax
>006E24A7    jmp         006E2522
 006E24A9    fld         qword ptr [ebp+8]
 006E24AC    call        @ROUND
 006E24B1    mov         edx,dword ptr ds:[78D6CC];^gvar_008221BC
 006E24B7    mov         edx,dword ptr [edx]
 006E24B9    mov         dword ptr [edx+5C],eax
>006E24BC    jmp         006E2522
 006E24BE    fld         qword ptr [ebp+8]
 006E24C1    call        @ROUND
 006E24C6    mov         edx,dword ptr ds:[78D6CC];^gvar_008221BC
 006E24CC    mov         edx,dword ptr [edx]
 006E24CE    mov         dword ptr [edx+4C],eax
>006E24D1    jmp         006E2522
 006E24D3    fld         qword ptr [ebp+8]
 006E24D6    call        @ROUND
 006E24DB    mov         edx,dword ptr ds:[78D6CC];^gvar_008221BC
 006E24E1    mov         edx,dword ptr [edx]
 006E24E3    mov         dword ptr [edx+58],eax
>006E24E6    jmp         006E2522
 006E24E8    push        dword ptr [ebp+0C]
 006E24EB    push        dword ptr [ebp+8]
 006E24EE    call        00686060
 006E24F3    neg         al
 006E24F5    sbb         eax,eax
 006E24F7    mov         edx,dword ptr ds:[78D6CC];^gvar_008221BC
 006E24FD    mov         edx,dword ptr [edx]
 006E24FF    mov         dword ptr [edx+54],eax
>006E2502    jmp         006E2522
 006E2504    push        dword ptr [ebp+0C]
 006E2507    push        dword ptr [ebp+8]
 006E250A    call        00686060
 006E250F    neg         al
 006E2511    sbb         eax,eax
 006E2513    mov         edx,dword ptr ds:[78D6CC];^gvar_008221BC
 006E2519    mov         edx,dword ptr [edx]
 006E251B    mov         dword ptr [edx+50],eax
>006E251E    jmp         006E2522
 006E2520    xor         ebx,ebx
 006E2522    mov         eax,dword ptr [ebp+8]
 006E2525    mov         dword ptr [esi+8],eax;TTrackIRValue.PreviousValue:Double
 006E2528    mov         eax,dword ptr [ebp+0C]
 006E252B    mov         dword ptr [esi+0C],eax;TTrackIRValue.?fC:dword
 006E252E    xor         eax,eax
 006E2530    pop         edx
 006E2531    pop         ecx
 006E2532    pop         ecx
 006E2533    mov         dword ptr fs:[eax],edx
>006E2536    jmp         006E2544
>006E2538    jmp         @HandleAnyException
 006E253D    xor         ebx,ebx
 006E253F    call        @DoneExcept
 006E2544    xor         eax,eax
 006E2546    pop         edx
 006E2547    pop         ecx
 006E2548    pop         ecx
 006E2549    mov         dword ptr fs:[eax],edx
 006E254C    push        6E256C
 006E2551    lea         eax,[ebp-40]
 006E2554    mov         edx,dword ptr ds:[4012D4];OleVariant
 006E255A    mov         ecx,4
 006E255F    call        @FinalizeArray
 006E2564    ret
>006E2565    jmp         @HandleFinally
>006E256A    jmp         006E2551
 006E256C    mov         eax,ebx
 006E256E    pop         edi
 006E256F    pop         esi
 006E2570    pop         ebx
 006E2571    mov         esp,ebp
 006E2573    pop         ebp
 006E2574    ret         8
end;*}

//006E2584
{*procedure TTrackIRValue.ToString(?:?);
begin
 006E2584    push        ebp
 006E2585    mov         ebp,esp
 006E2587    push        0
 006E2589    push        0
 006E258B    push        0
 006E258D    push        ebx
 006E258E    push        esi
 006E258F    push        edi
 006E2590    mov         esi,edx
 006E2592    mov         ebx,eax
 006E2594    xor         eax,eax
 006E2596    push        ebp
 006E2597    push        6E2611
 006E259C    push        dword ptr fs:[eax]
 006E259F    mov         dword ptr fs:[eax],esp
 006E25A2    mov         edi,dword ptr [ebx+18];TTrackIRValue.......................................................
 006E25A5    test        edi,edi
>006E25A7    jle         006E25DC
 006E25A9    push        6E262C;'TrackIR'
 006E25AE    lea         edx,[ebp-4]
 006E25B1    mov         eax,edi
 006E25B3    call        IntToStr
 006E25B8    push        dword ptr [ebp-4]
 006E25BB    push        6E2648;'.'
 006E25C0    lea         edx,[ebp-8]
 006E25C3    mov         eax,dword ptr [ebx+20];TTrackIRValue.......................................................
 006E25C6    call        006E2F4C
 006E25CB    push        dword ptr [ebp-8]
 006E25CE    mov         eax,esi
 006E25D0    mov         edx,4
 006E25D5    call        @UStrCatN
>006E25DA    jmp         006E25F6
 006E25DC    lea         edx,[ebp-0C]
 006E25DF    mov         eax,dword ptr [ebx+20];TTrackIRValue.......................................................
 006E25E2    call        006E2F4C
 006E25E7    mov         ecx,dword ptr [ebp-0C]
 006E25EA    mov         eax,esi
 006E25EC    mov         edx,6E2658;'TrackIR.'
 006E25F1    call        @UStrCat3
 006E25F6    xor         eax,eax
 006E25F8    pop         edx
 006E25F9    pop         ecx
 006E25FA    pop         ecx
 006E25FB    mov         dword ptr fs:[eax],edx
 006E25FE    push        6E2618
 006E2603    lea         eax,[ebp-0C]
 006E2606    mov         edx,3
 006E260B    call        @UStrArrayClr
 006E2610    ret
>006E2611    jmp         @HandleFinally
>006E2616    jmp         006E2603
 006E2618    pop         edi
 006E2619    pop         esi
 006E261A    pop         ebx
 006E261B    mov         esp,ebp
 006E261D    pop         ebp
 006E261E    ret
end;*}

//006E266C
procedure sub_006E266C;
begin
{*
 006E266C    push        ebx
 006E266D    push        esi
 006E266E    push        edi
 006E266F    push        ebp
 006E2670    mov         byte ptr ds:[8221CC],0;gvar_008221CC
 006E2677    mov         byte ptr ds:[8221D0],0;gvar_008221D0
 006E267E    mov         byte ptr ds:[8221CE],0;gvar_008221CE
 006E2685    xor         eax,eax
 006E2687    mov         [0078C2F4],eax;0:Single
 006E268C    mov         ebp,8
 006E2691    mov         ebx,8221DC;gvar_008221DC
 006E2696    mov         esi,8221E4;gvar_008221E4:IInterface
 006E269B    mov         edi,822204;gvar_00822204:IInterface
 006E26A0    mov         byte ptr [ebx],0
 006E26A3    mov         eax,esi
 006E26A5    call        @IntfClear
 006E26AA    mov         eax,edi
 006E26AC    call        @IntfClear
 006E26B1    add         edi,4
 006E26B4    add         esi,4
 006E26B7    inc         ebx
 006E26B8    dec         ebp
>006E26B9    jne         006E26A0
 006E26BB    pop         ebp
 006E26BC    pop         edi
 006E26BD    pop         esi
 006E26BE    pop         ebx
 006E26BF    ret
*}
end;

//006E26C0
procedure sub_006E26C0;
begin
{*
 006E26C0    ret
*}
end;

//006E26C4
procedure sub_006E26C4;
begin
{*
 006E26C4    push        ebp
 006E26C5    mov         ebp,esp
 006E26C7    add         esp,0FFFFFFC4
 006E26CA    push        ebx
 006E26CB    push        esi
 006E26CC    push        edi
 006E26CD    xor         eax,eax
 006E26CF    mov         dword ptr [ebp-3C],eax
 006E26D2    mov         dword ptr [ebp-38],eax
 006E26D5    mov         dword ptr [ebp-4],eax
 006E26D8    xor         eax,eax
 006E26DA    push        ebp
 006E26DB    push        6E29E4
 006E26E0    push        dword ptr fs:[eax]
 006E26E3    mov         dword ptr fs:[eax],esp
 006E26E6    mov         byte ptr ds:[8221CD],0;gvar_008221CD
 006E26ED    cmp         byte ptr ds:[8221CC],0;gvar_008221CC
>006E26F4    je          006E29BE
 006E26FA    mov         byte ptr ds:[78C2FC],0;gvar_0078C2FC
 006E2701    xor         eax,eax
 006E2703    mov         [0078C2F4],eax;0:Single
 006E2708    mov         dword ptr [ebp-8],8
 006E270F    mov         esi,8221E4;gvar_008221E4:IInterface
 006E2714    mov         edi,822204;gvar_00822204:IInterface
 006E2719    mov         ebx,822224;gvar_00822224
 006E271E    mov         dword ptr [ebp-10],822288
 006E2725    mov         dword ptr [ebp-14],8222C8
 006E272C    mov         dword ptr [ebp-18],822308
 006E2733    mov         dword ptr [ebp-1C],822348
 006E273A    mov         dword ptr [ebp-20],822388
 006E2741    mov         dword ptr [ebp-24],8223C8
 006E2748    mov         eax,esi
 006E274A    call        @IntfClear
 006E274F    mov         eax,edi
 006E2751    call        @IntfClear
 006E2756    mov         byte ptr [ebx],0
 006E2759    mov         byte ptr [ebx+1],0
 006E275D    mov         byte ptr [ebx+2],0
 006E2761    mov         byte ptr [ebx+3],0
 006E2765    mov         eax,dword ptr [ebp-10]
 006E2768    xor         edx,edx
 006E276A    mov         dword ptr [eax],edx
 006E276C    mov         dword ptr [eax+4],edx
 006E276F    mov         eax,dword ptr [ebp-14]
 006E2772    xor         edx,edx
 006E2774    mov         dword ptr [eax],edx
 006E2776    mov         dword ptr [eax+4],edx
 006E2779    mov         eax,dword ptr [ebp-18]
 006E277C    xor         edx,edx
 006E277E    mov         dword ptr [eax],edx
 006E2780    mov         dword ptr [eax+4],edx
 006E2783    mov         eax,dword ptr [ebp-1C]
 006E2786    xor         edx,edx
 006E2788    mov         dword ptr [eax],edx
 006E278A    mov         dword ptr [eax+4],edx
 006E278D    mov         eax,dword ptr [ebp-20]
 006E2790    xor         edx,edx
 006E2792    mov         dword ptr [eax],edx
 006E2794    mov         dword ptr [eax+4],edx
 006E2797    mov         eax,dword ptr [ebp-24]
 006E279A    xor         edx,edx
 006E279C    mov         dword ptr [eax],edx
 006E279E    mov         dword ptr [eax+4],edx
 006E27A1    add         dword ptr [ebp-24],8
 006E27A5    add         dword ptr [ebp-20],8
 006E27A9    add         dword ptr [ebp-1C],8
 006E27AD    add         dword ptr [ebp-18],8
 006E27B1    add         dword ptr [ebp-14],8
 006E27B5    add         dword ptr [ebp-10],8
 006E27B9    add         ebx,4
 006E27BC    add         edi,4
 006E27BF    add         esi,4
 006E27C2    dec         dword ptr [ebp-8]
>006E27C5    jne         006E2748
 006E27C7    cmp         byte ptr ds:[8221CE],0;gvar_008221CE
>006E27CE    je          006E2958
 006E27D4    xor         eax,eax
 006E27D6    push        ebp
 006E27D7    push        6E2828
 006E27DC    push        dword ptr fs:[eax]
 006E27DF    mov         dword ptr fs:[eax],esp
 006E27E2    lea         edx,[ebp-4]
 006E27E5    mov         eax,[006DED18];CoNPCameraCollection
 006E27EA    call        CoNPCameraCollection.Create
 006E27EF    mov         byte ptr ds:[78C2FC],1;gvar_0078C2FC
 006E27F6    mov         eax,dword ptr [ebp-4]
 006E27F9    push        eax
 006E27FA    mov         eax,dword ptr [eax]
 006E27FC    call        dword ptr [eax+28]
 006E27FF    call        @CheckAutoResult
 006E2804    lea         eax,[ebp-34]
 006E2807    push        eax
 006E2808    mov         eax,dword ptr [ebp-4]
 006E280B    push        eax
 006E280C    mov         eax,dword ptr [eax]
 006E280E    call        dword ptr [eax+20]
 006E2811    call        @CheckAutoResult
 006E2816    mov         eax,dword ptr [ebp-34]
 006E2819    mov         [0078C2F4],eax;0:Single
 006E281E    xor         eax,eax
 006E2820    pop         edx
 006E2821    pop         ecx
 006E2822    pop         ecx
 006E2823    mov         dword ptr fs:[eax],edx
>006E2826    jmp         006E283C
>006E2828    jmp         @HandleAnyException
 006E282D    call        @DoneExcept
>006E2832    jmp         006E29BE
 006E2837    call        @DoneExcept
 006E283C    mov         eax,[0078C2F4];0x0 0:Single
 006E2841    mov         [0078C2F8],eax;gvar_0078C2F8:Single
 006E2846    cmp         dword ptr ds:[78C2F8],8;gvar_0078C2F8:Single
>006E284D    jle         006E2859
 006E284F    mov         dword ptr ds:[78C2F8],8;gvar_0078C2F8:Single
 006E2859    cmp         dword ptr ds:[78C2F4],0;0:Single
 006E2860    setg        byte ptr ds:[8221CD];gvar_008221CD
 006E2867    movzx       eax,byte ptr ds:[8221CD];gvar_008221CD
 006E286E    mov         [008221CF],al;gvar_008221CF
 006E2873    cmp         byte ptr ds:[8221CD],0;gvar_008221CD
>006E287A    je          006E2958
 006E2880    mov         eax,[0078C2F8];0x0 gvar_0078C2F8:Single
 006E2885    test        eax,eax
>006E2887    jle         006E2958
 006E288D    mov         dword ptr [ebp-0C],eax
 006E2890    mov         dword ptr [ebp-8],1
 006E2897    mov         dword ptr [ebp-28],8221DC;gvar_008221DC
 006E289E    mov         dword ptr [ebp-2C],8221E4;gvar_008221E4:IInterface
 006E28A5    mov         dword ptr [ebp-30],822204;gvar_00822204:IInterface
 006E28AC    mov         eax,dword ptr [ebp-28]
 006E28AF    cmp         byte ptr [eax],0
>006E28B2    je          006E2941
 006E28B8    xor         eax,eax
 006E28BA    push        ebp
 006E28BB    push        6E292F
 006E28C0    push        dword ptr fs:[eax]
 006E28C3    mov         dword ptr fs:[eax],esp
 006E28C6    lea         eax,[ebp-38]
 006E28C9    call        @IntfClear
 006E28CE    push        eax
 006E28CF    mov         eax,dword ptr [ebp-8]
 006E28D2    dec         eax
 006E28D3    push        eax
 006E28D4    mov         eax,dword ptr [ebp-4]
 006E28D7    push        eax
 006E28D8    mov         eax,dword ptr [eax]
 006E28DA    call        dword ptr [eax+24]
 006E28DD    call        @CheckAutoResult
 006E28E2    mov         edx,dword ptr [ebp-38]
 006E28E5    mov         eax,dword ptr [ebp-2C]
 006E28E8    call        @IntfCopy
 006E28ED    mov         eax,dword ptr [ebp-2C]
 006E28F0    mov         eax,dword ptr [eax]
 006E28F2    push        eax
 006E28F3    mov         eax,dword ptr [eax]
 006E28F5    call        dword ptr [eax+3C]
 006E28F8    call        @CheckAutoResult
 006E28FD    lea         edx,[ebp-3C]
 006E2900    mov         eax,[006DEE50];CoNPVector
 006E2905    call        CoNPVector.Create
 006E290A    mov         edx,dword ptr [ebp-3C]
 006E290D    mov         eax,dword ptr [ebp-30]
 006E2910    call        @IntfCopy
 006E2915    mov         eax,dword ptr [ebp-2C]
 006E2918    mov         eax,dword ptr [eax]
 006E291A    push        eax
 006E291B    mov         eax,dword ptr [eax]
 006E291D    call        dword ptr [eax+34]
 006E2920    call        @CheckAutoResult
 006E2925    xor         eax,eax
 006E2927    pop         edx
 006E2928    pop         ecx
 006E2929    pop         ecx
 006E292A    mov         dword ptr fs:[eax],edx
>006E292D    jmp         006E2941
>006E292F    jmp         @HandleAnyException
 006E2934    mov         eax,dword ptr [ebp-2C]
 006E2937    call        @IntfClear
 006E293C    call        @DoneExcept
 006E2941    inc         dword ptr [ebp-8]
 006E2944    add         dword ptr [ebp-30],4
 006E2948    add         dword ptr [ebp-2C],4
 006E294C    inc         dword ptr [ebp-28]
 006E294F    dec         dword ptr [ebp-0C]
>006E2952    jne         006E28AC
 006E2958    cmp         byte ptr ds:[8221D0],0;gvar_008221D0
>006E295F    je          006E297A
 006E2961    cmp         byte ptr ds:[8221D4],0;gvar_008221D4
>006E2968    jne         006E297A
 006E296A    cmp         byte ptr ds:[8221D2],0;gvar_008221D2
>006E2971    jne         006E297A
 006E2973    mov         byte ptr ds:[8221D2],1;gvar_008221D2
 006E297A    cmp         byte ptr ds:[8221D4],0;gvar_008221D4
>006E2981    je          006E298D
 006E2983    call        006DF648
 006E2988    mov         [008221D5],al;gvar_008221D5
 006E298D    cmp         byte ptr ds:[8221D2],0;gvar_008221D2
>006E2994    je          006E29BE
 006E2996    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006E299B    mov         eax,dword ptr [eax]
 006E299D    call        TWinControl.GetHandle
 006E29A2    call        006DF828
 006E29A7    mov         [008221D3],al;gvar_008221D3
 006E29AC    movzx       eax,byte ptr ds:[8221CD];gvar_008221CD
 006E29B3    or          al,byte ptr ds:[8221D3];gvar_008221D3
 006E29B9    mov         [008221CD],al;gvar_008221CD
 006E29BE    xor         eax,eax
 006E29C0    pop         edx
 006E29C1    pop         ecx
 006E29C2    pop         ecx
 006E29C3    mov         dword ptr fs:[eax],edx
 006E29C6    push        6E29EB
 006E29CB    lea         eax,[ebp-3C]
 006E29CE    call        @IntfClear
 006E29D3    lea         eax,[ebp-38]
 006E29D6    call        @IntfClear
 006E29DB    lea         eax,[ebp-4]
 006E29DE    call        @IntfClear
 006E29E3    ret
>006E29E4    jmp         @HandleFinally
>006E29E9    jmp         006E29CB
 006E29EB    pop         edi
 006E29EC    pop         esi
 006E29ED    pop         ebx
 006E29EE    mov         esp,ebp
 006E29F0    pop         ebp
 006E29F1    ret
*}
end;

//006E29F4
procedure sub_006E29F4;
begin
{*
 006E29F4    push        ebp
 006E29F5    mov         ebp,esp
 006E29F7    call        006DF648
 006E29FC    test        al,al
>006E29FE    je          006E2A31
 006E2A00    xor         eax,eax
 006E2A02    push        ebp
 006E2A03    push        6E2A2A
 006E2A08    push        dword ptr fs:[eax]
 006E2A0B    mov         dword ptr fs:[eax],esp
 006E2A0E    mov         eax,[0078CB1C];^gvar_00822174
 006E2A13    mov         eax,dword ptr [eax]
 006E2A15    call        eax
 006E2A17    xor         eax,eax
 006E2A19    pop         edx
 006E2A1A    pop         ecx
 006E2A1B    pop         ecx
 006E2A1C    mov         dword ptr fs:[eax],edx
 006E2A1F    push        6E2A31
 006E2A24    call        006DF45C
 006E2A29    ret
>006E2A2A    jmp         @HandleFinally
>006E2A2F    jmp         006E2A24
 006E2A31    pop         ebp
 006E2A32    ret
*}
end;

//006E2A34
procedure sub_006E2A34;
begin
{*
 006E2A34    push        ebp
 006E2A35    mov         ebp,esp
 006E2A37    add         esp,0FFFFFFF4
 006E2A3A    push        ebx
 006E2A3B    push        esi
 006E2A3C    push        edi
 006E2A3D    movzx       eax,byte ptr ds:[8221CE];gvar_008221CE
 006E2A44    and         al,byte ptr ds:[8221CF];gvar_008221CF
>006E2A4A    je          006E2B48
 006E2A50    mov         dword ptr [ebp-4],8
 006E2A57    mov         dword ptr [ebp-8],8221E4;gvar_008221E4:IInterface
 006E2A5E    mov         dword ptr [ebp-0C],822204;gvar_00822204:IInterface
 006E2A65    mov         eax,dword ptr [ebp-8]
 006E2A68    cmp         dword ptr [eax],0
>006E2A6B    je          006E2B29
 006E2A71    xor         eax,eax
 006E2A73    push        ebp
 006E2A74    push        6E2A99
 006E2A79    push        dword ptr fs:[eax]
 006E2A7C    mov         dword ptr fs:[eax],esp
 006E2A7F    mov         eax,dword ptr [ebp-8]
 006E2A82    mov         eax,dword ptr [eax]
 006E2A84    push        eax
 006E2A85    mov         eax,dword ptr [eax]
 006E2A87    call        dword ptr [eax+38]
 006E2A8A    call        @CheckAutoResult
 006E2A8F    xor         eax,eax
 006E2A91    pop         edx
 006E2A92    pop         ecx
 006E2A93    pop         ecx
 006E2A94    mov         dword ptr fs:[eax],edx
>006E2A97    jmp         006E2AA3
>006E2A99    jmp         @HandleAnyException
 006E2A9E    call        @DoneExcept
 006E2AA3    xor         eax,eax
 006E2AA5    push        ebp
 006E2AA6    push        6E2ACB
 006E2AAB    push        dword ptr fs:[eax]
 006E2AAE    mov         dword ptr fs:[eax],esp
 006E2AB1    mov         eax,dword ptr [ebp-8]
 006E2AB4    mov         eax,dword ptr [eax]
 006E2AB6    push        eax
 006E2AB7    mov         eax,dword ptr [eax]
 006E2AB9    call        dword ptr [eax+40]
 006E2ABC    call        @CheckAutoResult
 006E2AC1    xor         eax,eax
 006E2AC3    pop         edx
 006E2AC4    pop         ecx
 006E2AC5    pop         ecx
 006E2AC6    mov         dword ptr fs:[eax],edx
>006E2AC9    jmp         006E2AD5
>006E2ACB    jmp         @HandleAnyException
 006E2AD0    call        @DoneExcept
 006E2AD5    xor         eax,eax
 006E2AD7    push        ebp
 006E2AD8    push        6E2AF5
 006E2ADD    push        dword ptr fs:[eax]
 006E2AE0    mov         dword ptr fs:[eax],esp
 006E2AE3    mov         eax,dword ptr [ebp-8]
 006E2AE6    call        @IntfClear
 006E2AEB    xor         eax,eax
 006E2AED    pop         edx
 006E2AEE    pop         ecx
 006E2AEF    pop         ecx
 006E2AF0    mov         dword ptr fs:[eax],edx
>006E2AF3    jmp         006E2AFF
>006E2AF5    jmp         @HandleAnyException
 006E2AFA    call        @DoneExcept
 006E2AFF    xor         eax,eax
 006E2B01    push        ebp
 006E2B02    push        6E2B1F
 006E2B07    push        dword ptr fs:[eax]
 006E2B0A    mov         dword ptr fs:[eax],esp
 006E2B0D    mov         eax,dword ptr [ebp-0C]
 006E2B10    call        @IntfClear
 006E2B15    xor         eax,eax
 006E2B17    pop         edx
 006E2B18    pop         ecx
 006E2B19    pop         ecx
 006E2B1A    mov         dword ptr fs:[eax],edx
>006E2B1D    jmp         006E2B29
>006E2B1F    jmp         @HandleAnyException
 006E2B24    call        @DoneExcept
 006E2B29    add         dword ptr [ebp-0C],4
 006E2B2D    add         dword ptr [ebp-8],4
 006E2B31    dec         dword ptr [ebp-4]
>006E2B34    jne         006E2A65
 006E2B3A    mov         byte ptr ds:[8221CD],0;gvar_008221CD
 006E2B41    mov         byte ptr ds:[8221CF],0;gvar_008221CF
 006E2B48    cmp         byte ptr ds:[8221D5],0;gvar_008221D5
>006E2B4F    je          006E2B56
 006E2B51    call        006DF45C
 006E2B56    cmp         byte ptr ds:[8221D3],0;gvar_008221D3
>006E2B5D    je          006E2B86
 006E2B5F    xor         eax,eax
 006E2B61    push        ebp
 006E2B62    push        6E2B7C
 006E2B67    push        dword ptr fs:[eax]
 006E2B6A    mov         dword ptr fs:[eax],esp
 006E2B6D    call        006DF494
 006E2B72    xor         eax,eax
 006E2B74    pop         edx
 006E2B75    pop         ecx
 006E2B76    pop         ecx
 006E2B77    mov         dword ptr fs:[eax],edx
>006E2B7A    jmp         006E2B86
>006E2B7C    jmp         @HandleAnyException
 006E2B81    call        @DoneExcept
 006E2B86    mov         byte ptr ds:[8221CD],0;gvar_008221CD
 006E2B8D    mov         byte ptr ds:[8221D1],0;gvar_008221D1
 006E2B94    mov         byte ptr ds:[8221D5],0;gvar_008221D5
 006E2B9B    mov         byte ptr ds:[8221D3],0;gvar_008221D3
 006E2BA2    pop         edi
 006E2BA3    pop         esi
 006E2BA4    pop         ebx
 006E2BA5    mov         esp,ebp
 006E2BA7    pop         ebp
 006E2BA8    ret
*}
end;

//006E2BAC
{*function sub_006E2BAC:?;
begin
 006E2BAC    push        ebp
 006E2BAD    mov         ebp,esp
 006E2BAF    mov         ecx,13
 006E2BB4    push        0
 006E2BB6    push        0
 006E2BB8    dec         ecx
>006E2BB9    jne         006E2BB4
 006E2BBB    push        ebx
 006E2BBC    push        esi
 006E2BBD    push        edi
 006E2BBE    xor         eax,eax
 006E2BC0    push        ebp
 006E2BC1    push        6E2EEC
 006E2BC6    push        dword ptr fs:[eax]
 006E2BC9    mov         dword ptr fs:[eax],esp
 006E2BCC    movzx       eax,byte ptr ds:[8221CE];gvar_008221CE
 006E2BD3    and         al,byte ptr ds:[8221CF];gvar_008221CF
>006E2BD9    je          006E2EAA
 006E2BDF    mov         eax,[0078C2F8];0x0 gvar_0078C2F8:Single
 006E2BE4    test        eax,eax
>006E2BE6    jle         006E2EBE
 006E2BEC    mov         dword ptr [ebp-8],eax
 006E2BEF    mov         dword ptr [ebp-0C],8221DC;gvar_008221DC
 006E2BF6    mov         dword ptr [ebp-10],8221E4;gvar_008221E4:IInterface
 006E2BFD    mov         dword ptr [ebp-14],822244
 006E2C04    mov         dword ptr [ebp-18],822264
 006E2C0B    mov         dword ptr [ebp-1C],822204;gvar_00822204:IInterface
 006E2C12    mov         dword ptr [ebp-20],822288
 006E2C19    mov         dword ptr [ebp-24],8222C8
 006E2C20    mov         dword ptr [ebp-28],822308
 006E2C27    mov         dword ptr [ebp-2C],822348
 006E2C2E    mov         dword ptr [ebp-30],822388
 006E2C35    mov         dword ptr [ebp-34],8223C8
 006E2C3C    mov         eax,dword ptr [ebp-0C]
 006E2C3F    cmp         byte ptr [eax],0
>006E2C42    je          006E2E74
 006E2C48    mov         eax,dword ptr [ebp-10]
 006E2C4B    cmp         dword ptr [eax],0
>006E2C4E    je          006E2E74
 006E2C54    xor         eax,eax
 006E2C56    push        ebp
 006E2C57    push        6E2E6A
 006E2C5C    push        dword ptr fs:[eax]
 006E2C5F    mov         dword ptr fs:[eax],esp
 006E2C62    lea         eax,[ebp-4]
 006E2C65    call        @IntfClear
 006E2C6A    push        eax
 006E2C6B    push        0
 006E2C6D    mov         eax,dword ptr [ebp-10]
 006E2C70    mov         eax,dword ptr [eax]
 006E2C72    push        eax
 006E2C73    mov         eax,dword ptr [eax]
 006E2C75    call        dword ptr [eax+48]
 006E2C78    call        @CheckAutoResult
 006E2C7D    xor         eax,eax
 006E2C7F    push        ebp
 006E2C80    push        6E2E59
 006E2C85    push        dword ptr fs:[eax]
 006E2C88    mov         dword ptr fs:[eax],esp
 006E2C8B    lea         eax,[ebp-38]
 006E2C8E    push        eax
 006E2C8F    mov         eax,dword ptr [ebp-4]
 006E2C92    push        eax
 006E2C93    mov         eax,dword ptr [eax]
 006E2C95    call        dword ptr [eax+2C]
 006E2C98    call        @CheckAutoResult
 006E2C9D    mov         eax,dword ptr [ebp-38]
 006E2CA0    mov         edx,dword ptr [ebp-14]
 006E2CA3    mov         dword ptr [edx],eax
 006E2CA5    lea         eax,[ebp-38]
 006E2CA8    push        eax
 006E2CA9    mov         eax,dword ptr [ebp-4]
 006E2CAC    push        eax
 006E2CAD    mov         eax,dword ptr [eax]
 006E2CAF    call        dword ptr [eax+20]
 006E2CB2    call        @CheckAutoResult
 006E2CB7    mov         eax,dword ptr [ebp-38]
 006E2CBA    mov         edx,dword ptr [ebp-18]
 006E2CBD    mov         dword ptr [edx],eax
 006E2CBF    xor         eax,eax
 006E2CC1    push        ebp
 006E2CC2    push        6E2E2B
 006E2CC7    push        dword ptr fs:[eax]
 006E2CCA    mov         dword ptr fs:[eax],esp
 006E2CCD    mov         eax,dword ptr [ebp-4]
 006E2CD0    push        eax
 006E2CD1    mov         eax,dword ptr [ebp-10]
 006E2CD4    mov         eax,dword ptr [eax]
 006E2CD6    push        eax
 006E2CD7    mov         eax,dword ptr [ebp-1C]
 006E2CDA    mov         eax,dword ptr [eax]
 006E2CDC    push        eax
 006E2CDD    mov         eax,dword ptr [eax]
 006E2CDF    call        dword ptr [eax+58]
 006E2CE2    call        @CheckAutoResult
 006E2CE7    xor         eax,eax
 006E2CE9    push        ebp
 006E2CEA    push        6E2D74
 006E2CEF    push        dword ptr fs:[eax]
 006E2CF2    mov         dword ptr fs:[eax],esp
 006E2CF5    lea         eax,[ebp-48]
 006E2CF8    call        @VarClr
 006E2CFD    push        eax
 006E2CFE    mov         eax,dword ptr [ebp-1C]
 006E2D01    mov         eax,dword ptr [eax]
 006E2D03    push        eax
 006E2D04    mov         eax,dword ptr [eax]
 006E2D06    call        dword ptr [eax+28]
 006E2D09    call        @CheckAutoResult
 006E2D0E    lea         eax,[ebp-48]
 006E2D11    call        @VarToReal
 006E2D16    mov         eax,dword ptr [ebp-20]
 006E2D19    fstp        qword ptr [eax]
 006E2D1B    wait
 006E2D1C    lea         eax,[ebp-58]
 006E2D1F    call        @VarClr
 006E2D24    push        eax
 006E2D25    mov         eax,dword ptr [ebp-1C]
 006E2D28    mov         eax,dword ptr [eax]
 006E2D2A    push        eax
 006E2D2B    mov         eax,dword ptr [eax]
 006E2D2D    call        dword ptr [eax+2C]
 006E2D30    call        @CheckAutoResult
 006E2D35    lea         eax,[ebp-58]
 006E2D38    call        @VarToReal
 006E2D3D    mov         eax,dword ptr [ebp-24]
 006E2D40    fstp        qword ptr [eax]
 006E2D42    wait
 006E2D43    lea         eax,[ebp-68]
 006E2D46    call        @VarClr
 006E2D4B    push        eax
 006E2D4C    mov         eax,dword ptr [ebp-1C]
 006E2D4F    mov         eax,dword ptr [eax]
 006E2D51    push        eax
 006E2D52    mov         eax,dword ptr [eax]
 006E2D54    call        dword ptr [eax+30]
 006E2D57    call        @CheckAutoResult
 006E2D5C    lea         eax,[ebp-68]
 006E2D5F    call        @VarToReal
 006E2D64    mov         eax,dword ptr [ebp-28]
 006E2D67    fstp        qword ptr [eax]
 006E2D69    wait
 006E2D6A    xor         eax,eax
 006E2D6C    pop         edx
 006E2D6D    pop         ecx
 006E2D6E    pop         ecx
 006E2D6F    mov         dword ptr fs:[eax],edx
>006E2D72    jmp         006E2D7E
>006E2D74    jmp         @HandleAnyException
 006E2D79    call        @DoneExcept
 006E2D7E    xor         eax,eax
 006E2D80    push        ebp
 006E2D81    push        6E2E17
 006E2D86    push        dword ptr fs:[eax]
 006E2D89    mov         dword ptr fs:[eax],esp
 006E2D8C    lea         eax,[ebp-78]
 006E2D8F    call        @VarClr
 006E2D94    push        eax
 006E2D95    mov         eax,dword ptr [ebp-1C]
 006E2D98    mov         eax,dword ptr [eax]
 006E2D9A    push        eax
 006E2D9B    mov         eax,dword ptr [eax]
 006E2D9D    call        dword ptr [eax+20]
 006E2DA0    call        @CheckAutoResult
 006E2DA5    lea         eax,[ebp-78]
 006E2DA8    call        @VarToReal
 006E2DAD    mov         eax,dword ptr [ebp-2C]
 006E2DB0    fstp        qword ptr [eax]
 006E2DB2    wait
 006E2DB3    lea         eax,[ebp-88]
 006E2DB9    call        @VarClr
 006E2DBE    push        eax
 006E2DBF    mov         eax,dword ptr [ebp-1C]
 006E2DC2    mov         eax,dword ptr [eax]
 006E2DC4    push        eax
 006E2DC5    mov         eax,dword ptr [eax]
 006E2DC7    call        dword ptr [eax+1C]
 006E2DCA    call        @CheckAutoResult
 006E2DCF    lea         eax,[ebp-88]
 006E2DD5    call        @VarToReal
 006E2DDA    mov         eax,dword ptr [ebp-30]
 006E2DDD    fstp        qword ptr [eax]
 006E2DDF    wait
 006E2DE0    lea         eax,[ebp-98]
 006E2DE6    call        @VarClr
 006E2DEB    push        eax
 006E2DEC    mov         eax,dword ptr [ebp-1C]
 006E2DEF    mov         eax,dword ptr [eax]
 006E2DF1    push        eax
 006E2DF2    mov         eax,dword ptr [eax]
 006E2DF4    call        dword ptr [eax+24]
 006E2DF7    call        @CheckAutoResult
 006E2DFC    lea         eax,[ebp-98]
 006E2E02    call        @VarToReal
 006E2E07    mov         eax,dword ptr [ebp-34]
 006E2E0A    fstp        qword ptr [eax]
 006E2E0C    wait
 006E2E0D    xor         eax,eax
 006E2E0F    pop         edx
 006E2E10    pop         ecx
 006E2E11    pop         ecx
 006E2E12    mov         dword ptr fs:[eax],edx
>006E2E15    jmp         006E2E21
>006E2E17    jmp         @HandleAnyException
 006E2E1C    call        @DoneExcept
 006E2E21    xor         eax,eax
 006E2E23    pop         edx
 006E2E24    pop         ecx
 006E2E25    pop         ecx
 006E2E26    mov         dword ptr fs:[eax],edx
>006E2E29    jmp         006E2E35
>006E2E2B    jmp         @HandleAnyException
 006E2E30    call        @DoneExcept
 006E2E35    xor         eax,eax
 006E2E37    pop         edx
 006E2E38    pop         ecx
 006E2E39    pop         ecx
 006E2E3A    mov         dword ptr fs:[eax],edx
 006E2E3D    push        6E2E60
 006E2E42    mov         eax,dword ptr [ebp-4]
 006E2E45    push        eax
 006E2E46    mov         eax,dword ptr [eax]
 006E2E48    call        dword ptr [eax+30]
 006E2E4B    call        @CheckAutoResult
 006E2E50    lea         eax,[ebp-4]
 006E2E53    call        @IntfClear
 006E2E58    ret
>006E2E59    jmp         @HandleFinally
>006E2E5E    jmp         006E2E42
 006E2E60    xor         eax,eax
 006E2E62    pop         edx
 006E2E63    pop         ecx
 006E2E64    pop         ecx
 006E2E65    mov         dword ptr fs:[eax],edx
>006E2E68    jmp         006E2E74
>006E2E6A    jmp         @HandleAnyException
 006E2E6F    call        @DoneExcept
 006E2E74    add         dword ptr [ebp-34],8
 006E2E78    add         dword ptr [ebp-30],8
 006E2E7C    add         dword ptr [ebp-2C],8
 006E2E80    add         dword ptr [ebp-28],8
 006E2E84    add         dword ptr [ebp-24],8
 006E2E88    add         dword ptr [ebp-20],8
 006E2E8C    add         dword ptr [ebp-1C],4
 006E2E90    add         dword ptr [ebp-18],4
 006E2E94    add         dword ptr [ebp-14],4
 006E2E98    add         dword ptr [ebp-10],4
 006E2E9C    inc         dword ptr [ebp-0C]
 006E2E9F    dec         dword ptr [ebp-8]
>006E2EA2    jne         006E2C3C
>006E2EA8    jmp         006E2EBE
 006E2EAA    movzx       eax,byte ptr ds:[8221D2];gvar_008221D2
 006E2EB1    and         al,byte ptr ds:[8221D3];gvar_008221D3
>006E2EB7    je          006E2EBE
 006E2EB9    call        006DFCA8
 006E2EBE    mov         bl,1
 006E2EC0    xor         eax,eax
 006E2EC2    pop         edx
 006E2EC3    pop         ecx
 006E2EC4    pop         ecx
 006E2EC5    mov         dword ptr fs:[eax],edx
 006E2EC8    push        6E2EF3
 006E2ECD    lea         eax,[ebp-98]
 006E2ED3    mov         edx,dword ptr ds:[4012D4];OleVariant
 006E2ED9    mov         ecx,6
 006E2EDE    call        @FinalizeArray
 006E2EE3    lea         eax,[ebp-4]
 006E2EE6    call        @IntfClear
 006E2EEB    ret
>006E2EEC    jmp         @HandleFinally
>006E2EF1    jmp         006E2ECD
 006E2EF3    mov         eax,ebx
 006E2EF5    pop         edi
 006E2EF6    pop         esi
 006E2EF7    pop         ebx
 006E2EF8    mov         esp,ebp
 006E2EFA    pop         ebp
 006E2EFB    ret
end;*}

//006E2EFC
{*function sub_006E2EFC(?:UnicodeString):?;
begin
 006E2EFC    push        ebp
 006E2EFD    mov         ebp,esp
 006E2EFF    push        ecx
 006E2F00    push        ebx
 006E2F01    mov         dword ptr [ebp-4],eax
 006E2F04    mov         eax,dword ptr [ebp-4]
 006E2F07    call        @UStrAddRef
 006E2F0C    xor         eax,eax
 006E2F0E    push        ebp
 006E2F0F    push        6E2F3F
 006E2F14    push        dword ptr fs:[eax]
 006E2F17    mov         dword ptr fs:[eax],esp
 006E2F1A    mov         edx,dword ptr [ebp-4]
 006E2F1D    mov         eax,[008221C8];gvar_008221C8:THashTable
 006E2F22    call        THashTable.Get
 006E2F27    mov         ebx,eax
 006E2F29    xor         eax,eax
 006E2F2B    pop         edx
 006E2F2C    pop         ecx
 006E2F2D    pop         ecx
 006E2F2E    mov         dword ptr fs:[eax],edx
 006E2F31    push        6E2F46
 006E2F36    lea         eax,[ebp-4]
 006E2F39    call        @UStrClr
 006E2F3E    ret
>006E2F3F    jmp         @HandleFinally
>006E2F44    jmp         006E2F36
 006E2F46    mov         eax,ebx
 006E2F48    pop         ebx
 006E2F49    pop         ecx
 006E2F4A    pop         ebp
 006E2F4B    ret
end;*}

//006E2F4C
{*procedure sub_006E2F4C(?:Integer; ?:?);
begin
 006E2F4C    push        ebx
 006E2F4D    push        esi
 006E2F4E    mov         esi,edx
 006E2F50    mov         ebx,eax
 006E2F52    mov         ecx,esi
 006E2F54    mov         edx,ebx
 006E2F56    mov         eax,[008221C8];gvar_008221C8:THashTable
 006E2F5B    call        THashTable.Get
 006E2F60    pop         esi
 006E2F61    pop         ebx
 006E2F62    ret
end;*}

//006E2F64
{*function sub_006E2F64:?;
begin
 006E2F64    push        ebp
 006E2F65    mov         ebp,esp
 006E2F67    push        0
 006E2F69    push        ebx
 006E2F6A    push        esi
 006E2F6B    xor         eax,eax
 006E2F6D    push        ebp
 006E2F6E    push        6E2FC8
 006E2F73    push        dword ptr fs:[eax]
 006E2F76    mov         dword ptr fs:[eax],esp
 006E2F79    mov         dl,1
 006E2F7B    mov         eax,[0043C7BC];TStringList
 006E2F80    call        TStringList.Create;TStringList.Create
 006E2F85    mov         esi,eax
 006E2F87    mov         dl,1
 006E2F89    mov         eax,esi
 006E2F8B    call        TStringList.SetSorted
 006E2F90    xor         ebx,ebx
 006E2F92    lea         edx,[ebp-4]
 006E2F95    mov         eax,ebx
 006E2F97    call        006E2F4C
 006E2F9C    cmp         dword ptr [ebp-4],0
>006E2FA0    je          006E2FAC
 006E2FA2    mov         edx,dword ptr [ebp-4]
 006E2FA5    mov         eax,esi
 006E2FA7    mov         ecx,dword ptr [eax]
 006E2FA9    call        dword ptr [ecx+38];TStringList.Add
 006E2FAC    inc         ebx
 006E2FAD    cmp         ebx,3F
>006E2FB0    jne         006E2F92
 006E2FB2    xor         eax,eax
 006E2FB4    pop         edx
 006E2FB5    pop         ecx
 006E2FB6    pop         ecx
 006E2FB7    mov         dword ptr fs:[eax],edx
 006E2FBA    push        6E2FCF
 006E2FBF    lea         eax,[ebp-4]
 006E2FC2    call        @UStrClr
 006E2FC7    ret
>006E2FC8    jmp         @HandleFinally
>006E2FCD    jmp         006E2FBF
 006E2FCF    mov         eax,esi
 006E2FD1    pop         esi
 006E2FD2    pop         ebx
 006E2FD3    pop         ecx
 006E2FD4    pop         ebp
 006E2FD5    ret
end;*}

//006E2FD8
{*function sub_006E2FD8:?;
begin
 006E2FD8    push        ebx
 006E2FD9    mov         dl,1
 006E2FDB    mov         eax,[0043C7BC];TStringList
 006E2FE0    call        TStringList.Create;TStringList.Create
 006E2FE5    mov         ebx,eax
 006E2FE7    mov         edx,6E3040;'RealX'
 006E2FEC    mov         eax,ebx
 006E2FEE    mov         ecx,dword ptr [eax]
 006E2FF0    call        dword ptr [ecx+38];TStringList.Add
 006E2FF3    mov         edx,6E3058;'RealY'
 006E2FF8    mov         eax,ebx
 006E2FFA    mov         ecx,dword ptr [eax]
 006E2FFC    call        dword ptr [ecx+38];TStringList.Add
 006E2FFF    mov         edx,6E3070;'RealZ'
 006E3004    mov         eax,ebx
 006E3006    mov         ecx,dword ptr [eax]
 006E3008    call        dword ptr [ecx+38];TStringList.Add
 006E300B    mov         edx,6E3088;'RealYaw'
 006E3010    mov         eax,ebx
 006E3012    mov         ecx,dword ptr [eax]
 006E3014    call        dword ptr [ecx+38];TStringList.Add
 006E3017    mov         edx,6E30A4;'RealPitch'
 006E301C    mov         eax,ebx
 006E301E    mov         ecx,dword ptr [eax]
 006E3020    call        dword ptr [ecx+38];TStringList.Add
 006E3023    mov         edx,6E30C4;'RealRoll'
 006E3028    mov         eax,ebx
 006E302A    mov         ecx,dword ptr [eax]
 006E302C    call        dword ptr [ecx+38];TStringList.Add
 006E302F    mov         eax,ebx
 006E3031    pop         ebx
 006E3032    ret
end;*}

//006E30D8
{*function sub_006E30D8:?;
begin
 006E30D8    push        ebx
 006E30D9    mov         dl,1
 006E30DB    mov         eax,[0043C7BC];TStringList
 006E30E0    call        TStringList.Create;TStringList.Create
 006E30E5    mov         ebx,eax
 006E30E7    mov         dl,1
 006E30E9    mov         eax,ebx
 006E30EB    call        TStringList.SetSorted
 006E30F0    mov         edx,6E3190;'x'
 006E30F5    mov         eax,ebx
 006E30F7    mov         ecx,dword ptr [eax]
 006E30F9    call        dword ptr [ecx+38];TStringList.Add
 006E30FC    mov         edx,6E31A0;'y'
 006E3101    mov         eax,ebx
 006E3103    mov         ecx,dword ptr [eax]
 006E3105    call        dword ptr [ecx+38];TStringList.Add
 006E3108    mov         edx,6E31B0;'z'
 006E310D    mov         eax,ebx
 006E310F    mov         ecx,dword ptr [eax]
 006E3111    call        dword ptr [ecx+38];TStringList.Add
 006E3114    mov         edx,6E31C0;'pitch'
 006E3119    mov         eax,ebx
 006E311B    mov         ecx,dword ptr [eax]
 006E311D    call        dword ptr [ecx+38];TStringList.Add
 006E3120    mov         edx,6E31D8;'yaw'
 006E3125    mov         eax,ebx
 006E3127    mov         ecx,dword ptr [eax]
 006E3129    call        dword ptr [ecx+38];TStringList.Add
 006E312C    mov         edx,6E31EC;'roll'
 006E3131    mov         eax,ebx
 006E3133    mov         ecx,dword ptr [eax]
 006E3135    call        dword ptr [ecx+38];TStringList.Add
 006E3138    mov         edx,6E3204;'version'
 006E313D    mov         eax,ebx
 006E313F    mov         ecx,dword ptr [eax]
 006E3141    call        dword ptr [ecx+38];TStringList.Add
 006E3144    mov         edx,6E3220;'active'
 006E3149    mov         eax,ebx
 006E314B    mov         ecx,dword ptr [eax]
 006E314D    call        dword ptr [ecx+38];TStringList.Add
 006E3150    mov         edx,6E323C;'cursor'
 006E3155    mov         eax,ebx
 006E3157    mov         ecx,dword ptr [eax]
 006E3159    call        dword ptr [ecx+38];TStringList.Add
 006E315C    mov         edx,6E3258;'WindowHandle'
 006E3161    mov         eax,ebx
 006E3163    mov         ecx,dword ptr [eax]
 006E3165    call        dword ptr [ecx+38];TStringList.Add
 006E3168    mov         edx,6E3280;'ProfileID'
 006E316D    mov         eax,ebx
 006E316F    mov         ecx,dword ptr [eax]
 006E3171    call        dword ptr [ecx+38];TStringList.Add
 006E3174    mov         edx,6E32A0;'RequestFormat'
 006E3179    mov         eax,ebx
 006E317B    mov         ecx,dword ptr [eax]
 006E317D    call        dword ptr [ecx+38];TStringList.Add
 006E3180    mov         eax,ebx
 006E3182    pop         ebx
 006E3183    ret
end;*}

//006E32BC
{*function sub_006E32BC:?;
begin
 006E32BC    push        ebx
 006E32BD    mov         dl,1
 006E32BF    mov         eax,[0043C7BC];TStringList
 006E32C4    call        TStringList.Create;TStringList.Create
 006E32C9    mov         ebx,eax
 006E32CB    mov         dl,1
 006E32CD    mov         eax,ebx
 006E32CF    call        TStringList.SetSorted
 006E32D4    mov         edx,6E3338;'x'
 006E32D9    mov         eax,ebx
 006E32DB    mov         ecx,dword ptr [eax]
 006E32DD    call        dword ptr [ecx+38];TStringList.Add
 006E32E0    mov         edx,6E3348;'y'
 006E32E5    mov         eax,ebx
 006E32E7    mov         ecx,dword ptr [eax]
 006E32E9    call        dword ptr [ecx+38];TStringList.Add
 006E32EC    mov         edx,6E3358;'z'
 006E32F1    mov         eax,ebx
 006E32F3    mov         ecx,dword ptr [eax]
 006E32F5    call        dword ptr [ecx+38];TStringList.Add
 006E32F8    mov         edx,6E3368;'pitch'
 006E32FD    mov         eax,ebx
 006E32FF    mov         ecx,dword ptr [eax]
 006E3301    call        dword ptr [ecx+38];TStringList.Add
 006E3304    mov         edx,6E3380;'yaw'
 006E3309    mov         eax,ebx
 006E330B    mov         ecx,dword ptr [eax]
 006E330D    call        dword ptr [ecx+38];TStringList.Add
 006E3310    mov         edx,6E3394;'roll'
 006E3315    mov         eax,ebx
 006E3317    mov         ecx,dword ptr [eax]
 006E3319    call        dword ptr [ecx+38];TStringList.Add
 006E331C    mov         edx,6E33AC;'version'
 006E3321    mov         eax,ebx
 006E3323    mov         ecx,dword ptr [eax]
 006E3325    call        dword ptr [ecx+38];TStringList.Add
 006E3328    mov         eax,ebx
 006E332A    pop         ebx
 006E332B    ret
end;*}

//006E33BC
{*function sub_006E33BC(?:?):?;
begin
 006E33BC    push        ebp
 006E33BD    mov         ebp,esp
 006E33BF    push        ecx
 006E33C0    push        ebx
 006E33C1    mov         dword ptr [ebp-4],eax
 006E33C4    mov         eax,dword ptr [ebp-4]
 006E33C7    call        @UStrAddRef
 006E33CC    xor         eax,eax
 006E33CE    push        ebp
 006E33CF    push        6E3468
 006E33D4    push        dword ptr fs:[eax]
 006E33D7    mov         dword ptr fs:[eax],esp
 006E33DA    lea         eax,[ebp-4]
 006E33DD    mov         edx,6E3484;'FakeTrackIR'
 006E33E2    call        004F9BD0
 006E33E7    test        al,al
>006E33E9    jne         006E3433
 006E33EB    lea         eax,[ebp-4]
 006E33EE    mov         edx,6E34A8;'RealTrackIR'
 006E33F3    call        004F9BD0
 006E33F8    test        al,al
>006E33FA    jne         006E3433
 006E33FC    lea         eax,[ebp-4]
 006E33FF    mov         edx,6E34CC;'TrackIR'
 006E3404    call        004F9BD0
 006E3409    test        al,al
>006E340B    jne         006E3433
 006E340D    lea         eax,[ebp-4]
 006E3410    mov         edx,6E34E8;'Optitrack'
 006E3415    call        004F9BD0
 006E341A    test        al,al
>006E341C    jne         006E3433
 006E341E    lea         eax,[ebp-4]
 006E3421    mov         edx,6E3508;'SmartNav'
 006E3426    call        004F9BD0
 006E342B    test        al,al
>006E342D    jne         006E3433
 006E342F    xor         ebx,ebx
>006E3431    jmp         006E3452
 006E3433    lea         eax,[ebp-4]
 006E3436    call        004F9D00
 006E343B    lea         eax,[ebp-4]
 006E343E    mov         edx,6E3528;'.'
 006E3443    call        004F9BD0
 006E3448    test        al,al
>006E344A    jne         006E3450
 006E344C    xor         ebx,ebx
>006E344E    jmp         006E3452
 006E3450    mov         bl,1
 006E3452    xor         eax,eax
 006E3454    pop         edx
 006E3455    pop         ecx
 006E3456    pop         ecx
 006E3457    mov         dword ptr fs:[eax],edx
 006E345A    push        6E346F
 006E345F    lea         eax,[ebp-4]
 006E3462    call        @UStrClr
 006E3467    ret
>006E3468    jmp         @HandleFinally
>006E346D    jmp         006E345F
 006E346F    mov         eax,ebx
 006E3471    pop         ebx
 006E3472    pop         ecx
 006E3473    pop         ebp
 006E3474    ret
end;*}

Initialization
//00782A8C
{*
 00782A8C    push        ebp
 00782A8D    mov         ebp,esp
 00782A8F    push        ebx
 00782A90    push        esi
 00782A91    push        edi
 00782A92    xor         eax,eax
 00782A94    push        ebp
 00782A95    push        782B0A
 00782A9A    push        dword ptr fs:[eax]
 00782A9D    mov         dword ptr fs:[eax],esp
 00782AA0    sub         dword ptr ds:[8221D8],1
>00782AA7    jae         00782AFC
 00782AA9    xor         edx,edx
 00782AAB    push        ebp
 00782AAC    push        782AE1
 00782AB1    push        dword ptr fs:[edx]
 00782AB4    mov         dword ptr fs:[edx],esp
 00782AB7    mov         eax,782B24;'Initializing PieTrackIR'
 00782ABC    call        004FA5FC
 00782AC1    mov         dl,1
 00782AC3    mov         eax,[0067D4A4];THashTable
 00782AC8    call        THashTable.Create;THashTable.Create
 00782ACD    mov         [008221C8],eax;gvar_008221C8:THashTable
 00782AD2    call        006E00E4
 00782AD7    xor         eax,eax
 00782AD9    pop         edx
 00782ADA    pop         ecx
 00782ADB    pop         ecx
 00782ADC    mov         dword ptr fs:[eax],edx
>00782ADF    jmp         00782AFC
>00782AE1    jmp         @HandleOnException
 00782AE6    dd          1
 00782AEA    dd          00418C04;Exception
 00782AEE    dd          00782AF2
 00782AF2    call        004FA644
 00782AF7    call        @DoneExcept
 00782AFC    xor         eax,eax
 00782AFE    pop         edx
 00782AFF    pop         ecx
 00782B00    pop         ecx
 00782B01    mov         dword ptr fs:[eax],edx
 00782B04    push        782B11
 00782B09    ret
>00782B0A    jmp         @HandleFinally
>00782B0F    jmp         00782B09
 00782B11    pop         edi
 00782B12    pop         esi
 00782B13    pop         ebx
 00782B14    pop         ebp
 00782B15    ret
*}
Finalization
//006E352C
{*
 006E352C    push        ebp
 006E352D    mov         ebp,esp
 006E352F    push        ebx
 006E3530    push        esi
 006E3531    push        edi
 006E3532    xor         eax,eax
 006E3534    push        ebp
 006E3535    push        6E35D4
 006E353A    push        dword ptr fs:[eax]
 006E353D    mov         dword ptr fs:[eax],esp
 006E3540    inc         dword ptr ds:[8221D8]
>006E3546    jne         006E35C6
 006E3548    xor         edx,edx
 006E354A    push        ebp
 006E354B    push        6E3581
 006E3550    push        dword ptr fs:[edx]
 006E3553    mov         dword ptr fs:[edx],esp
 006E3556    mov         eax,6E35EC;'Finalizing PieTrackIR'
 006E355B    call        004FA5FC
 006E3560    mov         eax,[008221C8];gvar_008221C8:THashTable
 006E3565    xor         edx,edx
 006E3567    mov         dword ptr ds:[8221C8],edx;gvar_008221C8:THashTable
 006E356D    call        TObject.Free
 006E3572    call        006E2A34
 006E3577    xor         eax,eax
 006E3579    pop         edx
 006E357A    pop         ecx
 006E357B    pop         ecx
 006E357C    mov         dword ptr fs:[eax],edx
>006E357F    jmp         006E359C
>006E3581    jmp         @HandleOnException
 006E3586    dd          1
 006E358A    dd          00418C04;Exception
 006E358E    dd          006E3592
 006E3592    call        004FA644
 006E3597    call        @DoneExcept
 006E359C    mov         eax,8221E4;gvar_008221E4:IInterface
 006E35A1    mov         ecx,8
 006E35A6    mov         edx,dword ptr ds:[6DEC60];INPCamera
 006E35AC    call        @FinalizeArray
 006E35B1    mov         eax,822204;gvar_00822204:IInterface
 006E35B6    mov         ecx,8
 006E35BB    mov         edx,dword ptr ds:[6DECDC];INPVector2
 006E35C1    call        @FinalizeArray
 006E35C6    xor         eax,eax
 006E35C8    pop         edx
 006E35C9    pop         ecx
 006E35CA    pop         ecx
 006E35CB    mov         dword ptr fs:[eax],edx
 006E35CE    push        6E35DB
 006E35D3    ret
>006E35D4    jmp         @HandleFinally
>006E35D9    jmp         006E35D3
 006E35DB    pop         edi
 006E35DC    pop         esi
 006E35DD    pop         ebx
 006E35DE    pop         ebp
 006E35DF    ret
*}
end.