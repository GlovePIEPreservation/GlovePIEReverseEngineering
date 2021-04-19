//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PieMouse;

interface

uses
  SysUtils, Classes;

type
  TMouseValue = class(TObjectValue)
  published
    procedure CreateClone;//005EB734
    constructor Create;//005EB70C
    function GetUnits:TUnits;//005EB81C
    procedure FillClone(c:TExpression);//005EB744
    function Module:TObject;//005EC79C
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;//005EDBE4
    procedure GetVector(x:Double; y:Double; z:Double);//005EC424
    function CanSet:Boolean;//005EB708
    procedure GetValue;//005EB85C
    function GetDataType:TDataType;//005EB768
    //function SetValue(NewValue:Double; ?:?):Boolean;//005ECC14
    //procedure ToString(?:?);//005EDE6C
    procedure Release;//005EC9DC
    procedure Press;//005EC7A4
  public
    ..................................Item:byte;//f20
    //procedure ToString(?:?); virtual;//005EDE6C
    procedure GetValue; virtual;//v2C//005EB85C
    procedure GetVector(x:Double; y:Double; z:Double); virtual;//v3C//005EC424
    function GetDataType:TDataType; virtual;//v44//005EB768
    function GetUnits:TUnits; virtual;//v48//005EB81C
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//005ECC14
    //function SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean; virtual;//v60//005EDBE4
    function CanSet:Boolean; virtual;//v68//005EB708
    procedure Press; virtual;//v6C//005EC7A4
    procedure Release; virtual;//v70//005EC9DC
    procedure CreateClone; virtual;//v80//005EB734
    procedure FillClone(c:TExpression); virtual;//v84//005EB744
    function Module:TObject; virtual;//v98//005EC79C
  end;
  TModuleMouse = class(TPieModule)
  published
    function IsIdentifier(s:string):Boolean;//005F090C
    procedure GetGoodFields;//005F08EC
    procedure Read;//005F0ED8
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//005F08F4
    procedure MonitorFrame;//005F0BFC
    procedure PrepareForMonitoring;//005F0EC8
    function GetDefaultFormat(field:string):TGuiFormat;//005F0860
    procedure ClearRead;//005F0770
    procedure StartCompiletime;//005F0EE0
    procedure StopRuntime;//005F0F00
    procedure StartRuntime;//005F0EEC
    procedure StopCompiletime;//005F0EF8
    function CreateValue(Identifier:string):TExpression;//005F080C
    procedure AddFields;//005EE48C
    constructor Create;//005F0778
  public
    function IsIdentifier(s:string):Boolean; virtual;//v10//005F090C
    function CreateValue(Identifier:string):TExpression; virtual;//v14//005F080C
    procedure GetGoodFields; virtual;//v1C//005F08EC
    procedure AddFields; virtual;//v24//005EE48C
    procedure StartCompiletime; virtual;//v28//005F0EE0
    procedure StopCompiletime; virtual;//v2C//005F0EF8
    procedure StartRuntime; virtual;//v30//005F0EEC
    procedure StopRuntime; virtual;//v34//005F0F00
    procedure ClearRead; virtual;//v38//005F0770
    procedure Read; virtual;//v3C//005F0ED8
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//005F08F4
    function GetDefaultFormat(field:string):TGuiFormat; virtual;//v44//005F0860
    procedure PrepareForMonitoring; virtual;//v5C//005F0EC8
    procedure MonitorFrame; virtual;//v68//005F0BFC
  end;
    //function sub_005EA658(?:string):?;//005EA658
    //function sub_005EAD00:?;//005EAD00
    //function sub_005EADC8:?;//005EADC8
    //function sub_005EAEB4:?;//005EAEB4
    //function sub_005EB23C(?:?):?;//005EB23C
    //function sub_005EB3B0(?:TCursor):?;//005EB3B0
    //function sub_005EB4B4(?:?):?;//005EB4B4
    //function sub_005EB594(?:?):?;//005EB594
    //function sub_005EB698(?:UnicodeString):?;//005EB698
    //procedure sub_005EB6EC(?:byte; ?:?);//005EB6EC
    //function sub_005ED590:?;//005ED590
    //function sub_005ED6E0:?;//005ED6E0
    //function sub_005ED7D8:?;//005ED7D8
    //procedure sub_005ED7FC(?:?);//005ED7FC
    //function sub_005EDA58:?;//005EDA58
    procedure sub_005EDF50;//005EDF50
    procedure sub_005EE02C;//005EE02C
    //procedure sub_005EE140(?:?);//005EE140
    procedure sub_005EE1A4(?:Boolean);//005EE1A4
    procedure sub_005EE218;//005EE218
    //function sub_005EE348(?:?; ?:?; ?:?):?;//005EE348
    procedure sub_005EE3E4;//005EE3E4
    procedure sub_005EE43C;//005EE43C

implementation

//005EA658
{*function sub_005EA658(?:string):?;
begin
 005EA658    push        ebp
 005EA659    mov         ebp,esp
 005EA65B    add         esp,0FFFFFFF4
 005EA65E    push        ebx
 005EA65F    push        esi
 005EA660    push        edi
 005EA661    xor         edx,edx
 005EA663    mov         dword ptr [ebp-8],edx
 005EA666    mov         dword ptr [ebp-4],eax
 005EA669    mov         eax,dword ptr [ebp-4]
 005EA66C    call        @UStrAddRef
 005EA671    xor         eax,eax
 005EA673    push        ebp
 005EA674    push        5EA8EC
 005EA679    push        dword ptr fs:[eax]
 005EA67C    mov         dword ptr fs:[eax],esp
 005EA67F    xor         esi,esi
 005EA681    lea         edx,[ebp-8]
 005EA684    mov         eax,dword ptr [ebp-4]
 005EA687    call        LowerCase
 005EA68C    xor         ebx,ebx
 005EA68E    mov         eax,dword ptr [ebp-8]
 005EA691    mov         edx,5EA908;'lmb'
 005EA696    call        @UStrEqual
>005EA69B    je          005EA715
 005EA69D    mov         eax,dword ptr [ebp-8]
 005EA6A0    mov         edx,5EA91C;'mmb'
 005EA6A5    call        @UStrEqual
>005EA6AA    je          005EA715
 005EA6AC    mov         eax,dword ptr [ebp-8]
 005EA6AF    mov         edx,5EA930;'rmb'
 005EA6B4    call        @UStrEqual
>005EA6B9    je          005EA715
 005EA6BB    mov         eax,dword ptr [ebp-8]
 005EA6BE    mov         edx,5EA944;'mb1'
 005EA6C3    call        @UStrEqual
>005EA6C8    je          005EA715
 005EA6CA    mov         eax,dword ptr [ebp-8]
 005EA6CD    mov         edx,5EA958;'mb2'
 005EA6D2    call        @UStrEqual
>005EA6D7    je          005EA715
 005EA6D9    mov         eax,dword ptr [ebp-8]
 005EA6DC    mov         edx,5EA96C;'mb3'
 005EA6E1    call        @UStrEqual
>005EA6E6    je          005EA715
 005EA6E8    mov         eax,dword ptr [ebp-8]
 005EA6EB    mov         edx,5EA980;'LeftMouseButton'
 005EA6F0    call        @UStrEqual
>005EA6F5    je          005EA715
 005EA6F7    mov         eax,dword ptr [ebp-8]
 005EA6FA    mov         edx,5EA9AC;'middlemousebutton'
 005EA6FF    call        @UStrEqual
>005EA704    je          005EA715
 005EA706    mov         eax,dword ptr [ebp-8]
 005EA709    mov         edx,5EA9DC;'rightmousebutton'
 005EA70E    call        @UStrEqual
>005EA713    jne         005EA72A
 005EA715    lea         eax,[ebp-8]
 005EA718    mov         ecx,dword ptr [ebp-8]
 005EA71B    mov         edx,5EAA0C;'mouse.'
 005EA720    call        @UStrCat3
>005EA725    jmp         005EA7F4
 005EA72A    mov         eax,dword ptr [ebp-8]
 005EA72D    mov         edx,5EAA28;'fakemouse.directinputx'
 005EA732    call        @UStrEqual
>005EA737    je          005EA748
 005EA739    mov         eax,dword ptr [ebp-8]
 005EA73C    mov         edx,5EAA64;'fakemouse.dinputx'
 005EA741    call        @UStrEqual
>005EA746    jne         005EA75A
 005EA748    lea         eax,[ebp-8]
 005EA74B    mov         edx,5EAA94;'mouse.extrainputx'
 005EA750    call        @UStrLAsg
>005EA755    jmp         005EA7F4
 005EA75A    mov         eax,dword ptr [ebp-8]
 005EA75D    mov         edx,5EAAC4;'fakemouse.directinputy'
 005EA762    call        @UStrEqual
>005EA767    je          005EA778
 005EA769    mov         eax,dword ptr [ebp-8]
 005EA76C    mov         edx,5EAB00;'fakemouse.dinputy'
 005EA771    call        @UStrEqual
>005EA776    jne         005EA787
 005EA778    lea         eax,[ebp-8]
 005EA77B    mov         edx,5EAB30;'mouse.extrainputy'
 005EA780    call        @UStrLAsg
>005EA785    jmp         005EA7F4
 005EA787    mov         eax,dword ptr [ebp-8]
 005EA78A    mov         edx,5EAB60;'fakemouse.directinputz'
 005EA78F    call        @UStrEqual
>005EA794    je          005EA7A5
 005EA796    mov         eax,dword ptr [ebp-8]
 005EA799    mov         edx,5EAB9C;'fakemouse.dinputz'
 005EA79E    call        @UStrEqual
>005EA7A3    jne         005EA7B4
 005EA7A5    lea         eax,[ebp-8]
 005EA7A8    mov         edx,5EABCC;'mouse.extrainputz'
 005EA7AD    call        @UStrLAsg
>005EA7B2    jmp         005EA7F4
 005EA7B4    mov         eax,dword ptr [ebp-8]
 005EA7B7    mov         edx,5EABFC;'fakemouse.directinputh'
 005EA7BC    call        @UStrEqual
>005EA7C1    je          005EA7D2
 005EA7C3    mov         eax,dword ptr [ebp-8]
 005EA7C6    mov         edx,5EAC38;'fakemouse.dinputh'
 005EA7CB    call        @UStrEqual
>005EA7D0    jne         005EA7E1
 005EA7D2    lea         eax,[ebp-8]
 005EA7D5    mov         edx,5EAC68;'mouse.extrainputh'
 005EA7DA    call        @UStrLAsg
>005EA7DF    jmp         005EA7F4
 005EA7E1    lea         eax,[ebp-8]
 005EA7E4    mov         edx,5EAC98;'real'
 005EA7E9    call        004F9BD0
 005EA7EE    test        al,al
>005EA7F0    je          005EA7F4
 005EA7F2    mov         bl,1
 005EA7F4    lea         eax,[ebp-8]
 005EA7F7    mov         edx,5EACB0;'mouses'
 005EA7FC    call        004F9BD0
 005EA801    test        al,al
>005EA803    jne         005EA82B
 005EA805    lea         eax,[ebp-8]
 005EA808    mov         edx,5EACCC;'mouse'
 005EA80D    call        004F9BD0
 005EA812    test        al,al
>005EA814    jne         005EA82B
 005EA816    lea         eax,[ebp-8]
 005EA819    mov         edx,5EACE4;'mice'
 005EA81E    call        004F9BD0
 005EA823    test        al,al
>005EA825    je          005EA8D1
 005EA82B    lea         eax,[ebp-8]
 005EA82E    call        004F9D00
 005EA833    mov         dword ptr [ebp-0C],eax
 005EA836    lea         eax,[ebp-8]
 005EA839    mov         edx,5EACFC;'.'
 005EA83E    call        004F9BD0
 005EA843    test        al,al
>005EA845    je          005EA8D1
 005EA84B    test        bl,bl
>005EA84D    je          005EA85F
 005EA84F    lea         eax,[ebp-8]
 005EA852    mov         ecx,dword ptr [ebp-8]
 005EA855    mov         edx,5EAC98;'real'
 005EA85A    call        @UStrCat3
 005EA85F    mov         eax,dword ptr [ebp-8]
 005EA862    call        005EB698
 005EA867    mov         edi,eax
 005EA869    test        edi,edi
 005EA86B    setl        al
 005EA86E    test        al,bl
>005EA870    je          005EA889
 005EA872    lea         eax,[ebp-8]
 005EA875    mov         edx,5EAC98;'real'
 005EA87A    call        004F9BD0
 005EA87F    mov         eax,dword ptr [ebp-8]
 005EA882    call        005EB698
 005EA887    mov         edi,eax
 005EA889    test        edi,edi
>005EA88B    jl          005EA8D1
 005EA88D    mov         dl,1
 005EA88F    mov         eax,[005E9DA0];TMouseValue
 005EA894    call        TMouseValue.Create;TMouseValue.Create
 005EA899    mov         esi,eax
 005EA89B    mov         eax,edi
 005EA89D    mov         byte ptr [esi+20],al;TMouseValue....................................Item:byte
 005EA8A0    mov         eax,dword ptr [ebp-0C]
 005EA8A3    mov         dword ptr [esi+18],eax;TMouseValue.........................................................
 005EA8A6    cmp         dword ptr [ebp-0C],0
>005EA8AA    jge         005EA8B1
 005EA8AC    cmp         edi,22
>005EA8AF    jne         005EA8C0
 005EA8B1    mov         byte ptr ds:[8161F9],1;gvar_008161F9
 005EA8B8    mov         eax,[0078CFD8];^gvar_008162F7
 005EA8BD    mov         byte ptr [eax],1
 005EA8C0    cmp         edi,26
>005EA8C3    jl          005EA8D1
 005EA8C5    cmp         edi,29
>005EA8C8    jg          005EA8D1
 005EA8CA    mov         byte ptr ds:[8161FA],1;gvar_008161FA
 005EA8D1    xor         eax,eax
 005EA8D3    pop         edx
 005EA8D4    pop         ecx
 005EA8D5    pop         ecx
 005EA8D6    mov         dword ptr fs:[eax],edx
 005EA8D9    push        5EA8F3
 005EA8DE    lea         eax,[ebp-8]
 005EA8E1    mov         edx,2
 005EA8E6    call        @UStrArrayClr
 005EA8EB    ret
>005EA8EC    jmp         @HandleFinally
>005EA8F1    jmp         005EA8DE
 005EA8F3    mov         eax,esi
 005EA8F5    pop         edi
 005EA8F6    pop         esi
 005EA8F7    pop         ebx
 005EA8F8    mov         esp,ebp
 005EA8FA    pop         ebp
 005EA8FB    ret
end;*}

//005EAD00
{*function sub_005EAD00:?;
begin
 005EAD00    push        ebp
 005EAD01    mov         ebp,esp
 005EAD03    push        0
 005EAD05    push        ebx
 005EAD06    push        esi
 005EAD07    xor         eax,eax
 005EAD09    push        ebp
 005EAD0A    push        5EAD89
 005EAD0F    push        dword ptr fs:[eax]
 005EAD12    mov         dword ptr fs:[eax],esp
 005EAD15    mov         dl,1
 005EAD17    mov         eax,[0043C7BC];TStringList
 005EAD1C    call        TStringList.Create;TStringList.Create
 005EAD21    mov         esi,eax
 005EAD23    mov         dl,1
 005EAD25    mov         eax,esi
 005EAD27    call        TStringList.SetSorted
 005EAD2C    xor         ebx,ebx
 005EAD2E    lea         edx,[ebp-4]
 005EAD31    mov         eax,ebx
 005EAD33    call        005EB6EC
 005EAD38    cmp         dword ptr [ebp-4],0
>005EAD3C    je          005EAD6A
 005EAD3E    mov         edx,5EADA4;'Extra'
 005EAD43    mov         eax,dword ptr [ebp-4]
 005EAD46    call        004F9A58
 005EAD4B    test        al,al
>005EAD4D    jne         005EAD6A
 005EAD4F    mov         edx,5EADBC;'Real'
 005EAD54    mov         eax,dword ptr [ebp-4]
 005EAD57    call        004F9A58
 005EAD5C    test        al,al
>005EAD5E    jne         005EAD6A
 005EAD60    mov         edx,dword ptr [ebp-4]
 005EAD63    mov         eax,esi
 005EAD65    mov         ecx,dword ptr [eax]
 005EAD67    call        dword ptr [ecx+38];TStringList.Add
 005EAD6A    inc         ebx
 005EAD6B    cmp         ebx,100
>005EAD71    jne         005EAD2E
 005EAD73    xor         eax,eax
 005EAD75    pop         edx
 005EAD76    pop         ecx
 005EAD77    pop         ecx
 005EAD78    mov         dword ptr fs:[eax],edx
 005EAD7B    push        5EAD90
 005EAD80    lea         eax,[ebp-4]
 005EAD83    call        @UStrClr
 005EAD88    ret
>005EAD89    jmp         @HandleFinally
>005EAD8E    jmp         005EAD80
 005EAD90    mov         eax,esi
 005EAD92    pop         esi
 005EAD93    pop         ebx
 005EAD94    pop         ecx
 005EAD95    pop         ebp
 005EAD96    ret
end;*}

//005EADC8
{*function sub_005EADC8:?;
begin
 005EADC8    push        ebx
 005EADC9    mov         dl,1
 005EADCB    mov         eax,[0043C7BC];TStringList
 005EADD0    call        TStringList.Create;TStringList.Create
 005EADD5    mov         ebx,eax
 005EADD7    mov         dl,1
 005EADD9    mov         eax,ebx
 005EADDB    call        TStringList.SetSorted
 005EADE0    mov         edx,5EAE20;^338:Single
 005EADE5    mov         eax,ebx
 005EADE7    mov         ecx,dword ptr [eax]
 005EADE9    call        dword ptr [ecx+38];TStringList.Add
 005EADEC    mov         edx,5EAE48;^338:Single
 005EADF1    mov         eax,ebx
 005EADF3    mov         ecx,dword ptr [eax]
 005EADF5    call        dword ptr [ecx+38];TStringList.Add
 005EADF8    mov         edx,5EAE70;^338:Single
 005EADFD    mov         eax,ebx
 005EADFF    mov         ecx,dword ptr [eax]
 005EAE01    call        dword ptr [ecx+38];TStringList.Add
 005EAE04    mov         edx,5EAE98;^338:Single
 005EAE09    mov         eax,ebx
 005EAE0B    mov         ecx,dword ptr [eax]
 005EAE0D    call        dword ptr [ecx+38];TStringList.Add
 005EAE10    mov         eax,ebx
 005EAE12    pop         ebx
 005EAE13    ret
end;*}

//005EAEB4
{*function sub_005EAEB4:?;
begin
 005EAEB4    push        ebx
 005EAEB5    mov         dl,1
 005EAEB7    mov         eax,[0043C7BC];TStringList
 005EAEBC    call        TStringList.Create;TStringList.Create
 005EAEC1    mov         ebx,eax
 005EAEC3    mov         edx,5EAFB8;'LeftButton'
 005EAEC8    mov         eax,ebx
 005EAECA    mov         ecx,dword ptr [eax]
 005EAECC    call        dword ptr [ecx+38];TStringList.Add
 005EAECF    mov         edx,5EAFDC;'MiddleButton'
 005EAED4    mov         eax,ebx
 005EAED6    mov         ecx,dword ptr [eax]
 005EAED8    call        dword ptr [ecx+38];TStringList.Add
 005EAEDB    mov         edx,5EB004;'RightButton'
 005EAEE0    mov         eax,ebx
 005EAEE2    mov         ecx,dword ptr [eax]
 005EAEE4    call        dword ptr [ecx+38];TStringList.Add
 005EAEE7    mov         edx,5EB028;'XButton1'
 005EAEEC    mov         eax,ebx
 005EAEEE    mov         ecx,dword ptr [eax]
 005EAEF0    call        dword ptr [ecx+38];TStringList.Add
 005EAEF3    mov         edx,5EB048;'XButton2'
 005EAEF8    mov         eax,ebx
 005EAEFA    mov         ecx,dword ptr [eax]
 005EAEFC    call        dword ptr [ecx+38];TStringList.Add
 005EAEFF    mov         edx,5EB068;^338:Single
 005EAF04    mov         eax,ebx
 005EAF06    mov         ecx,dword ptr [eax]
 005EAF08    call        dword ptr [ecx+38];TStringList.Add
 005EAF0B    mov         edx,5EB090;^338:Single
 005EAF10    mov         eax,ebx
 005EAF12    mov         ecx,dword ptr [eax]
 005EAF14    call        dword ptr [ecx+38];TStringList.Add
 005EAF17    mov         edx,5EB0B8;^338:Single
 005EAF1C    mov         eax,ebx
 005EAF1E    mov         ecx,dword ptr [eax]
 005EAF20    call        dword ptr [ecx+38];TStringList.Add
 005EAF23    mov         edx,5EB0E0;^338:Single
 005EAF28    mov         eax,ebx
 005EAF2A    mov         ecx,dword ptr [eax]
 005EAF2C    call        dword ptr [ecx+38];TStringList.Add
 005EAF2F    mov         edx,5EB108;'CursorPosX'
 005EAF34    mov         eax,ebx
 005EAF36    mov         ecx,dword ptr [eax]
 005EAF38    call        dword ptr [ecx+38];TStringList.Add
 005EAF3B    mov         edx,5EB12C;'CursorPosY'
 005EAF40    mov         eax,ebx
 005EAF42    mov         ecx,dword ptr [eax]
 005EAF44    call        dword ptr [ecx+38];TStringList.Add
 005EAF47    mov         edx,5EB150;'x'
 005EAF4C    mov         eax,ebx
 005EAF4E    mov         ecx,dword ptr [eax]
 005EAF50    call        dword ptr [ecx+38];TStringList.Add
 005EAF53    mov         edx,5EB160;'y'
 005EAF58    mov         eax,ebx
 005EAF5A    mov         ecx,dword ptr [eax]
 005EAF5C    call        dword ptr [ecx+38];TStringList.Add
 005EAF5F    mov         edx,5EB170;'VirtualDesktopX'
 005EAF64    mov         eax,ebx
 005EAF66    mov         ecx,dword ptr [eax]
 005EAF68    call        dword ptr [ecx+38];TStringList.Add
 005EAF6B    mov         edx,5EB19C;'VirtualDesktopY'
 005EAF70    mov         eax,ebx
 005EAF72    mov         ecx,dword ptr [eax]
 005EAF74    call        dword ptr [ecx+38];TStringList.Add
 005EAF77    mov         edx,5EB1C8;'WheelUp'
 005EAF7C    mov         eax,ebx
 005EAF7E    mov         ecx,dword ptr [eax]
 005EAF80    call        dword ptr [ecx+38];TStringList.Add
 005EAF83    mov         edx,5EB1E4;'WheelDown'
 005EAF88    mov         eax,ebx
 005EAF8A    mov         ecx,dword ptr [eax]
 005EAF8C    call        dword ptr [ecx+38];TStringList.Add
 005EAF8F    mov         edx,5EB204;'WheelLeft'
 005EAF94    mov         eax,ebx
 005EAF96    mov         ecx,dword ptr [eax]
 005EAF98    call        dword ptr [ecx+38];TStringList.Add
 005EAF9B    mov         edx,5EB224;'WheelRight'
 005EAFA0    mov         eax,ebx
 005EAFA2    mov         ecx,dword ptr [eax]
 005EAFA4    call        dword ptr [ecx+38];TStringList.Add
 005EAFA7    mov         eax,ebx
 005EAFA9    pop         ebx
 005EAFAA    ret
end;*}

//005EB23C
{*function sub_005EB23C(?:?):?;
begin
 005EB23C    cmp         eax,dword ptr ds:[816248];gvar_00816248:HICON
>005EB242    jne         005EB24A
 005EB244    mov         eax,1
 005EB249    ret
 005EB24A    cmp         eax,dword ptr ds:[81624C];gvar_0081624C:HICON
>005EB250    jne         005EB25C
 005EB252    mov         eax,2
>005EB257    jmp         005EB3AE
 005EB25C    cmp         eax,dword ptr ds:[816258];gvar_00816258:HICON
>005EB262    jne         005EB26E
 005EB264    mov         eax,3
>005EB269    jmp         005EB3AE
 005EB26E    cmp         eax,dword ptr ds:[81625C];gvar_0081625C:HICON
>005EB274    jne         005EB280
 005EB276    mov         eax,4
>005EB27B    jmp         005EB3AE
 005EB280    cmp         eax,dword ptr ds:[816264];gvar_00816264:HICON
>005EB286    jne         005EB292
 005EB288    mov         eax,5
>005EB28D    jmp         005EB3AE
 005EB292    cmp         eax,dword ptr ds:[81626C];gvar_0081626C:HICON
>005EB298    jne         005EB2A4
 005EB29A    mov         eax,6
>005EB29F    jmp         005EB3AE
 005EB2A4    cmp         eax,dword ptr ds:[816270];gvar_00816270:HICON
>005EB2AA    jne         005EB2B6
 005EB2AC    mov         eax,7
>005EB2B1    jmp         005EB3AE
 005EB2B6    cmp         eax,dword ptr ds:[816274];gvar_00816274:HICON
>005EB2BC    jne         005EB2C8
 005EB2BE    mov         eax,8
>005EB2C3    jmp         005EB3AE
 005EB2C8    cmp         eax,dword ptr ds:[816278];gvar_00816278:HICON
>005EB2CE    jne         005EB2DA
 005EB2D0    mov         eax,9
>005EB2D5    jmp         005EB3AE
 005EB2DA    cmp         eax,dword ptr ds:[81627C];gvar_0081627C:HICON
>005EB2E0    jne         005EB2EC
 005EB2E2    mov         eax,0A
>005EB2E7    jmp         005EB3AE
 005EB2EC    cmp         eax,dword ptr ds:[816280];gvar_00816280:HICON
>005EB2F2    jne         005EB2FE
 005EB2F4    mov         eax,0B
>005EB2F9    jmp         005EB3AE
 005EB2FE    cmp         eax,dword ptr ds:[816260];gvar_00816260:HICON
>005EB304    jne         005EB310
 005EB306    mov         eax,0C
>005EB30B    jmp         005EB3AE
 005EB310    cmp         eax,dword ptr ds:[816244];gvar_00816244:HICON
>005EB316    jne         005EB322
 005EB318    mov         eax,0D
>005EB31D    jmp         005EB3AE
 005EB322    cmp         eax,dword ptr ds:[816254];gvar_00816254:HICON
>005EB328    jne         005EB331
 005EB32A    mov         eax,0E
>005EB32F    jmp         005EB3AE
 005EB331    cmp         eax,dword ptr ds:[816268];gvar_00816268:HICON
>005EB337    jne         005EB340
 005EB339    mov         eax,0F
>005EB33E    jmp         005EB3AE
 005EB340    cmp         eax,dword ptr ds:[816250];gvar_00816250:HICON
>005EB346    jne         005EB34F
 005EB348    mov         eax,10
>005EB34D    jmp         005EB3AE
 005EB34F    cmp         eax,dword ptr ds:[816284];gvar_00816284
>005EB355    jne         005EB35E
 005EB357    mov         eax,11
>005EB35C    jmp         005EB3AE
 005EB35E    cmp         eax,dword ptr ds:[816288];gvar_00816288
>005EB364    jne         005EB36D
 005EB366    mov         eax,9
>005EB36B    jmp         005EB3AE
 005EB36D    cmp         eax,dword ptr ds:[81628C];gvar_0081628C
>005EB373    jne         005EB37C
 005EB375    mov         eax,7
>005EB37A    jmp         005EB3AE
 005EB37C    cmp         eax,dword ptr ds:[816290];gvar_00816290
>005EB382    jne         005EB38B
 005EB384    mov         eax,12
>005EB389    jmp         005EB3AE
 005EB38B    cmp         eax,dword ptr ds:[816294];gvar_00816294
>005EB391    jne         005EB39A
 005EB393    mov         eax,13
>005EB398    jmp         005EB3AE
 005EB39A    cmp         eax,dword ptr ds:[816298];gvar_00816298
>005EB3A0    jne         005EB3A9
 005EB3A2    mov         eax,14
>005EB3A7    jmp         005EB3AE
 005EB3A9    mov         eax,63
 005EB3AE    ret
end;*}

//005EB3B0
{*function sub_005EB3B0(?:TCursor):?;
begin
 005EB3B0    movsx       eax,ax
 005EB3B3    add         eax,16
 005EB3B6    cmp         eax,17
>005EB3B9    ja          005EB4AB
 005EB3BF    jmp         dword ptr [eax*4+5EB3C6]
 005EB3BF    dd          005EB445
 005EB3BF    dd          005EB481
 005EB3BF    dd          005EB47B
 005EB3BF    dd          005EB475
 005EB3BF    dd          005EB49F
 005EB3BF    dd          005EB4A5
 005EB3BF    dd          005EB499
 005EB3BF    dd          005EB493
 005EB3BF    dd          005EB48D
 005EB3BF    dd          005EB46F
 005EB3BF    dd          005EB487
 005EB3BF    dd          005EB469
 005EB3BF    dd          005EB463
 005EB3BF    dd          005EB45D
 005EB3BF    dd          005EB457
 005EB3BF    dd          005EB451
 005EB3BF    dd          005EB44B
 005EB3BF    dd          005EB4AB
 005EB3BF    dd          005EB43F
 005EB3BF    dd          005EB439
 005EB3BF    dd          005EB433
 005EB3BF    dd          005EB42C
 005EB3BF    dd          005EB430
 005EB3BF    dd          005EB426
 005EB426    mov         eax,0FFFFFFFE
 005EB42B    ret
 005EB42C    or          eax,0FFFFFFFF
 005EB42F    ret
 005EB430    xor         eax,eax
 005EB432    ret
 005EB433    mov         eax,1
 005EB438    ret
 005EB439    mov         eax,2
 005EB43E    ret
 005EB43F    mov         eax,3
 005EB444    ret
 005EB445    mov         eax,5
 005EB44A    ret
 005EB44B    mov         eax,6
 005EB450    ret
 005EB451    mov         eax,7
 005EB456    ret
 005EB457    mov         eax,8
 005EB45C    ret
 005EB45D    mov         eax,9
 005EB462    ret
 005EB463    mov         eax,0A
 005EB468    ret
 005EB469    mov         eax,0B
 005EB46E    ret
 005EB46F    mov         eax,0C
 005EB474    ret
 005EB475    mov         eax,0D
 005EB47A    ret
 005EB47B    mov         eax,0E
 005EB480    ret
 005EB481    mov         eax,10
 005EB486    ret
 005EB487    mov         eax,11
 005EB48C    ret
 005EB48D    mov         eax,9
 005EB492    ret
 005EB493    mov         eax,7
 005EB498    ret
 005EB499    mov         eax,12
 005EB49E    ret
 005EB49F    mov         eax,13
 005EB4A4    ret
 005EB4A5    mov         eax,14
 005EB4AA    ret
 005EB4AB    mov         eax,63
 005EB4B0    ret
end;*}

//005EB4B4
{*function sub_005EB4B4(?:?):?;
begin
 005EB4B4    add         eax,2
 005EB4B7    cmp         eax,16
>005EB4BA    ja          005EB591
 005EB4C0    jmp         dword ptr [eax*4+5EB4C7]
 005EB4C0    dd          005EB523
 005EB4C0    dd          005EB528
 005EB4C0    dd          005EB52C
 005EB4C0    dd          005EB52F
 005EB4C0    dd          005EB534
 005EB4C0    dd          005EB539
 005EB4C0    dd          005EB53E
 005EB4C0    dd          005EB541
 005EB4C0    dd          005EB546
 005EB4C0    dd          005EB54B
 005EB4C0    dd          005EB550
 005EB4C0    dd          005EB555
 005EB4C0    dd          005EB55A
 005EB4C0    dd          005EB55F
 005EB4C0    dd          005EB564
 005EB4C0    dd          005EB569
 005EB4C0    dd          005EB56E
 005EB4C0    dd          005EB573
 005EB4C0    dd          005EB578
 005EB4C0    dd          005EB57D
 005EB4C0    dd          005EB582
 005EB4C0    dd          005EB587
 005EB4C0    dd          005EB58C
 005EB523    mov         ax,1
 005EB527    ret
 005EB528    or          eax,0FFFFFFFF
 005EB52B    ret
 005EB52C    xor         eax,eax
 005EB52E    ret
 005EB52F    mov         ax,0FFFE
 005EB533    ret
 005EB534    mov         ax,0FFFD
 005EB538    ret
 005EB539    mov         ax,0FFFC
 005EB53D    ret
 005EB53E    xor         eax,eax
 005EB540    ret
 005EB541    mov         ax,0FFEA
 005EB545    ret
 005EB546    mov         ax,0FFFA
 005EB54A    ret
 005EB54B    mov         ax,0FFF9
 005EB54F    ret
 005EB550    mov         ax,0FFF8
 005EB554    ret
 005EB555    mov         ax,0FFF7
 005EB559    ret
 005EB55A    mov         ax,0FFF6
 005EB55E    ret
 005EB55F    mov         ax,0FFF5
 005EB563    ret
 005EB564    mov         ax,0FFF3
 005EB568    ret
 005EB569    mov         ax,0FFED
 005EB56D    ret
 005EB56E    mov         ax,0FFEC
 005EB572    ret
 005EB573    mov         ax,0FFEA
 005EB577    ret
 005EB578    mov         ax,0FFEB
 005EB57C    ret
 005EB57D    mov         ax,0FFF4
 005EB581    ret
 005EB582    mov         ax,0FFF0
 005EB586    ret
 005EB587    mov         ax,0FFEE
 005EB58B    ret
 005EB58C    mov         ax,0FFEF
 005EB590    ret
 005EB591    xor         eax,eax
 005EB593    ret
end;*}

