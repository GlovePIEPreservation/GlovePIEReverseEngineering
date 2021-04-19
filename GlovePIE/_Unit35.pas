//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit35;

interface

uses
  SysUtils, Classes, TntStdCtrls, DebugWinUnit, PieBase;

type
  TTntMemo = class(TMemo)
  end;
  TTntLabel = class(TLabel)
  end;
  TTntListBox = class(TListBox)
  end;
  TTntComboBox = class(TComboBox)
  end;
  TTntButton = class(TButton)
  end;
  TTntEdit = class(TEdit)
  end;
  TTntGroupBox = class(TGroupBox)
  end;
  TTntCheckBox = class(TCheckBox)
  end;
  TTntBitBtn = class(TBitBtn)
  end;
  TDebugWindow = class(TTntForm)
  published
    Memo1:TTntMemo;//f388
  end;
  TBaseClass = class(TPersistent)
  published
    procedure SanityCheck;//004F96A0
    procedure Sanity(ObjectType:TClass);//004F9E58
    function CopyConstructor:TBaseClass;//004FA050
    //procedure ToString(?:?);//004F95D4
    function Equals(RHS:TObject):Boolean;//004F95BC
  public
    function Equals(RHS:TObject):Boolean; virtual;//004F95BC
    //procedure ToString(?:?); virtual;//004F95D4
    function CopyConstructor:TBaseClass; virtual;//vC//004FA050
  end;
    //function sub_004F8708(?:?):?;//004F8708
    //function sub_004F8D08(?:?):?;//004F8D08
    //function sub_004F8D38(?:string):?;//004F8D38
    //function sub_004F8DB8(?:string; ?:?; ?:?; ?:?):?;//004F8DB8
    //function sub_004F8E28(?:?):Boolean;//004F8E28
    //function sub_004F8E44(?:?):Boolean;//004F8E44
    //procedure sub_004F8E84(?:UnicodeString; ?:?);//004F8E84
    //procedure sub_004F90D8(?:Byte; ?:?; ?:?);//004F90D8
    procedure sub_004F9160(?:UString);//004F9160
    //function sub_004F91C4(?:?; ?:?; ?:Integer):?;//004F91C4
    //function sub_004F9230(?:UString; ?:?):?;//004F9230
    //function sub_004F9254(?:UnicodeString):?;//004F9254
    //function sub_004F936C(?:UnicodeString):?;//004F936C
    //procedure sub_004F96E8(?:TObject; ?:?);//004F96E8
    //function sub_004F99B0(?:Pointer):?;//004F99B0
    procedure sub_004F9A38(?:TObject);//004F9A38
    //function sub_004F9A58(?:UnicodeString; ?:UString):?;//004F9A58
    //function sub_004F9B00(?:?; ?:UString):?;//004F9B00
    //function sub_004F9BD0(?:UnicodeString; ?:UString):?;//004F9BD0
    //function sub_004F9C5C(?:WideString; ?:?):?;//004F9C5C
    //function sub_004F9D00(?:UnicodeString):?;//004F9D00
    //function sub_004F9D9C(?:UnicodeString; ?:UString):?;//004F9D9C
    //procedure sub_004F9E44(?:TStatement; ?:?);//004F9E44
    procedure sub_004F9EA0(?:UnicodeString);//004F9EA0
    procedure sub_004FA044;//004FA044
    procedure sub_004FA048;//004FA048
    //procedure sub_004FA0A0(?:Integer; ?:?; ?:?);//004FA0A0
    //function sub_004FA14C:?;//004FA14C
    procedure sub_004FA220(?:UnicodeString);//004FA220
    //procedure sub_004FA398(?:?; ?:UnicodeString);//004FA398
    procedure sub_004FA5FC(?:UnicodeString);//004FA5FC
    procedure sub_004FA644(?:Exception);//004FA644
    procedure sub_004FA6EC(?:Exception; ?:UnicodeString);//004FA6EC
    procedure sub_004FA7C0;//004FA7C0

implementation

{$R *.DFM}

//004F8708
{*function sub_004F8708(?:?):?;
begin
 004F8708    add         esp,0FFFFFFF4
 004F870B    movzx       eax,ax
 004F870E    cmp         eax,56DB
>004F8713    jg          004F884B
>004F8719    je          004F89E5
 004F871F    cmp         eax,4F0D
>004F8724    jg          004F87BD
>004F872A    je          004F8BA7
 004F8730    cmp         eax,4E5D
>004F8735    jg          004F877E
>004F8737    je          004F8A62
 004F873D    cmp         eax,4E03
>004F8742    jg          004F8765
>004F8744    je          004F8A30
 004F874A    sub         eax,3007
>004F874F    je          004F8974
 004F8755    sub         eax,1DF9
>004F875A    je          004F899A
>004F8760    jmp         004F8CF3
 004F8765    sub         eax,4E07
>004F876A    je          004F8AC6
 004F8770    sub         eax,2
>004F8773    je          004F89CC
>004F8779    jmp         004F8CF3
 004F877E    cmp         eax,4EBF
>004F8783    jg          004F87A4
>004F8785    je          004F8AF8
 004F878B    sub         eax,4E8C
>004F8790    je          004F89B3
 004F8796    sub         eax,8
>004F8799    je          004F89FE
>004F879F    jmp         004F8CF3
 004F87A4    sub         eax,4EC0
>004F87A9    je          004F8C24
 004F87AF    sub         eax,1F
>004F87B2    je          004F8C56
>004F87B8    jmp         004F8CF3
 004F87BD    cmp         eax,5341
>004F87C2    jg          004F880B
>004F87C4    je          004F8A7B
 004F87CA    cmp         eax,5146
>004F87CF    jg          004F87F2
>004F87D1    je          004F8B2A
 004F87D7    sub         eax,4F70
>004F87DC    je          004F8C3D
 004F87E2    sub         eax,194
>004F87E7    je          004F8B11
>004F87ED    jmp         004F8CF3
 004F87F2    sub         eax,516B
>004F87F7    je          004F8A49
 004F87FD    sub         eax,2
>004F8800    je          004F8A17
>004F8806    jmp         004F8CF3
 004F880B    cmp         eax,5345
>004F8810    jg          004F882F
>004F8812    je          004F8C9B
 004F8818    sub         eax,5343
>004F881D    je          004F8AAD
 004F8823    dec         eax
>004F8824    je          004F8C85
>004F882A    jmp         004F8CF3
 004F882F    sub         eax,534C
>004F8834    je          004F8CB1
 004F883A    add         eax,0FFFFFF8B
 004F883D    sub         eax,4
>004F8840    jb          004F8B75
>004F8846    jmp         004F8CF3
 004F884B    cmp         eax,7396
>004F8850    jg          004F88E9
>004F8856    je          004F8C0B
 004F885C    cmp         eax,5F0E
>004F8861    jg          004F88A6
>004F8863    je          004F8B75
 004F8869    cmp         eax,5EFF
>004F886E    jg          004F888F
>004F8870    je          004F8C6F
 004F8876    sub         eax,58F1
>004F887B    je          004F8B43
 004F8881    sub         eax,8
>004F8884    je          004F8B43
>004F888A    jmp         004F8CF3
 004F888F    sub         eax,5F0C
>004F8894    je          004F8B43
 004F889A    dec         eax
>004F889B    je          004F8B5C
>004F88A1    jmp         004F8CF3
 004F88A6    cmp         eax,62FE
>004F88AB    jg          004F88CE
>004F88AD    je          004F8C24
 004F88B3    sub         eax,5F10
>004F88B8    je          004F8B5C
 004F88BE    sub         eax,0E5
>004F88C3    je          004F8CDD
>004F88C9    jmp         004F8CF3
 004F88CE    sub         eax,634C
>004F88D3    je          004F8BF2
 004F88D9    sub         eax,486
>004F88DE    je          004F8BD9
>004F88E4    jmp         004F8CF3
 004F88E9    cmp         eax,8CB3
>004F88EE    jg          004F8937
>004F88F0    je          004F8B5C
 004F88F6    cmp         eax,8086
>004F88FB    jg          004F891C
>004F88FD    je          004F8B8E
 004F8903    sub         eax,767E
>004F8908    je          004F8A94
 004F890E    sub         eax,17
>004F8911    je          004F8CC7
>004F8917    jmp         004F8CF3
 004F891C    sub         eax,842C
>004F8921    je          004F8ADF
 004F8927    sub         eax,882
>004F892C    je          004F8B5C
>004F8932    jmp         004F8CF3
 004F8937    cmp         eax,964C
>004F893C    jg          004F895F
>004F893E    je          004F8C3D
 004F8944    sub         eax,8D30
>004F8949    je          004F8B5C
 004F894F    sub         eax,916
>004F8954    je          004F8BC0
>004F895A    jmp         004F8CF3
 004F895F    sub         eax,9678
>004F8964    je          004F8BC0
 004F896A    sub         eax,7E
>004F896D    je          004F8987
>004F896F    jmp         004F8CF3
 004F8974    xor         eax,eax
 004F8976    mov         dword ptr [esp],eax
 004F8979    mov         dword ptr [esp+4],eax
 004F897D    mov         word ptr [esp+8],ax
>004F8982    jmp         004F8D01
 004F8987    xor         eax,eax
 004F8989    mov         dword ptr [esp],eax
 004F898C    mov         dword ptr [esp+4],eax
 004F8990    mov         word ptr [esp+8],ax
>004F8995    jmp         004F8D01
 004F899A    xor         eax,eax
 004F899C    mov         dword ptr [esp],eax
 004F899F    mov         dword ptr [esp+4],80000000
 004F89A7    mov         word ptr [esp+8],3FFF
>004F89AE    jmp         004F8D01
 004F89B3    xor         eax,eax
 004F89B5    mov         dword ptr [esp],eax
 004F89B8    mov         dword ptr [esp+4],80000000
 004F89C0    mov         word ptr [esp+8],4000
>004F89C7    jmp         004F8D01
 004F89CC    xor         eax,eax
 004F89CE    mov         dword ptr [esp],eax
 004F89D1    mov         dword ptr [esp+4],0C0000000
 004F89D9    mov         word ptr [esp+8],4000
>004F89E0    jmp         004F8D01
 004F89E5    xor         eax,eax
 004F89E7    mov         dword ptr [esp],eax
 004F89EA    mov         dword ptr [esp+4],80000000
 004F89F2    mov         word ptr [esp+8],4001
>004F89F9    jmp         004F8D01
 004F89FE    xor         eax,eax
 004F8A00    mov         dword ptr [esp],eax
 004F8A03    mov         dword ptr [esp+4],0A0000000
 004F8A0B    mov         word ptr [esp+8],4001
>004F8A12    jmp         004F8D01
 004F8A17    xor         eax,eax
 004F8A19    mov         dword ptr [esp],eax
 004F8A1C    mov         dword ptr [esp+4],0C0000000
 004F8A24    mov         word ptr [esp+8],4001
>004F8A2B    jmp         004F8D01
 004F8A30    xor         eax,eax
 004F8A32    mov         dword ptr [esp],eax
 004F8A35    mov         dword ptr [esp+4],0E0000000
 004F8A3D    mov         word ptr [esp+8],4001
>004F8A44    jmp         004F8D01
 004F8A49    xor         eax,eax
 004F8A4B    mov         dword ptr [esp],eax
 004F8A4E    mov         dword ptr [esp+4],80000000
 004F8A56    mov         word ptr [esp+8],4002
>004F8A5D    jmp         004F8D01
 004F8A62    xor         eax,eax
 004F8A64    mov         dword ptr [esp],eax
 004F8A67    mov         dword ptr [esp+4],90000000
 004F8A6F    mov         word ptr [esp+8],4002
>004F8A76    jmp         004F8D01
 004F8A7B    xor         eax,eax
 004F8A7D    mov         dword ptr [esp],eax
 004F8A80    mov         dword ptr [esp+4],0A0000000
 004F8A88    mov         word ptr [esp+8],4002
>004F8A8F    jmp         004F8D01
 004F8A94    xor         eax,eax
 004F8A96    mov         dword ptr [esp],eax
 004F8A99    mov         dword ptr [esp+4],0C8000000
 004F8AA1    mov         word ptr [esp+8],4005
>004F8AA8    jmp         004F8D01
 004F8AAD    xor         eax,eax
 004F8AAF    mov         dword ptr [esp],eax
 004F8AB2    mov         dword ptr [esp+4],0FA000000
 004F8ABA    mov         word ptr [esp+8],4008
>004F8AC1    jmp         004F8D01
 004F8AC6    xor         eax,eax
 004F8AC8    mov         dword ptr [esp],eax
 004F8ACB    mov         dword ptr [esp+4],9C400000
 004F8AD3    mov         word ptr [esp+8],400C
>004F8ADA    jmp         004F8D01
 004F8ADF    xor         eax,eax
 004F8AE1    mov         dword ptr [esp],eax
 004F8AE4    mov         dword ptr [esp+4],9C400000
 004F8AEC    mov         word ptr [esp+8],400C
>004F8AF3    jmp         004F8D01
 004F8AF8    xor         eax,eax
 004F8AFA    mov         dword ptr [esp],eax
 004F8AFD    mov         dword ptr [esp+4],0BEBC2000
 004F8B05    mov         word ptr [esp+8],4019
>004F8B0C    jmp         004F8D01
 004F8B11    xor         eax,eax
 004F8B13    mov         dword ptr [esp],eax
 004F8B16    mov         dword ptr [esp+4],0BEBC2000
 004F8B1E    mov         word ptr [esp+8],4019
>004F8B25    jmp         004F8D01
 004F8B2A    xor         eax,eax
 004F8B2C    mov         dword ptr [esp],eax
 004F8B2F    mov         dword ptr [esp+4],0E8D4A510
 004F8B37    mov         word ptr [esp+8],4026
>004F8B3E    jmp         004F8D01
 004F8B43    xor         eax,eax
 004F8B45    mov         dword ptr [esp],eax
 004F8B48    mov         dword ptr [esp+4],80000000
 004F8B50    mov         word ptr [esp+8],3FFF
>004F8B57    jmp         004F8D01
 004F8B5C    xor         eax,eax
 004F8B5E    mov         dword ptr [esp],eax
 004F8B61    mov         dword ptr [esp+4],80000000
 004F8B69    mov         word ptr [esp+8],4000
>004F8B70    jmp         004F8D01
 004F8B75    xor         eax,eax
 004F8B77    mov         dword ptr [esp],eax
 004F8B7A    mov         dword ptr [esp+4],0C0000000
 004F8B82    mov         word ptr [esp+8],4000
>004F8B89    jmp         004F8D01
 004F8B8E    xor         eax,eax
 004F8B90    mov         dword ptr [esp],eax
 004F8B93    mov         dword ptr [esp+4],80000000
 004F8B9B    mov         word ptr [esp+8],4001
>004F8BA2    jmp         004F8D01
 004F8BA7    xor         eax,eax
 004F8BA9    mov         dword ptr [esp],eax
 004F8BAC    mov         dword ptr [esp+4],0A0000000
 004F8BB4    mov         word ptr [esp+8],4001
>004F8BBB    jmp         004F8D01
 004F8BC0    xor         eax,eax
 004F8BC2    mov         dword ptr [esp],eax
 004F8BC5    mov         dword ptr [esp+4],0C0000000
 004F8BCD    mov         word ptr [esp+8],4001
>004F8BD4    jmp         004F8D01
 004F8BD9    xor         eax,eax
 004F8BDB    mov         dword ptr [esp],eax
 004F8BDE    mov         dword ptr [esp+4],0E0000000
 004F8BE6    mov         word ptr [esp+8],4001
>004F8BED    jmp         004F8D01
 004F8BF2    xor         eax,eax
 004F8BF4    mov         dword ptr [esp],eax
 004F8BF7    mov         dword ptr [esp+4],80000000
 004F8BFF    mov         word ptr [esp+8],4002
>004F8C06    jmp         004F8D01
 004F8C0B    xor         eax,eax
 004F8C0D    mov         dword ptr [esp],eax
 004F8C10    mov         dword ptr [esp+4],90000000
 004F8C18    mov         word ptr [esp+8],4002
>004F8C1F    jmp         004F8D01
 004F8C24    xor         eax,eax
 004F8C26    mov         dword ptr [esp],eax
 004F8C29    mov         dword ptr [esp+4],0A0000000
 004F8C31    mov         word ptr [esp+8],4002
>004F8C38    jmp         004F8D01
 004F8C3D    xor         eax,eax
 004F8C3F    mov         dword ptr [esp],eax
 004F8C42    mov         dword ptr [esp+4],0C8000000
 004F8C4A    mov         word ptr [esp+8],4005
>004F8C51    jmp         004F8D01
 004F8C56    xor         eax,eax
 004F8C58    mov         dword ptr [esp],eax
 004F8C5B    mov         dword ptr [esp+4],0FA000000
 004F8C63    mov         word ptr [esp+8],4008
>004F8C6A    jmp         004F8D01
 004F8C6F    xor         eax,eax
 004F8C71    mov         dword ptr [esp],eax
 004F8C74    mov         dword ptr [esp+4],0A0000000
 004F8C7C    mov         word ptr [esp+8],4003
>004F8C83    jmp         004F8D01
 004F8C85    xor         eax,eax
 004F8C87    mov         dword ptr [esp],eax
 004F8C8A    mov         dword ptr [esp+4],0A0000000
 004F8C92    mov         word ptr [esp+8],4003
>004F8C99    jmp         004F8D01
 004F8C9B    xor         eax,eax
 004F8C9D    mov         dword ptr [esp],eax
 004F8CA0    mov         dword ptr [esp+4],0F0000000
 004F8CA8    mov         word ptr [esp+8],4003
>004F8CAF    jmp         004F8D01
 004F8CB1    xor         eax,eax
 004F8CB3    mov         dword ptr [esp],eax
 004F8CB6    mov         dword ptr [esp+4],0A0000000
 004F8CBE    mov         word ptr [esp+8],4004
>004F8CC5    jmp         004F8D01
 004F8CC7    xor         eax,eax
 004F8CC9    mov         dword ptr [esp],eax
 004F8CCC    mov         dword ptr [esp+4],0C8000000
 004F8CD4    mov         word ptr [esp+8],4006
>004F8CDB    jmp         004F8D01
 004F8CDD    xor         eax,eax
 004F8CDF    mov         dword ptr [esp],eax
 004F8CE2    mov         dword ptr [esp+4],0A0000000
 004F8CEA    mov         word ptr [esp+8],4003
>004F8CF1    jmp         004F8D01
 004F8CF3    xor         eax,eax
 004F8CF5    mov         dword ptr [esp],eax
 004F8CF8    mov         dword ptr [esp+4],eax
 004F8CFC    mov         word ptr [esp+8],ax
 004F8D01    fld         tbyte ptr [esp]
 004F8D04    add         esp,0C
 004F8D07    ret
end;*}

