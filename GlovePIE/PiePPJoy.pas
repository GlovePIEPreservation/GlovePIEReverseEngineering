//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit PiePPJoy;

interface

uses
  SysUtils, Classes;

type
  TPPJoyValue = class(TObjectValue)
  published
    procedure CreateClone;//006B4A44
    constructor Create;//006B4A20
    function Module:TObject;//006B4BB8
    procedure FillClone(c:TExpression);//006B4A54
    //procedure ToString(?:?);//006B4D1C
    procedure GetValue;//006B4AA4
    function GetDataType:TDataType;//006B4A78
    //function SetValue(NewValue:Double; ?:?):Boolean;//006B4BC0
    function CanSet:Boolean;//006B4A1C
  public
    ThingNumber:byte;//f20
    Item:Integer;//f24
    //procedure ToString(?:?); virtual;//006B4D1C
    procedure GetValue; virtual;//v2C//006B4AA4
    function GetDataType:TDataType; virtual;//v44//006B4A78
    //function SetValue(NewValue:Double; ?:?):Boolean; virtual;//v58//006B4BC0
    function CanSet:Boolean; virtual;//v68//006B4A1C
    procedure CreateClone; virtual;//v80//006B4A44
    procedure FillClone(c:TExpression); virtual;//v84//006B4A54
    function Module:TObject; virtual;//v98//006B4BB8
  end;
  TModulePPJoy = class(TPieModule)
  published
    procedure GetFields;//006B50C0
    function Read:Boolean;//006B50EC
    procedure GetGoodFields;//006B50C8
    function GetDefaultFormat(field:string):TGuiFormat;//006B506C
    procedure GetRange(blank:Boolean; min:Integer; max:Integer);//006B50D0
    function CreateValue(Identifier:string):TExpression;//006B5018
    procedure StopRuntime;//006B510C
    procedure StartRuntime;//006B50F8
    procedure StartCompiletime;//006B50F0
    constructor Create;//006B4F90
    procedure StopCompiletime;//006B5104
  public
    function CreateValue(Identifier:string):TExpression; virtual;//v14//006B5018
    procedure GetFields; virtual;//v18//006B50C0
    procedure GetGoodFields; virtual;//v1C//006B50C8
    procedure StartCompiletime; virtual;//v28//006B50F0
    procedure StopCompiletime; virtual;//v2C//006B5104
    procedure StartRuntime; virtual;//v30//006B50F8
    procedure StopRuntime; virtual;//v34//006B510C
    function Read:Boolean; virtual;//v3C//006B50EC
    procedure GetRange(blank:Boolean; min:Integer; max:Integer); virtual;//v40//006B50D0
    function GetDefaultFormat(field:string):TGuiFormat; virtual;//v44//006B506C
  end;
    //function sub_006B426C:?;//006B426C
    procedure sub_006B42E4;//006B42E4
    //function sub_006B4348(?:?):?;//006B4348
    //procedure sub_006B4410(?:?);//006B4410
    //function sub_006B443C(?:?):?;//006B443C
    procedure sub_006B44C4;//006B44C4
    procedure sub_006B44DC;//006B44DC
    //function sub_006B44F4(?:UnicodeString):?;//006B44F4
    //procedure sub_006B4940(?:Integer; ?:?);//006B4940
    //function sub_006B4DD4(?:string):?;//006B4DD4

implementation

//006B426C
{*function sub_006B426C:?;
begin
 006B426C    push        ebp
 006B426D    mov         ebp,esp
 006B426F    push        0
 006B4271    push        ebx
 006B4272    push        esi
 006B4273    xor         eax,eax
 006B4275    push        ebp
 006B4276    push        6B42D3
 006B427B    push        dword ptr fs:[eax]
 006B427E    mov         dword ptr fs:[eax],esp
 006B4281    mov         dl,1
 006B4283    mov         eax,[0043C7BC];TStringList
 006B4288    call        TStringList.Create;TStringList.Create
 006B428D    mov         esi,eax
 006B428F    mov         dl,1
 006B4291    mov         eax,esi
 006B4293    call        TStringList.SetSorted
 006B4298    xor         ebx,ebx
 006B429A    lea         edx,[ebp-4]
 006B429D    mov         eax,ebx
 006B429F    call        006B4940
 006B42A4    cmp         dword ptr [ebp-4],0
>006B42A8    je          006B42B4
 006B42AA    mov         edx,dword ptr [ebp-4]
 006B42AD    mov         eax,esi
 006B42AF    mov         ecx,dword ptr [eax]
 006B42B1    call        dword ptr [ecx+38];TStringList.Add
 006B42B4    inc         ebx
 006B42B5    cmp         ebx,12D
>006B42BB    jne         006B429A
 006B42BD    xor         eax,eax
 006B42BF    pop         edx
 006B42C0    pop         ecx
 006B42C1    pop         ecx
 006B42C2    mov         dword ptr fs:[eax],edx
 006B42C5    push        6B42DA
 006B42CA    lea         eax,[ebp-4]
 006B42CD    call        @UStrClr
 006B42D2    ret
>006B42D3    jmp         @HandleFinally
>006B42D8    jmp         006B42CA
 006B42DA    mov         eax,esi
 006B42DC    pop         esi
 006B42DD    pop         ebx
 006B42DE    pop         ecx
 006B42DF    pop         ebp
 006B42E0    ret
end;*}

//006B42E4
procedure sub_006B42E4;
begin
{*
 006B42E4    push        ebx
 006B42E5    push        esi
 006B42E6    push        ecx
 006B42E7    mov         dword ptr [esp],10
 006B42EE    mov         ecx,81EDE9;gvar_0081EDE9
 006B42F3    mov         ebx,81F4C4;gvar_0081F4C4
 006B42F8    mov         esi,81F504;gvar_0081F504
 006B42FD    mov         eax,10
 006B4302    mov         edx,ecx
 006B4304    mov         dword ptr [edx],4000
 006B430A    add         edx,4
 006B430D    dec         eax
>006B430E    jne         006B4304
 006B4310    mov         eax,28
 006B4315    lea         edx,[ecx+41]
 006B4318    mov         byte ptr [edx],0
 006B431B    inc         edx
 006B431C    dec         eax
>006B431D    jne         006B4318
 006B431F    mov         dword ptr [ecx-5],53544143
 006B4326    mov         byte ptr [ecx-1],10
 006B432A    mov         byte ptr [ecx+40],28
 006B432E    mov         dword ptr [ebx],0FFFFFFFF
 006B4334    mov         byte ptr [esi],0
 006B4337    inc         esi
 006B4338    add         ebx,4
 006B433B    add         ecx,6E
 006B433E    dec         dword ptr [esp]
>006B4341    jne         006B42FD
 006B4343    pop         edx
 006B4344    pop         esi
 006B4345    pop         ebx
 006B4346    ret
*}
end;

