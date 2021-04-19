//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieFalcon;

interface

uses
  SysUtils, Classes;

type
  TFalconValue = class(TObjectValue)
  published
    function GetUnits:TUnits;//006F1E60
    //procedure GetString(?:?);//006F1E38
    procedure FillClone(c:TExpression);//006F1DD8
    function Module:TObject;//006F2078
    function GetPerUnits2:TUnits;//006F1E24
    function GetPerUnits1:TUnits;//006F1E10
    //procedure SetValue(NewValue:Double; ?:?);//006F2080
    function CanSet:Boolean;//006F1DC4
    function GetDataType:TDataType;//006F1DF8
    procedure CreateClone;//006F1DC8
    procedure GetValue;//006F1E80
    //procedure ToString(?:?);//006F20D4
  public
    ......................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//006F20D4
    procedure GetValue; virtual;//v2C//006F1E80
    //procedure GetString(?:?); virtual;//v38//006F1E38
    function GetDataType:TDataType; virtual;//v44//006F1DF8
    function GetUnits:TUnits; virtual;//v48//006F1E60
    function GetPerUnits1:TUnits; virtual;//v4C//006F1E10
    function GetPerUnits2:TUnits; virtual;//v50//006F1E24
    //procedure SetValue(NewValue:Double; ?:?); virtual;//v58//006F2080
    function CanSet:Boolean; virtual;//v68//006F1DC4
    procedure CreateClone; virtual;//v80//006F1DC8
    procedure FillClone(c:TExpression); virtual;//v84//006F1DD8
    function Module:TObject; virtual;//v98//006F2078
  end;
  TModuleFalcon = class(TPieModule)
  published
    procedure Read;//006F2BE4
    procedure ClearRead;//006F2A9C
    function CreateValue(Identifier:string):TExpression;//006F2B0C
    function GetDefaultFormat(field:string):TGuiFormat;//006F2B60
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//006F2BC8
    procedure GetGoodFields;//006F2BC0
    procedure StartCompiletime;//006F2BEC
    procedure StopRuntime;//006F2C18
    procedure StartRuntime;//006F2BF8
    procedure AddFields;//006F2734
    constructor Create;//006F2AA4
    procedure StopCompiletime;//006F2C04
  public
    function CreateValue(Identifier:string):TExpression; virtual;//v14//006F2B0C
    procedure GetGoodFields; virtual;//v1C//006F2BC0
    procedure AddFields; virtual;//v24//006F2734
    procedure StartCompiletime; virtual;//v28//006F2BEC
    procedure StopCompiletime; virtual;//v2C//006F2C04
    procedure StartRuntime; virtual;//v30//006F2BF8
    procedure StopRuntime; virtual;//v34//006F2C18
    procedure ClearRead; virtual;//v38//006F2A9C
    procedure Read; virtual;//v3C//006F2BE4
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//006F2BC8
    function GetDefaultFormat(field:string):TGuiFormat; virtual;//v44//006F2B60
  end;
    //function sub_006F0EDC:?;//006F0EDC
    //function sub_006F0EE4:?;//006F0EE4
    procedure sub_006F14C8;//006F14C8
    //function sub_006F1CD0(?:string):?;//006F1CD0
    procedure sub_006F21C8;//006F21C8
    procedure sub_006F21D0;//006F21D0
    procedure sub_006F21D4;//006F21D4
    procedure sub_006F257C;//006F257C
    //function sub_006F25E0:?;//006F25E0
    //function sub_006F25F0:?;//006F25F0
    //function sub_006F262C:?;//006F262C

implementation

//006F0EDC
{*function sub_006F0EDC:?;
begin
 006F0EDC    push        edx
 006F0EDD    push        eax
 006F0EDE    call        GetProcAddress
 006F0EE3    ret
end;*}

//006F0EE4
{*function sub_006F0EE4:?;
begin
 006F0EE4    push        ebp
 006F0EE5    mov         ebp,esp
 006F0EE7    add         esp,0FFFFFDF8
 006F0EED    push        ebx
 006F0EEE    push        esi
 006F0EEF    xor         eax,eax
 006F0EF1    mov         dword ptr [ebp-208],eax
 006F0EF7    mov         dword ptr [ebp-4],eax
 006F0EFA    mov         esi,822820;gvar_00822820:HMODULE
 006F0EFF    xor         eax,eax
 006F0F01    push        ebp
 006F0F02    push        6F1122
 006F0F07    push        dword ptr fs:[eax]
 006F0F0A    mov         dword ptr fs:[eax],esp
 006F0F0D    mov         edx,8000
 006F0F12    mov         eax,6F1140;'hdl.dll'
 006F0F17    call        SafeLoadLibrary
 006F0F1C    mov         dword ptr [esi],eax
 006F0F1E    cmp         dword ptr [esi],0
>006F0F21    jne         006F0F8E
 006F0F23    lea         eax,[ebp-204]
 006F0F29    xor         ecx,ecx
 006F0F2B    mov         edx,100
 006F0F30    call        @FillChar
 006F0F35    push        0FF
 006F0F3A    lea         eax,[ebp-204]
 006F0F40    push        eax
 006F0F41    push        6F1150;'NOVINT_DEVICE_SUPPORT'
 006F0F46    call        kernel32.GetEnvironmentVariableW
 006F0F4B    lea         eax,[ebp-4]
 006F0F4E    lea         edx,[ebp-204]
 006F0F54    mov         ecx,100
 006F0F59    call        @UStrFromWArray
 006F0F5E    lea         edx,[ebp-208]
 006F0F64    mov         eax,dword ptr [ebp-4]
 006F0F67    call        IncludeTrailingPathDelimiter
 006F0F6C    mov         edx,dword ptr [ebp-208]
 006F0F72    lea         eax,[ebp-4]
 006F0F75    mov         ecx,6F1188;'bin\hdl.dll'
 006F0F7A    call        @UStrCat3
 006F0F7F    mov         edx,8000
 006F0F84    mov         eax,dword ptr [ebp-4]
 006F0F87    call        SafeLoadLibrary
 006F0F8C    mov         dword ptr [esi],eax
 006F0F8E    cmp         dword ptr [esi],0
>006F0F91    jne         006F0F9A
 006F0F93    xor         ebx,ebx
>006F0F95    jmp         006F1101
 006F0F9A    mov         bl,1
 006F0F9C    mov         edx,6F11A0
 006F0FA1    mov         eax,dword ptr [esi]
 006F0FA3    call        006F0EDC
 006F0FA8    mov         [008227CC],eax;gvar_008227CC
 006F0FAD    mov         edx,6F11C0
 006F0FB2    mov         eax,dword ptr [esi]
 006F0FB4    call        006F0EDC
 006F0FB9    mov         [008227D0],eax;gvar_008227D0
 006F0FBE    mov         edx,6F11E4
 006F0FC3    mov         eax,dword ptr [esi]
 006F0FC5    call        006F0EDC
 006F0FCA    mov         [0082281C],eax;gvar_0082281C
 006F0FCF    mov         edx,6F120C
 006F0FD4    mov         eax,dword ptr [esi]
 006F0FD6    call        006F0EDC
 006F0FDB    mov         [008227D4],eax;gvar_008227D4
 006F0FE0    mov         edx,6F1238
 006F0FE5    mov         eax,dword ptr [esi]
 006F0FE7    call        006F0EDC
 006F0FEC    mov         [008227E4],eax;gvar_008227E4
 006F0FF1    mov         edx,6F1258
 006F0FF6    mov         eax,dword ptr [esi]
 006F0FF8    call        006F0EDC
 006F0FFD    mov         [008227DC],eax;gvar_008227DC
 006F1002    mov         edx,6F1270
 006F1007    mov         eax,dword ptr [esi]
 006F1009    call        006F0EDC
 006F100E    mov         [00822818],eax;gvar_00822818
 006F1013    mov         edx,6F1288
 006F1018    mov         eax,dword ptr [esi]
 006F101A    call        006F0EDC
 006F101F    mov         [008227D8],eax;gvar_008227D8
 006F1024    mov         edx,6F12AC
 006F1029    mov         eax,dword ptr [esi]
 006F102B    call        006F0EDC
 006F1030    mov         [008227E0],eax;gvar_008227E0
 006F1035    mov         edx,6F12D8
 006F103A    mov         eax,dword ptr [esi]
 006F103C    call        006F0EDC
 006F1041    mov         [008227E8],eax;gvar_008227E8
 006F1046    mov         edx,6F12FC
 006F104B    mov         eax,dword ptr [esi]
 006F104D    call        006F0EDC
 006F1052    mov         [00822800],eax;gvar_00822800
 006F1057    mov         edx,6F1324
 006F105C    mov         eax,dword ptr [esi]
 006F105E    call        006F0EDC
 006F1063    mov         [00822804],eax;gvar_00822804
 006F1068    mov         edx,6F134C
 006F106D    mov         eax,dword ptr [esi]
 006F106F    call        006F0EDC
 006F1074    mov         [00822808],eax;gvar_00822808
 006F1079    mov         edx,6F1380
 006F107E    mov         eax,dword ptr [esi]
 006F1080    call        006F0EDC
 006F1085    mov         [0082280C],eax;gvar_0082280C
 006F108A    mov         edx,6F13A4
 006F108F    mov         eax,dword ptr [esi]
 006F1091    call        006F0EDC
 006F1096    mov         [00822810],eax;gvar_00822810
 006F109B    mov         edx,6F13C8
 006F10A0    mov         eax,dword ptr [esi]
 006F10A2    call        006F0EDC
 006F10A7    mov         [008227FC],eax;gvar_008227FC
 006F10AC    mov         edx,6F13F4
 006F10B1    mov         eax,dword ptr [esi]
 006F10B3    call        006F0EDC
 006F10B8    mov         [00822814],eax;gvar_00822814
 006F10BD    mov         edx,6F1420
 006F10C2    mov         eax,dword ptr [esi]
 006F10C4    call        006F0EDC
 006F10C9    mov         [008227EC],eax;gvar_008227EC
 006F10CE    mov         edx,6F1444
 006F10D3    mov         eax,dword ptr [esi]
 006F10D5    call        006F0EDC
 006F10DA    mov         [008227F0],eax;gvar_008227F0
 006F10DF    mov         edx,6F1470
 006F10E4    mov         eax,dword ptr [esi]
 006F10E6    call        006F0EDC
 006F10EB    mov         [008227F4],eax;gvar_008227F4
 006F10F0    mov         edx,6F149C
 006F10F5    mov         eax,dword ptr [esi]
 006F10F7    call        006F0EDC
 006F10FC    mov         [008227F8],eax;gvar_008227F8
 006F1101    xor         eax,eax
 006F1103    pop         edx
 006F1104    pop         ecx
 006F1105    pop         ecx
 006F1106    mov         dword ptr fs:[eax],edx
 006F1109    push        6F1129
 006F110E    lea         eax,[ebp-208]
 006F1114    call        @UStrClr
 006F1119    lea         eax,[ebp-4]
 006F111C    call        @UStrClr
 006F1121    ret
>006F1122    jmp         @HandleFinally
>006F1127    jmp         006F110E
 006F1129    mov         eax,ebx
 006F112B    pop         esi
 006F112C    pop         ebx
 006F112D    mov         esp,ebp
 006F112F    pop         ebp
 006F1130    ret
end;*}