//004F8D08
{*function sub_004F8D08(?:?):?;
begin
 004F8D08    push        ebx
 004F8D09    mov         ebx,eax
 004F8D0B    cmp         bx,3007
>004F8D10    je          004F8D30
 004F8D12    cmp         bx,96F6
>004F8D17    je          004F8D30
 004F8D19    mov         eax,ebx
 004F8D1B    call        004F8708
 004F8D20    fcomp       dword ptr ds:[4F8D34];0:Single
 004F8D26    wait
 004F8D27    fnstsw      al
 004F8D29    sahf
>004F8D2A    jne         004F8D30
 004F8D2C    xor         eax,eax
 004F8D2E    pop         ebx
 004F8D2F    ret
 004F8D30    mov         al,1
 004F8D32    pop         ebx
 004F8D33    ret
end;*}

//004F8D38
{*function sub_004F8D38(?:string):?;
begin
 004F8D38    push        ebp
 004F8D39    mov         ebp,esp
 004F8D3B    add         esp,0FFFFFFE4
 004F8D3E    mov         dword ptr [ebp-4],eax
 004F8D41    mov         eax,dword ptr [ebp-4]
 004F8D44    call        @UStrAddRef
 004F8D49    xor         eax,eax
 004F8D4B    push        ebp
 004F8D4C    push        4F8DA9
 004F8D51    push        dword ptr fs:[eax]
 004F8D54    mov         dword ptr fs:[eax],esp
 004F8D57    lea         edx,[ebp-14]
 004F8D5A    mov         eax,dword ptr [ebp-4]
 004F8D5D    call        @ValExt
 004F8D62    fstp        tbyte ptr [ebp-10]
 004F8D65    wait
 004F8D66    cmp         dword ptr [ebp-14],0
>004F8D6A    je          004F8D93
 004F8D6C    mov         eax,dword ptr [ebp-4]
 004F8D6F    mov         dword ptr [ebp-1C],eax
 004F8D72    mov         byte ptr [ebp-18],11
 004F8D76    lea         eax,[ebp-1C]
 004F8D79    push        eax
 004F8D7A    push        0
 004F8D7C    mov         ecx,dword ptr ds:[78CE20];^SResString0:TResStringRec
 004F8D82    mov         dl,1
 004F8D84    mov         eax,[0041A0BC];EConvertError
 004F8D89    call        Exception.CreateResFmt;EConvertError.Create
 004F8D8E    call        @RaiseExcept
 004F8D93    xor         eax,eax
 004F8D95    pop         edx
 004F8D96    pop         ecx
 004F8D97    pop         ecx
 004F8D98    mov         dword ptr fs:[eax],edx
 004F8D9B    push        4F8DB0
 004F8DA0    lea         eax,[ebp-4]
 004F8DA3    call        @UStrClr
 004F8DA8    ret
>004F8DA9    jmp         @HandleFinally
>004F8DAE    jmp         004F8DA0
 004F8DB0    fld         tbyte ptr [ebp-10]
 004F8DB3    mov         esp,ebp
 004F8DB5    pop         ebp
 004F8DB6    ret
end;*}

//004F8DB8
{*function sub_004F8DB8(?:string; ?:?; ?:?; ?:?):?;
begin
 004F8DB8    push        ebp
 004F8DB9    mov         ebp,esp
 004F8DBB    add         esp,0FFFFFFEC
 004F8DBE    mov         dword ptr [ebp-4],eax
 004F8DC1    mov         eax,dword ptr [ebp-4]
 004F8DC4    call        @UStrAddRef
 004F8DC9    xor         eax,eax
 004F8DCB    push        ebp
 004F8DCC    push        4F8E16
 004F8DD1    push        dword ptr fs:[eax]
 004F8DD4    mov         dword ptr fs:[eax],esp
 004F8DD7    lea         edx,[ebp-14]
 004F8DDA    mov         eax,dword ptr [ebp-4]
 004F8DDD    call        @ValExt
 004F8DE2    fstp        tbyte ptr [ebp-10]
 004F8DE5    wait
 004F8DE6    cmp         dword ptr [ebp-14],0
>004F8DEA    je          004F8E00
 004F8DEC    mov         eax,dword ptr [ebp+8]
 004F8DEF    mov         dword ptr [ebp-10],eax
 004F8DF2    mov         eax,dword ptr [ebp+0C]
 004F8DF5    mov         dword ptr [ebp-0C],eax
 004F8DF8    mov         ax,word ptr [ebp+10]
 004F8DFC    mov         word ptr [ebp-8],ax
 004F8E00    xor         eax,eax
 004F8E02    pop         edx
 004F8E03    pop         ecx
 004F8E04    pop         ecx
 004F8E05    mov         dword ptr fs:[eax],edx
 004F8E08    push        4F8E1D
 004F8E0D    lea         eax,[ebp-4]
 004F8E10    call        @UStrClr
 004F8E15    ret
>004F8E16    jmp         @HandleFinally
>004F8E1B    jmp         004F8E0D
 004F8E1D    fld         tbyte ptr [ebp-10]
 004F8E20    mov         esp,ebp
 004F8E22    pop         ebp
 004F8E23    ret         0C
end;*}

//004F8E28
{*function sub_004F8E28(?:?):Boolean;
begin
 004F8E28    push        ebx
 004F8E29    mov         ebx,eax
 004F8E2B    mov         eax,ebx
 004F8E2D    call        TCharacter.IsLetterOrDigit
 004F8E32    test        al,al
>004F8E34    je          004F8E3A
 004F8E36    mov         al,1
 004F8E38    pop         ebx
 004F8E39    ret
 004F8E3A    cmp         bx,5F
 004F8E3E    sete        al
 004F8E41    pop         ebx
 004F8E42    ret
end;*}

//004F8E44
{*function sub_004F8E44(?:?):Boolean;
begin
 004F8E44    push        ebx
 004F8E45    mov         ebx,eax
 004F8E47    mov         eax,ebx
 004F8E49    call        TCharacter.IsLetter
 004F8E4E    test        al,al
>004F8E50    je          004F8E5D
 004F8E52    mov         eax,ebx
 004F8E54    call        TCharacter.IsDigit
 004F8E59    xor         al,1
>004F8E5B    jmp         004F8E5F
 004F8E5D    xor         eax,eax
 004F8E5F    test        al,al
>004F8E61    je          004F8E6E
 004F8E63    mov         eax,ebx
 004F8E65    call        004F8D08
 004F8E6A    xor         al,1
>004F8E6C    jmp         004F8E70
 004F8E6E    xor         eax,eax
 004F8E70    test        al,al
>004F8E72    je          004F8E78
 004F8E74    mov         al,1
 004F8E76    pop         ebx
 004F8E77    ret
 004F8E78    cmp         bx,5F
 004F8E7C    sete        al
 004F8E7F    pop         ebx
 004F8E80    ret
end;*}

//004F8E84
{*procedure sub_004F8E84(?:UnicodeString; ?:?);
begin
 004F8E84    push        ebp
 004F8E85    mov         ebp,esp
 004F8E87    push        ecx
 004F8E88    push        ebx
 004F8E89    push        esi
 004F8E8A    mov         ebx,edx
 004F8E8C    mov         dword ptr [ebp-4],eax
 004F8E8F    mov         eax,dword ptr [ebp-4]
 004F8E92    call        @UStrAddRef
 004F8E97    xor         eax,eax
 004F8E99    push        ebp
 004F8E9A    push        4F8FDB
 004F8E9F    push        dword ptr fs:[eax]
 004F8EA2    mov         dword ptr fs:[eax],esp
 004F8EA5    mov         edx,4F8FF4;'P5Glove'
 004F8EAA    mov         eax,dword ptr [ebp-4]
 004F8EAD    call        004F9A58
 004F8EB2    test        al,al
>004F8EB4    je          004F8EC7
 004F8EB6    mov         eax,ebx
 004F8EB8    mov         edx,4F8FF4;'P5Glove'
 004F8EBD    call        @UStrAsg
>004F8EC2    jmp         004F8FC5
 004F8EC7    mov         edx,4F9010;'P5'
 004F8ECC    mov         eax,dword ptr [ebp-4]
 004F8ECF    call        004F9A58
 004F8ED4    test        al,al
>004F8ED6    je          004F8EE9
 004F8ED8    mov         eax,ebx
 004F8EDA    mov         edx,4F9010;'P5'
 004F8EDF    call        @UStrAsg
>004F8EE4    jmp         004F8FC5
 004F8EE9    mov         edx,4F9024;'Z800'
 004F8EEE    mov         eax,dword ptr [ebp-4]
 004F8EF1    call        004F9A58
 004F8EF6    test        al,al
>004F8EF8    je          004F8F0B
 004F8EFA    mov         eax,ebx
 004F8EFC    mov         edx,4F9024;'Z800'
 004F8F01    call        @UStrAsg
>004F8F06    jmp         004F8FC5
 004F8F0B    mov         edx,4F903C;'VR920'
 004F8F10    mov         eax,dword ptr [ebp-4]
 004F8F13    call        004F9A58
 004F8F18    test        al,al
>004F8F1A    je          004F8F2D
 004F8F1C    mov         eax,ebx
 004F8F1E    mov         edx,4F903C;'VR920'
 004F8F23    call        @UStrAsg
>004F8F28    jmp         004F8FC5
 004F8F2D    mov         edx,4F9054;'DualShock3'
 004F8F32    mov         eax,dword ptr [ebp-4]
 004F8F35    call        004F9A58
 004F8F3A    test        al,al
>004F8F3C    je          004F8F4C
 004F8F3E    mov         eax,ebx
 004F8F40    mov         edx,4F9054;'DualShock3'
 004F8F45    call        @UStrAsg
>004F8F4A    jmp         004F8FC5
 004F8F4C    mov         edx,4F9078;'XBox360Controller'
 004F8F51    mov         eax,dword ptr [ebp-4]
 004F8F54    call        004F9A58
 004F8F59    test        al,al
>004F8F5B    je          004F8F6B
 004F8F5D    mov         eax,ebx
 004F8F5F    mov         edx,4F9078;'XBox360Controller'
 004F8F64    call        @UStrAsg
>004F8F69    jmp         004F8FC5
 004F8F6B    mov         edx,4F90A8;'XBox360'
 004F8F70    mov         eax,dword ptr [ebp-4]
 004F8F73    call        004F9A58
 004F8F78    test        al,al
>004F8F7A    je          004F8F8A
 004F8F7C    mov         eax,ebx
 004F8F7E    mov         edx,4F90A8;'XBox360'
 004F8F83    call        @UStrAsg
>004F8F88    jmp         004F8FC5
 004F8F8A    mov         eax,dword ptr [ebp-4]
 004F8F8D    test        eax,eax
>004F8F8F    je          004F8F96
 004F8F91    sub         eax,4
 004F8F94    mov         eax,dword ptr [eax]
 004F8F96    mov         esi,eax
>004F8F98    jmp         004F8F9B
 004F8F9A    dec         esi
 004F8F9B    test        esi,esi
>004F8F9D    jle         004F8FB5
 004F8F9F    mov         edx,4F90B8
 004F8FA4    mov         eax,dword ptr [ebp-4]
 004F8FA7    movzx       eax,word ptr [eax+esi*2-2]
 004F8FAC    call        CharInSet
 004F8FB1    test        al,al
>004F8FB3    jne         004F8F9A
 004F8FB5    push        ebx
 004F8FB6    mov         ecx,esi
 004F8FB8    mov         edx,1
 004F8FBD    mov         eax,dword ptr [ebp-4]
 004F8FC0    call        @UStrCopy
 004F8FC5    xor         eax,eax
 004F8FC7    pop         edx
 004F8FC8    pop         ecx
 004F8FC9    pop         ecx
 004F8FCA    mov         dword ptr fs:[eax],edx
 004F8FCD    push        4F8FE2
 004F8FD2    lea         eax,[ebp-4]
 004F8FD5    call        @UStrClr
 004F8FDA    ret
>004F8FDB    jmp         @HandleFinally
>004F8FE0    jmp         004F8FD2
 004F8FE2    pop         esi
 004F8FE3    pop         ebx
 004F8FE4    pop         ecx
 004F8FE5    pop         ebp
 004F8FE6    ret
end;*}

