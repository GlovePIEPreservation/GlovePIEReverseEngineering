//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit57;

interface

uses
  SysUtils, Classes;


implementation

Initialization
//00781048
{*
 00781048    sub         dword ptr ds:[794F9C],1
>0078104F    jae         00781060
 00781051    mov         edx,788B68;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00781056    mov         eax,[00790C38];gvar_00790C38
 0078105B    call        0053F424
 00781060    ret
*}
Finalization
//00538380
{*
 00538380    push        ebp
 00538381    mov         ebp,esp
 00538383    xor         eax,eax
 00538385    push        ebp
 00538386    push        5383D5
 0053838B    push        dword ptr fs:[eax]
 0053838E    mov         dword ptr fs:[eax],esp
 00538391    inc         dword ptr ds:[794F9C]
>00538397    jne         005383C7
 00538399    mov         eax,[00790C38];gvar_00790C38
 0053839E    call        0053F440
 005383A3    mov         eax,788B68;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 005383A8    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 005383AE    call        @FinalizeRecord
 005383B3    mov         eax,788B80;^'%g + %gi'
 005383B8    call        @UStrClr
 005383BD    mov         eax,788B84;^'%g e^%gi'
 005383C2    call        @UStrClr
 005383C7    xor         eax,eax
 005383C9    pop         edx
 005383CA    pop         ecx
 005383CB    pop         ecx
 005383CC    mov         dword ptr fs:[eax],edx
 005383CF    push        5383DC
 005383D4    ret
>005383D5    jmp         @HandleFinally
>005383DA    jmp         005383D4
 005383DC    pop         ebp
 005383DD    ret
*}
end.