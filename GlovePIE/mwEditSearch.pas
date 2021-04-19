//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit mwEditSearch;

interface

uses
  SysUtils, Classes;

type
  TmwEditSearch = class(TObject)
  published
    function FindFirst(NewText:string):Integer;//00510430
    procedure FixResults(First:Integer; Delta:Integer);//005100D0
    function Next:Integer;//005102A4
    constructor Create;//0050FFE4
    destructor Destroy();//00510394
    function FindAll(NewText:string):Integer;//005103E8
  public
    Run:PWideChar;//f4
    Origin:PWideChar;//f8
    TheEnd:PWideChar;//fC
    Pat:AnsiString;//f10
    fCount:Integer;//f14
    fTextLen:Integer;//f18
    Look_At:Integer;//f1C
    PatLen:Integer;//f20
    PatLenPlus:Integer;//f24
    Shift:?;//f28
    fSensitive:Boolean;//f428
    fWhole:Boolean;//f429
    fResults:TList;//f42C
    destructor Destroy(); virtual;//00510394
    //function v0:?; virtual;//v0//0051026C
  end;
    //procedure sub_0051002C(?:?);//0051002C
    procedure sub_00510060;//00510060
    //function sub_0051009C(?:TmwEditSearch; ?:?):?;//0051009C
    //function sub_005100C4(?:TmwEditSearch):?;//005100C4
    //procedure sub_00510134(?:?; ?:?);//00510134
    //function sub_0051026C:?;//0051026C
    procedure sub_005103C4(?:TmwEditSearch);//005103C4
    //procedure sub_005103D8(?:TmwEditSearch; ?:?);//005103D8

implementation

//0050FFE4
constructor TmwEditSearch.Create;
begin
{*
 0050FFE4    push        ebx
 0050FFE5    push        esi
 0050FFE6    test        dl,dl
>0050FFE8    je          0050FFF2
 0050FFEA    add         esp,0FFFFFFF0
 0050FFED    call        @ClassCreate
 0050FFF2    mov         ebx,edx
 0050FFF4    mov         esi,eax
 0050FFF6    xor         edx,edx
 0050FFF8    mov         eax,esi
 0050FFFA    call        TObject.Create
 0050FFFF    mov         dl,1
 00510001    mov         eax,[00439644];TList
 00510006    call        TObject.Create;TList.Create
 0051000B    mov         dword ptr [esi+42C],eax;TmwEditSearch.fResults:TList
 00510011    mov         eax,esi
 00510013    test        bl,bl
>00510015    je          00510026
 00510017    call        @AfterConstruction
 0051001C    pop         dword ptr fs:[0]
 00510023    add         esp,0C
 00510026    mov         eax,esi
 00510028    pop         esi
 00510029    pop         ebx
 0051002A    ret
*}
end;

//0051002C
{*procedure sub_0051002C(?:?);
begin
 0051002C    cmp         al,byte ptr ds:[7938F8];gvar_007938F8
>00510032    je          0051005E
 00510034    mov         [007938F8],al;gvar_007938F8
 00510039    xor         ecx,ecx
 0051003B    mov         edx,7938F9;gvar_007938F9:PAnsiChar
 00510040    mov         byte ptr [edx],cl
 00510042    inc         ecx
 00510043    inc         edx
 00510044    cmp         cx,100
>00510049    jne         00510040
 0051004B    test        al,al
>0051004D    jne         0051005E
 0051004F    push        100
 00510054    push        7938F9;gvar_007938F9:PAnsiChar
 00510059    call        user32.CharLowerBuffA
 0051005E    ret
end;*}

//00510060
procedure sub_00510060;
begin
{*
 00510060    push        ebx
 00510061    push        esi
 00510062    xor         esi,esi
 00510064    mov         ebx,7939F9;gvar_007939F9
 00510069    push        esi
 0051006A    call        user32.IsCharAlphaNumericW
 0051006F    cmp         eax,1
 00510072    sbb         eax,eax
 00510074    neg         eax
 00510076    mov         byte ptr [ebx],al
 00510078    inc         esi
 00510079    inc         ebx
 0051007A    cmp         si,100
>0051007F    jne         00510069
 00510081    pop         esi
 00510082    pop         ebx
 00510083    ret
*}
end;