//006B4348
{*function sub_006B4348(?:?):?;
begin
 006B4348    push        ebp
 006B4349    mov         ebp,esp
 006B434B    push        0
 006B434D    push        0
 006B434F    push        ebx
 006B4350    push        esi
 006B4351    mov         ebx,eax
 006B4353    xor         eax,eax
 006B4355    push        ebp
 006B4356    push        6B43D3
 006B435B    push        dword ptr fs:[eax]
 006B435E    mov         dword ptr fs:[eax],esp
 006B4361    mov         esi,ebx
 006B4363    and         esi,7F
 006B4366    cmp         dword ptr [esi*4+81F4C0],0FFFFFFFF;gvar_0081F4C0
>006B436E    je          006B4374
 006B4370    mov         bl,1
>006B4372    jmp         006B43B8
 006B4374    lea         edx,[ebp-8]
 006B4377    mov         eax,esi
 006B4379    call        IntToStr
 006B437E    mov         ecx,dword ptr [ebp-8]
 006B4381    lea         eax,[ebp-4]
 006B4384    mov         edx,6B43F0;^TIdUDPClient.InitComponent
 006B4389    call        @UStrCat3
 006B438E    push        0
 006B4390    push        0
 006B4392    push        3
 006B4394    push        0
 006B4396    push        2
 006B4398    push        40000000
 006B439D    mov         eax,dword ptr [ebp-4]
 006B43A0    call        @UStrToPWChar
 006B43A5    push        eax
 006B43A6    call        kernel32.CreateFileW
 006B43AB    mov         dword ptr [esi*4+81F4C0],eax;gvar_0081F4C0
 006B43B2    cmp         eax,0FFFFFFFF
 006B43B5    setne       bl
 006B43B8    xor         eax,eax
 006B43BA    pop         edx
 006B43BB    pop         ecx
 006B43BC    pop         ecx
 006B43BD    mov         dword ptr fs:[eax],edx
 006B43C0    push        6B43DA
 006B43C5    lea         eax,[ebp-8]
 006B43C8    mov         edx,2
 006B43CD    call        @UStrArrayClr
 006B43D2    ret
>006B43D3    jmp         @HandleFinally
>006B43D8    jmp         006B43C5
 006B43DA    mov         eax,ebx
 006B43DC    pop         esi
 006B43DD    pop         ebx
 006B43DE    pop         ecx
 006B43DF    pop         ecx
 006B43E0    pop         ebp
 006B43E1    ret
end;*}

//006B4410
{*procedure sub_006B4410(?:?);
begin
 006B4410    push        ebx
 006B4411    push        esi
 006B4412    mov         ebx,eax
 006B4414    mov         esi,ebx
 006B4416    and         esi,7F
 006B4419    mov         eax,dword ptr [esi*4+81F4C0];gvar_0081F4C0
 006B4420    cmp         eax,0FFFFFFFF
>006B4423    je          006B4436
 006B4425    push        eax
 006B4426    call        kernel32.CloseHandle
 006B442B    mov         dword ptr [esi*4+81F4C0],0FFFFFFFF;gvar_0081F4C0
 006B4436    pop         esi
 006B4437    pop         ebx
 006B4438    ret
end;*}

//006B443C
{*function sub_006B443C(?:?):?;
begin
 006B443C    push        ebx
 006B443D    push        esi
 006B443E    push        ecx
 006B443F    mov         ebx,eax
 006B4441    mov         esi,ebx
 006B4443    and         esi,7F
 006B4446    cmp         byte ptr [esi+81F503],0
>006B444D    jne         006B4453
 006B444F    mov         al,1
>006B4451    jmp         006B44BD
 006B4453    cmp         dword ptr [esi*4+81F4C0],0FFFFFFFF;gvar_0081F4C0
>006B445B    jne         006B446C
 006B445D    mov         eax,ebx
 006B445F    call        006B4348
 006B4464    test        al,al
>006B4466    jne         006B446C
 006B4468    xor         eax,eax
>006B446A    jmp         006B44BD
 006B446C    xor         eax,eax
 006B446E    mov         dword ptr [esp],eax
 006B4471    push        0
 006B4473    lea         eax,[esp+4]
 006B4477    push        eax
 006B4478    push        0
 006B447A    push        0
 006B447C    push        6E
 006B447E    imul        eax,esi,37
 006B4481    lea         eax,[eax*2+81ED76];gvar_0081ED76
 006B4488    push        eax
 006B4489    push        220000
 006B448E    mov         eax,dword ptr [esi*4+81F4C0];gvar_0081F4C0
 006B4495    push        eax
 006B4496    call        kernel32.DeviceIoControl
 006B449B    test        eax,eax
>006B449D    jne         006B44B4
 006B449F    call        kernel32.GetLastError
 006B44A4    cmp         eax,2
>006B44A7    jne         006B44B0
 006B44A9    mov         eax,ebx
 006B44AB    call        006B4410
 006B44B0    xor         eax,eax
>006B44B2    jmp         006B44BD
 006B44B4    mov         byte ptr [esi+81F503],0
 006B44BB    mov         al,1
 006B44BD    pop         edx
 006B44BE    pop         esi
 006B44BF    pop         ebx
 006B44C0    ret
end;*}

//006B44C4
procedure sub_006B44C4;
begin
{*
 006B44C4    push        ebx
 006B44C5    mov         ebx,1
 006B44CA    mov         eax,ebx
 006B44CC    call        006B443C
 006B44D1    inc         ebx
 006B44D2    cmp         ebx,11
>006B44D5    jne         006B44CA
 006B44D7    pop         ebx
 006B44D8    ret
*}
end;

//006B44DC
procedure sub_006B44DC;
begin
{*
 006B44DC    push        ebx
 006B44DD    mov         ebx,1
 006B44E2    mov         eax,ebx
 006B44E4    call        006B4410
 006B44E9    inc         ebx
 006B44EA    cmp         ebx,11
>006B44ED    jne         006B44E2
 006B44EF    pop         ebx
 006B44F0    ret
*}
end;

