//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit71;

interface

uses
  SysUtils, Classes;

    //procedure sub_0054C650(?:UnicodeString; ?:?);//0054C650
    //procedure sub_0054C6A0(?:UnicodeString; ?:?);//0054C6A0
    //function sub_0054C730(?:?):?;//0054C730
    //function sub_0054C760(?:?):?;//0054C760
    //procedure sub_0054C774(?:PChar; ?:?; ?:?);//0054C774
    //procedure sub_0054C7B4(?:PChar; ?:?; ?:?);//0054C7B4
    //procedure sub_0054C840(?:?; ?:?; ?:?);//0054C840
    //function sub_0054C92C(?:PChar; ?:?; ?:PChar; ?:?; ?:?):?;//0054C92C
    //function sub_0054C9B0(?:?; ?:?; ?:?):?;//0054C9B0

implementation

//0054C650
{*procedure sub_0054C650(?:UnicodeString; ?:?);
begin
 0054C650    push        ebx
 0054C651    push        esi
 0054C652    push        edi
 0054C653    mov         esi,edx
 0054C655    mov         ebx,eax
 0054C657    test        ebx,ebx
>0054C659    je          0054C693
 0054C65B    mov         eax,ebx
 0054C65D    test        eax,eax
>0054C65F    je          0054C666
 0054C661    sub         eax,4
 0054C664    mov         eax,dword ptr [eax]
 0054C666    mov         edi,eax
 0054C668    mov         eax,edi
 0054C66A    call        0054C730
 0054C66F    mov         edx,eax
 0054C671    mov         eax,esi
 0054C673    xor         ecx,ecx
 0054C675    call        @LStrSetLength
 0054C67A    mov         eax,dword ptr [esi]
 0054C67C    call        @LStrToPChar
 0054C681    push        eax
 0054C682    mov         eax,ebx
 0054C684    call        @LStrToPChar
 0054C689    mov         edx,edi
 0054C68B    pop         ecx
 0054C68C    call        0054C774
>0054C691    jmp         0054C69A
 0054C693    mov         eax,esi
 0054C695    call        @LStrClr
 0054C69A    pop         edi
 0054C69B    pop         esi
 0054C69C    pop         ebx
 0054C69D    ret
end;*}

//0054C6A0
{*procedure sub_0054C6A0(?:UnicodeString; ?:?);
begin
 0054C6A0    push        ebx
 0054C6A1    push        esi
 0054C6A2    push        edi
 0054C6A3    push        ebp
 0054C6A4    add         esp,0FFFFFFF8
 0054C6A7    mov         esi,edx
 0054C6A9    mov         edi,eax
 0054C6AB    test        edi,edi
>0054C6AD    je          0054C71F
 0054C6AF    mov         eax,edi
 0054C6B1    test        eax,eax
>0054C6B3    je          0054C6BA
 0054C6B5    sub         eax,4
 0054C6B8    mov         eax,dword ptr [eax]
 0054C6BA    mov         ebx,eax
 0054C6BC    mov         eax,ebx
 0054C6BE    call        0054C760
 0054C6C3    mov         edx,eax
 0054C6C5    mov         eax,esi
 0054C6C7    xor         ecx,ecx
 0054C6C9    call        @LStrSetLength
 0054C6CE    xor         eax,eax
 0054C6D0    mov         dword ptr [esp],eax
 0054C6D3    mov         dword ptr [esp+4],4
 0054C6DB    mov         eax,edi
 0054C6DD    call        @LStrToPChar
 0054C6E2    mov         ebp,eax
 0054C6E4    mov         eax,dword ptr [esi]
 0054C6E6    call        @LStrToPChar
 0054C6EB    mov         edi,eax
 0054C6ED    push        esp
 0054C6EE    lea         eax,[esp+8]
 0054C6F2    push        eax
 0054C6F3    mov         ecx,edi
 0054C6F5    mov         eax,ebp
 0054C6F7    mov         edx,ebx
 0054C6F9    call        0054C92C
 0054C6FE    mov         ebx,eax
 0054C700    add         edi,ebx
 0054C702    mov         eax,edi
 0054C704    mov         ecx,dword ptr [esp+4]
 0054C708    mov         edx,dword ptr [esp]
 0054C70B    call        0054C9B0
 0054C710    add         ebx,eax
 0054C712    mov         eax,esi
 0054C714    xor         ecx,ecx
 0054C716    mov         edx,ebx
 0054C718    call        @LStrSetLength
>0054C71D    jmp         0054C726
 0054C71F    mov         eax,esi
 0054C721    call        @LStrClr
 0054C726    pop         ecx
 0054C727    pop         edx
 0054C728    pop         ebp
 0054C729    pop         edi
 0054C72A    pop         esi
 0054C72B    pop         ebx
 0054C72C    ret
end;*}

