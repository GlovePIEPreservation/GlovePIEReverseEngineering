//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit JclFileUtils;

interface

uses
  SysUtils, Classes;

type
  TFileFlag = (ffDebug, ffInfoInferred, ffPatched, ffPreRelease, ffPrivateBuild, ffSpecialBuild);
  TFileFlags = set of TFileFlag;
  TLangIdRec = TLangIdRec = record//size=4
LangId:Word;//f0
CodePage:Word;//f2
Pair:Cardinal;//f0
end;;
  EJclFileVersionInfoError = class(EJclError)
  end;
  :TJclFileVersionInfo.:1 = array of TLangIdRec;
//elSize = 4;
  :TJclFileVersionInfo.:2 = array of TLangIdRec;
//elSize = 4;
  TJclFileVersionInfo = class(TObject)
  published
    //procedure VersionLanguageId(LangIdRec:TLangIdRec; ?:?);//0053CA3C
    //procedure GetCustomFieldValue(FieldName:string; ?:?);//0053C2D8
    function TranslationMatchesLanguages(Exact:Boolean):Boolean;//0053C9B4
    //procedure VersionLanguageName(LangId:Word; ?:?);//0053CA9C
    destructor Destroy();//0053B940
    constructor Create(FileName:string);//0053B748
    constructor sub_0053B6E4(VersionInfoData:Pointer; Size:Integer);//0053B6E4
    constructor sub_0053B894(Module:Cardinal);//0053B894
    constructor sub_0053B81C(Window:HWND);//0053B81C
  public
    FBuffer:AnsiString;//f4
    FFixedInfo:PVSFixedFileInfo;//f8
    FFileFlags:TFileFlags;//fC
    FItemList:TStringList;//f10
    FItems:TStringList;//f14
    FLanguages::1;//f18
    FLanguageIndex:Integer;//f1C
    FTranslations::2;//f20
  end;
    //function sub_0053AA20(?:?):?;//0053AA20
    //procedure sub_0053AA38(?:?; ?:?);//0053AA38
    //procedure sub_0053AA88(?:TFileName; ?:?; ?:?);//0053AA88
    //procedure sub_0053AB70(?:HDC; ?:?; ?:?; ?:?; ?:?);//0053AB70
    //procedure sub_0053AC18(?:?);//0053AC18
    //function sub_0053AC48(?:?):?;//0053AC48
    //function sub_0053ACBC(?:?):?;//0053ACBC
    //function sub_0053AD34(?:?):?;//0053AD34
    //function sub_0053AD60(?:?):?;//0053AD60
    //function sub_0053ADF8(?:?; ?:?):?;//0053ADF8
    //function sub_0053AE68(?:?):?;//0053AE68
    //procedure sub_0053AF78(?:?; ?:?);//0053AF78
    //function sub_0053AFD0(?:string):?;//0053AFD0
    //procedure sub_0053AFF4(?:Integer; ?:?);//0053AFF4
    //procedure sub_0053B208(?:HWND; ?:?);//0053B208
    //function sub_0053B618(?:?; ?:?):?;//0053B618
    procedure sub_0053B9B8(?:TJclFileVersionInfo);//0053B9B8
    procedure sub_0053BA58;//0053BA58
    //procedure sub_0053BA64(?:?);//0053BA64
    //procedure sub_0053BB2C(?:?);//0053BB2C
    //procedure sub_0053BBA8(?:?; ?:?);//0053BBA8
    //procedure sub_0053BED0(?:?);//0053BED0
    procedure sub_0053BF78(?:TJclFileVersionInfo);//0053BF78
    procedure sub_0053C158(?:TJclFileVersionInfo);//0053C158
    //function sub_0053C660(?:?):?;//0053C660
    //function sub_0053C664(?:TJclFileVersionInfo):?;//0053C664
    //function sub_0053C670(?:TJclFileVersionInfo):?;//0053C670
    //procedure sub_0053C96C(?:TJclFileVersionInfo; ?:?; ?:?);//0053C96C

implementation

//0053AA20
{*function sub_0053AA20(?:?):?;
begin
 0053AA20    add         eax,0FFFFFFBF
 0053AA23    sub         ax,1A
>0053AA27    jb          0053AA32
 0053AA29    add         eax,0FFFFFFFA
 0053AA2C    sub         ax,1A
>0053AA30    jae         0053AA35
 0053AA32    mov         al,1
 0053AA34    ret
 0053AA35    xor         eax,eax
 0053AA37    ret
end;*}

//0053AA38
{*procedure sub_0053AA38(?:?; ?:?);
begin
 0053AA38    push        ebx
 0053AA39    push        esi
 0053AA3A    mov         esi,edx
 0053AA3C    mov         ebx,eax
 0053AA3E    mov         eax,esi
 0053AA40    mov         edx,ebx
 0053AA42    call        @UStrAsg
 0053AA47    test        ebx,ebx
>0053AA49    jne         0053AA4F
 0053AA4B    mov         al,1
>0053AA4D    jmp         0053AA63
 0053AA4F    mov         eax,ebx
 0053AA51    test        eax,eax
>0053AA53    je          0053AA5A
 0053AA55    sub         eax,4
 0053AA58    mov         eax,dword ptr [eax]
 0053AA5A    cmp         word ptr [ebx+eax*2-2],5C
 0053AA60    setne       al
 0053AA63    test        al,al
>0053AA65    je          0053AA75
 0053AA67    mov         eax,esi
 0053AA69    mov         ecx,53AA84;'\'
 0053AA6E    mov         edx,ebx
 0053AA70    call        @UStrCat3
 0053AA75    pop         esi
 0053AA76    pop         ebx
 0053AA77    ret
end;*}

//0053AA88
{*procedure sub_0053AA88(?:TFileName; ?:?; ?:?);
begin
 0053AA88    push        ebp
 0053AA89    mov         ebp,esp
 0053AA8B    push        0
 0053AA8D    push        0
 0053AA8F    push        ebx
 0053AA90    push        esi
 0053AA91    push        edi
 0053AA92    mov         edi,ecx
 0053AA94    mov         esi,edx
 0053AA96    mov         ebx,eax
 0053AA98    xor         eax,eax
 0053AA9A    push        ebp
 0053AA9B    push        53AB52
 0053AAA0    push        dword ptr fs:[eax]
 0053AAA3    mov         dword ptr fs:[eax],esp
 0053AAA6    mov         eax,edi
 0053AAA8    mov         edx,ebx
 0053AAAA    call        @UStrAsg
 0053AAAF    test        ebx,ebx
>0053AAB1    je          0053AB37
 0053AAB7    test        esi,esi
>0053AAB9    je          0053AB37
 0053AABB    lea         ecx,[ebp-4]
 0053AABE    mov         edx,esi
 0053AAC0    mov         eax,53AB6C;'.'
 0053AAC5    call        00538D0C
 0053AACA    mov         eax,dword ptr [ebp-4]
 0053AACD    push        eax
 0053AACE    lea         edx,[ebp-8]
 0053AAD1    mov         eax,ebx
 0053AAD3    call        ExtractFileExt
 0053AAD8    mov         eax,dword ptr [ebp-8]
 0053AADB    pop         edx
 0053AADC    call        SameText
 0053AAE1    test        al,al
>0053AAE3    jne         0053AB37
 0053AAE5    mov         edx,ebx
 0053AAE7    mov         eax,edx
 0053AAE9    test        eax,eax
>0053AAEB    je          0053AAF2
 0053AAED    sub         eax,4
 0053AAF0    mov         eax,dword ptr [eax]
 0053AAF2    cmp         word ptr [ebx+eax*2-2],2E
>0053AAF8    jne         0053AB12
 0053AAFA    mov         eax,edx
 0053AAFC    test        eax,eax
>0053AAFE    je          0053AB05
 0053AB00    sub         eax,4
 0053AB03    mov         eax,dword ptr [eax]
 0053AB05    mov         edx,edi
 0053AB07    mov         ecx,1
 0053AB0C    xchg        eax,edx
 0053AB0D    call        @UStrDelete
 0053AB12    cmp         word ptr [esi],2E
>0053AB16    jne         0053AB23
 0053AB18    mov         eax,edi
 0053AB1A    mov         edx,esi
 0053AB1C    call        @UStrCat
>0053AB21    jmp         0053AB37
 0053AB23    push        dword ptr [edi]
 0053AB25    push        53AB6C;'.'
 0053AB2A    push        esi
 0053AB2B    mov         eax,edi
 0053AB2D    mov         edx,3
 0053AB32    call        @UStrCatN
 0053AB37    xor         eax,eax
 0053AB39    pop         edx
 0053AB3A    pop         ecx
 0053AB3B    pop         ecx
 0053AB3C    mov         dword ptr fs:[eax],edx
 0053AB3F    push        53AB59
 0053AB44    lea         eax,[ebp-8]
 0053AB47    mov         edx,2
 0053AB4C    call        @UStrArrayClr
 0053AB51    ret
>0053AB52    jmp         @HandleFinally
>0053AB57    jmp         0053AB44
 0053AB59    pop         edi
 0053AB5A    pop         esi
 0053AB5B    pop         ebx
 0053AB5C    pop         ecx
 0053AB5D    pop         ecx
 0053AB5E    pop         ebp
 0053AB5F    ret
end;*}

//0053AB70
{*procedure sub_0053AB70(?:HDC; ?:?; ?:?; ?:?; ?:?);
begin
 0053AB70    push        ebp
 0053AB71    mov         ebp,esp
 0053AB73    add         esp,0FFFFFFE8
 0053AB76    push        ebx
 0053AB77    push        esi
 0053AB78    push        edi
 0053AB79    mov         dword ptr [ebp-8],ecx
 0053AB7C    mov         edi,edx
 0053AB7E    mov         dword ptr [ebp-4],eax
 0053AB81    mov         ebx,dword ptr [ebp+8]
 0053AB84    mov         eax,ebx
 0053AB86    call        @UStrClr
 0053AB8B    cmp         dword ptr [ebp-4],0
>0053AB8F    je          0053AC0D
 0053AB91    test        edi,edi
>0053AB93    je          0053AC0D
 0053AB95    cmp         dword ptr [ebp-8],0
>0053AB99    jle         0053AC0D
 0053AB9B    mov         esi,edi
 0053AB9D    test        esi,esi
>0053AB9F    je          0053ABA6
 0053ABA1    sub         esi,4
 0053ABA4    mov         esi,dword ptr [esi]
 0053ABA6    mov         eax,edi
 0053ABA8    call        @UStrToPWChar
 0053ABAD    mov         edx,eax
 0053ABAF    lea         ecx,[esi+4]
 0053ABB2    mov         eax,ebx
 0053ABB4    call        @UStrFromPWCharLen
 0053ABB9    push        0FF
 0053ABBE    lea         eax,[ebp-18]
 0053ABC1    push        eax
 0053ABC2    mov         ecx,dword ptr [ebp-8]
 0053ABC5    xor         edx,edx
 0053ABC7    xor         eax,eax
 0053ABC9    call        Rect
 0053ABCE    movzx       eax,byte ptr [ebp+0C]
 0053ABD2    mov         esi,dword ptr [eax*4+788C44]
 0053ABD9    or          esi,10400
 0053ABDF    push        0
 0053ABE1    push        esi
 0053ABE2    lea         eax,[ebp-18]
 0053ABE5    push        eax
 0053ABE6    push        0FF
 0053ABE8    mov         eax,dword ptr [ebx]
 0053ABEA    call        @UStrToPWChar
 0053ABEF    push        eax
 0053ABF0    mov         eax,dword ptr [ebp-4]
 0053ABF3    push        eax
 0053ABF4    call        user32.DrawTextExW
 0053ABF9    test        eax,eax
>0053ABFB    je          0053AC06
 0053ABFD    mov         eax,ebx
 0053ABFF    call        00539138
>0053AC04    jmp         0053AC0D
 0053AC06    mov         eax,ebx
 0053AC08    call        @UStrClr
 0053AC0D    pop         edi
 0053AC0E    pop         esi
 0053AC0F    pop         ebx
 0053AC10    mov         esp,ebp
 0053AC12    pop         ebp
 0053AC13    ret         8
end;*}

