//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieHatTrack;

interface

uses
  SysUtils, Classes;

type
  THatTrackValue = class(TObjectValue)
  published
    function GetPerUnits1:TUnits;//006F3BCC
    function GetUnits:TUnits;//006F3C14
    //procedure GetString(?:?);//006F3BEC
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;//006F42D8
    procedure GetVector(x:Double; y:Double; z:Double);//006F3F58
    function GetPerUnits2:TUnits;//006F3BDC
    procedure FillClone(c:TExpression);//006F3B5C
    //function SetValue(NewValue:Double; ?:?):Boolean;//006F4018
    function CanSet:Boolean;//006F3B48
    function GetDataType:TDataType;//006F3B7C
    procedure CreateClone;//006F3B4C
    procedure GetValue;//006F3C30
    //procedure ToString(?:?);//006F43F4
  public
    ..........................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//006F43F4
    procedure GetValue; virtual;//v2C//006F3C30
    //procedure GetString(?:?); virtual;//v38//006F3BEC
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//006F3F58
    function GetDataType:TDataType; virtual;//v44//006F3B7C
    function GetUnits:TUnits; virtual;//v48//006F3C14
    function GetPerUnits1:TUnits; virtual;//v4C//006F3BCC
    function GetPerUnits2:TUnits; virtual;//v50//006F3BDC
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//006F4018
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean; virtual;//v60//006F42D8
    function CanSet:Boolean; virtual;//v68//006F3B48
    procedure CreateClone; virtual;//v80//006F3B4C
    procedure FillClone(c:TExpression); virtual;//v84//006F3B5C
  end;
    sub_006F36A0;//006F36A0
    //function sub_006F36A8:?;//006F36A8
    sub_006F36B0;//006F36B0
    sub_006F36B8;//006F36B8
    procedure sub_006F36C0;//006F36C0
    //function sub_006F3A28(?:?):?;//006F3A28
    procedure sub_006F44E0;//006F44E0
    procedure sub_006F44E8;//006F44E8
    procedure sub_006F44EC;//006F44EC
    procedure sub_006F4500;//006F4500
    //function sub_006F451C:?;//006F451C
    //function sub_006F4560(?:UnicodeString):?;//006F4560
    //procedure sub_006F45B0(?:Integer; ?:?);//006F45B0
    //function sub_006F45C8:?;//006F45C8
    //function sub_006F463C(?:?):?;//006F463C

implementation

//006F36A8
{*function sub_006F36A8:?;
begin
 006F36A8    jmp         dword ptr ds:[826988]
end;*}

//006F36C0
procedure sub_006F36C0;
begin
{*
 006F36C0    push        ebx
 006F36C1    mov         ebx,8228E0;gvar_008228E0:THashTable
 006F36C6    xor         ecx,ecx
 006F36C8    mov         edx,6F3848;'Exists'
 006F36CD    mov         eax,dword ptr [ebx]
 006F36CF    call        THashTable.Add
 006F36D4    mov         ecx,4
 006F36D9    mov         edx,6F3864;'X'
 006F36DE    mov         eax,dword ptr [ebx]
 006F36E0    call        THashTable.Add
 006F36E5    mov         ecx,5
 006F36EA    mov         edx,6F3874;'Y'
 006F36EF    mov         eax,dword ptr [ebx]
 006F36F1    call        THashTable.Add
 006F36F6    mov         ecx,6
 006F36FB    mov         edx,6F3884;'Z'
 006F3700    mov         eax,dword ptr [ebx]
 006F3702    call        THashTable.Add
 006F3707    mov         ecx,7
 006F370C    mov         edx,6F3894;'Pos'
 006F3711    mov         eax,dword ptr [ebx]
 006F3713    call        THashTable.Add
 006F3718    mov         ecx,7
 006F371D    mov         edx,6F38A8;'XYZ'
 006F3722    mov         eax,dword ptr [ebx]
 006F3724    call        THashTable.Add
 006F3729    mov         ecx,1
 006F372E    mov         edx,6F38BC;'Yaw'
 006F3733    mov         eax,dword ptr [ebx]
 006F3735    call        THashTable.Add
 006F373A    mov         ecx,2
 006F373F    mov         edx,6F38D0;'Pitch'
 006F3744    mov         eax,dword ptr [ebx]
 006F3746    call        THashTable.Add
 006F374B    mov         ecx,3
 006F3750    mov         edx,6F38E8;'Roll'
 006F3755    mov         eax,dword ptr [ebx]
 006F3757    call        THashTable.Add
 006F375C    mov         ecx,8
 006F3761    mov         edx,6F3900;'RawYaw'
 006F3766    mov         eax,dword ptr [ebx]
 006F3768    call        THashTable.Add
 006F376D    mov         ecx,9
 006F3772    mov         edx,6F391C;'RawPitch'
 006F3777    mov         eax,dword ptr [ebx]
 006F3779    call        THashTable.Add
 006F377E    mov         ecx,0A
 006F3783    mov         edx,6F393C;'RawRoll'
 006F3788    mov         eax,dword ptr [ebx]
 006F378A    call        THashTable.Add
 006F378F    mov         ecx,0B
 006F3794    mov         edx,6F3958;'RawX'
 006F3799    mov         eax,dword ptr [ebx]
 006F379B    call        THashTable.Add
 006F37A0    mov         ecx,0C
 006F37A5    mov         edx,6F3970;'RawY'
 006F37AA    mov         eax,dword ptr [ebx]
 006F37AC    call        THashTable.Add
 006F37B1    mov         ecx,0D
 006F37B6    mov         edx,6F3988;'RawZ'
 006F37BB    mov         eax,dword ptr [ebx]
 006F37BD    call        THashTable.Add
 006F37C2    mov         ecx,0E
 006F37C7    mov         edx,6F39A0;'RawPos'
 006F37CC    mov         eax,dword ptr [ebx]
 006F37CE    call        THashTable.Add
 006F37D3    mov         ecx,13
 006F37D8    mov         edx,6F39BC;'gPx'
 006F37DD    mov         eax,dword ptr [ebx]
 006F37DF    call        THashTable.Add
 006F37E4    mov         ecx,14
 006F37E9    mov         edx,6F39D0;'gPy'
 006F37EE    mov         eax,dword ptr [ebx]
 006F37F0    call        THashTable.Add
 006F37F5    mov         ecx,11
 006F37FA    mov         edx,6F39E4;'gDz'
 006F37FF    mov         eax,dword ptr [ebx]
 006F3801    call        THashTable.Add
 006F3806    mov         ecx,0F
 006F380B    mov         edx,6F39F8;'gDx'
 006F3810    mov         eax,dword ptr [ebx]
 006F3812    call        THashTable.Add
 006F3817    mov         ecx,10
 006F381C    mov         edx,6F3A0C;'gDy'
 006F3821    mov         eax,dword ptr [ebx]
 006F3823    call        THashTable.Add
 006F3828    mov         ecx,12
 006F382D    mov         edx,6F3A20;'gDt'
 006F3832    mov         eax,dword ptr [ebx]
 006F3834    call        THashTable.Add
 006F3839    pop         ebx
 006F383A    ret
*}
end;

