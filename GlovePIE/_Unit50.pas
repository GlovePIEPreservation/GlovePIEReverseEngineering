//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit50;

interface

uses
  SysUtils, Classes;

    procedure sub_00533084;//00533084
    procedure sub_00533088;//00533088

implementation

//00533084
procedure sub_00533084;
begin
{*
 00533084    ret
*}
end;

//00533088
procedure sub_00533088;
begin
{*
 00533088    ret
*}
end;

Initialization
//00780F40
{*
 00780F40    sub         dword ptr ds:[793B60],1
>00780F47    jae         00780F5D
 00780F49    call        00533084
 00780F4E    mov         edx,787ABC;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00780F53    mov         eax,[00790C38];gvar_00790C38
 00780F58    call        0053F424
 00780F5D    ret
*}
Finalization
//0053308C
{*
 0053308C    push        ebp
 0053308D    mov         ebp,esp
 0053308F    xor         eax,eax
 00533091    push        ebp
 00533092    push        5330D2
 00533097    push        dword ptr fs:[eax]
 0053309A    mov         dword ptr fs:[eax],esp
 0053309D    inc         dword ptr ds:[793B60]
>005330A3    jne         005330C4
 005330A5    call        00533088
 005330AA    mov         eax,[00790C38];gvar_00790C38
 005330AF    call        0053F440
 005330B4    mov         eax,787ABC;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 005330B9    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 005330BF    call        @FinalizeRecord
 005330C4    xor         eax,eax
 005330C6    pop         edx
 005330C7    pop         ecx
 005330C8    pop         ecx
 005330C9    mov         dword ptr fs:[eax],edx
 005330CC    push        5330D9
 005330D1    ret
>005330D2    jmp         @HandleFinally
>005330D7    jmp         005330D1
 005330D9    pop         ebp
 005330DA    ret
*}
end.