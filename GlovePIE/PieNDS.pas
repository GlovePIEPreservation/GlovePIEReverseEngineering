//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieNDS;

interface

uses
  SysUtils, Classes;

type
  TNDSValue = class(TObjectValue)
  published
    //procedure GetString(?:?);//006F76BC
    procedure FillClone(c:TExpression);//006F765C
    function GetUnits:TUnits;//006F76E4
    function GetPerUnits2:TUnits;//006F76AC
    function GetPerUnits1:TUnits;//006F769C
    procedure CreateClone;//006F764C
    function CanSet:Boolean;//006F7648
    function GetDataType:TDataType;//006F767C
    function SetValue(NewValue:Double):Boolean;//006F7924
    procedure GetValue;//006F76F4
    //procedure ToString(?:?);//006F799C
  public
    ......................Item:Integer;//f20
    //procedure ToString(?:?); virtual;//006F799C
    procedure GetValue; virtual;//v2C//006F76F4
    //procedure GetString(?:?); virtual;//v38//006F76BC
    function GetDataType:TDataType; virtual;//v44//006F767C
    function GetUnits:TUnits; virtual;//v48//006F76E4
    function GetPerUnits1:TUnits; virtual;//v4C//006F769C
    function GetPerUnits2:TUnits; virtual;//v50//006F76AC
    function SetValue(NewValue:Double):Boolean; virtual;//v58//006F7924
    function CanSet:Boolean; virtual;//v68//006F7648
    procedure CreateClone; virtual;//v80//006F764C
    procedure FillClone(c:TExpression); virtual;//v84//006F765C
  end;
  TNDS = TNDS = record//size=30
X:Boolean;//f0
Y:Boolean;//f1
A:Boolean;//f2
B:Boolean;//f3
L:Boolean;//f4
R:Boolean;//f5
Start:Boolean;//f6
Select:Boolean;//f7
Up:Boolean;//f8
Down:Boolean;//f9
Left:Boolean;//fA
Right:Boolean;//fB
Blue:Boolean;//fC
Yellow:Boolean;//fD
Red:Boolean;//fE
Green:Boolean;//fF
Touching:Boolean;//f10
Exists:Boolean;//f11
StylusX:Double;//f18
StylusY:Double;//f20
Port:Integer;//f28
Profile:Integer;//f2C
end;;
  :3 = array of TNDS;
//elSize = 30;
    //procedure sub_006F6DB0(?:?);//006F6DB0
    //procedure sub_006F6DF4(?:?; ?:UnicodeString);//006F6DF4
    procedure sub_006F71B0;//006F71B0
    //function sub_006F7524(?:?):?;//006F7524
    procedure sub_006F7A74;//006F7A74
    procedure sub_006F7B3C;//006F7B3C
    procedure sub_006F7B94;//006F7B94
    procedure sub_006F7C3C;//006F7C3C
    //function sub_006F7CA4(?:UnicodeString):?;//006F7CA4
    //procedure sub_006F7CF4(?:Integer; ?:?);//006F7CF4
    //function sub_006F7D0C:?;//006F7D0C
    //function sub_006F7D80(?:?):?;//006F7D80

implementation

//006F6DB0
{*procedure sub_006F6DB0(?:?);
begin
 006F6DB0    push        ebx
 006F6DB1    push        esi
 006F6DB2    mov         ebx,eax
 006F6DB4    mov         esi,ebx
 006F6DB6    add         esi,esi
 006F6DB8    lea         esi,[esi+esi*2]
 006F6DBB    mov         eax,[00822994];gvar_00822994:?
 006F6DC0    lea         eax,[eax+esi*8]
 006F6DC3    xor         ecx,ecx
 006F6DC5    mov         edx,30
 006F6DCA    call        @FillChar
 006F6DCF    mov         eax,[00822994];gvar_00822994:?
 006F6DD4    lea         eax,[eax+esi*8]
 006F6DD7    xor         edx,edx
 006F6DD9    mov         dword ptr [eax+18],edx
 006F6DDC    mov         dword ptr [eax+1C],3FE00000
 006F6DE3    xor         edx,edx
 006F6DE5    mov         dword ptr [eax+20],edx
 006F6DE8    mov         dword ptr [eax+24],3FE00000
 006F6DEF    pop         esi
 006F6DF0    pop         ebx
 006F6DF1    ret
end;*}

