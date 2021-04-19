//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit39;

interface

uses
  SysUtils, Classes, mwExport, mwCustomEdit, Controls, DwmApi, System, mwSupportClasses, mwHighlighter;

type
  TmwSelectedColor = class(TPersistent)
  published
    constructor Create;//005118B4
  public
    fBG:TColor;//f4
    fFG:TColor;//f8
    fOnChange:TNotifyEvent;//f10
    f12:word;//f12
    f14:TmwCustomEdit;//f14
    procedure SetBackground(Value:TColor);//005118F8
    procedure SetForeground(Value:TColor);//00511914
  end;
  TmwGutter = class(TPersistent)
  published
    //procedure FormatLineNumber(Line:Integer; ?:?);//00511AE0
    function RealGutterWidth(CharWidth:Integer):Integer;//00511B44
    procedure AutoSizeDigitCount(LinesCount:Integer);//00511A40
    constructor Create;//00511930
    procedure Assign(Source:TPersistent);//00511990
  public
    fColor:TColor;//f4
    fWidth:Integer;//f8
    fShowLineNumbers:Boolean;//fC
    fDigitCount:Integer;//f10
    fLeadingZeros:Boolean;//f14
    fZeroStart:Boolean;//f15
    fLeftOffset:Integer;//f18
    fRightOffset:Integer;//f1C
    fOnChange:TNotifyEvent;//f20
    f22:word;//f22
    f24:TmwCustomEdit;//f24
    fCursor:TCursor;//f28
    fVisible:Boolean;//f2A
    fUseFontStyle:Boolean;//f2B
    fAutoSize:Boolean;//f2C
    fAutoSizeDigitCount:Integer;//f30
    procedure Assign(Source:TPersistent); virtual;//v8//00511990
    procedure SetAutoSize(Value:Boolean);//00511B6C
    procedure SetColor(Value:TColor);//00511B88
    procedure SetDigitCount(Value:Integer);//00511BA4
    procedure SetLeadingZeros(Value:Boolean);//00511BD8
    procedure SetLeftOffset(Value:Integer);//00511BF4
    procedure SetRightOffset(Value:Integer);//00511C1C
    procedure SetShowLineNumbers(Value:Boolean);//00511C44
    procedure SetUseFontStyle(Value:Boolean);//00511C60
    procedure SetVisible(Value:Boolean);//00511C7C
    procedure SetWidth(Value:Integer);//00511C98
    procedure SetZeroStart(Value:Boolean);//00511CC0
  end;
  TmwBookMarkOpt = class(TPersistent)
  published
    constructor Create(AOwner:TComponent);//00511CDC
  public
    fBookmarkImages:TImageList;//f4
    fEnableKeys:Boolean;//f8
    fGlyphsVisible:Boolean;//f9
    fLeftMargin:Integer;//fC
    fOwner:TComponent;//f10
    fXoffset:Integer;//f14
    fOnChange:TNotifyEvent;//f18
    f1A:word;//f1A
    f1C:TmwCustomEdit;//f1C
    procedure SetBookmarkImages(Value:TImageList);//00511D30
    procedure SetGlyphsVisible(Value:Boolean);//00511D5C
    procedure SetLeftMargin(Value:Integer);//00511D78
    procedure SetXoffset(Value:Integer);//00511D94
  end;
  EmwMethodChain = class(Exception)
  end;
  TmwExceptionEvent = procedure(Sender:TObject; E:Exception; var DoContinue:Boolean) of object;;
  TmwMethodChain = class(TObject)
  published
    procedure Remove(AEvent:TMethod);//00512158
    procedure Fire;//005120A8
    procedure Add(AEvent:TMethod);//00511DB0
    constructor sub_00511EC0;//00511EC0
    destructor Destroy();//00511F04
  public
    FNotifyProcs:TList;//f4
    FExceptionHandler:TmwExceptionEvent;//f8
    fA:word;//fA
    fC:dword;//fC
    destructor Destroy(); virtual;//00511F04
    procedure v0; virtual; abstract;//v0//00404A58
    //function v4(?:?):?; virtual;//v4//00511F34
    constructor v8; virtual;//v8//00511EC0
  end;
  TmwNotifyEventChain = class(TmwMethodChain)
  published
    procedure Remove(AEvent:TNotifyEvent);//005122FC
    procedure Add(AEvent:TNotifyEvent);//00512294
    constructor Create(ASender:TObject);//005122A4
  public
    ....FSender:TObject;//f10
    //procedure v0(?:?); virtual;//v0//005122E0
  end;
  TmwInternalImage = class(TObject)
  published
    procedure DrawMark(ACanvas:TCanvas; Number:Integer; LineHeight:Integer; Y:Integer; X:Integer);//005123FC
    destructor Destroy();//005123B4
    constructor Create(Name:string; Count:Integer);//0051230C
  end;
  TBetterRegistry = class(TRegistry)
  end;
  TmwHighLightAttributes = class(TPersistent)
  published
    function LoadFromRegistry(Reg:TBetterRegistry):Boolean;//00514308
    function SaveToRegistry(Reg:TBetterRegistry):Boolean;//0051446C
    function LoadFromBorlandRegistry(rootKey:HKEY; attrKey:string; oldStyle:Boolean; attrName:string):Boolean;//0051421C
    procedure Assign(Source:TPersistent);//00513814
    constructor Create(attribName:string);//00513898
  public
    fBackground:TColor;//f4
    fForeground:TColor;//f8
    fStyle:TFontStyles;//fC
    fOnChange:TNotifyEvent;//f10
    f12:word;//f12
    f14:dword;//f14
    fName:string;//f18
    procedure Assign(Source:TPersistent); virtual;//v8//00513814
    function LoadFromBorlandRegistry(rootKey:HKEY; attrKey:string; oldStyle:Boolean; attrName:string):Boolean; virtual;//vC//0051421C
    procedure SetBackground(Value:TColor);//005142A4
    procedure SetForeground(Value:TColor);//005142C0
    procedure SetStyle(Value:TFontStyles);//005142DC
  end;
  TIdentChars = set of AnsiChar;
  THighlighterCapabilities = (hcUserSettings, hcRegistry, hcExportable);
  THighlighterCapability = set of THighlighterCapabilities;
  TTokenEvent = procedure(Sender:TObject; TokenKind:Integer; TokenText:string; LineNo:Integer) of object;;
  TmwCustomHighLighter = class(TComponent)
  published
    procedure SetLineForExport(NewValue:string);//00513488
    procedure SetRange(Value:Pointer);//00513490
    procedure ReSetRange;//00513498
    procedure NextToEol;//0051476C
    procedure ScanAllLineTokens(Value:string; LineNumber:Integer);//00514788
    procedure SetLine(NewValue:string; LineNumber:Integer);//00513480
    function SaveToRegistry(RootKey:HKEY; Key:string):Boolean;//00514908
    //procedure HookAttrChangeEvent(ANotifyEvent:TNotifyEvent; ?:?);//00514B38
    //procedure UnhookAttrChangeEvent(ANotifyEvent:TNotifyEvent; ?:?);//00514B50
    function UseUserSettings(settingIndex:Integer):Boolean;//00514734
    procedure EnumUserSettings(settings:TStrings);//00514728
    function LoadFromRegistry(RootKey:HKEY; Key:string):Boolean;//00514824
    destructor Destroy();//005146CC
    procedure ExportNext;//00513440
    procedure GetEol;//00513448
    function GetCapability:THighlighterCapability;//00514A88
    //procedure GetLanguageName(?:?);//00514A94
    constructor Create(AOwner:TComponent);//00514654
    procedure GetTokenKind;//00513468
    procedure GetTokenPos;//00513470
    procedure Next;//00513478
    procedure GetRange;//00513450
    procedure GetToken;//00513458
    procedure GetTokenAttribute;//00513460
  public
    fAttributes:TStringList;//f34
    fAttrChangeHooks:TmwNotifyEventChain;//f38
    fOnToken:TTokenEvent;//f40
    f42:word;//f42
    f44:dword;//f44
    fExporter:TComponent;//f48
    fDefaultFilter:string;//f4C
    destructor Destroy(); virtual;//005146CC
    constructor Create(AOwner:TComponent); virtual;//v2C//00514654
    //procedure v34(?:?); virtual;//v34//00514738
    procedure v38; virtual;//v38//00514A10
    //function v3C(?:?):?; virtual;//v3C//00514A1C
    procedure GetDefaultAttribute; virtual; abstract;//v40//00404A58
    //procedure GetDefaultFilter(?:?); virtual;//v44//00514AC8
    procedure SetDefaultFilter(Value:string); virtual;//v48//00514ADC
    function GetCapability:THighlighterCapability; virtual;//v4C//00514A88
    //procedure GetLanguageName(?:?); virtual;//v50//00514A94
    procedure ExportNext; virtual; abstract;//v54//00404A58
    procedure GetEol; virtual; abstract;//v58//00404A58
    procedure GetRange; virtual; abstract;//v5C//00404A58
    procedure GetToken; virtual; abstract;//v60//00404A58
    procedure GetTokenAttribute; virtual; abstract;//v64//00404A58
    procedure GetTokenKind; virtual; abstract;//v68//00404A58
    procedure GetTokenPos; virtual; abstract;//v6C//00404A58
    procedure Next; virtual; abstract;//v70//00404A58
    procedure SetLine; virtual; abstract;//v74//00404A58
    procedure SetLineForExport; virtual; abstract;//v78//00404A58
    procedure SetRange; virtual; abstract;//v7C//00404A58
    procedure ReSetRange; virtual; abstract;//v80//00404A58
    function UseUserSettings(settingIndex:Integer):Boolean; virtual;//v84//00514734
    procedure EnumUserSettings(settings:TStrings); virtual;//v88//00514728
    function LoadFromRegistry(RootKey:HKEY; Key:string):Boolean; virtual;//v8C//00514824
    function SaveToRegistry(RootKey:HKEY; Key:string):Boolean; virtual;//v90//00514908
  end;
  THighlighterList = class(TList)
  published
    function FindByName(name:string):Integer;//00513740
    function FindByClass(comp:TComponent):Integer;//005136F4
    function Count:Integer;//00513678
    constructor Create;//00513680
    destructor Destroy();//005136C4
  public
    ........hlList:TList;//f10
    destructor Destroy(); virtual;//005136C4
  end;
    //function sub_00510484(?:?; ?:Integer):?;//00510484
    //function sub_0051048C(?:TPoint; ?:TPoint):?;//0051048C
    //function sub_00510494(?:Integer; ?:?; ?:Integer):?;//00510494
    //procedure sub_005104A4(?:?; ?:?);//005104A4
    //function sub_005104B0(?:?; ?:?):?;//005104B0
    procedure sub_005104E0;//005104E0
    //function sub_005104F4(?:?; ?:?):?;//005104F4
    //procedure sub_0051051C(?:?; ?:?; ?:?);//0051051C
    //procedure sub_00510560(?:?; ?:?; ?:?);//00510560
    //procedure sub_00510650(?:?; ?:?; ?:?);//00510650
    //function sub_00510730(?:?):Boolean;//00510730
    //function sub_0051074C(?:?):?;//0051074C
    //function sub_00510774(?:?; ?:?; ?:?):?;//00510774
    //function sub_005107C8(?:?; ?:?; ?:?):?;//005107C8
    //function sub_00510818(?:PChar):?;//00510818
    //function sub_00511F34(?:?):?;//00511F34
    //procedure sub_005122E0(?:?);//005122E0
    //function sub_005137D8(?:THighlighterList; ?:?):?;//005137D8
    procedure sub_005137EC(?:TmwCarlSampleSyn);//005137EC
    //procedure sub_0051392C(?:?; ?:?);//0051392C
    //function sub_005139A4(?:HKEY; ?:string; ?:string; ?:?):?;//005139A4
    //function sub_00513C84(?:?):?;//00513C84
    //function sub_00513D2C(?:HKEY; ?:string; ?:string; ?:?):?;//00513D2C
    //function sub_00514594(?:TmwHighLightAttributes):?;//00514594
    procedure sub_005145C4(?:TmwHighLightAttributes; ?:Integer);//005145C4
    //procedure sub_00514738(?:?);//00514738
    procedure sub_005149F0(?:TmwCarlSampleSyn; ?:TmwHighLightAttributes);//005149F0
    procedure sub_00514A10;//00514A10
    //function sub_00514A1C(?:?):?;//00514A1C
    //procedure sub_00514A48(?:TmwCarlSampleSyn; ?:?; ?:?);//00514A48
    //procedure GetDefaultFilter(?:?);//00514AC8
    procedure SetDefaultFilter(Value:string);//00514ADC

implementation

//00510484
{*function sub_00510484(?:?; ?:Integer):?;
begin
 00510484    cmp         edx,eax
>00510486    jl          0051048A
 00510488    mov         eax,edx
 0051048A    ret
end;*}

//0051048C
{*function sub_0051048C(?:TPoint; ?:TPoint):?;
begin
 0051048C    cmp         edx,eax
>0051048E    jg          00510492
 00510490    mov         eax,edx
 00510492    ret
end;*}

//00510494
{*function sub_00510494(?:Integer; ?:?; ?:Integer):?;
begin
 00510494    cmp         edx,eax
>00510496    jle         0051049B
 00510498    mov         eax,edx
 0051049A    ret
 0051049B    cmp         ecx,eax
>0051049D    jge         005104A1
 0051049F    mov         eax,ecx
 005104A1    ret
end;*}

//005104A4
{*procedure sub_005104A4(?:?; ?:?);
begin
 005104A4    push        ebx
 005104A5    mov         ecx,dword ptr [edx]
 005104A7    mov         ebx,dword ptr [eax]
 005104A9    mov         dword ptr [edx],ebx
 005104AB    mov         dword ptr [eax],ecx
 005104AD    pop         ebx
 005104AE    ret
end;*}

//005104B0
{*function sub_005104B0(?:?; ?:?):?;
begin
 005104B0    push        ebx
 005104B1    push        esi
 005104B2    mov         esi,edx
 005104B4    mov         ebx,eax
 005104B6    mov         eax,ebx
 005104B8    add         eax,eax
 005104BA    add         eax,eax
 005104BC    call        AllocMem
 005104C1    mov         edx,eax
 005104C3    test        edx,edx
>005104C5    je          005104DB
 005104C7    test        esi,esi
>005104C9    je          005104DB
 005104CB    mov         eax,edx
 005104CD    test        ebx,ebx
>005104CF    jbe         005104DB
 005104D1    mov         dword ptr [eax],esi
 005104D3    add         eax,4
 005104D6    dec         ebx
 005104D7    test        ebx,ebx
>005104D9    ja          005104D1
 005104DB    mov         eax,edx
 005104DD    pop         esi
 005104DE    pop         ebx
 005104DF    ret
end;*}

//005104E0
procedure sub_005104E0;
begin
{*
 005104E0    push        0
 005104E2    push        0
 005104E4    push        0
 005104E6    push        edx
 005104E7    push        2
 005104E9    push        0
 005104EB    push        0
 005104ED    push        eax
 005104EE    call        gdi32.ExtTextOutW
 005104F3    ret
*}
end;

//005104F4
{*function sub_005104F4(?:?; ?:?):?;
begin
 005104F4    xor         ecx,ecx
 005104F6    mov         dword ptr [edx],ecx
 005104F8    test        eax,eax
>005104FA    je          00510519
>005104FC    jmp         00510509
 005104FE    cmp         cx,9
>00510502    je          00510511
 00510504    inc         dword ptr [edx]
 00510506    add         eax,2
 00510509    movzx       ecx,word ptr [eax]
 0051050C    test        cx,cx
>0051050F    jne         005104FE
 00510511    cmp         word ptr [eax],9
 00510515    sete        al
 00510518    ret
 00510519    xor         eax,eax
 0051051B    ret
end;*}

//0051051C
{*procedure sub_0051051C(?:?; ?:?; ?:?);
begin
 0051051C    push        ebx
 0051051D    push        esi
 0051051E    push        ecx
 0051051F    mov         esi,ecx
 00510521    mov         ebx,eax
 00510523    mov         eax,esi
 00510525    mov         edx,ebx
 00510527    call        @UStrAsg
 0051052C    mov         edx,esp
 0051052E    mov         eax,ebx
 00510530    call        005104F4
 00510535    test        al,al
>00510537    je          0051055A
 00510539    mov         eax,esi
 0051053B    call        @UniqueStringU
 00510540    mov         edx,dword ptr [esp]
 00510543    lea         eax,[eax+edx*2]
 00510546    cmp         word ptr [eax],9
>0051054A    jne         00510551
 0051054C    mov         word ptr [eax],20
 00510551    add         eax,2
 00510554    cmp         word ptr [eax],0
>00510558    jne         00510546
 0051055A    pop         edx
 0051055B    pop         esi
 0051055C    pop         ebx
 0051055D    ret
end;*}

//00510560
{*procedure sub_00510560(?:?; ?:?; ?:?);
begin
 00510560    push        ebx
 00510561    push        esi
 00510562    push        edi
 00510563    push        ebp
 00510564    add         esp,0FFFFFFF4
 00510567    mov         dword ptr [esp],ecx
 0051056A    mov         edi,edx
 0051056C    mov         ebp,eax
 0051056E    mov         eax,dword ptr [esp]
 00510571    mov         edx,ebp
 00510573    call        @UStrAsg
 00510578    lea         edx,[esp+4]
 0051057C    mov         eax,ebp
 0051057E    call        005104F4
 00510583    test        al,al
>00510585    je          00510646
 0051058B    mov         eax,dword ptr [esp+4]
 0051058F    inc         eax
 00510590    lea         ebx,[ebp+eax*2-2]
 00510594    xor         esi,esi
 00510596    mov         eax,edi
 00510598    dec         eax
 00510599    xor         eax,7FFFFFFF
 0051059E    mov         dword ptr [esp+8],eax
 005105A2    cmp         word ptr [ebx],9
>005105A6    jne         005105B9
 005105A8    mov         eax,dword ptr [esp+4]
 005105AC    add         eax,edi
 005105AE    and         eax,dword ptr [esp+8]
 005105B2    mov         dword ptr [esp+4],eax
 005105B6    inc         esi
>005105B7    jmp         005105BD
 005105B9    inc         dword ptr [esp+4]
 005105BD    add         ebx,2
 005105C0    cmp         word ptr [ebx],0
>005105C4    jne         005105A2
 005105C6    mov         eax,dword ptr [esp]
 005105C9    mov         edx,dword ptr [esp+4]
 005105CD    call        @UStrSetLength
 005105D2    xor         eax,eax
 005105D4    mov         dword ptr [esp+4],eax
 005105D8    mov         eax,ebp
 005105DA    call        @UStrToPWChar
 005105DF    mov         ebx,eax
 005105E1    mov         eax,dword ptr [esp]
 005105E4    mov         eax,dword ptr [eax]
 005105E6    call        @UStrToPWChar
 005105EB    mov         edx,edi
 005105ED    dec         edx
 005105EE    mov         dword ptr [esp+8],edx
 005105F2    movzx       edx,word ptr [ebx]
 005105F5    cmp         dx,9
>005105F9    jne         00510633
 005105FB    mov         edx,dword ptr [esp+4]
 005105FF    and         edx,dword ptr [esp+8]
 00510603    push        edx
 00510604    mov         edx,edi
 00510606    pop         ecx
 00510607    sub         edx,ecx
 00510609    add         dword ptr [esp+4],edx
 0051060D    mov         word ptr [eax],20
 00510612    add         eax,2
 00510615    dec         edx
 00510616    test        edx,edx
>00510618    jne         0051060D
 0051061A    dec         esi
 0051061B    test        esi,esi
>0051061D    jne         0051063D
 0051061F    add         ebx,2
 00510622    movzx       edx,word ptr [ebx]
 00510625    mov         word ptr [eax],dx
 00510628    add         eax,2
 0051062B    cmp         word ptr [ebx],0
>0051062F    jne         0051061F
>00510631    jmp         00510646
 00510633    mov         word ptr [eax],dx
 00510636    add         eax,2
 00510639    inc         dword ptr [esp+4]
 0051063D    add         ebx,2
 00510640    cmp         word ptr [ebx],0
>00510644    jne         005105F2
 00510646    add         esp,0C
 00510649    pop         ebp
 0051064A    pop         edi
 0051064B    pop         esi
 0051064C    pop         ebx
 0051064D    ret
end;*}

