//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit55;

interface

uses
  SysUtils, Classes;

type
  TRootKey = TRootKey = record//size=C
f4:AnsiString;//f4
f8:WideString;//f8
end;
Key:Cardinal;//f0
AnsiName:AnsiString;//f4
WideName:WideString;//f8
end;;

implementation

Initialization
//00781008
{*
 00781008    sub         dword ptr ds:[794F94],1
>0078100F    jae         0078102A
 00781011    mov         eax,5373D4
 00781016    call        @InitWideStrings
 0078101B    mov         edx,788B38;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00781020    mov         eax,[00790C38];gvar_00790C38
 00781025    call        0053F424
 0078102A    ret
*}
Finalization
//00537448
{*
 00537448    push        ebp
 00537449    mov         ebp,esp
 0053744B    xor         eax,eax
 0053744D    push        ebp
 0053744E    push        53749E
 00537453    push        dword ptr fs:[eax]
 00537456    mov         dword ptr fs:[eax],esp
 00537459    inc         dword ptr ds:[794F94]
>0053745F    jne         00537490
 00537461    mov         eax,[00790C38];gvar_00790C38
 00537466    call        0053F440
 0053746B    mov         eax,788A90;gvar_00788A90:array[14] of ?
 00537470    mov         ecx,0E
 00537475    mov         edx,dword ptr ds:[536EB8];TRootKey
 0053747B    call        @FinalizeArray
 00537480    mov         eax,788B38;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00537485    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 0053748B    call        @FinalizeRecord
 00537490    xor         eax,eax
 00537492    pop         edx
 00537493    pop         ecx
 00537494    pop         ecx
 00537495    mov         dword ptr fs:[eax],edx
 00537498    push        5374A5
 0053749D    ret
>0053749E    jmp         @HandleFinally
>005374A3    jmp         0053749D
 005374A5    pop         ebp
 005374A6    ret
*}
end.