//0053AC18
{*procedure sub_0053AC18(?:?);
begin
 0053AC18    push        ebx
 0053AC19    push        esi
 0053AC1A    mov         ebx,eax
 0053AC1C    push        0
 0053AC1E    push        0
 0053AC20    call        kernel32.GetTempPathW
 0053AC25    mov         esi,eax
 0053AC27    mov         eax,ebx
 0053AC29    mov         edx,esi
 0053AC2B    call        @UStrSetLength
 0053AC30    mov         eax,dword ptr [ebx]
 0053AC32    call        @UStrToPWChar
 0053AC37    push        eax
 0053AC38    push        esi
 0053AC39    call        kernel32.GetTempPathW
 0053AC3E    mov         eax,ebx
 0053AC40    call        00539138
 0053AC45    pop         esi
 0053AC46    pop         ebx
 0053AC47    ret
end;*}

//0053AC48
{*function sub_0053AC48(?:?):?;
begin
 0053AC48    push        ebx
 0053AC49    push        esi
 0053AC4A    mov         esi,eax
 0053AC4C    xor         ebx,ebx
 0053AC4E    test        esi,esi
>0053AC50    je          0053ACB6
 0053AC52    mov         eax,esi
 0053AC54    call        0053AE68
 0053AC59    test        al,al
>0053AC5B    jne         0053ACB4
 0053AC5D    xor         ebx,ebx
 0053AC5F    mov         eax,esi
 0053AC61    call        0053ACBC
 0053AC66    test        al,al
>0053AC68    je          0053AC6F
 0053AC6A    mov         ebx,4
 0053AC6F    mov         eax,esi
 0053AC71    test        eax,eax
>0053AC73    je          0053AC7A
 0053AC75    sub         eax,4
 0053AC78    mov         eax,dword ptr [eax]
 0053AC7A    lea         edx,[ebx+2]
 0053AC7D    cmp         eax,edx
>0053AC7F    jle         0053AC8C
 0053AC81    movzx       eax,word ptr [esi+ebx*2]
 0053AC85    call        0053AA20
>0053AC8A    jmp         0053AC8E
 0053AC8C    xor         eax,eax
 0053AC8E    test        al,al
>0053AC90    je          0053AC9D
 0053AC92    cmp         word ptr [esi+ebx*2+2],3A
 0053AC98    sete        al
>0053AC9B    jmp         0053AC9F
 0053AC9D    xor         eax,eax
 0053AC9F    test        al,al
>0053ACA1    je          0053ACAE
 0053ACA3    cmp         word ptr [esi+ebx*2+4],5C
 0053ACA9    sete        al
>0053ACAC    jmp         0053ACB0
 0053ACAE    xor         eax,eax
 0053ACB0    mov         ebx,eax
>0053ACB2    jmp         0053ACB6
 0053ACB4    mov         bl,1
 0053ACB6    mov         eax,ebx
 0053ACB8    pop         esi
 0053ACB9    pop         ebx
 0053ACBA    ret
end;*}

//0053ACBC
{*function sub_0053ACBC(?:?):?;
begin
 0053ACBC    push        ebp
 0053ACBD    mov         ebp,esp
 0053ACBF    push        0
 0053ACC1    push        ebx
 0053ACC2    mov         ebx,eax
 0053ACC4    xor         eax,eax
 0053ACC6    push        ebp
 0053ACC7    push        53AD0F
 0053ACCC    push        dword ptr fs:[eax]
 0053ACCF    mov         dword ptr fs:[eax],esp
 0053ACD2    lea         eax,[ebp-4]
 0053ACD5    push        eax
 0053ACD6    mov         ecx,4
 0053ACDB    mov         edx,1
 0053ACE0    mov         eax,ebx
 0053ACE2    call        @UStrCopy
 0053ACE7    mov         eax,dword ptr [ebp-4]
 0053ACEA    mov         edx,53AD28;^TIdUDPClient.InitComponent
 0053ACEF    call        @UStrEqual
 0053ACF4    sete        al
 0053ACF7    mov         ebx,eax
 0053ACF9    xor         eax,eax
 0053ACFB    pop         edx
 0053ACFC    pop         ecx
 0053ACFD    pop         ecx
 0053ACFE    mov         dword ptr fs:[eax],edx
 0053AD01    push        53AD16
 0053AD06    lea         eax,[ebp-4]
 0053AD09    call        @UStrClr
 0053AD0E    ret
>0053AD0F    jmp         @HandleFinally
>0053AD14    jmp         0053AD06
 0053AD16    mov         eax,ebx
 0053AD18    pop         ebx
 0053AD19    pop         ecx
 0053AD1A    pop         ebp
 0053AD1B    ret
end;*}

//0053AD34
{*function sub_0053AD34(?:?):?;
begin
 0053AD34    push        ebp
 0053AD35    mov         ebp,esp
 0053AD37    mov         eax,dword ptr [ebp+8]
 0053AD3A    cmp         dword ptr [eax-4],0
>0053AD3E    je          0053AD4C
 0053AD40    mov         eax,dword ptr [ebp+8]
 0053AD43    mov         eax,dword ptr [eax-4]
 0053AD46    cmp         word ptr [eax],5C
>0053AD4A    je          0053AD50
 0053AD4C    xor         eax,eax
>0053AD4E    jmp         0053AD52
 0053AD50    mov         al,1
 0053AD52    test        al,al
>0053AD54    je          0053AD5D
 0053AD56    mov         edx,dword ptr [ebp+8]
 0053AD59    add         dword ptr [edx-4],2
 0053AD5D    pop         ebp
 0053AD5E    ret
end;*}

//0053AD60
{*function sub_0053AD60(?:?):?;
begin
 0053AD60    push        ebp
 0053AD61    mov         ebp,esp
 0053AD63    push        ecx
 0053AD64    push        ebx
 0053AD65    push        esi
 0053AD66    push        edi
 0053AD67    mov         byte ptr [ebp-1],1
 0053AD6B    mov         byte ptr [ebp-2],0
>0053AD6F    jmp         0053ADCB
 0053AD71    mov         eax,dword ptr [ebp+8]
 0053AD74    mov         edi,esi
 0053AD76    add         edi,0FFFFFFD3
 0053AD79    sub         di,2
>0053AD7D    jb          0053AD97
 0053AD7F    add         edi,0FFFFFFEE
 0053AD82    sub         di,1A
>0053AD86    jb          0053AD97
 0053AD88    sub         di,4
>0053AD8C    je          0053AD97
 0053AD8E    add         edi,0FFFFFFFE
 0053AD91    sub         di,1A
>0053AD95    jae         0053AD9B
 0053AD97    mov         bl,1
>0053AD99    jmp         0053AD9D
 0053AD9B    xor         ebx,ebx
 0053AD9D    test        bl,bl
>0053AD9F    je          0053ADAE
 0053ADA1    mov         byte ptr [ebp-2],1
 0053ADA5    mov         eax,dword ptr [ebp+8]
 0053ADA8    add         dword ptr [eax-4],2
>0053ADAC    jmp         0053ADCB
 0053ADAE    mov         eax,dword ptr [ebp+8]
 0053ADB1    mov         eax,esi
 0053ADB3    call        00539304
 0053ADB8    test        al,al
>0053ADBA    je          0053ADC5
 0053ADBC    mov         eax,dword ptr [ebp+8]
 0053ADBF    add         dword ptr [eax-4],2
>0053ADC3    jmp         0053ADCB
 0053ADC5    mov         byte ptr [ebp-1],0
>0053ADC9    jmp         0053ADE2
 0053ADCB    mov         eax,dword ptr [ebp+8]
 0053ADCE    mov         eax,dword ptr [eax-4]
 0053ADD1    movzx       esi,word ptr [eax]
 0053ADD4    test        si,si
>0053ADD7    je          0053ADE2
 0053ADD9    mov         eax,dword ptr [ebp+8]
 0053ADDC    cmp         si,5C
>0053ADE0    jne         0053AD71
 0053ADE2    movzx       eax,byte ptr [ebp-1]
 0053ADE6    and         al,byte ptr [ebp-2]
 0053ADE9    mov         byte ptr [ebp-1],al
 0053ADEC    movzx       eax,byte ptr [ebp-1]
 0053ADF0    pop         edi
 0053ADF1    pop         esi
 0053ADF2    pop         ebx
 0053ADF3    pop         ecx
 0053ADF4    pop         ebp
 0053ADF5    ret
end;*}

//0053ADF8
{*function sub_0053ADF8(?:?; ?:?):?;
begin
 0053ADF8    push        ebp
 0053ADF9    mov         ebp,esp
 0053ADFB    push        esi
 0053ADFC    push        edi
 0053ADFD    mov         esi,dword ptr [ebp+8]
 0053AE00    add         esi,0FFFFFFFC
 0053AE03    mov         cl,1
>0053AE05    jmp         0053AE52
 0053AE07    mov         edi,eax
 0053AE09    movzx       eax,di
 0053AE0C    cmp         eax,3A
>0053AE0F    jge         0053AE2A
 0053AE11    sub         eax,22
>0053AE14    je          0053AE41
 0053AE16    sub         eax,5
>0053AE19    je          0053AE41
 0053AE1B    add         eax,0FFFFFFFD
 0053AE1E    sub         eax,3
>0053AE21    jb          0053AE41
 0053AE23    sub         eax,2
>0053AE26    je          0053AE41
>0053AE28    jmp         0053AE45
 0053AE2A    add         eax,0FFFFFFC6
 0053AE2D    sub         eax,6
>0053AE30    jb          0053AE41
 0053AE32    sub         eax,1B
>0053AE35    je          0053AE41
 0053AE37    sub         eax,2
>0053AE3A    je          0053AE41
 0053AE3C    sub         eax,1F
>0053AE3F    jne         0053AE45
 0053AE41    mov         dl,1
>0053AE43    jmp         0053AE47
 0053AE45    xor         edx,edx
 0053AE47    test        dl,dl
>0053AE49    je          0053AE4F
 0053AE4B    xor         ecx,ecx
>0053AE4D    jmp         0053AE62
 0053AE4F    add         dword ptr [esi],2
 0053AE52    mov         eax,dword ptr [esi]
 0053AE54    movzx       eax,word ptr [eax]
 0053AE57    test        ax,ax
>0053AE5A    je          0053AE62
 0053AE5C    cmp         ax,5C
>0053AE60    jne         0053AE07
 0053AE62    mov         eax,ecx
 0053AE64    pop         edi
 0053AE65    pop         esi
 0053AE66    pop         ebp
 0053AE67    ret
end;*}