//00510650
{*procedure sub_00510650(?:?; ?:?; ?:?);
begin
 00510650    push        ebx
 00510651    push        esi
 00510652    push        edi
 00510653    push        ebp
 00510654    add         esp,0FFFFFFF8
 00510657    mov         dword ptr [esp],ecx
 0051065A    mov         esi,edx
 0051065C    mov         ebp,eax
 0051065E    mov         eax,dword ptr [esp]
 00510661    mov         edx,ebp
 00510663    call        @UStrAsg
 00510668    lea         edx,[esp+4]
 0051066C    mov         eax,ebp
 0051066E    call        005104F4
 00510673    test        al,al
>00510675    je          00510727
 0051067B    mov         eax,dword ptr [esp+4]
 0051067F    inc         eax
 00510680    lea         ebx,[ebp+eax*2-2]
 00510684    xor         edi,edi
 00510686    cmp         word ptr [ebx],9
>0051068A    jne         005106A2
 0051068C    mov         eax,dword ptr [esp+4]
 00510690    cdq
 00510691    idiv        eax,esi
 00510693    mov         eax,dword ptr [esp+4]
 00510697    add         eax,esi
 00510699    sub         eax,edx
 0051069B    mov         dword ptr [esp+4],eax
 0051069F    inc         edi
>005106A0    jmp         005106A6
 005106A2    inc         dword ptr [esp+4]
 005106A6    add         ebx,2
 005106A9    cmp         word ptr [ebx],0
>005106AD    jne         00510686
 005106AF    mov         eax,dword ptr [esp]
 005106B2    mov         edx,dword ptr [esp+4]
 005106B6    call        @UStrSetLength
 005106BB    xor         eax,eax
 005106BD    mov         dword ptr [esp+4],eax
 005106C1    mov         eax,ebp
 005106C3    call        @UStrToPWChar
 005106C8    mov         ebx,eax
 005106CA    mov         eax,dword ptr [esp]
 005106CD    mov         eax,dword ptr [eax]
 005106CF    call        @UStrToPWChar
 005106D4    mov         ecx,eax
 005106D6    movzx       eax,word ptr [ebx]
 005106D9    cmp         ax,9
>005106DD    jne         00510714
 005106DF    mov         eax,dword ptr [esp+4]
 005106E3    cdq
 005106E4    idiv        eax,esi
 005106E6    mov         eax,esi
 005106E8    sub         eax,edx
 005106EA    add         dword ptr [esp+4],eax
 005106EE    mov         word ptr [ecx],20
 005106F3    add         ecx,2
 005106F6    dec         eax
 005106F7    test        eax,eax
>005106F9    jne         005106EE
 005106FB    dec         edi
 005106FC    test        edi,edi
>005106FE    jne         0051071E
 00510700    add         ebx,2
 00510703    movzx       eax,word ptr [ebx]
 00510706    mov         word ptr [ecx],ax
 00510709    add         ecx,2
 0051070C    cmp         word ptr [ebx],0
>00510710    jne         00510700
>00510712    jmp         00510727
 00510714    mov         word ptr [ecx],ax
 00510717    add         ecx,2
 0051071A    inc         dword ptr [esp+4]
 0051071E    add         ebx,2
 00510721    cmp         word ptr [ebx],0
>00510725    jne         005106D6
 00510727    pop         ecx
 00510728    pop         edx
 00510729    pop         ebp
 0051072A    pop         edi
 0051072B    pop         esi
 0051072C    pop         ebx
 0051072D    ret
end;*}

//00510730
{*function sub_00510730(?:?):Boolean;
begin
 00510730    mov         edx,2
 00510735    cmp         eax,edx
>00510737    jle         00510743
 00510739    add         edx,edx
 0051073B    cmp         edx,10000
>00510741    jl          00510735
 00510743    cmp         eax,edx
 00510745    sete        al
 00510748    ret
end;*}

//0051074C
{*function sub_0051074C(?:?):?;
begin
 0051074C    push        ebx
 0051074D    mov         ebx,eax
 0051074F    cmp         ebx,2
>00510752    jge         0051075B
 00510754    mov         eax,51051C;sub_0051051C
 00510759    pop         ebx
 0051075A    ret
 0051075B    mov         eax,ebx
 0051075D    call        00510730
 00510762    test        al,al
>00510764    je          0051076D
 00510766    mov         eax,510560;sub_00510560
>0051076B    jmp         00510772
 0051076D    mov         eax,510650;sub_00510650
 00510772    pop         ebx
 00510773    ret
end;*}

//00510774
{*function sub_00510774(?:?; ?:?; ?:?):?;
begin
 00510774    push        esi
 00510775    push        edi
 00510776    add         esp,0FFFFFFE0
 00510779    mov         esi,ecx
 0051077B    lea         edi,[esp]
 0051077E    mov         ecx,8
 00510783    rep movs    dword ptr [edi],dword ptr [esi]
 00510785    test        edx,edx
>00510787    jle         005107BD
 00510789    mov         ecx,eax
 0051078B    test        ecx,ecx
>0051078D    je          00510794
 0051078F    sub         ecx,4
 00510792    mov         ecx,dword ptr [ecx]
 00510794    cmp         ecx,edx
>00510796    jl          005107BD
 00510798    lea         eax,[eax+edx*2-2]
 0051079C    movzx       ecx,word ptr [eax]
 0051079F    cmp         cx,0FF
>005107A4    ja          005107AD
 005107A6    movzx       ecx,cx
 005107A9    bt          dword ptr [esp],ecx
>005107AD    jae         005107B3
 005107AF    mov         eax,edx
>005107B1    jmp         005107BF
 005107B3    add         eax,2
 005107B6    inc         edx
 005107B7    cmp         word ptr [eax],0
>005107BB    jne         0051079C
 005107BD    xor         eax,eax
 005107BF    add         esp,20
 005107C2    pop         edi
 005107C3    pop         esi
 005107C4    ret
end;*}

//005107C8
{*function sub_005107C8(?:?; ?:?; ?:?):?;
begin
 005107C8    push        esi
 005107C9    push        edi
 005107CA    add         esp,0FFFFFFE0
 005107CD    mov         esi,ecx
 005107CF    lea         edi,[esp]
 005107D2    mov         ecx,8
 005107D7    rep movs    dword ptr [edi],dword ptr [esi]
 005107D9    test        edx,edx
>005107DB    jle         00510810
 005107DD    mov         ecx,eax
 005107DF    test        ecx,ecx
>005107E1    je          005107E8
 005107E3    sub         ecx,4
 005107E6    mov         ecx,dword ptr [ecx]
 005107E8    cmp         ecx,edx
>005107EA    jl          00510810
 005107EC    lea         eax,[eax+edx*2-2]
 005107F0    movzx       ecx,word ptr [eax]
 005107F3    cmp         cx,0FF
>005107F8    ja          00510801
 005107FA    movzx       ecx,cx
 005107FD    bt          dword ptr [esp],ecx
>00510801    jae         00510807
 00510803    mov         eax,edx
>00510805    jmp         00510812
 00510807    sub         eax,2
 0051080A    dec         edx
 0051080B    cmp         edx,1
>0051080E    jge         005107F0
 00510810    xor         eax,eax
 00510812    add         esp,20
 00510815    pop         edi
 00510816    pop         esi
 00510817    ret
end;*}

//00510818
{*function sub_00510818(?:PChar):?;
begin
 00510818    push        ebx
 00510819    mov         ebx,eax
 0051081B    test        ebx,ebx
>0051081D    je          00510835
>0051081F    jmp         00510824
 00510821    add         ebx,2
 00510824    mov         edx,51083C
 00510829    movzx       eax,word ptr [ebx]
 0051082C    call        CharInSet
 00510831    test        al,al
>00510833    je          00510821
 00510835    mov         eax,ebx
 00510837    pop         ebx
 00510838    ret
end;*}

//005118B4
constructor TmwSelectedColor.Create;
begin
{*
 005118B4    push        ebx
 005118B5    push        esi
 005118B6    test        dl,dl
>005118B8    je          005118C2
 005118BA    add         esp,0FFFFFFF0
 005118BD    call        @ClassCreate
 005118C2    mov         ebx,edx
 005118C4    mov         esi,eax
 005118C6    xor         edx,edx
 005118C8    mov         eax,esi
 005118CA    call        TObject.Create
 005118CF    mov         dword ptr [esi+4],0FF00000D;TmwSelectedColor.fBG:TColor
 005118D6    mov         dword ptr [esi+8],0FF00000E;TmwSelectedColor.fFG:TColor
 005118DD    mov         eax,esi
 005118DF    test        bl,bl
>005118E1    je          005118F2
 005118E3    call        @AfterConstruction
 005118E8    pop         dword ptr fs:[0]
 005118EF    add         esp,0C
 005118F2    mov         eax,esi
 005118F4    pop         esi
 005118F5    pop         ebx
 005118F6    ret
*}
end;

//005118F8
procedure TmwSelectedColor.SetBackground(Value:TColor);
begin
{*
 005118F8    push        ebx
 005118F9    cmp         edx,dword ptr [eax+4];TmwSelectedColor.fBG:TColor
>005118FC    je          00511912
 005118FE    mov         dword ptr [eax+4],edx;TmwSelectedColor.fBG:TColor
 00511901    cmp         word ptr [eax+12],0;TmwSelectedColor.?f12:word
>00511906    je          00511912
 00511908    mov         ebx,eax
 0051190A    mov         edx,eax
 0051190C    mov         eax,dword ptr [ebx+14];TmwSelectedColor.?f14:TmwCustomEdit
 0051190F    call        dword ptr [ebx+10];TmwSelectedColor.fOnChange
 00511912    pop         ebx
 00511913    ret
*}
end;

//00511914
procedure TmwSelectedColor.SetForeground(Value:TColor);
begin
{*
 00511914    push        ebx
 00511915    cmp         edx,dword ptr [eax+8];TmwSelectedColor.fFG:TColor
>00511918    je          0051192E
 0051191A    mov         dword ptr [eax+8],edx;TmwSelectedColor.fFG:TColor
 0051191D    cmp         word ptr [eax+12],0;TmwSelectedColor.?f12:word
>00511922    je          0051192E
 00511924    mov         ebx,eax
 00511926    mov         edx,eax
 00511928    mov         eax,dword ptr [ebx+14];TmwSelectedColor.?f14:TmwCustomEdit
 0051192B    call        dword ptr [ebx+10];TmwSelectedColor.fOnChange
 0051192E    pop         ebx
 0051192F    ret
*}
end;

//00511930
constructor TmwGutter.Create;
begin
{*
 00511930    push        ebx
 00511931    push        esi
 00511932    test        dl,dl
>00511934    je          0051193E
 00511936    add         esp,0FFFFFFF0
 00511939    call        @ClassCreate
 0051193E    mov         ebx,edx
 00511940    mov         esi,eax
 00511942    xor         edx,edx
 00511944    mov         eax,esi
 00511946    call        TObject.Create
 0051194B    mov         dword ptr [esi+4],0FF00000F;TmwGutter.fColor:TColor
 00511952    mov         byte ptr [esi+2A],1;TmwGutter.fVisible:Boolean
 00511956    mov         dword ptr [esi+8],1E;TmwGutter.fWidth:Integer
 0051195D    mov         dword ptr [esi+18],10;TmwGutter.fLeftOffset:Integer
 00511964    mov         eax,4
 00511969    mov         dword ptr [esi+10],eax;TmwGutter.fDigitCount:Integer
 0051196C    mov         dword ptr [esi+30],eax;TmwGutter.fAutoSizeDigitCount:Integer
 0051196F    mov         dword ptr [esi+1C],2;TmwGutter.fRightOffset:Integer
 00511976    mov         eax,esi
 00511978    test        bl,bl
>0051197A    je          0051198B
 0051197C    call        @AfterConstruction
 00511981    pop         dword ptr fs:[0]
 00511988    add         esp,0C
 0051198B    mov         eax,esi
 0051198D    pop         esi
 0051198E    pop         ebx
 0051198F    ret
*}
end;

//00511990
procedure TmwGutter.Assign(Source:TPersistent);
begin
{*
 00511990    push        ebp
 00511991    mov         ebp,esp
 00511993    push        ecx
 00511994    push        ebx
 00511995    mov         dword ptr [ebp-4],edx
 00511998    mov         ebx,eax
 0051199A    cmp         dword ptr [ebp-4],0
>0051199E    je          00511A2F
 005119A4    mov         eax,dword ptr [ebp-4]
 005119A7    mov         edx,dword ptr ds:[5109FC];TmwGutter
 005119AD    call        @IsClass
 005119B2    test        al,al
>005119B4    je          00511A2F
 005119B6    mov         eax,dword ptr [ebp-4]
 005119B9    mov         eax,dword ptr [eax+4]
 005119BC    mov         dword ptr [ebx+4],eax;TmwGutter.fColor:TColor
 005119BF    mov         eax,dword ptr [ebp-4]
 005119C2    movzx       eax,byte ptr [eax+2A]
 005119C6    mov         byte ptr [ebx+2A],al;TmwGutter.fVisible:Boolean
 005119C9    mov         eax,dword ptr [ebp-4]
 005119CC    mov         eax,dword ptr [eax+8]
 005119CF    mov         dword ptr [ebx+8],eax;TmwGutter.fWidth:Integer
 005119D2    mov         eax,dword ptr [ebp-4]
 005119D5    movzx       eax,byte ptr [eax+0C]
 005119D9    mov         byte ptr [ebx+0C],al;TmwGutter.fShowLineNumbers:Boolean
 005119DC    mov         eax,dword ptr [ebp-4]
 005119DF    movzx       eax,byte ptr [eax+14]
 005119E3    mov         byte ptr [ebx+14],al;TmwGutter.fLeadingZeros:Boolean
 005119E6    mov         eax,dword ptr [ebp-4]
 005119E9    movzx       eax,byte ptr [eax+15]
 005119ED    mov         byte ptr [ebx+15],al;TmwGutter.fZeroStart:Boolean
 005119F0    mov         eax,dword ptr [ebp-4]
 005119F3    mov         eax,dword ptr [eax+18]
 005119F6    mov         dword ptr [ebx+18],eax;TmwGutter.fLeftOffset:Integer
 005119F9    mov         eax,dword ptr [ebp-4]
 005119FC    mov         eax,dword ptr [eax+10]
 005119FF    mov         dword ptr [ebx+10],eax;TmwGutter.fDigitCount:Integer
 00511A02    mov         eax,dword ptr [ebp-4]
 00511A05    mov         eax,dword ptr [eax+1C]
 00511A08    mov         dword ptr [ebx+1C],eax;TmwGutter.fRightOffset:Integer
 00511A0B    mov         eax,dword ptr [ebp-4]
 00511A0E    movzx       eax,byte ptr [eax+2C]
 00511A12    mov         byte ptr [ebx+2C],al;TmwGutter.fAutoSize:Boolean
 00511A15    mov         eax,dword ptr [ebp-4]
 00511A18    mov         eax,dword ptr [eax+30]
 00511A1B    mov         dword ptr [ebx+30],eax;TmwGutter.fAutoSizeDigitCount:Integer
 00511A1E    cmp         word ptr [ebx+22],0;TmwGutter.?f22:word
>00511A23    je          00511A39
 00511A25    mov         edx,ebx
 00511A27    mov         eax,dword ptr [ebx+24];TmwGutter.?f24:TmwCustomEdit
 00511A2A    call        dword ptr [ebx+20];TmwGutter.fOnChange
>00511A2D    jmp         00511A39
 00511A2F    mov         edx,dword ptr [ebp-4]
 00511A32    mov         eax,ebx
 00511A34    call        TPersistent.Assign
 00511A39    pop         ebx
 00511A3A    pop         ecx
 00511A3B    pop         ebp
 00511A3C    ret
*}
end;

//00511A40
procedure TmwGutter.AutoSizeDigitCount(LinesCount:Integer);
begin
{*
 00511A40    push        ebp
 00511A41    mov         ebp,esp
 00511A43    add         esp,0FFFFFFF8
 00511A46    push        ebx
 00511A47    push        esi
 00511A48    xor         ecx,ecx
 00511A4A    mov         dword ptr [ebp-4],ecx
 00511A4D    mov         esi,edx
 00511A4F    mov         ebx,eax
 00511A51    xor         eax,eax
 00511A53    push        ebp
 00511A54    push        511AD1
 00511A59    push        dword ptr fs:[eax]
 00511A5C    mov         dword ptr fs:[eax],esp
 00511A5F    cmp         byte ptr [ebx+2A],0;TmwGutter.fVisible:Boolean
>00511A63    je          00511AB5
 00511A65    cmp         byte ptr [ebx+2C],0;TmwGutter.fAutoSize:Boolean
>00511A69    je          00511AB5
 00511A6B    cmp         byte ptr [ebx+0C],0;TmwGutter.fShowLineNumbers:Boolean
>00511A6F    je          00511AB5
 00511A71    cmp         byte ptr [ebx+15],0;TmwGutter.fZeroStart:Boolean
>00511A75    je          00511A78
 00511A77    dec         esi
 00511A78    lea         edx,[ebp-4]
 00511A7B    mov         eax,esi
 00511A7D    call        IntToStr
 00511A82    mov         eax,dword ptr [ebp-4]
 00511A85    mov         dword ptr [ebp-8],eax
 00511A88    mov         eax,dword ptr [ebp-8]
 00511A8B    test        eax,eax
>00511A8D    je          00511A94
 00511A8F    sub         eax,4
 00511A92    mov         eax,dword ptr [eax]
 00511A94    mov         edx,dword ptr [ebx+10];TmwGutter.fDigitCount:Integer
 00511A97    call        00510484
 00511A9C    cmp         eax,dword ptr [ebx+30];TmwGutter.fAutoSizeDigitCount:Integer
>00511A9F    je          00511ABB
 00511AA1    mov         dword ptr [ebx+30],eax;TmwGutter.fAutoSizeDigitCount:Integer
 00511AA4    cmp         word ptr [ebx+22],0;TmwGutter.?f22:word
>00511AA9    je          00511ABB
 00511AAB    mov         edx,ebx
 00511AAD    mov         eax,dword ptr [ebx+24];TmwGutter.?f24:TmwCustomEdit
 00511AB0    call        dword ptr [ebx+20];TmwGutter.fOnChange
>00511AB3    jmp         00511ABB
 00511AB5    mov         eax,dword ptr [ebx+10];TmwGutter.fDigitCount:Integer
 00511AB8    mov         dword ptr [ebx+30],eax;TmwGutter.fAutoSizeDigitCount:Integer
 00511ABB    xor         eax,eax
 00511ABD    pop         edx
 00511ABE    pop         ecx
 00511ABF    pop         ecx
 00511AC0    mov         dword ptr fs:[eax],edx
 00511AC3    push        511AD8
 00511AC8    lea         eax,[ebp-4]
 00511ACB    call        @UStrClr
 00511AD0    ret
>00511AD1    jmp         @HandleFinally
>00511AD6    jmp         00511AC8
 00511AD8    pop         esi
 00511AD9    pop         ebx
 00511ADA    pop         ecx
 00511ADB    pop         ecx
 00511ADC    pop         ebp
 00511ADD    ret
*}
end;

//00511AE0
{*procedure TmwGutter.FormatLineNumber(Line:Integer; ?:?);
begin
 00511AE0    push        ebx
 00511AE1    push        esi
 00511AE2    push        edi
 00511AE3    add         esp,0FFFFFF00
 00511AE9    mov         edi,ecx
 00511AEB    mov         esi,edx
 00511AED    mov         ebx,eax
 00511AEF    cmp         byte ptr [ebx+15],0;TmwGutter.fZeroStart:Boolean
>00511AF3    je          00511AF6
 00511AF5    dec         esi
 00511AF6    mov         ecx,esp
 00511AF8    mov         edx,dword ptr [ebx+30];TmwGutter.fAutoSizeDigitCount:Integer
 00511AFB    mov         eax,esi
 00511AFD    call        @StrLong
 00511B02    mov         eax,edi
 00511B04    mov         edx,esp
 00511B06    call        @UStrFromString
 00511B0B    cmp         byte ptr [ebx+14],0;TmwGutter.fLeadingZeros:Boolean
>00511B0F    je          00511B3A
 00511B11    mov         esi,dword ptr [ebx+30];TmwGutter.fAutoSizeDigitCount:Integer
 00511B14    dec         esi
 00511B15    test        esi,esi
>00511B17    jle         00511B3A
 00511B19    mov         ebx,1
 00511B1E    mov         eax,dword ptr [edi]
 00511B20    cmp         word ptr [eax+ebx*2-2],20
>00511B26    jne         00511B3A
 00511B28    mov         eax,edi
 00511B2A    call        @UniqueStringU
 00511B2F    mov         word ptr [eax+ebx*2-2],30
 00511B36    inc         ebx
 00511B37    dec         esi
>00511B38    jne         00511B1E
 00511B3A    add         esp,100
 00511B40    pop         edi
 00511B41    pop         esi
 00511B42    pop         ebx
 00511B43    ret
end;*}