//006F6DF4
{*procedure sub_006F6DF4(?:?; ?:UnicodeString);
begin
 006F6DF4    push        ebp
 006F6DF5    mov         ebp,esp
 006F6DF7    mov         ecx,5
 006F6DFC    push        0
 006F6DFE    push        0
 006F6E00    dec         ecx
>006F6E01    jne         006F6DFC
 006F6E03    push        ebx
 006F6E04    push        esi
 006F6E05    mov         dword ptr [ebp-4],edx
 006F6E08    mov         esi,eax
 006F6E0A    mov         eax,dword ptr [ebp-4]
 006F6E0D    call        @LStrAddRef
 006F6E12    xor         eax,eax
 006F6E14    push        ebp
 006F6E15    push        6F718A
 006F6E1A    push        dword ptr fs:[eax]
 006F6E1D    mov         dword ptr fs:[eax],esp
 006F6E20    mov         eax,[00822994];gvar_00822994:?
 006F6E25    call        @DynArrayHigh
 006F6E2A    cmp         esi,eax
>006F6E2C    jle         006F6E6A
 006F6E2E    mov         eax,[00822994];gvar_00822994:?
 006F6E33    call        @DynArrayHigh
 006F6E38    mov         ebx,eax
 006F6E3A    inc         ebx
 006F6E3B    lea         eax,[esi+1]
 006F6E3E    push        eax
 006F6E3F    mov         eax,822994;gvar_00822994:?
 006F6E44    mov         ecx,1
 006F6E49    mov         edx,dword ptr ds:[6F6D88];:3
 006F6E4F    call        @DynArraySetLength
 006F6E54    add         esp,4
 006F6E57    mov         eax,ebx
 006F6E59    mov         ebx,esi
 006F6E5B    sub         ebx,eax
>006F6E5D    jl          006F6E6A
 006F6E5F    inc         ebx
 006F6E60    mov         eax,esi
 006F6E62    call        006F6DB0
 006F6E67    dec         ebx
>006F6E68    jne         006F6E60
 006F6E6A    mov         eax,dword ptr [ebp-4]
 006F6E6D    test        eax,eax
>006F6E6F    je          006F6E76
 006F6E71    sub         eax,4
 006F6E74    mov         eax,dword ptr [eax]
 006F6E76    cmp         eax,3
>006F6E79    jge         006F6E7F
 006F6E7B    mov         al,1
>006F6E7D    jmp         006F6E88
 006F6E7F    mov         eax,dword ptr [ebp-4]
 006F6E82    cmp         byte ptr [eax],2F
 006F6E85    setne       al
 006F6E88    test        al,al
>006F6E8A    jne         006F713A
 006F6E90    mov         eax,dword ptr [ebp-4]
 006F6E93    cmp         byte ptr [eax+2],30
 006F6E97    sete        al
 006F6E9A    mov         edx,esi
 006F6E9C    add         edx,edx
 006F6E9E    lea         edx,[edx+edx*2]
 006F6EA1    mov         ecx,dword ptr ds:[822994];gvar_00822994:?
 006F6EA7    lea         ebx,[ecx+edx*8]
 006F6EAA    mov         byte ptr [ebx+11],1
 006F6EAE    mov         edx,dword ptr [ebp-4]
 006F6EB1    movzx       edx,byte ptr [edx+1]
 006F6EB5    add         edx,0FFFFFF9E
 006F6EB8    cmp         edx,0E
>006F6EBB    ja          006F713A
 006F6EC1    movzx       edx,byte ptr [edx+6F6ECF]
 006F6EC8    jmp         dword ptr [edx*4+6F6EDE]
 006F6EC8    db          2
 006F6EC8    db          0
 006F6EC8    db          3
 006F6EC8    db          0
 006F6EC8    db          0
 006F6EC8    db          4
 006F6EC8    db          0
 006F6EC8    db          0
 006F6EC8    db          0
 006F6EC8    db          0
 006F6EC8    db          0
 006F6EC8    db          5
 006F6EC8    db          0
 006F6EC8    db          0
 006F6EC8    db          1
 006F6EC8    dd          006F713A
 006F6EC8    dd          006F6EF6
 006F6EC8    dd          006F6F33
 006F6EC8    dd          006F6FD0
 006F6EC8    dd          006F700F
 006F6EC8    dd          006F704F
 006F6EF6    mov         esi,dword ptr [ebp-4]
 006F6EF9    test        esi,esi
>006F6EFB    je          006F6F02
 006F6EFD    sub         esi,4
 006F6F00    mov         esi,dword ptr [esi]
 006F6F02    lea         eax,[ebp-0C]
 006F6F05    push        eax
 006F6F06    mov         ecx,esi
 006F6F08    mov         edx,3
 006F6F0D    mov         eax,dword ptr [ebp-4]
 006F6F10    call        @LStrCopy
 006F6F15    mov         edx,dword ptr [ebp-0C]
 006F6F18    lea         eax,[ebp-8]
 006F6F1B    call        @UStrFromLStr
 006F6F20    mov         eax,dword ptr [ebp-8]
 006F6F23    or          edx,0FFFFFFFF
 006F6F26    call        StrToIntDef
 006F6F2B    mov         dword ptr [ebx+2C],eax
>006F6F2E    jmp         006F713A
 006F6F33    mov         edx,dword ptr [ebp-4]
 006F6F36    movzx       edx,byte ptr [edx+2]
 006F6F3A    add         edx,0FFFFFF9F
 006F6F3D    cmp         edx,18
>006F6F40    ja          006F713A
 006F6F46    movzx       edx,byte ptr [edx+6F6F54]
 006F6F4D    jmp         dword ptr [edx*4+6F6F6D]
 006F6F4D    db          1
 006F6F4D    db          2
 006F6F4D    db          0
 006F6F4D    db          0
 006F6F4D    db          8
 006F6F4D    db          0
 006F6F4D    db          0
 006F6F4D    db          0
 006F6F4D    db          0
 006F6F4D    db          0
 006F6F4D    db          0
 006F6F4D    db          5
 006F6F4D    db          0
 006F6F4D    db          0
 006F6F4D    db          0
 006F6F4D    db          0
 006F6F4D    db          0
 006F6F4D    db          6
 006F6F4D    db          0
 006F6F4D    db          7
 006F6F4D    db          0
 006F6F4D    db          0
 006F6F4D    db          0
 006F6F4D    db          3
 006F6F4D    db          4
 006F6F4D    dd          006F713A
 006F6F4D    dd          006F6F91
 006F6F4D    dd          006F6F99
 006F6F4D    dd          006F6FA1
 006F6F4D    dd          006F6FA8
 006F6F4D    dd          006F6FB0
 006F6F4D    dd          006F6FB8
 006F6F4D    dd          006F6FC0
 006F6F4D    dd          006F6FC8
 006F6F91    mov         byte ptr [ebx+2],al
>006F6F94    jmp         006F713A
 006F6F99    mov         byte ptr [ebx+3],al
>006F6F9C    jmp         006F713A
 006F6FA1    mov         byte ptr [ebx],al
>006F6FA3    jmp         006F713A
 006F6FA8    mov         byte ptr [ebx+1],al
>006F6FAB    jmp         006F713A
 006F6FB0    mov         byte ptr [ebx+4],al
>006F6FB3    jmp         006F713A
 006F6FB8    mov         byte ptr [ebx+5],al
>006F6FBB    jmp         006F713A
 006F6FC0    mov         byte ptr [ebx+6],al
>006F6FC3    jmp         006F713A
 006F6FC8    mov         byte ptr [ebx+7],al
>006F6FCB    jmp         006F713A
 006F6FD0    mov         edx,dword ptr [ebp-4]
 006F6FD3    movzx       edx,byte ptr [edx+2]
 006F6FD7    sub         dl,64
>006F6FDA    je          006F6FF7
 006F6FDC    sub         dl,8
>006F6FDF    je          006F6FFF
 006F6FE1    sub         dl,6
>006F6FE4    je          006F7007
 006F6FE6    sub         dl,3
>006F6FE9    jne         006F713A
 006F6FEF    mov         byte ptr [ebx+8],al
>006F6FF2    jmp         006F713A
 006F6FF7    mov         byte ptr [ebx+9],al
>006F6FFA    jmp         006F713A
 006F6FFF    mov         byte ptr [ebx+0A],al
>006F7002    jmp         006F713A
 006F7007    mov         byte ptr [ebx+0B],al
>006F700A    jmp         006F713A
 006F700F    mov         edx,dword ptr [ebp-4]
 006F7012    movzx       edx,byte ptr [edx+2]
 006F7016    sub         dl,62
>006F7019    je          006F702F
 006F701B    sub         dl,5
>006F701E    je          006F7047
 006F7020    sub         dl,0B
>006F7023    je          006F703F
 006F7025    sub         dl,7
>006F7028    je          006F7037
>006F702A    jmp         006F713A
 006F702F    mov         byte ptr [ebx+0C],al
>006F7032    jmp         006F713A
 006F7037    mov         byte ptr [ebx+0D],al
>006F703A    jmp         006F713A
 006F703F    mov         byte ptr [ebx+0E],al
>006F7042    jmp         006F713A
 006F7047    mov         byte ptr [ebx+0F],al
>006F704A    jmp         006F713A
 006F704F    lea         eax,[ebp-10]
 006F7052    mov         edx,dword ptr [ebp-4]
 006F7055    call        @UStrFromLStr
 006F705A    mov         edx,dword ptr [ebp-10]
 006F705D    mov         eax,6F71A4;'.'
 006F7062    call        Pos
 006F7067    mov         esi,eax
 006F7069    test        esi,esi
>006F706B    jle         006F70A8
 006F706D    lea         eax,[ebp-18]
 006F7070    push        eax
 006F7071    mov         ecx,esi
 006F7073    sub         ecx,3
 006F7076    mov         edx,3
 006F707B    mov         eax,dword ptr [ebp-4]
 006F707E    call        @LStrCopy
 006F7083    mov         edx,dword ptr [ebp-18]
 006F7086    lea         eax,[ebp-14]
 006F7089    call        @UStrFromLStr
 006F708E    mov         eax,dword ptr [ebp-14]
 006F7091    xor         edx,edx
 006F7093    call        StrToIntDef
 006F7098    mov         dword ptr [ebp-1C],eax
 006F709B    fild        dword ptr [ebp-1C]
 006F709E    fdiv        dword ptr ds:[6F71A8];256:Single
 006F70A4    fstp        qword ptr [ebx+18]
 006F70A7    wait
 006F70A8    lea         eax,[ebp-4]
 006F70AB    mov         ecx,esi
 006F70AD    mov         edx,1
 006F70B2    call        @LStrDelete
 006F70B7    lea         eax,[ebp-20]
 006F70BA    mov         edx,dword ptr [ebp-4]
 006F70BD    call        @UStrFromLStr
 006F70C2    mov         edx,dword ptr [ebp-20]
 006F70C5    mov         eax,6F71A4;'.'
 006F70CA    call        Pos
 006F70CF    mov         esi,eax
 006F70D1    test        esi,esi
>006F70D3    jle         006F7110
 006F70D5    lea         eax,[ebp-28]
 006F70D8    push        eax
 006F70D9    mov         ecx,esi
 006F70DB    sub         ecx,3
 006F70DE    mov         edx,3
 006F70E3    mov         eax,dword ptr [ebp-4]
 006F70E6    call        @LStrCopy
 006F70EB    mov         edx,dword ptr [ebp-28]
 006F70EE    lea         eax,[ebp-24]
 006F70F1    call        @UStrFromLStr
 006F70F6    mov         eax,dword ptr [ebp-24]
 006F70F9    xor         edx,edx
 006F70FB    call        StrToIntDef
 006F7100    mov         dword ptr [ebp-1C],eax
 006F7103    fild        dword ptr [ebp-1C]
 006F7106    fdiv        dword ptr ds:[6F71AC];192:Single
 006F710C    fstp        qword ptr [ebx+20]
 006F710F    wait
 006F7110    lea         eax,[ebp-4]
 006F7113    mov         ecx,esi
 006F7115    mov         edx,1
 006F711A    call        @LStrDelete
 006F711F    mov         eax,dword ptr [ebp-4]
 006F7122    test        eax,eax
>006F7124    je          006F712B
 006F7126    sub         eax,4
 006F7129    mov         eax,dword ptr [eax]
 006F712B    dec         eax
>006F712C    jl          006F713A
 006F712E    mov         eax,dword ptr [ebp-4]
 006F7131    cmp         byte ptr [eax],31
 006F7134    sete        al
 006F7137    mov         byte ptr [ebx+10],al
 006F713A    xor         eax,eax
 006F713C    pop         edx
 006F713D    pop         ecx
 006F713E    pop         ecx
 006F713F    mov         dword ptr fs:[eax],edx
 006F7142    push        6F7191
 006F7147    lea         eax,[ebp-28]
 006F714A    call        @LStrClr
 006F714F    lea         eax,[ebp-24]
 006F7152    mov         edx,2
 006F7157    call        @UStrArrayClr
 006F715C    lea         eax,[ebp-18]
 006F715F    call        @LStrClr
 006F7164    lea         eax,[ebp-14]
 006F7167    mov         edx,2
 006F716C    call        @UStrArrayClr
 006F7171    lea         eax,[ebp-0C]
 006F7174    call        @LStrClr
 006F7179    lea         eax,[ebp-8]
 006F717C    call        @UStrClr
 006F7181    lea         eax,[ebp-4]
 006F7184    call        @LStrClr
 006F7189    ret
>006F718A    jmp         @HandleFinally
>006F718F    jmp         006F7147
 006F7191    pop         esi
 006F7192    pop         ebx
 006F7193    mov         esp,ebp
 006F7195    pop         ebp
 006F7196    ret
end;*}