//0053AE68
{*function sub_0053AE68(?:?):?;
begin
 0053AE68    push        ebp
 0053AE69    mov         ebp,esp
 0053AE6B    push        0
 0053AE6D    push        0
 0053AE6F    push        0
 0053AE71    push        ebx
 0053AE72    push        esi
 0053AE73    mov         esi,eax
 0053AE75    xor         eax,eax
 0053AE77    push        ebp
 0053AE78    push        53AF39
 0053AE7D    push        dword ptr fs:[eax]
 0053AE80    mov         dword ptr fs:[eax],esp
 0053AE83    lea         eax,[ebp-8]
 0053AE86    push        eax
 0053AE87    mov         ecx,2
 0053AE8C    mov         edx,1
 0053AE91    mov         eax,esi
 0053AE93    call        @UStrCopy
 0053AE98    mov         eax,dword ptr [ebp-8]
 0053AE9B    mov         edx,53AF54;^TIdUDPClient.InitComponent
 0053AEA0    call        @UStrEqual
 0053AEA5    sete        bl
 0053AEA8    test        bl,bl
>0053AEAA    je          0053AF1E
 0053AEAC    lea         eax,[ebp-0C]
 0053AEAF    push        eax
 0053AEB0    mov         ecx,7
 0053AEB5    mov         edx,1
 0053AEBA    mov         eax,esi
 0053AEBC    call        @UStrCopy
 0053AEC1    mov         eax,dword ptr [ebp-0C]
 0053AEC4    mov         edx,53AF68;^TIdUDPClient.InitComponent
 0053AEC9    call        @UStrEqual
>0053AECE    jne         0053AED8
 0053AED0    lea         eax,[esi+0C]
 0053AED3    mov         dword ptr [ebp-4],eax
>0053AED6    jmp         0053AEFA
 0053AED8    lea         eax,[esi+2]
 0053AEDB    mov         dword ptr [ebp-4],eax
 0053AEDE    push        ebp
 0053AEDF    call        0053AD34
 0053AEE4    pop         ecx
 0053AEE5    test        al,al
>0053AEE7    je          0053AEF4
 0053AEE9    push        ebp
 0053AEEA    call        0053AD60
 0053AEEF    pop         ecx
 0053AEF0    test        al,al
>0053AEF2    jne         0053AEF8
 0053AEF4    xor         ebx,ebx
>0053AEF6    jmp         0053AEFA
 0053AEF8    mov         bl,1
 0053AEFA    test        bl,bl
>0053AEFC    je          0053AF09
 0053AEFE    push        ebp
 0053AEFF    call        0053AD34
 0053AF04    pop         ecx
 0053AF05    test        al,al
>0053AF07    jne         0053AF0D
 0053AF09    xor         eax,eax
>0053AF0B    jmp         0053AF0F
 0053AF0D    mov         al,1
 0053AF0F    mov         ebx,eax
 0053AF11    test        bl,bl
>0053AF13    je          0053AF1E
 0053AF15    push        ebp
 0053AF16    call        0053ADF8
 0053AF1B    pop         ecx
 0053AF1C    mov         ebx,eax
 0053AF1E    xor         eax,eax
 0053AF20    pop         edx
 0053AF21    pop         ecx
 0053AF22    pop         ecx
 0053AF23    mov         dword ptr fs:[eax],edx
 0053AF26    push        53AF40
 0053AF2B    lea         eax,[ebp-0C]
 0053AF2E    mov         edx,2
 0053AF33    call        @UStrArrayClr
 0053AF38    ret
>0053AF39    jmp         @HandleFinally
>0053AF3E    jmp         0053AF2B
 0053AF40    mov         eax,ebx
 0053AF42    pop         esi
 0053AF43    pop         ebx
 0053AF44    mov         esp,ebp
 0053AF46    pop         ebp
 0053AF47    ret
end;*}

//0053AF78
{*procedure sub_0053AF78(?:?; ?:?);
begin
 0053AF78    push        ebx
 0053AF79    push        esi
 0053AF7A    push        edi
 0053AF7B    mov         edi,edx
 0053AF7D    mov         ebx,eax
 0053AF7F    mov         edx,ebx
 0053AF81    mov         eax,edx
 0053AF83    test        eax,eax
>0053AF85    je          0053AF8C
 0053AF87    sub         eax,4
 0053AF8A    mov         eax,dword ptr [eax]
 0053AF8C    mov         esi,eax
 0053AF8E    test        esi,esi
>0053AF90    je          0053AFA8
 0053AF92    mov         eax,edx
 0053AF94    test        eax,eax
>0053AF96    je          0053AF9D
 0053AF98    sub         eax,4
 0053AF9B    mov         eax,dword ptr [eax]
 0053AF9D    cmp         word ptr [ebx+eax*2-2],5C
 0053AFA3    sete        al
>0053AFA6    jmp         0053AFAA
 0053AFA8    xor         eax,eax
 0053AFAA    test        al,al
>0053AFAC    je          0053AFC0
 0053AFAE    push        edi
 0053AFAF    mov         ecx,esi
 0053AFB1    dec         ecx
 0053AFB2    mov         edx,1
 0053AFB7    mov         eax,ebx
 0053AFB9    call        @UStrCopy
>0053AFBE    jmp         0053AFC9
 0053AFC0    mov         eax,edi
 0053AFC2    mov         edx,ebx
 0053AFC4    call        @UStrAsg
 0053AFC9    pop         edi
 0053AFCA    pop         esi
 0053AFCB    pop         ebx
 0053AFCC    ret
end;*}

//0053AFD0
{*function sub_0053AFD0(?:string):?;
begin
 0053AFD0    push        ebx
 0053AFD1    mov         ebx,eax
 0053AFD3    test        ebx,ebx
>0053AFD5    je          0053AFEE
 0053AFD7    push        ebx
 0053AFD8    call        kernel32.GetFileAttributesW
 0053AFDD    cmp         eax,0FFFFFFFF
>0053AFE0    je          0053AFE6
 0053AFE2    test        al,10
>0053AFE4    je          0053AFEA
 0053AFE6    xor         eax,eax
>0053AFE8    jmp         0053AFF0
 0053AFEA    mov         al,1
 0053AFEC    pop         ebx
 0053AFED    ret
 0053AFEE    xor         eax,eax
 0053AFF0    pop         ebx
 0053AFF1    ret
end;*}

//0053AFF4
{*procedure sub_0053AFF4(?:Integer; ?:?);
begin
 0053AFF4    push        ebx
 0053AFF5    push        esi
 0053AFF6    push        edi
 0053AFF7    mov         esi,edx
 0053AFF9    mov         edi,eax
 0053AFFB    mov         ebx,105
 0053B000    mov         eax,esi
 0053B002    mov         edx,ebx
 0053B004    call        @UStrSetLength
 0053B009    push        ebx
 0053B00A    mov         eax,dword ptr [esi]
 0053B00C    push        eax
 0053B00D    push        edi
 0053B00E    call        kernel32.GetModuleFileNameW
 0053B013    mov         ebx,eax
 0053B015    mov         eax,esi
 0053B017    mov         edx,ebx
 0053B019    call        @UStrSetLength
 0053B01E    pop         edi
 0053B01F    pop         esi
 0053B020    pop         ebx
 0053B021    ret
end;*}

//0053B208
{*procedure sub_0053B208(?:HWND; ?:?);
begin
 0053B208    push        ebp
 0053B209    mov         ebp,esp
 0053B20B    add         esp,0FFFFFD84
 0053B211    push        ebx
 0053B212    push        esi
 0053B213    mov         esi,edx
 0053B215    mov         ebx,eax
 0053B217    mov         eax,esi
 0053B219    call        @UStrClr
 0053B21E    test        ebx,ebx
>0053B220    je          0053B495
 0053B226    lea         eax,[ebp-8]
 0053B229    push        eax
 0053B22A    push        ebx
 0053B22B    call        user32.GetWindowThreadProcessId
 0053B230    mov         eax,dword ptr [ebp-8]
 0053B233    push        eax
 0053B234    push        0
 0053B236    push        410
 0053B23B    call        kernel32.OpenProcess
 0053B240    mov         ebx,eax
 0053B242    test        ebx,ebx
>0053B244    je          0053B463
 0053B24A    call        00533558
 0053B24F    cmp         al,0A
>0053B251    jae         0053B26F
 0053B253    mov         ecx,dword ptr ds:[78D270];^SResString413:TResStringRec
 0053B259    mov         dl,1
 0053B25B    mov         eax,[0052DED0];EJclWin32Error
 0053B260    call        EJclWin32Error.Create;EJclWin32Error.Create
 0053B265    call        @RaiseExcept
>0053B26A    jmp         0053B4C2
 0053B26F    call        00533558
 0053B274    cmp         al,0F
>0053B276    jb          0053B371
 0053B27C    push        53B4C8;'Kernel32.dll'
 0053B281    call        kernel32.LoadLibraryW
 0053B286    mov         dword ptr [ebp-4],eax
 0053B289    cmp         dword ptr [ebp-4],20
>0053B28D    jae         0053B33A
 0053B293    xor         edx,edx
 0053B295    push        ebp
 0053B296    push        53B333
 0053B29B    push        dword ptr fs:[edx]
 0053B29E    mov         dword ptr fs:[edx],esp
 0053B2A1    push        53B4E4;'QueryFullProcessImageNameW'
 0053B2A6    mov         eax,dword ptr [ebp-4]
 0053B2A9    push        eax
 0053B2AA    call        GetProcAddress
 0053B2AF    test        eax,eax
>0053B2B1    je          0053B2D8
 0053B2B3    push        25A
 0053B2B8    lea         edx,[ebp-262]
 0053B2BE    push        edx
 0053B2BF    push        0
 0053B2C1    push        ebx
 0053B2C2    call        eax
 0053B2C4    mov         eax,esi
 0053B2C6    lea         edx,[ebp-262]
 0053B2CC    mov         ecx,12D
 0053B2D1    call        @UStrFromWArray
>0053B2D6    jmp         0053B31C
 0053B2D8    mov         eax,53B528;'Kernel32.dll'
 0053B2DD    mov         dword ptr [ebp-274],eax
 0053B2E3    mov         byte ptr [ebp-270],11
 0053B2EA    mov         eax,53B550;'QueryFullProcessImageName'
 0053B2EF    mov         dword ptr [ebp-26C],eax
 0053B2F5    mov         byte ptr [ebp-268],11
 0053B2FC    lea         eax,[ebp-274]
 0053B302    push        eax
 0053B303    push        1
 0053B305    mov         ecx,dword ptr ds:[78D298];^SResString574:TResStringRec
 0053B30B    mov         dl,1
 0053B30D    mov         eax,[0053F4A0];EJclError
 0053B312    call        Exception.CreateResFmt;EJclError.Create
 0053B317    call        @RaiseExcept
 0053B31C    xor         eax,eax
 0053B31E    pop         edx
 0053B31F    pop         ecx
 0053B320    pop         ecx
 0053B321    mov         dword ptr fs:[eax],edx
 0053B324    push        53B4C2
 0053B329    mov         eax,dword ptr [ebp-4]
 0053B32C    push        eax
 0053B32D    call        kernel32.FreeLibrary
 0053B332    ret
>0053B333    jmp         @HandleFinally
>0053B338    jmp         0053B329
 0053B33A    mov         eax,53B528;'Kernel32.dll'
 0053B33F    mov         dword ptr [ebp-27C],eax
 0053B345    mov         byte ptr [ebp-278],11
 0053B34C    lea         eax,[ebp-27C]
 0053B352    push        eax
 0053B353    push        0
 0053B355    mov         ecx,dword ptr ds:[78CBA0];^SResString573:TResStringRec
 0053B35B    mov         dl,1
 0053B35D    mov         eax,[0053F4A0];EJclError
 0053B362    call        Exception.CreateResFmt;EJclError.Create
 0053B367    call        @RaiseExcept
>0053B36C    jmp         0053B4C2
 0053B371    push        53B584;'Psapi.dll'
 0053B376    call        kernel32.LoadLibraryW
 0053B37B    mov         dword ptr [ebp-4],eax
 0053B37E    cmp         dword ptr [ebp-4],20
>0053B382    jae         0053B42F
 0053B388    xor         edx,edx
 0053B38A    push        ebp
 0053B38B    push        53B428
 0053B390    push        dword ptr fs:[edx]
 0053B393    mov         dword ptr fs:[edx],esp
 0053B396    push        53B598;'GetModuleFileNameExW'
 0053B39B    mov         eax,dword ptr [ebp-4]
 0053B39E    push        eax
 0053B39F    call        GetProcAddress
 0053B3A4    test        eax,eax
>0053B3A6    je          0053B3CD
 0053B3A8    push        25A
 0053B3AD    lea         edx,[ebp-262]
 0053B3B3    push        edx
 0053B3B4    push        0
 0053B3B6    push        ebx
 0053B3B7    call        eax
 0053B3B9    mov         eax,esi
 0053B3BB    lea         edx,[ebp-262]
 0053B3C1    mov         ecx,12D
 0053B3C6    call        @UStrFromWArray
>0053B3CB    jmp         0053B411
 0053B3CD    mov         eax,53B5D0;'Psapi.dll'
 0053B3D2    mov         dword ptr [ebp-274],eax
 0053B3D8    mov         byte ptr [ebp-270],11
 0053B3DF    mov         eax,53B5F0;'GetModuleFileNameEx'
 0053B3E4    mov         dword ptr [ebp-26C],eax
 0053B3EA    mov         byte ptr [ebp-268],11
 0053B3F1    lea         eax,[ebp-274]
 0053B3F7    push        eax
 0053B3F8    push        1
 0053B3FA    mov         ecx,dword ptr ds:[78D298];^SResString574:TResStringRec
 0053B400    mov         dl,1
 0053B402    mov         eax,[0053F4A0];EJclError
 0053B407    call        Exception.CreateResFmt;EJclError.Create
 0053B40C    call        @RaiseExcept
 0053B411    xor         eax,eax
 0053B413    pop         edx
 0053B414    pop         ecx
 0053B415    pop         ecx
 0053B416    mov         dword ptr fs:[eax],edx
 0053B419    push        53B4C2
 0053B41E    mov         eax,dword ptr [ebp-4]
 0053B421    push        eax
 0053B422    call        kernel32.FreeLibrary
 0053B427    ret
>0053B428    jmp         @HandleFinally
>0053B42D    jmp         0053B41E
 0053B42F    mov         eax,53B5D0;'Psapi.dll'
 0053B434    mov         dword ptr [ebp-27C],eax
 0053B43A    mov         byte ptr [ebp-278],11
 0053B441    lea         eax,[ebp-27C]
 0053B447    push        eax
 0053B448    push        0
 0053B44A    mov         ecx,dword ptr ds:[78CBA0];^SResString573:TResStringRec
 0053B450    mov         dl,1
 0053B452    mov         eax,[0053F4A0];EJclError
 0053B457    call        Exception.CreateResFmt;EJclError.Create
 0053B45C    call        @RaiseExcept
>0053B461    jmp         0053B4C2
 0053B463    mov         eax,dword ptr [ebp-8]
 0053B466    mov         dword ptr [ebp-27C],eax
 0053B46C    mov         byte ptr [ebp-278],0
 0053B473    lea         eax,[ebp-27C]
 0053B479    push        eax
 0053B47A    push        0
 0053B47C    mov         ecx,dword ptr ds:[78D870];^SResString415:TResStringRec
 0053B482    mov         dl,1
 0053B484    mov         eax,[0053F4A0];EJclError
 0053B489    call        Exception.CreateResFmt;EJclError.Create
 0053B48E    call        @RaiseExcept
>0053B493    jmp         0053B4C2
 0053B495    mov         dword ptr [ebp-27C],ebx
 0053B49B    mov         byte ptr [ebp-278],0
 0053B4A2    lea         eax,[ebp-27C]
 0053B4A8    push        eax
 0053B4A9    push        0
 0053B4AB    mov         ecx,dword ptr ds:[78DBA8];^SResString414:TResStringRec
 0053B4B1    mov         dl,1
 0053B4B3    mov         eax,[0053F4A0];EJclError
 0053B4B8    call        Exception.CreateResFmt;EJclError.Create
 0053B4BD    call        @RaiseExcept
 0053B4C2    pop         esi
 0053B4C3    pop         ebx
 0053B4C4    mov         esp,ebp
 0053B4C6    pop         ebp
 0053B4C7    ret
end;*}