//005EB594
{*function sub_005EB594(?:?):?;
begin
 005EB594    add         eax,2
 005EB597    cmp         eax,16
>005EB59A    ja          005EB693
 005EB5A0    jmp         dword ptr [eax*4+5EB5A7]
 005EB5A0    dd          005EB603
 005EB5A0    dd          005EB615
 005EB5A0    dd          005EB618
 005EB5A0    dd          005EB61B
 005EB5A0    dd          005EB621
 005EB5A0    dd          005EB627
 005EB5A0    dd          005EB62D
 005EB5A0    dd          005EB633
 005EB5A0    dd          005EB639
 005EB5A0    dd          005EB63F
 005EB5A0    dd          005EB645
 005EB5A0    dd          005EB64B
 005EB5A0    dd          005EB651
 005EB5A0    dd          005EB657
 005EB5A0    dd          005EB65D
 005EB5A0    dd          005EB663
 005EB5A0    dd          005EB669
 005EB5A0    dd          005EB66F
 005EB5A0    dd          005EB675
 005EB5A0    dd          005EB67B
 005EB5A0    dd          005EB681
 005EB5A0    dd          005EB687
 005EB5A0    dd          005EB68D
 005EB603    mov         eax,[0078DB00];^Screen:TScreen
 005EB608    mov         eax,dword ptr [eax]
 005EB60A    mov         edx,1
 005EB60F    call        TScreen.GetCursors
 005EB614    ret
 005EB615    xor         eax,eax
 005EB617    ret
 005EB618    xor         eax,eax
 005EB61A    ret
 005EB61B    mov         eax,[00816248];gvar_00816248:HICON
 005EB620    ret
 005EB621    mov         eax,[0081624C];gvar_0081624C:HICON
 005EB626    ret
 005EB627    mov         eax,[00816258];gvar_00816258:HICON
 005EB62C    ret
 005EB62D    mov         eax,[0081625C];gvar_0081625C:HICON
 005EB632    ret
 005EB633    mov         eax,[00816264];gvar_00816264:HICON
 005EB638    ret
 005EB639    mov         eax,[0081626C];gvar_0081626C:HICON
 005EB63E    ret
 005EB63F    mov         eax,[00816270];gvar_00816270:HICON
 005EB644    ret
 005EB645    mov         eax,[00816274];gvar_00816274:HICON
 005EB64A    ret
 005EB64B    mov         eax,[00816278];gvar_00816278:HICON
 005EB650    ret
 005EB651    mov         eax,[0081627C];gvar_0081627C:HICON
 005EB656    ret
 005EB657    mov         eax,[00816280];gvar_00816280:HICON
 005EB65C    ret
 005EB65D    mov         eax,[00816260];gvar_00816260:HICON
 005EB662    ret
 005EB663    mov         eax,[00816244];gvar_00816244:HICON
 005EB668    ret
 005EB669    mov         eax,[00816254];gvar_00816254:HICON
 005EB66E    ret
 005EB66F    mov         eax,[00816268];gvar_00816268:HICON
 005EB674    ret
 005EB675    mov         eax,[00816250];gvar_00816250:HICON
 005EB67A    ret
 005EB67B    mov         eax,[00816284];gvar_00816284
 005EB680    ret
 005EB681    mov         eax,[00816290];gvar_00816290
 005EB686    ret
 005EB687    mov         eax,[00816294];gvar_00816294
 005EB68C    ret
 005EB68D    mov         eax,[00816298];gvar_00816298
 005EB692    ret
 005EB693    xor         eax,eax
 005EB695    ret
end;*}

//005EB698
{*function sub_005EB698(?:UnicodeString):?;
begin
 005EB698    push        ebp
 005EB699    mov         ebp,esp
 005EB69B    push        ecx
 005EB69C    push        ebx
 005EB69D    mov         dword ptr [ebp-4],eax
 005EB6A0    mov         eax,dword ptr [ebp-4]
 005EB6A3    call        @UStrAddRef
 005EB6A8    xor         eax,eax
 005EB6AA    push        ebp
 005EB6AB    push        5EB6DE
 005EB6B0    push        dword ptr fs:[eax]
 005EB6B3    mov         dword ptr fs:[eax],esp
 005EB6B6    mov         eax,[008162A0];gvar_008162A0:TModuleMouse
 005EB6BB    mov         eax,dword ptr [eax+1C]
 005EB6BE    mov         edx,dword ptr [ebp-4]
 005EB6C1    call        THashTable.Get
 005EB6C6    mov         ebx,eax
 005EB6C8    xor         eax,eax
 005EB6CA    pop         edx
 005EB6CB    pop         ecx
 005EB6CC    pop         ecx
 005EB6CD    mov         dword ptr fs:[eax],edx
 005EB6D0    push        5EB6E5
 005EB6D5    lea         eax,[ebp-4]
 005EB6D8    call        @UStrClr
 005EB6DD    ret
>005EB6DE    jmp         @HandleFinally
>005EB6E3    jmp         005EB6D5
 005EB6E5    mov         eax,ebx
 005EB6E7    pop         ebx
 005EB6E8    pop         ecx
 005EB6E9    pop         ebp
 005EB6EA    ret
end;*}

//005EB6EC
{*procedure sub_005EB6EC(?:byte; ?:?);
begin
 005EB6EC    push        ebx
 005EB6ED    push        esi
 005EB6EE    mov         esi,edx
 005EB6F0    mov         ebx,eax
 005EB6F2    mov         ecx,esi
 005EB6F4    mov         eax,[008162A0];gvar_008162A0:TModuleMouse
 005EB6F9    mov         eax,dword ptr [eax+1C]
 005EB6FC    mov         edx,ebx
 005EB6FE    call        THashTable.Get
 005EB703    pop         esi
 005EB704    pop         ebx
 005EB705    ret
end;*}

//005EB708
function TMouseValue.CanSet:Boolean;
begin
{*
 005EB708    mov         al,1
 005EB70A    ret
*}
end;

//005EB70C
constructor TMouseValue.Create;
begin
{*
 005EB70C    test        dl,dl
>005EB70E    je          005EB718
 005EB710    add         esp,0FFFFFFF0
 005EB713    call        @ClassCreate
 005EB718    mov         byte ptr ds:[8161F8],1;gvar_008161F8
 005EB71F    test        dl,dl
>005EB721    je          005EB732
 005EB723    call        @AfterConstruction
 005EB728    pop         dword ptr fs:[0]
 005EB72F    add         esp,0C
 005EB732    ret
*}
end;

//005EB734
procedure TMouseValue.CreateClone;
begin
{*
 005EB734    mov         dl,1
 005EB736    mov         eax,[005E9DA0];TMouseValue
 005EB73B    call        TMouseValue.Create;TMouseValue.Create
 005EB740    ret
*}
end;

//005EB744
procedure TMouseValue.FillClone(c:TExpression);
begin
{*
 005EB744    push        ebx
 005EB745    push        esi
 005EB746    mov         esi,edx
 005EB748    mov         ebx,eax
 005EB74A    mov         edx,esi
 005EB74C    mov         eax,ebx
 005EB74E    call        TExpression.FillClone
 005EB753    mov         eax,esi
 005EB755    mov         edx,dword ptr [ebx+18];TMouseValue.........................................................
 005EB758    mov         dword ptr [eax+18],edx
 005EB75B    movzx       edx,byte ptr [ebx+20];TMouseValue.....................................Item:byte
 005EB75F    mov         byte ptr [eax+20],dl
 005EB762    pop         esi
 005EB763    pop         ebx
 005EB764    ret
*}
end;

//005EB768
function TMouseValue.GetDataType:TDataType;
begin
{*
 005EB768    movzx       eax,byte ptr [eax+20];TMouseValue......................................Item:byte
 005EB76C    cmp         eax,33
>005EB76F    ja          005EB816
 005EB775    movzx       eax,byte ptr [eax+5EB783]
 005EB77C    jmp         dword ptr [eax*4+5EB7B7]
 005EB77C    db          0
 005EB77C    db          1
 005EB77C    db          1
 005EB77C    db          1
 005EB77C    db          1
 005EB77C    db          1
 005EB77C    db          0
 005EB77C    db          0
 005EB77C    db          2
 005EB77C    db          2
 005EB77C    db          0
 005EB77C    db          0
 005EB77C    db          2
 005EB77C    db          2
 005EB77C    db          1
 005EB77C    db          1
 005EB77C    db          1
 005EB77C    db          3
 005EB77C    db          3
 005EB77C    db          4
 005EB77C    db          5
 005EB77C    db          6
 005EB77C    db          7
 005EB77C    db          8
 005EB77C    db          9
 005EB77C    db          10
 005EB77C    db          11
 005EB77C    db          12
 005EB77C    db          2
 005EB77C    db          13
 005EB77C    db          13
 005EB77C    db          13
 005EB77C    db          13
 005EB77C    db          13
 005EB77C    db          3
 005EB77C    db          2
 005EB77C    db          0
 005EB77C    db          0
 005EB77C    db          1
 005EB77C    db          1
 005EB77C    db          1
 005EB77C    db          1
 005EB77C    db          0
 005EB77C    db          0
 005EB77C    db          0
 005EB77C    db          0
 005EB77C    db          0
 005EB77C    db          0
 005EB77C    db          0
 005EB77C    db          0
 005EB77C    db          13
 005EB77C    db          13
 005EB77C    dd          005EB816
 005EB77C    dd          005EB7EF
 005EB77C    dd          005EB7F2
 005EB77C    dd          005EB7F5
 005EB77C    dd          005EB7F8
 005EB77C    dd          005EB7FB
 005EB77C    dd          005EB7FE
 005EB77C    dd          005EB801
 005EB77C    dd          005EB804
 005EB77C    dd          005EB807
 005EB77C    dd          005EB80A
 005EB77C    dd          005EB80D
 005EB77C    dd          005EB810
 005EB77C    dd          005EB813
 005EB7EF    mov         al,3
 005EB7F1    ret
 005EB7F2    xor         eax,eax
 005EB7F4    ret
 005EB7F5    mov         al,2
 005EB7F7    ret
 005EB7F8    xor         eax,eax
 005EB7FA    ret
 005EB7FB    mov         al,3
 005EB7FD    ret
 005EB7FE    mov         al,3
 005EB800    ret
 005EB801    mov         al,3
 005EB803    ret
 005EB804    xor         eax,eax
 005EB806    ret
 005EB807    mov         al,2
 005EB809    ret
 005EB80A    mov         al,3
 005EB80C    ret
 005EB80D    mov         al,2
 005EB80F    ret
 005EB810    mov         al,2
 005EB812    ret
 005EB813    mov         al,5
 005EB815    ret
 005EB816    xor         eax,eax
 005EB818    ret
*}
end;

//005EB81C
function TMouseValue.GetUnits:TUnits;
begin
{*
 005EB81C    movzx       eax,byte ptr [eax+20];TMouseValue.......................................Item:byte
 005EB820    cmp         eax,1D
>005EB823    jg          005EB83E
>005EB825    je          005EB853
 005EB827    add         eax,0FFFFFFF4
 005EB82A    sub         eax,2
>005EB82D    jb          005EB856
 005EB82F    add         eax,0FFFFFFFD
 005EB832    sub         eax,2
>005EB835    jb          005EB853
 005EB837    sub         eax,4
>005EB83A    je          005EB850
>005EB83C    jmp         005EB859
 005EB83E    add         eax,0FFFFFFE0
 005EB841    sub         eax,2
>005EB844    jb          005EB856
 005EB846    add         eax,0FFFFFFF8
 005EB849    sub         eax,0A
>005EB84C    jb          005EB856
>005EB84E    jmp         005EB859
 005EB850    mov         al,11
 005EB852    ret
 005EB853    mov         al,0C
 005EB855    ret
 005EB856    mov         al,0D
 005EB858    ret
 005EB859    xor         eax,eax
 005EB85B    ret
*}
end;

//005EB85C
procedure TMouseValue.GetValue;
begin
{*
 005EB85C    push        ebx
 005EB85D    add         esp,0FFFFFFA8
 005EB860    mov         ebx,eax
 005EB862    mov         eax,ebx
 005EB864    mov         edx,dword ptr [eax]
 005EB866    call        dword ptr [edx+44];TMouseValue.GetDataType
 005EB869    cmp         al,5
>005EB86B    jne         005EB8A7
 005EB86D    lea         eax,[esp+20]
 005EB871    push        eax
 005EB872    lea         ecx,[esp+1C]
 005EB876    lea         edx,[esp+14]
 005EB87A    mov         eax,ebx
 005EB87C    mov         ebx,dword ptr [eax]
 005EB87E    call        dword ptr [ebx+3C];TMouseValue.GetVector
 005EB881    push        dword ptr [esp+14]
 005EB885    push        dword ptr [esp+14]
 005EB889    push        dword ptr [esp+24]
 005EB88D    push        dword ptr [esp+24]
 005EB891    push        dword ptr [esp+34]
 005EB895    push        dword ptr [esp+34]
 005EB899    call        005C4070
 005EB89E    fstp        qword ptr [esp]
 005EB8A1    wait
>005EB8A2    jmp         005EC418
 005EB8A7    movzx       eax,byte ptr [ebx+20];TMouseValue........................................Item:byte
 005EB8AB    cmp         eax,31
>005EB8AE    ja          005EC40F
 005EB8B4    jmp         dword ptr [eax*4+5EB8BB]
 005EB8B4    dd          005EC40F
 005EB8B4    dd          005EBA19
 005EB8B4    dd          005EBA79
 005EB8B4    dd          005EBAD9
 005EB8B4    dd          005EBB39
 005EB8B4    dd          005EBB99
 005EB8B4    dd          005EBD19
 005EB8B4    dd          005EBD67
 005EB8B4    dd          005EBE51
 005EB8B4    dd          005EBE7F
 005EB8B4    dd          005EBEAD
 005EB8B4    dd          005EBEFA
 005EB8B4    dd          005EC0F7
 005EB8B4    dd          005EC14B
 005EB8B4    dd          005EBBF9
 005EB8B4    dd          005EBC59
 005EB8B4    dd          005EBCB9
 005EB8B4    dd          005EC247
 005EB8B4    dd          005EC25E
 005EB8B4    dd          005EC275
 005EB8B4    dd          005EC288
 005EB8B4    dd          005EC2C1
 005EB8B4    dd          005EC2DA
 005EB8B4    dd          005EC354
 005EB8B4    dd          005EC376
 005EB8B4    dd          005EC39F
 005EB8B4    dd          005EC3C7
 005EB8B4    dd          005EC3F1
 005EB8B4    dd          005EC19F
 005EB8B4    dd          005EC40F
 005EB8B4    dd          005EC40F
 005EB8B4    dd          005EC40F
 005EB8B4    dd          005EC40F
 005EB8B4    dd          005EC40F
 005EB8B4    dd          005EB9D7
 005EB8B4    dd          005EC1F3
 005EB8B4    dd          005EBDB5
 005EB8B4    dd          005EBE03
 005EB8B4    dd          005EB983
 005EB8B4    dd          005EB998
 005EB8B4    dd          005EB9AD
 005EB8B4    dd          005EB9C2
 005EB8B4    dd          005EBF47
 005EB8B4    dd          005EBF5F
 005EB8B4    dd          005EBF77
 005EB8B4    dd          005EBF8F
 005EB8B4    dd          005EBFA7
 005EB8B4    dd          005EBFFB
 005EB8B4    dd          005EC04F
 005EB8B4    dd          005EC0A3
 005EB983    movzx       eax,byte ptr ds:[816240];gvar_00816240:Boolean
 005EB98A    call        00686074
 005EB98F    fstp        qword ptr [esp]
 005EB992    wait
>005EB993    jmp         005EC418
 005EB998    movzx       eax,byte ptr ds:[816243];gvar_00816243:Boolean
 005EB99F    call        00686074
 005EB9A4    fstp        qword ptr [esp]
 005EB9A7    wait
>005EB9A8    jmp         005EC418
 005EB9AD    movzx       eax,byte ptr ds:[816241];gvar_00816241:Boolean
 005EB9B4    call        00686074
 005EB9B9    fstp        qword ptr [esp]
 005EB9BC    wait
>005EB9BD    jmp         005EC418
 005EB9C2    movzx       eax,byte ptr ds:[816242];gvar_00816242:Boolean
 005EB9C9    call        00686074
 005EB9CE    fstp        qword ptr [esp]
 005EB9D1    wait
>005EB9D2    jmp         005EC418
 005EB9D7    mov         eax,[0078D89C];^gvar_008177F0
 005EB9DC    cmp         dword ptr [eax],1
>005EB9DF    jg          005EBA00
 005EB9E1    mov         eax,[0078DA48];^Mouse:TMouse
 005EB9E6    mov         eax,dword ptr [eax]
 005EB9E8    movzx       eax,byte ptr [eax+0C];TMouse.FMousePresent:Boolean
 005EB9EC    movsx       eax,al
 005EB9EF    mov         dword ptr [esp+3C],eax
 005EB9F3    fild        dword ptr [esp+3C]
 005EB9F7    fstp        qword ptr [esp]
 005EB9FA    wait
>005EB9FB    jmp         005EC418
 005EBA00    mov         eax,[0078D89C];^gvar_008177F0
 005EBA05    mov         eax,dword ptr [eax]
 005EBA07    dec         eax
 005EBA08    mov         dword ptr [esp+3C],eax
 005EBA0C    fild        dword ptr [esp+3C]
 005EBA10    fstp        qword ptr [esp]
 005EBA13    wait
>005EBA14    jmp         005EC418
 005EBA19    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EBA1C    test        eax,eax
>005EBA1E    jge         005EBA38
 005EBA20    test        byte ptr ds:[8162B0],80;gvar_008162B0
 005EBA27    seta        al
 005EBA2A    call        00686074
 005EBA2F    fstp        qword ptr [esp]
 005EBA32    wait
>005EBA33    jmp         005EC418
 005EBA38    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EBA3E    cmp         eax,dword ptr [edx]
>005EBA40    jl          005EBA50
 005EBA42    xor         eax,eax
 005EBA44    mov         dword ptr [esp],eax
 005EBA47    mov         dword ptr [esp+4],eax
>005EBA4B    jmp         005EC418
 005EBA50    mov         edx,eax
 005EBA52    add         eax,eax
 005EBA54    add         eax,eax
 005EBA56    add         eax,eax
 005EBA58    sub         eax,edx
 005EBA5A    mov         edx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EBA60    test        dword ptr [edx+eax*4+14],1
 005EBA68    seta        al
 005EBA6B    call        00686074
 005EBA70    fstp        qword ptr [esp]
 005EBA73    wait
>005EBA74    jmp         005EC418
 005EBA79    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EBA7C    test        eax,eax
>005EBA7E    jge         005EBA98
 005EBA80    test        byte ptr ds:[8162B1],80;gvar_008162B1
 005EBA87    seta        al
 005EBA8A    call        00686074
 005EBA8F    fstp        qword ptr [esp]
 005EBA92    wait
>005EBA93    jmp         005EC418
 005EBA98    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EBA9E    cmp         eax,dword ptr [edx]
>005EBAA0    jl          005EBAB0
 005EBAA2    xor         eax,eax
 005EBAA4    mov         dword ptr [esp],eax
 005EBAA7    mov         dword ptr [esp+4],eax
>005EBAAB    jmp         005EC418
 005EBAB0    mov         edx,eax
 005EBAB2    add         eax,eax
 005EBAB4    add         eax,eax
 005EBAB6    add         eax,eax
 005EBAB8    sub         eax,edx
 005EBABA    mov         edx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EBAC0    test        dword ptr [edx+eax*4+14],2
 005EBAC8    seta        al
 005EBACB    call        00686074
 005EBAD0    fstp        qword ptr [esp]
 005EBAD3    wait
>005EBAD4    jmp         005EC418
 005EBAD9    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EBADC    test        eax,eax
>005EBADE    jge         005EBAF8
 005EBAE0    test        byte ptr ds:[8162B2],80;gvar_008162B2
 005EBAE7    seta        al
 005EBAEA    call        00686074
 005EBAEF    fstp        qword ptr [esp]
 005EBAF2    wait
>005EBAF3    jmp         005EC418
 005EBAF8    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EBAFE    cmp         eax,dword ptr [edx]
>005EBB00    jl          005EBB10
 005EBB02    xor         eax,eax
 005EBB04    mov         dword ptr [esp],eax
 005EBB07    mov         dword ptr [esp+4],eax
>005EBB0B    jmp         005EC418
 005EBB10    mov         edx,eax
 005EBB12    add         eax,eax
 005EBB14    add         eax,eax
 005EBB16    add         eax,eax
 005EBB18    sub         eax,edx
 005EBB1A    mov         edx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EBB20    test        dword ptr [edx+eax*4+14],4
 005EBB28    seta        al
 005EBB2B    call        00686074
 005EBB30    fstp        qword ptr [esp]
 005EBB33    wait
>005EBB34    jmp         005EC418
 005EBB39    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EBB3C    test        eax,eax
>005EBB3E    jge         005EBB58
 005EBB40    test        byte ptr ds:[8162B3],80;gvar_008162B3
 005EBB47    seta        al
 005EBB4A    call        00686074
 005EBB4F    fstp        qword ptr [esp]
 005EBB52    wait
>005EBB53    jmp         005EC418
 005EBB58    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EBB5E    cmp         eax,dword ptr [edx]
>005EBB60    jl          005EBB70
 005EBB62    xor         eax,eax
 005EBB64    mov         dword ptr [esp],eax
 005EBB67    mov         dword ptr [esp+4],eax
>005EBB6B    jmp         005EC418
 005EBB70    mov         edx,eax
 005EBB72    add         eax,eax
 005EBB74    add         eax,eax
 005EBB76    add         eax,eax
 005EBB78    sub         eax,edx
 005EBB7A    mov         edx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EBB80    test        dword ptr [edx+eax*4+14],8
 005EBB88    seta        al
 005EBB8B    call        00686074
 005EBB90    fstp        qword ptr [esp]
 005EBB93    wait
>005EBB94    jmp         005EC418
 005EBB99    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EBB9C    test        eax,eax
>005EBB9E    jge         005EBBB8
 005EBBA0    test        byte ptr ds:[8162B4],80;gvar_008162B4
 005EBBA7    seta        al
 005EBBAA    call        00686074
 005EBBAF    fstp        qword ptr [esp]
 005EBBB2    wait
>005EBBB3    jmp         005EC418
 005EBBB8    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EBBBE    cmp         eax,dword ptr [edx]
>005EBBC0    jl          005EBBD0
 005EBBC2    xor         eax,eax
 005EBBC4    mov         dword ptr [esp],eax
 005EBBC7    mov         dword ptr [esp+4],eax
>005EBBCB    jmp         005EC418
 005EBBD0    mov         edx,eax
 005EBBD2    add         eax,eax
 005EBBD4    add         eax,eax
 005EBBD6    add         eax,eax
 005EBBD8    sub         eax,edx
 005EBBDA    mov         edx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EBBE0    test        dword ptr [edx+eax*4+14],10
 005EBBE8    seta        al
 005EBBEB    call        00686074
 005EBBF0    fstp        qword ptr [esp]
 005EBBF3    wait
>005EBBF4    jmp         005EC418
 005EBBF9    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EBBFC    test        eax,eax
>005EBBFE    jge         005EBC18
 005EBC00    test        byte ptr ds:[8162B5],80;gvar_008162B5
 005EBC07    seta        al
 005EBC0A    call        00686074
 005EBC0F    fstp        qword ptr [esp]
 005EBC12    wait
>005EBC13    jmp         005EC418
 005EBC18    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EBC1E    cmp         eax,dword ptr [edx]
>005EBC20    jl          005EBC30
 005EBC22    xor         eax,eax
 005EBC24    mov         dword ptr [esp],eax
 005EBC27    mov         dword ptr [esp+4],eax
>005EBC2B    jmp         005EC418
 005EBC30    mov         edx,eax
 005EBC32    add         eax,eax
 005EBC34    add         eax,eax
 005EBC36    add         eax,eax
 005EBC38    sub         eax,edx
 005EBC3A    mov         edx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EBC40    test        dword ptr [edx+eax*4+14],20
 005EBC48    seta        al
 005EBC4B    call        00686074
 005EBC50    fstp        qword ptr [esp]
 005EBC53    wait
>005EBC54    jmp         005EC418
 005EBC59    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EBC5C    test        eax,eax
>005EBC5E    jge         005EBC78
 005EBC60    test        byte ptr ds:[8162B6],80;gvar_008162B6
 005EBC67    seta        al
 005EBC6A    call        00686074
 005EBC6F    fstp        qword ptr [esp]
 005EBC72    wait
>005EBC73    jmp         005EC418
 005EBC78    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EBC7E    cmp         eax,dword ptr [edx]
>005EBC80    jl          005EBC90
 005EBC82    xor         eax,eax
 005EBC84    mov         dword ptr [esp],eax
 005EBC87    mov         dword ptr [esp+4],eax
>005EBC8B    jmp         005EC418
 005EBC90    mov         edx,eax
 005EBC92    add         eax,eax
 005EBC94    add         eax,eax
 005EBC96    add         eax,eax
 005EBC98    sub         eax,edx
 005EBC9A    mov         edx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EBCA0    test        dword ptr [edx+eax*4+14],40
 005EBCA8    seta        al
 005EBCAB    call        00686074
 005EBCB0    fstp        qword ptr [esp]
 005EBCB3    wait
>005EBCB4    jmp         005EC418
 005EBCB9    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EBCBC    test        eax,eax
>005EBCBE    jge         005EBCD8
 005EBCC0    test        byte ptr ds:[8162B7],80;gvar_008162B7
 005EBCC7    seta        al
 005EBCCA    call        00686074
 005EBCCF    fstp        qword ptr [esp]
 005EBCD2    wait
>005EBCD3    jmp         005EC418
 005EBCD8    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EBCDE    cmp         eax,dword ptr [edx]
>005EBCE0    jl          005EBCF0
 005EBCE2    xor         eax,eax
 005EBCE4    mov         dword ptr [esp],eax
 005EBCE7    mov         dword ptr [esp+4],eax
>005EBCEB    jmp         005EC418
 005EBCF0    mov         edx,eax
 005EBCF2    add         eax,eax
 005EBCF4    add         eax,eax
 005EBCF6    add         eax,eax
 005EBCF8    sub         eax,edx
 005EBCFA    mov         edx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EBD00    test        dword ptr [edx+eax*4+14],80
 005EBD08    seta        al
 005EBD0B    call        00686074
 005EBD10    fstp        qword ptr [esp]
 005EBD13    wait
>005EBD14    jmp         005EC418
 005EBD19    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EBD1C    test        eax,eax
>005EBD1E    jge         005EBD41
 005EBD20    fild        dword ptr ds:[8162BC];gvar_008162BC:Single
 005EBD26    fcomp       qword ptr ds:[78BC68];gvar_0078BC68:Double
 005EBD2C    wait
 005EBD2D    fnstsw      al
 005EBD2F    sahf
 005EBD30    setb        al
 005EBD33    call        00686074
 005EBD38    fstp        qword ptr [esp]
 005EBD3B    wait
>005EBD3C    jmp         005EC418
 005EBD41    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EBD47    cmp         eax,dword ptr [edx]
>005EBD49    jl          005EBD59
 005EBD4B    xor         eax,eax
 005EBD4D    mov         dword ptr [esp],eax
 005EBD50    mov         dword ptr [esp+4],eax
>005EBD54    jmp         005EC418
 005EBD59    xor         eax,eax
 005EBD5B    mov         dword ptr [esp],eax
 005EBD5E    mov         dword ptr [esp+4],eax
>005EBD62    jmp         005EC418
 005EBD67    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EBD6A    test        eax,eax
>005EBD6C    jge         005EBD8F
 005EBD6E    fild        dword ptr ds:[8162BC];gvar_008162BC:Single
 005EBD74    fcomp       qword ptr ds:[78BC68];gvar_0078BC68:Double
 005EBD7A    wait
 005EBD7B    fnstsw      al
 005EBD7D    sahf
 005EBD7E    seta        al
 005EBD81    call        00686074
 005EBD86    fstp        qword ptr [esp]
 005EBD89    wait
>005EBD8A    jmp         005EC418
 005EBD8F    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EBD95    cmp         eax,dword ptr [edx]
>005EBD97    jl          005EBDA7
 005EBD99    xor         eax,eax
 005EBD9B    mov         dword ptr [esp],eax
 005EBD9E    mov         dword ptr [esp+4],eax
>005EBDA2    jmp         005EC418
 005EBDA7    xor         eax,eax
 005EBDA9    mov         dword ptr [esp],eax
 005EBDAC    mov         dword ptr [esp+4],eax
>005EBDB0    jmp         005EC418
 005EBDB5    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EBDB8    test        eax,eax
>005EBDBA    jge         005EBDDD
 005EBDBC    fild        dword ptr ds:[8162B8];gvar_008162B8:Single
 005EBDC2    fcomp       qword ptr ds:[78BC70];gvar_0078BC70:Double
 005EBDC8    wait
 005EBDC9    fnstsw      al
 005EBDCB    sahf
 005EBDCC    seta        al
 005EBDCF    call        00686074
 005EBDD4    fstp        qword ptr [esp]
 005EBDD7    wait
>005EBDD8    jmp         005EC418
 005EBDDD    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EBDE3    cmp         eax,dword ptr [edx]
>005EBDE5    jl          005EBDF5
 005EBDE7    xor         eax,eax
 005EBDE9    mov         dword ptr [esp],eax
 005EBDEC    mov         dword ptr [esp+4],eax
>005EBDF0    jmp         005EC418
 005EBDF5    xor         eax,eax
 005EBDF7    mov         dword ptr [esp],eax
 005EBDFA    mov         dword ptr [esp+4],eax
>005EBDFE    jmp         005EC418
 005EBE03    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EBE06    test        eax,eax
>005EBE08    jge         005EBE2B
 005EBE0A    fild        dword ptr ds:[8162B8];gvar_008162B8:Single
 005EBE10    fcomp       qword ptr ds:[78BC70];gvar_0078BC70:Double
 005EBE16    wait
 005EBE17    fnstsw      al
 005EBE19    sahf
 005EBE1A    setb        al
 005EBE1D    call        00686074
 005EBE22    fstp        qword ptr [esp]
 005EBE25    wait
>005EBE26    jmp         005EC418
 005EBE2B    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EBE31    cmp         eax,dword ptr [edx]
>005EBE33    jl          005EBE43
 005EBE35    xor         eax,eax
 005EBE37    mov         dword ptr [esp],eax
 005EBE3A    mov         dword ptr [esp+4],eax
>005EBE3E    jmp         005EC418
 005EBE43    xor         eax,eax
 005EBE45    mov         dword ptr [esp],eax
 005EBE48    mov         dword ptr [esp+4],eax
>005EBE4C    jmp         005EC418
 005EBE51    lea         eax,[esp+8]
 005EBE55    push        eax
 005EBE56    call        user32.GetCursorPos
 005EBE5B    mov         eax,[0078DB00];^Screen:TScreen
 005EBE60    mov         eax,dword ptr [eax]
 005EBE62    call        TScreen.GetWidth
 005EBE67    dec         eax
 005EBE68    mov         dword ptr [esp+3C],eax
 005EBE6C    fild        dword ptr [esp+3C]
 005EBE70    fild        dword ptr [esp+8]
 005EBE74    fdivrp      st(1),st
 005EBE76    fstp        qword ptr [esp]
 005EBE79    wait
>005EBE7A    jmp         005EC418
 005EBE7F    lea         eax,[esp+8]
 005EBE83    push        eax
 005EBE84    call        user32.GetCursorPos
 005EBE89    mov         eax,[0078DB00];^Screen:TScreen
 005EBE8E    mov         eax,dword ptr [eax]
 005EBE90    call        TScreen.GetHeight
 005EBE95    dec         eax
 005EBE96    mov         dword ptr [esp+3C],eax
 005EBE9A    fild        dword ptr [esp+3C]
 005EBE9E    fild        dword ptr [esp+0C]
 005EBEA2    fdivrp      st(1),st
 005EBEA4    fstp        qword ptr [esp]
 005EBEA7    wait
>005EBEA8    jmp         005EC418
 005EBEAD    lea         eax,[esp+8]
 005EBEB1    push        eax
 005EBEB2    call        user32.GetCursorPos
 005EBEB7    mov         eax,[0078DB00];^Screen:TScreen
 005EBEBC    mov         eax,dword ptr [eax]
 005EBEBE    call        TScreen.GetDesktopLeft
 005EBEC3    mov         edx,dword ptr [esp+8]
 005EBEC7    sub         edx,eax
 005EBEC9    mov         dword ptr [esp+3C],edx
 005EBECD    fild        dword ptr [esp+3C]
 005EBED1    fstp        tbyte ptr [esp+40]
 005EBED5    wait
 005EBED6    mov         eax,[0078DB00];^Screen:TScreen
 005EBEDB    mov         eax,dword ptr [eax]
 005EBEDD    call        TScreen.GetDesktopWidth
 005EBEE2    dec         eax
 005EBEE3    mov         dword ptr [esp+4C],eax
 005EBEE7    fild        dword ptr [esp+4C]
 005EBEEB    fld         tbyte ptr [esp+40]
 005EBEEF    fdivrp      st(1),st
 005EBEF1    fstp        qword ptr [esp]
 005EBEF4    wait
>005EBEF5    jmp         005EC418
 005EBEFA    lea         eax,[esp+8]
 005EBEFE    push        eax
 005EBEFF    call        user32.GetCursorPos
 005EBF04    mov         eax,[0078DB00];^Screen:TScreen
 005EBF09    mov         eax,dword ptr [eax]
 005EBF0B    call        TScreen.GetDesktopTop
 005EBF10    mov         edx,dword ptr [esp+0C]
 005EBF14    sub         edx,eax
 005EBF16    mov         dword ptr [esp+3C],edx
 005EBF1A    fild        dword ptr [esp+3C]
 005EBF1E    fstp        tbyte ptr [esp+40]
 005EBF22    wait
 005EBF23    mov         eax,[0078DB00];^Screen:TScreen
 005EBF28    mov         eax,dword ptr [eax]
 005EBF2A    call        TScreen.GetDesktopHeight
 005EBF2F    dec         eax
 005EBF30    mov         dword ptr [esp+4C],eax
 005EBF34    fild        dword ptr [esp+4C]
 005EBF38    fld         tbyte ptr [esp+40]
 005EBF3C    fdivrp      st(1),st
 005EBF3E    fstp        qword ptr [esp]
 005EBF41    wait
>005EBF42    jmp         005EC418
 005EBF47    mov         eax,dword ptr ds:[78BC98];0x0 gvar_0078BC98:Double
 005EBF4D    mov         dword ptr [esp],eax
 005EBF50    mov         eax,dword ptr ds:[78BC9C];0x0 gvar_0078BC9C
 005EBF56    mov         dword ptr [esp+4],eax
>005EBF5A    jmp         005EC418
 005EBF5F    mov         eax,dword ptr ds:[78BCA0];0x0 gvar_0078BCA0:Double
 005EBF65    mov         dword ptr [esp],eax
 005EBF68    mov         eax,dword ptr ds:[78BCA4];0x0 gvar_0078BCA4
 005EBF6E    mov         dword ptr [esp+4],eax
>005EBF72    jmp         005EC418
 005EBF77    mov         eax,dword ptr ds:[78BCA8];0x0 gvar_0078BCA8:Double
 005EBF7D    mov         dword ptr [esp],eax
 005EBF80    mov         eax,dword ptr ds:[78BCAC];0x0 gvar_0078BCAC
 005EBF86    mov         dword ptr [esp+4],eax
>005EBF8A    jmp         005EC418
 005EBF8F    mov         eax,dword ptr ds:[78BCB0];0x0 gvar_0078BCB0:Double
 005EBF95    mov         dword ptr [esp],eax
 005EBF98    mov         eax,dword ptr ds:[78BCB4];0x0 gvar_0078BCB4
 005EBF9E    mov         dword ptr [esp+4],eax
>005EBFA2    jmp         005EC418
 005EBFA7    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EBFAA    test        eax,eax
>005EBFAC    jge         005EBFC6
 005EBFAE    mov         eax,dword ptr ds:[78BC78];0x0 gvar_0078BC78:Double
 005EBFB4    mov         dword ptr [esp],eax
 005EBFB7    mov         eax,dword ptr ds:[78BC7C];0x0 gvar_0078BC7C
 005EBFBD    mov         dword ptr [esp+4],eax
>005EBFC1    jmp         005EC418
 005EBFC6    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EBFCC    cmp         eax,dword ptr [edx]
>005EBFCE    jl          005EBFDE
 005EBFD0    xor         eax,eax
 005EBFD2    mov         dword ptr [esp],eax
 005EBFD5    mov         dword ptr [esp+4],eax
>005EBFD9    jmp         005EC418
 005EBFDE    mov         edx,eax
 005EBFE0    add         eax,eax
 005EBFE2    add         eax,eax
 005EBFE4    add         eax,eax
 005EBFE6    sub         eax,edx
 005EBFE8    mov         edx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EBFEE    fild        dword ptr [edx+eax*4+4]
 005EBFF2    fstp        qword ptr [esp]
 005EBFF5    wait
>005EBFF6    jmp         005EC418
 005EBFFB    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EBFFE    test        eax,eax
>005EC000    jge         005EC01A
 005EC002    mov         eax,dword ptr ds:[78BC80];0x0 gvar_0078BC80:Double
 005EC008    mov         dword ptr [esp],eax
 005EC00B    mov         eax,dword ptr ds:[78BC84];0x0 gvar_0078BC84
 005EC011    mov         dword ptr [esp+4],eax
>005EC015    jmp         005EC418
 005EC01A    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EC020    cmp         eax,dword ptr [edx]
>005EC022    jl          005EC032
 005EC024    xor         eax,eax
 005EC026    mov         dword ptr [esp],eax
 005EC029    mov         dword ptr [esp+4],eax
>005EC02D    jmp         005EC418
 005EC032    mov         edx,eax
 005EC034    add         eax,eax
 005EC036    add         eax,eax
 005EC038    add         eax,eax
 005EC03A    sub         eax,edx
 005EC03C    mov         edx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EC042    fild        dword ptr [edx+eax*4+8]
 005EC046    fstp        qword ptr [esp]
 005EC049    wait
>005EC04A    jmp         005EC418
 005EC04F    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EC052    test        eax,eax
>005EC054    jge         005EC06E
 005EC056    mov         eax,dword ptr ds:[78BC88];0x0 gvar_0078BC88:Double
 005EC05C    mov         dword ptr [esp],eax
 005EC05F    mov         eax,dword ptr ds:[78BC8C];0x0 gvar_0078BC8C
 005EC065    mov         dword ptr [esp+4],eax
>005EC069    jmp         005EC418
 005EC06E    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EC074    cmp         eax,dword ptr [edx]
>005EC076    jl          005EC086
 005EC078    xor         eax,eax
 005EC07A    mov         dword ptr [esp],eax
 005EC07D    mov         dword ptr [esp+4],eax
>005EC081    jmp         005EC418
 005EC086    mov         edx,eax
 005EC088    add         eax,eax
 005EC08A    add         eax,eax
 005EC08C    add         eax,eax
 005EC08E    sub         eax,edx
 005EC090    mov         edx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EC096    fild        dword ptr [edx+eax*4+0C]
 005EC09A    fstp        qword ptr [esp]
 005EC09D    wait
>005EC09E    jmp         005EC418
 005EC0A3    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EC0A6    test        eax,eax
>005EC0A8    jge         005EC0C2
 005EC0AA    mov         eax,dword ptr ds:[78BC90];0x0 gvar_0078BC90:Double
 005EC0B0    mov         dword ptr [esp],eax
 005EC0B3    mov         eax,dword ptr ds:[78BC94];0x0 gvar_0078BC94
 005EC0B9    mov         dword ptr [esp+4],eax
>005EC0BD    jmp         005EC418
 005EC0C2    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EC0C8    cmp         eax,dword ptr [edx]
>005EC0CA    jl          005EC0DA
 005EC0CC    xor         eax,eax
 005EC0CE    mov         dword ptr [esp],eax
 005EC0D1    mov         dword ptr [esp+4],eax
>005EC0D5    jmp         005EC418
 005EC0DA    mov         edx,eax
 005EC0DC    add         eax,eax
 005EC0DE    add         eax,eax
 005EC0E0    add         eax,eax
 005EC0E2    sub         eax,edx
 005EC0E4    mov         edx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EC0EA    fild        dword ptr [edx+eax*4+10]
 005EC0EE    fstp        qword ptr [esp]
 005EC0F1    wait
>005EC0F2    jmp         005EC418
 005EC0F7    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EC0FA    test        eax,eax
>005EC0FC    jge         005EC116
 005EC0FE    mov         eax,dword ptr ds:[78BC58];0x0 gvar_0078BC58:Double
 005EC104    mov         dword ptr [esp],eax
 005EC107    mov         eax,dword ptr ds:[78BC5C];0x0 gvar_0078BC5C
 005EC10D    mov         dword ptr [esp+4],eax
>005EC111    jmp         005EC418
 005EC116    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EC11C    cmp         eax,dword ptr [edx]
>005EC11E    jl          005EC12E
 005EC120    xor         eax,eax
 005EC122    mov         dword ptr [esp],eax
 005EC125    mov         dword ptr [esp+4],eax
>005EC129    jmp         005EC418
 005EC12E    mov         edx,eax
 005EC130    add         eax,eax
 005EC132    add         eax,eax
 005EC134    add         eax,eax
 005EC136    sub         eax,edx
 005EC138    mov         edx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EC13E    fild        dword ptr [edx+eax*4+4]
 005EC142    fstp        qword ptr [esp]
 005EC145    wait
>005EC146    jmp         005EC418
 005EC14B    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EC14E    test        eax,eax
>005EC150    jge         005EC16A
 005EC152    mov         eax,dword ptr ds:[78BC60];0x0 gvar_0078BC60:Double
 005EC158    mov         dword ptr [esp],eax
 005EC15B    mov         eax,dword ptr ds:[78BC64];0x0 gvar_0078BC64
 005EC161    mov         dword ptr [esp+4],eax
>005EC165    jmp         005EC418
 005EC16A    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EC170    cmp         eax,dword ptr [edx]
>005EC172    jl          005EC182
 005EC174    xor         eax,eax
 005EC176    mov         dword ptr [esp],eax
 005EC179    mov         dword ptr [esp+4],eax
>005EC17D    jmp         005EC418
 005EC182    mov         edx,eax
 005EC184    add         eax,eax
 005EC186    add         eax,eax
 005EC188    add         eax,eax
 005EC18A    sub         eax,edx
 005EC18C    mov         edx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EC192    fild        dword ptr [edx+eax*4+8]
 005EC196    fstp        qword ptr [esp]
 005EC199    wait
>005EC19A    jmp         005EC418
 005EC19F    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EC1A2    test        eax,eax
>005EC1A4    jge         005EC1BE
 005EC1A6    mov         eax,dword ptr ds:[78BC68];0x0 gvar_0078BC68:Double
 005EC1AC    mov         dword ptr [esp],eax
 005EC1AF    mov         eax,dword ptr ds:[78BC6C];0x0 gvar_0078BC6C
 005EC1B5    mov         dword ptr [esp+4],eax
>005EC1B9    jmp         005EC418
 005EC1BE    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EC1C4    cmp         eax,dword ptr [edx]
>005EC1C6    jl          005EC1D6
 005EC1C8    xor         eax,eax
 005EC1CA    mov         dword ptr [esp],eax
 005EC1CD    mov         dword ptr [esp+4],eax
>005EC1D1    jmp         005EC418
 005EC1D6    mov         edx,eax
 005EC1D8    add         eax,eax
 005EC1DA    add         eax,eax
 005EC1DC    add         eax,eax
 005EC1DE    sub         eax,edx
 005EC1E0    mov         edx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EC1E6    fild        dword ptr [edx+eax*4+0C]
 005EC1EA    fstp        qword ptr [esp]
 005EC1ED    wait
>005EC1EE    jmp         005EC418
 005EC1F3    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EC1F6    test        eax,eax
>005EC1F8    jge         005EC212
 005EC1FA    mov         eax,dword ptr ds:[78BC70];0x0 gvar_0078BC70:Double
 005EC200    mov         dword ptr [esp],eax
 005EC203    mov         eax,dword ptr ds:[78BC74];0x0 gvar_0078BC74
 005EC209    mov         dword ptr [esp+4],eax
>005EC20D    jmp         005EC418
 005EC212    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EC218    cmp         eax,dword ptr [edx]
>005EC21A    jl          005EC22A
 005EC21C    xor         eax,eax
 005EC21E    mov         dword ptr [esp],eax
 005EC221    mov         dword ptr [esp+4],eax
>005EC225    jmp         005EC418
 005EC22A    mov         edx,eax
 005EC22C    add         eax,eax
 005EC22E    add         eax,eax
 005EC230    add         eax,eax
 005EC232    sub         eax,edx
 005EC234    mov         edx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EC23A    fild        dword ptr [edx+eax*4+10]
 005EC23E    fstp        qword ptr [esp]
 005EC241    wait
>005EC242    jmp         005EC418
 005EC247    lea         eax,[esp+8]
 005EC24B    push        eax
 005EC24C    call        user32.GetCursorPos
 005EC251    fild        dword ptr [esp+8]
 005EC255    fstp        qword ptr [esp]
 005EC258    wait
>005EC259    jmp         005EC418
 005EC25E    lea         eax,[esp+8]
 005EC262    push        eax
 005EC263    call        user32.GetCursorPos
 005EC268    fild        dword ptr [esp+0C]
 005EC26C    fstp        qword ptr [esp]
 005EC26F    wait
>005EC270    jmp         005EC418
 005EC275    mov         eax,[0078DA48];^Mouse:TMouse
 005EC27A    mov         eax,dword ptr [eax]
 005EC27C    fild        dword ptr [eax+10];TMouse.FScrollLines:Integer
 005EC27F    fstp        qword ptr [esp]
 005EC282    wait
>005EC283    jmp         005EC418
 005EC288    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EC28B    test        eax,eax
>005EC28D    jg          005EC2A8
 005EC28F    mov         eax,[0078DA48];^Mouse:TMouse
 005EC294    mov         eax,dword ptr [eax]
 005EC296    movzx       eax,byte ptr [eax+0C];TMouse.FMousePresent:Boolean
 005EC29A    call        00686074
 005EC29F    fstp        qword ptr [esp]
 005EC2A2    wait
>005EC2A3    jmp         005EC418
 005EC2A8    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EC2AE    cmp         eax,dword ptr [edx]
 005EC2B0    setl        al
 005EC2B3    call        00686074
 005EC2B8    fstp        qword ptr [esp]
 005EC2BB    wait
>005EC2BC    jmp         005EC418
 005EC2C1    mov         eax,[0078DA48];^Mouse:TMouse
 005EC2C6    mov         eax,dword ptr [eax]
 005EC2C8    movzx       eax,byte ptr [eax+20];TMouse.FWheelPresent:Boolean
 005EC2CC    call        00686074
 005EC2D1    fstp        qword ptr [esp]
 005EC2D4    wait
>005EC2D5    jmp         005EC418
 005EC2DA    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EC2DD    test        eax,eax
>005EC2DF    jg          005EC2FB
 005EC2E1    mov         eax,[0078DA48];^Mouse:TMouse
 005EC2E6    mov         eax,dword ptr [eax]
 005EC2E8    call        TMouse.GetIsDragging
 005EC2ED    call        00686074
 005EC2F2    fstp        qword ptr [esp]
 005EC2F5    wait
>005EC2F6    jmp         005EC418
 005EC2FB    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EC301    cmp         eax,dword ptr [edx]
>005EC303    jl          005EC313
 005EC305    xor         eax,eax
 005EC307    mov         dword ptr [esp],eax
 005EC30A    mov         dword ptr [esp+4],eax
>005EC30E    jmp         005EC418
 005EC313    mov         eax,[0078DA48];^Mouse:TMouse
 005EC318    mov         eax,dword ptr [eax]
 005EC31A    call        TMouse.GetIsDragging
 005EC31F    test        al,al
>005EC321    je          005EC340
 005EC323    mov         eax,dword ptr [ebx+18];TMouseValue.........................................................
 005EC326    mov         edx,eax
 005EC328    add         eax,eax
 005EC32A    add         eax,eax
 005EC32C    add         eax,eax
 005EC32E    sub         eax,edx
 005EC330    mov         edx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EC336    test        dword ptr [edx+eax*4+14],1
>005EC33E    ja          005EC344
 005EC340    xor         eax,eax
>005EC342    jmp         005EC346
 005EC344    mov         al,1
 005EC346    call        00686074
 005EC34B    fstp        qword ptr [esp]
 005EC34E    wait
>005EC34F    jmp         005EC418
 005EC354    call        user32.GetDoubleClickTime
 005EC359    mov         dword ptr [esp+50],eax
 005EC35D    xor         eax,eax
 005EC35F    mov         dword ptr [esp+54],eax
 005EC363    fild        qword ptr [esp+50]
 005EC367    fdiv        dword ptr ds:[5EC420];1000:Single
 005EC36D    fstp        qword ptr [esp]
 005EC370    wait
>005EC371    jmp         005EC418
 005EC376    mov         dword ptr [esp+28],14
 005EC37E    lea         eax,[esp+28]
 005EC382    push        eax
 005EC383    call        user32.GetCursorInfo
 005EC388    mov         eax,dword ptr [esp+30]
 005EC38C    call        005EB23C
 005EC391    mov         dword ptr [esp+3C],eax
 005EC395    fild        dword ptr [esp+3C]
 005EC399    fstp        qword ptr [esp]
 005EC39C    wait
>005EC39D    jmp         005EC418
 005EC39F    mov         dword ptr [esp+28],14
 005EC3A7    lea         eax,[esp+28]
 005EC3AB    push        eax
 005EC3AC    call        user32.GetCursorInfo
 005EC3B1    test        dword ptr [esp+2C],1
 005EC3B9    seta        al
 005EC3BC    call        00686074
 005EC3C1    fstp        qword ptr [esp]
 005EC3C4    wait
>005EC3C5    jmp         005EC418
 005EC3C7    mov         dword ptr [esp+28],14
 005EC3CF    lea         eax,[esp+28]
 005EC3D3    push        eax
 005EC3D4    call        user32.GetCursorInfo
 005EC3D9    mov         eax,dword ptr [esp+30]
 005EC3DD    mov         dword ptr [esp+50],eax
 005EC3E1    xor         eax,eax
 005EC3E3    mov         dword ptr [esp+54],eax
 005EC3E7    fild        qword ptr [esp+50]
 005EC3EB    fstp        qword ptr [esp]
 005EC3EE    wait
>005EC3EF    jmp         005EC418
 005EC3F1    mov         eax,[0078DB00];^Screen:TScreen
 005EC3F6    mov         eax,dword ptr [eax]
 005EC3F8    movzx       eax,word ptr [eax+48];TScreen.FCursor:TCursor
 005EC3FC    call        005EB3B0
 005EC401    mov         dword ptr [esp+3C],eax
 005EC405    fild        dword ptr [esp+3C]
 005EC409    fstp        qword ptr [esp]
 005EC40C    wait
>005EC40D    jmp         005EC418
 005EC40F    xor         eax,eax
 005EC411    mov         dword ptr [esp],eax
 005EC414    mov         dword ptr [esp+4],eax
 005EC418    fld         qword ptr [esp]
 005EC41B    add         esp,58
 005EC41E    pop         ebx
 005EC41F    ret
*}
end;