//006F71B0
procedure sub_006F71B0;
begin
{*
 006F71B0    push        ebx
 006F71B1    mov         ebx,822988;gvar_00822988:THashTable
 006F71B6    xor         ecx,ecx
 006F71B8    mov         edx,6F7338;'Exists'
 006F71BD    mov         eax,dword ptr [ebx]
 006F71BF    call        THashTable.Add
 006F71C4    mov         ecx,1
 006F71C9    mov         edx,6F7354;'X'
 006F71CE    mov         eax,dword ptr [ebx]
 006F71D0    call        THashTable.Add
 006F71D5    mov         ecx,2
 006F71DA    mov         edx,6F7364;'Y'
 006F71DF    mov         eax,dword ptr [ebx]
 006F71E1    call        THashTable.Add
 006F71E6    mov         ecx,3
 006F71EB    mov         edx,6F7374;'A'
 006F71F0    mov         eax,dword ptr [ebx]
 006F71F2    call        THashTable.Add
 006F71F7    mov         ecx,4
 006F71FC    mov         edx,6F7384;'B'
 006F7201    mov         eax,dword ptr [ebx]
 006F7203    call        THashTable.Add
 006F7208    mov         ecx,5
 006F720D    mov         edx,6F7394;'L'
 006F7212    mov         eax,dword ptr [ebx]
 006F7214    call        THashTable.Add
 006F7219    mov         ecx,6
 006F721E    mov         edx,6F73A4;'R'
 006F7223    mov         eax,dword ptr [ebx]
 006F7225    call        THashTable.Add
 006F722A    mov         ecx,7
 006F722F    mov         edx,6F73B4;'Start'
 006F7234    mov         eax,dword ptr [ebx]
 006F7236    call        THashTable.Add
 006F723B    mov         ecx,8
 006F7240    mov         edx,6F73CC;'Select'
 006F7245    mov         eax,dword ptr [ebx]
 006F7247    call        THashTable.Add
 006F724C    mov         ecx,9
 006F7251    mov         edx,6F73E8;'Up'
 006F7256    mov         eax,dword ptr [ebx]
 006F7258    call        THashTable.Add
 006F725D    mov         ecx,0A
 006F7262    mov         edx,6F73FC;'Down'
 006F7267    mov         eax,dword ptr [ebx]
 006F7269    call        THashTable.Add
 006F726E    mov         ecx,0B
 006F7273    mov         edx,6F7414;'Left'
 006F7278    mov         eax,dword ptr [ebx]
 006F727A    call        THashTable.Add
 006F727F    mov         ecx,0C
 006F7284    mov         edx,6F742C;'Right'
 006F7289    mov         eax,dword ptr [ebx]
 006F728B    call        THashTable.Add
 006F7290    mov         ecx,0D
 006F7295    mov         edx,6F7444;'Green'
 006F729A    mov         eax,dword ptr [ebx]
 006F729C    call        THashTable.Add
 006F72A1    mov         ecx,0E
 006F72A6    mov         edx,6F745C;'Red'
 006F72AB    mov         eax,dword ptr [ebx]
 006F72AD    call        THashTable.Add
 006F72B2    mov         ecx,0F
 006F72B7    mov         edx,6F7470;'Yellow'
 006F72BC    mov         eax,dword ptr [ebx]
 006F72BE    call        THashTable.Add
 006F72C3    mov         ecx,10
 006F72C8    mov         edx,6F748C;'Blue'
 006F72CD    mov         eax,dword ptr [ebx]
 006F72CF    call        THashTable.Add
 006F72D4    mov         ecx,11
 006F72D9    mov         edx,6F74A4;'Touching'
 006F72DE    mov         eax,dword ptr [ebx]
 006F72E0    call        THashTable.Add
 006F72E5    mov         ecx,12
 006F72EA    mov         edx,6F74C4;'StylusX'
 006F72EF    mov         eax,dword ptr [ebx]
 006F72F1    call        THashTable.Add
 006F72F6    mov         ecx,13
 006F72FB    mov         edx,6F74E0;'StylusY'
 006F7300    mov         eax,dword ptr [ebx]
 006F7302    call        THashTable.Add
 006F7307    mov         ecx,14
 006F730C    mov         edx,6F74FC;^'RealLeftStick'
 006F7311    mov         eax,dword ptr [ebx]
 006F7313    call        THashTable.Add
 006F7318    mov         ecx,15
 006F731D    mov         edx,6F7514;'profile'
 006F7322    mov         eax,dword ptr [ebx]
 006F7324    call        THashTable.Add
 006F7329    pop         ebx
 006F732A    ret
*}
end;

