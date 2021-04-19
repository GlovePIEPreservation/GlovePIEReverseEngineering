//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit53;

interface

uses
  SysUtils, Classes;

type
  TCharacterCategory = (ccLetterUppercase, ccLetterLowercase, ccLetterTitlecase, ccMarkNonSpacing, ccMarkSpacingCombining, ccMarkEnclosing, ccNumberDecimalDigit, ccNumberLetter, ccNumberOther, ccSeparatorSpace, ccSeparatorLine, ccSeparatorParagraph, ccOtherControl, ccOtherFormat, ccOtherSurrogate, ccOtherPrivate, ccOtherUnassigned, ccLetterModifier, ccLetterOther, ccPunctuationConnector, ccPunctuationDash, ccPunctuationOpen, ccPunctuationClose, ccPunctuationInitialQuote, ccPunctuationFinalQuote, ccPunctuationOther, ccSymbolMath, ccSymbolCurrency, ccSymbolModifier, ccSymbolOther, ccLeftToRight, ccLeftToRightEmbedding, ccLeftToRightOverride, ccRightToLeft, ccRightToLeftArabic, ccRightToLeftEmbedding, ccRightToLeftOverride, ccPopDirectionalFormat, ccEuropeanNumber, ccEuropeanNumberSeparator, ccEuropeanNumberTerminator, ccArabicNumber, ccCommonNumberSeparator, ccBoundaryNeutral, ccSegmentSeparator, ccWhiteSpace, ccOtherNeutrals, ccComposed, ccNonBreaking, ccSymmetric, ccHexDigit, ccQuotationMark, ccMirroring, ccAssigned, ccASCIIHexDigit, ccBidiControl, ccDash, ccDeprecated, ccDiacritic, ccExtender, ccHyphen, ccIdeographic, ccIDSBinaryOperator, ccIDSTrinaryOperator, ccJoinControl, ccLogicalOrderException, ccNonCharacterCodePoint, ccOtherAlphabetic, ccOtherDefaultIgnorableCodePoint, ccOtherGraphemeExtend, ccOtherIDContinue, ccOtherIDStart, ccOtherLowercase, ccOtherMath, ccOtherUppercase, ccPatternSyntax, ccPatternWhiteSpace, ccRadical, ccSoftDotted, ccSTerm, ccTerminalPunctuation, ccUnifiedIdeograph, ccVariationSelector);
  TCharacterCategories = set of TCharacterCategory;
  TCompatibilityFormattingTag = (cftCanonical, cftFont, cftNoBreak, cftInitial, cftMedial, cftFinal, cftIsolated, cftCircle, cftSuper, cftSub, cftVertical, cftWide, cftNarrow, cftSmall, cftSquare, cftFraction, cftCompat);
  TUnicodeBlockRange = TUnicodeBlockRange = record//size=8
RangeStart:Cardinal;//f0
RangeEnd:Cardinal;//f4
end;;
  TUnicodeBlockData = TUnicodeBlockData = record//size=C
f8:string;//f8
end;
Range:TUnicodeBlockRange;//f0
Name:string;//f8
end;;
  TCaseType = (ctFold, ctLower, ctTitle, ctUpper);
  TUcNumber = TUcNumber = record//size=8
Numerator:Integer;//f0
Denominator:Integer;//f4
end;;
  :9 = array of TCharacterCategories;
//elSize = B;
  TCategoriesArray = array of :9;
//elSize = 4;
  TCase = array [TCaseType] of TUCS4Array;
  :11 = array of TCase;
//elSize = 10;
  TCaseArray = array of :11;
//elSize = 4;
  TDecomposition = TDecomposition = record//size=8
f4:TUCS4Array;//f4
end;
Tag:TCompatibilityFormattingTag;//f0
Leaves:TUCS4Array;//f4
end;;
  :31 = array of TDecomposition;
//elSize = 8;
  TDecompositions = array of :31;
//elSize = 4;
  :41 = array of Byte;