//00511B44
function TmwGutter.RealGutterWidth(CharWidth:Integer):Integer;
begin
{*
 00511B44    cmp         byte ptr [eax+2A],0;TmwGutter.fVisible:Boolean
>00511B48    jne         00511B4D
 00511B4A    xor         eax,eax
 00511B4C    ret
 00511B4D    cmp         byte ptr [eax+0C],0;TmwGutter.fShowLineNumbers:Boolean
>00511B51    je          00511B67
 00511B53    mov         ecx,dword ptr [eax+18];TmwGutter.fLeftOffset:Integer
 00511B56    add         ecx,dword ptr [eax+1C];TmwGutter.fRightOffset:Integer
 00511B59    mov         eax,dword ptr [eax+30];TmwGutter.fAutoSizeDigitCount:Integer
 00511B5C    imul        edx
 00511B5E    add         ecx,eax
 00511B60    add         ecx,2
 00511B63    mov         eax,ecx
>00511B65    jmp         00511B6A
 00511B67    mov         eax,dword ptr [eax+8];TmwGutter.fWidth:Integer
 00511B6A    ret
*}
end;

//00511B6C
procedure TmwGutter.SetAutoSize(Value:Boolean);
begin
{*
 00511B6C    push        ebx
 00511B6D    cmp         dl,byte ptr [eax+2C];TmwGutter.fAutoSize:Boolean
>00511B70    je          00511B86
 00511B72    mov         byte ptr [eax+2C],dl;TmwGutter.fAutoSize:Boolean
 00511B75    cmp         word ptr [eax+22],0;TmwGutter.?f22:word
>00511B7A    je          00511B86
 00511B7C    mov         ebx,eax
 00511B7E    mov         edx,eax
 00511B80    mov         eax,dword ptr [ebx+24];TmwGutter.?f24:TmwCustomEdit
 00511B83    call        dword ptr [ebx+20];TmwGutter.fOnChange
 00511B86    pop         ebx
 00511B87    ret
*}
end;

//00511B88
procedure TmwGutter.SetColor(Value:TColor);
begin
{*
 00511B88    push        ebx
 00511B89    cmp         edx,dword ptr [eax+4];TmwGutter.fColor:TColor
>00511B8C    je          00511BA2
 00511B8E    mov         dword ptr [eax+4],edx;TmwGutter.fColor:TColor
 00511B91    cmp         word ptr [eax+22],0;TmwGutter.?f22:word
>00511B96    je          00511BA2
 00511B98    mov         ebx,eax
 00511B9A    mov         edx,eax
 00511B9C    mov         eax,dword ptr [ebx+24];TmwGutter.?f24:TmwCustomEdit
 00511B9F    call        dword ptr [ebx+20];TmwGutter.fOnChange
 00511BA2    pop         ebx
 00511BA3    ret
*}
end;

//00511BA4
procedure TmwGutter.SetDigitCount(Value:Integer);
begin
{*
 00511BA4    push        ebx
 00511BA5    mov         ebx,eax
 00511BA7    mov         ecx,0C
 00511BAC    mov         eax,edx
 00511BAE    mov         edx,2
 00511BB3    call        00510494
 00511BB8    mov         edx,eax
 00511BBA    cmp         edx,dword ptr [ebx+10];TmwGutter.fDigitCount:Integer
>00511BBD    je          00511BD6
 00511BBF    mov         eax,edx
 00511BC1    mov         dword ptr [ebx+10],eax;TmwGutter.fDigitCount:Integer
 00511BC4    mov         dword ptr [ebx+30],eax;TmwGutter.fAutoSizeDigitCount:Integer
 00511BC7    cmp         word ptr [ebx+22],0;TmwGutter.?f22:word
>00511BCC    je          00511BD6
 00511BCE    mov         edx,ebx
 00511BD0    mov         eax,dword ptr [ebx+24];TmwGutter.?f24:TmwCustomEdit
 00511BD3    call        dword ptr [ebx+20];TmwGutter.fOnChange
 00511BD6    pop         ebx
 00511BD7    ret
*}
end;

//00511BD8
procedure TmwGutter.SetLeadingZeros(Value:Boolean);
begin
{*
 00511BD8    push        ebx
 00511BD9    cmp         dl,byte ptr [eax+14];TmwGutter.fLeadingZeros:Boolean
>00511BDC    je          00511BF2
 00511BDE    mov         byte ptr [eax+14],dl;TmwGutter.fLeadingZeros:Boolean
 00511BE1    cmp         word ptr [eax+22],0;TmwGutter.?f22:word
>00511BE6    je          00511BF2
 00511BE8    mov         ebx,eax
 00511BEA    mov         edx,eax
 00511BEC    mov         eax,dword ptr [ebx+24];TmwGutter.?f24:TmwCustomEdit
 00511BEF    call        dword ptr [ebx+20];TmwGutter.fOnChange
 00511BF2    pop         ebx
 00511BF3    ret
*}
end;

//00511BF4
procedure TmwGutter.SetLeftOffset(Value:Integer);
begin
{*
 00511BF4    push        ebx
 00511BF5    mov         ebx,eax
 00511BF7    xor         eax,eax
 00511BF9    call        00510484
 00511BFE    mov         edx,eax
 00511C00    cmp         edx,dword ptr [ebx+18];TmwGutter.fLeftOffset:Integer
>00511C03    je          00511C17
 00511C05    mov         dword ptr [ebx+18],edx;TmwGutter.fLeftOffset:Integer
 00511C08    cmp         word ptr [ebx+22],0;TmwGutter.?f22:word
>00511C0D    je          00511C17
 00511C0F    mov         edx,ebx
 00511C11    mov         eax,dword ptr [ebx+24];TmwGutter.?f24:TmwCustomEdit
 00511C14    call        dword ptr [ebx+20];TmwGutter.fOnChange
 00511C17    pop         ebx
 00511C18    ret
*}
end;

//00511C1C
procedure TmwGutter.SetRightOffset(Value:Integer);
begin
{*
 00511C1C    push        ebx
 00511C1D    mov         ebx,eax
 00511C1F    xor         eax,eax
 00511C21    call        00510484
 00511C26    mov         edx,eax
 00511C28    cmp         edx,dword ptr [ebx+1C];TmwGutter.fRightOffset:Integer
>00511C2B    je          00511C3F
 00511C2D    mov         dword ptr [ebx+1C],edx;TmwGutter.fRightOffset:Integer
 00511C30    cmp         word ptr [ebx+22],0;TmwGutter.?f22:word
>00511C35    je          00511C3F
 00511C37    mov         edx,ebx
 00511C39    mov         eax,dword ptr [ebx+24];TmwGutter.?f24:TmwCustomEdit
 00511C3C    call        dword ptr [ebx+20];TmwGutter.fOnChange
 00511C3F    pop         ebx
 00511C40    ret
*}
end;

//00511C44
procedure TmwGutter.SetShowLineNumbers(Value:Boolean);
begin
{*
 00511C44    push        ebx
 00511C45    cmp         dl,byte ptr [eax+0C];TmwGutter.fShowLineNumbers:Boolean
>00511C48    je          00511C5E
 00511C4A    mov         byte ptr [eax+0C],dl;TmwGutter.fShowLineNumbers:Boolean
 00511C4D    cmp         word ptr [eax+22],0;TmwGutter.?f22:word
>00511C52    je          00511C5E
 00511C54    mov         ebx,eax
 00511C56    mov         edx,eax
 00511C58    mov         eax,dword ptr [ebx+24];TmwGutter.?f24:TmwCustomEdit
 00511C5B    call        dword ptr [ebx+20];TmwGutter.fOnChange
 00511C5E    pop         ebx
 00511C5F    ret
*}
end;

//00511C60
procedure TmwGutter.SetUseFontStyle(Value:Boolean);
begin
{*
 00511C60    push        ebx
 00511C61    cmp         dl,byte ptr [eax+2B];TmwGutter.fUseFontStyle:Boolean
>00511C64    je          00511C7A
 00511C66    mov         byte ptr [eax+2B],dl;TmwGutter.fUseFontStyle:Boolean
 00511C69    cmp         word ptr [eax+22],0;TmwGutter.?f22:word
>00511C6E    je          00511C7A
 00511C70    mov         ebx,eax
 00511C72    mov         edx,eax
 00511C74    mov         eax,dword ptr [ebx+24];TmwGutter.?f24:TmwCustomEdit
 00511C77    call        dword ptr [ebx+20];TmwGutter.fOnChange
 00511C7A    pop         ebx
 00511C7B    ret
*}
end;

//00511C7C
procedure TmwGutter.SetVisible(Value:Boolean);
begin
{*
 00511C7C    push        ebx
 00511C7D    cmp         dl,byte ptr [eax+2A];TmwGutter.fVisible:Boolean
>00511C80    je          00511C96
 00511C82    mov         byte ptr [eax+2A],dl;TmwGutter.fVisible:Boolean
 00511C85    cmp         word ptr [eax+22],0;TmwGutter.?f22:word
>00511C8A    je          00511C96
 00511C8C    mov         ebx,eax
 00511C8E    mov         edx,eax
 00511C90    mov         eax,dword ptr [ebx+24];TmwGutter.?f24:TmwCustomEdit
 00511C93    call        dword ptr [ebx+20];TmwGutter.fOnChange
 00511C96    pop         ebx
 00511C97    ret
*}
end;

//00511C98
procedure TmwGutter.SetWidth(Value:Integer);
begin
{*
 00511C98    push        ebx
 00511C99    mov         ebx,eax
 00511C9B    xor         eax,eax
 00511C9D    call        00510484
 00511CA2    mov         edx,eax
 00511CA4    cmp         edx,dword ptr [ebx+8];TmwGutter.fWidth:Integer
>00511CA7    je          00511CBB
 00511CA9    mov         dword ptr [ebx+8],edx;TmwGutter.fWidth:Integer
 00511CAC    cmp         word ptr [ebx+22],0;TmwGutter.?f22:word
>00511CB1    je          00511CBB
 00511CB3    mov         edx,ebx
 00511CB5    mov         eax,dword ptr [ebx+24];TmwGutter.?f24:TmwCustomEdit
 00511CB8    call        dword ptr [ebx+20];TmwGutter.fOnChange
 00511CBB    pop         ebx
 00511CBC    ret
*}
end;

//00511CC0
procedure TmwGutter.SetZeroStart(Value:Boolean);
begin
{*
 00511CC0    push        ebx
 00511CC1    cmp         dl,byte ptr [eax+15];TmwGutter.fZeroStart:Boolean
>00511CC4    je          00511CDA
 00511CC6    mov         byte ptr [eax+15],dl;TmwGutter.fZeroStart:Boolean
 00511CC9    cmp         word ptr [eax+22],0;TmwGutter.?f22:word
>00511CCE    je          00511CDA
 00511CD0    mov         ebx,eax
 00511CD2    mov         edx,eax
 00511CD4    mov         eax,dword ptr [ebx+24];TmwGutter.?f24:TmwCustomEdit
 00511CD7    call        dword ptr [ebx+20];TmwGutter.fOnChange
 00511CDA    pop         ebx
 00511CDB    ret
*}
end;

//00511CDC
constructor TmwBookMarkOpt.Create(AOwner:TComponent);
begin
{*
 00511CDC    push        ebx
 00511CDD    push        esi
 00511CDE    push        edi
 00511CDF    test        dl,dl
>00511CE1    je          00511CEB
 00511CE3    add         esp,0FFFFFFF0
 00511CE6    call        @ClassCreate
 00511CEB    mov         esi,ecx
 00511CED    mov         ebx,edx
 00511CEF    mov         edi,eax
 00511CF1    xor         edx,edx
 00511CF3    mov         eax,edi
 00511CF5    call        TObject.Create
 00511CFA    mov         byte ptr [edi+8],1;TmwBookMarkOpt.fEnableKeys:Boolean
 00511CFE    mov         byte ptr [edi+9],1;TmwBookMarkOpt.fGlyphsVisible:Boolean
 00511D02    mov         dword ptr [edi+0C],2;TmwBookMarkOpt.fLeftMargin:Integer
 00511D09    mov         dword ptr [edi+10],esi;TmwBookMarkOpt.fOwner:TComponent
 00511D0C    mov         dword ptr [edi+14],0C;TmwBookMarkOpt.fXoffset:Integer
 00511D13    mov         eax,edi
 00511D15    test        bl,bl
>00511D17    je          00511D28
 00511D19    call        @AfterConstruction
 00511D1E    pop         dword ptr fs:[0]
 00511D25    add         esp,0C
 00511D28    mov         eax,edi
 00511D2A    pop         edi
 00511D2B    pop         esi
 00511D2C    pop         ebx
 00511D2D    ret
*}
end;

//00511D30
procedure TmwBookMarkOpt.SetBookmarkImages(Value:TImageList);
begin
{*
 00511D30    push        ebx
 00511D31    mov         ebx,eax
 00511D33    cmp         edx,dword ptr [ebx+4];TmwBookMarkOpt.fBookmarkImages:TImageList
>00511D36    je          00511D58
 00511D38    mov         eax,edx
 00511D3A    mov         dword ptr [ebx+4],eax;TmwBookMarkOpt.fBookmarkImages:TImageList
 00511D3D    test        eax,eax
>00511D3F    je          00511D49
 00511D41    mov         edx,dword ptr [ebx+10];TmwBookMarkOpt.fOwner:TComponent
 00511D44    call        TComponent.FreeNotification
 00511D49    cmp         word ptr [ebx+1A],0;TmwBookMarkOpt.?f1A:word
>00511D4E    je          00511D58
 00511D50    mov         edx,ebx
 00511D52    mov         eax,dword ptr [ebx+1C];TmwBookMarkOpt.?f1C:TmwCustomEdit
 00511D55    call        dword ptr [ebx+18];TmwBookMarkOpt.fOnChange
 00511D58    pop         ebx
 00511D59    ret
*}
end;

//00511D5C
procedure TmwBookMarkOpt.SetGlyphsVisible(Value:Boolean);
begin
{*
 00511D5C    push        ebx
 00511D5D    cmp         dl,byte ptr [eax+9];TmwBookMarkOpt.fGlyphsVisible:Boolean
>00511D60    je          00511D76
 00511D62    mov         byte ptr [eax+9],dl;TmwBookMarkOpt.fGlyphsVisible:Boolean
 00511D65    cmp         word ptr [eax+1A],0;TmwBookMarkOpt.?f1A:word
>00511D6A    je          00511D76
 00511D6C    mov         ebx,eax
 00511D6E    mov         edx,eax
 00511D70    mov         eax,dword ptr [ebx+1C];TmwBookMarkOpt.?f1C:TmwCustomEdit
 00511D73    call        dword ptr [ebx+18];TmwBookMarkOpt.fOnChange
 00511D76    pop         ebx
 00511D77    ret
*}
end;

//00511D78
procedure TmwBookMarkOpt.SetLeftMargin(Value:Integer);
begin
{*
 00511D78    push        ebx
 00511D79    cmp         edx,dword ptr [eax+0C];TmwBookMarkOpt.fLeftMargin:Integer
>00511D7C    je          00511D92
 00511D7E    mov         dword ptr [eax+0C],edx;TmwBookMarkOpt.fLeftMargin:Integer
 00511D81    cmp         word ptr [eax+1A],0;TmwBookMarkOpt.?f1A:word
>00511D86    je          00511D92
 00511D88    mov         ebx,eax
 00511D8A    mov         edx,eax
 00511D8C    mov         eax,dword ptr [ebx+1C];TmwBookMarkOpt.?f1C:TmwCustomEdit
 00511D8F    call        dword ptr [ebx+18];TmwBookMarkOpt.fOnChange
 00511D92    pop         ebx
 00511D93    ret
*}
end;

//00511D94
procedure TmwBookMarkOpt.SetXoffset(Value:Integer);
begin
{*
 00511D94    push        ebx
 00511D95    cmp         edx,dword ptr [eax+14];TmwBookMarkOpt.fXoffset:Integer
>00511D98    je          00511DAE
 00511D9A    mov         dword ptr [eax+14],edx;TmwBookMarkOpt.fXoffset:Integer
 00511D9D    cmp         word ptr [eax+1A],0;TmwBookMarkOpt.?f1A:word
>00511DA2    je          00511DAE
 00511DA4    mov         ebx,eax
 00511DA6    mov         edx,eax
 00511DA8    mov         eax,dword ptr [ebx+1C];TmwBookMarkOpt.?f1C:TmwCustomEdit
 00511DAB    call        dword ptr [ebx+18];TmwBookMarkOpt.fOnChange
 00511DAE    pop         ebx
 00511DAF    ret
*}
end;

//00511DB0
procedure TmwMethodChain.Add(AEvent:TMethod);
begin
{*
 00511DB0    push        ebp
 00511DB1    mov         ebp,esp
 00511DB3    add         esp,0FFFFFFEC
 00511DB6    push        ebx
 00511DB7    push        esi
 00511DB8    push        edi
 00511DB9    xor         ecx,ecx
 00511DBB    mov         dword ptr [ebp-14],ecx
 00511DBE    mov         esi,edx
 00511DC0    lea         edi,[ebp-8]
 00511DC3    movs        dword ptr [edi],dword ptr [esi]
 00511DC4    movs        dword ptr [edi],dword ptr [esi]
 00511DC5    mov         ebx,eax
 00511DC7    xor         eax,eax
 00511DC9    push        ebp
 00511DCA    push        511E39
 00511DCF    push        dword ptr fs:[eax]
 00511DD2    mov         dword ptr fs:[eax],esp
 00511DD5    lea         eax,[ebp-8]
 00511DD8    test        eax,eax
>00511DDA    jne         00511E0C
 00511DDC    lea         edx,[ebp-14]
 00511DDF    mov         eax,dword ptr [ebx]
 00511DE1    call        TObject.ClassName
 00511DE6    mov         eax,dword ptr [ebp-14]
 00511DE9    mov         dword ptr [ebp-10],eax
 00511DEC    mov         byte ptr [ebp-0C],11
 00511DF0    lea         eax,[ebp-10]
 00511DF3    push        eax
 00511DF4    push        0
 00511DF6    mov         ecx,511E54;'%s.Entry : the parameter `AEvent'' must be specified.'
 00511DFB    mov         dl,1
 00511DFD    mov         eax,[00511208];EmwMethodChain
 00511E02    call        Exception.CreateFmt;EmwMethodChain.Create
 00511E07    call        @RaiseExcept
 00511E0C    mov         ebx,dword ptr [ebx+4];TmwMethodChain.FNotifyProcs:TList
 00511E0F    mov         edx,dword ptr [ebp-8]
 00511E12    mov         eax,ebx
 00511E14    call        TList.Add
 00511E19    mov         edx,dword ptr [ebp-4]
 00511E1C    mov         eax,ebx
 00511E1E    call        TList.Add
 00511E23    xor         eax,eax
 00511E25    pop         edx
 00511E26    pop         ecx
 00511E27    pop         ecx
 00511E28    mov         dword ptr fs:[eax],edx
 00511E2B    push        511E40
 00511E30    lea         eax,[ebp-14]
 00511E33    call        @UStrClr
 00511E38    ret
>00511E39    jmp         @HandleFinally
>00511E3E    jmp         00511E30
 00511E40    pop         edi
 00511E41    pop         esi
 00511E42    pop         ebx
 00511E43    mov         esp,ebp
 00511E45    pop         ebp
 00511E46    ret
*}
end;

