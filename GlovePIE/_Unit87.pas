//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit87;

interface

uses
  SysUtils, Classes;


implementation

Initialization
Finalization
//0058B628
{*
 0058B628    push        ebp
 0058B629    mov         ebp,esp
 0058B62B    xor         eax,eax
 0058B62D    push        ebp
 0058B62E    push        58B6CC
 0058B633    push        dword ptr fs:[eax]
 0058B636    mov         dword ptr fs:[eax],esp
 0058B639    inc         dword ptr ds:[815588]
>0058B63F    jne         0058B6BE
 0058B641    mov         eax,815584;gvar_00815584:IInterface
 0058B646    call        @IntfClear
 0058B64B    mov         eax,789B18;^'http://www.w3.org/2001/XMLSchema'
 0058B650    call        @UStrClr
 0058B655    mov         eax,789B1C;^'all'
 0058B65A    mov         ecx,3
 0058B65F    mov         edx,dword ptr ds:[40128C];string
 0058B665    call        @FinalizeArray
 0058B66A    mov         eax,789B28;gvar_00789B28:array[5] of ?
 0058B66F    mov         ecx,5
 0058B674    mov         edx,dword ptr ds:[40128C];string
 0058B67A    call        @FinalizeArray
 0058B67F    mov         eax,789B3C;gvar_00789B3C:array[5] of ?
 0058B684    mov         ecx,5
 0058B689    mov         edx,dword ptr ds:[40128C];string
 0058B68F    call        @FinalizeArray
 0058B694    mov         eax,789B50;^'all'
 0058B699    mov         ecx,3
 0058B69E    mov         edx,dword ptr ds:[40128C];string
 0058B6A4    call        @FinalizeArray
 0058B6A9    mov         eax,789B5C;^'qualified'
 0058B6AE    mov         ecx,2
 0058B6B3    mov         edx,dword ptr ds:[40128C];string
 0058B6B9    call        @FinalizeArray
 0058B6BE    xor         eax,eax
 0058B6C0    pop         edx
 0058B6C1    pop         ecx
 0058B6C2    pop         ecx
 0058B6C3    mov         dword ptr fs:[eax],edx
 0058B6C6    push        58B6D3
 0058B6CB    ret
>0058B6CC    jmp         @HandleFinally
>0058B6D1    jmp         0058B6CB
 0058B6D3    pop         ebp
 0058B6D4    ret
*}
end.