//006F7524
{*function sub_006F7524(?:?):?;
begin
 006F7524    push        ebp
 006F7525    mov         ebp,esp
 006F7527    add         esp,0FFFFFFF8
 006F752A    push        ebx
 006F752B    push        esi
 006F752C    push        edi
 006F752D    xor         edx,edx
 006F752F    mov         dword ptr [ebp-8],edx
 006F7532    mov         dword ptr [ebp-4],eax
 006F7535    mov         eax,dword ptr [ebp-4]
 006F7538    call        @UStrAddRef
 006F753D    xor         eax,eax
 006F753F    push        ebp
 006F7540    push        6F75F0
 006F7545    push        dword ptr fs:[eax]
 006F7548    mov         dword ptr fs:[eax],esp
 006F754B    xor         esi,esi
 006F754D    lea         eax,[ebp-8]
 006F7550    mov         edx,dword ptr [ebp-4]
 006F7553    call        @UStrLAsg
 006F7558    lea         eax,[ebp-8]
 006F755B    mov         edx,6F760C;'NDS'
 006F7560    call        004F9BD0
 006F7565    test        al,al
>006F7567    jne         006F757A
 006F7569    lea         eax,[ebp-8]
 006F756C    mov         edx,6F7620;'NintendoDS'
 006F7571    call        004F9BD0
 006F7576    test        al,al
>006F7578    je          006F75D5
 006F757A    lea         eax,[ebp-8]
 006F757D    call        004F9D00
 006F7582    mov         ebx,eax
 006F7584    lea         eax,[ebp-8]
 006F7587    mov         edx,6F7644;'.'
 006F758C    call        004F9BD0
 006F7591    test        al,al
>006F7593    je          006F75D5
 006F7595    mov         eax,dword ptr [ebp-8]
 006F7598    call        006F7CA4
 006F759D    mov         edi,eax
 006F759F    test        edi,edi
>006F75A1    jl          006F75D5
 006F75A3    mov         dl,1
 006F75A5    mov         eax,[006F6874];TNDSValue
 006F75AA    call        TObject.Create;TNDSValue.Create
 006F75AF    mov         esi,eax
 006F75B1    mov         dword ptr [esi+20],edi;TNDSValue........................Item:Integer
 006F75B4    test        ebx,ebx
>006F75B6    jg          006F75BD
 006F75B8    mov         ebx,1
 006F75BD    mov         dword ptr [esi+18],ebx;TNDSValue...........................................................
 006F75C0    cmp         ebx,dword ptr ds:[822998];gvar_00822998
>006F75C6    jle         006F75CE
 006F75C8    mov         dword ptr ds:[822998],ebx;gvar_00822998
 006F75CE    mov         byte ptr ds:[82298C],1;gvar_0082298C
 006F75D5    xor         eax,eax
 006F75D7    pop         edx
 006F75D8    pop         ecx
 006F75D9    pop         ecx
 006F75DA    mov         dword ptr fs:[eax],edx
 006F75DD    push        6F75F7
 006F75E2    lea         eax,[ebp-8]
 006F75E5    mov         edx,2
 006F75EA    call        @UStrArrayClr
 006F75EF    ret
>006F75F0    jmp         @HandleFinally
>006F75F5    jmp         006F75E2
 006F75F7    mov         eax,esi
 006F75F9    pop         edi
 006F75FA    pop         esi
 006F75FB    pop         ebx
 006F75FC    pop         ecx
 006F75FD    pop         ecx
 006F75FE    pop         ebp
 006F75FF    ret
end;*}

//006F7648
function TNDSValue.CanSet:Boolean;
begin
{*
 006F7648    mov         al,1
 006F764A    ret
*}
end;

//006F764C
procedure TNDSValue.CreateClone;
begin
{*
 006F764C    mov         dl,1
 006F764E    mov         eax,[006F6874];TNDSValue
 006F7653    call        TObject.Create;TNDSValue.Create
 006F7658    ret
*}
end;

//006F765C
procedure TNDSValue.FillClone(c:TExpression);
begin
{*
 006F765C    push        ebx
 006F765D    push        esi
 006F765E    mov         esi,edx
 006F7660    mov         ebx,eax
 006F7662    mov         edx,esi
 006F7664    mov         eax,ebx
 006F7666    call        TExpression.FillClone
 006F766B    mov         eax,esi
 006F766D    mov         edx,dword ptr [ebx+20];TNDSValue.........................Item:Integer
 006F7670    mov         dword ptr [eax+20],edx
 006F7673    mov         edx,dword ptr [ebx+18];TNDSValue...........................................................
 006F7676    mov         dword ptr [eax+18],edx
 006F7679    pop         esi
 006F767A    pop         ebx
 006F767B    ret
*}
end;

//006F767C
function TNDSValue.GetDataType:TDataType;
begin
{*
 006F767C    mov         eax,dword ptr [eax+20];TNDSValue..........................Item:Integer
 006F767F    sub         eax,12
>006F7682    jb          006F768D
 006F7684    sub         eax,2
>006F7687    jb          006F7690
>006F7689    je          006F7693
>006F768B    jmp         006F7696
 006F768D    mov         al,3
 006F768F    ret
 006F7690    xor         eax,eax
 006F7692    ret
 006F7693    mov         al,2
 006F7695    ret
 006F7696    xor         eax,eax
 006F7698    ret
*}
end;

//006F769C
function TNDSValue.GetPerUnits1:TUnits;
begin
{*
 006F769C    mov         eax,dword ptr [eax+20];TNDSValue...........................Item:Integer
 006F769F    sub         eax,1
>006F76A2    jae         006F76A7
 006F76A4    xor         eax,eax
 006F76A6    ret
 006F76A7    xor         eax,eax
 006F76A9    ret
*}
end;

//006F76AC
function TNDSValue.GetPerUnits2:TUnits;
begin
{*
 006F76AC    mov         eax,dword ptr [eax+20];TNDSValue............................Item:Integer
 006F76AF    sub         eax,1
>006F76B2    jae         006F76B7
 006F76B4    xor         eax,eax
 006F76B6    ret
 006F76B7    xor         eax,eax
 006F76B9    ret
*}
end;

//006F76BC
{*procedure TNDSValue.GetString(?:?);
begin
 006F76BC    push        ebx
 006F76BD    push        esi
 006F76BE    mov         esi,edx
 006F76C0    mov         ebx,eax
 006F76C2    mov         eax,dword ptr [ebx+20];TNDSValue.............................Item:Integer
 006F76C5    sub         eax,1
>006F76C8    jae         006F76D6
 006F76CA    mov         edx,esi
 006F76CC    mov         eax,ebx
 006F76CE    call        TExpression.GetString
 006F76D3    pop         esi
 006F76D4    pop         ebx
 006F76D5    ret
 006F76D6    mov         edx,esi
 006F76D8    mov         eax,ebx
 006F76DA    call        TExpression.GetString
 006F76DF    pop         esi
 006F76E0    pop         ebx
 006F76E1    ret
end;*}

//006F76E4
function TNDSValue.GetUnits:TUnits;
begin
{*
 006F76E4    mov         eax,dword ptr [eax+20];TNDSValue..............................Item:Integer
 006F76E7    sub         eax,1
>006F76EA    jae         006F76EF
 006F76EC    xor         eax,eax
 006F76EE    ret
 006F76EF    xor         eax,eax
 006F76F1    ret
*}
end;