//00511EC0
constructor sub_00511EC0;
begin
{*
 00511EC0    push        ebx
 00511EC1    push        esi
 00511EC2    test        dl,dl
>00511EC4    je          00511ECE
 00511EC6    add         esp,0FFFFFFF0
 00511EC9    call        @ClassCreate
 00511ECE    mov         ebx,edx
 00511ED0    mov         esi,eax
 00511ED2    xor         edx,edx
 00511ED4    mov         eax,esi
 00511ED6    call        TObject.Create
 00511EDB    mov         dl,1
 00511EDD    mov         eax,[00439644];TList
 00511EE2    call        TObject.Create;TList.Create
 00511EE7    mov         dword ptr [esi+4],eax;TmwMethodChain.FNotifyProcs:TList
 00511EEA    mov         eax,esi
 00511EEC    test        bl,bl
>00511EEE    je          00511EFF
 00511EF0    call        @AfterConstruction
 00511EF5    pop         dword ptr fs:[0]
 00511EFC    add         esp,0C
 00511EFF    mov         eax,esi
 00511F01    pop         esi
 00511F02    pop         ebx
 00511F03    ret
*}
end;

//00511F04
destructor TmwMethodChain.Destroy();
begin
{*
 00511F04    push        ebx
 00511F05    push        esi
 00511F06    call        @BeforeDestruction
 00511F0B    mov         ebx,edx
 00511F0D    mov         esi,eax
 00511F0F    mov         eax,dword ptr [esi+4];TmwMethodChain.FNotifyProcs:TList
 00511F12    call        TObject.Free
 00511F17    mov         edx,ebx
 00511F19    and         dl,0FC
 00511F1C    mov         eax,esi
 00511F1E    call        TObject.Destroy
 00511F23    test        bl,bl
>00511F25    jle         00511F2E
 00511F27    mov         eax,esi
 00511F29    call        @ClassDestroy
 00511F2E    pop         esi
 00511F2F    pop         ebx
 00511F30    ret
*}
end;

//00511F34
{*function sub_00511F34(?:?):?;
begin
 00511F34    push        ebp
 00511F35    mov         ebp,esp
 00511F37    add         esp,0FFFFFFEC
 00511F3A    push        ebx
 00511F3B    push        esi
 00511F3C    push        edi
 00511F3D    xor         ecx,ecx
 00511F3F    mov         dword ptr [ebp-14],ecx
 00511F42    mov         dword ptr [ebp-4],eax
 00511F45    xor         eax,eax
 00511F47    push        ebp
 00511F48    push        511FE7
 00511F4D    push        dword ptr fs:[eax]
 00511F50    mov         dword ptr fs:[eax],esp
 00511F53    mov         eax,dword ptr [ebp-4]
 00511F56    cmp         word ptr [eax+0A],0;TmwMethodChain.?fA:word
>00511F5B    jne         00511F66
 00511F5D    mov         eax,edx
 00511F5F    call        @RaiseExcept
>00511F64    jmp         00511FD1
 00511F66    xor         eax,eax
 00511F68    push        ebp
 00511F69    push        511F94
 00511F6E    push        dword ptr fs:[eax]
 00511F71    mov         dword ptr fs:[eax],esp
 00511F74    mov         byte ptr [ebp-5],1
 00511F78    lea         eax,[ebp-5]
 00511F7B    push        eax
 00511F7C    mov         ebx,dword ptr [ebp-4]
 00511F7F    mov         ecx,edx
 00511F81    mov         edx,dword ptr [ebp-4]
 00511F84    mov         eax,dword ptr [ebx+0C];TmwMethodChain.?fC:dword
 00511F87    call        dword ptr [ebx+8];TmwMethodChain.FExceptionHandler
 00511F8A    xor         eax,eax
 00511F8C    pop         edx
 00511F8D    pop         ecx
 00511F8E    pop         ecx
 00511F8F    mov         dword ptr fs:[eax],edx
>00511F92    jmp         00511FD1
>00511F94    jmp         @HandleAnyException
 00511F99    lea         edx,[ebp-14]
 00511F9C    mov         eax,dword ptr [ebp-4]
 00511F9F    mov         eax,dword ptr [eax]
 00511FA1    call        TObject.ClassName
 00511FA6    mov         eax,dword ptr [ebp-14]
 00511FA9    mov         dword ptr [ebp-10],eax
 00511FAC    mov         byte ptr [ebp-0C],11
 00511FB0    lea         eax,[ebp-10]
 00511FB3    push        eax
 00511FB4    push        0
 00511FB6    mov         ecx,512008;'%s.DoHandleException : MUST NOT occur any kind of exception in ExceptionHand...
 00511FBB    mov         dl,1
 00511FBD    mov         eax,[00511208];EmwMethodChain
 00511FC2    call        Exception.CreateFmt;EmwMethodChain.Create
 00511FC7    call        @RaiseExcept
 00511FCC    call        @DoneExcept
 00511FD1    xor         eax,eax
 00511FD3    pop         edx
 00511FD4    pop         ecx
 00511FD5    pop         ecx
 00511FD6    mov         dword ptr fs:[eax],edx
 00511FD9    push        511FEE
 00511FDE    lea         eax,[ebp-14]
 00511FE1    call        @UStrClr
 00511FE6    ret
>00511FE7    jmp         @HandleFinally
>00511FEC    jmp         00511FDE
 00511FEE    movzx       eax,byte ptr [ebp-5]
 00511FF2    pop         edi
 00511FF3    pop         esi
 00511FF4    pop         ebx
 00511FF5    mov         esp,ebp
 00511FF7    pop         ebp
 00511FF8    ret
end;*}

//005120A8
procedure TmwMethodChain.Fire;
begin
{*
 005120A8    push        ebp
 005120A9    mov         ebp,esp
 005120AB    add         esp,0FFFFFFEC
 005120AE    push        ebx
 005120AF    push        esi
 005120B0    push        edi
 005120B1    mov         dword ptr [ebp-4],eax
 005120B4    xor         eax,eax
 005120B6    mov         dword ptr [ebp-10],eax
 005120B9    mov         eax,dword ptr [ebp-4]
 005120BC    mov         eax,dword ptr [eax+4];TmwMethodChain.FNotifyProcs:TList
 005120BF    mov         dword ptr [ebp-14],eax
>005120C2    jmp         00512140
 005120C4    xor         eax,eax
 005120C6    push        ebp
 005120C7    push        512113
 005120CC    push        dword ptr fs:[eax]
 005120CF    mov         dword ptr fs:[eax],esp
 005120D2    mov         edx,dword ptr [ebp-10]
 005120D5    mov         eax,dword ptr [ebp-14]
 005120D8    call        TList.Get
 005120DD    mov         dword ptr [ebp-0C],eax
 005120E0    inc         dword ptr [ebp-10]
 005120E3    mov         edx,dword ptr [ebp-10]
 005120E6    mov         eax,dword ptr [ebp-14]
 005120E9    call        TList.Get
 005120EE    mov         dword ptr [ebp-8],eax
 005120F1    inc         dword ptr [ebp-10]
 005120F4    lea         edx,[ebp-0C]
 005120F7    mov         eax,dword ptr [ebp-4]
 005120FA    mov         ecx,dword ptr [eax]
 005120FC    call        dword ptr [ecx];@AbstractError
 005120FE    mov         eax,dword ptr [ebp-14]
 00512101    mov         eax,dword ptr [eax+8];TList.FCount:Integer
 00512104    cmp         eax,dword ptr [ebp-10]
>00512107    jg          005120D2
 00512109    xor         eax,eax
 0051210B    pop         edx
 0051210C    pop         ecx
 0051210D    pop         ecx
 0051210E    mov         dword ptr fs:[eax],edx
>00512111    jmp         00512140
>00512113    jmp         @HandleOnException
 00512118    dd          1
 0051211C    dd          00418C04;Exception
 00512120    dd          00512124
 00512124    mov         ebx,eax
 00512126    mov         edx,ebx
 00512128    mov         eax,dword ptr [ebp-4]
 0051212B    mov         ecx,dword ptr [eax]
 0051212D    call        dword ptr [ecx+4];TmwMethodChain.sub_00511F34
 00512130    test        al,al
>00512132    jne         0051213B
 00512134    mov         dword ptr [ebp-10],7FFFFFFF
 0051213B    call        @DoneExcept
 00512140    mov         eax,dword ptr [ebp-14]
 00512143    mov         eax,dword ptr [eax+8];TList.FCount:Integer
 00512146    cmp         eax,dword ptr [ebp-10]
>00512149    jg          005120C4
 0051214F    pop         edi
 00512150    pop         esi
 00512151    pop         ebx
 00512152    mov         esp,ebp
 00512154    pop         ebp
 00512155    ret
*}
end;

//00512158
procedure TmwMethodChain.Remove(AEvent:TMethod);
begin
{*
 00512158    push        ebp
 00512159    mov         ebp,esp
 0051215B    add         esp,0FFFFFFEC
 0051215E    push        ebx
 0051215F    push        esi
 00512160    push        edi
 00512161    xor         ecx,ecx
 00512163    mov         dword ptr [ebp-14],ecx
 00512166    mov         esi,edx
 00512168    lea         edi,[ebp-8]
 0051216B    movs        dword ptr [edi],dword ptr [esi]
 0051216C    movs        dword ptr [edi],dword ptr [esi]
 0051216D    mov         ebx,eax
 0051216F    xor         eax,eax
 00512171    push        ebp
 00512172    push        51220E
 00512177    push        dword ptr fs:[eax]
 0051217A    mov         dword ptr fs:[eax],esp
 0051217D    lea         eax,[ebp-8]
 00512180    test        eax,eax
>00512182    jne         005121B4
 00512184    lea         edx,[ebp-14]
 00512187    mov         eax,dword ptr [ebx]
 00512189    call        TObject.ClassName
 0051218E    mov         eax,dword ptr [ebp-14]
 00512191    mov         dword ptr [ebp-10],eax
 00512194    mov         byte ptr [ebp-0C],11
 00512198    lea         eax,[ebp-10]
 0051219B    push        eax
 0051219C    push        0
 0051219E    mov         ecx,512228;'%s.Remove: the parameter `AEvent'' must be specified.'
 005121A3    mov         dl,1
 005121A5    mov         eax,[00511208];EmwMethodChain
 005121AA    call        Exception.CreateFmt;EmwMethodChain.Create
 005121AF    call        @RaiseExcept
 005121B4    mov         esi,dword ptr [ebx+4];TmwMethodChain.FNotifyProcs:TList
 005121B7    mov         ebx,dword ptr [esi+8];TList.FCount:Integer
 005121BA    dec         ebx
 005121BB    test        ebx,ebx
>005121BD    jle         005121F8
 005121BF    mov         edx,ebx
 005121C1    mov         eax,esi
 005121C3    call        TList.Get
 005121C8    cmp         eax,dword ptr [ebp-4]
>005121CB    je          005121D2
 005121CD    sub         ebx,2
>005121D0    jmp         005121F4
 005121D2    dec         ebx
 005121D3    mov         edx,ebx
 005121D5    mov         eax,esi
 005121D7    call        TList.Get
 005121DC    cmp         eax,dword ptr [ebp-8]
>005121DF    jne         005121F3
 005121E1    mov         edx,ebx
 005121E3    mov         eax,esi
 005121E5    call        TList.Delete
 005121EA    mov         edx,ebx
 005121EC    mov         eax,esi
 005121EE    call        TList.Delete
 005121F3    dec         ebx
 005121F4    test        ebx,ebx
>005121F6    jg          005121BF
 005121F8    xor         eax,eax
 005121FA    pop         edx
 005121FB    pop         ecx
 005121FC    pop         ecx
 005121FD    mov         dword ptr fs:[eax],edx
 00512200    push        512215
 00512205    lea         eax,[ebp-14]
 00512208    call        @UStrClr
 0051220D    ret
>0051220E    jmp         @HandleFinally
>00512213    jmp         00512205
 00512215    pop         edi
 00512216    pop         esi
 00512217    pop         ebx
 00512218    mov         esp,ebp
 0051221A    pop         ebp
 0051221B    ret
*}
end;

//00512294
procedure TmwNotifyEventChain.Add(AEvent:TNotifyEvent);
begin
{*
 00512294    push        ebp
 00512295    mov         ebp,esp
 00512297    lea         edx,[ebp+8]
 0051229A    call        TmwMethodChain.Add
 0051229F    pop         ebp
 005122A0    ret         8
*}
end;

//005122A4
constructor TmwNotifyEventChain.Create(ASender:TObject);
begin
{*
 005122A4    push        ebx
 005122A5    push        esi
 005122A6    push        edi
 005122A7    test        dl,dl
>005122A9    je          005122B3
 005122AB    add         esp,0FFFFFFF0
 005122AE    call        @ClassCreate
 005122B3    mov         esi,ecx
 005122B5    mov         ebx,edx
 005122B7    mov         edi,eax
 005122B9    xor         edx,edx
 005122BB    mov         eax,edi
 005122BD    call        00511EC0
 005122C2    mov         dword ptr [edi+10],esi;TmwNotifyEventChain......FSender:TObject
 005122C5    mov         eax,edi
 005122C7    test        bl,bl
>005122C9    je          005122DA
 005122CB    call        @AfterConstruction
 005122D0    pop         dword ptr fs:[0]
 005122D7    add         esp,0C
 005122DA    mov         eax,edi
 005122DC    pop         edi
 005122DD    pop         esi
 005122DE    pop         ebx
 005122DF    ret
*}
end;

//005122E0
{*procedure sub_005122E0(?:?);
begin
 005122E0    push        esi
 005122E1    push        edi
 005122E2    add         esp,0FFFFFFF8
 005122E5    mov         esi,edx
 005122E7    lea         edi,[esp]
 005122EA    movs        dword ptr [edi],dword ptr [esi]
 005122EB    movs        dword ptr [edi],dword ptr [esi]
 005122EC    mov         edx,dword ptr [eax+10];TmwNotifyEventChain.......FSender:TObject
 005122EF    mov         eax,dword ptr [esp+4]
 005122F3    call        dword ptr [esp]
 005122F6    pop         ecx
 005122F7    pop         edx
 005122F8    pop         edi
 005122F9    pop         esi
 005122FA    ret
end;*}

//005122FC
procedure TmwNotifyEventChain.Remove(AEvent:TNotifyEvent);
begin
{*
 005122FC    push        ebp
 005122FD    mov         ebp,esp
 005122FF    lea         edx,[ebp+8]
 00512302    call        TmwMethodChain.Remove
 00512307    pop         ebp
 00512308    ret         8
*}
end;

//0051230C
constructor TmwInternalImage.Create(Name:string; Count:Integer);
begin
{*
 0051230C    push        ebp
 0051230D    mov         ebp,esp
 0051230F    push        ecx
 00512310    push        ebx
 00512311    push        esi
 00512312    push        edi
 00512313    test        dl,dl
>00512315    je          0051231F
 00512317    add         esp,0FFFFFFF0
 0051231A    call        @ClassCreate
 0051231F    mov         edi,ecx
 00512321    mov         byte ptr [ebp-1],dl
 00512324    mov         ebx,eax
 00512326    mov         esi,dword ptr [ebp+8]
 00512329    xor         edx,edx
 0051232B    mov         eax,ebx
 0051232D    call        TObject.Create
 00512332    inc         dword ptr ds:[793B00];gvar_00793B00
 00512338    cmp         dword ptr ds:[793B00],1;gvar_00793B00
>0051233F    jne         00512391
 00512341    mov         dl,1
 00512343    mov         eax,[00463B28];TBitmap
 00512348    call        TBitmap.Create;TBitmap.Create
 0051234D    mov         [00793AFC],eax;gvar_00793AFC:TBitmap
 00512352    mov         ecx,edi
 00512354    mov         edx,dword ptr ds:[790C38];gvar_00790C38
 0051235A    mov         eax,[00793AFC];gvar_00793AFC:TBitmap
 0051235F    call        TBitmap.LoadFromResourceName
 00512364    mov         eax,[00793AFC];gvar_00793AFC:TBitmap
 00512369    mov         edx,dword ptr [eax]
 0051236B    call        dword ptr [edx+30]
 0051236E    mov         edx,esi
 00512370    shr         edx,1
 00512372    add         eax,edx
 00512374    cdq
 00512375    idiv        eax,esi
 00512377    mov         [00793B04],eax;gvar_00793B04:Integer
 0051237C    mov         eax,[00793AFC];gvar_00793AFC:TBitmap
 00512381    mov         edx,dword ptr [eax]
 00512383    call        dword ptr [edx+24]
 00512386    mov         [00793B08],eax;gvar_00793B08
 0051238B    mov         dword ptr ds:[793B0C],esi;gvar_00793B0C:Integer
 00512391    mov         eax,ebx
 00512393    cmp         byte ptr [ebp-1],0
>00512397    je          005123A8
 00512399    call        @AfterConstruction
 0051239E    pop         dword ptr fs:[0]
 005123A5    add         esp,0C
 005123A8    mov         eax,ebx
 005123AA    pop         edi
 005123AB    pop         esi
 005123AC    pop         ebx
 005123AD    pop         ecx
 005123AE    pop         ebp
 005123AF    ret         4
*}
end;

//005123B4
destructor TmwInternalImage.Destroy();
begin
{*
 005123B4    push        ebx
 005123B5    push        esi
 005123B6    call        @BeforeDestruction
 005123BB    mov         ebx,edx
 005123BD    mov         esi,eax
 005123BF    dec         dword ptr ds:[793B00];gvar_00793B00
 005123C5    cmp         dword ptr ds:[793B00],0;gvar_00793B00
>005123CC    jne         005123DF
 005123CE    mov         eax,[00793AFC];gvar_00793AFC:TBitmap
 005123D3    call        TObject.Free
 005123D8    xor         eax,eax
 005123DA    mov         [00793AFC],eax;gvar_00793AFC:TBitmap
 005123DF    mov         edx,ebx
 005123E1    and         dl,0FC
 005123E4    mov         eax,esi
 005123E6    call        TObject.Destroy
 005123EB    test        bl,bl
>005123ED    jle         005123F6
 005123EF    mov         eax,esi
 005123F1    call        @ClassDestroy
 005123F6    pop         esi
 005123F7    pop         ebx
 005123F8    ret
*}
end;

//005123FC
procedure TmwInternalImage.DrawMark(ACanvas:TCanvas; Number:Integer; LineHeight:Integer; Y:Integer; X:Integer);
begin
{*
 005123FC    push        ebp
 005123FD    mov         ebp,esp
 005123FF    add         esp,0FFFFFFDC
 00512402    push        ebx
 00512403    push        esi
 00512404    push        edi
 00512405    mov         ebx,ecx
 00512407    mov         dword ptr [ebp-4],edx
 0051240A    mov         edi,dword ptr [ebp+8]
 0051240D    mov         esi,dword ptr [ebp+0C]
 00512410    test        ebx,ebx
>00512412    jl          005124E4
 00512418    cmp         ebx,dword ptr ds:[793B0C];gvar_00793B0C:Integer
>0051241E    jge         005124E4
 00512424    cmp         edi,dword ptr ds:[793B08];gvar_00793B08
>0051242A    jl          0051247F
 0051242C    mov         eax,[00793B08];gvar_00793B08
 00512431    push        eax
 00512432    lea         eax,[ebp-14]
 00512435    push        eax
 00512436    lea         ecx,[ebx+1]
 00512439    imul        ecx,dword ptr ds:[793B04];gvar_00793B04:Integer
 00512440    mov         eax,ebx
 00512442    imul        dword ptr ds:[793B04];gvar_00793B04:Integer
 00512448    xor         edx,edx
 0051244A    call        Rect
 0051244F    sub         edi,dword ptr ds:[793B08];gvar_00793B08
 00512455    sar         edi,1
>00512457    jns         0051245C
 00512459    adc         edi,0
 0051245C    add         esi,edi
 0051245E    mov         eax,[00793B08];gvar_00793B08
 00512463    add         eax,esi
 00512465    push        eax
 00512466    lea         eax,[ebp-24]
 00512469    push        eax
 0051246A    mov         ecx,dword ptr [ebp+10]
 0051246D    add         ecx,dword ptr ds:[793B04];gvar_00793B04:Integer
 00512473    mov         edx,esi
 00512475    mov         eax,dword ptr [ebp+10]
 00512478    call        Rect
>0051247D    jmp         005124C9
 0051247F    lea         eax,[edi+esi]
 00512482    push        eax
 00512483    lea         eax,[ebp-24]
 00512486    push        eax
 00512487    mov         ecx,dword ptr [ebp+10]
 0051248A    add         ecx,dword ptr ds:[793B04];gvar_00793B04:Integer
 00512490    mov         edx,esi
 00512492    mov         eax,dword ptr [ebp+10]
 00512495    call        Rect
 0051249A    mov         esi,dword ptr ds:[793B08];gvar_00793B08
 005124A0    sub         esi,edi
 005124A2    sar         esi,1
>005124A4    jns         005124A9
 005124A6    adc         esi,0
 005124A9    add         edi,esi
 005124AB    push        edi
 005124AC    lea         eax,[ebp-14]
 005124AF    push        eax
 005124B0    lea         ecx,[ebx+1]
 005124B3    imul        ecx,dword ptr ds:[793B04];gvar_00793B04:Integer
 005124BA    mov         eax,ebx
 005124BC    imul        dword ptr ds:[793B04];gvar_00793B04:Integer
 005124C2    mov         edx,esi
 005124C4    call        Rect
 005124C9    lea         eax,[ebp-14]
 005124CC    push        eax
 005124CD    mov         eax,[00793AFC];gvar_00793AFC:TBitmap
 005124D2    call        TBitmap.GetCanvas
 005124D7    mov         ecx,eax
 005124D9    lea         edx,[ebp-24]
 005124DC    mov         eax,dword ptr [ebp-4]
 005124DF    call        TCanvas.CopyRect
 005124E4    pop         edi
 005124E5    pop         esi
 005124E6    pop         ebx
 005124E7    mov         esp,ebp
 005124E9    pop         ebp
 005124EA    ret         0C
*}
end;

