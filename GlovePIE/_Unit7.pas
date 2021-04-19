//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit7;

interface

uses
  SysUtils, Classes;

    procedure FreeEncodings;//00429504
    function GetASCII:TEncoding;//00429574
    function GetBigEndianUnicode:TEncoding;//004295E4
    procedure GetBufferEncoding(var AEncoding:TEncoding);//0042961C
    function ContainsPreamble(const Buffer:TBytes; const Signature:TBytes):Boolean;//00429638
    procedure GetBufferEncoding(var AEncoding:TEncoding; ADefaultEncoding:TEncoding);//00429694
    procedure GetByteCount(const Chars:TCharArray);//004297B0
    //function GetByteCount(?:?; ?:?; ?:?):?;//004297CC
    function GetByteCount(S:string):Integer;//00429878
    procedure GetByteCount(S:string; CharIndex:Integer; CharCount:Integer);//004298A0
    //procedure GetBytes(?:?; ?:?; ?:?; ?:?);//00429950
    procedure GetBytes(const Chars:TCharArray);//004299A8
    //procedure GetBytes(?:?; ?:?; ?:?; ?:?; ?:?);//004299F0
    procedure GetBytes(const S:UnicodeString);//00429B58
    //procedure GetBytes(?:?; ?:?; ?:?; ?:?; ?:?);//00429BA8
    procedure GetCharCount(const Bytes:TBytes);//00429CF4
    procedure GetCharCount(const Bytes:TBytes; ByteIndex:Integer; ByteCount:Integer);//00429D10
    //procedure GetChars(?:?; ?:?);//00429DDC
    procedure GetChars(const Bytes:TBytes; ByteIndex:Integer; ByteCount:Integer);//00429E48
    procedure GetChars(const Bytes:TBytes; ByteIndex:Integer; ByteCount:Integer; const Chars:TCharArray; CharIndex:Integer);//00429F48
    procedure sub_0042A094;//0042A094
    function GetDefault:TEncoding;//0042A098
    function GetEncoding:TEncoding;//0042A0DC
    function GetEncoding:TEncoding;//0042A13C
    //procedure sub_0042A1B8(?:?);//0042A1B8
    procedure GetString(const Bytes:TBytes);//0042A1C4
    procedure GetString(const Bytes:TBytes; ByteIndex:Integer; ByteCount:Integer);//0042A1E8
    function GetUnicode:TEncoding;//0042A258
    function GetUTF7:TEncoding;//0042A290
    function GetUTF8:TEncoding;//0042A2C8
    function IsStandardEncoding:Boolean;//0042A300
    constructor sub_0042A344;//0042A344
    constructor Create;//0042A388
    constructor Create(WCharToMBFlags:Integer; MBToWCharFlags:Integer);//0042A3D0
    procedure Clone;//0042A45C
    //procedure sub_0042A480(?:?);//0042A480
    //procedure sub_0042A498(?:?; ?:?; ?:?);//0042A498
    //procedure sub_0042A4BC(?:?);//0042A4BC
    //procedure sub_0042A4D0(?:?; ?:?; ?:?);//0042A4D0
    //function sub_0042A4F0:?;//0042A4F0
    //procedure sub_0042A4F4(?:?);//0042A4F4
    function GetMaxByteCount(CharCount:Integer):Integer;//0042A534
    function GetMaxCharCount(ByteCount:Integer):Integer;//0042A53C
    //procedure GetPreamble(?:?);//0042A540
    constructor Create();//0042A55C
    procedure Clone;//0042A59C
    procedure GetMaxByteCount(CharCount:Integer);//0042A5AC
    function GetMaxCharCount(ByteCount:Integer):Integer;//0042A5B4
    constructor Create();//0042A5B8
    procedure Clone;//0042A5FC
    function GetMaxByteCount(CharCount:Integer):Integer;//0042A60C
    function GetMaxCharCount(ByteCount:Integer):Integer;//0042A614
    //procedure GetPreamble(?:?);//0042A618
    constructor Create();//0042A6A0
    procedure Clone;//0042A6CC
    //procedure sub_0042A6DC(?:?; ?:?);//0042A6DC
    //function sub_0042A6E4(?:?; ?:?; ?:?):?;//0042A6E4
    //procedure sub_0042A700(?:?; ?:?);//0042A700
    //function sub_0042A70C(?:?):?;//0042A70C
    //function sub_0042A72C:?;//0042A72C
    //procedure sub_0042A734(?:?);//0042A734
    procedure GetMaxByteCount(CharCount:Integer);//0042A774
    procedure GetMaxCharCount(ByteCount:Integer);//0042A77C
    //procedure GetPreamble(?:?);//0042A78C
    procedure Clone;//0042A80C
    procedure sub_0042A81C;//0042A81C
    //function sub_0042A850(?:?; ?:?; ?:?):?;//0042A850
    //function sub_0042A88C:?;//0042A88C
    //procedure sub_0042A894(?:?);//0042A894
    //procedure GetPreamble(?:?);//0042A8F0
    function BytesOf(const Val:RawByteString):TBytes;//0042A970

implementation

//00429504
procedure TEncoding.FreeEncodings;
begin
{*
 00429504    mov         eax,[00790DF8];gvar_00790DF8
 00429509    xor         edx,edx
 0042950B    mov         dword ptr ds:[790DF8],edx;gvar_00790DF8
 00429511    call        TObject.Free
 00429516    mov         eax,[00790DF0];gvar_00790DF0
 0042951B    xor         edx,edx
 0042951D    mov         dword ptr ds:[790DF0],edx;gvar_00790DF0
 00429523    call        TObject.Free
 00429528    mov         eax,[00790E00];gvar_00790E00
 0042952D    xor         edx,edx
 0042952F    mov         dword ptr ds:[790E00],edx;gvar_00790E00
 00429535    call        TObject.Free
 0042953A    mov         eax,[00790E04];gvar_00790E04
 0042953F    xor         edx,edx
 00429541    mov         dword ptr ds:[790E04],edx;gvar_00790E04
 00429547    call        TObject.Free
 0042954C    mov         eax,[00790DFC];gvar_00790DFC
 00429551    xor         edx,edx
 00429553    mov         dword ptr ds:[790DFC],edx;gvar_00790DFC
 00429559    call        TObject.Free
 0042955E    mov         eax,[00790DF4];gvar_00790DF4
 00429563    xor         edx,edx
 00429565    mov         dword ptr ds:[790DF4],edx;gvar_00790DF4
 0042956B    call        TObject.Free
 00429570    ret
*}
end;

//00429574
function TEncoding.GetASCII:TEncoding;
begin
{*
 00429574    push        ebx
 00429575    add         esp,0FFFFFFEC
 00429578    cmp         dword ptr ds:[790DF0],0;gvar_00790DF0
>0042957F    jne         004295D9
 00429581    push        esp
 00429582    push        4E9F
 00429587    call        kernel32.GetCPInfo
 0042958C    test        eax,eax
>0042958E    je          004295A9
 00429590    push        0
 00429592    push        0
 00429594    mov         ecx,4E9F
 00429599    mov         dl,1
 0042959B    mov         eax,[0041CB54];TMBCSEncoding
 004295A0    call        TMBCSEncoding.Create
 004295A5    mov         ebx,eax
>004295A7    jmp         004295C0
 004295A9    push        0
 004295AB    push        0
 004295AD    mov         ecx,1B5
 004295B2    mov         dl,1
 004295B4    mov         eax,[0041CB54];TMBCSEncoding
 004295B9    call        TMBCSEncoding.Create
 004295BE    mov         ebx,eax
 004295C0    mov         eax,790DF0;gvar_00790DF0
 004295C5    xor         ecx,ecx
 004295C7    mov         edx,ebx
 004295C9    call        InterlockedCompareExchangePointer
 004295CE    test        eax,eax
>004295D0    je          004295D9
 004295D2    mov         eax,ebx
 004295D4    call        TObject.Free
 004295D9    mov         eax,[00790DF0];gvar_00790DF0
 004295DE    add         esp,14
 004295E1    pop         ebx
 004295E2    ret
*}
end;

//004295E4
function TEncoding.GetBigEndianUnicode:TEncoding;
begin
{*
 004295E4    push        ebx
 004295E5    cmp         dword ptr ds:[790DF4],0;gvar_00790DF4
>004295EC    jne         00429615
 004295EE    mov         dl,1
 004295F0    mov         eax,[0041D390];TBigEndianUnicodeEncoding
 004295F5    call        TUnicodeEncoding.Create
 004295FA    mov         ebx,eax
 004295FC    mov         eax,790DF4;gvar_00790DF4
 00429601    xor         ecx,ecx
 00429603    mov         edx,ebx
 00429605    call        InterlockedCompareExchangePointer
 0042960A    test        eax,eax
>0042960C    je          00429615
 0042960E    mov         eax,ebx
 00429610    call        TObject.Free
 00429615    mov         eax,[00790DF4];gvar_00790DF4
 0042961A    pop         ebx
 0042961B    ret
*}
end;

//0042961C
procedure TEncoding.GetBufferEncoding(var AEncoding:TEncoding);
begin
{*
 0042961C    push        ebx
 0042961D    push        esi
 0042961E    mov         esi,edx
 00429620    mov         ebx,eax
 00429622    call        TEncoding.GetDefault
 00429627    mov         ecx,eax
 00429629    mov         edx,esi
 0042962B    mov         eax,ebx
 0042962D    call        TEncoding.GetBufferEncoding
 00429632    pop         esi
 00429633    pop         ebx
 00429634    ret
*}
end;

//00429638
function ContainsPreamble(const Buffer:TBytes; const Signature:TBytes):Boolean;
begin
{*
 00429638    push        ebp
 00429639    mov         ebp,esp
 0042963B    push        ecx
 0042963C    push        ebx
 0042963D    push        esi
 0042963E    push        edi
 0042963F    mov         esi,edx
 00429641    mov         edi,eax
 00429643    mov         byte ptr [ebp-1],1
 00429647    mov         eax,edi
 00429649    call        @DynArrayLength
 0042964E    mov         ebx,eax
 00429650    mov         eax,esi
 00429652    call        @DynArrayLength
 00429657    cmp         ebx,eax
>00429659    jl          00429684
 0042965B    mov         eax,esi
 0042965D    call        @DynArrayLength
 00429662    mov         edx,eax
 00429664    test        edx,edx
>00429666    jle         00429688
 00429668    mov         eax,1
 0042966D    movzx       ecx,byte ptr [edi+eax-1]
 00429672    cmp         cl,byte ptr [esi+eax-1]
>00429676    je          0042967E
 00429678    mov         byte ptr [ebp-1],0
>0042967C    jmp         00429688
 0042967E    inc         eax
 0042967F    dec         edx
>00429680    jne         0042966D
>00429682    jmp         00429688
 00429684    mov         byte ptr [ebp-1],0
 00429688    movzx       eax,byte ptr [ebp-1]
 0042968C    pop         edi
 0042968D    pop         esi
 0042968E    pop         ebx
 0042968F    pop         ecx
 00429690    pop         ebp
 00429691    ret
*}
end;

