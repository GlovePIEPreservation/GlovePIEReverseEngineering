//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit52;

interface

uses
  SysUtils, Classes;

    //procedure sub_005334BC(?:?);//005334BC
    //procedure sub_005334F8(?:?);//005334F8
    //procedure sub_00533544(?:?);//00533544
    //function sub_00533558:?;//00533558
    //function sub_005337A0(?:?):?;//005337A0
    procedure sub_00533828;//00533828
    procedure sub_0053384C;//0053384C
    procedure sub_00533A54;//00533A54

implementation

//005334BC
{*procedure sub_005334BC(?:?);
begin
 005334BC    push        ebx
 005334BD    push        esi
 005334BE    mov         esi,eax
 005334C0    mov         eax,esi
 005334C2    call        @UStrClr
 005334C7    push        0
 005334C9    push        0
 005334CB    call        kernel32.GetWindowsDirectoryW
 005334D0    mov         ebx,eax
 005334D2    test        ebx,ebx
>005334D4    je          005334F4
 005334D6    mov         eax,esi
 005334D8    mov         edx,ebx
 005334DA    call        @UStrSetLength
 005334DF    push        ebx
 005334E0    mov         eax,dword ptr [esi]
 005334E2    call        @UStrToPWChar
 005334E7    push        eax
 005334E8    call        kernel32.GetWindowsDirectoryW
 005334ED    mov         eax,esi
 005334EF    call        00539138
 005334F4    pop         esi
 005334F5    pop         ebx
 005334F6    ret
end;*}

//005334F8
{*procedure sub_005334F8(?:?);
begin
 005334F8    push        ebp
 005334F9    mov         ebp,esp
 005334FB    push        0
 005334FD    push        ebx
 005334FE    mov         ebx,eax
 00533500    xor         eax,eax
 00533502    push        ebp
 00533503    push        533536
 00533508    push        dword ptr fs:[eax]
 0053350B    mov         dword ptr fs:[eax],esp
 0053350E    lea         eax,[ebp-4]
 00533511    call        0053AC18
 00533516    mov         eax,dword ptr [ebp-4]
 00533519    mov         edx,ebx
 0053351B    call        0053AF78
 00533520    xor         eax,eax
 00533522    pop         edx
 00533523    pop         ecx
 00533524    pop         ecx
 00533525    mov         dword ptr fs:[eax],edx
 00533528    push        53353D
 0053352D    lea         eax,[ebp-4]
 00533530    call        @UStrClr
 00533535    ret
>00533536    jmp         @HandleFinally
>0053353B    jmp         0053352D
 0053353D    pop         ebx
 0053353E    pop         ecx
 0053353F    pop         ebp
 00533540    ret
end;*}

//00533544
{*procedure sub_00533544(?:?);
begin
 00533544    push        ebx
 00533545    mov         ebx,eax
 00533547    mov         edx,ebx
 00533549    mov         eax,1A
 0053354E    call        00539760
 00533553    pop         ebx
 00533554    ret
end;*}