//0053B618
{*function sub_0053B618(?:?; ?:?):?;
begin
 0053B618    push        ebp
 0053B619    mov         ebp,esp
 0053B61B    add         esp,0FFFFFFEC
 0053B61E    push        ebx
 0053B61F    push        esi
 0053B620    push        edi
 0053B621    xor         ecx,ecx
 0053B623    mov         dword ptr [ebp-4],ecx
 0053B626    mov         dword ptr [ebp-8],edx
 0053B629    mov         esi,eax
 0053B62B    xor         eax,eax
 0053B62D    push        ebp
 0053B62E    push        53B6CE
 0053B633    push        dword ptr fs:[eax]
 0053B636    mov         dword ptr fs:[eax],esp
 0053B639    xor         ebx,ebx
 0053B63B    xor         eax,eax
 0053B63D    mov         dword ptr [ebp-10],eax
 0053B640    lea         eax,[ebp-10]
 0053B643    push        eax
 0053B644    mov         eax,esi
 0053B646    call        @UStrToPWChar
 0053B64B    push        eax
 0053B64C    call        version.GetFileVersionInfoSizeW
 0053B651    mov         edi,eax
 0053B653    test        edi,edi
>0053B655    jbe         0053B6B8
 0053B657    lea         eax,[ebp-4]
 0053B65A    mov         edx,edi
 0053B65C    call        @UStrSetLength
 0053B661    xor         eax,eax
 0053B663    mov         dword ptr [ebp-0C],eax
 0053B666    xor         eax,eax
 0053B668    mov         dword ptr [ebp-14],eax
 0053B66B    mov         eax,dword ptr [ebp-4]
 0053B66E    push        eax
 0053B66F    push        edi
 0053B670    mov         eax,dword ptr [ebp-10]
 0053B673    push        eax
 0053B674    mov         eax,esi
 0053B676    call        @UStrToPWChar
 0053B67B    push        eax
 0053B67C    call        version.GetFileVersionInfoW
 0053B681    test        eax,eax
>0053B683    je          0053B6B8
 0053B685    lea         eax,[ebp-0C]
 0053B688    push        eax
 0053B689    lea         eax,[ebp-14]
 0053B68C    push        eax
 0053B68D    push        53B6E0;'\'
 0053B692    mov         eax,dword ptr [ebp-4]
 0053B695    push        eax
 0053B696    call        version.VerQueryValueW
 0053B69B    test        eax,eax
>0053B69D    je          0053B6B8
 0053B69F    cmp         dword ptr [ebp-0C],34
>0053B6A3    jne         0053B6B8
 0053B6A5    mov         bl,1
 0053B6A7    mov         eax,dword ptr [ebp-14]
 0053B6AA    mov         edx,dword ptr [ebp-8]
 0053B6AD    mov         esi,eax
 0053B6AF    mov         edi,edx
 0053B6B1    mov         ecx,0D
 0053B6B6    rep movs    dword ptr [edi],dword ptr [esi]
 0053B6B8    xor         eax,eax
 0053B6BA    pop         edx
 0053B6BB    pop         ecx
 0053B6BC    pop         ecx
 0053B6BD    mov         dword ptr fs:[eax],edx
 0053B6C0    push        53B6D5
 0053B6C5    lea         eax,[ebp-4]
 0053B6C8    call        @UStrClr
 0053B6CD    ret
>0053B6CE    jmp         @HandleFinally
>0053B6D3    jmp         0053B6C5
 0053B6D5    mov         eax,ebx
 0053B6D7    pop         edi
 0053B6D8    pop         esi
 0053B6D9    pop         ebx
 0053B6DA    mov         esp,ebp
 0053B6DC    pop         ebp
 0053B6DD    ret
end;*}

//0053B6E4
constructor sub_0053B6E4(VersionInfoData:Pointer; Size:Integer);
begin
{*
 0053B6E4    push        ebp
 0053B6E5    mov         ebp,esp
 0053B6E7    push        ecx
 0053B6E8    push        ebx
 0053B6E9    push        esi
 0053B6EA    push        edi
 0053B6EB    test        dl,dl
>0053B6ED    je          0053B6F7
 0053B6EF    add         esp,0FFFFFFF0
 0053B6F2    call        @ClassCreate
 0053B6F7    mov         edi,ecx
 0053B6F9    mov         byte ptr [ebp-1],dl
 0053B6FC    mov         ebx,eax
 0053B6FE    mov         esi,dword ptr [ebp+8]
 0053B701    lea         eax,[ebx+4];TJclFileVersionInfo.FBuffer:AnsiString
 0053B704    xor         ecx,ecx
 0053B706    mov         edx,esi
 0053B708    call        @LStrSetLength
 0053B70D    mov         eax,dword ptr [ebx+4];TJclFileVersionInfo.FBuffer:AnsiString
 0053B710    call        @LStrToPChar
 0053B715    mov         edx,eax
 0053B717    mov         ecx,esi
 0053B719    mov         eax,edi
 0053B71B    call        Move
 0053B720    mov         eax,ebx
 0053B722    call        0053BF78
 0053B727    mov         eax,ebx
 0053B729    cmp         byte ptr [ebp-1],0
>0053B72D    je          0053B73E
 0053B72F    call        @AfterConstruction
 0053B734    pop         dword ptr fs:[0]
 0053B73B    add         esp,0C
 0053B73E    mov         eax,ebx
 0053B740    pop         edi
 0053B741    pop         esi
 0053B742    pop         ebx
 0053B743    pop         ecx
 0053B744    pop         ebp
 0053B745    ret         4
*}
end;

//0053B748
constructor TJclFileVersionInfo.Create(FileName:string);
begin
{*
 0053B748    push        ebp
 0053B749    mov         ebp,esp
 0053B74B    add         esp,0FFFFFFF0
 0053B74E    push        ebx
 0053B74F    push        esi
 0053B750    push        edi
 0053B751    test        dl,dl
>0053B753    je          0053B75D
 0053B755    add         esp,0FFFFFFF0
 0053B758    call        @ClassCreate
 0053B75D    mov         edi,ecx
 0053B75F    mov         byte ptr [ebp-1],dl
 0053B762    mov         ebx,eax
 0053B764    mov         eax,edi
 0053B766    call        0053AFD0
 0053B76B    test        al,al
>0053B76D    jne         0053B793
 0053B76F    mov         dword ptr [ebp-10],edi
 0053B772    mov         byte ptr [ebp-0C],11
 0053B776    lea         eax,[ebp-10]
 0053B779    push        eax
 0053B77A    push        0
 0053B77C    mov         ecx,dword ptr ds:[78D028];^SResString418:TResStringRec
 0053B782    mov         dl,1
 0053B784    mov         eax,[00539D44];EJclFileVersionInfoError
 0053B789    call        Exception.CreateResFmt;EJclFileVersionInfoError.Create
 0053B78E    call        @RaiseExcept
 0053B793    xor         eax,eax
 0053B795    mov         dword ptr [ebp-8],eax
 0053B798    lea         eax,[ebp-8]
 0053B79B    push        eax
 0053B79C    mov         eax,edi
 0053B79E    call        @UStrToPWChar
 0053B7A3    push        eax
 0053B7A4    call        version.GetFileVersionInfoSizeW
 0053B7A9    mov         esi,eax
 0053B7AB    test        esi,esi
>0053B7AD    jne         0053B7C6
 0053B7AF    mov         ecx,dword ptr ds:[78D228];^SResString417:TResStringRec
 0053B7B5    mov         dl,1
 0053B7B7    mov         eax,[00539D44];EJclFileVersionInfoError
 0053B7BC    call        Exception.CreateRes;EJclFileVersionInfoError.Create
 0053B7C1    call        @RaiseExcept
 0053B7C6    lea         eax,[ebx+4];TJclFileVersionInfo.FBuffer:AnsiString
 0053B7C9    xor         ecx,ecx
 0053B7CB    mov         edx,esi
 0053B7CD    call        @LStrSetLength
 0053B7D2    mov         eax,dword ptr [ebx+4];TJclFileVersionInfo.FBuffer:AnsiString
 0053B7D5    call        @LStrToPChar
 0053B7DA    push        eax
 0053B7DB    push        esi
 0053B7DC    mov         eax,dword ptr [ebp-8]
 0053B7DF    push        eax
 0053B7E0    mov         eax,edi
 0053B7E2    call        @UStrToPWChar
 0053B7E7    push        eax
 0053B7E8    call        version.GetFileVersionInfoW
 0053B7ED    call        Win32Check
 0053B7F2    mov         eax,ebx
 0053B7F4    call        0053BF78
 0053B7F9    mov         eax,ebx
 0053B7FB    cmp         byte ptr [ebp-1],0
>0053B7FF    je          0053B810
 0053B801    call        @AfterConstruction
 0053B806    pop         dword ptr fs:[0]
 0053B80D    add         esp,0C
 0053B810    mov         eax,ebx
 0053B812    pop         edi
 0053B813    pop         esi
 0053B814    pop         ebx
 0053B815    mov         esp,ebp
 0053B817    pop         ebp
 0053B818    ret
*}
end;

