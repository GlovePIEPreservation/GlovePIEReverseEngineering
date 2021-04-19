//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit5;

interface

uses
  SysUtils, Classes;

    function Languages:TLanguages;//00427420
    function SafeLoadLibrary(const FileName:UnicodeString; ErrorMode:UINT):HMODULE;//00427440
    procedure sub_004274C4;//004274C4
    //function Append(Value:UInt64; ?:?):TStringBuilder;//004274F8
    //function Append(?:?):?;//0042754C
    function Append(Value:Single):TStringBuilder;//00427584
    function Append(Value:string):TStringBuilder;//004275E0
    function Append(Value:Word):TStringBuilder;//00427638
    //function Append(?:?; ?:?; ?:?):?;//0042768C
    function Append(Value:string; StartIndex:Integer; Count:Integer):TStringBuilder;//0042772C
    function Append(Value:PAnsiChar):TStringBuilder;//004277D0
    function Append(Value:RawByteString):TStringBuilder;//00427824
    function Append(Value:Cardinal):TStringBuilder;//00427878
    function Append(Value:Char; RepeatCount:Integer):TStringBuilder;//004278CC
    function Append(Value:ShortInt):TStringBuilder;//00427924
    function Append(Value:Char):TStringBuilder;//00427978
    //function Append(Value:Currency; ?:?):TStringBuilder;//0042799C
    function Append(Value:Boolean):TStringBuilder;//004279F4
    function Append(Value:Byte):TStringBuilder;//00427A4C
    function Append(Value:Double):TStringBuilder;//00427AA0
    //function Append(Value:Int64; ?:?):TStringBuilder;//00427AFC
    function Append(Value:TObject):TStringBuilder;//00427B50
    function Append(Value:SmallInt):TStringBuilder;//00427BA4
    function Append(Value:Integer):TStringBuilder;//00427BF8
    //function AppendFormat(?:?; ?:?; ?:?):?;//00427C4C
    function AppendLine:TStringBuilder;//00427CAC
    function AppendLine(Value:string):TStringBuilder;//00427CD0
    procedure Clear;//00427CE8
    procedure sub_00427D04(?:TStringBuilder; ?:Integer);//00427D04
    //procedure CopyTo(?:?; ?:?; ?:?; ?:?);//00427D38
    constructor Create();//00427E80
    constructor sub_00427ED0(Value:string; aCapacity:Integer);//00427ED0
    constructor sub_00427F30(Value:string; aCapacity:Integer; Length:Integer; StartIndex:Integer);//00427F30
    constructor sub_00427FB8(aCapacity:Integer; aMaxCapacity:Integer);//00427FB8
    constructor sub_00427FFC(aCapacity:Integer);//00427FFC
    constructor sub_0042804C(Value:string);//0042804C
    procedure EnsureCapacity(aCapacity:Integer);//00428090
    function Equals(StringBuilder:TStringBuilder):Boolean;//004280E8
    procedure ExpandCapacity;//0042813C
    function GetCapacity:Integer;//00428180
    function GetMaxCapacity:Integer;//0042818C
    function Insert(Index:Integer; Value:TObject):TStringBuilder;//00428190
    //function Insert(Index:Integer; Value:Int64; ?:?):TStringBuilder;//004281E8
    function Insert(Index:Integer; Value:Single):TStringBuilder;//00428244
    function Insert(Index:Integer; Value:string):TStringBuilder;//004282A8
    function Insert(Index:Integer; Value:Word):TStringBuilder;//00428394
    function Insert(Index:Integer; Value:ShortInt):TStringBuilder;//004283EC
    //function Insert(?:?; ?:?):?;//00428448
    //function Insert(Index:Integer; Value:Currency; ?:?):TStringBuilder;//00428518
    function Insert(Index:Integer; Value:Char):TStringBuilder;//00428578
    function Insert(Index:Integer; Value:Byte):TStringBuilder;//00428624
    function Insert(Index:Integer; Value:Double):TStringBuilder;//00428680
    function Insert(Index:Integer; Value:Integer):TStringBuilder;//004286E4
    function Insert(Index:Integer; Value:SmallInt):TStringBuilder;//0042873C
    function Insert(Index:Integer; Value:Boolean):TStringBuilder;//00428794
    function Insert(Index:Integer; Value:string; count:Integer):TStringBuilder;//004287F0
    //function Insert(?:?; ?:?; ?:?; ?:?):?;//00428820
    function Insert(Index:Integer; Value:Cardinal):TStringBuilder;//004289D0
    //function Insert(Index:Integer; Value:UInt64; ?:?):TStringBuilder;//00428A2C
    procedure sub_00428A88(?:TStringBuilder);//00428A88
    function Remove(StartIndex:Integer; RemLength:Integer):TStringBuilder;//00428AC4
    function Replace(OldValue:string; NewValue:string; Count:Integer; StartIndex:Integer):TStringBuilder;//00428BD0
    function Replace(OldChar:Char; NewChar:Char; Count:Integer; StartIndex:Integer):TStringBuilder;//00428DA0
    procedure Replace(OldChar:Char; NewChar:Char);//00428EA0
    function Replace(OldValue:string; NewValue:string):TStringBuilder;//00428EC8
    procedure SetCapacity(Value:Integer);//00428EDC
    procedure SetLength(Value:Integer);//00428F50
    //procedure ToString(?:?);//00429038
    //procedure ToString(StartIndex:Integer; StrLength:Integer; ?:?);//00429064
    //function sub_00429164(?:TStringBuilder; ?:Integer; ?:string; ?:?):?;//00429164
    //function sub_0042928C:?;//0042928C
    //function sub_004292B4(?:?; ?:?):?;//004292B4
    function Clone:TEncoding;//004293E4
    //procedure Convert(?:?; ?:?; ?:?; ?:?);//004293E8
    //procedure Convert(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//00429468

implementation

//00427420
function Languages:TLanguages;
begin
{*
 00427420    cmp         dword ptr ds:[792F10],0;gvar_00792F10
>00427427    jne         0042743A
 00427429    mov         dl,1
 0042742B    mov         eax,[00418A40];TLanguages
 00427430    call        TLanguages.Create
 00427435    mov         [00792F10],eax;gvar_00792F10
 0042743A    mov         eax,[00792F10];gvar_00792F10
 0042743F    ret
*}
end;

//00427440
function SafeLoadLibrary(const FileName:UnicodeString; ErrorMode:UINT):HMODULE;
begin
{*
 00427440    push        ebp
 00427441    mov         ebp,esp
 00427443    add         esp,0FFFFFFF4
 00427446    push        ebx
 00427447    mov         ebx,eax
 00427449    push        edx
 0042744A    call        kernel32.SetErrorMode
 0042744F    mov         dword ptr [ebp-0C],eax
 00427452    xor         eax,eax
 00427454    push        ebp
 00427455    push        4274B2
 0042745A    push        dword ptr fs:[eax]
 0042745D    mov         dword ptr fs:[eax],esp
 00427460    fnstcw      word ptr [ebp-2]
 00427463    xor         eax,eax
 00427465    push        ebp
 00427466    push        427494
 0042746B    push        dword ptr fs:[eax]
 0042746E    mov         dword ptr fs:[eax],esp
 00427471    mov         eax,ebx
 00427473    call        @UStrToPWChar
 00427478    push        eax
 00427479    call        kernel32.LoadLibraryW
 0042747E    mov         dword ptr [ebp-8],eax
 00427481    xor         eax,eax
 00427483    pop         edx
 00427484    pop         ecx
 00427485    pop         ecx
 00427486    mov         dword ptr fs:[eax],edx
 00427489    push        42749B
 0042748E    fnclex
 00427490    fldcw       word ptr [ebp-2]
 00427493    ret
>00427494    jmp         @HandleFinally
>00427499    jmp         0042748E
 0042749B    xor         eax,eax
 0042749D    pop         edx
 0042749E    pop         ecx
 0042749F    pop         ecx
 004274A0    mov         dword ptr fs:[eax],edx
 004274A3    push        4274B9
 004274A8    mov         eax,dword ptr [ebp-0C]
 004274AB    push        eax
 004274AC    call        kernel32.SetErrorMode
 004274B1    ret
>004274B2    jmp         @HandleFinally
>004274B7    jmp         004274A8
 004274B9    mov         eax,dword ptr [ebp-8]
 004274BC    pop         ebx
 004274BD    mov         esp,ebp
 004274BF    pop         ebp
 004274C0    ret
*}
end;

//004274C4
procedure sub_004274C4;
begin
{*
 004274C4    push        ebx
 004274C5    mov         ebx,dword ptr ds:[78D8B8];^gvar_00784034
 004274CB    mov         ebx,dword ptr [ebx]
 004274CD    test        ebx,ebx
>004274CF    je          004274F0
 004274D1    cmp         dword ptr [ebx+18],0
>004274D5    je          004274EA
 004274D7    mov         edx,dword ptr ds:[42670C];TModuleInfo
 004274DD    mov         eax,dword ptr [ebx+18]
 004274E0    call        @Dispose
 004274E5    xor         eax,eax
 004274E7    mov         dword ptr [ebx+18],eax
 004274EA    mov         ebx,dword ptr [ebx]
 004274EC    test        ebx,ebx
>004274EE    jne         004274D1
 004274F0    pop         ebx
 004274F1    ret
*}
end;

//004274F8
{*function TStringBuilder.Append(Value:UInt64; ?:?):TStringBuilder;
begin
 004274F8    push        ebp
 004274F9    mov         ebp,esp
 004274FB    push        0
 004274FD    push        ebx
 004274FE    mov         ebx,eax
 00427500    xor         eax,eax
 00427502    push        ebp
 00427503    push        42753C
 00427508    push        dword ptr fs:[eax]
 0042750B    mov         dword ptr fs:[eax],esp
 0042750E    push        dword ptr [ebp+0C]
 00427511    push        dword ptr [ebp+8]
 00427514    lea         eax,[ebp-4]
 00427517    call        UIntToStr
 0042751C    mov         edx,dword ptr [ebp-4]
 0042751F    mov         eax,ebx
 00427521    call        TStringBuilder.Append
 00427526    xor         eax,eax
 00427528    pop         edx
 00427529    pop         ecx
 0042752A    pop         ecx
 0042752B    mov         dword ptr fs:[eax],edx
 0042752E    push        427543
 00427533    lea         eax,[ebp-4]
 00427536    call        @UStrClr
 0042753B    ret
>0042753C    jmp         @HandleFinally
>00427541    jmp         00427533
 00427543    mov         eax,ebx
 00427545    pop         ebx
 00427546    pop         ecx
 00427547    pop         ebp
 00427548    ret         8
end;*}

//0042754C
{*function TStringBuilder.Append(?:?):?;
begin
 0042754C    push        ebx
 0042754D    push        esi
 0042754E    push        edi
 0042754F    mov         ebx,edx
 00427551    mov         edi,eax
 00427553    mov         esi,edi
 00427555    mov         eax,ebx
 00427557    call        @DynArrayLength
 0042755C    dec         eax
 0042755D    test        eax,eax
>0042755F    jl          0042756F
 00427561    inc         eax
 00427562    xor         edx,edx
 00427564    cmp         word ptr [ebx+edx*2],0
>00427569    je          0042756F
 0042756B    inc         edx
 0042756C    dec         eax
>0042756D    jne         00427564
 0042756F    push        edx
 00427570    xor         ecx,ecx
 00427572    mov         eax,edi
 00427574    mov         edx,ebx
 00427576    call        TStringBuilder.Append
 0042757B    mov         eax,esi
 0042757D    pop         edi
 0042757E    pop         esi
 0042757F    pop         ebx
 00427580    ret
end;*}

//00427584
function TStringBuilder.Append(Value:Single):TStringBuilder;
begin
{*
 00427584    push        ebp
 00427585    mov         ebp,esp
 00427587    push        0
 00427589    push        ebx
 0042758A    mov         ebx,eax
 0042758C    xor         eax,eax
 0042758E    push        ebp
 0042758F    push        4275D1
 00427594    push        dword ptr fs:[eax]
 00427597    mov         dword ptr fs:[eax],esp
 0042759A    fld         dword ptr [ebp+8]
 0042759D    add         esp,0FFFFFFF4
 004275A0    fstp        tbyte ptr [esp]
 004275A3    wait
 004275A4    lea         edx,[ebp-4]
 004275A7    mov         eax,790CDC;gvar_00790CDC:TFormatSettings
 004275AC    call        FloatToStr
 004275B1    mov         edx,dword ptr [ebp-4]
 004275B4    mov         eax,ebx
 004275B6    call        TStringBuilder.Append
 004275BB    xor         eax,eax
 004275BD    pop         edx
 004275BE    pop         ecx
 004275BF    pop         ecx
 004275C0    mov         dword ptr fs:[eax],edx
 004275C3    push        4275D8
 004275C8    lea         eax,[ebp-4]
 004275CB    call        @UStrClr
 004275D0    ret
>004275D1    jmp         @HandleFinally
>004275D6    jmp         004275C8
 004275D8    mov         eax,ebx
 004275DA    pop         ebx
 004275DB    pop         ecx
 004275DC    pop         ebp
 004275DD    ret         4
*}
end;

//004275E0
function TStringBuilder.Append(Value:string):TStringBuilder;
begin
{*
 004275E0    push        ebx
 004275E1    push        esi
 004275E2    push        edi
 004275E3    push        ebp
 004275E4    mov         ebp,edx
 004275E6    mov         ebx,eax
 004275E8    mov         edi,ebp
 004275EA    mov         eax,edi
 004275EC    test        eax,eax
>004275EE    je          004275F5
 004275F0    sub         eax,4
 004275F3    mov         eax,dword ptr [eax]
 004275F5    mov         edx,dword ptr [ebx+8]
 004275F8    add         edx,eax
 004275FA    mov         eax,ebx
 004275FC    call        TStringBuilder.SetLength
 00427601    mov         esi,edi
 00427603    test        esi,esi
>00427605    je          0042760C
 00427607    sub         esi,4
 0042760A    mov         esi,dword ptr [esi]
 0042760C    test        edi,edi
>0042760E    je          00427615
 00427610    sub         edi,4
 00427613    mov         edi,dword ptr [edi]
 00427615    mov         eax,ebp
 00427617    call        @UStrToPWChar
 0042761C    mov         edx,dword ptr [ebx+8]
 0042761F    sub         edx,esi
 00427621    mov         ecx,dword ptr [ebx+4]
 00427624    lea         edx,[ecx+edx*2]
 00427627    mov         ecx,edi
 00427629    add         ecx,ecx
 0042762B    call        Move
 00427630    mov         eax,ebx
 00427632    pop         ebp
 00427633    pop         edi
 00427634    pop         esi
 00427635    pop         ebx
 00427636    ret
*}
end;

//00427638
function TStringBuilder.Append(Value:Word):TStringBuilder;
begin
{*
 00427638    push        ebp
 00427639    mov         ebp,esp
 0042763B    push        0
 0042763D    push        ebx
 0042763E    push        esi
 0042763F    mov         esi,edx
 00427641    mov         ebx,eax
 00427643    xor         eax,eax
 00427645    push        ebp
 00427646    push        42767C
 0042764B    push        dword ptr fs:[eax]
 0042764E    mov         dword ptr fs:[eax],esp
 00427651    lea         edx,[ebp-4]
 00427654    movzx       eax,si
 00427657    call        IntToStr
 0042765C    mov         edx,dword ptr [ebp-4]
 0042765F    mov         eax,ebx
 00427661    call        TStringBuilder.Append
 00427666    xor         eax,eax
 00427668    pop         edx
 00427669    pop         ecx
 0042766A    pop         ecx
 0042766B    mov         dword ptr fs:[eax],edx
 0042766E    push        427683
 00427673    lea         eax,[ebp-4]
 00427676    call        @UStrClr
 0042767B    ret
>0042767C    jmp         @HandleFinally
>00427681    jmp         00427673
 00427683    mov         eax,ebx
 00427685    pop         esi
 00427686    pop         ebx
 00427687    pop         ecx
 00427688    pop         ebp
 00427689    ret
*}
end;

//0042768C
{*function TStringBuilder.Append(?:?; ?:?; ?:?):?;
begin
 0042768C    push        ebp
 0042768D    mov         ebp,esp
 0042768F    add         esp,0FFFFFFF4
 00427692    push        ebx
 00427693    push        esi
 00427694    push        edi
 00427695    mov         esi,ecx
 00427697    mov         dword ptr [ebp-4],edx
 0042769A    mov         ebx,eax
 0042769C    mov         edi,dword ptr [ebp+8]
 0042769F    mov         eax,dword ptr [ebp-4]
 004276A2    call        @DynArrayLength
 004276A7    lea         edx,[edi+esi]
 004276AA    cmp         eax,edx
>004276AC    jge         004276D2
 004276AE    mov         dword ptr [ebp-0C],esi
 004276B1    mov         byte ptr [ebp-8],0
 004276B5    lea         eax,[ebp-0C]
 004276B8    push        eax
 004276B9    push        0
 004276BB    mov         ecx,dword ptr ds:[78D7A0];^SResString132:TResStringRec
 004276C1    mov         dl,1
 004276C3    mov         eax,[00419B58];ERangeError
 004276C8    call        Exception.CreateResFmt;ERangeError.Create
 004276CD    call        @RaiseExcept
 004276D2    test        esi,esi
>004276D4    jge         004276FA
 004276D6    mov         dword ptr [ebp-0C],esi
 004276D9    mov         byte ptr [ebp-8],0
 004276DD    lea         eax,[ebp-0C]
 004276E0    push        eax
 004276E1    push        0
 004276E3    mov         ecx,dword ptr ds:[78D7A0];^SResString132:TResStringRec
 004276E9    mov         dl,1
 004276EB    mov         eax,[00419B58];ERangeError
 004276F0    call        Exception.CreateResFmt;ERangeError.Create
 004276F5    call        @RaiseExcept
 004276FA    mov         edx,dword ptr [ebx+8];TStringBuilder.FLength:Integer
 004276FD    add         edx,edi
 004276FF    mov         eax,ebx
 00427701    call        TStringBuilder.SetLength
 00427706    mov         eax,dword ptr [ebx+8];TStringBuilder.FLength:Integer
 00427709    sub         eax,edi
 0042770B    mov         edx,dword ptr [ebx+4];TStringBuilder.FData:?
 0042770E    lea         edx,[edx+eax*2]
 00427711    mov         ecx,edi
 00427713    add         ecx,ecx
 00427715    mov         eax,dword ptr [ebp-4]
 00427718    lea         eax,[eax+esi*2]
 0042771B    call        Move
 00427720    mov         eax,ebx
 00427722    pop         edi
 00427723    pop         esi
 00427724    pop         ebx
 00427725    mov         esp,ebp
 00427727    pop         ebp
 00427728    ret         4
end;*}

