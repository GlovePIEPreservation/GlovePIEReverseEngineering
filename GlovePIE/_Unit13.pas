//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit13;

interface

uses
  SysUtils, Classes;

    function WICConvertBitmapSource(const dstFormat:TGUID; pISrc:IWICBitmapSource; var ppIDst:IWICBitmapSource):HRESULT; stdcall;//0045468C
    function AnsiStartsText(const ASubText:UnicodeString; const AText:UnicodeString):Boolean;//00454694
    function ReverseString(const AText:UnicodeString):UnicodeString;//004546E8
    function PosEx(const SubStr:UnicodeString; const S:UnicodeString; Offset:Integer):Integer;//00454734
    //function sub_00454868:?;//00454868
    //function sub_004548BC(?:Integer; ?:Extended):?;//004548BC
    //function sub_00454908(?:Integer; ?:?):?;//00454908
    //function sub_00454988(?:?; ?:?):?;//00454988
    //function sub_004549AC(?:?; ?:?):?;//004549AC
    //function sub_004549DC(?:Integer; ?:?):?;//004549DC
    //function sub_00454A0C(?:Extended):?;//00454A0C
    //procedure sub_00454A28(?:?);//00454A28
    //function sub_00454A44(?:Extended):?;//00454A44
    //function sub_00454A5C(?:?):?;//00454A5C
    //function sub_00454A74(?:?):?;//00454A74
    //function sub_00454A8C(?:Extended; ?:Extended):?;//00454A8C
    //function sub_00454A9C(?:?; ?:?):?;//00454A9C
    //function sub_00454AAC(?:?; ?:?):?;//00454AAC
    //function sub_00454ABC(?:?):?;//00454ABC
    //function sub_00454ACC(?:Extended):?;//00454ACC
    //function sub_00454ADC(?:?):?;//00454ADC
    //function sub_00454AEC(?:?):?;//00454AEC
    //function sub_00454B00(?:?):?;//00454B00
    //procedure sub_00454B14(?:?; ?:?);//00454B14
    //function sub_00454B4C(?:?):?;//00454B4C
    //function sub_00454B60(?:?):?;//00454B60
    //function sub_00454B98(?:?):?;//00454B98
    //function sub_00454BD0(?:?):?;//00454BD0
    //function sub_00454BE0(?:?):?;//00454BE0
    //function sub_00454BF0(?:?; ?:?):?;//00454BF0
    //function sub_00454C08(?:Double; ?:?; ?:?):?;//00454C08
    //function sub_00454C48(?:Extended; ?:Extended):?;//00454C48
    //function sub_00454CCC(?:?; ?:?):?;//00454CCC
    //function sub_00454D50(?:?; ?:?):?;//00454D50
    //function sub_00454DD4(?:?; ?:?):?;//00454DD4
    //function sub_00454E3C(?:?; ?:?):?;//00454E3C
    //function sub_00454EA0(?:?; ?:?):?;//00454EA0
    //procedure sub_00454EF0(?:?);//00454EF0
    //procedure sub_00454F44(?:?);//00454F44
    //procedure sub_00454F84(?:?; ?:?);//00454F84
    //procedure sub_00455018(?:?; ?:?);//00455018
    //procedure sub_00455068(?:?; ?:?);//00455068
    //procedure sub_004550B8(?:?; ?:?);//004550B8
    //procedure sub_00455108(?:?; ?:?);//00455108
    //procedure sub_0045519C(?:?; ?:?);//0045519C
    //procedure sub_00455228(?:?; ?:?);//00455228
    //function sub_004552D4(?:?):?;//004552D4
    //function sub_00455318(?:?):?;//00455318
    //procedure sub_0045534C(?:?);//0045534C
    //function sub_00455390(?:?; ?:Integer):?;//00455390
    //function sub_00455398(?:?; ?:Integer):?;//00455398
    //function sub_004553A0(?:?):?;//004553A0
    //function sub_004553E8(?:?; ?:?; ?:?):Boolean;//004553E8
    //function sub_004554D4(?:?; ?:?; ?:?):Boolean;//004554D4
    //function sub_0045550C(?:Integer; ?:?):?;//0045550C
    //function sub_00455534(?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;//00455534
    //function sub_00455620(?:?; ?:?):?;//00455620

implementation

//0045468C
function WICConvertBitmapSource(const dstFormat:TGUID; pISrc:IWICBitmapSource; var ppIDst:IWICBitmapSource):HRESULT; stdcall;
begin
{*
 0045468C    jmp         dword ptr ds:[82A0F4]
*}
end;

//00454694
function AnsiStartsText(const ASubText:UnicodeString; const AText:UnicodeString):Boolean;
begin
{*
 00454694    push        ebx
 00454695    push        esi
 00454696    push        edi
 00454697    push        ebp
 00454698    mov         esi,edx
 0045469A    mov         edi,eax
 0045469C    mov         eax,esi
 0045469E    call        @UStrToPWChar
 004546A3    mov         ebp,eax
 004546A5    mov         eax,edi
 004546A7    test        eax,eax
>004546A9    je          004546B0
 004546AB    sub         eax,4
 004546AE    mov         eax,dword ptr [eax]
 004546B0    mov         ebx,eax
 004546B2    mov         eax,esi
 004546B4    test        eax,eax
>004546B6    je          004546BD
 004546B8    sub         eax,4
 004546BB    mov         eax,dword ptr [eax]
 004546BD    cmp         eax,ebx
>004546BF    jge         004546C5
 004546C1    xor         eax,eax
>004546C3    jmp         004546E2
 004546C5    push        ebx
 004546C6    mov         eax,edi
 004546C8    call        @UStrToPWChar
 004546CD    push        eax
 004546CE    push        ebx
 004546CF    push        ebp
 004546D0    push        1
 004546D2    push        400
 004546D7    call        kernel32.CompareStringW
 004546DC    cmp         eax,2
 004546DF    sete        al
 004546E2    pop         ebp
 004546E3    pop         edi
 004546E4    pop         esi
 004546E5    pop         ebx
 004546E6    ret
*}
end;

//004546E8
function ReverseString(const AText:UnicodeString):UnicodeString;
begin
{*
 004546E8    push        ebx
 004546E9    push        esi
 004546EA    push        edi
 004546EB    mov         esi,edx
 004546ED    mov         ebx,eax
 004546EF    mov         edi,ebx
 004546F1    mov         eax,edi
 004546F3    test        eax,eax
>004546F5    je          004546FC
 004546F7    sub         eax,4
 004546FA    mov         eax,dword ptr [eax]
 004546FC    mov         edx,esi
 004546FE    xchg        eax,edx
 004546FF    call        @UStrSetLength
 00454704    mov         eax,dword ptr [esi]
 00454706    call        @UStrToPWChar
 0045470B    mov         edx,eax
 0045470D    mov         eax,edi
 0045470F    test        eax,eax
>00454711    je          00454718
 00454713    sub         eax,4
 00454716    mov         eax,dword ptr [eax]
 00454718    cmp         eax,1
>0045471B    jl          0045472D
 0045471D    movzx       ecx,word ptr [ebx+eax*2-2]
 00454722    mov         word ptr [edx],cx
 00454725    add         edx,2
 00454728    dec         eax
 00454729    test        eax,eax
>0045472B    jne         0045471D
 0045472D    pop         edi
 0045472E    pop         esi
 0045472F    pop         ebx
 00454730    ret
*}
end;