//0054C730
{*function sub_0054C730(?:?):?;
begin
 0054C730    push        ebx
 0054C731    mov         ecx,eax
 0054C733    test        ecx,ecx
>0054C735    jle         0054C75B
 0054C737    lea         eax,[ecx+2]
 0054C73A    mov         ebx,3
 0054C73F    cdq
 0054C740    idiv        eax,ebx
 0054C742    mov         ebx,eax
 0054C744    add         ebx,ebx
 0054C746    add         ebx,ebx
 0054C748    mov         eax,ecx
 0054C74A    dec         eax
 0054C74B    mov         ecx,39
 0054C750    cdq
 0054C751    idiv        eax,ecx
 0054C753    add         eax,eax
 0054C755    add         ebx,eax
 0054C757    mov         eax,ebx
 0054C759    pop         ebx
 0054C75A    ret
 0054C75B    mov         eax,ecx
 0054C75D    pop         ebx
 0054C75E    ret
end;*}

//0054C760
{*function sub_0054C760(?:?):?;
begin
 0054C760    add         eax,3
 0054C763    test        eax,eax
>0054C765    jns         0054C76A
 0054C767    add         eax,3
 0054C76A    sar         eax,2
 0054C76D    lea         eax,[eax+eax*2]
 0054C770    ret
end;*}

//0054C774
{*procedure sub_0054C774(?:PChar; ?:?; ?:?);
begin
 0054C774    push        ebx
 0054C775    push        esi
 0054C776    push        ecx
 0054C777    mov         dword ptr [esp],ecx
 0054C77A    mov         ebx,edx
 0054C77C    mov         esi,eax
 0054C77E    mov         ecx,dword ptr [esp]
 0054C781    mov         eax,esi
 0054C783    mov         edx,ebx
 0054C785    call        0054C7B4
 0054C78A    mov         eax,ebx
 0054C78C    mov         ecx,39
 0054C791    cdq
 0054C792    idiv        eax,ecx
 0054C794    imul        ecx,eax,4E
 0054C797    imul        eax,eax,39
 0054C79A    mov         edx,esi
 0054C79C    add         edx,eax
 0054C79E    mov         esi,dword ptr [esp]
 0054C7A1    add         esi,ecx
 0054C7A3    mov         ecx,esi
 0054C7A5    sub         ebx,eax
 0054C7A7    mov         eax,ebx
 0054C7A9    xchg        eax,edx
 0054C7AA    call        0054C840
 0054C7AF    pop         edx
 0054C7B0    pop         esi
 0054C7B1    pop         ebx
 0054C7B2    ret
end;*}

//0054C7B4
{*procedure sub_0054C7B4(?:PChar; ?:?; ?:?);
begin
 0054C7B4    push        ebx
 0054C7B5    push        esi
 0054C7B6    push        edi
 0054C7B7    push        ebp
 0054C7B8    push        ecx
 0054C7B9    mov         dword ptr [esp],edx
 0054C7BC    mov         edi,788D90
 0054C7C1    cmp         dword ptr [esp],39
>0054C7C5    jl          0054C83A
 0054C7C7    mov         esi,eax
 0054C7C9    mov         eax,esi
 0054C7CB    mov         ebp,eax
 0054C7CD    add         ebp,39
 0054C7D0    mov         edx,eax
 0054C7D2    mov         eax,dword ptr [esp]
 0054C7D5    add         edx,eax
 0054C7D7    movzx       eax,byte ptr [esi]
 0054C7DA    shl         eax,8
 0054C7DD    movzx       ebx,byte ptr [esi+1]
 0054C7E1    or          eax,ebx
 0054C7E3    shl         eax,8
 0054C7E6    movzx       ebx,byte ptr [esi+2]
 0054C7EA    or          eax,ebx
 0054C7EC    add         esi,3
 0054C7EF    mov         ebx,eax
 0054C7F1    and         ebx,3F
 0054C7F4    movzx       ebx,byte ptr [edi+ebx]
 0054C7F8    mov         byte ptr [ecx+3],bl
 0054C7FB    shr         eax,6
 0054C7FE    mov         ebx,eax
 0054C800    and         ebx,3F
 0054C803    movzx       ebx,byte ptr [edi+ebx]
 0054C807    mov         byte ptr [ecx+2],bl
 0054C80A    shr         eax,6
 0054C80D    mov         ebx,eax
 0054C80F    and         ebx,3F
 0054C812    movzx       ebx,byte ptr [edi+ebx]
 0054C816    mov         byte ptr [ecx+1],bl
 0054C819    shr         eax,6
 0054C81C    movzx       eax,byte ptr [edi+eax]
 0054C820    mov         byte ptr [ecx],al
 0054C822    add         ecx,4
 0054C825    cmp         ebp,esi
>0054C827    ja          0054C7D7
 0054C829    mov         byte ptr [ecx],0D
 0054C82C    mov         byte ptr [ecx+1],0A
 0054C830    add         ecx,2
 0054C833    add         ebp,39
 0054C836    cmp         edx,ebp
>0054C838    jae         0054C7D7
 0054C83A    pop         edx
 0054C83B    pop         ebp
 0054C83C    pop         edi
 0054C83D    pop         esi
 0054C83E    pop         ebx
 0054C83F    ret
end;*}