//0042772C
function TStringBuilder.Append(Value:string; StartIndex:Integer; Count:Integer):TStringBuilder;
begin
{*
 0042772C    push        ebp
 0042772D    mov         ebp,esp
 0042772F    add         esp,0FFFFFFF4
 00427732    push        ebx
 00427733    push        esi
 00427734    push        edi
 00427735    mov         esi,ecx
 00427737    mov         dword ptr [ebp-4],edx
 0042773A    mov         ebx,eax
 0042773C    mov         edi,dword ptr [ebp+8]
 0042773F    mov         eax,dword ptr [ebp-4]
 00427742    test        eax,eax
>00427744    je          0042774B
 00427746    sub         eax,4
 00427749    mov         eax,dword ptr [eax]
 0042774B    lea         edx,[edi+esi]
 0042774E    cmp         eax,edx
>00427750    jge         00427776
 00427752    mov         dword ptr [ebp-0C],esi
 00427755    mov         byte ptr [ebp-8],0
 00427759    lea         eax,[ebp-0C]
 0042775C    push        eax
 0042775D    push        0
 0042775F    mov         ecx,dword ptr ds:[78D7A0];^SResString132:TResStringRec
 00427765    mov         dl,1
 00427767    mov         eax,[00419B58];ERangeError
 0042776C    call        Exception.CreateResFmt;ERangeError.Create
 00427771    call        @RaiseExcept
 00427776    test        esi,esi
>00427778    jge         0042779E
 0042777A    mov         dword ptr [ebp-0C],esi
 0042777D    mov         byte ptr [ebp-8],0
 00427781    lea         eax,[ebp-0C]
 00427784    push        eax
 00427785    push        0
 00427787    mov         ecx,dword ptr ds:[78D7A0];^SResString132:TResStringRec
 0042778D    mov         dl,1
 0042778F    mov         eax,[00419B58];ERangeError
 00427794    call        Exception.CreateResFmt;ERangeError.Create
 00427799    call        @RaiseExcept
 0042779E    mov         edx,dword ptr [ebx+8];TStringBuilder.FLength:Integer
 004277A1    add         edx,edi
 004277A3    mov         eax,ebx
 004277A5    call        TStringBuilder.SetLength
 004277AA    mov         eax,dword ptr [ebx+8];TStringBuilder.FLength:Integer
 004277AD    sub         eax,edi
 004277AF    mov         edx,dword ptr [ebx+4];TStringBuilder.FData:?
 004277B2    lea         edx,[edx+eax*2]
 004277B5    mov         ecx,edi
 004277B7    add         ecx,ecx
 004277B9    mov         eax,dword ptr [ebp-4]
 004277BC    lea         eax,[eax+esi*2]
 004277BF    call        Move
 004277C4    mov         eax,ebx
 004277C6    pop         edi
 004277C7    pop         esi
 004277C8    pop         ebx
 004277C9    mov         esp,ebp
 004277CB    pop         ebp
 004277CC    ret         4
*}
end;

//004277D0
function TStringBuilder.Append(Value:PAnsiChar):TStringBuilder;
begin
{*
 004277D0    push        ebp
 004277D1    mov         ebp,esp
 004277D3    push        0
 004277D5    push        ebx
 004277D6    push        esi
 004277D7    mov         esi,edx
 004277D9    mov         ebx,eax
 004277DB    xor         eax,eax
 004277DD    push        ebp
 004277DE    push        427813
 004277E3    push        dword ptr fs:[eax]
 004277E6    mov         dword ptr fs:[eax],esp
 004277E9    lea         eax,[ebp-4]
 004277EC    mov         edx,esi
 004277EE    call        @UStrFromPChar
 004277F3    mov         edx,dword ptr [ebp-4]
 004277F6    mov         eax,ebx
 004277F8    call        TStringBuilder.Append
 004277FD    xor         eax,eax
 004277FF    pop         edx
 00427800    pop         ecx
 00427801    pop         ecx
 00427802    mov         dword ptr fs:[eax],edx
 00427805    push        42781A
 0042780A    lea         eax,[ebp-4]
 0042780D    call        @UStrClr
 00427812    ret
>00427813    jmp         @HandleFinally
>00427818    jmp         0042780A
 0042781A    mov         eax,ebx
 0042781C    pop         esi
 0042781D    pop         ebx
 0042781E    pop         ecx
 0042781F    pop         ebp
 00427820    ret
*}
end;

//00427824
function TStringBuilder.Append(Value:RawByteString):TStringBuilder;
begin
{*
 00427824    push        ebp
 00427825    mov         ebp,esp
 00427827    push        0
 00427829    push        ebx
 0042782A    push        esi
 0042782B    mov         esi,edx
 0042782D    mov         ebx,eax
 0042782F    xor         eax,eax
 00427831    push        ebp
 00427832    push        427867
 00427837    push        dword ptr fs:[eax]
 0042783A    mov         dword ptr fs:[eax],esp
 0042783D    lea         eax,[ebp-4]
 00427840    mov         edx,esi
 00427842    call        @UStrFromLStr
 00427847    mov         edx,dword ptr [ebp-4]
 0042784A    mov         eax,ebx
 0042784C    call        TStringBuilder.Append
 00427851    xor         eax,eax
 00427853    pop         edx
 00427854    pop         ecx
 00427855    pop         ecx
 00427856    mov         dword ptr fs:[eax],edx
 00427859    push        42786E
 0042785E    lea         eax,[ebp-4]
 00427861    call        @UStrClr
 00427866    ret
>00427867    jmp         @HandleFinally
>0042786C    jmp         0042785E
 0042786E    mov         eax,ebx
 00427870    pop         esi
 00427871    pop         ebx
 00427872    pop         ecx
 00427873    pop         ebp
 00427874    ret
*}
end;

//00427878
function TStringBuilder.Append(Value:Cardinal):TStringBuilder;
begin
{*
 00427878    push        ebp
 00427879    mov         ebp,esp
 0042787B    push        0
 0042787D    push        ebx
 0042787E    push        esi
 0042787F    mov         esi,edx
 00427881    mov         ebx,eax
 00427883    xor         eax,eax
 00427885    push        ebp
 00427886    push        4278BB
 0042788B    push        dword ptr fs:[eax]
 0042788E    mov         dword ptr fs:[eax],esp
 00427891    lea         edx,[ebp-4]
 00427894    mov         eax,esi
 00427896    call        UIntToStr
 0042789B    mov         edx,dword ptr [ebp-4]
 0042789E    mov         eax,ebx
 004278A0    call        TStringBuilder.Append
 004278A5    xor         eax,eax
 004278A7    pop         edx
 004278A8    pop         ecx
 004278A9    pop         ecx
 004278AA    mov         dword ptr fs:[eax],edx
 004278AD    push        4278C2
 004278B2    lea         eax,[ebp-4]
 004278B5    call        @UStrClr
 004278BA    ret
>004278BB    jmp         @HandleFinally
>004278C0    jmp         004278B2
 004278C2    mov         eax,ebx
 004278C4    pop         esi
 004278C5    pop         ebx
 004278C6    pop         ecx
 004278C7    pop         ebp
 004278C8    ret
*}
end;

//004278CC
function TStringBuilder.Append(Value:Char; RepeatCount:Integer):TStringBuilder;
begin
{*
 004278CC    push        ebp
 004278CD    mov         ebp,esp
 004278CF    push        0
 004278D1    push        ebx
 004278D2    push        esi
 004278D3    push        edi
 004278D4    mov         edi,ecx
 004278D6    mov         esi,edx
 004278D8    mov         ebx,eax
 004278DA    xor         eax,eax
 004278DC    push        ebp
 004278DD    push        427914
 004278E2    push        dword ptr fs:[eax]
 004278E5    mov         dword ptr fs:[eax],esp
 004278E8    lea         ecx,[ebp-4]
 004278EB    mov         edx,edi
 004278ED    mov         eax,esi
 004278EF    call        StringOfChar
 004278F4    mov         edx,dword ptr [ebp-4]
 004278F7    mov         eax,ebx
 004278F9    call        TStringBuilder.Append
 004278FE    xor         eax,eax
 00427900    pop         edx
 00427901    pop         ecx
 00427902    pop         ecx
 00427903    mov         dword ptr fs:[eax],edx
 00427906    push        42791B
 0042790B    lea         eax,[ebp-4]
 0042790E    call        @UStrClr
 00427913    ret
>00427914    jmp         @HandleFinally
>00427919    jmp         0042790B
 0042791B    mov         eax,ebx
 0042791D    pop         edi
 0042791E    pop         esi
 0042791F    pop         ebx
 00427920    pop         ecx
 00427921    pop         ebp
 00427922    ret
*}
end;

//00427924
function TStringBuilder.Append(Value:ShortInt):TStringBuilder;
begin
{*
 00427924    push        ebp
 00427925    mov         ebp,esp
 00427927    push        0
 00427929    push        ebx
 0042792A    push        esi
 0042792B    mov         ebx,edx
 0042792D    mov         esi,eax
 0042792F    xor         eax,eax
 00427931    push        ebp
 00427932    push        42796A
 00427937    push        dword ptr fs:[eax]
 0042793A    mov         dword ptr fs:[eax],esp
 0042793D    lea         edx,[ebp-4]
 00427940    movsx       eax,bl
 00427943    call        IntToStr
 00427948    mov         edx,dword ptr [ebp-4]
 0042794B    mov         eax,esi
 0042794D    call        TStringBuilder.Append
 00427952    mov         ebx,esi
 00427954    xor         eax,eax
 00427956    pop         edx
 00427957    pop         ecx
 00427958    pop         ecx
 00427959    mov         dword ptr fs:[eax],edx
 0042795C    push        427971
 00427961    lea         eax,[ebp-4]
 00427964    call        @UStrClr
 00427969    ret
>0042796A    jmp         @HandleFinally
>0042796F    jmp         00427961
 00427971    mov         eax,ebx
 00427973    pop         esi
 00427974    pop         ebx
 00427975    pop         ecx
 00427976    pop         ebp
 00427977    ret
*}
end;

//00427978
function TStringBuilder.Append(Value:Char):TStringBuilder;
begin
{*
 00427978    push        ebx
 00427979    push        esi
 0042797A    mov         esi,edx
 0042797C    mov         ebx,eax
 0042797E    mov         edx,dword ptr [ebx+8]
 00427981    inc         edx
 00427982    mov         eax,ebx
 00427984    call        TStringBuilder.SetLength
 00427989    mov         eax,dword ptr [ebx+4]
 0042798C    mov         edx,dword ptr [ebx+8]
 0042798F    mov         word ptr [eax+edx*2-2],si
 00427994    mov         eax,ebx
 00427996    pop         esi
 00427997    pop         ebx
 00427998    ret
*}
end;

//0042799C
{*function TStringBuilder.Append(Value:Currency; ?:?):TStringBuilder;
begin
 0042799C    push        ebp
 0042799D    mov         ebp,esp
 0042799F    push        0
 004279A1    push        ebx
 004279A2    mov         ebx,eax
 004279A4    xor         eax,eax
 004279A6    push        ebp
 004279A7    push        4279E5
 004279AC    push        dword ptr fs:[eax]
 004279AF    mov         dword ptr fs:[eax],esp
 004279B2    push        dword ptr [ebp+0C]
 004279B5    push        dword ptr [ebp+8]
 004279B8    lea         edx,[ebp-4]
 004279BB    mov         eax,790CDC;gvar_00790CDC:TFormatSettings
 004279C0    call        CurrToStr
 004279C5    mov         edx,dword ptr [ebp-4]
 004279C8    mov         eax,ebx
 004279CA    call        TStringBuilder.Append
 004279CF    xor         eax,eax
 004279D1    pop         edx
 004279D2    pop         ecx
 004279D3    pop         ecx
 004279D4    mov         dword ptr fs:[eax],edx
 004279D7    push        4279EC
 004279DC    lea         eax,[ebp-4]
 004279DF    call        @UStrClr
 004279E4    ret
>004279E5    jmp         @HandleFinally
>004279EA    jmp         004279DC
 004279EC    mov         eax,ebx
 004279EE    pop         ebx
 004279EF    pop         ecx
 004279F0    pop         ebp
 004279F1    ret         8
end;*}

//004279F4
function TStringBuilder.Append(Value:Boolean):TStringBuilder;
begin
{*
 004279F4    push        ebp
 004279F5    mov         ebp,esp
 004279F7    push        0
 004279F9    push        ebx
 004279FA    push        esi
 004279FB    mov         ebx,edx
 004279FD    mov         esi,eax
 004279FF    xor         eax,eax
 00427A01    push        ebp
 00427A02    push        427A3B
 00427A07    push        dword ptr fs:[eax]
 00427A0A    mov         dword ptr fs:[eax],esp
 00427A0D    lea         ecx,[ebp-4]
 00427A10    mov         dl,1
 00427A12    mov         eax,ebx
 00427A14    call        BoolToStr
 00427A19    mov         edx,dword ptr [ebp-4]
 00427A1C    mov         eax,esi
 00427A1E    call        TStringBuilder.Append
 00427A23    mov         ebx,esi
 00427A25    xor         eax,eax
 00427A27    pop         edx
 00427A28    pop         ecx
 00427A29    pop         ecx
 00427A2A    mov         dword ptr fs:[eax],edx
 00427A2D    push        427A42
 00427A32    lea         eax,[ebp-4]
 00427A35    call        @UStrClr
 00427A3A    ret
>00427A3B    jmp         @HandleFinally
>00427A40    jmp         00427A32
 00427A42    mov         eax,ebx
 00427A44    pop         esi
 00427A45    pop         ebx
 00427A46    pop         ecx
 00427A47    pop         ebp
 00427A48    ret
*}
end;

//00427A4C
function TStringBuilder.Append(Value:Byte):TStringBuilder;
begin
{*
 00427A4C    push        ebp
 00427A4D    mov         ebp,esp
 00427A4F    push        0
 00427A51    push        ebx
 00427A52    push        esi
 00427A53    mov         ebx,edx
 00427A55    mov         esi,eax
 00427A57    xor         eax,eax
 00427A59    push        ebp
 00427A5A    push        427A92
 00427A5F    push        dword ptr fs:[eax]
 00427A62    mov         dword ptr fs:[eax],esp
 00427A65    lea         edx,[ebp-4]
 00427A68    movzx       eax,bl
 00427A6B    call        IntToStr
 00427A70    mov         edx,dword ptr [ebp-4]
 00427A73    mov         eax,esi
 00427A75    call        TStringBuilder.Append
 00427A7A    mov         ebx,esi
 00427A7C    xor         eax,eax
 00427A7E    pop         edx
 00427A7F    pop         ecx
 00427A80    pop         ecx
 00427A81    mov         dword ptr fs:[eax],edx
 00427A84    push        427A99
 00427A89    lea         eax,[ebp-4]
 00427A8C    call        @UStrClr
 00427A91    ret
>00427A92    jmp         @HandleFinally
>00427A97    jmp         00427A89
 00427A99    mov         eax,ebx
 00427A9B    pop         esi
 00427A9C    pop         ebx
 00427A9D    pop         ecx
 00427A9E    pop         ebp
 00427A9F    ret
*}
end;

//00427AA0
function TStringBuilder.Append(Value:Double):TStringBuilder;
begin
{*
 00427AA0    push        ebp
 00427AA1    mov         ebp,esp
 00427AA3    push        0
 00427AA5    push        ebx
 00427AA6    mov         ebx,eax
 00427AA8    xor         eax,eax
 00427AAA    push        ebp
 00427AAB    push        427AED
 00427AB0    push        dword ptr fs:[eax]
 00427AB3    mov         dword ptr fs:[eax],esp
 00427AB6    fld         qword ptr [ebp+8]
 00427AB9    add         esp,0FFFFFFF4
 00427ABC    fstp        tbyte ptr [esp]
 00427ABF    wait
 00427AC0    lea         edx,[ebp-4]
 00427AC3    mov         eax,790CDC;gvar_00790CDC:TFormatSettings
 00427AC8    call        FloatToStr
 00427ACD    mov         edx,dword ptr [ebp-4]
 00427AD0    mov         eax,ebx
 00427AD2    call        TStringBuilder.Append
 00427AD7    xor         eax,eax
 00427AD9    pop         edx
 00427ADA    pop         ecx
 00427ADB    pop         ecx
 00427ADC    mov         dword ptr fs:[eax],edx
 00427ADF    push        427AF4
 00427AE4    lea         eax,[ebp-4]
 00427AE7    call        @UStrClr
 00427AEC    ret
>00427AED    jmp         @HandleFinally
>00427AF2    jmp         00427AE4
 00427AF4    mov         eax,ebx
 00427AF6    pop         ebx
 00427AF7    pop         ecx
 00427AF8    pop         ebp
 00427AF9    ret         8
*}
end;

