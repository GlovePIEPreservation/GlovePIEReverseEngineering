//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit155;

interface

uses
  SysUtils, Classes;

    //function sub_00767E88:?;//00767E88
    procedure sub_00768318;//00768318

implementation

//00767E88
{*function sub_00767E88:?;
begin
 00767E88    push        ebx
 00767E89    mov         ebx,822CE4;gvar_00822CE4:HMODULE
 00767E8E    push        767FF0;'lglcd_dda_dll.dll'
 00767E93    call        kernel32.LoadLibraryW
 00767E98    mov         dword ptr [ebx],eax
 00767E9A    cmp         dword ptr [ebx],0FFFFFFFF
>00767E9D    jne         00767EB9
 00767E9F    mov         ecx,768020;'lglcd: Unable to load the "lglcd_dda" library!'
 00767EA4    mov         dl,1
 00767EA6    mov         eax,[00418C04];Exception
 00767EAB    call        Exception.Create;Exception.Create
 00767EB0    call        @RaiseExcept
 00767EB5    xor         eax,eax
 00767EB7    pop         ebx
 00767EB8    ret
 00767EB9    push        768080;'LgOpenLcdDevice'
 00767EBE    mov         eax,dword ptr [ebx]
 00767EC0    push        eax
 00767EC1    call        GetProcAddress
 00767EC6    mov         [0078C9A4],eax;gvar_0078C9A4:Pointer
 00767ECB    push        7680A0;'LgFreeLcdDevice'
 00767ED0    mov         eax,dword ptr [ebx]
 00767ED2    push        eax
 00767ED3    call        GetProcAddress
 00767ED8    mov         [0078C9A8],eax;gvar_0078C9A8:Pointer
 00767EDD    push        7680C0;'LgSetDisplayLight'
 00767EE2    mov         eax,dword ptr [ebx]
 00767EE4    push        eax
 00767EE5    call        GetProcAddress
 00767EEA    mov         [0078C9AC],eax;gvar_0078C9AC:Pointer
 00767EEF    push        7680E4;'LgGetDisplayLight'
 00767EF4    mov         eax,dword ptr [ebx]
 00767EF6    push        eax
 00767EF7    call        GetProcAddress
 00767EFC    mov         [0078C9B0],eax;gvar_0078C9B0:Pointer
 00767F01    push        768108;'LgSetKeyboardLight'
 00767F06    mov         eax,dword ptr [ebx]
 00767F08    push        eax
 00767F09    call        GetProcAddress
 00767F0E    mov         [0078C9B4],eax;gvar_0078C9B4:Pointer
 00767F13    push        768130;'LgGetKeyboardLight'
 00767F18    mov         eax,dword ptr [ebx]
 00767F1A    push        eax
 00767F1B    call        GetProcAddress
 00767F20    mov         [0078C9B8],eax;gvar_0078C9B8:Pointer
 00767F25    push        768158;'LgSetMLights'
 00767F2A    mov         eax,dword ptr [ebx]
 00767F2C    push        eax
 00767F2D    call        GetProcAddress
 00767F32    mov         [0078C9BC],eax;gvar_0078C9BC:Pointer
 00767F37    push        768174;'LgGetMLights'
 00767F3C    mov         eax,dword ptr [ebx]
 00767F3E    push        eax
 00767F3F    call        GetProcAddress
 00767F44    mov         [0078C9C0],eax;gvar_0078C9C0:Pointer
 00767F49    push        768190;'LgSetContrast'
 00767F4E    mov         eax,dword ptr [ebx]
 00767F50    push        eax
 00767F51    call        GetProcAddress
 00767F56    mov         [0078C9C4],eax;gvar_0078C9C4:Pointer
 00767F5B    push        7681AC;'LgSetGKeyCallbackFunction'
 00767F60    mov         eax,dword ptr [ebx]
 00767F62    push        eax
 00767F63    call        GetProcAddress
 00767F68    mov         [0078C9C8],eax;gvar_0078C9C8:Pointer
 00767F6D    push        7681E0;'LgSetMediaKeyCallbackFunction'
 00767F72    mov         eax,dword ptr [ebx]
 00767F74    push        eax
 00767F75    call        GetProcAddress
 00767F7A    mov         [0078C9CC],eax;gvar_0078C9CC:Pointer
 00767F7F    push        76821C;'LgSetKeyboardKeyCallbackFunction'
 00767F84    mov         eax,dword ptr [ebx]
 00767F86    push        eax
 00767F87    call        GetProcAddress
 00767F8C    mov         [0078C9D0],eax;gvar_0078C9D0:Pointer
 00767F91    push        768260;'LgSetDisplayData'
 00767F96    mov         eax,dword ptr [ebx]
 00767F98    push        eax
 00767F99    call        GetProcAddress
 00767F9E    mov         [0078C9D4],eax;gvar_0078C9D4:Pointer
 00767FA3    push        768284;'LgPollGKeys'
 00767FA8    mov         eax,dword ptr [ebx]
 00767FAA    push        eax
 00767FAB    call        GetProcAddress
 00767FB0    mov         [0078C9D8],eax;gvar_0078C9D8:Pointer
 00767FB5    push        76829C;'LgPollKeyboardKeys'
 00767FBA    mov         eax,dword ptr [ebx]
 00767FBC    push        eax
 00767FBD    call        GetProcAddress
 00767FC2    mov         [0078C9DC],eax;gvar_0078C9DC:Pointer
 00767FC7    push        7682C4;'LgPollMediaKeys'
 00767FCC    mov         eax,dword ptr [ebx]
 00767FCE    push        eax
 00767FCF    call        GetProcAddress
 00767FD4    mov         [0078C9E0],eax;gvar_0078C9E0:Pointer
 00767FD9    push        7682E4;'LgGetLcdDeviceDisplayName'
 00767FDE    mov         eax,dword ptr [ebx]
 00767FE0    push        eax
 00767FE1    call        GetProcAddress
 00767FE6    mov         [0078C9E4],eax;gvar_0078C9E4:Pointer
 00767FEB    mov         al,1
 00767FED    pop         ebx
 00767FEE    ret
end;*}

