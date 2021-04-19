//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit JclWin32;

interface

uses
  SysUtils, Classes;

type
  EJclWin32Error = class(EJclError)
  published
    constructor sub_0052E494(Ident:Integer);//0052E494
    constructor Create(ResStringRec:PResStringRec);//0052E588
    constructor sub_0052E2BC(Msg:string);//0052E2BC
    //constructor sub_0052E398(?:?; ?:?);//0052E398
  public
    FLastError:Cardinal;//f18
    FLastErrorMsg:string;//f1C
  end;
    function CreateMutexW(bInitialOwner:LongBool; lpName:PWideChar):THandle; stdcall;//0052E67C
    function GetVersionExW:LongBool; stdcall;//0052E684

implementation

//0052E2BC
constructor sub_0052E2BC(Msg:string);
begin
{*
 0052E2BC    push        ebp
 0052E2BD    mov         ebp,esp
 0052E2BF    add         esp,0FFFFFFD8
 0052E2C2    push        ebx
 0052E2C3    push        esi
 0052E2C4    push        edi
 0052E2C5    xor         ebx,ebx
 0052E2C7    mov         dword ptr [ebp-8],ebx
 0052E2CA    test        dl,dl
>0052E2CC    je          0052E2D6
 0052E2CE    add         esp,0FFFFFFF0
 0052E2D1    call        @ClassCreate
 0052E2D6    mov         edi,ecx
 0052E2D8    mov         byte ptr [ebp-1],dl
 0052E2DB    mov         ebx,eax
 0052E2DD    xor         eax,eax
 0052E2DF    push        ebp
 0052E2E0    push        52E35C
 0052E2E5    push        dword ptr fs:[eax]
 0052E2E8    mov         dword ptr fs:[eax],esp
 0052E2EB    call        kernel32.GetLastError
 0052E2F0    mov         esi,eax
 0052E2F2    mov         dword ptr [ebx+18],esi;EJclWin32Error.FLastError:Cardinal
 0052E2F5    lea         edx,[ebp-8]
 0052E2F8    mov         eax,esi
 0052E2FA    call        SysErrorMessage
 0052E2FF    mov         edx,dword ptr [ebp-8]
 0052E302    lea         eax,[ebx+1C];EJclWin32Error.FLastErrorMsg:string
 0052E305    call        @UStrAsg
 0052E30A    mov         eax,dword ptr [ebx+1C];EJclWin32Error.FLastErrorMsg:string
 0052E30D    mov         dword ptr [ebp-28],eax
 0052E310    mov         byte ptr [ebp-24],11
 0052E314    mov         eax,dword ptr [ebx+18];EJclWin32Error.FLastError:Cardinal
 0052E317    mov         dword ptr [ebp-20],eax
 0052E31A    mov         byte ptr [ebp-1C],0
 0052E31E    mov         eax,52E390;'
'
 0052E323    mov         dword ptr [ebp-18],eax
 0052E326    mov         byte ptr [ebp-14],11
 0052E32A    mov         dword ptr [ebp-10],edi
 0052E32D    mov         byte ptr [ebp-0C],11
 0052E331    lea         eax,[ebp-28]
 0052E334    push        eax
 0052E335    push        3
 0052E337    mov         ecx,dword ptr ds:[78CC6C];^SResString572:TResStringRec
 0052E33D    xor         edx,edx
 0052E33F    mov         eax,ebx
 0052E341    call        Exception.CreateResFmt
 0052E346    xor         eax,eax
 0052E348    pop         edx
 0052E349    pop         ecx
 0052E34A    pop         ecx
 0052E34B    mov         dword ptr fs:[eax],edx
 0052E34E    push        52E363
 0052E353    lea         eax,[ebp-8]
 0052E356    call        @UStrClr
 0052E35B    ret
>0052E35C    jmp         @HandleFinally
>0052E361    jmp         0052E353
 0052E363    mov         eax,ebx
 0052E365    cmp         byte ptr [ebp-1],0
>0052E369    je          0052E37A
 0052E36B    call        @AfterConstruction
 0052E370    pop         dword ptr fs:[0]
 0052E377    add         esp,0C
 0052E37A    mov         eax,ebx
 0052E37C    pop         edi
 0052E37D    pop         esi
 0052E37E    pop         ebx
 0052E37F    mov         esp,ebp
 0052E381    pop         ebp
 0052E382    ret
*}
end;