//006F76F4
procedure TNDSValue.GetValue;
begin
{*
 006F76F4    push        ebx
 006F76F5    add         esp,0FFFFFFF4
 006F76F8    mov         ebx,eax
 006F76FA    cmp         byte ptr ds:[82298D],0;gvar_0082298D
>006F7701    je          006F7721
 006F7703    cmp         dword ptr [ebx+18],0;TNDSValue.............................................................
>006F7707    jl          006F7721
 006F7709    cmp         dword ptr [ebx+18],3E7;TNDSValue...........................................................
>006F7710    jg          006F7721
 006F7712    mov         eax,[00822994];gvar_00822994:?
 006F7717    call        @DynArrayHigh
 006F771C    cmp         eax,dword ptr [ebx+18];TNDSValue...........................................................
>006F771F    jge         006F772F
 006F7721    xor         eax,eax
 006F7723    mov         dword ptr [esp],eax
 006F7726    mov         dword ptr [esp+4],eax
>006F772A    jmp         006F791A
 006F772F    mov         eax,dword ptr [ebx+18];TNDSValue...........................................................
 006F7732    add         eax,eax
 006F7734    lea         eax,[eax+eax*2]
 006F7737    mov         edx,dword ptr ds:[822994];gvar_00822994:?
 006F773D    lea         eax,[edx+eax*8]
 006F7740    mov         edx,dword ptr [ebx+20];TNDSValue...............................Item:Integer
 006F7743    cmp         edx,14
>006F7746    ja          006F7911
 006F774C    jmp         dword ptr [edx*4+6F7753]
 006F774C    dd          006F77A7
 006F774C    dd          006F77BF
 006F774C    dd          006F77D6
 006F774C    dd          006F77EE
 006F774C    dd          006F7806
 006F774C    dd          006F781E
 006F774C    dd          006F7836
 006F774C    dd          006F784E
 006F774C    dd          006F7866
 006F774C    dd          006F7911
 006F774C    dd          006F7911
 006F774C    dd          006F7911
 006F774C    dd          006F7911
 006F774C    dd          006F7896
 006F774C    dd          006F78AB
 006F774C    dd          006F78C0
 006F774C    dd          006F78D5
 006F774C    dd          006F787E
 006F774C    dd          006F78EA
 006F774C    dd          006F78F9
 006F774C    dd          006F7908
 006F77A7    movzx       eax,byte ptr [eax+11]
 006F77AB    movsx       eax,al
 006F77AE    mov         dword ptr [esp+8],eax
 006F77B2    fild        dword ptr [esp+8]
 006F77B6    fstp        qword ptr [esp]
 006F77B9    wait
>006F77BA    jmp         006F791A
 006F77BF    movzx       eax,byte ptr [eax]
 006F77C2    movsx       eax,al
 006F77C5    mov         dword ptr [esp+8],eax
 006F77C9    fild        dword ptr [esp+8]
 006F77CD    fstp        qword ptr [esp]
 006F77D0    wait
>006F77D1    jmp         006F791A
 006F77D6    movzx       eax,byte ptr [eax+1]
 006F77DA    movsx       eax,al
 006F77DD    mov         dword ptr [esp+8],eax
 006F77E1    fild        dword ptr [esp+8]
 006F77E5    fstp        qword ptr [esp]
 006F77E8    wait
>006F77E9    jmp         006F791A
 006F77EE    movzx       eax,byte ptr [eax+2]
 006F77F2    movsx       eax,al
 006F77F5    mov         dword ptr [esp+8],eax
 006F77F9    fild        dword ptr [esp+8]
 006F77FD    fstp        qword ptr [esp]
 006F7800    wait
>006F7801    jmp         006F791A
 006F7806    movzx       eax,byte ptr [eax+3]
 006F780A    movsx       eax,al
 006F780D    mov         dword ptr [esp+8],eax
 006F7811    fild        dword ptr [esp+8]
 006F7815    fstp        qword ptr [esp]
 006F7818    wait
>006F7819    jmp         006F791A
 006F781E    movzx       eax,byte ptr [eax+4]
 006F7822    movsx       eax,al
 006F7825    mov         dword ptr [esp+8],eax
 006F7829    fild        dword ptr [esp+8]
 006F782D    fstp        qword ptr [esp]
 006F7830    wait
>006F7831    jmp         006F791A
 006F7836    movzx       eax,byte ptr [eax+5]
 006F783A    movsx       eax,al
 006F783D    mov         dword ptr [esp+8],eax
 006F7841    fild        dword ptr [esp+8]
 006F7845    fstp        qword ptr [esp]
 006F7848    wait
>006F7849    jmp         006F791A
 006F784E    movzx       eax,byte ptr [eax+6]
 006F7852    movsx       eax,al
 006F7855    mov         dword ptr [esp+8],eax
 006F7859    fild        dword ptr [esp+8]
 006F785D    fstp        qword ptr [esp]
 006F7860    wait
>006F7861    jmp         006F791A
 006F7866    movzx       eax,byte ptr [eax+7]
 006F786A    movsx       eax,al
 006F786D    mov         dword ptr [esp+8],eax
 006F7871    fild        dword ptr [esp+8]
 006F7875    fstp        qword ptr [esp]
 006F7878    wait
>006F7879    jmp         006F791A
 006F787E    movzx       eax,byte ptr [eax+10]
 006F7882    movsx       eax,al
 006F7885    mov         dword ptr [esp+8],eax
 006F7889    fild        dword ptr [esp+8]
 006F788D    fstp        qword ptr [esp]
 006F7890    wait
>006F7891    jmp         006F791A
 006F7896    movzx       eax,byte ptr [eax+0F]
 006F789A    movsx       eax,al
 006F789D    mov         dword ptr [esp+8],eax
 006F78A1    fild        dword ptr [esp+8]
 006F78A5    fstp        qword ptr [esp]
 006F78A8    wait
>006F78A9    jmp         006F791A
 006F78AB    movzx       eax,byte ptr [eax+0E]
 006F78AF    movsx       eax,al
 006F78B2    mov         dword ptr [esp+8],eax
 006F78B6    fild        dword ptr [esp+8]
 006F78BA    fstp        qword ptr [esp]
 006F78BD    wait
>006F78BE    jmp         006F791A
 006F78C0    movzx       eax,byte ptr [eax+0D]
 006F78C4    movsx       eax,al
 006F78C7    mov         dword ptr [esp+8],eax
 006F78CB    fild        dword ptr [esp+8]
 006F78CF    fstp        qword ptr [esp]
 006F78D2    wait
>006F78D3    jmp         006F791A
 006F78D5    movzx       eax,byte ptr [eax+0C]
 006F78D9    movsx       eax,al
 006F78DC    mov         dword ptr [esp+8],eax
 006F78E0    fild        dword ptr [esp+8]
 006F78E4    fstp        qword ptr [esp]
 006F78E7    wait
>006F78E8    jmp         006F791A
 006F78EA    mov         edx,dword ptr [eax+18]
 006F78ED    mov         dword ptr [esp],edx
 006F78F0    mov         edx,dword ptr [eax+1C]
 006F78F3    mov         dword ptr [esp+4],edx
>006F78F7    jmp         006F791A
 006F78F9    mov         edx,dword ptr [eax+20]
 006F78FC    mov         dword ptr [esp],edx
 006F78FF    mov         edx,dword ptr [eax+24]
 006F7902    mov         dword ptr [esp+4],edx
>006F7906    jmp         006F791A
 006F7908    fild        dword ptr [eax+28]
 006F790B    fstp        qword ptr [esp]
 006F790E    wait
>006F790F    jmp         006F791A
 006F7911    xor         eax,eax
 006F7913    mov         dword ptr [esp],eax
 006F7916    mov         dword ptr [esp+4],eax
 006F791A    fld         qword ptr [esp]
 006F791D    add         esp,0C
 006F7920    pop         ebx
 006F7921    ret
*}
end;