//006F14C8
procedure sub_006F14C8;
begin
{*
 006F14C8    cmp         dword ptr ds:[822820],0;gvar_00822820:HMODULE
>006F14CF    je          006F14E3
 006F14D1    mov         eax,[00822820];gvar_00822820:HMODULE
 006F14D6    push        eax
 006F14D7    call        kernel32.FreeLibrary
 006F14DC    xor         eax,eax
 006F14DE    mov         [00822820],eax;gvar_00822820:HMODULE
 006F14E3    ret
*}
end;

//006F1CD0
{*function sub_006F1CD0(?:string):?;
begin
 006F1CD0    push        ebp
 006F1CD1    mov         ebp,esp
 006F1CD3    add         esp,0FFFFFFF8
 006F1CD6    push        ebx
 006F1CD7    push        esi
 006F1CD8    push        edi
 006F1CD9    xor         edx,edx
 006F1CDB    mov         dword ptr [ebp-8],edx
 006F1CDE    mov         dword ptr [ebp-4],eax
 006F1CE1    mov         eax,dword ptr [ebp-4]
 006F1CE4    call        @UStrAddRef
 006F1CE9    xor         eax,eax
 006F1CEB    push        ebp
 006F1CEC    push        6F1D85
 006F1CF1    push        dword ptr fs:[eax]
 006F1CF4    mov         dword ptr fs:[eax],esp
 006F1CF7    xor         ebx,ebx
 006F1CF9    lea         eax,[ebp-8]
 006F1CFC    mov         edx,dword ptr [ebp-4]
 006F1CFF    call        @UStrLAsg
 006F1D04    lea         eax,[ebp-8]
 006F1D07    mov         edx,6F1DA4;'Falcon'
 006F1D0C    call        004F9BD0
 006F1D11    test        al,al
>006F1D13    je          006F1D6A
 006F1D15    lea         eax,[ebp-8]
 006F1D18    call        004F9D00
 006F1D1D    mov         esi,eax
 006F1D1F    lea         eax,[ebp-8]
 006F1D22    mov         edx,6F1DC0;'.'
 006F1D27    call        004F9BD0
 006F1D2C    test        al,al
>006F1D2E    je          006F1D6A
 006F1D30    mov         eax,[0082282C];gvar_0082282C:TModuleFalcon
 006F1D35    mov         eax,dword ptr [eax+1C]
 006F1D38    mov         edx,dword ptr [ebp-8]
 006F1D3B    call        THashTable.Get
 006F1D40    mov         edi,eax
 006F1D42    test        edi,edi
>006F1D44    jl          006F1D6A
 006F1D46    mov         dl,1
 006F1D48    mov         eax,[006F14E4];TFalconValue
 006F1D4D    call        TObject.Create;TFalconValue.Create
 006F1D52    mov         ebx,eax
 006F1D54    mov         dword ptr [ebx+20],edi;TFalconValue........................Item:Integer
 006F1D57    test        esi,esi
>006F1D59    jg          006F1D60
 006F1D5B    mov         esi,1
 006F1D60    mov         dword ptr [ebx+18],esi;TFalconValue........................................................
 006F1D63    mov         byte ptr ds:[822824],1;gvar_00822824
 006F1D6A    xor         eax,eax
 006F1D6C    pop         edx
 006F1D6D    pop         ecx
 006F1D6E    pop         ecx
 006F1D6F    mov         dword ptr fs:[eax],edx
 006F1D72    push        6F1D8C
 006F1D77    lea         eax,[ebp-8]
 006F1D7A    mov         edx,2
 006F1D7F    call        @UStrArrayClr
 006F1D84    ret
>006F1D85    jmp         @HandleFinally
>006F1D8A    jmp         006F1D77
 006F1D8C    mov         eax,ebx
 006F1D8E    pop         edi
 006F1D8F    pop         esi
 006F1D90    pop         ebx
 006F1D91    pop         ecx
 006F1D92    pop         ecx
 006F1D93    pop         ebp
 006F1D94    ret
end;*}

