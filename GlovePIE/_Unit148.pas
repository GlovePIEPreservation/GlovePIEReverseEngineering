//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit148;

interface

uses
  SysUtils, Classes, PieScanner, mwCarlSample, PieStatement, TntStdCtrls, DebugWinUnit, PieBase, ExtCtrls;

type
  TParser = class(TObject)
  published
    function ParseSTerm(StartingFactor:TExpression; CanHaveEquals:Boolean):TExpression;//007136FC
    function ParseAndSummation(StartingFactor:TExpression; CanHaveEquals:Boolean):TExpression;//00713404
    function ParseProduct(StartingFactor:TExpression; CanHaveEquals:Boolean):TExpression;//00712D54
    function ParseSTermInUnits(CanHaveEquals:Boolean):TExpression;//0071A4F8
    function ParseReTest(LHS:TExpression; CanHaveEquals:Boolean):TExpression;//00713B30
    function ParseNotTest(CanHaveEquals:Boolean):TExpression;//007143DC
    function ParseSummation(StartingFactor:TExpression; CanHaveEquals:Boolean):TExpression;//0071313C
    function ParseComparison(CanHaveEquals:Boolean):TExpression;//00713908
    function ParseObjectArrayField(ObjectName:string):TExpression;//0071444C
    function ParseVector:TExpression;//0071B1C4
    destructor Destroy();//007175F8
    constructor Create(TextOfFile:string);//00717564
    function ParseFactorWithUnits(CanHaveEquals:Boolean):TExpression;//0071A3B0
    function ParseFactor(CanHaveEquals:Boolean):TExpression;//00712A7C
    function ParseDouble(CanHaveEquals:Boolean):Double;//0071ADE4
    function ParseLiteral(CanHaveEquals:Boolean):TExpression;//00712104
    function ParseTest(CanHaveEquals:Boolean):TExpression;//0071407C
    procedure ParseParamList(L:TObjectList);//007152CC
    procedure ParseParamListWithoutBrackets(L:TObjectList);//00715270
    function ParseLine:TStatement;//00717258
    function ParseAsmLine:TStatement;//007160D0
    //procedure ParseQualifiedId(?:?);//0071604C
    function ParseIdLine:TStatement;//0071637C
    function ParseProcedureCall(name:string):TCall;//00715304
    //procedure ParseDottedTerm(?:?);//00715E84
    function ParseCodeBlock:TStatement;//0071784C
    procedure ParseProgram;//00717284
    function ParseExpression(CanHaveEquals:Boolean):TExpression;//007146E0
    function ParseExpressionSequence(CanHaveEquals:Boolean):TExpression;//0071A78C
    function ParseIfStatement(AlreadyReadIf:Boolean):TStatement;//00717630
    function ParseStatement:TStatement;//007169A4
    function ParseWhileLoop(AlreadyReadWhile:Boolean):TStatement;//0071AF88
    function ParseForLoop(AlreadyReadFor:Boolean):TStatement;//0071A830
  public
    s:TScanner;//f4
    Errors:TStrings;//f8
    Code:TCodeBlock;//fC
  end;
  TDebugRemoteForm = class(TTntForm)
  published
    Memo1:TTntMemo;//f388
    Timer1:TTimer;//f38C
    procedure FormHide(Sender:TObject);//0071DEB8
    procedure FormShow(Sender:TObject);//0071DEA0
    procedure Timer1Timer(Sender:TObject);//0071DBC8
  end;
    //function sub_00710C0C(?:?):Boolean;//00710C0C
    //function sub_00710C2C(?:TScanner; ?:?):?;//00710C2C
    //function sub_00710CA4(?:TScanner; ?:UString):?;//00710CA4
    //function sub_00710D70(?:?; ?:?):?;//00710D70
    //procedure sub_00710E50(?:WideString; ?:?);//00710E50
    //function sub_00710FA4(?:WideString; ?:Boolean):?;//00710FA4
    //function sub_00717A98(?:?):?;//00717A98
    //procedure sub_00719FDC(?:?; ?:?; ?:?; ?:?);//00719FDC
    //procedure sub_0071B38C(?:?; ?:?);//0071B38C
    //procedure sub_0071B42C(?:TToken; ?:?);//0071B42C
    //procedure sub_0071C6EC(?:TToken; ?:?);//0071C6EC
    //procedure sub_0071D64C(?:WideString; ?:?);//0071D64C
    //procedure sub_0071D778(?:WideString; ?:?);//0071D778

implementation

{$R *.DFM}

//00710C0C
{*function sub_00710C0C(?:?):Boolean;
begin
 00710C0C    push        ebx
 00710C0D    push        esi
 00710C0E    mov         ebx,eax
 00710C10    mov         esi,ebx
 00710C12    mov         eax,esi
 00710C14    call        TCharacter.IsLetterOrDigit
 00710C19    test        al,al
>00710C1B    je          00710C22
 00710C1D    mov         al,1
 00710C1F    pop         esi
 00710C20    pop         ebx
 00710C21    ret
 00710C22    cmp         si,5F
 00710C26    sete        al
 00710C29    pop         esi
 00710C2A    pop         ebx
 00710C2B    ret
end;*}

//00710C2C
{*function sub_00710C2C(?:TScanner; ?:?):?;
begin
 00710C2C    push        ebp
 00710C2D    mov         ebp,esp
 00710C2F    add         esp,0FFFFFFE8
 00710C32    push        ebx
 00710C33    push        esi
 00710C34    mov         ebx,edx
 00710C36    mov         esi,eax
 00710C38    lea         eax,[ebp-18]
 00710C3B    mov         edx,dword ptr ds:[576E48];TToken
 00710C41    call        @InitializeRecord
 00710C46    xor         eax,eax
 00710C48    push        ebp
 00710C49    push        710C93
 00710C4E    push        dword ptr fs:[eax]
 00710C51    mov         dword ptr fs:[eax],esp
 00710C54    lea         eax,[ebp-18]
 00710C57    lea         edx,[esi+8]
 00710C5A    mov         ecx,dword ptr ds:[576E48];TToken
 00710C60    call        @CopyRecord
 00710C65    cmp         bl,byte ptr [ebp-18]
>00710C68    je          00710C6E
 00710C6A    xor         ebx,ebx
>00710C6C    jmp         00710C77
 00710C6E    mov         bl,1
 00710C70    mov         eax,esi
 00710C72    call        TScanner.Next
 00710C77    xor         eax,eax
 00710C79    pop         edx
 00710C7A    pop         ecx
 00710C7B    pop         ecx
 00710C7C    mov         dword ptr fs:[eax],edx
 00710C7F    push        710C9A
 00710C84    lea         eax,[ebp-18]
 00710C87    mov         edx,dword ptr ds:[576E48];TToken
 00710C8D    call        @FinalizeRecord
 00710C92    ret
>00710C93    jmp         @HandleFinally
>00710C98    jmp         00710C84
 00710C9A    mov         eax,ebx
 00710C9C    pop         esi
 00710C9D    pop         ebx
 00710C9E    mov         esp,ebp
 00710CA0    pop         ebp
 00710CA1    ret
end;*}

//00710CA4
{*function sub_00710CA4(?:TScanner; ?:UString):?;
begin
 00710CA4    push        ebp
 00710CA5    mov         ebp,esp
 00710CA7    add         esp,0FFFFFFD8
 00710CAA    push        ebx
 00710CAB    push        esi
 00710CAC    xor         ecx,ecx
 00710CAE    mov         dword ptr [ebp-24],ecx
 00710CB1    mov         dword ptr [ebp-28],ecx
 00710CB4    mov         dword ptr [ebp-4],edx
 00710CB7    mov         esi,eax
 00710CB9    mov         eax,dword ptr [ebp-4]
 00710CBC    call        @UStrAddRef
 00710CC1    lea         eax,[ebp-20]
 00710CC4    mov         edx,dword ptr ds:[576E48];TToken
 00710CCA    call        @InitializeRecord
 00710CCF    xor         eax,eax
 00710CD1    push        ebp
 00710CD2    push        710D5F
 00710CD7    push        dword ptr fs:[eax]
 00710CDA    mov         dword ptr fs:[eax],esp
 00710CDD    lea         eax,[ebp-20]
 00710CE0    lea         edx,[esi+8]
 00710CE3    mov         ecx,dword ptr ds:[576E48];TToken
 00710CE9    call        @CopyRecord
 00710CEE    movzx       ebx,byte ptr [ebp-20]
 00710CF2    cmp         bl,3
>00710CF5    je          00710CFC
 00710CF7    cmp         bl,5
>00710CFA    jne         00710D21
 00710CFC    lea         edx,[ebp-24]
 00710CFF    mov         eax,dword ptr [ebp-1C]
 00710D02    call        UpperCase
 00710D07    mov         eax,dword ptr [ebp-24]
 00710D0A    push        eax
 00710D0B    lea         edx,[ebp-28]
 00710D0E    mov         eax,dword ptr [ebp-4]
 00710D11    call        UpperCase
 00710D16    mov         edx,dword ptr [ebp-28]
 00710D19    pop         eax
 00710D1A    call        @UStrEqual
>00710D1F    je          00710D25
 00710D21    xor         ebx,ebx
>00710D23    jmp         00710D2E
 00710D25    mov         bl,1
 00710D27    mov         eax,esi
 00710D29    call        TScanner.Next
 00710D2E    xor         eax,eax
 00710D30    pop         edx
 00710D31    pop         ecx
 00710D32    pop         ecx
 00710D33    mov         dword ptr fs:[eax],edx
 00710D36    push        710D66
 00710D3B    lea         eax,[ebp-28]
 00710D3E    mov         edx,2
 00710D43    call        @UStrArrayClr
 00710D48    lea         eax,[ebp-20]
 00710D4B    mov         edx,dword ptr ds:[576E48];TToken
 00710D51    call        @FinalizeRecord
 00710D56    lea         eax,[ebp-4]
 00710D59    call        @UStrClr
 00710D5E    ret
>00710D5F    jmp         @HandleFinally
>00710D64    jmp         00710D3B
 00710D66    mov         eax,ebx
 00710D68    pop         esi
 00710D69    pop         ebx
 00710D6A    mov         esp,ebp
 00710D6C    pop         ebp
 00710D6D    ret
end;*}

//00710D70
{*function sub_00710D70(?:?; ?:?):?;
begin
 00710D70    push        ebp
 00710D71    mov         ebp,esp
 00710D73    add         esp,0FFFFFFF8
 00710D76    push        ebx
 00710D77    push        esi
 00710D78    xor         ecx,ecx
 00710D7A    mov         dword ptr [ebp-8],ecx
 00710D7D    mov         esi,edx
 00710D7F    mov         ebx,eax
 00710D81    xor         eax,eax
 00710D83    push        ebp
 00710D84    push        710E2C
 00710D89    push        dword ptr fs:[eax]
 00710D8C    mov         dword ptr fs:[eax],esp
 00710D8F    call        005D17D8
 00710D94    lea         edx,[ebp-8]
 00710D97    mov         eax,ebx
 00710D99    mov         ecx,dword ptr [eax]
 00710D9B    call        dword ptr [ecx+1C]
 00710D9E    lea         eax,[ebp-8]
 00710DA1    mov         edx,710E48;'
'
 00710DA6    call        @UStrCat
 00710DAB    mov         ecx,dword ptr [ebp-8]
 00710DAE    mov         dl,1
 00710DB0    mov         eax,[007101E4];TParser
 00710DB5    call        TParser.Create;TParser.Create
 00710DBA    mov         dword ptr [ebp-4],eax
 00710DBD    xor         eax,eax
 00710DBF    push        ebp
 00710DC0    push        710E02
 00710DC5    push        dword ptr fs:[eax]
 00710DC8    mov         dword ptr fs:[eax],esp
 00710DCB    mov         eax,dword ptr [ebp-4]
 00710DCE    mov         dword ptr [eax+8],esi;TParser.Errors:TStrings
 00710DD1    mov         eax,dword ptr [ebp-4]
 00710DD4    call        TParser.ParseProgram
 00710DD9    xor         eax,eax
 00710DDB    pop         edx
 00710DDC    pop         ecx
 00710DDD    pop         ecx
 00710DDE    mov         dword ptr fs:[eax],edx
 00710DE1    push        710E09
 00710DE6    call        005D178C
 00710DEB    mov         eax,dword ptr [ebp-4]
 00710DEE    mov         ebx,dword ptr [eax+0C];TParser.Code:TCodeBlock
 00710DF1    mov         eax,dword ptr [ebp-4]
 00710DF4    xor         edx,edx
 00710DF6    mov         dword ptr [eax+0C],edx;TParser.Code:TCodeBlock
 00710DF9    mov         eax,dword ptr [ebp-4]
 00710DFC    call        TObject.Free
 00710E01    ret
>00710E02    jmp         @HandleFinally
>00710E07    jmp         00710DE6
 00710E09    test        ebx,ebx
>00710E0B    je          00710E16
 00710E0D    xor         edx,edx
 00710E0F    mov         eax,ebx
 00710E11    mov         ecx,dword ptr [eax]
 00710E13    call        dword ptr [ecx+4];TCodeBlock.SetIffy
 00710E16    xor         eax,eax
 00710E18    pop         edx
 00710E19    pop         ecx
 00710E1A    pop         ecx
 00710E1B    mov         dword ptr fs:[eax],edx
 00710E1E    push        710E33
 00710E23    lea         eax,[ebp-8]
 00710E26    call        @UStrClr
 00710E2B    ret
>00710E2C    jmp         @HandleFinally
>00710E31    jmp         00710E23
 00710E33    mov         eax,ebx
 00710E35    pop         esi
 00710E36    pop         ebx
 00710E37    pop         ecx
 00710E38    pop         ecx
 00710E39    pop         ebp
 00710E3A    ret
end;*}

//00710E50
{*procedure sub_00710E50(?:WideString; ?:?);
begin
 00710E50    push        ebp
 00710E51    mov         ebp,esp
 00710E53    mov         ecx,4
 00710E58    push        0
 00710E5A    push        0
 00710E5C    dec         ecx
>00710E5D    jne         00710E58
 00710E5F    push        ecx
 00710E60    push        ebx
 00710E61    push        esi
 00710E62    mov         esi,edx
 00710E64    mov         dword ptr [ebp-4],eax
 00710E67    lea         eax,[ebp-4]
 00710E6A    call        @WStrAddRef
 00710E6F    xor         eax,eax
 00710E71    push        ebp
 00710E72    push        710F7E
 00710E77    push        dword ptr fs:[eax]
 00710E7A    mov         dword ptr fs:[eax],esp
 00710E7D    mov         eax,esi
 00710E7F    call        @WStrClr
 00710E84    mov         edx,dword ptr [ebp-4]
 00710E87    mov         eax,710F90
 00710E8C    call        Pos
 00710E91    mov         ebx,eax
 00710E93    test        ebx,ebx
>00710E95    jle         00710F0F
 00710E97    lea         eax,[ebp-0C]
 00710E9A    mov         edx,dword ptr [esi]
 00710E9C    call        @UStrFromWStr
 00710EA1    push        dword ptr [ebp-0C]
 00710EA4    lea         eax,[ebp-18]
 00710EA7    push        eax
 00710EA8    mov         ecx,ebx
 00710EAA    dec         ecx
 00710EAB    mov         edx,1
 00710EB0    mov         eax,dword ptr [ebp-4]
 00710EB3    call        @WStrCopy
 00710EB8    mov         edx,dword ptr [ebp-18]
 00710EBB    lea         eax,[ebp-14]
 00710EBE    call        @UStrFromWStr
 00710EC3    mov         eax,dword ptr [ebp-14]
 00710EC6    lea         edx,[ebp-10]
 00710EC9    call        00575C90
 00710ECE    push        dword ptr [ebp-10]
 00710ED1    push        710FA0;'.'
 00710ED6    lea         eax,[ebp-8]
 00710ED9    mov         edx,3
 00710EDE    call        @UStrCatN
 00710EE3    mov         edx,dword ptr [ebp-8]
 00710EE6    mov         eax,esi
 00710EE8    call        @WStrFromUStr
 00710EED    lea         eax,[ebp-4]
 00710EF0    mov         ecx,ebx
 00710EF2    mov         edx,1
 00710EF7    call        @WStrDelete
 00710EFC    mov         edx,dword ptr [ebp-4]
 00710EFF    mov         eax,710F90
 00710F04    call        Pos
 00710F09    mov         ebx,eax
 00710F0B    test        ebx,ebx
>00710F0D    jg          00710E97
 00710F0F    lea         eax,[ebp-1C]
 00710F12    mov         edx,dword ptr [esi]
 00710F14    call        @UStrFromWStr
 00710F19    lea         eax,[ebp-1C]
 00710F1C    push        eax
 00710F1D    lea         eax,[ebp-24]
 00710F20    mov         edx,dword ptr [ebp-4]
 00710F23    call        @UStrFromWStr
 00710F28    mov         eax,dword ptr [ebp-24]
 00710F2B    lea         edx,[ebp-20]
 00710F2E    call        00575C90
 00710F33    mov         edx,dword ptr [ebp-20]
 00710F36    pop         eax
 00710F37    call        @UStrCat
 00710F3C    mov         edx,dword ptr [ebp-1C]
 00710F3F    mov         eax,esi
 00710F41    call        @WStrFromUStr
 00710F46    xor         eax,eax
 00710F48    pop         edx
 00710F49    pop         ecx
 00710F4A    pop         ecx
 00710F4B    mov         dword ptr fs:[eax],edx
 00710F4E    push        710F85
 00710F53    lea         eax,[ebp-24]
 00710F56    mov         edx,3
 00710F5B    call        @UStrArrayClr
 00710F60    lea         eax,[ebp-18]
 00710F63    call        @WStrClr
 00710F68    lea         eax,[ebp-14]
 00710F6B    mov         edx,4
 00710F70    call        @UStrArrayClr
 00710F75    lea         eax,[ebp-4]
 00710F78    call        @WStrClr
 00710F7D    ret
>00710F7E    jmp         @HandleFinally
>00710F83    jmp         00710F53
 00710F85    pop         esi
 00710F86    pop         ebx
 00710F87    mov         esp,ebp
 00710F89    pop         ebp
 00710F8A    ret
end;*}

//00710FA4
{*function sub_00710FA4(?:WideString; ?:Boolean):?;
begin
 00710FA4    push        ebp
 00710FA5    mov         ebp,esp
 00710FA7    mov         ecx,8
 00710FAC    push        0
 00710FAE    push        0
 00710FB0    dec         ecx
>00710FB1    jne         00710FAC
 00710FB3    push        ebx
 00710FB4    push        esi
 00710FB5    mov         ebx,edx
 00710FB7    mov         dword ptr [ebp-4],eax
 00710FBA    lea         eax,[ebp-4]
 00710FBD    call        @WStrAddRef
 00710FC2    xor         eax,eax
 00710FC4    push        ebp
 00710FC5    push        7118E7
 00710FCA    push        dword ptr fs:[eax]
 00710FCD    mov         dword ptr fs:[eax],esp
 00710FD0    test        bl,bl
>00710FD2    je          00711010
 00710FD4    mov         dl,1
 00710FD6    mov         eax,[00680DF8];TBinaryOp
 00710FDB    call        TObject.Create;TBinaryOp.Create
 00710FE0    mov         ebx,eax
 00710FE2    mov         dl,1
 00710FE4    mov         eax,[005F1024];TKey
 00710FE9    call        TKey.Create;TKey.Create
 00710FEE    mov         esi,eax
 00710FF0    mov         dword ptr [ebx+18],esi;TBinaryOp.LHS:TExpression
 00710FF3    mov         dword ptr [esi+20],101;TKey.ScanCode:Integer
 00710FFA    mov         byte ptr [ebx+20],8;TBinaryOp.Operation:TOperation
 00710FFE    xor         edx,edx
 00711000    mov         eax,dword ptr [ebp-4]
 00711003    call        00710FA4
 00711008    mov         dword ptr [ebx+1C],eax;TBinaryOp.RHS:TExpression
>0071100B    jmp         007118AC
 00711010    lea         edx,[ebp-0C]
 00711013    mov         eax,dword ptr [ebp-4]
 00711016    call        00710E50
 0071101B    mov         edx,dword ptr [ebp-0C]
 0071101E    lea         eax,[ebp-4]
 00711021    call        @WStrLAsg
 00711026    lea         eax,[ebp-10]
 00711029    mov         edx,dword ptr [ebp-4]
 0071102C    call        @UStrFromWStr
 00711031    mov         eax,dword ptr [ebp-10]
 00711034    lea         edx,[ebp-8]
 00711037    call        LowerCase
 0071103C    lea         eax,[ebp-14]
 0071103F    mov         edx,dword ptr [ebp-4]
 00711042    call        @UStrFromWStr
 00711047    mov         eax,dword ptr [ebp-14]
 0071104A    call        005E44F4
 0071104F    mov         ebx,eax
 00711051    test        ebx,ebx
>00711053    jne         007118AC
 00711059    mov         eax,dword ptr [ebp-8]
 0071105C    mov         edx,711904;'pressed'
 00711061    call        @UStrEqual
>00711066    jne         00711082
 00711068    mov         dl,1
 0071106A    mov         eax,[0067F1FC];TPressedExpression
 0071106F    call        TObject.Create;TPressedExpression.Create
 00711074    mov         dword ptr [eax+24],1;TPressedExpression.Item:Integer
 0071107B    mov         ebx,eax
>0071107D    jmp         007118AC
 00711082    mov         eax,dword ptr [ebp-8]
 00711085    mov         edx,711920;'released'
 0071108A    call        @UStrEqual
>0071108F    jne         007110AB
 00711091    mov         dl,1
 00711093    mov         eax,[0067F1FC];TPressedExpression
 00711098    call        TObject.Create;TPressedExpression.Create
 0071109D    mov         dword ptr [eax+24],2;TPressedExpression.Item:Integer
 007110A4    mov         ebx,eax
>007110A6    jmp         007118AC
 007110AB    mov         eax,dword ptr [ebp-8]
 007110AE    mov         edx,711940;'clicked'
 007110B3    call        @UStrEqual
>007110B8    jne         007110D4
 007110BA    mov         dl,1
 007110BC    mov         eax,[0067F1FC];TPressedExpression
 007110C1    call        TObject.Create;TPressedExpression.Create
 007110C6    mov         dword ptr [eax+24],3;TPressedExpression.Item:Integer
 007110CD    mov         ebx,eax
>007110CF    jmp         007118AC
 007110D4    mov         eax,dword ptr [ebp-8]
 007110D7    mov         edx,71195C;'doubleclicked'
 007110DC    call        @UStrEqual
>007110E1    jne         007110FD
 007110E3    mov         dl,1
 007110E5    mov         eax,[0067F1FC];TPressedExpression
 007110EA    call        TObject.Create;TPressedExpression.Create
 007110EF    mov         dword ptr [eax+24],4;TPressedExpression.Item:Integer
 007110F6    mov         ebx,eax
>007110F8    jmp         007118AC
 007110FD    mov         eax,dword ptr [ebp-8]
 00711100    mov         edx,711984;'singleclicked'
 00711105    call        @UStrEqual
>0071110A    jne         00711126
 0071110C    mov         dl,1
 0071110E    mov         eax,[0067F1FC];TPressedExpression
 00711113    call        TObject.Create;TPressedExpression.Create
 00711118    mov         dword ptr [eax+24],5;TPressedExpression.Item:Integer
 0071111F    mov         ebx,eax
>00711121    jmp         007118AC
 00711126    mov         eax,dword ptr [ebp-8]
 00711129    mov         edx,7119AC;'helddown'
 0071112E    call        @UStrEqual
>00711133    jne         0071114F
 00711135    mov         dl,1
 00711137    mov         eax,[0067F1FC];TPressedExpression
 0071113C    call        TObject.Create;TPressedExpression.Create
 00711141    mov         dword ptr [eax+24],6;TPressedExpression.Item:Integer
 00711148    mov         ebx,eax
>0071114A    jmp         007118AC
 0071114F    mov         eax,dword ptr [ebp-8]
 00711152    mov         edx,7119CC;'keepdown'
 00711157    call        @UStrEqual
>0071115C    jne         00711178
 0071115E    mov         dl,1
 00711160    mov         eax,[0067F1FC];TPressedExpression
 00711165    call        TObject.Create;TPressedExpression.Create
 0071116A    mov         dword ptr [eax+24],7;TPressedExpression.Item:Integer
 00711171    mov         ebx,eax
>00711173    jmp         007118AC
 00711178    mov         eax,dword ptr [ebp-8]
 0071117B    mov         edx,7119EC;'delta'
 00711180    call        @UStrEqual
>00711185    jne         007111A1
 00711187    mov         dl,1
 00711189    mov         eax,[0067F1FC];TPressedExpression
 0071118E    call        TObject.Create;TPressedExpression.Create
 00711193    mov         dword ptr [eax+24],8;TPressedExpression.Item:Integer
 0071119A    mov         ebx,eax
>0071119C    jmp         007118AC
 007111A1    mov         eax,dword ptr [ebp-8]
 007111A4    mov         edx,711A04;'smooth'
 007111A9    call        @UStrEqual
>007111AE    jne         007111C3
 007111B0    mov         dl,1
 007111B2    mov         eax,[0067F6F8];TSmoothExpression
 007111B7    call        TObject.Create;TSmoothExpression.Create
 007111BC    mov         ebx,eax
>007111BE    jmp         007118AC
 007111C3    mov         eax,dword ptr [ebp-8]
 007111C6    mov         edx,711A20;'kalman'
 007111CB    call        @UStrEqual
>007111D0    jne         007111E5
 007111D2    mov         dl,1
 007111D4    mov         eax,[0067FC7C];TKalmanExpression
 007111D9    call        TObject.Create;TKalmanExpression.Create
 007111DE    mov         ebx,eax
>007111E0    jmp         007118AC
 007111E5    mov         eax,dword ptr [ebp-8]
 007111E8    mov         edx,711A3C;'debug'
 007111ED    call        @UStrEqual
>007111F2    jne         00711207
 007111F4    mov         dl,1
 007111F6    mov         eax,[005C449C];TDebugValue
 007111FB    call        TObject.Create;TDebugValue.Create
 00711200    mov         ebx,eax
>00711202    jmp         007118AC
 00711207    lea         eax,[ebp-18]
 0071120A    mov         edx,dword ptr [ebp-4]
 0071120D    call        @UStrFromWStr
 00711212    mov         eax,dword ptr [ebp-18]
 00711215    call        00701924
 0071121A    test        al,al
>0071121C    je          00711256
 0071121E    lea         eax,[ebp-1C]
 00711221    mov         edx,dword ptr [ebp-4]
 00711224    call        @UStrFromWStr
 00711229    mov         eax,dword ptr [ebp-1C]
 0071122C    call        00700CC4
 00711231    mov         ebx,eax
 00711233    test        ebx,ebx
>00711235    jne         007118AC
 0071123B    mov         ecx,711A54;'Invalid DLL function call syntax'
 00711240    mov         dl,1
 00711242    mov         eax,[00577004];ETokenExpected
 00711247    call        Exception.Create;ETokenExpected.Create
 0071124C    call        @RaiseExcept
>00711251    jmp         007118AC
 00711256    mov         eax,dword ptr [ebp-8]
 00711259    call        006A8384
 0071125E    test        al,al
>00711260    je          0071128F
 00711262    mov         eax,dword ptr [ebp-8]
 00711265    call        006B14D8
 0071126A    mov         ebx,eax
 0071126C    test        ebx,ebx
>0071126E    jne         007118AC
 00711274    mov         ecx,711AA4;'Invalid MIDI value'
 00711279    mov         dl,1
 0071127B    mov         eax,[00577004];ETokenExpected
 00711280    call        Exception.Create;ETokenExpected.Create
 00711285    call        @RaiseExcept
>0071128A    jmp         007118AC
 0071128F    mov         eax,dword ptr [ebp-8]
 00711292    call        006B72C8
 00711297    test        al,al
>00711299    je          007112C8
 0071129B    mov         eax,dword ptr [ebp-8]
 0071129E    call        006B740C
 007112A3    mov         ebx,eax
 007112A5    test        ebx,ebx
>007112A7    jne         007118AC
 007112AD    mov         ecx,711AD8;'Invalid Remote Control value'
 007112B2    mov         dl,1
 007112B4    mov         eax,[00577004];ETokenExpected
 007112B9    call        Exception.Create;ETokenExpected.Create
 007112BE    call        @RaiseExcept
>007112C3    jmp         007118AC
 007112C8    mov         eax,dword ptr [ebp-8]
 007112CB    call        006D9B18
 007112D0    test        al,al
>007112D2    je          00711301
 007112D4    mov         eax,dword ptr [ebp-8]
 007112D7    call        006D63F8
 007112DC    mov         ebx,eax
 007112DE    test        ebx,ebx
>007112E0    jne         007118AC
 007112E6    mov         ecx,711B20;'Invalid Z800 value'
 007112EB    mov         dl,1
 007112ED    mov         eax,[00577004];ETokenExpected
 007112F2    call        Exception.Create;ETokenExpected.Create
 007112F7    call        @RaiseExcept
>007112FC    jmp         007118AC
 00711301    mov         eax,dword ptr [ebp-8]
 00711304    call        006DB57C
 00711309    test        al,al
>0071130B    je          0071133A
 0071130D    mov         eax,dword ptr [ebp-8]
 00711310    call        006DAB8C
 00711315    mov         ebx,eax
 00711317    test        ebx,ebx
>00711319    jne         007118AC
 0071131F    mov         ecx,711B54;'Invalid Intersense value'
 00711324    mov         dl,1
 00711326    mov         eax,[00577004];ETokenExpected
 0071132B    call        Exception.Create;ETokenExpected.Create
 00711330    call        @RaiseExcept
>00711335    jmp         007118AC
 0071133A    mov         eax,dword ptr [ebp-8]
 0071133D    call        006DCDD4
 00711342    test        al,al
>00711344    je          00711373
 00711346    mov         eax,dword ptr [ebp-8]
 00711349    call        006DBBB0
 0071134E    mov         ebx,eax
 00711350    test        ebx,ebx
>00711352    jne         007118AC
 00711358    mov         ecx,711B94;'Invalid Polhemus value'
 0071135D    mov         dl,1
 0071135F    mov         eax,[00577004];ETokenExpected
 00711364    call        Exception.Create;ETokenExpected.Create
 00711369    call        @RaiseExcept
>0071136E    jmp         007118AC
 00711373    mov         eax,dword ptr [ebp-8]
 00711376    call        006E33BC
 0071137B    test        al,al
>0071137D    je          007113AC
 0071137F    mov         eax,dword ptr [ebp-8]
 00711382    call        006E0F7C
 00711387    mov         ebx,eax
 00711389    test        ebx,ebx
>0071138B    jne         007118AC
 00711391    mov         ecx,711BD0;'Invalid TrackIR value'
 00711396    mov         dl,1
 00711398    mov         eax,[00577004];ETokenExpected
 0071139D    call        Exception.Create;ETokenExpected.Create
 007113A2    call        @RaiseExcept
>007113A7    jmp         007118AC
 007113AC    mov         eax,dword ptr [ebp-8]
 007113AF    call        006F463C
 007113B4    test        al,al
>007113B6    je          007113E5
 007113B8    mov         eax,dword ptr [ebp-8]
 007113BB    call        006F3A28
 007113C0    mov         ebx,eax
 007113C2    test        ebx,ebx
>007113C4    jne         007118AC
 007113CA    mov         ecx,711C08;'Invalid HatTrack value'
 007113CF    mov         dl,1
 007113D1    mov         eax,[00577004];ETokenExpected
 007113D6    call        Exception.Create;ETokenExpected.Create
 007113DB    call        @RaiseExcept
>007113E0    jmp         007118AC
 007113E5    mov         eax,dword ptr [ebp-8]
 007113E8    call        006E590C
 007113ED    test        al,al
>007113EF    je          0071141E
 007113F1    mov         eax,dword ptr [ebp-8]
 007113F4    call        006E3CD4
 007113F9    mov         ebx,eax
 007113FB    test        ebx,ebx
>007113FD    jne         007118AC
 00711403    mov         ecx,711C44;'Invalid FakeSpace Pinch Glove value'
 00711408    mov         dl,1
 0071140A    mov         eax,[00577004];ETokenExpected
 0071140F    call        Exception.Create;ETokenExpected.Create
 00711414    call        @RaiseExcept
>00711419    jmp         007118AC
 0071141E    mov         eax,dword ptr [ebp-8]
 00711421    call        00613B88
 00711426    test        al,al
>00711428    je          00711457
 0071142A    mov         eax,dword ptr [ebp-8]
 0071142D    call        0060C978
 00711432    mov         ebx,eax
 00711434    test        ebx,ebx
>00711436    jne         007118AC
 0071143C    mov         ecx,711C98;'Invalid Old Wiimote value'
 00711441    mov         dl,1
 00711443    mov         eax,[00577004];ETokenExpected
 00711448    call        Exception.Create;ETokenExpected.Create
 0071144D    call        @RaiseExcept
>00711452    jmp         007118AC
 00711457    mov         eax,dword ptr [ebp-8]
 0071145A    call        00605250
 0071145F    test        al,al
>00711461    je          00711490
 00711463    mov         eax,dword ptr [ebp-8]
 00711466    call        006042D4
 0071146B    mov         ebx,eax
 0071146D    test        ebx,ebx
>0071146F    jne         007118AC
 00711475    mov         ecx,711CD8;'Invalid BD Remote value'
 0071147A    mov         dl,1
 0071147C    mov         eax,[00577004];ETokenExpected
 00711481    call        Exception.Create;ETokenExpected.Create
 00711486    call        @RaiseExcept
>0071148B    jmp         007118AC
 00711490    mov         eax,dword ptr [ebp-8]
 00711493    call        006CDE0C
 00711498    test        al,al
>0071149A    je          007114C9
 0071149C    mov         eax,dword ptr [ebp-8]
 0071149F    call        006CD654
 007114A4    mov         ebx,eax
 007114A6    test        ebx,ebx
>007114A8    jne         007118AC
 007114AE    mov         ecx,711D14;'Invalid window value'
 007114B3    mov         dl,1
 007114B5    mov         eax,[00577004];ETokenExpected
 007114BA    call        Exception.Create;ETokenExpected.Create
 007114BF    call        @RaiseExcept
>007114C4    jmp         007118AC
 007114C9    mov         eax,dword ptr [ebp-8]
 007114CC    call        006C7838
 007114D1    test        al,al
>007114D3    je          00711502
 007114D5    mov         eax,dword ptr [ebp-8]
 007114D8    call        006C7900
 007114DD    mov         ebx,eax
 007114DF    test        ebx,ebx
>007114E1    jne         007118AC
 007114E7    mov         ecx,711D4C;'Invalid Screen value'
 007114EC    mov         dl,1
 007114EE    mov         eax,[00577004];ETokenExpected
 007114F3    call        Exception.Create;ETokenExpected.Create
 007114F8    call        @RaiseExcept
>007114FD    jmp         007118AC
 00711502    mov         eax,dword ptr [ebp-8]
 00711505    call        005D0C14
 0071150A    test        al,al
>0071150C    je          0071153B
 0071150E    mov         eax,dword ptr [ebp-8]
 00711511    call        005D0CD0
 00711516    mov         ebx,eax
 00711518    test        ebx,ebx
>0071151A    jne         007118AC
 00711520    mov         ecx,711D84;'Invalid speech value'
 00711525    mov         dl,1
 00711527    mov         eax,[00577004];ETokenExpected
 0071152C    call        Exception.Create;ETokenExpected.Create
 00711531    call        @RaiseExcept
>00711536    jmp         007118AC
 0071153B    mov         eax,dword ptr [ebp-8]
 0071153E    call        00617B30
 00711543    test        al,al
>00711545    je          0071157F
 00711547    lea         eax,[ebp-20]
 0071154A    mov         edx,dword ptr [ebp-4]
 0071154D    call        @UStrFromWStr
 00711552    mov         eax,dword ptr [ebp-20]
 00711555    call        00616E14
 0071155A    mov         ebx,eax
 0071155C    test        ebx,ebx
>0071155E    jne         007118AC
 00711564    mov         ecx,711DBC;'Invalid OSC value. I don''t know why.'
 00711569    mov         dl,1
 0071156B    mov         eax,[00577004];ETokenExpected
 00711570    call        Exception.Create;ETokenExpected.Create
 00711575    call        @RaiseExcept
>0071157A    jmp         007118AC
 0071157F    mov         eax,dword ptr [ebp-8]
 00711582    call        006C2984
 00711587    test        al,al
>00711589    je          007115B8
 0071158B    mov         eax,dword ptr [ebp-8]
 0071158E    call        006BD6D4
 00711593    mov         ebx,eax
 00711595    test        ebx,ebx
>00711597    jne         007118AC
 0071159D    mov         ecx,711E14;'Invalid Microphone value'
 007115A2    mov         dl,1
 007115A4    mov         eax,[00577004];ETokenExpected
 007115A9    call        Exception.Create;ETokenExpected.Create
 007115AE    call        @RaiseExcept
>007115B3    jmp         007118AC
 007115B8    mov         eax,dword ptr [ebp-8]
 007115BB    call        006EBC8C
 007115C0    test        al,al
>007115C2    je          007115F1
 007115C4    mov         eax,dword ptr [ebp-8]
 007115C7    call        006EA1C8
 007115CC    mov         ebx,eax
 007115CE    test        ebx,ebx
>007115D0    jne         007118AC
 007115D6    mov         ecx,711E54;'Invalid Direct3D Camera value'
 007115DB    mov         dl,1
 007115DD    mov         eax,[00577004];ETokenExpected
 007115E2    call        Exception.Create;ETokenExpected.Create
 007115E7    call        @RaiseExcept
>007115EC    jmp         007118AC
 007115F1    mov         eax,dword ptr [ebp-8]
 007115F4    call        006EBAC4
 007115F9    test        al,al
>007115FB    je          0071162A
 007115FD    mov         eax,dword ptr [ebp-8]
 00711600    call        006E9FD0
 00711605    mov         ebx,eax
 00711607    test        ebx,ebx
>00711609    jne         007118AC
 0071160F    mov         ecx,711E9C;'Invalid Direct3D Object value'
 00711614    mov         dl,1
 00711616    mov         eax,[00577004];ETokenExpected
 0071161B    call        Exception.Create;ETokenExpected.Create
 00711620    call        @RaiseExcept
>00711625    jmp         007118AC
 0071162A    mov         eax,dword ptr [ebp-8]
 0071162D    call        006F67B0
 00711632    test        al,al
>00711634    je          00711663
 00711636    mov         eax,dword ptr [ebp-8]
 00711639    call        006F5D58
 0071163E    mov         ebx,eax
 00711640    test        ebx,ebx
>00711642    jne         007118AC
 00711648    mov         ecx,711EE4;'Invalid Laptop value'
 0071164D    mov         dl,1
 0071164F    mov         eax,[00577004];ETokenExpected
 00711654    call        Exception.Create;ETokenExpected.Create
 00711659    call        @RaiseExcept
>0071165E    jmp         007118AC
 00711663    mov         eax,dword ptr [ebp-8]
 00711666    call        006F7D80
 0071166B    test        al,al
>0071166D    je          0071169C
 0071166F    mov         eax,dword ptr [ebp-8]
 00711672    call        006F7524
 00711677    mov         ebx,eax
 00711679    test        ebx,ebx
>0071167B    jne         007118AC
 00711681    mov         ecx,711F1C;'Invalid Nintendo DS value'
 00711686    mov         dl,1
 00711688    mov         eax,[00577004];ETokenExpected
 0071168D    call        Exception.Create;ETokenExpected.Create
 00711692    call        @RaiseExcept
>00711697    jmp         007118AC
 0071169C    mov         eax,dword ptr [ebp-8]
 0071169F    call        006F3174
 007116A4    test        al,al
>007116A6    je          007116C3
 007116A8    mov         ecx,711F5C;'VR920 support has been removed due to Vuzix banning me, please protest to Vu...
 007116AD    mov         dl,1
 007116AF    mov         eax,[0043912C];EParserError
 007116B4    call        Exception.Create;EParserError.Create
 007116B9    call        @RaiseExcept
>007116BE    jmp         007118AC
 007116C3    lea         eax,[ebp-24]
 007116C6    mov         edx,dword ptr [ebp-4]
 007116C9    call        @UStrFromWStr
 007116CE    mov         eax,dword ptr [ebp-24]
 007116D1    call        005D223C
 007116D6    test        al,al
>007116D8    je          007116F4
 007116DA    lea         eax,[ebp-28]
 007116DD    mov         edx,dword ptr [ebp-4]
 007116E0    call        @UStrFromWStr
 007116E5    mov         eax,dword ptr [ebp-28]
 007116E8    call        005D2308
 007116ED    mov         ebx,eax
>007116EF    jmp         007118AC
 007116F4    lea         eax,[ebp-4]
 007116F7    mov         edx,712004
 007116FC    call        004F9C5C
 00711701    test        al,al
>00711703    jne         00711716
 00711705    lea         eax,[ebp-4]
 00711708    mov         edx,712014
 0071170D    call        004F9C5C
 00711712    test        al,al
>00711714    je          00711774
 00711716    lea         eax,[ebp-2C]
 00711719    mov         edx,dword ptr [ebp-4]
 0071171C    call        @UStrFromWStr
 00711721    mov         eax,dword ptr [ebp-2C]
 00711724    call        00670674
 00711729    mov         esi,eax
 0071172B    cmp         esi,0FFFFFFFF
>0071172E    jle         00711759
 00711730    mov         dl,1
 00711732    mov         eax,[0066FAE8];TMathsFunction
 00711737    call        TMathsFunction.Create;TMathsFunction.Create
 0071173C    mov         edx,esi
 0071173E    mov         dword ptr [eax+1C],edx;TMathsFunction.FunctionNumber:Integer
 00711741    sub         edx,89
>00711747    jne         00711752
 00711749    mov         edx,dword ptr ds:[78CFB4];^gvar_00817994
 0071174F    mov         byte ptr [edx],1
 00711752    mov         ebx,eax
>00711754    jmp         007118AC
 00711759    mov         ecx,712030;'Maths function name expected'
 0071175E    mov         dl,1
 00711760    mov         eax,[00577004];ETokenExpected
 00711765    call        Exception.Create;ETokenExpected.Create
 0071176A    call        @RaiseExcept
>0071176F    jmp         007118AC
 00711774    lea         eax,[ebp-4]
 00711777    mov         edx,712070
 0071177C    call        004F9C5C
 00711781    test        al,al
>00711783    jne         00711796
 00711785    lea         eax,[ebp-4]
 00711788    mov         edx,712088
 0071178D    call        004F9C5C
 00711792    test        al,al
>00711794    je          00711809
 00711796    lea         eax,[ebp-30]
 00711799    mov         edx,dword ptr [ebp-4]
 0071179C    call        @UStrFromWStr
 007117A1    mov         eax,dword ptr [ebp-30]
 007117A4    call        006706E4
 007117A9    mov         esi,eax
 007117AB    cmp         esi,0FFFFFFFF
>007117AE    jle         007117EE
 007117B0    mov         dl,1
 007117B2    mov         eax,[00670104];TProcedureExpression
 007117B7    call        TMathsFunction.Create;TProcedureExpression.Create
 007117BC    mov         edx,esi
 007117BE    mov         dword ptr [eax+1C],edx;TProcedureExpression.FunctionNumber:Integer
 007117C1    add         edx,0FFFFFFD8
 007117C4    sub         edx,2
>007117C7    jb          007117D3
 007117C9    sub         edx,2
>007117CC    jb          007117DE
 007117CE    dec         edx
>007117CF    je          007117DE
>007117D1    jmp         007117E7
 007117D3    mov         edx,dword ptr ds:[78DA20];^gvar_0081D8B0
 007117D9    mov         byte ptr [edx],1
>007117DC    jmp         007117E7
 007117DE    mov         edx,dword ptr ds:[78CFB4];^gvar_00817994
 007117E4    mov         byte ptr [edx],1
 007117E7    mov         ebx,eax
>007117E9    jmp         007118AC
 007117EE    mov         ecx,712030;'Maths function name expected'
 007117F3    mov         dl,1
 007117F5    mov         eax,[00577004];ETokenExpected
 007117FA    call        Exception.Create;ETokenExpected.Create
 007117FF    call        @RaiseExcept
>00711804    jmp         007118AC
 00711809    lea         eax,[ebp-34]
 0071180C    mov         edx,dword ptr [ebp-4]
 0071180F    call        @UStrFromWStr
 00711814    mov         eax,dword ptr [ebp-34]
 00711817    call        00670674
 0071181C    mov         esi,eax
 0071181E    cmp         esi,0FFFFFFFF
>00711821    jle         00711846
 00711823    mov         dl,1
 00711825    mov         eax,[0066FAE8];TMathsFunction
 0071182A    call        TMathsFunction.Create;TMathsFunction.Create
 0071182F    mov         dword ptr [eax+1C],esi;TMathsFunction.FunctionNumber:Integer
 00711832    mov         ebx,eax
 00711834    cmp         esi,8C
>0071183A    jne         007118AC
 0071183C    mov         eax,[0078D42C];^gvar_008162F8
 00711841    mov         byte ptr [eax],1
>00711844    jmp         007118AC
 00711846    lea         eax,[ebp-38]
 00711849    mov         edx,dword ptr [ebp-4]
 0071184C    call        @UStrFromWStr
 00711851    mov         eax,dword ptr [ebp-38]
 00711854    call        006706E4
 00711859    mov         esi,eax
 0071185B    cmp         esi,0FFFFFFFF
>0071185E    jle         00711873
 00711860    mov         dl,1
 00711862    mov         eax,[00670104];TProcedureExpression
 00711867    call        TMathsFunction.Create;TProcedureExpression.Create
 0071186C    mov         dword ptr [eax+1C],esi;TProcedureExpression.FunctionNumber:Integer
 0071186F    mov         ebx,eax
>00711871    jmp         007118AC
 00711873    push        7120A4
 00711878    push        dword ptr [ebp-4]
 0071187B    push        712100
 00711880    lea         eax,[ebp-40]
 00711883    mov         edx,3
 00711888    call        @WStrCatN
 0071188D    mov         edx,dword ptr [ebp-40]
 00711890    lea         eax,[ebp-3C]
 00711893    call        @UStrFromWStr
 00711898    mov         ecx,dword ptr [ebp-3C]
 0071189B    mov         dl,1
 0071189D    mov         eax,[00577004];ETokenExpected
 007118A2    call        Exception.Create;ETokenExpected.Create
 007118A7    call        @RaiseExcept
 007118AC    xor         eax,eax
 007118AE    pop         edx
 007118AF    pop         ecx
 007118B0    pop         ecx
 007118B1    mov         dword ptr fs:[eax],edx
 007118B4    push        7118EE
 007118B9    lea         eax,[ebp-40]
 007118BC    call        @WStrClr
 007118C1    lea         eax,[ebp-3C]
 007118C4    mov         edx,0C
 007118C9    call        @UStrArrayClr
 007118CE    lea         eax,[ebp-0C]
 007118D1    call        @WStrClr
 007118D6    lea         eax,[ebp-8]
 007118D9    call        @UStrClr
 007118DE    lea         eax,[ebp-4]
 007118E1    call        @WStrClr
 007118E6    ret
>007118E7    jmp         @HandleFinally
>007118EC    jmp         007118B9
 007118EE    mov         eax,ebx
 007118F0    pop         esi
 007118F1    pop         ebx
 007118F2    mov         esp,ebp
 007118F4    pop         ebp
 007118F5    ret
end;*}

//00712104
function TParser.ParseLiteral(CanHaveEquals:Boolean):TExpression;
begin
{*
 00712104    push        ebp
 00712105    mov         ebp,esp
 00712107    xor         ecx,ecx
 00712109    push        ecx
 0071210A    push        ecx
 0071210B    push        ecx
 0071210C    push        ecx
 0071210D    push        ecx
 0071210E    push        ecx
 0071210F    push        ecx
 00712110    push        ebx
 00712111    push        esi
 00712112    push        edi
 00712113    mov         byte ptr [ebp-5],dl
 00712116    mov         ebx,eax
 00712118    xor         eax,eax
 0071211A    push        ebp
 0071211B    push        712988
 00712120    push        dword ptr fs:[eax]
 00712123    mov         dword ptr fs:[eax],esp
 00712126    mov         esi,dword ptr [ebx+4];TParser.s:TScanner
 00712129    movzx       eax,byte ptr [esi+8];TScanner.token:TToken
 0071212D    cmp         eax,4A
>00712130    ja          007126E7
 00712136    movzx       eax,byte ptr [eax+712144]
 0071213D    jmp         dword ptr [eax*4+71218F]
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          14
 0071213D    db          0
 0071213D    db          14
 0071213D    db          3
 0071213D    db          0
 0071213D    db          4
 0071213D    db          6
 0071213D    db          5
 0071213D    db          7
 0071213D    db          8
 0071213D    db          9
 0071213D    db          10
 0071213D    db          0
 0071213D    db          11
 0071213D    db          0
 0071213D    db          2
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          12
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          13
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          0
 0071213D    db          1
 0071213D    dd          007126E7
 0071213D    dd          007121CB
 0071213D    dd          0071220C
 0071213D    dd          0071221A
 0071213D    dd          00712238
 0071213D    dd          0071225D
 0071213D    dd          00712282
 0071213D    dd          007122A3
 0071213D    dd          007122C3
 0071213D    dd          007122E3
 0071213D    dd          00712303
 0071213D    dd          00712323
 0071213D    dd          00712344
 0071213D    dd          00712372
 0071213D    dd          007123B8
 007121CB    mov         eax,esi
 007121CD    call        TScanner.Next
 007121D2    mov         dl,1
 007121D4    mov         eax,[0066FAE8];TMathsFunction
 007121D9    call        TMathsFunction.Create;TMathsFunction.Create
 007121DE    mov         esi,eax
 007121E0    mov         dword ptr [esi+1C],1;TMathsFunction.FunctionNumber:Integer
 007121E7    movzx       edx,byte ptr [ebp-5]
 007121EB    mov         eax,ebx
 007121ED    call        TParser.ParseLiteral
 007121F2    mov         edx,dword ptr [esi+18];TMathsFunction.Parameters:TObjectList
 007121F5    xchg        eax,edx
 007121F6    call        TList.Add
 007121FB    mov         edi,esi
 007121FD    mov         dl,4A
 007121FF    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712202    call        TScanner.expect
>00712207    jmp         00712716
 0071220C    mov         eax,ebx
 0071220E    call        TParser.ParseVector
 00712213    mov         edi,eax
>00712215    jmp         00712716
 0071221A    mov         ecx,dword ptr [esi+0C]
 0071221D    mov         dl,1
 0071221F    mov         eax,[006808C0];TConstant
 00712224    call        TConstant.Create;TConstant.Create
 00712229    mov         edi,eax
 0071222B    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071222E    call        TScanner.Next
>00712233    jmp         00712716
 00712238    fild        qword ptr [esi+10]
 0071223B    add         esp,0FFFFFFF8
 0071223E    fstp        qword ptr [esp]
 00712241    wait
 00712242    mov         dl,1
 00712244    mov         eax,[006808C0];TConstant
 00712249    call        TConstant.Create;TConstant.Create
 0071224E    mov         edi,eax
 00712250    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712253    call        TScanner.Next
>00712258    jmp         00712716
 0071225D    fild        qword ptr [esi+10]
 00712260    add         esp,0FFFFFFF8
 00712263    fstp        qword ptr [esp]
 00712266    wait
 00712267    mov         dl,1
 00712269    mov         eax,[006808C0];TConstant
 0071226E    call        TConstant.Create;TConstant.Create
 00712273    mov         edi,eax
 00712275    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712278    call        TScanner.Next
>0071227D    jmp         00712716
 00712282    push        dword ptr [esi+1C]
 00712285    push        dword ptr [esi+18]
 00712288    mov         dl,1
 0071228A    mov         eax,[006808C0];TConstant
 0071228F    call        TConstant.Create;TConstant.Create
 00712294    mov         edi,eax
 00712296    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712299    call        TScanner.Next
>0071229E    jmp         00712716
 007122A3    mov         ecx,7129A4;'1'
 007122A8    mov         dl,1
 007122AA    mov         eax,[006808C0];TConstant
 007122AF    call        TConstant.Create;TConstant.Create
 007122B4    mov         edi,eax
 007122B6    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007122B9    call        TScanner.Next
>007122BE    jmp         00712716
 007122C3    mov         ecx,7129B4;'0'
 007122C8    mov         dl,1
 007122CA    mov         eax,[006808C0];TConstant
 007122CF    call        TConstant.Create;TConstant.Create
 007122D4    mov         edi,eax
 007122D6    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007122D9    call        TScanner.Next
>007122DE    jmp         00712716
 007122E3    mov         ecx,7129B4;'0'
 007122E8    mov         dl,1
 007122EA    mov         eax,[006808C0];TConstant
 007122EF    call        TConstant.Create;TConstant.Create
 007122F4    mov         edi,eax
 007122F6    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007122F9    call        TScanner.Next
>007122FE    jmp         00712716
 00712303    mov         ecx,7129B4;'0'
 00712308    mov         dl,1
 0071230A    mov         eax,[006808C0];TConstant
 0071230F    call        TConstant.Create;TConstant.Create
 00712314    mov         edi,eax
 00712316    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712319    call        TScanner.Next
>0071231E    jmp         00712716
 00712323    mov         eax,esi
 00712325    call        TScanner.Next
 0071232A    mov         dl,1
 0071232C    mov         eax,ebx
 0071232E    call        TParser.ParseExpressionSequence
 00712333    mov         edi,eax
 00712335    mov         dl,11
 00712337    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071233A    call        TScanner.expect
>0071233F    jmp         00712716
 00712344    mov         eax,esi
 00712346    call        TScanner.Next
 0071234B    mov         dl,1
 0071234D    mov         eax,[00681370];TUnaryOp
 00712352    call        TObject.Create;TUnaryOp.Create
 00712357    mov         esi,eax
 00712359    movzx       edx,byte ptr [ebp-5]
 0071235D    mov         eax,ebx
 0071235F    call        TParser.ParseLiteral
 00712364    mov         dword ptr [esi+18],eax;TUnaryOp.RHS:TExpression
 00712367    mov         byte ptr [esi+1C],1;TUnaryOp.Operation:TOperation
 0071236B    mov         edi,esi
>0071236D    jmp         00712716
 00712372    mov         eax,esi
 00712374    call        TScanner.Next
 00712379    mov         dl,1
 0071237B    mov         eax,[00680DF8];TBinaryOp
 00712380    call        TObject.Create;TBinaryOp.Create
 00712385    mov         esi,eax
 00712387    mov         dl,1
 00712389    mov         eax,[005F1024];TKey
 0071238E    call        TKey.Create;TKey.Create
 00712393    mov         edi,eax
 00712395    mov         dword ptr [esi+18],edi;TBinaryOp.LHS:TExpression
 00712398    mov         dword ptr [edi+20],101;TKey.ScanCode:Integer
 0071239F    mov         byte ptr [esi+20],8;TBinaryOp.Operation:TOperation
 007123A3    movzx       edx,byte ptr [ebp-5]
 007123A7    mov         eax,ebx
 007123A9    call        TParser.ParseLiteral
 007123AE    mov         dword ptr [esi+1C],eax;TBinaryOp.RHS:TExpression
 007123B1    mov         edi,esi
>007123B3    jmp         00712716
 007123B8    lea         edx,[ebp-4]
 007123BB    mov         eax,ebx
 007123BD    call        TParser.ParseQualifiedId
 007123C2    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007123C5    cmp         byte ptr [eax+8],12;TScanner.token:TToken
>007123C9    jne         007123ED
 007123CB    mov         edx,dword ptr [ebp-4]
 007123CE    mov         eax,7129C4;'.'
 007123D3    call        Pos
 007123D8    test        eax,eax
>007123DA    jg          007123ED
 007123DC    mov         edx,dword ptr [ebp-4]
 007123DF    mov         eax,ebx
 007123E1    call        TParser.ParseObjectArrayField
 007123E6    mov         edi,eax
>007123E8    jmp         00712716
 007123ED    lea         eax,[ebp-14]
 007123F0    mov         edx,dword ptr [ebp-4]
 007123F3    call        @WStrFromUStr
 007123F8    mov         eax,dword ptr [ebp-14]
 007123FB    xor         edx,edx
 007123FD    call        00710FA4
 00712402    mov         edi,eax
 00712404    mov         eax,edi
 00712406    mov         edx,dword ptr ds:[67F1FC];TPressedExpression
 0071240C    call        @IsClass
 00712411    test        al,al
>00712413    je          0071245F
 00712415    mov         dl,10
 00712417    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071241A    call        TScanner.expect
 0071241F    mov         dl,1
 00712421    mov         eax,ebx
 00712423    call        TParser.ParseExpression
 00712428    mov         dword ptr [edi+20],eax
 0071242B    mov         esi,edi
 0071242D    mov         eax,dword ptr [esi+24]
 00712430    cmp         eax,6
>00712433    je          0071243A
 00712435    cmp         eax,7
>00712438    jne         00712450
 0071243A    mov         dl,16
 0071243C    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071243F    call        TScanner.expect
 00712444    mov         dl,1
 00712446    mov         eax,ebx
 00712448    call        TParser.ParseExpression
 0071244D    mov         dword ptr [esi+28],eax
 00712450    mov         dl,11
 00712452    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712455    call        TScanner.expect
>0071245A    jmp         007126C6
 0071245F    mov         eax,edi
 00712461    mov         edx,dword ptr ds:[6BBEF4];TSaidValue
 00712467    call        @IsClass
 0071246C    test        al,al
>0071246E    je          007124F4
 00712474    mov         esi,dword ptr [edi+20]
 00712477    test        esi,esi
>00712479    je          00712480
 0071247B    cmp         esi,10
>0071247E    jne         007124F4
 00712480    mov         dl,10
 00712482    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712485    call        TScanner.expect
 0071248A    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071248D    cmp         byte ptr [eax+8],6;TScanner.token:TToken
>00712491    jne         007124DE
 00712493    mov         edx,dword ptr [eax+0C]
 00712496    mov         eax,edi
 00712498    call        TSaidValue.SetPhrase
 0071249D    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007124A0    call        TScanner.Next
 007124A5    mov         dl,16
 007124A7    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007124AA    call        TScanner.read
 007124AF    test        al,al
>007124B1    je          007124E5
 007124B3    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007124B6    cmp         byte ptr [eax+8],8;TScanner.token:TToken
>007124BA    je          007124C5
 007124BC    mov         edx,dword ptr [ebx+4];TParser.s:TScanner
 007124BF    cmp         byte ptr [edx+8],0A;TScanner.token:TToken
>007124C3    jne         007124D5
 007124C5    mov         eax,dword ptr [eax+10]
 007124C8    mov         dword ptr [edi+1C],eax
 007124CB    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007124CE    call        TScanner.Next
>007124D3    jmp         007124E5
 007124D5    mov         dl,8
 007124D7    call        TScanner.expect
>007124DC    jmp         007124E5
 007124DE    mov         dl,6
 007124E0    call        TScanner.expect
 007124E5    mov         dl,11
 007124E7    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007124EA    call        TScanner.expect
>007124EF    jmp         007126C6
 007124F4    mov         eax,edi
 007124F6    mov         edx,dword ptr ds:[67F6F8];TSmoothExpression
 007124FC    call        @IsClass
 00712501    test        al,al
>00712503    je          007125A2
 00712509    mov         dl,10
 0071250B    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071250E    call        TScanner.expect
 00712513    mov         esi,edi
 00712515    mov         dword ptr [esi+28],0A
 0071251C    mov         dl,1
 0071251E    mov         eax,ebx
 00712520    call        TParser.ParseExpression
 00712525    mov         dword ptr [esi+20],eax
 00712528    mov         dl,16
 0071252A    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071252D    call        TScanner.read
 00712532    test        al,al
>00712534    je          00712579
 00712536    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712539    cmp         byte ptr [eax+8],8;TScanner.token:TToken
>0071253D    je          00712548
 0071253F    mov         edx,dword ptr [ebx+4];TParser.s:TScanner
 00712542    cmp         byte ptr [edx+8],0A;TScanner.token:TToken
>00712546    jne         00712558
 00712548    mov         eax,dword ptr [eax+10]
 0071254B    mov         dword ptr [edi+28],eax
 0071254E    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712551    call        TScanner.Next
>00712556    jmp         0071255F
 00712558    mov         dl,8
 0071255A    call        TScanner.expect
 0071255F    mov         dl,16
 00712561    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712564    call        TScanner.read
 00712569    test        al,al
>0071256B    je          00712579
 0071256D    mov         dl,1
 0071256F    mov         eax,ebx
 00712571    call        TParser.ParseExpression
 00712576    mov         dword ptr [edi+2C],eax
 00712579    cmp         dword ptr [edi+28],3C
>0071257D    jle         00712588
 0071257F    mov         dword ptr [edi+28],3C
>00712586    jmp         00712593
 00712588    cmp         dword ptr [edi+28],0
>0071258C    jge         00712593
 0071258E    xor         eax,eax
 00712590    mov         dword ptr [edi+28],eax
 00712593    mov         dl,11
 00712595    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712598    call        TScanner.expect
>0071259D    jmp         007126C6
 007125A2    mov         eax,edi
 007125A4    mov         edx,dword ptr ds:[67FC7C];TKalmanExpression
 007125AA    call        @IsClass
 007125AF    test        al,al
>007125B1    je          00712686
 007125B7    mov         dl,10
 007125B9    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007125BC    call        TScanner.expect
 007125C1    mov         dl,1
 007125C3    mov         eax,ebx
 007125C5    call        TParser.ParseExpression
 007125CA    mov         dword ptr [edi+20],eax
 007125CD    mov         dl,16
 007125CF    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007125D2    call        TScanner.read
 007125D7    test        al,al
>007125D9    je          00712616
 007125DB    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007125DE    cmp         byte ptr [eax+8],9;TScanner.token:TToken
>007125E2    je          007125F6
 007125E4    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007125E7    cmp         byte ptr [eax+8],0A;TScanner.token:TToken
>007125EB    je          007125F6
 007125ED    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007125F0    cmp         byte ptr [eax+8],8;TScanner.token:TToken
>007125F4    jne         0071260C
 007125F6    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007125F9    fld         qword ptr [eax+18]
 007125FC    fmul        st,st(0)
 007125FE    fstp        qword ptr [edi+30]
 00712601    wait
 00712602    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712605    call        TScanner.Next
>0071260A    jmp         00712616
 0071260C    mov         dl,9
 0071260E    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712611    call        TScanner.expect
 00712616    mov         dl,16
 00712618    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071261B    call        TScanner.read
 00712620    test        al,al
>00712622    je          0071265F
 00712624    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712627    cmp         byte ptr [eax+8],9;TScanner.token:TToken
>0071262B    je          0071263F
 0071262D    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712630    cmp         byte ptr [eax+8],0A;TScanner.token:TToken
>00712634    je          0071263F
 00712636    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712639    cmp         byte ptr [eax+8],8;TScanner.token:TToken
>0071263D    jne         00712655
 0071263F    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712642    fld         qword ptr [eax+18]
 00712645    fmul        st,st(0)
 00712647    fstp        qword ptr [edi+38]
 0071264A    wait
 0071264B    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071264E    call        TScanner.Next
>00712653    jmp         0071265F
 00712655    mov         dl,9
 00712657    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071265A    call        TScanner.expect
 0071265F    push        dword ptr [edi+34]
 00712662    push        dword ptr [edi+30]
 00712665    push        dword ptr [edi+3C]
 00712668    push        dword ptr [edi+38]
 0071266B    push        3FF00000
 00712670    push        0
 00712672    lea         eax,[edi+28]
 00712675    call        005C4280
 0071267A    mov         dl,11
 0071267C    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071267F    call        TScanner.expect
>00712684    jmp         007126C6
 00712686    mov         eax,edi
 00712688    mov         edx,dword ptr ds:[66FAE8];TMathsFunction
 0071268E    call        @IsClass
 00712693    test        al,al
>00712695    je          007126C6
 00712697    mov         dl,10
 00712699    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071269C    call        TScanner.read
 007126A1    test        al,al
>007126A3    je          007126C6
 007126A5    mov         eax,edi
 007126A7    mov         edx,dword ptr ds:[66FAE8];TMathsFunction
 007126AD    call        @AsClass
 007126B2    mov         edx,dword ptr [eax+18];TMathsFunction.Parameters:TObjectList
 007126B5    mov         eax,ebx
 007126B7    call        TParser.ParseParamListWithoutBrackets
 007126BC    mov         dl,11
 007126BE    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007126C1    call        TScanner.expect
 007126C6    mov         eax,edi
 007126C8    mov         edx,dword ptr ds:[67F010];TUpdatingExpression
 007126CE    call        @IsClass
 007126D3    test        al,al
>007126D5    je          00712716
 007126D7    mov         eax,[0078D418];^gvar_0081ECE0:TObjectList
 007126DC    mov         eax,dword ptr [eax]
 007126DE    mov         edx,edi
 007126E0    call        TList.Add
>007126E5    jmp         00712716
 007126E7    lea         edx,[ebp-1C]
 007126EA    lea         eax,[esi+8];TScanner.token:TToken
 007126ED    call        0057F00C
 007126F2    mov         ecx,dword ptr [ebp-1C]
 007126F5    lea         eax,[ebp-18]
 007126F8    mov         edx,7129D4;'Value expected, instead of '
 007126FD    call        @UStrCat3
 00712702    mov         ecx,dword ptr [ebp-18]
 00712705    mov         dl,1
 00712707    mov         eax,[00577004];ETokenExpected
 0071270C    call        Exception.Create;ETokenExpected.Create
 00712711    call        @RaiseExcept
 00712716    mov         dl,12
 00712718    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071271B    call        TScanner.read
 00712720    test        al,al
>00712722    je          007128EC
 00712728    mov         dword ptr [ebp-10],0FFFFFFFF
 0071272F    or          esi,0FFFFFFFF
 00712732    mov         edx,dword ptr [ebx+4];TParser.s:TScanner
 00712735    movzx       eax,byte ptr [edx+8];TScanner.token:TToken
 00712739    cmp         al,8
>0071273B    je          00712745
 0071273D    cmp         al,0A
>0071273F    jne         0071283A
 00712745    mov         eax,dword ptr [edx+10]
 00712748    mov         dword ptr [ebp-0C],eax
 0071274B    mov         eax,edx
 0071274D    call        TScanner.Next
 00712752    mov         dl,18
 00712754    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712757    call        TScanner.read
 0071275C    test        al,al
>0071275E    jne         0071278A
 00712760    mov         dl,1B
 00712762    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712765    call        TScanner.read
 0071276A    test        al,al
>0071276C    jne         0071278A
 0071276E    mov         dl,5A
 00712770    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712773    call        TScanner.read
 00712778    test        al,al
>0071277A    jne         0071278A
 0071277C    mov         dl,68
 0071277E    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712781    call        TScanner.read
 00712786    test        al,al
>00712788    je          007127BE
 0071278A    mov         edx,dword ptr [ebx+4];TParser.s:TScanner
 0071278D    movzx       eax,byte ptr [edx+8];TScanner.token:TToken
 00712791    cmp         al,8
>00712793    je          00712799
 00712795    cmp         al,0A
>00712797    jne         007127A8
 00712799    mov         eax,dword ptr [edx+10]
 0071279C    mov         dword ptr [ebp-10],eax
 0071279F    mov         eax,edx
 007127A1    call        TScanner.Next
>007127A6    jmp         007127BE
 007127A8    mov         ecx,712A18;'Array index expected'
 007127AD    mov         dl,1
 007127AF    mov         eax,[00577004];ETokenExpected
 007127B4    call        Exception.Create;ETokenExpected.Create
 007127B9    call        @RaiseExcept
 007127BE    mov         dl,16
 007127C0    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007127C3    call        TScanner.read
 007127C8    test        al,al
>007127CA    je          007128C2
 007127D0    mov         edx,dword ptr [ebx+4];TParser.s:TScanner
 007127D3    movzx       eax,byte ptr [edx+8];TScanner.token:TToken
 007127D7    cmp         al,8
>007127D9    je          007127DF
 007127DB    cmp         al,0A
>007127DD    jne         007127EE
 007127DF    mov         esi,dword ptr [edx+10]
 007127E2    mov         eax,edx
 007127E4    call        TScanner.Next
>007127E9    jmp         007128C2
 007127EE    mov         dl,18
 007127F0    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007127F3    call        TScanner.read
 007127F8    test        al,al
>007127FA    jne         007128C2
 00712800    mov         dl,1B
 00712802    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712805    call        TScanner.read
 0071280A    test        al,al
>0071280C    jne         007128C2
 00712812    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712815    cmp         byte ptr [eax+8],13;TScanner.token:TToken
>00712819    je          007128C2
 0071281F    mov         ecx,712A18;'Array index expected'
 00712824    mov         dl,1
 00712826    mov         eax,[00577004];ETokenExpected
 0071282B    call        Exception.Create;ETokenExpected.Create
 00712830    call        @RaiseExcept
>00712835    jmp         007128C2
 0071283A    mov         dl,16
 0071283C    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071283F    call        TScanner.read
 00712844    test        al,al
>00712846    jne         00712872
 00712848    mov         dl,18
 0071284A    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071284D    call        TScanner.read
 00712852    test        al,al
>00712854    jne         00712864
 00712856    mov         dl,1B
 00712858    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071285B    call        TScanner.read
 00712860    test        al,al
>00712862    je          007128AC
 00712864    mov         dl,16
 00712866    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712869    call        TScanner.read
 0071286E    test        al,al
>00712870    je          007128AC
 00712872    mov         dword ptr [ebp-0C],0FFFFFFFF
 00712879    mov         edx,dword ptr [ebx+4];TParser.s:TScanner
 0071287C    movzx       eax,byte ptr [edx+8];TScanner.token:TToken
 00712880    cmp         al,8
>00712882    je          00712888
 00712884    cmp         al,0A
>00712886    jne         00712894
 00712888    mov         esi,dword ptr [edx+10]
 0071288B    mov         eax,edx
 0071288D    call        TScanner.Next
>00712892    jmp         007128C2
 00712894    mov         ecx,712A50;'Column index expected'
 00712899    mov         dl,1
 0071289B    mov         eax,[00577004];ETokenExpected
 007128A0    call        Exception.Create;ETokenExpected.Create
 007128A5    call        @RaiseExcept
>007128AA    jmp         007128C2
 007128AC    mov         ecx,712A18;'Array index expected'
 007128B1    mov         dl,1
 007128B3    mov         eax,[00577004];ETokenExpected
 007128B8    call        Exception.Create;ETokenExpected.Create
 007128BD    call        @RaiseExcept
 007128C2    mov         dl,13
 007128C4    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007128C7    call        TScanner.expect
 007128CC    mov         dl,1
 007128CE    mov         eax,[0068293C];TArrayExpression
 007128D3    call        TObject.Create;TArrayExpression.Create
 007128D8    mov         dword ptr [eax+18],edi;TArrayExpression.Expression:TExpression
 007128DB    mov         edx,dword ptr [ebp-0C]
 007128DE    mov         dword ptr [eax+1C],edx;TArrayExpression.Index:Integer
 007128E1    mov         edx,dword ptr [ebp-10]
 007128E4    mov         dword ptr [eax+20],edx;TArrayExpression.Index2:Integer
 007128E7    mov         dword ptr [eax+24],esi;TArrayExpression.CIndex:Integer
 007128EA    mov         edi,eax
 007128EC    mov         dl,2F
 007128EE    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007128F1    call        TScanner.read
 007128F6    test        al,al
>007128F8    je          00712913
 007128FA    mov         dl,1
 007128FC    mov         eax,[00681370];TUnaryOp
 00712901    call        TObject.Create;TUnaryOp.Create
 00712906    mov         esi,eax
 00712908    mov         byte ptr [esi+1C],20;TUnaryOp.Operation:TOperation
 0071290C    mov         dword ptr [esi+18],edi;TUnaryOp.RHS:TExpression
 0071290F    mov         edi,esi
>00712911    jmp         00712938
 00712913    mov         dl,30
 00712915    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712918    call        TScanner.read
 0071291D    test        al,al
>0071291F    je          00712938
 00712921    mov         dl,1
 00712923    mov         eax,[00681370];TUnaryOp
 00712928    call        TObject.Create;TUnaryOp.Create
 0071292D    mov         esi,eax
 0071292F    mov         byte ptr [esi+1C],21;TUnaryOp.Operation:TOperation
 00712933    mov         dword ptr [esi+18],edi;TUnaryOp.RHS:TExpression
 00712936    mov         edi,esi
 00712938    mov         dl,2E
 0071293A    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071293D    call        TScanner.read
 00712942    test        al,al
>00712944    je          0071295D
 00712946    mov         dl,1
 00712948    mov         eax,[00681370];TUnaryOp
 0071294D    call        TObject.Create;TUnaryOp.Create
 00712952    mov         esi,eax
 00712954    mov         byte ptr [esi+1C],1E;TUnaryOp.Operation:TOperation
 00712958    mov         dword ptr [esi+18],edi;TUnaryOp.RHS:TExpression
 0071295B    mov         edi,esi
 0071295D    xor         eax,eax
 0071295F    pop         edx
 00712960    pop         ecx
 00712961    pop         ecx
 00712962    mov         dword ptr fs:[eax],edx
 00712965    push        71298F
 0071296A    lea         eax,[ebp-1C]
 0071296D    mov         edx,2
 00712972    call        @UStrArrayClr
 00712977    lea         eax,[ebp-14]
 0071297A    call        @WStrClr
 0071297F    lea         eax,[ebp-4]
 00712982    call        @UStrClr
 00712987    ret
>00712988    jmp         @HandleFinally
>0071298D    jmp         0071296A
 0071298F    mov         eax,edi
 00712991    pop         edi
 00712992    pop         esi
 00712993    pop         ebx
 00712994    mov         esp,ebp
 00712996    pop         ebp
 00712997    ret
*}
end;

//00712A7C
function TParser.ParseFactor(CanHaveEquals:Boolean):TExpression;
begin
{*
 00712A7C    push        ebp
 00712A7D    mov         ebp,esp
 00712A7F    add         esp,0FFFFFFF8
 00712A82    push        ebx
 00712A83    push        esi
 00712A84    push        edi
 00712A85    mov         byte ptr [ebp-1],dl
 00712A88    mov         ebx,eax
 00712A8A    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712A8D    mov         dl,2A
 00712A8F    call        TScanner.read
 00712A94    test        al,al
>00712A96    je          00712AAA
 00712A98    movzx       edx,byte ptr [ebp-1]
 00712A9C    mov         eax,ebx
 00712A9E    call        TParser.ParseLiteral
 00712AA3    mov         edi,eax
>00712AA5    jmp         00712D48
 00712AAA    movzx       edx,byte ptr [ebp-1]
 00712AAE    mov         eax,ebx
 00712AB0    call        TParser.ParseLiteral
 00712AB5    mov         edi,eax
 00712AB7    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712ABA    mov         dl,2D
 00712ABC    call        TScanner.read
 00712AC1    test        al,al
>00712AC3    je          00712B2F
 00712AC5    mov         dl,1
 00712AC7    mov         eax,[00680DF8];TBinaryOp
 00712ACC    call        TObject.Create;TBinaryOp.Create
 00712AD1    mov         dword ptr [ebp-8],eax
 00712AD4    xor         eax,eax
 00712AD6    push        ebp
 00712AD7    push        712B18
 00712ADC    push        dword ptr fs:[eax]
 00712ADF    mov         dword ptr fs:[eax],esp
 00712AE2    mov         eax,dword ptr [ebp-8]
 00712AE5    mov         dword ptr [eax+18],edi;TBinaryOp.LHS:TExpression
 00712AE8    movzx       edx,byte ptr [ebp-1]
 00712AEC    mov         eax,ebx
 00712AEE    call        TParser.ParseLiteral
 00712AF3    mov         edx,dword ptr [ebp-8]
 00712AF6    mov         dword ptr [edx+1C],eax;TBinaryOp.RHS:TExpression
 00712AF9    mov         eax,dword ptr [ebp-8]
 00712AFC    mov         byte ptr [eax+20],4;TBinaryOp.Operation:TOperation
 00712B00    mov         edi,dword ptr [ebp-8]
 00712B03    xor         eax,eax
 00712B05    pop         edx
 00712B06    pop         ecx
 00712B07    pop         ecx
 00712B08    mov         dword ptr fs:[eax],edx
>00712B0B    jmp         00712D48
 00712B10    xor         eax,eax
 00712B12    pop         edx
 00712B13    pop         ecx
 00712B14    pop         ecx
 00712B15    mov         dword ptr fs:[eax],edx
>00712B18    jmp         @HandleAnyException
 00712B1D    lea         eax,[ebp-8]
 00712B20    call        004F9A38
 00712B25    call        @RaiseAgain
 00712B2A    call        @DoneExcept
 00712B2F    xor         esi,esi
>00712B31    jmp         00712B34
 00712B33    inc         esi
 00712B34    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712B37    mov         dl,2C
 00712B39    call        TScanner.read
 00712B3E    test        al,al
>00712B40    jne         00712B33
 00712B42    test        esi,esi
>00712B44    jne         00712BFD
 00712B4A    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712B4D    cmp         byte ptr [eax+8],0F;TScanner.token:TToken
>00712B51    jne         00712BDC
 00712B57    mov         dl,1
 00712B59    mov         eax,[00680DF8];TBinaryOp
 00712B5E    call        TObject.Create;TBinaryOp.Create
 00712B63    mov         dword ptr [ebp-8],eax
 00712B66    xor         eax,eax
 00712B68    push        ebp
 00712B69    push        712BC0
 00712B6E    push        dword ptr fs:[eax]
 00712B71    mov         dword ptr fs:[eax],esp
 00712B74    mov         eax,dword ptr [ebp-8]
 00712B77    mov         dword ptr [eax+18],edi;TBinaryOp.LHS:TExpression
 00712B7A    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712B7D    fild        qword ptr [eax+10]
 00712B80    add         esp,0FFFFFFF8
 00712B83    fstp        qword ptr [esp]
 00712B86    wait
 00712B87    mov         dl,1
 00712B89    mov         eax,[006808C0];TConstant
 00712B8E    call        TConstant.Create;TConstant.Create
 00712B93    mov         edx,dword ptr [ebp-8]
 00712B96    mov         dword ptr [edx+1C],eax;TBinaryOp.RHS:TExpression
 00712B99    mov         eax,dword ptr [ebp-8]
 00712B9C    mov         byte ptr [eax+20],4;TBinaryOp.Operation:TOperation
 00712BA0    mov         edi,dword ptr [ebp-8]
 00712BA3    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712BA6    call        TScanner.Next
 00712BAB    xor         eax,eax
 00712BAD    pop         edx
 00712BAE    pop         ecx
 00712BAF    pop         ecx
 00712BB0    mov         dword ptr fs:[eax],edx
>00712BB3    jmp         00712D48
 00712BB8    xor         eax,eax
 00712BBA    pop         edx
 00712BBB    pop         ecx
 00712BBC    pop         ecx
 00712BBD    mov         dword ptr fs:[eax],edx
>00712BC0    jmp         @HandleAnyException
 00712BC5    lea         eax,[ebp-8]
 00712BC8    call        004F9A38
 00712BCD    call        @RaiseAgain
 00712BD2    call        @DoneExcept
>00712BD7    jmp         00712D48
 00712BDC    mov         eax,edi
 00712BDE    mov         edx,dword ptr ds:[6808C0];TConstant
 00712BE4    call        @IsClass
 00712BE9    test        al,al
>00712BEB    je          00712D48
 00712BF1    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712BF4    cmp         byte ptr [eax+8],3;TScanner.token:TToken
>00712BF8    jmp         00712D48
 00712BFD    cmp         esi,2
>00712C00    jg          00712D48
 00712C06    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712C09    movzx       eax,byte ptr [eax+8];TScanner.token:TToken
 00712C0D    cmp         eax,23
>00712C10    ja          00712D48
 00712C16    movzx       eax,byte ptr [eax+712C24]
 00712C1D    jmp         dword ptr [eax*4+712C48]
 00712C1D    db          0
 00712C1D    db          0
 00712C1D    db          0
 00712C1D    db          1
 00712C1D    db          0
 00712C1D    db          1
 00712C1D    db          1
 00712C1D    db          0
 00712C1D    db          1
 00712C1D    db          1
 00712C1D    db          1
 00712C1D    db          1
 00712C1D    db          1
 00712C1D    db          1
 00712C1D    db          1
 00712C1D    db          2
 00712C1D    db          1
 00712C1D    db          0
 00712C1D    db          1
 00712C1D    db          0
 00712C1D    db          1
 00712C1D    db          0
 00712C1D    db          0
 00712C1D    db          0
 00712C1D    db          0
 00712C1D    db          0
 00712C1D    db          0
 00712C1D    db          0
 00712C1D    db          0
 00712C1D    db          0
 00712C1D    db          0
 00712C1D    db          0
 00712C1D    db          0
 00712C1D    db          0
 00712C1D    db          0
 00712C1D    db          1
 00712C1D    dd          00712D48
 00712C1D    dd          00712C54
 00712C1D    dd          00712CC7
 00712C54    mov         dl,1
 00712C56    mov         eax,[00680DF8];TBinaryOp
 00712C5B    call        TObject.Create;TBinaryOp.Create
 00712C60    mov         dword ptr [ebp-8],eax
 00712C63    xor         eax,eax
 00712C65    push        ebp
 00712C66    push        712CAB
 00712C6B    push        dword ptr fs:[eax]
 00712C6E    mov         dword ptr fs:[eax],esp
 00712C71    mov         eax,dword ptr [ebp-8]
 00712C74    mov         dword ptr [eax+18],edi;TBinaryOp.LHS:TExpression
 00712C77    movzx       edx,byte ptr [ebp-1]
 00712C7B    mov         eax,ebx
 00712C7D    call        TParser.ParseLiteral
 00712C82    mov         edx,dword ptr [ebp-8]
 00712C85    mov         dword ptr [edx+1C],eax;TBinaryOp.RHS:TExpression
 00712C88    dec         esi
>00712C89    jne         00712C94
 00712C8B    mov         eax,dword ptr [ebp-8]
 00712C8E    mov         byte ptr [eax+20],4;TBinaryOp.Operation:TOperation
>00712C92    jmp         00712C9B
 00712C94    mov         eax,dword ptr [ebp-8]
 00712C97    mov         byte ptr [eax+20],22;TBinaryOp.Operation:TOperation
 00712C9B    mov         edi,dword ptr [ebp-8]
 00712C9E    xor         eax,eax
 00712CA0    pop         edx
 00712CA1    pop         ecx
 00712CA2    pop         ecx
 00712CA3    mov         dword ptr fs:[eax],edx
>00712CA6    jmp         00712D48
>00712CAB    jmp         @HandleAnyException
 00712CB0    lea         eax,[ebp-8]
 00712CB3    call        004F9A38
 00712CB8    call        @RaiseAgain
 00712CBD    call        @DoneExcept
>00712CC2    jmp         00712D48
 00712CC7    mov         dl,1
 00712CC9    mov         eax,[00680DF8];TBinaryOp
 00712CCE    call        TObject.Create;TBinaryOp.Create
 00712CD3    mov         dword ptr [ebp-8],eax
 00712CD6    xor         eax,eax
 00712CD8    push        ebp
 00712CD9    push        712D29
 00712CDE    push        dword ptr fs:[eax]
 00712CE1    mov         dword ptr fs:[eax],esp
 00712CE4    mov         eax,dword ptr [ebp-8]
 00712CE7    mov         dword ptr [eax+18],edi;TBinaryOp.LHS:TExpression
 00712CEA    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712CED    fild        qword ptr [eax+10]
 00712CF0    add         esp,0FFFFFFF8
 00712CF3    fstp        qword ptr [esp]
 00712CF6    wait
 00712CF7    mov         dl,1
 00712CF9    mov         eax,[006808C0];TConstant
 00712CFE    call        TConstant.Create;TConstant.Create
 00712D03    mov         edx,dword ptr [ebp-8]
 00712D06    mov         dword ptr [edx+1C],eax;TBinaryOp.RHS:TExpression
 00712D09    dec         esi
>00712D0A    jne         00712D15
 00712D0C    mov         eax,dword ptr [ebp-8]
 00712D0F    mov         byte ptr [eax+20],4;TBinaryOp.Operation:TOperation
>00712D13    jmp         00712D1C
 00712D15    mov         eax,dword ptr [ebp-8]
 00712D18    mov         byte ptr [eax+20],22;TBinaryOp.Operation:TOperation
 00712D1C    mov         edi,dword ptr [ebp-8]
 00712D1F    xor         eax,eax
 00712D21    pop         edx
 00712D22    pop         ecx
 00712D23    pop         ecx
 00712D24    mov         dword ptr fs:[eax],edx
>00712D27    jmp         00712D40
>00712D29    jmp         @HandleAnyException
 00712D2E    lea         eax,[ebp-8]
 00712D31    call        004F9A38
 00712D36    call        @RaiseAgain
 00712D3B    call        @DoneExcept
 00712D40    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00712D43    call        TScanner.Next
 00712D48    mov         eax,edi
 00712D4A    pop         edi
 00712D4B    pop         esi
 00712D4C    pop         ebx
 00712D4D    pop         ecx
 00712D4E    pop         ecx
 00712D4F    pop         ebp
 00712D50    ret
*}
end;

//00712D54
function TParser.ParseProduct(StartingFactor:TExpression; CanHaveEquals:Boolean):TExpression;
begin
{*
 00712D54    push        ebp
 00712D55    mov         ebp,esp
 00712D57    push        0
 00712D59    push        0
 00712D5B    push        0
 00712D5D    push        0
 00712D5F    push        0
 00712D61    push        0
 00712D63    push        0
 00712D65    push        ebx
 00712D66    push        esi
 00712D67    push        edi
 00712D68    mov         byte ptr [ebp-5],cl
 00712D6B    mov         esi,eax
 00712D6D    xor         eax,eax
 00712D6F    push        ebp
 00712D70    push        71306C
 00712D75    push        dword ptr fs:[eax]
 00712D78    mov         dword ptr fs:[eax],esp
 00712D7B    test        edx,edx
>00712D7D    jne         00712D8E
 00712D7F    movzx       edx,byte ptr [ebp-5]
 00712D83    mov         eax,esi
 00712D85    call        TParser.ParseFactorWithUnits
 00712D8A    mov         edi,eax
>00712D8C    jmp         00712D90
 00712D8E    mov         edi,edx
 00712D90    mov         ebx,dword ptr [esi+4];TParser.s:TScanner
 00712D93    cmp         byte ptr [ebx+8],3;TScanner.token:TToken
>00712D97    jne         00712E0A
 00712D99    lea         edx,[ebp-4]
 00712D9C    mov         eax,dword ptr [ebx+0C]
 00712D9F    call        LowerCase
 00712DA4    mov         eax,dword ptr [ebp-4]
 00712DA7    mov         edx,713088;'times'
 00712DAC    call        @UStrEqual
>00712DB1    je          00712DC2
 00712DB3    mov         eax,dword ptr [ebp-4]
 00712DB6    mov         edx,7130A0;'cross'
 00712DBB    call        @UStrEqual
>00712DC0    jne         00712DCB
 00712DC2    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00712DC5    mov         byte ptr [eax+8],24;TScanner.token:TToken
>00712DC9    jmp         00712E0A
 00712DCB    mov         eax,edi
 00712DCD    mov         edx,dword ptr ds:[670104];TProcedureExpression
 00712DD3    call        @IsClass
 00712DD8    test        al,al
>00712DDA    jne         00712E0A
 00712DDC    mov         eax,dword ptr [ebp-4]
 00712DDF    mov         edx,7130B8;'dot'
 00712DE4    call        @UStrEqual
>00712DE9    jne         00712DF4
 00712DEB    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00712DEE    mov         byte ptr [eax+8],1C;TScanner.token:TToken
>00712DF2    jmp         00712E0A
 00712DF4    mov         eax,dword ptr [ebp-4]
 00712DF7    mov         edx,7130CC;'x'
 00712DFC    call        @UStrEqual
>00712E01    jne         00712E0A
 00712E03    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00712E06    mov         byte ptr [eax+8],24;TScanner.token:TToken
 00712E0A    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00712E0D    mov         edx,7130DC;'divided'
 00712E12    call        TScanner.ReadIdentifier
 00712E17    test        al,al
>00712E19    je          00712E54
 00712E1B    mov         ebx,dword ptr [esi+4];TParser.s:TScanner
 00712E1E    cmp         byte ptr [ebx+8],3;TScanner.token:TToken
>00712E22    jne         00712E47
 00712E24    lea         edx,[ebp-10]
 00712E27    mov         eax,dword ptr [ebx+0C]
 00712E2A    call        LowerCase
 00712E2F    mov         eax,dword ptr [ebp-10]
 00712E32    mov         edx,7130F8;'by'
 00712E37    call        @UStrEqual
>00712E3C    jne         00712E47
 00712E3E    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00712E41    mov         byte ptr [eax+8],25;TScanner.token:TToken
>00712E45    jmp         00712E54
 00712E47    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00712E4A    mov         edx,7130F8;'by'
 00712E4F    call        TScanner.ExpectIdentifier
 00712E54    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00712E57    mov         edx,71310C;'multiplied'
 00712E5C    call        TScanner.ReadIdentifier
 00712E61    test        al,al
>00712E63    je          00712E9E
 00712E65    mov         ebx,dword ptr [esi+4];TParser.s:TScanner
 00712E68    cmp         byte ptr [ebx+8],3;TScanner.token:TToken
>00712E6C    jne         00712E91
 00712E6E    lea         edx,[ebp-14]
 00712E71    mov         eax,dword ptr [ebx+0C]
 00712E74    call        LowerCase
 00712E79    mov         eax,dword ptr [ebp-14]
 00712E7C    mov         edx,7130F8;'by'
 00712E81    call        @UStrEqual
>00712E86    jne         00712E91
 00712E88    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00712E8B    mov         byte ptr [eax+8],24;TScanner.token:TToken
>00712E8F    jmp         00712E9E
 00712E91    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00712E94    mov         edx,7130F8;'by'
 00712E99    call        TScanner.ExpectIdentifier
 00712E9E    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00712EA1    movzx       eax,byte ptr [eax+8];TScanner.token:TToken
 00712EA5    cmp         al,24
>00712EA7    je          00712EBC
 00712EA9    cmp         al,25
>00712EAB    je          00712EBC
 00712EAD    cmp         al,1C
>00712EAF    je          00712EBC
 00712EB1    cmp         al,4
>00712EB3    je          00712EBC
 00712EB5    mov         ebx,edi
>00712EB7    jmp         00713039
 00712EBC    xor         eax,eax
 00712EBE    push        ebp
 00712EBF    push        71301F
 00712EC4    push        dword ptr fs:[eax]
 00712EC7    mov         dword ptr fs:[eax],esp
>00712ECA    jmp         00712FEA
 00712ECF    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00712ED2    mov         dl,25
 00712ED4    call        TScanner.read
 00712ED9    test        al,al
>00712EDB    je          00712F0F
 00712EDD    mov         dl,1
 00712EDF    mov         eax,[00680DF8];TBinaryOp
 00712EE4    call        TObject.Create;TBinaryOp.Create
 00712EE9    mov         dword ptr [ebp-0C],eax
 00712EEC    mov         eax,dword ptr [ebp-0C]
 00712EEF    mov         dword ptr [eax+18],edi;TBinaryOp.LHS:TExpression
 00712EF2    movzx       edx,byte ptr [ebp-5]
 00712EF6    mov         eax,esi
 00712EF8    call        TParser.ParseFactorWithUnits
 00712EFD    mov         edx,dword ptr [ebp-0C]
 00712F00    mov         dword ptr [edx+1C],eax;TBinaryOp.RHS:TExpression
 00712F03    mov         eax,dword ptr [ebp-0C]
 00712F06    mov         byte ptr [eax+20],3;TBinaryOp.Operation:TOperation
>00712F0A    jmp         00712FE7
 00712F0F    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00712F12    mov         dl,24
 00712F14    call        TScanner.read
 00712F19    test        al,al
>00712F1B    je          00712F4F
 00712F1D    mov         dl,1
 00712F1F    mov         eax,[00680DF8];TBinaryOp
 00712F24    call        TObject.Create;TBinaryOp.Create
 00712F29    mov         dword ptr [ebp-0C],eax
 00712F2C    mov         eax,dword ptr [ebp-0C]
 00712F2F    mov         dword ptr [eax+18],edi;TBinaryOp.LHS:TExpression
 00712F32    movzx       edx,byte ptr [ebp-5]
 00712F36    mov         eax,esi
 00712F38    call        TParser.ParseFactorWithUnits
 00712F3D    mov         edx,dword ptr [ebp-0C]
 00712F40    mov         dword ptr [edx+1C],eax;TBinaryOp.RHS:TExpression
 00712F43    mov         eax,dword ptr [ebp-0C]
 00712F46    mov         byte ptr [eax+20],2;TBinaryOp.Operation:TOperation
>00712F4A    jmp         00712FE7
 00712F4F    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00712F52    mov         dl,1C
 00712F54    call        TScanner.read
 00712F59    test        al,al
>00712F5B    je          00712F8C
 00712F5D    mov         dl,1
 00712F5F    mov         eax,[00680DF8];TBinaryOp
 00712F64    call        TObject.Create;TBinaryOp.Create
 00712F69    mov         dword ptr [ebp-0C],eax
 00712F6C    mov         eax,dword ptr [ebp-0C]
 00712F6F    mov         dword ptr [eax+18],edi;TBinaryOp.LHS:TExpression
 00712F72    movzx       edx,byte ptr [ebp-5]
 00712F76    mov         eax,esi
 00712F78    call        TParser.ParseFactorWithUnits
 00712F7D    mov         edx,dword ptr [ebp-0C]
 00712F80    mov         dword ptr [edx+1C],eax;TBinaryOp.RHS:TExpression
 00712F83    mov         eax,dword ptr [ebp-0C]
 00712F86    mov         byte ptr [eax+20],1F;TBinaryOp.Operation:TOperation
>00712F8A    jmp         00712FE7
 00712F8C    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00712F8F    cmp         byte ptr [eax+8],4;TScanner.token:TToken
>00712F93    jne         00712FE7
 00712F95    mov         dl,1
 00712F97    mov         eax,[00680DF8];TBinaryOp
 00712F9C    call        TObject.Create;TBinaryOp.Create
 00712FA1    mov         dword ptr [ebp-0C],eax
 00712FA4    mov         eax,dword ptr [ebp-0C]
 00712FA7    mov         dword ptr [eax+18],edi;TBinaryOp.LHS:TExpression
 00712FAA    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00712FAD    mov         ecx,dword ptr [eax+0C]
 00712FB0    lea         eax,[ebp-1C]
 00712FB3    mov         edx,713130;'math.'
 00712FB8    call        @UStrCat3
 00712FBD    mov         edx,dword ptr [ebp-1C]
 00712FC0    lea         eax,[ebp-18]
 00712FC3    call        @WStrFromUStr
 00712FC8    mov         eax,dword ptr [ebp-18]
 00712FCB    xor         edx,edx
 00712FCD    call        00710FA4
 00712FD2    mov         edx,dword ptr [ebp-0C]
 00712FD5    mov         dword ptr [edx+1C],eax;TBinaryOp.RHS:TExpression
 00712FD8    mov         eax,dword ptr [ebp-0C]
 00712FDB    mov         byte ptr [eax+20],2;TBinaryOp.Operation:TOperation
 00712FDF    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00712FE2    call        TScanner.Next
 00712FE7    mov         edi,dword ptr [ebp-0C]
 00712FEA    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00712FED    movzx       ebx,byte ptr [eax+8];TScanner.token:TToken
 00712FF1    cmp         bl,24
>00712FF4    je          00712ECF
 00712FFA    cmp         bl,25
>00712FFD    je          00712ECF
 00713003    cmp         bl,1C
>00713006    je          00712ECF
 0071300C    cmp         bl,4
>0071300F    je          00712ECF
 00713015    xor         eax,eax
 00713017    pop         edx
 00713018    pop         ecx
 00713019    pop         ecx
 0071301A    mov         dword ptr fs:[eax],edx
>0071301D    jmp         00713036
>0071301F    jmp         @HandleAnyException
 00713024    lea         eax,[ebp-0C]
 00713027    call        004F9A38
 0071302C    call        @RaiseAgain
 00713031    call        @DoneExcept
 00713036    mov         ebx,dword ptr [ebp-0C]
 00713039    xor         eax,eax
 0071303B    pop         edx
 0071303C    pop         ecx
 0071303D    pop         ecx
 0071303E    mov         dword ptr fs:[eax],edx
 00713041    push        713073
 00713046    lea         eax,[ebp-1C]
 00713049    call        @UStrClr
 0071304E    lea         eax,[ebp-18]
 00713051    call        @WStrClr
 00713056    lea         eax,[ebp-14]
 00713059    mov         edx,2
 0071305E    call        @UStrArrayClr
 00713063    lea         eax,[ebp-4]
 00713066    call        @UStrClr
 0071306B    ret
>0071306C    jmp         @HandleFinally
>00713071    jmp         00713046
 00713073    mov         eax,ebx
 00713075    pop         edi
 00713076    pop         esi
 00713077    pop         ebx
 00713078    mov         esp,ebp
 0071307A    pop         ebp
 0071307B    ret
*}
end;

//0071313C
function TParser.ParseSummation(StartingFactor:TExpression; CanHaveEquals:Boolean):TExpression;
begin
{*
 0071313C    push        ebp
 0071313D    mov         ebp,esp
 0071313F    push        0
 00713141    push        0
 00713143    push        0
 00713145    push        0
 00713147    push        0
 00713149    push        0
 0071314B    push        ebx
 0071314C    push        esi
 0071314D    push        edi
 0071314E    mov         byte ptr [ebp-1],cl
 00713151    mov         esi,edx
 00713153    mov         edi,eax
 00713155    xor         eax,eax
 00713157    push        ebp
 00713158    push        7133B4
 0071315D    push        dword ptr fs:[eax]
 00713160    mov         dword ptr fs:[eax],esp
 00713163    test        esi,esi
>00713165    jne         00713175
 00713167    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071316A    mov         dl,23
 0071316C    call        TScanner.read
 00713171    mov         ebx,eax
>00713173    jmp         00713177
 00713175    xor         ebx,ebx
 00713177    movzx       ecx,byte ptr [ebp-1]
 0071317B    mov         edx,esi
 0071317D    mov         eax,edi
 0071317F    call        TParser.ParseProduct
 00713184    mov         esi,eax
 00713186    mov         eax,esi
 00713188    mov         edx,dword ptr ds:[670104];TProcedureExpression
 0071318E    call        @IsClass
 00713193    test        al,al
>00713195    jne         007131F3
 00713197    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071319A    cmp         byte ptr [eax+8],3;TScanner.token:TToken
>0071319E    jne         007131C6
 007131A0    lea         edx,[ebp-0C]
 007131A3    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 007131A6    mov         eax,dword ptr [eax+0C]
 007131A9    call        LowerCase
 007131AE    mov         eax,dword ptr [ebp-0C]
 007131B1    mov         edx,7133D0;'plus'
 007131B6    call        @UStrEqual
>007131BB    jne         007131C6
 007131BD    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 007131C0    mov         byte ptr [eax+8],22;TScanner.token:TToken
>007131C4    jmp         007131F3
 007131C6    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 007131C9    cmp         byte ptr [eax+8],3;TScanner.token:TToken
>007131CD    jne         007131F3
 007131CF    lea         edx,[ebp-10]
 007131D2    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 007131D5    mov         eax,dword ptr [eax+0C]
 007131D8    call        LowerCase
 007131DD    mov         eax,dword ptr [ebp-10]
 007131E0    mov         edx,7133E8;'minus'
 007131E5    call        @UStrEqual
>007131EA    jne         007131F3
 007131EC    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 007131EF    mov         byte ptr [eax+8],23;TScanner.token:TToken
 007131F3    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 007131F6    movzx       eax,byte ptr [eax+8];TScanner.token:TToken
 007131FA    cmp         al,22
>007131FC    je          00713230
 007131FE    cmp         al,23
>00713200    je          00713230
 00713202    test        bl,bl
>00713204    je          00713229
 00713206    mov         eax,esi
 00713208    mov         edx,dword ptr ds:[6808C0];TConstant
 0071320E    call        @IsClass
 00713213    test        al,al
>00713215    je          00713230
 00713217    mov         eax,esi
 00713219    fld         qword ptr [eax+18]
 0071321C    fchs
 0071321E    fstp        qword ptr [eax+18]
 00713221    wait
 00713222    mov         ebx,esi
>00713224    jmp         00713399
 00713229    mov         ebx,esi
>0071322B    jmp         00713399
 00713230    xor         eax,eax
 00713232    push        ebp
 00713233    push        71337F
 00713238    push        dword ptr fs:[eax]
 0071323B    mov         dword ptr fs:[eax],esp
 0071323E    test        bl,bl
>00713240    je          0071335C
 00713246    mov         ecx,713400;'0'
 0071324B    mov         dl,1
 0071324D    mov         eax,[006808C0];TConstant
 00713252    call        TConstant.Create;TConstant.Create
 00713257    mov         ebx,eax
 00713259    mov         dl,1
 0071325B    mov         eax,[00680DF8];TBinaryOp
 00713260    call        TObject.Create;TBinaryOp.Create
 00713265    mov         dword ptr [ebp-8],eax
 00713268    mov         eax,dword ptr [ebp-8]
 0071326B    mov         dword ptr [eax+18],ebx;TBinaryOp.LHS:TExpression
 0071326E    mov         eax,dword ptr [ebp-8]
 00713271    mov         dword ptr [eax+1C],esi;TBinaryOp.RHS:TExpression
 00713274    mov         eax,dword ptr [ebp-8]
 00713277    mov         byte ptr [eax+20],1;TBinaryOp.Operation:TOperation
 0071327B    mov         esi,dword ptr [ebp-8]
>0071327E    jmp         0071335C
 00713283    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 00713286    mov         dl,23
 00713288    call        TScanner.read
 0071328D    test        al,al
>0071328F    je          007132C2
 00713291    mov         dl,1
 00713293    mov         eax,[00680DF8];TBinaryOp
 00713298    call        TObject.Create;TBinaryOp.Create
 0071329D    mov         dword ptr [ebp-8],eax
 007132A0    mov         eax,dword ptr [ebp-8]
 007132A3    mov         dword ptr [eax+18],esi;TBinaryOp.LHS:TExpression
 007132A6    movzx       ecx,byte ptr [ebp-1]
 007132AA    xor         edx,edx
 007132AC    mov         eax,edi
 007132AE    call        TParser.ParseProduct
 007132B3    mov         edx,dword ptr [ebp-8]
 007132B6    mov         dword ptr [edx+1C],eax;TBinaryOp.RHS:TExpression
 007132B9    mov         eax,dword ptr [ebp-8]
 007132BC    mov         byte ptr [eax+20],1;TBinaryOp.Operation:TOperation
>007132C0    jmp         007132FF
 007132C2    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 007132C5    mov         dl,22
 007132C7    call        TScanner.read
 007132CC    test        al,al
>007132CE    je          007132FF
 007132D0    mov         dl,1
 007132D2    mov         eax,[00680DF8];TBinaryOp
 007132D7    call        TObject.Create;TBinaryOp.Create
 007132DC    mov         dword ptr [ebp-8],eax
 007132DF    mov         eax,dword ptr [ebp-8]
 007132E2    mov         dword ptr [eax+18],esi;TBinaryOp.LHS:TExpression
 007132E5    movzx       ecx,byte ptr [ebp-1]
 007132E9    xor         edx,edx
 007132EB    mov         eax,edi
 007132ED    call        TParser.ParseProduct
 007132F2    mov         edx,dword ptr [ebp-8]
 007132F5    mov         dword ptr [edx+1C],eax;TBinaryOp.RHS:TExpression
 007132F8    mov         eax,dword ptr [ebp-8]
 007132FB    mov         byte ptr [eax+20],0;TBinaryOp.Operation:TOperation
 007132FF    mov         esi,dword ptr [ebp-8]
 00713302    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 00713305    cmp         byte ptr [eax+8],3;TScanner.token:TToken
>00713309    jne         0071332F
 0071330B    lea         edx,[ebp-14]
 0071330E    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 00713311    mov         eax,dword ptr [eax+0C]
 00713314    call        LowerCase
 00713319    mov         eax,dword ptr [ebp-14]
 0071331C    mov         edx,7133D0;'plus'
 00713321    call        @UStrEqual
>00713326    jne         0071332F
 00713328    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071332B    mov         byte ptr [eax+8],22;TScanner.token:TToken
 0071332F    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 00713332    cmp         byte ptr [eax+8],3;TScanner.token:TToken
>00713336    jne         0071335C
 00713338    lea         edx,[ebp-18]
 0071333B    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071333E    mov         eax,dword ptr [eax+0C]
 00713341    call        LowerCase
 00713346    mov         eax,dword ptr [ebp-18]
 00713349    mov         edx,7133E8;'minus'
 0071334E    call        @UStrEqual
>00713353    jne         0071335C
 00713355    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 00713358    mov         byte ptr [eax+8],23;TScanner.token:TToken
 0071335C    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071335F    movzx       ebx,byte ptr [eax+8];TScanner.token:TToken
 00713363    cmp         bl,22
>00713366    je          00713283
 0071336C    cmp         bl,23
>0071336F    je          00713283
 00713375    xor         eax,eax
 00713377    pop         edx
 00713378    pop         ecx
 00713379    pop         ecx
 0071337A    mov         dword ptr fs:[eax],edx
>0071337D    jmp         00713396
>0071337F    jmp         @HandleAnyException
 00713384    lea         eax,[ebp-8]
 00713387    call        004F9A38
 0071338C    call        @RaiseAgain
 00713391    call        @DoneExcept
 00713396    mov         ebx,dword ptr [ebp-8]
 00713399    xor         eax,eax
 0071339B    pop         edx
 0071339C    pop         ecx
 0071339D    pop         ecx
 0071339E    mov         dword ptr fs:[eax],edx
 007133A1    push        7133BB
 007133A6    lea         eax,[ebp-18]
 007133A9    mov         edx,4
 007133AE    call        @UStrArrayClr
 007133B3    ret
>007133B4    jmp         @HandleFinally
>007133B9    jmp         007133A6
 007133BB    mov         eax,ebx
 007133BD    pop         edi
 007133BE    pop         esi
 007133BF    pop         ebx
 007133C0    mov         esp,ebp
 007133C2    pop         ebp
 007133C3    ret
*}
end;

//00713404
function TParser.ParseAndSummation(StartingFactor:TExpression; CanHaveEquals:Boolean):TExpression;
begin
{*
 00713404    push        ebp
 00713405    mov         ebp,esp
 00713407    push        0
 00713409    push        0
 0071340B    push        0
 0071340D    push        0
 0071340F    push        0
 00713411    push        0
 00713413    push        ebx
 00713414    push        esi
 00713415    push        edi
 00713416    mov         byte ptr [ebp-1],cl
 00713419    mov         edi,edx
 0071341B    mov         esi,eax
 0071341D    xor         eax,eax
 0071341F    push        ebp
 00713420    push        7136AC
 00713425    push        dword ptr fs:[eax]
 00713428    mov         dword ptr fs:[eax],esp
 0071342B    test        edi,edi
>0071342D    jne         0071343D
 0071342F    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00713432    mov         dl,23
 00713434    call        TScanner.read
 00713439    mov         ebx,eax
>0071343B    jmp         0071343F
 0071343D    xor         ebx,ebx
 0071343F    movzx       ecx,byte ptr [ebp-1]
 00713443    mov         edx,edi
 00713445    mov         eax,esi
 00713447    call        TParser.ParseProduct
 0071344C    mov         edi,eax
 0071344E    mov         edx,dword ptr [esi+4];TParser.s:TScanner
 00713451    movzx       eax,byte ptr [edx+8];TScanner.token:TToken
 00713455    cmp         al,41
>00713457    je          0071345D
 00713459    cmp         al,48
>0071345B    jne         00713461
 0071345D    mov         byte ptr [edx+8],22;TScanner.token:TToken
 00713461    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00713464    cmp         byte ptr [eax+8],3;TScanner.token:TToken
>00713468    jne         0071348E
 0071346A    lea         edx,[ebp-0C]
 0071346D    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00713470    mov         eax,dword ptr [eax+0C]
 00713473    call        LowerCase
 00713478    mov         eax,dword ptr [ebp-0C]
 0071347B    mov         edx,7136C8;'plus'
 00713480    call        @UStrEqual
>00713485    jne         0071348E
 00713487    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 0071348A    mov         byte ptr [eax+8],22;TScanner.token:TToken
 0071348E    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00713491    cmp         byte ptr [eax+8],3;TScanner.token:TToken
>00713495    jne         007134BB
 00713497    lea         edx,[ebp-10]
 0071349A    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 0071349D    mov         eax,dword ptr [eax+0C]
 007134A0    call        LowerCase
 007134A5    mov         eax,dword ptr [ebp-10]
 007134A8    mov         edx,7136E0;'minus'
 007134AD    call        @UStrEqual
>007134B2    jne         007134BB
 007134B4    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 007134B7    mov         byte ptr [eax+8],23;TScanner.token:TToken
 007134BB    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 007134BE    movzx       eax,byte ptr [eax+8];TScanner.token:TToken
 007134C2    cmp         al,22
>007134C4    je          007134F8
 007134C6    cmp         al,23
>007134C8    je          007134F8
 007134CA    test        bl,bl
>007134CC    je          007134F1
 007134CE    mov         eax,edi
 007134D0    mov         edx,dword ptr ds:[6808C0];TConstant
 007134D6    call        @IsClass
 007134DB    test        al,al
>007134DD    je          007134F8
 007134DF    mov         eax,edi
 007134E1    fld         qword ptr [eax+18]
 007134E4    fchs
 007134E6    fstp        qword ptr [eax+18]
 007134E9    wait
 007134EA    mov         ebx,edi
>007134EC    jmp         00713691
 007134F1    mov         ebx,edi
>007134F3    jmp         00713691
 007134F8    xor         eax,eax
 007134FA    push        ebp
 007134FB    push        713677
 00713500    push        dword ptr fs:[eax]
 00713503    mov         dword ptr fs:[eax],esp
 00713506    test        bl,bl
>00713508    je          0071364B
 0071350E    mov         ecx,7136F8;'0'
 00713513    mov         dl,1
 00713515    mov         eax,[006808C0];TConstant
 0071351A    call        TConstant.Create;TConstant.Create
 0071351F    mov         ebx,eax
 00713521    mov         dl,1
 00713523    mov         eax,[00680DF8];TBinaryOp
 00713528    call        TObject.Create;TBinaryOp.Create
 0071352D    mov         dword ptr [ebp-8],eax
 00713530    mov         eax,dword ptr [ebp-8]
 00713533    mov         dword ptr [eax+18],ebx;TBinaryOp.LHS:TExpression
 00713536    mov         eax,dword ptr [ebp-8]
 00713539    mov         dword ptr [eax+1C],edi;TBinaryOp.RHS:TExpression
 0071353C    mov         eax,dword ptr [ebp-8]
 0071353F    mov         byte ptr [eax+20],1;TBinaryOp.Operation:TOperation
 00713543    mov         edi,dword ptr [ebp-8]
>00713546    jmp         0071364B
 0071354B    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 0071354E    mov         dl,23
 00713550    call        TScanner.read
 00713555    test        al,al
>00713557    je          0071358A
 00713559    mov         dl,1
 0071355B    mov         eax,[00680DF8];TBinaryOp
 00713560    call        TObject.Create;TBinaryOp.Create
 00713565    mov         dword ptr [ebp-8],eax
 00713568    mov         eax,dword ptr [ebp-8]
 0071356B    mov         dword ptr [eax+18],edi;TBinaryOp.LHS:TExpression
 0071356E    movzx       ecx,byte ptr [ebp-1]
 00713572    xor         edx,edx
 00713574    mov         eax,esi
 00713576    call        TParser.ParseProduct
 0071357B    mov         edx,dword ptr [ebp-8]
 0071357E    mov         dword ptr [edx+1C],eax;TBinaryOp.RHS:TExpression
 00713581    mov         eax,dword ptr [ebp-8]
 00713584    mov         byte ptr [eax+20],8;TBinaryOp.Operation:TOperation
>00713588    jmp         007135D5
 0071358A    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 0071358D    mov         dl,22
 0071358F    call        TScanner.read
 00713594    test        al,al
>00713596    jne         007135A6
 00713598    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 0071359B    mov         dl,41
 0071359D    call        TScanner.read
 007135A2    test        al,al
>007135A4    je          007135D5
 007135A6    mov         dl,1
 007135A8    mov         eax,[00680DF8];TBinaryOp
 007135AD    call        TObject.Create;TBinaryOp.Create
 007135B2    mov         dword ptr [ebp-8],eax
 007135B5    mov         eax,dword ptr [ebp-8]
 007135B8    mov         dword ptr [eax+18],edi;TBinaryOp.LHS:TExpression
 007135BB    movzx       ecx,byte ptr [ebp-1]
 007135BF    xor         edx,edx
 007135C1    mov         eax,esi
 007135C3    call        TParser.ParseProduct
 007135C8    mov         edx,dword ptr [ebp-8]
 007135CB    mov         dword ptr [edx+1C],eax;TBinaryOp.RHS:TExpression
 007135CE    mov         eax,dword ptr [ebp-8]
 007135D1    mov         byte ptr [eax+20],8;TBinaryOp.Operation:TOperation
 007135D5    mov         edi,dword ptr [ebp-8]
 007135D8    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 007135DB    cmp         byte ptr [eax+8],41;TScanner.token:TToken
>007135DF    je          007135EA
 007135E1    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 007135E4    cmp         byte ptr [eax+8],48;TScanner.token:TToken
>007135E8    jne         007135F1
 007135EA    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 007135ED    mov         byte ptr [eax+8],22;TScanner.token:TToken
 007135F1    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 007135F4    cmp         byte ptr [eax+8],3;TScanner.token:TToken
>007135F8    jne         0071361E
 007135FA    lea         edx,[ebp-14]
 007135FD    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00713600    mov         eax,dword ptr [eax+0C]
 00713603    call        LowerCase
 00713608    mov         eax,dword ptr [ebp-14]
 0071360B    mov         edx,7136C8;'plus'
 00713610    call        @UStrEqual
>00713615    jne         0071361E
 00713617    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 0071361A    mov         byte ptr [eax+8],22;TScanner.token:TToken
 0071361E    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00713621    cmp         byte ptr [eax+8],3;TScanner.token:TToken
>00713625    jne         0071364B
 00713627    lea         edx,[ebp-18]
 0071362A    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 0071362D    mov         eax,dword ptr [eax+0C]
 00713630    call        LowerCase
 00713635    mov         eax,dword ptr [ebp-18]
 00713638    mov         edx,7136E0;'minus'
 0071363D    call        @UStrEqual
>00713642    jne         0071364B
 00713644    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00713647    mov         byte ptr [eax+8],23;TScanner.token:TToken
 0071364B    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 0071364E    movzx       ebx,byte ptr [eax+8];TScanner.token:TToken
 00713652    cmp         bl,22
>00713655    je          0071354B
 0071365B    cmp         bl,23
>0071365E    je          0071354B
 00713664    cmp         bl,41
>00713667    je          0071354B
 0071366D    xor         eax,eax
 0071366F    pop         edx
 00713670    pop         ecx
 00713671    pop         ecx
 00713672    mov         dword ptr fs:[eax],edx
>00713675    jmp         0071368E
>00713677    jmp         @HandleAnyException
 0071367C    lea         eax,[ebp-8]
 0071367F    call        004F9A38
 00713684    call        @RaiseAgain
 00713689    call        @DoneExcept
 0071368E    mov         ebx,dword ptr [ebp-8]
 00713691    xor         eax,eax
 00713693    pop         edx
 00713694    pop         ecx
 00713695    pop         ecx
 00713696    mov         dword ptr fs:[eax],edx
 00713699    push        7136B3
 0071369E    lea         eax,[ebp-18]
 007136A1    mov         edx,4
 007136A6    call        @UStrArrayClr
 007136AB    ret
>007136AC    jmp         @HandleFinally
>007136B1    jmp         0071369E
 007136B3    mov         eax,ebx
 007136B5    pop         edi
 007136B6    pop         esi
 007136B7    pop         ebx
 007136B8    mov         esp,ebp
 007136BA    pop         ebp
 007136BB    ret
*}
end;

//007136FC
function TParser.ParseSTerm(StartingFactor:TExpression; CanHaveEquals:Boolean):TExpression;
begin
{*
 007136FC    push        ebx
 007136FD    push        esi
 007136FE    push        edi
 007136FF    push        ebp
 00713700    push        ecx
 00713701    mov         ebx,ecx
 00713703    mov         esi,eax
 00713705    test        edx,edx
>00713707    jne         00713716
 00713709    mov         edx,ebx
 0071370B    mov         eax,esi
 0071370D    call        TParser.ParseFactorWithUnits
 00713712    mov         edi,eax
>00713714    jmp         00713718
 00713716    mov         edi,edx
 00713718    mov         eax,edi
 0071371A    mov         edx,dword ptr ds:[681370];TUnaryOp
 00713720    call        @IsClass
 00713725    test        al,al
>00713727    je          0071372F
 00713729    cmp         byte ptr [edi+1C],1E
>0071372D    je          00713733
 0071372F    xor         eax,eax
>00713731    jmp         00713735
 00713733    mov         al,1
 00713735    mov         byte ptr [esp],al
 00713738    mov         dl,27
 0071373A    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 0071373D    call        TScanner.read
 00713742    test        al,al
>00713744    je          0071376E
 00713746    mov         dl,1
 00713748    mov         eax,[00680DF8];TBinaryOp
 0071374D    call        TObject.Create;TBinaryOp.Create
 00713752    mov         ebp,eax
 00713754    mov         dword ptr [ebp+18],edi;TBinaryOp.LHS:TExpression
 00713757    mov         edx,ebx
 00713759    mov         eax,esi
 0071375B    call        TParser.ParseFactorWithUnits
 00713760    mov         dword ptr [ebp+1C],eax;TBinaryOp.RHS:TExpression
 00713763    mov         byte ptr [ebp+20],6;TBinaryOp.Operation:TOperation
 00713767    mov         eax,ebp
>00713769    jmp         00713901
 0071376E    mov         dl,26
 00713770    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00713773    call        TScanner.read
 00713778    test        al,al
>0071377A    je          007137A4
 0071377C    mov         dl,1
 0071377E    mov         eax,[00680DF8];TBinaryOp
 00713783    call        TObject.Create;TBinaryOp.Create
 00713788    mov         ebp,eax
 0071378A    mov         dword ptr [ebp+18],edi;TBinaryOp.LHS:TExpression
 0071378D    mov         edx,ebx
 0071378F    mov         eax,esi
 00713791    call        TParser.ParseFactorWithUnits
 00713796    mov         dword ptr [ebp+1C],eax;TBinaryOp.RHS:TExpression
 00713799    mov         byte ptr [ebp+20],5;TBinaryOp.Operation:TOperation
 0071379D    mov         eax,ebp
>0071379F    jmp         00713901
 007137A4    cmp         byte ptr [esp],0
>007137A8    je          007137F1
 007137AA    mov         dl,1F
 007137AC    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 007137AF    call        TScanner.read
 007137B4    test        al,al
>007137B6    je          007137F1
 007137B8    mov         dl,1
 007137BA    mov         eax,[00680DF8];TBinaryOp
 007137BF    call        TObject.Create;TBinaryOp.Create
 007137C4    mov         ebp,eax
 007137C6    mov         eax,edi
 007137C8    mov         edx,dword ptr [eax+18]
 007137CB    mov         dword ptr [ebp+18],edx;TBinaryOp.LHS:TExpression
 007137CE    xor         edx,edx
 007137D0    mov         dword ptr [eax+18],edx
 007137D3    mov         eax,edi
 007137D5    call        TObject.Free
 007137DA    mov         edx,ebx
 007137DC    mov         eax,esi
 007137DE    call        TParser.ParseFactorWithUnits
 007137E3    mov         dword ptr [ebp+1C],eax;TBinaryOp.RHS:TExpression
 007137E6    mov         byte ptr [ebp+20],7;TBinaryOp.Operation:TOperation
 007137EA    mov         eax,ebp
>007137EC    jmp         00713901
 007137F1    mov         dl,28
 007137F3    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 007137F6    call        TScanner.read
 007137FB    test        al,al
>007137FD    je          00713827
 007137FF    mov         dl,1
 00713801    mov         eax,[00680DF8];TBinaryOp
 00713806    call        TObject.Create;TBinaryOp.Create
 0071380B    mov         ebp,eax
 0071380D    mov         dword ptr [ebp+18],edi;TBinaryOp.LHS:TExpression
 00713810    mov         edx,ebx
 00713812    mov         eax,esi
 00713814    call        TParser.ParseFactorWithUnits
 00713819    mov         dword ptr [ebp+1C],eax;TBinaryOp.RHS:TExpression
 0071381C    mov         byte ptr [ebp+20],10;TBinaryOp.Operation:TOperation
 00713820    mov         eax,ebp
>00713822    jmp         00713901
 00713827    mov         dl,29
 00713829    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 0071382C    call        TScanner.read
 00713831    test        al,al
>00713833    je          0071385D
 00713835    mov         dl,1
 00713837    mov         eax,[00680DF8];TBinaryOp
 0071383C    call        TObject.Create;TBinaryOp.Create
 00713841    mov         ebp,eax
 00713843    mov         dword ptr [ebp+18],edi;TBinaryOp.LHS:TExpression
 00713846    mov         edx,ebx
 00713848    mov         eax,esi
 0071384A    call        TParser.ParseFactorWithUnits
 0071384F    mov         dword ptr [ebp+1C],eax;TBinaryOp.RHS:TExpression
 00713852    mov         byte ptr [ebp+20],11;TBinaryOp.Operation:TOperation
 00713856    mov         eax,ebp
>00713858    jmp         00713901
 0071385D    mov         dl,2B
 0071385F    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00713862    call        TScanner.read
 00713867    test        al,al
>00713869    je          00713890
 0071386B    mov         dl,1
 0071386D    mov         eax,[00680DF8];TBinaryOp
 00713872    call        TObject.Create;TBinaryOp.Create
 00713877    mov         ebp,eax
 00713879    mov         dword ptr [ebp+18],edi;TBinaryOp.LHS:TExpression
 0071387C    mov         edx,ebx
 0071387E    mov         eax,esi
 00713880    call        TParser.ParseFactorWithUnits
 00713885    mov         dword ptr [ebp+1C],eax;TBinaryOp.RHS:TExpression
 00713888    mov         byte ptr [ebp+20],0C;TBinaryOp.Operation:TOperation
 0071388C    mov         eax,ebp
>0071388E    jmp         00713901
 00713890    mov         dl,4A
 00713892    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00713895    call        TScanner.read
 0071389A    test        al,al
>0071389C    je          007138C3
 0071389E    mov         dl,1
 007138A0    mov         eax,[00680DF8];TBinaryOp
 007138A5    call        TObject.Create;TBinaryOp.Create
 007138AA    mov         ebp,eax
 007138AC    mov         dword ptr [ebp+18],edi;TBinaryOp.LHS:TExpression
 007138AF    mov         edx,ebx
 007138B1    mov         eax,esi
 007138B3    call        TParser.ParseFactorWithUnits
 007138B8    mov         dword ptr [ebp+1C],eax;TBinaryOp.RHS:TExpression
 007138BB    mov         byte ptr [ebp+20],0D;TBinaryOp.Operation:TOperation
 007138BF    mov         eax,ebp
>007138C1    jmp         00713901
 007138C3    mov         dl,4A
 007138C5    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 007138C8    call        TScanner.read
 007138CD    test        al,al
>007138CF    je          007138F6
 007138D1    mov         dl,1
 007138D3    mov         eax,[00680DF8];TBinaryOp
 007138D8    call        TObject.Create;TBinaryOp.Create
 007138DD    mov         ebp,eax
 007138DF    mov         dword ptr [ebp+18],edi;TBinaryOp.LHS:TExpression
 007138E2    mov         edx,ebx
 007138E4    mov         eax,esi
 007138E6    call        TParser.ParseFactorWithUnits
 007138EB    mov         dword ptr [ebp+1C],eax;TBinaryOp.RHS:TExpression
 007138EE    mov         byte ptr [ebp+20],0D;TBinaryOp.Operation:TOperation
 007138F2    mov         eax,ebp
>007138F4    jmp         00713901
 007138F6    mov         ecx,ebx
 007138F8    mov         edx,edi
 007138FA    mov         eax,esi
 007138FC    call        TParser.ParseSummation
 00713901    pop         edx
 00713902    pop         ebp
 00713903    pop         edi
 00713904    pop         esi
 00713905    pop         ebx
 00713906    ret
*}
end;

//00713908
function TParser.ParseComparison(CanHaveEquals:Boolean):TExpression;
begin
{*
 00713908    push        ebx
 00713909    push        esi
 0071390A    push        edi
 0071390B    add         esp,0FFFFFFF8
 0071390E    mov         ebx,edx
 00713910    mov         edi,eax
 00713912    mov         edx,ebx
 00713914    mov         eax,edi
 00713916    call        TParser.ParseSTermInUnits
 0071391B    mov         esi,eax
 0071391D    mov         dl,1
 0071391F    mov         eax,[00680DF8];TBinaryOp
 00713924    call        TObject.Create;TBinaryOp.Create
 00713929    mov         dword ptr [esp],eax
 0071392C    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071392F    movzx       eax,byte ptr [eax+8];TScanner.token:TToken
 00713933    sub         al,4C
>00713935    je          00713945
 00713937    dec         al
>00713939    je          00713967
 0071393B    sub         al,3
>0071393D    je          00713956
 0071393F    dec         al
>00713941    je          00713978
>00713943    jmp         00713989
 00713945    mov         eax,dword ptr [esp]
 00713948    mov         byte ptr [eax+20],12
 0071394C    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071394F    call        TScanner.Next
>00713954    jmp         00713997
 00713956    mov         eax,dword ptr [esp]
 00713959    mov         byte ptr [eax+20],13
 0071395D    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 00713960    call        TScanner.Next
>00713965    jmp         00713997
 00713967    mov         eax,dword ptr [esp]
 0071396A    mov         byte ptr [eax+20],16
 0071396E    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 00713971    call        TScanner.Next
>00713976    jmp         00713997
 00713978    mov         eax,dword ptr [esp]
 0071397B    mov         byte ptr [eax+20],15
 0071397F    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 00713982    call        TScanner.Next
>00713987    jmp         00713997
 00713989    mov         eax,esp
 0071398B    call        004F9A38
 00713990    mov         eax,esi
>00713992    jmp         00713AB7
 00713997    mov         eax,dword ptr [esp]
 0071399A    mov         dword ptr [eax+18],esi
 0071399D    mov         edx,ebx
 0071399F    mov         eax,edi
 007139A1    call        TParser.ParseSTermInUnits
 007139A6    mov         edx,dword ptr [esp]
 007139A9    mov         dword ptr [edx+1C],eax
 007139AC    mov         eax,dword ptr [esp]
 007139AF    mov         edx,dword ptr [edi+4];TParser.s:TScanner
 007139B2    movzx       edx,byte ptr [edx+8];TScanner.token:TToken
 007139B6    add         dl,0B4
 007139B9    sub         dl,2
>007139BC    jb          007139CA
 007139BE    add         dl,0FE
 007139C1    sub         dl,2
>007139C4    jae         00713AB7
 007139CA    mov         dl,1
 007139CC    mov         eax,[006817D8];TRangeInequality
 007139D1    call        TObject.Create;TRangeInequality.Create
 007139D6    mov         dword ptr [esp+4],eax
 007139DA    mov         eax,dword ptr [esp+4]
 007139DE    mov         dword ptr [eax+18],esi
 007139E1    mov         eax,dword ptr [esp]
 007139E4    mov         eax,dword ptr [eax+1C]
 007139E7    mov         edx,dword ptr [esp+4]
 007139EB    mov         dword ptr [edx+1C],eax
 007139EE    mov         eax,dword ptr [esp]
 007139F1    movzx       eax,byte ptr [eax+20]
 007139F5    mov         edx,dword ptr [esp+4]
 007139F9    mov         byte ptr [edx+25],al
 007139FC    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 007139FF    movzx       eax,byte ptr [eax+8];TScanner.token:TToken
 00713A03    cmp         al,4C
>00713A05    jne         00713A11
 00713A07    mov         eax,dword ptr [esp+4]
 00713A0B    mov         byte ptr [eax+26],12
>00713A0F    jmp         00713A39
 00713A11    cmp         al,50
>00713A13    jne         00713A1F
 00713A15    mov         eax,dword ptr [esp+4]
 00713A19    mov         byte ptr [eax+26],13
>00713A1D    jmp         00713A39
 00713A1F    cmp         al,4D
>00713A21    jne         00713A2D
 00713A23    mov         eax,dword ptr [esp+4]
 00713A27    mov         byte ptr [eax+26],16
>00713A2B    jmp         00713A39
 00713A2D    cmp         al,51
>00713A2F    jne         00713A39
 00713A31    mov         eax,dword ptr [esp+4]
 00713A35    mov         byte ptr [eax+26],15
 00713A39    mov         eax,dword ptr [esp]
 00713A3C    xor         edx,edx
 00713A3E    mov         dword ptr [eax+18],edx
 00713A41    mov         eax,dword ptr [esp]
 00713A44    xor         edx,edx
 00713A46    mov         dword ptr [eax+1C],edx
 00713A49    mov         eax,esp
 00713A4B    call        004F9A38
 00713A50    mov         eax,dword ptr [esp+4]
 00713A54    movzx       eax,byte ptr [eax+26]
 00713A58    add         al,0EE
 00713A5A    sub         al,2
 00713A5C    setb        al
 00713A5F    mov         edx,dword ptr [esp+4]
 00713A63    movzx       edx,byte ptr [edx+25]
 00713A67    add         dl,0EE
 00713A6A    sub         dl,2
 00713A6D    setb        dl
 00713A70    cmp         al,dl
>00713A72    je          00713A93
 00713A74    lea         eax,[esp+4]
 00713A78    call        004F9A38
 00713A7D    mov         ecx,713ACC;'Inequalities on either side of a range must match'
 00713A82    mov         dl,1
 00713A84    mov         eax,[00576F6C];ECompiler
 00713A89    call        Exception.Create;ECompiler.Create
 00713A8E    call        @RaiseExcept
 00713A93    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 00713A96    call        TScanner.Next
 00713A9B    mov         edx,ebx
 00713A9D    mov         eax,edi
 00713A9F    call        TParser.ParseSTermInUnits
 00713AA4    mov         edx,dword ptr [esp+4]
 00713AA8    mov         dword ptr [edx+20],eax
 00713AAB    mov         eax,dword ptr [esp+4]
 00713AAF    mov         byte ptr [eax+24],0
 00713AB3    mov         eax,dword ptr [esp+4]
 00713AB7    pop         ecx
 00713AB8    pop         edx
 00713AB9    pop         edi
 00713ABA    pop         esi
 00713ABB    pop         ebx
 00713ABC    ret
*}
end;

//00713B30
function TParser.ParseReTest(LHS:TExpression; CanHaveEquals:Boolean):TExpression;
begin
{*
 00713B30    push        ebp
 00713B31    mov         ebp,esp
 00713B33    add         esp,0FFFFFFEC
 00713B36    push        ebx
 00713B37    push        esi
 00713B38    push        edi
 00713B39    xor         ebx,ebx
 00713B3B    mov         dword ptr [ebp-14],ebx
 00713B3E    mov         dword ptr [ebp-10],ebx
 00713B41    mov         byte ptr [ebp-1],cl
 00713B44    mov         ebx,edx
 00713B46    mov         esi,eax
 00713B48    xor         eax,eax
 00713B4A    push        ebp
 00713B4B    push        71402E
 00713B50    push        dword ptr fs:[eax]
 00713B53    mov         dword ptr fs:[eax],esp
 00713B56    mov         eax,ebx
 00713B58    mov         edi,dword ptr ds:[680DF8];TBinaryOp
 00713B5E    mov         edx,edi
 00713B60    call        @IsClass
 00713B65    test        al,al
>00713B67    je          00713B6C
 00713B69    mov         ebx,dword ptr [ebx+18]
 00713B6C    mov         eax,ebx
 00713B6E    mov         edx,edi
 00713B70    call        @IsClass
 00713B75    test        al,al
>00713B77    je          00713B7C
 00713B79    mov         ebx,dword ptr [ebx+18]
 00713B7C    mov         dl,1
 00713B7E    mov         eax,[00680DF8];TBinaryOp
 00713B83    call        TObject.Create;TBinaryOp.Create
 00713B88    mov         dword ptr [ebp-0C],eax
 00713B8B    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00713B8E    movzx       edx,byte ptr [eax+8];TScanner.token:TToken
 00713B92    add         edx,0FFFFFFD1
 00713B95    cmp         edx,2D
>00713B98    ja          00713FD3
 00713B9E    movzx       edx,byte ptr [edx+713BAC]
 00713BA5    jmp         dword ptr [edx*4+713BDA]
 00713BA5    db          1
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          1
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          3
 00713BA5    db          7
 00713BA5    db          5
 00713BA5    db          2
 00713BA5    db          4
 00713BA5    db          8
 00713BA5    db          6
 00713BA5    db          13
 00713BA5    db          14
 00713BA5    db          11
 00713BA5    db          12
 00713BA5    db          10
 00713BA5    db          9
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          0
 00713BA5    db          15
 00713BA5    db          4
 00713BA5    dd          00713FD3
 00713BA5    dd          00713C1A
 00713BA5    dd          00713C34
 00713BA5    dd          00713C40
 00713BA5    dd          00713C69
 00713BA5    dd          00713C75
 00713BA5    dd          00713C81
 00713BA5    dd          00713C8D
 00713BA5    dd          00713C99
 00713BA5    dd          00713CA5
 00713BA5    dd          00713CB1
 00713BA5    dd          00713CBD
 00713BA5    dd          00713CC9
 00713BA5    dd          00713CD5
 00713BA5    dd          00713CE1
 00713BA5    dd          00713CED
 00713C1A    movzx       edx,byte ptr [ebp-1]
 00713C1E    mov         eax,esi
 00713C20    call        TParser.ParseNotTest
 00713C25    mov         ebx,eax
 00713C27    lea         eax,[ebp-0C]
 00713C2A    call        004F9A38
>00713C2F    jmp         00714013
 00713C34    mov         eax,dword ptr [ebp-0C]
 00713C37    mov         byte ptr [eax+20],14;TBinaryOp.Operation:TOperation
>00713C3B    jmp         00713FEA
 00713C40    mov         eax,dword ptr [ebp-0C]
 00713C43    mov         byte ptr [eax+20],14;TBinaryOp.Operation:TOperation
 00713C47    cmp         byte ptr [ebp-1],0
>00713C4B    jne         00713FEA
 00713C51    lea         eax,[ebp-0C]
 00713C54    call        004F9A38
 00713C59    xor         edx,edx
 00713C5B    mov         eax,esi
 00713C5D    call        TParser.ParseTest
 00713C62    mov         ebx,eax
>00713C64    jmp         00714013
 00713C69    mov         eax,dword ptr [ebp-0C]
 00713C6C    mov         byte ptr [eax+20],17;TBinaryOp.Operation:TOperation
>00713C70    jmp         00713FEA
 00713C75    mov         eax,dword ptr [ebp-0C]
 00713C78    mov         byte ptr [eax+20],16;TBinaryOp.Operation:TOperation
>00713C7C    jmp         00713FEA
 00713C81    mov         eax,dword ptr [ebp-0C]
 00713C84    mov         byte ptr [eax+20],15;TBinaryOp.Operation:TOperation
>00713C88    jmp         00713FEA
 00713C8D    mov         eax,dword ptr [ebp-0C]
 00713C90    mov         byte ptr [eax+20],12;TBinaryOp.Operation:TOperation
>00713C94    jmp         00713FEA
 00713C99    mov         eax,dword ptr [ebp-0C]
 00713C9C    mov         byte ptr [eax+20],13;TBinaryOp.Operation:TOperation
>00713CA0    jmp         00713FEA
 00713CA5    mov         eax,dword ptr [ebp-0C]
 00713CA8    mov         byte ptr [eax+20],1C;TBinaryOp.Operation:TOperation
>00713CAC    jmp         00713FEA
 00713CB1    mov         eax,dword ptr [ebp-0C]
 00713CB4    mov         byte ptr [eax+20],1B;TBinaryOp.Operation:TOperation
>00713CB8    jmp         00713FEA
 00713CBD    mov         eax,dword ptr [ebp-0C]
 00713CC0    mov         byte ptr [eax+20],18;TBinaryOp.Operation:TOperation
>00713CC4    jmp         00713FEA
 00713CC9    mov         eax,dword ptr [ebp-0C]
 00713CCC    mov         byte ptr [eax+20],19;TBinaryOp.Operation:TOperation
>00713CD0    jmp         00713FEA
 00713CD5    mov         eax,dword ptr [ebp-0C]
 00713CD8    mov         byte ptr [eax+20],1A;TBinaryOp.Operation:TOperation
>00713CDC    jmp         00713FEA
 00713CE1    mov         eax,dword ptr [ebp-0C]
 00713CE4    mov         byte ptr [eax+20],1D;TBinaryOp.Operation:TOperation
>00713CE8    jmp         00713FEA
 00713CED    call        TScanner.Next
 00713CF2    mov         dl,45
 00713CF4    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00713CF7    call        TScanner.read
 00713CFC    test        al,al
>00713CFE    je          00713D9E
 00713D04    movzx       edx,byte ptr [ebp-1]
 00713D08    mov         eax,esi
 00713D0A    call        TParser.ParseComparison
 00713D0F    mov         edi,eax
 00713D11    mov         dl,40
 00713D13    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00713D16    call        TScanner.expect
 00713D1B    movzx       edx,byte ptr [ebp-1]
 00713D1F    mov         eax,esi
 00713D21    call        TParser.ParseComparison
 00713D26    mov         dword ptr [ebp-8],eax
 00713D29    mov         eax,ebx
 00713D2B    call        TExpression.Clone
 00713D30    mov         edx,dword ptr [ebp-0C]
 00713D33    mov         dword ptr [edx+18],eax;TBinaryOp.LHS:TExpression
 00713D36    mov         eax,dword ptr [ebp-0C]
 00713D39    mov         dword ptr [eax+1C],edi;TBinaryOp.RHS:TExpression
 00713D3C    mov         eax,dword ptr [ebp-0C]
 00713D3F    mov         byte ptr [eax+20],14;TBinaryOp.Operation:TOperation
 00713D43    mov         dl,1
 00713D45    mov         eax,[00680DF8];TBinaryOp
 00713D4A    call        TObject.Create;TBinaryOp.Create
 00713D4F    mov         esi,eax
 00713D51    mov         byte ptr [esi+20],9;TBinaryOp.Operation:TOperation
 00713D55    mov         eax,dword ptr [ebp-0C]
 00713D58    mov         dword ptr [esi+18],eax;TBinaryOp.LHS:TExpression
 00713D5B    xor         eax,eax
 00713D5D    mov         dword ptr [ebp-0C],eax
 00713D60    mov         dl,1
 00713D62    mov         eax,[00680DF8];TBinaryOp
 00713D67    call        TObject.Create;TBinaryOp.Create
 00713D6C    mov         dword ptr [ebp-0C],eax
 00713D6F    mov         eax,ebx
 00713D71    call        TExpression.Clone
 00713D76    mov         edx,dword ptr [ebp-0C]
 00713D79    mov         dword ptr [edx+18],eax;TBinaryOp.LHS:TExpression
 00713D7C    mov         eax,dword ptr [ebp-0C]
 00713D7F    mov         edx,dword ptr [ebp-8]
 00713D82    mov         dword ptr [eax+1C],edx;TBinaryOp.RHS:TExpression
 00713D85    mov         eax,dword ptr [ebp-0C]
 00713D88    mov         byte ptr [eax+20],14;TBinaryOp.Operation:TOperation
 00713D8C    mov         eax,dword ptr [ebp-0C]
 00713D8F    mov         dword ptr [esi+1C],eax;TBinaryOp.RHS:TExpression
 00713D92    xor         eax,eax
 00713D94    mov         dword ptr [ebp-0C],eax
 00713D97    mov         ebx,esi
>00713D99    jmp         00714013
 00713D9E    mov         dl,46
 00713DA0    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00713DA3    call        TScanner.read
 00713DA8    test        al,al
>00713DAA    je          00713E4A
 00713DB0    movzx       edx,byte ptr [ebp-1]
 00713DB4    mov         eax,esi
 00713DB6    call        TParser.ParseComparison
 00713DBB    mov         edi,eax
 00713DBD    mov         dl,47
 00713DBF    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00713DC2    call        TScanner.expect
 00713DC7    movzx       edx,byte ptr [ebp-1]
 00713DCB    mov         eax,esi
 00713DCD    call        TParser.ParseComparison
 00713DD2    mov         dword ptr [ebp-8],eax
 00713DD5    mov         eax,ebx
 00713DD7    call        TExpression.Clone
 00713DDC    mov         edx,dword ptr [ebp-0C]
 00713DDF    mov         dword ptr [edx+18],eax;TBinaryOp.LHS:TExpression
 00713DE2    mov         eax,dword ptr [ebp-0C]
 00713DE5    mov         dword ptr [eax+1C],edi;TBinaryOp.RHS:TExpression
 00713DE8    mov         eax,dword ptr [ebp-0C]
 00713DEB    mov         byte ptr [eax+20],17;TBinaryOp.Operation:TOperation
 00713DEF    mov         dl,1
 00713DF1    mov         eax,[00680DF8];TBinaryOp
 00713DF6    call        TObject.Create;TBinaryOp.Create
 00713DFB    mov         esi,eax
 00713DFD    mov         byte ptr [esi+20],8;TBinaryOp.Operation:TOperation
 00713E01    mov         eax,dword ptr [ebp-0C]
 00713E04    mov         dword ptr [esi+18],eax;TBinaryOp.LHS:TExpression
 00713E07    xor         eax,eax
 00713E09    mov         dword ptr [ebp-0C],eax
 00713E0C    mov         dl,1
 00713E0E    mov         eax,[00680DF8];TBinaryOp
 00713E13    call        TObject.Create;TBinaryOp.Create
 00713E18    mov         dword ptr [ebp-0C],eax
 00713E1B    mov         eax,ebx
 00713E1D    call        TExpression.Clone
 00713E22    mov         edx,dword ptr [ebp-0C]
 00713E25    mov         dword ptr [edx+18],eax;TBinaryOp.LHS:TExpression
 00713E28    mov         eax,dword ptr [ebp-0C]
 00713E2B    mov         edx,dword ptr [ebp-8]
 00713E2E    mov         dword ptr [eax+1C],edx;TBinaryOp.RHS:TExpression
 00713E31    mov         eax,dword ptr [ebp-0C]
 00713E34    mov         byte ptr [eax+20],17;TBinaryOp.Operation:TOperation
 00713E38    mov         eax,dword ptr [ebp-0C]
 00713E3B    mov         dword ptr [esi+1C],eax;TBinaryOp.RHS:TExpression
 00713E3E    xor         eax,eax
 00713E40    mov         dword ptr [ebp-0C],eax
 00713E43    mov         ebx,esi
>00713E45    jmp         00714013
 00713E4A    mov         edi,dword ptr [esi+4];TParser.s:TScanner
 00713E4D    cmp         byte ptr [edi+8],3;TScanner.token:TToken
>00713E51    jne         00713E6D
 00713E53    lea         edx,[ebp-10]
 00713E56    mov         eax,dword ptr [edi+0C]
 00713E59    call        UpperCase
 00713E5E    mov         eax,dword ptr [ebp-10]
 00713E61    mov         edx,71404C;'BETWEEN'
 00713E66    call        @UStrEqual
>00713E6B    je          00713E8A
 00713E6D    lea         edx,[ebp-14]
 00713E70    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00713E73    mov         eax,dword ptr [eax+0C]
 00713E76    call        UpperCase
 00713E7B    mov         eax,dword ptr [ebp-14]
 00713E7E    mov         edx,714068;'ZWISCHEN'
 00713E83    call        @UStrEqual
>00713E88    jne         00713EA0
 00713E8A    mov         eax,ebx
 00713E8C    call        TExpression.Clone
 00713E91    mov         ebx,eax
 00713E93    lea         eax,[ebp-0C]
 00713E96    call        004F9A38
>00713E9B    jmp         00714013
 00713EA0    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00713EA3    movzx       eax,byte ptr [eax+8];TScanner.token:TToken
 00713EA7    add         eax,0FFFFFFD1
 00713EAA    cmp         eax,28
>00713EAD    ja          00713FA9
 00713EB3    movzx       eax,byte ptr [eax+713EC1]
 00713EBA    jmp         dword ptr [eax*4+713EEA]
 00713EBA    db          3
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          3
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          0
 00713EBA    db          2
 00713EBA    db          6
 00713EBA    db          4
 00713EBA    db          1
 00713EBA    db          3
 00713EBA    db          7
 00713EBA    db          5
 00713EBA    db          12
 00713EBA    db          13
 00713EBA    db          10
 00713EBA    db          11
 00713EBA    db          9
 00713EBA    db          8
 00713EBA    dd          00713FA9
 00713EBA    dd          00713F22
 00713EBA    dd          00713F2E
 00713EBA    dd          00713F3A
 00713EBA    dd          00713F46
 00713EBA    dd          00713F52
 00713EBA    dd          00713F5E
 00713EBA    dd          00713F6A
 00713EBA    dd          00713F73
 00713EBA    dd          00713F7C
 00713EBA    dd          00713F85
 00713EBA    dd          00713F8E
 00713EBA    dd          00713F97
 00713EBA    dd          00713FA0
 00713F22    mov         eax,dword ptr [ebp-0C]
 00713F25    mov         byte ptr [eax+20],14;TBinaryOp.Operation:TOperation
>00713F29    jmp         00713FEA
 00713F2E    mov         eax,dword ptr [ebp-0C]
 00713F31    mov         byte ptr [eax+20],14;TBinaryOp.Operation:TOperation
>00713F35    jmp         00713FEA
 00713F3A    mov         eax,dword ptr [ebp-0C]
 00713F3D    mov         byte ptr [eax+20],17;TBinaryOp.Operation:TOperation
>00713F41    jmp         00713FEA
 00713F46    mov         eax,dword ptr [ebp-0C]
 00713F49    mov         byte ptr [eax+20],16;TBinaryOp.Operation:TOperation
>00713F4D    jmp         00713FEA
 00713F52    mov         eax,dword ptr [ebp-0C]
 00713F55    mov         byte ptr [eax+20],15;TBinaryOp.Operation:TOperation
>00713F59    jmp         00713FEA
 00713F5E    mov         eax,dword ptr [ebp-0C]
 00713F61    mov         byte ptr [eax+20],12;TBinaryOp.Operation:TOperation
>00713F65    jmp         00713FEA
 00713F6A    mov         eax,dword ptr [ebp-0C]
 00713F6D    mov         byte ptr [eax+20],13;TBinaryOp.Operation:TOperation
>00713F71    jmp         00713FEA
 00713F73    mov         eax,dword ptr [ebp-0C]
 00713F76    mov         byte ptr [eax+20],1C;TBinaryOp.Operation:TOperation
>00713F7A    jmp         00713FEA
 00713F7C    mov         eax,dword ptr [ebp-0C]
 00713F7F    mov         byte ptr [eax+20],1B;TBinaryOp.Operation:TOperation
>00713F83    jmp         00713FEA
 00713F85    mov         eax,dword ptr [ebp-0C]
 00713F88    mov         byte ptr [eax+20],18;TBinaryOp.Operation:TOperation
>00713F8C    jmp         00713FEA
 00713F8E    mov         eax,dword ptr [ebp-0C]
 00713F91    mov         byte ptr [eax+20],19;TBinaryOp.Operation:TOperation
>00713F95    jmp         00713FEA
 00713F97    mov         eax,dword ptr [ebp-0C]
 00713F9A    mov         byte ptr [eax+20],1A;TBinaryOp.Operation:TOperation
>00713F9E    jmp         00713FEA
 00713FA0    mov         eax,dword ptr [ebp-0C]
 00713FA3    mov         byte ptr [eax+20],1D;TBinaryOp.Operation:TOperation
>00713FA7    jmp         00713FEA
 00713FA9    mov         eax,dword ptr [ebp-0C]
 00713FAC    mov         byte ptr [eax+20],14;TBinaryOp.Operation:TOperation
 00713FB0    movzx       edx,byte ptr [ebp-1]
 00713FB4    mov         eax,esi
 00713FB6    call        TParser.ParseComparison
 00713FBB    mov         edx,dword ptr [ebp-0C]
 00713FBE    mov         dword ptr [edx+1C],eax;TBinaryOp.RHS:TExpression
 00713FC1    mov         eax,ebx
 00713FC3    call        TExpression.Clone
 00713FC8    mov         edx,dword ptr [ebp-0C]
 00713FCB    mov         dword ptr [edx+18],eax;TBinaryOp.LHS:TExpression
 00713FCE    mov         ebx,dword ptr [ebp-0C]
>00713FD1    jmp         00714013
 00713FD3    lea         eax,[ebp-0C]
 00713FD6    call        004F9A38
 00713FDB    movzx       edx,byte ptr [ebp-1]
 00713FDF    mov         eax,esi
 00713FE1    call        TParser.ParseTest
 00713FE6    mov         ebx,eax
>00713FE8    jmp         00714013
 00713FEA    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00713FED    call        TScanner.Next
 00713FF2    movzx       edx,byte ptr [ebp-1]
 00713FF6    mov         eax,esi
 00713FF8    call        TParser.ParseComparison
 00713FFD    mov         edx,dword ptr [ebp-0C]
 00714000    mov         dword ptr [edx+1C],eax;TBinaryOp.RHS:TExpression
 00714003    mov         eax,ebx
 00714005    call        TExpression.Clone
 0071400A    mov         edx,dword ptr [ebp-0C]
 0071400D    mov         dword ptr [edx+18],eax;TBinaryOp.LHS:TExpression
 00714010    mov         ebx,dword ptr [ebp-0C]
 00714013    xor         eax,eax
 00714015    pop         edx
 00714016    pop         ecx
 00714017    pop         ecx
 00714018    mov         dword ptr fs:[eax],edx
 0071401B    push        714035
 00714020    lea         eax,[ebp-14]
 00714023    mov         edx,2
 00714028    call        @UStrArrayClr
 0071402D    ret
>0071402E    jmp         @HandleFinally
>00714033    jmp         00714020
 00714035    mov         eax,ebx
 00714037    pop         edi
 00714038    pop         esi
 00714039    pop         ebx
 0071403A    mov         esp,ebp
 0071403C    pop         ebp
 0071403D    ret
*}
end;

//0071407C
function TParser.ParseTest(CanHaveEquals:Boolean):TExpression;
begin
{*
 0071407C    push        ebp
 0071407D    mov         ebp,esp
 0071407F    add         esp,0FFFFFFF0
 00714082    push        ebx
 00714083    push        esi
 00714084    push        edi
 00714085    xor         ecx,ecx
 00714087    mov         dword ptr [ebp-10],ecx
 0071408A    mov         dword ptr [ebp-0C],ecx
 0071408D    mov         ebx,edx
 0071408F    mov         edi,eax
 00714091    xor         eax,eax
 00714093    push        ebp
 00714094    push        71438D
 00714099    push        dword ptr fs:[eax]
 0071409C    mov         dword ptr fs:[eax],esp
 0071409F    mov         edx,ebx
 007140A1    mov         eax,edi
 007140A3    call        TParser.ParseComparison
 007140A8    mov         esi,eax
 007140AA    mov         dl,1
 007140AC    mov         eax,[00680DF8];TBinaryOp
 007140B1    call        TObject.Create;TBinaryOp.Create
 007140B6    mov         dword ptr [ebp-8],eax
 007140B9    mov         eax,dword ptr [ebp-8]
 007140BC    mov         dword ptr [eax+18],esi;TBinaryOp.LHS:TExpression
 007140BF    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 007140C2    movzx       edx,byte ptr [eax+8];TScanner.token:TToken
 007140C6    add         edx,0FFFFFFB5
 007140C9    cmp         edx,11
>007140CC    ja          00714344
 007140D2    jmp         dword ptr [edx*4+7140D9]
 007140D2    dd          0071412D
 007140D2    dd          00714344
 007140D2    dd          00714344
 007140D2    dd          00714121
 007140D2    dd          00714153
 007140D2    dd          00714344
 007140D2    dd          00714344
 007140D2    dd          0071418F
 007140D2    dd          0071419B
 007140D2    dd          00714177
 007140D2    dd          00714183
 007140D2    dd          0071416B
 007140D2    dd          0071415F
 007140D2    dd          00714344
 007140D2    dd          00714344
 007140D2    dd          00714344
 007140D2    dd          007141A7
 007140D2    dd          00714153
 00714121    mov         eax,dword ptr [ebp-8]
 00714124    mov         byte ptr [eax+20],14;TBinaryOp.Operation:TOperation
>00714128    jmp         00714358
 0071412D    mov         eax,dword ptr [ebp-8]
 00714130    mov         byte ptr [eax+20],14;TBinaryOp.Operation:TOperation
 00714134    test        bl,bl
>00714136    jne         00714358
 0071413C    mov         ebx,esi
 0071413E    mov         eax,dword ptr [ebp-8]
 00714141    xor         edx,edx
 00714143    mov         dword ptr [eax+18],edx;TBinaryOp.LHS:TExpression
 00714146    lea         eax,[ebp-8]
 00714149    call        004F9A38
>0071414E    jmp         00714372
 00714153    mov         eax,dword ptr [ebp-8]
 00714156    mov         byte ptr [eax+20],17;TBinaryOp.Operation:TOperation
>0071415A    jmp         00714358
 0071415F    mov         eax,dword ptr [ebp-8]
 00714162    mov         byte ptr [eax+20],1C;TBinaryOp.Operation:TOperation
>00714166    jmp         00714358
 0071416B    mov         eax,dword ptr [ebp-8]
 0071416E    mov         byte ptr [eax+20],1B;TBinaryOp.Operation:TOperation
>00714172    jmp         00714358
 00714177    mov         eax,dword ptr [ebp-8]
 0071417A    mov         byte ptr [eax+20],18;TBinaryOp.Operation:TOperation
>0071417E    jmp         00714358
 00714183    mov         eax,dword ptr [ebp-8]
 00714186    mov         byte ptr [eax+20],19;TBinaryOp.Operation:TOperation
>0071418A    jmp         00714358
 0071418F    mov         eax,dword ptr [ebp-8]
 00714192    mov         byte ptr [eax+20],1A;TBinaryOp.Operation:TOperation
>00714196    jmp         00714358
 0071419B    mov         eax,dword ptr [ebp-8]
 0071419E    mov         byte ptr [eax+20],1D;TBinaryOp.Operation:TOperation
>007141A2    jmp         00714358
 007141A7    call        TScanner.Next
 007141AC    mov         dl,45
 007141AE    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 007141B1    call        TScanner.read
 007141B6    test        al,al
>007141B8    je          00714245
 007141BE    mov         edx,ebx
 007141C0    mov         eax,edi
 007141C2    call        TParser.ParseComparison
 007141C7    mov         dword ptr [ebp-4],eax
 007141CA    mov         dl,40
 007141CC    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 007141CF    call        TScanner.expect
 007141D4    mov         edx,ebx
 007141D6    mov         eax,edi
 007141D8    call        TParser.ParseComparison
 007141DD    mov         edi,eax
 007141DF    mov         eax,dword ptr [ebp-8]
 007141E2    mov         edx,dword ptr [ebp-4]
 007141E5    mov         dword ptr [eax+1C],edx;TBinaryOp.RHS:TExpression
 007141E8    mov         eax,dword ptr [ebp-8]
 007141EB    mov         byte ptr [eax+20],14;TBinaryOp.Operation:TOperation
 007141EF    mov         dl,1
 007141F1    mov         eax,[00680DF8];TBinaryOp
 007141F6    call        TObject.Create;TBinaryOp.Create
 007141FB    mov         ebx,eax
 007141FD    mov         byte ptr [ebx+20],9;TBinaryOp.Operation:TOperation
 00714201    mov         eax,dword ptr [ebp-8]
 00714204    mov         dword ptr [ebx+18],eax;TBinaryOp.LHS:TExpression
 00714207    xor         eax,eax
 00714209    mov         dword ptr [ebp-8],eax
 0071420C    mov         dl,1
 0071420E    mov         eax,[00680DF8];TBinaryOp
 00714213    call        TObject.Create;TBinaryOp.Create
 00714218    mov         dword ptr [ebp-8],eax
 0071421B    mov         eax,esi
 0071421D    call        TExpression.Clone
 00714222    mov         edx,dword ptr [ebp-8]
 00714225    mov         dword ptr [edx+18],eax;TBinaryOp.LHS:TExpression
 00714228    mov         eax,dword ptr [ebp-8]
 0071422B    mov         dword ptr [eax+1C],edi;TBinaryOp.RHS:TExpression
 0071422E    mov         eax,dword ptr [ebp-8]
 00714231    mov         byte ptr [eax+20],14;TBinaryOp.Operation:TOperation
 00714235    mov         eax,dword ptr [ebp-8]
 00714238    mov         dword ptr [ebx+1C],eax;TBinaryOp.RHS:TExpression
 0071423B    xor         eax,eax
 0071423D    mov         dword ptr [ebp-8],eax
>00714240    jmp         00714372
 00714245    mov         dl,46
 00714247    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071424A    call        TScanner.read
 0071424F    test        al,al
>00714251    je          007142E4
 00714257    mov         edx,ebx
 00714259    mov         eax,edi
 0071425B    call        TParser.ParseComparison
 00714260    mov         dword ptr [ebp-4],eax
 00714263    mov         dl,47
 00714265    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 00714268    call        TScanner.expect
 0071426D    mov         edx,ebx
 0071426F    mov         eax,edi
 00714271    call        TParser.ParseComparison
 00714276    mov         edi,eax
 00714278    mov         eax,esi
 0071427A    call        TExpression.Clone
 0071427F    mov         edx,dword ptr [ebp-8]
 00714282    mov         dword ptr [edx+18],eax;TBinaryOp.LHS:TExpression
 00714285    mov         eax,dword ptr [ebp-8]
 00714288    mov         edx,dword ptr [ebp-4]
 0071428B    mov         dword ptr [eax+1C],edx;TBinaryOp.RHS:TExpression
 0071428E    mov         eax,dword ptr [ebp-8]
 00714291    mov         byte ptr [eax+20],17;TBinaryOp.Operation:TOperation
 00714295    mov         dl,1
 00714297    mov         eax,[00680DF8];TBinaryOp
 0071429C    call        TObject.Create;TBinaryOp.Create
 007142A1    mov         ebx,eax
 007142A3    mov         byte ptr [ebx+20],8;TBinaryOp.Operation:TOperation
 007142A7    mov         eax,dword ptr [ebp-8]
 007142AA    mov         dword ptr [ebx+18],eax;TBinaryOp.LHS:TExpression
 007142AD    xor         eax,eax
 007142AF    mov         dword ptr [ebp-8],eax
 007142B2    mov         dl,1
 007142B4    mov         eax,[00680DF8];TBinaryOp
 007142B9    call        TObject.Create;TBinaryOp.Create
 007142BE    mov         dword ptr [ebp-8],eax
 007142C1    mov         eax,dword ptr [ebp-8]
 007142C4    mov         dword ptr [eax+18],esi;TBinaryOp.LHS:TExpression
 007142C7    mov         eax,dword ptr [ebp-8]
 007142CA    mov         dword ptr [eax+1C],edi;TBinaryOp.RHS:TExpression
 007142CD    mov         eax,dword ptr [ebp-8]
 007142D0    mov         byte ptr [eax+20],17;TBinaryOp.Operation:TOperation
 007142D4    mov         eax,dword ptr [ebp-8]
 007142D7    mov         dword ptr [ebx+1C],eax;TBinaryOp.RHS:TExpression
 007142DA    xor         eax,eax
 007142DC    mov         dword ptr [ebp-8],eax
>007142DF    jmp         00714372
 007142E4    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 007142E7    cmp         byte ptr [eax+8],3;TScanner.token:TToken
>007142EB    jne         0071430A
 007142ED    lea         edx,[ebp-0C]
 007142F0    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 007142F3    mov         eax,dword ptr [eax+0C]
 007142F6    call        UpperCase
 007142FB    mov         eax,dword ptr [ebp-0C]
 007142FE    mov         edx,7143AC;'BETWEEN'
 00714303    call        @UStrEqual
>00714308    je          00714327
 0071430A    lea         edx,[ebp-10]
 0071430D    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 00714310    mov         eax,dword ptr [eax+0C]
 00714313    call        UpperCase
 00714318    mov         eax,dword ptr [ebp-10]
 0071431B    mov         edx,7143C8;'ZWISCHEN'
 00714320    call        @UStrEqual
>00714325    jne         0071433B
 00714327    mov         ebx,esi
 00714329    mov         eax,dword ptr [ebp-8]
 0071432C    xor         edx,edx
 0071432E    mov         dword ptr [eax+18],edx;TBinaryOp.LHS:TExpression
 00714331    lea         eax,[ebp-8]
 00714334    call        004F9A38
>00714339    jmp         00714372
 0071433B    mov         eax,dword ptr [ebp-8]
 0071433E    mov         byte ptr [eax+20],14;TBinaryOp.Operation:TOperation
>00714342    jmp         00714358
 00714344    mov         ebx,esi
 00714346    mov         eax,dword ptr [ebp-8]
 00714349    xor         edx,edx
 0071434B    mov         dword ptr [eax+18],edx;TBinaryOp.LHS:TExpression
 0071434E    lea         eax,[ebp-8]
 00714351    call        004F9A38
>00714356    jmp         00714372
 00714358    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071435B    call        TScanner.Next
 00714360    mov         edx,ebx
 00714362    mov         eax,edi
 00714364    call        TParser.ParseComparison
 00714369    mov         edx,dword ptr [ebp-8]
 0071436C    mov         dword ptr [edx+1C],eax;TBinaryOp.RHS:TExpression
 0071436F    mov         ebx,dword ptr [ebp-8]
 00714372    xor         eax,eax
 00714374    pop         edx
 00714375    pop         ecx
 00714376    pop         ecx
 00714377    mov         dword ptr fs:[eax],edx
 0071437A    push        714394
 0071437F    lea         eax,[ebp-10]
 00714382    mov         edx,2
 00714387    call        @UStrArrayClr
 0071438C    ret
>0071438D    jmp         @HandleFinally
>00714392    jmp         0071437F
 00714394    mov         eax,ebx
 00714396    pop         edi
 00714397    pop         esi
 00714398    pop         ebx
 00714399    mov         esp,ebp
 0071439B    pop         ebp
 0071439C    ret
*}
end;

//007143DC
function TParser.ParseNotTest(CanHaveEquals:Boolean):TExpression;
begin
{*
 007143DC    push        ebx
 007143DD    push        esi
 007143DE    push        edi
 007143DF    mov         ebx,edx
 007143E1    mov         edi,eax
 007143E3    mov         dl,43
 007143E5    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 007143E8    call        TScanner.read
 007143ED    test        al,al
>007143EF    jne         007143FF
 007143F1    mov         dl,2F
 007143F3    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 007143F6    call        TScanner.read
 007143FB    test        al,al
>007143FD    je          0071443E
 007143FF    mov         dl,1
 00714401    mov         eax,[00681370];TUnaryOp
 00714406    call        TObject.Create;TUnaryOp.Create
 0071440B    mov         esi,eax
 0071440D    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 00714410    movzx       eax,byte ptr [eax+8];TScanner.token:TToken
 00714414    cmp         al,43
>00714416    je          0071441C
 00714418    cmp         al,2F
>0071441A    jne         0071442A
 0071441C    mov         edx,ebx
 0071441E    mov         eax,edi
 00714420    call        TParser.ParseNotTest
 00714425    mov         dword ptr [esi+18],eax;TUnaryOp.RHS:TExpression
>00714428    jmp         00714436
 0071442A    mov         edx,ebx
 0071442C    mov         eax,edi
 0071442E    call        TParser.ParseTest
 00714433    mov         dword ptr [esi+18],eax;TUnaryOp.RHS:TExpression
 00714436    mov         byte ptr [esi+1C],0A;TUnaryOp.Operation:TOperation
 0071443A    mov         eax,esi
>0071443C    jmp         00714447
 0071443E    mov         edx,ebx
 00714440    mov         eax,edi
 00714442    call        TParser.ParseTest
 00714447    pop         edi
 00714448    pop         esi
 00714449    pop         ebx
 0071444A    ret
*}
end;

//0071444C
function TParser.ParseObjectArrayField(ObjectName:string):TExpression;
begin
{*
 0071444C    push        ebp
 0071444D    mov         ebp,esp
 0071444F    add         esp,0FFFFFFE8
 00714452    push        ebx
 00714453    push        esi
 00714454    xor         ecx,ecx
 00714456    mov         dword ptr [ebp-18],ecx
 00714459    mov         dword ptr [ebp-8],ecx
 0071445C    mov         dword ptr [ebp-0C],ecx
 0071445F    mov         dword ptr [ebp-4],edx
 00714462    mov         ebx,eax
 00714464    mov         eax,dword ptr [ebp-4]
 00714467    call        @UStrAddRef
 0071446C    xor         eax,eax
 0071446E    push        ebp
 0071446F    push        714608
 00714474    push        dword ptr fs:[eax]
 00714477    mov         dword ptr fs:[eax],esp
 0071447A    mov         dl,12
 0071447C    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071447F    call        TScanner.expect
 00714484    mov         esi,dword ptr [ebx+4];TParser.s:TScanner
 00714487    cmp         byte ptr [esi+8],3;TScanner.token:TToken
>0071448B    jne         007144EB
 0071448D    mov         eax,dword ptr [esi+0C]
 00714490    mov         edx,714624;'i'
 00714495    call        @UStrEqual
>0071449A    jne         007144AB
 0071449C    lea         eax,[esi+0C]
 0071449F    mov         edx,714634;'var.i'
 007144A4    call        @UStrAsg
>007144A9    jmp         007144EB
 007144AB    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007144AE    mov         eax,dword ptr [eax+0C]
 007144B1    mov         edx,71464C;'j'
 007144B6    call        @UStrEqual
>007144BB    jne         007144CC
 007144BD    lea         eax,[esi+0C]
 007144C0    mov         edx,71465C;'var.j'
 007144C5    call        @UStrAsg
>007144CA    jmp         007144EB
 007144CC    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007144CF    mov         eax,dword ptr [eax+0C]
 007144D2    mov         edx,714674;'k'
 007144D7    call        @UStrEqual
>007144DC    jne         007144EB
 007144DE    lea         eax,[esi+0C]
 007144E1    mov         edx,714684;'var.k'
 007144E6    call        @UStrAsg
 007144EB    xor         edx,edx
 007144ED    mov         eax,ebx
 007144EF    call        TParser.ParseExpression
 007144F4    mov         dword ptr [ebp-10],eax
 007144F7    mov         dl,13
 007144F9    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007144FC    call        TScanner.expect
 00714501    mov         dl,1D
 00714503    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00714506    call        TScanner.read
 0071450B    test        al,al
>0071450D    jne         0071453D
 0071450F    mov         dl,20
 00714511    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00714514    call        TScanner.read
 00714519    test        al,al
>0071451B    jne         0071453D
 0071451D    mov         dl,21
 0071451F    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00714522    call        TScanner.read
 00714527    test        al,al
>00714529    jne         0071453D
 0071452B    mov         dl,1E
 0071452D    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00714530    call        TScanner.read
 00714535    test        al,al
>00714537    je          007145D9
 0071453D    lea         edx,[ebp-8]
 00714540    mov         eax,ebx
 00714542    call        TParser.ParseQualifiedId
 00714547    push        dword ptr [ebp-4]
 0071454A    push        71469C;'999.'
 0071454F    push        dword ptr [ebp-8]
 00714552    lea         eax,[ebp-0C]
 00714555    mov         edx,3
 0071455A    call        @UStrCatN
 0071455F    lea         eax,[ebp-18]
 00714562    mov         edx,dword ptr [ebp-0C]
 00714565    call        @WStrFromUStr
 0071456A    mov         eax,dword ptr [ebp-18]
 0071456D    xor         edx,edx
 0071456F    call        00710FA4
 00714574    mov         dword ptr [ebp-14],eax
 00714577    mov         eax,dword ptr [ebp-14]
 0071457A    mov         edx,dword ptr ds:[67E6F0];TObjectValue
 00714580    call        @IsClass
 00714585    test        al,al
>00714587    je          007145A7
 00714589    mov         dl,1
 0071458B    mov         eax,[0067E8E4];TObjectArrayExpression
 00714590    call        TObject.Create;TObjectArrayExpression.Create
 00714595    mov         esi,eax
 00714597    mov         eax,esi
 00714599    mov         edx,dword ptr [ebp-10]
 0071459C    mov         dword ptr [eax+1C],edx;TObjectArrayExpression.Index:TExpression
 0071459F    mov         edx,dword ptr [ebp-14]
 007145A2    mov         dword ptr [eax+18],edx;TObjectArrayExpression.Value:TObjectValue
>007145A5    jmp         007145E5
 007145A7    mov         eax,dword ptr [ebp-10]
 007145AA    xor         edx,edx
 007145AC    mov         dword ptr [ebp-10],edx
 007145AF    call        TObject.Free
 007145B4    mov         eax,dword ptr [ebp-14]
 007145B7    xor         edx,edx
 007145B9    mov         dword ptr [ebp-14],edx
 007145BC    call        TObject.Free
 007145C1    mov         ecx,7146B4;'Object field expected'
 007145C6    mov         dl,1
 007145C8    mov         eax,[0043912C];EParserError
 007145CD    call        Exception.Create;EParserError.Create
 007145D2    call        @RaiseExcept
>007145D7    jmp         007145E5
 007145D9    xor         esi,esi
 007145DB    mov         dl,1D
 007145DD    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007145E0    call        TScanner.expect
 007145E5    xor         eax,eax
 007145E7    pop         edx
 007145E8    pop         ecx
 007145E9    pop         ecx
 007145EA    mov         dword ptr fs:[eax],edx
 007145ED    push        71460F
 007145F2    lea         eax,[ebp-18]
 007145F5    call        @WStrClr
 007145FA    lea         eax,[ebp-0C]
 007145FD    mov         edx,3
 00714602    call        @UStrArrayClr
 00714607    ret
>00714608    jmp         @HandleFinally
>0071460D    jmp         007145F2
 0071460F    mov         eax,esi
 00714611    pop         esi
 00714612    pop         ebx
 00714613    mov         esp,ebp
 00714615    pop         ebp
 00714616    ret
*}
end;

//007146E0
function TParser.ParseExpression(CanHaveEquals:Boolean):TExpression;
begin
{*
 007146E0    push        ebx
 007146E1    push        esi
 007146E2    push        edi
 007146E3    push        ebp
 007146E4    push        ecx
 007146E5    mov         ebx,edx
 007146E7    mov         ebp,eax
 007146E9    mov         edx,dword ptr [ebp+4];TParser.s:TScanner
 007146EC    movzx       eax,byte ptr [edx+8];TScanner.token:TToken
 007146F0    cmp         al,43
>007146F2    je          007146F8
 007146F4    cmp         al,2F
>007146F6    jne         00714706
 007146F8    mov         edx,ebx
 007146FA    mov         eax,ebp
 007146FC    call        TParser.ParseNotTest
>00714701    jmp         00714C7D
 00714706    cmp         al,45
>00714708    jne         0071481E
 0071470E    mov         eax,edx
 00714710    mov         dl,45
 00714712    call        TScanner.expect
 00714717    mov         edx,ebx
 00714719    mov         eax,ebp
 0071471B    call        TParser.ParseTest
 00714720    mov         edi,eax
 00714722    mov         edx,dword ptr [ebp+4];TParser.s:TScanner
 00714725    movzx       eax,byte ptr [edx+8];TScanner.token:TToken
 00714729    cmp         al,40
>0071472B    je          0071473A
 0071472D    cmp         al,49
>0071472F    je          0071473A
 00714731    mov         eax,edx
 00714733    mov         dl,40
 00714735    call        TScanner.expect
 0071473A    mov         dword ptr [esp],edi
 0071473D    xor         esi,esi
>0071473F    jmp         00714767
 00714741    mov         dl,1
 00714743    mov         eax,[00680DF8];TBinaryOp
 00714748    call        TObject.Create;TBinaryOp.Create
 0071474D    mov         esi,eax
 0071474F    mov         dword ptr [esi+18],edi;TBinaryOp.LHS:TExpression
 00714752    mov         byte ptr [esi+20],9;TBinaryOp.Operation:TOperation
 00714756    mov         ecx,ebx
 00714758    mov         edx,dword ptr [esp]
 0071475B    mov         eax,ebp
 0071475D    call        TParser.ParseReTest
 00714762    mov         dword ptr [esi+1C],eax;TBinaryOp.RHS:TExpression
 00714765    mov         edi,esi
 00714767    mov         dl,40
 00714769    mov         eax,dword ptr [ebp+4];TParser.s:TScanner
 0071476C    call        TScanner.read
 00714771    test        al,al
>00714773    jne         00714741
 00714775    mov         dl,49
 00714777    mov         eax,dword ptr [ebp+4];TParser.s:TScanner
 0071477A    call        TScanner.read
 0071477F    test        al,al
>00714781    jne         00714741
 00714783    mov         eax,dword ptr [ebp+4];TParser.s:TScanner
 00714786    movzx       eax,byte ptr [eax+8];TScanner.token:TToken
 0071478A    add         eax,0FFFFFFBF
 0071478D    cmp         eax,7
>00714790    ja          00714817
 00714796    movzx       eax,byte ptr [eax+7147A4]
 0071479D    jmp         dword ptr [eax*4+7147AC]
 0071479D    db          1
 0071479D    db          2
 0071479D    db          0
 0071479D    db          1
 0071479D    db          0
 0071479D    db          0
 0071479D    db          3
 0071479D    db          1
 0071479D    dd          00714817
 0071479D    dd          007147BC
 0071479D    dd          007147DB
 0071479D    dd          007147FA
 007147BC    mov         eax,esi
 007147BE    call        TObject.Free
 007147C3    mov         ecx,714C90;'You need brackets when you mix OR with AND, so I know which to do first'
 007147C8    mov         dl,1
 007147CA    mov         eax,[00576F6C];ECompiler
 007147CF    call        Exception.Create;ECompiler.Create
 007147D4    call        @RaiseExcept
>007147D9    jmp         00714817
 007147DB    mov         eax,esi
 007147DD    call        TObject.Free
 007147E2    mov         ecx,714D2C;'You need brackets when you mix OR with XOR, so I know which to do first'
 007147E7    mov         dl,1
 007147E9    mov         eax,[00576F6C];ECompiler
 007147EE    call        Exception.Create;ECompiler.Create
 007147F3    call        @RaiseExcept
>007147F8    jmp         00714817
 007147FA    mov         eax,esi
 007147FC    call        TObject.Free
 00714801    mov         ecx,714DC8;'You can only use NOR with NEITHER. eg. NEITHER a NOR b'
 00714806    mov         dl,1
 00714808    mov         eax,[00576F6C];ECompiler
 0071480D    call        Exception.Create;ECompiler.Create
 00714812    call        @RaiseExcept
 00714817    mov         eax,esi
>00714819    jmp         00714C7D
 0071481E    cmp         al,46
>00714820    jne         00714990
 00714826    mov         eax,edx
 00714828    mov         dl,46
 0071482A    call        TScanner.expect
 0071482F    mov         edx,ebx
 00714831    mov         eax,ebp
 00714833    call        TParser.ParseTest
 00714838    mov         edi,eax
 0071483A    mov         edx,dword ptr [ebp+4];TParser.s:TScanner
 0071483D    movzx       eax,byte ptr [edx+8];TScanner.token:TToken
 00714841    cmp         al,40
>00714843    je          00714856
 00714845    cmp         al,49
>00714847    je          00714856
 00714849    cmp         al,47
>0071484B    je          00714856
 0071484D    mov         eax,edx
 0071484F    mov         dl,47
 00714851    call        TScanner.expect
 00714856    mov         eax,dword ptr [ebp+4];TParser.s:TScanner
 00714859    cmp         byte ptr [eax+8],47;TScanner.token:TToken
 0071485D    sete        al
 00714860    mov         dword ptr [esp],edi
 00714863    xor         esi,esi
 00714865    test        al,al
>00714867    je          007148C7
>00714869    jmp         00714891
 0071486B    mov         dl,1
 0071486D    mov         eax,[00680DF8];TBinaryOp
 00714872    call        TObject.Create;TBinaryOp.Create
 00714877    mov         esi,eax
 00714879    mov         dword ptr [esi+18],edi;TBinaryOp.LHS:TExpression
 0071487C    mov         byte ptr [esi+20],9;TBinaryOp.Operation:TOperation
 00714880    mov         ecx,ebx
 00714882    mov         edx,dword ptr [esp]
 00714885    mov         eax,ebp
 00714887    call        TParser.ParseReTest
 0071488C    mov         dword ptr [esi+1C],eax;TBinaryOp.RHS:TExpression
 0071488F    mov         edi,esi
 00714891    mov         dl,47
 00714893    mov         eax,dword ptr [ebp+4];TParser.s:TScanner
 00714896    call        TScanner.read
 0071489B    test        al,al
>0071489D    jne         0071486B
>0071489F    jmp         007148E3
 007148A1    mov         dl,1
 007148A3    mov         eax,[00680DF8];TBinaryOp
 007148A8    call        TObject.Create;TBinaryOp.Create
 007148AD    mov         esi,eax
 007148AF    mov         dword ptr [esi+18],edi;TBinaryOp.LHS:TExpression
 007148B2    mov         byte ptr [esi+20],9;TBinaryOp.Operation:TOperation
 007148B6    mov         ecx,ebx
 007148B8    mov         edx,dword ptr [esp]
 007148BB    mov         eax,ebp
 007148BD    call        TParser.ParseReTest
 007148C2    mov         dword ptr [esi+1C],eax;TBinaryOp.RHS:TExpression
 007148C5    mov         edi,esi
 007148C7    mov         dl,40
 007148C9    mov         eax,dword ptr [ebp+4];TParser.s:TScanner
 007148CC    call        TScanner.read
 007148D1    test        al,al
>007148D3    jne         007148A1
 007148D5    mov         dl,49
 007148D7    mov         eax,dword ptr [ebp+4];TParser.s:TScanner
 007148DA    call        TScanner.read
 007148DF    test        al,al
>007148E1    jne         007148A1
 007148E3    mov         eax,dword ptr [ebp+4];TParser.s:TScanner
 007148E6    movzx       eax,byte ptr [eax+8];TScanner.token:TToken
 007148EA    add         eax,0FFFFFFC0
 007148ED    cmp         eax,8
>007148F0    ja          00714978
 007148F6    movzx       eax,byte ptr [eax+714904]
 007148FD    jmp         dword ptr [eax*4+71490D]
 007148FD    db          3
 007148FD    db          1
 007148FD    db          2
 007148FD    db          0
 007148FD    db          1
 007148FD    db          0
 007148FD    db          0
 007148FD    db          3
 007148FD    db          1
 007148FD    dd          00714978
 007148FD    dd          0071491D
 007148FD    dd          0071493C
 007148FD    dd          0071495B
 0071491D    mov         eax,esi
 0071491F    call        TObject.Free
 00714924    mov         ecx,714E44;'You need brackets when you use AND after NOR, so I know which to do first'
 00714929    mov         dl,1
 0071492B    mov         eax,[00576F6C];ECompiler
 00714930    call        Exception.Create;ECompiler.Create
 00714935    call        @RaiseExcept
>0071493A    jmp         00714978
 0071493C    mov         eax,esi
 0071493E    call        TObject.Free
 00714943    mov         ecx,714EE4;'You need brackets when you use XOR after NOR, so I know which to do first'
 00714948    mov         dl,1
 0071494A    mov         eax,[00576F6C];ECompiler
 0071494F    call        Exception.Create;ECompiler.Create
 00714954    call        @RaiseExcept
>00714959    jmp         00714978
 0071495B    mov         eax,esi
 0071495D    call        TObject.Free
 00714962    mov         ecx,714F84;'You can''t mix NOR with OR (pick one, they are equivalent)'
 00714967    mov         dl,1
 00714969    mov         eax,[00576F6C];ECompiler
 0071496E    call        Exception.Create;ECompiler.Create
 00714973    call        @RaiseExcept
 00714978    mov         dl,1
 0071497A    mov         eax,[00681370];TUnaryOp
 0071497F    call        TObject.Create;TUnaryOp.Create
 00714984    mov         byte ptr [eax+1C],0A;TUnaryOp.Operation:TOperation
 00714988    mov         dword ptr [eax+18],esi;TUnaryOp.RHS:TExpression
>0071498B    jmp         00714C7D
 00714990    mov         edx,ebx
 00714992    mov         eax,ebp
 00714994    call        TParser.ParseTest
 00714999    mov         edi,eax
 0071499B    mov         eax,dword ptr [ebp+4];TParser.s:TScanner
 0071499E    movzx       eax,byte ptr [eax+8];TScanner.token:TToken
 007149A2    add         eax,0FFFFFFC0
 007149A5    cmp         eax,9
>007149A8    ja          00714C7B
 007149AE    movzx       eax,byte ptr [eax+7149BC]
 007149B5    jmp         dword ptr [eax*4+7149C6]
 007149B5    db          2
 007149B5    db          1
 007149B5    db          3
 007149B5    db          0
 007149B5    db          1
 007149B5    db          0
 007149B5    db          0
 007149B5    db          4
 007149B5    db          1
 007149B5    db          2
 007149B5    dd          00714C7B
 007149B5    dd          007149DA
 007149B5    dd          00714AAA
 007149B5    dd          00714B8E
 007149B5    dd          00714C63
 007149DA    mov         dword ptr [esp],edi
 007149DD    xor         esi,esi
>007149DF    jmp         00714A07
 007149E1    mov         dl,1
 007149E3    mov         eax,[00680DF8];TBinaryOp
 007149E8    call        TObject.Create;TBinaryOp.Create
 007149ED    mov         esi,eax
 007149EF    mov         dword ptr [esi+18],edi;TBinaryOp.LHS:TExpression
 007149F2    mov         byte ptr [esi+20],8;TBinaryOp.Operation:TOperation
 007149F6    mov         ecx,ebx
 007149F8    mov         edx,dword ptr [esp]
 007149FB    mov         eax,ebp
 007149FD    call        TParser.ParseReTest
 00714A02    mov         dword ptr [esi+1C],eax;TBinaryOp.RHS:TExpression
 00714A05    mov         edi,esi
 00714A07    mov         dl,41
 00714A09    mov         eax,dword ptr [ebp+4];TParser.s:TScanner
 00714A0C    call        TScanner.read
 00714A11    test        al,al
>00714A13    jne         007149E1
 00714A15    mov         dl,48
 00714A17    mov         eax,dword ptr [ebp+4];TParser.s:TScanner
 00714A1A    call        TScanner.read
 00714A1F    test        al,al
>00714A21    jne         007149E1
 00714A23    mov         dl,44
 00714A25    mov         eax,dword ptr [ebp+4];TParser.s:TScanner
 00714A28    call        TScanner.read
 00714A2D    test        al,al
>00714A2F    jne         007149E1
 00714A31    mov         eax,dword ptr [ebp+4];TParser.s:TScanner
 00714A34    movzx       eax,byte ptr [eax+8];TScanner.token:TToken
 00714A38    sub         al,40
>00714A3A    je          00714A48
 00714A3C    sub         al,2
>00714A3E    je          00714A67
 00714A40    sub         al,5
>00714A42    je          00714A86
 00714A44    sub         al,2
>00714A46    jne         00714AA3
 00714A48    mov         eax,esi
 00714A4A    call        TObject.Free
 00714A4F    mov         ecx,715004;'You need brackets when you mix AND with OR, so I know which to do first'
 00714A54    mov         dl,1
 00714A56    mov         eax,[00576F6C];ECompiler
 00714A5B    call        Exception.Create;ECompiler.Create
 00714A60    call        @RaiseExcept
>00714A65    jmp         00714AA3
 00714A67    mov         eax,esi
 00714A69    call        TObject.Free
 00714A6E    mov         ecx,7150A0;'You need brackets when you mix AND with XOR, so I know which to do first'
 00714A73    mov         dl,1
 00714A75    mov         eax,[00576F6C];ECompiler
 00714A7A    call        Exception.Create;ECompiler.Create
 00714A7F    call        @RaiseExcept
>00714A84    jmp         00714AA3
 00714A86    mov         eax,esi
 00714A88    call        TObject.Free
 00714A8D    mov         ecx,714DC8;'You can only use NOR with NEITHER. eg. NEITHER a NOR b'
 00714A92    mov         dl,1
 00714A94    mov         eax,[00576F6C];ECompiler
 00714A99    call        Exception.Create;ECompiler.Create
 00714A9E    call        @RaiseExcept
 00714AA3    mov         eax,esi
>00714AA5    jmp         00714C7D
 00714AAA    mov         dword ptr [esp],edi
 00714AAD    xor         esi,esi
>00714AAF    jmp         00714AD7
 00714AB1    mov         dl,1
 00714AB3    mov         eax,[00680DF8];TBinaryOp
 00714AB8    call        TObject.Create;TBinaryOp.Create
 00714ABD    mov         esi,eax
 00714ABF    mov         dword ptr [esi+18],edi;TBinaryOp.LHS:TExpression
 00714AC2    mov         byte ptr [esi+20],9;TBinaryOp.Operation:TOperation
 00714AC6    mov         ecx,ebx
 00714AC8    mov         edx,dword ptr [esp]
 00714ACB    mov         eax,ebp
 00714ACD    call        TParser.ParseReTest
 00714AD2    mov         dword ptr [esi+1C],eax;TBinaryOp.RHS:TExpression
 00714AD5    mov         edi,esi
 00714AD7    mov         dl,40
 00714AD9    mov         eax,dword ptr [ebp+4];TParser.s:TScanner
 00714ADC    call        TScanner.read
 00714AE1    test        al,al
>00714AE3    jne         00714AB1
 00714AE5    mov         dl,49
 00714AE7    mov         eax,dword ptr [ebp+4];TParser.s:TScanner
 00714AEA    call        TScanner.read
 00714AEF    test        al,al
>00714AF1    jne         00714AB1
 00714AF3    mov         eax,dword ptr [ebp+4];TParser.s:TScanner
 00714AF6    movzx       eax,byte ptr [eax+8];TScanner.token:TToken
 00714AFA    add         eax,0FFFFFFBF
 00714AFD    cmp         eax,7
>00714B00    ja          00714B87
 00714B06    movzx       eax,byte ptr [eax+714B14]
 00714B0D    jmp         dword ptr [eax*4+714B1C]
 00714B0D    db          1
 00714B0D    db          2
 00714B0D    db          0
 00714B0D    db          1
 00714B0D    db          0
 00714B0D    db          0
 00714B0D    db          3
 00714B0D    db          1
 00714B0D    dd          00714B87
 00714B0D    dd          00714B2C
 00714B0D    dd          00714B4B
 00714B0D    dd          00714B6A
 00714B2C    mov         eax,esi
 00714B2E    call        TObject.Free
 00714B33    mov         ecx,714C90;'You need brackets when you mix OR with AND, so I know which to do first'
 00714B38    mov         dl,1
 00714B3A    mov         eax,[00576F6C];ECompiler
 00714B3F    call        Exception.Create;ECompiler.Create
 00714B44    call        @RaiseExcept
>00714B49    jmp         00714B87
 00714B4B    mov         eax,esi
 00714B4D    call        TObject.Free
 00714B52    mov         ecx,714D2C;'You need brackets when you mix OR with XOR, so I know which to do first'
 00714B57    mov         dl,1
 00714B59    mov         eax,[00576F6C];ECompiler
 00714B5E    call        Exception.Create;ECompiler.Create
 00714B63    call        @RaiseExcept
>00714B68    jmp         00714B87
 00714B6A    mov         eax,esi
 00714B6C    call        TObject.Free
 00714B71    mov         ecx,714DC8;'You can only use NOR with NEITHER. eg. NEITHER a NOR b'
 00714B76    mov         dl,1
 00714B78    mov         eax,[00576F6C];ECompiler
 00714B7D    call        Exception.Create;ECompiler.Create
 00714B82    call        @RaiseExcept
 00714B87    mov         eax,esi
>00714B89    jmp         00714C7D
 00714B8E    mov         dword ptr [esp],edi
 00714B91    xor         esi,esi
>00714B93    jmp         00714BBB
 00714B95    mov         dl,1
 00714B97    mov         eax,[00680DF8];TBinaryOp
 00714B9C    call        TObject.Create;TBinaryOp.Create
 00714BA1    mov         esi,eax
 00714BA3    mov         dword ptr [esi+18],edi;TBinaryOp.LHS:TExpression
 00714BA6    mov         byte ptr [esi+20],0B;TBinaryOp.Operation:TOperation
 00714BAA    mov         ecx,ebx
 00714BAC    mov         edx,dword ptr [esp]
 00714BAF    mov         eax,ebp
 00714BB1    call        TParser.ParseReTest
 00714BB6    mov         dword ptr [esi+1C],eax;TBinaryOp.RHS:TExpression
 00714BB9    mov         edi,esi
 00714BBB    mov         dl,42
 00714BBD    mov         eax,dword ptr [ebp+4];TParser.s:TScanner
 00714BC0    call        TScanner.read
 00714BC5    test        al,al
>00714BC7    jne         00714B95
 00714BC9    mov         eax,dword ptr [ebp+4];TParser.s:TScanner
 00714BCC    movzx       eax,byte ptr [eax+8];TScanner.token:TToken
 00714BD0    add         eax,0FFFFFFC0
 00714BD3    cmp         eax,9
>00714BD6    ja          00714C5F
 00714BDC    movzx       eax,byte ptr [eax+714BEA]
 00714BE3    jmp         dword ptr [eax*4+714BF4]
 00714BE3    db          1
 00714BE3    db          2
 00714BE3    db          0
 00714BE3    db          0
 00714BE3    db          2
 00714BE3    db          0
 00714BE3    db          0
 00714BE3    db          3
 00714BE3    db          2
 00714BE3    db          1
 00714BE3    dd          00714C5F
 00714BE3    dd          00714C04
 00714BE3    dd          00714C23
 00714BE3    dd          00714C42
 00714C04    mov         eax,esi
 00714C06    call        TObject.Free
 00714C0B    mov         ecx,715140;'You need brackets when you mix XOR with OR, so I know which to do first'
 00714C10    mov         dl,1
 00714C12    mov         eax,[00576F6C];ECompiler
 00714C17    call        Exception.Create;ECompiler.Create
 00714C1C    call        @RaiseExcept
>00714C21    jmp         00714C5F
 00714C23    mov         eax,esi
 00714C25    call        TObject.Free
 00714C2A    mov         ecx,7151DC;'You need brackets when you mix XOR with AND, so I know which to do first'
 00714C2F    mov         dl,1
 00714C31    mov         eax,[00576F6C];ECompiler
 00714C36    call        Exception.Create;ECompiler.Create
 00714C3B    call        @RaiseExcept
>00714C40    jmp         00714C5F
 00714C42    mov         eax,esi
 00714C44    call        TObject.Free
 00714C49    mov         ecx,714DC8;'You can only use NOR with NEITHER. eg. NEITHER a NOR b'
 00714C4E    mov         dl,1
 00714C50    mov         eax,[00576F6C];ECompiler
 00714C55    call        Exception.Create;ECompiler.Create
 00714C5A    call        @RaiseExcept
 00714C5F    mov         eax,esi
>00714C61    jmp         00714C7D
 00714C63    mov         ecx,714DC8;'You can only use NOR with NEITHER. eg. NEITHER a NOR b'
 00714C68    mov         dl,1
 00714C6A    mov         eax,[00576F6C];ECompiler
 00714C6F    call        Exception.Create;ECompiler.Create
 00714C74    call        @RaiseExcept
>00714C79    jmp         00714C7D
 00714C7B    mov         eax,edi
 00714C7D    pop         edx
 00714C7E    pop         ebp
 00714C7F    pop         edi
 00714C80    pop         esi
 00714C81    pop         ebx
 00714C82    ret
*}
end;

//00715270
procedure TParser.ParseParamListWithoutBrackets(L:TObjectList);
begin
{*
 00715270    push        ebx
 00715271    push        esi
 00715272    push        edi
 00715273    push        ebp
 00715274    mov         ebp,edx
 00715276    mov         ebx,eax
 00715278    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071527B    movzx       eax,byte ptr [eax+8];TScanner.token:TToken
 0071527F    sub         al,11
>00715281    je          007152C7
 00715283    sub         al,6
>00715285    je          007152C7
 00715287    sub         al,3
>00715289    je          007152C7
 0071528B    sub         al,52
>0071528D    je          007152C7
 0071528F    mov         dl,1
 00715291    mov         eax,ebx
 00715293    call        TParser.ParseExpression
 00715298    mov         edx,eax
 0071529A    mov         eax,ebp
 0071529C    call        TList.Add
>007152A1    jmp         007152B9
 007152A3    mov         dl,1
 007152A5    mov         eax,ebx
 007152A7    call        TParser.ParseExpression
 007152AC    mov         esi,eax
 007152AE    mov         edx,esi
 007152B0    mov         eax,ebp
 007152B2    call        TList.Add
 007152B7    mov         edi,eax
 007152B9    mov         dl,16
 007152BB    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007152BE    call        TScanner.read
 007152C3    test        al,al
>007152C5    jne         007152A3
 007152C7    pop         ebp
 007152C8    pop         edi
 007152C9    pop         esi
 007152CA    pop         ebx
 007152CB    ret
*}
end;

//007152CC
procedure TParser.ParseParamList(L:TObjectList);
begin
{*
 007152CC    push        ebx
 007152CD    push        esi
 007152CE    mov         esi,edx
 007152D0    mov         ebx,eax
 007152D2    mov         dl,10
 007152D4    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007152D7    call        TScanner.read
 007152DC    test        al,al
>007152DE    je          007152F6
 007152E0    mov         edx,esi
 007152E2    mov         eax,ebx
 007152E4    call        TParser.ParseParamListWithoutBrackets
 007152E9    mov         dl,11
 007152EB    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007152EE    call        TScanner.expect
 007152F3    pop         esi
 007152F4    pop         ebx
 007152F5    ret
 007152F6    mov         edx,esi
 007152F8    mov         eax,ebx
 007152FA    call        TParser.ParseParamListWithoutBrackets
 007152FF    pop         esi
 00715300    pop         ebx
 00715301    ret
*}
end;

//00715304
function TParser.ParseProcedureCall(name:string):TCall;
begin
{*
 00715304    push        ebp
 00715305    mov         ebp,esp
 00715307    xor         ecx,ecx
 00715309    push        ecx
 0071530A    push        ecx
 0071530B    push        ecx
 0071530C    push        ecx
 0071530D    push        ecx
 0071530E    push        ecx
 0071530F    push        ecx
 00715310    push        ecx
 00715311    push        ebx
 00715312    push        esi
 00715313    push        edi
 00715314    mov         dword ptr [ebp-4],edx
 00715317    mov         dword ptr [ebp-0C],eax
 0071531A    mov         eax,dword ptr [ebp-4]
 0071531D    call        @UStrAddRef
 00715322    xor         eax,eax
 00715324    push        ebp
 00715325    push        71594E
 0071532A    push        dword ptr fs:[eax]
 0071532D    mov         dword ptr fs:[eax],esp
 00715330    xor         eax,eax
 00715332    push        ebp
 00715333    push        7153C0
 00715338    push        dword ptr fs:[eax]
 0071533B    mov         dword ptr fs:[eax],esp
 0071533E    lea         eax,[ebp-14]
 00715341    mov         edx,dword ptr [ebp-4]
 00715344    call        @WStrFromUStr
 00715349    mov         eax,dword ptr [ebp-14]
 0071534C    xor         edx,edx
 0071534E    call        00710FA4
 00715353    mov         edx,dword ptr ds:[670104];TProcedureExpression
 00715359    call        @AsClass
 0071535E    mov         ebx,eax
 00715360    mov         dl,1
 00715362    mov         eax,[0067A054];TProcedureStatement
 00715367    call        TProcedureStatement.Create;TProcedureStatement.Create
 0071536C    mov         dword ptr [ebp-10],eax
 0071536F    mov         eax,dword ptr [ebp-0C]
 00715372    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 00715375    mov         dl,10
 00715377    call        TScanner.read
 0071537C    test        al,al
>0071537E    je          0071539A
 00715380    mov         edx,dword ptr [ebx+18];TProcedureExpression.Parameters:TObjectList
 00715383    mov         eax,dword ptr [ebp-0C]
 00715386    call        TParser.ParseParamListWithoutBrackets
 0071538B    mov         eax,dword ptr [ebp-0C]
 0071538E    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 00715391    mov         dl,11
 00715393    call        TScanner.expect
>00715398    jmp         007153A5
 0071539A    mov         edx,dword ptr [ebx+18];TProcedureExpression.Parameters:TObjectList
 0071539D    mov         eax,dword ptr [ebp-0C]
 007153A0    call        TParser.ParseParamListWithoutBrackets
 007153A5    mov         eax,dword ptr [ebp-10]
 007153A8    mov         dword ptr [eax+1C],ebx;TProcedureStatement....................Proc:TProcedureExpression
 007153AB    xor         eax,eax
 007153AD    pop         edx
 007153AE    pop         ecx
 007153AF    pop         ecx
 007153B0    mov         dword ptr fs:[eax],edx
>007153B3    jmp         0071591E
 007153B8    xor         eax,eax
 007153BA    pop         edx
 007153BB    pop         ecx
 007153BC    pop         ecx
 007153BD    mov         dword ptr fs:[eax],edx
>007153C0    jmp         @HandleAnyException
 007153C5    call        @DoneExcept
 007153CA    xor         eax,eax
 007153CC    mov         dword ptr [ebp-10],eax
 007153CF    xor         edx,edx
 007153D1    push        ebp
 007153D2    push        715907
 007153D7    push        dword ptr fs:[edx]
 007153DA    mov         dword ptr fs:[edx],esp
 007153DD    lea         eax,[ebp-8]
 007153E0    mov         edx,dword ptr [ebp-4]
 007153E3    call        @UStrLAsg
 007153E8    lea         eax,[ebp-8]
 007153EB    mov         edx,71596C;'SYSTEM.'
 007153F0    call        004F9BD0
 007153F5    test        al,al
>007153F7    jne         00715408
 007153F9    lea         eax,[ebp-8]
 007153FC    mov         edx,715988;'SYSTEM::'
 00715401    call        004F9BD0
 00715406    test        al,al
 00715408    lea         eax,[ebp-8]
 0071540B    mov         edx,7159A8;'OUT.'
 00715410    call        004F9BD0
 00715415    test        al,al
>00715417    jne         007154BE
 0071541D    lea         eax,[ebp-8]
 00715420    mov         edx,7159C0;'CONSOLE.'
 00715425    call        004F9BD0
 0071542A    test        al,al
>0071542C    jne         007154BE
 00715432    lea         eax,[ebp-8]
 00715435    mov         edx,7159E0;'TEXT_IO.'
 0071543A    call        004F9BD0
 0071543F    test        al,al
>00715441    jne         007154BE
 00715443    lea         eax,[ebp-8]
 00715446    mov         edx,715A00;'ADA.TEXT_IO.'
 0071544B    call        004F9BD0
 00715450    test        al,al
>00715452    jne         007154BE
 00715454    lea         eax,[ebp-8]
 00715457    mov         edx,715A28;'TEXT_IO::'
 0071545C    call        004F9BD0
 00715461    test        al,al
>00715463    jne         007154BE
 00715465    lea         eax,[ebp-8]
 00715468    mov         edx,715A48;'ADA.TEXT_IO::'
 0071546D    call        004F9BD0
 00715472    test        al,al
>00715474    jne         007154BE
 00715476    lea         eax,[ebp-8]
 00715479    mov         edx,715A70;'ADA::TEXT_IO.'
 0071547E    call        004F9BD0
 00715483    test        al,al
>00715485    jne         007154BE
 00715487    lea         eax,[ebp-8]
 0071548A    mov         edx,715A98;'ADA::TEXT_IO::'
 0071548F    call        004F9BD0
 00715494    test        al,al
>00715496    jne         007154BE
 00715498    lea         eax,[ebp-8]
 0071549B    mov         edx,715AC4;'OUT::'
 007154A0    call        004F9BD0
 007154A5    test        al,al
>007154A7    jne         007154BE
 007154A9    lea         eax,[ebp-8]
 007154AC    mov         edx,715ADC;'CONSOLE::'
 007154B1    call        004F9BD0
 007154B6    test        al,al
>007154B8    jne         007154BE
 007154BA    xor         ebx,ebx
>007154BC    jmp         007154C0
 007154BE    mov         bl,1
 007154C0    lea         edx,[ebp-18]
 007154C3    mov         eax,dword ptr [ebp-8]
 007154C6    call        UpperCase
 007154CB    mov         edx,dword ptr [ebp-18]
 007154CE    lea         eax,[ebp-8]
 007154D1    call        @UStrLAsg
 007154D6    mov         eax,dword ptr [ebp-8]
 007154D9    mov         edx,715AFC;'WAIT'
 007154DE    call        @UStrEqual
>007154E3    jne         0071552D
 007154E5    mov         dl,1
 007154E7    mov         eax,[0067ACC0];TWaitStatement
 007154EC    call        TCall.Create;TWaitStatement.Create
 007154F1    mov         dword ptr [ebp-10],eax
 007154F4    mov         eax,dword ptr [ebp-0C]
 007154F7    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 007154FA    mov         dl,10
 007154FC    call        TScanner.read
 00715501    mov         ebx,eax
 00715503    mov         dl,1
 00715505    mov         eax,dword ptr [ebp-0C]
 00715508    call        TParser.ParseExpression
 0071550D    mov         edx,dword ptr [ebp-10]
 00715510    mov         dword ptr [edx+1C],eax;TWaitStatement................time:TExpression
 00715513    test        bl,bl
>00715515    je          007158C9
 0071551B    mov         eax,dword ptr [ebp-0C]
 0071551E    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 00715521    mov         dl,11
 00715523    call        TScanner.expect
>00715528    jmp         007158C9
 0071552D    mov         eax,dword ptr [ebp-8]
 00715530    mov         edx,715B14;'PRESS'
 00715535    call        @UStrEqual
>0071553A    jne         0071558B
 0071553C    mov         dl,1
 0071553E    mov         eax,[0067AE6C];TPressStatement
 00715543    call        TCall.Create;TPressStatement.Create
 00715548    mov         dword ptr [ebp-10],eax
 0071554B    mov         eax,dword ptr [ebp-10]
 0071554E    mov         byte ptr [eax+20],0;TPressStatement.Release:Boolean
 00715552    mov         eax,dword ptr [ebp-0C]
 00715555    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 00715558    mov         dl,10
 0071555A    call        TScanner.read
 0071555F    mov         ebx,eax
 00715561    mov         dl,1
 00715563    mov         eax,dword ptr [ebp-0C]
 00715566    call        TParser.ParseExpression
 0071556B    mov         edx,dword ptr [ebp-10]
 0071556E    mov         dword ptr [edx+1C],eax;TPressStatement.expression:TExpression
 00715571    test        bl,bl
>00715573    je          007158C9
 00715579    mov         eax,dword ptr [ebp-0C]
 0071557C    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071557F    mov         dl,11
 00715581    call        TScanner.expect
>00715586    jmp         007158C9
 0071558B    mov         eax,dword ptr [ebp-8]
 0071558E    mov         edx,715B2C;'RELEASE'
 00715593    call        @UStrEqual
>00715598    jne         007155E9
 0071559A    mov         dl,1
 0071559C    mov         eax,[0067AE6C];TPressStatement
 007155A1    call        TCall.Create;TPressStatement.Create
 007155A6    mov         dword ptr [ebp-10],eax
 007155A9    mov         eax,dword ptr [ebp-10]
 007155AC    mov         byte ptr [eax+20],1;TPressStatement.Release:Boolean
 007155B0    mov         eax,dword ptr [ebp-0C]
 007155B3    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 007155B6    mov         dl,10
 007155B8    call        TScanner.read
 007155BD    mov         ebx,eax
 007155BF    mov         dl,1
 007155C1    mov         eax,dword ptr [ebp-0C]
 007155C4    call        TParser.ParseExpression
 007155C9    mov         edx,dword ptr [ebp-10]
 007155CC    mov         dword ptr [edx+1C],eax;TPressStatement.expression:TExpression
 007155CF    test        bl,bl
>007155D1    je          007158C9
 007155D7    mov         eax,dword ptr [ebp-0C]
 007155DA    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 007155DD    mov         dl,11
 007155DF    call        TScanner.expect
>007155E4    jmp         007158C9
 007155E9    mov         eax,dword ptr [ebp-8]
 007155EC    mov         edx,715B48;'DISPLAY'
 007155F1    call        @UStrEqual
>007155F6    je          007156BC
 007155FC    mov         eax,dword ptr [ebp-8]
 007155FF    mov         edx,715B64;'WRITELN'
 00715604    call        @UStrEqual
>00715609    je          007156BC
 0071560F    mov         eax,dword ptr [ebp-8]
 00715612    mov         edx,715B80;'WRITE'
 00715617    call        @UStrEqual
>0071561C    je          007156BC
 00715622    mov         eax,dword ptr [ebp-8]
 00715625    mov         edx,715B98;'WRITELINE'
 0071562A    call        @UStrEqual
>0071562F    je          007156BC
 00715635    mov         eax,dword ptr [ebp-8]
 00715638    mov         edx,715BB8;'PRINTLN'
 0071563D    call        @UStrEqual
>00715642    je          007156BC
 00715644    mov         eax,dword ptr [ebp-8]
 00715647    mov         edx,715BD4;'PRINT'
 0071564C    call        @UStrEqual
>00715651    je          007156BC
 00715653    mov         eax,dword ptr [ebp-8]
 00715656    mov         edx,715BEC;'PRINTF'
 0071565B    call        @UStrEqual
>00715660    je          007156BC
 00715662    mov         eax,dword ptr [ebp-8]
 00715665    mov         edx,715C08;'PUT_LINE'
 0071566A    call        @UStrEqual
>0071566F    je          007156BC
 00715671    mov         eax,dword ptr [ebp-8]
 00715674    mov         edx,715C28;'SHOWMESSAGE'
 00715679    call        @UStrEqual
>0071567E    je          007156BC
 00715680    mov         eax,dword ptr [ebp-8]
 00715683    mov         edx,715C4C;'SHOWMSG'
 00715688    call        @UStrEqual
>0071568D    je          007156BC
 0071568F    mov         eax,dword ptr [ebp-8]
 00715692    mov         edx,715C68;'MSGBOX'
 00715697    call        @UStrEqual
>0071569C    je          007156BC
 0071569E    mov         eax,dword ptr [ebp-8]
 007156A1    mov         edx,715C84;'MESSAGEBOX'
 007156A6    call        @UStrEqual
>007156AB    je          007156BC
 007156AD    mov         eax,dword ptr [ebp-8]
 007156B0    mov         edx,715CA8;'SAY'
 007156B5    call        @UStrEqual
>007156BA    jne         007156D0
 007156BC    mov         dl,1
 007156BE    mov         eax,[0067B15C];TDisplayStatement
 007156C3    call        TCall.Create;TDisplayStatement.Create
 007156C8    mov         dword ptr [ebp-10],eax
>007156CB    jmp         007158C9
 007156D0    mov         eax,dword ptr [ebp-8]
 007156D3    mov         edx,715CBC;'HALT'
 007156D8    call        @UStrEqual
>007156DD    je          00715710
 007156DF    mov         eax,dword ptr [ebp-8]
 007156E2    mov         edx,715CD4;'EXIT'
 007156E7    call        @UStrEqual
>007156EC    je          00715710
 007156EE    mov         eax,dword ptr [ebp-8]
 007156F1    mov         edx,715CEC;'STOP'
 007156F6    call        @UStrEqual
>007156FB    je          00715710
 007156FD    mov         eax,dword ptr [ebp-8]
 00715700    mov         edx,715D04;'QUIT'
 00715705    call        @UStrEqual
>0071570A    jne         007157E2
 00715710    test        bl,bl
>00715712    je          00715747
 00715714    push        715D1C;'"Out" does not have a method named "'
 00715719    push        dword ptr [ebp-8]
 0071571C    push        715D74;'"'
 00715721    lea         eax,[ebp-1C]
 00715724    mov         edx,3
 00715729    call        @UStrCatN
 0071572E    mov         ecx,dword ptr [ebp-1C]
 00715731    mov         dl,1
 00715733    mov         eax,[00576F6C];ECompiler
 00715738    call        Exception.Create;ECompiler.Create
 0071573D    call        @RaiseExcept
>00715742    jmp         007158C9
 00715747    mov         dl,1
 00715749    mov         eax,[0067B034];THaltStatement
 0071574E    call        TCall.Create;THaltStatement.Create
 00715753    mov         dword ptr [ebp-10],eax
 00715756    mov         eax,dword ptr [ebp-0C]
 00715759    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071575C    mov         edx,715D84;'RUN'
 00715761    call        00710CA4
 00715766    test        al,al
>00715768    jne         007158C9
 0071576E    mov         eax,dword ptr [ebp-0C]
 00715771    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 00715774    mov         edx,715D98;'APPLICATION'
 00715779    call        00710CA4
 0071577E    test        al,al
>00715780    jne         007158C9
 00715786    mov         eax,dword ptr [ebp-0C]
 00715789    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071578C    mov         edx,715DBC;'PROGRAM'
 00715791    call        00710CA4
 00715796    test        al,al
>00715798    jne         007158C9
 0071579E    mov         eax,dword ptr [ebp-0C]
 007157A1    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 007157A4    mov         edx,715DD8;'PROGRAMME'
 007157A9    call        00710CA4
 007157AE    test        al,al
>007157B0    jne         007158C9
 007157B6    mov         eax,dword ptr [ebp-0C]
 007157B9    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 007157BC    mov         dl,5A
 007157BE    call        TScanner.read
 007157C3    test        al,al
>007157C5    je          007158C9
 007157CB    mov         eax,dword ptr [ebp-0C]
 007157CE    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 007157D1    mov         edx,715DF8;'DOS'
 007157D6    call        00710CA4
 007157DB    test        al,al
>007157DD    jmp         007158C9
 007157E2    mov         eax,dword ptr [ebp-8]
 007157E5    mov         edx,715E0C;'NEW_LINE'
 007157EA    call        @UStrEqual
>007157EF    jne         0071582B
 007157F1    mov         dl,1
 007157F3    mov         eax,[0067B15C];TDisplayStatement
 007157F8    call        TCall.Create;TDisplayStatement.Create
 007157FD    mov         dword ptr [ebp-10],eax
 00715800    mov         eax,dword ptr [ebp-0C]
 00715803    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 00715806    mov         dl,10
 00715808    call        TScanner.read
 0071580D    test        al,al
>0071580F    je          0071581E
 00715811    mov         eax,dword ptr [ebp-0C]
 00715814    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 00715817    mov         dl,11
 00715819    call        TScanner.expect
 0071581E    xor         eax,eax
 00715820    pop         edx
 00715821    pop         ecx
 00715822    pop         ecx
 00715823    mov         dword ptr fs:[eax],edx
>00715826    jmp         0071591E
 0071582B    mov         eax,dword ptr [ebp-8]
 0071582E    mov         edx,715E2C;'READKEY'
 00715833    call        @UStrEqual
>00715838    jne         00715874
 0071583A    mov         dl,1
 0071583C    mov         eax,[00679E88];TCall
 00715841    call        TCall.Create;TCall.Create
 00715846    mov         dword ptr [ebp-10],eax
 00715849    mov         eax,dword ptr [ebp-0C]
 0071584C    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071584F    mov         dl,10
 00715851    call        TScanner.read
 00715856    test        al,al
>00715858    je          00715867
 0071585A    mov         eax,dword ptr [ebp-0C]
 0071585D    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 00715860    mov         dl,11
 00715862    call        TScanner.expect
 00715867    xor         eax,eax
 00715869    pop         edx
 0071586A    pop         ecx
 0071586B    pop         ecx
 0071586C    mov         dword ptr fs:[eax],edx
>0071586F    jmp         0071591E
 00715874    mov         eax,dword ptr [ebp-8]
 00715877    mov         edx,715E48;'PUT'
 0071587C    call        @UStrEqual
>00715881    jne         0071589B
 00715883    mov         dl,1
 00715885    mov         eax,[0067B15C];TDisplayStatement
 0071588A    call        TCall.Create;TDisplayStatement.Create
 0071588F    mov         dword ptr [ebp-10],eax
 00715892    mov         eax,dword ptr [ebp-10]
 00715895    mov         byte ptr [eax+18],1;TDisplayStatement.DotDotDot:Boolean
>00715899    jmp         007158C9
 0071589B    push        715E5C;'Unknown command: "'
 007158A0    push        dword ptr [ebp-4]
 007158A3    push        715D74;'"'
 007158A8    lea         eax,[ebp-20]
 007158AB    mov         edx,3
 007158B0    call        @UStrCatN
 007158B5    mov         ecx,dword ptr [ebp-20]
 007158B8    mov         dl,1
 007158BA    mov         eax,[00576F6C];ECompiler
 007158BF    call        Exception.Create;ECompiler.Create
 007158C4    call        @RaiseExcept
 007158C9    mov         eax,dword ptr [ebp-10]
 007158CC    add         eax,10;TDisplayStatement.FunctionName:string
 007158CF    mov         edx,dword ptr [ebp-4]
 007158D2    call        @UStrAsg
 007158D7    mov         eax,dword ptr [ebp-10]
 007158DA    mov         edx,dword ptr [eax+14];TDisplayStatement.Parameters:TObjectList
 007158DD    mov         eax,dword ptr [ebp-0C]
 007158E0    call        TParser.ParseParamList
 007158E5    mov         eax,dword ptr [ebp-0C]
 007158E8    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 007158EB    mov         dl,1A
 007158ED    call        TScanner.read
 007158F2    test        al,al
>007158F4    je          007158FD
 007158F6    mov         eax,dword ptr [ebp-10]
 007158F9    mov         byte ptr [eax+18],1;TDisplayStatement.DotDotDot:Boolean
 007158FD    xor         eax,eax
 007158FF    pop         edx
 00715900    pop         ecx
 00715901    pop         ecx
 00715902    mov         dword ptr fs:[eax],edx
>00715905    jmp         0071591E
>00715907    jmp         @HandleAnyException
 0071590C    lea         eax,[ebp-10]
 0071590F    call        004F9A38
 00715914    call        @RaiseAgain
 00715919    call        @DoneExcept
 0071591E    xor         eax,eax
 00715920    pop         edx
 00715921    pop         ecx
 00715922    pop         ecx
 00715923    mov         dword ptr fs:[eax],edx
 00715926    push        715955
 0071592B    lea         eax,[ebp-20]
 0071592E    mov         edx,3
 00715933    call        @UStrArrayClr
 00715938    lea         eax,[ebp-14]
 0071593B    call        @WStrClr
 00715940    lea         eax,[ebp-8]
 00715943    mov         edx,2
 00715948    call        @UStrArrayClr
 0071594D    ret
>0071594E    jmp         @HandleFinally
>00715953    jmp         0071592B
 00715955    mov         eax,dword ptr [ebp-10]
 00715958    pop         edi
 00715959    pop         esi
 0071595A    pop         ebx
 0071595B    mov         esp,ebp
 0071595D    pop         ebp
 0071595E    ret
*}
end;

//00715E84
{*procedure TParser.ParseDottedTerm(?:?);
begin
 00715E84    push        ebp
 00715E85    mov         ebp,esp
 00715E87    push        0
 00715E89    push        ebx
 00715E8A    push        esi
 00715E8B    push        edi
 00715E8C    mov         edi,edx
 00715E8E    mov         esi,eax
 00715E90    xor         eax,eax
 00715E92    push        ebp
 00715E93    push        715FEC
 00715E98    push        dword ptr fs:[eax]
 00715E9B    mov         dword ptr fs:[eax],esp
 00715E9E    mov         dl,10
 00715EA0    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00715EA3    call        TScanner.read
 00715EA8    test        al,al
>00715EAA    je          00715EC4
 00715EAC    mov         edx,edi
 00715EAE    mov         eax,esi
 00715EB0    call        TParser.ParseQualifiedId
 00715EB5    mov         dl,11
 00715EB7    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00715EBA    call        TScanner.expect
>00715EBF    jmp         00715FAB
 00715EC4    mov         ebx,dword ptr [esi+4];TParser.s:TScanner
 00715EC7    movzx       eax,byte ptr [ebx+8];TScanner.token:TToken
 00715ECB    cmp         al,3
>00715ECD    je          00715ED3
 00715ECF    cmp         al,5
>00715ED1    jne         00715EE9
 00715ED3    mov         eax,edi
 00715ED5    mov         edx,dword ptr [ebx+0C]
 00715ED8    call        @UStrAsg
 00715EDD    mov         eax,ebx
 00715EDF    call        TScanner.Next
>00715EE4    jmp         00715FAB
 00715EE9    mov         ecx,716008;'Identifier or ( expected'
 00715EEE    mov         dl,1
 00715EF0    mov         eax,[00577004];ETokenExpected
 00715EF5    call        Exception.Create;ETokenExpected.Create
 00715EFA    call        @RaiseExcept
>00715EFF    jmp         00715FAB
 00715F04    cmp         bl,20
>00715F07    jne         00715F17
 00715F09    mov         eax,edi
 00715F0B    mov         edx,716048;'.'
 00715F10    call        @UStrCat
>00715F15    jmp         00715F36
 00715F17    cmp         bl,21
>00715F1A    jne         00715F2A
 00715F1C    mov         eax,edi
 00715F1E    mov         edx,716048;'.'
 00715F23    call        @UStrCat
>00715F28    jmp         00715F36
 00715F2A    mov         eax,edi
 00715F2C    mov         edx,716048;'.'
 00715F31    call        @UStrCat
 00715F36    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00715F39    call        TScanner.Next
 00715F3E    mov         dl,10
 00715F40    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00715F43    call        TScanner.read
 00715F48    test        al,al
>00715F4A    je          00715F6C
 00715F4C    lea         edx,[ebp-4]
 00715F4F    mov         eax,esi
 00715F51    call        TParser.ParseQualifiedId
 00715F56    mov         edx,dword ptr [ebp-4]
 00715F59    mov         eax,edi
 00715F5B    call        @UStrCat
 00715F60    mov         dl,11
 00715F62    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00715F65    call        TScanner.expect
>00715F6A    jmp         00715FAB
 00715F6C    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00715F6F    cmp         byte ptr [eax+8],3;TScanner.token:TToken
>00715F73    je          00715F7E
 00715F75    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00715F78    cmp         byte ptr [eax+8],5;TScanner.token:TToken
>00715F7C    jne         00715F95
 00715F7E    mov         eax,edi
 00715F80    mov         edx,dword ptr [esi+4];TParser.s:TScanner
 00715F83    mov         edx,dword ptr [edx+0C]
 00715F86    call        @UStrCat
 00715F8B    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00715F8E    call        TScanner.Next
>00715F93    jmp         00715FAB
 00715F95    mov         ecx,716008;'Identifier or ( expected'
 00715F9A    mov         dl,1
 00715F9C    mov         eax,[00577004];ETokenExpected
 00715FA1    call        Exception.Create;ETokenExpected.Create
 00715FA6    call        @RaiseExcept
 00715FAB    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00715FAE    movzx       ebx,byte ptr [eax+8];TScanner.token:TToken
 00715FB2    cmp         bl,1D
>00715FB5    je          00715F04
 00715FBB    cmp         bl,1E
>00715FBE    je          00715F04
 00715FC4    cmp         bl,20
>00715FC7    je          00715F04
 00715FCD    cmp         bl,21
>00715FD0    je          00715F04
 00715FD6    xor         eax,eax
 00715FD8    pop         edx
 00715FD9    pop         ecx
 00715FDA    pop         ecx
 00715FDB    mov         dword ptr fs:[eax],edx
 00715FDE    push        715FF3
 00715FE3    lea         eax,[ebp-4]
 00715FE6    call        @UStrClr
 00715FEB    ret
>00715FEC    jmp         @HandleFinally
>00715FF1    jmp         00715FE3
 00715FF3    pop         edi
 00715FF4    pop         esi
 00715FF5    pop         ebx
 00715FF6    pop         ecx
 00715FF7    pop         ebp
 00715FF8    ret
end;*}

//0071604C
{*procedure TParser.ParseQualifiedId(?:?);
begin
 0071604C    push        ebp
 0071604D    mov         ebp,esp
 0071604F    push        0
 00716051    push        ebx
 00716052    push        esi
 00716053    mov         esi,edx
 00716055    mov         ebx,eax
 00716057    xor         eax,eax
 00716059    push        ebp
 0071605A    push        7160B4
 0071605F    push        dword ptr fs:[eax]
 00716062    mov         dword ptr fs:[eax],esp
 00716065    mov         edx,esi
 00716067    mov         eax,ebx
 00716069    call        TParser.ParseDottedTerm
>0071606E    jmp         00716090
 00716070    lea         edx,[ebp-4]
 00716073    mov         eax,ebx
 00716075    call        TParser.ParseDottedTerm
 0071607A    push        dword ptr [ebp-4]
 0071607D    push        7160CC;'.'
 00716082    push        dword ptr [esi]
 00716084    mov         eax,esi
 00716086    mov         edx,3
 0071608B    call        @UStrCatN
 00716090    mov         dl,1F
 00716092    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00716095    call        00710C2C
 0071609A    test        al,al
>0071609C    jne         00716070
 0071609E    xor         eax,eax
 007160A0    pop         edx
 007160A1    pop         ecx
 007160A2    pop         ecx
 007160A3    mov         dword ptr fs:[eax],edx
 007160A6    push        7160BB
 007160AB    lea         eax,[ebp-4]
 007160AE    call        @UStrClr
 007160B3    ret
>007160B4    jmp         @HandleFinally
>007160B9    jmp         007160AB
 007160BB    pop         esi
 007160BC    pop         ebx
 007160BD    pop         ecx
 007160BE    pop         ebp
 007160BF    ret
end;*}

//007160D0
function TParser.ParseAsmLine:TStatement;
begin
{*
 007160D0    push        ebp
 007160D1    mov         ebp,esp
 007160D3    push        0
 007160D5    push        0
 007160D7    push        ebx
 007160D8    push        esi
 007160D9    push        edi
 007160DA    mov         ebx,eax
 007160DC    xor         eax,eax
 007160DE    push        ebp
 007160DF    push        71624A
 007160E4    push        dword ptr fs:[eax]
 007160E7    mov         dword ptr fs:[eax],esp
 007160EA    xor         esi,esi
 007160EC    mov         edi,dword ptr [ebx+4];TParser.s:TScanner
 007160EF    movzx       eax,byte ptr [edi+8];TScanner.token:TToken
 007160F3    cmp         eax,28
>007160F6    jge         00716114
 007160F8    sub         eax,3
>007160FB    je          0071613A
 007160FD    sub         eax,14
>00716100    je          0071622F
 00716106    sub         eax,0F
>00716109    je          00716201
>0071610F    jmp         00716219
 00716114    add         eax,0FFFFFFD8
 00716117    sub         eax,2
>0071611A    jb          00716201
 00716120    add         eax,0FFFFFFEA
 00716123    sub         eax,3
>00716126    jb          00716201
 0071612C    sub         eax,29
>0071612F    jne         00716219
>00716135    jmp         0071622F
 0071613A    lea         edx,[ebp-4]
 0071613D    mov         eax,dword ptr [edi+0C]
 00716140    call        UpperCase
 00716145    mov         eax,dword ptr [ebp-4]
 00716148    mov         edx,716268;'MOV'
 0071614D    call        @UStrEqual
>00716152    jne         007161B7
 00716154    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00716157    call        TScanner.Next
 0071615C    mov         esi,dword ptr [ebx+4];TParser.s:TScanner
 0071615F    cmp         byte ptr [esi+8],3;TScanner.token:TToken
>00716163    jne         0071619F
 00716165    lea         eax,[ebp-8]
 00716168    mov         edx,dword ptr [esi+0C]
 0071616B    call        @UStrLAsg
 00716170    mov         eax,esi
 00716172    call        TScanner.Next
 00716177    mov         dl,16
 00716179    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071617C    call        TScanner.expect
 00716181    mov         dl,1
 00716183    mov         eax,ebx
 00716185    call        TParser.ParseExpression
 0071618A    test        eax,eax
 0071618C    mov         dl,1
 0071618E    mov         eax,[0067ABD4];TEmptyStatement
 00716193    call        TObject.Create;TEmptyStatement.Create
 00716198    mov         esi,eax
>0071619A    jmp         0071622F
 0071619F    mov         ecx,71627C;'Register name expected'
 007161A4    mov         dl,1
 007161A6    mov         eax,[00577004];ETokenExpected
 007161AB    call        Exception.Create;ETokenExpected.Create
 007161B0    call        @RaiseExcept
>007161B5    jmp         0071622F
 007161B7    mov         eax,dword ptr [ebp-4]
 007161BA    mov         edx,7162B8;'INT'
 007161BF    call        @UStrEqual
>007161C4    jne         007161E9
 007161C6    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007161C9    call        TScanner.Next
 007161CE    mov         dl,1
 007161D0    mov         eax,ebx
 007161D2    call        TParser.ParseExpression
 007161D7    test        eax,eax
 007161D9    mov         dl,1
 007161DB    mov         eax,[0067ABD4];TEmptyStatement
 007161E0    call        TObject.Create;TEmptyStatement.Create
 007161E5    mov         esi,eax
>007161E7    jmp         0071622F
 007161E9    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007161EC    call        TScanner.Next
 007161F1    mov         dl,1
 007161F3    mov         eax,[0067ABD4];TEmptyStatement
 007161F8    call        TObject.Create;TEmptyStatement.Create
 007161FD    mov         esi,eax
>007161FF    jmp         0071622F
 00716201    mov         ecx,7162CC;'Only MOV and INT opcodes are implemented so far'
 00716206    mov         dl,1
 00716208    mov         eax,[00576F6C];ECompiler
 0071620D    call        Exception.Create;ECompiler.Create
 00716212    call        @RaiseExcept
>00716217    jmp         0071622F
 00716219    mov         ecx,716338;'Assembly language opcode expected'
 0071621E    mov         dl,1
 00716220    mov         eax,[00576F6C];ECompiler
 00716225    call        Exception.Create;ECompiler.Create
 0071622A    call        @RaiseExcept
 0071622F    xor         eax,eax
 00716231    pop         edx
 00716232    pop         ecx
 00716233    pop         ecx
 00716234    mov         dword ptr fs:[eax],edx
 00716237    push        716251
 0071623C    lea         eax,[ebp-8]
 0071623F    mov         edx,2
 00716244    call        @UStrArrayClr
 00716249    ret
>0071624A    jmp         @HandleFinally
>0071624F    jmp         0071623C
 00716251    mov         eax,esi
 00716253    pop         edi
 00716254    pop         esi
 00716255    pop         ebx
 00716256    pop         ecx
 00716257    pop         ecx
 00716258    pop         ebp
 00716259    ret
*}
end;

//0071637C
function TParser.ParseIdLine:TStatement;
begin
{*
 0071637C    push        ebp
 0071637D    mov         ebp,esp
 0071637F    mov         ecx,5
 00716384    push        0
 00716386    push        0
 00716388    dec         ecx
>00716389    jne         00716384
 0071638B    push        ecx
 0071638C    push        ebx
 0071638D    push        esi
 0071638E    push        edi
 0071638F    mov         edi,eax
 00716391    xor         eax,eax
 00716393    push        ebp
 00716394    push        7167F8
 00716399    push        dword ptr fs:[eax]
 0071639C    mov         dword ptr fs:[eax],esp
 0071639F    mov         dl,2C
 007163A1    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 007163A4    call        TScanner.read
 007163A9    mov         ebx,eax
 007163AB    lea         edx,[ebp-4]
 007163AE    mov         eax,edi
 007163B0    call        TParser.ParseQualifiedId
 007163B5    lea         edx,[ebp-10]
 007163B8    mov         eax,dword ptr [ebp-4]
 007163BB    call        UpperCase
 007163C0    mov         eax,dword ptr [ebp-10]
 007163C3    mov         edx,716818;'END'
 007163C8    call        @UStrEqual
 007163CD    sete        al
 007163D0    mov         edx,dword ptr [edi+4];TParser.s:TScanner
 007163D3    movzx       ecx,byte ptr [edx+8];TScanner.token:TToken
 007163D7    cmp         ecx,6C
>007163DA    ja          0071674E
 007163E0    movzx       ecx,byte ptr [ecx+7163EE]
 007163E7    jmp         dword ptr [ecx*4+71645B]
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          4
 007163E7    db          0
 007163E7    db          0
 007163E7    db          4
 007163E7    db          0
 007163E7    db          4
 007163E7    db          4
 007163E7    db          4
 007163E7    db          4
 007163E7    db          4
 007163E7    db          4
 007163E7    db          4
 007163E7    db          0
 007163E7    db          5
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          6
 007163E7    db          10
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          3
 007163E7    db          4
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          4
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          4
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          2
 007163E7    db          2
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          8
 007163E7    db          9
 007163E7    db          1
 007163E7    db          0
 007163E7    db          3
 007163E7    db          0
 007163E7    db          4
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          3
 007163E7    db          0
 007163E7    db          0
 007163E7    db          2
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          4
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          11
 007163E7    db          0
 007163E7    db          7
 007163E7    db          0
 007163E7    db          0
 007163E7    db          11
 007163E7    db          11
 007163E7    db          0
 007163E7    db          0
 007163E7    db          4
 007163E7    db          0
 007163E7    db          0
 007163E7    db          0
 007163E7    db          6
 007163E7    dd          0071674E
 007163E7    dd          0071648B
 007163E7    dd          007164D1
 007163E7    dd          00716513
 007163E7    dd          0071659C
 007163E7    dd          007165AE
 007163E7    dd          007165C0
 007163E7    dd          007165E0
 007163E7    dd          00716609
 007163E7    dd          0071668C
 007163E7    dd          0071670C
 007163E7    dd          00716724
 0071648B    mov         dl,1
 0071648D    mov         eax,[0067A238];TAssignment
 00716492    call        TObject.Create;TAssignment.Create
 00716497    mov         esi,eax
 00716499    lea         eax,[ebp-14]
 0071649C    mov         edx,dword ptr [ebp-4]
 0071649F    call        @WStrFromUStr
 007164A4    mov         eax,dword ptr [ebp-14]
 007164A7    mov         edx,ebx
 007164A9    call        00710FA4
 007164AE    mov         dword ptr [esi+14],eax;TAssignment.RValue:TExpression
 007164B1    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 007164B4    call        TScanner.Next
 007164B9    mov         dl,1
 007164BB    mov         eax,edi
 007164BD    call        TParser.ParseExpressionSequence
 007164C2    mov         dword ptr [esi+10],eax;TAssignment.LValue:TExpression
 007164C5    mov         byte ptr [esi+18],1;TAssignment.Implies:Boolean
 007164C9    mov         dword ptr [ebp-8],esi
>007164CC    jmp         00716764
 007164D1    mov         dl,1
 007164D3    mov         eax,[0067A238];TAssignment
 007164D8    call        TObject.Create;TAssignment.Create
 007164DD    mov         esi,eax
 007164DF    lea         eax,[ebp-18]
 007164E2    mov         edx,dword ptr [ebp-4]
 007164E5    call        @WStrFromUStr
 007164EA    mov         eax,dword ptr [ebp-18]
 007164ED    mov         edx,ebx
 007164EF    call        00710FA4
 007164F4    mov         dword ptr [esi+10],eax;TAssignment.LValue:TExpression
 007164F7    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 007164FA    call        TScanner.Next
 007164FF    mov         dl,1
 00716501    mov         eax,edi
 00716503    call        TParser.ParseExpressionSequence
 00716508    mov         dword ptr [esi+14],eax;TAssignment.RValue:TExpression
 0071650B    mov         dword ptr [ebp-8],esi
>0071650E    jmp         00716764
 00716513    mov         dl,1
 00716515    mov         eax,[0067A238];TAssignment
 0071651A    call        TObject.Create;TAssignment.Create
 0071651F    mov         esi,eax
 00716521    lea         eax,[ebp-1C]
 00716524    mov         edx,dword ptr [ebp-4]
 00716527    call        @WStrFromUStr
 0071652C    mov         eax,dword ptr [ebp-1C]
 0071652F    mov         edx,ebx
 00716531    call        00710FA4
 00716536    mov         edx,eax
 00716538    mov         cl,1
 0071653A    mov         eax,edi
 0071653C    call        TParser.ParseAndSummation
 00716541    mov         dword ptr [esi+10],eax;TAssignment.LValue:TExpression
 00716544    mov         edx,dword ptr [edi+4];TParser.s:TScanner
 00716547    movzx       eax,byte ptr [edx+8];TScanner.token:TToken
 0071654B    cmp         al,38
>0071654D    je          00716553
 0071654F    cmp         al,4B
>00716551    jne         00716568
 00716553    mov         eax,edx
 00716555    call        TScanner.Next
 0071655A    mov         dl,1
 0071655C    mov         eax,edi
 0071655E    call        TParser.ParseExpressionSequence
 00716563    mov         dword ptr [esi+14],eax;TAssignment.RValue:TExpression
>00716566    jmp         00716594
 00716568    cmp         al,3F
>0071656A    jne         0071658B
 0071656C    mov         eax,edx
 0071656E    call        TScanner.Next
 00716573    mov         eax,dword ptr [esi+10];TAssignment.LValue:TExpression
 00716576    mov         dword ptr [esi+14],eax;TAssignment.RValue:TExpression
 00716579    mov         dl,1
 0071657B    mov         eax,edi
 0071657D    call        TParser.ParseExpressionSequence
 00716582    mov         dword ptr [esi+10],eax;TAssignment.LValue:TExpression
 00716585    mov         byte ptr [esi+18],1;TAssignment.Implies:Boolean
>00716589    jmp         00716594
 0071658B    mov         eax,edx
 0071658D    mov         dl,4B
 0071658F    call        TScanner.expect
 00716594    mov         dword ptr [ebp-8],esi
>00716597    jmp         00716764
 0071659C    mov         edx,dword ptr [ebp-4]
 0071659F    mov         eax,edi
 007165A1    call        TParser.ParseProcedureCall
 007165A6    mov         dword ptr [ebp-8],eax
>007165A9    jmp         00716764
 007165AE    mov         edx,dword ptr [ebp-4]
 007165B1    mov         eax,edi
 007165B3    call        TParser.ParseProcedureCall
 007165B8    mov         dword ptr [ebp-8],eax
>007165BB    jmp         00716764
 007165C0    test        al,al
>007165C2    jne         007165D6
 007165C4    mov         edx,dword ptr [ebp-4]
 007165C7    mov         eax,edi
 007165C9    call        TParser.ParseProcedureCall
 007165CE    mov         dword ptr [ebp-8],eax
>007165D1    jmp         00716764
 007165D6    xor         eax,eax
 007165D8    mov         dword ptr [ebp-8],eax
>007165DB    jmp         00716764
 007165E0    test        al,al
>007165E2    je          007165EE
 007165E4    xor         eax,eax
 007165E6    mov         dword ptr [ebp-8],eax
>007165E9    jmp         00716764
 007165EE    mov         ecx,71682C;'ELSE after an indentifier? What does that mean?'
 007165F3    mov         dl,1
 007165F5    mov         eax,[00576F6C];ECompiler
 007165FA    call        Exception.Create;ECompiler.Create
 007165FF    call        @RaiseExcept
>00716604    jmp         00716764
 00716609    mov         eax,edx
 0071660B    call        TScanner.Next
 00716610    mov         dl,1
 00716612    mov         eax,[00680DF8];TBinaryOp
 00716617    call        TObject.Create;TBinaryOp.Create
 0071661C    mov         dword ptr [ebp-0C],eax
 0071661F    mov         eax,dword ptr [ebp-0C]
 00716622    mov         byte ptr [eax+20],0;TBinaryOp.Operation:TOperation
 00716626    mov         ecx,716898;'1'
 0071662B    mov         dl,1
 0071662D    mov         eax,[006808C0];TConstant
 00716632    call        TConstant.Create;TConstant.Create
 00716637    mov         edx,dword ptr [ebp-0C]
 0071663A    mov         dword ptr [edx+1C],eax;TBinaryOp.RHS:TExpression
 0071663D    lea         eax,[ebp-20]
 00716640    mov         edx,dword ptr [ebp-4]
 00716643    call        @WStrFromUStr
 00716648    mov         eax,dword ptr [ebp-20]
 0071664B    mov         edx,ebx
 0071664D    call        00710FA4
 00716652    mov         edx,dword ptr [ebp-0C]
 00716655    mov         dword ptr [edx+18],eax;TBinaryOp.LHS:TExpression
 00716658    mov         dl,1
 0071665A    mov         eax,[0067A238];TAssignment
 0071665F    call        TObject.Create;TAssignment.Create
 00716664    mov         esi,eax
 00716666    lea         eax,[ebp-24]
 00716669    mov         edx,dword ptr [ebp-4]
 0071666C    call        @WStrFromUStr
 00716671    mov         eax,dword ptr [ebp-24]
 00716674    mov         edx,ebx
 00716676    call        00710FA4
 0071667B    mov         dword ptr [esi+10],eax;TAssignment.LValue:TExpression
 0071667E    mov         eax,dword ptr [ebp-0C]
 00716681    mov         dword ptr [esi+14],eax;TAssignment.RValue:TExpression
 00716684    mov         dword ptr [ebp-8],esi
>00716687    jmp         00716764
 0071668C    mov         eax,edx
 0071668E    call        TScanner.Next
 00716693    mov         dl,1
 00716695    mov         eax,[00680DF8];TBinaryOp
 0071669A    call        TObject.Create;TBinaryOp.Create
 0071669F    mov         dword ptr [ebp-0C],eax
 007166A2    mov         eax,dword ptr [ebp-0C]
 007166A5    mov         byte ptr [eax+20],1;TBinaryOp.Operation:TOperation
 007166A9    mov         ecx,716898;'1'
 007166AE    mov         dl,1
 007166B0    mov         eax,[006808C0];TConstant
 007166B5    call        TConstant.Create;TConstant.Create
 007166BA    mov         edx,dword ptr [ebp-0C]
 007166BD    mov         dword ptr [edx+1C],eax;TBinaryOp.RHS:TExpression
 007166C0    lea         eax,[ebp-28]
 007166C3    mov         edx,dword ptr [ebp-4]
 007166C6    call        @WStrFromUStr
 007166CB    mov         eax,dword ptr [ebp-28]
 007166CE    mov         edx,ebx
 007166D0    call        00710FA4
 007166D5    mov         edx,dword ptr [ebp-0C]
 007166D8    mov         dword ptr [edx+18],eax;TBinaryOp.LHS:TExpression
 007166DB    mov         dl,1
 007166DD    mov         eax,[0067A238];TAssignment
 007166E2    call        TObject.Create;TAssignment.Create
 007166E7    mov         esi,eax
 007166E9    lea         eax,[ebp-2C]
 007166EC    mov         edx,dword ptr [ebp-4]
 007166EF    call        @WStrFromUStr
 007166F4    mov         eax,dword ptr [ebp-2C]
 007166F7    mov         edx,ebx
 007166F9    call        00710FA4
 007166FE    mov         dword ptr [esi+10],eax;TAssignment.LValue:TExpression
 00716701    mov         eax,dword ptr [ebp-0C]
 00716704    mov         dword ptr [esi+14],eax;TAssignment.RValue:TExpression
 00716707    mov         dword ptr [ebp-8],esi
>0071670A    jmp         00716764
 0071670C    mov         ecx,7168A8;'Variable declaration/labels not supported yet'
 00716711    mov         dl,1
 00716713    mov         eax,[00576F6C];ECompiler
 00716718    call        Exception.Create;ECompiler.Create
 0071671D    call        @RaiseExcept
>00716722    jmp         00716764
 00716724    test        al,al
>00716726    je          00716736
 00716728    mov         eax,edx
 0071672A    call        TScanner.Next
 0071672F    xor         eax,eax
 00716731    mov         dword ptr [ebp-8],eax
>00716734    jmp         00716764
 00716736    mov         ecx,716910;'Identifier before IF or FOR statement makes no sense'
 0071673B    mov         dl,1
 0071673D    mov         eax,[00576F6C];ECompiler
 00716742    call        Exception.Create;ECompiler.Create
 00716747    call        @RaiseExcept
>0071674C    jmp         00716764
 0071674E    mov         ecx,716988;'Syntax error'
 00716753    mov         dl,1
 00716755    mov         eax,[00576F6C];ECompiler
 0071675A    call        Exception.Create;ECompiler.Create
 0071675F    call        @RaiseExcept
 00716764    cmp         dword ptr [ebp-8],0
>00716768    je          007167CD
 0071676A    mov         eax,dword ptr [ebp-8]
 0071676D    mov         edx,dword ptr ds:[67A054];TProcedureStatement
 00716773    call        @IsClass
 00716778    test        al,al
>0071677A    je          007167CD
 0071677C    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071677F    movzx       eax,byte ptr [eax+8];TScanner.token:TToken
 00716783    add         al,0C9
 00716785    sub         al,2
>00716787    jb          0071678D
 00716789    sub         al,12
>0071678B    jne         007167CD
 0071678D    mov         dl,1
 0071678F    mov         eax,[0067A238];TAssignment
 00716794    call        TObject.Create;TAssignment.Create
 00716799    mov         esi,eax
 0071679B    mov         eax,dword ptr [ebp-8]
 0071679E    mov         eax,dword ptr [eax+1C]
 007167A1    mov         dword ptr [esi+10],eax;TAssignment.LValue:TExpression
 007167A4    mov         eax,dword ptr [ebp-8]
 007167A7    xor         edx,edx
 007167A9    mov         dword ptr [eax+1C],edx
 007167AC    xor         edx,edx
 007167AE    mov         dword ptr [ebp-8],edx
 007167B1    call        TObject.Free
 007167B6    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 007167B9    call        TScanner.Next
 007167BE    mov         dl,1
 007167C0    mov         eax,edi
 007167C2    call        TParser.ParseExpressionSequence
 007167C7    mov         dword ptr [esi+14],eax;TAssignment.RValue:TExpression
 007167CA    mov         dword ptr [ebp-8],esi
 007167CD    xor         eax,eax
 007167CF    pop         edx
 007167D0    pop         ecx
 007167D1    pop         ecx
 007167D2    mov         dword ptr fs:[eax],edx
 007167D5    push        7167FF
 007167DA    lea         eax,[ebp-2C]
 007167DD    mov         edx,7
 007167E2    call        @WStrArrayClr
 007167E7    lea         eax,[ebp-10]
 007167EA    call        @UStrClr
 007167EF    lea         eax,[ebp-4]
 007167F2    call        @UStrClr
 007167F7    ret
>007167F8    jmp         @HandleFinally
>007167FD    jmp         007167DA
 007167FF    mov         eax,dword ptr [ebp-8]
 00716802    pop         edi
 00716803    pop         esi
 00716804    pop         ebx
 00716805    mov         esp,ebp
 00716807    pop         ebp
 00716808    ret
*}
end;

//007169A4
function TParser.ParseStatement:TStatement;
begin
{*
 007169A4    push        ebp
 007169A5    mov         ebp,esp
 007169A7    mov         ecx,5
 007169AC    push        0
 007169AE    push        0
 007169B0    dec         ecx
>007169B1    jne         007169AC
 007169B3    push        ecx
 007169B4    push        ebx
 007169B5    push        esi
 007169B6    push        edi
 007169B7    mov         ebx,eax
 007169B9    xor         eax,eax
 007169BB    push        ebp
 007169BC    push        7171A7
 007169C1    push        dword ptr fs:[eax]
 007169C4    mov         dword ptr fs:[eax],esp
 007169C7    mov         esi,dword ptr [ebx+4];TParser.s:TScanner
 007169CA    mov         eax,dword ptr [esi+20];TScanner.LineNumber:Integer
 007169CD    mov         dword ptr [ebp-0C],eax
 007169D0    cmp         byte ptr [esi+8],19;TScanner.token:TToken
>007169D4    jne         007169E9
 007169D6    mov         byte ptr [esi+8],3;TScanner.token:TToken
 007169DA    lea         eax,[esi+0C]
 007169DD    mov         edx,7171C4;^338:Single
 007169E2    call        @UStrAsg
>007169E7    jmp         007169FC
 007169E9    mov         edx,dword ptr [ebx+4];TParser.s:TScanner
 007169EC    movzx       eax,byte ptr [edx+8];TScanner.token:TToken
 007169F0    cmp         al,29
>007169F2    je          007169F8
 007169F4    cmp         al,28
>007169F6    jne         007169FC
 007169F8    mov         byte ptr [edx+8],3;TScanner.token:TToken
 007169FC    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007169FF    movzx       edx,byte ptr [eax+8];TScanner.token:TToken
 00716A03    cmp         edx,3D
>00716A06    jg          00716A55
>00716A08    je          00716AA9
 00716A0E    cmp         edx,12
>00716A11    jg          00716A39
>00716A13    je          00716C6A
 00716A19    sub         edx,3
>00716A1C    je          00716C6A
 00716A22    sub         edx,2
>00716A25    je          00716C6A
 00716A2B    sub         edx,0B
>00716A2E    je          00716C6A
>00716A34    jmp         00717131
 00716A39    sub         edx,15
>00716A3C    je          00716BF8
 00716A42    sub         edx,2
>00716A45    je          00716A9C
 00716A47    sub         edx,15
>00716A4A    je          00716C6A
>00716A50    jmp         00717131
 00716A55    cmp         edx,63
>00716A58    jg          00716A83
>00716A5A    je          00716BEC
 00716A60    sub         edx,3E
>00716A63    je          00716B47
 00716A69    sub         edx,21
>00716A6C    je          00716C3A
 00716A72    add         edx,0FFFFFFFE
 00716A75    sub         edx,2
>00716A78    jb          00716BE5
>00716A7E    jmp         00717131
 00716A83    sub         edx,64
>00716A86    je          00716C5A
 00716A8C    dec         edx
>00716A8D    je          00716C4A
 00716A93    sub         edx,7
>00716A96    jne         00717131
 00716A9C    mov         esi,dword ptr ds:[78DB30];^gvar_0081ECE4:TComment
 00716AA2    mov         esi,dword ptr [esi]
>00716AA4    jmp         00717164
 00716AA9    call        TScanner.Next
 00716AAE    lea         edx,[ebp-4]
 00716AB1    mov         eax,ebx
 00716AB3    call        TParser.ParseQualifiedId
 00716AB8    mov         dl,1
 00716ABA    mov         eax,[00680DF8];TBinaryOp
 00716ABF    call        TObject.Create;TBinaryOp.Create
 00716AC4    mov         esi,eax
 00716AC6    mov         byte ptr [esi+20],0;TBinaryOp.Operation:TOperation
 00716ACA    mov         ecx,7171E0;'1'
 00716ACF    mov         dl,1
 00716AD1    mov         eax,[006808C0];TConstant
 00716AD6    call        TConstant.Create;TConstant.Create
 00716ADB    mov         dword ptr [esi+1C],eax;TBinaryOp.RHS:TExpression
 00716ADE    lea         eax,[ebp-18]
 00716AE1    mov         edx,dword ptr [ebp-4]
 00716AE4    call        @WStrFromUStr
 00716AE9    mov         eax,dword ptr [ebp-18]
 00716AEC    xor         edx,edx
 00716AEE    call        00710FA4
 00716AF3    mov         dword ptr [esi+18],eax;TBinaryOp.LHS:TExpression
 00716AF6    mov         dl,1
 00716AF8    mov         eax,[0067A238];TAssignment
 00716AFD    call        TObject.Create;TAssignment.Create
 00716B02    mov         edi,eax
 00716B04    lea         eax,[ebp-1C]
 00716B07    mov         edx,dword ptr [ebp-4]
 00716B0A    call        @WStrFromUStr
 00716B0F    mov         eax,dword ptr [ebp-1C]
 00716B12    xor         edx,edx
 00716B14    call        00710FA4
 00716B19    mov         dword ptr [edi+10],eax;TAssignment.LValue:TExpression
 00716B1C    mov         dword ptr [edi+14],esi;TAssignment.RValue:TExpression
 00716B1F    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00716B22    mov         edx,dword ptr [eax]
 00716B24    call        dword ptr [edx+94];TExpression.MakeReadWrite
 00716B2A    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00716B2D    mov         edx,dword ptr [eax]
 00716B2F    call        dword ptr [edx+8C];TExpression.MakeRead
 00716B35    mov         eax,dword ptr [edi+10];TAssignment.LValue:TExpression
 00716B38    mov         edx,dword ptr [eax]
 00716B3A    call        dword ptr [edx+90];TExpression.MakeWrite
 00716B40    mov         esi,edi
>00716B42    jmp         00717164
 00716B47    call        TScanner.Next
 00716B4C    lea         edx,[ebp-4]
 00716B4F    mov         eax,ebx
 00716B51    call        TParser.ParseQualifiedId
 00716B56    mov         dl,1
 00716B58    mov         eax,[00680DF8];TBinaryOp
 00716B5D    call        TObject.Create;TBinaryOp.Create
 00716B62    mov         esi,eax
 00716B64    mov         byte ptr [esi+20],1;TBinaryOp.Operation:TOperation
 00716B68    mov         ecx,7171E0;'1'
 00716B6D    mov         dl,1
 00716B6F    mov         eax,[006808C0];TConstant
 00716B74    call        TConstant.Create;TConstant.Create
 00716B79    mov         dword ptr [esi+1C],eax;TBinaryOp.RHS:TExpression
 00716B7C    lea         eax,[ebp-20]
 00716B7F    mov         edx,dword ptr [ebp-4]
 00716B82    call        @WStrFromUStr
 00716B87    mov         eax,dword ptr [ebp-20]
 00716B8A    xor         edx,edx
 00716B8C    call        00710FA4
 00716B91    mov         dword ptr [esi+18],eax;TBinaryOp.LHS:TExpression
 00716B94    mov         dl,1
 00716B96    mov         eax,[0067A238];TAssignment
 00716B9B    call        TObject.Create;TAssignment.Create
 00716BA0    mov         edi,eax
 00716BA2    lea         eax,[ebp-24]
 00716BA5    mov         edx,dword ptr [ebp-4]
 00716BA8    call        @WStrFromUStr
 00716BAD    mov         eax,dword ptr [ebp-24]
 00716BB0    xor         edx,edx
 00716BB2    call        00710FA4
 00716BB7    mov         dword ptr [edi+10],eax;TAssignment.LValue:TExpression
 00716BBA    mov         dword ptr [edi+14],esi;TAssignment.RValue:TExpression
 00716BBD    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00716BC0    mov         edx,dword ptr [eax]
 00716BC2    call        dword ptr [edx+94];TExpression.MakeReadWrite
 00716BC8    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00716BCB    mov         edx,dword ptr [eax]
 00716BCD    call        dword ptr [edx+8C];TExpression.MakeRead
 00716BD3    mov         eax,dword ptr [edi+10];TAssignment.LValue:TExpression
 00716BD6    mov         edx,dword ptr [eax]
 00716BD8    call        dword ptr [edx+90];TExpression.MakeWrite
 00716BDE    mov         esi,edi
>00716BE0    jmp         00717164
 00716BE5    xor         esi,esi
>00716BE7    jmp         00717164
 00716BEC    call        TScanner.Next
 00716BF1    xor         esi,esi
>00716BF3    jmp         00717164
 00716BF8    call        TScanner.Next
 00716BFD    mov         edx,7171F0;'EndIf'
 00716C02    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00716C05    call        TScanner.ReadIdentifier
 00716C0A    test        al,al
>00716C0C    jne         00716C33
 00716C0E    mov         edx,717208;'End'
 00716C13    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00716C16    call        TScanner.ReadIdentifier
 00716C1B    test        al,al
>00716C1D    jne         00716C29
 00716C1F    mov         dl,5D
 00716C21    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00716C24    call        TScanner.read
 00716C29    mov         dl,5F
 00716C2B    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00716C2E    call        TScanner.read
 00716C33    xor         esi,esi
>00716C35    jmp         00717164
 00716C3A    xor         edx,edx
 00716C3C    mov         eax,ebx
 00716C3E    call        TParser.ParseIfStatement
 00716C43    mov         esi,eax
>00716C45    jmp         00717164
 00716C4A    xor         edx,edx
 00716C4C    mov         eax,ebx
 00716C4E    call        TParser.ParseForLoop
 00716C53    mov         esi,eax
>00716C55    jmp         00717164
 00716C5A    xor         edx,edx
 00716C5C    mov         eax,ebx
 00716C5E    call        TParser.ParseWhileLoop
 00716C63    mov         esi,eax
>00716C65    jmp         00717164
 00716C6A    xor         edx,edx
 00716C6C    mov         eax,ebx
 00716C6E    call        TParser.ParseExpressionSequence
 00716C73    mov         dword ptr [ebp-8],eax
 00716C76    mov         edx,dword ptr [ebx+4];TParser.s:TScanner
 00716C79    movzx       eax,byte ptr [edx+8];TScanner.token:TToken
 00716C7D    cmp         al,38
>00716C7F    je          00716C85
 00716C81    cmp         al,4B
>00716C83    jne         00716CCA
 00716C85    mov         eax,edx
 00716C87    call        TScanner.Next
 00716C8C    mov         dl,1
 00716C8E    mov         eax,[0067A238];TAssignment
 00716C93    call        TObject.Create;TAssignment.Create
 00716C98    mov         edi,eax
 00716C9A    mov         eax,dword ptr [ebp-8]
 00716C9D    mov         dword ptr [edi+10],eax;TAssignment.LValue:TExpression
 00716CA0    mov         dl,1
 00716CA2    mov         eax,ebx
 00716CA4    call        TParser.ParseExpressionSequence
 00716CA9    mov         esi,eax
 00716CAB    mov         dword ptr [edi+14],esi;TAssignment.RValue:TExpression
 00716CAE    mov         eax,esi
 00716CB0    mov         edx,dword ptr [eax]
 00716CB2    call        dword ptr [edx+8C];TExpression.MakeRead
 00716CB8    mov         eax,dword ptr [ebp-8]
 00716CBB    mov         edx,dword ptr [eax]
 00716CBD    call        dword ptr [edx+90];TExpression.MakeWrite
 00716CC3    mov         esi,edi
>00716CC5    jmp         00717164
 00716CCA    cmp         al,39
>00716CCC    jne         00716D3E
 00716CCE    mov         eax,edx
 00716CD0    call        TScanner.Next
 00716CD5    mov         dl,1
 00716CD7    mov         eax,[00680DF8];TBinaryOp
 00716CDC    call        TObject.Create;TBinaryOp.Create
 00716CE1    mov         esi,eax
 00716CE3    mov         byte ptr [esi+20],0;TBinaryOp.Operation:TOperation
 00716CE7    mov         dl,1
 00716CE9    mov         eax,ebx
 00716CEB    call        TParser.ParseExpressionSequence
 00716CF0    mov         dword ptr [esi+1C],eax;TBinaryOp.RHS:TExpression
 00716CF3    mov         eax,dword ptr [ebp-8]
 00716CF6    call        TExpression.Clone
 00716CFB    mov         edi,eax
 00716CFD    mov         dword ptr [esi+18],edi;TBinaryOp.LHS:TExpression
 00716D00    mov         eax,edi
 00716D02    mov         edx,dword ptr [eax]
 00716D04    call        dword ptr [edx+94];TExpression.MakeReadWrite
 00716D0A    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00716D0D    mov         edx,dword ptr [eax]
 00716D0F    call        dword ptr [edx+8C];TExpression.MakeRead
 00716D15    mov         eax,dword ptr [ebp-8]
 00716D18    mov         edx,dword ptr [eax]
 00716D1A    call        dword ptr [edx+90];TExpression.MakeWrite
 00716D20    mov         dl,1
 00716D22    mov         eax,[0067A238];TAssignment
 00716D27    call        TObject.Create;TAssignment.Create
 00716D2C    mov         edi,eax
 00716D2E    mov         eax,dword ptr [ebp-8]
 00716D31    mov         dword ptr [edi+10],eax;TAssignment.LValue:TExpression
 00716D34    mov         dword ptr [edi+14],esi;TAssignment.RValue:TExpression
 00716D37    mov         esi,edi
>00716D39    jmp         00717164
 00716D3E    cmp         al,3A
>00716D40    jne         00716DB2
 00716D42    mov         eax,edx
 00716D44    call        TScanner.Next
 00716D49    mov         dl,1
 00716D4B    mov         eax,[00680DF8];TBinaryOp
 00716D50    call        TObject.Create;TBinaryOp.Create
 00716D55    mov         esi,eax
 00716D57    mov         byte ptr [esi+20],1;TBinaryOp.Operation:TOperation
 00716D5B    mov         dl,1
 00716D5D    mov         eax,ebx
 00716D5F    call        TParser.ParseExpressionSequence
 00716D64    mov         dword ptr [esi+1C],eax;TBinaryOp.RHS:TExpression
 00716D67    mov         eax,dword ptr [ebp-8]
 00716D6A    call        TExpression.Clone
 00716D6F    mov         edi,eax
 00716D71    mov         dword ptr [esi+18],edi;TBinaryOp.LHS:TExpression
 00716D74    mov         eax,edi
 00716D76    mov         edx,dword ptr [eax]
 00716D78    call        dword ptr [edx+94];TExpression.MakeReadWrite
 00716D7E    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00716D81    mov         edx,dword ptr [eax]
 00716D83    call        dword ptr [edx+8C];TExpression.MakeRead
 00716D89    mov         eax,dword ptr [ebp-8]
 00716D8C    mov         edx,dword ptr [eax]
 00716D8E    call        dword ptr [edx+90];TExpression.MakeWrite
 00716D94    mov         dl,1
 00716D96    mov         eax,[0067A238];TAssignment
 00716D9B    call        TObject.Create;TAssignment.Create
 00716DA0    mov         edi,eax
 00716DA2    mov         eax,dword ptr [ebp-8]
 00716DA5    mov         dword ptr [edi+10],eax;TAssignment.LValue:TExpression
 00716DA8    mov         dword ptr [edi+14],esi;TAssignment.RValue:TExpression
 00716DAB    mov         esi,edi
>00716DAD    jmp         00717164
 00716DB2    cmp         al,3B
>00716DB4    jne         00716E26
 00716DB6    mov         eax,edx
 00716DB8    call        TScanner.Next
 00716DBD    mov         dl,1
 00716DBF    mov         eax,[00680DF8];TBinaryOp
 00716DC4    call        TObject.Create;TBinaryOp.Create
 00716DC9    mov         esi,eax
 00716DCB    mov         byte ptr [esi+20],2;TBinaryOp.Operation:TOperation
 00716DCF    mov         dl,1
 00716DD1    mov         eax,ebx
 00716DD3    call        TParser.ParseExpressionSequence
 00716DD8    mov         dword ptr [esi+1C],eax;TBinaryOp.RHS:TExpression
 00716DDB    mov         eax,dword ptr [ebp-8]
 00716DDE    call        TExpression.Clone
 00716DE3    mov         edi,eax
 00716DE5    mov         dword ptr [esi+18],edi;TBinaryOp.LHS:TExpression
 00716DE8    mov         eax,edi
 00716DEA    mov         edx,dword ptr [eax]
 00716DEC    call        dword ptr [edx+94];TExpression.MakeReadWrite
 00716DF2    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00716DF5    mov         edx,dword ptr [eax]
 00716DF7    call        dword ptr [edx+8C];TExpression.MakeRead
 00716DFD    mov         eax,dword ptr [ebp-8]
 00716E00    mov         edx,dword ptr [eax]
 00716E02    call        dword ptr [edx+90];TExpression.MakeWrite
 00716E08    mov         dl,1
 00716E0A    mov         eax,[0067A238];TAssignment
 00716E0F    call        TObject.Create;TAssignment.Create
 00716E14    mov         edi,eax
 00716E16    mov         eax,dword ptr [ebp-8]
 00716E19    mov         dword ptr [edi+10],eax;TAssignment.LValue:TExpression
 00716E1C    mov         dword ptr [edi+14],esi;TAssignment.RValue:TExpression
 00716E1F    mov         esi,edi
>00716E21    jmp         00717164
 00716E26    cmp         al,3C
>00716E28    jne         00716E9A
 00716E2A    mov         eax,edx
 00716E2C    call        TScanner.Next
 00716E31    mov         dl,1
 00716E33    mov         eax,[00680DF8];TBinaryOp
 00716E38    call        TObject.Create;TBinaryOp.Create
 00716E3D    mov         esi,eax
 00716E3F    mov         byte ptr [esi+20],3;TBinaryOp.Operation:TOperation
 00716E43    mov         dl,1
 00716E45    mov         eax,ebx
 00716E47    call        TParser.ParseExpressionSequence
 00716E4C    mov         dword ptr [esi+1C],eax;TBinaryOp.RHS:TExpression
 00716E4F    mov         eax,dword ptr [ebp-8]
 00716E52    call        TExpression.Clone
 00716E57    mov         edi,eax
 00716E59    mov         dword ptr [esi+18],edi;TBinaryOp.LHS:TExpression
 00716E5C    mov         eax,edi
 00716E5E    mov         edx,dword ptr [eax]
 00716E60    call        dword ptr [edx+94];TExpression.MakeReadWrite
 00716E66    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00716E69    mov         edx,dword ptr [eax]
 00716E6B    call        dword ptr [edx+8C];TExpression.MakeRead
 00716E71    mov         eax,dword ptr [ebp-8]
 00716E74    mov         edx,dword ptr [eax]
 00716E76    call        dword ptr [edx+90];TExpression.MakeWrite
 00716E7C    mov         dl,1
 00716E7E    mov         eax,[0067A238];TAssignment
 00716E83    call        TObject.Create;TAssignment.Create
 00716E88    mov         edi,eax
 00716E8A    mov         eax,dword ptr [ebp-8]
 00716E8D    mov         dword ptr [edi+10],eax;TAssignment.LValue:TExpression
 00716E90    mov         dword ptr [edi+14],esi;TAssignment.RValue:TExpression
 00716E93    mov         esi,edi
>00716E95    jmp         00717164
 00716E9A    cmp         al,3F
>00716E9C    jne         00716ED0
 00716E9E    mov         eax,edx
 00716EA0    call        TScanner.Next
 00716EA5    mov         dl,1
 00716EA7    mov         eax,[0067A238];TAssignment
 00716EAC    call        TObject.Create;TAssignment.Create
 00716EB1    mov         edi,eax
 00716EB3    mov         eax,dword ptr [ebp-8]
 00716EB6    mov         dword ptr [edi+14],eax;TAssignment.RValue:TExpression
 00716EB9    mov         dl,1
 00716EBB    mov         eax,ebx
 00716EBD    call        TParser.ParseExpressionSequence
 00716EC2    mov         dword ptr [edi+10],eax;TAssignment.LValue:TExpression
 00716EC5    mov         byte ptr [edi+18],1;TAssignment.Implies:Boolean
 00716EC9    mov         esi,edi
>00716ECB    jmp         00717164
 00716ED0    cmp         al,3D
>00716ED2    jne         00716F4B
 00716ED4    mov         eax,edx
 00716ED6    call        TScanner.Next
 00716EDB    mov         dl,1
 00716EDD    mov         eax,[00680DF8];TBinaryOp
 00716EE2    call        TObject.Create;TBinaryOp.Create
 00716EE7    mov         esi,eax
 00716EE9    mov         byte ptr [esi+20],0;TBinaryOp.Operation:TOperation
 00716EED    mov         ecx,7171E0;'1'
 00716EF2    mov         dl,1
 00716EF4    mov         eax,[006808C0];TConstant
 00716EF9    call        TConstant.Create;TConstant.Create
 00716EFE    mov         dword ptr [esi+1C],eax;TBinaryOp.RHS:TExpression
 00716F01    mov         eax,dword ptr [ebp-8]
 00716F04    call        TExpression.Clone
 00716F09    mov         dword ptr [esi+18],eax;TBinaryOp.LHS:TExpression
 00716F0C    mov         dl,1
 00716F0E    mov         eax,[0067A238];TAssignment
 00716F13    call        TObject.Create;TAssignment.Create
 00716F18    mov         edi,eax
 00716F1A    mov         eax,dword ptr [ebp-8]
 00716F1D    mov         dword ptr [edi+10],eax;TAssignment.LValue:TExpression
 00716F20    mov         dword ptr [edi+14],esi;TAssignment.RValue:TExpression
 00716F23    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00716F26    mov         edx,dword ptr [eax]
 00716F28    call        dword ptr [edx+94];TExpression.MakeReadWrite
 00716F2E    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00716F31    mov         edx,dword ptr [eax]
 00716F33    call        dword ptr [edx+8C];TExpression.MakeRead
 00716F39    mov         eax,dword ptr [edi+10];TAssignment.LValue:TExpression
 00716F3C    mov         edx,dword ptr [eax]
 00716F3E    call        dword ptr [edx+90];TExpression.MakeWrite
 00716F44    mov         esi,edi
>00716F46    jmp         00717164
 00716F4B    cmp         al,3E
>00716F4D    jne         00716FC6
 00716F4F    mov         eax,edx
 00716F51    call        TScanner.Next
 00716F56    mov         dl,1
 00716F58    mov         eax,[00680DF8];TBinaryOp
 00716F5D    call        TObject.Create;TBinaryOp.Create
 00716F62    mov         esi,eax
 00716F64    mov         byte ptr [esi+20],1;TBinaryOp.Operation:TOperation
 00716F68    mov         ecx,7171E0;'1'
 00716F6D    mov         dl,1
 00716F6F    mov         eax,[006808C0];TConstant
 00716F74    call        TConstant.Create;TConstant.Create
 00716F79    mov         dword ptr [esi+1C],eax;TBinaryOp.RHS:TExpression
 00716F7C    mov         eax,dword ptr [ebp-8]
 00716F7F    call        TExpression.Clone
 00716F84    mov         dword ptr [esi+18],eax;TBinaryOp.LHS:TExpression
 00716F87    mov         dl,1
 00716F89    mov         eax,[0067A238];TAssignment
 00716F8E    call        TObject.Create;TAssignment.Create
 00716F93    mov         edi,eax
 00716F95    mov         eax,dword ptr [ebp-8]
 00716F98    mov         dword ptr [edi+10],eax;TAssignment.LValue:TExpression
 00716F9B    mov         dword ptr [edi+14],esi;TAssignment.RValue:TExpression
 00716F9E    mov         eax,dword ptr [esi+18];TBinaryOp.LHS:TExpression
 00716FA1    mov         edx,dword ptr [eax]
 00716FA3    call        dword ptr [edx+94];TExpression.MakeReadWrite
 00716FA9    mov         eax,dword ptr [esi+1C];TBinaryOp.RHS:TExpression
 00716FAC    mov         edx,dword ptr [eax]
 00716FAE    call        dword ptr [edx+8C];TExpression.MakeRead
 00716FB4    mov         eax,dword ptr [edi+10];TAssignment.LValue:TExpression
 00716FB7    mov         edx,dword ptr [eax]
 00716FB9    call        dword ptr [edx+90];TExpression.MakeWrite
 00716FBF    mov         esi,edi
>00716FC1    jmp         00717164
 00716FC6    mov         eax,dword ptr [ebp-8]
 00716FC9    mov         edx,dword ptr ds:[670104];TProcedureExpression
 00716FCF    call        @IsClass
 00716FD4    test        al,al
>00716FD6    je          0071700A
 00716FD8    mov         dl,1
 00716FDA    mov         eax,[0067A054];TProcedureStatement
 00716FDF    call        TProcedureStatement.Create;TProcedureStatement.Create
 00716FE4    mov         esi,eax
 00716FE6    mov         eax,dword ptr [ebp-8]
 00716FE9    mov         dword ptr [esi+1C],eax;TProcedureStatement.....................Proc:TProcedureExpression
 00716FEC    mov         eax,dword ptr [ebp-8]
 00716FEF    mov         eax,dword ptr [eax+18]
 00716FF2    cmp         dword ptr [eax+8],0
>00716FF6    jne         00717164
 00716FFC    mov         edx,eax
 00716FFE    mov         eax,ebx
 00717000    call        TParser.ParseParamListWithoutBrackets
>00717005    jmp         00717164
 0071700A    mov         eax,dword ptr [ebp-8]
 0071700D    mov         edx,dword ptr ds:[66FAE8];TMathsFunction
 00717013    call        @IsClass
 00717018    test        al,al
>0071701A    je          007170BF
 00717020    mov         eax,dword ptr [ebp-8]
 00717023    cmp         dword ptr [eax+1C],8C
>0071702A    jne         007170BF
 00717030    mov         dl,1
 00717032    mov         eax,[0067A054];TProcedureStatement
 00717037    call        TProcedureStatement.Create;TProcedureStatement.Create
 0071703C    mov         esi,eax
 0071703E    mov         dl,1
 00717040    mov         eax,[00670104];TProcedureExpression
 00717045    call        TMathsFunction.Create;TProcedureExpression.Create
 0071704A    mov         dword ptr [ebp-10],eax
 0071704D    mov         eax,dword ptr [ebp-10]
 00717050    mov         dword ptr [eax+1C],2F;TProcedureExpression.FunctionNumber:Integer
 00717057    mov         eax,dword ptr [ebp-8]
 0071705A    mov         eax,dword ptr [eax+18]
 0071705D    mov         edi,dword ptr [eax+8]
 00717060    dec         edi
 00717061    test        edi,edi
>00717063    jl          00717092
 00717065    inc         edi
 00717066    mov         dword ptr [ebp-14],0
 0071706D    mov         eax,dword ptr [ebp-8]
 00717070    mov         eax,dword ptr [eax+18]
 00717073    mov         edx,dword ptr [ebp-14]
 00717076    call        TList.Get
 0071707B    call        TExpression.Clone
 00717080    mov         edx,dword ptr [ebp-10]
 00717083    mov         edx,dword ptr [edx+18];TProcedureExpression.Parameters:TObjectList
 00717086    xchg        eax,edx
 00717087    call        TList.Add
 0071708C    inc         dword ptr [ebp-14]
 0071708F    dec         edi
>00717090    jne         0071706D
 00717092    mov         eax,dword ptr [ebp-10]
 00717095    mov         dword ptr [esi+1C],eax;TProcedureStatement......................Proc:TProcedureExpressio...
 00717098    mov         eax,dword ptr [ebp-10]
 0071709B    mov         eax,dword ptr [eax+18];TProcedureExpression.Parameters:TObjectList
 0071709E    cmp         dword ptr [eax+8],0;TObjectList.FCount:Integer
>007170A2    jne         007170AD
 007170A4    mov         edx,eax
 007170A6    mov         eax,ebx
 007170A8    call        TParser.ParseParamListWithoutBrackets
 007170AD    mov         eax,dword ptr [ebp-8]
 007170B0    xor         edx,edx
 007170B2    mov         dword ptr [ebp-8],edx
 007170B5    call        TObject.Free
>007170BA    jmp         00717164
 007170BF    mov         eax,dword ptr [ebp-8]
 007170C2    mov         edx,dword ptr ds:[5F1024];TKey
 007170C8    call        @IsClass
 007170CD    test        al,al
>007170CF    je          00717116
 007170D1    mov         eax,dword ptr [ebp-8]
 007170D4    cmp         dword ptr [eax+20],0CF
>007170DB    jne         00717116
 007170DD    mov         eax,dword ptr [ebp-8]
 007170E0    xor         edx,edx
 007170E2    mov         dword ptr [ebp-8],edx
 007170E5    call        TObject.Free
 007170EA    mov         dl,5F
 007170EC    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007170EF    call        TScanner.read
 007170F4    test        al,al
>007170F6    jne         00717112
 007170F8    mov         dl,65
 007170FA    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 007170FD    call        TScanner.read
 00717102    test        al,al
>00717104    jne         00717112
 00717106    mov         dl,64
 00717108    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071710B    call        TScanner.read
 00717110    test        al,al
 00717112    xor         esi,esi
>00717114    jmp         00717177
 00717116    mov         eax,dword ptr [ebp-8]
 00717119    xor         edx,edx
 0071711B    mov         dword ptr [ebp-8],edx
 0071711E    call        TObject.Free
 00717123    xor         esi,esi
 00717125    mov         dl,4B
 00717127    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071712A    call        TScanner.expect
>0071712F    jmp         00717164
 00717131    lea         edx,[ebp-2C]
 00717134    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00717137    movzx       eax,byte ptr [eax+8];TScanner.token:TToken
 0071713B    call        0057DFFC
 00717140    mov         ecx,dword ptr [ebp-2C]
 00717143    lea         eax,[ebp-28]
 00717146    mov         edx,71721C;'Statements can''t begin with '
 0071714B    call        @UStrCat3
 00717150    mov         ecx,dword ptr [ebp-28]
 00717153    mov         dl,1
 00717155    mov         eax,[00576F6C];ECompiler
 0071715A    call        Exception.Create;ECompiler.Create
 0071715F    call        @RaiseExcept
 00717164    test        esi,esi
>00717166    je          00717177
 00717168    mov         eax,dword ptr [ebp-0C]
 0071716B    mov         dword ptr [esi+8],eax;TProcedureStatement.StartLine:Integer
 0071716E    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00717171    mov         eax,dword ptr [eax+20];TScanner.LineNumber:Integer
 00717174    mov         dword ptr [esi+0C],eax;TProcedureStatement.EndLine:Integer
 00717177    xor         eax,eax
 00717179    pop         edx
 0071717A    pop         ecx
 0071717B    pop         ecx
 0071717C    mov         dword ptr fs:[eax],edx
 0071717F    push        7171AE
 00717184    lea         eax,[ebp-2C]
 00717187    mov         edx,2
 0071718C    call        @UStrArrayClr
 00717191    lea         eax,[ebp-24]
 00717194    mov         edx,4
 00717199    call        @WStrArrayClr
 0071719E    lea         eax,[ebp-4]
 007171A1    call        @UStrClr
 007171A6    ret
>007171A7    jmp         @HandleFinally
>007171AC    jmp         00717184
 007171AE    mov         eax,esi
 007171B0    pop         edi
 007171B1    pop         esi
 007171B2    pop         ebx
 007171B3    mov         esp,ebp
 007171B5    pop         ebp
 007171B6    ret
*}
end;

//00717258
function TParser.ParseLine:TStatement;
begin
{*
 00717258    push        ebx
 00717259    push        esi
 0071725A    mov         ebx,eax
 0071725C    mov         eax,ebx
 0071725E    call        TParser.ParseStatement
 00717263    mov         esi,eax
 00717265    test        esi,esi
>00717267    je          0071727D
 00717269    mov         dl,17
 0071726B    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071726E    call        TScanner.read
 00717273    mov         dl,6C
 00717275    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 00717278    call        TScanner.expect
 0071727D    mov         eax,esi
 0071727F    pop         esi
 00717280    pop         ebx
 00717281    ret
*}
end;

//00717284
procedure TParser.ParseProgram;
begin
{*
 00717284    push        ebp
 00717285    mov         ebp,esp
 00717287    mov         ecx,7
 0071728C    push        0
 0071728E    push        0
 00717290    dec         ecx
>00717291    jne         0071728C
 00717293    push        ecx
 00717294    push        ebx
 00717295    push        esi
 00717296    push        edi
 00717297    mov         dword ptr [ebp-4],eax
 0071729A    xor         eax,eax
 0071729C    push        ebp
 0071729D    push        7174F9
 007172A2    push        dword ptr fs:[eax]
 007172A5    mov         dword ptr fs:[eax],esp
 007172A8    mov         dl,1
 007172AA    mov         eax,[0067A404];TCodeBlock
 007172AF    call        TCodeBlock.Create;TCodeBlock.Create
 007172B4    mov         ebx,eax
 007172B6    mov         eax,dword ptr [ebp-4]
 007172B9    mov         dword ptr [eax+0C],ebx;TParser.Code:TCodeBlock
 007172BC    mov         eax,dword ptr [ebp-4]
 007172BF    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 007172C2    mov         eax,dword ptr [eax+20];TScanner.LineNumber:Integer
 007172C5    mov         dword ptr [ebx+8],eax;TCodeBlock.StartLine:Integer
>007172C8    jmp         007174B4
 007172CD    xor         eax,eax
 007172CF    push        ebp
 007172D0    push        71733B
 007172D5    push        dword ptr fs:[eax]
 007172D8    mov         dword ptr fs:[eax],esp
 007172DB    mov         eax,dword ptr [ebp-4]
 007172DE    call        TParser.ParseLine
 007172E3    mov         ebx,eax
 007172E5    test        ebx,ebx
>007172E7    je          00717310
 007172E9    test        ebx,ebx
>007172EB    je          00717310
 007172ED    mov         eax,ebx
 007172EF    mov         edx,dword ptr ds:[679C48];TComment
 007172F5    call        @IsClass
 007172FA    test        al,al
>007172FC    jne         0071732E
 007172FE    mov         edx,ebx
 00717300    mov         eax,dword ptr [ebp-4]
 00717303    mov         eax,dword ptr [eax+0C];TParser.Code:TCodeBlock
 00717306    mov         eax,dword ptr [eax+10];TCodeBlock.L:TObjectList
 00717309    call        TList.Add
>0071730E    jmp         0071732E
 00717310    test        ebx,ebx
>00717312    jne         0071732E
 00717314    mov         eax,dword ptr [ebp-4]
 00717317    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071731A    mov         dl,17
 0071731C    call        TScanner.read
 00717321    mov         eax,dword ptr [ebp-4]
 00717324    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 00717327    mov         dl,6C
 00717329    call        TScanner.expect
 0071732E    xor         eax,eax
 00717330    pop         edx
 00717331    pop         ecx
 00717332    pop         ecx
 00717333    mov         dword ptr fs:[eax],edx
>00717336    jmp         007174B4
>0071733B    jmp         @HandleOnException
 00717340    dd          2
 00717344    dd          00576F6C;ECompiler
 00717348    dd          00717354
 0071734C    dd          00418C04;Exception
 00717350    dd          007173EF
 00717354    mov         esi,eax
 00717356    mov         eax,dword ptr [ebp-4]
 00717359    cmp         dword ptr [eax+8],0;TParser.Errors:TStrings
>0071735D    je          007173A3
 0071735F    lea         edx,[ebp-0C]
 00717362    mov         eax,dword ptr [ebp-4]
 00717365    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 00717368    mov         eax,dword ptr [eax+20];TScanner.LineNumber:Integer
 0071736B    call        IntToStr
 00717370    push        dword ptr [ebp-0C]
 00717373    push        717514;': '
 00717378    lea         edx,[ebp-10]
 0071737B    mov         eax,dword ptr [esi+4];ECompiler.FMessage:string
 0071737E    call        00576000
 00717383    push        dword ptr [ebp-10]
 00717386    lea         eax,[ebp-8]
 00717389    mov         edx,3
 0071738E    call        @UStrCatN
 00717393    mov         edx,dword ptr [ebp-8]
 00717396    mov         eax,dword ptr [ebp-4]
 00717399    mov         eax,dword ptr [eax+8];TParser.Errors:TStrings
 0071739C    mov         ecx,dword ptr [eax]
 0071739E    call        dword ptr [ecx+38];TStrings.Add
>007173A1    jmp         007173DF
 007173A3    lea         edx,[ebp-18]
 007173A6    mov         eax,dword ptr [ebp-4]
 007173A9    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 007173AC    mov         eax,dword ptr [eax+20];TScanner.LineNumber:Integer
 007173AF    call        IntToStr
 007173B4    push        dword ptr [ebp-18]
 007173B7    push        717514;': '
 007173BC    lea         edx,[ebp-1C]
 007173BF    mov         eax,dword ptr [esi+4];ECompiler.FMessage:string
 007173C2    call        00576000
 007173C7    push        dword ptr [ebp-1C]
 007173CA    lea         eax,[ebp-14]
 007173CD    mov         edx,3
 007173D2    call        @UStrCatN
 007173D7    mov         eax,dword ptr [ebp-14]
 007173DA    call        ShowMessage
 007173DF    mov         eax,dword ptr [ebp-4]
 007173E2    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 007173E5    call        TScanner.NextLine
>007173EA    jmp         007174AF
 007173EF    mov         edi,eax
 007173F1    mov         eax,dword ptr [ebp-4]
 007173F4    cmp         dword ptr [eax+8],0;TParser.Errors:TStrings
>007173F8    je          00717453
 007173FA    lea         edx,[ebp-24]
 007173FD    mov         eax,dword ptr [ebp-4]
 00717400    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 00717403    mov         eax,dword ptr [eax+20];TScanner.LineNumber:Integer
 00717406    call        IntToStr
 0071740B    push        dword ptr [ebp-24]
 0071740E    push        717528;': ['
 00717413    lea         edx,[ebp-28]
 00717416    mov         eax,71753C;'internal'
 0071741B    call        00576000
 00717420    push        dword ptr [ebp-28]
 00717423    push        71755C;'] '
 00717428    lea         edx,[ebp-2C]
 0071742B    mov         eax,dword ptr [edi+4];Exception.FMessage:string
 0071742E    call        00576000
 00717433    push        dword ptr [ebp-2C]
 00717436    lea         eax,[ebp-20]
 00717439    mov         edx,5
 0071743E    call        @UStrCatN
 00717443    mov         edx,dword ptr [ebp-20]
 00717446    mov         eax,dword ptr [ebp-4]
 00717449    mov         eax,dword ptr [eax+8];TParser.Errors:TStrings
 0071744C    mov         ecx,dword ptr [eax]
 0071744E    call        dword ptr [ecx+38];TStrings.Add
>00717451    jmp         007174A4
 00717453    lea         edx,[ebp-34]
 00717456    mov         eax,dword ptr [ebp-4]
 00717459    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071745C    mov         eax,dword ptr [eax+20];TScanner.LineNumber:Integer
 0071745F    call        IntToStr
 00717464    push        dword ptr [ebp-34]
 00717467    push        717528;': ['
 0071746C    lea         edx,[ebp-38]
 0071746F    mov         eax,71753C;'internal'
 00717474    call        00576000
 00717479    push        dword ptr [ebp-38]
 0071747C    push        71755C;'] '
 00717481    lea         edx,[ebp-3C]
 00717484    mov         eax,dword ptr [edi+4];Exception.FMessage:string
 00717487    call        00576000
 0071748C    push        dword ptr [ebp-3C]
 0071748F    lea         eax,[ebp-30]
 00717492    mov         edx,5
 00717497    call        @UStrCatN
 0071749C    mov         eax,dword ptr [ebp-30]
 0071749F    call        ShowMessage
 007174A4    mov         eax,dword ptr [ebp-4]
 007174A7    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 007174AA    call        TScanner.NextLine
 007174AF    call        @DoneExcept
 007174B4    mov         eax,dword ptr [ebp-4]
 007174B7    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 007174BA    call        TScanner.EOF
 007174BF    test        al,al
>007174C1    je          007172CD
 007174C7    mov         eax,dword ptr [ebp-4]
 007174CA    mov         eax,dword ptr [eax+0C];TParser.Code:TCodeBlock
 007174CD    test        eax,eax
>007174CF    je          007174DE
 007174D1    mov         edx,dword ptr [ebp-4]
 007174D4    mov         edx,dword ptr [edx+4];TParser.s:TScanner
 007174D7    mov         edx,dword ptr [edx+20];TScanner.LineNumber:Integer
 007174DA    dec         edx
 007174DB    mov         dword ptr [eax+0C],edx;TCodeBlock.EndLine:Integer
 007174DE    xor         eax,eax
 007174E0    pop         edx
 007174E1    pop         ecx
 007174E2    pop         ecx
 007174E3    mov         dword ptr fs:[eax],edx
 007174E6    push        717500
 007174EB    lea         eax,[ebp-3C]
 007174EE    mov         edx,0E
 007174F3    call        @UStrArrayClr
 007174F8    ret
>007174F9    jmp         @HandleFinally
>007174FE    jmp         007174EB
 00717500    pop         edi
 00717501    pop         esi
 00717502    pop         ebx
 00717503    mov         esp,ebp
 00717505    pop         ebp
 00717506    ret
*}
end;

//00717564
constructor TParser.Create(TextOfFile:string);
begin
{*
 00717564    push        ebp
 00717565    mov         ebp,esp
 00717567    push        ecx
 00717568    push        ebx
 00717569    push        esi
 0071756A    test        dl,dl
>0071756C    je          00717576
 0071756E    add         esp,0FFFFFFF0
 00717571    call        @ClassCreate
 00717576    mov         dword ptr [ebp-4],ecx
 00717579    mov         ebx,edx
 0071757B    mov         esi,eax
 0071757D    mov         eax,dword ptr [ebp-4]
 00717580    call        @UStrAddRef
 00717585    xor         eax,eax
 00717587    push        ebp
 00717588    push        7175D3
 0071758D    push        dword ptr fs:[eax]
 00717590    mov         dword ptr fs:[eax],esp
 00717593    xor         edx,edx
 00717595    mov         eax,esi
 00717597    call        TObject.Create
 0071759C    mov         dl,1
 0071759E    mov         eax,[0067A404];TCodeBlock
 007175A3    call        TCodeBlock.Create;TCodeBlock.Create
 007175A8    mov         dword ptr [esi+0C],eax;TParser.Code:TCodeBlock
 007175AB    mov         ecx,dword ptr [ebp-4]
 007175AE    mov         dl,1
 007175B0    mov         eax,[005770A4];TScanner
 007175B5    call        TScanner.Create;TScanner.Create
 007175BA    mov         dword ptr [esi+4],eax;TParser.s:TScanner
 007175BD    xor         eax,eax
 007175BF    pop         edx
 007175C0    pop         ecx
 007175C1    pop         ecx
 007175C2    mov         dword ptr fs:[eax],edx
 007175C5    push        7175DA
 007175CA    lea         eax,[ebp-4]
 007175CD    call        @UStrClr
 007175D2    ret
>007175D3    jmp         @HandleFinally
>007175D8    jmp         007175CA
 007175DA    mov         eax,esi
 007175DC    test        bl,bl
>007175DE    je          007175EF
 007175E0    call        @AfterConstruction
 007175E5    pop         dword ptr fs:[0]
 007175EC    add         esp,0C
 007175EF    mov         eax,esi
 007175F1    pop         esi
 007175F2    pop         ebx
 007175F3    pop         ecx
 007175F4    pop         ebp
 007175F5    ret
*}
end;

//007175F8
destructor TParser.Destroy();
begin
{*
 007175F8    push        ebx
 007175F9    push        esi
 007175FA    call        @BeforeDestruction
 007175FF    mov         ebx,edx
 00717601    mov         esi,eax
 00717603    lea         eax,[esi+0C];TParser.Code:TCodeBlock
 00717606    call        004F9A38
 0071760B    lea         eax,[esi+4];TParser.s:TScanner
 0071760E    call        004F9A38
 00717613    mov         edx,ebx
 00717615    and         dl,0FC
 00717618    mov         eax,esi
 0071761A    call        TObject.Destroy
 0071761F    test        bl,bl
>00717621    jle         0071762A
 00717623    mov         eax,esi
 00717625    call        @ClassDestroy
 0071762A    pop         esi
 0071762B    pop         ebx
 0071762C    ret
*}
end;

//00717630
function TParser.ParseIfStatement(AlreadyReadIf:Boolean):TStatement;
begin
{*
 00717630    push        ebx
 00717631    push        esi
 00717632    push        edi
 00717633    push        ecx
 00717634    mov         esi,eax
 00717636    test        dl,dl
>00717638    jne         00717644
 0071763A    mov         dl,5F
 0071763C    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 0071763F    call        TScanner.expect
 00717644    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00717647    cmp         byte ptr [eax+8],10;TScanner.token:TToken
 0071764B    sete        byte ptr [esp]
 0071764F    mov         dl,1
 00717651    mov         eax,esi
 00717653    call        TParser.ParseExpressionSequence
 00717658    mov         ebx,eax
 0071765A    mov         dl,60
 0071765C    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 0071765F    call        TScanner.read
 00717664    mov         byte ptr [esp+1],al
 00717668    mov         dl,1
 0071766A    mov         eax,[0067A668];TIfStatement
 0071766F    call        TObject.Create;TIfStatement.Create
 00717674    mov         edi,eax
 00717676    mov         dword ptr [edi+10],ebx;TIfStatement.Condition:TExpression
 00717679    mov         edx,7177F4;'begin'
 0071767E    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00717681    call        TScanner.ReadIdentifier
 00717686    test        al,al
>00717688    jne         0071769F
 0071768A    mov         edx,71780C;'anfangen'
 0071768F    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00717692    call        TScanner.ReadIdentifier
 00717697    test        al,al
>00717699    jne         0071769F
 0071769B    xor         ebx,ebx
>0071769D    jmp         007176A1
 0071769F    mov         bl,1
 007176A1    mov         dl,14
 007176A3    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 007176A6    call        TScanner.read
 007176AB    or          bl,al
 007176AD    test        bl,bl
>007176AF    jne         007176BE
 007176B1    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 007176B4    cmp         byte ptr [eax+8],6C;TScanner.token:TToken
>007176B8    je          007176BE
 007176BA    xor         eax,eax
>007176BC    jmp         007176C0
 007176BE    mov         al,1
 007176C0    mov         ebx,eax
 007176C2    test        bl,bl
>007176C4    je          0071777E
 007176CA    mov         dl,6C
 007176CC    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 007176CF    call        TScanner.expect
 007176D4    mov         eax,esi
 007176D6    call        TParser.ParseCodeBlock
 007176DB    mov         dword ptr [edi+14],eax;TIfStatement.IfCode:TStatement
 007176DE    mov         dl,62
 007176E0    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 007176E3    call        TScanner.read
 007176E8    test        al,al
>007176EA    je          007176FD
 007176EC    mov         dl,1
 007176EE    mov         eax,esi
 007176F0    call        TParser.ParseIfStatement
 007176F5    mov         dword ptr [edi+18],eax;TIfStatement.ElseCode:TStatement
>007176F8    jmp         007177DF
 007176FD    mov         dl,61
 007176FF    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00717702    call        TScanner.read
 00717707    test        al,al
>00717709    je          007177DF
 0071770F    mov         edx,7177F4;'begin'
 00717714    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00717717    call        TScanner.ReadIdentifier
 0071771C    test        al,al
>0071771E    jne         00717735
 00717720    mov         edx,71780C;'anfangen'
 00717725    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00717728    call        TScanner.ReadIdentifier
 0071772D    test        al,al
>0071772F    jne         00717735
 00717731    xor         ebx,ebx
>00717733    jmp         00717737
 00717735    mov         bl,1
 00717737    mov         dl,14
 00717739    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 0071773C    call        TScanner.read
 00717741    or          bl,al
 00717743    test        bl,bl
>00717745    jne         00717754
 00717747    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 0071774A    cmp         byte ptr [eax+8],6C;TScanner.token:TToken
>0071774E    je          00717754
 00717750    xor         eax,eax
>00717752    jmp         00717756
 00717754    mov         al,1
 00717756    mov         ebx,eax
 00717758    test        bl,bl
>0071775A    je          00717772
 0071775C    mov         dl,6C
 0071775E    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 00717761    call        TScanner.expect
 00717766    mov         eax,esi
 00717768    call        TParser.ParseCodeBlock
 0071776D    mov         dword ptr [edi+18],eax;TIfStatement.ElseCode:TStatement
>00717770    jmp         007177DF
 00717772    mov         eax,esi
 00717774    call        TParser.ParseStatement
 00717779    mov         dword ptr [edi+18],eax;TIfStatement.ElseCode:TStatement
>0071777C    jmp         007177DF
 0071777E    cmp         byte ptr [esp],0
>00717782    jne         007177A1
 00717784    cmp         byte ptr [esp+1],0
>00717789    jne         007177A1
 0071778B    mov         ecx,71782C;'"THEN" expected'
 00717790    mov         dl,1
 00717792    mov         eax,[00577004];ETokenExpected
 00717797    call        Exception.Create;ETokenExpected.Create
 0071779C    call        @RaiseExcept
 007177A1    mov         eax,esi
 007177A3    call        TParser.ParseStatement
 007177A8    mov         dword ptr [edi+14],eax;TIfStatement.IfCode:TStatement
 007177AB    mov         dl,62
 007177AD    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 007177B0    call        TScanner.read
 007177B5    test        al,al
>007177B7    je          007177C7
 007177B9    mov         dl,1
 007177BB    mov         eax,esi
 007177BD    call        TParser.ParseIfStatement
 007177C2    mov         dword ptr [edi+18],eax;TIfStatement.ElseCode:TStatement
>007177C5    jmp         007177DF
 007177C7    mov         dl,61
 007177C9    mov         eax,dword ptr [esi+4];TParser.s:TScanner
 007177CC    call        TScanner.read
 007177D1    test        al,al
>007177D3    je          007177DF
 007177D5    mov         eax,esi
 007177D7    call        TParser.ParseStatement
 007177DC    mov         dword ptr [edi+18],eax;TIfStatement.ElseCode:TStatement
 007177DF    mov         eax,edi
 007177E1    pop         edx
 007177E2    pop         edi
 007177E3    pop         esi
 007177E4    pop         ebx
 007177E5    ret
*}
end;

//0071784C
function TParser.ParseCodeBlock:TStatement;
begin
{*
 0071784C    push        ebp
 0071784D    mov         ebp,esp
 0071784F    mov         ecx,5
 00717854    push        0
 00717856    push        0
 00717858    dec         ecx
>00717859    jne         00717854
 0071785B    push        ecx
 0071785C    push        ebx
 0071785D    push        esi
 0071785E    push        edi
 0071785F    mov         dword ptr [ebp-4],eax
 00717862    xor         eax,eax
 00717864    push        ebp
 00717865    push        717A47
 0071786A    push        dword ptr fs:[eax]
 0071786D    mov         dword ptr fs:[eax],esp
 00717870    mov         dl,1
 00717872    mov         eax,[0067A404];TCodeBlock
 00717877    call        TCodeBlock.Create;TCodeBlock.Create
 0071787C    mov         dword ptr [ebp-8],eax
 0071787F    mov         eax,dword ptr [ebp-4]
 00717882    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 00717885    mov         eax,dword ptr [eax+20];TScanner.LineNumber:Integer
 00717888    mov         edx,dword ptr [ebp-8]
 0071788B    mov         dword ptr [edx+8],eax;TCodeBlock.StartLine:Integer
 0071788E    mov         byte ptr [ebp-9],1
>00717892    jmp         0071798C
 00717897    xor         eax,eax
 00717899    push        ebp
 0071789A    push        7178F9
 0071789F    push        dword ptr fs:[eax]
 007178A2    mov         dword ptr fs:[eax],esp
 007178A5    mov         eax,dword ptr [ebp-4]
 007178A8    call        TParser.ParseLine
 007178AD    mov         ebx,eax
 007178AF    test        ebx,ebx
>007178B1    je          007178D7
 007178B3    test        ebx,ebx
>007178B5    je          007178D7
 007178B7    mov         eax,ebx
 007178B9    mov         edx,dword ptr ds:[679C48];TComment
 007178BF    call        @IsClass
 007178C4    test        al,al
>007178C6    jne         007178EC
 007178C8    mov         edx,ebx
 007178CA    mov         eax,dword ptr [ebp-8]
 007178CD    mov         eax,dword ptr [eax+10];TCodeBlock.L:TObjectList
 007178D0    call        TList.Add
>007178D5    jmp         007178EC
 007178D7    test        ebx,ebx
>007178D9    jne         007178EC
 007178DB    mov         byte ptr [ebp-9],0
 007178DF    xor         eax,eax
 007178E1    pop         edx
 007178E2    pop         ecx
 007178E3    pop         ecx
 007178E4    mov         dword ptr fs:[eax],edx
>007178E7    jmp         0071799F
 007178EC    xor         eax,eax
 007178EE    pop         edx
 007178EF    pop         ecx
 007178F0    pop         ecx
 007178F1    mov         dword ptr fs:[eax],edx
>007178F4    jmp         0071798C
>007178F9    jmp         @HandleOnException
 007178FE    dd          1
 00717902    dd          00576F6C;ECompiler
 00717906    dd          0071790A
 0071790A    mov         esi,eax
 0071790C    mov         eax,dword ptr [ebp-4]
 0071790F    mov         edi,dword ptr [eax+8];TParser.Errors:TStrings
 00717912    test        edi,edi
>00717914    je          0071794B
 00717916    lea         edx,[ebp-14]
 00717919    mov         eax,dword ptr [ebp-4]
 0071791C    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071791F    mov         eax,dword ptr [eax+20];TScanner.LineNumber:Integer
 00717922    call        IntToStr
 00717927    push        dword ptr [ebp-14]
 0071792A    push        717A64;': '
 0071792F    push        dword ptr [esi+4];ECompiler.FMessage:string
 00717932    lea         eax,[ebp-10]
 00717935    mov         edx,3
 0071793A    call        @UStrCatN
 0071793F    mov         edx,dword ptr [ebp-10]
 00717942    mov         eax,edi
 00717944    mov         ecx,dword ptr [eax]
 00717946    call        dword ptr [ecx+38];TStrings.Add
>00717949    jmp         0071797C
 0071794B    lea         edx,[ebp-1C]
 0071794E    mov         eax,dword ptr [ebp-4]
 00717951    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 00717954    mov         eax,dword ptr [eax+20];TScanner.LineNumber:Integer
 00717957    call        IntToStr
 0071795C    push        dword ptr [ebp-1C]
 0071795F    push        717A64;': '
 00717964    push        dword ptr [esi+4];ECompiler.FMessage:string
 00717967    lea         eax,[ebp-18]
 0071796A    mov         edx,3
 0071796F    call        @UStrCatN
 00717974    mov         eax,dword ptr [ebp-18]
 00717977    call        ShowMessage
 0071797C    mov         eax,dword ptr [ebp-4]
 0071797F    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 00717982    call        TScanner.NextLine
 00717987    call        @DoneExcept
 0071798C    mov         eax,dword ptr [ebp-4]
 0071798F    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 00717992    call        TScanner.EOF
 00717997    test        al,al
>00717999    je          00717897
 0071799F    cmp         byte ptr [ebp-9],0
>007179A3    je          00717A19
 007179A5    mov         eax,dword ptr [ebp-4]
 007179A8    mov         ebx,dword ptr [eax+8];TParser.Errors:TStrings
 007179AB    test        ebx,ebx
>007179AD    je          007179E6
 007179AF    lea         edx,[ebp-24]
 007179B2    mov         eax,dword ptr [ebp-4]
 007179B5    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 007179B8    mov         eax,dword ptr [eax+20];TScanner.LineNumber:Integer
 007179BB    call        IntToStr
 007179C0    push        dword ptr [ebp-24]
 007179C3    push        717A64;': '
 007179C8    push        717A78;'Missing End If'
 007179CD    lea         eax,[ebp-20]
 007179D0    mov         edx,3
 007179D5    call        @UStrCatN
 007179DA    mov         edx,dword ptr [ebp-20]
 007179DD    mov         eax,ebx
 007179DF    mov         ecx,dword ptr [eax]
 007179E1    call        dword ptr [ecx+38];TStrings.Add
>007179E4    jmp         00717A19
 007179E6    lea         edx,[ebp-2C]
 007179E9    mov         eax,dword ptr [ebp-4]
 007179EC    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 007179EF    mov         eax,dword ptr [eax+20];TScanner.LineNumber:Integer
 007179F2    call        IntToStr
 007179F7    push        dword ptr [ebp-2C]
 007179FA    push        717A64;': '
 007179FF    push        717A78;'Missing End If'
 00717A04    lea         eax,[ebp-28]
 00717A07    mov         edx,3
 00717A0C    call        @UStrCatN
 00717A11    mov         eax,dword ptr [ebp-28]
 00717A14    call        ShowMessage
 00717A19    mov         ebx,dword ptr [ebp-8]
 00717A1C    test        ebx,ebx
>00717A1E    je          00717A2C
 00717A20    mov         eax,dword ptr [ebp-4]
 00717A23    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 00717A26    mov         eax,dword ptr [eax+20];TScanner.LineNumber:Integer
 00717A29    mov         dword ptr [ebx+0C],eax;TCodeBlock.EndLine:Integer
 00717A2C    xor         eax,eax
 00717A2E    pop         edx
 00717A2F    pop         ecx
 00717A30    pop         ecx
 00717A31    mov         dword ptr fs:[eax],edx
 00717A34    push        717A4E
 00717A39    lea         eax,[ebp-2C]
 00717A3C    mov         edx,8
 00717A41    call        @UStrArrayClr
 00717A46    ret
>00717A47    jmp         @HandleFinally
>00717A4C    jmp         00717A39
 00717A4E    mov         eax,ebx
 00717A50    pop         edi
 00717A51    pop         esi
 00717A52    pop         ebx
 00717A53    mov         esp,ebp
 00717A55    pop         ebp
 00717A56    ret
*}
end;

//00717A98
{*function sub_00717A98(?:?):?;
begin
 00717A98    push        ebp
 00717A99    mov         ebp,esp
 00717A9B    add         esp,0FFFFFFF8
 00717A9E    push        ebx
 00717A9F    xor         edx,edx
 00717AA1    mov         dword ptr [ebp-8],edx
 00717AA4    mov         dword ptr [ebp-4],eax
 00717AA7    mov         eax,dword ptr [ebp-4]
 00717AAA    call        @UStrAddRef
 00717AAF    xor         eax,eax
 00717AB1    push        ebp
 00717AB2    push        7187C6
 00717AB7    push        dword ptr fs:[eax]
 00717ABA    mov         dword ptr fs:[eax],esp
 00717ABD    lea         edx,[ebp-8]
 00717AC0    mov         eax,dword ptr [ebp-4]
 00717AC3    call        LowerCase
 00717AC8    mov         edx,dword ptr [ebp-8]
 00717ACB    lea         eax,[ebp-4]
 00717ACE    call        @UStrLAsg
 00717AD3    mov         eax,dword ptr [ebp-4]
 00717AD6    mov         edx,7187E0;'nounits'
 00717ADB    call        @UStrEqual
>00717AE0    jne         00717AE9
 00717AE2    xor         ebx,ebx
>00717AE4    jmp         007187AB
 00717AE9    mov         eax,dword ptr [ebp-4]
 00717AEC    mov         edx,7187FC;'m'
 00717AF1    call        @UStrEqual
>00717AF6    je          00717B34
 00717AF8    mov         eax,dword ptr [ebp-4]
 00717AFB    mov         edx,71880C;'metres'
 00717B00    call        @UStrEqual
>00717B05    je          00717B34
 00717B07    mov         eax,dword ptr [ebp-4]
 00717B0A    mov         edx,718828;'meters'
 00717B0F    call        @UStrEqual
>00717B14    je          00717B34
 00717B16    mov         eax,dword ptr [ebp-4]
 00717B19    mov         edx,718844;'metre'
 00717B1E    call        @UStrEqual
>00717B23    je          00717B34
 00717B25    mov         eax,dword ptr [ebp-4]
 00717B28    mov         edx,71885C;'meter'
 00717B2D    call        @UStrEqual
>00717B32    jne         00717B3B
 00717B34    mov         bl,5
>00717B36    jmp         007187AB
 00717B3B    mov         eax,dword ptr [ebp-4]
 00717B3E    mov         edx,718874;'cm'
 00717B43    call        @UStrEqual
>00717B48    je          00717BA4
 00717B4A    mov         eax,dword ptr [ebp-4]
 00717B4D    mov         edx,718888;'centimetres'
 00717B52    call        @UStrEqual
>00717B57    je          00717BA4
 00717B59    mov         eax,dword ptr [ebp-4]
 00717B5C    mov         edx,7188AC;'centimeters'
 00717B61    call        @UStrEqual
>00717B66    je          00717BA4
 00717B68    mov         eax,dword ptr [ebp-4]
 00717B6B    mov         edx,7188D0;'centimetre'
 00717B70    call        @UStrEqual
>00717B75    je          00717BA4
 00717B77    mov         eax,dword ptr [ebp-4]
 00717B7A    mov         edx,7188F4;'centimeter'
 00717B7F    call        @UStrEqual
>00717B84    je          00717BA4
 00717B86    mov         eax,dword ptr [ebp-4]
 00717B89    mov         edx,718918;'zentimeter'
 00717B8E    call        @UStrEqual
>00717B93    je          00717BA4
 00717B95    mov         eax,dword ptr [ebp-4]
 00717B98    mov         edx,71893C;'zm'
 00717B9D    call        @UStrEqual
>00717BA2    jne         00717BAB
 00717BA4    mov         bl,4
>00717BA6    jmp         007187AB
 00717BAB    mov         eax,dword ptr [ebp-4]
 00717BAE    mov         edx,718950;'mm'
 00717BB3    call        @UStrEqual
>00717BB8    je          00717C32
 00717BBA    mov         eax,dword ptr [ebp-4]
 00717BBD    mov         edx,718964;'milimetres'
 00717BC2    call        @UStrEqual
>00717BC7    je          00717C32
 00717BC9    mov         eax,dword ptr [ebp-4]
 00717BCC    mov         edx,718988;'milimeters'
 00717BD1    call        @UStrEqual
>00717BD6    je          00717C32
 00717BD8    mov         eax,dword ptr [ebp-4]
 00717BDB    mov         edx,7189AC;'millimetres'
 00717BE0    call        @UStrEqual
>00717BE5    je          00717C32
 00717BE7    mov         eax,dword ptr [ebp-4]
 00717BEA    mov         edx,7189D0;'millimeters'
 00717BEF    call        @UStrEqual
>00717BF4    je          00717C32
 00717BF6    mov         eax,dword ptr [ebp-4]
 00717BF9    mov         edx,7189F4;'milimetre'
 00717BFE    call        @UStrEqual
>00717C03    je          00717C32
 00717C05    mov         eax,dword ptr [ebp-4]
 00717C08    mov         edx,718A14;'milimeter'
 00717C0D    call        @UStrEqual
>00717C12    je          00717C32
 00717C14    mov         eax,dword ptr [ebp-4]
 00717C17    mov         edx,718A34;'millimetre'
 00717C1C    call        @UStrEqual
>00717C21    je          00717C32
 00717C23    mov         eax,dword ptr [ebp-4]
 00717C26    mov         edx,718A58;'millimeter'
 00717C2B    call        @UStrEqual
>00717C30    jne         00717C39
 00717C32    mov         bl,3
>00717C34    jmp         007187AB
 00717C39    mov         eax,dword ptr [ebp-4]
 00717C3C    mov         edx,718A7C;'micrometres'
 00717C41    call        @UStrEqual
>00717C46    je          00717C75
 00717C48    mov         eax,dword ptr [ebp-4]
 00717C4B    mov         edx,718AA0;'micrometers'
 00717C50    call        @UStrEqual
>00717C55    je          00717C75
 00717C57    mov         eax,dword ptr [ebp-4]
 00717C5A    mov         edx,718AC4;'micrometer'
 00717C5F    call        @UStrEqual
>00717C64    je          00717C75
 00717C66    mov         eax,dword ptr [ebp-4]
 00717C69    mov         edx,718AE8;'micrometre'
 00717C6E    call        @UStrEqual
>00717C73    jne         00717C7C
 00717C75    mov         bl,2
>00717C77    jmp         007187AB
 00717C7C    mov         eax,dword ptr [ebp-4]
 00717C7F    mov         edx,718B0C;'nanometres'
 00717C84    call        @UStrEqual
>00717C89    je          00717CB8
 00717C8B    mov         eax,dword ptr [ebp-4]
 00717C8E    mov         edx,718B30;'nanometers'
 00717C93    call        @UStrEqual
>00717C98    je          00717CB8
 00717C9A    mov         eax,dword ptr [ebp-4]
 00717C9D    mov         edx,718B54;'nanometre'
 00717CA2    call        @UStrEqual
>00717CA7    je          00717CB8
 00717CA9    mov         eax,dword ptr [ebp-4]
 00717CAC    mov         edx,718B74;'nanometer'
 00717CB1    call        @UStrEqual
>00717CB6    jne         00717CBF
 00717CB8    mov         bl,1
>00717CBA    jmp         007187AB
 00717CBF    mov         eax,dword ptr [ebp-4]
 00717CC2    mov         edx,718B94;'km'
 00717CC7    call        @UStrEqual
>00717CCC    je          00717D0A
 00717CCE    mov         eax,dword ptr [ebp-4]
 00717CD1    mov         edx,718BA8;'kilometres'
 00717CD6    call        @UStrEqual
>00717CDB    je          00717D0A
 00717CDD    mov         eax,dword ptr [ebp-4]
 00717CE0    mov         edx,718BCC;'kilometers'
 00717CE5    call        @UStrEqual
>00717CEA    je          00717D0A
 00717CEC    mov         eax,dword ptr [ebp-4]
 00717CEF    mov         edx,718BF0;'kilometre'
 00717CF4    call        @UStrEqual
>00717CF9    je          00717D0A
 00717CFB    mov         eax,dword ptr [ebp-4]
 00717CFE    mov         edx,718C10;'kilometer'
 00717D03    call        @UStrEqual
>00717D08    jne         00717D11
 00717D0A    mov         bl,6
>00717D0C    jmp         007187AB
 00717D11    mov         eax,dword ptr [ebp-4]
 00717D14    mov         edx,718C30;'inch'
 00717D19    call        @UStrEqual
>00717D1E    je          00717D4D
 00717D20    mov         eax,dword ptr [ebp-4]
 00717D23    mov         edx,718C48;'inchs'
 00717D28    call        @UStrEqual
>00717D2D    je          00717D4D
 00717D2F    mov         eax,dword ptr [ebp-4]
 00717D32    mov         edx,718C60;'inches'
 00717D37    call        @UStrEqual
>00717D3C    je          00717D4D
 00717D3E    mov         eax,dword ptr [ebp-4]
 00717D41    mov         edx,718C7C;'zoll'
 00717D46    call        @UStrEqual
>00717D4B    jne         00717D54
 00717D4D    mov         bl,7
>00717D4F    jmp         007187AB
 00717D54    mov         eax,dword ptr [ebp-4]
 00717D57    mov         edx,718C94;'foot'
 00717D5C    call        @UStrEqual
>00717D61    je          00717D9F
 00717D63    mov         eax,dword ptr [ebp-4]
 00717D66    mov         edx,718CAC;'feet'
 00717D6B    call        @UStrEqual
>00717D70    je          00717D9F
 00717D72    mov         eax,dword ptr [ebp-4]
 00717D75    mov         edx,718CC4;'ft'
 00717D7A    call        @UStrEqual
>00717D7F    je          00717D9F
 00717D81    mov         eax,dword ptr [ebp-4]
 00717D84    mov         edx,718CD8;'fuß'
 00717D89    call        @UStrEqual
>00717D8E    je          00717D9F
 00717D90    mov         eax,dword ptr [ebp-4]
 00717D93    mov         edx,718CEC;'fuss'
 00717D98    call        @UStrEqual
>00717D9D    jne         00717DA6
 00717D9F    mov         bl,8
>00717DA1    jmp         007187AB
 00717DA6    mov         eax,dword ptr [ebp-4]
 00717DA9    mov         edx,718D04;'yard'
 00717DAE    call        @UStrEqual
>00717DB3    je          00717DC4
 00717DB5    mov         eax,dword ptr [ebp-4]
 00717DB8    mov         edx,718D1C;'yards'
 00717DBD    call        @UStrEqual
>00717DC2    jne         00717DCB
 00717DC4    mov         bl,9
>00717DC6    jmp         007187AB
 00717DCB    mov         eax,dword ptr [ebp-4]
 00717DCE    mov         edx,718D34;'mile'
 00717DD3    call        @UStrEqual
>00717DD8    je          00717E07
 00717DDA    mov         eax,dword ptr [ebp-4]
 00717DDD    mov         edx,718D4C;'miles'
 00717DE2    call        @UStrEqual
>00717DE7    je          00717E07
 00717DE9    mov         eax,dword ptr [ebp-4]
 00717DEC    mov         edx,718D64;'meile'
 00717DF1    call        @UStrEqual
>00717DF6    je          00717E07
 00717DF8    mov         eax,dword ptr [ebp-4]
 00717DFB    mov         edx,718D7C;'meilen'
 00717E00    call        @UStrEqual
>00717E05    jne         00717E0E
 00717E07    mov         bl,0A
>00717E09    jmp         007187AB
 00717E0E    mov         eax,dword ptr [ebp-4]
 00717E11    mov         edx,718D98;'p5unit'
 00717E16    call        @UStrEqual
>00717E1B    je          00717E2C
 00717E1D    mov         eax,dword ptr [ebp-4]
 00717E20    mov         edx,718DB4;'p5units'
 00717E25    call        @UStrEqual
>00717E2A    jne         00717E33
 00717E2C    mov         bl,0B
>00717E2E    jmp         007187AB
 00717E33    mov         eax,dword ptr [ebp-4]
 00717E36    mov         edx,718DD0;'unit'
 00717E3B    call        @UStrEqual
>00717E40    je          00717E51
 00717E42    mov         eax,dword ptr [ebp-4]
 00717E45    mov         edx,718DE8;'units'
 00717E4A    call        @UStrEqual
>00717E4F    jne         00717E58
 00717E51    xor         ebx,ebx
>00717E53    jmp         007187AB
 00717E58    mov         eax,dword ptr [ebp-4]
 00717E5B    mov         edx,718E00;'s'
 00717E60    call        @UStrEqual
>00717E65    je          00717EB2
 00717E67    mov         eax,dword ptr [ebp-4]
 00717E6A    mov         edx,718E10;'sec'
 00717E6F    call        @UStrEqual
>00717E74    je          00717EB2
 00717E76    mov         eax,dword ptr [ebp-4]
 00717E79    mov         edx,718E24;'second'
 00717E7E    call        @UStrEqual
>00717E83    je          00717EB2
 00717E85    mov         eax,dword ptr [ebp-4]
 00717E88    mov         edx,718E40;'seconds'
 00717E8D    call        @UStrEqual
>00717E92    je          00717EB2
 00717E94    mov         eax,dword ptr [ebp-4]
 00717E97    mov         edx,718E5C;'sekunden'
 00717E9C    call        @UStrEqual
>00717EA1    je          00717EB2
 00717EA3    mov         eax,dword ptr [ebp-4]
 00717EA6    mov         edx,718E7C;'sekunde'
 00717EAB    call        @UStrEqual
>00717EB0    jne         00717EB9
 00717EB2    mov         bl,11
>00717EB4    jmp         007187AB
 00717EB9    mov         eax,dword ptr [ebp-4]
 00717EBC    mov         edx,718E98;'ms'
 00717EC1    call        @UStrEqual
>00717EC6    je          00717F22
 00717EC8    mov         eax,dword ptr [ebp-4]
 00717ECB    mov         edx,718EAC;'milisecond'
 00717ED0    call        @UStrEqual
>00717ED5    je          00717F22
 00717ED7    mov         eax,dword ptr [ebp-4]
 00717EDA    mov         edx,718ED0;'miliseconds'
 00717EDF    call        @UStrEqual
>00717EE4    je          00717F22
 00717EE6    mov         eax,dword ptr [ebp-4]
 00717EE9    mov         edx,718EF4;'millisecond'
 00717EEE    call        @UStrEqual
>00717EF3    je          00717F22
 00717EF5    mov         eax,dword ptr [ebp-4]
 00717EF8    mov         edx,718F18;'milliseconds'
 00717EFD    call        @UStrEqual
>00717F02    je          00717F22
 00717F04    mov         eax,dword ptr [ebp-4]
 00717F07    mov         edx,718F40;'millisekunde'
 00717F0C    call        @UStrEqual
>00717F11    je          00717F22
 00717F13    mov         eax,dword ptr [ebp-4]
 00717F16    mov         edx,718F68;'millisekunden'
 00717F1B    call        @UStrEqual
>00717F20    jne         00717F29
 00717F22    mov         bl,10
>00717F24    jmp         007187AB
 00717F29    mov         eax,dword ptr [ebp-4]
 00717F2C    mov         edx,718F90;'microsecond'
 00717F31    call        @UStrEqual
>00717F36    je          00717F65
 00717F38    mov         eax,dword ptr [ebp-4]
 00717F3B    mov         edx,718FB4;'microseconds'
 00717F40    call        @UStrEqual
>00717F45    je          00717F65
 00717F47    mov         eax,dword ptr [ebp-4]
 00717F4A    mov         edx,718FDC;'mikrosekunde'
 00717F4F    call        @UStrEqual
>00717F54    je          00717F65
 00717F56    mov         eax,dword ptr [ebp-4]
 00717F59    mov         edx,719004;'mikrosekunden'
 00717F5E    call        @UStrEqual
>00717F63    jne         00717F6C
 00717F65    mov         bl,0F
>00717F67    jmp         007187AB
 00717F6C    mov         eax,dword ptr [ebp-4]
 00717F6F    mov         edx,71902C;'nanosecond'
 00717F74    call        @UStrEqual
>00717F79    je          00717F8A
 00717F7B    mov         eax,dword ptr [ebp-4]
 00717F7E    mov         edx,719050;'nanoseconds'
 00717F83    call        @UStrEqual
>00717F88    jne         00717F91
 00717F8A    mov         bl,0E
>00717F8C    jmp         007187AB
 00717F91    mov         eax,dword ptr [ebp-4]
 00717F94    mov         edx,719074;'min'
 00717F99    call        @UStrEqual
>00717F9E    je          00717FCD
 00717FA0    mov         eax,dword ptr [ebp-4]
 00717FA3    mov         edx,719088;'minute'
 00717FA8    call        @UStrEqual
>00717FAD    je          00717FCD
 00717FAF    mov         eax,dword ptr [ebp-4]
 00717FB2    mov         edx,7190A4;'minutes'
 00717FB7    call        @UStrEqual
>00717FBC    je          00717FCD
 00717FBE    mov         eax,dword ptr [ebp-4]
 00717FC1    mov         edx,7190C0;'minuten'
 00717FC6    call        @UStrEqual
>00717FCB    jne         00717FD4
 00717FCD    mov         bl,12
>00717FCF    jmp         007187AB
 00717FD4    mov         eax,dword ptr [ebp-4]
 00717FD7    mov         edx,7190DC;'hr'
 00717FDC    call        @UStrEqual
>00717FE1    je          0071801F
 00717FE3    mov         eax,dword ptr [ebp-4]
 00717FE6    mov         edx,7190F0;'hour'
 00717FEB    call        @UStrEqual
>00717FF0    je          0071801F
 00717FF2    mov         eax,dword ptr [ebp-4]
 00717FF5    mov         edx,719108;'hours'
 00717FFA    call        @UStrEqual
>00717FFF    je          0071801F
 00718001    mov         eax,dword ptr [ebp-4]
 00718004    mov         edx,719120;'stunde'
 00718009    call        @UStrEqual
>0071800E    je          0071801F
 00718010    mov         eax,dword ptr [ebp-4]
 00718013    mov         edx,71913C;'stunden'
 00718018    call        @UStrEqual
>0071801D    jne         00718026
 0071801F    mov         bl,13
>00718021    jmp         007187AB
 00718026    mov         eax,dword ptr [ebp-4]
 00718029    mov         edx,719158;'day'
 0071802E    call        @UStrEqual
>00718033    je          00718062
 00718035    mov         eax,dword ptr [ebp-4]
 00718038    mov         edx,71916C;'days'
 0071803D    call        @UStrEqual
>00718042    je          00718062
 00718044    mov         eax,dword ptr [ebp-4]
 00718047    mov         edx,719184;'tag'
 0071804C    call        @UStrEqual
>00718051    je          00718062
 00718053    mov         eax,dword ptr [ebp-4]
 00718056    mov         edx,719198;'tage'
 0071805B    call        @UStrEqual
>00718060    jne         00718069
 00718062    mov         bl,14
>00718064    jmp         007187AB
 00718069    mov         eax,dword ptr [ebp-4]
 0071806C    mov         edx,7191B0;'year'
 00718071    call        @UStrEqual
>00718076    je          007180C3
 00718078    mov         eax,dword ptr [ebp-4]
 0071807B    mov         edx,7191C8;'years'
 00718080    call        @UStrEqual
>00718085    je          007180C3
 00718087    mov         eax,dword ptr [ebp-4]
 0071808A    mov         edx,7191E0;'yr'
 0071808F    call        @UStrEqual
>00718094    je          007180C3
 00718096    mov         eax,dword ptr [ebp-4]
 00718099    mov         edx,7191F4;'yrs'
 0071809E    call        @UStrEqual
>007180A3    je          007180C3
 007180A5    mov         eax,dword ptr [ebp-4]
 007180A8    mov         edx,719208;'jahr'
 007180AD    call        @UStrEqual
>007180B2    je          007180C3
 007180B4    mov         eax,dword ptr [ebp-4]
 007180B7    mov         edx,719220;'jahre'
 007180BC    call        @UStrEqual
>007180C1    jne         007180CA
 007180C3    mov         bl,15
>007180C5    jmp         007187AB
 007180CA    mov         eax,dword ptr [ebp-4]
 007180CD    mov         edx,719238;'deg'
 007180D2    call        @UStrEqual
>007180D7    je          00718151
 007180D9    mov         eax,dword ptr [ebp-4]
 007180DC    mov         edx,71924C;'degs'
 007180E1    call        @UStrEqual
>007180E6    je          00718151
 007180E8    mov         eax,dword ptr [ebp-4]
 007180EB    mov         edx,719264;'degree'
 007180F0    call        @UStrEqual
>007180F5    je          00718151
 007180F7    mov         eax,dword ptr [ebp-4]
 007180FA    mov         edx,719280;'degrees'
 007180FF    call        @UStrEqual
>00718104    je          00718151
 00718106    mov         eax,dword ptr [ebp-4]
 00718109    mov         edx,71929C;'grad'
 0071810E    call        @UStrEqual
>00718113    je          00718151
 00718115    mov         eax,dword ptr [ebp-4]
 00718118    mov         edx,7192B4;'celcius'
 0071811D    call        @UStrEqual
>00718122    je          00718151
 00718124    mov         eax,dword ptr [ebp-4]
 00718127    mov         edx,7192D0;'centigrade'
 0071812C    call        @UStrEqual
>00718131    je          00718151
 00718133    mov         eax,dword ptr [ebp-4]
 00718136    mov         edx,7192F4;'kelvin'
 0071813B    call        @UStrEqual
>00718140    je          00718151
 00718142    mov         eax,dword ptr [ebp-4]
 00718145    mov         edx,719310;'fahrenheit'
 0071814A    call        @UStrEqual
>0071814F    jne         00718158
 00718151    mov         bl,18
>00718153    jmp         007187AB
 00718158    mov         eax,dword ptr [ebp-4]
 0071815B    mov         edx,719334;'rad'
 00718160    call        @UStrEqual
>00718165    je          007181A3
 00718167    mov         eax,dword ptr [ebp-4]
 0071816A    mov         edx,719348;'rads'
 0071816F    call        @UStrEqual
>00718174    je          007181A3
 00718176    mov         eax,dword ptr [ebp-4]
 00718179    mov         edx,719360;'radian'
 0071817E    call        @UStrEqual
>00718183    je          007181A3
 00718185    mov         eax,dword ptr [ebp-4]
 00718188    mov         edx,71937C;'radians'
 0071818D    call        @UStrEqual
>00718192    je          007181A3
 00718194    mov         eax,dword ptr [ebp-4]
 00718197    mov         edx,719398;'einheitswinkel'
 0071819C    call        @UStrEqual
>007181A1    jne         007181AA
 007181A3    mov         bl,17
>007181A5    jmp         007187AB
 007181AA    mov         eax,dword ptr [ebp-4]
 007181AD    mov         edx,7193C4;'rev'
 007181B2    call        @UStrEqual
>007181B7    je          00718231
 007181B9    mov         eax,dword ptr [ebp-4]
 007181BC    mov         edx,7193D8;'revs'
 007181C1    call        @UStrEqual
>007181C6    je          00718231
 007181C8    mov         eax,dword ptr [ebp-4]
 007181CB    mov         edx,7193F0;'revolution'
 007181D0    call        @UStrEqual
>007181D5    je          00718231
 007181D7    mov         eax,dword ptr [ebp-4]
 007181DA    mov         edx,719414;'revolutions'
 007181DF    call        @UStrEqual
>007181E4    je          00718231
 007181E6    mov         eax,dword ptr [ebp-4]
 007181E9    mov         edx,719438;'rotation'
 007181EE    call        @UStrEqual
>007181F3    je          00718231
 007181F5    mov         eax,dword ptr [ebp-4]
 007181F8    mov         edx,719458;'rotations'
 007181FD    call        @UStrEqual
>00718202    je          00718231
 00718204    mov         eax,dword ptr [ebp-4]
 00718207    mov         edx,719478;'revolutionen'
 0071820C    call        @UStrEqual
>00718211    je          00718231
 00718213    mov         eax,dword ptr [ebp-4]
 00718216    mov         edx,7194A0;'umdrehung'
 0071821B    call        @UStrEqual
>00718220    je          00718231
 00718222    mov         eax,dword ptr [ebp-4]
 00718225    mov         edx,7194C0;'umdrehungen'
 0071822A    call        @UStrEqual
>0071822F    jne         00718238
 00718231    mov         bl,19
>00718233    jmp         007187AB
 00718238    mov         eax,dword ptr [ebp-4]
 0071823B    mov         edx,7194E4;'pixel'
 00718240    call        @UStrEqual
>00718245    je          00718256
 00718247    mov         eax,dword ptr [ebp-4]
 0071824A    mov         edx,7194FC;'pixels'
 0071824F    call        @UStrEqual
>00718254    jne         0071825D
 00718256    mov         bl,0C
>00718258    jmp         007187AB
 0071825D    mov         eax,dword ptr [ebp-4]
 00718260    mov         edx,719518;'mickey'
 00718265    call        @UStrEqual
>0071826A    je          0071827B
 0071826C    mov         eax,dword ptr [ebp-4]
 0071826F    mov         edx,719534;'mickeys'
 00718274    call        @UStrEqual
>00718279    jne         00718282
 0071827B    mov         bl,0D
>0071827D    jmp         007187AB
 00718282    mov         eax,dword ptr [ebp-4]
 00718285    mov         edx,719550;'pieframe'
 0071828A    call        @UStrEqual
>0071828F    je          007182A0
 00718291    mov         eax,dword ptr [ebp-4]
 00718294    mov         edx,719570;'pieframes'
 00718299    call        @UStrEqual
>0071829E    jne         007182A7
 007182A0    mov         bl,16
>007182A2    jmp         007187AB
 007182A7    mov         eax,dword ptr [ebp-4]
 007182AA    mov         edx,719590;'cent'
 007182AF    call        @UStrEqual
>007182B4    je          007182C5
 007182B6    mov         eax,dword ptr [ebp-4]
 007182B9    mov         edx,7195A8;'cents'
 007182BE    call        @UStrEqual
>007182C3    jne         007182CC
 007182C5    mov         bl,1A
>007182C7    jmp         007187AB
 007182CC    mov         eax,dword ptr [ebp-4]
 007182CF    mov         edx,7195C0;'semitone'
 007182D4    call        @UStrEqual
>007182D9    je          00718326
 007182DB    mov         eax,dword ptr [ebp-4]
 007182DE    mov         edx,7195E0;'semitones'
 007182E3    call        @UStrEqual
>007182E8    je          00718326
 007182EA    mov         eax,dword ptr [ebp-4]
 007182ED    mov         edx,719600;'minorsecond'
 007182F2    call        @UStrEqual
>007182F7    je          00718326
 007182F9    mov         eax,dword ptr [ebp-4]
 007182FC    mov         edx,719624;'halfstep'
 00718301    call        @UStrEqual
>00718306    je          00718326
 00718308    mov         eax,dword ptr [ebp-4]
 0071830B    mov         edx,719644;'note'
 00718310    call        @UStrEqual
>00718315    je          00718326
 00718317    mov         eax,dword ptr [ebp-4]
 0071831A    mov         edx,71965C;'notes'
 0071831F    call        @UStrEqual
>00718324    jne         0071832D
 00718326    mov         bl,1B
>00718328    jmp         007187AB
 0071832D    mov         eax,dword ptr [ebp-4]
 00718330    mov         edx,719674;'octave'
 00718335    call        @UStrEqual
>0071833A    je          00718369
 0071833C    mov         eax,dword ptr [ebp-4]
 0071833F    mov         edx,719690;'octaves'
 00718344    call        @UStrEqual
>00718349    je          00718369
 0071834B    mov         eax,dword ptr [ebp-4]
 0071834E    mov         edx,7196AC;'oktave'
 00718353    call        @UStrEqual
>00718358    je          00718369
 0071835A    mov         eax,dword ptr [ebp-4]
 0071835D    mov         edx,7196C8;'oktaven'
 00718362    call        @UStrEqual
>00718367    jne         00718370
 00718369    mov         bl,1C
>0071836B    jmp         007187AB
 00718370    mov         eax,dword ptr [ebp-4]
 00718373    mov         edx,7196E4;'majorsecond'
 00718378    call        @UStrEqual
>0071837D    je          007183AC
 0071837F    mov         eax,dword ptr [ebp-4]
 00718382    mov         edx,719708;'majorseconds'
 00718387    call        @UStrEqual
>0071838C    je          007183AC
 0071838E    mov         eax,dword ptr [ebp-4]
 00718391    mov         edx,719730;'diminishedthird'
 00718396    call        @UStrEqual
>0071839B    je          007183AC
 0071839D    mov         eax,dword ptr [ebp-4]
 007183A0    mov         edx,71975C;'diminishedthirds'
 007183A5    call        @UStrEqual
>007183AA    jne         007183B3
 007183AC    mov         bl,1D
>007183AE    jmp         007187AB
 007183B3    mov         eax,dword ptr [ebp-4]
 007183B6    mov         edx,71978C;'minorthird'
 007183BB    call        @UStrEqual
>007183C0    je          007183EF
 007183C2    mov         eax,dword ptr [ebp-4]
 007183C5    mov         edx,7197B0;'minorthirds'
 007183CA    call        @UStrEqual
>007183CF    je          007183EF
 007183D1    mov         eax,dword ptr [ebp-4]
 007183D4    mov         edx,7197D4;'augmentedsecond'
 007183D9    call        @UStrEqual
>007183DE    je          007183EF
 007183E0    mov         eax,dword ptr [ebp-4]
 007183E3    mov         edx,719800;'augmentedseconds'
 007183E8    call        @UStrEqual
>007183ED    jne         007183F6
 007183EF    mov         bl,1E
>007183F1    jmp         007187AB
 007183F6    mov         eax,dword ptr [ebp-4]
 007183F9    mov         edx,719830;'majorthird'
 007183FE    call        @UStrEqual
>00718403    je          00718432
 00718405    mov         eax,dword ptr [ebp-4]
 00718408    mov         edx,719854;'majorthirds'
 0071840D    call        @UStrEqual
>00718412    je          00718432
 00718414    mov         eax,dword ptr [ebp-4]
 00718417    mov         edx,719878;'diminishedfourth'
 0071841C    call        @UStrEqual
>00718421    je          00718432
 00718423    mov         eax,dword ptr [ebp-4]
 00718426    mov         edx,7198A8;'diminishedfourths'
 0071842B    call        @UStrEqual
>00718430    jne         00718439
 00718432    mov         bl,1F
>00718434    jmp         007187AB
 00718439    mov         eax,dword ptr [ebp-4]
 0071843C    mov         edx,7198D8;'perfectfourth'
 00718441    call        @UStrEqual
>00718446    je          00718475
 00718448    mov         eax,dword ptr [ebp-4]
 0071844B    mov         edx,719900;'perfectfourths'
 00718450    call        @UStrEqual
>00718455    je          00718475
 00718457    mov         eax,dword ptr [ebp-4]
 0071845A    mov         edx,71992C;'augmentedthird'
 0071845F    call        @UStrEqual
>00718464    je          00718475
 00718466    mov         eax,dword ptr [ebp-4]
 00718469    mov         edx,719958;'augmentedthirds'
 0071846E    call        @UStrEqual
>00718473    jne         0071847C
 00718475    mov         bl,20
>00718477    jmp         007187AB
 0071847C    mov         eax,dword ptr [ebp-4]
 0071847F    mov         edx,719984;'tritone'
 00718484    call        @UStrEqual
>00718489    je          007184D6
 0071848B    mov         eax,dword ptr [ebp-4]
 0071848E    mov         edx,7199A0;'tritones'
 00718493    call        @UStrEqual
>00718498    je          007184D6
 0071849A    mov         eax,dword ptr [ebp-4]
 0071849D    mov         edx,7199C0;'augmentedfourth'
 007184A2    call        @UStrEqual
>007184A7    je          007184D6
 007184A9    mov         eax,dword ptr [ebp-4]
 007184AC    mov         edx,7199EC;'augmentedfourths'
 007184B1    call        @UStrEqual
>007184B6    je          007184D6
 007184B8    mov         eax,dword ptr [ebp-4]
 007184BB    mov         edx,719A1C;'diminishedfifth'
 007184C0    call        @UStrEqual
>007184C5    je          007184D6
 007184C7    mov         eax,dword ptr [ebp-4]
 007184CA    mov         edx,719A48;'diminishedfifths'
 007184CF    call        @UStrEqual
>007184D4    jne         007184DD
 007184D6    mov         bl,21
>007184D8    jmp         007187AB
 007184DD    mov         eax,dword ptr [ebp-4]
 007184E0    mov         edx,719A78;'minorsixth'
 007184E5    call        @UStrEqual
>007184EA    je          00718519
 007184EC    mov         eax,dword ptr [ebp-4]
 007184EF    mov         edx,719A9C;'minorsixths'
 007184F4    call        @UStrEqual
>007184F9    je          00718519
 007184FB    mov         eax,dword ptr [ebp-4]
 007184FE    mov         edx,719AC0;'augmentedfifth'
 00718503    call        @UStrEqual
>00718508    je          00718519
 0071850A    mov         eax,dword ptr [ebp-4]
 0071850D    mov         edx,719AEC;'augmentedfifths'
 00718512    call        @UStrEqual
>00718517    jne         00718520
 00718519    mov         bl,23
>0071851B    jmp         007187AB
 00718520    mov         eax,dword ptr [ebp-4]
 00718523    mov         edx,719B18;'majorsixth'
 00718528    call        @UStrEqual
>0071852D    je          0071855C
 0071852F    mov         eax,dword ptr [ebp-4]
 00718532    mov         edx,719B3C;'majorsixths'
 00718537    call        @UStrEqual
>0071853C    je          0071855C
 0071853E    mov         eax,dword ptr [ebp-4]
 00718541    mov         edx,719B60;'diminishedseventh'
 00718546    call        @UStrEqual
>0071854B    je          0071855C
 0071854D    mov         eax,dword ptr [ebp-4]
 00718550    mov         edx,719B90;'diminishedsevenths'
 00718555    call        @UStrEqual
>0071855A    jne         00718563
 0071855C    mov         bl,24
>0071855E    jmp         007187AB
 00718563    mov         eax,dword ptr [ebp-4]
 00718566    mov         edx,719BC4;'minorseventh'
 0071856B    call        @UStrEqual
>00718570    je          0071859F
 00718572    mov         eax,dword ptr [ebp-4]
 00718575    mov         edx,719BEC;'minorsevenths'
 0071857A    call        @UStrEqual
>0071857F    je          0071859F
 00718581    mov         eax,dword ptr [ebp-4]
 00718584    mov         edx,719C14;'augmentedsixth'
 00718589    call        @UStrEqual
>0071858E    je          0071859F
 00718590    mov         eax,dword ptr [ebp-4]
 00718593    mov         edx,719C40;'augmentedsixths'
 00718598    call        @UStrEqual
>0071859D    jne         007185A6
 0071859F    mov         bl,25
>007185A1    jmp         007187AB
 007185A6    mov         eax,dword ptr [ebp-4]
 007185A9    mov         edx,719C6C;'majorseventh'
 007185AE    call        @UStrEqual
>007185B3    je          007185E2
 007185B5    mov         eax,dword ptr [ebp-4]
 007185B8    mov         edx,719C94;'majorsevenths'
 007185BD    call        @UStrEqual
>007185C2    je          007185E2
 007185C4    mov         eax,dword ptr [ebp-4]
 007185C7    mov         edx,719CBC;'diminishedoctave'
 007185CC    call        @UStrEqual
>007185D1    je          007185E2
 007185D3    mov         eax,dword ptr [ebp-4]
 007185D6    mov         edx,719CEC;'diminishedoctaves'
 007185DB    call        @UStrEqual
>007185E0    jne         007185E9
 007185E2    mov         bl,26
>007185E4    jmp         007187AB
 007185E9    mov         eax,dword ptr [ebp-4]
 007185EC    mov         edx,719D1C;'kg'
 007185F1    call        @UStrEqual
>007185F6    je          00718643
 007185F8    mov         eax,dword ptr [ebp-4]
 007185FB    mov         edx,719D30;'kgs'
 00718600    call        @UStrEqual
>00718605    je          00718643
 00718607    mov         eax,dword ptr [ebp-4]
 0071860A    mov         edx,719D44;'kilogram'
 0071860F    call        @UStrEqual
>00718614    je          00718643
 00718616    mov         eax,dword ptr [ebp-4]
 00718619    mov         edx,719D64;'kilograms'
 0071861E    call        @UStrEqual
>00718623    je          00718643
 00718625    mov         eax,dword ptr [ebp-4]
 00718628    mov         edx,719D84;'kilo'
 0071862D    call        @UStrEqual
>00718632    je          00718643
 00718634    mov         eax,dword ptr [ebp-4]
 00718637    mov         edx,719D9C;'kilos'
 0071863C    call        @UStrEqual
>00718641    jne         0071864A
 00718643    mov         bl,28
>00718645    jmp         007187AB
 0071864A    mov         eax,dword ptr [ebp-4]
 0071864D    mov         edx,719DB4;'microgram'
 00718652    call        @UStrEqual
>00718657    je          00718668
 00718659    mov         eax,dword ptr [ebp-4]
 0071865C    mov         edx,719DD4;'micrograms'
 00718661    call        @UStrEqual
>00718666    jne         0071866F
 00718668    mov         bl,2B
>0071866A    jmp         007187AB
 0071866F    mov         eax,dword ptr [ebp-4]
 00718672    mov         edx,719DF8;'mg'
 00718677    call        @UStrEqual
>0071867C    je          0071869C
 0071867E    mov         eax,dword ptr [ebp-4]
 00718681    mov         edx,719E0C;'milligram'
 00718686    call        @UStrEqual
>0071868B    je          0071869C
 0071868D    mov         eax,dword ptr [ebp-4]
 00718690    mov         edx,719E2C;'milligrams'
 00718695    call        @UStrEqual
>0071869A    jne         007186A3
 0071869C    mov         bl,2A
>0071869E    jmp         007187AB
 007186A3    mov         eax,dword ptr [ebp-4]
 007186A6    mov         edx,719E50;'g'
 007186AB    call        @UStrEqual
>007186B0    je          007186D0
 007186B2    mov         eax,dword ptr [ebp-4]
 007186B5    mov         edx,719E60;'gram'
 007186BA    call        @UStrEqual
>007186BF    je          007186D0
 007186C1    mov         eax,dword ptr [ebp-4]
 007186C4    mov         edx,719E78;'grams'
 007186C9    call        @UStrEqual
>007186CE    jne         007186D7
 007186D0    mov         bl,29
>007186D2    jmp         007187AB
 007186D7    mov         eax,dword ptr [ebp-4]
 007186DA    mov         edx,719E90;^'RealLeftStick'
 007186DF    call        @UStrEqual
>007186E4    je          00718713
 007186E6    mov         eax,dword ptr [ebp-4]
 007186E9    mov         edx,719EA8;^'RealLeftStick'
 007186EE    call        @UStrEqual
>007186F3    je          00718713
 007186F5    mov         eax,dword ptr [ebp-4]
 007186F8    mov         edx,719EC4;'lb'
 007186FD    call        @UStrEqual
>00718702    je          00718713
 00718704    mov         eax,dword ptr [ebp-4]
 00718707    mov         edx,719ED8;'lbs'
 0071870C    call        @UStrEqual
>00718711    jne         0071871A
 00718713    mov         bl,2C
>00718715    jmp         007187AB
 0071871A    mov         eax,dword ptr [ebp-4]
 0071871D    mov         edx,719EEC;'ounce'
 00718722    call        @UStrEqual
>00718727    je          00718747
 00718729    mov         eax,dword ptr [ebp-4]
 0071872C    mov         edx,719F04;'ounces'
 00718731    call        @UStrEqual
>00718736    je          00718747
 00718738    mov         eax,dword ptr [ebp-4]
 0071873B    mov         edx,719F20;'oz'
 00718740    call        @UStrEqual
>00718745    jne         0071874B
 00718747    mov         bl,2D
>00718749    jmp         007187AB
 0071874B    mov         eax,dword ptr [ebp-4]
 0071874E    mov         edx,719F34;'kilogrammetre'
 00718753    call        @UStrEqual
>00718758    je          007187A5
 0071875A    mov         eax,dword ptr [ebp-4]
 0071875D    mov         edx,719F5C;'kilogrammeter'
 00718762    call        @UStrEqual
>00718767    je          007187A5
 00718769    mov         eax,dword ptr [ebp-4]
 0071876C    mov         edx,719F84;'kgmetre'
 00718771    call        @UStrEqual
>00718776    je          007187A5
 00718778    mov         eax,dword ptr [ebp-4]
 0071877B    mov         edx,719FA0;'kgmeter'
 00718780    call        @UStrEqual
>00718785    je          007187A5
 00718787    mov         eax,dword ptr [ebp-4]
 0071878A    mov         edx,719FBC;'kgm'
 0071878F    call        @UStrEqual
>00718794    je          007187A5
 00718796    mov         eax,dword ptr [ebp-4]
 00718799    mov         edx,719FD0;'kgms'
 0071879E    call        @UStrEqual
>007187A3    jne         007187A9
 007187A5    mov         bl,2E
>007187A7    jmp         007187AB
 007187A9    xor         ebx,ebx
 007187AB    xor         eax,eax
 007187AD    pop         edx
 007187AE    pop         ecx
 007187AF    pop         ecx
 007187B0    mov         dword ptr fs:[eax],edx
 007187B3    push        7187CD
 007187B8    lea         eax,[ebp-8]
 007187BB    mov         edx,2
 007187C0    call        @UStrArrayClr
 007187C5    ret
>007187C6    jmp         @HandleFinally
>007187CB    jmp         007187B8
 007187CD    mov         eax,ebx
 007187CF    pop         ebx
 007187D0    pop         ecx
 007187D1    pop         ecx
 007187D2    pop         ebp
 007187D3    ret
end;*}

//00719FDC
{*procedure sub_00719FDC(?:?; ?:?; ?:?; ?:?);
begin
 00719FDC    push        ebp
 00719FDD    mov         ebp,esp
 00719FDF    add         esp,0FFFFFFF8
 00719FE2    push        ebx
 00719FE3    push        esi
 00719FE4    push        edi
 00719FE5    xor         ebx,ebx
 00719FE7    mov         dword ptr [ebp-8],ebx
 00719FEA    mov         ebx,ecx
 00719FEC    mov         esi,edx
 00719FEE    mov         dword ptr [ebp-4],eax
 00719FF1    mov         edi,dword ptr [ebp+8]
 00719FF4    mov         eax,dword ptr [ebp-4]
 00719FF7    call        @UStrAddRef
 00719FFC    xor         eax,eax
 00719FFE    push        ebp
 00719FFF    push        71A1D4
 0071A004    push        dword ptr fs:[eax]
 0071A007    mov         dword ptr fs:[eax],esp
 0071A00A    lea         edx,[ebp-8]
 0071A00D    mov         eax,dword ptr [ebp-4]
 0071A010    call        LowerCase
 0071A015    mov         edx,dword ptr [ebp-8]
 0071A018    lea         eax,[ebp-4]
 0071A01B    call        @UStrLAsg
 0071A020    mov         byte ptr [esi],0
 0071A023    mov         byte ptr [ebx],0
 0071A026    mov         byte ptr [edi],0
 0071A029    mov         eax,dword ptr [ebp-4]
 0071A02C    mov         edx,71A1F0;'kph'
 0071A031    call        @UStrEqual
>0071A036    jne         0071A043
 0071A038    mov         byte ptr [esi],6
 0071A03B    mov         byte ptr [ebx],13
>0071A03E    jmp         0071A1B9
 0071A043    mov         eax,dword ptr [ebp-4]
 0071A046    mov         edx,71A204;'mph'
 0071A04B    call        @UStrEqual
>0071A050    jne         0071A05D
 0071A052    mov         byte ptr [esi],0A
 0071A055    mov         byte ptr [ebx],13
>0071A058    jmp         0071A1B9
 0071A05D    mov         eax,dword ptr [ebp-4]
 0071A060    mov         edx,71A218;'mps'
 0071A065    call        @UStrEqual
>0071A06A    jne         0071A077
 0071A06C    mov         byte ptr [esi],5
 0071A06F    mov         byte ptr [ebx],11
>0071A072    jmp         0071A1B9
 0071A077    mov         eax,dword ptr [ebp-4]
 0071A07A    mov         edx,71A22C;'mpsps'
 0071A07F    call        @UStrEqual
>0071A084    je          0071A095
 0071A086    mov         eax,dword ptr [ebp-4]
 0071A089    mov         edx,71A244;'mpss'
 0071A08E    call        @UStrEqual
>0071A093    jne         0071A0A3
 0071A095    mov         byte ptr [esi],5
 0071A098    mov         byte ptr [ebx],11
 0071A09B    mov         byte ptr [ebx],11
>0071A09E    jmp         0071A1B9
 0071A0A3    mov         eax,dword ptr [ebp-4]
 0071A0A6    mov         edx,71A25C;'rpm'
 0071A0AB    call        @UStrEqual
>0071A0B0    je          0071A0C1
 0071A0B2    mov         eax,dword ptr [ebp-4]
 0071A0B5    mov         edx,71A270;'rpms'
 0071A0BA    call        @UStrEqual
>0071A0BF    jne         0071A0CC
 0071A0C1    mov         byte ptr [esi],19
 0071A0C4    mov         byte ptr [ebx],12
>0071A0C7    jmp         0071A1B9
 0071A0CC    mov         eax,dword ptr [ebp-4]
 0071A0CF    mov         edx,71A288;'radps'
 0071A0D4    call        @UStrEqual
>0071A0D9    jne         0071A0E6
 0071A0DB    mov         byte ptr [esi],17
 0071A0DE    mov         byte ptr [ebx],11
>0071A0E1    jmp         0071A1B9
 0071A0E6    mov         eax,dword ptr [ebp-4]
 0071A0E9    mov         edx,71A2A0;'radpss'
 0071A0EE    call        @UStrEqual
>0071A0F3    jne         0071A103
 0071A0F5    mov         byte ptr [esi],17
 0071A0F8    mov         byte ptr [ebx],11
 0071A0FB    mov         byte ptr [ebx],11
>0071A0FE    jmp         0071A1B9
 0071A103    mov         eax,dword ptr [ebp-4]
 0071A106    mov         edx,71A2BC;'hz'
 0071A10B    call        @UStrEqual
>0071A110    je          0071A121
 0071A112    mov         eax,dword ptr [ebp-4]
 0071A115    mov         edx,71A2D0;'hertz'
 0071A11A    call        @UStrEqual
>0071A11F    jne         0071A129
 0071A121    mov         byte ptr [ebx],11
>0071A124    jmp         0071A1B9
 0071A129    mov         eax,dword ptr [ebp-4]
 0071A12C    mov         edx,71A2E8;'khz'
 0071A131    call        @UStrEqual
>0071A136    je          0071A147
 0071A138    mov         eax,dword ptr [ebp-4]
 0071A13B    mov         edx,71A2FC;'kilohertz'
 0071A140    call        @UStrEqual
>0071A145    jne         0071A14C
 0071A147    mov         byte ptr [ebx],10
>0071A14A    jmp         0071A1B9
 0071A14C    mov         eax,dword ptr [ebp-4]
 0071A14F    mov         edx,71A31C;'mhz'
 0071A154    call        @UStrEqual
>0071A159    je          0071A16A
 0071A15B    mov         eax,dword ptr [ebp-4]
 0071A15E    mov         edx,71A330;'megahertz'
 0071A163    call        @UStrEqual
>0071A168    jne         0071A16F
 0071A16A    mov         byte ptr [ebx],0F
>0071A16D    jmp         0071A1B9
 0071A16F    mov         eax,dword ptr [ebp-4]
 0071A172    mov         edx,71A350;'ghz'
 0071A177    call        @UStrEqual
>0071A17C    je          0071A18D
 0071A17E    mov         eax,dword ptr [ebp-4]
 0071A181    mov         edx,71A364;'gigahertz'
 0071A186    call        @UStrEqual
>0071A18B    jne         0071A192
 0071A18D    mov         byte ptr [ebx],0E
>0071A190    jmp         0071A1B9
 0071A192    mov         eax,dword ptr [ebp-4]
 0071A195    mov         edx,71A384;'newton'
 0071A19A    call        @UStrEqual
>0071A19F    je          0071A1B0
 0071A1A1    mov         eax,dword ptr [ebp-4]
 0071A1A4    mov         edx,71A3A0;'newtons'
 0071A1A9    call        @UStrEqual
>0071A1AE    jne         0071A1B9
 0071A1B0    mov         byte ptr [esi],2E
 0071A1B3    mov         byte ptr [ebx],11
 0071A1B6    mov         byte ptr [edi],11
 0071A1B9    xor         eax,eax
 0071A1BB    pop         edx
 0071A1BC    pop         ecx
 0071A1BD    pop         ecx
 0071A1BE    mov         dword ptr fs:[eax],edx
 0071A1C1    push        71A1DB
 0071A1C6    lea         eax,[ebp-8]
 0071A1C9    mov         edx,2
 0071A1CE    call        @UStrArrayClr
 0071A1D3    ret
>0071A1D4    jmp         @HandleFinally
>0071A1D9    jmp         0071A1C6
 0071A1DB    pop         edi
 0071A1DC    pop         esi
 0071A1DD    pop         ebx
 0071A1DE    pop         ecx
 0071A1DF    pop         ecx
 0071A1E0    pop         ebp
 0071A1E1    ret         4
end;*}

//0071A3B0
function TParser.ParseFactorWithUnits(CanHaveEquals:Boolean):TExpression;
begin
{*
 0071A3B0    push        ebx
 0071A3B1    push        esi
 0071A3B2    push        edi
 0071A3B3    push        ecx
 0071A3B4    mov         ebx,eax
 0071A3B6    mov         eax,ebx
 0071A3B8    call        TParser.ParseFactor
 0071A3BD    mov         esi,eax
 0071A3BF    mov         byte ptr [esp],0
 0071A3C3    mov         byte ptr [esp+1],0
 0071A3C8    mov         byte ptr [esp+2],0
 0071A3CD    mov         edi,dword ptr [ebx+4];TParser.s:TScanner
 0071A3D0    cmp         byte ptr [edi+8],5;TScanner.token:TToken
>0071A3D4    jne         0071A431
 0071A3D6    mov         eax,dword ptr [edi+0C]
 0071A3D9    call        00717A98
 0071A3DE    mov         byte ptr [esp],al
 0071A3E1    cmp         byte ptr [esp],0
>0071A3E5    jne         0071A3FF
 0071A3E7    lea         eax,[esp+2]
 0071A3EB    push        eax
 0071A3EC    lea         ecx,[esp+5]
 0071A3F0    lea         edx,[esp+4]
 0071A3F4    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071A3F7    mov         eax,dword ptr [eax+0C]
 0071A3FA    call        00719FDC
 0071A3FF    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071A402    call        TScanner.Next
 0071A407    cmp         byte ptr [esp],28
>0071A40B    jne         0071A431
 0071A40D    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071A410    cmp         byte ptr [eax+8],5;TScanner.token:TToken
>0071A414    jne         0071A431
 0071A416    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071A419    mov         eax,dword ptr [eax+0C]
 0071A41C    call        00717A98
 0071A421    cmp         al,5
>0071A423    jne         0071A431
 0071A425    mov         byte ptr [esp],2E
 0071A429    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071A42C    call        TScanner.Next
 0071A431    mov         dl,6A
 0071A433    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071A436    call        TScanner.read
 0071A43B    test        al,al
>0071A43D    je          0071A47E
 0071A43F    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071A442    cmp         byte ptr [eax+8],5;TScanner.token:TToken
>0071A446    je          0071A44F
 0071A448    mov         dl,5
 0071A44A    call        TScanner.expect
 0071A44F    cmp         byte ptr [esp+1],0
>0071A454    jne         0071A467
 0071A456    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071A459    mov         eax,dword ptr [eax+0C]
 0071A45C    call        00717A98
 0071A461    mov         byte ptr [esp+1],al
>0071A465    jmp         0071A476
 0071A467    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071A46A    mov         eax,dword ptr [eax+0C]
 0071A46D    call        00717A98
 0071A472    mov         byte ptr [esp+2],al
 0071A476    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071A479    call        TScanner.Next
 0071A47E    mov         dl,6A
 0071A480    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071A483    call        TScanner.read
 0071A488    test        al,al
>0071A48A    je          0071A4B3
 0071A48C    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071A48F    cmp         byte ptr [eax+8],5;TScanner.token:TToken
>0071A493    je          0071A49C
 0071A495    mov         dl,5
 0071A497    call        TScanner.expect
 0071A49C    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071A49F    mov         eax,dword ptr [eax+0C]
 0071A4A2    call        00717A98
 0071A4A7    mov         byte ptr [esp+2],al
 0071A4AB    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071A4AE    call        TScanner.Next
 0071A4B3    cmp         byte ptr [esp],0
>0071A4B7    jne         0071A4CB
 0071A4B9    cmp         byte ptr [esp+1],0
>0071A4BE    jne         0071A4CB
 0071A4C0    cmp         byte ptr [esp+2],0
>0071A4C5    jne         0071A4CB
 0071A4C7    mov         eax,esi
>0071A4C9    jmp         0071A4F1
 0071A4CB    mov         dl,1
 0071A4CD    mov         eax,[0068006C];TUnitsExpression
 0071A4D2    call        TObject.Create;TUnitsExpression.Create
 0071A4D7    mov         dword ptr [eax+18],esi;TUnitsExpression.expression:TExpression
 0071A4DA    movzx       edx,byte ptr [esp]
 0071A4DE    mov         byte ptr [eax+1C],dl;TUnitsExpression.Units:TUnits
 0071A4E1    movzx       edx,byte ptr [esp+1]
 0071A4E6    mov         byte ptr [eax+1D],dl;TUnitsExpression.PerUnits1:TUnits
 0071A4E9    movzx       edx,byte ptr [esp+2]
 0071A4EE    mov         byte ptr [eax+1E],dl;TUnitsExpression.PerUnits2:TUnits
 0071A4F1    pop         edx
 0071A4F2    pop         edi
 0071A4F3    pop         esi
 0071A4F4    pop         ebx
 0071A4F5    ret
*}
end;

//0071A4F8
function TParser.ParseSTermInUnits(CanHaveEquals:Boolean):TExpression;
begin
{*
 0071A4F8    push        ebp
 0071A4F9    mov         ebp,esp
 0071A4FB    add         esp,0FFFFFFF0
 0071A4FE    push        ebx
 0071A4FF    mov         dword ptr [ebp-4],eax
 0071A502    mov         ecx,edx
 0071A504    mov         eax,dword ptr [ebp-4]
 0071A507    xor         edx,edx
 0071A509    call        TParser.ParseSTerm
 0071A50E    mov         dword ptr [ebp-8],eax
 0071A511    mov         byte ptr [ebp-9],0
 0071A515    mov         byte ptr [ebp-0A],0
 0071A519    mov         byte ptr [ebp-0B],0
 0071A51D    mov         eax,dword ptr [ebp-4]
 0071A520    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A523    cmp         byte ptr [eax+8],5E;TScanner.token:TToken
>0071A527    je          0071A531
 0071A529    mov         ebx,dword ptr [ebp-8]
>0071A52C    jmp         0071A783
 0071A531    call        TScanner.Next
 0071A536    mov         eax,dword ptr [ebp-4]
 0071A539    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A53C    mov         dl,14
 0071A53E    call        TScanner.read
 0071A543    mov         ebx,eax
 0071A545    test        bl,bl
>0071A547    jne         0071A55E
 0071A549    mov         eax,dword ptr [ebp-4]
 0071A54C    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A54F    mov         dl,10
 0071A551    call        TScanner.read
 0071A556    test        al,al
>0071A558    je          0071A5F5
 0071A55E    mov         dl,1
 0071A560    mov         eax,[0066FAE8];TMathsFunction
 0071A565    call        TMathsFunction.Create;TMathsFunction.Create
 0071A56A    mov         dword ptr [ebp-10],eax
 0071A56D    xor         edx,edx
 0071A56F    push        ebp
 0071A570    push        71A5EE
 0071A575    push        dword ptr fs:[edx]
 0071A578    mov         dword ptr fs:[edx],esp
 0071A57B    mov         eax,dword ptr [ebp-10]
 0071A57E    mov         dword ptr [eax+1C],5F;TMathsFunction.FunctionNumber:Integer
 0071A585    mov         edx,dword ptr [ebp-8]
 0071A588    mov         eax,dword ptr [ebp-10]
 0071A58B    mov         eax,dword ptr [eax+18];TMathsFunction.Parameters:TObjectList
 0071A58E    call        TList.Add
 0071A593    mov         eax,dword ptr [ebp-10]
 0071A596    mov         edx,dword ptr [eax+18];TMathsFunction.Parameters:TObjectList
 0071A599    mov         eax,dword ptr [ebp-4]
 0071A59C    call        TParser.ParseParamListWithoutBrackets
 0071A5A1    test        bl,bl
>0071A5A3    je          0071A5B4
 0071A5A5    mov         eax,dword ptr [ebp-4]
 0071A5A8    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A5AB    mov         dl,15
 0071A5AD    call        TScanner.expect
>0071A5B2    jmp         0071A5C1
 0071A5B4    mov         eax,dword ptr [ebp-4]
 0071A5B7    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A5BA    mov         dl,11
 0071A5BC    call        TScanner.expect
 0071A5C1    mov         ebx,dword ptr [ebp-10]
 0071A5C4    xor         eax,eax
 0071A5C6    mov         dword ptr [ebp-10],eax
 0071A5C9    call        @TryFinallyExit
>0071A5CE    jmp         0071A783
 0071A5D3    xor         eax,eax
 0071A5D5    pop         edx
 0071A5D6    pop         ecx
 0071A5D7    pop         ecx
 0071A5D8    mov         dword ptr fs:[eax],edx
 0071A5DB    push        71A5F5
 0071A5E0    mov         eax,dword ptr [ebp-10]
 0071A5E3    xor         edx,edx
 0071A5E5    mov         dword ptr [ebp-10],edx
 0071A5E8    call        TObject.Free
 0071A5ED    ret
>0071A5EE    jmp         @HandleFinally
>0071A5F3    jmp         0071A5E0
 0071A5F5    mov         eax,dword ptr [ebp-4]
 0071A5F8    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A5FB    mov         dl,69
 0071A5FD    call        TScanner.read
 0071A602    mov         eax,dword ptr [ebp-4]
 0071A605    mov         edx,dword ptr [eax+4];TParser.s:TScanner
 0071A608    movzx       eax,byte ptr [edx+8];TScanner.token:TToken
 0071A60C    cmp         al,5
>0071A60E    je          0071A61D
 0071A610    cmp         al,6A
>0071A612    je          0071A61D
 0071A614    mov         eax,edx
 0071A616    mov         dl,5
 0071A618    call        TScanner.expect
 0071A61D    mov         eax,dword ptr [ebp-4]
 0071A620    mov         ebx,dword ptr [eax+4];TParser.s:TScanner
 0071A623    cmp         byte ptr [ebx+8],5;TScanner.token:TToken
>0071A627    jne         0071A690
 0071A629    mov         eax,dword ptr [ebx+0C]
 0071A62C    call        00717A98
 0071A631    mov         byte ptr [ebp-9],al
 0071A634    cmp         byte ptr [ebp-9],0
>0071A638    jne         0071A652
 0071A63A    lea         eax,[ebp-0B]
 0071A63D    push        eax
 0071A63E    lea         ecx,[ebp-0A]
 0071A641    lea         edx,[ebp-9]
 0071A644    mov         eax,dword ptr [ebp-4]
 0071A647    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A64A    mov         eax,dword ptr [eax+0C]
 0071A64D    call        00719FDC
 0071A652    mov         eax,dword ptr [ebp-4]
 0071A655    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A658    call        TScanner.Next
 0071A65D    cmp         byte ptr [ebp-9],28
>0071A661    jne         0071A690
 0071A663    mov         eax,dword ptr [ebp-4]
 0071A666    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A669    cmp         byte ptr [eax+8],5;TScanner.token:TToken
>0071A66D    jne         0071A690
 0071A66F    mov         eax,dword ptr [ebp-4]
 0071A672    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A675    mov         eax,dword ptr [eax+0C]
 0071A678    call        00717A98
 0071A67D    cmp         al,5
>0071A67F    jne         0071A690
 0071A681    mov         byte ptr [ebp-9],2E
 0071A685    mov         eax,dword ptr [ebp-4]
 0071A688    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A68B    call        TScanner.Next
 0071A690    mov         eax,dword ptr [ebp-4]
 0071A693    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A696    mov         dl,6A
 0071A698    call        TScanner.read
 0071A69D    test        al,al
>0071A69F    je          0071A6F6
 0071A6A1    mov         eax,dword ptr [ebp-4]
 0071A6A4    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A6A7    mov         dl,69
 0071A6A9    call        TScanner.read
 0071A6AE    mov         eax,dword ptr [ebp-4]
 0071A6B1    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A6B4    cmp         byte ptr [eax+8],5;TScanner.token:TToken
>0071A6B8    je          0071A6C1
 0071A6BA    mov         dl,5
 0071A6BC    call        TScanner.expect
 0071A6C1    cmp         byte ptr [ebp-0A],0
>0071A6C5    jne         0071A6DA
 0071A6C7    mov         eax,dword ptr [ebp-4]
 0071A6CA    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A6CD    mov         eax,dword ptr [eax+0C]
 0071A6D0    call        00717A98
 0071A6D5    mov         byte ptr [ebp-0A],al
>0071A6D8    jmp         0071A6EB
 0071A6DA    mov         eax,dword ptr [ebp-4]
 0071A6DD    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A6E0    mov         eax,dword ptr [eax+0C]
 0071A6E3    call        00717A98
 0071A6E8    mov         byte ptr [ebp-0B],al
 0071A6EB    mov         eax,dword ptr [ebp-4]
 0071A6EE    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A6F1    call        TScanner.Next
 0071A6F6    mov         eax,dword ptr [ebp-4]
 0071A6F9    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A6FC    mov         dl,6A
 0071A6FE    call        TScanner.read
 0071A703    test        al,al
>0071A705    je          0071A743
 0071A707    mov         eax,dword ptr [ebp-4]
 0071A70A    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A70D    mov         dl,69
 0071A70F    call        TScanner.read
 0071A714    mov         eax,dword ptr [ebp-4]
 0071A717    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A71A    cmp         byte ptr [eax+8],5;TScanner.token:TToken
>0071A71E    je          0071A727
 0071A720    mov         dl,5
 0071A722    call        TScanner.expect
 0071A727    mov         eax,dword ptr [ebp-4]
 0071A72A    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A72D    mov         eax,dword ptr [eax+0C]
 0071A730    call        00717A98
 0071A735    mov         byte ptr [ebp-0B],al
 0071A738    mov         eax,dword ptr [ebp-4]
 0071A73B    mov         eax,dword ptr [eax+4];TParser.s:TScanner
 0071A73E    call        TScanner.Next
 0071A743    cmp         byte ptr [ebp-9],0
>0071A747    jne         0071A75A
 0071A749    cmp         byte ptr [ebp-0A],0
>0071A74D    jne         0071A75A
 0071A74F    cmp         byte ptr [ebp-0B],0
>0071A753    jne         0071A75A
 0071A755    mov         ebx,dword ptr [ebp-8]
>0071A758    jmp         0071A783
 0071A75A    mov         dl,1
 0071A75C    mov         eax,[00680494];TInUnitsExpression
 0071A761    call        TObject.Create;TInUnitsExpression.Create
 0071A766    mov         edx,dword ptr [ebp-8]
 0071A769    mov         dword ptr [eax+18],edx;TInUnitsExpression.expression:TExpression
 0071A76C    movzx       edx,byte ptr [ebp-9]
 0071A770    mov         byte ptr [eax+1C],dl;TInUnitsExpression.Units:TUnits
 0071A773    movzx       edx,byte ptr [ebp-0A]
 0071A777    mov         byte ptr [eax+1D],dl;TInUnitsExpression.PerUnits1:TUnits
 0071A77A    movzx       edx,byte ptr [ebp-0B]
 0071A77E    mov         byte ptr [eax+1E],dl;TInUnitsExpression.PerUnits2:TUnits
 0071A781    mov         ebx,eax
 0071A783    mov         eax,ebx
 0071A785    pop         ebx
 0071A786    mov         esp,ebp
 0071A788    pop         ebp
 0071A789    ret
*}
end;

//0071A78C
function TParser.ParseExpressionSequence(CanHaveEquals:Boolean):TExpression;
begin
{*
 0071A78C    push        ebx
 0071A78D    push        esi
 0071A78E    push        edi
 0071A78F    push        ebp
 0071A790    push        ecx
 0071A791    mov         ebx,edx
 0071A793    mov         ebp,eax
 0071A795    mov         edx,ebx
 0071A797    mov         eax,ebp
 0071A799    call        TParser.ParseExpression
 0071A79E    mov         dword ptr [esp],eax
 0071A7A1    mov         dl,16
 0071A7A3    mov         eax,dword ptr [ebp+4];TParser.s:TScanner
 0071A7A6    call        TScanner.read
 0071A7AB    test        al,al
>0071A7AD    je          0071A825
 0071A7AF    mov         edx,ebx
 0071A7B1    mov         eax,ebp
 0071A7B3    call        TParser.ParseExpression
 0071A7B8    mov         esi,eax
 0071A7BA    mov         dl,1
 0071A7BC    mov         eax,[00681B30];TSequenceExpression
 0071A7C1    call        TObject.Create;TSequenceExpression.Create
 0071A7C6    mov         edi,eax
 0071A7C8    mov         cl,1
 0071A7CA    mov         dl,1
 0071A7CC    mov         eax,[00471630];TObjectList
 0071A7D1    call        TObjectList.Create;TObjectList.Create
 0071A7D6    mov         dword ptr [edi+20],eax;TSequenceExpression.Expressions:TObjectList
 0071A7D9    mov         edx,dword ptr [esp]
 0071A7DC    mov         eax,dword ptr [edi+20];TSequenceExpression.Expressions:TObjectList
 0071A7DF    call        TList.Add
 0071A7E4    mov         edx,esi
 0071A7E6    mov         eax,dword ptr [edi+20];TSequenceExpression.Expressions:TObjectList
 0071A7E9    call        TList.Add
>0071A7EE    jmp         0071A805
 0071A7F0    mov         edx,ebx
 0071A7F2    mov         eax,ebp
 0071A7F4    call        TParser.ParseExpression
 0071A7F9    mov         esi,eax
 0071A7FB    mov         edx,esi
 0071A7FD    mov         eax,dword ptr [edi+20];TSequenceExpression.Expressions:TObjectList
 0071A800    call        TList.Add
 0071A805    mov         dl,16
 0071A807    mov         eax,dword ptr [ebp+4];TParser.s:TScanner
 0071A80A    call        TScanner.read
 0071A80F    test        al,al
>0071A811    jne         0071A7F0
 0071A813    mov         dword ptr [esp],edi
 0071A816    mov         eax,[0078D418];^gvar_0081ECE0:TObjectList
 0071A81B    mov         eax,dword ptr [eax]
 0071A81D    mov         edx,dword ptr [esp]
 0071A820    call        TList.Add
 0071A825    mov         eax,dword ptr [esp]
 0071A828    pop         edx
 0071A829    pop         ebp
 0071A82A    pop         edi
 0071A82B    pop         esi
 0071A82C    pop         ebx
 0071A82D    ret
*}
end;

//0071A830
function TParser.ParseForLoop(AlreadyReadFor:Boolean):TStatement;
begin
{*
 0071A830    push        ebx
 0071A831    push        esi
 0071A832    push        edi
 0071A833    push        ebp
 0071A834    add         esp,0FFFFFFE8
 0071A837    mov         edi,eax
 0071A839    test        dl,dl
>0071A83B    jne         0071A847
 0071A83D    mov         dl,65
 0071A83F    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071A842    call        TScanner.expect
 0071A847    mov         ebx,dword ptr [edi+4];TParser.s:TScanner
 0071A84A    movzx       eax,byte ptr [ebx+8];TScanner.token:TToken
 0071A84E    cmp         al,10
 0071A850    sete        byte ptr [esp+0C]
 0071A855    cmp         byte ptr [esp+0C],0
>0071A85A    je          0071A918
 0071A860    mov         dl,10
 0071A862    mov         eax,ebx
 0071A864    call        TScanner.expect
 0071A869    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071A86C    cmp         byte ptr [eax+8],17;TScanner.token:TToken
>0071A870    jne         0071A882
 0071A872    mov         dl,1
 0071A874    mov         eax,[00679B20];TNullStatement
 0071A879    call        TObject.Create;TNullStatement.Create
 0071A87E    mov         ebx,eax
>0071A880    jmp         0071A88B
 0071A882    mov         eax,edi
 0071A884    call        TParser.ParseStatement
 0071A889    mov         ebx,eax
 0071A88B    mov         dl,17
 0071A88D    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071A890    call        TScanner.expect
 0071A895    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071A898    cmp         byte ptr [eax+8],17;TScanner.token:TToken
>0071A89C    jne         0071A8B3
 0071A89E    mov         ecx,71AC38;'true'
 0071A8A3    mov         dl,1
 0071A8A5    mov         eax,[006808C0];TConstant
 0071A8AA    call        TConstant.Create;TConstant.Create
 0071A8AF    mov         ebp,eax
>0071A8B1    jmp         0071A8BE
 0071A8B3    mov         dl,1
 0071A8B5    mov         eax,edi
 0071A8B7    call        TParser.ParseExpressionSequence
 0071A8BC    mov         ebp,eax
 0071A8BE    mov         dl,17
 0071A8C0    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071A8C3    call        TScanner.expect
 0071A8C8    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071A8CB    cmp         byte ptr [eax+8],17;TScanner.token:TToken
>0071A8CF    jne         0071A8E3
 0071A8D1    mov         dl,1
 0071A8D3    mov         eax,[00679B20];TNullStatement
 0071A8D8    call        TObject.Create;TNullStatement.Create
 0071A8DD    mov         dword ptr [esp+8],eax
>0071A8E1    jmp         0071A8EE
 0071A8E3    mov         eax,edi
 0071A8E5    call        TParser.ParseStatement
 0071A8EA    mov         dword ptr [esp+8],eax
 0071A8EE    mov         dl,11
 0071A8F0    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071A8F3    call        TScanner.expect
 0071A8F8    mov         dl,1
 0071A8FA    mov         eax,[0067A838];TForLoop
 0071A8FF    call        TObject.Create;TForLoop.Create
 0071A904    mov         esi,eax
 0071A906    mov         dword ptr [esi+10],ebx;TForLoop.Initial:TStatement
 0071A909    mov         dword ptr [esi+14],ebp;TForLoop.Condition:TExpression
 0071A90C    mov         eax,dword ptr [esp+8]
 0071A910    mov         dword ptr [esi+18],eax;TForLoop.Increment:TStatement
>0071A913    jmp         0071AB56
 0071A918    xor         edx,edx
 0071A91A    mov         dword ptr [esp+10],edx
 0071A91E    mov         dword ptr [esp+14],3FF00000
 0071A926    cmp         al,3
>0071A928    jne         0071A988
 0071A92A    mov         eax,dword ptr [ebx+0C]
 0071A92D    mov         edx,71AC50;'i'
 0071A932    call        @UStrEqual
>0071A937    jne         0071A948
 0071A939    lea         eax,[ebx+0C]
 0071A93C    mov         edx,71AC60;'var.i'
 0071A941    call        @UStrAsg
>0071A946    jmp         0071A988
 0071A948    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071A94B    mov         eax,dword ptr [eax+0C]
 0071A94E    mov         edx,71AC78;'j'
 0071A953    call        @UStrEqual
>0071A958    jne         0071A969
 0071A95A    lea         eax,[ebx+0C]
 0071A95D    mov         edx,71AC88;'var.j'
 0071A962    call        @UStrAsg
>0071A967    jmp         0071A988
 0071A969    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071A96C    mov         eax,dword ptr [eax+0C]
 0071A96F    mov         edx,71ACA0;'k'
 0071A974    call        @UStrEqual
>0071A979    jne         0071A988
 0071A97B    lea         eax,[ebx+0C]
 0071A97E    mov         edx,71ACB0;'var.k'
 0071A983    call        @UStrAsg
 0071A988    mov         dl,1
 0071A98A    mov         eax,edi
 0071A98C    call        TParser.ParseFactor
 0071A991    mov         ebp,eax
 0071A993    mov         dl,38
 0071A995    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071A998    call        TScanner.read
 0071A99D    test        al,al
>0071A99F    jne         0071A9B9
 0071A9A1    mov         dl,4B
 0071A9A3    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071A9A6    call        TScanner.read
 0071A9AB    test        al,al
>0071A9AD    jne         0071A9B9
 0071A9AF    mov         dl,4B
 0071A9B1    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071A9B4    call        TScanner.expect
 0071A9B9    mov         dl,1
 0071A9BB    mov         eax,edi
 0071A9BD    call        TParser.ParseExpression
 0071A9C2    mov         dword ptr [esp],eax
 0071A9C5    mov         edx,71ACC8;'down'
 0071A9CA    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071A9CD    call        TScanner.ReadIdentifier
 0071A9D2    test        al,al
>0071A9D4    jne         0071A9E7
 0071A9D6    mov         edx,71ACE0;'unten'
 0071A9DB    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071A9DE    call        TScanner.ReadIdentifier
 0071A9E3    test        al,al
>0071A9E5    je          0071AA03
 0071A9E7    mov         bl,1
 0071A9E9    mov         dl,68
 0071A9EB    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071A9EE    call        TScanner.read
 0071A9F3    test        al,al
>0071A9F5    jne         0071AA32
 0071A9F7    mov         dl,5A
 0071A9F9    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071A9FC    call        TScanner.expect
>0071AA01    jmp         0071AA32
 0071AA03    mov         edx,71ACF8;'downto'
 0071AA08    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071AA0B    call        TScanner.ReadIdentifier
 0071AA10    test        al,al
>0071AA12    je          0071AA18
 0071AA14    mov         bl,1
>0071AA16    jmp         0071AA32
 0071AA18    xor         ebx,ebx
 0071AA1A    mov         dl,68
 0071AA1C    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071AA1F    call        TScanner.read
 0071AA24    test        al,al
>0071AA26    jne         0071AA32
 0071AA28    mov         dl,5A
 0071AA2A    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071AA2D    call        TScanner.expect
 0071AA32    mov         dl,1
 0071AA34    mov         eax,edi
 0071AA36    call        TParser.ParseExpression
 0071AA3B    mov         dword ptr [esp+4],eax
 0071AA3F    mov         edx,71AD14;'step'
 0071AA44    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071AA47    call        TScanner.ReadIdentifier
 0071AA4C    test        al,al
>0071AA4E    je          0071AA7B
 0071AA50    mov         dl,1
 0071AA52    mov         eax,edi
 0071AA54    call        TParser.ParseDouble
 0071AA59    fstp        qword ptr [esp+10]
 0071AA5D    wait
 0071AA5E    fld         qword ptr [esp+10]
 0071AA62    fcomp       dword ptr ds:[71AD20];0:Single
 0071AA68    wait
 0071AA69    fnstsw      al
 0071AA6B    sahf
>0071AA6C    jae         0071AA7B
 0071AA6E    mov         bl,1
 0071AA70    fld         qword ptr [esp+10]
 0071AA74    fchs
 0071AA76    fstp        qword ptr [esp+10]
 0071AA7A    wait
 0071AA7B    mov         dl,1
 0071AA7D    mov         eax,[0067A838];TForLoop
 0071AA82    call        TObject.Create;TForLoop.Create
 0071AA87    mov         esi,eax
 0071AA89    mov         dl,1
 0071AA8B    mov         eax,[0067A238];TAssignment
 0071AA90    call        TObject.Create;TAssignment.Create
 0071AA95    mov         dword ptr [esi+10],eax;TForLoop.Initial:TStatement
 0071AA98    mov         eax,dword ptr [esi+10];TForLoop.Initial:TStatement
 0071AA9B    mov         dword ptr [eax+10],ebp
 0071AA9E    mov         eax,dword ptr [esi+10];TForLoop.Initial:TStatement
 0071AAA1    mov         edx,dword ptr [esp]
 0071AAA4    mov         dword ptr [eax+14],edx
 0071AAA7    mov         dl,1
 0071AAA9    mov         eax,[00680DF8];TBinaryOp
 0071AAAE    call        TObject.Create;TBinaryOp.Create
 0071AAB3    mov         dword ptr [esi+14],eax;TForLoop.Condition:TExpression
 0071AAB6    mov         eax,ebp
 0071AAB8    call        TExpression.Clone
 0071AABD    mov         edx,dword ptr [esi+14];TForLoop.Condition:TExpression
 0071AAC0    mov         dword ptr [edx+18],eax
 0071AAC3    mov         eax,dword ptr [esi+14];TForLoop.Condition:TExpression
 0071AAC6    mov         edx,dword ptr [esp+4]
 0071AACA    mov         dword ptr [eax+1C],edx
 0071AACD    test        bl,bl
>0071AACF    je          0071AADA
 0071AAD1    mov         eax,dword ptr [esi+14];TForLoop.Condition:TExpression
 0071AAD4    mov         byte ptr [eax+20],15
>0071AAD8    jmp         0071AAE1
 0071AADA    mov         eax,dword ptr [esi+14];TForLoop.Condition:TExpression
 0071AADD    mov         byte ptr [eax+20],13
 0071AAE1    mov         dl,1
 0071AAE3    mov         eax,[0067A238];TAssignment
 0071AAE8    call        TObject.Create;TAssignment.Create
 0071AAED    mov         dword ptr [esi+18],eax;TForLoop.Increment:TStatement
 0071AAF0    mov         eax,ebp
 0071AAF2    call        TExpression.Clone
 0071AAF7    mov         edx,dword ptr [esi+18];TForLoop.Increment:TStatement
 0071AAFA    mov         dword ptr [edx+10],eax
 0071AAFD    mov         dl,1
 0071AAFF    mov         eax,[00680DF8];TBinaryOp
 0071AB04    call        TObject.Create;TBinaryOp.Create
 0071AB09    mov         edx,dword ptr [esi+18];TForLoop.Increment:TStatement
 0071AB0C    mov         dword ptr [edx+14],eax
 0071AB0F    mov         eax,ebp
 0071AB11    call        TExpression.Clone
 0071AB16    mov         edx,dword ptr [esi+18];TForLoop.Increment:TStatement
 0071AB19    mov         edx,dword ptr [edx+14]
 0071AB1C    mov         dword ptr [edx+18],eax
 0071AB1F    test        bl,bl
>0071AB21    je          0071AB2F
 0071AB23    mov         eax,dword ptr [esi+18];TForLoop.Increment:TStatement
 0071AB26    mov         eax,dword ptr [eax+14]
 0071AB29    mov         byte ptr [eax+20],1
>0071AB2D    jmp         0071AB39
 0071AB2F    mov         eax,dword ptr [esi+18];TForLoop.Increment:TStatement
 0071AB32    mov         eax,dword ptr [eax+14]
 0071AB35    mov         byte ptr [eax+20],0
 0071AB39    push        dword ptr [esp+14]
 0071AB3D    push        dword ptr [esp+14]
 0071AB41    mov         dl,1
 0071AB43    mov         eax,[006808C0];TConstant
 0071AB48    call        TConstant.Create;TConstant.Create
 0071AB4D    mov         edx,dword ptr [esi+18];TForLoop.Increment:TStatement
 0071AB50    mov         edx,dword ptr [edx+14]
 0071AB53    mov         dword ptr [edx+1C],eax
 0071AB56    mov         edx,71AD30;'do'
 0071AB5B    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071AB5E    call        TScanner.ReadIdentifier
 0071AB63    test        al,al
>0071AB65    jne         0071AB79
 0071AB67    mov         dl,59
 0071AB69    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071AB6C    call        TScanner.read
 0071AB71    test        al,al
>0071AB73    jne         0071AB79
 0071AB75    xor         eax,eax
>0071AB77    jmp         0071AB7B
 0071AB79    mov         al,1
 0071AB7B    mov         byte ptr [esp+0D],al
 0071AB7F    mov         edx,71AD44;'begin'
 0071AB84    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071AB87    call        TScanner.ReadIdentifier
 0071AB8C    test        al,al
>0071AB8E    jne         0071ABA5
 0071AB90    mov         edx,71AD5C;'anfangen'
 0071AB95    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071AB98    call        TScanner.ReadIdentifier
 0071AB9D    test        al,al
>0071AB9F    jne         0071ABA5
 0071ABA1    xor         ebx,ebx
>0071ABA3    jmp         0071ABA7
 0071ABA5    mov         bl,1
 0071ABA7    mov         dl,14
 0071ABA9    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071ABAC    call        TScanner.read
 0071ABB1    or          bl,al
 0071ABB3    test        bl,bl
>0071ABB5    jne         0071ABC4
 0071ABB7    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071ABBA    cmp         byte ptr [eax+8],6C;TScanner.token:TToken
>0071ABBE    je          0071ABC4
 0071ABC0    xor         eax,eax
>0071ABC2    jmp         0071ABC6
 0071ABC4    mov         al,1
 0071ABC6    mov         ebx,eax
 0071ABC8    test        bl,bl
>0071ABCA    je          0071ABF4
 0071ABCC    mov         dl,6C
 0071ABCE    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071ABD1    call        TScanner.expect
 0071ABD6    mov         eax,edi
 0071ABD8    call        TParser.ParseCodeBlock
 0071ABDD    mov         ebx,eax
 0071ABDF    mov         dword ptr [esi+1C],ebx;TForLoop.LoopCode:TStatement
 0071ABE2    mov         eax,ebx
 0071ABE4    mov         edx,dword ptr ds:[67A404];TCodeBlock
 0071ABEA    call        @AsClass
 0071ABEF    mov         dword ptr [eax+18],esi;TCodeBlock.ForLoop:TForLoop
>0071ABF2    jmp         0071AC22
 0071ABF4    cmp         byte ptr [esp+0C],0
>0071ABF9    jne         0071AC18
 0071ABFB    cmp         byte ptr [esp+0D],0
>0071AC00    jne         0071AC18
 0071AC02    mov         ecx,71AD7C;'"DO" expected. eg. "FOR var.i = 1 TO 5 DO command"'
 0071AC07    mov         dl,1
 0071AC09    mov         eax,[00577004];ETokenExpected
 0071AC0E    call        Exception.Create;ETokenExpected.Create
 0071AC13    call        @RaiseExcept
 0071AC18    mov         eax,edi
 0071AC1A    call        TParser.ParseStatement
 0071AC1F    mov         dword ptr [esi+1C],eax;TForLoop.LoopCode:TStatement
 0071AC22    mov         eax,esi
 0071AC24    add         esp,18
 0071AC27    pop         ebp
 0071AC28    pop         edi
 0071AC29    pop         esi
 0071AC2A    pop         ebx
 0071AC2B    ret
*}
end;

//0071ADE4
function TParser.ParseDouble(CanHaveEquals:Boolean):Double;
begin
{*
 0071ADE4    push        ebp
 0071ADE5    mov         ebp,esp
 0071ADE7    add         esp,0FFFFFFF0
 0071ADEA    push        ebx
 0071ADEB    push        esi
 0071ADEC    xor         ecx,ecx
 0071ADEE    mov         dword ptr [ebp-0C],ecx
 0071ADF1    mov         dword ptr [ebp-10],ecx
 0071ADF4    mov         ebx,eax
 0071ADF6    xor         eax,eax
 0071ADF8    push        ebp
 0071ADF9    push        71AF1F
 0071ADFE    push        dword ptr fs:[eax]
 0071AE01    mov         dword ptr fs:[eax],esp
 0071AE04    mov         esi,dword ptr [ebx+4];TParser.s:TScanner
 0071AE07    movzx       eax,byte ptr [esi+8];TScanner.token:TToken
 0071AE0B    add         eax,0FFFFFFF8
 0071AE0E    cmp         eax,1B
>0071AE11    ja          0071AED5
 0071AE17    movzx       eax,byte ptr [eax+71AE25]
 0071AE1E    jmp         dword ptr [eax*4+71AE41]
 0071AE1E    db          1
 0071AE1E    db          1
 0071AE1E    db          1
 0071AE1E    db          2
 0071AE1E    db          3
 0071AE1E    db          4
 0071AE1E    db          5
 0071AE1E    db          0
 0071AE1E    db          0
 0071AE1E    db          0
 0071AE1E    db          0
 0071AE1E    db          0
 0071AE1E    db          0
 0071AE1E    db          0
 0071AE1E    db          0
 0071AE1E    db          0
 0071AE1E    db          0
 0071AE1E    db          0
 0071AE1E    db          0
 0071AE1E    db          0
 0071AE1E    db          0
 0071AE1E    db          0
 0071AE1E    db          0
 0071AE1E    db          0
 0071AE1E    db          0
 0071AE1E    db          0
 0071AE1E    db          0
 0071AE1E    db          6
 0071AE1E    dd          0071AED5
 0071AE1E    dd          0071AE5D
 0071AE1E    dd          0071AE75
 0071AE1E    dd          0071AE8A
 0071AE1E    dd          0071AE9B
 0071AE1E    dd          0071AEAC
 0071AE1E    dd          0071AEBD
 0071AE5D    mov         eax,dword ptr [esi+18]
 0071AE60    mov         dword ptr [ebp-8],eax
 0071AE63    mov         eax,dword ptr [esi+1C]
 0071AE66    mov         dword ptr [ebp-4],eax
 0071AE69    mov         eax,esi
 0071AE6B    call        TScanner.Next
>0071AE70    jmp         0071AF04
 0071AE75    xor         eax,eax
 0071AE77    mov         dword ptr [ebp-8],eax
 0071AE7A    mov         dword ptr [ebp-4],3FF00000
 0071AE81    mov         eax,esi
 0071AE83    call        TScanner.Next
>0071AE88    jmp         0071AF04
 0071AE8A    xor         eax,eax
 0071AE8C    mov         dword ptr [ebp-8],eax
 0071AE8F    mov         dword ptr [ebp-4],eax
 0071AE92    mov         eax,esi
 0071AE94    call        TScanner.Next
>0071AE99    jmp         0071AF04
 0071AE9B    xor         eax,eax
 0071AE9D    mov         dword ptr [ebp-8],eax
 0071AEA0    mov         dword ptr [ebp-4],eax
 0071AEA3    mov         eax,esi
 0071AEA5    call        TScanner.Next
>0071AEAA    jmp         0071AF04
 0071AEAC    xor         eax,eax
 0071AEAE    mov         dword ptr [ebp-8],eax
 0071AEB1    mov         dword ptr [ebp-4],eax
 0071AEB4    mov         eax,esi
 0071AEB6    call        TScanner.Next
>0071AEBB    jmp         0071AF04
 0071AEBD    mov         eax,esi
 0071AEBF    call        TScanner.Next
 0071AEC4    mov         dl,1
 0071AEC6    mov         eax,ebx
 0071AEC8    call        TParser.ParseDouble
 0071AECD    fchs
 0071AECF    fstp        qword ptr [ebp-8]
 0071AED2    wait
>0071AED3    jmp         0071AF04
 0071AED5    lea         edx,[ebp-10]
 0071AED8    lea         eax,[esi+8];TScanner.token:TToken
 0071AEDB    call        0057F00C
 0071AEE0    mov         ecx,dword ptr [ebp-10]
 0071AEE3    lea         eax,[ebp-0C]
 0071AEE6    mov         edx,71AF3C;'Numerical value expected, instead of '
 0071AEEB    call        @UStrCat3
 0071AEF0    mov         ecx,dword ptr [ebp-0C]
 0071AEF3    mov         dl,1
 0071AEF5    mov         eax,[00577004];ETokenExpected
 0071AEFA    call        Exception.Create;ETokenExpected.Create
 0071AEFF    call        @RaiseExcept
 0071AF04    xor         eax,eax
 0071AF06    pop         edx
 0071AF07    pop         ecx
 0071AF08    pop         ecx
 0071AF09    mov         dword ptr fs:[eax],edx
 0071AF0C    push        71AF26
 0071AF11    lea         eax,[ebp-10]
 0071AF14    mov         edx,2
 0071AF19    call        @UStrArrayClr
 0071AF1E    ret
>0071AF1F    jmp         @HandleFinally
>0071AF24    jmp         0071AF11
 0071AF26    fld         qword ptr [ebp-8]
 0071AF29    pop         esi
 0071AF2A    pop         ebx
 0071AF2B    mov         esp,ebp
 0071AF2D    pop         ebp
 0071AF2E    ret
*}
end;

//0071AF88
function TParser.ParseWhileLoop(AlreadyReadWhile:Boolean):TStatement;
begin
{*
 0071AF88    push        ebx
 0071AF89    push        esi
 0071AF8A    push        edi
 0071AF8B    push        ecx
 0071AF8C    mov         edi,eax
 0071AF8E    test        dl,dl
>0071AF90    jne         0071AF9C
 0071AF92    mov         dl,64
 0071AF94    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071AF97    call        TScanner.expect
 0071AF9C    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071AF9F    cmp         byte ptr [eax+8],10;TScanner.token:TToken
 0071AFA3    sete        byte ptr [esp]
 0071AFA7    mov         dl,1
 0071AFA9    mov         eax,[0067A838];TForLoop
 0071AFAE    call        TObject.Create;TForLoop.Create
 0071AFB3    mov         esi,eax
 0071AFB5    mov         dl,1
 0071AFB7    mov         eax,[00679B20];TNullStatement
 0071AFBC    call        TObject.Create;TNullStatement.Create
 0071AFC1    mov         dword ptr [esi+10],eax;TForLoop.Initial:TStatement
 0071AFC4    mov         dl,1
 0071AFC6    mov         eax,[00679B20];TNullStatement
 0071AFCB    call        TObject.Create;TNullStatement.Create
 0071AFD0    mov         dword ptr [esi+18],eax;TForLoop.Increment:TStatement
 0071AFD3    mov         dl,1
 0071AFD5    mov         eax,edi
 0071AFD7    call        TParser.ParseExpressionSequence
 0071AFDC    mov         dword ptr [esi+14],eax;TForLoop.Condition:TExpression
 0071AFDF    mov         edx,71B0C0;'do'
 0071AFE4    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071AFE7    call        TScanner.ReadIdentifier
 0071AFEC    test        al,al
>0071AFEE    jne         0071B002
 0071AFF0    mov         dl,59
 0071AFF2    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071AFF5    call        TScanner.read
 0071AFFA    test        al,al
>0071AFFC    jne         0071B002
 0071AFFE    xor         eax,eax
>0071B000    jmp         0071B004
 0071B002    mov         al,1
 0071B004    mov         byte ptr [esp+1],al
 0071B008    mov         edx,71B0D4;'begin'
 0071B00D    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071B010    call        TScanner.ReadIdentifier
 0071B015    test        al,al
>0071B017    jne         0071B02E
 0071B019    mov         edx,71B0EC;'anfangen'
 0071B01E    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071B021    call        TScanner.ReadIdentifier
 0071B026    test        al,al
>0071B028    jne         0071B02E
 0071B02A    xor         ebx,ebx
>0071B02C    jmp         0071B030
 0071B02E    mov         bl,1
 0071B030    mov         dl,14
 0071B032    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071B035    call        TScanner.read
 0071B03A    or          bl,al
 0071B03C    test        bl,bl
>0071B03E    jne         0071B04D
 0071B040    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071B043    cmp         byte ptr [eax+8],6C;TScanner.token:TToken
>0071B047    je          0071B04D
 0071B049    xor         eax,eax
>0071B04B    jmp         0071B04F
 0071B04D    mov         al,1
 0071B04F    mov         ebx,eax
 0071B051    test        bl,bl
>0071B053    je          0071B07D
 0071B055    mov         dl,6C
 0071B057    mov         eax,dword ptr [edi+4];TParser.s:TScanner
 0071B05A    call        TScanner.expect
 0071B05F    mov         eax,edi
 0071B061    call        TParser.ParseCodeBlock
 0071B066    mov         ebx,eax
 0071B068    mov         dword ptr [esi+1C],ebx;TForLoop.LoopCode:TStatement
 0071B06B    mov         eax,ebx
 0071B06D    mov         edx,dword ptr ds:[67A404];TCodeBlock
 0071B073    call        @AsClass
 0071B078    mov         dword ptr [eax+18],esi;TCodeBlock.ForLoop:TForLoop
>0071B07B    jmp         0071B0AA
 0071B07D    cmp         byte ptr [esp],0
>0071B081    jne         0071B0A0
 0071B083    cmp         byte ptr [esp+1],0
>0071B088    jne         0071B0A0
 0071B08A    mov         ecx,71B10C;'"DO" or brackets expected. eg. "WHILE condition DO command" or "WHILE (condi...
 0071B08F    mov         dl,1
 0071B091    mov         eax,[00577004];ETokenExpected
 0071B096    call        Exception.Create;ETokenExpected.Create
 0071B09B    call        @RaiseExcept
 0071B0A0    mov         eax,edi
 0071B0A2    call        TParser.ParseStatement
 0071B0A7    mov         dword ptr [esi+1C],eax;TForLoop.LoopCode:TStatement
 0071B0AA    mov         eax,esi
 0071B0AC    pop         edx
 0071B0AD    pop         edi
 0071B0AE    pop         esi
 0071B0AF    pop         ebx
 0071B0B0    ret
*}
end;

//0071B1C4
function TParser.ParseVector:TExpression;
begin
{*
 0071B1C4    push        ebx
 0071B1C5    push        esi
 0071B1C6    push        edi
 0071B1C7    push        ebp
 0071B1C8    push        ecx
 0071B1C9    mov         ebx,eax
 0071B1CB    mov         dl,12
 0071B1CD    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071B1D0    call        TScanner.expect
 0071B1D5    mov         dl,1
 0071B1D7    mov         eax,ebx
 0071B1D9    call        TParser.ParseExpression
 0071B1DE    mov         edi,eax
 0071B1E0    mov         dl,16
 0071B1E2    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071B1E5    call        TScanner.expect
 0071B1EA    mov         dl,1
 0071B1EC    mov         eax,ebx
 0071B1EE    call        TParser.ParseExpression
 0071B1F3    mov         ebp,eax
 0071B1F5    mov         dl,16
 0071B1F7    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071B1FA    call        TScanner.read
 0071B1FF    test        al,al
>0071B201    jne         0071B223
 0071B203    mov         dl,1
 0071B205    mov         eax,[00681F10];TVectorExpression
 0071B20A    call        TObject.Create;TVectorExpression.Create
 0071B20F    mov         esi,eax
 0071B211    mov         eax,esi
 0071B213    mov         dword ptr [eax+18],edi;TVectorExpression.x:TExpression
 0071B216    mov         dword ptr [eax+1C],ebp;TVectorExpression.y:TExpression
 0071B219    xor         edx,edx
 0071B21B    mov         dword ptr [eax+20],edx;TVectorExpression.z:TExpression
>0071B21E    jmp         0071B316
 0071B223    mov         dl,1
 0071B225    mov         eax,ebx
 0071B227    call        TParser.ParseExpression
 0071B22C    mov         dword ptr [esp],eax
 0071B22F    mov         esi,dword ptr [ebx+4];TParser.s:TScanner
 0071B232    cmp         byte ptr [esi+8],13;TScanner.token:TToken
>0071B236    jne         0071B259
 0071B238    mov         dl,1
 0071B23A    mov         eax,[00681F10];TVectorExpression
 0071B23F    call        TObject.Create;TVectorExpression.Create
 0071B244    mov         esi,eax
 0071B246    mov         eax,esi
 0071B248    mov         dword ptr [eax+18],edi;TVectorExpression.x:TExpression
 0071B24B    mov         dword ptr [eax+1C],ebp;TVectorExpression.y:TExpression
 0071B24E    mov         edx,dword ptr [esp]
 0071B251    mov         dword ptr [eax+20],edx;TVectorExpression.z:TExpression
>0071B254    jmp         0071B316
 0071B259    mov         dl,17
 0071B25B    mov         eax,esi
 0071B25D    call        TScanner.read
 0071B262    test        al,al
>0071B264    je          0071B300
 0071B26A    mov         dl,1
 0071B26C    mov         eax,[00682414];TMatrixExpression
 0071B271    call        TObject.Create;TMatrixExpression.Create
 0071B276    mov         esi,eax
 0071B278    mov         dword ptr [esi+18],edi;TMatrixExpression......m:?
 0071B27B    mov         dword ptr [esi+1C],ebp;TMatrixExpression.?f1C:TExpression
 0071B27E    mov         eax,dword ptr [esp]
 0071B281    mov         dword ptr [esi+20],eax;TMatrixExpression.?f20:dword
 0071B284    mov         dl,1
 0071B286    mov         eax,ebx
 0071B288    call        TParser.ParseExpression
 0071B28D    mov         dword ptr [esi+24],eax;TMatrixExpression.?f24:TExpression
 0071B290    mov         dl,16
 0071B292    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071B295    call        TScanner.expect
 0071B29A    mov         dl,1
 0071B29C    mov         eax,ebx
 0071B29E    call        TParser.ParseExpression
 0071B2A3    mov         dword ptr [esi+28],eax;TMatrixExpression.?f28:TExpression
 0071B2A6    mov         dl,16
 0071B2A8    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071B2AB    call        TScanner.expect
 0071B2B0    mov         dl,1
 0071B2B2    mov         eax,ebx
 0071B2B4    call        TParser.ParseExpression
 0071B2B9    mov         dword ptr [esi+2C],eax;TMatrixExpression.?f2C:TExpression
 0071B2BC    mov         dl,17
 0071B2BE    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071B2C1    call        TScanner.expect
 0071B2C6    mov         dl,1
 0071B2C8    mov         eax,ebx
 0071B2CA    call        TParser.ParseExpression
 0071B2CF    mov         dword ptr [esi+30],eax;TMatrixExpression.?f30:TExpression
 0071B2D2    mov         dl,16
 0071B2D4    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071B2D7    call        TScanner.expect
 0071B2DC    mov         dl,1
 0071B2DE    mov         eax,ebx
 0071B2E0    call        TParser.ParseExpression
 0071B2E5    mov         dword ptr [esi+34],eax;TMatrixExpression.?f34:TExpression
 0071B2E8    mov         dl,16
 0071B2EA    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071B2ED    call        TScanner.expect
 0071B2F2    mov         dl,1
 0071B2F4    mov         eax,ebx
 0071B2F6    call        TParser.ParseExpression
 0071B2FB    mov         dword ptr [esi+38],eax;TMatrixExpression.?f38:TExpression
>0071B2FE    jmp         0071B316
 0071B300    mov         ecx,71B334;'] or ; expected for 3-vector or 3x3 matrix'
 0071B305    mov         dl,1
 0071B307    mov         eax,[00577004];ETokenExpected
 0071B30C    call        Exception.Create;ETokenExpected.Create
 0071B311    call        @RaiseExcept
 0071B316    mov         dl,13
 0071B318    mov         eax,dword ptr [ebx+4];TParser.s:TScanner
 0071B31B    call        TScanner.expect
 0071B320    mov         eax,esi
 0071B322    pop         edx
 0071B323    pop         ebp
 0071B324    pop         edi
 0071B325    pop         esi
 0071B326    pop         ebx
 0071B327    ret
*}
end;

//0071B38C
{*procedure sub_0071B38C(?:?; ?:?);
begin
 0071B38C    push        ebp
 0071B38D    mov         ebp,esp
 0071B38F    push        ecx
 0071B390    push        ebx
 0071B391    push        esi
 0071B392    push        edi
 0071B393    mov         edi,edx
 0071B395    mov         dword ptr [ebp-4],eax
 0071B398    mov         eax,dword ptr [ebp-4]
 0071B39B    call        @UStrAddRef
 0071B3A0    xor         eax,eax
 0071B3A2    push        ebp
 0071B3A3    push        71B41F
 0071B3A8    push        dword ptr fs:[eax]
 0071B3AB    mov         dword ptr fs:[eax],esp
 0071B3AE    mov         eax,[0078D710];^gvar_0081555F
 0071B3B3    movzx       eax,byte ptr [eax]
 0071B3B6    or          al,byte ptr ds:[8229F8];gvar_008229F8
>0071B3BC    je          0071B3FF
 0071B3BE    mov         eax,dword ptr [ebp-4]
 0071B3C1    test        eax,eax
>0071B3C3    je          0071B3CA
 0071B3C5    sub         eax,4
 0071B3C8    mov         eax,dword ptr [eax]
 0071B3CA    mov         esi,eax
 0071B3CC    test        esi,esi
>0071B3CE    jle         0071B3F3
 0071B3D0    mov         ebx,1
 0071B3D5    mov         eax,dword ptr [ebp-4]
 0071B3D8    cmp         word ptr [eax+ebx*2-2],2E
>0071B3DE    jne         0071B3EF
 0071B3E0    lea         eax,[ebp-4]
 0071B3E3    call        @UniqueStringU
 0071B3E8    mov         word ptr [eax+ebx*2-2],2C
 0071B3EF    inc         ebx
 0071B3F0    dec         esi
>0071B3F1    jne         0071B3D5
 0071B3F3    mov         eax,edi
 0071B3F5    mov         edx,dword ptr [ebp-4]
 0071B3F8    call        @UStrAsg
>0071B3FD    jmp         0071B409
 0071B3FF    mov         eax,edi
 0071B401    mov         edx,dword ptr [ebp-4]
 0071B404    call        @UStrAsg
 0071B409    xor         eax,eax
 0071B40B    pop         edx
 0071B40C    pop         ecx
 0071B40D    pop         ecx
 0071B40E    mov         dword ptr fs:[eax],edx
 0071B411    push        71B426
 0071B416    lea         eax,[ebp-4]
 0071B419    call        @UStrClr
 0071B41E    ret
>0071B41F    jmp         @HandleFinally
>0071B424    jmp         0071B416
 0071B426    pop         edi
 0071B427    pop         esi
 0071B428    pop         ebx
 0071B429    pop         ecx
 0071B42A    pop         ebp
 0071B42B    ret
end;*}

//0071B42C
{*procedure sub_0071B42C(?:TToken; ?:?);
begin
 0071B42C    push        ebp
 0071B42D    mov         ebp,esp
 0071B42F    mov         ecx,19
 0071B434    push        0
 0071B436    push        0
 0071B438    dec         ecx
>0071B439    jne         0071B434
 0071B43B    push        ecx
 0071B43C    push        ebx
 0071B43D    push        esi
 0071B43E    push        edi
 0071B43F    mov         esi,eax
 0071B441    lea         edi,[ebp-18]
 0071B444    mov         ecx,6
 0071B449    rep movs    dword ptr [edi],dword ptr [esi]
 0071B44B    mov         ebx,edx
 0071B44D    lea         eax,[ebp-18]
 0071B450    mov         edx,dword ptr ds:[576E48];TToken
 0071B456    call        @AddRefRecord
 0071B45B    xor         eax,eax
 0071B45D    push        ebp
 0071B45E    push        71C126
 0071B463    push        dword ptr fs:[eax]
 0071B466    mov         dword ptr fs:[eax],esp
 0071B469    movzx       eax,byte ptr [ebp-18]
 0071B46D    cmp         eax,6D
>0071B470    ja          0071C0E6
 0071B476    jmp         dword ptr [eax*4+71B47D]
 0071B476    dd          0071C0E6
 0071B476    dd          0071B635
 0071B476    dd          0071B644
 0071B476    dd          0071B653
 0071B476    dd          0071B66D
 0071B476    dd          0071B687
 0071B476    dd          0071B6A1
 0071B476    dd          0071B6CA
 0071B476    dd          0071B6E9
 0071B476    dd          0071B6F8
 0071B476    dd          0071B712
 0071B476    dd          0071B731
 0071B476    dd          0071B74D
 0071B476    dd          0071B769
 0071B476    dd          0071B785
 0071B476    dd          0071C0E6
 0071B476    dd          0071B7A1
 0071B476    dd          0071B7B2
 0071B476    dd          0071B7C3
 0071B476    dd          0071B7D4
 0071B476    dd          0071B7E5
 0071B476    dd          0071B7F6
 0071B476    dd          0071B807
 0071B476    dd          0071B818
 0071B476    dd          0071B829
 0071B476    dd          0071B83A
 0071B476    dd          0071B84B
 0071B476    dd          0071B85C
 0071B476    dd          0071B86D
 0071B476    dd          0071B87E
 0071B476    dd          0071B907
 0071B476    dd          0071B9CA
 0071B476    dd          0071B9E6
 0071B476    dd          0071BA6F
 0071B476    dd          0071BA80
 0071B476    dd          0071BA91
 0071B476    dd          0071BAA2
 0071B476    dd          0071BAB3
 0071B476    dd          0071BAC4
 0071B476    dd          0071BAE0
 0071B476    dd          0071BAFC
 0071B476    dd          0071BB0D
 0071B476    dd          0071BB1E
 0071B476    dd          0071BB2F
 0071B476    dd          0071BB40
 0071B476    dd          0071BB51
 0071B476    dd          0071BB62
 0071B476    dd          0071BB73
 0071B476    dd          0071BB84
 0071B476    dd          0071BB95
 0071B476    dd          0071BBA6
 0071B476    dd          0071BBB7
 0071B476    dd          0071BBC8
 0071B476    dd          0071BBD9
 0071B476    dd          0071C0E6
 0071B476    dd          0071BBEA
 0071B476    dd          0071BBFB
 0071B476    dd          0071BC0C
 0071B476    dd          0071BC1D
 0071B476    dd          0071BC2E
 0071B476    dd          0071BC3F
 0071B476    dd          0071BC50
 0071B476    dd          0071BC61
 0071B476    dd          0071BC72
 0071B476    dd          0071BC83
 0071B476    dd          0071BC9F
 0071B476    dd          0071BCBB
 0071B476    dd          0071BCD7
 0071B476    dd          0071BCF3
 0071B476    dd          0071BD0F
 0071B476    dd          0071BD2B
 0071B476    dd          0071BD47
 0071B476    dd          0071BD69
 0071B476    dd          0071BD7A
 0071B476    dd          0071BD8B
 0071B476    dd          0071BD9C
 0071B476    dd          0071BDAD
 0071B476    dd          0071BDF1
 0071B476    dd          0071BE35
 0071B476    dd          0071BE46
 0071B476    dd          0071BDBE
 0071B476    dd          0071BE02
 0071B476    dd          0071C0E6
 0071B476    dd          0071C0E6
 0071B476    dd          0071BDCF
 0071B476    dd          0071BDE0
 0071B476    dd          0071BE24
 0071B476    dd          0071BE13
 0071B476    dd          0071BE57
 0071B476    dd          0071BE68
 0071B476    dd          0071BE8A
 0071B476    dd          0071BEAC
 0071B476    dd          0071BECE
 0071B476    dd          0071BEF0
 0071B476    dd          0071BF12
 0071B476    dd          0071BF34
 0071B476    dd          0071BF56
 0071B476    dd          0071BF78
 0071B476    dd          0071BF9A
 0071B476    dd          0071BFBC
 0071B476    dd          0071BFDE
 0071B476    dd          0071C000
 0071B476    dd          0071C022
 0071B476    dd          0071C044
 0071B476    dd          0071C066
 0071B476    dd          0071C085
 0071B476    dd          0071C0A4
 0071B476    dd          0071C0C3
 0071B476    dd          0071C0CF
 0071B476    dd          0071C0DD
 0071B635    mov         eax,ebx
 0071B637    mov         edx,dword ptr [ebp-14]
 0071B63A    call        @WStrFromUStr
>0071B63F    jmp         0071C0ED
 0071B644    mov         eax,ebx
 0071B646    mov         edx,dword ptr [ebp-14]
 0071B649    call        @WStrFromUStr
>0071B64E    jmp         0071C0ED
 0071B653    lea         edx,[ebp-1C]
 0071B656    mov         eax,dword ptr [ebp-14]
 0071B659    call        00575A60
 0071B65E    mov         edx,dword ptr [ebp-1C]
 0071B661    mov         eax,ebx
 0071B663    call        @WStrFromUStr
>0071B668    jmp         0071C0ED
 0071B66D    lea         edx,[ebp-20]
 0071B670    mov         eax,dword ptr [ebp-14]
 0071B673    call        00575A60
 0071B678    mov         edx,dword ptr [ebp-20]
 0071B67B    mov         eax,ebx
 0071B67D    call        @WStrFromUStr
>0071B682    jmp         0071C0ED
 0071B687    lea         edx,[ebp-24]
 0071B68A    mov         eax,dword ptr [ebp-14]
 0071B68D    call        00575428
 0071B692    mov         edx,dword ptr [ebp-24]
 0071B695    mov         eax,ebx
 0071B697    call        @WStrFromUStr
>0071B69C    jmp         0071C0ED
 0071B6A1    push        71C140;'"'
 0071B6A6    push        dword ptr [ebp-14]
 0071B6A9    push        71C140;'"'
 0071B6AE    lea         eax,[ebp-28]
 0071B6B1    mov         edx,3
 0071B6B6    call        @UStrCatN
 0071B6BB    mov         edx,dword ptr [ebp-28]
 0071B6BE    mov         eax,ebx
 0071B6C0    call        @WStrFromUStr
>0071B6C5    jmp         0071C0ED
 0071B6CA    lea         eax,[ebp-2C]
 0071B6CD    mov         ecx,dword ptr [ebp-14]
 0071B6D0    mov         edx,71C140;'"'
 0071B6D5    call        @UStrCat3
 0071B6DA    mov         edx,dword ptr [ebp-2C]
 0071B6DD    mov         eax,ebx
 0071B6DF    call        @WStrFromUStr
>0071B6E4    jmp         0071C0ED
 0071B6E9    mov         eax,ebx
 0071B6EB    mov         edx,dword ptr [ebp-14]
 0071B6EE    call        @WStrFromUStr
>0071B6F3    jmp         0071C0ED
 0071B6F8    lea         edx,[ebp-30]
 0071B6FB    mov         eax,dword ptr [ebp-14]
 0071B6FE    call        0071B38C
 0071B703    mov         edx,dword ptr [ebp-30]
 0071B706    mov         eax,ebx
 0071B708    call        @WStrFromUStr
>0071B70D    jmp         0071C0ED
 0071B712    lea         eax,[ebp-34]
 0071B715    mov         ecx,dword ptr [ebp-14]
 0071B718    mov         edx,71C150;'0x'
 0071B71D    call        @UStrCat3
 0071B722    mov         edx,dword ptr [ebp-34]
 0071B725    mov         eax,ebx
 0071B727    call        @WStrFromUStr
>0071B72C    jmp         0071C0ED
 0071B731    lea         edx,[ebp-38]
 0071B734    mov         eax,71C164;'true'
 0071B739    call        00575428
 0071B73E    mov         edx,dword ptr [ebp-38]
 0071B741    mov         eax,ebx
 0071B743    call        @WStrFromUStr
>0071B748    jmp         0071C0ED
 0071B74D    lea         edx,[ebp-3C]
 0071B750    mov         eax,71C17C;'false'
 0071B755    call        00575428
 0071B75A    mov         edx,dword ptr [ebp-3C]
 0071B75D    mov         eax,ebx
 0071B75F    call        @WStrFromUStr
>0071B764    jmp         0071C0ED
 0071B769    lea         edx,[ebp-40]
 0071B76C    mov         eax,71C194;'Nil'
 0071B771    call        00575428
 0071B776    mov         edx,dword ptr [ebp-40]
 0071B779    mov         eax,ebx
 0071B77B    call        @WStrFromUStr
>0071B780    jmp         0071C0ED
 0071B785    lea         edx,[ebp-44]
 0071B788    mov         eax,71C1A8;'NULL'
 0071B78D    call        00575428
 0071B792    mov         edx,dword ptr [ebp-44]
 0071B795    mov         eax,ebx
 0071B797    call        @WStrFromUStr
>0071B79C    jmp         0071C0ED
 0071B7A1    mov         eax,ebx
 0071B7A3    mov         edx,71C1B8;'('
 0071B7A8    call        @WStrAsg
>0071B7AD    jmp         0071C0ED
 0071B7B2    mov         eax,ebx
 0071B7B4    mov         edx,71C1C0;')'
 0071B7B9    call        @WStrAsg
>0071B7BE    jmp         0071C0ED
 0071B7C3    mov         eax,ebx
 0071B7C5    mov         edx,71C1C8;'['
 0071B7CA    call        @WStrAsg
>0071B7CF    jmp         0071C0ED
 0071B7D4    mov         eax,ebx
 0071B7D6    mov         edx,71C1D0;']'
 0071B7DB    call        @WStrAsg
>0071B7E0    jmp         0071C0ED
 0071B7E5    mov         eax,ebx
 0071B7E7    mov         edx,71C1D8;'{'
 0071B7EC    call        @WStrAsg
>0071B7F1    jmp         0071C0ED
 0071B7F6    mov         eax,ebx
 0071B7F8    mov         edx,71C1E0;'}'
 0071B7FD    call        @WStrAsg
>0071B802    jmp         0071C0ED
 0071B807    mov         eax,ebx
 0071B809    mov         edx,71C1E8;','
 0071B80E    call        @WStrAsg
>0071B813    jmp         0071C0ED
 0071B818    mov         eax,ebx
 0071B81A    mov         edx,71C1F0;';'
 0071B81F    call        @WStrAsg
>0071B824    jmp         0071C0ED
 0071B829    mov         eax,ebx
 0071B82B    mov         edx,71C1F8;':'
 0071B830    call        @WStrAsg
>0071B835    jmp         0071C0ED
 0071B83A    mov         eax,ebx
 0071B83C    mov         edx,71C200;'?'
 0071B841    call        @WStrAsg
>0071B846    jmp         0071C0ED
 0071B84B    mov         eax,ebx
 0071B84D    mov         edx,71C208;'...'
 0071B852    call        @WStrAsg
>0071B857    jmp         0071C0ED
 0071B85C    mov         eax,ebx
 0071B85E    mov         edx,71C214;'..'
 0071B863    call        @WStrAsg
>0071B868    jmp         0071C0ED
 0071B86D    mov         eax,ebx
 0071B86F    mov         edx,71C220;'.'
 0071B874    call        @WStrAsg
>0071B879    jmp         0071C0ED
 0071B87E    lea         edx,[ebp-48]
 0071B881    mov         eax,71C230;'.'
 0071B886    call        00575428
 0071B88B    mov         edx,dword ptr [ebp-48]
 0071B88E    mov         eax,ebx
 0071B890    call        @WStrFromUStr
 0071B895    mov         eax,dword ptr [ebx]
 0071B897    xor         edx,edx
 0071B899    call        @WStrEqual
>0071B89E    je          0071B8F6
 0071B8A0    mov         eax,dword ptr [ebx]
 0071B8A2    movzx       eax,word ptr [eax]
 0071B8A5    call        00710C0C
 0071B8AA    test        al,al
>0071B8AC    je          0071B8BC
 0071B8AE    mov         ecx,dword ptr [ebx]
 0071B8B0    mov         eax,ebx
 0071B8B2    mov         edx,71C238;' '
 0071B8B7    call        @WStrCat3
 0071B8BC    mov         eax,dword ptr [ebx]
 0071B8BE    mov         dword ptr [ebp-4C],eax
 0071B8C1    mov         esi,dword ptr [ebp-4C]
 0071B8C4    test        esi,esi
>0071B8C6    je          0071B8D1
 0071B8C8    sub         esi,4
 0071B8CB    mov         eax,dword ptr [esi]
 0071B8CD    shr         eax,1
 0071B8CF    mov         esi,eax
 0071B8D1    mov         eax,dword ptr [ebx]
 0071B8D3    movzx       eax,word ptr [eax+esi*2-2]
 0071B8D8    call        00710C0C
 0071B8DD    test        al,al
>0071B8DF    je          0071C0ED
 0071B8E5    mov         eax,ebx
 0071B8E7    mov         edx,71C238;' '
 0071B8EC    call        @WStrCat
>0071B8F1    jmp         0071C0ED
 0071B8F6    mov         eax,ebx
 0071B8F8    mov         edx,71C220;'.'
 0071B8FD    call        @WStrAsg
>0071B902    jmp         0071C0ED
 0071B907    lea         edx,[ebp-50]
 0071B90A    mov         eax,71C248;'''s'
 0071B90F    call        00575428
 0071B914    mov         edx,dword ptr [ebp-50]
 0071B917    mov         eax,ebx
 0071B919    call        @WStrFromUStr
 0071B91E    mov         eax,dword ptr [ebx]
 0071B920    mov         edx,71C254;''s'
 0071B925    call        @WStrEqual
>0071B92A    jne         0071B958
 0071B92C    lea         edx,[ebp-54]
 0071B92F    mov         eax,[0078D324];^gvar_00815558:UnicodeString
 0071B934    mov         eax,dword ptr [eax]
 0071B936    call        LowerCase
 0071B93B    mov         edx,dword ptr [ebp-54]
 0071B93E    mov         eax,71C268;'english'
 0071B943    call        Pos
 0071B948    test        eax,eax
>0071B94A    jne         0071B958
 0071B94C    mov         eax,ebx
 0071B94E    mov         edx,71C220;'.'
 0071B953    call        @WStrAsg
 0071B958    mov         eax,dword ptr [ebx]
 0071B95A    xor         edx,edx
 0071B95C    call        @WStrEqual
>0071B961    je          0071B9B9
 0071B963    mov         eax,dword ptr [ebx]
 0071B965    movzx       eax,word ptr [eax]
 0071B968    call        00710C0C
 0071B96D    test        al,al
>0071B96F    je          0071B97F
 0071B971    mov         ecx,dword ptr [ebx]
 0071B973    mov         eax,ebx
 0071B975    mov         edx,71C238;' '
 0071B97A    call        @WStrCat3
 0071B97F    mov         eax,dword ptr [ebx]
 0071B981    mov         dword ptr [ebp-4C],eax
 0071B984    mov         esi,dword ptr [ebp-4C]
 0071B987    test        esi,esi
>0071B989    je          0071B994
 0071B98B    sub         esi,4
 0071B98E    mov         eax,dword ptr [esi]
 0071B990    shr         eax,1
 0071B992    mov         esi,eax
 0071B994    mov         eax,dword ptr [ebx]
 0071B996    movzx       eax,word ptr [eax+esi*2-2]
 0071B99B    call        00710C0C
 0071B9A0    test        al,al
>0071B9A2    je          0071C0ED
 0071B9A8    mov         eax,ebx
 0071B9AA    mov         edx,71C238;' '
 0071B9AF    call        @WStrCat
>0071B9B4    jmp         0071C0ED
 0071B9B9    mov         eax,ebx
 0071B9BB    mov         edx,71C220;'.'
 0071B9C0    call        @WStrAsg
>0071B9C5    jmp         0071C0ED
 0071B9CA    lea         edx,[ebp-58]
 0071B9CD    mov         eax,71C284;'of'
 0071B9D2    call        00575428
 0071B9D7    mov         edx,dword ptr [ebp-58]
 0071B9DA    mov         eax,ebx
 0071B9DC    call        @WStrFromUStr
>0071B9E1    jmp         0071C0ED
 0071B9E6    lea         edx,[ebp-5C]
 0071B9E9    mov         eax,71C298;'::'
 0071B9EE    call        00575428
 0071B9F3    mov         edx,dword ptr [ebp-5C]
 0071B9F6    mov         eax,ebx
 0071B9F8    call        @WStrFromUStr
 0071B9FD    mov         eax,dword ptr [ebx]
 0071B9FF    xor         edx,edx
 0071BA01    call        @WStrEqual
>0071BA06    je          0071BA5E
 0071BA08    mov         eax,dword ptr [ebx]
 0071BA0A    movzx       eax,word ptr [eax]
 0071BA0D    call        00710C0C
 0071BA12    test        al,al
>0071BA14    je          0071BA24
 0071BA16    mov         ecx,dword ptr [ebx]
 0071BA18    mov         eax,ebx
 0071BA1A    mov         edx,71C238;' '
 0071BA1F    call        @WStrCat3
 0071BA24    mov         eax,dword ptr [ebx]
 0071BA26    mov         dword ptr [ebp-4C],eax
 0071BA29    mov         esi,dword ptr [ebp-4C]
 0071BA2C    test        esi,esi
>0071BA2E    je          0071BA39
 0071BA30    sub         esi,4
 0071BA33    mov         eax,dword ptr [esi]
 0071BA35    shr         eax,1
 0071BA37    mov         esi,eax
 0071BA39    mov         eax,dword ptr [ebx]
 0071BA3B    movzx       eax,word ptr [eax+esi*2-2]
 0071BA40    call        00710C0C
 0071BA45    test        al,al
>0071BA47    je          0071C0ED
 0071BA4D    mov         eax,ebx
 0071BA4F    mov         edx,71C238;' '
 0071BA54    call        @WStrCat
>0071BA59    jmp         0071C0ED
 0071BA5E    mov         eax,ebx
 0071BA60    mov         edx,71C2A4;'::'
 0071BA65    call        @WStrAsg
>0071BA6A    jmp         0071C0ED
 0071BA6F    mov         eax,ebx
 0071BA71    mov         edx,71C2B0;'->'
 0071BA76    call        @WStrAsg
>0071BA7B    jmp         0071C0ED
 0071BA80    mov         eax,ebx
 0071BA82    mov         edx,71C2BC;'+'
 0071BA87    call        @WStrAsg
>0071BA8C    jmp         0071C0ED
 0071BA91    mov         eax,ebx
 0071BA93    mov         edx,71C2C4;'-'
 0071BA98    call        @WStrAsg
>0071BA9D    jmp         0071C0ED
 0071BAA2    mov         eax,ebx
 0071BAA4    mov         edx,71C2CC;'*'
 0071BAA9    call        @WStrAsg
>0071BAAE    jmp         0071C0ED
 0071BAB3    mov         eax,ebx
 0071BAB5    mov         edx,71C2D4;'/'
 0071BABA    call        @WStrAsg
>0071BABF    jmp         0071C0ED
 0071BAC4    lea         edx,[ebp-60]
 0071BAC7    mov         eax,71C2E4;'div'
 0071BACC    call        00575428
 0071BAD1    mov         edx,dword ptr [ebp-60]
 0071BAD4    mov         eax,ebx
 0071BAD6    call        @WStrFromUStr
>0071BADB    jmp         0071C0ED
 0071BAE0    lea         edx,[ebp-64]
 0071BAE3    mov         eax,71C2F8;'mod'
 0071BAE8    call        00575428
 0071BAED    mov         edx,dword ptr [ebp-64]
 0071BAF0    mov         eax,ebx
 0071BAF2    call        @WStrFromUStr
>0071BAF7    jmp         0071C0ED
 0071BAFC    mov         eax,ebx
 0071BAFE    mov         edx,71C304;'<<'
 0071BB03    call        @WStrAsg
>0071BB08    jmp         0071C0ED
 0071BB0D    mov         eax,ebx
 0071BB0F    mov         edx,71C310;'>>'
 0071BB14    call        @WStrAsg
>0071BB19    jmp         0071C0ED
 0071BB1E    mov         eax,ebx
 0071BB20    mov         edx,71C31C;'@'
 0071BB25    call        @WStrAsg
>0071BB2A    jmp         0071C0ED
 0071BB2F    mov         eax,ebx
 0071BB31    mov         edx,71C324;'&'
 0071BB36    call        @WStrAsg
>0071BB3B    jmp         0071C0ED
 0071BB40    mov         eax,ebx
 0071BB42    mov         edx,71C32C;'^'
 0071BB47    call        @WStrAsg
>0071BB4C    jmp         0071C0ED
 0071BB51    mov         eax,ebx
 0071BB53    mov         edx,71C334;'**'
 0071BB58    call        @WStrAsg
>0071BB5D    jmp         0071C0ED
 0071BB62    mov         eax,ebx
 0071BB64    mov         edx,71C340;'%'
 0071BB69    call        @WStrAsg
>0071BB6E    jmp         0071C0ED
 0071BB73    mov         eax,ebx
 0071BB75    mov         edx,71C348;'!'
 0071BB7A    call        @WStrAsg
>0071BB7F    jmp         0071C0ED
 0071BB84    mov         eax,ebx
 0071BB86    mov         edx,71C350;'!!'
 0071BB8B    call        @WStrAsg
>0071BB90    jmp         0071C0ED
 0071BB95    mov         eax,ebx
 0071BB97    mov         edx,71C35C;'.+'
 0071BB9C    call        @WStrAsg
>0071BBA1    jmp         0071C0ED
 0071BBA6    mov         eax,ebx
 0071BBA8    mov         edx,71C368;'.-'
 0071BBAD    call        @WStrAsg
>0071BBB2    jmp         0071C0ED
 0071BBB7    mov         eax,ebx
 0071BBB9    mov         edx,71C374;'.*'
 0071BBBE    call        @WStrAsg
>0071BBC3    jmp         0071C0ED
 0071BBC8    mov         eax,ebx
 0071BBCA    mov         edx,71C380;'./'
 0071BBCF    call        @WStrAsg
>0071BBD4    jmp         0071C0ED
 0071BBD9    mov         eax,ebx
 0071BBDB    mov         edx,71C38C;'.^'
 0071BBE0    call        @WStrAsg
>0071BBE5    jmp         0071C0ED
 0071BBEA    mov         eax,ebx
 0071BBEC    mov         edx,71C398;'.='
 0071BBF1    call        @WStrAsg
>0071BBF6    jmp         0071C0ED
 0071BBFB    mov         eax,ebx
 0071BBFD    mov         edx,71C3A4;':='
 0071BC02    call        @WStrAsg
>0071BC07    jmp         0071C0ED
 0071BC0C    mov         eax,ebx
 0071BC0E    mov         edx,71C3B0;'+='
 0071BC13    call        @WStrAsg
>0071BC18    jmp         0071C0ED
 0071BC1D    mov         eax,ebx
 0071BC1F    mov         edx,71C3BC;'-='
 0071BC24    call        @WStrAsg
>0071BC29    jmp         0071C0ED
 0071BC2E    mov         eax,ebx
 0071BC30    mov         edx,71C3C8;'*='
 0071BC35    call        @WStrAsg
>0071BC3A    jmp         0071C0ED
 0071BC3F    mov         eax,ebx
 0071BC41    mov         edx,71C3D4;'/='
 0071BC46    call        @WStrAsg
>0071BC4B    jmp         0071C0ED
 0071BC50    mov         eax,ebx
 0071BC52    mov         edx,71C3E0;'++'
 0071BC57    call        @WStrAsg
>0071BC5C    jmp         0071C0ED
 0071BC61    mov         eax,ebx
 0071BC63    mov         edx,71C3EC;'--'
 0071BC68    call        @WStrAsg
>0071BC6D    jmp         0071C0ED
 0071BC72    mov         eax,ebx
 0071BC74    mov         edx,71C3F8;'=>'
 0071BC79    call        @WStrAsg
>0071BC7E    jmp         0071C0ED
 0071BC83    lea         edx,[ebp-68]
 0071BC86    mov         eax,71C40C;'or'
 0071BC8B    call        00575428
 0071BC90    mov         edx,dword ptr [ebp-68]
 0071BC93    mov         eax,ebx
 0071BC95    call        @WStrFromUStr
>0071BC9A    jmp         0071C0ED
 0071BC9F    lea         edx,[ebp-6C]
 0071BCA2    mov         eax,71C420;'and'
 0071BCA7    call        00575428
 0071BCAC    mov         edx,dword ptr [ebp-6C]
 0071BCAF    mov         eax,ebx
 0071BCB1    call        @WStrFromUStr
>0071BCB6    jmp         0071C0ED
 0071BCBB    lea         edx,[ebp-70]
 0071BCBE    mov         eax,71C434;'XOR'
 0071BCC3    call        00575428
 0071BCC8    mov         edx,dword ptr [ebp-70]
 0071BCCB    mov         eax,ebx
 0071BCCD    call        @WStrFromUStr
>0071BCD2    jmp         0071C0ED
 0071BCD7    lea         edx,[ebp-74]
 0071BCDA    mov         eax,71C448;'not'
 0071BCDF    call        00575428
 0071BCE4    mov         edx,dword ptr [ebp-74]
 0071BCE7    mov         eax,ebx
 0071BCE9    call        @WStrFromUStr
>0071BCEE    jmp         0071C0ED
 0071BCF3    lea         edx,[ebp-78]
 0071BCF6    mov         eax,71C45C;'but'
 0071BCFB    call        00575428
 0071BD00    mov         edx,dword ptr [ebp-78]
 0071BD03    mov         eax,ebx
 0071BD05    call        @WStrFromUStr
>0071BD0A    jmp         0071C0ED
 0071BD0F    lea         edx,[ebp-7C]
 0071BD12    mov         eax,71C470;'either'
 0071BD17    call        00575428
 0071BD1C    mov         edx,dword ptr [ebp-7C]
 0071BD1F    mov         eax,ebx
 0071BD21    call        @WStrFromUStr
>0071BD26    jmp         0071C0ED
 0071BD2B    lea         edx,[ebp-80]
 0071BD2E    mov         eax,71C48C;'neither'
 0071BD33    call        00575428
 0071BD38    mov         edx,dword ptr [ebp-80]
 0071BD3B    mov         eax,ebx
 0071BD3D    call        @WStrFromUStr
>0071BD42    jmp         0071C0ED
 0071BD47    lea         edx,[ebp-84]
 0071BD4D    mov         eax,71C4A8;'nor'
 0071BD52    call        00575428
 0071BD57    mov         edx,dword ptr [ebp-84]
 0071BD5D    mov         eax,ebx
 0071BD5F    call        @WStrFromUStr
>0071BD64    jmp         0071C0ED
 0071BD69    mov         eax,ebx
 0071BD6B    mov         edx,71C4B4;'&&'
 0071BD70    call        @WStrAsg
>0071BD75    jmp         0071C0ED
 0071BD7A    mov         eax,ebx
 0071BD7C    mov         edx,71C4C0;'||'
 0071BD81    call        @WStrAsg
>0071BD86    jmp         0071C0ED
 0071BD8B    mov         eax,ebx
 0071BD8D    mov         edx,71C4CC;'|'
 0071BD92    call        @WStrAsg
>0071BD97    jmp         0071C0ED
 0071BD9C    mov         eax,ebx
 0071BD9E    mov         edx,71C4D4;'='
 0071BDA3    call        @WStrAsg
>0071BDA8    jmp         0071C0ED
 0071BDAD    mov         eax,ebx
 0071BDAF    mov         edx,71C4DC;'<'
 0071BDB4    call        @WStrAsg
>0071BDB9    jmp         0071C0ED
 0071BDBE    mov         eax,ebx
 0071BDC0    mov         edx,71C4E4;'<='
 0071BDC5    call        @WStrAsg
>0071BDCA    jmp         0071C0ED
 0071BDCF    mov         eax,ebx
 0071BDD1    mov         edx,71C4F0;'~<'
 0071BDD6    call        @WStrAsg
>0071BDDB    jmp         0071C0ED
 0071BDE0    mov         eax,ebx
 0071BDE2    mov         edx,71C4FC;'~<='
 0071BDE7    call        @WStrAsg
>0071BDEC    jmp         0071C0ED
 0071BDF1    mov         eax,ebx
 0071BDF3    mov         edx,71C508;'>'
 0071BDF8    call        @WStrAsg
>0071BDFD    jmp         0071C0ED
 0071BE02    mov         eax,ebx
 0071BE04    mov         edx,71C510;'>='
 0071BE09    call        @WStrAsg
>0071BE0E    jmp         0071C0ED
 0071BE13    mov         eax,ebx
 0071BE15    mov         edx,71C51C;'~>'
 0071BE1A    call        @WStrAsg
>0071BE1F    jmp         0071C0ED
 0071BE24    mov         eax,ebx
 0071BE26    mov         edx,71C528;'~>='
 0071BE2B    call        @WStrAsg
>0071BE30    jmp         0071C0ED
 0071BE35    mov         eax,ebx
 0071BE37    mov         edx,71C534;'=='
 0071BE3C    call        @WStrAsg
>0071BE41    jmp         0071C0ED
 0071BE46    mov         eax,ebx
 0071BE48    mov         edx,71C540;'!='
 0071BE4D    call        @WStrAsg
>0071BE52    jmp         0071C0ED
 0071BE57    mov         eax,ebx
 0071BE59    mov         edx,71C54C;'~'
 0071BE5E    call        @WStrAsg
>0071BE63    jmp         0071C0ED
 0071BE68    lea         edx,[ebp-88]
 0071BE6E    mov         eax,71C55C;'do'
 0071BE73    call        00575428
 0071BE78    mov         edx,dword ptr [ebp-88]
 0071BE7E    mov         eax,ebx
 0071BE80    call        @WStrFromUStr
>0071BE85    jmp         0071C0ED
 0071BE8A    lea         edx,[ebp-8C]
 0071BE90    mov         eax,71C570;'to'
 0071BE95    call        00575428
 0071BE9A    mov         edx,dword ptr [ebp-8C]
 0071BEA0    mov         eax,ebx
 0071BEA2    call        @WStrFromUStr
>0071BEA7    jmp         0071C0ED
 0071BEAC    lea         edx,[ebp-90]
 0071BEB2    mov         eax,71C584;'is'
 0071BEB7    call        00575428
 0071BEBC    mov         edx,dword ptr [ebp-90]
 0071BEC2    mov         eax,ebx
 0071BEC4    call        @WStrFromUStr
>0071BEC9    jmp         0071C0ED
 0071BECE    lea         edx,[ebp-94]
 0071BED4    mov         eax,71C598;'isn''t'
 0071BED9    call        00575428
 0071BEDE    mov         edx,dword ptr [ebp-94]
 0071BEE4    mov         eax,ebx
 0071BEE6    call        @WStrFromUStr
>0071BEEB    jmp         0071C0ED
 0071BEF0    lea         edx,[ebp-98]
 0071BEF6    mov         eax,71C5B0;'End'
 0071BEFB    call        00575428
 0071BF00    mov         edx,dword ptr [ebp-98]
 0071BF06    mov         eax,ebx
 0071BF08    call        @WStrFromUStr
>0071BF0D    jmp         0071C0ED
 0071BF12    lea         edx,[ebp-9C]
 0071BF18    mov         eax,71C5C4;'in'
 0071BF1D    call        00575428
 0071BF22    mov         edx,dword ptr [ebp-9C]
 0071BF28    mov         eax,ebx
 0071BF2A    call        @WStrFromUStr
>0071BF2F    jmp         0071C0ED
 0071BF34    lea         edx,[ebp-0A0]
 0071BF3A    mov         eax,71C5D8;'If'
 0071BF3F    call        00575428
 0071BF44    mov         edx,dword ptr [ebp-0A0]
 0071BF4A    mov         eax,ebx
 0071BF4C    call        @WStrFromUStr
>0071BF51    jmp         0071C0ED
 0071BF56    lea         edx,[ebp-0A4]
 0071BF5C    mov         eax,71C5EC;'then'
 0071BF61    call        00575428
 0071BF66    mov         edx,dword ptr [ebp-0A4]
 0071BF6C    mov         eax,ebx
 0071BF6E    call        @WStrFromUStr
>0071BF73    jmp         0071C0ED
 0071BF78    lea         edx,[ebp-0A8]
 0071BF7E    mov         eax,71C604;'Else'
 0071BF83    call        00575428
 0071BF88    mov         edx,dword ptr [ebp-0A8]
 0071BF8E    mov         eax,ebx
 0071BF90    call        @WStrFromUStr
>0071BF95    jmp         0071C0ED
 0071BF9A    lea         edx,[ebp-0AC]
 0071BFA0    mov         eax,71C61C;'Elseif'
 0071BFA5    call        00575428
 0071BFAA    mov         edx,dword ptr [ebp-0AC]
 0071BFB0    mov         eax,ebx
 0071BFB2    call        @WStrFromUStr
>0071BFB7    jmp         0071C0ED
 0071BFBC    lea         edx,[ebp-0B0]
 0071BFC2    mov         eax,71C638;'Endif'
 0071BFC7    call        00575428
 0071BFCC    mov         edx,dword ptr [ebp-0B0]
 0071BFD2    mov         eax,ebx
 0071BFD4    call        @WStrFromUStr
>0071BFD9    jmp         0071C0ED
 0071BFDE    lea         edx,[ebp-0B4]
 0071BFE4    mov         eax,71C650;'While'
 0071BFE9    call        00575428
 0071BFEE    mov         edx,dword ptr [ebp-0B4]
 0071BFF4    mov         eax,ebx
 0071BFF6    call        @WStrFromUStr
>0071BFFB    jmp         0071C0ED
 0071C000    lea         edx,[ebp-0B8]
 0071C006    mov         eax,71C668;'For'
 0071C00B    call        00575428
 0071C010    mov         edx,dword ptr [ebp-0B8]
 0071C016    mov         eax,ebx
 0071C018    call        @WStrFromUStr
>0071C01D    jmp         0071C0ED
 0071C022    lea         edx,[ebp-0BC]
 0071C028    mov         eax,71C67C;'Repeat'
 0071C02D    call        00575428
 0071C032    mov         edx,dword ptr [ebp-0BC]
 0071C038    mov         eax,ebx
 0071C03A    call        @WStrFromUStr
>0071C03F    jmp         0071C0ED
 0071C044    lea         edx,[ebp-0C0]
 0071C04A    mov         eax,71C698;'Until'
 0071C04F    call        00575428
 0071C054    mov         edx,dword ptr [ebp-0C0]
 0071C05A    mov         eax,ebx
 0071C05C    call        @WStrFromUStr
>0071C061    jmp         0071C0ED
 0071C066    lea         edx,[ebp-0C4]
 0071C06C    mov         eax,71C6B0;'bis'
 0071C071    call        00575428
 0071C076    mov         edx,dword ptr [ebp-0C4]
 0071C07C    mov         eax,ebx
 0071C07E    call        @WStrFromUStr
>0071C083    jmp         0071C0ED
 0071C085    lea         edx,[ebp-0C8]
 0071C08B    mov         eax,71C6C4;'den'
 0071C090    call        00575428
 0071C095    mov         edx,dword ptr [ebp-0C8]
 0071C09B    mov         eax,ebx
 0071C09D    call        @WStrFromUStr
>0071C0A2    jmp         0071C0ED
 0071C0A4    lea         edx,[ebp-0CC]
 0071C0AA    mov         eax,71C6D8;'per'
 0071C0AF    call        00575428
 0071C0B4    mov         edx,dword ptr [ebp-0CC]
 0071C0BA    mov         eax,ebx
 0071C0BC    call        @WStrFromUStr
>0071C0C1    jmp         0071C0ED
 0071C0C3    mov         eax,ebx
 0071C0C5    mov         edx,dword ptr [ebp-14]
 0071C0C8    call        @WStrFromUStr
>0071C0CD    jmp         0071C0ED
 0071C0CF    mov         eax,ebx
 0071C0D1    mov         edx,71C6E4;#13+#10
 0071C0D6    call        @WStrAsg
>0071C0DB    jmp         0071C0ED
 0071C0DD    mov         eax,ebx
 0071C0DF    call        @WStrClr
>0071C0E4    jmp         0071C0ED
 0071C0E6    mov         eax,ebx
 0071C0E8    call        @WStrClr
 0071C0ED    xor         eax,eax
 0071C0EF    pop         edx
 0071C0F0    pop         ecx
 0071C0F1    pop         ecx
 0071C0F2    mov         dword ptr fs:[eax],edx
 0071C0F5    push        71C12D
 0071C0FA    lea         eax,[ebp-0CC]
 0071C100    mov         edx,20
 0071C105    call        @UStrArrayClr
 0071C10A    lea         eax,[ebp-48]
 0071C10D    mov         edx,0C
 0071C112    call        @UStrArrayClr
 0071C117    lea         eax,[ebp-18]
 0071C11A    mov         edx,dword ptr ds:[576E48];TToken
 0071C120    call        @FinalizeRecord
 0071C125    ret
>0071C126    jmp         @HandleFinally
>0071C12B    jmp         0071C0FA
 0071C12D    pop         edi
 0071C12E    pop         esi
 0071C12F    pop         ebx
 0071C130    mov         esp,ebp
 0071C132    pop         ebp
 0071C133    ret
end;*}

//0071C6EC
{*procedure sub_0071C6EC(?:TToken; ?:?);
begin
 0071C6EC    push        ebp
 0071C6ED    mov         ebp,esp
 0071C6EF    mov         ecx,8
 0071C6F4    push        0
 0071C6F6    push        0
 0071C6F8    dec         ecx
>0071C6F9    jne         0071C6F4
 0071C6FB    push        ebx
 0071C6FC    push        esi
 0071C6FD    push        edi
 0071C6FE    mov         esi,eax
 0071C700    lea         edi,[ebp-18]
 0071C703    mov         ecx,6
 0071C708    rep movs    dword ptr [edi],dword ptr [esi]
 0071C70A    mov         ebx,edx
 0071C70C    lea         eax,[ebp-18]
 0071C70F    mov         edx,dword ptr ds:[576E48];TToken
 0071C715    call        @AddRefRecord
 0071C71A    xor         eax,eax
 0071C71C    push        ebp
 0071C71D    push        71D1B4
 0071C722    push        dword ptr fs:[eax]
 0071C725    mov         dword ptr fs:[eax],esp
 0071C728    movzx       eax,byte ptr [ebp-18]
 0071C72C    cmp         eax,6D
>0071C72F    ja          0071D177
 0071C735    jmp         dword ptr [eax*4+71C73C]
 0071C735    dd          0071D177
 0071C735    dd          0071C8F4
 0071C735    dd          0071C903
 0071C735    dd          0071C912
 0071C735    dd          0071C92C
 0071C735    dd          0071C946
 0071C735    dd          0071C960
 0071C735    dd          0071C989
 0071C735    dd          0071C9A8
 0071C735    dd          0071C9B7
 0071C735    dd          0071C9C6
 0071C735    dd          0071C9E5
 0071C735    dd          0071C9F6
 0071C735    dd          0071CA07
 0071C735    dd          0071CA18
 0071C735    dd          0071D177
 0071C735    dd          0071CA29
 0071C735    dd          0071CA3A
 0071C735    dd          0071CA4B
 0071C735    dd          0071CA5C
 0071C735    dd          0071CA6D
 0071C735    dd          0071CA7E
 0071C735    dd          0071CA8F
 0071C735    dd          0071CAA0
 0071C735    dd          0071CAB1
 0071C735    dd          0071CAC2
 0071C735    dd          0071CAD3
 0071C735    dd          0071CAE4
 0071C735    dd          0071CAF5
 0071C735    dd          0071CB06
 0071C735    dd          0071CB8F
 0071C735    dd          0071CC18
 0071C735    dd          0071CC29
 0071C735    dd          0071CCB2
 0071C735    dd          0071CCC3
 0071C735    dd          0071CCD4
 0071C735    dd          0071CCE5
 0071C735    dd          0071CCF6
 0071C735    dd          0071CD07
 0071C735    dd          0071CD18
 0071C735    dd          0071CD29
 0071C735    dd          0071CD3A
 0071C735    dd          0071CD4B
 0071C735    dd          0071CD5C
 0071C735    dd          0071CD6D
 0071C735    dd          0071CD7E
 0071C735    dd          0071CD8F
 0071C735    dd          0071CDA0
 0071C735    dd          0071CDB1
 0071C735    dd          0071CDC2
 0071C735    dd          0071CDD3
 0071C735    dd          0071CDE4
 0071C735    dd          0071CDF5
 0071C735    dd          0071CE06
 0071C735    dd          0071D177
 0071C735    dd          0071CE17
 0071C735    dd          0071CE28
 0071C735    dd          0071CE39
 0071C735    dd          0071CE4A
 0071C735    dd          0071CE5B
 0071C735    dd          0071CE6C
 0071C735    dd          0071CE7D
 0071C735    dd          0071CE8E
 0071C735    dd          0071CE9F
 0071C735    dd          0071CEB0
 0071C735    dd          0071CEC1
 0071C735    dd          0071CED2
 0071C735    dd          0071CEE3
 0071C735    dd          0071CEF4
 0071C735    dd          0071CF05
 0071C735    dd          0071CF16
 0071C735    dd          0071CF27
 0071C735    dd          0071CF38
 0071C735    dd          0071CF49
 0071C735    dd          0071CF5A
 0071C735    dd          0071CF6B
 0071C735    dd          0071CF7C
 0071C735    dd          0071CFC0
 0071C735    dd          0071D004
 0071C735    dd          0071D015
 0071C735    dd          0071CF8D
 0071C735    dd          0071CFD1
 0071C735    dd          0071D177
 0071C735    dd          0071D177
 0071C735    dd          0071CF9E
 0071C735    dd          0071CFAF
 0071C735    dd          0071CFF3
 0071C735    dd          0071CFE2
 0071C735    dd          0071D026
 0071C735    dd          0071D037
 0071C735    dd          0071D048
 0071C735    dd          0071D059
 0071C735    dd          0071D06A
 0071C735    dd          0071D07B
 0071C735    dd          0071D08C
 0071C735    dd          0071D09D
 0071C735    dd          0071D0AE
 0071C735    dd          0071D0BF
 0071C735    dd          0071D0D0
 0071C735    dd          0071D0E1
 0071C735    dd          0071D0F2
 0071C735    dd          0071D100
 0071C735    dd          0071D10E
 0071C735    dd          0071D11C
 0071C735    dd          0071D12A
 0071C735    dd          0071D138
 0071C735    dd          0071D146
 0071C735    dd          0071D154
 0071C735    dd          0071D160
 0071C735    dd          0071D16E
 0071C8F4    mov         eax,ebx
 0071C8F6    mov         edx,dword ptr [ebp-14]
 0071C8F9    call        @WStrFromUStr
>0071C8FE    jmp         0071D17E
 0071C903    mov         eax,ebx
 0071C905    mov         edx,dword ptr [ebp-14]
 0071C908    call        @WStrFromUStr
>0071C90D    jmp         0071D17E
 0071C912    lea         edx,[ebp-1C]
 0071C915    mov         eax,dword ptr [ebp-14]
 0071C918    call        00575C90
 0071C91D    mov         edx,dword ptr [ebp-1C]
 0071C920    mov         eax,ebx
 0071C922    call        @WStrFromUStr
>0071C927    jmp         0071D17E
 0071C92C    lea         edx,[ebp-20]
 0071C92F    mov         eax,dword ptr [ebp-14]
 0071C932    call        00575C90
 0071C937    mov         edx,dword ptr [ebp-20]
 0071C93A    mov         eax,ebx
 0071C93C    call        @WStrFromUStr
>0071C941    jmp         0071D17E
 0071C946    lea         edx,[ebp-24]
 0071C949    mov         eax,dword ptr [ebp-14]
 0071C94C    call        00575518
 0071C951    mov         edx,dword ptr [ebp-24]
 0071C954    mov         eax,ebx
 0071C956    call        @WStrFromUStr
>0071C95B    jmp         0071D17E
 0071C960    push        71D1D0;'"'
 0071C965    push        dword ptr [ebp-14]
 0071C968    push        71D1D0;'"'
 0071C96D    lea         eax,[ebp-28]
 0071C970    mov         edx,3
 0071C975    call        @UStrCatN
 0071C97A    mov         edx,dword ptr [ebp-28]
 0071C97D    mov         eax,ebx
 0071C97F    call        @WStrFromUStr
>0071C984    jmp         0071D17E
 0071C989    lea         eax,[ebp-2C]
 0071C98C    mov         ecx,dword ptr [ebp-14]
 0071C98F    mov         edx,71D1D0;'"'
 0071C994    call        @UStrCat3
 0071C999    mov         edx,dword ptr [ebp-2C]
 0071C99C    mov         eax,ebx
 0071C99E    call        @WStrFromUStr
>0071C9A3    jmp         0071D17E
 0071C9A8    mov         eax,ebx
 0071C9AA    mov         edx,dword ptr [ebp-14]
 0071C9AD    call        @WStrFromUStr
>0071C9B2    jmp         0071D17E
 0071C9B7    mov         eax,ebx
 0071C9B9    mov         edx,dword ptr [ebp-14]
 0071C9BC    call        @WStrFromUStr
>0071C9C1    jmp         0071D17E
 0071C9C6    lea         eax,[ebp-30]
 0071C9C9    mov         ecx,dword ptr [ebp-14]
 0071C9CC    mov         edx,71D1E0;'0x'
 0071C9D1    call        @UStrCat3
 0071C9D6    mov         edx,dword ptr [ebp-30]
 0071C9D9    mov         eax,ebx
 0071C9DB    call        @WStrFromUStr
>0071C9E0    jmp         0071D17E
 0071C9E5    mov         eax,ebx
 0071C9E7    mov         edx,71D1EC;'True'
 0071C9EC    call        @WStrAsg
>0071C9F1    jmp         0071D17E
 0071C9F6    mov         eax,ebx
 0071C9F8    mov         edx,71D1FC;'False'
 0071C9FD    call        @WStrAsg
>0071CA02    jmp         0071D17E
 0071CA07    mov         eax,ebx
 0071CA09    mov         edx,71D20C;'Nil'
 0071CA0E    call        @WStrAsg
>0071CA13    jmp         0071D17E
 0071CA18    mov         eax,ebx
 0071CA1A    mov         edx,71D218;'NULL'
 0071CA1F    call        @WStrAsg
>0071CA24    jmp         0071D17E
 0071CA29    mov         eax,ebx
 0071CA2B    mov         edx,71D228;'('
 0071CA30    call        @WStrAsg
>0071CA35    jmp         0071D17E
 0071CA3A    mov         eax,ebx
 0071CA3C    mov         edx,71D230;')'
 0071CA41    call        @WStrAsg
>0071CA46    jmp         0071D17E
 0071CA4B    mov         eax,ebx
 0071CA4D    mov         edx,71D238;'['
 0071CA52    call        @WStrAsg
>0071CA57    jmp         0071D17E
 0071CA5C    mov         eax,ebx
 0071CA5E    mov         edx,71D240;']'
 0071CA63    call        @WStrAsg
>0071CA68    jmp         0071D17E
 0071CA6D    mov         eax,ebx
 0071CA6F    mov         edx,71D248;'{'
 0071CA74    call        @WStrAsg
>0071CA79    jmp         0071D17E
 0071CA7E    mov         eax,ebx
 0071CA80    mov         edx,71D250;'}'
 0071CA85    call        @WStrAsg
>0071CA8A    jmp         0071D17E
 0071CA8F    mov         eax,ebx
 0071CA91    mov         edx,71D258;','
 0071CA96    call        @WStrAsg
>0071CA9B    jmp         0071D17E
 0071CAA0    mov         eax,ebx
 0071CAA2    mov         edx,71D260;';'
 0071CAA7    call        @WStrAsg
>0071CAAC    jmp         0071D17E
 0071CAB1    mov         eax,ebx
 0071CAB3    mov         edx,71D268;':'
 0071CAB8    call        @WStrAsg
>0071CABD    jmp         0071D17E
 0071CAC2    mov         eax,ebx
 0071CAC4    mov         edx,71D270;'?'
 0071CAC9    call        @WStrAsg
>0071CACE    jmp         0071D17E
 0071CAD3    mov         eax,ebx
 0071CAD5    mov         edx,71D278;'...'
 0071CADA    call        @WStrAsg
>0071CADF    jmp         0071D17E
 0071CAE4    mov         eax,ebx
 0071CAE6    mov         edx,71D284;'..'
 0071CAEB    call        @WStrAsg
>0071CAF0    jmp         0071D17E
 0071CAF5    mov         eax,ebx
 0071CAF7    mov         edx,71D290;'.'
 0071CAFC    call        @WStrAsg
>0071CB01    jmp         0071D17E
 0071CB06    lea         edx,[ebp-34]
 0071CB09    mov         eax,71D2A0;'.'
 0071CB0E    call        00575518
 0071CB13    mov         edx,dword ptr [ebp-34]
 0071CB16    mov         eax,ebx
 0071CB18    call        @WStrFromUStr
 0071CB1D    mov         eax,dword ptr [ebx]
 0071CB1F    xor         edx,edx
 0071CB21    call        @WStrEqual
>0071CB26    je          0071CB7E
 0071CB28    mov         eax,dword ptr [ebx]
 0071CB2A    movzx       eax,word ptr [eax]
 0071CB2D    call        00710C0C
 0071CB32    test        al,al
>0071CB34    je          0071CB44
 0071CB36    mov         ecx,dword ptr [ebx]
 0071CB38    mov         eax,ebx
 0071CB3A    mov         edx,71D2A8;' '
 0071CB3F    call        @WStrCat3
 0071CB44    mov         eax,dword ptr [ebx]
 0071CB46    mov         dword ptr [ebp-38],eax
 0071CB49    mov         esi,dword ptr [ebp-38]
 0071CB4C    test        esi,esi
>0071CB4E    je          0071CB59
 0071CB50    sub         esi,4
 0071CB53    mov         eax,dword ptr [esi]
 0071CB55    shr         eax,1
 0071CB57    mov         esi,eax
 0071CB59    mov         eax,dword ptr [ebx]
 0071CB5B    movzx       eax,word ptr [eax+esi*2-2]
 0071CB60    call        00710C0C
 0071CB65    test        al,al
>0071CB67    je          0071D17E
 0071CB6D    mov         eax,ebx
 0071CB6F    mov         edx,71D2A8;' '
 0071CB74    call        @WStrCat
>0071CB79    jmp         0071D17E
 0071CB7E    mov         eax,ebx
 0071CB80    mov         edx,71D290;'.'
 0071CB85    call        @WStrAsg
>0071CB8A    jmp         0071D17E
 0071CB8F    lea         edx,[ebp-3C]
 0071CB92    mov         eax,71D2B8;'''s'
 0071CB97    call        00575518
 0071CB9C    mov         edx,dword ptr [ebp-3C]
 0071CB9F    mov         eax,ebx
 0071CBA1    call        @WStrFromUStr
 0071CBA6    mov         eax,dword ptr [ebx]
 0071CBA8    xor         edx,edx
 0071CBAA    call        @WStrEqual
>0071CBAF    je          0071CC07
 0071CBB1    mov         eax,dword ptr [ebx]
 0071CBB3    movzx       eax,word ptr [eax]
 0071CBB6    call        00710C0C
 0071CBBB    test        al,al
>0071CBBD    je          0071CBCD
 0071CBBF    mov         ecx,dword ptr [ebx]
 0071CBC1    mov         eax,ebx
 0071CBC3    mov         edx,71D2A8;' '
 0071CBC8    call        @WStrCat3
 0071CBCD    mov         eax,dword ptr [ebx]
 0071CBCF    mov         dword ptr [ebp-38],eax
 0071CBD2    mov         esi,dword ptr [ebp-38]
 0071CBD5    test        esi,esi
>0071CBD7    je          0071CBE2
 0071CBD9    sub         esi,4
 0071CBDC    mov         eax,dword ptr [esi]
 0071CBDE    shr         eax,1
 0071CBE0    mov         esi,eax
 0071CBE2    mov         eax,dword ptr [ebx]
 0071CBE4    movzx       eax,word ptr [eax+esi*2-2]
 0071CBE9    call        00710C0C
 0071CBEE    test        al,al
>0071CBF0    je          0071D17E
 0071CBF6    mov         eax,ebx
 0071CBF8    mov         edx,71D2A8;' '
 0071CBFD    call        @WStrCat
>0071CC02    jmp         0071D17E
 0071CC07    mov         eax,ebx
 0071CC09    mov         edx,71D290;'.'
 0071CC0E    call        @WStrAsg
>0071CC13    jmp         0071D17E
 0071CC18    mov         eax,ebx
 0071CC1A    mov         edx,71D2C4;'of'
 0071CC1F    call        @WStrAsg
>0071CC24    jmp         0071D17E
 0071CC29    lea         edx,[ebp-40]
 0071CC2C    mov         eax,71D2D8;'::'
 0071CC31    call        00575518
 0071CC36    mov         edx,dword ptr [ebp-40]
 0071CC39    mov         eax,ebx
 0071CC3B    call        @WStrFromUStr
 0071CC40    mov         eax,dword ptr [ebx]
 0071CC42    xor         edx,edx
 0071CC44    call        @WStrEqual
>0071CC49    je          0071CCA1
 0071CC4B    mov         eax,dword ptr [ebx]
 0071CC4D    movzx       eax,word ptr [eax]
 0071CC50    call        00710C0C
 0071CC55    test        al,al
>0071CC57    je          0071CC67
 0071CC59    mov         ecx,dword ptr [ebx]
 0071CC5B    mov         eax,ebx
 0071CC5D    mov         edx,71D2A8;' '
 0071CC62    call        @WStrCat3
 0071CC67    mov         eax,dword ptr [ebx]
 0071CC69    mov         dword ptr [ebp-38],eax
 0071CC6C    mov         esi,dword ptr [ebp-38]
 0071CC6F    test        esi,esi
>0071CC71    je          0071CC7C
 0071CC73    sub         esi,4
 0071CC76    mov         eax,dword ptr [esi]
 0071CC78    shr         eax,1
 0071CC7A    mov         esi,eax
 0071CC7C    mov         eax,dword ptr [ebx]
 0071CC7E    movzx       eax,word ptr [eax+esi*2-2]
 0071CC83    call        00710C0C
 0071CC88    test        al,al
>0071CC8A    je          0071D17E
 0071CC90    mov         eax,ebx
 0071CC92    mov         edx,71D2A8;' '
 0071CC97    call        @WStrCat
>0071CC9C    jmp         0071D17E
 0071CCA1    mov         eax,ebx
 0071CCA3    mov         edx,71D2E4;'::'
 0071CCA8    call        @WStrAsg
>0071CCAD    jmp         0071D17E
 0071CCB2    mov         eax,ebx
 0071CCB4    mov         edx,71D2F0;'->'
 0071CCB9    call        @WStrAsg
>0071CCBE    jmp         0071D17E
 0071CCC3    mov         eax,ebx
 0071CCC5    mov         edx,71D2FC;'+'
 0071CCCA    call        @WStrAsg
>0071CCCF    jmp         0071D17E
 0071CCD4    mov         eax,ebx
 0071CCD6    mov         edx,71D304;'-'
 0071CCDB    call        @WStrAsg
>0071CCE0    jmp         0071D17E
 0071CCE5    mov         eax,ebx
 0071CCE7    mov         edx,71D30C;'*'
 0071CCEC    call        @WStrAsg
>0071CCF1    jmp         0071D17E
 0071CCF6    mov         eax,ebx
 0071CCF8    mov         edx,71D314;'/'
 0071CCFD    call        @WStrAsg
>0071CD02    jmp         0071D17E
 0071CD07    mov         eax,ebx
 0071CD09    mov         edx,71D31C;'div'
 0071CD0E    call        @WStrAsg
>0071CD13    jmp         0071D17E
 0071CD18    mov         eax,ebx
 0071CD1A    mov         edx,71D328;'mod'
 0071CD1F    call        @WStrAsg
>0071CD24    jmp         0071D17E
 0071CD29    mov         eax,ebx
 0071CD2B    mov         edx,71D334;'<<'
 0071CD30    call        @WStrAsg
>0071CD35    jmp         0071D17E
 0071CD3A    mov         eax,ebx
 0071CD3C    mov         edx,71D340;'>>'
 0071CD41    call        @WStrAsg
>0071CD46    jmp         0071D17E
 0071CD4B    mov         eax,ebx
 0071CD4D    mov         edx,71D34C;'@'
 0071CD52    call        @WStrAsg
>0071CD57    jmp         0071D17E
 0071CD5C    mov         eax,ebx
 0071CD5E    mov         edx,71D354;'&'
 0071CD63    call        @WStrAsg
>0071CD68    jmp         0071D17E
 0071CD6D    mov         eax,ebx
 0071CD6F    mov         edx,71D35C;'^'
 0071CD74    call        @WStrAsg
>0071CD79    jmp         0071D17E
 0071CD7E    mov         eax,ebx
 0071CD80    mov         edx,71D364;'**'
 0071CD85    call        @WStrAsg
>0071CD8A    jmp         0071D17E
 0071CD8F    mov         eax,ebx
 0071CD91    mov         edx,71D370;'%'
 0071CD96    call        @WStrAsg
>0071CD9B    jmp         0071D17E
 0071CDA0    mov         eax,ebx
 0071CDA2    mov         edx,71D378;'!'
 0071CDA7    call        @WStrAsg
>0071CDAC    jmp         0071D17E
 0071CDB1    mov         eax,ebx
 0071CDB3    mov         edx,71D380;'!!'
 0071CDB8    call        @WStrAsg
>0071CDBD    jmp         0071D17E
 0071CDC2    mov         eax,ebx
 0071CDC4    mov         edx,71D38C;'.+'
 0071CDC9    call        @WStrAsg
>0071CDCE    jmp         0071D17E
 0071CDD3    mov         eax,ebx
 0071CDD5    mov         edx,71D398;'.-'
 0071CDDA    call        @WStrAsg
>0071CDDF    jmp         0071D17E
 0071CDE4    mov         eax,ebx
 0071CDE6    mov         edx,71D3A4;'.*'
 0071CDEB    call        @WStrAsg
>0071CDF0    jmp         0071D17E
 0071CDF5    mov         eax,ebx
 0071CDF7    mov         edx,71D3B0;'./'
 0071CDFC    call        @WStrAsg
>0071CE01    jmp         0071D17E
 0071CE06    mov         eax,ebx
 0071CE08    mov         edx,71D3BC;'.^'
 0071CE0D    call        @WStrAsg
>0071CE12    jmp         0071D17E
 0071CE17    mov         eax,ebx
 0071CE19    mov         edx,71D3C8;'.='
 0071CE1E    call        @WStrAsg
>0071CE23    jmp         0071D17E
 0071CE28    mov         eax,ebx
 0071CE2A    mov         edx,71D3D4;':='
 0071CE2F    call        @WStrAsg
>0071CE34    jmp         0071D17E
 0071CE39    mov         eax,ebx
 0071CE3B    mov         edx,71D3E0;'+='
 0071CE40    call        @WStrAsg
>0071CE45    jmp         0071D17E
 0071CE4A    mov         eax,ebx
 0071CE4C    mov         edx,71D3EC;'-='
 0071CE51    call        @WStrAsg
>0071CE56    jmp         0071D17E
 0071CE5B    mov         eax,ebx
 0071CE5D    mov         edx,71D3F8;'*='
 0071CE62    call        @WStrAsg
>0071CE67    jmp         0071D17E
 0071CE6C    mov         eax,ebx
 0071CE6E    mov         edx,71D404;'/='
 0071CE73    call        @WStrAsg
>0071CE78    jmp         0071D17E
 0071CE7D    mov         eax,ebx
 0071CE7F    mov         edx,71D410;'++'
 0071CE84    call        @WStrAsg
>0071CE89    jmp         0071D17E
 0071CE8E    mov         eax,ebx
 0071CE90    mov         edx,71D41C;'--'
 0071CE95    call        @WStrAsg
>0071CE9A    jmp         0071D17E
 0071CE9F    mov         eax,ebx
 0071CEA1    mov         edx,71D428;'=>'
 0071CEA6    call        @WStrAsg
>0071CEAB    jmp         0071D17E
 0071CEB0    mov         eax,ebx
 0071CEB2    mov         edx,71D434;'or'
 0071CEB7    call        @WStrAsg
>0071CEBC    jmp         0071D17E
 0071CEC1    mov         eax,ebx
 0071CEC3    mov         edx,71D440;'and'
 0071CEC8    call        @WStrAsg
>0071CECD    jmp         0071D17E
 0071CED2    mov         eax,ebx
 0071CED4    mov         edx,71D44C;'XOR'
 0071CED9    call        @WStrAsg
>0071CEDE    jmp         0071D17E
 0071CEE3    mov         eax,ebx
 0071CEE5    mov         edx,71D458;'not'
 0071CEEA    call        @WStrAsg
>0071CEEF    jmp         0071D17E
 0071CEF4    mov         eax,ebx
 0071CEF6    mov         edx,71D464;'but'
 0071CEFB    call        @WStrAsg
>0071CF00    jmp         0071D17E
 0071CF05    mov         eax,ebx
 0071CF07    mov         edx,71D470;'either'
 0071CF0C    call        @WStrAsg
>0071CF11    jmp         0071D17E
 0071CF16    mov         eax,ebx
 0071CF18    mov         edx,71D484;'neither'
 0071CF1D    call        @WStrAsg
>0071CF22    jmp         0071D17E
 0071CF27    mov         eax,ebx
 0071CF29    mov         edx,71D498;'nor'
 0071CF2E    call        @WStrAsg
>0071CF33    jmp         0071D17E
 0071CF38    mov         eax,ebx
 0071CF3A    mov         edx,71D4A4;'&&'
 0071CF3F    call        @WStrAsg
>0071CF44    jmp         0071D17E
 0071CF49    mov         eax,ebx
 0071CF4B    mov         edx,71D4B0;'||'
 0071CF50    call        @WStrAsg
>0071CF55    jmp         0071D17E
 0071CF5A    mov         eax,ebx
 0071CF5C    mov         edx,71D4BC;'|'
 0071CF61    call        @WStrAsg
>0071CF66    jmp         0071D17E
 0071CF6B    mov         eax,ebx
 0071CF6D    mov         edx,71D4C4;'='
 0071CF72    call        @WStrAsg
>0071CF77    jmp         0071D17E
 0071CF7C    mov         eax,ebx
 0071CF7E    mov         edx,71D4CC;'<'
 0071CF83    call        @WStrAsg
>0071CF88    jmp         0071D17E
 0071CF8D    mov         eax,ebx
 0071CF8F    mov         edx,71D4D4;'<='
 0071CF94    call        @WStrAsg
>0071CF99    jmp         0071D17E
 0071CF9E    mov         eax,ebx
 0071CFA0    mov         edx,71D4E0;'~<'
 0071CFA5    call        @WStrAsg
>0071CFAA    jmp         0071D17E
 0071CFAF    mov         eax,ebx
 0071CFB1    mov         edx,71D4EC;'~<='
 0071CFB6    call        @WStrAsg
>0071CFBB    jmp         0071D17E
 0071CFC0    mov         eax,ebx
 0071CFC2    mov         edx,71D4F8;'>'
 0071CFC7    call        @WStrAsg
>0071CFCC    jmp         0071D17E
 0071CFD1    mov         eax,ebx
 0071CFD3    mov         edx,71D500;'>='
 0071CFD8    call        @WStrAsg
>0071CFDD    jmp         0071D17E
 0071CFE2    mov         eax,ebx
 0071CFE4    mov         edx,71D50C;'~>'
 0071CFE9    call        @WStrAsg
>0071CFEE    jmp         0071D17E
 0071CFF3    mov         eax,ebx
 0071CFF5    mov         edx,71D518;'~>='
 0071CFFA    call        @WStrAsg
>0071CFFF    jmp         0071D17E
 0071D004    mov         eax,ebx
 0071D006    mov         edx,71D524;'=='
 0071D00B    call        @WStrAsg
>0071D010    jmp         0071D17E
 0071D015    mov         eax,ebx
 0071D017    mov         edx,71D530;'!='
 0071D01C    call        @WStrAsg
>0071D021    jmp         0071D17E
 0071D026    mov         eax,ebx
 0071D028    mov         edx,71D53C;'~'
 0071D02D    call        @WStrAsg
>0071D032    jmp         0071D17E
 0071D037    mov         eax,ebx
 0071D039    mov         edx,71D544;'do'
 0071D03E    call        @WStrAsg
>0071D043    jmp         0071D17E
 0071D048    mov         eax,ebx
 0071D04A    mov         edx,71D550;'to'
 0071D04F    call        @WStrAsg
>0071D054    jmp         0071D17E
 0071D059    mov         eax,ebx
 0071D05B    mov         edx,71D55C;'is'
 0071D060    call        @WStrAsg
>0071D065    jmp         0071D17E
 0071D06A    mov         eax,ebx
 0071D06C    mov         edx,71D568;'isn't'
 0071D071    call        @WStrAsg
>0071D076    jmp         0071D17E
 0071D07B    mov         eax,ebx
 0071D07D    mov         edx,71D578;'End'
 0071D082    call        @WStrAsg
>0071D087    jmp         0071D17E
 0071D08C    mov         eax,ebx
 0071D08E    mov         edx,71D584;'in'
 0071D093    call        @WStrAsg
>0071D098    jmp         0071D17E
 0071D09D    mov         eax,ebx
 0071D09F    mov         edx,71D590;'If'
 0071D0A4    call        @WStrAsg
>0071D0A9    jmp         0071D17E
 0071D0AE    mov         eax,ebx
 0071D0B0    mov         edx,71D59C;'Then'
 0071D0B5    call        @WStrAsg
>0071D0BA    jmp         0071D17E
 0071D0BF    mov         eax,ebx
 0071D0C1    mov         edx,71D5AC;'Else'
 0071D0C6    call        @WStrAsg
>0071D0CB    jmp         0071D17E
 0071D0D0    mov         eax,ebx
 0071D0D2    mov         edx,71D5BC;'Elseif'
 0071D0D7    call        @WStrAsg
>0071D0DC    jmp         0071D17E
 0071D0E1    mov         eax,ebx
 0071D0E3    mov         edx,71D5D0;'Endif'
 0071D0E8    call        @WStrAsg
>0071D0ED    jmp         0071D17E
 0071D0F2    mov         eax,ebx
 0071D0F4    mov         edx,71D5E0;'While'
 0071D0F9    call        @WStrAsg
>0071D0FE    jmp         0071D17E
 0071D100    mov         eax,ebx
 0071D102    mov         edx,71D5F0;'For'
 0071D107    call        @WStrAsg
>0071D10C    jmp         0071D17E
 0071D10E    mov         eax,ebx
 0071D110    mov         edx,71D5FC;'Repeat'
 0071D115    call        @WStrAsg
>0071D11A    jmp         0071D17E
 0071D11C    mov         eax,ebx
 0071D11E    mov         edx,71D610;'Until'
 0071D123    call        @WStrAsg
>0071D128    jmp         0071D17E
 0071D12A    mov         eax,ebx
 0071D12C    mov         edx,71D620;'bis'
 0071D131    call        @WStrAsg
>0071D136    jmp         0071D17E
 0071D138    mov         eax,ebx
 0071D13A    mov         edx,71D62C;'den'
 0071D13F    call        @WStrAsg
>0071D144    jmp         0071D17E
 0071D146    mov         eax,ebx
 0071D148    mov         edx,71D638;'per'
 0071D14D    call        @WStrAsg
>0071D152    jmp         0071D17E
 0071D154    mov         eax,ebx
 0071D156    mov         edx,dword ptr [ebp-14]
 0071D159    call        @WStrFromUStr
>0071D15E    jmp         0071D17E
 0071D160    mov         eax,ebx
 0071D162    mov         edx,71D644;#13+#10
 0071D167    call        @WStrAsg
>0071D16C    jmp         0071D17E
 0071D16E    mov         eax,ebx
 0071D170    call        @WStrClr
>0071D175    jmp         0071D17E
 0071D177    mov         eax,ebx
 0071D179    call        @WStrClr
 0071D17E    xor         eax,eax
 0071D180    pop         edx
 0071D181    pop         ecx
 0071D182    pop         ecx
 0071D183    mov         dword ptr fs:[eax],edx
 0071D186    push        71D1BB
 0071D18B    lea         eax,[ebp-40]
 0071D18E    mov         edx,2
 0071D193    call        @UStrArrayClr
 0071D198    lea         eax,[ebp-34]
 0071D19B    mov         edx,7
 0071D1A0    call        @UStrArrayClr
 0071D1A5    lea         eax,[ebp-18]
 0071D1A8    mov         edx,dword ptr ds:[576E48];TToken
 0071D1AE    call        @FinalizeRecord
 0071D1B3    ret
>0071D1B4    jmp         @HandleFinally
>0071D1B9    jmp         0071D18B
 0071D1BB    pop         edi
 0071D1BC    pop         esi
 0071D1BD    pop         ebx
 0071D1BE    mov         esp,ebp
 0071D1C0    pop         ebp
 0071D1C1    ret
end;*}

//0071D64C
{*procedure sub_0071D64C(?:WideString; ?:?);
begin
 0071D64C    push        ebp
 0071D64D    mov         ebp,esp
 0071D64F    add         esp,0FFFFFFF0
 0071D652    push        ebx
 0071D653    push        esi
 0071D654    xor         ecx,ecx
 0071D656    mov         dword ptr [ebp-10],ecx
 0071D659    mov         dword ptr [ebp-0C],ecx
 0071D65C    mov         esi,edx
 0071D65E    mov         dword ptr [ebp-4],eax
 0071D661    lea         eax,[ebp-4]
 0071D664    call        @WStrAddRef
 0071D669    xor         eax,eax
 0071D66B    push        ebp
 0071D66C    push        71D762
 0071D671    push        dword ptr fs:[eax]
 0071D674    mov         dword ptr fs:[eax],esp
 0071D677    mov         eax,[0078D324];^gvar_00815558:UnicodeString
 0071D67C    cmp         dword ptr [eax],0
>0071D67F    jne         0071D690
 0071D681    mov         eax,esi
 0071D683    mov         edx,dword ptr [ebp-4]
 0071D686    call        @WStrAsg
>0071D68B    jmp         0071D73C
 0071D690    mov         eax,esi
 0071D692    call        @WStrClr
 0071D697    lea         eax,[ebp-0C]
 0071D69A    mov         edx,dword ptr [ebp-4]
 0071D69D    call        @UStrFromWStr
 0071D6A2    mov         ecx,dword ptr [ebp-0C]
 0071D6A5    mov         dl,1
 0071D6A7    mov         eax,[005770A4];TScanner
 0071D6AC    call        TScanner.Create;TScanner.Create
 0071D6B1    mov         dword ptr [ebp-8],eax
 0071D6B4    xor         eax,eax
 0071D6B6    push        ebp
 0071D6B7    push        71D735
 0071D6BC    push        dword ptr fs:[eax]
 0071D6BF    mov         dword ptr fs:[eax],esp
 0071D6C2    mov         eax,dword ptr [ebp-8]
 0071D6C5    mov         byte ptr [eax+28],1;TScanner.ScanWhiteSpace:Boolean
 0071D6C9    mov         eax,dword ptr [ebp-8]
 0071D6CC    call        TScanner.Reset
>0071D6D1    jmp         0071D716
 0071D6D3    lea         edx,[ebp-10]
 0071D6D6    mov         eax,dword ptr [ebp-8]
 0071D6D9    add         eax,8;TScanner.token:TToken
 0071D6DC    call        0071C6EC
 0071D6E1    mov         edx,dword ptr [ebp-10]
 0071D6E4    mov         eax,esi
 0071D6E6    call        @WStrCat
 0071D6EB    mov         eax,dword ptr [ebp-8]
 0071D6EE    cmp         byte ptr [eax+8],16;TScanner.token:TToken
 0071D6F2    sete        bl
 0071D6F5    mov         eax,dword ptr [ebp-8]
 0071D6F8    call        TScanner.Next
 0071D6FD    test        bl,bl
>0071D6FF    je          0071D716
 0071D701    mov         eax,dword ptr [ebp-8]
 0071D704    cmp         byte ptr [eax+8],1;TScanner.token:TToken
>0071D708    je          0071D716
 0071D70A    mov         eax,esi
 0071D70C    mov         edx,71D774;' '
 0071D711    call        @WStrCat
 0071D716    mov         eax,dword ptr [ebp-8]
 0071D719    cmp         byte ptr [eax+8],6D;TScanner.token:TToken
>0071D71D    jne         0071D6D3
 0071D71F    xor         eax,eax
 0071D721    pop         edx
 0071D722    pop         ecx
 0071D723    pop         ecx
 0071D724    mov         dword ptr fs:[eax],edx
 0071D727    push        71D73C
 0071D72C    mov         eax,dword ptr [ebp-8]
 0071D72F    call        TObject.Free
 0071D734    ret
>0071D735    jmp         @HandleFinally
>0071D73A    jmp         0071D72C
 0071D73C    xor         eax,eax
 0071D73E    pop         edx
 0071D73F    pop         ecx
 0071D740    pop         ecx
 0071D741    mov         dword ptr fs:[eax],edx
 0071D744    push        71D769
 0071D749    lea         eax,[ebp-10]
 0071D74C    call        @WStrClr
 0071D751    lea         eax,[ebp-0C]
 0071D754    call        @UStrClr
 0071D759    lea         eax,[ebp-4]
 0071D75C    call        @WStrClr
 0071D761    ret
>0071D762    jmp         @HandleFinally
>0071D767    jmp         0071D749
 0071D769    pop         esi
 0071D76A    pop         ebx
 0071D76B    mov         esp,ebp
 0071D76D    pop         ebp
 0071D76E    ret
end;*}

//0071D778
{*procedure sub_0071D778(?:WideString; ?:?);
begin
 0071D778    push        ebp
 0071D779    mov         ebp,esp
 0071D77B    add         esp,0FFFFFFF0
 0071D77E    push        ebx
 0071D77F    push        esi
 0071D780    xor         ecx,ecx
 0071D782    mov         dword ptr [ebp-10],ecx
 0071D785    mov         dword ptr [ebp-0C],ecx
 0071D788    mov         esi,edx
 0071D78A    mov         dword ptr [ebp-4],eax
 0071D78D    lea         eax,[ebp-4]
 0071D790    call        @WStrAddRef
 0071D795    xor         eax,eax
 0071D797    push        ebp
 0071D798    push        71D8B1
 0071D79D    push        dword ptr fs:[eax]
 0071D7A0    mov         dword ptr fs:[eax],esp
 0071D7A3    mov         eax,[0078D324];^gvar_00815558:UnicodeString
 0071D7A8    cmp         dword ptr [eax],0
>0071D7AB    jne         0071D7BC
 0071D7AD    mov         eax,esi
 0071D7AF    mov         edx,dword ptr [ebp-4]
 0071D7B2    call        @WStrAsg
>0071D7B7    jmp         0071D88B
 0071D7BC    mov         eax,esi
 0071D7BE    call        @WStrClr
 0071D7C3    mov         eax,[0078D710];^gvar_0081555F
 0071D7C8    movzx       eax,byte ptr [eax]
 0071D7CB    mov         [008229F8],al;gvar_008229F8
 0071D7D0    mov         eax,[0078D710];^gvar_0081555F
 0071D7D5    mov         byte ptr [eax],0
 0071D7D8    lea         eax,[ebp-0C]
 0071D7DB    mov         edx,dword ptr [ebp-4]
 0071D7DE    call        @UStrFromWStr
 0071D7E3    mov         ecx,dword ptr [ebp-0C]
 0071D7E6    mov         dl,1
 0071D7E8    mov         eax,[005770A4];TScanner
 0071D7ED    call        TScanner.Create;TScanner.Create
 0071D7F2    mov         dword ptr [ebp-8],eax
 0071D7F5    xor         eax,eax
 0071D7F7    push        ebp
 0071D7F8    push        71D884
 0071D7FD    push        dword ptr fs:[eax]
 0071D800    mov         dword ptr fs:[eax],esp
 0071D803    mov         eax,dword ptr [ebp-8]
 0071D806    mov         byte ptr [eax+28],1;TScanner.ScanWhiteSpace:Boolean
 0071D80A    mov         eax,dword ptr [ebp-8]
 0071D80D    call        TScanner.Reset
>0071D812    jmp         0071D857
 0071D814    lea         edx,[ebp-10]
 0071D817    mov         eax,dword ptr [ebp-8]
 0071D81A    add         eax,8;TScanner.token:TToken
 0071D81D    call        0071B42C
 0071D822    mov         edx,dword ptr [ebp-10]
 0071D825    mov         eax,esi
 0071D827    call        @WStrCat
 0071D82C    mov         eax,dword ptr [ebp-8]
 0071D82F    cmp         byte ptr [eax+8],16;TScanner.token:TToken
 0071D833    sete        bl
 0071D836    mov         eax,dword ptr [ebp-8]
 0071D839    call        TScanner.Next
 0071D83E    test        bl,bl
>0071D840    je          0071D857
 0071D842    mov         eax,dword ptr [ebp-8]
 0071D845    cmp         byte ptr [eax+8],1;TScanner.token:TToken
>0071D849    je          0071D857
 0071D84B    mov         eax,esi
 0071D84D    mov         edx,71D8C4;' '
 0071D852    call        @WStrCat
 0071D857    mov         eax,dword ptr [ebp-8]
 0071D85A    cmp         byte ptr [eax+8],6D;TScanner.token:TToken
>0071D85E    jne         0071D814
 0071D860    xor         eax,eax
 0071D862    pop         edx
 0071D863    pop         ecx
 0071D864    pop         ecx
 0071D865    mov         dword ptr fs:[eax],edx
 0071D868    push        71D88B
 0071D86D    mov         eax,[0078D710];^gvar_0081555F
 0071D872    movzx       edx,byte ptr ds:[8229F8];gvar_008229F8
 0071D879    mov         byte ptr [eax],dl
 0071D87B    mov         eax,dword ptr [ebp-8]
 0071D87E    call        TObject.Free
 0071D883    ret
>0071D884    jmp         @HandleFinally
>0071D889    jmp         0071D86D
 0071D88B    xor         eax,eax
 0071D88D    pop         edx
 0071D88E    pop         ecx
 0071D88F    pop         ecx
 0071D890    mov         dword ptr fs:[eax],edx
 0071D893    push        71D8B8
 0071D898    lea         eax,[ebp-10]
 0071D89B    call        @WStrClr
 0071D8A0    lea         eax,[ebp-0C]
 0071D8A3    call        @UStrClr
 0071D8A8    lea         eax,[ebp-4]
 0071D8AB    call        @WStrClr
 0071D8B0    ret
>0071D8B1    jmp         @HandleFinally
>0071D8B6    jmp         0071D898
 0071D8B8    pop         esi
 0071D8B9    pop         ebx
 0071D8BA    mov         esp,ebp
 0071D8BC    pop         ebp
 0071D8BD    ret
end;*}

//0071DBC8
procedure TDebugRemoteForm.Timer1Timer(Sender:TObject);
begin
{*
 0071DBC8    push        ebp
 0071DBC9    mov         ebp,esp
 0071DBCB    mov         ecx,5
 0071DBD0    push        0
 0071DBD2    push        0
 0071DBD4    dec         ecx
>0071DBD5    jne         0071DBD0
 0071DBD7    push        ecx
 0071DBD8    push        ebx
 0071DBD9    mov         ebx,eax
 0071DBDB    xor         eax,eax
 0071DBDD    push        ebp
 0071DBDE    push        71DDD9
 0071DBE3    push        dword ptr fs:[eax]
 0071DBE6    mov         dword ptr fs:[eax],esp
 0071DBE9    call        006BA754
 0071DBEE    mov         eax,[0078D6D4];^gvar_0081F520
 0071DBF3    cmp         byte ptr [eax],0
>0071DBF6    je          0071DC4D
 0071DBF8    mov         eax,dword ptr [ebx+388];TDebugRemoteForm.Memo1:TTntMemo
 0071DBFE    mov         eax,dword ptr [eax+2A0];TTntMemo.FLines:TStrings
 0071DC04    mov         edx,71DDF4;'Pinnacle: 0'
 0071DC09    mov         ecx,dword ptr [eax]
 0071DC0B    call        dword ptr [ecx+38];TStrings.Add
 0071DC0E    lea         edx,[ebp-8]
 0071DC11    mov         eax,[0078D04C];^gvar_0078BE70
 0071DC16    mov         eax,dword ptr [eax]
 0071DC18    call        IntToStr
 0071DC1D    mov         ecx,dword ptr [ebp-8]
 0071DC20    lea         eax,[ebp-4]
 0071DC23    mov         edx,71DE18;'Pinnacle: '
 0071DC28    call        @UStrCat3
 0071DC2D    mov         edx,dword ptr [ebp-4]
 0071DC30    mov         eax,dword ptr [ebx+388];TDebugRemoteForm.Memo1:TTntMemo
 0071DC36    mov         eax,dword ptr [eax+2A0];TTntMemo.FLines:TStrings
 0071DC3C    mov         ecx,dword ptr [eax]
 0071DC3E    call        dword ptr [ecx+38];TStrings.Add
 0071DC41    mov         eax,[0078D04C];^gvar_0078BE70
 0071DC46    mov         eax,dword ptr [eax]
 0071DC48    mov         [00822A04],eax;gvar_00822A04
 0071DC4D    mov         eax,[0078D04C];^gvar_0078BE70
 0071DC52    mov         eax,dword ptr [eax]
 0071DC54    cmp         eax,dword ptr ds:[822A04];gvar_00822A04
>0071DC5A    je          0071DC9B
 0071DC5C    lea         edx,[ebp-10]
 0071DC5F    mov         eax,[0078D04C];^gvar_0078BE70
 0071DC64    mov         eax,dword ptr [eax]
 0071DC66    call        IntToStr
 0071DC6B    mov         ecx,dword ptr [ebp-10]
 0071DC6E    lea         eax,[ebp-0C]
 0071DC71    mov         edx,71DE18;'Pinnacle: '
 0071DC76    call        @UStrCat3
 0071DC7B    mov         edx,dword ptr [ebp-0C]
 0071DC7E    mov         eax,dword ptr [ebx+388];TDebugRemoteForm.Memo1:TTntMemo
 0071DC84    mov         eax,dword ptr [eax+2A0];TTntMemo.FLines:TStrings
 0071DC8A    mov         ecx,dword ptr [eax]
 0071DC8C    call        dword ptr [ecx+38];TStrings.Add
 0071DC8F    mov         eax,[0078D04C];^gvar_0078BE70
 0071DC94    mov         eax,dword ptr [eax]
 0071DC96    mov         [00822A04],eax;gvar_00822A04
 0071DC9B    mov         eax,[0078D138];^gvar_0078BE78
 0071DCA0    mov         eax,dword ptr [eax]
 0071DCA2    cmp         eax,dword ptr ds:[822A08];gvar_00822A08
>0071DCA8    je          0071DCF2
 0071DCAA    mov         eax,[0078D138];^gvar_0078BE78
 0071DCAF    mov         eax,dword ptr [eax]
 0071DCB1    xor         edx,edx
 0071DCB3    push        edx
 0071DCB4    push        eax
 0071DCB5    lea         edx,[ebp-18]
 0071DCB8    mov         eax,6
 0071DCBD    call        IntToHex
 0071DCC2    mov         ecx,dword ptr [ebp-18]
 0071DCC5    lea         eax,[ebp-14]
 0071DCC8    mov         edx,71DE3C;'Sony: '
 0071DCCD    call        @UStrCat3
 0071DCD2    mov         edx,dword ptr [ebp-14]
 0071DCD5    mov         eax,dword ptr [ebx+388];TDebugRemoteForm.Memo1:TTntMemo
 0071DCDB    mov         eax,dword ptr [eax+2A0];TTntMemo.FLines:TStrings
 0071DCE1    mov         ecx,dword ptr [eax]
 0071DCE3    call        dword ptr [ecx+38];TStrings.Add
 0071DCE6    mov         eax,[0078D138];^gvar_0078BE78
 0071DCEB    mov         eax,dword ptr [eax]
 0071DCED    mov         [00822A08],eax;gvar_00822A08
 0071DCF2    mov         eax,[0078D918];^gvar_0078BE7C
 0071DCF7    mov         eax,dword ptr [eax]
 0071DCF9    cmp         eax,dword ptr ds:[822A0C];gvar_00822A0C
>0071DCFF    je          0071DD65
 0071DD01    push        71DE58;'Deleting: ['
 0071DD06    mov         eax,[0078D918];^gvar_0078BE7C
 0071DD0B    mov         eax,dword ptr [eax]
 0071DD0D    xor         edx,edx
 0071DD0F    push        edx
 0071DD10    push        eax
 0071DD11    lea         edx,[ebp-20]
 0071DD14    mov         eax,2
 0071DD19    call        IntToHex
 0071DD1E    push        dword ptr [ebp-20]
 0071DD21    push        71DE7C;']'
 0071DD26    lea         edx,[ebp-24]
 0071DD29    mov         eax,[0078D7D0];^gvar_0078BE80
 0071DD2E    mov         eax,dword ptr [eax]
 0071DD30    call        006BBD54
 0071DD35    push        dword ptr [ebp-24]
 0071DD38    lea         eax,[ebp-1C]
 0071DD3B    mov         edx,4
 0071DD40    call        @UStrCatN
 0071DD45    mov         edx,dword ptr [ebp-1C]
 0071DD48    mov         eax,dword ptr [ebx+388];TDebugRemoteForm.Memo1:TTntMemo
 0071DD4E    mov         eax,dword ptr [eax+2A0];TTntMemo.FLines:TStrings
 0071DD54    mov         ecx,dword ptr [eax]
 0071DD56    call        dword ptr [ecx+38];TStrings.Add
 0071DD59    mov         eax,[0078D918];^gvar_0078BE7C
 0071DD5E    mov         eax,dword ptr [eax]
 0071DD60    mov         [00822A0C],eax;gvar_00822A0C
 0071DD65    mov         eax,[00822A10];gvar_00822A10:UnicodeString
 0071DD6A    mov         edx,dword ptr ds:[78D7D0];^gvar_0078BE80
 0071DD70    mov         edx,dword ptr [edx]
 0071DD72    call        @UStrEqual
>0071DD77    je          0071DDBE
 0071DD79    mov         eax,822A10;gvar_00822A10:UnicodeString
 0071DD7E    mov         edx,dword ptr ds:[78D7D0];^gvar_0078BE80
 0071DD84    mov         edx,dword ptr [edx]
 0071DD86    call        @UStrAsg
 0071DD8B    lea         edx,[ebp-2C]
 0071DD8E    mov         eax,[0078D7D0];^gvar_0078BE80
 0071DD93    mov         eax,dword ptr [eax]
 0071DD95    call        006BBD54
 0071DD9A    mov         ecx,dword ptr [ebp-2C]
 0071DD9D    lea         eax,[ebp-28]
 0071DDA0    mov         edx,71DE8C;'Buffer: '
 0071DDA5    call        @UStrCat3
 0071DDAA    mov         edx,dword ptr [ebp-28]
 0071DDAD    mov         eax,dword ptr [ebx+388];TDebugRemoteForm.Memo1:TTntMemo
 0071DDB3    mov         eax,dword ptr [eax+2A0];TTntMemo.FLines:TStrings
 0071DDB9    mov         ecx,dword ptr [eax]
 0071DDBB    call        dword ptr [ecx+38];TStrings.Add
 0071DDBE    xor         eax,eax
 0071DDC0    pop         edx
 0071DDC1    pop         ecx
 0071DDC2    pop         ecx
 0071DDC3    mov         dword ptr fs:[eax],edx
 0071DDC6    push        71DDE0
 0071DDCB    lea         eax,[ebp-2C]
 0071DDCE    mov         edx,0B
 0071DDD3    call        @UStrArrayClr
 0071DDD8    ret
>0071DDD9    jmp         @HandleFinally
>0071DDDE    jmp         0071DDCB
 0071DDE0    pop         ebx
 0071DDE1    mov         esp,ebp
 0071DDE3    pop         ebp
 0071DDE4    ret
*}
end;

//0071DEA0
procedure TDebugRemoteForm.FormShow(Sender:TObject);
begin
{*
 0071DEA0    push        ebx
 0071DEA1    mov         ebx,eax
 0071DEA3    call        006B7CC8
 0071DEA8    mov         dl,1
 0071DEAA    mov         eax,dword ptr [ebx+38C];TDebugRemoteForm.Timer1:TTimer
 0071DEB0    call        TTimer.SetEnabled
 0071DEB5    pop         ebx
 0071DEB6    ret
*}
end;

//0071DEB8
procedure TDebugRemoteForm.FormHide(Sender:TObject);
begin
{*
 0071DEB8    push        ebx
 0071DEB9    mov         ebx,eax
 0071DEBB    call        006B7E88
 0071DEC0    xor         edx,edx
 0071DEC2    mov         eax,dword ptr [ebx+38C];TDebugRemoteForm.Timer1:TTimer
 0071DEC8    call        TTimer.SetEnabled
 0071DECD    pop         ebx
 0071DECE    ret
*}
end;

Initialization
//00782E5C
{*
 00782E5C    push        ebp
 00782E5D    mov         ebp,esp
 00782E5F    xor         eax,eax
 00782E61    push        ebp
 00782E62    push        782E82
 00782E67    push        dword ptr fs:[eax]
 00782E6A    mov         dword ptr fs:[eax],esp
 00782E6D    sub         dword ptr ds:[822A00],1
 00782E74    xor         eax,eax
 00782E76    pop         edx
 00782E77    pop         ecx
 00782E78    pop         ecx
 00782E79    mov         dword ptr fs:[eax],edx
 00782E7C    push        782E89
 00782E81    ret
>00782E82    jmp         @HandleFinally
>00782E87    jmp         00782E81
 00782E89    pop         ebp
 00782E8A    ret
*}
Finalization
//0071DED0
{*
 0071DED0    push        ebp
 0071DED1    mov         ebp,esp
 0071DED3    xor         eax,eax
 0071DED5    push        ebp
 0071DED6    push        71DF01
 0071DEDB    push        dword ptr fs:[eax]
 0071DEDE    mov         dword ptr fs:[eax],esp
 0071DEE1    inc         dword ptr ds:[822A00]
>0071DEE7    jne         0071DEF3
 0071DEE9    mov         eax,822A10;gvar_00822A10:UnicodeString
 0071DEEE    call        @UStrClr
 0071DEF3    xor         eax,eax
 0071DEF5    pop         edx
 0071DEF6    pop         ecx
 0071DEF7    pop         ecx
 0071DEF8    mov         dword ptr fs:[eax],edx
 0071DEFB    push        71DF08
 0071DF00    ret
>0071DF01    jmp         @HandleFinally
>0071DF06    jmp         0071DF00
 0071DF08    pop         ebp
 0071DF09    ret
*}
end.