//00454734
function PosEx(const SubStr:UnicodeString; const S:UnicodeString; Offset:Integer):Integer;
begin
{*
 00454734    test        eax,eax
>00454736    je          004547F2
 0045473C    test        edx,edx
>0045473E    je          004547F2
 00454744    dec         ecx
>00454745    jl          004547F2
 0045474B    push        esi
 0045474C    push        ebx
 0045474D    push        0
 0045474F    push        0
 00454751    mov         esi,ecx
 00454753    cmp         word ptr [eax-0A],2
>00454758    je          0045476A
 0045475A    push        edx
 0045475B    mov         edx,eax
 0045475D    lea         eax,[esp+4]
 00454761    call        @UStrFromLStr
 00454766    pop         edx
 00454767    mov         eax,dword ptr [esp]
 0045476A    cmp         word ptr [edx-0A],2
>0045476F    je          00454780
 00454771    push        eax
 00454772    lea         eax,[esp+8]
 00454776    call        @UStrFromLStr
 0045477B    pop         eax
 0045477C    mov         edx,dword ptr [esp+4]
 00454780    mov         ecx,esi
 00454782    mov         esi,dword ptr [edx-4]
 00454785    mov         ebx,dword ptr [eax-4]
 00454788    sub         esi,ecx
 0045478A    shl         ecx,1
 0045478C    add         edx,ecx
 0045478E    cmp         esi,ebx
>00454790    jl          004547D8
 00454792    test        ebx,ebx
>00454794    jle         004547D8
 00454796    add         esp,0FFFFFFF4
 00454799    add         ebx,0FFFFFFFF
 0045479C    shl         esi,1
 0045479E    add         esi,edx
 004547A0    shl         ebx,1
 004547A2    add         edx,ebx
 004547A4    mov         dword ptr [esp+8],esi
 004547A8    add         eax,ebx
 004547AA    sub         ecx,edx
 004547AC    neg         ebx
 004547AE    mov         dword ptr [esp+4],ecx
 004547B2    mov         dword ptr [esp],ebx
 004547B5    movzx       ecx,word ptr [eax]
 004547B8    cmp         cx,word ptr [edx]
>004547BB    je          00454807
 004547BD    cmp         cx,word ptr [edx+2]
>004547C1    je          0045480A
 004547C3    add         edx,8
 004547C6    cmp         edx,dword ptr [esp+8]
>004547CA    jb          004547F5
 004547CC    add         edx,0FFFFFFFC
 004547CF    cmp         edx,dword ptr [esp+8]
>004547D3    jb          004547B8
 004547D5    add         esp,0C
 004547D8    mov         eax,dword ptr [esp]
 004547DB    or          eax,dword ptr [esp+4]
>004547DF    je          004547ED
 004547E1    mov         eax,esp
 004547E3    mov         edx,2
 004547E8    call        @UStrArrayClr
 004547ED    add         esp,8
 004547F0    pop         ebx
 004547F1    pop         esi
 004547F2    xor         eax,eax
 004547F4    ret
 004547F5    cmp         cx,word ptr [edx-4]
>004547F9    je          00454804
 004547FB    cmp         cx,word ptr [edx-2]
>004547FF    jne         004547B8
 00454801    add         edx,2
 00454804    add         edx,0FFFFFFFC
 00454807    add         edx,0FFFFFFFE
 0045480A    mov         esi,dword ptr [esp]
 0045480D    test        esi,esi
>0045480F    je          0045482E
 00454811    mov         ebx,dword ptr [eax+esi]
 00454814    cmp         ebx,dword ptr [edx+esi+2]
>00454818    jne         004547C3
 0045481A    cmp         esi,0FFFFFFFC
>0045481D    jge         0045482E
 0045481F    mov         ebx,dword ptr [eax+esi+4]
 00454823    cmp         ebx,dword ptr [edx+esi+6]
>00454827    jne         004547C3
 00454829    add         esi,8
>0045482C    jl          00454811
 0045482E    mov         eax,dword ptr [esp+4]
 00454832    add         edx,4
 00454835    cmp         edx,dword ptr [esp+8]
>00454839    ja          004547D5
 0045483B    add         esp,0C
 0045483E    mov         ecx,dword ptr [esp]
 00454841    or          ecx,dword ptr [esp+4]
>00454845    je          0045485B
 00454847    mov         ebx,eax
 00454849    mov         esi,edx
 0045484B    mov         eax,esp
 0045484D    mov         edx,2
 00454852    call        @UStrArrayClr
 00454857    mov         eax,ebx
 00454859    mov         edx,esi
 0045485B    add         eax,edx
 0045485D    shr         eax,1
 0045485F    add         esp,8
 00454862    pop         ebx
 00454863    pop         esi
 00454864    ret
*}
end;

//00454868
{*function sub_00454868:?;
begin
 00454868    push        ebp
 00454869    mov         ebp,esp
 0045486B    push        0
 0045486D    xor         eax,eax
 0045486F    push        ebp
 00454870    push        4548B2
 00454875    push        dword ptr fs:[eax]
 00454878    mov         dword ptr fs:[eax],esp
 0045487B    lea         edx,[ebp-4]
 0045487E    mov         eax,[0078CF64];^SResString47:TResStringRec
 00454883    call        LoadResString
 00454888    mov         ecx,dword ptr [ebp-4]
 0045488B    mov         dl,1
 0045488D    mov         eax,[00418C04];Exception
 00454892    call        Exception.Create;Exception.Create
 00454897    call        @RaiseExcept
 0045489C    xor         eax,eax
 0045489E    pop         edx
 0045489F    pop         ecx
 004548A0    pop         ecx
 004548A1    mov         dword ptr fs:[eax],edx
 004548A4    push        4548B9
 004548A9    lea         eax,[ebp-4]
 004548AC    call        @UStrClr
 004548B1    ret
>004548B2    jmp         @HandleFinally
>004548B7    jmp         004548A9
 004548B9    pop         ecx
 004548BA    pop         ebp
 004548BB    ret
end;*}

//004548BC
{*function sub_004548BC(?:Integer; ?:Extended):?;
begin
 004548BC    push        ebp
 004548BD    mov         ebp,esp
 004548BF    push        esi
 004548C0    xor         esi,esi
 004548C2    sub         esp,4
 004548C5    movsx       eax,al
 004548C8    cmp         eax,14
>004548CB    jle         004548D2
 004548CD    call        00454868
 004548D2    cmp         eax,0FFFFFFEC
>004548D5    jge         004548DC
 004548D7    call        00454868
 004548DC    wait
 004548DD    fnstcw      word ptr [esp]
 004548E0    fldcw       word ptr [esi+785218]
 004548E6    lea         eax,[eax+eax*4]
 004548E9    lea         eax,[esi+eax*4+7853B0]
 004548F0    fld         tbyte ptr [eax]
 004548F2    fld         tbyte ptr [eax+0A]
 004548F5    fld         tbyte ptr [ebp+8]
 004548F8    fmulp       st(1),st
 004548FA    frndint
 004548FC    fmulp       st(1),st
 004548FE    fldcw       word ptr [esp]
 00454901    wait
 00454902    pop         eax
 00454903    pop         esi
 00454904    pop         ebp
 00454905    ret         0C
end;*}

//00454908
{*function sub_00454908(?:Integer; ?:?):?;
begin
 00454908    push        ebp
 00454909    mov         ebp,esp
 0045490B    add         esp,0FFFFFFE8
 0045490E    push        ebx
 0045490F    mov         ebx,eax
 00454911    push        41200000
 00454916    movsx       eax,bl
 00454919    call        004549AC
 0045491E    fstp        qword ptr [ebp-10]
 00454921    wait
 00454922    fld         qword ptr [ebp+8]
 00454925    fcomp       dword ptr ds:[454980];0:Single
 0045492B    wait
 0045492C    fnstsw      al
 0045492E    sahf
>0045492F    jae         00454954
 00454931    fld         qword ptr [ebp+8]
 00454934    fdiv        qword ptr [ebp-10]
 00454937    fsub        dword ptr ds:[454984];0.5:Single
 0045493D    call        @TRUNC
 00454942    mov         dword ptr [ebp-18],eax
 00454945    mov         dword ptr [ebp-14],edx
 00454948    fild        qword ptr [ebp-18]
 0045494B    fmul        qword ptr [ebp-10]
 0045494E    fstp        qword ptr [ebp-8]
 00454951    wait
>00454952    jmp         00454975
 00454954    fld         qword ptr [ebp+8]
 00454957    fdiv        qword ptr [ebp-10]
 0045495A    fadd        dword ptr ds:[454984];0.5:Single
 00454960    call        @TRUNC
 00454965    mov         dword ptr [ebp-18],eax
 00454968    mov         dword ptr [ebp-14],edx
 0045496B    fild        qword ptr [ebp-18]
 0045496E    fmul        qword ptr [ebp-10]
 00454971    fstp        qword ptr [ebp-8]
 00454974    wait
 00454975    fld         qword ptr [ebp-8]
 00454978    pop         ebx
 00454979    mov         esp,ebp
 0045497B    pop         ebp
 0045497C    ret         8
end;*}

//00454988
{*function sub_00454988(?:?; ?:?):?;
begin
 00454988    push        ebp
 00454989    mov         ebp,esp
 0045498B    fldln2
 0045498D    mov         ax,word ptr [ebp+10]
 00454991    fld         qword ptr [ebp+8]
 00454994    cmp         ax,3FFD
>00454998    jb          004549A2
 0045499A    fld1
 0045499C    faddp       st(1),st
 0045499E    fyl2x
>004549A0    jmp         004549A4
 004549A2    fyl2xp1
 004549A4    wait
 004549A5    pop         ebp
 004549A6    ret         8
end;*}

//004549AC
{*function sub_004549AC(?:?; ?:?):?;
begin
 004549AC    push        ebp
 004549AD    mov         ebp,esp
 004549AF    mov         ecx,eax
 004549B1    cdq
 004549B2    fld1
 004549B4    xor         eax,edx
 004549B6    sub         eax,edx
>004549B8    je          004549D4
 004549BA    fld         dword ptr [ebp+8]
>004549BD    jmp         004549C1
 004549BF    fmul        st,st(0)
 004549C1    shr         eax,1
>004549C3    jae         004549BF
 004549C5    fmul        st(1),st
>004549C7    jne         004549BF
 004549C9    fstp        st(0)
 004549CB    cmp         ecx,0
>004549CE    jge         004549D4
 004549D0    fld1
 004549D2    fdivrp      st(1),st
 004549D4    wait
 004549D5    pop         ebp
 004549D6    ret         4
end;*}