//005EC424
procedure TMouseValue.GetVector(x:Double; y:Double; z:Double);
begin
{*
 005EC424    push        ebp
 005EC425    mov         ebp,esp
 005EC427    add         esp,0FFFFFFE4
 005EC42A    push        ebx
 005EC42B    push        esi
 005EC42C    push        edi
 005EC42D    mov         esi,ecx
 005EC42F    mov         ebx,edx
 005EC431    mov         edi,dword ptr [ebp+8]
 005EC434    movzx       edx,byte ptr [eax+20];TMouseValue.........................................Item:byte
 005EC438    add         edx,0FFFFFFE3
 005EC43B    cmp         edx,16
>005EC43E    ja          005EC789
 005EC444    movzx       edx,byte ptr [edx+5EC452]
 005EC44B    jmp         dword ptr [edx*4+5EC469]
 005EC44B    db          1
 005EC44B    db          2
 005EC44B    db          3
 005EC44B    db          4
 005EC44B    db          5
 005EC44B    db          0
 005EC44B    db          0
 005EC44B    db          0
 005EC44B    db          0
 005EC44B    db          0
 005EC44B    db          0
 005EC44B    db          0
 005EC44B    db          0
 005EC44B    db          0
 005EC44B    db          0
 005EC44B    db          0
 005EC44B    db          0
 005EC44B    db          0
 005EC44B    db          0
 005EC44B    db          0
 005EC44B    db          0
 005EC44B    db          6
 005EC44B    db          7
 005EC44B    dd          005EC789
 005EC44B    dd          005EC489
 005EC44B    dd          005EC4AA
 005EC44B    dd          005EC4F5
 005EC44B    dd          005EC576
 005EC44B    dd          005EC611
 005EC44B    dd          005EC6C9
 005EC44B    dd          005EC6F7
 005EC489    lea         eax,[ebp-8]
 005EC48C    push        eax
 005EC48D    call        user32.GetCursorPos
 005EC492    fild        dword ptr [ebp-8]
 005EC495    fstp        qword ptr [ebx]
 005EC497    wait
 005EC498    fild        dword ptr [ebp-4]
 005EC49B    fstp        qword ptr [esi]
 005EC49D    wait
 005EC49E    xor         eax,eax
 005EC4A0    mov         dword ptr [edi],eax
 005EC4A2    mov         dword ptr [edi+4],eax
>005EC4A5    jmp         005EC793
 005EC4AA    lea         eax,[ebp-8]
 005EC4AD    push        eax
 005EC4AE    call        user32.GetCursorPos
 005EC4B3    mov         eax,[0078DB00];^Screen:TScreen
 005EC4B8    mov         eax,dword ptr [eax]
 005EC4BA    call        TScreen.GetWidth
 005EC4BF    dec         eax
 005EC4C0    mov         dword ptr [ebp-0C],eax
 005EC4C3    fild        dword ptr [ebp-0C]
 005EC4C6    fild        dword ptr [ebp-8]
 005EC4C9    fdivrp      st(1),st
 005EC4CB    fstp        qword ptr [ebx]
 005EC4CD    wait
 005EC4CE    mov         eax,[0078DB00];^Screen:TScreen
 005EC4D3    mov         eax,dword ptr [eax]
 005EC4D5    call        TScreen.GetHeight
 005EC4DA    dec         eax
 005EC4DB    mov         dword ptr [ebp-0C],eax
 005EC4DE    fild        dword ptr [ebp-0C]
 005EC4E1    fild        dword ptr [ebp-4]
 005EC4E4    fdivrp      st(1),st
 005EC4E6    fstp        qword ptr [esi]
 005EC4E8    wait
 005EC4E9    xor         eax,eax
 005EC4EB    mov         dword ptr [edi],eax
 005EC4ED    mov         dword ptr [edi+4],eax
>005EC4F0    jmp         005EC793
 005EC4F5    lea         eax,[ebp-8]
 005EC4F8    push        eax
 005EC4F9    call        user32.GetCursorPos
 005EC4FE    mov         eax,[0078DB00];^Screen:TScreen
 005EC503    mov         eax,dword ptr [eax]
 005EC505    call        TScreen.GetDesktopLeft
 005EC50A    mov         edx,dword ptr [ebp-8]
 005EC50D    sub         edx,eax
 005EC50F    mov         dword ptr [ebp-0C],edx
 005EC512    fild        dword ptr [ebp-0C]
 005EC515    fstp        tbyte ptr [ebp-18]
 005EC518    wait
 005EC519    mov         eax,[0078DB00];^Screen:TScreen
 005EC51E    mov         eax,dword ptr [eax]
 005EC520    call        TScreen.GetDesktopWidth
 005EC525    dec         eax
 005EC526    mov         dword ptr [ebp-1C],eax
 005EC529    fild        dword ptr [ebp-1C]
 005EC52C    fld         tbyte ptr [ebp-18]
 005EC52F    fdivrp      st(1),st
 005EC531    fstp        qword ptr [ebx]
 005EC533    wait
 005EC534    mov         eax,[0078DB00];^Screen:TScreen
 005EC539    mov         eax,dword ptr [eax]
 005EC53B    call        TScreen.GetDesktopTop
 005EC540    mov         edx,dword ptr [ebp-4]
 005EC543    sub         edx,eax
 005EC545    mov         dword ptr [ebp-0C],edx
 005EC548    fild        dword ptr [ebp-0C]
 005EC54B    fstp        tbyte ptr [ebp-18]
 005EC54E    wait
 005EC54F    mov         eax,[0078DB00];^Screen:TScreen
 005EC554    mov         eax,dword ptr [eax]
 005EC556    call        TScreen.GetDesktopHeight
 005EC55B    dec         eax
 005EC55C    mov         dword ptr [ebp-1C],eax
 005EC55F    fild        dword ptr [ebp-1C]
 005EC562    fld         tbyte ptr [ebp-18]
 005EC565    fdivrp      st(1),st
 005EC567    fstp        qword ptr [esi]
 005EC569    wait
 005EC56A    xor         eax,eax
 005EC56C    mov         dword ptr [edi],eax
 005EC56E    mov         dword ptr [edi+4],eax
>005EC571    jmp         005EC793
 005EC576    cmp         dword ptr [eax+18],0;TMouseValue...........................................................
>005EC57A    jge         005EC5AA
 005EC57C    mov         eax,dword ptr ds:[78BC58];0x0 gvar_0078BC58:Double
 005EC582    mov         dword ptr [ebx],eax
 005EC584    mov         eax,dword ptr ds:[78BC5C];0x0 gvar_0078BC5C
 005EC58A    mov         dword ptr [ebx+4],eax
 005EC58D    mov         eax,dword ptr ds:[78BC60];0x0 gvar_0078BC60:Double
 005EC593    mov         dword ptr [esi],eax
 005EC595    mov         eax,dword ptr ds:[78BC64];0x0 gvar_0078BC64
 005EC59B    mov         dword ptr [esi+4],eax
 005EC59E    xor         eax,eax
 005EC5A0    mov         dword ptr [edi],eax
 005EC5A2    mov         dword ptr [edi+4],eax
>005EC5A5    jmp         005EC793
 005EC5AA    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EC5B0    mov         edx,dword ptr [edx]
 005EC5B2    cmp         edx,dword ptr [eax+18];TMouseValue.........................................................
>005EC5B5    jg          005EC5D1
 005EC5B7    xor         eax,eax
 005EC5B9    mov         dword ptr [ebx],eax
 005EC5BB    mov         dword ptr [ebx+4],eax
 005EC5BE    xor         eax,eax
 005EC5C0    mov         dword ptr [esi],eax
 005EC5C2    mov         dword ptr [esi+4],eax
 005EC5C5    xor         eax,eax
 005EC5C7    mov         dword ptr [edi],eax
 005EC5C9    mov         dword ptr [edi+4],eax
>005EC5CC    jmp         005EC793
 005EC5D1    mov         edx,dword ptr [eax+18];TMouseValue.........................................................
 005EC5D4    mov         ecx,edx
 005EC5D6    add         edx,edx
 005EC5D8    add         edx,edx
 005EC5DA    add         edx,edx
 005EC5DC    sub         edx,ecx
 005EC5DE    mov         ecx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EC5E4    fild        dword ptr [ecx+edx*4+4]
 005EC5E8    fstp        qword ptr [ebx]
 005EC5EA    wait
 005EC5EB    mov         eax,dword ptr [eax+18];TMouseValue.........................................................
 005EC5EE    mov         edx,eax
 005EC5F0    add         eax,eax
 005EC5F2    add         eax,eax
 005EC5F4    add         eax,eax
 005EC5F6    sub         eax,edx
 005EC5F8    mov         edx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EC5FE    fild        dword ptr [edx+eax*4+8]
 005EC602    fstp        qword ptr [esi]
 005EC604    wait
 005EC605    xor         eax,eax
 005EC607    mov         dword ptr [edi],eax
 005EC609    mov         dword ptr [edi+4],eax
>005EC60C    jmp         005EC793
 005EC611    cmp         dword ptr [eax+18],0;TMouseValue...........................................................
>005EC615    jge         005EC64F
 005EC617    mov         eax,dword ptr ds:[78BC58];0x0 gvar_0078BC58:Double
 005EC61D    mov         dword ptr [ebx],eax
 005EC61F    mov         eax,dword ptr ds:[78BC5C];0x0 gvar_0078BC5C
 005EC625    mov         dword ptr [ebx+4],eax
 005EC628    mov         eax,dword ptr ds:[78BC60];0x0 gvar_0078BC60:Double
 005EC62E    mov         dword ptr [esi],eax
 005EC630    mov         eax,dword ptr ds:[78BC64];0x0 gvar_0078BC64
 005EC636    mov         dword ptr [esi+4],eax
 005EC639    mov         eax,dword ptr ds:[78BC68];0x0 gvar_0078BC68:Double
 005EC63F    mov         dword ptr [edi],eax
 005EC641    mov         eax,dword ptr ds:[78BC6C];0x0 gvar_0078BC6C
 005EC647    mov         dword ptr [edi+4],eax
>005EC64A    jmp         005EC793
 005EC64F    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EC655    mov         edx,dword ptr [edx]
 005EC657    cmp         edx,dword ptr [eax+18];TMouseValue.........................................................
>005EC65A    jg          005EC676
 005EC65C    xor         eax,eax
 005EC65E    mov         dword ptr [ebx],eax
 005EC660    mov         dword ptr [ebx+4],eax
 005EC663    xor         eax,eax
 005EC665    mov         dword ptr [esi],eax
 005EC667    mov         dword ptr [esi+4],eax
 005EC66A    xor         eax,eax
 005EC66C    mov         dword ptr [edi],eax
 005EC66E    mov         dword ptr [edi+4],eax
>005EC671    jmp         005EC793
 005EC676    mov         edx,dword ptr [eax+18];TMouseValue.........................................................
 005EC679    mov         ecx,edx
 005EC67B    add         edx,edx
 005EC67D    add         edx,edx
 005EC67F    add         edx,edx
 005EC681    sub         edx,ecx
 005EC683    mov         ecx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EC689    fild        dword ptr [ecx+edx*4+4]
 005EC68D    fstp        qword ptr [ebx]
 005EC68F    wait
 005EC690    mov         edx,dword ptr [eax+18];TMouseValue.........................................................
 005EC693    mov         ecx,edx
 005EC695    add         edx,edx
 005EC697    add         edx,edx
 005EC699    add         edx,edx
 005EC69B    sub         edx,ecx
 005EC69D    mov         ecx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EC6A3    fild        dword ptr [ecx+edx*4+8]
 005EC6A7    fstp        qword ptr [esi]
 005EC6A9    wait
 005EC6AA    mov         eax,dword ptr [eax+18];TMouseValue.........................................................
 005EC6AD    mov         edx,eax
 005EC6AF    add         eax,eax
 005EC6B1    add         eax,eax
 005EC6B3    add         eax,eax
 005EC6B5    sub         eax,edx
 005EC6B7    mov         edx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EC6BD    fild        dword ptr [edx+eax*4+0C]
 005EC6C1    fstp        qword ptr [edi]
 005EC6C3    wait
>005EC6C4    jmp         005EC793
 005EC6C9    mov         eax,dword ptr ds:[78BC98];0x0 gvar_0078BC98:Double
 005EC6CF    mov         dword ptr [ebx],eax
 005EC6D1    mov         eax,dword ptr ds:[78BC9C];0x0 gvar_0078BC9C
 005EC6D7    mov         dword ptr [ebx+4],eax
 005EC6DA    mov         eax,dword ptr ds:[78BCA0];0x0 gvar_0078BCA0:Double
 005EC6E0    mov         dword ptr [esi],eax
 005EC6E2    mov         eax,dword ptr ds:[78BCA4];0x0 gvar_0078BCA4
 005EC6E8    mov         dword ptr [esi+4],eax
 005EC6EB    xor         eax,eax
 005EC6ED    mov         dword ptr [edi],eax
 005EC6EF    mov         dword ptr [edi+4],eax
>005EC6F2    jmp         005EC793
 005EC6F7    cmp         dword ptr [eax+18],0;TMouseValue...........................................................
>005EC6FB    jge         005EC728
 005EC6FD    mov         eax,dword ptr ds:[78BC78];0x0 gvar_0078BC78:Double
 005EC703    mov         dword ptr [ebx],eax
 005EC705    mov         eax,dword ptr ds:[78BC7C];0x0 gvar_0078BC7C
 005EC70B    mov         dword ptr [ebx+4],eax
 005EC70E    mov         eax,dword ptr ds:[78BC80];0x0 gvar_0078BC80:Double
 005EC714    mov         dword ptr [esi],eax
 005EC716    mov         eax,dword ptr ds:[78BC84];0x0 gvar_0078BC84
 005EC71C    mov         dword ptr [esi+4],eax
 005EC71F    xor         eax,eax
 005EC721    mov         dword ptr [edi],eax
 005EC723    mov         dword ptr [edi+4],eax
>005EC726    jmp         005EC793
 005EC728    mov         edx,dword ptr ds:[78D89C];^gvar_008177F0
 005EC72E    mov         edx,dword ptr [edx]
 005EC730    cmp         edx,dword ptr [eax+18];TMouseValue.........................................................
>005EC733    jg          005EC74C
 005EC735    xor         eax,eax
 005EC737    mov         dword ptr [ebx],eax
 005EC739    mov         dword ptr [ebx+4],eax
 005EC73C    xor         eax,eax
 005EC73E    mov         dword ptr [esi],eax
 005EC740    mov         dword ptr [esi+4],eax
 005EC743    xor         eax,eax
 005EC745    mov         dword ptr [edi],eax
 005EC747    mov         dword ptr [edi+4],eax
>005EC74A    jmp         005EC793
 005EC74C    mov         edx,dword ptr [eax+18];TMouseValue.........................................................
 005EC74F    mov         ecx,edx
 005EC751    add         edx,edx
 005EC753    add         edx,edx
 005EC755    add         edx,edx
 005EC757    sub         edx,ecx
 005EC759    mov         ecx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EC75F    fild        dword ptr [ecx+edx*4+4]
 005EC763    fstp        qword ptr [ebx]
 005EC765    wait
 005EC766    mov         eax,dword ptr [eax+18];TMouseValue.........................................................
 005EC769    mov         edx,eax
 005EC76B    add         eax,eax
 005EC76D    add         eax,eax
 005EC76F    add         eax,eax
 005EC771    sub         eax,edx
 005EC773    mov         edx,dword ptr ds:[78D46C];^gvar_00816EAC
 005EC779    fild        dword ptr [edx+eax*4+8]
 005EC77D    fstp        qword ptr [esi]
 005EC77F    wait
 005EC780    xor         eax,eax
 005EC782    mov         dword ptr [edi],eax
 005EC784    mov         dword ptr [edi+4],eax
>005EC787    jmp         005EC793
 005EC789    push        edi
 005EC78A    mov         ecx,esi
 005EC78C    mov         edx,ebx
 005EC78E    call        TExpression.GetVector
 005EC793    pop         edi
 005EC794    pop         esi
 005EC795    pop         ebx
 005EC796    mov         esp,ebp
 005EC798    pop         ebp
 005EC799    ret         4
*}
end;