//00513440
procedure TmwCustomHighLighter.ExportNext;
begin
{*
>00513440    jmp         @AbstractError
*}
end;

//00513448
procedure TmwCustomHighLighter.GetEol;
begin
{*
>00513448    jmp         @AbstractError
*}
end;

//00513450
procedure TmwCustomHighLighter.GetRange;
begin
{*
>00513450    jmp         @AbstractError
*}
end;

//00513458
procedure TmwCustomHighLighter.GetToken;
begin
{*
>00513458    jmp         @AbstractError
*}
end;

//00513460
procedure TmwCustomHighLighter.GetTokenAttribute;
begin
{*
>00513460    jmp         @AbstractError
*}
end;

//00513468
procedure TmwCustomHighLighter.GetTokenKind;
begin
{*
>00513468    jmp         @AbstractError
*}
end;

//00513470
procedure TmwCustomHighLighter.GetTokenPos;
begin
{*
>00513470    jmp         @AbstractError
*}
end;

//00513478
procedure TmwCustomHighLighter.Next;
begin
{*
>00513478    jmp         @AbstractError
*}
end;

//00513480
procedure TmwCustomHighLighter.SetLine(NewValue:string; LineNumber:Integer);
begin
{*
>00513480    jmp         @AbstractError
*}
end;

//00513488
procedure TmwCustomHighLighter.SetLineForExport(NewValue:string);
begin
{*
>00513488    jmp         @AbstractError
*}
end;

//00513490
procedure TmwCustomHighLighter.SetRange(Value:Pointer);
begin
{*
>00513490    jmp         @AbstractError
*}
end;

//00513498
procedure TmwCustomHighLighter.ReSetRange;
begin
{*
>00513498    jmp         @AbstractError
*}
end;

//00513678
function THighlighterList.Count:Integer;
begin
{*
 00513678    mov         eax,dword ptr [eax+10];THighlighterList..........hlList:TList
 0051367B    mov         eax,dword ptr [eax+8];TList.FCount:Integer
 0051367E    ret
*}
end;

//00513680
constructor THighlighterList.Create;
begin
{*
 00513680    push        ebx
 00513681    push        esi
 00513682    test        dl,dl
>00513684    je          0051368E
 00513686    add         esp,0FFFFFFF0
 00513689    call        @ClassCreate
 0051368E    mov         ebx,edx
 00513690    mov         esi,eax
 00513692    xor         edx,edx
 00513694    mov         eax,esi
 00513696    call        TObject.Create
 0051369B    mov         dl,1
 0051369D    mov         eax,[00439644];TList
 005136A2    call        TObject.Create;TList.Create
 005136A7    mov         dword ptr [esi+10],eax;THighlighterList...........hlList:TList
 005136AA    mov         eax,esi
 005136AC    test        bl,bl
>005136AE    je          005136BF
 005136B0    call        @AfterConstruction
 005136B5    pop         dword ptr fs:[0]
 005136BC    add         esp,0C
 005136BF    mov         eax,esi
 005136C1    pop         esi
 005136C2    pop         ebx
 005136C3    ret
*}
end;

//005136C4
destructor THighlighterList.Destroy();
begin
{*
 005136C4    push        ebx
 005136C5    push        esi
 005136C6    call        @BeforeDestruction
 005136CB    mov         ebx,edx
 005136CD    mov         esi,eax
 005136CF    mov         eax,dword ptr [esi+10];THighlighterList............hlList:TList
 005136D2    call        TObject.Free
 005136D7    mov         edx,ebx
 005136D9    and         dl,0FC
 005136DC    mov         eax,esi
 005136DE    call        TList.Destroy
 005136E3    test        bl,bl
>005136E5    jle         005136EE
 005136E7    mov         eax,esi
 005136E9    call        @ClassDestroy
 005136EE    pop         esi
 005136EF    pop         ebx
 005136F0    ret
*}
end;

//005136F4
function THighlighterList.FindByClass(comp:TComponent):Integer;
begin
{*
 005136F4    push        ebx
 005136F5    push        esi
 005136F6    push        edi
 005136F7    push        ebp
 005136F8    push        ecx
 005136F9    mov         ebp,edx
 005136FB    mov         edi,eax
 005136FD    mov         dword ptr [esp],0FFFFFFFF
 00513704    mov         eax,edi
 00513706    call        THighlighterList.Count
 0051370B    mov         esi,eax
 0051370D    dec         esi
 0051370E    test        esi,esi
>00513710    jl          00513734
 00513712    inc         esi
 00513713    xor         ebx,ebx
 00513715    mov         edx,ebx
 00513717    mov         eax,edi
 00513719    call        005137D8
 0051371E    mov         edx,eax
 00513720    mov         eax,ebp
 00513722    call        @IsClass
 00513727    test        al,al
>00513729    je          00513730
 0051372B    mov         dword ptr [esp],ebx
>0051372E    jmp         00513734
 00513730    inc         ebx
 00513731    dec         esi
>00513732    jne         00513715
 00513734    mov         eax,dword ptr [esp]
 00513737    pop         edx
 00513738    pop         ebp
 00513739    pop         edi
 0051373A    pop         esi
 0051373B    pop         ebx
 0051373C    ret
*}
end;

//00513740
function THighlighterList.FindByName(name:string):Integer;
begin
{*
 00513740    push        ebp
 00513741    mov         ebp,esp
 00513743    add         esp,0FFFFFFF4
 00513746    push        ebx
 00513747    push        esi
 00513748    push        edi
 00513749    xor         ecx,ecx
 0051374B    mov         dword ptr [ebp-0C],ecx
 0051374E    mov         dword ptr [ebp-4],edx
 00513751    mov         edi,eax
 00513753    mov         eax,dword ptr [ebp-4]
 00513756    call        @UStrAddRef
 0051375B    xor         eax,eax
 0051375D    push        ebp
 0051375E    push        5137C4
 00513763    push        dword ptr fs:[eax]
 00513766    mov         dword ptr fs:[eax],esp
 00513769    mov         dword ptr [ebp-8],0FFFFFFFF
 00513770    mov         eax,edi
 00513772    call        THighlighterList.Count
 00513777    mov         esi,eax
 00513779    dec         esi
 0051377A    test        esi,esi
>0051377C    jl          005137A6
 0051377E    inc         esi
 0051377F    xor         ebx,ebx
 00513781    mov         edx,ebx
 00513783    mov         eax,edi
 00513785    call        005137D8
 0051378A    lea         edx,[ebp-0C]
 0051378D    call        dword ptr [eax+50]
 00513790    mov         eax,dword ptr [ebp-0C]
 00513793    mov         edx,dword ptr [ebp-4]
 00513796    call        @UStrEqual
>0051379B    jne         005137A2
 0051379D    mov         dword ptr [ebp-8],ebx
>005137A0    jmp         005137A6
 005137A2    inc         ebx
 005137A3    dec         esi
>005137A4    jne         00513781
 005137A6    xor         eax,eax
 005137A8    pop         edx
 005137A9    pop         ecx
 005137AA    pop         ecx
 005137AB    mov         dword ptr fs:[eax],edx
 005137AE    push        5137CB
 005137B3    lea         eax,[ebp-0C]
 005137B6    call        @UStrClr
 005137BB    lea         eax,[ebp-4]
 005137BE    call        @UStrClr
 005137C3    ret
>005137C4    jmp         @HandleFinally
>005137C9    jmp         005137B3
 005137CB    mov         eax,dword ptr [ebp-8]
 005137CE    pop         edi
 005137CF    pop         esi
 005137D0    pop         ebx
 005137D1    mov         esp,ebp
 005137D3    pop         ebp
 005137D4    ret
*}
end;

//005137D8
{*function sub_005137D8(?:THighlighterList; ?:?):?;
begin
 005137D8    push        ebx
 005137D9    push        esi
 005137DA    mov         esi,edx
 005137DC    mov         ebx,eax
 005137DE    mov         edx,esi
 005137E0    mov         eax,dword ptr [ebx+10];THighlighterList.............hlList:TList
 005137E3    call        TList.Get
 005137E8    pop         esi
 005137E9    pop         ebx
 005137EA    ret
end;*}

//005137EC
procedure sub_005137EC(?:TmwCarlSampleSyn);
begin
{*
 005137EC    push        ebx
 005137ED    mov         ebx,eax
 005137EF    mov         eax,[00793B14];gvar_00793B14:THighlighterList
 005137F4    mov         eax,dword ptr [eax+10]
 005137F7    mov         edx,ebx
 005137F9    call        TList.IndexOf
 005137FE    test        eax,eax
>00513800    jge         00513811
 00513802    mov         eax,[00793B14];gvar_00793B14:THighlighterList
 00513807    mov         eax,dword ptr [eax+10]
 0051380A    mov         edx,ebx
 0051380C    call        TList.Add
 00513811    pop         ebx
 00513812    ret
*}
end;

//00513814
procedure TmwHighLightAttributes.Assign(Source:TPersistent);
begin
{*
 00513814    push        ebx
 00513815    push        esi
 00513816    push        edi
 00513817    mov         esi,edx
 00513819    mov         edi,eax
 0051381B    mov         eax,esi
 0051381D    mov         edx,dword ptr ds:[51258C];TmwHighLightAttributes
 00513823    call        @IsClass
 00513828    test        al,al
>0051382A    je          00513889
 0051382C    xor         ebx,ebx
 0051382E    mov         eax,esi
 00513830    mov         edx,dword ptr ds:[51258C];TmwHighLightAttributes
 00513836    call        @AsClass
 0051383B    mov         esi,eax
 0051383D    lea         eax,[edi+18];TmwHighLightAttributes.fName:string
 00513840    mov         edx,dword ptr [esi+18];TmwHighLightAttributes.fName:string
 00513843    call        @UStrAsg
 00513848    mov         eax,dword ptr [esi+4];TmwHighLightAttributes.fBackground:TColor
 0051384B    cmp         eax,dword ptr [edi+4];TmwHighLightAttributes.fBackground:TColor
>0051384E    je          00513855
 00513850    mov         dword ptr [edi+4],eax;TmwHighLightAttributes.fBackground:TColor
 00513853    mov         bl,1
 00513855    mov         eax,dword ptr [esi+8];TmwHighLightAttributes.fForeground:TColor
 00513858    cmp         eax,dword ptr [edi+8];TmwHighLightAttributes.fForeground:TColor
>0051385B    je          00513862
 0051385D    mov         dword ptr [edi+8],eax;TmwHighLightAttributes.fForeground:TColor
 00513860    mov         bl,1
 00513862    movzx       eax,byte ptr [esi+0C];TmwHighLightAttributes.fStyle:TFontStyles
 00513866    cmp         al,byte ptr [edi+0C];TmwHighLightAttributes.fStyle:TFontStyles
>00513869    je          00513874
 0051386B    movzx       eax,byte ptr [esi+0C];TmwHighLightAttributes.fStyle:TFontStyles
 0051386F    mov         byte ptr [edi+0C],al;TmwHighLightAttributes.fStyle:TFontStyles
 00513872    mov         bl,1
 00513874    test        bl,bl
>00513876    je          00513892
 00513878    cmp         word ptr [edi+12],0;TmwHighLightAttributes.?f12:word
>0051387D    je          00513892
 0051387F    mov         edx,edi
 00513881    mov         eax,dword ptr [edi+14];TmwHighLightAttributes.?f14:dword
 00513884    call        dword ptr [edi+10];TmwHighLightAttributes.fOnChange
>00513887    jmp         00513892
 00513889    mov         edx,esi
 0051388B    mov         eax,edi
 0051388D    call        TPersistent.Assign
 00513892    pop         edi
 00513893    pop         esi
 00513894    pop         ebx
 00513895    ret
*}
end;

//00513898
constructor TmwHighLightAttributes.Create(attribName:string);
begin
{*
 00513898    push        ebp
 00513899    mov         ebp,esp
 0051389B    push        ecx
 0051389C    push        ebx
 0051389D    push        esi
 0051389E    test        dl,dl
>005138A0    je          005138AA
 005138A2    add         esp,0FFFFFFF0
 005138A5    call        @ClassCreate
 005138AA    mov         dword ptr [ebp-4],ecx
 005138AD    mov         ebx,edx
 005138AF    mov         esi,eax
 005138B1    mov         eax,dword ptr [ebp-4]
 005138B4    call        @UStrAddRef
 005138B9    xor         eax,eax
 005138BB    push        ebp
 005138BC    push        513909
 005138C1    push        dword ptr fs:[eax]
 005138C4    mov         dword ptr fs:[eax],esp
 005138C7    xor         edx,edx
 005138C9    mov         eax,esi
 005138CB    call        TObject.Create
 005138D0    mov         edx,1FFFFFFF
 005138D5    mov         eax,esi
 005138D7    call        TmwHighLightAttributes.SetBackground
 005138DC    mov         edx,1FFFFFFF
 005138E1    mov         eax,esi
 005138E3    call        TmwHighLightAttributes.SetForeground
 005138E8    lea         eax,[esi+18];TmwHighLightAttributes.fName:string
 005138EB    mov         edx,dword ptr [ebp-4]
 005138EE    call        @UStrAsg
 005138F3    xor         eax,eax
 005138F5    pop         edx
 005138F6    pop         ecx
 005138F7    pop         ecx
 005138F8    mov         dword ptr fs:[eax],edx
 005138FB    push        513910
 00513900    lea         eax,[ebp-4]
 00513903    call        @UStrClr
 00513908    ret
>00513909    jmp         @HandleFinally
>0051390E    jmp         00513900
 00513910    mov         eax,esi
 00513912    test        bl,bl
>00513914    je          00513925
 00513916    call        @AfterConstruction
 0051391B    pop         dword ptr fs:[0]
 00513922    add         esp,0C
 00513925    mov         eax,esi
 00513927    pop         esi
 00513928    pop         ebx
 00513929    pop         ecx
 0051392A    pop         ebp
 0051392B    ret
*}
end;

//0051392C
{*procedure sub_0051392C(?:?; ?:?);
begin
 0051392C    push        ebp
 0051392D    mov         ebp,esp
 0051392F    push        ecx
 00513930    push        ebx
 00513931    push        esi
 00513932    push        edi
 00513933    mov         edi,edx
 00513935    mov         ebx,eax
 00513937    mov         edx,dword ptr [ebx]
 00513939    mov         eax,5139A0;','
 0051393E    call        Pos
 00513943    mov         esi,eax
 00513945    test        esi,esi
>00513947    jne         0051395D
 00513949    mov         eax,dword ptr [ebx]
 0051394B    mov         dword ptr [ebp-4],eax
 0051394E    mov         eax,dword ptr [ebp-4]
 00513951    test        eax,eax
>00513953    je          0051395A
 00513955    sub         eax,4
 00513958    mov         eax,dword ptr [eax]
 0051395A    lea         esi,[eax+1]
 0051395D    push        edi
 0051395E    mov         ecx,esi
 00513960    dec         ecx
 00513961    mov         eax,dword ptr [ebx]
 00513963    mov         edx,1
 00513968    call        @UStrCopy
 0051396D    mov         eax,dword ptr [ebx]
 0051396F    mov         dword ptr [ebp-4],eax
 00513972    mov         edi,dword ptr [ebp-4]
 00513975    test        edi,edi
>00513977    je          0051397E
 00513979    sub         edi,4
 0051397C    mov         edi,dword ptr [edi]
 0051397E    push        ebx
 0051397F    mov         ecx,edi
 00513981    sub         ecx,esi
 00513983    lea         edx,[esi+1]
 00513986    mov         eax,dword ptr [ebx]
 00513988    call        @UStrCopy
 0051398D    pop         edi
 0051398E    pop         esi
 0051398F    pop         ebx
 00513990    pop         ecx
 00513991    pop         ebp
 00513992    ret
end;*}