//00427AFC
{*function TStringBuilder.Append(Value:Int64; ?:?):TStringBuilder;
begin
 00427AFC    push        ebp
 00427AFD    mov         ebp,esp
 00427AFF    push        0
 00427B01    push        ebx
 00427B02    mov         ebx,eax
 00427B04    xor         eax,eax
 00427B06    push        ebp
 00427B07    push        427B40
 00427B0C    push        dword ptr fs:[eax]
 00427B0F    mov         dword ptr fs:[eax],esp
 00427B12    push        dword ptr [ebp+0C]
 00427B15    push        dword ptr [ebp+8]
 00427B18    lea         eax,[ebp-4]
 00427B1B    call        IntToStr
 00427B20    mov         edx,dword ptr [ebp-4]
 00427B23    mov         eax,ebx
 00427B25    call        TStringBuilder.Append
 00427B2A    xor         eax,eax
 00427B2C    pop         edx
 00427B2D    pop         ecx
 00427B2E    pop         ecx
 00427B2F    mov         dword ptr fs:[eax],edx
 00427B32    push        427B47
 00427B37    lea         eax,[ebp-4]
 00427B3A    call        @UStrClr
 00427B3F    ret
>00427B40    jmp         @HandleFinally
>00427B45    jmp         00427B37
 00427B47    mov         eax,ebx
 00427B49    pop         ebx
 00427B4A    pop         ecx
 00427B4B    pop         ebp
 00427B4C    ret         8
end;*}

//00427B50
function TStringBuilder.Append(Value:TObject):TStringBuilder;
begin
{*
 00427B50    push        ebp
 00427B51    mov         ebp,esp
 00427B53    push        0
 00427B55    push        ebx
 00427B56    push        esi
 00427B57    mov         esi,edx
 00427B59    mov         ebx,eax
 00427B5B    xor         eax,eax
 00427B5D    push        ebp
 00427B5E    push        427B93
 00427B63    push        dword ptr fs:[eax]
 00427B66    mov         dword ptr fs:[eax],esp
 00427B69    lea         edx,[ebp-4]
 00427B6C    mov         eax,esi
 00427B6E    mov         ecx,dword ptr [eax]
 00427B70    call        dword ptr [ecx-24]
 00427B73    mov         edx,dword ptr [ebp-4]
 00427B76    mov         eax,ebx
 00427B78    call        TStringBuilder.Append
 00427B7D    xor         eax,eax
 00427B7F    pop         edx
 00427B80    pop         ecx
 00427B81    pop         ecx
 00427B82    mov         dword ptr fs:[eax],edx
 00427B85    push        427B9A
 00427B8A    lea         eax,[ebp-4]
 00427B8D    call        @UStrClr
 00427B92    ret
>00427B93    jmp         @HandleFinally
>00427B98    jmp         00427B8A
 00427B9A    mov         eax,ebx
 00427B9C    pop         esi
 00427B9D    pop         ebx
 00427B9E    pop         ecx
 00427B9F    pop         ebp
 00427BA0    ret
*}
end;

//00427BA4
function TStringBuilder.Append(Value:SmallInt):TStringBuilder;
begin
{*
 00427BA4    push        ebp
 00427BA5    mov         ebp,esp
 00427BA7    push        0
 00427BA9    push        ebx
 00427BAA    push        esi
 00427BAB    mov         esi,edx
 00427BAD    mov         ebx,eax
 00427BAF    xor         eax,eax
 00427BB1    push        ebp
 00427BB2    push        427BE8
 00427BB7    push        dword ptr fs:[eax]
 00427BBA    mov         dword ptr fs:[eax],esp
 00427BBD    lea         edx,[ebp-4]
 00427BC0    movsx       eax,si
 00427BC3    call        IntToStr
 00427BC8    mov         edx,dword ptr [ebp-4]
 00427BCB    mov         eax,ebx
 00427BCD    call        TStringBuilder.Append
 00427BD2    xor         eax,eax
 00427BD4    pop         edx
 00427BD5    pop         ecx
 00427BD6    pop         ecx
 00427BD7    mov         dword ptr fs:[eax],edx
 00427BDA    push        427BEF
 00427BDF    lea         eax,[ebp-4]
 00427BE2    call        @UStrClr
 00427BE7    ret
>00427BE8    jmp         @HandleFinally
>00427BED    jmp         00427BDF
 00427BEF    mov         eax,ebx
 00427BF1    pop         esi
 00427BF2    pop         ebx
 00427BF3    pop         ecx
 00427BF4    pop         ebp
 00427BF5    ret
*}
end;

//00427BF8
function TStringBuilder.Append(Value:Integer):TStringBuilder;
begin
{*
 00427BF8    push        ebp
 00427BF9    mov         ebp,esp
 00427BFB    push        0
 00427BFD    push        ebx
 00427BFE    push        esi
 00427BFF    mov         esi,edx
 00427C01    mov         ebx,eax
 00427C03    xor         eax,eax
 00427C05    push        ebp
 00427C06    push        427C3B
 00427C0B    push        dword ptr fs:[eax]
 00427C0E    mov         dword ptr fs:[eax],esp
 00427C11    lea         edx,[ebp-4]
 00427C14    mov         eax,esi
 00427C16    call        IntToStr
 00427C1B    mov         edx,dword ptr [ebp-4]
 00427C1E    mov         eax,ebx
 00427C20    call        TStringBuilder.Append
 00427C25    xor         eax,eax
 00427C27    pop         edx
 00427C28    pop         ecx
 00427C29    pop         ecx
 00427C2A    mov         dword ptr fs:[eax],edx
 00427C2D    push        427C42
 00427C32    lea         eax,[ebp-4]
 00427C35    call        @UStrClr
 00427C3A    ret
>00427C3B    jmp         @HandleFinally
>00427C40    jmp         00427C32
 00427C42    mov         eax,ebx
 00427C44    pop         esi
 00427C45    pop         ebx
 00427C46    pop         ecx
 00427C47    pop         ebp
 00427C48    ret
*}
end;

//00427C4C
{*function TStringBuilder.AppendFormat(?:?; ?:?; ?:?):?;
begin
 00427C4C    push        ebp
 00427C4D    mov         ebp,esp
 00427C4F    push        0
 00427C51    push        ebx
 00427C52    push        esi
 00427C53    push        edi
 00427C54    mov         edi,ecx
 00427C56    mov         esi,edx
 00427C58    mov         ebx,eax
 00427C5A    xor         eax,eax
 00427C5C    push        ebp
 00427C5D    push        427C98
 00427C62    push        dword ptr fs:[eax]
 00427C65    mov         dword ptr fs:[eax],esp
 00427C68    lea         eax,[ebp-4]
 00427C6B    push        eax
 00427C6C    mov         edx,edi
 00427C6E    mov         ecx,dword ptr [ebp+8]
 00427C71    mov         eax,esi
 00427C73    call        Format
 00427C78    mov         edx,dword ptr [ebp-4]
 00427C7B    mov         eax,ebx
 00427C7D    call        TStringBuilder.Append
 00427C82    xor         eax,eax
 00427C84    pop         edx
 00427C85    pop         ecx
 00427C86    pop         ecx
 00427C87    mov         dword ptr fs:[eax],edx
 00427C8A    push        427C9F
 00427C8F    lea         eax,[ebp-4]
 00427C92    call        @UStrClr
 00427C97    ret
>00427C98    jmp         @HandleFinally
>00427C9D    jmp         00427C8F
 00427C9F    mov         eax,ebx
 00427CA1    pop         edi
 00427CA2    pop         esi
 00427CA3    pop         ebx
 00427CA4    pop         ecx
 00427CA5    pop         ebp
 00427CA6    ret         4
end;*}

//00427CAC
function TStringBuilder.AppendLine:TStringBuilder;
begin
{*
 00427CAC    push        ebx
 00427CAD    mov         ebx,eax
 00427CAF    mov         edx,427CCC;#13+#10
 00427CB4    mov         eax,ebx
 00427CB6    call        TStringBuilder.Append
 00427CBB    mov         eax,ebx
 00427CBD    pop         ebx
 00427CBE    ret
*}
end;

//00427CD0
function TStringBuilder.AppendLine(Value:string):TStringBuilder;
begin
{*
 00427CD0    push        ebx
 00427CD1    mov         ebx,eax
 00427CD3    mov         eax,ebx
 00427CD5    call        TStringBuilder.Append
 00427CDA    mov         eax,ebx
 00427CDC    call        TStringBuilder.AppendLine
 00427CE1    mov         eax,ebx
 00427CE3    pop         ebx
 00427CE4    ret
*}
end;

//00427CE8
procedure TStringBuilder.Clear;
begin
{*
 00427CE8    push        ebx
 00427CE9    mov         ebx,eax
 00427CEB    xor         edx,edx
 00427CED    mov         eax,ebx
 00427CEF    call        TStringBuilder.SetLength
 00427CF4    mov         edx,10
 00427CF9    mov         eax,ebx
 00427CFB    call        TStringBuilder.SetCapacity
 00427D00    pop         ebx
 00427D01    ret
*}
end;

//00427D04
procedure sub_00427D04(?:TStringBuilder; ?:Integer);
begin
{*
 00427D04    push        ebx
 00427D05    add         esp,0FFFFFFF8
 00427D08    mov         ebx,edx
 00427D0A    cmp         ebx,dword ptr [eax+8]
>00427D0D    jb          00427D31
 00427D0F    mov         dword ptr [esp],ebx
 00427D12    mov         byte ptr [esp+4],0
 00427D17    push        esp
 00427D18    push        0
 00427D1A    mov         ecx,dword ptr ds:[78D7A0];^SResString132:TResStringRec
 00427D20    mov         dl,1
 00427D22    mov         eax,[00419B58];ERangeError
 00427D27    call        Exception.CreateResFmt;ERangeError.Create
 00427D2C    call        @RaiseExcept
 00427D31    pop         ecx
 00427D32    pop         edx
 00427D33    pop         ebx
 00427D34    ret
*}
end;

//00427D38
{*procedure TStringBuilder.CopyTo(?:?; ?:?; ?:?; ?:?);
begin
 00427D38    push        ebp
 00427D39    mov         ebp,esp
 00427D3B    add         esp,0FFFFFFD0
 00427D3E    push        ebx
 00427D3F    push        esi
 00427D40    push        edi
 00427D41    mov         dword ptr [ebp-8],ecx
 00427D44    mov         dword ptr [ebp-4],edx
 00427D47    mov         edi,eax
 00427D49    mov         ebx,dword ptr [ebp+8]
 00427D4C    mov         esi,dword ptr [ebp+0C]
 00427D4F    test        ebx,ebx
>00427D51    jge         00427D7C
 00427D53    mov         eax,427E44;'Count'
 00427D58    mov         dword ptr [ebp-10],eax
 00427D5B    mov         byte ptr [ebp-0C],11
 00427D5F    lea         eax,[ebp-10]
 00427D62    push        eax
 00427D63    push        0
 00427D65    mov         ecx,dword ptr ds:[78DA74];^SResString154:TResStringRec
 00427D6B    mov         dl,1
 00427D6D    mov         eax,[00419B58];ERangeError
 00427D72    call        Exception.CreateResFmt;ERangeError.Create
 00427D77    call        @RaiseExcept
 00427D7C    test        esi,esi
>00427D7E    jge         00427DA9
 00427D80    mov         eax,427E5C;'DestinationIndex'
 00427D85    mov         dword ptr [ebp-10],eax
 00427D88    mov         byte ptr [ebp-0C],11
 00427D8C    lea         eax,[ebp-10]
 00427D8F    push        eax
 00427D90    push        0
 00427D92    mov         ecx,dword ptr ds:[78DA74];^SResString154:TResStringRec
 00427D98    mov         dl,1
 00427D9A    mov         eax,[00419B58];ERangeError
 00427D9F    call        Exception.CreateResFmt;ERangeError.Create
 00427DA4    call        @RaiseExcept
 00427DA9    mov         eax,dword ptr [ebp-8]
 00427DAC    call        @DynArrayLength
 00427DB1    lea         edx,[ebx+esi]
 00427DB4    cmp         eax,edx
>00427DB6    jge         00427DFB
 00427DB8    mov         eax,427E5C;'DestinationIndex'
 00427DBD    mov         dword ptr [ebp-30],eax
 00427DC0    mov         byte ptr [ebp-2C],11
 00427DC4    mov         dword ptr [ebp-28],esi
 00427DC7    mov         byte ptr [ebp-24],0
 00427DCB    mov         eax,427E44;'Count'
 00427DD0    mov         dword ptr [ebp-20],eax
 00427DD3    mov         byte ptr [ebp-1C],11
 00427DD7    mov         dword ptr [ebp-18],ebx
 00427DDA    mov         byte ptr [ebp-14],0
 00427DDE    lea         eax,[ebp-30]
 00427DE1    push        eax
 00427DE2    push        3
 00427DE4    mov         ecx,dword ptr ds:[78D1D4];^SResString155:TResStringRec
 00427DEA    mov         dl,1
 00427DEC    mov         eax,[00419B58];ERangeError
 00427DF1    call        Exception.CreateResFmt;ERangeError.Create
 00427DF6    call        @RaiseExcept
 00427DFB    test        ebx,ebx
>00427DFD    jle         00427E2E
 00427DFF    mov         edx,dword ptr [ebp-4]
 00427E02    mov         eax,edi
 00427E04    call        00427D04
 00427E09    mov         edx,dword ptr [ebp-4]
 00427E0C    add         edx,ebx
 00427E0E    dec         edx
 00427E0F    mov         eax,edi
 00427E11    call        00427D04
 00427E16    mov         eax,dword ptr [edi+4];TStringBuilder.FData:?
 00427E19    mov         edx,dword ptr [ebp-4]
 00427E1C    lea         eax,[eax+edx*2]
 00427E1F    mov         ecx,ebx
 00427E21    add         ecx,ecx
 00427E23    mov         edx,dword ptr [ebp-8]
 00427E26    lea         edx,[edx+esi*2]
 00427E29    call        Move
 00427E2E    pop         edi
 00427E2F    pop         esi
 00427E30    pop         ebx
 00427E31    mov         esp,ebp
 00427E33    pop         ebp
 00427E34    ret         8
end;*}

//00427E80
constructor TStringBuilder.Create();
begin
{*
 00427E80    push        ebx
 00427E81    push        esi
 00427E82    test        dl,dl
>00427E84    je          00427E8E
 00427E86    add         esp,0FFFFFFF0
 00427E89    call        @ClassCreate
 00427E8E    mov         ebx,edx
 00427E90    mov         esi,eax
 00427E92    xor         edx,edx
 00427E94    mov         eax,esi
 00427E96    call        TObject.Create
 00427E9B    mov         dword ptr [esi+0C],7FFFFFFF
 00427EA2    mov         edx,10
 00427EA7    mov         eax,esi
 00427EA9    call        TStringBuilder.SetCapacity
 00427EAE    xor         eax,eax
 00427EB0    mov         dword ptr [esi+8],eax
 00427EB3    mov         eax,esi
 00427EB5    test        bl,bl
>00427EB7    je          00427EC8
 00427EB9    call        @AfterConstruction
 00427EBE    pop         dword ptr fs:[0]
 00427EC5    add         esp,0C
 00427EC8    mov         eax,esi
 00427ECA    pop         esi
 00427ECB    pop         ebx
 00427ECC    ret
*}
end;

//00427ED0
constructor sub_00427ED0(Value:string; aCapacity:Integer);
begin
{*
 00427ED0    push        ebp
 00427ED1    mov         ebp,esp
 00427ED3    push        ebx
 00427ED4    push        esi
 00427ED5    push        edi
 00427ED6    test        dl,dl
>00427ED8    je          00427EE2
 00427EDA    add         esp,0FFFFFFF0
 00427EDD    call        @ClassCreate
 00427EE2    mov         esi,ecx
 00427EE4    mov         ebx,edx
 00427EE6    mov         edi,eax
 00427EE8    xor         edx,edx
 00427EEA    mov         eax,edi
 00427EEC    call        TObject.Create
 00427EF1    mov         dword ptr [edi+0C],7FFFFFFF;TStringBuilder.FMaxCapacity:Integer
 00427EF8    mov         edx,dword ptr [ebp+8]
 00427EFB    mov         eax,edi
 00427EFD    call        TStringBuilder.SetCapacity
 00427F02    xor         eax,eax
 00427F04    mov         dword ptr [edi+8],eax;TStringBuilder.FLength:Integer
 00427F07    mov         edx,esi
 00427F09    mov         eax,edi
 00427F0B    call        TStringBuilder.Append
 00427F10    mov         eax,edi
 00427F12    test        bl,bl
>00427F14    je          00427F25
 00427F16    call        @AfterConstruction
 00427F1B    pop         dword ptr fs:[0]
 00427F22    add         esp,0C
 00427F25    mov         eax,edi
 00427F27    pop         edi
 00427F28    pop         esi
 00427F29    pop         ebx
 00427F2A    pop         ebp
 00427F2B    ret         4
*}
end;

