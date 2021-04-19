//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit IdWship6;

interface

uses
  SysUtils, Classes;

    function gaiErrorToWsaError(const gaiError:Integer):Integer;//005A2DD8
    procedure CloseLibrary;//005A2E70
    procedure InitLibrary;//005A2EF0

implementation

//005A2DD8
function gaiErrorToWsaError(const gaiError:Integer):Integer;
begin
{*
 005A2DD8    push        ebx
 005A2DD9    mov         edx,eax
 005A2DDB    cmp         edx,0B
>005A2DDE    ja          005A2E67
 005A2DE4    jmp         dword ptr [edx*4+5A2DEB]
 005A2DE4    dd          005A2E67
 005A2DE4    dd          005A2E1B
 005A2DE4    dd          005A2E1F
 005A2DE4    dd          005A2E26
 005A2DE4    dd          005A2E2D
 005A2DE4    dd          005A2E34
 005A2DE4    dd          005A2E3B
 005A2DE4    dd          005A2E42
 005A2DE4    dd          005A2E49
 005A2DE4    dd          005A2E50
 005A2DE4    dd          005A2E57
 005A2DE4    dd          005A2E5E
 005A2E1B    xor         ebx,ebx
>005A2E1D    jmp         005A2E69
 005A2E1F    mov         ebx,2AFA
>005A2E24    jmp         005A2E69
 005A2E26    mov         ebx,2726
>005A2E2B    jmp         005A2E69
 005A2E2D    mov         ebx,2AFB
>005A2E32    jmp         005A2E69
 005A2E34    mov         ebx,273F
>005A2E39    jmp         005A2E69
 005A2E3B    mov         ebx,8
>005A2E40    jmp         005A2E69
 005A2E42    mov         ebx,2AFC
>005A2E47    jmp         005A2E69
 005A2E49    mov         ebx,2AF9
>005A2E4E    jmp         005A2E69
 005A2E50    mov         ebx,277D
>005A2E55    jmp         005A2E69
 005A2E57    mov         ebx,273C
>005A2E5C    jmp         005A2E69
 005A2E5E    xor         ebx,ebx
 005A2E60    call        IndyRaiseLastError
>005A2E65    jmp         005A2E69
 005A2E67    mov         ebx,eax
 005A2E69    mov         eax,ebx
 005A2E6B    pop         ebx
 005A2E6C    ret
*}
end;

//005A2E70
procedure CloseLibrary;
begin
{*
 005A2E70    mov         eax,[0078DB58];^gvar_00784C7C
 005A2E75    cmp         dword ptr [eax],2
>005A2E78    jne         005A2EEF
 005A2E7A    mov         eax,[0078D080];^gvar_00784C80
 005A2E7F    cmp         dword ptr [eax],5
>005A2E82    jl          005A2EEF
 005A2E84    mov         eax,789EA8
 005A2E89    xor         edx,edx
 005A2E8B    call        InterlockedExchangeTHandle
 005A2E90    test        eax,eax
>005A2E92    je          005A2E9A
 005A2E94    push        eax
 005A2E95    call        kernel32.FreeLibrary
 005A2E9A    mov         eax,789EB0
 005A2E9F    xor         edx,edx
 005A2EA1    call        InterlockedExchangeTHandle
 005A2EA6    test        eax,eax
>005A2EA8    je          005A2EB0
 005A2EAA    push        eax
 005A2EAB    call        kernel32.FreeLibrary
 005A2EB0    mov         byte ptr ds:[789EA4],0
 005A2EB7    xor         eax,eax
 005A2EB9    mov         [00789E70],eax
 005A2EBE    xor         eax,eax
 005A2EC0    mov         [00789E74],eax
 005A2EC5    xor         eax,eax
 005A2EC7    mov         [00789E78],eax
 005A2ECC    xor         eax,eax
 005A2ECE    mov         [00789E90],eax
 005A2ED3    xor         eax,eax
 005A2ED5    mov         [00789E94],eax
 005A2EDA    xor         eax,eax
 005A2EDC    mov         [00789E98],eax
 005A2EE1    xor         eax,eax
 005A2EE3    mov         [00789E9C],eax
 005A2EE8    xor         eax,eax
 005A2EEA    mov         [00789EA0],eax
 005A2EEF    ret
*}
end;