//005EC79C
function TMouseValue.Module:TObject;
begin
{*
 005EC79C    mov         eax,[008162A0];gvar_008162A0:TModuleMouse
 005EC7A1    ret
*}
end;

//005EC7A4
procedure TMouseValue.Press;
begin
{*
 005EC7A4    add         esp,0FFFFFFE4
 005EC7A7    mov         dl,1
 005EC7A9    xor         ecx,ecx
 005EC7AB    mov         dword ptr [esp],ecx
 005EC7AE    xor         ecx,ecx
 005EC7B0    mov         dword ptr [esp+4],ecx
 005EC7B4    xor         ecx,ecx
 005EC7B6    mov         dword ptr [esp+8],ecx
 005EC7BA    xor         ecx,ecx
 005EC7BC    mov         dword ptr [esp+0C],ecx
 005EC7C0    movzx       eax,byte ptr [eax+20];TMouseValue..........................................Item:byte
 005EC7C4    cmp         eax,25
>005EC7C7    ja          005EC9A0
 005EC7CD    movzx       eax,byte ptr [eax+5EC7DB]
 005EC7D4    jmp         dword ptr [eax*4+5EC801]
 005EC7D4    db          0
 005EC7D4    db          1
 005EC7D4    db          2
 005EC7D4    db          3
 005EC7D4    db          4
 005EC7D4    db          5
 005EC7D4    db          9
 005EC7D4    db          10
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          6
 005EC7D4    db          7
 005EC7D4    db          8
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          13
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          0
 005EC7D4    db          11
 005EC7D4    db          12
 005EC7D4    dd          005EC9A0
 005EC7D4    dd          005EC839
 005EC7D4    dd          005EC857
 005EC7D4    dd          005EC875
 005EC7D4    dd          005EC893
 005EC7D4    dd          005EC8B6
 005EC7D4    dd          005EC8D9
 005EC7D4    dd          005EC8FC
 005EC7D4    dd          005EC91F
 005EC7D4    dd          005EC93F
 005EC7D4    dd          005EC955
 005EC7D4    dd          005EC96B
 005EC7D4    dd          005EC981
 005EC7D4    dd          005EC997
 005EC839    test        dl,dl
>005EC83B    je          005EC84A
 005EC83D    mov         dword ptr [esp+10],2
>005EC845    jmp         005EC9A6
 005EC84A    mov         dword ptr [esp+10],4
>005EC852    jmp         005EC9A6
 005EC857    test        dl,dl
>005EC859    je          005EC868
 005EC85B    mov         dword ptr [esp+10],8
>005EC863    jmp         005EC9A6
 005EC868    mov         dword ptr [esp+10],10
>005EC870    jmp         005EC9A6
 005EC875    test        dl,dl
>005EC877    je          005EC886
 005EC879    mov         dword ptr [esp+10],20
>005EC881    jmp         005EC9A6
 005EC886    mov         dword ptr [esp+10],40
>005EC88E    jmp         005EC9A6
 005EC893    test        dl,dl
>005EC895    je          005EC8A1
 005EC897    mov         dword ptr [esp+10],80
>005EC89F    jmp         005EC8A9
 005EC8A1    mov         dword ptr [esp+10],100
 005EC8A9    mov         dword ptr [esp+0C],1
>005EC8B1    jmp         005EC9A6
 005EC8B6    test        dl,dl
>005EC8B8    je          005EC8C4
 005EC8BA    mov         dword ptr [esp+10],80
>005EC8C2    jmp         005EC8CC
 005EC8C4    mov         dword ptr [esp+10],100
 005EC8CC    mov         dword ptr [esp+0C],2
>005EC8D4    jmp         005EC9A6
 005EC8D9    test        dl,dl
>005EC8DB    je          005EC8E7
 005EC8DD    mov         dword ptr [esp+10],80
>005EC8E5    jmp         005EC8EF
 005EC8E7    mov         dword ptr [esp+10],100
 005EC8EF    mov         dword ptr [esp+0C],4
>005EC8F7    jmp         005EC9A6
 005EC8FC    test        dl,dl
>005EC8FE    je          005EC90A
 005EC900    mov         dword ptr [esp+10],80
>005EC908    jmp         005EC912
 005EC90A    mov         dword ptr [esp+10],100
 005EC912    mov         dword ptr [esp+0C],8
>005EC91A    jmp         005EC9A6
 005EC91F    test        dl,dl
>005EC921    je          005EC92D
 005EC923    mov         dword ptr [esp+10],80
>005EC92B    jmp         005EC935
 005EC92D    mov         dword ptr [esp+10],100
 005EC935    mov         dword ptr [esp+0C],10
>005EC93D    jmp         005EC9A6
 005EC93F    test        dl,dl
>005EC941    je          005EC9A6
 005EC943    mov         dword ptr [esp+10],800
 005EC94B    mov         dword ptr [esp+0C],78
>005EC953    jmp         005EC9A6
 005EC955    test        dl,dl
>005EC957    je          005EC9A6
 005EC959    mov         dword ptr [esp+10],800
 005EC961    mov         dword ptr [esp+0C],0FFFFFF88
>005EC969    jmp         005EC9A6
 005EC96B    test        dl,dl
>005EC96D    je          005EC9A6
 005EC96F    mov         dword ptr [esp+10],1000
 005EC977    mov         dword ptr [esp+0C],0FFFFFF88
>005EC97F    jmp         005EC9A6
 005EC981    test        dl,dl
>005EC983    je          005EC9A6
 005EC985    mov         dword ptr [esp+10],1000
 005EC98D    mov         dword ptr [esp+0C],78
>005EC995    jmp         005EC9A6
 005EC997    mov         eax,edx
 005EC999    call        005EE1A4
>005EC99E    jmp         005EC9A6
 005EC9A0    xor         eax,eax
 005EC9A2    mov         dword ptr [esp+10],eax
 005EC9A6    xor         eax,eax
 005EC9A8    mov         dword ptr [esp+14],eax
 005EC9AC    xor         eax,eax
 005EC9AE    mov         dword ptr [esp+18],eax
 005EC9B2    cmp         dword ptr [esp+10],0
>005EC9B7    je          005EC9CD
 005EC9B9    push        1C
 005EC9BB    lea         eax,[esp+4]
 005EC9BF    push        eax
 005EC9C0    push        1
 005EC9C2    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005EC9C7    mov         eax,dword ptr [eax]
 005EC9C9    call        eax
>005EC9CB    jmp         005EC9D2
 005EC9CD    mov         eax,1
 005EC9D2    dec         eax
 005EC9D3    sete        al
 005EC9D6    add         esp,1C
 005EC9D9    ret
*}
end;

//005EC9DC
procedure TMouseValue.Release;
begin
{*
 005EC9DC    add         esp,0FFFFFFE4
 005EC9DF    xor         edx,edx
 005EC9E1    xor         ecx,ecx
 005EC9E3    mov         dword ptr [esp],ecx
 005EC9E6    xor         ecx,ecx
 005EC9E8    mov         dword ptr [esp+4],ecx
 005EC9EC    xor         ecx,ecx
 005EC9EE    mov         dword ptr [esp+8],ecx
 005EC9F2    xor         ecx,ecx
 005EC9F4    mov         dword ptr [esp+0C],ecx
 005EC9F8    movzx       eax,byte ptr [eax+20];TMouseValue...........................................Item:byte
 005EC9FC    cmp         eax,25
>005EC9FF    ja          005ECBD8
 005ECA05    movzx       eax,byte ptr [eax+5ECA13]
 005ECA0C    jmp         dword ptr [eax*4+5ECA39]
 005ECA0C    db          0
 005ECA0C    db          1
 005ECA0C    db          2
 005ECA0C    db          3
 005ECA0C    db          4
 005ECA0C    db          5
 005ECA0C    db          9
 005ECA0C    db          10
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          6
 005ECA0C    db          7
 005ECA0C    db          8
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          13
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          0
 005ECA0C    db          11
 005ECA0C    db          12
 005ECA0C    dd          005ECBD8
 005ECA0C    dd          005ECA71
 005ECA0C    dd          005ECA8F
 005ECA0C    dd          005ECAAD
 005ECA0C    dd          005ECACB
 005ECA0C    dd          005ECAEE
 005ECA0C    dd          005ECB11
 005ECA0C    dd          005ECB34
 005ECA0C    dd          005ECB57
 005ECA0C    dd          005ECB77
 005ECA0C    dd          005ECB8D
 005ECA0C    dd          005ECBA3
 005ECA0C    dd          005ECBB9
 005ECA0C    dd          005ECBCF
 005ECA71    test        dl,dl
>005ECA73    je          005ECA82
 005ECA75    mov         dword ptr [esp+10],2
>005ECA7D    jmp         005ECBDE
 005ECA82    mov         dword ptr [esp+10],4
>005ECA8A    jmp         005ECBDE
 005ECA8F    test        dl,dl
>005ECA91    je          005ECAA0
 005ECA93    mov         dword ptr [esp+10],8
>005ECA9B    jmp         005ECBDE
 005ECAA0    mov         dword ptr [esp+10],10
>005ECAA8    jmp         005ECBDE
 005ECAAD    test        dl,dl
>005ECAAF    je          005ECABE
 005ECAB1    mov         dword ptr [esp+10],20
>005ECAB9    jmp         005ECBDE
 005ECABE    mov         dword ptr [esp+10],40
>005ECAC6    jmp         005ECBDE
 005ECACB    test        dl,dl
>005ECACD    je          005ECAD9
 005ECACF    mov         dword ptr [esp+10],80
>005ECAD7    jmp         005ECAE1
 005ECAD9    mov         dword ptr [esp+10],100
 005ECAE1    mov         dword ptr [esp+0C],1
>005ECAE9    jmp         005ECBDE
 005ECAEE    test        dl,dl
>005ECAF0    je          005ECAFC
 005ECAF2    mov         dword ptr [esp+10],80
>005ECAFA    jmp         005ECB04
 005ECAFC    mov         dword ptr [esp+10],100
 005ECB04    mov         dword ptr [esp+0C],2
>005ECB0C    jmp         005ECBDE
 005ECB11    test        dl,dl
>005ECB13    je          005ECB1F
 005ECB15    mov         dword ptr [esp+10],80
>005ECB1D    jmp         005ECB27
 005ECB1F    mov         dword ptr [esp+10],100
 005ECB27    mov         dword ptr [esp+0C],4
>005ECB2F    jmp         005ECBDE
 005ECB34    test        dl,dl
>005ECB36    je          005ECB42
 005ECB38    mov         dword ptr [esp+10],80
>005ECB40    jmp         005ECB4A
 005ECB42    mov         dword ptr [esp+10],100
 005ECB4A    mov         dword ptr [esp+0C],8
>005ECB52    jmp         005ECBDE
 005ECB57    test        dl,dl
>005ECB59    je          005ECB65
 005ECB5B    mov         dword ptr [esp+10],80
>005ECB63    jmp         005ECB6D
 005ECB65    mov         dword ptr [esp+10],100
 005ECB6D    mov         dword ptr [esp+0C],10
>005ECB75    jmp         005ECBDE
 005ECB77    test        dl,dl
>005ECB79    je          005ECBDE
 005ECB7B    mov         dword ptr [esp+10],800
 005ECB83    mov         dword ptr [esp+0C],78
>005ECB8B    jmp         005ECBDE
 005ECB8D    test        dl,dl
>005ECB8F    je          005ECBDE
 005ECB91    mov         dword ptr [esp+10],800
 005ECB99    mov         dword ptr [esp+0C],0FFFFFF88
>005ECBA1    jmp         005ECBDE
 005ECBA3    test        dl,dl
>005ECBA5    je          005ECBDE
 005ECBA7    mov         dword ptr [esp+10],1000
 005ECBAF    mov         dword ptr [esp+0C],0FFFFFF88
>005ECBB7    jmp         005ECBDE
 005ECBB9    test        dl,dl
>005ECBBB    je          005ECBDE
 005ECBBD    mov         dword ptr [esp+10],1000
 005ECBC5    mov         dword ptr [esp+0C],78
>005ECBCD    jmp         005ECBDE
 005ECBCF    mov         eax,edx
 005ECBD1    call        005EE1A4
>005ECBD6    jmp         005ECBDE
 005ECBD8    xor         eax,eax
 005ECBDA    mov         dword ptr [esp+10],eax
 005ECBDE    xor         eax,eax
 005ECBE0    mov         dword ptr [esp+14],eax
 005ECBE4    xor         eax,eax
 005ECBE6    mov         dword ptr [esp+18],eax
 005ECBEA    cmp         dword ptr [esp+10],0
>005ECBEF    je          005ECC05
 005ECBF1    push        1C
 005ECBF3    lea         eax,[esp+4]
 005ECBF7    push        eax
 005ECBF8    push        1
 005ECBFA    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005ECBFF    mov         eax,dword ptr [eax]
 005ECC01    call        eax
>005ECC03    jmp         005ECC0A
 005ECC05    mov         eax,1
 005ECC0A    dec         eax
 005ECC0B    sete        al
 005ECC0E    add         esp,1C
 005ECC11    ret
*}
end;