//006F3A28
{*function sub_006F3A28(?:?):?;
begin
 006F3A28    push        ebp
 006F3A29    mov         ebp,esp
 006F3A2B    add         esp,0FFFFFFF8
 006F3A2E    push        ebx
 006F3A2F    push        esi
 006F3A30    push        edi
 006F3A31    xor         edx,edx
 006F3A33    mov         dword ptr [ebp-8],edx
 006F3A36    mov         dword ptr [ebp-4],eax
 006F3A39    mov         eax,dword ptr [ebp-4]
 006F3A3C    call        @UStrAddRef
 006F3A41    xor         eax,eax
 006F3A43    push        ebp
 006F3A44    push        6F3AE6
 006F3A49    push        dword ptr fs:[eax]
 006F3A4C    mov         dword ptr fs:[eax],esp
 006F3A4F    xor         ebx,ebx
 006F3A51    lea         eax,[ebp-8]
 006F3A54    mov         edx,dword ptr [ebp-4]
 006F3A57    call        @UStrLAsg
 006F3A5C    lea         eax,[ebp-8]
 006F3A5F    mov         edx,6F3B04;'HatTrack'
 006F3A64    call        004F9BD0
 006F3A69    test        al,al
>006F3A6B    jne         006F3A7E
 006F3A6D    lea         eax,[ebp-8]
 006F3A70    mov         edx,6F3B24;'hat_track'
 006F3A75    call        004F9BD0
 006F3A7A    test        al,al
>006F3A7C    je          006F3ACB
 006F3A7E    lea         eax,[ebp-8]
 006F3A81    call        004F9D00
 006F3A86    mov         esi,eax
 006F3A88    lea         eax,[ebp-8]
 006F3A8B    mov         edx,6F3B44;'.'
 006F3A90    call        004F9BD0
 006F3A95    test        al,al
>006F3A97    je          006F3ACB
 006F3A99    mov         eax,dword ptr [ebp-8]
 006F3A9C    call        006F4560
 006F3AA1    mov         edi,eax
 006F3AA3    test        edi,edi
>006F3AA5    jl          006F3ACB
 006F3AA7    mov         dl,1
 006F3AA9    mov         eax,[006F3258];THatTrackValue
 006F3AAE    call        TObject.Create;THatTrackValue.Create
 006F3AB3    mov         ebx,eax
 006F3AB5    mov         dword ptr [ebx+20],edi;THatTrackValue............................Item:Integer
 006F3AB8    test        esi,esi
>006F3ABA    jg          006F3AC1
 006F3ABC    mov         esi,1
 006F3AC1    mov         dword ptr [ebx+18],esi;THatTrackValue......................................................
 006F3AC4    mov         byte ptr ds:[8228E4],1;gvar_008228E4
 006F3ACB    xor         eax,eax
 006F3ACD    pop         edx
 006F3ACE    pop         ecx
 006F3ACF    pop         ecx
 006F3AD0    mov         dword ptr fs:[eax],edx
 006F3AD3    push        6F3AED
 006F3AD8    lea         eax,[ebp-8]
 006F3ADB    mov         edx,2
 006F3AE0    call        @UStrArrayClr
 006F3AE5    ret
>006F3AE6    jmp         @HandleFinally
>006F3AEB    jmp         006F3AD8
 006F3AED    mov         eax,ebx
 006F3AEF    pop         edi
 006F3AF0    pop         esi
 006F3AF1    pop         ebx
 006F3AF2    pop         ecx
 006F3AF3    pop         ecx
 006F3AF4    pop         ebp
 006F3AF5    ret
end;*}

//006F3B48
function THatTrackValue.CanSet:Boolean;
begin
{*
 006F3B48    xor         eax,eax
 006F3B4A    ret
*}
end;

//006F3B4C
procedure THatTrackValue.CreateClone;
begin
{*
 006F3B4C    mov         dl,1
 006F3B4E    mov         eax,[006F3258];THatTrackValue
 006F3B53    call        TObject.Create;THatTrackValue.Create
 006F3B58    ret
*}
end;

//006F3B5C
procedure THatTrackValue.FillClone(c:TExpression);
begin
{*
 006F3B5C    push        ebx
 006F3B5D    push        esi
 006F3B5E    mov         esi,edx
 006F3B60    mov         ebx,eax
 006F3B62    mov         edx,esi
 006F3B64    mov         eax,ebx
 006F3B66    call        TExpression.FillClone
 006F3B6B    mov         eax,esi
 006F3B6D    mov         edx,dword ptr [ebx+20];THatTrackValue.............................Item:Integer
 006F3B70    mov         dword ptr [eax+20],edx
 006F3B73    mov         edx,dword ptr [ebx+18];THatTrackValue......................................................
 006F3B76    mov         dword ptr [eax+18],edx
 006F3B79    pop         esi
 006F3B7A    pop         ebx
 006F3B7B    ret
*}
end;

//006F3B7C
function THatTrackValue.GetDataType:TDataType;
begin
{*
 006F3B7C    mov         eax,dword ptr [eax+20];THatTrackValue..............................Item:Integer
 006F3B7F    cmp         eax,0E
>006F3B82    ja          006F3BC8
 006F3B84    movzx       eax,byte ptr [eax+6F3B92]
 006F3B8B    jmp         dword ptr [eax*4+6F3BA1]
 006F3B8B    db          1
 006F3B8B    db          2
 006F3B8B    db          2
 006F3B8B    db          2
 006F3B8B    db          3
 006F3B8B    db          3
 006F3B8B    db          3
 006F3B8B    db          4
 006F3B8B    db          5
 006F3B8B    db          5
 006F3B8B    db          5
 006F3B8B    db          5
 006F3B8B    db          5
 006F3B8B    db          5
 006F3B8B    db          4
 006F3B8B    dd          006F3BC8
 006F3B8B    dd          006F3BB9
 006F3B8B    dd          006F3BBC
 006F3B8B    dd          006F3BBF
 006F3B8B    dd          006F3BC2
 006F3B8B    dd          006F3BC5
 006F3BB9    mov         al,3
 006F3BBB    ret
 006F3BBC    mov         al,1
 006F3BBE    ret
 006F3BBF    xor         eax,eax
 006F3BC1    ret
 006F3BC2    mov         al,5
 006F3BC4    ret
 006F3BC5    mov         al,2
 006F3BC7    ret
 006F3BC8    xor         eax,eax
 006F3BCA    ret
*}
end;

//006F3BCC
function THatTrackValue.GetPerUnits1:TUnits;
begin
{*
 006F3BCC    mov         eax,dword ptr [eax+20];THatTrackValue...............................Item:Integer
 006F3BCF    sub         eax,1
>006F3BD2    jae         006F3BD7
 006F3BD4    xor         eax,eax
 006F3BD6    ret
 006F3BD7    xor         eax,eax
 006F3BD9    ret
*}
end;