//005A2EF0
procedure InitLibrary;
begin
{*
 005A2EF0    mov         byte ptr ds:[789EA4],0
 005A2EF7    mov         eax,[0078DB58];^gvar_00784C7C
 005A2EFC    cmp         dword ptr [eax],2
>005A2EFF    jne         005A30C9
 005A2F05    mov         eax,[0078D080];^gvar_00784C80
 005A2F0A    cmp         dword ptr [eax],5
>005A2F0D    jl          005A30C9
 005A2F13    call        Winsock2Loaded
 005A2F18    test        al,al
>005A2F1A    jne         005A2F21
 005A2F1C    call        InitializeWinSock
 005A2F21    call        WinsockHandle
 005A2F26    mov         [00789EAC],eax
 005A2F2B    push        5A30CC
 005A2F30    mov         eax,[00789EAC]
 005A2F35    push        eax
 005A2F36    call        GetProcAddress
 005A2F3B    mov         [00789E70],eax
 005A2F40    cmp         dword ptr ds:[789E70],0
>005A2F47    jne         005A2F7C
 005A2F49    mov         edx,8000
 005A2F4E    mov         eax,5A30F4;'Wship6.dll'
 005A2F53    call        SafeLoadLibrary
 005A2F58    mov         [00789EA8],eax
 005A2F5D    mov         eax,[00789EA8]
 005A2F62    mov         [00789EAC],eax
 005A2F67    push        5A30CC
 005A2F6C    mov         eax,[00789EAC]
 005A2F71    push        eax
 005A2F72    call        GetProcAddress
 005A2F77    mov         [00789E70],eax
 005A2F7C    cmp         dword ptr ds:[789E70],0
>005A2F83    je          005A30C4
 005A2F89    push        5A310C
 005A2F8E    mov         eax,[00789EAC]
 005A2F93    push        eax
 005A2F94    call        GetProcAddress
 005A2F99    mov         [00789E74],eax
 005A2F9E    cmp         dword ptr ds:[789E74],0
>005A2FA5    je          005A30C4
 005A2FAB    push        5A3128
 005A2FB0    mov         eax,[00789EAC]
 005A2FB5    push        eax
 005A2FB6    call        GetProcAddress
 005A2FBB    mov         [00789E78],eax
 005A2FC0    cmp         dword ptr ds:[789E78],0
>005A2FC7    je          005A30C4
 005A2FCD    mov         byte ptr ds:[789EA4],1
 005A2FD4    push        5A3144
 005A2FD9    mov         eax,[00789EAC]
 005A2FDE    push        eax
 005A2FDF    call        GetProcAddress
 005A2FE4    mov         [00789E7C],eax
 005A2FE9    push        5A3158
 005A2FEE    mov         eax,[00789EAC]
 005A2FF3    push        eax
 005A2FF4    call        GetProcAddress
 005A2FF9    mov         [00789E80],eax
 005A2FFE    push        5A316C
 005A3003    mov         eax,[00789EAC]
 005A3008    push        eax
 005A3009    call        GetProcAddress
 005A300E    mov         [00789E84],eax
 005A3013    push        5A318C
 005A3018    mov         eax,[00789EAC]
 005A301D    push        eax
 005A301E    call        GetProcAddress
 005A3023    mov         [00789E88],eax
 005A3028    push        5A31AC
 005A302D    mov         eax,[00789EAC]
 005A3032    push        eax
 005A3033    call        GetProcAddress
 005A3038    mov         [00789E8C],eax
 005A303D    mov         edx,8000
 005A3042    mov         eax,5A31D8;'Fwpuclnt.dll'
 005A3047    call        SafeLoadLibrary
 005A304C    mov         [00789EB0],eax
 005A3051    cmp         dword ptr ds:[789EB0],0
>005A3058    je          005A30C9
 005A305A    push        5A31F4
 005A305F    mov         eax,[00789EB0]
 005A3064    push        eax
 005A3065    call        GetProcAddress
 005A306A    mov         [00789E90],eax
 005A306F    push        5A322C
 005A3074    mov         eax,[00789EB0]
 005A3079    push        eax
 005A307A    call        GetProcAddress
 005A307F    mov         [00789E94],eax
 005A3084    push        5A3268
 005A3089    mov         eax,[00789EB0]
 005A308E    push        eax
 005A308F    call        GetProcAddress
 005A3094    mov         [00789E98],eax
 005A3099    push        5A329C
 005A309E    mov         eax,[00789EB0]
 005A30A3    push        eax
 005A30A4    call        GetProcAddress
 005A30A9    mov         [00789E9C],eax
 005A30AE    push        5A32CC
 005A30B3    mov         eax,[00789EB0]
 005A30B8    push        eax
 005A30B9    call        GetProcAddress
 005A30BE    mov         [00789EA0],eax
 005A30C3    ret
 005A30C4    call        CloseLibrary
 005A30C9    ret
*}
end;

end.