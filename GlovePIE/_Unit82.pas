//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit82;

interface

uses
  SysUtils, Classes, mwSupportClasses, mwHighlighter, PieScanner, mwCarlSample;

type
  TTokenKind = (tkNone, tkWhiteSpace, tkComment, tkIdentifier, tkMultiplyIdentifier, tkUnit, tkStringLiteral, tkUnterminatedString, tkIntegerLiteral, tkRealLiteral, tkHexLiteral, tkTrue, tkFalse, tkNIL, tkNULL, tkIntegerSuperscript, tkLeftParen, tkRightParen, tkLSquare, tkRSquare, tkLCurly, tkRCurly, tkComma, tkSemicolon, tkColon, tkQuestion, tkDotDotDot, tkDotDot, tkDotProduct, tkDot, tkApS, tkOf, tkScope, tkPointerScope, tkPlus, tkMinus, tkStar, tkSlash, tkDIV, tkMOD, tkSHL, tkSHR, tkAt, tkAmpersand, tkCaret, tkStarStar, tkPercent, tkExclaim, tkDoubleFactorial, tkDotPlus, tkDotMinus, tkDotTimes, tkDotDivide, tkDotPower, tkTranspose, tkDotEquals, tkAssign, tkPlusEq, tkMinusEq, tkTimesEq, tkDivideEq, tkPlusPlus, tkMinusMinus, tkImplies, tkOR, tkAND, tkXOR, tkNOT, tkBUT, tkEITHER, tkNEITHER, tkNOR, tkAndAnd, tkOrOr, tkBar, tkEquals, tkLT, tkGT, tkEQ, tkNE, tkLE, tkGE, tkAE, tkNAE, tkLA, tkLAE, tkGAE, tkGA, tkTilde, tkDO, tkTO, tkIS, tkISNT, tkEND, tkIN, tkIF, tkTHEN, tkELSE, tkELSEIF, tkENDIF, tkWHILE, tkFOR, tkREPEAT, tkUNTIL, tkBIS, tkDEN, tkPER, tkError, tkEOL, tkEOF);
  TToken = TToken = record//size=18
f4:string;//f4
end;
kind:TTokenKind;//f0
value:string;//f4
IntValue:Int64;//f8
RealValue:Double;//f10
end;;
  TScannerState = TScannerState = record//size=28
f0:TToken;//f0
end;
token:TToken;//f0
index:Integer;//f18
LineNumber:Integer;//f1C
SkippedFirstWhiteSpace:Boolean;//f20
InComment:Boolean;//f21
BracketLevel:Integer;//f24
end;;
  ECompiler = class(Exception)
  end;
  ETokenExpected = class(ECompiler)
  end;
  TScanner = class(TObject)
  published
    function ReadIdentifier(id:string):Boolean;//0057F09C
    function read(TokenKind:TTokenKind):Boolean;//0057DEF8
    procedure ExpectIdentifier(id:string);//0057F124
    procedure expect(TokenKind:TTokenKind);//0057DF10
    function EOF:Boolean;//0057DEF0
    //function NextLine:?;//0057B114
    procedure Next;//0057B268
    constructor Create(TextOfFile:string);//0057DD78
    procedure Reset;//0057DD4C
  public
    s:string;//f4
    token:TToken;//f8
    LineNumber:Integer;//f20
    Index:Integer;//f24
    ScanWhiteSpace:Boolean;//f28
    SkippedFirstWhiteSpace:Boolean;//f29
    InComment:Boolean;//f2A
    BracketLevel:Integer;//f2C
  end;
  TRangeState = (rsUnknown, rsSlashStarComment, rsPascal);
  TmwCarlSampleSyn = class(TmwCustomHighLighter)
  published
    function GetTokenAttribute:TmwHighLightAttributes;//005801F4
    function GetTokenKind:Integer;//005804AC
    procedure SetLineForExport(NewValue:string);//00580564
    //procedure GetToken(?:?);//005801B8
    procedure SetRange(Value:Pointer);//005804D0
    procedure ReSetRange;//005804C4
    function GetTokenPos:Integer;//005804BC
    procedure Next;//00580110
    constructor Create(AOwner:TComponent);//0057FBC8
    function GetDefaultAttribute(Index:Integer):TmwHighLightAttributes;//00580168
    function GetCapability:THighlighterCapability;//00580548
    //procedure GetLanguageName(?:?);//00580518
    procedure SetLine(NewValue:string; LineNumber:Integer);//00580070
    procedure ExportNext;//00580600
    function GetEol:Boolean;//00580184
    function GetRange:Pointer;//0058019C
  public
    fLanguage:Pointer;//f50
    fRange:TRangeState;//f51
    fTokenPos:Integer;//f54
    FTokenID:TTokenKind;//f58
    fCommentAttri:TmwHighLightAttributes;//f5C
    fIdentifierAttri:TmwHighLightAttributes;//f60
    fKeyAttri:TmwHighLightAttributes;//f64
    fSpaceAttri:TmwHighLightAttributes;//f68
    fStringAttri:TmwHighLightAttributes;//f6C
    fConstantAttri:TmwHighLightAttributes;//f70
    fOpperatorAttri:TmwHighLightAttributes;//f74
    fScopeAttri:TmwHighLightAttributes;//f78
    fSymbol0Attri:TmwHighLightAttributes;//f7C
    fSymbol1Attri:TmwHighLightAttributes;//f80
    fContinueAttri:TmwHighLightAttributes;//f84
    fUnitsAttri:TmwHighLightAttributes;//f88
    fErrorAttri:TmwHighLightAttributes;//f8C
    s:TScanner;//f90
    constructor Create(AOwner:TComponent); virtual;//v2C//0057FBC8
    //procedure v34(?:?); virtual;//v34//005804E4
    function GetDefaultAttribute(Index:Integer):TmwHighLightAttributes; virtual;//v40//00580168
    function GetCapability:THighlighterCapability; virtual;//v4C//00580548
    //procedure GetLanguageName(?:?); virtual;//v50//00580518
    procedure ExportNext; virtual;//v54//00580600
    function GetEol:Boolean; virtual;//v58//00580184
    function GetRange:Pointer; virtual;//v5C//0058019C
    //procedure GetToken(?:?); virtual;//v60//005801B8
    function GetTokenAttribute:TmwHighLightAttributes; virtual;//v64//005801F4
    function GetTokenKind:Integer; virtual;//v68//005804AC
    function GetTokenPos:Integer; virtual;//v6C//005804BC
    procedure Next; virtual;//v70//00580110
    procedure SetLine(NewValue:string; LineNumber:Integer); virtual;//v74//00580070
    procedure SetLineForExport(NewValue:string); virtual;//v78//00580564
    procedure SetRange(Value:Pointer); virtual;//v7C//005804D0
    procedure ReSetRange; virtual;//v80//005804C4
  end;
    //function sub_00577428:?;//00577428
    //function sub_00577430(?:?):Boolean;//00577430
    //function sub_00577450(?:string; ?:Integer):?;//00577450
    //function sub_00577478(?:string; ?:Integer):?;//00577478
    //procedure sub_005774A4(?:?; ?:?);//005774A4
    //function sub_00577538(?:?):?;//00577538
    //function sub_00577558(?:?):?;//00577558
    //function sub_00577564(?:?):?;//00577564
    //function sub_0057759C(?:?):?;//0057759C
    //function sub_005775CC(?:string; ?:Integer):?;//005775CC
    //function sub_00577670(?:string; ?:Integer):?;//00577670
    //function sub_005776EC(?:string; ?:Integer):?;//005776EC
    //function sub_00577768(?:string; ?:Integer):?;//00577768
    //function sub_005777F4(?:string; ?:Integer):?;//005777F4
    //function sub_00577860(?:string; ?:Integer):?;//00577860
    //function sub_005778CC(?:string; ?:Integer):?;//005778CC
    //function sub_00577994(?:string; ?:Integer):?;//00577994
    //function sub_00577A40(?:?):?;//00577A40
    //function sub_00577A9C(?:?):?;//00577A9C
    //function sub_00577B3C(?:?):?;//00577B3C
    //function sub_00577B84(?:?):?;//00577B84
    //function sub_00579B98(?:?):?;//00579B98
    //function sub_00579BBC(?:?):?;//00579BBC
    procedure sub_00579D54(?:TScanner);//00579D54
    //procedure sub_00579E5C(?:TScanner; ?:?);//00579E5C
    procedure sub_0057DEA0(?:TScanner; ?:UString);//0057DEA0
    //procedure sub_0057DFFC(?:TTokenKind; ?:?);//0057DFFC
    //procedure sub_0057F00C(?:?; ?:?);//0057F00C
    //procedure sub_005804E4(?:?);//005804E4

implementation

//00577428
{*function sub_00577428:?;
begin
 00577428    call        TCharacter.IsWhiteSpace
 0057742D    ret
end;*}

//00577430
{*function sub_00577430(?:?):Boolean;
begin
 00577430    push        ebx
 00577431    push        esi
 00577432    mov         ebx,eax
 00577434    mov         esi,ebx
 00577436    mov         eax,esi
 00577438    call        TCharacter.IsLetterOrDigit
 0057743D    test        al,al
>0057743F    je          00577446
 00577441    mov         al,1
 00577443    pop         esi
 00577444    pop         ebx
 00577445    ret
 00577446    cmp         si,5F
 0057744A    sete        al
 0057744D    pop         esi
 0057744E    pop         ebx
 0057744F    ret
end;*}

//00577450
{*function sub_00577450(?:string; ?:Integer):?;
begin
 00577450    test        edx,edx
>00577452    jle         00577466
 00577454    mov         ecx,eax
 00577456    test        ecx,ecx
>00577458    je          0057745F
 0057745A    sub         ecx,4
 0057745D    mov         ecx,dword ptr [ecx]
 0057745F    cmp         ecx,edx
 00577461    setge       cl
>00577464    jmp         00577468
 00577466    xor         ecx,ecx
 00577468    test        cl,cl
>0057746A    je          00577472
 0057746C    movzx       eax,word ptr [eax+edx*2-2]
 00577471    ret
 00577472    xor         eax,eax
 00577474    ret
end;*}

//00577478
{*function sub_00577478(?:string; ?:Integer):?;
begin
 00577478    test        edx,edx
>0057747A    jle         0057748E
 0057747C    mov         ecx,eax
 0057747E    test        ecx,ecx
>00577480    je          00577487
 00577482    sub         ecx,4
 00577485    mov         ecx,dword ptr [ecx]
 00577487    cmp         ecx,edx
 00577489    setge       cl
>0057748C    jmp         00577490
 0057748E    xor         ecx,ecx
 00577490    test        cl,cl
>00577492    je          0057749F
 00577494    movzx       eax,word ptr [eax+edx*2-2]
 00577499    call        00577A9C
 0057749E    ret
 0057749F    xor         eax,eax
 005774A1    ret
end;*}

//005774A4
{*procedure sub_005774A4(?:?; ?:?);
begin
 005774A4    push        ebp
 005774A5    mov         ebp,esp
 005774A7    add         esp,0FFFFFFF8
 005774AA    push        ebx
 005774AB    push        esi
 005774AC    push        edi
 005774AD    xor         ecx,ecx
 005774AF    mov         dword ptr [ebp-8],ecx
 005774B2    mov         esi,edx
 005774B4    mov         dword ptr [ebp-4],eax
 005774B7    mov         eax,dword ptr [ebp-4]
 005774BA    call        @UStrAddRef
 005774BF    xor         eax,eax
 005774C1    push        ebp
 005774C2    push        577528
 005774C7    push        dword ptr fs:[eax]
 005774CA    mov         dword ptr fs:[eax],esp
 005774CD    mov         eax,esi
 005774CF    call        @UStrClr
 005774D4    mov         eax,dword ptr [ebp-4]
 005774D7    test        eax,eax
>005774D9    je          005774E0
 005774DB    sub         eax,4
 005774DE    mov         eax,dword ptr [eax]
 005774E0    mov         ebx,eax
 005774E2    test        ebx,ebx
>005774E4    jle         0057750D
 005774E6    mov         edi,1
 005774EB    mov         edx,edi
 005774ED    mov         eax,dword ptr [ebp-4]
 005774F0    call        00577478
 005774F5    mov         edx,eax
 005774F7    lea         eax,[ebp-8]
 005774FA    call        @UStrFromWChar
 005774FF    mov         edx,dword ptr [ebp-8]
 00577502    mov         eax,esi
 00577504    call        @UStrCat
 00577509    inc         edi
 0057750A    dec         ebx
>0057750B    jne         005774EB
 0057750D    xor         eax,eax
 0057750F    pop         edx
 00577510    pop         ecx
 00577511    pop         ecx
 00577512    mov         dword ptr fs:[eax],edx
 00577515    push        57752F
 0057751A    lea         eax,[ebp-8]
 0057751D    mov         edx,2
 00577522    call        @UStrArrayClr
 00577527    ret
>00577528    jmp         @HandleFinally
>0057752D    jmp         0057751A
 0057752F    pop         edi
 00577530    pop         esi
 00577531    pop         ebx
 00577532    pop         ecx
 00577533    pop         ecx
 00577534    pop         ebp
 00577535    ret
end;*}

//00577538
{*function sub_00577538(?:?):?;
begin
 00577538    push        ebx
 00577539    mov         ebx,eax
 0057753B    cmp         bx,20
>0057753F    jbe         00577551
 00577541    movzx       eax,bx
 00577544    call        00577428
 00577549    test        al,al
>0057754B    jne         00577551
 0057754D    xor         eax,eax
 0057754F    pop         ebx
 00577550    ret
 00577551    mov         al,1
 00577553    pop         ebx
 00577554    ret
end;*}

//00577558
{*function sub_00577558(?:?):?;
begin
 00577558    movzx       eax,ax
 0057755B    call        00577430
 00577560    ret
end;*}

//00577564
{*function sub_00577564(?:?):?;
begin
 00577564    cmp         ax,22
>00577568    je          00577597
 0057756A    cmp         ax,201C
>0057756E    je          00577597
 00577570    cmp         ax,201D
>00577574    je          00577597
 00577576    cmp         ax,201E
>0057757A    je          00577597
 0057757C    cmp         ax,201C
>00577580    jb          00577588
 00577582    cmp         ax,201F
>00577586    jbe         00577597
 00577588    cmp         ax,301D
>0057758C    jb          00577594
 0057758E    cmp         ax,301F
>00577592    jbe         00577597
 00577594    xor         eax,eax
 00577596    ret
 00577597    mov         al,1
 00577599    ret
end;*}

//0057759C
{*function sub_0057759C(?:?):?;
begin
 0057759C    cmp         ax,27
>005775A0    je          005775C9
 005775A2    cmp         ax,2018
>005775A6    je          005775C9
 005775A8    cmp         ax,2019
>005775AC    je          005775C9
 005775AE    cmp         ax,0B4
>005775B2    je          005775C9
 005775B4    cmp         ax,60
>005775B8    je          005775C9
 005775BA    cmp         ax,2018
>005775BE    jb          005775C6
 005775C0    cmp         ax,201B
>005775C4    jbe         005775C9
 005775C6    xor         eax,eax
 005775C8    ret
 005775C9    mov         al,1
 005775CB    ret
end;*}

//005775CC
{*function sub_005775CC(?:string; ?:Integer):?;
begin
 005775CC    push        ebp
 005775CD    mov         ebp,esp
 005775CF    add         esp,0FFFFFFF8
 005775D2    push        ebx
 005775D3    mov         ebx,edx
 005775D5    mov         dword ptr [ebp-4],eax
 005775D8    mov         eax,dword ptr [ebp-4]
 005775DB    call        @UStrAddRef
 005775E0    xor         eax,eax
 005775E2    push        ebp
 005775E3    push        57765F
 005775E8    push        dword ptr fs:[eax]
 005775EB    mov         dword ptr fs:[eax],esp
 005775EE    mov         byte ptr [ebp-5],0
 005775F2    mov         edx,ebx
 005775F4    mov         eax,dword ptr [ebp-4]
 005775F7    call        00577450
 005775FC    cmp         ax,2E
>00577600    jne         00577649
 00577602    inc         ebx
>00577603    jmp         00577619
 00577605    mov         edx,ebx
 00577607    mov         eax,dword ptr [ebp-4]
 0057760A    call        00577450
 0057760F    call        00577538
 00577614    test        al,al
>00577616    je          00577649
 00577618    inc         ebx
 00577619    mov         eax,dword ptr [ebp-4]
 0057761C    call        @UStrLen
 00577621    cmp         ebx,eax
>00577623    jg          00577645
 00577625    mov         edx,ebx
 00577627    mov         eax,dword ptr [ebp-4]
 0057762A    call        00577450
 0057762F    cmp         ax,0A
>00577633    je          00577645
 00577635    mov         edx,ebx
 00577637    mov         eax,dword ptr [ebp-4]
 0057763A    call        00577450
 0057763F    cmp         ax,0D
>00577643    jne         00577605
 00577645    mov         byte ptr [ebp-5],1
 00577649    xor         eax,eax
 0057764B    pop         edx
 0057764C    pop         ecx
 0057764D    pop         ecx
 0057764E    mov         dword ptr fs:[eax],edx
 00577651    push        577666
 00577656    lea         eax,[ebp-4]
 00577659    call        @UStrClr
 0057765E    ret
>0057765F    jmp         @HandleFinally
>00577664    jmp         00577656
 00577666    movzx       eax,byte ptr [ebp-5]
 0057766A    pop         ebx
 0057766B    pop         ecx
 0057766C    pop         ecx
 0057766D    pop         ebp
 0057766E    ret
end;*}

//00577670
{*function sub_00577670(?:string; ?:Integer):?;
begin
 00577670    push        ebp
 00577671    mov         ebp,esp
 00577673    push        ecx
 00577674    push        ebx
 00577675    push        esi
 00577676    mov         esi,edx
 00577678    mov         dword ptr [ebp-4],eax
 0057767B    mov         eax,dword ptr [ebp-4]
 0057767E    call        @UStrAddRef
 00577683    xor         eax,eax
 00577685    push        ebp
 00577686    push        5776DD
 0057768B    push        dword ptr fs:[eax]
 0057768E    mov         dword ptr fs:[eax],esp
 00577691    xor         ebx,ebx
 00577693    mov         edx,esi
 00577695    mov         eax,dword ptr [ebp-4]
 00577698    call        00577450
 0057769D    cmp         ax,2E
>005776A1    jne         005776C7
 005776A3    lea         edx,[esi+1]
 005776A6    mov         eax,dword ptr [ebp-4]
 005776A9    call        00577450
 005776AE    cmp         ax,2E
>005776B2    jne         005776C7
 005776B4    lea         edx,[esi+2]
 005776B7    mov         eax,dword ptr [ebp-4]
 005776BA    call        00577450
 005776BF    cmp         ax,2E
>005776C3    jne         005776C7
 005776C5    mov         bl,1
 005776C7    xor         eax,eax
 005776C9    pop         edx
 005776CA    pop         ecx
 005776CB    pop         ecx
 005776CC    mov         dword ptr fs:[eax],edx
 005776CF    push        5776E4
 005776D4    lea         eax,[ebp-4]
 005776D7    call        @UStrClr
 005776DC    ret
>005776DD    jmp         @HandleFinally
>005776E2    jmp         005776D4
 005776E4    mov         eax,ebx
 005776E6    pop         esi
 005776E7    pop         ebx
 005776E8    pop         ecx
 005776E9    pop         ebp
 005776EA    ret
end;*}

//005776EC
{*function sub_005776EC(?:string; ?:Integer):?;
begin
 005776EC    push        ebp
 005776ED    mov         ebp,esp
 005776EF    push        ecx
 005776F0    push        ebx
 005776F1    push        esi
 005776F2    mov         esi,edx
 005776F4    mov         dword ptr [ebp-4],eax
 005776F7    mov         eax,dword ptr [ebp-4]
 005776FA    call        @UStrAddRef
 005776FF    xor         eax,eax
 00577701    push        ebp
 00577702    push        577759
 00577707    push        dword ptr fs:[eax]
 0057770A    mov         dword ptr fs:[eax],esp
 0057770D    xor         ebx,ebx
 0057770F    mov         edx,esi
 00577711    mov         eax,dword ptr [ebp-4]
 00577714    call        00577450
 00577719    cmp         ax,2E
>0057771D    jne         00577743
 0057771F    lea         edx,[esi+1]
 00577722    mov         eax,dword ptr [ebp-4]
 00577725    call        00577450
 0057772A    cmp         ax,2E
>0057772E    jne         00577743
 00577730    lea         edx,[esi+2]
 00577733    mov         eax,dword ptr [ebp-4]
 00577736    call        00577450
 0057773B    cmp         ax,2E
>0057773F    je          00577743
 00577741    mov         bl,1
 00577743    xor         eax,eax
 00577745    pop         edx
 00577746    pop         ecx
 00577747    pop         ecx
 00577748    mov         dword ptr fs:[eax],edx
 0057774B    push        577760
 00577750    lea         eax,[ebp-4]
 00577753    call        @UStrClr
 00577758    ret
>00577759    jmp         @HandleFinally
>0057775E    jmp         00577750
 00577760    mov         eax,ebx
 00577762    pop         esi
 00577763    pop         ebx
 00577764    pop         ecx
 00577765    pop         ebp
 00577766    ret
end;*}

//00577768
{*function sub_00577768(?:string; ?:Integer):?;
begin
 00577768    push        ebp
 00577769    mov         ebp,esp
 0057776B    push        ecx
 0057776C    push        ebx
 0057776D    push        esi
 0057776E    push        edi
 0057776F    mov         esi,edx
 00577771    mov         dword ptr [ebp-4],eax
 00577774    mov         eax,dword ptr [ebp-4]
 00577777    call        @UStrAddRef
 0057777C    xor         eax,eax
 0057777E    push        ebp
 0057777F    push        5777E5
 00577784    push        dword ptr fs:[eax]
 00577787    mov         dword ptr fs:[eax],esp
 0057778A    xor         ebx,ebx
 0057778C    mov         edx,esi
 0057778E    mov         eax,dword ptr [ebp-4]
 00577791    call        00577450
 00577796    cmp         ax,2E
>0057779A    jne         005777CF
 0057779C    lea         edx,[esi+1]
 0057779F    mov         eax,dword ptr [ebp-4]
 005777A2    call        00577450
 005777A7    mov         edi,eax
 005777A9    cmp         di,30
>005777AD    jb          005777CF
 005777AF    cmp         di,39
>005777B3    ja          005777CF
 005777B5    mov         edx,esi
 005777B7    dec         edx
 005777B8    mov         eax,dword ptr [ebp-4]
 005777BB    call        00577450
 005777C0    mov         edi,eax
 005777C2    mov         eax,edi
 005777C4    call        00577558
 005777C9    test        al,al
>005777CB    jne         005777CF
 005777CD    mov         bl,1
 005777CF    xor         eax,eax
 005777D1    pop         edx
 005777D2    pop         ecx
 005777D3    pop         ecx
 005777D4    mov         dword ptr fs:[eax],edx
 005777D7    push        5777EC
 005777DC    lea         eax,[ebp-4]
 005777DF    call        @UStrClr
 005777E4    ret
>005777E5    jmp         @HandleFinally
>005777EA    jmp         005777DC
 005777EC    mov         eax,ebx
 005777EE    pop         edi
 005777EF    pop         esi
 005777F0    pop         ebx
 005777F1    pop         ecx
 005777F2    pop         ebp
 005777F3    ret
end;*}

//005777F4
{*function sub_005777F4(?:string; ?:Integer):?;
begin
 005777F4    push        ebp
 005777F5    mov         ebp,esp
 005777F7    push        ecx
 005777F8    push        ebx
 005777F9    mov         ebx,edx
 005777FB    mov         dword ptr [ebp-4],eax
 005777FE    mov         eax,dword ptr [ebp-4]
 00577801    call        @UStrAddRef
 00577806    xor         eax,eax
 00577808    push        ebp
 00577809    push        577853
 0057780E    push        dword ptr fs:[eax]
 00577811    mov         dword ptr fs:[eax],esp
 00577814    mov         edx,ebx
 00577816    mov         eax,dword ptr [ebp-4]
 00577819    call        00577450
 0057781E    cmp         ax,2E
>00577822    jne         00577835
 00577824    lea         edx,[ebx+1]
 00577827    mov         eax,dword ptr [ebp-4]
 0057782A    call        00577450
 0057782F    cmp         ax,2B
>00577833    je          00577839
 00577835    xor         eax,eax
>00577837    jmp         0057783B
 00577839    mov         al,1
 0057783B    mov         ebx,eax
 0057783D    xor         eax,eax
 0057783F    pop         edx
 00577840    pop         ecx
 00577841    pop         ecx
 00577842    mov         dword ptr fs:[eax],edx
 00577845    push        57785A
 0057784A    lea         eax,[ebp-4]
 0057784D    call        @UStrClr
 00577852    ret
>00577853    jmp         @HandleFinally
>00577858    jmp         0057784A
 0057785A    mov         eax,ebx
 0057785C    pop         ebx
 0057785D    pop         ecx
 0057785E    pop         ebp
 0057785F    ret
end;*}

//00577860
{*function sub_00577860(?:string; ?:Integer):?;
begin
 00577860    push        ebp
 00577861    mov         ebp,esp
 00577863    push        ecx
 00577864    push        ebx
 00577865    mov         ebx,edx
 00577867    mov         dword ptr [ebp-4],eax
 0057786A    mov         eax,dword ptr [ebp-4]
 0057786D    call        @UStrAddRef
 00577872    xor         eax,eax
 00577874    push        ebp
 00577875    push        5778BF
 0057787A    push        dword ptr fs:[eax]
 0057787D    mov         dword ptr fs:[eax],esp
 00577880    mov         edx,ebx
 00577882    mov         eax,dword ptr [ebp-4]
 00577885    call        00577450
 0057788A    cmp         ax,3D
>0057788E    jne         005778A1
 00577890    lea         edx,[ebx+1]
 00577893    mov         eax,dword ptr [ebp-4]
 00577896    call        00577450
 0057789B    cmp         ax,3E
>0057789F    je          005778A5
 005778A1    xor         eax,eax
>005778A3    jmp         005778A7
 005778A5    mov         al,1
 005778A7    mov         ebx,eax
 005778A9    xor         eax,eax
 005778AB    pop         edx
 005778AC    pop         ecx
 005778AD    pop         ecx
 005778AE    mov         dword ptr fs:[eax],edx
 005778B1    push        5778C6
 005778B6    lea         eax,[ebp-4]
 005778B9    call        @UStrClr
 005778BE    ret
>005778BF    jmp         @HandleFinally
>005778C4    jmp         005778B6
 005778C6    mov         eax,ebx
 005778C8    pop         ebx
 005778C9    pop         ecx
 005778CA    pop         ebp
 005778CB    ret
end;*}

//005778CC
{*function sub_005778CC(?:string; ?:Integer):?;
begin
 005778CC    push        ebp
 005778CD    mov         ebp,esp
 005778CF    push        ecx
 005778D0    push        ebx
 005778D1    push        esi
 005778D2    push        edi
 005778D3    mov         esi,edx
 005778D5    mov         dword ptr [ebp-4],eax
 005778D8    mov         eax,dword ptr [ebp-4]
 005778DB    call        @UStrAddRef
 005778E0    xor         eax,eax
 005778E2    push        ebp
 005778E3    push        577985
 005778E8    push        dword ptr fs:[eax]
 005778EB    mov         dword ptr fs:[eax],esp
 005778EE    xor         ebx,ebx
 005778F0    mov         edx,esi
 005778F2    mov         eax,dword ptr [ebp-4]
 005778F5    call        00577478
 005778FA    mov         edi,eax
 005778FC    mov         eax,edi
 005778FE    call        0057759C
 00577903    test        al,al
>00577905    je          0057796F
 00577907    lea         edx,[esi+1]
 0057790A    mov         eax,dword ptr [ebp-4]
 0057790D    call        00577478
 00577912    mov         edi,eax
 00577914    cmp         di,73
>00577918    je          00577920
 0057791A    cmp         di,53
>0057791E    jne         0057796F
 00577920    lea         edx,[esi+2]
 00577923    mov         eax,dword ptr [ebp-4]
 00577926    call        00577450
 0057792B    mov         edi,eax
 0057792D    mov         eax,edi
 0057792F    call        00577538
 00577934    test        al,al
>00577936    je          0057796F
 00577938    mov         edx,esi
 0057793A    dec         edx
 0057793B    mov         eax,dword ptr [ebp-4]
 0057793E    call        00577478
 00577943    mov         edi,eax
 00577945    mov         eax,edi
 00577947    call        00577558
 0057794C    test        al,al
>0057794E    jne         0057796D
 00577950    cmp         di,29
>00577954    je          0057796D
 00577956    cmp         di,7D
>0057795A    je          0057796D
 0057795C    cmp         di,5D
>00577960    je          0057796D
 00577962    mov         eax,edi
 00577964    call        00577564
 00577969    test        al,al
>0057796B    je          0057796F
 0057796D    mov         bl,1
 0057796F    xor         eax,eax
 00577971    pop         edx
 00577972    pop         ecx
 00577973    pop         ecx
 00577974    mov         dword ptr fs:[eax],edx
 00577977    push        57798C
 0057797C    lea         eax,[ebp-4]
 0057797F    call        @UStrClr
 00577984    ret
>00577985    jmp         @HandleFinally
>0057798A    jmp         0057797C
 0057798C    mov         eax,ebx
 0057798E    pop         edi
 0057798F    pop         esi
 00577990    pop         ebx
 00577991    pop         ecx
 00577992    pop         ebp
 00577993    ret
end;*}

//00577994
{*function sub_00577994(?:string; ?:Integer):?;
begin
 00577994    push        ebp
 00577995    mov         ebp,esp
 00577997    push        ecx
 00577998    push        ebx
 00577999    push        esi
 0057799A    push        edi
 0057799B    mov         esi,edx
 0057799D    mov         dword ptr [ebp-4],eax
 005779A0    mov         eax,dword ptr [ebp-4]
 005779A3    call        @UStrAddRef
 005779A8    xor         eax,eax
 005779AA    push        ebp
 005779AB    push        577A2F
 005779B0    push        dword ptr fs:[eax]
 005779B3    mov         dword ptr fs:[eax],esp
 005779B6    xor         ebx,ebx
 005779B8    mov         edx,esi
 005779BA    mov         eax,dword ptr [ebp-4]
 005779BD    call        00577478
 005779C2    mov         edi,eax
 005779C4    mov         eax,edi
 005779C6    call        0057759C
 005779CB    test        al,al
>005779CD    je          00577A19
 005779CF    lea         edx,[esi+1]
 005779D2    mov         eax,dword ptr [ebp-4]
 005779D5    call        00577450
 005779DA    mov         edi,eax
 005779DC    mov         eax,edi
 005779DE    call        00577538
 005779E3    test        al,al
>005779E5    je          00577A19
 005779E7    mov         edx,esi
 005779E9    dec         edx
 005779EA    mov         eax,dword ptr [ebp-4]
 005779ED    call        00577478
 005779F2    mov         edi,eax
 005779F4    mov         eax,edi
 005779F6    call        00577558
 005779FB    test        al,al
>005779FD    jne         00577A17
 005779FF    cmp         di,29
>00577A03    je          00577A17
 00577A05    cmp         di,7D
>00577A09    je          00577A17
 00577A0B    cmp         di,5D
>00577A0F    je          00577A17
 00577A11    cmp         di,7D
>00577A15    jne         00577A19
 00577A17    mov         bl,1
 00577A19    xor         eax,eax
 00577A1B    pop         edx
 00577A1C    pop         ecx
 00577A1D    pop         ecx
 00577A1E    mov         dword ptr fs:[eax],edx
 00577A21    push        577A36
 00577A26    lea         eax,[ebp-4]
 00577A29    call        @UStrClr
 00577A2E    ret
>00577A2F    jmp         @HandleFinally
>00577A34    jmp         00577A26
 00577A36    mov         eax,ebx
 00577A38    pop         edi
 00577A39    pop         esi
 00577A3A    pop         ebx
 00577A3B    pop         ecx
 00577A3C    pop         ebp
 00577A3D    ret
end;*}

//00577A40
{*function sub_00577A40(?:?):?;
begin
 00577A40    cmp         ax,30
>00577A44    jb          00577A4C
 00577A46    cmp         ax,39
>00577A4A    jbe         00577A97
 00577A4C    cmp         ax,5F
>00577A50    je          00577A97
 00577A52    cmp         ax,0FF10
>00577A56    jb          00577A5E
 00577A58    cmp         ax,0FF19
>00577A5C    jbe         00577A97
 00577A5E    cmp         ax,0FF3F
>00577A62    je          00577A97
 00577A64    cmp         ax,61
>00577A68    jb          00577A70
 00577A6A    cmp         ax,66
>00577A6E    jbe         00577A97
 00577A70    cmp         ax,41
>00577A74    jb          00577A7C
 00577A76    cmp         ax,46
>00577A7A    jbe         00577A97
 00577A7C    cmp         ax,0FF21
>00577A80    jb          00577A88
 00577A82    cmp         ax,0FF26
>00577A86    jbe         00577A97
 00577A88    cmp         ax,0FF41
>00577A8C    jb          00577A94
 00577A8E    cmp         ax,0FF46
>00577A92    jbe         00577A97
 00577A94    xor         eax,eax
 00577A96    ret
 00577A97    mov         al,1
 00577A99    ret
end;*}

//00577A9C
{*function sub_00577A9C(?:?):?;
begin
 00577A9C    movzx       edx,ax
 00577A9F    cmp         edx,0FFE1
>00577AA5    jg          00577ADA
>00577AA7    je          00577B18
 00577AA9    cmp         edx,0FF5F
>00577AAF    jg          00577AC8
>00577AB1    je          00577B09
 00577AB3    sub         edx,3007
>00577AB9    je          00577B36
 00577ABB    add         edx,0FFFF3106
 00577AC1    sub         edx,5E
>00577AC4    jb          00577B00
>00577AC6    jmp         00577B3A
 00577AC8    sub         edx,0FF60
>00577ACE    je          00577B0E
 00577AD0    sub         edx,80
>00577AD6    je          00577B13
>00577AD8    jmp         00577B3A
 00577ADA    add         edx,0FFFF001E
 00577AE0    cmp         edx,4
>00577AE3    ja          00577B3A
 00577AE5    jmp         dword ptr [edx*4+577AEC]
 00577AE5    dd          00577B1D
 00577AE5    dd          00577B22
 00577AE5    dd          00577B27
 00577AE5    dd          00577B2C
 00577AE5    dd          00577B31
 00577B00    sub         ax,0FF00
 00577B04    add         ax,20
 00577B08    ret
 00577B09    mov         ax,2985
 00577B0D    ret
 00577B0E    mov         ax,2986
 00577B12    ret
 00577B13    mov         ax,0A2
 00577B17    ret
 00577B18    mov         ax,0A3
 00577B1C    ret
 00577B1D    mov         ax,0AC
 00577B21    ret
 00577B22    mov         ax,0AF
 00577B26    ret
 00577B27    mov         ax,0A6
 00577B2B    ret
 00577B2C    mov         ax,0A5
 00577B30    ret
 00577B31    mov         ax,20A9
 00577B35    ret
 00577B36    mov         ax,30
 00577B3A    ret
end;*}

//00577B3C
{*function sub_00577B3C(?:?):?;
begin
 00577B3C    movzx       edx,ax
 00577B3F    cmp         edx,0B9
>00577B45    jg          00577B56
>00577B47    je          00577B6E
 00577B49    sub         edx,0B2
>00577B4F    je          00577B73
 00577B51    dec         edx
>00577B52    je          00577B78
>00577B54    jmp         00577B81
 00577B56    add         edx,0FFFFDF90
 00577B5C    sub         edx,0A
>00577B5F    jb          00577B65
>00577B61    je          00577B7D
>00577B63    jmp         00577B81
 00577B65    sub         ax,2070
 00577B69    add         ax,30
 00577B6D    ret
 00577B6E    mov         ax,31
 00577B72    ret
 00577B73    mov         ax,32
 00577B77    ret
 00577B78    mov         ax,33
 00577B7C    ret
 00577B7D    mov         ax,2B
 00577B81    ret
end;*}

//00577B84
{*function sub_00577B84(?:?):?;
begin
 00577B84    push        ebp
 00577B85    mov         ebp,esp
 00577B87    xor         ecx,ecx
 00577B89    push        ecx
 00577B8A    push        ecx
 00577B8B    push        ecx
 00577B8C    push        ecx
 00577B8D    push        ebx
 00577B8E    mov         dword ptr [ebp-4],eax
 00577B91    mov         eax,dword ptr [ebp-4]
 00577B94    call        @UStrAddRef
 00577B99    xor         eax,eax
 00577B9B    push        ebp
 00577B9C    push        578AB7
 00577BA1    push        dword ptr fs:[eax]
 00577BA4    mov         dword ptr fs:[eax],esp
 00577BA7    lea         edx,[ebp-10]
 00577BAA    mov         eax,dword ptr [ebp-4]
 00577BAD    call        00575518
 00577BB2    mov         eax,dword ptr [ebp-10]
 00577BB5    lea         edx,[ebp-0C]
 00577BB8    call        LowerCase
 00577BBD    mov         edx,dword ptr [ebp-0C]
 00577BC0    lea         eax,[ebp-8]
 00577BC3    mov         ecx,0
 00577BC8    call        @LStrFromUStr
 00577BCD    mov         bl,3
 00577BCF    mov         eax,dword ptr [ebp-8]
 00577BD2    test        eax,eax
>00577BD4    je          00577BDB
 00577BD6    sub         eax,4
 00577BD9    mov         eax,dword ptr [eax]
 00577BDB    cmp         eax,6
>00577BDE    ja          00578388
 00577BE4    jmp         dword ptr [eax*4+577BEB]
 00577BE4    dd          00578388
 00577BE4    dd          00577C07
 00577BE4    dd          00577C30
 00577BE4    dd          00577D46
 00577BE4    dd          00577F81
 00577BE4    dd          005780F6
 00577BE4    dd          00578255
 00577C07    mov         eax,dword ptr [ebp-8]
 00577C0A    mov         edx,578AD4;'s'
 00577C0F    call        @LStrEqual
>00577C14    je          00577C29
 00577C16    mov         eax,dword ptr [ebp-8]
 00577C19    mov         edx,578AE4;'m'
 00577C1E    call        @LStrEqual
>00577C23    jne         00578A8C
 00577C29    mov         bl,5
>00577C2B    jmp         00578A8C
 00577C30    mov         eax,dword ptr [ebp-8]
 00577C33    mov         edx,578AF4;'if'
 00577C38    call        @LStrEqual
>00577C3D    jne         00577C46
 00577C3F    mov         bl,5F
>00577C41    jmp         00578A8C
 00577C46    mov         eax,dword ptr [ebp-8]
 00577C49    mov         edx,578B04;'in'
 00577C4E    call        @LStrEqual
>00577C53    jne         00577C5C
 00577C55    mov         bl,5E
>00577C57    jmp         00578A8C
 00577C5C    mov         eax,dword ptr [ebp-8]
 00577C5F    mov         edx,578B14;'is'
 00577C64    call        @LStrEqual
>00577C69    jne         00577C72
 00577C6B    mov         bl,5B
>00577C6D    jmp         00578A8C
 00577C72    mov         eax,dword ptr [ebp-8]
 00577C75    mov         edx,578B24;'of'
 00577C7A    call        @LStrEqual
>00577C7F    jne         00577C88
 00577C81    mov         bl,1F
>00577C83    jmp         00578A8C
 00577C88    mov         eax,dword ptr [ebp-8]
 00577C8B    mov         edx,578B34;'or'
 00577C90    call        @LStrEqual
>00577C95    jne         00577C9E
 00577C97    mov         bl,40
>00577C99    jmp         00578A8C
 00577C9E    mov         eax,dword ptr [ebp-8]
 00577CA1    mov         edx,578B44;'to'
 00577CA6    call        @LStrEqual
>00577CAB    jne         00577CB4
 00577CAD    mov         bl,5A
>00577CAF    jmp         00578A8C
 00577CB4    mov         eax,dword ptr [ebp-8]
 00577CB7    mov         edx,578B54;'hz'
 00577CBC    call        @LStrEqual
>00577CC1    je          00577D3F
 00577CC3    mov         eax,dword ptr [ebp-8]
 00577CC6    mov         edx,578B64;'cm'
 00577CCB    call        @LStrEqual
>00577CD0    je          00577D3F
 00577CD2    mov         eax,dword ptr [ebp-8]
 00577CD5    mov         edx,578B74;'mm'
 00577CDA    call        @LStrEqual
>00577CDF    je          00577D3F
 00577CE1    mov         eax,dword ptr [ebp-8]
 00577CE4    mov         edx,578B84;'ms'
 00577CE9    call        @LStrEqual
>00577CEE    je          00577D3F
 00577CF0    mov         eax,dword ptr [ebp-8]
 00577CF3    mov         edx,578B94;'km'
 00577CF8    call        @LStrEqual
>00577CFD    je          00577D3F
 00577CFF    mov         eax,dword ptr [ebp-8]
 00577D02    mov         edx,578BA4;'ft'
 00577D07    call        @LStrEqual
>00577D0C    je          00577D3F
 00577D0E    mov         eax,dword ptr [ebp-8]
 00577D11    mov         edx,578BB4;'kg'
 00577D16    call        @LStrEqual
>00577D1B    je          00577D3F
 00577D1D    mov         eax,dword ptr [ebp-8]
 00577D20    mov         edx,578BC4;'lb'
 00577D25    call        @LStrEqual
>00577D2A    je          00577D3F
 00577D2C    mov         eax,dword ptr [ebp-8]
 00577D2F    mov         edx,578BD4;'oz'
 00577D34    call        @LStrEqual
>00577D39    jne         00578A8C
 00577D3F    mov         bl,5
>00577D41    jmp         00578A8C
 00577D46    mov         eax,dword ptr [ebp-8]
 00577D49    mov         edx,578BE4;'and'
 00577D4E    call        @LStrEqual
>00577D53    jne         00577D5C
 00577D55    mov         bl,41
>00577D57    jmp         00578A8C
 00577D5C    mov         eax,dword ptr [ebp-8]
 00577D5F    mov         edx,578BF4;'but'
 00577D64    call        @LStrEqual
>00577D69    jne         00577D72
 00577D6B    mov         bl,44
>00577D6D    jmp         00578A8C
 00577D72    mov         eax,dword ptr [ebp-8]
 00577D75    mov         edx,578C04;'div'
 00577D7A    call        @LStrEqual
>00577D7F    jne         00577D88
 00577D81    mov         bl,26
>00577D83    jmp         00578A8C
 00577D88    mov         eax,dword ptr [ebp-8]
 00577D8B    mov         edx,578C14;'for'
 00577D90    call        @LStrEqual
>00577D95    jne         00577D9E
 00577D97    mov         bl,65
>00577D99    jmp         00578A8C
 00577D9E    mov         eax,dword ptr [ebp-8]
 00577DA1    mov         edx,578C24;'mod'
 00577DA6    call        @LStrEqual
>00577DAB    jne         00577DB4
 00577DAD    mov         bl,27
>00577DAF    jmp         00578A8C
 00577DB4    mov         eax,dword ptr [ebp-8]
 00577DB7    mov         edx,578C34;'nan'
 00577DBC    call        @LStrEqual
>00577DC1    jne         00577DCA
 00577DC3    mov         bl,9
>00577DC5    jmp         00578A8C
 00577DCA    mov         eax,dword ptr [ebp-8]
 00577DCD    mov         edx,578C44;'nil'
 00577DD2    call        @LStrEqual
>00577DD7    jne         00577DE0
 00577DD9    mov         bl,0D
>00577DDB    jmp         00578A8C
 00577DE0    mov         eax,dword ptr [ebp-8]
 00577DE3    mov         edx,578C54;'nor'
 00577DE8    call        @LStrEqual
>00577DED    jne         00577DF6
 00577DEF    mov         bl,47
>00577DF1    jmp         00578A8C
 00577DF6    mov         eax,dword ptr [ebp-8]
 00577DF9    mov         edx,578C64;'not'
 00577DFE    call        @LStrEqual
>00577E03    jne         00577E0C
 00577E05    mov         bl,43
>00577E07    jmp         00578A8C
 00577E0C    mov         eax,dword ptr [ebp-8]
 00577E0F    mov         edx,578C74;'shl'
 00577E14    call        @LStrEqual
>00577E19    jne         00577E22
 00577E1B    mov         bl,28
>00577E1D    jmp         00578A8C
 00577E22    mov         eax,dword ptr [ebp-8]
 00577E25    mov         edx,578C84;'shr'
 00577E2A    call        @LStrEqual
>00577E2F    jne         00577E38
 00577E31    mov         bl,29
>00577E33    jmp         00578A8C
 00577E38    mov         eax,dword ptr [ebp-8]
 00577E3B    mov         edx,578C94;'xor'
 00577E40    call        @LStrEqual
>00577E45    jne         00577E4E
 00577E47    mov         bl,42
>00577E49    jmp         00578A8C
 00577E4E    mov         eax,dword ptr [ebp-8]
 00577E51    mov         edx,578CA4;'per'
 00577E56    call        @LStrEqual
>00577E5B    jne         00577E64
 00577E5D    mov         bl,6A
>00577E5F    jmp         00578A8C
 00577E64    mov         eax,dword ptr [ebp-8]
 00577E67    mov         edx,578CB4;'bis'
 00577E6C    call        @LStrEqual
>00577E71    jne         00577E7A
 00577E73    mov         bl,68
>00577E75    jmp         00578A8C
 00577E7A    mov         eax,dword ptr [ebp-8]
 00577E7D    mov         edx,578CC4;'den'
 00577E82    call        @LStrEqual
>00577E87    jne         00577E90
 00577E89    mov         bl,69
>00577E8B    jmp         00578A8C
 00577E90    mov         eax,dword ptr [ebp-8]
 00577E93    mov         edx,578CD4;'kph'
 00577E98    call        @LStrEqual
>00577E9D    je          00577F7A
 00577EA3    mov         eax,dword ptr [ebp-8]
 00577EA6    mov         edx,578CE4;'mps'
 00577EAB    call        @LStrEqual
>00577EB0    je          00577F7A
 00577EB6    mov         eax,dword ptr [ebp-8]
 00577EB9    mov         edx,578CF4;'mph'
 00577EBE    call        @LStrEqual
>00577EC3    je          00577F7A
 00577EC9    mov         eax,dword ptr [ebp-8]
 00577ECC    mov         edx,578D04;'khz'
 00577ED1    call        @LStrEqual
>00577ED6    je          00577F7A
 00577EDC    mov         eax,dword ptr [ebp-8]
 00577EDF    mov         edx,578D14;'mhz'
 00577EE4    call        @LStrEqual
>00577EE9    je          00577F7A
 00577EEF    mov         eax,dword ptr [ebp-8]
 00577EF2    mov         edx,578D24;'ghz'
 00577EF7    call        @LStrEqual
>00577EFC    je          00577F7A
 00577EFE    mov         eax,dword ptr [ebp-8]
 00577F01    mov         edx,578D34;'deg'
 00577F06    call        @LStrEqual
>00577F0B    je          00577F7A
 00577F0D    mov         eax,dword ptr [ebp-8]
 00577F10    mov         edx,578D44;'rad'
 00577F15    call        @LStrEqual
>00577F1A    je          00577F7A
 00577F1C    mov         eax,dword ptr [ebp-8]
 00577F1F    mov         edx,578D54;'day'
 00577F24    call        @LStrEqual
>00577F29    je          00577F7A
 00577F2B    mov         eax,dword ptr [ebp-8]
 00577F2E    mov         edx,578D64;'rpm'
 00577F33    call        @LStrEqual
>00577F38    je          00577F7A
 00577F3A    mov         eax,dword ptr [ebp-8]
 00577F3D    mov         edx,578D74;'kgm'
 00577F42    call        @LStrEqual
>00577F47    je          00577F7A
 00577F49    mov         eax,dword ptr [ebp-8]
 00577F4C    mov         edx,578D84;'kgs'
 00577F51    call        @LStrEqual
>00577F56    je          00577F7A
 00577F58    mov         eax,dword ptr [ebp-8]
 00577F5B    mov         edx,578D94;'lbs'
 00577F60    call        @LStrEqual
>00577F65    je          00577F7A
 00577F67    mov         eax,dword ptr [ebp-8]
 00577F6A    mov         edx,578DA4;'rev'
 00577F6F    call        @LStrEqual
>00577F74    jne         00578A8C
 00577F7A    mov         bl,5
>00577F7C    jmp         00578A8C
 00577F81    mov         eax,dword ptr [ebp-8]
 00577F84    mov         edx,578DB4;'else'
 00577F89    call        @LStrEqual
>00577F8E    jne         00577F97
 00577F90    mov         bl,61
>00577F92    jmp         00578A8C
 00577F97    mov         eax,dword ptr [ebp-8]
 00577F9A    mov         edx,578DC8;'isnt'
 00577F9F    call        @LStrEqual
>00577FA4    jne         00577FAD
 00577FA6    mov         bl,5C
>00577FA8    jmp         00578A8C
 00577FAD    mov         eax,dword ptr [ebp-8]
 00577FB0    mov         edx,578DDC;'null'
 00577FB5    call        @LStrEqual
>00577FBA    jne         00577FC3
 00577FBC    mov         bl,0E
>00577FBE    jmp         00578A8C
 00577FC3    mov         eax,dword ptr [ebp-8]
 00577FC6    mov         edx,578DF0;'plus'
 00577FCB    call        @LStrEqual
>00577FD0    jne         00577FD9
 00577FD2    mov         bl,22
>00577FD4    jmp         00578A8C
 00577FD9    mov         eax,dword ptr [ebp-8]
 00577FDC    mov         edx,578E04;'then'
 00577FE1    call        @LStrEqual
>00577FE6    jne         00577FEF
 00577FE8    mov         bl,60
>00577FEA    jmp         00578A8C
 00577FEF    mov         eax,dword ptr [ebp-8]
 00577FF2    mov         edx,578E18;'true'
 00577FF7    call        @LStrEqual
>00577FFC    jne         00578005
 00577FFE    mov         bl,0B
>00578000    jmp         00578A8C
 00578005    mov         eax,dword ptr [ebp-8]
 00578008    mov         edx,578E2C;'days'
 0057800D    call        @LStrEqual
>00578012    je          005780EF
 00578018    mov         eax,dword ptr [ebp-8]
 0057801B    mov         edx,578E40;'hour'
 00578020    call        @LStrEqual
>00578025    je          005780EF
 0057802B    mov         eax,dword ptr [ebp-8]
 0057802E    mov         edx,578E54;'cent'
 00578033    call        @LStrEqual
>00578038    je          005780EF
 0057803E    mov         eax,dword ptr [ebp-8]
 00578041    mov         edx,578E68;'note'
 00578046    call        @LStrEqual
>0057804B    je          005780EF
 00578051    mov         eax,dword ptr [ebp-8]
 00578054    mov         edx,578E7C;'gram'
 00578059    call        @LStrEqual
>0057805E    je          005780EF
 00578064    mov         eax,dword ptr [ebp-8]
 00578067    mov         edx,578E90;'kilo'
 0057806C    call        @LStrEqual
>00578071    je          005780EF
 00578073    mov         eax,dword ptr [ebp-8]
 00578076    mov         edx,578EA4;'kgms'
 0057807B    call        @LStrEqual
>00578080    je          005780EF
 00578082    mov         eax,dword ptr [ebp-8]
 00578085    mov         edx,578EB8;'rpms'
 0057808A    call        @LStrEqual
>0057808F    je          005780EF
 00578091    mov         eax,dword ptr [ebp-8]
 00578094    mov         edx,578ECC;'foot'
 00578099    call        @LStrEqual
>0057809E    je          005780EF
 005780A0    mov         eax,dword ptr [ebp-8]
 005780A3    mov         edx,578EE0;'feet'
 005780A8    call        @LStrEqual
>005780AD    je          005780EF
 005780AF    mov         eax,dword ptr [ebp-8]
 005780B2    mov         edx,578EF4;'inch'
 005780B7    call        @LStrEqual
>005780BC    je          005780EF
 005780BE    mov         eax,dword ptr [ebp-8]
 005780C1    mov         edx,578F08;'mile'
 005780C6    call        @LStrEqual
>005780CB    je          005780EF
 005780CD    mov         eax,dword ptr [ebp-8]
 005780D0    mov         edx,578F1C;'yard'
 005780D5    call        @LStrEqual
>005780DA    je          005780EF
 005780DC    mov         eax,dword ptr [ebp-8]
 005780DF    mov         edx,578F30;'revs'
 005780E4    call        @LStrEqual
>005780E9    jne         00578A8C
 005780EF    mov         bl,5
>005780F1    jmp         00578A8C
 005780F6    mov         eax,dword ptr [ebp-8]
 005780F9    mov         edx,578F44;'elsif'
 005780FE    call        @LStrEqual
>00578103    jne         0057810C
 00578105    mov         bl,62
>00578107    jmp         00578A8C
 0057810C    mov         eax,dword ptr [ebp-8]
 0057810F    mov         edx,578F58;'endif'
 00578114    call        @LStrEqual
>00578119    jne         00578122
 0057811B    mov         bl,63
>0057811D    jmp         00578A8C
 00578122    mov         eax,dword ptr [ebp-8]
 00578125    mov         edx,578F6C;'false'
 0057812A    call        @LStrEqual
>0057812F    jne         00578138
 00578131    mov         bl,0C
>00578133    jmp         00578A8C
 00578138    mov         eax,dword ptr [ebp-8]
 0057813B    mov         edx,578F80;'until'
 00578140    call        @LStrEqual
>00578145    jne         0057814E
 00578147    mov         bl,67
>00578149    jmp         00578A8C
 0057814E    mov         eax,dword ptr [ebp-8]
 00578151    mov         edx,578F94;'while'
 00578156    call        @LStrEqual
>0057815B    jne         00578164
 0057815D    mov         bl,64
>0057815F    jmp         00578A8C
 00578164    mov         eax,dword ptr [ebp-8]
 00578167    mov         edx,578FA8;'cents'
 0057816C    call        @LStrEqual
>00578171    je          0057824E
 00578177    mov         eax,dword ptr [ebp-8]
 0057817A    mov         edx,578FBC;'notes'
 0057817F    call        @LStrEqual
>00578184    je          0057824E
 0057818A    mov         eax,dword ptr [ebp-8]
 0057818D    mov         edx,578FD0;'hertz'
 00578192    call        @LStrEqual
>00578197    je          0057824E
 0057819D    mov         eax,dword ptr [ebp-8]
 005781A0    mov         edx,578FE4;'meter'
 005781A5    call        @LStrEqual
>005781AA    je          0057824E
 005781B0    mov         eax,dword ptr [ebp-8]
 005781B3    mov         edx,578FF8;'metre'
 005781B8    call        @LStrEqual
>005781BD    je          0057824E
 005781C3    mov         eax,dword ptr [ebp-8]
 005781C6    mov         edx,57900C;'hours'
 005781CB    call        @LStrEqual
>005781D0    je          0057824E
 005781D2    mov         eax,dword ptr [ebp-8]
 005781D5    mov         edx,579020;'inchs'
 005781DA    call        @LStrEqual
>005781DF    je          0057824E
 005781E1    mov         eax,dword ptr [ebp-8]
 005781E4    mov         edx,579034;'miles'
 005781E9    call        @LStrEqual
>005781EE    je          0057824E
 005781F0    mov         eax,dword ptr [ebp-8]
 005781F3    mov         edx,579048;'yards'
 005781F8    call        @LStrEqual
>005781FD    je          0057824E
 005781FF    mov         eax,dword ptr [ebp-8]
 00578202    mov         edx,57905C;'pixel'
 00578207    call        @LStrEqual
>0057820C    je          0057824E
 0057820E    mov         eax,dword ptr [ebp-8]
 00578211    mov         edx,579070;'grams'
 00578216    call        @LStrEqual
>0057821B    je          0057824E
 0057821D    mov         eax,dword ptr [ebp-8]
 00578220    mov         edx,579084;'kilos'
 00578225    call        @LStrEqual
>0057822A    je          0057824E
 0057822C    mov         eax,dword ptr [ebp-8]
 0057822F    mov         edx,579098;'ounce'
 00578234    call        @LStrEqual
>00578239    je          0057824E
 0057823B    mov         eax,dword ptr [ebp-8]
 0057823E    mov         edx,5790AC;'pound'
 00578243    call        @LStrEqual
>00578248    jne         00578A8C
 0057824E    mov         bl,5
>00578250    jmp         00578A8C
 00578255    mov         eax,dword ptr [ebp-8]
 00578258    mov         edx,5790C0;'elseif'
 0057825D    call        @LStrEqual
>00578262    jne         0057826B
 00578264    mov         bl,62
>00578266    jmp         00578A8C
 0057826B    mov         eax,dword ptr [ebp-8]
 0057826E    mov         edx,5790D4;'repeat'
 00578273    call        @LStrEqual
>00578278    jne         00578281
 0057827A    mov         bl,66
>0057827C    jmp         00578A8C
 00578281    mov         eax,dword ptr [ebp-8]
 00578284    mov         edx,5790E8;'either'
 00578289    call        @LStrEqual
>0057828E    jne         00578297
 00578290    mov         bl,45
>00578292    jmp         00578A8C
 00578297    mov         eax,dword ptr [ebp-8]
 0057829A    mov         edx,5790FC;'meters'
 0057829F    call        @LStrEqual
>005782A4    je          00578381
 005782AA    mov         eax,dword ptr [ebp-8]
 005782AD    mov         edx,579110;'metres'
 005782B2    call        @LStrEqual
>005782B7    je          00578381
 005782BD    mov         eax,dword ptr [ebp-8]
 005782C0    mov         edx,579124;'inches'
 005782C5    call        @LStrEqual
>005782CA    je          00578381
 005782D0    mov         eax,dword ptr [ebp-8]
 005782D3    mov         edx,579138;'p5unit'
 005782D8    call        @LStrEqual
>005782DD    je          00578381
 005782E3    mov         eax,dword ptr [ebp-8]
 005782E6    mov         edx,57914C;'minute'
 005782EB    call        @LStrEqual
>005782F0    je          00578381
 005782F6    mov         eax,dword ptr [ebp-8]
 005782F9    mov         edx,579160;'second'
 005782FE    call        @LStrEqual
>00578303    je          00578381
 00578305    mov         eax,dword ptr [ebp-8]
 00578308    mov         edx,579174;'degree'
 0057830D    call        @LStrEqual
>00578312    je          00578381
 00578314    mov         eax,dword ptr [ebp-8]
 00578317    mov         edx,579188;'radian'
 0057831C    call        @LStrEqual
>00578321    je          00578381
 00578323    mov         eax,dword ptr [ebp-8]
 00578326    mov         edx,57919C;'octave'
 0057832B    call        @LStrEqual
>00578330    je          00578381
 00578332    mov         eax,dword ptr [ebp-8]
 00578335    mov         edx,5791B0;'pixels'
 0057833A    call        @LStrEqual
>0057833F    je          00578381
 00578341    mov         eax,dword ptr [ebp-8]
 00578344    mov         edx,5791C4;'mickey'
 00578349    call        @LStrEqual
>0057834E    je          00578381
 00578350    mov         eax,dword ptr [ebp-8]
 00578353    mov         edx,5791D8;'ounces'
 00578358    call        @LStrEqual
>0057835D    je          00578381
 0057835F    mov         eax,dword ptr [ebp-8]
 00578362    mov         edx,5791EC;'pounds'
 00578367    call        @LStrEqual
>0057836C    je          00578381
 0057836E    mov         eax,dword ptr [ebp-8]
 00578371    mov         edx,579200;'newton'
 00578376    call        @LStrEqual
>0057837B    jne         00578A8C
 00578381    mov         bl,5
>00578383    jmp         00578A8C
 00578388    mov         eax,dword ptr [ebp-8]
 0057838B    mov         edx,579214;'infinity'
 00578390    call        @LStrEqual
>00578395    jne         0057839E
 00578397    mov         bl,9
>00578399    jmp         00578A8C
 0057839E    mov         eax,dword ptr [ebp-8]
 005783A1    mov         edx,57922C;'neither'
 005783A6    call        @LStrEqual
>005783AB    jne         005783B4
 005783AD    mov         bl,46
>005783AF    jmp         00578A8C
 005783B4    mov         eax,dword ptr [ebp-8]
 005783B7    mov         edx,579240;'minutes'
 005783BC    call        @LStrEqual
>005783C1    je          00578A8A
 005783C7    mov         eax,dword ptr [ebp-8]
 005783CA    mov         edx,579254;'seconds'
 005783CF    call        @LStrEqual
>005783D4    je          00578A8A
 005783DA    mov         eax,dword ptr [ebp-8]
 005783DD    mov         edx,579268;'miliseconds'
 005783E2    call        @LStrEqual
>005783E7    je          00578A8A
 005783ED    mov         eax,dword ptr [ebp-8]
 005783F0    mov         edx,579280;'milliseconds'
 005783F5    call        @LStrEqual
>005783FA    je          00578A8A
 00578400    mov         eax,dword ptr [ebp-8]
 00578403    mov         edx,57929C;'milisecond'
 00578408    call        @LStrEqual
>0057840D    je          00578A8A
 00578413    mov         eax,dword ptr [ebp-8]
 00578416    mov         edx,5792B4;'millisecond'
 0057841B    call        @LStrEqual
>00578420    je          00578A8A
 00578426    mov         eax,dword ptr [ebp-8]
 00578429    mov         edx,5792CC;'p5units'
 0057842E    call        @LStrEqual
>00578433    je          00578A8A
 00578439    mov         eax,dword ptr [ebp-8]
 0057843C    mov         edx,5792E0;'microsecond'
 00578441    call        @LStrEqual
>00578446    je          00578A8A
 0057844C    mov         eax,dword ptr [ebp-8]
 0057844F    mov         edx,5792F8;'microseconds'
 00578454    call        @LStrEqual
>00578459    je          00578A8A
 0057845F    mov         eax,dword ptr [ebp-8]
 00578462    mov         edx,579314;'kilogram'
 00578467    call        @LStrEqual
>0057846C    je          00578A8A
 00578472    mov         eax,dword ptr [ebp-8]
 00578475    mov         edx,57932C;'kilograms'
 0057847A    call        @LStrEqual
>0057847F    je          00578A8A
 00578485    mov         eax,dword ptr [ebp-8]
 00578488    mov         edx,579344;'kilometres'
 0057848D    call        @LStrEqual
>00578492    je          00578A8A
 00578498    mov         eax,dword ptr [ebp-8]
 0057849B    mov         edx,57935C;'kilometers'
 005784A0    call        @LStrEqual
>005784A5    je          00578A8A
 005784AB    mov         eax,dword ptr [ebp-8]
 005784AE    mov         edx,579374;'kilometre'
 005784B3    call        @LStrEqual
>005784B8    je          00578A8A
 005784BE    mov         eax,dword ptr [ebp-8]
 005784C1    mov         edx,57938C;'kilometer'
 005784C6    call        @LStrEqual
>005784CB    je          00578A8A
 005784D1    mov         eax,dword ptr [ebp-8]
 005784D4    mov         edx,5793A4;'centimetres'
 005784D9    call        @LStrEqual
>005784DE    je          00578A8A
 005784E4    mov         eax,dword ptr [ebp-8]
 005784E7    mov         edx,5793BC;'centimeters'
 005784EC    call        @LStrEqual
>005784F1    je          00578A8A
 005784F7    mov         eax,dword ptr [ebp-8]
 005784FA    mov         edx,5793D4;'centimeter'
 005784FF    call        @LStrEqual
>00578504    je          00578A8A
 0057850A    mov         eax,dword ptr [ebp-8]
 0057850D    mov         edx,5793EC;'centimetre'
 00578512    call        @LStrEqual
>00578517    je          00578A8A
 0057851D    mov         eax,dword ptr [ebp-8]
 00578520    mov         edx,579404;'milimeters'
 00578525    call        @LStrEqual
>0057852A    je          00578A8A
 00578530    mov         eax,dword ptr [ebp-8]
 00578533    mov         edx,57941C;'milimetres'
 00578538    call        @LStrEqual
>0057853D    je          00578A8A
 00578543    mov         eax,dword ptr [ebp-8]
 00578546    mov         edx,579434;'radians'
 0057854B    call        @LStrEqual
>00578550    je          00578A8A
 00578556    mov         eax,dword ptr [ebp-8]
 00578559    mov         edx,579448;'milimeter'
 0057855E    call        @LStrEqual
>00578563    je          00578A8A
 00578569    mov         eax,dword ptr [ebp-8]
 0057856C    mov         edx,579460;'milimetre'
 00578571    call        @LStrEqual
>00578576    je          00578A8A
 0057857C    mov         eax,dword ptr [ebp-8]
 0057857F    mov         edx,579478;'millimeters'
 00578584    call        @LStrEqual
>00578589    je          00578A8A
 0057858F    mov         eax,dword ptr [ebp-8]
 00578592    mov         edx,579490;'millimetres'
 00578597    call        @LStrEqual
>0057859C    je          00578A8A
 005785A2    mov         eax,dword ptr [ebp-8]
 005785A5    mov         edx,5794A8;'millimeter'
 005785AA    call        @LStrEqual
>005785AF    je          00578A8A
 005785B5    mov         eax,dword ptr [ebp-8]
 005785B8    mov         edx,5794C0;'millimetre'
 005785BD    call        @LStrEqual
>005785C2    je          00578A8A
 005785C8    mov         eax,dword ptr [ebp-8]
 005785CB    mov         edx,5794D8;'degrees'
 005785D0    call        @LStrEqual
>005785D5    je          00578A8A
 005785DB    mov         eax,dword ptr [ebp-8]
 005785DE    mov         edx,5794EC;'nounits'
 005785E3    call        @LStrEqual
>005785E8    je          00578A8A
 005785EE    mov         eax,dword ptr [ebp-8]
 005785F1    mov         edx,579500;'kilohertz'
 005785F6    call        @LStrEqual
>005785FB    je          00578A8A
 00578601    mov         eax,dword ptr [ebp-8]
 00578604    mov         edx,579518;'megahertz'
 00578609    call        @LStrEqual
>0057860E    je          00578A8A
 00578614    mov         eax,dword ptr [ebp-8]
 00578617    mov         edx,579530;'gigahertz'
 0057861C    call        @LStrEqual
>00578621    je          00578A8A
 00578627    mov         eax,dword ptr [ebp-8]
 0057862A    mov         edx,579548;'octaves'
 0057862F    call        @LStrEqual
>00578634    je          00578A8A
 0057863A    mov         eax,dword ptr [ebp-8]
 0057863D    mov         edx,57955C;'semitone'
 00578642    call        @LStrEqual
>00578647    je          00578A8A
 0057864D    mov         eax,dword ptr [ebp-8]
 00578650    mov         edx,579574;'semitones'
 00578655    call        @LStrEqual
>0057865A    je          00578A8A
 00578660    mov         eax,dword ptr [ebp-8]
 00578663    mov         edx,57958C;'minorsecond'
 00578668    call        @LStrEqual
>0057866D    je          00578A8A
 00578673    mov         eax,dword ptr [ebp-8]
 00578676    mov         edx,5795A4;'minorseconds'
 0057867B    call        @LStrEqual
>00578680    je          00578A8A
 00578686    mov         eax,dword ptr [ebp-8]
 00578689    mov         edx,5795C0;'majorsecond'
 0057868E    call        @LStrEqual
>00578693    je          00578A8A
 00578699    mov         eax,dword ptr [ebp-8]
 0057869C    mov         edx,5795D8;'majorseconds'
 005786A1    call        @LStrEqual
>005786A6    je          00578A8A
 005786AC    mov         eax,dword ptr [ebp-8]
 005786AF    mov         edx,5795F4;'augmentedsecond'
 005786B4    call        @LStrEqual
>005786B9    je          00578A8A
 005786BF    mov         eax,dword ptr [ebp-8]
 005786C2    mov         edx,579610;'augmentedseconds'
 005786C7    call        @LStrEqual
>005786CC    je          00578A8A
 005786D2    mov         eax,dword ptr [ebp-8]
 005786D5    mov         edx,579630;'diminishedthird'
 005786DA    call        @LStrEqual
>005786DF    je          00578A8A
 005786E5    mov         eax,dword ptr [ebp-8]
 005786E8    mov         edx,57964C;'diminishedthirds'
 005786ED    call        @LStrEqual
>005786F2    je          00578A8A
 005786F8    mov         eax,dword ptr [ebp-8]
 005786FB    mov         edx,57966C;'minorthird'
 00578700    call        @LStrEqual
>00578705    je          00578A8A
 0057870B    mov         eax,dword ptr [ebp-8]
 0057870E    mov         edx,579684;'minorthirds'
 00578713    call        @LStrEqual
>00578718    je          00578A8A
 0057871E    mov         eax,dword ptr [ebp-8]
 00578721    mov         edx,57969C;'majorthird'
 00578726    call        @LStrEqual
>0057872B    je          00578A8A
 00578731    mov         eax,dword ptr [ebp-8]
 00578734    mov         edx,5796B4;'majorthirds'
 00578739    call        @LStrEqual
>0057873E    je          00578A8A
 00578744    mov         eax,dword ptr [ebp-8]
 00578747    mov         edx,5796CC;'augmentedthird'
 0057874C    call        @LStrEqual
>00578751    je          00578A8A
 00578757    mov         eax,dword ptr [ebp-8]
 0057875A    mov         edx,5796E8;'augmentedthirds'
 0057875F    call        @LStrEqual
>00578764    je          00578A8A
 0057876A    mov         eax,dword ptr [ebp-8]
 0057876D    mov         edx,579704;'diminishedfourth'
 00578772    call        @LStrEqual
>00578777    je          00578A8A
 0057877D    mov         eax,dword ptr [ebp-8]
 00578780    mov         edx,579724;'diminishedfourths'
 00578785    call        @LStrEqual
>0057878A    je          00578A8A
 00578790    mov         eax,dword ptr [ebp-8]
 00578793    mov         edx,579744;'perfectfourth'
 00578798    call        @LStrEqual
>0057879D    je          00578A8A
 005787A3    mov         eax,dword ptr [ebp-8]
 005787A6    mov         edx,579760;'perfectfourths'
 005787AB    call        @LStrEqual
>005787B0    je          00578A8A
 005787B6    mov         eax,dword ptr [ebp-8]
 005787B9    mov         edx,57977C;'augmentedfourth'
 005787BE    call        @LStrEqual
>005787C3    je          00578A8A
 005787C9    mov         eax,dword ptr [ebp-8]
 005787CC    mov         edx,579798;'augmentedfourths'
 005787D1    call        @LStrEqual
>005787D6    je          00578A8A
 005787DC    mov         eax,dword ptr [ebp-8]
 005787DF    mov         edx,5797B8;'tritone'
 005787E4    call        @LStrEqual
>005787E9    je          00578A8A
 005787EF    mov         eax,dword ptr [ebp-8]
 005787F2    mov         edx,5797CC;'tritones'
 005787F7    call        @LStrEqual
>005787FC    je          00578A8A
 00578802    mov         eax,dword ptr [ebp-8]
 00578805    mov         edx,5797E4;'diminishedfifth'
 0057880A    call        @LStrEqual
>0057880F    je          00578A8A
 00578815    mov         eax,dword ptr [ebp-8]
 00578818    mov         edx,579800;'diminishedfifths'
 0057881D    call        @LStrEqual
>00578822    je          00578A8A
 00578828    mov         eax,dword ptr [ebp-8]
 0057882B    mov         edx,579820;'perfectfifth'
 00578830    call        @LStrEqual
>00578835    je          00578A8A
 0057883B    mov         eax,dword ptr [ebp-8]
 0057883E    mov         edx,57983C;'perfectfifths'
 00578843    call        @LStrEqual
>00578848    je          00578A8A
 0057884E    mov         eax,dword ptr [ebp-8]
 00578851    mov         edx,579858;'augmentedfifth'
 00578856    call        @LStrEqual
>0057885B    je          00578A8A
 00578861    mov         eax,dword ptr [ebp-8]
 00578864    mov         edx,579874;'augmentedfifths'
 00578869    call        @LStrEqual
>0057886E    je          00578A8A
 00578874    mov         eax,dword ptr [ebp-8]
 00578877    mov         edx,579890;'diminishedsixth'
 0057887C    call        @LStrEqual
>00578881    je          00578A8A
 00578887    mov         eax,dword ptr [ebp-8]
 0057888A    mov         edx,5798AC;'diminishedsixths'
 0057888F    call        @LStrEqual
>00578894    je          00578A8A
 0057889A    mov         eax,dword ptr [ebp-8]
 0057889D    mov         edx,5798CC;'minorsixth'
 005788A2    call        @LStrEqual
>005788A7    je          00578A8A
 005788AD    mov         eax,dword ptr [ebp-8]
 005788B0    mov         edx,5798E4;'minorsixths'
 005788B5    call        @LStrEqual
>005788BA    je          00578A8A
 005788C0    mov         eax,dword ptr [ebp-8]
 005788C3    mov         edx,5798FC;'majorsixth'
 005788C8    call        @LStrEqual
>005788CD    je          00578A8A
 005788D3    mov         eax,dword ptr [ebp-8]
 005788D6    mov         edx,579914;'majorsixths'
 005788DB    call        @LStrEqual
>005788E0    je          00578A8A
 005788E6    mov         eax,dword ptr [ebp-8]
 005788E9    mov         edx,57992C;'augmentedsixth'
 005788EE    call        @LStrEqual
>005788F3    je          00578A8A
 005788F9    mov         eax,dword ptr [ebp-8]
 005788FC    mov         edx,579948;'augmentedsixths'
 00578901    call        @LStrEqual
>00578906    je          00578A8A
 0057890C    mov         eax,dword ptr [ebp-8]
 0057890F    mov         edx,579964;'diminishedseventh'
 00578914    call        @LStrEqual
>00578919    je          00578A8A
 0057891F    mov         eax,dword ptr [ebp-8]
 00578922    mov         edx,579984;'diminishedsevenths'
 00578927    call        @LStrEqual
>0057892C    je          00578A8A
 00578932    mov         eax,dword ptr [ebp-8]
 00578935    mov         edx,5799A4;'minorseventh'
 0057893A    call        @LStrEqual
>0057893F    je          00578A8A
 00578945    mov         eax,dword ptr [ebp-8]
 00578948    mov         edx,5799C0;'minorsevenths'
 0057894D    call        @LStrEqual
>00578952    je          00578A8A
 00578958    mov         eax,dword ptr [ebp-8]
 0057895B    mov         edx,5799DC;'majorseventh'
 00578960    call        @LStrEqual
>00578965    je          00578A8A
 0057896B    mov         eax,dword ptr [ebp-8]
 0057896E    mov         edx,5799F8;'majorsevenths'
 00578973    call        @LStrEqual
>00578978    je          00578A8A
 0057897E    mov         eax,dword ptr [ebp-8]
 00578981    mov         edx,579A14;'augmentedseventh'
 00578986    call        @LStrEqual
>0057898B    je          00578A8A
 00578991    mov         eax,dword ptr [ebp-8]
 00578994    mov         edx,579A34;'augmentedsevenths'
 00578999    call        @LStrEqual
>0057899E    je          00578A8A
 005789A4    mov         eax,dword ptr [ebp-8]
 005789A7    mov         edx,579A54;'halfstep'
 005789AC    call        @LStrEqual
>005789B1    je          00578A8A
 005789B7    mov         eax,dword ptr [ebp-8]
 005789BA    mov         edx,579A6C;'wholestep'
 005789BF    call        @LStrEqual
>005789C4    je          00578A8A
 005789CA    mov         eax,dword ptr [ebp-8]
 005789CD    mov         edx,579A84;'newtons'
 005789D2    call        @LStrEqual
>005789D7    je          00578A8A
 005789DD    mov         eax,dword ptr [ebp-8]
 005789E0    mov         edx,579A98;'kilogrammetres'
 005789E5    call        @LStrEqual
>005789EA    je          00578A8A
 005789F0    mov         eax,dword ptr [ebp-8]
 005789F3    mov         edx,579AB4;'kilogrammeters'
 005789F8    call        @LStrEqual
>005789FD    je          00578A8A
 00578A03    mov         eax,dword ptr [ebp-8]
 00578A06    mov         edx,579AD0;'kgmetres'
 00578A0B    call        @LStrEqual
>00578A10    je          00578A8A
 00578A12    mov         eax,dword ptr [ebp-8]
 00578A15    mov         edx,579AE8;'kgmeters'
 00578A1A    call        @LStrEqual
>00578A1F    je          00578A8A
 00578A21    mov         eax,dword ptr [ebp-8]
 00578A24    mov         edx,579B00;'rotation'
 00578A29    call        @LStrEqual
>00578A2E    je          00578A8A
 00578A30    mov         eax,dword ptr [ebp-8]
 00578A33    mov         edx,579B18;'rotations'
 00578A38    call        @LStrEqual
>00578A3D    je          00578A8A
 00578A3F    mov         eax,dword ptr [ebp-8]
 00578A42    mov         edx,579B30;'revolution'
 00578A47    call        @LStrEqual
>00578A4C    je          00578A8A
 00578A4E    mov         eax,dword ptr [ebp-8]
 00578A51    mov         edx,579B48;'revolutions'
 00578A56    call        @LStrEqual
>00578A5B    je          00578A8A
 00578A5D    mov         eax,dword ptr [ebp-8]
 00578A60    mov         edx,579B60;'pieframes'
 00578A65    call        @LStrEqual
>00578A6A    je          00578A8A
 00578A6C    mov         eax,dword ptr [ebp-8]
 00578A6F    mov         edx,579B78;'pieframe'
 00578A74    call        @LStrEqual
>00578A79    je          00578A8A
 00578A7B    mov         eax,dword ptr [ebp-8]
 00578A7E    mov         edx,579B90;'mickeys'
 00578A83    call        @LStrEqual
>00578A88    jne         00578A8C
 00578A8A    mov         bl,5
 00578A8C    xor         eax,eax
 00578A8E    pop         edx
 00578A8F    pop         ecx
 00578A90    pop         ecx
 00578A91    mov         dword ptr fs:[eax],edx
 00578A94    push        578ABE
 00578A99    lea         eax,[ebp-10]
 00578A9C    mov         edx,2
 00578AA1    call        @UStrArrayClr
 00578AA6    lea         eax,[ebp-8]
 00578AA9    call        @LStrClr
 00578AAE    lea         eax,[ebp-4]
 00578AB1    call        @UStrClr
 00578AB6    ret
>00578AB7    jmp         @HandleFinally
>00578ABC    jmp         00578A99
 00578ABE    mov         eax,ebx
 00578AC0    pop         ebx
 00578AC1    mov         esp,ebp
 00578AC3    pop         ebp
 00578AC4    ret
end;*}

//00579B98
{*function sub_00579B98(?:?):?;
begin
 00579B98    add         eax,0FFFFFF44
 00579B9D    sub         ax,3
>00579BA1    jb          00579BB0
 00579BA3    add         eax,0FFFFDF6C
 00579BA8    sub         ax,0C
>00579BAC    jb          00579BB3
>00579BAE    jmp         00579BB6
 00579BB0    mov         al,1
 00579BB2    ret
 00579BB3    mov         al,1
 00579BB5    ret
 00579BB6    xor         eax,eax
 00579BB8    ret
end;*}

//00579BBC
{*function sub_00579BBC(?:?):?;
begin
 00579BBC    add         esp,0FFFFFFF8
 00579BBF    movzx       eax,ax
 00579BC2    cmp         eax,2157
>00579BC7    jg          00579C0C
>00579BC9    je          00579CC3
 00579BCF    cmp         eax,2153
>00579BD4    jg          00579BEE
>00579BD6    je          00579C73
 00579BDC    sub         eax,0BC
>00579BE1    je          00579C3D
 00579BE3    dec         eax
>00579BE4    je          00579C4F
 00579BE6    dec         eax
>00579BE7    je          00579C61
>00579BE9    jmp         00579D43
 00579BEE    sub         eax,2154
>00579BF3    je          00579C87
 00579BF9    dec         eax
>00579BFA    je          00579C9B
 00579C00    dec         eax
>00579C01    je          00579CAF
>00579C07    jmp         00579D43
 00579C0C    add         eax,0FFFFDEA8
 00579C11    cmp         eax,6
>00579C14    ja          00579D43
 00579C1A    jmp         dword ptr [eax*4+579C21]
 00579C1A    dd          00579CD4
 00579C1A    dd          00579CE5
 00579C1A    dd          00579CF6
 00579C1A    dd          00579D07
 00579C1A    dd          00579D16
 00579C1A    dd          00579D25
 00579C1A    dd          00579D34
 00579C3D    xor         eax,eax
 00579C3F    mov         dword ptr [esp],eax
 00579C42    mov         dword ptr [esp+4],3FD00000
>00579C4A    jmp         00579D4C
 00579C4F    xor         eax,eax
 00579C51    mov         dword ptr [esp],eax
 00579C54    mov         dword ptr [esp+4],3FE00000
>00579C5C    jmp         00579D4C
 00579C61    xor         eax,eax
 00579C63    mov         dword ptr [esp],eax
 00579C66    mov         dword ptr [esp+4],3FE80000
>00579C6E    jmp         00579D4C
 00579C73    mov         dword ptr [esp],55555555
 00579C7A    mov         dword ptr [esp+4],3FD55555
>00579C82    jmp         00579D4C
 00579C87    mov         dword ptr [esp],55555555
 00579C8E    mov         dword ptr [esp+4],3FE55555
>00579C96    jmp         00579D4C
 00579C9B    mov         dword ptr [esp],9999999A
 00579CA2    mov         dword ptr [esp+4],3FC99999
>00579CAA    jmp         00579D4C
 00579CAF    mov         dword ptr [esp],9999999A
 00579CB6    mov         dword ptr [esp+4],3FD99999
>00579CBE    jmp         00579D4C
 00579CC3    mov         dword ptr [esp],33333333
 00579CCA    mov         dword ptr [esp+4],3FE33333
>00579CD2    jmp         00579D4C
 00579CD4    mov         dword ptr [esp],9999999A
 00579CDB    mov         dword ptr [esp+4],3FE99999
>00579CE3    jmp         00579D4C
 00579CE5    mov         dword ptr [esp],55555555
 00579CEC    mov         dword ptr [esp+4],3FC55555
>00579CF4    jmp         00579D4C
 00579CF6    mov         dword ptr [esp],0AAAAAAAB
 00579CFD    mov         dword ptr [esp+4],3FEAAAAA
>00579D05    jmp         00579D4C
 00579D07    xor         eax,eax
 00579D09    mov         dword ptr [esp],eax
 00579D0C    mov         dword ptr [esp+4],3FC00000
>00579D14    jmp         00579D4C
 00579D16    xor         eax,eax
 00579D18    mov         dword ptr [esp],eax
 00579D1B    mov         dword ptr [esp+4],3FD80000
>00579D23    jmp         00579D4C
 00579D25    xor         eax,eax
 00579D27    mov         dword ptr [esp],eax
 00579D2A    mov         dword ptr [esp+4],3FE40000
>00579D32    jmp         00579D4C
 00579D34    xor         eax,eax
 00579D36    mov         dword ptr [esp],eax
 00579D39    mov         dword ptr [esp+4],3FEC0000
>00579D41    jmp         00579D4C
 00579D43    xor         eax,eax
 00579D45    mov         dword ptr [esp],eax
 00579D48    mov         dword ptr [esp+4],eax
 00579D4C    fld         qword ptr [esp]
 00579D4F    pop         ecx
 00579D50    pop         edx
 00579D51    ret
end;*}

//00579D54
procedure sub_00579D54(?:TScanner);
begin
{*
 00579D54    push        ebx
 00579D55    push        esi
 00579D56    add         esp,0FFFFFFE4
 00579D59    mov         ebx,eax
 00579D5B    mov         esi,dword ptr [ebx+24]
 00579D5E    mov         byte ptr [ebx+8],8
 00579D62    lea         eax,[ebx+0C]
 00579D65    call        @UStrClr
 00579D6A    mov         edx,esi
 00579D6C    mov         eax,dword ptr [ebx+4]
 00579D6F    call        00577450
 00579D74    call        004F8708
 00579D79    fstp        tbyte ptr [esp]
 00579D7C    wait
 00579D7D    fld         tbyte ptr [esp]
 00579D80    call        @ROUND
 00579D85    mov         dword ptr [ebx+10],eax
 00579D88    mov         dword ptr [ebx+14],edx
 00579D8B    fld         tbyte ptr [esp]
 00579D8E    fstp        qword ptr [ebx+18]
 00579D91    wait
 00579D92    lea         eax,[esi+1]
 00579D95    mov         dword ptr [ebx+24],eax
 00579D98    mov         eax,dword ptr [esp]
 00579D9B    mov         dword ptr [esp+10],eax
 00579D9F    mov         eax,dword ptr [esp+4]
 00579DA3    mov         dword ptr [esp+14],eax
 00579DA7    mov         ax,word ptr [esp+8]
 00579DAC    mov         word ptr [esp+18],ax
 00579DB1    inc         esi
 00579DB2    mov         edx,esi
 00579DB4    mov         eax,dword ptr [ebx+4]
 00579DB7    call        00577450
 00579DBC    call        004F8D08
 00579DC1    test        al,al
>00579DC3    je          00579E52
 00579DC9    mov         edx,esi
 00579DCB    mov         eax,dword ptr [ebx+4]
 00579DCE    call        00577450
 00579DD3    call        004F8708
 00579DD8    fstp        tbyte ptr [esp]
 00579DDB    wait
 00579DDC    fld         tbyte ptr [esp]
 00579DDF    fcomp       dword ptr ds:[579E58];10:Single
 00579DE5    wait
 00579DE6    fnstsw      al
 00579DE8    sahf
>00579DE9    jae         00579DFB
 00579DEB    fld         tbyte ptr [esp+10]
 00579DEF    fcomp       dword ptr ds:[579E58];10:Single
 00579DF5    wait
 00579DF6    fnstsw      al
 00579DF8    sahf
>00579DF9    jb          00579E52
 00579DFB    fld         tbyte ptr [esp]
 00579DFE    fld         tbyte ptr [esp+10]
 00579E02    fcompp
 00579E04    wait
 00579E05    fnstsw      al
 00579E07    sahf
>00579E08    je          00579E52
 00579E0A    fld         tbyte ptr [esp]
 00579E0D    fld         tbyte ptr [esp+10]
 00579E11    fcompp
 00579E13    wait
 00579E14    fnstsw      al
 00579E16    sahf
>00579E17    jbe         00579E29
 00579E19    fld         tbyte ptr [esp+10]
 00579E1D    fld         tbyte ptr [esp]
 00579E20    faddp       st(1),st
 00579E22    fstp        tbyte ptr [esp+10]
 00579E26    wait
>00579E27    jmp         00579E37
 00579E29    fld         tbyte ptr [esp+10]
 00579E2D    fld         tbyte ptr [esp]
 00579E30    fmulp       st(1),st
 00579E32    fstp        tbyte ptr [esp+10]
 00579E36    wait
 00579E37    fld         tbyte ptr [esp+10]
 00579E3B    fstp        qword ptr [ebx+18]
 00579E3E    wait
 00579E3F    fld         tbyte ptr [esp+10]
 00579E43    call        @ROUND
 00579E48    mov         dword ptr [ebx+10],eax
 00579E4B    mov         dword ptr [ebx+14],edx
 00579E4E    inc         esi
 00579E4F    mov         dword ptr [ebx+24],esi
 00579E52    add         esp,1C
 00579E55    pop         esi
 00579E56    pop         ebx
 00579E57    ret
*}
end;

//00579E5C
{*procedure sub_00579E5C(?:TScanner; ?:?);
begin
 00579E5C    push        ebp
 00579E5D    mov         ebp,esp
 00579E5F    mov         ecx,0D
 00579E64    push        0
 00579E66    push        0
 00579E68    dec         ecx
>00579E69    jne         00579E64
 00579E6B    push        ecx
 00579E6C    push        ebx
 00579E6D    push        esi
 00579E6E    push        edi
 00579E6F    mov         byte ptr [ebp-9],dl
 00579E72    mov         dword ptr [ebp-8],eax
 00579E75    xor         eax,eax
 00579E77    push        ebp
 00579E78    push        57B0C2
 00579E7D    push        dword ptr fs:[eax]
 00579E80    mov         dword ptr fs:[eax],esp
 00579E83    mov         eax,dword ptr [ebp-8]
 00579E86    mov         ebx,dword ptr [eax+24]
 00579E89    mov         dword ptr [ebp-10],ebx
 00579E8C    mov         eax,dword ptr [ebp-8]
 00579E8F    mov         eax,dword ptr [eax+4]
 00579E92    test        eax,eax
>00579E94    je          00579E9B
 00579E96    sub         eax,4
 00579E99    mov         eax,dword ptr [eax]
 00579E9B    mov         edi,eax
 00579E9D    mov         edx,ebx
 00579E9F    dec         edx
 00579EA0    mov         eax,dword ptr [ebp-8]
 00579EA3    mov         eax,dword ptr [eax+4]
 00579EA6    call        00577478
 00579EAB    cmp         ax,2C
>00579EAF    jne         00579EB5
 00579EB1    mov         byte ptr [ebp-9],0
 00579EB5    mov         eax,dword ptr [ebp-8]
 00579EB8    mov         eax,dword ptr [eax+4]
 00579EBB    mov         edx,ebx
 00579EBD    call        00577478
 00579EC2    mov         esi,eax
 00579EC4    inc         ebx
 00579EC5    cmp         si,30
>00579EC9    jne         00579EDE
 00579ECB    mov         eax,dword ptr [ebp-8]
 00579ECE    mov         eax,dword ptr [eax+4]
 00579ED1    mov         edx,ebx
 00579ED3    call        00577478
 00579ED8    cmp         ax,78
>00579EDC    je          00579EFF
 00579EDE    cmp         si,26
>00579EE2    jne         00579FBC
 00579EE8    mov         eax,dword ptr [ebp-8]
 00579EEB    mov         eax,dword ptr [eax+4]
 00579EEE    mov         edx,ebx
 00579EF0    call        00577478
 00579EF5    cmp         ax,68
>00579EF9    jne         00579FBC
 00579EFF    mov         eax,dword ptr [ebp-8]
 00579F02    mov         byte ptr [eax+8],0A
 00579F06    mov         eax,dword ptr [ebp-8]
 00579F09    add         eax,0C
 00579F0C    call        @UStrClr
 00579F11    inc         ebx
>00579F12    jmp         00579F4D
 00579F14    mov         eax,dword ptr [ebp-8]
 00579F17    mov         eax,dword ptr [eax+4]
 00579F1A    mov         edx,ebx
 00579F1C    call        00577478
 00579F21    cmp         ax,5F
>00579F25    je          00579F4C
 00579F27    mov         eax,dword ptr [ebp-8]
 00579F2A    mov         eax,dword ptr [eax+4]
 00579F2D    mov         edx,ebx
 00579F2F    call        00577478
 00579F34    mov         edx,eax
 00579F36    lea         eax,[ebp-18]
 00579F39    call        @UStrFromWChar
 00579F3E    mov         edx,dword ptr [ebp-18]
 00579F41    mov         eax,dword ptr [ebp-8]
 00579F44    add         eax,0C
 00579F47    call        @UStrCat
 00579F4C    inc         ebx
 00579F4D    mov         eax,dword ptr [ebp-8]
 00579F50    mov         eax,dword ptr [eax+4]
 00579F53    mov         edx,ebx
 00579F55    call        00577478
 00579F5A    call        00577A40
 00579F5F    test        al,al
>00579F61    jne         00579F14
 00579F63    mov         eax,dword ptr [ebp-8]
 00579F66    mov         eax,dword ptr [eax+0C]
 00579F69    test        eax,eax
>00579F6B    je          00579F72
 00579F6D    sub         eax,4
 00579F70    mov         eax,dword ptr [eax]
 00579F72    test        eax,eax
>00579F74    jne         00579F8F
 00579F76    mov         eax,ebx
 00579F78    dec         eax
 00579F79    mov         edx,dword ptr [ebp-8]
 00579F7C    mov         dword ptr [edx+24],eax
 00579F7F    mov         eax,dword ptr [ebp-8]
 00579F82    add         eax,0C
 00579F85    mov         edx,57B0DC;'0'
 00579F8A    call        @UStrAsg
 00579F8F    mov         eax,dword ptr [ebp-8]
 00579F92    mov         eax,dword ptr [eax+0C]
 00579F95    call        004F936C
 00579F9A    cdq
 00579F9B    mov         ecx,dword ptr [ebp-8]
 00579F9E    mov         dword ptr [ecx+10],eax
 00579FA1    mov         dword ptr [ecx+14],edx
 00579FA4    mov         eax,dword ptr [ebp-8]
 00579FA7    fild        qword ptr [eax+10]
 00579FAA    mov         eax,dword ptr [ebp-8]
 00579FAD    fstp        qword ptr [eax+18]
 00579FB0    wait
 00579FB1    mov         eax,dword ptr [ebp-8]
 00579FB4    mov         dword ptr [eax+24],ebx
>00579FB7    jmp         0057B092
 00579FBC    xor         eax,eax
 00579FBE    mov         dword ptr [ebp-14],eax
 00579FC1    cmp         edi,ebx
>00579FC3    jl          0057A040
 00579FC5    mov         eax,dword ptr [ebp-8]
 00579FC8    mov         eax,dword ptr [eax+4]
 00579FCB    mov         edx,ebx
 00579FCD    call        00577478
 00579FD2    mov         esi,eax
 00579FD4    cmp         si,61
>00579FD8    jb          00579FE0
 00579FDA    cmp         si,66
>00579FDE    jbe         00579FEC
 00579FE0    cmp         si,41
>00579FE4    jb          0057A00F
 00579FE6    cmp         si,46
>00579FEA    ja          0057A00F
 00579FEC    lea         eax,[ebp-1C]
 00579FEF    mov         edx,esi
 00579FF1    call        @UStrFromWChar
 00579FF6    mov         edx,dword ptr [ebp-1C]
 00579FF9    mov         eax,dword ptr [ebp-8]
 00579FFC    add         eax,0C
 00579FFF    call        @UStrCat
 0057A004    cmp         dword ptr [ebp-14],0
>0057A008    jne         0057A03B
 0057A00A    mov         dword ptr [ebp-14],ebx
>0057A00D    jmp         0057A03B
 0057A00F    cmp         si,30
>0057A013    jb          0057A035
 0057A015    cmp         si,39
>0057A019    ja          0057A035
 0057A01B    lea         eax,[ebp-20]
 0057A01E    mov         edx,esi
 0057A020    call        @UStrFromWChar
 0057A025    mov         edx,dword ptr [ebp-20]
 0057A028    mov         eax,dword ptr [ebp-8]
 0057A02B    add         eax,0C
 0057A02E    call        @UStrCat
>0057A033    jmp         0057A03B
 0057A035    cmp         si,5F
>0057A039    jne         0057A040
 0057A03B    inc         ebx
 0057A03C    cmp         edi,ebx
>0057A03E    jge         00579FC5
 0057A040    cmp         edi,ebx
>0057A042    jge         0057A4E6
 0057A048    cmp         dword ptr [ebp-14],0
>0057A04C    jne         0057A088
 0057A04E    mov         eax,dword ptr [ebp-8]
 0057A051    mov         byte ptr [eax+8],8
 0057A055    push        0
 0057A057    push        7FFFFFFF
 0057A05C    mov         eax,dword ptr [ebp-8]
 0057A05F    mov         eax,dword ptr [eax+0C]
 0057A062    call        StrToInt64Def
 0057A067    mov         ecx,dword ptr [ebp-8]
 0057A06A    mov         dword ptr [ecx+10],eax
 0057A06D    mov         dword ptr [ecx+14],edx
 0057A070    mov         eax,dword ptr [ebp-8]
 0057A073    fild        qword ptr [eax+10]
 0057A076    mov         eax,dword ptr [ebp-8]
 0057A079    fstp        qword ptr [eax+18]
 0057A07C    wait
 0057A07D    mov         eax,dword ptr [ebp-8]
 0057A080    mov         dword ptr [eax+24],ebx
>0057A083    jmp         0057B092
 0057A088    mov         eax,dword ptr [ebp-8]
 0057A08B    mov         eax,dword ptr [eax+4]
 0057A08E    mov         edx,dword ptr [ebp-14]
 0057A091    call        00577478
 0057A096    mov         esi,eax
 0057A098    cmp         si,65
>0057A09C    je          0057A0A8
 0057A09E    cmp         si,45
>0057A0A2    jne         0057A44A
 0057A0A8    mov         ebx,dword ptr [ebp-14]
 0057A0AB    inc         ebx
 0057A0AC    mov         eax,dword ptr [ebp-8]
 0057A0AF    add         eax,0C
 0057A0B2    push        eax
 0057A0B3    mov         ecx,dword ptr [ebp-14]
 0057A0B6    sub         ecx,dword ptr [ebp-10]
 0057A0B9    mov         eax,dword ptr [ebp-8]
 0057A0BC    mov         eax,dword ptr [eax+4]
 0057A0BF    mov         edx,dword ptr [ebp-10]
 0057A0C2    call        @UStrCopy
 0057A0C7    mov         eax,dword ptr [ebp-8]
 0057A0CA    mov         eax,dword ptr [eax+4]
 0057A0CD    mov         edx,ebx
 0057A0CF    call        00577478
 0057A0D4    mov         esi,eax
 0057A0D6    cmp         si,2D
>0057A0DA    jne         0057A1BD
 0057A0E0    mov         eax,dword ptr [ebp-8]
 0057A0E3    mov         byte ptr [eax+8],9
 0057A0E7    mov         eax,dword ptr [ebp-8]
 0057A0EA    add         eax,0C
 0057A0ED    mov         edx,57B0EC;'e-'
 0057A0F2    call        @UStrCat
 0057A0F7    inc         ebx
>0057A0F8    jmp         0057A120
 0057A0FA    mov         eax,dword ptr [ebp-8]
 0057A0FD    mov         eax,dword ptr [eax+4]
 0057A100    mov         edx,ebx
 0057A102    call        00577478
 0057A107    mov         edx,eax
 0057A109    lea         eax,[ebp-24]
 0057A10C    call        @UStrFromWChar
 0057A111    mov         edx,dword ptr [ebp-24]
 0057A114    mov         eax,dword ptr [ebp-8]
 0057A117    add         eax,0C
 0057A11A    call        @UStrCat
 0057A11F    inc         ebx
 0057A120    cmp         edi,ebx
>0057A122    jl          0057A14A
 0057A124    mov         eax,dword ptr [ebp-8]
 0057A127    mov         eax,dword ptr [eax+4]
 0057A12A    mov         edx,ebx
 0057A12C    call        00577478
 0057A131    cmp         ax,30
>0057A135    jb          0057A14A
 0057A137    mov         eax,dword ptr [ebp-8]
 0057A13A    mov         eax,dword ptr [eax+4]
 0057A13D    mov         edx,ebx
 0057A13F    call        00577478
 0057A144    cmp         ax,39
>0057A148    jbe         0057A0FA
 0057A14A    mov         eax,dword ptr [ebp-8]
 0057A14D    mov         dword ptr [eax+24],ebx
 0057A150    push        0FFFF
 0057A155    push        0C0000000
 0057A15A    push        0
 0057A15C    mov         eax,dword ptr [ebp-8]
 0057A15F    mov         eax,dword ptr [eax+0C]
 0057A162    call        004F8DB8
 0057A167    mov         eax,dword ptr [ebp-8]
 0057A16A    fstp        qword ptr [eax+18]
 0057A16D    wait
 0057A16E    xor         eax,eax
 0057A170    push        ebp
 0057A171    push        57A19D
 0057A176    push        dword ptr fs:[eax]
 0057A179    mov         dword ptr fs:[eax],esp
 0057A17C    mov         eax,dword ptr [ebp-8]
 0057A17F    fld         qword ptr [eax+18]
 0057A182    call        @ROUND
 0057A187    mov         ecx,dword ptr [ebp-8]
 0057A18A    mov         dword ptr [ecx+10],eax
 0057A18D    mov         dword ptr [ecx+14],edx
 0057A190    xor         eax,eax
 0057A192    pop         edx
 0057A193    pop         ecx
 0057A194    pop         ecx
 0057A195    mov         dword ptr fs:[eax],edx
>0057A198    jmp         0057B092
>0057A19D    jmp         @HandleAnyException
 0057A1A2    mov         eax,dword ptr [ebp-8]
 0057A1A5    mov         dword ptr [eax+10],0
 0057A1AC    mov         dword ptr [eax+14],0
 0057A1B3    call        @DoneExcept
>0057A1B8    jmp         0057B092
 0057A1BD    cmp         si,2B
>0057A1C1    jne         0057A2A4
 0057A1C7    mov         eax,dword ptr [ebp-8]
 0057A1CA    mov         byte ptr [eax+8],8
 0057A1CE    mov         eax,dword ptr [ebp-8]
 0057A1D1    add         eax,0C
 0057A1D4    mov         edx,57B100;'e'
 0057A1D9    call        @UStrCat
 0057A1DE    inc         ebx
>0057A1DF    jmp         0057A207
 0057A1E1    mov         eax,dword ptr [ebp-8]
 0057A1E4    mov         eax,dword ptr [eax+4]
 0057A1E7    mov         edx,ebx
 0057A1E9    call        00577478
 0057A1EE    mov         edx,eax
 0057A1F0    lea         eax,[ebp-28]
 0057A1F3    call        @UStrFromWChar
 0057A1F8    mov         edx,dword ptr [ebp-28]
 0057A1FB    mov         eax,dword ptr [ebp-8]
 0057A1FE    add         eax,0C
 0057A201    call        @UStrCat
 0057A206    inc         ebx
 0057A207    cmp         edi,ebx
>0057A209    jl          0057A231
 0057A20B    mov         eax,dword ptr [ebp-8]
 0057A20E    mov         eax,dword ptr [eax+4]
 0057A211    mov         edx,ebx
 0057A213    call        00577478
 0057A218    cmp         ax,30
>0057A21C    jb          0057A231
 0057A21E    mov         eax,dword ptr [ebp-8]
 0057A221    mov         eax,dword ptr [eax+4]
 0057A224    mov         edx,ebx
 0057A226    call        00577478
 0057A22B    cmp         ax,39
>0057A22F    jbe         0057A1E1
 0057A231    mov         eax,dword ptr [ebp-8]
 0057A234    mov         dword ptr [eax+24],ebx
 0057A237    push        0FFFF
 0057A23C    push        0C0000000
 0057A241    push        0
 0057A243    mov         eax,dword ptr [ebp-8]
 0057A246    mov         eax,dword ptr [eax+0C]
 0057A249    call        004F8DB8
 0057A24E    mov         eax,dword ptr [ebp-8]
 0057A251    fstp        qword ptr [eax+18]
 0057A254    wait
 0057A255    xor         eax,eax
 0057A257    push        ebp
 0057A258    push        57A284
 0057A25D    push        dword ptr fs:[eax]
 0057A260    mov         dword ptr fs:[eax],esp
 0057A263    mov         eax,dword ptr [ebp-8]
 0057A266    fld         qword ptr [eax+18]
 0057A269    call        @ROUND
 0057A26E    mov         ecx,dword ptr [ebp-8]
 0057A271    mov         dword ptr [ecx+10],eax
 0057A274    mov         dword ptr [ecx+14],edx
 0057A277    xor         eax,eax
 0057A279    pop         edx
 0057A27A    pop         ecx
 0057A27B    pop         ecx
 0057A27C    mov         dword ptr fs:[eax],edx
>0057A27F    jmp         0057B092
>0057A284    jmp         @HandleAnyException
 0057A289    mov         eax,dword ptr [ebp-8]
 0057A28C    mov         dword ptr [eax+10],0
 0057A293    mov         dword ptr [eax+14],0
 0057A29A    call        @DoneExcept
>0057A29F    jmp         0057B092
 0057A2A4    mov         eax,dword ptr [ebp-8]
 0057A2A7    mov         eax,dword ptr [eax+4]
 0057A2AA    mov         edx,ebx
 0057A2AC    call        00577478
 0057A2B1    cmp         ax,30
>0057A2B5    jb          0057A3AE
 0057A2BB    mov         eax,dword ptr [ebp-8]
 0057A2BE    mov         eax,dword ptr [eax+4]
 0057A2C1    mov         edx,ebx
 0057A2C3    call        00577478
 0057A2C8    cmp         ax,39
>0057A2CC    ja          0057A3AE
 0057A2D2    mov         eax,dword ptr [ebp-8]
 0057A2D5    mov         byte ptr [eax+8],8
 0057A2D9    mov         eax,dword ptr [ebp-8]
 0057A2DC    add         eax,0C
 0057A2DF    mov         edx,57B100;'e'
 0057A2E4    call        @UStrCat
>0057A2E9    jmp         0057A311
 0057A2EB    mov         eax,dword ptr [ebp-8]
 0057A2EE    mov         eax,dword ptr [eax+4]
 0057A2F1    mov         edx,ebx
 0057A2F3    call        00577478
 0057A2F8    mov         edx,eax
 0057A2FA    lea         eax,[ebp-2C]
 0057A2FD    call        @UStrFromWChar
 0057A302    mov         edx,dword ptr [ebp-2C]
 0057A305    mov         eax,dword ptr [ebp-8]
 0057A308    add         eax,0C
 0057A30B    call        @UStrCat
 0057A310    inc         ebx
 0057A311    cmp         edi,ebx
>0057A313    jl          0057A33B
 0057A315    mov         eax,dword ptr [ebp-8]
 0057A318    mov         eax,dword ptr [eax+4]
 0057A31B    mov         edx,ebx
 0057A31D    call        00577478
 0057A322    cmp         ax,30
>0057A326    jb          0057A33B
 0057A328    mov         eax,dword ptr [ebp-8]
 0057A32B    mov         eax,dword ptr [eax+4]
 0057A32E    mov         edx,ebx
 0057A330    call        00577478
 0057A335    cmp         ax,39
>0057A339    jbe         0057A2EB
 0057A33B    mov         eax,dword ptr [ebp-8]
 0057A33E    mov         dword ptr [eax+24],ebx
 0057A341    push        0FFFF
 0057A346    push        0C0000000
 0057A34B    push        0
 0057A34D    mov         eax,dword ptr [ebp-8]
 0057A350    mov         eax,dword ptr [eax+0C]
 0057A353    call        004F8DB8
 0057A358    mov         eax,dword ptr [ebp-8]
 0057A35B    fstp        qword ptr [eax+18]
 0057A35E    wait
 0057A35F    xor         eax,eax
 0057A361    push        ebp
 0057A362    push        57A38E
 0057A367    push        dword ptr fs:[eax]
 0057A36A    mov         dword ptr fs:[eax],esp
 0057A36D    mov         eax,dword ptr [ebp-8]
 0057A370    fld         qword ptr [eax+18]
 0057A373    call        @ROUND
 0057A378    mov         ecx,dword ptr [ebp-8]
 0057A37B    mov         dword ptr [ecx+10],eax
 0057A37E    mov         dword ptr [ecx+14],edx
 0057A381    xor         eax,eax
 0057A383    pop         edx
 0057A384    pop         ecx
 0057A385    pop         ecx
 0057A386    mov         dword ptr fs:[eax],edx
>0057A389    jmp         0057B092
>0057A38E    jmp         @HandleAnyException
 0057A393    mov         eax,dword ptr [ebp-8]
 0057A396    mov         dword ptr [eax+10],0
 0057A39D    mov         dword ptr [eax+14],0
 0057A3A4    call        @DoneExcept
>0057A3A9    jmp         0057B092
 0057A3AE    mov         eax,dword ptr [ebp-8]
 0057A3B1    mov         edx,dword ptr [ebp-14]
 0057A3B4    mov         dword ptr [eax+24],edx
 0057A3B7    mov         eax,dword ptr [ebp-8]
 0057A3BA    mov         byte ptr [eax+8],8
 0057A3BE    mov         eax,dword ptr [ebp-8]
 0057A3C1    add         eax,0C
 0057A3C4    call        @UStrClr
 0057A3C9    mov         ebx,dword ptr [ebp-10]
>0057A3CC    jmp         0057A407
 0057A3CE    mov         eax,dword ptr [ebp-8]
 0057A3D1    mov         eax,dword ptr [eax+4]
 0057A3D4    mov         edx,ebx
 0057A3D6    call        00577478
 0057A3DB    cmp         ax,5F
>0057A3DF    je          0057A406
 0057A3E1    mov         eax,dword ptr [ebp-8]
 0057A3E4    mov         eax,dword ptr [eax+4]
 0057A3E7    mov         edx,ebx
 0057A3E9    call        00577478
 0057A3EE    mov         edx,eax
 0057A3F0    lea         eax,[ebp-30]
 0057A3F3    call        @UStrFromWChar
 0057A3F8    mov         edx,dword ptr [ebp-30]
 0057A3FB    mov         eax,dword ptr [ebp-8]
 0057A3FE    add         eax,0C
 0057A401    call        @UStrCat
 0057A406    inc         ebx
 0057A407    mov         eax,dword ptr [ebp-8]
 0057A40A    cmp         ebx,dword ptr [eax+24]
>0057A40D    jl          0057A3CE
 0057A40F    push        0
 0057A411    push        0
 0057A413    mov         eax,dword ptr [ebp-8]
 0057A416    mov         eax,dword ptr [eax+0C]
 0057A419    call        StrToInt64Def
 0057A41E    mov         ecx,dword ptr [ebp-8]
 0057A421    mov         dword ptr [ecx+10],eax
 0057A424    mov         dword ptr [ecx+14],edx
 0057A427    push        0FFFF
 0057A42C    push        0C0000000
 0057A431    push        0
 0057A433    mov         eax,dword ptr [ebp-8]
 0057A436    mov         eax,dword ptr [eax+0C]
 0057A439    call        004F8DB8
 0057A43E    mov         eax,dword ptr [ebp-8]
 0057A441    fstp        qword ptr [eax+18]
 0057A444    wait
>0057A445    jmp         0057B092
 0057A44A    mov         eax,dword ptr [ebp-8]
 0057A44D    mov         edx,dword ptr [ebp-14]
 0057A450    mov         dword ptr [eax+24],edx
 0057A453    mov         eax,dword ptr [ebp-8]
 0057A456    mov         byte ptr [eax+8],8
 0057A45A    mov         eax,dword ptr [ebp-8]
 0057A45D    add         eax,0C
 0057A460    call        @UStrClr
 0057A465    mov         ebx,dword ptr [ebp-10]
>0057A468    jmp         0057A4A3
 0057A46A    mov         eax,dword ptr [ebp-8]
 0057A46D    mov         eax,dword ptr [eax+4]
 0057A470    mov         edx,ebx
 0057A472    call        00577450
 0057A477    cmp         ax,5F
>0057A47B    je          0057A4A2
 0057A47D    mov         eax,dword ptr [ebp-8]
 0057A480    mov         eax,dword ptr [eax+4]
 0057A483    mov         edx,ebx
 0057A485    call        00577478
 0057A48A    mov         edx,eax
 0057A48C    lea         eax,[ebp-34]
 0057A48F    call        @UStrFromWChar
 0057A494    mov         edx,dword ptr [ebp-34]
 0057A497    mov         eax,dword ptr [ebp-8]
 0057A49A    add         eax,0C
 0057A49D    call        @UStrCat
 0057A4A2    inc         ebx
 0057A4A3    mov         eax,dword ptr [ebp-8]
 0057A4A6    cmp         ebx,dword ptr [eax+24]
>0057A4A9    jl          0057A46A
 0057A4AB    push        0
 0057A4AD    push        0
 0057A4AF    mov         eax,dword ptr [ebp-8]
 0057A4B2    mov         eax,dword ptr [eax+0C]
 0057A4B5    call        StrToInt64Def
 0057A4BA    mov         ecx,dword ptr [ebp-8]
 0057A4BD    mov         dword ptr [ecx+10],eax
 0057A4C0    mov         dword ptr [ecx+14],edx
 0057A4C3    push        0FFFF
 0057A4C8    push        0C0000000
 0057A4CD    push        0
 0057A4CF    mov         eax,dword ptr [ebp-8]
 0057A4D2    mov         eax,dword ptr [eax+0C]
 0057A4D5    call        004F8DB8
 0057A4DA    mov         eax,dword ptr [ebp-8]
 0057A4DD    fstp        qword ptr [eax+18]
 0057A4E0    wait
>0057A4E1    jmp         0057B092
 0057A4E6    mov         eax,dword ptr [ebp-8]
 0057A4E9    mov         eax,dword ptr [eax+4]
 0057A4EC    mov         edx,ebx
 0057A4EE    call        00577478
 0057A4F3    mov         esi,eax
 0057A4F5    cmp         si,68
>0057A4F9    je          0057A501
 0057A4FB    cmp         si,48
>0057A4FF    jne         0057A55E
 0057A501    lea         edx,[ebx+1]
 0057A504    mov         eax,dword ptr [ebp-8]
 0057A507    mov         eax,dword ptr [eax+4]
 0057A50A    call        00577478
 0057A50F    cmp         ax,7A
>0057A513    je          0057A55E
 0057A515    lea         edx,[ebx+1]
 0057A518    mov         eax,dword ptr [ebp-8]
 0057A51B    mov         eax,dword ptr [eax+4]
 0057A51E    call        00577478
 0057A523    cmp         ax,5A
>0057A527    je          0057A55E
 0057A529    mov         eax,dword ptr [ebp-8]
 0057A52C    mov         byte ptr [eax+8],0A
 0057A530    mov         eax,dword ptr [ebp-8]
 0057A533    mov         eax,dword ptr [eax+0C]
 0057A536    call        004F936C
 0057A53B    cdq
 0057A53C    mov         ecx,dword ptr [ebp-8]
 0057A53F    mov         dword ptr [ecx+10],eax
 0057A542    mov         dword ptr [ecx+14],edx
 0057A545    mov         eax,dword ptr [ebp-8]
 0057A548    fild        qword ptr [eax+10]
 0057A54B    mov         eax,dword ptr [ebp-8]
 0057A54E    fstp        qword ptr [eax+18]
 0057A551    wait
 0057A552    inc         ebx
 0057A553    mov         eax,dword ptr [ebp-8]
 0057A556    mov         dword ptr [eax+24],ebx
>0057A559    jmp         0057B092
 0057A55E    mov         eax,esi
 0057A560    call        00579B98
 0057A565    test        al,al
>0057A567    je          0057A5F0
 0057A56D    cmp         dword ptr [ebp-14],0
>0057A571    jne         0057A5F0
 0057A573    mov         eax,dword ptr [ebp-8]
 0057A576    mov         byte ptr [eax+8],9
 0057A57A    push        0FFFF
 0057A57F    push        0C0000000
 0057A584    push        0
 0057A586    mov         eax,dword ptr [ebp-8]
 0057A589    mov         eax,dword ptr [eax+0C]
 0057A58C    call        004F8DB8
 0057A591    fstp        tbyte ptr [ebp-40]
 0057A594    wait
 0057A595    mov         eax,esi
 0057A597    call        00579BBC
 0057A59C    fld         tbyte ptr [ebp-40]
 0057A59F    faddp       st(1),st
 0057A5A1    mov         eax,dword ptr [ebp-8]
 0057A5A4    fstp        qword ptr [eax+18]
 0057A5A7    wait
 0057A5A8    mov         eax,dword ptr [ebp-8]
 0057A5AB    fld         qword ptr [eax+18]
 0057A5AE    call        @ROUND
 0057A5B3    mov         ecx,dword ptr [ebp-8]
 0057A5B6    mov         dword ptr [ecx+10],eax
 0057A5B9    mov         dword ptr [ecx+14],edx
 0057A5BC    mov         eax,dword ptr [ebp-8]
 0057A5BF    fld         qword ptr [eax+18]
 0057A5C2    add         esp,0FFFFFFF4
 0057A5C5    fstp        tbyte ptr [esp]
 0057A5C8    wait
 0057A5C9    lea         edx,[ebp-4]
 0057A5CC    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 0057A5D1    call        FloatToStr
 0057A5D6    mov         eax,dword ptr [ebp-8]
 0057A5D9    add         eax,0C
 0057A5DC    mov         edx,dword ptr [ebp-4]
 0057A5DF    call        @UStrAsg
 0057A5E4    inc         ebx
 0057A5E5    mov         eax,dword ptr [ebp-8]
 0057A5E8    mov         dword ptr [eax+24],ebx
>0057A5EB    jmp         0057B092
 0057A5F0    cmp         si,2E
>0057A5F4    jne         0057A901
 0057A5FA    cmp         dword ptr [ebp-14],0
>0057A5FE    jne         0057A901
 0057A604    inc         ebx
 0057A605    cmp         edi,ebx
>0057A607    jl          0057A62F
 0057A609    mov         eax,dword ptr [ebp-8]
 0057A60C    mov         eax,dword ptr [eax+4]
 0057A60F    mov         edx,ebx
 0057A611    call        00577478
 0057A616    cmp         ax,30
>0057A61A    jb          0057A62F
 0057A61C    mov         eax,dword ptr [ebp-8]
 0057A61F    mov         eax,dword ptr [eax+4]
 0057A622    mov         edx,ebx
 0057A624    call        00577478
 0057A629    cmp         ax,39
>0057A62D    jbe         0057A678
 0057A62F    mov         eax,dword ptr [ebp-8]
 0057A632    mov         byte ptr [eax+8],8
 0057A636    push        0
 0057A638    push        0
 0057A63A    mov         eax,dword ptr [ebp-8]
 0057A63D    mov         eax,dword ptr [eax+0C]
 0057A640    call        StrToInt64Def
 0057A645    mov         ecx,dword ptr [ebp-8]
 0057A648    mov         dword ptr [ecx+10],eax
 0057A64B    mov         dword ptr [ecx+14],edx
 0057A64E    push        0FFFF
 0057A653    push        0C0000000
 0057A658    push        0
 0057A65A    mov         eax,dword ptr [ebp-8]
 0057A65D    mov         eax,dword ptr [eax+0C]
 0057A660    call        004F8DB8
 0057A665    mov         eax,dword ptr [ebp-8]
 0057A668    fstp        qword ptr [eax+18]
 0057A66B    wait
 0057A66C    dec         ebx
 0057A66D    mov         eax,dword ptr [ebp-8]
 0057A670    mov         dword ptr [eax+24],ebx
>0057A673    jmp         0057B092
 0057A678    mov         eax,dword ptr [ebp-8]
 0057A67B    mov         byte ptr [eax+8],9
 0057A67F    mov         eax,dword ptr [ebp-8]
 0057A682    add         eax,0C
 0057A685    mov         edx,57B110;'.'
 0057A68A    call        @UStrCat
>0057A68F    jmp         0057A6B7
 0057A691    mov         eax,dword ptr [ebp-8]
 0057A694    mov         eax,dword ptr [eax+4]
 0057A697    mov         edx,ebx
 0057A699    call        00577478
 0057A69E    mov         edx,eax
 0057A6A0    lea         eax,[ebp-44]
 0057A6A3    call        @UStrFromWChar
 0057A6A8    mov         edx,dword ptr [ebp-44]
 0057A6AB    mov         eax,dword ptr [ebp-8]
 0057A6AE    add         eax,0C
 0057A6B1    call        @UStrCat
 0057A6B6    inc         ebx
 0057A6B7    cmp         edi,ebx
>0057A6B9    jl          0057A6F4
 0057A6BB    mov         eax,dword ptr [ebp-8]
 0057A6BE    mov         eax,dword ptr [eax+4]
 0057A6C1    mov         edx,ebx
 0057A6C3    call        00577478
 0057A6C8    cmp         ax,30
>0057A6CC    jb          0057A6E1
 0057A6CE    mov         eax,dword ptr [ebp-8]
 0057A6D1    mov         eax,dword ptr [eax+4]
 0057A6D4    mov         edx,ebx
 0057A6D6    call        00577478
 0057A6DB    cmp         ax,39
>0057A6DF    jbe         0057A691
 0057A6E1    mov         eax,dword ptr [ebp-8]
 0057A6E4    mov         eax,dword ptr [eax+4]
 0057A6E7    mov         edx,ebx
 0057A6E9    call        00577478
 0057A6EE    cmp         ax,5F
>0057A6F2    je          0057A691
 0057A6F4    cmp         edi,ebx
>0057A6F6    jl          0057A70B
 0057A6F8    mov         eax,dword ptr [ebp-8]
 0057A6FB    mov         eax,dword ptr [eax+4]
 0057A6FE    mov         edx,ebx
 0057A700    call        00577478
 0057A705    cmp         ax,65
>0057A709    je          0057A722
 0057A70B    mov         eax,dword ptr [ebp-8]
 0057A70E    mov         eax,dword ptr [eax+4]
 0057A711    mov         edx,ebx
 0057A713    call        00577478
 0057A718    cmp         ax,45
>0057A71C    jne         0057A8C4
 0057A722    mov         eax,dword ptr [ebp-8]
 0057A725    mov         dword ptr [eax+24],ebx
 0057A728    inc         ebx
 0057A729    cmp         edi,ebx
>0057A72B    jge         0057A764
 0057A72D    push        0FFFF
 0057A732    push        0C0000000
 0057A737    push        0
 0057A739    mov         eax,dword ptr [ebp-8]
 0057A73C    mov         eax,dword ptr [eax+0C]
 0057A73F    call        004F8DB8
 0057A744    mov         eax,dword ptr [ebp-8]
 0057A747    fstp        qword ptr [eax+18]
 0057A74A    wait
 0057A74B    mov         eax,dword ptr [ebp-8]
 0057A74E    fld         qword ptr [eax+18]
 0057A751    call        @ROUND
 0057A756    mov         ecx,dword ptr [ebp-8]
 0057A759    mov         dword ptr [ecx+10],eax
 0057A75C    mov         dword ptr [ecx+14],edx
>0057A75F    jmp         0057B092
 0057A764    mov         eax,dword ptr [ebp-8]
 0057A767    mov         eax,dword ptr [eax+4]
 0057A76A    mov         edx,ebx
 0057A76C    call        00577478
 0057A771    cmp         ax,2D
>0057A775    jne         0057A78A
 0057A777    mov         eax,dword ptr [ebp-8]
 0057A77A    add         eax,0C
 0057A77D    mov         edx,57B0EC;'e-'
 0057A782    call        @UStrCat
 0057A787    inc         ebx
>0057A788    jmp         0057A7C0
 0057A78A    mov         eax,dword ptr [ebp-8]
 0057A78D    mov         eax,dword ptr [eax+4]
 0057A790    mov         edx,ebx
 0057A792    call        00577478
 0057A797    cmp         ax,2B
>0057A79B    jne         0057A7B0
 0057A79D    mov         eax,dword ptr [ebp-8]
 0057A7A0    add         eax,0C
 0057A7A3    mov         edx,57B100;'e'
 0057A7A8    call        @UStrCat
 0057A7AD    inc         ebx
>0057A7AE    jmp         0057A7C0
 0057A7B0    mov         eax,dword ptr [ebp-8]
 0057A7B3    add         eax,0C
 0057A7B6    mov         edx,57B100;'e'
 0057A7BB    call        @UStrCat
 0057A7C0    cmp         edi,ebx
>0057A7C2    jl          0057A7EE
 0057A7C4    mov         eax,dword ptr [ebp-8]
 0057A7C7    mov         eax,dword ptr [eax+4]
 0057A7CA    mov         edx,ebx
 0057A7CC    call        00577478
 0057A7D1    cmp         ax,30
>0057A7D5    jb          0057A7EE
 0057A7D7    mov         eax,dword ptr [ebp-8]
 0057A7DA    mov         eax,dword ptr [eax+4]
 0057A7DD    mov         edx,ebx
 0057A7DF    call        00577478
 0057A7E4    cmp         ax,39
>0057A7E8    jbe         0057A87F
 0057A7EE    lea         eax,[ebp-4C]
 0057A7F1    push        eax
 0057A7F2    mov         eax,dword ptr [ebp-8]
 0057A7F5    mov         ecx,dword ptr [eax+24]
 0057A7F8    sub         ecx,dword ptr [ebp-10]
 0057A7FB    mov         eax,dword ptr [ebp-8]
 0057A7FE    mov         eax,dword ptr [eax+0C]
 0057A801    mov         edx,dword ptr [ebp-10]
 0057A804    call        @UStrCopy
 0057A809    mov         eax,dword ptr [ebp-4C]
 0057A80C    lea         edx,[ebp-48]
 0057A80F    call        005774A4
 0057A814    mov         edx,dword ptr [ebp-48]
 0057A817    mov         eax,dword ptr [ebp-8]
 0057A81A    add         eax,0C
 0057A81D    call        @UStrAsg
 0057A822    push        0FFFF
 0057A827    push        0C0000000
 0057A82C    push        0
 0057A82E    mov         eax,dword ptr [ebp-8]
 0057A831    mov         eax,dword ptr [eax+0C]
 0057A834    call        004F8DB8
 0057A839    mov         eax,dword ptr [ebp-8]
 0057A83C    fstp        qword ptr [eax+18]
 0057A83F    wait
 0057A840    mov         eax,dword ptr [ebp-8]
 0057A843    fld         qword ptr [eax+18]
 0057A846    call        @ROUND
 0057A84B    mov         ecx,dword ptr [ebp-8]
 0057A84E    mov         dword ptr [ecx+10],eax
 0057A851    mov         dword ptr [ecx+14],edx
>0057A854    jmp         0057B092
 0057A859    mov         eax,dword ptr [ebp-8]
 0057A85C    mov         eax,dword ptr [eax+4]
 0057A85F    mov         edx,ebx
 0057A861    call        00577450
 0057A866    mov         edx,eax
 0057A868    lea         eax,[ebp-50]
 0057A86B    call        @UStrFromWChar
 0057A870    mov         edx,dword ptr [ebp-50]
 0057A873    mov         eax,dword ptr [ebp-8]
 0057A876    add         eax,0C
 0057A879    call        @UStrCat
 0057A87E    inc         ebx
 0057A87F    cmp         edi,ebx
>0057A881    jl          0057A8BC
 0057A883    mov         eax,dword ptr [ebp-8]
 0057A886    mov         eax,dword ptr [eax+4]
 0057A889    mov         edx,ebx
 0057A88B    call        00577478
 0057A890    cmp         ax,30
>0057A894    jb          0057A8A9
 0057A896    mov         eax,dword ptr [ebp-8]
 0057A899    mov         eax,dword ptr [eax+4]
 0057A89C    mov         edx,ebx
 0057A89E    call        00577478
 0057A8A3    cmp         ax,39
>0057A8A7    jbe         0057A859
 0057A8A9    mov         eax,dword ptr [ebp-8]
 0057A8AC    mov         eax,dword ptr [eax+4]
 0057A8AF    mov         edx,ebx
 0057A8B1    call        00577478
 0057A8B6    cmp         ax,5F
>0057A8BA    je          0057A859
 0057A8BC    mov         eax,dword ptr [ebp-8]
 0057A8BF    mov         dword ptr [eax+24],ebx
>0057A8C2    jmp         0057A8CA
 0057A8C4    mov         eax,dword ptr [ebp-8]
 0057A8C7    mov         dword ptr [eax+24],ebx
 0057A8CA    push        0FFFF
 0057A8CF    push        0C0000000
 0057A8D4    push        0
 0057A8D6    mov         eax,dword ptr [ebp-8]
 0057A8D9    mov         eax,dword ptr [eax+0C]
 0057A8DC    call        004F8DB8
 0057A8E1    mov         eax,dword ptr [ebp-8]
 0057A8E4    fstp        qword ptr [eax+18]
 0057A8E7    wait
 0057A8E8    mov         eax,dword ptr [ebp-8]
 0057A8EB    fld         qword ptr [eax+18]
 0057A8EE    call        @ROUND
 0057A8F3    mov         ecx,dword ptr [ebp-8]
 0057A8F6    mov         dword ptr [ecx+10],eax
 0057A8F9    mov         dword ptr [ecx+14],edx
>0057A8FC    jmp         0057B092
 0057A901    cmp         byte ptr [ebp-9],0
>0057A905    je          0057ACA7
 0057A90B    cmp         si,2C
>0057A90F    jne         0057ACA7
 0057A915    cmp         dword ptr [ebp-14],0
>0057A919    jne         0057ACA7
 0057A91F    mov         esi,ebx
 0057A921    inc         ebx
 0057A922    cmp         edi,ebx
>0057A924    jl          0057A94C
 0057A926    mov         eax,dword ptr [ebp-8]
 0057A929    mov         eax,dword ptr [eax+4]
 0057A92C    mov         edx,ebx
 0057A92E    call        00577478
 0057A933    cmp         ax,30
>0057A937    jb          0057A94C
 0057A939    mov         eax,dword ptr [ebp-8]
 0057A93C    mov         eax,dword ptr [eax+4]
 0057A93F    mov         edx,ebx
 0057A941    call        00577478
 0057A946    cmp         ax,39
>0057A94A    jbe         0057A995
 0057A94C    mov         eax,dword ptr [ebp-8]
 0057A94F    mov         byte ptr [eax+8],8
 0057A953    push        0
 0057A955    push        0
 0057A957    mov         eax,dword ptr [ebp-8]
 0057A95A    mov         eax,dword ptr [eax+0C]
 0057A95D    call        StrToInt64Def
 0057A962    mov         ecx,dword ptr [ebp-8]
 0057A965    mov         dword ptr [ecx+10],eax
 0057A968    mov         dword ptr [ecx+14],edx
 0057A96B    push        0FFFF
 0057A970    push        0C0000000
 0057A975    push        0
 0057A977    mov         eax,dword ptr [ebp-8]
 0057A97A    mov         eax,dword ptr [eax+0C]
 0057A97D    call        004F8DB8
 0057A982    mov         eax,dword ptr [ebp-8]
 0057A985    fstp        qword ptr [eax+18]
 0057A988    wait
 0057A989    dec         ebx
 0057A98A    mov         eax,dword ptr [ebp-8]
 0057A98D    mov         dword ptr [eax+24],ebx
>0057A990    jmp         0057B092
 0057A995    mov         eax,dword ptr [ebp-8]
 0057A998    mov         byte ptr [eax+8],9
 0057A99C    mov         eax,dword ptr [ebp-8]
 0057A99F    add         eax,0C
 0057A9A2    mov         edx,57B110;'.'
 0057A9A7    call        @UStrCat
>0057A9AC    jmp         0057A9D4
 0057A9AE    mov         eax,dword ptr [ebp-8]
 0057A9B1    mov         eax,dword ptr [eax+4]
 0057A9B4    mov         edx,ebx
 0057A9B6    call        00577450
 0057A9BB    mov         edx,eax
 0057A9BD    lea         eax,[ebp-54]
 0057A9C0    call        @UStrFromWChar
 0057A9C5    mov         edx,dword ptr [ebp-54]
 0057A9C8    mov         eax,dword ptr [ebp-8]
 0057A9CB    add         eax,0C
 0057A9CE    call        @UStrCat
 0057A9D3    inc         ebx
 0057A9D4    cmp         edi,ebx
>0057A9D6    jl          0057AA11
 0057A9D8    mov         eax,dword ptr [ebp-8]
 0057A9DB    mov         eax,dword ptr [eax+4]
 0057A9DE    mov         edx,ebx
 0057A9E0    call        00577478
 0057A9E5    cmp         ax,30
>0057A9E9    jb          0057A9FE
 0057A9EB    mov         eax,dword ptr [ebp-8]
 0057A9EE    mov         eax,dword ptr [eax+4]
 0057A9F1    mov         edx,ebx
 0057A9F3    call        00577478
 0057A9F8    cmp         ax,39
>0057A9FC    jbe         0057A9AE
 0057A9FE    mov         eax,dword ptr [ebp-8]
 0057AA01    mov         eax,dword ptr [eax+4]
 0057AA04    mov         edx,ebx
 0057AA06    call        00577478
 0057AA0B    cmp         ax,5F
>0057AA0F    je          0057A9AE
 0057AA11    cmp         edi,ebx
>0057AA13    jl          0057AA28
 0057AA15    mov         eax,dword ptr [ebp-8]
 0057AA18    mov         eax,dword ptr [eax+4]
 0057AA1B    mov         edx,ebx
 0057AA1D    call        00577478
 0057AA22    cmp         ax,65
>0057AA26    je          0057AA3F
 0057AA28    mov         eax,dword ptr [ebp-8]
 0057AA2B    mov         eax,dword ptr [eax+4]
 0057AA2E    mov         edx,ebx
 0057AA30    call        00577478
 0057AA35    cmp         ax,45
>0057AA39    jne         0057ABC7
 0057AA3F    mov         eax,dword ptr [ebp-8]
 0057AA42    mov         dword ptr [eax+24],ebx
 0057AA45    inc         ebx
 0057AA46    cmp         edi,ebx
>0057AA48    jge         0057AA81
 0057AA4A    push        0FFFF
 0057AA4F    push        0C0000000
 0057AA54    push        0
 0057AA56    mov         eax,dword ptr [ebp-8]
 0057AA59    mov         eax,dword ptr [eax+0C]
 0057AA5C    call        004F8DB8
 0057AA61    mov         eax,dword ptr [ebp-8]
 0057AA64    fstp        qword ptr [eax+18]
 0057AA67    wait
 0057AA68    mov         eax,dword ptr [ebp-8]
 0057AA6B    fld         qword ptr [eax+18]
 0057AA6E    call        @ROUND
 0057AA73    mov         ecx,dword ptr [ebp-8]
 0057AA76    mov         dword ptr [ecx+10],eax
 0057AA79    mov         dword ptr [ecx+14],edx
>0057AA7C    jmp         0057B092
 0057AA81    mov         eax,dword ptr [ebp-8]
 0057AA84    mov         eax,dword ptr [eax+4]
 0057AA87    mov         edx,ebx
 0057AA89    call        00577478
 0057AA8E    cmp         ax,2D
>0057AA92    jne         0057AAA7
 0057AA94    mov         eax,dword ptr [ebp-8]
 0057AA97    add         eax,0C
 0057AA9A    mov         edx,57B0EC;'e-'
 0057AA9F    call        @UStrCat
 0057AAA4    inc         ebx
>0057AAA5    jmp         0057AADD
 0057AAA7    mov         eax,dword ptr [ebp-8]
 0057AAAA    mov         eax,dword ptr [eax+4]
 0057AAAD    mov         edx,ebx
 0057AAAF    call        00577478
 0057AAB4    cmp         ax,2B
>0057AAB8    jne         0057AACD
 0057AABA    mov         eax,dword ptr [ebp-8]
 0057AABD    add         eax,0C
 0057AAC0    mov         edx,57B100;'e'
 0057AAC5    call        @UStrCat
 0057AACA    inc         ebx
>0057AACB    jmp         0057AADD
 0057AACD    mov         eax,dword ptr [ebp-8]
 0057AAD0    add         eax,0C
 0057AAD3    mov         edx,57B100;'e'
 0057AAD8    call        @UStrCat
 0057AADD    cmp         edi,ebx
>0057AADF    jl          0057AB07
 0057AAE1    mov         eax,dword ptr [ebp-8]
 0057AAE4    mov         eax,dword ptr [eax+4]
 0057AAE7    mov         edx,ebx
 0057AAE9    call        00577478
 0057AAEE    cmp         ax,30
>0057AAF2    jb          0057AB07
 0057AAF4    mov         eax,dword ptr [ebp-8]
 0057AAF7    mov         eax,dword ptr [eax+4]
 0057AAFA    mov         edx,ebx
 0057AAFC    call        00577478
 0057AB01    cmp         ax,39
>0057AB05    jbe         0057AB82
 0057AB07    mov         eax,dword ptr [ebp-8]
 0057AB0A    add         eax,0C
 0057AB0D    push        eax
 0057AB0E    mov         eax,dword ptr [ebp-8]
 0057AB11    mov         ecx,dword ptr [eax+24]
 0057AB14    sub         ecx,dword ptr [ebp-10]
 0057AB17    mov         eax,dword ptr [ebp-8]
 0057AB1A    mov         eax,dword ptr [eax+0C]
 0057AB1D    mov         edx,dword ptr [ebp-10]
 0057AB20    call        @UStrCopy
 0057AB25    push        0FFFF
 0057AB2A    push        0C0000000
 0057AB2F    push        0
 0057AB31    mov         eax,dword ptr [ebp-8]
 0057AB34    mov         eax,dword ptr [eax+0C]
 0057AB37    call        004F8DB8
 0057AB3C    mov         eax,dword ptr [ebp-8]
 0057AB3F    fstp        qword ptr [eax+18]
 0057AB42    wait
 0057AB43    mov         eax,dword ptr [ebp-8]
 0057AB46    fld         qword ptr [eax+18]
 0057AB49    call        @ROUND
 0057AB4E    mov         ecx,dword ptr [ebp-8]
 0057AB51    mov         dword ptr [ecx+10],eax
 0057AB54    mov         dword ptr [ecx+14],edx
>0057AB57    jmp         0057B092
 0057AB5C    mov         eax,dword ptr [ebp-8]
 0057AB5F    mov         eax,dword ptr [eax+4]
 0057AB62    mov         edx,ebx
 0057AB64    call        00577478
 0057AB69    mov         edx,eax
 0057AB6B    lea         eax,[ebp-58]
 0057AB6E    call        @UStrFromWChar
 0057AB73    mov         edx,dword ptr [ebp-58]
 0057AB76    mov         eax,dword ptr [ebp-8]
 0057AB79    add         eax,0C
 0057AB7C    call        @UStrCat
 0057AB81    inc         ebx
 0057AB82    cmp         edi,ebx
>0057AB84    jl          0057ABBF
 0057AB86    mov         eax,dword ptr [ebp-8]
 0057AB89    mov         eax,dword ptr [eax+4]
 0057AB8C    mov         edx,ebx
 0057AB8E    call        00577478
 0057AB93    cmp         ax,30
>0057AB97    jb          0057ABAC
 0057AB99    mov         eax,dword ptr [ebp-8]
 0057AB9C    mov         eax,dword ptr [eax+4]
 0057AB9F    mov         edx,ebx
 0057ABA1    call        00577478
 0057ABA6    cmp         ax,39
>0057ABAA    jbe         0057AB5C
 0057ABAC    mov         eax,dword ptr [ebp-8]
 0057ABAF    mov         eax,dword ptr [eax+4]
 0057ABB2    mov         edx,ebx
 0057ABB4    call        00577478
 0057ABB9    cmp         ax,5F
>0057ABBD    je          0057AB5C
 0057ABBF    mov         eax,dword ptr [ebp-8]
 0057ABC2    mov         dword ptr [eax+24],ebx
>0057ABC5    jmp         0057ABCD
 0057ABC7    mov         eax,dword ptr [ebp-8]
 0057ABCA    mov         dword ptr [eax+24],ebx
 0057ABCD    mov         eax,dword ptr [ebp-8]
 0057ABD0    mov         eax,dword ptr [eax+4]
 0057ABD3    mov         edx,ebx
 0057ABD5    call        00577478
 0057ABDA    cmp         ax,2C
>0057ABDE    je          0057ABF3
 0057ABE0    mov         eax,dword ptr [ebp-8]
 0057ABE3    mov         eax,dword ptr [eax+4]
 0057ABE6    mov         edx,ebx
 0057ABE8    call        00577478
 0057ABED    cmp         ax,2E
>0057ABF1    jne         0057AC70
 0057ABF3    lea         edx,[ebx+1]
 0057ABF6    mov         eax,dword ptr [ebp-8]
 0057ABF9    mov         eax,dword ptr [eax+4]
 0057ABFC    call        00577450
 0057AC01    call        00577538
 0057AC06    test        al,al
>0057AC08    jne         0057AC70
 0057AC0A    mov         eax,dword ptr [ebp-8]
 0057AC0D    mov         dword ptr [eax+24],esi
 0057AC10    mov         eax,dword ptr [ebp-8]
 0057AC13    mov         byte ptr [eax+8],8
 0057AC17    mov         eax,dword ptr [ebp-8]
 0057AC1A    add         eax,0C
 0057AC1D    push        eax
 0057AC1E    mov         eax,dword ptr [ebp-8]
 0057AC21    mov         ecx,dword ptr [eax+24]
 0057AC24    sub         ecx,dword ptr [ebp-10]
 0057AC27    mov         eax,dword ptr [ebp-8]
 0057AC2A    mov         eax,dword ptr [eax+4]
 0057AC2D    mov         edx,dword ptr [ebp-10]
 0057AC30    call        @UStrCopy
 0057AC35    push        0
 0057AC37    push        0
 0057AC39    mov         eax,dword ptr [ebp-8]
 0057AC3C    mov         eax,dword ptr [eax+0C]
 0057AC3F    call        StrToInt64Def
 0057AC44    mov         ecx,dword ptr [ebp-8]
 0057AC47    mov         dword ptr [ecx+10],eax
 0057AC4A    mov         dword ptr [ecx+14],edx
 0057AC4D    push        0FFFF
 0057AC52    push        0C0000000
 0057AC57    push        0
 0057AC59    mov         eax,dword ptr [ebp-8]
 0057AC5C    mov         eax,dword ptr [eax+0C]
 0057AC5F    call        004F8DB8
 0057AC64    mov         eax,dword ptr [ebp-8]
 0057AC67    fstp        qword ptr [eax+18]
 0057AC6A    wait
>0057AC6B    jmp         0057B092
 0057AC70    push        0FFFF
 0057AC75    push        0C0000000
 0057AC7A    push        0
 0057AC7C    mov         eax,dword ptr [ebp-8]
 0057AC7F    mov         eax,dword ptr [eax+0C]
 0057AC82    call        004F8DB8
 0057AC87    mov         eax,dword ptr [ebp-8]
 0057AC8A    fstp        qword ptr [eax+18]
 0057AC8D    wait
 0057AC8E    mov         eax,dword ptr [ebp-8]
 0057AC91    fld         qword ptr [eax+18]
 0057AC94    call        @ROUND
 0057AC99    mov         ecx,dword ptr [ebp-8]
 0057AC9C    mov         dword ptr [ecx+10],eax
 0057AC9F    mov         dword ptr [ecx+14],edx
>0057ACA2    jmp         0057B092
 0057ACA7    cmp         dword ptr [ebp-14],0
>0057ACAB    jne         0057ACF5
 0057ACAD    mov         eax,dword ptr [ebp-8]
 0057ACB0    mov         byte ptr [eax+8],8
 0057ACB4    push        0
 0057ACB6    push        0
 0057ACB8    mov         eax,dword ptr [ebp-8]
 0057ACBB    mov         eax,dword ptr [eax+0C]
 0057ACBE    call        StrToInt64Def
 0057ACC3    mov         ecx,dword ptr [ebp-8]
 0057ACC6    mov         dword ptr [ecx+10],eax
 0057ACC9    mov         dword ptr [ecx+14],edx
 0057ACCC    push        0FFFF
 0057ACD1    push        0C0000000
 0057ACD6    push        0
 0057ACD8    mov         eax,dword ptr [ebp-8]
 0057ACDB    mov         eax,dword ptr [eax+0C]
 0057ACDE    call        004F8DB8
 0057ACE3    mov         eax,dword ptr [ebp-8]
 0057ACE6    fstp        qword ptr [eax+18]
 0057ACE9    wait
 0057ACEA    mov         eax,dword ptr [ebp-8]
 0057ACED    mov         dword ptr [eax+24],ebx
>0057ACF0    jmp         0057B092
 0057ACF5    mov         eax,dword ptr [ebp-8]
 0057ACF8    mov         eax,dword ptr [eax+4]
 0057ACFB    mov         edx,dword ptr [ebp-14]
 0057ACFE    call        00577478
 0057AD03    mov         esi,eax
 0057AD05    cmp         si,65
>0057AD09    je          0057AD15
 0057AD0B    cmp         si,45
>0057AD0F    jne         0057AFFB
 0057AD15    mov         ebx,dword ptr [ebp-14]
 0057AD18    inc         ebx
 0057AD19    mov         eax,dword ptr [ebp-8]
 0057AD1C    add         eax,0C
 0057AD1F    push        eax
 0057AD20    mov         ecx,dword ptr [ebp-14]
 0057AD23    sub         ecx,dword ptr [ebp-10]
 0057AD26    mov         eax,dword ptr [ebp-8]
 0057AD29    mov         eax,dword ptr [eax+4]
 0057AD2C    mov         edx,dword ptr [ebp-10]
 0057AD2F    call        @UStrCopy
 0057AD34    mov         eax,dword ptr [ebp-8]
 0057AD37    mov         eax,dword ptr [eax+4]
 0057AD3A    mov         edx,ebx
 0057AD3C    call        00577478
 0057AD41    mov         esi,eax
 0057AD43    cmp         si,2D
>0057AD47    jne         0057ADF4
 0057AD4D    mov         eax,dword ptr [ebp-8]
 0057AD50    mov         byte ptr [eax+8],9
 0057AD54    mov         eax,dword ptr [ebp-8]
 0057AD57    add         eax,0C
 0057AD5A    mov         edx,57B0EC;'e-'
 0057AD5F    call        @UStrCat
 0057AD64    inc         ebx
>0057AD65    jmp         0057AD8D
 0057AD67    mov         eax,dword ptr [ebp-8]
 0057AD6A    mov         eax,dword ptr [eax+4]
 0057AD6D    mov         edx,ebx
 0057AD6F    call        00577478
 0057AD74    mov         edx,eax
 0057AD76    lea         eax,[ebp-5C]
 0057AD79    call        @UStrFromWChar
 0057AD7E    mov         edx,dword ptr [ebp-5C]
 0057AD81    mov         eax,dword ptr [ebp-8]
 0057AD84    add         eax,0C
 0057AD87    call        @UStrCat
 0057AD8C    inc         ebx
 0057AD8D    cmp         edi,ebx
>0057AD8F    jl          0057ADB7
 0057AD91    mov         eax,dword ptr [ebp-8]
 0057AD94    mov         eax,dword ptr [eax+4]
 0057AD97    mov         edx,ebx
 0057AD99    call        00577478
 0057AD9E    cmp         ax,30
>0057ADA2    jb          0057ADB7
 0057ADA4    mov         eax,dword ptr [ebp-8]
 0057ADA7    mov         eax,dword ptr [eax+4]
 0057ADAA    mov         edx,ebx
 0057ADAC    call        00577478
 0057ADB1    cmp         ax,39
>0057ADB5    jbe         0057AD67
 0057ADB7    mov         eax,dword ptr [ebp-8]
 0057ADBA    mov         dword ptr [eax+24],ebx
 0057ADBD    push        0FFFF
 0057ADC2    push        0C0000000
 0057ADC7    push        0
 0057ADC9    mov         eax,dword ptr [ebp-8]
 0057ADCC    mov         eax,dword ptr [eax+0C]
 0057ADCF    call        004F8DB8
 0057ADD4    mov         eax,dword ptr [ebp-8]
 0057ADD7    fstp        qword ptr [eax+18]
 0057ADDA    wait
 0057ADDB    mov         eax,dword ptr [ebp-8]
 0057ADDE    fld         qword ptr [eax+18]
 0057ADE1    call        @ROUND
 0057ADE6    mov         ecx,dword ptr [ebp-8]
 0057ADE9    mov         dword ptr [ecx+10],eax
 0057ADEC    mov         dword ptr [ecx+14],edx
>0057ADEF    jmp         0057B092
 0057ADF4    cmp         si,2B
>0057ADF8    jne         0057AEA5
 0057ADFE    mov         eax,dword ptr [ebp-8]
 0057AE01    mov         byte ptr [eax+8],8
 0057AE05    mov         eax,dword ptr [ebp-8]
 0057AE08    add         eax,0C
 0057AE0B    mov         edx,57B100;'e'
 0057AE10    call        @UStrCat
 0057AE15    inc         ebx
>0057AE16    jmp         0057AE3E
 0057AE18    mov         eax,dword ptr [ebp-8]
 0057AE1B    mov         eax,dword ptr [eax+4]
 0057AE1E    mov         edx,ebx
 0057AE20    call        00577450
 0057AE25    mov         edx,eax
 0057AE27    lea         eax,[ebp-60]
 0057AE2A    call        @UStrFromWChar
 0057AE2F    mov         edx,dword ptr [ebp-60]
 0057AE32    mov         eax,dword ptr [ebp-8]
 0057AE35    add         eax,0C
 0057AE38    call        @UStrCat
 0057AE3D    inc         ebx
 0057AE3E    cmp         edi,ebx
>0057AE40    jl          0057AE68
 0057AE42    mov         eax,dword ptr [ebp-8]
 0057AE45    mov         eax,dword ptr [eax+4]
 0057AE48    mov         edx,ebx
 0057AE4A    call        00577478
 0057AE4F    cmp         ax,30
>0057AE53    jb          0057AE68
 0057AE55    mov         eax,dword ptr [ebp-8]
 0057AE58    mov         eax,dword ptr [eax+4]
 0057AE5B    mov         edx,ebx
 0057AE5D    call        00577478
 0057AE62    cmp         ax,39
>0057AE66    jbe         0057AE18
 0057AE68    mov         eax,dword ptr [ebp-8]
 0057AE6B    mov         dword ptr [eax+24],ebx
 0057AE6E    push        0FFFF
 0057AE73    push        0C0000000
 0057AE78    push        0
 0057AE7A    mov         eax,dword ptr [ebp-8]
 0057AE7D    mov         eax,dword ptr [eax+0C]
 0057AE80    call        004F8DB8
 0057AE85    mov         eax,dword ptr [ebp-8]
 0057AE88    fstp        qword ptr [eax+18]
 0057AE8B    wait
 0057AE8C    mov         eax,dword ptr [ebp-8]
 0057AE8F    fld         qword ptr [eax+18]
 0057AE92    call        @ROUND
 0057AE97    mov         ecx,dword ptr [ebp-8]
 0057AE9A    mov         dword ptr [ecx+10],eax
 0057AE9D    mov         dword ptr [ecx+14],edx
>0057AEA0    jmp         0057B092
 0057AEA5    cmp         si,30
>0057AEA9    jb          0057AF5F
 0057AEAF    cmp         si,39
>0057AEB3    ja          0057AF5F
 0057AEB9    mov         eax,dword ptr [ebp-8]
 0057AEBC    mov         byte ptr [eax+8],8
 0057AEC0    mov         eax,dword ptr [ebp-8]
 0057AEC3    add         eax,0C
 0057AEC6    mov         edx,57B100;'e'
 0057AECB    call        @UStrCat
>0057AED0    jmp         0057AEF8
 0057AED2    mov         eax,dword ptr [ebp-8]
 0057AED5    mov         eax,dword ptr [eax+4]
 0057AED8    mov         edx,ebx
 0057AEDA    call        00577478
 0057AEDF    mov         edx,eax
 0057AEE1    lea         eax,[ebp-64]
 0057AEE4    call        @UStrFromWChar
 0057AEE9    mov         edx,dword ptr [ebp-64]
 0057AEEC    mov         eax,dword ptr [ebp-8]
 0057AEEF    add         eax,0C
 0057AEF2    call        @UStrCat
 0057AEF7    inc         ebx
 0057AEF8    cmp         edi,ebx
>0057AEFA    jl          0057AF22
 0057AEFC    mov         eax,dword ptr [ebp-8]
 0057AEFF    mov         eax,dword ptr [eax+4]
 0057AF02    mov         edx,ebx
 0057AF04    call        00577478
 0057AF09    cmp         ax,30
>0057AF0D    jb          0057AF22
 0057AF0F    mov         eax,dword ptr [ebp-8]
 0057AF12    mov         eax,dword ptr [eax+4]
 0057AF15    mov         edx,ebx
 0057AF17    call        00577478
 0057AF1C    cmp         ax,39
>0057AF20    jbe         0057AED2
 0057AF22    mov         eax,dword ptr [ebp-8]
 0057AF25    mov         dword ptr [eax+24],ebx
 0057AF28    push        0FFFF
 0057AF2D    push        0C0000000
 0057AF32    push        0
 0057AF34    mov         eax,dword ptr [ebp-8]
 0057AF37    mov         eax,dword ptr [eax+0C]
 0057AF3A    call        004F8DB8
 0057AF3F    mov         eax,dword ptr [ebp-8]
 0057AF42    fstp        qword ptr [eax+18]
 0057AF45    wait
 0057AF46    mov         eax,dword ptr [ebp-8]
 0057AF49    fld         qword ptr [eax+18]
 0057AF4C    call        @ROUND
 0057AF51    mov         ecx,dword ptr [ebp-8]
 0057AF54    mov         dword ptr [ecx+10],eax
 0057AF57    mov         dword ptr [ecx+14],edx
>0057AF5A    jmp         0057B092
 0057AF5F    mov         eax,dword ptr [ebp-8]
 0057AF62    mov         edx,dword ptr [ebp-14]
 0057AF65    mov         dword ptr [eax+24],edx
 0057AF68    mov         eax,dword ptr [ebp-8]
 0057AF6B    mov         byte ptr [eax+8],8
 0057AF6F    mov         eax,dword ptr [ebp-8]
 0057AF72    add         eax,0C
 0057AF75    call        @UStrClr
 0057AF7A    mov         ebx,dword ptr [ebp-10]
>0057AF7D    jmp         0057AFB8
 0057AF7F    mov         eax,dword ptr [ebp-8]
 0057AF82    mov         eax,dword ptr [eax+4]
 0057AF85    mov         edx,ebx
 0057AF87    call        00577478
 0057AF8C    cmp         ax,5F
>0057AF90    je          0057AFB7
 0057AF92    mov         eax,dword ptr [ebp-8]
 0057AF95    mov         eax,dword ptr [eax+4]
 0057AF98    mov         edx,ebx
 0057AF9A    call        00577478
 0057AF9F    mov         edx,eax
 0057AFA1    lea         eax,[ebp-68]
 0057AFA4    call        @UStrFromWChar
 0057AFA9    mov         edx,dword ptr [ebp-68]
 0057AFAC    mov         eax,dword ptr [ebp-8]
 0057AFAF    add         eax,0C
 0057AFB2    call        @UStrCat
 0057AFB7    inc         ebx
 0057AFB8    mov         eax,dword ptr [ebp-8]
 0057AFBB    cmp         ebx,dword ptr [eax+24]
>0057AFBE    jl          0057AF7F
 0057AFC0    push        0
 0057AFC2    push        0
 0057AFC4    mov         eax,dword ptr [ebp-8]
 0057AFC7    mov         eax,dword ptr [eax+0C]
 0057AFCA    call        StrToInt64Def
 0057AFCF    mov         ecx,dword ptr [ebp-8]
 0057AFD2    mov         dword ptr [ecx+10],eax
 0057AFD5    mov         dword ptr [ecx+14],edx
 0057AFD8    push        0FFFF
 0057AFDD    push        0C0000000
 0057AFE2    push        0
 0057AFE4    mov         eax,dword ptr [ebp-8]
 0057AFE7    mov         eax,dword ptr [eax+0C]
 0057AFEA    call        004F8DB8
 0057AFEF    mov         eax,dword ptr [ebp-8]
 0057AFF2    fstp        qword ptr [eax+18]
 0057AFF5    wait
>0057AFF6    jmp         0057B092
 0057AFFB    mov         eax,dword ptr [ebp-8]
 0057AFFE    mov         edx,dword ptr [ebp-14]
 0057B001    mov         dword ptr [eax+24],edx
 0057B004    mov         eax,dword ptr [ebp-8]
 0057B007    mov         byte ptr [eax+8],8
 0057B00B    mov         eax,dword ptr [ebp-8]
 0057B00E    add         eax,0C
 0057B011    call        @UStrClr
 0057B016    mov         ebx,dword ptr [ebp-10]
>0057B019    jmp         0057B054
 0057B01B    mov         eax,dword ptr [ebp-8]
 0057B01E    mov         eax,dword ptr [eax+4]
 0057B021    mov         edx,ebx
 0057B023    call        00577478
 0057B028    cmp         ax,5F
>0057B02C    je          0057B053
 0057B02E    mov         eax,dword ptr [ebp-8]
 0057B031    mov         eax,dword ptr [eax+4]
 0057B034    mov         edx,ebx
 0057B036    call        00577478
 0057B03B    mov         edx,eax
 0057B03D    lea         eax,[ebp-6C]
 0057B040    call        @UStrFromWChar
 0057B045    mov         edx,dword ptr [ebp-6C]
 0057B048    mov         eax,dword ptr [ebp-8]
 0057B04B    add         eax,0C
 0057B04E    call        @UStrCat
 0057B053    inc         ebx
 0057B054    mov         eax,dword ptr [ebp-8]
 0057B057    cmp         ebx,dword ptr [eax+24]
>0057B05A    jl          0057B01B
 0057B05C    push        0
 0057B05E    push        0
 0057B060    mov         eax,dword ptr [ebp-8]
 0057B063    mov         eax,dword ptr [eax+0C]
 0057B066    call        StrToInt64Def
 0057B06B    mov         ecx,dword ptr [ebp-8]
 0057B06E    mov         dword ptr [ecx+10],eax
 0057B071    mov         dword ptr [ecx+14],edx
 0057B074    push        0FFFF
 0057B079    push        0C0000000
 0057B07E    push        0
 0057B080    mov         eax,dword ptr [ebp-8]
 0057B083    mov         eax,dword ptr [eax+0C]
 0057B086    call        004F8DB8
 0057B08B    mov         eax,dword ptr [ebp-8]
 0057B08E    fstp        qword ptr [eax+18]
 0057B091    wait
 0057B092    xor         eax,eax
 0057B094    pop         edx
 0057B095    pop         ecx
 0057B096    pop         ecx
 0057B097    mov         dword ptr fs:[eax],edx
 0057B09A    push        57B0C9
 0057B09F    lea         eax,[ebp-6C]
 0057B0A2    mov         edx,0B
 0057B0A7    call        @UStrArrayClr
 0057B0AC    lea         eax,[ebp-34]
 0057B0AF    mov         edx,8
 0057B0B4    call        @UStrArrayClr
 0057B0B9    lea         eax,[ebp-4]
 0057B0BC    call        @UStrClr
 0057B0C1    ret
>0057B0C2    jmp         @HandleFinally
>0057B0C7    jmp         0057B09F
 0057B0C9    pop         edi
 0057B0CA    pop         esi
 0057B0CB    pop         ebx
 0057B0CC    mov         esp,ebp
 0057B0CE    pop         ebp
 0057B0CF    ret
end;*}

//0057B114
{*function TScanner.NextLine:?;
begin
 0057B114    push        ebx
 0057B115    push        esi
 0057B116    push        edi
 0057B117    mov         esi,eax
 0057B119    cmp         byte ptr [esi+8],6C;TScanner.token:TToken
>0057B11D    jne         0057B127
 0057B11F    inc         dword ptr [esi+20];TScanner.LineNumber:Integer
 0057B122    xor         eax,eax
 0057B124    mov         dword ptr [esi+2C],eax;TScanner.BracketLevel:Integer
 0057B127    mov         ebx,dword ptr [esi+24];TScanner.Index:Integer
 0057B12A    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B12D    test        eax,eax
>0057B12F    je          0057B136
 0057B131    sub         eax,4
 0057B134    mov         eax,dword ptr [eax]
 0057B136    mov         edi,eax
 0057B138    test        ebx,ebx
>0057B13A    jg          0057B14E
 0057B13C    mov         byte ptr [esi+8],6D;TScanner.token:TToken
 0057B140    lea         eax,[esi+0C]
 0057B143    call        @UStrClr
>0057B148    jmp         0057B263
 0057B14D    inc         ebx
 0057B14E    cmp         edi,ebx
>0057B150    jl          0057B172
 0057B152    mov         edx,ebx
 0057B154    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B157    call        00577450
 0057B15C    cmp         ax,0D
>0057B160    je          0057B172
 0057B162    mov         edx,ebx
 0057B164    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B167    call        00577450
 0057B16C    cmp         ax,0A
>0057B170    jne         0057B14D
 0057B172    test        ebx,ebx
>0057B174    jle         0057B17A
 0057B176    cmp         edi,ebx
>0057B178    jge         0057B18B
 0057B17A    mov         byte ptr [esi+8],6D;TScanner.token:TToken
 0057B17E    lea         eax,[esi+0C]
 0057B181    call        @UStrClr
>0057B186    jmp         0057B263
 0057B18B    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
 0057B18E    mov         edx,ebx
 0057B190    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B193    call        00577450
 0057B198    sub         ax,0A
>0057B19C    je          0057B1A9
 0057B19E    sub         ax,3
>0057B1A2    je          0057B207
>0057B1A4    jmp         0057B263
 0057B1A9    inc         ebx
 0057B1AA    cmp         edi,ebx
>0057B1AC    jl          0057B1BF
 0057B1AE    mov         edx,ebx
 0057B1B0    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B1B3    call        00577450
 0057B1B8    cmp         ax,0D
>0057B1BC    jne         0057B1BF
 0057B1BE    inc         ebx
 0057B1BF    mov         byte ptr [esi+8],6C;TScanner.token:TToken
 0057B1C3    lea         eax,[esi+0C]
 0057B1C6    call        @UStrClr
 0057B1CB    mov         edx,ebx
 0057B1CD    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B1D0    call        00577670
 0057B1D5    test        al,al
>0057B1D7    je          0057B1FB
 0057B1D9    mov         edx,ebx
 0057B1DB    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B1DE    call        00577450
 0057B1E3    cmp         ax,2026
>0057B1E7    jne         0057B1EC
 0057B1E9    inc         ebx
>0057B1EA    jmp         0057B1EF
 0057B1EC    add         ebx,3
 0057B1EF    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
 0057B1F2    mov         eax,esi
 0057B1F4    call        TScanner.NextLine
>0057B1F9    jmp         0057B263
 0057B1FB    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
 0057B1FE    mov         eax,esi
 0057B200    call        TScanner.Next
>0057B205    jmp         0057B263
 0057B207    inc         ebx
 0057B208    cmp         edi,ebx
>0057B20A    jl          0057B21D
 0057B20C    mov         edx,ebx
 0057B20E    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B211    call        00577450
 0057B216    cmp         ax,0A
>0057B21A    jne         0057B21D
 0057B21C    inc         ebx
 0057B21D    mov         byte ptr [esi+8],6C;TScanner.token:TToken
 0057B221    lea         eax,[esi+0C]
 0057B224    call        @UStrClr
 0057B229    mov         edx,ebx
 0057B22B    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B22E    call        00577670
 0057B233    test        al,al
>0057B235    je          0057B259
 0057B237    mov         edx,ebx
 0057B239    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B23C    call        00577450
 0057B241    cmp         ax,2026
>0057B245    jne         0057B24A
 0057B247    inc         ebx
>0057B248    jmp         0057B24D
 0057B24A    add         ebx,3
 0057B24D    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
 0057B250    mov         eax,esi
 0057B252    call        TScanner.NextLine
>0057B257    jmp         0057B263
 0057B259    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
 0057B25C    mov         eax,esi
 0057B25E    call        TScanner.Next
 0057B263    pop         edi
 0057B264    pop         esi
 0057B265    pop         ebx
 0057B266    ret
end;*}

//0057B268
procedure TScanner.Next;
begin
{*
 0057B268    push        ebp
 0057B269    mov         ebp,esp
 0057B26B    mov         ecx,14
 0057B270    push        0
 0057B272    push        0
 0057B274    dec         ecx
>0057B275    jne         0057B270
 0057B277    push        ebx
 0057B278    push        esi
 0057B279    push        edi
 0057B27A    mov         esi,eax
 0057B27C    xor         eax,eax
 0057B27E    push        ebp
 0057B27F    push        57DA6B
 0057B284    push        dword ptr fs:[eax]
 0057B287    mov         dword ptr fs:[eax],esp
 0057B28A    cmp         byte ptr [esi+8],6C;TScanner.token:TToken
>0057B28E    jne         0057B298
 0057B290    inc         dword ptr [esi+20];TScanner.LineNumber:Integer
 0057B293    xor         eax,eax
 0057B295    mov         dword ptr [esi+2C],eax;TScanner.BracketLevel:Integer
 0057B298    mov         ebx,dword ptr [esi+24];TScanner.Index:Integer
 0057B29B    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B29E    test        eax,eax
>0057B2A0    je          0057B2A7
 0057B2A2    sub         eax,4
 0057B2A5    mov         eax,dword ptr [eax]
 0057B2A7    mov         edi,eax
 0057B2A9    test        ebx,ebx
>0057B2AB    jg          0057B2BE
 0057B2AD    mov         byte ptr [esi+8],6D;TScanner.token:TToken
 0057B2B1    lea         eax,[esi+0C]
 0057B2B4    call        @UStrClr
>0057B2B9    jmp         0057DA45
 0057B2BE    cmp         edi,ebx
>0057B2C0    jl          0057B2F3
 0057B2C2    cmp         byte ptr [esi+29],0;TScanner.SkippedFirstWhiteSpace:Boolean
>0057B2C6    jne         0057B2F3
 0057B2C8    cmp         ebx,1
>0057B2CB    je          0057B2F3
 0057B2CD    mov         edx,ebx
 0057B2CF    dec         edx
 0057B2D0    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B2D3    call        00577450
 0057B2D8    cmp         ax,0D
>0057B2DC    je          0057B2F3
 0057B2DE    mov         edx,ebx
 0057B2E0    dec         edx
 0057B2E1    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B2E4    call        00577450
 0057B2E9    cmp         ax,0A
>0057B2ED    je          0057B2F3
 0057B2EF    xor         eax,eax
>0057B2F1    jmp         0057B2F5
 0057B2F3    mov         al,1
 0057B2F5    mov         byte ptr [ebp-9],al
 0057B2F8    mov         dword ptr [ebp-8],ebx
 0057B2FB    cmp         byte ptr [esi+2A],0;TScanner.InComment:Boolean
>0057B2FF    je          0057B38F
 0057B305    cmp         edi,ebx
>0057B307    jl          0057B38F
>0057B30D    jmp         0057B323
 0057B30F    mov         edx,ebx
 0057B311    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B314    call        00577450
 0057B319    cmp         ax,0D
>0057B31D    jne         0057B322
 0057B31F    inc         dword ptr [esi+20];TScanner.LineNumber:Integer
 0057B322    inc         ebx
 0057B323    cmp         edi,ebx
>0057B325    jl          0057B337
 0057B327    mov         edx,ebx
 0057B329    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B32C    call        00577478
 0057B331    cmp         ax,2A
>0057B335    jne         0057B30F
 0057B337    inc         ebx
 0057B338    cmp         edi,ebx
>0057B33A    jl          0057B34C
 0057B33C    mov         edx,ebx
 0057B33E    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B341    call        00577478
 0057B346    cmp         ax,2F
>0057B34A    jne         0057B323
 0057B34C    mov         edx,ebx
 0057B34E    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B351    call        00577478
 0057B356    cmp         ax,2F
>0057B35A    jne         0057B363
 0057B35C    inc         ebx
 0057B35D    mov         byte ptr [esi+2A],0;TScanner.InComment:Boolean
>0057B361    jmp         0057B367
 0057B363    mov         byte ptr [esi+2A],1;TScanner.InComment:Boolean
 0057B367    cmp         byte ptr [esi+28],0;TScanner.ScanWhiteSpace:Boolean
>0057B36B    je          0057B38F
 0057B36D    mov         byte ptr [esi+8],2;TScanner.token:TToken
 0057B371    lea         eax,[esi+0C]
 0057B374    push        eax
 0057B375    mov         ecx,ebx
 0057B377    sub         ecx,dword ptr [ebp-8]
 0057B37A    inc         ecx
 0057B37B    mov         edx,dword ptr [ebp-8]
 0057B37E    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B381    call        @UStrCopy
 0057B386    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
>0057B389    jmp         0057DA45
 0057B38E    inc         ebx
 0057B38F    cmp         edi,ebx
>0057B391    jl          0057B3C3
 0057B393    mov         edx,ebx
 0057B395    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B398    call        00577450
 0057B39D    cmp         ax,20
>0057B3A1    ja          0057B3C3
 0057B3A3    mov         edx,ebx
 0057B3A5    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B3A8    call        00577450
 0057B3AD    cmp         ax,0D
>0057B3B1    je          0057B3C3
 0057B3B3    mov         edx,ebx
 0057B3B5    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B3B8    call        00577450
 0057B3BD    cmp         ax,0A
>0057B3C1    jne         0057B38E
 0057B3C3    cmp         byte ptr [esi+28],0;TScanner.ScanWhiteSpace:Boolean
>0057B3C7    je          0057B3F5
 0057B3C9    cmp         ebx,dword ptr [ebp-8]
>0057B3CC    je          0057B3F5
 0057B3CE    mov         byte ptr [esi+8],1;TScanner.token:TToken
 0057B3D2    lea         eax,[esi+0C]
 0057B3D5    push        eax
 0057B3D6    mov         ecx,ebx
 0057B3D8    sub         ecx,dword ptr [ebp-8]
 0057B3DB    mov         edx,dword ptr [ebp-8]
 0057B3DE    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B3E1    call        @UStrCopy
 0057B3E6    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
 0057B3E9    movzx       eax,byte ptr [ebp-9]
 0057B3ED    mov         byte ptr [esi+29],al;TScanner.SkippedFirstWhiteSpace:Boolean
>0057B3F0    jmp         0057DA45
 0057B3F5    mov         byte ptr [esi+29],0;TScanner.SkippedFirstWhiteSpace:Boolean
 0057B3F9    test        ebx,ebx
>0057B3FB    jle         0057B401
 0057B3FD    cmp         edi,ebx
>0057B3FF    jge         0057B412
 0057B401    mov         byte ptr [esi+8],6D;TScanner.token:TToken
 0057B405    lea         eax,[esi+0C]
 0057B408    call        @UStrClr
>0057B40D    jmp         0057DA45
 0057B412    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
 0057B415    mov         dword ptr [ebp-8],ebx
 0057B418    mov         edx,ebx
 0057B41A    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B41D    call        00577478
 0057B422    mov         edx,eax
 0057B424    lea         eax,[esi+0C]
 0057B427    call        @UStrFromWChar
 0057B42C    mov         edx,ebx
 0057B42E    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B431    call        00577478
 0057B436    call        004F8E44
 0057B43B    test        al,al
>0057B43D    je          0057B7BA
 0057B443    lea         eax,[esi+0C]
 0057B446    call        @UStrClr
 0057B44B    mov         edx,ebx
 0057B44D    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B450    call        00577478
 0057B455    cmp         ax,69
>0057B459    je          0057B46B
 0057B45B    mov         edx,ebx
 0057B45D    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B460    call        00577478
 0057B465    cmp         ax,49
>0057B469    jne         0057B4D7
 0057B46B    lea         eax,[ebp-18]
 0057B46E    push        eax
 0057B46F    mov         ecx,5
 0057B474    mov         edx,ebx
 0057B476    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B479    call        @UStrCopy
 0057B47E    mov         eax,dword ptr [ebp-18]
 0057B481    lea         edx,[ebp-14]
 0057B484    call        LowerCase
 0057B489    mov         eax,dword ptr [ebp-14]
 0057B48C    mov         edx,57DA88;'isn''t'
 0057B491    call        @UStrEqual
>0057B496    jne         0057B4D7
 0057B498    mov         byte ptr [esi+8],5C;TScanner.token:TToken
 0057B49C    lea         eax,[esi+0C]
 0057B49F    push        eax
 0057B4A0    mov         ecx,5
 0057B4A5    mov         edx,ebx
 0057B4A7    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B4AA    call        @UStrCopy
 0057B4AF    add         ebx,5
>0057B4B2    jmp         0057DA41
 0057B4B7    mov         edx,ebx
 0057B4B9    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B4BC    call        00577478
 0057B4C1    mov         edx,eax
 0057B4C3    lea         eax,[ebp-1C]
 0057B4C6    call        @UStrFromWChar
 0057B4CB    mov         edx,dword ptr [ebp-1C]
 0057B4CE    lea         eax,[esi+0C]
 0057B4D1    call        @UStrCat
 0057B4D6    inc         ebx
 0057B4D7    cmp         edi,ebx
>0057B4D9    jl          0057B4EE
 0057B4DB    mov         edx,ebx
 0057B4DD    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B4E0    call        00577478
 0057B4E5    call        004F8E28
 0057B4EA    test        al,al
>0057B4EC    jne         0057B4B7
 0057B4EE    mov         edx,ebx
 0057B4F0    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B4F3    call        00577478
 0057B4F8    cmp         ax,24
>0057B4FC    jne         0057B51E
 0057B4FE    mov         edx,ebx
 0057B500    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B503    call        00577478
 0057B508    mov         edx,eax
 0057B50A    lea         eax,[ebp-20]
 0057B50D    call        @UStrFromWChar
 0057B512    mov         edx,dword ptr [ebp-20]
 0057B515    lea         eax,[esi+0C]
 0057B518    call        @UStrCat
 0057B51D    inc         ebx
 0057B51E    dec         ebx
 0057B51F    cmp         byte ptr [ebp-9],0
>0057B523    je          0057B5C0
 0057B529    lea         edx,[ebp-24]
 0057B52C    mov         eax,dword ptr [esi+0C]
 0057B52F    call        UpperCase
 0057B534    mov         eax,dword ptr [ebp-24]
 0057B537    mov         edx,57DAA0;'REM'
 0057B53C    call        @UStrEqual
>0057B541    jne         0057B5C0
>0057B543    jmp         0057B546
 0057B545    inc         ebx
 0057B546    cmp         edi,ebx
>0057B548    jl          0057B56A
 0057B54A    mov         edx,ebx
 0057B54C    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B54F    call        00577450
 0057B554    cmp         ax,0D
>0057B558    je          0057B56A
 0057B55A    mov         edx,ebx
 0057B55C    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B55F    call        00577450
 0057B564    cmp         ax,0A
>0057B568    jne         0057B545
 0057B56A    cmp         byte ptr [esi+28],0;TScanner.ScanWhiteSpace:Boolean
>0057B56E    je          0057B590
 0057B570    mov         byte ptr [esi+8],2;TScanner.token:TToken
 0057B574    lea         eax,[esi+0C]
 0057B577    push        eax
 0057B578    mov         ecx,ebx
 0057B57A    sub         ecx,dword ptr [ebp-8]
 0057B57D    mov         edx,dword ptr [ebp-8]
 0057B580    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B583    call        @UStrCopy
 0057B588    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
>0057B58B    jmp         0057DA45
 0057B590    cmp         edi,ebx
>0057B592    jge         0057B5A5
 0057B594    mov         byte ptr [esi+8],6D;TScanner.token:TToken
 0057B598    lea         eax,[esi+0C]
 0057B59B    call        @UStrClr
>0057B5A0    jmp         0057DA41
 0057B5A5    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
 0057B5A8    mov         byte ptr [esi+8],2;TScanner.token:TToken
 0057B5AC    lea         eax,[esi+0C]
 0057B5AF    call        @UStrClr
 0057B5B4    mov         eax,esi
 0057B5B6    call        TScanner.Next
>0057B5BB    jmp         0057DA45
 0057B5C0    lea         edx,[ebp-28]
 0057B5C3    mov         eax,dword ptr [esi+0C]
 0057B5C6    call        UpperCase
 0057B5CB    mov         eax,dword ptr [ebp-28]
 0057B5CE    mov         edx,57DAB4;'S'
 0057B5D3    call        @UStrEqual
>0057B5D8    je          0057B5F8
 0057B5DA    lea         edx,[ebp-2C]
 0057B5DD    mov         eax,dword ptr [esi+0C]
 0057B5E0    call        UpperCase
 0057B5E5    mov         eax,dword ptr [ebp-2C]
 0057B5E8    mov         edx,57DAC4;'M'
 0057B5ED    call        @UStrEqual
>0057B5F2    jne         0057B6A4
 0057B5F8    cmp         byte ptr [ebp-9],0
>0057B5FC    je          0057B607
 0057B5FE    mov         byte ptr [esi+8],3;TScanner.token:TToken
>0057B602    jmp         0057DA41
 0057B607    mov         edx,dword ptr [esi+24];TScanner.Index:Integer
 0057B60A    dec         edx
 0057B60B    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B60E    call        00577478
 0057B613    movzx       eax,ax
 0057B616    cmp         eax,26
>0057B619    jg          0057B62E
>0057B61B    je          0057B649
 0057B61D    sub         eax,1
>0057B620    jb          0057B640
 0057B622    sub         eax,6
>0057B625    je          0057B652
 0057B627    sub         eax,19
>0057B62A    je          0057B652
>0057B62C    jmp         0057B69B
 0057B62E    add         eax,0FFFFFFD6
 0057B631    sub         eax,5
>0057B634    jb          0057B649
 0057B636    add         eax,0FFFFFFF5
 0057B639    sub         eax,5
>0057B63C    jb          0057B649
>0057B63E    jmp         0057B69B
 0057B640    mov         byte ptr [esi+8],3;TScanner.token:TToken
>0057B644    jmp         0057DA41
 0057B649    mov         byte ptr [esi+8],3;TScanner.token:TToken
>0057B64D    jmp         0057DA41
 0057B652    mov         edx,dword ptr [esi+24];TScanner.Index:Integer
 0057B655    sub         edx,2
 0057B658    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B65B    call        00577478
 0057B660    sub         ax,1
>0057B664    jb          0057B680
 0057B666    sub         ax,25
>0057B66A    je          0057B689
 0057B66C    add         eax,0FFFFFFFC
 0057B66F    sub         ax,5
>0057B673    jb          0057B689
 0057B675    add         eax,0FFFFFFF5
 0057B678    sub         ax,5
>0057B67C    jb          0057B689
>0057B67E    jmp         0057B692
 0057B680    mov         byte ptr [esi+8],3;TScanner.token:TToken
>0057B684    jmp         0057DA41
 0057B689    mov         byte ptr [esi+8],3;TScanner.token:TToken
>0057B68D    jmp         0057DA41
 0057B692    mov         byte ptr [esi+8],5;TScanner.token:TToken
>0057B696    jmp         0057DA41
 0057B69B    mov         byte ptr [esi+8],5;TScanner.token:TToken
>0057B69F    jmp         0057DA41
 0057B6A4    mov         edx,dword ptr [esi+24];TScanner.Index:Integer
 0057B6A7    dec         edx
 0057B6A8    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B6AB    call        00577478
 0057B6B0    mov         edx,57DAC8
 0057B6B5    mov         dword ptr [ebp-10],edx
 0057B6B8    mov         edx,dword ptr [ebp-10]
 0057B6BB    cmp         ax,0FF
>0057B6BF    ja          0057B6C7
 0057B6C1    movzx       eax,ax
 0057B6C4    bt          dword ptr [edx],eax
 0057B6C7    setb        al
 0057B6CA    test        al,al
>0057B6CC    je          0057B6D2
 0057B6CE    mov         al,1
>0057B6D0    jmp         0057B6E3
 0057B6D2    mov         edx,dword ptr [esi+24];TScanner.Index:Integer
 0057B6D5    dec         edx
 0057B6D6    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B6D9    call        00577450
 0057B6DE    call        00579B98
 0057B6E3    test        al,al
>0057B6E5    je          0057B705
 0057B6E7    mov         eax,dword ptr [esi+0C]
 0057B6EA    call        00577B84
 0057B6EF    mov         byte ptr [esi+8],al;TScanner.token:TToken
 0057B6F2    cmp         byte ptr [esi+8],5;TScanner.token:TToken
>0057B6F6    je          0057DA41
 0057B6FC    mov         byte ptr [esi+8],4;TScanner.token:TToken
>0057B700    jmp         0057DA41
 0057B705    mov         edx,dword ptr [esi+24];TScanner.Index:Integer
 0057B708    dec         edx
 0057B709    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B70C    call        00577478
 0057B711    cmp         ax,2E
>0057B715    je          0057B7A1
 0057B71B    mov         edx,dword ptr [esi+24];TScanner.Index:Integer
 0057B71E    sub         edx,2
 0057B721    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B724    call        00577478
 0057B729    cmp         ax,3A
>0057B72D    jne         0057B741
 0057B72F    mov         edx,dword ptr [esi+24];TScanner.Index:Integer
 0057B732    dec         edx
 0057B733    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B736    call        00577478
 0057B73B    cmp         ax,3A
>0057B73F    je          0057B7A1
 0057B741    mov         edx,dword ptr [esi+24];TScanner.Index:Integer
 0057B744    sub         edx,2
 0057B747    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B74A    call        00577478
 0057B74F    cmp         ax,2D
>0057B753    jne         0057B767
 0057B755    mov         edx,dword ptr [esi+24];TScanner.Index:Integer
 0057B758    dec         edx
 0057B759    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B75C    call        00577478
 0057B761    cmp         ax,3E
>0057B765    je          0057B7A1
 0057B767    mov         edx,dword ptr [esi+24];TScanner.Index:Integer
 0057B76A    sub         edx,3
 0057B76D    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B770    call        00577478
 0057B775    cmp         ax,27
>0057B779    jne         0057B7AA
 0057B77B    mov         edx,dword ptr [esi+24];TScanner.Index:Integer
 0057B77E    sub         edx,2
 0057B781    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B784    call        00577478
 0057B789    cmp         ax,73
>0057B78D    jne         0057B7AA
 0057B78F    mov         edx,dword ptr [esi+24];TScanner.Index:Integer
 0057B792    dec         edx
 0057B793    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B796    call        00577450
 0057B79B    cmp         ax,20
>0057B79F    jne         0057B7AA
 0057B7A1    mov         byte ptr [esi+8],3;TScanner.token:TToken
>0057B7A5    jmp         0057DA41
 0057B7AA    mov         eax,dword ptr [esi+0C]
 0057B7AD    call        00577B84
 0057B7B2    mov         byte ptr [esi+8],al;TScanner.token:TToken
>0057B7B5    jmp         0057DA41
 0057B7BA    mov         edx,ebx
 0057B7BC    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057B7BF    call        00577478
 0057B7C4    movzx       eax,ax
 0057B7C7    cmp         eax,2268
>0057B7CC    jg          0057BB0E
>0057B7D2    je          0057D3B6
 0057B7D8    cmp         eax,0B4
>0057B7DD    jg          0057B97B
>0057B7E3    je          0057CA0E
 0057B7E9    cmp         eax,3B
>0057B7EC    jg          0057B8CF
>0057B7F2    je          0057D647
 0057B7F8    add         eax,0FFFFFFF6
 0057B7FB    cmp         eax,30
>0057B7FE    ja          0057DA3D
 0057B804    jmp         dword ptr [eax*4+57B80B]
 0057B804    dd          0057C128
 0057B804    dd          0057DA3D
 0057B804    dd          0057DA3D
 0057B804    dd          0057C18F
 0057B804    dd          0057DA3D
 0057B804    dd          0057DA3D
 0057B804    dd          0057DA3D
 0057B804    dd          0057DA3D
 0057B804    dd          0057DA3D
 0057B804    dd          0057DA3D
 0057B804    dd          0057DA3D
 0057B804    dd          0057DA3D
 0057B804    dd          0057DA3D
 0057B804    dd          0057DA3D
 0057B804    dd          0057DA3D
 0057B804    dd          0057DA3D
 0057B804    dd          0057DA3D
 0057B804    dd          0057DA3D
 0057B804    dd          0057DA3D
 0057B804    dd          0057DA3D
 0057B804    dd          0057DA3D
 0057B804    dd          0057DA3D
 0057B804    dd          0057DA3D
 0057B804    dd          0057D528
 0057B804    dd          0057C881
 0057B804    dd          0057DA3D
 0057B804    dd          0057DA3D
 0057B804    dd          0057D1ED
 0057B804    dd          0057CCA0
 0057B804    dd          0057CA0E
 0057B804    dd          0057D5F5
 0057B804    dd          0057D601
 0057B804    dd          0057CF2F
 0057B804    dd          0057CD2B
 0057B804    dd          0057D6D9
 0057B804    dd          0057CDEB
 0057B804    dd          0057BE50
 0057B804    dd          0057D04F
 0057B804    dd          0057C242
 0057B804    dd          0057C242
 0057B804    dd          0057C242
 0057B804    dd          0057C242
 0057B804    dd          0057C242
 0057B804    dd          0057C242
 0057B804    dd          0057C242
 0057B804    dd          0057C242
 0057B804    dd          0057C242
 0057B804    dd          0057C242
 0057B804    dd          0057D5A9
 0057B8CF    cmp         eax,60
>0057B8D2    jg          0057B926
>0057B8D4    je          0057CA0E
 0057B8DA    cmp         eax,40
>0057B8DD    jg          0057B908
>0057B8DF    je          0057D903
 0057B8E5    sub         eax,3C
>0057B8E8    je          0057D322
 0057B8EE    dec         eax
>0057B8EF    je          0057D2D9
 0057B8F5    dec         eax
>0057B8F6    je          0057D3F5
 0057B8FC    dec         eax
>0057B8FD    je          0057D6EB
>0057B903    jmp         0057DA3D
 0057B908    sub         eax,5B
>0057B90B    je          0057D60D
 0057B911    sub         eax,2
>0057B914    je          0057D619
 0057B91A    dec         eax
>0057B91B    je          0057D6F4
>0057B921    jmp         0057DA3D
 0057B926    cmp         eax,0AB
>0057B92B    jg          0057B956
>0057B92D    je          0057C3E2
 0057B933    sub         eax,7B
>0057B936    je          0057D625
 0057B93C    dec         eax
>0057B93D    je          0057CD03
 0057B943    dec         eax
>0057B944    je          0057D631
 0057B94A    dec         eax
>0057B94B    je          0057D45C
>0057B951    jmp         0057DA3D
 0057B956    sub         eax,0AC
>0057B95B    je          0057D4C2
 0057B961    sub         eax,4
>0057B964    je          0057D90C
 0057B96A    add         eax,0FFFFFFFE
 0057B96D    sub         eax,2
>0057B970    jb          0057D6FD
>0057B976    jmp         0057DA3D
 0057B97B    cmp         eax,2212
>0057B980    jg          0057BA5E
>0057B986    je          0057CD8E
 0057B98C    cmp         eax,203C
>0057B991    jg          0057B9FC
>0057B993    je          0057D022
 0057B999    cmp         eax,2018
>0057B99E    jge         0057B9CE
 0057B9A0    sub         eax,0B9
>0057B9A5    je          0057D6FD
 0057B9AB    add         eax,0FFFFFFFD
 0057B9AE    sub         eax,3
>0057B9B1    jb          0057C1F6
 0057B9B7    sub         eax,18
>0057B9BA    je          0057CFFE
 0057B9C0    sub         eax,20
>0057B9C3    je          0057D02B
>0057B9C9    jmp         0057DA3D
 0057B9CE    add         eax,0FFFFDFE8
 0057B9D3    sub         eax,4
>0057B9D6    jb          0057CA0E
 0057B9DC    sub         eax,3
>0057B9DF    jb          0057C881
 0057B9E5    sub         eax,7
>0057B9E8    je          0057D6E2
 0057B9EE    sub         eax,13
>0057B9F1    je          0057C503
>0057B9F7    jmp         0057DA3D
 0057B9FC    cmp         eax,2125
>0057BA01    jg          0057BA39
>0057BA03    je          0057D91D
 0057BA09    sub         eax,2044
>0057BA0E    je          0057D02B
 0057BA14    add         eax,0FFFFFFD4
 0057BA17    sub         eax,0B
>0057BA1A    jb          0057D6FD
 0057BA20    sub         eax,88
>0057BA25    je          0057D90C
 0057BA2B    sub         eax,6
>0057BA2E    je          0057D90C
>0057BA34    jmp         0057DA3D
 0057BA39    add         eax,0FFFFDEAD
 0057BA3E    sub         eax,0C
>0057BA41    jb          0057C1F6
 0057BA47    sub         eax,71
>0057BA4A    je          0057D3EC
 0057BA50    sub         eax,2
>0057BA53    je          0057C878
>0057BA59    jmp         0057DA3D
 0057BA5E    cmp         eax,2249
>0057BA63    jg          0057BAC1
>0057BA65    je          0057D392
 0057BA6B    cmp         eax,2228
>0057BA70    jg          0057BAA1
>0057BA72    je          0057D3DA
 0057BA78    sub         eax,2215
>0057BA7D    je          0057D02B
 0057BA83    sub         eax,4
>0057BA86    je          0057D3E3
 0057BA8C    dec         eax
>0057BA8D    je          0057CD78
 0057BA93    sub         eax,0D
>0057BA96    je          0057D3D1
>0057BA9C    jmp         0057DA3D
 0057BAA1    sub         eax,2245
>0057BAA6    je          0057D389
 0057BAAC    sub         eax,2
>0057BAAF    je          0057D392
 0057BAB5    dec         eax
>0057BAB6    je          0057D389
>0057BABC    jmp         0057DA3D
 0057BAC1    cmp         eax,2264
>0057BAC6    jg          0057BAF0
>0057BAC8    je          0057D3A4
 0057BACE    sub         eax,224A
>0057BAD3    je          0057D389
 0057BAD9    sub         eax,0A
>0057BADC    je          0057D3EC
 0057BAE2    sub         eax,0C
>0057BAE5    je          0057D39B
>0057BAEB    jmp         0057DA3D
 0057BAF0    sub         eax,2265
>0057BAF5    je          0057D3AD
 0057BAFB    dec         eax
>0057BAFC    je          0057D3A4
 0057BB02    dec         eax
>0057BB03    je          0057D3AD
>0057BB09    jmp         0057DA3D
 0057BB0E    cmp         eax,4E03
>0057BB13    jg          0057BCAF
>0057BB19    je          0057DA34
 0057BB1F    cmp         eax,338D
>0057BB24    jg          0057BBFB
>0057BB2A    je          0057D92E
 0057BB30    cmp         eax,22DC
>0057BB35    jg          0057BB9C
>0057BB37    je          0057D3A4
 0057BB3D    cmp         eax,2278
>0057BB42    jge         0057BB70
 0057BB44    sub         eax,2269
>0057BB49    je          0057D3BF
 0057BB4F    sub         eax,5
>0057BB52    je          0057D3AD
 0057BB58    dec         eax
>0057BB59    je          0057D3A4
 0057BB5F    add         eax,0FFFFFFF9
 0057BB62    sub         eax,2
>0057BB65    jb          0057D39B
>0057BB6B    jmp         0057DA3D
 0057BB70    add         eax,0FFFFDD88
 0057BB75    sub         eax,2
>0057BB78    jb          0057D3C8
 0057BB7E    sub         eax,46
>0057BB81    je          0057D3D1
 0057BB87    dec         eax
>0057BB88    je          0057D3DA
 0057BB8E    sub         eax,4
>0057BB91    je          0057D3E3
>0057BB97    jmp         0057DA3D
 0057BB9C    cmp         eax,3007
>0057BBA1    jg          0057BBD6
>0057BBA3    je          0057DA34
 0057BBA9    sub         eax,22DD
>0057BBAE    je          0057D3AD
 0057BBB4    sub         eax,438
>0057BBB9    je          0057CFFE
 0057BBBF    sub         eax,8EC
>0057BBC4    je          0057C866
 0057BBCA    dec         eax
>0057BBCB    je          0057C86F
>0057BBD1    jmp         0057DA3D
 0057BBD6    sub         eax,300C
>0057BBDB    je          0057C624
 0057BBE1    sub         eax,2
>0057BBE4    je          0057C745
 0057BBEA    add         eax,0FFFFFFF1
 0057BBED    sub         eax,3
>0057BBF0    jb          0057C881
>0057BBF6    jmp         0057DA3D
 0057BBFB    cmp         eax,339D
>0057BC00    jg          0057BC59
>0057BC02    je          0057D9C4
 0057BC08    add         eax,0FFFFCC72
 0057BC0D    cmp         eax,0E
>0057BC10    ja          0057DA3D
 0057BC16    jmp         dword ptr [eax*4+57BC1D]
 0057BC16    dd          0057D93F
 0057BC16    dd          0057D950
 0057BC16    dd          0057D961
 0057BC16    dd          0057D972
 0057BC16    dd          0057D983
 0057BC16    dd          0057D994
 0057BC16    dd          0057DA3D
 0057BC16    dd          0057DA3D
 0057BC16    dd          0057DA3D
 0057BC16    dd          0057DA3D
 0057BC16    dd          0057DA3D
 0057BC16    dd          0057DA3D
 0057BC16    dd          0057DA3D
 0057BC16    dd          0057D9A5
 0057BC16    dd          0057D9B6
 0057BC59    cmp         eax,33AD
>0057BC5E    jg          0057BC8D
>0057BC60    je          0057DA0A
 0057BC66    sub         eax,339E
>0057BC6B    je          0057D9D2
 0057BC71    dec         eax
>0057BC72    je          0057D9E0
 0057BC78    sub         eax,8
>0057BC7B    je          0057D9EE
 0057BC81    dec         eax
>0057BC82    je          0057D9FC
>0057BC88    jmp         0057DA3D
 0057BC8D    sub         eax,33AE
>0057BC92    je          0057DA18
 0057BC98    dec         eax
>0057BC99    je          0057DA26
 0057BC9F    sub         eax,1A51
>0057BCA4    je          0057DA34
>0057BCAA    jmp         0057DA3D
 0057BCAF    cmp         eax,58F1
>0057BCB4    jg          0057BD86
>0057BCBA    je          0057DA34
 0057BCC0    cmp         eax,4F70
>0057BCC5    jg          0057BD27
>0057BCC7    je          0057DA34
 0057BCCD    cmp         eax,4E94
>0057BCD2    jg          0057BD05
>0057BCD4    je          0057DA34
 0057BCDA    sub         eax,4E07
>0057BCDF    je          0057DA34
 0057BCE5    sub         eax,2
>0057BCE8    je          0057DA34
 0057BCEE    sub         eax,54
>0057BCF1    je          0057DA34
 0057BCF7    sub         eax,2F
>0057BCFA    je          0057DA34
>0057BD00    jmp         0057DA3D
 0057BD05    sub         eax,4EBF
>0057BD0A    je          0057DA34
 0057BD10    sub         eax,20
>0057BD13    je          0057DA34
 0057BD19    sub         eax,2E
>0057BD1C    je          0057DA34
>0057BD22    jmp         0057DA3D
 0057BD27    cmp         eax,5341
>0057BD2C    jg          0057BD5F
>0057BD2E    je          0057DA34
 0057BD34    sub         eax,5104
>0057BD39    je          0057DA34
 0057BD3F    sub         eax,42
>0057BD42    je          0057DA34
 0057BD48    sub         eax,25
>0057BD4B    je          0057DA34
 0057BD51    sub         eax,2
>0057BD54    je          0057DA34
>0057BD5A    jmp         0057DA3D
 0057BD5F    sub         eax,5343
>0057BD64    je          0057DA34
 0057BD6A    add         eax,0FFFFFF82
 0057BD6D    sub         eax,3
>0057BD70    jb          0057DA34
 0057BD76    sub         eax,317
>0057BD7B    je          0057DA34
>0057BD81    jmp         0057DA3D
 0057BD86    cmp         eax,8086
>0057BD8B    jg          0057BDF6
>0057BD8D    je          0057DA34
 0057BD93    cmp         eax,634C
>0057BD98    jg          0057BDD0
>0057BD9A    je          0057DA34
 0057BDA0    sub         eax,58F9
>0057BDA5    je          0057DA34
 0057BDAB    add         eax,0FFFFF9ED
 0057BDB0    sub         eax,3
>0057BDB3    jb          0057DA34
 0057BDB9    dec         eax
>0057BDBA    je          0057DA34
 0057BDC0    sub         eax,3EE
>0057BDC5    je          0057DA34
>0057BDCB    jmp         0057DA3D
 0057BDD0    sub         eax,67D2
>0057BDD5    je          0057DA34
 0057BDDB    sub         eax,0BC4
>0057BDE0    je          0057DA34
 0057BDE6    sub         eax,2E8
>0057BDEB    je          0057DA34
>0057BDF1    jmp         0057DA3D
 0057BDF6    cmp         eax,9646
>0057BDFB    jg          0057BE29
>0057BDFD    je          0057DA34
 0057BE03    sub         eax,842C
>0057BE08    je          0057DA34
 0057BE0E    sub         eax,882
>0057BE13    je          0057DA34
 0057BE19    sub         eax,82
>0057BE1E    je          0057DA34
>0057BE24    jmp         0057DA3D
 0057BE29    sub         eax,964C
>0057BE2E    je          0057DA34
 0057BE34    sub         eax,2C
>0057BE37    je          0057DA34
 0057BE3D    add         eax,0FFFF9768
 0057BE42    sub         eax,0A
>0057BE45    jb          0057C242
>0057BE4B    jmp         0057DA3D
 0057BE50    mov         edx,ebx
 0057BE52    dec         edx
 0057BE53    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057BE56    call        00577450
 0057BE5B    call        00577538
 0057BE60    test        al,al
>0057BE62    jne         0057BE75
 0057BE64    mov         edx,ebx
 0057BE66    dec         edx
 0057BE67    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057BE6A    call        00577478
 0057BE6F    cmp         ax,5D
>0057BE73    jne         0057BEA3
 0057BE75    lea         edx,[ebx+1]
 0057BE78    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057BE7B    call        00577450
 0057BE80    call        00577538
 0057BE85    test        al,al
>0057BE87    jne         0057BE9A
 0057BE89    lea         edx,[ebx+1]
 0057BE8C    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057BE8F    call        00577478
 0057BE94    cmp         ax,5B
>0057BE98    jne         0057BEA3
 0057BE9A    mov         byte ptr [esi+8],1C;TScanner.token:TToken
>0057BE9E    jmp         0057DA41
 0057BEA3    mov         edx,ebx
 0057BEA5    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057BEA8    call        00577670
 0057BEAD    test        al,al
>0057BEAF    je          0057BEBD
 0057BEB1    mov         byte ptr [esi+8],1A;TScanner.token:TToken
 0057BEB5    add         ebx,2
>0057BEB8    jmp         0057DA41
 0057BEBD    mov         edx,ebx
 0057BEBF    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057BEC2    call        005776EC
 0057BEC7    test        al,al
>0057BEC9    je          0057BED5
 0057BECB    mov         byte ptr [esi+8],1B;TScanner.token:TToken
 0057BECF    inc         ebx
>0057BED0    jmp         0057DA41
 0057BED5    mov         edx,ebx
 0057BED7    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057BEDA    call        005775CC
 0057BEDF    test        al,al
>0057BEE1    je          0057BEEC
 0057BEE3    mov         byte ptr [esi+8],17;TScanner.token:TToken
>0057BEE7    jmp         0057DA41
 0057BEEC    mov         edx,ebx
 0057BEEE    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057BEF1    call        005777F4
 0057BEF6    test        al,al
>0057BEF8    je          0057BF03
 0057BEFA    mov         byte ptr [esi+8],31;TScanner.token:TToken
>0057BEFE    jmp         0057DA41
 0057BF03    mov         edx,ebx
 0057BF05    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057BF08    call        00577768
 0057BF0D    test        al,al
>0057BF0F    je          0057C11F
 0057BF15    mov         byte ptr [esi+8],9;TScanner.token:TToken
 0057BF19    lea         eax,[esi+0C]
 0057BF1C    mov         edx,57DAF4;'0.'
 0057BF21    call        @UStrAsg
 0057BF26    inc         ebx
>0057BF27    jmp         0057BF59
 0057BF29    mov         edx,ebx
 0057BF2B    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057BF2E    call        00577478
 0057BF33    cmp         ax,5F
>0057BF37    je          0057BF58
 0057BF39    mov         edx,ebx
 0057BF3B    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057BF3E    call        00577478
 0057BF43    mov         edx,eax
 0057BF45    lea         eax,[ebp-30]
 0057BF48    call        @UStrFromWChar
 0057BF4D    mov         edx,dword ptr [ebp-30]
 0057BF50    lea         eax,[esi+0C]
 0057BF53    call        @UStrCat
 0057BF58    inc         ebx
 0057BF59    cmp         edi,ebx
>0057BF5B    jl          0057BF8D
 0057BF5D    mov         edx,ebx
 0057BF5F    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057BF62    call        00577478
 0057BF67    cmp         ax,30
>0057BF6B    jb          0057BF7D
 0057BF6D    mov         edx,ebx
 0057BF6F    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057BF72    call        00577478
 0057BF77    cmp         ax,39
>0057BF7B    jbe         0057BF29
 0057BF7D    mov         edx,ebx
 0057BF7F    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057BF82    call        00577478
 0057BF87    cmp         ax,5F
>0057BF8B    je          0057BF29
 0057BF8D    lea         eax,[ebx+1]
 0057BF90    cmp         edi,eax
>0057BF92    jl          0057C0F3
 0057BF98    mov         edx,ebx
 0057BF9A    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057BF9D    call        00577478
 0057BFA2    cmp         ax,65
>0057BFA6    je          0057BFBC
 0057BFA8    mov         edx,ebx
 0057BFAA    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057BFAD    call        00577478
 0057BFB2    cmp         ax,45
>0057BFB6    jne         0057C0F3
 0057BFBC    lea         edx,[ebx+1]
 0057BFBF    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057BFC2    call        00577478
 0057BFC7    cmp         ax,30
>0057BFCB    jb          0057BFDE
 0057BFCD    lea         edx,[ebx+1]
 0057BFD0    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057BFD3    call        00577478
 0057BFD8    cmp         ax,39
>0057BFDC    jbe         0057C039
 0057BFDE    lea         eax,[ebx+2]
 0057BFE1    cmp         edi,eax
>0057BFE3    jl          0057C0F3
 0057BFE9    lea         edx,[ebx+1]
 0057BFEC    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057BFEF    call        00577478
 0057BFF4    cmp         ax,2D
>0057BFF8    je          0057C00F
 0057BFFA    lea         edx,[ebx+1]
 0057BFFD    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C000    call        00577478
 0057C005    cmp         ax,2B
>0057C009    jne         0057C0F3
 0057C00F    lea         edx,[ebx+2]
 0057C012    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C015    call        00577478
 0057C01A    cmp         ax,30
>0057C01E    jb          0057C0F3
 0057C024    lea         edx,[ebx+2]
 0057C027    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C02A    call        00577478
 0057C02F    cmp         ax,39
>0057C033    ja          0057C0F3
 0057C039    lea         edx,[ebx+1]
 0057C03C    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C03F    call        00577478
 0057C044    cmp         ax,2D
>0057C048    jne         0057C05C
 0057C04A    lea         eax,[esi+0C]
 0057C04D    mov         edx,57DB08;'e-'
 0057C052    call        @UStrCat
 0057C057    add         ebx,2
>0057C05A    jmp         0057C0BF
 0057C05C    lea         edx,[ebx+1]
 0057C05F    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C062    call        00577478
 0057C067    cmp         ax,2B
>0057C06B    jne         0057C07F
 0057C06D    lea         eax,[esi+0C]
 0057C070    mov         edx,57DB1C;'e'
 0057C075    call        @UStrCat
 0057C07A    add         ebx,2
>0057C07D    jmp         0057C0BF
 0057C07F    lea         eax,[esi+0C]
 0057C082    mov         edx,57DB1C;'e'
 0057C087    call        @UStrCat
 0057C08C    inc         ebx
>0057C08D    jmp         0057C0BF
 0057C08F    mov         edx,ebx
 0057C091    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C094    call        00577478
 0057C099    cmp         ax,5F
>0057C09D    je          0057C0BE
 0057C09F    mov         edx,ebx
 0057C0A1    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C0A4    call        00577478
 0057C0A9    mov         edx,eax
 0057C0AB    lea         eax,[ebp-34]
 0057C0AE    call        @UStrFromWChar
 0057C0B3    mov         edx,dword ptr [ebp-34]
 0057C0B6    lea         eax,[esi+0C]
 0057C0B9    call        @UStrCat
 0057C0BE    inc         ebx
 0057C0BF    cmp         edi,ebx
>0057C0C1    jl          0057C0F3
 0057C0C3    mov         edx,ebx
 0057C0C5    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C0C8    call        00577478
 0057C0CD    cmp         ax,30
>0057C0D1    jb          0057C0E3
 0057C0D3    mov         edx,ebx
 0057C0D5    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C0D8    call        00577478
 0057C0DD    cmp         ax,39
>0057C0E1    jbe         0057C08F
 0057C0E3    mov         edx,ebx
 0057C0E5    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C0E8    call        00577478
 0057C0ED    cmp         ax,5F
>0057C0F1    je          0057C08F
 0057C0F3    dec         ebx
 0057C0F4    push        0FFFF
 0057C0F9    push        0C0000000
 0057C0FE    push        0
 0057C100    mov         eax,dword ptr [esi+0C]
 0057C103    call        004F8DB8
 0057C108    fstp        qword ptr [esi+18]
 0057C10B    wait
 0057C10C    fld         qword ptr [esi+18]
 0057C10F    call        @ROUND
 0057C114    mov         dword ptr [esi+10],eax
 0057C117    mov         dword ptr [esi+14],edx
>0057C11A    jmp         0057DA41
 0057C11F    mov         byte ptr [esi+8],1D;TScanner.token:TToken
>0057C123    jmp         0057DA41
 0057C128    inc         ebx
 0057C129    cmp         edi,ebx
>0057C12B    jl          0057C13E
 0057C12D    mov         edx,ebx
 0057C12F    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C132    call        00577450
 0057C137    cmp         ax,0D
>0057C13B    jne         0057C13E
 0057C13D    inc         ebx
 0057C13E    mov         byte ptr [esi+8],6C;TScanner.token:TToken
 0057C142    lea         eax,[esi+0C]
 0057C145    push        eax
 0057C146    mov         ecx,ebx
 0057C148    sub         ecx,dword ptr [ebp-8]
 0057C14B    mov         edx,dword ptr [ebp-8]
 0057C14E    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C151    call        @UStrCopy
 0057C156    mov         edx,ebx
 0057C158    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C15B    call        00577670
 0057C160    test        al,al
>0057C162    je          0057C189
 0057C164    mov         edx,ebx
 0057C166    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C169    call        00577450
 0057C16E    cmp         ax,2026
>0057C172    jne         0057C177
 0057C174    inc         ebx
>0057C175    jmp         0057C17A
 0057C177    add         ebx,3
 0057C17A    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
 0057C17D    mov         eax,esi
 0057C17F    call        TScanner.Next
>0057C184    jmp         0057DA45
 0057C189    dec         ebx
>0057C18A    jmp         0057DA41
 0057C18F    inc         ebx
 0057C190    cmp         edi,ebx
>0057C192    jl          0057C1A5
 0057C194    mov         edx,ebx
 0057C196    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C199    call        00577450
 0057C19E    cmp         ax,0A
>0057C1A2    jne         0057C1A5
 0057C1A4    inc         ebx
 0057C1A5    mov         byte ptr [esi+8],6C;TScanner.token:TToken
 0057C1A9    lea         eax,[esi+0C]
 0057C1AC    push        eax
 0057C1AD    mov         ecx,ebx
 0057C1AF    sub         ecx,dword ptr [ebp-8]
 0057C1B2    mov         edx,dword ptr [ebp-8]
 0057C1B5    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C1B8    call        @UStrCopy
 0057C1BD    mov         edx,ebx
 0057C1BF    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C1C2    call        00577670
 0057C1C7    test        al,al
>0057C1C9    je          0057C1F0
 0057C1CB    mov         edx,ebx
 0057C1CD    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C1D0    call        00577450
 0057C1D5    cmp         ax,2026
>0057C1D9    jne         0057C1DE
 0057C1DB    inc         ebx
>0057C1DC    jmp         0057C1E1
 0057C1DE    add         ebx,3
 0057C1E1    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
 0057C1E4    mov         eax,esi
 0057C1E6    call        TScanner.Next
>0057C1EB    jmp         0057DA45
 0057C1F0    dec         ebx
>0057C1F1    jmp         0057DA41
 0057C1F6    mov         byte ptr [esi+8],9;TScanner.token:TToken
 0057C1FA    mov         edx,ebx
 0057C1FC    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C1FF    call        00577450
 0057C204    call        00579BBC
 0057C209    fstp        qword ptr [esi+18]
 0057C20C    wait
 0057C20D    fld         qword ptr [esi+18]
 0057C210    call        @ROUND
 0057C215    mov         dword ptr [esi+10],eax
 0057C218    mov         dword ptr [esi+14],edx
 0057C21B    fld         qword ptr [esi+18]
 0057C21E    add         esp,0FFFFFFF4
 0057C221    fstp        tbyte ptr [esp]
 0057C224    wait
 0057C225    lea         edx,[ebp-4]
 0057C228    mov         eax,[0078D6A8];^gvar_00790CDC:TFormatSettings
 0057C22D    call        FloatToStr
 0057C232    lea         eax,[esi+0C]
 0057C235    mov         edx,dword ptr [ebp-4]
 0057C238    call        @UStrAsg
>0057C23D    jmp         0057DA41
 0057C242    lea         eax,[ebp-3C]
 0057C245    push        eax
 0057C246    mov         ecx,3
 0057C24B    mov         edx,ebx
 0057C24D    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C250    call        @UStrCopy
 0057C255    mov         eax,dword ptr [ebp-3C]
 0057C258    lea         edx,[ebp-38]
 0057C25B    call        LowerCase
 0057C260    mov         eax,dword ptr [ebp-38]
 0057C263    mov         edx,57DB2C;'5dt'
 0057C268    call        @UStrEqual
>0057C26D    jne         0057C28B
 0057C26F    add         ebx,3
 0057C272    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
 0057C275    mov         byte ptr [esi+8],3;TScanner.token:TToken
 0057C279    lea         eax,[esi+0C]
 0057C27C    mov         edx,57DB40;'FiveDT'
 0057C281    call        @UStrAsg
>0057C286    jmp         0057DA45
 0057C28B    mov         edx,ebx
 0057C28D    dec         edx
 0057C28E    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C291    call        00577478
 0057C296    cmp         ax,2E
>0057C29A    jne         0057C2B3
 0057C29C    mov         edx,ebx
 0057C29E    sub         edx,2
 0057C2A1    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C2A4    call        00577478
 0057C2A9    cmp         ax,2E
>0057C2AD    jne         0057C341
 0057C2B3    mov         edx,dword ptr [esi+24];TScanner.Index:Integer
 0057C2B6    sub         edx,2
 0057C2B9    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C2BC    call        00577478
 0057C2C1    cmp         ax,3A
>0057C2C5    jne         0057C2D9
 0057C2C7    mov         edx,dword ptr [esi+24];TScanner.Index:Integer
 0057C2CA    dec         edx
 0057C2CB    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C2CE    call        00577478
 0057C2D3    cmp         ax,3A
>0057C2D7    je          0057C341
 0057C2D9    mov         edx,dword ptr [esi+24];TScanner.Index:Integer
 0057C2DC    sub         edx,2
 0057C2DF    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C2E2    call        00577478
 0057C2E7    cmp         ax,2D
>0057C2EB    jne         0057C2FF
 0057C2ED    mov         edx,dword ptr [esi+24];TScanner.Index:Integer
 0057C2F0    dec         edx
 0057C2F1    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C2F4    call        00577478
 0057C2F9    cmp         ax,3E
>0057C2FD    je          0057C341
 0057C2FF    mov         edx,dword ptr [esi+24];TScanner.Index:Integer
 0057C302    sub         edx,3
 0057C305    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C308    call        00577478
 0057C30D    cmp         ax,27
>0057C311    jne         0057C3BC
 0057C317    mov         edx,dword ptr [esi+24];TScanner.Index:Integer
 0057C31A    sub         edx,2
 0057C31D    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C320    call        00577478
 0057C325    cmp         ax,73
>0057C329    jne         0057C3BC
 0057C32F    mov         edx,dword ptr [esi+24];TScanner.Index:Integer
 0057C332    dec         edx
 0057C333    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C336    call        00577450
 0057C33B    cmp         ax,20
>0057C33F    jne         0057C3BC
 0057C341    lea         eax,[esi+0C]
 0057C344    call        @UStrClr
>0057C349    jmp         0057C36B
 0057C34B    mov         edx,ebx
 0057C34D    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C350    call        00577450
 0057C355    mov         edx,eax
 0057C357    lea         eax,[ebp-40]
 0057C35A    call        @UStrFromWChar
 0057C35F    mov         edx,dword ptr [ebp-40]
 0057C362    lea         eax,[esi+0C]
 0057C365    call        @UStrCat
 0057C36A    inc         ebx
 0057C36B    cmp         edi,ebx
>0057C36D    jl          0057C382
 0057C36F    mov         edx,ebx
 0057C371    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C374    call        00577450
 0057C379    call        00577558
 0057C37E    test        al,al
>0057C380    jne         0057C34B
 0057C382    mov         edx,ebx
 0057C384    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C387    call        00577478
 0057C38C    cmp         ax,24
>0057C390    jne         0057C3B2
 0057C392    mov         edx,ebx
 0057C394    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C397    call        00577450
 0057C39C    mov         edx,eax
 0057C39E    lea         eax,[ebp-44]
 0057C3A1    call        @UStrFromWChar
 0057C3A6    mov         edx,dword ptr [ebp-44]
 0057C3A9    lea         eax,[esi+0C]
 0057C3AC    call        @UStrCat
 0057C3B1    inc         ebx
 0057C3B2    dec         ebx
 0057C3B3    mov         byte ptr [esi+8],3;TScanner.token:TToken
>0057C3B7    jmp         0057DA41
 0057C3BC    mov         eax,[0078D710];^gvar_0081555F
 0057C3C1    cmp         byte ptr [eax],0
>0057C3C4    jne         0057C3D4
 0057C3C6    mov         eax,[0078D0B4];^gvar_0081555E
 0057C3CB    cmp         byte ptr [eax],0
>0057C3CE    jne         0057C3D4
 0057C3D0    xor         edx,edx
>0057C3D2    jmp         0057C3D6
 0057C3D4    mov         dl,1
 0057C3D6    mov         eax,esi
 0057C3D8    call        00579E5C
>0057C3DD    jmp         0057DA45
 0057C3E2    mov         byte ptr [esi+8],6;TScanner.token:TToken
 0057C3E6    lea         eax,[esi+0C]
 0057C3E9    call        @UStrClr
 0057C3EE    inc         ebx
 0057C3EF    lea         eax,[ebx+1]
 0057C3F2    cmp         edi,eax
>0057C3F4    jl          0057C4DD
 0057C3FA    mov         edx,ebx
 0057C3FC    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C3FF    call        00577450
 0057C404    cmp         ax,0BB
>0057C408    jne         0057C4DD
 0057C40E    lea         edx,[ebx+1]
 0057C411    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C414    call        00577450
 0057C419    cmp         ax,0BB
>0057C41D    jne         0057C4DD
 0057C423    mov         edx,ebx
 0057C425    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C428    call        00577450
 0057C42D    mov         edx,eax
 0057C42F    lea         eax,[ebp-48]
 0057C432    call        @UStrFromWChar
 0057C437    mov         edx,dword ptr [ebp-48]
 0057C43A    lea         eax,[esi+0C]
 0057C43D    call        @UStrCat
 0057C442    add         ebx,2
>0057C445    jmp         0057C4DD
>0057C44A    jmp         0057C47F
 0057C44C    mov         edx,ebx
 0057C44E    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C451    call        00577450
 0057C456    cmp         ax,0D
>0057C45A    jne         0057C45F
 0057C45C    inc         dword ptr [esi+20];TScanner.LineNumber:Integer
 0057C45F    mov         edx,ebx
 0057C461    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C464    call        00577450
 0057C469    mov         edx,eax
 0057C46B    lea         eax,[ebp-4C]
 0057C46E    call        @UStrFromWChar
 0057C473    mov         edx,dword ptr [ebp-4C]
 0057C476    lea         eax,[esi+0C]
 0057C479    call        @UStrCat
 0057C47E    inc         ebx
 0057C47F    cmp         edi,ebx
>0057C481    jl          0057C493
 0057C483    mov         edx,ebx
 0057C485    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C488    call        00577450
 0057C48D    cmp         ax,0BB
>0057C491    jne         0057C44C
 0057C493    mov         eax,edi
 0057C495    dec         eax
 0057C496    cmp         ebx,eax
>0057C498    jg          0057C4DD
 0057C49A    mov         edx,ebx
 0057C49C    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C49F    call        00577450
 0057C4A4    cmp         ax,0BB
>0057C4A8    jne         0057C4DD
 0057C4AA    lea         edx,[ebx+1]
 0057C4AD    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C4B0    call        00577450
 0057C4B5    cmp         ax,0BB
>0057C4B9    jne         0057C4DD
 0057C4BB    mov         edx,ebx
 0057C4BD    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C4C0    call        00577450
 0057C4C5    mov         edx,eax
 0057C4C7    lea         eax,[ebp-50]
 0057C4CA    call        @UStrFromWChar
 0057C4CF    mov         edx,dword ptr [ebp-50]
 0057C4D2    lea         eax,[esi+0C]
 0057C4D5    call        @UStrCat
 0057C4DA    add         ebx,2
 0057C4DD    cmp         edi,ebx
>0057C4DF    jl          0057C4F1
 0057C4E1    mov         edx,ebx
 0057C4E3    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C4E6    call        00577450
 0057C4EB    cmp         ax,0BB
>0057C4EF    jne         0057C47F
 0057C4F1    cmp         edi,ebx
>0057C4F3    jge         0057DA41
 0057C4F9    mov         byte ptr [esi+8],7;TScanner.token:TToken
 0057C4FD    dec         ebx
>0057C4FE    jmp         0057DA41
 0057C503    mov         byte ptr [esi+8],6;TScanner.token:TToken
 0057C507    lea         eax,[esi+0C]
 0057C50A    call        @UStrClr
 0057C50F    inc         ebx
 0057C510    lea         eax,[ebx+1]
 0057C513    cmp         edi,eax
>0057C515    jl          0057C5FE
 0057C51B    mov         edx,ebx
 0057C51D    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C520    call        00577450
 0057C525    cmp         ax,203A
>0057C529    jne         0057C5FE
 0057C52F    lea         edx,[ebx+1]
 0057C532    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C535    call        00577450
 0057C53A    cmp         ax,203A
>0057C53E    jne         0057C5FE
 0057C544    mov         edx,ebx
 0057C546    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C549    call        00577450
 0057C54E    mov         edx,eax
 0057C550    lea         eax,[ebp-54]
 0057C553    call        @UStrFromWChar
 0057C558    mov         edx,dword ptr [ebp-54]
 0057C55B    lea         eax,[esi+0C]
 0057C55E    call        @UStrCat
 0057C563    add         ebx,2
>0057C566    jmp         0057C5FE
>0057C56B    jmp         0057C5A0
 0057C56D    mov         edx,ebx
 0057C56F    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C572    call        00577450
 0057C577    cmp         ax,0D
>0057C57B    jne         0057C580
 0057C57D    inc         dword ptr [esi+20];TScanner.LineNumber:Integer
 0057C580    mov         edx,ebx
 0057C582    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C585    call        00577450
 0057C58A    mov         edx,eax
 0057C58C    lea         eax,[ebp-58]
 0057C58F    call        @UStrFromWChar
 0057C594    mov         edx,dword ptr [ebp-58]
 0057C597    lea         eax,[esi+0C]
 0057C59A    call        @UStrCat
 0057C59F    inc         ebx
 0057C5A0    cmp         edi,ebx
>0057C5A2    jl          0057C5B4
 0057C5A4    mov         edx,ebx
 0057C5A6    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C5A9    call        00577450
 0057C5AE    cmp         ax,203A
>0057C5B2    jne         0057C56D
 0057C5B4    mov         eax,edi
 0057C5B6    dec         eax
 0057C5B7    cmp         ebx,eax
>0057C5B9    jg          0057C5FE
 0057C5BB    mov         edx,ebx
 0057C5BD    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C5C0    call        00577450
 0057C5C5    cmp         ax,203A
>0057C5C9    jne         0057C5FE
 0057C5CB    lea         edx,[ebx+1]
 0057C5CE    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C5D1    call        00577450
 0057C5D6    cmp         ax,203A
>0057C5DA    jne         0057C5FE
 0057C5DC    mov         edx,ebx
 0057C5DE    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C5E1    call        00577450
 0057C5E6    mov         edx,eax
 0057C5E8    lea         eax,[ebp-5C]
 0057C5EB    call        @UStrFromWChar
 0057C5F0    mov         edx,dword ptr [ebp-5C]
 0057C5F3    lea         eax,[esi+0C]
 0057C5F6    call        @UStrCat
 0057C5FB    add         ebx,2
 0057C5FE    cmp         edi,ebx
>0057C600    jl          0057C612
 0057C602    mov         edx,ebx
 0057C604    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C607    call        00577450
 0057C60C    cmp         ax,203A
>0057C610    jne         0057C5A0
 0057C612    cmp         edi,ebx
>0057C614    jge         0057DA41
 0057C61A    mov         byte ptr [esi+8],7;TScanner.token:TToken
 0057C61E    dec         ebx
>0057C61F    jmp         0057DA41
 0057C624    mov         byte ptr [esi+8],6;TScanner.token:TToken
 0057C628    lea         eax,[esi+0C]
 0057C62B    call        @UStrClr
 0057C630    inc         ebx
 0057C631    lea         eax,[ebx+1]
 0057C634    cmp         edi,eax
>0057C636    jl          0057C71F
 0057C63C    mov         edx,ebx
 0057C63E    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C641    call        00577450
 0057C646    cmp         ax,300D
>0057C64A    jne         0057C71F
 0057C650    lea         edx,[ebx+1]
 0057C653    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C656    call        00577450
 0057C65B    cmp         ax,300D
>0057C65F    jne         0057C71F
 0057C665    mov         edx,ebx
 0057C667    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C66A    call        00577450
 0057C66F    mov         edx,eax
 0057C671    lea         eax,[ebp-60]
 0057C674    call        @UStrFromWChar
 0057C679    mov         edx,dword ptr [ebp-60]
 0057C67C    lea         eax,[esi+0C]
 0057C67F    call        @UStrCat
 0057C684    add         ebx,2
>0057C687    jmp         0057C71F
>0057C68C    jmp         0057C6C1
 0057C68E    mov         edx,ebx
 0057C690    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C693    call        00577450
 0057C698    cmp         ax,0D
>0057C69C    jne         0057C6A1
 0057C69E    inc         dword ptr [esi+20];TScanner.LineNumber:Integer
 0057C6A1    mov         edx,ebx
 0057C6A3    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C6A6    call        00577450
 0057C6AB    mov         edx,eax
 0057C6AD    lea         eax,[ebp-64]
 0057C6B0    call        @UStrFromWChar
 0057C6B5    mov         edx,dword ptr [ebp-64]
 0057C6B8    lea         eax,[esi+0C]
 0057C6BB    call        @UStrCat
 0057C6C0    inc         ebx
 0057C6C1    cmp         edi,ebx
>0057C6C3    jl          0057C6D5
 0057C6C5    mov         edx,ebx
 0057C6C7    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C6CA    call        00577450
 0057C6CF    cmp         ax,300D
>0057C6D3    jne         0057C68E
 0057C6D5    mov         eax,edi
 0057C6D7    dec         eax
 0057C6D8    cmp         ebx,eax
>0057C6DA    jg          0057C71F
 0057C6DC    mov         edx,ebx
 0057C6DE    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C6E1    call        00577450
 0057C6E6    cmp         ax,300D
>0057C6EA    jne         0057C71F
 0057C6EC    lea         edx,[ebx+1]
 0057C6EF    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C6F2    call        00577450
 0057C6F7    cmp         ax,300D
>0057C6FB    jne         0057C71F
 0057C6FD    mov         edx,ebx
 0057C6FF    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C702    call        00577450
 0057C707    mov         edx,eax
 0057C709    lea         eax,[ebp-68]
 0057C70C    call        @UStrFromWChar
 0057C711    mov         edx,dword ptr [ebp-68]
 0057C714    lea         eax,[esi+0C]
 0057C717    call        @UStrCat
 0057C71C    add         ebx,2
 0057C71F    cmp         edi,ebx
>0057C721    jl          0057C733
 0057C723    mov         edx,ebx
 0057C725    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C728    call        00577450
 0057C72D    cmp         ax,300D
>0057C731    jne         0057C6C1
 0057C733    cmp         edi,ebx
>0057C735    jge         0057DA41
 0057C73B    mov         byte ptr [esi+8],7;TScanner.token:TToken
 0057C73F    dec         ebx
>0057C740    jmp         0057DA41
 0057C745    mov         byte ptr [esi+8],6;TScanner.token:TToken
 0057C749    lea         eax,[esi+0C]
 0057C74C    call        @UStrClr
 0057C751    inc         ebx
 0057C752    lea         eax,[ebx+1]
 0057C755    cmp         edi,eax
>0057C757    jl          0057C840
 0057C75D    mov         edx,ebx
 0057C75F    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C762    call        00577450
 0057C767    cmp         ax,300F
>0057C76B    jne         0057C840
 0057C771    lea         edx,[ebx+1]
 0057C774    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C777    call        00577450
 0057C77C    cmp         ax,300F
>0057C780    jne         0057C840
 0057C786    mov         edx,ebx
 0057C788    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C78B    call        00577450
 0057C790    mov         edx,eax
 0057C792    lea         eax,[ebp-6C]
 0057C795    call        @UStrFromWChar
 0057C79A    mov         edx,dword ptr [ebp-6C]
 0057C79D    lea         eax,[esi+0C]
 0057C7A0    call        @UStrCat
 0057C7A5    add         ebx,2
>0057C7A8    jmp         0057C840
>0057C7AD    jmp         0057C7E2
 0057C7AF    mov         edx,ebx
 0057C7B1    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C7B4    call        00577450
 0057C7B9    cmp         ax,0D
>0057C7BD    jne         0057C7C2
 0057C7BF    inc         dword ptr [esi+20];TScanner.LineNumber:Integer
 0057C7C2    mov         edx,ebx
 0057C7C4    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C7C7    call        00577450
 0057C7CC    mov         edx,eax
 0057C7CE    lea         eax,[ebp-70]
 0057C7D1    call        @UStrFromWChar
 0057C7D6    mov         edx,dword ptr [ebp-70]
 0057C7D9    lea         eax,[esi+0C]
 0057C7DC    call        @UStrCat
 0057C7E1    inc         ebx
 0057C7E2    cmp         edi,ebx
>0057C7E4    jl          0057C7F6
 0057C7E6    mov         edx,ebx
 0057C7E8    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C7EB    call        00577450
 0057C7F0    cmp         ax,300F
>0057C7F4    jne         0057C7AF
 0057C7F6    mov         eax,edi
 0057C7F8    dec         eax
 0057C7F9    cmp         ebx,eax
>0057C7FB    jg          0057C840
 0057C7FD    mov         edx,ebx
 0057C7FF    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C802    call        00577450
 0057C807    cmp         ax,300F
>0057C80B    jne         0057C840
 0057C80D    lea         edx,[ebx+1]
 0057C810    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C813    call        00577450
 0057C818    cmp         ax,300F
>0057C81C    jne         0057C840
 0057C81E    mov         edx,ebx
 0057C820    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C823    call        00577450
 0057C828    mov         edx,eax
 0057C82A    lea         eax,[ebp-74]
 0057C82D    call        @UStrFromWChar
 0057C832    mov         edx,dword ptr [ebp-74]
 0057C835    lea         eax,[esi+0C]
 0057C838    call        @UStrCat
 0057C83D    add         ebx,2
 0057C840    cmp         edi,ebx
>0057C842    jl          0057C854
 0057C844    mov         edx,ebx
 0057C846    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C849    call        00577450
 0057C84E    cmp         ax,300F
>0057C852    jne         0057C7E2
 0057C854    cmp         edi,ebx
>0057C856    jge         0057DA41
 0057C85C    mov         byte ptr [esi+8],7;TScanner.token:TToken
 0057C860    dec         ebx
>0057C861    jmp         0057DA41
 0057C866    mov         byte ptr [esi+8],17;TScanner.token:TToken
>0057C86A    jmp         0057DA41
 0057C86F    mov         byte ptr [esi+8],16;TScanner.token:TToken
>0057C873    jmp         0057DA41
 0057C878    mov         byte ptr [esi+8],3F;TScanner.token:TToken
>0057C87C    jmp         0057DA41
 0057C881    mov         byte ptr [esi+8],6;TScanner.token:TToken
 0057C885    lea         eax,[esi+0C]
 0057C888    call        @UStrClr
 0057C88D    inc         ebx
 0057C88E    lea         eax,[ebx+1]
 0057C891    cmp         edi,eax
>0057C893    jl          0057C9E1
 0057C899    mov         edx,ebx
 0057C89B    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C89E    call        00577450
 0057C8A3    call        00577564
 0057C8A8    test        al,al
>0057C8AA    je          0057C9E1
 0057C8B0    lea         edx,[ebx+1]
 0057C8B3    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C8B6    call        00577450
 0057C8BB    call        00577564
 0057C8C0    test        al,al
>0057C8C2    je          0057C9E1
 0057C8C8    mov         edx,ebx
 0057C8CA    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C8CD    call        00577450
 0057C8D2    push        eax
 0057C8D3    lea         edx,[ebx+1]
 0057C8D6    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C8D9    call        00577450
 0057C8DE    pop         edx
 0057C8DF    cmp         dx,ax
>0057C8E2    je          0057C8F3
 0057C8E4    lea         eax,[esi+0C]
 0057C8E7    mov         edx,57DB5C;'"'
 0057C8EC    call        @UStrCat
>0057C8F1    jmp         0057C912
 0057C8F3    mov         edx,ebx
 0057C8F5    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C8F8    call        00577450
 0057C8FD    mov         edx,eax
 0057C8FF    lea         eax,[ebp-78]
 0057C902    call        @UStrFromWChar
 0057C907    mov         edx,dword ptr [ebp-78]
 0057C90A    lea         eax,[esi+0C]
 0057C90D    call        @UStrCat
 0057C912    add         ebx,2
>0057C915    jmp         0057C9E1
>0057C91A    jmp         0057C94F
 0057C91C    mov         edx,ebx
 0057C91E    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C921    call        00577450
 0057C926    cmp         ax,0D
>0057C92A    jne         0057C92F
 0057C92C    inc         dword ptr [esi+20];TScanner.LineNumber:Integer
 0057C92F    mov         edx,ebx
 0057C931    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C934    call        00577450
 0057C939    mov         edx,eax
 0057C93B    lea         eax,[ebp-7C]
 0057C93E    call        @UStrFromWChar
 0057C943    mov         edx,dword ptr [ebp-7C]
 0057C946    lea         eax,[esi+0C]
 0057C949    call        @UStrCat
 0057C94E    inc         ebx
 0057C94F    cmp         edi,ebx
>0057C951    jl          0057C966
 0057C953    mov         edx,ebx
 0057C955    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C958    call        00577450
 0057C95D    call        00577564
 0057C962    test        al,al
>0057C964    je          0057C91C
 0057C966    mov         eax,edi
 0057C968    dec         eax
 0057C969    cmp         ebx,eax
>0057C96B    jg          0057C9E1
 0057C96D    mov         edx,ebx
 0057C96F    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C972    call        00577450
 0057C977    call        00577564
 0057C97C    test        al,al
>0057C97E    je          0057C9E1
 0057C980    lea         edx,[ebx+1]
 0057C983    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C986    call        00577450
 0057C98B    call        00577564
 0057C990    test        al,al
>0057C992    je          0057C9E1
 0057C994    mov         edx,ebx
 0057C996    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C999    call        00577450
 0057C99E    push        eax
 0057C99F    lea         edx,[ebx+1]
 0057C9A2    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C9A5    call        00577450
 0057C9AA    pop         edx
 0057C9AB    cmp         dx,ax
>0057C9AE    je          0057C9BF
 0057C9B0    lea         eax,[esi+0C]
 0057C9B3    mov         edx,57DB5C;'"'
 0057C9B8    call        @UStrCat
>0057C9BD    jmp         0057C9DE
 0057C9BF    mov         edx,ebx
 0057C9C1    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C9C4    call        00577450
 0057C9C9    mov         edx,eax
 0057C9CB    lea         eax,[ebp-80]
 0057C9CE    call        @UStrFromWChar
 0057C9D3    mov         edx,dword ptr [ebp-80]
 0057C9D6    lea         eax,[esi+0C]
 0057C9D9    call        @UStrCat
 0057C9DE    add         ebx,2
 0057C9E1    cmp         edi,ebx
>0057C9E3    jl          0057C9FC
 0057C9E5    mov         edx,ebx
 0057C9E7    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057C9EA    call        00577450
 0057C9EF    call        00577564
 0057C9F4    test        al,al
>0057C9F6    je          0057C94F
 0057C9FC    cmp         edi,ebx
>0057C9FE    jge         0057DA41
 0057CA04    mov         byte ptr [esi+8],7;TScanner.token:TToken
 0057CA08    dec         ebx
>0057CA09    jmp         0057DA41
 0057CA0E    lea         eax,[esi+0C]
 0057CA11    call        @UStrClr
 0057CA16    cmp         byte ptr [ebp-9],0
>0057CA1A    je          0057CA99
>0057CA1C    jmp         0057CA1F
 0057CA1E    inc         ebx
 0057CA1F    cmp         edi,ebx
>0057CA21    jl          0057CA43
 0057CA23    mov         edx,ebx
 0057CA25    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CA28    call        00577450
 0057CA2D    cmp         ax,0D
>0057CA31    je          0057CA43
 0057CA33    mov         edx,ebx
 0057CA35    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CA38    call        00577450
 0057CA3D    cmp         ax,0A
>0057CA41    jne         0057CA1E
 0057CA43    cmp         byte ptr [esi+28],0;TScanner.ScanWhiteSpace:Boolean
>0057CA47    je          0057CA69
 0057CA49    mov         byte ptr [esi+8],2;TScanner.token:TToken
 0057CA4D    lea         eax,[esi+0C]
 0057CA50    push        eax
 0057CA51    mov         ecx,ebx
 0057CA53    sub         ecx,dword ptr [ebp-8]
 0057CA56    mov         edx,dword ptr [ebp-8]
 0057CA59    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CA5C    call        @UStrCopy
 0057CA61    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
>0057CA64    jmp         0057DA45
 0057CA69    cmp         edi,ebx
>0057CA6B    jge         0057CA7E
 0057CA6D    mov         byte ptr [esi+8],6D;TScanner.token:TToken
 0057CA71    lea         eax,[esi+0C]
 0057CA74    call        @UStrClr
>0057CA79    jmp         0057DA41
 0057CA7E    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
 0057CA81    mov         byte ptr [esi+8],2;TScanner.token:TToken
 0057CA85    lea         eax,[esi+0C]
 0057CA88    call        @UStrClr
 0057CA8D    mov         eax,esi
 0057CA8F    call        TScanner.Next
>0057CA94    jmp         0057DA45
 0057CA99    mov         edx,ebx
 0057CA9B    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CA9E    call        005778CC
 0057CAA3    test        al,al
>0057CAA5    je          0057CAC5
 0057CAA7    mov         byte ptr [esi+8],1E;TScanner.token:TToken
 0057CAAB    add         ebx,2
 0057CAAE    lea         eax,[esi+0C]
 0057CAB1    push        eax
 0057CAB2    mov         ecx,ebx
 0057CAB4    dec         ecx
 0057CAB5    mov         edx,dword ptr [ebp-8]
 0057CAB8    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CABB    call        @UStrCopy
>0057CAC0    jmp         0057DA41
 0057CAC5    mov         edx,ebx
 0057CAC7    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CACA    call        00577994
 0057CACF    test        al,al
>0057CAD1    je          0057CAF1
 0057CAD3    mov         byte ptr [esi+8],36;TScanner.token:TToken
 0057CAD7    mov         edx,ebx
 0057CAD9    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CADC    call        00577450
 0057CAE1    mov         edx,eax
 0057CAE3    lea         eax,[esi+0C]
 0057CAE6    call        @UStrFromWChar
 0057CAEB    inc         ebx
>0057CAEC    jmp         0057DA41
 0057CAF1    mov         byte ptr [esi+8],6;TScanner.token:TToken
 0057CAF5    lea         eax,[esi+0C]
 0057CAF8    call        @UStrClr
 0057CAFD    inc         ebx
 0057CAFE    lea         eax,[ebx+1]
 0057CB01    cmp         edi,eax
>0057CB03    jl          0057CC6B
 0057CB09    mov         edx,ebx
 0057CB0B    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CB0E    call        00577450
 0057CB13    call        0057759C
 0057CB18    test        al,al
>0057CB1A    je          0057CC6B
 0057CB20    lea         edx,[ebx+1]
 0057CB23    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CB26    call        00577450
 0057CB2B    call        0057759C
 0057CB30    test        al,al
>0057CB32    je          0057CC6B
 0057CB38    mov         edx,ebx
 0057CB3A    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CB3D    call        00577450
 0057CB42    push        eax
 0057CB43    lea         edx,[ebx+1]
 0057CB46    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CB49    call        00577450
 0057CB4E    pop         edx
 0057CB4F    cmp         dx,ax
>0057CB52    je          0057CB63
 0057CB54    lea         eax,[esi+0C]
 0057CB57    mov         edx,57DB6C;''''
 0057CB5C    call        @UStrCat
>0057CB61    jmp         0057CB88
 0057CB63    mov         edx,ebx
 0057CB65    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CB68    call        00577450
 0057CB6D    mov         edx,eax
 0057CB6F    lea         eax,[ebp-84]
 0057CB75    call        @UStrFromWChar
 0057CB7A    mov         edx,dword ptr [ebp-84]
 0057CB80    lea         eax,[esi+0C]
 0057CB83    call        @UStrCat
 0057CB88    add         ebx,2
>0057CB8B    jmp         0057CC6B
>0057CB90    jmp         0057CBCB
 0057CB92    mov         edx,ebx
 0057CB94    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CB97    call        00577450
 0057CB9C    cmp         ax,0D
>0057CBA0    jne         0057CBA5
 0057CBA2    inc         dword ptr [esi+20];TScanner.LineNumber:Integer
 0057CBA5    mov         edx,ebx
 0057CBA7    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CBAA    call        00577450
 0057CBAF    mov         edx,eax
 0057CBB1    lea         eax,[ebp-88]
 0057CBB7    call        @UStrFromWChar
 0057CBBC    mov         edx,dword ptr [ebp-88]
 0057CBC2    lea         eax,[esi+0C]
 0057CBC5    call        @UStrCat
 0057CBCA    inc         ebx
 0057CBCB    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CBCE    call        @UStrLen
 0057CBD3    cmp         ebx,eax
>0057CBD5    jg          0057CBEA
 0057CBD7    mov         edx,ebx
 0057CBD9    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CBDC    call        00577450
 0057CBE1    call        0057759C
 0057CBE6    test        al,al
>0057CBE8    je          0057CB92
 0057CBEA    mov         eax,edi
 0057CBEC    dec         eax
 0057CBED    cmp         ebx,eax
>0057CBEF    jg          0057CC6B
 0057CBF1    mov         edx,ebx
 0057CBF3    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CBF6    call        00577450
 0057CBFB    call        0057759C
 0057CC00    test        al,al
>0057CC02    je          0057CC6B
 0057CC04    lea         edx,[ebx+1]
 0057CC07    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CC0A    call        00577450
 0057CC0F    call        0057759C
 0057CC14    test        al,al
>0057CC16    je          0057CC6B
 0057CC18    mov         edx,ebx
 0057CC1A    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CC1D    call        00577450
 0057CC22    push        eax
 0057CC23    lea         edx,[ebx+1]
 0057CC26    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CC29    call        00577450
 0057CC2E    pop         edx
 0057CC2F    cmp         dx,ax
>0057CC32    je          0057CC43
 0057CC34    lea         eax,[esi+0C]
 0057CC37    mov         edx,57DB6C;''''
 0057CC3C    call        @UStrCat
>0057CC41    jmp         0057CC68
 0057CC43    mov         edx,ebx
 0057CC45    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CC48    call        00577450
 0057CC4D    mov         edx,eax
 0057CC4F    lea         eax,[ebp-8C]
 0057CC55    call        @UStrFromWChar
 0057CC5A    mov         edx,dword ptr [ebp-8C]
 0057CC60    lea         eax,[esi+0C]
 0057CC63    call        @UStrCat
 0057CC68    add         ebx,2
 0057CC6B    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CC6E    call        @UStrLen
 0057CC73    cmp         ebx,eax
>0057CC75    jg          0057CC8E
 0057CC77    mov         edx,ebx
 0057CC79    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CC7C    call        00577450
 0057CC81    call        0057759C
 0057CC86    test        al,al
>0057CC88    je          0057CBCB
 0057CC8E    cmp         edi,ebx
>0057CC90    jge         0057DA41
 0057CC96    mov         byte ptr [esi+8],7;TScanner.token:TToken
 0057CC9A    dec         ebx
>0057CC9B    jmp         0057DA41
 0057CCA0    cmp         edi,ebx
>0057CCA2    jle         0057CCBF
 0057CCA4    lea         edx,[ebx+1]
 0057CCA7    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CCAA    call        00577478
 0057CCAF    cmp         ax,26
>0057CCB3    jne         0057CCBF
 0057CCB5    inc         ebx
 0057CCB6    mov         byte ptr [esi+8],48;TScanner.token:TToken
>0057CCBA    jmp         0057DA41
 0057CCBF    cmp         edi,ebx
>0057CCC1    jle         0057CCFA
 0057CCC3    lea         edx,[ebx+1]
 0057CCC6    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CCC9    call        00577478
 0057CCCE    cmp         ax,68
>0057CCD2    jne         0057CCFA
 0057CCD4    mov         eax,[0078D710];^gvar_0081555F
 0057CCD9    cmp         byte ptr [eax],0
>0057CCDC    jne         0057CCEC
 0057CCDE    mov         eax,[0078D0B4];^gvar_0081555E
 0057CCE3    cmp         byte ptr [eax],0
>0057CCE6    jne         0057CCEC
 0057CCE8    xor         edx,edx
>0057CCEA    jmp         0057CCEE
 0057CCEC    mov         dl,1
 0057CCEE    mov         eax,esi
 0057CCF0    call        00579E5C
>0057CCF5    jmp         0057DA45
 0057CCFA    mov         byte ptr [esi+8],2B;TScanner.token:TToken
>0057CCFE    jmp         0057DA41
 0057CD03    cmp         edi,ebx
>0057CD05    jle         0057CD22
 0057CD07    lea         edx,[ebx+1]
 0057CD0A    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CD0D    call        00577478
 0057CD12    cmp         ax,7C
>0057CD16    jne         0057CD22
 0057CD18    inc         ebx
 0057CD19    mov         byte ptr [esi+8],49;TScanner.token:TToken
>0057CD1D    jmp         0057DA41
 0057CD22    mov         byte ptr [esi+8],4A;TScanner.token:TToken
>0057CD26    jmp         0057DA41
 0057CD2B    cmp         edi,ebx
>0057CD2D    jle         0057CD6F
 0057CD2F    lea         edi,[ebx+1]
 0057CD32    mov         edx,edi
 0057CD34    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CD37    call        00577478
 0057CD3C    cmp         ax,2B
>0057CD40    jne         0057CD4C
 0057CD42    inc         ebx
 0057CD43    mov         byte ptr [esi+8],3D;TScanner.token:TToken
>0057CD47    jmp         0057DA41
 0057CD4C    mov         edx,edi
 0057CD4E    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CD51    call        00577478
 0057CD56    cmp         ax,3D
>0057CD5A    jne         0057CD66
 0057CD5C    inc         ebx
 0057CD5D    mov         byte ptr [esi+8],39;TScanner.token:TToken
>0057CD61    jmp         0057DA41
 0057CD66    mov         byte ptr [esi+8],22;TScanner.token:TToken
>0057CD6A    jmp         0057DA41
 0057CD6F    mov         byte ptr [esi+8],22;TScanner.token:TToken
>0057CD73    jmp         0057DA41
 0057CD78    mov         byte ptr [esi+8],3;TScanner.token:TToken
 0057CD7C    lea         eax,[esi+0C]
 0057CD7F    mov         edx,57DB7C;'sqrt'
 0057CD84    call        @UStrAsg
>0057CD89    jmp         0057DA41
 0057CD8E    cmp         edi,ebx
>0057CD90    jle         0057CDE2
 0057CD92    lea         edi,[ebx+1]
 0057CD95    mov         edx,edi
 0057CD97    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CD9A    call        00577478
 0057CD9F    cmp         ax,2D
>0057CDA3    je          0057CDB5
 0057CDA5    mov         edx,edi
 0057CDA7    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CDAA    call        00577478
 0057CDAF    cmp         ax,2212
>0057CDB3    jne         0057CDBF
 0057CDB5    inc         ebx
 0057CDB6    mov         byte ptr [esi+8],3E;TScanner.token:TToken
>0057CDBA    jmp         0057DA41
 0057CDBF    mov         edx,edi
 0057CDC1    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CDC4    call        00577478
 0057CDC9    cmp         ax,3D
>0057CDCD    jne         0057CDD9
 0057CDCF    inc         ebx
 0057CDD0    mov         byte ptr [esi+8],3A;TScanner.token:TToken
>0057CDD4    jmp         0057DA41
 0057CDD9    mov         byte ptr [esi+8],23;TScanner.token:TToken
>0057CDDD    jmp         0057DA41
 0057CDE2    mov         byte ptr [esi+8],23;TScanner.token:TToken
>0057CDE6    jmp         0057DA41
 0057CDEB    cmp         edi,ebx
>0057CDED    jle         0057CF26
 0057CDF3    lea         eax,[ebx+2]
 0057CDF6    cmp         edi,eax
>0057CDF8    jl          0057CEBC
 0057CDFE    lea         edx,[ebx+1]
 0057CE01    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CE04    call        00577478
 0057CE09    cmp         ax,2D
>0057CE0D    jne         0057CEBC
 0057CE13    lea         edx,[ebx+2]
 0057CE16    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CE19    call        00577450
 0057CE1E    cmp         ax,20
>0057CE22    jne         0057CEBC
 0057CE28    cmp         byte ptr [ebp-9],0
>0057CE2C    jne         0057CE42
 0057CE2E    mov         edx,ebx
 0057CE30    dec         edx
 0057CE31    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CE34    call        00577450
 0057CE39    cmp         ax,20
>0057CE3D    ja          0057CEBC
>0057CE3F    jmp         0057CE42
 0057CE41    inc         ebx
 0057CE42    cmp         edi,ebx
>0057CE44    jl          0057CE66
 0057CE46    mov         edx,ebx
 0057CE48    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CE4B    call        00577450
 0057CE50    cmp         ax,0D
>0057CE54    je          0057CE66
 0057CE56    mov         edx,ebx
 0057CE58    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CE5B    call        00577450
 0057CE60    cmp         ax,0A
>0057CE64    jne         0057CE41
 0057CE66    cmp         byte ptr [esi+28],0;TScanner.ScanWhiteSpace:Boolean
>0057CE6A    je          0057CE8C
 0057CE6C    mov         byte ptr [esi+8],2;TScanner.token:TToken
 0057CE70    lea         eax,[esi+0C]
 0057CE73    push        eax
 0057CE74    mov         ecx,ebx
 0057CE76    sub         ecx,dword ptr [ebp-8]
 0057CE79    mov         edx,dword ptr [ebp-8]
 0057CE7C    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CE7F    call        @UStrCopy
 0057CE84    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
>0057CE87    jmp         0057DA45
 0057CE8C    cmp         edi,ebx
>0057CE8E    jge         0057CEA1
 0057CE90    mov         byte ptr [esi+8],6D;TScanner.token:TToken
 0057CE94    lea         eax,[esi+0C]
 0057CE97    call        @UStrClr
>0057CE9C    jmp         0057DA41
 0057CEA1    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
 0057CEA4    mov         byte ptr [esi+8],2;TScanner.token:TToken
 0057CEA8    lea         eax,[esi+0C]
 0057CEAB    call        @UStrClr
 0057CEB0    mov         eax,esi
 0057CEB2    call        TScanner.Next
>0057CEB7    jmp         0057DA45
 0057CEBC    lea         edi,[ebx+1]
 0057CEBF    mov         edx,edi
 0057CEC1    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CEC4    call        00577478
 0057CEC9    cmp         ax,2D
>0057CECD    je          0057CEDF
 0057CECF    mov         edx,edi
 0057CED1    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CED4    call        00577478
 0057CED9    cmp         ax,2212
>0057CEDD    jne         0057CEE9
 0057CEDF    inc         ebx
 0057CEE0    mov         byte ptr [esi+8],3E;TScanner.token:TToken
>0057CEE4    jmp         0057DA41
 0057CEE9    mov         edx,edi
 0057CEEB    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CEEE    call        00577478
 0057CEF3    cmp         ax,3D
>0057CEF7    jne         0057CF03
 0057CEF9    inc         ebx
 0057CEFA    mov         byte ptr [esi+8],3A;TScanner.token:TToken
>0057CEFE    jmp         0057DA41
 0057CF03    mov         edx,edi
 0057CF05    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CF08    call        00577478
 0057CF0D    cmp         ax,3E
>0057CF11    jne         0057CF1D
 0057CF13    inc         ebx
 0057CF14    mov         byte ptr [esi+8],21;TScanner.token:TToken
>0057CF18    jmp         0057DA41
 0057CF1D    mov         byte ptr [esi+8],23;TScanner.token:TToken
>0057CF21    jmp         0057DA41
 0057CF26    mov         byte ptr [esi+8],23;TScanner.token:TToken
>0057CF2A    jmp         0057DA41
 0057CF2F    cmp         byte ptr [ebp-9],0
>0057CF33    je          0057CFB2
>0057CF35    jmp         0057CF38
 0057CF37    inc         ebx
 0057CF38    cmp         edi,ebx
>0057CF3A    jl          0057CF5C
 0057CF3C    mov         edx,ebx
 0057CF3E    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CF41    call        00577450
 0057CF46    cmp         ax,0D
>0057CF4A    je          0057CF5C
 0057CF4C    mov         edx,ebx
 0057CF4E    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CF51    call        00577450
 0057CF56    cmp         ax,0A
>0057CF5A    jne         0057CF37
 0057CF5C    cmp         byte ptr [esi+28],0;TScanner.ScanWhiteSpace:Boolean
>0057CF60    je          0057CF82
 0057CF62    mov         byte ptr [esi+8],2;TScanner.token:TToken
 0057CF66    lea         eax,[esi+0C]
 0057CF69    push        eax
 0057CF6A    mov         ecx,ebx
 0057CF6C    sub         ecx,dword ptr [ebp-8]
 0057CF6F    mov         edx,dword ptr [ebp-8]
 0057CF72    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CF75    call        @UStrCopy
 0057CF7A    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
>0057CF7D    jmp         0057DA45
 0057CF82    cmp         edi,ebx
>0057CF84    jge         0057CF97
 0057CF86    mov         byte ptr [esi+8],6D;TScanner.token:TToken
 0057CF8A    lea         eax,[esi+0C]
 0057CF8D    call        @UStrClr
>0057CF92    jmp         0057DA41
 0057CF97    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
 0057CF9A    mov         byte ptr [esi+8],2;TScanner.token:TToken
 0057CF9E    lea         eax,[esi+0C]
 0057CFA1    call        @UStrClr
 0057CFA6    mov         eax,esi
 0057CFA8    call        TScanner.Next
>0057CFAD    jmp         0057DA45
 0057CFB2    cmp         edi,ebx
>0057CFB4    jle         0057CFF5
 0057CFB6    lea         edx,[ebx+1]
 0057CFB9    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CFBC    call        00577478
 0057CFC1    cmp         ax,2A
>0057CFC5    jne         0057CFD1
 0057CFC7    inc         ebx
 0057CFC8    mov         byte ptr [esi+8],2D;TScanner.token:TToken
>0057CFCC    jmp         0057DA41
 0057CFD1    lea         edx,[ebx+1]
 0057CFD4    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057CFD7    call        00577478
 0057CFDC    cmp         ax,3D
>0057CFE0    jne         0057CFEC
 0057CFE2    inc         ebx
 0057CFE3    mov         byte ptr [esi+8],3B;TScanner.token:TToken
>0057CFE7    jmp         0057DA41
 0057CFEC    mov         byte ptr [esi+8],24;TScanner.token:TToken
>0057CFF0    jmp         0057DA41
 0057CFF5    mov         byte ptr [esi+8],24;TScanner.token:TToken
>0057CFF9    jmp         0057DA41
 0057CFFE    lea         edx,[ebx+1]
 0057D001    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D004    call        00577478
 0057D009    cmp         ax,3D
>0057D00D    jne         0057D019
 0057D00F    inc         ebx
 0057D010    mov         byte ptr [esi+8],3B;TScanner.token:TToken
>0057D014    jmp         0057DA41
 0057D019    mov         byte ptr [esi+8],24;TScanner.token:TToken
>0057D01D    jmp         0057DA41
 0057D022    mov         byte ptr [esi+8],30;TScanner.token:TToken
>0057D026    jmp         0057DA41
 0057D02B    lea         edx,[ebx+1]
 0057D02E    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D031    call        00577478
 0057D036    cmp         ax,3D
>0057D03A    jne         0057D046
 0057D03C    inc         ebx
 0057D03D    mov         byte ptr [esi+8],3C;TScanner.token:TToken
>0057D041    jmp         0057DA41
 0057D046    mov         byte ptr [esi+8],25;TScanner.token:TToken
>0057D04A    jmp         0057DA41
 0057D04F    cmp         edi,ebx
>0057D051    jle         0057D1E4
 0057D057    lea         edx,[ebx+1]
 0057D05A    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D05D    call        00577478
 0057D062    cmp         ax,2F
>0057D066    jne         0057D0E5
>0057D068    jmp         0057D06B
 0057D06A    inc         ebx
 0057D06B    cmp         edi,ebx
>0057D06D    jl          0057D08F
 0057D06F    mov         edx,ebx
 0057D071    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D074    call        00577450
 0057D079    cmp         ax,0D
>0057D07D    je          0057D08F
 0057D07F    mov         edx,ebx
 0057D081    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D084    call        00577450
 0057D089    cmp         ax,0A
>0057D08D    jne         0057D06A
 0057D08F    cmp         byte ptr [esi+28],0;TScanner.ScanWhiteSpace:Boolean
>0057D093    je          0057D0B5
 0057D095    mov         byte ptr [esi+8],2;TScanner.token:TToken
 0057D099    lea         eax,[esi+0C]
 0057D09C    push        eax
 0057D09D    mov         ecx,ebx
 0057D09F    sub         ecx,dword ptr [ebp-8]
 0057D0A2    mov         edx,dword ptr [ebp-8]
 0057D0A5    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D0A8    call        @UStrCopy
 0057D0AD    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
>0057D0B0    jmp         0057DA45
 0057D0B5    cmp         edi,ebx
>0057D0B7    jge         0057D0CA
 0057D0B9    mov         byte ptr [esi+8],6D;TScanner.token:TToken
 0057D0BD    lea         eax,[esi+0C]
 0057D0C0    call        @UStrClr
>0057D0C5    jmp         0057DA41
 0057D0CA    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
 0057D0CD    mov         byte ptr [esi+8],2;TScanner.token:TToken
 0057D0D1    lea         eax,[esi+0C]
 0057D0D4    call        @UStrClr
 0057D0D9    mov         eax,esi
 0057D0DB    call        TScanner.Next
>0057D0E0    jmp         0057DA45
 0057D0E5    lea         edx,[ebx+1]
 0057D0E8    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D0EB    call        00577450
 0057D0F0    cmp         ax,2A
>0057D0F4    jne         0057D1C0
 0057D0FA    add         ebx,2
>0057D0FD    jmp         0057D113
 0057D0FF    mov         edx,ebx
 0057D101    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D104    call        00577450
 0057D109    cmp         ax,0D
>0057D10D    jne         0057D112
 0057D10F    inc         dword ptr [esi+20];TScanner.LineNumber:Integer
 0057D112    inc         ebx
 0057D113    cmp         edi,ebx
>0057D115    jl          0057D127
 0057D117    mov         edx,ebx
 0057D119    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D11C    call        00577450
 0057D121    cmp         ax,2A
>0057D125    jne         0057D0FF
 0057D127    inc         ebx
 0057D128    cmp         edi,ebx
>0057D12A    jl          0057D13C
 0057D12C    mov         edx,ebx
 0057D12E    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D131    call        00577450
 0057D136    cmp         ax,2F
>0057D13A    jne         0057D113
 0057D13C    cmp         edi,ebx
>0057D13E    jge         0057D146
 0057D140    mov         byte ptr [esi+2A],1;TScanner.InComment:Boolean
>0057D144    jmp         0057D14A
 0057D146    mov         byte ptr [esi+2A],0;TScanner.InComment:Boolean
 0057D14A    mov         edx,ebx
 0057D14C    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D14F    call        00577450
 0057D154    cmp         ax,2F
>0057D158    jne         0057D15B
 0057D15A    inc         ebx
 0057D15B    cmp         byte ptr [esi+28],0;TScanner.ScanWhiteSpace:Boolean
>0057D15F    je          0057D182
 0057D161    mov         byte ptr [esi+8],2;TScanner.token:TToken
 0057D165    lea         eax,[esi+0C]
 0057D168    push        eax
 0057D169    mov         ecx,ebx
 0057D16B    sub         ecx,dword ptr [ebp-8]
 0057D16E    mov         edx,dword ptr [ebp-8]
 0057D171    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D174    call        @UStrCopy
 0057D179    inc         ebx
 0057D17A    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
>0057D17D    jmp         0057DA45
 0057D182    cmp         edi,ebx
>0057D184    jge         0057D1A4
 0057D186    mov         byte ptr [esi+8],6B;TScanner.token:TToken
 0057D18A    lea         eax,[esi+0C]
 0057D18D    push        eax
 0057D18E    lea         ecx,[ebx+1]
 0057D191    sub         ecx,dword ptr [ebp-8]
 0057D194    mov         edx,dword ptr [ebp-8]
 0057D197    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D19A    call        @UStrCopy
>0057D19F    jmp         0057DA41
 0057D1A4    inc         ebx
 0057D1A5    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
 0057D1A8    mov         byte ptr [esi+8],2;TScanner.token:TToken
 0057D1AC    lea         eax,[esi+0C]
 0057D1AF    call        @UStrClr
 0057D1B4    mov         eax,esi
 0057D1B6    call        TScanner.Next
>0057D1BB    jmp         0057DA45
 0057D1C0    lea         edx,[ebx+1]
 0057D1C3    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D1C6    call        00577450
 0057D1CB    cmp         ax,3D
>0057D1CF    jne         0057D1DB
 0057D1D1    inc         ebx
 0057D1D2    mov         byte ptr [esi+8],3C;TScanner.token:TToken
>0057D1D6    jmp         0057DA41
 0057D1DB    mov         byte ptr [esi+8],25;TScanner.token:TToken
>0057D1DF    jmp         0057DA41
 0057D1E4    mov         byte ptr [esi+8],25;TScanner.token:TToken
>0057D1E8    jmp         0057DA41
 0057D1ED    cmp         byte ptr [ebp-9],0
>0057D1F1    je          0057D270
>0057D1F3    jmp         0057D1F6
 0057D1F5    inc         ebx
 0057D1F6    cmp         edi,ebx
>0057D1F8    jl          0057D21A
 0057D1FA    mov         edx,ebx
 0057D1FC    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D1FF    call        00577450
 0057D204    cmp         ax,0D
>0057D208    je          0057D21A
 0057D20A    mov         edx,ebx
 0057D20C    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D20F    call        00577450
 0057D214    cmp         ax,0A
>0057D218    jne         0057D1F5
 0057D21A    cmp         byte ptr [esi+28],0;TScanner.ScanWhiteSpace:Boolean
>0057D21E    je          0057D240
 0057D220    mov         byte ptr [esi+8],2;TScanner.token:TToken
 0057D224    lea         eax,[esi+0C]
 0057D227    push        eax
 0057D228    mov         ecx,ebx
 0057D22A    sub         ecx,dword ptr [ebp-8]
 0057D22D    mov         edx,dword ptr [ebp-8]
 0057D230    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D233    call        @UStrCopy
 0057D238    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
>0057D23B    jmp         0057DA45
 0057D240    cmp         edi,ebx
>0057D242    jge         0057D255
 0057D244    mov         byte ptr [esi+8],6D;TScanner.token:TToken
 0057D248    lea         eax,[esi+0C]
 0057D24B    call        @UStrClr
>0057D250    jmp         0057DA41
 0057D255    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
 0057D258    mov         byte ptr [esi+8],2;TScanner.token:TToken
 0057D25C    lea         eax,[esi+0C]
 0057D25F    call        @UStrClr
 0057D264    mov         eax,esi
 0057D266    call        TScanner.Next
>0057D26B    jmp         0057DA45
 0057D270    mov         edx,ebx
 0057D272    dec         edx
 0057D273    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D276    call        00577450
 0057D27B    call        00577538
 0057D280    test        al,al
>0057D282    je          0057D2D0
 0057D284    lea         eax,[ebp-94]
 0057D28A    push        eax
 0057D28B    lea         edx,[ebx+1]
 0057D28E    mov         ecx,3
 0057D293    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D296    call        @UStrCopy
 0057D29B    mov         eax,dword ptr [ebp-94]
 0057D2A1    lea         edx,[ebp-90]
 0057D2A7    call        LowerCase
 0057D2AC    mov         eax,dword ptr [ebp-90]
 0057D2B2    mov         edx,57DB94;' of'
 0057D2B7    call        @UStrEqual
>0057D2BC    jne         0057D2C7
 0057D2BE    mov         byte ptr [esi+8],2E;TScanner.token:TToken
>0057D2C2    jmp         0057DA41
 0057D2C7    mov         byte ptr [esi+8],27;TScanner.token:TToken
>0057D2CB    jmp         0057DA41
 0057D2D0    mov         byte ptr [esi+8],2E;TScanner.token:TToken
>0057D2D4    jmp         0057DA41
 0057D2D9    mov         edx,ebx
 0057D2DB    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D2DE    call        00577860
 0057D2E3    test        al,al
>0057D2E5    je          0057D2F1
 0057D2E7    inc         ebx
 0057D2E8    mov         byte ptr [esi+8],3F;TScanner.token:TToken
>0057D2EC    jmp         0057DA41
 0057D2F1    cmp         edi,ebx
>0057D2F3    jle         0057D319
 0057D2F5    lea         edx,[ebx+1]
 0057D2F8    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D2FB    call        00577478
 0057D300    cmp         ax,3D
>0057D304    jne         0057D310
 0057D306    inc         ebx
 0057D307    mov         byte ptr [esi+8],4E;TScanner.token:TToken
>0057D30B    jmp         0057DA41
 0057D310    mov         byte ptr [esi+8],4B;TScanner.token:TToken
>0057D314    jmp         0057DA41
 0057D319    mov         byte ptr [esi+8],4B;TScanner.token:TToken
>0057D31D    jmp         0057DA41
 0057D322    cmp         edi,ebx
>0057D324    jle         0057D380
 0057D326    lea         edi,[ebx+1]
 0057D329    mov         edx,edi
 0057D32B    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D32E    call        00577478
 0057D333    cmp         ax,3C
>0057D337    jne         0057D343
 0057D339    inc         ebx
 0057D33A    mov         byte ptr [esi+8],28;TScanner.token:TToken
>0057D33E    jmp         0057DA41
 0057D343    mov         edx,edi
 0057D345    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D348    call        00577478
 0057D34D    cmp         ax,3D
>0057D351    jne         0057D35D
 0057D353    inc         ebx
 0057D354    mov         byte ptr [esi+8],50;TScanner.token:TToken
>0057D358    jmp         0057DA41
 0057D35D    mov         edx,edi
 0057D35F    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D362    call        00577478
 0057D367    cmp         ax,3E
>0057D36B    jne         0057D377
 0057D36D    inc         ebx
 0057D36E    mov         byte ptr [esi+8],4F;TScanner.token:TToken
>0057D372    jmp         0057DA41
 0057D377    mov         byte ptr [esi+8],4C;TScanner.token:TToken
>0057D37B    jmp         0057DA41
 0057D380    mov         byte ptr [esi+8],4C;TScanner.token:TToken
>0057D384    jmp         0057DA41
 0057D389    mov         byte ptr [esi+8],52;TScanner.token:TToken
>0057D38D    jmp         0057DA41
 0057D392    mov         byte ptr [esi+8],53;TScanner.token:TToken
>0057D396    jmp         0057DA41
 0057D39B    mov         byte ptr [esi+8],4F;TScanner.token:TToken
>0057D39F    jmp         0057DA41
 0057D3A4    mov         byte ptr [esi+8],50;TScanner.token:TToken
>0057D3A8    jmp         0057DA41
 0057D3AD    mov         byte ptr [esi+8],51;TScanner.token:TToken
>0057D3B1    jmp         0057DA41
 0057D3B6    mov         byte ptr [esi+8],4C;TScanner.token:TToken
>0057D3BA    jmp         0057DA41
 0057D3BF    mov         byte ptr [esi+8],4D;TScanner.token:TToken
>0057D3C3    jmp         0057DA41
 0057D3C8    mov         byte ptr [esi+8],4E;TScanner.token:TToken
>0057D3CC    jmp         0057DA41
 0057D3D1    mov         byte ptr [esi+8],48;TScanner.token:TToken
>0057D3D5    jmp         0057DA41
 0057D3DA    mov         byte ptr [esi+8],49;TScanner.token:TToken
>0057D3DE    jmp         0057DA41
 0057D3E3    mov         byte ptr [esi+8],1C;TScanner.token:TToken
>0057D3E7    jmp         0057DA41
 0057D3EC    mov         byte ptr [esi+8],38;TScanner.token:TToken
>0057D3F0    jmp         0057DA41
 0057D3F5    cmp         edi,ebx
>0057D3F7    jle         0057D453
 0057D3F9    lea         edi,[ebx+1]
 0057D3FC    mov         edx,edi
 0057D3FE    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D401    call        00577478
 0057D406    cmp         ax,3E
>0057D40A    jne         0057D416
 0057D40C    inc         ebx
 0057D40D    mov         byte ptr [esi+8],29;TScanner.token:TToken
>0057D411    jmp         0057DA41
 0057D416    mov         edx,edi
 0057D418    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D41B    call        00577478
 0057D420    cmp         ax,3D
>0057D424    jne         0057D430
 0057D426    inc         ebx
 0057D427    mov         byte ptr [esi+8],51;TScanner.token:TToken
>0057D42B    jmp         0057DA41
 0057D430    mov         edx,edi
 0057D432    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D435    call        00577478
 0057D43A    cmp         ax,3C
>0057D43E    jne         0057D44A
 0057D440    inc         ebx
 0057D441    mov         byte ptr [esi+8],4F;TScanner.token:TToken
>0057D445    jmp         0057DA41
 0057D44A    mov         byte ptr [esi+8],4D;TScanner.token:TToken
>0057D44E    jmp         0057DA41
 0057D453    mov         byte ptr [esi+8],4D;TScanner.token:TToken
>0057D457    jmp         0057DA41
 0057D45C    cmp         edi,ebx
>0057D45E    jle         0057D4B9
 0057D460    lea         edx,[ebx+1]
 0057D463    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D466    call        00577478
 0057D46B    cmp         ax,3D
>0057D46F    jne         0057D47B
 0057D471    inc         ebx
 0057D472    mov         byte ptr [esi+8],52;TScanner.token:TToken
>0057D476    jmp         0057DA41
 0057D47B    lea         edx,[ebx+1]
 0057D47E    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D481    call        00577478
 0057D486    cmp         ax,21
>0057D48A    jne         0057D4B0
 0057D48C    lea         eax,[ebx+2]
 0057D48F    cmp         edi,eax
>0057D491    jl          0057D4B0
 0057D493    lea         edx,[ebx+2]
 0057D496    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D499    call        00577478
 0057D49E    cmp         ax,3D
>0057D4A2    jne         0057D4B0
 0057D4A4    add         ebx,2
 0057D4A7    mov         byte ptr [esi+8],53;TScanner.token:TToken
>0057D4AB    jmp         0057DA41
 0057D4B0    mov         byte ptr [esi+8],58;TScanner.token:TToken
>0057D4B4    jmp         0057DA41
 0057D4B9    mov         byte ptr [esi+8],58;TScanner.token:TToken
>0057D4BD    jmp         0057DA41
 0057D4C2    cmp         edi,ebx
>0057D4C4    jle         0057D51F
 0057D4C6    lea         edx,[ebx+1]
 0057D4C9    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D4CC    call        00577478
 0057D4D1    cmp         ax,3D
>0057D4D5    jne         0057D4E1
 0057D4D7    inc         ebx
 0057D4D8    mov         byte ptr [esi+8],4F;TScanner.token:TToken
>0057D4DC    jmp         0057DA41
 0057D4E1    lea         edx,[ebx+1]
 0057D4E4    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D4E7    call        00577478
 0057D4EC    cmp         ax,7E
>0057D4F0    jne         0057D516
 0057D4F2    lea         eax,[ebx+2]
 0057D4F5    cmp         edi,eax
>0057D4F7    jl          0057D516
 0057D4F9    lea         edx,[ebx+2]
 0057D4FC    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D4FF    call        00577478
 0057D504    cmp         ax,3D
>0057D508    jne         0057D516
 0057D50A    add         ebx,2
 0057D50D    mov         byte ptr [esi+8],53;TScanner.token:TToken
>0057D511    jmp         0057DA41
 0057D516    mov         byte ptr [esi+8],43;TScanner.token:TToken
>0057D51A    jmp         0057DA41
 0057D51F    mov         byte ptr [esi+8],43;TScanner.token:TToken
>0057D523    jmp         0057DA41
 0057D528    cmp         edi,ebx
>0057D52A    jle         0057D5A0
 0057D52C    lea         edx,[ebx+1]
 0057D52F    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D532    call        00577478
 0057D537    cmp         ax,3D
>0057D53B    jne         0057D547
 0057D53D    inc         ebx
 0057D53E    mov         byte ptr [esi+8],4F;TScanner.token:TToken
>0057D542    jmp         0057DA41
 0057D547    lea         edx,[ebx+1]
 0057D54A    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D54D    call        00577478
 0057D552    cmp         ax,21
>0057D556    jne         0057D562
 0057D558    inc         ebx
 0057D559    mov         byte ptr [esi+8],30;TScanner.token:TToken
>0057D55D    jmp         0057DA41
 0057D562    lea         edx,[ebx+1]
 0057D565    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D568    call        00577478
 0057D56D    cmp         ax,7E
>0057D571    jne         0057D597
 0057D573    lea         eax,[ebx+2]
 0057D576    cmp         edi,eax
>0057D578    jl          0057D597
 0057D57A    lea         edx,[ebx+2]
 0057D57D    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D580    call        00577478
 0057D585    cmp         ax,3D
>0057D589    jne         0057D597
 0057D58B    add         ebx,2
 0057D58E    mov         byte ptr [esi+8],53;TScanner.token:TToken
>0057D592    jmp         0057DA41
 0057D597    mov         byte ptr [esi+8],2F;TScanner.token:TToken
>0057D59B    jmp         0057DA41
 0057D5A0    mov         byte ptr [esi+8],2F;TScanner.token:TToken
>0057D5A4    jmp         0057DA41
 0057D5A9    cmp         edi,ebx
>0057D5AB    jle         0057D5EC
 0057D5AD    lea         edx,[ebx+1]
 0057D5B0    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D5B3    call        00577478
 0057D5B8    cmp         ax,3A
>0057D5BC    jne         0057D5C8
 0057D5BE    inc         ebx
 0057D5BF    mov         byte ptr [esi+8],20;TScanner.token:TToken
>0057D5C3    jmp         0057DA41
 0057D5C8    lea         edx,[ebx+1]
 0057D5CB    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D5CE    call        00577478
 0057D5D3    cmp         ax,3D
>0057D5D7    jne         0057D5E3
 0057D5D9    inc         ebx
 0057D5DA    mov         byte ptr [esi+8],38;TScanner.token:TToken
>0057D5DE    jmp         0057DA41
 0057D5E3    mov         byte ptr [esi+8],18;TScanner.token:TToken
>0057D5E7    jmp         0057DA41
 0057D5EC    mov         byte ptr [esi+8],18;TScanner.token:TToken
>0057D5F0    jmp         0057DA41
 0057D5F5    mov         byte ptr [esi+8],10;TScanner.token:TToken
 0057D5F9    inc         dword ptr [esi+2C];TScanner.BracketLevel:Integer
>0057D5FC    jmp         0057DA41
 0057D601    mov         byte ptr [esi+8],11;TScanner.token:TToken
 0057D605    dec         dword ptr [esi+2C];TScanner.BracketLevel:Integer
>0057D608    jmp         0057DA41
 0057D60D    mov         byte ptr [esi+8],12;TScanner.token:TToken
 0057D611    inc         dword ptr [esi+2C];TScanner.BracketLevel:Integer
>0057D614    jmp         0057DA41
 0057D619    mov         byte ptr [esi+8],13;TScanner.token:TToken
 0057D61D    dec         dword ptr [esi+2C];TScanner.BracketLevel:Integer
>0057D620    jmp         0057DA41
 0057D625    mov         byte ptr [esi+8],14;TScanner.token:TToken
 0057D629    inc         dword ptr [esi+2C];TScanner.BracketLevel:Integer
>0057D62C    jmp         0057DA41
 0057D631    mov         byte ptr [esi+8],15;TScanner.token:TToken
 0057D635    cmp         dword ptr [esi+2C],0;TScanner.BracketLevel:Integer
>0057D639    jle         0057DA41
 0057D63F    dec         dword ptr [esi+2C];TScanner.BracketLevel:Integer
>0057D642    jmp         0057DA41
 0057D647    cmp         byte ptr [ebp-9],0
>0057D64B    jne         0057D656
 0057D64D    cmp         dword ptr [esi+2C],0;TScanner.BracketLevel:Integer
>0057D651    jne         0057D6D0
>0057D653    jmp         0057D656
 0057D655    inc         ebx
 0057D656    cmp         edi,ebx
>0057D658    jl          0057D67A
 0057D65A    mov         edx,ebx
 0057D65C    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D65F    call        00577450
 0057D664    cmp         ax,0D
>0057D668    je          0057D67A
 0057D66A    mov         edx,ebx
 0057D66C    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D66F    call        00577450
 0057D674    cmp         ax,0A
>0057D678    jne         0057D655
 0057D67A    cmp         byte ptr [esi+28],0;TScanner.ScanWhiteSpace:Boolean
>0057D67E    je          0057D6A0
 0057D680    mov         byte ptr [esi+8],2;TScanner.token:TToken
 0057D684    lea         eax,[esi+0C]
 0057D687    push        eax
 0057D688    mov         ecx,ebx
 0057D68A    sub         ecx,dword ptr [ebp-8]
 0057D68D    mov         edx,dword ptr [ebp-8]
 0057D690    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D693    call        @UStrCopy
 0057D698    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
>0057D69B    jmp         0057DA45
 0057D6A0    cmp         edi,ebx
>0057D6A2    jge         0057D6B5
 0057D6A4    mov         byte ptr [esi+8],6D;TScanner.token:TToken
 0057D6A8    lea         eax,[esi+0C]
 0057D6AB    call        @UStrClr
>0057D6B0    jmp         0057DA41
 0057D6B5    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
 0057D6B8    mov         byte ptr [esi+8],2;TScanner.token:TToken
 0057D6BC    lea         eax,[esi+0C]
 0057D6BF    call        @UStrClr
 0057D6C4    mov         eax,esi
 0057D6C6    call        TScanner.Next
>0057D6CB    jmp         0057DA45
 0057D6D0    mov         byte ptr [esi+8],17;TScanner.token:TToken
>0057D6D4    jmp         0057DA41
 0057D6D9    mov         byte ptr [esi+8],16;TScanner.token:TToken
>0057D6DD    jmp         0057DA41
 0057D6E2    mov         byte ptr [esi+8],1A;TScanner.token:TToken
>0057D6E6    jmp         0057DA41
 0057D6EB    mov         byte ptr [esi+8],19;TScanner.token:TToken
>0057D6EF    jmp         0057DA41
 0057D6F4    mov         byte ptr [esi+8],2C;TScanner.token:TToken
>0057D6F8    jmp         0057DA41
 0057D6FD    mov         byte ptr [esi+8],0F;TScanner.token:TToken
 0057D701    lea         eax,[esi+0C]
 0057D704    call        @UStrClr
>0057D709    jmp         0057D70C
 0057D70B    inc         ebx
 0057D70C    mov         edx,ebx
 0057D70E    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D711    call        00577450
 0057D716    cmp         ax,207A
>0057D71A    je          0057D70B
>0057D71C    jmp         0057D749
 0057D71E    mov         edx,ebx
 0057D720    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D723    call        00577450
 0057D728    call        00577B3C
 0057D72D    mov         edx,eax
 0057D72F    lea         eax,[ebp-98]
 0057D735    call        @UStrFromWChar
 0057D73A    mov         edx,dword ptr [ebp-98]
 0057D740    lea         eax,[esi+0C]
 0057D743    call        @UStrCat
 0057D748    inc         ebx
 0057D749    mov         edx,ebx
 0057D74B    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D74E    call        00577450
 0057D753    cmp         ax,0B2
>0057D757    je          0057D71E
 0057D759    mov         edx,ebx
 0057D75B    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D75E    call        00577450
 0057D763    cmp         ax,0B3
>0057D767    je          0057D71E
 0057D769    mov         edx,ebx
 0057D76B    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D76E    call        00577450
 0057D773    cmp         ax,0B9
>0057D777    je          0057D71E
 0057D779    mov         edx,ebx
 0057D77B    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D77E    call        00577450
 0057D783    cmp         ax,2070
>0057D787    jb          0057D799
 0057D789    mov         edx,ebx
 0057D78B    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D78E    call        00577450
 0057D793    cmp         ax,2079
>0057D797    jbe         0057D71E
 0057D799    push        0
 0057D79B    push        0
 0057D79D    mov         eax,dword ptr [esi+0C]
 0057D7A0    call        StrToInt64Def
 0057D7A5    mov         dword ptr [esi+10],eax
 0057D7A8    mov         dword ptr [esi+14],edx
 0057D7AB    fild        qword ptr [esi+10]
 0057D7AE    fstp        qword ptr [esi+18]
 0057D7B1    wait
 0057D7B2    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
>0057D7B5    jmp         0057D881
 0057D7BA    lea         eax,[esi+0C]
 0057D7BD    call        @UStrClr
 0057D7C2    inc         ebx
>0057D7C3    jmp         0057D7F0
 0057D7C5    mov         edx,ebx
 0057D7C7    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D7CA    call        00577450
 0057D7CF    call        00577B3C
 0057D7D4    mov         edx,eax
 0057D7D6    lea         eax,[ebp-9C]
 0057D7DC    call        @UStrFromWChar
 0057D7E1    mov         edx,dword ptr [ebp-9C]
 0057D7E7    lea         eax,[esi+0C]
 0057D7EA    call        @UStrCat
 0057D7EF    inc         ebx
 0057D7F0    mov         edx,ebx
 0057D7F2    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D7F5    call        00577450
 0057D7FA    cmp         ax,0B2
>0057D7FE    je          0057D7C5
 0057D800    mov         edx,ebx
 0057D802    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D805    call        00577450
 0057D80A    cmp         ax,0B3
>0057D80E    je          0057D7C5
 0057D810    mov         edx,ebx
 0057D812    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D815    call        00577450
 0057D81A    cmp         ax,0B9
>0057D81E    je          0057D7C5
 0057D820    mov         edx,ebx
 0057D822    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D825    call        00577450
 0057D82A    cmp         ax,2070
>0057D82E    jb          0057D840
 0057D830    mov         edx,ebx
 0057D832    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D835    call        00577450
 0057D83A    cmp         ax,2079
>0057D83E    jbe         0057D7C5
 0057D840    push        0
 0057D842    push        0
 0057D844    mov         eax,dword ptr [esi+0C]
 0057D847    call        StrToInt64Def
 0057D84C    add         eax,dword ptr [esi+10]
 0057D84F    adc         edx,dword ptr [esi+14]
 0057D852    mov         dword ptr [esi+10],eax
 0057D855    mov         dword ptr [esi+14],edx
 0057D858    fild        qword ptr [esi+10]
 0057D85B    fstp        qword ptr [esi+18]
 0057D85E    wait
 0057D85F    push        dword ptr [esi+14]
 0057D862    push        dword ptr [esi+10]
 0057D865    lea         eax,[ebp-0A0]
 0057D86B    call        IntToStr
 0057D870    mov         edx,dword ptr [ebp-0A0]
 0057D876    lea         eax,[esi+0C]
 0057D879    call        @UStrAsg
 0057D87E    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
 0057D881    mov         edx,ebx
 0057D883    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D886    call        00577450
 0057D88B    cmp         ax,207A
>0057D88F    jne         0057DA41
 0057D895    lea         edi,[ebx+1]
 0057D898    mov         edx,edi
 0057D89A    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D89D    call        00577450
 0057D8A2    cmp         ax,0B2
>0057D8A6    je          0057D7BA
 0057D8AC    mov         edx,edi
 0057D8AE    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D8B1    call        00577450
 0057D8B6    cmp         ax,0B3
>0057D8BA    je          0057D7BA
 0057D8C0    mov         edx,edi
 0057D8C2    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D8C5    call        00577450
 0057D8CA    cmp         ax,0B9
>0057D8CE    je          0057D7BA
 0057D8D4    lea         edx,[ebx+1]
 0057D8D7    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D8DA    call        00577450
 0057D8DF    cmp         ax,2070
>0057D8E3    jb          0057DA41
 0057D8E9    lea         edx,[ebx+1]
 0057D8EC    mov         eax,dword ptr [esi+4];TScanner.s:string
 0057D8EF    call        00577450
 0057D8F4    cmp         ax,2079
>0057D8F8    jbe         0057D7BA
>0057D8FE    jmp         0057DA41
 0057D903    mov         byte ptr [esi+8],2A;TScanner.token:TToken
>0057D907    jmp         0057DA41
 0057D90C    mov         edx,57DBA8;'degrees'
 0057D911    mov         eax,esi
 0057D913    call        0057DEA0
>0057D918    jmp         0057DA41
 0057D91D    mov         edx,57DBC4;'ounces'
 0057D922    mov         eax,esi
 0057D924    call        0057DEA0
>0057D929    jmp         0057DA41
 0057D92E    mov         edx,57DBE0;'micrograms'
 0057D933    mov         eax,esi
 0057D935    call        0057DEA0
>0057D93A    jmp         0057DA41
 0057D93F    mov         edx,57DC04;'mg'
 0057D944    mov         eax,esi
 0057D946    call        0057DEA0
>0057D94B    jmp         0057DA41
 0057D950    mov         edx,57DC18;'kg'
 0057D955    mov         eax,esi
 0057D957    call        0057DEA0
>0057D95C    jmp         0057DA41
 0057D961    mov         edx,57DC2C;'hz'
 0057D966    mov         eax,esi
 0057D968    call        0057DEA0
>0057D96D    jmp         0057DA41
 0057D972    mov         edx,57DC40;'khz'
 0057D977    mov         eax,esi
 0057D979    call        0057DEA0
>0057D97E    jmp         0057DA41
 0057D983    mov         edx,57DC54;'mhz'
 0057D988    mov         eax,esi
 0057D98A    call        0057DEA0
>0057D98F    jmp         0057DA41
 0057D994    mov         edx,57DC68;'ghz'
 0057D999    mov         eax,esi
 0057D99B    call        0057DEA0
>0057D9A0    jmp         0057DA41
 0057D9A5    mov         edx,57DC7C;'micrometres'
 0057D9AA    mov         eax,esi
 0057D9AC    call        0057DEA0
>0057D9B1    jmp         0057DA41
 0057D9B6    mov         edx,57DCA0;'mm'
 0057D9BB    mov         eax,esi
 0057D9BD    call        0057DEA0
>0057D9C2    jmp         0057DA41
 0057D9C4    mov         edx,57DCB4;'cm'
 0057D9C9    mov         eax,esi
 0057D9CB    call        0057DEA0
>0057D9D0    jmp         0057DA41
 0057D9D2    mov         edx,57DCC8;'km'
 0057D9D7    mov         eax,esi
 0057D9D9    call        0057DEA0
>0057D9DE    jmp         0057DA41
 0057D9E0    mov         edx,57DCC8;'km'
 0057D9E5    mov         eax,esi
 0057D9E7    call        0057DEA0
>0057D9EC    jmp         0057DA41
 0057D9EE    mov         edx,57DCDC;'mps'
 0057D9F3    mov         eax,esi
 0057D9F5    call        0057DEA0
>0057D9FA    jmp         0057DA41
 0057D9FC    mov         edx,57DCF0;'mpsps'
 0057DA01    mov         eax,esi
 0057DA03    call        0057DEA0
>0057DA08    jmp         0057DA41
 0057DA0A    mov         edx,57DD08;'radians'
 0057DA0F    mov         eax,esi
 0057DA11    call        0057DEA0
>0057DA16    jmp         0057DA41
 0057DA18    mov         edx,57DD24;'radps'
 0057DA1D    mov         eax,esi
 0057DA1F    call        0057DEA0
>0057DA24    jmp         0057DA41
 0057DA26    mov         edx,57DD3C;'radpss'
 0057DA2B    mov         eax,esi
 0057DA2D    call        0057DEA0
>0057DA32    jmp         0057DA41
 0057DA34    mov         eax,esi
 0057DA36    call        00579D54
>0057DA3B    jmp         0057DA41
 0057DA3D    mov         byte ptr [esi+8],6B;TScanner.token:TToken
 0057DA41    inc         ebx
 0057DA42    mov         dword ptr [esi+24],ebx;TScanner.Index:Integer
 0057DA45    xor         eax,eax
 0057DA47    pop         edx
 0057DA48    pop         ecx
 0057DA49    pop         ecx
 0057DA4A    mov         dword ptr fs:[eax],edx
 0057DA4D    push        57DA72
 0057DA52    lea         eax,[ebp-0A0]
 0057DA58    mov         edx,24
 0057DA5D    call        @UStrArrayClr
 0057DA62    lea         eax,[ebp-4]
 0057DA65    call        @UStrClr
 0057DA6A    ret
>0057DA6B    jmp         @HandleFinally
>0057DA70    jmp         0057DA52
 0057DA72    pop         edi
 0057DA73    pop         esi
 0057DA74    pop         ebx
 0057DA75    mov         esp,ebp
 0057DA77    pop         ebp
 0057DA78    ret
*}
end;

//0057DD4C
procedure TScanner.Reset;
begin
{*
 0057DD4C    push        ebx
 0057DD4D    mov         ebx,eax
 0057DD4F    mov         dword ptr [ebx+24],1;TScanner.Index:Integer
 0057DD56    mov         dword ptr [ebx+20],1;TScanner.LineNumber:Integer
 0057DD5D    xor         eax,eax
 0057DD5F    mov         dword ptr [ebx+2C],eax;TScanner.BracketLevel:Integer
 0057DD62    mov         byte ptr [ebx+8],0;TScanner.token:TToken
 0057DD66    lea         eax,[ebx+0C]
 0057DD69    call        @UStrClr
 0057DD6E    mov         eax,ebx
 0057DD70    call        TScanner.Next
 0057DD75    pop         ebx
 0057DD76    ret
*}
end;

//0057DD78
constructor TScanner.Create(TextOfFile:string);
begin
{*
 0057DD78    push        ebp
 0057DD79    mov         ebp,esp
 0057DD7B    push        ecx
 0057DD7C    push        ebx
 0057DD7D    push        esi
 0057DD7E    test        dl,dl
>0057DD80    je          0057DD8A
 0057DD82    add         esp,0FFFFFFF0
 0057DD85    call        @ClassCreate
 0057DD8A    mov         dword ptr [ebp-4],ecx
 0057DD8D    mov         ebx,edx
 0057DD8F    mov         esi,eax
 0057DD91    mov         eax,dword ptr [ebp-4]
 0057DD94    call        @UStrAddRef
 0057DD99    xor         eax,eax
 0057DD9B    push        ebp
 0057DD9C    push        57DDCF
 0057DDA1    push        dword ptr fs:[eax]
 0057DDA4    mov         dword ptr fs:[eax],esp
 0057DDA7    lea         eax,[esi+4];TScanner.s:string
 0057DDAA    mov         edx,dword ptr [ebp-4]
 0057DDAD    call        @UStrAsg
 0057DDB2    mov         eax,esi
 0057DDB4    call        TScanner.Reset
 0057DDB9    xor         eax,eax
 0057DDBB    pop         edx
 0057DDBC    pop         ecx
 0057DDBD    pop         ecx
 0057DDBE    mov         dword ptr fs:[eax],edx
 0057DDC1    push        57DDD6
 0057DDC6    lea         eax,[ebp-4]
 0057DDC9    call        @UStrClr
 0057DDCE    ret
>0057DDCF    jmp         @HandleFinally
>0057DDD4    jmp         0057DDC6
 0057DDD6    mov         eax,esi
 0057DDD8    test        bl,bl
>0057DDDA    je          0057DDEB
 0057DDDC    call        @AfterConstruction
 0057DDE1    pop         dword ptr fs:[0]
 0057DDE8    add         esp,0C
 0057DDEB    mov         eax,esi
 0057DDED    pop         esi
 0057DDEE    pop         ebx
 0057DDEF    pop         ecx
 0057DDF0    pop         ebp
 0057DDF1    ret
*}
end;

//0057DEA0
procedure sub_0057DEA0(?:TScanner; ?:UString);
begin
{*
 0057DEA0    push        ebp
 0057DEA1    mov         ebp,esp
 0057DEA3    push        ecx
 0057DEA4    push        ebx
 0057DEA5    mov         dword ptr [ebp-4],edx
 0057DEA8    mov         ebx,eax
 0057DEAA    mov         eax,dword ptr [ebp-4]
 0057DEAD    call        @UStrAddRef
 0057DEB2    xor         eax,eax
 0057DEB4    push        ebp
 0057DEB5    push        57DEE5
 0057DEBA    push        dword ptr fs:[eax]
 0057DEBD    mov         dword ptr fs:[eax],esp
 0057DEC0    mov         byte ptr [ebx+8],5;TScanner.token:TToken
 0057DEC4    lea         eax,[ebx+0C]
 0057DEC7    mov         edx,dword ptr [ebp-4]
 0057DECA    call        @UStrAsg
 0057DECF    xor         eax,eax
 0057DED1    pop         edx
 0057DED2    pop         ecx
 0057DED3    pop         ecx
 0057DED4    mov         dword ptr fs:[eax],edx
 0057DED7    push        57DEEC
 0057DEDC    lea         eax,[ebp-4]
 0057DEDF    call        @UStrClr
 0057DEE4    ret
>0057DEE5    jmp         @HandleFinally
>0057DEEA    jmp         0057DEDC
 0057DEEC    pop         ebx
 0057DEED    pop         ecx
 0057DEEE    pop         ebp
 0057DEEF    ret
*}
end;

//0057DEF0
function TScanner.EOF:Boolean;
begin
{*
 0057DEF0    cmp         byte ptr [eax+8],6D;TScanner.token:TToken
 0057DEF4    sete        al
 0057DEF7    ret
*}
end;

//0057DEF8
function TScanner.read(TokenKind:TTokenKind):Boolean;
begin
{*
 0057DEF8    push        ebx
 0057DEF9    cmp         dl,byte ptr [eax+8];TScanner.token:TToken
>0057DEFC    jne         0057DF07
 0057DEFE    mov         bl,1
 0057DF00    call        TScanner.Next
>0057DF05    jmp         0057DF09
 0057DF07    xor         ebx,ebx
 0057DF09    mov         eax,ebx
 0057DF0B    pop         ebx
 0057DF0C    ret
*}
end;

//0057DF10
procedure TScanner.expect(TokenKind:TTokenKind);
begin
{*
 0057DF10    push        ebp
 0057DF11    mov         ebp,esp
 0057DF13    push        0
 0057DF15    push        0
 0057DF17    push        0
 0057DF19    push        ebx
 0057DF1A    push        esi
 0057DF1B    mov         ebx,edx
 0057DF1D    mov         esi,eax
 0057DF1F    xor         eax,eax
 0057DF21    push        ebp
 0057DF22    push        57DF9C
 0057DF27    push        dword ptr fs:[eax]
 0057DF2A    mov         dword ptr fs:[eax],esp
 0057DF2D    cmp         bl,byte ptr [esi+8];TScanner.token:TToken
>0057DF30    jne         0057DF3B
 0057DF32    mov         eax,esi
 0057DF34    call        TScanner.Next
>0057DF39    jmp         0057DF81
 0057DF3B    lea         edx,[ebp-4]
 0057DF3E    lea         eax,[esi+8];TScanner.token:TToken
 0057DF41    call        0057F00C
 0057DF46    lea         edx,[ebp-0C]
 0057DF49    mov         eax,ebx
 0057DF4B    call        0057DFFC
 0057DF50    push        dword ptr [ebp-0C]
 0057DF53    push        57DFB8;' expected (instead of "'
 0057DF58    push        dword ptr [ebp-4]
 0057DF5B    push        57DFF4;'")'
 0057DF60    lea         eax,[ebp-8]
 0057DF63    mov         edx,4
 0057DF68    call        @UStrCatN
 0057DF6D    mov         ecx,dword ptr [ebp-8]
 0057DF70    mov         dl,1
 0057DF72    mov         eax,[00577004];ETokenExpected
 0057DF77    call        Exception.Create;ETokenExpected.Create
 0057DF7C    call        @RaiseExcept
 0057DF81    xor         eax,eax
 0057DF83    pop         edx
 0057DF84    pop         ecx
 0057DF85    pop         ecx
 0057DF86    mov         dword ptr fs:[eax],edx
 0057DF89    push        57DFA3
 0057DF8E    lea         eax,[ebp-0C]
 0057DF91    mov         edx,3
 0057DF96    call        @UStrArrayClr
 0057DF9B    ret
>0057DF9C    jmp         @HandleFinally
>0057DFA1    jmp         0057DF8E
 0057DFA3    pop         esi
 0057DFA4    pop         ebx
 0057DFA5    mov         esp,ebp
 0057DFA7    pop         ebp
 0057DFA8    ret
*}
end;

//0057DFFC
{*procedure sub_0057DFFC(?:TTokenKind; ?:?);
begin
 0057DFFC    push        ebx
 0057DFFD    push        esi
 0057DFFE    mov         esi,edx
 0057E000    mov         ebx,eax
 0057E002    mov         eax,esi
 0057E004    call        @UStrClr
 0057E009    movzx       eax,bl
 0057E00C    cmp         eax,6D
>0057E00F    ja          0057E7A1
 0057E015    jmp         dword ptr [eax*4+57E01C]
 0057E015    dd          0057E7A1
 0057E015    dd          0057E1D4
 0057E015    dd          0057E1E3
 0057E015    dd          0057E1F2
 0057E015    dd          0057E7A1
 0057E015    dd          0057E201
 0057E015    dd          0057E210
 0057E015    dd          0057E21F
 0057E015    dd          0057E22E
 0057E015    dd          0057E23D
 0057E015    dd          0057E24C
 0057E015    dd          0057E25B
 0057E015    dd          0057E26A
 0057E015    dd          0057E279
 0057E015    dd          0057E288
 0057E015    dd          0057E7A1
 0057E015    dd          0057E297
 0057E015    dd          0057E2A6
 0057E015    dd          0057E2B5
 0057E015    dd          0057E2C4
 0057E015    dd          0057E2D3
 0057E015    dd          0057E2E2
 0057E015    dd          0057E2F1
 0057E015    dd          0057E300
 0057E015    dd          0057E30F
 0057E015    dd          0057E31E
 0057E015    dd          0057E32D
 0057E015    dd          0057E33C
 0057E015    dd          0057E7A1
 0057E015    dd          0057E34B
 0057E015    dd          0057E35A
 0057E015    dd          0057E369
 0057E015    dd          0057E378
 0057E015    dd          0057E387
 0057E015    dd          0057E396
 0057E015    dd          0057E3A5
 0057E015    dd          0057E3B4
 0057E015    dd          0057E3C3
 0057E015    dd          0057E3D2
 0057E015    dd          0057E3E1
 0057E015    dd          0057E3F0
 0057E015    dd          0057E3FF
 0057E015    dd          0057E40E
 0057E015    dd          0057E41D
 0057E015    dd          0057E42C
 0057E015    dd          0057E43B
 0057E015    dd          0057E44A
 0057E015    dd          0057E459
 0057E015    dd          0057E468
 0057E015    dd          0057E477
 0057E015    dd          0057E486
 0057E015    dd          0057E495
 0057E015    dd          0057E4A4
 0057E015    dd          0057E4B3
 0057E015    dd          0057E4C2
 0057E015    dd          0057E4D1
 0057E015    dd          0057E4E0
 0057E015    dd          0057E4EF
 0057E015    dd          0057E4FE
 0057E015    dd          0057E50D
 0057E015    dd          0057E51C
 0057E015    dd          0057E52B
 0057E015    dd          0057E53A
 0057E015    dd          0057E549
 0057E015    dd          0057E558
 0057E015    dd          0057E567
 0057E015    dd          0057E585
 0057E015    dd          0057E594
 0057E015    dd          0057E576
 0057E015    dd          0057E7A1
 0057E015    dd          0057E7A1
 0057E015    dd          0057E7A1
 0057E015    dd          0057E5A3
 0057E015    dd          0057E5B2
 0057E015    dd          0057E5C1
 0057E015    dd          0057E5D0
 0057E015    dd          0057E5DF
 0057E015    dd          0057E5EE
 0057E015    dd          0057E5FD
 0057E015    dd          0057E60C
 0057E015    dd          0057E61B
 0057E015    dd          0057E62A
 0057E015    dd          0057E639
 0057E015    dd          0057E648
 0057E015    dd          0057E684
 0057E015    dd          0057E693
 0057E015    dd          0057E675
 0057E015    dd          0057E666
 0057E015    dd          0057E657
 0057E015    dd          0057E7A1
 0057E015    dd          0057E6A2
 0057E015    dd          0057E6B1
 0057E015    dd          0057E6C0
 0057E015    dd          0057E6CF
 0057E015    dd          0057E6DE
 0057E015    dd          0057E6ED
 0057E015    dd          0057E6FC
 0057E015    dd          0057E70B
 0057E015    dd          0057E71A
 0057E015    dd          0057E729
 0057E015    dd          0057E738
 0057E015    dd          0057E747
 0057E015    dd          0057E756
 0057E015    dd          0057E765
 0057E015    dd          0057E7A1
 0057E015    dd          0057E7A1
 0057E015    dd          0057E7A1
 0057E015    dd          0057E774
 0057E015    dd          0057E783
 0057E015    dd          0057E792
 0057E1D4    mov         eax,esi
 0057E1D6    mov         edx,57E7C0;'space'
 0057E1DB    call        @UStrAsg
 0057E1E0    pop         esi
 0057E1E1    pop         ebx
 0057E1E2    ret
 0057E1E3    mov         eax,esi
 0057E1E5    mov         edx,57E7D8;'comment'
 0057E1EA    call        @UStrAsg
 0057E1EF    pop         esi
 0057E1F0    pop         ebx
 0057E1F1    ret
 0057E1F2    mov         eax,esi
 0057E1F4    mov         edx,57E7F4;'identifier'
 0057E1F9    call        @UStrAsg
 0057E1FE    pop         esi
 0057E1FF    pop         ebx
 0057E200    ret
 0057E201    mov         eax,esi
 0057E203    mov         edx,57E818;'units'
 0057E208    call        @UStrAsg
 0057E20D    pop         esi
 0057E20E    pop         ebx
 0057E20F    ret
 0057E210    mov         eax,esi
 0057E212    mov         edx,57E830;'string'
 0057E217    call        @UStrAsg
 0057E21C    pop         esi
 0057E21D    pop         ebx
 0057E21E    ret
 0057E21F    mov         eax,esi
 0057E221    mov         edx,57E84C;'unterminated string'
 0057E226    call        @UStrAsg
 0057E22B    pop         esi
 0057E22C    pop         ebx
 0057E22D    ret
 0057E22E    mov         eax,esi
 0057E230    mov         edx,57E880;'integer'
 0057E235    call        @UStrAsg
 0057E23A    pop         esi
 0057E23B    pop         ebx
 0057E23C    ret
 0057E23D    mov         eax,esi
 0057E23F    mov         edx,57E89C;'real number'
 0057E244    call        @UStrAsg
 0057E249    pop         esi
 0057E24A    pop         ebx
 0057E24B    ret
 0057E24C    mov         eax,esi
 0057E24E    mov         edx,57E8C0;'hexadecimal number'
 0057E253    call        @UStrAsg
 0057E258    pop         esi
 0057E259    pop         ebx
 0057E25A    ret
 0057E25B    mov         eax,esi
 0057E25D    mov         edx,57E8F4;'true'
 0057E262    call        @UStrAsg
 0057E267    pop         esi
 0057E268    pop         ebx
 0057E269    ret
 0057E26A    mov         eax,esi
 0057E26C    mov         edx,57E90C;'false'
 0057E271    call        @UStrAsg
 0057E276    pop         esi
 0057E277    pop         ebx
 0057E278    ret
 0057E279    mov         eax,esi
 0057E27B    mov         edx,57E924;'Nil'
 0057E280    call        @UStrAsg
 0057E285    pop         esi
 0057E286    pop         ebx
 0057E287    ret
 0057E288    mov         eax,esi
 0057E28A    mov         edx,57E938;'NULL'
 0057E28F    call        @UStrAsg
 0057E294    pop         esi
 0057E295    pop         ebx
 0057E296    ret
 0057E297    mov         eax,esi
 0057E299    mov         edx,57E950;'('
 0057E29E    call        @UStrAsg
 0057E2A3    pop         esi
 0057E2A4    pop         ebx
 0057E2A5    ret
 0057E2A6    mov         eax,esi
 0057E2A8    mov         edx,57E960;')'
 0057E2AD    call        @UStrAsg
 0057E2B2    pop         esi
 0057E2B3    pop         ebx
 0057E2B4    ret
 0057E2B5    mov         eax,esi
 0057E2B7    mov         edx,57E970;'['
 0057E2BC    call        @UStrAsg
 0057E2C1    pop         esi
 0057E2C2    pop         ebx
 0057E2C3    ret
 0057E2C4    mov         eax,esi
 0057E2C6    mov         edx,57E980;']'
 0057E2CB    call        @UStrAsg
 0057E2D0    pop         esi
 0057E2D1    pop         ebx
 0057E2D2    ret
 0057E2D3    mov         eax,esi
 0057E2D5    mov         edx,57E990;'{'
 0057E2DA    call        @UStrAsg
 0057E2DF    pop         esi
 0057E2E0    pop         ebx
 0057E2E1    ret
 0057E2E2    mov         eax,esi
 0057E2E4    mov         edx,57E9A0;'}'
 0057E2E9    call        @UStrAsg
 0057E2EE    pop         esi
 0057E2EF    pop         ebx
 0057E2F0    ret
 0057E2F1    mov         eax,esi
 0057E2F3    mov         edx,57E9B0;','
 0057E2F8    call        @UStrAsg
 0057E2FD    pop         esi
 0057E2FE    pop         ebx
 0057E2FF    ret
 0057E300    mov         eax,esi
 0057E302    mov         edx,57E9C0;';'
 0057E307    call        @UStrAsg
 0057E30C    pop         esi
 0057E30D    pop         ebx
 0057E30E    ret
 0057E30F    mov         eax,esi
 0057E311    mov         edx,57E9D0;':'
 0057E316    call        @UStrAsg
 0057E31B    pop         esi
 0057E31C    pop         ebx
 0057E31D    ret
 0057E31E    mov         eax,esi
 0057E320    mov         edx,57E9E0;'?'
 0057E325    call        @UStrAsg
 0057E32A    pop         esi
 0057E32B    pop         ebx
 0057E32C    ret
 0057E32D    mov         eax,esi
 0057E32F    mov         edx,57E9F0;'...'
 0057E334    call        @UStrAsg
 0057E339    pop         esi
 0057E33A    pop         ebx
 0057E33B    ret
 0057E33C    mov         eax,esi
 0057E33E    mov         edx,57EA04;'..'
 0057E343    call        @UStrAsg
 0057E348    pop         esi
 0057E349    pop         ebx
 0057E34A    ret
 0057E34B    mov         eax,esi
 0057E34D    mov         edx,57EA18;'.'
 0057E352    call        @UStrAsg
 0057E357    pop         esi
 0057E358    pop         ebx
 0057E359    ret
 0057E35A    mov         eax,esi
 0057E35C    mov         edx,57EA28;'''s'
 0057E361    call        @UStrAsg
 0057E366    pop         esi
 0057E367    pop         ebx
 0057E368    ret
 0057E369    mov         eax,esi
 0057E36B    mov         edx,57EA3C;'of'
 0057E370    call        @UStrAsg
 0057E375    pop         esi
 0057E376    pop         ebx
 0057E377    ret
 0057E378    mov         eax,esi
 0057E37A    mov         edx,57EA50;'::'
 0057E37F    call        @UStrAsg
 0057E384    pop         esi
 0057E385    pop         ebx
 0057E386    ret
 0057E387    mov         eax,esi
 0057E389    mov         edx,57EA64;'->'
 0057E38E    call        @UStrAsg
 0057E393    pop         esi
 0057E394    pop         ebx
 0057E395    ret
 0057E396    mov         eax,esi
 0057E398    mov         edx,57EA78;'+'
 0057E39D    call        @UStrAsg
 0057E3A2    pop         esi
 0057E3A3    pop         ebx
 0057E3A4    ret
 0057E3A5    mov         eax,esi
 0057E3A7    mov         edx,57EA88;'-'
 0057E3AC    call        @UStrAsg
 0057E3B1    pop         esi
 0057E3B2    pop         ebx
 0057E3B3    ret
 0057E3B4    mov         eax,esi
 0057E3B6    mov         edx,57EA98;'*'
 0057E3BB    call        @UStrAsg
 0057E3C0    pop         esi
 0057E3C1    pop         ebx
 0057E3C2    ret
 0057E3C3    mov         eax,esi
 0057E3C5    mov         edx,57EAA8;'/'
 0057E3CA    call        @UStrAsg
 0057E3CF    pop         esi
 0057E3D0    pop         ebx
 0057E3D1    ret
 0057E3D2    mov         eax,esi
 0057E3D4    mov         edx,57EAB8;'div'
 0057E3D9    call        @UStrAsg
 0057E3DE    pop         esi
 0057E3DF    pop         ebx
 0057E3E0    ret
 0057E3E1    mov         eax,esi
 0057E3E3    mov         edx,57EACC;'mod'
 0057E3E8    call        @UStrAsg
 0057E3ED    pop         esi
 0057E3EE    pop         ebx
 0057E3EF    ret
 0057E3F0    mov         eax,esi
 0057E3F2    mov         edx,57EAE0;'shl'
 0057E3F7    call        @UStrAsg
 0057E3FC    pop         esi
 0057E3FD    pop         ebx
 0057E3FE    ret
 0057E3FF    mov         eax,esi
 0057E401    mov         edx,57EAF4;'shr'
 0057E406    call        @UStrAsg
 0057E40B    pop         esi
 0057E40C    pop         ebx
 0057E40D    ret
 0057E40E    mov         eax,esi
 0057E410    mov         edx,57EB08;'@'
 0057E415    call        @UStrAsg
 0057E41A    pop         esi
 0057E41B    pop         ebx
 0057E41C    ret
 0057E41D    mov         eax,esi
 0057E41F    mov         edx,57EB18;'&'
 0057E424    call        @UStrAsg
 0057E429    pop         esi
 0057E42A    pop         ebx
 0057E42B    ret
 0057E42C    mov         eax,esi
 0057E42E    mov         edx,57EB28;'^'
 0057E433    call        @UStrAsg
 0057E438    pop         esi
 0057E439    pop         ebx
 0057E43A    ret
 0057E43B    mov         eax,esi
 0057E43D    mov         edx,57EB38;'**'
 0057E442    call        @UStrAsg
 0057E447    pop         esi
 0057E448    pop         ebx
 0057E449    ret
 0057E44A    mov         eax,esi
 0057E44C    mov         edx,57EB4C;'%'
 0057E451    call        @UStrAsg
 0057E456    pop         esi
 0057E457    pop         ebx
 0057E458    ret
 0057E459    mov         eax,esi
 0057E45B    mov         edx,57EB5C;'!'
 0057E460    call        @UStrAsg
 0057E465    pop         esi
 0057E466    pop         ebx
 0057E467    ret
 0057E468    mov         eax,esi
 0057E46A    mov         edx,57EB6C;'!!'
 0057E46F    call        @UStrAsg
 0057E474    pop         esi
 0057E475    pop         ebx
 0057E476    ret
 0057E477    mov         eax,esi
 0057E479    mov         edx,57EB80;'.+'
 0057E47E    call        @UStrAsg
 0057E483    pop         esi
 0057E484    pop         ebx
 0057E485    ret
 0057E486    mov         eax,esi
 0057E488    mov         edx,57EB94;'.-'
 0057E48D    call        @UStrAsg
 0057E492    pop         esi
 0057E493    pop         ebx
 0057E494    ret
 0057E495    mov         eax,esi
 0057E497    mov         edx,57EBA8;'.*'
 0057E49C    call        @UStrAsg
 0057E4A1    pop         esi
 0057E4A2    pop         ebx
 0057E4A3    ret
 0057E4A4    mov         eax,esi
 0057E4A6    mov         edx,57EBBC;'./'
 0057E4AB    call        @UStrAsg
 0057E4B0    pop         esi
 0057E4B1    pop         ebx
 0057E4B2    ret
 0057E4B3    mov         eax,esi
 0057E4B5    mov         edx,57EBD0;'.^'
 0057E4BA    call        @UStrAsg
 0057E4BF    pop         esi
 0057E4C0    pop         ebx
 0057E4C1    ret
 0057E4C2    mov         eax,esi
 0057E4C4    mov         edx,57EBE4;''' (Matrix transpose)'
 0057E4C9    call        @UStrAsg
 0057E4CE    pop         esi
 0057E4CF    pop         ebx
 0057E4D0    ret
 0057E4D1    mov         eax,esi
 0057E4D3    mov         edx,57EC1C;'.='
 0057E4D8    call        @UStrAsg
 0057E4DD    pop         esi
 0057E4DE    pop         ebx
 0057E4DF    ret
 0057E4E0    mov         eax,esi
 0057E4E2    mov         edx,57EC30;':='
 0057E4E7    call        @UStrAsg
 0057E4EC    pop         esi
 0057E4ED    pop         ebx
 0057E4EE    ret
 0057E4EF    mov         eax,esi
 0057E4F1    mov         edx,57EC44;'+='
 0057E4F6    call        @UStrAsg
 0057E4FB    pop         esi
 0057E4FC    pop         ebx
 0057E4FD    ret
 0057E4FE    mov         eax,esi
 0057E500    mov         edx,57EC58;'-='
 0057E505    call        @UStrAsg
 0057E50A    pop         esi
 0057E50B    pop         ebx
 0057E50C    ret
 0057E50D    mov         eax,esi
 0057E50F    mov         edx,57EC6C;'*='
 0057E514    call        @UStrAsg
 0057E519    pop         esi
 0057E51A    pop         ebx
 0057E51B    ret
 0057E51C    mov         eax,esi
 0057E51E    mov         edx,57EC80;'/='
 0057E523    call        @UStrAsg
 0057E528    pop         esi
 0057E529    pop         ebx
 0057E52A    ret
 0057E52B    mov         eax,esi
 0057E52D    mov         edx,57EC94;'++'
 0057E532    call        @UStrAsg
 0057E537    pop         esi
 0057E538    pop         ebx
 0057E539    ret
 0057E53A    mov         eax,esi
 0057E53C    mov         edx,57ECA8;'--'
 0057E541    call        @UStrAsg
 0057E546    pop         esi
 0057E547    pop         ebx
 0057E548    ret
 0057E549    mov         eax,esi
 0057E54B    mov         edx,57ECBC;'=>'
 0057E550    call        @UStrAsg
 0057E555    pop         esi
 0057E556    pop         ebx
 0057E557    ret
 0057E558    mov         eax,esi
 0057E55A    mov         edx,57ECD0;'or'
 0057E55F    call        @UStrAsg
 0057E564    pop         esi
 0057E565    pop         ebx
 0057E566    ret
 0057E567    mov         eax,esi
 0057E569    mov         edx,57ECE4;'and'
 0057E56E    call        @UStrAsg
 0057E573    pop         esi
 0057E574    pop         ebx
 0057E575    ret
 0057E576    mov         eax,esi
 0057E578    mov         edx,57ECF8;'but'
 0057E57D    call        @UStrAsg
 0057E582    pop         esi
 0057E583    pop         ebx
 0057E584    ret
 0057E585    mov         eax,esi
 0057E587    mov         edx,57ED0C;'xor'
 0057E58C    call        @UStrAsg
 0057E591    pop         esi
 0057E592    pop         ebx
 0057E593    ret
 0057E594    mov         eax,esi
 0057E596    mov         edx,57ED20;'not'
 0057E59B    call        @UStrAsg
 0057E5A0    pop         esi
 0057E5A1    pop         ebx
 0057E5A2    ret
 0057E5A3    mov         eax,esi
 0057E5A5    mov         edx,57ED34;'&&'
 0057E5AA    call        @UStrAsg
 0057E5AF    pop         esi
 0057E5B0    pop         ebx
 0057E5B1    ret
 0057E5B2    mov         eax,esi
 0057E5B4    mov         edx,57ED48;'||'
 0057E5B9    call        @UStrAsg
 0057E5BE    pop         esi
 0057E5BF    pop         ebx
 0057E5C0    ret
 0057E5C1    mov         eax,esi
 0057E5C3    mov         edx,57ED5C;'|'
 0057E5C8    call        @UStrAsg
 0057E5CD    pop         esi
 0057E5CE    pop         ebx
 0057E5CF    ret
 0057E5D0    mov         eax,esi
 0057E5D2    mov         edx,57ED6C;'='
 0057E5D7    call        @UStrAsg
 0057E5DC    pop         esi
 0057E5DD    pop         ebx
 0057E5DE    ret
 0057E5DF    mov         eax,esi
 0057E5E1    mov         edx,57ED7C;'<'
 0057E5E6    call        @UStrAsg
 0057E5EB    pop         esi
 0057E5EC    pop         ebx
 0057E5ED    ret
 0057E5EE    mov         eax,esi
 0057E5F0    mov         edx,57ED8C;'>'
 0057E5F5    call        @UStrAsg
 0057E5FA    pop         esi
 0057E5FB    pop         ebx
 0057E5FC    ret
 0057E5FD    mov         eax,esi
 0057E5FF    mov         edx,57ED9C;'=='
 0057E604    call        @UStrAsg
 0057E609    pop         esi
 0057E60A    pop         ebx
 0057E60B    ret
 0057E60C    mov         eax,esi
 0057E60E    mov         edx,57EDB0;'!='
 0057E613    call        @UStrAsg
 0057E618    pop         esi
 0057E619    pop         ebx
 0057E61A    ret
 0057E61B    mov         eax,esi
 0057E61D    mov         edx,57EDC4;'<='
 0057E622    call        @UStrAsg
 0057E627    pop         esi
 0057E628    pop         ebx
 0057E629    ret
 0057E62A    mov         eax,esi
 0057E62C    mov         edx,57EDD8;'>='
 0057E631    call        @UStrAsg
 0057E636    pop         esi
 0057E637    pop         ebx
 0057E638    ret
 0057E639    mov         eax,esi
 0057E63B    mov         edx,57EDEC;'~='
 0057E640    call        @UStrAsg
 0057E645    pop         esi
 0057E646    pop         ebx
 0057E647    ret
 0057E648    mov         eax,esi
 0057E64A    mov         edx,57EE00;'!~='
 0057E64F    call        @UStrAsg
 0057E654    pop         esi
 0057E655    pop         ebx
 0057E656    ret
 0057E657    mov         eax,esi
 0057E659    mov         edx,57EE14;'~'
 0057E65E    call        @UStrAsg
 0057E663    pop         esi
 0057E664    pop         ebx
 0057E665    ret
 0057E666    mov         eax,esi
 0057E668    mov         edx,57EE24;'~>'
 0057E66D    call        @UStrAsg
 0057E672    pop         esi
 0057E673    pop         ebx
 0057E674    ret
 0057E675    mov         eax,esi
 0057E677    mov         edx,57EE38;'~>='
 0057E67C    call        @UStrAsg
 0057E681    pop         esi
 0057E682    pop         ebx
 0057E683    ret
 0057E684    mov         eax,esi
 0057E686    mov         edx,57EE4C;'~<'
 0057E68B    call        @UStrAsg
 0057E690    pop         esi
 0057E691    pop         ebx
 0057E692    ret
 0057E693    mov         eax,esi
 0057E695    mov         edx,57EE60;'~<='
 0057E69A    call        @UStrAsg
 0057E69F    pop         esi
 0057E6A0    pop         ebx
 0057E6A1    ret
 0057E6A2    mov         eax,esi
 0057E6A4    mov         edx,57EE74;'to'
 0057E6A9    call        @UStrAsg
 0057E6AE    pop         esi
 0057E6AF    pop         ebx
 0057E6B0    ret
 0057E6B1    mov         eax,esi
 0057E6B3    mov         edx,57EE88;'is'
 0057E6B8    call        @UStrAsg
 0057E6BD    pop         esi
 0057E6BE    pop         ebx
 0057E6BF    ret
 0057E6C0    mov         eax,esi
 0057E6C2    mov         edx,57EE9C;'isnt'
 0057E6C7    call        @UStrAsg
 0057E6CC    pop         esi
 0057E6CD    pop         ebx
 0057E6CE    ret
 0057E6CF    mov         eax,esi
 0057E6D1    mov         edx,57EEB4;'end'
 0057E6D6    call        @UStrAsg
 0057E6DB    pop         esi
 0057E6DC    pop         ebx
 0057E6DD    ret
 0057E6DE    mov         eax,esi
 0057E6E0    mov         edx,57EEC8;'in'
 0057E6E5    call        @UStrAsg
 0057E6EA    pop         esi
 0057E6EB    pop         ebx
 0057E6EC    ret
 0057E6ED    mov         eax,esi
 0057E6EF    mov         edx,57EEDC;'if'
 0057E6F4    call        @UStrAsg
 0057E6F9    pop         esi
 0057E6FA    pop         ebx
 0057E6FB    ret
 0057E6FC    mov         eax,esi
 0057E6FE    mov         edx,57EEF0;'then'
 0057E703    call        @UStrAsg
 0057E708    pop         esi
 0057E709    pop         ebx
 0057E70A    ret
 0057E70B    mov         eax,esi
 0057E70D    mov         edx,57EF08;'else'
 0057E712    call        @UStrAsg
 0057E717    pop         esi
 0057E718    pop         ebx
 0057E719    ret
 0057E71A    mov         eax,esi
 0057E71C    mov         edx,57EF20;'elseif'
 0057E721    call        @UStrAsg
 0057E726    pop         esi
 0057E727    pop         ebx
 0057E728    ret
 0057E729    mov         eax,esi
 0057E72B    mov         edx,57EF3C;'endif'
 0057E730    call        @UStrAsg
 0057E735    pop         esi
 0057E736    pop         ebx
 0057E737    ret
 0057E738    mov         eax,esi
 0057E73A    mov         edx,57EF54;'while'
 0057E73F    call        @UStrAsg
 0057E744    pop         esi
 0057E745    pop         ebx
 0057E746    ret
 0057E747    mov         eax,esi
 0057E749    mov         edx,57EF6C;'for'
 0057E74E    call        @UStrAsg
 0057E753    pop         esi
 0057E754    pop         ebx
 0057E755    ret
 0057E756    mov         eax,esi
 0057E758    mov         edx,57EF80;'repeat'
 0057E75D    call        @UStrAsg
 0057E762    pop         esi
 0057E763    pop         ebx
 0057E764    ret
 0057E765    mov         eax,esi
 0057E767    mov         edx,57EF9C;'until'
 0057E76C    call        @UStrAsg
 0057E771    pop         esi
 0057E772    pop         ebx
 0057E773    ret
 0057E774    mov         eax,esi
 0057E776    mov         edx,57EFB4;'ERROR!!'
 0057E77B    call        @UStrAsg
 0057E780    pop         esi
 0057E781    pop         ebx
 0057E782    ret
 0057E783    mov         eax,esi
 0057E785    mov         edx,57EFD0;'end of line'
 0057E78A    call        @UStrAsg
 0057E78F    pop         esi
 0057E790    pop         ebx
 0057E791    ret
 0057E792    mov         eax,esi
 0057E794    mov         edx,57EFF4;'end of file'
 0057E799    call        @UStrAsg
 0057E79E    pop         esi
 0057E79F    pop         ebx
 0057E7A0    ret
 0057E7A1    mov         ecx,esi
 0057E7A3    movzx       edx,bl
 0057E7A6    mov         eax,[00576A5C];TTokenKind
 0057E7AB    call        GetEnumName
 0057E7B0    pop         esi
 0057E7B1    pop         ebx
 0057E7B2    ret
end;*}

//0057F00C
{*procedure sub_0057F00C(?:?; ?:?);
begin
 0057F00C    push        ebp
 0057F00D    mov         ebp,esp
 0057F00F    add         esp,0FFFFFFE4
 0057F012    push        ebx
 0057F013    push        esi
 0057F014    push        edi
 0057F015    xor         ecx,ecx
 0057F017    mov         dword ptr [ebp-1C],ecx
 0057F01A    mov         esi,eax
 0057F01C    lea         edi,[ebp-18]
 0057F01F    mov         ecx,6
 0057F024    rep movs    dword ptr [edi],dword ptr [esi]
 0057F026    mov         ebx,edx
 0057F028    lea         eax,[ebp-18]
 0057F02B    mov         edx,dword ptr ds:[576E48];TToken
 0057F031    call        @AddRefRecord
 0057F036    xor         eax,eax
 0057F038    push        ebp
 0057F039    push        57F08E
 0057F03E    push        dword ptr fs:[eax]
 0057F041    mov         dword ptr fs:[eax],esp
 0057F044    mov         edx,ebx
 0057F046    movzx       eax,byte ptr [ebp-18]
 0057F04A    call        0057DFFC
 0057F04F    lea         edx,[ebp-1C]
 0057F052    mov         eax,dword ptr [ebp-14]
 0057F055    call        Trim
 0057F05A    cmp         dword ptr [ebp-1C],0
>0057F05E    je          0057F06A
 0057F060    mov         eax,ebx
 0057F062    mov         edx,dword ptr [ebp-14]
 0057F065    call        @UStrAsg
 0057F06A    xor         eax,eax
 0057F06C    pop         edx
 0057F06D    pop         ecx
 0057F06E    pop         ecx
 0057F06F    mov         dword ptr fs:[eax],edx
 0057F072    push        57F095
 0057F077    lea         eax,[ebp-1C]
 0057F07A    call        @UStrClr
 0057F07F    lea         eax,[ebp-18]
 0057F082    mov         edx,dword ptr ds:[576E48];TToken
 0057F088    call        @FinalizeRecord
 0057F08D    ret
>0057F08E    jmp         @HandleFinally
>0057F093    jmp         0057F077
 0057F095    pop         edi
 0057F096    pop         esi
 0057F097    pop         ebx
 0057F098    mov         esp,ebp
 0057F09A    pop         ebp
 0057F09B    ret
end;*}

//0057F09C
function TScanner.ReadIdentifier(id:string):Boolean;
begin
{*
 0057F09C    push        ebp
 0057F09D    mov         ebp,esp
 0057F09F    push        0
 0057F0A1    push        0
 0057F0A3    push        0
 0057F0A5    push        ebx
 0057F0A6    push        esi
 0057F0A7    mov         dword ptr [ebp-4],edx
 0057F0AA    mov         esi,eax
 0057F0AC    mov         eax,dword ptr [ebp-4]
 0057F0AF    call        @UStrAddRef
 0057F0B4    xor         eax,eax
 0057F0B6    push        ebp
 0057F0B7    push        57F115
 0057F0BC    push        dword ptr fs:[eax]
 0057F0BF    mov         dword ptr fs:[eax],esp
 0057F0C2    cmp         byte ptr [esi+8],3;TScanner.token:TToken
>0057F0C6    jne         0057F0F8
 0057F0C8    lea         edx,[ebp-8]
 0057F0CB    mov         eax,dword ptr [esi+0C]
 0057F0CE    call        UpperCase
 0057F0D3    mov         eax,dword ptr [ebp-8]
 0057F0D6    push        eax
 0057F0D7    lea         edx,[ebp-0C]
 0057F0DA    mov         eax,dword ptr [ebp-4]
 0057F0DD    call        UpperCase
 0057F0E2    mov         edx,dword ptr [ebp-0C]
 0057F0E5    pop         eax
 0057F0E6    call        @UStrEqual
>0057F0EB    jne         0057F0F8
 0057F0ED    mov         bl,1
 0057F0EF    mov         eax,esi
 0057F0F1    call        TScanner.Next
>0057F0F6    jmp         0057F0FA
 0057F0F8    xor         ebx,ebx
 0057F0FA    xor         eax,eax
 0057F0FC    pop         edx
 0057F0FD    pop         ecx
 0057F0FE    pop         ecx
 0057F0FF    mov         dword ptr fs:[eax],edx
 0057F102    push        57F11C
 0057F107    lea         eax,[ebp-0C]
 0057F10A    mov         edx,3
 0057F10F    call        @UStrArrayClr
 0057F114    ret
>0057F115    jmp         @HandleFinally
>0057F11A    jmp         0057F107
 0057F11C    mov         eax,ebx
 0057F11E    pop         esi
 0057F11F    pop         ebx
 0057F120    mov         esp,ebp
 0057F122    pop         ebp
 0057F123    ret
*}
end;

//0057F124
procedure TScanner.ExpectIdentifier(id:string);
begin
{*
 0057F124    push        ebp
 0057F125    mov         ebp,esp
 0057F127    xor         ecx,ecx
 0057F129    push        ecx
 0057F12A    push        ecx
 0057F12B    push        ecx
 0057F12C    push        ecx
 0057F12D    push        ecx
 0057F12E    push        ebx
 0057F12F    mov         dword ptr [ebp-4],edx
 0057F132    mov         ebx,eax
 0057F134    mov         eax,dword ptr [ebp-4]
 0057F137    call        @UStrAddRef
 0057F13C    xor         eax,eax
 0057F13E    push        ebp
 0057F13F    push        57F1F9
 0057F144    push        dword ptr fs:[eax]
 0057F147    mov         dword ptr fs:[eax],esp
 0057F14A    cmp         byte ptr [ebx+8],3;TScanner.token:TToken
>0057F14E    jne         0057F17E
 0057F150    lea         edx,[ebp-0C]
 0057F153    mov         eax,dword ptr [ebx+0C]
 0057F156    call        UpperCase
 0057F15B    mov         eax,dword ptr [ebp-0C]
 0057F15E    push        eax
 0057F15F    lea         edx,[ebp-10]
 0057F162    mov         eax,dword ptr [ebp-4]
 0057F165    call        UpperCase
 0057F16A    mov         edx,dword ptr [ebp-10]
 0057F16D    pop         eax
 0057F16E    call        @UStrEqual
>0057F173    jne         0057F17E
 0057F175    mov         eax,ebx
 0057F177    call        TScanner.Next
>0057F17C    jmp         0057F1DE
 0057F17E    lea         edx,[ebp-8]
 0057F181    movzx       eax,byte ptr [ebx+8];TScanner.token:TToken
 0057F185    call        0057DFFC
 0057F18A    cmp         byte ptr [ebx+8],3;TScanner.token:TToken
>0057F18E    jne         0057F1AD
 0057F190    push        dword ptr [ebp-8]
 0057F193    push        57F214;': "'
 0057F198    push        dword ptr [ebx+0C]
 0057F19B    push        57F228;'"'
 0057F1A0    lea         eax,[ebp-8]
 0057F1A3    mov         edx,4
 0057F1A8    call        @UStrCatN
 0057F1AD    push        dword ptr [ebp-4]
 0057F1B0    push        57F238;' expected (instead of '
 0057F1B5    push        dword ptr [ebp-8]
 0057F1B8    push        57F274;')'
 0057F1BD    lea         eax,[ebp-14]
 0057F1C0    mov         edx,4
 0057F1C5    call        @UStrCatN
 0057F1CA    mov         ecx,dword ptr [ebp-14]
 0057F1CD    mov         dl,1
 0057F1CF    mov         eax,[00577004];ETokenExpected
 0057F1D4    call        Exception.Create;ETokenExpected.Create
 0057F1D9    call        @RaiseExcept
 0057F1DE    xor         eax,eax
 0057F1E0    pop         edx
 0057F1E1    pop         ecx
 0057F1E2    pop         ecx
 0057F1E3    mov         dword ptr fs:[eax],edx
 0057F1E6    push        57F200
 0057F1EB    lea         eax,[ebp-14]
 0057F1EE    mov         edx,5
 0057F1F3    call        @UStrArrayClr
 0057F1F8    ret
>0057F1F9    jmp         @HandleFinally
>0057F1FE    jmp         0057F1EB
 0057F200    pop         ebx
 0057F201    mov         esp,ebp
 0057F203    pop         ebp
 0057F204    ret
*}
end;

//0057FBC8
constructor TmwCarlSampleSyn.Create(AOwner:TComponent);
begin
{*
 0057FBC8    push        ebp
 0057FBC9    mov         ebp,esp
 0057FBCB    push        ecx
 0057FBCC    push        ebx
 0057FBCD    push        esi
 0057FBCE    test        dl,dl
>0057FBD0    je          0057FBDA
 0057FBD2    add         esp,0FFFFFFF0
 0057FBD5    call        @ClassCreate
 0057FBDA    mov         byte ptr [ebp-1],dl
 0057FBDD    mov         ebx,eax
 0057FBDF    xor         edx,edx
 0057FBE1    mov         eax,ebx
 0057FBE3    call        TmwCustomHighLighter.Create
 0057FBE8    mov         ecx,57FEB0;'Comment'
 0057FBED    mov         dl,1
 0057FBEF    mov         eax,[0051258C];TmwHighLightAttributes
 0057FBF4    call        TmwHighLightAttributes.Create;TmwHighLightAttributes.Create
 0057FBF9    mov         esi,eax
 0057FBFB    mov         dword ptr [ebx+5C],esi;TmwCarlSampleSyn.fCommentAttri:TmwHighLightAttributes
 0057FBFE    mov         eax,esi
 0057FC00    movzx       edx,byte ptr ds:[57FEC0];0x2 gvar_0057FEC0
 0057FC07    call        TmwHighLightAttributes.SetStyle
 0057FC0C    mov         eax,dword ptr [ebx+5C];TmwCarlSampleSyn.fCommentAttri:TmwHighLightAttributes
 0057FC0F    mov         edx,0F497AE
 0057FC14    call        TmwHighLightAttributes.SetForeground
 0057FC19    mov         edx,dword ptr [ebx+5C];TmwCarlSampleSyn.fCommentAttri:TmwHighLightAttributes
 0057FC1C    mov         eax,ebx
 0057FC1E    call        005149F0
 0057FC23    mov         ecx,57FED0;'Identifier'
 0057FC28    mov         dl,1
 0057FC2A    mov         eax,[0051258C];TmwHighLightAttributes
 0057FC2F    call        TmwHighLightAttributes.Create;TmwHighLightAttributes.Create
 0057FC34    mov         esi,eax
 0057FC36    mov         dword ptr [ebx+60],esi;TmwCarlSampleSyn.fIdentifierAttri:TmwHighLightAttributes
 0057FC39    mov         edx,esi
 0057FC3B    mov         eax,ebx
 0057FC3D    call        005149F0
 0057FC42    mov         ecx,57FEF4;'Keyword'
 0057FC47    mov         dl,1
 0057FC49    mov         eax,[0051258C];TmwHighLightAttributes
 0057FC4E    call        TmwHighLightAttributes.Create;TmwHighLightAttributes.Create
 0057FC53    mov         esi,eax
 0057FC55    mov         dword ptr [ebx+64],esi;TmwCarlSampleSyn.fKeyAttri:TmwHighLightAttributes
 0057FC58    mov         eax,esi
 0057FC5A    movzx       edx,byte ptr ds:[57FF04];0x1 gvar_0057FF04
 0057FC61    call        TmwHighLightAttributes.SetStyle
 0057FC66    mov         edx,dword ptr [ebx+64];TmwCarlSampleSyn.fKeyAttri:TmwHighLightAttributes
 0057FC69    mov         eax,ebx
 0057FC6B    call        005149F0
 0057FC70    mov         ecx,57FF14;'WhiteSpace'
 0057FC75    mov         dl,1
 0057FC77    mov         eax,[0051258C];TmwHighLightAttributes
 0057FC7C    call        TmwHighLightAttributes.Create;TmwHighLightAttributes.Create
 0057FC81    mov         esi,eax
 0057FC83    mov         dword ptr [ebx+68],esi;TmwCarlSampleSyn.fSpaceAttri:TmwHighLightAttributes
 0057FC86    mov         edx,esi
 0057FC88    mov         eax,ebx
 0057FC8A    call        005149F0
 0057FC8F    mov         ecx,57FF38;'String'
 0057FC94    mov         dl,1
 0057FC96    mov         eax,[0051258C];TmwHighLightAttributes
 0057FC9B    call        TmwHighLightAttributes.Create;TmwHighLightAttributes.Create
 0057FCA0    mov         esi,eax
 0057FCA2    mov         dword ptr [ebx+6C],esi;TmwCarlSampleSyn.fStringAttri:TmwHighLightAttributes
 0057FCA5    mov         eax,esi
 0057FCA7    mov         edx,0FF0000
 0057FCAC    call        TmwHighLightAttributes.SetForeground
 0057FCB1    mov         edx,dword ptr [ebx+6C];TmwCarlSampleSyn.fStringAttri:TmwHighLightAttributes
 0057FCB4    mov         eax,ebx
 0057FCB6    call        005149F0
 0057FCBB    mov         ecx,57FF54;'Constant'
 0057FCC0    mov         dl,1
 0057FCC2    mov         eax,[0051258C];TmwHighLightAttributes
 0057FCC7    call        TmwHighLightAttributes.Create;TmwHighLightAttributes.Create
 0057FCCC    mov         esi,eax
 0057FCCE    mov         dword ptr [ebx+70],esi;TmwCarlSampleSyn.fConstantAttri:TmwHighLightAttributes
 0057FCD1    mov         eax,esi
 0057FCD3    mov         edx,8000
 0057FCD8    call        TmwHighLightAttributes.SetForeground
 0057FCDD    mov         edx,dword ptr [ebx+70];TmwCarlSampleSyn.fConstantAttri:TmwHighLightAttributes
 0057FCE0    mov         eax,ebx
 0057FCE2    call        005149F0
 0057FCE7    mov         ecx,57FF74;'Opperator'
 0057FCEC    mov         dl,1
 0057FCEE    mov         eax,[0051258C];TmwHighLightAttributes
 0057FCF3    call        TmwHighLightAttributes.Create;TmwHighLightAttributes.Create
 0057FCF8    mov         esi,eax
 0057FCFA    mov         dword ptr [ebx+74],esi;TmwCarlSampleSyn.fOpperatorAttri:TmwHighLightAttributes
 0057FCFD    mov         eax,esi
 0057FCFF    mov         edx,0F01985
 0057FD04    call        TmwHighLightAttributes.SetForeground
 0057FD09    mov         edx,dword ptr [ebx+74];TmwCarlSampleSyn.fOpperatorAttri:TmwHighLightAttributes
 0057FD0C    mov         eax,ebx
 0057FD0E    call        005149F0
 0057FD13    mov         ecx,57FF94;'Scope'
 0057FD18    mov         dl,1
 0057FD1A    mov         eax,[0051258C];TmwHighLightAttributes
 0057FD1F    call        TmwHighLightAttributes.Create;TmwHighLightAttributes.Create
 0057FD24    mov         esi,eax
 0057FD26    mov         dword ptr [ebx+78],esi;TmwCarlSampleSyn.fScopeAttri:TmwHighLightAttributes
 0057FD29    mov         eax,esi
 0057FD2B    mov         edx,80A0
 0057FD30    call        TmwHighLightAttributes.SetForeground
 0057FD35    mov         edx,dword ptr [ebx+78];TmwCarlSampleSyn.fScopeAttri:TmwHighLightAttributes
 0057FD38    mov         eax,ebx
 0057FD3A    call        005149F0
 0057FD3F    mov         ecx,57FFAC;'Symbol0'
 0057FD44    mov         dl,1
 0057FD46    mov         eax,[0051258C];TmwHighLightAttributes
 0057FD4B    call        TmwHighLightAttributes.Create;TmwHighLightAttributes.Create
 0057FD50    mov         esi,eax
 0057FD52    mov         dword ptr [ebx+7C],esi;TmwCarlSampleSyn.fSymbol0Attri:TmwHighLightAttributes
 0057FD55    mov         eax,esi
 0057FD57    mov         edx,0AC921F
 0057FD5C    call        TmwHighLightAttributes.SetForeground
 0057FD61    mov         eax,dword ptr [ebx+7C];TmwCarlSampleSyn.fSymbol0Attri:TmwHighLightAttributes
 0057FD64    movzx       edx,byte ptr ds:[57FF04];0x1 gvar_0057FF04
 0057FD6B    call        TmwHighLightAttributes.SetStyle
 0057FD70    mov         edx,dword ptr [ebx+7C];TmwCarlSampleSyn.fSymbol0Attri:TmwHighLightAttributes
 0057FD73    mov         eax,ebx
 0057FD75    call        005149F0
 0057FD7A    mov         ecx,57FFC8;'Symbol1'
 0057FD7F    mov         dl,1
 0057FD81    mov         eax,[0051258C];TmwHighLightAttributes
 0057FD86    call        TmwHighLightAttributes.Create;TmwHighLightAttributes.Create
 0057FD8B    mov         esi,eax
 0057FD8D    mov         dword ptr [ebx+80],esi;TmwCarlSampleSyn.fSymbol1Attri:TmwHighLightAttributes
 0057FD93    mov         eax,esi
 0057FD95    mov         edx,0F2B81E
 0057FD9A    call        TmwHighLightAttributes.SetForeground
 0057FD9F    mov         edx,dword ptr [ebx+80];TmwCarlSampleSyn.fSymbol1Attri:TmwHighLightAttributes
 0057FDA5    mov         eax,ebx
 0057FDA7    call        005149F0
 0057FDAC    mov         ecx,57FFE4;'Line Continuation'
 0057FDB1    mov         dl,1
 0057FDB3    mov         eax,[0051258C];TmwHighLightAttributes
 0057FDB8    call        TmwHighLightAttributes.Create;TmwHighLightAttributes.Create
 0057FDBD    mov         esi,eax
 0057FDBF    mov         dword ptr [ebx+84],esi;TmwCarlSampleSyn.fContinueAttri:TmwHighLightAttributes
 0057FDC5    mov         eax,esi
 0057FDC7    mov         edx,80F0
 0057FDCC    call        TmwHighLightAttributes.SetForeground
 0057FDD1    mov         edx,dword ptr [ebx+84];TmwCarlSampleSyn.fContinueAttri:TmwHighLightAttributes
 0057FDD7    mov         eax,ebx
 0057FDD9    call        005149F0
 0057FDDE    mov         ecx,580014;'Error'
 0057FDE3    mov         dl,1
 0057FDE5    mov         eax,[0051258C];TmwHighLightAttributes
 0057FDEA    call        TmwHighLightAttributes.Create;TmwHighLightAttributes.Create
 0057FDEF    mov         esi,eax
 0057FDF1    mov         dword ptr [ebx+8C],esi;TmwCarlSampleSyn.fErrorAttri:TmwHighLightAttributes
 0057FDF7    mov         eax,esi
 0057FDF9    mov         edx,0FF
 0057FDFE    call        TmwHighLightAttributes.SetForeground
 0057FE03    mov         eax,dword ptr [ebx+8C];TmwCarlSampleSyn.fErrorAttri:TmwHighLightAttributes
 0057FE09    movzx       edx,byte ptr ds:[580020];0x5 gvar_00580020
 0057FE10    call        TmwHighLightAttributes.SetStyle
 0057FE15    mov         ecx,580030;'Units'
 0057FE1A    mov         dl,1
 0057FE1C    mov         eax,[0051258C];TmwHighLightAttributes
 0057FE21    call        TmwHighLightAttributes.Create;TmwHighLightAttributes.Create
 0057FE26    mov         esi,eax
 0057FE28    mov         dword ptr [ebx+88],esi;TmwCarlSampleSyn.fUnitsAttri:TmwHighLightAttributes
 0057FE2E    mov         eax,esi
 0057FE30    mov         edx,80FF
 0057FE35    call        TmwHighLightAttributes.SetForeground
 0057FE3A    mov         edx,dword ptr [ebx+88];TmwCarlSampleSyn.fUnitsAttri:TmwHighLightAttributes
 0057FE40    mov         eax,ebx
 0057FE42    call        005149F0
 0057FE47    push        ebx
 0057FE48    push        514A04
 0057FE4D    mov         eax,ebx
 0057FE4F    call        00514A48
 0057FE54    lea         eax,[ebx+4C];TmwCarlSampleSyn.fDefaultFilter:string
 0057FE57    mov         edx,580048;'All files (*.*)|*.*'
 0057FE5C    call        @UStrAsg
 0057FE61    mov         byte ptr [ebx+51],0;TmwCarlSampleSyn.fRange:TRangeState
 0057FE65    xor         ecx,ecx
 0057FE67    mov         dl,1
 0057FE69    mov         eax,[005770A4];TScanner
 0057FE6E    call        TScanner.Create;TScanner.Create
 0057FE73    mov         esi,eax
 0057FE75    mov         dword ptr [ebx+90],esi;TmwCarlSampleSyn.s:TScanner
 0057FE7B    mov         byte ptr [esi+28],1;TScanner.ScanWhiteSpace:Boolean
 0057FE7F    mov         byte ptr [ebx+50],0;TmwCarlSampleSyn.fLanguage:Pointer
 0057FE83    mov         eax,ebx
 0057FE85    cmp         byte ptr [ebp-1],0
>0057FE89    je          0057FE9A
 0057FE8B    call        @AfterConstruction
 0057FE90    pop         dword ptr fs:[0]
 0057FE97    add         esp,0C
 0057FE9A    mov         eax,ebx
 0057FE9C    pop         esi
 0057FE9D    pop         ebx
 0057FE9E    pop         ecx
 0057FE9F    pop         ebp
 0057FEA0    ret
*}
end;

//00580070
procedure TmwCarlSampleSyn.SetLine(NewValue:string; LineNumber:Integer);
begin
{*
 00580070    push        ebp
 00580071    mov         ebp,esp
 00580073    push        ecx
 00580074    push        ebx
 00580075    push        esi
 00580076    push        edi
 00580077    mov         edi,ecx
 00580079    mov         dword ptr [ebp-4],edx
 0058007C    mov         ebx,eax
 0058007E    mov         eax,dword ptr [ebp-4]
 00580081    call        @UStrAddRef
 00580086    xor         eax,eax
 00580088    push        ebp
 00580089    push        580103
 0058008E    push        dword ptr fs:[eax]
 00580091    mov         dword ptr fs:[eax],esp
 00580094    cmp         byte ptr [ebx+51],1;TmwCarlSampleSyn.fRange:TRangeState
 00580098    sete        al
 0058009B    mov         esi,dword ptr [ebx+90];TmwCarlSampleSyn.s:TScanner
 005800A1    mov         byte ptr [esi+2A],al;TScanner.InComment:Boolean
 005800A4    lea         eax,[esi+4];TScanner.s:string
 005800A7    mov         edx,dword ptr [ebp-4]
 005800AA    call        @UStrAsg
 005800AF    mov         eax,dword ptr [ebx+90];TmwCarlSampleSyn.s:TScanner
 005800B5    call        TScanner.Reset
 005800BA    mov         eax,dword ptr [ebx+90];TmwCarlSampleSyn.s:TScanner
 005800C0    mov         dword ptr [eax+20],edi;TScanner.LineNumber:Integer
 005800C3    mov         dword ptr [ebx+54],1;TmwCarlSampleSyn.fTokenPos:Integer
 005800CA    mov         eax,dword ptr [ebx+90];TmwCarlSampleSyn.s:TScanner
 005800D0    movzx       eax,byte ptr [eax+8];TScanner.token:TToken
 005800D4    mov         byte ptr [ebx+58],al;TmwCarlSampleSyn.FTokenID:TTokenKind
 005800D7    mov         eax,dword ptr [ebx+90];TmwCarlSampleSyn.s:TScanner
 005800DD    cmp         byte ptr [eax+2A],0;TScanner.InComment:Boolean
>005800E1    je          005800E9
 005800E3    mov         byte ptr [ebx+51],1;TmwCarlSampleSyn.fRange:TRangeState
>005800E7    jmp         005800ED
 005800E9    mov         byte ptr [ebx+51],0;TmwCarlSampleSyn.fRange:TRangeState
 005800ED    xor         eax,eax
 005800EF    pop         edx
 005800F0    pop         ecx
 005800F1    pop         ecx
 005800F2    mov         dword ptr fs:[eax],edx
 005800F5    push        58010A
 005800FA    lea         eax,[ebp-4]
 005800FD    call        @UStrClr
 00580102    ret
>00580103    jmp         @HandleFinally
>00580108    jmp         005800FA
 0058010A    pop         edi
 0058010B    pop         esi
 0058010C    pop         ebx
 0058010D    pop         ecx
 0058010E    pop         ebp
 0058010F    ret
*}
end;

//00580110
procedure TmwCarlSampleSyn.Next;
begin
{*
 00580110    push        ebx
 00580111    mov         ebx,eax
 00580113    movzx       eax,byte ptr [ebx+50];TmwCarlSampleSyn.fLanguage:Pointer
 00580117    test        al,al
>00580119    jne         00580161
 0058011B    cmp         byte ptr [ebx+51],1;TmwCarlSampleSyn.fRange:TRangeState
 0058011F    sete        dl
 00580122    mov         eax,dword ptr [ebx+90];TmwCarlSampleSyn.s:TScanner
 00580128    mov         byte ptr [eax+2A],dl;TScanner.InComment:Boolean
 0058012B    mov         eax,dword ptr [eax+24];TScanner.Index:Integer
 0058012E    mov         dword ptr [ebx+54],eax;TmwCarlSampleSyn.fTokenPos:Integer
 00580131    mov         eax,dword ptr [ebx+90];TmwCarlSampleSyn.s:TScanner
 00580137    call        TScanner.Next
 0058013C    mov         eax,dword ptr [ebx+90];TmwCarlSampleSyn.s:TScanner
 00580142    movzx       eax,byte ptr [eax+8];TScanner.token:TToken
 00580146    mov         byte ptr [ebx+58],al;TmwCarlSampleSyn.FTokenID:TTokenKind
 00580149    mov         eax,dword ptr [ebx+90];TmwCarlSampleSyn.s:TScanner
 0058014F    cmp         byte ptr [eax+2A],0;TScanner.InComment:Boolean
>00580153    je          0058015B
 00580155    mov         byte ptr [ebx+51],1;TmwCarlSampleSyn.fRange:TRangeState
>00580159    jmp         00580163
 0058015B    mov         byte ptr [ebx+51],0;TmwCarlSampleSyn.fRange:TRangeState
 0058015F    pop         ebx
 00580160    ret
 00580161    cmp         al,1
 00580163    pop         ebx
 00580164    ret
*}
end;

//00580168
function TmwCarlSampleSyn.GetDefaultAttribute(Index:Integer):TmwHighLightAttributes;
begin
{*
 00580168    sub         edx,1
>0058016B    jb          0058017C
>0058016D    je          00580174
 0058016F    dec         edx
>00580170    je          00580178
>00580172    jmp         00580180
 00580174    mov         eax,dword ptr [eax+5C];TmwCarlSampleSyn.fCommentAttri:TmwHighLightAttributes
 00580177    ret
 00580178    mov         eax,dword ptr [eax+64];TmwCarlSampleSyn.fKeyAttri:TmwHighLightAttributes
 0058017B    ret
 0058017C    mov         eax,dword ptr [eax+68];TmwCarlSampleSyn.fSpaceAttri:TmwHighLightAttributes
 0058017F    ret
 00580180    xor         eax,eax
 00580182    ret
*}
end;

//00580184
function TmwCarlSampleSyn.GetEol:Boolean;
begin
{*
 00580184    cmp         byte ptr [eax+50],0;TmwCarlSampleSyn.fLanguage:Pointer
>00580188    jne         00580192
 0058018A    cmp         byte ptr [eax+58],6D;TmwCarlSampleSyn.FTokenID:TTokenKind
 0058018E    sete        al
 00580191    ret
 00580192    cmp         byte ptr [eax+58],6D;TmwCarlSampleSyn.FTokenID:TTokenKind
 00580196    sete        al
 00580199    ret
*}
end;

//0058019C
function TmwCarlSampleSyn.GetRange:Pointer;
begin
{*
 0058019C    movzx       edx,byte ptr [eax+50];TmwCarlSampleSyn.fLanguage:Pointer
 005801A0    test        dl,dl
>005801A2    jne         005801A9
 005801A4    movzx       eax,byte ptr [eax+51];TmwCarlSampleSyn.fRange:TRangeState
 005801A8    ret
 005801A9    movzx       ecx,byte ptr [eax+51];TmwCarlSampleSyn.fRange:TRangeState
 005801AD    movzx       eax,dl
 005801B0    shl         eax,18
 005801B3    or          ecx,eax
 005801B5    mov         eax,ecx
 005801B7    ret
*}
end;

//005801B8
{*procedure TmwCarlSampleSyn.GetToken(?:?);
begin
 005801B8    push        ebx
 005801B9    push        esi
 005801BA    push        edi
 005801BB    push        ebp
 005801BC    push        ecx
 005801BD    mov         dword ptr [esp],edx
 005801C0    mov         ebx,eax
 005801C2    movzx       eax,byte ptr [ebx+50];TmwCarlSampleSyn.fLanguage:Pointer
 005801C6    test        al,al
>005801C8    jne         005801EA
 005801CA    mov         edi,dword ptr [ebx+90];TmwCarlSampleSyn.s:TScanner
 005801D0    mov         esi,dword ptr [edi+24];TScanner.Index:Integer
 005801D3    mov         ebp,dword ptr [ebx+54];TmwCarlSampleSyn.fTokenPos:Integer
 005801D6    sub         esi,ebp
 005801D8    mov         eax,dword ptr [esp]
 005801DB    push        eax
 005801DC    mov         eax,dword ptr [edi+4];TScanner.s:string
 005801DF    mov         ecx,esi
 005801E1    mov         edx,ebp
 005801E3    call        @UStrCopy
>005801E8    jmp         005801EC
 005801EA    cmp         al,1
 005801EC    pop         edx
 005801ED    pop         ebp
 005801EE    pop         edi
 005801EF    pop         esi
 005801F0    pop         ebx
 005801F1    ret
end;*}

//005801F4
function TmwCarlSampleSyn.GetTokenAttribute:TmwHighLightAttributes;
begin
{*
 005801F4    push        ebp
 005801F5    mov         ebp,esp
 005801F7    push        0
 005801F9    push        0
 005801FB    push        ebx
 005801FC    mov         ebx,eax
 005801FE    xor         eax,eax
 00580200    push        ebp
 00580201    push        580480
 00580206    push        dword ptr fs:[eax]
 00580209    mov         dword ptr fs:[eax],esp
 0058020C    cmp         byte ptr [ebx+50],1;TmwCarlSampleSyn.fLanguage:Pointer
>00580210    je          00580462
 00580216    movzx       eax,byte ptr [ebx+58];TmwCarlSampleSyn.FTokenID:TTokenKind
 0058021A    cmp         eax,6A
>0058021D    ja          0058045D
 00580223    movzx       eax,byte ptr [eax+580231]
 0058022A    jmp         dword ptr [eax*4+58029C]
 0058022A    db          17
 0058022A    db          16
 0058022A    db          1
 0058022A    db          3
 0058022A    db          0
 0058022A    db          13
 0058022A    db          6
 0058022A    db          6
 0058022A    db          5
 0058022A    db          5
 0058022A    db          5
 0058022A    db          5
 0058022A    db          5
 0058022A    db          5
 0058022A    db          5
 0058022A    db          0
 0058022A    db          8
 0058022A    db          10
 0058022A    db          8
 0058022A    db          10
 0058022A    db          8
 0058022A    db          11
 0058022A    db          8
 0058022A    db          2
 0058022A    db          8
 0058022A    db          4
 0058022A    db          15
 0058022A    db          8
 0058022A    db          12
 0058022A    db          7
 0058022A    db          7
 0058022A    db          7
 0058022A    db          7
 0058022A    db          7
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          0
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          14
 0058022A    db          14
 0058022A    db          14
 0058022A    db          14
 0058022A    db          14
 0058022A    db          14
 0058022A    db          14
 0058022A    db          14
 0058022A    db          14
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          9
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          12
 0058022A    db          8
 0058022A    db          0
 0058022A    db          4
 0058022A    db          12
 0058022A    db          12
 0058022A    db          4
 0058022A    db          12
 0058022A    db          4
 0058022A    db          4
 0058022A    db          4
 0058022A    db          4
 0058022A    db          4
 0058022A    db          4
 0058022A    db          4
 0058022A    db          4
 0058022A    db          4
 0058022A    db          0
 0058022A    db          0
 0058022A    db          13
 0058022A    dd          0058045D
 0058022A    dd          005802E4
 0058022A    dd          005802EC
 0058022A    dd          00580323
 0058022A    dd          00580357
 0058022A    dd          0058035F
 0058022A    dd          00580367
 0058022A    dd          0058036F
 0058022A    dd          00580377
 0058022A    dd          005803A3
 0058022A    dd          005803BF
 0058022A    dd          005803F3
 0058022A    dd          00580425
 0058022A    dd          0058042A
 0058022A    dd          00580432
 0058022A    dd          0058044B
 0058022A    dd          00580453
 0058022A    dd          00580458
 005802E4    mov         ebx,dword ptr [ebx+5C];TmwCarlSampleSyn.fCommentAttri:TmwHighLightAttributes
>005802E7    jmp         00580465
 005802EC    mov         eax,dword ptr [ebx+90];TmwCarlSampleSyn.s:TScanner
 005802F2    mov         eax,dword ptr [eax+2C];TScanner.BracketLevel:Integer
 005802F5    test        eax,eax
>005802F7    jle         0058031B
 005802F9    and         eax,80000001
>005802FE    jns         00580305
 00580300    dec         eax
 00580301    or          eax,0FFFFFFFE
 00580304    inc         eax
 00580305    dec         eax
>00580306    jne         00580310
 00580308    mov         ebx,dword ptr [ebx+7C];TmwCarlSampleSyn.fSymbol0Attri:TmwHighLightAttributes
>0058030B    jmp         00580465
 00580310    mov         ebx,dword ptr [ebx+80];TmwCarlSampleSyn.fSymbol1Attri:TmwHighLightAttributes
>00580316    jmp         00580465
 0058031B    mov         ebx,dword ptr [ebx+5C];TmwCarlSampleSyn.fCommentAttri:TmwHighLightAttributes
>0058031E    jmp         00580465
 00580323    lea         edx,[ebp-8]
 00580326    mov         eax,ebx
 00580328    mov         ecx,dword ptr [eax]
 0058032A    call        dword ptr [ecx+60];TmwCarlSampleSyn.GetToken
 0058032D    mov         eax,dword ptr [ebp-8]
 00580330    lea         edx,[ebp-4]
 00580333    call        LowerCase
 00580338    mov         eax,dword ptr [ebp-4]
 0058033B    mov         edx,58049C;'display'
 00580340    call        @UStrEqual
>00580345    jne         0058034F
 00580347    mov         ebx,dword ptr [ebx+64];TmwCarlSampleSyn.fKeyAttri:TmwHighLightAttributes
>0058034A    jmp         00580465
 0058034F    mov         ebx,dword ptr [ebx+60];TmwCarlSampleSyn.fIdentifierAttri:TmwHighLightAttributes
>00580352    jmp         00580465
 00580357    mov         ebx,dword ptr [ebx+64];TmwCarlSampleSyn.fKeyAttri:TmwHighLightAttributes
>0058035A    jmp         00580465
 0058035F    mov         ebx,dword ptr [ebx+70];TmwCarlSampleSyn.fConstantAttri:TmwHighLightAttributes
>00580362    jmp         00580465
 00580367    mov         ebx,dword ptr [ebx+6C];TmwCarlSampleSyn.fStringAttri:TmwHighLightAttributes
>0058036A    jmp         00580465
 0058036F    mov         ebx,dword ptr [ebx+78];TmwCarlSampleSyn.fScopeAttri:TmwHighLightAttributes
>00580372    jmp         00580465
 00580377    mov         eax,dword ptr [ebx+90];TmwCarlSampleSyn.s:TScanner
 0058037D    mov         eax,dword ptr [eax+2C];TScanner.BracketLevel:Integer
 00580380    and         eax,80000001
>00580385    jns         0058038C
 00580387    dec         eax
 00580388    or          eax,0FFFFFFFE
 0058038B    inc         eax
 0058038C    test        eax,eax
>0058038E    jne         00580398
 00580390    mov         ebx,dword ptr [ebx+7C];TmwCarlSampleSyn.fSymbol0Attri:TmwHighLightAttributes
>00580393    jmp         00580465
 00580398    mov         ebx,dword ptr [ebx+80];TmwCarlSampleSyn.fSymbol1Attri:TmwHighLightAttributes
>0058039E    jmp         00580465
 005803A3    mov         eax,dword ptr [ebx+90];TmwCarlSampleSyn.s:TScanner
 005803A9    cmp         dword ptr [eax+2C],0;TScanner.BracketLevel:Integer
>005803AD    jle         005803B7
 005803AF    mov         ebx,dword ptr [ebx+74];TmwCarlSampleSyn.fOpperatorAttri:TmwHighLightAttributes
>005803B2    jmp         00580465
 005803B7    mov         ebx,dword ptr [ebx+7C];TmwCarlSampleSyn.fSymbol0Attri:TmwHighLightAttributes
>005803BA    jmp         00580465
 005803BF    mov         eax,dword ptr [ebx+90];TmwCarlSampleSyn.s:TScanner
 005803C5    mov         eax,dword ptr [eax+2C];TScanner.BracketLevel:Integer
 005803C8    test        eax,eax
>005803CA    jge         005803D7
 005803CC    mov         ebx,dword ptr [ebx+8C];TmwCarlSampleSyn.fErrorAttri:TmwHighLightAttributes
>005803D2    jmp         00580465
 005803D7    and         eax,80000001
>005803DC    jns         005803E3
 005803DE    dec         eax
 005803DF    or          eax,0FFFFFFFE
 005803E2    inc         eax
 005803E3    dec         eax
>005803E4    jne         005803EB
 005803E6    mov         ebx,dword ptr [ebx+7C];TmwCarlSampleSyn.fSymbol0Attri:TmwHighLightAttributes
>005803E9    jmp         00580465
 005803EB    mov         ebx,dword ptr [ebx+80];TmwCarlSampleSyn.fSymbol1Attri:TmwHighLightAttributes
>005803F1    jmp         00580465
 005803F3    mov         eax,dword ptr [ebx+90];TmwCarlSampleSyn.s:TScanner
 005803F9    mov         eax,dword ptr [eax+2C];TScanner.BracketLevel:Integer
 005803FC    cmp         eax,0FFFFFFFF
>005803FF    jge         00580409
 00580401    mov         ebx,dword ptr [ebx+8C];TmwCarlSampleSyn.fErrorAttri:TmwHighLightAttributes
>00580407    jmp         00580465
 00580409    and         eax,80000001
>0058040E    jns         00580415
 00580410    dec         eax
 00580411    or          eax,0FFFFFFFE
 00580414    inc         eax
 00580415    dec         eax
>00580416    jne         0058041D
 00580418    mov         ebx,dword ptr [ebx+7C];TmwCarlSampleSyn.fSymbol0Attri:TmwHighLightAttributes
>0058041B    jmp         00580465
 0058041D    mov         ebx,dword ptr [ebx+80];TmwCarlSampleSyn.fSymbol1Attri:TmwHighLightAttributes
>00580423    jmp         00580465
 00580425    mov         ebx,dword ptr [ebx+74];TmwCarlSampleSyn.fOpperatorAttri:TmwHighLightAttributes
>00580428    jmp         00580465
 0058042A    mov         ebx,dword ptr [ebx+88];TmwCarlSampleSyn.fUnitsAttri:TmwHighLightAttributes
>00580430    jmp         00580465
 00580432    mov         eax,dword ptr [ebx+90];TmwCarlSampleSyn.s:TScanner
 00580438    cmp         dword ptr [eax+2C],0;TScanner.BracketLevel:Integer
>0058043C    jle         00580446
 0058043E    mov         ebx,dword ptr [ebx+8C];TmwCarlSampleSyn.fErrorAttri:TmwHighLightAttributes
>00580444    jmp         00580465
 00580446    mov         ebx,dword ptr [ebx+7C];TmwCarlSampleSyn.fSymbol0Attri:TmwHighLightAttributes
>00580449    jmp         00580465
 0058044B    mov         ebx,dword ptr [ebx+84];TmwCarlSampleSyn.fContinueAttri:TmwHighLightAttributes
>00580451    jmp         00580465
 00580453    mov         ebx,dword ptr [ebx+68];TmwCarlSampleSyn.fSpaceAttri:TmwHighLightAttributes
>00580456    jmp         00580465
 00580458    mov         ebx,dword ptr [ebx+60];TmwCarlSampleSyn.fIdentifierAttri:TmwHighLightAttributes
>0058045B    jmp         00580465
 0058045D    mov         ebx,dword ptr [ebx+60];TmwCarlSampleSyn.fIdentifierAttri:TmwHighLightAttributes
>00580460    jmp         00580465
 00580462    mov         ebx,dword ptr [ebx+60];TmwCarlSampleSyn.fIdentifierAttri:TmwHighLightAttributes
 00580465    xor         eax,eax
 00580467    pop         edx
 00580468    pop         ecx
 00580469    pop         ecx
 0058046A    mov         dword ptr fs:[eax],edx
 0058046D    push        580487
 00580472    lea         eax,[ebp-8]
 00580475    mov         edx,2
 0058047A    call        @UStrArrayClr
 0058047F    ret
>00580480    jmp         @HandleFinally
>00580485    jmp         00580472
 00580487    mov         eax,ebx
 00580489    pop         ebx
 0058048A    pop         ecx
 0058048B    pop         ecx
 0058048C    pop         ebp
 0058048D    ret
*}
end;

//005804AC
function TmwCarlSampleSyn.GetTokenKind:Integer;
begin
{*
 005804AC    cmp         byte ptr [eax+50],0;TmwCarlSampleSyn.fLanguage:Pointer
>005804B0    jne         005804B7
 005804B2    movzx       eax,byte ptr [eax+58];TmwCarlSampleSyn.FTokenID:TTokenKind
 005804B6    ret
 005804B7    movzx       eax,byte ptr [eax+58];TmwCarlSampleSyn.FTokenID:TTokenKind
 005804BB    ret
*}
end;

//005804BC
function TmwCarlSampleSyn.GetTokenPos:Integer;
begin
{*
 005804BC    mov         eax,dword ptr [eax+54];TmwCarlSampleSyn.fTokenPos:Integer
 005804BF    dec         eax
 005804C0    ret
*}
end;

//005804C4
procedure TmwCarlSampleSyn.ReSetRange;
begin
{*
 005804C4    mov         byte ptr [eax+50],0;TmwCarlSampleSyn.fLanguage:Pointer
 005804C8    mov         byte ptr [eax+51],0;TmwCarlSampleSyn.fRange:TRangeState
 005804CC    ret
*}
end;

//005804D0
procedure TmwCarlSampleSyn.SetRange(Value:Pointer);
begin
{*
 005804D0    mov         ecx,edx
 005804D2    shr         ecx,18
 005804D5    mov         byte ptr [eax+50],cl;TmwCarlSampleSyn.fLanguage:Pointer
 005804D8    cmp         cl,1
>005804DB    je          005804E3
 005804DD    and         dl,0FF
 005804E0    mov         byte ptr [eax+51],dl;TmwCarlSampleSyn.fRange:TRangeState
 005804E3    ret
*}
end;

//005804E4
{*procedure sub_005804E4(?:?);
begin
 005804E4    push        esi
 005804E5    push        edi
 005804E6    mov         edi,edx
 005804E8    mov         esi,5804F8
 005804ED    mov         ecx,8
 005804F2    rep movs    dword ptr [edi],dword ptr [esi]
 005804F4    pop         edi
 005804F5    pop         esi
 005804F6    ret
end;*}

//00580518
{*procedure TmwCarlSampleSyn.GetLanguageName(?:?);
begin
 00580518    push        ebx
 00580519    mov         ebx,edx
 0058051B    mov         eax,ebx
 0058051D    mov         edx,580538;'Sumatra'
 00580522    call        @UStrAsg
 00580527    pop         ebx
 00580528    ret
end;*}

//00580548
function TmwCarlSampleSyn.GetCapability:THighlighterCapability;
begin
{*
 00580548    push        ebx
 00580549    push        esi
 0058054A    mov         esi,eax
 0058054C    mov         eax,esi
 0058054E    call        TmwCustomHighLighter.GetCapability
 00580553    mov         ebx,eax
 00580555    or          bl,byte ptr ds:[580560];0x4 gvar_00580560
 0058055B    mov         eax,ebx
 0058055D    pop         esi
 0058055E    pop         ebx
 0058055F    ret
*}
end;

//00580564
procedure TmwCarlSampleSyn.SetLineForExport(NewValue:string);
begin
{*
 00580564    push        ebp
 00580565    mov         ebp,esp
 00580567    push        ecx
 00580568    push        ebx
 00580569    push        esi
 0058056A    mov         dword ptr [ebp-4],edx
 0058056D    mov         ebx,eax
 0058056F    mov         eax,dword ptr [ebp-4]
 00580572    call        @UStrAddRef
 00580577    xor         eax,eax
 00580579    push        ebp
 0058057A    push        5805F2
 0058057F    push        dword ptr fs:[eax]
 00580582    mov         dword ptr fs:[eax],esp
 00580585    cmp         byte ptr [ebx+51],1;TmwCarlSampleSyn.fRange:TRangeState
 00580589    sete        al
 0058058C    mov         esi,dword ptr [ebx+90];TmwCarlSampleSyn.s:TScanner
 00580592    mov         byte ptr [esi+2A],al;TScanner.InComment:Boolean
 00580595    lea         eax,[esi+4];TScanner.s:string
 00580598    mov         edx,dword ptr [ebp-4]
 0058059B    call        @UStrAsg
 005805A0    mov         eax,dword ptr [ebx+90];TmwCarlSampleSyn.s:TScanner
 005805A6    call        TScanner.Reset
 005805AB    mov         dword ptr [ebx+54],1;TmwCarlSampleSyn.fTokenPos:Integer
 005805B2    mov         eax,dword ptr [ebx+90];TmwCarlSampleSyn.s:TScanner
 005805B8    movzx       eax,byte ptr [eax+8];TScanner.token:TToken
 005805BC    mov         byte ptr [ebx+58],al;TmwCarlSampleSyn.FTokenID:TTokenKind
 005805BF    mov         eax,dword ptr [ebx+90];TmwCarlSampleSyn.s:TScanner
 005805C5    cmp         byte ptr [eax+2A],0;TScanner.InComment:Boolean
>005805C9    je          005805D1
 005805CB    mov         byte ptr [ebx+51],1;TmwCarlSampleSyn.fRange:TRangeState
>005805CF    jmp         005805D5
 005805D1    mov         byte ptr [ebx+51],0;TmwCarlSampleSyn.fRange:TRangeState
 005805D5    mov         eax,ebx
 005805D7    mov         edx,dword ptr [eax]
 005805D9    call        dword ptr [edx+54];TmwCarlSampleSyn.ExportNext
 005805DC    xor         eax,eax
 005805DE    pop         edx
 005805DF    pop         ecx
 005805E0    pop         ecx
 005805E1    mov         dword ptr fs:[eax],edx
 005805E4    push        5805F9
 005805E9    lea         eax,[ebp-4]
 005805EC    call        @UStrClr
 005805F1    ret
>005805F2    jmp         @HandleFinally
>005805F7    jmp         005805E9
 005805F9    pop         esi
 005805FA    pop         ebx
 005805FB    pop         ecx
 005805FC    pop         ebp
 005805FD    ret
*}
end;

//00580600
procedure TmwCarlSampleSyn.ExportNext;
begin
{*
 00580600    push        ebp
 00580601    mov         ebp,esp
 00580603    mov         ecx,7
 00580608    push        0
 0058060A    push        0
 0058060C    dec         ecx
>0058060D    jne         00580608
 0058060F    push        ecx
 00580610    push        ebx
 00580611    push        esi
 00580612    mov         esi,eax
 00580614    xor         eax,eax
 00580616    push        ebp
 00580617    push        5808E5
 0058061C    push        dword ptr fs:[eax]
 0058061F    mov         dword ptr fs:[eax],esp
 00580622    mov         ebx,dword ptr [esi+48];TmwCarlSampleSyn.fExporter:TComponent
 00580625    test        ebx,ebx
>00580627    je          005808C3
 0058062D    mov         eax,ebx
 0058062F    mov         edx,dword ptr ds:[516754];TmwCustomExport
 00580635    call        @AsClass
 0058063A    mov         ebx,eax
 0058063C    movzx       eax,byte ptr [esi+58];TmwCarlSampleSyn.FTokenID:TTokenKind
 00580640    cmp         eax,6D
>00580643    ja          005808A8
 00580649    movzx       eax,byte ptr [eax+580657]
 00580650    jmp         dword ptr [eax*4+5806C5]
 00580650    db          11
 00580650    db          10
 00580650    db          1
 00580650    db          2
 00580650    db          0
 00580650    db          0
 00580650    db          5
 00580650    db          5
 00580650    db          4
 00580650    db          4
 00580650    db          4
 00580650    db          4
 00580650    db          4
 00580650    db          4
 00580650    db          4
 00580650    db          0
 00580650    db          7
 00580650    db          7
 00580650    db          7
 00580650    db          7
 00580650    db          7
 00580650    db          7
 00580650    db          7
 00580650    db          1
 00580650    db          7
 00580650    db          3
 00580650    db          9
 00580650    db          7
 00580650    db          8
 00580650    db          6
 00580650    db          6
 00580650    db          6
 00580650    db          6
 00580650    db          6
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          0
 00580650    db          0
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          0
 00580650    db          0
 00580650    db          0
 00580650    db          0
 00580650    db          0
 00580650    db          0
 00580650    db          0
 00580650    db          0
 00580650    db          0
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          0
 00580650    db          0
 00580650    db          0
 00580650    db          0
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          7
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          8
 00580650    db          7
 00580650    db          0
 00580650    db          3
 00580650    db          3
 00580650    db          3
 00580650    db          3
 00580650    db          3
 00580650    db          3
 00580650    db          3
 00580650    db          3
 00580650    db          3
 00580650    db          3
 00580650    db          3
 00580650    db          3
 00580650    db          3
 00580650    db          3
 00580650    db          0
 00580650    db          0
 00580650    db          0
 00580650    db          0
 00580650    db          10
 00580650    db          12
 00580650    dd          005808A8
 00580650    dd          005806F9
 00580650    dd          00580719
 00580650    dd          0058077D
 00580650    dd          0058079D
 00580650    dd          005807BD
 00580650    dd          005807DD
 00580650    dd          005807FD
 00580650    dd          0058081D
 00580650    dd          0058083D
 00580650    dd          0058085D
 00580650    dd          0058087A
 00580650    dd          00580897
 005806F9    push        1
 005806FB    push        0
 005806FD    lea         edx,[ebp-8]
 00580700    mov         eax,esi
 00580702    mov         ecx,dword ptr [eax]
 00580704    call        dword ptr [ecx+60];TmwCarlSampleSyn.GetToken
 00580707    mov         edx,dword ptr [ebp-8]
 0058070A    mov         ecx,dword ptr [esi+5C];TmwCarlSampleSyn.fCommentAttri:TmwHighLightAttributes
 0058070D    mov         eax,ebx
 0058070F    mov         ebx,dword ptr [eax]
 00580711    call        dword ptr [ebx+68];@AbstractError
>00580714    jmp         005808C3
 00580719    lea         edx,[ebp-0C]
 0058071C    mov         eax,esi
 0058071E    mov         ecx,dword ptr [eax]
 00580720    call        dword ptr [ecx+60];TmwCarlSampleSyn.GetToken
 00580723    mov         eax,dword ptr [ebp-0C]
 00580726    lea         edx,[ebp-4]
 00580729    call        LowerCase
 0058072E    mov         eax,dword ptr [ebp-4]
 00580731    mov         edx,580900;'display'
 00580736    call        @UStrEqual
>0058073B    jne         0058075D
 0058073D    push        0
 0058073F    push        0
 00580741    lea         edx,[ebp-10]
 00580744    mov         eax,esi
 00580746    mov         ecx,dword ptr [eax]
 00580748    call        dword ptr [ecx+60];TmwCarlSampleSyn.GetToken
 0058074B    mov         edx,dword ptr [ebp-10]
 0058074E    mov         ecx,dword ptr [esi+64];TmwCarlSampleSyn.fKeyAttri:TmwHighLightAttributes
 00580751    mov         eax,ebx
 00580753    mov         ebx,dword ptr [eax]
 00580755    call        dword ptr [ebx+68];@AbstractError
>00580758    jmp         005808C3
 0058075D    push        0
 0058075F    push        0
 00580761    lea         edx,[ebp-14]
 00580764    mov         eax,esi
 00580766    mov         ecx,dword ptr [eax]
 00580768    call        dword ptr [ecx+60];TmwCarlSampleSyn.GetToken
 0058076B    mov         edx,dword ptr [ebp-14]
 0058076E    mov         ecx,dword ptr [esi+60];TmwCarlSampleSyn.fIdentifierAttri:TmwHighLightAttributes
 00580771    mov         eax,ebx
 00580773    mov         ebx,dword ptr [eax]
 00580775    call        dword ptr [ebx+68];@AbstractError
>00580778    jmp         005808C3
 0058077D    push        0
 0058077F    push        0
 00580781    lea         edx,[ebp-18]
 00580784    mov         eax,esi
 00580786    mov         ecx,dword ptr [eax]
 00580788    call        dword ptr [ecx+60];TmwCarlSampleSyn.GetToken
 0058078B    mov         edx,dword ptr [ebp-18]
 0058078E    mov         ecx,dword ptr [esi+64];TmwCarlSampleSyn.fKeyAttri:TmwHighLightAttributes
 00580791    mov         eax,ebx
 00580793    mov         ebx,dword ptr [eax]
 00580795    call        dword ptr [ebx+68];@AbstractError
>00580798    jmp         005808C3
 0058079D    push        0
 0058079F    push        0
 005807A1    lea         edx,[ebp-1C]
 005807A4    mov         eax,esi
 005807A6    mov         ecx,dword ptr [eax]
 005807A8    call        dword ptr [ecx+60];TmwCarlSampleSyn.GetToken
 005807AB    mov         edx,dword ptr [ebp-1C]
 005807AE    mov         ecx,dword ptr [esi+70];TmwCarlSampleSyn.fConstantAttri:TmwHighLightAttributes
 005807B1    mov         eax,ebx
 005807B3    mov         ebx,dword ptr [eax]
 005807B5    call        dword ptr [ebx+68];@AbstractError
>005807B8    jmp         005808C3
 005807BD    push        0
 005807BF    push        0
 005807C1    lea         edx,[ebp-20]
 005807C4    mov         eax,esi
 005807C6    mov         ecx,dword ptr [eax]
 005807C8    call        dword ptr [ecx+60];TmwCarlSampleSyn.GetToken
 005807CB    mov         edx,dword ptr [ebp-20]
 005807CE    mov         ecx,dword ptr [esi+6C];TmwCarlSampleSyn.fStringAttri:TmwHighLightAttributes
 005807D1    mov         eax,ebx
 005807D3    mov         ebx,dword ptr [eax]
 005807D5    call        dword ptr [ebx+68];@AbstractError
>005807D8    jmp         005808C3
 005807DD    push        0
 005807DF    push        0
 005807E1    lea         edx,[ebp-24]
 005807E4    mov         eax,esi
 005807E6    mov         ecx,dword ptr [eax]
 005807E8    call        dword ptr [ecx+60];TmwCarlSampleSyn.GetToken
 005807EB    mov         edx,dword ptr [ebp-24]
 005807EE    mov         ecx,dword ptr [esi+78];TmwCarlSampleSyn.fScopeAttri:TmwHighLightAttributes
 005807F1    mov         eax,ebx
 005807F3    mov         ebx,dword ptr [eax]
 005807F5    call        dword ptr [ebx+68];@AbstractError
>005807F8    jmp         005808C3
 005807FD    push        0
 005807FF    push        0
 00580801    lea         edx,[ebp-28]
 00580804    mov         eax,esi
 00580806    mov         ecx,dword ptr [eax]
 00580808    call        dword ptr [ecx+60];TmwCarlSampleSyn.GetToken
 0058080B    mov         edx,dword ptr [ebp-28]
 0058080E    mov         ecx,dword ptr [esi+7C];TmwCarlSampleSyn.fSymbol0Attri:TmwHighLightAttributes
 00580811    mov         eax,ebx
 00580813    mov         ebx,dword ptr [eax]
 00580815    call        dword ptr [ebx+68];@AbstractError
>00580818    jmp         005808C3
 0058081D    push        0
 0058081F    push        0
 00580821    lea         edx,[ebp-2C]
 00580824    mov         eax,esi
 00580826    mov         ecx,dword ptr [eax]
 00580828    call        dword ptr [ecx+60];TmwCarlSampleSyn.GetToken
 0058082B    mov         edx,dword ptr [ebp-2C]
 0058082E    mov         ecx,dword ptr [esi+74];TmwCarlSampleSyn.fOpperatorAttri:TmwHighLightAttributes
 00580831    mov         eax,ebx
 00580833    mov         ebx,dword ptr [eax]
 00580835    call        dword ptr [ebx+68];@AbstractError
>00580838    jmp         005808C3
 0058083D    push        0
 0058083F    push        0
 00580841    lea         edx,[ebp-30]
 00580844    mov         eax,esi
 00580846    mov         ecx,dword ptr [eax]
 00580848    call        dword ptr [ecx+60];TmwCarlSampleSyn.GetToken
 0058084B    mov         edx,dword ptr [ebp-30]
 0058084E    mov         ecx,dword ptr [esi+84];TmwCarlSampleSyn.fContinueAttri:TmwHighLightAttributes
 00580854    mov         eax,ebx
 00580856    mov         ebx,dword ptr [eax]
 00580858    call        dword ptr [ebx+68];@AbstractError
>0058085B    jmp         005808C3
 0058085D    push        0
 0058085F    push        1
 00580861    lea         edx,[ebp-34]
 00580864    mov         eax,esi
 00580866    mov         ecx,dword ptr [eax]
 00580868    call        dword ptr [ecx+60];TmwCarlSampleSyn.GetToken
 0058086B    mov         edx,dword ptr [ebp-34]
 0058086E    mov         ecx,dword ptr [esi+68];TmwCarlSampleSyn.fSpaceAttri:TmwHighLightAttributes
 00580871    mov         eax,ebx
 00580873    mov         ebx,dword ptr [eax]
 00580875    call        dword ptr [ebx+68];@AbstractError
>00580878    jmp         005808C3
 0058087A    push        0
 0058087C    push        0
 0058087E    lea         edx,[ebp-38]
 00580881    mov         eax,esi
 00580883    mov         ecx,dword ptr [eax]
 00580885    call        dword ptr [ecx+60];TmwCarlSampleSyn.GetToken
 00580888    mov         edx,dword ptr [ebp-38]
 0058088B    mov         ecx,dword ptr [esi+60];TmwCarlSampleSyn.fIdentifierAttri:TmwHighLightAttributes
 0058088E    mov         eax,ebx
 00580890    mov         ebx,dword ptr [eax]
 00580892    call        dword ptr [ebx+68];@AbstractError
>00580895    jmp         005808C3
 00580897    push        0
 00580899    push        0
 0058089B    xor         ecx,ecx
 0058089D    xor         edx,edx
 0058089F    mov         eax,ebx
 005808A1    mov         ebx,dword ptr [eax]
 005808A3    call        dword ptr [ebx+68];@AbstractError
>005808A6    jmp         005808C3
 005808A8    push        0
 005808AA    push        0
 005808AC    lea         edx,[ebp-3C]
 005808AF    mov         eax,esi
 005808B1    mov         ecx,dword ptr [eax]
 005808B3    call        dword ptr [ecx+60];TmwCarlSampleSyn.GetToken
 005808B6    mov         edx,dword ptr [ebp-3C]
 005808B9    mov         ecx,dword ptr [esi+60];TmwCarlSampleSyn.fIdentifierAttri:TmwHighLightAttributes
 005808BC    mov         eax,ebx
 005808BE    mov         ebx,dword ptr [eax]
 005808C0    call        dword ptr [ebx+68];@AbstractError
 005808C3    mov         eax,esi
 005808C5    mov         edx,dword ptr [eax]
 005808C7    call        dword ptr [edx+70];TmwCarlSampleSyn.Next
 005808CA    xor         eax,eax
 005808CC    pop         edx
 005808CD    pop         ecx
 005808CE    pop         ecx
 005808CF    mov         dword ptr fs:[eax],edx
 005808D2    push        5808EC
 005808D7    lea         eax,[ebp-3C]
 005808DA    mov         edx,0F
 005808DF    call        @UStrArrayClr
 005808E4    ret
>005808E5    jmp         @HandleFinally
>005808EA    jmp         005808D7
 005808EC    pop         esi
 005808ED    pop         ebx
 005808EE    mov         esp,ebp
 005808F0    pop         ebp
 005808F1    ret
*}
end;

Initialization
//0078145C
{*
 0078145C    sub         dword ptr ds:[815564],1
>00781463    jae         0078146F
 00781465    mov         eax,[0057F2CC];TmwCarlSampleSyn
 0078146A    call        005137EC
 0078146F    ret
*}
Finalization
end.