//00533558
{*function sub_00533558:?;
begin
 00533558    push        ebp
 00533559    mov         ebp,esp
 0053355B    add         esp,0FFFFFEBC
 00533561    push        ebx
 00533562    xor         eax,eax
 00533564    mov         dword ptr [ebp-4],eax
 00533567    xor         eax,eax
 00533569    push        ebp
 0053356A    push        53375F
 0053356F    push        dword ptr fs:[eax]
 00533572    mov         dword ptr fs:[eax],esp
 00533575    xor         ebx,ebx
 00533577    lea         edx,[ebp-4]
 0053357A    mov         eax,[0078D00C];^gvar_00784C8C
 0053357F    mov         eax,dword ptr [eax]
 00533581    call        Trim
 00533586    mov         eax,[0078DB58];^gvar_00784C7C
 0053358B    mov         eax,dword ptr [eax]
 0053358D    dec         eax
>0053358E    je          0053359C
 00533590    dec         eax
>00533591    je          00533626
>00533597    jmp         00533749
 0053359C    mov         eax,[0078D6F0];^gvar_00784C84
 005335A1    mov         eax,dword ptr [eax]
 005335A3    sub         eax,0A
>005335A6    jb          005335B4
 005335A8    sub         eax,50
>005335AB    jb          005335E0
>005335AD    je          0053361F
>005335AF    jmp         00533749
 005335B4    mov         eax,dword ptr [ebp-4]
 005335B7    mov         edx,53377C;'B'
 005335BC    call        @UStrEqual
>005335C1    je          005335D2
 005335C3    mov         eax,dword ptr [ebp-4]
 005335C6    mov         edx,53378C;'C'
 005335CB    call        @UStrEqual
>005335D0    jne         005335D9
 005335D2    mov         bl,2
>005335D4    jmp         00533749
 005335D9    mov         bl,1
>005335DB    jmp         00533749
 005335E0    cmp         dword ptr ds:[793B6C],4005A;gvar_00793B6C
>005335EA    jne         005335F3
 005335EC    mov         bl,5
>005335EE    jmp         00533749
 005335F3    mov         eax,dword ptr [ebp-4]
 005335F6    mov         edx,53379C;'A'
 005335FB    call        @UStrEqual
>00533600    je          00533611
 00533602    mov         eax,dword ptr [ebp-4]
 00533605    mov         edx,53377C;'B'
 0053360A    call        @UStrEqual
>0053360F    jne         00533618
 00533611    mov         bl,4
>00533613    jmp         00533749
 00533618    mov         bl,3
>0053361A    jmp         00533749
 0053361F    mov         bl,5
>00533621    jmp         00533749
 00533626    mov         eax,[0078D080];^gvar_00784C80
 0053362B    mov         eax,dword ptr [eax]
 0053362D    sub         eax,3
>00533630    je          00533644
 00533632    dec         eax
>00533633    je          00533672
 00533635    dec         eax
>00533636    je          00533679
 00533638    dec         eax
>00533639    je          005336EB
>0053363F    jmp         00533749
 00533644    mov         eax,[0078D6F0];^gvar_00784C84
 00533649    mov         eax,dword ptr [eax]
 0053364B    dec         eax
>0053364C    je          0053365D
 0053364E    sub         eax,4
>00533651    je          00533664
 00533653    sub         eax,2E
>00533656    je          0053366B
>00533658    jmp         00533749
 0053365D    mov         bl,6
>0053365F    jmp         00533749
 00533664    mov         bl,7
>00533666    jmp         00533749
 0053366B    mov         bl,8
>0053366D    jmp         00533749
 00533672    mov         bl,9
>00533674    jmp         00533749
 00533679    mov         eax,[0078D6F0];^gvar_00784C84
 0053367E    mov         eax,dword ptr [eax]
 00533680    sub         eax,1
>00533683    jb          0053368F
>00533685    je          00533696
 00533687    dec         eax
>00533688    je          0053369D
>0053368A    jmp         00533749
 0053368F    mov         bl,0A
>00533691    jmp         00533749
 00533696    mov         bl,0B
>00533698    jmp         00533749
 0053369D    mov         dword ptr [ebp-144],11C
 005336A7    xor         eax,eax
 005336A9    mov         dword ptr [ebp-28],eax
 005336AC    lea         eax,[ebp-28]
 005336AF    call        005337A0
 005336B4    push        59
 005336B6    call        user32.GetSystemMetrics
 005336BB    test        eax,eax
>005336BD    je          005336C6
 005336BF    mov         bl,0E
>005336C1    jmp         00533749
 005336C6    cmp         word ptr [ebp-28],0
>005336CB    je          005336E7
 005336CD    lea         eax,[ebp-144]
 005336D3    push        eax
 005336D4    call        kernel32.GetVersionExW
 005336D9    test        eax,eax
>005336DB    je          005336E7
 005336DD    cmp         byte ptr [ebp-2A],1
>005336E1    jne         005336E7
 005336E3    mov         bl,0D
>005336E5    jmp         00533749
 005336E7    mov         bl,0C
>005336E9    jmp         00533749
 005336EB    mov         eax,[0078D6F0];^gvar_00784C84
 005336F0    mov         eax,dword ptr [eax]
 005336F2    sub         eax,1
>005336F5    jb          005336FB
>005336F7    je          00533723
>005336F9    jmp         00533749
 005336FB    mov         dword ptr [ebp-144],11C
 00533705    lea         eax,[ebp-144]
 0053370B    push        eax
 0053370C    call        kernel32.GetVersionExW
 00533711    test        eax,eax
>00533713    je          0053371F
 00533715    cmp         byte ptr [ebp-2A],1
>00533719    jne         0053371F
 0053371B    mov         bl,0F
>0053371D    jmp         00533749
 0053371F    mov         bl,10
>00533721    jmp         00533749
 00533723    mov         dword ptr [ebp-144],11C
 0053372D    lea         eax,[ebp-144]
 00533733    push        eax
 00533734    call        kernel32.GetVersionExW
 00533739    test        eax,eax
>0053373B    je          00533747
 0053373D    cmp         byte ptr [ebp-2A],1
>00533741    jne         00533747
 00533743    mov         bl,11
>00533745    jmp         00533749
 00533747    mov         bl,12
 00533749    xor         eax,eax
 0053374B    pop         edx
 0053374C    pop         ecx
 0053374D    pop         ecx
 0053374E    mov         dword ptr fs:[eax],edx
 00533751    push        533766
 00533756    lea         eax,[ebp-4]
 00533759    call        @UStrClr
 0053375E    ret
>0053375F    jmp         @HandleFinally
>00533764    jmp         00533756
 00533766    mov         eax,ebx
 00533768    pop         ebx
 00533769    mov         esp,ebp
 0053376B    pop         ebp
 0053376C    ret
end;*}

