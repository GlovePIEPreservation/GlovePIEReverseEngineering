//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit136;

interface

uses
  SysUtils, Classes;

    //function sub_006ED7A8:?;//006ED7A8
    procedure sub_006ED7B4;//006ED7B4
    //function sub_006ED7BC:?;//006ED7BC
    //function sub_006ED7C8:?;//006ED7C8
    //function sub_006ED7D4:?;//006ED7D4
    //function sub_006ED7E0:?;//006ED7E0
    //function sub_006ED7EC:?;//006ED7EC
    procedure sub_006ED7F8;//006ED7F8
    //function sub_006ED888:?;//006ED888

implementation

//006ED7A8
{*function sub_006ED7A8:?;
begin
 006ED7A8    push        ebp
 006ED7A9    mov         ebp,esp
 006ED7AB    mov         eax,48F
 006ED7B0    pop         ebp
 006ED7B1    ret         8
end;*}

//006ED7B4
procedure sub_006ED7B4;
begin
{*
 006ED7B4    push        ebp
 006ED7B5    mov         ebp,esp
 006ED7B7    pop         ebp
 006ED7B8    ret         4
*}
end;

//006ED7BC
{*function sub_006ED7BC:?;
begin
 006ED7BC    push        ebp
 006ED7BD    mov         ebp,esp
 006ED7BF    mov         eax,48F
 006ED7C4    pop         ebp
 006ED7C5    ret         8
end;*}

//006ED7C8
{*function sub_006ED7C8:?;
begin
 006ED7C8    push        ebp
 006ED7C9    mov         ebp,esp
 006ED7CB    mov         eax,48F
 006ED7D0    pop         ebp
 006ED7D1    ret         0C
end;*}

//006ED7D4
{*function sub_006ED7D4:?;
begin
 006ED7D4    push        ebp
 006ED7D5    mov         ebp,esp
 006ED7D7    mov         eax,48F
 006ED7DC    pop         ebp
 006ED7DD    ret         0C
end;*}

//006ED7E0
{*function sub_006ED7E0:?;
begin
 006ED7E0    push        ebp
 006ED7E1    mov         ebp,esp
 006ED7E3    mov         eax,48F
 006ED7E8    pop         ebp
 006ED7E9    ret         0C
end;*}

//006ED7EC
{*function sub_006ED7EC:?;
begin
 006ED7EC    push        ebp
 006ED7ED    mov         ebp,esp
 006ED7EF    mov         eax,48F
 006ED7F4    pop         ebp
 006ED7F5    ret         0C
end;*}

//006ED7F8
procedure sub_006ED7F8;
begin
{*
 006ED7F8    push        ebx
 006ED7F9    push        ecx
 006ED7FA    mov         eax,esp
 006ED7FC    xor         ecx,ecx
 006ED7FE    mov         edx,4
 006ED803    call        @FillChar
 006ED808    cmp         dword ptr ds:[82274C],0;gvar_0082274C:Pointer
>006ED80F    je          006ED821
 006ED811    xor         ebx,ebx
 006ED813    push        esp
 006ED814    push        ebx
 006ED815    call        dword ptr ds:[82274C]
 006ED81B    inc         ebx
 006ED81C    cmp         ebx,4
>006ED81F    jne         006ED813
 006ED821    cmp         dword ptr ds:[78C36C],0;gvar_0078C36C:HMODULE
>006ED828    je          006ED83C
 006ED82A    mov         eax,[0078C36C];0x0 gvar_0078C36C:HMODULE
 006ED82F    push        eax
 006ED830    call        kernel32.FreeLibrary
 006ED835    xor         eax,eax
 006ED837    mov         [0078C36C],eax;gvar_0078C36C:HMODULE
 006ED83C    mov         dword ptr ds:[822748],6ED7A8
 006ED846    mov         dword ptr ds:[82274C],6ED7BC
 006ED850    mov         dword ptr ds:[822754],6ED7B4
 006ED85A    mov         dword ptr ds:[822750],6ED7C8
 006ED864    mov         dword ptr ds:[822760],6ED7D4
 006ED86E    mov         dword ptr ds:[82275C],6ED7EC
 006ED878    mov         dword ptr ds:[822758],6ED7E0
 006ED882    pop         edx
 006ED883    pop         ebx
 006ED884    ret
*}
end;

