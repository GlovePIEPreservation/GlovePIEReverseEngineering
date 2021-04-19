//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieJoystick;

interface

uses
  SysUtils, Classes;

type
  TJoystickValue = class(TObjectValue)
  published
    procedure CreateClone;//0068FB64
    //procedure ToString(?:?);//00694404
    procedure FillClone(c:TExpression);//0068FB74
    function Module:TObject;//00693258
    procedure GetVector(x:Double; y:Double; z:Double);//006924C8
    //function SetValue(NewValue:Double; ?:?):Boolean;//00693260
    function GetUnits:TUnits;//0068FD04
    function GetDataType:TDataType;//0068FB94
    procedure GetValue;//006909B8
    function CanSet:Boolean;//0068FB60
    //procedure GetString(?:?);//0068FC44
  public
    ........................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//00694404
    procedure GetValue; virtual;//v2C//006909B8
    //procedure GetString(?:?); virtual;//v38//0068FC44
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//006924C8
    function GetDataType:TDataType; virtual;//v44//0068FB94
    function GetUnits:TUnits; virtual;//v48//0068FD04
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//00693260
    function CanSet:Boolean; virtual;//v68//0068FB60
    procedure CreateClone; virtual;//v80//0068FB64
    procedure FillClone(c:TExpression); virtual;//v84//0068FB74
    function Module:TObject; virtual;//v98//00693258
  end;
  TModuleJoystick = class(TPieModule)
  published
    procedure PrepareForMonitoring;//006982A4
    procedure StartGUI;//006982C4
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//00698170
    procedure PrepareForGUI;//006982A0
    procedure StopGUI;//006982F8
    procedure MonitorFrame;//00698298
    function IsIdentifier(s:string):Boolean;//0069818C
    procedure StartMonitoring;//006982C8
    procedure StopMonitoring;//006982FC
    procedure GetGoodFields;//00698168
    procedure StartCompiletime;//006982B8
    procedure StopCompiletime;//006982E4
    procedure StartRuntime;//006982D8
    procedure StopRuntime;//0069830C
    constructor Create;//00698080
    procedure ClearRead;//00698078
    procedure Read;//006982B0
    procedure AddFields;//00694BFC
    function CreateValue(Identifier:string):TExpression;//0069811C
  public
    function IsIdentifier(s:string):Boolean; virtual;//v10//0069818C
    function CreateValue(Identifier:string):TExpression; virtual;//v14//0069811C
    procedure GetGoodFields; virtual;//v1C//00698168
    procedure AddFields; virtual;//v24//00694BFC
    procedure StartCompiletime; virtual;//v28//006982B8
    procedure StopCompiletime; virtual;//v2C//006982E4
    procedure StartRuntime; virtual;//v30//006982D8
    procedure StopRuntime; virtual;//v34//0069830C
    procedure ClearRead; virtual;//v38//00698078
    procedure Read; virtual;//v3C//006982B0
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//00698170
    procedure PrepareForGUI; virtual;//v50//006982A0
    procedure StartGUI; virtual;//v54//006982C4
    procedure StopGUI; virtual;//v58//006982F8
    procedure PrepareForMonitoring; virtual;//v5C//006982A4
    procedure StartMonitoring; virtual;//v60//006982C8
    procedure StopMonitoring; virtual;//v64//006982FC
    procedure MonitorFrame; virtual;//v68//00698298
  end;
  :4 = array of IDirectInputDevice8A;
//elSize = 4
//varType equivalent: varUnknown;
  :5 = array of DIDEVICEINSTANCEA;
//elSize = 244;
  :6 = array of DIJOYSTATE2;
//elSize = 110;
  :7 = array of Boolean;
//elSize = 1;
  :8 = array of Boolean;
//elSize = 1;
  :9 = array of IDirectInputEffect;
//elSize = 4
//varType equivalent: varUnknown;
  :01 = array of Double;
//elSize = 8
//varType equivalent: varDouble;
  :11 = array of Double;
//elSize = 8
//varType equivalent: varDouble;
    //function sub_0068EFC4:?;//0068EFC4
    //function sub_0068F244(?:UnicodeString):?;//0068F244
    procedure sub_0068F518;//0068F518
    //function sub_0068F768(?:UnicodeString):?;//0068F768
    //procedure sub_0068F7BC(?:Integer; ?:?);//0068F7BC
    //function sub_0068F7D8(?:?):?;//0068F7D8
    //function sub_0068F8A8(?:?):?;//0068F8A8
    //function sub_0068F980(?:?):?;//0068F980
    //function sub_0068F9E0(?:?):?;//0068F9E0
    //function sub_0068FA40(?:?):?;//0068FA40
    //function sub_0068FAA0(?:?):?;//0068FAA0
    //function sub_0068FB00(?:?):?;//0068FB00
    //function sub_0068FCC8(?:?):?;//0068FCC8
    //function sub_0068FD18(?:?; ?:?):?;//0068FD18
    //function sub_0068FD94(?:?):?;//0068FD94
    //function sub_0068FEA8(?:?):?;//0068FEA8
    //function sub_0068FF78(?:?):?;//0068FF78
    //function sub_00690048(?:?):?;//00690048
    //function sub_00690118(?:?):?;//00690118
    //function sub_00690340(?:?):?;//00690340
    //function sub_00690568(?:?):?;//00690568
    //function sub_00690790(?:?):?;//00690790
    procedure sub_006932E0;//006932E0
    procedure sub_006937B4;//006937B4
    //function sub_00693ADC:?;//00693ADC
    //function sub_00693B68:?;//00693B68
    //function sub_00693D08:?;//00693D08
    //function sub_00693D20:?;//00693D20
    //procedure sub_00693E80(?:?; ?:?; ?:?);//00693E80
    //procedure sub_00693EA0(?:?; ?:?; ?:?);//00693EA0
    //procedure sub_00693EC0(?:Integer; ?:?; ?:?; ?:?; ?:?);//00693EC0
    //procedure sub_00694224(?:Integer; ?:?);//00694224
    //function sub_00694268(?:?):?;//00694268
    //procedure sub_00694294(?:Integer; ?:?);//00694294
    //procedure sub_006942DC(?:Integer; ?:?);//006942DC
    //procedure sub_0069431C(?:Integer; ?:?);//0069431C
    //procedure sub_0069435C(?:Integer; ?:?);//0069435C
    //function sub_0069439C(?:Integer):?;//0069439C
    //function sub_006943CC(?:Integer):?;//006943CC
    procedure sub_006943FC;//006943FC
    procedure sub_006944F0;//006944F0
    //function sub_006944F4(?:string):?;//006944F4
    procedure sub_006949D8;//006949D8
    procedure sub_00694AB8;//00694AB8
    procedure sub_00694AE0;//00694AE0
    procedure sub_00694B14;//00694B14
    procedure sub_00694B58;//00694B58
    procedure sub_00694BAC;//00694BAC

implementation

//0068EFC4
{*function sub_0068EFC4:?;
begin
 0068EFC4    push        ebp
 0068EFC5    mov         ebp,esp
 0068EFC7    push        0
 0068EFC9    push        0
 0068EFCB    push        ebx
 0068EFCC    push        esi
 0068EFCD    xor         eax,eax
 0068EFCF    push        ebp
 0068EFD0    push        68F0CF
 0068EFD5    push        dword ptr fs:[eax]
 0068EFD8    mov         dword ptr fs:[eax],esp
 0068EFDB    mov         dl,1
 0068EFDD    mov         eax,[0043C7BC];TStringList
 0068EFE2    call        TStringList.Create;TStringList.Create
 0068EFE7    mov         ebx,eax
 0068EFE9    mov         edx,68F0EC;'x'
 0068EFEE    mov         eax,ebx
 0068EFF0    mov         ecx,dword ptr [eax]
 0068EFF2    call        dword ptr [ecx+38];TStringList.Add
 0068EFF5    mov         edx,68F0FC;'y'
 0068EFFA    mov         eax,ebx
 0068EFFC    mov         ecx,dword ptr [eax]
 0068EFFE    call        dword ptr [ecx+38];TStringList.Add
 0068F001    mov         edx,68F10C;'z'
 0068F006    mov         eax,ebx
 0068F008    mov         ecx,dword ptr [eax]
 0068F00A    call        dword ptr [ecx+38];TStringList.Add
 0068F00D    mov         edx,68F11C;'pitch'
 0068F012    mov         eax,ebx
 0068F014    mov         ecx,dword ptr [eax]
 0068F016    call        dword ptr [ecx+38];TStringList.Add
 0068F019    mov         edx,68F134;'yaw'
 0068F01E    mov         eax,ebx
 0068F020    mov         ecx,dword ptr [eax]
 0068F022    call        dword ptr [ecx+38];TStringList.Add
 0068F025    mov         edx,68F148;'roll'
 0068F02A    mov         eax,ebx
 0068F02C    mov         ecx,dword ptr [eax]
 0068F02E    call        dword ptr [ecx+38];TStringList.Add
 0068F031    mov         edx,68F160;'slider'
 0068F036    mov         eax,ebx
 0068F038    mov         ecx,dword ptr [eax]
 0068F03A    call        dword ptr [ecx+38];TStringList.Add
 0068F03D    mov         edx,68F17C;'dial'
 0068F042    mov         eax,ebx
 0068F044    mov         ecx,dword ptr [eax]
 0068F046    call        dword ptr [ecx+38];TStringList.Add
 0068F049    mov         edx,68F194;^'RealLeftStick'
 0068F04E    mov         eax,ebx
 0068F050    mov         ecx,dword ptr [eax]
 0068F052    call        dword ptr [ecx+38];TStringList.Add
 0068F055    mov         edx,68F1B0;^'RealLeftStick'
 0068F05A    mov         eax,ebx
 0068F05C    mov         ecx,dword ptr [eax]
 0068F05E    call        dword ptr [ecx+38];TStringList.Add
 0068F061    mov         edx,68F1D0;^'RealLeftStick'
 0068F066    mov         eax,ebx
 0068F068    mov         ecx,dword ptr [eax]
 0068F06A    call        dword ptr [ecx+38];TStringList.Add
 0068F06D    mov         edx,68F1F0;^'RealLeftStick'
 0068F072    mov         eax,ebx
 0068F074    mov         ecx,dword ptr [eax]
 0068F076    call        dword ptr [ecx+38];TStringList.Add
 0068F079    mov         edx,68F210;^'RealLeftStick'
 0068F07E    mov         eax,ebx
 0068F080    mov         ecx,dword ptr [eax]
 0068F082    call        dword ptr [ecx+38];TStringList.Add
 0068F085    mov         esi,1
 0068F08A    lea         edx,[ebp-8]
 0068F08D    mov         eax,esi
 0068F08F    call        IntToStr
 0068F094    mov         ecx,dword ptr [ebp-8]
 0068F097    lea         eax,[ebp-4]
 0068F09A    mov         edx,68F234;'button'
 0068F09F    call        @UStrCat3
 0068F0A4    mov         edx,dword ptr [ebp-4]
 0068F0A7    mov         eax,ebx
 0068F0A9    mov         ecx,dword ptr [eax]
 0068F0AB    call        dword ptr [ecx+38];TStringList.Add
 0068F0AE    inc         esi
 0068F0AF    cmp         esi,0D
>0068F0B2    jne         0068F08A
 0068F0B4    xor         eax,eax
 0068F0B6    pop         edx
 0068F0B7    pop         ecx
 0068F0B8    pop         ecx
 0068F0B9    mov         dword ptr fs:[eax],edx
 0068F0BC    push        68F0D6
 0068F0C1    lea         eax,[ebp-8]
 0068F0C4    mov         edx,2
 0068F0C9    call        @UStrArrayClr
 0068F0CE    ret
>0068F0CF    jmp         @HandleFinally
>0068F0D4    jmp         0068F0C1
 0068F0D6    mov         eax,ebx
 0068F0D8    pop         esi
 0068F0D9    pop         ebx
 0068F0DA    pop         ecx
 0068F0DB    pop         ecx
 0068F0DC    pop         ebp
 0068F0DD    ret
end;*}

//0068F244
{*function sub_0068F244(?:UnicodeString):?;
begin
 0068F244    push        ebp
 0068F245    mov         ebp,esp
 0068F247    push        ecx
 0068F248    push        ebx
 0068F249    mov         dword ptr [ebp-4],eax
 0068F24C    mov         eax,dword ptr [ebp-4]
 0068F24F    call        @UStrAddRef
 0068F254    xor         eax,eax
 0068F256    push        ebp
 0068F257    push        68F2AA
 0068F25C    push        dword ptr fs:[eax]
 0068F25F    mov         dword ptr fs:[eax],esp
 0068F262    lea         eax,[ebp-4]
 0068F265    mov         edx,68F2C4;'jb'
 0068F26A    call        004F9BD0
 0068F26F    test        al,al
>0068F271    je          0068F292
 0068F273    or          edx,0FFFFFFFF
 0068F276    mov         eax,dword ptr [ebp-4]
 0068F279    call        StrToIntDef
 0068F27E    cmp         eax,1
>0068F281    jl          0068F28A
 0068F283    cmp         eax,80
>0068F288    jle         0068F28E
 0068F28A    xor         ebx,ebx
>0068F28C    jmp         0068F294
 0068F28E    mov         bl,1
>0068F290    jmp         0068F294
 0068F292    xor         ebx,ebx
 0068F294    xor         eax,eax
 0068F296    pop         edx
 0068F297    pop         ecx
 0068F298    pop         ecx
 0068F299    mov         dword ptr fs:[eax],edx
 0068F29C    push        68F2B1
 0068F2A1    lea         eax,[ebp-4]
 0068F2A4    call        @UStrClr
 0068F2A9    ret
>0068F2AA    jmp         @HandleFinally
>0068F2AF    jmp         0068F2A1
 0068F2B1    mov         eax,ebx
 0068F2B3    pop         ebx
 0068F2B4    pop         ecx
 0068F2B5    pop         ebp
 0068F2B6    ret
end;*}

//0068F518
procedure sub_0068F518;
begin
{*
 0068F518    push        ebp
 0068F519    mov         ebp,esp
 0068F51B    push        0
 0068F51D    push        0
 0068F51F    push        0
 0068F521    push        ebx
 0068F522    push        esi
 0068F523    push        edi
 0068F524    mov         edi,81ED08;gvar_0081ED08:?
 0068F529    xor         eax,eax
 0068F52B    push        ebp
 0068F52C    push        68F683
 0068F531    push        dword ptr fs:[eax]
 0068F534    mov         dword ptr fs:[eax],esp
 0068F537    mov         eax,[0078D4B0];^gvar_0078BDBC
 0068F53C    cmp         byte ptr [eax],0
>0068F53F    jne         0068F668
 0068F545    mov         eax,68F6A0;'EnumerateJoysticks'
 0068F54A    call        004FA5FC
 0068F54F    mov         eax,78BDE0;gvar_0078BDE0:IInterface
 0068F554    call        @IntfClear
 0068F559    mov         eax,dword ptr [edi]
 0068F55B    call        @DynArrayLength
 0068F560    mov         ebx,eax
 0068F562    dec         ebx
 0068F563    test        ebx,ebx
>0068F565    jl          0068F578
 0068F567    inc         ebx
 0068F568    xor         esi,esi
 0068F56A    mov         eax,dword ptr [edi]
 0068F56C    lea         eax,[eax+esi*4]
 0068F56F    call        @IntfClear
 0068F574    inc         esi
 0068F575    dec         ebx
>0068F576    jne         0068F56A
 0068F578    push        0
 0068F57A    mov         eax,edi
 0068F57C    mov         ecx,1
 0068F581    mov         edx,dword ptr ds:[68F2CC];:4
 0068F587    call        @DynArraySetLength
 0068F58C    add         esp,4
 0068F58F    push        0
 0068F591    mov         eax,81ED0C;gvar_0081ED0C:?
 0068F596    mov         ecx,1
 0068F59B    mov         edx,dword ptr ds:[68F2F8];:5
 0068F5A1    call        @DynArraySetLength
 0068F5A6    add         esp,4
 0068F5A9    push        0
 0068F5AB    mov         eax,81ED10;gvar_0081ED10:?
 0068F5B0    mov         ecx,1
 0068F5B5    mov         edx,dword ptr ds:[68F324];:6
 0068F5BB    call        @DynArraySetLength
 0068F5C0    add         esp,4
 0068F5C3    push        1
 0068F5C5    push        0
 0068F5C7    push        68F42C
 0068F5CC    push        4
 0068F5CE    mov         eax,[0078D628];^gvar_0078BD08:IInterface
 0068F5D3    mov         eax,dword ptr [eax]
 0068F5D5    push        eax
 0068F5D6    mov         eax,dword ptr [eax]
 0068F5D8    call        dword ptr [eax+10]
 0068F5DB    mov         edx,eax
 0068F5DD    mov         eax,68F6D4;'EnumDevices'
 0068F5E2    call        005FF2AC
 0068F5E7    mov         eax,[0078D4B0];^gvar_0078BDBC
 0068F5EC    mov         byte ptr [eax],0
 0068F5EF    mov         eax,[0081ED0C];gvar_0081ED0C:?
 0068F5F4    call        @DynArrayLength
 0068F5F9    mov         ebx,eax
 0068F5FB    dec         ebx
 0068F5FC    test        ebx,ebx
>0068F5FE    jl          0068F63E
 0068F600    inc         ebx
 0068F601    xor         esi,esi
 0068F603    lea         eax,[ebp-4]
 0068F606    imul        edx,esi,91
 0068F60C    mov         ecx,dword ptr ds:[81ED0C];gvar_0081ED0C:?
 0068F612    lea         edx,[ecx+edx*4+12C]
 0068F619    mov         ecx,104
 0068F61E    call        @UStrFromArray
 0068F623    mov         eax,dword ptr [ebp-4]
 0068F626    mov         edx,68F6F8;'Twin Digital GamePad'
 0068F62B    call        @UStrEqual
>0068F630    jne         0068F63A
 0068F632    mov         eax,[0078D4B0];^gvar_0078BDBC
 0068F637    mov         byte ptr [eax],1
 0068F63A    inc         esi
 0068F63B    dec         ebx
>0068F63C    jne         0068F603
 0068F63E    lea         ecx,[ebp-0C]
 0068F641    mov         eax,[0078D4B0];^gvar_0078BDBC
 0068F646    movzx       eax,byte ptr [eax]
 0068F649    mov         dl,1
 0068F64B    call        BoolToStr
 0068F650    mov         ecx,dword ptr [ebp-0C]
 0068F653    lea         eax,[ebp-8]
 0068F656    mov         edx,68F730;'Enumerated... BadGamePad = '
 0068F65B    call        @UStrCat3
 0068F660    mov         eax,dword ptr [ebp-8]
 0068F663    call        004FA5FC
 0068F668    xor         eax,eax
 0068F66A    pop         edx
 0068F66B    pop         ecx
 0068F66C    pop         ecx
 0068F66D    mov         dword ptr fs:[eax],edx
 0068F670    push        68F68A
 0068F675    lea         eax,[ebp-0C]
 0068F678    mov         edx,3
 0068F67D    call        @UStrArrayClr
 0068F682    ret
>0068F683    jmp         @HandleFinally
>0068F688    jmp         0068F675
 0068F68A    pop         edi
 0068F68B    pop         esi
 0068F68C    pop         ebx
 0068F68D    mov         esp,ebp
 0068F68F    pop         ebp
 0068F690    ret
*}
end;

//0068F768
{*function sub_0068F768(?:UnicodeString):?;
begin
 0068F768    push        ebp
 0068F769    mov         ebp,esp
 0068F76B    push        ecx
 0068F76C    push        ebx
 0068F76D    mov         dword ptr [ebp-4],eax
 0068F770    mov         eax,dword ptr [ebp-4]
 0068F773    call        @UStrAddRef
 0068F778    xor         eax,eax
 0068F77A    push        ebp
 0068F77B    push        68F7AE
 0068F780    push        dword ptr fs:[eax]
 0068F783    mov         dword ptr fs:[eax],esp
 0068F786    mov         eax,[0081ED04];gvar_0081ED04:TModuleJoystick
 0068F78B    mov         eax,dword ptr [eax+1C]
 0068F78E    mov         edx,dword ptr [ebp-4]
 0068F791    call        THashTable.Get
 0068F796    mov         ebx,eax
 0068F798    xor         eax,eax
 0068F79A    pop         edx
 0068F79B    pop         ecx
 0068F79C    pop         ecx
 0068F79D    mov         dword ptr fs:[eax],edx
 0068F7A0    push        68F7B5
 0068F7A5    lea         eax,[ebp-4]
 0068F7A8    call        @UStrClr
 0068F7AD    ret
>0068F7AE    jmp         @HandleFinally
>0068F7B3    jmp         0068F7A5
 0068F7B5    mov         eax,ebx
 0068F7B7    pop         ebx
 0068F7B8    pop         ecx
 0068F7B9    pop         ebp
 0068F7BA    ret
end;*}

//0068F7BC
{*procedure sub_0068F7BC(?:Integer; ?:?);
begin
 0068F7BC    push        ebx
 0068F7BD    push        esi
 0068F7BE    mov         esi,edx
 0068F7C0    mov         ebx,eax
 0068F7C2    mov         ecx,esi
 0068F7C4    mov         eax,[0081ED04];gvar_0081ED04:TModuleJoystick
 0068F7C9    mov         eax,dword ptr [eax+1C]
 0068F7CC    mov         edx,ebx
 0068F7CE    call        THashTable.Get
 0068F7D3    pop         esi
 0068F7D4    pop         ebx
 0068F7D5    ret
end;*}

//0068F7D8
{*function sub_0068F7D8(?:?):?;
begin
 0068F7D8    push        ebp
 0068F7D9    mov         ebp,esp
 0068F7DB    add         esp,0FFFFFFF8
 0068F7DE    push        ebx
 0068F7DF    push        esi
 0068F7E0    push        edi
 0068F7E1    xor         edx,edx
 0068F7E3    mov         dword ptr [ebp-4],edx
 0068F7E6    mov         dword ptr [ebp-8],eax
 0068F7E9    xor         eax,eax
 0068F7EB    push        ebp
 0068F7EC    push        68F85C
 0068F7F1    push        dword ptr fs:[eax]
 0068F7F4    mov         dword ptr fs:[eax],esp
 0068F7F7    or          edi,0FFFFFFFF
 0068F7FA    mov         eax,[0081ED08];gvar_0081ED08:?
 0068F7FF    call        @DynArrayHigh
 0068F804    mov         esi,eax
 0068F806    test        esi,esi
>0068F808    jl          0068F846
 0068F80A    inc         esi
 0068F80B    xor         ebx,ebx
 0068F80D    lea         edx,[ebp-4]
 0068F810    lea         eax,[ebx+1]
 0068F813    call        00694224
 0068F818    lea         eax,[ebp-4]
 0068F81B    mov         edx,68F878;'PPJoy Virtual joystick '
 0068F820    call        004F9BD0
 0068F825    test        al,al
>0068F827    je          0068F842
 0068F829    test        edi,edi
>0068F82B    jge         0068F830
 0068F82D    lea         edi,[ebx+1]
 0068F830    lea         eax,[ebp-4]
 0068F833    call        004F9D00
 0068F838    cmp         eax,dword ptr [ebp-8]
>0068F83B    jne         0068F842
 0068F83D    lea         edi,[ebx+1]
>0068F840    jmp         0068F846
 0068F842    inc         ebx
 0068F843    dec         esi
>0068F844    jne         0068F80D
 0068F846    xor         eax,eax
 0068F848    pop         edx
 0068F849    pop         ecx
 0068F84A    pop         ecx
 0068F84B    mov         dword ptr fs:[eax],edx
 0068F84E    push        68F863
 0068F853    lea         eax,[ebp-4]
 0068F856    call        @UStrClr
 0068F85B    ret
>0068F85C    jmp         @HandleFinally
>0068F861    jmp         0068F853
 0068F863    mov         eax,edi
 0068F865    pop         edi
 0068F866    pop         esi
 0068F867    pop         ebx
 0068F868    pop         ecx
 0068F869    pop         ecx
 0068F86A    pop         ebp
 0068F86B    ret
end;*}

//0068F8A8
{*function sub_0068F8A8(?:?):?;
begin
 0068F8A8    push        ebp
 0068F8A9    mov         ebp,esp
 0068F8AB    add         esp,0FFFFFFF4
 0068F8AE    push        ebx
 0068F8AF    push        esi
 0068F8B0    push        edi
 0068F8B1    xor         edx,edx
 0068F8B3    mov         dword ptr [ebp-4],edx
 0068F8B6    mov         dword ptr [ebp-8],eax
 0068F8B9    xor         eax,eax
 0068F8BB    push        ebp
 0068F8BC    push        68F930
 0068F8C1    push        dword ptr fs:[eax]
 0068F8C4    mov         dword ptr fs:[eax],esp
 0068F8C7    mov         dword ptr [ebp-0C],0FFFFFFFF
 0068F8CE    xor         edi,edi
 0068F8D0    mov         eax,[0081ED08];gvar_0081ED08:?
 0068F8D5    call        @DynArrayHigh
 0068F8DA    mov         esi,eax
 0068F8DC    test        esi,esi
>0068F8DE    jl          0068F91A
 0068F8E0    inc         esi
 0068F8E1    xor         ebx,ebx
 0068F8E3    lea         edx,[ebp-4]
 0068F8E6    lea         eax,[ebx+1]
 0068F8E9    call        00694224
 0068F8EE    mov         edx,68F950;'PPJoy Virtual joystick'
 0068F8F3    mov         eax,dword ptr [ebp-4]
 0068F8F6    call        004F9A58
 0068F8FB    test        al,al
>0068F8FD    jne         0068F916
 0068F8FF    inc         edi
 0068F900    cmp         edi,1
>0068F903    jne         0068F90B
 0068F905    lea         eax,[ebx+1]
 0068F908    mov         dword ptr [ebp-0C],eax
 0068F90B    cmp         edi,dword ptr [ebp-8]
>0068F90E    jne         0068F916
 0068F910    inc         ebx
 0068F911    mov         dword ptr [ebp-0C],ebx
>0068F914    jmp         0068F91A
 0068F916    inc         ebx
 0068F917    dec         esi
>0068F918    jne         0068F8E3
 0068F91A    xor         eax,eax
 0068F91C    pop         edx
 0068F91D    pop         ecx
 0068F91E    pop         ecx
 0068F91F    mov         dword ptr fs:[eax],edx
 0068F922    push        68F937
 0068F927    lea         eax,[ebp-4]
 0068F92A    call        @UStrClr
 0068F92F    ret
>0068F930    jmp         @HandleFinally
>0068F935    jmp         0068F927
 0068F937    mov         eax,dword ptr [ebp-0C]
 0068F93A    pop         edi
 0068F93B    pop         esi
 0068F93C    pop         ebx
 0068F93D    mov         esp,ebp
 0068F93F    pop         ebp
 0068F940    ret
end;*}

//0068F980
{*function sub_0068F980(?:?):?;
begin
 0068F980    push        ebx
 0068F981    push        esi
 0068F982    push        edi
 0068F983    push        ebp
 0068F984    add         esp,0FFFFFFF8
 0068F987    mov         dword ptr [esp],eax
 0068F98A    mov         dword ptr [esp+4],0FFFFFFFF
 0068F992    xor         edi,edi
 0068F994    mov         eax,[0081ED08];gvar_0081ED08:?
 0068F999    call        @DynArrayHigh
 0068F99E    mov         esi,eax
 0068F9A0    test        esi,esi
>0068F9A2    jl          0068F9D4
 0068F9A4    inc         esi
 0068F9A5    xor         ebx,ebx
 0068F9A7    lea         ebp,[ebx+1]
 0068F9AA    mov         eax,ebp
 0068F9AC    call        00694268
 0068F9B1    and         eax,0FF
 0068F9B6    cmp         eax,14
>0068F9B9    jne         0068F9D0
 0068F9BB    inc         edi
 0068F9BC    cmp         edi,1
>0068F9BF    jne         0068F9C5
 0068F9C1    mov         dword ptr [esp+4],ebp
 0068F9C5    cmp         edi,dword ptr [esp]
>0068F9C8    jne         0068F9D0
 0068F9CA    mov         dword ptr [esp+4],ebp
>0068F9CE    jmp         0068F9D4
 0068F9D0    inc         ebx
 0068F9D1    dec         esi
>0068F9D2    jne         0068F9A7
 0068F9D4    mov         eax,dword ptr [esp+4]
 0068F9D8    pop         ecx
 0068F9D9    pop         edx
 0068F9DA    pop         ebp
 0068F9DB    pop         edi
 0068F9DC    pop         esi
 0068F9DD    pop         ebx
 0068F9DE    ret
end;*}

//0068F9E0
{*function sub_0068F9E0(?:?):?;
begin
 0068F9E0    push        ebx
 0068F9E1    push        esi
 0068F9E2    push        edi
 0068F9E3    push        ebp
 0068F9E4    add         esp,0FFFFFFF8
 0068F9E7    mov         dword ptr [esp],eax
 0068F9EA    mov         dword ptr [esp+4],0FFFFFFFF
 0068F9F2    xor         edi,edi
 0068F9F4    mov         eax,[0081ED08];gvar_0081ED08:?
 0068F9F9    call        @DynArrayHigh
 0068F9FE    mov         esi,eax
 0068FA00    test        esi,esi
>0068FA02    jl          0068FA34
 0068FA04    inc         esi
 0068FA05    xor         ebx,ebx
 0068FA07    lea         ebp,[ebx+1]
 0068FA0A    mov         eax,ebp
 0068FA0C    call        00694268
 0068FA11    and         eax,0FF
 0068FA16    cmp         eax,15
>0068FA19    jne         0068FA30
 0068FA1B    inc         edi
 0068FA1C    cmp         edi,1
>0068FA1F    jne         0068FA25
 0068FA21    mov         dword ptr [esp+4],ebp
 0068FA25    cmp         edi,dword ptr [esp]
>0068FA28    jne         0068FA30
 0068FA2A    mov         dword ptr [esp+4],ebp
>0068FA2E    jmp         0068FA34
 0068FA30    inc         ebx
 0068FA31    dec         esi
>0068FA32    jne         0068FA07
 0068FA34    mov         eax,dword ptr [esp+4]
 0068FA38    pop         ecx
 0068FA39    pop         edx
 0068FA3A    pop         ebp
 0068FA3B    pop         edi
 0068FA3C    pop         esi
 0068FA3D    pop         ebx
 0068FA3E    ret
end;*}

//0068FA40
{*function sub_0068FA40(?:?):?;
begin
 0068FA40    push        ebx
 0068FA41    push        esi
 0068FA42    push        edi
 0068FA43    push        ebp
 0068FA44    add         esp,0FFFFFFF8
 0068FA47    mov         dword ptr [esp],eax
 0068FA4A    mov         dword ptr [esp+4],0FFFFFFFF
 0068FA52    xor         edi,edi
 0068FA54    mov         eax,[0081ED08];gvar_0081ED08:?
 0068FA59    call        @DynArrayHigh
 0068FA5E    mov         esi,eax
 0068FA60    test        esi,esi
>0068FA62    jl          0068FA94
 0068FA64    inc         esi
 0068FA65    xor         ebx,ebx
 0068FA67    lea         ebp,[ebx+1]
 0068FA6A    mov         eax,ebp
 0068FA6C    call        00694268
 0068FA71    and         eax,0FF
 0068FA76    cmp         eax,16
>0068FA79    jne         0068FA90
 0068FA7B    inc         edi
 0068FA7C    cmp         edi,1
>0068FA7F    jne         0068FA85
 0068FA81    mov         dword ptr [esp+4],ebp
 0068FA85    cmp         edi,dword ptr [esp]
>0068FA88    jne         0068FA90
 0068FA8A    mov         dword ptr [esp+4],ebp
>0068FA8E    jmp         0068FA94
 0068FA90    inc         ebx
 0068FA91    dec         esi
>0068FA92    jne         0068FA67
 0068FA94    mov         eax,dword ptr [esp+4]
 0068FA98    pop         ecx
 0068FA99    pop         edx
 0068FA9A    pop         ebp
 0068FA9B    pop         edi
 0068FA9C    pop         esi
 0068FA9D    pop         ebx
 0068FA9E    ret
end;*}

//0068FAA0
{*function sub_0068FAA0(?:?):?;
begin
 0068FAA0    push        ebx
 0068FAA1    push        esi
 0068FAA2    push        edi
 0068FAA3    push        ebp
 0068FAA4    add         esp,0FFFFFFF8
 0068FAA7    mov         dword ptr [esp],eax
 0068FAAA    mov         dword ptr [esp+4],0FFFFFFFF
 0068FAB2    xor         edi,edi
 0068FAB4    mov         eax,[0081ED08];gvar_0081ED08:?
 0068FAB9    call        @DynArrayHigh
 0068FABE    mov         esi,eax
 0068FAC0    test        esi,esi
>0068FAC2    jl          0068FAF4
 0068FAC4    inc         esi
 0068FAC5    xor         ebx,ebx
 0068FAC7    lea         ebp,[ebx+1]
 0068FACA    mov         eax,ebp
 0068FACC    call        00694268
 0068FAD1    and         eax,0FF
 0068FAD6    cmp         eax,17
>0068FAD9    jne         0068FAF0
 0068FADB    inc         edi
 0068FADC    cmp         edi,1
>0068FADF    jne         0068FAE5
 0068FAE1    mov         dword ptr [esp+4],ebp
 0068FAE5    cmp         edi,dword ptr [esp]
>0068FAE8    jne         0068FAF0
 0068FAEA    mov         dword ptr [esp+4],ebp
>0068FAEE    jmp         0068FAF4
 0068FAF0    inc         ebx
 0068FAF1    dec         esi
>0068FAF2    jne         0068FAC7
 0068FAF4    mov         eax,dword ptr [esp+4]
 0068FAF8    pop         ecx
 0068FAF9    pop         edx
 0068FAFA    pop         ebp
 0068FAFB    pop         edi
 0068FAFC    pop         esi
 0068FAFD    pop         ebx
 0068FAFE    ret
end;*}

//0068FB00
{*function sub_0068FB00(?:?):?;
begin
 0068FB00    push        ebx
 0068FB01    push        esi
 0068FB02    push        edi
 0068FB03    push        ebp
 0068FB04    add         esp,0FFFFFFF8
 0068FB07    mov         dword ptr [esp],eax
 0068FB0A    mov         dword ptr [esp+4],0FFFFFFFF
 0068FB12    xor         edi,edi
 0068FB14    mov         eax,[0081ED08];gvar_0081ED08:?
 0068FB19    call        @DynArrayHigh
 0068FB1E    mov         esi,eax
 0068FB20    test        esi,esi
>0068FB22    jl          0068FB54
 0068FB24    inc         esi
 0068FB25    xor         ebx,ebx
 0068FB27    lea         ebp,[ebx+1]
 0068FB2A    mov         eax,ebp
 0068FB2C    call        00694268
 0068FB31    and         eax,0FF
 0068FB36    cmp         eax,18
>0068FB39    jne         0068FB50
 0068FB3B    inc         edi
 0068FB3C    cmp         edi,1
>0068FB3F    jne         0068FB45
 0068FB41    mov         dword ptr [esp+4],ebp
 0068FB45    cmp         edi,dword ptr [esp]
>0068FB48    jne         0068FB50
 0068FB4A    mov         dword ptr [esp+4],ebp
>0068FB4E    jmp         0068FB54
 0068FB50    inc         ebx
 0068FB51    dec         esi
>0068FB52    jne         0068FB27
 0068FB54    mov         eax,dword ptr [esp+4]
 0068FB58    pop         ecx
 0068FB59    pop         edx
 0068FB5A    pop         ebp
 0068FB5B    pop         edi
 0068FB5C    pop         esi
 0068FB5D    pop         ebx
 0068FB5E    ret
end;*}

//0068FB60
function TJoystickValue.CanSet:Boolean;
begin
{*
 0068FB60    mov         al,1
 0068FB62    ret
*}
end;

//0068FB64
procedure TJoystickValue.CreateClone;
begin
{*
 0068FB64    mov         dl,1
 0068FB66    mov         eax,[0068E520];TJoystickValue
 0068FB6B    call        TObject.Create;TJoystickValue.Create
 0068FB70    ret
*}
end;

//0068FB74
procedure TJoystickValue.FillClone(c:TExpression);
begin
{*
 0068FB74    push        ebx
 0068FB75    push        esi
 0068FB76    mov         esi,edx
 0068FB78    mov         ebx,eax
 0068FB7A    mov         edx,esi
 0068FB7C    mov         eax,ebx
 0068FB7E    call        TExpression.FillClone
 0068FB83    mov         eax,esi
 0068FB85    mov         edx,dword ptr [ebx+18];TJoystickValue......................................................
 0068FB88    mov         dword ptr [eax+18],edx
 0068FB8B    mov         edx,dword ptr [ebx+20];TJoystickValue..........................Item:Integer
 0068FB8E    mov         dword ptr [eax+20],edx
 0068FB91    pop         esi
 0068FB92    pop         ebx
 0068FB93    ret
*}
end;

//0068FB94
function TJoystickValue.GetDataType:TDataType;
begin
{*
 0068FB94    mov         eax,dword ptr [eax+20];TJoystickValue...........................Item:Integer
 0068FB97    cmp         eax,0FE
>0068FB9C    jge         0068FBDA
 0068FB9E    cmp         eax,9F
>0068FBA3    jge         0068FBC1
 0068FBA5    dec         eax
 0068FBA6    sub         eax,80
>0068FBAB    jb          0068FC18
 0068FBAD    add         eax,0FFFFFFEC
 0068FBB0    sub         eax,3
>0068FBB3    jb          0068FC1B
 0068FBB5    sub         eax,2
>0068FBB8    jb          0068FC21
 0068FBBA    sub         eax,5
>0068FBBD    jb          0068FC24
>0068FBBF    jmp         0068FC3F
 0068FBC1    add         eax,0FFFFFF61
 0068FBC6    sub         eax,16
>0068FBC9    jb          0068FC1E
 0068FBCB    add         eax,0FFFFFFBB
 0068FBCE    sub         eax,2
>0068FBD1    jb          0068FC27
>0068FBD3    je          0068FC2A
 0068FBD5    dec         eax
>0068FBD6    je          0068FC2D
>0068FBD8    jmp         0068FC3F
 0068FBDA    cmp         eax,112
>0068FBDF    jge         0068FBFF
 0068FBE1    add         eax,0FFFFFF02
 0068FBE6    sub         eax,3
>0068FBE9    jb          0068FC27
 0068FBEB    sub         eax,3
>0068FBEE    jb          0068FC30
 0068FBF0    sub         eax,5
>0068FBF3    jb          0068FC33
 0068FBF5    add         eax,0FFFFFFFB
 0068FBF8    sub         eax,4
>0068FBFB    jb          0068FC36
>0068FBFD    jmp         0068FC3F
 0068FBFF    add         eax,0FFFFFEEE
 0068FC04    sub         eax,14
>0068FC07    jb          0068FC39
 0068FC09    sub         eax,8
>0068FC0C    jb          0068FC3C
>0068FC0E    je          0068FC18
 0068FC10    dec         eax
 0068FC11    sub         eax,5
>0068FC14    jb          0068FC33
>0068FC16    jmp         0068FC3F
 0068FC18    mov         al,3
 0068FC1A    ret
 0068FC1B    mov         al,2
 0068FC1D    ret
 0068FC1E    mov         al,3
 0068FC20    ret
 0068FC21    xor         eax,eax
 0068FC23    ret
 0068FC24    mov         al,2
 0068FC26    ret
 0068FC27    mov         al,4
 0068FC29    ret
 0068FC2A    mov         al,3
 0068FC2C    ret
 0068FC2D    mov         al,2
 0068FC2F    ret
 0068FC30    mov         al,2
 0068FC32    ret
 0068FC33    mov         al,5
 0068FC35    ret
 0068FC36    xor         eax,eax
 0068FC38    ret
 0068FC39    mov         al,3
 0068FC3B    ret
 0068FC3C    xor         eax,eax
 0068FC3E    ret
 0068FC3F    xor         eax,eax
 0068FC41    ret
*}
end;

//0068FC44
{*procedure TJoystickValue.GetString(?:?);
begin
 0068FC44    push        ebx
 0068FC45    push        esi
 0068FC46    mov         esi,edx
 0068FC48    mov         ebx,eax
 0068FC4A    mov         eax,dword ptr [ebx+20];TJoystickValue............................Item:Integer
 0068FC4D    add         eax,0FFFFFF06
 0068FC52    cmp         eax,6
>0068FC55    ja          0068FCBB
 0068FC57    jmp         dword ptr [eax*4+68FC5E]
 0068FC57    dd          0068FC7A
 0068FC57    dd          0068FC87
 0068FC57    dd          0068FCBB
 0068FC57    dd          0068FCBB
 0068FC57    dd          0068FC94
 0068FC57    dd          0068FCA1
 0068FC57    dd          0068FCAE
 0068FC7A    mov         edx,esi
 0068FC7C    mov         eax,dword ptr [ebx+18];TJoystickValue......................................................
 0068FC7F    call        00694224
 0068FC84    pop         esi
 0068FC85    pop         ebx
 0068FC86    ret
 0068FC87    mov         edx,esi
 0068FC89    mov         eax,dword ptr [ebx+18];TJoystickValue......................................................
 0068FC8C    call        00694294
 0068FC91    pop         esi
 0068FC92    pop         ebx
 0068FC93    ret
 0068FC94    mov         edx,esi
 0068FC96    mov         eax,dword ptr [ebx+18];TJoystickValue......................................................
 0068FC99    call        006942DC
 0068FC9E    pop         esi
 0068FC9F    pop         ebx
 0068FCA0    ret
 0068FCA1    mov         edx,esi
 0068FCA3    mov         eax,dword ptr [ebx+18];TJoystickValue......................................................
 0068FCA6    call        0069431C
 0068FCAB    pop         esi
 0068FCAC    pop         ebx
 0068FCAD    ret
 0068FCAE    mov         edx,esi
 0068FCB0    mov         eax,dword ptr [ebx+18];TJoystickValue......................................................
 0068FCB3    call        0069435C
 0068FCB8    pop         esi
 0068FCB9    pop         ebx
 0068FCBA    ret
 0068FCBB    mov         edx,esi
 0068FCBD    mov         eax,ebx
 0068FCBF    call        TExpression.GetString
 0068FCC4    pop         esi
 0068FCC5    pop         ebx
 0068FCC6    ret
end;*}

//0068FCC8
{*function sub_0068FCC8(?:?):?;
begin
 0068FCC8    add         esp,0FFFFFFF0
 0068FCCB    cmp         eax,0FFFFFFFF
>0068FCCE    jne         0068FCDF
 0068FCD0    xor         eax,eax
 0068FCD2    mov         dword ptr [esp],eax
 0068FCD5    mov         dword ptr [esp+4],0BFF00000
>0068FCDD    jmp         0068FCF7
 0068FCDF    mov         dword ptr [esp+8],eax
 0068FCE3    xor         eax,eax
 0068FCE5    mov         dword ptr [esp+0C],eax
 0068FCE9    fild        qword ptr [esp+8]
 0068FCED    fdiv        dword ptr ds:[68FD00];100:Single
 0068FCF3    fstp        qword ptr [esp]
 0068FCF6    wait
 0068FCF7    fld         qword ptr [esp]
 0068FCFA    add         esp,10
 0068FCFD    ret
end;*}

//0068FD04
function TJoystickValue.GetUnits:TUnits;
begin
{*
 0068FD04    mov         eax,dword ptr [eax+20];TJoystickValue.............................Item:Integer
 0068FD07    add         eax,0FFFFFF77
 0068FD0C    sub         eax,4
>0068FD0F    jae         0068FD14
 0068FD11    mov         al,18
 0068FD13    ret
 0068FD14    xor         eax,eax
 0068FD16    ret
*}
end;

//0068FD18
{*function sub_0068FD18(?:?; ?:?):?;
begin
 0068FD18    push        ebx
 0068FD19    push        esi
 0068FD1A    push        edi
 0068FD1B    mov         edi,edx
 0068FD1D    mov         esi,eax
 0068FD1F    xor         ebx,ebx
 0068FD21    test        esi,esi
>0068FD23    jl          0068FD36
 0068FD25    mov         eax,[0081ED08];gvar_0081ED08:?
 0068FD2A    call        @DynArrayHigh
 0068FD2F    mov         edx,esi
 0068FD31    dec         edx
 0068FD32    cmp         eax,edx
>0068FD34    jge         0068FD3A
 0068FD36    xor         ebx,ebx
>0068FD38    jmp         0068FD8B
 0068FD3A    test        esi,esi
>0068FD3C    jle         0068FD57
 0068FD3E    imul        eax,esi,22
 0068FD41    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 0068FD47    lea         eax,[edx+eax*8]
 0068FD4A    test        byte ptr [eax+edi-0E1],80
 0068FD52    seta        bl
>0068FD55    jmp         0068FD8B
 0068FD57    mov         eax,[0081ED08];gvar_0081ED08:?
 0068FD5C    call        @DynArrayHigh
 0068FD61    test        eax,eax
>0068FD63    jl          0068FD8B
 0068FD65    inc         eax
 0068FD66    xor         edx,edx
 0068FD68    test        bl,bl
>0068FD6A    jne         0068FD83
 0068FD6C    imul        ecx,edx,22
 0068FD6F    mov         ebx,dword ptr ds:[81ED10];gvar_0081ED10:?
 0068FD75    lea         ecx,[ebx+ecx*8]
 0068FD78    test        byte ptr [ecx+edi+2F],80
>0068FD7D    ja          0068FD83
 0068FD7F    xor         ecx,ecx
>0068FD81    jmp         0068FD85
 0068FD83    mov         cl,1
 0068FD85    mov         ebx,ecx
 0068FD87    inc         edx
 0068FD88    dec         eax
>0068FD89    jne         0068FD68
 0068FD8B    mov         eax,ebx
 0068FD8D    pop         edi
 0068FD8E    pop         esi
 0068FD8F    pop         ebx
 0068FD90    ret
end;*}

//0068FD94
{*function sub_0068FD94(?:?):?;
begin
 0068FD94    push        ebx
 0068FD95    push        esi
 0068FD96    push        edi
 0068FD97    add         esp,0FFFFFFF8
 0068FD9A    mov         esi,eax
 0068FD9C    xor         ebx,ebx
 0068FD9E    test        esi,esi
>0068FDA0    jl          0068FDB3
 0068FDA2    mov         eax,[0081ED08];gvar_0081ED08:?
 0068FDA7    call        @DynArrayHigh
 0068FDAC    mov         edx,esi
 0068FDAE    dec         edx
 0068FDAF    cmp         eax,edx
>0068FDB1    jge         0068FDBA
 0068FDB3    xor         ebx,ebx
>0068FDB5    jmp         0068FE90
 0068FDBA    test        esi,esi
>0068FDBC    jle         0068FE1B
 0068FDBE    imul        eax,esi,22
 0068FDC1    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 0068FDC7    mov         eax,dword ptr [edx+eax*8-0F0]
 0068FDCE    call        0068FCC8
 0068FDD3    fstp        qword ptr [esp]
 0068FDD6    wait
 0068FDD7    fld         qword ptr [esp]
 0068FDDA    fcomp       dword ptr ds:[68FE98];0:Single
 0068FDE0    wait
 0068FDE1    fnstsw      al
 0068FDE3    sahf
>0068FDE4    jb          0068FDF5
 0068FDE6    fld         qword ptr [esp]
 0068FDE9    fcomp       dword ptr ds:[68FE9C];68:Single
 0068FDEF    wait
 0068FDF0    fnstsw      al
 0068FDF2    sahf
>0068FDF3    jbe         0068FE17
 0068FDF5    fld         qword ptr [esp]
 0068FDF8    fcomp       dword ptr ds:[68FEA0];292:Single
 0068FDFE    wait
 0068FDFF    fnstsw      al
 0068FE01    sahf
>0068FE02    jb          0068FE13
 0068FE04    fld         qword ptr [esp]
 0068FE07    fcomp       dword ptr ds:[68FEA4];360:Single
 0068FE0D    wait
 0068FE0E    fnstsw      al
 0068FE10    sahf
>0068FE11    jbe         0068FE17
 0068FE13    xor         ebx,ebx
>0068FE15    jmp         0068FE90
 0068FE17    mov         bl,1
>0068FE19    jmp         0068FE90
 0068FE1B    mov         eax,[0081ED08];gvar_0081ED08:?
 0068FE20    call        @DynArrayHigh
 0068FE25    mov         esi,eax
 0068FE27    test        esi,esi
>0068FE29    jl          0068FE90
 0068FE2B    inc         esi
 0068FE2C    xor         edi,edi
 0068FE2E    imul        eax,edi,22
 0068FE31    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 0068FE37    mov         eax,dword ptr [edx+eax*8+20]
 0068FE3B    call        0068FCC8
 0068FE40    fstp        qword ptr [esp]
 0068FE43    wait
 0068FE44    test        bl,bl
>0068FE46    jne         0068FE88
 0068FE48    fld         qword ptr [esp]
 0068FE4B    fcomp       dword ptr ds:[68FE98];0:Single
 0068FE51    wait
 0068FE52    fnstsw      al
 0068FE54    sahf
>0068FE55    jb          0068FE66
 0068FE57    fld         qword ptr [esp]
 0068FE5A    fcomp       dword ptr ds:[68FE9C];68:Single
 0068FE60    wait
 0068FE61    fnstsw      al
 0068FE63    sahf
>0068FE64    jbe         0068FE88
 0068FE66    fld         qword ptr [esp]
 0068FE69    fcomp       dword ptr ds:[68FEA0];292:Single
 0068FE6F    wait
 0068FE70    fnstsw      al
 0068FE72    sahf
>0068FE73    jb          0068FE84
 0068FE75    fld         qword ptr [esp]
 0068FE78    fcomp       dword ptr ds:[68FEA4];360:Single
 0068FE7E    wait
 0068FE7F    fnstsw      al
 0068FE81    sahf
>0068FE82    jbe         0068FE88
 0068FE84    xor         eax,eax
>0068FE86    jmp         0068FE8A
 0068FE88    mov         al,1
 0068FE8A    mov         ebx,eax
 0068FE8C    inc         edi
 0068FE8D    dec         esi
>0068FE8E    jne         0068FE2E
 0068FE90    mov         eax,ebx
 0068FE92    pop         ecx
 0068FE93    pop         edx
 0068FE94    pop         edi
 0068FE95    pop         esi
 0068FE96    pop         ebx
 0068FE97    ret
end;*}

//0068FEA8
{*function sub_0068FEA8(?:?):?;
begin
 0068FEA8    push        ebx
 0068FEA9    push        esi
 0068FEAA    push        edi
 0068FEAB    add         esp,0FFFFFFF8
 0068FEAE    mov         esi,eax
 0068FEB0    xor         ebx,ebx
 0068FEB2    test        esi,esi
>0068FEB4    jl          0068FEC7
 0068FEB6    mov         eax,[0081ED08];gvar_0081ED08:?
 0068FEBB    call        @DynArrayHigh
 0068FEC0    mov         edx,esi
 0068FEC2    dec         edx
 0068FEC3    cmp         eax,edx
>0068FEC5    jge         0068FECE
 0068FEC7    xor         ebx,ebx
>0068FEC9    jmp         0068FF68
 0068FECE    test        esi,esi
>0068FED0    jle         0068FF11
 0068FED2    imul        eax,esi,22
 0068FED5    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 0068FEDB    mov         eax,dword ptr [edx+eax*8-0F0]
 0068FEE2    call        0068FCC8
 0068FEE7    fstp        qword ptr [esp]
 0068FEEA    wait
 0068FEEB    fld         qword ptr [esp]
 0068FEEE    fcomp       dword ptr ds:[68FF70];112:Single
 0068FEF4    wait
 0068FEF5    fnstsw      al
 0068FEF7    sahf
>0068FEF8    jb          0068FF09
 0068FEFA    fld         qword ptr [esp]
 0068FEFD    fcomp       dword ptr ds:[68FF74];248:Single
 0068FF03    wait
 0068FF04    fnstsw      al
 0068FF06    sahf
>0068FF07    jbe         0068FF0D
 0068FF09    xor         ebx,ebx
>0068FF0B    jmp         0068FF68
 0068FF0D    mov         bl,1
>0068FF0F    jmp         0068FF68
 0068FF11    mov         eax,[0081ED08];gvar_0081ED08:?
 0068FF16    call        @DynArrayHigh
 0068FF1B    mov         esi,eax
 0068FF1D    test        esi,esi
>0068FF1F    jl          0068FF68
 0068FF21    inc         esi
 0068FF22    xor         edi,edi
 0068FF24    imul        eax,edi,22
 0068FF27    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 0068FF2D    mov         eax,dword ptr [edx+eax*8+20]
 0068FF31    call        0068FCC8
 0068FF36    fstp        qword ptr [esp]
 0068FF39    wait
 0068FF3A    test        bl,bl
>0068FF3C    jne         0068FF60
 0068FF3E    fld         qword ptr [esp]
 0068FF41    fcomp       dword ptr ds:[68FF70];112:Single
 0068FF47    wait
 0068FF48    fnstsw      al
 0068FF4A    sahf
>0068FF4B    jb          0068FF5C
 0068FF4D    fld         qword ptr [esp]
 0068FF50    fcomp       dword ptr ds:[68FF74];248:Single
 0068FF56    wait
 0068FF57    fnstsw      al
 0068FF59    sahf
>0068FF5A    jbe         0068FF60
 0068FF5C    xor         eax,eax
>0068FF5E    jmp         0068FF62
 0068FF60    mov         al,1
 0068FF62    mov         ebx,eax
 0068FF64    inc         edi
 0068FF65    dec         esi
>0068FF66    jne         0068FF24
 0068FF68    mov         eax,ebx
 0068FF6A    pop         ecx
 0068FF6B    pop         edx
 0068FF6C    pop         edi
 0068FF6D    pop         esi
 0068FF6E    pop         ebx
 0068FF6F    ret
end;*}

//0068FF78
{*function sub_0068FF78(?:?):?;
begin
 0068FF78    push        ebx
 0068FF79    push        esi
 0068FF7A    push        edi
 0068FF7B    add         esp,0FFFFFFF8
 0068FF7E    mov         esi,eax
 0068FF80    xor         ebx,ebx
 0068FF82    test        esi,esi
>0068FF84    jl          0068FF97
 0068FF86    mov         eax,[0081ED08];gvar_0081ED08:?
 0068FF8B    call        @DynArrayHigh
 0068FF90    mov         edx,esi
 0068FF92    dec         edx
 0068FF93    cmp         eax,edx
>0068FF95    jge         0068FF9E
 0068FF97    xor         ebx,ebx
>0068FF99    jmp         00690038
 0068FF9E    test        esi,esi
>0068FFA0    jle         0068FFE1
 0068FFA2    imul        eax,esi,22
 0068FFA5    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 0068FFAB    mov         eax,dword ptr [edx+eax*8-0F0]
 0068FFB2    call        0068FCC8
 0068FFB7    fstp        qword ptr [esp]
 0068FFBA    wait
 0068FFBB    fld         qword ptr [esp]
 0068FFBE    fcomp       dword ptr ds:[690040];202:Single
 0068FFC4    wait
 0068FFC5    fnstsw      al
 0068FFC7    sahf
>0068FFC8    jb          0068FFD9
 0068FFCA    fld         qword ptr [esp]
 0068FFCD    fcomp       dword ptr ds:[690044];338:Single
 0068FFD3    wait
 0068FFD4    fnstsw      al
 0068FFD6    sahf
>0068FFD7    jbe         0068FFDD
 0068FFD9    xor         ebx,ebx
>0068FFDB    jmp         00690038
 0068FFDD    mov         bl,1
>0068FFDF    jmp         00690038
 0068FFE1    mov         eax,[0081ED08];gvar_0081ED08:?
 0068FFE6    call        @DynArrayHigh
 0068FFEB    mov         esi,eax
 0068FFED    test        esi,esi
>0068FFEF    jl          00690038
 0068FFF1    inc         esi
 0068FFF2    xor         edi,edi
 0068FFF4    imul        eax,edi,22
 0068FFF7    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 0068FFFD    mov         eax,dword ptr [edx+eax*8+20]
 00690001    call        0068FCC8
 00690006    fstp        qword ptr [esp]
 00690009    wait
 0069000A    test        bl,bl
>0069000C    jne         00690030
 0069000E    fld         qword ptr [esp]
 00690011    fcomp       dword ptr ds:[690040];202:Single
 00690017    wait
 00690018    fnstsw      al
 0069001A    sahf
>0069001B    jb          0069002C
 0069001D    fld         qword ptr [esp]
 00690020    fcomp       dword ptr ds:[690044];338:Single
 00690026    wait
 00690027    fnstsw      al
 00690029    sahf
>0069002A    jbe         00690030
 0069002C    xor         eax,eax
>0069002E    jmp         00690032
 00690030    mov         al,1
 00690032    mov         ebx,eax
 00690034    inc         edi
 00690035    dec         esi
>00690036    jne         0068FFF4
 00690038    mov         eax,ebx
 0069003A    pop         ecx
 0069003B    pop         edx
 0069003C    pop         edi
 0069003D    pop         esi
 0069003E    pop         ebx
 0069003F    ret
end;*}

//00690048
{*function sub_00690048(?:?):?;
begin
 00690048    push        ebx
 00690049    push        esi
 0069004A    push        edi
 0069004B    add         esp,0FFFFFFF8
 0069004E    mov         esi,eax
 00690050    xor         ebx,ebx
 00690052    test        esi,esi
>00690054    jl          00690067
 00690056    mov         eax,[0081ED08];gvar_0081ED08:?
 0069005B    call        @DynArrayHigh
 00690060    mov         edx,esi
 00690062    dec         edx
 00690063    cmp         eax,edx
>00690065    jge         0069006E
 00690067    xor         ebx,ebx
>00690069    jmp         00690108
 0069006E    test        esi,esi
>00690070    jle         006900B1
 00690072    imul        eax,esi,22
 00690075    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 0069007B    mov         eax,dword ptr [edx+eax*8-0F0]
 00690082    call        0068FCC8
 00690087    fstp        qword ptr [esp]
 0069008A    wait
 0069008B    fld         qword ptr [esp]
 0069008E    fcomp       dword ptr ds:[690110];22:Single
 00690094    wait
 00690095    fnstsw      al
 00690097    sahf
>00690098    jb          006900A9
 0069009A    fld         qword ptr [esp]
 0069009D    fcomp       dword ptr ds:[690114];158:Single
 006900A3    wait
 006900A4    fnstsw      al
 006900A6    sahf
>006900A7    jbe         006900AD
 006900A9    xor         ebx,ebx
>006900AB    jmp         00690108
 006900AD    mov         bl,1
>006900AF    jmp         00690108
 006900B1    mov         eax,[0081ED08];gvar_0081ED08:?
 006900B6    call        @DynArrayHigh
 006900BB    mov         esi,eax
 006900BD    test        esi,esi
>006900BF    jl          00690108
 006900C1    inc         esi
 006900C2    xor         edi,edi
 006900C4    imul        eax,edi,22
 006900C7    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 006900CD    mov         eax,dword ptr [edx+eax*8+20]
 006900D1    call        0068FCC8
 006900D6    fstp        qword ptr [esp]
 006900D9    wait
 006900DA    test        bl,bl
>006900DC    jne         00690100
 006900DE    fld         qword ptr [esp]
 006900E1    fcomp       dword ptr ds:[690110];22:Single
 006900E7    wait
 006900E8    fnstsw      al
 006900EA    sahf
>006900EB    jb          006900FC
 006900ED    fld         qword ptr [esp]
 006900F0    fcomp       dword ptr ds:[690114];158:Single
 006900F6    wait
 006900F7    fnstsw      al
 006900F9    sahf
>006900FA    jbe         00690100
 006900FC    xor         eax,eax
>006900FE    jmp         00690102
 00690100    mov         al,1
 00690102    mov         ebx,eax
 00690104    inc         edi
 00690105    dec         esi
>00690106    jne         006900C4
 00690108    mov         eax,ebx
 0069010A    pop         ecx
 0069010B    pop         edx
 0069010C    pop         edi
 0069010D    pop         esi
 0069010E    pop         ebx
 0069010F    ret
end;*}

//00690118
{*function sub_00690118(?:?):?;
begin
 00690118    push        ebp
 00690119    mov         ebp,esp
 0069011B    add         esp,0FFFFFFD8
 0069011E    push        ebx
 0069011F    push        esi
 00690120    xor         edx,edx
 00690122    mov         dword ptr [ebp-1C],edx
 00690125    mov         dword ptr [ebp-14],edx
 00690128    mov         esi,eax
 0069012A    xor         eax,eax
 0069012C    push        ebp
 0069012D    push        6902ED
 00690132    push        dword ptr fs:[eax]
 00690135    mov         dword ptr fs:[eax],esp
 00690138    xor         eax,eax
 0069013A    mov         dword ptr [ebp-8],eax
 0069013D    mov         dword ptr [ebp-4],eax
 00690140    test        esi,esi
>00690142    jl          00690155
 00690144    mov         eax,[0081ED08];gvar_0081ED08:?
 00690149    call        @DynArrayHigh
 0069014E    mov         edx,esi
 00690150    dec         edx
 00690151    cmp         eax,edx
>00690153    jge         00690162
 00690155    xor         eax,eax
 00690157    mov         dword ptr [ebp-8],eax
 0069015A    mov         dword ptr [ebp-4],eax
>0069015D    jmp         006902CF
 00690162    test        esi,esi
>00690164    jle         00690204
 0069016A    mov         ebx,esi
 0069016C    dec         ebx
 0069016D    lea         edx,[ebp-14]
 00690170    mov         eax,esi
 00690172    call        00694294
 00690177    mov         eax,dword ptr [ebp-14]
 0069017A    mov         edx,69030C;'Parallel Port Joystick'
 0069017F    call        004F9A58
 00690184    test        al,al
>00690186    je          00690192
 00690188    xor         eax,eax
 0069018A    mov         dword ptr [ebp-10],eax
 0069018D    mov         dword ptr [ebp-0C],eax
>00690190    jmp         006901F3
 00690192    imul        eax,ebx,22
 00690195    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 0069019B    lea         eax,[edx+eax*8]
 0069019E    cmp         dword ptr [eax],0
>006901A1    jne         006901BF
 006901A3    cmp         dword ptr [eax+4],0
>006901A7    jne         006901BF
 006901A9    cmp         dword ptr [eax+8],0
>006901AD    jne         006901BF
 006901AF    cmp         dword ptr [eax+14],0
>006901B3    jne         006901BF
 006901B5    xor         eax,eax
 006901B7    mov         dword ptr [ebp-10],eax
 006901BA    mov         dword ptr [ebp-0C],eax
>006901BD    jmp         006901F3
 006901BF    imul        eax,ebx,22
 006901C2    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 006901C8    mov         eax,dword ptr [edx+eax*8]
 006901CB    test        eax,eax
>006901CD    jne         006901DD
 006901CF    xor         eax,eax
 006901D1    mov         dword ptr [ebp-10],eax
 006901D4    mov         dword ptr [ebp-0C],0BFF00000
>006901DB    jmp         006901F3
 006901DD    mov         dword ptr [ebp-18],eax
 006901E0    fild        dword ptr [ebp-18]
 006901E3    fsub        dword ptr ds:[69033C];32767.5:Single
 006901E9    fdiv        dword ptr ds:[69033C];32767.5:Single
 006901EF    fstp        qword ptr [ebp-10]
 006901F2    wait
 006901F3    mov         eax,dword ptr [ebp-10]
 006901F6    mov         dword ptr [ebp-8],eax
 006901F9    mov         eax,dword ptr [ebp-0C]
 006901FC    mov         dword ptr [ebp-4],eax
>006901FF    jmp         006902CF
 00690204    mov         eax,[0081ED08];gvar_0081ED08:?
 00690209    call        @DynArrayHigh
 0069020E    mov         esi,eax
 00690210    test        esi,esi
>00690212    jl          006902CF
 00690218    inc         esi
 00690219    xor         ebx,ebx
 0069021B    lea         edx,[ebp-1C]
 0069021E    lea         eax,[ebx+1]
 00690221    call        00694294
 00690226    mov         eax,dword ptr [ebp-1C]
 00690229    mov         edx,69030C;'Parallel Port Joystick'
 0069022E    call        004F9A58
 00690233    test        al,al
>00690235    je          00690241
 00690237    xor         eax,eax
 00690239    mov         dword ptr [ebp-10],eax
 0069023C    mov         dword ptr [ebp-0C],eax
>0069023F    jmp         006902A2
 00690241    imul        eax,ebx,22
 00690244    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 0069024A    lea         eax,[edx+eax*8]
 0069024D    cmp         dword ptr [eax],0
>00690250    jne         0069026E
 00690252    cmp         dword ptr [eax+4],0
>00690256    jne         0069026E
 00690258    cmp         dword ptr [eax+8],0
>0069025C    jne         0069026E
 0069025E    cmp         dword ptr [eax+14],0
>00690262    jne         0069026E
 00690264    xor         eax,eax
 00690266    mov         dword ptr [ebp-10],eax
 00690269    mov         dword ptr [ebp-0C],eax
>0069026C    jmp         006902A2
 0069026E    imul        eax,ebx,22
 00690271    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 00690277    mov         eax,dword ptr [edx+eax*8]
 0069027A    test        eax,eax
>0069027C    jne         0069028C
 0069027E    xor         eax,eax
 00690280    mov         dword ptr [ebp-10],eax
 00690283    mov         dword ptr [ebp-0C],0BFF00000
>0069028A    jmp         006902A2
 0069028C    mov         dword ptr [ebp-18],eax
 0069028F    fild        dword ptr [ebp-18]
 00690292    fsub        dword ptr ds:[69033C];32767.5:Single
 00690298    fdiv        dword ptr ds:[69033C];32767.5:Single
 0069029E    fstp        qword ptr [ebp-10]
 006902A1    wait
 006902A2    fld         qword ptr [ebp-10]
 006902A5    fabs
 006902A7    fstp        tbyte ptr [ebp-28]
 006902AA    wait
 006902AB    fld         qword ptr [ebp-8]
 006902AE    fabs
 006902B0    fld         tbyte ptr [ebp-28]
 006902B3    fcompp
 006902B5    wait
 006902B6    fnstsw      al
 006902B8    sahf
>006902B9    jbe         006902C7
 006902BB    mov         eax,dword ptr [ebp-10]
 006902BE    mov         dword ptr [ebp-8],eax
 006902C1    mov         eax,dword ptr [ebp-0C]
 006902C4    mov         dword ptr [ebp-4],eax
 006902C7    inc         ebx
 006902C8    dec         esi
>006902C9    jne         0069021B
 006902CF    xor         eax,eax
 006902D1    pop         edx
 006902D2    pop         ecx
 006902D3    pop         ecx
 006902D4    mov         dword ptr fs:[eax],edx
 006902D7    push        6902F4
 006902DC    lea         eax,[ebp-1C]
 006902DF    call        @UStrClr
 006902E4    lea         eax,[ebp-14]
 006902E7    call        @UStrClr
 006902EC    ret
>006902ED    jmp         @HandleFinally
>006902F2    jmp         006902DC
 006902F4    fld         qword ptr [ebp-8]
 006902F7    pop         esi
 006902F8    pop         ebx
 006902F9    mov         esp,ebp
 006902FB    pop         ebp
 006902FC    ret
end;*}

//00690340
{*function sub_00690340(?:?):?;
begin
 00690340    push        ebp
 00690341    mov         ebp,esp
 00690343    add         esp,0FFFFFFD8
 00690346    push        ebx
 00690347    push        esi
 00690348    xor         edx,edx
 0069034A    mov         dword ptr [ebp-1C],edx
 0069034D    mov         dword ptr [ebp-14],edx
 00690350    mov         esi,eax
 00690352    xor         eax,eax
 00690354    push        ebp
 00690355    push        690517
 0069035A    push        dword ptr fs:[eax]
 0069035D    mov         dword ptr fs:[eax],esp
 00690360    xor         eax,eax
 00690362    mov         dword ptr [ebp-8],eax
 00690365    mov         dword ptr [ebp-4],eax
 00690368    test        esi,esi
>0069036A    jl          0069037D
 0069036C    mov         eax,[0081ED08];gvar_0081ED08:?
 00690371    call        @DynArrayHigh
 00690376    mov         edx,esi
 00690378    dec         edx
 00690379    cmp         eax,edx
>0069037B    jge         0069038A
 0069037D    xor         eax,eax
 0069037F    mov         dword ptr [ebp-8],eax
 00690382    mov         dword ptr [ebp-4],eax
>00690385    jmp         006904F9
 0069038A    test        esi,esi
>0069038C    jle         0069042D
 00690392    mov         ebx,esi
 00690394    dec         ebx
 00690395    lea         edx,[ebp-14]
 00690398    mov         eax,esi
 0069039A    call        00694294
 0069039F    mov         eax,dword ptr [ebp-14]
 006903A2    mov         edx,690534;'Parallel Port Joystick'
 006903A7    call        004F9A58
 006903AC    test        al,al
>006903AE    je          006903BA
 006903B0    xor         eax,eax
 006903B2    mov         dword ptr [ebp-10],eax
 006903B5    mov         dword ptr [ebp-0C],eax
>006903B8    jmp         0069041C
 006903BA    imul        eax,ebx,22
 006903BD    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 006903C3    lea         eax,[edx+eax*8]
 006903C6    cmp         dword ptr [eax],0
>006903C9    jne         006903E7
 006903CB    cmp         dword ptr [eax+4],0
>006903CF    jne         006903E7
 006903D1    cmp         dword ptr [eax+8],0
>006903D5    jne         006903E7
 006903D7    cmp         dword ptr [eax+14],0
>006903DB    jne         006903E7
 006903DD    xor         eax,eax
 006903DF    mov         dword ptr [ebp-10],eax
 006903E2    mov         dword ptr [ebp-0C],eax
>006903E5    jmp         0069041C
 006903E7    imul        eax,ebx,22
 006903EA    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 006903F0    mov         eax,dword ptr [edx+eax*8+4]
 006903F4    test        eax,eax
>006903F6    jne         00690406
 006903F8    xor         eax,eax
 006903FA    mov         dword ptr [ebp-10],eax
 006903FD    mov         dword ptr [ebp-0C],0BFF00000
>00690404    jmp         0069041C
 00690406    mov         dword ptr [ebp-18],eax
 00690409    fild        dword ptr [ebp-18]
 0069040C    fsub        dword ptr ds:[690564];32767.5:Single
 00690412    fdiv        dword ptr ds:[690564];32767.5:Single
 00690418    fstp        qword ptr [ebp-10]
 0069041B    wait
 0069041C    mov         eax,dword ptr [ebp-10]
 0069041F    mov         dword ptr [ebp-8],eax
 00690422    mov         eax,dword ptr [ebp-0C]
 00690425    mov         dword ptr [ebp-4],eax
>00690428    jmp         006904F9
 0069042D    mov         eax,[0081ED08];gvar_0081ED08:?
 00690432    call        @DynArrayHigh
 00690437    mov         esi,eax
 00690439    test        esi,esi
>0069043B    jl          006904F9
 00690441    inc         esi
 00690442    xor         ebx,ebx
 00690444    lea         edx,[ebp-1C]
 00690447    lea         eax,[ebx+1]
 0069044A    call        00694294
 0069044F    mov         eax,dword ptr [ebp-1C]
 00690452    mov         edx,690534;'Parallel Port Joystick'
 00690457    call        004F9A58
 0069045C    test        al,al
>0069045E    je          0069046A
 00690460    xor         eax,eax
 00690462    mov         dword ptr [ebp-10],eax
 00690465    mov         dword ptr [ebp-0C],eax
>00690468    jmp         006904CC
 0069046A    imul        eax,ebx,22
 0069046D    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 00690473    lea         eax,[edx+eax*8]
 00690476    cmp         dword ptr [eax],0
>00690479    jne         00690497
 0069047B    cmp         dword ptr [eax+4],0
>0069047F    jne         00690497
 00690481    cmp         dword ptr [eax+8],0
>00690485    jne         00690497
 00690487    cmp         dword ptr [eax+14],0
>0069048B    jne         00690497
 0069048D    xor         eax,eax
 0069048F    mov         dword ptr [ebp-10],eax
 00690492    mov         dword ptr [ebp-0C],eax
>00690495    jmp         006904CC
 00690497    imul        eax,ebx,22
 0069049A    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 006904A0    mov         eax,dword ptr [edx+eax*8+4]
 006904A4    test        eax,eax
>006904A6    jne         006904B6
 006904A8    xor         eax,eax
 006904AA    mov         dword ptr [ebp-10],eax
 006904AD    mov         dword ptr [ebp-0C],0BFF00000
>006904B4    jmp         006904CC
 006904B6    mov         dword ptr [ebp-18],eax
 006904B9    fild        dword ptr [ebp-18]
 006904BC    fsub        dword ptr ds:[690564];32767.5:Single
 006904C2    fdiv        dword ptr ds:[690564];32767.5:Single
 006904C8    fstp        qword ptr [ebp-10]
 006904CB    wait
 006904CC    fld         qword ptr [ebp-10]
 006904CF    fabs
 006904D1    fstp        tbyte ptr [ebp-28]
 006904D4    wait
 006904D5    fld         qword ptr [ebp-8]
 006904D8    fabs
 006904DA    fld         tbyte ptr [ebp-28]
 006904DD    fcompp
 006904DF    wait
 006904E0    fnstsw      al
 006904E2    sahf
>006904E3    jbe         006904F1
 006904E5    mov         eax,dword ptr [ebp-10]
 006904E8    mov         dword ptr [ebp-8],eax
 006904EB    mov         eax,dword ptr [ebp-0C]
 006904EE    mov         dword ptr [ebp-4],eax
 006904F1    inc         ebx
 006904F2    dec         esi
>006904F3    jne         00690444
 006904F9    xor         eax,eax
 006904FB    pop         edx
 006904FC    pop         ecx
 006904FD    pop         ecx
 006904FE    mov         dword ptr fs:[eax],edx
 00690501    push        69051E
 00690506    lea         eax,[ebp-1C]
 00690509    call        @UStrClr
 0069050E    lea         eax,[ebp-14]
 00690511    call        @UStrClr
 00690516    ret
>00690517    jmp         @HandleFinally
>0069051C    jmp         00690506
 0069051E    fld         qword ptr [ebp-8]
 00690521    pop         esi
 00690522    pop         ebx
 00690523    mov         esp,ebp
 00690525    pop         ebp
 00690526    ret
end;*}

//00690568
{*function sub_00690568(?:?):?;
begin
 00690568    push        ebp
 00690569    mov         ebp,esp
 0069056B    add         esp,0FFFFFFD8
 0069056E    push        ebx
 0069056F    push        esi
 00690570    xor         edx,edx
 00690572    mov         dword ptr [ebp-1C],edx
 00690575    mov         dword ptr [ebp-14],edx
 00690578    mov         esi,eax
 0069057A    xor         eax,eax
 0069057C    push        ebp
 0069057D    push        69073F
 00690582    push        dword ptr fs:[eax]
 00690585    mov         dword ptr fs:[eax],esp
 00690588    xor         eax,eax
 0069058A    mov         dword ptr [ebp-8],eax
 0069058D    mov         dword ptr [ebp-4],eax
 00690590    test        esi,esi
>00690592    jl          006905A5
 00690594    mov         eax,[0081ED08];gvar_0081ED08:?
 00690599    call        @DynArrayHigh
 0069059E    mov         edx,esi
 006905A0    dec         edx
 006905A1    cmp         eax,edx
>006905A3    jge         006905B2
 006905A5    xor         eax,eax
 006905A7    mov         dword ptr [ebp-8],eax
 006905AA    mov         dword ptr [ebp-4],eax
>006905AD    jmp         00690721
 006905B2    test        esi,esi
>006905B4    jle         00690655
 006905BA    mov         ebx,esi
 006905BC    dec         ebx
 006905BD    lea         edx,[ebp-14]
 006905C0    mov         eax,esi
 006905C2    call        00694294
 006905C7    mov         eax,dword ptr [ebp-14]
 006905CA    mov         edx,69075C;'Parallel Port Joystick'
 006905CF    call        004F9A58
 006905D4    test        al,al
>006905D6    je          006905E2
 006905D8    xor         eax,eax
 006905DA    mov         dword ptr [ebp-10],eax
 006905DD    mov         dword ptr [ebp-0C],eax
>006905E0    jmp         00690644
 006905E2    imul        eax,ebx,22
 006905E5    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 006905EB    lea         eax,[edx+eax*8]
 006905EE    cmp         dword ptr [eax],0
>006905F1    jne         0069060F
 006905F3    cmp         dword ptr [eax+4],0
>006905F7    jne         0069060F
 006905F9    cmp         dword ptr [eax+8],0
>006905FD    jne         0069060F
 006905FF    cmp         dword ptr [eax+14],0
>00690603    jne         0069060F
 00690605    xor         eax,eax
 00690607    mov         dword ptr [ebp-10],eax
 0069060A    mov         dword ptr [ebp-0C],eax
>0069060D    jmp         00690644
 0069060F    imul        eax,ebx,22
 00690612    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 00690618    mov         eax,dword ptr [edx+eax*8+8]
 0069061C    test        eax,eax
>0069061E    jne         0069062E
 00690620    xor         eax,eax
 00690622    mov         dword ptr [ebp-10],eax
 00690625    mov         dword ptr [ebp-0C],0BFF00000
>0069062C    jmp         00690644
 0069062E    mov         dword ptr [ebp-18],eax
 00690631    fild        dword ptr [ebp-18]
 00690634    fsub        dword ptr ds:[69078C];32767.5:Single
 0069063A    fdiv        dword ptr ds:[69078C];32767.5:Single
 00690640    fstp        qword ptr [ebp-10]
 00690643    wait
 00690644    mov         eax,dword ptr [ebp-10]
 00690647    mov         dword ptr [ebp-8],eax
 0069064A    mov         eax,dword ptr [ebp-0C]
 0069064D    mov         dword ptr [ebp-4],eax
>00690650    jmp         00690721
 00690655    mov         eax,[0081ED08];gvar_0081ED08:?
 0069065A    call        @DynArrayHigh
 0069065F    mov         esi,eax
 00690661    test        esi,esi
>00690663    jl          00690721
 00690669    inc         esi
 0069066A    xor         ebx,ebx
 0069066C    lea         edx,[ebp-1C]
 0069066F    lea         eax,[ebx+1]
 00690672    call        00694294
 00690677    mov         eax,dword ptr [ebp-1C]
 0069067A    mov         edx,69075C;'Parallel Port Joystick'
 0069067F    call        004F9A58
 00690684    test        al,al
>00690686    je          00690692
 00690688    xor         eax,eax
 0069068A    mov         dword ptr [ebp-10],eax
 0069068D    mov         dword ptr [ebp-0C],eax
>00690690    jmp         006906F4
 00690692    imul        eax,ebx,22
 00690695    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 0069069B    lea         eax,[edx+eax*8]
 0069069E    cmp         dword ptr [eax],0
>006906A1    jne         006906BF
 006906A3    cmp         dword ptr [eax+4],0
>006906A7    jne         006906BF
 006906A9    cmp         dword ptr [eax+8],0
>006906AD    jne         006906BF
 006906AF    cmp         dword ptr [eax+14],0
>006906B3    jne         006906BF
 006906B5    xor         eax,eax
 006906B7    mov         dword ptr [ebp-10],eax
 006906BA    mov         dword ptr [ebp-0C],eax
>006906BD    jmp         006906F4
 006906BF    imul        eax,ebx,22
 006906C2    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 006906C8    mov         eax,dword ptr [edx+eax*8+8]
 006906CC    test        eax,eax
>006906CE    jne         006906DE
 006906D0    xor         eax,eax
 006906D2    mov         dword ptr [ebp-10],eax
 006906D5    mov         dword ptr [ebp-0C],0BFF00000
>006906DC    jmp         006906F4
 006906DE    mov         dword ptr [ebp-18],eax
 006906E1    fild        dword ptr [ebp-18]
 006906E4    fsub        dword ptr ds:[69078C];32767.5:Single
 006906EA    fdiv        dword ptr ds:[69078C];32767.5:Single
 006906F0    fstp        qword ptr [ebp-10]
 006906F3    wait
 006906F4    fld         qword ptr [ebp-10]
 006906F7    fabs
 006906F9    fstp        tbyte ptr [ebp-28]
 006906FC    wait
 006906FD    fld         qword ptr [ebp-8]
 00690700    fabs
 00690702    fld         tbyte ptr [ebp-28]
 00690705    fcompp
 00690707    wait
 00690708    fnstsw      al
 0069070A    sahf
>0069070B    jbe         00690719
 0069070D    mov         eax,dword ptr [ebp-10]
 00690710    mov         dword ptr [ebp-8],eax
 00690713    mov         eax,dword ptr [ebp-0C]
 00690716    mov         dword ptr [ebp-4],eax
 00690719    inc         ebx
 0069071A    dec         esi
>0069071B    jne         0069066C
 00690721    xor         eax,eax
 00690723    pop         edx
 00690724    pop         ecx
 00690725    pop         ecx
 00690726    mov         dword ptr fs:[eax],edx
 00690729    push        690746
 0069072E    lea         eax,[ebp-1C]
 00690731    call        @UStrClr
 00690736    lea         eax,[ebp-14]
 00690739    call        @UStrClr
 0069073E    ret
>0069073F    jmp         @HandleFinally
>00690744    jmp         0069072E
 00690746    fld         qword ptr [ebp-8]
 00690749    pop         esi
 0069074A    pop         ebx
 0069074B    mov         esp,ebp
 0069074D    pop         ebp
 0069074E    ret
end;*}

//00690790
{*function sub_00690790(?:?):?;
begin
 00690790    push        ebp
 00690791    mov         ebp,esp
 00690793    add         esp,0FFFFFFD8
 00690796    push        ebx
 00690797    push        esi
 00690798    xor         edx,edx
 0069079A    mov         dword ptr [ebp-1C],edx
 0069079D    mov         dword ptr [ebp-14],edx
 006907A0    mov         esi,eax
 006907A2    xor         eax,eax
 006907A4    push        ebp
 006907A5    push        690967
 006907AA    push        dword ptr fs:[eax]
 006907AD    mov         dword ptr fs:[eax],esp
 006907B0    xor         eax,eax
 006907B2    mov         dword ptr [ebp-8],eax
 006907B5    mov         dword ptr [ebp-4],eax
 006907B8    test        esi,esi
>006907BA    jl          006907CD
 006907BC    mov         eax,[0081ED08];gvar_0081ED08:?
 006907C1    call        @DynArrayHigh
 006907C6    mov         edx,esi
 006907C8    dec         edx
 006907C9    cmp         eax,edx
>006907CB    jge         006907DA
 006907CD    xor         eax,eax
 006907CF    mov         dword ptr [ebp-8],eax
 006907D2    mov         dword ptr [ebp-4],eax
>006907D5    jmp         00690949
 006907DA    test        esi,esi
>006907DC    jle         0069087D
 006907E2    mov         ebx,esi
 006907E4    dec         ebx
 006907E5    lea         edx,[ebp-14]
 006907E8    mov         eax,esi
 006907EA    call        00694294
 006907EF    mov         eax,dword ptr [ebp-14]
 006907F2    mov         edx,690984;'Parallel Port Joystick'
 006907F7    call        004F9A58
 006907FC    test        al,al
>006907FE    je          0069080A
 00690800    xor         eax,eax
 00690802    mov         dword ptr [ebp-10],eax
 00690805    mov         dword ptr [ebp-0C],eax
>00690808    jmp         0069086C
 0069080A    imul        eax,ebx,22
 0069080D    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 00690813    lea         eax,[edx+eax*8]
 00690816    cmp         dword ptr [eax],0
>00690819    jne         00690837
 0069081B    cmp         dword ptr [eax+4],0
>0069081F    jne         00690837
 00690821    cmp         dword ptr [eax+8],0
>00690825    jne         00690837
 00690827    cmp         dword ptr [eax+14],0
>0069082B    jne         00690837
 0069082D    xor         eax,eax
 0069082F    mov         dword ptr [ebp-10],eax
 00690832    mov         dword ptr [ebp-0C],eax
>00690835    jmp         0069086C
 00690837    imul        eax,ebx,22
 0069083A    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 00690840    mov         eax,dword ptr [edx+eax*8+14]
 00690844    test        eax,eax
>00690846    jne         00690856
 00690848    xor         eax,eax
 0069084A    mov         dword ptr [ebp-10],eax
 0069084D    mov         dword ptr [ebp-0C],0BFF00000
>00690854    jmp         0069086C
 00690856    mov         dword ptr [ebp-18],eax
 00690859    fild        dword ptr [ebp-18]
 0069085C    fsub        dword ptr ds:[6909B4];32767.5:Single
 00690862    fdiv        dword ptr ds:[6909B4];32767.5:Single
 00690868    fstp        qword ptr [ebp-10]
 0069086B    wait
 0069086C    mov         eax,dword ptr [ebp-10]
 0069086F    mov         dword ptr [ebp-8],eax
 00690872    mov         eax,dword ptr [ebp-0C]
 00690875    mov         dword ptr [ebp-4],eax
>00690878    jmp         00690949
 0069087D    mov         eax,[0081ED08];gvar_0081ED08:?
 00690882    call        @DynArrayHigh
 00690887    mov         esi,eax
 00690889    test        esi,esi
>0069088B    jl          00690949
 00690891    inc         esi
 00690892    xor         ebx,ebx
 00690894    lea         edx,[ebp-1C]
 00690897    lea         eax,[ebx+1]
 0069089A    call        00694294
 0069089F    mov         eax,dword ptr [ebp-1C]
 006908A2    mov         edx,690984;'Parallel Port Joystick'
 006908A7    call        004F9A58
 006908AC    test        al,al
>006908AE    je          006908BA
 006908B0    xor         eax,eax
 006908B2    mov         dword ptr [ebp-10],eax
 006908B5    mov         dword ptr [ebp-0C],eax
>006908B8    jmp         0069091C
 006908BA    imul        eax,ebx,22
 006908BD    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 006908C3    lea         eax,[edx+eax*8]
 006908C6    cmp         dword ptr [eax],0
>006908C9    jne         006908E7
 006908CB    cmp         dword ptr [eax+4],0
>006908CF    jne         006908E7
 006908D1    cmp         dword ptr [eax+8],0
>006908D5    jne         006908E7
 006908D7    cmp         dword ptr [eax+14],0
>006908DB    jne         006908E7
 006908DD    xor         eax,eax
 006908DF    mov         dword ptr [ebp-10],eax
 006908E2    mov         dword ptr [ebp-0C],eax
>006908E5    jmp         0069091C
 006908E7    imul        eax,ebx,22
 006908EA    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 006908F0    mov         eax,dword ptr [edx+eax*8+14]
 006908F4    test        eax,eax
>006908F6    jne         00690906
 006908F8    xor         eax,eax
 006908FA    mov         dword ptr [ebp-10],eax
 006908FD    mov         dword ptr [ebp-0C],0BFF00000
>00690904    jmp         0069091C
 00690906    mov         dword ptr [ebp-18],eax
 00690909    fild        dword ptr [ebp-18]
 0069090C    fsub        dword ptr ds:[6909B4];32767.5:Single
 00690912    fdiv        dword ptr ds:[6909B4];32767.5:Single
 00690918    fstp        qword ptr [ebp-10]
 0069091B    wait
 0069091C    fld         qword ptr [ebp-10]
 0069091F    fabs
 00690921    fstp        tbyte ptr [ebp-28]
 00690924    wait
 00690925    fld         qword ptr [ebp-8]
 00690928    fabs
 0069092A    fld         tbyte ptr [ebp-28]
 0069092D    fcompp
 0069092F    wait
 00690930    fnstsw      al
 00690932    sahf
>00690933    jbe         00690941
 00690935    mov         eax,dword ptr [ebp-10]
 00690938    mov         dword ptr [ebp-8],eax
 0069093B    mov         eax,dword ptr [ebp-0C]
 0069093E    mov         dword ptr [ebp-4],eax
 00690941    inc         ebx
 00690942    dec         esi
>00690943    jne         00690894
 00690949    xor         eax,eax
 0069094B    pop         edx
 0069094C    pop         ecx
 0069094D    pop         ecx
 0069094E    mov         dword ptr fs:[eax],edx
 00690951    push        69096E
 00690956    lea         eax,[ebp-1C]
 00690959    call        @UStrClr
 0069095E    lea         eax,[ebp-14]
 00690961    call        @UStrClr
 00690966    ret
>00690967    jmp         @HandleFinally
>0069096C    jmp         00690956
 0069096E    fld         qword ptr [ebp-8]
 00690971    pop         esi
 00690972    pop         ebx
 00690973    mov         esp,ebp
 00690975    pop         ebp
 00690976    ret
end;*}

//006909B8
procedure TJoystickValue.GetValue;
begin
{*
 006909B8    push        ebp
 006909B9    mov         ebp,esp
 006909BB    add         esp,0FFFFFF94
 006909BE    push        ebx
 006909BF    push        esi
 006909C0    xor         edx,edx
 006909C2    mov         dword ptr [ebp-6C],edx
 006909C5    mov         dword ptr [ebp-4],edx
 006909C8    mov         ebx,eax
 006909CA    xor         eax,eax
 006909CC    push        ebp
 006909CD    push        6923F5
 006909D2    push        dword ptr fs:[eax]
 006909D5    mov         dword ptr fs:[eax],esp
 006909D8    mov         eax,ebx
 006909DA    mov         edx,dword ptr [eax]
 006909DC    call        dword ptr [edx+44];TJoystickValue.GetDataType
 006909DF    cmp         al,5
>006909E1    jne         00690A14
 006909E3    lea         eax,[ebp-28]
 006909E6    push        eax
 006909E7    lea         ecx,[ebp-20]
 006909EA    lea         edx,[ebp-18]
 006909ED    mov         eax,ebx
 006909EF    mov         ebx,dword ptr [eax]
 006909F1    call        dword ptr [ebx+3C];TJoystickValue.GetVector
 006909F4    push        dword ptr [ebp-14]
 006909F7    push        dword ptr [ebp-18]
 006909FA    push        dword ptr [ebp-1C]
 006909FD    push        dword ptr [ebp-20]
 00690A00    push        dword ptr [ebp-24]
 00690A03    push        dword ptr [ebp-28]
 00690A06    call        005C4070
 00690A0B    fstp        qword ptr [ebp-10]
 00690A0E    wait
>00690A0F    jmp         006923D7
 00690A14    mov         esi,dword ptr [ebx+18];TJoystickValue......................................................
 00690A17    test        esi,esi
>00690A19    jle         00690A29
 00690A1B    mov         eax,[0081ED08];gvar_0081ED08:?
 00690A20    call        @DynArrayLength
 00690A25    cmp         esi,eax
>00690A27    jle         00690A31
 00690A29    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
>00690A2F    jmp         00690A42
 00690A31    imul        eax,dword ptr [ebx+18],22;TJoystickValue...................................................
 00690A35    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 00690A3B    lea         edx,[edx+eax*8-110]
 00690A42    mov         eax,edx
 00690A44    cmp         dword ptr [eax],0
>00690A47    jne         00690A71
 00690A49    cmp         dword ptr [eax+4],0
>00690A4D    jne         00690A71
 00690A4F    cmp         dword ptr [eax+8],0
>00690A53    jne         00690A71
 00690A55    cmp         dword ptr [eax+14],0
>00690A59    jne         00690A71
 00690A5B    cmp         dword ptr [ebx+20],103;TJoystickValue..............................Item:Integer
>00690A62    je          00690A71
 00690A64    xor         eax,eax
 00690A66    mov         dword ptr [ebp-10],eax
 00690A69    mov         dword ptr [ebp-0C],eax
>00690A6C    jmp         006923D7
 00690A71    mov         eax,dword ptr [ebx+20];TJoystickValue...............................Item:Integer
 00690A74    mov         ecx,eax
 00690A76    cmp         ecx,10A
>00690A7C    jg          00690BD3
>00690A82    je          00690CAD
 00690A88    cmp         ecx,8F
>00690A8E    jg          00690B26
>00690A94    je          00691D99
 00690A9A    cmp         ecx,87
>00690AA0    jg          00690AF4
>00690AA2    je          00690DEB
 00690AA8    cmp         ecx,83
>00690AAE    jg          00690AD5
>00690AB0    je          00690D1F
 00690AB6    dec         ecx
 00690AB7    sub         ecx,80
>00690ABD    jb          00690C5D
>00690AC3    je          00690CBA
 00690AC9    dec         ecx
>00690ACA    je          00690CEC
>00690AD0    jmp         006923CF
 00690AD5    sub         ecx,84
>00690ADB    je          00690D52
 00690AE1    dec         ecx
>00690AE2    je          00690D85
 00690AE8    dec         ecx
>00690AE9    je          00690DB8
>00690AEF    jmp         006923CF
 00690AF4    add         ecx,0FFFFFF78
 00690AFA    cmp         ecx,6
>00690AFD    ja          006923CF
 00690B03    jmp         dword ptr [ecx*4+690B0A]
 00690B03    dd          00690E1E
 00690B03    dd          00690E51
 00690B03    dd          00690E62
 00690B03    dd          00690E73
 00690B03    dd          00690E84
 00690B03    dd          00691D2D
 00690B03    dd          00691D63
 00690B26    cmp         ecx,0FB
>00690B2C    jg          00690B85
>00690B2E    je          0069230D
 00690B34    cmp         ecx,93
>00690B3A    jg          00690B61
>00690B3C    je          00691E71
 00690B42    sub         ecx,90
>00690B48    je          00691DCF
 00690B4E    dec         ecx
>00690B4F    je          00691E05
 00690B55    dec         ecx
>00690B56    je          00691E3B
>00690B5C    jmp         006923CF
 00690B61    sub         ecx,94
>00690B67    je          00691EA7
 00690B6D    dec         ecx
 00690B6E    sub         ecx,20
>00690B71    jb          00691EDD
 00690B77    sub         ecx,45
>00690B7A    je          00692300
>00690B80    jmp         006923CF
 00690B85    add         ecx,0FFFFFF04
 00690B8B    cmp         ecx,0D
>00690B8E    ja          006923CF
 00690B94    jmp         dword ptr [ecx*4+690B9B]
 00690B94    dd          0069231A
 00690B94    dd          00692340
 00690B94    dd          006923CF
 00690B94    dd          006923CF
 00690B94    dd          006923CF
 00690B94    dd          00692391
 00690B94    dd          006923A5
 00690B94    dd          006923B9
 00690B94    dd          006923CF
 00690B94    dd          006923CF
 00690B94    dd          006923CF
 00690B94    dd          006923CF
 00690B94    dd          006923CF
 00690B94    dd          00690CA0
 00690BD3    add         ecx,0FFFFFEEE
 00690BD9    cmp         ecx,1C
>00690BDC    ja          006923CF
 00690BE2    jmp         dword ptr [ecx*4+690BE9]
 00690BE2    dd          0069182D
 00690BE2    dd          0069196F
 00690BE2    dd          006919AD
 00690BE2    dd          00691931
 00690BE2    dd          006919EB
 00690BE2    dd          00691A85
 00690BE2    dd          00691AC3
 00690BE2    dd          00691A47
 00690BE2    dd          00691B01
 00690BE2    dd          00691B9B
 00690BE2    dd          00691BD9
 00690BE2    dd          00691B5D
 00690BE2    dd          00691C17
 00690BE2    dd          00691CB1
 00690BE2    dd          00691CEF
 00690BE2    dd          00691C73
 00690BE2    dd          00691889
 00690BE2    dd          006918B3
 00690BE2    dd          006918DD
 00690BE2    dd          00691907
 00690BE2    dd          00690E95
 00690BE2    dd          00690FEB
 00690BE2    dd          006910FB
 00690BE2    dd          00691251
 00690BE2    dd          00691361
 00690BE2    dd          006914B7
 00690BE2    dd          006915C7
 00690BE2    dd          0069171D
 00690BE2    dd          00690C73
 00690C5D    test        byte ptr [edx+eax+2F],80
 00690C62    seta        al
 00690C65    call        00686074
 00690C6A    fstp        qword ptr [ebp-10]
 00690C6D    wait
>00690C6E    jmp         006923D7
 00690C73    xor         ecx,ecx
 00690C75    xor         eax,eax
 00690C77    test        cl,cl
>00690C79    jne         00690C86
 00690C7B    test        byte ptr [edx+eax+2F],80
>00690C80    ja          00690C86
 00690C82    xor         ecx,ecx
>00690C84    jmp         00690C88
 00690C86    mov         cl,1
 00690C88    inc         eax
 00690C89    cmp         eax,80
>00690C8E    jne         00690C77
 00690C90    mov         eax,ecx
 00690C92    call        00686074
 00690C97    fstp        qword ptr [ebp-10]
 00690C9A    wait
>00690C9B    jmp         006923D7
 00690CA0    xor         eax,eax
 00690CA2    mov         dword ptr [ebp-10],eax
 00690CA5    mov         dword ptr [ebp-0C],eax
>00690CA8    jmp         006923D7
 00690CAD    xor         eax,eax
 00690CAF    mov         dword ptr [ebp-10],eax
 00690CB2    mov         dword ptr [ebp-0C],eax
>00690CB5    jmp         006923D7
 00690CBA    mov         eax,dword ptr [edx]
 00690CBC    test        eax,eax
>00690CBE    jne         00690CD1
 00690CC0    xor         eax,eax
 00690CC2    mov         dword ptr [ebp-10],eax
 00690CC5    mov         dword ptr [ebp-0C],0BFF00000
>00690CCC    jmp         006923D7
 00690CD1    mov         dword ptr [ebp-60],eax
 00690CD4    fild        dword ptr [ebp-60]
 00690CD7    fsub        dword ptr ds:[692408];32767.5:Single
 00690CDD    fdiv        dword ptr ds:[692408];32767.5:Single
 00690CE3    fstp        qword ptr [ebp-10]
 00690CE6    wait
>00690CE7    jmp         006923D7
 00690CEC    mov         eax,dword ptr [edx+4]
 00690CEF    test        eax,eax
>00690CF1    jne         00690D04
 00690CF3    xor         eax,eax
 00690CF5    mov         dword ptr [ebp-10],eax
 00690CF8    mov         dword ptr [ebp-0C],0BFF00000
>00690CFF    jmp         006923D7
 00690D04    mov         dword ptr [ebp-60],eax
 00690D07    fild        dword ptr [ebp-60]
 00690D0A    fsub        dword ptr ds:[692408];32767.5:Single
 00690D10    fdiv        dword ptr ds:[692408];32767.5:Single
 00690D16    fstp        qword ptr [ebp-10]
 00690D19    wait
>00690D1A    jmp         006923D7
 00690D1F    mov         eax,dword ptr [edx+8]
 00690D22    test        eax,eax
>00690D24    jne         00690D37
 00690D26    xor         eax,eax
 00690D28    mov         dword ptr [ebp-10],eax
 00690D2B    mov         dword ptr [ebp-0C],0BFF00000
>00690D32    jmp         006923D7
 00690D37    mov         dword ptr [ebp-60],eax
 00690D3A    fild        dword ptr [ebp-60]
 00690D3D    fsub        dword ptr ds:[692408];32767.5:Single
 00690D43    fdiv        dword ptr ds:[692408];32767.5:Single
 00690D49    fstp        qword ptr [ebp-10]
 00690D4C    wait
>00690D4D    jmp         006923D7
 00690D52    mov         eax,dword ptr [edx+0C]
 00690D55    test        eax,eax
>00690D57    jne         00690D6A
 00690D59    xor         eax,eax
 00690D5B    mov         dword ptr [ebp-10],eax
 00690D5E    mov         dword ptr [ebp-0C],0BFF00000
>00690D65    jmp         006923D7
 00690D6A    mov         dword ptr [ebp-60],eax
 00690D6D    fild        dword ptr [ebp-60]
 00690D70    fsub        dword ptr ds:[692408];32767.5:Single
 00690D76    fdiv        dword ptr ds:[692408];32767.5:Single
 00690D7C    fstp        qword ptr [ebp-10]
 00690D7F    wait
>00690D80    jmp         006923D7
 00690D85    mov         eax,dword ptr [edx+10]
 00690D88    test        eax,eax
>00690D8A    jne         00690D9D
 00690D8C    xor         eax,eax
 00690D8E    mov         dword ptr [ebp-10],eax
 00690D91    mov         dword ptr [ebp-0C],0BFF00000
>00690D98    jmp         006923D7
 00690D9D    mov         dword ptr [ebp-60],eax
 00690DA0    fild        dword ptr [ebp-60]
 00690DA3    fsub        dword ptr ds:[692408];32767.5:Single
 00690DA9    fdiv        dword ptr ds:[692408];32767.5:Single
 00690DAF    fstp        qword ptr [ebp-10]
 00690DB2    wait
>00690DB3    jmp         006923D7
 00690DB8    mov         eax,dword ptr [edx+14]
 00690DBB    test        eax,eax
>00690DBD    jne         00690DD0
 00690DBF    xor         eax,eax
 00690DC1    mov         dword ptr [ebp-10],eax
 00690DC4    mov         dword ptr [ebp-0C],0BFF00000
>00690DCB    jmp         006923D7
 00690DD0    mov         dword ptr [ebp-60],eax
 00690DD3    fild        dword ptr [ebp-60]
 00690DD6    fsub        dword ptr ds:[692408];32767.5:Single
 00690DDC    fdiv        dword ptr ds:[692408];32767.5:Single
 00690DE2    fstp        qword ptr [ebp-10]
 00690DE5    wait
>00690DE6    jmp         006923D7
 00690DEB    mov         eax,dword ptr [edx+18]
 00690DEE    test        eax,eax
>00690DF0    jne         00690E03
 00690DF2    xor         eax,eax
 00690DF4    mov         dword ptr [ebp-10],eax
 00690DF7    mov         dword ptr [ebp-0C],0BFF00000
>00690DFE    jmp         006923D7
 00690E03    mov         dword ptr [ebp-60],eax
 00690E06    fild        dword ptr [ebp-60]
 00690E09    fsub        dword ptr ds:[692408];32767.5:Single
 00690E0F    fdiv        dword ptr ds:[692408];32767.5:Single
 00690E15    fstp        qword ptr [ebp-10]
 00690E18    wait
>00690E19    jmp         006923D7
 00690E1E    mov         eax,dword ptr [edx+1C]
 00690E21    test        eax,eax
>00690E23    jne         00690E36
 00690E25    xor         eax,eax
 00690E27    mov         dword ptr [ebp-10],eax
 00690E2A    mov         dword ptr [ebp-0C],0BFF00000
>00690E31    jmp         006923D7
 00690E36    mov         dword ptr [ebp-60],eax
 00690E39    fild        dword ptr [ebp-60]
 00690E3C    fsub        dword ptr ds:[692408];32767.5:Single
 00690E42    fdiv        dword ptr ds:[692408];32767.5:Single
 00690E48    fstp        qword ptr [ebp-10]
 00690E4B    wait
>00690E4C    jmp         006923D7
 00690E51    mov         eax,dword ptr [edx+20]
 00690E54    call        0068FCC8
 00690E59    fstp        qword ptr [ebp-10]
 00690E5C    wait
>00690E5D    jmp         006923D7
 00690E62    mov         eax,dword ptr [edx+24]
 00690E65    call        0068FCC8
 00690E6A    fstp        qword ptr [ebp-10]
 00690E6D    wait
>00690E6E    jmp         006923D7
 00690E73    mov         eax,dword ptr [edx+28]
 00690E76    call        0068FCC8
 00690E7B    fstp        qword ptr [ebp-10]
 00690E7E    wait
>00690E7F    jmp         006923D7
 00690E84    mov         eax,dword ptr [edx+2C]
 00690E87    call        0068FCC8
 00690E8C    fstp        qword ptr [ebp-10]
 00690E8F    wait
>00690E90    jmp         006923D7
 00690E95    mov         eax,dword ptr [edx+20]
 00690E98    call        0068FCC8
 00690E9D    fstp        qword ptr [ebp-30]
 00690EA0    wait
 00690EA1    fld         qword ptr [ebp-30]
 00690EA4    fcomp       dword ptr ds:[69240C];0:Single
 00690EAA    wait
 00690EAB    fnstsw      al
 00690EAD    sahf
>00690EAE    jae         00690EBD
 00690EB0    xor         eax,eax
 00690EB2    mov         dword ptr [ebp-10],eax
 00690EB5    mov         dword ptr [ebp-0C],eax
>00690EB8    jmp         006923D7
 00690EBD    fld         qword ptr [ebp-30]
 00690EC0    fcomp       dword ptr ds:[692410];45:Single
 00690EC6    wait
 00690EC7    fnstsw      al
 00690EC9    sahf
>00690ECA    jae         00690EEA
 00690ECC    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 00690ED2    fmul        qword ptr [ebp-30]
 00690ED5    add         esp,0FFFFFFF4
 00690ED8    fstp        tbyte ptr [esp]
 00690EDB    wait
 00690EDC    call        00454ACC
 00690EE1    fstp        qword ptr [ebp-10]
 00690EE4    wait
>00690EE5    jmp         006923D7
 00690EEA    fld         qword ptr [ebp-30]
 00690EED    fcomp       dword ptr ds:[692420];135:Single
 00690EF3    wait
 00690EF4    fnstsw      al
 00690EF6    sahf
>00690EF7    ja          00690F0A
 00690EF9    xor         eax,eax
 00690EFB    mov         dword ptr [ebp-10],eax
 00690EFE    mov         dword ptr [ebp-0C],3FF00000
>00690F05    jmp         006923D7
 00690F0A    fld         qword ptr [ebp-30]
 00690F0D    fcomp       dword ptr ds:[692424];180:Single
 00690F13    wait
 00690F14    fnstsw      al
 00690F16    sahf
>00690F17    jae         00690F3F
 00690F19    fld         dword ptr ds:[692424];180:Single
 00690F1F    fsub        qword ptr [ebp-30]
 00690F22    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 00690F28    fmulp       st(1),st
 00690F2A    add         esp,0FFFFFFF4
 00690F2D    fstp        tbyte ptr [esp]
 00690F30    wait
 00690F31    call        00454ACC
 00690F36    fstp        qword ptr [ebp-10]
 00690F39    wait
>00690F3A    jmp         006923D7
 00690F3F    fld         qword ptr [ebp-30]
 00690F42    fcomp       dword ptr ds:[692428];225:Single
 00690F48    wait
 00690F49    fnstsw      al
 00690F4B    sahf
>00690F4C    jae         00690F76
 00690F4E    fld         qword ptr [ebp-30]
 00690F51    fsub        dword ptr ds:[692424];180:Single
 00690F57    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 00690F5D    fmulp       st(1),st
 00690F5F    add         esp,0FFFFFFF4
 00690F62    fstp        tbyte ptr [esp]
 00690F65    wait
 00690F66    call        00454ACC
 00690F6B    fchs
 00690F6D    fstp        qword ptr [ebp-10]
 00690F70    wait
>00690F71    jmp         006923D7
 00690F76    fld         qword ptr [ebp-30]
 00690F79    fcomp       dword ptr ds:[69242C];315:Single
 00690F7F    wait
 00690F80    fnstsw      al
 00690F82    sahf
>00690F83    jae         00690F96
 00690F85    xor         eax,eax
 00690F87    mov         dword ptr [ebp-10],eax
 00690F8A    mov         dword ptr [ebp-0C],0BFF00000
>00690F91    jmp         006923D7
 00690F96    fld         qword ptr [ebp-30]
 00690F99    fcomp       dword ptr ds:[692430];360:Single
 00690F9F    wait
 00690FA0    fnstsw      al
 00690FA2    sahf
>00690FA3    ja          00690FCD
 00690FA5    fld         dword ptr ds:[692430];360:Single
 00690FAB    fsub        qword ptr [ebp-30]
 00690FAE    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 00690FB4    fmulp       st(1),st
 00690FB6    add         esp,0FFFFFFF4
 00690FB9    fstp        tbyte ptr [esp]
 00690FBC    wait
 00690FBD    call        00454ACC
 00690FC2    fchs
 00690FC4    fstp        qword ptr [ebp-10]
 00690FC7    wait
>00690FC8    jmp         006923D7
 00690FCD    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 00690FD3    fmul        qword ptr [ebp-30]
 00690FD6    add         esp,0FFFFFFF4
 00690FD9    fstp        tbyte ptr [esp]
 00690FDC    wait
 00690FDD    call        Sin
 00690FE2    fstp        qword ptr [ebp-10]
 00690FE5    wait
>00690FE6    jmp         006923D7
 00690FEB    mov         eax,dword ptr [edx+20]
 00690FEE    call        0068FCC8
 00690FF3    fstp        qword ptr [ebp-30]
 00690FF6    wait
 00690FF7    fld         qword ptr [ebp-30]
 00690FFA    fcomp       dword ptr ds:[69240C];0:Single
 00691000    wait
 00691001    fnstsw      al
 00691003    sahf
>00691004    jae         00691013
 00691006    xor         eax,eax
 00691008    mov         dword ptr [ebp-10],eax
 0069100B    mov         dword ptr [ebp-0C],eax
>0069100E    jmp         006923D7
 00691013    fld         qword ptr [ebp-30]
 00691016    fcomp       dword ptr ds:[692410];45:Single
 0069101C    wait
 0069101D    fnstsw      al
 0069101F    sahf
>00691020    jae         00691033
 00691022    xor         eax,eax
 00691024    mov         dword ptr [ebp-10],eax
 00691027    mov         dword ptr [ebp-0C],0BFF00000
>0069102E    jmp         006923D7
 00691033    fld         qword ptr [ebp-30]
 00691036    fcomp       dword ptr ds:[692420];135:Single
 0069103C    wait
 0069103D    fnstsw      al
 0069103F    sahf
>00691040    ja          00691068
 00691042    fld         qword ptr [ebp-30]
 00691045    fsub        dword ptr ds:[692434];90:Single
 0069104B    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 00691051    fmulp       st(1),st
 00691053    add         esp,0FFFFFFF4
 00691056    fstp        tbyte ptr [esp]
 00691059    wait
 0069105A    call        00454ACC
 0069105F    fstp        qword ptr [ebp-10]
 00691062    wait
>00691063    jmp         006923D7
 00691068    fld         qword ptr [ebp-30]
 0069106B    fcomp       dword ptr ds:[692428];225:Single
 00691071    wait
 00691072    fnstsw      al
 00691074    sahf
>00691075    jae         00691088
 00691077    xor         eax,eax
 00691079    mov         dword ptr [ebp-10],eax
 0069107C    mov         dword ptr [ebp-0C],3FF00000
>00691083    jmp         006923D7
 00691088    fld         qword ptr [ebp-30]
 0069108B    fcomp       dword ptr ds:[69242C];315:Single
 00691091    wait
 00691092    fnstsw      al
 00691094    sahf
>00691095    jae         006910BD
 00691097    fld         dword ptr ds:[692438];270:Single
 0069109D    fsub        qword ptr [ebp-30]
 006910A0    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 006910A6    fmulp       st(1),st
 006910A8    add         esp,0FFFFFFF4
 006910AB    fstp        tbyte ptr [esp]
 006910AE    wait
 006910AF    call        00454ACC
 006910B4    fstp        qword ptr [ebp-10]
 006910B7    wait
>006910B8    jmp         006923D7
 006910BD    fld         qword ptr [ebp-30]
 006910C0    fcomp       dword ptr ds:[692430];360:Single
 006910C6    wait
 006910C7    fnstsw      al
 006910C9    sahf
>006910CA    ja          006910DD
 006910CC    xor         eax,eax
 006910CE    mov         dword ptr [ebp-10],eax
 006910D1    mov         dword ptr [ebp-0C],0BFF00000
>006910D8    jmp         006923D7
 006910DD    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 006910E3    fmul        qword ptr [ebp-30]
 006910E6    add         esp,0FFFFFFF4
 006910E9    fstp        tbyte ptr [esp]
 006910EC    wait
 006910ED    call        Cos
 006910F2    fstp        qword ptr [ebp-10]
 006910F5    wait
>006910F6    jmp         006923D7
 006910FB    mov         eax,dword ptr [edx+24]
 006910FE    call        0068FCC8
 00691103    fstp        qword ptr [ebp-30]
 00691106    wait
 00691107    fld         qword ptr [ebp-30]
 0069110A    fcomp       dword ptr ds:[69240C];0:Single
 00691110    wait
 00691111    fnstsw      al
 00691113    sahf
>00691114    jae         00691123
 00691116    xor         eax,eax
 00691118    mov         dword ptr [ebp-10],eax
 0069111B    mov         dword ptr [ebp-0C],eax
>0069111E    jmp         006923D7
 00691123    fld         qword ptr [ebp-30]
 00691126    fcomp       dword ptr ds:[692410];45:Single
 0069112C    wait
 0069112D    fnstsw      al
 0069112F    sahf
>00691130    jae         00691150
 00691132    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 00691138    fmul        qword ptr [ebp-30]
 0069113B    add         esp,0FFFFFFF4
 0069113E    fstp        tbyte ptr [esp]
 00691141    wait
 00691142    call        00454ACC
 00691147    fstp        qword ptr [ebp-10]
 0069114A    wait
>0069114B    jmp         006923D7
 00691150    fld         qword ptr [ebp-30]
 00691153    fcomp       dword ptr ds:[692420];135:Single
 00691159    wait
 0069115A    fnstsw      al
 0069115C    sahf
>0069115D    ja          00691170
 0069115F    xor         eax,eax
 00691161    mov         dword ptr [ebp-10],eax
 00691164    mov         dword ptr [ebp-0C],3FF00000
>0069116B    jmp         006923D7
 00691170    fld         qword ptr [ebp-30]
 00691173    fcomp       dword ptr ds:[692424];180:Single
 00691179    wait
 0069117A    fnstsw      al
 0069117C    sahf
>0069117D    jae         006911A5
 0069117F    fld         dword ptr ds:[692424];180:Single
 00691185    fsub        qword ptr [ebp-30]
 00691188    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 0069118E    fmulp       st(1),st
 00691190    add         esp,0FFFFFFF4
 00691193    fstp        tbyte ptr [esp]
 00691196    wait
 00691197    call        00454ACC
 0069119C    fstp        qword ptr [ebp-10]
 0069119F    wait
>006911A0    jmp         006923D7
 006911A5    fld         qword ptr [ebp-30]
 006911A8    fcomp       dword ptr ds:[692428];225:Single
 006911AE    wait
 006911AF    fnstsw      al
 006911B1    sahf
>006911B2    jae         006911DC
 006911B4    fld         qword ptr [ebp-30]
 006911B7    fsub        dword ptr ds:[692424];180:Single
 006911BD    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 006911C3    fmulp       st(1),st
 006911C5    add         esp,0FFFFFFF4
 006911C8    fstp        tbyte ptr [esp]
 006911CB    wait
 006911CC    call        00454ACC
 006911D1    fchs
 006911D3    fstp        qword ptr [ebp-10]
 006911D6    wait
>006911D7    jmp         006923D7
 006911DC    fld         qword ptr [ebp-30]
 006911DF    fcomp       dword ptr ds:[69242C];315:Single
 006911E5    wait
 006911E6    fnstsw      al
 006911E8    sahf
>006911E9    jae         006911FC
 006911EB    xor         eax,eax
 006911ED    mov         dword ptr [ebp-10],eax
 006911F0    mov         dword ptr [ebp-0C],0BFF00000
>006911F7    jmp         006923D7
 006911FC    fld         qword ptr [ebp-30]
 006911FF    fcomp       dword ptr ds:[692430];360:Single
 00691205    wait
 00691206    fnstsw      al
 00691208    sahf
>00691209    ja          00691233
 0069120B    fld         dword ptr ds:[692430];360:Single
 00691211    fsub        qword ptr [ebp-30]
 00691214    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 0069121A    fmulp       st(1),st
 0069121C    add         esp,0FFFFFFF4
 0069121F    fstp        tbyte ptr [esp]
 00691222    wait
 00691223    call        00454ACC
 00691228    fchs
 0069122A    fstp        qword ptr [ebp-10]
 0069122D    wait
>0069122E    jmp         006923D7
 00691233    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 00691239    fmul        qword ptr [ebp-30]
 0069123C    add         esp,0FFFFFFF4
 0069123F    fstp        tbyte ptr [esp]
 00691242    wait
 00691243    call        Sin
 00691248    fstp        qword ptr [ebp-10]
 0069124B    wait
>0069124C    jmp         006923D7
 00691251    mov         eax,dword ptr [edx+24]
 00691254    call        0068FCC8
 00691259    fstp        qword ptr [ebp-30]
 0069125C    wait
 0069125D    fld         qword ptr [ebp-30]
 00691260    fcomp       dword ptr ds:[69240C];0:Single
 00691266    wait
 00691267    fnstsw      al
 00691269    sahf
>0069126A    jae         00691279
 0069126C    xor         eax,eax
 0069126E    mov         dword ptr [ebp-10],eax
 00691271    mov         dword ptr [ebp-0C],eax
>00691274    jmp         006923D7
 00691279    fld         qword ptr [ebp-30]
 0069127C    fcomp       dword ptr ds:[692410];45:Single
 00691282    wait
 00691283    fnstsw      al
 00691285    sahf
>00691286    jae         00691299
 00691288    xor         eax,eax
 0069128A    mov         dword ptr [ebp-10],eax
 0069128D    mov         dword ptr [ebp-0C],0BFF00000
>00691294    jmp         006923D7
 00691299    fld         qword ptr [ebp-30]
 0069129C    fcomp       dword ptr ds:[692420];135:Single
 006912A2    wait
 006912A3    fnstsw      al
 006912A5    sahf
>006912A6    ja          006912CE
 006912A8    fld         qword ptr [ebp-30]
 006912AB    fsub        dword ptr ds:[692434];90:Single
 006912B1    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 006912B7    fmulp       st(1),st
 006912B9    add         esp,0FFFFFFF4
 006912BC    fstp        tbyte ptr [esp]
 006912BF    wait
 006912C0    call        00454ACC
 006912C5    fstp        qword ptr [ebp-10]
 006912C8    wait
>006912C9    jmp         006923D7
 006912CE    fld         qword ptr [ebp-30]
 006912D1    fcomp       dword ptr ds:[692428];225:Single
 006912D7    wait
 006912D8    fnstsw      al
 006912DA    sahf
>006912DB    jae         006912EE
 006912DD    xor         eax,eax
 006912DF    mov         dword ptr [ebp-10],eax
 006912E2    mov         dword ptr [ebp-0C],3FF00000
>006912E9    jmp         006923D7
 006912EE    fld         qword ptr [ebp-30]
 006912F1    fcomp       dword ptr ds:[69242C];315:Single
 006912F7    wait
 006912F8    fnstsw      al
 006912FA    sahf
>006912FB    jae         00691323
 006912FD    fld         dword ptr ds:[692438];270:Single
 00691303    fsub        qword ptr [ebp-30]
 00691306    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 0069130C    fmulp       st(1),st
 0069130E    add         esp,0FFFFFFF4
 00691311    fstp        tbyte ptr [esp]
 00691314    wait
 00691315    call        00454ACC
 0069131A    fstp        qword ptr [ebp-10]
 0069131D    wait
>0069131E    jmp         006923D7
 00691323    fld         qword ptr [ebp-30]
 00691326    fcomp       dword ptr ds:[692430];360:Single
 0069132C    wait
 0069132D    fnstsw      al
 0069132F    sahf
>00691330    ja          00691343
 00691332    xor         eax,eax
 00691334    mov         dword ptr [ebp-10],eax
 00691337    mov         dword ptr [ebp-0C],0BFF00000
>0069133E    jmp         006923D7
 00691343    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 00691349    fmul        qword ptr [ebp-30]
 0069134C    add         esp,0FFFFFFF4
 0069134F    fstp        tbyte ptr [esp]
 00691352    wait
 00691353    call        Cos
 00691358    fstp        qword ptr [ebp-10]
 0069135B    wait
>0069135C    jmp         006923D7
 00691361    mov         eax,dword ptr [edx+28]
 00691364    call        0068FCC8
 00691369    fstp        qword ptr [ebp-30]
 0069136C    wait
 0069136D    fld         qword ptr [ebp-30]
 00691370    fcomp       dword ptr ds:[69240C];0:Single
 00691376    wait
 00691377    fnstsw      al
 00691379    sahf
>0069137A    jae         00691389
 0069137C    xor         eax,eax
 0069137E    mov         dword ptr [ebp-10],eax
 00691381    mov         dword ptr [ebp-0C],eax
>00691384    jmp         006923D7
 00691389    fld         qword ptr [ebp-30]
 0069138C    fcomp       dword ptr ds:[692410];45:Single
 00691392    wait
 00691393    fnstsw      al
 00691395    sahf
>00691396    jae         006913B6
 00691398    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 0069139E    fmul        qword ptr [ebp-30]
 006913A1    add         esp,0FFFFFFF4
 006913A4    fstp        tbyte ptr [esp]
 006913A7    wait
 006913A8    call        00454ACC
 006913AD    fstp        qword ptr [ebp-10]
 006913B0    wait
>006913B1    jmp         006923D7
 006913B6    fld         qword ptr [ebp-30]
 006913B9    fcomp       dword ptr ds:[692420];135:Single
 006913BF    wait
 006913C0    fnstsw      al
 006913C2    sahf
>006913C3    ja          006913D6
 006913C5    xor         eax,eax
 006913C7    mov         dword ptr [ebp-10],eax
 006913CA    mov         dword ptr [ebp-0C],3FF00000
>006913D1    jmp         006923D7
 006913D6    fld         qword ptr [ebp-30]
 006913D9    fcomp       dword ptr ds:[692424];180:Single
 006913DF    wait
 006913E0    fnstsw      al
 006913E2    sahf
>006913E3    jae         0069140B
 006913E5    fld         dword ptr ds:[692424];180:Single
 006913EB    fsub        qword ptr [ebp-30]
 006913EE    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 006913F4    fmulp       st(1),st
 006913F6    add         esp,0FFFFFFF4
 006913F9    fstp        tbyte ptr [esp]
 006913FC    wait
 006913FD    call        00454ACC
 00691402    fstp        qword ptr [ebp-10]
 00691405    wait
>00691406    jmp         006923D7
 0069140B    fld         qword ptr [ebp-30]
 0069140E    fcomp       dword ptr ds:[692428];225:Single
 00691414    wait
 00691415    fnstsw      al
 00691417    sahf
>00691418    jae         00691442
 0069141A    fld         qword ptr [ebp-30]
 0069141D    fsub        dword ptr ds:[692424];180:Single
 00691423    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 00691429    fmulp       st(1),st
 0069142B    add         esp,0FFFFFFF4
 0069142E    fstp        tbyte ptr [esp]
 00691431    wait
 00691432    call        00454ACC
 00691437    fchs
 00691439    fstp        qword ptr [ebp-10]
 0069143C    wait
>0069143D    jmp         006923D7
 00691442    fld         qword ptr [ebp-30]
 00691445    fcomp       dword ptr ds:[69242C];315:Single
 0069144B    wait
 0069144C    fnstsw      al
 0069144E    sahf
>0069144F    jae         00691462
 00691451    xor         eax,eax
 00691453    mov         dword ptr [ebp-10],eax
 00691456    mov         dword ptr [ebp-0C],0BFF00000
>0069145D    jmp         006923D7
 00691462    fld         qword ptr [ebp-30]
 00691465    fcomp       dword ptr ds:[692430];360:Single
 0069146B    wait
 0069146C    fnstsw      al
 0069146E    sahf
>0069146F    ja          00691499
 00691471    fld         dword ptr ds:[692430];360:Single
 00691477    fsub        qword ptr [ebp-30]
 0069147A    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 00691480    fmulp       st(1),st
 00691482    add         esp,0FFFFFFF4
 00691485    fstp        tbyte ptr [esp]
 00691488    wait
 00691489    call        00454ACC
 0069148E    fchs
 00691490    fstp        qword ptr [ebp-10]
 00691493    wait
>00691494    jmp         006923D7
 00691499    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 0069149F    fmul        qword ptr [ebp-30]
 006914A2    add         esp,0FFFFFFF4
 006914A5    fstp        tbyte ptr [esp]
 006914A8    wait
 006914A9    call        Sin
 006914AE    fstp        qword ptr [ebp-10]
 006914B1    wait
>006914B2    jmp         006923D7
 006914B7    mov         eax,dword ptr [edx+28]
 006914BA    call        0068FCC8
 006914BF    fstp        qword ptr [ebp-30]
 006914C2    wait
 006914C3    fld         qword ptr [ebp-30]
 006914C6    fcomp       dword ptr ds:[69240C];0:Single
 006914CC    wait
 006914CD    fnstsw      al
 006914CF    sahf
>006914D0    jae         006914DF
 006914D2    xor         eax,eax
 006914D4    mov         dword ptr [ebp-10],eax
 006914D7    mov         dword ptr [ebp-0C],eax
>006914DA    jmp         006923D7
 006914DF    fld         qword ptr [ebp-30]
 006914E2    fcomp       dword ptr ds:[692410];45:Single
 006914E8    wait
 006914E9    fnstsw      al
 006914EB    sahf
>006914EC    jae         006914FF
 006914EE    xor         eax,eax
 006914F0    mov         dword ptr [ebp-10],eax
 006914F3    mov         dword ptr [ebp-0C],0BFF00000
>006914FA    jmp         006923D7
 006914FF    fld         qword ptr [ebp-30]
 00691502    fcomp       dword ptr ds:[692420];135:Single
 00691508    wait
 00691509    fnstsw      al
 0069150B    sahf
>0069150C    ja          00691534
 0069150E    fld         qword ptr [ebp-30]
 00691511    fsub        dword ptr ds:[692434];90:Single
 00691517    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 0069151D    fmulp       st(1),st
 0069151F    add         esp,0FFFFFFF4
 00691522    fstp        tbyte ptr [esp]
 00691525    wait
 00691526    call        00454ACC
 0069152B    fstp        qword ptr [ebp-10]
 0069152E    wait
>0069152F    jmp         006923D7
 00691534    fld         qword ptr [ebp-30]
 00691537    fcomp       dword ptr ds:[692428];225:Single
 0069153D    wait
 0069153E    fnstsw      al
 00691540    sahf
>00691541    jae         00691554
 00691543    xor         eax,eax
 00691545    mov         dword ptr [ebp-10],eax
 00691548    mov         dword ptr [ebp-0C],3FF00000
>0069154F    jmp         006923D7
 00691554    fld         qword ptr [ebp-30]
 00691557    fcomp       dword ptr ds:[69242C];315:Single
 0069155D    wait
 0069155E    fnstsw      al
 00691560    sahf
>00691561    jae         00691589
 00691563    fld         dword ptr ds:[692438];270:Single
 00691569    fsub        qword ptr [ebp-30]
 0069156C    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 00691572    fmulp       st(1),st
 00691574    add         esp,0FFFFFFF4
 00691577    fstp        tbyte ptr [esp]
 0069157A    wait
 0069157B    call        00454ACC
 00691580    fstp        qword ptr [ebp-10]
 00691583    wait
>00691584    jmp         006923D7
 00691589    fld         qword ptr [ebp-30]
 0069158C    fcomp       dword ptr ds:[692430];360:Single
 00691592    wait
 00691593    fnstsw      al
 00691595    sahf
>00691596    ja          006915A9
 00691598    xor         eax,eax
 0069159A    mov         dword ptr [ebp-10],eax
 0069159D    mov         dword ptr [ebp-0C],0BFF00000
>006915A4    jmp         006923D7
 006915A9    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 006915AF    fmul        qword ptr [ebp-30]
 006915B2    add         esp,0FFFFFFF4
 006915B5    fstp        tbyte ptr [esp]
 006915B8    wait
 006915B9    call        Cos
 006915BE    fstp        qword ptr [ebp-10]
 006915C1    wait
>006915C2    jmp         006923D7
 006915C7    mov         eax,dword ptr [edx+2C]
 006915CA    call        0068FCC8
 006915CF    fstp        qword ptr [ebp-30]
 006915D2    wait
 006915D3    fld         qword ptr [ebp-30]
 006915D6    fcomp       dword ptr ds:[69240C];0:Single
 006915DC    wait
 006915DD    fnstsw      al
 006915DF    sahf
>006915E0    jae         006915EF
 006915E2    xor         eax,eax
 006915E4    mov         dword ptr [ebp-10],eax
 006915E7    mov         dword ptr [ebp-0C],eax
>006915EA    jmp         006923D7
 006915EF    fld         qword ptr [ebp-30]
 006915F2    fcomp       dword ptr ds:[692410];45:Single
 006915F8    wait
 006915F9    fnstsw      al
 006915FB    sahf
>006915FC    jae         0069161C
 006915FE    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 00691604    fmul        qword ptr [ebp-30]
 00691607    add         esp,0FFFFFFF4
 0069160A    fstp        tbyte ptr [esp]
 0069160D    wait
 0069160E    call        00454ACC
 00691613    fstp        qword ptr [ebp-10]
 00691616    wait
>00691617    jmp         006923D7
 0069161C    fld         qword ptr [ebp-30]
 0069161F    fcomp       dword ptr ds:[692420];135:Single
 00691625    wait
 00691626    fnstsw      al
 00691628    sahf
>00691629    ja          0069163C
 0069162B    xor         eax,eax
 0069162D    mov         dword ptr [ebp-10],eax
 00691630    mov         dword ptr [ebp-0C],3FF00000
>00691637    jmp         006923D7
 0069163C    fld         qword ptr [ebp-30]
 0069163F    fcomp       dword ptr ds:[692424];180:Single
 00691645    wait
 00691646    fnstsw      al
 00691648    sahf
>00691649    jae         00691671
 0069164B    fld         dword ptr ds:[692424];180:Single
 00691651    fsub        qword ptr [ebp-30]
 00691654    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 0069165A    fmulp       st(1),st
 0069165C    add         esp,0FFFFFFF4
 0069165F    fstp        tbyte ptr [esp]
 00691662    wait
 00691663    call        00454ACC
 00691668    fstp        qword ptr [ebp-10]
 0069166B    wait
>0069166C    jmp         006923D7
 00691671    fld         qword ptr [ebp-30]
 00691674    fcomp       dword ptr ds:[692428];225:Single
 0069167A    wait
 0069167B    fnstsw      al
 0069167D    sahf
>0069167E    jae         006916A8
 00691680    fld         qword ptr [ebp-30]
 00691683    fsub        dword ptr ds:[692424];180:Single
 00691689    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 0069168F    fmulp       st(1),st
 00691691    add         esp,0FFFFFFF4
 00691694    fstp        tbyte ptr [esp]
 00691697    wait
 00691698    call        00454ACC
 0069169D    fchs
 0069169F    fstp        qword ptr [ebp-10]
 006916A2    wait
>006916A3    jmp         006923D7
 006916A8    fld         qword ptr [ebp-30]
 006916AB    fcomp       dword ptr ds:[69242C];315:Single
 006916B1    wait
 006916B2    fnstsw      al
 006916B4    sahf
>006916B5    jae         006916C8
 006916B7    xor         eax,eax
 006916B9    mov         dword ptr [ebp-10],eax
 006916BC    mov         dword ptr [ebp-0C],0BFF00000
>006916C3    jmp         006923D7
 006916C8    fld         qword ptr [ebp-30]
 006916CB    fcomp       dword ptr ds:[692430];360:Single
 006916D1    wait
 006916D2    fnstsw      al
 006916D4    sahf
>006916D5    ja          006916FF
 006916D7    fld         dword ptr ds:[692430];360:Single
 006916DD    fsub        qword ptr [ebp-30]
 006916E0    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 006916E6    fmulp       st(1),st
 006916E8    add         esp,0FFFFFFF4
 006916EB    fstp        tbyte ptr [esp]
 006916EE    wait
 006916EF    call        00454ACC
 006916F4    fchs
 006916F6    fstp        qword ptr [ebp-10]
 006916F9    wait
>006916FA    jmp         006923D7
 006916FF    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 00691705    fmul        qword ptr [ebp-30]
 00691708    add         esp,0FFFFFFF4
 0069170B    fstp        tbyte ptr [esp]
 0069170E    wait
 0069170F    call        Sin
 00691714    fstp        qword ptr [ebp-10]
 00691717    wait
>00691718    jmp         006923D7
 0069171D    mov         eax,dword ptr [edx+2C]
 00691720    call        0068FCC8
 00691725    fstp        qword ptr [ebp-30]
 00691728    wait
 00691729    fld         qword ptr [ebp-30]
 0069172C    fcomp       dword ptr ds:[69240C];0:Single
 00691732    wait
 00691733    fnstsw      al
 00691735    sahf
>00691736    jae         00691745
 00691738    xor         eax,eax
 0069173A    mov         dword ptr [ebp-10],eax
 0069173D    mov         dword ptr [ebp-0C],eax
>00691740    jmp         006923D7
 00691745    fld         qword ptr [ebp-30]
 00691748    fcomp       dword ptr ds:[692410];45:Single
 0069174E    wait
 0069174F    fnstsw      al
 00691751    sahf
>00691752    jae         00691765
 00691754    xor         eax,eax
 00691756    mov         dword ptr [ebp-10],eax
 00691759    mov         dword ptr [ebp-0C],0BFF00000
>00691760    jmp         006923D7
 00691765    fld         qword ptr [ebp-30]
 00691768    fcomp       dword ptr ds:[692420];135:Single
 0069176E    wait
 0069176F    fnstsw      al
 00691771    sahf
>00691772    ja          0069179A
 00691774    fld         qword ptr [ebp-30]
 00691777    fsub        dword ptr ds:[692434];90:Single
 0069177D    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 00691783    fmulp       st(1),st
 00691785    add         esp,0FFFFFFF4
 00691788    fstp        tbyte ptr [esp]
 0069178B    wait
 0069178C    call        00454ACC
 00691791    fstp        qword ptr [ebp-10]
 00691794    wait
>00691795    jmp         006923D7
 0069179A    fld         qword ptr [ebp-30]
 0069179D    fcomp       dword ptr ds:[692428];225:Single
 006917A3    wait
 006917A4    fnstsw      al
 006917A6    sahf
>006917A7    jae         006917BA
 006917A9    xor         eax,eax
 006917AB    mov         dword ptr [ebp-10],eax
 006917AE    mov         dword ptr [ebp-0C],3FF00000
>006917B5    jmp         006923D7
 006917BA    fld         qword ptr [ebp-30]
 006917BD    fcomp       dword ptr ds:[69242C];315:Single
 006917C3    wait
 006917C4    fnstsw      al
 006917C6    sahf
>006917C7    jae         006917EF
 006917C9    fld         dword ptr ds:[692438];270:Single
 006917CF    fsub        qword ptr [ebp-30]
 006917D2    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 006917D8    fmulp       st(1),st
 006917DA    add         esp,0FFFFFFF4
 006917DD    fstp        tbyte ptr [esp]
 006917E0    wait
 006917E1    call        00454ACC
 006917E6    fstp        qword ptr [ebp-10]
 006917E9    wait
>006917EA    jmp         006923D7
 006917EF    fld         qword ptr [ebp-30]
 006917F2    fcomp       dword ptr ds:[692430];360:Single
 006917F8    wait
 006917F9    fnstsw      al
 006917FB    sahf
>006917FC    ja          0069180F
 006917FE    xor         eax,eax
 00691800    mov         dword ptr [ebp-10],eax
 00691803    mov         dword ptr [ebp-0C],0BFF00000
>0069180A    jmp         006923D7
 0069180F    fld         tbyte ptr ds:[692414];0.0174532925199433:Extended
 00691815    fmul        qword ptr [ebp-30]
 00691818    add         esp,0FFFFFFF4
 0069181B    fstp        tbyte ptr [esp]
 0069181E    wait
 0069181F    call        Cos
 00691824    fstp        qword ptr [ebp-10]
 00691827    wait
>00691828    jmp         006923D7
 0069182D    mov         eax,dword ptr [edx+20]
 00691830    call        0068FCC8
 00691835    fstp        qword ptr [ebp-30]
 00691838    wait
 00691839    fld         qword ptr [ebp-30]
 0069183C    fcomp       dword ptr ds:[69240C];0:Single
 00691842    wait
 00691843    fnstsw      al
 00691845    sahf
>00691846    jb          00691857
 00691848    fld         qword ptr [ebp-30]
 0069184B    fcomp       dword ptr ds:[69243C];68:Single
 00691851    wait
 00691852    fnstsw      al
 00691854    sahf
>00691855    jbe         00691879
 00691857    fld         qword ptr [ebp-30]
 0069185A    fcomp       dword ptr ds:[692440];292:Single
 00691860    wait
 00691861    fnstsw      al
 00691863    sahf
>00691864    jb          00691875
 00691866    fld         qword ptr [ebp-30]
 00691869    fcomp       dword ptr ds:[692430];360:Single
 0069186F    wait
 00691870    fnstsw      al
 00691872    sahf
>00691873    jbe         00691879
 00691875    xor         eax,eax
>00691877    jmp         0069187B
 00691879    mov         al,1
 0069187B    call        00686074
 00691880    fstp        qword ptr [ebp-10]
 00691883    wait
>00691884    jmp         006923D7
 00691889    mov         eax,dword ptr [edx+20]
 0069188C    call        0068FCC8
 00691891    fstp        qword ptr [ebp-30]
 00691894    wait
 00691895    fld         qword ptr [ebp-30]
 00691898    fcomp       dword ptr ds:[69240C];0:Single
 0069189E    wait
 0069189F    fnstsw      al
 006918A1    sahf
 006918A2    setb        al
 006918A5    call        00686074
 006918AA    fstp        qword ptr [ebp-10]
 006918AD    wait
>006918AE    jmp         006923D7
 006918B3    mov         eax,dword ptr [edx+24]
 006918B6    call        0068FCC8
 006918BB    fstp        qword ptr [ebp-30]
 006918BE    wait
 006918BF    fld         qword ptr [ebp-30]
 006918C2    fcomp       dword ptr ds:[69240C];0:Single
 006918C8    wait
 006918C9    fnstsw      al
 006918CB    sahf
 006918CC    setb        al
 006918CF    call        00686074
 006918D4    fstp        qword ptr [ebp-10]
 006918D7    wait
>006918D8    jmp         006923D7
 006918DD    mov         eax,dword ptr [edx+28]
 006918E0    call        0068FCC8
 006918E5    fstp        qword ptr [ebp-30]
 006918E8    wait
 006918E9    fld         qword ptr [ebp-30]
 006918EC    fcomp       dword ptr ds:[69240C];0:Single
 006918F2    wait
 006918F3    fnstsw      al
 006918F5    sahf
 006918F6    setb        al
 006918F9    call        00686074
 006918FE    fstp        qword ptr [ebp-10]
 00691901    wait
>00691902    jmp         006923D7
 00691907    mov         eax,dword ptr [edx+2C]
 0069190A    call        0068FCC8
 0069190F    fstp        qword ptr [ebp-30]
 00691912    wait
 00691913    fld         qword ptr [ebp-30]
 00691916    fcomp       dword ptr ds:[69240C];0:Single
 0069191C    wait
 0069191D    fnstsw      al
 0069191F    sahf
 00691920    setb        al
 00691923    call        00686074
 00691928    fstp        qword ptr [ebp-10]
 0069192B    wait
>0069192C    jmp         006923D7
 00691931    mov         eax,dword ptr [edx+20]
 00691934    call        0068FCC8
 00691939    fstp        qword ptr [ebp-30]
 0069193C    wait
 0069193D    fld         qword ptr [ebp-30]
 00691940    fcomp       dword ptr ds:[692444];22:Single
 00691946    wait
 00691947    fnstsw      al
 00691949    sahf
>0069194A    jb          0069195B
 0069194C    fld         qword ptr [ebp-30]
 0069194F    fcomp       dword ptr ds:[692448];158:Single
 00691955    wait
 00691956    fnstsw      al
 00691958    sahf
>00691959    jbe         0069195F
 0069195B    xor         eax,eax
>0069195D    jmp         00691961
 0069195F    mov         al,1
 00691961    call        00686074
 00691966    fstp        qword ptr [ebp-10]
 00691969    wait
>0069196A    jmp         006923D7
 0069196F    mov         eax,dword ptr [edx+20]
 00691972    call        0068FCC8
 00691977    fstp        qword ptr [ebp-30]
 0069197A    wait
 0069197B    fld         qword ptr [ebp-30]
 0069197E    fcomp       dword ptr ds:[69244C];112:Single
 00691984    wait
 00691985    fnstsw      al
 00691987    sahf
>00691988    jb          00691999
 0069198A    fld         qword ptr [ebp-30]
 0069198D    fcomp       dword ptr ds:[692450];248:Single
 00691993    wait
 00691994    fnstsw      al
 00691996    sahf
>00691997    jbe         0069199D
 00691999    xor         eax,eax
>0069199B    jmp         0069199F
 0069199D    mov         al,1
 0069199F    call        00686074
 006919A4    fstp        qword ptr [ebp-10]
 006919A7    wait
>006919A8    jmp         006923D7
 006919AD    mov         eax,dword ptr [edx+20]
 006919B0    call        0068FCC8
 006919B5    fstp        qword ptr [ebp-30]
 006919B8    wait
 006919B9    fld         qword ptr [ebp-30]
 006919BC    fcomp       dword ptr ds:[692454];202:Single
 006919C2    wait
 006919C3    fnstsw      al
 006919C5    sahf
>006919C6    jb          006919D7
 006919C8    fld         qword ptr [ebp-30]
 006919CB    fcomp       dword ptr ds:[692458];338:Single
 006919D1    wait
 006919D2    fnstsw      al
 006919D4    sahf
>006919D5    jbe         006919DB
 006919D7    xor         eax,eax
>006919D9    jmp         006919DD
 006919DB    mov         al,1
 006919DD    call        00686074
 006919E2    fstp        qword ptr [ebp-10]
 006919E5    wait
>006919E6    jmp         006923D7
 006919EB    mov         eax,dword ptr [edx+24]
 006919EE    call        0068FCC8
 006919F3    fstp        qword ptr [ebp-30]
 006919F6    wait
 006919F7    fld         qword ptr [ebp-30]
 006919FA    fcomp       dword ptr ds:[69240C];0:Single
 00691A00    wait
 00691A01    fnstsw      al
 00691A03    sahf
>00691A04    jb          00691A15
 00691A06    fld         qword ptr [ebp-30]
 00691A09    fcomp       dword ptr ds:[69243C];68:Single
 00691A0F    wait
 00691A10    fnstsw      al
 00691A12    sahf
>00691A13    jbe         00691A37
 00691A15    fld         qword ptr [ebp-30]
 00691A18    fcomp       dword ptr ds:[692440];292:Single
 00691A1E    wait
 00691A1F    fnstsw      al
 00691A21    sahf
>00691A22    jb          00691A33
 00691A24    fld         qword ptr [ebp-30]
 00691A27    fcomp       dword ptr ds:[692430];360:Single
 00691A2D    wait
 00691A2E    fnstsw      al
 00691A30    sahf
>00691A31    jbe         00691A37
 00691A33    xor         eax,eax
>00691A35    jmp         00691A39
 00691A37    mov         al,1
 00691A39    call        00686074
 00691A3E    fstp        qword ptr [ebp-10]
 00691A41    wait
>00691A42    jmp         006923D7
 00691A47    mov         eax,dword ptr [edx+24]
 00691A4A    call        0068FCC8
 00691A4F    fstp        qword ptr [ebp-30]
 00691A52    wait
 00691A53    fld         qword ptr [ebp-30]
 00691A56    fcomp       dword ptr ds:[692444];22:Single
 00691A5C    wait
 00691A5D    fnstsw      al
 00691A5F    sahf
>00691A60    jb          00691A71
 00691A62    fld         qword ptr [ebp-30]
 00691A65    fcomp       dword ptr ds:[692448];158:Single
 00691A6B    wait
 00691A6C    fnstsw      al
 00691A6E    sahf
>00691A6F    jbe         00691A75
 00691A71    xor         eax,eax
>00691A73    jmp         00691A77
 00691A75    mov         al,1
 00691A77    call        00686074
 00691A7C    fstp        qword ptr [ebp-10]
 00691A7F    wait
>00691A80    jmp         006923D7
 00691A85    mov         eax,dword ptr [edx+24]
 00691A88    call        0068FCC8
 00691A8D    fstp        qword ptr [ebp-30]
 00691A90    wait
 00691A91    fld         qword ptr [ebp-30]
 00691A94    fcomp       dword ptr ds:[69244C];112:Single
 00691A9A    wait
 00691A9B    fnstsw      al
 00691A9D    sahf
>00691A9E    jb          00691AAF
 00691AA0    fld         qword ptr [ebp-30]
 00691AA3    fcomp       dword ptr ds:[692450];248:Single
 00691AA9    wait
 00691AAA    fnstsw      al
 00691AAC    sahf
>00691AAD    jbe         00691AB3
 00691AAF    xor         eax,eax
>00691AB1    jmp         00691AB5
 00691AB3    mov         al,1
 00691AB5    call        00686074
 00691ABA    fstp        qword ptr [ebp-10]
 00691ABD    wait
>00691ABE    jmp         006923D7
 00691AC3    mov         eax,dword ptr [edx+24]
 00691AC6    call        0068FCC8
 00691ACB    fstp        qword ptr [ebp-30]
 00691ACE    wait
 00691ACF    fld         qword ptr [ebp-30]
 00691AD2    fcomp       dword ptr ds:[692454];202:Single
 00691AD8    wait
 00691AD9    fnstsw      al
 00691ADB    sahf
>00691ADC    jb          00691AED
 00691ADE    fld         qword ptr [ebp-30]
 00691AE1    fcomp       dword ptr ds:[692458];338:Single
 00691AE7    wait
 00691AE8    fnstsw      al
 00691AEA    sahf
>00691AEB    jbe         00691AF1
 00691AED    xor         eax,eax
>00691AEF    jmp         00691AF3
 00691AF1    mov         al,1
 00691AF3    call        00686074
 00691AF8    fstp        qword ptr [ebp-10]
 00691AFB    wait
>00691AFC    jmp         006923D7
 00691B01    mov         eax,dword ptr [edx+28]
 00691B04    call        0068FCC8
 00691B09    fstp        qword ptr [ebp-30]
 00691B0C    wait
 00691B0D    fld         qword ptr [ebp-30]
 00691B10    fcomp       dword ptr ds:[69240C];0:Single
 00691B16    wait
 00691B17    fnstsw      al
 00691B19    sahf
>00691B1A    jb          00691B2B
 00691B1C    fld         qword ptr [ebp-30]
 00691B1F    fcomp       dword ptr ds:[69243C];68:Single
 00691B25    wait
 00691B26    fnstsw      al
 00691B28    sahf
>00691B29    jbe         00691B4D
 00691B2B    fld         qword ptr [ebp-30]
 00691B2E    fcomp       dword ptr ds:[692440];292:Single
 00691B34    wait
 00691B35    fnstsw      al
 00691B37    sahf
>00691B38    jb          00691B49
 00691B3A    fld         qword ptr [ebp-30]
 00691B3D    fcomp       dword ptr ds:[692430];360:Single
 00691B43    wait
 00691B44    fnstsw      al
 00691B46    sahf
>00691B47    jbe         00691B4D
 00691B49    xor         eax,eax
>00691B4B    jmp         00691B4F
 00691B4D    mov         al,1
 00691B4F    call        00686074
 00691B54    fstp        qword ptr [ebp-10]
 00691B57    wait
>00691B58    jmp         006923D7
 00691B5D    mov         eax,dword ptr [edx+28]
 00691B60    call        0068FCC8
 00691B65    fstp        qword ptr [ebp-30]
 00691B68    wait
 00691B69    fld         qword ptr [ebp-30]
 00691B6C    fcomp       dword ptr ds:[692444];22:Single
 00691B72    wait
 00691B73    fnstsw      al
 00691B75    sahf
>00691B76    jb          00691B87
 00691B78    fld         qword ptr [ebp-30]
 00691B7B    fcomp       dword ptr ds:[692448];158:Single
 00691B81    wait
 00691B82    fnstsw      al
 00691B84    sahf
>00691B85    jbe         00691B8B
 00691B87    xor         eax,eax
>00691B89    jmp         00691B8D
 00691B8B    mov         al,1
 00691B8D    call        00686074
 00691B92    fstp        qword ptr [ebp-10]
 00691B95    wait
>00691B96    jmp         006923D7
 00691B9B    mov         eax,dword ptr [edx+28]
 00691B9E    call        0068FCC8
 00691BA3    fstp        qword ptr [ebp-30]
 00691BA6    wait
 00691BA7    fld         qword ptr [ebp-30]
 00691BAA    fcomp       dword ptr ds:[69244C];112:Single
 00691BB0    wait
 00691BB1    fnstsw      al
 00691BB3    sahf
>00691BB4    jb          00691BC5
 00691BB6    fld         qword ptr [ebp-30]
 00691BB9    fcomp       dword ptr ds:[692450];248:Single
 00691BBF    wait
 00691BC0    fnstsw      al
 00691BC2    sahf
>00691BC3    jbe         00691BC9
 00691BC5    xor         eax,eax
>00691BC7    jmp         00691BCB
 00691BC9    mov         al,1
 00691BCB    call        00686074
 00691BD0    fstp        qword ptr [ebp-10]
 00691BD3    wait
>00691BD4    jmp         006923D7
 00691BD9    mov         eax,dword ptr [edx+28]
 00691BDC    call        0068FCC8
 00691BE1    fstp        qword ptr [ebp-30]
 00691BE4    wait
 00691BE5    fld         qword ptr [ebp-30]
 00691BE8    fcomp       dword ptr ds:[692454];202:Single
 00691BEE    wait
 00691BEF    fnstsw      al
 00691BF1    sahf
>00691BF2    jb          00691C03
 00691BF4    fld         qword ptr [ebp-30]
 00691BF7    fcomp       dword ptr ds:[692458];338:Single
 00691BFD    wait
 00691BFE    fnstsw      al
 00691C00    sahf
>00691C01    jbe         00691C07
 00691C03    xor         eax,eax
>00691C05    jmp         00691C09
 00691C07    mov         al,1
 00691C09    call        00686074
 00691C0E    fstp        qword ptr [ebp-10]
 00691C11    wait
>00691C12    jmp         006923D7
 00691C17    mov         eax,dword ptr [edx+2C]
 00691C1A    call        0068FCC8
 00691C1F    fstp        qword ptr [ebp-30]
 00691C22    wait
 00691C23    fld         qword ptr [ebp-30]
 00691C26    fcomp       dword ptr ds:[69240C];0:Single
 00691C2C    wait
 00691C2D    fnstsw      al
 00691C2F    sahf
>00691C30    jb          00691C41
 00691C32    fld         qword ptr [ebp-30]
 00691C35    fcomp       dword ptr ds:[69243C];68:Single
 00691C3B    wait
 00691C3C    fnstsw      al
 00691C3E    sahf
>00691C3F    jbe         00691C63
 00691C41    fld         qword ptr [ebp-30]
 00691C44    fcomp       dword ptr ds:[692440];292:Single
 00691C4A    wait
 00691C4B    fnstsw      al
 00691C4D    sahf
>00691C4E    jb          00691C5F
 00691C50    fld         qword ptr [ebp-30]
 00691C53    fcomp       dword ptr ds:[692430];360:Single
 00691C59    wait
 00691C5A    fnstsw      al
 00691C5C    sahf
>00691C5D    jbe         00691C63
 00691C5F    xor         eax,eax
>00691C61    jmp         00691C65
 00691C63    mov         al,1
 00691C65    call        00686074
 00691C6A    fstp        qword ptr [ebp-10]
 00691C6D    wait
>00691C6E    jmp         006923D7
 00691C73    mov         eax,dword ptr [edx+2C]
 00691C76    call        0068FCC8
 00691C7B    fstp        qword ptr [ebp-30]
 00691C7E    wait
 00691C7F    fld         qword ptr [ebp-30]
 00691C82    fcomp       dword ptr ds:[692444];22:Single
 00691C88    wait
 00691C89    fnstsw      al
 00691C8B    sahf
>00691C8C    jb          00691C9D
 00691C8E    fld         qword ptr [ebp-30]
 00691C91    fcomp       dword ptr ds:[692448];158:Single
 00691C97    wait
 00691C98    fnstsw      al
 00691C9A    sahf
>00691C9B    jbe         00691CA1
 00691C9D    xor         eax,eax
>00691C9F    jmp         00691CA3
 00691CA1    mov         al,1
 00691CA3    call        00686074
 00691CA8    fstp        qword ptr [ebp-10]
 00691CAB    wait
>00691CAC    jmp         006923D7
 00691CB1    mov         eax,dword ptr [edx+2C]
 00691CB4    call        0068FCC8
 00691CB9    fstp        qword ptr [ebp-30]
 00691CBC    wait
 00691CBD    fld         qword ptr [ebp-30]
 00691CC0    fcomp       dword ptr ds:[69244C];112:Single
 00691CC6    wait
 00691CC7    fnstsw      al
 00691CC9    sahf
>00691CCA    jb          00691CDB
 00691CCC    fld         qword ptr [ebp-30]
 00691CCF    fcomp       dword ptr ds:[692450];248:Single
 00691CD5    wait
 00691CD6    fnstsw      al
 00691CD8    sahf
>00691CD9    jbe         00691CDF
 00691CDB    xor         eax,eax
>00691CDD    jmp         00691CE1
 00691CDF    mov         al,1
 00691CE1    call        00686074
 00691CE6    fstp        qword ptr [ebp-10]
 00691CE9    wait
>00691CEA    jmp         006923D7
 00691CEF    mov         eax,dword ptr [edx+2C]
 00691CF2    call        0068FCC8
 00691CF7    fstp        qword ptr [ebp-30]
 00691CFA    wait
 00691CFB    fld         qword ptr [ebp-30]
 00691CFE    fcomp       dword ptr ds:[692454];202:Single
 00691D04    wait
 00691D05    fnstsw      al
 00691D07    sahf
>00691D08    jb          00691D19
 00691D0A    fld         qword ptr [ebp-30]
 00691D0D    fcomp       dword ptr ds:[692458];338:Single
 00691D13    wait
 00691D14    fnstsw      al
 00691D16    sahf
>00691D17    jbe         00691D1D
 00691D19    xor         eax,eax
>00691D1B    jmp         00691D1F
 00691D1D    mov         al,1
 00691D1F    call        00686074
 00691D24    fstp        qword ptr [ebp-10]
 00691D27    wait
>00691D28    jmp         006923D7
 00691D2D    mov         eax,dword ptr [edx+0B0]
 00691D33    test        eax,eax
>00691D35    jne         00691D48
 00691D37    xor         eax,eax
 00691D39    mov         dword ptr [ebp-10],eax
 00691D3C    mov         dword ptr [ebp-0C],0BFF00000
>00691D43    jmp         006923D7
 00691D48    mov         dword ptr [ebp-60],eax
 00691D4B    fild        dword ptr [ebp-60]
 00691D4E    fsub        dword ptr ds:[692408];32767.5:Single
 00691D54    fdiv        dword ptr ds:[692408];32767.5:Single
 00691D5A    fstp        qword ptr [ebp-10]
 00691D5D    wait
>00691D5E    jmp         006923D7
 00691D63    mov         eax,dword ptr [edx+0B4]
 00691D69    test        eax,eax
>00691D6B    jne         00691D7E
 00691D6D    xor         eax,eax
 00691D6F    mov         dword ptr [ebp-10],eax
 00691D72    mov         dword ptr [ebp-0C],0BFF00000
>00691D79    jmp         006923D7
 00691D7E    mov         dword ptr [ebp-60],eax
 00691D81    fild        dword ptr [ebp-60]
 00691D84    fsub        dword ptr ds:[692408];32767.5:Single
 00691D8A    fdiv        dword ptr ds:[692408];32767.5:Single
 00691D90    fstp        qword ptr [ebp-10]
 00691D93    wait
>00691D94    jmp         006923D7
 00691D99    mov         eax,dword ptr [edx+0B8]
 00691D9F    test        eax,eax
>00691DA1    jne         00691DB4
 00691DA3    xor         eax,eax
 00691DA5    mov         dword ptr [ebp-10],eax
 00691DA8    mov         dword ptr [ebp-0C],0BFF00000
>00691DAF    jmp         006923D7
 00691DB4    mov         dword ptr [ebp-60],eax
 00691DB7    fild        dword ptr [ebp-60]
 00691DBA    fsub        dword ptr ds:[692408];32767.5:Single
 00691DC0    fdiv        dword ptr ds:[692408];32767.5:Single
 00691DC6    fstp        qword ptr [ebp-10]
 00691DC9    wait
>00691DCA    jmp         006923D7
 00691DCF    mov         eax,dword ptr [edx+0BC]
 00691DD5    test        eax,eax
>00691DD7    jne         00691DEA
 00691DD9    xor         eax,eax
 00691DDB    mov         dword ptr [ebp-10],eax
 00691DDE    mov         dword ptr [ebp-0C],0BFF00000
>00691DE5    jmp         006923D7
 00691DEA    mov         dword ptr [ebp-60],eax
 00691DED    fild        dword ptr [ebp-60]
 00691DF0    fsub        dword ptr ds:[692408];32767.5:Single
 00691DF6    fdiv        dword ptr ds:[692408];32767.5:Single
 00691DFC    fstp        qword ptr [ebp-10]
 00691DFF    wait
>00691E00    jmp         006923D7
 00691E05    mov         eax,dword ptr [edx+0C0]
 00691E0B    test        eax,eax
>00691E0D    jne         00691E20
 00691E0F    xor         eax,eax
 00691E11    mov         dword ptr [ebp-10],eax
 00691E14    mov         dword ptr [ebp-0C],0BFF00000
>00691E1B    jmp         006923D7
 00691E20    mov         dword ptr [ebp-60],eax
 00691E23    fild        dword ptr [ebp-60]
 00691E26    fsub        dword ptr ds:[692408];32767.5:Single
 00691E2C    fdiv        dword ptr ds:[692408];32767.5:Single
 00691E32    fstp        qword ptr [ebp-10]
 00691E35    wait
>00691E36    jmp         006923D7
 00691E3B    mov         eax,dword ptr [edx+0C4]
 00691E41    test        eax,eax
>00691E43    jne         00691E56
 00691E45    xor         eax,eax
 00691E47    mov         dword ptr [ebp-10],eax
 00691E4A    mov         dword ptr [ebp-0C],0BFF00000
>00691E51    jmp         006923D7
 00691E56    mov         dword ptr [ebp-60],eax
 00691E59    fild        dword ptr [ebp-60]
 00691E5C    fsub        dword ptr ds:[692408];32767.5:Single
 00691E62    fdiv        dword ptr ds:[692408];32767.5:Single
 00691E68    fstp        qword ptr [ebp-10]
 00691E6B    wait
>00691E6C    jmp         006923D7
 00691E71    mov         eax,dword ptr [edx+0C8]
 00691E77    test        eax,eax
>00691E79    jne         00691E8C
 00691E7B    xor         eax,eax
 00691E7D    mov         dword ptr [ebp-10],eax
 00691E80    mov         dword ptr [ebp-0C],0BFF00000
>00691E87    jmp         006923D7
 00691E8C    mov         dword ptr [ebp-60],eax
 00691E8F    fild        dword ptr [ebp-60]
 00691E92    fsub        dword ptr ds:[692408];32767.5:Single
 00691E98    fdiv        dword ptr ds:[692408];32767.5:Single
 00691E9E    fstp        qword ptr [ebp-10]
 00691EA1    wait
>00691EA2    jmp         006923D7
 00691EA7    mov         eax,dword ptr [edx+0CC]
 00691EAD    test        eax,eax
>00691EAF    jne         00691EC2
 00691EB1    xor         eax,eax
 00691EB3    mov         dword ptr [ebp-10],eax
 00691EB6    mov         dword ptr [ebp-0C],0BFF00000
>00691EBD    jmp         006923D7
 00691EC2    mov         dword ptr [ebp-60],eax
 00691EC5    fild        dword ptr [ebp-60]
 00691EC8    fsub        dword ptr ds:[692408];32767.5:Single
 00691ECE    fdiv        dword ptr ds:[692408];32767.5:Single
 00691ED4    fstp        qword ptr [ebp-10]
 00691ED7    wait
>00691ED8    jmp         006923D7
 00691EDD    call        00693D08
 00691EE2    test        al,al
>00691EE4    je          00691EFB
 00691EE6    cmp         dword ptr [ebx+18],1;TJoystickValue........................................................
>00691EEA    jl          00691EFB
 00691EEC    mov         eax,[0081ED08];gvar_0081ED08:?
 00691EF1    call        @DynArrayLength
 00691EF6    cmp         eax,dword ptr [ebx+18];TJoystickValue......................................................
>00691EF9    jge         00691F08
 00691EFB    xor         eax,eax
 00691EFD    mov         dword ptr [ebp-10],eax
 00691F00    mov         dword ptr [ebp-0C],eax
>00691F03    jmp         006923D7
 00691F08    mov         dword ptr [ebp-5C],2C
 00691F0F    lea         eax,[ebp-5C]
 00691F12    push        eax
 00691F13    mov         eax,[0081ED08];gvar_0081ED08:?
 00691F18    mov         edx,dword ptr [ebx+18];TJoystickValue......................................................
 00691F1B    mov         eax,dword ptr [eax+edx*4-4]
 00691F1F    push        eax
 00691F20    mov         eax,dword ptr [eax]
 00691F22    call        dword ptr [eax+0C]
 00691F25    mov         edx,eax
 00691F27    mov         eax,692468;'GetCapabilities'
 00691F2C    call        005FF2AC
 00691F31    mov         eax,dword ptr [ebx+20];TJoystickValue................................Item:Integer
 00691F34    add         eax,0FFFFFF6B
 00691F39    cmp         eax,1F
>00691F3C    ja          006922F3
 00691F42    jmp         dword ptr [eax*4+691F49]
 00691F42    dd          00691FC9
 00691F42    dd          00691FE0
 00691F42    dd          00691FF7
 00691F42    dd          0069200E
 00691F42    dd          0069202B
 00691F42    dd          00692048
 00691F42    dd          0069205F
 00691F42    dd          00692076
 00691F42    dd          006920A9
 00691F42    dd          0069208D
 00691F42    dd          0069218B
 00691F42    dd          006921A3
 00691F42    dd          006921BB
 00691F42    dd          006921D3
 00691F42    dd          006921EB
 00691F42    dd          00692203
 00691F42    dd          0069221B
 00691F42    dd          00692233
 00691F42    dd          0069224B
 00691F42    dd          00692263
 00691F42    dd          0069227B
 00691F42    dd          00692293
 00691F42    dd          006922AB
 00691F42    dd          006922C3
 00691F42    dd          006922DB
 00691F42    dd          00692173
 00691F42    dd          006920C8
 00691F42    dd          006920E7
 00691F42    dd          00692103
 00691F42    dd          0069211F
 00691F42    dd          0069213B
 00691F42    dd          00692157
 00691FC9    mov         eax,dword ptr [ebp-50]
 00691FCC    mov         dword ptr [ebp-68],eax
 00691FCF    xor         eax,eax
 00691FD1    mov         dword ptr [ebp-64],eax
 00691FD4    fild        qword ptr [ebp-68]
 00691FD7    fstp        qword ptr [ebp-10]
 00691FDA    wait
>00691FDB    jmp         006923D7
 00691FE0    mov         eax,dword ptr [ebp-4C]
 00691FE3    mov         dword ptr [ebp-68],eax
 00691FE6    xor         eax,eax
 00691FE8    mov         dword ptr [ebp-64],eax
 00691FEB    fild        qword ptr [ebp-68]
 00691FEE    fstp        qword ptr [ebp-10]
 00691FF1    wait
>00691FF2    jmp         006923D7
 00691FF7    mov         eax,dword ptr [ebp-48]
 00691FFA    mov         dword ptr [ebp-68],eax
 00691FFD    xor         eax,eax
 00691FFF    mov         dword ptr [ebp-64],eax
 00692002    fild        qword ptr [ebp-68]
 00692005    fstp        qword ptr [ebp-10]
 00692008    wait
>00692009    jmp         006923D7
 0069200E    mov         eax,dword ptr [ebp-44]
 00692011    mov         dword ptr [ebp-68],eax
 00692014    xor         eax,eax
 00692016    mov         dword ptr [ebp-64],eax
 00692019    fild        qword ptr [ebp-68]
 0069201C    fdiv        dword ptr ds:[692488];1000000:Single
 00692022    fstp        qword ptr [ebp-10]
 00692025    wait
>00692026    jmp         006923D7
 0069202B    mov         eax,dword ptr [ebp-40]
 0069202E    mov         dword ptr [ebp-68],eax
 00692031    xor         eax,eax
 00692033    mov         dword ptr [ebp-64],eax
 00692036    fild        qword ptr [ebp-68]
 00692039    fdiv        dword ptr ds:[692488];1000000:Single
 0069203F    fstp        qword ptr [ebp-10]
 00692042    wait
>00692043    jmp         006923D7
 00692048    mov         eax,dword ptr [ebp-3C]
 0069204B    mov         dword ptr [ebp-68],eax
 0069204E    xor         eax,eax
 00692050    mov         dword ptr [ebp-64],eax
 00692053    fild        qword ptr [ebp-68]
 00692056    fstp        qword ptr [ebp-10]
 00692059    wait
>0069205A    jmp         006923D7
 0069205F    mov         eax,dword ptr [ebp-38]
 00692062    mov         dword ptr [ebp-68],eax
 00692065    xor         eax,eax
 00692067    mov         dword ptr [ebp-64],eax
 0069206A    fild        qword ptr [ebp-68]
 0069206D    fstp        qword ptr [ebp-10]
 00692070    wait
>00692071    jmp         006923D7
 00692076    mov         eax,dword ptr [ebp-34]
 00692079    mov         dword ptr [ebp-68],eax
 0069207C    xor         eax,eax
 0069207E    mov         dword ptr [ebp-64],eax
 00692081    fild        qword ptr [ebp-68]
 00692084    fstp        qword ptr [ebp-10]
 00692087    wait
>00692088    jmp         006923D7
 0069208D    mov         eax,dword ptr [ebp-54]
 00692090    and         eax,0FF
 00692095    mov         dword ptr [ebp-68],eax
 00692098    xor         eax,eax
 0069209A    mov         dword ptr [ebp-64],eax
 0069209D    fild        qword ptr [ebp-68]
 006920A0    fstp        qword ptr [ebp-10]
 006920A3    wait
>006920A4    jmp         006923D7
 006920A9    mov         eax,dword ptr [ebp-54]
 006920AC    shr         eax,8
 006920AF    and         eax,0FF
 006920B4    mov         dword ptr [ebp-68],eax
 006920B7    xor         eax,eax
 006920B9    mov         dword ptr [ebp-64],eax
 006920BC    fild        qword ptr [ebp-68]
 006920BF    fstp        qword ptr [ebp-10]
 006920C2    wait
>006920C3    jmp         006923D7
 006920C8    mov         eax,dword ptr [ebp-54]
 006920CB    shr         eax,8
 006920CE    and         eax,0FF
 006920D3    cmp         eax,1
 006920D6    sete        al
 006920D9    call        00686074
 006920DE    fstp        qword ptr [ebp-10]
 006920E1    wait
>006920E2    jmp         006923D7
 006920E7    mov         eax,dword ptr [ebp-54]
 006920EA    and         eax,0FF
 006920EF    cmp         eax,14
 006920F2    sete        al
 006920F5    call        00686074
 006920FA    fstp        qword ptr [ebp-10]
 006920FD    wait
>006920FE    jmp         006923D7
 00692103    mov         eax,dword ptr [ebp-54]
 00692106    and         eax,0FF
 0069210B    cmp         eax,15
 0069210E    sete        al
 00692111    call        00686074
 00692116    fstp        qword ptr [ebp-10]
 00692119    wait
>0069211A    jmp         006923D7
 0069211F    mov         eax,dword ptr [ebp-54]
 00692122    and         eax,0FF
 00692127    cmp         eax,16
 0069212A    sete        al
 0069212D    call        00686074
 00692132    fstp        qword ptr [ebp-10]
 00692135    wait
>00692136    jmp         006923D7
 0069213B    mov         eax,dword ptr [ebp-54]
 0069213E    and         eax,0FF
 00692143    cmp         eax,17
 00692146    sete        al
 00692149    call        00686074
 0069214E    fstp        qword ptr [ebp-10]
 00692151    wait
>00692152    jmp         006923D7
 00692157    mov         eax,dword ptr [ebp-54]
 0069215A    and         eax,0FF
 0069215F    cmp         eax,18
 00692162    sete        al
 00692165    call        00686074
 0069216A    fstp        qword ptr [ebp-10]
 0069216D    wait
>0069216E    jmp         006923D7
 00692173    test        dword ptr [ebp-54],10000
 0069217A    seta        al
 0069217D    call        00686074
 00692182    fstp        qword ptr [ebp-10]
 00692185    wait
>00692186    jmp         006923D7
 0069218B    test        dword ptr [ebp-58],10000
 00692192    seta        al
 00692195    call        00686074
 0069219A    fstp        qword ptr [ebp-10]
 0069219D    wait
>0069219E    jmp         006923D7
 006921A3    test        dword ptr [ebp-58],1
 006921AA    seta        al
 006921AD    call        00686074
 006921B2    fstp        qword ptr [ebp-10]
 006921B5    wait
>006921B6    jmp         006923D7
 006921BB    test        dword ptr [ebp-58],4000
 006921C2    seta        al
 006921C5    call        00686074
 006921CA    fstp        qword ptr [ebp-10]
 006921CD    wait
>006921CE    jmp         006923D7
 006921D3    test        dword ptr [ebp-58],4
 006921DA    seta        al
 006921DD    call        00686074
 006921E2    fstp        qword ptr [ebp-10]
 006921E5    wait
>006921E6    jmp         006923D7
 006921EB    test        dword ptr [ebp-58],100
 006921F2    seta        al
 006921F5    call        00686074
 006921FA    fstp        qword ptr [ebp-10]
 006921FD    wait
>006921FE    jmp         006923D7
 00692203    test        dword ptr [ebp-58],400
 0069220A    seta        al
 0069220D    call        00686074
 00692212    fstp        qword ptr [ebp-10]
 00692215    wait
>00692216    jmp         006923D7
 0069221B    test        dword ptr [ebp-58],200
 00692222    seta        al
 00692225    call        00686074
 0069222A    fstp        qword ptr [ebp-10]
 0069222D    wait
>0069222E    jmp         006923D7
 00692233    test        dword ptr [ebp-58],40000
 0069223A    seta        al
 0069223D    call        00686074
 00692242    fstp        qword ptr [ebp-10]
 00692245    wait
>00692246    jmp         006923D7
 0069224B    test        dword ptr [ebp-58],20000
 00692252    seta        al
 00692255    call        00686074
 0069225A    fstp        qword ptr [ebp-10]
 0069225D    wait
>0069225E    jmp         006923D7
 00692263    test        dword ptr [ebp-58],8
 0069226A    seta        al
 0069226D    call        00686074
 00692272    fstp        qword ptr [ebp-10]
 00692275    wait
>00692276    jmp         006923D7
 0069227B    test        dword ptr [ebp-58],2
 00692282    seta        al
 00692285    call        00686074
 0069228A    fstp        qword ptr [ebp-10]
 0069228D    wait
>0069228E    jmp         006923D7
 00692293    test        dword ptr [ebp-58],1000
 0069229A    seta        al
 0069229D    call        00686074
 006922A2    fstp        qword ptr [ebp-10]
 006922A5    wait
>006922A6    jmp         006923D7
 006922AB    test        dword ptr [ebp-58],2000
 006922B2    seta        al
 006922B5    call        00686074
 006922BA    fstp        qword ptr [ebp-10]
 006922BD    wait
>006922BE    jmp         006923D7
 006922C3    test        dword ptr [ebp-58],800
 006922CA    seta        al
 006922CD    call        00686074
 006922D2    fstp        qword ptr [ebp-10]
 006922D5    wait
>006922D6    jmp         006923D7
 006922DB    test        dword ptr [ebp-58],8000
 006922E2    seta        al
 006922E5    call        00686074
 006922EA    fstp        qword ptr [ebp-10]
 006922ED    wait
>006922EE    jmp         006923D7
 006922F3    xor         eax,eax
 006922F5    mov         dword ptr [ebp-10],eax
 006922F8    mov         dword ptr [ebp-0C],eax
>006922FB    jmp         006923D7
 00692300    xor         eax,eax
 00692302    mov         dword ptr [ebp-10],eax
 00692305    mov         dword ptr [ebp-0C],eax
>00692308    jmp         006923D7
 0069230D    xor         eax,eax
 0069230F    mov         dword ptr [ebp-10],eax
 00692312    mov         dword ptr [ebp-0C],eax
>00692315    jmp         006923D7
 0069231A    lea         edx,[ebp-6C]
 0069231D    mov         eax,dword ptr [ebx+18];TJoystickValue......................................................
 00692320    call        00694224
 00692325    mov         eax,dword ptr [ebp-6C]
 00692328    mov         edx,692498;'PPJoy Virtual joystick '
 0069232D    call        004F9A58
 00692332    call        00686074
 00692337    fstp        qword ptr [ebp-10]
 0069233A    wait
>0069233B    jmp         006923D7
 00692340    lea         edx,[ebp-4]
 00692343    mov         eax,dword ptr [ebx+18];TJoystickValue......................................................
 00692346    call        00694224
 0069234B    lea         eax,[ebp-4]
 0069234E    mov         edx,692498;'PPJoy Virtual joystick '
 00692353    call        004F9BD0
 00692358    test        al,al
>0069235A    jne         00692366
 0069235C    xor         eax,eax
 0069235E    mov         dword ptr [ebp-10],eax
 00692361    mov         dword ptr [ebp-0C],eax
>00692364    jmp         006923D7
 00692366    lea         eax,[ebp-4]
 00692369    call        004F9D00
 0069236E    mov         dword ptr [ebp-60],eax
 00692371    fild        dword ptr [ebp-60]
 00692374    fstp        qword ptr [ebp-10]
 00692377    wait
 00692378    fld         qword ptr [ebp-10]
 0069237B    fcomp       dword ptr ds:[69240C];0:Single
 00692381    wait
 00692382    fnstsw      al
 00692384    sahf
>00692385    jae         006923D7
 00692387    xor         eax,eax
 00692389    mov         dword ptr [ebp-10],eax
 0069238C    mov         dword ptr [ebp-0C],eax
>0069238F    jmp         006923D7
 00692391    mov         eax,dword ptr [ebx+18];TJoystickValue......................................................
 00692394    call        0069439C
 00692399    mov         dword ptr [ebp-60],eax
 0069239C    fild        dword ptr [ebp-60]
 0069239F    fstp        qword ptr [ebp-10]
 006923A2    wait
>006923A3    jmp         006923D7
 006923A5    mov         eax,dword ptr [ebx+18];TJoystickValue......................................................
 006923A8    call        006943CC
 006923AD    mov         dword ptr [ebp-60],eax
 006923B0    fild        dword ptr [ebp-60]
 006923B3    fstp        qword ptr [ebp-10]
 006923B6    wait
>006923B7    jmp         006923D7
 006923B9    mov         eax,[0081ED08];gvar_0081ED08:?
 006923BE    call        @DynArrayLength
 006923C3    mov         dword ptr [ebp-60],eax
 006923C6    fild        dword ptr [ebp-60]
 006923C9    fstp        qword ptr [ebp-10]
 006923CC    wait
>006923CD    jmp         006923D7
 006923CF    xor         eax,eax
 006923D1    mov         dword ptr [ebp-10],eax
 006923D4    mov         dword ptr [ebp-0C],eax
 006923D7    xor         eax,eax
 006923D9    pop         edx
 006923DA    pop         ecx
 006923DB    pop         ecx
 006923DC    mov         dword ptr fs:[eax],edx
 006923DF    push        6923FC
 006923E4    lea         eax,[ebp-6C]
 006923E7    call        @UStrClr
 006923EC    lea         eax,[ebp-4]
 006923EF    call        @UStrClr
 006923F4    ret
>006923F5    jmp         @HandleFinally
>006923FA    jmp         006923E4
 006923FC    fld         qword ptr [ebp-10]
 006923FF    pop         esi
 00692400    pop         ebx
 00692401    mov         esp,ebp
 00692403    pop         ebp
 00692404    ret
*}
end;

//006924C8
procedure TJoystickValue.GetVector(x:Double; y:Double; z:Double);
begin
{*
 006924C8    push        ebp
 006924C9    mov         ebp,esp
 006924CB    add         esp,0FFFFFFEC
 006924CE    push        ebx
 006924CF    push        esi
 006924D0    push        edi
 006924D1    mov         dword ptr [ebp-4],ecx
 006924D4    mov         esi,edx
 006924D6    mov         ebx,eax
 006924D8    mov         eax,ebx
 006924DA    mov         edx,dword ptr [eax]
 006924DC    call        dword ptr [edx+44];TJoystickValue.GetDataType
 006924DF    cmp         al,5
>006924E1    je          006924F8
 006924E3    mov         eax,dword ptr [ebp+8]
 006924E6    push        eax
 006924E7    mov         ecx,dword ptr [ebp-4]
 006924EA    mov         edx,esi
 006924EC    mov         eax,ebx
 006924EE    call        TExpression.GetVector
>006924F3    jmp         00693218
 006924F8    mov         edi,dword ptr [ebx+18];TJoystickValue......................................................
 006924FB    test        edi,edi
>006924FD    jle         0069250D
 006924FF    mov         eax,[0081ED08];gvar_0081ED08:?
 00692504    call        @DynArrayLength
 00692509    cmp         edi,eax
>0069250B    jle         00692514
 0069250D    mov         eax,[0081ED10];gvar_0081ED10:?
>00692512    jmp         00692525
 00692514    imul        eax,dword ptr [ebx+18],22;TJoystickValue...................................................
 00692518    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 0069251E    lea         eax,[edx+eax*8-110]
 00692525    mov         edx,dword ptr [ebx+20];TJoystickValue.................................Item:Integer
 00692528    add         edx,0FFFFFEFC
 0069252E    cmp         edx,2F
>00692531    ja          006931FD
 00692537    movzx       edx,byte ptr [edx+692545]
 0069253E    jmp         dword ptr [edx*4+692575]
 0069253E    db          1
 0069253E    db          9
 0069253E    db          8
 0069253E    db          10
 0069253E    db          2
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          0
 0069253E    db          3
 0069253E    db          4
 0069253E    db          5
 0069253E    db          6
 0069253E    db          7
 0069253E    dd          006931FD
 0069253E    dd          006925A1
 0069253E    dd          0069262F
 0069253E    dd          00692695
 0069253E    dd          006926FC
 0069253E    dd          0069294E
 0069253E    dd          00692BA0
 0069253E    dd          00692DF2
 0069253E    dd          00693044
 0069253E    dd          006930D3
 0069253E    dd          0069316B
 006925A1    mov         edx,dword ptr [eax]
 006925A3    test        edx,edx
>006925A5    jne         006925B4
 006925A7    xor         edx,edx
 006925A9    mov         dword ptr [esi],edx
 006925AB    mov         dword ptr [esi+4],0BFF00000
>006925B2    jmp         006925C9
 006925B4    mov         dword ptr [ebp-14],edx
 006925B7    fild        dword ptr [ebp-14]
 006925BA    fsub        dword ptr ds:[693224];32767.5:Single
 006925C0    fdiv        dword ptr ds:[693224];32767.5:Single
 006925C6    fstp        qword ptr [esi]
 006925C8    wait
 006925C9    mov         edx,dword ptr [eax+4]
 006925CC    test        edx,edx
>006925CE    jne         006925E0
 006925D0    mov         edx,dword ptr [ebp-4]
 006925D3    xor         ecx,ecx
 006925D5    mov         dword ptr [edx],ecx
 006925D7    mov         dword ptr [edx+4],0BFF00000
>006925DE    jmp         006925F8
 006925E0    mov         dword ptr [ebp-14],edx
 006925E3    fild        dword ptr [ebp-14]
 006925E6    fsub        dword ptr ds:[693224];32767.5:Single
 006925EC    fdiv        dword ptr ds:[693224];32767.5:Single
 006925F2    mov         edx,dword ptr [ebp-4]
 006925F5    fstp        qword ptr [edx]
 006925F7    wait
 006925F8    mov         edx,dword ptr [eax+8]
 006925FB    test        edx,edx
>006925FD    jne         00692612
 006925FF    mov         eax,dword ptr [ebp+8]
 00692602    xor         edx,edx
 00692604    mov         dword ptr [eax],edx
 00692606    mov         dword ptr [eax+4],0BFF00000
>0069260D    jmp         00693218
 00692612    mov         dword ptr [ebp-14],edx
 00692615    fild        dword ptr [ebp-14]
 00692618    fsub        dword ptr ds:[693224];32767.5:Single
 0069261E    fdiv        dword ptr ds:[693224];32767.5:Single
 00692624    mov         eax,dword ptr [ebp+8]
 00692627    fstp        qword ptr [eax]
 00692629    wait
>0069262A    jmp         00693218
 0069262F    mov         edx,dword ptr [eax]
 00692631    test        edx,edx
>00692633    jne         00692642
 00692635    xor         edx,edx
 00692637    mov         dword ptr [esi],edx
 00692639    mov         dword ptr [esi+4],0BFF00000
>00692640    jmp         00692657
 00692642    mov         dword ptr [ebp-14],edx
 00692645    fild        dword ptr [ebp-14]
 00692648    fsub        dword ptr ds:[693224];32767.5:Single
 0069264E    fdiv        dword ptr ds:[693224];32767.5:Single
 00692654    fstp        qword ptr [esi]
 00692656    wait
 00692657    mov         edx,dword ptr [eax+4]
 0069265A    test        edx,edx
>0069265C    jne         0069266E
 0069265E    mov         eax,dword ptr [ebp-4]
 00692661    xor         edx,edx
 00692663    mov         dword ptr [eax],edx
 00692665    mov         dword ptr [eax+4],0BFF00000
>0069266C    jmp         00692686
 0069266E    mov         dword ptr [ebp-14],edx
 00692671    fild        dword ptr [ebp-14]
 00692674    fsub        dword ptr ds:[693224];32767.5:Single
 0069267A    fdiv        dword ptr ds:[693224];32767.5:Single
 00692680    mov         eax,dword ptr [ebp-4]
 00692683    fstp        qword ptr [eax]
 00692685    wait
 00692686    mov         eax,dword ptr [ebp+8]
 00692689    xor         edx,edx
 0069268B    mov         dword ptr [eax],edx
 0069268D    mov         dword ptr [eax+4],edx
>00692690    jmp         00693218
 00692695    mov         edx,dword ptr [eax+14]
 00692698    test        edx,edx
>0069269A    jne         006926A9
 0069269C    xor         edx,edx
 0069269E    mov         dword ptr [esi],edx
 006926A0    mov         dword ptr [esi+4],0BFF00000
>006926A7    jmp         006926BE
 006926A9    mov         dword ptr [ebp-14],edx
 006926AC    fild        dword ptr [ebp-14]
 006926AF    fsub        dword ptr ds:[693224];32767.5:Single
 006926B5    fdiv        dword ptr ds:[693224];32767.5:Single
 006926BB    fstp        qword ptr [esi]
 006926BD    wait
 006926BE    mov         edx,dword ptr [eax+8]
 006926C1    test        edx,edx
>006926C3    jne         006926D5
 006926C5    mov         eax,dword ptr [ebp-4]
 006926C8    xor         edx,edx
 006926CA    mov         dword ptr [eax],edx
 006926CC    mov         dword ptr [eax+4],0BFF00000
>006926D3    jmp         006926ED
 006926D5    mov         dword ptr [ebp-14],edx
 006926D8    fild        dword ptr [ebp-14]
 006926DB    fsub        dword ptr ds:[693224];32767.5:Single
 006926E1    fdiv        dword ptr ds:[693224];32767.5:Single
 006926E7    mov         eax,dword ptr [ebp-4]
 006926EA    fstp        qword ptr [eax]
 006926EC    wait
 006926ED    mov         eax,dword ptr [ebp+8]
 006926F0    xor         edx,edx
 006926F2    mov         dword ptr [eax],edx
 006926F4    mov         dword ptr [eax+4],edx
>006926F7    jmp         00693218
 006926FC    mov         eax,dword ptr [eax+20]
 006926FF    call        0068FCC8
 00692704    fstp        qword ptr [ebp-10]
 00692707    wait
 00692708    fld         qword ptr [ebp-10]
 0069270B    fcomp       dword ptr ds:[693228];0:Single
 00692711    wait
 00692712    fnstsw      al
 00692714    sahf
>00692715    jae         00692723
 00692717    xor         eax,eax
 00692719    mov         dword ptr [esi],eax
 0069271B    mov         dword ptr [esi+4],eax
>0069271E    jmp         0069283C
 00692723    fld         qword ptr [ebp-10]
 00692726    fcomp       dword ptr ds:[69322C];45:Single
 0069272C    wait
 0069272D    fnstsw      al
 0069272F    sahf
>00692730    jae         0069274F
 00692732    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692738    fmul        qword ptr [ebp-10]
 0069273B    add         esp,0FFFFFFF4
 0069273E    fstp        tbyte ptr [esp]
 00692741    wait
 00692742    call        00454ACC
 00692747    fstp        qword ptr [esi]
 00692749    wait
>0069274A    jmp         0069283C
 0069274F    fld         qword ptr [ebp-10]
 00692752    fcomp       dword ptr ds:[69323C];135:Single
 00692758    wait
 00692759    fnstsw      al
 0069275B    sahf
>0069275C    ja          0069276E
 0069275E    xor         eax,eax
 00692760    mov         dword ptr [esi],eax
 00692762    mov         dword ptr [esi+4],3FF00000
>00692769    jmp         0069283C
 0069276E    fld         qword ptr [ebp-10]
 00692771    fcomp       dword ptr ds:[693240];180:Single
 00692777    wait
 00692778    fnstsw      al
 0069277A    sahf
>0069277B    jae         006927A2
 0069277D    fld         dword ptr ds:[693240];180:Single
 00692783    fsub        qword ptr [ebp-10]
 00692786    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 0069278C    fmulp       st(1),st
 0069278E    add         esp,0FFFFFFF4
 00692791    fstp        tbyte ptr [esp]
 00692794    wait
 00692795    call        00454ACC
 0069279A    fstp        qword ptr [esi]
 0069279C    wait
>0069279D    jmp         0069283C
 006927A2    fld         qword ptr [ebp-10]
 006927A5    fcomp       dword ptr ds:[693244];225:Single
 006927AB    wait
 006927AC    fnstsw      al
 006927AE    sahf
>006927AF    jae         006927D5
 006927B1    fld         qword ptr [ebp-10]
 006927B4    fsub        dword ptr ds:[693240];180:Single
 006927BA    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 006927C0    fmulp       st(1),st
 006927C2    add         esp,0FFFFFFF4
 006927C5    fstp        tbyte ptr [esp]
 006927C8    wait
 006927C9    call        00454ACC
 006927CE    fchs
 006927D0    fstp        qword ptr [esi]
 006927D2    wait
>006927D3    jmp         0069283C
 006927D5    fld         qword ptr [ebp-10]
 006927D8    fcomp       dword ptr ds:[693248];315:Single
 006927DE    wait
 006927DF    fnstsw      al
 006927E1    sahf
>006927E2    jae         006927F1
 006927E4    xor         eax,eax
 006927E6    mov         dword ptr [esi],eax
 006927E8    mov         dword ptr [esi+4],0BFF00000
>006927EF    jmp         0069283C
 006927F1    fld         qword ptr [ebp-10]
 006927F4    fcomp       dword ptr ds:[69324C];360:Single
 006927FA    wait
 006927FB    fnstsw      al
 006927FD    sahf
>006927FE    ja          00692824
 00692800    fld         dword ptr ds:[69324C];360:Single
 00692806    fsub        qword ptr [ebp-10]
 00692809    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 0069280F    fmulp       st(1),st
 00692811    add         esp,0FFFFFFF4
 00692814    fstp        tbyte ptr [esp]
 00692817    wait
 00692818    call        00454ACC
 0069281D    fchs
 0069281F    fstp        qword ptr [esi]
 00692821    wait
>00692822    jmp         0069283C
 00692824    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 0069282A    fmul        qword ptr [ebp-10]
 0069282D    add         esp,0FFFFFFF4
 00692830    fstp        tbyte ptr [esp]
 00692833    wait
 00692834    call        Sin
 00692839    fstp        qword ptr [esi]
 0069283B    wait
 0069283C    fld         qword ptr [ebp-10]
 0069283F    fcomp       dword ptr ds:[693228];0:Single
 00692845    wait
 00692846    fnstsw      al
 00692848    sahf
>00692849    jae         0069285A
 0069284B    mov         eax,dword ptr [ebp-4]
 0069284E    xor         edx,edx
 00692850    mov         dword ptr [eax],edx
 00692852    mov         dword ptr [eax+4],edx
>00692855    jmp         00693218
 0069285A    fld         qword ptr [ebp-10]
 0069285D    fcomp       dword ptr ds:[69322C];45:Single
 00692863    wait
 00692864    fnstsw      al
 00692866    sahf
>00692867    jae         0069287C
 00692869    mov         eax,dword ptr [ebp-4]
 0069286C    xor         edx,edx
 0069286E    mov         dword ptr [eax],edx
 00692870    mov         dword ptr [eax+4],0BFF00000
>00692877    jmp         00693218
 0069287C    fld         qword ptr [ebp-10]
 0069287F    fcomp       dword ptr ds:[69323C];135:Single
 00692885    wait
 00692886    fnstsw      al
 00692888    sahf
>00692889    ja          006928B3
 0069288B    fld         qword ptr [ebp-10]
 0069288E    fsub        dword ptr ds:[693250];90:Single
 00692894    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 0069289A    fmulp       st(1),st
 0069289C    add         esp,0FFFFFFF4
 0069289F    fstp        tbyte ptr [esp]
 006928A2    wait
 006928A3    call        00454ACC
 006928A8    mov         eax,dword ptr [ebp-4]
 006928AB    fstp        qword ptr [eax]
 006928AD    wait
>006928AE    jmp         00693218
 006928B3    fld         qword ptr [ebp-10]
 006928B6    fcomp       dword ptr ds:[693244];225:Single
 006928BC    wait
 006928BD    fnstsw      al
 006928BF    sahf
>006928C0    jae         006928D5
 006928C2    mov         eax,dword ptr [ebp-4]
 006928C5    xor         edx,edx
 006928C7    mov         dword ptr [eax],edx
 006928C9    mov         dword ptr [eax+4],3FF00000
>006928D0    jmp         00693218
 006928D5    fld         qword ptr [ebp-10]
 006928D8    fcomp       dword ptr ds:[693248];315:Single
 006928DE    wait
 006928DF    fnstsw      al
 006928E1    sahf
>006928E2    jae         0069290C
 006928E4    fld         dword ptr ds:[693254];270:Single
 006928EA    fsub        qword ptr [ebp-10]
 006928ED    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 006928F3    fmulp       st(1),st
 006928F5    add         esp,0FFFFFFF4
 006928F8    fstp        tbyte ptr [esp]
 006928FB    wait
 006928FC    call        00454ACC
 00692901    mov         eax,dword ptr [ebp-4]
 00692904    fstp        qword ptr [eax]
 00692906    wait
>00692907    jmp         00693218
 0069290C    fld         qword ptr [ebp-10]
 0069290F    fcomp       dword ptr ds:[69324C];360:Single
 00692915    wait
 00692916    fnstsw      al
 00692918    sahf
>00692919    ja          0069292E
 0069291B    mov         eax,dword ptr [ebp-4]
 0069291E    xor         edx,edx
 00692920    mov         dword ptr [eax],edx
 00692922    mov         dword ptr [eax+4],0BFF00000
>00692929    jmp         00693218
 0069292E    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692934    fmul        qword ptr [ebp-10]
 00692937    add         esp,0FFFFFFF4
 0069293A    fstp        tbyte ptr [esp]
 0069293D    wait
 0069293E    call        Cos
 00692943    mov         eax,dword ptr [ebp-4]
 00692946    fstp        qword ptr [eax]
 00692948    wait
>00692949    jmp         00693218
 0069294E    mov         eax,dword ptr [eax+24]
 00692951    call        0068FCC8
 00692956    fstp        qword ptr [ebp-10]
 00692959    wait
 0069295A    fld         qword ptr [ebp-10]
 0069295D    fcomp       dword ptr ds:[693228];0:Single
 00692963    wait
 00692964    fnstsw      al
 00692966    sahf
>00692967    jae         00692975
 00692969    xor         eax,eax
 0069296B    mov         dword ptr [esi],eax
 0069296D    mov         dword ptr [esi+4],eax
>00692970    jmp         00692A8E
 00692975    fld         qword ptr [ebp-10]
 00692978    fcomp       dword ptr ds:[69322C];45:Single
 0069297E    wait
 0069297F    fnstsw      al
 00692981    sahf
>00692982    jae         006929A1
 00692984    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 0069298A    fmul        qword ptr [ebp-10]
 0069298D    add         esp,0FFFFFFF4
 00692990    fstp        tbyte ptr [esp]
 00692993    wait
 00692994    call        00454ACC
 00692999    fstp        qword ptr [esi]
 0069299B    wait
>0069299C    jmp         00692A8E
 006929A1    fld         qword ptr [ebp-10]
 006929A4    fcomp       dword ptr ds:[69323C];135:Single
 006929AA    wait
 006929AB    fnstsw      al
 006929AD    sahf
>006929AE    ja          006929C0
 006929B0    xor         eax,eax
 006929B2    mov         dword ptr [esi],eax
 006929B4    mov         dword ptr [esi+4],3FF00000
>006929BB    jmp         00692A8E
 006929C0    fld         qword ptr [ebp-10]
 006929C3    fcomp       dword ptr ds:[693240];180:Single
 006929C9    wait
 006929CA    fnstsw      al
 006929CC    sahf
>006929CD    jae         006929F4
 006929CF    fld         dword ptr ds:[693240];180:Single
 006929D5    fsub        qword ptr [ebp-10]
 006929D8    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 006929DE    fmulp       st(1),st
 006929E0    add         esp,0FFFFFFF4
 006929E3    fstp        tbyte ptr [esp]
 006929E6    wait
 006929E7    call        00454ACC
 006929EC    fstp        qword ptr [esi]
 006929EE    wait
>006929EF    jmp         00692A8E
 006929F4    fld         qword ptr [ebp-10]
 006929F7    fcomp       dword ptr ds:[693244];225:Single
 006929FD    wait
 006929FE    fnstsw      al
 00692A00    sahf
>00692A01    jae         00692A27
 00692A03    fld         qword ptr [ebp-10]
 00692A06    fsub        dword ptr ds:[693240];180:Single
 00692A0C    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692A12    fmulp       st(1),st
 00692A14    add         esp,0FFFFFFF4
 00692A17    fstp        tbyte ptr [esp]
 00692A1A    wait
 00692A1B    call        00454ACC
 00692A20    fchs
 00692A22    fstp        qword ptr [esi]
 00692A24    wait
>00692A25    jmp         00692A8E
 00692A27    fld         qword ptr [ebp-10]
 00692A2A    fcomp       dword ptr ds:[693248];315:Single
 00692A30    wait
 00692A31    fnstsw      al
 00692A33    sahf
>00692A34    jae         00692A43
 00692A36    xor         eax,eax
 00692A38    mov         dword ptr [esi],eax
 00692A3A    mov         dword ptr [esi+4],0BFF00000
>00692A41    jmp         00692A8E
 00692A43    fld         qword ptr [ebp-10]
 00692A46    fcomp       dword ptr ds:[69324C];360:Single
 00692A4C    wait
 00692A4D    fnstsw      al
 00692A4F    sahf
>00692A50    ja          00692A76
 00692A52    fld         dword ptr ds:[69324C];360:Single
 00692A58    fsub        qword ptr [ebp-10]
 00692A5B    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692A61    fmulp       st(1),st
 00692A63    add         esp,0FFFFFFF4
 00692A66    fstp        tbyte ptr [esp]
 00692A69    wait
 00692A6A    call        00454ACC
 00692A6F    fchs
 00692A71    fstp        qword ptr [esi]
 00692A73    wait
>00692A74    jmp         00692A8E
 00692A76    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692A7C    fmul        qword ptr [ebp-10]
 00692A7F    add         esp,0FFFFFFF4
 00692A82    fstp        tbyte ptr [esp]
 00692A85    wait
 00692A86    call        Sin
 00692A8B    fstp        qword ptr [esi]
 00692A8D    wait
 00692A8E    fld         qword ptr [ebp-10]
 00692A91    fcomp       dword ptr ds:[693228];0:Single
 00692A97    wait
 00692A98    fnstsw      al
 00692A9A    sahf
>00692A9B    jae         00692AAC
 00692A9D    mov         eax,dword ptr [ebp-4]
 00692AA0    xor         edx,edx
 00692AA2    mov         dword ptr [eax],edx
 00692AA4    mov         dword ptr [eax+4],edx
>00692AA7    jmp         00693218
 00692AAC    fld         qword ptr [ebp-10]
 00692AAF    fcomp       dword ptr ds:[69322C];45:Single
 00692AB5    wait
 00692AB6    fnstsw      al
 00692AB8    sahf
>00692AB9    jae         00692ACE
 00692ABB    mov         eax,dword ptr [ebp-4]
 00692ABE    xor         edx,edx
 00692AC0    mov         dword ptr [eax],edx
 00692AC2    mov         dword ptr [eax+4],0BFF00000
>00692AC9    jmp         00693218
 00692ACE    fld         qword ptr [ebp-10]
 00692AD1    fcomp       dword ptr ds:[69323C];135:Single
 00692AD7    wait
 00692AD8    fnstsw      al
 00692ADA    sahf
>00692ADB    ja          00692B05
 00692ADD    fld         qword ptr [ebp-10]
 00692AE0    fsub        dword ptr ds:[693250];90:Single
 00692AE6    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692AEC    fmulp       st(1),st
 00692AEE    add         esp,0FFFFFFF4
 00692AF1    fstp        tbyte ptr [esp]
 00692AF4    wait
 00692AF5    call        00454ACC
 00692AFA    mov         eax,dword ptr [ebp-4]
 00692AFD    fstp        qword ptr [eax]
 00692AFF    wait
>00692B00    jmp         00693218
 00692B05    fld         qword ptr [ebp-10]
 00692B08    fcomp       dword ptr ds:[693244];225:Single
 00692B0E    wait
 00692B0F    fnstsw      al
 00692B11    sahf
>00692B12    jae         00692B27
 00692B14    mov         eax,dword ptr [ebp-4]
 00692B17    xor         edx,edx
 00692B19    mov         dword ptr [eax],edx
 00692B1B    mov         dword ptr [eax+4],3FF00000
>00692B22    jmp         00693218
 00692B27    fld         qword ptr [ebp-10]
 00692B2A    fcomp       dword ptr ds:[693248];315:Single
 00692B30    wait
 00692B31    fnstsw      al
 00692B33    sahf
>00692B34    jae         00692B5E
 00692B36    fld         dword ptr ds:[693254];270:Single
 00692B3C    fsub        qword ptr [ebp-10]
 00692B3F    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692B45    fmulp       st(1),st
 00692B47    add         esp,0FFFFFFF4
 00692B4A    fstp        tbyte ptr [esp]
 00692B4D    wait
 00692B4E    call        00454ACC
 00692B53    mov         eax,dword ptr [ebp-4]
 00692B56    fstp        qword ptr [eax]
 00692B58    wait
>00692B59    jmp         00693218
 00692B5E    fld         qword ptr [ebp-10]
 00692B61    fcomp       dword ptr ds:[69324C];360:Single
 00692B67    wait
 00692B68    fnstsw      al
 00692B6A    sahf
>00692B6B    ja          00692B80
 00692B6D    mov         eax,dword ptr [ebp-4]
 00692B70    xor         edx,edx
 00692B72    mov         dword ptr [eax],edx
 00692B74    mov         dword ptr [eax+4],0BFF00000
>00692B7B    jmp         00693218
 00692B80    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692B86    fmul        qword ptr [ebp-10]
 00692B89    add         esp,0FFFFFFF4
 00692B8C    fstp        tbyte ptr [esp]
 00692B8F    wait
 00692B90    call        Cos
 00692B95    mov         eax,dword ptr [ebp-4]
 00692B98    fstp        qword ptr [eax]
 00692B9A    wait
>00692B9B    jmp         00693218
 00692BA0    mov         eax,dword ptr [eax+28]
 00692BA3    call        0068FCC8
 00692BA8    fstp        qword ptr [ebp-10]
 00692BAB    wait
 00692BAC    fld         qword ptr [ebp-10]
 00692BAF    fcomp       dword ptr ds:[693228];0:Single
 00692BB5    wait
 00692BB6    fnstsw      al
 00692BB8    sahf
>00692BB9    jae         00692BC7
 00692BBB    xor         eax,eax
 00692BBD    mov         dword ptr [esi],eax
 00692BBF    mov         dword ptr [esi+4],eax
>00692BC2    jmp         00692CE0
 00692BC7    fld         qword ptr [ebp-10]
 00692BCA    fcomp       dword ptr ds:[69322C];45:Single
 00692BD0    wait
 00692BD1    fnstsw      al
 00692BD3    sahf
>00692BD4    jae         00692BF3
 00692BD6    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692BDC    fmul        qword ptr [ebp-10]
 00692BDF    add         esp,0FFFFFFF4
 00692BE2    fstp        tbyte ptr [esp]
 00692BE5    wait
 00692BE6    call        00454ACC
 00692BEB    fstp        qword ptr [esi]
 00692BED    wait
>00692BEE    jmp         00692CE0
 00692BF3    fld         qword ptr [ebp-10]
 00692BF6    fcomp       dword ptr ds:[69323C];135:Single
 00692BFC    wait
 00692BFD    fnstsw      al
 00692BFF    sahf
>00692C00    ja          00692C12
 00692C02    xor         eax,eax
 00692C04    mov         dword ptr [esi],eax
 00692C06    mov         dword ptr [esi+4],3FF00000
>00692C0D    jmp         00692CE0
 00692C12    fld         qword ptr [ebp-10]
 00692C15    fcomp       dword ptr ds:[693240];180:Single
 00692C1B    wait
 00692C1C    fnstsw      al
 00692C1E    sahf
>00692C1F    jae         00692C46
 00692C21    fld         dword ptr ds:[693240];180:Single
 00692C27    fsub        qword ptr [ebp-10]
 00692C2A    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692C30    fmulp       st(1),st
 00692C32    add         esp,0FFFFFFF4
 00692C35    fstp        tbyte ptr [esp]
 00692C38    wait
 00692C39    call        00454ACC
 00692C3E    fstp        qword ptr [esi]
 00692C40    wait
>00692C41    jmp         00692CE0
 00692C46    fld         qword ptr [ebp-10]
 00692C49    fcomp       dword ptr ds:[693244];225:Single
 00692C4F    wait
 00692C50    fnstsw      al
 00692C52    sahf
>00692C53    jae         00692C79
 00692C55    fld         qword ptr [ebp-10]
 00692C58    fsub        dword ptr ds:[693240];180:Single
 00692C5E    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692C64    fmulp       st(1),st
 00692C66    add         esp,0FFFFFFF4
 00692C69    fstp        tbyte ptr [esp]
 00692C6C    wait
 00692C6D    call        00454ACC
 00692C72    fchs
 00692C74    fstp        qword ptr [esi]
 00692C76    wait
>00692C77    jmp         00692CE0
 00692C79    fld         qword ptr [ebp-10]
 00692C7C    fcomp       dword ptr ds:[693248];315:Single
 00692C82    wait
 00692C83    fnstsw      al
 00692C85    sahf
>00692C86    jae         00692C95
 00692C88    xor         eax,eax
 00692C8A    mov         dword ptr [esi],eax
 00692C8C    mov         dword ptr [esi+4],0BFF00000
>00692C93    jmp         00692CE0
 00692C95    fld         qword ptr [ebp-10]
 00692C98    fcomp       dword ptr ds:[69324C];360:Single
 00692C9E    wait
 00692C9F    fnstsw      al
 00692CA1    sahf
>00692CA2    ja          00692CC8
 00692CA4    fld         dword ptr ds:[69324C];360:Single
 00692CAA    fsub        qword ptr [ebp-10]
 00692CAD    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692CB3    fmulp       st(1),st
 00692CB5    add         esp,0FFFFFFF4
 00692CB8    fstp        tbyte ptr [esp]
 00692CBB    wait
 00692CBC    call        00454ACC
 00692CC1    fchs
 00692CC3    fstp        qword ptr [esi]
 00692CC5    wait
>00692CC6    jmp         00692CE0
 00692CC8    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692CCE    fmul        qword ptr [ebp-10]
 00692CD1    add         esp,0FFFFFFF4
 00692CD4    fstp        tbyte ptr [esp]
 00692CD7    wait
 00692CD8    call        Sin
 00692CDD    fstp        qword ptr [esi]
 00692CDF    wait
 00692CE0    fld         qword ptr [ebp-10]
 00692CE3    fcomp       dword ptr ds:[693228];0:Single
 00692CE9    wait
 00692CEA    fnstsw      al
 00692CEC    sahf
>00692CED    jae         00692CFE
 00692CEF    mov         eax,dword ptr [ebp-4]
 00692CF2    xor         edx,edx
 00692CF4    mov         dword ptr [eax],edx
 00692CF6    mov         dword ptr [eax+4],edx
>00692CF9    jmp         00693218
 00692CFE    fld         qword ptr [ebp-10]
 00692D01    fcomp       dword ptr ds:[69322C];45:Single
 00692D07    wait
 00692D08    fnstsw      al
 00692D0A    sahf
>00692D0B    jae         00692D20
 00692D0D    mov         eax,dword ptr [ebp-4]
 00692D10    xor         edx,edx
 00692D12    mov         dword ptr [eax],edx
 00692D14    mov         dword ptr [eax+4],0BFF00000
>00692D1B    jmp         00693218
 00692D20    fld         qword ptr [ebp-10]
 00692D23    fcomp       dword ptr ds:[69323C];135:Single
 00692D29    wait
 00692D2A    fnstsw      al
 00692D2C    sahf
>00692D2D    ja          00692D57
 00692D2F    fld         qword ptr [ebp-10]
 00692D32    fsub        dword ptr ds:[693250];90:Single
 00692D38    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692D3E    fmulp       st(1),st
 00692D40    add         esp,0FFFFFFF4
 00692D43    fstp        tbyte ptr [esp]
 00692D46    wait
 00692D47    call        00454ACC
 00692D4C    mov         eax,dword ptr [ebp-4]
 00692D4F    fstp        qword ptr [eax]
 00692D51    wait
>00692D52    jmp         00693218
 00692D57    fld         qword ptr [ebp-10]
 00692D5A    fcomp       dword ptr ds:[693244];225:Single
 00692D60    wait
 00692D61    fnstsw      al
 00692D63    sahf
>00692D64    jae         00692D79
 00692D66    mov         eax,dword ptr [ebp-4]
 00692D69    xor         edx,edx
 00692D6B    mov         dword ptr [eax],edx
 00692D6D    mov         dword ptr [eax+4],3FF00000
>00692D74    jmp         00693218
 00692D79    fld         qword ptr [ebp-10]
 00692D7C    fcomp       dword ptr ds:[693248];315:Single
 00692D82    wait
 00692D83    fnstsw      al
 00692D85    sahf
>00692D86    jae         00692DB0
 00692D88    fld         dword ptr ds:[693254];270:Single
 00692D8E    fsub        qword ptr [ebp-10]
 00692D91    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692D97    fmulp       st(1),st
 00692D99    add         esp,0FFFFFFF4
 00692D9C    fstp        tbyte ptr [esp]
 00692D9F    wait
 00692DA0    call        00454ACC
 00692DA5    mov         eax,dword ptr [ebp-4]
 00692DA8    fstp        qword ptr [eax]
 00692DAA    wait
>00692DAB    jmp         00693218
 00692DB0    fld         qword ptr [ebp-10]
 00692DB3    fcomp       dword ptr ds:[69324C];360:Single
 00692DB9    wait
 00692DBA    fnstsw      al
 00692DBC    sahf
>00692DBD    ja          00692DD2
 00692DBF    mov         eax,dword ptr [ebp-4]
 00692DC2    xor         edx,edx
 00692DC4    mov         dword ptr [eax],edx
 00692DC6    mov         dword ptr [eax+4],0BFF00000
>00692DCD    jmp         00693218
 00692DD2    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692DD8    fmul        qword ptr [ebp-10]
 00692DDB    add         esp,0FFFFFFF4
 00692DDE    fstp        tbyte ptr [esp]
 00692DE1    wait
 00692DE2    call        Cos
 00692DE7    mov         eax,dword ptr [ebp-4]
 00692DEA    fstp        qword ptr [eax]
 00692DEC    wait
>00692DED    jmp         00693218
 00692DF2    mov         eax,dword ptr [eax+2C]
 00692DF5    call        0068FCC8
 00692DFA    fstp        qword ptr [ebp-10]
 00692DFD    wait
 00692DFE    fld         qword ptr [ebp-10]
 00692E01    fcomp       dword ptr ds:[693228];0:Single
 00692E07    wait
 00692E08    fnstsw      al
 00692E0A    sahf
>00692E0B    jae         00692E19
 00692E0D    xor         eax,eax
 00692E0F    mov         dword ptr [esi],eax
 00692E11    mov         dword ptr [esi+4],eax
>00692E14    jmp         00692F32
 00692E19    fld         qword ptr [ebp-10]
 00692E1C    fcomp       dword ptr ds:[69322C];45:Single
 00692E22    wait
 00692E23    fnstsw      al
 00692E25    sahf
>00692E26    jae         00692E45
 00692E28    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692E2E    fmul        qword ptr [ebp-10]
 00692E31    add         esp,0FFFFFFF4
 00692E34    fstp        tbyte ptr [esp]
 00692E37    wait
 00692E38    call        00454ACC
 00692E3D    fstp        qword ptr [esi]
 00692E3F    wait
>00692E40    jmp         00692F32
 00692E45    fld         qword ptr [ebp-10]
 00692E48    fcomp       dword ptr ds:[69323C];135:Single
 00692E4E    wait
 00692E4F    fnstsw      al
 00692E51    sahf
>00692E52    ja          00692E64
 00692E54    xor         eax,eax
 00692E56    mov         dword ptr [esi],eax
 00692E58    mov         dword ptr [esi+4],3FF00000
>00692E5F    jmp         00692F32
 00692E64    fld         qword ptr [ebp-10]
 00692E67    fcomp       dword ptr ds:[693240];180:Single
 00692E6D    wait
 00692E6E    fnstsw      al
 00692E70    sahf
>00692E71    jae         00692E98
 00692E73    fld         dword ptr ds:[693240];180:Single
 00692E79    fsub        qword ptr [ebp-10]
 00692E7C    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692E82    fmulp       st(1),st
 00692E84    add         esp,0FFFFFFF4
 00692E87    fstp        tbyte ptr [esp]
 00692E8A    wait
 00692E8B    call        00454ACC
 00692E90    fstp        qword ptr [esi]
 00692E92    wait
>00692E93    jmp         00692F32
 00692E98    fld         qword ptr [ebp-10]
 00692E9B    fcomp       dword ptr ds:[693244];225:Single
 00692EA1    wait
 00692EA2    fnstsw      al
 00692EA4    sahf
>00692EA5    jae         00692ECB
 00692EA7    fld         qword ptr [ebp-10]
 00692EAA    fsub        dword ptr ds:[693240];180:Single
 00692EB0    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692EB6    fmulp       st(1),st
 00692EB8    add         esp,0FFFFFFF4
 00692EBB    fstp        tbyte ptr [esp]
 00692EBE    wait
 00692EBF    call        00454ACC
 00692EC4    fchs
 00692EC6    fstp        qword ptr [esi]
 00692EC8    wait
>00692EC9    jmp         00692F32
 00692ECB    fld         qword ptr [ebp-10]
 00692ECE    fcomp       dword ptr ds:[693248];315:Single
 00692ED4    wait
 00692ED5    fnstsw      al
 00692ED7    sahf
>00692ED8    jae         00692EE7
 00692EDA    xor         eax,eax
 00692EDC    mov         dword ptr [esi],eax
 00692EDE    mov         dword ptr [esi+4],0BFF00000
>00692EE5    jmp         00692F32
 00692EE7    fld         qword ptr [ebp-10]
 00692EEA    fcomp       dword ptr ds:[69324C];360:Single
 00692EF0    wait
 00692EF1    fnstsw      al
 00692EF3    sahf
>00692EF4    ja          00692F1A
 00692EF6    fld         dword ptr ds:[69324C];360:Single
 00692EFC    fsub        qword ptr [ebp-10]
 00692EFF    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692F05    fmulp       st(1),st
 00692F07    add         esp,0FFFFFFF4
 00692F0A    fstp        tbyte ptr [esp]
 00692F0D    wait
 00692F0E    call        00454ACC
 00692F13    fchs
 00692F15    fstp        qword ptr [esi]
 00692F17    wait
>00692F18    jmp         00692F32
 00692F1A    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692F20    fmul        qword ptr [ebp-10]
 00692F23    add         esp,0FFFFFFF4
 00692F26    fstp        tbyte ptr [esp]
 00692F29    wait
 00692F2A    call        Sin
 00692F2F    fstp        qword ptr [esi]
 00692F31    wait
 00692F32    fld         qword ptr [ebp-10]
 00692F35    fcomp       dword ptr ds:[693228];0:Single
 00692F3B    wait
 00692F3C    fnstsw      al
 00692F3E    sahf
>00692F3F    jae         00692F50
 00692F41    mov         eax,dword ptr [ebp-4]
 00692F44    xor         edx,edx
 00692F46    mov         dword ptr [eax],edx
 00692F48    mov         dword ptr [eax+4],edx
>00692F4B    jmp         00693218
 00692F50    fld         qword ptr [ebp-10]
 00692F53    fcomp       dword ptr ds:[69322C];45:Single
 00692F59    wait
 00692F5A    fnstsw      al
 00692F5C    sahf
>00692F5D    jae         00692F72
 00692F5F    mov         eax,dword ptr [ebp-4]
 00692F62    xor         edx,edx
 00692F64    mov         dword ptr [eax],edx
 00692F66    mov         dword ptr [eax+4],0BFF00000
>00692F6D    jmp         00693218
 00692F72    fld         qword ptr [ebp-10]
 00692F75    fcomp       dword ptr ds:[69323C];135:Single
 00692F7B    wait
 00692F7C    fnstsw      al
 00692F7E    sahf
>00692F7F    ja          00692FA9
 00692F81    fld         qword ptr [ebp-10]
 00692F84    fsub        dword ptr ds:[693250];90:Single
 00692F8A    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692F90    fmulp       st(1),st
 00692F92    add         esp,0FFFFFFF4
 00692F95    fstp        tbyte ptr [esp]
 00692F98    wait
 00692F99    call        00454ACC
 00692F9E    mov         eax,dword ptr [ebp-4]
 00692FA1    fstp        qword ptr [eax]
 00692FA3    wait
>00692FA4    jmp         00693218
 00692FA9    fld         qword ptr [ebp-10]
 00692FAC    fcomp       dword ptr ds:[693244];225:Single
 00692FB2    wait
 00692FB3    fnstsw      al
 00692FB5    sahf
>00692FB6    jae         00692FCB
 00692FB8    mov         eax,dword ptr [ebp-4]
 00692FBB    xor         edx,edx
 00692FBD    mov         dword ptr [eax],edx
 00692FBF    mov         dword ptr [eax+4],3FF00000
>00692FC6    jmp         00693218
 00692FCB    fld         qword ptr [ebp-10]
 00692FCE    fcomp       dword ptr ds:[693248];315:Single
 00692FD4    wait
 00692FD5    fnstsw      al
 00692FD7    sahf
>00692FD8    jae         00693002
 00692FDA    fld         dword ptr ds:[693254];270:Single
 00692FE0    fsub        qword ptr [ebp-10]
 00692FE3    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 00692FE9    fmulp       st(1),st
 00692FEB    add         esp,0FFFFFFF4
 00692FEE    fstp        tbyte ptr [esp]
 00692FF1    wait
 00692FF2    call        00454ACC
 00692FF7    mov         eax,dword ptr [ebp-4]
 00692FFA    fstp        qword ptr [eax]
 00692FFC    wait
>00692FFD    jmp         00693218
 00693002    fld         qword ptr [ebp-10]
 00693005    fcomp       dword ptr ds:[69324C];360:Single
 0069300B    wait
 0069300C    fnstsw      al
 0069300E    sahf
>0069300F    ja          00693024
 00693011    mov         eax,dword ptr [ebp-4]
 00693014    xor         edx,edx
 00693016    mov         dword ptr [eax],edx
 00693018    mov         dword ptr [eax+4],0BFF00000
>0069301F    jmp         00693218
 00693024    fld         tbyte ptr ds:[693230];0.0174532925199433:Extended
 0069302A    fmul        qword ptr [ebp-10]
 0069302D    add         esp,0FFFFFFF4
 00693030    fstp        tbyte ptr [esp]
 00693033    wait
 00693034    call        Cos
 00693039    mov         eax,dword ptr [ebp-4]
 0069303C    fstp        qword ptr [eax]
 0069303E    wait
>0069303F    jmp         00693218
 00693044    mov         edx,dword ptr [eax+0C]
 00693047    test        edx,edx
>00693049    jne         00693058
 0069304B    xor         edx,edx
 0069304D    mov         dword ptr [esi],edx
 0069304F    mov         dword ptr [esi+4],0BFF00000
>00693056    jmp         0069306D
 00693058    mov         dword ptr [ebp-14],edx
 0069305B    fild        dword ptr [ebp-14]
 0069305E    fsub        dword ptr ds:[693224];32767.5:Single
 00693064    fdiv        dword ptr ds:[693224];32767.5:Single
 0069306A    fstp        qword ptr [esi]
 0069306C    wait
 0069306D    mov         edx,dword ptr [eax+10]
 00693070    test        edx,edx
>00693072    jne         00693084
 00693074    mov         edx,dword ptr [ebp-4]
 00693077    xor         ecx,ecx
 00693079    mov         dword ptr [edx],ecx
 0069307B    mov         dword ptr [edx+4],0BFF00000
>00693082    jmp         0069309C
 00693084    mov         dword ptr [ebp-14],edx
 00693087    fild        dword ptr [ebp-14]
 0069308A    fsub        dword ptr ds:[693224];32767.5:Single
 00693090    fdiv        dword ptr ds:[693224];32767.5:Single
 00693096    mov         edx,dword ptr [ebp-4]
 00693099    fstp        qword ptr [edx]
 0069309B    wait
 0069309C    mov         edx,dword ptr [eax+14]
 0069309F    test        edx,edx
>006930A1    jne         006930B6
 006930A3    mov         eax,dword ptr [ebp+8]
 006930A6    xor         edx,edx
 006930A8    mov         dword ptr [eax],edx
 006930AA    mov         dword ptr [eax+4],0BFF00000
>006930B1    jmp         00693218
 006930B6    mov         dword ptr [ebp-14],edx
 006930B9    fild        dword ptr [ebp-14]
 006930BC    fsub        dword ptr ds:[693224];32767.5:Single
 006930C2    fdiv        dword ptr ds:[693224];32767.5:Single
 006930C8    mov         eax,dword ptr [ebp+8]
 006930CB    fstp        qword ptr [eax]
 006930CD    wait
>006930CE    jmp         00693218
 006930D3    mov         edx,dword ptr [eax+0B0]
 006930D9    test        edx,edx
>006930DB    jne         006930EA
 006930DD    xor         edx,edx
 006930DF    mov         dword ptr [esi],edx
 006930E1    mov         dword ptr [esi+4],0BFF00000
>006930E8    jmp         006930FF
 006930EA    mov         dword ptr [ebp-14],edx
 006930ED    fild        dword ptr [ebp-14]
 006930F0    fsub        dword ptr ds:[693224];32767.5:Single
 006930F6    fdiv        dword ptr ds:[693224];32767.5:Single
 006930FC    fstp        qword ptr [esi]
 006930FE    wait
 006930FF    mov         edx,dword ptr [eax+0B4]
 00693105    test        edx,edx
>00693107    jne         00693119
 00693109    mov         edx,dword ptr [ebp-4]
 0069310C    xor         ecx,ecx
 0069310E    mov         dword ptr [edx],ecx
 00693110    mov         dword ptr [edx+4],0BFF00000
>00693117    jmp         00693131
 00693119    mov         dword ptr [ebp-14],edx
 0069311C    fild        dword ptr [ebp-14]
 0069311F    fsub        dword ptr ds:[693224];32767.5:Single
 00693125    fdiv        dword ptr ds:[693224];32767.5:Single
 0069312B    mov         edx,dword ptr [ebp-4]
 0069312E    fstp        qword ptr [edx]
 00693130    wait
 00693131    mov         edx,dword ptr [eax+0B8]
 00693137    test        edx,edx
>00693139    jne         0069314E
 0069313B    mov         eax,dword ptr [ebp+8]
 0069313E    xor         edx,edx
 00693140    mov         dword ptr [eax],edx
 00693142    mov         dword ptr [eax+4],0BFF00000
>00693149    jmp         00693218
 0069314E    mov         dword ptr [ebp-14],edx
 00693151    fild        dword ptr [ebp-14]
 00693154    fsub        dword ptr ds:[693224];32767.5:Single
 0069315A    fdiv        dword ptr ds:[693224];32767.5:Single
 00693160    mov         eax,dword ptr [ebp+8]
 00693163    fstp        qword ptr [eax]
 00693165    wait
>00693166    jmp         00693218
 0069316B    mov         edx,dword ptr [eax+0BC]
 00693171    test        edx,edx
>00693173    jne         00693182
 00693175    xor         edx,edx
 00693177    mov         dword ptr [esi],edx
 00693179    mov         dword ptr [esi+4],0BFF00000
>00693180    jmp         00693197
 00693182    mov         dword ptr [ebp-14],edx
 00693185    fild        dword ptr [ebp-14]
 00693188    fsub        dword ptr ds:[693224];32767.5:Single
 0069318E    fdiv        dword ptr ds:[693224];32767.5:Single
 00693194    fstp        qword ptr [esi]
 00693196    wait
 00693197    mov         edx,dword ptr [eax+0C0]
 0069319D    test        edx,edx
>0069319F    jne         006931B1
 006931A1    mov         edx,dword ptr [ebp-4]
 006931A4    xor         ecx,ecx
 006931A6    mov         dword ptr [edx],ecx
 006931A8    mov         dword ptr [edx+4],0BFF00000
>006931AF    jmp         006931C9
 006931B1    mov         dword ptr [ebp-14],edx
 006931B4    fild        dword ptr [ebp-14]
 006931B7    fsub        dword ptr ds:[693224];32767.5:Single
 006931BD    fdiv        dword ptr ds:[693224];32767.5:Single
 006931C3    mov         edx,dword ptr [ebp-4]
 006931C6    fstp        qword ptr [edx]
 006931C8    wait
 006931C9    mov         edx,dword ptr [eax+0C4]
 006931CF    test        edx,edx
>006931D1    jne         006931E3
 006931D3    mov         eax,dword ptr [ebp+8]
 006931D6    xor         edx,edx
 006931D8    mov         dword ptr [eax],edx
 006931DA    mov         dword ptr [eax+4],0BFF00000
>006931E1    jmp         00693218
 006931E3    mov         dword ptr [ebp-14],edx
 006931E6    fild        dword ptr [ebp-14]
 006931E9    fsub        dword ptr ds:[693224];32767.5:Single
 006931EF    fdiv        dword ptr ds:[693224];32767.5:Single
 006931F5    mov         eax,dword ptr [ebp+8]
 006931F8    fstp        qword ptr [eax]
 006931FA    wait
>006931FB    jmp         00693218
 006931FD    xor         eax,eax
 006931FF    mov         dword ptr [esi],eax
 00693201    mov         dword ptr [esi+4],eax
 00693204    mov         eax,dword ptr [ebp-4]
 00693207    xor         edx,edx
 00693209    mov         dword ptr [eax],edx
 0069320B    mov         dword ptr [eax+4],edx
 0069320E    mov         eax,dword ptr [ebp+8]
 00693211    xor         edx,edx
 00693213    mov         dword ptr [eax],edx
 00693215    mov         dword ptr [eax+4],edx
 00693218    pop         edi
 00693219    pop         esi
 0069321A    pop         ebx
 0069321B    mov         esp,ebp
 0069321D    pop         ebp
 0069321E    ret         4
*}
end;

//00693258
function TJoystickValue.Module:TObject;
begin
{*
 00693258    mov         eax,[0081ED04];gvar_0081ED04:TModuleJoystick
 0069325D    ret
*}
end;

//00693260
{*function TJoystickValue.SetValue(NewValue:Double; ?:?):Boolean;
begin
 00693260    push        ebp
 00693261    mov         ebp,esp
 00693263    push        ebx
 00693264    push        esi
 00693265    mov         esi,eax
 00693267    mov         eax,dword ptr [ebp+8]
 0069326A    mov         dword ptr [esi+8],eax;TJoystickValue.PreviousValue:Double
 0069326D    mov         eax,dword ptr [ebp+0C]
 00693270    mov         dword ptr [esi+0C],eax;TJoystickValue.?fC:dword
 00693273    mov         eax,[0081ED08];gvar_0081ED08:?
 00693278    call        @DynArrayLength
 0069327D    cmp         eax,dword ptr [esi+18];TJoystickValue......................................................
>00693280    jge         00693286
 00693282    xor         ebx,ebx
>00693284    jmp         006932D7
 00693286    mov         eax,dword ptr [esi+20];TJoystickValue..................................Item:Integer
 00693289    sub         eax,109
>0069328E    je          00693295
 00693290    dec         eax
>00693291    je          006932B5
>00693293    jmp         006932D5
 00693295    mov         bl,1
 00693297    push        dword ptr [ebp+0C]
 0069329A    push        dword ptr [ebp+8]
 0069329D    mov         edx,dword ptr ds:[81ED24];gvar_0081ED24:?
 006932A3    mov         eax,dword ptr [esi+18];TJoystickValue......................................................
 006932A6    push        dword ptr [edx+eax*8-4]
 006932AA    push        dword ptr [edx+eax*8-8]
 006932AE    call        00693EC0
>006932B3    jmp         006932D7
 006932B5    mov         bl,1
 006932B7    mov         edx,dword ptr ds:[81ED20];gvar_0081ED20:?
 006932BD    mov         eax,dword ptr [esi+18];TJoystickValue......................................................
 006932C0    push        dword ptr [edx+eax*8-4]
 006932C4    push        dword ptr [edx+eax*8-8]
 006932C8    push        dword ptr [ebp+0C]
 006932CB    push        dword ptr [ebp+8]
 006932CE    call        00693EC0
>006932D3    jmp         006932D7
 006932D5    xor         ebx,ebx
 006932D7    mov         eax,ebx
 006932D9    pop         esi
 006932DA    pop         ebx
 006932DB    pop         ebp
 006932DC    ret         8
end;*}

//006932E0
procedure sub_006932E0;
begin
{*
 006932E0    push        ebp
 006932E1    mov         ebp,esp
 006932E3    xor         ecx,ecx
 006932E5    push        ecx
 006932E6    push        ecx
 006932E7    push        ecx
 006932E8    push        ecx
 006932E9    push        ecx
 006932EA    push        ecx
 006932EB    push        ecx
 006932EC    push        ebx
 006932ED    push        esi
 006932EE    push        edi
 006932EF    mov         edi,81ED08;gvar_0081ED08:?
 006932F4    xor         eax,eax
 006932F6    push        ebp
 006932F7    push        693608
 006932FC    push        dword ptr fs:[eax]
 006932FF    mov         dword ptr fs:[eax],esp
 00693302    mov         eax,[0078D4B0];^gvar_0078BDBC
 00693307    cmp         byte ptr [eax],0
>0069330A    je          00693319
 0069330C    cmp         byte ptr ds:[78BDE4],0;gvar_0078BDE4
>00693313    jne         006935E5
 00693319    mov         byte ptr ds:[78BDE4],1;gvar_0078BDE4
 00693320    mov         eax,693624;'CreateJoystickDevices'
 00693325    call        004FA5FC
 0069332A    mov         eax,dword ptr [edi]
 0069332C    call        @DynArrayHigh
 00693331    mov         esi,eax
 00693333    test        esi,esi
>00693335    jl          00693348
 00693337    inc         esi
 00693338    xor         ebx,ebx
 0069333A    mov         eax,dword ptr [edi]
 0069333C    lea         eax,[eax+ebx*4]
 0069333F    call        @IntfClear
 00693344    inc         ebx
 00693345    dec         esi
>00693346    jne         0069333A
 00693348    mov         eax,[0081ED1C];gvar_0081ED1C:?
 0069334D    call        @DynArrayHigh
 00693352    mov         esi,eax
 00693354    test        esi,esi
>00693356    jl          00693388
 00693358    inc         esi
 00693359    xor         ebx,ebx
 0069335B    mov         eax,[0081ED1C];gvar_0081ED1C:?
 00693360    lea         eax,[eax+ebx*4]
 00693363    call        @IntfClear
 00693368    mov         eax,[0081ED20];gvar_0081ED20:?
 0069336D    xor         edx,edx
 0069336F    mov         dword ptr [eax+ebx*8],edx
 00693372    mov         dword ptr [eax+ebx*8+4],edx
 00693376    mov         eax,[0081ED24];gvar_0081ED24:?
 0069337B    xor         edx,edx
 0069337D    mov         dword ptr [eax+ebx*8],edx
 00693380    mov         dword ptr [eax+ebx*8+4],edx
 00693384    inc         ebx
 00693385    dec         esi
>00693386    jne         0069335B
 00693388    mov         eax,[0081ED0C];gvar_0081ED0C:?
 0069338D    call        @DynArrayLength
 00693392    push        eax
 00693393    mov         eax,edi
 00693395    mov         ecx,1
 0069339A    mov         edx,dword ptr ds:[68F2CC];:4
 006933A0    call        @DynArraySetLength
 006933A5    add         esp,4
 006933A8    mov         eax,[0081ED0C];gvar_0081ED0C:?
 006933AD    call        @DynArrayLength
 006933B2    push        eax
 006933B3    mov         eax,81ED10;gvar_0081ED10:?
 006933B8    mov         ecx,1
 006933BD    mov         edx,dword ptr ds:[68F324];:6
 006933C3    call        @DynArraySetLength
 006933C8    add         esp,4
 006933CB    mov         eax,[0081ED0C];gvar_0081ED0C:?
 006933D0    call        @DynArrayLength
 006933D5    push        eax
 006933D6    mov         eax,81ED1C;gvar_0081ED1C:?
 006933DB    mov         ecx,1
 006933E0    mov         edx,dword ptr ds:[68F3A8];:9
 006933E6    call        @DynArraySetLength
 006933EB    add         esp,4
 006933EE    mov         eax,[0081ED0C];gvar_0081ED0C:?
 006933F3    call        @DynArrayLength
 006933F8    push        eax
 006933F9    mov         eax,81ED20;gvar_0081ED20:?
 006933FE    mov         ecx,1
 00693403    mov         edx,dword ptr ds:[68F3D4];:01
 00693409    call        @DynArraySetLength
 0069340E    add         esp,4
 00693411    mov         eax,[0081ED0C];gvar_0081ED0C:?
 00693416    call        @DynArrayLength
 0069341B    push        eax
 0069341C    mov         eax,81ED24;gvar_0081ED24:?
 00693421    mov         ecx,1
 00693426    mov         edx,dword ptr ds:[68F400];:11
 0069342C    call        @DynArraySetLength
 00693431    add         esp,4
 00693434    mov         eax,[0081ED0C];gvar_0081ED0C:?
 00693439    call        @DynArrayHigh
 0069343E    mov         esi,eax
 00693440    test        esi,esi
>00693442    jl          006935E5
 00693448    inc         esi
 00693449    xor         ebx,ebx
 0069344B    mov         eax,[0081ED1C];gvar_0081ED1C:?
 00693450    lea         eax,[eax+ebx*4]
 00693453    call        @IntfClear
 00693458    mov         eax,[0081ED20];gvar_0081ED20:?
 0069345D    xor         edx,edx
 0069345F    mov         dword ptr [eax+ebx*8],edx
 00693462    mov         dword ptr [eax+ebx*8+4],edx
 00693466    mov         eax,[0081ED24];gvar_0081ED24:?
 0069346B    xor         edx,edx
 0069346D    mov         dword ptr [eax+ebx*8],edx
 00693470    mov         dword ptr [eax+ebx*8+4],edx
 00693474    mov         eax,[0081ED18];gvar_0081ED18:?
 00693479    cmp         byte ptr [eax+ebx],0
>0069347D    jne         0069348D
 0069347F    mov         eax,[0078D4B0];^gvar_0078BDBC
 00693484    cmp         byte ptr [eax],0
>00693487    je          006935A6
 0069348D    push        0
 0069348F    lea         eax,[ebp-4]
 00693492    call        @IntfClear
 00693497    push        eax
 00693498    imul        eax,ebx,91
 0069349E    mov         edx,dword ptr ds:[81ED0C];gvar_0081ED0C:?
 006934A4    lea         eax,[edx+eax*4+4]
 006934A8    push        eax
 006934A9    mov         eax,[0078D628];^gvar_0078BD08:IInterface
 006934AE    mov         eax,dword ptr [eax]
 006934B0    push        eax
 006934B1    mov         eax,dword ptr [eax]
 006934B3    call        dword ptr [eax+0C]
 006934B6    mov         edx,eax
 006934B8    mov         eax,69365C;'CreateDevice'
 006934BD    call        005FF2AC
 006934C2    mov         eax,dword ptr [edi]
 006934C4    lea         eax,[eax+ebx*4]
 006934C7    mov         edx,dword ptr [ebp-4]
 006934CA    call        @IntfCopy
 006934CF    mov         eax,[0081ED14];gvar_0081ED14:?
 006934D4    cmp         byte ptr [eax+ebx],0
>006934D8    je          00693526
 006934DA    lea         edx,[ebp-0C]
 006934DD    lea         eax,[ebx+1]
 006934E0    call        IntToStr
 006934E5    mov         ecx,dword ptr [ebp-0C]
 006934E8    lea         eax,[ebp-8]
 006934EB    mov         edx,693684;'Exclusively acquiring joystick '
 006934F0    call        @UStrCat3
 006934F5    mov         eax,dword ptr [ebp-8]
 006934F8    call        004FA5FC
 006934FD    push        9
 006934FF    mov         eax,[0078D590];^Application:TApplication
 00693504    mov         eax,dword ptr [eax]
 00693506    mov         eax,dword ptr [eax+170];TApplication.FHandle:HWND
 0069350C    push        eax
 0069350D    mov         eax,dword ptr [edi]
 0069350F    mov         eax,dword ptr [eax+ebx*4]
 00693512    push        eax
 00693513    mov         eax,dword ptr [eax]
 00693515    call        dword ptr [eax+34]
 00693518    mov         edx,eax
 0069351A    mov         eax,6936D0;'SetCooperativeLevel'
 0069351F    call        005FF2AC
>00693524    jmp         00693570
 00693526    lea         edx,[ebp-14]
 00693529    lea         eax,[ebx+1]
 0069352C    call        IntToStr
 00693531    mov         ecx,dword ptr [ebp-14]
 00693534    lea         eax,[ebp-10]
 00693537    mov         edx,693704;'Acquiring joystick '
 0069353C    call        @UStrCat3
 00693541    mov         eax,dword ptr [ebp-10]
 00693544    call        004FA5FC
 00693549    push        0A
 0069354B    mov         eax,[0078D590];^Application:TApplication
 00693550    mov         eax,dword ptr [eax]
 00693552    mov         eax,dword ptr [eax+170];TApplication.FHandle:HWND
 00693558    push        eax
 00693559    mov         eax,dword ptr [edi]
 0069355B    mov         eax,dword ptr [eax+ebx*4]
 0069355E    push        eax
 0069355F    mov         eax,dword ptr [eax]
 00693561    call        dword ptr [eax+34]
 00693564    mov         edx,eax
 00693566    mov         eax,6936D0;'SetCooperativeLevel'
 0069356B    call        005FF2AC
 00693570    mov         eax,[0078CE60];^gvar_0078BC38
 00693575    push        eax
 00693576    mov         eax,dword ptr [edi]
 00693578    mov         eax,dword ptr [eax+ebx*4]
 0069357B    push        eax
 0069357C    mov         eax,dword ptr [eax]
 0069357E    call        dword ptr [eax+2C]
 00693581    mov         edx,eax
 00693583    mov         eax,693738;'SetDataFormat'
 00693588    call        005FF2AC
 0069358D    mov         eax,dword ptr [edi]
 0069358F    mov         eax,dword ptr [eax+ebx*4]
 00693592    push        eax
 00693593    mov         eax,dword ptr [eax]
 00693595    call        dword ptr [eax+1C]
 00693598    mov         edx,eax
 0069359A    mov         eax,693760;'Acquire'
 0069359F    call        005FF2AC
>006935A4    jmp         006935DD
 006935A6    push        69377C;'Joystick '
 006935AB    lea         edx,[ebp-1C]
 006935AE    lea         eax,[ebx+1]
 006935B1    call        IntToStr
 006935B6    push        dword ptr [ebp-1C]
 006935B9    push        69379C;' not used.'
 006935BE    lea         eax,[ebp-18]
 006935C1    mov         edx,3
 006935C6    call        @UStrCatN
 006935CB    mov         eax,dword ptr [ebp-18]
 006935CE    call        004FA5FC
 006935D3    mov         eax,dword ptr [edi]
 006935D5    lea         eax,[eax+ebx*4]
 006935D8    call        @IntfClear
 006935DD    inc         ebx
 006935DE    dec         esi
>006935DF    jne         0069344B
 006935E5    xor         eax,eax
 006935E7    pop         edx
 006935E8    pop         ecx
 006935E9    pop         ecx
 006935EA    mov         dword ptr fs:[eax],edx
 006935ED    push        69360F
 006935F2    lea         eax,[ebp-1C]
 006935F5    mov         edx,6
 006935FA    call        @UStrArrayClr
 006935FF    lea         eax,[ebp-4]
 00693602    call        @IntfClear
 00693607    ret
>00693608    jmp         @HandleFinally
>0069360D    jmp         006935F2
 0069360F    pop         edi
 00693610    pop         esi
 00693611    pop         ebx
 00693612    mov         esp,ebp
 00693614    pop         ebp
 00693615    ret
*}
end;

//006937B4
procedure sub_006937B4;
begin
{*
 006937B4    push        ebp
 006937B5    mov         ebp,esp
 006937B7    xor         ecx,ecx
 006937B9    push        ecx
 006937BA    push        ecx
 006937BB    push        ecx
 006937BC    push        ecx
 006937BD    push        ebx
 006937BE    push        esi
 006937BF    push        edi
 006937C0    mov         esi,81ED28;gvar_0081ED28
 006937C5    xor         eax,eax
 006937C7    push        ebp
 006937C8    push        693927
 006937CD    push        dword ptr fs:[eax]
 006937D0    mov         dword ptr fs:[eax],esp
 006937D3    mov         byte ptr [ebp-1],0
 006937D7    mov         eax,693944;'CreateForceFeedbackDevices'
 006937DC    call        004FA5FC
 006937E1    mov         eax,[0081ED14];gvar_0081ED14:?
 006937E6    call        @DynArrayHigh
 006937EB    mov         edi,eax
 006937ED    test        edi,edi
>006937EF    jl          006938FC
 006937F5    inc         edi
 006937F6    xor         ebx,ebx
 006937F8    push        693988;'JoystickFFUsed['
 006937FD    lea         edx,[ebp-0C]
 00693800    mov         eax,ebx
 00693802    call        IntToStr
 00693807    push        dword ptr [ebp-0C]
 0069380A    push        6939B4;'] = '
 0069380F    lea         ecx,[ebp-10]
 00693812    mov         eax,[0081ED14];gvar_0081ED14:?
 00693817    movzx       eax,byte ptr [eax+ebx]
 0069381B    mov         dl,1
 0069381D    call        BoolToStr
 00693822    push        dword ptr [ebp-10]
 00693825    lea         eax,[ebp-8]
 00693828    mov         edx,4
 0069382D    call        @UStrCatN
 00693832    mov         eax,dword ptr [ebp-8]
 00693835    call        004FA5FC
 0069383A    mov         eax,[0081ED14];gvar_0081ED14:?
 0069383F    cmp         byte ptr [eax+ebx],0
>00693843    je          006938F4
 00693849    mov         eax,[0078D4B0];^gvar_0078BDBC
 0069384E    cmp         byte ptr [eax],0
>00693851    je          00693861
 00693853    mov         eax,6939CC;'Please temporarily unplug all P5 Virtual Reality Gloves.'
 00693858    call        ShowMessage
 0069385D    mov         byte ptr [ebp-1],1
 00693861    mov         dword ptr ds:[81ED5C],2710;gvar_0081ED5C
 0069386B    mov         dword ptr [esi],34
 00693871    mov         dword ptr [esi+4],12
 00693878    mov         dword ptr [esi+8],0FFFFFFFF
 0069387F    xor         eax,eax
 00693881    mov         dword ptr [esi+0C],eax
 00693884    mov         dword ptr [esi+10],2710
 0069388B    mov         dword ptr [esi+14],0FFFFFFFF
 00693892    xor         eax,eax
 00693894    mov         dword ptr [esi+18],eax
 00693897    mov         dword ptr [esi+1C],2
 0069389E    mov         eax,78BDE8
 006938A3    mov         dword ptr [esi+20],eax
 006938A6    mov         eax,78BDF0
 006938AB    mov         dword ptr [esi+24],eax
 006938AE    xor         eax,eax
 006938B0    mov         dword ptr [esi+28],eax
 006938B3    mov         dword ptr [esi+2C],4
 006938BA    mov         dword ptr [esi+30],81ED5C;gvar_0081ED5C
 006938C1    push        0
 006938C3    mov         eax,[0081ED1C];gvar_0081ED1C:?
 006938C8    lea         eax,[eax+ebx*4]
 006938CB    call        @IntfClear
 006938D0    push        eax
 006938D1    push        esi
 006938D2    mov         eax,[0078D09C];^gvar_0078A108
 006938D7    push        eax
 006938D8    mov         eax,[0081ED08];gvar_0081ED08:?
 006938DD    mov         eax,dword ptr [eax+ebx*4]
 006938E0    push        eax
 006938E1    mov         eax,dword ptr [eax]
 006938E3    call        dword ptr [eax+48]
 006938E6    mov         edx,eax
 006938E8    mov         eax,693A4C;'CreateEffect'
 006938ED    call        005FF2AC
>006938F2    jmp         006938FC
 006938F4    inc         ebx
 006938F5    dec         edi
>006938F6    jne         006937F8
 006938FC    cmp         byte ptr [ebp-1],0
>00693900    je          0069390C
 00693902    mov         eax,693A74;'Please plug all P5 Virtual Reality Gloves back in.'
 00693907    call        ShowMessage
 0069390C    xor         eax,eax
 0069390E    pop         edx
 0069390F    pop         ecx
 00693910    pop         ecx
 00693911    mov         dword ptr fs:[eax],edx
 00693914    push        69392E
 00693919    lea         eax,[ebp-10]
 0069391C    mov         edx,3
 00693921    call        @UStrArrayClr
 00693926    ret
>00693927    jmp         @HandleFinally
>0069392C    jmp         00693919
 0069392E    pop         edi
 0069392F    pop         esi
 00693930    pop         ebx
 00693931    mov         esp,ebp
 00693933    pop         ebp
 00693934    ret
*}
end;

//00693ADC
{*function sub_00693ADC:?;
begin
 00693ADC    call        00693D08
 00693AE1    test        al,al
>00693AE3    je          00693AE8
 00693AE5    xor         eax,eax
 00693AE7    ret
 00693AE8    mov         eax,693B1C;'StartJoystickMonitor'
 00693AED    call        004FA5FC
 00693AF2    mov         eax,693B54;'Joystick'
 00693AF7    call        005FCBA0
 00693AFC    call        0068F518
 00693B01    call        006932E0
 00693B06    call        006937B4
 00693B0B    mov         al,1
 00693B0D    ret
end;*}

//00693B68
{*function sub_00693B68:?;
begin
 00693B68    push        ebp
 00693B69    mov         ebp,esp
 00693B6B    add         esp,0FFFFFFF8
 00693B6E    push        ebx
 00693B6F    push        esi
 00693B70    push        edi
 00693B71    call        00693D08
 00693B76    test        al,al
>00693B78    jne         00693B81
 00693B7A    xor         eax,eax
>00693B7C    jmp         00693C94
 00693B81    mov         eax,[0078D4B0];^gvar_0078BDBC
 00693B86    cmp         byte ptr [eax],0
>00693B89    je          00693B92
 00693B8B    xor         eax,eax
>00693B8D    jmp         00693C94
 00693B92    mov         eax,693CA8;'StopJoystickMonitor'
 00693B97    call        004FA5FC
 00693B9C    mov         byte ptr ds:[78BDE4],0;gvar_0078BDE4
 00693BA3    mov         eax,[0081ED08];gvar_0081ED08:?
 00693BA8    call        @DynArrayHigh
 00693BAD    test        eax,eax
>00693BAF    jl          00693C6E
 00693BB5    inc         eax
 00693BB6    mov         dword ptr [ebp-8],eax
 00693BB9    mov         dword ptr [ebp-4],0
 00693BC0    mov         eax,[0081ED1C];gvar_0081ED1C:?
 00693BC5    mov         edx,dword ptr [ebp-4]
 00693BC8    cmp         dword ptr [eax+edx*4],0
>00693BCC    je          00693C2E
 00693BCE    xor         edx,edx
 00693BD0    push        ebp
 00693BD1    push        693C03
 00693BD6    push        dword ptr fs:[edx]
 00693BD9    mov         dword ptr fs:[edx],esp
 00693BDC    mov         eax,[0081ED1C];gvar_0081ED1C:?
 00693BE1    mov         edx,dword ptr [ebp-4]
 00693BE4    mov         eax,dword ptr [eax+edx*4]
 00693BE7    push        eax
 00693BE8    mov         eax,dword ptr [eax]
 00693BEA    call        dword ptr [eax+20]
 00693BED    mov         edx,eax
 00693BEF    mov         eax,693CDC;'Stop'
 00693BF4    call        005FF2AC
 00693BF9    xor         eax,eax
 00693BFB    pop         edx
 00693BFC    pop         ecx
 00693BFD    pop         ecx
 00693BFE    mov         dword ptr fs:[eax],edx
>00693C01    jmp         00693C1E
>00693C03    jmp         @HandleOnException
 00693C08    dd          1
 00693C0C    dd          00418C04;Exception
 00693C10    dd          00693C14
 00693C14    call        004FA644
 00693C19    call        @DoneExcept
 00693C1E    mov         eax,[0081ED1C];gvar_0081ED1C:?
 00693C23    mov         edx,dword ptr [ebp-4]
 00693C26    lea         eax,[eax+edx*4]
 00693C29    call        @IntfClear
 00693C2E    mov         eax,[0081ED08];gvar_0081ED08:?
 00693C33    mov         edx,dword ptr [ebp-4]
 00693C36    cmp         dword ptr [eax+edx*4],0
>00693C3A    je          00693C62
 00693C3C    mov         eax,[0081ED08];gvar_0081ED08:?
 00693C41    mov         edx,dword ptr [ebp-4]
 00693C44    mov         eax,dword ptr [eax+edx*4]
 00693C47    push        eax
 00693C48    mov         eax,dword ptr [eax]
 00693C4A    call        dword ptr [eax+20]
 00693C4D    call        OleCheck
 00693C52    mov         eax,[0081ED08];gvar_0081ED08:?
 00693C57    mov         edx,dword ptr [ebp-4]
 00693C5A    lea         eax,[eax+edx*4]
 00693C5D    call        @IntfClear
 00693C62    inc         dword ptr [ebp-4]
 00693C65    dec         dword ptr [ebp-8]
>00693C68    jne         00693BC0
 00693C6E    push        0
 00693C70    mov         eax,81ED08;gvar_0081ED08:?
 00693C75    mov         ecx,1
 00693C7A    mov         edx,dword ptr ds:[68F2CC];:4
 00693C80    call        @DynArraySetLength
 00693C85    add         esp,4
 00693C88    mov         eax,693CF4;'Joystick'
 00693C8D    call        005FCC94
 00693C92    mov         al,1
 00693C94    pop         edi
 00693C95    pop         esi
 00693C96    pop         ebx
 00693C97    pop         ecx
 00693C98    pop         ecx
 00693C99    pop         ebp
 00693C9A    ret
end;*}

//00693D08
{*function sub_00693D08:?;
begin
 00693D08    call        005FCB94
 00693D0D    test        al,al
>00693D0F    je          00693D1A
 00693D11    cmp         byte ptr ds:[78BDE4],0;gvar_0078BDE4
>00693D18    jne         00693D1D
 00693D1A    xor         eax,eax
 00693D1C    ret
 00693D1D    mov         al,1
 00693D1F    ret
end;*}

//00693D20
{*function sub_00693D20:?;
begin
 00693D20    push        ebp
 00693D21    mov         ebp,esp
 00693D23    add         esp,0FFFFFFF8
 00693D26    push        ebx
 00693D27    push        esi
 00693D28    push        edi
 00693D29    mov         eax,[0081ED10];gvar_0081ED10:?
 00693D2E    call        @DynArrayLength
 00693D33    test        eax,eax
>00693D35    jg          00693D51
 00693D37    push        1
 00693D39    mov         eax,81ED10;gvar_0081ED10:?
 00693D3E    mov         ecx,1
 00693D43    mov         edx,dword ptr ds:[68F324];:6
 00693D49    call        @DynArraySetLength
 00693D4E    add         esp,4
 00693D51    call        00693D08
 00693D56    test        al,al
>00693D58    jne         00693D61
 00693D5A    xor         eax,eax
>00693D5C    jmp         00693E32
 00693D61    mov         eax,[0081ED08];gvar_0081ED08:?
 00693D66    call        @DynArrayLength
 00693D6B    dec         eax
 00693D6C    test        eax,eax
>00693D6E    jl          00693E30
 00693D74    inc         eax
 00693D75    mov         dword ptr [ebp-8],eax
 00693D78    mov         dword ptr [ebp-4],0
 00693D7F    mov         eax,[0081ED08];gvar_0081ED08:?
 00693D84    mov         edx,dword ptr [ebp-4]
 00693D87    cmp         dword ptr [eax+edx*4],0
>00693D8B    je          00693E24
 00693D91    xor         eax,eax
 00693D93    push        ebp
 00693D94    push        693DC6
 00693D99    push        dword ptr fs:[eax]
 00693D9C    mov         dword ptr fs:[eax],esp
 00693D9F    mov         eax,[0081ED08];gvar_0081ED08:?
 00693DA4    mov         edx,dword ptr [ebp-4]
 00693DA7    mov         eax,dword ptr [eax+edx*4]
 00693DAA    push        eax
 00693DAB    mov         eax,dword ptr [eax]
 00693DAD    call        dword ptr [eax+64]
 00693DB0    mov         edx,eax
 00693DB2    mov         eax,693E48;'Poll'
 00693DB7    call        005FF2AC
 00693DBC    xor         eax,eax
 00693DBE    pop         edx
 00693DBF    pop         ecx
 00693DC0    pop         ecx
 00693DC1    mov         dword ptr fs:[eax],edx
>00693DC4    jmp         00693DD0
>00693DC6    jmp         @HandleAnyException
 00693DCB    call        @DoneExcept
 00693DD0    xor         eax,eax
 00693DD2    push        ebp
 00693DD3    push        693E1A
 00693DD8    push        dword ptr fs:[eax]
 00693DDB    mov         dword ptr fs:[eax],esp
 00693DDE    imul        eax,dword ptr [ebp-4],22
 00693DE2    mov         edx,dword ptr ds:[81ED10];gvar_0081ED10:?
 00693DE8    lea         eax,[edx+eax*8]
 00693DEB    push        eax
 00693DEC    push        110
 00693DF1    mov         eax,[0081ED08];gvar_0081ED08:?
 00693DF6    mov         edx,dword ptr [ebp-4]
 00693DF9    mov         eax,dword ptr [eax+edx*4]
 00693DFC    push        eax
 00693DFD    mov         eax,dword ptr [eax]
 00693DFF    call        dword ptr [eax+24]
 00693E02    mov         edx,eax
 00693E04    mov         eax,693E60;'GetDeviceState'
 00693E09    call        005FF2AC
 00693E0E    test        al,al
 00693E10    xor         eax,eax
 00693E12    pop         edx
 00693E13    pop         ecx
 00693E14    pop         ecx
 00693E15    mov         dword ptr fs:[eax],edx
>00693E18    jmp         00693E24
>00693E1A    jmp         @HandleAnyException
 00693E1F    call        @DoneExcept
 00693E24    inc         dword ptr [ebp-4]
 00693E27    dec         dword ptr [ebp-8]
>00693E2A    jne         00693D7F
 00693E30    mov         al,1
 00693E32    pop         edi
 00693E33    pop         esi
 00693E34    pop         ebx
 00693E35    pop         ecx
 00693E36    pop         ecx
 00693E37    pop         ebp
 00693E38    ret
end;*}

//00693E80
{*procedure sub_00693E80(?:?; ?:?; ?:?);
begin
 00693E80    push        ebp
 00693E81    mov         ebp,esp
 00693E83    push        dword ptr [ebp+0C]
 00693E86    push        dword ptr [ebp+8]
 00693E89    mov         edx,dword ptr ds:[81ED24];gvar_0081ED24:?
 00693E8F    push        dword ptr [edx+eax*8-4]
 00693E93    push        dword ptr [edx+eax*8-8]
 00693E97    call        00693EC0
 00693E9C    pop         ebp
 00693E9D    ret         8
end;*}

//00693EA0
{*procedure sub_00693EA0(?:?; ?:?; ?:?);
begin
 00693EA0    push        ebp
 00693EA1    mov         ebp,esp
 00693EA3    mov         edx,dword ptr ds:[81ED20];gvar_0081ED20:?
 00693EA9    push        dword ptr [edx+eax*8-4]
 00693EAD    push        dword ptr [edx+eax*8-8]
 00693EB1    push        dword ptr [ebp+0C]
 00693EB4    push        dword ptr [ebp+8]
 00693EB7    call        00693EC0
 00693EBC    pop         ebp
 00693EBD    ret         8
end;*}

//00693EC0
{*procedure sub_00693EC0(?:Integer; ?:?; ?:?; ?:?; ?:?);
begin
 00693EC0    push        ebp
 00693EC1    mov         ebp,esp
 00693EC3    add         esp,0FFFFFFF0
 00693EC6    push        ebx
 00693EC7    push        esi
 00693EC8    push        edi
 00693EC9    mov         ebx,eax
 00693ECB    mov         esi,81ED28;gvar_0081ED28
 00693ED0    xor         edx,edx
 00693ED2    push        ebp
 00693ED3    push        69416B
 00693ED8    push        dword ptr fs:[edx]
 00693EDB    mov         dword ptr fs:[edx],esp
 00693EDE    dec         ebx
 00693EDF    call        00693D08
 00693EE4    test        al,al
>00693EE6    je          00693EFA
 00693EE8    test        ebx,ebx
>00693EEA    jl          00693EFA
 00693EEC    mov         eax,[0081ED08];gvar_0081ED08:?
 00693EF1    call        @DynArrayHigh
 00693EF6    cmp         ebx,eax
>00693EF8    jle         00693F07
 00693EFA    xor         eax,eax
 00693EFC    pop         edx
 00693EFD    pop         ecx
 00693EFE    pop         ecx
 00693EFF    mov         dword ptr fs:[eax],edx
>00693F02    jmp         00694186
 00693F07    fld         qword ptr [ebp+10]
 00693F0A    fcomp       dword ptr ds:[694190];-1:Single
 00693F10    wait
 00693F11    fnstsw      al
 00693F13    sahf
>00693F14    jae         00693F22
 00693F16    xor         eax,eax
 00693F18    mov         dword ptr [ebp+10],eax
 00693F1B    mov         dword ptr [ebp+14],0BFF00000
 00693F22    fld         qword ptr [ebp+10]
 00693F25    fcomp       dword ptr ds:[694194];1:Single
 00693F2B    wait
 00693F2C    fnstsw      al
 00693F2E    sahf
>00693F2F    jbe         00693F3D
 00693F31    xor         eax,eax
 00693F33    mov         dword ptr [ebp+10],eax
 00693F36    mov         dword ptr [ebp+14],3FF00000
 00693F3D    fld         qword ptr [ebp+8]
 00693F40    fcomp       dword ptr ds:[694190];-1:Single
 00693F46    wait
 00693F47    fnstsw      al
 00693F49    sahf
>00693F4A    jae         00693F58
 00693F4C    xor         eax,eax
 00693F4E    mov         dword ptr [ebp+8],eax
 00693F51    mov         dword ptr [ebp+0C],0BFF00000
 00693F58    fld         qword ptr [ebp+8]
 00693F5B    fcomp       dword ptr ds:[694194];1:Single
 00693F61    wait
 00693F62    fnstsw      al
 00693F64    sahf
>00693F65    jbe         00693F73
 00693F67    xor         eax,eax
 00693F69    mov         dword ptr [ebp+8],eax
 00693F6C    mov         dword ptr [ebp+0C],3FF00000
 00693F73    fld         qword ptr [ebp+10]
 00693F76    mov         eax,[0081ED20];gvar_0081ED20:?
 00693F7B    fcomp       qword ptr [eax+ebx*8]
 00693F7E    wait
 00693F7F    fnstsw      al
 00693F81    sahf
>00693F82    jne         00693FA2
 00693F84    fld         qword ptr [ebp+8]
 00693F87    mov         eax,[0081ED24];gvar_0081ED24:?
 00693F8C    fcomp       qword ptr [eax+ebx*8]
 00693F8F    wait
 00693F90    fnstsw      al
 00693F92    sahf
>00693F93    jne         00693FA2
 00693F95    xor         eax,eax
 00693F97    pop         edx
 00693F98    pop         ecx
 00693F99    pop         ecx
 00693F9A    mov         dword ptr fs:[eax],edx
>00693F9D    jmp         00694186
 00693FA2    push        dword ptr [ebp+14]
 00693FA5    push        dword ptr [ebp+10]
 00693FA8    push        dword ptr [ebp+0C]
 00693FAB    push        dword ptr [ebp+8]
 00693FAE    push        0
 00693FB0    push        0
 00693FB2    call        005C4070
 00693FB7    fstp        qword ptr [ebp-10]
 00693FBA    wait
 00693FBB    mov         eax,[0081ED20];gvar_0081ED20:?
 00693FC0    mov         edx,dword ptr [ebp+10]
 00693FC3    mov         dword ptr [eax+ebx*8],edx
 00693FC6    mov         edx,dword ptr [ebp+14]
 00693FC9    mov         dword ptr [eax+ebx*8+4],edx
 00693FCD    mov         eax,[0081ED24];gvar_0081ED24:?
 00693FD2    mov         edx,dword ptr [ebp+8]
 00693FD5    mov         dword ptr [eax+ebx*8],edx
 00693FD8    mov         edx,dword ptr [ebp+0C]
 00693FDB    mov         dword ptr [eax+ebx*8+4],edx
 00693FDF    fld         qword ptr [ebp+10]
 00693FE2    fmul        dword ptr ds:[694198];1000:Single
 00693FE8    call        @ROUND
 00693FED    mov         dword ptr [ebp-8],eax
 00693FF0    fld         qword ptr [ebp+8]
 00693FF3    fmul        dword ptr ds:[694198];1000:Single
 00693FF9    call        @ROUND
 00693FFE    mov         dword ptr [ebp-4],eax
 00694001    fld         qword ptr [ebp-10]
 00694004    fcomp       dword ptr ds:[69419C];0:Single
 0069400A    wait
 0069400B    fnstsw      al
 0069400D    sahf
>0069400E    jne         00694042
 00694010    mov         eax,[0081ED1C];gvar_0081ED1C:?
 00694015    cmp         dword ptr [eax+ebx*4],0
>00694019    je          00694035
 0069401B    mov         eax,[0081ED1C];gvar_0081ED1C:?
 00694020    mov         eax,dword ptr [eax+ebx*4]
 00694023    push        eax
 00694024    mov         eax,dword ptr [eax]
 00694026    call        dword ptr [eax+20]
 00694029    mov         edx,eax
 0069402B    mov         eax,6941AC;'Stop'
 00694030    call        005FF2AC
 00694035    xor         eax,eax
 00694037    pop         edx
 00694038    pop         ecx
 00694039    pop         ecx
 0069403A    mov         dword ptr fs:[eax],edx
>0069403D    jmp         00694186
 00694042    mov         dword ptr ds:[81ED5C],2710;gvar_0081ED5C
 0069404C    mov         dword ptr [esi],34
 00694052    mov         dword ptr [esi+4],12
 00694059    mov         dword ptr [esi+8],0FFFFFFFF
 00694060    xor         eax,eax
 00694062    mov         dword ptr [esi+0C],eax
 00694065    mov         dword ptr [esi+10],2710
 0069406C    mov         dword ptr [esi+14],0FFFFFFFF
 00694073    xor         eax,eax
 00694075    mov         dword ptr [esi+18],eax
 00694078    mov         dword ptr [esi+1C],2
 0069407F    mov         eax,78BDF8
 00694084    mov         dword ptr [esi+20],eax
 00694087    lea         eax,[ebp-8]
 0069408A    mov         dword ptr [esi+24],eax
 0069408D    xor         eax,eax
 0069408F    mov         dword ptr [esi+28],eax
 00694092    mov         dword ptr [esi+2C],4
 00694099    mov         dword ptr [esi+30],81ED5C;gvar_0081ED5C
 006940A0    mov         eax,[0081ED1C];gvar_0081ED1C:?
 006940A5    cmp         dword ptr [eax+ebx*4],0
>006940A9    jne         006940DE
 006940AB    push        0
 006940AD    mov         eax,[0081ED1C];gvar_0081ED1C:?
 006940B2    lea         eax,[eax+ebx*4]
 006940B5    call        @IntfClear
 006940BA    push        eax
 006940BB    push        esi
 006940BC    mov         eax,[0078D09C];^gvar_0078A108
 006940C1    push        eax
 006940C2    mov         eax,[0081ED08];gvar_0081ED08:?
 006940C7    mov         eax,dword ptr [eax+ebx*4]
 006940CA    push        eax
 006940CB    mov         eax,dword ptr [eax]
 006940CD    call        dword ptr [eax+48]
 006940D0    mov         edx,eax
 006940D2    mov         eax,6941C4;'CreateEffect'
 006940D7    call        005FF2AC
>006940DC    jmp         00694143
 006940DE    mov         dword ptr [esi],34
 006940E4    mov         dword ptr [esi+4],12
 006940EB    mov         dword ptr [esi+2C],4
 006940F2    mov         dword ptr [esi+1C],2
 006940F9    mov         eax,78BDF8
 006940FE    mov         dword ptr [esi+20],eax
 00694101    lea         eax,[ebp-8]
 00694104    mov         dword ptr [esi+24],eax
 00694107    mov         dword ptr [esi+30],81ED5C;gvar_0081ED5C
 0069410E    fld         qword ptr [ebp-10]
 00694111    fabs
 00694113    fmul        dword ptr ds:[6941E0];10000:Single
 00694119    call        @ROUND
 0069411E    mov         [0081ED5C],eax;gvar_0081ED5C
 00694123    push        140
 00694128    push        esi
 00694129    mov         eax,[0081ED1C];gvar_0081ED1C:?
 0069412E    mov         eax,dword ptr [eax+ebx*4]
 00694131    push        eax
 00694132    mov         eax,dword ptr [eax]
 00694134    call        dword ptr [eax+18]
 00694137    mov         edx,eax
 00694139    mov         eax,6941F0;'SetParameters'
 0069413E    call        005FF2AC
 00694143    push        0
 00694145    push        1
 00694147    mov         eax,[0081ED1C];gvar_0081ED1C:?
 0069414C    mov         eax,dword ptr [eax+ebx*4]
 0069414F    push        eax
 00694150    mov         eax,dword ptr [eax]
 00694152    call        dword ptr [eax+1C]
 00694155    mov         edx,eax
 00694157    mov         eax,694218;'Start'
 0069415C    call        005FF2AC
 00694161    xor         eax,eax
 00694163    pop         edx
 00694164    pop         ecx
 00694165    pop         ecx
 00694166    mov         dword ptr fs:[eax],edx
>00694169    jmp         00694186
>0069416B    jmp         @HandleOnException
 00694170    dd          1
 00694174    dd          00418C04;Exception
 00694178    dd          0069417C
 0069417C    call        004FA644
 00694181    call        @DoneExcept
 00694186    pop         edi
 00694187    pop         esi
 00694188    pop         ebx
 00694189    mov         esp,ebp
 0069418B    pop         ebp
 0069418C    ret         10
end;*}

//00694224
{*procedure sub_00694224(?:Integer; ?:?);
begin
 00694224    push        ebx
 00694225    push        esi
 00694226    mov         esi,edx
 00694228    mov         ebx,eax
 0069422A    dec         ebx
 0069422B    test        ebx,ebx
>0069422D    jl          0069423D
 0069422F    mov         eax,[0081ED0C];gvar_0081ED0C:?
 00694234    call        @DynArrayHigh
 00694239    cmp         ebx,eax
>0069423B    jle         00694247
 0069423D    mov         eax,esi
 0069423F    call        @UStrClr
 00694244    pop         esi
 00694245    pop         ebx
 00694246    ret
 00694247    mov         eax,esi
 00694249    imul        edx,ebx,91
 0069424F    mov         ecx,dword ptr ds:[81ED0C];gvar_0081ED0C:?
 00694255    lea         edx,[ecx+edx*4+28]
 00694259    mov         ecx,104
 0069425E    call        @UStrFromArray
 00694263    pop         esi
 00694264    pop         ebx
 00694265    ret
end;*}

//00694268
{*function sub_00694268(?:?):?;
begin
 00694268    push        ebx
 00694269    mov         ebx,eax
 0069426B    dec         ebx
 0069426C    test        ebx,ebx
>0069426E    jl          0069427E
 00694270    mov         eax,[0081ED0C];gvar_0081ED0C:?
 00694275    call        @DynArrayHigh
 0069427A    cmp         ebx,eax
>0069427C    jle         00694282
 0069427E    xor         eax,eax
 00694280    pop         ebx
 00694281    ret
 00694282    imul        eax,ebx,91
 00694288    mov         edx,dword ptr ds:[81ED0C];gvar_0081ED0C:?
 0069428E    mov         eax,dword ptr [edx+eax*4+24]
 00694292    pop         ebx
 00694293    ret
end;*}

//00694294
{*procedure sub_00694294(?:Integer; ?:?);
begin
 00694294    push        ebx
 00694295    push        esi
 00694296    mov         esi,edx
 00694298    mov         ebx,eax
 0069429A    dec         ebx
 0069429B    test        ebx,ebx
>0069429D    jl          006942AD
 0069429F    mov         eax,[0081ED0C];gvar_0081ED0C:?
 006942A4    call        @DynArrayHigh
 006942A9    cmp         ebx,eax
>006942AB    jle         006942B7
 006942AD    mov         eax,esi
 006942AF    call        @UStrClr
 006942B4    pop         esi
 006942B5    pop         ebx
 006942B6    ret
 006942B7    mov         eax,esi
 006942B9    imul        edx,ebx,91
 006942BF    mov         ecx,dword ptr ds:[81ED0C];gvar_0081ED0C:?
 006942C5    lea         edx,[ecx+edx*4+12C]
 006942CC    mov         ecx,104
 006942D1    call        @UStrFromArray
 006942D6    pop         esi
 006942D7    pop         ebx
 006942D8    ret
end;*}

//006942DC
{*procedure sub_006942DC(?:Integer; ?:?);
begin
 006942DC    push        ebx
 006942DD    push        esi
 006942DE    mov         esi,edx
 006942E0    mov         ebx,eax
 006942E2    dec         ebx
 006942E3    test        ebx,ebx
>006942E5    jl          006942F5
 006942E7    mov         eax,[0081ED0C];gvar_0081ED0C:?
 006942EC    call        @DynArrayHigh
 006942F1    cmp         ebx,eax
>006942F3    jle         006942FF
 006942F5    mov         eax,esi
 006942F7    call        @UStrClr
 006942FC    pop         esi
 006942FD    pop         ebx
 006942FE    ret
 006942FF    imul        eax,ebx,91
 00694305    mov         edx,dword ptr ds:[81ED0C];gvar_0081ED0C:?
 0069430B    lea         eax,[edx+eax*4+4]
 0069430F    mov         edx,esi
 00694311    call        GUIDToString
 00694316    pop         esi
 00694317    pop         ebx
 00694318    ret
end;*}

//0069431C
{*procedure sub_0069431C(?:Integer; ?:?);
begin
 0069431C    push        ebx
 0069431D    push        esi
 0069431E    mov         esi,edx
 00694320    mov         ebx,eax
 00694322    dec         ebx
 00694323    test        ebx,ebx
>00694325    jl          00694335
 00694327    mov         eax,[0081ED0C];gvar_0081ED0C:?
 0069432C    call        @DynArrayHigh
 00694331    cmp         ebx,eax
>00694333    jle         0069433F
 00694335    mov         eax,esi
 00694337    call        @UStrClr
 0069433C    pop         esi
 0069433D    pop         ebx
 0069433E    ret
 0069433F    imul        eax,ebx,91
 00694345    mov         edx,dword ptr ds:[81ED0C];gvar_0081ED0C:?
 0069434B    lea         eax,[edx+eax*4+14]
 0069434F    mov         edx,esi
 00694351    call        GUIDToString
 00694356    pop         esi
 00694357    pop         ebx
 00694358    ret
end;*}

//0069435C
{*procedure sub_0069435C(?:Integer; ?:?);
begin
 0069435C    push        ebx
 0069435D    push        esi
 0069435E    mov         esi,edx
 00694360    mov         ebx,eax
 00694362    dec         ebx
 00694363    test        ebx,ebx
>00694365    jl          00694375
 00694367    mov         eax,[0081ED0C];gvar_0081ED0C:?
 0069436C    call        @DynArrayHigh
 00694371    cmp         ebx,eax
>00694373    jle         0069437F
 00694375    mov         eax,esi
 00694377    call        @UStrClr
 0069437C    pop         esi
 0069437D    pop         ebx
 0069437E    ret
 0069437F    imul        eax,ebx,91
 00694385    mov         edx,dword ptr ds:[81ED0C];gvar_0081ED0C:?
 0069438B    lea         eax,[edx+eax*4+230]
 00694392    mov         edx,esi
 00694394    call        GUIDToString
 00694399    pop         esi
 0069439A    pop         ebx
 0069439B    ret
end;*}

//0069439C
{*function sub_0069439C(?:Integer):?;
begin
 0069439C    push        ebx
 0069439D    mov         ebx,eax
 0069439F    dec         ebx
 006943A0    test        ebx,ebx
>006943A2    jl          006943B2
 006943A4    mov         eax,[0081ED0C];gvar_0081ED0C:?
 006943A9    call        @DynArrayHigh
 006943AE    cmp         ebx,eax
>006943B0    jle         006943B6
 006943B2    xor         eax,eax
 006943B4    pop         ebx
 006943B5    ret
 006943B6    imul        eax,ebx,91
 006943BC    mov         edx,dword ptr ds:[81ED0C];gvar_0081ED0C:?
 006943C2    movzx       eax,word ptr [edx+eax*4+242]
 006943CA    pop         ebx
 006943CB    ret
end;*}

//006943CC
{*function sub_006943CC(?:Integer):?;
begin
 006943CC    push        ebx
 006943CD    mov         ebx,eax
 006943CF    dec         ebx
 006943D0    test        ebx,ebx
>006943D2    jl          006943E2
 006943D4    mov         eax,[0081ED0C];gvar_0081ED0C:?
 006943D9    call        @DynArrayHigh
 006943DE    cmp         ebx,eax
>006943E0    jle         006943E6
 006943E2    xor         eax,eax
 006943E4    pop         ebx
 006943E5    ret
 006943E6    imul        eax,ebx,91
 006943EC    mov         edx,dword ptr ds:[81ED0C];gvar_0081ED0C:?
 006943F2    movzx       eax,word ptr [edx+eax*4+240]
 006943FA    pop         ebx
 006943FB    ret
end;*}

//006943FC
procedure sub_006943FC;
begin
{*
 006943FC    call        00693D20
 00694401    ret
*}
end;

//00694404
{*procedure TJoystickValue.ToString(?:?);
begin
 00694404    push        ebp
 00694405    mov         ebp,esp
 00694407    push        0
 00694409    push        0
 0069440B    push        0
 0069440D    push        ebx
 0069440E    push        esi
 0069440F    push        edi
 00694410    mov         esi,edx
 00694412    mov         ebx,eax
 00694414    xor         eax,eax
 00694416    push        ebp
 00694417    push        694492
 0069441C    push        dword ptr fs:[eax]
 0069441F    mov         dword ptr fs:[eax],esp
 00694422    mov         edi,dword ptr [ebx+18];TJoystickValue......................................................
 00694425    cmp         edi,1
>00694428    jle         0069445D
 0069442A    push        6944AC;'Joystick'
 0069442F    lea         edx,[ebp-4]
 00694432    mov         eax,edi
 00694434    call        IntToStr
 00694439    push        dword ptr [ebp-4]
 0069443C    push        6944CC;'.'
 00694441    lea         edx,[ebp-8]
 00694444    mov         eax,dword ptr [ebx+20];TJoystickValue...................................Item:Integer
 00694447    call        0068F7BC
 0069444C    push        dword ptr [ebp-8]
 0069444F    mov         eax,esi
 00694451    mov         edx,4
 00694456    call        @UStrCatN
>0069445B    jmp         00694477
 0069445D    lea         edx,[ebp-0C]
 00694460    mov         eax,dword ptr [ebx+20];TJoystickValue....................................Item:Integer
 00694463    call        0068F7BC
 00694468    mov         ecx,dword ptr [ebp-0C]
 0069446B    mov         eax,esi
 0069446D    mov         edx,6944DC;'Joystick.'
 00694472    call        @UStrCat3
 00694477    xor         eax,eax
 00694479    pop         edx
 0069447A    pop         ecx
 0069447B    pop         ecx
 0069447C    mov         dword ptr fs:[eax],edx
 0069447F    push        694499
 00694484    lea         eax,[ebp-0C]
 00694487    mov         edx,3
 0069448C    call        @UStrArrayClr
 00694491    ret
>00694492    jmp         @HandleFinally
>00694497    jmp         00694484
 00694499    pop         edi
 0069449A    pop         esi
 0069449B    pop         ebx
 0069449C    mov         esp,ebp
 0069449E    pop         ebp
 0069449F    ret
end;*}

//006944F0
procedure sub_006944F0;
begin
{*
 006944F0    ret
*}
end;

//006944F4
{*function sub_006944F4(?:string):?;
begin
 006944F4    push        ebp
 006944F5    mov         ebp,esp
 006944F7    add         esp,0FFFFFFF8
 006944FA    push        ebx
 006944FB    push        esi
 006944FC    push        edi
 006944FD    xor         edx,edx
 006944FF    mov         dword ptr [ebp-8],edx
 00694502    mov         dword ptr [ebp-4],eax
 00694505    mov         eax,dword ptr [ebp-4]
 00694508    call        @UStrAddRef
 0069450D    xor         eax,eax
 0069450F    push        ebp
 00694510    push        69485E
 00694515    push        dword ptr fs:[eax]
 00694518    mov         dword ptr fs:[eax],esp
 0069451B    xor         edi,edi
 0069451D    lea         eax,[ebp-8]
 00694520    mov         edx,dword ptr [ebp-4]
 00694523    call        @UStrLAsg
 00694528    mov         eax,dword ptr [ebp-8]
 0069452B    call        0068F244
 00694530    test        al,al
>00694532    je          00694551
 00694534    lea         eax,[ebp-8]
 00694537    mov         edx,69487C;'jb'
 0069453C    call        004F9BD0
 00694541    lea         eax,[ebp-8]
 00694544    mov         ecx,dword ptr [ebp-8]
 00694547    mov         edx,694890;'Joystick.Button'
 0069454C    call        @UStrCat3
 00694551    lea         eax,[ebp-8]
 00694554    mov         edx,6948BC;'joysticks'
 00694559    call        004F9BD0
 0069455E    test        al,al
>00694560    jne         00694588
 00694562    lea         eax,[ebp-8]
 00694565    mov         edx,6948DC;'joystick'
 0069456A    call        004F9BD0
 0069456F    test        al,al
>00694571    jne         00694588
 00694573    lea         eax,[ebp-8]
 00694576    mov         edx,6948FC;'joy'
 0069457B    call        004F9BD0
 00694580    test        al,al
>00694582    je          00694843
 00694588    lea         eax,[ebp-8]
 0069458B    call        004F9D00
 00694590    mov         ebx,eax
 00694592    lea         eax,[ebp-8]
 00694595    mov         edx,694910;'.'
 0069459A    call        004F9BD0
 0069459F    test        al,al
>006945A1    je          00694843
 006945A7    test        ebx,ebx
>006945A9    jge         0069475C
 006945AF    lea         eax,[ebp-8]
 006945B2    mov         edx,694920;'ppjoy'
 006945B7    call        004F9BD0
 006945BC    test        al,al
>006945BE    je          006945E9
 006945C0    lea         eax,[ebp-8]
 006945C3    call        004F9D00
 006945C8    call        0068F7D8
 006945CD    mov         ebx,eax
 006945CF    lea         eax,[ebp-8]
 006945D2    mov         edx,694910;'.'
 006945D7    call        004F9BD0
 006945DC    test        al,al
>006945DE    je          00694843
>006945E4    jmp         0069475C
 006945E9    lea         eax,[ebp-8]
 006945EC    mov         edx,694938;'notppjoy'
 006945F1    call        004F9BD0
 006945F6    test        al,al
>006945F8    jne         0069460B
 006945FA    lea         eax,[ebp-8]
 006945FD    mov         edx,694958;'real'
 00694602    call        004F9BD0
 00694607    test        al,al
>00694609    je          00694634
 0069460B    lea         eax,[ebp-8]
 0069460E    call        004F9D00
 00694613    call        0068F8A8
 00694618    mov         ebx,eax
 0069461A    lea         eax,[ebp-8]
 0069461D    mov         edx,694910;'.'
 00694622    call        004F9BD0
 00694627    test        al,al
>00694629    je          00694843
>0069462F    jmp         0069475C
 00694634    lea         eax,[ebp-8]
 00694637    mov         edx,6948DC;'joystick'
 0069463C    call        004F9BD0
 00694641    test        al,al
>00694643    jne         00694656
 00694645    lea         eax,[ebp-8]
 00694648    mov         edx,6948FC;'joy'
 0069464D    call        004F9BD0
 00694652    test        al,al
>00694654    je          0069467F
 00694656    lea         eax,[ebp-8]
 00694659    call        004F9D00
 0069465E    call        0068F980
 00694663    mov         ebx,eax
 00694665    lea         eax,[ebp-8]
 00694668    mov         edx,694910;'.'
 0069466D    call        004F9BD0
 00694672    test        al,al
>00694674    je          00694843
>0069467A    jmp         0069475C
 0069467F    lea         eax,[ebp-8]
 00694682    mov         edx,694970;'gamepad'
 00694687    call        004F9BD0
 0069468C    test        al,al
>0069468E    je          006946B9
 00694690    lea         eax,[ebp-8]
 00694693    call        004F9D00
 00694698    call        0068F9E0
 0069469D    mov         ebx,eax
 0069469F    lea         eax,[ebp-8]
 006946A2    mov         edx,694910;'.'
 006946A7    call        004F9BD0
 006946AC    test        al,al
>006946AE    je          00694843
>006946B4    jmp         0069475C
 006946B9    lea         eax,[ebp-8]
 006946BC    mov         edx,69498C;'wheel'
 006946C1    call        004F9BD0
 006946C6    test        al,al
>006946C8    je          006946F0
 006946CA    lea         eax,[ebp-8]
 006946CD    call        004F9D00
 006946D2    call        0068FA40
 006946D7    mov         ebx,eax
 006946D9    lea         eax,[ebp-8]
 006946DC    mov         edx,694910;'.'
 006946E1    call        004F9BD0
 006946E6    test        al,al
>006946E8    je          00694843
>006946EE    jmp         0069475C
 006946F0    lea         eax,[ebp-8]
 006946F3    mov         edx,6949A4;'firstperson'
 006946F8    call        004F9BD0
 006946FD    test        al,al
>006946FF    je          00694727
 00694701    lea         eax,[ebp-8]
 00694704    call        004F9D00
 00694709    call        0068FB00
 0069470E    mov         ebx,eax
 00694710    lea         eax,[ebp-8]
 00694713    mov         edx,694910;'.'
 00694718    call        004F9BD0
 0069471D    test        al,al
>0069471F    je          00694843
>00694725    jmp         0069475C
 00694727    lea         eax,[ebp-8]
 0069472A    mov         edx,6949C8;'flight'
 0069472F    call        004F9BD0
 00694734    test        al,al
>00694736    je          0069475C
 00694738    lea         eax,[ebp-8]
 0069473B    call        004F9D00
 00694740    call        0068FAA0
 00694745    mov         ebx,eax
 00694747    lea         eax,[ebp-8]
 0069474A    mov         edx,694910;'.'
 0069474F    call        004F9BD0
 00694754    test        al,al
>00694756    je          00694843
 0069475C    mov         eax,dword ptr [ebp-8]
 0069475F    call        0068F768
 00694764    mov         esi,eax
 00694766    test        esi,esi
>00694768    jl          00694843
 0069476E    mov         dl,1
 00694770    mov         eax,[0068E520];TJoystickValue
 00694775    call        TObject.Create;TJoystickValue.Create
 0069477A    mov         edi,eax
 0069477C    mov         dword ptr [edi+20],esi;TJoystickValue.....................................Item:Integer
 0069477F    test        ebx,ebx
>00694781    jg          00694788
 00694783    mov         ebx,1
 00694788    mov         dword ptr [edi+18],ebx;TJoystickValue......................................................
 0069478B    mov         byte ptr ds:[81ECFC],1;gvar_0081ECFC
 00694792    cmp         ebx,3E7
>00694798    jne         006947BD
 0069479A    call        00694AB8
 0069479F    cmp         esi,109
>006947A5    je          006947B3
 006947A7    cmp         esi,10A
>006947AD    jne         00694843
 006947B3    call        00694AE0
>006947B8    jmp         00694843
 006947BD    mov         eax,[0081ED14];gvar_0081ED14:?
 006947C2    call        @DynArrayLength
 006947C7    cmp         ebx,eax
>006947C9    jle         006947EE
 006947CB    push        ebx
 006947CC    mov         eax,81ED14;gvar_0081ED14:?
 006947D1    mov         ecx,1
 006947D6    mov         edx,dword ptr ds:[68F350];:7
 006947DC    call        @DynArraySetLength
 006947E1    add         esp,4
 006947E4    mov         eax,[0081ED14];gvar_0081ED14:?
 006947E9    mov         byte ptr [eax+ebx-1],0
 006947EE    mov         eax,[0081ED18];gvar_0081ED18:?
 006947F3    call        @DynArrayLength
 006947F8    cmp         ebx,eax
>006947FA    jle         0069481F
 006947FC    push        ebx
 006947FD    mov         eax,81ED18;gvar_0081ED18:?
 00694802    mov         ecx,1
 00694807    mov         edx,dword ptr ds:[68F37C];:8
 0069480D    call        @DynArraySetLength
 00694812    add         esp,4
 00694815    mov         eax,[0081ED18];gvar_0081ED18:?
 0069481A    mov         byte ptr [eax+ebx-1],1
 0069481F    cmp         esi,109
>00694825    je          0069482F
 00694827    cmp         esi,10A
>0069482D    jne         00694839
 0069482F    mov         eax,[0081ED14];gvar_0081ED14:?
 00694834    mov         byte ptr [eax+ebx-1],1
 00694839    mov         eax,[0081ED18];gvar_0081ED18:?
 0069483E    mov         byte ptr [eax+ebx-1],1
 00694843    xor         eax,eax
 00694845    pop         edx
 00694846    pop         ecx
 00694847    pop         ecx
 00694848    mov         dword ptr fs:[eax],edx
 0069484B    push        694865
 00694850    lea         eax,[ebp-8]
 00694853    mov         edx,2
 00694858    call        @UStrArrayClr
 0069485D    ret
>0069485E    jmp         @HandleFinally
>00694863    jmp         00694850
 00694865    mov         eax,edi
 00694867    pop         edi
 00694868    pop         esi
 00694869    pop         ebx
 0069486A    pop         ecx
 0069486B    pop         ecx
 0069486C    pop         ebp
 0069486D    ret
end;*}

//006949D8
procedure sub_006949D8;
begin
{*
 006949D8    push        ebx
 006949D9    push        esi
 006949DA    mov         ebx,81ED14;gvar_0081ED14:?
 006949DF    mov         esi,81ED18;gvar_0081ED18:?
 006949E4    mov         byte ptr ds:[81ECFC],0;gvar_0081ECFC
 006949EB    push        0
 006949ED    mov         eax,ebx
 006949EF    mov         ecx,1
 006949F4    mov         edx,dword ptr ds:[68F350];:7
 006949FA    call        @DynArraySetLength
 006949FF    add         esp,4
 00694A02    push        0
 00694A04    mov         eax,esi
 00694A06    mov         ecx,1
 00694A0B    mov         edx,dword ptr ds:[68F37C];:8
 00694A11    call        @DynArraySetLength
 00694A16    add         esp,4
 00694A19    mov         eax,694A98;'CompileJoystick'
 00694A1E    call        005FCBA0
 00694A23    call        0068F518
 00694A28    mov         eax,[0081ED0C];gvar_0081ED0C:?
 00694A2D    call        @DynArrayLength
 00694A32    push        eax
 00694A33    mov         eax,ebx
 00694A35    mov         ecx,1
 00694A3A    mov         edx,dword ptr ds:[68F350];:7
 00694A40    call        @DynArraySetLength
 00694A45    add         esp,4
 00694A48    mov         eax,[0081ED0C];gvar_0081ED0C:?
 00694A4D    call        @DynArrayLength
 00694A52    push        eax
 00694A53    mov         eax,esi
 00694A55    mov         ecx,1
 00694A5A    mov         edx,dword ptr ds:[68F37C];:8
 00694A60    call        @DynArraySetLength
 00694A65    add         esp,4
 00694A68    mov         eax,dword ptr [ebx]
 00694A6A    call        @DynArrayHigh
 00694A6F    mov         edx,eax
 00694A71    test        edx,edx
>00694A73    jl          00694A88
 00694A75    inc         edx
 00694A76    xor         eax,eax
 00694A78    mov         ecx,dword ptr [ebx]
 00694A7A    mov         byte ptr [ecx+eax],0
 00694A7E    mov         ecx,dword ptr [esi]
 00694A80    mov         byte ptr [ecx+eax],0
 00694A84    inc         eax
 00694A85    dec         edx
>00694A86    jne         00694A78
 00694A88    pop         esi
 00694A89    pop         ebx
 00694A8A    ret
*}
end;

//00694AB8
procedure sub_00694AB8;
begin
{*
 00694AB8    mov         byte ptr ds:[81ECFC],1;gvar_0081ECFC
 00694ABF    mov         eax,[0081ED18];gvar_0081ED18:?
 00694AC4    call        @DynArrayHigh
 00694AC9    test        eax,eax
>00694ACB    jl          00694ADE
 00694ACD    inc         eax
 00694ACE    xor         edx,edx
 00694AD0    mov         ecx,dword ptr ds:[81ED18];gvar_0081ED18:?
 00694AD6    mov         byte ptr [ecx+edx],1
 00694ADA    inc         edx
 00694ADB    dec         eax
>00694ADC    jne         00694AD0
 00694ADE    ret
*}
end;

//00694AE0
procedure sub_00694AE0;
begin
{*
 00694AE0    mov         byte ptr ds:[81ECFC],1;gvar_0081ECFC
 00694AE7    mov         eax,[0081ED14];gvar_0081ED14:?
 00694AEC    call        @DynArrayHigh
 00694AF1    mov         edx,eax
 00694AF3    test        edx,edx
>00694AF5    jl          00694B12
 00694AF7    inc         edx
 00694AF8    xor         eax,eax
 00694AFA    mov         ecx,dword ptr ds:[81ED14];gvar_0081ED14:?
 00694B00    mov         byte ptr [ecx+eax],1
 00694B04    mov         ecx,dword ptr ds:[81ED18];gvar_0081ED18:?
 00694B0A    mov         byte ptr [ecx+eax],1
 00694B0E    inc         eax
 00694B0F    dec         edx
>00694B10    jne         00694AFA
 00694B12    ret
*}
end;

//00694B14
procedure sub_00694B14;
begin
{*
 00694B14    mov         eax,[0078D4B0];^gvar_0078BDBC
 00694B19    cmp         byte ptr [eax],0
>00694B1C    jne         00694B28
 00694B1E    mov         eax,694B38;'CompileJoystick'
 00694B23    call        005FCC94
 00694B28    ret
*}
end;

//00694B58
procedure sub_00694B58;
begin
{*
 00694B58    mov         eax,694B80;'StartRuntimeJoystick'
 00694B5D    call        004FA5FC
 00694B62    cmp         byte ptr ds:[81ECFC],0;gvar_0081ECFC
>00694B69    je          00694B70
 00694B6B    call        00693ADC
 00694B70    ret
*}
end;

//00694BAC
procedure sub_00694BAC;
begin
{*
 00694BAC    mov         eax,694BD4;'StopRuntimeJoystick'
 00694BB1    call        004FA5FC
 00694BB6    cmp         byte ptr ds:[81ECFC],0;gvar_0081ECFC
>00694BBD    je          00694BC4
 00694BBF    call        00693B68
 00694BC4    ret
*}
end;

//00694BFC
procedure TModuleJoystick.AddFields;
begin
{*
 00694BFC    push        ebp
 00694BFD    mov         ebp,esp
 00694BFF    xor         ecx,ecx
 00694C01    push        ecx
 00694C02    push        ecx
 00694C03    push        ecx
 00694C04    push        ecx
 00694C05    push        ecx
 00694C06    push        ecx
 00694C07    push        ebx
 00694C08    push        esi
 00694C09    mov         ebx,eax
 00694C0B    xor         eax,eax
 00694C0D    push        ebp
 00694C0E    push        695F47
 00694C13    push        dword ptr fs:[eax]
 00694C16    mov         dword ptr fs:[eax],esp
 00694C19    mov         ecx,12E
 00694C1E    mov         edx,695F60;'AnyButton'
 00694C23    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694C26    call        THashTable.Add
 00694C2B    mov         esi,1
 00694C30    lea         edx,[ebp-8]
 00694C33    mov         eax,esi
 00694C35    call        IntToStr
 00694C3A    mov         ecx,dword ptr [ebp-8]
 00694C3D    lea         eax,[ebp-4]
 00694C40    mov         edx,695F80;'Button'
 00694C45    call        @UStrCat3
 00694C4A    mov         edx,dword ptr [ebp-4]
 00694C4D    mov         ecx,esi
 00694C4F    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694C52    call        THashTable.Add
 00694C57    lea         edx,[ebp-10]
 00694C5A    mov         eax,esi
 00694C5C    call        IntToStr
 00694C61    mov         ecx,dword ptr [ebp-10]
 00694C64    lea         eax,[ebp-0C]
 00694C67    mov         edx,695F9C;'b'
 00694C6C    call        @UStrCat3
 00694C71    mov         edx,dword ptr [ebp-0C]
 00694C74    mov         ecx,esi
 00694C76    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694C79    call        THashTable.Add
 00694C7E    lea         edx,[ebp-18]
 00694C81    mov         eax,esi
 00694C83    call        IntToStr
 00694C88    mov         ecx,dword ptr [ebp-18]
 00694C8B    lea         eax,[ebp-14]
 00694C8E    mov         edx,695FAC;'jb'
 00694C93    call        @UStrCat3
 00694C98    mov         edx,dword ptr [ebp-14]
 00694C9B    mov         ecx,esi
 00694C9D    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694CA0    call        THashTable.Add
 00694CA5    inc         esi
 00694CA6    cmp         esi,81
>00694CAC    jne         00694C30
 00694CAE    mov         ecx,81
 00694CB3    mov         edx,695FC0;'x'
 00694CB8    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694CBB    call        THashTable.Add
 00694CC0    mov         ecx,82
 00694CC5    mov         edx,695FD0;'y'
 00694CCA    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694CCD    call        THashTable.Add
 00694CD2    mov         ecx,83
 00694CD7    mov         edx,695FE0;'z'
 00694CDC    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694CDF    call        THashTable.Add
 00694CE4    mov         ecx,84
 00694CE9    mov         edx,695FF0;'pitch'
 00694CEE    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694CF1    call        THashTable.Add
 00694CF6    mov         ecx,85
 00694CFB    mov         edx,696008;'yaw'
 00694D00    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694D03    call        THashTable.Add
 00694D08    mov         ecx,86
 00694D0D    mov         edx,69601C;'roll'
 00694D12    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694D15    call        THashTable.Add
 00694D1A    mov         ecx,87
 00694D1F    mov         edx,696034;'slider'
 00694D24    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694D27    call        THashTable.Add
 00694D2C    mov         ecx,88
 00694D31    mov         edx,696050;'dial'
 00694D36    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694D39    call        THashTable.Add
 00694D3E    mov         ecx,89
 00694D43    mov         edx,696068;'Pov1'
 00694D48    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694D4B    call        THashTable.Add
 00694D50    mov         ecx,8A
 00694D55    mov         edx,696080;'Pov2'
 00694D5A    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694D5D    call        THashTable.Add
 00694D62    mov         ecx,8B
 00694D67    mov         edx,696098;'Pov3'
 00694D6C    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694D6F    call        THashTable.Add
 00694D74    mov         ecx,8C
 00694D79    mov         edx,6960B0;'Pov4'
 00694D7E    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694D81    call        THashTable.Add
 00694D86    mov         ecx,89
 00694D8B    mov         edx,6960C8;'Pov1Angle'
 00694D90    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694D93    call        THashTable.Add
 00694D98    mov         ecx,8A
 00694D9D    mov         edx,6960E8;'Pov2Angle'
 00694DA2    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694DA5    call        THashTable.Add
 00694DAA    mov         ecx,8B
 00694DAF    mov         edx,696108;'Pov3Angle'
 00694DB4    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694DB7    call        THashTable.Add
 00694DBC    mov         ecx,8C
 00694DC1    mov         edx,696128;'Pov4Angle'
 00694DC6    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694DC9    call        THashTable.Add
 00694DCE    mov         ecx,89
 00694DD3    mov         edx,696148;'Hat1'
 00694DD8    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694DDB    call        THashTable.Add
 00694DE0    mov         ecx,8A
 00694DE5    mov         edx,696160;'Hat2'
 00694DEA    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694DED    call        THashTable.Add
 00694DF2    mov         ecx,8B
 00694DF7    mov         edx,696178;'Hat3'
 00694DFC    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694DFF    call        THashTable.Add
 00694E04    mov         ecx,8C
 00694E09    mov         edx,696190;'Hat4'
 00694E0E    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694E11    call        THashTable.Add
 00694E16    mov         ecx,89
 00694E1B    mov         edx,6961A8;'Hat1Angle'
 00694E20    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694E23    call        THashTable.Add
 00694E28    mov         ecx,8A
 00694E2D    mov         edx,6961C8;'Hat2Angle'
 00694E32    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694E35    call        THashTable.Add
 00694E3A    mov         ecx,8B
 00694E3F    mov         edx,6961E8;'Hat3Angle'
 00694E44    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694E47    call        THashTable.Add
 00694E4C    mov         ecx,8C
 00694E51    mov         edx,696208;'Hat4Angle'
 00694E56    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694E59    call        THashTable.Add
 00694E5E    mov         ecx,8D
 00694E63    mov         edx,696228;'vx'
 00694E68    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694E6B    call        THashTable.Add
 00694E70    mov         ecx,8E
 00694E75    mov         edx,69623C;'vy'
 00694E7A    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694E7D    call        THashTable.Add
 00694E82    mov         ecx,8F
 00694E87    mov         edx,696250;'vz'
 00694E8C    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694E8F    call        THashTable.Add
 00694E94    mov         ecx,90
 00694E99    mov         edx,696264;'vpitch'
 00694E9E    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694EA1    call        THashTable.Add
 00694EA6    mov         ecx,91
 00694EAB    mov         edx,696280;'vyaw'
 00694EB0    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694EB3    call        THashTable.Add
 00694EB8    mov         ecx,92
 00694EBD    mov         edx,696298;'vroll'
 00694EC2    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694EC5    call        THashTable.Add
 00694ECA    mov         ecx,93
 00694ECF    mov         edx,6962B0;'vslider'
 00694ED4    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694ED7    call        THashTable.Add
 00694EDC    mov         ecx,94
 00694EE1    mov         edx,6962CC;'vdial'
 00694EE6    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694EE9    call        THashTable.Add
 00694EEE    mov         ecx,8D
 00694EF3    mov         edx,6962E4;'xv'
 00694EF8    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694EFB    call        THashTable.Add
 00694F00    mov         ecx,8E
 00694F05    mov         edx,6962F8;'yv'
 00694F0A    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694F0D    call        THashTable.Add
 00694F12    mov         ecx,8F
 00694F17    mov         edx,69630C;'zv'
 00694F1C    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694F1F    call        THashTable.Add
 00694F24    mov         ecx,90
 00694F29    mov         edx,696320;'vrx'
 00694F2E    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694F31    call        THashTable.Add
 00694F36    mov         ecx,91
 00694F3B    mov         edx,696334;'vry'
 00694F40    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694F43    call        THashTable.Add
 00694F48    mov         ecx,92
 00694F4D    mov         edx,696348;'vrz'
 00694F52    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694F55    call        THashTable.Add
 00694F5A    mov         ecx,8D
 00694F5F    mov         edx,69635C;'XVelocity'
 00694F64    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694F67    call        THashTable.Add
 00694F6C    mov         ecx,8E
 00694F71    mov         edx,69637C;'YVelocity'
 00694F76    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694F79    call        THashTable.Add
 00694F7E    mov         ecx,8F
 00694F83    mov         edx,69639C;'ZVelocity'
 00694F88    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694F8B    call        THashTable.Add
 00694F90    mov         ecx,8D
 00694F95    mov         edx,6963BC;'VelocityX'
 00694F9A    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694F9D    call        THashTable.Add
 00694FA2    mov         ecx,8E
 00694FA7    mov         edx,6963DC;'VelocityY'
 00694FAC    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694FAF    call        THashTable.Add
 00694FB4    mov         ecx,8F
 00694FB9    mov         edx,6963FC;'VelocityZ'
 00694FBE    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694FC1    call        THashTable.Add
 00694FC6    mov         ecx,84
 00694FCB    mov         edx,69641C;'XRotation'
 00694FD0    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694FD3    call        THashTable.Add
 00694FD8    mov         ecx,85
 00694FDD    mov         edx,69643C;'YRotation'
 00694FE2    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694FE5    call        THashTable.Add
 00694FEA    mov         ecx,86
 00694FEF    mov         edx,69645C;'ZRotation'
 00694FF4    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00694FF7    call        THashTable.Add
 00694FFC    mov         ecx,84
 00695001    mov         edx,69647C;'XRot'
 00695006    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695009    call        THashTable.Add
 0069500E    mov         ecx,85
 00695013    mov         edx,696494;'YRot'
 00695018    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069501B    call        THashTable.Add
 00695020    mov         ecx,86
 00695025    mov         edx,6964AC;'ZRot'
 0069502A    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069502D    call        THashTable.Add
 00695032    mov         ecx,84
 00695037    mov         edx,6964C4;'RX'
 0069503C    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069503F    call        THashTable.Add
 00695044    mov         ecx,85
 00695049    mov         edx,6964D8;'RY'
 0069504E    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695051    call        THashTable.Add
 00695056    mov         ecx,86
 0069505B    mov         edx,6964EC;'RZ'
 00695060    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695063    call        THashTable.Add
 00695068    mov         ecx,84
 0069506D    mov         edx,696500;'RotX'
 00695072    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695075    call        THashTable.Add
 0069507A    mov         ecx,85
 0069507F    mov         edx,696518;'RotY'
 00695084    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695087    call        THashTable.Add
 0069508C    mov         ecx,86
 00695091    mov         edx,696530;'RotZ'
 00695096    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695099    call        THashTable.Add
 0069509E    mov         ecx,84
 006950A3    mov         edx,696548;'U'
 006950A8    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006950AB    call        THashTable.Add
 006950B0    mov         ecx,85
 006950B5    mov         edx,696558;'V'
 006950BA    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006950BD    call        THashTable.Add
 006950C2    mov         ecx,86
 006950C7    mov         edx,696568;'R'
 006950CC    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006950CF    call        THashTable.Add
 006950D4    mov         ecx,86
 006950D9    mov         edx,696578;'Twist'
 006950DE    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006950E1    call        THashTable.Add
 006950E6    mov         ecx,86
 006950EB    mov         edx,696590;'Rudder'
 006950F0    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006950F3    call        THashTable.Add
 006950F8    mov         ecx,95
 006950FD    mov         edx,6965AC;'NumberOfAxes'
 00695102    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695105    call        THashTable.Add
 0069510A    mov         ecx,96
 0069510F    mov         edx,6965D4;'NumberOfButtons'
 00695114    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695117    call        THashTable.Add
 0069511C    mov         ecx,97
 00695121    mov         edx,696600;'NumberOfPOVs'
 00695126    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695129    call        THashTable.Add
 0069512E    mov         ecx,97
 00695133    mov         edx,696628;'NumberOfHats'
 00695138    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069513B    call        THashTable.Add
 00695140    mov         ecx,95
 00695145    mov         edx,696650;'NumAxes'
 0069514A    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069514D    call        THashTable.Add
 00695152    mov         ecx,96
 00695157    mov         edx,69666C;'NumButtons'
 0069515C    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069515F    call        THashTable.Add
 00695164    mov         ecx,97
 00695169    mov         edx,696690;'NumPOVs'
 0069516E    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695171    call        THashTable.Add
 00695176    mov         ecx,97
 0069517B    mov         edx,6966AC;'NumHats'
 00695180    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695183    call        THashTable.Add
 00695188    mov         ecx,95
 0069518D    mov         edx,6966C8;'Axes'
 00695192    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695195    call        THashTable.Add
 0069519A    mov         ecx,96
 0069519F    mov         edx,6966E0;'Buttons'
 006951A4    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006951A7    call        THashTable.Add
 006951AC    mov         ecx,97
 006951B1    mov         edx,6966FC;'POVs'
 006951B6    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006951B9    call        THashTable.Add
 006951BE    mov         ecx,97
 006951C3    mov         edx,696714;'Hats'
 006951C8    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006951CB    call        THashTable.Add
 006951D0    mov         ecx,98
 006951D5    mov         edx,69672C;'FFSamplePeriod'
 006951DA    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006951DD    call        THashTable.Add
 006951E2    mov         ecx,9A
 006951E7    mov         edx,696758;'FirmwareRevision'
 006951EC    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006951EF    call        THashTable.Add
 006951F4    mov         ecx,9B
 006951F9    mov         edx,696788;'HardwareRevision'
 006951FE    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695201    call        THashTable.Add
 00695206    mov         ecx,9C
 0069520B    mov         edx,6967B8;'FFDriverVersion'
 00695210    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695213    call        THashTable.Add
 00695218    mov         ecx,9E
 0069521D    mov         edx,6967E4;'DeviceType'
 00695222    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695225    call        THashTable.Add
 0069522A    mov         ecx,9E
 0069522F    mov         edx,696808;'DevType'
 00695234    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695237    call        THashTable.Add
 0069523C    mov         ecx,9F
 00695241    mov         edx,696824;'Alias'
 00695246    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695249    call        THashTable.Add
 0069524E    mov         ecx,0A0
 00695253    mov         edx,69683C;'Attached'
 00695258    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069525B    call        THashTable.Add
 00695260    mov         ecx,0A1
 00695265    mov         edx,69685C;'Deadband'
 0069526A    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069526D    call        THashTable.Add
 00695272    mov         ecx,0A2
 00695277    mov         edx,69687C;'Emulated'
 0069527C    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069527F    call        THashTable.Add
 00695284    mov         ecx,0A3
 00695289    mov         edx,69689C;'ForceFeedback'
 0069528E    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695291    call        THashTable.Add
 00695296    mov         ecx,0A4
 0069529B    mov         edx,6968C4;'FFFade'
 006952A0    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006952A3    call        THashTable.Add
 006952A8    mov         ecx,0A5
 006952AD    mov         edx,6968E0;'FFAttack'
 006952B2    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006952B5    call        THashTable.Add
 006952BA    mov         ecx,0A6
 006952BF    mov         edx,696900;'Hidden'
 006952C4    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006952C7    call        THashTable.Add
 006952CC    mov         ecx,0A7
 006952D1    mov         edx,69691C;'Phantom'
 006952D6    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006952D9    call        THashTable.Add
 006952DE    mov         ecx,0A8
 006952E3    mov         edx,696938;'PolledDataFormat'
 006952E8    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006952EB    call        THashTable.Add
 006952F0    mov         ecx,0A9
 006952F5    mov         edx,696968;'PolledDevice'
 006952FA    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006952FD    call        THashTable.Add
 00695302    mov         ecx,0AA
 00695307    mov         edx,696990;'PosNegCoefficients'
 0069530C    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069530F    call        THashTable.Add
 00695314    mov         ecx,0AB
 00695319    mov         edx,6969C4;'PosNegSaturation'
 0069531E    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695321    call        THashTable.Add
 00695326    mov         ecx,0AC
 0069532B    mov         edx,6969F4;'Saturation'
 00695330    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695333    call        THashTable.Add
 00695338    mov         ecx,0AD
 0069533D    mov         edx,696A18;'StartDelay'
 00695342    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695345    call        THashTable.Add
 0069534A    mov         ecx,0AE
 0069534F    mov         edx,696A3C;'HID'
 00695354    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695357    call        THashTable.Add
 0069535C    mov         ecx,9D
 00695361    mov         edx,696A50;'DeviceSubType'
 00695366    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695369    call        THashTable.Add
 0069536E    mov         ecx,9D
 00695373    mov         edx,696A78;'DevSubType'
 00695378    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069537B    call        THashTable.Add
 00695380    mov         ecx,0AF
 00695385    mov         edx,696A9C;'IsLimited'
 0069538A    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069538D    call        THashTable.Add
 00695392    mov         ecx,0B0
 00695397    mov         edx,696ABC;'IsJoystick'
 0069539C    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069539F    call        THashTable.Add
 006953A4    mov         ecx,0B1
 006953A9    mov         edx,696AE0;'IsGamepad'
 006953AE    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006953B1    call        THashTable.Add
 006953B6    mov         ecx,0B2
 006953BB    mov         edx,696B00;'IsWheel'
 006953C0    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006953C3    call        THashTable.Add
 006953C8    mov         ecx,0B2
 006953CD    mov         edx,696B1C;'IsSteeringWheel'
 006953D2    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006953D5    call        THashTable.Add
 006953DA    mov         ecx,0B2
 006953DF    mov         edx,696B48;'IsDriving'
 006953E4    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006953E7    call        THashTable.Add
 006953EC    mov         ecx,0B3
 006953F1    mov         edx,696B68;'IsFlight'
 006953F6    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006953F9    call        THashTable.Add
 006953FE    mov         ecx,0B3
 00695403    mov         edx,696B88;'IsFlightSim'
 00695408    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069540B    call        THashTable.Add
 00695410    mov         ecx,0B4
 00695415    mov         edx,696BAC;'IsFirstPerson'
 0069541A    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069541D    call        THashTable.Add
 00695422    mov         ecx,0FA
 00695427    mov         edx,696BD4;'Name'
 0069542C    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069542F    call        THashTable.Add
 00695434    mov         ecx,0FA
 00695439    mov         edx,696BEC;'InstanceName'
 0069543E    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695441    call        THashTable.Add
 00695446    mov         ecx,0FB
 0069544B    mov         edx,696C14;'ProductName'
 00695450    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695453    call        THashTable.Add
 00695458    mov         ecx,0FC
 0069545D    mov         edx,696C38;'IsVirtualJoystick'
 00695462    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695465    call        THashTable.Add
 0069546A    mov         ecx,0FD
 0069546F    mov         edx,696C68;'PPJoyNumber'
 00695474    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695477    call        THashTable.Add
 0069547C    mov         ecx,0FE
 00695481    mov         edx,696C8C;'InstanceGuid'
 00695486    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695489    call        THashTable.Add
 0069548E    mov         ecx,0FF
 00695493    mov         edx,696CB4;'ProductGuid'
 00695498    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069549B    call        THashTable.Add
 006954A0    mov         ecx,100
 006954A5    mov         edx,696CD8;'ForceFeedbackGuid'
 006954AA    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006954AD    call        THashTable.Add
 006954B2    mov         ecx,100
 006954B7    mov         edx,696D08;'FFGuid'
 006954BC    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006954BF    call        THashTable.Add
 006954C4    mov         ecx,101
 006954C9    mov         edx,696D24;'HidUsagePage'
 006954CE    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006954D1    call        THashTable.Add
 006954D6    mov         ecx,102
 006954DB    mov         edx,696D4C;'HidUsage'
 006954E0    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006954E3    call        THashTable.Add
 006954E8    mov         ecx,101
 006954ED    mov         edx,696D6C;'UsagePage'
 006954F2    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006954F5    call        THashTable.Add
 006954FA    mov         ecx,102
 006954FF    mov         edx,696D8C;'Usage'
 00695504    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695507    call        THashTable.Add
 0069550C    mov         ecx,103
 00695511    mov         edx,696DA4;'Count'
 00695516    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695519    call        THashTable.Add
 0069551E    mov         ecx,104
 00695523    mov         edx,696DBC;'Pos'
 00695528    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069552B    call        THashTable.Add
 00695530    mov         ecx,108
 00695535    mov         edx,696DD0;'Pos2D'
 0069553A    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069553D    call        THashTable.Add
 00695542    mov         ecx,12F
 00695547    mov         edx,696DE8;'Pos2DJoy2'
 0069554C    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069554F    call        THashTable.Add
 00695554    mov         ecx,105
 00695559    mov         edx,696E08;'Velocity'
 0069555E    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695561    call        THashTable.Add
 00695566    mov         ecx,106
 0069556B    mov         edx,696E28;'Rot'
 00695570    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695573    call        THashTable.Add
 00695578    mov         ecx,106
 0069557D    mov         edx,696E3C;'Rotation'
 00695582    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695585    call        THashTable.Add
 0069558A    mov         ecx,107
 0069558F    mov         edx,696E5C;'VRot'
 00695594    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695597    call        THashTable.Add
 0069559C    mov         ecx,107
 006955A1    mov         edx,696E74;'RotV'
 006955A6    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006955A9    call        THashTable.Add
 006955AE    mov         ecx,107
 006955B3    mov         edx,696E8C;'RotationVelocity'
 006955B8    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006955BB    call        THashTable.Add
 006955C0    mov         ecx,109
 006955C5    mov         edx,696EBC;'Vibration1'
 006955CA    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006955CD    call        THashTable.Add
 006955D2    mov         ecx,10A
 006955D7    mov         edx,696EE0;'Vibration2'
 006955DC    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006955DF    call        THashTable.Add
 006955E4    mov         ecx,112
 006955E9    mov         edx,696F04;'Pov1Up'
 006955EE    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006955F1    call        THashTable.Add
 006955F6    mov         ecx,113
 006955FB    mov         edx,696F20;'Pov1Down'
 00695600    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695603    call        THashTable.Add
 00695608    mov         ecx,114
 0069560D    mov         edx,696F40;'Pov1Left'
 00695612    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695615    call        THashTable.Add
 0069561A    mov         ecx,115
 0069561F    mov         edx,696F60;'Pov1Right'
 00695624    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695627    call        THashTable.Add
 0069562C    mov         ecx,122
 00695631    mov         edx,696F80;'Pov1Center'
 00695636    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695639    call        THashTable.Add
 0069563E    mov         ecx,122
 00695643    mov         edx,696FA4;'Pov1Centre'
 00695648    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069564B    call        THashTable.Add
 00695650    mov         ecx,122
 00695655    mov         edx,696FC8;'Pov1Centered'
 0069565A    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069565D    call        THashTable.Add
 00695662    mov         ecx,122
 00695667    mov         edx,696FF0;'Pov1Centred'
 0069566C    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069566F    call        THashTable.Add
 00695674    mov         ecx,122
 00695679    mov         edx,697014;'Pov1Middle'
 0069567E    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695681    call        THashTable.Add
 00695686    mov         ecx,126
 0069568B    mov         edx,697038;'Pov1x'
 00695690    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695693    call        THashTable.Add
 00695698    mov         ecx,127
 0069569D    mov         edx,697050;'Pov1y'
 006956A2    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006956A5    call        THashTable.Add
 006956AA    mov         ecx,130
 006956AF    mov         edx,697068;'Pov1xy'
 006956B4    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006956B7    call        THashTable.Add
 006956BC    mov         ecx,116
 006956C1    mov         edx,697084;'Pov2Up'
 006956C6    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006956C9    call        THashTable.Add
 006956CE    mov         ecx,117
 006956D3    mov         edx,6970A0;'Pov2Down'
 006956D8    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006956DB    call        THashTable.Add
 006956E0    mov         ecx,118
 006956E5    mov         edx,6970C0;'Pov2Left'
 006956EA    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006956ED    call        THashTable.Add
 006956F2    mov         ecx,119
 006956F7    mov         edx,6970E0;'Pov2Right'
 006956FC    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006956FF    call        THashTable.Add
 00695704    mov         ecx,123
 00695709    mov         edx,697100;'Pov2Center'
 0069570E    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695711    call        THashTable.Add
 00695716    mov         ecx,123
 0069571B    mov         edx,697124;'Pov2Centre'
 00695720    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695723    call        THashTable.Add
 00695728    mov         ecx,123
 0069572D    mov         edx,697148;'Pov2Centered'
 00695732    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695735    call        THashTable.Add
 0069573A    mov         ecx,123
 0069573F    mov         edx,697170;'Pov2Centred'
 00695744    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695747    call        THashTable.Add
 0069574C    mov         ecx,123
 00695751    mov         edx,697194;'Pov2Middle'
 00695756    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695759    call        THashTable.Add
 0069575E    mov         ecx,128
 00695763    mov         edx,6971B8;'Pov2x'
 00695768    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069576B    call        THashTable.Add
 00695770    mov         ecx,129
 00695775    mov         edx,6971D0;'Pov2y'
 0069577A    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069577D    call        THashTable.Add
 00695782    mov         ecx,131
 00695787    mov         edx,6971E8;'Pov2xy'
 0069578C    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069578F    call        THashTable.Add
 00695794    mov         ecx,11A
 00695799    mov         edx,697204;'Pov3Up'
 0069579E    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006957A1    call        THashTable.Add
 006957A6    mov         ecx,11B
 006957AB    mov         edx,697220;'Pov3Down'
 006957B0    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006957B3    call        THashTable.Add
 006957B8    mov         ecx,11C
 006957BD    mov         edx,697240;'Pov3Left'
 006957C2    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006957C5    call        THashTable.Add
 006957CA    mov         ecx,11D
 006957CF    mov         edx,697260;'Pov3Right'
 006957D4    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006957D7    call        THashTable.Add
 006957DC    mov         ecx,124
 006957E1    mov         edx,697280;'Pov3Center'
 006957E6    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006957E9    call        THashTable.Add
 006957EE    mov         ecx,124
 006957F3    mov         edx,6972A4;'Pov3Centre'
 006957F8    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006957FB    call        THashTable.Add
 00695800    mov         ecx,124
 00695805    mov         edx,6972C8;'Pov3Centered'
 0069580A    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069580D    call        THashTable.Add
 00695812    mov         ecx,124
 00695817    mov         edx,6972F0;'Pov3Centred'
 0069581C    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069581F    call        THashTable.Add
 00695824    mov         ecx,124
 00695829    mov         edx,697314;'Pov3Middle'
 0069582E    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695831    call        THashTable.Add
 00695836    mov         ecx,12A
 0069583B    mov         edx,697338;'Pov3x'
 00695840    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695843    call        THashTable.Add
 00695848    mov         ecx,12B
 0069584D    mov         edx,697350;'Pov3y'
 00695852    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695855    call        THashTable.Add
 0069585A    mov         ecx,132
 0069585F    mov         edx,697368;'Pov3xy'
 00695864    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695867    call        THashTable.Add
 0069586C    mov         ecx,11E
 00695871    mov         edx,697384;'Pov4Up'
 00695876    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695879    call        THashTable.Add
 0069587E    mov         ecx,11F
 00695883    mov         edx,6973A0;'Pov4Down'
 00695888    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069588B    call        THashTable.Add
 00695890    mov         ecx,120
 00695895    mov         edx,6973C0;'Pov4Left'
 0069589A    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069589D    call        THashTable.Add
 006958A2    mov         ecx,121
 006958A7    mov         edx,6973E0;'Pov4Right'
 006958AC    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006958AF    call        THashTable.Add
 006958B4    mov         ecx,125
 006958B9    mov         edx,697400;'Pov4Center'
 006958BE    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006958C1    call        THashTable.Add
 006958C6    mov         ecx,125
 006958CB    mov         edx,697424;'Pov4Centre'
 006958D0    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006958D3    call        THashTable.Add
 006958D8    mov         ecx,125
 006958DD    mov         edx,697448;'Pov4Centered'
 006958E2    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006958E5    call        THashTable.Add
 006958EA    mov         ecx,125
 006958EF    mov         edx,697470;'Pov4Centred'
 006958F4    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006958F7    call        THashTable.Add
 006958FC    mov         ecx,125
 00695901    mov         edx,697494;'Pov4Middle'
 00695906    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695909    call        THashTable.Add
 0069590E    mov         ecx,12C
 00695913    mov         edx,6974B8;'Pov4x'
 00695918    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069591B    call        THashTable.Add
 00695920    mov         ecx,12D
 00695925    mov         edx,6974D0;'Pov4y'
 0069592A    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069592D    call        THashTable.Add
 00695932    mov         ecx,133
 00695937    mov         edx,6974E8;'Pov4xy'
 0069593C    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 0069593F    call        THashTable.Add
 00695944    mov         ecx,112
 00695949    mov         edx,697504;'Hat1Up'
 0069594E    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695951    call        THashTable.Add
 00695956    mov         ecx,113
 0069595B    mov         edx,697520;'Hat1Down'
 00695960    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695963    call        THashTable.Add
 00695968    mov         ecx,114
 0069596D    mov         edx,697540;'Hat1Left'
 00695972    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695975    call        THashTable.Add
 0069597A    mov         ecx,115
 0069597F    mov         edx,697560;'Hat1Right'
 00695984    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695987    call        THashTable.Add
 0069598C    mov         ecx,122
 00695991    mov         edx,697580;'Hat1Center'
 00695996    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695999    call        THashTable.Add
 0069599E    mov         ecx,122
 006959A3    mov         edx,6975A4;'Hat1Centre'
 006959A8    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006959AB    call        THashTable.Add
 006959B0    mov         ecx,122
 006959B5    mov         edx,6975C8;'Hat1Centered'
 006959BA    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006959BD    call        THashTable.Add
 006959C2    mov         ecx,122
 006959C7    mov         edx,6975F0;'Hat1Centred'
 006959CC    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006959CF    call        THashTable.Add
 006959D4    mov         ecx,122
 006959D9    mov         edx,697614;'Hat1Middle'
 006959DE    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006959E1    call        THashTable.Add
 006959E6    mov         ecx,126
 006959EB    mov         edx,697638;'Hat1x'
 006959F0    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 006959F3    call        THashTable.Add
 006959F8    mov         ecx,127
 006959FD    mov         edx,697650;'Hat1y'
 00695A02    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695A05    call        THashTable.Add
 00695A0A    mov         ecx,130
 00695A0F    mov         edx,697668;'Hat1xy'
 00695A14    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695A17    call        THashTable.Add
 00695A1C    mov         ecx,116
 00695A21    mov         edx,697684;'Hat2Up'
 00695A26    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695A29    call        THashTable.Add
 00695A2E    mov         ecx,117
 00695A33    mov         edx,6976A0;'Hat2Down'
 00695A38    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695A3B    call        THashTable.Add
 00695A40    mov         ecx,118
 00695A45    mov         edx,6976C0;'Hat2Left'
 00695A4A    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695A4D    call        THashTable.Add
 00695A52    mov         ecx,119
 00695A57    mov         edx,6976E0;'Hat2Right'
 00695A5C    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695A5F    call        THashTable.Add
 00695A64    mov         ecx,123
 00695A69    mov         edx,697700;'Hat2Center'
 00695A6E    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695A71    call        THashTable.Add
 00695A76    mov         ecx,123
 00695A7B    mov         edx,697724;'Hat2Centre'
 00695A80    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695A83    call        THashTable.Add
 00695A88    mov         ecx,123
 00695A8D    mov         edx,697748;'Hat2Centered'
 00695A92    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695A95    call        THashTable.Add
 00695A9A    mov         ecx,123
 00695A9F    mov         edx,697770;'Hat2Centred'
 00695AA4    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695AA7    call        THashTable.Add
 00695AAC    mov         ecx,123
 00695AB1    mov         edx,697794;'Hat2Middle'
 00695AB6    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695AB9    call        THashTable.Add
 00695ABE    mov         ecx,128
 00695AC3    mov         edx,6977B8;'Hat2x'
 00695AC8    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695ACB    call        THashTable.Add
 00695AD0    mov         ecx,129
 00695AD5    mov         edx,6977D0;'Hat2y'
 00695ADA    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695ADD    call        THashTable.Add
 00695AE2    mov         ecx,131
 00695AE7    mov         edx,6977E8;'Hat2xy'
 00695AEC    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695AEF    call        THashTable.Add
 00695AF4    mov         ecx,11A
 00695AF9    mov         edx,697804;'Hat3Up'
 00695AFE    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695B01    call        THashTable.Add
 00695B06    mov         ecx,11B
 00695B0B    mov         edx,697820;'Hat3Down'
 00695B10    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695B13    call        THashTable.Add
 00695B18    mov         ecx,11C
 00695B1D    mov         edx,697840;'Hat3Left'
 00695B22    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695B25    call        THashTable.Add
 00695B2A    mov         ecx,11D
 00695B2F    mov         edx,697860;'Hat3Right'
 00695B34    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695B37    call        THashTable.Add
 00695B3C    mov         ecx,124
 00695B41    mov         edx,697880;'Hat3Center'
 00695B46    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695B49    call        THashTable.Add
 00695B4E    mov         ecx,124
 00695B53    mov         edx,6978A4;'Hat3Centre'
 00695B58    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695B5B    call        THashTable.Add
 00695B60    mov         ecx,124
 00695B65    mov         edx,6978C8;'Hat3Centered'
 00695B6A    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695B6D    call        THashTable.Add
 00695B72    mov         ecx,124
 00695B77    mov         edx,6978F0;'Hat3Centred'
 00695B7C    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695B7F    call        THashTable.Add
 00695B84    mov         ecx,124
 00695B89    mov         edx,697914;'Hat3Middle'
 00695B8E    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695B91    call        THashTable.Add
 00695B96    mov         ecx,12A
 00695B9B    mov         edx,697938;'Hat3x'
 00695BA0    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695BA3    call        THashTable.Add
 00695BA8    mov         ecx,12B
 00695BAD    mov         edx,697950;'Hat3y'
 00695BB2    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695BB5    call        THashTable.Add
 00695BBA    mov         ecx,132
 00695BBF    mov         edx,697968;'Hat3xy'
 00695BC4    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695BC7    call        THashTable.Add
 00695BCC    mov         ecx,11E
 00695BD1    mov         edx,697984;'Hat4Up'
 00695BD6    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695BD9    call        THashTable.Add
 00695BDE    mov         ecx,11F
 00695BE3    mov         edx,6979A0;'Hat4Down'
 00695BE8    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695BEB    call        THashTable.Add
 00695BF0    mov         ecx,120
 00695BF5    mov         edx,6979C0;'Hat4Left'
 00695BFA    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695BFD    call        THashTable.Add
 00695C02    mov         ecx,121
 00695C07    mov         edx,6979E0;'Hat4Right'
 00695C0C    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695C0F    call        THashTable.Add
 00695C14    mov         ecx,125
 00695C19    mov         edx,697A00;'Hat4Center'
 00695C1E    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695C21    call        THashTable.Add
 00695C26    mov         ecx,125
 00695C2B    mov         edx,697A24;'Hat4Centre'
 00695C30    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695C33    call        THashTable.Add
 00695C38    mov         ecx,125
 00695C3D    mov         edx,697A48;'Hat4Centered'
 00695C42    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695C45    call        THashTable.Add
 00695C4A    mov         ecx,125
 00695C4F    mov         edx,697A70;'Hat4Centred'
 00695C54    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695C57    call        THashTable.Add
 00695C5C    mov         ecx,125
 00695C61    mov         edx,697A94;'Hat4Middle'
 00695C66    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695C69    call        THashTable.Add
 00695C6E    mov         ecx,12C
 00695C73    mov         edx,697AB8;'Hat4x'
 00695C78    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695C7B    call        THashTable.Add
 00695C80    mov         ecx,12D
 00695C85    mov         edx,697AD0;'Hat4y'
 00695C8A    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695C8D    call        THashTable.Add
 00695C92    mov         ecx,133
 00695C97    mov         edx,697AE8;'Hat4xy'
 00695C9C    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695C9F    call        THashTable.Add
 00695CA4    mov         ecx,112
 00695CA9    mov         edx,697B04;'Coolie1Up'
 00695CAE    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695CB1    call        THashTable.Add
 00695CB6    mov         ecx,113
 00695CBB    mov         edx,697B24;'Coolie1Down'
 00695CC0    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695CC3    call        THashTable.Add
 00695CC8    mov         ecx,114
 00695CCD    mov         edx,697B48;'Coolie1Left'
 00695CD2    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695CD5    call        THashTable.Add
 00695CDA    mov         ecx,115
 00695CDF    mov         edx,697B6C;'Coolie1Right'
 00695CE4    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695CE7    call        THashTable.Add
 00695CEC    mov         ecx,122
 00695CF1    mov         edx,697B94;'Coolie1Center'
 00695CF6    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695CF9    call        THashTable.Add
 00695CFE    mov         ecx,122
 00695D03    mov         edx,697BBC;'Coolie1Centre'
 00695D08    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695D0B    call        THashTable.Add
 00695D10    mov         ecx,122
 00695D15    mov         edx,697BE4;'Coolie1Centered'
 00695D1A    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695D1D    call        THashTable.Add
 00695D22    mov         ecx,122
 00695D27    mov         edx,697C10;'Coolie1Centred'
 00695D2C    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695D2F    call        THashTable.Add
 00695D34    mov         ecx,122
 00695D39    mov         edx,697C3C;'Coolie1Middle'
 00695D3E    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695D41    call        THashTable.Add
 00695D46    mov         ecx,116
 00695D4B    mov         edx,697C64;'Coolie2Up'
 00695D50    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695D53    call        THashTable.Add
 00695D58    mov         ecx,117
 00695D5D    mov         edx,697C84;'Coolie2Down'
 00695D62    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695D65    call        THashTable.Add
 00695D6A    mov         ecx,118
 00695D6F    mov         edx,697CA8;'Coolie2Left'
 00695D74    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695D77    call        THashTable.Add
 00695D7C    mov         ecx,119
 00695D81    mov         edx,697CCC;'Coolie2Right'
 00695D86    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695D89    call        THashTable.Add
 00695D8E    mov         ecx,123
 00695D93    mov         edx,697CF4;'Coolie2Center'
 00695D98    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695D9B    call        THashTable.Add
 00695DA0    mov         ecx,123
 00695DA5    mov         edx,697D1C;'Coolie2Centre'
 00695DAA    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695DAD    call        THashTable.Add
 00695DB2    mov         ecx,123
 00695DB7    mov         edx,697D44;'Coolie2Centered'
 00695DBC    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695DBF    call        THashTable.Add
 00695DC4    mov         ecx,123
 00695DC9    mov         edx,697D70;'Coolie2Centred'
 00695DCE    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695DD1    call        THashTable.Add
 00695DD6    mov         ecx,123
 00695DDB    mov         edx,697D9C;'Coolie2Middle'
 00695DE0    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695DE3    call        THashTable.Add
 00695DE8    mov         ecx,11A
 00695DED    mov         edx,697DC4;'Coolie3Up'
 00695DF2    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695DF5    call        THashTable.Add
 00695DFA    mov         ecx,11B
 00695DFF    mov         edx,697DE4;'Coolie3Down'
 00695E04    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695E07    call        THashTable.Add
 00695E0C    mov         ecx,11C
 00695E11    mov         edx,697E08;'Coolie3Left'
 00695E16    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695E19    call        THashTable.Add
 00695E1E    mov         ecx,11D
 00695E23    mov         edx,697E2C;'Coolie3Right'
 00695E28    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695E2B    call        THashTable.Add
 00695E30    mov         ecx,124
 00695E35    mov         edx,697E54;'Coolie3Center'
 00695E3A    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695E3D    call        THashTable.Add
 00695E42    mov         ecx,124
 00695E47    mov         edx,697E7C;'Coolie3Centre'
 00695E4C    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695E4F    call        THashTable.Add
 00695E54    mov         ecx,124
 00695E59    mov         edx,697EA4;'Coolie3Centered'
 00695E5E    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695E61    call        THashTable.Add
 00695E66    mov         ecx,124
 00695E6B    mov         edx,697ED0;'Coolie3Centred'
 00695E70    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695E73    call        THashTable.Add
 00695E78    mov         ecx,124
 00695E7D    mov         edx,697EFC;'Coolie3Middle'
 00695E82    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695E85    call        THashTable.Add
 00695E8A    mov         ecx,11E
 00695E8F    mov         edx,697F24;'Coolie4Up'
 00695E94    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695E97    call        THashTable.Add
 00695E9C    mov         ecx,11F
 00695EA1    mov         edx,697F44;'Coolie4Down'
 00695EA6    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695EA9    call        THashTable.Add
 00695EAE    mov         ecx,120
 00695EB3    mov         edx,697F68;'Coolie4Left'
 00695EB8    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695EBB    call        THashTable.Add
 00695EC0    mov         ecx,121
 00695EC5    mov         edx,697F8C;'Coolie4Right'
 00695ECA    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695ECD    call        THashTable.Add
 00695ED2    mov         ecx,125
 00695ED7    mov         edx,697FB4;'Coolie4Center'
 00695EDC    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695EDF    call        THashTable.Add
 00695EE4    mov         ecx,125
 00695EE9    mov         edx,697FDC;'Coolie4Centre'
 00695EEE    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695EF1    call        THashTable.Add
 00695EF6    mov         ecx,125
 00695EFB    mov         edx,698004;'Coolie4Centered'
 00695F00    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695F03    call        THashTable.Add
 00695F08    mov         ecx,125
 00695F0D    mov         edx,698030;'Coolie4Centred'
 00695F12    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695F15    call        THashTable.Add
 00695F1A    mov         ecx,125
 00695F1F    mov         edx,69805C;'Coolie4Middle'
 00695F24    mov         eax,dword ptr [ebx+1C];TModuleJoystick.Fields:THashTable
 00695F27    call        THashTable.Add
 00695F2C    xor         eax,eax
 00695F2E    pop         edx
 00695F2F    pop         ecx
 00695F30    pop         ecx
 00695F31    mov         dword ptr fs:[eax],edx
 00695F34    push        695F4E
 00695F39    lea         eax,[ebp-18]
 00695F3C    mov         edx,6
 00695F41    call        @UStrArrayClr
 00695F46    ret
>00695F47    jmp         @HandleFinally
>00695F4C    jmp         00695F39
 00695F4E    pop         esi
 00695F4F    pop         ebx
 00695F50    mov         esp,ebp
 00695F52    pop         ebp
 00695F53    ret
*}
end;

//00698078
procedure TModuleJoystick.ClearRead;
begin
{*
 00698078    call        TPieModule.ClearRead
 0069807D    ret
*}
end;

//00698080
constructor TModuleJoystick.Create;
begin
{*
 00698080    push        ebx
 00698081    push        esi
 00698082    test        dl,dl
>00698084    je          0069808E
 00698086    add         esp,0FFFFFFF0
 00698089    call        @ClassCreate
 0069808E    mov         ebx,edx
 00698090    mov         esi,eax
 00698092    push        6980D4;'Joysticks'
 00698097    push        6980F4;'Joy'
 0069809C    push        0
 0069809E    push        0
 006980A0    mov         ecx,698108;'Joystick'
 006980A5    xor         edx,edx
 006980A7    mov         eax,esi
 006980A9    call        005E48EC
 006980AE    mov         eax,esi
 006980B0    test        bl,bl
>006980B2    je          006980C3
 006980B4    call        @AfterConstruction
 006980B9    pop         dword ptr fs:[0]
 006980C0    add         esp,0C
 006980C3    mov         eax,esi
 006980C5    pop         esi
 006980C6    pop         ebx
 006980C7    ret
*}
end;

//0069811C
function TModuleJoystick.CreateValue(Identifier:string):TExpression;
begin
{*
 0069811C    push        ebp
 0069811D    mov         ebp,esp
 0069811F    push        ecx
 00698120    push        ebx
 00698121    mov         dword ptr [ebp-4],edx
 00698124    mov         eax,dword ptr [ebp-4]
 00698127    call        @UStrAddRef
 0069812C    xor         eax,eax
 0069812E    push        ebp
 0069812F    push        69815A
 00698134    push        dword ptr fs:[eax]
 00698137    mov         dword ptr fs:[eax],esp
 0069813A    mov         eax,dword ptr [ebp-4]
 0069813D    call        006944F4
 00698142    mov         ebx,eax
 00698144    xor         eax,eax
 00698146    pop         edx
 00698147    pop         ecx
 00698148    pop         ecx
 00698149    mov         dword ptr fs:[eax],edx
 0069814C    push        698161
 00698151    lea         eax,[ebp-4]
 00698154    call        @UStrClr
 00698159    ret
>0069815A    jmp         @HandleFinally
>0069815F    jmp         00698151
 00698161    mov         eax,ebx
 00698163    pop         ebx
 00698164    pop         ecx
 00698165    pop         ebp
 00698166    ret
*}
end;

//00698168
procedure TModuleJoystick.GetGoodFields;
begin
{*
 00698168    call        0068EFC4
 0069816D    ret
*}
end;

//00698170
procedure TModuleJoystick.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 00698170    push        ebp
 00698171    mov         ebp,esp
 00698173    mov         byte ptr [edx],1
 00698176    mov         dword ptr [ecx],1
 0069817C    mov         eax,dword ptr [ebp+8]
 0069817F    mov         dword ptr [eax],14
 00698185    pop         ebp
 00698186    ret         4
*}
end;

//0069818C
function TModuleJoystick.IsIdentifier(s:string):Boolean;
begin
{*
 0069818C    push        ebp
 0069818D    mov         ebp,esp
 0069818F    push        ecx
 00698190    push        ebx
 00698191    mov         dword ptr [ebp-4],edx
 00698194    mov         eax,dword ptr [ebp-4]
 00698197    call        @UStrAddRef
 0069819C    xor         eax,eax
 0069819E    push        ebp
 0069819F    push        698226
 006981A4    push        dword ptr fs:[eax]
 006981A7    mov         dword ptr fs:[eax],esp
 006981AA    mov         eax,dword ptr [ebp-4]
 006981AD    call        0068F244
 006981B2    test        al,al
>006981B4    je          006981BA
 006981B6    mov         bl,1
>006981B8    jmp         00698210
 006981BA    lea         eax,[ebp-4]
 006981BD    mov         edx,698240;'joysticks'
 006981C2    call        004F9BD0
 006981C7    test        al,al
>006981C9    jne         006981F1
 006981CB    lea         eax,[ebp-4]
 006981CE    mov         edx,698260;'joystick'
 006981D3    call        004F9BD0
 006981D8    test        al,al
>006981DA    jne         006981F1
 006981DC    lea         eax,[ebp-4]
 006981DF    mov         edx,698280;'joy'
 006981E4    call        004F9BD0
 006981E9    test        al,al
>006981EB    jne         006981F1
 006981ED    xor         ebx,ebx
>006981EF    jmp         00698210
 006981F1    lea         eax,[ebp-4]
 006981F4    call        004F9D00
 006981F9    lea         eax,[ebp-4]
 006981FC    mov         edx,698294;'.'
 00698201    call        004F9BD0
 00698206    test        al,al
>00698208    jne         0069820E
 0069820A    xor         ebx,ebx
>0069820C    jmp         00698210
 0069820E    mov         bl,1
 00698210    xor         eax,eax
 00698212    pop         edx
 00698213    pop         ecx
 00698214    pop         ecx
 00698215    mov         dword ptr fs:[eax],edx
 00698218    push        69822D
 0069821D    lea         eax,[ebp-4]
 00698220    call        @UStrClr
 00698225    ret
>00698226    jmp         @HandleFinally
>0069822B    jmp         0069821D
 0069822D    mov         eax,ebx
 0069822F    pop         ebx
 00698230    pop         ecx
 00698231    pop         ebp
 00698232    ret
*}
end;

//00698298
procedure TModuleJoystick.MonitorFrame;
begin
{*
 00698298    call        TPieModule.MonitorFrame
 0069829D    ret
*}
end;

//006982A0
procedure TModuleJoystick.PrepareForGUI;
begin
{*
 006982A0    ret
*}
end;

//006982A4
procedure TModuleJoystick.PrepareForMonitoring;
begin
{*
 006982A4    mov         edx,dword ptr [eax]
 006982A6    call        dword ptr [edx+28];TModuleJoystick.StartCompiletime
 006982A9    call        00694AB8
 006982AE    ret
*}
end;

//006982B0
procedure TModuleJoystick.Read;
begin
{*
 006982B0    call        006943FC
 006982B5    ret
*}
end;

//006982B8
procedure TModuleJoystick.StartCompiletime;
begin
{*
 006982B8    call        TPieModule.StartCompiletime
 006982BD    call        006949D8
 006982C2    ret
*}
end;

//006982C4
procedure TModuleJoystick.StartGUI;
begin
{*
 006982C4    ret
*}
end;

//006982C8
procedure TModuleJoystick.StartMonitoring;
begin
{*
 006982C8    push        ebx
 006982C9    mov         ebx,eax
 006982CB    mov         eax,ebx
 006982CD    mov         edx,dword ptr [eax]
 006982CF    call        dword ptr [edx+30];TModuleJoystick.StartRuntime
 006982D2    mov         byte ptr [ebx+28],1;TModuleJoystick.Monitoring:Boolean
 006982D6    pop         ebx
 006982D7    ret
*}
end;

//006982D8
procedure TModuleJoystick.StartRuntime;
begin
{*
 006982D8    call        TPieModule.StartRuntime
 006982DD    call        00694B58
 006982E2    ret
*}
end;

//006982E4
procedure TModuleJoystick.StopCompiletime;
begin
{*
 006982E4    push        ebx
 006982E5    mov         ebx,eax
 006982E7    call        00694B14
 006982EC    mov         eax,ebx
 006982EE    call        TPieModule.StopCompiletime
 006982F3    pop         ebx
 006982F4    ret
*}
end;

//006982F8
procedure TModuleJoystick.StopGUI;
begin
{*
 006982F8    ret
*}
end;

//006982FC
procedure TModuleJoystick.StopMonitoring;
begin
{*
 006982FC    push        ebx
 006982FD    mov         ebx,eax
 006982FF    call        00694BAC
 00698304    mov         byte ptr [ebx+28],0;TModuleJoystick.Monitoring:Boolean
 00698308    pop         ebx
 00698309    ret
*}
end;

//0069830C
procedure TModuleJoystick.StopRuntime;
begin
{*
 0069830C    push        ebx
 0069830D    mov         ebx,eax
 0069830F    call        00694BAC
 00698314    mov         eax,ebx
 00698316    call        TPieModule.StopRuntime
 0069831B    pop         ebx
 0069831C    ret
*}
end;

Initialization
//007820DC
{*
 007820DC    push        ebp
 007820DD    mov         ebp,esp
 007820DF    push        ebx
 007820E0    push        esi
 007820E1    push        edi
 007820E2    xor         eax,eax
 007820E4    push        ebp
 007820E5    push        78215F
 007820EA    push        dword ptr fs:[eax]
 007820ED    mov         dword ptr fs:[eax],esp
 007820F0    sub         dword ptr ds:[81ED00],1
>007820F7    jae         00782151
 007820F9    xor         edx,edx
 007820FB    push        ebp
 007820FC    push        782136
 00782101    push        dword ptr fs:[edx]
 00782104    mov         dword ptr fs:[edx],esp
 00782107    mov         eax,782178;'Initializing PieJoystick'
 0078210C    call        004FA5FC
 00782111    mov         dl,1
 00782113    mov         eax,[0068E8DC];TModuleJoystick
 00782118    call        TModuleJoystick.Create;TModuleJoystick.Create
 0078211D    mov         [0081ED04],eax;gvar_0081ED04:TModuleJoystick
 00782122    mov         eax,[0081ED04];gvar_0081ED04:TModuleJoystick
 00782127    call        005E31AC
 0078212C    xor         eax,eax
 0078212E    pop         edx
 0078212F    pop         ecx
 00782130    pop         ecx
 00782131    mov         dword ptr fs:[eax],edx
>00782134    jmp         00782151
>00782136    jmp         @HandleOnException
 0078213B    dd          1
 0078213F    dd          00418C04;Exception
 00782143    dd          00782147
 00782147    call        004FA644
 0078214C    call        @DoneExcept
 00782151    xor         eax,eax
 00782153    pop         edx
 00782154    pop         ecx
 00782155    pop         ecx
 00782156    mov         dword ptr fs:[eax],edx
 00782159    push        782166
 0078215E    ret
>0078215F    jmp         @HandleFinally
>00782164    jmp         0078215E
 00782166    pop         edi
 00782167    pop         esi
 00782168    pop         ebx
 00782169    pop         ebp
 0078216A    ret
*}
Finalization
//00698320
{*
 00698320    push        ebp
 00698321    mov         ebp,esp
 00698323    push        ebx
 00698324    push        esi
 00698325    push        edi
 00698326    xor         eax,eax
 00698328    push        ebp
 00698329    push        69841F
 0069832E    push        dword ptr fs:[eax]
 00698331    mov         dword ptr fs:[eax],esp
 00698334    inc         dword ptr ds:[81ED00]
>0069833A    jne         00698411
 00698340    xor         edx,edx
 00698342    push        ebp
 00698343    push        69836C
 00698348    push        dword ptr fs:[edx]
 0069834B    mov         dword ptr fs:[edx],esp
 0069834E    mov         eax,698438;'Finalizing PieJoystick'
 00698353    call        004FA5FC
 00698358    call        006944F0
 0069835D    call        00693B68
 00698362    xor         eax,eax
 00698364    pop         edx
 00698365    pop         ecx
 00698366    pop         ecx
 00698367    mov         dword ptr fs:[eax],edx
>0069836A    jmp         00698387
>0069836C    jmp         @HandleOnException
 00698371    dd          1
 00698375    dd          00418C04;Exception
 00698379    dd          0069837D
 0069837D    call        004FA644
 00698382    call        @DoneExcept
 00698387    mov         eax,78BDE0;gvar_0078BDE0:IInterface
 0069838C    call        @IntfClear
 00698391    mov         eax,81ED08;gvar_0081ED08:?
 00698396    mov         edx,dword ptr ds:[68F2CC];:4
 0069839C    call        @DynArrayClear
 006983A1    mov         eax,81ED0C;gvar_0081ED0C:?
 006983A6    mov         edx,dword ptr ds:[68F2F8];:5
 006983AC    call        @DynArrayClear
 006983B1    mov         eax,81ED10;gvar_0081ED10:?
 006983B6    mov         edx,dword ptr ds:[68F324];:6
 006983BC    call        @DynArrayClear
 006983C1    mov         eax,81ED14;gvar_0081ED14:?
 006983C6    mov         edx,dword ptr ds:[68F350];:7
 006983CC    call        @DynArrayClear
 006983D1    mov         eax,81ED18;gvar_0081ED18:?
 006983D6    mov         edx,dword ptr ds:[68F37C];:8
 006983DC    call        @DynArrayClear
 006983E1    mov         eax,81ED1C;gvar_0081ED1C:?
 006983E6    mov         edx,dword ptr ds:[68F3A8];:9
 006983EC    call        @DynArrayClear
 006983F1    mov         eax,81ED20;gvar_0081ED20:?
 006983F6    mov         edx,dword ptr ds:[68F3D4];:01
 006983FC    call        @DynArrayClear
 00698401    mov         eax,81ED24;gvar_0081ED24:?
 00698406    mov         edx,dword ptr ds:[68F400];:11
 0069840C    call        @DynArrayClear
 00698411    xor         eax,eax
 00698413    pop         edx
 00698414    pop         ecx
 00698415    pop         ecx
 00698416    mov         dword ptr fs:[eax],edx
 00698419    push        698426
 0069841E    ret
>0069841F    jmp         @HandleFinally
>00698424    jmp         0069841E
 00698426    pop         edi
 00698427    pop         esi
 00698428    pop         ebx
 00698429    pop         ebp
 0069842A    ret
*}
end.