//006F3BDC
function THatTrackValue.GetPerUnits2:TUnits;
begin
{*
 006F3BDC    mov         eax,dword ptr [eax+20];THatTrackValue................................Item:Integer
 006F3BDF    sub         eax,1
>006F3BE2    jae         006F3BE7
 006F3BE4    xor         eax,eax
 006F3BE6    ret
 006F3BE7    xor         eax,eax
 006F3BE9    ret
*}
end;

//006F3BEC
{*procedure THatTrackValue.GetString(?:?);
begin
 006F3BEC    push        ebx
 006F3BED    push        esi
 006F3BEE    mov         esi,edx
 006F3BF0    mov         ebx,eax
 006F3BF2    mov         eax,dword ptr [ebx+20];THatTrackValue.................................Item:Integer
 006F3BF5    sub         eax,1
>006F3BF8    jae         006F3C06
 006F3BFA    mov         edx,esi
 006F3BFC    mov         eax,ebx
 006F3BFE    call        TExpression.GetString
 006F3C03    pop         esi
 006F3C04    pop         ebx
 006F3C05    ret
 006F3C06    mov         edx,esi
 006F3C08    mov         eax,ebx
 006F3C0A    call        TExpression.GetString
 006F3C0F    pop         esi
 006F3C10    pop         ebx
 006F3C11    ret
end;*}

//006F3C14
function THatTrackValue.GetUnits:TUnits;
begin
{*
 006F3C14    mov         eax,dword ptr [eax+20];THatTrackValue..................................Item:Integer
 006F3C17    dec         eax
 006F3C18    sub         eax,3
>006F3C1B    jb          006F3C24
 006F3C1D    sub         eax,4
>006F3C20    jb          006F3C27
>006F3C22    jmp         006F3C2A
 006F3C24    mov         al,18
 006F3C26    ret
 006F3C27    mov         al,5
 006F3C29    ret
 006F3C2A    xor         eax,eax
 006F3C2C    ret
*}
end;