//006F1DC4
function TFalconValue.CanSet:Boolean;
begin
{*
 006F1DC4    xor         eax,eax
 006F1DC6    ret
*}
end;

//006F1DC8
procedure TFalconValue.CreateClone;
begin
{*
 006F1DC8    mov         dl,1
 006F1DCA    mov         eax,[006F14E4];TFalconValue
 006F1DCF    call        TObject.Create;TFalconValue.Create
 006F1DD4    ret
*}
end;

//006F1DD8
procedure TFalconValue.FillClone(c:TExpression);
begin
{*
 006F1DD8    push        ebx
 006F1DD9    push        esi
 006F1DDA    mov         esi,edx
 006F1DDC    mov         ebx,eax
 006F1DDE    mov         edx,esi
 006F1DE0    mov         eax,ebx
 006F1DE2    call        TExpression.FillClone
 006F1DE7    mov         eax,esi
 006F1DE9    mov         edx,dword ptr [ebx+20];TFalconValue.........................Item:Integer
 006F1DEC    mov         dword ptr [eax+20],edx
 006F1DEF    mov         edx,dword ptr [ebx+18];TFalconValue........................................................
 006F1DF2    mov         dword ptr [eax+18],edx
 006F1DF5    pop         esi
 006F1DF6    pop         ebx
 006F1DF7    ret
*}
end;

//006F1DF8
function TFalconValue.GetDataType:TDataType;
begin
{*
 006F1DF8    mov         eax,dword ptr [eax+20];TFalconValue..........................Item:Integer
 006F1DFB    sub         eax,20
>006F1DFE    jb          006F1E08
 006F1E00    dec         eax
>006F1E01    je          006F1E08
 006F1E03    sub         eax,9
>006F1E06    jne         006F1E0B
 006F1E08    mov         al,3
 006F1E0A    ret
 006F1E0B    xor         eax,eax
 006F1E0D    ret
*}
end;

//006F1E10
function TFalconValue.GetPerUnits1:TUnits;
begin
{*
 006F1E10    mov         eax,dword ptr [eax+20];TFalconValue...........................Item:Integer
 006F1E13    add         eax,0FFFFFFDB
 006F1E16    sub         eax,3
>006F1E19    jae         006F1E1E
 006F1E1B    mov         al,11
 006F1E1D    ret
 006F1E1E    xor         eax,eax
 006F1E20    ret
*}
end;

//006F1E24
function TFalconValue.GetPerUnits2:TUnits;
begin
{*
 006F1E24    mov         eax,dword ptr [eax+20];TFalconValue............................Item:Integer
 006F1E27    add         eax,0FFFFFFDB
 006F1E2A    sub         eax,3
>006F1E2D    jae         006F1E32
 006F1E2F    mov         al,11
 006F1E31    ret
 006F1E32    xor         eax,eax
 006F1E34    ret
*}
end;

//006F1E38
{*procedure TFalconValue.GetString(?:?);
begin
 006F1E38    push        ebx
 006F1E39    push        esi
 006F1E3A    mov         esi,edx
 006F1E3C    mov         ebx,eax
 006F1E3E    mov         eax,dword ptr [ebx+20];TFalconValue.............................Item:Integer
 006F1E41    sub         eax,21
>006F1E44    jne         006F1E52
 006F1E46    mov         edx,esi
 006F1E48    mov         eax,ebx
 006F1E4A    call        TExpression.GetString
 006F1E4F    pop         esi
 006F1E50    pop         ebx
 006F1E51    ret
 006F1E52    mov         edx,esi
 006F1E54    mov         eax,ebx
 006F1E56    call        TExpression.GetString
 006F1E5B    pop         esi
 006F1E5C    pop         ebx
 006F1E5D    ret
end;*}

//006F1E60
function TFalconValue.GetUnits:TUnits;
begin
{*
 006F1E60    mov         eax,dword ptr [eax+20];TFalconValue..............................Item:Integer
 006F1E63    add         eax,0FFFFFFDE
 006F1E66    sub         eax,3
>006F1E69    jb          006F1E78
 006F1E6B    sub         eax,3
>006F1E6E    jb          006F1E75
>006F1E70    je          006F1E78
 006F1E72    dec         eax
>006F1E73    jne         006F1E7B
 006F1E75    mov         al,2E
 006F1E77    ret
 006F1E78    mov         al,5
 006F1E7A    ret
 006F1E7B    xor         eax,eax
 006F1E7D    ret
*}
end;