//004549DC
{*function sub_004549DC(?:Integer; ?:?):?;
begin
 004549DC    push        ebp
 004549DD    mov         ebp,esp
 004549DF    mov         ecx,eax
 004549E1    cdq
 004549E2    fld1
 004549E4    xor         eax,edx
 004549E6    sub         eax,edx
>004549E8    je          00454A04
 004549EA    fld         qword ptr [ebp+8]
>004549ED    jmp         004549F1
 004549EF    fmul        st,st(0)
 004549F1    shr         eax,1
>004549F3    jae         004549EF
 004549F5    fmul        st(1),st
>004549F7    jne         004549EF
 004549F9    fstp        st(0)
 004549FB    cmp         ecx,0
>004549FE    jge         00454A04
 00454A00    fld1
 00454A02    fdivrp      st(1),st
 00454A04    wait
 00454A05    pop         ebp
 00454A06    ret         8
end;*}

//00454A0C
{*function sub_00454A0C(?:Extended):?;
begin
 00454A0C    push        ebp
 00454A0D    mov         ebp,esp
 00454A0F    fld         tbyte ptr [ebp+8]
 00454A12    fld1
 00454A14    fadd        st,st(1)
 00454A16    fld1
 00454A18    fsub        st,st(2)
 00454A1A    fmulp       st(1),st
 00454A1C    fsqrt
 00454A1E    fxch        st(1)
 00454A20    fpatan
 00454A22    pop         ebp
 00454A23    ret         0C
end;*}

//00454A28
{*procedure sub_00454A28(?:?);
begin
 00454A28    push        ebp
 00454A29    mov         ebp,esp
 00454A2B    fld         qword ptr [ebp+8]
 00454A2E    fld1
 00454A30    fadd        st,st(1)
 00454A32    fld1
 00454A34    fsub        st,st(2)
 00454A36    fmulp       st(1),st
 00454A38    fsqrt
 00454A3A    fxch        st(1)
 00454A3C    fpatan
 00454A3E    pop         ebp
 00454A3F    ret         8
end;*}

//00454A44
{*function sub_00454A44(?:Extended):?;
begin
 00454A44    push        ebp
 00454A45    mov         ebp,esp
 00454A47    fld1
 00454A49    fld         tbyte ptr [ebp+8]
 00454A4C    fst         st(2)
 00454A4E    fmul        st,st(0)
 00454A50    fsubp       st(1),st
 00454A52    fsqrt
 00454A54    fpatan
 00454A56    pop         ebp
 00454A57    ret         0C
end;*}

//00454A5C
{*function sub_00454A5C(?:?):?;
begin
 00454A5C    push        ebp
 00454A5D    mov         ebp,esp
 00454A5F    fld         qword ptr [ebp+8]
 00454A62    fld1
 00454A64    fadd        st,st(1)
 00454A66    fld1
 00454A68    fsub        st,st(2)
 00454A6A    fmulp       st(1),st
 00454A6C    fsqrt
 00454A6E    fpatan
 00454A70    pop         ebp
 00454A71    ret         8
end;*}

//00454A74
{*function sub_00454A74(?:?):?;
begin
 00454A74    push        ebp
 00454A75    mov         ebp,esp
 00454A77    fld1
 00454A79    fld         dword ptr [ebp+8]
 00454A7C    fst         st(2)
 00454A7E    fmul        st,st(0)
 00454A80    fsubp       st(1),st
 00454A82    fsqrt
 00454A84    fpatan
 00454A86    pop         ebp
 00454A87    ret         4
end;*}

//00454A8C
{*function sub_00454A8C(?:Extended; ?:Extended):?;
begin
 00454A8C    push        ebp
 00454A8D    mov         ebp,esp
 00454A8F    fld         tbyte ptr [ebp+14]
 00454A92    fld         tbyte ptr [ebp+8]
 00454A95    fpatan
 00454A97    wait
 00454A98    pop         ebp
 00454A99    ret         18
end;*}

//00454A9C
{*function sub_00454A9C(?:?; ?:?):?;
begin
 00454A9C    push        ebp
 00454A9D    mov         ebp,esp
 00454A9F    fld         qword ptr [ebp+10]
 00454AA2    fld         qword ptr [ebp+8]
 00454AA5    fpatan
 00454AA7    wait
 00454AA8    pop         ebp
 00454AA9    ret         10
end;*}

//00454AAC
{*function sub_00454AAC(?:?; ?:?):?;
begin
 00454AAC    push        ebp
 00454AAD    mov         ebp,esp
 00454AAF    fld         dword ptr [ebp+0C]
 00454AB2    fld         dword ptr [ebp+8]
 00454AB5    fpatan
 00454AB7    wait
 00454AB8    pop         ebp
 00454AB9    ret         8
end;*}

//00454ABC
{*function sub_00454ABC(?:?):?;
begin
 00454ABC    push        ebp
 00454ABD    mov         ebp,esp
 00454ABF    fld         qword ptr [ebp+8]
 00454AC2    fptan
 00454AC4    fstp        st(0)
 00454AC6    wait
 00454AC7    pop         ebp
 00454AC8    ret         8
end;*}

//00454ACC
{*function sub_00454ACC(?:Extended):?;
begin
 00454ACC    push        ebp
 00454ACD    mov         ebp,esp
 00454ACF    fld         tbyte ptr [ebp+8]
 00454AD2    fptan
 00454AD4    fstp        st(0)
 00454AD6    wait
 00454AD7    pop         ebp
 00454AD8    ret         0C
end;*}

//00454ADC
{*function sub_00454ADC(?:?):?;
begin
 00454ADC    push        ebp
 00454ADD    mov         ebp,esp
 00454ADF    fld         qword ptr [ebp+8]
 00454AE2    fptan
 00454AE4    fdivrp      st(1),st
 00454AE6    wait
 00454AE7    pop         ebp
 00454AE8    ret         8
end;*}

//00454AEC
{*function sub_00454AEC(?:?):?;
begin
 00454AEC    push        ebp
 00454AED    mov         ebp,esp
 00454AEF    fld         qword ptr [ebp+8]
 00454AF2    fcos
 00454AF4    fld1
 00454AF6    fdivrp      st(1),st
 00454AF8    wait
 00454AF9    pop         ebp
 00454AFA    ret         8
end;*}

//00454B00
{*function sub_00454B00(?:?):?;
begin
 00454B00    push        ebp
 00454B01    mov         ebp,esp
 00454B03    fld         qword ptr [ebp+8]
 00454B06    fsin
 00454B08    fld1
 00454B0A    fdivrp      st(1),st
 00454B0C    wait
 00454B0D    pop         ebp
 00454B0E    ret         8
end;*}

//00454B14
{*procedure sub_00454B14(?:?; ?:?);
begin
 00454B14    push        ebp
 00454B15    mov         ebp,esp
 00454B17    fld         dword ptr [ebp+8]
 00454B1A    fabs
 00454B1C    fld         dword ptr [ebp+0C]
 00454B1F    fabs
 00454B21    fcom        st(1)
 00454B23    fnstsw      al
 00454B25    test        ah,45
>00454B28    jne         00454B2C
 00454B2A    fxch        st(1)
 00454B2C    fldz
 00454B2E    fcomp       st(1)
 00454B30    fnstsw      al
 00454B32    test        ah,40
>00454B35    je          00454B3B
 00454B37    fstp        st(0)
>00454B39    jmp         00454B47
 00454B3B    fdiv        st,st(1)
 00454B3D    fmul        st,st(0)
 00454B3F    fld1
 00454B41    faddp       st(1),st
 00454B43    fsqrt
 00454B45    fmulp       st(1),st
 00454B47    wait
 00454B48    pop         ebp
 00454B49    ret         8
end;*}

//00454B4C
{*function sub_00454B4C(?:?):?;
begin
 00454B4C    push        ebp
 00454B4D    mov         ebp,esp
 00454B4F    push        eax
 00454B50    fild        dword ptr [esp]
 00454B53    fld         qword ptr [ebp+8]
 00454B56    fscale
 00454B58    pop         eax
 00454B59    fstp        st(1)
 00454B5B    wait
 00454B5C    pop         ebp
 00454B5D    ret         8
end;*}

//00454B60
{*function sub_00454B60(?:?):?;
begin
 00454B60    push        ebp
 00454B61    mov         ebp,esp
 00454B63    push        ebx
 00454B64    fld         qword ptr [ebp+8]
 00454B67    call        @TRUNC
 00454B6C    mov         ebx,eax
 00454B6E    fld         qword ptr [ebp+8]
 00454B71    add         esp,0FFFFFFF4
 00454B74    fstp        tbyte ptr [esp]
 00454B77    wait
 00454B78    call        Frac
 00454B7D    fcomp       dword ptr ds:[454B94];0:Single
 00454B83    wait
 00454B84    fnstsw      al
 00454B86    sahf
>00454B87    jbe         00454B8A
 00454B89    inc         ebx
 00454B8A    mov         eax,ebx
 00454B8C    pop         ebx
 00454B8D    pop         ebp
 00454B8E    ret         8
end;*}