//0053B81C
constructor sub_0053B81C(Window:HWND);
begin
{*
 0053B81C    push        ebp
 0053B81D    mov         ebp,esp
 0053B81F    push        0
 0053B821    push        ebx
 0053B822    push        esi
 0053B823    push        edi
 0053B824    test        dl,dl
>0053B826    je          0053B830
 0053B828    add         esp,0FFFFFFF0
 0053B82B    call        @ClassCreate
 0053B830    mov         esi,ecx
 0053B832    mov         ebx,edx
 0053B834    mov         edi,eax
 0053B836    xor         eax,eax
 0053B838    push        ebp
 0053B839    push        53B870
 0053B83E    push        dword ptr fs:[eax]
 0053B841    mov         dword ptr fs:[eax],esp
 0053B844    lea         edx,[ebp-4]
 0053B847    mov         eax,esi
 0053B849    call        0053B208
 0053B84E    mov         ecx,dword ptr [ebp-4]
 0053B851    xor         edx,edx
 0053B853    mov         eax,edi
 0053B855    call        TJclFileVersionInfo.Create
 0053B85A    xor         eax,eax
 0053B85C    pop         edx
 0053B85D    pop         ecx
 0053B85E    pop         ecx
 0053B85F    mov         dword ptr fs:[eax],edx
 0053B862    push        53B877
 0053B867    lea         eax,[ebp-4]
 0053B86A    call        @UStrClr
 0053B86F    ret
>0053B870    jmp         @HandleFinally
>0053B875    jmp         0053B867
 0053B877    mov         eax,edi
 0053B879    test        bl,bl
>0053B87B    je          0053B88C
 0053B87D    call        @AfterConstruction
 0053B882    pop         dword ptr fs:[0]
 0053B889    add         esp,0C
 0053B88C    mov         eax,edi
 0053B88E    pop         edi
 0053B88F    pop         esi
 0053B890    pop         ebx
 0053B891    pop         ecx
 0053B892    pop         ebp
 0053B893    ret
*}
end;

//0053B894
constructor sub_0053B894(Module:Cardinal);
begin
{*
 0053B894    push        ebp
 0053B895    mov         ebp,esp
 0053B897    add         esp,0FFFFFFF4
 0053B89A    push        ebx
 0053B89B    push        esi
 0053B89C    push        edi
 0053B89D    xor         ebx,ebx
 0053B89F    mov         dword ptr [ebp-4],ebx
 0053B8A2    test        dl,dl
>0053B8A4    je          0053B8AE
 0053B8A6    add         esp,0FFFFFFF0
 0053B8A9    call        @ClassCreate
 0053B8AE    mov         edi,ecx
 0053B8B0    mov         ebx,edx
 0053B8B2    mov         esi,eax
 0053B8B4    xor         eax,eax
 0053B8B6    push        ebp
 0053B8B7    push        53B918
 0053B8BC    push        dword ptr fs:[eax]
 0053B8BF    mov         dword ptr fs:[eax],esp
 0053B8C2    test        edi,edi
>0053B8C4    je          0053B8DE
 0053B8C6    lea         edx,[ebp-4]
 0053B8C9    mov         eax,edi
 0053B8CB    call        0053AFF4
 0053B8D0    mov         ecx,dword ptr [ebp-4]
 0053B8D3    xor         edx,edx
 0053B8D5    mov         eax,esi
 0053B8D7    call        TJclFileVersionInfo.Create
>0053B8DC    jmp         0053B902
 0053B8DE    mov         dword ptr [ebp-0C],edi
 0053B8E1    mov         byte ptr [ebp-8],0
 0053B8E5    lea         eax,[ebp-0C]
 0053B8E8    push        eax
 0053B8E9    push        0
 0053B8EB    mov         ecx,dword ptr ds:[78CEB0];^SResString416:TResStringRec
 0053B8F1    mov         dl,1
 0053B8F3    mov         eax,[0053F4A0];EJclError
 0053B8F8    call        Exception.CreateResFmt;EJclError.Create
 0053B8FD    call        @RaiseExcept
 0053B902    xor         eax,eax
 0053B904    pop         edx
 0053B905    pop         ecx
 0053B906    pop         ecx
 0053B907    mov         dword ptr fs:[eax],edx
 0053B90A    push        53B91F
 0053B90F    lea         eax,[ebp-4]
 0053B912    call        @UStrClr
 0053B917    ret
>0053B918    jmp         @HandleFinally
>0053B91D    jmp         0053B90F
 0053B91F    mov         eax,esi
 0053B921    test        bl,bl
>0053B923    je          0053B934
 0053B925    call        @AfterConstruction
 0053B92A    pop         dword ptr fs:[0]
 0053B931    add         esp,0C
 0053B934    mov         eax,esi
 0053B936    pop         edi
 0053B937    pop         esi
 0053B938    pop         ebx
 0053B939    mov         esp,ebp
 0053B93B    pop         ebp
 0053B93C    ret
*}
end;

//0053B940
destructor TJclFileVersionInfo.Destroy();
begin
{*
 0053B940    push        ebx
 0053B941    push        esi
 0053B942    call        @BeforeDestruction
 0053B947    mov         ebx,edx
 0053B949    mov         esi,eax
 0053B94B    lea         eax,[esi+10];TJclFileVersionInfo.FItemList:TStringList
 0053B94E    mov         edx,dword ptr [eax]
 0053B950    xor         ecx,ecx
 0053B952    mov         dword ptr [eax],ecx
 0053B954    mov         eax,edx
 0053B956    call        TObject.Free
 0053B95B    lea         eax,[esi+14];TJclFileVersionInfo.FItems:TStringList
 0053B95E    mov         edx,dword ptr [eax]
 0053B960    xor         ecx,ecx
 0053B962    mov         dword ptr [eax],ecx
 0053B964    mov         eax,edx
 0053B966    call        TObject.Free
 0053B96B    mov         edx,ebx
 0053B96D    and         dl,0FC
 0053B970    mov         eax,esi
 0053B972    call        TObject.Destroy
 0053B977    test        bl,bl
>0053B979    jle         0053B982
 0053B97B    mov         eax,esi
 0053B97D    call        @ClassDestroy
 0053B982    pop         esi
 0053B983    pop         ebx
 0053B984    ret
*}
end;

//0053B9B8
procedure sub_0053B9B8(?:TJclFileVersionInfo);
begin
{*
 0053B9B8    push        ebp
 0053B9B9    mov         ebp,esp
 0053B9BB    add         esp,0FFFFFFF8
 0053B9BE    push        ebx
 0053B9BF    push        esi
 0053B9C0    push        edi
 0053B9C1    xor         edx,edx
 0053B9C3    mov         dword ptr [ebp-8],edx
 0053B9C6    mov         ebx,eax
 0053B9C8    xor         eax,eax
 0053B9CA    push        ebp
 0053B9CB    push        53BA47
 0053B9D0    push        dword ptr fs:[eax]
 0053B9D3    mov         dword ptr fs:[eax],esp
 0053B9D6    mov         eax,ebx
 0053B9D8    call        0053C660
 0053B9DD    mov         edx,dword ptr [eax]
 0053B9DF    call        dword ptr [edx+44]
 0053B9E2    mov         eax,dword ptr [ebx+10]
 0053B9E5    mov         edx,dword ptr [eax]
 0053B9E7    call        dword ptr [edx+14]
 0053B9EA    dec         eax
 0053B9EB    test        eax,eax
>0053B9ED    jl          0053BA31
 0053B9EF    inc         eax
 0053B9F0    mov         dword ptr [ebp-4],eax
 0053B9F3    xor         esi,esi
 0053B9F5    mov         edx,esi
 0053B9F7    mov         eax,dword ptr [ebx+10]
 0053B9FA    mov         ecx,dword ptr [eax]
 0053B9FC    call        dword ptr [ecx+18]
 0053B9FF    cmp         eax,dword ptr [ebx+1C]
>0053BA02    jne         0053BA2B
 0053BA04    lea         ecx,[ebp-8]
 0053BA07    mov         edx,esi
 0053BA09    mov         eax,dword ptr [ebx+10]
 0053BA0C    mov         edi,dword ptr [eax]
 0053BA0E    call        dword ptr [edi+0C]
 0053BA11    mov         eax,dword ptr [ebp-8]
 0053BA14    push        eax
 0053BA15    mov         eax,ebx
 0053BA17    call        0053C660
 0053BA1C    mov         edx,dword ptr [ebx+18]
 0053BA1F    mov         ecx,dword ptr [ebx+1C]
 0053BA22    mov         ecx,dword ptr [edx+ecx*4]
 0053BA25    pop         edx
 0053BA26    mov         edi,dword ptr [eax]
 0053BA28    call        dword ptr [edi+3C]
 0053BA2B    inc         esi
 0053BA2C    dec         dword ptr [ebp-4]
>0053BA2F    jne         0053B9F5
 0053BA31    xor         eax,eax
 0053BA33    pop         edx
 0053BA34    pop         ecx
 0053BA35    pop         ecx
 0053BA36    mov         dword ptr fs:[eax],edx
 0053BA39    push        53BA4E
 0053BA3E    lea         eax,[ebp-8]
 0053BA41    call        @UStrClr
 0053BA46    ret
>0053BA47    jmp         @HandleFinally
>0053BA4C    jmp         0053BA3E
 0053BA4E    pop         edi
 0053BA4F    pop         esi
 0053BA50    pop         ebx
 0053BA51    pop         ecx
 0053BA52    pop         ecx
 0053BA53    pop         ebp
 0053BA54    ret
*}
end;

//0053BA58
procedure sub_0053BA58;
begin
{*
>0053BA58    jmp         0053BA5C
*}
end;

//0053BA64
{*procedure sub_0053BA64(?:?);
begin
 0053BA64    push        ebp
 0053BA65    mov         ebp,esp
 0053BA67    push        ecx
 0053BA68    push        ebx
 0053BA69    mov         eax,dword ptr [ebp+8]
 0053BA6C    mov         eax,dword ptr [eax-8]
 0053BA6F    mov         dword ptr [ebp-4],eax
 0053BA72    mov         eax,dword ptr [ebp-4]
 0053BA75    movzx       eax,word ptr [eax]
 0053BA78    mov         edx,dword ptr [ebp+8]
 0053BA7B    mov         word ptr [edx-0A],ax
 0053BA7F    mov         eax,dword ptr [ebp+8]
 0053BA82    cmp         word ptr [eax-0A],0
>0053BA87    jne         0053BA95
 0053BA89    mov         eax,dword ptr [ebp+8]
 0053BA8C    mov         byte ptr [eax-0B],1
>0053BA90    jmp         0053BB26
 0053BA95    add         dword ptr [ebp-4],2
 0053BA99    mov         eax,dword ptr [ebp-4]
 0053BA9C    movzx       eax,word ptr [eax]
 0053BA9F    mov         edx,dword ptr [ebp+8]
 0053BAA2    mov         word ptr [edx-0E],ax
 0053BAA6    add         dword ptr [ebp-4],2
 0053BAAA    mov         eax,dword ptr [ebp+8]
 0053BAAD    cmp         byte ptr [eax-0F],0
>0053BAB1    je          0053BAE2
 0053BAB3    mov         eax,dword ptr [ebp-4]
 0053BAB6    movzx       eax,word ptr [eax]
 0053BAB9    mov         edx,dword ptr [ebp+8]
 0053BABC    mov         word ptr [edx-12],ax
 0053BAC0    add         dword ptr [ebp-4],2
 0053BAC4    mov         ebx,dword ptr [ebp-4]
 0053BAC7    push        ebx
 0053BAC8    call        kernel32.lstrlenW
 0053BACD    inc         eax
 0053BACE    add         eax,eax
 0053BAD0    add         dword ptr [ebp-4],eax
 0053BAD3    mov         eax,dword ptr [ebp+8]
 0053BAD6    add         eax,0FFFFFFFC
 0053BAD9    mov         edx,ebx
 0053BADB    call        @UStrFromPWChar
>0053BAE0    jmp         0053BB06
 0053BAE2    mov         eax,dword ptr [ebp+8]
 0053BAE5    mov         word ptr [eax-12],1
 0053BAEB    mov         eax,dword ptr [ebp+8]
 0053BAEE    add         eax,0FFFFFFFC
 0053BAF1    mov         edx,dword ptr [ebp-4]
 0053BAF4    call        @UStrFromPChar
 0053BAF9    mov         eax,dword ptr [ebp-4]
 0053BAFC    push        eax
 0053BAFD    call        kernel32.lstrlenA
 0053BB02    inc         eax
 0053BB03    add         dword ptr [ebp-4],eax
 0053BB06    lea         eax,[ebp-4]
 0053BB09    call        0053BA58
 0053BB0E    mov         eax,dword ptr [ebp+8]
 0053BB11    mov         edx,dword ptr [ebp-4]
 0053BB14    sub         edx,dword ptr [eax-8]
 0053BB17    mov         eax,dword ptr [ebp+8]
 0053BB1A    mov         dword ptr [eax-18],edx
 0053BB1D    mov         eax,dword ptr [ebp+8]
 0053BB20    mov         edx,dword ptr [ebp-4]
 0053BB23    mov         dword ptr [eax-8],edx
 0053BB26    pop         ebx
 0053BB27    pop         ecx
 0053BB28    pop         ebp
 0053BB29    ret
end;*}