//006F1E80
procedure TFalconValue.GetValue;
begin
{*
 006F1E80    add         esp,0FFFFFFE0
 006F1E83    cmp         byte ptr ds:[822825],0;gvar_00822825
>006F1E8A    jne         006F1E9A
 006F1E8C    xor         eax,eax
 006F1E8E    mov         dword ptr [esp],eax
 006F1E91    mov         dword ptr [esp+4],eax
>006F1E95    jmp         006F2071
 006F1E9A    mov         edx,dword ptr [eax+20];TFalconValue...............................Item:Integer
 006F1E9D    mov         ecx,edx
 006F1E9F    cmp         ecx,2A
>006F1EA2    ja          006F2068
 006F1EA8    movzx       ecx,byte ptr [ecx+6F1EB6]
 006F1EAF    jmp         dword ptr [ecx*4+6F1EE1]
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          1
 006F1EAF    db          0
 006F1EAF    db          2
 006F1EAF    db          3
 006F1EAF    db          4
 006F1EAF    db          5
 006F1EAF    db          6
 006F1EAF    db          7
 006F1EAF    db          8
 006F1EAF    db          9
 006F1EAF    db          10
 006F1EAF    db          11
 006F1EAF    dd          006F2068
 006F1EAF    dd          006F1F11
 006F1EAF    dd          006F1F31
 006F1EAF    dd          006F1F46
 006F1EAF    dd          006F1F5E
 006F1EAF    dd          006F1F76
 006F1EAF    dd          006F1F87
 006F1EAF    dd          006F1F9F
 006F1EAF    dd          006F1FB7
 006F1EAF    dd          006F1FCF
 006F1EAF    dd          006F200F
 006F1EAF    dd          006F204F
 006F1F11    mov         ecx,edx
 006F1F13    mov         eax,1
 006F1F18    shl         eax,cl
 006F1F1A    and         eax,dword ptr ds:[8228A0];gvar_008228A0
 006F1F20    setne       al
 006F1F23    call        00686074
 006F1F28    fstp        qword ptr [esp]
 006F1F2B    wait
>006F1F2C    jmp         006F2071
 006F1F31    movzx       eax,byte ptr ds:[822825];gvar_00822825
 006F1F38    call        00686074
 006F1F3D    fstp        qword ptr [esp]
 006F1F40    wait
>006F1F41    jmp         006F2071
 006F1F46    mov         eax,dword ptr ds:[822870];gvar_00822870:Double
 006F1F4C    mov         dword ptr [esp],eax
 006F1F4F    mov         eax,dword ptr ds:[822874];gvar_00822874
 006F1F55    mov         dword ptr [esp+4],eax
>006F1F59    jmp         006F2071
 006F1F5E    mov         eax,dword ptr ds:[822878];gvar_00822878:Double
 006F1F64    mov         dword ptr [esp],eax
 006F1F67    mov         eax,dword ptr ds:[82287C];gvar_0082287C
 006F1F6D    mov         dword ptr [esp+4],eax
>006F1F71    jmp         006F2071
 006F1F76    fld         qword ptr ds:[822880];gvar_00822880:Double
 006F1F7C    fchs
 006F1F7E    fstp        qword ptr [esp]
 006F1F81    wait
>006F1F82    jmp         006F2071
 006F1F87    mov         eax,dword ptr ds:[822888];gvar_00822888:Double
 006F1F8D    mov         dword ptr [esp],eax
 006F1F90    mov         eax,dword ptr ds:[82288C];gvar_0082288C
 006F1F96    mov         dword ptr [esp+4],eax
>006F1F9A    jmp         006F2071
 006F1F9F    mov         eax,dword ptr ds:[822890];gvar_00822890:Double
 006F1FA5    mov         dword ptr [esp],eax
 006F1FA8    mov         eax,dword ptr ds:[822894];gvar_00822894
 006F1FAE    mov         dword ptr [esp+4],eax
>006F1FB2    jmp         006F2071
 006F1FB7    mov         eax,dword ptr ds:[822898];gvar_00822898:Double
 006F1FBD    mov         dword ptr [esp],eax
 006F1FC0    mov         eax,dword ptr ds:[82289C];gvar_0082289C
 006F1FC6    mov         dword ptr [esp+4],eax
>006F1FCA    jmp         006F2071
 006F1FCF    fld         qword ptr ds:[822870];gvar_00822870:Double
 006F1FD5    fmul        st,st(0)
 006F1FD7    fstp        tbyte ptr [esp+8]
 006F1FDB    wait
 006F1FDC    fld         qword ptr ds:[822878];gvar_00822878:Double
 006F1FE2    fmul        st,st(0)
 006F1FE4    fld         tbyte ptr [esp+8]
 006F1FE8    faddp       st(1),st
 006F1FEA    fstp        tbyte ptr [esp+14]
 006F1FEE    wait
 006F1FEF    fld         qword ptr ds:[822880];gvar_00822880:Double
 006F1FF5    fmul        st,st(0)
 006F1FF7    fld         tbyte ptr [esp+14]
 006F1FFB    faddp       st(1),st
 006F1FFD    add         esp,0FFFFFFF4
 006F2000    fstp        tbyte ptr [esp]
 006F2003    wait
 006F2004    call        Sqrt
 006F2009    fstp        qword ptr [esp]
 006F200C    wait
>006F200D    jmp         006F2071
 006F200F    fld         qword ptr ds:[822888];gvar_00822888:Double
 006F2015    fmul        st,st(0)
 006F2017    fstp        tbyte ptr [esp+8]
 006F201B    wait
 006F201C    fld         qword ptr ds:[822890];gvar_00822890:Double
 006F2022    fmul        st,st(0)
 006F2024    fld         tbyte ptr [esp+8]
 006F2028    faddp       st(1),st
 006F202A    fstp        tbyte ptr [esp+14]
 006F202E    wait
 006F202F    fld         qword ptr ds:[822898];gvar_00822898:Double
 006F2035    fmul        st,st(0)
 006F2037    fld         tbyte ptr [esp+14]
 006F203B    faddp       st(1),st
 006F203D    add         esp,0FFFFFFF4
 006F2040    fstp        tbyte ptr [esp]
 006F2043    wait
 006F2044    call        Sqrt
 006F2049    fstp        qword ptr [esp]
 006F204C    wait
>006F204D    jmp         006F2071
 006F204F    mov         eax,[0078CE94];^gvar_008227E4
 006F2054    mov         eax,dword ptr [eax]
 006F2056    call        eax
 006F2058    test        al,4
 006F205A    sete        al
 006F205D    call        00686074
 006F2062    fstp        qword ptr [esp]
 006F2065    wait
>006F2066    jmp         006F2071
 006F2068    xor         eax,eax
 006F206A    mov         dword ptr [esp],eax
 006F206D    mov         dword ptr [esp+4],eax
 006F2071    fld         qword ptr [esp]
 006F2074    add         esp,20
 006F2077    ret
*}
end;

//006F2078
function TFalconValue.Module:TObject;
begin
{*
 006F2078    mov         eax,[0082282C];gvar_0082282C:TModuleFalcon
 006F207D    ret
*}
end;

//006F2080
{*procedure TFalconValue.SetValue(NewValue:Double; ?:?);
begin
 006F2080    push        ebp
 006F2081    mov         ebp,esp
 006F2083    mov         dl,1
 006F2085    mov         eax,dword ptr [eax+20];TFalconValue................................Item:Integer
 006F2088    sub         eax,25
>006F208B    je          006F2095
 006F208D    dec         eax
>006F208E    je          006F20A9
 006F2090    dec         eax
>006F2091    je          006F20BD
>006F2093    jmp         006F20CB
 006F2095    mov         eax,dword ptr [ebp+8]
 006F2098    mov         dword ptr ds:[8228C0],eax;gvar_008228C0:Double
 006F209E    mov         eax,dword ptr [ebp+0C]
 006F20A1    mov         dword ptr ds:[8228C4],eax;gvar_008228C4
>006F20A7    jmp         006F20CD
 006F20A9    mov         eax,dword ptr [ebp+8]
 006F20AC    mov         dword ptr ds:[8228C8],eax;gvar_008228C8:Double
 006F20B2    mov         eax,dword ptr [ebp+0C]
 006F20B5    mov         dword ptr ds:[8228CC],eax;gvar_008228CC
>006F20BB    jmp         006F20CD
 006F20BD    fld         qword ptr [ebp+8]
 006F20C0    fchs
 006F20C2    fstp        qword ptr ds:[8228D0];gvar_008228D0:Double
 006F20C8    wait
>006F20C9    jmp         006F20CD
 006F20CB    xor         edx,edx
 006F20CD    mov         eax,edx
 006F20CF    pop         ebp
 006F20D0    ret         8
end;*}

//006F20D4
{*procedure TFalconValue.ToString(?:?);
begin
 006F20D4    push        ebp
 006F20D5    mov         ebp,esp
 006F20D7    push        0
 006F20D9    push        0
 006F20DB    push        0
 006F20DD    push        ebx
 006F20DE    push        esi
 006F20DF    push        edi
 006F20E0    mov         esi,edx
 006F20E2    mov         ebx,eax
 006F20E4    xor         eax,eax
 006F20E6    push        ebp
 006F20E7    push        6F2171
 006F20EC    push        dword ptr fs:[eax]
 006F20EF    mov         dword ptr fs:[eax],esp
 006F20F2    mov         edi,dword ptr [ebx+18];TFalconValue........................................................
 006F20F5    test        edi,edi
>006F20F7    jle         006F2134
 006F20F9    push        6F218C;'Falcon'
 006F20FE    lea         edx,[ebp-4]
 006F2101    mov         eax,edi
 006F2103    call        IntToStr
 006F2108    push        dword ptr [ebp-4]
 006F210B    push        6F21A8;'.'
 006F2110    lea         ecx,[ebp-8]
 006F2113    mov         eax,[0082282C];gvar_0082282C:TModuleFalcon
 006F2118    mov         eax,dword ptr [eax+1C]
 006F211B    mov         edx,dword ptr [ebx+20];TFalconValue.................................Item:Integer
 006F211E    call        THashTable.Get
 006F2123    push        dword ptr [ebp-8]
 006F2126    mov         eax,esi
 006F2128    mov         edx,4
 006F212D    call        @UStrCatN
>006F2132    jmp         006F2156
 006F2134    lea         ecx,[ebp-0C]
 006F2137    mov         eax,[0082282C];gvar_0082282C:TModuleFalcon
 006F213C    mov         eax,dword ptr [eax+1C]
 006F213F    mov         edx,dword ptr [ebx+20];TFalconValue..................................Item:Integer
 006F2142    call        THashTable.Get
 006F2147    mov         ecx,dword ptr [ebp-0C]
 006F214A    mov         eax,esi
 006F214C    mov         edx,6F21B8;'Falcon.'
 006F2151    call        @UStrCat3
 006F2156    xor         eax,eax
 006F2158    pop         edx
 006F2159    pop         ecx
 006F215A    pop         ecx
 006F215B    mov         dword ptr fs:[eax],edx
 006F215E    push        6F2178
 006F2163    lea         eax,[ebp-0C]
 006F2166    mov         edx,3
 006F216B    call        @UStrArrayClr
 006F2170    ret
>006F2171    jmp         @HandleFinally
>006F2176    jmp         006F2163
 006F2178    pop         edi
 006F2179    pop         esi
 006F217A    pop         ebx
 006F217B    mov         esp,ebp
 006F217D    pop         ebp
 006F217E    ret
end;*}