//00454B98
{*function sub_00454B98(?:?):?;
begin
 00454B98    push        ebp
 00454B99    mov         ebp,esp
 00454B9B    push        ebx
 00454B9C    fld         qword ptr [ebp+8]
 00454B9F    call        @TRUNC
 00454BA4    mov         ebx,eax
 00454BA6    fld         qword ptr [ebp+8]
 00454BA9    add         esp,0FFFFFFF4
 00454BAC    fstp        tbyte ptr [esp]
 00454BAF    wait
 00454BB0    call        Frac
 00454BB5    fcomp       dword ptr ds:[454BCC];0:Single
 00454BBB    wait
 00454BBC    fnstsw      al
 00454BBE    sahf
>00454BBF    jae         00454BC2
 00454BC1    dec         ebx
 00454BC2    mov         eax,ebx
 00454BC4    pop         ebx
 00454BC5    pop         ebp
 00454BC6    ret         8
end;*}

//00454BD0
{*function sub_00454BD0(?:?):?;
begin
 00454BD0    push        ebp
 00454BD1    mov         ebp,esp
 00454BD3    fldlg2
 00454BD5    fld         qword ptr [ebp+8]
 00454BD8    fyl2x
 00454BDA    wait
 00454BDB    pop         ebp
 00454BDC    ret         8
end;*}

//00454BE0
{*function sub_00454BE0(?:?):?;
begin
 00454BE0    push        ebp
 00454BE1    mov         ebp,esp
 00454BE3    fld1
 00454BE5    fld         qword ptr [ebp+8]
 00454BE8    fyl2x
 00454BEA    wait
 00454BEB    pop         ebp
 00454BEC    ret         8
end;*}

//00454BF0
{*function sub_00454BF0(?:?; ?:?):?;
begin
 00454BF0    push        ebp
 00454BF1    mov         ebp,esp
 00454BF3    fld1
 00454BF5    fld         qword ptr [ebp+8]
 00454BF8    fyl2x
 00454BFA    fld1
 00454BFC    fld         qword ptr [ebp+10]
 00454BFF    fyl2x
 00454C01    fdivp       st(1),st
 00454C03    wait
 00454C04    pop         ebp
 00454C05    ret         10
end;*}

//00454C08
{*function sub_00454C08(?:Double; ?:?; ?:?):?;
begin
 00454C08    push        ebp
 00454C09    mov         ebp,esp
 00454C0B    add         esp,0FFFFFFF8
 00454C0E    push        ebx
 00454C0F    mov         ecx,edx
 00454C11    mov         ebx,dword ptr [eax+ecx*8]
 00454C14    mov         dword ptr [ebp-8],ebx
 00454C17    mov         ebx,dword ptr [eax+ecx*8+4]
 00454C1B    mov         dword ptr [ebp-4],ebx
 00454C1E    dec         ecx
 00454C1F    cmp         ecx,0
>00454C22    jl          00454C3C
 00454C24    lea         edx,[eax+ecx*8]
 00454C27    fld         qword ptr [ebp-8]
 00454C2A    fmul        qword ptr [ebp+8]
 00454C2D    fadd        qword ptr [edx]
 00454C2F    fstp        qword ptr [ebp-8]
 00454C32    wait
 00454C33    dec         ecx
 00454C34    sub         edx,8
 00454C37    cmp         ecx,0FFFFFFFF
>00454C3A    jne         00454C27
 00454C3C    fld         qword ptr [ebp-8]
 00454C3F    pop         ebx
 00454C40    pop         ecx
 00454C41    pop         ecx
 00454C42    pop         ebp
 00454C43    ret         8
end;*}

//00454C48
{*function sub_00454C48(?:Extended; ?:Extended):?;
begin
 00454C48    push        ebp
 00454C49    mov         ebp,esp
 00454C4B    push        ecx
 00454C4C    fld         tbyte ptr [ebp+8]
 00454C4F    fld         st(0)
 00454C51    fabs
 00454C53    fld         qword ptr ds:[785558]
 00454C59    fcompp
 00454C5B    wait
 00454C5C    fnstsw      al
 00454C5E    sahf
>00454C5F    jb          00454C9A
 00454C61    fld         st(0)
 00454C63    frndint
 00454C65    fcomp       st(1)
 00454C67    wait
 00454C68    fnstsw      al
 00454C6A    sahf
>00454C6B    jne         00454C9A
 00454C6D    fistp       dword ptr [ebp-4]
 00454C70    mov         eax,dword ptr [ebp-4]
 00454C73    mov         ecx,eax
 00454C75    cdq
 00454C76    fld1
 00454C78    xor         eax,edx
 00454C7A    sub         eax,edx
>00454C7C    je          00454CC5
 00454C7E    fld         tbyte ptr [ebp+14]
>00454C81    jmp         00454C85
 00454C83    fmul        st,st(0)
 00454C85    shr         eax,1
>00454C87    jae         00454C83
 00454C89    fmul        st(1),st
>00454C8B    jne         00454C83
 00454C8D    fstp        st(0)
 00454C8F    cmp         ecx,0
>00454C92    jge         00454CC5
 00454C94    fld1
 00454C96    fdivrp      st(1),st
>00454C98    jmp         00454CC5
 00454C9A    fld         tbyte ptr [ebp+14]
 00454C9D    ftst
 00454C9F    wait
 00454CA0    fnstsw      al
 00454CA2    sahf
>00454CA3    je          00454CC3
 00454CA5    fldln2
 00454CA7    fxch        st(1)
 00454CA9    fyl2x
 00454CAB    fxch        st(1)
 00454CAD    fmulp       st(1),st
 00454CAF    fldl2e
 00454CB1    fmulp       st(1),st
 00454CB3    fld         st(0)
 00454CB5    frndint
 00454CB7    fsub        st(1),st
 00454CB9    fxch        st(1)
 00454CBB    f2xm1
 00454CBD    fld1
 00454CBF    faddp       st(1),st
 00454CC1    fscale
 00454CC3    fstp        st(1)
 00454CC5    pop         ecx
 00454CC6    pop         ebp
 00454CC7    ret         18
end;*}

//00454CCC
{*function sub_00454CCC(?:?; ?:?):?;
begin
 00454CCC    push        ebp
 00454CCD    mov         ebp,esp
 00454CCF    push        ecx
 00454CD0    fld         qword ptr [ebp+8]
 00454CD3    fld         st(0)
 00454CD5    fabs
 00454CD7    fld         qword ptr ds:[785560]
 00454CDD    fcompp
 00454CDF    wait
 00454CE0    fnstsw      al
 00454CE2    sahf
>00454CE3    jb          00454D1E
 00454CE5    fld         st(0)
 00454CE7    frndint
 00454CE9    fcomp       st(1)
 00454CEB    wait
 00454CEC    fnstsw      al
 00454CEE    sahf
>00454CEF    jne         00454D1E
 00454CF1    fistp       dword ptr [ebp-4]
 00454CF4    mov         eax,dword ptr [ebp-4]
 00454CF7    mov         ecx,eax
 00454CF9    cdq
 00454CFA    fld1
 00454CFC    xor         eax,edx
 00454CFE    sub         eax,edx
>00454D00    je          00454D49
 00454D02    fld         qword ptr [ebp+10]
>00454D05    jmp         00454D09
 00454D07    fmul        st,st(0)
 00454D09    shr         eax,1
>00454D0B    jae         00454D07
 00454D0D    fmul        st(1),st
>00454D0F    jne         00454D07
 00454D11    fstp        st(0)
 00454D13    cmp         ecx,0
>00454D16    jge         00454D49
 00454D18    fld1
 00454D1A    fdivrp      st(1),st
>00454D1C    jmp         00454D49
 00454D1E    fld         qword ptr [ebp+10]
 00454D21    ftst
 00454D23    wait
 00454D24    fnstsw      al
 00454D26    sahf
>00454D27    je          00454D47
 00454D29    fldln2
 00454D2B    fxch        st(1)
 00454D2D    fyl2x
 00454D2F    fxch        st(1)
 00454D31    fmulp       st(1),st
 00454D33    fldl2e
 00454D35    fmulp       st(1),st
 00454D37    fld         st(0)
 00454D39    frndint
 00454D3B    fsub        st(1),st
 00454D3D    fxch        st(1)
 00454D3F    f2xm1
 00454D41    fld1
 00454D43    faddp       st(1),st
 00454D45    fscale
 00454D47    fstp        st(1)
 00454D49    pop         ecx
 00454D4A    pop         ebp
 00454D4B    ret         10
end;*}