//005ECC14
{*function TMouseValue.SetValue(NewValue:Double; ?:?):Boolean;
begin
 005ECC14    push        ebp
 005ECC15    mov         ebp,esp
 005ECC17    add         esp,0FFFFFFBC
 005ECC1A    push        ebx
 005ECC1B    push        esi
 005ECC1C    push        edi
 005ECC1D    mov         esi,eax
 005ECC1F    mov         eax,esi
 005ECC21    mov         edx,dword ptr [eax]
 005ECC23    call        dword ptr [edx+44];TMouseValue.GetDataType
 005ECC26    cmp         al,5
>005ECC28    jne         005ECC47
 005ECC2A    push        dword ptr [ebp+0C]
 005ECC2D    push        dword ptr [ebp+8]
 005ECC30    push        0
 005ECC32    push        0
 005ECC34    push        0
 005ECC36    push        0
 005ECC38    mov         eax,esi
 005ECC3A    mov         edx,dword ptr [eax]
 005ECC3C    call        dword ptr [edx+60];TMouseValue.SetVector
 005ECC3F    mov         byte ptr [ebp-1],al
>005ECC42    jmp         005ED57F
 005ECC47    mov         edi,1
 005ECC4C    movzx       eax,byte ptr [esi+20];TMouseValue............................................Item:byte
 005ECC50    cmp         al,2A
>005ECC52    jne         005ECCF5
 005ECC58    fld         qword ptr ds:[78BCD8];gvar_0078BCD8:Double
 005ECC5E    fadd        qword ptr [ebp+8]
 005ECC61    fsub        qword ptr ds:[78BC98];gvar_0078BC98:Double
 005ECC67    fstp        qword ptr ds:[78BCD8];gvar_0078BCD8:Double
 005ECC6D    wait
 005ECC6E    mov         eax,dword ptr [ebp+8]
 005ECC71    mov         dword ptr ds:[78BC98],eax;gvar_0078BC98:Double
 005ECC77    mov         eax,dword ptr [ebp+0C]
 005ECC7A    mov         dword ptr ds:[78BC9C],eax;gvar_0078BC9C
 005ECC80    xor         eax,eax
 005ECC82    mov         dword ptr [ebp-28],eax
 005ECC85    xor         eax,eax
 005ECC87    mov         dword ptr [ebp-1C],eax
 005ECC8A    mov         dword ptr [ebp-18],1
 005ECC91    fld         qword ptr ds:[78BCD8];gvar_0078BCD8:Double
 005ECC97    call        @ROUND
 005ECC9C    mov         dword ptr [ebp-24],eax
 005ECC9F    xor         eax,eax
 005ECCA1    mov         dword ptr [ebp-20],eax
 005ECCA4    xor         eax,eax
 005ECCA6    mov         dword ptr [ebp-14],eax
 005ECCA9    xor         eax,eax
 005ECCAB    mov         dword ptr [ebp-10],eax
 005ECCAE    mov         eax,dword ptr [ebp-24]
 005ECCB1    mov         dword ptr [ebp-2C],eax
 005ECCB4    fild        dword ptr [ebp-2C]
 005ECCB7    fsubr       qword ptr ds:[78BCD8];gvar_0078BCD8:Double
 005ECCBD    fstp        qword ptr ds:[78BCD8];gvar_0078BCD8:Double
 005ECCC3    wait
 005ECCC4    fild        dword ptr [ebp-24]
 005ECCC7    fadd        qword ptr ds:[78BCB8];gvar_0078BCB8:Double
 005ECCCD    fstp        qword ptr ds:[78BCB8];gvar_0078BCB8:Double
 005ECCD3    wait
 005ECCD4    test        eax,eax
>005ECCD6    je          005ECCEB
 005ECCD8    push        1C
 005ECCDA    lea         eax,[ebp-28]
 005ECCDD    push        eax
 005ECCDE    push        1
 005ECCE0    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005ECCE5    mov         eax,dword ptr [eax]
 005ECCE7    call        eax
 005ECCE9    mov         edi,eax
 005ECCEB    dec         edi
 005ECCEC    sete        byte ptr [ebp-1]
>005ECCF0    jmp         005ED57F
 005ECCF5    cmp         al,2B
>005ECCF7    jne         005ECD9A
 005ECCFD    fld         qword ptr ds:[78BCE0];gvar_0078BCE0:Double
 005ECD03    fadd        qword ptr [ebp+8]
 005ECD06    fsub        qword ptr ds:[78BCA0];gvar_0078BCA0:Double
 005ECD0C    fstp        qword ptr ds:[78BCE0];gvar_0078BCE0:Double
 005ECD12    wait
 005ECD13    mov         eax,dword ptr [ebp+8]
 005ECD16    mov         dword ptr ds:[78BCA0],eax;gvar_0078BCA0:Double
 005ECD1C    mov         eax,dword ptr [ebp+0C]
 005ECD1F    mov         dword ptr ds:[78BCA4],eax;gvar_0078BCA4
 005ECD25    xor         eax,eax
 005ECD27    mov         dword ptr [ebp-28],eax
 005ECD2A    xor         eax,eax
 005ECD2C    mov         dword ptr [ebp-1C],eax
 005ECD2F    mov         dword ptr [ebp-18],1
 005ECD36    fld         qword ptr ds:[78BCE0];gvar_0078BCE0:Double
 005ECD3C    call        @ROUND
 005ECD41    mov         dword ptr [ebp-20],eax
 005ECD44    xor         eax,eax
 005ECD46    mov         dword ptr [ebp-24],eax
 005ECD49    xor         eax,eax
 005ECD4B    mov         dword ptr [ebp-14],eax
 005ECD4E    xor         eax,eax
 005ECD50    mov         dword ptr [ebp-10],eax
 005ECD53    mov         eax,dword ptr [ebp-20]
 005ECD56    mov         dword ptr [ebp-2C],eax
 005ECD59    fild        dword ptr [ebp-2C]
 005ECD5C    fsubr       qword ptr ds:[78BCE0];gvar_0078BCE0:Double
 005ECD62    fstp        qword ptr ds:[78BCE0];gvar_0078BCE0:Double
 005ECD68    wait
 005ECD69    fild        dword ptr [ebp-20]
 005ECD6C    fadd        qword ptr ds:[78BCC0];gvar_0078BCC0:Double
 005ECD72    fstp        qword ptr ds:[78BCC0];gvar_0078BCC0:Double
 005ECD78    wait
 005ECD79    test        eax,eax
>005ECD7B    je          005ECD90
 005ECD7D    push        1C
 005ECD7F    lea         eax,[ebp-28]
 005ECD82    push        eax
 005ECD83    push        1
 005ECD85    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005ECD8A    mov         eax,dword ptr [eax]
 005ECD8C    call        eax
 005ECD8E    mov         edi,eax
 005ECD90    dec         edi
 005ECD91    sete        byte ptr [ebp-1]
>005ECD95    jmp         005ED57F
 005ECD9A    cmp         al,2C
>005ECD9C    jne         005ECE4F
 005ECDA2    fld         qword ptr ds:[78BCE8];gvar_0078BCE8:Double
 005ECDA8    fadd        qword ptr [ebp+8]
 005ECDAB    fsub        qword ptr ds:[78BCA8];gvar_0078BCA8:Double
 005ECDB1    fstp        qword ptr ds:[78BCE8];gvar_0078BCE8:Double
 005ECDB7    wait
 005ECDB8    mov         eax,dword ptr [ebp+8]
 005ECDBB    mov         dword ptr ds:[78BCA8],eax;gvar_0078BCA8:Double
 005ECDC1    mov         eax,dword ptr [ebp+0C]
 005ECDC4    mov         dword ptr ds:[78BCAC],eax;gvar_0078BCAC
 005ECDCA    xor         eax,eax
 005ECDCC    mov         dword ptr [ebp-28],eax
 005ECDCF    xor         eax,eax
 005ECDD1    mov         dword ptr [ebp-20],eax
 005ECDD4    mov         dword ptr [ebp-18],800
 005ECDDB    fld         qword ptr ds:[78BCE8];gvar_0078BCE8:Double
 005ECDE1    call        @ROUND
 005ECDE6    mov         dword ptr [ebp-1C],eax
 005ECDE9    xor         eax,eax
 005ECDEB    mov         dword ptr [ebp-24],eax
 005ECDEE    xor         eax,eax
 005ECDF0    mov         dword ptr [ebp-14],eax
 005ECDF3    xor         eax,eax
 005ECDF5    mov         dword ptr [ebp-10],eax
 005ECDF8    mov         eax,dword ptr [ebp-1C]
 005ECDFB    mov         dword ptr [ebp-34],eax
 005ECDFE    xor         edx,edx
 005ECE00    mov         dword ptr [ebp-30],edx
 005ECE03    fild        qword ptr [ebp-34]
 005ECE06    fsubr       qword ptr ds:[78BCE8];gvar_0078BCE8:Double
 005ECE0C    fstp        qword ptr ds:[78BCE8];gvar_0078BCE8:Double
 005ECE12    wait
 005ECE13    mov         edx,dword ptr [ebp-1C]
 005ECE16    mov         dword ptr [ebp-34],edx
 005ECE19    xor         edx,edx
 005ECE1B    mov         dword ptr [ebp-30],edx
 005ECE1E    fild        qword ptr [ebp-34]
 005ECE21    fadd        qword ptr ds:[78BCC8];gvar_0078BCC8:Double
 005ECE27    fstp        qword ptr ds:[78BCC8];gvar_0078BCC8:Double
 005ECE2D    wait
 005ECE2E    test        eax,eax
>005ECE30    je          005ECE45
 005ECE32    push        1C
 005ECE34    lea         eax,[ebp-28]
 005ECE37    push        eax
 005ECE38    push        1
 005ECE3A    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005ECE3F    mov         eax,dword ptr [eax]
 005ECE41    call        eax
 005ECE43    mov         edi,eax
 005ECE45    dec         edi
 005ECE46    sete        byte ptr [ebp-1]
>005ECE4A    jmp         005ED57F
 005ECE4F    cmp         al,2D
>005ECE51    jne         005ECF04
 005ECE57    fld         qword ptr ds:[78BCF0];gvar_0078BCF0:Double
 005ECE5D    fadd        qword ptr [ebp+8]
 005ECE60    fsub        qword ptr ds:[78BCB0];gvar_0078BCB0:Double
 005ECE66    fstp        qword ptr ds:[78BCF0];gvar_0078BCF0:Double
 005ECE6C    wait
 005ECE6D    mov         eax,dword ptr [ebp+8]
 005ECE70    mov         dword ptr ds:[78BCB0],eax;gvar_0078BCB0:Double
 005ECE76    mov         eax,dword ptr [ebp+0C]
 005ECE79    mov         dword ptr ds:[78BCB4],eax;gvar_0078BCB4
 005ECE7F    xor         eax,eax
 005ECE81    mov         dword ptr [ebp-28],eax
 005ECE84    mov         dword ptr [ebp-18],1000
 005ECE8B    fld         qword ptr ds:[78BCF0];gvar_0078BCF0:Double
 005ECE91    call        @ROUND
 005ECE96    mov         dword ptr [ebp-1C],eax
 005ECE99    xor         eax,eax
 005ECE9B    mov         dword ptr [ebp-24],eax
 005ECE9E    xor         eax,eax
 005ECEA0    mov         dword ptr [ebp-20],eax
 005ECEA3    xor         eax,eax
 005ECEA5    mov         dword ptr [ebp-14],eax
 005ECEA8    xor         eax,eax
 005ECEAA    mov         dword ptr [ebp-10],eax
 005ECEAD    mov         eax,dword ptr [ebp-1C]
 005ECEB0    mov         dword ptr [ebp-34],eax
 005ECEB3    xor         edx,edx
 005ECEB5    mov         dword ptr [ebp-30],edx
 005ECEB8    fild        qword ptr [ebp-34]
 005ECEBB    fsubr       qword ptr ds:[78BCF0];gvar_0078BCF0:Double
 005ECEC1    fstp        qword ptr ds:[78BCF0];gvar_0078BCF0:Double
 005ECEC7    wait
 005ECEC8    mov         edx,dword ptr [ebp-1C]
 005ECECB    mov         dword ptr [ebp-34],edx
 005ECECE    xor         edx,edx
 005ECED0    mov         dword ptr [ebp-30],edx
 005ECED3    fild        qword ptr [ebp-34]
 005ECED6    fadd        qword ptr ds:[78BCD0];gvar_0078BCD0:Double
 005ECEDC    fstp        qword ptr ds:[78BCD0];gvar_0078BCD0:Double
 005ECEE2    wait
 005ECEE3    test        eax,eax
>005ECEE5    je          005ECEFA
 005ECEE7    push        1C
 005ECEE9    lea         eax,[ebp-28]
 005ECEEC    push        eax
 005ECEED    push        1
 005ECEEF    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005ECEF4    mov         eax,dword ptr [eax]
 005ECEF6    call        eax
 005ECEF8    mov         edi,eax
 005ECEFA    dec         edi
 005ECEFB    sete        byte ptr [ebp-1]
>005ECEFF    jmp         005ED57F
 005ECF04    movzx       eax,byte ptr [esi+20];TMouseValue.............................................Item:byte
 005ECF08    cmp         al,8
>005ECF0A    je          005ECF38
 005ECF0C    cmp         al,9
>005ECF0E    je          005ECF38
 005ECF10    cmp         al,0A
>005ECF12    je          005ECF38
 005ECF14    cmp         al,0B
>005ECF16    je          005ECF38
 005ECF18    cmp         al,11
>005ECF1A    je          005ECF38
 005ECF1C    cmp         al,12
>005ECF1E    je          005ECF38
 005ECF20    cmp         al,0C
>005ECF22    je          005ECF38
 005ECF24    cmp         al,0D
>005ECF26    je          005ECF38
 005ECF28    cmp         al,1C
>005ECF2A    je          005ECF38
 005ECF2C    cmp         al,1B
>005ECF2E    je          005ECF38
 005ECF30    cmp         al,18
>005ECF32    jne         005ED268
 005ECF38    cmp         byte ptr [esi+10],0;TMouseValue.Iffy:Boolean
>005ECF3C    jne         005ECF67
 005ECF3E    fld         qword ptr [ebp+8]
 005ECF41    fcomp       qword ptr [esi+8];TMouseValue.PreviousValue:Double
 005ECF44    wait
 005ECF45    fnstsw      al
 005ECF47    sahf
>005ECF48    jne         005ECF67
 005ECF4A    movzx       eax,byte ptr [esi+20];TMouseValue..............................................Item:byte
 005ECF4E    add         al,0F8
 005ECF50    sub         al,6
>005ECF52    jb          005ECF67
 005ECF54    add         al,0FD
 005ECF56    sub         al,2
>005ECF58    jb          005ECF67
 005ECF5A    sub         al,9
>005ECF5C    je          005ECF67
 005ECF5E    mov         byte ptr [ebp-1],1
>005ECF62    jmp         005ED57F
 005ECF67    lea         eax,[ebp-0C]
 005ECF6A    push        eax
 005ECF6B    call        user32.GetCursorPos
 005ECF70    xor         eax,eax
 005ECF72    mov         dword ptr [ebp-28],eax
 005ECF75    xor         eax,eax
 005ECF77    mov         dword ptr [ebp-24],eax
 005ECF7A    xor         eax,eax
 005ECF7C    mov         dword ptr [ebp-20],eax
 005ECF7F    xor         eax,eax
 005ECF81    mov         dword ptr [ebp-1C],eax
 005ECF84    xor         eax,eax
 005ECF86    mov         dword ptr [ebp-18],eax
 005ECF89    movzx       eax,byte ptr [esi+20];TMouseValue...............................................Item:byt...
 005ECF8D    add         eax,0FFFFFFF8
 005ECF90    cmp         eax,1B
>005ECF93    ja          005ED223
 005ECF99    movzx       eax,byte ptr [eax+5ECFA7]
 005ECFA0    jmp         dword ptr [eax*4+5ECFC3]
 005ECFA0    db          1
 005ECFA0    db          2
 005ECFA0    db          3
 005ECFA0    db          4
 005ECFA0    db          5
 005ECFA0    db          6
 005ECFA0    db          0
 005ECFA0    db          0
 005ECFA0    db          0
 005ECFA0    db          9
 005ECFA0    db          10
 005ECFA0    db          0
 005ECFA0    db          0
 005ECFA0    db          0
 005ECFA0    db          0
 005ECFA0    db          0
 005ECFA0    db          11
 005ECFA0    db          0
 005ECFA0    db          0
 005ECFA0    db          12
 005ECFA0    db          7
 005ECFA0    db          0
 005ECFA0    db          0
 005ECFA0    db          0
 005ECFA0    db          0
 005ECFA0    db          0
 005ECFA0    db          0
 005ECFA0    db          8
 005ECFA0    dd          005ED223
 005ECFA0    dd          005ECFF7
 005ECFA0    dd          005ED03A
 005ECFA0    dd          005ED07D
 005ECFA0    dd          005ED0DB
 005ECFA0    dd          005ED139
 005ECFA0    dd          005ED156
 005ECFA0    dd          005ED173
 005ECFA0    dd          005ED190
 005ECFA0    dd          005ED1AA
 005ECFA0    dd          005ED1CC
 005ECFA0    dd          005ED1EE
 005ECFA0    dd          005ED206
 005ECFF7    mov         dword ptr [ebp-18],8001
 005ECFFE    fld         qword ptr [ebp+8]
 005ED001    fmul        dword ptr ds:[5ED58C];65535:Single
 005ED007    call        @ROUND
 005ED00C    mov         dword ptr [ebp-24],eax
 005ED00F    mov         eax,[0078DB00];^Screen:TScreen
 005ED014    mov         eax,dword ptr [eax]
 005ED016    call        TScreen.GetHeight
 005ED01B    dec         eax
 005ED01C    mov         dword ptr [ebp-2C],eax
 005ED01F    fild        dword ptr [ebp-2C]
 005ED022    fild        dword ptr [ebp-8]
 005ED025    fdivrp      st(1),st
 005ED027    fmul        dword ptr ds:[5ED58C];65535:Single
 005ED02D    call        @ROUND
 005ED032    mov         dword ptr [ebp-20],eax
>005ED035    jmp         005ED228
 005ED03A    mov         dword ptr [ebp-18],8001
 005ED041    mov         eax,[0078DB00];^Screen:TScreen
 005ED046    mov         eax,dword ptr [eax]
 005ED048    call        TScreen.GetWidth
 005ED04D    dec         eax
 005ED04E    mov         dword ptr [ebp-2C],eax
 005ED051    fild        dword ptr [ebp-2C]
 005ED054    fild        dword ptr [ebp-0C]
 005ED057    fdivrp      st(1),st
 005ED059    fmul        dword ptr ds:[5ED58C];65535:Single
 005ED05F    call        @ROUND
 005ED064    mov         dword ptr [ebp-24],eax
 005ED067    fld         qword ptr [ebp+8]
 005ED06A    fmul        dword ptr ds:[5ED58C];65535:Single
 005ED070    call        @ROUND
 005ED075    mov         dword ptr [ebp-20],eax
>005ED078    jmp         005ED228
 005ED07D    mov         dword ptr [ebp-18],0C001
 005ED084    fld         qword ptr [ebp+8]
 005ED087    fmul        dword ptr ds:[5ED58C];65535:Single
 005ED08D    call        @ROUND
 005ED092    mov         dword ptr [ebp-24],eax
 005ED095    mov         eax,[0078DB00];^Screen:TScreen
 005ED09A    mov         eax,dword ptr [eax]
 005ED09C    call        TScreen.GetDesktopTop
 005ED0A1    mov         edx,dword ptr [ebp-8]
 005ED0A4    sub         edx,eax
 005ED0A6    mov         dword ptr [ebp-2C],edx
 005ED0A9    fild        dword ptr [ebp-2C]
 005ED0AC    fstp        tbyte ptr [ebp-40]
 005ED0AF    wait
 005ED0B0    mov         eax,[0078DB00];^Screen:TScreen
 005ED0B5    mov         eax,dword ptr [eax]
 005ED0B7    call        TScreen.GetDesktopHeight
 005ED0BC    dec         eax
 005ED0BD    mov         dword ptr [ebp-44],eax
 005ED0C0    fild        dword ptr [ebp-44]
 005ED0C3    fld         tbyte ptr [ebp-40]
 005ED0C6    fdivrp      st(1),st
 005ED0C8    fmul        dword ptr ds:[5ED58C];65535:Single
 005ED0CE    call        @ROUND
 005ED0D3    mov         dword ptr [ebp-20],eax
>005ED0D6    jmp         005ED228
 005ED0DB    mov         dword ptr [ebp-18],0C001
 005ED0E2    mov         eax,[0078DB00];^Screen:TScreen
 005ED0E7    mov         eax,dword ptr [eax]
 005ED0E9    call        TScreen.GetDesktopLeft
 005ED0EE    mov         edx,dword ptr [ebp-0C]
 005ED0F1    sub         edx,eax
 005ED0F3    mov         dword ptr [ebp-2C],edx
 005ED0F6    fild        dword ptr [ebp-2C]
 005ED0F9    fstp        tbyte ptr [ebp-40]
 005ED0FC    wait
 005ED0FD    mov         eax,[0078DB00];^Screen:TScreen
 005ED102    mov         eax,dword ptr [eax]
 005ED104    call        TScreen.GetDesktopWidth
 005ED109    dec         eax
 005ED10A    mov         dword ptr [ebp-44],eax
 005ED10D    fild        dword ptr [ebp-44]
 005ED110    fld         tbyte ptr [ebp-40]
 005ED113    fdivrp      st(1),st
 005ED115    fmul        dword ptr ds:[5ED58C];65535:Single
 005ED11B    call        @ROUND
 005ED120    mov         dword ptr [ebp-24],eax
 005ED123    fld         qword ptr [ebp+8]
 005ED126    fmul        dword ptr ds:[5ED58C];65535:Single
 005ED12C    call        @ROUND
 005ED131    mov         dword ptr [ebp-20],eax
>005ED134    jmp         005ED228
 005ED139    mov         dword ptr [ebp-18],1
 005ED140    fld         qword ptr [ebp+8]
 005ED143    fsub        qword ptr ds:[78BC58];gvar_0078BC58:Double
 005ED149    call        @ROUND
 005ED14E    mov         dword ptr [ebp-24],eax
>005ED151    jmp         005ED228
 005ED156    mov         dword ptr [ebp-18],1
 005ED15D    fld         qword ptr [ebp+8]
 005ED160    fsub        qword ptr ds:[78BC60];gvar_0078BC60:Double
 005ED166    call        @ROUND
 005ED16B    mov         dword ptr [ebp-20],eax
>005ED16E    jmp         005ED228
 005ED173    mov         dword ptr [ebp-18],800
 005ED17A    fld         qword ptr [ebp+8]
 005ED17D    fsub        qword ptr ds:[78BC68];gvar_0078BC68:Double
 005ED183    call        @ROUND
 005ED188    mov         dword ptr [ebp-1C],eax
>005ED18B    jmp         005ED228
 005ED190    mov         dword ptr [ebp-18],1000
 005ED197    fld         qword ptr [ebp+8]
 005ED19A    fsub        qword ptr ds:[78BC70];gvar_0078BC70:Double
 005ED1A0    call        @ROUND
 005ED1A5    mov         dword ptr [ebp-1C],eax
>005ED1A8    jmp         005ED228
 005ED1AA    lea         eax,[ebp-0C]
 005ED1AD    push        eax
 005ED1AE    call        user32.GetCursorPos
 005ED1B3    fld         qword ptr [ebp+8]
 005ED1B6    call        @ROUND
 005ED1BB    mov         ebx,eax
 005ED1BD    mov         dword ptr [ebp-0C],ebx
 005ED1C0    mov         eax,dword ptr [ebp-8]
 005ED1C3    push        eax
 005ED1C4    push        ebx
 005ED1C5    call        user32.SetCursorPos
>005ED1CA    jmp         005ED228
 005ED1CC    lea         eax,[ebp-0C]
 005ED1CF    push        eax
 005ED1D0    call        user32.GetCursorPos
 005ED1D5    fld         qword ptr [ebp+8]
 005ED1D8    call        @ROUND
 005ED1DD    mov         ebx,eax
 005ED1DF    mov         dword ptr [ebp-8],ebx
 005ED1E2    push        ebx
 005ED1E3    mov         eax,dword ptr [ebp-0C]
 005ED1E6    push        eax
 005ED1E7    call        user32.SetCursorPos
>005ED1EC    jmp         005ED228
 005ED1EE    fld         qword ptr [ebp+8]
 005ED1F1    call        @ROUND
 005ED1F6    call        005EB594
 005ED1FB    test        eax,eax
>005ED1FD    je          005ED228
 005ED1FF    call        005EE140
>005ED204    jmp         005ED228
 005ED206    fld         qword ptr [ebp+8]
 005ED209    call        @ROUND
 005ED20E    call        005EB4B4
 005ED213    mov         edx,eax
 005ED215    mov         eax,[0078DB00];^Screen:TScreen
 005ED21A    mov         eax,dword ptr [eax]
 005ED21C    call        TScreen.SetCursor
>005ED221    jmp         005ED228
 005ED223    xor         eax,eax
 005ED225    mov         dword ptr [ebp-18],eax
 005ED228    xor         eax,eax
 005ED22A    mov         dword ptr [ebp-14],eax
 005ED22D    xor         eax,eax
 005ED22F    mov         dword ptr [ebp-10],eax
 005ED232    cmp         dword ptr [ebp-18],0
>005ED236    je          005ED24D
 005ED238    push        1C
 005ED23A    lea         eax,[ebp-28]
 005ED23D    push        eax
 005ED23E    push        1
 005ED240    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005ED245    mov         eax,dword ptr [eax]
 005ED247    call        eax
 005ED249    mov         edi,eax
>005ED24B    jmp         005ED252
 005ED24D    mov         edi,1
 005ED252    dec         edi
 005ED253    sete        byte ptr [ebp-1]
 005ED257    mov         eax,dword ptr [ebp+8]
 005ED25A    mov         dword ptr [esi+8],eax;TMouseValue.PreviousValue:Double
 005ED25D    mov         eax,dword ptr [ebp+0C]
 005ED260    mov         dword ptr [esi+0C],eax;TMouseValue.?fC:dword
>005ED263    jmp         005ED57F
 005ED268    push        dword ptr [ebp+0C]
 005ED26B    push        dword ptr [ebp+8]
 005ED26E    call        00686060
 005ED273    mov         ebx,eax
 005ED275    cmp         byte ptr [esi+10],0;TMouseValue.Iffy:Boolean
>005ED279    je          005ED311
 005ED27F    mov         byte ptr [ebp-1],1
 005ED283    movzx       eax,byte ptr [esi+20];TMouseValue................................................Item:by...
 005ED287    cmp         eax,5
>005ED28A    ja          005ED311
 005ED290    jmp         dword ptr [eax*4+5ED297]
 005ED290    dd          005ED311
 005ED290    dd          005ED2AF
 005ED290    dd          005ED2C3
 005ED290    dd          005ED2D7
 005ED290    dd          005ED2EB
 005ED290    dd          005ED2FF
 005ED2AF    test        byte ptr ds:[8162B0],80;gvar_008162B0
 005ED2B6    setne       al
 005ED2B9    cmp         bl,al
>005ED2BB    je          005ED57F
>005ED2C1    jmp         005ED311
 005ED2C3    test        byte ptr ds:[8162B1],80;gvar_008162B1
 005ED2CA    setne       al
 005ED2CD    cmp         bl,al
>005ED2CF    je          005ED57F
>005ED2D5    jmp         005ED311
 005ED2D7    test        byte ptr ds:[8162B2],80;gvar_008162B2
 005ED2DE    setne       al
 005ED2E1    cmp         bl,al
>005ED2E3    je          005ED57F
>005ED2E9    jmp         005ED311
 005ED2EB    test        byte ptr ds:[8162B3],80;gvar_008162B3
 005ED2F2    setne       al
 005ED2F5    cmp         bl,al
>005ED2F7    je          005ED57F
>005ED2FD    jmp         005ED311
 005ED2FF    test        byte ptr ds:[8162B4],80;gvar_008162B4
 005ED306    setne       al
 005ED309    cmp         bl,al
>005ED30B    je          005ED57F
 005ED311    cmp         byte ptr [esi+10],0;TMouseValue.Iffy:Boolean
>005ED315    jne         005ED32A
 005ED317    push        dword ptr [esi+0C];TMouseValue.?fC:dword
 005ED31A    push        dword ptr [esi+8];TMouseValue.PreviousValue:Double
 005ED31D    call        00686060
 005ED322    cmp         bl,al
>005ED324    je          005ED570
 005ED32A    xor         eax,eax
 005ED32C    mov         dword ptr [ebp-28],eax
 005ED32F    xor         eax,eax
 005ED331    mov         dword ptr [ebp-24],eax
 005ED334    xor         eax,eax
 005ED336    mov         dword ptr [ebp-20],eax
 005ED339    xor         eax,eax
 005ED33B    mov         dword ptr [ebp-1C],eax
 005ED33E    xor         eax,eax
 005ED340    mov         dword ptr [ebp-18],eax
 005ED343    movzx       eax,byte ptr [esi+20];TMouseValue.................................................Item:b...
 005ED347    cmp         eax,29
>005ED34A    ja          005ED53A
 005ED350    movzx       eax,byte ptr [eax+5ED35E]
 005ED357    jmp         dword ptr [eax*4+5ED388]
 005ED357    db          0
 005ED357    db          1
 005ED357    db          2
 005ED357    db          3
 005ED357    db          4
 005ED357    db          5
 005ED357    db          9
 005ED357    db          10
 005ED357    db          0
 005ED357    db          0
 005ED357    db          0
 005ED357    db          0
 005ED357    db          0
 005ED357    db          0
 005ED357    db          6
 005ED357    db          7
 005ED357    db          8
 005ED357    db          0
 005ED357    db          0
 005ED357    db          0
 005ED357    db          0
 005ED357    db          0
 005ED357    db          0
 005ED357    db          0
 005ED357    db          0
 005ED357    db          13
 005ED357    db          0
 005ED357    db          0
 005ED357    db          0
 005ED357    db          0
 005ED357    db          0
 005ED357    db          0
 005ED357    db          0
 005ED357    db          0
 005ED357    db          0
 005ED357    db          0
 005ED357    db          11
 005ED357    db          12
 005ED357    db          14
 005ED357    db          16
 005ED357    db          15
 005ED357    db          17
 005ED357    dd          005ED53A
 005ED357    dd          005ED3D0
 005ED357    dd          005ED3EC
 005ED357    dd          005ED408
 005ED357    dd          005ED424
 005ED357    dd          005ED444
 005ED357    dd          005ED464
 005ED357    dd          005ED484
 005ED357    dd          005ED4A4
 005ED357    dd          005ED4C1
 005ED357    dd          005ED4D5
 005ED357    dd          005ED4E9
 005ED357    dd          005ED4FD
 005ED357    dd          005ED511
 005ED357    dd          005ED51A
 005ED357    dd          005ED522
 005ED357    dd          005ED52A
 005ED357    dd          005ED532
 005ED3D0    test        bl,bl
>005ED3D2    je          005ED3E0
 005ED3D4    mov         dword ptr [ebp-18],2
>005ED3DB    jmp         005ED53F
 005ED3E0    mov         dword ptr [ebp-18],4
>005ED3E7    jmp         005ED53F
 005ED3EC    test        bl,bl
>005ED3EE    je          005ED3FC
 005ED3F0    mov         dword ptr [ebp-18],8
>005ED3F7    jmp         005ED53F
 005ED3FC    mov         dword ptr [ebp-18],10
>005ED403    jmp         005ED53F
 005ED408    test        bl,bl
>005ED40A    je          005ED418
 005ED40C    mov         dword ptr [ebp-18],20
>005ED413    jmp         005ED53F
 005ED418    mov         dword ptr [ebp-18],40
>005ED41F    jmp         005ED53F
 005ED424    test        bl,bl
>005ED426    je          005ED431
 005ED428    mov         dword ptr [ebp-18],80
>005ED42F    jmp         005ED438
 005ED431    mov         dword ptr [ebp-18],100
 005ED438    mov         dword ptr [ebp-1C],1
>005ED43F    jmp         005ED53F
 005ED444    test        bl,bl
>005ED446    je          005ED451
 005ED448    mov         dword ptr [ebp-18],80
>005ED44F    jmp         005ED458
 005ED451    mov         dword ptr [ebp-18],100
 005ED458    mov         dword ptr [ebp-1C],2
>005ED45F    jmp         005ED53F
 005ED464    test        bl,bl
>005ED466    je          005ED471
 005ED468    mov         dword ptr [ebp-18],80
>005ED46F    jmp         005ED478
 005ED471    mov         dword ptr [ebp-18],100
 005ED478    mov         dword ptr [ebp-1C],4
>005ED47F    jmp         005ED53F
 005ED484    test        bl,bl
>005ED486    je          005ED491
 005ED488    mov         dword ptr [ebp-18],80
>005ED48F    jmp         005ED498
 005ED491    mov         dword ptr [ebp-18],100
 005ED498    mov         dword ptr [ebp-1C],8
>005ED49F    jmp         005ED53F
 005ED4A4    test        bl,bl
>005ED4A6    je          005ED4B1
 005ED4A8    mov         dword ptr [ebp-18],80
>005ED4AF    jmp         005ED4B8
 005ED4B1    mov         dword ptr [ebp-18],100
 005ED4B8    mov         dword ptr [ebp-1C],10
>005ED4BF    jmp         005ED53F
 005ED4C1    test        bl,bl
>005ED4C3    je          005ED53F
 005ED4C5    mov         dword ptr [ebp-18],800
 005ED4CC    mov         dword ptr [ebp-1C],78
>005ED4D3    jmp         005ED53F
 005ED4D5    test        bl,bl
>005ED4D7    je          005ED53F
 005ED4D9    mov         dword ptr [ebp-18],800
 005ED4E0    mov         dword ptr [ebp-1C],0FFFFFF88
>005ED4E7    jmp         005ED53F
 005ED4E9    test        bl,bl
>005ED4EB    je          005ED53F
 005ED4ED    mov         dword ptr [ebp-18],1000
 005ED4F4    mov         dword ptr [ebp-1C],0FFFFFF88
>005ED4FB    jmp         005ED53F
 005ED4FD    test        bl,bl
>005ED4FF    je          005ED53F
 005ED501    mov         dword ptr [ebp-18],1000
 005ED508    mov         dword ptr [ebp-1C],78
>005ED50F    jmp         005ED53F
 005ED511    mov         eax,ebx
 005ED513    call        005EE1A4
>005ED518    jmp         005ED53F
 005ED51A    mov         byte ptr ds:[816240],bl;gvar_00816240:Boolean
>005ED520    jmp         005ED53F
 005ED522    mov         byte ptr ds:[816241],bl;gvar_00816241:Boolean
>005ED528    jmp         005ED53F
 005ED52A    mov         byte ptr ds:[816243],bl;gvar_00816243:Boolean
>005ED530    jmp         005ED53F
 005ED532    mov         byte ptr ds:[816242],bl;gvar_00816242:Boolean
>005ED538    jmp         005ED53F
 005ED53A    xor         eax,eax
 005ED53C    mov         dword ptr [ebp-18],eax
 005ED53F    xor         eax,eax
 005ED541    mov         dword ptr [ebp-14],eax
 005ED544    xor         eax,eax
 005ED546    mov         dword ptr [ebp-10],eax
 005ED549    cmp         dword ptr [ebp-18],0
>005ED54D    je          005ED564
 005ED54F    push        1C
 005ED551    lea         eax,[ebp-28]
 005ED554    push        eax
 005ED555    push        1
 005ED557    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005ED55C    mov         eax,dword ptr [eax]
 005ED55E    call        eax
 005ED560    mov         edi,eax
>005ED562    jmp         005ED569
 005ED564    mov         edi,1
 005ED569    dec         edi
 005ED56A    sete        byte ptr [ebp-1]
>005ED56E    jmp         005ED574
 005ED570    mov         byte ptr [ebp-1],1
 005ED574    mov         eax,ebx
 005ED576    call        00686074
 005ED57B    fstp        qword ptr [esi+8];TMouseValue.PreviousValue:Double
 005ED57E    wait
 005ED57F    movzx       eax,byte ptr [ebp-1]
 005ED583    pop         edi
 005ED584    pop         esi
 005ED585    pop         ebx
 005ED586    mov         esp,ebp
 005ED588    pop         ebp
 005ED589    ret         8
end;*}

//005ED590
{*function sub_005ED590:?;
begin
 005ED590    cmp         byte ptr ds:[8161F8],0;gvar_008161F8
>005ED597    je          005ED5A2
 005ED599    call        005ED7D8
 005ED59E    test        al,al
>005ED5A0    je          005ED5A5
 005ED5A2    xor         eax,eax
 005ED5A4    ret
 005ED5A5    cmp         byte ptr ds:[8161FA],0;gvar_008161FA
>005ED5AC    je          005ED5B3
 005ED5AE    call        005EE3E4
 005ED5B3    mov         eax,78BCF8;gvar_0078BCF8:IInterface
 005ED5B8    call        @IntfClear
 005ED5BD    mov         eax,5ED6D4;'Mouse'
 005ED5C2    call        005FCBA0
 005ED5C7    cmp         byte ptr ds:[8161F9],0;gvar_008161F9
>005ED5CE    jne         005ED640
 005ED5D0    push        0
 005ED5D2    mov         eax,78BCF8;gvar_0078BCF8:IInterface
 005ED5D7    call        @IntfClear
 005ED5DC    push        eax
 005ED5DD    mov         eax,[0078D69C];^gvar_0078A0E8
 005ED5E2    push        eax
 005ED5E3    mov         eax,[0078D628];^gvar_0078BD08:IInterface
 005ED5E8    mov         eax,dword ptr [eax]
 005ED5EA    push        eax
 005ED5EB    mov         eax,dword ptr [eax]
 005ED5ED    call        dword ptr [eax+0C]
 005ED5F0    call        OleCheck
 005ED5F5    push        0A
 005ED5F7    mov         eax,[0078D590];^Application:TApplication
 005ED5FC    mov         eax,dword ptr [eax]
 005ED5FE    mov         eax,dword ptr [eax+170];TApplication.FHandle:HWND
 005ED604    push        eax
 005ED605    mov         eax,[0078BCF8];0x0 gvar_0078BCF8:IInterface
 005ED60A    push        eax
 005ED60B    mov         eax,dword ptr [eax]
 005ED60D    call        dword ptr [eax+34]
 005ED610    call        OleCheck
 005ED615    mov         eax,[0078D120];^gvar_0078A1C8
 005ED61A    push        eax
 005ED61B    mov         eax,[0078BCF8];0x0 gvar_0078BCF8:IInterface
 005ED620    push        eax
 005ED621    mov         eax,dword ptr [eax]
 005ED623    call        dword ptr [eax+2C]
 005ED626    call        OleCheck
 005ED62B    mov         eax,[0078BCF8];0x0 gvar_0078BCF8:IInterface
 005ED630    push        eax
 005ED631    mov         eax,dword ptr [eax]
 005ED633    call        dword ptr [eax+1C]
 005ED636    call        OleCheck
>005ED63B    jmp         005ED6C2
 005ED640    mov         eax,[0078D818];^gvar_0078BD00:HWND
 005ED645    mov         eax,dword ptr [eax]
 005ED647    call        005FD6CC
 005ED64C    test        eax,eax
>005ED64E    jne         005ED6C2
 005ED650    mov         byte ptr ds:[8161F9],0;gvar_008161F9
 005ED657    push        0
 005ED659    mov         eax,78BCF8;gvar_0078BCF8:IInterface
 005ED65E    call        @IntfClear
 005ED663    push        eax
 005ED664    mov         eax,[0078D69C];^gvar_0078A0E8
 005ED669    push        eax
 005ED66A    mov         eax,[0078D628];^gvar_0078BD08:IInterface
 005ED66F    mov         eax,dword ptr [eax]
 005ED671    push        eax
 005ED672    mov         eax,dword ptr [eax]
 005ED674    call        dword ptr [eax+0C]
 005ED677    call        OleCheck
 005ED67C    push        0A
 005ED67E    mov         eax,[0078D590];^Application:TApplication
 005ED683    mov         eax,dword ptr [eax]
 005ED685    mov         eax,dword ptr [eax+170];TApplication.FHandle:HWND
 005ED68B    push        eax
 005ED68C    mov         eax,[0078BCF8];0x0 gvar_0078BCF8:IInterface
 005ED691    push        eax
 005ED692    mov         eax,dword ptr [eax]
 005ED694    call        dword ptr [eax+34]
 005ED697    call        OleCheck
 005ED69C    mov         eax,[0078D120];^gvar_0078A1C8
 005ED6A1    push        eax
 005ED6A2    mov         eax,[0078BCF8];0x0 gvar_0078BCF8:IInterface
 005ED6A7    push        eax
 005ED6A8    mov         eax,dword ptr [eax]
 005ED6AA    call        dword ptr [eax+2C]
 005ED6AD    call        OleCheck
 005ED6B2    mov         eax,[0078BCF8];0x0 gvar_0078BCF8:IInterface
 005ED6B7    push        eax
 005ED6B8    mov         eax,dword ptr [eax]
 005ED6BA    call        dword ptr [eax+1C]
 005ED6BD    call        OleCheck
 005ED6C2    mov         al,1
 005ED6C4    ret
end;*}

//005ED6E0
{*function sub_005ED6E0:?;
begin
 005ED6E0    push        ebp
 005ED6E1    mov         ebp,esp
 005ED6E3    push        ebx
 005ED6E4    push        esi
 005ED6E5    push        edi
 005ED6E6    mov         eax,[0078CBA8];^gvar_008161E8:TCursorForm
 005ED6EB    mov         eax,dword ptr [eax]
 005ED6ED    call        TCustomForm.Hide
 005ED6F2    mov         byte ptr ds:[816240],0;gvar_00816240:Boolean
 005ED6F9    mov         byte ptr ds:[816243],0;gvar_00816243:Boolean
 005ED700    mov         byte ptr ds:[816241],0;gvar_00816241:Boolean
 005ED707    mov         byte ptr ds:[816242],0;gvar_00816242:Boolean
 005ED70E    cmp         byte ptr ds:[8161FA],0;gvar_008161FA
>005ED715    je          005ED71C
 005ED717    call        005EE43C
 005ED71C    push        0FF
 005ED71E    call        user32.ShowCursor
 005ED723    mov         al,1
 005ED725    call        005EE1A4
 005ED72A    mov         byte ptr ds:[8161FA],0;gvar_008161FA
 005ED731    xor         eax,eax
 005ED733    push        ebp
 005ED734    push        5ED7AD
 005ED739    push        dword ptr fs:[eax]
 005ED73C    mov         dword ptr fs:[eax],esp
 005ED73F    cmp         byte ptr ds:[8161F8],0;gvar_008161F8
>005ED746    je          005ED751
 005ED748    call        005ED7D8
 005ED74D    test        al,al
>005ED74F    jne         005ED75D
 005ED751    xor         ebx,ebx
 005ED753    xor         eax,eax
 005ED755    pop         edx
 005ED756    pop         ecx
 005ED757    pop         ecx
 005ED758    mov         dword ptr fs:[eax],edx
>005ED75B    jmp         005ED7B9
 005ED75D    cmp         byte ptr ds:[8161F9],0;gvar_008161F9
>005ED764    je          005ED774
 005ED766    call        005FD5B0
 005ED76B    mov         byte ptr ds:[8161F9],0;gvar_008161F9
>005ED772    jmp         005ED78D
 005ED774    cmp         dword ptr ds:[78BCF8],0;gvar_0078BCF8:IInterface
>005ED77B    je          005ED78D
 005ED77D    mov         eax,[0078BCF8];0x0 gvar_0078BCF8:IInterface
 005ED782    push        eax
 005ED783    mov         eax,dword ptr [eax]
 005ED785    call        dword ptr [eax+20]
 005ED788    call        OleCheck
 005ED78D    mov         eax,78BCF8;gvar_0078BCF8:IInterface
 005ED792    call        @IntfClear
 005ED797    mov         eax,5ED7CC;'Mouse'
 005ED79C    call        005FCC94
 005ED7A1    mov         bl,1
 005ED7A3    xor         eax,eax
 005ED7A5    pop         edx
 005ED7A6    pop         ecx
 005ED7A7    pop         ecx
 005ED7A8    mov         dword ptr fs:[eax],edx
>005ED7AB    jmp         005ED7B9
>005ED7AD    jmp         @HandleAnyException
 005ED7B2    xor         ebx,ebx
 005ED7B4    call        @DoneExcept
 005ED7B9    mov         eax,ebx
 005ED7BB    pop         edi
 005ED7BC    pop         esi
 005ED7BD    pop         ebx
 005ED7BE    pop         ebp
 005ED7BF    ret
end;*}

//005ED7D8
{*function sub_005ED7D8:?;
begin
 005ED7D8    call        005FCB94
 005ED7DD    test        al,al
>005ED7DF    je          005ED7F4
 005ED7E1    cmp         dword ptr ds:[78BCF8],0;gvar_0078BCF8:IInterface
>005ED7E8    jne         005ED7F7
 005ED7EA    mov         eax,[0078D370];^gvar_0078BD10
 005ED7EF    cmp         byte ptr [eax],0
>005ED7F2    jne         005ED7F7
 005ED7F4    xor         eax,eax
 005ED7F6    ret
 005ED7F7    mov         al,1
 005ED7F9    ret
end;*}

//005ED7FC
{*procedure sub_005ED7FC(?:?);
begin
 005ED7FC    push        ebx
 005ED7FD    add         esp,0FFFFFFD8
 005ED800    mov         ebx,eax
 005ED802    call        005ED7D8
 005ED807    test        al,al
>005ED809    jne         005ED812
 005ED80B    xor         eax,eax
>005ED80D    jmp         005EDA53
 005ED812    push        ebx
 005ED813    push        14
 005ED815    mov         eax,[0078BCF8];0x0 gvar_0078BCF8:IInterface
 005ED81A    push        eax
 005ED81B    mov         eax,dword ptr [eax]
 005ED81D    call        dword ptr [eax+24]
 005ED820    fld         qword ptr ds:[78BC70];gvar_0078BC70:Double
 005ED826    call        @ROUND
 005ED82B    mov         [008162B8],eax;gvar_008162B8:Single
 005ED830    fld         qword ptr ds:[78BC68];gvar_0078BC68:Double
 005ED836    call        @ROUND
 005ED83B    mov         [008162BC],eax;gvar_008162BC:Single
 005ED840    fild        dword ptr [ebx]
 005ED842    fadd        qword ptr ds:[78BC58];gvar_0078BC58:Double
 005ED848    fstp        qword ptr ds:[78BC58];gvar_0078BC58:Double
 005ED84E    wait
 005ED84F    fild        dword ptr [ebx+4]
 005ED852    fadd        qword ptr ds:[78BC60];gvar_0078BC60:Double
 005ED858    fstp        qword ptr ds:[78BC60];gvar_0078BC60:Double
 005ED85E    wait
 005ED85F    fild        dword ptr [ebx]
 005ED861    fstp        qword ptr [esp]
 005ED864    wait
 005ED865    fild        dword ptr [ebx+4]
 005ED868    fstp        qword ptr [esp+8]
 005ED86C    wait
 005ED86D    fild        word ptr [ebx+8]
 005ED870    fstp        qword ptr [esp+10]
 005ED874    wait
 005ED875    push        dword ptr [esp+4]
 005ED879    push        dword ptr [esp+4]
 005ED87D    call        004553A0
 005ED882    push        eax
 005ED883    push        dword ptr ds:[78BCBC];gvar_0078BCBC
 005ED889    push        dword ptr ds:[78BCB8];gvar_0078BCB8:Double
 005ED88F    call        004553A0
 005ED894    pop         edx
 005ED895    cmp         dl,al
>005ED897    jne         005ED8ED
 005ED899    fld         qword ptr [esp]
 005ED89C    fabs
 005ED89E    fstp        tbyte ptr [esp+18]
 005ED8A2    wait
 005ED8A3    fld         qword ptr ds:[78BCB8];gvar_0078BCB8:Double
 005ED8A9    fabs
 005ED8AB    fld         tbyte ptr [esp+18]
 005ED8AF    fcompp
 005ED8B1    wait
 005ED8B2    fnstsw      al
 005ED8B4    sahf
>005ED8B5    jbe         005ED8D4
 005ED8B7    fld         qword ptr [esp]
 005ED8BA    fsub        qword ptr ds:[78BCB8];gvar_0078BCB8:Double
 005ED8C0    fstp        qword ptr [esp]
 005ED8C3    wait
 005ED8C4    xor         eax,eax
 005ED8C6    mov         dword ptr ds:[78BCB8],eax;gvar_0078BCB8:Double
 005ED8CC    mov         dword ptr ds:[78BCBC],eax;gvar_0078BCBC
>005ED8D2    jmp         005ED8ED
 005ED8D4    fld         qword ptr ds:[78BCB8];gvar_0078BCB8:Double
 005ED8DA    fsub        qword ptr [esp]
 005ED8DD    fstp        qword ptr ds:[78BCB8];gvar_0078BCB8:Double
 005ED8E3    wait
 005ED8E4    xor         eax,eax
 005ED8E6    mov         dword ptr [esp],eax
 005ED8E9    mov         dword ptr [esp+4],eax
 005ED8ED    push        dword ptr [esp+0C]
 005ED8F1    push        dword ptr [esp+0C]
 005ED8F5    call        004553A0
 005ED8FA    push        eax
 005ED8FB    push        dword ptr ds:[78BCC4];gvar_0078BCC4
 005ED901    push        dword ptr ds:[78BCC0];gvar_0078BCC0:Double
 005ED907    call        004553A0
 005ED90C    pop         edx
 005ED90D    cmp         dl,al
>005ED90F    jne         005ED96A
 005ED911    fld         qword ptr [esp+8]
 005ED915    fabs
 005ED917    fstp        tbyte ptr [esp+18]
 005ED91B    wait
 005ED91C    fld         qword ptr ds:[78BCC0];gvar_0078BCC0:Double
 005ED922    fabs
 005ED924    fld         tbyte ptr [esp+18]
 005ED928    fcompp
 005ED92A    wait
 005ED92B    fnstsw      al
 005ED92D    sahf
>005ED92E    jbe         005ED94F
 005ED930    fld         qword ptr [esp+8]
 005ED934    fsub        qword ptr ds:[78BCC0];gvar_0078BCC0:Double
 005ED93A    fstp        qword ptr [esp+8]
 005ED93E    wait
 005ED93F    xor         eax,eax
 005ED941    mov         dword ptr ds:[78BCC0],eax;gvar_0078BCC0:Double
 005ED947    mov         dword ptr ds:[78BCC4],eax;gvar_0078BCC4
>005ED94D    jmp         005ED96A
 005ED94F    fld         qword ptr ds:[78BCC0];gvar_0078BCC0:Double
 005ED955    fsub        qword ptr [esp+8]
 005ED959    fstp        qword ptr ds:[78BCC0];gvar_0078BCC0:Double
 005ED95F    wait
 005ED960    xor         eax,eax
 005ED962    mov         dword ptr [esp+8],eax
 005ED966    mov         dword ptr [esp+0C],eax
 005ED96A    push        dword ptr [esp+14]
 005ED96E    push        dword ptr [esp+14]
 005ED972    call        004553A0
 005ED977    push        eax
 005ED978    push        dword ptr ds:[78BCCC];gvar_0078BCCC
 005ED97E    push        dword ptr ds:[78BCC8];gvar_0078BCC8:Double
 005ED984    call        004553A0
 005ED989    pop         edx
 005ED98A    cmp         dl,al
>005ED98C    jne         005ED9E7
 005ED98E    fld         qword ptr [esp+10]
 005ED992    fabs
 005ED994    fstp        tbyte ptr [esp+18]
 005ED998    wait
 005ED999    fld         qword ptr ds:[78BCC8];gvar_0078BCC8:Double
 005ED99F    fabs
 005ED9A1    fld         tbyte ptr [esp+18]
 005ED9A5    fcompp
 005ED9A7    wait
 005ED9A8    fnstsw      al
 005ED9AA    sahf
>005ED9AB    jbe         005ED9CC
 005ED9AD    fld         qword ptr [esp+10]
 005ED9B1    fsub        qword ptr ds:[78BCC8];gvar_0078BCC8:Double
 005ED9B7    fstp        qword ptr [esp+10]
 005ED9BB    wait
 005ED9BC    xor         eax,eax
 005ED9BE    mov         dword ptr ds:[78BCC8],eax;gvar_0078BCC8:Double
 005ED9C4    mov         dword ptr ds:[78BCCC],eax;gvar_0078BCCC
>005ED9CA    jmp         005ED9E7
 005ED9CC    fld         qword ptr ds:[78BCC8];gvar_0078BCC8:Double
 005ED9D2    fsub        qword ptr [esp+10]
 005ED9D6    fstp        qword ptr ds:[78BCC8];gvar_0078BCC8:Double
 005ED9DC    wait
 005ED9DD    xor         eax,eax
 005ED9DF    mov         dword ptr [esp+10],eax
 005ED9E3    mov         dword ptr [esp+14],eax
 005ED9E7    fld         qword ptr ds:[78BC78];gvar_0078BC78:Double
 005ED9ED    fadd        qword ptr [esp]
 005ED9F0    fstp        qword ptr ds:[78BC78];gvar_0078BC78:Double
 005ED9F6    wait
 005ED9F7    fld         qword ptr ds:[78BC80];gvar_0078BC80:Double
 005ED9FD    fadd        qword ptr [esp+8]
 005EDA01    fstp        qword ptr ds:[78BC80];gvar_0078BC80:Double
 005EDA07    wait
 005EDA08    fld         qword ptr ds:[78BC88];gvar_0078BC88:Double
 005EDA0E    fadd        qword ptr [esp+10]
 005EDA12    fstp        qword ptr ds:[78BC88];gvar_0078BC88:Double
 005EDA18    wait
 005EDA19    fild        word ptr [ebx+8]
 005EDA1C    fadd        qword ptr ds:[78BC68];gvar_0078BC68:Double
 005EDA22    fstp        qword ptr ds:[78BC68];gvar_0078BC68:Double
 005EDA28    wait
 005EDA29    mov         eax,dword ptr [ebx+8]
 005EDA2C    shr         eax,10
 005EDA2F    cmp         ax,0FFFFFFFF
>005EDA33    jg          005EDA3B
 005EDA35    cmp         ax,0FFFFFFF1
>005EDA39    jge         005EDA51
 005EDA3B    mov         word ptr [esp+24],ax
 005EDA40    fild        word ptr [esp+24]
 005EDA44    fadd        qword ptr ds:[78BC70];gvar_0078BC70:Double
 005EDA4A    fstp        qword ptr ds:[78BC70];gvar_0078BC70:Double
 005EDA50    wait
 005EDA51    mov         al,1
 005EDA53    add         esp,28
 005EDA56    pop         ebx
 005EDA57    ret
end;*}