//0051009C
{*function sub_0051009C(?:TmwEditSearch; ?:?):?;
begin
 0051009C    push        ebx
 0051009D    push        esi
 0051009E    mov         esi,edx
 005100A0    mov         ebx,eax
 005100A2    xor         eax,eax
 005100A4    test        esi,esi
>005100A6    jl          005100C0
 005100A8    mov         edx,dword ptr [ebx+42C]
 005100AE    cmp         esi,dword ptr [edx+8]
>005100B1    jge         005100C0
 005100B3    mov         edx,esi
 005100B5    mov         eax,dword ptr [ebx+42C]
 005100BB    call        TList.Get
 005100C0    pop         esi
 005100C1    pop         ebx
 005100C2    ret
end;*}

//005100C4
{*function sub_005100C4(?:TmwEditSearch):?;
begin
 005100C4    mov         eax,dword ptr [eax+42C]
 005100CA    mov         eax,dword ptr [eax+8]
 005100CD    ret
end;*}

//005100D0
procedure TmwEditSearch.FixResults(First:Integer; Delta:Integer);
begin
{*
 005100D0    push        ebx
 005100D1    push        esi
 005100D2    push        edi
 005100D3    push        ebp
 005100D4    push        ecx
 005100D5    mov         ebp,ecx
 005100D7    mov         dword ptr [esp],edx
 005100DA    mov         esi,eax
 005100DC    test        ebp,ebp
>005100DE    je          0051012D
 005100E0    mov         eax,dword ptr [esi+42C];TmwEditSearch.fResults:TList
 005100E6    cmp         dword ptr [eax+8],0;TList.FCount:Integer
>005100EA    jle         0051012D
 005100EC    mov         eax,dword ptr [esi+42C];TmwEditSearch.fResults:TList
 005100F2    mov         ebx,dword ptr [eax+8];TList.FCount:Integer
 005100F5    dec         ebx
 005100F6    test        ebx,ebx
>005100F8    jl          0051012D
 005100FA    mov         edx,ebx
 005100FC    mov         eax,dword ptr [esi+42C];TmwEditSearch.fResults:TList
 00510102    call        TList.Get
 00510107    cmp         eax,dword ptr [esp]
>0051010A    jle         0051012D
 0051010C    mov         edx,ebx
 0051010E    mov         edi,dword ptr [esi+42C];TmwEditSearch.fResults:TList
 00510114    mov         eax,edi
 00510116    call        TList.Get
 0051011B    mov         ecx,eax
 0051011D    sub         ecx,ebp
 0051011F    mov         edx,ebx
 00510121    mov         eax,edi
 00510123    call        TList.Put
 00510128    dec         ebx
 00510129    test        ebx,ebx
>0051012B    jge         005100FA
 0051012D    pop         edx
 0051012E    pop         ebp
 0051012F    pop         edi
 00510130    pop         esi
 00510131    pop         ebx
 00510132    ret
*}
end;

