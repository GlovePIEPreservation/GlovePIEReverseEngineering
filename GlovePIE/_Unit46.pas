//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit46;

interface

uses
  SysUtils, Classes;

    //procedure sub_00530098(?:?; ?:?);//00530098
    //function sub_0053009C(?:?; ?:?):Boolean;//0053009C

implementation

//00530098
{*procedure sub_00530098(?:?; ?:?);
begin
 00530098    bts         dword ptr [eax],edx
 0053009B    ret
end;*}

//0053009C
{*function sub_0053009C(?:?; ?:?):Boolean;
begin
 0053009C    bt          dword ptr [eax],edx
 0053009F    setb        al
 005300A2    ret
end;*}

Initialization
//00780ED0
{*
 00780ED0    sub         dword ptr ds:[793B50],1
>00780ED7    jae         00780EE8
 00780ED9    mov         edx,7870EC;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00780EDE    mov         eax,[00790C38];gvar_00790C38
 00780EE3    call        0053F424
 00780EE8    ret
*}
Finalization
//005300A4
{*
 005300A4    push        ebp
 005300A5    mov         ebp,esp
 005300A7    xor         eax,eax
 005300A9    push        ebp
 005300AA    push        5300E5
 005300AF    push        dword ptr fs:[eax]
 005300B2    mov         dword ptr fs:[eax],esp
 005300B5    inc         dword ptr ds:[793B50]
>005300BB    jne         005300D7
 005300BD    mov         eax,[00790C38];gvar_00790C38
 005300C2    call        0053F440
 005300C7    mov         eax,7870EC;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 005300CC    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 005300D2    call        @FinalizeRecord
 005300D7    xor         eax,eax
 005300D9    pop         edx
 005300DA    pop         ecx
 005300DB    pop         ecx
 005300DC    mov         dword ptr fs:[eax],edx
 005300DF    push        5300EC
 005300E4    ret
>005300E5    jmp         @HandleFinally
>005300EA    jmp         005300E4
 005300EC    pop         ebp
 005300ED    ret
*}
end.