//004F90D8
{*procedure sub_004F90D8(?:Byte; ?:?; ?:?);
begin
 004F90D8    push        ebp
 004F90D9    mov         ebp,esp
 004F90DB    push        0
 004F90DD    push        ebx
 004F90DE    push        esi
 004F90DF    push        edi
 004F90E0    mov         esi,ecx
 004F90E2    mov         ebx,edx
 004F90E4    xor         edx,edx
 004F90E6    push        ebp
 004F90E7    push        4F9141
 004F90EC    push        dword ptr fs:[edx]
 004F90EF    mov         dword ptr fs:[edx],esp
 004F90F2    mov         edi,eax
 004F90F4    mov         eax,esi
 004F90F6    call        @UStrClr
 004F90FB    dec         ebx
 004F90FC    test        ebx,ebx
>004F90FE    jl          004F912B
 004F9100    inc         ebx
 004F9101    push        dword ptr [esi]
 004F9103    lea         ecx,[ebp-4]
 004F9106    movzx       eax,byte ptr [edi]
 004F9109    mov         edx,2
 004F910E    call        IntToHex
 004F9113    push        dword ptr [ebp-4]
 004F9116    push        4F915C;' '
 004F911B    mov         eax,esi
 004F911D    mov         edx,3
 004F9122    call        @UStrCatN
 004F9127    inc         edi
 004F9128    dec         ebx
>004F9129    jne         004F9101
 004F912B    xor         eax,eax
 004F912D    pop         edx
 004F912E    pop         ecx
 004F912F    pop         ecx
 004F9130    mov         dword ptr fs:[eax],edx
 004F9133    push        4F9148
 004F9138    lea         eax,[ebp-4]
 004F913B    call        @UStrClr
 004F9140    ret
>004F9141    jmp         @HandleFinally
>004F9146    jmp         004F9138
 004F9148    pop         edi
 004F9149    pop         esi
 004F914A    pop         ebx
 004F914B    pop         ecx
 004F914C    pop         ebp
 004F914D    ret
end;*}

//004F9160
procedure sub_004F9160(?:UString);
begin
{*
 004F9160    push        ebp
 004F9161    mov         ebp,esp
 004F9163    add         esp,0FFFFFFF0
 004F9166    push        ebx
 004F9167    push        esi
 004F9168    push        edi
 004F9169    mov         ebx,eax
 004F916B    mov         dword ptr [ebp-10],1000
 004F9172    mov         eax,ebx
 004F9174    call        @LStrToPChar
 004F9179    mov         dword ptr [ebp-0C],eax
 004F917C    mov         dword ptr [ebp-8],0FFFFFFFF
 004F9183    xor         eax,eax
 004F9185    mov         dword ptr [ebp-4],eax
 004F9188    xor         eax,eax
 004F918A    push        ebp
 004F918B    push        4F91B2
 004F9190    push        dword ptr fs:[eax]
 004F9193    mov         dword ptr fs:[eax],esp
 004F9196    lea         eax,[ebp-10]
 004F9199    push        eax
 004F919A    push        4
 004F919C    push        0
 004F919E    push        406D1388
 004F91A3    call        kernel32.RaiseException
 004F91A8    xor         eax,eax
 004F91AA    pop         edx
 004F91AB    pop         ecx
 004F91AC    pop         ecx
 004F91AD    mov         dword ptr fs:[eax],edx
>004F91B0    jmp         004F91BC
>004F91B2    jmp         @HandleAnyException
 004F91B7    call        @DoneExcept
 004F91BC    pop         edi
 004F91BD    pop         esi
 004F91BE    pop         ebx
 004F91BF    mov         esp,ebp
 004F91C1    pop         ebp
 004F91C2    ret
*}
end;

//004F91C4
{*function sub_004F91C4(?:?; ?:?; ?:Integer):?;
begin
 004F91C4    push        ebx
 004F91C5    push        esi
 004F91C6    push        edi
 004F91C7    push        ebp
 004F91C8    add         esp,0FFFFFFF8
 004F91CB    mov         ebx,ecx
 004F91CD    mov         dword ptr [esp+4],edx
 004F91D1    mov         dword ptr [esp],eax
 004F91D4    mov         ebp,dword ptr [esp]
 004F91D7    cmp         dword ptr [esp],0
>004F91DB    je          004F91E4
 004F91DD    cmp         dword ptr [esp+4],0
>004F91E2    jne         004F91E8
 004F91E4    xor         eax,eax
>004F91E6    jmp         004F9226
 004F91E8    cmp         ebx,1
>004F91EB    jl          004F9224
 004F91ED    mov         eax,dword ptr [esp+4]
 004F91F1    lea         esi,[eax+ebx*2-2]
 004F91F5    movzx       eax,word ptr [ebp]
 004F91F9    cmp         ax,word ptr [esi]
>004F91FC    jne         004F921F
 004F91FE    mov         edi,dword ptr [esp]
 004F9201    test        edi,edi
>004F9203    je          004F920A
 004F9205    sub         edi,4
 004F9208    mov         edi,dword ptr [edi]
 004F920A    mov         ecx,edi
 004F920C    add         ecx,ecx
 004F920E    mov         edx,esi
 004F9210    mov         eax,ebp
 004F9212    call        CompareMem
 004F9217    test        al,al
>004F9219    je          004F921F
 004F921B    mov         eax,ebx
>004F921D    jmp         004F9226
 004F921F    dec         ebx
 004F9220    test        ebx,ebx
>004F9222    jne         004F91ED
 004F9224    xor         eax,eax
 004F9226    pop         ecx
 004F9227    pop         edx
 004F9228    pop         ebp
 004F9229    pop         edi
 004F922A    pop         esi
 004F922B    pop         ebx
 004F922C    ret
end;*}

//004F9230
{*function sub_004F9230(?:UString; ?:?):?;
begin
 004F9230    push        esi
 004F9231    mov         ecx,edx
 004F9233    test        ecx,ecx
>004F9235    je          004F923C
 004F9237    sub         ecx,4
 004F923A    mov         ecx,dword ptr [ecx]
 004F923C    mov         esi,eax
 004F923E    test        esi,esi
>004F9240    je          004F9247
 004F9242    sub         esi,4
 004F9245    mov         esi,dword ptr [esi]
 004F9247    sub         ecx,esi
 004F9249    inc         ecx
 004F924A    call        004F91C4
 004F924F    pop         esi
 004F9250    ret
end;*}

//004F9254
{*function sub_004F9254(?:UnicodeString):?;
begin
 004F9254    push        ebp
 004F9255    mov         ebp,esp
 004F9257    push        0
 004F9259    push        0
 004F925B    push        ebx
 004F925C    mov         ebx,eax
 004F925E    xor         eax,eax
 004F9260    push        ebp
 004F9261    push        4F9302
 004F9266    push        dword ptr fs:[eax]
 004F9269    mov         dword ptr fs:[eax],esp
 004F926C    mov         eax,ebx
 004F926E    add         eax,0FFFFFFD0
 004F9271    sub         ax,0A
>004F9275    jb          004F928B
 004F9277    add         eax,0FFFFFFF9
 004F927A    sub         ax,6
>004F927E    jb          004F92A2
 004F9280    add         eax,0FFFFFFE6
 004F9283    sub         ax,6
>004F9287    jb          004F9295
>004F9289    jmp         004F92AF
 004F928B    movzx       eax,bx
 004F928E    sub         eax,30
 004F9291    mov         ebx,eax
>004F9293    jmp         004F92E7
 004F9295    movzx       eax,bx
 004F9298    sub         eax,61
 004F929B    add         eax,0A
 004F929E    mov         ebx,eax
>004F92A0    jmp         004F92E7
 004F92A2    movzx       eax,bx
 004F92A5    sub         eax,41
 004F92A8    add         eax,0A
 004F92AB    mov         ebx,eax
>004F92AD    jmp         004F92E7
 004F92AF    push        4F931C;'Can not convert $'
 004F92B4    lea         eax,[ebp-8]
 004F92B7    mov         edx,ebx
 004F92B9    call        @UStrFromWChar
 004F92BE    push        dword ptr [ebp-8]
 004F92C1    push        4F934C;' to an integer.'
 004F92C6    lea         eax,[ebp-4]
 004F92C9    mov         edx,3
 004F92CE    call        @UStrCatN
 004F92D3    mov         ecx,dword ptr [ebp-4]
 004F92D6    mov         dl,1
 004F92D8    mov         eax,[0041A0BC];EConvertError
 004F92DD    call        Exception.Create;EConvertError.Create
 004F92E2    call        @RaiseExcept
 004F92E7    xor         eax,eax
 004F92E9    pop         edx
 004F92EA    pop         ecx
 004F92EB    pop         ecx
 004F92EC    mov         dword ptr fs:[eax],edx
 004F92EF    push        4F9309
 004F92F4    lea         eax,[ebp-8]
 004F92F7    mov         edx,2
 004F92FC    call        @UStrArrayClr
 004F9301    ret
>004F9302    jmp         @HandleFinally
>004F9307    jmp         004F92F4
 004F9309    mov         eax,ebx
 004F930B    pop         ebx
 004F930C    pop         ecx
 004F930D    pop         ecx
 004F930E    pop         ebp
 004F930F    ret
end;*}