//006B44F4
{*function sub_006B44F4(?:UnicodeString):?;
begin
 006B44F4    push        ebp
 006B44F5    mov         ebp,esp
 006B44F7    add         esp,0FFFFFFF8
 006B44FA    push        ebx
 006B44FB    xor         edx,edx
 006B44FD    mov         dword ptr [ebp-8],edx
 006B4500    mov         dword ptr [ebp-4],eax
 006B4503    mov         eax,dword ptr [ebp-4]
 006B4506    call        @UStrAddRef
 006B450B    xor         eax,eax
 006B450D    push        ebp
 006B450E    push        6B4752
 006B4513    push        dword ptr fs:[eax]
 006B4516    mov         dword ptr fs:[eax],esp
 006B4519    lea         eax,[ebp-4]
 006B451C    mov         edx,6B476C;'analog'
 006B4521    call        004F9BD0
 006B4526    test        al,al
>006B4528    je          006B454D
 006B452A    or          edx,0FFFFFFFF
 006B452D    mov         eax,dword ptr [ebp-4]
 006B4530    call        StrToIntDef
 006B4535    test        eax,eax
>006B4537    jl          006B453E
 006B4539    cmp         eax,10
>006B453C    jl          006B4546
 006B453E    or          ebx,0FFFFFFFF
>006B4541    jmp         006B4737
 006B4546    lea         ebx,[eax]
>006B4548    jmp         006B4737
 006B454D    lea         eax,[ebp-4]
 006B4550    mov         edx,6B4788;'digital'
 006B4555    call        004F9BD0
 006B455A    test        al,al
>006B455C    je          006B4582
 006B455E    or          edx,0FFFFFFFF
 006B4561    mov         eax,dword ptr [ebp-4]
 006B4564    call        StrToIntDef
 006B4569    test        eax,eax
>006B456B    jl          006B4572
 006B456D    cmp         eax,28
>006B4570    jl          006B457A
 006B4572    or          ebx,0FFFFFFFF
>006B4575    jmp         006B4737
 006B457A    lea         ebx,[eax+10]
>006B457D    jmp         006B4737
 006B4582    lea         eax,[ebp-4]
 006B4585    mov         edx,6B47A4;'button'
 006B458A    call        004F9BD0
 006B458F    test        al,al
>006B4591    je          006B45BB
 006B4593    or          edx,0FFFFFFFF
 006B4596    mov         eax,dword ptr [ebp-4]
 006B4599    call        StrToIntDef
 006B459E    mov         edx,eax
 006B45A0    dec         edx
 006B45A1    test        edx,edx
>006B45A3    jl          006B45AA
 006B45A5    cmp         edx,28
>006B45A8    jl          006B45B2
 006B45AA    or          ebx,0FFFFFFFF
>006B45AD    jmp         006B4737
 006B45B2    lea         ebx,[eax+10]
 006B45B5    dec         ebx
>006B45B6    jmp         006B4737
 006B45BB    lea         edx,[ebp-8]
 006B45BE    mov         eax,dword ptr [ebp-4]
 006B45C1    call        LowerCase
 006B45C6    mov         edx,dword ptr [ebp-8]
 006B45C9    lea         eax,[ebp-4]
 006B45CC    call        @UStrLAsg
 006B45D1    mov         eax,dword ptr [ebp-4]
 006B45D4    mov         edx,6B47C0;'x'
 006B45D9    call        @UStrEqual
>006B45DE    jne         006B45E7
 006B45E0    xor         ebx,ebx
>006B45E2    jmp         006B4737
 006B45E7    mov         eax,dword ptr [ebp-4]
 006B45EA    mov         edx,6B47D0;'y'
 006B45EF    call        @UStrEqual
>006B45F4    jne         006B4600
 006B45F6    mov         ebx,1
>006B45FB    jmp         006B4737
 006B4600    mov         eax,dword ptr [ebp-4]
 006B4603    mov         edx,6B47E0;'z'
 006B4608    call        @UStrEqual
>006B460D    jne         006B4619
 006B460F    mov         ebx,2
>006B4614    jmp         006B4737
 006B4619    mov         eax,dword ptr [ebp-4]
 006B461C    mov         edx,6B47F0;'pitch'
 006B4621    call        @UStrEqual
>006B4626    je          006B4637
 006B4628    mov         eax,dword ptr [ebp-4]
 006B462B    mov         edx,6B4808;'rx'
 006B4630    call        @UStrEqual
>006B4635    jne         006B4641
 006B4637    mov         ebx,3
>006B463C    jmp         006B4737
 006B4641    mov         eax,dword ptr [ebp-4]
 006B4644    mov         edx,6B481C;'yaw'
 006B4649    call        @UStrEqual
>006B464E    je          006B465F
 006B4650    mov         eax,dword ptr [ebp-4]
 006B4653    mov         edx,6B4830;'ry'
 006B4658    call        @UStrEqual
>006B465D    jne         006B4669
 006B465F    mov         ebx,4
>006B4664    jmp         006B4737
 006B4669    mov         eax,dword ptr [ebp-4]
 006B466C    mov         edx,6B4844;'roll'
 006B4671    call        @UStrEqual
>006B4676    je          006B4696
 006B4678    mov         eax,dword ptr [ebp-4]
 006B467B    mov         edx,6B485C;'rz'
 006B4680    call        @UStrEqual
>006B4685    je          006B4696
 006B4687    mov         eax,dword ptr [ebp-4]
 006B468A    mov         edx,6B4870;'r'
 006B468F    call        @UStrEqual
>006B4694    jne         006B46A0
 006B4696    mov         ebx,5
>006B469B    jmp         006B4737
 006B46A0    mov         eax,dword ptr [ebp-4]
 006B46A3    mov         edx,6B4880;'slider'
 006B46A8    call        @UStrEqual
>006B46AD    je          006B46BE
 006B46AF    mov         eax,dword ptr [ebp-4]
 006B46B2    mov         edx,6B489C;'slider1'
 006B46B7    call        @UStrEqual
>006B46BC    jne         006B46C5
 006B46BE    mov         ebx,6
>006B46C3    jmp         006B4737
 006B46C5    mov         eax,dword ptr [ebp-4]
 006B46C8    mov         edx,6B48B8;'dial'
 006B46CD    call        @UStrEqual
>006B46D2    je          006B46E3
 006B46D4    mov         eax,dword ptr [ebp-4]
 006B46D7    mov         edx,6B48D0;'slider2'
 006B46DC    call        @UStrEqual
>006B46E1    jne         006B46EA
 006B46E3    mov         ebx,7
>006B46E8    jmp         006B4737
 006B46EA    mov         eax,dword ptr [ebp-4]
 006B46ED    mov         edx,6B48EC;^'RealLeftStick'
 006B46F2    call        @UStrEqual
>006B46F7    je          006B4708
 006B46F9    mov         eax,dword ptr [ebp-4]
 006B46FC    mov         edx,6B4904;'hat1'
 006B4701    call        @UStrEqual
>006B4706    jne         006B470F
 006B4708    mov         ebx,8
>006B470D    jmp         006B4737
 006B470F    mov         eax,dword ptr [ebp-4]
 006B4712    mov         edx,6B491C;^'RealLeftStick'
 006B4717    call        @UStrEqual
>006B471C    je          006B472D
 006B471E    mov         eax,dword ptr [ebp-4]
 006B4721    mov         edx,6B4934;'hat2'
 006B4726    call        @UStrEqual
>006B472B    jne         006B4734
 006B472D    mov         ebx,9
>006B4732    jmp         006B4737
 006B4734    or          ebx,0FFFFFFFF
 006B4737    xor         eax,eax
 006B4739    pop         edx
 006B473A    pop         ecx
 006B473B    pop         ecx
 006B473C    mov         dword ptr fs:[eax],edx
 006B473F    push        6B4759
 006B4744    lea         eax,[ebp-8]
 006B4747    mov         edx,2
 006B474C    call        @UStrArrayClr
 006B4751    ret
>006B4752    jmp         @HandleFinally
>006B4757    jmp         006B4744
 006B4759    mov         eax,ebx
 006B475B    pop         ebx
 006B475C    pop         ecx
 006B475D    pop         ecx
 006B475E    pop         ebp
 006B475F    ret
end;*}