//006F3C30
procedure THatTrackValue.GetValue;
begin
{*
 006F3C30    add         esp,0FFFFFFD4
 006F3C33    cmp         byte ptr ds:[8228E5],0;gvar_008228E5
>006F3C3A    je          006F3C4B
 006F3C3C    cmp         dword ptr [eax+18],0;THatTrackValue........................................................
>006F3C40    jl          006F3C4B
 006F3C42    cmp         dword ptr [eax+18],3E7;THatTrackValue......................................................
>006F3C49    jle         006F3C59
 006F3C4B    xor         eax,eax
 006F3C4D    mov         dword ptr [esp],eax
 006F3C50    mov         dword ptr [esp+4],eax
>006F3C54    jmp         006F3F48
 006F3C59    mov         eax,dword ptr [eax+20];THatTrackValue...................................Item:Integer
 006F3C5C    cmp         eax,14
>006F3C5F    ja          006F3F3F
 006F3C65    jmp         dword ptr [eax*4+6F3C6C]
 006F3C65    dd          006F3CC0
 006F3C65    dd          006F3CD0
 006F3C65    dd          006F3CF7
 006F3C65    dd          006F3D1F
 006F3C65    dd          006F3D47
 006F3C65    dd          006F3D68
 006F3C65    dd          006F3D89
 006F3C65    dd          006F3E94
 006F3C65    dd          006F3DAA
 006F3C65    dd          006F3DB9
 006F3C65    dd          006F3DC8
 006F3C65    dd          006F3DD7
 006F3C65    dd          006F3DE6
 006F3C65    dd          006F3DF5
 006F3C65    dd          006F3F0A
 006F3C65    dd          006F3E04
 006F3C65    dd          006F3E1C
 006F3C65    dd          006F3E34
 006F3C65    dd          006F3E4C
 006F3C65    dd          006F3E64
 006F3C65    dd          006F3E7C
 006F3CC0    mov         al,1
 006F3CC2    call        00686074
 006F3CC7    fstp        qword ptr [esp]
 006F3CCA    wait
>006F3CCB    jmp         006F3F48
 006F3CD0    mov         eax,[008228EC];gvar_008228EC:Single
 006F3CD5    sub         eax,3FFF
 006F3CDA    mov         dword ptr [esp+8],eax
 006F3CDE    fild        dword ptr [esp+8]
 006F3CE2    fdiv        dword ptr ds:[6F3F50];16383:Single
 006F3CE8    fmul        dword ptr ds:[6F3F54];180:Single
 006F3CEE    fstp        qword ptr [esp]
 006F3CF1    wait
>006F3CF2    jmp         006F3F48
 006F3CF7    mov         eax,3FFF
 006F3CFC    sub         eax,dword ptr ds:[8228F0];gvar_008228F0:Single
 006F3D02    mov         dword ptr [esp+8],eax
 006F3D06    fild        dword ptr [esp+8]
 006F3D0A    fdiv        dword ptr ds:[6F3F50];16383:Single
 006F3D10    fmul        dword ptr ds:[6F3F54];180:Single
 006F3D16    fstp        qword ptr [esp]
 006F3D19    wait
>006F3D1A    jmp         006F3F48
 006F3D1F    mov         eax,3FFF
 006F3D24    sub         eax,dword ptr ds:[8228F4];gvar_008228F4:Single
 006F3D2A    mov         dword ptr [esp+8],eax
 006F3D2E    fild        dword ptr [esp+8]
 006F3D32    fdiv        dword ptr ds:[6F3F50];16383:Single
 006F3D38    fmul        dword ptr ds:[6F3F54];180:Single
 006F3D3E    fstp        qword ptr [esp]
 006F3D41    wait
>006F3D42    jmp         006F3F48
 006F3D47    mov         eax,[008228F8];gvar_008228F8:Single
 006F3D4C    sub         eax,3FFF
 006F3D51    mov         dword ptr [esp+8],eax
 006F3D55    fild        dword ptr [esp+8]
 006F3D59    fdiv        dword ptr ds:[6F3F50];16383:Single
 006F3D5F    fstp        qword ptr [esp]
 006F3D62    wait
>006F3D63    jmp         006F3F48
 006F3D68    mov         eax,[008228FC];gvar_008228FC:Single
 006F3D6D    sub         eax,3FFF
 006F3D72    mov         dword ptr [esp+8],eax
 006F3D76    fild        dword ptr [esp+8]
 006F3D7A    fdiv        dword ptr ds:[6F3F50];16383:Single
 006F3D80    fstp        qword ptr [esp]
 006F3D83    wait
>006F3D84    jmp         006F3F48
 006F3D89    mov         eax,[00822900];gvar_00822900:Single
 006F3D8E    sub         eax,3FFF
 006F3D93    mov         dword ptr [esp+8],eax
 006F3D97    fild        dword ptr [esp+8]
 006F3D9B    fdiv        dword ptr ds:[6F3F50];16383:Single
 006F3DA1    fstp        qword ptr [esp]
 006F3DA4    wait
>006F3DA5    jmp         006F3F48
 006F3DAA    fild        dword ptr ds:[8228EC];gvar_008228EC:Single
 006F3DB0    fstp        qword ptr [esp]
 006F3DB3    wait
>006F3DB4    jmp         006F3F48
 006F3DB9    fild        dword ptr ds:[8228F0];gvar_008228F0:Single
 006F3DBF    fstp        qword ptr [esp]
 006F3DC2    wait
>006F3DC3    jmp         006F3F48
 006F3DC8    fild        dword ptr ds:[8228F4];gvar_008228F4:Single
 006F3DCE    fstp        qword ptr [esp]
 006F3DD1    wait
>006F3DD2    jmp         006F3F48
 006F3DD7    fild        dword ptr ds:[8228F8];gvar_008228F8:Single
 006F3DDD    fstp        qword ptr [esp]
 006F3DE0    wait
>006F3DE1    jmp         006F3F48
 006F3DE6    fild        dword ptr ds:[8228FC];gvar_008228FC:Single
 006F3DEC    fstp        qword ptr [esp]
 006F3DEF    wait
>006F3DF0    jmp         006F3F48
 006F3DF5    fild        dword ptr ds:[822900];gvar_00822900:Single
 006F3DFB    fstp        qword ptr [esp]
 006F3DFE    wait
>006F3DFF    jmp         006F3F48
 006F3E04    mov         eax,dword ptr ds:[822904];gvar_00822904:Double
 006F3E0A    mov         dword ptr [esp],eax
 006F3E0D    mov         eax,dword ptr ds:[822908];gvar_00822908
 006F3E13    mov         dword ptr [esp+4],eax
>006F3E17    jmp         006F3F48
 006F3E1C    mov         eax,dword ptr ds:[82290C];gvar_0082290C:Double
 006F3E22    mov         dword ptr [esp],eax
 006F3E25    mov         eax,dword ptr ds:[822910];gvar_00822910
 006F3E2B    mov         dword ptr [esp+4],eax
>006F3E2F    jmp         006F3F48
 006F3E34    mov         eax,dword ptr ds:[822914];gvar_00822914:Double
 006F3E3A    mov         dword ptr [esp],eax
 006F3E3D    mov         eax,dword ptr ds:[822918];gvar_00822918
 006F3E43    mov         dword ptr [esp+4],eax
>006F3E47    jmp         006F3F48
 006F3E4C    mov         eax,dword ptr ds:[82291C];gvar_0082291C:Double
 006F3E52    mov         dword ptr [esp],eax
 006F3E55    mov         eax,dword ptr ds:[822920];gvar_00822920
 006F3E5B    mov         dword ptr [esp+4],eax
>006F3E5F    jmp         006F3F48
 006F3E64    mov         eax,dword ptr ds:[822924];gvar_00822924:Double
 006F3E6A    mov         dword ptr [esp],eax
 006F3E6D    mov         eax,dword ptr ds:[822928];gvar_00822928
 006F3E73    mov         dword ptr [esp+4],eax
>006F3E77    jmp         006F3F48
 006F3E7C    mov         eax,dword ptr ds:[82292C];gvar_0082292C:Double
 006F3E82    mov         dword ptr [esp],eax
 006F3E85    mov         eax,dword ptr ds:[822930];gvar_00822930
 006F3E8B    mov         dword ptr [esp+4],eax
>006F3E8F    jmp         006F3F48
 006F3E94    mov         eax,[008228F8];gvar_008228F8:Single
 006F3E99    sub         eax,3FFF
 006F3E9E    mov         dword ptr [esp+8],eax
 006F3EA2    fild        dword ptr [esp+8]
 006F3EA6    fdiv        dword ptr ds:[6F3F50];16383:Single
 006F3EAC    fmul        st,st(0)
 006F3EAE    fstp        tbyte ptr [esp+0C]
 006F3EB2    wait
 006F3EB3    mov         eax,[008228FC];gvar_008228FC:Single
 006F3EB8    sub         eax,3FFF
 006F3EBD    mov         dword ptr [esp+18],eax
 006F3EC1    fild        dword ptr [esp+18]
 006F3EC5    fdiv        dword ptr ds:[6F3F50];16383:Single
 006F3ECB    fmul        st,st(0)
 006F3ECD    fld         tbyte ptr [esp+0C]
 006F3ED1    faddp       st(1),st
 006F3ED3    fstp        tbyte ptr [esp+1C]
 006F3ED7    wait
 006F3ED8    mov         eax,[00822900];gvar_00822900:Single
 006F3EDD    sub         eax,3FFF
 006F3EE2    mov         dword ptr [esp+28],eax
 006F3EE6    fild        dword ptr [esp+28]
 006F3EEA    fdiv        dword ptr ds:[6F3F50];16383:Single
 006F3EF0    fmul        st,st(0)
 006F3EF2    fld         tbyte ptr [esp+1C]
 006F3EF6    faddp       st(1),st
 006F3EF8    add         esp,0FFFFFFF4
 006F3EFB    fstp        tbyte ptr [esp]
 006F3EFE    wait
 006F3EFF    call        Sqrt
 006F3F04    fstp        qword ptr [esp]
 006F3F07    wait
>006F3F08    jmp         006F3F48
 006F3F0A    mov         eax,[008228F8];gvar_008228F8:Single
 006F3F0F    imul        eax
 006F3F11    mov         ecx,eax
 006F3F13    mov         eax,[008228FC];gvar_008228FC:Single
 006F3F18    imul        eax
 006F3F1A    add         ecx,eax
 006F3F1C    mov         eax,[00822900];gvar_00822900:Single
 006F3F21    imul        eax
 006F3F23    add         ecx,eax
 006F3F25    mov         dword ptr [esp+8],ecx
 006F3F29    fild        dword ptr [esp+8]
 006F3F2D    add         esp,0FFFFFFF4
 006F3F30    fstp        tbyte ptr [esp]
 006F3F33    wait
 006F3F34    call        Sqrt
 006F3F39    fstp        qword ptr [esp]
 006F3F3C    wait
>006F3F3D    jmp         006F3F48
 006F3F3F    xor         eax,eax
 006F3F41    mov         dword ptr [esp],eax
 006F3F44    mov         dword ptr [esp+4],eax
 006F3F48    fld         qword ptr [esp]
 006F3F4B    add         esp,2C
 006F3F4E    ret
*}
end;

