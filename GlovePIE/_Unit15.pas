//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit15;

interface

uses
  SysUtils, Classes;

    //function sub_00456F4C(?:UnicodeString; ?:?; ?:?):?;//00456F4C
    //function sub_00456FE8(?:?; ?:?):?;//00456FE8
    //function sub_00457018(?:?):?;//00457018
    //function sub_00457030(?:?; ?:?):?;//00457030
    //function sub_00457060(?:Word; ?:Word):?;//00457060
    //function sub_00457098:?;//00457098
    //function sub_004570B4:?;//004570B4
    //function sub_004570D0(?:?; ?:?):?;//004570D0
    //function sub_004570F4(?:?; ?:?):?;//004570F4
    //function sub_00457118(?:?; ?:?):?;//00457118
    //procedure sub_00457140(?:?; ?:?);//00457140
    procedure sub_0045716C;//0045716C
    //function sub_00457188(?:?; ?:?):?;//00457188
    //function sub_004571B0(?:?; ?:?):?;//004571B0
    //function sub_004571E0(?:?; ?:?):?;//004571E0
    //function sub_00457210(?:?; ?:?):?;//00457210
    //function sub_0045723C(?:?; ?:?):?;//0045723C
    //function sub_0045726C(?:?; ?:?):?;//0045726C
    //function sub_004572C0(?:?; ?:?; ?:?; ?:?):?;//004572C0
    //function sub_00457300(?:?; ?:?; ?:?; ?:?):?;//00457300
    //function sub_004573A0(?:?; ?:?):?;//004573A0
    //function sub_004573D4(?:?; ?:?; ?:?; ?:?):?;//004573D4
    //function sub_004573F8(?:?; ?:?; ?:?; ?:?):?;//004573F8
    //function sub_00457428(?:?; ?:?; ?:?; ?:?):?;//00457428
    //function sub_00457458(?:?; ?:?; ?:?; ?:?):?;//00457458
    //function sub_00457488(?:?; ?:?; ?:?; ?:?):?;//00457488
    //function sub_004574BC(?:?; ?:?; ?:?):?;//004574BC
    //function sub_0045750C(?:?; ?:?):?;//0045750C
    //function sub_00457538(?:?; ?:?; ?:?):?;//00457538
    //procedure sub_0045757C(?:?; ?:?);//0045757C

implementation

//00456F4C
{*function sub_00456F4C(?:UnicodeString; ?:?; ?:?):?;
begin
 00456F4C    test        eax,eax
>00456F4E    jne         00456F5A
 00456F50    test        edx,edx
>00456F52    je          00456F59
 00456F54    mov         eax,dword ptr [edx-4]
 00456F57    neg         eax
 00456F59    ret
 00456F5A    test        edx,edx
>00456F5C    jne         00456F62
 00456F5E    mov         eax,dword ptr [eax-4]
 00456F61    ret
 00456F62    push        ebx
 00456F63    push        ebp
 00456F64    push        esi
 00456F65    mov         ebp,dword ptr [eax-4]
 00456F68    mov         ebx,dword ptr [edx-4]
 00456F6B    sub         ebp,ebx
 00456F6D    sbb         ecx,ecx
 00456F6F    and         ecx,ebp
 00456F71    add         ecx,ebx
 00456F73    lea         esi,[ecx+eax]
 00456F76    add         edx,ecx
 00456F78    neg         ecx
>00456F7A    je          00456FDF
 00456F7C    movzx       eax,word ptr [ecx+esi]
 00456F80    movzx       ebx,word ptr [ecx+edx]
 00456F84    cmp         eax,ebx
>00456F86    je          00456FDA
 00456F88    cmp         al,bl
>00456F8A    je          00456FB8
 00456F8C    mov         ah,0
 00456F8E    mov         bh,0
 00456F90    cmp         al,61
>00456F92    jl          00456F9B
 00456F94    cmp         al,7A
>00456F96    jg          00456F9B
 00456F98    sub         eax,20
 00456F9B    cmp         bl,61
>00456F9E    jl          00456FA8
 00456FA0    cmp         bl,7A
>00456FA3    jg          00456FA8
 00456FA5    sub         ebx,20
 00456FA8    sub         eax,ebx
>00456FAA    jne         00456FE1
 00456FAC    movzx       eax,word ptr [ecx+esi]
 00456FB0    movzx       ebx,word ptr [ecx+edx]
 00456FB4    cmp         ah,bh
>00456FB6    je          00456FDA
 00456FB8    shr         eax,8
 00456FBB    shr         ebx,8
 00456FBE    cmp         al,61
>00456FC0    jl          00456FC9
 00456FC2    cmp         al,7A
>00456FC4    jg          00456FC9
 00456FC6    sub         eax,20
 00456FC9    cmp         bl,61
>00456FCC    jl          00456FD6
 00456FCE    cmp         bl,7A
>00456FD1    jg          00456FD6
 00456FD3    sub         ebx,20
 00456FD6    sub         eax,ebx
>00456FD8    jne         00456FE1
 00456FDA    add         ecx,2
>00456FDD    jl          00456F7C
 00456FDF    mov         eax,ebp
 00456FE1    pop         esi
 00456FE2    pop         ebp
 00456FE3    pop         ebx
 00456FE4    ret
end;*}

