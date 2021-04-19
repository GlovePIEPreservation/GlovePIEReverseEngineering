//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit153;

interface

uses
  SysUtils, Classes;

    procedure sub_00766788;//00766788

implementation

//00766788
procedure sub_00766788;
begin
{*
 00766788    push        ebx
 00766789    mov         ebx,822CD0;gvar_00822CD0:THashTable
 0076678E    xor         ecx,ecx
 00766790    mov         edx,766810;'Exists'
 00766795    mov         eax,dword ptr [ebx]
 00766797    call        THashTable.Add
 0076679C    mov         ecx,1
 007667A1    mov         edx,76682C;'x'
 007667A6    mov         eax,dword ptr [ebx]
 007667A8    call        THashTable.Add
 007667AD    mov         ecx,2
 007667B2    mov         edx,76683C;'y'
 007667B7    mov         eax,dword ptr [ebx]
 007667B9    call        THashTable.Add
 007667BE    mov         ecx,3
 007667C3    mov         edx,76684C;'z'
 007667C8    mov         eax,dword ptr [ebx]
 007667CA    call        THashTable.Add
 007667CF    mov         ecx,4
 007667D4    mov         edx,76685C;'yaw'
 007667D9    mov         eax,dword ptr [ebx]
 007667DB    call        THashTable.Add
 007667E0    mov         ecx,5
 007667E5    mov         edx,766870;'pitch'
 007667EA    mov         eax,dword ptr [ebx]
 007667EC    call        THashTable.Add
 007667F1    mov         ecx,6
 007667F6    mov         edx,766888;'roll'
 007667FB    mov         eax,dword ptr [ebx]
 007667FD    call        THashTable.Add
 00766802    pop         ebx
 00766803    ret
*}
end;

Initialization
//00782EAC
{*
 00782EAC    sub         dword ptr ds:[822CD4],1
>00782EB3    jae         00782ED5
 00782EB5    mov         eax,782EE4;'Initializing PieBird'
 00782EBA    call        004FA5FC
 00782EBF    mov         dl,1
 00782EC1    mov         eax,[0067D4A4];THashTable
 00782EC6    call        THashTable.Create;THashTable.Create
 00782ECB    mov         [00822CD0],eax;gvar_00822CD0:THashTable
 00782ED0    call        00766788
 00782ED5    ret
*}
Finalization
end.