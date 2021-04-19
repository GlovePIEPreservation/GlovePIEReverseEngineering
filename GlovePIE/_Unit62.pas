//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit62;

interface

uses
  SysUtils, Classes;


implementation

Initialization
//007810E4
{*
 007810E4    sub         dword ptr ds:[8154B0],1
>007810EB    jae         007810FC
 007810ED    mov         edx,788BFC;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 007810F2    mov         eax,[00790C38];gvar_00790C38
 007810F7    call        0053F424
 007810FC    ret
*}
Finalization
//005399F8
{*
 005399F8    push        ebp
 005399F9    mov         ebp,esp
 005399FB    xor         eax,eax
 005399FD    push        ebp
 005399FE    push        539A39
 00539A03    push        dword ptr fs:[eax]
 00539A06    mov         dword ptr fs:[eax],esp
 00539A09    inc         dword ptr ds:[8154B0]
>00539A0F    jne         00539A2B
 00539A11    mov         eax,[00790C38];gvar_00790C38
 00539A16    call        0053F440
 00539A1B    mov         eax,788BFC;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00539A20    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 00539A26    call        @FinalizeRecord
 00539A2B    xor         eax,eax
 00539A2D    pop         edx
 00539A2E    pop         ecx
 00539A2F    pop         ecx
 00539A30    mov         dword ptr fs:[eax],edx
 00539A33    push        539A40
 00539A38    ret
>00539A39    jmp         @HandleFinally
>00539A3E    jmp         00539A38
 00539A40    pop         ebp
 00539A41    ret
*}
end.