//00456FE8
{*function sub_00456FE8(?:?; ?:?):?;
begin
 00456FE8    push        ebx
 00456FE9    push        esi
 00456FEA    mov         esi,edx
 00456FEC    mov         ebx,eax
 00456FEE    cmp         bx,1
>00456FF2    jb          0045700D
 00456FF4    cmp         bx,270F
>00456FF9    ja          0045700D
 00456FFB    cmp         si,1
>00456FFF    jb          0045700D
 00457001    mov         eax,ebx
 00457003    call        00457018
 00457008    cmp         si,ax
>0045700B    jbe         00457012
 0045700D    xor         eax,eax
 0045700F    pop         esi
 00457010    pop         ebx
 00457011    ret
 00457012    mov         al,1
 00457014    pop         esi
 00457015    pop         ebx
 00457016    ret
end;*}

//00457018
{*function sub_00457018(?:?):?;
begin
 00457018    push        ebx
 00457019    mov         ebx,eax
 0045701B    mov         eax,ebx
 0045701D    call        IsLeapYear
 00457022    and         eax,7F
 00457025    movzx       eax,word ptr [eax*2+785570];gvar_00785570
 0045702D    pop         ebx
 0045702E    ret
end;*}

//00457030
{*function sub_00457030(?:?; ?:?):?;
begin
 00457030    push        ebp
 00457031    mov         ebp,esp
 00457033    add         esp,0FFFFFFF8
 00457036    push        dword ptr [ebp+0C]
 00457039    push        dword ptr [ebp+8]
 0045703C    lea         ecx,[ebp-6]
 0045703F    lea         edx,[ebp-4]
 00457042    lea         eax,[ebp-2]
 00457045    call        DecodeDate
 0045704A    movzx       edx,word ptr [ebp-4]
 0045704E    movzx       eax,word ptr [ebp-2]
 00457052    call        00457060
 00457057    pop         ecx
 00457058    pop         ecx
 00457059    pop         ebp
 0045705A    ret         8
end;*}

//00457060
{*function sub_00457060(?:Word; ?:Word):?;
begin
 00457060    push        ebx
 00457061    push        esi
 00457062    mov         ebx,edx
 00457064    mov         esi,eax
 00457066    cmp         bx,2
>0045706A    jne         00457077
 0045706C    mov         eax,esi
 0045706E    call        IsLeapYear
 00457073    test        al,al
>00457075    jne         0045707B
 00457077    xor         eax,eax
>00457079    jmp         0045707D
 0045707B    mov         al,1
 0045707D    and         eax,7F
 00457080    lea         eax,[eax+eax*2]
 00457083    mov         edx,dword ptr ds:[78D3DC];^gvar_00784C90
 00457089    lea         eax,[edx+eax*8]
 0045708C    movzx       edx,bx
 0045708F    movzx       eax,word ptr [eax+edx*2-2]
 00457094    pop         esi
 00457095    pop         ebx
 00457096    ret
end;*}

//00457098
{*function sub_00457098:?;
begin
 00457098    add         esp,0FFFFFFF8
 0045709B    call        Date
 004570A0    fsub        dword ptr ds:[4570B0];1:Single
 004570A6    fstp        qword ptr [esp]
 004570A9    wait
 004570AA    fld         qword ptr [esp]
 004570AD    pop         ecx
 004570AE    pop         edx
 004570AF    ret
end;*}

//004570B4
{*function sub_004570B4:?;
begin
 004570B4    add         esp,0FFFFFFF8
 004570B7    call        Date
 004570BC    fadd        dword ptr ds:[4570CC];1:Single
 004570C2    fstp        qword ptr [esp]
 004570C5    wait
 004570C6    fld         qword ptr [esp]
 004570C9    pop         ecx
 004570CA    pop         edx
 004570CB    ret
end;*}

//004570D0
{*function sub_004570D0(?:?; ?:?):?;
begin
 004570D0    push        ebp
 004570D1    mov         ebp,esp
 004570D3    add         esp,0FFFFFFF8
 004570D6    push        dword ptr [ebp+0C]
 004570D9    push        dword ptr [ebp+8]
 004570DC    lea         ecx,[ebp-6]
 004570DF    lea         edx,[ebp-4]
 004570E2    lea         eax,[ebp-2]
 004570E5    call        DecodeDate
 004570EA    movzx       eax,word ptr [ebp-2]
 004570EE    pop         ecx
 004570EF    pop         ecx
 004570F0    pop         ebp
 004570F1    ret         8
end;*}

//004570F4
{*function sub_004570F4(?:?; ?:?):?;
begin
 004570F4    push        ebp
 004570F5    mov         ebp,esp
 004570F7    add         esp,0FFFFFFF8
 004570FA    push        dword ptr [ebp+0C]
 004570FD    push        dword ptr [ebp+8]
 00457100    lea         ecx,[ebp-2]
 00457103    lea         edx,[ebp-6]
 00457106    lea         eax,[ebp-4]
 00457109    call        DecodeDate
 0045710E    movzx       eax,word ptr [ebp-2]
 00457112    pop         ecx
 00457113    pop         ecx
 00457114    pop         ebp
 00457115    ret         8
end;*}

//00457118
{*function sub_00457118(?:?; ?:?):?;
begin
 00457118    push        ebp
 00457119    mov         ebp,esp
 0045711B    add         esp,0FFFFFFF8
 0045711E    push        dword ptr [ebp+0C]
 00457121    push        dword ptr [ebp+8]
 00457124    lea         eax,[ebp-8]
 00457127    push        eax
 00457128    lea         ecx,[ebp-6]
 0045712B    lea         edx,[ebp-4]
 0045712E    lea         eax,[ebp-2]
 00457131    call        DecodeTime
 00457136    movzx       eax,word ptr [ebp-2]
 0045713A    pop         ecx
 0045713B    pop         ecx
 0045713C    pop         ebp
 0045713D    ret         8
end;*}