//005337A0
{*function sub_005337A0(?:?):?;
begin
 005337A0    push        ebx
 005337A1    push        esi
 005337A2    push        edi
 005337A3    mov         edi,eax
 005337A5    xor         ebx,ebx
 005337A7    push        5337E4;'kernel32.dll'
 005337AC    call        kernel32.GetModuleHandleW
 005337B1    mov         esi,eax
 005337B3    test        esi,esi
>005337B5    je          005337D5
 005337B7    push        533800;'GetNativeSystemInfo'
 005337BC    push        esi
 005337BD    call        GetProcAddress
 005337C2    test        eax,eax
>005337C4    je          005337CD
 005337C6    push        edi
 005337C7    call        eax
 005337C9    mov         bl,1
>005337CB    jmp         005337DB
 005337CD    push        edi
 005337CE    call        kernel32.GetSystemInfo
>005337D3    jmp         005337DB
 005337D5    push        edi
 005337D6    call        kernel32.GetSystemInfo
 005337DB    mov         eax,ebx
 005337DD    pop         edi
 005337DE    pop         esi
 005337DF    pop         ebx
 005337E0    ret
end;*}

//00533828
procedure sub_00533828;
begin
{*
 00533828    cmp         dword ptr ds:[793B70],0;gvar_00793B70
>0053382F    je          0053384A
 00533831    mov         eax,[00793B70];gvar_00793B70
 00533836    push        eax
 00533837    call        kernel32.FreeLibrary
 0053383C    xor         eax,eax
 0053383E    mov         [00793B70],eax;gvar_00793B70
 00533843    xor         eax,eax
 00533845    mov         [00793B74],eax;gvar_00793B74
 0053384A    ret
*}
end;