//006F21C8
procedure sub_006F21C8;
begin
{*
 006F21C8    mov         byte ptr ds:[822824],0;gvar_00822824
 006F21CF    ret
*}
end;

//006F21D0
procedure sub_006F21D0;
begin
{*
 006F21D0    ret
*}
end;

//006F21D4
procedure sub_006F21D4;
begin
{*
 006F21D4    push        ebp
 006F21D5    mov         ebp,esp
 006F21D7    xor         ecx,ecx
 006F21D9    push        ecx
 006F21DA    push        ecx
 006F21DB    push        ecx
 006F21DC    push        ecx
 006F21DD    push        ecx
 006F21DE    push        ecx
 006F21DF    push        ebx
 006F21E0    push        esi
 006F21E1    push        edi
 006F21E2    xor         eax,eax
 006F21E4    push        ebp
 006F21E5    push        6F251E
 006F21EA    push        dword ptr fs:[eax]
 006F21ED    mov         dword ptr fs:[eax],esp
 006F21F0    cmp         byte ptr ds:[822824],0;gvar_00822824
>006F21F7    je          006F2503
 006F21FD    mov         byte ptr ds:[822825],0;gvar_00822825
 006F2204    call        006F0EE4
 006F2209    test        al,al
>006F220B    je          006F2503
 006F2211    mov         eax,[0078CF28];^gvar_008227D4
 006F2216    cmp         dword ptr [eax],0
>006F2219    jne         006F228E
 006F221B    mov         eax,[0078D420];^gvar_008227D0
 006F2220    cmp         dword ptr [eax],0
>006F2223    je          006F2503
 006F2229    xor         edx,edx
 006F222B    push        ebp
 006F222C    push        6F225D
 006F2231    push        dword ptr fs:[edx]
 006F2234    mov         dword ptr fs:[edx],esp
 006F2237    mov         ax,133F
 006F223B    call        Set8087CW
 006F2240    push        0
 006F2242    mov         eax,[0078D420];^gvar_008227D0
 006F2247    mov         eax,dword ptr [eax]
 006F2249    call        eax
 006F224B    mov         [00822830],eax;gvar_00822830
 006F2250    xor         eax,eax
 006F2252    pop         edx
 006F2253    pop         ecx
 006F2254    pop         ecx
 006F2255    mov         dword ptr fs:[eax],edx
>006F2258    jmp         006F22F3
>006F225D    jmp         @HandleOnException
 006F2262    dd          1
 006F2266    dd          00418C04;Exception
 006F226A    dd          006F226E
 006F226E    mov         eax,6F2538;'Missing FTD2XX.dll'
 006F2273    call        004FA048
 006F2278    call        006F14C8
 006F227D    call        @DoneExcept
>006F2282    jmp         006F2503
 006F2287    call        @DoneExcept
>006F228C    jmp         006F22F3
 006F228E    xor         edx,edx
 006F2290    push        ebp
 006F2291    push        6F22C4
 006F2296    push        dword ptr fs:[edx]
 006F2299    mov         dword ptr fs:[edx],esp
 006F229C    mov         ax,133F
 006F22A0    call        Set8087CW
 006F22A5    push        0
 006F22A7    push        6F2560
 006F22AC    mov         eax,[0078CF28];^gvar_008227D4
 006F22B1    mov         eax,dword ptr [eax]
 006F22B3    call        eax
 006F22B5    mov         [00822830],eax;gvar_00822830
 006F22BA    xor         eax,eax
 006F22BC    pop         edx
 006F22BD    pop         ecx
 006F22BE    pop         ecx
 006F22BF    mov         dword ptr fs:[eax],edx
>006F22C2    jmp         006F22F3
>006F22C4    jmp         @HandleOnException
 006F22C9    dd          1
 006F22CD    dd          00418C04;Exception
 006F22D1    dd          006F22D5
 006F22D5    mov         eax,6F2538;'Missing FTD2XX.dll'
 006F22DA    call        004FA048
 006F22DF    call        006F14C8
 006F22E4    call        @DoneExcept
>006F22E9    jmp         006F2503
 006F22EE    call        @DoneExcept
 006F22F3    cmp         dword ptr ds:[822830],0FFFFFFFF;gvar_00822830
>006F22FA    jne         006F2306
 006F22FC    call        006F14C8
>006F2301    jmp         006F2503
 006F2306    xor         eax,eax
 006F2308    push        ebp
 006F2309    push        6F2331
 006F230E    push        dword ptr fs:[eax]
 006F2311    mov         dword ptr fs:[eax],esp
 006F2314    mov         eax,[0078CDE0];^gvar_008227DC
 006F2319    cmp         dword ptr [eax],0
>006F231C    je          006F2327
 006F231E    mov         eax,[0078CDE0];^gvar_008227DC
 006F2323    mov         eax,dword ptr [eax]
 006F2325    call        eax
 006F2327    xor         eax,eax
 006F2329    pop         edx
 006F232A    pop         ecx
 006F232B    pop         ecx
 006F232C    mov         dword ptr fs:[eax],edx
>006F232F    jmp         006F239B
>006F2331    jmp         @HandleOnException
 006F2336    dd          1
 006F233A    dd          00418C04;Exception
 006F233E    dd          006F2342
 006F2342    mov         ebx,eax
 006F2344    lea         edx,[ebp-8]
 006F2347    mov         eax,dword ptr [ebx]
 006F2349    call        TObject.ClassName
 006F234E    push        dword ptr [ebp-8]
 006F2351    push        6F2574;': '
 006F2356    push        dword ptr [ebx+4];Exception.FMessage:string
 006F2359    lea         eax,[ebp-4]
 006F235C    mov         edx,3
 006F2361    call        @UStrCatN
 006F2366    mov         eax,dword ptr [ebp-4]
 006F2369    call        004FA048
 006F236E    mov         eax,[0078D644];^gvar_0082281C
 006F2373    cmp         dword ptr [eax],0
>006F2376    je          006F2387
 006F2378    mov         eax,[00822830];gvar_00822830
 006F237D    push        eax
 006F237E    mov         eax,[0078D644];^gvar_0082281C
 006F2383    mov         eax,dword ptr [eax]
 006F2385    call        eax
 006F2387    call        006F14C8
 006F238C    call        @DoneExcept
>006F2391    jmp         006F2503
 006F2396    call        @DoneExcept
 006F239B    xor         eax,eax
 006F239D    push        ebp
 006F239E    push        6F23CC
 006F23A3    push        dword ptr fs:[eax]
 006F23A6    mov         dword ptr fs:[eax],esp
 006F23A9    mov         eax,[0078D4D4];^gvar_008227D8
 006F23AE    cmp         dword ptr [eax],0
>006F23B1    je          006F23C2
 006F23B3    mov         eax,[00822830];gvar_00822830
 006F23B8    push        eax
 006F23B9    mov         eax,[0078D4D4];^gvar_008227D8
 006F23BE    mov         eax,dword ptr [eax]
 006F23C0    call        eax
 006F23C2    xor         eax,eax
 006F23C4    pop         edx
 006F23C5    pop         ecx
 006F23C6    pop         ecx
 006F23C7    mov         dword ptr fs:[eax],edx
>006F23CA    jmp         006F2449
>006F23CC    jmp         @HandleOnException
 006F23D1    dd          1
 006F23D5    dd          00418C04;Exception
 006F23D9    dd          006F23DD
 006F23DD    mov         ebx,eax
 006F23DF    lea         edx,[ebp-10]
 006F23E2    mov         eax,dword ptr [ebx]
 006F23E4    call        TObject.ClassName
 006F23E9    push        dword ptr [ebp-10]
 006F23EC    push        6F2574;': '
 006F23F1    push        dword ptr [ebx+4];Exception.FMessage:string
 006F23F4    lea         eax,[ebp-0C]
 006F23F7    mov         edx,3
 006F23FC    call        @UStrCatN
 006F2401    mov         eax,dword ptr [ebp-0C]
 006F2404    call        004FA048
 006F2409    mov         eax,[0078DAA4];^gvar_00822818
 006F240E    cmp         dword ptr [eax],0
>006F2411    je          006F241C
 006F2413    mov         eax,[0078DAA4];^gvar_00822818
 006F2418    mov         eax,dword ptr [eax]
 006F241A    call        eax
 006F241C    mov         eax,[0078D644];^gvar_0082281C
 006F2421    cmp         dword ptr [eax],0
>006F2424    je          006F2435
 006F2426    mov         eax,[00822830];gvar_00822830
 006F242B    push        eax
 006F242C    mov         eax,[0078D644];^gvar_0082281C
 006F2431    mov         eax,dword ptr [eax]
 006F2433    call        eax
 006F2435    call        006F14C8
 006F243A    call        @DoneExcept
>006F243F    jmp         006F2503
 006F2444    call        @DoneExcept
 006F2449    xor         eax,eax
 006F244B    push        ebp
 006F244C    push        6F2482
 006F2451    push        dword ptr fs:[eax]
 006F2454    mov         dword ptr fs:[eax],esp
 006F2457    mov         eax,[0078D0C0];^gvar_008227FC
 006F245C    cmp         dword ptr [eax],0
>006F245F    je          006F2478
 006F2461    push        0
 006F2463    push        0
 006F2465    push        6F1C64
 006F246A    mov         eax,[0078D0C0];^gvar_008227FC
 006F246F    mov         eax,dword ptr [eax]
 006F2471    call        eax
 006F2473    mov         [00822834],eax;gvar_00822834
 006F2478    xor         eax,eax
 006F247A    pop         edx
 006F247B    pop         ecx
 006F247C    pop         ecx
 006F247D    mov         dword ptr fs:[eax],edx
>006F2480    jmp         006F24FC
>006F2482    jmp         @HandleOnException
 006F2487    dd          1
 006F248B    dd          00418C04;Exception
 006F248F    dd          006F2493
 006F2493    mov         ebx,eax
 006F2495    lea         edx,[ebp-18]
 006F2498    mov         eax,dword ptr [ebx]
 006F249A    call        TObject.ClassName
 006F249F    push        dword ptr [ebp-18]
 006F24A2    push        6F2574;': '
 006F24A7    push        dword ptr [ebx+4];Exception.FMessage:string
 006F24AA    lea         eax,[ebp-14]
 006F24AD    mov         edx,3
 006F24B2    call        @UStrCatN
 006F24B7    mov         eax,dword ptr [ebp-14]
 006F24BA    call        004FA048
 006F24BF    mov         eax,[0078DAA4];^gvar_00822818
 006F24C4    cmp         dword ptr [eax],0
>006F24C7    je          006F24D2
 006F24C9    mov         eax,[0078DAA4];^gvar_00822818
 006F24CE    mov         eax,dword ptr [eax]
 006F24D0    call        eax
 006F24D2    mov         eax,[0078D644];^gvar_0082281C
 006F24D7    cmp         dword ptr [eax],0
>006F24DA    je          006F24EB
 006F24DC    mov         eax,[00822830];gvar_00822830
 006F24E1    push        eax
 006F24E2    mov         eax,[0078D644];^gvar_0082281C
 006F24E7    mov         eax,dword ptr [eax]
 006F24E9    call        eax
 006F24EB    call        006F14C8
 006F24F0    call        @DoneExcept
>006F24F5    jmp         006F2503
 006F24F7    call        @DoneExcept
 006F24FC    mov         byte ptr ds:[822825],1;gvar_00822825
 006F2503    xor         eax,eax
 006F2505    pop         edx
 006F2506    pop         ecx
 006F2507    pop         ecx
 006F2508    mov         dword ptr fs:[eax],edx
 006F250B    push        6F2525
 006F2510    lea         eax,[ebp-18]
 006F2513    mov         edx,6
 006F2518    call        @UStrArrayClr
 006F251D    ret
>006F251E    jmp         @HandleFinally
>006F2523    jmp         006F2510
 006F2525    pop         edi
 006F2526    pop         esi
 006F2527    pop         ebx
 006F2528    mov         esp,ebp
 006F252A    pop         ebp
 006F252B    ret
*}
end;

