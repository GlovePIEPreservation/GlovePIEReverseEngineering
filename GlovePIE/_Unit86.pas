//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit86;

interface

uses
  SysUtils, Classes;


implementation

Initialization
Finalization
//0058B400
{*
 0058B400    push        ebp
 0058B401    mov         ebp,esp
 0058B403    xor         eax,eax
 0058B405    push        ebp
 0058B406    push        58B451
 0058B40B    push        dword ptr fs:[eax]
 0058B40E    mov         dword ptr fs:[eax],esp
 0058B411    inc         dword ptr ds:[815580]
>0058B417    jne         0058B443
 0058B419    mov         eax,789A34;^'string'
 0058B41E    mov         ecx,2E
 0058B423    mov         edx,dword ptr ds:[40128C];string
 0058B429    call        @FinalizeArray
 0058B42E    mov         eax,789AEC;^'timeDuration'
 0058B433    mov         ecx,0B
 0058B438    mov         edx,dword ptr ds:[40128C];string
 0058B43E    call        @FinalizeArray
 0058B443    xor         eax,eax
 0058B445    pop         edx
 0058B446    pop         ecx
 0058B447    pop         ecx
 0058B448    mov         dword ptr fs:[eax],edx
 0058B44B    push        58B458
 0058B450    ret
>0058B451    jmp         @HandleFinally
>0058B456    jmp         0058B450
 0058B458    pop         ebp
 0058B459    ret
*}
end.