//005139A4
{*function sub_005139A4(?:HKEY; ?:string; ?:string; ?:?):?;
begin
 005139A4    push        ebp
 005139A5    mov         ebp,esp
 005139A7    push        ecx
 005139A8    mov         ecx,5
 005139AD    push        0
 005139AF    push        0
 005139B1    dec         ecx
>005139B2    jne         005139AD
 005139B4    push        ecx
 005139B5    xchg        ecx,dword ptr [ebp-4]
 005139B8    push        ebx
 005139B9    push        esi
 005139BA    push        edi
 005139BB    mov         dword ptr [ebp-8],ecx
 005139BE    mov         dword ptr [ebp-4],edx
 005139C1    mov         ebx,eax
 005139C3    mov         eax,dword ptr [ebp-4]
 005139C6    call        @UStrAddRef
 005139CB    mov         eax,dword ptr [ebp-8]
 005139CE    call        @UStrAddRef
 005139D3    xor         eax,eax
 005139D5    push        ebp
 005139D6    push        513C22
 005139DB    push        dword ptr fs:[eax]
 005139DE    mov         dword ptr fs:[eax],esp
 005139E1    mov         byte ptr [ebp-29],0
 005139E5    xor         eax,eax
 005139E7    push        ebp
 005139E8    push        513BFD
 005139ED    push        dword ptr fs:[eax]
 005139F0    mov         dword ptr fs:[eax],esp
 005139F3    mov         dl,1
 005139F5    mov         eax,[005124F0];TBetterRegistry
 005139FA    call        TRegistry.Create;TBetterRegistry.Create
 005139FF    mov         dword ptr [ebp-30],eax
 00513A02    mov         edx,ebx
 00513A04    mov         eax,dword ptr [ebp-30]
 00513A07    call        TRegistry.SetRootKey
 00513A0C    xor         eax,eax
 00513A0E    push        ebp
 00513A0F    push        513BEC
 00513A14    push        dword ptr fs:[eax]
 00513A17    mov         dword ptr fs:[eax],esp
 00513A1A    mov         edx,dword ptr [ebp-4]
 00513A1D    mov         eax,dword ptr [ebp-30]
 00513A20    call        TRegistry.OpenKeyReadOnly
 00513A25    test        al,al
>00513A27    je          00513BD6
 00513A2D    xor         eax,eax
 00513A2F    push        ebp
 00513A30    push        513BCF
 00513A35    push        dword ptr fs:[eax]
 00513A38    mov         dword ptr fs:[eax],esp
 00513A3B    mov         edx,dword ptr [ebp-8]
 00513A3E    mov         eax,dword ptr [ebp-30]
 00513A41    call        TRegistry.ValueExists
 00513A46    test        al,al
>00513A48    je          00513BB9
 00513A4E    lea         ecx,[ebp-0C]
 00513A51    mov         edx,dword ptr [ebp-8]
 00513A54    mov         eax,dword ptr [ebp-30]
 00513A57    call        TRegistry.ReadString
 00513A5C    lea         edx,[ebp-10]
 00513A5F    lea         eax,[ebp-0C]
 00513A62    call        0051392C
 00513A67    lea         edx,[ebp-14]
 00513A6A    lea         eax,[ebp-0C]
 00513A6D    call        0051392C
 00513A72    lea         edx,[ebp-18]
 00513A75    lea         eax,[ebp-0C]
 00513A78    call        0051392C
 00513A7D    lea         edx,[ebp-1C]
 00513A80    lea         eax,[ebp-0C]
 00513A83    call        0051392C
 00513A88    lea         edx,[ebp-20]
 00513A8B    lea         eax,[ebp-0C]
 00513A8E    call        0051392C
 00513A93    lea         edx,[ebp-24]
 00513A96    lea         eax,[ebp-0C]
 00513A99    call        0051392C
 00513A9E    lea         edx,[ebp-28]
 00513AA1    lea         eax,[ebp-0C]
 00513AA4    call        0051392C
 00513AA9    mov         eax,dword ptr [ebp-20]
 00513AAC    mov         edx,513C40;'1'
 00513AB1    call        @UStrEqual
>00513AB6    jne         00513ACA
 00513AB8    mov         eax,dword ptr [ebp+8]
 00513ABB    mov         eax,dword ptr [eax-4]
 00513ABE    mov         edx,0FF000005
 00513AC3    call        TmwHighLightAttributes.SetBackground
>00513AC8    jmp         00513AE4
 00513ACA    mov         eax,dword ptr [ebp-28]
 00513ACD    call        StrToInt
 00513AD2    mov         edx,dword ptr [eax*4+786BD8]
 00513AD9    mov         eax,dword ptr [ebp+8]
 00513ADC    mov         eax,dword ptr [eax-4]
 00513ADF    call        TmwHighLightAttributes.SetBackground
 00513AE4    mov         eax,dword ptr [ebp-1C]
 00513AE7    mov         edx,513C40;'1'
 00513AEC    call        @UStrEqual
>00513AF1    jne         00513B05
 00513AF3    mov         eax,dword ptr [ebp+8]
 00513AF6    mov         eax,dword ptr [eax-4]
 00513AF9    mov         edx,0FF000008
 00513AFE    call        TmwHighLightAttributes.SetForeground
>00513B03    jmp         00513B1F
 00513B05    mov         eax,dword ptr [ebp-24]
 00513B08    call        StrToInt
 00513B0D    mov         edx,dword ptr [eax*4+786BD8]
 00513B14    mov         eax,dword ptr [ebp+8]
 00513B17    mov         eax,dword ptr [eax-4]
 00513B1A    call        TmwHighLightAttributes.SetForeground
 00513B1F    mov         eax,dword ptr [ebp+8]
 00513B22    mov         eax,dword ptr [eax-4]
 00513B25    movzx       edx,byte ptr ds:[513C44];0x0 gvar_00513C44
 00513B2C    call        TmwHighLightAttributes.SetStyle
 00513B31    mov         edx,dword ptr [ebp-18]
 00513B34    mov         eax,513C54;'B'
 00513B39    call        Pos
 00513B3E    test        eax,eax
>00513B40    jle         00513B5D
 00513B42    mov         eax,dword ptr [ebp+8]
 00513B45    mov         eax,dword ptr [eax-4]
 00513B48    movzx       edx,byte ptr [eax+0C]
 00513B4C    or          dl,byte ptr ds:[513C58];0x1 gvar_00513C58
 00513B52    mov         eax,dword ptr [ebp+8]
 00513B55    mov         eax,dword ptr [eax-4]
 00513B58    call        TmwHighLightAttributes.SetStyle
 00513B5D    mov         edx,dword ptr [ebp-18]
 00513B60    mov         eax,513C68;'I'
 00513B65    call        Pos
 00513B6A    test        eax,eax
>00513B6C    jle         00513B89
 00513B6E    mov         eax,dword ptr [ebp+8]
 00513B71    mov         eax,dword ptr [eax-4]
 00513B74    movzx       edx,byte ptr [eax+0C]
 00513B78    or          dl,byte ptr ds:[513C6C];0x2 gvar_00513C6C
 00513B7E    mov         eax,dword ptr [ebp+8]
 00513B81    mov         eax,dword ptr [eax-4]
 00513B84    call        TmwHighLightAttributes.SetStyle
 00513B89    mov         edx,dword ptr [ebp-18]
 00513B8C    mov         eax,513C7C;'U'
 00513B91    call        Pos
 00513B96    test        eax,eax
>00513B98    jle         00513BB5
 00513B9A    mov         eax,dword ptr [ebp+8]
 00513B9D    mov         eax,dword ptr [eax-4]
 00513BA0    movzx       edx,byte ptr [eax+0C]
 00513BA4    or          dl,byte ptr ds:[513C80];0x4 gvar_00513C80
 00513BAA    mov         eax,dword ptr [ebp+8]
 00513BAD    mov         eax,dword ptr [eax-4]
 00513BB0    call        TmwHighLightAttributes.SetStyle
 00513BB5    mov         byte ptr [ebp-29],1
 00513BB9    xor         eax,eax
 00513BBB    pop         edx
 00513BBC    pop         ecx
 00513BBD    pop         ecx
 00513BBE    mov         dword ptr fs:[eax],edx
 00513BC1    push        513BD6
 00513BC6    mov         eax,dword ptr [ebp-30]
 00513BC9    call        TRegistry.CloseKey
 00513BCE    ret
>00513BCF    jmp         @HandleFinally
>00513BD4    jmp         00513BC6
 00513BD6    xor         eax,eax
 00513BD8    pop         edx
 00513BD9    pop         ecx
 00513BDA    pop         ecx
 00513BDB    mov         dword ptr fs:[eax],edx
 00513BDE    push        513BF3
 00513BE3    mov         eax,dword ptr [ebp-30]
 00513BE6    call        TObject.Free
 00513BEB    ret
>00513BEC    jmp         @HandleFinally
>00513BF1    jmp         00513BE3
 00513BF3    xor         eax,eax
 00513BF5    pop         edx
 00513BF6    pop         ecx
 00513BF7    pop         ecx
 00513BF8    mov         dword ptr fs:[eax],edx
>00513BFB    jmp         00513C07
>00513BFD    jmp         @HandleAnyException
 00513C02    call        @DoneExcept
 00513C07    xor         eax,eax
 00513C09    pop         edx
 00513C0A    pop         ecx
 00513C0B    pop         ecx
 00513C0C    mov         dword ptr fs:[eax],edx
 00513C0F    push        513C29
 00513C14    lea         eax,[ebp-28]
 00513C17    mov         edx,0A
 00513C1C    call        @UStrArrayClr
 00513C21    ret
>00513C22    jmp         @HandleFinally
>00513C27    jmp         00513C14
 00513C29    movzx       eax,byte ptr [ebp-29]
 00513C2D    pop         edi
 00513C2E    pop         esi
 00513C2F    pop         ebx
 00513C30    mov         esp,ebp
 00513C32    pop         ebp
 00513C33    ret
end;*}

//00513C84
{*function sub_00513C84(?:?):?;
begin
 00513C84    push        ebp
 00513C85    mov         ebp,esp
 00513C87    add         esp,0FFFFFFF8
 00513C8A    push        ebx
 00513C8B    xor         edx,edx
 00513C8D    mov         dword ptr [ebp-8],edx
 00513C90    mov         dword ptr [ebp-4],eax
 00513C93    mov         eax,dword ptr [ebp-4]
 00513C96    call        @UStrAddRef
 00513C9B    xor         eax,eax
 00513C9D    push        ebp
 00513C9E    push        513CF3
 00513CA3    push        dword ptr fs:[eax]
 00513CA6    mov         dword ptr fs:[eax],esp
 00513CA9    lea         edx,[ebp-8]
 00513CAC    mov         eax,dword ptr [ebp-4]
 00513CAF    call        UpperCase
 00513CB4    mov         eax,dword ptr [ebp-8]
 00513CB7    mov         edx,513D10;'FALSE'
 00513CBC    call        @UStrEqual
>00513CC1    je          00513CD2
 00513CC3    mov         eax,dword ptr [ebp-4]
 00513CC6    mov         edx,513D28;'0'
 00513CCB    call        @UStrEqual
>00513CD0    jne         00513CD6
 00513CD2    xor         ebx,ebx
>00513CD4    jmp         00513CD8
 00513CD6    mov         bl,1
 00513CD8    xor         eax,eax
 00513CDA    pop         edx
 00513CDB    pop         ecx
 00513CDC    pop         ecx
 00513CDD    mov         dword ptr fs:[eax],edx
 00513CE0    push        513CFA
 00513CE5    lea         eax,[ebp-8]
 00513CE8    mov         edx,2
 00513CED    call        @UStrArrayClr
 00513CF2    ret
>00513CF3    jmp         @HandleFinally
>00513CF8    jmp         00513CE5
 00513CFA    mov         eax,ebx
 00513CFC    pop         ebx
 00513CFD    pop         ecx
 00513CFE    pop         ecx
 00513CFF    pop         ebp
 00513D00    ret
end;*}

//00513D2C
{*function sub_00513D2C(?:HKEY; ?:string; ?:string; ?:?):?;
begin
 00513D2C    push        ebp
 00513D2D    mov         ebp,esp
 00513D2F    push        ecx
 00513D30    mov         ecx,4
 00513D35    push        0
 00513D37    push        0
 00513D39    dec         ecx
>00513D3A    jne         00513D35
 00513D3C    push        ecx
 00513D3D    xchg        ecx,dword ptr [ebp-4]
 00513D40    push        ebx
 00513D41    push        esi
 00513D42    push        edi
 00513D43    mov         dword ptr [ebp-8],ecx
 00513D46    mov         dword ptr [ebp-4],edx
 00513D49    mov         ebx,eax
 00513D4B    mov         eax,dword ptr [ebp-4]
 00513D4E    call        @UStrAddRef
 00513D53    mov         eax,dword ptr [ebp-8]
 00513D56    call        @UStrAddRef
 00513D5B    xor         eax,eax
 00513D5D    push        ebp
 00513D5E    push        5140CB
 00513D63    push        dword ptr fs:[eax]
 00513D66    mov         dword ptr fs:[eax],esp
 00513D69    mov         byte ptr [ebp-1D],0
 00513D6D    xor         eax,eax
 00513D6F    push        ebp
 00513D70    push        51409E
 00513D75    push        dword ptr fs:[eax]
 00513D78    mov         dword ptr fs:[eax],esp
 00513D7B    mov         dl,1
 00513D7D    mov         eax,[005124F0];TBetterRegistry
 00513D82    call        TRegistry.Create;TBetterRegistry.Create
 00513D87    mov         dword ptr [ebp-24],eax
 00513D8A    mov         edx,ebx
 00513D8C    mov         eax,dword ptr [ebp-24]
 00513D8F    call        TRegistry.SetRootKey
 00513D94    xor         eax,eax
 00513D96    push        ebp
 00513D97    push        51408D
 00513D9C    push        dword ptr fs:[eax]
 00513D9F    mov         dword ptr fs:[eax],esp
 00513DA2    push        dword ptr [ebp-4]
 00513DA5    push        5140EC;'\'
 00513DAA    push        dword ptr [ebp-8]
 00513DAD    lea         eax,[ebp-28]
 00513DB0    mov         edx,3
 00513DB5    call        @UStrCatN
 00513DBA    mov         edx,dword ptr [ebp-28]
 00513DBD    mov         eax,dword ptr [ebp-24]
 00513DC0    call        TRegistry.OpenKeyReadOnly
 00513DC5    test        al,al
>00513DC7    je          00514077
 00513DCD    xor         eax,eax
 00513DCF    push        ebp
 00513DD0    push        514070
 00513DD5    push        dword ptr fs:[eax]
 00513DD8    mov         dword ptr fs:[eax],esp
 00513DDB    mov         edx,5140FC;'Foreground Color'
 00513DE0    mov         eax,dword ptr [ebp-24]
 00513DE3    call        TRegistry.ValueExists
 00513DE8    test        al,al
>00513DEA    je          00513DFD
 00513DEC    mov         edx,5140FC;'Foreground Color'
 00513DF1    mov         eax,dword ptr [ebp-24]
 00513DF4    call        TRegistry.ReadInteger
 00513DF9    mov         ebx,eax
>00513DFB    jmp         00513E14
 00513DFD    call        @TryFinallyExit
 00513E02    call        @TryFinallyExit
 00513E07    xor         eax,eax
 00513E09    pop         edx
 00513E0A    pop         ecx
 00513E0B    pop         ecx
 00513E0C    mov         dword ptr fs:[eax],edx
>00513E0F    jmp         005140A8
 00513E14    mov         edx,51412C;'Background Color'
 00513E19    mov         eax,dword ptr [ebp-24]
 00513E1C    call        TRegistry.ValueExists
 00513E21    test        al,al
>00513E23    je          00513E36
 00513E25    mov         edx,51412C;'Background Color'
 00513E2A    mov         eax,dword ptr [ebp-24]
 00513E2D    call        TRegistry.ReadInteger
 00513E32    mov         esi,eax
>00513E34    jmp         00513E4D
 00513E36    call        @TryFinallyExit
 00513E3B    call        @TryFinallyExit
 00513E40    xor         eax,eax
 00513E42    pop         edx
 00513E43    pop         ecx
 00513E44    pop         ecx
 00513E45    mov         dword ptr fs:[eax],edx
>00513E48    jmp         005140A8
 00513E4D    mov         edx,51415C;'Bold'
 00513E52    mov         eax,dword ptr [ebp-24]
 00513E55    call        TRegistry.ValueExists
 00513E5A    test        al,al
>00513E5C    je          00513E70
 00513E5E    lea         ecx,[ebp-0C]
 00513E61    mov         edx,51415C;'Bold'
 00513E66    mov         eax,dword ptr [ebp-24]
 00513E69    call        TRegistry.ReadString
>00513E6E    jmp         00513E87
 00513E70    call        @TryFinallyExit
 00513E75    call        @TryFinallyExit
 00513E7A    xor         eax,eax
 00513E7C    pop         edx
 00513E7D    pop         ecx
 00513E7E    pop         ecx
 00513E7F    mov         dword ptr fs:[eax],edx
>00513E82    jmp         005140A8
 00513E87    mov         edx,514174;'Italic'
 00513E8C    mov         eax,dword ptr [ebp-24]
 00513E8F    call        TRegistry.ValueExists
 00513E94    test        al,al
>00513E96    je          00513EAA
 00513E98    lea         ecx,[ebp-10]
 00513E9B    mov         edx,514174;'Italic'
 00513EA0    mov         eax,dword ptr [ebp-24]
 00513EA3    call        TRegistry.ReadString
>00513EA8    jmp         00513EC1
 00513EAA    call        @TryFinallyExit
 00513EAF    call        @TryFinallyExit
 00513EB4    xor         eax,eax
 00513EB6    pop         edx
 00513EB7    pop         ecx
 00513EB8    pop         ecx
 00513EB9    mov         dword ptr fs:[eax],edx
>00513EBC    jmp         005140A8
 00513EC1    mov         edx,514190;'Underline'
 00513EC6    mov         eax,dword ptr [ebp-24]
 00513EC9    call        TRegistry.ValueExists
 00513ECE    test        al,al
>00513ED0    je          00513EE4
 00513ED2    lea         ecx,[ebp-14]
 00513ED5    mov         edx,514190;'Underline'
 00513EDA    mov         eax,dword ptr [ebp-24]
 00513EDD    call        TRegistry.ReadString
>00513EE2    jmp         00513EFB
 00513EE4    call        @TryFinallyExit
 00513EE9    call        @TryFinallyExit
 00513EEE    xor         eax,eax
 00513EF0    pop         edx
 00513EF1    pop         ecx
 00513EF2    pop         ecx
 00513EF3    mov         dword ptr fs:[eax],edx
>00513EF6    jmp         005140A8
 00513EFB    mov         edx,5141B0;'Default Foreground'
 00513F00    mov         eax,dword ptr [ebp-24]
 00513F03    call        TRegistry.ValueExists
 00513F08    test        al,al
>00513F0A    je          00513F1E
 00513F0C    lea         ecx,[ebp-18]
 00513F0F    mov         edx,5141B0;'Default Foreground'
 00513F14    mov         eax,dword ptr [ebp-24]
 00513F17    call        TRegistry.ReadString
>00513F1C    jmp         00513F35
 00513F1E    call        @TryFinallyExit
 00513F23    call        @TryFinallyExit
 00513F28    xor         eax,eax
 00513F2A    pop         edx
 00513F2B    pop         ecx
 00513F2C    pop         ecx
 00513F2D    mov         dword ptr fs:[eax],edx
>00513F30    jmp         005140A8
 00513F35    mov         edx,5141E4;'Default Background'
 00513F3A    mov         eax,dword ptr [ebp-24]
 00513F3D    call        TRegistry.ValueExists
 00513F42    test        al,al
>00513F44    je          00513F58
 00513F46    lea         ecx,[ebp-1C]
 00513F49    mov         edx,5141E4;'Default Background'
 00513F4E    mov         eax,dword ptr [ebp-24]
 00513F51    call        TRegistry.ReadString
>00513F56    jmp         00513F6F
 00513F58    call        @TryFinallyExit
 00513F5D    call        @TryFinallyExit
 00513F62    xor         eax,eax
 00513F64    pop         edx
 00513F65    pop         ecx
 00513F66    pop         ecx
 00513F67    mov         dword ptr fs:[eax],edx
>00513F6A    jmp         005140A8
 00513F6F    mov         eax,dword ptr [ebp-1C]
 00513F72    call        00513C84
 00513F77    test        al,al
>00513F79    je          00513F8D
 00513F7B    mov         eax,dword ptr [ebp+8]
 00513F7E    mov         eax,dword ptr [eax-4]
 00513F81    mov         edx,0FF000005
 00513F86    call        TmwHighLightAttributes.SetBackground
>00513F8B    jmp         00513F9F
 00513F8D    mov         edx,dword ptr [esi*4+786BD8]
 00513F94    mov         eax,dword ptr [ebp+8]
 00513F97    mov         eax,dword ptr [eax-4]
 00513F9A    call        TmwHighLightAttributes.SetBackground
 00513F9F    mov         eax,dword ptr [ebp-18]
 00513FA2    call        00513C84
 00513FA7    test        al,al
>00513FA9    je          00513FBD
 00513FAB    mov         eax,dword ptr [ebp+8]
 00513FAE    mov         eax,dword ptr [eax-4]
 00513FB1    mov         edx,0FF000008
 00513FB6    call        TmwHighLightAttributes.SetForeground
>00513FBB    jmp         00513FCF
 00513FBD    mov         edx,dword ptr [ebx*4+786BD8]
 00513FC4    mov         eax,dword ptr [ebp+8]
 00513FC7    mov         eax,dword ptr [eax-4]
 00513FCA    call        TmwHighLightAttributes.SetForeground
 00513FCF    mov         eax,dword ptr [ebp+8]
 00513FD2    mov         eax,dword ptr [eax-4]
 00513FD5    movzx       edx,byte ptr ds:[51420C];0x0 gvar_0051420C
 00513FDC    call        TmwHighLightAttributes.SetStyle
 00513FE1    mov         eax,dword ptr [ebp-0C]
 00513FE4    call        00513C84
 00513FE9    test        al,al
>00513FEB    je          00514008
 00513FED    mov         eax,dword ptr [ebp+8]
 00513FF0    mov         eax,dword ptr [eax-4]
 00513FF3    movzx       edx,byte ptr [eax+0C]
 00513FF7    or          dl,byte ptr ds:[514210];0x1 gvar_00514210
 00513FFD    mov         eax,dword ptr [ebp+8]
 00514000    mov         eax,dword ptr [eax-4]
 00514003    call        TmwHighLightAttributes.SetStyle
 00514008    mov         eax,dword ptr [ebp-10]
 0051400B    call        00513C84
 00514010    test        al,al
>00514012    je          0051402F
 00514014    mov         eax,dword ptr [ebp+8]
 00514017    mov         eax,dword ptr [eax-4]
 0051401A    movzx       edx,byte ptr [eax+0C]
 0051401E    or          dl,byte ptr ds:[514214];0x2 gvar_00514214
 00514024    mov         eax,dword ptr [ebp+8]
 00514027    mov         eax,dword ptr [eax-4]
 0051402A    call        TmwHighLightAttributes.SetStyle
 0051402F    mov         eax,dword ptr [ebp-14]
 00514032    call        00513C84
 00514037    test        al,al
>00514039    je          00514056
 0051403B    mov         eax,dword ptr [ebp+8]
 0051403E    mov         eax,dword ptr [eax-4]
 00514041    movzx       edx,byte ptr [eax+0C]
 00514045    or          dl,byte ptr ds:[514218];0x4 gvar_00514218
 0051404B    mov         eax,dword ptr [ebp+8]
 0051404E    mov         eax,dword ptr [eax-4]
 00514051    call        TmwHighLightAttributes.SetStyle
 00514056    mov         byte ptr [ebp-1D],1
 0051405A    xor         eax,eax
 0051405C    pop         edx
 0051405D    pop         ecx
 0051405E    pop         ecx
 0051405F    mov         dword ptr fs:[eax],edx
 00514062    push        514077
 00514067    mov         eax,dword ptr [ebp-24]
 0051406A    call        TRegistry.CloseKey
 0051406F    ret
>00514070    jmp         @HandleFinally
>00514075    jmp         00514067
 00514077    xor         eax,eax
 00514079    pop         edx
 0051407A    pop         ecx
 0051407B    pop         ecx
 0051407C    mov         dword ptr fs:[eax],edx
 0051407F    push        514094
 00514084    mov         eax,dword ptr [ebp-24]
 00514087    call        TObject.Free
 0051408C    ret
>0051408D    jmp         @HandleFinally
>00514092    jmp         00514084
 00514094    xor         eax,eax
 00514096    pop         edx
 00514097    pop         ecx
 00514098    pop         ecx
 00514099    mov         dword ptr fs:[eax],edx
>0051409C    jmp         005140A8
>0051409E    jmp         @HandleAnyException
 005140A3    call        @DoneExcept
 005140A8    xor         eax,eax
 005140AA    pop         edx
 005140AB    pop         ecx
 005140AC    pop         ecx
 005140AD    mov         dword ptr fs:[eax],edx
 005140B0    push        5140D2
 005140B5    lea         eax,[ebp-28]
 005140B8    call        @UStrClr
 005140BD    lea         eax,[ebp-1C]
 005140C0    mov         edx,7
 005140C5    call        @UStrArrayClr
 005140CA    ret
>005140CB    jmp         @HandleFinally
>005140D0    jmp         005140B5
 005140D2    movzx       eax,byte ptr [ebp-1D]
 005140D6    pop         edi
 005140D7    pop         esi
 005140D8    pop         ebx
 005140D9    mov         esp,ebp
 005140DB    pop         ebp
 005140DC    ret
end;*}