//006F7924
function TNDSValue.SetValue(NewValue:Double):Boolean;
begin
{*
 006F7924    push        ebp
 006F7925    mov         ebp,esp
 006F7927    push        ebx
 006F7928    push        esi
 006F7929    push        edi
 006F792A    mov         edi,eax
 006F792C    mov         esi,dword ptr [edi+18];TNDSValue...........................................................
 006F792F    test        esi,esi
>006F7931    jl          006F7949
 006F7933    cmp         esi,3E7
>006F7939    jg          006F7949
 006F793B    mov         eax,[00822994];gvar_00822994:?
 006F7940    call        @DynArrayHigh
 006F7945    cmp         esi,eax
>006F7947    jle         006F794D
 006F7949    xor         ebx,ebx
>006F794B    jmp         006F7991
 006F794D    mov         bl,1
 006F794F    mov         eax,dword ptr [edi+20];TNDSValue................................Item:Integer
 006F7952    sub         eax,1
>006F7955    jb          006F795E
 006F7957    sub         eax,13
>006F795A    je          006F7962
>006F795C    jmp         006F798F
 006F795E    xor         ebx,ebx
>006F7960    jmp         006F7991
 006F7962    fld         qword ptr [ebp+8]
 006F7965    call        @ROUND
 006F796A    mov         edx,dword ptr [edi+18];TNDSValue...........................................................
 006F796D    add         edx,edx
 006F796F    lea         edx,[edx+edx*2]
 006F7972    mov         ecx,dword ptr ds:[822994];gvar_00822994:?
 006F7978    cmp         eax,dword ptr [ecx+edx*8+28]
>006F797C    je          006F7991
 006F797E    mov         ecx,dword ptr ds:[822994];gvar_00822994:?
 006F7984    mov         dword ptr [ecx+edx*8+28],eax
 006F7988    call        006159D0
>006F798D    jmp         006F7991
 006F798F    xor         ebx,ebx
 006F7991    mov         eax,ebx
 006F7993    pop         edi
 006F7994    pop         esi
 006F7995    pop         ebx
 006F7996    pop         ebp
 006F7997    ret         8
*}
end;

//006F799C
{*procedure TNDSValue.ToString(?:?);
begin
 006F799C    push        ebp
 006F799D    mov         ebp,esp
 006F799F    push        0
 006F79A1    push        0
 006F79A3    push        0
 006F79A5    push        ebx
 006F79A6    push        esi
 006F79A7    push        edi
 006F79A8    mov         esi,edx
 006F79AA    mov         ebx,eax
 006F79AC    xor         eax,eax
 006F79AE    push        ebp
 006F79AF    push        6F7A29
 006F79B4    push        dword ptr fs:[eax]
 006F79B7    mov         dword ptr fs:[eax],esp
 006F79BA    mov         edi,dword ptr [ebx+18];TNDSValue...........................................................
 006F79BD    test        edi,edi
>006F79BF    jle         006F79F4
 006F79C1    push        6F7A44;'NDS'
 006F79C6    lea         edx,[ebp-4]
 006F79C9    mov         eax,edi
 006F79CB    call        IntToStr
 006F79D0    push        dword ptr [ebp-4]
 006F79D3    push        6F7A58;'.'
 006F79D8    lea         edx,[ebp-8]
 006F79DB    mov         eax,dword ptr [ebx+20];TNDSValue.................................Item:Integer
 006F79DE    call        006F7CF4
 006F79E3    push        dword ptr [ebp-8]
 006F79E6    mov         eax,esi
 006F79E8    mov         edx,4
 006F79ED    call        @UStrCatN
>006F79F2    jmp         006F7A0E
 006F79F4    lea         edx,[ebp-0C]
 006F79F7    mov         eax,dword ptr [ebx+20];TNDSValue..................................Item:Integer
 006F79FA    call        006F7CF4
 006F79FF    mov         ecx,dword ptr [ebp-0C]
 006F7A02    mov         eax,esi
 006F7A04    mov         edx,6F7A68;'NDS.'
 006F7A09    call        @UStrCat3
 006F7A0E    xor         eax,eax
 006F7A10    pop         edx
 006F7A11    pop         ecx
 006F7A12    pop         ecx
 006F7A13    mov         dword ptr fs:[eax],edx
 006F7A16    push        6F7A30
 006F7A1B    lea         eax,[ebp-0C]
 006F7A1E    mov         edx,3
 006F7A23    call        @UStrArrayClr
 006F7A28    ret
>006F7A29    jmp         @HandleFinally
>006F7A2E    jmp         006F7A1B
 006F7A30    pop         edi
 006F7A31    pop         esi
 006F7A32    pop         ebx
 006F7A33    mov         esp,ebp
 006F7A35    pop         ebp
 006F7A36    ret
end;*}

//006F7A74
procedure sub_006F7A74;
begin
{*
 006F7A74    push        ebp
 006F7A75    mov         ebp,esp
 006F7A77    push        ebx
 006F7A78    push        esi
 006F7A79    push        edi
 006F7A7A    mov         byte ptr ds:[82298C],0;gvar_0082298C
 006F7A81    push        0
 006F7A83    mov         eax,822994;gvar_00822994:?
 006F7A88    mov         ecx,1
 006F7A8D    mov         edx,dword ptr ds:[6F6D88];:3
 006F7A93    call        @DynArraySetLength
 006F7A98    add         esp,4
 006F7A9B    xor         eax,eax
 006F7A9D    mov         [00822998],eax;gvar_00822998
 006F7AA2    xor         edx,edx
 006F7AA4    push        ebp
 006F7AA5    push        6F7ACE
 006F7AAA    push        dword ptr fs:[edx]
 006F7AAD    mov         dword ptr fs:[edx],esp
 006F7AB0    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006F7AB5    mov         eax,dword ptr [eax]
 006F7AB7    mov         eax,dword ptr [eax+508]
 006F7ABD    xor         edx,edx
 006F7ABF    call        TIdUDPBase.SetActive
 006F7AC4    xor         eax,eax
 006F7AC6    pop         edx
 006F7AC7    pop         ecx
 006F7AC8    pop         ecx
 006F7AC9    mov         dword ptr fs:[eax],edx
>006F7ACC    jmp         006F7AE9
>006F7ACE    jmp         @HandleOnException
 006F7AD3    dd          1
 006F7AD7    dd          00418C04;Exception
 006F7ADB    dd          006F7ADF
 006F7ADF    call        004FA644
 006F7AE4    call        @DoneExcept
 006F7AE9    xor         edx,edx
 006F7AEB    push        ebp
 006F7AEC    push        6F7B19
 006F7AF1    push        dword ptr fs:[edx]
 006F7AF4    mov         dword ptr fs:[edx],esp
 006F7AF7    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006F7AFC    mov         eax,dword ptr [eax]
 006F7AFE    mov         eax,dword ptr [eax+508]
 006F7B04    mov         eax,dword ptr [eax+0B0]
 006F7B0A    call        TCollection.Clear
 006F7B0F    xor         eax,eax
 006F7B11    pop         edx
 006F7B12    pop         ecx
 006F7B13    pop         ecx
 006F7B14    mov         dword ptr fs:[eax],edx
>006F7B17    jmp         006F7B34
>006F7B19    jmp         @HandleOnException
 006F7B1E    dd          1
 006F7B22    dd          00418C04;Exception
 006F7B26    dd          006F7B2A
 006F7B2A    call        004FA644
 006F7B2F    call        @DoneExcept
 006F7B34    pop         edi
 006F7B35    pop         esi
 006F7B36    pop         ebx
 006F7B37    pop         ebp
 006F7B38    ret
*}
end;