//0052E398
{*constructor sub_0052E398(?:?; ?:?);
begin
 0052E398    push        ebp
 0052E399    mov         ebp,esp
 0052E39B    add         esp,0FFFFFFD4
 0052E39E    push        ebx
 0052E39F    push        esi
 0052E3A0    push        edi
 0052E3A1    xor         ebx,ebx
 0052E3A3    mov         dword ptr [ebp-2C],ebx
 0052E3A6    mov         dword ptr [ebp-8],ebx
 0052E3A9    test        dl,dl
>0052E3AB    je          0052E3B5
 0052E3AD    add         esp,0FFFFFFF0
 0052E3B0    call        @ClassCreate
 0052E3B5    mov         edi,ecx
 0052E3B7    mov         byte ptr [ebp-1],dl
 0052E3BA    mov         ebx,eax
 0052E3BC    xor         eax,eax
 0052E3BE    push        ebp
 0052E3BF    push        52E457
 0052E3C4    push        dword ptr fs:[eax]
 0052E3C7    mov         dword ptr fs:[eax],esp
 0052E3CA    call        kernel32.GetLastError
 0052E3CF    mov         esi,eax
 0052E3D1    mov         dword ptr [ebx+18],esi
 0052E3D4    lea         edx,[ebp-8]
 0052E3D7    mov         eax,esi
 0052E3D9    call        SysErrorMessage
 0052E3DE    mov         edx,dword ptr [ebp-8]
 0052E3E1    lea         eax,[ebx+1C]
 0052E3E4    call        @UStrAsg
 0052E3E9    mov         eax,dword ptr [ebx+1C]
 0052E3EC    mov         dword ptr [ebp-28],eax
 0052E3EF    mov         byte ptr [ebp-24],11
 0052E3F3    mov         eax,dword ptr [ebx+18]
 0052E3F6    mov         dword ptr [ebp-20],eax
 0052E3F9    mov         byte ptr [ebp-1C],0
 0052E3FD    mov         eax,52E48C;'
'
 0052E402    mov         dword ptr [ebp-18],eax
 0052E405    mov         byte ptr [ebp-14],11
 0052E409    lea         eax,[ebp-2C]
 0052E40C    push        eax
 0052E40D    mov         edx,dword ptr [ebp+0C]
 0052E410    mov         ecx,dword ptr [ebp+8]
 0052E413    mov         eax,edi
 0052E415    call        Format
 0052E41A    mov         eax,dword ptr [ebp-2C]
 0052E41D    mov         dword ptr [ebp-10],eax
 0052E420    mov         byte ptr [ebp-0C],11
 0052E424    lea         eax,[ebp-28]
 0052E427    push        eax
 0052E428    push        3
 0052E42A    mov         ecx,dword ptr ds:[78CC6C];^SResString572:TResStringRec
 0052E430    xor         edx,edx
 0052E432    mov         eax,ebx
 0052E434    call        Exception.CreateResFmt
 0052E439    xor         eax,eax
 0052E43B    pop         edx
 0052E43C    pop         ecx
 0052E43D    pop         ecx
 0052E43E    mov         dword ptr fs:[eax],edx
 0052E441    push        52E45E
 0052E446    lea         eax,[ebp-2C]
 0052E449    call        @UStrClr
 0052E44E    lea         eax,[ebp-8]
 0052E451    call        @UStrClr
 0052E456    ret
>0052E457    jmp         @HandleFinally
>0052E45C    jmp         0052E446
 0052E45E    mov         eax,ebx
 0052E460    cmp         byte ptr [ebp-1],0
>0052E464    je          0052E475
 0052E466    call        @AfterConstruction
 0052E46B    pop         dword ptr fs:[0]
 0052E472    add         esp,0C
 0052E475    mov         eax,ebx
 0052E477    pop         edi
 0052E478    pop         esi
 0052E479    pop         ebx
 0052E47A    mov         esp,ebp
 0052E47C    pop         ebp
 0052E47D    ret         8
end;*}