//004F936C
{*function sub_004F936C(?:UnicodeString):?;
begin
 004F936C    push        ebp
 004F936D    mov         ebp,esp
 004F936F    add         esp,0FFFFFFF8
 004F9372    push        ebx
 004F9373    push        esi
 004F9374    push        edi
 004F9375    xor         edx,edx
 004F9377    mov         dword ptr [ebp-8],edx
 004F937A    mov         dword ptr [ebp-4],eax
 004F937D    mov         eax,dword ptr [ebp-4]
 004F9380    call        @UStrAddRef
 004F9385    xor         eax,eax
 004F9387    push        ebp
 004F9388    push        4F94C1
 004F938D    push        dword ptr fs:[eax]
 004F9390    mov         dword ptr fs:[eax],esp
 004F9393    lea         edx,[ebp-8]
 004F9396    mov         eax,dword ptr [ebp-4]
 004F9399    call        Trim
 004F939E    mov         edx,dword ptr [ebp-8]
 004F93A1    lea         eax,[ebp-4]
 004F93A4    call        @UStrLAsg
 004F93A9    cmp         dword ptr [ebp-4],0
>004F93AD    jne         004F93C5
 004F93AF    mov         ecx,4F94E0;'I can''t convert an empty hexadecimal number to an integer.'
 004F93B4    mov         dl,1
 004F93B6    mov         eax,[0041A0BC];EConvertError
 004F93BB    call        Exception.Create;EConvertError.Create
 004F93C0    call        @RaiseExcept
 004F93C5    mov         eax,dword ptr [ebp-4]
 004F93C8    cmp         word ptr [eax],2D
>004F93CC    jne         004F93E4
 004F93CE    mov         bl,1
 004F93D0    lea         eax,[ebp-4]
 004F93D3    mov         ecx,1
 004F93D8    mov         edx,1
 004F93DD    call        @UStrDelete
>004F93E2    jmp         004F93E6
 004F93E4    xor         ebx,ebx
 004F93E6    cmp         dword ptr [ebp-4],0
>004F93EA    jne         004F9402
 004F93EC    mov         ecx,4F9564;'I can''t convert a minus sign to an integer.'
 004F93F1    mov         dl,1
 004F93F3    mov         eax,[0041A0BC];EConvertError
 004F93F8    call        Exception.Create;EConvertError.Create
 004F93FD    call        @RaiseExcept
 004F9402    mov         edx,dword ptr [ebp-4]
 004F9405    mov         eax,edx
 004F9407    test        eax,eax
>004F9409    je          004F9410
 004F940B    sub         eax,4
 004F940E    mov         eax,dword ptr [eax]
 004F9410    mov         ecx,dword ptr [ebp-4]
 004F9413    cmp         word ptr [ecx+eax*2-2],48
>004F9419    jne         004F9434
 004F941B    mov         eax,edx
 004F941D    test        eax,eax
>004F941F    je          004F9426
 004F9421    sub         eax,4
 004F9424    mov         eax,dword ptr [eax]
 004F9426    lea         edx,[ebp-4]
 004F9429    mov         ecx,1
 004F942E    xchg        eax,edx
 004F942F    call        @UStrDelete
 004F9434    mov         eax,dword ptr [ebp-4]
 004F9437    movzx       eax,word ptr [eax]
 004F943A    cmp         ax,24
>004F943E    jne         004F9444
 004F9440    xor         esi,esi
>004F9442    jmp         004F944B
 004F9444    call        004F9254
 004F9449    mov         esi,eax
 004F944B    mov         eax,dword ptr [ebp-4]
 004F944E    test        eax,eax
>004F9450    je          004F9457
 004F9452    sub         eax,4
 004F9455    mov         eax,dword ptr [eax]
 004F9457    cmp         eax,2
>004F945A    jl          004F94A6
 004F945C    mov         eax,dword ptr [ebp-4]
 004F945F    movzx       eax,word ptr [eax+2]
 004F9463    cmp         ax,78
>004F9467    je          004F946F
 004F9469    cmp         ax,58
>004F946D    jne         004F9476
 004F946F    mov         edi,3
>004F9474    jmp         004F9494
 004F9476    mov         edi,2
>004F947B    jmp         004F9494
 004F947D    mov         eax,dword ptr [ebp-4]
 004F9480    movzx       eax,word ptr [eax+edi*2-2]
 004F9485    call        004F9254
 004F948A    mov         edx,esi
 004F948C    shl         edx,4
 004F948F    add         eax,edx
 004F9491    mov         esi,eax
 004F9493    inc         edi
 004F9494    mov         eax,dword ptr [ebp-4]
 004F9497    call        @UStrLen
 004F949C    cmp         edi,eax
>004F949E    jle         004F947D
 004F94A0    test        bl,bl
>004F94A2    je          004F94A6
 004F94A4    neg         esi
 004F94A6    xor         eax,eax
 004F94A8    pop         edx
 004F94A9    pop         ecx
 004F94AA    pop         ecx
 004F94AB    mov         dword ptr fs:[eax],edx
 004F94AE    push        4F94C8
 004F94B3    lea         eax,[ebp-8]
 004F94B6    mov         edx,2
 004F94BB    call        @UStrArrayClr
 004F94C0    ret
>004F94C1    jmp         @HandleFinally
>004F94C6    jmp         004F94B3
 004F94C8    mov         eax,esi
 004F94CA    pop         edi
 004F94CB    pop         esi
 004F94CC    pop         ebx
 004F94CD    pop         ecx
 004F94CE    pop         ecx
 004F94CF    pop         ebp
 004F94D0    ret
end;*}

//004F95BC
function TBaseClass.Equals(RHS:TObject):Boolean;
begin
{*
 004F95BC    push        ebx
 004F95BD    push        esi
 004F95BE    mov         esi,edx
 004F95C0    mov         ebx,eax
 004F95C2    mov         eax,ebx
 004F95C4    call        TBaseClass.SanityCheck
 004F95C9    cmp         ebx,esi
 004F95CB    sete        al
 004F95CE    pop         esi
 004F95CF    pop         ebx
 004F95D0    ret
*}
end;

//004F95D4
{*procedure TBaseClass.ToString(?:?);
begin
 004F95D4    push        ebp
 004F95D5    mov         ebp,esp
 004F95D7    push        0
 004F95D9    push        0
 004F95DB    push        ebx
 004F95DC    push        esi
 004F95DD    mov         esi,edx
 004F95DF    mov         ebx,eax
 004F95E1    xor         eax,eax
 004F95E3    push        ebp
 004F95E4    push        4F965D
 004F95E9    push        dword ptr fs:[eax]
 004F95EC    mov         dword ptr fs:[eax],esp
 004F95EF    test        ebx,ebx
>004F95F1    je          004F9600
 004F95F3    mov         edx,dword ptr ds:[4F8544];TBaseClass
 004F95F9    mov         eax,ebx
 004F95FB    call        TBaseClass.Sanity
 004F9600    test        ebx,ebx
>004F9602    jne         004F9612
 004F9604    mov         eax,esi
 004F9606    mov         edx,4F9678;'Nil'
 004F960B    call        @UStrAsg
>004F9610    jmp         004F9642
 004F9612    lea         edx,[ebp-4]
 004F9615    mov         eax,dword ptr [ebx]
 004F9617    call        TObject.ClassName
 004F961C    push        dword ptr [ebp-4]
 004F961F    push        4F968C;'('
 004F9624    lea         edx,[ebp-8]
 004F9627    mov         eax,ebx
 004F9629    call        IntToStr
 004F962E    push        dword ptr [ebp-8]
 004F9631    push        4F969C;')'
 004F9636    mov         eax,esi
 004F9638    mov         edx,4
 004F963D    call        @UStrCatN
 004F9642    xor         eax,eax
 004F9644    pop         edx
 004F9645    pop         ecx
 004F9646    pop         ecx
 004F9647    mov         dword ptr fs:[eax],edx
 004F964A    push        4F9664
 004F964F    lea         eax,[ebp-8]
 004F9652    mov         edx,2
 004F9657    call        @UStrArrayClr
 004F965C    ret
>004F965D    jmp         @HandleFinally
>004F9662    jmp         004F964F
 004F9664    pop         esi
 004F9665    pop         ebx
 004F9666    pop         ecx
 004F9667    pop         ecx
 004F9668    pop         ebp
 004F9669    ret
end;*}

//004F96A0
procedure TBaseClass.SanityCheck;
begin
{*
 004F96A0    push        ebp
 004F96A1    mov         ebp,esp
 004F96A3    push        ebx
 004F96A4    push        esi
 004F96A5    push        edi
 004F96A6    xor         eax,eax
 004F96A8    push        ebp
 004F96A9    push        4F96BE
 004F96AE    push        dword ptr fs:[eax]
 004F96B1    mov         dword ptr fs:[eax],esp
 004F96B4    xor         eax,eax
 004F96B6    pop         edx
 004F96B7    pop         ecx
 004F96B8    pop         ecx
 004F96B9    mov         dword ptr fs:[eax],edx
>004F96BC    jmp         004F96E1
>004F96BE    jmp         @HandleOnException
 004F96C3    dd          2
 004F96C7    dd          0041A464;EAssertionFailed
 004F96CB    dd          004F96D7
 004F96CF    dd          00418C04;Exception
 004F96D3    dd          004F96DC
 004F96D7    call        @RaiseAgain
 004F96DC    call        @DoneExcept
 004F96E1    pop         edi
 004F96E2    pop         esi
 004F96E3    pop         ebx
 004F96E4    pop         ebp
 004F96E5    ret
*}
end;

//004F96E8
{*procedure sub_004F96E8(?:TObject; ?:?);
begin
 004F96E8    push        ebp
 004F96E9    mov         ebp,esp
 004F96EB    xor         ecx,ecx
 004F96ED    push        ecx
 004F96EE    push        ecx
 004F96EF    push        ecx
 004F96F0    push        ecx
 004F96F1    push        ecx
 004F96F2    push        ecx
 004F96F3    push        ecx
 004F96F4    push        ecx
 004F96F5    push        ebx
 004F96F6    push        esi
 004F96F7    push        edi
 004F96F8    mov         esi,edx
 004F96FA    mov         ebx,eax
 004F96FC    xor         eax,eax
 004F96FE    push        ebp
 004F96FF    push        4F9896
 004F9704    push        dword ptr fs:[eax]
 004F9707    mov         dword ptr fs:[eax],esp
 004F970A    test        ebx,ebx
>004F970C    jne         004F971F
 004F970E    mov         eax,esi
 004F9710    mov         edx,4F98B0;'Nil'
 004F9715    call        @UStrAsg
>004F971A    jmp         004F987B
 004F971F    test        ebx,ebx
>004F9721    jne         004F9746
 004F9723    lea         ecx,[ebp-4]
 004F9726    mov         edx,8
 004F972B    mov         eax,ebx
 004F972D    call        IntToHex
 004F9732    mov         ecx,dword ptr [ebp-4]
 004F9735    mov         eax,esi
 004F9737    mov         edx,4F98C4;'Not Assigned '
 004F973C    call        @UStrCat3
>004F9741    jmp         004F987B
 004F9746    push        4
 004F9748    push        ebx
 004F9749    call        kernel32.IsBadReadPtr
 004F974E    test        eax,eax
>004F9750    je          004F9775
 004F9752    lea         ecx,[ebp-8]
 004F9755    mov         edx,8
 004F975A    mov         eax,ebx
 004F975C    call        IntToHex
 004F9761    mov         ecx,dword ptr [ebp-8]
 004F9764    mov         eax,esi
 004F9766    mov         edx,4F98EC;'BadReadPtr '
 004F976B    call        @UStrCat3
>004F9770    jmp         004F987B
 004F9775    mov         edi,dword ptr [ebx]
 004F9777    push        4C
 004F9779    sub         edi,4C
 004F977C    push        edi
 004F977D    call        kernel32.IsBadReadPtr
 004F9782    test        eax,eax
>004F9784    je          004F97A9
 004F9786    lea         ecx,[ebp-0C]
 004F9789    mov         edx,8
 004F978E    mov         eax,ebx
 004F9790    call        IntToHex
 004F9795    mov         ecx,dword ptr [ebp-0C]
 004F9798    mov         eax,esi
 004F979A    mov         edx,4F9910;'NotAClass '
 004F979F    call        @UStrCat3
>004F97A4    jmp         004F987B
 004F97A9    mov         eax,dword ptr [ebx]
 004F97AB    add         eax,0FFFFFFCC
 004F97AE    mov         edi,dword ptr [eax]
 004F97B0    cmp         edi,4
>004F97B3    jge         004F97B9
 004F97B5    mov         al,1
>004F97B7    jmp         004F97C2
 004F97B9    cmp         edi,40000
 004F97BF    setg        al
 004F97C2    test        al,al
>004F97C4    je          004F97E9
 004F97C6    lea         ecx,[ebp-10]
 004F97C9    mov         edx,8
 004F97CE    mov         eax,ebx
 004F97D0    call        IntToHex
 004F97D5    mov         ecx,dword ptr [ebp-10]
 004F97D8    mov         eax,esi
 004F97DA    mov         edx,4F9934;'BadSize '
 004F97DF    call        @UStrCat3
>004F97E4    jmp         004F987B
 004F97E9    push        edi
 004F97EA    push        ebx
 004F97EB    call        kernel32.IsBadReadPtr
 004F97F0    test        eax,eax
>004F97F2    je          004F9814
 004F97F4    lea         ecx,[ebp-14]
 004F97F7    mov         edx,8
 004F97FC    mov         eax,ebx
 004F97FE    call        IntToHex
 004F9803    mov         ecx,dword ptr [ebp-14]
 004F9806    mov         eax,esi
 004F9808    mov         edx,4F9954;'Unreadable '
 004F980D    call        @UStrCat3
>004F9812    jmp         004F987B
 004F9814    mov         eax,dword ptr [ebx]
 004F9816    add         eax,0FFFFFFCC
 004F9819    mov         eax,dword ptr [eax]
 004F981B    push        eax
 004F981C    push        ebx
 004F981D    call        kernel32.IsBadWritePtr
 004F9822    test        eax,eax
>004F9824    je          004F9846
 004F9826    lea         ecx,[ebp-18]
 004F9829    mov         edx,8
 004F982E    mov         eax,ebx
 004F9830    call        IntToHex
 004F9835    mov         ecx,dword ptr [ebp-18]
 004F9838    mov         eax,esi
 004F983A    mov         edx,4F9978;'Unwritable '
 004F983F    call        @UStrCat3
>004F9844    jmp         004F987B
 004F9846    lea         edx,[ebp-1C]
 004F9849    mov         eax,dword ptr [ebx]
 004F984B    call        TObject.ClassName
 004F9850    push        dword ptr [ebp-1C]
 004F9853    push        4F999C;'('
 004F9858    lea         ecx,[ebp-20]
 004F985B    mov         edx,8
 004F9860    mov         eax,ebx
 004F9862    call        IntToHex
 004F9867    push        dword ptr [ebp-20]
 004F986A    push        4F99AC;')'
 004F986F    mov         eax,esi
 004F9871    mov         edx,4
 004F9876    call        @UStrCatN
 004F987B    xor         eax,eax
 004F987D    pop         edx
 004F987E    pop         ecx
 004F987F    pop         ecx
 004F9880    mov         dword ptr fs:[eax],edx
 004F9883    push        4F989D
 004F9888    lea         eax,[ebp-20]
 004F988B    mov         edx,8
 004F9890    call        @UStrArrayClr
 004F9895    ret
>004F9896    jmp         @HandleFinally
>004F989B    jmp         004F9888
 004F989D    pop         edi
 004F989E    pop         esi
 004F989F    pop         ebx
 004F98A0    mov         esp,ebp
 004F98A2    pop         ebp
 004F98A3    ret
end;*}