//006F257C
procedure sub_006F257C;
begin
{*
 006F257C    movzx       eax,byte ptr ds:[822824];gvar_00822824
 006F2583    and         al,byte ptr ds:[822825];gvar_00822825
>006F2589    je          006F25DC
 006F258B    mov         eax,[0078D0D8];^gvar_00822814
 006F2590    cmp         dword ptr [eax],0
>006F2593    je          006F25A4
 006F2595    mov         eax,[00822834];gvar_00822834
 006F259A    push        eax
 006F259B    mov         eax,[0078D0D8];^gvar_00822814
 006F25A0    mov         eax,dword ptr [eax]
 006F25A2    call        eax
 006F25A4    mov         eax,[0078DAA4];^gvar_00822818
 006F25A9    cmp         dword ptr [eax],0
>006F25AC    je          006F25B7
 006F25AE    mov         eax,[0078DAA4];^gvar_00822818
 006F25B3    mov         eax,dword ptr [eax]
 006F25B5    call        eax
 006F25B7    mov         eax,[0078D644];^gvar_0082281C
 006F25BC    cmp         dword ptr [eax],0
>006F25BF    je          006F25D0
 006F25C1    mov         eax,[00822830];gvar_00822830
 006F25C6    push        eax
 006F25C7    mov         eax,[0078D644];^gvar_0082281C
 006F25CC    mov         eax,dword ptr [eax]
 006F25CE    call        eax
 006F25D0    call        006F14C8
 006F25D5    mov         byte ptr ds:[822825],0;gvar_00822825
 006F25DC    ret
*}
end;

//006F25E0
{*function sub_006F25E0:?;
begin
 006F25E0    movzx       eax,byte ptr ds:[822824];gvar_00822824
 006F25E7    and         al,byte ptr ds:[822825];gvar_00822825
 006F25ED    ret
end;*}

//006F25F0
{*function sub_006F25F0:?;
begin
 006F25F0    push        ebx
 006F25F1    push        ecx
 006F25F2    mov         bl,1
 006F25F4    call        006F25E0
 006F25F9    test        al,al
>006F25FB    je          006F2627
 006F25FD    push        esp
 006F25FE    mov         eax,[0078D874];^gvar_00822810
 006F2603    mov         eax,dword ptr [eax]
 006F2605    call        eax
 006F2607    push        1
 006F2609    push        0
 006F260B    push        6F1CA0
 006F2610    mov         eax,[0078D0C0];^gvar_008227FC
 006F2615    mov         eax,dword ptr [eax]
 006F2617    call        eax
 006F2619    cmp         dword ptr [esp],0
>006F261D    jl          006F2627
 006F261F    mov         eax,dword ptr [esp]
 006F2622    mov         [008228A0],eax;gvar_008228A0
 006F2627    mov         eax,ebx
 006F2629    pop         edx
 006F262A    pop         ebx
 006F262B    ret
end;*}