//00454D50
{*function sub_00454D50(?:?; ?:?):?;
begin
 00454D50    push        ebp
 00454D51    mov         ebp,esp
 00454D53    push        ecx
 00454D54    fld         dword ptr [ebp+8]
 00454D57    fld         st(0)
 00454D59    fabs
 00454D5B    fld         qword ptr ds:[785568]
 00454D61    fcompp
 00454D63    wait
 00454D64    fnstsw      al
 00454D66    sahf
>00454D67    jb          00454DA2
 00454D69    fld         st(0)
 00454D6B    frndint
 00454D6D    fcomp       st(1)
 00454D6F    wait
 00454D70    fnstsw      al
 00454D72    sahf
>00454D73    jne         00454DA2
 00454D75    fistp       dword ptr [ebp-4]
 00454D78    mov         eax,dword ptr [ebp-4]
 00454D7B    mov         ecx,eax
 00454D7D    cdq
 00454D7E    fld1
 00454D80    xor         eax,edx
 00454D82    sub         eax,edx
>00454D84    je          00454DCD
 00454D86    fld         dword ptr [ebp+0C]
>00454D89    jmp         00454D8D
 00454D8B    fmul        st,st(0)
 00454D8D    shr         eax,1
>00454D8F    jae         00454D8B
 00454D91    fmul        st(1),st
>00454D93    jne         00454D8B
 00454D95    fstp        st(0)
 00454D97    cmp         ecx,0
>00454D9A    jge         00454DCD
 00454D9C    fld1
 00454D9E    fdivrp      st(1),st
>00454DA0    jmp         00454DCD
 00454DA2    fld         dword ptr [ebp+0C]
 00454DA5    ftst
 00454DA7    wait
 00454DA8    fnstsw      al
 00454DAA    sahf
>00454DAB    je          00454DCB
 00454DAD    fldln2
 00454DAF    fxch        st(1)
 00454DB1    fyl2x
 00454DB3    fxch        st(1)
 00454DB5    fmulp       st(1),st
 00454DB7    fldl2e
 00454DB9    fmulp       st(1),st
 00454DBB    fld         st(0)
 00454DBD    frndint
 00454DBF    fsub        st(1),st
 00454DC1    fxch        st(1)
 00454DC3    f2xm1
 00454DC5    fld1
 00454DC7    faddp       st(1),st
 00454DC9    fscale
 00454DCB    fstp        st(1)
 00454DCD    pop         ecx
 00454DCE    pop         ebp
 00454DCF    ret         8
end;*}

//00454DD4
{*function sub_00454DD4(?:?; ?:?):?;
begin
 00454DD4    push        ebp
 00454DD5    mov         ebp,esp
 00454DD7    add         esp,0FFFFFFEC
 00454DDA    push        dword ptr [ebp+0C]
 00454DDD    push        dword ptr [ebp+8]
 00454DE0    push        0
 00454DE2    push        0
 00454DE4    call        004554D4
 00454DE9    test        al,al
>00454DEB    je          00454DFB
 00454DED    xor         eax,eax
 00454DEF    mov         dword ptr [ebp-8],eax
 00454DF2    mov         dword ptr [ebp-4],3FF00000
>00454DF9    jmp         00454E2E
 00454DFB    fld         qword ptr [ebp+8]
 00454DFE    add         esp,0FFFFFFF4
 00454E01    fstp        tbyte ptr [esp]
 00454E04    wait
 00454E05    call        Exp
 00454E0A    fstp        tbyte ptr [ebp-14]
 00454E0D    wait
 00454E0E    fld         qword ptr [ebp+8]
 00454E11    fchs
 00454E13    add         esp,0FFFFFFF4
 00454E16    fstp        tbyte ptr [esp]
 00454E19    wait
 00454E1A    call        Exp
 00454E1F    fld         tbyte ptr [ebp-14]
 00454E22    faddp       st(1),st
 00454E24    fdiv        dword ptr ds:[454E38];2:Single
 00454E2A    fstp        qword ptr [ebp-8]
 00454E2D    wait
 00454E2E    fld         qword ptr [ebp-8]
 00454E31    mov         esp,ebp
 00454E33    pop         ebp
 00454E34    ret         8
end;*}

//00454E3C
{*function sub_00454E3C(?:?; ?:?):?;
begin
 00454E3C    push        ebp
 00454E3D    mov         ebp,esp
 00454E3F    add         esp,0FFFFFFEC
 00454E42    push        dword ptr [ebp+0C]
 00454E45    push        dword ptr [ebp+8]
 00454E48    push        0
 00454E4A    push        0
 00454E4C    call        004554D4
 00454E51    test        al,al
>00454E53    je          00454E5F
 00454E55    xor         eax,eax
 00454E57    mov         dword ptr [ebp-8],eax
 00454E5A    mov         dword ptr [ebp-4],eax
>00454E5D    jmp         00454E92
 00454E5F    fld         qword ptr [ebp+8]
 00454E62    add         esp,0FFFFFFF4
 00454E65    fstp        tbyte ptr [esp]
 00454E68    wait
 00454E69    call        Exp
 00454E6E    fstp        tbyte ptr [ebp-14]
 00454E71    wait
 00454E72    fld         qword ptr [ebp+8]
 00454E75    fchs
 00454E77    add         esp,0FFFFFFF4
 00454E7A    fstp        tbyte ptr [esp]
 00454E7D    wait
 00454E7E    call        Exp
 00454E83    fld         tbyte ptr [ebp-14]
 00454E86    fsubrp      st(1),st
 00454E88    fdiv        dword ptr ds:[454E9C];2:Single
 00454E8E    fstp        qword ptr [ebp-8]
 00454E91    wait
 00454E92    fld         qword ptr [ebp-8]
 00454E95    mov         esp,ebp
 00454E97    pop         ebp
 00454E98    ret         8
end;*}

//00454EA0
{*function sub_00454EA0(?:?; ?:?):?;
begin
 00454EA0    push        ebp
 00454EA1    mov         ebp,esp
 00454EA3    add         esp,0FFFFFFF0
 00454EA6    push        dword ptr [ebp+0C]
 00454EA9    push        dword ptr [ebp+8]
 00454EAC    push        0
 00454EAE    push        0
 00454EB0    call        004554D4
 00454EB5    test        al,al
>00454EB7    je          00454EC3
 00454EB9    xor         eax,eax
 00454EBB    mov         dword ptr [ebp-8],eax
 00454EBE    mov         dword ptr [ebp-4],eax
>00454EC1    jmp         00454EE4
 00454EC3    push        dword ptr [ebp+0C]
 00454EC6    push        dword ptr [ebp+8]
 00454EC9    call        00454E3C
 00454ECE    fstp        qword ptr [ebp-10]
 00454ED1    wait
 00454ED2    push        dword ptr [ebp+0C]
 00454ED5    push        dword ptr [ebp+8]
 00454ED8    call        00454DD4
 00454EDD    fdivr       qword ptr [ebp-10]
 00454EE0    fstp        qword ptr [ebp-8]
 00454EE3    wait
 00454EE4    fld         qword ptr [ebp-8]
 00454EE7    mov         esp,ebp
 00454EE9    pop         ebp
 00454EEA    ret         8
end;*}

//00454EF0
{*procedure sub_00454EF0(?:?);
begin
 00454EF0    push        ebp
 00454EF1    mov         ebp,esp
 00454EF3    add         esp,0FFFFFFF8
 00454EF6    fld         qword ptr [ebp+8]
 00454EF9    fsub        dword ptr ds:[454F40];1:Single
 00454EFF    fld         qword ptr [ebp+8]
 00454F02    fadd        dword ptr ds:[454F40];1:Single
 00454F08    fdivp       st(1),st
 00454F0A    add         esp,0FFFFFFF4
 00454F0D    fstp        tbyte ptr [esp]
 00454F10    wait
 00454F11    call        Sqrt
 00454F16    fld         qword ptr [ebp+8]
 00454F19    fadd        dword ptr ds:[454F40];1:Single
 00454F1F    fmulp       st(1),st
 00454F21    fadd        qword ptr [ebp+8]
 00454F24    add         esp,0FFFFFFF4
 00454F27    fstp        tbyte ptr [esp]
 00454F2A    wait
 00454F2B    call        Ln
 00454F30    fstp        qword ptr [ebp-8]
 00454F33    wait
 00454F34    fld         qword ptr [ebp-8]
 00454F37    pop         ecx
 00454F38    pop         ecx
 00454F39    pop         ebp
 00454F3A    ret         8
end;*}

//00454F44
{*procedure sub_00454F44(?:?);
begin
 00454F44    push        ebp
 00454F45    mov         ebp,esp
 00454F47    add         esp,0FFFFFFF8
 00454F4A    fld         qword ptr [ebp+8]
 00454F4D    fmul        qword ptr [ebp+8]
 00454F50    fadd        dword ptr ds:[454F80];1:Single
 00454F56    add         esp,0FFFFFFF4
 00454F59    fstp        tbyte ptr [esp]
 00454F5C    wait
 00454F5D    call        Sqrt
 00454F62    fadd        qword ptr [ebp+8]
 00454F65    add         esp,0FFFFFFF4
 00454F68    fstp        tbyte ptr [esp]
 00454F6B    wait
 00454F6C    call        Ln
 00454F71    fstp        qword ptr [ebp-8]
 00454F74    wait
 00454F75    fld         qword ptr [ebp-8]
 00454F78    pop         ecx
 00454F79    pop         ecx
 00454F7A    pop         ebp
 00454F7B    ret         8
end;*}