//006B4940
{*procedure sub_006B4940(?:Integer; ?:?);
begin
 006B4940    push        ebp
 006B4941    mov         ebp,esp
 006B4943    push        0
 006B4945    push        0
 006B4947    push        ebx
 006B4948    push        esi
 006B4949    mov         esi,edx
 006B494B    mov         ebx,eax
 006B494D    xor         eax,eax
 006B494F    push        ebp
 006B4950    push        6B49D6
 006B4955    push        dword ptr fs:[eax]
 006B4958    mov         dword ptr fs:[eax],esp
 006B495B    test        ebx,ebx
>006B495D    jl          006B4987
 006B495F    mov         eax,ebx
 006B4961    sub         eax,0
 006B4964    cmp         eax,10
>006B4967    jge         006B4987
 006B4969    lea         edx,[ebp-4]
 006B496C    mov         eax,ebx
 006B496E    sub         eax,0
 006B4971    call        IntToStr
 006B4976    mov         ecx,dword ptr [ebp-4]
 006B4979    mov         eax,esi
 006B497B    mov         edx,6B49F0;'Analog'
 006B4980    call        @UStrCat3
>006B4985    jmp         006B49BB
 006B4987    cmp         ebx,10
>006B498A    jl          006B49B4
 006B498C    mov         eax,ebx
 006B498E    sub         eax,10
 006B4991    cmp         eax,28
>006B4994    jge         006B49B4
 006B4996    lea         edx,[ebp-8]
 006B4999    mov         eax,ebx
 006B499B    sub         eax,10
 006B499E    call        IntToStr
 006B49A3    mov         ecx,dword ptr [ebp-8]
 006B49A6    mov         eax,esi
 006B49A8    mov         edx,6B4A0C;^338:Single
 006B49AD    call        @UStrCat3
>006B49B2    jmp         006B49BB
 006B49B4    mov         eax,esi
 006B49B6    call        @UStrClr
 006B49BB    xor         eax,eax
 006B49BD    pop         edx
 006B49BE    pop         ecx
 006B49BF    pop         ecx
 006B49C0    mov         dword ptr fs:[eax],edx
 006B49C3    push        6B49DD
 006B49C8    lea         eax,[ebp-8]
 006B49CB    mov         edx,2
 006B49D0    call        @UStrArrayClr
 006B49D5    ret
>006B49D6    jmp         @HandleFinally
>006B49DB    jmp         006B49C8
 006B49DD    pop         esi
 006B49DE    pop         ebx
 006B49DF    pop         ecx
 006B49E0    pop         ecx
 006B49E1    pop         ebp
 006B49E2    ret
end;*}

//006B4A1C
function TPPJoyValue.CanSet:Boolean;
begin
{*
 006B4A1C    mov         al,1
 006B4A1E    ret
*}
end;

//006B4A20
constructor TPPJoyValue.Create;
begin
{*
 006B4A20    test        dl,dl
>006B4A22    je          006B4A2C
 006B4A24    add         esp,0FFFFFFF0
 006B4A27    call        @ClassCreate
 006B4A2C    mov         byte ptr [eax+20],1;TPPJoyValue.ThingNumber:byte
 006B4A30    test        dl,dl
>006B4A32    je          006B4A43
 006B4A34    call        @AfterConstruction
 006B4A39    pop         dword ptr fs:[0]
 006B4A40    add         esp,0C
 006B4A43    ret
*}
end;

//006B4A44
procedure TPPJoyValue.CreateClone;
begin
{*
 006B4A44    mov         dl,1
 006B4A46    mov         eax,[006B3BB0];TPPJoyValue
 006B4A4B    call        TPPJoyValue.Create;TPPJoyValue.Create
 006B4A50    ret
*}
end;

//006B4A54
procedure TPPJoyValue.FillClone(c:TExpression);
begin
{*
 006B4A54    push        ebx
 006B4A55    push        esi
 006B4A56    mov         esi,edx
 006B4A58    mov         ebx,eax
 006B4A5A    mov         edx,esi
 006B4A5C    mov         eax,ebx
 006B4A5E    call        TExpression.FillClone
 006B4A63    mov         eax,esi
 006B4A65    movzx       edx,byte ptr [ebx+20];TPPJoyValue.ThingNumber:byte
 006B4A69    mov         byte ptr [eax+20],dl
 006B4A6C    mov         edx,dword ptr [ebx+24];TPPJoyValue.Item:Integer
 006B4A6F    mov         dword ptr [eax+24],edx
 006B4A72    pop         esi
 006B4A73    pop         ebx
 006B4A74    ret
*}
end;

//006B4A78
function TPPJoyValue.GetDataType:TDataType;
begin
{*
 006B4A78    mov         edx,dword ptr [eax+24];TPPJoyValue.Item:Integer
 006B4A7B    test        edx,edx
>006B4A7D    jl          006B4A8A
 006B4A7F    sub         edx,0
 006B4A82    cmp         edx,10
>006B4A85    jge         006B4A8A
 006B4A87    xor         eax,eax
 006B4A89    ret
 006B4A8A    mov         edx,dword ptr [eax+24];TPPJoyValue.Item:Integer
 006B4A8D    cmp         edx,10
>006B4A90    jl          006B4A9E
 006B4A92    sub         edx,10
 006B4A95    cmp         edx,28
>006B4A98    jge         006B4A9E
 006B4A9A    mov         al,3
>006B4A9C    jmp         006B4AA0
 006B4A9E    xor         eax,eax
 006B4AA0    ret
*}
end;