//0051421C
function TmwHighLightAttributes.LoadFromBorlandRegistry(rootKey:HKEY; attrKey:string; oldStyle:Boolean; attrName:string):Boolean;
begin
{*
 0051421C    push        ebp
 0051421D    mov         ebp,esp
 0051421F    add         esp,0FFFFFFF8
 00514222    push        ebx
 00514223    mov         dword ptr [ebp-8],ecx
 00514226    mov         ebx,edx
 00514228    mov         dword ptr [ebp-4],eax
 0051422B    mov         eax,dword ptr [ebp-8]
 0051422E    call        @UStrAddRef
 00514233    mov         eax,dword ptr [ebp+0C]
 00514236    call        @UStrAddRef
 0051423B    xor         eax,eax
 0051423D    push        ebp
 0051423E    push        514291
 00514243    push        dword ptr fs:[eax]
 00514246    mov         dword ptr fs:[eax],esp
 00514249    cmp         byte ptr [ebp+8],0
>0051424D    je          00514262
 0051424F    push        ebp
 00514250    mov         ecx,dword ptr [ebp+0C]
 00514253    mov         edx,dword ptr [ebp-8]
 00514256    mov         eax,ebx
 00514258    call        005139A4
 0051425D    pop         ecx
 0051425E    mov         ebx,eax
>00514260    jmp         00514273
 00514262    push        ebp
 00514263    mov         ecx,dword ptr [ebp+0C]
 00514266    mov         edx,dword ptr [ebp-8]
 00514269    mov         eax,ebx
 0051426B    call        00513D2C
 00514270    pop         ecx
 00514271    mov         ebx,eax
 00514273    xor         eax,eax
 00514275    pop         edx
 00514276    pop         ecx
 00514277    pop         ecx
 00514278    mov         dword ptr fs:[eax],edx
 0051427B    push        514298
 00514280    lea         eax,[ebp-8]
 00514283    call        @UStrClr
 00514288    lea         eax,[ebp+0C]
 0051428B    call        @UStrClr
 00514290    ret
>00514291    jmp         @HandleFinally
>00514296    jmp         00514280
 00514298    mov         eax,ebx
 0051429A    pop         ebx
 0051429B    pop         ecx
 0051429C    pop         ecx
 0051429D    pop         ebp
 0051429E    ret         8
*}
end;

//005142A4
procedure TmwHighLightAttributes.SetBackground(Value:TColor);
begin
{*
 005142A4    push        ebx
 005142A5    cmp         edx,dword ptr [eax+4];TmwHighLightAttributes.fBackground:TColor
>005142A8    je          005142BE
 005142AA    mov         dword ptr [eax+4],edx;TmwHighLightAttributes.fBackground:TColor
 005142AD    cmp         word ptr [eax+12],0;TmwHighLightAttributes.?f12:word
>005142B2    je          005142BE
 005142B4    mov         ebx,eax
 005142B6    mov         edx,eax
 005142B8    mov         eax,dword ptr [ebx+14];TmwHighLightAttributes.?f14:dword
 005142BB    call        dword ptr [ebx+10];TmwHighLightAttributes.fOnChange
 005142BE    pop         ebx
 005142BF    ret
*}
end;

//005142C0
procedure TmwHighLightAttributes.SetForeground(Value:TColor);
begin
{*
 005142C0    push        ebx
 005142C1    cmp         edx,dword ptr [eax+8];TmwHighLightAttributes.fForeground:TColor
>005142C4    je          005142DA
 005142C6    mov         dword ptr [eax+8],edx;TmwHighLightAttributes.fForeground:TColor
 005142C9    cmp         word ptr [eax+12],0;TmwHighLightAttributes.?f12:word
>005142CE    je          005142DA
 005142D0    mov         ebx,eax
 005142D2    mov         edx,eax
 005142D4    mov         eax,dword ptr [ebx+14];TmwHighLightAttributes.?f14:dword
 005142D7    call        dword ptr [ebx+10];TmwHighLightAttributes.fOnChange
 005142DA    pop         ebx
 005142DB    ret
*}
end;

//005142DC
procedure TmwHighLightAttributes.SetStyle(Value:TFontStyles);
begin
{*
 005142DC    push        ebx
 005142DD    push        ecx
 005142DE    mov         byte ptr [esp],dl
 005142E1    mov         ebx,eax
 005142E3    movzx       eax,byte ptr [esp]
 005142E7    cmp         al,byte ptr [ebx+0C];TmwHighLightAttributes.fStyle:TFontStyles
>005142EA    je          00514302
 005142EC    movzx       eax,byte ptr [esp]
 005142F0    mov         byte ptr [ebx+0C],al;TmwHighLightAttributes.fStyle:TFontStyles
 005142F3    cmp         word ptr [ebx+12],0;TmwHighLightAttributes.?f12:word
>005142F8    je          00514302
 005142FA    mov         edx,ebx
 005142FC    mov         eax,dword ptr [ebx+14];TmwHighLightAttributes.?f14:dword
 005142FF    call        dword ptr [ebx+10];TmwHighLightAttributes.fOnChange
 00514302    pop         edx
 00514303    pop         ebx
 00514304    ret
*}
end;

//00514308
function TmwHighLightAttributes.LoadFromRegistry(Reg:TBetterRegistry):Boolean;
begin
{*
 00514308    push        ebp
 00514309    mov         ebp,esp
 0051430B    push        0
 0051430D    push        0
 0051430F    push        ebx
 00514310    push        esi
 00514311    mov         ebx,edx
 00514313    mov         esi,eax
 00514315    xor         eax,eax
 00514317    push        ebp
 00514318    push        5143EA
 0051431D    push        dword ptr fs:[eax]
 00514320    mov         dword ptr fs:[eax],esp
 00514323    lea         eax,[ebp-4]
 00514326    mov         edx,dword ptr [ebx+10];TBetterRegistry.FCurrentPath:string
 00514329    call        @UStrLAsg
 0051432E    mov         edx,dword ptr [esi+18];TmwHighLightAttributes.fName:string
 00514331    mov         eax,ebx
 00514333    call        TRegistry.OpenKeyReadOnly
 00514338    test        al,al
>0051433A    je          005143CD
 00514340    mov         edx,514408;'Background'
 00514345    mov         eax,ebx
 00514347    call        TRegistry.ValueExists
 0051434C    test        al,al
>0051434E    je          00514365
 00514350    mov         edx,514408;'Background'
 00514355    mov         eax,ebx
 00514357    call        TRegistry.ReadInteger
 0051435C    mov         edx,eax
 0051435E    mov         eax,esi
 00514360    call        TmwHighLightAttributes.SetBackground
 00514365    mov         edx,51442C;'Foreground'
 0051436A    mov         eax,ebx
 0051436C    call        TRegistry.ValueExists
 00514371    test        al,al
>00514373    je          0051438A
 00514375    mov         edx,51442C;'Foreground'
 0051437A    mov         eax,ebx
 0051437C    call        TRegistry.ReadInteger
 00514381    mov         edx,eax
 00514383    mov         eax,esi
 00514385    call        TmwHighLightAttributes.SetForeground
 0051438A    mov         edx,514450;'Style'
 0051438F    mov         eax,ebx
 00514391    call        TRegistry.ValueExists
 00514396    test        al,al
>00514398    je          005143AF
 0051439A    mov         edx,514450;'Style'
 0051439F    mov         eax,ebx
 005143A1    call        TRegistry.ReadInteger
 005143A6    mov         edx,eax
 005143A8    mov         eax,esi
 005143AA    call        005145C4
 005143AF    lea         eax,[ebp-8]
 005143B2    mov         ecx,dword ptr [ebp-4]
 005143B5    mov         edx,514468;'\'
 005143BA    call        @UStrCat3
 005143BF    mov         edx,dword ptr [ebp-8]
 005143C2    mov         eax,ebx
 005143C4    call        TRegistry.OpenKeyReadOnly
 005143C9    mov         bl,1
>005143CB    jmp         005143CF
 005143CD    xor         ebx,ebx
 005143CF    xor         eax,eax
 005143D1    pop         edx
 005143D2    pop         ecx
 005143D3    pop         ecx
 005143D4    mov         dword ptr fs:[eax],edx
 005143D7    push        5143F1
 005143DC    lea         eax,[ebp-8]
 005143DF    mov         edx,2
 005143E4    call        @UStrArrayClr
 005143E9    ret
>005143EA    jmp         @HandleFinally
>005143EF    jmp         005143DC
 005143F1    mov         eax,ebx
 005143F3    pop         esi
 005143F4    pop         ebx
 005143F5    pop         ecx
 005143F6    pop         ecx
 005143F7    pop         ebp
 005143F8    ret
*}
end;

//0051446C
function TmwHighLightAttributes.SaveToRegistry(Reg:TBetterRegistry):Boolean;
begin
{*
 0051446C    push        ebp
 0051446D    mov         ebp,esp
 0051446F    push        0
 00514471    push        0
 00514473    push        ebx
 00514474    push        esi
 00514475    mov         ebx,edx
 00514477    mov         esi,eax
 00514479    xor         eax,eax
 0051447B    push        ebp
 0051447C    push        514512
 00514481    push        dword ptr fs:[eax]
 00514484    mov         dword ptr fs:[eax],esp
 00514487    lea         eax,[ebp-4]
 0051448A    mov         edx,dword ptr [ebx+10];TBetterRegistry.FCurrentPath:string
 0051448D    call        @UStrLAsg
 00514492    mov         cl,1
 00514494    mov         edx,dword ptr [esi+18];TmwHighLightAttributes.fName:string
 00514497    mov         eax,ebx
 00514499    call        TRegistry.OpenKey
 0051449E    test        al,al
>005144A0    je          005144F5
 005144A2    mov         ecx,dword ptr [esi+4];TmwHighLightAttributes.fBackground:TColor
 005144A5    mov         edx,514530;'Background'
 005144AA    mov         eax,ebx
 005144AC    call        TRegistry.WriteInteger
 005144B1    mov         ecx,dword ptr [esi+8];TmwHighLightAttributes.fForeground:TColor
 005144B4    mov         edx,514554;'Foreground'
 005144B9    mov         eax,ebx
 005144BB    call        TRegistry.WriteInteger
 005144C0    mov         eax,esi
 005144C2    call        00514594
 005144C7    mov         ecx,eax
 005144C9    mov         edx,514578;'Style'
 005144CE    mov         eax,ebx
 005144D0    call        TRegistry.WriteInteger
 005144D5    lea         eax,[ebp-8]
 005144D8    mov         ecx,dword ptr [ebp-4]
 005144DB    mov         edx,514590;'\'
 005144E0    call        @UStrCat3
 005144E5    mov         edx,dword ptr [ebp-8]
 005144E8    xor         ecx,ecx
 005144EA    mov         eax,ebx
 005144EC    call        TRegistry.OpenKey
 005144F1    mov         bl,1
>005144F3    jmp         005144F7
 005144F5    xor         ebx,ebx
 005144F7    xor         eax,eax
 005144F9    pop         edx
 005144FA    pop         ecx
 005144FB    pop         ecx
 005144FC    mov         dword ptr fs:[eax],edx
 005144FF    push        514519
 00514504    lea         eax,[ebp-8]
 00514507    mov         edx,2
 0051450C    call        @UStrArrayClr
 00514511    ret
>00514512    jmp         @HandleFinally
>00514517    jmp         00514504
 00514519    mov         eax,ebx
 0051451B    pop         esi
 0051451C    pop         ebx
 0051451D    pop         ecx
 0051451E    pop         ecx
 0051451F    pop         ebp
 00514520    ret
*}
end;

//00514594
{*function sub_00514594(?:TmwHighLightAttributes):?;
begin
 00514594    test        byte ptr [eax+0C],1;TmwHighLightAttributes.fStyle:TFontStyles
>00514598    je          005145A1
 0051459A    mov         edx,1
>0051459F    jmp         005145A3
 005145A1    xor         edx,edx
 005145A3    test        byte ptr [eax+0C],2;TmwHighLightAttributes.fStyle:TFontStyles
>005145A7    je          005145AC
 005145A9    add         edx,2
 005145AC    test        byte ptr [eax+0C],4;TmwHighLightAttributes.fStyle:TFontStyles
>005145B0    je          005145B5
 005145B2    add         edx,4
 005145B5    test        byte ptr [eax+0C],8;TmwHighLightAttributes.fStyle:TFontStyles
>005145B9    je          005145BE
 005145BB    add         edx,8
 005145BE    mov         eax,edx
 005145C0    ret
end;*}

//005145C4
procedure sub_005145C4(?:TmwHighLightAttributes; ?:Integer);
begin
{*
 005145C4    push        ebx
 005145C5    push        esi
 005145C6    mov         esi,edx
 005145C8    mov         ebx,eax
 005145CA    test        esi,1
>005145D0    jne         005145E2
 005145D2    movzx       edx,byte ptr ds:[514640];0x0 gvar_00514640
 005145D9    mov         eax,ebx
 005145DB    call        TmwHighLightAttributes.SetStyle
>005145E0    jmp         005145F0
 005145E2    movzx       edx,byte ptr ds:[514644];0x1 gvar_00514644
 005145E9    mov         eax,ebx
 005145EB    call        TmwHighLightAttributes.SetStyle
 005145F0    test        esi,2
>005145F6    je          00514609
 005145F8    movzx       edx,byte ptr ds:[514648];0x2 gvar_00514648
 005145FF    or          dl,byte ptr [ebx+0C];TmwHighLightAttributes.fStyle:TFontStyles
 00514602    mov         eax,ebx
 00514604    call        TmwHighLightAttributes.SetStyle
 00514609    test        esi,4
>0051460F    je          00514622
 00514611    movzx       edx,byte ptr ds:[51464C];0x4 gvar_0051464C
 00514618    or          dl,byte ptr [ebx+0C];TmwHighLightAttributes.fStyle:TFontStyles
 0051461B    mov         eax,ebx
 0051461D    call        TmwHighLightAttributes.SetStyle
 00514622    test        esi,8
>00514628    je          0051463B
 0051462A    movzx       edx,byte ptr ds:[514650];0x8 gvar_00514650
 00514631    or          dl,byte ptr [ebx+0C];TmwHighLightAttributes.fStyle:TFontStyles
 00514634    mov         eax,ebx
 00514636    call        TmwHighLightAttributes.SetStyle
 0051463B    pop         esi
 0051463C    pop         ebx
 0051463D    ret
*}
end;

//00514654
constructor TmwCustomHighLighter.Create(AOwner:TComponent);
begin
{*
 00514654    push        ebp
 00514655    mov         ebp,esp
 00514657    push        ecx
 00514658    push        ebx
 00514659    push        esi
 0051465A    test        dl,dl
>0051465C    je          00514666
 0051465E    add         esp,0FFFFFFF0
 00514661    call        @ClassCreate
 00514666    mov         byte ptr [ebp-1],dl
 00514669    mov         ebx,eax
 0051466B    xor         edx,edx
 0051466D    mov         eax,ebx
 0051466F    call        TComponent.Create
 00514674    mov         dl,1
 00514676    mov         eax,[0043C7BC];TStringList
 0051467B    call        TStringList.Create;TStringList.Create
 00514680    mov         esi,eax
 00514682    mov         dword ptr [ebx+34],esi;TmwCustomHighLighter.fAttributes:TStringList
 00514685    mov         byte ptr [esi+39],2;TStringList.FDuplicates:TDuplicates
 00514689    mov         eax,esi
 0051468B    mov         dl,1
 0051468D    call        TStringList.SetSorted
 00514692    mov         ecx,ebx
 00514694    mov         dl,1
 00514696    mov         eax,[00511530];TmwNotifyEventChain
 0051469B    call        TmwNotifyEventChain.Create;TmwNotifyEventChain.Create
 005146A0    mov         dword ptr [ebx+38],eax;TmwCustomHighLighter.fAttrChangeHooks:TmwNotifyEventChain
 005146A3    lea         eax,[ebx+4C];TmwCustomHighLighter.fDefaultFilter:string
 005146A6    call        @UStrClr
 005146AB    mov         eax,ebx
 005146AD    cmp         byte ptr [ebp-1],0
>005146B1    je          005146C2
 005146B3    call        @AfterConstruction
 005146B8    pop         dword ptr fs:[0]
 005146BF    add         esp,0C
 005146C2    mov         eax,ebx
 005146C4    pop         esi
 005146C5    pop         ebx
 005146C6    pop         ecx
 005146C7    pop         ebp
 005146C8    ret
*}
end;

//005146CC
destructor TmwCustomHighLighter.Destroy();
begin
{*
 005146CC    push        ebx
 005146CD    push        esi
 005146CE    push        edi
 005146CF    call        @BeforeDestruction
 005146D4    mov         ebx,edx
 005146D6    mov         esi,eax
 005146D8    mov         eax,dword ptr [esi+34];TmwCustomHighLighter.fAttributes:TStringList
 005146DB    mov         edx,dword ptr [eax]
 005146DD    call        dword ptr [edx+14];TStringList.GetCount
 005146E0    mov         edi,eax
 005146E2    dec         edi
 005146E3    cmp         edi,0
>005146E6    jl          005146FD
 005146E8    mov         eax,dword ptr [esi+34];TmwCustomHighLighter.fAttributes:TStringList
 005146EB    mov         edx,edi
 005146ED    mov         ecx,dword ptr [eax]
 005146EF    call        dword ptr [ecx+18];TStringList.GetObject
 005146F2    call        TObject.Free
 005146F7    dec         edi
 005146F8    cmp         edi,0FFFFFFFF
>005146FB    jne         005146E8
 005146FD    mov         eax,dword ptr [esi+34];TmwCustomHighLighter.fAttributes:TStringList
 00514700    call        TObject.Free
 00514705    mov         eax,dword ptr [esi+38];TmwCustomHighLighter.fAttrChangeHooks:TmwNotifyEventChain
 00514708    call        TObject.Free
 0051470D    mov         edx,ebx
 0051470F    and         dl,0FC
 00514712    mov         eax,esi
 00514714    call        TComponent.Destroy
 00514719    test        bl,bl
>0051471B    jle         00514724
 0051471D    mov         eax,esi
 0051471F    call        @ClassDestroy
 00514724    pop         edi
 00514725    pop         esi
 00514726    pop         ebx
 00514727    ret
*}
end;

//00514728
procedure TmwCustomHighLighter.EnumUserSettings(settings:TStrings);
begin
{*
 00514728    push        esi
 00514729    mov         esi,edx
 0051472B    mov         eax,esi
 0051472D    mov         edx,dword ptr [eax]
 0051472F    call        dword ptr [edx+44];TStrings.Clear
 00514732    pop         esi
 00514733    ret
*}
end;