//00427F30
constructor sub_00427F30(Value:string; aCapacity:Integer; Length:Integer; StartIndex:Integer);
begin
{*
 00427F30    push        ebp
 00427F31    mov         ebp,esp
 00427F33    push        0
 00427F35    push        ebx
 00427F36    push        esi
 00427F37    push        edi
 00427F38    test        dl,dl
>00427F3A    je          00427F44
 00427F3C    add         esp,0FFFFFFF0
 00427F3F    call        @ClassCreate
 00427F44    mov         esi,ecx
 00427F46    mov         ebx,edx
 00427F48    mov         edi,eax
 00427F4A    xor         eax,eax
 00427F4C    push        ebp
 00427F4D    push        427F90
 00427F52    push        dword ptr fs:[eax]
 00427F55    mov         dword ptr fs:[eax],esp
 00427F58    mov         eax,dword ptr [ebp+8]
 00427F5B    push        eax
 00427F5C    lea         eax,[ebp-4]
 00427F5F    push        eax
 00427F60    mov         edx,dword ptr [ebp+10]
 00427F63    inc         edx
 00427F64    mov         ecx,dword ptr [ebp+0C]
 00427F67    mov         eax,esi
 00427F69    call        @UStrCopy
 00427F6E    mov         ecx,dword ptr [ebp-4]
 00427F71    xor         edx,edx
 00427F73    mov         eax,edi
 00427F75    call        00427ED0
 00427F7A    xor         eax,eax
 00427F7C    pop         edx
 00427F7D    pop         ecx
 00427F7E    pop         ecx
 00427F7F    mov         dword ptr fs:[eax],edx
 00427F82    push        427F97
 00427F87    lea         eax,[ebp-4]
 00427F8A    call        @UStrClr
 00427F8F    ret
>00427F90    jmp         @HandleFinally
>00427F95    jmp         00427F87
 00427F97    mov         eax,edi
 00427F99    test        bl,bl
>00427F9B    je          00427FAC
 00427F9D    call        @AfterConstruction
 00427FA2    pop         dword ptr fs:[0]
 00427FA9    add         esp,0C
 00427FAC    mov         eax,edi
 00427FAE    pop         edi
 00427FAF    pop         esi
 00427FB0    pop         ebx
 00427FB1    pop         ecx
 00427FB2    pop         ebp
 00427FB3    ret         0C
*}
end;

//00427FB8
constructor sub_00427FB8(aCapacity:Integer; aMaxCapacity:Integer);
begin
{*
 00427FB8    push        ebp
 00427FB9    mov         ebp,esp
 00427FBB    push        ebx
 00427FBC    push        esi
 00427FBD    test        dl,dl
>00427FBF    je          00427FC9
 00427FC1    add         esp,0FFFFFFF0
 00427FC4    call        @ClassCreate
 00427FC9    mov         ebx,edx
 00427FCB    mov         esi,eax
 00427FCD    xor         edx,edx
 00427FCF    mov         eax,esi
 00427FD1    call        00427FFC
 00427FD6    mov         eax,dword ptr [ebp+8]
 00427FD9    mov         dword ptr [esi+0C],eax;TStringBuilder.FMaxCapacity:Integer
 00427FDC    mov         eax,esi
 00427FDE    test        bl,bl
>00427FE0    je          00427FF1
 00427FE2    call        @AfterConstruction
 00427FE7    pop         dword ptr fs:[0]
 00427FEE    add         esp,0C
 00427FF1    mov         eax,esi
 00427FF3    pop         esi
 00427FF4    pop         ebx
 00427FF5    pop         ebp
 00427FF6    ret         4
*}
end;

//00427FFC
constructor sub_00427FFC(aCapacity:Integer);
begin
{*
 00427FFC    push        ebx
 00427FFD    push        esi
 00427FFE    push        edi
 00427FFF    test        dl,dl
>00428001    je          0042800B
 00428003    add         esp,0FFFFFFF0
 00428006    call        @ClassCreate
 0042800B    mov         esi,ecx
 0042800D    mov         ebx,edx
 0042800F    mov         edi,eax
 00428011    xor         edx,edx
 00428013    mov         eax,edi
 00428015    call        TObject.Create
 0042801A    mov         dword ptr [edi+0C],7FFFFFFF;TStringBuilder.FMaxCapacity:Integer
 00428021    mov         edx,esi
 00428023    mov         eax,edi
 00428025    call        TStringBuilder.SetCapacity
 0042802A    xor         eax,eax
 0042802C    mov         dword ptr [edi+8],eax;TStringBuilder.FLength:Integer
 0042802F    mov         eax,edi
 00428031    test        bl,bl
>00428033    je          00428044
 00428035    call        @AfterConstruction
 0042803A    pop         dword ptr fs:[0]
 00428041    add         esp,0C
 00428044    mov         eax,edi
 00428046    pop         edi
 00428047    pop         esi
 00428048    pop         ebx
 00428049    ret
*}
end;

//0042804C
constructor sub_0042804C(Value:string);
begin
{*
 0042804C    push        ebx
 0042804D    push        esi
 0042804E    push        edi
 0042804F    test        dl,dl
>00428051    je          0042805B
 00428053    add         esp,0FFFFFFF0
 00428056    call        @ClassCreate
 0042805B    mov         esi,ecx
 0042805D    mov         ebx,edx
 0042805F    mov         edi,eax
 00428061    xor         edx,edx
 00428063    mov         eax,edi
 00428065    call        TStringBuilder.Create
 0042806A    mov         edx,esi
 0042806C    mov         eax,edi
 0042806E    call        TStringBuilder.Append
 00428073    mov         eax,edi
 00428075    test        bl,bl
>00428077    je          00428088
 00428079    call        @AfterConstruction
 0042807E    pop         dword ptr fs:[0]
 00428085    add         esp,0C
 00428088    mov         eax,edi
 0042808A    pop         edi
 0042808B    pop         esi
 0042808C    pop         ebx
 0042808D    ret
*}
end;

//00428090
procedure TStringBuilder.EnsureCapacity(aCapacity:Integer);
begin
{*
 00428090    push        ebx
 00428091    push        esi
 00428092    add         esp,0FFFFFFF8
 00428095    mov         esi,edx
 00428097    mov         ebx,eax
 00428099    mov         eax,ebx
 0042809B    call        TStringBuilder.GetMaxCapacity
 004280A0    cmp         eax,esi
>004280A2    jae         004280C6
 004280A4    mov         dword ptr [esp],esi
 004280A7    mov         byte ptr [esp+4],0
 004280AC    push        esp
 004280AD    push        0
 004280AF    mov         ecx,dword ptr ds:[78D7A0];^SResString132:TResStringRec
 004280B5    mov         dl,1
 004280B7    mov         eax,[00419B58];ERangeError
 004280BC    call        Exception.CreateResFmt;ERangeError.Create
 004280C1    call        @RaiseExcept
 004280C6    mov         eax,ebx
 004280C8    call        TStringBuilder.GetCapacity
 004280CD    cmp         esi,eax
>004280CF    jle         004280DA
 004280D1    mov         edx,esi
 004280D3    mov         eax,ebx
 004280D5    call        TStringBuilder.SetCapacity
 004280DA    mov         eax,ebx
 004280DC    call        TStringBuilder.GetCapacity
 004280E1    pop         ecx
 004280E2    pop         edx
 004280E3    pop         esi
 004280E4    pop         ebx
 004280E5    ret
*}
end;

//004280E8
function TStringBuilder.Equals(StringBuilder:TStringBuilder):Boolean;
begin
{*
 004280E8    push        ebx
 004280E9    push        esi
 004280EA    push        edi
 004280EB    mov         esi,edx
 004280ED    mov         ebx,eax
 004280EF    test        esi,esi
>004280F1    je          004280FE
 004280F3    mov         eax,dword ptr [ebx+8];TStringBuilder.FLength:Integer
 004280F6    cmp         eax,dword ptr [esi+8];TStringBuilder.FLength:Integer
 004280F9    sete        al
>004280FC    jmp         00428100
 004280FE    xor         eax,eax
 00428100    test        al,al
>00428102    je          0042811B
 00428104    mov         eax,ebx
 00428106    call        TStringBuilder.GetMaxCapacity
 0042810B    mov         edi,eax
 0042810D    mov         eax,esi
 0042810F    call        TStringBuilder.GetMaxCapacity
 00428114    cmp         edi,eax
 00428116    sete        al
>00428119    jmp         0042811D
 0042811B    xor         eax,eax
 0042811D    test        al,al
>0042811F    je          00428133
 00428121    mov         ecx,dword ptr [ebx+8];TStringBuilder.FLength:Integer
 00428124    add         ecx,ecx
 00428126    mov         edx,dword ptr [esi+4];TStringBuilder.FData:?
 00428129    mov         eax,dword ptr [ebx+4];TStringBuilder.FData:?
 0042812C    call        CompareMem
>00428131    jmp         00428135
 00428133    xor         eax,eax
 00428135    pop         edi
 00428136    pop         esi
 00428137    pop         ebx
 00428138    ret
*}
end;

//0042813C
procedure TStringBuilder.ExpandCapacity;
begin
{*
 0042813C    push        ebx
 0042813D    push        esi
 0042813E    mov         ebx,eax
 00428140    mov         eax,ebx
 00428142    call        TStringBuilder.GetCapacity
 00428147    mov         esi,eax
 00428149    add         esi,esi
 0042814B    mov         eax,dword ptr [ebx+8]
 0042814E    cmp         esi,eax
>00428150    jge         00428156
 00428152    mov         esi,eax
 00428154    add         esi,esi
 00428156    mov         eax,ebx
 00428158    call        TStringBuilder.GetMaxCapacity
 0042815D    cmp         esi,eax
>0042815F    jle         0042816A
 00428161    mov         eax,ebx
 00428163    call        TStringBuilder.GetMaxCapacity
 00428168    mov         esi,eax
 0042816A    test        esi,esi
>0042816C    jge         00428171
 0042816E    mov         esi,dword ptr [ebx+8]
 00428171    mov         edx,esi
 00428173    mov         eax,ebx
 00428175    call        TStringBuilder.SetCapacity
 0042817A    pop         esi
 0042817B    pop         ebx
 0042817C    ret
*}
end;

//00428180
function TStringBuilder.GetCapacity:Integer;
begin
{*
 00428180    mov         eax,dword ptr [eax+4]
 00428183    call        @DynArrayLength
 00428188    ret
*}
end;

//0042818C
function TStringBuilder.GetMaxCapacity:Integer;
begin
{*
 0042818C    mov         eax,dword ptr [eax+0C]
 0042818F    ret
*}
end;

//00428190
function TStringBuilder.Insert(Index:Integer; Value:TObject):TStringBuilder;
begin
{*
 00428190    push        ebp
 00428191    mov         ebp,esp
 00428193    push        0
 00428195    push        ebx
 00428196    push        esi
 00428197    push        edi
 00428198    mov         edi,ecx
 0042819A    mov         esi,edx
 0042819C    mov         ebx,eax
 0042819E    xor         eax,eax
 004281A0    push        ebp
 004281A1    push        4281D8
 004281A6    push        dword ptr fs:[eax]
 004281A9    mov         dword ptr fs:[eax],esp
 004281AC    lea         edx,[ebp-4]
 004281AF    mov         eax,edi
 004281B1    mov         ecx,dword ptr [eax]
 004281B3    call        dword ptr [ecx-24]
 004281B6    mov         ecx,dword ptr [ebp-4]
 004281B9    mov         edx,esi
 004281BB    mov         eax,ebx
 004281BD    call        TStringBuilder.Insert
 004281C2    xor         eax,eax
 004281C4    pop         edx
 004281C5    pop         ecx
 004281C6    pop         ecx
 004281C7    mov         dword ptr fs:[eax],edx
 004281CA    push        4281DF
 004281CF    lea         eax,[ebp-4]
 004281D2    call        @UStrClr
 004281D7    ret
>004281D8    jmp         @HandleFinally
>004281DD    jmp         004281CF
 004281DF    mov         eax,ebx
 004281E1    pop         edi
 004281E2    pop         esi
 004281E3    pop         ebx
 004281E4    pop         ecx
 004281E5    pop         ebp
 004281E6    ret
*}
end;

//004281E8
{*function TStringBuilder.Insert(Index:Integer; Value:Int64; ?:?):TStringBuilder;
begin
 004281E8    push        ebp
 004281E9    mov         ebp,esp
 004281EB    push        0
 004281ED    push        ebx
 004281EE    push        esi
 004281EF    mov         esi,edx
 004281F1    mov         ebx,eax
 004281F3    xor         eax,eax
 004281F5    push        ebp
 004281F6    push        428231
 004281FB    push        dword ptr fs:[eax]
 004281FE    mov         dword ptr fs:[eax],esp
 00428201    push        dword ptr [ebp+0C]
 00428204    push        dword ptr [ebp+8]
 00428207    lea         eax,[ebp-4]
 0042820A    call        IntToStr
 0042820F    mov         ecx,dword ptr [ebp-4]
 00428212    mov         edx,esi
 00428214    mov         eax,ebx
 00428216    call        TStringBuilder.Insert
 0042821B    xor         eax,eax
 0042821D    pop         edx
 0042821E    pop         ecx
 0042821F    pop         ecx
 00428220    mov         dword ptr fs:[eax],edx
 00428223    push        428238
 00428228    lea         eax,[ebp-4]
 0042822B    call        @UStrClr
 00428230    ret
>00428231    jmp         @HandleFinally
>00428236    jmp         00428228
 00428238    mov         eax,ebx
 0042823A    pop         esi
 0042823B    pop         ebx
 0042823C    pop         ecx
 0042823D    pop         ebp
 0042823E    ret         8
end;*}

//00428244
function TStringBuilder.Insert(Index:Integer; Value:Single):TStringBuilder;
begin
{*
 00428244    push        ebp
 00428245    mov         ebp,esp
 00428247    push        0
 00428249    push        ebx
 0042824A    push        esi
 0042824B    mov         esi,edx
 0042824D    mov         ebx,eax
 0042824F    xor         eax,eax
 00428251    push        ebp
 00428252    push        428296
 00428257    push        dword ptr fs:[eax]
 0042825A    mov         dword ptr fs:[eax],esp
 0042825D    fld         dword ptr [ebp+8]
 00428260    add         esp,0FFFFFFF4
 00428263    fstp        tbyte ptr [esp]
 00428266    wait
 00428267    lea         edx,[ebp-4]
 0042826A    mov         eax,790CDC;gvar_00790CDC:TFormatSettings
 0042826F    call        FloatToStr
 00428274    mov         ecx,dword ptr [ebp-4]
 00428277    mov         edx,esi
 00428279    mov         eax,ebx
 0042827B    call        TStringBuilder.Insert
 00428280    xor         eax,eax
 00428282    pop         edx
 00428283    pop         ecx
 00428284    pop         ecx
 00428285    mov         dword ptr fs:[eax],edx
 00428288    push        42829D
 0042828D    lea         eax,[ebp-4]
 00428290    call        @UStrClr
 00428295    ret
>00428296    jmp         @HandleFinally
>0042829B    jmp         0042828D
 0042829D    mov         eax,ebx
 0042829F    pop         esi
 004282A0    pop         ebx
 004282A1    pop         ecx
 004282A2    pop         ebp
 004282A3    ret         4
*}
end;

//004282A8
function TStringBuilder.Insert(Index:Integer; Value:string):TStringBuilder;
begin
{*
 004282A8    push        ebx
 004282A9    push        esi
 004282AA    push        edi
 004282AB    push        ebp
 004282AC    add         esp,0FFFFFFF8
 004282AF    mov         edi,ecx
 004282B1    mov         esi,edx
 004282B3    mov         ebx,eax
 004282B5    test        esi,esi
>004282B7    jge         004282E0
 004282B9    mov         eax,428388;'Index'
 004282BE    mov         dword ptr [esp],eax
 004282C1    mov         byte ptr [esp+4],11
 004282C6    push        esp
 004282C7    push        0
 004282C9    mov         ecx,dword ptr ds:[78DA74];^SResString154:TResStringRec
 004282CF    mov         dl,1
 004282D1    mov         eax,[00419B58];ERangeError
 004282D6    call        Exception.CreateResFmt
 004282DB    call        @RaiseExcept
 004282E0    cmp         esi,dword ptr [ebx+8]
>004282E3    jle         00428307
 004282E5    mov         dword ptr [esp],esi
 004282E8    mov         byte ptr [esp+4],0
 004282ED    push        esp
 004282EE    push        0
 004282F0    mov         ecx,dword ptr ds:[78D7A0];^SResString132:TResStringRec
 004282F6    mov         dl,1
 004282F8    mov         eax,[00419B58];ERangeError
 004282FD    call        Exception.CreateResFmt
 00428302    call        @RaiseExcept
 00428307    mov         eax,edi
 00428309    test        eax,eax
>0042830B    je          00428312
 0042830D    sub         eax,4
 00428310    mov         eax,dword ptr [eax]
 00428312    mov         edx,dword ptr [ebx+8]
 00428315    add         edx,eax
 00428317    mov         eax,ebx
 00428319    call        TStringBuilder.SetLength
 0042831E    mov         eax,edi
 00428320    test        eax,eax
>00428322    je          00428329
 00428324    sub         eax,4
 00428327    mov         eax,dword ptr [eax]
 00428329    mov         edx,edi
 0042832B    test        edx,edx
>0042832D    je          00428334
 0042832F    sub         edx,4
 00428332    mov         edx,dword ptr [edx]
 00428334    add         eax,esi
 00428336    mov         ecx,dword ptr [ebx+4]
 00428339    lea         eax,[ecx+eax*2]
 0042833C    mov         ecx,dword ptr [ebx+8]
 0042833F    sub         ecx,edx
 00428341    sub         ecx,esi
 00428343    add         ecx,ecx
 00428345    mov         edx,dword ptr [ebx+4]
 00428348    lea         edx,[edx+esi*2]
 0042834B    xchg        eax,edx
 0042834C    call        Move
 00428351    mov         ebp,edi
 00428353    test        ebp,ebp
>00428355    je          0042835D
 00428357    sub         ebp,4
 0042835A    mov         ebp,dword ptr [ebp]
 0042835D    mov         eax,edi
 0042835F    call        @UStrToPWChar
 00428364    mov         ecx,ebp
 00428366    add         ecx,ecx
 00428368    mov         edx,dword ptr [ebx+4]
 0042836B    lea         edx,[edx+esi*2]
 0042836E    call        Move
 00428373    mov         eax,ebx
 00428375    pop         ecx
 00428376    pop         edx
 00428377    pop         ebp
 00428378    pop         edi
 00428379    pop         esi
 0042837A    pop         ebx
 0042837B    ret
*}
end;