//0053BB2C
{*procedure sub_0053BB2C(?:?);
begin
 0053BB2C    push        ebp
 0053BB2D    mov         ebp,esp
 0053BB2F    push        ebx
 0053BB30    push        esi
 0053BB31    mov         esi,dword ptr [ebp+8]
 0053BB34    add         esi,0FFFFFFFC
 0053BB37    mov         edx,dword ptr [esi]
 0053BB39    mov         eax,53BBA0;'0x'
 0053BB3E    call        Pos
 0053BB43    mov         ebx,eax
 0053BB45    test        ebx,ebx
>0053BB47    jle         0053BB57
 0053BB49    mov         eax,esi
 0053BB4B    mov         ecx,2
 0053BB50    mov         edx,ebx
 0053BB52    call        @UStrDelete
 0053BB57    test        ebx,ebx
>0053BB59    jne         0053BB37
 0053BB5B    mov         ebx,1
>0053BB60    jmp         0053BB83
 0053BB62    mov         eax,dword ptr [esi]
 0053BB64    movzx       eax,word ptr [eax+ebx*2-2]
 0053BB69    call        00539314
 0053BB6E    test        al,al
>0053BB70    je          0053BB75
 0053BB72    inc         ebx
>0053BB73    jmp         0053BB83
 0053BB75    mov         eax,esi
 0053BB77    mov         ecx,1
 0053BB7C    mov         edx,ebx
 0053BB7E    call        @UStrDelete
 0053BB83    mov         eax,dword ptr [esi]
 0053BB85    call        @UStrLen
 0053BB8A    cmp         ebx,eax
>0053BB8C    jle         0053BB62
 0053BB8E    pop         esi
 0053BB8F    pop         ebx
 0053BB90    pop         ebp
 0053BB91    ret
end;*}

//0053BBA8
{*procedure sub_0053BBA8(?:?; ?:?);
begin
 0053BBA8    push        ebp
 0053BBA9    mov         ebp,esp
 0053BBAB    add         esp,0FFFFFFC0
 0053BBAE    push        ebx
 0053BBAF    push        esi
 0053BBB0    push        edi
 0053BBB1    xor         edx,edx
 0053BBB3    mov         dword ptr [ebp-40],edx
 0053BBB6    mov         dword ptr [ebp-28],edx
 0053BBB9    mov         dword ptr [ebp-2C],edx
 0053BBBC    mov         dword ptr [ebp-20],edx
 0053BBBF    mov         dword ptr [ebp-24],edx
 0053BBC2    mov         dword ptr [ebp-4],edx
 0053BBC5    mov         ebx,dword ptr [ebp+8]
 0053BBC8    add         ebx,0FFFFFFF8
 0053BBCB    xor         edx,edx
 0053BBCD    push        ebp
 0053BBCE    push        53BE7F
 0053BBD3    push        dword ptr fs:[edx]
 0053BBD6    mov         dword ptr fs:[edx],esp
 0053BBD9    add         eax,dword ptr [ebx]
 0053BBDB    mov         dword ptr [ebp-8],eax
 0053BBDE    xor         esi,esi
>0053BBE0    jmp         0053BE40
 0053BBE5    mov         eax,dword ptr [ebp+8]
 0053BBE8    push        eax
 0053BBE9    call        0053BA64
 0053BBEE    pop         ecx
 0053BBEF    mov         eax,dword ptr [ebp+8]
 0053BBF2    push        eax
 0053BBF3    call        0053BB2C
 0053BBF8    pop         ecx
 0053BBF9    mov         eax,dword ptr [ebp+8]
 0053BBFC    cmp         word ptr [eax-0E],0
>0053BC01    je          0053BC09
 0053BC03    mov         byte ptr [ebp-19],1
>0053BC07    jmp         0053BC31
 0053BC09    mov         eax,dword ptr [ebp+8]
 0053BC0C    mov         eax,dword ptr [eax-4]
 0053BC0F    mov         dword ptr [ebp-14],eax
 0053BC12    mov         eax,dword ptr [ebp-14]
 0053BC15    mov         dword ptr [ebp-18],eax
 0053BC18    cmp         dword ptr [ebp-18],0
>0053BC1C    je          0053BC29
 0053BC1E    mov         eax,dword ptr [ebp-18]
 0053BC21    sub         eax,4
 0053BC24    mov         eax,dword ptr [eax]
 0053BC26    mov         dword ptr [ebp-18],eax
 0053BC29    cmp         dword ptr [ebp-18],8
 0053BC2D    setne       byte ptr [ebp-19]
 0053BC31    cmp         byte ptr [ebp-19],0
>0053BC35    je          0053BC43
 0053BC37    mov         eax,dword ptr [ebp+8]
 0053BC3A    mov         byte ptr [eax-0B],1
>0053BC3E    jmp         0053BE54
 0053BC43    mov         eax,ebx
 0053BC45    call        0053BA58
 0053BC4A    lea         eax,[ebp-24]
 0053BC4D    push        eax
 0053BC4E    mov         eax,dword ptr [ebp+8]
 0053BC51    mov         eax,dword ptr [eax-4]
 0053BC54    mov         ecx,4
 0053BC59    mov         edx,1
 0053BC5E    call        @UStrCopy
 0053BC63    mov         ecx,dword ptr [ebp-24]
 0053BC66    lea         eax,[ebp-20]
 0053BC69    mov         edx,53BE9C;'$'
 0053BC6E    call        @UStrCat3
 0053BC73    mov         eax,dword ptr [ebp-20]
 0053BC76    xor         edx,edx
 0053BC78    call        StrToIntDef
 0053BC7D    mov         word ptr [ebp-10],ax
 0053BC81    lea         eax,[ebp-2C]
 0053BC84    push        eax
 0053BC85    mov         eax,dword ptr [ebp+8]
 0053BC88    mov         eax,dword ptr [eax-4]
 0053BC8B    mov         ecx,4
 0053BC90    mov         edx,5
 0053BC95    call        @UStrCopy
 0053BC9A    mov         ecx,dword ptr [ebp-2C]
 0053BC9D    lea         eax,[ebp-28]
 0053BCA0    mov         edx,53BE9C;'$'
 0053BCA5    call        @UStrCat3
 0053BCAA    mov         eax,dword ptr [ebp-28]
 0053BCAD    xor         edx,edx
 0053BCAF    call        StrToIntDef
 0053BCB4    mov         word ptr [ebp-0E],ax
 0053BCB8    lea         eax,[esi+1]
 0053BCBB    push        eax
 0053BCBC    mov         eax,dword ptr [ebp+8]
 0053BCBF    mov         eax,dword ptr [eax-1C]
 0053BCC2    add         eax,18
 0053BCC5    mov         ecx,1
 0053BCCA    mov         edx,dword ptr ds:[539DFC];:TJclFileVersionInfo.:1
 0053BCD0    call        @DynArraySetLength
 0053BCD5    add         esp,4
 0053BCD8    mov         eax,dword ptr [ebp+8]
 0053BCDB    mov         eax,dword ptr [eax-1C]
 0053BCDE    mov         eax,dword ptr [eax+18]
 0053BCE1    mov         edx,dword ptr [ebp-10]
 0053BCE4    mov         dword ptr [eax+esi*4],edx
 0053BCE7    mov         eax,dword ptr [ebx]
 0053BCE9    mov         edx,dword ptr [ebp+8]
 0053BCEC    movzx       edx,word ptr [edx-0A]
 0053BCF0    add         eax,edx
 0053BCF2    mov         edx,dword ptr [ebp+8]
 0053BCF5    sub         eax,dword ptr [edx-18]
 0053BCF8    mov         dword ptr [ebp-0C],eax
>0053BCFB    jmp         0053BE2B
 0053BD00    mov         eax,dword ptr [ebp+8]
 0053BD03    push        eax
 0053BD04    call        0053BA64
 0053BD09    pop         ecx
 0053BD0A    mov         eax,dword ptr [ebp+8]
 0053BD0D    movzx       eax,word ptr [eax-12]
 0053BD11    sub         ax,1
>0053BD15    jb          0053BD1E
>0053BD17    je          0053BD88
>0053BD19    jmp         0053BDCC
 0053BD1E    mov         eax,dword ptr [ebp+8]
 0053BD21    movzx       eax,word ptr [eax-0E]
 0053BD25    dec         eax
 0053BD26    sub         ax,4
>0053BD2A    jae         0053BD5F
 0053BD2C    lea         eax,[ebp-4]
 0053BD2F    push        eax
 0053BD30    mov         eax,dword ptr [ebp+8]
 0053BD33    movzx       eax,word ptr [eax-0E]
 0053BD37    add         eax,eax
 0053BD39    mov         dword ptr [ebp-3C],eax
 0053BD3C    mov         byte ptr [ebp-38],0
 0053BD40    mov         eax,dword ptr [ebx]
 0053BD42    mov         eax,dword ptr [eax]
 0053BD44    mov         dword ptr [ebp-34],eax
 0053BD47    mov         byte ptr [ebp-30],0
 0053BD4B    lea         edx,[ebp-3C]
 0053BD4E    mov         ecx,1
 0053BD53    mov         eax,53BEAC;'$%.*x'
 0053BD58    call        Format
>0053BD5D    jmp         0053BDD5
 0053BD5F    mov         eax,dword ptr [ebp+8]
 0053BD62    cmp         word ptr [eax-0E],0
>0053BD67    jbe         0053BD7E
 0053BD69    mov         eax,dword ptr [ebp+8]
 0053BD6C    cmp         byte ptr [eax-0F],0
>0053BD70    je          0053BD7E
 0053BD72    lea         eax,[ebp-4]
 0053BD75    mov         edx,dword ptr [ebx]
 0053BD77    call        @UStrFromPWChar
>0053BD7C    jmp         0053BDD5
 0053BD7E    lea         eax,[ebp-4]
 0053BD81    call        @UStrClr
>0053BD86    jmp         0053BDD5
 0053BD88    mov         eax,dword ptr [ebp+8]
 0053BD8B    cmp         word ptr [eax-0E],0
>0053BD90    jne         0053BD9C
 0053BD92    lea         eax,[ebp-4]
 0053BD95    call        @UStrClr
>0053BD9A    jmp         0053BDD5
 0053BD9C    mov         eax,dword ptr [ebp+8]
 0053BD9F    cmp         byte ptr [eax-0F],0
>0053BDA3    je          0053BDC0
 0053BDA5    lea         ecx,[ebp-4]
 0053BDA8    mov         eax,dword ptr [ebp+8]
 0053BDAB    movzx       edx,word ptr [eax-0E]
 0053BDAF    mov         eax,dword ptr [ebx]
 0053BDB1    call        004093D8
 0053BDB6    lea         eax,[ebp-4]
 0053BDB9    call        00539138
>0053BDBE    jmp         0053BDD5
 0053BDC0    lea         eax,[ebp-4]
 0053BDC3    mov         edx,dword ptr [ebx]
 0053BDC5    call        @UStrFromPChar
>0053BDCA    jmp         0053BDD5
 0053BDCC    mov         eax,dword ptr [ebp+8]
 0053BDCF    mov         byte ptr [eax-0B],1
>0053BDD3    jmp         0053BE3F
 0053BDD5    mov         eax,dword ptr [ebp+8]
 0053BDD8    movzx       eax,word ptr [eax-0A]
 0053BDDC    mov         edx,dword ptr [ebp+8]
 0053BDDF    sub         eax,dword ptr [edx-18]
 0053BDE2    add         dword ptr [ebx],eax
 0053BDE4    mov         eax,ebx
 0053BDE6    call        0053BA58
 0053BDEB    lea         eax,[ebp-40]
 0053BDEE    push        eax
 0053BDEF    mov         eax,dword ptr [ebp+8]
 0053BDF2    mov         eax,dword ptr [eax-4]
 0053BDF5    mov         dword ptr [ebp-3C],eax
 0053BDF8    mov         byte ptr [ebp-38],11
 0053BDFC    mov         eax,dword ptr [ebp-4]
 0053BDFF    mov         dword ptr [ebp-34],eax
 0053BE02    mov         byte ptr [ebp-30],11
 0053BE06    lea         edx,[ebp-3C]
 0053BE09    mov         ecx,1
 0053BE0E    mov         eax,53BEC4;'%s=%s'
 0053BE13    call        Format
 0053BE18    mov         edx,dword ptr [ebp-40]
 0053BE1B    mov         ecx,esi
 0053BE1D    mov         eax,dword ptr [ebp+8]
 0053BE20    mov         eax,dword ptr [eax-1C]
 0053BE23    mov         eax,dword ptr [eax+10]
 0053BE26    mov         edi,dword ptr [eax]
 0053BE28    call        dword ptr [edi+3C]
 0053BE2B    mov         eax,dword ptr [ebp+8]
 0053BE2E    cmp         byte ptr [eax-0B],0
>0053BE32    jne         0053BE3F
 0053BE34    mov         eax,dword ptr [ebx]
 0053BE36    cmp         eax,dword ptr [ebp-0C]
>0053BE39    jb          0053BD00
 0053BE3F    inc         esi
 0053BE40    mov         eax,dword ptr [ebp+8]
 0053BE43    cmp         byte ptr [eax-0B],0
>0053BE47    jne         0053BE54
 0053BE49    mov         eax,dword ptr [ebx]
 0053BE4B    cmp         eax,dword ptr [ebp-8]
>0053BE4E    jb          0053BBE5
 0053BE54    xor         eax,eax
 0053BE56    pop         edx
 0053BE57    pop         ecx
 0053BE58    pop         ecx
 0053BE59    mov         dword ptr fs:[eax],edx
 0053BE5C    push        53BE86
 0053BE61    lea         eax,[ebp-40]
 0053BE64    call        @UStrClr
 0053BE69    lea         eax,[ebp-2C]
 0053BE6C    mov         edx,4
 0053BE71    call        @UStrArrayClr
 0053BE76    lea         eax,[ebp-4]
 0053BE79    call        @UStrClr
 0053BE7E    ret
>0053BE7F    jmp         @HandleFinally
>0053BE84    jmp         0053BE61
 0053BE86    pop         edi
 0053BE87    pop         esi
 0053BE88    pop         ebx
 0053BE89    mov         esp,ebp
 0053BE8B    pop         ebp
 0053BE8C    ret
end;*}