//004F99B0
{*function sub_004F99B0(?:Pointer):?;
begin
 004F99B0    push        ebx
 004F99B1    push        esi
 004F99B2    push        edi
 004F99B3    mov         ebx,eax
 004F99B5    test        ebx,ebx
>004F99B7    jne         004F99BD
 004F99B9    xor         eax,eax
>004F99BB    jmp         004F9A34
 004F99BD    test        ebx,ebx
>004F99BF    jne         004F99C5
 004F99C1    xor         eax,eax
>004F99C3    jmp         004F9A34
 004F99C5    push        4
 004F99C7    push        ebx
 004F99C8    call        kernel32.IsBadReadPtr
 004F99CD    test        eax,eax
>004F99CF    je          004F99D5
 004F99D1    xor         eax,eax
>004F99D3    jmp         004F9A34
 004F99D5    mov         edi,ebx
 004F99D7    mov         esi,dword ptr [edi]
 004F99D9    push        4C
 004F99DB    sub         esi,4C
 004F99DE    push        esi
 004F99DF    call        kernel32.IsBadReadPtr
 004F99E4    test        eax,eax
>004F99E6    je          004F99EC
 004F99E8    xor         eax,eax
>004F99EA    jmp         004F9A34
 004F99EC    mov         eax,dword ptr [ebx]
 004F99EE    add         eax,0FFFFFFCC
 004F99F1    mov         esi,dword ptr [eax]
 004F99F3    cmp         esi,4
>004F99F6    jge         004F99FC
 004F99F8    mov         al,1
>004F99FA    jmp         004F9A05
 004F99FC    cmp         esi,40000
 004F9A02    setg        al
 004F9A05    test        al,al
>004F9A07    je          004F9A0D
 004F9A09    xor         eax,eax
>004F9A0B    jmp         004F9A34
 004F9A0D    push        esi
 004F9A0E    push        edi
 004F9A0F    call        kernel32.IsBadReadPtr
 004F9A14    test        eax,eax
>004F9A16    je          004F9A1C
 004F9A18    xor         eax,eax
>004F9A1A    jmp         004F9A34
 004F9A1C    mov         eax,dword ptr [ebx]
 004F9A1E    add         eax,0FFFFFFCC
 004F9A21    mov         eax,dword ptr [eax]
 004F9A23    push        eax
 004F9A24    push        edi
 004F9A25    call        kernel32.IsBadWritePtr
 004F9A2A    test        eax,eax
>004F9A2C    je          004F9A32
 004F9A2E    xor         eax,eax
>004F9A30    jmp         004F9A34
 004F9A32    mov         al,1
 004F9A34    pop         edi
 004F9A35    pop         esi
 004F9A36    pop         ebx
 004F9A37    ret
end;*}

//004F9A38
procedure sub_004F9A38(?:TObject);
begin
{*
 004F9A38    push        ebx
 004F9A39    mov         ebx,eax
 004F9A3B    mov         eax,dword ptr [ebx]
 004F9A3D    test        eax,eax
>004F9A3F    je          004F9A56
 004F9A41    call        TObject.Free
 004F9A46    push        4
 004F9A48    push        ebx
 004F9A49    call        kernel32.IsBadReadPtr
 004F9A4E    test        eax,eax
>004F9A50    jne         004F9A56
 004F9A52    xor         eax,eax
 004F9A54    mov         dword ptr [ebx],eax
 004F9A56    pop         ebx
 004F9A57    ret
*}
end;

//004F9A58
{*function sub_004F9A58(?:UnicodeString; ?:UString):?;
begin
 004F9A58    push        ebp
 004F9A59    mov         ebp,esp
 004F9A5B    xor         ecx,ecx
 004F9A5D    push        ecx
 004F9A5E    push        ecx
 004F9A5F    push        ecx
 004F9A60    push        ecx
 004F9A61    push        ecx
 004F9A62    push        ebx
 004F9A63    mov         dword ptr [ebp-8],edx
 004F9A66    mov         dword ptr [ebp-4],eax
 004F9A69    mov         eax,dword ptr [ebp-4]
 004F9A6C    call        @UStrAddRef
 004F9A71    mov         eax,dword ptr [ebp-8]
 004F9A74    call        @UStrAddRef
 004F9A79    xor         eax,eax
 004F9A7B    push        ebp
 004F9A7C    push        4F9AF2
 004F9A81    push        dword ptr fs:[eax]
 004F9A84    mov         dword ptr fs:[eax],esp
 004F9A87    lea         edx,[ebp-10]
 004F9A8A    mov         eax,dword ptr [ebp-8]
 004F9A8D    call        UpperCase
 004F9A92    mov         edx,dword ptr [ebp-10]
 004F9A95    lea         eax,[ebp-8]
 004F9A98    call        @UStrLAsg
 004F9A9D    lea         edx,[ebp-0C]
 004F9AA0    mov         eax,dword ptr [ebp-4]
 004F9AA3    call        UpperCase
 004F9AA8    mov         ebx,dword ptr [ebp-8]
 004F9AAB    test        ebx,ebx
>004F9AAD    je          004F9AB4
 004F9AAF    sub         ebx,4
 004F9AB2    mov         ebx,dword ptr [ebx]
 004F9AB4    lea         eax,[ebp-14]
 004F9AB7    push        eax
 004F9AB8    mov         ecx,ebx
 004F9ABA    mov         edx,1
 004F9ABF    mov         eax,dword ptr [ebp-0C]
 004F9AC2    call        @UStrCopy
 004F9AC7    mov         eax,dword ptr [ebp-14]
 004F9ACA    mov         edx,dword ptr [ebp-8]
 004F9ACD    call        @UStrEqual
 004F9AD2    sete        al
 004F9AD5    mov         ebx,eax
 004F9AD7    xor         eax,eax
 004F9AD9    pop         edx
 004F9ADA    pop         ecx
 004F9ADB    pop         ecx
 004F9ADC    mov         dword ptr fs:[eax],edx
 004F9ADF    push        4F9AF9
 004F9AE4    lea         eax,[ebp-14]
 004F9AE7    mov         edx,5
 004F9AEC    call        @UStrArrayClr
 004F9AF1    ret
>004F9AF2    jmp         @HandleFinally
>004F9AF7    jmp         004F9AE4
 004F9AF9    mov         eax,ebx
 004F9AFB    pop         ebx
 004F9AFC    mov         esp,ebp
 004F9AFE    pop         ebp
 004F9AFF    ret
end;*}

//004F9B00
{*function sub_004F9B00(?:?; ?:UString):?;
begin
 004F9B00    push        ebp
 004F9B01    mov         ebp,esp
 004F9B03    xor         ecx,ecx
 004F9B05    push        ecx
 004F9B06    push        ecx
 004F9B07    push        ecx
 004F9B08    push        ecx
 004F9B09    push        ecx
 004F9B0A    push        ebx
 004F9B0B    push        esi
 004F9B0C    push        edi
 004F9B0D    mov         dword ptr [ebp-8],edx
 004F9B10    mov         dword ptr [ebp-4],eax
 004F9B13    mov         eax,dword ptr [ebp-4]
 004F9B16    call        @UStrAddRef
 004F9B1B    mov         eax,dword ptr [ebp-8]
 004F9B1E    call        @UStrAddRef
 004F9B23    xor         eax,eax
 004F9B25    push        ebp
 004F9B26    push        4F9BC0
 004F9B2B    push        dword ptr fs:[eax]
 004F9B2E    mov         dword ptr fs:[eax],esp
 004F9B31    lea         edx,[ebp-0C]
 004F9B34    mov         eax,dword ptr [ebp-8]
 004F9B37    call        UpperCase
 004F9B3C    mov         edx,dword ptr [ebp-0C]
 004F9B3F    lea         eax,[ebp-8]
 004F9B42    call        @UStrLAsg
 004F9B47    lea         edx,[ebp-10]
 004F9B4A    mov         eax,dword ptr [ebp-4]
 004F9B4D    call        UpperCase
 004F9B52    mov         edx,dword ptr [ebp-10]
 004F9B55    lea         eax,[ebp-4]
 004F9B58    call        @UStrLAsg
 004F9B5D    mov         ebx,dword ptr [ebp-4]
 004F9B60    test        ebx,ebx
>004F9B62    je          004F9B69
 004F9B64    sub         ebx,4
 004F9B67    mov         ebx,dword ptr [ebx]
 004F9B69    mov         eax,dword ptr [ebp-8]
 004F9B6C    mov         esi,eax
 004F9B6E    test        esi,esi
>004F9B70    je          004F9B77
 004F9B72    sub         esi,4
 004F9B75    mov         esi,dword ptr [esi]
 004F9B77    mov         edi,eax
 004F9B79    test        edi,edi
>004F9B7B    je          004F9B82
 004F9B7D    sub         edi,4
 004F9B80    mov         edi,dword ptr [edi]
 004F9B82    lea         eax,[ebp-14]
 004F9B85    push        eax
 004F9B86    mov         edx,ebx
 004F9B88    sub         edx,esi
 004F9B8A    inc         edx
 004F9B8B    mov         ecx,edi
 004F9B8D    mov         eax,dword ptr [ebp-4]
 004F9B90    call        @UStrCopy
 004F9B95    mov         eax,dword ptr [ebp-14]
 004F9B98    mov         edx,dword ptr [ebp-8]
 004F9B9B    call        @UStrEqual
 004F9BA0    sete        al
 004F9BA3    mov         ebx,eax
 004F9BA5    xor         eax,eax
 004F9BA7    pop         edx
 004F9BA8    pop         ecx
 004F9BA9    pop         ecx
 004F9BAA    mov         dword ptr fs:[eax],edx
 004F9BAD    push        4F9BC7
 004F9BB2    lea         eax,[ebp-14]
 004F9BB5    mov         edx,5
 004F9BBA    call        @UStrArrayClr
 004F9BBF    ret
>004F9BC0    jmp         @HandleFinally
>004F9BC5    jmp         004F9BB2
 004F9BC7    mov         eax,ebx
 004F9BC9    pop         edi
 004F9BCA    pop         esi
 004F9BCB    pop         ebx
 004F9BCC    mov         esp,ebp
 004F9BCE    pop         ebp
 004F9BCF    ret
end;*}

//004F9BD0
{*function sub_004F9BD0(?:UnicodeString; ?:UString):?;
begin
 004F9BD0    push        ebp
 004F9BD1    mov         ebp,esp
 004F9BD3    push        0
 004F9BD5    push        0
 004F9BD7    push        ebx
 004F9BD8    push        esi
 004F9BD9    mov         esi,edx
 004F9BDB    mov         ebx,eax
 004F9BDD    xor         eax,eax
 004F9BDF    push        ebp
 004F9BE0    push        4F9C4B
 004F9BE5    push        dword ptr fs:[eax]
 004F9BE8    mov         dword ptr fs:[eax],esp
 004F9BEB    lea         edx,[ebp-4]
 004F9BEE    mov         eax,esi
 004F9BF0    call        UpperCase
 004F9BF5    mov         eax,dword ptr [ebp-4]
 004F9BF8    push        eax
 004F9BF9    lea         edx,[ebp-8]
 004F9BFC    mov         eax,dword ptr [ebx]
 004F9BFE    call        UpperCase
 004F9C03    mov         eax,dword ptr [ebp-8]
 004F9C06    pop         edx
 004F9C07    call        004F9A58
 004F9C0C    test        al,al
>004F9C0E    je          004F9C2E
 004F9C10    mov         eax,esi
 004F9C12    test        eax,eax
>004F9C14    je          004F9C1B
 004F9C16    sub         eax,4
 004F9C19    mov         eax,dword ptr [eax]
 004F9C1B    mov         edx,ebx
 004F9C1D    mov         ecx,eax
 004F9C1F    mov         eax,1
 004F9C24    xchg        eax,edx
 004F9C25    call        @UStrDelete
 004F9C2A    mov         bl,1
>004F9C2C    jmp         004F9C30
 004F9C2E    xor         ebx,ebx
 004F9C30    xor         eax,eax
 004F9C32    pop         edx
 004F9C33    pop         ecx
 004F9C34    pop         ecx
 004F9C35    mov         dword ptr fs:[eax],edx
 004F9C38    push        4F9C52
 004F9C3D    lea         eax,[ebp-8]
 004F9C40    mov         edx,2
 004F9C45    call        @UStrArrayClr
 004F9C4A    ret
>004F9C4B    jmp         @HandleFinally
>004F9C50    jmp         004F9C3D
 004F9C52    mov         eax,ebx
 004F9C54    pop         esi
 004F9C55    pop         ebx
 004F9C56    pop         ecx
 004F9C57    pop         ecx
 004F9C58    pop         ebp
 004F9C59    ret
end;*}

//004F9C5C
{*function sub_004F9C5C(?:WideString; ?:?):?;
begin
 004F9C5C    push        ebp
 004F9C5D    mov         ebp,esp
 004F9C5F    xor         ecx,ecx
 004F9C61    push        ecx
 004F9C62    push        ecx
 004F9C63    push        ecx
 004F9C64    push        ecx
 004F9C65    push        ebx
 004F9C66    push        esi
 004F9C67    mov         esi,edx
 004F9C69    mov         ebx,eax
 004F9C6B    xor         eax,eax
 004F9C6D    push        ebp
 004F9C6E    push        4F9CF1
 004F9C73    push        dword ptr fs:[eax]
 004F9C76    mov         dword ptr fs:[eax],esp
 004F9C79    lea         eax,[ebp-8]
 004F9C7C    mov         edx,esi
 004F9C7E    call        @UStrFromWStr
 004F9C83    mov         eax,dword ptr [ebp-8]
 004F9C86    lea         edx,[ebp-4]
 004F9C89    call        UpperCase
 004F9C8E    mov         eax,dword ptr [ebp-4]
 004F9C91    push        eax
 004F9C92    lea         eax,[ebp-10]
 004F9C95    mov         edx,dword ptr [ebx]
 004F9C97    call        @UStrFromWStr
 004F9C9C    mov         eax,dword ptr [ebp-10]
 004F9C9F    lea         edx,[ebp-0C]
 004F9CA2    call        UpperCase
 004F9CA7    mov         eax,dword ptr [ebp-0C]
 004F9CAA    pop         edx
 004F9CAB    call        004F9A58
 004F9CB0    test        al,al
>004F9CB2    je          004F9CD4
 004F9CB4    mov         eax,esi
 004F9CB6    test        eax,eax
>004F9CB8    je          004F9CC1
 004F9CBA    sub         eax,4
 004F9CBD    mov         eax,dword ptr [eax]
 004F9CBF    shr         eax,1
 004F9CC1    mov         edx,ebx
 004F9CC3    mov         ecx,eax
 004F9CC5    mov         eax,1
 004F9CCA    xchg        eax,edx
 004F9CCB    call        @WStrDelete
 004F9CD0    mov         bl,1
>004F9CD2    jmp         004F9CD6
 004F9CD4    xor         ebx,ebx
 004F9CD6    xor         eax,eax
 004F9CD8    pop         edx
 004F9CD9    pop         ecx
 004F9CDA    pop         ecx
 004F9CDB    mov         dword ptr fs:[eax],edx
 004F9CDE    push        4F9CF8
 004F9CE3    lea         eax,[ebp-10]
 004F9CE6    mov         edx,4
 004F9CEB    call        @UStrArrayClr
 004F9CF0    ret
>004F9CF1    jmp         @HandleFinally
>004F9CF6    jmp         004F9CE3
 004F9CF8    mov         eax,ebx
 004F9CFA    pop         esi
 004F9CFB    pop         ebx
 004F9CFC    mov         esp,ebp
 004F9CFE    pop         ebp
 004F9CFF    ret
end;*}