//00428394
function TStringBuilder.Insert(Index:Integer; Value:Word):TStringBuilder;
begin
{*
 00428394    push        ebp
 00428395    mov         ebp,esp
 00428397    push        0
 00428399    push        ebx
 0042839A    push        esi
 0042839B    push        edi
 0042839C    mov         edi,ecx
 0042839E    mov         esi,edx
 004283A0    mov         ebx,eax
 004283A2    xor         eax,eax
 004283A4    push        ebp
 004283A5    push        4283DD
 004283AA    push        dword ptr fs:[eax]
 004283AD    mov         dword ptr fs:[eax],esp
 004283B0    lea         edx,[ebp-4]
 004283B3    movzx       eax,di
 004283B6    call        IntToStr
 004283BB    mov         ecx,dword ptr [ebp-4]
 004283BE    mov         edx,esi
 004283C0    mov         eax,ebx
 004283C2    call        TStringBuilder.Insert
 004283C7    xor         eax,eax
 004283C9    pop         edx
 004283CA    pop         ecx
 004283CB    pop         ecx
 004283CC    mov         dword ptr fs:[eax],edx
 004283CF    push        4283E4
 004283D4    lea         eax,[ebp-4]
 004283D7    call        @UStrClr
 004283DC    ret
>004283DD    jmp         @HandleFinally
>004283E2    jmp         004283D4
 004283E4    mov         eax,ebx
 004283E6    pop         edi
 004283E7    pop         esi
 004283E8    pop         ebx
 004283E9    pop         ecx
 004283EA    pop         ebp
 004283EB    ret
*}
end;

//004283EC
function TStringBuilder.Insert(Index:Integer; Value:ShortInt):TStringBuilder;
begin
{*
 004283EC    push        ebp
 004283ED    mov         ebp,esp
 004283EF    push        0
 004283F1    push        ebx
 004283F2    push        esi
 004283F3    push        edi
 004283F4    mov         ebx,ecx
 004283F6    mov         esi,edx
 004283F8    mov         edi,eax
 004283FA    xor         eax,eax
 004283FC    push        ebp
 004283FD    push        428437
 00428402    push        dword ptr fs:[eax]
 00428405    mov         dword ptr fs:[eax],esp
 00428408    lea         edx,[ebp-4]
 0042840B    movsx       eax,bl
 0042840E    call        IntToStr
 00428413    mov         ecx,dword ptr [ebp-4]
 00428416    mov         edx,esi
 00428418    mov         eax,edi
 0042841A    call        TStringBuilder.Insert
 0042841F    mov         ebx,edi
 00428421    xor         eax,eax
 00428423    pop         edx
 00428424    pop         ecx
 00428425    pop         ecx
 00428426    mov         dword ptr fs:[eax],edx
 00428429    push        42843E
 0042842E    lea         eax,[ebp-4]
 00428431    call        @UStrClr
 00428436    ret
>00428437    jmp         @HandleFinally
>0042843C    jmp         0042842E
 0042843E    mov         eax,ebx
 00428440    pop         edi
 00428441    pop         esi
 00428442    pop         ebx
 00428443    pop         ecx
 00428444    pop         ebp
 00428445    ret
*}
end;

//00428448
{*function TStringBuilder.Insert(?:?; ?:?):?;
begin
 00428448    push        ebx
 00428449    push        esi
 0042844A    push        edi
 0042844B    add         esp,0FFFFFFF8
 0042844E    mov         edi,ecx
 00428450    mov         esi,edx
 00428452    mov         ebx,eax
 00428454    test        esi,esi
>00428456    jge         0042847F
 00428458    mov         eax,42850C;'Index'
 0042845D    mov         dword ptr [esp],eax
 00428460    mov         byte ptr [esp+4],11
 00428465    push        esp
 00428466    push        0
 00428468    mov         ecx,dword ptr ds:[78DA74];^SResString154:TResStringRec
 0042846E    mov         dl,1
 00428470    mov         eax,[00419B58];ERangeError
 00428475    call        Exception.CreateResFmt;ERangeError.Create
 0042847A    call        @RaiseExcept
 0042847F    cmp         esi,dword ptr [ebx+8];TStringBuilder.FLength:Integer
>00428482    jle         004284A6
 00428484    mov         dword ptr [esp],esi
 00428487    mov         byte ptr [esp+4],0
 0042848C    push        esp
 0042848D    push        0
 0042848F    mov         ecx,dword ptr ds:[78D7A0];^SResString132:TResStringRec
 00428495    mov         dl,1
 00428497    mov         eax,[00419B58];ERangeError
 0042849C    call        Exception.CreateResFmt;ERangeError.Create
 004284A1    call        @RaiseExcept
 004284A6    mov         eax,edi
 004284A8    call        @DynArrayLength
 004284AD    mov         edx,eax
 004284AF    add         edx,dword ptr [ebx+8];TStringBuilder.FLength:Integer
 004284B2    mov         eax,ebx
 004284B4    call        TStringBuilder.SetLength
 004284B9    mov         eax,edi
 004284BB    call        @DynArrayLength
 004284C0    add         eax,esi
 004284C2    mov         edx,dword ptr [ebx+4];TStringBuilder.FData:?
 004284C5    lea         eax,[edx+eax*2]
 004284C8    push        eax
 004284C9    mov         eax,edi
 004284CB    call        @DynArrayLength
 004284D0    mov         ecx,eax
 004284D2    add         ecx,ecx
 004284D4    mov         eax,dword ptr [ebx+4];TStringBuilder.FData:?
 004284D7    lea         eax,[eax+esi*2]
 004284DA    pop         edx
 004284DB    call        Move
 004284E0    mov         eax,edi
 004284E2    call        @DynArrayLength
 004284E7    add         eax,eax
 004284E9    push        eax
 004284EA    mov         eax,edi
 004284EC    mov         edx,dword ptr [ebx+4];TStringBuilder.FData:?
 004284EF    lea         edx,[edx+esi*2]
 004284F2    pop         ecx
 004284F3    call        Move
 004284F8    mov         eax,ebx
 004284FA    pop         ecx
 004284FB    pop         edx
 004284FC    pop         edi
 004284FD    pop         esi
 004284FE    pop         ebx
 004284FF    ret
end;*}

//00428518
{*function TStringBuilder.Insert(Index:Integer; Value:Currency; ?:?):TStringBuilder;
begin
 00428518    push        ebp
 00428519    mov         ebp,esp
 0042851B    push        0
 0042851D    push        ebx
 0042851E    push        esi
 0042851F    mov         esi,edx
 00428521    mov         ebx,eax
 00428523    xor         eax,eax
 00428525    push        ebp
 00428526    push        428566
 0042852B    push        dword ptr fs:[eax]
 0042852E    mov         dword ptr fs:[eax],esp
 00428531    push        dword ptr [ebp+0C]
 00428534    push        dword ptr [ebp+8]
 00428537    lea         edx,[ebp-4]
 0042853A    mov         eax,790CDC;gvar_00790CDC:TFormatSettings
 0042853F    call        CurrToStr
 00428544    mov         ecx,dword ptr [ebp-4]
 00428547    mov         edx,esi
 00428549    mov         eax,ebx
 0042854B    call        TStringBuilder.Insert
 00428550    xor         eax,eax
 00428552    pop         edx
 00428553    pop         ecx
 00428554    pop         ecx
 00428555    mov         dword ptr fs:[eax],edx
 00428558    push        42856D
 0042855D    lea         eax,[ebp-4]
 00428560    call        @UStrClr
 00428565    ret
>00428566    jmp         @HandleFinally
>0042856B    jmp         0042855D
 0042856D    mov         eax,ebx
 0042856F    pop         esi
 00428570    pop         ebx
 00428571    pop         ecx
 00428572    pop         ebp
 00428573    ret         8
end;*}

//00428578
function TStringBuilder.Insert(Index:Integer; Value:Char):TStringBuilder;
begin
{*
 00428578    push        ebx
 00428579    push        esi
 0042857A    push        edi
 0042857B    add         esp,0FFFFFFF8
 0042857E    mov         edi,ecx
 00428580    mov         esi,edx
 00428582    mov         ebx,eax
 00428584    test        esi,esi
>00428586    jge         004285AF
 00428588    mov         eax,428618;'Index'
 0042858D    mov         dword ptr [esp],eax
 00428590    mov         byte ptr [esp+4],11
 00428595    push        esp
 00428596    push        0
 00428598    mov         ecx,dword ptr ds:[78DA74];^SResString154:TResStringRec
 0042859E    mov         dl,1
 004285A0    mov         eax,[00419B58];ERangeError
 004285A5    call        Exception.CreateResFmt;ERangeError.Create
 004285AA    call        @RaiseExcept
 004285AF    cmp         esi,dword ptr [ebx+8];TStringBuilder.FLength:Integer
>004285B2    jle         004285D6
 004285B4    mov         dword ptr [esp],esi
 004285B7    mov         byte ptr [esp+4],0
 004285BC    push        esp
 004285BD    push        0
 004285BF    mov         ecx,dword ptr ds:[78D7A0];^SResString132:TResStringRec
 004285C5    mov         dl,1
 004285C7    mov         eax,[00419B58];ERangeError
 004285CC    call        Exception.CreateResFmt;ERangeError.Create
 004285D1    call        @RaiseExcept
 004285D6    mov         edx,dword ptr [ebx+8];TStringBuilder.FLength:Integer
 004285D9    inc         edx
 004285DA    mov         eax,ebx
 004285DC    call        TStringBuilder.SetLength
 004285E1    mov         eax,dword ptr [ebx+8];TStringBuilder.FLength:Integer
 004285E4    sub         eax,esi
 004285E6    dec         eax
 004285E7    mov         ecx,eax
 004285E9    add         ecx,ecx
 004285EB    mov         eax,dword ptr [ebx+4];TStringBuilder.FData:?
 004285EE    lea         edx,[eax+esi*2+2]
 004285F2    mov         eax,dword ptr [ebx+4];TStringBuilder.FData:?
 004285F5    lea         eax,[eax+esi*2]
 004285F8    call        Move
 004285FD    mov         eax,dword ptr [ebx+4];TStringBuilder.FData:?
 00428600    mov         word ptr [eax+esi*2],di
 00428604    mov         eax,ebx
 00428606    pop         ecx
 00428607    pop         edx
 00428608    pop         edi
 00428609    pop         esi
 0042860A    pop         ebx
 0042860B    ret
*}
end;

//00428624
function TStringBuilder.Insert(Index:Integer; Value:Byte):TStringBuilder;
begin
{*
 00428624    push        ebp
 00428625    mov         ebp,esp
 00428627    push        0
 00428629    push        ebx
 0042862A    push        esi
 0042862B    push        edi
 0042862C    mov         ebx,ecx
 0042862E    mov         esi,edx
 00428630    mov         edi,eax
 00428632    xor         eax,eax
 00428634    push        ebp
 00428635    push        42866F
 0042863A    push        dword ptr fs:[eax]
 0042863D    mov         dword ptr fs:[eax],esp
 00428640    lea         edx,[ebp-4]
 00428643    movzx       eax,bl
 00428646    call        IntToStr
 0042864B    mov         ecx,dword ptr [ebp-4]
 0042864E    mov         edx,esi
 00428650    mov         eax,edi
 00428652    call        TStringBuilder.Insert
 00428657    mov         ebx,edi
 00428659    xor         eax,eax
 0042865B    pop         edx
 0042865C    pop         ecx
 0042865D    pop         ecx
 0042865E    mov         dword ptr fs:[eax],edx
 00428661    push        428676
 00428666    lea         eax,[ebp-4]
 00428669    call        @UStrClr
 0042866E    ret
>0042866F    jmp         @HandleFinally
>00428674    jmp         00428666
 00428676    mov         eax,ebx
 00428678    pop         edi
 00428679    pop         esi
 0042867A    pop         ebx
 0042867B    pop         ecx
 0042867C    pop         ebp
 0042867D    ret
*}
end;

//00428680
function TStringBuilder.Insert(Index:Integer; Value:Double):TStringBuilder;
begin
{*
 00428680    push        ebp
 00428681    mov         ebp,esp
 00428683    push        0
 00428685    push        ebx
 00428686    push        esi
 00428687    mov         esi,edx
 00428689    mov         ebx,eax
 0042868B    xor         eax,eax
 0042868D    push        ebp
 0042868E    push        4286D2
 00428693    push        dword ptr fs:[eax]
 00428696    mov         dword ptr fs:[eax],esp
 00428699    fld         qword ptr [ebp+8]
 0042869C    add         esp,0FFFFFFF4
 0042869F    fstp        tbyte ptr [esp]
 004286A2    wait
 004286A3    lea         edx,[ebp-4]
 004286A6    mov         eax,790CDC;gvar_00790CDC:TFormatSettings
 004286AB    call        FloatToStr
 004286B0    mov         ecx,dword ptr [ebp-4]
 004286B3    mov         edx,esi
 004286B5    mov         eax,ebx
 004286B7    call        TStringBuilder.Insert
 004286BC    xor         eax,eax
 004286BE    pop         edx
 004286BF    pop         ecx
 004286C0    pop         ecx
 004286C1    mov         dword ptr fs:[eax],edx
 004286C4    push        4286D9
 004286C9    lea         eax,[ebp-4]
 004286CC    call        @UStrClr
 004286D1    ret
>004286D2    jmp         @HandleFinally
>004286D7    jmp         004286C9
 004286D9    mov         eax,ebx
 004286DB    pop         esi
 004286DC    pop         ebx
 004286DD    pop         ecx
 004286DE    pop         ebp
 004286DF    ret         8
*}
end;

//004286E4
function TStringBuilder.Insert(Index:Integer; Value:Integer):TStringBuilder;
begin
{*
 004286E4    push        ebp
 004286E5    mov         ebp,esp
 004286E7    push        0
 004286E9    push        ebx
 004286EA    push        esi
 004286EB    push        edi
 004286EC    mov         edi,ecx
 004286EE    mov         esi,edx
 004286F0    mov         ebx,eax
 004286F2    xor         eax,eax
 004286F4    push        ebp
 004286F5    push        42872C
 004286FA    push        dword ptr fs:[eax]
 004286FD    mov         dword ptr fs:[eax],esp
 00428700    lea         edx,[ebp-4]
 00428703    mov         eax,edi
 00428705    call        IntToStr
 0042870A    mov         ecx,dword ptr [ebp-4]
 0042870D    mov         edx,esi
 0042870F    mov         eax,ebx
 00428711    call        TStringBuilder.Insert
 00428716    xor         eax,eax
 00428718    pop         edx
 00428719    pop         ecx
 0042871A    pop         ecx
 0042871B    mov         dword ptr fs:[eax],edx
 0042871E    push        428733
 00428723    lea         eax,[ebp-4]
 00428726    call        @UStrClr
 0042872B    ret
>0042872C    jmp         @HandleFinally
>00428731    jmp         00428723
 00428733    mov         eax,ebx
 00428735    pop         edi
 00428736    pop         esi
 00428737    pop         ebx
 00428738    pop         ecx
 00428739    pop         ebp
 0042873A    ret
*}
end;

//0042873C
function TStringBuilder.Insert(Index:Integer; Value:SmallInt):TStringBuilder;
begin
{*
 0042873C    push        ebp
 0042873D    mov         ebp,esp
 0042873F    push        0
 00428741    push        ebx
 00428742    push        esi
 00428743    push        edi
 00428744    mov         edi,ecx
 00428746    mov         esi,edx
 00428748    mov         ebx,eax
 0042874A    xor         eax,eax
 0042874C    push        ebp
 0042874D    push        428785
 00428752    push        dword ptr fs:[eax]
 00428755    mov         dword ptr fs:[eax],esp
 00428758    lea         edx,[ebp-4]
 0042875B    movsx       eax,di
 0042875E    call        IntToStr
 00428763    mov         ecx,dword ptr [ebp-4]
 00428766    mov         edx,esi
 00428768    mov         eax,ebx
 0042876A    call        TStringBuilder.Insert
 0042876F    xor         eax,eax
 00428771    pop         edx
 00428772    pop         ecx
 00428773    pop         ecx
 00428774    mov         dword ptr fs:[eax],edx
 00428777    push        42878C
 0042877C    lea         eax,[ebp-4]
 0042877F    call        @UStrClr
 00428784    ret
>00428785    jmp         @HandleFinally
>0042878A    jmp         0042877C
 0042878C    mov         eax,ebx
 0042878E    pop         edi
 0042878F    pop         esi
 00428790    pop         ebx
 00428791    pop         ecx
 00428792    pop         ebp
 00428793    ret
*}
end;