//006F3F58
procedure THatTrackValue.GetVector(x:Double; y:Double; z:Double);
begin
{*
 006F3F58    push        ebp
 006F3F59    mov         ebp,esp
 006F3F5B    push        ecx
 006F3F5C    push        ebx
 006F3F5D    push        esi
 006F3F5E    mov         esi,dword ptr [ebp+8]
 006F3F61    cmp         byte ptr ds:[8228E5],0;gvar_008228E5
>006F3F68    je          006F3F76
 006F3F6A    cmp         dword ptr [eax+18],0;THatTrackValue........................................................
>006F3F6E    jl          006F3F76
 006F3F70    cmp         dword ptr [eax+18],1;THatTrackValue........................................................
>006F3F74    jle         006F3F8D
 006F3F76    xor         eax,eax
 006F3F78    mov         dword ptr [edx],eax
 006F3F7A    mov         dword ptr [edx+4],eax
 006F3F7D    xor         eax,eax
 006F3F7F    mov         dword ptr [ecx],eax
 006F3F81    mov         dword ptr [ecx+4],eax
 006F3F84    xor         eax,eax
 006F3F86    mov         dword ptr [esi],eax
 006F3F88    mov         dword ptr [esi+4],eax
>006F3F8B    jmp         006F400A
 006F3F8D    mov         ebx,dword ptr [eax+20];THatTrackValue....................................Item:Integer
 006F3F90    sub         ebx,7
>006F3F93    je          006F3FB7
 006F3F95    sub         ebx,7
>006F3F98    jne         006F4004
 006F3F9A    fild        dword ptr ds:[8228F8];gvar_008228F8:Single
 006F3FA0    fstp        qword ptr [edx]
 006F3FA2    wait
 006F3FA3    fild        dword ptr ds:[8228FC];gvar_008228FC:Single
 006F3FA9    fstp        qword ptr [ecx]
 006F3FAB    wait
 006F3FAC    fild        dword ptr ds:[822900];gvar_00822900:Single
 006F3FB2    fstp        qword ptr [esi]
 006F3FB4    wait
>006F3FB5    jmp         006F400A
 006F3FB7    mov         eax,[008228F8];gvar_008228F8:Single
 006F3FBC    sub         eax,3FFF
 006F3FC1    mov         dword ptr [ebp-4],eax
 006F3FC4    fild        dword ptr [ebp-4]
 006F3FC7    fdiv        dword ptr ds:[6F4014];16383:Single
 006F3FCD    fstp        qword ptr [edx]
 006F3FCF    wait
 006F3FD0    mov         eax,[008228FC];gvar_008228FC:Single
 006F3FD5    sub         eax,3FFF
 006F3FDA    mov         dword ptr [ebp-4],eax
 006F3FDD    fild        dword ptr [ebp-4]
 006F3FE0    fdiv        dword ptr ds:[6F4014];16383:Single
 006F3FE6    fstp        qword ptr [ecx]
 006F3FE8    wait
 006F3FE9    mov         eax,[00822900];gvar_00822900:Single
 006F3FEE    sub         eax,3FFF
 006F3FF3    mov         dword ptr [ebp-4],eax
 006F3FF6    fild        dword ptr [ebp-4]
 006F3FF9    fdiv        dword ptr ds:[6F4014];16383:Single
 006F3FFF    fstp        qword ptr [esi]
 006F4001    wait
>006F4002    jmp         006F400A
 006F4004    push        esi
 006F4005    call        TExpression.GetVector
 006F400A    pop         esi
 006F400B    pop         ebx
 006F400C    pop         ecx
 006F400D    pop         ebp
 006F400E    ret         4
*}
end;