//0053384C
procedure sub_0053384C;
begin
{*
 0053384C    push        ebp
 0053384D    mov         ebp,esp
 0053384F    add         esp,0FFFFFFA4
 00533852    xor         eax,eax
 00533854    mov         dword ptr [ebp-4],eax
 00533857    xor         eax,eax
 00533859    push        ebp
 0053385A    push        533A2C
 0053385F    push        dword ptr fs:[eax]
 00533862    mov         dword ptr fs:[eax],esp
 00533865    lea         eax,[ebp-28]
 00533868    mov         edx,24
 0053386D    call        0053D1EC
 00533872    lea         eax,[ebp-28]
 00533875    push        eax
 00533876    call        kernel32.GetSystemInfo
 0053387B    mov         eax,dword ptr [ebp-14]
 0053387E    mov         [007882F8],eax;gvar_007882F8
 00533883    mov         eax,dword ptr [ebp-0C]
 00533886    mov         [007882FC],eax;gvar_007882FC
 0053388B    mov         eax,dword ptr [ebp-24]
 0053388E    mov         [00788300],eax;gvar_00788300
 00533893    mov         eax,[0078DB58];^gvar_00784C7C
 00533898    cmp         dword ptr [eax],2
 0053389B    sete        byte ptr ds:[787AF1];gvar_00787AF1
 005338A2    push        533A38;'kernel32.dll'
 005338A7    call        kernel32.GetModuleHandleW
 005338AC    lea         edx,[ebp-4]
 005338AF    call        0053AFF4
 005338B4    xor         eax,eax
 005338B6    mov         dword ptr [ebp-2C],eax
 005338B9    cmp         byte ptr ds:[787AF1],0;gvar_00787AF1
>005338C0    jne         005338DB
 005338C2    lea         edx,[ebp-5C]
 005338C5    mov         eax,dword ptr [ebp-4]
 005338C8    call        0053B618
 005338CD    test        al,al
>005338CF    je          005338DB
 005338D1    mov         eax,dword ptr [ebp-4C]
 005338D4    mov         [00793B6C],eax;gvar_00793B6C
>005338D9    jmp         005338E2
 005338DB    xor         eax,eax
 005338DD    mov         [00793B6C],eax;gvar_00793B6C
 005338E2    call        00533558
 005338E7    and         eax,7F
 005338EA    cmp         eax,12
>005338ED    ja          00533A16
 005338F3    jmp         dword ptr [eax*4+5338FA]
 005338F3    dd          00533A16
 005338F3    dd          0053394B
 005338F3    dd          00533957
 005338F3    dd          00533963
 005338F3    dd          0053396F
 005338F3    dd          0053397B
 005338F3    dd          00533987
 005338F3    dd          00533997
 005338F3    dd          005339A7
 005338F3    dd          005339BE
 005338F3    dd          005339C7
 005338F3    dd          005339D0
 005338F3    dd          005339D9
 005338F3    dd          005339E2
 005338F3    dd          005339EB
 005338F3    dd          005339F4
 005338F3    dd          005339FD
 005338F3    dd          00533A06
 005338F3    dd          00533A0F
>00533946    jmp         00533A16
 0053394B    mov         byte ptr ds:[787AEC],1;gvar_00787AEC
>00533952    jmp         00533A16
 00533957    mov         byte ptr ds:[787AED],1;gvar_00787AED
>0053395E    jmp         00533A16
 00533963    mov         byte ptr ds:[787AEE],1;gvar_00787AEE
>0053396A    jmp         00533A16
 0053396F    mov         byte ptr ds:[787AEF],1;gvar_00787AEF
>00533976    jmp         00533A16
 0053397B    mov         byte ptr ds:[787AF0],1;gvar_00787AF0
>00533982    jmp         00533A16
 00533987    mov         byte ptr ds:[787AF2],1;gvar_00787AF2
 0053398E    mov         byte ptr ds:[787AF3],1;gvar_00787AF3
>00533995    jmp         00533A16
 00533997    mov         byte ptr ds:[787AF2],1;gvar_00787AF2
 0053399E    mov         byte ptr ds:[787AF4],1;gvar_00787AF4
>005339A5    jmp         00533A16
 005339A7    mov         byte ptr ds:[787AF2],1;gvar_00787AF2
 005339AE    mov         byte ptr ds:[787AF4],1;gvar_00787AF4
 005339B5    mov         byte ptr ds:[787AF5],1;gvar_00787AF5
>005339BC    jmp         00533A16
 005339BE    mov         byte ptr ds:[787AF6],1;gvar_00787AF6
>005339C5    jmp         00533A16
 005339C7    mov         byte ptr ds:[787AF7],1;gvar_00787AF7
>005339CE    jmp         00533A16
 005339D0    mov         byte ptr ds:[787AF8],1;gvar_00787AF8
>005339D7    jmp         00533A16
 005339D9    mov         byte ptr ds:[787AF9],1;gvar_00787AF9
>005339E0    jmp         00533A16
 005339E2    mov         byte ptr ds:[787AFA],1;gvar_00787AFA
>005339E9    jmp         00533A16
 005339EB    mov         byte ptr ds:[787AFB],1;gvar_00787AFB
>005339F2    jmp         00533A16
 005339F4    mov         byte ptr ds:[787AFC],1;gvar_00787AFC
>005339FB    jmp         00533A16
 005339FD    mov         byte ptr ds:[787AFD],1;gvar_00787AFD
>00533A04    jmp         00533A16
 00533A06    mov         byte ptr ds:[787AFE],1;gvar_00787AFE
>00533A0D    jmp         00533A16
 00533A0F    mov         byte ptr ds:[787AFF],1;gvar_00787AFF
 00533A16    xor         eax,eax
 00533A18    pop         edx
 00533A19    pop         ecx
 00533A1A    pop         ecx
 00533A1B    mov         dword ptr fs:[eax],edx
 00533A1E    push        533A33
 00533A23    lea         eax,[ebp-4]
 00533A26    call        @UStrClr
 00533A2B    ret
>00533A2C    jmp         @HandleFinally
>00533A31    jmp         00533A23
 00533A33    mov         esp,ebp
 00533A35    pop         ebp
 00533A36    ret
*}
end;