//00454F84
{*procedure sub_00454F84(?:?; ?:?);
begin
 00454F84    push        ebp
 00454F85    mov         ebp,esp
 00454F87    add         esp,0FFFFFFF8
 00454F8A    push        dword ptr [ebp+0C]
 00454F8D    push        dword ptr [ebp+8]
 00454F90    push        3FF00000
 00454F95    push        0
 00454F97    push        0
 00454F99    push        0
 00454F9B    call        004553E8
 00454FA0    test        al,al
>00454FA2    je          00454FB2
 00454FA4    xor         eax,eax
 00454FA6    mov         dword ptr [ebp-8],eax
 00454FA9    mov         dword ptr [ebp-4],7FF00000
>00454FB0    jmp         00455004
 00454FB2    push        dword ptr [ebp+0C]
 00454FB5    push        dword ptr [ebp+8]
 00454FB8    push        0BFF00000
 00454FBD    push        0
 00454FBF    push        0
 00454FC1    push        0
 00454FC3    call        004553E8
 00454FC8    test        al,al
>00454FCA    je          00454FDA
 00454FCC    xor         eax,eax
 00454FCE    mov         dword ptr [ebp-8],eax
 00454FD1    mov         dword ptr [ebp-4],0FFF00000
>00454FD8    jmp         00455004
 00454FDA    fld         dword ptr ds:[455010];1:Single
 00454FE0    fadd        qword ptr [ebp+8]
 00454FE3    fld         dword ptr ds:[455010];1:Single
 00454FE9    fsub        qword ptr [ebp+8]
 00454FEC    fdivp       st(1),st
 00454FEE    add         esp,0FFFFFFF4
 00454FF1    fstp        tbyte ptr [esp]
 00454FF4    wait
 00454FF5    call        Ln
 00454FFA    fmul        dword ptr ds:[455014];0.5:Single
 00455000    fstp        qword ptr [ebp-8]
 00455003    wait
 00455004    fld         qword ptr [ebp-8]
 00455007    pop         ecx
 00455008    pop         ecx
 00455009    pop         ebp
 0045500A    ret         8
end;*}

//00455018
{*procedure sub_00455018(?:?; ?:?);
begin
 00455018    push        ebp
 00455019    mov         ebp,esp
 0045501B    add         esp,0FFFFFFF8
 0045501E    push        dword ptr [ebp+0C]
 00455021    push        dword ptr [ebp+8]
 00455024    push        0
 00455026    push        0
 00455028    call        004554D4
 0045502D    test        al,al
>0045502F    je          00455041
 00455031    mov         dword ptr [ebp-8],54442D18
 00455038    mov         dword ptr [ebp-4],3FF921FB
>0045503F    jmp         0045505A
 00455041    fld         dword ptr ds:[455064];1:Single
 00455047    fdiv        qword ptr [ebp+8]
 0045504A    add         esp,0FFFFFFF4
 0045504D    fstp        tbyte ptr [esp]
 00455050    wait
 00455051    call        ArcTan
 00455056    fstp        qword ptr [ebp-8]
 00455059    wait
 0045505A    fld         qword ptr [ebp-8]
 0045505D    pop         ecx
 0045505E    pop         ecx
 0045505F    pop         ebp
 00455060    ret         8
end;*}

//00455068
{*procedure sub_00455068(?:?; ?:?);
begin
 00455068    push        ebp
 00455069    mov         ebp,esp
 0045506B    add         esp,0FFFFFFF8
 0045506E    push        dword ptr [ebp+0C]
 00455071    push        dword ptr [ebp+8]
 00455074    push        0
 00455076    push        0
 00455078    call        004554D4
 0045507D    test        al,al
>0045507F    je          0045508F
 00455081    xor         eax,eax
 00455083    mov         dword ptr [ebp-8],eax
 00455086    mov         dword ptr [ebp-4],7FF00000
>0045508D    jmp         004550A8
 0045508F    fld         dword ptr ds:[4550B4];1:Single
 00455095    fdiv        qword ptr [ebp+8]
 00455098    add         esp,0FFFFFFF4
 0045509B    fstp        tbyte ptr [esp]
 0045509E    wait
 0045509F    call        00454A0C
 004550A4    fstp        qword ptr [ebp-8]
 004550A7    wait
 004550A8    fld         qword ptr [ebp-8]
 004550AB    pop         ecx
 004550AC    pop         ecx
 004550AD    pop         ebp
 004550AE    ret         8
end;*}

//004550B8
{*procedure sub_004550B8(?:?; ?:?);
begin
 004550B8    push        ebp
 004550B9    mov         ebp,esp
 004550BB    add         esp,0FFFFFFF8
 004550BE    push        dword ptr [ebp+0C]
 004550C1    push        dword ptr [ebp+8]
 004550C4    push        0
 004550C6    push        0
 004550C8    call        004554D4
 004550CD    test        al,al
>004550CF    je          004550DF
 004550D1    xor         eax,eax
 004550D3    mov         dword ptr [ebp-8],eax
 004550D6    mov         dword ptr [ebp-4],7FF00000
>004550DD    jmp         004550F8
 004550DF    fld         dword ptr ds:[455104];1:Single
 004550E5    fdiv        qword ptr [ebp+8]
 004550E8    add         esp,0FFFFFFF4
 004550EB    fstp        tbyte ptr [esp]
 004550EE    wait
 004550EF    call        00454A44
 004550F4    fstp        qword ptr [ebp-8]
 004550F7    wait
 004550F8    fld         qword ptr [ebp-8]
 004550FB    pop         ecx
 004550FC    pop         ecx
 004550FD    pop         ebp
 004550FE    ret         8
end;*}

//00455108
{*procedure sub_00455108(?:?; ?:?);
begin
 00455108    push        ebp
 00455109    mov         ebp,esp
 0045510B    add         esp,0FFFFFFF8
 0045510E    push        dword ptr [ebp+0C]
 00455111    push        dword ptr [ebp+8]
 00455114    push        3FF00000
 00455119    push        0
 0045511B    push        0
 0045511D    push        0
 0045511F    call        004553E8
 00455124    test        al,al
>00455126    je          00455136
 00455128    xor         eax,eax
 0045512A    mov         dword ptr [ebp-8],eax
 0045512D    mov         dword ptr [ebp-4],7FF00000
>00455134    jmp         00455188
 00455136    push        dword ptr [ebp+0C]
 00455139    push        dword ptr [ebp+8]
 0045513C    push        0BFF00000
 00455141    push        0
 00455143    push        0
 00455145    push        0
 00455147    call        004553E8
 0045514C    test        al,al
>0045514E    je          0045515E
 00455150    xor         eax,eax
 00455152    mov         dword ptr [ebp-8],eax
 00455155    mov         dword ptr [ebp-4],0FFF00000
>0045515C    jmp         00455188
 0045515E    fld         qword ptr [ebp+8]
 00455161    fadd        dword ptr ds:[455194];1:Single
 00455167    fld         qword ptr [ebp+8]
 0045516A    fsub        dword ptr ds:[455194];1:Single
 00455170    fdivp       st(1),st
 00455172    add         esp,0FFFFFFF4
 00455175    fstp        tbyte ptr [esp]
 00455178    wait
 00455179    call        Ln
 0045517E    fmul        dword ptr ds:[455198];0.5:Single
 00455184    fstp        qword ptr [ebp-8]
 00455187    wait
 00455188    fld         qword ptr [ebp-8]
 0045518B    pop         ecx
 0045518C    pop         ecx
 0045518D    pop         ebp
 0045518E    ret         8
end;*}

//0045519C
{*procedure sub_0045519C(?:?; ?:?);
begin
 0045519C    push        ebp
 0045519D    mov         ebp,esp
 0045519F    add         esp,0FFFFFFF8
 004551A2    push        dword ptr [ebp+0C]
 004551A5    push        dword ptr [ebp+8]
 004551A8    push        0
 004551AA    push        0
 004551AC    call        004554D4
 004551B1    test        al,al
>004551B3    je          004551C3
 004551B5    xor         eax,eax
 004551B7    mov         dword ptr [ebp-8],eax
 004551BA    mov         dword ptr [ebp-4],7FF00000
>004551C1    jmp         00455218
 004551C3    push        dword ptr [ebp+0C]
 004551C6    push        dword ptr [ebp+8]
 004551C9    push        3FF00000
 004551CE    push        0
 004551D0    push        0
 004551D2    push        0
 004551D4    call        004553E8
 004551D9    test        al,al
>004551DB    je          004551E7
 004551DD    xor         eax,eax
 004551DF    mov         dword ptr [ebp-8],eax
 004551E2    mov         dword ptr [ebp-4],eax
>004551E5    jmp         00455218
 004551E7    fld         qword ptr [ebp+8]
 004551EA    fmul        qword ptr [ebp+8]
 004551ED    fsubr       dword ptr ds:[455224];1:Single
 004551F3    add         esp,0FFFFFFF4
 004551F6    fstp        tbyte ptr [esp]
 004551F9    wait
 004551FA    call        Sqrt
 004551FF    fadd        dword ptr ds:[455224];1:Single
 00455205    fdiv        qword ptr [ebp+8]
 00455208    add         esp,0FFFFFFF4
 0045520B    fstp        tbyte ptr [esp]
 0045520E    wait
 0045520F    call        Ln
 00455214    fstp        qword ptr [ebp-8]
 00455217    wait
 00455218    fld         qword ptr [ebp-8]
 0045521B    pop         ecx
 0045521C    pop         ecx
 0045521D    pop         ebp
 0045521E    ret         8
end;*}