//006B4AA4
procedure TPPJoyValue.GetValue;
begin
{*
 006B4AA4    add         esp,0FFFFFFE4
 006B4AA7    movzx       edx,byte ptr [eax+20];TPPJoyValue.ThingNumber:byte
 006B4AAB    cmp         dl,1
>006B4AAE    jb          006B4AB5
 006B4AB0    cmp         dl,10
>006B4AB3    jbe         006B4AC3
 006B4AB5    xor         eax,eax
 006B4AB7    mov         dword ptr [esp],eax
 006B4ABA    mov         dword ptr [esp+4],eax
>006B4ABE    jmp         006B4BA8
 006B4AC3    mov         edx,dword ptr [eax+24];TPPJoyValue.Item:Integer
 006B4AC6    test        edx,edx
>006B4AC8    jl          006B4ADB
 006B4ACA    mov         ecx,edx
 006B4ACC    sub         ecx,0
 006B4ACF    cmp         ecx,10
>006B4AD2    jge         006B4ADB
 006B4AD4    xor         ecx,ecx
 006B4AD6    sub         edx,0
>006B4AD9    jmp         006B4B02
 006B4ADB    mov         edx,dword ptr [eax+24];TPPJoyValue.Item:Integer
 006B4ADE    cmp         edx,10
>006B4AE1    jl          006B4AF4
 006B4AE3    mov         ecx,edx
 006B4AE5    sub         ecx,10
 006B4AE8    cmp         ecx,28
>006B4AEB    jge         006B4AF4
 006B4AED    mov         cl,1
 006B4AEF    sub         edx,10
>006B4AF2    jmp         006B4B02
 006B4AF4    xor         eax,eax
 006B4AF6    mov         dword ptr [esp],eax
 006B4AF9    mov         dword ptr [esp+4],eax
>006B4AFD    jmp         006B4BA8
 006B4B02    test        cl,cl
>006B4B04    je          006B4B27
 006B4B06    movzx       eax,byte ptr [eax+20]
 006B4B0A    imul        eax,eax,37
 006B4B0D    lea         eax,[eax*2+81EDE4];gvar_0081EDE4
 006B4B14    movzx       eax,byte ptr [eax+edx-28]
 006B4B19    call        00686074
 006B4B1E    fstp        qword ptr [esp]
 006B4B21    wait
>006B4B22    jmp         006B4BA8
 006B4B27    movzx       eax,byte ptr [eax+20]
 006B4B2B    imul        eax,eax,37
 006B4B2E    lea         eax,[eax*2+81EDE4];gvar_0081EDE4
 006B4B35    mov         eax,dword ptr [eax+edx*4-69]
 006B4B39    xor         edx,edx
 006B4B3B    mov         dword ptr [esp+8],edx
 006B4B3F    mov         dword ptr [esp+0C],40CFFF80
 006B4B47    dec         eax
 006B4B48    mov         dword ptr [esp+18],eax
 006B4B4C    fild        dword ptr [esp+18]
 006B4B50    fsub        qword ptr [esp+8]
 006B4B54    fdiv        qword ptr [esp+8]
 006B4B58    fstp        qword ptr [esp+10]
 006B4B5C    wait
 006B4B5D    fld         qword ptr [esp+10]
 006B4B61    fcomp       dword ptr ds:[6B4BB0];1:Single
 006B4B67    wait
 006B4B68    fnstsw      al
 006B4B6A    sahf
>006B4B6B    jbe         006B4B7B
 006B4B6D    xor         eax,eax
 006B4B6F    mov         dword ptr [esp+10],eax
 006B4B73    mov         dword ptr [esp+14],3FF00000
 006B4B7B    fld         qword ptr [esp+10]
 006B4B7F    fcomp       dword ptr ds:[6B4BB4];-1:Single
 006B4B85    wait
 006B4B86    fnstsw      al
 006B4B88    sahf
>006B4B89    jae         006B4B99
 006B4B8B    xor         eax,eax
 006B4B8D    mov         dword ptr [esp+10],eax
 006B4B91    mov         dword ptr [esp+14],0BFF00000
 006B4B99    mov         eax,dword ptr [esp+10]
 006B4B9D    mov         dword ptr [esp],eax
 006B4BA0    mov         eax,dword ptr [esp+14]
 006B4BA4    mov         dword ptr [esp+4],eax
 006B4BA8    fld         qword ptr [esp]
 006B4BAB    add         esp,1C
 006B4BAE    ret
*}
end;

//006B4BB8
function TPPJoyValue.Module:TObject;
begin
{*
 006B4BB8    mov         eax,[0081EDE0];gvar_0081EDE0:TModulePPJoy
 006B4BBD    ret
*}
end;

