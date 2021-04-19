//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit54;

interface

uses
  SysUtils, Classes;


implementation

Initialization
//00780FEC
{*
 00780FEC    sub         dword ptr ds:[794F90],1
>00780FF3    jae         00781004
 00780FF5    mov         edx,788A78;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00780FFA    mov         eax,[00790C38];gvar_00790C38
 00780FFF    call        0053F424
 00781004    ret
*}
Finalization
//00536E6C
{*
 00536E6C    push        ebp
 00536E6D    mov         ebp,esp
 00536E6F    xor         eax,eax
 00536E71    push        ebp
 00536E72    push        536EAD
 00536E77    push        dword ptr fs:[eax]
 00536E7A    mov         dword ptr fs:[eax],esp
 00536E7D    inc         dword ptr ds:[794F90]
>00536E83    jne         00536E9F
 00536E85    mov         eax,[00790C38];gvar_00790C38
 00536E8A    call        0053F440
 00536E8F    mov         eax,788A78;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00536E94    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 00536E9A    call        @FinalizeRecord
 00536E9F    xor         eax,eax
 00536EA1    pop         edx
 00536EA2    pop         ecx
 00536EA3    pop         ecx
 00536EA4    mov         dword ptr fs:[eax],edx
 00536EA7    push        536EB4
 00536EAC    ret
>00536EAD    jmp         @HandleFinally
>00536EB2    jmp         00536EAC
 00536EB4    pop         ebp
 00536EB5    ret
*}
end.