//00428794
function TStringBuilder.Insert(Index:Integer; Value:Boolean):TStringBuilder;
begin
{*
 00428794    push        ebp
 00428795    mov         ebp,esp
 00428797    push        0
 00428799    push        ebx
 0042879A    push        esi
 0042879B    push        edi
 0042879C    mov         ebx,ecx
 0042879E    mov         esi,edx
 004287A0    mov         edi,eax
 004287A2    xor         eax,eax
 004287A4    push        ebp
 004287A5    push        4287E0
 004287AA    push        dword ptr fs:[eax]
 004287AD    mov         dword ptr fs:[eax],esp
 004287B0    lea         ecx,[ebp-4]
 004287B3    mov         dl,1
 004287B5    mov         eax,ebx
 004287B7    call        BoolToStr
 004287BC    mov         ecx,dword ptr [ebp-4]
 004287BF    mov         edx,esi
 004287C1    mov         eax,edi
 004287C3    call        TStringBuilder.Insert
 004287C8    mov         ebx,edi
 004287CA    xor         eax,eax
 004287CC    pop         edx
 004287CD    pop         ecx
 004287CE    pop         ecx
 004287CF    mov         dword ptr fs:[eax],edx
 004287D2    push        4287E7
 004287D7    lea         eax,[ebp-4]
 004287DA    call        @UStrClr
 004287DF    ret
>004287E0    jmp         @HandleFinally
>004287E5    jmp         004287D7
 004287E7    mov         eax,ebx
 004287E9    pop         edi
 004287EA    pop         esi
 004287EB    pop         ebx
 004287EC    pop         ecx
 004287ED    pop         ebp
 004287EE    ret
*}
end;

//004287F0
function TStringBuilder.Insert(Index:Integer; Value:string; count:Integer):TStringBuilder;
begin
{*
 004287F0    push        ebp
 004287F1    mov         ebp,esp
 004287F3    push        ecx
 004287F4    push        ebx
 004287F5    push        esi
 004287F6    push        edi
 004287F7    mov         dword ptr [ebp-4],ecx
 004287FA    mov         edi,edx
 004287FC    mov         esi,eax
 004287FE    mov         ebx,dword ptr [ebp+8]
 00428801    dec         ebx
 00428802    test        ebx,ebx
>00428804    jl          00428816
 00428806    inc         ebx
 00428807    mov         ecx,dword ptr [ebp-4]
 0042880A    mov         edx,edi
 0042880C    mov         eax,esi
 0042880E    call        TStringBuilder.Insert
 00428813    dec         ebx
>00428814    jne         00428807
 00428816    mov         eax,esi
 00428818    pop         edi
 00428819    pop         esi
 0042881A    pop         ebx
 0042881B    pop         ecx
 0042881C    pop         ebp
 0042881D    ret         4
*}
end;

//00428820
{*function TStringBuilder.Insert(?:?; ?:?; ?:?; ?:?):?;
begin
 00428820    push        ebp
 00428821    mov         ebp,esp
 00428823    add         esp,0FFFFFFD4
 00428826    push        ebx
 00428827    push        esi
 00428828    push        edi
 00428829    mov         dword ptr [ebp-4],ecx
 0042882C    mov         esi,edx
 0042882E    mov         ebx,eax
 00428830    mov         edi,dword ptr [ebp+8]
 00428833    mov         eax,esi
 00428835    dec         eax
 00428836    cmp         eax,dword ptr [ebx+8];TStringBuilder.FLength:Integer
>00428839    jl          00428861
 0042883B    mov         dword ptr [ebp-0C],esi
 0042883E    mov         byte ptr [ebp-8],0
 00428842    lea         eax,[ebp-0C]
 00428845    push        eax
 00428846    push        0
 00428848    mov         ecx,dword ptr ds:[78D7A0];^SResString132:TResStringRec
 0042884E    mov         dl,1
 00428850    mov         eax,[00419B58];ERangeError
 00428855    call        Exception.CreateResFmt;ERangeError.Create
 0042885A    call        @RaiseExcept
>0042885F    jmp         00428889
 00428861    test        esi,esi
>00428863    jge         00428889
 00428865    mov         dword ptr [ebp-0C],esi
 00428868    mov         byte ptr [ebp-8],0
 0042886C    lea         eax,[ebp-0C]
 0042886F    push        eax
 00428870    push        0
 00428872    mov         ecx,dword ptr ds:[78D7A0];^SResString132:TResStringRec
 00428878    mov         dl,1
 0042887A    mov         eax,[00419B58];ERangeError
 0042887F    call        Exception.CreateResFmt;ERangeError.Create
 00428884    call        @RaiseExcept
 00428889    cmp         dword ptr [ebp+0C],0
>0042888D    jge         004288B8
 0042888F    mov         eax,428998;'StartIndex'
 00428894    mov         dword ptr [ebp-0C],eax
 00428897    mov         byte ptr [ebp-8],11
 0042889B    lea         eax,[ebp-0C]
 0042889E    push        eax
 0042889F    push        0
 004288A1    mov         ecx,dword ptr ds:[78DA74];^SResString154:TResStringRec
 004288A7    mov         dl,1
 004288A9    mov         eax,[00419B58];ERangeError
 004288AE    call        Exception.CreateResFmt;ERangeError.Create
 004288B3    call        @RaiseExcept
 004288B8    test        edi,edi
>004288BA    jge         004288E5
 004288BC    mov         eax,4289BC;'CharCount'
 004288C1    mov         dword ptr [ebp-0C],eax
 004288C4    mov         byte ptr [ebp-8],11
 004288C8    lea         eax,[ebp-0C]
 004288CB    push        eax
 004288CC    push        0
 004288CE    mov         ecx,dword ptr ds:[78DA74];^SResString154:TResStringRec
 004288D4    mov         dl,1
 004288D6    mov         eax,[00419B58];ERangeError
 004288DB    call        Exception.CreateResFmt;ERangeError.Create
 004288E0    call        @RaiseExcept
 004288E5    mov         eax,dword ptr [ebp-4]
 004288E8    call        @DynArrayLength
 004288ED    mov         edx,dword ptr [ebp+0C]
 004288F0    add         edx,edi
 004288F2    cmp         eax,edx
>004288F4    jge         0042893C
 004288F6    mov         eax,428998;'StartIndex'
 004288FB    mov         dword ptr [ebp-2C],eax
 004288FE    mov         byte ptr [ebp-28],11
 00428902    mov         eax,dword ptr [ebp+0C]
 00428905    mov         dword ptr [ebp-24],eax
 00428908    mov         byte ptr [ebp-20],0
 0042890C    mov         eax,4289BC;'CharCount'
 00428911    mov         dword ptr [ebp-1C],eax
 00428914    mov         byte ptr [ebp-18],11
 00428918    mov         dword ptr [ebp-14],edi
 0042891B    mov         byte ptr [ebp-10],0
 0042891F    lea         eax,[ebp-2C]
 00428922    push        eax
 00428923    push        3
 00428925    mov         ecx,dword ptr ds:[78D1D4];^SResString155:TResStringRec
 0042892B    mov         dl,1
 0042892D    mov         eax,[00419B58];ERangeError
 00428932    call        Exception.CreateResFmt;ERangeError.Create
 00428937    call        @RaiseExcept
 0042893C    mov         edx,dword ptr [ebx+8];TStringBuilder.FLength:Integer
 0042893F    add         edx,edi
 00428941    mov         eax,ebx
 00428943    call        TStringBuilder.SetLength
 00428948    mov         eax,dword ptr [ebx+8];TStringBuilder.FLength:Integer
 0042894B    sub         eax,esi
 0042894D    test        eax,eax
>0042894F    jle         00428969
 00428951    lea         edx,[edi+esi]
 00428954    mov         ecx,dword ptr [ebx+4];TStringBuilder.FData:?
 00428957    lea         edx,[ecx+edx*2]
 0042895A    add         eax,eax
 0042895C    push        eax
 0042895D    mov         eax,dword ptr [ebx+4];TStringBuilder.FData:?
 00428960    lea         eax,[eax+esi*2]
 00428963    pop         ecx
 00428964    call        Move
 00428969    mov         eax,dword ptr [ebp-4]
 0042896C    mov         edx,dword ptr [ebp+0C]
 0042896F    lea         eax,[eax+edx*2]
 00428972    mov         ecx,edi
 00428974    add         ecx,ecx
 00428976    mov         edx,dword ptr [ebx+4];TStringBuilder.FData:?
 00428979    lea         edx,[edx+esi*2]
 0042897C    call        Move
 00428981    mov         eax,ebx
 00428983    pop         edi
 00428984    pop         esi
 00428985    pop         ebx
 00428986    mov         esp,ebp
 00428988    pop         ebp
 00428989    ret         8
end;*}

//004289D0
function TStringBuilder.Insert(Index:Integer; Value:Cardinal):TStringBuilder;
begin
{*
 004289D0    push        ebp
 004289D1    mov         ebp,esp
 004289D3    push        0
 004289D5    push        ebx
 004289D6    push        esi
 004289D7    push        edi
 004289D8    mov         edi,ecx
 004289DA    mov         esi,edx
 004289DC    mov         ebx,eax
 004289DE    xor         eax,eax
 004289E0    push        ebp
 004289E1    push        428A1C
 004289E6    push        dword ptr fs:[eax]
 004289E9    mov         dword ptr fs:[eax],esp
 004289EC    mov         eax,edi
 004289EE    xor         edx,edx
 004289F0    push        edx
 004289F1    push        eax
 004289F2    lea         eax,[ebp-4]
 004289F5    call        IntToStr
 004289FA    mov         ecx,dword ptr [ebp-4]
 004289FD    mov         edx,esi
 004289FF    mov         eax,ebx
 00428A01    call        TStringBuilder.Insert
 00428A06    xor         eax,eax
 00428A08    pop         edx
 00428A09    pop         ecx
 00428A0A    pop         ecx
 00428A0B    mov         dword ptr fs:[eax],edx
 00428A0E    push        428A23
 00428A13    lea         eax,[ebp-4]
 00428A16    call        @UStrClr
 00428A1B    ret
>00428A1C    jmp         @HandleFinally
>00428A21    jmp         00428A13
 00428A23    mov         eax,ebx
 00428A25    pop         edi
 00428A26    pop         esi
 00428A27    pop         ebx
 00428A28    pop         ecx
 00428A29    pop         ebp
 00428A2A    ret
*}
end;

//00428A2C
{*function TStringBuilder.Insert(Index:Integer; Value:UInt64; ?:?):TStringBuilder;
begin
 00428A2C    push        ebp
 00428A2D    mov         ebp,esp
 00428A2F    push        0
 00428A31    push        ebx
 00428A32    push        esi
 00428A33    mov         esi,edx
 00428A35    mov         ebx,eax
 00428A37    xor         eax,eax
 00428A39    push        ebp
 00428A3A    push        428A75
 00428A3F    push        dword ptr fs:[eax]
 00428A42    mov         dword ptr fs:[eax],esp
 00428A45    push        dword ptr [ebp+0C]
 00428A48    push        dword ptr [ebp+8]
 00428A4B    lea         eax,[ebp-4]
 00428A4E    call        UIntToStr
 00428A53    mov         ecx,dword ptr [ebp-4]
 00428A56    mov         edx,esi
 00428A58    mov         eax,ebx
 00428A5A    call        TStringBuilder.Insert
 00428A5F    xor         eax,eax
 00428A61    pop         edx
 00428A62    pop         ecx
 00428A63    pop         ecx
 00428A64    mov         dword ptr fs:[eax],edx
 00428A67    push        428A7C
 00428A6C    lea         eax,[ebp-4]
 00428A6F    call        @UStrClr
 00428A74    ret
>00428A75    jmp         @HandleFinally
>00428A7A    jmp         00428A6C
 00428A7C    mov         eax,ebx
 00428A7E    pop         esi
 00428A7F    pop         ebx
 00428A80    pop         ecx
 00428A81    pop         ebp
 00428A82    ret         8
end;*}

//00428A88
procedure sub_00428A88(?:TStringBuilder);
begin
{*
 00428A88    push        ebx
 00428A89    mov         ebx,eax
 00428A8B    mov         eax,ebx
 00428A8D    call        TStringBuilder.GetCapacity
 00428A92    test        eax,eax
>00428A94    jns         00428A99
 00428A96    add         eax,3
 00428A99    sar         eax,2
 00428A9C    cmp         eax,dword ptr [ebx+8]
>00428A9F    jl          00428AC1
 00428AA1    mov         eax,ebx
 00428AA3    call        TStringBuilder.GetCapacity
 00428AA8    sar         eax,1
>00428AAA    jns         00428AAF
 00428AAC    adc         eax,0
 00428AAF    mov         edx,dword ptr [ebx+8]
 00428AB2    cmp         eax,edx
>00428AB4    jge         00428AB8
 00428AB6    mov         eax,edx
 00428AB8    mov         edx,eax
 00428ABA    mov         eax,ebx
 00428ABC    call        TStringBuilder.SetCapacity
 00428AC1    pop         ebx
 00428AC2    ret
*}
end;

//00428AC4
function TStringBuilder.Remove(StartIndex:Integer; RemLength:Integer):TStringBuilder;
begin
{*
 00428AC4    push        ebx
 00428AC5    push        esi
 00428AC6    push        edi
 00428AC7    push        ebp
 00428AC8    add         esp,0FFFFFFF8
 00428ACB    mov         esi,ecx
 00428ACD    mov         edi,edx
 00428ACF    mov         ebx,eax
 00428AD1    test        esi,esi
>00428AD3    je          00428B80
 00428AD9    test        edi,edi
>00428ADB    jge         00428B04
 00428ADD    mov         eax,428B98;'StartIndex'
 00428AE2    mov         dword ptr [esp],eax
 00428AE5    mov         byte ptr [esp+4],11
 00428AEA    push        esp
 00428AEB    push        0
 00428AED    mov         ecx,dword ptr ds:[78DA74];^SResString154:TResStringRec
 00428AF3    mov         dl,1
 00428AF5    mov         eax,[00419B58];ERangeError
 00428AFA    call        Exception.CreateResFmt;ERangeError.Create
 00428AFF    call        @RaiseExcept
 00428B04    test        esi,esi
>00428B06    jge         00428B2F
 00428B08    mov         eax,428BBC;'RemLength'
 00428B0D    mov         dword ptr [esp],eax
 00428B10    mov         byte ptr [esp+4],11
 00428B15    push        esp
 00428B16    push        0
 00428B18    mov         ecx,dword ptr ds:[78DA74];^SResString154:TResStringRec
 00428B1E    mov         dl,1
 00428B20    mov         eax,[00419B58];ERangeError
 00428B25    call        Exception.CreateResFmt;ERangeError.Create
 00428B2A    call        @RaiseExcept
 00428B2F    mov         edx,edi
 00428B31    mov         eax,ebx
 00428B33    call        00427D04
 00428B38    lea         ebp,[esi+edi]
 00428B3B    mov         edx,ebp
 00428B3D    dec         edx
 00428B3E    mov         eax,ebx
 00428B40    call        00427D04
 00428B45    mov         eax,dword ptr [ebx+8];TStringBuilder.FLength:Integer
 00428B48    sub         eax,ebp
 00428B4A    test        eax,eax
>00428B4C    jle         00428B6D
 00428B4E    lea         eax,[esi+edi]
 00428B51    mov         edx,dword ptr [ebx+8];TStringBuilder.FLength:Integer
 00428B54    sub         edx,eax
 00428B56    mov         ecx,edx
 00428B58    add         ecx,ecx
 00428B5A    mov         eax,dword ptr [ebx+4];TStringBuilder.FData:?
 00428B5D    lea         eax,[eax+edi*2]
 00428B60    push        eax
 00428B61    mov         eax,dword ptr [ebx+4];TStringBuilder.FData:?
 00428B64    lea         eax,[eax+ebp*2]
 00428B67    pop         edx
 00428B68    call        Move
 00428B6D    mov         edx,dword ptr [ebx+8];TStringBuilder.FLength:Integer
 00428B70    sub         edx,esi
 00428B72    mov         eax,ebx
 00428B74    call        TStringBuilder.SetLength
 00428B79    mov         eax,ebx
 00428B7B    call        00428A88
 00428B80    mov         eax,ebx
 00428B82    pop         ecx
 00428B83    pop         edx
 00428B84    pop         ebp
 00428B85    pop         edi
 00428B86    pop         esi
 00428B87    pop         ebx
 00428B88    ret
*}
end;