//006F4018
{*function THatTrackValue.SetValue(NewValue:Double; ?:?):Boolean;
begin
 006F4018    push        ebp
 006F4019    mov         ebp,esp
 006F401B    push        ebx
 006F401C    cmp         byte ptr ds:[8228E5],0;gvar_008228E5
>006F4023    je          006F4031
 006F4025    cmp         dword ptr [eax+18],0;THatTrackValue........................................................
>006F4029    jl          006F4031
 006F402B    cmp         dword ptr [eax+18],1;THatTrackValue........................................................
>006F402F    jle         006F4038
 006F4031    xor         ebx,ebx
>006F4033    jmp         006F42C6
 006F4038    mov         bl,1
 006F403A    mov         byte ptr ds:[822934],1;gvar_00822934
 006F4041    mov         eax,dword ptr [eax+20];THatTrackValue.....................................Item:Integer
 006F4044    cmp         eax,14
>006F4047    ja          006F42C4
 006F404D    jmp         dword ptr [eax*4+6F4054]
 006F404D    dd          006F40A8
 006F404D    dd          006F40AF
 006F404D    dd          006F40E3
 006F404D    dd          006F411B
 006F404D    dd          006F4153
 006F404D    dd          006F4183
 006F404D    dd          006F41B3
 006F404D    dd          006F42C4
 006F404D    dd          006F41E3
 006F404D    dd          006F41F5
 006F404D    dd          006F4207
 006F404D    dd          006F4219
 006F404D    dd          006F422B
 006F404D    dd          006F423D
 006F404D    dd          006F42C4
 006F404D    dd          006F424C
 006F404D    dd          006F4260
 006F404D    dd          006F4274
 006F404D    dd          006F4288
 006F404D    dd          006F429C
 006F404D    dd          006F42B0
 006F40A8    xor         ebx,ebx
>006F40AA    jmp         006F42C6
 006F40AF    fld         qword ptr [ebp+8]
 006F40B2    fmul        dword ptr ds:[6F42D0];16383:Single
 006F40B8    fdiv        dword ptr ds:[6F42D4];180:Single
 006F40BE    fadd        dword ptr ds:[6F42D0];16383:Single
 006F40C4    call        @ROUND
 006F40C9    mov         [008228EC],eax;gvar_008228EC:Single
 006F40CE    fld         qword ptr [ebp+8]
 006F40D1    fdiv        dword ptr ds:[6F42D4];180:Single
 006F40D7    fstp        qword ptr ds:[822904];gvar_00822904:Double
 006F40DD    wait
>006F40DE    jmp         006F42C6
 006F40E3    fld         qword ptr [ebp+8]
 006F40E6    fmul        dword ptr ds:[6F42D0];16383:Single
 006F40EC    fdiv        dword ptr ds:[6F42D4];180:Single
 006F40F2    fchs
 006F40F4    fadd        dword ptr ds:[6F42D0];16383:Single
 006F40FA    call        @ROUND
 006F40FF    mov         [008228F0],eax;gvar_008228F0:Single
 006F4104    fld         qword ptr [ebp+8]
 006F4107    fchs
 006F4109    fdiv        dword ptr ds:[6F42D4];180:Single
 006F410F    fstp        qword ptr ds:[82290C];gvar_0082290C:Double
 006F4115    wait
>006F4116    jmp         006F42C6
 006F411B    fld         qword ptr [ebp+8]
 006F411E    fmul        dword ptr ds:[6F42D0];16383:Single
 006F4124    fdiv        dword ptr ds:[6F42D4];180:Single
 006F412A    fchs
 006F412C    fadd        dword ptr ds:[6F42D0];16383:Single
 006F4132    call        @ROUND
 006F4137    mov         [008228F4],eax;gvar_008228F4:Single
 006F413C    fld         qword ptr [ebp+8]
 006F413F    fchs
 006F4141    fdiv        dword ptr ds:[6F42D4];180:Single
 006F4147    fstp        qword ptr ds:[82291C];gvar_0082291C:Double
 006F414D    wait
>006F414E    jmp         006F42C6
 006F4153    fld         qword ptr [ebp+8]
 006F4156    fmul        dword ptr ds:[6F42D0];16383:Single
 006F415C    fadd        dword ptr ds:[6F42D0];16383:Single
 006F4162    call        @ROUND
 006F4167    mov         [008228F8],eax;gvar_008228F8:Single
 006F416C    mov         eax,dword ptr [ebp+8]
 006F416F    mov         dword ptr ds:[822924],eax;gvar_00822924:Double
 006F4175    mov         eax,dword ptr [ebp+0C]
 006F4178    mov         dword ptr ds:[822928],eax;gvar_00822928
>006F417E    jmp         006F42C6
 006F4183    fld         qword ptr [ebp+8]
 006F4186    fmul        dword ptr ds:[6F42D0];16383:Single
 006F418C    fadd        dword ptr ds:[6F42D0];16383:Single
 006F4192    call        @ROUND
 006F4197    mov         [008228FC],eax;gvar_008228FC:Single
 006F419C    mov         eax,dword ptr [ebp+8]
 006F419F    mov         dword ptr ds:[82292C],eax;gvar_0082292C:Double
 006F41A5    mov         eax,dword ptr [ebp+0C]
 006F41A8    mov         dword ptr ds:[822930],eax;gvar_00822930
>006F41AE    jmp         006F42C6
 006F41B3    fld         qword ptr [ebp+8]
 006F41B6    fmul        dword ptr ds:[6F42D0];16383:Single
 006F41BC    fadd        dword ptr ds:[6F42D0];16383:Single
 006F41C2    call        @ROUND
 006F41C7    mov         [00822900],eax;gvar_00822900:Single
 006F41CC    mov         eax,dword ptr [ebp+8]
 006F41CF    mov         dword ptr ds:[822914],eax;gvar_00822914:Double
 006F41D5    mov         eax,dword ptr [ebp+0C]
 006F41D8    mov         dword ptr ds:[822918],eax;gvar_00822918
>006F41DE    jmp         006F42C6
 006F41E3    fld         qword ptr [ebp+8]
 006F41E6    call        @ROUND
 006F41EB    mov         [008228EC],eax;gvar_008228EC:Single
>006F41F0    jmp         006F42C6
 006F41F5    fld         qword ptr [ebp+8]
 006F41F8    call        @ROUND
 006F41FD    mov         [008228F0],eax;gvar_008228F0:Single
>006F4202    jmp         006F42C6
 006F4207    fld         qword ptr [ebp+8]
 006F420A    call        @ROUND
 006F420F    mov         [008228F0],eax;gvar_008228F0:Single
>006F4214    jmp         006F42C6
 006F4219    fld         qword ptr [ebp+8]
 006F421C    call        @ROUND
 006F4221    mov         [008228F8],eax;gvar_008228F8:Single
>006F4226    jmp         006F42C6
 006F422B    fld         qword ptr [ebp+8]
 006F422E    call        @ROUND
 006F4233    mov         [008228FC],eax;gvar_008228FC:Single
>006F4238    jmp         006F42C6
 006F423D    fld         qword ptr [ebp+8]
 006F4240    call        @ROUND
 006F4245    mov         [00822900],eax;gvar_00822900:Single
>006F424A    jmp         006F42C6
 006F424C    mov         eax,dword ptr [ebp+8]
 006F424F    mov         dword ptr ds:[822904],eax;gvar_00822904:Double
 006F4255    mov         eax,dword ptr [ebp+0C]
 006F4258    mov         dword ptr ds:[822908],eax;gvar_00822908
>006F425E    jmp         006F42C6
 006F4260    mov         eax,dword ptr [ebp+8]
 006F4263    mov         dword ptr ds:[82290C],eax;gvar_0082290C:Double
 006F4269    mov         eax,dword ptr [ebp+0C]
 006F426C    mov         dword ptr ds:[822910],eax;gvar_00822910
>006F4272    jmp         006F42C6
 006F4274    mov         eax,dword ptr [ebp+8]
 006F4277    mov         dword ptr ds:[822914],eax;gvar_00822914:Double
 006F427D    mov         eax,dword ptr [ebp+0C]
 006F4280    mov         dword ptr ds:[822918],eax;gvar_00822918
>006F4286    jmp         006F42C6
 006F4288    mov         eax,dword ptr [ebp+8]
 006F428B    mov         dword ptr ds:[82291C],eax;gvar_0082291C:Double
 006F4291    mov         eax,dword ptr [ebp+0C]
 006F4294    mov         dword ptr ds:[822920],eax;gvar_00822920
>006F429A    jmp         006F42C6
 006F429C    mov         eax,dword ptr [ebp+8]
 006F429F    mov         dword ptr ds:[822924],eax;gvar_00822924:Double
 006F42A5    mov         eax,dword ptr [ebp+0C]
 006F42A8    mov         dword ptr ds:[822928],eax;gvar_00822928
>006F42AE    jmp         006F42C6
 006F42B0    mov         eax,dword ptr [ebp+8]
 006F42B3    mov         dword ptr ds:[82292C],eax;gvar_0082292C:Double
 006F42B9    mov         eax,dword ptr [ebp+0C]
 006F42BC    mov         dword ptr ds:[822930],eax;gvar_00822930
>006F42C2    jmp         006F42C6
 006F42C4    xor         ebx,ebx
 006F42C6    mov         eax,ebx
 006F42C8    pop         ebx
 006F42C9    pop         ebp
 006F42CA    ret         8
end;*}