//006F7B3C
procedure sub_006F7B3C;
begin
{*
 006F7B3C    push        ebx
 006F7B3D    push        esi
 006F7B3E    push        edi
 006F7B3F    mov         edi,822994;gvar_00822994:?
 006F7B44    mov         eax,[00822998];gvar_00822998
 006F7B49    inc         eax
 006F7B4A    push        eax
 006F7B4B    mov         eax,edi
 006F7B4D    mov         ecx,1
 006F7B52    mov         edx,dword ptr ds:[6F6D88];:3
 006F7B58    call        @DynArraySetLength
 006F7B5D    add         esp,4
 006F7B60    mov         eax,dword ptr [edi]
 006F7B62    call        @DynArrayHigh
 006F7B67    mov         esi,eax
 006F7B69    test        esi,esi
>006F7B6B    jle         006F7B90
 006F7B6D    mov         ebx,1
 006F7B72    mov         eax,ebx
 006F7B74    call        006F6DB0
 006F7B79    mov         eax,ebx
 006F7B7B    add         eax,eax
 006F7B7D    lea         eax,[eax+eax*2]
 006F7B80    mov         edx,dword ptr [edi]
 006F7B82    lea         ecx,[ebx+251C]
 006F7B88    mov         dword ptr [edx+eax*8+28],ecx
 006F7B8C    inc         ebx
 006F7B8D    dec         esi
>006F7B8E    jne         006F7B72
 006F7B90    pop         edi
 006F7B91    pop         esi
 006F7B92    pop         ebx
 006F7B93    ret
*}
end;

//006F7B94
procedure sub_006F7B94;
begin
{*
 006F7B94    push        ebp
 006F7B95    mov         ebp,esp
 006F7B97    push        ebx
 006F7B98    push        esi
 006F7B99    push        edi
 006F7B9A    cmp         byte ptr ds:[82298C],0;gvar_0082298C
>006F7BA1    je          006F7C36
 006F7BA7    xor         edx,edx
 006F7BA9    push        ebp
 006F7BAA    push        6F7BEB
 006F7BAF    push        dword ptr fs:[edx]
 006F7BB2    mov         dword ptr fs:[edx],esp
 006F7BB5    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006F7BBA    mov         eax,dword ptr [eax]
 006F7BBC    mov         eax,dword ptr [eax+508]
 006F7BC2    xor         edx,edx
 006F7BC4    call        TIdUDPBase.SetActive
 006F7BC9    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006F7BCE    mov         eax,dword ptr [eax]
 006F7BD0    mov         eax,dword ptr [eax+508]
 006F7BD6    mov         eax,dword ptr [eax+0B0]
 006F7BDC    call        TCollection.Clear
 006F7BE1    xor         eax,eax
 006F7BE3    pop         edx
 006F7BE4    pop         ecx
 006F7BE5    pop         ecx
 006F7BE6    mov         dword ptr fs:[eax],edx
>006F7BE9    jmp         006F7C06
>006F7BEB    jmp         @HandleOnException
 006F7BF0    dd          1
 006F7BF4    dd          00418C04;Exception
 006F7BF8    dd          006F7BFC
 006F7BFC    call        004FA644
 006F7C01    call        @DoneExcept
 006F7C06    mov         byte ptr ds:[82298D],1;gvar_0082298D
 006F7C0D    mov         ebx,dword ptr ds:[822998];gvar_00822998
 006F7C13    test        ebx,ebx
>006F7C15    jle         006F7C36
 006F7C17    mov         esi,1
 006F7C1C    mov         eax,esi
 006F7C1E    add         eax,eax
 006F7C20    lea         eax,[eax+eax*2]
 006F7C23    mov         edx,dword ptr ds:[822994];gvar_00822994:?
 006F7C29    mov         eax,dword ptr [edx+eax*8+28]
 006F7C2D    call        006159D0
 006F7C32    inc         esi
 006F7C33    dec         ebx
>006F7C34    jne         006F7C1C
 006F7C36    pop         edi
 006F7C37    pop         esi
 006F7C38    pop         ebx
 006F7C39    pop         ebp
 006F7C3A    ret
*}
end;

//006F7C3C
procedure sub_006F7C3C;
begin
{*
 006F7C3C    push        ebp
 006F7C3D    mov         ebp,esp
 006F7C3F    push        ebx
 006F7C40    push        esi
 006F7C41    push        edi
 006F7C42    movzx       eax,byte ptr ds:[82298C];gvar_0082298C
 006F7C49    and         al,byte ptr ds:[82298D];gvar_0082298D
>006F7C4F    je          006F7C9F
 006F7C51    xor         edx,edx
 006F7C53    push        ebp
 006F7C54    push        6F7C7D
 006F7C59    push        dword ptr fs:[edx]
 006F7C5C    mov         dword ptr fs:[edx],esp
 006F7C5F    mov         eax,[0078D61C];^gvar_00822CA0:TEditorForm
 006F7C64    mov         eax,dword ptr [eax]
 006F7C66    mov         eax,dword ptr [eax+508]
 006F7C6C    xor         edx,edx
 006F7C6E    call        TIdUDPBase.SetActive
 006F7C73    xor         eax,eax
 006F7C75    pop         edx
 006F7C76    pop         ecx
 006F7C77    pop         ecx
 006F7C78    mov         dword ptr fs:[eax],edx
>006F7C7B    jmp         006F7C98
>006F7C7D    jmp         @HandleOnException
 006F7C82    dd          1
 006F7C86    dd          00418C04;Exception
 006F7C8A    dd          006F7C8E
 006F7C8E    call        004FA644
 006F7C93    call        @DoneExcept
 006F7C98    mov         byte ptr ds:[82298D],0;gvar_0082298D
 006F7C9F    pop         edi
 006F7CA0    pop         esi
 006F7CA1    pop         ebx
 006F7CA2    pop         ebp
 006F7CA3    ret
*}
end;

//006F7CA4
{*function sub_006F7CA4(?:UnicodeString):?;
begin
 006F7CA4    push        ebp
 006F7CA5    mov         ebp,esp
 006F7CA7    push        ecx
 006F7CA8    push        ebx
 006F7CA9    mov         dword ptr [ebp-4],eax
 006F7CAC    mov         eax,dword ptr [ebp-4]
 006F7CAF    call        @UStrAddRef
 006F7CB4    xor         eax,eax
 006F7CB6    push        ebp
 006F7CB7    push        6F7CE7
 006F7CBC    push        dword ptr fs:[eax]
 006F7CBF    mov         dword ptr fs:[eax],esp
 006F7CC2    mov         edx,dword ptr [ebp-4]
 006F7CC5    mov         eax,[00822988];gvar_00822988:THashTable
 006F7CCA    call        THashTable.Get
 006F7CCF    mov         ebx,eax
 006F7CD1    xor         eax,eax
 006F7CD3    pop         edx
 006F7CD4    pop         ecx
 006F7CD5    pop         ecx
 006F7CD6    mov         dword ptr fs:[eax],edx
 006F7CD9    push        6F7CEE
 006F7CDE    lea         eax,[ebp-4]
 006F7CE1    call        @UStrClr
 006F7CE6    ret
>006F7CE7    jmp         @HandleFinally
>006F7CEC    jmp         006F7CDE
 006F7CEE    mov         eax,ebx
 006F7CF0    pop         ebx
 006F7CF1    pop         ecx
 006F7CF2    pop         ebp
 006F7CF3    ret
end;*}

