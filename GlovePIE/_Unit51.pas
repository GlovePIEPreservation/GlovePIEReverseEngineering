//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit51;

interface

uses
  SysUtils, Classes;


implementation

Initialization
//00780F60
{*
 00780F60    sub         dword ptr ds:[793B64],1
>00780F67    jae         00780F78
 00780F69    mov         edx,787AD4;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00780F6E    mov         eax,[00790C38];gvar_00790C38
 00780F73    call        0053F424
 00780F78    ret
*}
Finalization
//005332A8
{*
 005332A8    push        ebp
 005332A9    mov         ebp,esp
 005332AB    xor         eax,eax
 005332AD    push        ebp
 005332AE    push        5332E9
 005332B3    push        dword ptr fs:[eax]
 005332B6    mov         dword ptr fs:[eax],esp
 005332B9    inc         dword ptr ds:[793B64]
>005332BF    jne         005332DB
 005332C1    mov         eax,[00790C38];gvar_00790C38
 005332C6    call        0053F440
 005332CB    mov         eax,787AD4;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 005332D0    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 005332D6    call        @FinalizeRecord
 005332DB    xor         eax,eax
 005332DD    pop         edx
 005332DE    pop         ecx
 005332DF    pop         ecx
 005332E0    mov         dword ptr fs:[eax],edx
 005332E3    push        5332F0
 005332E8    ret
>005332E9    jmp         @HandleFinally
>005332EE    jmp         005332E8
 005332F0    pop         ebp
 005332F1    ret
*}
end.