//00455228
{*procedure sub_00455228(?:?; ?:?);
begin
 00455228    push        ebp
 00455229    mov         ebp,esp
 0045522B    add         esp,0FFFFFFF8
 0045522E    push        dword ptr [ebp+0C]
 00455231    push        dword ptr [ebp+8]
 00455234    push        0
 00455236    push        0
 00455238    call        004554D4
 0045523D    test        al,al
>0045523F    je          0045524F
 00455241    xor         eax,eax
 00455243    mov         dword ptr [ebp-8],eax
 00455246    mov         dword ptr [ebp-4],7FF00000
>0045524D    jmp         004552C2
 0045524F    fld         qword ptr [ebp+8]
 00455252    fcomp       dword ptr ds:[4552CC];0:Single
 00455258    wait
 00455259    fnstsw      al
 0045525B    sahf
>0045525C    jae         00455291
 0045525E    fld         qword ptr [ebp+8]
 00455261    fmul        qword ptr [ebp+8]
 00455264    fadd        dword ptr ds:[4552D0];1:Single
 0045526A    add         esp,0FFFFFFF4
 0045526D    fstp        tbyte ptr [esp]
 00455270    wait
 00455271    call        Sqrt
 00455276    fsubr       dword ptr ds:[4552D0];1:Single
 0045527C    fdiv        qword ptr [ebp+8]
 0045527F    add         esp,0FFFFFFF4
 00455282    fstp        tbyte ptr [esp]
 00455285    wait
 00455286    call        Ln
 0045528B    fstp        qword ptr [ebp-8]
 0045528E    wait
>0045528F    jmp         004552C2
 00455291    fld         qword ptr [ebp+8]
 00455294    fmul        qword ptr [ebp+8]
 00455297    fadd        dword ptr ds:[4552D0];1:Single
 0045529D    add         esp,0FFFFFFF4
 004552A0    fstp        tbyte ptr [esp]
 004552A3    wait
 004552A4    call        Sqrt
 004552A9    fadd        dword ptr ds:[4552D0];1:Single
 004552AF    fdiv        qword ptr [ebp+8]
 004552B2    add         esp,0FFFFFFF4
 004552B5    fstp        tbyte ptr [esp]
 004552B8    wait
 004552B9    call        Ln
 004552BE    fstp        qword ptr [ebp-8]
 004552C1    wait
 004552C2    fld         qword ptr [ebp-8]
 004552C5    pop         ecx
 004552C6    pop         ecx
 004552C7    pop         ebp
 004552C8    ret         8
end;*}

//004552D4
{*function sub_004552D4(?:?):?;
begin
 004552D4    push        ebp
 004552D5    mov         ebp,esp
 004552D7    lea         eax,[ebp+8]
 004552DA    mov         edx,dword ptr [eax+4]
 004552DD    mov         eax,dword ptr [eax]
 004552DF    xor         eax,eax
 004552E1    and         edx,7FF00000
 004552E7    cmp         edx,7FF00000
>004552ED    jne         0045530C
 004552EF    cmp         eax,0
>004552F2    jne         0045530C
 004552F4    lea         eax,[ebp+8]
 004552F7    mov         edx,dword ptr [eax+4]
 004552FA    mov         eax,dword ptr [eax]
 004552FC    and         edx,0FFFFF
 00455302    cmp         edx,0
>00455305    jne         00455310
 00455307    cmp         eax,0
>0045530A    jne         00455310
 0045530C    xor         eax,eax
>0045530E    jmp         00455312
 00455310    mov         al,1
 00455312    pop         ebp
 00455313    ret         8
end;*}

//00455318
{*function sub_00455318(?:?):?;
begin
 00455318    push        ebp
 00455319    mov         ebp,esp
 0045531B    lea         ecx,[ebp+8]
 0045531E    movzx       eax,word ptr [ecx+8]
 00455322    and         ax,7FFF
 00455326    cmp         ax,7FFF
>0045532A    jne         00455341
 0045532C    mov         eax,dword ptr [ecx]
 0045532E    mov         edx,dword ptr [ecx+4]
 00455331    and         edx,7FFFFFFF
 00455337    cmp         edx,0
>0045533A    jne         00455345
 0045533C    cmp         eax,0
>0045533F    jne         00455345
 00455341    xor         eax,eax
>00455343    jmp         00455347
 00455345    mov         al,1
 00455347    pop         ebp
 00455348    ret         0C
end;*}

//0045534C
{*procedure sub_0045534C(?:?);
begin
 0045534C    push        ebp
 0045534D    mov         ebp,esp
 0045534F    lea         eax,[ebp+8]
 00455352    mov         edx,dword ptr [eax+4]
 00455355    mov         eax,dword ptr [eax]
 00455357    xor         eax,eax
 00455359    and         edx,7FF00000
 0045535F    cmp         edx,7FF00000
>00455365    jne         00455384
 00455367    cmp         eax,0
>0045536A    jne         00455384
 0045536C    lea         eax,[ebp+8]
 0045536F    mov         edx,dword ptr [eax+4]
 00455372    mov         eax,dword ptr [eax]
 00455374    and         edx,0FFFFF
 0045537A    cmp         edx,0
>0045537D    jne         00455382
 0045537F    cmp         eax,0
>00455382    je          00455388
 00455384    xor         eax,eax
>00455386    jmp         0045538A
 00455388    mov         al,1
 0045538A    pop         ebp
 0045538B    ret         8
end;*}

//00455390
{*function sub_00455390(?:?; ?:Integer):?;
begin
 00455390    cmp         edx,eax
>00455392    jg          00455396
 00455394    mov         eax,edx
 00455396    ret
end;*}

//00455398
{*function sub_00455398(?:?; ?:Integer):?;
begin
 00455398    cmp         edx,eax
>0045539A    jl          0045539E
 0045539C    mov         eax,edx
 0045539E    ret
end;*}

//004553A0
{*function sub_004553A0(?:?):?;
begin
 004553A0    push        ebp
 004553A1    mov         ebp,esp
 004553A3    lea         eax,[ebp+8]
 004553A6    mov         edx,dword ptr [eax+4]
 004553A9    mov         eax,dword ptr [eax]
 004553AB    and         edx,7FFFFFFF
 004553B1    cmp         edx,0
>004553B4    jne         004553BF
 004553B6    cmp         eax,0
>004553B9    jne         004553BF
 004553BB    xor         eax,eax
>004553BD    jmp         004553E3
 004553BF    lea         eax,[ebp+8]
 004553C2    mov         edx,dword ptr [eax+4]
 004553C5    mov         eax,dword ptr [eax]
 004553C7    xor         eax,eax
 004553C9    and         edx,80000000
 004553CF    cmp         edx,80000000
>004553D5    jne         004553E1
 004553D7    cmp         eax,0
>004553DA    jne         004553E1
 004553DC    or          eax,0FFFFFFFF
>004553DF    jmp         004553E3
 004553E1    mov         al,1
 004553E3    pop         ebp
 004553E4    ret         8
end;*}