//005EDA58
{*function sub_005EDA58:?;
begin
 005EDA58    push        ebx
 005EDA59    push        esi
 005EDA5A    push        edi
 005EDA5B    push        ebp
 005EDA5C    cmp         byte ptr ds:[8161F9],0;gvar_008161F9
>005EDA63    je          005EDB94
 005EDA69    mov         ebx,8
 005EDA6E    mov         eax,8162B0;gvar_008162B0
 005EDA73    mov         byte ptr [eax],0
 005EDA76    inc         eax
 005EDA77    dec         ebx
>005EDA78    jne         005EDA73
 005EDA7A    xor         eax,eax
 005EDA7C    mov         [008162A4],eax;gvar_008162A4:Single
 005EDA81    xor         eax,eax
 005EDA83    mov         [008162A8],eax;gvar_008162A8:Single
 005EDA88    xor         eax,eax
 005EDA8A    mov         [008162AC],eax;gvar_008162AC
 005EDA8F    mov         edi,dword ptr ds:[78D89C];^gvar_008177F0
 005EDA95    mov         edi,dword ptr [edi]
 005EDA97    dec         edi
 005EDA98    test        edi,edi
>005EDA9A    jl          005EDB5C
 005EDAA0    inc         edi
 005EDAA1    mov         eax,[0078D46C];^gvar_00816EAC
 005EDAA6    add         eax,18
 005EDAA9    mov         esi,8161FC;gvar_008161FC
 005EDAAE    mov         edx,dword ptr [eax]
 005EDAB0    mov         dword ptr [esi],edx
 005EDAB2    xor         edx,edx
 005EDAB4    mov         dword ptr [eax],edx
 005EDAB6    xor         ebx,ebx
 005EDAB8    mov         edx,8162B0;gvar_008162B0
 005EDABD    cmp         byte ptr [edx],80
>005EDAC0    jae         005EDAD4
 005EDAC2    mov         ecx,ebx
 005EDAC4    mov         ebp,1
 005EDAC9    shl         ebp,cl
 005EDACB    and         ebp,dword ptr [eax-4]
>005EDACE    ja          005EDAD4
 005EDAD0    xor         ecx,ecx
>005EDAD2    jmp         005EDAD6
 005EDAD4    mov         cl,1
 005EDAD6    shl         ecx,7
 005EDAD9    mov         byte ptr [edx],cl
 005EDADB    inc         ebx
 005EDADC    inc         edx
 005EDADD    cmp         ebx,8
>005EDAE0    jne         005EDABD
 005EDAE2    mov         edx,dword ptr [eax-14]
 005EDAE5    add         dword ptr ds:[8162A4],edx;gvar_008162A4:Single
 005EDAEB    mov         edx,dword ptr [eax-10]
 005EDAEE    add         dword ptr ds:[8162A8],edx;gvar_008162A8:Single
 005EDAF4    mov         edx,8162AC;gvar_008162AC
 005EDAF9    movzx       ecx,word ptr [eax-0C]
 005EDAFD    add         word ptr [edx],cx
 005EDB00    mov         edx,8162AC;gvar_008162AC
 005EDB05    add         edx,2
 005EDB08    movzx       ecx,word ptr [eax-8]
 005EDB0C    add         word ptr [edx],cx
 005EDB0F    fild        dword ptr [eax-0C]
 005EDB12    fadd        qword ptr ds:[78BC68];gvar_0078BC68:Double
 005EDB18    fstp        qword ptr ds:[78BC68];gvar_0078BC68:Double
 005EDB1E    wait
 005EDB1F    fild        dword ptr [eax-8]
 005EDB22    fadd        qword ptr ds:[78BC70];gvar_0078BC70:Double
 005EDB28    fstp        qword ptr ds:[78BC70];gvar_0078BC70:Double
 005EDB2E    wait
 005EDB2F    fild        dword ptr [eax-0C]
 005EDB32    fadd        qword ptr ds:[78BC88];gvar_0078BC88:Double
 005EDB38    fstp        qword ptr ds:[78BC88];gvar_0078BC88:Double
 005EDB3E    wait
 005EDB3F    fild        dword ptr [eax-8]
 005EDB42    fadd        qword ptr ds:[78BC90];gvar_0078BC90:Double
 005EDB48    fstp        qword ptr ds:[78BC90];gvar_0078BC90:Double
 005EDB4E    wait
 005EDB4F    add         esi,4
 005EDB52    add         eax,1C
 005EDB55    dec         edi
>005EDB56    jne         005EDAAE
 005EDB5C    fild        dword ptr ds:[8162A4];gvar_008162A4:Single
 005EDB62    fstp        qword ptr ds:[78BC58];gvar_0078BC58:Double
 005EDB68    wait
 005EDB69    fild        dword ptr ds:[8162A8];gvar_008162A8:Single
 005EDB6F    fstp        qword ptr ds:[78BC60];gvar_0078BC60:Double
 005EDB75    wait
 005EDB76    fild        dword ptr ds:[8162A4];gvar_008162A4:Single
 005EDB7C    fstp        qword ptr ds:[78BC78];gvar_0078BC78:Double
 005EDB82    wait
 005EDB83    fild        dword ptr ds:[8162A8];gvar_008162A8:Single
 005EDB89    fstp        qword ptr ds:[78BC80];gvar_0078BC80:Double
 005EDB8F    wait
 005EDB90    mov         al,1
>005EDB92    jmp         005EDBBE
 005EDB94    cmp         byte ptr ds:[8161F8],0;gvar_008161F8
>005EDB9B    je          005EDBBC
 005EDB9D    mov         eax,8162A4;gvar_008162A4:Single
 005EDBA2    test        eax,eax
>005EDBA4    jne         005EDBB0
 005EDBA6    mov         eax,5EDBD0;'What the?'
 005EDBAB    call        ShowMessage
 005EDBB0    mov         eax,8162A4;gvar_008162A4:Single
 005EDBB5    call        005ED7FC
>005EDBBA    jmp         005EDBBE
 005EDBBC    mov         al,1
 005EDBBE    pop         ebp
 005EDBBF    pop         edi
 005EDBC0    pop         esi
 005EDBC1    pop         ebx
 005EDBC2    ret
end;*}

//005EDBE4
{*function TMouseValue.SetVector(z:Double; ?:?; y:Double; ?:?; x:Double; ?:?):Boolean;
begin
 005EDBE4    push        ebp
 005EDBE5    mov         ebp,esp
 005EDBE7    add         esp,0FFFFFFD8
 005EDBEA    push        ebx
 005EDBEB    push        esi
 005EDBEC    mov         esi,eax
 005EDBEE    mov         eax,esi
 005EDBF0    mov         edx,dword ptr [eax]
 005EDBF2    call        dword ptr [edx+44];TMouseValue.GetDataType
 005EDBF5    cmp         al,5
>005EDBF7    je          005EDC25
 005EDBF9    push        dword ptr [ebp+1C]
 005EDBFC    push        dword ptr [ebp+18]
 005EDBFF    push        dword ptr [ebp+14]
 005EDC02    push        dword ptr [ebp+10]
 005EDC05    push        dword ptr [ebp+0C]
 005EDC08    push        dword ptr [ebp+8]
 005EDC0B    call        005C4070
 005EDC10    add         esp,0FFFFFFF8
 005EDC13    fstp        qword ptr [esp]
 005EDC16    wait
 005EDC17    mov         eax,esi
 005EDC19    mov         edx,dword ptr [eax]
 005EDC1B    call        dword ptr [edx+58];TMouseValue.SetValue
 005EDC1E    mov         ebx,eax
>005EDC20    jmp         005EDE5B
 005EDC25    lea         eax,[ebp-8]
 005EDC28    push        eax
 005EDC29    call        user32.GetCursorPos
 005EDC2E    xor         eax,eax
 005EDC30    mov         dword ptr [ebp-24],eax
 005EDC33    xor         eax,eax
 005EDC35    mov         dword ptr [ebp-20],eax
 005EDC38    xor         eax,eax
 005EDC3A    mov         dword ptr [ebp-1C],eax
 005EDC3D    xor         eax,eax
 005EDC3F    mov         dword ptr [ebp-18],eax
 005EDC42    xor         eax,eax
 005EDC44    mov         dword ptr [ebp-14],eax
 005EDC47    movzx       eax,byte ptr [esi+20];TMouseValue..................................................Item:...
 005EDC4B    add         eax,0FFFFFFE3
 005EDC4E    cmp         eax,15
>005EDC51    ja          005EDE0F
 005EDC57    movzx       eax,byte ptr [eax+5EDC65]
 005EDC5E    jmp         dword ptr [eax*4+5EDC7B]
 005EDC5E    db          6
 005EDC5E    db          1
 005EDC5E    db          2
 005EDC5E    db          3
 005EDC5E    db          4
 005EDC5E    db          0
 005EDC5E    db          0
 005EDC5E    db          0
 005EDC5E    db          0
 005EDC5E    db          0
 005EDC5E    db          0
 005EDC5E    db          0
 005EDC5E    db          0
 005EDC5E    db          0
 005EDC5E    db          0
 005EDC5E    db          0
 005EDC5E    db          0
 005EDC5E    db          0
 005EDC5E    db          0
 005EDC5E    db          0
 005EDC5E    db          0
 005EDC5E    db          5
 005EDC5E    dd          005EDE0F
 005EDC5E    dd          005EDC97
 005EDC5E    dd          005EDCC5
 005EDC5E    dd          005EDCF3
 005EDC5E    dd          005EDD21
 005EDC5E    dd          005EDD60
 005EDC5E    dd          005EDDF6
 005EDC97    mov         dword ptr [ebp-14],8001
 005EDC9E    fld         qword ptr [ebp+18]
 005EDCA1    fmul        dword ptr ds:[5EDE68];65535:Single
 005EDCA7    call        @ROUND
 005EDCAC    mov         dword ptr [ebp-20],eax
 005EDCAF    fld         qword ptr [ebp+10]
 005EDCB2    fmul        dword ptr ds:[5EDE68];65535:Single
 005EDCB8    call        @ROUND
 005EDCBD    mov         dword ptr [ebp-1C],eax
>005EDCC0    jmp         005EDE14
 005EDCC5    mov         dword ptr [ebp-14],0C001
 005EDCCC    fld         qword ptr [ebp+18]
 005EDCCF    fmul        dword ptr ds:[5EDE68];65535:Single
 005EDCD5    call        @ROUND
 005EDCDA    mov         dword ptr [ebp-20],eax
 005EDCDD    fld         qword ptr [ebp+10]
 005EDCE0    fmul        dword ptr ds:[5EDE68];65535:Single
 005EDCE6    call        @ROUND
 005EDCEB    mov         dword ptr [ebp-1C],eax
>005EDCEE    jmp         005EDE14
 005EDCF3    mov         dword ptr [ebp-14],1
 005EDCFA    fld         qword ptr [ebp+18]
 005EDCFD    fsub        qword ptr ds:[78BC58];gvar_0078BC58:Double
 005EDD03    call        @ROUND
 005EDD08    mov         dword ptr [ebp-20],eax
 005EDD0B    fld         qword ptr [ebp+10]
 005EDD0E    fsub        qword ptr ds:[78BC60];gvar_0078BC60:Double
 005EDD14    call        @ROUND
 005EDD19    mov         dword ptr [ebp-1C],eax
>005EDD1C    jmp         005EDE14
 005EDD21    mov         dword ptr [ebp-14],801
 005EDD28    fld         qword ptr [ebp+18]
 005EDD2B    fsub        qword ptr ds:[78BC58];gvar_0078BC58:Double
 005EDD31    call        @ROUND
 005EDD36    mov         dword ptr [ebp-20],eax
 005EDD39    fld         qword ptr [ebp+10]
 005EDD3C    fsub        qword ptr ds:[78BC60];gvar_0078BC60:Double
 005EDD42    call        @ROUND
 005EDD47    mov         dword ptr [ebp-1C],eax
 005EDD4A    fld         qword ptr [ebp+8]
 005EDD4D    fsub        qword ptr ds:[78BC68];gvar_0078BC68:Double
 005EDD53    call        @ROUND
 005EDD58    mov         dword ptr [ebp-18],eax
>005EDD5B    jmp         005EDE14
 005EDD60    mov         dword ptr [ebp-14],1
 005EDD67    fld         qword ptr ds:[78BCD8];gvar_0078BCD8:Double
 005EDD6D    fadd        qword ptr [ebp+18]
 005EDD70    fsub        qword ptr ds:[78BC98];gvar_0078BC98:Double
 005EDD76    fstp        qword ptr ds:[78BCD8];gvar_0078BCD8:Double
 005EDD7C    wait
 005EDD7D    fld         qword ptr ds:[78BCE0];gvar_0078BCE0:Double
 005EDD83    fadd        qword ptr [ebp+10]
 005EDD86    fsub        qword ptr ds:[78BCA0];gvar_0078BCA0:Double
 005EDD8C    fstp        qword ptr ds:[78BCE0];gvar_0078BCE0:Double
 005EDD92    wait
 005EDD93    fld         qword ptr ds:[78BCD8];gvar_0078BCD8:Double
 005EDD99    call        @ROUND
 005EDD9E    mov         dword ptr [ebp-20],eax
 005EDDA1    fld         qword ptr ds:[78BCE0];gvar_0078BCE0:Double
 005EDDA7    call        @ROUND
 005EDDAC    mov         ebx,eax
 005EDDAE    mov         dword ptr [ebp-1C],ebx
 005EDDB1    fild        dword ptr [ebp-20]
 005EDDB4    fsubr       qword ptr ds:[78BCD8];gvar_0078BCD8:Double
 005EDDBA    fstp        qword ptr ds:[78BCD8];gvar_0078BCD8:Double
 005EDDC0    wait
 005EDDC1    mov         dword ptr [ebp-28],ebx
 005EDDC4    fild        dword ptr [ebp-28]
 005EDDC7    fsubr       qword ptr ds:[78BCE0];gvar_0078BCE0:Double
 005EDDCD    fstp        qword ptr ds:[78BCE0];gvar_0078BCE0:Double
 005EDDD3    wait
 005EDDD4    fild        dword ptr [ebp-20]
 005EDDD7    fadd        qword ptr ds:[78BCB8];gvar_0078BCB8:Double
 005EDDDD    fstp        qword ptr ds:[78BCB8];gvar_0078BCB8:Double
 005EDDE3    wait
 005EDDE4    fild        dword ptr [ebp-1C]
 005EDDE7    fadd        qword ptr ds:[78BCC0];gvar_0078BCC0:Double
 005EDDED    fstp        qword ptr ds:[78BCC0];gvar_0078BCC0:Double
 005EDDF3    wait
>005EDDF4    jmp         005EDE14
 005EDDF6    fld         qword ptr [ebp+10]
 005EDDF9    call        @ROUND
 005EDDFE    push        eax
 005EDDFF    fld         qword ptr [ebp+18]
 005EDE02    call        @ROUND
 005EDE07    push        eax
 005EDE08    call        user32.SetCursorPos
>005EDE0D    jmp         005EDE14
 005EDE0F    xor         eax,eax
 005EDE11    mov         dword ptr [ebp-14],eax
 005EDE14    xor         eax,eax
 005EDE16    mov         dword ptr [ebp-10],eax
 005EDE19    xor         eax,eax
 005EDE1B    mov         dword ptr [ebp-0C],eax
 005EDE1E    cmp         dword ptr [ebp-14],0
>005EDE22    je          005EDE37
 005EDE24    push        1C
 005EDE26    lea         eax,[ebp-24]
 005EDE29    push        eax
 005EDE2A    push        1
 005EDE2C    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005EDE31    mov         eax,dword ptr [eax]
 005EDE33    call        eax
>005EDE35    jmp         005EDE3C
 005EDE37    mov         eax,1
 005EDE3C    dec         eax
 005EDE3D    sete        bl
 005EDE40    push        dword ptr [ebp+1C]
 005EDE43    push        dword ptr [ebp+18]
 005EDE46    push        dword ptr [ebp+14]
 005EDE49    push        dword ptr [ebp+10]
 005EDE4C    push        dword ptr [ebp+0C]
 005EDE4F    push        dword ptr [ebp+8]
 005EDE52    call        005C4070
 005EDE57    fstp        qword ptr [esi+8];TMouseValue.PreviousValue:Double
 005EDE5A    wait
 005EDE5B    mov         eax,ebx
 005EDE5D    pop         esi
 005EDE5E    pop         ebx
 005EDE5F    mov         esp,ebp
 005EDE61    pop         ebp
 005EDE62    ret         18
end;*}

//005EDE6C
{*procedure TMouseValue.ToString(?:?);
begin
 005EDE6C    push        ebp
 005EDE6D    mov         ebp,esp
 005EDE6F    push        0
 005EDE71    push        0
 005EDE73    push        0
 005EDE75    push        ebx
 005EDE76    push        esi
 005EDE77    push        edi
 005EDE78    mov         esi,edx
 005EDE7A    mov         ebx,eax
 005EDE7C    xor         eax,eax
 005EDE7E    push        ebp
 005EDE7F    push        5EDEFB
 005EDE84    push        dword ptr fs:[eax]
 005EDE87    mov         dword ptr fs:[eax],esp
 005EDE8A    mov         edi,dword ptr [ebx+18];TMouseValue.........................................................
 005EDE8D    test        edi,edi
>005EDE8F    jge         005EDEAE
 005EDE91    lea         edx,[ebp-4]
 005EDE94    movzx       eax,byte ptr [ebx+20];TMouseValue...................................................Item...
 005EDE98    call        005EB6EC
 005EDE9D    mov         ecx,dword ptr [ebp-4]
 005EDEA0    mov         eax,esi
 005EDEA2    mov         edx,5EDF18;'Mouse.'
 005EDEA7    call        @UStrCat3
>005EDEAC    jmp         005EDEE0
 005EDEAE    push        5EDF34;'Mouse'
 005EDEB3    lea         edx,[ebp-8]
 005EDEB6    mov         eax,edi
 005EDEB8    call        IntToStr
 005EDEBD    push        dword ptr [ebp-8]
 005EDEC0    push        5EDF4C;'.'
 005EDEC5    lea         edx,[ebp-0C]
 005EDEC8    movzx       eax,byte ptr [ebx+20];TMouseValue....................................................Ite...
 005EDECC    call        005EB6EC
 005EDED1    push        dword ptr [ebp-0C]
 005EDED4    mov         eax,esi
 005EDED6    mov         edx,4
 005EDEDB    call        @UStrCatN
 005EDEE0    xor         eax,eax
 005EDEE2    pop         edx
 005EDEE3    pop         ecx
 005EDEE4    pop         ecx
 005EDEE5    mov         dword ptr fs:[eax],edx
 005EDEE8    push        5EDF02
 005EDEED    lea         eax,[ebp-0C]
 005EDEF0    mov         edx,3
 005EDEF5    call        @UStrArrayClr
 005EDEFA    ret
>005EDEFB    jmp         @HandleFinally
>005EDF00    jmp         005EDEED
 005EDF02    pop         edi
 005EDF03    pop         esi
 005EDF04    pop         ebx
 005EDF05    mov         esp,ebp
 005EDF07    pop         ebp
 005EDF08    ret
end;*}

//005EDF50
procedure sub_005EDF50;
begin
{*
 005EDF50    push        ebx
 005EDF51    push        esi
 005EDF52    push        edi
 005EDF53    add         esp,0FFFFFFE4
 005EDF56    mov         edi,esp
 005EDF58    xor         esi,esi
 005EDF5A    mov         ebx,8162B0;gvar_008162B0
 005EDF5F    test        byte ptr [ebx],80
>005EDF62    jbe         005EE018
 005EDF68    xor         eax,eax
 005EDF6A    mov         dword ptr [edi],eax
 005EDF6C    xor         eax,eax
 005EDF6E    mov         dword ptr [edi+4],eax
 005EDF71    xor         eax,eax
 005EDF73    mov         dword ptr [edi+8],eax
 005EDF76    xor         eax,eax
 005EDF78    mov         dword ptr [edi+0C],eax
 005EDF7B    xor         eax,eax
 005EDF7D    mov         dword ptr [edi+10],eax
 005EDF80    xor         eax,eax
 005EDF82    mov         dword ptr [edi+14],eax
 005EDF85    xor         eax,eax
 005EDF87    mov         dword ptr [edi+18],eax
 005EDF8A    mov         eax,esi
 005EDF8C    cmp         eax,7
>005EDF8F    ja          005EDFFE
 005EDF91    jmp         dword ptr [eax*4+5EDF98]
 005EDF91    dd          005EDFB8
 005EDF91    dd          005EDFC1
 005EDF91    dd          005EDFCA
 005EDF91    dd          005EDFD3
 005EDF91    dd          005EDFDC
 005EDF91    dd          005EDFE5
 005EDF91    dd          005EDFEE
 005EDF91    dd          005EDFF7
 005EDFB8    mov         dword ptr [edi+10],4
>005EDFBF    jmp         005EDFFE
 005EDFC1    mov         dword ptr [edi+10],10
>005EDFC8    jmp         005EDFFE
 005EDFCA    mov         dword ptr [edi+10],40
>005EDFD1    jmp         005EDFFE
 005EDFD3    mov         dword ptr [edi+0C],1
>005EDFDA    jmp         005EDFFE
 005EDFDC    mov         dword ptr [edi+0C],2
>005EDFE3    jmp         005EDFFE
 005EDFE5    mov         dword ptr [edi+0C],4
>005EDFEC    jmp         005EDFFE
 005EDFEE    mov         dword ptr [edi+0C],8
>005EDFF5    jmp         005EDFFE
 005EDFF7    mov         dword ptr [edi+0C],10
 005EDFFE    cmp         esi,2
>005EE001    jle         005EE00A
 005EE003    mov         dword ptr [edi+10],100
 005EE00A    push        1C
 005EE00C    push        edi
 005EE00D    push        1
 005EE00F    mov         eax,[0078D96C];^gvar_00816E98:Pointer
 005EE014    mov         eax,dword ptr [eax]
 005EE016    call        eax
 005EE018    inc         esi
 005EE019    inc         ebx
 005EE01A    cmp         esi,8
>005EE01D    jne         005EDF5F
 005EE023    add         esp,1C
 005EE026    pop         edi
 005EE027    pop         esi
 005EE028    pop         ebx
 005EE029    ret
*}
end;

//005EE02C
procedure sub_005EE02C;
begin
{*
 005EE02C    push        7F8A
 005EE031    push        0
 005EE033    call        user32.LoadCursorW
 005EE038    mov         [00816244],eax;gvar_00816244:HICON
 005EE03D    push        7F00
 005EE042    push        0
 005EE044    call        user32.LoadCursorW
 005EE049    mov         [00816248],eax;gvar_00816248:HICON
 005EE04E    push        7F03
 005EE053    push        0
 005EE055    call        user32.LoadCursorW
 005EE05A    mov         [0081624C],eax;gvar_0081624C:HICON
 005EE05F    push        7F89
 005EE064    push        0
 005EE066    call        user32.LoadCursorW
 005EE06B    mov         [00816250],eax;gvar_00816250:HICON
 005EE070    push        7F8B
 005EE075    push        0
 005EE077    call        user32.LoadCursorW
 005EE07C    mov         [00816254],eax;gvar_00816254:HICON
 005EE081    push        7F01
 005EE086    push        0
 005EE088    call        user32.LoadCursorW
 005EE08D    mov         [00816258],eax;gvar_00816258:HICON
 005EE092    push        7F81
 005EE097    push        0
 005EE099    call        user32.LoadCursorW
 005EE09E    mov         [0081625C],eax;gvar_0081625C:HICON
 005EE0A3    push        7F88
 005EE0A8    push        0
 005EE0AA    call        user32.LoadCursorW
 005EE0AF    mov         [00816260],eax;gvar_00816260:HICON
 005EE0B4    push        7F80
 005EE0B9    push        0
 005EE0BB    call        user32.LoadCursorW
 005EE0C0    mov         [00816264],eax;gvar_00816264:HICON
 005EE0C5    push        7F86
 005EE0CA    push        0
 005EE0CC    call        user32.LoadCursorW
 005EE0D1    mov         [00816268],eax;gvar_00816268:HICON
 005EE0D6    push        7F83
 005EE0DB    push        0
 005EE0DD    call        user32.LoadCursorW
 005EE0E2    mov         [0081626C],eax;gvar_0081626C:HICON
 005EE0E7    push        7F85
 005EE0EC    push        0
 005EE0EE    call        user32.LoadCursorW
 005EE0F3    mov         [00816270],eax;gvar_00816270:HICON
 005EE0F8    push        7F82
 005EE0FD    push        0
 005EE0FF    call        user32.LoadCursorW
 005EE104    mov         [00816274],eax;gvar_00816274:HICON
 005EE109    push        7F84
 005EE10E    push        0
 005EE110    call        user32.LoadCursorW
 005EE115    mov         [00816278],eax;gvar_00816278:HICON
 005EE11A    push        7F04
 005EE11F    push        0
 005EE121    call        user32.LoadCursorW
 005EE126    mov         [0081627C],eax;gvar_0081627C:HICON
 005EE12B    push        7F02
 005EE130    push        0
 005EE132    call        user32.LoadCursorW
 005EE137    mov         [00816280],eax;gvar_00816280:HICON
 005EE13C    ret
*}
end;

//005EE140
{*procedure sub_005EE140(?:?);
begin
 005EE140    push        ebx
 005EE141    push        esi
 005EE142    push        edi
 005EE143    add         esp,0FFFFFFF8
 005EE146    mov         edi,eax
 005EE148    push        esp
 005EE149    call        user32.GetCursorPos
 005EE14E    push        dword ptr [esp+4]
 005EE152    push        dword ptr [esp+4]
 005EE156    call        user32.WindowFromPoint
 005EE15B    push        0
 005EE15D    push        eax
 005EE15E    call        user32.GetWindowThreadProcessId
 005EE163    mov         ebx,eax
 005EE165    call        kernel32.GetCurrentThreadId
 005EE16A    mov         esi,eax
 005EE16C    cmp         ebx,esi
>005EE16E    je          005EE196
 005EE170    push        0FF
 005EE172    push        ebx
 005EE173    push        esi
 005EE174    call        user32.AttachThreadInput
 005EE179    test        eax,eax
>005EE17B    je          005EE18E
 005EE17D    push        edi
 005EE17E    call        user32.SetCursor
 005EE183    push        0
 005EE185    push        ebx
 005EE186    push        esi
 005EE187    call        user32.AttachThreadInput
>005EE18C    jmp         005EE19C
 005EE18E    push        edi
 005EE18F    call        user32.SetCursor
>005EE194    jmp         005EE19C
 005EE196    push        edi
 005EE197    call        user32.SetCursor
 005EE19C    pop         ecx
 005EE19D    pop         edx
 005EE19E    pop         edi
 005EE19F    pop         esi
 005EE1A0    pop         ebx
 005EE1A1    ret
end;*}

//005EE1A4
procedure sub_005EE1A4(?:Boolean);
begin
{*
 005EE1A4    push        ebx
 005EE1A5    push        esi
 005EE1A6    push        edi
 005EE1A7    add         esp,0FFFFFFF8
 005EE1AA    mov         ebx,eax
 005EE1AC    push        esp
 005EE1AD    call        user32.GetCursorPos
 005EE1B2    push        dword ptr [esp+4]
 005EE1B6    push        dword ptr [esp+4]
 005EE1BA    call        user32.WindowFromPoint
 005EE1BF    push        0
 005EE1C1    push        eax
 005EE1C2    call        user32.GetWindowThreadProcessId
 005EE1C7    mov         edi,eax
 005EE1C9    call        kernel32.GetCurrentThreadId
 005EE1CE    mov         esi,eax
 005EE1D0    cmp         edi,esi
>005EE1D2    je          005EE206
 005EE1D4    push        0FF
 005EE1D6    push        edi
 005EE1D7    push        esi
 005EE1D8    call        user32.AttachThreadInput
 005EE1DD    test        eax,eax
>005EE1DF    je          005EE1F8
 005EE1E1    cmp         bl,1
 005EE1E4    cmc
 005EE1E5    sbb         eax,eax
 005EE1E7    push        eax
 005EE1E8    call        user32.ShowCursor
 005EE1ED    push        0
 005EE1EF    push        edi
 005EE1F0    push        esi
 005EE1F1    call        user32.AttachThreadInput
>005EE1F6    jmp         005EE212
 005EE1F8    cmp         bl,1
 005EE1FB    cmc
 005EE1FC    sbb         eax,eax
 005EE1FE    push        eax
 005EE1FF    call        user32.ShowCursor
>005EE204    jmp         005EE212
 005EE206    cmp         bl,1
 005EE209    cmc
 005EE20A    sbb         eax,eax
 005EE20C    push        eax
 005EE20D    call        user32.ShowCursor
 005EE212    pop         ecx
 005EE213    pop         edx
 005EE214    pop         edi
 005EE215    pop         esi
 005EE216    pop         ebx
 005EE217    ret
*}
end;

