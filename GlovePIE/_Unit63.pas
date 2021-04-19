//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit63;

interface

uses
  SysUtils, Classes;


implementation

Initialization
//00781100
{*
 00781100    sub         dword ptr ds:[8154B4],1
>00781107    jae         00781118
 00781109    mov         edx,788C14;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 0078110E    mov         eax,[00790C38];gvar_00790C38
 00781113    call        0053F424
 00781118    ret
*}
Finalization
//00539C10
{*
 00539C10    push        ebp
 00539C11    mov         ebp,esp
 00539C13    xor         eax,eax
 00539C15    push        ebp
 00539C16    push        539C51
 00539C1B    push        dword ptr fs:[eax]
 00539C1E    mov         dword ptr fs:[eax],esp
 00539C21    inc         dword ptr ds:[8154B4]
>00539C27    jne         00539C43
 00539C29    mov         eax,[00790C38];gvar_00790C38
 00539C2E    call        0053F440
 00539C33    mov         eax,788C14;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00539C38    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 00539C3E    call        @FinalizeRecord
 00539C43    xor         eax,eax
 00539C45    pop         edx
 00539C46    pop         ecx
 00539C47    pop         ecx
 00539C48    mov         dword ptr fs:[eax],edx
 00539C4B    push        539C58
 00539C50    ret
>00539C51    jmp         @HandleFinally
>00539C56    jmp         00539C50
 00539C58    pop         ebp
 00539C59    ret
*}
end.