//004F9D00
{*function sub_004F9D00(?:UnicodeString):?;
begin
 004F9D00    push        ebp
 004F9D01    mov         ebp,esp
 004F9D03    push        0
 004F9D05    push        ebx
 004F9D06    push        esi
 004F9D07    push        edi
 004F9D08    mov         esi,eax
 004F9D0A    xor         eax,eax
 004F9D0C    push        ebp
 004F9D0D    push        4F9D8C
 004F9D12    push        dword ptr fs:[eax]
 004F9D15    mov         dword ptr fs:[eax],esp
 004F9D18    mov         ebx,1
>004F9D1D    jmp         004F9D20
 004F9D1F    inc         ebx
 004F9D20    mov         eax,dword ptr [esi]
 004F9D22    call        @UStrLen
 004F9D27    cmp         ebx,eax
>004F9D29    jg          004F9D3F
 004F9D2B    mov         eax,dword ptr [esi]
 004F9D2D    cmp         word ptr [eax+ebx*2-2],30
>004F9D33    jb          004F9D3F
 004F9D35    mov         eax,dword ptr [esi]
 004F9D37    cmp         word ptr [eax+ebx*2-2],39
>004F9D3D    jbe         004F9D1F
 004F9D3F    dec         ebx
 004F9D40    test        ebx,ebx
>004F9D42    jg          004F9D49
 004F9D44    or          edi,0FFFFFFFF
>004F9D47    jmp         004F9D76
 004F9D49    lea         eax,[ebp-4]
 004F9D4C    push        eax
 004F9D4D    mov         eax,dword ptr [esi]
 004F9D4F    mov         ecx,ebx
 004F9D51    mov         edx,1
 004F9D56    call        @UStrCopy
 004F9D5B    mov         eax,dword ptr [ebp-4]
 004F9D5E    or          edx,0FFFFFFFF
 004F9D61    call        StrToIntDef
 004F9D66    mov         edi,eax
 004F9D68    mov         eax,esi
 004F9D6A    mov         ecx,ebx
 004F9D6C    mov         edx,1
 004F9D71    call        @UStrDelete
 004F9D76    xor         eax,eax
 004F9D78    pop         edx
 004F9D79    pop         ecx
 004F9D7A    pop         ecx
 004F9D7B    mov         dword ptr fs:[eax],edx
 004F9D7E    push        4F9D93
 004F9D83    lea         eax,[ebp-4]
 004F9D86    call        @UStrClr
 004F9D8B    ret
>004F9D8C    jmp         @HandleFinally
>004F9D91    jmp         004F9D83
 004F9D93    mov         eax,edi
 004F9D95    pop         edi
 004F9D96    pop         esi
 004F9D97    pop         ebx
 004F9D98    pop         ecx
 004F9D99    pop         ebp
 004F9D9A    ret
end;*}

//004F9D9C
{*function sub_004F9D9C(?:UnicodeString; ?:UString):?;
begin
 004F9D9C    push        ebp
 004F9D9D    mov         ebp,esp
 004F9D9F    push        0
 004F9DA1    push        0
 004F9DA3    push        0
 004F9DA5    push        ebx
 004F9DA6    push        esi
 004F9DA7    mov         ebx,edx
 004F9DA9    mov         esi,eax
 004F9DAB    xor         eax,eax
 004F9DAD    push        ebp
 004F9DAE    push        4F9E34
 004F9DB3    push        dword ptr fs:[eax]
 004F9DB6    mov         dword ptr fs:[eax],esp
 004F9DB9    lea         edx,[ebp-4]
 004F9DBC    mov         eax,ebx
 004F9DBE    call        UpperCase
 004F9DC3    mov         eax,dword ptr [ebp-4]
 004F9DC6    push        eax
 004F9DC7    lea         edx,[ebp-8]
 004F9DCA    mov         eax,dword ptr [esi]
 004F9DCC    call        UpperCase
 004F9DD1    mov         eax,dword ptr [ebp-8]
 004F9DD4    pop         edx
 004F9DD5    call        004F9B00
 004F9DDA    test        al,al
>004F9DDC    je          004F9E17
 004F9DDE    mov         eax,dword ptr [esi]
 004F9DE0    mov         dword ptr [ebp-0C],eax
 004F9DE3    mov         eax,dword ptr [ebp-0C]
 004F9DE6    test        eax,eax
>004F9DE8    je          004F9DEF
 004F9DEA    sub         eax,4
 004F9DED    mov         eax,dword ptr [eax]
 004F9DEF    mov         ecx,ebx
 004F9DF1    mov         edx,ecx
 004F9DF3    test        edx,edx
>004F9DF5    je          004F9DFC
 004F9DF7    sub         edx,4
 004F9DFA    mov         edx,dword ptr [edx]
 004F9DFC    test        ecx,ecx
>004F9DFE    je          004F9E05
 004F9E00    sub         ecx,4
 004F9E03    mov         ecx,dword ptr [ecx]
 004F9E05    mov         ebx,esi
 004F9E07    sub         eax,edx
 004F9E09    inc         eax
 004F9E0A    mov         edx,eax
 004F9E0C    mov         eax,ebx
 004F9E0E    call        @UStrDelete
 004F9E13    mov         bl,1
>004F9E15    jmp         004F9E19
 004F9E17    xor         ebx,ebx
 004F9E19    xor         eax,eax
 004F9E1B    pop         edx
 004F9E1C    pop         ecx
 004F9E1D    pop         ecx
 004F9E1E    mov         dword ptr fs:[eax],edx
 004F9E21    push        4F9E3B
 004F9E26    lea         eax,[ebp-8]
 004F9E29    mov         edx,2
 004F9E2E    call        @UStrArrayClr
 004F9E33    ret
>004F9E34    jmp         @HandleFinally
>004F9E39    jmp         004F9E26
 004F9E3B    mov         eax,ebx
 004F9E3D    pop         esi
 004F9E3E    pop         ebx
 004F9E3F    mov         esp,ebp
 004F9E41    pop         ebp
 004F9E42    ret
end;*}

//004F9E44
{*procedure sub_004F9E44(?:TStatement; ?:?);
begin
 004F9E44    push        ebx
 004F9E45    push        esi
 004F9E46    mov         esi,edx
 004F9E48    mov         ebx,eax
 004F9E4A    mov         edx,esi
 004F9E4C    mov         eax,ebx
 004F9E4E    call        IntToStr
 004F9E53    pop         esi
 004F9E54    pop         ebx
 004F9E55    ret
end;*}

//004F9E58
procedure TBaseClass.Sanity(ObjectType:TClass);
begin
{*
 004F9E58    push        ebp
 004F9E59    mov         ebp,esp
 004F9E5B    push        ebx
 004F9E5C    push        esi
 004F9E5D    push        edi
 004F9E5E    xor         eax,eax
 004F9E60    push        ebp
 004F9E61    push        4F9E76
 004F9E66    push        dword ptr fs:[eax]
 004F9E69    mov         dword ptr fs:[eax],esp
 004F9E6C    xor         eax,eax
 004F9E6E    pop         edx
 004F9E6F    pop         ecx
 004F9E70    pop         ecx
 004F9E71    mov         dword ptr fs:[eax],edx
>004F9E74    jmp         004F9E99
>004F9E76    jmp         @HandleOnException
 004F9E7B    dd          2
 004F9E7F    dd          0041A464;EAssertionFailed
 004F9E83    dd          004F9E8F
 004F9E87    dd          00418C04;Exception
 004F9E8B    dd          004F9E94
 004F9E8F    call        @RaiseAgain
 004F9E94    call        @DoneExcept
 004F9E99    pop         edi
 004F9E9A    pop         esi
 004F9E9B    pop         ebx
 004F9E9C    pop         ebp
 004F9E9D    ret
*}
end;

//004F9EA0
procedure sub_004F9EA0(?:UnicodeString);
begin
{*
 004F9EA0    push        ebp
 004F9EA1    mov         ebp,esp
 004F9EA3    add         esp,0FFFFFFF4
 004F9EA6    push        ebx
 004F9EA7    push        esi
 004F9EA8    push        edi
 004F9EA9    xor         edx,edx
 004F9EAB    mov         dword ptr [ebp-0C],edx
 004F9EAE    mov         dword ptr [ebp-4],eax
 004F9EB1    xor         eax,eax
 004F9EB3    push        ebp
 004F9EB4    push        4FA033
 004F9EB9    push        dword ptr fs:[eax]
 004F9EBC    mov         dword ptr fs:[eax],esp
 004F9EBF    cmp         byte ptr ds:[7868D0],0;gvar_007868D0
>004F9EC6    jne         004F9EF4
 004F9EC8    cmp         dword ptr ds:[7868D8],0;gvar_007868D8:TStringList
>004F9ECF    jne         004F9EE2
 004F9ED1    mov         dl,1
 004F9ED3    mov         eax,[0043C7BC];TStringList
 004F9ED8    call        TStringList.Create;TStringList.Create
 004F9EDD    mov         [007868D8],eax;gvar_007868D8:TStringList
 004F9EE2    mov         edx,dword ptr [ebp-4]
 004F9EE5    mov         eax,[007868D8];0x0 gvar_007868D8:TStringList
 004F9EEA    mov         ecx,dword ptr [eax]
 004F9EEC    call        dword ptr [ecx+38];TStringList.Add
>004F9EEF    jmp         004FA01D
 004F9EF4    cmp         dword ptr ds:[7868D8],0;gvar_007868D8:TStringList
>004F9EFB    je          004F9F3F
 004F9EFD    mov         eax,[007868D8];0x0 gvar_007868D8:TStringList
 004F9F02    mov         dword ptr [ebp-8],eax
 004F9F05    xor         eax,eax
 004F9F07    mov         [007868D8],eax;gvar_007868D8:TStringList
 004F9F0C    mov         eax,dword ptr [ebp-8]
 004F9F0F    mov         edx,dword ptr [eax]
 004F9F11    call        dword ptr [edx+14];TStringList.GetCount
 004F9F14    mov         ebx,eax
 004F9F16    dec         ebx
 004F9F17    test        ebx,ebx
>004F9F19    jl          004F9F37
 004F9F1B    inc         ebx
 004F9F1C    xor         esi,esi
 004F9F1E    lea         ecx,[ebp-0C]
 004F9F21    mov         edx,esi
 004F9F23    mov         eax,dword ptr [ebp-8]
 004F9F26    mov         edi,dword ptr [eax]
 004F9F28    call        dword ptr [edi+0C];TStringList.Get
 004F9F2B    mov         eax,dword ptr [ebp-0C]
 004F9F2E    call        004F9EA0
 004F9F33    inc         esi
 004F9F34    dec         ebx
>004F9F35    jne         004F9F1E
 004F9F37    mov         eax,dword ptr [ebp-8]
 004F9F3A    call        TObject.Free
 004F9F3F    xor         edx,edx
 004F9F41    push        ebp
 004F9F42    push        4FA013
 004F9F47    push        dword ptr fs:[edx]
 004F9F4A    mov         dword ptr fs:[edx],esp
 004F9F4D    mov         eax,[0078D690];^gvar_00793344:TDebugWindow
 004F9F52    cmp         dword ptr [eax],0
>004F9F55    jne         004F9F6D
 004F9F57    xor         ecx,ecx
 004F9F59    mov         dl,1
 004F9F5B    mov         eax,[004F8368];TDebugWindow
 004F9F60    call        TCustomForm.Create;TDebugWindow.Create
 004F9F65    mov         edx,dword ptr ds:[78D690];^gvar_00793344:TDebugWindow
 004F9F6B    mov         dword ptr [edx],eax
 004F9F6D    push        4
 004F9F6F    mov         eax,[0078D690];^gvar_00793344:TDebugWindow
 004F9F74    mov         eax,dword ptr [eax]
 004F9F76    push        eax
 004F9F77    call        kernel32.IsBadReadPtr
 004F9F7C    test        eax,eax
>004F9F7E    jne         004FA009
 004F9F84    mov         eax,[0078D690];^gvar_00793344:TDebugWindow
 004F9F89    mov         eax,dword ptr [eax]
 004F9F8B    mov         eax,dword ptr [eax+388]
 004F9F91    test        eax,eax
>004F9F93    je          004FA009
 004F9F95    mov         edx,dword ptr ds:[78D690];^gvar_00793344:TDebugWindow
 004F9F9B    mov         eax,dword ptr [eax+2A0]
 004F9FA1    mov         edx,dword ptr [ebp-4]
 004F9FA4    mov         ecx,dword ptr [eax]
 004F9FA6    call        dword ptr [ecx+38]
 004F9FA9    mov         eax,[0078D690];^gvar_00793344:TDebugWindow
 004F9FAE    mov         eax,dword ptr [eax]
 004F9FB0    cmp         byte ptr [eax+59],0
>004F9FB4    jne         004FA009
 004F9FB6    mov         eax,[0078D690];^gvar_00793344:TDebugWindow
 004F9FBB    mov         eax,dword ptr [eax]
 004F9FBD    call        TCustomForm.Show
 004F9FC2    mov         eax,[0078D690];^gvar_00793344:TDebugWindow
 004F9FC7    mov         eax,dword ptr [eax]
 004F9FC9    mov         edx,dword ptr ds:[7868C4];0x280 gvar_007868C4
 004F9FCF    call        TCustomForm.SetLeft
 004F9FD4    mov         eax,[0078D690];^gvar_00793344:TDebugWindow
 004F9FD9    mov         eax,dword ptr [eax]
 004F9FDB    mov         edx,dword ptr ds:[7868C8];0x0 gvar_007868C8:Integer
 004F9FE1    call        TCustomForm.SetTop
 004F9FE6    mov         eax,[0078D690];^gvar_00793344:TDebugWindow
 004F9FEB    mov         eax,dword ptr [eax]
 004F9FED    mov         edx,dword ptr ds:[7868CC];0x1E0 gvar_007868CC:Integer
 004F9FF3    call        TControl.SetHeight
 004F9FF8    mov         eax,[0078D690];^gvar_00793344:TDebugWindow
 004F9FFD    mov         eax,dword ptr [eax]
 004F9FFF    mov         edx,12C
 004FA004    call        TControl.SetWidth
 004FA009    xor         eax,eax
 004FA00B    pop         edx
 004FA00C    pop         ecx
 004FA00D    pop         ecx
 004FA00E    mov         dword ptr fs:[eax],edx
>004FA011    jmp         004FA01D
>004FA013    jmp         @HandleAnyException
 004FA018    call        @DoneExcept
 004FA01D    xor         eax,eax
 004FA01F    pop         edx
 004FA020    pop         ecx
 004FA021    pop         ecx
 004FA022    mov         dword ptr fs:[eax],edx
 004FA025    push        4FA03A
 004FA02A    lea         eax,[ebp-0C]
 004FA02D    call        @UStrClr
 004FA032    ret
>004FA033    jmp         @HandleFinally
>004FA038    jmp         004FA02A
 004FA03A    pop         edi
 004FA03B    pop         esi
 004FA03C    pop         ebx
 004FA03D    mov         esp,ebp
 004FA03F    pop         ebp
 004FA040    ret
*}
end;