//0053BED0
{*procedure sub_0053BED0(?:?);
begin
 0053BED0    push        ebp
 0053BED1    mov         ebp,esp
 0053BED3    push        ebx
 0053BED4    mov         eax,dword ptr [ebp+8]
 0053BED7    push        eax
 0053BED8    call        0053BA64
 0053BEDD    pop         ecx
 0053BEDE    mov         eax,dword ptr [ebp+8]
 0053BEE1    mov         eax,dword ptr [eax-4]
 0053BEE4    mov         edx,53BF60;'Translation'
 0053BEE9    call        SameText
 0053BEEE    test        al,al
>0053BEF0    je          0053BF4E
 0053BEF2    mov         eax,dword ptr [ebp+8]
 0053BEF5    movzx       eax,word ptr [eax-0E]
 0053BEF9    shr         eax,2
 0053BEFC    push        eax
 0053BEFD    mov         eax,dword ptr [ebp+8]
 0053BF00    mov         eax,dword ptr [eax-1C]
 0053BF03    add         eax,20
 0053BF06    mov         ecx,1
 0053BF0B    mov         edx,dword ptr ds:[539E3C];:TJclFileVersionInfo.:2
 0053BF11    call        @DynArraySetLength
 0053BF16    add         esp,4
 0053BF19    mov         eax,dword ptr [ebp+8]
 0053BF1C    mov         eax,dword ptr [eax-1C]
 0053BF1F    mov         eax,dword ptr [eax+20]
 0053BF22    call        @DynArrayLength
 0053BF27    dec         eax
 0053BF28    test        eax,eax
>0053BF2A    jl          0053BF4E
 0053BF2C    inc         eax
 0053BF2D    xor         edx,edx
 0053BF2F    mov         ecx,dword ptr [ebp+8]
 0053BF32    mov         ecx,dword ptr [ecx-8]
 0053BF35    mov         ecx,dword ptr [ecx]
 0053BF37    mov         ebx,dword ptr [ebp+8]
 0053BF3A    mov         ebx,dword ptr [ebx-1C]
 0053BF3D    mov         ebx,dword ptr [ebx+20]
 0053BF40    mov         dword ptr [ebx+edx*4],ecx
 0053BF43    mov         ecx,dword ptr [ebp+8]
 0053BF46    add         dword ptr [ecx-8],4
 0053BF4A    inc         edx
 0053BF4B    dec         eax
>0053BF4C    jne         0053BF2F
 0053BF4E    pop         ebx
 0053BF4F    pop         ebp
 0053BF50    ret
end;*}

//0053BF78
procedure sub_0053BF78(?:TJclFileVersionInfo);
begin
{*
 0053BF78    push        ebp
 0053BF79    mov         ebp,esp
 0053BF7B    add         esp,0FFFFFFE4
 0053BF7E    push        ebx
 0053BF7F    xor         edx,edx
 0053BF81    mov         dword ptr [ebp-4],edx
 0053BF84    mov         dword ptr [ebp-1C],eax
 0053BF87    xor         eax,eax
 0053BF89    push        ebp
 0053BF8A    push        53C0CE
 0053BF8F    push        dword ptr fs:[eax]
 0053BF92    mov         dword ptr fs:[eax],esp
 0053BF95    mov         dl,1
 0053BF97    mov         eax,[0043C7BC];TStringList
 0053BF9C    call        TStringList.Create;TStringList.Create
 0053BFA1    mov         edx,dword ptr [ebp-1C]
 0053BFA4    mov         dword ptr [edx+10],eax;TJclFileVersionInfo.FItemList:TStringList
 0053BFA7    mov         dl,1
 0053BFA9    mov         eax,[0043C7BC];TStringList
 0053BFAE    call        TStringList.Create;TStringList.Create
 0053BFB3    mov         edx,dword ptr [ebp-1C]
 0053BFB6    mov         dword ptr [edx+14],eax;TJclFileVersionInfo.FItems:TStringList
 0053BFB9    mov         eax,dword ptr [ebp-1C]
 0053BFBC    mov         eax,dword ptr [eax+4];TJclFileVersionInfo.FBuffer:AnsiString
 0053BFBF    mov         dword ptr [ebp-8],eax
 0053BFC2    mov         eax,dword ptr [ebp-8]
 0053BFC5    add         eax,4
 0053BFC8    movzx       eax,word ptr [eax]
 0053BFCB    sub         ax,2
 0053BFCF    setb        al
 0053BFD2    mov         byte ptr [ebp-0F],al
 0053BFD5    mov         byte ptr [ebp-0B],1
 0053BFD9    push        ebp
 0053BFDA    call        0053BA64
 0053BFDF    pop         ecx
 0053BFE0    movzx       ebx,word ptr [ebp-0A]
 0053BFE4    add         ebx,dword ptr [ebp-8]
 0053BFE7    sub         ebx,dword ptr [ebp-18]
 0053BFEA    mov         edx,53C0E8;'VS_VERSION_INFO'
 0053BFEF    mov         eax,dword ptr [ebp-4]
 0053BFF2    call        SameText
 0053BFF7    test        al,al
>0053BFF9    je          0053C09B
 0053BFFF    movzx       eax,word ptr [ebp-0E]
 0053C003    cmp         eax,34
>0053C006    jne         0053C09B
 0053C00C    mov         edx,dword ptr [ebp-1C]
 0053C00F    mov         eax,dword ptr [ebp-8]
 0053C012    mov         dword ptr [edx+8],eax;TJclFileVersionInfo.FFixedInfo:PVSFixedFileInfo
 0053C015    cmp         dword ptr [eax],0FEEF04BD
 0053C01B    setne       byte ptr [ebp-0B]
 0053C01F    movzx       eax,word ptr [ebp-0E]
 0053C023    add         dword ptr [ebp-8],eax
 0053C026    lea         eax,[ebp-8]
 0053C029    call        0053BA58
>0053C02E    jmp         0053C080
 0053C030    push        ebp
 0053C031    call        0053BA64
 0053C036    pop         ecx
 0053C037    movzx       eax,word ptr [ebp-0E]
 0053C03B    add         dword ptr [ebp-8],eax
 0053C03E    movzx       eax,word ptr [ebp-18]
 0053C042    add         ax,word ptr [ebp-0E]
 0053C046    sub         word ptr [ebp-0A],ax
 0053C04A    mov         edx,53C114;'StringFileInfo'
 0053C04F    mov         eax,dword ptr [ebp-4]
 0053C052    call        SameText
 0053C057    test        al,al
>0053C059    je          0053C068
 0053C05B    push        ebp
 0053C05C    movzx       eax,word ptr [ebp-0A]
 0053C060    call        0053BBA8
 0053C065    pop         ecx
>0053C066    jmp         0053C080
 0053C068    mov         edx,53C140;'VarFileInfo'
 0053C06D    mov         eax,dword ptr [ebp-4]
 0053C070    call        SameText
 0053C075    test        al,al
>0053C077    je          0053C08B
 0053C079    push        ebp
 0053C07A    call        0053BED0
 0053C07F    pop         ecx
 0053C080    cmp         byte ptr [ebp-0B],0
>0053C084    jne         0053C08B
 0053C086    cmp         ebx,dword ptr [ebp-8]
>0053C089    ja          0053C030
 0053C08B    mov         eax,dword ptr [ebp-1C]
 0053C08E    call        0053C158
 0053C093    mov         eax,dword ptr [ebp-1C]
 0053C096    call        0053B9B8
 0053C09B    cmp         byte ptr [ebp-0B],0
>0053C09F    je          0053C0B8
 0053C0A1    mov         ecx,dword ptr ds:[78D228];^SResString417:TResStringRec
 0053C0A7    mov         dl,1
 0053C0A9    mov         eax,[00539D44];EJclFileVersionInfoError
 0053C0AE    call        Exception.CreateRes;EJclFileVersionInfoError.Create
 0053C0B3    call        @RaiseExcept
 0053C0B8    xor         eax,eax
 0053C0BA    pop         edx
 0053C0BB    pop         ecx
 0053C0BC    pop         ecx
 0053C0BD    mov         dword ptr fs:[eax],edx
 0053C0C0    push        53C0D5
 0053C0C5    lea         eax,[ebp-4]
 0053C0C8    call        @UStrClr
 0053C0CD    ret
>0053C0CE    jmp         @HandleFinally
>0053C0D3    jmp         0053C0C5
 0053C0D5    pop         ebx
 0053C0D6    mov         esp,ebp
 0053C0D8    pop         ebp
 0053C0D9    ret
*}
end;