//006ED888
{*function sub_006ED888:?;
begin
 006ED888    push        ebx
 006ED889    push        esi
 006ED88A    push        edi
 006ED88B    mov         edi,78C36C;gvar_0078C36C:HMODULE
 006ED890    push        6ED9F4;'XINPUT1_3.DLL'
 006ED895    call        kernel32.LoadLibraryW
 006ED89A    mov         dword ptr [edi],eax
 006ED89C    mov         dword ptr ds:[822764],3;gvar_00822764:Single
 006ED8A6    cmp         dword ptr [edi],0
>006ED8A9    jne         006ED8C1
 006ED8AB    push        6EDA10;'XINPUT1_2.DLL'
 006ED8B0    call        kernel32.LoadLibraryW
 006ED8B5    mov         dword ptr [edi],eax
 006ED8B7    mov         dword ptr ds:[822764],2;gvar_00822764:Single
 006ED8C1    cmp         dword ptr [edi],0
>006ED8C4    jne         006ED8DC
 006ED8C6    push        6EDA2C;'XINPUT1_1.DLL'
 006ED8CB    call        kernel32.LoadLibraryW
 006ED8D0    mov         dword ptr [edi],eax
 006ED8D2    mov         dword ptr ds:[822764],1;gvar_00822764:Single
 006ED8DC    cmp         dword ptr [edi],0
 006ED8DF    setne       bl
 006ED8E2    cmp         dword ptr [edi],0
>006ED8E5    jne         006ED8F8
 006ED8E7    call        006ED7F8
 006ED8EC    xor         eax,eax
 006ED8EE    mov         [00822764],eax;gvar_00822764:Single
>006ED8F3    jmp         006ED9ED
 006ED8F8    push        6EDA48;'XInputGetState'
 006ED8FD    mov         eax,dword ptr [edi]
 006ED8FF    push        eax
 006ED900    call        GetProcAddress
 006ED905    mov         esi,eax
 006ED907    mov         dword ptr ds:[822748],esi;gvar_00822748:Pointer
 006ED90D    test        esi,esi
>006ED90F    jne         006ED91B
 006ED911    mov         dword ptr ds:[822748],6ED7A8
 006ED91B    push        6EDA68;'XInputSetState'
 006ED920    mov         eax,dword ptr [edi]
 006ED922    push        eax
 006ED923    call        GetProcAddress
 006ED928    mov         esi,eax
 006ED92A    mov         dword ptr ds:[82274C],esi;gvar_0082274C:Pointer
 006ED930    test        esi,esi
>006ED932    jne         006ED93E
 006ED934    mov         dword ptr ds:[82274C],6ED7BC
 006ED93E    push        6EDA88;'XInputGetCapabilities'
 006ED943    mov         eax,dword ptr [edi]
 006ED945    push        eax
 006ED946    call        GetProcAddress
 006ED94B    mov         esi,eax
 006ED94D    mov         dword ptr ds:[822750],esi;gvar_00822750:Pointer
 006ED953    test        esi,esi
>006ED955    jne         006ED961
 006ED957    mov         dword ptr ds:[822750],6ED7C8
 006ED961    push        6EDAB4;'XInputEnable'
 006ED966    mov         eax,dword ptr [edi]
 006ED968    push        eax
 006ED969    call        GetProcAddress
 006ED96E    mov         esi,eax
 006ED970    mov         dword ptr ds:[822754],esi;gvar_00822754:Pointer
 006ED976    test        esi,esi
>006ED978    jne         006ED984
 006ED97A    mov         dword ptr ds:[822754],6ED7B4
 006ED984    push        6EDAD0;'XInputGetDSoundAudioDeviceGuids'
 006ED989    mov         eax,dword ptr [edi]
 006ED98B    push        eax
 006ED98C    call        GetProcAddress
 006ED991    mov         esi,eax
 006ED993    mov         dword ptr ds:[822758],esi;gvar_00822758:Pointer
 006ED999    test        esi,esi
>006ED99B    jne         006ED9A7
 006ED99D    mov         dword ptr ds:[822758],6ED7E0
 006ED9A7    push        6EDB10;'XInputGetKeystroke'
 006ED9AC    mov         eax,dword ptr [edi]
 006ED9AE    push        eax
 006ED9AF    call        GetProcAddress
 006ED9B4    mov         esi,eax
 006ED9B6    mov         dword ptr ds:[822760],esi;gvar_00822760:Pointer
 006ED9BC    test        esi,esi
>006ED9BE    jne         006ED9CA
 006ED9C0    mov         dword ptr ds:[822760],6ED7D4
 006ED9CA    push        6EDB38;'XInputGetBatteryInformation'
 006ED9CF    mov         eax,dword ptr [edi]
 006ED9D1    push        eax
 006ED9D2    call        GetProcAddress
 006ED9D7    mov         esi,eax
 006ED9D9    mov         dword ptr ds:[82275C],esi;gvar_0082275C:Pointer
 006ED9DF    test        esi,esi
>006ED9E1    jne         006ED9ED
 006ED9E3    mov         dword ptr ds:[82275C],6ED7EC
 006ED9ED    mov         eax,ebx
 006ED9EF    pop         edi
 006ED9F0    pop         esi
 006ED9F1    pop         ebx
 006ED9F2    ret
end;*}

Initialization
//00782C78
{*
 00782C78    sub         dword ptr ds:[822768],1
>00782C7F    jae         00782C86
 00782C81    call        006ED7F8
 00782C86    ret
*}
Finalization
end.