//004FA044
procedure sub_004FA044;
begin
{*
 004FA044    ret
*}
end;

//004FA048
procedure sub_004FA048;
begin
{*
 004FA048    call        004F9EA0
 004FA04D    ret
*}
end;

//004FA050
function TBaseClass.CopyConstructor:TBaseClass;
begin
{*
 004FA050    push        ebx
 004FA051    push        esi
 004FA052    mov         ebx,eax
 004FA054    mov         edx,dword ptr ds:[4F8544];TBaseClass
 004FA05A    mov         eax,ebx
 004FA05C    call        TBaseClass.Sanity
 004FA061    mov         eax,dword ptr [ebx]
 004FA063    mov         esi,eax
 004FA065    mov         dl,1
 004FA067    mov         eax,esi
 004FA069    call        TObject.Create;TBaseClass.Create
 004FA06E    mov         edx,dword ptr ds:[4F8544];TBaseClass
 004FA074    call        @AsClass
 004FA079    mov         esi,eax
 004FA07B    mov         eax,dword ptr [esi]
 004FA07D    add         eax,0FFFFFFCC
 004FA080    mov         ecx,dword ptr [eax]
 004FA082    mov         edx,esi
 004FA084    mov         eax,ebx
 004FA086    call        Move
 004FA08B    mov         edx,dword ptr ds:[4F8544];TBaseClass
 004FA091    mov         eax,esi
 004FA093    call        TBaseClass.Sanity
 004FA098    mov         eax,esi
 004FA09A    pop         esi
 004FA09B    pop         ebx
 004FA09C    ret
*}
end;

//004FA0A0
{*procedure sub_004FA0A0(?:Integer; ?:?; ?:?);
begin
 004FA0A0    push        ebp
 004FA0A1    mov         ebp,esp
 004FA0A3    push        0
 004FA0A5    push        ebx
 004FA0A6    push        esi
 004FA0A7    push        edi
 004FA0A8    mov         ebx,ecx
 004FA0AA    mov         edi,edx
 004FA0AC    mov         esi,eax
 004FA0AE    xor         eax,eax
 004FA0B0    push        ebp
 004FA0B1    push        4FA12E
 004FA0B6    push        dword ptr fs:[eax]
 004FA0B9    mov         dword ptr fs:[eax],esp
 004FA0BC    mov         eax,ebx
 004FA0BE    call        @UStrClr
 004FA0C3    test        esi,esi
>004FA0C5    jle         004FA10D
 004FA0C7    lea         eax,[ebp-4]
 004FA0CA    mov         edx,esi
 004FA0CC    and         edx,80000007
>004FA0D2    jns         004FA0D9
 004FA0D4    dec         edx
 004FA0D5    or          edx,0FFFFFFF8
 004FA0D8    inc         edx
 004FA0D9    add         edx,30
 004FA0DC    call        @UStrFromWChar
 004FA0E1    mov         edx,dword ptr [ebp-4]
 004FA0E4    mov         ecx,dword ptr [ebx]
 004FA0E6    mov         eax,ebx
 004FA0E8    call        @UStrCat3
 004FA0ED    mov         ecx,8
 004FA0F2    mov         eax,esi
 004FA0F4    cdq
 004FA0F5    idiv        eax,ecx
 004FA0F7    mov         esi,eax
 004FA0F9    test        esi,esi
>004FA0FB    jg          004FA0C7
>004FA0FD    jmp         004FA10D
 004FA0FF    mov         ecx,dword ptr [ebx]
 004FA101    mov         eax,ebx
 004FA103    mov         edx,4FA148;'0'
 004FA108    call        @UStrCat3
 004FA10D    mov         eax,dword ptr [ebx]
 004FA10F    call        @UStrLen
 004FA114    cmp         edi,eax
>004FA116    jg          004FA0FF
 004FA118    xor         eax,eax
 004FA11A    pop         edx
 004FA11B    pop         ecx
 004FA11C    pop         ecx
 004FA11D    mov         dword ptr fs:[eax],edx
 004FA120    push        4FA135
 004FA125    lea         eax,[ebp-4]
 004FA128    call        @UStrClr
 004FA12D    ret
>004FA12E    jmp         @HandleFinally
>004FA133    jmp         004FA125
 004FA135    pop         edi
 004FA136    pop         esi
 004FA137    pop         ebx
 004FA138    pop         ecx
 004FA139    pop         ebp
 004FA13A    ret
end;*}

//004FA14C
{*function sub_004FA14C:?;
begin
 004FA14C    mov         eax,[0078DB58];^gvar_00784C7C
 004FA151    cmp         dword ptr [eax],0
>004FA154    jne         004FA159
 004FA156    xor         eax,eax
 004FA158    ret
 004FA159    mov         eax,[0078DB58];^gvar_00784C7C
 004FA15E    cmp         dword ptr [eax],1
>004FA161    jne         004FA1B1
 004FA163    mov         eax,[0078D080];^gvar_00784C80
 004FA168    cmp         dword ptr [eax],4
>004FA16B    jge         004FA174
 004FA16D    xor         eax,eax
>004FA16F    jmp         004FA21C
 004FA174    mov         eax,[0078D080];^gvar_00784C80
 004FA179    cmp         dword ptr [eax],4
>004FA17C    jne         004FA1AA
 004FA17E    mov         eax,[0078D6F0];^gvar_00784C84
 004FA183    cmp         dword ptr [eax],5A
>004FA186    jl          004FA192
 004FA188    mov         eax,3
>004FA18D    jmp         004FA21C
 004FA192    mov         eax,[0078D6F0];^gvar_00784C84
 004FA197    cmp         dword ptr [eax],0A
>004FA19A    jl          004FA1A3
 004FA19C    mov         eax,2
>004FA1A1    jmp         004FA21C
 004FA1A3    mov         eax,1
>004FA1A8    jmp         004FA21C
 004FA1AA    mov         eax,3
>004FA1AF    jmp         004FA21C
 004FA1B1    mov         eax,[0078DB58];^gvar_00784C7C
 004FA1B6    cmp         dword ptr [eax],2
>004FA1B9    jne         004FA217
 004FA1BB    mov         eax,[0078D080];^gvar_00784C80
 004FA1C0    cmp         dword ptr [eax],5
>004FA1C3    jle         004FA1CC
 004FA1C5    mov         eax,8
>004FA1CA    jmp         004FA21C
 004FA1CC    mov         eax,[0078D080];^gvar_00784C80
 004FA1D1    cmp         dword ptr [eax],5
>004FA1D4    jne         004FA210
 004FA1D6    mov         eax,[0078D6F0];^gvar_00784C84
 004FA1DB    cmp         dword ptr [eax],2
>004FA1DE    jle         004FA1E7
 004FA1E0    mov         eax,7
>004FA1E5    jmp         004FA21C
 004FA1E7    mov         eax,[0078D6F0];^gvar_00784C84
 004FA1EC    cmp         dword ptr [eax],2
>004FA1EF    jne         004FA1F8
 004FA1F1    mov         eax,7
>004FA1F6    jmp         004FA21C
 004FA1F8    mov         eax,[0078D6F0];^gvar_00784C84
 004FA1FD    cmp         dword ptr [eax],1
>004FA200    jne         004FA209
 004FA202    mov         eax,6
>004FA207    jmp         004FA21C
 004FA209    mov         eax,5
>004FA20E    jmp         004FA21C
 004FA210    mov         eax,4
>004FA215    jmp         004FA21C
 004FA217    mov         eax,1
 004FA21C    ret
end;*}

//004FA220
procedure sub_004FA220(?:UnicodeString);
begin
{*
 004FA220    push        ebp
 004FA221    mov         ebp,esp
 004FA223    xor         ecx,ecx
 004FA225    push        ecx
 004FA226    push        ecx
 004FA227    push        ecx
 004FA228    push        ecx
 004FA229    push        ebx
 004FA22A    push        esi
 004FA22B    push        edi
 004FA22C    mov         dword ptr [ebp-4],eax
 004FA22F    mov         eax,dword ptr [ebp-4]
 004FA232    call        @UStrAddRef
 004FA237    xor         eax,eax
 004FA239    push        ebp
 004FA23A    push        4FA353
 004FA23F    push        dword ptr fs:[eax]
 004FA242    mov         dword ptr fs:[eax],esp
 004FA245    cmp         byte ptr ds:[7868DD],0;gvar_007868DD
>004FA24C    jne         004FA2FB
 004FA252    xor         eax,eax
 004FA254    push        ebp
 004FA255    push        4FA2E3
 004FA25A    push        dword ptr fs:[eax]
 004FA25D    mov         dword ptr fs:[eax],esp
 004FA260    lea         edx,[ebp-0C]
 004FA263    xor         eax,eax
 004FA265    call        ParamStr
 004FA26A    mov         eax,dword ptr [ebp-0C]
 004FA26D    lea         edx,[ebp-8]
 004FA270    call        ExtractFilePath
 004FA275    mov         ebx,dword ptr [ebp-8]
 004FA278    test        ebx,ebx
>004FA27A    je          004FA281
 004FA27C    sub         ebx,4
 004FA27F    mov         ebx,dword ptr [ebx]
 004FA281    lea         eax,[ebp-10]
 004FA284    push        eax
 004FA285    mov         ecx,1
 004FA28A    mov         edx,ebx
 004FA28C    mov         eax,dword ptr [ebp-8]
 004FA28F    call        @UStrCopy
 004FA294    mov         eax,dword ptr [ebp-10]
 004FA297    mov         edx,4FA370;'\'
 004FA29C    call        @UStrEqual
>004FA2A1    je          004FA2B0
 004FA2A3    lea         eax,[ebp-8]
 004FA2A6    mov         edx,4FA370;'\'
 004FA2AB    call        @UStrCat
 004FA2B0    lea         eax,[ebp-8]
 004FA2B3    mov         edx,4FA380;'output.txt'
 004FA2B8    call        @UStrCat
 004FA2BD    mov         edx,dword ptr [ebp-8]
 004FA2C0    mov         eax,79361C;gvar_0079361C:TFileRec
 004FA2C5    call        @Assign
 004FA2CA    mov         eax,79361C;gvar_0079361C:TFileRec
 004FA2CF    call        @RewritText
 004FA2D4    call        @_IOTest
 004FA2D9    xor         eax,eax
 004FA2DB    pop         edx
 004FA2DC    pop         ecx
 004FA2DD    pop         ecx
 004FA2DE    mov         dword ptr fs:[eax],edx
>004FA2E1    jmp         004FA2F4
>004FA2E3    jmp         @HandleAnyException
 004FA2E8    mov         byte ptr ds:[7868DF],1;gvar_007868DF
 004FA2EF    call        @DoneExcept
 004FA2F4    mov         byte ptr ds:[7868DD],1;gvar_007868DD
 004FA2FB    cmp         byte ptr ds:[7868DF],0;gvar_007868DF
>004FA302    jne         004FA338
 004FA304    xor         eax,eax
 004FA306    push        ebp
 004FA307    push        4FA32E
 004FA30C    push        dword ptr fs:[eax]
 004FA30F    mov         dword ptr fs:[eax],esp
 004FA312    mov         edx,dword ptr [ebp-4]
 004FA315    mov         eax,79361C;gvar_0079361C:TFileRec
 004FA31A    call        @Write0Bool
 004FA31F    call        @WriteLn
 004FA324    xor         eax,eax
 004FA326    pop         edx
 004FA327    pop         ecx
 004FA328    pop         ecx
 004FA329    mov         dword ptr fs:[eax],edx
>004FA32C    jmp         004FA338
>004FA32E    jmp         @HandleAnyException
 004FA333    call        @DoneExcept
 004FA338    xor         eax,eax
 004FA33A    pop         edx
 004FA33B    pop         ecx
 004FA33C    pop         ecx
 004FA33D    mov         dword ptr fs:[eax],edx
 004FA340    push        4FA35A
 004FA345    lea         eax,[ebp-10]
 004FA348    mov         edx,4
 004FA34D    call        @UStrArrayClr
 004FA352    ret
>004FA353    jmp         @HandleFinally
>004FA358    jmp         004FA345
 004FA35A    pop         edi
 004FA35B    pop         esi
 004FA35C    pop         ebx
 004FA35D    mov         esp,ebp
 004FA35F    pop         ebp
 004FA360    ret
*}
end;