//elSize = 1
//varType equivalent: varByte;
  TClassArray = array of :41;
//elSize = 4
//varType equivalent: varByte;
  TCodeIndex = TCodeIndex = record//size=8
Code:Cardinal;//f0
Index:Cardinal;//f4
end;;
  :61 = array of TCodeIndex;
//elSize = 8;
  :71 = array of TUcNumber;
//elSize = 8;
  :TComposition.:1 = array of Cardinal;
//elSize = 4
//varType equivalent: varInteger;
  TComposition = TComposition = record//size=C
f8::TComposition.:1;//f8
end;
Code:Cardinal;//f0
First:Cardinal;//f4
Next::TComposition.:1;//f8
end;;
  :81 = array of TComposition;
//elSize = C;
    //procedure sub_00536AFC(?:?; ?:?; ?:?);//00536AFC
    procedure sub_00536B50;//00536B50
    procedure sub_00536B84;//00536B84

implementation

//00536AFC
{*procedure sub_00536AFC(?:?; ?:?; ?:?);
begin
 00536AFC    push        ebx
 00536AFD    push        esi
 00536AFE    push        edi
 00536AFF    push        ebp
 00536B00    push        ecx
 00536B01    mov         dword ptr [esp],ecx
 00536B04    mov         ebp,edx
 00536B06    mov         edi,eax
 00536B08    mov         ebx,edi
 00536B0A    test        ebx,ebx
>00536B0C    je          00536B17
 00536B0E    sub         ebx,4
 00536B11    mov         eax,dword ptr [ebx]
 00536B13    shr         eax,1
 00536B15    mov         ebx,eax
 00536B17    mov         esi,ebp
 00536B19    test        esi,esi
>00536B1B    je          00536B26
 00536B1D    sub         esi,4
 00536B20    mov         eax,dword ptr [esi]
 00536B22    shr         eax,1
 00536B24    mov         esi,eax
 00536B26    push        esi
 00536B27    mov         eax,ebp
 00536B29    call        @WStrToPWChar
 00536B2E    push        eax
 00536B2F    push        ebx
 00536B30    mov         eax,edi
 00536B32    call        @WStrToPWChar
 00536B37    push        eax
 00536B38    push        1
 00536B3A    mov         eax,dword ptr [esp+14]
 00536B3E    push        eax
 00536B3F    call        kernel32.CompareStringW
 00536B44    sub         eax,2
 00536B47    pop         edx
 00536B48    pop         ebp
 00536B49    pop         edi
 00536B4A    pop         esi
 00536B4B    pop         ebx
 00536B4C    ret
end;*}

//00536B50
procedure sub_00536B50;
begin
{*
 00536B50    mov         dl,1
 00536B52    mov         eax,[00537808];TJclCriticalSection
 00536B57    call        TJclCriticalSection.Create;TJclCriticalSection.Create
 00536B5C    mov         [00793B80],eax;gvar_00793B80:TJclCriticalSection
 00536B61    mov         eax,[0078DB58];^gvar_00784C7C
 00536B66    test        byte ptr [eax],2
>00536B69    je          00536B76
 00536B6B    mov         dword ptr ds:[793B78],536AFC
 00536B75    ret
 00536B76    mov         dword ptr ds:[793B78],5369E4
 00536B80    ret
*}
end;

//00536B84
procedure sub_00536B84;
begin
{*
 00536B84    mov         eax,[00793B80];gvar_00793B80:TJclCriticalSection
 00536B89    xor         edx,edx
 00536B8B    mov         dword ptr ds:[793B80],edx;gvar_00793B80:TJclCriticalSection
 00536B91    call        TObject.Free
 00536B96    ret
*}
end;