//006F42D8
{*function THatTrackValue.SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;
begin
 006F42D8    push        ebp
 006F42D9    mov         ebp,esp
 006F42DB    push        ebx
 006F42DC    cmp         byte ptr ds:[8228E5],0;gvar_008228E5
>006F42E3    je          006F42F1
 006F42E5    cmp         dword ptr [eax+18],0;THatTrackValue........................................................
>006F42E9    jl          006F42F1
 006F42EB    cmp         dword ptr [eax+18],1;THatTrackValue........................................................
>006F42EF    jle         006F42F8
 006F42F1    xor         ebx,ebx
>006F42F3    jmp         006F43E8
 006F42F8    mov         bl,1
 006F42FA    mov         byte ptr ds:[822934],1;gvar_00822934
 006F4301    mov         edx,dword ptr [eax+20];THatTrackValue......................................Item:Integer
 006F4304    sub         edx,1
>006F4307    jb          006F431C
 006F4309    sub         edx,6
>006F430C    je          006F4323
 006F430E    sub         edx,7
>006F4311    je          006F43A6
>006F4317    jmp         006F43CF
 006F431C    xor         ebx,ebx
>006F431E    jmp         006F43E8
 006F4323    fld         qword ptr [ebp+18]
 006F4326    fmul        dword ptr ds:[6F43F0];16383:Single
 006F432C    fadd        dword ptr ds:[6F43F0];16383:Single
 006F4332    call        @ROUND
 006F4337    mov         [008228F8],eax;gvar_008228F8:Single
 006F433C    mov         eax,dword ptr [ebp+18]
 006F433F    mov         dword ptr ds:[822924],eax;gvar_00822924:Double
 006F4345    mov         eax,dword ptr [ebp+1C]
 006F4348    mov         dword ptr ds:[822928],eax;gvar_00822928
 006F434E    fld         qword ptr [ebp+10]
 006F4351    fmul        dword ptr ds:[6F43F0];16383:Single
 006F4357    fadd        dword ptr ds:[6F43F0];16383:Single
 006F435D    call        @ROUND
 006F4362    mov         [008228FC],eax;gvar_008228FC:Single
 006F4367    mov         eax,dword ptr [ebp+10]
 006F436A    mov         dword ptr ds:[82292C],eax;gvar_0082292C:Double
 006F4370    mov         eax,dword ptr [ebp+14]
 006F4373    mov         dword ptr ds:[822930],eax;gvar_00822930
 006F4379    fld         qword ptr [ebp+8]
 006F437C    fmul        dword ptr ds:[6F43F0];16383:Single
 006F4382    fadd        dword ptr ds:[6F43F0];16383:Single
 006F4388    call        @ROUND
 006F438D    mov         [00822900],eax;gvar_00822900:Single
 006F4392    mov         eax,dword ptr [ebp+8]
 006F4395    mov         dword ptr ds:[822914],eax;gvar_00822914:Double
 006F439B    mov         eax,dword ptr [ebp+0C]
 006F439E    mov         dword ptr ds:[822918],eax;gvar_00822918
>006F43A4    jmp         006F43E8
 006F43A6    fld         qword ptr [ebp+18]
 006F43A9    call        @ROUND
 006F43AE    mov         [008228F8],eax;gvar_008228F8:Single
 006F43B3    fld         qword ptr [ebp+10]
 006F43B6    call        @ROUND
 006F43BB    mov         [008228FC],eax;gvar_008228FC:Single
 006F43C0    fld         qword ptr [ebp+8]
 006F43C3    call        @ROUND
 006F43C8    mov         [00822900],eax;gvar_00822900:Single
>006F43CD    jmp         006F43E8
 006F43CF    push        dword ptr [ebp+1C]
 006F43D2    push        dword ptr [ebp+18]
 006F43D5    push        dword ptr [ebp+14]
 006F43D8    push        dword ptr [ebp+10]
 006F43DB    push        dword ptr [ebp+0C]
 006F43DE    push        dword ptr [ebp+8]
 006F43E1    call        TExpression.SetVector
 006F43E6    mov         ebx,eax
 006F43E8    mov         eax,ebx
 006F43EA    pop         ebx
 006F43EB    pop         ebp
 006F43EC    ret         18
end;*}

//006F43F4
{*procedure THatTrackValue.ToString(?:?);
begin
 006F43F4    push        ebp
 006F43F5    mov         ebp,esp
 006F43F7    push        0
 006F43F9    push        0
 006F43FB    push        0
 006F43FD    push        ebx
 006F43FE    push        esi
 006F43FF    push        edi
 006F4400    mov         esi,edx
 006F4402    mov         ebx,eax
 006F4404    xor         eax,eax
 006F4406    push        ebp
 006F4407    push        6F4481
 006F440C    push        dword ptr fs:[eax]
 006F440F    mov         dword ptr fs:[eax],esp
 006F4412    mov         edi,dword ptr [ebx+18];THatTrackValue......................................................
 006F4415    test        edi,edi
>006F4417    jle         006F444C
 006F4419    push        6F449C;'HatTrack'
 006F441E    lea         edx,[ebp-4]
 006F4421    mov         eax,edi
 006F4423    call        IntToStr
 006F4428    push        dword ptr [ebp-4]
 006F442B    push        6F44BC;'.'
 006F4430    lea         edx,[ebp-8]
 006F4433    mov         eax,dword ptr [ebx+20];THatTrackValue.......................................Item:Integer
 006F4436    call        006F45B0
 006F443B    push        dword ptr [ebp-8]
 006F443E    mov         eax,esi
 006F4440    mov         edx,4
 006F4445    call        @UStrCatN
>006F444A    jmp         006F4466
 006F444C    lea         edx,[ebp-0C]
 006F444F    mov         eax,dword ptr [ebx+20];THatTrackValue........................................Item:Intege...
 006F4452    call        006F45B0
 006F4457    mov         ecx,dword ptr [ebp-0C]
 006F445A    mov         eax,esi
 006F445C    mov         edx,6F44CC;'HatTrack.'
 006F4461    call        @UStrCat3
 006F4466    xor         eax,eax
 006F4468    pop         edx
 006F4469    pop         ecx
 006F446A    pop         ecx
 006F446B    mov         dword ptr fs:[eax],edx
 006F446E    push        6F4488
 006F4473    lea         eax,[ebp-0C]
 006F4476    mov         edx,3
 006F447B    call        @UStrArrayClr
 006F4480    ret
>006F4481    jmp         @HandleFinally
>006F4486    jmp         006F4473
 006F4488    pop         edi
 006F4489    pop         esi
 006F448A    pop         ebx
 006F448B    mov         esp,ebp
 006F448D    pop         ebp
 006F448E    ret
end;*}

//006F44E0
procedure sub_006F44E0;
begin
{*
 006F44E0    mov         byte ptr ds:[8228E4],0;gvar_008228E4
 006F44E7    ret
*}
end;

//006F44E8
procedure sub_006F44E8;
begin
{*
 006F44E8    ret
*}
end;

//006F44EC
procedure sub_006F44EC;
begin
{*
 006F44EC    cmp         byte ptr ds:[8228E4],0;gvar_008228E4
>006F44F3    je          006F44FF
 006F44F5    call        006F36A8
 006F44FA    mov         [008228E5],al;gvar_008228E5
 006F44FF    ret
*}
end;

//006F4500
procedure sub_006F4500;
begin
{*
 006F4500    movzx       eax,byte ptr ds:[8228E4];gvar_008228E4
 006F4507    and         al,byte ptr ds:[8228E5];gvar_008228E5
>006F450D    je          006F451B
 006F450F    call        006F36A0
 006F4514    mov         byte ptr ds:[8228E5],0;gvar_008228E5
 006F451B    ret
*}
end;

//006F451C
{*function sub_006F451C:?;
begin
 006F451C    movzx       eax,byte ptr ds:[8228E4];gvar_008228E4
 006F4523    and         al,byte ptr ds:[8228E5];gvar_008228E5
>006F4529    je          006F455A
 006F452B    cmp         byte ptr ds:[822934],0;gvar_00822934
>006F4532    je          006F454A
 006F4534    push        48
 006F4536    push        8228EC;gvar_008228EC:Single
 006F453B    call        006F36B8
 006F4540    add         esp,8
 006F4543    mov         byte ptr ds:[822934],0;gvar_00822934
 006F454A    push        48
 006F454C    push        8228EC;gvar_008228EC:Single
 006F4551    call        006F36B0
 006F4556    add         esp,8
 006F4559    ret
 006F455A    mov         al,1
 006F455C    ret
end;*}