//00533A54
procedure sub_00533A54;
begin
{*
 00533A54    call        00533828
 00533A59    ret
*}
end;

Initialization
//00780F7C
{*
 00780F7C    sub         dword ptr ds:[793B68],1
>00780F83    jae         00780FA3
 00780F85    mov         eax,533A5C
 00780F8A    call        @InitImports
 00780F8F    call        0053384C
 00780F94    mov         edx,788304;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00780F99    mov         eax,[00790C38];gvar_00790C38
 00780F9E    call        0053F424
 00780FA3    ret
*}
Finalization
//00533F28
{*
 00533F28    push        ebp
 00533F29    mov         ebp,esp
 00533F2B    xor         eax,eax
 00533F2D    push        ebp
 00533F2E    push        533F6E
 00533F33    push        dword ptr fs:[eax]
 00533F36    mov         dword ptr fs:[eax],esp
 00533F39    inc         dword ptr ds:[793B68]
>00533F3F    jne         00533F60
 00533F41    mov         eax,[00790C38];gvar_00790C38
 00533F46    call        0053F440
 00533F4B    call        00533A54
 00533F50    mov         eax,788304;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00533F55    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 00533F5B    call        @FinalizeRecord
 00533F60    xor         eax,eax
 00533F62    pop         edx
 00533F63    pop         ecx
 00533F64    pop         ecx
 00533F65    mov         dword ptr fs:[eax],edx
 00533F68    push        533F75
 00533F6D    ret
>00533F6E    jmp         @HandleFinally
>00533F73    jmp         00533F6D
 00533F75    pop         ebp
 00533F76    ret
*}
end.