//004553E8
{*function sub_004553E8(?:?; ?:?; ?:?):Boolean;
begin
 004553E8    push        ebp
 004553E9    mov         ebp,esp
 004553EB    add         esp,0FFFFFFC0
 004553EE    fld         qword ptr [ebp+8]
 004553F1    fcomp       dword ptr ds:[4554C4];0:Single
 004553F7    wait
 004553F8    fnstsw      al
 004553FA    sahf
>004553FB    jne         00455490
 00455401    fld         qword ptr [ebp+18]
 00455404    fabs
 00455406    fstp        tbyte ptr [ebp-10]
 00455409    wait
 0045540A    fld         qword ptr [ebp+10]
 0045540D    fabs
 0045540F    fstp        tbyte ptr [ebp-20]
 00455412    wait
 00455413    fld         tbyte ptr [ebp-10]
 00455416    fld         tbyte ptr [ebp-20]
 00455419    fcompp
 0045541B    wait
 0045541C    fnstsw      al
 0045541E    sahf
>0045541F    jbe         00455437
 00455421    mov         eax,dword ptr [ebp-10]
 00455424    mov         dword ptr [ebp-30],eax
 00455427    mov         eax,dword ptr [ebp-0C]
 0045542A    mov         dword ptr [ebp-2C],eax
 0045542D    mov         ax,word ptr [ebp-8]
 00455431    mov         word ptr [ebp-28],ax
>00455435    jmp         0045544B
 00455437    mov         eax,dword ptr [ebp-20]
 0045543A    mov         dword ptr [ebp-30],eax
 0045543D    mov         eax,dword ptr [ebp-1C]
 00455440    mov         dword ptr [ebp-2C],eax
 00455443    mov         ax,word ptr [ebp-18]
 00455447    mov         word ptr [ebp-28],ax
 0045544B    fld         tbyte ptr [ebp-30]
 0045544E    fld         tbyte ptr ds:[4554C8];1E-12:Extended
 00455454    fmulp       st(1),st
 00455456    fld         tbyte ptr ds:[4554C8];1E-12:Extended
 0045545C    fcompp
 0045545E    wait
 0045545F    fnstsw      al
 00455461    sahf
>00455462    jae         00455475
 00455464    fld         tbyte ptr [ebp-30]
 00455467    fld         tbyte ptr ds:[4554C8];1E-12:Extended
 0045546D    fmulp       st(1),st
 0045546F    fstp        tbyte ptr [ebp-40]
 00455472    wait
>00455473    jmp         00455489
 00455475    mov         dword ptr [ebp-40],6F5088CC
 0045547C    mov         dword ptr [ebp-3C],8CBCCC09
 00455483    mov         word ptr [ebp-38],3FD7
 00455489    fld         tbyte ptr [ebp-40]
 0045548C    fstp        qword ptr [ebp+8]
 0045548F    wait
 00455490    fld         qword ptr [ebp+18]
 00455493    fcomp       qword ptr [ebp+10]
 00455496    wait
 00455497    fnstsw      al
 00455499    sahf
>0045549A    jbe         004554AE
 0045549C    fld         qword ptr [ebp+18]
 0045549F    fsub        qword ptr [ebp+10]
 004554A2    fcomp       qword ptr [ebp+8]
 004554A5    wait
 004554A6    fnstsw      al
 004554A8    sahf
 004554A9    setbe       al
>004554AC    jmp         004554BE
 004554AE    fld         qword ptr [ebp+10]
 004554B1    fsub        qword ptr [ebp+18]
 004554B4    fcomp       qword ptr [ebp+8]
 004554B7    wait
 004554B8    fnstsw      al
 004554BA    sahf
 004554BB    setbe       al
 004554BE    mov         esp,ebp
 004554C0    pop         ebp
 004554C1    ret         18
end;*}

//004554D4
{*function sub_004554D4(?:?; ?:?; ?:?):Boolean;
begin
 004554D4    push        ebp
 004554D5    mov         ebp,esp
 004554D7    fld         qword ptr [ebp+8]
 004554DA    fcomp       dword ptr ds:[455508];0:Single
 004554E0    wait
 004554E1    fnstsw      al
 004554E3    sahf
>004554E4    jne         004554F4
 004554E6    mov         dword ptr [ebp+8],812DEA11
 004554ED    mov         dword ptr [ebp+0C],3D719799
 004554F4    fld         qword ptr [ebp+10]
 004554F7    fabs
 004554F9    fcomp       qword ptr [ebp+8]
 004554FC    wait
 004554FD    fnstsw      al
 004554FF    sahf
 00455500    setbe       al
 00455503    pop         ebp
 00455504    ret         10
end;*}

//0045550C
{*function sub_0045550C(?:Integer; ?:?):?;
begin
 0045550C    push        ebx
 0045550D    push        esi
 0045550E    mov         esi,edx
 00455510    mov         ebx,eax
 00455512    cmp         esi,ebx
>00455514    jge         00455524
 00455516    mov         eax,ebx
 00455518    sub         eax,esi
 0045551A    call        Random
 0045551F    add         eax,esi
 00455521    pop         esi
 00455522    pop         ebx
 00455523    ret
 00455524    mov         eax,esi
 00455526    sub         eax,ebx
 00455528    call        Random
 0045552D    add         eax,ebx
 0045552F    pop         esi
 00455530    pop         ebx
 00455531    ret
end;*}

//00455534
{*function sub_00455534(?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 00455534    push        ebp
 00455535    mov         ebp,esp
 00455537    add         esp,0FFFFFFF8
 0045553A    mov         eax,dword ptr [ebp+18]
 0045553D    mov         dword ptr [ebp-8],eax
 00455540    mov         eax,dword ptr [ebp+1C]
 00455543    mov         dword ptr [ebp-4],eax
 00455546    fld         qword ptr [ebp+10]
 00455549    fcomp       qword ptr [ebp+8]
 0045554C    wait
 0045554D    fnstsw      al
 0045554F    sahf
>00455550    jbe         00455566
 00455552    mov         ecx,0BEA
 00455557    mov         edx,4555AC;'C:\Builds\TP\rtl\common\Math.pas'
 0045555C    mov         eax,4555FC;'Assertion failure'
 00455561    call        @Assert
 00455566    fld         qword ptr [ebp-8]
 00455569    fcomp       qword ptr [ebp+10]
 0045556C    wait
 0045556D    fnstsw      al
 0045556F    sahf
>00455570    jae         0045557E
 00455572    mov         eax,dword ptr [ebp+10]
 00455575    mov         dword ptr [ebp-8],eax
 00455578    mov         eax,dword ptr [ebp+14]
 0045557B    mov         dword ptr [ebp-4],eax
 0045557E    fld         qword ptr [ebp-8]
 00455581    fcomp       qword ptr [ebp+8]
 00455584    wait
 00455585    fnstsw      al
 00455587    sahf
>00455588    jbe         00455596
 0045558A    mov         eax,dword ptr [ebp+8]
 0045558D    mov         dword ptr [ebp-8],eax
 00455590    mov         eax,dword ptr [ebp+0C]
 00455593    mov         dword ptr [ebp-4],eax
 00455596    fld         qword ptr [ebp-8]
 00455599    pop         ecx
 0045559A    pop         ecx
 0045559B    pop         ebp
 0045559C    ret         18
end;*}

//00455620
{*function sub_00455620(?:?; ?:?):?;
begin
 00455620    push        ebp
 00455621    mov         ebp,esp
 00455623    add         esp,0FFFFFFDC
 00455626    call        Random
 0045562B    fmul        dword ptr ds:[4556AC];2:Single
 00455631    fsub        dword ptr ds:[4556B0];1:Single
 00455637    fstp        qword ptr [ebp-10]
 0045563A    wait
 0045563B    fld         qword ptr [ebp-10]
 0045563E    fmul        st,st(0)
 00455640    fstp        tbyte ptr [ebp-24]
 00455643    wait
 00455644    call        Random
 00455649    fmul        dword ptr ds:[4556AC];2:Single
 0045564F    fsub        dword ptr ds:[4556B0];1:Single
 00455655    fmul        st,st(0)
 00455657    fld         tbyte ptr [ebp-24]
 0045565A    faddp       st(1),st
 0045565C    fstp        qword ptr [ebp-18]
 0045565F    wait
 00455660    fld         qword ptr [ebp-18]
 00455663    fcomp       dword ptr ds:[4556B0];1:Single
 00455669    wait
 0045566A    fnstsw      al
 0045566C    sahf
>0045566D    jae         00455626
 0045566F    fld         qword ptr [ebp-18]
 00455672    add         esp,0FFFFFFF4
 00455675    fstp        tbyte ptr [esp]
 00455678    wait
 00455679    call        Ln
 0045567E    fmul        dword ptr ds:[4556B4];-2:Single
 00455684    fdiv        qword ptr [ebp-18]
 00455687    add         esp,0FFFFFFF4
 0045568A    fstp        tbyte ptr [esp]
 0045568D    wait
 0045568E    call        Sqrt
 00455693    fmul        qword ptr [ebp-10]
 00455696    fmul        qword ptr [ebp+8]
 00455699    fadd        qword ptr [ebp+10]
 0045569C    fstp        qword ptr [ebp-8]
 0045569F    wait
 004556A0    fld         qword ptr [ebp-8]
 004556A3    mov         esp,ebp
 004556A5    pop         ebp
 004556A6    ret         10
end;*}

Initialization
//00780318
{*
 00780318    sub         dword ptr ds:[792FF4],1
>0078031F    jae         00780349
 00780321    mov         dword ptr ds:[792FF8],0;gvar_00792FF8
 0078032B    mov         dword ptr ds:[792FFC],80000000;gvar_00792FFC
 00780335    mov         dword ptr ds:[793000],0FFFFFFFF;gvar_00793000
 0078033F    mov         dword ptr ds:[793004],7FFFFFFF;gvar_00793004
 00780349    ret
*}
Finalization
end.