//00429694
procedure TEncoding.GetBufferEncoding(var AEncoding:TEncoding; ADefaultEncoding:TEncoding);
begin
{*
 00429694    push        ebp
 00429695    mov         ebp,esp
 00429697    push        0
 00429699    push        0
 0042969B    push        0
 0042969D    push        0
 0042969F    push        0
 004296A1    push        0
 004296A3    push        ebx
 004296A4    push        esi
 004296A5    push        edi
 004296A6    mov         dword ptr [ebp-8],ecx
 004296A9    mov         ebx,edx
 004296AB    mov         edi,eax
 004296AD    xor         eax,eax
 004296AF    push        ebp
 004296B0    push        4297A0
 004296B5    push        dword ptr fs:[eax]
 004296B8    mov         dword ptr fs:[eax],esp
 004296BB    xor         esi,esi
 004296BD    cmp         dword ptr [ebx],0
>004296C0    jne         0042974F
 004296C6    call        TEncoding.GetUTF8
 004296CB    lea         edx,[ebp-0C]
 004296CE    mov         ecx,dword ptr [eax]
 004296D0    call        dword ptr [ecx+24]
 004296D3    mov         edx,dword ptr [ebp-0C]
 004296D6    mov         eax,edi
 004296D8    call        ContainsPreamble
 004296DD    test        al,al
>004296DF    je          004296EA
 004296E1    call        TEncoding.GetUTF8
 004296E6    mov         dword ptr [ebx],eax
>004296E8    jmp         00429739
 004296EA    call        TEncoding.GetUnicode
 004296EF    lea         edx,[ebp-10]
 004296F2    mov         ecx,dword ptr [eax]
 004296F4    call        dword ptr [ecx+24]
 004296F7    mov         edx,dword ptr [ebp-10]
 004296FA    mov         eax,edi
 004296FC    call        ContainsPreamble
 00429701    test        al,al
>00429703    je          0042970E
 00429705    call        TEncoding.GetUnicode
 0042970A    mov         dword ptr [ebx],eax
>0042970C    jmp         00429739
 0042970E    call        TEncoding.GetBigEndianUnicode
 00429713    lea         edx,[ebp-14]
 00429716    mov         ecx,dword ptr [eax]
 00429718    call        dword ptr [ecx+24]
 0042971B    mov         edx,dword ptr [ebp-14]
 0042971E    mov         eax,edi
 00429720    call        ContainsPreamble
 00429725    test        al,al
>00429727    je          00429732
 00429729    call        TEncoding.GetBigEndianUnicode
 0042972E    mov         dword ptr [ebx],eax
>00429730    jmp         00429739
 00429732    mov         eax,dword ptr [ebp-8]
 00429735    mov         dword ptr [ebx],eax
>00429737    jmp         00429771
 00429739    lea         edx,[ebp-18]
 0042973C    mov         eax,dword ptr [ebx]
 0042973E    mov         ecx,dword ptr [eax]
 00429740    call        dword ptr [ecx+24]
 00429743    mov         eax,dword ptr [ebp-18]
 00429746    call        @DynArrayLength
 0042974B    mov         esi,eax
>0042974D    jmp         00429771
 0042974F    lea         edx,[ebp-4]
 00429752    mov         eax,dword ptr [ebx]
 00429754    mov         ecx,dword ptr [eax]
 00429756    call        dword ptr [ecx+24]
 00429759    mov         edx,dword ptr [ebp-4]
 0042975C    mov         eax,edi
 0042975E    call        ContainsPreamble
 00429763    test        al,al
>00429765    je          00429771
 00429767    mov         eax,dword ptr [ebp-4]
 0042976A    call        @DynArrayLength
 0042976F    mov         esi,eax
 00429771    xor         eax,eax
 00429773    pop         edx
 00429774    pop         ecx
 00429775    pop         ecx
 00429776    mov         dword ptr fs:[eax],edx
 00429779    push        4297A7
 0042977E    lea         eax,[ebp-18]
 00429781    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00429787    mov         ecx,4
 0042978C    call        @FinalizeArray
 00429791    lea         eax,[ebp-4]
 00429794    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0042979A    call        @DynArrayClear
 0042979F    ret
>004297A0    jmp         @HandleFinally
>004297A5    jmp         0042977E
 004297A7    mov         eax,esi
 004297A9    pop         edi
 004297AA    pop         esi
 004297AB    pop         ebx
 004297AC    mov         esp,ebp
 004297AE    pop         ebp
 004297AF    ret
*}
end;

//004297B0
procedure TEncoding.GetByteCount(const Chars:TCharArray);
begin
{*
 004297B0    push        ebx
 004297B1    push        esi
 004297B2    mov         esi,edx
 004297B4    mov         ebx,eax
 004297B6    mov         eax,esi
 004297B8    call        @DynArrayLength
 004297BD    push        eax
 004297BE    xor         ecx,ecx
 004297C0    mov         edx,esi
 004297C2    mov         eax,ebx
 004297C4    call        TEncoding.GetByteCount
 004297C9    pop         esi
 004297CA    pop         ebx
 004297CB    ret
*}
end;

//004297CC
{*function TEncoding.GetByteCount(?:?; ?:?; ?:?):?;
begin
 004297CC    push        ebp
 004297CD    mov         ebp,esp
 004297CF    add         esp,0FFFFFFF4
 004297D2    push        ebx
 004297D3    push        esi
 004297D4    push        edi
 004297D5    mov         esi,ecx
 004297D7    mov         dword ptr [ebp-4],edx
 004297DA    mov         edi,eax
 004297DC    mov         ebx,dword ptr [ebp+8]
 004297DF    test        esi,esi
>004297E1    jge         00429807
 004297E3    mov         dword ptr [ebp-0C],esi
 004297E6    mov         byte ptr [ebp-8],0
 004297EA    lea         eax,[ebp-0C]
 004297ED    push        eax
 004297EE    push        0
 004297F0    mov         ecx,dword ptr ds:[78D704];^SResString104:TResStringRec
 004297F6    mov         dl,1
 004297F8    mov         eax,[0041C500];EEncodingError
 004297FD    call        Exception.CreateResFmt;EEncodingError.Create
 00429802    call        @RaiseExcept
 00429807    test        ebx,ebx
>00429809    jge         0042982F
 0042980B    mov         dword ptr [ebp-0C],ebx
 0042980E    mov         byte ptr [ebp-8],0
 00429812    lea         eax,[ebp-0C]
 00429815    push        eax
 00429816    push        0
 00429818    mov         ecx,dword ptr ds:[78D258];^SResString106:TResStringRec
 0042981E    mov         dl,1
 00429820    mov         eax,[0041C500];EEncodingError
 00429825    call        Exception.CreateResFmt;EEncodingError.Create
 0042982A    call        @RaiseExcept
 0042982F    mov         eax,dword ptr [ebp-4]
 00429832    call        @DynArrayLength
 00429837    sub         eax,esi
 00429839    cmp         ebx,eax
>0042983B    jle         00429861
 0042983D    mov         dword ptr [ebp-0C],ebx
 00429840    mov         byte ptr [ebp-8],0
 00429844    lea         eax,[ebp-0C]
 00429847    push        eax
 00429848    push        0
 0042984A    mov         ecx,dword ptr ds:[78D258];^SResString106:TResStringRec
 00429850    mov         dl,1
 00429852    mov         eax,[0041C500];EEncodingError
 00429857    call        Exception.CreateResFmt;EEncodingError.Create
 0042985C    call        @RaiseExcept
 00429861    mov         eax,dword ptr [ebp-4]
 00429864    lea         edx,[eax+esi*2]
 00429867    mov         ecx,ebx
 00429869    mov         eax,edi
 0042986B    mov         ebx,dword ptr [eax]
 0042986D    call        dword ptr [ebx];@AbstractError
 0042986F    pop         edi
 00429870    pop         esi
 00429871    pop         ebx
 00429872    mov         esp,ebp
 00429874    pop         ebp
 00429875    ret         4
end;*}

//00429878
function TEncoding.GetByteCount(S:string):Integer;
begin
{*
 00429878    push        ebx
 00429879    push        esi
 0042987A    push        edi
 0042987B    mov         edi,edx
 0042987D    mov         esi,eax
 0042987F    mov         ebx,edi
 00429881    test        ebx,ebx
>00429883    je          0042988A
 00429885    sub         ebx,4
 00429888    mov         ebx,dword ptr [ebx]
 0042988A    mov         eax,edi
 0042988C    call        @UStrToPWChar
 00429891    mov         edx,eax
 00429893    mov         ecx,ebx
 00429895    mov         eax,esi
 00429897    mov         ebx,dword ptr [eax]
 00429899    call        dword ptr [ebx]
 0042989B    pop         edi
 0042989C    pop         esi
 0042989D    pop         ebx
 0042989E    ret
*}
end;

//004298A0
procedure TEncoding.GetByteCount(S:string; CharIndex:Integer; CharCount:Integer);
begin
{*
 004298A0    push        ebp
 004298A1    mov         ebp,esp
 004298A3    add         esp,0FFFFFFF4
 004298A6    push        ebx
 004298A7    push        esi
 004298A8    mov         dword ptr [ebp-4],ecx
 004298AB    mov         esi,dword ptr [ebp+8]
 004298AE    cmp         dword ptr [ebp-4],1
>004298B2    jge         004298DB
 004298B4    mov         eax,dword ptr [ebp-4]
 004298B7    mov         dword ptr [ebp-0C],eax
 004298BA    mov         byte ptr [ebp-8],0
 004298BE    lea         eax,[ebp-0C]
 004298C1    push        eax
 004298C2    push        0
 004298C4    mov         ecx,dword ptr ds:[78D704];^SResString104:TResStringRec
 004298CA    mov         dl,1
 004298CC    mov         eax,[0041C500];EEncodingError
 004298D1    call        Exception.CreateResFmt;EEncodingError.Create
 004298D6    call        @RaiseExcept
 004298DB    test        esi,esi
>004298DD    jge         00429903
 004298DF    mov         dword ptr [ebp-0C],esi
 004298E2    mov         byte ptr [ebp-8],0
 004298E6    lea         eax,[ebp-0C]
 004298E9    push        eax
 004298EA    push        0
 004298EC    mov         ecx,dword ptr ds:[78D258];^SResString106:TResStringRec
 004298F2    mov         dl,1
 004298F4    mov         eax,[0041C500];EEncodingError
 004298F9    call        Exception.CreateResFmt;EEncodingError.Create
 004298FE    call        @RaiseExcept
 00429903    mov         ecx,edx
 00429905    test        ecx,ecx
>00429907    je          0042990E
 00429909    sub         ecx,4
 0042990C    mov         ecx,dword ptr [ecx]
 0042990E    sub         ecx,dword ptr [ebp-4]
 00429911    inc         ecx
 00429912    cmp         esi,ecx
>00429914    jle         0042993A
 00429916    mov         dword ptr [ebp-0C],esi
 00429919    mov         byte ptr [ebp-8],0
 0042991D    lea         eax,[ebp-0C]
 00429920    push        eax
 00429921    push        0
 00429923    mov         ecx,dword ptr ds:[78D258];^SResString106:TResStringRec
 00429929    mov         dl,1
 0042992B    mov         eax,[0041C500];EEncodingError
 00429930    call        Exception.CreateResFmt;EEncodingError.Create
 00429935    call        @RaiseExcept
 0042993A    mov         ecx,dword ptr [ebp-4]
 0042993D    lea         edx,[edx+ecx*2-2]
 00429941    mov         ecx,esi
 00429943    mov         ebx,dword ptr [eax]
 00429945    call        dword ptr [ebx];@AbstractError
 00429947    pop         esi
 00429948    pop         ebx
 00429949    mov         esp,ebp
 0042994B    pop         ebp
 0042994C    ret         4
*}
end;

//00429950
{*procedure TEncoding.GetBytes(?:?; ?:?; ?:?; ?:?);
begin
 00429950    push        ebp
 00429951    mov         ebp,esp
 00429953    push        ecx
 00429954    push        ebx
 00429955    push        esi
 00429956    push        edi
 00429957    mov         edi,ecx
 00429959    mov         esi,edx
 0042995B    mov         ebx,eax
 0042995D    mov         eax,dword ptr [ebp+0C]
 00429960    push        eax
 00429961    mov         ecx,edi
 00429963    mov         edx,esi
 00429965    mov         eax,ebx
 00429967    call        TEncoding.GetByteCount
 0042996C    mov         dword ptr [ebp-4],eax
 0042996F    mov         eax,dword ptr [ebp-4]
 00429972    push        eax
 00429973    mov         eax,dword ptr [ebp+8]
 00429976    mov         ecx,1
 0042997B    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00429981    call        @DynArraySetLength
 00429986    add         esp,4
 00429989    mov         eax,dword ptr [ebp+0C]
 0042998C    push        eax
 0042998D    mov         eax,dword ptr [ebp+8]
 00429990    mov         eax,dword ptr [eax]
 00429992    push        eax
 00429993    push        0
 00429995    mov         ecx,edi
 00429997    mov         edx,esi
 00429999    mov         eax,ebx
 0042999B    call        TEncoding.GetBytes
 004299A0    pop         edi
 004299A1    pop         esi
 004299A2    pop         ebx
 004299A3    pop         ecx
 004299A4    pop         ebp
 004299A5    ret         8
end;*}

//004299A8
procedure TEncoding.GetBytes(const Chars:TCharArray);
begin
{*
 004299A8    push        ebx
 004299A9    push        esi
 004299AA    push        edi
 004299AB    push        ebp
 004299AC    mov         edi,ecx
 004299AE    mov         esi,edx
 004299B0    mov         ebx,eax
 004299B2    mov         edx,esi
 004299B4    mov         eax,ebx
 004299B6    call        TEncoding.GetByteCount
 004299BB    mov         ebp,eax
 004299BD    push        ebp
 004299BE    mov         eax,edi
 004299C0    mov         ecx,1
 004299C5    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 004299CB    call        @DynArraySetLength
 004299D0    add         esp,4
 004299D3    mov         eax,esi
 004299D5    call        @DynArrayLength
 004299DA    push        eax
 004299DB    mov         eax,dword ptr [edi]
 004299DD    push        eax
 004299DE    push        0
 004299E0    xor         ecx,ecx
 004299E2    mov         edx,esi
 004299E4    mov         eax,ebx
 004299E6    call        TEncoding.GetBytes
 004299EB    pop         ebp
 004299EC    pop         edi
 004299ED    pop         esi
 004299EE    pop         ebx
 004299EF    ret
*}
end;