//00510134
{*procedure sub_00510134(?:?; ?:?);
begin
 00510134    push        ebp
 00510135    mov         ebp,esp
 00510137    push        ecx
 00510138    push        ebx
 00510139    push        esi
 0051013A    mov         dword ptr [ebp-4],edx
 0051013D    mov         ebx,eax
 0051013F    mov         eax,dword ptr [ebp-4]
 00510142    call        @LStrAddRef
 00510147    xor         eax,eax
 00510149    push        ebp
 0051014A    push        51022D
 0051014F    push        dword ptr fs:[eax]
 00510152    mov         dword ptr fs:[eax],esp
 00510155    mov         eax,dword ptr [ebx+10]
 00510158    mov         edx,dword ptr [ebp-4]
 0051015B    call        @LStrEqual
>00510160    je          00510217
 00510166    lea         eax,[ebx+10]
 00510169    mov         edx,dword ptr [ebp-4]
 0051016C    call        @LStrAsg
 00510171    mov         eax,dword ptr [ebx+10]
 00510174    test        eax,eax
>00510176    je          0051017D
 00510178    sub         eax,4
 0051017B    mov         eax,dword ptr [eax]
 0051017D    mov         edx,eax
 0051017F    mov         dword ptr [ebx+20],edx
 00510182    test        edx,edx
>00510184    jne         0051019C
 00510186    mov         ecx,510248;'Pattern is empty'
 0051018B    mov         dl,1
 0051018D    mov         eax,[00418C04];Exception
 00510192    call        Exception.Create;Exception.Create
 00510197    call        @RaiseExcept
 0051019C    mov         eax,dword ptr [ebx+20]
 0051019F    inc         eax
 005101A0    mov         dword ptr [ebx+24],eax
 005101A3    mov         dword ptr [ebx+1C],1
 005101AA    xor         eax,eax
 005101AC    movzx       edx,al
 005101AF    mov         ecx,dword ptr [ebx+24]
 005101B2    mov         dword ptr [ebx+edx*4+28],ecx
 005101B6    inc         eax
 005101B7    test        al,al
>005101B9    jne         005101AC
 005101BB    movzx       edx,byte ptr [ebx+20]
 005101BF    test        dl,dl
>005101C1    jbe         0051020D
 005101C3    mov         al,1
 005101C5    movzx       ecx,al
 005101C8    mov         esi,dword ptr [ebx+24]
 005101CB    sub         esi,ecx
 005101CD    push        esi
 005101CE    mov         esi,dword ptr [ebx+10]
 005101D1    movzx       ecx,byte ptr [esi+ecx-1]
 005101D6    movzx       ecx,byte ptr [ecx+7938F9];gvar_007938F9:PAnsiChar
 005101DD    pop         esi
 005101DE    mov         dword ptr [ebx+ecx*4+28],esi
 005101E2    inc         eax
 005101E3    dec         dl
>005101E5    jne         005101C5
>005101E7    jmp         0051020D
 005101E9    mov         ecx,dword ptr [ebx+10]
 005101EC    movzx       ecx,byte ptr [ecx+eax-1]
 005101F1    movzx       ecx,byte ptr [ecx+7938F9];gvar_007938F9:PAnsiChar
 005101F8    sub         eax,edx
 005101FA    mov         edx,dword ptr [ebx+10]
 005101FD    movzx       eax,byte ptr [edx+eax-1]
 00510202    cmp         cl,byte ptr [eax+7938F9];gvar_007938F9:PAnsiChar
>00510208    je          00510217
 0051020A    inc         dword ptr [ebx+1C]
 0051020D    mov         eax,dword ptr [ebx+20]
 00510210    mov         edx,dword ptr [ebx+1C]
 00510213    cmp         eax,edx
>00510215    jg          005101E9
 00510217    xor         eax,eax
 00510219    pop         edx
 0051021A    pop         ecx
 0051021B    pop         ecx
 0051021C    mov         dword ptr fs:[eax],edx
 0051021F    push        510234
 00510224    lea         eax,[ebp-4]
 00510227    call        @LStrClr
 0051022C    ret
>0051022D    jmp         @HandleFinally
>00510232    jmp         00510224
 00510234    pop         esi
 00510235    pop         ebx
 00510236    pop         ecx
 00510237    pop         ebp
 00510238    ret
end;*}

//0051026C
{*function sub_0051026C:?;
begin
 0051026C    mov         edx,dword ptr [eax+20];TmwEditSearch.PatLen:Integer
 0051026F    add         edx,edx
 00510271    push        edx
 00510272    mov         edx,dword ptr [eax+4];TmwEditSearch.Run:PWideChar
 00510275    pop         ecx
 00510276    sub         edx,ecx
 00510278    cmp         edx,dword ptr [eax+8];TmwEditSearch.Origin:PWideChar
>0051027B    jb          00510289
 0051027D    movzx       edx,word ptr [edx]
 00510280    cmp         byte ptr [edx+7939F9],0;gvar_007939F9
>00510287    je          0051029E
 00510289    mov         ecx,dword ptr [eax+4];TmwEditSearch.Run:PWideChar
 0051028C    cmp         ecx,dword ptr [eax+0C];TmwEditSearch.TheEnd:PWideChar
>0051028F    jae         005102A1
 00510291    movzx       eax,word ptr [ecx+2]
 00510295    cmp         byte ptr [eax+7939F9],0;gvar_007939F9
>0051029C    jne         005102A1
 0051029E    xor         eax,eax
 005102A0    ret
 005102A1    mov         al,1
 005102A3    ret
end;*}