//005EE218
procedure sub_005EE218;
begin
{*
 005EE218    mov         byte ptr ds:[8161F8],0;gvar_008161F8
 005EE21F    mov         byte ptr ds:[8161F9],0;gvar_008161F9
 005EE226    mov         byte ptr ds:[8161FA],0;gvar_008161FA
 005EE22D    xor         eax,eax
 005EE22F    mov         dword ptr ds:[78BC58],eax;gvar_0078BC58:Double
 005EE235    mov         dword ptr ds:[78BC5C],eax;gvar_0078BC5C
 005EE23B    xor         eax,eax
 005EE23D    mov         dword ptr ds:[78BC60],eax;gvar_0078BC60:Double
 005EE243    mov         dword ptr ds:[78BC64],eax;gvar_0078BC64
 005EE249    xor         eax,eax
 005EE24B    mov         dword ptr ds:[78BC68],eax;gvar_0078BC68:Double
 005EE251    mov         dword ptr ds:[78BC6C],eax;gvar_0078BC6C
 005EE257    xor         eax,eax
 005EE259    mov         dword ptr ds:[78BC70],eax;gvar_0078BC70:Double
 005EE25F    mov         dword ptr ds:[78BC74],eax;gvar_0078BC74
 005EE265    xor         eax,eax
 005EE267    mov         dword ptr ds:[78BC98],eax;gvar_0078BC98:Double
 005EE26D    mov         dword ptr ds:[78BC9C],eax;gvar_0078BC9C
 005EE273    xor         eax,eax
 005EE275    mov         dword ptr ds:[78BCA0],eax;gvar_0078BCA0:Double
 005EE27B    mov         dword ptr ds:[78BCA4],eax;gvar_0078BCA4
 005EE281    xor         eax,eax
 005EE283    mov         dword ptr ds:[78BCA8],eax;gvar_0078BCA8:Double
 005EE289    mov         dword ptr ds:[78BCAC],eax;gvar_0078BCAC
 005EE28F    xor         eax,eax
 005EE291    mov         dword ptr ds:[78BCB0],eax;gvar_0078BCB0:Double
 005EE297    mov         dword ptr ds:[78BCB4],eax;gvar_0078BCB4
 005EE29D    xor         eax,eax
 005EE29F    mov         dword ptr ds:[78BC78],eax;gvar_0078BC78:Double
 005EE2A5    mov         dword ptr ds:[78BC7C],eax;gvar_0078BC7C
 005EE2AB    xor         eax,eax
 005EE2AD    mov         dword ptr ds:[78BC80],eax;gvar_0078BC80:Double
 005EE2B3    mov         dword ptr ds:[78BC84],eax;gvar_0078BC84
 005EE2B9    xor         eax,eax
 005EE2BB    mov         dword ptr ds:[78BC88],eax;gvar_0078BC88:Double
 005EE2C1    mov         dword ptr ds:[78BC8C],eax;gvar_0078BC8C
 005EE2C7    xor         eax,eax
 005EE2C9    mov         dword ptr ds:[78BC90],eax;gvar_0078BC90:Double
 005EE2CF    mov         dword ptr ds:[78BC94],eax;gvar_0078BC94
 005EE2D5    xor         eax,eax
 005EE2D7    mov         dword ptr ds:[78BCD8],eax;gvar_0078BCD8:Double
 005EE2DD    mov         dword ptr ds:[78BCDC],eax;gvar_0078BCDC
 005EE2E3    xor         eax,eax
 005EE2E5    mov         dword ptr ds:[78BCE0],eax;gvar_0078BCE0:Double
 005EE2EB    mov         dword ptr ds:[78BCE4],eax;gvar_0078BCE4
 005EE2F1    xor         eax,eax
 005EE2F3    mov         dword ptr ds:[78BCE8],eax;gvar_0078BCE8:Double
 005EE2F9    mov         dword ptr ds:[78BCEC],eax;gvar_0078BCEC
 005EE2FF    xor         eax,eax
 005EE301    mov         dword ptr ds:[78BCF0],eax;gvar_0078BCF0:Double
 005EE307    mov         dword ptr ds:[78BCF4],eax;gvar_0078BCF4
 005EE30D    xor         eax,eax
 005EE30F    mov         dword ptr ds:[78BCB8],eax;gvar_0078BCB8:Double
 005EE315    mov         dword ptr ds:[78BCBC],eax;gvar_0078BCBC
 005EE31B    xor         eax,eax
 005EE31D    mov         dword ptr ds:[78BCC0],eax;gvar_0078BCC0:Double
 005EE323    mov         dword ptr ds:[78BCC4],eax;gvar_0078BCC4
 005EE329    xor         eax,eax
 005EE32B    mov         dword ptr ds:[78BCC8],eax;gvar_0078BCC8:Double
 005EE331    mov         dword ptr ds:[78BCCC],eax;gvar_0078BCCC
 005EE337    xor         eax,eax
 005EE339    mov         dword ptr ds:[78BCD0],eax;gvar_0078BCD0:Double
 005EE33F    mov         dword ptr ds:[78BCD4],eax;gvar_0078BCD4
 005EE345    ret
*}
end;

//005EE348
{*function sub_005EE348(?:?; ?:?; ?:?):?;
begin
 005EE348    push        ebp
 005EE349    mov         ebp,esp
 005EE34B    push        ebx
 005EE34C    push        esi
 005EE34D    mov         ebx,dword ptr [ebp+10]
 005EE350    mov         esi,dword ptr [ebp+0C]
 005EE353    push        ebx
 005EE354    push        esi
 005EE355    mov         eax,dword ptr [ebp+8]
 005EE358    push        eax
 005EE359    mov         eax,[0081623C];gvar_0081623C:HHOOK
 005EE35E    push        eax
 005EE35F    call        user32.CallNextHookEx
 005EE364    mov         edx,eax
 005EE366    mov         eax,ebx
 005EE368    test        byte ptr [eax+0C],1
>005EE36C    jne         005EE3DC
 005EE36E    cmp         byte ptr ds:[816240],0;gvar_00816240:Boolean
>005EE375    je          005EE37C
 005EE377    or          edx,0FFFFFFFF
>005EE37A    jmp         005EE3DC
 005EE37C    cmp         esi,201
>005EE382    jge         005EE39F
 005EE384    add         esi,0FFFFFF5F
 005EE38A    sub         esi,9
>005EE38D    jb          005EE3C2
 005EE38F    dec         esi
 005EE390    sub         esi,3
>005EE393    jb          005EE3C2
 005EE395    sub         esi,152
>005EE39B    je          005EE3B4
>005EE39D    jmp         005EE3DC
 005EE39F    add         esi,0FFFFFDFF
 005EE3A5    sub         esi,9
>005EE3A8    jb          005EE3C2
>005EE3AA    je          005EE3D0
 005EE3AC    dec         esi
 005EE3AD    sub         esi,3
>005EE3B0    jb          005EE3C2
>005EE3B2    jmp         005EE3DC
 005EE3B4    cmp         byte ptr ds:[816243],0;gvar_00816243:Boolean
>005EE3BB    je          005EE3DC
 005EE3BD    or          edx,0FFFFFFFF
>005EE3C0    jmp         005EE3DC
 005EE3C2    cmp         byte ptr ds:[816241],0;gvar_00816241:Boolean
>005EE3C9    je          005EE3DC
 005EE3CB    or          edx,0FFFFFFFF
>005EE3CE    jmp         005EE3DC
 005EE3D0    cmp         byte ptr ds:[816242],0;gvar_00816242:Boolean
>005EE3D7    je          005EE3DC
 005EE3D9    or          edx,0FFFFFFFF
 005EE3DC    mov         eax,edx
 005EE3DE    pop         esi
 005EE3DF    pop         ebx
 005EE3E0    pop         ebp
 005EE3E1    ret         0C
end;*}

//005EE3E4
procedure sub_005EE3E4;
begin
{*
 005EE3E4    push        ebp
 005EE3E5    mov         ebp,esp
 005EE3E7    push        ebx
 005EE3E8    push        esi
 005EE3E9    push        edi
 005EE3EA    xor         edx,edx
 005EE3EC    push        ebp
 005EE3ED    push        5EE41C
 005EE3F2    push        dword ptr fs:[edx]
 005EE3F5    mov         dword ptr fs:[edx],esp
 005EE3F8    push        0
 005EE3FA    mov         eax,[00790C38];gvar_00790C38
 005EE3FF    push        eax
 005EE400    mov         eax,5EE348;sub_005EE348
 005EE405    push        eax
 005EE406    push        0E
 005EE408    call        user32.SetWindowsHookExW
 005EE40D    mov         [0081623C],eax;gvar_0081623C:HHOOK
 005EE412    xor         eax,eax
 005EE414    pop         edx
 005EE415    pop         ecx
 005EE416    pop         ecx
 005EE417    mov         dword ptr fs:[eax],edx
>005EE41A    jmp         005EE437
>005EE41C    jmp         @HandleOnException
 005EE421    dd          1
 005EE425    dd          00418C04;Exception
 005EE429    dd          005EE42D
 005EE42D    call        004FA644
 005EE432    call        @DoneExcept
 005EE437    pop         edi
 005EE438    pop         esi
 005EE439    pop         ebx
 005EE43A    pop         ebp
 005EE43B    ret
*}
end;

//005EE43C
procedure sub_005EE43C;
begin
{*
 005EE43C    push        ebp
 005EE43D    mov         ebp,esp
 005EE43F    push        ebx
 005EE440    push        esi
 005EE441    push        edi
 005EE442    xor         edx,edx
 005EE444    push        ebp
 005EE445    push        5EE465
 005EE44A    push        dword ptr fs:[edx]
 005EE44D    mov         dword ptr fs:[edx],esp
 005EE450    mov         eax,[0081623C];gvar_0081623C:HHOOK
 005EE455    push        eax
 005EE456    call        user32.UnhookWindowsHookEx
 005EE45B    xor         eax,eax
 005EE45D    pop         edx
 005EE45E    pop         ecx
 005EE45F    pop         ecx
 005EE460    mov         dword ptr fs:[eax],edx
>005EE463    jmp         005EE480
>005EE465    jmp         @HandleOnException
 005EE46A    dd          1
 005EE46E    dd          00418C04;Exception
 005EE472    dd          005EE476
 005EE476    call        004FA644
 005EE47B    call        @DoneExcept
 005EE480    xor         eax,eax
 005EE482    mov         [0081623C],eax;gvar_0081623C:HHOOK
 005EE487    pop         edi
 005EE488    pop         esi
 005EE489    pop         ebx
 005EE48A    pop         ebp
 005EE48B    ret
*}
end;

//005EE48C
procedure TModuleMouse.AddFields;
begin
{*
 005EE48C    push        ebx
 005EE48D    mov         ebx,eax
 005EE48F    mov         ecx,1
 005EE494    mov         edx,5EF080;'LeftButton'
 005EE499    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE49C    call        THashTable.Add
 005EE4A1    mov         ecx,2
 005EE4A6    mov         edx,5EF0A4;'RightButton'
 005EE4AB    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE4AE    call        THashTable.Add
 005EE4B3    mov         ecx,3
 005EE4B8    mov         edx,5EF0C8;'MiddleButton'
 005EE4BD    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE4C0    call        THashTable.Add
 005EE4C5    mov         ecx,4
 005EE4CA    mov         edx,5EF0F0;'XButton1'
 005EE4CF    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE4D2    call        THashTable.Add
 005EE4D7    mov         ecx,5
 005EE4DC    mov         edx,5EF110;'XButton2'
 005EE4E1    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE4E4    call        THashTable.Add
 005EE4E9    mov         ecx,0E
 005EE4EE    mov         edx,5EF130;'Button6'
 005EE4F3    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE4F6    call        THashTable.Add
 005EE4FB    mov         ecx,0F
 005EE500    mov         edx,5EF14C;'Button7'
 005EE505    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE508    call        THashTable.Add
 005EE50D    mov         ecx,10
 005EE512    mov         edx,5EF168;'Button8'
 005EE517    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE51A    call        THashTable.Add
 005EE51F    mov         ecx,6
 005EE524    mov         edx,5EF184;'WheelUp'
 005EE529    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE52C    call        THashTable.Add
 005EE531    mov         ecx,7
 005EE536    mov         edx,5EF1A0;'WheelDown'
 005EE53B    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE53E    call        THashTable.Add
 005EE543    mov         ecx,24
 005EE548    mov         edx,5EF1C0;'WheelLeft'
 005EE54D    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE550    call        THashTable.Add
 005EE555    mov         ecx,25
 005EE55A    mov         edx,5EF1E0;'WheelRight'
 005EE55F    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE562    call        THashTable.Add
 005EE567    mov         ecx,8
 005EE56C    mov         edx,5EF204;'x'
 005EE571    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE574    call        THashTable.Add
 005EE579    mov         ecx,9
 005EE57E    mov         edx,5EF214;'y'
 005EE583    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE586    call        THashTable.Add
 005EE58B    mov         ecx,0A
 005EE590    mov         edx,5EF224;'VirtualDesktopX'
 005EE595    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE598    call        THashTable.Add
 005EE59D    mov         ecx,0B
 005EE5A2    mov         edx,5EF250;'VirtualDesktopY'
 005EE5A7    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE5AA    call        THashTable.Add
 005EE5AF    mov         ecx,0C
 005EE5B4    mov         edx,5EF27C;^338:Single
 005EE5B9    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE5BC    call        THashTable.Add
 005EE5C1    mov         ecx,0D
 005EE5C6    mov         edx,5EF2A4;^338:Single
 005EE5CB    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE5CE    call        THashTable.Add
 005EE5D3    mov         ecx,1C
 005EE5D8    mov         edx,5EF2CC;^338:Single
 005EE5DD    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE5E0    call        THashTable.Add
 005EE5E5    mov         ecx,23
 005EE5EA    mov         edx,5EF2F4;^338:Single
 005EE5EF    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE5F2    call        THashTable.Add
 005EE5F7    mov         ecx,2E
 005EE5FC    mov         edx,5EF31C;'RealDirectInputX'
 005EE601    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE604    call        THashTable.Add
 005EE609    mov         ecx,2F
 005EE60E    mov         edx,5EF34C;'RealDirectInputY'
 005EE613    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE616    call        THashTable.Add
 005EE61B    mov         ecx,30
 005EE620    mov         edx,5EF37C;'RealDirectInputZ'
 005EE625    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE628    call        THashTable.Add
 005EE62D    mov         ecx,31
 005EE632    mov         edx,5EF3AC;'RealDirectInputH'
 005EE637    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE63A    call        THashTable.Add
 005EE63F    mov         ecx,2E
 005EE644    mov         edx,5EF3DC;'RealDirectInput.X'
 005EE649    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE64C    call        THashTable.Add
 005EE651    mov         ecx,2F
 005EE656    mov         edx,5EF40C;'RealDirectInput.Y'
 005EE65B    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE65E    call        THashTable.Add
 005EE663    mov         ecx,30
 005EE668    mov         edx,5EF43C;'RealDirectInput.Z'
 005EE66D    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE670    call        THashTable.Add
 005EE675    mov         ecx,31
 005EE67A    mov         edx,5EF46C;'RealDirectInput.H'
 005EE67F    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE682    call        THashTable.Add
 005EE687    mov         ecx,2E
 005EE68C    mov         edx,5EF49C;'RealDInputX'
 005EE691    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE694    call        THashTable.Add
 005EE699    mov         ecx,2F
 005EE69E    mov         edx,5EF4C0;'RealDInputY'
 005EE6A3    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE6A6    call        THashTable.Add
 005EE6AB    mov         ecx,30
 005EE6B0    mov         edx,5EF4E4;'RealDInputZ'
 005EE6B5    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE6B8    call        THashTable.Add
 005EE6BD    mov         ecx,31
 005EE6C2    mov         edx,5EF508;'RealDInputH'
 005EE6C7    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE6CA    call        THashTable.Add
 005EE6CF    mov         ecx,2E
 005EE6D4    mov         edx,5EF52C;'RealDIX'
 005EE6D9    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE6DC    call        THashTable.Add
 005EE6E1    mov         ecx,2F
 005EE6E6    mov         edx,5EF548;'RealDIY'
 005EE6EB    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE6EE    call        THashTable.Add
 005EE6F3    mov         ecx,30
 005EE6F8    mov         edx,5EF564;'RealDIZ'
 005EE6FD    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE700    call        THashTable.Add
 005EE705    mov         ecx,31
 005EE70A    mov         edx,5EF580;'RealDIH'
 005EE70F    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE712    call        THashTable.Add
 005EE717    mov         ecx,2A
 005EE71C    mov         edx,5EF59C;'ExtraInputX'
 005EE721    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE724    call        THashTable.Add
 005EE729    mov         ecx,2B
 005EE72E    mov         edx,5EF5C0;'ExtraInputY'
 005EE733    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE736    call        THashTable.Add
 005EE73B    mov         ecx,2C
 005EE740    mov         edx,5EF5E4;'ExtraInputZ'
 005EE745    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE748    call        THashTable.Add
 005EE74D    mov         ecx,2D
 005EE752    mov         edx,5EF608;'ExtraInputH'
 005EE757    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE75A    call        THashTable.Add
 005EE75F    mov         ecx,2A
 005EE764    mov         edx,5EF62C;'FakeDirectInputX'
 005EE769    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE76C    call        THashTable.Add
 005EE771    mov         ecx,2B
 005EE776    mov         edx,5EF65C;'FakeDirectInputY'
 005EE77B    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE77E    call        THashTable.Add
 005EE783    mov         ecx,2C
 005EE788    mov         edx,5EF68C;'FakeDirectInputZ'
 005EE78D    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE790    call        THashTable.Add
 005EE795    mov         ecx,2D
 005EE79A    mov         edx,5EF6BC;'FakeDirectInputH'
 005EE79F    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE7A2    call        THashTable.Add
 005EE7A7    mov         ecx,2A
 005EE7AC    mov         edx,5EF6EC;'FakeDInputX'
 005EE7B1    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE7B4    call        THashTable.Add
 005EE7B9    mov         ecx,2B
 005EE7BE    mov         edx,5EF710;'FakeDInputY'
 005EE7C3    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE7C6    call        THashTable.Add
 005EE7CB    mov         ecx,2C
 005EE7D0    mov         edx,5EF734;'FakeDInputZ'
 005EE7D5    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE7D8    call        THashTable.Add
 005EE7DD    mov         ecx,2D
 005EE7E2    mov         edx,5EF758;'FakeDInputH'
 005EE7E7    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE7EA    call        THashTable.Add
 005EE7EF    mov         ecx,11
 005EE7F4    mov         edx,5EF77C;'CursorPosX'
 005EE7F9    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE7FC    call        THashTable.Add
 005EE801    mov         ecx,12
 005EE806    mov         edx,5EF7A0;'CursorPosY'
 005EE80B    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE80E    call        THashTable.Add
 005EE813    mov         ecx,13
 005EE818    mov         edx,5EF7C4;'WheelScrollLines'
 005EE81D    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE820    call        THashTable.Add
 005EE825    mov         ecx,14
 005EE82A    mov         edx,5EF7F4;'Present'
 005EE82F    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE832    call        THashTable.Add
 005EE837    mov         ecx,15
 005EE83C    mov         edx,5EF810;'WheelPresent'
 005EE841    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE844    call        THashTable.Add
 005EE849    mov         ecx,16
 005EE84E    mov         edx,5EF838;'IsDragging'
 005EE853    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE856    call        THashTable.Add
 005EE85B    mov         ecx,17
 005EE860    mov         edx,5EF85C;'DoubleClickTime'
 005EE865    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE868    call        THashTable.Add
 005EE86D    mov         ecx,18
 005EE872    mov         edx,5EF888;'Cursor'
 005EE877    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE87A    call        THashTable.Add
 005EE87F    mov         ecx,19
 005EE884    mov         edx,5EF8A4;'CursorVisible'
 005EE889    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE88C    call        THashTable.Add
 005EE891    mov         ecx,1A
 005EE896    mov         edx,5EF8CC;'GetCursor'
 005EE89B    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE89E    call        THashTable.Add
 005EE8A3    mov         ecx,1B
 005EE8A8    mov         edx,5EF8EC;'PermanentCursor'
 005EE8AD    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE8B0    call        THashTable.Add
 005EE8B5    mov         ecx,14
 005EE8BA    mov         edx,5EF918;'Exists'
 005EE8BF    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE8C2    call        THashTable.Add
 005EE8C7    mov         ecx,15
 005EE8CC    mov         edx,5EF934;'WheelExists'
 005EE8D1    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE8D4    call        THashTable.Add
 005EE8D9    mov         ecx,1
 005EE8DE    mov         edx,5EF958;'Button1'
 005EE8E3    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE8E6    call        THashTable.Add
 005EE8EB    mov         ecx,2
 005EE8F0    mov         edx,5EF974;'Button2'
 005EE8F5    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE8F8    call        THashTable.Add
 005EE8FD    mov         ecx,3
 005EE902    mov         edx,5EF990;'Button3'
 005EE907    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE90A    call        THashTable.Add
 005EE90F    mov         ecx,4
 005EE914    mov         edx,5EF9AC;'Button4'
 005EE919    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE91C    call        THashTable.Add
 005EE921    mov         ecx,5
 005EE926    mov         edx,5EF9C8;'Button5'
 005EE92B    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE92E    call        THashTable.Add
 005EE933    mov         ecx,1
 005EE938    mov         edx,5EF9E4;'LMB'
 005EE93D    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE940    call        THashTable.Add
 005EE945    mov         ecx,2
 005EE94A    mov         edx,5EF9F8;'RMB'
 005EE94F    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE952    call        THashTable.Add
 005EE957    mov         ecx,3
 005EE95C    mov         edx,5EFA0C;'MMB'
 005EE961    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE964    call        THashTable.Add
 005EE969    mov         ecx,4
 005EE96E    mov         edx,5EFA20;'XMB1'
 005EE973    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE976    call        THashTable.Add
 005EE97B    mov         ecx,5
 005EE980    mov         edx,5EFA38;'XMB2'
 005EE985    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE988    call        THashTable.Add
 005EE98D    mov         ecx,0E
 005EE992    mov         edx,5EFA50;'XButton3'
 005EE997    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE99A    call        THashTable.Add
 005EE99F    mov         ecx,0F
 005EE9A4    mov         edx,5EFA70;'XButton4'
 005EE9A9    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE9AC    call        THashTable.Add
 005EE9B1    mov         ecx,10
 005EE9B6    mov         edx,5EFA90;'XButton5'
 005EE9BB    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE9BE    call        THashTable.Add
 005EE9C3    mov         ecx,0E
 005EE9C8    mov         edx,5EFAB0;'XMB3'
 005EE9CD    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE9D0    call        THashTable.Add
 005EE9D5    mov         ecx,0F
 005EE9DA    mov         edx,5EFAC8;'XMB4'
 005EE9DF    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE9E2    call        THashTable.Add
 005EE9E7    mov         ecx,10
 005EE9EC    mov         edx,5EFAE0;'XMB5'
 005EE9F1    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EE9F4    call        THashTable.Add
 005EE9F9    mov         ecx,6
 005EE9FE    mov         edx,5EFAF8;'ScrollUp'
 005EEA03    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEA06    call        THashTable.Add
 005EEA0B    mov         ecx,7
 005EEA10    mov         edx,5EFB18;'ScrollDown'
 005EEA15    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEA18    call        THashTable.Add
 005EEA1D    mov         ecx,6
 005EEA22    mov         edx,5EFB3C;'ScrollWheelUp'
 005EEA27    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEA2A    call        THashTable.Add
 005EEA2F    mov         ecx,7
 005EEA34    mov         edx,5EFB64;'ScrollWheelDown'
 005EEA39    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEA3C    call        THashTable.Add
 005EEA41    mov         ecx,24
 005EEA46    mov         edx,5EFB90;'ScrollLeft'
 005EEA4B    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEA4E    call        THashTable.Add
 005EEA53    mov         ecx,25
 005EEA58    mov         edx,5EFBB4;'ScrollRight'
 005EEA5D    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEA60    call        THashTable.Add
 005EEA65    mov         ecx,24
 005EEA6A    mov         edx,5EFBD8;'ScrollWheelLeft'
 005EEA6F    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEA72    call        THashTable.Add
 005EEA77    mov         ecx,25
 005EEA7C    mov         edx,5EFC04;'ScrollWheelRight'
 005EEA81    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEA84    call        THashTable.Add
 005EEA89    mov         ecx,0A
 005EEA8E    mov         edx,5EFC34;'VirtualX'
 005EEA93    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEA96    call        THashTable.Add
 005EEA9B    mov         ecx,0B
 005EEAA0    mov         edx,5EFC54;'VirtualY'
 005EEAA5    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEAA8    call        THashTable.Add
 005EEAAD    mov         ecx,0C
 005EEAB2    mov         edx,5EFC74;'DInputX'
 005EEAB7    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEABA    call        THashTable.Add
 005EEABF    mov         ecx,0D
 005EEAC4    mov         edx,5EFC90;'DInputY'
 005EEAC9    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEACC    call        THashTable.Add
 005EEAD1    mov         ecx,1C
 005EEAD6    mov         edx,5EFCAC;'DInputZ'
 005EEADB    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEADE    call        THashTable.Add
 005EEAE3    mov         ecx,23
 005EEAE8    mov         edx,5EFCC8;'DInputH'
 005EEAED    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEAF0    call        THashTable.Add
 005EEAF5    mov         ecx,0C
 005EEAFA    mov         edx,5EFCE4;'DIX'
 005EEAFF    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEB02    call        THashTable.Add
 005EEB07    mov         ecx,0D
 005EEB0C    mov         edx,5EFCF8;'DIY'
 005EEB11    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEB14    call        THashTable.Add
 005EEB19    mov         ecx,1C
 005EEB1E    mov         edx,5EFD0C;'DIZ'
 005EEB23    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEB26    call        THashTable.Add
 005EEB2B    mov         ecx,23
 005EEB30    mov         edx,5EFD20;'DIH'
 005EEB35    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEB38    call        THashTable.Add
 005EEB3D    mov         ecx,11
 005EEB42    mov         edx,5EFD34;'CursorX'
 005EEB47    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEB4A    call        THashTable.Add
 005EEB4F    mov         ecx,12
 005EEB54    mov         edx,5EFD50;'CursorY'
 005EEB59    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEB5C    call        THashTable.Add
 005EEB61    mov         ecx,18
 005EEB66    mov         edx,5EFD6C;'MousePointer'
 005EEB6B    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEB6E    call        THashTable.Add
 005EEB73    mov         ecx,18
 005EEB78    mov         edx,5EFD94;'Pointer'
 005EEB7D    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEB80    call        THashTable.Add
 005EEB85    mov         ecx,1C
 005EEB8A    mov         edx,5EFDB0;'Wheel'
 005EEB8F    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEB92    call        THashTable.Add
 005EEB97    mov         ecx,23
 005EEB9C    mov         edx,5EFDC8;'HWheel'
 005EEBA1    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEBA4    call        THashTable.Add
 005EEBA9    mov         ecx,23
 005EEBAE    mov         edx,5EFDE4;'WheelH'
 005EEBB3    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEBB6    call        THashTable.Add
 005EEBBB    mov         ecx,23
 005EEBC0    mov         edx,5EFE00;'HorizontalWheel'
 005EEBC5    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEBC8    call        THashTable.Add
 005EEBCD    mov         ecx,23
 005EEBD2    mov         edx,5EFE2C;'Wheel2'
 005EEBD7    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEBDA    call        THashTable.Add
 005EEBDF    mov         ecx,6
 005EEBE4    mov         edx,5EFE48;'Wheel.Up'
 005EEBE9    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEBEC    call        THashTable.Add
 005EEBF1    mov         ecx,7
 005EEBF6    mov         edx,5EFE68;'Wheel.Down'
 005EEBFB    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEBFE    call        THashTable.Add
 005EEC03    mov         ecx,24
 005EEC08    mov         edx,5EFE8C;'Wheel.Left'
 005EEC0D    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEC10    call        THashTable.Add
 005EEC15    mov         ecx,25
 005EEC1A    mov         edx,5EFEB0;'Wheel.Right'
 005EEC1F    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEC22    call        THashTable.Add
 005EEC27    mov         ecx,3
 005EEC2C    mov         edx,5EFED4;'Wheel.Button'
 005EEC31    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEC34    call        THashTable.Add
 005EEC39    mov         ecx,3
 005EEC3E    mov         edx,5EFEFC;'WheelButton'
 005EEC43    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEC46    call        THashTable.Add
 005EEC4B    mov         ecx,0A
 005EEC50    mov         edx,5EFF20;'VirtualDesktop.X'
 005EEC55    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEC58    call        THashTable.Add
 005EEC5D    mov         ecx,0B
 005EEC62    mov         edx,5EFF50;'VirtualDesktop.Y'
 005EEC67    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEC6A    call        THashTable.Add
 005EEC6F    mov         ecx,0C
 005EEC74    mov         edx,5EFF80;^338:Single
 005EEC79    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEC7C    call        THashTable.Add
 005EEC81    mov         ecx,0D
 005EEC86    mov         edx,5EFFA8;^338:Single
 005EEC8B    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEC8E    call        THashTable.Add
 005EEC93    mov         ecx,1C
 005EEC98    mov         edx,5EFFD0;^338:Single
 005EEC9D    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EECA0    call        THashTable.Add
 005EECA5    mov         ecx,23
 005EECAA    mov         edx,5EFFF8;^338:Single
 005EECAF    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EECB2    call        THashTable.Add
 005EECB7    mov         ecx,11
 005EECBC    mov         edx,5F0020;'CursorPos.X'
 005EECC1    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EECC4    call        THashTable.Add
 005EECC9    mov         ecx,12
 005EECCE    mov         edx,5F0044;'CursorPos.Y'
 005EECD3    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EECD6    call        THashTable.Add
 005EECDB    mov         ecx,13
 005EECE0    mov         edx,5F0068;'Wheel.ScrollLines'
 005EECE5    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EECE8    call        THashTable.Add
 005EECED    mov         ecx,15
 005EECF2    mov         edx,5F0098;'Wheel.Present'
 005EECF7    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EECFA    call        THashTable.Add
 005EECFF    mov         ecx,17
 005EED04    mov         edx,5EF85C;'DoubleClickTime'
 005EED09    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EED0C    call        THashTable.Add
 005EED11    mov         ecx,19
 005EED16    mov         edx,5F00C0;'Cursor.Visible'
 005EED1B    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EED1E    call        THashTable.Add
 005EED23    mov         ecx,11
 005EED28    mov         edx,5F00EC;'Cursor.Pos.X'
 005EED2D    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EED30    call        THashTable.Add
 005EED35    mov         ecx,12
 005EED3A    mov         edx,5F0114;'Cursor.Pos.Y'
 005EED3F    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EED42    call        THashTable.Add
 005EED47    mov         ecx,11
 005EED4C    mov         edx,5F013C;'Cursor.X'
 005EED51    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EED54    call        THashTable.Add
 005EED59    mov         ecx,12
 005EED5E    mov         edx,5F015C;'Cursor.Y'
 005EED63    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EED66    call        THashTable.Add
 005EED6B    mov         ecx,1A
 005EED70    mov         edx,5F017C;'Cursor.THandle'
 005EED75    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EED78    call        THashTable.Add
 005EED7D    mov         ecx,1
 005EED82    mov         edx,5F01A8;'mb1'
 005EED87    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EED8A    call        THashTable.Add
 005EED8F    mov         ecx,2
 005EED94    mov         edx,5F01BC;'mb2'
 005EED99    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EED9C    call        THashTable.Add
 005EEDA1    mov         ecx,3
 005EEDA6    mov         edx,5F01D0;'mb3'
 005EEDAB    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEDAE    call        THashTable.Add
 005EEDB3    mov         ecx,4
 005EEDB8    mov         edx,5F01E4;'mb4'
 005EEDBD    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEDC0    call        THashTable.Add
 005EEDC5    mov         ecx,5
 005EEDCA    mov         edx,5F01F8;'mb5'
 005EEDCF    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEDD2    call        THashTable.Add
 005EEDD7    mov         ecx,0E
 005EEDDC    mov         edx,5F020C;'mb6'
 005EEDE1    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEDE4    call        THashTable.Add
 005EEDE9    mov         ecx,0F
 005EEDEE    mov         edx,5F0220;'mb7'
 005EEDF3    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEDF6    call        THashTable.Add
 005EEDFB    mov         ecx,10
 005EEE00    mov         edx,5F0234;'mb8'
 005EEE05    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEE08    call        THashTable.Add
 005EEE0D    mov         ecx,1
 005EEE12    mov         edx,5F0248;'LeftMouseButton'
 005EEE17    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEE1A    call        THashTable.Add
 005EEE1F    mov         ecx,2
 005EEE24    mov         edx,5F0274;'RightMouseButton'
 005EEE29    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEE2C    call        THashTable.Add
 005EEE31    mov         ecx,3
 005EEE36    mov         edx,5F02A4;'MiddleMouseButton'
 005EEE3B    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEE3E    call        THashTable.Add
 005EEE43    mov         ecx,1D
 005EEE48    mov         edx,5F02D4;'CursorPos'
 005EEE4D    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEE50    call        THashTable.Add
 005EEE55    mov         ecx,1E
 005EEE5A    mov         edx,5F02F4;'xy'
 005EEE5F    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEE62    call        THashTable.Add
 005EEE67    mov         ecx,1E
 005EEE6C    mov         edx,5F0308;'ScreenFraction'
 005EEE71    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEE74    call        THashTable.Add
 005EEE79    mov         ecx,1F
 005EEE7E    mov         edx,5F0334;'DesktopFraction'
 005EEE83    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEE86    call        THashTable.Add
 005EEE8B    mov         ecx,20
 005EEE90    mov         edx,5F0360;^338:Single
 005EEE95    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEE98    call        THashTable.Add
 005EEE9D    mov         ecx,21
 005EEEA2    mov         edx,5F038C;^338:Single
 005EEEA7    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEEAA    call        THashTable.Add
 005EEEAF    mov         ecx,20
 005EEEB4    mov         edx,5F03B4;^338:Single
 005EEEB9    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEEBC    call        THashTable.Add
 005EEEC1    mov         ecx,21
 005EEEC6    mov         edx,5F03DC;'DInput3D'
 005EEECB    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEECE    call        THashTable.Add
 005EEED3    mov         ecx,20
 005EEED8    mov         edx,5F03FC;'DInput2D'
 005EEEDD    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEEE0    call        THashTable.Add
 005EEEE5    mov         ecx,20
 005EEEEA    mov         edx,5F041C;'DInput'
 005EEEEF    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEEF2    call        THashTable.Add
 005EEEF7    mov         ecx,20
 005EEEFC    mov         edx,5F0438;'DInputPos'
 005EEF01    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEF04    call        THashTable.Add
 005EEF09    mov         ecx,20
 005EEF0E    mov         edx,5F0458;^338:Single
 005EEF13    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEF16    call        THashTable.Add
 005EEF1B    mov         ecx,20
 005EEF20    mov         edx,5F047C;'AbsolutePos'
 005EEF25    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEF28    call        THashTable.Add
 005EEF2D    mov         ecx,32
 005EEF32    mov         edx,5F04A0;'FakeDirectInputPos'
 005EEF37    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEF3A    call        THashTable.Add
 005EEF3F    mov         ecx,32
 005EEF44    mov         edx,5F04D4;'FakeDirectInput2D'
 005EEF49    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEF4C    call        THashTable.Add
 005EEF51    mov         ecx,32
 005EEF56    mov         edx,5F0504;'FakeDirectInput'
 005EEF5B    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEF5E    call        THashTable.Add
 005EEF63    mov         ecx,32
 005EEF68    mov         edx,5F0530;'FakeDInputPos'
 005EEF6D    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEF70    call        THashTable.Add
 005EEF75    mov         ecx,32
 005EEF7A    mov         edx,5F0558;'FakeDInput2D'
 005EEF7F    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEF82    call        THashTable.Add
 005EEF87    mov         ecx,32
 005EEF8C    mov         edx,5F0580;'FakeDInput'
 005EEF91    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEF94    call        THashTable.Add
 005EEF99    mov         ecx,33
 005EEF9E    mov         edx,5F05A4;'RealDirectInputPos'
 005EEFA3    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEFA6    call        THashTable.Add
 005EEFAB    mov         ecx,33
 005EEFB0    mov         edx,5F05D8;'RealDirectInput2D'
 005EEFB5    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEFB8    call        THashTable.Add
 005EEFBD    mov         ecx,33
 005EEFC2    mov         edx,5F0608;'RealDirectInput'
 005EEFC7    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEFCA    call        THashTable.Add
 005EEFCF    mov         ecx,33
 005EEFD4    mov         edx,5F0634;'RealDInputPos'
 005EEFD9    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEFDC    call        THashTable.Add
 005EEFE1    mov         ecx,33
 005EEFE6    mov         edx,5F065C;'RealDInput2D'
 005EEFEB    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EEFEE    call        THashTable.Add
 005EEFF3    mov         ecx,33
 005EEFF8    mov         edx,5F0684;'RealDInput'
 005EEFFD    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EF000    call        THashTable.Add
 005EF005    mov         ecx,22
 005EF00A    mov         edx,5F06A8;'Count'
 005EF00F    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EF012    call        THashTable.Add
 005EF017    mov         ecx,26
 005EF01C    mov         edx,5F06C0;'Swallow'
 005EF021    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EF024    call        THashTable.Add
 005EF029    mov         ecx,26
 005EF02E    mov         edx,5F06DC;'Swallowed'
 005EF033    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EF036    call        THashTable.Add
 005EF03B    mov         ecx,27
 005EF040    mov         edx,5F06FC;'SwallowMovement'
 005EF045    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EF048    call        THashTable.Add
 005EF04D    mov         ecx,28
 005EF052    mov         edx,5F0728;'SwallowButtons'
 005EF057    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EF05A    call        THashTable.Add
 005EF05F    mov         ecx,29
 005EF064    mov         edx,5F0754;'SwallowWheels'
 005EF069    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005EF06C    call        THashTable.Add
 005EF071    pop         ebx
 005EF072    ret
*}
end;