//006B4BC0
{*function TPPJoyValue.SetValue(NewValue:Double; ?:?):Boolean;
begin
 006B4BC0    push        ebp
 006B4BC1    mov         ebp,esp
 006B4BC3    add         esp,0FFFFFFF0
 006B4BC6    push        ebx
 006B4BC7    push        esi
 006B4BC8    push        edi
 006B4BC9    mov         edi,eax
 006B4BCB    movzx       eax,byte ptr [edi+20];TPPJoyValue.ThingNumber:byte
 006B4BCF    cmp         al,1
>006B4BD1    jb          006B4BD7
 006B4BD3    cmp         al,10
>006B4BD5    jbe         006B4BDE
 006B4BD7    xor         eax,eax
>006B4BD9    jmp         006B4D10
 006B4BDE    mov         eax,dword ptr [edi+24];TPPJoyValue.Item:Integer
 006B4BE1    test        eax,eax
>006B4BE3    jl          006B4BF8
 006B4BE5    mov         edx,eax
 006B4BE7    sub         edx,0
 006B4BEA    cmp         edx,10
>006B4BED    jge         006B4BF8
 006B4BEF    xor         edx,edx
 006B4BF1    mov         esi,eax
 006B4BF3    sub         esi,0
>006B4BF6    jmp         006B4C1A
 006B4BF8    mov         eax,dword ptr [edi+24];TPPJoyValue.Item:Integer
 006B4BFB    cmp         eax,10
>006B4BFE    jl          006B4C13
 006B4C00    mov         edx,eax
 006B4C02    sub         edx,10
 006B4C05    cmp         edx,28
>006B4C08    jge         006B4C13
 006B4C0A    mov         dl,1
 006B4C0C    mov         esi,eax
 006B4C0E    sub         esi,10
>006B4C11    jmp         006B4C1A
 006B4C13    xor         eax,eax
>006B4C15    jmp         006B4D10
 006B4C1A    test        dl,dl
>006B4C1C    je          006B4C84
 006B4C1E    push        dword ptr [ebp+0C]
 006B4C21    push        dword ptr [ebp+8]
 006B4C24    call        00686060
 006B4C29    mov         ebx,eax
 006B4C2B    cmp         byte ptr [edi+10],0;TPPJoyValue.Iffy:Boolean
>006B4C2F    jne         006B4C5B
 006B4C31    push        dword ptr [edi+0C];TPPJoyValue.?fC:dword
 006B4C34    push        dword ptr [edi+8];TPPJoyValue.PreviousValue:Double
 006B4C37    call        00686060
 006B4C3C    cmp         bl,al
>006B4C3E    je          006B4C54
 006B4C40    movzx       eax,byte ptr [edi+20];TPPJoyValue.ThingNumber:byte
 006B4C44    imul        eax,eax,37
 006B4C47    lea         eax,[eax*2+81EDE4];gvar_0081EDE4
 006B4C4E    cmp         bl,byte ptr [eax+esi-28]
>006B4C52    jne         006B4C5B
 006B4C54    mov         al,1
>006B4C56    jmp         006B4D10
 006B4C5B    movzx       eax,byte ptr [edi+20];TPPJoyValue.ThingNumber:byte
 006B4C5F    mov         byte ptr [eax+81F503],1
 006B4C66    imul        eax,eax,37
 006B4C69    lea         eax,[eax*2+81EDE4];gvar_0081EDE4
 006B4C70    mov         byte ptr [eax+esi-28],bl
 006B4C74    mov         eax,ebx
 006B4C76    call        00686074
 006B4C7B    fstp        qword ptr [edi+8];TPPJoyValue.PreviousValue:Double
 006B4C7E    wait
>006B4C7F    jmp         006B4D0E
 006B4C84    cmp         byte ptr [edi+10],0;TPPJoyValue.Iffy:Boolean
>006B4C88    jne         006B4C9A
 006B4C8A    fld         qword ptr [ebp+8]
 006B4C8D    fcomp       qword ptr [edi+8];TPPJoyValue.PreviousValue:Double
 006B4C90    wait
 006B4C91    fnstsw      al
 006B4C93    sahf
>006B4C94    jne         006B4C9A
 006B4C96    mov         al,1
>006B4C98    jmp         006B4D10
 006B4C9A    xor         eax,eax
 006B4C9C    mov         dword ptr [ebp-8],eax
 006B4C9F    mov         dword ptr [ebp-4],40CFFF80
 006B4CA6    fld         qword ptr [ebp+8]
 006B4CA9    fmul        qword ptr [ebp-8]
 006B4CAC    fadd        qword ptr [ebp-8]
 006B4CAF    fstp        qword ptr [ebp-10]
 006B4CB2    wait
 006B4CB3    fld         qword ptr [ebp-10]
 006B4CB6    call        @ROUND
 006B4CBB    inc         eax
 006B4CBC    cmp         eax,1
>006B4CBF    jge         006B4CC8
 006B4CC1    mov         eax,1
>006B4CC6    jmp         006B4CD4
 006B4CC8    cmp         eax,7FFF
>006B4CCD    jle         006B4CD4
 006B4CCF    mov         eax,7FFF
 006B4CD4    movzx       edx,byte ptr [edi+20];TPPJoyValue.ThingNumber:byte
 006B4CD8    imul        edx,edx,37
 006B4CDB    lea         ecx,[edx*2+81EDE4];gvar_0081EDE4
 006B4CE2    cmp         eax,dword ptr [ecx+esi*4-69]
>006B4CE6    jne         006B4CEC
 006B4CE8    mov         al,1
>006B4CEA    jmp         006B4D10
 006B4CEC    lea         edx,[edx*2+81EDE4];gvar_0081EDE4
 006B4CF3    mov         dword ptr [edx+esi*4-69],eax
 006B4CF7    movzx       eax,byte ptr [edi+20];TPPJoyValue.ThingNumber:byte
 006B4CFB    mov         byte ptr [eax+81F503],1
 006B4D02    mov         eax,dword ptr [ebp+8]
 006B4D05    mov         dword ptr [edi+8],eax;TPPJoyValue.PreviousValue:Double
 006B4D08    mov         eax,dword ptr [ebp+0C]
 006B4D0B    mov         dword ptr [edi+0C],eax;TPPJoyValue.?fC:dword
 006B4D0E    mov         al,1
 006B4D10    pop         edi
 006B4D11    pop         esi
 006B4D12    pop         ebx
 006B4D13    mov         esp,ebp
 006B4D15    pop         ebp
 006B4D16    ret         8
end;*}

//006B4D1C
{*procedure TPPJoyValue.ToString(?:?);
begin
 006B4D1C    push        ebp
 006B4D1D    mov         ebp,esp
 006B4D1F    push        0
 006B4D21    push        0
 006B4D23    push        ebx
 006B4D24    push        esi
 006B4D25    push        edi
 006B4D26    mov         edi,edx
 006B4D28    mov         esi,eax
 006B4D2A    xor         eax,eax
 006B4D2C    push        ebp
 006B4D2D    push        6B4D9E
 006B4D32    push        dword ptr fs:[eax]
 006B4D35    mov         dword ptr fs:[eax],esp
 006B4D38    mov         eax,edi
 006B4D3A    mov         edx,6B4DB8;'PPJoy'
 006B4D3F    call        @UStrAsg
 006B4D44    movzx       ebx,byte ptr [esi+20];TPPJoyValue.ThingNumber:byte
 006B4D48    cmp         bl,1
>006B4D4B    jbe         006B4D62
 006B4D4D    lea         edx,[ebp-4]
 006B4D50    movzx       eax,bl
 006B4D53    call        IntToStr
 006B4D58    mov         edx,dword ptr [ebp-4]
 006B4D5B    mov         eax,edi
 006B4D5D    call        @UStrCat
 006B4D62    push        dword ptr [edi]
 006B4D64    push        6B4DD0;'.'
 006B4D69    lea         edx,[ebp-8]
 006B4D6C    mov         eax,dword ptr [esi+24];TPPJoyValue.Item:Integer
 006B4D6F    call        006B4940
 006B4D74    push        dword ptr [ebp-8]
 006B4D77    mov         eax,edi
 006B4D79    mov         edx,3
 006B4D7E    call        @UStrCatN
 006B4D83    xor         eax,eax
 006B4D85    pop         edx
 006B4D86    pop         ecx
 006B4D87    pop         ecx
 006B4D88    mov         dword ptr fs:[eax],edx
 006B4D8B    push        6B4DA5
 006B4D90    lea         eax,[ebp-8]
 006B4D93    mov         edx,2
 006B4D98    call        @UStrArrayClr
 006B4D9D    ret
>006B4D9E    jmp         @HandleFinally
>006B4DA3    jmp         006B4D90
 006B4DA5    pop         edi
 006B4DA6    pop         esi
 006B4DA7    pop         ebx
 006B4DA8    pop         ecx
 006B4DA9    pop         ecx
 006B4DAA    pop         ebp
 006B4DAB    ret
end;*}