//0052E494
constructor sub_0052E494(Ident:Integer);
begin
{*
 0052E494    push        ebp
 0052E495    mov         ebp,esp
 0052E497    add         esp,0FFFFFFD4
 0052E49A    push        ebx
 0052E49B    push        esi
 0052E49C    push        edi
 0052E49D    xor         ebx,ebx
 0052E49F    mov         dword ptr [ebp-2C],ebx
 0052E4A2    mov         dword ptr [ebp-8],ebx
 0052E4A5    test        dl,dl
>0052E4A7    je          0052E4B1
 0052E4A9    add         esp,0FFFFFFF0
 0052E4AC    call        @ClassCreate
 0052E4B1    mov         edi,ecx
 0052E4B3    mov         byte ptr [ebp-1],dl
 0052E4B6    mov         ebx,eax
 0052E4B8    xor         eax,eax
 0052E4BA    push        ebp
 0052E4BB    push        52E54C
 0052E4C0    push        dword ptr fs:[eax]
 0052E4C3    mov         dword ptr fs:[eax],esp
 0052E4C6    call        kernel32.GetLastError
 0052E4CB    mov         esi,eax
 0052E4CD    mov         dword ptr [ebx+18],esi;EJclWin32Error.FLastError:Cardinal
 0052E4D0    lea         edx,[ebp-8]
 0052E4D3    mov         eax,esi
 0052E4D5    call        SysErrorMessage
 0052E4DA    mov         edx,dword ptr [ebp-8]
 0052E4DD    lea         eax,[ebx+1C];EJclWin32Error.FLastErrorMsg:string
 0052E4E0    call        @UStrAsg
 0052E4E5    mov         eax,dword ptr [ebx+1C];EJclWin32Error.FLastErrorMsg:string
 0052E4E8    mov         dword ptr [ebp-28],eax
 0052E4EB    mov         byte ptr [ebp-24],11
 0052E4EF    mov         eax,dword ptr [ebx+18];EJclWin32Error.FLastError:Cardinal
 0052E4F2    mov         dword ptr [ebp-20],eax
 0052E4F5    mov         byte ptr [ebp-1C],0
 0052E4F9    mov         eax,52E580;'
'
 0052E4FE    mov         dword ptr [ebp-18],eax
 0052E501    mov         byte ptr [ebp-14],11
 0052E505    lea         edx,[ebp-2C]
 0052E508    mov         eax,edi
 0052E50A    call        LoadStr
 0052E50F    mov         eax,dword ptr [ebp-2C]
 0052E512    mov         dword ptr [ebp-10],eax
 0052E515    mov         byte ptr [ebp-0C],11
 0052E519    lea         eax,[ebp-28]
 0052E51C    push        eax
 0052E51D    push        3
 0052E51F    mov         ecx,dword ptr ds:[78CC6C];^SResString572:TResStringRec
 0052E525    xor         edx,edx
 0052E527    mov         eax,ebx
 0052E529    call        Exception.CreateResFmt
 0052E52E    xor         eax,eax
 0052E530    pop         edx
 0052E531    pop         ecx
 0052E532    pop         ecx
 0052E533    mov         dword ptr fs:[eax],edx
 0052E536    push        52E553
 0052E53B    lea         eax,[ebp-2C]
 0052E53E    call        @UStrClr
 0052E543    lea         eax,[ebp-8]
 0052E546    call        @UStrClr
 0052E54B    ret
>0052E54C    jmp         @HandleFinally
>0052E551    jmp         0052E53B
 0052E553    mov         eax,ebx
 0052E555    cmp         byte ptr [ebp-1],0
>0052E559    je          0052E56A
 0052E55B    call        @AfterConstruction
 0052E560    pop         dword ptr fs:[0]
 0052E567    add         esp,0C
 0052E56A    mov         eax,ebx
 0052E56C    pop         edi
 0052E56D    pop         esi
 0052E56E    pop         ebx
 0052E56F    mov         esp,ebp
 0052E571    pop         ebp
 0052E572    ret
*}
end;

