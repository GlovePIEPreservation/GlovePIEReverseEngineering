//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit47;

interface

uses
  SysUtils, Classes;


implementation

Initialization
//00780EEC
{*
 00780EEC    sub         dword ptr ds:[793B54],1
>00780EF3    jae         00780F04
 00780EF5    mov         edx,787104;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00780EFA    mov         eax,[00790C38];gvar_00790C38
 00780EFF    call        0053F424
 00780F04    ret
*}
Finalization
//005302CC
{*
 005302CC    push        ebp
 005302CD    mov         ebp,esp
 005302CF    xor         eax,eax
 005302D1    push        ebp
 005302D2    push        53030D
 005302D7    push        dword ptr fs:[eax]
 005302DA    mov         dword ptr fs:[eax],esp
 005302DD    inc         dword ptr ds:[793B54]
>005302E3    jne         005302FF
 005302E5    mov         eax,[00790C38];gvar_00790C38
 005302EA    call        0053F440
 005302EF    mov         eax,787104;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 005302F4    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 005302FA    call        @FinalizeRecord
 005302FF    xor         eax,eax
 00530301    pop         edx
 00530302    pop         ecx
 00530303    pop         ecx
 00530304    mov         dword ptr fs:[eax],edx
 00530307    push        530314
 0053030C    ret
>0053030D    jmp         @HandleFinally
>00530312    jmp         0053030C
 00530314    pop         ebp
 00530315    ret
*}
end.