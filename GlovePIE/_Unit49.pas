//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit49;

interface

uses
  SysUtils, Classes;


implementation

Initialization
//00780F24
{*
 00780F24    sub         dword ptr ds:[793B5C],1
>00780F2B    jae         00780F3C
 00780F2D    mov         edx,787AA4;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00780F32    mov         eax,[00790C38];gvar_00790C38
 00780F37    call        0053F424
 00780F3C    ret
*}
Finalization
//00532E70
{*
 00532E70    push        ebp
 00532E71    mov         ebp,esp
 00532E73    xor         eax,eax
 00532E75    push        ebp
 00532E76    push        532EB1
 00532E7B    push        dword ptr fs:[eax]
 00532E7E    mov         dword ptr fs:[eax],esp
 00532E81    inc         dword ptr ds:[793B5C]
>00532E87    jne         00532EA3
 00532E89    mov         eax,[00790C38];gvar_00790C38
 00532E8E    call        0053F440
 00532E93    mov         eax,787AA4;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00532E98    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 00532E9E    call        @FinalizeRecord
 00532EA3    xor         eax,eax
 00532EA5    pop         edx
 00532EA6    pop         ecx
 00532EA7    pop         ecx
 00532EA8    mov         dword ptr fs:[eax],edx
 00532EAB    push        532EB8
 00532EB0    ret
>00532EB1    jmp         @HandleFinally
>00532EB6    jmp         00532EB0
 00532EB8    pop         ebp
 00532EB9    ret
*}
end.