//0052E588
constructor EJclWin32Error.Create(ResStringRec:PResStringRec);
begin
{*
 0052E588    push        ebp
 0052E589    mov         ebp,esp
 0052E58B    add         esp,0FFFFFFD4
 0052E58E    push        ebx
 0052E58F    push        esi
 0052E590    push        edi
 0052E591    xor         ebx,ebx
 0052E593    mov         dword ptr [ebp-2C],ebx
 0052E596    mov         dword ptr [ebp-8],ebx
 0052E599    test        dl,dl
>0052E59B    je          0052E5A5
 0052E59D    add         esp,0FFFFFFF0
 0052E5A0    call        @ClassCreate
 0052E5A5    mov         edi,ecx
 0052E5A7    mov         byte ptr [ebp-1],dl
 0052E5AA    mov         ebx,eax
 0052E5AC    xor         eax,eax
 0052E5AE    push        ebp
 0052E5AF    push        52E640
 0052E5B4    push        dword ptr fs:[eax]
 0052E5B7    mov         dword ptr fs:[eax],esp
 0052E5BA    call        kernel32.GetLastError
 0052E5BF    mov         esi,eax
 0052E5C1    mov         dword ptr [ebx+18],esi;EJclWin32Error.FLastError:Cardinal
 0052E5C4    lea         edx,[ebp-8]
 0052E5C7    mov         eax,esi
 0052E5C9    call        SysErrorMessage
 0052E5CE    mov         edx,dword ptr [ebp-8]
 0052E5D1    lea         eax,[ebx+1C];EJclWin32Error.FLastErrorMsg:string
 0052E5D4    call        @UStrAsg
 0052E5D9    mov         eax,dword ptr [ebx+1C];EJclWin32Error.FLastErrorMsg:string
 0052E5DC    mov         dword ptr [ebp-28],eax
 0052E5DF    mov         byte ptr [ebp-24],11
 0052E5E3    mov         eax,dword ptr [ebx+18];EJclWin32Error.FLastError:Cardinal
 0052E5E6    mov         dword ptr [ebp-20],eax
 0052E5E9    mov         byte ptr [ebp-1C],0
 0052E5ED    mov         eax,52E674;'
'
 0052E5F2    mov         dword ptr [ebp-18],eax
 0052E5F5    mov         byte ptr [ebp-14],11
 0052E5F9    lea         edx,[ebp-2C]
 0052E5FC    mov         eax,edi
 0052E5FE    call        LoadResString
 0052E603    mov         eax,dword ptr [ebp-2C]
 0052E606    mov         dword ptr [ebp-10],eax
 0052E609    mov         byte ptr [ebp-0C],11
 0052E60D    lea         eax,[ebp-28]
 0052E610    push        eax
 0052E611    push        3
 0052E613    mov         ecx,dword ptr ds:[78CC6C];^SResString572:TResStringRec
 0052E619    xor         edx,edx
 0052E61B    mov         eax,ebx
 0052E61D    call        Exception.CreateResFmt
 0052E622    xor         eax,eax
 0052E624    pop         edx
 0052E625    pop         ecx
 0052E626    pop         ecx
 0052E627    mov         dword ptr fs:[eax],edx
 0052E62A    push        52E647
 0052E62F    lea         eax,[ebp-2C]
 0052E632    call        @UStrClr
 0052E637    lea         eax,[ebp-8]
 0052E63A    call        @UStrClr
 0052E63F    ret
>0052E640    jmp         @HandleFinally
>0052E645    jmp         0052E62F
 0052E647    mov         eax,ebx
 0052E649    cmp         byte ptr [ebp-1],0
>0052E64D    je          0052E65E
 0052E64F    call        @AfterConstruction
 0052E654    pop         dword ptr fs:[0]
 0052E65B    add         esp,0C
 0052E65E    mov         eax,ebx
 0052E660    pop         edi
 0052E661    pop         esi
 0052E662    pop         ebx
 0052E663    mov         esp,ebp
 0052E665    pop         ebp
 0052E666    ret
*}
end;

//0052E67C
function kernel32.CreateMutexW(bInitialOwner:LongBool; lpName:PWideChar):THandle; stdcall;
begin
{*
 0052E67C    jmp         dword ptr ds:[826880]
*}
end;

//0052E684
function kernel32.GetVersionExW:LongBool; stdcall;
begin
{*
 0052E684    jmp         dword ptr ds:[82687C]
*}
end;

Initialization
//00780E5C
{*
 00780E5C    sub         dword ptr ds:[793B38],1
>00780E63    jae         00780E74
 00780E65    mov         edx,7870A4;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00780E6A    mov         eax,[00790C38];gvar_00790C38
 00780E6F    call        0053F424
 00780E74    ret
*}
Finalization
//0052E68C
{*
 0052E68C    push        ebp
 0052E68D    mov         ebp,esp
 0052E68F    xor         eax,eax
 0052E691    push        ebp
 0052E692    push        52E6CD
 0052E697    push        dword ptr fs:[eax]
 0052E69A    mov         dword ptr fs:[eax],esp
 0052E69D    inc         dword ptr ds:[793B38]
>0052E6A3    jne         0052E6BF
 0052E6A5    mov         eax,[00790C38];gvar_00790C38
 0052E6AA    call        0053F440
 0052E6AF    mov         eax,7870A4;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 0052E6B4    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 0052E6BA    call        @FinalizeRecord
 0052E6BF    xor         eax,eax
 0052E6C1    pop         edx
 0052E6C2    pop         ecx
 0052E6C3    pop         ecx
 0052E6C4    mov         dword ptr fs:[eax],edx
 0052E6C7    push        52E6D4
 0052E6CC    ret
>0052E6CD    jmp         @HandleFinally
>0052E6D2    jmp         0052E6CC
 0052E6D4    pop         ebp
 0052E6D5    ret
*}
end.