//00514734
function TmwCustomHighLighter.UseUserSettings(settingIndex:Integer):Boolean;
begin
{*
 00514734    xor         eax,eax
 00514736    ret
*}
end;

//00514738
{*procedure sub_00514738(?:?);
begin
 00514738    push        esi
 00514739    push        edi
 0051473A    mov         edi,edx
 0051473C    mov         esi,51474C
 00514741    mov         ecx,8
 00514746    rep movs    dword ptr [edi],dword ptr [esi]
 00514748    pop         edi
 00514749    pop         esi
 0051474A    ret
end;*}

//0051476C
procedure TmwCustomHighLighter.NextToEol;
begin
{*
 0051476C    push        ebx
 0051476D    mov         ebx,eax
>0051476F    jmp         00514778
 00514771    mov         eax,ebx
 00514773    mov         edx,dword ptr [eax]
 00514775    call        dword ptr [edx+70];TmwCustomHighLighter.Next
 00514778    mov         eax,ebx
 0051477A    mov         edx,dword ptr [eax]
 0051477C    call        dword ptr [edx+58];TmwCustomHighLighter.GetEol
 0051477F    test        al,al
>00514781    je          00514771
 00514783    pop         ebx
 00514784    ret
*}
end;

//00514788
procedure TmwCustomHighLighter.ScanAllLineTokens(Value:string; LineNumber:Integer);
begin
{*
 00514788    push        ebp
 00514789    mov         ebp,esp
 0051478B    add         esp,0FFFFFFF8
 0051478E    push        ebx
 0051478F    push        esi
 00514790    xor         ebx,ebx
 00514792    mov         dword ptr [ebp-4],ebx
 00514795    mov         dword ptr [ebp-8],ecx
 00514798    mov         esi,eax
 0051479A    xor         eax,eax
 0051479C    push        ebp
 0051479D    push        514816
 005147A2    push        dword ptr fs:[eax]
 005147A5    mov         dword ptr fs:[eax],esp
 005147A8    mov         ecx,dword ptr [ebp-8]
 005147AB    mov         eax,esi
 005147AD    mov         ebx,dword ptr [eax]
 005147AF    call        dword ptr [ebx+74];TmwCustomHighLighter.SetLine
>005147B2    jmp         005147F5
 005147B4    cmp         word ptr [esi+42],0;TmwCustomHighLighter.?f42:word
>005147B9    je          005147EE
 005147BB    lea         edx,[ebp-4]
 005147BE    mov         eax,esi
 005147C0    mov         ecx,dword ptr [eax]
 005147C2    call        dword ptr [ecx+60];TmwCustomHighLighter.GetToken
 005147C5    mov         ebx,dword ptr [ebp-4]
 005147C8    test        ebx,ebx
>005147CA    je          005147D1
 005147CC    sub         ebx,4
 005147CF    mov         ebx,dword ptr [ebx]
 005147D1    test        ebx,ebx
>005147D3    jle         005147EE
 005147D5    mov         eax,dword ptr [ebp-4]
 005147D8    push        eax
 005147D9    mov         eax,dword ptr [ebp-8]
 005147DC    push        eax
 005147DD    mov         eax,esi
 005147DF    mov         edx,dword ptr [eax]
 005147E1    call        dword ptr [edx+68];TmwCustomHighLighter.GetTokenKind
 005147E4    mov         ecx,eax
 005147E6    mov         edx,esi
 005147E8    mov         eax,dword ptr [esi+44];TmwCustomHighLighter.?f44:dword
 005147EB    call        dword ptr [esi+40];TmwCustomHighLighter.fOnToken
 005147EE    mov         eax,esi
 005147F0    mov         edx,dword ptr [eax]
 005147F2    call        dword ptr [edx+70];TmwCustomHighLighter.Next
 005147F5    mov         eax,esi
 005147F7    mov         edx,dword ptr [eax]
 005147F9    call        dword ptr [edx+58];TmwCustomHighLighter.GetEol
 005147FC    test        al,al
>005147FE    je          005147B4
 00514800    xor         eax,eax
 00514802    pop         edx
 00514803    pop         ecx
 00514804    pop         ecx
 00514805    mov         dword ptr fs:[eax],edx
 00514808    push        51481D
 0051480D    lea         eax,[ebp-4]
 00514810    call        @UStrClr
 00514815    ret
>00514816    jmp         @HandleFinally
>0051481B    jmp         0051480D
 0051481D    pop         esi
 0051481E    pop         ebx
 0051481F    pop         ecx
 00514820    pop         ecx
 00514821    pop         ebp
 00514822    ret
*}
end;

//00514824
function TmwCustomHighLighter.LoadFromRegistry(RootKey:HKEY; Key:string):Boolean;
begin
{*
 00514824    push        ebp
 00514825    mov         ebp,esp
 00514827    add         esp,0FFFFFFF4
 0051482A    push        ebx
 0051482B    push        esi
 0051482C    push        edi
 0051482D    mov         dword ptr [ebp-4],ecx
 00514830    mov         ebx,edx
 00514832    mov         edi,eax
 00514834    mov         eax,dword ptr [ebp-4]
 00514837    call        @UStrAddRef
 0051483C    xor         eax,eax
 0051483E    push        ebp
 0051483F    push        5148F6
 00514844    push        dword ptr fs:[eax]
 00514847    mov         dword ptr fs:[eax],esp
 0051484A    mov         dl,1
 0051484C    mov         eax,[005124F0];TBetterRegistry
 00514851    call        TRegistry.Create;TBetterRegistry.Create
 00514856    mov         dword ptr [ebp-0C],eax
 00514859    xor         eax,eax
 0051485B    push        ebp
 0051485C    push        5148D9
 00514861    push        dword ptr fs:[eax]
 00514864    mov         dword ptr fs:[eax],esp
 00514867    mov         edx,ebx
 00514869    mov         eax,dword ptr [ebp-0C]
 0051486C    call        TRegistry.SetRootKey
 00514871    mov         edx,dword ptr [ebp-4]
 00514874    mov         eax,dword ptr [ebp-0C]
 00514877    call        TRegistry.OpenKeyReadOnly
 0051487C    test        al,al
>0051487E    je          005148BF
 00514880    mov         byte ptr [ebp-5],1
 00514884    mov         eax,edi
 00514886    mov         edx,dword ptr [eax]
 00514888    call        dword ptr [edx+38];TmwCustomHighLighter.sub_00514A10
 0051488B    mov         ebx,eax
 0051488D    dec         ebx
 0051488E    test        ebx,ebx
>00514890    jl          005148C3
 00514892    inc         ebx
 00514893    xor         esi,esi
 00514895    cmp         byte ptr [ebp-5],0
>00514899    je          005148B0
 0051489B    mov         edx,esi
 0051489D    mov         eax,edi
 0051489F    mov         ecx,dword ptr [eax]
 005148A1    call        dword ptr [ecx+3C];TmwCustomHighLighter.sub_00514A1C
 005148A4    mov         edx,dword ptr [ebp-0C]
 005148A7    call        TmwHighLightAttributes.LoadFromRegistry
 005148AC    test        al,al
>005148AE    jne         005148B4
 005148B0    xor         eax,eax
>005148B2    jmp         005148B6
 005148B4    mov         al,1
 005148B6    mov         byte ptr [ebp-5],al
 005148B9    inc         esi
 005148BA    dec         ebx
>005148BB    jne         00514895
>005148BD    jmp         005148C3
 005148BF    mov         byte ptr [ebp-5],0
 005148C3    xor         eax,eax
 005148C5    pop         edx
 005148C6    pop         ecx
 005148C7    pop         ecx
 005148C8    mov         dword ptr fs:[eax],edx
 005148CB    push        5148E0
 005148D0    mov         eax,dword ptr [ebp-0C]
 005148D3    call        TObject.Free
 005148D8    ret
>005148D9    jmp         @HandleFinally
>005148DE    jmp         005148D0
 005148E0    xor         eax,eax
 005148E2    pop         edx
 005148E3    pop         ecx
 005148E4    pop         ecx
 005148E5    mov         dword ptr fs:[eax],edx
 005148E8    push        5148FD
 005148ED    lea         eax,[ebp-4]
 005148F0    call        @UStrClr
 005148F5    ret
>005148F6    jmp         @HandleFinally
>005148FB    jmp         005148ED
 005148FD    movzx       eax,byte ptr [ebp-5]
 00514901    pop         edi
 00514902    pop         esi
 00514903    pop         ebx
 00514904    mov         esp,ebp
 00514906    pop         ebp
 00514907    ret
*}
end;

//00514908
function TmwCustomHighLighter.SaveToRegistry(RootKey:HKEY; Key:string):Boolean;
begin
{*
 00514908    push        ebp
 00514909    mov         ebp,esp
 0051490B    add         esp,0FFFFFFF4
 0051490E    push        ebx
 0051490F    push        esi
 00514910    push        edi
 00514911    mov         dword ptr [ebp-4],ecx
 00514914    mov         ebx,edx
 00514916    mov         edi,eax
 00514918    mov         eax,dword ptr [ebp-4]
 0051491B    call        @UStrAddRef
 00514920    xor         eax,eax
 00514922    push        ebp
 00514923    push        5149DC
 00514928    push        dword ptr fs:[eax]
 0051492B    mov         dword ptr fs:[eax],esp
 0051492E    mov         dl,1
 00514930    mov         eax,[005124F0];TBetterRegistry
 00514935    call        TRegistry.Create;TBetterRegistry.Create
 0051493A    mov         dword ptr [ebp-0C],eax
 0051493D    xor         eax,eax
 0051493F    push        ebp
 00514940    push        5149BF
 00514945    push        dword ptr fs:[eax]
 00514948    mov         dword ptr fs:[eax],esp
 0051494B    mov         edx,ebx
 0051494D    mov         eax,dword ptr [ebp-0C]
 00514950    call        TRegistry.SetRootKey
 00514955    mov         cl,1
 00514957    mov         edx,dword ptr [ebp-4]
 0051495A    mov         eax,dword ptr [ebp-0C]
 0051495D    call        TRegistry.OpenKey
 00514962    test        al,al
>00514964    je          005149A5
 00514966    mov         byte ptr [ebp-5],1
 0051496A    mov         eax,edi
 0051496C    mov         edx,dword ptr [eax]
 0051496E    call        dword ptr [edx+38];TmwCustomHighLighter.sub_00514A10
 00514971    mov         ebx,eax
 00514973    dec         ebx
 00514974    test        ebx,ebx
>00514976    jl          005149A9
 00514978    inc         ebx
 00514979    xor         esi,esi
 0051497B    cmp         byte ptr [ebp-5],0
>0051497F    je          00514996
 00514981    mov         edx,esi
 00514983    mov         eax,edi
 00514985    mov         ecx,dword ptr [eax]
 00514987    call        dword ptr [ecx+3C];TmwCustomHighLighter.sub_00514A1C
 0051498A    mov         edx,dword ptr [ebp-0C]
 0051498D    call        TmwHighLightAttributes.SaveToRegistry
 00514992    test        al,al
>00514994    jne         0051499A
 00514996    xor         eax,eax
>00514998    jmp         0051499C
 0051499A    mov         al,1
 0051499C    mov         byte ptr [ebp-5],al
 0051499F    inc         esi
 005149A0    dec         ebx
>005149A1    jne         0051497B
>005149A3    jmp         005149A9
 005149A5    mov         byte ptr [ebp-5],0
 005149A9    xor         eax,eax
 005149AB    pop         edx
 005149AC    pop         ecx
 005149AD    pop         ecx
 005149AE    mov         dword ptr fs:[eax],edx
 005149B1    push        5149C6
 005149B6    mov         eax,dword ptr [ebp-0C]
 005149B9    call        TObject.Free
 005149BE    ret
>005149BF    jmp         @HandleFinally
>005149C4    jmp         005149B6
 005149C6    xor         eax,eax
 005149C8    pop         edx
 005149C9    pop         ecx
 005149CA    pop         ecx
 005149CB    mov         dword ptr fs:[eax],edx
 005149CE    push        5149E3
 005149D3    lea         eax,[ebp-4]
 005149D6    call        @UStrClr
 005149DB    ret
>005149DC    jmp         @HandleFinally
>005149E1    jmp         005149D3
 005149E3    movzx       eax,byte ptr [ebp-5]
 005149E7    pop         edi
 005149E8    pop         esi
 005149E9    pop         ebx
 005149EA    mov         esp,ebp
 005149EC    pop         ebp
 005149ED    ret
*}
end;

//005149F0
procedure sub_005149F0(?:TmwCarlSampleSyn; ?:TmwHighLightAttributes);
begin
{*
 005149F0    push        ebx
 005149F1    push        esi
 005149F2    mov         esi,eax
 005149F4    mov         ecx,edx
 005149F6    mov         eax,dword ptr [esi+34]
 005149F9    mov         edx,dword ptr [edx+18]
 005149FC    mov         ebx,dword ptr [eax]
 005149FE    call        dword ptr [ebx+3C]
 00514A01    pop         esi
 00514A02    pop         ebx
 00514A03    ret
*}
end;

//00514A10
procedure sub_00514A10;
begin
{*
 00514A10    mov         eax,dword ptr [eax+34];TmwCustomHighLighter.fAttributes:TStringList
 00514A13    mov         edx,dword ptr [eax]
 00514A15    call        dword ptr [edx+14];TStringList.GetCount
 00514A18    ret
*}
end;

//00514A1C
{*function sub_00514A1C(?:?):?;
begin
 00514A1C    push        ebx
 00514A1D    push        esi
 00514A1E    push        edi
 00514A1F    mov         esi,edx
 00514A21    mov         ebx,eax
 00514A23    xor         edi,edi
 00514A25    test        esi,esi
>00514A27    jl          00514A41
 00514A29    mov         eax,dword ptr [ebx+34];TmwCustomHighLighter.fAttributes:TStringList
 00514A2C    mov         edx,dword ptr [eax]
 00514A2E    call        dword ptr [edx+14];TStringList.GetCount
 00514A31    cmp         esi,eax
>00514A33    jge         00514A41
 00514A35    mov         edx,esi
 00514A37    mov         eax,dword ptr [ebx+34];TmwCustomHighLighter.fAttributes:TStringList
 00514A3A    mov         ecx,dword ptr [eax]
 00514A3C    call        dword ptr [ecx+18];TStringList.GetObject
 00514A3F    mov         edi,eax
 00514A41    mov         eax,edi
 00514A43    pop         edi
 00514A44    pop         esi
 00514A45    pop         ebx
 00514A46    ret
end;*}

//00514A48
{*procedure sub_00514A48(?:TmwCarlSampleSyn; ?:?; ?:?);
begin
 00514A48    push        ebp
 00514A49    mov         ebp,esp
 00514A4B    push        ebx
 00514A4C    push        esi
 00514A4D    mov         esi,eax
 00514A4F    mov         eax,dword ptr [esi+34]
 00514A52    mov         edx,dword ptr [eax]
 00514A54    call        dword ptr [edx+14]
 00514A57    mov         ebx,eax
 00514A59    dec         ebx
 00514A5A    cmp         ebx,0
>00514A5D    jl          00514A7F
 00514A5F    mov         eax,dword ptr [esi+34]
 00514A62    mov         edx,ebx
 00514A64    mov         ecx,dword ptr [eax]
 00514A66    call        dword ptr [ecx+18]
 00514A69    test        eax,eax
>00514A6B    je          00514A79
 00514A6D    mov         edx,dword ptr [ebp+8]
 00514A70    mov         dword ptr [eax+10],edx
 00514A73    mov         edx,dword ptr [ebp+0C]
 00514A76    mov         dword ptr [eax+14],edx
 00514A79    dec         ebx
 00514A7A    cmp         ebx,0FFFFFFFF
>00514A7D    jne         00514A5F
 00514A7F    pop         esi
 00514A80    pop         ebx
 00514A81    pop         ebp
 00514A82    ret         8
end;*}

//00514A88
function TmwCustomHighLighter.GetCapability:THighlighterCapability;
begin
{*
 00514A88    movzx       eax,byte ptr ds:[514A90];0x2 gvar_00514A90
 00514A8F    ret
*}
end;

//00514A94
{*procedure TmwCustomHighLighter.GetLanguageName(?:?);
begin
 00514A94    push        ebx
 00514A95    mov         ebx,edx
 00514A97    mov         eax,ebx
 00514A99    mov         edx,514AB4;'<Unknown>'
 00514A9E    call        @UStrAsg
 00514AA3    pop         ebx
 00514AA4    ret
end;*}

//00514AC8
{*procedure TmwCustomHighLighter.GetDefaultFilter(?:?);
begin
 00514AC8    push        ebx
 00514AC9    push        esi
 00514ACA    mov         esi,edx
 00514ACC    mov         ebx,eax
 00514ACE    mov         eax,esi
 00514AD0    mov         edx,dword ptr [ebx+4C];TmwCustomHighLighter.fDefaultFilter:string
 00514AD3    call        @UStrAsg
 00514AD8    pop         esi
 00514AD9    pop         ebx
 00514ADA    ret
end;*}

//00514ADC
procedure TmwCustomHighLighter.SetDefaultFilter(Value:string);
begin
{*
 00514ADC    push        ebp
 00514ADD    mov         ebp,esp
 00514ADF    push        ecx
 00514AE0    push        ebx
 00514AE1    mov         dword ptr [ebp-4],edx
 00514AE4    mov         ebx,eax
 00514AE6    mov         eax,dword ptr [ebp-4]
 00514AE9    call        @UStrAddRef
 00514AEE    xor         eax,eax
 00514AF0    push        ebp
 00514AF1    push        514B2A
 00514AF6    push        dword ptr fs:[eax]
 00514AF9    mov         dword ptr fs:[eax],esp
 00514AFC    mov         eax,dword ptr [ebx+4C];TmwCustomHighLighter.fDefaultFilter:string
 00514AFF    mov         edx,dword ptr [ebp-4]
 00514B02    call        @UStrEqual
>00514B07    je          00514B14
 00514B09    lea         eax,[ebx+4C];TmwCustomHighLighter.fDefaultFilter:string
 00514B0C    mov         edx,dword ptr [ebp-4]
 00514B0F    call        @UStrAsg
 00514B14    xor         eax,eax
 00514B16    pop         edx
 00514B17    pop         ecx
 00514B18    pop         ecx
 00514B19    mov         dword ptr fs:[eax],edx
 00514B1C    push        514B31
 00514B21    lea         eax,[ebp-4]
 00514B24    call        @UStrClr
 00514B29    ret
>00514B2A    jmp         @HandleFinally
>00514B2F    jmp         00514B21
 00514B31    pop         ebx
 00514B32    pop         ecx
 00514B33    pop         ebp
 00514B34    ret
*}
end;

//00514B38
{*procedure TmwCustomHighLighter.HookAttrChangeEvent(ANotifyEvent:TNotifyEvent; ?:?);
begin
 00514B38    push        ebp
 00514B39    mov         ebp,esp
 00514B3B    push        dword ptr [ebp+0C]
 00514B3E    push        dword ptr [ebp+8]
 00514B41    mov         eax,dword ptr [eax+38];TmwCustomHighLighter.fAttrChangeHooks:TmwNotifyEventChain
 00514B44    call        TmwNotifyEventChain.Add
 00514B49    pop         ebp
 00514B4A    ret         8
end;*}

//00514B50
{*procedure TmwCustomHighLighter.UnhookAttrChangeEvent(ANotifyEvent:TNotifyEvent; ?:?);
begin
 00514B50    push        ebp
 00514B51    mov         ebp,esp
 00514B53    push        dword ptr [ebp+0C]
 00514B56    push        dword ptr [ebp+8]
 00514B59    mov         eax,dword ptr [eax+38];TmwCustomHighLighter.fAttrChangeHooks:TmwNotifyEventChain
 00514B5C    call        TmwNotifyEventChain.Remove
 00514B61    pop         ebp
 00514B62    ret         8
end;*}

Initialization
//00780DB8
{*
 00780DB8    sub         dword ptr ds:[793B10],1
>00780DBF    jae         00780DD2
 00780DC1    mov         dl,1
 00780DC3    mov         eax,[005134A0];THighlighterList
 00780DC8    call        THighlighterList.Create;THighlighterList.Create
 00780DCD    mov         [00793B14],eax;gvar_00793B14:THighlighterList
 00780DD2    ret
*}
Finalization
end.