//006F7CF4
{*procedure sub_006F7CF4(?:Integer; ?:?);
begin
 006F7CF4    push        ebx
 006F7CF5    push        esi
 006F7CF6    mov         esi,edx
 006F7CF8    mov         ebx,eax
 006F7CFA    mov         ecx,esi
 006F7CFC    mov         edx,ebx
 006F7CFE    mov         eax,[00822988];gvar_00822988:THashTable
 006F7D03    call        THashTable.Get
 006F7D08    pop         esi
 006F7D09    pop         ebx
 006F7D0A    ret
end;*}

//006F7D0C
{*function sub_006F7D0C:?;
begin
 006F7D0C    push        ebp
 006F7D0D    mov         ebp,esp
 006F7D0F    push        0
 006F7D11    push        ebx
 006F7D12    push        esi
 006F7D13    xor         eax,eax
 006F7D15    push        ebp
 006F7D16    push        6F7D70
 006F7D1B    push        dword ptr fs:[eax]
 006F7D1E    mov         dword ptr fs:[eax],esp
 006F7D21    mov         dl,1
 006F7D23    mov         eax,[0043C7BC];TStringList
 006F7D28    call        TStringList.Create;TStringList.Create
 006F7D2D    mov         esi,eax
 006F7D2F    mov         dl,1
 006F7D31    mov         eax,esi
 006F7D33    call        TStringList.SetSorted
 006F7D38    xor         ebx,ebx
 006F7D3A    lea         edx,[ebp-4]
 006F7D3D    mov         eax,ebx
 006F7D3F    call        006F7CF4
 006F7D44    cmp         dword ptr [ebp-4],0
>006F7D48    je          006F7D54
 006F7D4A    mov         edx,dword ptr [ebp-4]
 006F7D4D    mov         eax,esi
 006F7D4F    mov         ecx,dword ptr [eax]
 006F7D51    call        dword ptr [ecx+38];TStringList.Add
 006F7D54    inc         ebx
 006F7D55    cmp         ebx,16
>006F7D58    jne         006F7D3A
 006F7D5A    xor         eax,eax
 006F7D5C    pop         edx
 006F7D5D    pop         ecx
 006F7D5E    pop         ecx
 006F7D5F    mov         dword ptr fs:[eax],edx
 006F7D62    push        6F7D77
 006F7D67    lea         eax,[ebp-4]
 006F7D6A    call        @UStrClr
 006F7D6F    ret
>006F7D70    jmp         @HandleFinally
>006F7D75    jmp         006F7D67
 006F7D77    mov         eax,esi
 006F7D79    pop         esi
 006F7D7A    pop         ebx
 006F7D7B    pop         ecx
 006F7D7C    pop         ebp
 006F7D7D    ret
end;*}

//006F7D80
{*function sub_006F7D80(?:?):?;
begin
 006F7D80    push        ebp
 006F7D81    mov         ebp,esp
 006F7D83    push        ecx
 006F7D84    push        ebx
 006F7D85    mov         dword ptr [ebp-4],eax
 006F7D88    mov         eax,dword ptr [ebp-4]
 006F7D8B    call        @UStrAddRef
 006F7D90    xor         eax,eax
 006F7D92    push        ebp
 006F7D93    push        6F7DF9
 006F7D98    push        dword ptr fs:[eax]
 006F7D9B    mov         dword ptr fs:[eax],esp
 006F7D9E    lea         eax,[ebp-4]
 006F7DA1    mov         edx,6F7E14;'NDS'
 006F7DA6    call        004F9BD0
 006F7DAB    test        al,al
>006F7DAD    jne         006F7DC4
 006F7DAF    lea         eax,[ebp-4]
 006F7DB2    mov         edx,6F7E28;'NintendoDS'
 006F7DB7    call        004F9BD0
 006F7DBC    test        al,al
>006F7DBE    jne         006F7DC4
 006F7DC0    xor         ebx,ebx
>006F7DC2    jmp         006F7DE3
 006F7DC4    lea         eax,[ebp-4]
 006F7DC7    call        004F9D00
 006F7DCC    lea         eax,[ebp-4]
 006F7DCF    mov         edx,6F7E4C;'.'
 006F7DD4    call        004F9BD0
 006F7DD9    test        al,al
>006F7DDB    jne         006F7DE1
 006F7DDD    xor         ebx,ebx
>006F7DDF    jmp         006F7DE3
 006F7DE1    mov         bl,1
 006F7DE3    xor         eax,eax
 006F7DE5    pop         edx
 006F7DE6    pop         ecx
 006F7DE7    pop         ecx
 006F7DE8    mov         dword ptr fs:[eax],edx
 006F7DEB    push        6F7E00
 006F7DF0    lea         eax,[ebp-4]
 006F7DF3    call        @UStrClr
 006F7DF8    ret
>006F7DF9    jmp         @HandleFinally
>006F7DFE    jmp         006F7DF0
 006F7E00    mov         eax,ebx
 006F7E02    pop         ebx
 006F7E03    pop         ecx
 006F7E04    pop         ebp
 006F7E05    ret
end;*}

Initialization
//00782D38
{*
 00782D38    push        ebp
 00782D39    mov         ebp,esp
 00782D3B    xor         eax,eax
 00782D3D    push        ebp
 00782D3E    push        782D76
 00782D43    push        dword ptr fs:[eax]
 00782D46    mov         dword ptr fs:[eax],esp
 00782D49    sub         dword ptr ds:[822990],1
>00782D50    jae         00782D68
 00782D52    mov         dl,1
 00782D54    mov         eax,[0067D4A4];THashTable
 00782D59    call        THashTable.Create;THashTable.Create
 00782D5E    mov         [00822988],eax;gvar_00822988:THashTable
 00782D63    call        006F71B0
 00782D68    xor         eax,eax
 00782D6A    pop         edx
 00782D6B    pop         ecx
 00782D6C    pop         ecx
 00782D6D    mov         dword ptr fs:[eax],edx
 00782D70    push        782D7D
 00782D75    ret
>00782D76    jmp         @HandleFinally
>00782D7B    jmp         00782D75
 00782D7D    pop         ebp
 00782D7E    ret
*}
Finalization
//006F7E50
{*
 006F7E50    push        ebp
 006F7E51    mov         ebp,esp
 006F7E53    xor         eax,eax
 006F7E55    push        ebp
 006F7E56    push        6F7E9E
 006F7E5B    push        dword ptr fs:[eax]
 006F7E5E    mov         dword ptr fs:[eax],esp
 006F7E61    inc         dword ptr ds:[822990]
>006F7E67    jne         006F7E90
 006F7E69    mov         eax,[00822988];gvar_00822988:THashTable
 006F7E6E    xor         edx,edx
 006F7E70    mov         dword ptr ds:[822988],edx;gvar_00822988:THashTable
 006F7E76    call        TObject.Free
 006F7E7B    call        006F7C3C
 006F7E80    mov         eax,822994;gvar_00822994:?
 006F7E85    mov         edx,dword ptr ds:[6F6D88];:3
 006F7E8B    call        @DynArrayClear
 006F7E90    xor         eax,eax
 006F7E92    pop         edx
 006F7E93    pop         ecx
 006F7E94    pop         ecx
 006F7E95    mov         dword ptr fs:[eax],edx
 006F7E98    push        6F7EA5
 006F7E9D    ret
>006F7E9E    jmp         @HandleFinally
>006F7EA3    jmp         006F7E9D
 006F7EA5    pop         ebp
 006F7EA6    ret
*}
end.