//006B4DD4
{*function sub_006B4DD4(?:string):?;
begin
 006B4DD4    push        ebp
 006B4DD5    mov         ebp,esp
 006B4DD7    add         esp,0FFFFFFF8
 006B4DDA    push        ebx
 006B4DDB    push        esi
 006B4DDC    push        edi
 006B4DDD    xor         edx,edx
 006B4DDF    mov         dword ptr [ebp-8],edx
 006B4DE2    mov         dword ptr [ebp-4],eax
 006B4DE5    mov         eax,dword ptr [ebp-4]
 006B4DE8    call        @UStrAddRef
 006B4DED    xor         eax,eax
 006B4DEF    push        ebp
 006B4DF0    push        6B4EE2
 006B4DF5    push        dword ptr fs:[eax]
 006B4DF8    mov         dword ptr fs:[eax],esp
 006B4DFB    xor         esi,esi
 006B4DFD    lea         eax,[ebp-8]
 006B4E00    mov         edx,dword ptr [ebp-4]
 006B4E03    call        @UStrLAsg
 006B4E08    lea         eax,[ebp-8]
 006B4E0B    mov         edx,6B4F00;'ppjoy'
 006B4E10    call        004F9BD0
 006B4E15    test        al,al
>006B4E17    jne         006B4E2E
 006B4E19    lea         eax,[ebp-8]
 006B4E1C    mov         edx,6B4F18;'FakeJoystick'
 006B4E21    call        004F9BD0
 006B4E26    test        al,al
>006B4E28    je          006B4EC7
 006B4E2E    lea         eax,[ebp-8]
 006B4E31    call        004F9D00
 006B4E36    mov         ebx,eax
 006B4E38    lea         eax,[ebp-8]
 006B4E3B    mov         edx,6B4F40;'.'
 006B4E40    call        004F9BD0
 006B4E45    test        al,al
>006B4E47    je          006B4EC7
 006B4E49    cmp         ebx,0FFFFFFFF
>006B4E4C    jge         006B4E9C
 006B4E4E    lea         eax,[ebp-8]
 006B4E51    mov         edx,6B4F00;'ppjoy'
 006B4E56    call        004F9BD0
 006B4E5B    test        al,al
>006B4E5D    jne         006B4E81
 006B4E5F    lea         eax,[ebp-8]
 006B4E62    mov         edx,6B4F50;'joystick'
 006B4E67    call        004F9BD0
 006B4E6C    test        al,al
>006B4E6E    jne         006B4E81
 006B4E70    lea         eax,[ebp-8]
 006B4E73    mov         edx,6B4F70;'VirtualJoystick'
 006B4E78    call        004F9BD0
 006B4E7D    test        al,al
>006B4E7F    je          006B4E9C
 006B4E81    lea         eax,[ebp-8]
 006B4E84    call        004F9D00
 006B4E89    mov         ebx,eax
 006B4E8B    lea         eax,[ebp-8]
 006B4E8E    mov         edx,6B4F40;'.'
 006B4E93    call        004F9BD0
 006B4E98    test        al,al
>006B4E9A    je          006B4EC7
 006B4E9C    mov         eax,dword ptr [ebp-8]
 006B4E9F    call        006B44F4
 006B4EA4    mov         edi,eax
 006B4EA6    test        edi,edi
>006B4EA8    jl          006B4EC7
 006B4EAA    mov         dl,1
 006B4EAC    mov         eax,[006B3BB0];TPPJoyValue
 006B4EB1    call        TPPJoyValue.Create;TPPJoyValue.Create
 006B4EB6    mov         esi,eax
 006B4EB8    mov         dword ptr [esi+24],edi;TPPJoyValue.Item:Integer
 006B4EBB    test        ebx,ebx
>006B4EBD    jg          006B4EC4
 006B4EBF    mov         ebx,1
 006B4EC4    mov         byte ptr [esi+20],bl;TPPJoyValue.ThingNumber:byte
 006B4EC7    xor         eax,eax
 006B4EC9    pop         edx
 006B4ECA    pop         ecx
 006B4ECB    pop         ecx
 006B4ECC    mov         dword ptr fs:[eax],edx
 006B4ECF    push        6B4EE9
 006B4ED4    lea         eax,[ebp-8]
 006B4ED7    mov         edx,2
 006B4EDC    call        @UStrArrayClr
 006B4EE1    ret
>006B4EE2    jmp         @HandleFinally
>006B4EE7    jmp         006B4ED4
 006B4EE9    mov         eax,esi
 006B4EEB    pop         edi
 006B4EEC    pop         esi
 006B4EED    pop         ebx
 006B4EEE    pop         ecx
 006B4EEF    pop         ecx
 006B4EF0    pop         ebp
 006B4EF1    ret
end;*}

//006B4F90
constructor TModulePPJoy.Create;
begin
{*
 006B4F90    push        ebx
 006B4F91    push        esi
 006B4F92    test        dl,dl
>006B4F94    je          006B4F9E
 006B4F96    add         esp,0FFFFFFF0
 006B4F99    call        @ClassCreate
 006B4F9E    mov         ebx,edx
 006B4FA0    mov         esi,eax
 006B4FA2    push        6B4FE4;'FakeJoystick'
 006B4FA7    push        0
 006B4FA9    push        0
 006B4FAB    push        0
 006B4FAD    mov         ecx,6B500C;'PPJoy'
 006B4FB2    xor         edx,edx
 006B4FB4    mov         eax,esi
 006B4FB6    call        005E49A8
 006B4FBB    mov         eax,esi
 006B4FBD    test        bl,bl
>006B4FBF    je          006B4FD0
 006B4FC1    call        @AfterConstruction
 006B4FC6    pop         dword ptr fs:[0]
 006B4FCD    add         esp,0C
 006B4FD0    mov         eax,esi
 006B4FD2    pop         esi
 006B4FD3    pop         ebx
 006B4FD4    ret
*}
end;

//006B5018
function TModulePPJoy.CreateValue(Identifier:string):TExpression;
begin
{*
 006B5018    push        ebp
 006B5019    mov         ebp,esp
 006B501B    push        ecx
 006B501C    push        ebx
 006B501D    mov         dword ptr [ebp-4],edx
 006B5020    mov         ebx,eax
 006B5022    mov         eax,dword ptr [ebp-4]
 006B5025    call        @UStrAddRef
 006B502A    xor         eax,eax
 006B502C    push        ebp
 006B502D    push        6B505C
 006B5032    push        dword ptr fs:[eax]
 006B5035    mov         dword ptr fs:[eax],esp
 006B5038    mov         byte ptr [ebx+24],1;TModulePPJoy.Used:Boolean
 006B503C    mov         eax,dword ptr [ebp-4]
 006B503F    call        006B4DD4
 006B5044    mov         ebx,eax
 006B5046    xor         eax,eax
 006B5048    pop         edx
 006B5049    pop         ecx
 006B504A    pop         ecx
 006B504B    mov         dword ptr fs:[eax],edx
 006B504E    push        6B5063
 006B5053    lea         eax,[ebp-4]
 006B5056    call        @UStrClr
 006B505B    ret
>006B505C    jmp         @HandleFinally
>006B5061    jmp         006B5053
 006B5063    mov         eax,ebx
 006B5065    pop         ebx
 006B5066    pop         ecx
 006B5067    pop         ebp
 006B5068    ret
*}
end;