//00457140
{*procedure sub_00457140(?:?; ?:?);
begin
 00457140    push        ebp
 00457141    mov         ebp,esp
 00457143    add         esp,0FFFFFFF8
 00457146    push        dword ptr [ebp+0C]
 00457149    push        dword ptr [ebp+8]
 0045714C    call        004570D0
 00457151    mov         cx,1
 00457155    mov         dx,1
 00457159    call        EncodeDate
 0045715E    fstp        qword ptr [ebp-8]
 00457161    wait
 00457162    fld         qword ptr [ebp-8]
 00457165    pop         ecx
 00457166    pop         ecx
 00457167    pop         ebp
 00457168    ret         8
end;*}

//0045716C
procedure sub_0045716C;
begin
{*
 0045716C    add         esp,0FFFFFFF8
 0045716F    mov         cx,1
 00457173    mov         dx,1
 00457177    call        EncodeDate
 0045717C    fstp        qword ptr [esp]
 0045717F    wait
 00457180    fld         qword ptr [esp]
 00457183    pop         ecx
 00457184    pop         edx
 00457185    ret
*}
end;

//00457188
{*function sub_00457188(?:?; ?:?):?;
begin
 00457188    push        ebp
 00457189    mov         ebp,esp
 0045718B    push        dword ptr [ebp+0C]
 0045718E    push        dword ptr [ebp+8]
 00457191    call        00457140
 00457196    call        @TRUNC
 0045719B    push        eax
 0045719C    fld         qword ptr [ebp+8]
 0045719F    call        @TRUNC
 004571A4    pop         edx
 004571A5    sub         ax,dx
 004571A8    inc         eax
 004571A9    pop         ebp
 004571AA    ret         8
end;*}

//004571B0
{*function sub_004571B0(?:?; ?:?):?;
begin
 004571B0    push        ebp
 004571B1    mov         ebp,esp
 004571B3    push        ebx
 004571B4    push        dword ptr [ebp+0C]
 004571B7    push        dword ptr [ebp+8]
 004571BA    call        00457118
 004571BF    mov         ebx,eax
 004571C1    push        dword ptr [ebp+0C]
 004571C4    push        dword ptr [ebp+8]
 004571C7    call        00457188
 004571CC    dec         eax
 004571CD    add         eax,eax
 004571CF    add         eax,eax
 004571D1    add         eax,eax
 004571D3    lea         eax,[eax+eax*2]
 004571D6    add         bx,ax
 004571D9    mov         eax,ebx
 004571DB    pop         ebx
 004571DC    pop         ebp
 004571DD    ret         8
end;*}

//004571E0
{*function sub_004571E0(?:?; ?:?):?;
begin
 004571E0    push        ebp
 004571E1    mov         ebp,esp
 004571E3    push        ebx
 004571E4    push        dword ptr [ebp+0C]
 004571E7    push        dword ptr [ebp+8]
 004571EA    call        00457118
 004571EF    mov         ebx,eax
 004571F1    push        dword ptr [ebp+0C]
 004571F4    push        dword ptr [ebp+8]
 004571F7    call        004570F4
 004571FC    dec         eax
 004571FD    add         eax,eax
 004571FF    add         eax,eax
 00457201    add         eax,eax
 00457203    lea         eax,[eax+eax*2]
 00457206    add         bx,ax
 00457209    mov         eax,ebx
 0045720B    pop         ebx
 0045720C    pop         ebp
 0045720D    ret         8
end;*}

//00457210
{*function sub_00457210(?:?; ?:?):?;
begin
 00457210    push        ebp
 00457211    mov         ebp,esp
 00457213    add         esp,0FFFFFFF8
 00457216    push        dword ptr [ebp+0C]
 00457219    push        dword ptr [ebp+8]
 0045721C    lea         eax,[ebp-8]
 0045721F    call        DateTimeToTimeStamp
 00457224    mov         eax,dword ptr [ebp-4]
 00457227    dec         eax
 00457228    mov         ecx,7
 0045722D    cdq
 0045722E    idiv        eax,ecx
 00457230    mov         eax,edx
 00457232    inc         eax
 00457233    pop         ecx
 00457234    pop         ecx
 00457235    pop         ebp
 00457236    ret         8
end;*}

//0045723C
{*function sub_0045723C(?:?; ?:?):?;
begin
 0045723C    push        ebp
 0045723D    mov         ebp,esp
 0045723F    push        ebx
 00457240    push        dword ptr [ebp+0C]
 00457243    push        dword ptr [ebp+8]
 00457246    call        00457118
 0045724B    mov         ebx,eax
 0045724D    push        dword ptr [ebp+0C]
 00457250    push        dword ptr [ebp+8]
 00457253    call        00457210
 00457258    dec         eax
 00457259    add         eax,eax
 0045725B    add         eax,eax
 0045725D    add         eax,eax
 0045725F    lea         eax,[eax+eax*2]
 00457262    add         bx,ax
 00457265    mov         eax,ebx
 00457267    pop         ebx
 00457268    pop         ebp
 00457269    ret         8
end;*}