//00428BD0
function TStringBuilder.Replace(OldValue:string; NewValue:string; Count:Integer; StartIndex:Integer):TStringBuilder;
begin
{*
 00428BD0    push        ebp
 00428BD1    mov         ebp,esp
 00428BD3    add         esp,0FFFFFFBC
 00428BD6    push        ebx
 00428BD7    push        esi
 00428BD8    push        edi
 00428BD9    mov         dword ptr [ebp-4],ecx
 00428BDC    mov         edi,edx
 00428BDE    mov         esi,eax
 00428BE0    mov         dword ptr [ebp-8],esi
 00428BE3    cmp         dword ptr [ebp+8],0
>00428BE7    je          00428D58
 00428BED    cmp         dword ptr [ebp+0C],0
>00428BF1    jge         00428C1C
 00428BF3    mov         eax,428D70;'StartIndex'
 00428BF8    mov         dword ptr [ebp-24],eax
 00428BFB    mov         byte ptr [ebp-20],11
 00428BFF    lea         eax,[ebp-24]
 00428C02    push        eax
 00428C03    push        0
 00428C05    mov         ecx,dword ptr ds:[78DA74];^SResString154:TResStringRec
 00428C0B    mov         dl,1
 00428C0D    mov         eax,[00419B58];ERangeError
 00428C12    call        Exception.CreateResFmt;ERangeError.Create
 00428C17    call        @RaiseExcept
 00428C1C    cmp         dword ptr [ebp+8],0
>00428C20    jge         00428C4B
 00428C22    mov         eax,428D94;'Count'
 00428C27    mov         dword ptr [ebp-24],eax
 00428C2A    mov         byte ptr [ebp-20],11
 00428C2E    lea         eax,[ebp-24]
 00428C31    push        eax
 00428C32    push        0
 00428C34    mov         ecx,dword ptr ds:[78DA74];^SResString154:TResStringRec
 00428C3A    mov         dl,1
 00428C3C    mov         eax,[00419B58];ERangeError
 00428C41    call        Exception.CreateResFmt;ERangeError.Create
 00428C46    call        @RaiseExcept
 00428C4B    mov         eax,dword ptr [ebp+0C]
 00428C4E    add         eax,dword ptr [ebp+8]
 00428C51    cmp         eax,dword ptr [esi+8];TStringBuilder.FLength:Integer
>00428C54    jle         00428C9F
 00428C56    mov         eax,428D70;'StartIndex'
 00428C5B    mov         dword ptr [ebp-44],eax
 00428C5E    mov         byte ptr [ebp-40],11
 00428C62    mov         eax,dword ptr [ebp+0C]
 00428C65    mov         dword ptr [ebp-3C],eax
 00428C68    mov         byte ptr [ebp-38],0
 00428C6C    mov         eax,428D94;'Count'
 00428C71    mov         dword ptr [ebp-34],eax
 00428C74    mov         byte ptr [ebp-30],11
 00428C78    mov         eax,dword ptr [ebp+8]
 00428C7B    mov         dword ptr [ebp-2C],eax
 00428C7E    mov         byte ptr [ebp-28],0
 00428C82    lea         eax,[ebp-44]
 00428C85    push        eax
 00428C86    push        3
 00428C88    mov         ecx,dword ptr ds:[78D1D4];^SResString155:TResStringRec
 00428C8E    mov         dl,1
 00428C90    mov         eax,[00419B58];ERangeError
 00428C95    call        Exception.CreateResFmt;ERangeError.Create
 00428C9A    call        @RaiseExcept
 00428C9F    mov         edx,edi
 00428CA1    test        edx,edx
>00428CA3    je          00428CAA
 00428CA5    sub         edx,4
 00428CA8    mov         edx,dword ptr [edx]
 00428CAA    mov         dword ptr [ebp-18],edx
 00428CAD    mov         edx,dword ptr [ebp-4]
 00428CB0    test        edx,edx
>00428CB2    je          00428CB9
 00428CB4    sub         edx,4
 00428CB7    mov         edx,dword ptr [edx]
 00428CB9    mov         dword ptr [ebp-1C],edx
 00428CBC    mov         edx,dword ptr [ebp+0C]
 00428CBF    mov         dword ptr [ebp-10],edx
 00428CC2    mov         edx,dword ptr [esi+4];TStringBuilder.FData:?
 00428CC5    mov         ecx,dword ptr [ebp+0C]
 00428CC8    lea         ebx,[edx+ecx*2]
 00428CCB    sub         eax,dword ptr [ebp-18]
 00428CCE    mov         dword ptr [ebp-14],eax
 00428CD1    mov         eax,dword ptr [esi+4];TStringBuilder.FData:?
 00428CD4    mov         edx,dword ptr [ebp-14]
 00428CD7    lea         eax,[eax+edx*2]
 00428CDA    mov         dword ptr [ebp-0C],eax
 00428CDD    cmp         ebx,dword ptr [ebp-0C]
>00428CE0    ja          00428D58
 00428CE2    movzx       eax,word ptr [edi]
 00428CE5    cmp         ax,word ptr [ebx]
>00428CE8    jne         00428D4D
 00428CEA    mov         eax,edi
 00428CEC    call        @UStrToPWChar
 00428CF1    mov         edx,eax
 00428CF3    mov         ecx,dword ptr [ebp-18]
 00428CF6    mov         eax,ebx
 00428CF8    call        StrLComp
 00428CFD    test        eax,eax
>00428CFF    jne         00428D4D
 00428D01    mov         eax,dword ptr [ebp-4]
 00428D04    push        eax
 00428D05    mov         ecx,edi
 00428D07    mov         edx,dword ptr [ebp-10]
 00428D0A    mov         eax,esi
 00428D0C    call        00429164
 00428D11    test        al,al
>00428D13    je          00428D2A
 00428D15    mov         eax,dword ptr [esi+4];TStringBuilder.FData:?
 00428D18    mov         edx,dword ptr [ebp-10]
 00428D1B    lea         ebx,[eax+edx*2]
 00428D1E    mov         eax,dword ptr [esi+4];TStringBuilder.FData:?
 00428D21    mov         edx,dword ptr [ebp-14]
 00428D24    lea         eax,[eax+edx*2]
 00428D27    mov         dword ptr [ebp-0C],eax
 00428D2A    mov         eax,dword ptr [ebp-1C]
 00428D2D    dec         eax
 00428D2E    add         eax,eax
 00428D30    add         ebx,eax
 00428D32    mov         eax,dword ptr [ebp-1C]
 00428D35    dec         eax
 00428D36    add         dword ptr [ebp-10],eax
 00428D39    mov         eax,dword ptr [ebp-1C]
 00428D3C    sub         eax,dword ptr [ebp-18]
 00428D3F    add         eax,eax
 00428D41    add         dword ptr [ebp-0C],eax
 00428D44    mov         eax,dword ptr [ebp-1C]
 00428D47    sub         eax,dword ptr [ebp-18]
 00428D4A    add         dword ptr [ebp-14],eax
 00428D4D    add         ebx,2
 00428D50    inc         dword ptr [ebp-10]
 00428D53    cmp         ebx,dword ptr [ebp-0C]
>00428D56    jbe         00428CE2
 00428D58    mov         eax,dword ptr [ebp-8]
 00428D5B    pop         edi
 00428D5C    pop         esi
 00428D5D    pop         ebx
 00428D5E    mov         esp,ebp
 00428D60    pop         ebp
 00428D61    ret         8
*}
end;

//00428DA0
function TStringBuilder.Replace(OldChar:Char; NewChar:Char; Count:Integer; StartIndex:Integer):TStringBuilder;
begin
{*
 00428DA0    push        ebp
 00428DA1    mov         ebp,esp
 00428DA3    add         esp,0FFFFFFF4
 00428DA6    push        ebx
 00428DA7    push        esi
 00428DA8    push        edi
 00428DA9    mov         word ptr [ebp-4],cx
 00428DAD    mov         word ptr [ebp-2],dx
 00428DB1    mov         ebx,eax
 00428DB3    mov         edi,dword ptr [ebp+8]
 00428DB6    mov         esi,dword ptr [ebp+0C]
 00428DB9    test        edi,edi
>00428DBB    je          00428E59
 00428DC1    test        esi,esi
>00428DC3    jge         00428DEE
 00428DC5    mov         eax,428E70;'StartIndex'
 00428DCA    mov         dword ptr [ebp-0C],eax
 00428DCD    mov         byte ptr [ebp-8],11
 00428DD1    lea         eax,[ebp-0C]
 00428DD4    push        eax
 00428DD5    push        0
 00428DD7    mov         ecx,dword ptr ds:[78DA74];^SResString154:TResStringRec
 00428DDD    mov         dl,1
 00428DDF    mov         eax,[00419B58];ERangeError
 00428DE4    call        Exception.CreateResFmt;ERangeError.Create
 00428DE9    call        @RaiseExcept
 00428DEE    test        edi,edi
>00428DF0    jge         00428E1B
 00428DF2    mov         eax,428E94;'Count'
 00428DF7    mov         dword ptr [ebp-0C],eax
 00428DFA    mov         byte ptr [ebp-8],11
 00428DFE    lea         eax,[ebp-0C]
 00428E01    push        eax
 00428E02    push        0
 00428E04    mov         ecx,dword ptr ds:[78DA74];^SResString154:TResStringRec
 00428E0A    mov         dl,1
 00428E0C    mov         eax,[00419B58];ERangeError
 00428E11    call        Exception.CreateResFmt;ERangeError.Create
 00428E16    call        @RaiseExcept
 00428E1B    mov         edx,esi
 00428E1D    mov         eax,ebx
 00428E1F    call        00427D04
 00428E24    lea         edx,[edi+esi]
 00428E27    dec         edx
 00428E28    mov         eax,ebx
 00428E2A    call        00427D04
 00428E2F    add         edi,esi
 00428E31    mov         eax,dword ptr [ebx+4];TStringBuilder.FData:?
 00428E34    lea         edx,[eax+edi*2-2]
 00428E38    mov         eax,dword ptr [ebx+4];TStringBuilder.FData:?
 00428E3B    lea         eax,[eax+esi*2]
 00428E3E    cmp         edx,eax
>00428E40    jb          00428E59
 00428E42    movzx       ecx,word ptr [eax]
 00428E45    cmp         cx,word ptr [ebp-2]
>00428E49    jne         00428E52
 00428E4B    movzx       ecx,word ptr [ebp-4]
 00428E4F    mov         word ptr [eax],cx
 00428E52    add         eax,2
 00428E55    cmp         edx,eax
>00428E57    jae         00428E42
 00428E59    mov         eax,ebx
 00428E5B    pop         edi
 00428E5C    pop         esi
 00428E5D    pop         ebx
 00428E5E    mov         esp,ebp
 00428E60    pop         ebp
 00428E61    ret         8
*}
end;

//00428EA0
procedure TStringBuilder.Replace(OldChar:Char; NewChar:Char);
begin
{*
 00428EA0    push        ebx
 00428EA1    push        esi
 00428EA2    push        edi
 00428EA3    mov         ebx,dword ptr [eax+4];TStringBuilder.FData:?
 00428EA6    mov         esi,dword ptr [eax+8];TStringBuilder.FLength:Integer
 00428EA9    lea         edi,[ebx+esi*2-2]
 00428EAD    mov         esi,dword ptr [eax+4];TStringBuilder.FData:?
 00428EB0    cmp         edi,esi
>00428EB2    jb          00428EC3
 00428EB4    cmp         dx,word ptr [esi]
>00428EB7    jne         00428EBC
 00428EB9    mov         word ptr [esi],cx
 00428EBC    add         esi,2
 00428EBF    cmp         edi,esi
>00428EC1    jae         00428EB4
 00428EC3    pop         edi
 00428EC4    pop         esi
 00428EC5    pop         ebx
 00428EC6    ret
*}
end;

//00428EC8
function TStringBuilder.Replace(OldValue:string; NewValue:string):TStringBuilder;
begin
{*
 00428EC8    push        ebx
 00428EC9    push        esi
 00428ECA    mov         esi,eax
 00428ECC    push        0
 00428ECE    mov         ebx,dword ptr [eax+8];TStringBuilder.FLength:Integer
 00428ED1    push        ebx
 00428ED2    call        TStringBuilder.Replace
 00428ED7    mov         eax,esi
 00428ED9    pop         esi
 00428EDA    pop         ebx
 00428EDB    ret
*}
end;

//00428EDC
procedure TStringBuilder.SetCapacity(Value:Integer);
begin
{*
 00428EDC    push        ebx
 00428EDD    push        esi
 00428EDE    add         esp,0FFFFFFF8
 00428EE1    mov         ebx,edx
 00428EE3    mov         esi,eax
 00428EE5    cmp         ebx,dword ptr [esi+8]
>00428EE8    jge         00428F0C
 00428EEA    mov         dword ptr [esp],ebx
 00428EED    mov         byte ptr [esp+4],0
 00428EF2    push        esp
 00428EF3    push        0
 00428EF5    mov         ecx,dword ptr ds:[78D414];^SResString130:TResStringRec
 00428EFB    mov         dl,1
 00428EFD    mov         eax,[00419B58];ERangeError
 00428F02    call        Exception.CreateResFmt
 00428F07    call        @RaiseExcept
 00428F0C    cmp         ebx,dword ptr [esi+0C]
>00428F0F    jle         00428F33
 00428F11    mov         dword ptr [esp],ebx
 00428F14    mov         byte ptr [esp+4],0
 00428F19    push        esp
 00428F1A    push        0
 00428F1C    mov         ecx,dword ptr ds:[78D414];^SResString130:TResStringRec
 00428F22    mov         dl,1
 00428F24    mov         eax,[00419B58];ERangeError
 00428F29    call        Exception.CreateResFmt
 00428F2E    call        @RaiseExcept
 00428F33    push        ebx
 00428F34    lea         eax,[esi+4]
 00428F37    mov         ecx,1
 00428F3C    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 00428F42    call        @DynArraySetLength
 00428F47    add         esp,4
 00428F4A    pop         ecx
 00428F4B    pop         edx
 00428F4C    pop         esi
 00428F4D    pop         ebx
 00428F4E    ret
*}
end;

//00428F50
procedure TStringBuilder.SetLength(Value:Integer);
begin
{*
 00428F50    push        ebp
 00428F51    mov         ebp,esp
 00428F53    add         esp,0FFFFFFF0
 00428F56    push        ebx
 00428F57    push        esi
 00428F58    push        edi
 00428F59    mov         ebx,edx
 00428F5B    mov         dword ptr [ebp-4],eax
 00428F5E    test        ebx,ebx
>00428F60    jge         00428F8B
 00428F62    mov         eax,42902C;'Value'
 00428F67    mov         dword ptr [ebp-10],eax
 00428F6A    mov         byte ptr [ebp-0C],11
 00428F6E    lea         eax,[ebp-10]
 00428F71    push        eax
 00428F72    push        0
 00428F74    mov         ecx,dword ptr ds:[78DA74];^SResString154:TResStringRec
 00428F7A    mov         dl,1
 00428F7C    mov         eax,[00419B58];ERangeError
 00428F81    call        Exception.CreateResFmt
 00428F86    call        @RaiseExcept
 00428F8B    mov         eax,dword ptr [ebp-4]
 00428F8E    call        TStringBuilder.GetMaxCapacity
 00428F93    cmp         ebx,eax
>00428F95    jle         00428FBB
 00428F97    mov         dword ptr [ebp-10],ebx
 00428F9A    mov         byte ptr [ebp-0C],0
 00428F9E    lea         eax,[ebp-10]
 00428FA1    push        eax
 00428FA2    push        0
 00428FA4    mov         ecx,dword ptr ds:[78D414];^SResString130:TResStringRec
 00428FAA    mov         dl,1
 00428FAC    mov         eax,[00419B58];ERangeError
 00428FB1    call        Exception.CreateResFmt
 00428FB6    call        @RaiseExcept
 00428FBB    mov         eax,dword ptr [ebp-4]
 00428FBE    mov         eax,dword ptr [eax+8]
 00428FC1    mov         dword ptr [ebp-8],eax
 00428FC4    xor         edx,edx
 00428FC6    push        ebp
 00428FC7    push        428FF8
 00428FCC    push        dword ptr fs:[edx]
 00428FCF    mov         dword ptr fs:[edx],esp
 00428FD2    mov         eax,dword ptr [ebp-4]
 00428FD5    mov         esi,ebx
 00428FD7    mov         dword ptr [eax+8],esi
 00428FDA    mov         eax,dword ptr [ebp-4]
 00428FDD    call        TStringBuilder.GetCapacity
 00428FE2    cmp         esi,eax
>00428FE4    jle         00428FEE
 00428FE6    mov         eax,dword ptr [ebp-4]
 00428FE9    call        TStringBuilder.ExpandCapacity
 00428FEE    xor         eax,eax
 00428FF0    pop         edx
 00428FF1    pop         ecx
 00428FF2    pop         ecx
 00428FF3    mov         dword ptr fs:[eax],edx
>00428FF6    jmp         00429017
>00428FF8    jmp         @HandleOnException
 00428FFD    dd          1
 00429001    dd          00419778;EOutOfMemory
 00429005    dd          00429009
 00429009    mov         eax,dword ptr [ebp-4]
 0042900C    mov         edx,dword ptr [ebp-8]
 0042900F    mov         dword ptr [eax+8],edx
 00429012    call        @DoneExcept
 00429017    pop         edi
 00429018    pop         esi
 00429019    pop         ebx
 0042901A    mov         esp,ebp
 0042901C    pop         ebp
 0042901D    ret
*}
end;

//00429038
{*procedure TStringBuilder.ToString(?:?);
begin
 00429038    push        ebx
 00429039    push        esi
 0042903A    mov         esi,edx
 0042903C    mov         ebx,eax
 0042903E    mov         eax,esi
 00429040    mov         edx,dword ptr [ebx+8];TStringBuilder.FLength:Integer
 00429043    call        @UStrSetLength
 00429048    mov         eax,esi
 0042904A    call        @UniqueStringU
 0042904F    mov         edx,eax
 00429051    mov         ecx,dword ptr [ebx+8];TStringBuilder.FLength:Integer
 00429054    add         ecx,ecx
 00429056    mov         eax,dword ptr [ebx+4];TStringBuilder.FData:?
 00429059    call        Move
 0042905E    pop         esi
 0042905F    pop         ebx
 00429060    ret
end;*}

