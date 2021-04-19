//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit73;

interface

uses
  SysUtils, Classes;


implementation

Initialization
Finalization
//0054D0D4
{*
 0054D0D4    push        ebp
 0054D0D5    mov         ebp,esp
 0054D0D7    xor         eax,eax
 0054D0D9    push        ebp
 0054D0DA    push        54D110
 0054D0DF    push        dword ptr fs:[eax]
 0054D0E2    mov         dword ptr fs:[eax],esp
 0054D0E5    inc         dword ptr ds:[8154F0]
>0054D0EB    jne         0054D102
 0054D0ED    mov         eax,788EDC;^'AboutJVCL'
 0054D0F2    mov         ecx,12
 0054D0F7    mov         edx,dword ptr ds:[40128C];string
 0054D0FD    call        @FinalizeArray
 0054D102    xor         eax,eax
 0054D104    pop         edx
 0054D105    pop         ecx
 0054D106    pop         ecx
 0054D107    mov         dword ptr fs:[eax],edx
 0054D10A    push        54D117
 0054D10F    ret
>0054D110    jmp         @HandleFinally
>0054D115    jmp         0054D10F
 0054D117    pop         ebp
 0054D118    ret
*}
end.