//005F0770
procedure TModuleMouse.ClearRead;
begin
{*
 005F0770    call        TPieModule.ClearRead
 005F0775    ret
*}
end;

//005F0778
constructor TModuleMouse.Create;
begin
{*
 005F0778    push        ebx
 005F0779    push        esi
 005F077A    test        dl,dl
>005F077C    je          005F0786
 005F077E    add         esp,0FFFFFFF0
 005F0781    call        @ClassCreate
 005F0786    mov         ebx,edx
 005F0788    mov         esi,eax
 005F078A    push        5F07CC;'Mice'
 005F078F    push        5F07E4;'Mouses'
 005F0794    push        0
 005F0796    push        0
 005F0798    mov         ecx,5F0800;'Mouse'
 005F079D    xor         edx,edx
 005F079F    mov         eax,esi
 005F07A1    call        005E48EC
 005F07A6    mov         eax,esi
 005F07A8    test        bl,bl
>005F07AA    je          005F07BB
 005F07AC    call        @AfterConstruction
 005F07B1    pop         dword ptr fs:[0]
 005F07B8    add         esp,0C
 005F07BB    mov         eax,esi
 005F07BD    pop         esi
 005F07BE    pop         ebx
 005F07BF    ret
*}
end;

//005F080C
function TModuleMouse.CreateValue(Identifier:string):TExpression;
begin
{*
 005F080C    push        ebp
 005F080D    mov         ebp,esp
 005F080F    push        ecx
 005F0810    push        ebx
 005F0811    mov         dword ptr [ebp-4],edx
 005F0814    mov         ebx,eax
 005F0816    mov         eax,dword ptr [ebp-4]
 005F0819    call        @UStrAddRef
 005F081E    xor         eax,eax
 005F0820    push        ebp
 005F0821    push        5F0850
 005F0826    push        dword ptr fs:[eax]
 005F0829    mov         dword ptr fs:[eax],esp
 005F082C    mov         byte ptr [ebx+24],1;TModuleMouse.Used:Boolean
 005F0830    mov         eax,dword ptr [ebp-4]
 005F0833    call        005EA658
 005F0838    mov         ebx,eax
 005F083A    xor         eax,eax
 005F083C    pop         edx
 005F083D    pop         ecx
 005F083E    pop         ecx
 005F083F    mov         dword ptr fs:[eax],edx
 005F0842    push        5F0857
 005F0847    lea         eax,[ebp-4]
 005F084A    call        @UStrClr
 005F084F    ret
>005F0850    jmp         @HandleFinally
>005F0855    jmp         005F0847
 005F0857    mov         eax,ebx
 005F0859    pop         ebx
 005F085A    pop         ecx
 005F085B    pop         ebp
 005F085C    ret
*}
end;

//005F0860
function TModuleMouse.GetDefaultFormat(field:string):TGuiFormat;
begin
{*
 005F0860    push        ebp
 005F0861    mov         ebp,esp
 005F0863    push        ecx
 005F0864    push        ebx
 005F0865    mov         dword ptr [ebp-4],edx
 005F0868    mov         ebx,eax
 005F086A    mov         eax,dword ptr [ebp-4]
 005F086D    call        @UStrAddRef
 005F0872    xor         eax,eax
 005F0874    push        ebp
 005F0875    push        5F08DD
 005F087A    push        dword ptr fs:[eax]
 005F087D    mov         dword ptr fs:[eax],esp
 005F0880    mov         edx,dword ptr [ebp-4]
 005F0883    mov         eax,dword ptr [ebx+1C];TModuleMouse.Fields:THashTable
 005F0886    call        THashTable.Get
 005F088B    add         eax,0FFFFFFF4
 005F088E    cmp         eax,17
>005F0891    ja          005F08C5
 005F0893    movzx       eax,byte ptr [eax+5F08A1]
 005F089A    jmp         dword ptr [eax*4+5F08B9]
 005F089A    db          1
 005F089A    db          1
 005F089A    db          0
 005F089A    db          0
 005F089A    db          0
 005F089A    db          1
 005F089A    db          1
 005F089A    db          1
 005F089A    db          0
 005F089A    db          0
 005F089A    db          0
 005F089A    db          1
 005F089A    db          1
 005F089A    db          0
 005F089A    db          0
 005F089A    db          1
 005F089A    db          1
 005F089A    db          1
 005F089A    db          0
 005F089A    db          0
 005F089A    db          1
 005F089A    db          1
 005F089A    db          1
 005F089A    db          1
 005F089A    dd          005F08C5
 005F089A    dd          005F08C1
 005F08C1    mov         bl,9
>005F08C3    jmp         005F08C7
 005F08C5    xor         ebx,ebx
 005F08C7    xor         eax,eax
 005F08C9    pop         edx
 005F08CA    pop         ecx
 005F08CB    pop         ecx
 005F08CC    mov         dword ptr fs:[eax],edx
 005F08CF    push        5F08E4
 005F08D4    lea         eax,[ebp-4]
 005F08D7    call        @UStrClr
 005F08DC    ret
>005F08DD    jmp         @HandleFinally
>005F08E2    jmp         005F08D4
 005F08E4    mov         eax,ebx
 005F08E6    pop         ebx
 005F08E7    pop         ecx
 005F08E8    pop         ebp
 005F08E9    ret
*}
end;

//005F08EC
procedure TModuleMouse.GetGoodFields;
begin
{*
 005F08EC    call        005EAEB4
 005F08F1    ret
*}
end;

//005F08F4
procedure TModuleMouse.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 005F08F4    push        ebp
 005F08F5    mov         ebp,esp
 005F08F7    mov         byte ptr [edx],1
 005F08FA    xor         eax,eax
 005F08FC    mov         dword ptr [ecx],eax
 005F08FE    mov         eax,dword ptr [ebp+8]
 005F0901    mov         dword ptr [eax],0F
 005F0907    pop         ebp
 005F0908    ret         4
*}
end;

//005F090C
function TModuleMouse.IsIdentifier(s:string):Boolean;
begin
{*
 005F090C    push        ebp
 005F090D    mov         ebp,esp
 005F090F    add         esp,0FFFFFFF8
 005F0912    push        ebx
 005F0913    xor         ecx,ecx
 005F0915    mov         dword ptr [ebp-8],ecx
 005F0918    mov         dword ptr [ebp-4],edx
 005F091B    mov         eax,dword ptr [ebp-4]
 005F091E    call        @UStrAddRef
 005F0923    xor         eax,eax
 005F0925    push        ebp
 005F0926    push        5F0A5D
 005F092B    push        dword ptr fs:[eax]
 005F092E    mov         dword ptr fs:[eax],esp
 005F0931    lea         edx,[ebp-8]
 005F0934    mov         eax,dword ptr [ebp-4]
 005F0937    call        LowerCase
 005F093C    mov         edx,dword ptr [ebp-8]
 005F093F    lea         eax,[ebp-4]
 005F0942    call        @UStrLAsg
 005F0947    mov         eax,dword ptr [ebp-4]
 005F094A    mov         edx,5F0A78;'lmb'
 005F094F    call        @UStrEqual
>005F0954    je          005F09CE
 005F0956    mov         eax,dword ptr [ebp-4]
 005F0959    mov         edx,5F0A8C;'rmb'
 005F095E    call        @UStrEqual
>005F0963    je          005F09CE
 005F0965    mov         eax,dword ptr [ebp-4]
 005F0968    mov         edx,5F0AA0;'mmb'
 005F096D    call        @UStrEqual
>005F0972    je          005F09CE
 005F0974    mov         eax,dword ptr [ebp-4]
 005F0977    mov         edx,5F0AB4;'LeftMouseButton'
 005F097C    call        @UStrEqual
>005F0981    je          005F09CE
 005F0983    mov         eax,dword ptr [ebp-4]
 005F0986    mov         edx,5F0AE0;'RightMouseButton'
 005F098B    call        @UStrEqual
>005F0990    je          005F09CE
 005F0992    mov         eax,dword ptr [ebp-4]
 005F0995    mov         edx,5F0B10;'MiddleMouseButton'
 005F099A    call        @UStrEqual
>005F099F    je          005F09CE
 005F09A1    mov         eax,dword ptr [ebp-4]
 005F09A4    mov         edx,5F0B40;'mb1'
 005F09A9    call        @UStrEqual
>005F09AE    je          005F09CE
 005F09B0    mov         eax,dword ptr [ebp-4]
 005F09B3    mov         edx,5F0B54;'mb2'
 005F09B8    call        @UStrEqual
>005F09BD    je          005F09CE
 005F09BF    mov         eax,dword ptr [ebp-4]
 005F09C2    mov         edx,5F0B68;'mb3'
 005F09C7    call        @UStrEqual
>005F09CC    jne         005F09D2
 005F09CE    mov         bl,1
>005F09D0    jmp         005F0A42
 005F09D2    lea         eax,[ebp-4]
 005F09D5    mov         edx,5F0B7C;'real'
 005F09DA    call        004F9BD0
 005F09DF    lea         eax,[ebp-4]
 005F09E2    mov         edx,5F0B94;'fake'
 005F09E7    call        004F9BD0
 005F09EC    lea         eax,[ebp-4]
 005F09EF    mov         edx,5F0BAC;'mouses'
 005F09F4    call        004F9BD0
 005F09F9    test        al,al
>005F09FB    jne         005F0A23
 005F09FD    lea         eax,[ebp-4]
 005F0A00    mov         edx,5F0BC8;'mouse'
 005F0A05    call        004F9BD0
 005F0A0A    test        al,al
>005F0A0C    jne         005F0A23
 005F0A0E    lea         eax,[ebp-4]
 005F0A11    mov         edx,5F0BE0;'mice'
 005F0A16    call        004F9BD0
 005F0A1B    test        al,al
>005F0A1D    jne         005F0A23
 005F0A1F    xor         ebx,ebx
>005F0A21    jmp         005F0A42
 005F0A23    lea         eax,[ebp-4]
 005F0A26    call        004F9D00
 005F0A2B    lea         eax,[ebp-4]
 005F0A2E    mov         edx,5F0BF8;'.'
 005F0A33    call        004F9BD0
 005F0A38    test        al,al
>005F0A3A    jne         005F0A40
 005F0A3C    xor         ebx,ebx
>005F0A3E    jmp         005F0A42
 005F0A40    mov         bl,1
 005F0A42    xor         eax,eax
 005F0A44    pop         edx
 005F0A45    pop         ecx
 005F0A46    pop         ecx
 005F0A47    mov         dword ptr fs:[eax],edx
 005F0A4A    push        5F0A64
 005F0A4F    lea         eax,[ebp-8]
 005F0A52    mov         edx,2
 005F0A57    call        @UStrArrayClr
 005F0A5C    ret
>005F0A5D    jmp         @HandleFinally
>005F0A62    jmp         005F0A4F
 005F0A64    mov         eax,ebx
 005F0A66    pop         ebx
 005F0A67    pop         ecx
 005F0A68    pop         ecx
 005F0A69    pop         ebp
 005F0A6A    ret
*}
end;

//005F0BFC
procedure TModuleMouse.MonitorFrame;
begin
{*
 005F0BFC    push        ebp
 005F0BFD    mov         ebp,esp
 005F0BFF    mov         ecx,0D
 005F0C04    push        0
 005F0C06    push        0
 005F0C08    dec         ecx
>005F0C09    jne         005F0C04
 005F0C0B    push        ebx
 005F0C0C    push        esi
 005F0C0D    push        edi
 005F0C0E    mov         dword ptr [ebp-4],eax
 005F0C11    xor         eax,eax
 005F0C13    push        ebp
 005F0C14    push        5F0E9E
 005F0C19    push        dword ptr fs:[eax]
 005F0C1C    mov         dword ptr fs:[eax],esp
 005F0C1F    mov         esi,8162A4;gvar_008162A4:Single
 005F0C24    lea         edi,[ebp-18]
 005F0C27    movs        dword ptr [edi],dword ptr [esi]
 005F0C28    movs        dword ptr [edi],dword ptr [esi]
 005F0C29    movs        dword ptr [edi],dword ptr [esi]
 005F0C2A    movs        dword ptr [edi],dword ptr [esi]
 005F0C2B    movs        dword ptr [edi],dword ptr [esi]
 005F0C2C    call        005EDA58
 005F0C31    test        al,al
>005F0C33    je          005F0E83
 005F0C39    xor         edi,edi
 005F0C3B    mov         ebx,8162B0;gvar_008162B0
 005F0C40    lea         esi,[ebp-0C]
 005F0C43    test        byte ptr [ebx],80
>005F0C46    jbe         005F0C7E
 005F0C48    test        byte ptr [esi],80
>005F0C4B    jne         005F0C7E
 005F0C4D    lea         ecx,[ebp-20]
 005F0C50    lea         edx,[edi+1]
 005F0C53    sub         edx,0
 005F0C56    mov         eax,dword ptr [ebp-4]
 005F0C59    mov         eax,dword ptr [eax+1C];TModuleMouse.Fields:THashTable
 005F0C5C    call        THashTable.Get
 005F0C61    mov         ecx,dword ptr [ebp-20]
 005F0C64    lea         eax,[ebp-1C]
 005F0C67    mov         edx,5F0EB8;'Mouse.'
 005F0C6C    call        @UStrCat3
 005F0C71    mov         edx,dword ptr [ebp-1C]
 005F0C74    mov         eax,dword ptr [ebp-4]
 005F0C77    call        005E4F6C
>005F0C7C    jmp         005F0CB7
 005F0C7E    test        byte ptr [esi],80
>005F0C81    jbe         005F0CB7
 005F0C83    test        byte ptr [ebx],80
>005F0C86    jne         005F0CB7
 005F0C88    lea         ecx,[ebp-28]
 005F0C8B    lea         edx,[edi+1]
 005F0C8E    sub         edx,0
 005F0C91    mov         eax,dword ptr [ebp-4]
 005F0C94    mov         eax,dword ptr [eax+1C];TModuleMouse.Fields:THashTable
 005F0C97    call        THashTable.Get
 005F0C9C    mov         ecx,dword ptr [ebp-28]
 005F0C9F    lea         eax,[ebp-24]
 005F0CA2    mov         edx,5F0EB8;'Mouse.'
 005F0CA7    call        @UStrCat3
 005F0CAC    mov         edx,dword ptr [ebp-24]
 005F0CAF    mov         eax,dword ptr [ebp-4]
 005F0CB2    call        005E4FB4
 005F0CB7    inc         edi
 005F0CB8    inc         esi
 005F0CB9    inc         ebx
 005F0CBA    cmp         edi,8
>005F0CBD    jne         005F0C43
 005F0CBF    fild        dword ptr ds:[8162BC];gvar_008162BC:Single
 005F0CC5    fcomp       qword ptr ds:[78BC68];gvar_0078BC68:Double
 005F0CCB    wait
 005F0CCC    fnstsw      al
 005F0CCE    sahf
>005F0CCF    jae         005F0D32
 005F0CD1    lea         ecx,[ebp-30]
 005F0CD4    mov         eax,dword ptr [ebp-4]
 005F0CD7    mov         eax,dword ptr [eax+1C];TModuleMouse.Fields:THashTable
 005F0CDA    mov         edx,6
 005F0CDF    call        THashTable.Get
 005F0CE4    mov         ecx,dword ptr [ebp-30]
 005F0CE7    lea         eax,[ebp-2C]
 005F0CEA    mov         edx,5F0EB8;'Mouse.'
 005F0CEF    call        @UStrCat3
 005F0CF4    mov         edx,dword ptr [ebp-2C]
 005F0CF7    mov         eax,dword ptr [ebp-4]
 005F0CFA    call        005E4F6C
 005F0CFF    lea         ecx,[ebp-38]
 005F0D02    mov         eax,dword ptr [ebp-4]
 005F0D05    mov         eax,dword ptr [eax+1C];TModuleMouse.Fields:THashTable
 005F0D08    mov         edx,6
 005F0D0D    call        THashTable.Get
 005F0D12    mov         ecx,dword ptr [ebp-38]
 005F0D15    lea         eax,[ebp-34]
 005F0D18    mov         edx,5F0EB8;'Mouse.'
 005F0D1D    call        @UStrCat3
 005F0D22    mov         edx,dword ptr [ebp-34]
 005F0D25    mov         eax,dword ptr [ebp-4]
 005F0D28    call        005E4FB4
>005F0D2D    jmp         005F0E83
 005F0D32    fild        dword ptr ds:[8162BC];gvar_008162BC:Single
 005F0D38    fcomp       qword ptr ds:[78BC68];gvar_0078BC68:Double
 005F0D3E    wait
 005F0D3F    fnstsw      al
 005F0D41    sahf
>005F0D42    jbe         005F0DA5
 005F0D44    lea         ecx,[ebp-40]
 005F0D47    mov         eax,dword ptr [ebp-4]
 005F0D4A    mov         eax,dword ptr [eax+1C];TModuleMouse.Fields:THashTable
 005F0D4D    mov         edx,7
 005F0D52    call        THashTable.Get
 005F0D57    mov         ecx,dword ptr [ebp-40]
 005F0D5A    lea         eax,[ebp-3C]
 005F0D5D    mov         edx,5F0EB8;'Mouse.'
 005F0D62    call        @UStrCat3
 005F0D67    mov         edx,dword ptr [ebp-3C]
 005F0D6A    mov         eax,dword ptr [ebp-4]
 005F0D6D    call        005E4F6C
 005F0D72    lea         ecx,[ebp-48]
 005F0D75    mov         eax,dword ptr [ebp-4]
 005F0D78    mov         eax,dword ptr [eax+1C];TModuleMouse.Fields:THashTable
 005F0D7B    mov         edx,7
 005F0D80    call        THashTable.Get
 005F0D85    mov         ecx,dword ptr [ebp-48]
 005F0D88    lea         eax,[ebp-44]
 005F0D8B    mov         edx,5F0EB8;'Mouse.'
 005F0D90    call        @UStrCat3
 005F0D95    mov         edx,dword ptr [ebp-44]
 005F0D98    mov         eax,dword ptr [ebp-4]
 005F0D9B    call        005E4FB4
>005F0DA0    jmp         005F0E83
 005F0DA5    fild        dword ptr ds:[8162B8];gvar_008162B8:Single
 005F0DAB    fcomp       qword ptr ds:[78BC70];gvar_0078BC70:Double
 005F0DB1    wait
 005F0DB2    fnstsw      al
 005F0DB4    sahf
>005F0DB5    jbe         005F0E15
 005F0DB7    lea         ecx,[ebp-50]
 005F0DBA    mov         eax,dword ptr [ebp-4]
 005F0DBD    mov         eax,dword ptr [eax+1C];TModuleMouse.Fields:THashTable
 005F0DC0    mov         edx,24
 005F0DC5    call        THashTable.Get
 005F0DCA    mov         ecx,dword ptr [ebp-50]
 005F0DCD    lea         eax,[ebp-4C]
 005F0DD0    mov         edx,5F0EB8;'Mouse.'
 005F0DD5    call        @UStrCat3
 005F0DDA    mov         edx,dword ptr [ebp-4C]
 005F0DDD    mov         eax,dword ptr [ebp-4]
 005F0DE0    call        005E4F6C
 005F0DE5    lea         ecx,[ebp-58]
 005F0DE8    mov         eax,dword ptr [ebp-4]
 005F0DEB    mov         eax,dword ptr [eax+1C];TModuleMouse.Fields:THashTable
 005F0DEE    mov         edx,24
 005F0DF3    call        THashTable.Get
 005F0DF8    mov         ecx,dword ptr [ebp-58]
 005F0DFB    lea         eax,[ebp-54]
 005F0DFE    mov         edx,5F0EB8;'Mouse.'
 005F0E03    call        @UStrCat3
 005F0E08    mov         edx,dword ptr [ebp-54]
 005F0E0B    mov         eax,dword ptr [ebp-4]
 005F0E0E    call        005E4FB4
>005F0E13    jmp         005F0E83
 005F0E15    fild        dword ptr ds:[8162B8];gvar_008162B8:Single
 005F0E1B    fcomp       qword ptr ds:[78BC70];gvar_0078BC70:Double
 005F0E21    wait
 005F0E22    fnstsw      al
 005F0E24    sahf
>005F0E25    jae         005F0E83
 005F0E27    lea         ecx,[ebp-60]
 005F0E2A    mov         eax,dword ptr [ebp-4]
 005F0E2D    mov         eax,dword ptr [eax+1C];TModuleMouse.Fields:THashTable
 005F0E30    mov         edx,25
 005F0E35    call        THashTable.Get
 005F0E3A    mov         ecx,dword ptr [ebp-60]
 005F0E3D    lea         eax,[ebp-5C]
 005F0E40    mov         edx,5F0EB8;'Mouse.'
 005F0E45    call        @UStrCat3
 005F0E4A    mov         edx,dword ptr [ebp-5C]
 005F0E4D    mov         eax,dword ptr [ebp-4]
 005F0E50    call        005E4F6C
 005F0E55    lea         ecx,[ebp-68]
 005F0E58    mov         eax,dword ptr [ebp-4]
 005F0E5B    mov         eax,dword ptr [eax+1C];TModuleMouse.Fields:THashTable
 005F0E5E    mov         edx,25
 005F0E63    call        THashTable.Get
 005F0E68    mov         ecx,dword ptr [ebp-68]
 005F0E6B    lea         eax,[ebp-64]
 005F0E6E    mov         edx,5F0EB8;'Mouse.'
 005F0E73    call        @UStrCat3
 005F0E78    mov         edx,dword ptr [ebp-64]
 005F0E7B    mov         eax,dword ptr [ebp-4]
 005F0E7E    call        005E4FB4
 005F0E83    xor         eax,eax
 005F0E85    pop         edx
 005F0E86    pop         ecx
 005F0E87    pop         ecx
 005F0E88    mov         dword ptr fs:[eax],edx
 005F0E8B    push        5F0EA5
 005F0E90    lea         eax,[ebp-68]
 005F0E93    mov         edx,14
 005F0E98    call        @UStrArrayClr
 005F0E9D    ret
>005F0E9E    jmp         @HandleFinally
>005F0EA3    jmp         005F0E90
 005F0EA5    pop         edi
 005F0EA6    pop         esi
 005F0EA7    pop         ebx
 005F0EA8    mov         esp,ebp
 005F0EAA    pop         ebp
 005F0EAB    ret
*}
end;

//005F0EC8
procedure TModuleMouse.PrepareForMonitoring;
begin
{*
 005F0EC8    call        TPieModule.PrepareForMonitoring
 005F0ECD    mov         byte ptr ds:[8161F8],1;gvar_008161F8
 005F0ED4    ret
*}
end;

//005F0ED8
procedure TModuleMouse.Read;
begin
{*
 005F0ED8    call        005EDA58
 005F0EDD    ret
*}
end;

//005F0EE0
procedure TModuleMouse.StartCompiletime;
begin
{*
 005F0EE0    call        TPieModule.StartCompiletime
 005F0EE5    call        005EE218
 005F0EEA    ret
*}
end;

//005F0EEC
procedure TModuleMouse.StartRuntime;
begin
{*
 005F0EEC    call        TPieModule.StartRuntime
 005F0EF1    call        005ED590
 005F0EF6    ret
*}
end;

//005F0EF8
procedure TModuleMouse.StopCompiletime;
begin
{*
 005F0EF8    call        TPieModule.StopCompiletime
 005F0EFD    ret
*}
end;

//005F0F00
procedure TModuleMouse.StopRuntime;
begin
{*
 005F0F00    push        ebx
 005F0F01    mov         ebx,eax
 005F0F03    call        005ED6E0
 005F0F08    mov         eax,ebx
 005F0F0A    call        TPieModule.StopRuntime
 005F0F0F    pop         ebx
 005F0F10    ret
*}
end;

Initialization
//00781984
{*
 00781984    push        ebp
 00781985    mov         ebp,esp
 00781987    push        ebx
 00781988    push        esi
 00781989    push        edi
 0078198A    sub         dword ptr ds:[81629C],1
>00781991    jae         007819F0
 00781993    xor         edx,edx
 00781995    push        ebp
 00781996    push        7819D5
 0078199B    push        dword ptr fs:[edx]
 0078199E    mov         dword ptr fs:[edx],esp
 007819A1    mov         eax,781A04;'Initializing PieMouse'
 007819A6    call        004FA5FC
 007819AB    mov         dl,1
 007819AD    mov         eax,[005EA1F8];TModuleMouse
 007819B2    call        TModuleMouse.Create;TModuleMouse.Create
 007819B7    mov         [008162A0],eax;gvar_008162A0:TModuleMouse
 007819BC    mov         eax,[008162A0];gvar_008162A0:TModuleMouse
 007819C1    call        005E31AC
 007819C6    call        005EE02C
 007819CB    xor         eax,eax
 007819CD    pop         edx
 007819CE    pop         ecx
 007819CF    pop         ecx
 007819D0    mov         dword ptr fs:[eax],edx
>007819D3    jmp         007819F0
>007819D5    jmp         @HandleOnException
 007819DA    dd          1
 007819DE    dd          00418C04;Exception
 007819E2    dd          007819E6
 007819E6    call        004FA644
 007819EB    call        @DoneExcept
 007819F0    pop         edi
 007819F1    pop         esi
 007819F2    pop         ebx
 007819F3    pop         ebp
 007819F4    ret
*}
Finalization
//005F0F14
{*
 005F0F14    push        ebp
 005F0F15    mov         ebp,esp
 005F0F17    push        ebx
 005F0F18    push        esi
 005F0F19    push        edi
 005F0F1A    xor         eax,eax
 005F0F1C    push        ebp
 005F0F1D    push        5F0F98
 005F0F22    push        dword ptr fs:[eax]
 005F0F25    mov         dword ptr fs:[eax],esp
 005F0F28    inc         dword ptr ds:[81629C]
>005F0F2E    jne         005F0F8A
 005F0F30    xor         edx,edx
 005F0F32    push        ebp
 005F0F33    push        5F0F65
 005F0F38    push        dword ptr fs:[edx]
 005F0F3B    mov         dword ptr fs:[edx],esp
 005F0F3E    mov         eax,5F0FB0;'Finalizing PieMouse'
 005F0F43    call        004FA5FC
 005F0F48    call        005EDF50
 005F0F4D    cmp         byte ptr ds:[8161FA],0;gvar_008161FA
>005F0F54    je          005F0F5B
 005F0F56    call        005EE43C
 005F0F5B    xor         eax,eax
 005F0F5D    pop         edx
 005F0F5E    pop         ecx
 005F0F5F    pop         ecx
 005F0F60    mov         dword ptr fs:[eax],edx
>005F0F63    jmp         005F0F80
>005F0F65    jmp         @HandleOnException
 005F0F6A    dd          1
 005F0F6E    dd          00418C04;Exception
 005F0F72    dd          005F0F76
 005F0F76    call        004FA644
 005F0F7B    call        @DoneExcept
 005F0F80    mov         eax,78BCF8;gvar_0078BCF8:IInterface
 005F0F85    call        @IntfClear
 005F0F8A    xor         eax,eax
 005F0F8C    pop         edx
 005F0F8D    pop         ecx
 005F0F8E    pop         ecx
 005F0F8F    mov         dword ptr fs:[eax],edx
 005F0F92    push        5F0F9F
 005F0F97    ret
>005F0F98    jmp         @HandleFinally
>005F0F9D    jmp         005F0F97
 005F0F9F    pop         edi
 005F0FA0    pop         esi
 005F0FA1    pop         ebx
 005F0FA2    pop         ebp
 005F0FA3    ret
*}
end.