Initialization
//00780FA4
{*
 00780FA4    push        ebp
 00780FA5    mov         ebp,esp
 00780FA7    xor         eax,eax
 00780FA9    push        ebp
 00780FAA    push        780FE0
 00780FAF    push        dword ptr fs:[eax]
 00780FB2    mov         dword ptr fs:[eax],esp
 00780FB5    sub         dword ptr ds:[793B7C],1
>00780FBC    jae         00780FD2
 00780FBE    call        00536B50
 00780FC3    mov         edx,788A60;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00780FC8    mov         eax,[00790C38];gvar_00790C38
 00780FCD    call        0053F424
 00780FD2    xor         eax,eax
 00780FD4    pop         edx
 00780FD5    pop         ecx
 00780FD6    pop         ecx
 00780FD7    mov         dword ptr fs:[eax],edx
 00780FDA    push        780FE7
 00780FDF    ret
>00780FE0    jmp         @HandleFinally
>00780FE5    jmp         00780FDF
 00780FE7    pop         ebp
 00780FE8    ret
*}
Finalization
//00536B98
{*
 00536B98    push        ebp
 00536B99    mov         ebp,esp
 00536B9B    xor         eax,eax
 00536B9D    push        ebp
 00536B9E    push        536C90
 00536BA3    push        dword ptr fs:[eax]
 00536BA6    mov         dword ptr fs:[eax],esp
 00536BA9    inc         dword ptr ds:[793B7C]
>00536BAF    jne         00536C82
 00536BB5    mov         eax,[00790C38];gvar_00790C38
 00536BBA    call        0053F440
 00536BBF    call        00536B84
 00536BC4    mov         eax,78831C;gvar_0078831C:array[155] of ?
 00536BC9    mov         ecx,9B
 00536BCE    mov         edx,dword ptr ds:[5346A4];TUnicodeBlockData
 00536BD4    call        @FinalizeArray
 00536BD9    mov         eax,788A60;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 00536BDE    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 00536BE4    call        @FinalizeRecord
 00536BE9    mov         eax,793B84;gvar_00793B84:array[256] of ?
 00536BEE    mov         ecx,100
 00536BF3    mov         edx,dword ptr ds:[536650];TCategoriesArray
 00536BF9    call        @FinalizeArray
 00536BFE    mov         eax,793F84;gvar_00793F84:array[256] of ?
 00536C03    mov         ecx,100
 00536C08    mov         edx,dword ptr ds:[5366D4];TCaseArray
 00536C0E    call        @FinalizeArray
 00536C13    mov         eax,794384;gvar_00794384:array[256] of ?
 00536C18    mov         ecx,100
 00536C1D    mov         edx,dword ptr ds:[536780];TDecompositions
 00536C23    call        @FinalizeArray
 00536C28    mov         eax,794784;gvar_00794784:array[256] of ?
 00536C2D    mov         ecx,100
 00536C32    mov         edx,dword ptr ds:[536780];TDecompositions
 00536C38    call        @FinalizeArray
 00536C3D    mov         eax,794B84;gvar_00794B84:array[256] of ?
 00536C42    mov         ecx,100
 00536C47    mov         edx,dword ptr ds:[5367E4];TClassArray
 00536C4D    call        @FinalizeArray
 00536C52    mov         eax,794F84;gvar_00794F84:?
 00536C57    mov         edx,dword ptr ds:[536858];:61
 00536C5D    call        @DynArrayClear
 00536C62    mov         eax,794F88;gvar_00794F88:?
 00536C67    mov         edx,dword ptr ds:[536884];:71
 00536C6D    call        @DynArrayClear
 00536C72    mov         eax,794F8C;gvar_00794F8C:?
 00536C77    mov         edx,dword ptr ds:[536944];:81
 00536C7D    call        @DynArrayClear
 00536C82    xor         eax,eax
 00536C84    pop         edx
 00536C85    pop         ecx
 00536C86    pop         ecx
 00536C87    mov         dword ptr fs:[eax],edx
 00536C8A    push        536C97
 00536C8F    ret
>00536C90    jmp         @HandleFinally
>00536C95    jmp         00536C8F
 00536C97    pop         ebp
 00536C98    ret
*}
end.