//004FA398
{*procedure sub_004FA398(?:?; ?:UnicodeString);
begin
 004FA398    push        ebp
 004FA399    mov         ebp,esp
 004FA39B    add         esp,0FFFFFFD8
 004FA39E    push        ebx
 004FA39F    push        esi
 004FA3A0    push        edi
 004FA3A1    xor         ecx,ecx
 004FA3A3    mov         dword ptr [ebp-24],ecx
 004FA3A6    mov         dword ptr [ebp-28],ecx
 004FA3A9    mov         dword ptr [ebp-20],ecx
 004FA3AC    mov         dword ptr [ebp-1C],ecx
 004FA3AF    mov         dword ptr [ebp-8],ecx
 004FA3B2    mov         dword ptr [ebp-4],edx
 004FA3B5    mov         dword ptr [ebp-0C],eax
 004FA3B8    mov         eax,dword ptr [ebp-4]
 004FA3BB    call        @UStrAddRef
 004FA3C0    xor         eax,eax
 004FA3C2    push        ebp
 004FA3C3    push        4FA549
 004FA3C8    push        dword ptr fs:[eax]
 004FA3CB    mov         dword ptr fs:[eax],esp
 004FA3CE    cmp         byte ptr ds:[7868DC],0;gvar_007868DC
>004FA3D5    jne         004FA484
 004FA3DB    xor         eax,eax
 004FA3DD    push        ebp
 004FA3DE    push        4FA46C
 004FA3E3    push        dword ptr fs:[eax]
 004FA3E6    mov         dword ptr fs:[eax],esp
 004FA3E9    lea         edx,[ebp-1C]
 004FA3EC    xor         eax,eax
 004FA3EE    call        ParamStr
 004FA3F3    mov         eax,dword ptr [ebp-1C]
 004FA3F6    lea         edx,[ebp-8]
 004FA3F9    call        ExtractFilePath
 004FA3FE    mov         ebx,dword ptr [ebp-8]
 004FA401    test        ebx,ebx
>004FA403    je          004FA40A
 004FA405    sub         ebx,4
 004FA408    mov         ebx,dword ptr [ebx]
 004FA40A    lea         eax,[ebp-20]
 004FA40D    push        eax
 004FA40E    mov         ecx,1
 004FA413    mov         edx,ebx
 004FA415    mov         eax,dword ptr [ebp-8]
 004FA418    call        @UStrCopy
 004FA41D    mov         eax,dword ptr [ebp-20]
 004FA420    mov         edx,4FA564;'\'
 004FA425    call        @UStrEqual
>004FA42A    je          004FA439
 004FA42C    lea         eax,[ebp-8]
 004FA42F    mov         edx,4FA564;'\'
 004FA434    call        @UStrCat
 004FA439    lea         eax,[ebp-8]
 004FA43C    mov         edx,4FA574;'pielog.txt'
 004FA441    call        @UStrCat
 004FA446    mov         edx,dword ptr [ebp-8]
 004FA449    mov         eax,79334C;gvar_0079334C:TFileRec
 004FA44E    call        @Assign
 004FA453    mov         eax,79334C;gvar_0079334C:TFileRec
 004FA458    call        @RewritText
 004FA45D    call        @_IOTest
 004FA462    xor         eax,eax
 004FA464    pop         edx
 004FA465    pop         ecx
 004FA466    pop         ecx
 004FA467    mov         dword ptr fs:[eax],edx
>004FA46A    jmp         004FA47D
>004FA46C    jmp         @HandleAnyException
 004FA471    mov         byte ptr ds:[7868DE],1;gvar_007868DE
 004FA478    call        @DoneExcept
 004FA47D    mov         byte ptr ds:[7868DC],1;gvar_007868DC
 004FA484    cmp         byte ptr ds:[7868DE],0;gvar_007868DE
>004FA48B    jne         004FA521
 004FA491    call        Now
 004FA496    fstp        qword ptr [ebp-18]
 004FA499    wait
 004FA49A    push        dword ptr [ebp-14]
 004FA49D    push        dword ptr [ebp-18]
 004FA4A0    mov         ecx,dword ptr ds:[78D6A8];^gvar_00790CDC:TFormatSettings
 004FA4A6    lea         eax,[ebp-8]
 004FA4A9    mov         edx,4FA598;'dd-MMM-yyyy hh:mm:ss'
 004FA4AE    call        DateTimeToString
 004FA4B3    xor         eax,eax
 004FA4B5    push        ebp
 004FA4B6    push        4FA517
 004FA4BB    push        dword ptr fs:[eax]
 004FA4BE    mov         dword ptr fs:[eax],esp
 004FA4C1    push        4FA5D0;'('
 004FA4C6    lea         edx,[ebp-28]
 004FA4C9    mov         eax,dword ptr [ebp-0C]
 004FA4CC    call        IntToStr
 004FA4D1    push        dword ptr [ebp-28]
 004FA4D4    push        4FA5E0;', '
 004FA4D9    push        dword ptr [ebp-8]
 004FA4DC    push        4FA5F4;') '
 004FA4E1    push        dword ptr [ebp-4]
 004FA4E4    lea         eax,[ebp-24]
 004FA4E7    mov         edx,6
 004FA4EC    call        @UStrCatN
 004FA4F1    mov         edx,dword ptr [ebp-24]
 004FA4F4    mov         eax,79334C;gvar_0079334C:TFileRec
 004FA4F9    call        @Write0Bool
 004FA4FE    call        @WriteLn
 004FA503    mov         eax,79334C;gvar_0079334C:TFileRec
 004FA508    call        Flush
 004FA50D    xor         eax,eax
 004FA50F    pop         edx
 004FA510    pop         ecx
 004FA511    pop         ecx
 004FA512    mov         dword ptr fs:[eax],edx
>004FA515    jmp         004FA521
>004FA517    jmp         @HandleAnyException
 004FA51C    call        @DoneExcept
 004FA521    xor         eax,eax
 004FA523    pop         edx
 004FA524    pop         ecx
 004FA525    pop         ecx
 004FA526    mov         dword ptr fs:[eax],edx
 004FA529    push        4FA550
 004FA52E    lea         eax,[ebp-28]
 004FA531    mov         edx,4
 004FA536    call        @UStrArrayClr
 004FA53B    lea         eax,[ebp-8]
 004FA53E    mov         edx,2
 004FA543    call        @UStrArrayClr
 004FA548    ret
>004FA549    jmp         @HandleFinally
>004FA54E    jmp         004FA52E
 004FA550    pop         edi
 004FA551    pop         esi
 004FA552    pop         ebx
 004FA553    mov         esp,ebp
 004FA555    pop         ebp
 004FA556    ret
end;*}

//004FA5FC
procedure sub_004FA5FC(?:UnicodeString);
begin
{*
 004FA5FC    push        ebp
 004FA5FD    mov         ebp,esp
 004FA5FF    push        ecx
 004FA600    mov         dword ptr [ebp-4],eax
 004FA603    mov         eax,dword ptr [ebp-4]
 004FA606    call        @UStrAddRef
 004FA60B    xor         eax,eax
 004FA60D    push        ebp
 004FA60E    push        4FA639
 004FA613    push        dword ptr fs:[eax]
 004FA616    mov         dword ptr fs:[eax],esp
 004FA619    mov         edx,dword ptr [ebp-4]
 004FA61C    xor         eax,eax
 004FA61E    call        004FA398
 004FA623    xor         eax,eax
 004FA625    pop         edx
 004FA626    pop         ecx
 004FA627    pop         ecx
 004FA628    mov         dword ptr fs:[eax],edx
 004FA62B    push        4FA640
 004FA630    lea         eax,[ebp-4]
 004FA633    call        @UStrClr
 004FA638    ret
>004FA639    jmp         @HandleFinally
>004FA63E    jmp         004FA630
 004FA640    pop         ecx
 004FA641    pop         ebp
 004FA642    ret
*}
end;

//004FA644
procedure sub_004FA644(?:Exception);
begin
{*
 004FA644    push        ebp
 004FA645    mov         ebp,esp
 004FA647    push        0
 004FA649    push        0
 004FA64B    push        ebx
 004FA64C    mov         ebx,eax
 004FA64E    xor         eax,eax
 004FA650    push        ebp
 004FA651    push        4FA6AB
 004FA656    push        dword ptr fs:[eax]
 004FA659    mov         dword ptr fs:[eax],esp
 004FA65C    push        4FA6C4;'Exception: '
 004FA661    lea         edx,[ebp-8]
 004FA664    mov         eax,dword ptr [ebx]
 004FA666    call        TObject.ClassName
 004FA66B    push        dword ptr [ebp-8]
 004FA66E    push        4FA6E8;' '
 004FA673    push        dword ptr [ebx+4]
 004FA676    lea         eax,[ebp-4]
 004FA679    mov         edx,4
 004FA67E    call        @UStrCatN
 004FA683    mov         edx,dword ptr [ebp-4]
 004FA686    mov         eax,1
 004FA68B    call        004FA398
 004FA690    xor         eax,eax
 004FA692    pop         edx
 004FA693    pop         ecx
 004FA694    pop         ecx
 004FA695    mov         dword ptr fs:[eax],edx
 004FA698    push        4FA6B2
 004FA69D    lea         eax,[ebp-8]
 004FA6A0    mov         edx,2
 004FA6A5    call        @UStrArrayClr
 004FA6AA    ret
>004FA6AB    jmp         @HandleFinally
>004FA6B0    jmp         004FA69D
 004FA6B2    pop         ebx
 004FA6B3    pop         ecx
 004FA6B4    pop         ecx
 004FA6B5    pop         ebp
 004FA6B6    ret
*}
end;

//004FA6EC
procedure sub_004FA6EC(?:Exception; ?:UnicodeString);
begin
{*
 004FA6EC    push        ebp
 004FA6ED    mov         ebp,esp
 004FA6EF    push        0
 004FA6F1    push        0
 004FA6F3    push        0
 004FA6F5    push        ebx
 004FA6F6    mov         dword ptr [ebp-4],edx
 004FA6F9    mov         ebx,eax
 004FA6FB    mov         eax,dword ptr [ebp-4]
 004FA6FE    call        @UStrAddRef
 004FA703    xor         eax,eax
 004FA705    push        ebp
 004FA706    push        4FA768
 004FA70B    push        dword ptr fs:[eax]
 004FA70E    mov         dword ptr fs:[eax],esp
 004FA711    push        4FA780;'Exception in '
 004FA716    push        dword ptr [ebp-4]
 004FA719    push        4FA7A8;': '
 004FA71E    lea         edx,[ebp-0C]
 004FA721    mov         eax,dword ptr [ebx]
 004FA723    call        TObject.ClassName
 004FA728    push        dword ptr [ebp-0C]
 004FA72B    push        4FA7BC;' '
 004FA730    push        dword ptr [ebx+4]
 004FA733    lea         eax,[ebp-8]
 004FA736    mov         edx,6
 004FA73B    call        @UStrCatN
 004FA740    mov         edx,dword ptr [ebp-8]
 004FA743    mov         eax,1
 004FA748    call        004FA398
 004FA74D    xor         eax,eax
 004FA74F    pop         edx
 004FA750    pop         ecx
 004FA751    pop         ecx
 004FA752    mov         dword ptr fs:[eax],edx
 004FA755    push        4FA76F
 004FA75A    lea         eax,[ebp-0C]
 004FA75D    mov         edx,3
 004FA762    call        @UStrArrayClr
 004FA767    ret
>004FA768    jmp         @HandleFinally
>004FA76D    jmp         004FA75A
 004FA76F    pop         ebx
 004FA770    mov         esp,ebp
 004FA772    pop         ebp
 004FA773    ret
*}
end;

//004FA7C0
procedure sub_004FA7C0;
begin
{*
 004FA7C0    mov         eax,4FA800;'Closing log file'
 004FA7C5    call        004FA5FC
 004FA7CA    mov         eax,79334C;gvar_0079334C:TFileRec
 004FA7CF    call        @Close
 004FA7D4    call        @_IOTest
 004FA7D9    cmp         byte ptr ds:[7868DD],0;gvar_007868DD
>004FA7E0    je          004FA7F1
 004FA7E2    mov         eax,79361C;gvar_0079361C:TFileRec
 004FA7E7    call        @Close
 004FA7EC    call        @_IOTest
 004FA7F1    ret
*}
end;

Initialization
//00780C9C
{*
 00780C9C    sub         dword ptr ds:[793348],1
>00780CA3    jae         00780CC1
 00780CA5    mov         eax,780CD0;'Initializing PieLog'
 00780CAA    call        004FA5FC
 00780CAF    mov         eax,780D04;'Initializing filemode variable'
 00780CB4    call        004FA5FC
 00780CB9    mov         eax,[0078D800];^gvar_0078400C
 00780CBE    mov         byte ptr [eax],40
 00780CC1    ret
*}
Finalization
//004FA824
{*
 004FA824    push        ebp
 004FA825    mov         ebp,esp
 004FA827    push        ebx
 004FA828    push        esi
 004FA829    push        edi
 004FA82A    xor         eax,eax
 004FA82C    push        ebp
 004FA82D    push        4FA89B
 004FA832    push        dword ptr fs:[eax]
 004FA835    mov         dword ptr fs:[eax],esp
 004FA838    inc         dword ptr ds:[793348]
>004FA83E    jne         004FA88D
 004FA840    mov         eax,4FA8B4;'Finalizing PieLog'
 004FA845    call        004FA5FC
 004FA84A    cmp         byte ptr ds:[7868DC],0;gvar_007868DC
>004FA851    je          004FA883
 004FA853    cmp         byte ptr ds:[7868DE],0;gvar_007868DE
>004FA85A    jne         004FA883
 004FA85C    xor         eax,eax
 004FA85E    push        ebp
 004FA85F    push        4FA879
 004FA864    push        dword ptr fs:[eax]
 004FA867    mov         dword ptr fs:[eax],esp
 004FA86A    call        004FA7C0
 004FA86F    xor         eax,eax
 004FA871    pop         edx
 004FA872    pop         ecx
 004FA873    pop         ecx
 004FA874    mov         dword ptr fs:[eax],edx
>004FA877    jmp         004FA883
>004FA879    jmp         @HandleAnyException
 004FA87E    call        @DoneExcept
 004FA883    mov         eax,7868D4
 004FA888    call        @UStrClr
 004FA88D    xor         eax,eax
 004FA88F    pop         edx
 004FA890    pop         ecx
 004FA891    pop         ecx
 004FA892    mov         dword ptr fs:[eax],edx
 004FA895    push        4FA8A2
 004FA89A    ret
>004FA89B    jmp         @HandleFinally
>004FA8A0    jmp         004FA89A
 004FA8A2    pop         edi
 004FA8A3    pop         esi
 004FA8A4    pop         ebx
 004FA8A5    pop         ebp
 004FA8A6    ret
*}
end.