//0054C840
{*procedure sub_0054C840(?:?; ?:?; ?:?);
begin
 0054C840    push        ebx
 0054C841    push        esi
 0054C842    push        edi
 0054C843    push        ebp
 0054C844    push        ecx
 0054C845    mov         ebp,edx
 0054C847    mov         edi,788D90
 0054C84C    test        ebp,ebp
>0054C84E    je          0054C926
 0054C854    mov         ebx,eax
 0054C856    mov         eax,ebp
 0054C858    mov         esi,3
 0054C85D    cdq
 0054C85E    idiv        eax,esi
 0054C860    lea         eax,[eax+eax*2]
 0054C863    mov         dword ptr [esp],eax
 0054C866    mov         esi,ebx
 0054C868    add         esi,dword ptr [esp]
>0054C86B    jmp         0054C8BB
 0054C86D    movzx       eax,byte ptr [ebx]
 0054C870    shl         eax,8
 0054C873    movzx       edx,byte ptr [ebx+1]
 0054C877    or          eax,edx
 0054C879    shl         eax,8
 0054C87C    movzx       edx,byte ptr [ebx+2]
 0054C880    or          eax,edx
 0054C882    add         ebx,3
 0054C885    mov         edx,eax
 0054C887    and         edx,3F
 0054C88A    movzx       edx,byte ptr [edi+edx]
 0054C88E    mov         byte ptr [ecx+3],dl
 0054C891    shr         eax,6
 0054C894    mov         edx,eax
 0054C896    and         edx,3F
 0054C899    movzx       edx,byte ptr [edi+edx]
 0054C89D    mov         byte ptr [ecx+2],dl
 0054C8A0    shr         eax,6
 0054C8A3    mov         edx,eax
 0054C8A5    and         edx,3F
 0054C8A8    movzx       edx,byte ptr [edi+edx]
 0054C8AC    mov         byte ptr [ecx+1],dl
 0054C8AF    shr         eax,6
 0054C8B2    movzx       eax,byte ptr [edi+eax]
 0054C8B6    mov         byte ptr [ecx],al
 0054C8B8    add         ecx,4
 0054C8BB    cmp         ebx,esi
>0054C8BD    jb          0054C86D
 0054C8BF    sub         ebp,dword ptr [esp]
 0054C8C2    dec         ebp
>0054C8C3    je          0054C8CA
 0054C8C5    dec         ebp
>0054C8C6    je          0054C8EF
>0054C8C8    jmp         0054C926
 0054C8CA    movzx       eax,byte ptr [ebx]
 0054C8CD    shl         eax,4
 0054C8D0    mov         edx,eax
 0054C8D2    and         edx,3F
 0054C8D5    movzx       edx,byte ptr [edi+edx]
 0054C8D9    mov         byte ptr [ecx+1],dl
 0054C8DC    shr         eax,6
 0054C8DF    movzx       eax,byte ptr [edi+eax]
 0054C8E3    mov         byte ptr [ecx],al
 0054C8E5    mov         byte ptr [ecx+2],3D
 0054C8E9    mov         byte ptr [ecx+3],3D
>0054C8ED    jmp         0054C926
 0054C8EF    movzx       eax,byte ptr [ebx]
 0054C8F2    shl         eax,8
 0054C8F5    movzx       edx,byte ptr [ebx+1]
 0054C8F9    or          eax,edx
 0054C8FB    shl         eax,2
 0054C8FE    mov         edx,eax
 0054C900    and         edx,3F
 0054C903    movzx       edx,byte ptr [edi+edx]
 0054C907    mov         byte ptr [ecx+2],dl
 0054C90A    shr         eax,6
 0054C90D    mov         edx,eax
 0054C90F    and         edx,3F
 0054C912    movzx       edx,byte ptr [edi+edx]
 0054C916    mov         byte ptr [ecx+1],dl
 0054C919    shr         eax,6
 0054C91C    movzx       eax,byte ptr [edi+eax]
 0054C920    mov         byte ptr [ecx],al
 0054C922    mov         byte ptr [ecx+3],3D
 0054C926    pop         edx
 0054C927    pop         ebp
 0054C928    pop         edi
 0054C929    pop         esi
 0054C92A    pop         ebx
 0054C92B    ret
end;*}