//0045726C
{*function sub_0045726C(?:?; ?:?):?;
begin
 0045726C    push        ebp
 0045726D    mov         ebp,esp
 0045726F    add         esp,0FFFFFFF0
 00457272    push        dword ptr [ebp+0C]
 00457275    push        dword ptr [ebp+8]
 00457278    lea         eax,[ebp-10]
 0045727B    call        DateTimeToTimeStamp
 00457280    mov         eax,dword ptr [ebp-0C]
 00457283    cdq
 00457284    mov         dword ptr [ebp-8],eax
 00457287    mov         dword ptr [ebp-4],edx
 0045728A    push        0
 0045728C    push        5265C00
 00457291    mov         eax,dword ptr [ebp-8]
 00457294    mov         edx,dword ptr [ebp-4]
 00457297    call        @_llmul
 0045729C    push        edx
 0045729D    push        eax
 0045729E    mov         eax,dword ptr [ebp-10]
 004572A1    cdq
 004572A2    add         eax,dword ptr [esp]
 004572A5    adc         edx,dword ptr [esp+4]
 004572A9    add         esp,8
 004572AC    mov         dword ptr [ebp-8],eax
 004572AF    mov         dword ptr [ebp-4],edx
 004572B2    mov         eax,dword ptr [ebp-8]
 004572B5    mov         edx,dword ptr [ebp-4]
 004572B8    mov         esp,ebp
 004572BA    pop         ebp
 004572BB    ret         8
end;*}

//004572C0
{*function sub_004572C0(?:?; ?:?; ?:?; ?:?):?;
begin
 004572C0    push        ebp
 004572C1    mov         ebp,esp
 004572C3    push        0
 004572C5    push        5265C00
 004572CA    push        dword ptr [ebp+14]
 004572CD    push        dword ptr [ebp+10]
 004572D0    call        0045726C
 004572D5    push        edx
 004572D6    push        eax
 004572D7    push        dword ptr [ebp+0C]
 004572DA    push        dword ptr [ebp+8]
 004572DD    call        0045726C
 004572E2    sub         dword ptr [esp],eax
 004572E5    sbb         dword ptr [esp+4],edx
 004572E9    pop         eax
 004572EA    pop         edx
 004572EB    test        edx,edx
>004572ED    jge         004572F6
 004572EF    neg         eax
 004572F1    adc         edx,0
 004572F4    neg         edx
 004572F6    call        @_lldiv
 004572FB    pop         ebp
 004572FC    ret         10
end;*}

//00457300
{*function sub_00457300(?:?; ?:?; ?:?; ?:?):?;
begin
 00457300    push        ebp
 00457301    mov         ebp,esp
 00457303    add         esp,0FFFFFFF8
 00457306    push        0
 00457308    push        36EE80
 0045730D    push        dword ptr [ebp+14]
 00457310    push        dword ptr [ebp+10]
 00457313    call        0045726C
 00457318    push        edx
 00457319    push        eax
 0045731A    push        dword ptr [ebp+0C]
 0045731D    push        dword ptr [ebp+8]
 00457320    call        0045726C
 00457325    sub         dword ptr [esp],eax
 00457328    sbb         dword ptr [esp+4],edx
 0045732C    pop         eax
 0045732D    pop         edx
 0045732E    test        edx,edx
>00457330    jge         00457339
 00457332    neg         eax
 00457334    adc         edx,0
 00457337    neg         edx
 00457339    call        @_lldiv
 0045733E    mov         dword ptr [ebp-8],eax
 00457341    mov         dword ptr [ebp-4],edx
 00457344    mov         eax,dword ptr [ebp-8]
 00457347    mov         edx,dword ptr [ebp-4]
 0045734A    pop         ecx
 0045734B    pop         ecx
 0045734C    pop         ebp
 0045734D    ret         10
end;*}

//004573A0
{*function sub_004573A0(?:?; ?:?):?;
begin
 004573A0    push        ebp
 004573A1    mov         ebp,esp
 004573A3    add         esp,0FFFFFFF8
 004573A6    fld         qword ptr [ebp+10]
 004573A9    fcomp       qword ptr [ebp+8]
 004573AC    wait
 004573AD    fnstsw      al
 004573AF    sahf
>004573B0    jae         004573BE
 004573B2    fld         qword ptr [ebp+8]
 004573B5    fsub        qword ptr [ebp+10]
 004573B8    fstp        qword ptr [ebp-8]
 004573BB    wait
>004573BC    jmp         004573C8
 004573BE    fld         qword ptr [ebp+10]
 004573C1    fsub        qword ptr [ebp+8]
 004573C4    fstp        qword ptr [ebp-8]
 004573C7    wait
 004573C8    fld         qword ptr [ebp-8]
 004573CB    pop         ecx
 004573CC    pop         ecx
 004573CD    pop         ebp
 004573CE    ret         10
end;*}

//004573D4
{*function sub_004573D4(?:?; ?:?; ?:?; ?:?):?;
begin
 004573D4    push        ebp
 004573D5    mov         ebp,esp
 004573D7    add         esp,0FFFFFFF8
 004573DA    push        dword ptr [ebp+14]
 004573DD    push        dword ptr [ebp+10]
 004573E0    push        dword ptr [ebp+0C]
 004573E3    push        dword ptr [ebp+8]
 004573E6    call        004573A0
 004573EB    fstp        qword ptr [ebp-8]
 004573EE    wait
 004573EF    fld         qword ptr [ebp-8]
 004573F2    pop         ecx
 004573F3    pop         ecx
 004573F4    pop         ebp
 004573F5    ret         10
end;*}