//004299F0
{*procedure TEncoding.GetBytes(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 004299F0    push        ebp
 004299F1    mov         ebp,esp
 004299F3    add         esp,0FFFFFFEC
 004299F6    push        ebx
 004299F7    push        esi
 004299F8    push        edi
 004299F9    mov         edi,ecx
 004299FB    mov         dword ptr [ebp-8],edx
 004299FE    mov         dword ptr [ebp-4],eax
 00429A01    mov         esi,dword ptr [ebp+8]
 00429A04    mov         ebx,dword ptr [ebp+10]
 00429A07    cmp         dword ptr [ebp-8],0
>00429A0B    jne         00429A28
 00429A0D    test        ebx,ebx
>00429A0F    je          00429A28
 00429A11    mov         ecx,dword ptr ds:[78CFE0];^SResString102:TResStringRec
 00429A17    mov         dl,1
 00429A19    mov         eax,[0041C500];EEncodingError
 00429A1E    call        Exception.CreateRes;EEncodingError.Create
 00429A23    call        @RaiseExcept
 00429A28    cmp         dword ptr [ebp+0C],0
>00429A2C    jne         00429A49
 00429A2E    test        ebx,ebx
>00429A30    je          00429A49
 00429A32    mov         ecx,dword ptr ds:[78CCA0];^SResString103:TResStringRec
 00429A38    mov         dl,1
 00429A3A    mov         eax,[0041C500];EEncodingError
 00429A3F    call        Exception.CreateRes;EEncodingError.Create
 00429A44    call        @RaiseExcept
 00429A49    test        edi,edi
>00429A4B    jge         00429A71
 00429A4D    mov         dword ptr [ebp-14],edi
 00429A50    mov         byte ptr [ebp-10],0
 00429A54    lea         eax,[ebp-14]
 00429A57    push        eax
 00429A58    push        0
 00429A5A    mov         ecx,dword ptr ds:[78D704];^SResString104:TResStringRec
 00429A60    mov         dl,1
 00429A62    mov         eax,[0041C500];EEncodingError
 00429A67    call        Exception.CreateResFmt;EEncodingError.Create
 00429A6C    call        @RaiseExcept
 00429A71    test        ebx,ebx
>00429A73    jge         00429A99
 00429A75    mov         dword ptr [ebp-14],ebx
 00429A78    mov         byte ptr [ebp-10],0
 00429A7C    lea         eax,[ebp-14]
 00429A7F    push        eax
 00429A80    push        0
 00429A82    mov         ecx,dword ptr ds:[78D258];^SResString106:TResStringRec
 00429A88    mov         dl,1
 00429A8A    mov         eax,[0041C500];EEncodingError
 00429A8F    call        Exception.CreateResFmt;EEncodingError.Create
 00429A94    call        @RaiseExcept
 00429A99    mov         eax,dword ptr [ebp-8]
 00429A9C    call        @DynArrayLength
 00429AA1    sub         eax,edi
 00429AA3    cmp         ebx,eax
>00429AA5    jle         00429ACB
 00429AA7    mov         dword ptr [ebp-14],ebx
 00429AAA    mov         byte ptr [ebp-10],0
 00429AAE    lea         eax,[ebp-14]
 00429AB1    push        eax
 00429AB2    push        0
 00429AB4    mov         ecx,dword ptr ds:[78D258];^SResString106:TResStringRec
 00429ABA    mov         dl,1
 00429ABC    mov         eax,[0041C500];EEncodingError
 00429AC1    call        Exception.CreateResFmt;EEncodingError.Create
 00429AC6    call        @RaiseExcept
 00429ACB    mov         eax,dword ptr [ebp+0C]
 00429ACE    call        @DynArrayLength
 00429AD3    mov         dword ptr [ebp-0C],eax
 00429AD6    test        esi,esi
>00429AD8    jl          00429ADF
 00429ADA    cmp         esi,dword ptr [ebp-0C]
>00429ADD    jle         00429B03
 00429ADF    mov         dword ptr [ebp-14],esi
 00429AE2    mov         byte ptr [ebp-10],0
 00429AE6    lea         eax,[ebp-14]
 00429AE9    push        eax
 00429AEA    push        0
 00429AEC    mov         ecx,dword ptr ds:[78D4E4];^SResString107:TResStringRec
 00429AF2    mov         dl,1
 00429AF4    mov         eax,[0041C500];EEncodingError
 00429AF9    call        Exception.CreateResFmt;EEncodingError.Create
 00429AFE    call        @RaiseExcept
 00429B03    push        ebx
 00429B04    mov         ecx,edi
 00429B06    mov         edx,dword ptr [ebp-8]
 00429B09    mov         eax,dword ptr [ebp-4]
 00429B0C    call        TEncoding.GetByteCount
 00429B11    mov         edx,dword ptr [ebp-0C]
 00429B14    sub         edx,esi
 00429B16    cmp         eax,edx
>00429B18    jle         00429B31
 00429B1A    mov         ecx,dword ptr ds:[78CCA0];^SResString103:TResStringRec
 00429B20    mov         dl,1
 00429B22    mov         eax,[0041C500];EEncodingError
 00429B27    call        Exception.CreateRes;EEncodingError.Create
 00429B2C    call        @RaiseExcept
 00429B31    mov         eax,dword ptr [ebp+0C]
 00429B34    add         eax,esi
 00429B36    push        eax
 00429B37    mov         eax,dword ptr [ebp-0C]
 00429B3A    sub         eax,esi
 00429B3C    push        eax
 00429B3D    mov         eax,dword ptr [ebp-8]
 00429B40    lea         edx,[eax+edi*2]
 00429B43    mov         ecx,ebx
 00429B45    mov         eax,dword ptr [ebp-4]
 00429B48    mov         ebx,dword ptr [eax]
 00429B4A    call        dword ptr [ebx+4];@AbstractError
 00429B4D    pop         edi
 00429B4E    pop         esi
 00429B4F    pop         ebx
 00429B50    mov         esp,ebp
 00429B52    pop         ebp
 00429B53    ret         0C
end;*}

//00429B58
procedure TEncoding.GetBytes(const S:UnicodeString);
begin
{*
 00429B58    push        ebx
 00429B59    push        esi
 00429B5A    push        edi
 00429B5B    push        ebp
 00429B5C    mov         edi,ecx
 00429B5E    mov         esi,edx
 00429B60    mov         ebx,eax
 00429B62    mov         edx,esi
 00429B64    mov         eax,ebx
 00429B66    call        TEncoding.GetByteCount
 00429B6B    mov         ebp,eax
 00429B6D    push        ebp
 00429B6E    mov         eax,edi
 00429B70    mov         ecx,1
 00429B75    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00429B7B    call        @DynArraySetLength
 00429B80    add         esp,4
 00429B83    mov         eax,esi
 00429B85    test        eax,eax
>00429B87    je          00429B8E
 00429B89    sub         eax,4
 00429B8C    mov         eax,dword ptr [eax]
 00429B8E    push        eax
 00429B8F    mov         eax,dword ptr [edi]
 00429B91    push        eax
 00429B92    push        0
 00429B94    mov         ecx,1
 00429B99    mov         edx,esi
 00429B9B    mov         eax,ebx
 00429B9D    call        TEncoding.GetBytes
 00429BA2    pop         ebp
 00429BA3    pop         edi
 00429BA4    pop         esi
 00429BA5    pop         ebx
 00429BA6    ret
*}
end;

//00429BA8
{*procedure TEncoding.GetBytes(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 00429BA8    push        ebp
 00429BA9    mov         ebp,esp
 00429BAB    add         esp,0FFFFFFEC
 00429BAE    push        ebx
 00429BAF    push        esi
 00429BB0    push        edi
 00429BB1    mov         edi,ecx
 00429BB3    mov         dword ptr [ebp-8],edx
 00429BB6    mov         dword ptr [ebp-4],eax
 00429BB9    mov         esi,dword ptr [ebp+8]
 00429BBC    mov         ebx,dword ptr [ebp+10]
 00429BBF    cmp         dword ptr [ebp+0C],0
>00429BC3    jne         00429BE0
 00429BC5    test        ebx,ebx
>00429BC7    je          00429BE0
 00429BC9    mov         ecx,dword ptr ds:[78CFE0];^SResString102:TResStringRec
 00429BCF    mov         dl,1
 00429BD1    mov         eax,[0041C500];EEncodingError
 00429BD6    call        Exception.CreateRes;EEncodingError.Create
 00429BDB    call        @RaiseExcept
 00429BE0    cmp         edi,1
>00429BE3    jge         00429C09
 00429BE5    mov         dword ptr [ebp-14],edi
 00429BE8    mov         byte ptr [ebp-10],0
 00429BEC    lea         eax,[ebp-14]
 00429BEF    push        eax
 00429BF0    push        0
 00429BF2    mov         ecx,dword ptr ds:[78D704];^SResString104:TResStringRec
 00429BF8    mov         dl,1
 00429BFA    mov         eax,[0041C500];EEncodingError
 00429BFF    call        Exception.CreateResFmt;EEncodingError.Create
 00429C04    call        @RaiseExcept
 00429C09    test        ebx,ebx
>00429C0B    jge         00429C31
 00429C0D    mov         dword ptr [ebp-14],ebx
 00429C10    mov         byte ptr [ebp-10],0
 00429C14    lea         eax,[ebp-14]
 00429C17    push        eax
 00429C18    push        0
 00429C1A    mov         ecx,dword ptr ds:[78D258];^SResString106:TResStringRec
 00429C20    mov         dl,1
 00429C22    mov         eax,[0041C500];EEncodingError
 00429C27    call        Exception.CreateResFmt;EEncodingError.Create
 00429C2C    call        @RaiseExcept
 00429C31    mov         eax,dword ptr [ebp-8]
 00429C34    test        eax,eax
>00429C36    je          00429C3D
 00429C38    sub         eax,4
 00429C3B    mov         eax,dword ptr [eax]
 00429C3D    sub         eax,edi
 00429C3F    inc         eax
 00429C40    cmp         ebx,eax
>00429C42    jle         00429C68
 00429C44    mov         dword ptr [ebp-14],ebx
 00429C47    mov         byte ptr [ebp-10],0
 00429C4B    lea         eax,[ebp-14]
 00429C4E    push        eax
 00429C4F    push        0
 00429C51    mov         ecx,dword ptr ds:[78D258];^SResString106:TResStringRec
 00429C57    mov         dl,1
 00429C59    mov         eax,[0041C500];EEncodingError
 00429C5E    call        Exception.CreateResFmt;EEncodingError.Create
 00429C63    call        @RaiseExcept
 00429C68    mov         eax,dword ptr [ebp+0C]
 00429C6B    call        @DynArrayLength
 00429C70    mov         dword ptr [ebp-0C],eax
 00429C73    test        esi,esi
>00429C75    jl          00429C7C
 00429C77    cmp         esi,dword ptr [ebp-0C]
>00429C7A    jle         00429CA0
 00429C7C    mov         dword ptr [ebp-14],esi
 00429C7F    mov         byte ptr [ebp-10],0
 00429C83    lea         eax,[ebp-14]
 00429C86    push        eax
 00429C87    push        0
 00429C89    mov         ecx,dword ptr ds:[78D4E4];^SResString107:TResStringRec
 00429C8F    mov         dl,1
 00429C91    mov         eax,[0041C500];EEncodingError
 00429C96    call        Exception.CreateResFmt;EEncodingError.Create
 00429C9B    call        @RaiseExcept
 00429CA0    push        ebx
 00429CA1    mov         ecx,edi
 00429CA3    mov         edx,dword ptr [ebp-8]
 00429CA6    mov         eax,dword ptr [ebp-4]
 00429CA9    call        TEncoding.GetByteCount
 00429CAE    mov         edx,dword ptr [ebp-0C]
 00429CB1    sub         edx,esi
 00429CB3    cmp         eax,edx
>00429CB5    jle         00429CCE
 00429CB7    mov         ecx,dword ptr ds:[78CCA0];^SResString103:TResStringRec
 00429CBD    mov         dl,1
 00429CBF    mov         eax,[0041C500];EEncodingError
 00429CC4    call        Exception.CreateRes;EEncodingError.Create
 00429CC9    call        @RaiseExcept
 00429CCE    mov         eax,dword ptr [ebp+0C]
 00429CD1    add         eax,esi
 00429CD3    push        eax
 00429CD4    mov         eax,dword ptr [ebp-0C]
 00429CD7    sub         eax,esi
 00429CD9    push        eax
 00429CDA    mov         eax,dword ptr [ebp-8]
 00429CDD    lea         edx,[eax+edi*2-2]
 00429CE1    mov         ecx,ebx
 00429CE3    mov         eax,dword ptr [ebp-4]
 00429CE6    mov         ebx,dword ptr [eax]
 00429CE8    call        dword ptr [ebx+4];@AbstractError
 00429CEB    pop         edi
 00429CEC    pop         esi
 00429CED    pop         ebx
 00429CEE    mov         esp,ebp
 00429CF0    pop         ebp
 00429CF1    ret         0C
end;*}

//00429CF4
procedure TEncoding.GetCharCount(const Bytes:TBytes);
begin
{*
 00429CF4    push        ebx
 00429CF5    push        esi
 00429CF6    mov         esi,edx
 00429CF8    mov         ebx,eax
 00429CFA    mov         eax,esi
 00429CFC    call        @DynArrayLength
 00429D01    push        eax
 00429D02    xor         ecx,ecx
 00429D04    mov         edx,esi
 00429D06    mov         eax,ebx
 00429D08    call        TEncoding.GetCharCount
 00429D0D    pop         esi
 00429D0E    pop         ebx
 00429D0F    ret
*}
end;

//00429D10
procedure TEncoding.GetCharCount(const Bytes:TBytes; ByteIndex:Integer; ByteCount:Integer);
begin
{*
 00429D10    push        ebp
 00429D11    mov         ebp,esp
 00429D13    add         esp,0FFFFFFF4
 00429D16    push        ebx
 00429D17    push        esi
 00429D18    push        edi
 00429D19    mov         esi,ecx
 00429D1B    mov         edi,edx
 00429D1D    mov         dword ptr [ebp-4],eax
 00429D20    mov         ebx,dword ptr [ebp+8]
 00429D23    test        edi,edi
>00429D25    jne         00429D42
 00429D27    test        ebx,ebx
>00429D29    je          00429D42
 00429D2B    mov         ecx,dword ptr ds:[78CFE0];^SResString102:TResStringRec
 00429D31    mov         dl,1
 00429D33    mov         eax,[0041C500];EEncodingError
 00429D38    call        Exception.CreateRes
 00429D3D    call        @RaiseExcept
 00429D42    test        esi,esi
>00429D44    jge         00429D6A
 00429D46    mov         dword ptr [ebp-0C],esi
 00429D49    mov         byte ptr [ebp-8],0
 00429D4D    lea         eax,[ebp-0C]
 00429D50    push        eax
 00429D51    push        0
 00429D53    mov         ecx,dword ptr ds:[78D2C0];^SResString105:TResStringRec
 00429D59    mov         dl,1
 00429D5B    mov         eax,[0041C500];EEncodingError
 00429D60    call        Exception.CreateResFmt
 00429D65    call        @RaiseExcept
 00429D6A    test        ebx,ebx
>00429D6C    jge         00429D92
 00429D6E    mov         dword ptr [ebp-0C],ebx
 00429D71    mov         byte ptr [ebp-8],0
 00429D75    lea         eax,[ebp-0C]
 00429D78    push        eax
 00429D79    push        0
 00429D7B    mov         ecx,dword ptr ds:[78D258];^SResString106:TResStringRec
 00429D81    mov         dl,1
 00429D83    mov         eax,[0041C500];EEncodingError
 00429D88    call        Exception.CreateResFmt
 00429D8D    call        @RaiseExcept
 00429D92    mov         eax,edi
 00429D94    call        @DynArrayLength
 00429D99    sub         eax,esi
 00429D9B    cmp         ebx,eax
>00429D9D    jle         00429DC3
 00429D9F    mov         dword ptr [ebp-0C],ebx
 00429DA2    mov         byte ptr [ebp-8],0
 00429DA6    lea         eax,[ebp-0C]
 00429DA9    push        eax
 00429DAA    push        0
 00429DAC    mov         ecx,dword ptr ds:[78D258];^SResString106:TResStringRec
 00429DB2    mov         dl,1
 00429DB4    mov         eax,[0041C500];EEncodingError
 00429DB9    call        Exception.CreateResFmt
 00429DBE    call        @RaiseExcept
 00429DC3    lea         edx,[edi+esi]
 00429DC6    mov         ecx,ebx
 00429DC8    mov         eax,dword ptr [ebp-4]
 00429DCB    mov         ebx,dword ptr [eax]
 00429DCD    call        dword ptr [ebx+8]
 00429DD0    pop         edi
 00429DD1    pop         esi
 00429DD2    pop         ebx
 00429DD3    mov         esp,ebp
 00429DD5    pop         ebp
 00429DD6    ret         4
*}
end;

//00429DDC
{*procedure TEncoding.GetChars(?:?; ?:?);
begin
 00429DDC    push        ebp
 00429DDD    mov         ebp,esp
 00429DDF    push        0
 00429DE1    push        ebx
 00429DE2    push        esi
 00429DE3    push        edi
 00429DE4    mov         edi,ecx
 00429DE6    mov         esi,edx
 00429DE8    mov         ebx,eax
 00429DEA    xor         eax,eax
 00429DEC    push        ebp
 00429DED    push        429E3B
 00429DF2    push        dword ptr fs:[eax]
 00429DF5    mov         dword ptr fs:[eax],esp
 00429DF8    mov         eax,esi
 00429DFA    call        @DynArrayLength
 00429DFF    push        eax
 00429E00    lea         eax,[ebp-4]
 00429E03    push        eax
 00429E04    xor         ecx,ecx
 00429E06    mov         edx,esi
 00429E08    mov         eax,ebx
 00429E0A    call        TEncoding.GetChars
 00429E0F    mov         edx,dword ptr [ebp-4]
 00429E12    mov         eax,edi
 00429E14    mov         ecx,dword ptr ds:[41B3D4];TArray<System.Char>
 00429E1A    call        @DynArrayAsg
 00429E1F    xor         eax,eax
 00429E21    pop         edx
 00429E22    pop         ecx
 00429E23    pop         ecx
 00429E24    mov         dword ptr fs:[eax],edx
 00429E27    push        429E42
 00429E2C    lea         eax,[ebp-4]
 00429E2F    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 00429E35    call        @DynArrayClear
 00429E3A    ret
>00429E3B    jmp         @HandleFinally
>00429E40    jmp         00429E2C
 00429E42    pop         edi
 00429E43    pop         esi
 00429E44    pop         ebx
 00429E45    pop         ecx
 00429E46    pop         ebp
 00429E47    ret
end;*}

//00429E48
procedure TEncoding.GetChars(const Bytes:TBytes; ByteIndex:Integer; ByteCount:Integer);
begin
{*
 00429E48    push        ebp
 00429E49    mov         ebp,esp
 00429E4B    add         esp,0FFFFFFF0
 00429E4E    push        ebx
 00429E4F    push        esi
 00429E50    push        edi
 00429E51    mov         esi,ecx
 00429E53    mov         edi,edx
 00429E55    mov         dword ptr [ebp-4],eax
 00429E58    mov         ebx,dword ptr [ebp+0C]
 00429E5B    test        edi,edi
>00429E5D    jne         00429E7A
 00429E5F    test        ebx,ebx
>00429E61    je          00429E7A
 00429E63    mov         ecx,dword ptr ds:[78CFE0];^SResString102:TResStringRec
 00429E69    mov         dl,1
 00429E6B    mov         eax,[0041C500];EEncodingError
 00429E70    call        Exception.CreateRes
 00429E75    call        @RaiseExcept
 00429E7A    test        esi,esi
>00429E7C    jge         00429EA2
 00429E7E    mov         dword ptr [ebp-10],esi
 00429E81    mov         byte ptr [ebp-0C],0
 00429E85    lea         eax,[ebp-10]
 00429E88    push        eax
 00429E89    push        0
 00429E8B    mov         ecx,dword ptr ds:[78D2C0];^SResString105:TResStringRec
 00429E91    mov         dl,1
 00429E93    mov         eax,[0041C500];EEncodingError
 00429E98    call        Exception.CreateResFmt
 00429E9D    call        @RaiseExcept
 00429EA2    test        ebx,ebx
>00429EA4    jge         00429ECA
 00429EA6    mov         dword ptr [ebp-10],ebx
 00429EA9    mov         byte ptr [ebp-0C],0
 00429EAD    lea         eax,[ebp-10]
 00429EB0    push        eax
 00429EB1    push        0
 00429EB3    mov         ecx,dword ptr ds:[78D258];^SResString106:TResStringRec
 00429EB9    mov         dl,1
 00429EBB    mov         eax,[0041C500];EEncodingError
 00429EC0    call        Exception.CreateResFmt
 00429EC5    call        @RaiseExcept
 00429ECA    mov         eax,edi
 00429ECC    call        @DynArrayLength
 00429ED1    sub         eax,esi
 00429ED3    cmp         ebx,eax
>00429ED5    jle         00429EFB
 00429ED7    mov         dword ptr [ebp-10],ebx
 00429EDA    mov         byte ptr [ebp-0C],0
 00429EDE    lea         eax,[ebp-10]
 00429EE1    push        eax
 00429EE2    push        0
 00429EE4    mov         ecx,dword ptr ds:[78D258];^SResString106:TResStringRec
 00429EEA    mov         dl,1
 00429EEC    mov         eax,[0041C500];EEncodingError
 00429EF1    call        Exception.CreateResFmt
 00429EF6    call        @RaiseExcept
 00429EFB    push        ebx
 00429EFC    mov         ecx,esi
 00429EFE    mov         edx,edi
 00429F00    mov         eax,dword ptr [ebp-4]
 00429F03    call        TEncoding.GetCharCount
 00429F08    mov         dword ptr [ebp-8],eax
 00429F0B    mov         eax,dword ptr [ebp-8]
 00429F0E    push        eax
 00429F0F    mov         eax,dword ptr [ebp+8]
 00429F12    mov         ecx,1
 00429F17    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 00429F1D    call        @DynArraySetLength
 00429F22    add         esp,4
 00429F25    mov         eax,dword ptr [ebp+8]
 00429F28    mov         eax,dword ptr [eax]
 00429F2A    push        eax
 00429F2B    mov         eax,dword ptr [ebp-8]
 00429F2E    push        eax
 00429F2F    lea         edx,[edi+esi]
 00429F32    mov         ecx,ebx
 00429F34    mov         eax,dword ptr [ebp-4]
 00429F37    mov         ebx,dword ptr [eax]
 00429F39    call        dword ptr [ebx+0C]
 00429F3C    pop         edi
 00429F3D    pop         esi
 00429F3E    pop         ebx
 00429F3F    mov         esp,ebp
 00429F41    pop         ebp
 00429F42    ret         8
*}
end;

//00429F48
procedure TEncoding.GetChars(const Bytes:TBytes; ByteIndex:Integer; ByteCount:Integer; const Chars:TCharArray; CharIndex:Integer);
begin
{*
 00429F48    push        ebp
 00429F49    mov         ebp,esp
 00429F4B    add         esp,0FFFFFFEC
 00429F4E    push        ebx
 00429F4F    push        esi
 00429F50    push        edi
 00429F51    mov         esi,ecx
 00429F53    mov         dword ptr [ebp-8],edx
 00429F56    mov         dword ptr [ebp-4],eax
 00429F59    mov         edi,dword ptr [ebp+8]
 00429F5C    mov         ebx,dword ptr [ebp+10]
 00429F5F    cmp         dword ptr [ebp-8],0
>00429F63    jne         00429F80
 00429F65    test        ebx,ebx
>00429F67    je          00429F80
 00429F69    mov         ecx,dword ptr ds:[78CFE0];^SResString102:TResStringRec
 00429F6F    mov         dl,1
 00429F71    mov         eax,[0041C500];EEncodingError
 00429F76    call        Exception.CreateRes
 00429F7B    call        @RaiseExcept
 00429F80    test        esi,esi
>00429F82    jge         00429FA8
 00429F84    mov         dword ptr [ebp-14],esi
 00429F87    mov         byte ptr [ebp-10],0
 00429F8B    lea         eax,[ebp-14]
 00429F8E    push        eax
 00429F8F    push        0
 00429F91    mov         ecx,dword ptr ds:[78D2C0];^SResString105:TResStringRec
 00429F97    mov         dl,1
 00429F99    mov         eax,[0041C500];EEncodingError
 00429F9E    call        Exception.CreateResFmt
 00429FA3    call        @RaiseExcept
 00429FA8    test        ebx,ebx
>00429FAA    jge         00429FD0
 00429FAC    mov         dword ptr [ebp-14],ebx
 00429FAF    mov         byte ptr [ebp-10],0
 00429FB3    lea         eax,[ebp-14]
 00429FB6    push        eax
 00429FB7    push        0
 00429FB9    mov         ecx,dword ptr ds:[78D258];^SResString106:TResStringRec
 00429FBF    mov         dl,1
 00429FC1    mov         eax,[0041C500];EEncodingError
 00429FC6    call        Exception.CreateResFmt
 00429FCB    call        @RaiseExcept
 00429FD0    mov         eax,dword ptr [ebp-8]
 00429FD3    call        @DynArrayLength
 00429FD8    sub         eax,esi
 00429FDA    cmp         ebx,eax
>00429FDC    jle         0042A002
 00429FDE    mov         dword ptr [ebp-14],ebx
 00429FE1    mov         byte ptr [ebp-10],0
 00429FE5    lea         eax,[ebp-14]
 00429FE8    push        eax
 00429FE9    push        0
 00429FEB    mov         ecx,dword ptr ds:[78D258];^SResString106:TResStringRec
 00429FF1    mov         dl,1
 00429FF3    mov         eax,[0041C500];EEncodingError
 00429FF8    call        Exception.CreateResFmt
 00429FFD    call        @RaiseExcept
 0042A002    push        ebx
 0042A003    mov         ecx,esi
 0042A005    mov         edx,dword ptr [ebp-8]
 0042A008    mov         eax,dword ptr [ebp-4]
 0042A00B    call        TEncoding.GetCharCount
 0042A010    mov         dword ptr [ebp-0C],eax
 0042A013    test        edi,edi
>0042A015    jl          0042A023
 0042A017    mov         eax,dword ptr [ebp+0C]
 0042A01A    call        @DynArrayLength
 0042A01F    cmp         edi,eax
>0042A021    jle         0042A047
 0042A023    mov         dword ptr [ebp-14],edi
 0042A026    mov         byte ptr [ebp-10],0
 0042A02A    lea         eax,[ebp-14]
 0042A02D    push        eax
 0042A02E    push        0
 0042A030    mov         ecx,dword ptr ds:[78D4E4];^SResString107:TResStringRec
 0042A036    mov         dl,1
 0042A038    mov         eax,[0041C500];EEncodingError
 0042A03D    call        Exception.CreateResFmt
 0042A042    call        @RaiseExcept
 0042A047    mov         eax,dword ptr [ebp+0C]
 0042A04A    call        @DynArrayLength
 0042A04F    mov         edx,dword ptr [ebp-0C]
 0042A052    add         edx,edi
 0042A054    cmp         eax,edx
>0042A056    jge         0042A06F
 0042A058    mov         ecx,dword ptr ds:[78CCA0];^SResString103:TResStringRec
 0042A05E    mov         dl,1
 0042A060    mov         eax,[0041C500];EEncodingError
 0042A065    call        Exception.CreateRes
 0042A06A    call        @RaiseExcept
 0042A06F    mov         eax,dword ptr [ebp+0C]
 0042A072    lea         eax,[eax+edi*2]
 0042A075    push        eax
 0042A076    mov         eax,dword ptr [ebp-0C]
 0042A079    push        eax
 0042A07A    mov         eax,dword ptr [ebp-8]
 0042A07D    lea         edx,[eax+esi]
 0042A080    mov         ecx,ebx
 0042A082    mov         eax,dword ptr [ebp-4]
 0042A085    mov         ebx,dword ptr [eax]
 0042A087    call        dword ptr [ebx+0C]
 0042A08A    pop         edi
 0042A08B    pop         esi
 0042A08C    pop         ebx
 0042A08D    mov         esp,ebp
 0042A08F    pop         ebp
 0042A090    ret         0C
*}
end;

//0042A094
procedure sub_0042A094;
begin
{*
 0042A094    or          eax,0FFFFFFFF
 0042A097    ret
*}
end;

//0042A098
function TEncoding.GetDefault:TEncoding;
begin
{*
 0042A098    push        ebx
 0042A099    cmp         dword ptr ds:[790DF8],0;gvar_00790DF8
>0042A0A0    jne         0042A0D4
 0042A0A2    push        0
 0042A0A4    push        0
 0042A0A6    call        kernel32.GetACP
 0042A0AB    mov         ecx,eax
 0042A0AD    mov         dl,1
 0042A0AF    mov         eax,[0041CB54];TMBCSEncoding
 0042A0B4    call        TMBCSEncoding.Create
 0042A0B9    mov         ebx,eax
 0042A0BB    mov         eax,790DF8;gvar_00790DF8
 0042A0C0    xor         ecx,ecx
 0042A0C2    mov         edx,ebx
 0042A0C4    call        InterlockedCompareExchangePointer
 0042A0C9    test        eax,eax
>0042A0CB    je          0042A0D4
 0042A0CD    mov         eax,ebx
 0042A0CF    call        TObject.Free
 0042A0D4    mov         eax,[00790DF8];gvar_00790DF8
 0042A0D9    pop         ebx
 0042A0DA    ret
*}
end;

//0042A0DC
function TEncoding.GetEncoding:TEncoding;
begin
{*
 0042A0DC    mov         edx,eax
 0042A0DE    sub         edx,4B0
>0042A0E4    je          0042A0F6
 0042A0E6    dec         edx
>0042A0E7    je          0042A103
 0042A0E9    sub         edx,0F937
>0042A0EF    je          0042A110
 0042A0F1    dec         edx
>0042A0F2    je          0042A11D
>0042A0F4    jmp         0042A12A
 0042A0F6    mov         dl,1
 0042A0F8    mov         eax,[0041D1BC];TUnicodeEncoding
 0042A0FD    call        TUnicodeEncoding.Create
 0042A102    ret
 0042A103    mov         dl,1
 0042A105    mov         eax,[0041D390];TBigEndianUnicodeEncoding
 0042A10A    call        TUnicodeEncoding.Create
 0042A10F    ret
 0042A110    mov         dl,1
 0042A112    mov         eax,[0041CE2C];TUTF7Encoding
 0042A117    call        TUTF7Encoding.Create
 0042A11C    ret
 0042A11D    mov         dl,1
 0042A11F    mov         eax,[0041CFE8];TUTF8Encoding
 0042A124    call        TUTF8Encoding.Create
 0042A129    ret
 0042A12A    mov         ecx,eax
 0042A12C    mov         dl,1
 0042A12E    mov         eax,[0041CB54];TMBCSEncoding
 0042A133    call        TMBCSEncoding.Create
 0042A138    ret
*}
end;

//0042A13C
function TEncoding.GetEncoding:TEncoding;
begin
{*
 0042A13C    push        ebp
 0042A13D    mov         ebp,esp
 0042A13F    add         esp,0FFFFFFF8
 0042A142    push        ebx
 0042A143    xor         edx,edx
 0042A145    mov         dword ptr [ebp-8],edx
 0042A148    mov         ebx,eax
 0042A14A    xor         eax,eax
 0042A14C    push        ebp
 0042A14D    push        42A1AA
 0042A152    push        dword ptr fs:[eax]
 0042A155    mov         dword ptr fs:[eax],esp
 0042A158    lea         edx,[ebp-8]
 0042A15B    mov         eax,ebx
 0042A15D    call        LowerCase
 0042A162    mov         eax,dword ptr [ebp-8]
 0042A165    lea         edx,[ebp-4]
 0042A168    call        004292B4
 0042A16D    test        al,al
>0042A16F    je          0042A17D
 0042A171    mov         eax,dword ptr [ebp-4]
 0042A174    call        TEncoding.GetEncoding
 0042A179    mov         ebx,eax
>0042A17B    jmp         0042A194
 0042A17D    mov         ecx,dword ptr ds:[78D9C4];^SResString109:TResStringRec
 0042A183    mov         dl,1
 0042A185    mov         eax,[0041C500];EEncodingError
 0042A18A    call        Exception.CreateRes;EEncodingError.Create
 0042A18F    call        @RaiseExcept
 0042A194    xor         eax,eax
 0042A196    pop         edx
 0042A197    pop         ecx
 0042A198    pop         ecx
 0042A199    mov         dword ptr fs:[eax],edx
 0042A19C    push        42A1B1
 0042A1A1    lea         eax,[ebp-8]
 0042A1A4    call        @UStrClr
 0042A1A9    ret
>0042A1AA    jmp         @HandleFinally
>0042A1AF    jmp         0042A1A1
 0042A1B1    mov         eax,ebx
 0042A1B3    pop         ebx
 0042A1B4    pop         ecx
 0042A1B5    pop         ecx
 0042A1B6    pop         ebp
 0042A1B7    ret
*}
end;

//0042A1B8
{*procedure sub_0042A1B8(?:?);
begin
 0042A1B8    push        ebx
 0042A1B9    mov         ebx,edx
 0042A1BB    mov         eax,ebx
 0042A1BD    call        @UStrClr
 0042A1C2    pop         ebx
 0042A1C3    ret
end;*}

//0042A1C4
procedure TEncoding.GetString(const Bytes:TBytes);
begin
{*
 0042A1C4    push        ebx
 0042A1C5    push        esi
 0042A1C6    push        edi
 0042A1C7    mov         edi,ecx
 0042A1C9    mov         esi,edx
 0042A1CB    mov         ebx,eax
 0042A1CD    mov         eax,esi
 0042A1CF    call        @DynArrayLength
 0042A1D4    push        eax
 0042A1D5    push        edi
 0042A1D6    xor         ecx,ecx
 0042A1D8    mov         edx,esi
 0042A1DA    mov         eax,ebx
 0042A1DC    call        TEncoding.GetString
 0042A1E1    pop         edi
 0042A1E2    pop         esi
 0042A1E3    pop         ebx
 0042A1E4    ret
*}
end;

//0042A1E8
procedure TEncoding.GetString(const Bytes:TBytes; ByteIndex:Integer; ByteCount:Integer);
begin
{*
 0042A1E8    push        ebp
 0042A1E9    mov         ebp,esp
 0042A1EB    push        0
 0042A1ED    push        ebx
 0042A1EE    push        esi
 0042A1EF    push        edi
 0042A1F0    mov         edi,ecx
 0042A1F2    mov         esi,edx
 0042A1F4    mov         ebx,eax
 0042A1F6    xor         eax,eax
 0042A1F8    push        ebp
 0042A1F9    push        42A248
 0042A1FE    push        dword ptr fs:[eax]
 0042A201    mov         dword ptr fs:[eax],esp
 0042A204    mov         eax,dword ptr [ebp+0C]
 0042A207    push        eax
 0042A208    lea         eax,[ebp-4]
 0042A20B    push        eax
 0042A20C    mov         ecx,edi
 0042A20E    mov         edx,esi
 0042A210    mov         eax,ebx
 0042A212    call        TEncoding.GetChars
 0042A217    mov         eax,dword ptr [ebp-4]
 0042A21A    call        @DynArrayLength
 0042A21F    mov         ecx,eax
 0042A221    mov         eax,dword ptr [ebp+8]
 0042A224    mov         edx,dword ptr [ebp-4]
 0042A227    call        @UStrFromPWCharLen
 0042A22C    xor         eax,eax
 0042A22E    pop         edx
 0042A22F    pop         ecx
 0042A230    pop         ecx
 0042A231    mov         dword ptr fs:[eax],edx
 0042A234    push        42A24F
 0042A239    lea         eax,[ebp-4]
 0042A23C    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 0042A242    call        @DynArrayClear
 0042A247    ret
>0042A248    jmp         @HandleFinally
>0042A24D    jmp         0042A239
 0042A24F    pop         edi
 0042A250    pop         esi
 0042A251    pop         ebx
 0042A252    pop         ecx
 0042A253    pop         ebp
 0042A254    ret         8
*}
end;

//0042A258
function TEncoding.GetUnicode:TEncoding;
begin
{*
 0042A258    push        ebx
 0042A259    cmp         dword ptr ds:[790DFC],0;gvar_00790DFC
>0042A260    jne         0042A289
 0042A262    mov         dl,1
 0042A264    mov         eax,[0041D1BC];TUnicodeEncoding
 0042A269    call        TUnicodeEncoding.Create
 0042A26E    mov         ebx,eax
 0042A270    mov         eax,790DFC;gvar_00790DFC
 0042A275    xor         ecx,ecx
 0042A277    mov         edx,ebx
 0042A279    call        InterlockedCompareExchangePointer
 0042A27E    test        eax,eax
>0042A280    je          0042A289
 0042A282    mov         eax,ebx
 0042A284    call        TObject.Free
 0042A289    mov         eax,[00790DFC];gvar_00790DFC
 0042A28E    pop         ebx
 0042A28F    ret
*}
end;

//0042A290
function TEncoding.GetUTF7:TEncoding;
begin
{*
 0042A290    push        ebx
 0042A291    cmp         dword ptr ds:[790E00],0;gvar_00790E00
>0042A298    jne         0042A2C1
 0042A29A    mov         dl,1
 0042A29C    mov         eax,[0041CE2C];TUTF7Encoding
 0042A2A1    call        TUTF7Encoding.Create
 0042A2A6    mov         ebx,eax
 0042A2A8    mov         eax,790E00;gvar_00790E00
 0042A2AD    xor         ecx,ecx
 0042A2AF    mov         edx,ebx
 0042A2B1    call        InterlockedCompareExchangePointer
 0042A2B6    test        eax,eax
>0042A2B8    je          0042A2C1
 0042A2BA    mov         eax,ebx
 0042A2BC    call        TObject.Free
 0042A2C1    mov         eax,[00790E00];gvar_00790E00
 0042A2C6    pop         ebx
 0042A2C7    ret
*}
end;

//0042A2C8
function TEncoding.GetUTF8:TEncoding;
begin
{*
 0042A2C8    push        ebx
 0042A2C9    cmp         dword ptr ds:[790E04],0;gvar_00790E04
>0042A2D0    jne         0042A2F9
 0042A2D2    mov         dl,1
 0042A2D4    mov         eax,[0041CFE8];TUTF8Encoding
 0042A2D9    call        TUTF8Encoding.Create
 0042A2DE    mov         ebx,eax
 0042A2E0    mov         eax,790E04;gvar_00790E04
 0042A2E5    xor         ecx,ecx
 0042A2E7    mov         edx,ebx
 0042A2E9    call        InterlockedCompareExchangePointer
 0042A2EE    test        eax,eax
>0042A2F0    je          0042A2F9
 0042A2F2    mov         eax,ebx
 0042A2F4    call        TObject.Free
 0042A2F9    mov         eax,[00790E04];gvar_00790E04
 0042A2FE    pop         ebx
 0042A2FF    ret
*}
end;

//0042A300
function TEncoding.IsStandardEncoding:Boolean;
begin
{*
 0042A300    push        ebx
 0042A301    mov         ebx,eax
 0042A303    call        TEncoding.GetDefault
 0042A308    cmp         ebx,eax
>0042A30A    je          0042A33D
 0042A30C    call        TEncoding.GetUTF8
 0042A311    cmp         ebx,eax
>0042A313    je          0042A33D
 0042A315    call        TEncoding.GetUnicode
 0042A31A    cmp         ebx,eax
>0042A31C    je          0042A33D
 0042A31E    call        TEncoding.GetASCII
 0042A323    cmp         ebx,eax
>0042A325    je          0042A33D
 0042A327    call        TEncoding.GetUTF7
 0042A32C    cmp         ebx,eax
>0042A32E    je          0042A33D
 0042A330    call        TEncoding.GetBigEndianUnicode
 0042A335    cmp         ebx,eax
>0042A337    je          0042A33D
 0042A339    xor         eax,eax
 0042A33B    pop         ebx
 0042A33C    ret
 0042A33D    mov         al,1
 0042A33F    pop         ebx
 0042A340    ret
*}
end;

//0042A344
constructor sub_0042A344;
begin
{*
 0042A344    push        ebx
 0042A345    push        esi
 0042A346    push        edi
 0042A347    test        dl,dl
>0042A349    je          0042A353
 0042A34B    add         esp,0FFFFFFF0
 0042A34E    call        @ClassCreate
 0042A353    mov         ebx,edx
 0042A355    mov         esi,eax
 0042A357    push        0
 0042A359    push        0
 0042A35B    call        kernel32.GetACP
 0042A360    mov         ecx,eax
 0042A362    xor         edx,edx
 0042A364    mov         eax,esi
 0042A366    mov         edi,dword ptr [eax]
 0042A368    call        dword ptr [edi+30];TMBCSEncoding.Create
 0042A36B    mov         eax,esi
 0042A36D    test        bl,bl
>0042A36F    je          0042A380
 0042A371    call        @AfterConstruction
 0042A376    pop         dword ptr fs:[0]
 0042A37D    add         esp,0C
 0042A380    mov         eax,esi
 0042A382    pop         edi
 0042A383    pop         esi
 0042A384    pop         ebx
 0042A385    ret
*}
end;

//0042A388
constructor TMBCSEncoding.Create;
begin
{*
 0042A388    push        ebp
 0042A389    mov         ebp,esp
 0042A38B    push        ecx
 0042A38C    push        ebx
 0042A38D    push        esi
 0042A38E    test        dl,dl
>0042A390    je          0042A39A
 0042A392    add         esp,0FFFFFFF0
 0042A395    call        @ClassCreate
 0042A39A    mov         byte ptr [ebp-1],dl
 0042A39D    mov         ebx,eax
 0042A39F    mov         dword ptr [ebx+0C],ecx
 0042A3A2    push        0
 0042A3A4    push        0
 0042A3A6    xor         edx,edx
 0042A3A8    mov         eax,ebx
 0042A3AA    mov         esi,dword ptr [eax]
 0042A3AC    call        dword ptr [esi+30]
 0042A3AF    mov         eax,ebx
 0042A3B1    cmp         byte ptr [ebp-1],0
>0042A3B5    je          0042A3C6
 0042A3B7    call        @AfterConstruction
 0042A3BC    pop         dword ptr fs:[0]
 0042A3C3    add         esp,0C
 0042A3C6    mov         eax,ebx
 0042A3C8    pop         esi
 0042A3C9    pop         ebx
 0042A3CA    pop         ecx
 0042A3CB    pop         ebp
 0042A3CC    ret
*}
end;

//0042A3D0
constructor TMBCSEncoding.Create(WCharToMBFlags:Integer; MBToWCharFlags:Integer);
begin
{*
 0042A3D0    push        ebp
 0042A3D1    mov         ebp,esp
 0042A3D3    add         esp,0FFFFFFEC
 0042A3D6    push        ebx
 0042A3D7    push        esi
 0042A3D8    test        dl,dl
>0042A3DA    je          0042A3E4
 0042A3DC    add         esp,0FFFFFFF0
 0042A3DF    call        @ClassCreate
 0042A3E4    mov         ebx,edx
 0042A3E6    mov         esi,eax
 0042A3E8    test        ecx,ecx
>0042A3EA    jne         0042A3F6
 0042A3EC    call        kernel32.GetACP
 0042A3F1    mov         dword ptr [esi+0C],eax
>0042A3F4    jmp         0042A3F9
 0042A3F6    mov         dword ptr [esi+0C],ecx
 0042A3F9    mov         eax,dword ptr [ebp+0C]
 0042A3FC    mov         dword ptr [esi+10],eax
 0042A3FF    mov         eax,dword ptr [ebp+8]
 0042A402    mov         dword ptr [esi+14],eax
 0042A405    lea         eax,[ebp-14]
 0042A408    push        eax
 0042A409    mov         eax,dword ptr [esi+0C]
 0042A40C    push        eax
 0042A40D    call        kernel32.GetCPInfo
 0042A412    test        eax,eax
>0042A414    jne         0042A42D
 0042A416    mov         ecx,dword ptr ds:[78D668];^SResString108:TResStringRec
 0042A41C    mov         dl,1
 0042A41E    mov         eax,[0041C500];EEncodingError
 0042A423    call        Exception.CreateRes
 0042A428    call        @RaiseExcept
 0042A42D    mov         eax,dword ptr [ebp-14]
 0042A430    mov         dword ptr [esi+8],eax
 0042A433    dec         eax
 0042A434    sete        al
 0042A437    mov         byte ptr [esi+4],al
 0042A43A    mov         eax,esi
 0042A43C    test        bl,bl
>0042A43E    je          0042A44F
 0042A440    call        @AfterConstruction
 0042A445    pop         dword ptr fs:[0]
 0042A44C    add         esp,0C
 0042A44F    mov         eax,esi
 0042A451    pop         esi
 0042A452    pop         ebx
 0042A453    mov         esp,ebp
 0042A455    pop         ebp
 0042A456    ret         8
*}
end;

//0042A45C
procedure TMBCSEncoding.Clone;
begin
{*
 0042A45C    push        ebx
 0042A45D    mov         ebx,eax
 0042A45F    mov         eax,dword ptr [ebx+10];TMBCSEncoding.FMBToWCharFlags:Cardinal
 0042A462    push        eax
 0042A463    mov         eax,dword ptr [ebx+14];TMBCSEncoding.FWCharToMBFlags:Cardinal
 0042A466    push        eax
 0042A467    mov         eax,ebx
 0042A469    mov         edx,dword ptr [eax]
 0042A46B    call        dword ptr [edx+10];TMBCSEncoding.sub_0042A4F0
 0042A46E    mov         ecx,eax
 0042A470    mov         dl,1
 0042A472    mov         eax,[0041CB54];TMBCSEncoding
 0042A477    call        TMBCSEncoding.Create;TMBCSEncoding.Create
 0042A47C    pop         ebx
 0042A47D    ret
*}
end;

//0042A480
{*procedure sub_0042A480(?:?);
begin
 0042A480    push        ecx
 0042A481    push        0
 0042A483    push        0
 0042A485    push        0
 0042A487    push        0
 0042A489    mov         ecx,dword ptr [eax+0C];TMBCSEncoding.FCodePage:Cardinal
 0042A48C    mov         eax,dword ptr [eax+14];TMBCSEncoding.FWCharToMBFlags:Cardinal
 0042A48F    xchg        eax,ecx
 0042A490    xchg        ecx,edx
 0042A492    call        LocaleCharsFromUnicode
 0042A497    ret
end;*}

//0042A498
{*procedure sub_0042A498(?:?; ?:?; ?:?);
begin
 0042A498    push        ebp
 0042A499    mov         ebp,esp
 0042A49B    push        ecx
 0042A49C    mov         ecx,dword ptr [ebp+0C]
 0042A49F    push        ecx
 0042A4A0    mov         ecx,dword ptr [ebp+8]
 0042A4A3    push        ecx
 0042A4A4    push        0
 0042A4A6    push        0
 0042A4A8    mov         ecx,dword ptr [eax+0C];TMBCSEncoding.FCodePage:Cardinal
 0042A4AB    mov         eax,dword ptr [eax+14];TMBCSEncoding.FWCharToMBFlags:Cardinal
 0042A4AE    xchg        eax,ecx
 0042A4AF    xchg        ecx,edx
 0042A4B1    call        LocaleCharsFromUnicode
 0042A4B6    pop         ebp
 0042A4B7    ret         8
end;*}

//0042A4BC
{*procedure sub_0042A4BC(?:?);
begin
 0042A4BC    push        ecx
 0042A4BD    push        0
 0042A4BF    push        0
 0042A4C1    mov         ecx,dword ptr [eax+0C];TMBCSEncoding.FCodePage:Cardinal
 0042A4C4    mov         eax,dword ptr [eax+10];TMBCSEncoding.FMBToWCharFlags:Cardinal
 0042A4C7    xchg        eax,ecx
 0042A4C8    xchg        ecx,edx
 0042A4CA    call        UnicodeFromLocaleChars
 0042A4CF    ret
end;*}

//0042A4D0
{*procedure sub_0042A4D0(?:?; ?:?; ?:?);
begin
 0042A4D0    push        ebp
 0042A4D1    mov         ebp,esp
 0042A4D3    push        ecx
 0042A4D4    mov         ecx,dword ptr [ebp+0C]
 0042A4D7    push        ecx
 0042A4D8    mov         ecx,dword ptr [ebp+8]
 0042A4DB    push        ecx
 0042A4DC    mov         ecx,dword ptr [eax+0C];TMBCSEncoding.FCodePage:Cardinal
 0042A4DF    mov         eax,dword ptr [eax+10];TMBCSEncoding.FMBToWCharFlags:Cardinal
 0042A4E2    xchg        eax,ecx
 0042A4E3    xchg        ecx,edx
 0042A4E5    call        UnicodeFromLocaleChars
 0042A4EA    pop         ebp
 0042A4EB    ret         8
end;*}

//0042A4F0
{*function sub_0042A4F0:?;
begin
 0042A4F0    mov         eax,dword ptr [eax+0C];TMBCSEncoding.FCodePage:Cardinal
 0042A4F3    ret
end;*}

//0042A4F4
{*procedure sub_0042A4F4(?:?);
begin
 0042A4F4    push        ebx
 0042A4F5    push        esi
 0042A4F6    add         esp,0FFFFFDE0
 0042A4FC    mov         esi,edx
 0042A4FE    mov         ebx,eax
 0042A500    push        esp
 0042A501    push        0
 0042A503    mov         eax,dword ptr [ebx+0C];TMBCSEncoding.FCodePage:Cardinal
 0042A506    push        eax
 0042A507    call        kernel32.GetCPInfoExW
 0042A50C    test        eax,eax
>0042A50E    je          0042A522
 0042A510    mov         eax,esi
 0042A512    lea         edx,[esp+18]
 0042A516    mov         ecx,104
 0042A51B    call        @UStrFromWArray
>0042A520    jmp         0042A529
 0042A522    mov         eax,esi
 0042A524    call        @UStrClr
 0042A529    add         esp,220
 0042A52F    pop         esi
 0042A530    pop         ebx
 0042A531    ret
end;*}

//0042A534
function TMBCSEncoding.GetMaxByteCount(CharCount:Integer):Integer;
begin
{*
 0042A534    inc         edx
 0042A535    imul        edx,dword ptr [eax+8];TMBCSEncoding.FMaxCharSize:Integer
 0042A539    mov         eax,edx
 0042A53B    ret
*}
end;

//0042A53C
function TMBCSEncoding.GetMaxCharCount(ByteCount:Integer):Integer;
begin
{*
 0042A53C    mov         eax,edx
 0042A53E    ret
*}
end;

//0042A540
{*procedure TMBCSEncoding.GetPreamble(?:?);
begin
 0042A540    push        ebx
 0042A541    mov         ebx,edx
 0042A543    push        0
 0042A545    mov         eax,ebx
 0042A547    mov         ecx,1
 0042A54C    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0042A552    call        @DynArraySetLength
 0042A557    add         esp,4
 0042A55A    pop         ebx
 0042A55B    ret
end;*}

//0042A55C
constructor TUTF7Encoding.Create();
begin
{*
 0042A55C    push        ebx
 0042A55D    push        esi
 0042A55E    test        dl,dl
>0042A560    je          0042A56A
 0042A562    add         esp,0FFFFFFF0
 0042A565    call        @ClassCreate
 0042A56A    mov         ebx,edx
 0042A56C    mov         esi,eax
 0042A56E    mov         ecx,0FDE8
 0042A573    xor         edx,edx
 0042A575    mov         eax,esi
 0042A577    call        TMBCSEncoding.Create
 0042A57C    mov         byte ptr [esi+4],0
 0042A580    mov         eax,esi
 0042A582    test        bl,bl
>0042A584    je          0042A595
 0042A586    call        @AfterConstruction
 0042A58B    pop         dword ptr fs:[0]
 0042A592    add         esp,0C
 0042A595    mov         eax,esi
 0042A597    pop         esi
 0042A598    pop         ebx
 0042A599    ret
*}
end;

//0042A59C
procedure TUTF7Encoding.Clone;
begin
{*
 0042A59C    mov         dl,1
 0042A59E    mov         eax,[0041CE2C];TUTF7Encoding
 0042A5A3    call        TUTF7Encoding.Create;TUTF7Encoding.Create
 0042A5A8    ret
*}
end;

//0042A5AC
procedure TUTF7Encoding.GetMaxByteCount(CharCount:Integer);
begin
{*
 0042A5AC    lea         eax,[edx+edx*2]
 0042A5AF    add         eax,2
 0042A5B2    ret
*}
end;

//0042A5B4
function TUTF7Encoding.GetMaxCharCount(ByteCount:Integer):Integer;
begin
{*
 0042A5B4    mov         eax,edx
 0042A5B6    ret
*}
end;

//0042A5B8
constructor TUTF8Encoding.Create();
begin
{*
 0042A5B8    push        ebx
 0042A5B9    push        esi
 0042A5BA    test        dl,dl
>0042A5BC    je          0042A5C6
 0042A5BE    add         esp,0FFFFFFF0
 0042A5C1    call        @ClassCreate
 0042A5C6    mov         ebx,edx
 0042A5C8    mov         esi,eax
 0042A5CA    push        8
 0042A5CC    push        0
 0042A5CE    mov         ecx,0FDE9
 0042A5D3    xor         edx,edx
 0042A5D5    mov         eax,esi
 0042A5D7    call        TMBCSEncoding.Create
 0042A5DC    mov         byte ptr [esi+4],0
 0042A5E0    mov         eax,esi
 0042A5E2    test        bl,bl
>0042A5E4    je          0042A5F5
 0042A5E6    call        @AfterConstruction
 0042A5EB    pop         dword ptr fs:[0]
 0042A5F2    add         esp,0C
 0042A5F5    mov         eax,esi
 0042A5F7    pop         esi
 0042A5F8    pop         ebx
 0042A5F9    ret
*}
end;

//0042A5FC
procedure TUTF8Encoding.Clone;
begin
{*
 0042A5FC    mov         dl,1
 0042A5FE    mov         eax,[0041CFE8];TUTF8Encoding
 0042A603    call        TUTF8Encoding.Create;TUTF8Encoding.Create
 0042A608    ret
*}
end;

//0042A60C
function TUTF8Encoding.GetMaxByteCount(CharCount:Integer):Integer;
begin
{*
 0042A60C    inc         edx
 0042A60D    lea         eax,[edx+edx*2]
 0042A610    ret
*}
end;

//0042A614
function TUTF8Encoding.GetMaxCharCount(ByteCount:Integer):Integer;
begin
{*
 0042A614    lea         eax,[edx+1]
 0042A617    ret
*}
end;

//0042A618
{*procedure TUTF8Encoding.GetPreamble(?:?);
begin
 0042A618    push        ebp
 0042A619    mov         ebp,esp
 0042A61B    push        0
 0042A61D    push        ebx
 0042A61E    mov         ebx,edx
 0042A620    xor         eax,eax
 0042A622    push        ebp
 0042A623    push        42A694
 0042A628    push        dword ptr fs:[eax]
 0042A62B    mov         dword ptr fs:[eax],esp
 0042A62E    lea         eax,[ebp-4]
 0042A631    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0042A637    call        @DynArrayClear
 0042A63C    push        3
 0042A63E    lea         eax,[ebp-4]
 0042A641    mov         ecx,1
 0042A646    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0042A64C    call        @DynArraySetLength
 0042A651    add         esp,4
 0042A654    mov         eax,dword ptr [ebp-4]
 0042A657    mov         byte ptr [eax],0EF
 0042A65A    mov         eax,dword ptr [ebp-4]
 0042A65D    mov         byte ptr [eax+1],0BB
 0042A661    mov         eax,dword ptr [ebp-4]
 0042A664    mov         byte ptr [eax+2],0BF
 0042A668    mov         edx,dword ptr [ebp-4]
 0042A66B    mov         eax,ebx
 0042A66D    mov         ecx,dword ptr ds:[418988];TArray<System.Byte>
 0042A673    call        @DynArrayAsg
 0042A678    xor         eax,eax
 0042A67A    pop         edx
 0042A67B    pop         ecx
 0042A67C    pop         ecx
 0042A67D    mov         dword ptr fs:[eax],edx
 0042A680    push        42A69B
 0042A685    lea         eax,[ebp-4]
 0042A688    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0042A68E    call        @DynArrayClear
 0042A693    ret
>0042A694    jmp         @HandleFinally
>0042A699    jmp         0042A685
 0042A69B    pop         ebx
 0042A69C    pop         ecx
 0042A69D    pop         ebp
 0042A69E    ret
end;*}

//0042A6A0
constructor TUnicodeEncoding.Create();
begin
{*
 0042A6A0    test        dl,dl
>0042A6A2    je          0042A6AC
 0042A6A4    add         esp,0FFFFFFF0
 0042A6A7    call        @ClassCreate
 0042A6AC    mov         byte ptr [eax+4],0
 0042A6B0    mov         dword ptr [eax+8],4
 0042A6B7    test        dl,dl
>0042A6B9    je          0042A6CA
 0042A6BB    call        @AfterConstruction
 0042A6C0    pop         dword ptr fs:[0]
 0042A6C7    add         esp,0C
 0042A6CA    ret
*}
end;

//0042A6CC
procedure TUnicodeEncoding.Clone;
begin
{*
 0042A6CC    mov         dl,1
 0042A6CE    mov         eax,[0041D1BC];TUnicodeEncoding
 0042A6D3    call        TUnicodeEncoding.Create;TUnicodeEncoding.Create
 0042A6D8    ret
*}
end;

//0042A6DC
{*procedure sub_0042A6DC(?:?; ?:?);
begin
 0042A6DC    mov         eax,ecx
 0042A6DE    add         eax,eax
 0042A6E0    ret
end;*}

//0042A6E4
{*function sub_0042A6E4(?:?; ?:?; ?:?):?;
begin
 0042A6E4    push        ebp
 0042A6E5    mov         ebp,esp
 0042A6E7    push        ebx
 0042A6E8    mov         ebx,ecx
 0042A6EA    add         ebx,ebx
 0042A6EC    mov         eax,edx
 0042A6EE    mov         edx,dword ptr [ebp+0C]
 0042A6F1    mov         ecx,ebx
 0042A6F3    call        Move
 0042A6F8    mov         eax,ebx
 0042A6FA    pop         ebx
 0042A6FB    pop         ebp
 0042A6FC    ret         8
end;*}

//0042A700
{*procedure sub_0042A700(?:?; ?:?);
begin
 0042A700    mov         eax,ecx
 0042A702    sar         eax,1
>0042A704    jns         0042A709
 0042A706    adc         eax,0
 0042A709    ret
end;*}

//0042A70C
{*function sub_0042A70C(?:?):?;
begin
 0042A70C    push        ebp
 0042A70D    mov         ebp,esp
 0042A70F    push        ebx
 0042A710    mov         eax,dword ptr [ebp+8]
 0042A713    mov         ebx,eax
 0042A715    mov         ecx,eax
 0042A717    add         ecx,ecx
 0042A719    mov         eax,edx
 0042A71B    mov         edx,dword ptr [ebp+0C]
 0042A71E    call        Move
 0042A723    mov         eax,ebx
 0042A725    pop         ebx
 0042A726    pop         ebp
 0042A727    ret         8
end;*}

//0042A72C
{*function sub_0042A72C:?;
begin
 0042A72C    mov         eax,4B0
 0042A731    ret
end;*}

//0042A734
{*procedure sub_0042A734(?:?);
begin
 0042A734    push        ebx
 0042A735    mov         ebx,edx
 0042A737    mov         eax,ebx
 0042A739    mov         edx,42A754;'1200  (Unicode)'
 0042A73E    call        @UStrAsg
 0042A743    pop         ebx
 0042A744    ret
end;*}

//0042A774
procedure TUnicodeEncoding.GetMaxByteCount(CharCount:Integer);
begin
{*
 0042A774    inc         edx
 0042A775    mov         eax,edx
 0042A777    add         eax,eax
 0042A779    ret
*}
end;

//0042A77C
procedure TUnicodeEncoding.GetMaxCharCount(ByteCount:Integer);
begin
{*
 0042A77C    mov         eax,edx
 0042A77E    sar         eax,1
>0042A780    jns         0042A785
 0042A782    adc         eax,0
 0042A785    and         edx,1
 0042A788    add         eax,edx
 0042A78A    inc         eax
 0042A78B    ret
*}
end;

//0042A78C
{*procedure TUnicodeEncoding.GetPreamble(?:?);
begin
 0042A78C    push        ebp
 0042A78D    mov         ebp,esp
 0042A78F    push        0
 0042A791    push        ebx
 0042A792    mov         ebx,edx
 0042A794    xor         eax,eax
 0042A796    push        ebp
 0042A797    push        42A801
 0042A79C    push        dword ptr fs:[eax]
 0042A79F    mov         dword ptr fs:[eax],esp
 0042A7A2    lea         eax,[ebp-4]
 0042A7A5    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0042A7AB    call        @DynArrayClear
 0042A7B0    push        2
 0042A7B2    lea         eax,[ebp-4]
 0042A7B5    mov         ecx,1
 0042A7BA    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0042A7C0    call        @DynArraySetLength
 0042A7C5    add         esp,4
 0042A7C8    mov         eax,dword ptr [ebp-4]
 0042A7CB    mov         byte ptr [eax],0FF
 0042A7CE    mov         eax,dword ptr [ebp-4]
 0042A7D1    mov         byte ptr [eax+1],0FE
 0042A7D5    mov         edx,dword ptr [ebp-4]
 0042A7D8    mov         eax,ebx
 0042A7DA    mov         ecx,dword ptr ds:[418988];TArray<System.Byte>
 0042A7E0    call        @DynArrayAsg
 0042A7E5    xor         eax,eax
 0042A7E7    pop         edx
 0042A7E8    pop         ecx
 0042A7E9    pop         ecx
 0042A7EA    mov         dword ptr fs:[eax],edx
 0042A7ED    push        42A808
 0042A7F2    lea         eax,[ebp-4]
 0042A7F5    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0042A7FB    call        @DynArrayClear
 0042A800    ret
>0042A801    jmp         @HandleFinally
>0042A806    jmp         0042A7F2
 0042A808    pop         ebx
 0042A809    pop         ecx
 0042A80A    pop         ebp
 0042A80B    ret
end;*}

//0042A80C
procedure TBigEndianUnicodeEncoding.Clone;
begin
{*
 0042A80C    mov         dl,1
 0042A80E    mov         eax,[0041D390];TBigEndianUnicodeEncoding
 0042A813    call        TUnicodeEncoding.Create;TBigEndianUnicodeEncoding.Create
 0042A818    ret
*}
end;

//0042A81C
procedure sub_0042A81C;
begin
{*
 0042A81C    push        ebp
 0042A81D    mov         ebp,esp
 0042A81F    push        ebx
 0042A820    push        esi
 0042A821    mov         eax,dword ptr [ebp+0C]
 0042A824    mov         esi,ecx
 0042A826    dec         esi
 0042A827    test        esi,esi
>0042A829    jl          0042A845
 0042A82B    inc         esi
 0042A82C    movzx       ebx,word ptr [edx]
 0042A82F    shr         bx,8
 0042A833    mov         byte ptr [eax],bl
 0042A835    inc         eax
 0042A836    movzx       ebx,byte ptr [edx]
 0042A839    and         bl,0FF
 0042A83C    mov         byte ptr [eax],bl
 0042A83E    inc         eax
 0042A83F    add         edx,2
 0042A842    dec         esi
>0042A843    jne         0042A82C
 0042A845    mov         eax,ecx
 0042A847    add         eax,eax
 0042A849    pop         esi
 0042A84A    pop         ebx
 0042A84B    pop         ebp
 0042A84C    ret         8
*}
end;

//0042A850
{*function sub_0042A850(?:?; ?:?; ?:?):?;
begin
 0042A850    push        ebp
 0042A851    mov         ebp,esp
 0042A853    push        ebx
 0042A854    push        esi
 0042A855    push        edi
 0042A856    mov         ebx,dword ptr [ebp+0C]
 0042A859    mov         eax,edx
 0042A85B    inc         eax
 0042A85C    mov         ecx,dword ptr [ebp+8]
 0042A85F    dec         ecx
 0042A860    test        ecx,ecx
>0042A862    jl          0042A880
 0042A864    inc         ecx
 0042A865    movzx       esi,byte ptr [eax]
 0042A868    movzx       edi,byte ptr [edx]
 0042A86B    shl         edi,8
 0042A86E    or          si,di
 0042A871    mov         word ptr [ebx],si
 0042A874    add         edx,2
 0042A877    add         eax,2
 0042A87A    add         ebx,2
 0042A87D    dec         ecx
>0042A87E    jne         0042A865
 0042A880    mov         eax,dword ptr [ebp+8]
 0042A883    pop         edi
 0042A884    pop         esi
 0042A885    pop         ebx
 0042A886    pop         ebp
 0042A887    ret         8
end;*}

//0042A88C
{*function sub_0042A88C:?;
begin
 0042A88C    mov         eax,4B1
 0042A891    ret
end;*}

//0042A894
{*procedure sub_0042A894(?:?);
begin
 0042A894    push        ebx
 0042A895    mov         ebx,edx
 0042A897    mov         eax,ebx
 0042A899    mov         edx,42A8B4;'1201  (Unicode - Big-Endian)'
 0042A89E    call        @UStrAsg
 0042A8A3    pop         ebx
 0042A8A4    ret
end;*}

//0042A8F0
{*procedure TBigEndianUnicodeEncoding.GetPreamble(?:?);
begin
 0042A8F0    push        ebp
 0042A8F1    mov         ebp,esp
 0042A8F3    push        0
 0042A8F5    push        ebx
 0042A8F6    mov         ebx,edx
 0042A8F8    xor         eax,eax
 0042A8FA    push        ebp
 0042A8FB    push        42A965
 0042A900    push        dword ptr fs:[eax]
 0042A903    mov         dword ptr fs:[eax],esp
 0042A906    lea         eax,[ebp-4]
 0042A909    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0042A90F    call        @DynArrayClear
 0042A914    push        2
 0042A916    lea         eax,[ebp-4]
 0042A919    mov         ecx,1
 0042A91E    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0042A924    call        @DynArraySetLength
 0042A929    add         esp,4
 0042A92C    mov         eax,dword ptr [ebp-4]
 0042A92F    mov         byte ptr [eax],0FE
 0042A932    mov         eax,dword ptr [ebp-4]
 0042A935    mov         byte ptr [eax+1],0FF
 0042A939    mov         edx,dword ptr [ebp-4]
 0042A93C    mov         eax,ebx
 0042A93E    mov         ecx,dword ptr ds:[418988];TArray<System.Byte>
 0042A944    call        @DynArrayAsg
 0042A949    xor         eax,eax
 0042A94B    pop         edx
 0042A94C    pop         ecx
 0042A94D    pop         ecx
 0042A94E    mov         dword ptr fs:[eax],edx
 0042A951    push        42A96C
 0042A956    lea         eax,[ebp-4]
 0042A959    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0042A95F    call        @DynArrayClear
 0042A964    ret
>0042A965    jmp         @HandleFinally
>0042A96A    jmp         0042A956
 0042A96C    pop         ebx
 0042A96D    pop         ecx
 0042A96E    pop         ebp
 0042A96F    ret
end;*}

//0042A970
function BytesOf(const Val:RawByteString):TBytes;
begin
{*
 0042A970    push        ebx
 0042A971    push        esi
 0042A972    push        edi
 0042A973    push        ecx
 0042A974    mov         edi,edx
 0042A976    mov         esi,eax
 0042A978    mov         dword ptr [esp],esi
 0042A97B    mov         eax,dword ptr [esp]
 0042A97E    test        eax,eax
>0042A980    je          0042A987
 0042A982    sub         eax,4
 0042A985    mov         eax,dword ptr [eax]
 0042A987    mov         ebx,eax
 0042A989    push        ebx
 0042A98A    mov         eax,edi
 0042A98C    mov         ecx,1
 0042A991    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0042A997    call        @DynArraySetLength
 0042A99C    add         esp,4
 0042A99F    mov         eax,dword ptr [edi]
 0042A9A1    push        eax
 0042A9A2    mov         eax,esi
 0042A9A4    call        @LStrToPChar
 0042A9A9    mov         ecx,ebx
 0042A9AB    pop         edx
 0042A9AC    call        Move
 0042A9B1    pop         edx
 0042A9B2    pop         edi
 0042A9B3    pop         esi
 0042A9B4    pop         ebx
 0042A9B5    ret
*}
end;

Initialization
//00780104
{*
 00780104    push        ebp
 00780105    mov         ebp,esp
 00780107    xor         eax,eax
 00780109    push        ebp
 0078010A    push        780189
 0078010F    push        dword ptr fs:[eax]
 00780112    mov         dword ptr fs:[eax],esp
 00780115    sub         dword ptr ds:[790E0C],1
>0078011C    jae         0078017B
 0078011E    mov         eax,42A9B8
 00780123    call        @InitResStringImports
 00780128    mov         eax,42AA10
 0078012D    call        @InitImports
 00780132    cmp         byte ptr ds:[790C35],0;gvar_00790C35
>00780139    je          0078014A
 0078013B    mov         eax,784CE0;^'$'
 00780140    mov         edx,7801A0;'0x'
 00780145    call        @UStrAsg
 0078014A    call        004259B0
 0078014F    mov         eax,426874;sub_00426874
 00780154    call        AddModuleUnloadProc
 00780159    call        00425A50
 0078015E    call        00426A8C
 00780163    mov         edx,784E4C
 00780168    xor         eax,eax
 0078016A    call        GetLocaleOverride
 0078016F    xor         eax,eax
 00780171    mov         [00790E10],eax;gvar_00790E10
 00780176    call        GetFormatSettings
 0078017B    xor         eax,eax
 0078017D    pop         edx
 0078017E    pop         ecx
 0078017F    pop         ecx
 00780180    mov         dword ptr fs:[eax],edx
 00780183    push        780190
 00780188    ret
>00780189    jmp         @HandleFinally
>0078018E    jmp         00780188
 00780190    pop         ebp
 00780191    ret
*}
Finalization
//0042ABF4
{*
 0042ABF4    push        ebp
 0042ABF5    mov         ebp,esp
 0042ABF7    xor         eax,eax
 0042ABF9    push        ebp
 0042ABFA    push        42AD7D
 0042ABFF    push        dword ptr fs:[eax]
 0042AC02    mov         dword ptr fs:[eax],esp
 0042AC05    inc         dword ptr ds:[790E0C]
>0042AC0B    jne         0042AD6F
 0042AC11    mov         eax,426874;sub_00426874
 0042AC16    call        0040B034
 0042AC1B    call        004274C4
 0042AC20    call        00426A68
 0042AC25    call        00425A1C
 0042AC2A    mov         eax,784C70
 0042AC2F    call        @UStrClr
 0042AC34    mov         eax,784C74
 0042AC39    call        @WStrClr
 0042AC3E    mov         eax,784C78
 0042AC43    call        @LStrClr
 0042AC48    mov         eax,784C8C;gvar_00784C8C
 0042AC4D    call        @UStrClr
 0042AC52    mov         eax,790CDC;gvar_00790CDC:TFormatSettings
 0042AC57    call        @UStrClr
 0042AC5C    mov         eax,790CE8;gvar_00790CE8:UnicodeString
 0042AC61    call        @UStrClr
 0042AC66    mov         eax,790CEC;gvar_00790CEC:UnicodeString
 0042AC6B    call        @UStrClr
 0042AC70    mov         eax,790CF0;gvar_00790CF0:UnicodeString
 0042AC75    call        @UStrClr
 0042AC7A    mov         eax,790CF4;gvar_00790CF4:UnicodeString
 0042AC7F    call        @UStrClr
 0042AC84    mov         eax,790CF8;gvar_00790CF8:UnicodeString
 0042AC89    call        @UStrClr
 0042AC8E    mov         eax,790CFC;gvar_00790CFC:UnicodeString
 0042AC93    call        @UStrClr
 0042AC98    mov         eax,790D00;gvar_00790D00:array[12] of ?
 0042AC9D    mov         ecx,0C
 0042ACA2    mov         edx,dword ptr ds:[40128C];string
 0042ACA8    call        @FinalizeArray
 0042ACAD    mov         eax,790D30;gvar_00790D30:array[12] of ?
 0042ACB2    mov         ecx,0C
 0042ACB7    mov         edx,dword ptr ds:[40128C];string
 0042ACBD    call        @FinalizeArray
 0042ACC2    mov         eax,790D60;gvar_00790D60:array[7] of ?
 0042ACC7    mov         ecx,7
 0042ACCC    mov         edx,dword ptr ds:[40128C];string
 0042ACD2    call        @FinalizeArray
 0042ACD7    mov         eax,790D7C;gvar_00790D7C:array[7] of ?
 0042ACDC    mov         ecx,7
 0042ACE1    mov         edx,dword ptr ds:[40128C];string
 0042ACE7    call        @FinalizeArray
 0042ACEC    mov         eax,790DB0;gvar_00790DB0:array[7] of ?
 0042ACF1    mov         ecx,7
 0042ACF6    mov         edx,dword ptr ds:[40128C];string
 0042ACFC    call        @FinalizeArray
 0042AD01    mov         eax,790DE8;gvar_00790DE8:?
 0042AD06    mov         edx,dword ptr ds:[41ADB4];:65
 0042AD0C    call        @DynArrayClear
 0042AD11    mov         eax,790DEC;gvar_00790DEC:?
 0042AD16    mov         edx,dword ptr ds:[41ADDC];:75
 0042AD1C    call        @DynArrayClear
 0042AD21    mov         eax,784CE0;^'$'
 0042AD26    call        @UStrClr
 0042AD2B    mov         eax,784CEC;^'0'
 0042AD30    mov         ecx,2
 0042AD35    mov         edx,dword ptr ds:[40128C];string
 0042AD3B    call        @FinalizeArray
 0042AD40    mov         eax,784DFC;gvar_00784DFC:array[7] of ?
 0042AD45    mov         ecx,7
 0042AD4A    mov         edx,dword ptr ds:[4257F8];TErrorRec
 0042AD50    call        @FinalizeArray
 0042AD55    mov         eax,792F14;gvar_00792F14:?
 0042AD5A    mov         edx,dword ptr ds:[443238];TArray<System.string>
 0042AD60    call        @DynArrayClear
 0042AD65    mov         eax,784E4C
 0042AD6A    call        @UStrClr
 0042AD6F    xor         eax,eax
 0042AD71    pop         edx
 0042AD72    pop         ecx
 0042AD73    pop         ecx
 0042AD74    mov         dword ptr fs:[eax],edx
 0042AD77    push        42AD84
 0042AD7C    ret
>0042AD7D    jmp         @HandleFinally
>0042AD82    jmp         0042AD7C
 0042AD84    pop         ebp
 0042AD85    ret
*}
end.