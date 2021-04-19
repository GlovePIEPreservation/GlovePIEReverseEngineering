//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit58;

interface

uses
  SysUtils, Classes;


implementation

Initialization
//00781064
{*
 00781064    sub         dword ptr ds:[794FA0],1
>0078106B    jae         0078107C
 0078106D    mov         edx,788B88;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00781072    mov         eax,[00790C38];gvar_00790C38
 00781077    call        0053F424
 0078107C    ret
*}
Finalization
//005385AC
{*
 005385AC    push        ebp
 005385AD    mov         ebp,esp
 005385AF    xor         eax,eax
 005385B1    push        ebp
 005385B2    push        5385ED
 005385B7    push        dword ptr fs:[eax]
 005385BA    mov         dword ptr fs:[eax],esp
 005385BD    inc         dword ptr ds:[794FA0]
>005385C3    jne         005385DF
 005385C5    mov         eax,[00790C38];gvar_00790C38
 005385CA    call        0053F440
 005385CF    mov         eax,788B88;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 005385D4    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 005385DA    call        @FinalizeRecord
 005385DF    xor         eax,eax
 005385E1    pop         edx
 005385E2    pop         ecx
 005385E3    pop         ecx
 005385E4    mov         dword ptr fs:[eax],edx
 005385E7    push        5385F4
 005385EC    ret
>005385ED    jmp         @HandleFinally
>005385F2    jmp         005385EC
 005385F4    pop         ebp
 005385F5    ret
*}
end.