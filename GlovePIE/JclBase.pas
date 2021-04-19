//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit JclBase;

interface

uses
  SysUtils, Classes;

type
  EJclError = class(Exception)
  end;
  EJclInternalError = class(EJclError)
  end;
  TUCS4Array = array of Cardinal;
//elSize = 4
//varType equivalent: varInteger;
    //procedure sub_0053F7CC(?:?; ?:?; ?:?; ?:?; ?:?);//0053F7CC
    procedure sub_0053F7FC;//0053F7FC

implementation

//0053F7CC
{*procedure sub_0053F7CC(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 0053F7CC    push        ebp
 0053F7CD    mov         ebp,esp
 0053F7CF    push        ebx
 0053F7D0    push        esi
 0053F7D1    push        edi
 0053F7D2    mov         edi,ecx
 0053F7D4    mov         esi,edx
 0053F7D6    mov         ebx,eax
 0053F7D8    mov         eax,edi
 0053F7DA    call        @UniqueStringU
 0053F7DF    mov         edx,dword ptr [ebp+0C]
 0053F7E2    lea         edx,[eax+edx*2]
 0053F7E5    mov         ecx,dword ptr [ebp+8]
 0053F7E8    add         ecx,ecx
 0053F7EA    lea         eax,[ebx+esi*2]
 0053F7ED    call        Move
 0053F7F2    pop         edi
 0053F7F3    pop         esi
 0053F7F4    pop         ebx
 0053F7F5    pop         ebp
 0053F7F6    ret         8
end;*}

//0053F7FC
procedure sub_0053F7FC;
begin
{*
 0053F7FC    add         esp,0FFFFFFEC
 0053F7FF    xor         eax,eax
 0053F801    mov         dword ptr [esp],eax
 0053F804    push        esp
 0053F805    push        0
 0053F807    call        kernel32.GetCPInfo
 0053F80C    test        eax,eax
>0053F80E    je          0053F81C
 0053F810    movzx       eax,byte ptr [esp+4]
 0053F815    mov         [008154D0],al;gvar_008154D0
>0053F81A    jmp         0053F833
 0053F81C    mov         ecx,dword ptr ds:[78D9DC];^SResString412:TResStringRec
 0053F822    mov         dl,1
 0053F824    mov         eax,[0053F534];EJclInternalError
 0053F829    call        Exception.CreateRes;EJclInternalError.Create
 0053F82E    call        @RaiseExcept
 0053F833    add         esp,14
 0053F836    ret
*}
end;

Initialization
//00781190
{*
 00781190    sub         dword ptr ds:[8154D4],1
>00781197    jae         007811AD
 00781199    call        0053F7FC
 0078119E    mov         edx,788CE8;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 007811A3    mov         eax,[00790C38];gvar_00790C38
 007811A8    call        0053F424
 007811AD    ret
*}
Finalization
//0053F838
{*
 0053F838    push        ebp
 0053F839    mov         ebp,esp
 0053F83B    xor         eax,eax
 0053F83D    push        ebp
 0053F83E    push        53F879
 0053F843    push        dword ptr fs:[eax]
 0053F846    mov         dword ptr fs:[eax],esp
 0053F849    inc         dword ptr ds:[8154D4]
>0053F84F    jne         0053F86B
 0053F851    mov         eax,[00790C38];gvar_00790C38
 0053F856    call        0053F440
 0053F85B    mov         eax,788CE8;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 0053F860    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 0053F866    call        @FinalizeRecord
 0053F86B    xor         eax,eax
 0053F86D    pop         edx
 0053F86E    pop         ecx
 0053F86F    pop         ecx
 0053F870    mov         dword ptr fs:[eax],edx
 0053F873    push        53F880
 0053F878    ret
>0053F879    jmp         @HandleFinally
>0053F87E    jmp         0053F878
 0053F880    pop         ebp
 0053F881    ret
*}
end.