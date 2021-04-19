//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit48;

interface

uses
  SysUtils, Classes;

type
  TJclCharsetInfo = TJclCharsetInfo = record//size=8
f0:string;//f0
end;
Name:string;//f0
CodePage:Word;//f4
FamilyCodePage:Word;//f6
end;;

implementation

Initialization
//00780F08
{*
 00780F08    sub         dword ptr ds:[793B58],1
>00780F0F    jae         00780F20
 00780F11    mov         edx,787A8C;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00780F16    mov         eax,[00790C38];gvar_00790C38
 00780F1B    call        0053F424
 00780F20    ret
*}
Finalization
//00532C4C
{*
 00532C4C    push        ebp
 00532C4D    mov         ebp,esp
 00532C4F    xor         eax,eax
 00532C51    push        ebp
 00532C52    push        532CA2
 00532C57    push        dword ptr fs:[eax]
 00532C5A    mov         dword ptr fs:[eax],esp
 00532C5D    inc         dword ptr ds:[793B58]
>00532C63    jne         00532C94
 00532C65    mov         eax,[00790C38];gvar_00790C38
 00532C6A    call        0053F440
 00532C6F    mov         eax,78711C;^'ASMO-708'
 00532C74    mov         ecx,12E
 00532C79    mov         edx,dword ptr ds:[530318];TJclCharsetInfo
 00532C7F    call        @FinalizeArray
 00532C84    mov         eax,787A8C;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00532C89    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 00532C8F    call        @FinalizeRecord
 00532C94    xor         eax,eax
 00532C96    pop         edx
 00532C97    pop         ecx
 00532C98    pop         ecx
 00532C99    mov         dword ptr fs:[eax],edx
 00532C9C    push        532CA9
 00532CA1    ret
>00532CA2    jmp         @HandleFinally
>00532CA7    jmp         00532CA1
 00532CA9    pop         ebp
 00532CAA    ret
*}
end.