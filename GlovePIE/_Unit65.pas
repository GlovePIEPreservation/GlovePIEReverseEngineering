//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit65;

interface

uses
  SysUtils, Classes;


implementation

Initialization
//00781138
{*
 00781138    sub         dword ptr ds:[8154BC],1
>0078113F    jae         00781150
 00781141    mov         edx,788C7C;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00781146    mov         eax,[00790C38];gvar_00790C38
 0078114B    call        0053F424
 00781150    ret
*}
Finalization
//0053CD00
{*
 0053CD00    push        ebp
 0053CD01    mov         ebp,esp
 0053CD03    xor         eax,eax
 0053CD05    push        ebp
 0053CD06    push        53CD41
 0053CD0B    push        dword ptr fs:[eax]
 0053CD0E    mov         dword ptr fs:[eax],esp
 0053CD11    inc         dword ptr ds:[8154BC]
>0053CD17    jne         0053CD33
 0053CD19    mov         eax,[00790C38];gvar_00790C38
 0053CD1E    call        0053F440
 0053CD23    mov         eax,788C7C;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 0053CD28    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 0053CD2E    call        @FinalizeRecord
 0053CD33    xor         eax,eax
 0053CD35    pop         edx
 0053CD36    pop         ecx
 0053CD37    pop         ecx
 0053CD38    mov         dword ptr fs:[eax],edx
 0053CD3B    push        53CD48
 0053CD40    ret
>0053CD41    jmp         @HandleFinally
>0053CD46    jmp         0053CD40
 0053CD48    pop         ebp
 0053CD49    ret
*}
end.