//006F262C
{*function sub_006F262C:?;
begin
 006F262C    push        ebx
 006F262D    mov         dl,1
 006F262F    mov         eax,[0043C7BC];TStringList
 006F2634    call        TStringList.Create;TStringList.Create
 006F2639    mov         ebx,eax
 006F263B    mov         edx,6F26A0;'x'
 006F2640    mov         eax,ebx
 006F2642    mov         ecx,dword ptr [eax]
 006F2644    call        dword ptr [ecx+38];TStringList.Add
 006F2647    mov         edx,6F26B0;'y'
 006F264C    mov         eax,ebx
 006F264E    mov         ecx,dword ptr [eax]
 006F2650    call        dword ptr [ecx+38];TStringList.Add
 006F2653    mov         edx,6F26C0;'z'
 006F2658    mov         eax,ebx
 006F265A    mov         ecx,dword ptr [eax]
 006F265C    call        dword ptr [ecx+38];TStringList.Add
 006F265F    mov         edx,6F26D0;'button1'
 006F2664    mov         eax,ebx
 006F2666    mov         ecx,dword ptr [eax]
 006F2668    call        dword ptr [ecx+38];TStringList.Add
 006F266B    mov         edx,6F26EC;'button2'
 006F2670    mov         eax,ebx
 006F2672    mov         ecx,dword ptr [eax]
 006F2674    call        dword ptr [ecx+38];TStringList.Add
 006F2677    mov         edx,6F2708;'button3'
 006F267C    mov         eax,ebx
 006F267E    mov         ecx,dword ptr [eax]
 006F2680    call        dword ptr [ecx+38];TStringList.Add
 006F2683    mov         edx,6F2724;'button4'
 006F2688    mov         eax,ebx
 006F268A    mov         ecx,dword ptr [eax]
 006F268C    call        dword ptr [ecx+38];TStringList.Add
 006F268F    mov         eax,ebx
 006F2691    pop         ebx
 006F2692    ret
end;*}

//006F2734
procedure TModuleFalcon.AddFields;
begin
{*
 006F2734    push        ebp
 006F2735    mov         ebp,esp
 006F2737    push        0
 006F2739    push        0
 006F273B    push        ebx
 006F273C    push        esi
 006F273D    mov         ebx,eax
 006F273F    xor         eax,eax
 006F2741    push        ebp
 006F2742    push        6F28B8
 006F2747    push        dword ptr fs:[eax]
 006F274A    mov         dword ptr fs:[eax],esp
 006F274D    xor         esi,esi
 006F274F    lea         edx,[ebp-8]
 006F2752    lea         eax,[esi+1]
 006F2755    call        IntToStr
 006F275A    mov         ecx,dword ptr [ebp-8]
 006F275D    lea         eax,[ebp-4]
 006F2760    mov         edx,6F28D4;'button'
 006F2765    call        @UStrCat3
 006F276A    mov         edx,dword ptr [ebp-4]
 006F276D    mov         ecx,esi
 006F276F    mov         eax,dword ptr [ebx+1C];TModuleFalcon.Fields:THashTable
 006F2772    call        THashTable.Add
 006F2777    inc         esi
 006F2778    cmp         esi,1F
>006F277B    jne         006F274F
 006F277D    mov         ecx,21
 006F2782    mov         edx,6F28F0;'exists'
 006F2787    mov         eax,dword ptr [ebx+1C];TModuleFalcon.Fields:THashTable
 006F278A    call        THashTable.Add
 006F278F    mov         ecx,22
 006F2794    mov         edx,6F290C;'x'
 006F2799    mov         eax,dword ptr [ebx+1C];TModuleFalcon.Fields:THashTable
 006F279C    call        THashTable.Add
 006F27A1    mov         ecx,23
 006F27A6    mov         edx,6F291C;'y'
 006F27AB    mov         eax,dword ptr [ebx+1C];TModuleFalcon.Fields:THashTable
 006F27AE    call        THashTable.Add
 006F27B3    mov         ecx,24
 006F27B8    mov         edx,6F292C;'z'
 006F27BD    mov         eax,dword ptr [ebx+1C];TModuleFalcon.Fields:THashTable
 006F27C0    call        THashTable.Add
 006F27C5    mov         ecx,28
 006F27CA    mov         edx,6F293C;^'RealLeftStick'
 006F27CF    mov         eax,dword ptr [ebx+1C];TModuleFalcon.Fields:THashTable
 006F27D2    call        THashTable.Add
 006F27D7    mov         ecx,28
 006F27DC    mov         edx,6F2950;^'RealLeftStick'
 006F27E1    mov         eax,dword ptr [ebx+1C];TModuleFalcon.Fields:THashTable
 006F27E4    call        THashTable.Add
 006F27E9    mov         ecx,25
 006F27EE    mov         edx,6F2970;'ForceX'
 006F27F3    mov         eax,dword ptr [ebx+1C];TModuleFalcon.Fields:THashTable
 006F27F6    call        THashTable.Add
 006F27FB    mov         ecx,26
 006F2800    mov         edx,6F298C;'ForceY'
 006F2805    mov         eax,dword ptr [ebx+1C];TModuleFalcon.Fields:THashTable
 006F2808    call        THashTable.Add
 006F280D    mov         ecx,27
 006F2812    mov         edx,6F29A8;'ForceZ'
 006F2817    mov         eax,dword ptr [ebx+1C];TModuleFalcon.Fields:THashTable
 006F281A    call        THashTable.Add
 006F281F    mov         ecx,29
 006F2824    mov         edx,6F29C4;'Force'
 006F2829    mov         eax,dword ptr [ebx+1C];TModuleFalcon.Fields:THashTable
 006F282C    call        THashTable.Add
 006F2831    mov         ecx,29
 006F2836    mov         edx,6F29DC;'TotalForce'
 006F283B    mov         eax,dword ptr [ebx+1C];TModuleFalcon.Fields:THashTable
 006F283E    call        THashTable.Add
 006F2843    mov         ecx,25
 006F2848    mov         edx,6F2A00;'TotalForceX'
 006F284D    mov         eax,dword ptr [ebx+1C];TModuleFalcon.Fields:THashTable
 006F2850    call        THashTable.Add
 006F2855    mov         ecx,26
 006F285A    mov         edx,6F2A24;'TotalForceY'
 006F285F    mov         eax,dword ptr [ebx+1C];TModuleFalcon.Fields:THashTable
 006F2862    call        THashTable.Add
 006F2867    mov         ecx,27
 006F286C    mov         edx,6F2A48;'TotalForceZ'
 006F2871    mov         eax,dword ptr [ebx+1C];TModuleFalcon.Fields:THashTable
 006F2874    call        THashTable.Add
 006F2879    mov         ecx,2A
 006F287E    mov         edx,6F2A6C;'homed'
 006F2883    mov         eax,dword ptr [ebx+1C];TModuleFalcon.Fields:THashTable
 006F2886    call        THashTable.Add
 006F288B    mov         ecx,2A
 006F2890    mov         edx,6F2A84;'calibrated'
 006F2895    mov         eax,dword ptr [ebx+1C];TModuleFalcon.Fields:THashTable
 006F2898    call        THashTable.Add
 006F289D    xor         eax,eax
 006F289F    pop         edx
 006F28A0    pop         ecx
 006F28A1    pop         ecx
 006F28A2    mov         dword ptr fs:[eax],edx
 006F28A5    push        6F28BF
 006F28AA    lea         eax,[ebp-8]
 006F28AD    mov         edx,2
 006F28B2    call        @UStrArrayClr
 006F28B7    ret
>006F28B8    jmp         @HandleFinally
>006F28BD    jmp         006F28AA
 006F28BF    pop         esi
 006F28C0    pop         ebx
 006F28C1    pop         ecx
 006F28C2    pop         ecx
 006F28C3    pop         ebp
 006F28C4    ret
*}
end;