//0054C92C
{*function sub_0054C92C(?:PChar; ?:?; ?:PChar; ?:?; ?:?):?;
begin
 0054C92C    push        ebp
 0054C92D    mov         ebp,esp
 0054C92F    add         esp,0FFFFFFF8
 0054C932    push        esi
 0054C933    push        edi
 0054C934    mov         dword ptr [ebp-4],ecx
 0054C937    test        edx,edx
>0054C939    jle         0054C9A5
 0054C93B    mov         edi,eax
 0054C93D    mov         eax,edi
 0054C93F    add         eax,edx
 0054C941    mov         dword ptr [ebp-8],eax
 0054C944    mov         edx,dword ptr [ebp-4]
 0054C947    mov         eax,dword ptr [ebp+0C]
 0054C94A    mov         eax,dword ptr [eax]
 0054C94C    mov         esi,dword ptr [ebp+8]
 0054C94F    mov         esi,dword ptr [esi]
 0054C951    cmp         edi,dword ptr [ebp-8]
>0054C954    je          0054C990
 0054C956    movzx       ecx,byte ptr [edi]
 0054C959    movzx       ecx,byte ptr [ecx+788DD0]
 0054C960    inc         edi
 0054C961    cmp         ecx,0FF
>0054C967    je          0054C98B
 0054C969    shl         eax,6
 0054C96C    or          eax,ecx
 0054C96E    dec         esi
 0054C96F    test        esi,esi
>0054C971    jne         0054C98B
 0054C973    mov         byte ptr [edx+2],al
 0054C976    shr         eax,8
 0054C979    mov         byte ptr [edx+1],al
 0054C97C    shr         eax,8
 0054C97F    mov         byte ptr [edx],al
 0054C981    xor         eax,eax
 0054C983    add         edx,3
 0054C986    mov         esi,4
 0054C98B    cmp         edi,dword ptr [ebp-8]
>0054C98E    jne         0054C956
 0054C990    mov         ecx,dword ptr [ebp+0C]
 0054C993    mov         dword ptr [ecx],eax
 0054C995    mov         eax,dword ptr [ebp+8]
 0054C998    mov         dword ptr [eax],esi
 0054C99A    mov         eax,dword ptr [ebp-4]
 0054C99D    push        eax
 0054C99E    mov         eax,edx
 0054C9A0    pop         edx
 0054C9A1    sub         eax,edx
>0054C9A3    jmp         0054C9A7
 0054C9A5    xor         eax,eax
 0054C9A7    pop         edi
 0054C9A8    pop         esi
 0054C9A9    pop         ecx
 0054C9AA    pop         ecx
 0054C9AB    pop         ebp
 0054C9AC    ret         8
end;*}

//0054C9B0
{*function sub_0054C9B0(?:?; ?:?; ?:?):?;
begin
 0054C9B0    dec         ecx
>0054C9B1    je          0054C9B8
 0054C9B3    dec         ecx
>0054C9B4    je          0054C9C9
>0054C9B6    jmp         0054C9D4
 0054C9B8    shr         edx,2
 0054C9BB    mov         byte ptr [eax+1],dl
 0054C9BE    shr         edx,8
 0054C9C1    mov         byte ptr [eax],dl
 0054C9C3    mov         eax,2
 0054C9C8    ret
 0054C9C9    shr         edx,4
 0054C9CC    mov         byte ptr [eax],dl
 0054C9CE    mov         eax,1
 0054C9D3    ret
 0054C9D4    xor         eax,eax
 0054C9D6    ret
end;*}

Initialization
//007811E4
{*
 007811E4    sub         dword ptr ds:[8154E8],1
>007811EB    jae         007811FC
 007811ED    mov         edx,788D78;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 007811F2    mov         eax,[00790C38];gvar_00790C38
 007811F7    call        0053F424
 007811FC    ret
*}
Finalization
//0054C9D8
{*
 0054C9D8    push        ebp
 0054C9D9    mov         ebp,esp
 0054C9DB    xor         eax,eax
 0054C9DD    push        ebp
 0054C9DE    push        54CA19
 0054C9E3    push        dword ptr fs:[eax]
 0054C9E6    mov         dword ptr fs:[eax],esp
 0054C9E9    inc         dword ptr ds:[8154E8]
>0054C9EF    jne         0054CA0B
 0054C9F1    mov         eax,[00790C38];gvar_00790C38
 0054C9F6    call        0053F440
 0054C9FB    mov         eax,788D78;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 0054CA00    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 0054CA06    call        @FinalizeRecord
 0054CA0B    xor         eax,eax
 0054CA0D    pop         edx
 0054CA0E    pop         ecx
 0054CA0F    pop         ecx
 0054CA10    mov         dword ptr fs:[eax],edx
 0054CA13    push        54CA20
 0054CA18    ret
>0054CA19    jmp         @HandleFinally
>0054CA1E    jmp         0054CA18
 0054CA20    pop         ebp
 0054CA21    ret
*}
end.