//005102A4
function TmwEditSearch.Next:Integer;
begin
{*
 005102A4    push        ebx
 005102A5    push        esi
 005102A6    push        edi
 005102A7    push        ebp
 005102A8    push        ecx
 005102A9    mov         ebx,eax
 005102AB    xor         eax,eax
 005102AD    mov         dword ptr [esp],eax
 005102B0    mov         eax,dword ptr [ebx+20];TmwEditSearch.PatLen:Integer
 005102B3    add         eax,eax
 005102B5    add         dword ptr [ebx+4],eax;TmwEditSearch.Run:PWideChar
>005102B8    jmp         0051037C
 005102BD    mov         eax,dword ptr [ebx+10];TmwEditSearch.Pat:AnsiString
 005102C0    mov         edx,dword ptr [ebx+20];TmwEditSearch.PatLen:Integer
 005102C3    movzx       eax,byte ptr [eax+edx-1]
 005102C8    movzx       eax,byte ptr [eax+7938F9];gvar_007938F9:PAnsiChar
 005102CF    movzx       edx,word ptr [ebp]
 005102D3    cmp         al,byte ptr [edx+7938F9];gvar_007938F9:PAnsiChar
>005102D9    je          005102F7
 005102DB    add         ebp,2
 005102DE    movzx       eax,word ptr [ebp]
 005102E2    movzx       eax,byte ptr [eax+7938F9];gvar_007938F9:PAnsiChar
 005102E9    mov         eax,dword ptr [ebx+eax*4+28]
 005102ED    add         eax,eax
 005102EF    add         dword ptr [ebx+4],eax;TmwEditSearch.Run:PWideChar
>005102F2    jmp         0051037C
 005102F7    mov         eax,dword ptr [ebx+20];TmwEditSearch.PatLen:Integer
 005102FA    add         eax,eax
 005102FC    mov         edi,ebp
 005102FE    sub         edi,eax
 00510300    add         edi,2
 00510303    mov         esi,1
>00510308    jmp         00510343
 0051030A    cmp         esi,dword ptr [ebx+20];TmwEditSearch.PatLen:Integer
>0051030D    jne         0051033F
 0051030F    movzx       eax,byte ptr [ebx+429];TmwEditSearch.fWhole:Boolean
 00510316    dec         al
>00510318    jne         00510324
 0051031A    mov         eax,ebx
 0051031C    mov         edx,dword ptr [eax]
 0051031E    call        dword ptr [edx];TmwEditSearch.sub_0051026C
 00510320    test        al,al
>00510322    je          0051035D
 00510324    inc         dword ptr [ebx+14];TmwEditSearch.fCount:Integer
 00510327    mov         eax,dword ptr [ebx+4];TmwEditSearch.Run:PWideChar
 0051032A    sub         eax,dword ptr [ebx+8]
 0051032D    sar         eax,1
>0051032F    jns         00510334
 00510331    adc         eax,0
 00510334    sub         eax,dword ptr [ebx+20]
 00510337    add         eax,2
 0051033A    mov         dword ptr [esp],eax
>0051033D    jmp         00510388
 0051033F    inc         esi
 00510340    add         edi,2
 00510343    mov         eax,dword ptr [ebx+10];TmwEditSearch.Pat:AnsiString
 00510346    movzx       eax,byte ptr [eax+esi-1]
 0051034B    movzx       eax,byte ptr [eax+7938F9];gvar_007938F9:PAnsiChar
 00510352    movzx       edx,word ptr [edi]
 00510355    cmp         al,byte ptr [edx+7938F9];gvar_007938F9:PAnsiChar
>0051035B    je          0051030A
 0051035D    mov         eax,dword ptr [ebx+1C];TmwEditSearch.Look_At:Integer
 00510360    add         eax,eax
 00510362    add         eax,dword ptr [ebx+4];TmwEditSearch.Run:PWideChar
 00510365    movzx       eax,word ptr [eax]
 00510368    movzx       eax,byte ptr [eax+7938F9];gvar_007938F9:PAnsiChar
 0051036F    mov         eax,dword ptr [ebx+eax*4+28]
 00510373    add         eax,dword ptr [ebx+1C];TmwEditSearch.Look_At:Integer
 00510376    dec         eax
 00510377    add         eax,eax
 00510379    add         dword ptr [ebx+4],eax;TmwEditSearch.Run:PWideChar
 0051037C    mov         ebp,dword ptr [ebx+4];TmwEditSearch.Run:PWideChar
 0051037F    cmp         ebp,dword ptr [ebx+0C];TmwEditSearch.TheEnd:PWideChar
>00510382    jb          005102BD
 00510388    mov         eax,dword ptr [esp]
 0051038B    pop         edx
 0051038C    pop         ebp
 0051038D    pop         edi
 0051038E    pop         esi
 0051038F    pop         ebx
 00510390    ret
*}
end;

//00510394
destructor TmwEditSearch.Destroy();
begin
{*
 00510394    push        ebx
 00510395    push        esi
 00510396    call        @BeforeDestruction
 0051039B    mov         ebx,edx
 0051039D    mov         esi,eax
 0051039F    mov         eax,dword ptr [esi+42C];TmwEditSearch.fResults:TList
 005103A5    call        TObject.Free
 005103AA    mov         edx,ebx
 005103AC    and         dl,0FC
 005103AF    mov         eax,esi
 005103B1    call        TObject.Destroy
 005103B6    test        bl,bl
>005103B8    jle         005103C1
 005103BA    mov         eax,esi
 005103BC    call        @ClassDestroy
 005103C1    pop         esi
 005103C2    pop         ebx
 005103C3    ret
*}
end;