//006F2A9C
procedure TModuleFalcon.ClearRead;
begin
{*
 006F2A9C    call        TPieModule.ClearRead
 006F2AA1    ret
*}
end;

//006F2AA4
constructor TModuleFalcon.Create;
begin
{*
 006F2AA4    push        ebx
 006F2AA5    push        esi
 006F2AA6    test        dl,dl
>006F2AA8    je          006F2AB2
 006F2AAA    add         esp,0FFFFFFF0
 006F2AAD    call        @ClassCreate
 006F2AB2    mov         ebx,edx
 006F2AB4    mov         esi,eax
 006F2AB6    push        0
 006F2AB8    push        0
 006F2ABA    push        0
 006F2ABC    push        0
 006F2ABE    mov         ecx,6F2AFC;'Falcon'
 006F2AC3    xor         edx,edx
 006F2AC5    mov         eax,esi
 006F2AC7    call        005E48EC
 006F2ACC    mov         dword ptr [esi+20],2A;TModuleFalcon.MaxFieldNumber:Integer
 006F2AD3    mov         eax,esi
 006F2AD5    test        bl,bl
>006F2AD7    je          006F2AE8
 006F2AD9    call        @AfterConstruction
 006F2ADE    pop         dword ptr fs:[0]
 006F2AE5    add         esp,0C
 006F2AE8    mov         eax,esi
 006F2AEA    pop         esi
 006F2AEB    pop         ebx
 006F2AEC    ret
*}
end;

//006F2B0C
function TModuleFalcon.CreateValue(Identifier:string):TExpression;
begin
{*
 006F2B0C    push        ebp
 006F2B0D    mov         ebp,esp
 006F2B0F    push        ecx
 006F2B10    push        ebx
 006F2B11    mov         dword ptr [ebp-4],edx
 006F2B14    mov         ebx,eax
 006F2B16    mov         eax,dword ptr [ebp-4]
 006F2B19    call        @UStrAddRef
 006F2B1E    xor         eax,eax
 006F2B20    push        ebp
 006F2B21    push        6F2B50
 006F2B26    push        dword ptr fs:[eax]
 006F2B29    mov         dword ptr fs:[eax],esp
 006F2B2C    mov         byte ptr [ebx+24],1;TModuleFalcon.Used:Boolean
 006F2B30    mov         eax,dword ptr [ebp-4]
 006F2B33    call        006F1CD0
 006F2B38    mov         ebx,eax
 006F2B3A    xor         eax,eax
 006F2B3C    pop         edx
 006F2B3D    pop         ecx
 006F2B3E    pop         ecx
 006F2B3F    mov         dword ptr fs:[eax],edx
 006F2B42    push        6F2B57
 006F2B47    lea         eax,[ebp-4]
 006F2B4A    call        @UStrClr
 006F2B4F    ret
>006F2B50    jmp         @HandleFinally
>006F2B55    jmp         006F2B47
 006F2B57    mov         eax,ebx
 006F2B59    pop         ebx
 006F2B5A    pop         ecx
 006F2B5B    pop         ebp
 006F2B5C    ret
*}
end;

//006F2B60
function TModuleFalcon.GetDefaultFormat(field:string):TGuiFormat;
begin
{*
 006F2B60    push        ebp
 006F2B61    mov         ebp,esp
 006F2B63    push        ecx
 006F2B64    push        ebx
 006F2B65    mov         dword ptr [ebp-4],edx
 006F2B68    mov         ebx,eax
 006F2B6A    mov         eax,dword ptr [ebp-4]
 006F2B6D    call        @UStrAddRef
 006F2B72    xor         eax,eax
 006F2B74    push        ebp
 006F2B75    push        6F2BB1
 006F2B7A    push        dword ptr fs:[eax]
 006F2B7D    mov         dword ptr fs:[eax],esp
 006F2B80    mov         edx,dword ptr [ebp-4]
 006F2B83    mov         eax,dword ptr [ebx+1C];TModuleFalcon.Fields:THashTable
 006F2B86    call        THashTable.Get
 006F2B8B    sub         eax,22
>006F2B8E    jb          006F2B95
 006F2B90    sub         eax,8
>006F2B93    jne         006F2B99
 006F2B95    xor         ebx,ebx
>006F2B97    jmp         006F2B9B
 006F2B99    mov         bl,9
 006F2B9B    xor         eax,eax
 006F2B9D    pop         edx
 006F2B9E    pop         ecx
 006F2B9F    pop         ecx
 006F2BA0    mov         dword ptr fs:[eax],edx
 006F2BA3    push        6F2BB8
 006F2BA8    lea         eax,[ebp-4]
 006F2BAB    call        @UStrClr
 006F2BB0    ret
>006F2BB1    jmp         @HandleFinally
>006F2BB6    jmp         006F2BA8
 006F2BB8    mov         eax,ebx
 006F2BBA    pop         ebx
 006F2BBB    pop         ecx
 006F2BBC    pop         ebp
 006F2BBD    ret
*}
end;

//006F2BC0
procedure TModuleFalcon.GetGoodFields;
begin
{*
 006F2BC0    call        006F262C
 006F2BC5    ret
*}
end;

//006F2BC8
procedure TModuleFalcon.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 006F2BC8    push        ebp
 006F2BC9    mov         ebp,esp
 006F2BCB    mov         byte ptr [edx],1
 006F2BCE    mov         dword ptr [ecx],0FFFFFFFF
 006F2BD4    mov         eax,dword ptr [ebp+8]
 006F2BD7    mov         dword ptr [eax],0FFFFFFFF
 006F2BDD    pop         ebp
 006F2BDE    ret         4
*}
end;

//006F2BE4
procedure TModuleFalcon.Read;
begin
{*
 006F2BE4    call        006F25F0
 006F2BE9    ret
*}
end;

//006F2BEC
procedure TModuleFalcon.StartCompiletime;
begin
{*
 006F2BEC    call        TPieModule.StartCompiletime
 006F2BF1    call        006F21C8
 006F2BF6    ret
*}
end;

//006F2BF8
procedure TModuleFalcon.StartRuntime;
begin
{*
 006F2BF8    call        TPieModule.StartRuntime
 006F2BFD    call        006F21D4
 006F2C02    ret
*}
end;

//006F2C04
procedure TModuleFalcon.StopCompiletime;
begin
{*
 006F2C04    push        ebx
 006F2C05    mov         ebx,eax
 006F2C07    call        006F21D0
 006F2C0C    mov         eax,ebx
 006F2C0E    call        TPieModule.StopCompiletime
 006F2C13    pop         ebx
 006F2C14    ret
*}
end;

//006F2C18
procedure TModuleFalcon.StopRuntime;
begin
{*
 006F2C18    push        ebx
 006F2C19    mov         ebx,eax
 006F2C1B    call        006F257C
 006F2C20    mov         eax,ebx
 006F2C22    call        TPieModule.StopRuntime
 006F2C27    pop         ebx
 006F2C28    ret
*}
end;

Initialization
//00782CB0
{*
 00782CB0    sub         dword ptr ds:[822828],1
>00782CB7    jae         00782CD4
 00782CB9    mov         dl,1
 00782CBB    mov         eax,[006F18B0];TModuleFalcon
 00782CC0    call        TModuleFalcon.Create;TModuleFalcon.Create
 00782CC5    mov         [0082282C],eax;gvar_0082282C:TModuleFalcon
 00782CCA    mov         eax,[0082282C];gvar_0082282C:TModuleFalcon
 00782CCF    call        005E31AC
 00782CD4    ret
*}
Finalization
end.