//004573F8
{*function sub_004573F8(?:?; ?:?; ?:?; ?:?):?;
begin
 004573F8    push        ebp
 004573F9    mov         ebp,esp
 004573FB    add         esp,0FFFFFFF8
 004573FE    push        dword ptr [ebp+14]
 00457401    push        dword ptr [ebp+10]
 00457404    push        dword ptr [ebp+0C]
 00457407    push        dword ptr [ebp+8]
 0045740A    call        004573A0
 0045740F    fmul        dword ptr ds:[457424];24:Single
 00457415    fstp        qword ptr [ebp-8]
 00457418    wait
 00457419    fld         qword ptr [ebp-8]
 0045741C    pop         ecx
 0045741D    pop         ecx
 0045741E    pop         ebp
 0045741F    ret         10
end;*}

//00457428
{*function sub_00457428(?:?; ?:?; ?:?; ?:?):?;
begin
 00457428    push        ebp
 00457429    mov         ebp,esp
 0045742B    add         esp,0FFFFFFF8
 0045742E    push        dword ptr [ebp+14]
 00457431    push        dword ptr [ebp+10]
 00457434    push        0
 00457436    push        3C
 00457438    mov         eax,dword ptr [ebp+8]
 0045743B    mov         edx,dword ptr [ebp+0C]
 0045743E    call        @_llmul
 00457443    push        edx
 00457444    push        eax
 00457445    call        00457458
 0045744A    fstp        qword ptr [ebp-8]
 0045744D    wait
 0045744E    fld         qword ptr [ebp-8]
 00457451    pop         ecx
 00457452    pop         ecx
 00457453    pop         ebp
 00457454    ret         10
end;*}

//00457458
{*function sub_00457458(?:?; ?:?; ?:?; ?:?):?;
begin
 00457458    push        ebp
 00457459    mov         ebp,esp
 0045745B    add         esp,0FFFFFFF8
 0045745E    push        dword ptr [ebp+14]
 00457461    push        dword ptr [ebp+10]
 00457464    push        0
 00457466    push        3C
 00457468    mov         eax,dword ptr [ebp+8]
 0045746B    mov         edx,dword ptr [ebp+0C]
 0045746E    call        @_llmul
 00457473    push        edx
 00457474    push        eax
 00457475    call        00457488
 0045747A    fstp        qword ptr [ebp-8]
 0045747D    wait
 0045747E    fld         qword ptr [ebp-8]
 00457481    pop         ecx
 00457482    pop         ecx
 00457483    pop         ebp
 00457484    ret         10
end;*}

//00457488
{*function sub_00457488(?:?; ?:?; ?:?; ?:?):?;
begin
 00457488    push        ebp
 00457489    mov         ebp,esp
 0045748B    add         esp,0FFFFFFF8
 0045748E    push        dword ptr [ebp+14]
 00457491    push        dword ptr [ebp+10]
 00457494    push        0
 00457496    push        3E8
 0045749B    mov         eax,dword ptr [ebp+8]
 0045749E    mov         edx,dword ptr [ebp+0C]
 004574A1    call        @_llmul
 004574A6    push        edx
 004574A7    push        eax
 004574A8    call        004574BC
 004574AD    fstp        qword ptr [ebp-8]
 004574B0    wait
 004574B1    fld         qword ptr [ebp-8]
 004574B4    pop         ecx
 004574B5    pop         ecx
 004574B6    pop         ebp
 004574B7    ret         10
end;*}

//004574BC
{*function sub_004574BC(?:?; ?:?; ?:?):?;
begin
 004574BC    push        ebp
 004574BD    mov         ebp,esp
 004574BF    add         esp,0FFFFFFE8
 004574C2    push        dword ptr [ebp+14]
 004574C5    push        dword ptr [ebp+10]
 004574C8    lea         eax,[ebp-10]
 004574CB    call        DateTimeToTimeStamp
 004574D0    lea         eax,[ebp-10]
 004574D3    call        TimeStampToMSecs
 004574D8    fistp       qword ptr [ebp-18]
 004574DB    wait
 004574DC    fild        qword ptr [ebp+8]
 004574DF    fild        qword ptr [ebp-18]
 004574E2    faddp       st(1),st
 004574E4    fistp       qword ptr [ebp-18]
 004574E7    wait
 004574E8    push        dword ptr [ebp-14]
 004574EB    push        dword ptr [ebp-18]
 004574EE    lea         eax,[ebp-10]
 004574F1    call        MSecsToTimeStamp
 004574F6    lea         eax,[ebp-10]
 004574F9    call        TimeStampToDateTime
 004574FE    fstp        qword ptr [ebp-8]
 00457501    wait
 00457502    fld         qword ptr [ebp-8]
 00457505    mov         esp,ebp
 00457507    pop         ebp
 00457508    ret         10
end;*}

//0045750C
{*function sub_0045750C(?:?; ?:?):?;
begin
 0045750C    push        ebx
 0045750D    push        esi
 0045750E    add         esp,0FFFFFFF8
 00457511    mov         esi,edx
 00457513    mov         ebx,eax
 00457515    mov         ecx,esp
 00457517    mov         edx,esi
 00457519    mov         eax,ebx
 0045751B    call        00457538
 00457520    test        al,al
>00457522    jne         0045752D
 00457524    mov         edx,esi
 00457526    mov         eax,ebx
 00457528    call        0045757C
 0045752D    fld         qword ptr [esp]
 00457530    pop         ecx
 00457531    pop         edx
 00457532    pop         esi
 00457533    pop         ebx
 00457534    ret
end;*}