//0053C158
procedure sub_0053C158(?:TJclFileVersionInfo);
begin
{*
 0053C158    push        ebx
 0053C159    push        esi
 0053C15A    mov         ebx,eax
 0053C15C    movzx       eax,byte ptr ds:[53C1BC];0x0 gvar_0053C1BC
 0053C163    mov         byte ptr [ebx+0C],al;TJclFileVersionInfo.FFileFlags:TFileFlags
 0053C166    mov         eax,dword ptr [ebx+8];TJclFileVersionInfo.FFixedInfo:PVSFixedFileInfo
 0053C169    mov         esi,dword ptr [eax+1C]
 0053C16C    and         esi,dword ptr [eax+18]
 0053C16F    test        esi,1
>0053C175    je          0053C17B
 0053C177    or          byte ptr [ebx+0C],1;TJclFileVersionInfo.FFileFlags:TFileFlags
 0053C17B    test        esi,10
>0053C181    je          0053C187
 0053C183    or          byte ptr [ebx+0C],2;TJclFileVersionInfo.FFileFlags:TFileFlags
 0053C187    test        esi,4
>0053C18D    je          0053C193
 0053C18F    or          byte ptr [ebx+0C],4;TJclFileVersionInfo.FFileFlags:TFileFlags
 0053C193    test        esi,2
>0053C199    je          0053C19F
 0053C19B    or          byte ptr [ebx+0C],8;TJclFileVersionInfo.FFileFlags:TFileFlags
 0053C19F    test        esi,8
>0053C1A5    je          0053C1AB
 0053C1A7    or          byte ptr [ebx+0C],10;TJclFileVersionInfo.FFileFlags:TFileFlags
 0053C1AB    test        esi,20
>0053C1B1    je          0053C1B7
 0053C1B3    or          byte ptr [ebx+0C],20;TJclFileVersionInfo.FFileFlags:TFileFlags
 0053C1B7    pop         esi
 0053C1B8    pop         ebx
 0053C1B9    ret
*}
end;

//0053C2D8
{*procedure TJclFileVersionInfo.GetCustomFieldValue(FieldName:string; ?:?);
begin
 0053C2D8    push        ebx
 0053C2D9    push        esi
 0053C2DA    push        edi
 0053C2DB    add         esp,0FFFFFFF8
 0053C2DE    mov         edi,ecx
 0053C2E0    mov         ebx,edx
 0053C2E2    mov         esi,eax
 0053C2E4    test        ebx,ebx
>0053C2E6    je          0053C327
 0053C2E8    mov         edx,ebx
 0053C2EA    mov         eax,dword ptr [esi+14];TJclFileVersionInfo.FItems:TStringList
 0053C2ED    mov         ecx,dword ptr [eax]
 0053C2EF    call        dword ptr [ecx+58];TStrings.IndexOfName
 0053C2F2    inc         eax
>0053C2F3    je          0053C303
 0053C2F5    mov         ecx,edi
 0053C2F7    mov         edx,ebx
 0053C2F9    mov         eax,dword ptr [esi+14];TJclFileVersionInfo.FItems:TStringList
 0053C2FC    call        TStrings.GetValue
>0053C301    jmp         0053C33E
 0053C303    mov         dword ptr [esp],ebx
 0053C306    mov         byte ptr [esp+4],11
 0053C30B    push        esp
 0053C30C    push        0
 0053C30E    mov         ecx,dword ptr ds:[78DA98];^SResString421:TResStringRec
 0053C314    mov         dl,1
 0053C316    mov         eax,[00539D44];EJclFileVersionInfoError
 0053C31B    call        Exception.CreateResFmt;EJclFileVersionInfoError.Create
 0053C320    call        @RaiseExcept
>0053C325    jmp         0053C33E
 0053C327    mov         ecx,dword ptr ds:[78D3E0];^SResString420:TResStringRec
 0053C32D    mov         dl,1
 0053C32F    mov         eax,[00539D44];EJclFileVersionInfoError
 0053C334    call        Exception.CreateRes;EJclFileVersionInfoError.Create
 0053C339    call        @RaiseExcept
 0053C33E    pop         ecx
 0053C33F    pop         edx
 0053C340    pop         edi
 0053C341    pop         esi
 0053C342    pop         ebx
 0053C343    ret
end;*}

//0053C660
{*function sub_0053C660(?:?):?;
begin
 0053C660    mov         eax,dword ptr [eax+14]
 0053C663    ret
end;*}

//0053C664
{*function sub_0053C664(?:TJclFileVersionInfo):?;
begin
 0053C664    mov         eax,dword ptr [eax+18]
 0053C667    call        @DynArrayLength
 0053C66C    ret
end;*}

//0053C670
{*function sub_0053C670(?:TJclFileVersionInfo):?;
begin
 0053C670    mov         eax,dword ptr [eax+20]
 0053C673    call        @DynArrayLength
 0053C678    ret
end;*}

//0053C96C
{*procedure sub_0053C96C(?:TJclFileVersionInfo; ?:?; ?:?);
begin
 0053C96C    push        ebx
 0053C96D    push        esi
 0053C96E    push        edi
 0053C96F    mov         edi,ecx
 0053C971    mov         esi,edx
 0053C973    mov         ebx,eax
 0053C975    mov         eax,ebx
 0053C977    call        0053C660
 0053C97C    mov         ecx,edi
 0053C97E    mov         edx,dword ptr [esi*4+788C48]
 0053C985    call        TStrings.GetValue
 0053C98A    pop         edi
 0053C98B    pop         esi
 0053C98C    pop         ebx
 0053C98D    ret
end;*}

//0053C9B4
function TJclFileVersionInfo.TranslationMatchesLanguages(Exact:Boolean):Boolean;
begin
{*
 0053C9B4    push        ebx
 0053C9B5    push        esi
 0053C9B6    push        edi
 0053C9B7    push        ebp
 0053C9B8    push        ecx
 0053C9B9    mov         byte ptr [esp],dl
 0053C9BC    mov         ebx,eax
 0053C9BE    mov         eax,ebx
 0053C9C0    call        0053C664
 0053C9C5    mov         esi,eax
 0053C9C7    mov         eax,ebx
 0053C9C9    call        0053C670
 0053C9CE    cmp         esi,eax
>0053C9D0    je          0053C9E7
 0053C9D2    cmp         byte ptr [esp],0
>0053C9D6    jne         0053C9E3
 0053C9D8    mov         eax,ebx
 0053C9DA    call        0053C670
 0053C9DF    test        eax,eax
>0053C9E1    jg          0053C9E7
 0053C9E3    xor         eax,eax
>0053C9E5    jmp         0053C9E9
 0053C9E7    mov         al,1
 0053C9E9    mov         byte ptr [esp+1],al
 0053C9ED    cmp         byte ptr [esp+1],0
>0053C9F2    je          0053CA31
 0053C9F4    mov         eax,ebx
 0053C9F6    call        0053C670
 0053C9FB    mov         edi,eax
 0053C9FD    dec         edi
 0053C9FE    test        edi,edi
>0053CA00    jl          0053CA31
 0053CA02    inc         edi
 0053CA03    xor         ebp,ebp
 0053CA05    mov         eax,dword ptr [ebx+20];TJclFileVersionInfo.FTranslations::2
 0053CA08    mov         esi,dword ptr [eax+ebp*4]
 0053CA0B    mov         eax,ebx
 0053CA0D    call        0053C664
 0053CA12    dec         eax
>0053CA13    jmp         0053CA16
 0053CA15    dec         eax
 0053CA16    test        eax,eax
>0053CA18    jl          0053CA22
 0053CA1A    mov         edx,dword ptr [ebx+18];TJclFileVersionInfo.FLanguages::1
 0053CA1D    cmp         esi,dword ptr [edx+eax*4]
>0053CA20    jne         0053CA15
 0053CA22    test        eax,eax
>0053CA24    jge         0053CA2D
 0053CA26    mov         byte ptr [esp+1],0
>0053CA2B    jmp         0053CA31
 0053CA2D    inc         ebp
 0053CA2E    dec         edi
>0053CA2F    jne         0053CA05
 0053CA31    movzx       eax,byte ptr [esp+1]
 0053CA36    pop         edx
 0053CA37    pop         ebp
 0053CA38    pop         edi
 0053CA39    pop         esi
 0053CA3A    pop         ebx
 0053CA3B    ret
*}
end;

//0053CA3C
{*procedure TJclFileVersionInfo.VersionLanguageId(LangIdRec:TLangIdRec; ?:?);
begin
 0053CA3C    push        ebx
 0053CA3D    add         esp,0FFFFFFEC
 0053CA40    mov         ebx,ecx
 0053CA42    mov         dword ptr [esp],edx
 0053CA45    push        ebx
 0053CA46    movzx       eax,word ptr [esp+4]
 0053CA4B    mov         dword ptr [esp+8],eax
 0053CA4F    mov         byte ptr [esp+0C],0
 0053CA54    movzx       eax,word ptr [esp+6]
 0053CA59    mov         dword ptr [esp+10],eax
 0053CA5D    mov         byte ptr [esp+14],0
 0053CA62    lea         edx,[esp+8]
 0053CA66    mov         ecx,1
 0053CA6B    mov         eax,53CA88;'%.4x%.4x'
 0053CA70    call        Format
 0053CA75    add         esp,14
 0053CA78    pop         ebx
 0053CA79    ret
end;*}

//0053CA9C
{*procedure TJclFileVersionInfo.VersionLanguageName(LangId:Word; ?:?);
begin
 0053CA9C    push        ebx
 0053CA9D    push        esi
 0053CA9E    mov         ebx,ecx
 0053CAA0    mov         esi,edx
 0053CAA2    mov         eax,ebx
 0053CAA4    mov         edx,104
 0053CAA9    call        @UStrSetLength
 0053CAAE    push        104
 0053CAB3    mov         eax,dword ptr [ebx]
 0053CAB5    call        @UStrToPWChar
 0053CABA    push        eax
 0053CABB    movzx       eax,si
 0053CABE    push        eax
 0053CABF    call        kernel32.VerLanguageNameW
 0053CAC4    mov         edx,ebx
 0053CAC6    xchg        eax,edx
 0053CAC7    call        @UStrSetLength
 0053CACC    pop         esi
 0053CACD    pop         ebx
 0053CACE    ret
end;*}

Initialization
//0078111C
{*
 0078111C    sub         dword ptr ds:[8154B8],1
>00781123    jae         00781134
 00781125    mov         edx,788C2C;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 0078112A    mov         eax,[00790C38];gvar_00790C38
 0078112F    call        0053F424
 00781134    ret
*}
Finalization
//0053CAD0
{*
 0053CAD0    push        ebp
 0053CAD1    mov         ebp,esp
 0053CAD3    xor         eax,eax
 0053CAD5    push        ebp
 0053CAD6    push        53CB26
 0053CADB    push        dword ptr fs:[eax]
 0053CADE    mov         dword ptr fs:[eax],esp
 0053CAE1    inc         dword ptr ds:[8154B8]
>0053CAE7    jne         0053CB18
 0053CAE9    mov         eax,[00790C38];gvar_00790C38
 0053CAEE    call        0053F440
 0053CAF3    mov         eax,788C2C;^'$URL: https://jcl.svn.sourceforge.net:443/svnroot/jcl/tags/JCL-2.2-Build384...
 0053CAF8    mov         edx,dword ptr ds:[53D8C0];TUnitVersionInfo
 0053CAFE    call        @FinalizeRecord
 0053CB03    mov         eax,788C4C;^'Comments'
 0053CB08    mov         ecx,0C
 0053CB0D    mov         edx,dword ptr ds:[40128C];string
 0053CB13    call        @FinalizeArray
 0053CB18    xor         eax,eax
 0053CB1A    pop         edx
 0053CB1B    pop         ecx
 0053CB1C    pop         ecx
 0053CB1D    mov         dword ptr fs:[eax],edx
 0053CB20    push        53CB2D
 0053CB25    ret
>0053CB26    jmp         @HandleFinally
>0053CB2B    jmp         0053CB25
 0053CB2D    pop         ebp
 0053CB2E    ret
*}
end.