//00429064
{*procedure TStringBuilder.ToString(StartIndex:Integer; StrLength:Integer; ?:?);
begin
 00429064    push        ebp
 00429065    mov         ebp,esp
 00429067    add         esp,0FFFFFFF8
 0042906A    push        ebx
 0042906B    push        esi
 0042906C    push        edi
 0042906D    mov         ebx,ecx
 0042906F    mov         edi,edx
 00429071    mov         esi,eax
 00429073    test        ebx,ebx
>00429075    je          0042910E
 0042907B    test        edi,edi
>0042907D    jge         004290A8
 0042907F    mov         eax,42912C;'StartIndex'
 00429084    mov         dword ptr [ebp-8],eax
 00429087    mov         byte ptr [ebp-4],11
 0042908B    lea         eax,[ebp-8]
 0042908E    push        eax
 0042908F    push        0
 00429091    mov         ecx,dword ptr ds:[78DA74];^SResString154:TResStringRec
 00429097    mov         dl,1
 00429099    mov         eax,[00419B58];ERangeError
 0042909E    call        Exception.CreateResFmt;ERangeError.Create
 004290A3    call        @RaiseExcept
 004290A8    test        ebx,ebx
>004290AA    jge         004290D5
 004290AC    mov         eax,429150;'StrLength'
 004290B1    mov         dword ptr [ebp-8],eax
 004290B4    mov         byte ptr [ebp-4],11
 004290B8    lea         eax,[ebp-8]
 004290BB    push        eax
 004290BC    push        0
 004290BE    mov         ecx,dword ptr ds:[78DA74];^SResString154:TResStringRec
 004290C4    mov         dl,1
 004290C6    mov         eax,[00419B58];ERangeError
 004290CB    call        Exception.CreateResFmt;ERangeError.Create
 004290D0    call        @RaiseExcept
 004290D5    mov         edx,edi
 004290D7    mov         eax,esi
 004290D9    call        00427D04
 004290DE    lea         edx,[ebx+edi]
 004290E1    dec         edx
 004290E2    mov         eax,esi
 004290E4    call        00427D04
 004290E9    mov         eax,dword ptr [ebp+8]
 004290EC    mov         edx,ebx
 004290EE    call        @UStrSetLength
 004290F3    mov         eax,dword ptr [ebp+8]
 004290F6    call        @UniqueStringU
 004290FB    mov         edx,eax
 004290FD    mov         eax,dword ptr [esi+4];TStringBuilder.FData:?
 00429100    lea         eax,[eax+edi*2]
 00429103    mov         ecx,ebx
 00429105    add         ecx,ecx
 00429107    call        Move
>0042910C    jmp         00429116
 0042910E    mov         eax,dword ptr [ebp+8]
 00429111    call        @UStrClr
 00429116    pop         edi
 00429117    pop         esi
 00429118    pop         ebx
 00429119    pop         ecx
 0042911A    pop         ecx
 0042911B    pop         ebp
 0042911C    ret         4
end;*}

//00429164
{*function sub_00429164(?:TStringBuilder; ?:Integer; ?:string; ?:?):?;
begin
 00429164    push        ebp
 00429165    mov         ebp,esp
 00429167    add         esp,0FFFFFFEC
 0042916A    push        ebx
 0042916B    push        esi
 0042916C    push        edi
 0042916D    mov         dword ptr [ebp-8],ecx
 00429170    mov         dword ptr [ebp-4],edx
 00429173    mov         ebx,eax
 00429175    mov         byte ptr [ebp-9],0
 00429179    mov         eax,dword ptr [ebp+8]
 0042917C    test        eax,eax
>0042917E    je          00429185
 00429180    sub         eax,4
 00429183    mov         eax,dword ptr [eax]
 00429185    mov         edx,dword ptr [ebp-8]
 00429188    test        edx,edx
>0042918A    je          00429191
 0042918C    sub         edx,4
 0042918F    mov         edx,dword ptr [edx]
 00429191    mov         esi,eax
 00429193    sub         esi,edx
 00429195    test        esi,esi
>00429197    jne         004291C4
 00429199    mov         esi,dword ptr [ebp+8]
 0042919C    test        esi,esi
>0042919E    je          004291A5
 004291A0    sub         esi,4
 004291A3    mov         esi,dword ptr [esi]
 004291A5    mov         eax,dword ptr [ebp+8]
 004291A8    call        @UStrToPWChar
 004291AD    mov         edx,dword ptr [ebx+4];TStringBuilder.FData:?
 004291B0    mov         ecx,dword ptr [ebp-4]
 004291B3    lea         edx,[edx+ecx*2]
 004291B6    mov         ecx,esi
 004291B8    add         ecx,ecx
 004291BA    call        Move
>004291BF    jmp         0042927F
 004291C4    mov         eax,dword ptr [ebx+8];TStringBuilder.FLength:Integer
 004291C7    mov         dword ptr [ebp-10],eax
 004291CA    test        esi,esi
>004291CC    jle         004291F2
 004291CE    mov         eax,ebx
 004291D0    call        TStringBuilder.GetCapacity
 004291D5    mov         edi,eax
 004291D7    mov         edx,dword ptr [ebx+8];TStringBuilder.FLength:Integer
 004291DA    add         edx,esi
 004291DC    mov         eax,ebx
 004291DE    call        TStringBuilder.SetLength
 004291E3    mov         eax,ebx
 004291E5    call        TStringBuilder.GetCapacity
 004291EA    cmp         edi,eax
>004291EC    je          004291F2
 004291EE    mov         byte ptr [ebp-9],1
 004291F2    mov         eax,dword ptr [ebp-8]
 004291F5    test        eax,eax
>004291F7    je          004291FE
 004291F9    sub         eax,4
 004291FC    mov         eax,dword ptr [eax]
 004291FE    mov         edx,dword ptr [ebp+8]
 00429201    test        edx,edx
>00429203    je          0042920A
 00429205    sub         edx,4
 00429208    mov         edx,dword ptr [edx]
 0042920A    mov         ecx,dword ptr [ebp-8]
 0042920D    mov         dword ptr [ebp-14],ecx
 00429210    cmp         dword ptr [ebp-14],0
>00429214    je          00429221
 00429216    mov         ecx,dword ptr [ebp-14]
 00429219    sub         ecx,4
 0042921C    mov         ecx,dword ptr [ecx]
 0042921E    mov         dword ptr [ebp-14],ecx
 00429221    mov         ecx,dword ptr [ebp-14]
 00429224    add         ecx,dword ptr [ebp-4]
 00429227    mov         edi,dword ptr [ebp-10]
 0042922A    sub         edi,ecx
 0042922C    mov         ecx,edi
 0042922E    add         ecx,ecx
 00429230    push        ecx
 00429231    add         eax,dword ptr [ebp-4]
 00429234    mov         ecx,dword ptr [ebx+4];TStringBuilder.FData:?
 00429237    lea         eax,[ecx+eax*2]
 0042923A    add         edx,dword ptr [ebp-4]
 0042923D    mov         ecx,dword ptr [ebx+4];TStringBuilder.FData:?
 00429240    lea         edx,[ecx+edx*2]
 00429243    pop         ecx
 00429244    call        Move
 00429249    mov         edi,dword ptr [ebp+8]
 0042924C    test        edi,edi
>0042924E    je          00429255
 00429250    sub         edi,4
 00429253    mov         edi,dword ptr [edi]
 00429255    mov         eax,dword ptr [ebp+8]
 00429258    call        @UStrToPWChar
 0042925D    mov         edx,dword ptr [ebx+4];TStringBuilder.FData:?
 00429260    mov         ecx,dword ptr [ebp-4]
 00429263    lea         edx,[edx+ecx*2]
 00429266    mov         ecx,edi
 00429268    add         ecx,ecx
 0042926A    call        Move
 0042926F    test        esi,esi
>00429271    jge         0042927F
 00429273    mov         edx,dword ptr [ebx+8];TStringBuilder.FLength:Integer
 00429276    add         edx,esi
 00429278    mov         eax,ebx
 0042927A    call        TStringBuilder.SetLength
 0042927F    movzx       eax,byte ptr [ebp-9]
 00429283    pop         edi
 00429284    pop         esi
 00429285    pop         ebx
 00429286    mov         esp,ebp
 00429288    pop         ebp
 00429289    ret         4
end;*}

//0042928C
{*function sub_0042928C:?;
begin
 0042928C    push        edi
 0042928D    push        ecx
 0042928E    lea         edi,ds:[41D4E4];0xC5002920 EncodingHashList
 00429294    mov         ecx,0FB
 00429299    repne scas  dword ptr [edi]
>0042929B    jne         004292A9
 0042929D    not         ecx
 0042929F    add         ecx,0FB
 004292A5    mov         eax,ecx
>004292A7    jmp         004292AE
 004292A9    mov         eax,0FFFFFFFF
 004292AE    pop         ecx
 004292AF    pop         edi
 004292B0    ret
end;*}

//004292B4
{*function sub_004292B4(?:?; ?:?):?;
begin
 004292B4    push        ebp
 004292B5    mov         ebp,esp
 004292B7    add         esp,0FFFFFFE8
 004292BA    push        ebx
 004292BB    push        esi
 004292BC    push        edi
 004292BD    xor         ecx,ecx
 004292BF    mov         dword ptr [ebp-18],ecx
 004292C2    mov         dword ptr [ebp-14],ecx
 004292C5    mov         dword ptr [ebp-10],ecx
 004292C8    mov         dword ptr [ebp-8],edx
 004292CB    mov         dword ptr [ebp-4],eax
 004292CE    xor         eax,eax
 004292D0    push        ebp
 004292D1    push        4293BE
 004292D6    push        dword ptr fs:[eax]
 004292D9    mov         dword ptr fs:[eax],esp
 004292DC    xor         ebx,ebx
 004292DE    lea         eax,[ebp-10]
 004292E1    mov         edx,dword ptr [ebp-4]
 004292E4    mov         ecx,0
 004292E9    call        @LStrFromUStr
 004292EE    mov         eax,dword ptr [ebp-10]
 004292F1    call        @LStrToPChar
 004292F6    mov         esi,eax
 004292F8    mov         eax,esi
 004292FA    call        0042683C
 004292FF    call        0042928C
 00429304    cmp         eax,0FFFFFFFF
>00429307    je          0042933D
 00429309    mov         edi,41D8D4;EncodingDataList
 0042930E    add         eax,eax
 00429310    add         eax,eax
 00429312    add         edi,eax
 00429314    mov         ebx,41DCC4;EncodingNameList
 00429319    movzx       eax,word ptr [edi+2]
 0042931D    add         ebx,eax
 0042931F    mov         edx,ebx
 00429321    mov         eax,esi
 00429323    call        StrComp
 00429328    test        eax,eax
 0042932A    sete        al
 0042932D    mov         ebx,eax
 0042932F    test        bl,bl
>00429331    je          0042939B
 00429333    movzx       eax,word ptr [edi]
 00429336    mov         edx,dword ptr [ebp-8]
 00429339    mov         dword ptr [edx],eax
>0042933B    jmp         0042939B
 0042933D    lea         eax,[ebp-14]
 00429340    push        eax
 00429341    mov         ecx,2
 00429346    mov         edx,1
 0042934B    mov         eax,dword ptr [ebp-4]
 0042934E    call        @UStrCopy
 00429353    mov         eax,dword ptr [ebp-14]
 00429356    mov         edx,4293DC;'cp'
 0042935B    call        @UStrEqual
>00429360    jne         0042939B
 00429362    mov         ebx,dword ptr [ebp-4]
 00429365    test        ebx,ebx
>00429367    je          0042936E
 00429369    sub         ebx,4
 0042936C    mov         ebx,dword ptr [ebx]
 0042936E    lea         eax,[ebp-18]
 00429371    push        eax
 00429372    mov         ecx,ebx
 00429374    sub         ecx,2
 00429377    mov         edx,3
 0042937C    mov         eax,dword ptr [ebp-4]
 0042937F    call        @UStrCopy
 00429384    mov         eax,dword ptr [ebp-18]
 00429387    lea         edx,[ebp-0C]
 0042938A    call        @ValInt64
 0042938F    mov         edx,dword ptr [ebp-8]
 00429392    mov         dword ptr [edx],eax
 00429394    cmp         dword ptr [ebp-0C],0
 00429398    sete        bl
 0042939B    xor         eax,eax
 0042939D    pop         edx
 0042939E    pop         ecx
 0042939F    pop         ecx
 004293A0    mov         dword ptr fs:[eax],edx
 004293A3    push        4293C5
 004293A8    lea         eax,[ebp-18]
 004293AB    mov         edx,2
 004293B0    call        @UStrArrayClr
 004293B5    lea         eax,[ebp-10]
 004293B8    call        @LStrClr
 004293BD    ret
>004293BE    jmp         @HandleFinally
>004293C3    jmp         004293A8
 004293C5    mov         eax,ebx
 004293C7    pop         edi
 004293C8    pop         esi
 004293C9    pop         ebx
 004293CA    mov         esp,ebp
 004293CC    pop         ebp
 004293CD    ret
end;*}

//004293E4
function TEncoding.Clone:TEncoding;
begin
{*
 004293E4    xor         eax,eax
 004293E6    ret
*}
end;

//004293E8
{*procedure TEncoding.Convert(?:?; ?:?; ?:?; ?:?);
begin
 004293E8    push        ebp
 004293E9    mov         ebp,esp
 004293EB    push        0
 004293ED    push        0
 004293EF    push        ebx
 004293F0    push        esi
 004293F1    mov         esi,ecx
 004293F3    mov         ebx,edx
 004293F5    xor         eax,eax
 004293F7    push        ebp
 004293F8    push        429458
 004293FD    push        dword ptr fs:[eax]
 00429400    mov         dword ptr fs:[eax],esp
 00429403    lea         ecx,[ebp-8]
 00429406    mov         edx,dword ptr [ebp+0C]
 00429409    mov         eax,ebx
 0042940B    call        TEncoding.GetChars
 00429410    mov         edx,dword ptr [ebp-8]
 00429413    lea         ecx,[ebp-4]
 00429416    mov         eax,esi
 00429418    call        TEncoding.GetBytes
 0042941D    mov         edx,dword ptr [ebp-4]
 00429420    mov         eax,dword ptr [ebp+8]
 00429423    mov         ecx,dword ptr ds:[418988];TArray<System.Byte>
 00429429    call        @DynArrayAsg
 0042942E    xor         eax,eax
 00429430    pop         edx
 00429431    pop         ecx
 00429432    pop         ecx
 00429433    mov         dword ptr fs:[eax],edx
 00429436    push        42945F
 0042943B    lea         eax,[ebp-8]
 0042943E    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 00429444    call        @DynArrayClear
 00429449    lea         eax,[ebp-4]
 0042944C    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 00429452    call        @DynArrayClear
 00429457    ret
>00429458    jmp         @HandleFinally
>0042945D    jmp         0042943B
 0042945F    pop         esi
 00429460    pop         ebx
 00429461    pop         ecx
 00429462    pop         ecx
 00429463    pop         ebp
 00429464    ret         8
end;*}

//00429468
{*procedure TEncoding.Convert(?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 00429468    push        ebp
 00429469    mov         ebp,esp
 0042946B    push        0
 0042946D    push        0
 0042946F    push        ebx
 00429470    push        esi
 00429471    mov         esi,ecx
 00429473    mov         ebx,edx
 00429475    xor         eax,eax
 00429477    push        ebp
 00429478    push        4294E0
 0042947D    push        dword ptr fs:[eax]
 00429480    mov         dword ptr fs:[eax],esp
 00429483    mov         eax,dword ptr [ebp+0C]
 00429486    push        eax
 00429487    lea         eax,[ebp-8]
 0042948A    push        eax
 0042948B    mov         ecx,dword ptr [ebp+10]
 0042948E    mov         edx,dword ptr [ebp+14]
 00429491    mov         eax,ebx
 00429493    call        TEncoding.GetChars
 00429498    mov         edx,dword ptr [ebp-8]
 0042949B    lea         ecx,[ebp-4]
 0042949E    mov         eax,esi
 004294A0    call        TEncoding.GetBytes
 004294A5    mov         edx,dword ptr [ebp-4]
 004294A8    mov         eax,dword ptr [ebp+8]
 004294AB    mov         ecx,dword ptr ds:[418988];TArray<System.Byte>
 004294B1    call        @DynArrayAsg
 004294B6    xor         eax,eax
 004294B8    pop         edx
 004294B9    pop         ecx
 004294BA    pop         ecx
 004294BB    mov         dword ptr fs:[eax],edx
 004294BE    push        4294E7
 004294C3    lea         eax,[ebp-8]
 004294C6    mov         edx,dword ptr ds:[41B3D4];TArray<System.Char>
 004294CC    call        @DynArrayClear
 004294D1    lea         eax,[ebp-4]
 004294D4    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 004294DA    call        @DynArrayClear
 004294DF    ret
>004294E0    jmp         @HandleFinally
>004294E5    jmp         004294C3
 004294E7    pop         esi
 004294E8    pop         ebx
 004294E9    pop         ecx
 004294EA    pop         ecx
 004294EB    pop         ebp
 004294EC    ret         10
end;*}

end.