//00457538
{*function sub_00457538(?:?; ?:?; ?:?):?;
begin
 00457538    push        ebx
 00457539    push        esi
 0045753A    push        edi
 0045753B    push        ebp
 0045753C    push        ecx
 0045753D    mov         ebp,ecx
 0045753F    mov         edi,edx
 00457541    mov         esi,eax
 00457543    mov         edx,edi
 00457545    mov         eax,esi
 00457547    call        00456FE8
 0045754C    mov         ebx,eax
 0045754E    test        bl,bl
>00457550    je          0045756E
 00457552    mov         eax,esi
 00457554    call        0045716C
 00457559    movzx       eax,di
 0045755C    mov         dword ptr [esp],eax
 0045755F    fild        dword ptr [esp]
 00457562    faddp       st(1),st
 00457564    fsub        dword ptr ds:[457578];1:Single
 0045756A    fstp        qword ptr [ebp]
 0045756D    wait
 0045756E    mov         eax,ebx
 00457570    pop         edx
 00457571    pop         ebp
 00457572    pop         edi
 00457573    pop         esi
 00457574    pop         ebx
 00457575    ret
end;*}

//0045757C
{*procedure sub_0045757C(?:?; ?:?);
begin
 0045757C    push        ebp
 0045757D    mov         ebp,esp
 0045757F    add         esp,0FFFFFFEC
 00457582    push        ebx
 00457583    push        esi
 00457584    xor         ecx,ecx
 00457586    mov         dword ptr [ebp-14],ecx
 00457589    mov         esi,edx
 0045758B    mov         ebx,eax
 0045758D    xor         eax,eax
 0045758F    push        ebp
 00457590    push        4575EC
 00457595    push        dword ptr fs:[eax]
 00457598    mov         dword ptr fs:[eax],esp
 0045759B    movzx       eax,bx
 0045759E    mov         dword ptr [ebp-10],eax
 004575A1    mov         byte ptr [ebp-0C],0
 004575A5    movzx       eax,si
 004575A8    mov         dword ptr [ebp-8],eax
 004575AB    mov         byte ptr [ebp-4],0
 004575AF    lea         eax,[ebp-10]
 004575B2    push        eax
 004575B3    push        1
 004575B5    lea         edx,[ebp-14]
 004575B8    mov         eax,[0078D210];^SResString161:TResStringRec
 004575BD    call        LoadResString
 004575C2    mov         ecx,dword ptr [ebp-14]
 004575C5    mov         dl,1
 004575C7    mov         eax,[0041A0BC];EConvertError
 004575CC    call        Exception.CreateFmt;EConvertError.Create
 004575D1    call        @RaiseExcept
 004575D6    xor         eax,eax
 004575D8    pop         edx
 004575D9    pop         ecx
 004575DA    pop         ecx
 004575DB    mov         dword ptr fs:[eax],edx
 004575DE    push        4575F3
 004575E3    lea         eax,[ebp-14]
 004575E6    call        @UStrClr
 004575EB    ret
>004575EC    jmp         @HandleFinally
>004575F1    jmp         004575E3
 004575F3    pop         esi
 004575F4    pop         ebx
 004575F5    mov         esp,ebp
 004575F7    pop         ebp
 004575F8    ret
end;*}