//006B506C
function TModulePPJoy.GetDefaultFormat(field:string):TGuiFormat;
begin
{*
 006B506C    push        ebp
 006B506D    mov         ebp,esp
 006B506F    push        ecx
 006B5070    push        ebx
 006B5071    mov         dword ptr [ebp-4],edx
 006B5074    mov         eax,dword ptr [ebp-4]
 006B5077    call        @UStrAddRef
 006B507C    xor         eax,eax
 006B507E    push        ebp
 006B507F    push        6B50B3
 006B5084    push        dword ptr fs:[eax]
 006B5087    mov         dword ptr fs:[eax],esp
 006B508A    mov         eax,dword ptr [ebp-4]
 006B508D    call        006B44F4
 006B5092    sub         eax,10
>006B5095    jae         006B509B
 006B5097    mov         bl,6
>006B5099    jmp         006B509D
 006B509B    xor         ebx,ebx
 006B509D    xor         eax,eax
 006B509F    pop         edx
 006B50A0    pop         ecx
 006B50A1    pop         ecx
 006B50A2    mov         dword ptr fs:[eax],edx
 006B50A5    push        6B50BA
 006B50AA    lea         eax,[ebp-4]
 006B50AD    call        @UStrClr
 006B50B2    ret
>006B50B3    jmp         @HandleFinally
>006B50B8    jmp         006B50AA
 006B50BA    mov         eax,ebx
 006B50BC    pop         ebx
 006B50BD    pop         ecx
 006B50BE    pop         ebp
 006B50BF    ret
*}
end;

//006B50C0
procedure TModulePPJoy.GetFields;
begin
{*
 006B50C0    call        006B426C
 006B50C5    ret
*}
end;

//006B50C8
procedure TModulePPJoy.GetGoodFields;
begin
{*
 006B50C8    call        006B426C
 006B50CD    ret
*}
end;

//006B50D0
procedure TModulePPJoy.GetRange(blank:Boolean; min:Integer; max:Integer);
begin
{*
 006B50D0    push        ebp
 006B50D1    mov         ebp,esp
 006B50D3    mov         byte ptr [edx],1
 006B50D6    mov         dword ptr [ecx],1
 006B50DC    mov         eax,dword ptr [ebp+8]
 006B50DF    mov         dword ptr [eax],10
 006B50E5    pop         ebp
 006B50E6    ret         4
*}
end;

//006B50EC
function TModulePPJoy.Read:Boolean;
begin
{*
 006B50EC    mov         al,1
 006B50EE    ret
*}
end;

//006B50F0
procedure TModulePPJoy.StartCompiletime;
begin
{*
 006B50F0    call        TPieModule.StartCompiletime
 006B50F5    ret
*}
end;

//006B50F8
procedure TModulePPJoy.StartRuntime;
begin
{*
 006B50F8    call        TPieModule.StartRuntime
 006B50FD    call        006B42E4
 006B5102    ret
*}
end;

//006B5104
procedure TModulePPJoy.StopCompiletime;
begin
{*
 006B5104    call        TPieModule.StopCompiletime
 006B5109    ret
*}
end;

//006B510C
procedure TModulePPJoy.StopRuntime;
begin
{*
 006B510C    call        006B44DC
 006B5111    ret
*}
end;

Initialization
//00782314
{*
 00782314    push        ebp
 00782315    mov         ebp,esp
 00782317    push        ebx
 00782318    push        esi
 00782319    push        edi
 0078231A    sub         dword ptr ds:[81EDDC],1
>00782321    jae         00782380
 00782323    xor         edx,edx
 00782325    push        ebp
 00782326    push        782365
 0078232B    push        dword ptr fs:[edx]
 0078232E    mov         dword ptr fs:[edx],esp
 00782331    mov         eax,782394;'Initializing PiePPJoy'
 00782336    call        004FA5FC
 0078233B    mov         dl,1
 0078233D    mov         eax,[006B3EEC];TModulePPJoy
 00782342    call        TModulePPJoy.Create;TModulePPJoy.Create
 00782347    mov         [0081EDE0],eax;gvar_0081EDE0:TModulePPJoy
 0078234C    mov         eax,[0081EDE0];gvar_0081EDE0:TModulePPJoy
 00782351    call        005E31AC
 00782356    call        006B42E4
 0078235B    xor         eax,eax
 0078235D    pop         edx
 0078235E    pop         ecx
 0078235F    pop         ecx
 00782360    mov         dword ptr fs:[eax],edx
>00782363    jmp         00782380
>00782365    jmp         @HandleOnException
 0078236A    dd          1
 0078236E    dd          00418C04;Exception
 00782372    dd          00782376
 00782376    call        004FA644
 0078237B    call        @DoneExcept
 00782380    pop         edi
 00782381    pop         esi
 00782382    pop         ebx
 00782383    pop         ebp
 00782384    ret
*}
Finalization
//006B5114
{*
 006B5114    push        ebp
 006B5115    mov         ebp,esp
 006B5117    push        ebx
 006B5118    push        esi
 006B5119    push        edi
 006B511A    inc         dword ptr ds:[81EDDC]
>006B5120    jne         006B5164
 006B5122    xor         edx,edx
 006B5124    push        ebp
 006B5125    push        6B5149
 006B512A    push        dword ptr fs:[edx]
 006B512D    mov         dword ptr fs:[edx],esp
 006B5130    mov         eax,6B5178;'Finalizing PiePPJoy'
 006B5135    call        004FA5FC
 006B513A    call        006B44DC
 006B513F    xor         eax,eax
 006B5141    pop         edx
 006B5142    pop         ecx
 006B5143    pop         ecx
 006B5144    mov         dword ptr fs:[eax],edx
>006B5147    jmp         006B5164
>006B5149    jmp         @HandleOnException
 006B514E    dd          1
 006B5152    dd          00418C04;Exception
 006B5156    dd          006B515A
 006B515A    call        004FA644
 006B515F    call        @DoneExcept
 006B5164    pop         edi
 006B5165    pop         esi
 006B5166    pop         ebx
 006B5167    pop         ebp
 006B5168    ret
*}
end.