//005103C4
procedure sub_005103C4(?:TmwEditSearch);
begin
{*
 005103C4    push        ebx
 005103C5    mov         ebx,eax
 005103C7    mov         eax,ebx
 005103C9    call        00510134
 005103CE    xor         eax,eax
 005103D0    mov         dword ptr [ebx+14],eax
 005103D3    pop         ebx
 005103D4    ret
*}
end;

//005103D8
{*procedure sub_005103D8(?:TmwEditSearch; ?:?);
begin
 005103D8    mov         byte ptr [eax+428],dl
 005103DE    mov         eax,edx
 005103E0    call        0051002C
 005103E5    ret
end;*}

//005103E8
function TmwEditSearch.FindAll(NewText:string):Integer;
begin
{*
 005103E8    push        ebx
 005103E9    push        esi
 005103EA    mov         ebx,edx
 005103EC    mov         esi,eax
 005103EE    xor         edx,edx
 005103F0    mov         eax,dword ptr [esi+42C];TmwEditSearch.fResults:TList
 005103F6    call        TList.SetCount
 005103FB    mov         edx,ebx
 005103FD    mov         eax,esi
 005103FF    call        TmwEditSearch.FindFirst
 00510404    mov         ebx,eax
 00510406    test        ebx,ebx
>00510408    jle         00510424
 0051040A    mov         edx,ebx
 0051040C    mov         eax,dword ptr [esi+42C];TmwEditSearch.fResults:TList
 00510412    call        TList.Add
 00510417    mov         eax,esi
 00510419    call        TmwEditSearch.Next
 0051041E    mov         ebx,eax
 00510420    test        ebx,ebx
>00510422    jg          0051040A
 00510424    mov         eax,dword ptr [esi+42C];TmwEditSearch.fResults:TList
 0051042A    mov         eax,dword ptr [eax+8];TList.FCount:Integer
 0051042D    pop         esi
 0051042E    pop         ebx
 0051042F    ret
*}
end;

//00510430
function TmwEditSearch.FindFirst(NewText:string):Integer;
begin
{*
 00510430    push        ebx
 00510431    push        esi
 00510432    push        edi
 00510433    mov         esi,edx
 00510435    mov         ebx,eax
 00510437    xor         edi,edi
 00510439    mov         eax,esi
 0051043B    test        eax,eax
>0051043D    je          00510444
 0051043F    sub         eax,4
 00510442    mov         eax,dword ptr [eax]
 00510444    mov         edx,eax
 00510446    mov         dword ptr [ebx+18],edx;TmwEditSearch.fTextLen:Integer
 00510449    cmp         edx,dword ptr [ebx+20];TmwEditSearch.PatLen:Integer
>0051044C    jl          00510476
 0051044E    mov         eax,esi
 00510450    call        @UStrToPWChar
 00510455    mov         edi,eax
 00510457    mov         dword ptr [ebx+8],edi;TmwEditSearch.Origin:PWideChar
 0051045A    mov         eax,dword ptr [ebx+18];TmwEditSearch.fTextLen:Integer
 0051045D    add         eax,eax
 0051045F    add         eax,edi
 00510461    mov         dword ptr [ebx+0C],eax;TmwEditSearch.TheEnd:PWideChar
 00510464    mov         eax,dword ptr [ebx+8];TmwEditSearch.Origin:PWideChar
 00510467    sub         eax,2
 0051046A    mov         dword ptr [ebx+4],eax;TmwEditSearch.Run:PWideChar
 0051046D    mov         eax,ebx
 0051046F    call        TmwEditSearch.Next
 00510474    mov         edi,eax
 00510476    mov         eax,edi
 00510478    pop         edi
 00510479    pop         esi
 0051047A    pop         ebx
 0051047B    ret
*}
end;

Initialization
//00780D98
{*
 00780D98    sub         dword ptr ds:[7938F4],1
>00780D9F    jae         00780DB4
 00780DA1    mov         byte ptr ds:[7938F8],1;gvar_007938F8
 00780DA8    xor         eax,eax
 00780DAA    call        0051002C
 00780DAF    call        00510060
 00780DB4    ret
*}
Finalization
end.