Initialization
//0078035C
{*
 0078035C    push        ebp
 0078035D    mov         ebp,esp
 0078035F    xor         ecx,ecx
 00780361    push        ecx
 00780362    push        ecx
 00780363    push        ecx
 00780364    push        ecx
 00780365    xor         eax,eax
 00780367    push        ebp
 00780368    push        7807A7
 0078036D    push        dword ptr fs:[eax]
 00780370    mov         dword ptr fs:[eax],esp
 00780373    sub         dword ptr ds:[79303C],1
>0078037A    jae         00780786
 00780380    call        Randomize
 00780385    mov         word ptr ds:[793020],2F;gvar_00793020
 0078038E    mov         word ptr ds:[793028],2E;gvar_00793028
 00780397    lea         eax,[ebp-4]
 0078039A    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 007803A0    call        @DynArrayClear
 007803A5    push        2
 007803A7    lea         eax,[ebp-4]
 007803AA    mov         ecx,1
 007803AF    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 007803B5    call        @DynArraySetLength
 007803BA    add         esp,4
 007803BD    mov         eax,dword ptr [ebp-4]
 007803C0    mov         word ptr [eax],2A
 007803C5    mov         eax,dword ptr [ebp-4]
 007803C8    mov         word ptr [eax+2],3F
 007803CE    mov         edx,dword ptr [ebp-4]
 007803D1    mov         eax,793038;gvar_00793038:?
 007803D6    mov         ecx,dword ptr ds:[41B3D4];TArray<System.Char>
 007803DC    call        @DynArrayAsg
 007803E1    mov         word ptr ds:[793022],5C;gvar_00793022
 007803EA    mov         word ptr ds:[793024],3B;gvar_00793024
 007803F3    mov         word ptr ds:[793026],3A;gvar_00793026
 007803FC    lea         eax,[ebp-8]
 007803FF    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 00780405    call        @DynArrayClear
 0078040A    push        24
 0078040C    lea         eax,[ebp-8]
 0078040F    mov         ecx,1
 00780414    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 0078041A    call        @DynArraySetLength
 0078041F    add         esp,4
 00780422    mov         eax,dword ptr [ebp-8]
 00780425    mov         word ptr [eax],0
 0078042A    mov         eax,dword ptr [ebp-8]
 0078042D    mov         word ptr [eax+2],1
 00780433    mov         eax,dword ptr [ebp-8]
 00780436    mov         word ptr [eax+4],2
 0078043C    mov         eax,dword ptr [ebp-8]
 0078043F    mov         word ptr [eax+6],3
 00780445    mov         eax,dword ptr [ebp-8]
 00780448    mov         word ptr [eax+8],4
 0078044E    mov         eax,dword ptr [ebp-8]
 00780451    mov         word ptr [eax+0A],5
 00780457    mov         eax,dword ptr [ebp-8]
 0078045A    mov         word ptr [eax+0C],6
 00780460    mov         eax,dword ptr [ebp-8]
 00780463    mov         word ptr [eax+0E],7
 00780469    mov         eax,dword ptr [ebp-8]
 0078046C    mov         word ptr [eax+10],8
 00780472    mov         eax,dword ptr [ebp-8]
 00780475    mov         word ptr [eax+12],9
 0078047B    mov         eax,dword ptr [ebp-8]
 0078047E    mov         word ptr [eax+14],0A
 00780484    mov         eax,dword ptr [ebp-8]
 00780487    mov         word ptr [eax+16],0B
 0078048D    mov         eax,dword ptr [ebp-8]
 00780490    mov         word ptr [eax+18],0C
 00780496    mov         eax,dword ptr [ebp-8]
 00780499    mov         word ptr [eax+1A],0D
 0078049F    mov         eax,dword ptr [ebp-8]
 007804A2    mov         word ptr [eax+1C],0E
 007804A8    mov         eax,dword ptr [ebp-8]
 007804AB    mov         word ptr [eax+1E],0F
 007804B1    mov         eax,dword ptr [ebp-8]
 007804B4    mov         word ptr [eax+20],10
 007804BA    mov         eax,dword ptr [ebp-8]
 007804BD    mov         word ptr [eax+22],11
 007804C3    mov         eax,dword ptr [ebp-8]
 007804C6    mov         word ptr [eax+24],12
 007804CC    mov         eax,dword ptr [ebp-8]
 007804CF    mov         word ptr [eax+26],13
 007804D5    mov         eax,dword ptr [ebp-8]
 007804D8    mov         word ptr [eax+28],14
 007804DE    mov         eax,dword ptr [ebp-8]
 007804E1    mov         word ptr [eax+2A],15
 007804E7    mov         eax,dword ptr [ebp-8]
 007804EA    mov         word ptr [eax+2C],16
 007804F0    mov         eax,dword ptr [ebp-8]
 007804F3    mov         word ptr [eax+2E],17
 007804F9    mov         eax,dword ptr [ebp-8]
 007804FC    mov         word ptr [eax+30],18
 00780502    mov         eax,dword ptr [ebp-8]
 00780505    mov         word ptr [eax+32],19
 0078050B    mov         eax,dword ptr [ebp-8]
 0078050E    mov         word ptr [eax+34],1A
 00780514    mov         eax,dword ptr [ebp-8]
 00780517    mov         word ptr [eax+36],1B
 0078051D    mov         eax,dword ptr [ebp-8]
 00780520    mov         word ptr [eax+38],1C
 00780526    mov         eax,dword ptr [ebp-8]
 00780529    mov         word ptr [eax+3A],1D
 0078052F    mov         eax,dword ptr [ebp-8]
 00780532    mov         word ptr [eax+3C],1E
 00780538    mov         eax,dword ptr [ebp-8]
 0078053B    mov         word ptr [eax+3E],1F
 00780541    mov         eax,dword ptr [ebp-8]
 00780544    mov         word ptr [eax+40],22
 0078054A    mov         eax,dword ptr [ebp-8]
 0078054D    mov         word ptr [eax+42],3C
 00780553    mov         eax,dword ptr [ebp-8]
 00780556    mov         word ptr [eax+44],3E
 0078055C    mov         eax,dword ptr [ebp-8]
 0078055F    mov         word ptr [eax+46],7C
 00780565    mov         edx,dword ptr [ebp-8]
 00780568    mov         eax,79302C;gvar_0079302C:?
 0078056D    mov         ecx,dword ptr ds:[41B3D4];TArray<System.Char>
 00780573    call        @DynArrayAsg
 00780578    lea         eax,[ebp-0C]
 0078057B    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 00780581    call        @DynArrayClear
 00780586    push        29
 00780588    lea         eax,[ebp-0C]
 0078058B    mov         ecx,1
 00780590    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 00780596    call        @DynArraySetLength
 0078059B    add         esp,4
 0078059E    mov         eax,dword ptr [ebp-0C]
 007805A1    mov         word ptr [eax],0
 007805A6    mov         eax,dword ptr [ebp-0C]
 007805A9    mov         word ptr [eax+2],1
 007805AF    mov         eax,dword ptr [ebp-0C]
 007805B2    mov         word ptr [eax+4],2
 007805B8    mov         eax,dword ptr [ebp-0C]
 007805BB    mov         word ptr [eax+6],3
 007805C1    mov         eax,dword ptr [ebp-0C]
 007805C4    mov         word ptr [eax+8],4
 007805CA    mov         eax,dword ptr [ebp-0C]
 007805CD    mov         word ptr [eax+0A],5
 007805D3    mov         eax,dword ptr [ebp-0C]
 007805D6    mov         word ptr [eax+0C],6
 007805DC    mov         eax,dword ptr [ebp-0C]
 007805DF    mov         word ptr [eax+0E],7
 007805E5    mov         eax,dword ptr [ebp-0C]
 007805E8    mov         word ptr [eax+10],8
 007805EE    mov         eax,dword ptr [ebp-0C]
 007805F1    mov         word ptr [eax+12],9
 007805F7    mov         eax,dword ptr [ebp-0C]
 007805FA    mov         word ptr [eax+14],0A
 00780600    mov         eax,dword ptr [ebp-0C]
 00780603    mov         word ptr [eax+16],0B
 00780609    mov         eax,dword ptr [ebp-0C]
 0078060C    mov         word ptr [eax+18],0C
 00780612    mov         eax,dword ptr [ebp-0C]
 00780615    mov         word ptr [eax+1A],0D
 0078061B    mov         eax,dword ptr [ebp-0C]
 0078061E    mov         word ptr [eax+1C],0E
 00780624    mov         eax,dword ptr [ebp-0C]
 00780627    mov         word ptr [eax+1E],0F
 0078062D    mov         eax,dword ptr [ebp-0C]
 00780630    mov         word ptr [eax+20],10
 00780636    mov         eax,dword ptr [ebp-0C]
 00780639    mov         word ptr [eax+22],11
 0078063F    mov         eax,dword ptr [ebp-0C]
 00780642    mov         word ptr [eax+24],12
 00780648    mov         eax,dword ptr [ebp-0C]
 0078064B    mov         word ptr [eax+26],13
 00780651    mov         eax,dword ptr [ebp-0C]
 00780654    mov         word ptr [eax+28],14
 0078065A    mov         eax,dword ptr [ebp-0C]
 0078065D    mov         word ptr [eax+2A],15
 00780663    mov         eax,dword ptr [ebp-0C]
 00780666    mov         word ptr [eax+2C],16
 0078066C    mov         eax,dword ptr [ebp-0C]
 0078066F    mov         word ptr [eax+2E],17
 00780675    mov         eax,dword ptr [ebp-0C]
 00780678    mov         word ptr [eax+30],18
 0078067E    mov         eax,dword ptr [ebp-0C]
 00780681    mov         word ptr [eax+32],19
 00780687    mov         eax,dword ptr [ebp-0C]
 0078068A    mov         word ptr [eax+34],1A
 00780690    mov         eax,dword ptr [ebp-0C]
 00780693    mov         word ptr [eax+36],1B
 00780699    mov         eax,dword ptr [ebp-0C]
 0078069C    mov         word ptr [eax+38],1C
 007806A2    mov         eax,dword ptr [ebp-0C]
 007806A5    mov         word ptr [eax+3A],1D
 007806AB    mov         eax,dword ptr [ebp-0C]
 007806AE    mov         word ptr [eax+3C],1E
 007806B4    mov         eax,dword ptr [ebp-0C]
 007806B7    mov         word ptr [eax+3E],1F
 007806BD    mov         eax,dword ptr [ebp-0C]
 007806C0    mov         word ptr [eax+40],22
 007806C6    mov         eax,dword ptr [ebp-0C]
 007806C9    mov         word ptr [eax+42],2A
 007806CF    mov         eax,dword ptr [ebp-0C]
 007806D2    mov         word ptr [eax+44],2F
 007806D8    mov         eax,dword ptr [ebp-0C]
 007806DB    mov         word ptr [eax+46],3A
 007806E1    mov         eax,dword ptr [ebp-0C]
 007806E4    mov         word ptr [eax+48],3C
 007806EA    mov         eax,dword ptr [ebp-0C]
 007806ED    mov         word ptr [eax+4A],3E
 007806F3    mov         eax,dword ptr [ebp-0C]
 007806F6    mov         word ptr [eax+4C],3F
 007806FC    mov         eax,dword ptr [ebp-0C]
 007806FF    mov         word ptr [eax+4E],5C
 00780705    mov         eax,dword ptr [ebp-0C]
 00780708    mov         word ptr [eax+50],7C
 0078070E    mov         edx,dword ptr [ebp-0C]
 00780711    mov         eax,793030;gvar_00793030:?
 00780716    mov         ecx,dword ptr ds:[41B3D4];TArray<System.Char>
 0078071C    call        @DynArrayAsg
 00780721    lea         eax,[ebp-10]
 00780724    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 0078072A    call        @DynArrayClear
 0078072F    push        5
 00780731    lea         eax,[ebp-10]
 00780734    mov         ecx,1
 00780739    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 0078073F    call        @DynArraySetLength
 00780744    add         esp,4
 00780747    mov         eax,dword ptr [ebp-10]
 0078074A    mov         word ptr [eax],2A
 0078074F    mov         eax,dword ptr [ebp-10]
 00780752    mov         word ptr [eax+2],2F
 00780758    mov         eax,dword ptr [ebp-10]
 0078075B    mov         word ptr [eax+4],3A
 00780761    mov         eax,dword ptr [ebp-10]
 00780764    mov         word ptr [eax+6],3F
 0078076A    mov         eax,dword ptr [ebp-10]
 0078076D    mov         word ptr [eax+8],5C
 00780773    mov         edx,dword ptr [ebp-10]
 00780776    mov         eax,793034;gvar_00793034:?
 0078077B    mov         ecx,dword ptr ds:[41B3D4];TArray<System.Char>
 00780781    call        @DynArrayAsg
 00780786    xor         eax,eax
 00780788    pop         edx
 00780789    pop         ecx
 0078078A    pop         ecx
 0078078B    mov         dword ptr fs:[eax],edx
 0078078E    push        7807AE
 00780793    lea         eax,[ebp-10]
 00780796    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 0078079C    mov         ecx,4
 007807A1    call        @FinalizeArray
 007807A6    ret
>007807A7    jmp         @HandleFinally
>007807AC    jmp         00780793
 007807AE    mov         esp,ebp
 007807B0    pop         ebp
 007807B1    ret
*}
Finalization
end.