//00768318
procedure sub_00768318;
begin
{*
 00768318    mov         eax,[00822CE4];gvar_00822CE4:HMODULE
 0076831D    push        eax
 0076831E    call        kernel32.FreeLibrary
 00768323    cmp         eax,1
 00768326    sbb         eax,eax
 00768328    inc         eax
 00768329    ret
*}
end;

Initialization
//00782F78
{*
 00782F78    push        ebp
 00782F79    mov         ebp,esp
 00782F7B    push        ebx
 00782F7C    push        esi
 00782F7D    push        edi
 00782F7E    sub         dword ptr ds:[822CE0],1
>00782F85    jae         00782FD8
 00782F87    xor         eax,eax
 00782F89    push        ebp
 00782F8A    push        782FA4
 00782F8F    push        dword ptr fs:[eax]
 00782F92    mov         dword ptr fs:[eax],esp
 00782F95    call        00767E88
 00782F9A    xor         eax,eax
 00782F9C    pop         edx
 00782F9D    pop         ecx
 00782F9E    pop         ecx
 00782F9F    mov         dword ptr fs:[eax],edx
>00782FA2    jmp         00782FD8
>00782FA4    jmp         @HandleOnException
 00782FA9    dd          1
 00782FAD    dd          00418C04;Exception
 00782FB1    dd          00782FB5
 00782FB5    mov         ebx,eax
 00782FB7    push        10
 00782FB9    push        782FE0
 00782FBE    mov         eax,dword ptr [ebx+4];Exception.FMessage:string
 00782FC1    call        @UStrToPWChar
 00782FC6    push        eax
 00782FC7    push        0
 00782FC9    call        user32.MessageBoxW
 00782FCE    call        @RaiseAgain
 00782FD3    call        @DoneExcept
 00782FD8    pop         edi
 00782FD9    pop         esi
 00782FDA    pop         ebx
 00782FDB    pop         ebp
 00782FDC    ret
*}
Finalization
end.