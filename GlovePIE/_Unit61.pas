//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit61;

interface

uses
  SysUtils, Classes;

    //procedure sub_00539760(?:?; ?:?);//00539760
    //procedure sub_0053979C(?:?; ?:?);//0053979C

implementation

//00539760
{*procedure sub_00539760(?:?; ?:?);
begin
 00539760    push        ebx
 00539761    push        ecx
 00539762    mov         ebx,edx
 00539764    push        esp
 00539765    push        eax
 00539766    push        0
 00539768    call        shell32.SHGetSpecialFolderLocation
 0053976D    test        eax,80000000
 00539772    sete        al
 00539775    test        al,al
>00539777    je          0053978F
 00539779    mov         edx,ebx
 0053977B    mov         eax,dword ptr [esp]
 0053977E    call        0053979C
 00539783    mov         eax,dword ptr [esp]
 00539786    push        eax
 00539787    call        ole32.CoTaskMemFree
 0053978C    pop         edx
 0053978D    pop         ebx
 0053978E    ret
 0053978F    mov         eax,ebx
 00539791    call        @UStrClr
 00539796    pop         edx
 00539797    pop         ebx
 00539798    ret
end;*}

//0053979C
{*procedure sub_0053979C(?:?; ?:?);
begin
 0053979C    push        ebx
 0053979D    push        esi
 0053979E    mov         ebx,edx
 005397A0    mov         esi,eax
 005397A2    mov         eax,ebx
 005397A4    mov         edx,104
 005397A9    call        @UStrSetLength
 005397AE    mov         eax,dword ptr [ebx]
 005397B0    call        @UStrToPWChar
 005397B5    push        eax
 005397B6    push        esi
 005397B7    call        shell32.SHGetPathFromIDListW
 005397BC    test        eax,eax
>005397BE    je          005397CA
 005397C0    mov         eax,ebx
 005397C2    call        00539138
 005397C7    pop         esi
 005397C8    pop         ebx
 005397C9    ret
 005397CA    mov         eax,ebx
 005397CC    call        @UStrClr
 005397D1    pop         esi
 005397D2    pop         ebx
 005397D3    ret
end;*}

Initialization
//007810C8
{*
 007810C8    sub         dword ptr ds:[8154AC],1
>007810CF    jae         007810E0
 007810D1    mov         edx,788BE4;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 007810D6    mov         eax,[00790C38];gvar_00790C38
 007810DB    call        0053F424
 007810E0    ret
*}
Finalization
//005397D4
{*
 005397D4    push        ebp
 005397D5    mov         ebp,esp
 005397D7    xor         eax,eax
 005397D9    push        ebp
 005397DA    push        53981F
 005397DF    push        dword ptr fs:[eax]
 005397E2    mov         dword ptr fs:[eax],esp
 005397E5    inc         dword ptr ds:[8154AC]
>005397EB    jne         00539811
 005397ED    mov         eax,[00790C38];gvar_00790C38
 005397F2    call        0053F440
 005397F7    mov         eax,788BE0
 005397FC    call        0053D610
 00539801    mov         eax,788BE4;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00539806    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 0053980C    call        @FinalizeRecord
 00539811    xor         eax,eax
 00539813    pop         edx
 00539814    pop         ecx
 00539815    pop         ecx
 00539816    mov         dword ptr fs:[eax],edx
 00539819    push        539826
 0053981E    ret
>0053981F    jmp         @HandleFinally
>00539824    jmp         0053981E
 00539826    pop         ebp
 00539827    ret
*}
end.