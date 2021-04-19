//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit59;

interface

uses
  SysUtils, Classes;

    procedure sub_005387C8;//005387C8
    procedure sub_00538804;//00538804
    //function sub_00538884(?:?):Boolean;//00538884
    //function sub_00538894(?:?):Boolean;//00538894

implementation

//005387C8
procedure sub_005387C8;
begin
{*
 005387C8    push        ebx
 005387C9    push        esi
 005387CA    push        edi
 005387CB    push        ecx
 005387CC    mov         esi,esp
 005387CE    lea         edi,[esp+2]
 005387D2    mov         byte ptr [esi],0
 005387D5    mov         ebx,7952A4;gvar_007952A4
 005387DA    mov         word ptr [edi],0
 005387DF    push        edi
 005387E0    push        1
 005387E2    push        esi
 005387E3    push        1
 005387E5    push        400
 005387EA    call        kernel32.GetStringTypeExA
 005387EF    movzx       eax,word ptr [edi]
 005387F2    mov         word ptr [ebx],ax
 005387F5    inc         byte ptr [esi]
 005387F7    add         ebx,2
 005387FA    cmp         byte ptr [esi],0
>005387FD    jne         005387DA
 005387FF    pop         edx
 00538800    pop         edi
 00538801    pop         esi
 00538802    pop         ebx
 00538803    ret
*}
end;

//00538804
procedure sub_00538804;
begin
{*
 00538804    push        ebx
 00538805    push        esi
 00538806    push        ecx
 00538807    cmp         byte ptr ds:[788BA0],0;gvar_00788BA0
>0053880E    jne         0053887F
 00538810    xor         ebx,ebx
 00538812    mov         esi,794FA4;gvar_00794FA4
 00538817    mov         byte ptr [esp+1],bl
 0053881B    mov         byte ptr [esp],bl
 0053881E    push        1
 00538820    lea         eax,[esp+5]
 00538824    push        eax
 00538825    call        user32.CharLowerBuffA
 0053882A    push        1
 0053882C    lea         eax,[esp+4]
 00538830    push        eax
 00538831    call        user32.CharUpperBuffA
 00538836    mov         eax,ebx
 00538838    call        00538894
 0053883D    test        al,al
>0053883F    je          00538848
 00538841    movzx       eax,byte ptr [esp+1]
>00538846    jmp         0053885B
 00538848    mov         eax,ebx
 0053884A    call        00538884
 0053884F    test        al,al
>00538851    je          00538859
 00538853    movzx       eax,byte ptr [esp]
>00538857    jmp         0053885B
 00538859    mov         eax,ebx
 0053885B    movzx       edx,byte ptr [esp+1]
 00538860    mov         byte ptr [esi],dl
 00538862    movzx       edx,byte ptr [esp]
 00538866    mov         byte ptr [esi+100],dl
 0053886C    mov         byte ptr [esi+200],al
 00538872    inc         ebx
 00538873    inc         esi
 00538874    test        bl,bl
>00538876    jne         00538817
 00538878    mov         byte ptr ds:[788BA0],1;gvar_00788BA0
 0053887F    pop         edx
 00538880    pop         esi
 00538881    pop         ebx
 00538882    ret
*}
end;

//00538884
{*function sub_00538884(?:?):Boolean;
begin
 00538884    movzx       eax,al
 00538887    test        byte ptr [eax*2+7952A4],2;gvar_007952A4
 0053888F    setne       al
 00538892    ret
end;*}

//00538894
{*function sub_00538894(?:?):Boolean;
begin
 00538894    movzx       eax,al
 00538897    test        byte ptr [eax*2+7952A4],1;gvar_007952A4
 0053889F    setne       al
 005388A2    ret
end;*}

Initialization
//00781080
{*
 00781080    sub         dword ptr ds:[7954A4],1
>00781087    jae         007810A2
 00781089    call        005387C8
 0078108E    call        00538804
 00781093    mov         edx,788BA4;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00781098    mov         eax,[00790C38];gvar_00790C38
 0078109D    call        0053F424
 007810A2    ret
*}
Finalization
//005388A4
{*
 005388A4    push        ebp
 005388A5    mov         ebp,esp
 005388A7    xor         eax,eax
 005388A9    push        ebp
 005388AA    push        5388E5
 005388AF    push        dword ptr fs:[eax]
 005388B2    mov         dword ptr fs:[eax],esp
 005388B5    inc         dword ptr ds:[7954A4]
>005388BB    jne         005388D7
 005388BD    mov         eax,[00790C38];gvar_00790C38
 005388C2    call        0053F440
 005388C7    mov         eax,788BA4;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 005388CC    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 005388D2    call        @FinalizeRecord
 005388D7    xor         eax,eax
 005388D9    pop         edx
 005388DA    pop         ecx
 005388DB    pop         ecx
 005388DC    mov         dword ptr fs:[eax],edx
 005388DF    push        5388EC
 005388E4    ret
>005388E5    jmp         @HandleFinally
>005388EA    jmp         005388E4
 005388EC    pop         ebp
 005388ED    ret
*}
end.