//006F4560
{*function sub_006F4560(?:UnicodeString):?;
begin
 006F4560    push        ebp
 006F4561    mov         ebp,esp
 006F4563    push        ecx
 006F4564    push        ebx
 006F4565    mov         dword ptr [ebp-4],eax
 006F4568    mov         eax,dword ptr [ebp-4]
 006F456B    call        @UStrAddRef
 006F4570    xor         eax,eax
 006F4572    push        ebp
 006F4573    push        6F45A3
 006F4578    push        dword ptr fs:[eax]
 006F457B    mov         dword ptr fs:[eax],esp
 006F457E    mov         edx,dword ptr [ebp-4]
 006F4581    mov         eax,[008228E0];gvar_008228E0:THashTable
 006F4586    call        THashTable.Get
 006F458B    mov         ebx,eax
 006F458D    xor         eax,eax
 006F458F    pop         edx
 006F4590    pop         ecx
 006F4591    pop         ecx
 006F4592    mov         dword ptr fs:[eax],edx
 006F4595    push        6F45AA
 006F459A    lea         eax,[ebp-4]
 006F459D    call        @UStrClr
 006F45A2    ret
>006F45A3    jmp         @HandleFinally
>006F45A8    jmp         006F459A
 006F45AA    mov         eax,ebx
 006F45AC    pop         ebx
 006F45AD    pop         ecx
 006F45AE    pop         ebp
 006F45AF    ret
end;*}

//006F45B0
{*procedure sub_006F45B0(?:Integer; ?:?);
begin
 006F45B0    push        ebx
 006F45B1    push        esi
 006F45B2    mov         esi,edx
 006F45B4    mov         ebx,eax
 006F45B6    mov         ecx,esi
 006F45B8    mov         edx,ebx
 006F45BA    mov         eax,[008228E0];gvar_008228E0:THashTable
 006F45BF    call        THashTable.Get
 006F45C4    pop         esi
 006F45C5    pop         ebx
 006F45C6    ret
end;*}

//006F45C8
{*function sub_006F45C8:?;
begin
 006F45C8    push        ebp
 006F45C9    mov         ebp,esp
 006F45CB    push        0
 006F45CD    push        ebx
 006F45CE    push        esi
 006F45CF    xor         eax,eax
 006F45D1    push        ebp
 006F45D2    push        6F462C
 006F45D7    push        dword ptr fs:[eax]
 006F45DA    mov         dword ptr fs:[eax],esp
 006F45DD    mov         dl,1
 006F45DF    mov         eax,[0043C7BC];TStringList
 006F45E4    call        TStringList.Create;TStringList.Create
 006F45E9    mov         esi,eax
 006F45EB    mov         dl,1
 006F45ED    mov         eax,esi
 006F45EF    call        TStringList.SetSorted
 006F45F4    xor         ebx,ebx
 006F45F6    lea         edx,[ebp-4]
 006F45F9    mov         eax,ebx
 006F45FB    call        006F45B0
 006F4600    cmp         dword ptr [ebp-4],0
>006F4604    je          006F4610
 006F4606    mov         edx,dword ptr [ebp-4]
 006F4609    mov         eax,esi
 006F460B    mov         ecx,dword ptr [eax]
 006F460D    call        dword ptr [ecx+38];TStringList.Add
 006F4610    inc         ebx
 006F4611    cmp         ebx,15
>006F4614    jne         006F45F6
 006F4616    xor         eax,eax
 006F4618    pop         edx
 006F4619    pop         ecx
 006F461A    pop         ecx
 006F461B    mov         dword ptr fs:[eax],edx
 006F461E    push        6F4633
 006F4623    lea         eax,[ebp-4]
 006F4626    call        @UStrClr
 006F462B    ret
>006F462C    jmp         @HandleFinally
>006F4631    jmp         006F4623
 006F4633    mov         eax,esi
 006F4635    pop         esi
 006F4636    pop         ebx
 006F4637    pop         ecx
 006F4638    pop         ebp
 006F4639    ret
end;*}

//006F463C
{*function sub_006F463C(?:?):?;
begin
 006F463C    push        ebp
 006F463D    mov         ebp,esp
 006F463F    push        ecx
 006F4640    push        ebx
 006F4641    mov         dword ptr [ebp-4],eax
 006F4644    mov         eax,dword ptr [ebp-4]
 006F4647    call        @UStrAddRef
 006F464C    xor         eax,eax
 006F464E    push        ebp
 006F464F    push        6F46B5
 006F4654    push        dword ptr fs:[eax]
 006F4657    mov         dword ptr fs:[eax],esp
 006F465A    lea         eax,[ebp-4]
 006F465D    mov         edx,6F46D0;'HATTrack'
 006F4662    call        004F9BD0
 006F4667    test        al,al
>006F4669    jne         006F4680
 006F466B    lea         eax,[ebp-4]
 006F466E    mov         edx,6F46F0;'hat_track'
 006F4673    call        004F9BD0
 006F4678    test        al,al
>006F467A    jne         006F4680
 006F467C    xor         ebx,ebx
>006F467E    jmp         006F469F
 006F4680    lea         eax,[ebp-4]
 006F4683    call        004F9D00
 006F4688    lea         eax,[ebp-4]
 006F468B    mov         edx,6F4710;'.'
 006F4690    call        004F9BD0
 006F4695    test        al,al
>006F4697    jne         006F469D
 006F4699    xor         ebx,ebx
>006F469B    jmp         006F469F
 006F469D    mov         bl,1
 006F469F    xor         eax,eax
 006F46A1    pop         edx
 006F46A2    pop         ecx
 006F46A3    pop         ecx
 006F46A4    mov         dword ptr fs:[eax],edx
 006F46A7    push        6F46BC
 006F46AC    lea         eax,[ebp-4]
 006F46AF    call        @UStrClr
 006F46B4    ret
>006F46B5    jmp         @HandleFinally
>006F46BA    jmp         006F46AC
 006F46BC    mov         eax,ebx
 006F46BE    pop         ebx
 006F46BF    pop         ecx
 006F46C0    pop         ebp
 006F46C1    ret
end;*}

Initialization
//00782CF8
{*
 00782CF8    sub         dword ptr ds:[8228E8],1
>00782CFF    jae         00782D17
 00782D01    mov         dl,1
 00782D03    mov         eax,[0067D4A4];THashTable
 00782D08    call        THashTable.Create;THashTable.Create
 00782D0D    mov         [008228E0],eax;gvar_008228E0:THashTable
 00782D12    call        006F36C0
 00782D17    ret
*}
Finalization
end.