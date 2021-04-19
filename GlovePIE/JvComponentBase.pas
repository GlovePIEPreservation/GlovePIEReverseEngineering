//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit JvComponentBase;

interface

uses
  SysUtils, Classes;

type
  TJVCLAboutInfo = (JVCLAbout);
  TJvComponent = class(TComponent)
  public
    FAboutJVCL:TJVCLAboutInfo;//f34
  end;

implementation

Initialization
//00780E40
{*
 00780E40    sub         dword ptr ds:[793B34],1
>00780E47    jae         00780E58
 00780E49    mov         edx,78708C;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00780E4E    mov         eax,[00790C38];gvar_00790C38
 00780E53    call        0053F424
 00780E58    ret
*}
Finalization
//0052DE84
{*
 0052DE84    push        ebp
 0052DE85    mov         ebp,esp
 0052DE87    xor         eax,eax
 0052DE89    push        ebp
 0052DE8A    push        52DEC5
 0052DE8F    push        dword ptr fs:[eax]
 0052DE92    mov         dword ptr fs:[eax],esp
 0052DE95    inc         dword ptr ds:[793B34]
>0052DE9B    jne         0052DEB7
 0052DE9D    mov         eax,[00790C38];gvar_00790C38
 0052DEA2    call        0053F440
 0052DEA7    mov         eax,78708C;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 0052DEAC    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 0052DEB2    call        @FinalizeRecord
 0052DEB7    xor         eax,eax
 0052DEB9    pop         edx
 0052DEBA    pop         ecx
 0052DEBB    pop         ecx
 0052DEBC    mov         dword ptr fs:[eax],edx
 0052DEBF    push        52DECC
 0052DEC4    ret
>0052DEC5    jmp         @HandleFinally
>0052DECA    jmp         0052DEC4
 0052DECC    pop         ebp
 0052DECD    ret
*}
end.