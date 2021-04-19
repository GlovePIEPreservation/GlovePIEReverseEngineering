//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit126;

interface

uses
  SysUtils, Classes;

type
  TOtherWindow = class(TObject)
  published
    procedure SendKeys(s:string);//006CBD20
    procedure SetIndex(Value:Integer);//006CC534
    procedure Backspace(Count:Integer);//006CBC14
    procedure SendChars(s:string);//006CBB94
    function GetCount:Integer;//006CC548
    function IsMicrosoftWord:Boolean;//006CC30C
    function GetIndex:Integer;//006CC520
    procedure SetCount(Value:Integer);//006CC55C
    //procedure PosFromChar(i:Integer; ?:?);//006CAAB4
    procedure Undo;//006CB800
    procedure SendKey(VK:Integer);//006CC570
    procedure Paste;//006CB7EC
    procedure Clear;//006CB7D8
    //procedure SelectionFont(?:?);//006CBAC8
    procedure CharFromPos(x:Integer; y:Integer);//006CABA0
    function CanUndo:Boolean;//006CB814
    //procedure DefaultFont(?:?);//006CB724
    constructor sub_006CB5E8;//006CB5E8
    constructor sub_006CB41C(ClassName:string; WindowName:string);//006CB41C
    constructor sub_006CB200;//006CB200
    constructor sub_006CB2E4;//006CB2E4
    procedure ToForeground;//006CC5C4
    function ParentHandle:HWND;//006CC514
    procedure FindChild(ClassName:string; WindowName:string);//006CB4B0
    procedure FindSister(ClassName:string; WindowName:string);//006CB548
    constructor sub_006CB6BC;//006CB6BC
    function IsDelphi:Boolean;//006CC494
    procedure Click;//006CC5B0
    function IsNetscape:Boolean;//006CC37C
    function IsRichEdit:Boolean;//006CC410
    constructor sub_006CB650;//006CB650
    constructor sub_006CB688;//006CB688
    constructor Create(WindowHandle:HWND);//006CB5C4
    constructor sub_006CB61C;//006CB61C
    procedure SetText(Value:string);//006CBA64
    procedure ScrollLeft;//006CBA14
    //procedure FileName(?:?);//006CCA4C
    //procedure GetTextP(?:?);//006CC0C8
    procedure ScrollDown;//006CBA50
    procedure SetTop(Value:Integer);//006CB92C
    procedure ScrollRight;//006CBA28
    procedure ScrollUp;//006CBA3C
    //procedure AfterDash(?:?);//006CC5D0
    //procedure FontType(?:?);//006CB1B0
    function FontHandle:Cardinal;//006CBAB8
    function CaretX:Integer;//006CABC0
    procedure CaretY;//006CAC44
    //procedure AppName(?:?);//006CC7BC
    //procedure BeforeDash(?:?);//006CC9BC
    //procedure FontName(?:?);//006CBB54
    //procedure GetText(?:?);//006CBE84
    procedure GetEnabled;//006CB874
    procedure SetVisible(Value:Boolean);//006CB844
    procedure Unicode;//006CB888
    procedure SetEnabled(Value:Boolean);//006CB860
    procedure Cut;//006CB7B0
    procedure Copy;//006CB7C4
    procedure GetVisible;//006CB830
    //procedure ClassName(?:?);//006CB6F0
    function GetClientHeight:Integer;//006CB914
    procedure SetHeight(Value:Integer);//006CB9DC
    function GetWidth:Integer;//006CB8C8
    procedure SetLeft(Value:Integer);//006CB968
    procedure SetWidth(Value:Integer);//006CB9A4
    function GetTop:Integer;//006CB8B0
    function GetClientWidth:Integer;//006CB8FC
    function GetHeight:Integer;//006CB8E0
    function GetLeft:Integer;//006CB89C
  public
    ......................................................................................................................................................................................................................Handle:HWND;//f4
  end;
  TWindowValue = class(TExpression)
  published
    procedure FillClone(c:TExpression);//006CD74C
    procedure CreateClone;//006CD73C
    function GetUnits:TUnits;//006CD948
    //procedure GetString(?:?);//006CD814
    procedure GetValue;//006CD964
    function CanSet:Boolean;//006CD738
    function GetDataType:TDataType;//006CD76C
    //procedure ToString(?:?);//006CDCB0
    function SetValue(NewValue:Double):Boolean;//006CDC2C
  public
    WindowNumber:Integer;//f18
    Item:Integer;//f1C
    //procedure ToString(?:?); virtual;//006CDCB0
    procedure GetValue; virtual;//v2C//006CD964
    //procedure GetString(?:?); virtual;//v38//006CD814
    function GetDataType:TDataType; virtual;//v44//006CD76C
    function GetUnits:TUnits; virtual;//v48//006CD948
    function SetValue(NewValue:Double):Boolean; virtual;//v58//006CDC2C
    function CanSet:Boolean; virtual;//v68//006CD738
    procedure CreateClone; virtual;//v80//006CD73C
    procedure FillClone(c:TExpression); virtual;//v84//006CD74C
  end;
    //function sub_006CAA9C(?:Integer):?;//006CAA9C
    //function sub_006CAAA8(?:Integer):?;//006CAAA8
    //procedure sub_006CACC8(?:?; ?:?);//006CACC8
    //function sub_006CC670(?:UnicodeString):?;//006CC670
    procedure sub_006CCF94;//006CCF94
    //function sub_006CD654(?:?):?;//006CD654
    procedure sub_006CDD24;//006CDD24
    procedure sub_006CDD28;//006CDD28
    //function sub_006CDD2C:?;//006CDD2C
    //function sub_006CDD30(?:UnicodeString):?;//006CDD30
    //procedure sub_006CDD80(?:?; ?:?);//006CDD80
    //function sub_006CDD98:?;//006CDD98
    //function sub_006CDE0C(?:?):?;//006CDE0C

implementation

//006CAA9C
{*function sub_006CAA9C(?:Integer):?;
begin
 006CAA9C    push        ecx
 006CAA9D    mov         dword ptr [esp],eax
 006CAAA0    movsx       eax,word ptr [esp+2]
 006CAAA5    pop         edx
 006CAAA6    ret
end;*}

//006CAAA8
{*function sub_006CAAA8(?:Integer):?;
begin
 006CAAA8    push        ecx
 006CAAA9    mov         dword ptr [esp],eax
 006CAAAC    movsx       eax,word ptr [esp]
 006CAAB0    pop         edx
 006CAAB1    ret
end;*}

//006CAAB4
{*procedure TOtherWindow.PosFromChar(i:Integer; ?:?);
begin
 006CAAB4    push        ebp
 006CAAB5    mov         ebp,esp
 006CAAB7    push        0
 006CAAB9    push        0
 006CAABB    push        0
 006CAABD    push        ebx
 006CAABE    push        esi
 006CAABF    push        edi
 006CAAC0    mov         dword ptr [ebp-8],ecx
 006CAAC3    mov         ebx,edx
 006CAAC5    mov         edi,eax
 006CAAC7    xor         eax,eax
 006CAAC9    push        ebp
 006CAACA    push        6CAB7A
 006CAACF    push        dword ptr fs:[eax]
 006CAAD2    mov         dword ptr fs:[eax],esp
 006CAAD5    mov         eax,dword ptr [ebp-8]
 006CAAD8    xor         edx,edx
 006CAADA    mov         dword ptr [eax],edx
 006CAADC    mov         eax,dword ptr [ebp-8]
 006CAADF    xor         edx,edx
 006CAAE1    mov         dword ptr [eax+4],edx
 006CAAE4    lea         edx,[ebp-4]
 006CAAE7    mov         eax,edi
 006CAAE9    call        TOtherWindow.ClassName
 006CAAEE    lea         edx,[ebp-0C]
 006CAAF1    mov         eax,dword ptr [ebp-4]
 006CAAF4    call        UpperCase
 006CAAF9    mov         edx,dword ptr [ebp-0C]
 006CAAFC    mov         eax,6CAB94;'RICH'
 006CAB01    call        Pos
 006CAB06    test        eax,eax
>006CAB08    jle         006CAB1F
 006CAB0A    push        ebx
 006CAB0B    mov         eax,dword ptr [ebp-8]
 006CAB0E    push        eax
 006CAB0F    push        0D6
 006CAB14    mov         eax,dword ptr [edi+4];TOtherWindow.........................................................
 006CAB17    push        eax
 006CAB18    call        user32.SendMessageW
>006CAB1D    jmp         006CAB5C
 006CAB1F    push        0
 006CAB21    push        ebx
 006CAB22    push        0D6
 006CAB27    mov         eax,dword ptr [edi+4];TOtherWindow.........................................................
 006CAB2A    push        eax
 006CAB2B    call        user32.SendMessageW
 006CAB30    mov         esi,eax
 006CAB32    dec         ebx
 006CAB33    cmp         esi,0FFFFFFFF
>006CAB36    jne         006CAB3C
 006CAB38    test        ebx,ebx
>006CAB3A    jge         006CAB1F
 006CAB3C    cmp         esi,0FFFFFFFF
>006CAB3F    jne         006CAB43
 006CAB41    xor         esi,esi
 006CAB43    mov         eax,esi
 006CAB45    call        006CAAA8
 006CAB4A    mov         edx,dword ptr [ebp-8]
 006CAB4D    mov         dword ptr [edx],eax
 006CAB4F    mov         eax,esi
 006CAB51    call        006CAA9C
 006CAB56    mov         edx,dword ptr [ebp-8]
 006CAB59    mov         dword ptr [edx+4],eax
 006CAB5C    xor         eax,eax
 006CAB5E    pop         edx
 006CAB5F    pop         ecx
 006CAB60    pop         ecx
 006CAB61    mov         dword ptr fs:[eax],edx
 006CAB64    push        6CAB81
 006CAB69    lea         eax,[ebp-0C]
 006CAB6C    call        @UStrClr
 006CAB71    lea         eax,[ebp-4]
 006CAB74    call        @UStrClr
 006CAB79    ret
>006CAB7A    jmp         @HandleFinally
>006CAB7F    jmp         006CAB69
 006CAB81    pop         edi
 006CAB82    pop         esi
 006CAB83    pop         ebx
 006CAB84    mov         esp,ebp
 006CAB86    pop         ebp
 006CAB87    ret
end;*}

//006CABA0
procedure TOtherWindow.CharFromPos(x:Integer; y:Integer);
begin
{*
 006CABA0    add         esp,0FFFFFFF8
 006CABA3    mov         dword ptr [esp],edx
 006CABA6    mov         dword ptr [esp+4],ecx
 006CABAA    mov         edx,esp
 006CABAC    push        edx
 006CABAD    push        0
 006CABAF    push        0D7
 006CABB4    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CABB7    push        eax
 006CABB8    call        user32.SendMessageW
 006CABBD    pop         ecx
 006CABBE    pop         edx
 006CABBF    ret
*}
end;

//006CABC0
function TOtherWindow.CaretX:Integer;
begin
{*
 006CABC0    push        ebx
 006CABC1    push        esi
 006CABC2    add         esp,0FFFFFFF0
 006CABC5    mov         ebx,eax
 006CABC7    lea         eax,[esp+4]
 006CABCB    push        eax
 006CABCC    lea         eax,[esp+4]
 006CABD0    push        eax
 006CABD1    push        0B0
 006CABD6    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CABD9    push        eax
 006CABDA    call        user32.SendMessageW
 006CABDF    mov         esi,eax
 006CABE1    and         esi,0FFFF
 006CABE7    lea         ecx,[esp+8]
 006CABEB    mov         edx,esi
 006CABED    mov         eax,ebx
 006CABEF    call        TOtherWindow.PosFromChar
 006CABF4    cmp         dword ptr [esp+8],0
>006CABF9    jne         006CAC2A
 006CABFB    cmp         dword ptr [esp+0C],0
>006CAC00    jne         006CAC2A
 006CAC02    mov         eax,ebx
 006CAC04    call        TOtherWindow.IsMicrosoftWord
 006CAC09    test        al,al
>006CAC0B    je          006CAC2A
 006CAC0D    mov         eax,ebx
 006CAC0F    call        TOtherWindow.GetLeft
 006CAC14    mov         esi,eax
 006CAC16    mov         eax,ebx
 006CAC18    call        TOtherWindow.GetWidth
 006CAC1D    sar         eax,1
>006CAC1F    jns         006CAC24
 006CAC21    adc         eax,0
 006CAC24    add         esi,eax
 006CAC26    mov         eax,esi
>006CAC28    jmp         006CAC3C
 006CAC2A    lea         eax,[esp+8]
 006CAC2E    push        eax
 006CAC2F    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CAC32    push        eax
 006CAC33    call        user32.ClientToScreen
 006CAC38    mov         eax,dword ptr [esp+8]
 006CAC3C    add         esp,10
 006CAC3F    pop         esi
 006CAC40    pop         ebx
 006CAC41    ret
*}
end;

//006CAC44
procedure TOtherWindow.CaretY;
begin
{*
 006CAC44    push        ebx
 006CAC45    push        esi
 006CAC46    add         esp,0FFFFFFF0
 006CAC49    mov         ebx,eax
 006CAC4B    lea         eax,[esp+4]
 006CAC4F    push        eax
 006CAC50    lea         eax,[esp+4]
 006CAC54    push        eax
 006CAC55    push        0B0
 006CAC5A    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CAC5D    push        eax
 006CAC5E    call        user32.SendMessageW
 006CAC63    mov         esi,eax
 006CAC65    and         esi,0FFFF
 006CAC6B    lea         ecx,[esp+8]
 006CAC6F    mov         edx,esi
 006CAC71    mov         eax,ebx
 006CAC73    call        TOtherWindow.PosFromChar
 006CAC78    cmp         dword ptr [esp+8],0
>006CAC7D    jne         006CACAE
 006CAC7F    cmp         dword ptr [esp+0C],0
>006CAC84    jne         006CACAE
 006CAC86    mov         eax,ebx
 006CAC88    call        TOtherWindow.IsMicrosoftWord
 006CAC8D    test        al,al
>006CAC8F    je          006CACAE
 006CAC91    mov         eax,ebx
 006CAC93    call        TOtherWindow.GetTop
 006CAC98    mov         esi,eax
 006CAC9A    mov         eax,ebx
 006CAC9C    call        TOtherWindow.GetHeight
 006CACA1    sar         eax,1
>006CACA3    jns         006CACA8
 006CACA5    adc         eax,0
 006CACA8    add         esi,eax
 006CACAA    mov         eax,esi
>006CACAC    jmp         006CACC0
 006CACAE    lea         eax,[esp+8]
 006CACB2    push        eax
 006CACB3    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CACB6    push        eax
 006CACB7    call        user32.ClientToScreen
 006CACBC    mov         eax,dword ptr [esp+0C]
 006CACC0    add         esp,10
 006CACC3    pop         esi
 006CACC4    pop         ebx
 006CACC5    ret
*}
end;

//006CACC8
{*procedure sub_006CACC8(?:?; ?:?);
begin
 006CACC8    push        ebp
 006CACC9    mov         ebp,esp
 006CACCB    mov         ecx,6
 006CACD0    push        0
 006CACD2    push        0
 006CACD4    dec         ecx
>006CACD5    jne         006CACD0
 006CACD7    push        ebx
 006CACD8    push        esi
 006CACD9    mov         ebx,edx
 006CACDB    mov         dword ptr [ebp-4],eax
 006CACDE    mov         eax,dword ptr [ebp-4]
 006CACE1    call        @UStrAddRef
 006CACE6    xor         eax,eax
 006CACE8    push        ebp
 006CACE9    push        6CAF63
 006CACEE    push        dword ptr fs:[eax]
 006CACF1    mov         dword ptr fs:[eax],esp
 006CACF4    cmp         dword ptr [ebp-4],0
>006CACF8    jne         006CAD06
 006CACFA    mov         eax,ebx
 006CACFC    call        @UStrClr
>006CAD01    jmp         006CAF48
 006CAD06    lea         edx,[ebp-8]
 006CAD09    mov         eax,dword ptr [ebp-4]
 006CAD0C    call        UpperCase
 006CAD11    mov         eax,dword ptr [ebp-8]
 006CAD14    mov         edx,6CAF7C;'VIETNAMESE'
 006CAD19    call        @UStrEqual
>006CAD1E    je          006CAD84
 006CAD20    lea         edx,[ebp-0C]
 006CAD23    mov         eax,dword ptr [ebp-4]
 006CAD26    call        UpperCase
 006CAD2B    mov         eax,dword ptr [ebp-0C]
 006CAD2E    mov         edx,6CAFA0;'VIETNAMESE CAPITAL'
 006CAD33    call        @UStrEqual
>006CAD38    je          006CAD84
 006CAD3A    lea         eax,[ebp-10]
 006CAD3D    push        eax
 006CAD3E    mov         ecx,3
 006CAD43    mov         edx,1
 006CAD48    mov         eax,dword ptr [ebp-4]
 006CAD4B    call        @UStrCopy
 006CAD50    mov         eax,dword ptr [ebp-10]
 006CAD53    mov         edx,6CAFD4;'VI '
 006CAD58    call        @UStrEqual
>006CAD5D    je          006CAD84
 006CAD5F    lea         eax,[ebp-14]
 006CAD62    push        eax
 006CAD63    mov         ecx,3
 006CAD68    mov         edx,1
 006CAD6D    mov         eax,dword ptr [ebp-4]
 006CAD70    call        @UStrCopy
 006CAD75    mov         eax,dword ptr [ebp-14]
 006CAD78    mov         edx,6CAFE8;'VN-'
 006CAD7D    call        @UStrEqual
>006CAD82    jne         006CAD88
 006CAD84    mov         al,1
>006CAD86    jmp         006CADBA
 006CAD88    mov         esi,dword ptr [ebp-4]
 006CAD8B    test        esi,esi
>006CAD8D    je          006CAD94
 006CAD8F    sub         esi,4
 006CAD92    mov         esi,dword ptr [esi]
 006CAD94    lea         eax,[ebp-18]
 006CAD97    push        eax
 006CAD98    mov         edx,esi
 006CAD9A    sub         edx,2
 006CAD9D    mov         ecx,3
 006CADA2    mov         eax,dword ptr [ebp-4]
 006CADA5    call        @UStrCopy
 006CADAA    mov         eax,dword ptr [ebp-18]
 006CADAD    mov         edx,6CAFFC;'1.1'
 006CADB2    call        @UStrEqual
 006CADB7    sete        al
 006CADBA    test        al,al
>006CADBC    je          006CADC2
 006CADBE    mov         al,1
>006CADC0    jmp         006CADDF
 006CADC2    lea         edx,[ebp-1C]
 006CADC5    mov         eax,dword ptr [ebp-4]
 006CADC8    call        UpperCase
 006CADCD    mov         edx,dword ptr [ebp-1C]
 006CADD0    mov         eax,6CB010;'VISCII'
 006CADD5    call        Pos
 006CADDA    test        eax,eax
 006CADDC    setg        al
 006CADDF    test        al,al
>006CADE1    je          006CADF4
 006CADE3    mov         eax,ebx
 006CADE5    mov         edx,6CB010;'VISCII'
 006CADEA    call        @UStrAsg
>006CADEF    jmp         006CAF48
 006CADF4    lea         eax,[ebp-20]
 006CADF7    push        eax
 006CADF8    mov         ecx,4
 006CADFD    mov         edx,1
 006CAE02    mov         eax,dword ptr [ebp-4]
 006CAE05    call        @UStrCopy
 006CAE0A    mov         eax,dword ptr [ebp-20]
 006CAE0D    mov         edx,6CB02C;'VNI '
 006CAE12    call        @UStrEqual
>006CAE17    je          006CAE3E
 006CAE19    lea         eax,[ebp-24]
 006CAE1C    push        eax
 006CAE1D    mov         ecx,4
 006CAE22    mov         edx,1
 006CAE27    mov         eax,dword ptr [ebp-4]
 006CAE2A    call        @UStrCopy
 006CAE2F    mov         eax,dword ptr [ebp-24]
 006CAE32    mov         edx,6CB044;'VNI-'
 006CAE37    call        @UStrEqual
>006CAE3C    jne         006CAE4F
 006CAE3E    mov         eax,ebx
 006CAE40    mov         edx,6CB05C;'VNI'
 006CAE45    call        @UStrAsg
>006CAE4A    jmp         006CAF48
 006CAE4F    lea         eax,[ebp-28]
 006CAE52    push        eax
 006CAE53    mov         ecx,3
 006CAE58    mov         edx,1
 006CAE5D    mov         eax,dword ptr [ebp-4]
 006CAE60    call        @UStrCopy
 006CAE65    mov         eax,dword ptr [ebp-28]
 006CAE68    mov         edx,6CB070;'VPS'
 006CAE6D    call        @UStrEqual
>006CAE72    je          006CAE9F
 006CAE74    mov         eax,dword ptr [ebp-4]
 006CAE77    mov         edx,6CB084;'alittlev'
 006CAE7C    call        @UStrEqual
>006CAE81    je          006CAE9F
 006CAE83    lea         edx,[ebp-2C]
 006CAE86    mov         eax,dword ptr [ebp-4]
 006CAE89    call        UpperCase
 006CAE8E    mov         edx,dword ptr [ebp-2C]
 006CAE91    mov         eax,6CB0A4;'VNCII'
 006CAE96    call        Pos
 006CAE9B    test        eax,eax
>006CAE9D    jle         006CAEB0
 006CAE9F    mov         eax,ebx
 006CAEA1    mov         edx,6CB070;'VPS'
 006CAEA6    call        @UStrAsg
>006CAEAB    jmp         006CAF48
 006CAEB0    lea         eax,[ebp-30]
 006CAEB3    push        eax
 006CAEB4    mov         ecx,3
 006CAEB9    mov         edx,1
 006CAEBE    mov         eax,dword ptr [ebp-4]
 006CAEC1    call        @UStrCopy
 006CAEC6    mov         eax,dword ptr [ebp-30]
 006CAEC9    mov         edx,6CB0BC;'.Vn'
 006CAECE    call        @UStrEqual
>006CAED3    jne         006CAEE3
 006CAED5    mov         eax,ebx
 006CAED7    mov         edx,6CB0D0;'TCVN'
 006CAEDC    call        @UStrAsg
>006CAEE1    jmp         006CAF48
 006CAEE3    mov         eax,dword ptr [ebp-4]
 006CAEE6    mov         edx,6CB0E8;'Tahoma'
 006CAEEB    call        @UStrEqual
>006CAEF0    je          006CAF2E
 006CAEF2    mov         eax,dword ptr [ebp-4]
 006CAEF5    mov         edx,6CB104;'Verdana'
 006CAEFA    call        @UStrEqual
>006CAEFF    je          006CAF2E
 006CAF01    mov         eax,dword ptr [ebp-4]
 006CAF04    mov         edx,6CB120;'Times New Roman'
 006CAF09    call        @UStrEqual
>006CAF0E    je          006CAF2E
 006CAF10    mov         eax,dword ptr [ebp-4]
 006CAF13    mov         edx,6CB14C;'Arial'
 006CAF18    call        @UStrEqual
>006CAF1D    je          006CAF2E
 006CAF1F    mov         eax,dword ptr [ebp-4]
 006CAF22    mov         edx,6CB164;'Courier New'
 006CAF27    call        @UStrEqual
>006CAF2C    jne         006CAF3C
 006CAF2E    mov         eax,ebx
 006CAF30    mov         edx,6CB188;'Unicode'
 006CAF35    call        @UStrAsg
>006CAF3A    jmp         006CAF48
 006CAF3C    mov         eax,ebx
 006CAF3E    mov         edx,6CB1A4;'ANSI'
 006CAF43    call        @UStrAsg
 006CAF48    xor         eax,eax
 006CAF4A    pop         edx
 006CAF4B    pop         ecx
 006CAF4C    pop         ecx
 006CAF4D    mov         dword ptr fs:[eax],edx
 006CAF50    push        6CAF6A
 006CAF55    lea         eax,[ebp-30]
 006CAF58    mov         edx,0C
 006CAF5D    call        @UStrArrayClr
 006CAF62    ret
>006CAF63    jmp         @HandleFinally
>006CAF68    jmp         006CAF55
 006CAF6A    pop         esi
 006CAF6B    pop         ebx
 006CAF6C    mov         esp,ebp
 006CAF6E    pop         ebp
 006CAF6F    ret
end;*}

//006CB1B0
{*procedure TOtherWindow.FontType(?:?);
begin
 006CB1B0    push        ebp
 006CB1B1    mov         ebp,esp
 006CB1B3    push        0
 006CB1B5    push        ebx
 006CB1B6    push        esi
 006CB1B7    mov         esi,edx
 006CB1B9    mov         ebx,eax
 006CB1BB    xor         eax,eax
 006CB1BD    push        ebp
 006CB1BE    push        6CB1F3
 006CB1C3    push        dword ptr fs:[eax]
 006CB1C6    mov         dword ptr fs:[eax],esp
 006CB1C9    lea         edx,[ebp-4]
 006CB1CC    mov         eax,ebx
 006CB1CE    call        TOtherWindow.FontName
 006CB1D3    mov         eax,dword ptr [ebp-4]
 006CB1D6    mov         edx,esi
 006CB1D8    call        006CACC8
 006CB1DD    xor         eax,eax
 006CB1DF    pop         edx
 006CB1E0    pop         ecx
 006CB1E1    pop         ecx
 006CB1E2    mov         dword ptr fs:[eax],edx
 006CB1E5    push        6CB1FA
 006CB1EA    lea         eax,[ebp-4]
 006CB1ED    call        @UStrClr
 006CB1F2    ret
>006CB1F3    jmp         @HandleFinally
>006CB1F8    jmp         006CB1EA
 006CB1FA    pop         esi
 006CB1FB    pop         ebx
 006CB1FC    pop         ecx
 006CB1FD    pop         ebp
 006CB1FE    ret
end;*}

//006CB200
constructor sub_006CB200;
begin
{*
 006CB200    push        ebp
 006CB201    mov         ebp,esp
 006CB203    add         esp,0FFFFFFF0
 006CB206    push        ebx
 006CB207    push        esi
 006CB208    push        edi
 006CB209    test        dl,dl
>006CB20B    je          006CB215
 006CB20D    add         esp,0FFFFFFF0
 006CB210    call        @ClassCreate
 006CB215    mov         byte ptr [ebp-1],dl
 006CB218    mov         ebx,eax
 006CB21A    call        user32.GetActiveWindow
 006CB21F    lea         edx,[ebx+4];TOtherWindow...................................................................
 006CB222    push        edx
 006CB223    push        6CA8C8
 006CB228    push        eax
 006CB229    call        user32.EnumChildWindows
 006CB22E    mov         edi,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB231    test        edi,edi
>006CB233    je          006CB2C3
 006CB239    push        5
 006CB23B    push        edi
 006CB23C    call        user32.GetWindow
 006CB241    mov         esi,eax
 006CB243    mov         dword ptr [ebx+4],esi;TOtherWindow.........................................................
 006CB246    test        esi,esi
>006CB248    je          006CB2C3
 006CB24A    mov         dword ptr [ebp-8],esi
 006CB24D    mov         eax,ebx
 006CB24F    call        TOtherWindow.GetLeft
 006CB254    mov         edi,eax
 006CB256    push        2
 006CB258    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB25B    push        eax
 006CB25C    call        user32.GetWindow
 006CB261    mov         esi,eax
 006CB263    mov         dword ptr [ebx+4],esi;TOtherWindow.........................................................
 006CB266    mov         dword ptr [ebp-0C],esi
 006CB269    mov         eax,ebx
 006CB26B    call        TOtherWindow.GetLeft
 006CB270    mov         esi,eax
 006CB272    push        2
 006CB274    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB277    push        eax
 006CB278    call        user32.GetWindow
 006CB27D    mov         dword ptr [ebx+4],eax;TOtherWindow.........................................................
 006CB280    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB283    mov         dword ptr [ebp-10],eax
 006CB286    mov         eax,ebx
 006CB288    call        TOtherWindow.GetLeft
 006CB28D    cmp         esi,edi
>006CB28F    jle         006CB295
 006CB291    cmp         eax,esi
>006CB293    jg          006CB29D
 006CB295    cmp         esi,eax
>006CB297    jle         006CB2A5
 006CB299    cmp         edi,esi
>006CB29B    jle         006CB2A5
 006CB29D    mov         eax,dword ptr [ebp-0C]
 006CB2A0    mov         dword ptr [ebx+4],eax;TOtherWindow.........................................................
>006CB2A3    jmp         006CB2C3
 006CB2A5    cmp         edi,eax
>006CB2A7    jle         006CB2AD
 006CB2A9    cmp         esi,edi
>006CB2AB    jg          006CB2B5
 006CB2AD    cmp         edi,esi
>006CB2AF    jle         006CB2BD
 006CB2B1    cmp         eax,edi
>006CB2B3    jle         006CB2BD
 006CB2B5    mov         eax,dword ptr [ebp-8]
 006CB2B8    mov         dword ptr [ebx+4],eax;TOtherWindow.........................................................
>006CB2BB    jmp         006CB2C3
 006CB2BD    mov         eax,dword ptr [ebp-10]
 006CB2C0    mov         dword ptr [ebx+4],eax;TOtherWindow.........................................................
 006CB2C3    mov         eax,ebx
 006CB2C5    cmp         byte ptr [ebp-1],0
>006CB2C9    je          006CB2DA
 006CB2CB    call        @AfterConstruction
 006CB2D0    pop         dword ptr fs:[0]
 006CB2D7    add         esp,0C
 006CB2DA    mov         eax,ebx
 006CB2DC    pop         edi
 006CB2DD    pop         esi
 006CB2DE    pop         ebx
 006CB2DF    mov         esp,ebp
 006CB2E1    pop         ebp
 006CB2E2    ret
*}
end;

//006CB2E4
constructor sub_006CB2E4;
begin
{*
 006CB2E4    push        ebp
 006CB2E5    mov         ebp,esp
 006CB2E7    add         esp,0FFFFFFE4
 006CB2EA    push        ebx
 006CB2EB    push        esi
 006CB2EC    push        edi
 006CB2ED    test        dl,dl
>006CB2EF    je          006CB2F9
 006CB2F1    add         esp,0FFFFFFF0
 006CB2F4    call        @ClassCreate
 006CB2F9    mov         byte ptr [ebp-1],dl
 006CB2FC    mov         ebx,eax
 006CB2FE    call        user32.GetActiveWindow
 006CB303    lea         edx,[ebx+4];TOtherWindow...................................................................
 006CB306    push        edx
 006CB307    push        6CA9A8
 006CB30C    push        eax
 006CB30D    call        user32.EnumChildWindows
 006CB312    cmp         dword ptr [ebx+4],0;TOtherWindow...........................................................
>006CB316    je          006CB3FC
 006CB31C    mov         eax,ebx
 006CB31E    call        TOtherWindow.GetLeft
 006CB323    mov         esi,eax
 006CB325    push        5
 006CB327    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB32A    push        eax
 006CB32B    call        user32.GetWindow
 006CB330    mov         edi,eax
 006CB332    mov         dword ptr [ebx+4],edi;TOtherWindow.........................................................
 006CB335    test        edi,edi
>006CB337    je          006CB3FC
 006CB33D    push        2
 006CB33F    push        edi
 006CB340    call        user32.GetWindow
 006CB345    mov         dword ptr [ebx+4],eax;TOtherWindow.........................................................
 006CB348    cmp         dword ptr [ebx+4],0;TOtherWindow...........................................................
>006CB34C    je          006CB3FC
 006CB352    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB355    mov         dword ptr [ebp-8],eax
 006CB358    mov         eax,ebx
 006CB35A    call        TOtherWindow.GetLeft
 006CB35F    mov         edi,eax
 006CB361    sub         edi,esi
 006CB363    push        2
 006CB365    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB368    push        eax
 006CB369    call        user32.GetWindow
 006CB36E    mov         dword ptr [ebx+4],eax;TOtherWindow.........................................................
 006CB371    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB374    mov         dword ptr [ebp-0C],eax
 006CB377    mov         eax,ebx
 006CB379    call        TOtherWindow.GetLeft
 006CB37E    sub         eax,esi
 006CB380    mov         dword ptr [ebp-18],eax
 006CB383    push        2
 006CB385    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB388    push        eax
 006CB389    call        user32.GetWindow
 006CB38E    mov         dword ptr [ebx+4],eax;TOtherWindow.........................................................
 006CB391    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB394    mov         dword ptr [ebp-10],eax
 006CB397    mov         eax,ebx
 006CB399    call        TOtherWindow.GetLeft
 006CB39E    sub         eax,esi
 006CB3A0    mov         dword ptr [ebp-1C],eax
 006CB3A3    push        2
 006CB3A5    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB3A8    push        eax
 006CB3A9    call        user32.GetWindow
 006CB3AE    mov         dword ptr [ebx+4],eax;TOtherWindow.........................................................
 006CB3B1    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB3B4    mov         dword ptr [ebp-14],eax
 006CB3B7    mov         eax,ebx
 006CB3B9    call        TOtherWindow.GetLeft
 006CB3BE    sub         eax,esi
 006CB3C0    cmp         edi,5F
>006CB3C3    jne         006CB3CD
 006CB3C5    mov         eax,dword ptr [ebp-8]
 006CB3C8    mov         dword ptr [ebx+4],eax;TOtherWindow.........................................................
>006CB3CB    jmp         006CB3FC
 006CB3CD    cmp         dword ptr [ebp-18],5F
>006CB3D1    jne         006CB3DB
 006CB3D3    mov         eax,dword ptr [ebp-0C]
 006CB3D6    mov         dword ptr [ebx+4],eax;TOtherWindow.........................................................
>006CB3D9    jmp         006CB3FC
 006CB3DB    cmp         dword ptr [ebp-1C],5F
>006CB3DF    jne         006CB3E9
 006CB3E1    mov         eax,dword ptr [ebp-10]
 006CB3E4    mov         dword ptr [ebx+4],eax;TOtherWindow.........................................................
>006CB3E7    jmp         006CB3FC
 006CB3E9    cmp         eax,5F
>006CB3EC    jne         006CB3F6
 006CB3EE    mov         eax,dword ptr [ebp-14]
 006CB3F1    mov         dword ptr [ebx+4],eax;TOtherWindow.........................................................
>006CB3F4    jmp         006CB3FC
 006CB3F6    mov         eax,dword ptr [ebp-0C]
 006CB3F9    mov         dword ptr [ebx+4],eax;TOtherWindow.........................................................
 006CB3FC    mov         eax,ebx
 006CB3FE    cmp         byte ptr [ebp-1],0
>006CB402    je          006CB413
 006CB404    call        @AfterConstruction
 006CB409    pop         dword ptr fs:[0]
 006CB410    add         esp,0C
 006CB413    mov         eax,ebx
 006CB415    pop         edi
 006CB416    pop         esi
 006CB417    pop         ebx
 006CB418    mov         esp,ebp
 006CB41A    pop         ebp
 006CB41B    ret
*}
end;

//006CB41C
constructor sub_006CB41C(ClassName:string; WindowName:string);
begin
{*
 006CB41C    push        ebp
 006CB41D    mov         ebp,esp
 006CB41F    push        ecx
 006CB420    push        ebx
 006CB421    push        esi
 006CB422    test        dl,dl
>006CB424    je          006CB42E
 006CB426    add         esp,0FFFFFFF0
 006CB429    call        @ClassCreate
 006CB42E    mov         dword ptr [ebp-4],ecx
 006CB431    mov         ebx,edx
 006CB433    mov         esi,eax
 006CB435    mov         eax,dword ptr [ebp-4]
 006CB438    call        @UStrAddRef
 006CB43D    mov         eax,dword ptr [ebp+8]
 006CB440    call        @UStrAddRef
 006CB445    xor         eax,eax
 006CB447    push        ebp
 006CB448    push        6CB48B
 006CB44D    push        dword ptr fs:[eax]
 006CB450    mov         dword ptr fs:[eax],esp
 006CB453    mov         eax,dword ptr [ebp+8]
 006CB456    call        @UStrToPWChar
 006CB45B    push        eax
 006CB45C    mov         eax,dword ptr [ebp-4]
 006CB45F    call        @UStrToPWChar
 006CB464    push        eax
 006CB465    call        user32.FindWindowW
 006CB46A    mov         dword ptr [esi+4],eax;TOtherWindow.........................................................
 006CB46D    xor         eax,eax
 006CB46F    pop         edx
 006CB470    pop         ecx
 006CB471    pop         ecx
 006CB472    mov         dword ptr fs:[eax],edx
 006CB475    push        6CB492
 006CB47A    lea         eax,[ebp-4]
 006CB47D    call        @UStrClr
 006CB482    lea         eax,[ebp+8]
 006CB485    call        @UStrClr
 006CB48A    ret
>006CB48B    jmp         @HandleFinally
>006CB490    jmp         006CB47A
 006CB492    mov         eax,esi
 006CB494    test        bl,bl
>006CB496    je          006CB4A7
 006CB498    call        @AfterConstruction
 006CB49D    pop         dword ptr fs:[0]
 006CB4A4    add         esp,0C
 006CB4A7    mov         eax,esi
 006CB4A9    pop         esi
 006CB4AA    pop         ebx
 006CB4AB    pop         ecx
 006CB4AC    pop         ebp
 006CB4AD    ret         4
*}
end;

//006CB4B0
procedure TOtherWindow.FindChild(ClassName:string; WindowName:string);
begin
{*
 006CB4B0    push        ebp
 006CB4B1    mov         ebp,esp
 006CB4B3    add         esp,0FFFFFFF8
 006CB4B6    push        ebx
 006CB4B7    mov         dword ptr [ebp-8],ecx
 006CB4BA    mov         dword ptr [ebp-4],edx
 006CB4BD    mov         ebx,eax
 006CB4BF    mov         eax,dword ptr [ebp-4]
 006CB4C2    call        @UStrAddRef
 006CB4C7    mov         eax,dword ptr [ebp-8]
 006CB4CA    call        @UStrAddRef
 006CB4CF    xor         eax,eax
 006CB4D1    push        ebp
 006CB4D2    push        6CB539
 006CB4D7    push        dword ptr fs:[eax]
 006CB4DA    mov         dword ptr fs:[eax],esp
 006CB4DD    cmp         dword ptr [ebp-8],0
>006CB4E1    jne         006CB4FE
 006CB4E3    push        0
 006CB4E5    mov         eax,dword ptr [ebp-4]
 006CB4E8    call        @UStrToPWChar
 006CB4ED    push        eax
 006CB4EE    push        0
 006CB4F0    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB4F3    push        eax
 006CB4F4    call        user32.FindWindowExW
 006CB4F9    mov         dword ptr [ebx+4],eax;TOtherWindow.........................................................
>006CB4FC    jmp         006CB51E
 006CB4FE    mov         eax,dword ptr [ebp-8]
 006CB501    call        @UStrToPWChar
 006CB506    push        eax
 006CB507    mov         eax,dword ptr [ebp-4]
 006CB50A    call        @UStrToPWChar
 006CB50F    push        eax
 006CB510    push        0
 006CB512    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB515    push        eax
 006CB516    call        user32.FindWindowExW
 006CB51B    mov         dword ptr [ebx+4],eax;TOtherWindow.........................................................
 006CB51E    xor         eax,eax
 006CB520    pop         edx
 006CB521    pop         ecx
 006CB522    pop         ecx
 006CB523    mov         dword ptr fs:[eax],edx
 006CB526    push        6CB540
 006CB52B    lea         eax,[ebp-8]
 006CB52E    mov         edx,2
 006CB533    call        @UStrArrayClr
 006CB538    ret
>006CB539    jmp         @HandleFinally
>006CB53E    jmp         006CB52B
 006CB540    pop         ebx
 006CB541    pop         ecx
 006CB542    pop         ecx
 006CB543    pop         ebp
 006CB544    ret
*}
end;

//006CB548
procedure TOtherWindow.FindSister(ClassName:string; WindowName:string);
begin
{*
 006CB548    push        ebp
 006CB549    mov         ebp,esp
 006CB54B    add         esp,0FFFFFFF8
 006CB54E    push        ebx
 006CB54F    mov         dword ptr [ebp-8],ecx
 006CB552    mov         dword ptr [ebp-4],edx
 006CB555    mov         ebx,eax
 006CB557    mov         eax,dword ptr [ebp-4]
 006CB55A    call        @UStrAddRef
 006CB55F    mov         eax,dword ptr [ebp-8]
 006CB562    call        @UStrAddRef
 006CB567    xor         eax,eax
 006CB569    push        ebp
 006CB56A    push        6CB5B6
 006CB56F    push        dword ptr fs:[eax]
 006CB572    mov         dword ptr fs:[eax],esp
 006CB575    mov         eax,dword ptr [ebp-8]
 006CB578    call        @UStrToPWChar
 006CB57D    push        eax
 006CB57E    mov         eax,dword ptr [ebp-4]
 006CB581    call        @UStrToPWChar
 006CB586    push        eax
 006CB587    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB58A    push        eax
 006CB58B    mov         eax,ebx
 006CB58D    call        TOtherWindow.ParentHandle
 006CB592    push        eax
 006CB593    call        user32.FindWindowExW
 006CB598    mov         dword ptr [ebx+4],eax;TOtherWindow.........................................................
 006CB59B    xor         eax,eax
 006CB59D    pop         edx
 006CB59E    pop         ecx
 006CB59F    pop         ecx
 006CB5A0    mov         dword ptr fs:[eax],edx
 006CB5A3    push        6CB5BD
 006CB5A8    lea         eax,[ebp-8]
 006CB5AB    mov         edx,2
 006CB5B0    call        @UStrArrayClr
 006CB5B5    ret
>006CB5B6    jmp         @HandleFinally
>006CB5BB    jmp         006CB5A8
 006CB5BD    pop         ebx
 006CB5BE    pop         ecx
 006CB5BF    pop         ecx
 006CB5C0    pop         ebp
 006CB5C1    ret
*}
end;

//006CB5C4
constructor TOtherWindow.Create(WindowHandle:HWND);
begin
{*
 006CB5C4    test        dl,dl
>006CB5C6    je          006CB5D0
 006CB5C8    add         esp,0FFFFFFF0
 006CB5CB    call        @ClassCreate
 006CB5D0    mov         dword ptr [eax+4],ecx;TOtherWindow.........................................................
 006CB5D3    test        dl,dl
>006CB5D5    je          006CB5E6
 006CB5D7    call        @AfterConstruction
 006CB5DC    pop         dword ptr fs:[0]
 006CB5E3    add         esp,0C
 006CB5E6    ret
*}
end;

//006CB5E8
constructor sub_006CB5E8;
begin
{*
 006CB5E8    push        ebx
 006CB5E9    push        esi
 006CB5EA    test        dl,dl
>006CB5EC    je          006CB5F6
 006CB5EE    add         esp,0FFFFFFF0
 006CB5F1    call        @ClassCreate
 006CB5F6    mov         ebx,edx
 006CB5F8    mov         esi,eax
 006CB5FA    call        user32.GetFocus
 006CB5FF    mov         dword ptr [esi+4],eax;TOtherWindow.........................................................
 006CB602    mov         eax,esi
 006CB604    test        bl,bl
>006CB606    je          006CB617
 006CB608    call        @AfterConstruction
 006CB60D    pop         dword ptr fs:[0]
 006CB614    add         esp,0C
 006CB617    mov         eax,esi
 006CB619    pop         esi
 006CB61A    pop         ebx
 006CB61B    ret
*}
end;

//006CB61C
constructor sub_006CB61C;
begin
{*
 006CB61C    push        ebx
 006CB61D    push        esi
 006CB61E    test        dl,dl
>006CB620    je          006CB62A
 006CB622    add         esp,0FFFFFFF0
 006CB625    call        @ClassCreate
 006CB62A    mov         ebx,edx
 006CB62C    mov         esi,eax
 006CB62E    call        user32.GetDesktopWindow
 006CB633    mov         dword ptr [esi+4],eax;TOtherWindow.........................................................
 006CB636    mov         eax,esi
 006CB638    test        bl,bl
>006CB63A    je          006CB64B
 006CB63C    call        @AfterConstruction
 006CB641    pop         dword ptr fs:[0]
 006CB648    add         esp,0C
 006CB64B    mov         eax,esi
 006CB64D    pop         esi
 006CB64E    pop         ebx
 006CB64F    ret
*}
end;

//006CB650
constructor sub_006CB650;
begin
{*
 006CB650    push        ebx
 006CB651    push        esi
 006CB652    test        dl,dl
>006CB654    je          006CB65E
 006CB656    add         esp,0FFFFFFF0
 006CB659    call        @ClassCreate
 006CB65E    mov         ebx,edx
 006CB660    mov         esi,eax
 006CB662    push        0
 006CB664    call        user32.GetTopWindow
 006CB669    mov         dword ptr [esi+4],eax;TOtherWindow.........................................................
 006CB66C    mov         eax,esi
 006CB66E    test        bl,bl
>006CB670    je          006CB681
 006CB672    call        @AfterConstruction
 006CB677    pop         dword ptr fs:[0]
 006CB67E    add         esp,0C
 006CB681    mov         eax,esi
 006CB683    pop         esi
 006CB684    pop         ebx
 006CB685    ret
*}
end;

//006CB688
constructor sub_006CB688;
begin
{*
 006CB688    push        ebx
 006CB689    push        esi
 006CB68A    test        dl,dl
>006CB68C    je          006CB696
 006CB68E    add         esp,0FFFFFFF0
 006CB691    call        @ClassCreate
 006CB696    mov         ebx,edx
 006CB698    mov         esi,eax
 006CB69A    call        user32.GetForegroundWindow
 006CB69F    mov         dword ptr [esi+4],eax;TOtherWindow.........................................................
 006CB6A2    mov         eax,esi
 006CB6A4    test        bl,bl
>006CB6A6    je          006CB6B7
 006CB6A8    call        @AfterConstruction
 006CB6AD    pop         dword ptr fs:[0]
 006CB6B4    add         esp,0C
 006CB6B7    mov         eax,esi
 006CB6B9    pop         esi
 006CB6BA    pop         ebx
 006CB6BB    ret
*}
end;

//006CB6BC
constructor sub_006CB6BC;
begin
{*
 006CB6BC    push        ebx
 006CB6BD    push        esi
 006CB6BE    test        dl,dl
>006CB6C0    je          006CB6CA
 006CB6C2    add         esp,0FFFFFFF0
 006CB6C5    call        @ClassCreate
 006CB6CA    mov         ebx,edx
 006CB6CC    mov         esi,eax
 006CB6CE    call        user32.GetActiveWindow
 006CB6D3    mov         dword ptr [esi+4],eax;TOtherWindow.........................................................
 006CB6D6    mov         eax,esi
 006CB6D8    test        bl,bl
>006CB6DA    je          006CB6EB
 006CB6DC    call        @AfterConstruction
 006CB6E1    pop         dword ptr fs:[0]
 006CB6E8    add         esp,0C
 006CB6EB    mov         eax,esi
 006CB6ED    pop         esi
 006CB6EE    pop         ebx
 006CB6EF    ret
*}
end;

//006CB6F0
{*procedure TOtherWindow.ClassName(?:?);
begin
 006CB6F0    push        ebx
 006CB6F1    add         esp,0FFFFFE00
 006CB6F7    mov         ebx,edx
 006CB6F9    push        0FF
 006CB6FE    lea         edx,[esp+4]
 006CB702    push        edx
 006CB703    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CB706    push        eax
 006CB707    call        user32.GetClassNameW
 006CB70C    mov         eax,ebx
 006CB70E    mov         edx,esp
 006CB710    mov         ecx,100
 006CB715    call        @UStrFromWArray
 006CB71A    add         esp,200
 006CB720    pop         ebx
 006CB721    ret
end;*}

//006CB724
{*procedure TOtherWindow.DefaultFont(?:?);
begin
 006CB724    push        ebx
 006CB725    push        esi
 006CB726    push        edi
 006CB727    add         esp,0FFFFFFA4
 006CB72A    mov         ebx,edx
 006CB72C    mov         dword ptr [esp],5C
 006CB733    mov         esi,6CB770
 006CB738    lea         edi,[esp+1A]
 006CB73C    mov         ecx,10
 006CB741    rep movs    dword ptr [edi],dword ptr [esi]
 006CB743    mov         edx,esp
 006CB745    push        edx
 006CB746    push        0
 006CB748    push        43A
 006CB74D    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CB750    push        eax
 006CB751    call        user32.SendMessageW
 006CB756    mov         eax,ebx
 006CB758    lea         edx,[esp+1A]
 006CB75C    mov         ecx,20
 006CB761    call        @UStrFromWArray
 006CB766    add         esp,5C
 006CB769    pop         edi
 006CB76A    pop         esi
 006CB76B    pop         ebx
 006CB76C    ret
end;*}

//006CB7B0
procedure TOtherWindow.Cut;
begin
{*
 006CB7B0    push        0
 006CB7B2    push        0
 006CB7B4    push        300
 006CB7B9    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CB7BC    push        eax
 006CB7BD    call        user32.SendMessageW
 006CB7C2    ret
*}
end;

//006CB7C4
procedure TOtherWindow.Copy;
begin
{*
 006CB7C4    push        0
 006CB7C6    push        0
 006CB7C8    push        301
 006CB7CD    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CB7D0    push        eax
 006CB7D1    call        user32.SendMessageW
 006CB7D6    ret
*}
end;

//006CB7D8
procedure TOtherWindow.Clear;
begin
{*
 006CB7D8    push        0
 006CB7DA    push        0
 006CB7DC    push        303
 006CB7E1    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CB7E4    push        eax
 006CB7E5    call        user32.SendMessageW
 006CB7EA    ret
*}
end;

//006CB7EC
procedure TOtherWindow.Paste;
begin
{*
 006CB7EC    push        0
 006CB7EE    push        0
 006CB7F0    push        302
 006CB7F5    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CB7F8    push        eax
 006CB7F9    call        user32.SendMessageW
 006CB7FE    ret
*}
end;

//006CB800
procedure TOtherWindow.Undo;
begin
{*
 006CB800    push        0
 006CB802    push        0
 006CB804    push        0C7
 006CB809    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CB80C    push        eax
 006CB80D    call        user32.SendMessageW
 006CB812    ret
*}
end;

//006CB814
function TOtherWindow.CanUndo:Boolean;
begin
{*
 006CB814    push        ebx
 006CB815    mov         ebx,eax
 006CB817    push        0
 006CB819    push        0
 006CB81B    push        0C6
 006CB820    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB823    push        eax
 006CB824    call        user32.SendMessageW
 006CB829    test        eax,eax
 006CB82B    setne       al
 006CB82E    pop         ebx
 006CB82F    ret
*}
end;

//006CB830
procedure TOtherWindow.GetVisible;
begin
{*
 006CB830    push        ebx
 006CB831    mov         ebx,eax
 006CB833    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB836    push        eax
 006CB837    call        user32.IsWindowVisible
 006CB83C    cmp         eax,1
 006CB83F    sbb         eax,eax
 006CB841    inc         eax
 006CB842    pop         ebx
 006CB843    ret
*}
end;

//006CB844
procedure TOtherWindow.SetVisible(Value:Boolean);
begin
{*
 006CB844    test        dl,dl
>006CB846    je          006CB854
 006CB848    push        5
 006CB84A    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CB84D    push        eax
 006CB84E    call        user32.ShowWindow
 006CB853    ret
 006CB854    push        0
 006CB856    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CB859    push        eax
 006CB85A    call        user32.ShowWindow
 006CB85F    ret
*}
end;

//006CB860
procedure TOtherWindow.SetEnabled(Value:Boolean);
begin
{*
 006CB860    cmp         dl,1
 006CB863    cmc
 006CB864    sbb         edx,edx
 006CB866    push        edx
 006CB867    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CB86A    push        eax
 006CB86B    call        user32.EnableWindow
 006CB870    ret
*}
end;

//006CB874
procedure TOtherWindow.GetEnabled;
begin
{*
 006CB874    push        ebx
 006CB875    mov         ebx,eax
 006CB877    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB87A    push        eax
 006CB87B    call        user32.IsWindowEnabled
 006CB880    cmp         eax,1
 006CB883    sbb         eax,eax
 006CB885    inc         eax
 006CB886    pop         ebx
 006CB887    ret
*}
end;

//006CB888
procedure TOtherWindow.Unicode;
begin
{*
 006CB888    push        ebx
 006CB889    mov         ebx,eax
 006CB88B    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB88E    push        eax
 006CB88F    call        user32.IsWindowUnicode
 006CB894    cmp         eax,1
 006CB897    sbb         eax,eax
 006CB899    inc         eax
 006CB89A    pop         ebx
 006CB89B    ret
*}
end;

//006CB89C
function TOtherWindow.GetLeft:Integer;
begin
{*
 006CB89C    add         esp,0FFFFFFF0
 006CB89F    push        esp
 006CB8A0    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CB8A3    push        eax
 006CB8A4    call        user32.GetWindowRect
 006CB8A9    mov         eax,dword ptr [esp]
 006CB8AC    add         esp,10
 006CB8AF    ret
*}
end;

//006CB8B0
function TOtherWindow.GetTop:Integer;
begin
{*
 006CB8B0    add         esp,0FFFFFFF0
 006CB8B3    push        esp
 006CB8B4    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CB8B7    push        eax
 006CB8B8    call        user32.GetWindowRect
 006CB8BD    mov         eax,dword ptr [esp+4]
 006CB8C1    add         esp,10
 006CB8C4    ret
*}
end;

//006CB8C8
function TOtherWindow.GetWidth:Integer;
begin
{*
 006CB8C8    add         esp,0FFFFFFF0
 006CB8CB    push        esp
 006CB8CC    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CB8CF    push        eax
 006CB8D0    call        user32.GetWindowRect
 006CB8D5    mov         eax,dword ptr [esp+8]
 006CB8D9    sub         eax,dword ptr [esp]
 006CB8DC    add         esp,10
 006CB8DF    ret
*}
end;

//006CB8E0
function TOtherWindow.GetHeight:Integer;
begin
{*
 006CB8E0    add         esp,0FFFFFFF0
 006CB8E3    push        esp
 006CB8E4    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CB8E7    push        eax
 006CB8E8    call        user32.GetWindowRect
 006CB8ED    mov         eax,dword ptr [esp+0C]
 006CB8F1    sub         eax,dword ptr [esp+4]
 006CB8F5    add         esp,10
 006CB8F8    ret
*}
end;

//006CB8FC
function TOtherWindow.GetClientWidth:Integer;
begin
{*
 006CB8FC    add         esp,0FFFFFFF0
 006CB8FF    push        esp
 006CB900    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CB903    push        eax
 006CB904    call        user32.GetClientRect
 006CB909    mov         eax,dword ptr [esp+8]
 006CB90D    add         esp,10
 006CB910    ret
*}
end;

//006CB914
function TOtherWindow.GetClientHeight:Integer;
begin
{*
 006CB914    add         esp,0FFFFFFF0
 006CB917    push        esp
 006CB918    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CB91B    push        eax
 006CB91C    call        user32.GetClientRect
 006CB921    mov         eax,dword ptr [esp+0C]
 006CB925    add         esp,10
 006CB928    ret
*}
end;

//006CB92C
procedure TOtherWindow.SetTop(Value:Integer);
begin
{*
 006CB92C    push        ebx
 006CB92D    push        esi
 006CB92E    add         esp,0FFFFFFF0
 006CB931    mov         esi,edx
 006CB933    mov         ebx,eax
 006CB935    push        esp
 006CB936    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB939    push        eax
 006CB93A    call        user32.GetWindowRect
 006CB93F    push        0FF
 006CB941    mov         edx,dword ptr [esp+10]
 006CB945    sub         edx,dword ptr [esp+8]
 006CB949    push        edx
 006CB94A    mov         edx,dword ptr [esp+10]
 006CB94E    mov         eax,dword ptr [esp+8]
 006CB952    sub         edx,eax
 006CB954    push        edx
 006CB955    push        esi
 006CB956    push        eax
 006CB957    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB95A    push        eax
 006CB95B    call        user32.MoveWindow
 006CB960    add         esp,10
 006CB963    pop         esi
 006CB964    pop         ebx
 006CB965    ret
*}
end;

//006CB968
procedure TOtherWindow.SetLeft(Value:Integer);
begin
{*
 006CB968    push        ebx
 006CB969    push        esi
 006CB96A    add         esp,0FFFFFFF0
 006CB96D    mov         esi,edx
 006CB96F    mov         ebx,eax
 006CB971    push        esp
 006CB972    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB975    push        eax
 006CB976    call        user32.GetWindowRect
 006CB97B    push        0FF
 006CB97D    mov         edx,dword ptr [esp+10]
 006CB981    mov         eax,dword ptr [esp+8]
 006CB985    sub         edx,eax
 006CB987    push        edx
 006CB988    mov         edx,dword ptr [esp+10]
 006CB98C    sub         edx,dword ptr [esp+8]
 006CB990    push        edx
 006CB991    push        eax
 006CB992    push        esi
 006CB993    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB996    push        eax
 006CB997    call        user32.MoveWindow
 006CB99C    add         esp,10
 006CB99F    pop         esi
 006CB9A0    pop         ebx
 006CB9A1    ret
*}
end;

//006CB9A4
procedure TOtherWindow.SetWidth(Value:Integer);
begin
{*
 006CB9A4    push        ebx
 006CB9A5    push        esi
 006CB9A6    add         esp,0FFFFFFF0
 006CB9A9    mov         esi,edx
 006CB9AB    mov         ebx,eax
 006CB9AD    push        esp
 006CB9AE    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB9B1    push        eax
 006CB9B2    call        user32.GetWindowRect
 006CB9B7    push        0FF
 006CB9B9    mov         edx,dword ptr [esp+10]
 006CB9BD    mov         eax,dword ptr [esp+8]
 006CB9C1    sub         edx,eax
 006CB9C3    push        edx
 006CB9C4    push        esi
 006CB9C5    push        eax
 006CB9C6    mov         eax,dword ptr [esp+10]
 006CB9CA    push        eax
 006CB9CB    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB9CE    push        eax
 006CB9CF    call        user32.MoveWindow
 006CB9D4    add         esp,10
 006CB9D7    pop         esi
 006CB9D8    pop         ebx
 006CB9D9    ret
*}
end;

//006CB9DC
procedure TOtherWindow.SetHeight(Value:Integer);
begin
{*
 006CB9DC    push        ebx
 006CB9DD    push        esi
 006CB9DE    add         esp,0FFFFFFF0
 006CB9E1    mov         esi,edx
 006CB9E3    mov         ebx,eax
 006CB9E5    push        esp
 006CB9E6    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CB9E9    push        eax
 006CB9EA    call        user32.GetWindowRect
 006CB9EF    push        0FF
 006CB9F1    push        esi
 006CB9F2    mov         edx,dword ptr [esp+10]
 006CB9F6    mov         eax,dword ptr [esp+8]
 006CB9FA    sub         edx,eax
 006CB9FC    push        edx
 006CB9FD    mov         edx,dword ptr [esp+10]
 006CBA01    push        edx
 006CBA02    push        eax
 006CBA03    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CBA06    push        eax
 006CBA07    call        user32.MoveWindow
 006CBA0C    add         esp,10
 006CBA0F    pop         esi
 006CBA10    pop         ebx
 006CBA11    ret
*}
end;

//006CBA14
procedure TOtherWindow.ScrollLeft;
begin
{*
 006CBA14    push        0
 006CBA16    push        0
 006CBA18    push        114
 006CBA1D    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CBA20    push        eax
 006CBA21    call        user32.SendMessageW
 006CBA26    ret
*}
end;

//006CBA28
procedure TOtherWindow.ScrollRight;
begin
{*
 006CBA28    push        0
 006CBA2A    push        1
 006CBA2C    push        114
 006CBA31    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CBA34    push        eax
 006CBA35    call        user32.SendMessageW
 006CBA3A    ret
*}
end;

//006CBA3C
procedure TOtherWindow.ScrollUp;
begin
{*
 006CBA3C    push        0
 006CBA3E    push        0
 006CBA40    push        115
 006CBA45    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CBA48    push        eax
 006CBA49    call        user32.SendMessageW
 006CBA4E    ret
*}
end;

//006CBA50
procedure TOtherWindow.ScrollDown;
begin
{*
 006CBA50    push        0
 006CBA52    push        0
 006CBA54    push        115
 006CBA59    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CBA5C    push        eax
 006CBA5D    call        user32.SendMessageW
 006CBA62    ret
*}
end;

//006CBA64
procedure TOtherWindow.SetText(Value:string);
begin
{*
 006CBA64    push        ebp
 006CBA65    mov         ebp,esp
 006CBA67    push        ecx
 006CBA68    push        ebx
 006CBA69    mov         dword ptr [ebp-4],edx
 006CBA6C    mov         ebx,eax
 006CBA6E    mov         eax,dword ptr [ebp-4]
 006CBA71    call        @UStrAddRef
 006CBA76    xor         eax,eax
 006CBA78    push        ebp
 006CBA79    push        6CBAAC
 006CBA7E    push        dword ptr fs:[eax]
 006CBA81    mov         dword ptr fs:[eax],esp
 006CBA84    mov         eax,dword ptr [ebp-4]
 006CBA87    call        @UStrToPWChar
 006CBA8C    push        eax
 006CBA8D    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CBA90    push        eax
 006CBA91    call        user32.SetWindowTextW
 006CBA96    xor         eax,eax
 006CBA98    pop         edx
 006CBA99    pop         ecx
 006CBA9A    pop         ecx
 006CBA9B    mov         dword ptr fs:[eax],edx
 006CBA9E    push        6CBAB3
 006CBAA3    lea         eax,[ebp-4]
 006CBAA6    call        @UStrClr
 006CBAAB    ret
>006CBAAC    jmp         @HandleFinally
>006CBAB1    jmp         006CBAA3
 006CBAB3    pop         ebx
 006CBAB4    pop         ecx
 006CBAB5    pop         ebp
 006CBAB6    ret
*}
end;

//006CBAB8
function TOtherWindow.FontHandle:Cardinal;
begin
{*
 006CBAB8    push        0
 006CBABA    push        0
 006CBABC    push        31
 006CBABE    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CBAC1    push        eax
 006CBAC2    call        user32.SendMessageW
 006CBAC7    ret
*}
end;

//006CBAC8
{*procedure TOtherWindow.SelectionFont(?:?);
begin
 006CBAC8    push        ebx
 006CBAC9    push        esi
 006CBACA    push        edi
 006CBACB    add         esp,0FFFFFFA4
 006CBACE    mov         ebx,edx
 006CBAD0    mov         dword ptr [esp],5C
 006CBAD7    mov         esi,6CBB14
 006CBADC    lea         edi,[esp+1A]
 006CBAE0    mov         ecx,10
 006CBAE5    rep movs    dword ptr [edi],dword ptr [esi]
 006CBAE7    mov         edx,esp
 006CBAE9    push        edx
 006CBAEA    push        1
 006CBAEC    push        43A
 006CBAF1    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CBAF4    push        eax
 006CBAF5    call        user32.SendMessageW
 006CBAFA    mov         eax,ebx
 006CBAFC    lea         edx,[esp+1A]
 006CBB00    mov         ecx,20
 006CBB05    call        @UStrFromWArray
 006CBB0A    add         esp,5C
 006CBB0D    pop         edi
 006CBB0E    pop         esi
 006CBB0F    pop         ebx
 006CBB10    ret
end;*}

//006CBB54
{*procedure TOtherWindow.FontName(?:?);
begin
 006CBB54    push        ebx
 006CBB55    push        esi
 006CBB56    add         esp,0FFFFFFA4
 006CBB59    mov         esi,edx
 006CBB5B    mov         ebx,eax
 006CBB5D    mov         eax,ebx
 006CBB5F    call        TOtherWindow.FontHandle
 006CBB64    test        eax,eax
>006CBB66    je          006CBB83
 006CBB68    push        esp
 006CBB69    push        5C
 006CBB6B    push        eax
 006CBB6C    call        gdi32.GetObjectW
 006CBB71    mov         eax,esi
 006CBB73    lea         edx,[esp+1C]
 006CBB77    mov         ecx,20
 006CBB7C    call        @UStrFromWArray
>006CBB81    jmp         006CBB8C
 006CBB83    mov         edx,esi
 006CBB85    mov         eax,ebx
 006CBB87    call        TOtherWindow.SelectionFont
 006CBB8C    add         esp,5C
 006CBB8F    pop         esi
 006CBB90    pop         ebx
 006CBB91    ret
end;*}

//006CBB94
procedure TOtherWindow.SendChars(s:string);
begin
{*
 006CBB94    push        ebp
 006CBB95    mov         ebp,esp
 006CBB97    push        ecx
 006CBB98    push        ebx
 006CBB99    push        esi
 006CBB9A    push        edi
 006CBB9B    mov         dword ptr [ebp-4],edx
 006CBB9E    mov         esi,eax
 006CBBA0    mov         eax,dword ptr [ebp-4]
 006CBBA3    call        @UStrAddRef
 006CBBA8    xor         eax,eax
 006CBBAA    push        ebp
 006CBBAB    push        6CBC04
 006CBBB0    push        dword ptr fs:[eax]
 006CBBB3    mov         dword ptr fs:[eax],esp
 006CBBB6    mov         eax,dword ptr [ebp-4]
 006CBBB9    test        eax,eax
>006CBBBB    je          006CBBC2
 006CBBBD    sub         eax,4
 006CBBC0    mov         eax,dword ptr [eax]
 006CBBC2    mov         edi,eax
 006CBBC4    test        edi,edi
>006CBBC6    jle         006CBBEE
 006CBBC8    mov         ebx,1
 006CBBCD    push        0
 006CBBCF    mov         eax,dword ptr [ebp-4]
 006CBBD2    movzx       eax,word ptr [eax+ebx*2-2]
 006CBBD7    push        eax
 006CBBD8    push        102
 006CBBDD    mov         eax,dword ptr [esi+4];TOtherWindow.........................................................
 006CBBE0    push        eax
 006CBBE1    call        user32.PostMessageW
 006CBBE6    test        eax,eax
>006CBBE8    je          006CBBCD
 006CBBEA    inc         ebx
 006CBBEB    dec         edi
>006CBBEC    jne         006CBBCD
 006CBBEE    xor         eax,eax
 006CBBF0    pop         edx
 006CBBF1    pop         ecx
 006CBBF2    pop         ecx
 006CBBF3    mov         dword ptr fs:[eax],edx
 006CBBF6    push        6CBC0B
 006CBBFB    lea         eax,[ebp-4]
 006CBBFE    call        @UStrClr
 006CBC03    ret
>006CBC04    jmp         @HandleFinally
>006CBC09    jmp         006CBBFB
 006CBC0B    pop         edi
 006CBC0C    pop         esi
 006CBC0D    pop         ebx
 006CBC0E    pop         ecx
 006CBC0F    pop         ebp
 006CBC10    ret
*}
end;

//006CBC14
procedure TOtherWindow.Backspace(Count:Integer);
begin
{*
 006CBC14    push        ebp
 006CBC15    mov         ebp,esp
 006CBC17    xor         ecx,ecx
 006CBC19    push        ecx
 006CBC1A    push        ecx
 006CBC1B    push        ecx
 006CBC1C    push        ecx
 006CBC1D    push        ecx
 006CBC1E    push        ebx
 006CBC1F    push        esi
 006CBC20    mov         ebx,edx
 006CBC22    mov         esi,eax
 006CBC24    xor         eax,eax
 006CBC26    push        ebp
 006CBC27    push        6CBCD5
 006CBC2C    push        dword ptr fs:[eax]
 006CBC2F    mov         dword ptr fs:[eax],esp
 006CBC32    lea         edx,[ebp-8]
 006CBC35    mov         eax,esi
 006CBC37    call        TOtherWindow.ClassName
 006CBC3C    mov         eax,dword ptr [ebp-8]
 006CBC3F    lea         edx,[ebp-4]
 006CBC42    call        UpperCase
 006CBC47    mov         edx,dword ptr [ebp-4]
 006CBC4A    mov         eax,6CBCF0;'RICH'
 006CBC4F    call        Pos
 006CBC54    test        eax,eax
>006CBC56    jg          006CBC92
 006CBC58    lea         eax,[ebp-10]
 006CBC5B    push        eax
 006CBC5C    lea         edx,[ebp-14]
 006CBC5F    mov         eax,esi
 006CBC61    call        TOtherWindow.ClassName
 006CBC66    mov         eax,dword ptr [ebp-14]
 006CBC69    mov         ecx,3
 006CBC6E    mov         edx,1
 006CBC73    call        @UStrCopy
 006CBC78    mov         eax,dword ptr [ebp-10]
 006CBC7B    lea         edx,[ebp-0C]
 006CBC7E    call        UpperCase
 006CBC83    mov         eax,dword ptr [ebp-0C]
 006CBC86    mov         edx,6CBD08;'AFX'
 006CBC8B    call        @UStrEqual
>006CBC90    jne         006CBCA7
 006CBC92    test        ebx,ebx
>006CBC94    jle         006CBCBA
 006CBC96    mov         edx,6CBD1C;''
 006CBC9B    mov         eax,esi
 006CBC9D    call        TOtherWindow.SendKeys
 006CBCA2    dec         ebx
>006CBCA3    jne         006CBC96
>006CBCA5    jmp         006CBCBA
 006CBCA7    test        ebx,ebx
>006CBCA9    jle         006CBCBA
 006CBCAB    mov         edx,6CBD1C;''
 006CBCB0    mov         eax,esi
 006CBCB2    call        TOtherWindow.SendChars
 006CBCB7    dec         ebx
>006CBCB8    jne         006CBCAB
 006CBCBA    xor         eax,eax
 006CBCBC    pop         edx
 006CBCBD    pop         ecx
 006CBCBE    pop         ecx
 006CBCBF    mov         dword ptr fs:[eax],edx
 006CBCC2    push        6CBCDC
 006CBCC7    lea         eax,[ebp-14]
 006CBCCA    mov         edx,5
 006CBCCF    call        @UStrArrayClr
 006CBCD4    ret
>006CBCD5    jmp         @HandleFinally
>006CBCDA    jmp         006CBCC7
 006CBCDC    pop         esi
 006CBCDD    pop         ebx
 006CBCDE    mov         esp,ebp
 006CBCE0    pop         ebp
 006CBCE1    ret
*}
end;

//006CBD20
procedure TOtherWindow.SendKeys(s:string);
begin
{*
 006CBD20    push        ebp
 006CBD21    mov         ebp,esp
 006CBD23    add         esp,0FFFFFFF0
 006CBD26    push        ebx
 006CBD27    push        esi
 006CBD28    push        edi
 006CBD29    mov         dword ptr [ebp-4],edx
 006CBD2C    mov         esi,eax
 006CBD2E    mov         eax,dword ptr [ebp-4]
 006CBD31    call        @UStrAddRef
 006CBD36    xor         eax,eax
 006CBD38    push        ebp
 006CBD39    push        6CBE73
 006CBD3E    push        dword ptr fs:[eax]
 006CBD41    mov         dword ptr fs:[eax],esp
 006CBD44    mov         eax,dword ptr [ebp-4]
 006CBD47    test        eax,eax
>006CBD49    je          006CBD50
 006CBD4B    sub         eax,4
 006CBD4E    mov         eax,dword ptr [eax]
 006CBD50    test        eax,eax
>006CBD52    jle         006CBE5D
 006CBD58    mov         dword ptr [ebp-10],eax
 006CBD5B    mov         dword ptr [ebp-8],1
 006CBD62    mov         eax,dword ptr [ebp-4]
 006CBD65    mov         edx,dword ptr [ebp-8]
 006CBD68    movzx       eax,word ptr [eax+edx*2-2]
 006CBD6D    push        eax
 006CBD6E    call        user32.VkKeyScanW
 006CBD73    mov         ebx,eax
 006CBD75    movzx       eax,bx
 006CBD78    shr         eax,8
 006CBD7B    mov         byte ptr [ebp-9],al
 006CBD7E    and         bx,0FF
 006CBD83    push        0
 006CBD85    movzx       eax,bx
 006CBD88    push        eax
 006CBD89    call        user32.MapVirtualKeyW
 006CBD8E    mov         edi,eax
 006CBD90    shl         edi,10
 006CBD93    test        byte ptr [ebp-9],1
>006CBD97    jbe         006CBDAB
 006CBD99    push        0
 006CBD9B    push        10
 006CBD9D    push        100
 006CBDA2    mov         eax,dword ptr [esi+4];TOtherWindow.........................................................
 006CBDA5    push        eax
 006CBDA6    call        user32.PostMessageW
 006CBDAB    test        byte ptr [ebp-9],2
>006CBDAF    jbe         006CBDC3
 006CBDB1    push        0
 006CBDB3    push        11
 006CBDB5    push        100
 006CBDBA    mov         eax,dword ptr [esi+4];TOtherWindow.........................................................
 006CBDBD    push        eax
 006CBDBE    call        user32.PostMessageW
 006CBDC3    test        byte ptr [ebp-9],4
>006CBDC7    jbe         006CBDDB
 006CBDC9    push        0
 006CBDCB    push        12
 006CBDCD    push        100
 006CBDD2    mov         eax,dword ptr [esi+4];TOtherWindow.........................................................
 006CBDD5    push        eax
 006CBDD6    call        user32.PostMessageW
 006CBDDB    push        edi
 006CBDDC    movzx       eax,bx
 006CBDDF    push        eax
 006CBDE0    push        100
 006CBDE5    mov         eax,dword ptr [esi+4];TOtherWindow.........................................................
 006CBDE8    push        eax
 006CBDE9    call        user32.PostMessageW
 006CBDEE    test        eax,eax
>006CBDF0    je          006CBDDB
 006CBDF2    push        edi
 006CBDF3    movzx       eax,bx
 006CBDF6    push        eax
 006CBDF7    push        101
 006CBDFC    mov         eax,dword ptr [esi+4];TOtherWindow.........................................................
 006CBDFF    push        eax
 006CBE00    call        user32.PostMessageW
 006CBE05    test        eax,eax
>006CBE07    je          006CBDF2
 006CBE09    test        byte ptr [ebp-9],4
>006CBE0D    jbe         006CBE21
 006CBE0F    push        0
 006CBE11    push        12
 006CBE13    push        101
 006CBE18    mov         eax,dword ptr [esi+4];TOtherWindow.........................................................
 006CBE1B    push        eax
 006CBE1C    call        user32.PostMessageW
 006CBE21    test        byte ptr [ebp-9],2
>006CBE25    jbe         006CBE39
 006CBE27    push        0
 006CBE29    push        11
 006CBE2B    push        100
 006CBE30    mov         eax,dword ptr [esi+4];TOtherWindow.........................................................
 006CBE33    push        eax
 006CBE34    call        user32.PostMessageW
 006CBE39    test        byte ptr [ebp-9],1
>006CBE3D    jbe         006CBE51
 006CBE3F    push        0
 006CBE41    push        10
 006CBE43    push        100
 006CBE48    mov         eax,dword ptr [esi+4];TOtherWindow.........................................................
 006CBE4B    push        eax
 006CBE4C    call        user32.PostMessageW
 006CBE51    inc         dword ptr [ebp-8]
 006CBE54    dec         dword ptr [ebp-10]
>006CBE57    jne         006CBD62
 006CBE5D    xor         eax,eax
 006CBE5F    pop         edx
 006CBE60    pop         ecx
 006CBE61    pop         ecx
 006CBE62    mov         dword ptr fs:[eax],edx
 006CBE65    push        6CBE7A
 006CBE6A    lea         eax,[ebp-4]
 006CBE6D    call        @UStrClr
 006CBE72    ret
>006CBE73    jmp         @HandleFinally
>006CBE78    jmp         006CBE6A
 006CBE7A    pop         edi
 006CBE7B    pop         esi
 006CBE7C    pop         ebx
 006CBE7D    mov         esp,ebp
 006CBE7F    pop         ebp
 006CBE80    ret
*}
end;

//006CBE84
{*procedure TOtherWindow.GetText(?:?);
begin
 006CBE84    push        ebx
 006CBE85    push        esi
 006CBE86    push        edi
 006CBE87    add         esp,0FFFFFE00
 006CBE8D    mov         ebx,edx
 006CBE8F    mov         esi,6CBEC8
 006CBE94    mov         edi,esp
 006CBE96    mov         ecx,80
 006CBE9B    rep movs    dword ptr [edi],dword ptr [esi]
 006CBE9D    mov         edx,esp
 006CBE9F    push        edx
 006CBEA0    push        0FF
 006CBEA5    push        0D
 006CBEA7    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CBEAA    push        eax
 006CBEAB    call        user32.SendMessageW
 006CBEB0    mov         eax,ebx
 006CBEB2    mov         edx,esp
 006CBEB4    mov         ecx,100
 006CBEB9    call        @UStrFromWArray
 006CBEBE    add         esp,200
 006CBEC4    pop         edi
 006CBEC5    pop         esi
 006CBEC6    pop         ebx
 006CBEC7    ret
end;*}

//006CC0C8
{*procedure TOtherWindow.GetTextP(?:?);
begin
 006CC0C8    push        ebx
 006CC0C9    push        esi
 006CC0CA    push        edi
 006CC0CB    add         esp,0FFFFFE00
 006CC0D1    mov         ebx,edx
 006CC0D3    mov         esi,6CC10C
 006CC0D8    mov         edi,esp
 006CC0DA    mov         ecx,80
 006CC0DF    rep movs    dword ptr [edi],dword ptr [esi]
 006CC0E1    mov         edx,esp
 006CC0E3    push        edx
 006CC0E4    push        0FF
 006CC0E9    push        0D
 006CC0EB    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CC0EE    push        eax
 006CC0EF    call        user32.SendMessageW
 006CC0F4    mov         eax,ebx
 006CC0F6    mov         edx,esp
 006CC0F8    mov         ecx,100
 006CC0FD    call        @UStrFromWArray
 006CC102    add         esp,200
 006CC108    pop         edi
 006CC109    pop         esi
 006CC10A    pop         ebx
 006CC10B    ret
end;*}

//006CC30C
function TOtherWindow.IsMicrosoftWord:Boolean;
begin
{*
 006CC30C    push        ebp
 006CC30D    mov         ebp,esp
 006CC30F    push        0
 006CC311    push        ebx
 006CC312    mov         ebx,eax
 006CC314    xor         eax,eax
 006CC316    push        ebp
 006CC317    push        6CC354
 006CC31C    push        dword ptr fs:[eax]
 006CC31F    mov         dword ptr fs:[eax],esp
 006CC322    lea         edx,[ebp-4]
 006CC325    mov         eax,ebx
 006CC327    call        TOtherWindow.ClassName
 006CC32C    mov         eax,dword ptr [ebp-4]
 006CC32F    mov         edx,6CC370;'_WwG'
 006CC334    call        @UStrEqual
 006CC339    sete        al
 006CC33C    mov         ebx,eax
 006CC33E    xor         eax,eax
 006CC340    pop         edx
 006CC341    pop         ecx
 006CC342    pop         ecx
 006CC343    mov         dword ptr fs:[eax],edx
 006CC346    push        6CC35B
 006CC34B    lea         eax,[ebp-4]
 006CC34E    call        @UStrClr
 006CC353    ret
>006CC354    jmp         @HandleFinally
>006CC359    jmp         006CC34B
 006CC35B    mov         eax,ebx
 006CC35D    pop         ebx
 006CC35E    pop         ecx
 006CC35F    pop         ebp
 006CC360    ret
*}
end;

//006CC37C
function TOtherWindow.IsNetscape:Boolean;
begin
{*
 006CC37C    push        ebp
 006CC37D    mov         ebp,esp
 006CC37F    push        0
 006CC381    push        0
 006CC383    push        0
 006CC385    push        ebx
 006CC386    mov         ebx,eax
 006CC388    xor         eax,eax
 006CC38A    push        ebp
 006CC38B    push        6CC3EE
 006CC390    push        dword ptr fs:[eax]
 006CC393    mov         dword ptr fs:[eax],esp
 006CC396    lea         eax,[ebp-8]
 006CC399    push        eax
 006CC39A    lea         edx,[ebp-0C]
 006CC39D    mov         eax,ebx
 006CC39F    call        TOtherWindow.ClassName
 006CC3A4    mov         eax,dword ptr [ebp-0C]
 006CC3A7    mov         ecx,3
 006CC3AC    mov         edx,1
 006CC3B1    call        @UStrCopy
 006CC3B6    mov         eax,dword ptr [ebp-8]
 006CC3B9    lea         edx,[ebp-4]
 006CC3BC    call        UpperCase
 006CC3C1    mov         eax,dword ptr [ebp-4]
 006CC3C4    mov         edx,6CC408;'AFX'
 006CC3C9    call        @UStrEqual
 006CC3CE    sete        al
 006CC3D1    mov         ebx,eax
 006CC3D3    xor         eax,eax
 006CC3D5    pop         edx
 006CC3D6    pop         ecx
 006CC3D7    pop         ecx
 006CC3D8    mov         dword ptr fs:[eax],edx
 006CC3DB    push        6CC3F5
 006CC3E0    lea         eax,[ebp-0C]
 006CC3E3    mov         edx,3
 006CC3E8    call        @UStrArrayClr
 006CC3ED    ret
>006CC3EE    jmp         @HandleFinally
>006CC3F3    jmp         006CC3E0
 006CC3F5    mov         eax,ebx
 006CC3F7    pop         ebx
 006CC3F8    mov         esp,ebp
 006CC3FA    pop         ebp
 006CC3FB    ret
*}
end;

//006CC410
function TOtherWindow.IsRichEdit:Boolean;
begin
{*
 006CC410    push        ebp
 006CC411    mov         ebp,esp
 006CC413    push        0
 006CC415    push        0
 006CC417    push        ebx
 006CC418    mov         ebx,eax
 006CC41A    xor         eax,eax
 006CC41C    push        ebp
 006CC41D    push        6CC46C
 006CC422    push        dword ptr fs:[eax]
 006CC425    mov         dword ptr fs:[eax],esp
 006CC428    lea         edx,[ebp-8]
 006CC42B    mov         eax,ebx
 006CC42D    call        TOtherWindow.ClassName
 006CC432    mov         eax,dword ptr [ebp-8]
 006CC435    lea         edx,[ebp-4]
 006CC438    call        UpperCase
 006CC43D    mov         edx,dword ptr [ebp-4]
 006CC440    mov         eax,6CC488;'RICH'
 006CC445    call        Pos
 006CC44A    test        eax,eax
 006CC44C    setg        al
 006CC44F    mov         ebx,eax
 006CC451    xor         eax,eax
 006CC453    pop         edx
 006CC454    pop         ecx
 006CC455    pop         ecx
 006CC456    mov         dword ptr fs:[eax],edx
 006CC459    push        6CC473
 006CC45E    lea         eax,[ebp-8]
 006CC461    mov         edx,2
 006CC466    call        @UStrArrayClr
 006CC46B    ret
>006CC46C    jmp         @HandleFinally
>006CC471    jmp         006CC45E
 006CC473    mov         eax,ebx
 006CC475    pop         ebx
 006CC476    pop         ecx
 006CC477    pop         ecx
 006CC478    pop         ebp
 006CC479    ret
*}
end;

//006CC494
function TOtherWindow.IsDelphi:Boolean;
begin
{*
 006CC494    push        ebp
 006CC495    mov         ebp,esp
 006CC497    push        0
 006CC499    push        ebx
 006CC49A    mov         ebx,eax
 006CC49C    xor         eax,eax
 006CC49E    push        ebp
 006CC49F    push        6CC4DC
 006CC4A4    push        dword ptr fs:[eax]
 006CC4A7    mov         dword ptr fs:[eax],esp
 006CC4AA    lea         edx,[ebp-4]
 006CC4AD    mov         eax,ebx
 006CC4AF    call        TOtherWindow.ClassName
 006CC4B4    mov         eax,dword ptr [ebp-4]
 006CC4B7    mov         edx,6CC4F8;'TEditControl'
 006CC4BC    call        @UStrEqual
 006CC4C1    sete        al
 006CC4C4    mov         ebx,eax
 006CC4C6    xor         eax,eax
 006CC4C8    pop         edx
 006CC4C9    pop         ecx
 006CC4CA    pop         ecx
 006CC4CB    mov         dword ptr fs:[eax],edx
 006CC4CE    push        6CC4E3
 006CC4D3    lea         eax,[ebp-4]
 006CC4D6    call        @UStrClr
 006CC4DB    ret
>006CC4DC    jmp         @HandleFinally
>006CC4E1    jmp         006CC4D3
 006CC4E3    mov         eax,ebx
 006CC4E5    pop         ebx
 006CC4E6    pop         ecx
 006CC4E7    pop         ebp
 006CC4E8    ret
*}
end;

//006CC514
function TOtherWindow.ParentHandle:HWND;
begin
{*
 006CC514    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CC517    push        eax
 006CC518    call        user32.GetParent
 006CC51D    ret
*}
end;

//006CC520
function TOtherWindow.GetIndex:Integer;
begin
{*
 006CC520    push        0
 006CC522    push        0
 006CC524    push        188
 006CC529    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CC52C    push        eax
 006CC52D    call        user32.SendMessageW
 006CC532    ret
*}
end;

//006CC534
procedure TOtherWindow.SetIndex(Value:Integer);
begin
{*
 006CC534    push        0
 006CC536    push        edx
 006CC537    push        186
 006CC53C    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CC53F    push        eax
 006CC540    call        user32.SendMessageW
 006CC545    ret
*}
end;

//006CC548
function TOtherWindow.GetCount:Integer;
begin
{*
 006CC548    push        0
 006CC54A    push        0
 006CC54C    push        18B
 006CC551    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CC554    push        eax
 006CC555    call        user32.SendMessageW
 006CC55A    ret
*}
end;

//006CC55C
procedure TOtherWindow.SetCount(Value:Integer);
begin
{*
 006CC55C    push        0
 006CC55E    push        edx
 006CC55F    push        1A7
 006CC564    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CC567    push        eax
 006CC568    call        user32.SendMessageW
 006CC56D    ret
*}
end;

//006CC570
procedure TOtherWindow.SendKey(VK:Integer);
begin
{*
 006CC570    push        ebx
 006CC571    push        esi
 006CC572    push        edi
 006CC573    mov         esi,edx
 006CC575    mov         ebx,eax
 006CC577    push        0
 006CC579    push        esi
 006CC57A    call        user32.MapVirtualKeyW
 006CC57F    mov         edi,eax
 006CC581    shl         edi,10
 006CC584    push        edi
 006CC585    push        esi
 006CC586    push        100
 006CC58B    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CC58E    push        eax
 006CC58F    call        user32.PostMessageW
 006CC594    test        eax,eax
>006CC596    je          006CC584
 006CC598    push        edi
 006CC599    push        esi
 006CC59A    push        101
 006CC59F    mov         eax,dword ptr [ebx+4];TOtherWindow.........................................................
 006CC5A2    push        eax
 006CC5A3    call        user32.PostMessageW
 006CC5A8    test        eax,eax
>006CC5AA    je          006CC598
 006CC5AC    pop         edi
 006CC5AD    pop         esi
 006CC5AE    pop         ebx
 006CC5AF    ret
*}
end;

//006CC5B0
procedure TOtherWindow.Click;
begin
{*
 006CC5B0    push        0
 006CC5B2    push        0
 006CC5B4    push        0F5
 006CC5B9    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CC5BC    push        eax
 006CC5BD    call        user32.SendMessageW
 006CC5C2    ret
*}
end;

//006CC5C4
procedure TOtherWindow.ToForeground;
begin
{*
 006CC5C4    mov         eax,dword ptr [eax+4];TOtherWindow.........................................................
 006CC5C7    push        eax
 006CC5C8    call        user32.SetForegroundWindow
 006CC5CD    ret
*}
end;

//006CC5D0
{*procedure TOtherWindow.AfterDash(?:?);
begin
 006CC5D0    push        ebx
 006CC5D1    push        esi
 006CC5D2    push        edi
 006CC5D3    push        ecx
 006CC5D4    mov         ebx,edx
 006CC5D6    mov         esi,eax
 006CC5D8    mov         edx,ebx
 006CC5DA    mov         eax,esi
 006CC5DC    call        TOtherWindow.GetText
 006CC5E1    mov         edx,dword ptr [ebx]
 006CC5E3    mov         eax,6CC654;' ['
 006CC5E8    call        Pos
 006CC5ED    mov         esi,eax
 006CC5EF    test        esi,esi
>006CC5F1    jle         006CC610
 006CC5F3    mov         eax,dword ptr [ebx]
 006CC5F5    mov         dword ptr [esp],eax
 006CC5F8    mov         eax,dword ptr [esp]
 006CC5FB    test        eax,eax
>006CC5FD    je          006CC604
 006CC5FF    sub         eax,4
 006CC602    mov         eax,dword ptr [eax]
 006CC604    mov         edx,ebx
 006CC606    mov         ecx,eax
 006CC608    mov         eax,esi
 006CC60A    xchg        eax,edx
 006CC60B    call        @UStrDelete
 006CC610    mov         edx,dword ptr [ebx]
 006CC612    mov         eax,6CC668;' - '
 006CC617    call        Pos
 006CC61C    mov         esi,eax
 006CC61E    test        esi,esi
>006CC620    jle         006CC640
 006CC622    mov         eax,dword ptr [ebx]
 006CC624    mov         dword ptr [esp],eax
 006CC627    mov         edi,dword ptr [esp]
 006CC62A    test        edi,edi
>006CC62C    je          006CC633
 006CC62E    sub         edi,4
 006CC631    mov         edi,dword ptr [edi]
 006CC633    push        ebx
 006CC634    lea         edx,[esi+3]
 006CC637    mov         eax,dword ptr [ebx]
 006CC639    mov         ecx,edi
 006CC63B    call        @UStrCopy
 006CC640    pop         edx
 006CC641    pop         edi
 006CC642    pop         esi
 006CC643    pop         ebx
 006CC644    ret
end;*}

//006CC670
{*function sub_006CC670(?:UnicodeString):?;
begin
 006CC670    push        ebp
 006CC671    mov         ebp,esp
 006CC673    xor         ecx,ecx
 006CC675    push        ecx
 006CC676    push        ecx
 006CC677    push        ecx
 006CC678    push        ecx
 006CC679    push        ebx
 006CC67A    mov         dword ptr [ebp-4],eax
 006CC67D    mov         eax,dword ptr [ebp-4]
 006CC680    call        @UStrAddRef
 006CC685    xor         eax,eax
 006CC687    push        ebp
 006CC688    push        6CC77B
 006CC68D    push        dword ptr fs:[eax]
 006CC690    mov         dword ptr fs:[eax],esp
 006CC693    xor         ebx,ebx
 006CC695    cmp         dword ptr [ebp-4],0
>006CC699    je          006CC760
 006CC69F    mov         bl,1
 006CC6A1    lea         eax,[ebp-8]
 006CC6A4    push        eax
 006CC6A5    mov         ecx,1
 006CC6AA    mov         edx,2
 006CC6AF    mov         eax,dword ptr [ebp-4]
 006CC6B2    call        @UStrCopy
 006CC6B7    mov         eax,dword ptr [ebp-8]
 006CC6BA    mov         edx,6CC798;':'
 006CC6BF    call        @UStrEqual
>006CC6C4    je          006CC760
 006CC6CA    mov         edx,dword ptr [ebp-4]
 006CC6CD    mov         eax,6CC7A8;'\'
 006CC6D2    call        Pos
 006CC6D7    test        eax,eax
>006CC6D9    jg          006CC760
 006CC6DF    lea         edx,[ebp-0C]
 006CC6E2    mov         eax,dword ptr [ebp-4]
 006CC6E5    call        ExtractFileExt
 006CC6EA    mov         edx,dword ptr [ebp-0C]
 006CC6ED    lea         eax,[ebp-4]
 006CC6F0    call        @UStrLAsg
 006CC6F5    mov         edx,dword ptr [ebp-4]
 006CC6F8    mov         eax,edx
 006CC6FA    test        eax,eax
>006CC6FC    je          006CC703
 006CC6FE    sub         eax,4
 006CC701    mov         eax,dword ptr [eax]
 006CC703    cmp         eax,2
>006CC706    jl          006CC71B
 006CC708    mov         eax,edx
 006CC70A    test        eax,eax
>006CC70C    je          006CC713
 006CC70E    sub         eax,4
 006CC711    mov         eax,dword ptr [eax]
 006CC713    cmp         eax,4
 006CC716    setle       al
>006CC719    jmp         006CC71D
 006CC71B    xor         eax,eax
 006CC71D    test        al,al
>006CC71F    je          006CC75E
 006CC721    mov         eax,dword ptr [ebp-4]
 006CC724    cmp         word ptr [eax],2E
>006CC728    jne         006CC75E
 006CC72A    push        0FFFF
 006CC72F    push        0C0000000
 006CC734    push        0
 006CC736    lea         eax,[ebp-10]
 006CC739    mov         ecx,dword ptr [ebp-4]
 006CC73C    mov         edx,6CC7B8;'0'
 006CC741    call        @UStrCat3
 006CC746    mov         eax,dword ptr [ebp-10]
 006CC749    call        004F8DB8
 006CC74E    add         esp,0FFFFFFF4
 006CC751    fstp        tbyte ptr [esp]
 006CC754    wait
 006CC755    call        00455318
 006CC75A    test        al,al
>006CC75C    jne         006CC760
 006CC75E    xor         ebx,ebx
 006CC760    xor         eax,eax
 006CC762    pop         edx
 006CC763    pop         ecx
 006CC764    pop         ecx
 006CC765    mov         dword ptr fs:[eax],edx
 006CC768    push        6CC782
 006CC76D    lea         eax,[ebp-10]
 006CC770    mov         edx,4
 006CC775    call        @UStrArrayClr
 006CC77A    ret
>006CC77B    jmp         @HandleFinally
>006CC780    jmp         006CC76D
 006CC782    mov         eax,ebx
 006CC784    pop         ebx
 006CC785    mov         esp,ebp
 006CC787    pop         ebp
 006CC788    ret
end;*}

//006CC7BC
{*procedure TOtherWindow.AppName(?:?);
begin
 006CC7BC    push        ebp
 006CC7BD    mov         ebp,esp
 006CC7BF    push        0
 006CC7C1    push        0
 006CC7C3    push        0
 006CC7C5    push        ebx
 006CC7C6    push        esi
 006CC7C7    mov         dword ptr [ebp-0C],edx
 006CC7CA    mov         ebx,eax
 006CC7CC    xor         eax,eax
 006CC7CE    push        ebp
 006CC7CF    push        6CC940
 006CC7D4    push        dword ptr fs:[eax]
 006CC7D7    mov         dword ptr fs:[eax],esp
 006CC7DA    lea         edx,[ebp-4]
 006CC7DD    mov         eax,ebx
 006CC7DF    call        TOtherWindow.GetText
 006CC7E4    mov         edx,dword ptr [ebp-4]
 006CC7E7    mov         eax,6CC95C;' ['
 006CC7EC    call        Pos
 006CC7F1    mov         ebx,eax
 006CC7F3    test        ebx,ebx
>006CC7F5    jle         006CC810
 006CC7F7    mov         eax,dword ptr [ebp-4]
 006CC7FA    test        eax,eax
>006CC7FC    je          006CC803
 006CC7FE    sub         eax,4
 006CC801    mov         eax,dword ptr [eax]
 006CC803    lea         edx,[ebp-4]
 006CC806    mov         ecx,eax
 006CC808    mov         eax,ebx
 006CC80A    xchg        eax,edx
 006CC80B    call        @UStrDelete
 006CC810    mov         edx,dword ptr [ebp-4]
 006CC813    mov         eax,6CC970;' - '
 006CC818    call        Pos
 006CC81D    mov         ebx,eax
 006CC81F    test        ebx,ebx
>006CC821    jle         006CC904
 006CC827    mov         esi,dword ptr [ebp-4]
 006CC82A    test        esi,esi
>006CC82C    je          006CC833
 006CC82E    sub         esi,4
 006CC831    mov         esi,dword ptr [esi]
 006CC833    lea         eax,[ebp-8]
 006CC836    push        eax
 006CC837    lea         edx,[ebx+3]
 006CC83A    mov         ecx,esi
 006CC83C    mov         eax,dword ptr [ebp-4]
 006CC83F    call        @UStrCopy
 006CC844    lea         eax,[ebp-4]
 006CC847    push        eax
 006CC848    mov         ecx,ebx
 006CC84A    dec         ecx
 006CC84B    mov         edx,1
 006CC850    mov         eax,dword ptr [ebp-4]
 006CC853    call        @UStrCopy
 006CC858    mov         eax,dword ptr [ebp-4]
 006CC85B    mov         edx,6CC984;'PIE'
 006CC860    call        @UStrEqual
>006CC865    je          006CC876
 006CC867    mov         eax,dword ptr [ebp-4]
 006CC86A    mov         edx,6CC998;'GlovePIE'
 006CC86F    call        @UStrEqual
>006CC874    jne         006CC896
 006CC876    push        dword ptr [ebp-4]
 006CC879    push        6CC970;' - '
 006CC87E    push        dword ptr [ebp-8]
 006CC881    lea         eax,[ebp-4]
 006CC884    mov         edx,3
 006CC889    call        @UStrCatN
 006CC88E    lea         eax,[ebp-8]
 006CC891    call        @UStrClr
 006CC896    mov         eax,dword ptr [ebp-4]
 006CC899    call        006CC670
 006CC89E    test        al,al
>006CC8A0    je          006CC8AF
 006CC8A2    mov         eax,dword ptr [ebp-0C]
 006CC8A5    mov         edx,dword ptr [ebp-8]
 006CC8A8    call        @UStrAsg
>006CC8AD    jmp         006CC925
 006CC8AF    mov         eax,dword ptr [ebp-8]
 006CC8B2    call        006CC670
 006CC8B7    test        al,al
>006CC8B9    je          006CC8C8
 006CC8BB    mov         eax,dword ptr [ebp-0C]
 006CC8BE    mov         edx,dword ptr [ebp-4]
 006CC8C1    call        @UStrAsg
>006CC8C6    jmp         006CC925
 006CC8C8    mov         edx,dword ptr [ebp-4]
 006CC8CB    mov         eax,6CC9B8;' '
 006CC8D0    call        Pos
 006CC8D5    test        eax,eax
>006CC8D7    jle         006CC8F7
 006CC8D9    mov         edx,dword ptr [ebp-8]
 006CC8DC    mov         eax,6CC9B8;' '
 006CC8E1    call        Pos
 006CC8E6    test        eax,eax
>006CC8E8    jne         006CC8F7
 006CC8EA    mov         eax,dword ptr [ebp-0C]
 006CC8ED    mov         edx,dword ptr [ebp-4]
 006CC8F0    call        @UStrAsg
>006CC8F5    jmp         006CC925
 006CC8F7    mov         eax,dword ptr [ebp-0C]
 006CC8FA    mov         edx,dword ptr [ebp-8]
 006CC8FD    call        @UStrAsg
>006CC902    jmp         006CC925
 006CC904    mov         eax,dword ptr [ebp-4]
 006CC907    call        006CC670
 006CC90C    test        al,al
>006CC90E    je          006CC91A
 006CC910    mov         eax,dword ptr [ebp-0C]
 006CC913    call        @UStrClr
>006CC918    jmp         006CC925
 006CC91A    mov         eax,dword ptr [ebp-0C]
 006CC91D    mov         edx,dword ptr [ebp-4]
 006CC920    call        @UStrAsg
 006CC925    xor         eax,eax
 006CC927    pop         edx
 006CC928    pop         ecx
 006CC929    pop         ecx
 006CC92A    mov         dword ptr fs:[eax],edx
 006CC92D    push        6CC947
 006CC932    lea         eax,[ebp-8]
 006CC935    mov         edx,2
 006CC93A    call        @UStrArrayClr
 006CC93F    ret
>006CC940    jmp         @HandleFinally
>006CC945    jmp         006CC932
 006CC947    pop         esi
 006CC948    pop         ebx
 006CC949    mov         esp,ebp
 006CC94B    pop         ebp
 006CC94C    ret
end;*}

//006CC9BC
{*procedure TOtherWindow.BeforeDash(?:?);
begin
 006CC9BC    push        ebx
 006CC9BD    push        esi
 006CC9BE    push        ecx
 006CC9BF    mov         ebx,edx
 006CC9C1    mov         esi,eax
 006CC9C3    mov         edx,ebx
 006CC9C5    mov         eax,esi
 006CC9C7    call        TOtherWindow.GetText
 006CC9CC    mov         edx,dword ptr [ebx]
 006CC9CE    mov         eax,6CCA30;' ['
 006CC9D3    call        Pos
 006CC9D8    mov         esi,eax
 006CC9DA    test        esi,esi
>006CC9DC    jle         006CC9FB
 006CC9DE    mov         eax,dword ptr [ebx]
 006CC9E0    mov         dword ptr [esp],eax
 006CC9E3    mov         eax,dword ptr [esp]
 006CC9E6    test        eax,eax
>006CC9E8    je          006CC9EF
 006CC9EA    sub         eax,4
 006CC9ED    mov         eax,dword ptr [eax]
 006CC9EF    mov         edx,ebx
 006CC9F1    mov         ecx,eax
 006CC9F3    mov         eax,esi
 006CC9F5    xchg        eax,edx
 006CC9F6    call        @UStrDelete
 006CC9FB    mov         edx,dword ptr [ebx]
 006CC9FD    mov         eax,6CCA44;' - '
 006CCA02    call        Pos
 006CCA07    mov         esi,eax
 006CCA09    test        esi,esi
>006CCA0B    jle         006CCA1D
 006CCA0D    push        ebx
 006CCA0E    mov         ecx,esi
 006CCA10    dec         ecx
 006CCA11    mov         eax,dword ptr [ebx]
 006CCA13    mov         edx,1
 006CCA18    call        @UStrCopy
 006CCA1D    pop         edx
 006CCA1E    pop         esi
 006CCA1F    pop         ebx
 006CCA20    ret
end;*}

//006CCA4C
{*procedure TOtherWindow.FileName(?:?);
begin
 006CCA4C    push        ebp
 006CCA4D    mov         ebp,esp
 006CCA4F    push        0
 006CCA51    push        0
 006CCA53    push        0
 006CCA55    push        ebx
 006CCA56    push        esi
 006CCA57    mov         dword ptr [ebp-0C],edx
 006CCA5A    mov         ebx,eax
 006CCA5C    xor         eax,eax
 006CCA5E    push        ebp
 006CCA5F    push        6CCBD0
 006CCA64    push        dword ptr fs:[eax]
 006CCA67    mov         dword ptr fs:[eax],esp
 006CCA6A    lea         edx,[ebp-4]
 006CCA6D    mov         eax,ebx
 006CCA6F    call        TOtherWindow.GetText
 006CCA74    mov         edx,dword ptr [ebp-4]
 006CCA77    mov         eax,6CCBEC;' ['
 006CCA7C    call        Pos
 006CCA81    mov         ebx,eax
 006CCA83    test        ebx,ebx
>006CCA85    jle         006CCAA0
 006CCA87    mov         eax,dword ptr [ebp-4]
 006CCA8A    test        eax,eax
>006CCA8C    je          006CCA93
 006CCA8E    sub         eax,4
 006CCA91    mov         eax,dword ptr [eax]
 006CCA93    lea         edx,[ebp-4]
 006CCA96    mov         ecx,eax
 006CCA98    mov         eax,ebx
 006CCA9A    xchg        eax,edx
 006CCA9B    call        @UStrDelete
 006CCAA0    mov         edx,dword ptr [ebp-4]
 006CCAA3    mov         eax,6CCC00;' - '
 006CCAA8    call        Pos
 006CCAAD    mov         ebx,eax
 006CCAAF    test        ebx,ebx
>006CCAB1    jle         006CCB94
 006CCAB7    mov         esi,dword ptr [ebp-4]
 006CCABA    test        esi,esi
>006CCABC    je          006CCAC3
 006CCABE    sub         esi,4
 006CCAC1    mov         esi,dword ptr [esi]
 006CCAC3    lea         eax,[ebp-8]
 006CCAC6    push        eax
 006CCAC7    lea         edx,[ebx+3]
 006CCACA    mov         ecx,esi
 006CCACC    mov         eax,dword ptr [ebp-4]
 006CCACF    call        @UStrCopy
 006CCAD4    lea         eax,[ebp-4]
 006CCAD7    push        eax
 006CCAD8    mov         ecx,ebx
 006CCADA    dec         ecx
 006CCADB    mov         edx,1
 006CCAE0    mov         eax,dword ptr [ebp-4]
 006CCAE3    call        @UStrCopy
 006CCAE8    mov         eax,dword ptr [ebp-4]
 006CCAEB    mov         edx,6CCC14;'PIE'
 006CCAF0    call        @UStrEqual
>006CCAF5    je          006CCB06
 006CCAF7    mov         eax,dword ptr [ebp-4]
 006CCAFA    mov         edx,6CCC28;'GlovePIE'
 006CCAFF    call        @UStrEqual
>006CCB04    jne         006CCB26
 006CCB06    push        dword ptr [ebp-4]
 006CCB09    push        6CCC00;' - '
 006CCB0E    push        dword ptr [ebp-8]
 006CCB11    lea         eax,[ebp-4]
 006CCB14    mov         edx,3
 006CCB19    call        @UStrCatN
 006CCB1E    lea         eax,[ebp-8]
 006CCB21    call        @UStrClr
 006CCB26    mov         eax,dword ptr [ebp-4]
 006CCB29    call        006CC670
 006CCB2E    test        al,al
>006CCB30    je          006CCB3F
 006CCB32    mov         eax,dword ptr [ebp-0C]
 006CCB35    mov         edx,dword ptr [ebp-4]
 006CCB38    call        @UStrAsg
>006CCB3D    jmp         006CCBB5
 006CCB3F    mov         eax,dword ptr [ebp-8]
 006CCB42    call        006CC670
 006CCB47    test        al,al
>006CCB49    je          006CCB58
 006CCB4B    mov         eax,dword ptr [ebp-0C]
 006CCB4E    mov         edx,dword ptr [ebp-8]
 006CCB51    call        @UStrAsg
>006CCB56    jmp         006CCBB5
 006CCB58    mov         edx,dword ptr [ebp-4]
 006CCB5B    mov         eax,6CCC48;' '
 006CCB60    call        Pos
 006CCB65    test        eax,eax
>006CCB67    jle         006CCB87
 006CCB69    mov         edx,dword ptr [ebp-8]
 006CCB6C    mov         eax,6CCC48;' '
 006CCB71    call        Pos
 006CCB76    test        eax,eax
>006CCB78    jne         006CCB87
 006CCB7A    mov         eax,dword ptr [ebp-0C]
 006CCB7D    mov         edx,dword ptr [ebp-8]
 006CCB80    call        @UStrAsg
>006CCB85    jmp         006CCBB5
 006CCB87    mov         eax,dword ptr [ebp-0C]
 006CCB8A    mov         edx,dword ptr [ebp-4]
 006CCB8D    call        @UStrAsg
>006CCB92    jmp         006CCBB5
 006CCB94    mov         eax,dword ptr [ebp-4]
 006CCB97    call        006CC670
 006CCB9C    test        al,al
>006CCB9E    je          006CCBAD
 006CCBA0    mov         eax,dword ptr [ebp-0C]
 006CCBA3    mov         edx,dword ptr [ebp-4]
 006CCBA6    call        @UStrAsg
>006CCBAB    jmp         006CCBB5
 006CCBAD    mov         eax,dword ptr [ebp-0C]
 006CCBB0    call        @UStrClr
 006CCBB5    xor         eax,eax
 006CCBB7    pop         edx
 006CCBB8    pop         ecx
 006CCBB9    pop         ecx
 006CCBBA    mov         dword ptr fs:[eax],edx
 006CCBBD    push        6CCBD7
 006CCBC2    lea         eax,[ebp-8]
 006CCBC5    mov         edx,2
 006CCBCA    call        @UStrArrayClr
 006CCBCF    ret
>006CCBD0    jmp         @HandleFinally
>006CCBD5    jmp         006CCBC2
 006CCBD7    pop         esi
 006CCBD8    pop         ebx
 006CCBD9    mov         esp,ebp
 006CCBDB    pop         ebp
 006CCBDC    ret
end;*}

//006CCF94
procedure sub_006CCF94;
begin
{*
 006CCF94    push        ebx
 006CCF95    mov         ebx,81F6C4;gvar_0081F6C4:THashTable
 006CCF9A    mov         ecx,1
 006CCF9F    mov         edx,6CD20C;'Handle'
 006CCFA4    mov         eax,dword ptr [ebx]
 006CCFA6    call        THashTable.Add
 006CCFAB    mov         ecx,2
 006CCFB0    mov         edx,6CD228;'Title'
 006CCFB5    mov         eax,dword ptr [ebx]
 006CCFB7    call        THashTable.Add
 006CCFBC    mov         ecx,3
 006CCFC1    mov         edx,6CD240;'Class'
 006CCFC6    mov         eax,dword ptr [ebx]
 006CCFC8    call        THashTable.Add
 006CCFCD    mov         ecx,3
 006CCFD2    mov         edx,6CD258;'ClassName'
 006CCFD7    mov         eax,dword ptr [ebx]
 006CCFD9    call        THashTable.Add
 006CCFDE    mov         ecx,4
 006CCFE3    mov         edx,6CD278;'CaretScreenX'
 006CCFE8    mov         eax,dword ptr [ebx]
 006CCFEA    call        THashTable.Add
 006CCFEF    mov         ecx,5
 006CCFF4    mov         edx,6CD2A0;'CaretScreenY'
 006CCFF9    mov         eax,dword ptr [ebx]
 006CCFFB    call        THashTable.Add
 006CD000    mov         ecx,6
 006CD005    mov         edx,6CD2C8;'FontType'
 006CD00A    mov         eax,dword ptr [ebx]
 006CD00C    call        THashTable.Add
 006CD011    mov         ecx,7
 006CD016    mov         edx,6CD2E8;'FontHandle'
 006CD01B    mov         eax,dword ptr [ebx]
 006CD01D    call        THashTable.Add
 006CD022    mov         ecx,8
 006CD027    mov         edx,6CD30C;'FontName'
 006CD02C    mov         eax,dword ptr [ebx]
 006CD02E    call        THashTable.Add
 006CD033    mov         ecx,8
 006CD038    mov         edx,6CD32C;'Font'
 006CD03D    mov         eax,dword ptr [ebx]
 006CD03F    call        THashTable.Add
 006CD044    mov         ecx,9
 006CD049    mov         edx,6CD344;'Text'
 006CD04E    mov         eax,dword ptr [ebx]
 006CD050    call        THashTable.Add
 006CD055    mov         ecx,9
 006CD05A    mov         edx,6CD35C;'Caption'
 006CD05F    mov         eax,dword ptr [ebx]
 006CD061    call        THashTable.Add
 006CD066    mov         ecx,0A
 006CD06B    mov         edx,6CD378;'TextP'
 006CD070    mov         eax,dword ptr [ebx]
 006CD072    call        THashTable.Add
 006CD077    mov         ecx,0B
 006CD07C    mov         edx,6CD390;'Width'
 006CD081    mov         eax,dword ptr [ebx]
 006CD083    call        THashTable.Add
 006CD088    mov         ecx,0C
 006CD08D    mov         edx,6CD3A8;'Height'
 006CD092    mov         eax,dword ptr [ebx]
 006CD094    call        THashTable.Add
 006CD099    mov         ecx,0D
 006CD09E    mov         edx,6CD3C4;'Left'
 006CD0A3    mov         eax,dword ptr [ebx]
 006CD0A5    call        THashTable.Add
 006CD0AA    mov         ecx,0E
 006CD0AF    mov         edx,6CD3DC;'Top'
 006CD0B4    mov         eax,dword ptr [ebx]
 006CD0B6    call        THashTable.Add
 006CD0BB    mov         ecx,0F
 006CD0C0    mov         edx,6CD3F0;'ClientWidth'
 006CD0C5    mov         eax,dword ptr [ebx]
 006CD0C7    call        THashTable.Add
 006CD0CC    mov         ecx,10
 006CD0D1    mov         edx,6CD414;'ClientHeight'
 006CD0D6    mov         eax,dword ptr [ebx]
 006CD0D8    call        THashTable.Add
 006CD0DD    mov         ecx,11
 006CD0E2    mov         edx,6CD43C;'Unicode'
 006CD0E7    mov         eax,dword ptr [ebx]
 006CD0E9    call        THashTable.Add
 006CD0EE    mov         ecx,12
 006CD0F3    mov         edx,6CD458;'Enabled'
 006CD0F8    mov         eax,dword ptr [ebx]
 006CD0FA    call        THashTable.Add
 006CD0FF    mov         ecx,13
 006CD104    mov         edx,6CD474;'Visible'
 006CD109    mov         eax,dword ptr [ebx]
 006CD10B    call        THashTable.Add
 006CD110    mov         ecx,14
 006CD115    mov         edx,6CD490;'CanUndo'
 006CD11A    mov         eax,dword ptr [ebx]
 006CD11C    call        THashTable.Add
 006CD121    mov         ecx,15
 006CD126    mov         edx,6CD4AC;'DefaultFont'
 006CD12B    mov         eax,dword ptr [ebx]
 006CD12D    call        THashTable.Add
 006CD132    mov         ecx,16
 006CD137    mov         edx,6CD4D0;'SelectionFont'
 006CD13C    mov         eax,dword ptr [ebx]
 006CD13E    call        THashTable.Add
 006CD143    mov         ecx,17
 006CD148    mov         edx,6CD4F8;'ItemIndex'
 006CD14D    mov         eax,dword ptr [ebx]
 006CD14F    call        THashTable.Add
 006CD154    mov         ecx,18
 006CD159    mov         edx,6CD518;'Count'
 006CD15E    mov         eax,dword ptr [ebx]
 006CD160    call        THashTable.Add
 006CD165    mov         ecx,19
 006CD16A    mov         edx,6CD530;'IsMicrosoftWord'
 006CD16F    mov         eax,dword ptr [ebx]
 006CD171    call        THashTable.Add
 006CD176    mov         ecx,1A
 006CD17B    mov         edx,6CD55C;'IsNetscape'
 006CD180    mov         eax,dword ptr [ebx]
 006CD182    call        THashTable.Add
 006CD187    mov         ecx,1B
 006CD18C    mov         edx,6CD580;'IsRichEdit'
 006CD191    mov         eax,dword ptr [ebx]
 006CD193    call        THashTable.Add
 006CD198    mov         ecx,1C
 006CD19D    mov         edx,6CD5A4;'IsDelphi'
 006CD1A2    mov         eax,dword ptr [ebx]
 006CD1A4    call        THashTable.Add
 006CD1A9    mov         ecx,1D
 006CD1AE    mov         edx,6CD5C4;'Parent'
 006CD1B3    mov         eax,dword ptr [ebx]
 006CD1B5    call        THashTable.Add
 006CD1BA    mov         ecx,1E
 006CD1BF    mov         edx,6CD5E0;'BeforeDash'
 006CD1C4    mov         eax,dword ptr [ebx]
 006CD1C6    call        THashTable.Add
 006CD1CB    mov         ecx,1F
 006CD1D0    mov         edx,6CD604;'AfterDash'
 006CD1D5    mov         eax,dword ptr [ebx]
 006CD1D7    call        THashTable.Add
 006CD1DC    mov         ecx,20
 006CD1E1    mov         edx,6CD624;'AppName'
 006CD1E6    mov         eax,dword ptr [ebx]
 006CD1E8    call        THashTable.Add
 006CD1ED    mov         ecx,21
 006CD1F2    mov         edx,6CD640;'FileName'
 006CD1F7    mov         eax,dword ptr [ebx]
 006CD1F9    call        THashTable.Add
 006CD1FE    pop         ebx
 006CD1FF    ret
*}
end;

//006CD654
{*function sub_006CD654(?:?):?;
begin
 006CD654    push        ebp
 006CD655    mov         ebp,esp
 006CD657    add         esp,0FFFFFFF8
 006CD65A    push        ebx
 006CD65B    push        esi
 006CD65C    push        edi
 006CD65D    xor         edx,edx
 006CD65F    mov         dword ptr [ebp-8],edx
 006CD662    mov         dword ptr [ebp-4],eax
 006CD665    mov         eax,dword ptr [ebp-4]
 006CD668    call        @UStrAddRef
 006CD66D    xor         eax,eax
 006CD66F    push        ebp
 006CD670    push        6CD6FA
 006CD675    push        dword ptr fs:[eax]
 006CD678    mov         dword ptr fs:[eax],esp
 006CD67B    xor         ebx,ebx
 006CD67D    lea         eax,[ebp-8]
 006CD680    mov         edx,dword ptr [ebp-4]
 006CD683    call        @UStrLAsg
 006CD688    lea         eax,[ebp-8]
 006CD68B    mov         edx,6CD718;'Window'
 006CD690    call        004F9BD0
 006CD695    test        al,al
>006CD697    je          006CD6DF
 006CD699    lea         eax,[ebp-8]
 006CD69C    call        004F9D00
 006CD6A1    mov         esi,eax
 006CD6A3    lea         eax,[ebp-8]
 006CD6A6    mov         edx,6CD734;'.'
 006CD6AB    call        004F9BD0
 006CD6B0    test        al,al
>006CD6B2    je          006CD6DF
 006CD6B4    mov         eax,dword ptr [ebp-8]
 006CD6B7    call        006CDD30
 006CD6BC    mov         edi,eax
 006CD6BE    test        edi,edi
>006CD6C0    jl          006CD6DF
 006CD6C2    mov         dl,1
 006CD6C4    mov         eax,[006CCC4C];TWindowValue
 006CD6C9    call        TObject.Create;TWindowValue.Create
 006CD6CE    mov         ebx,eax
 006CD6D0    mov         dword ptr [ebx+1C],edi;TWindowValue.Item:Integer
 006CD6D3    test        esi,esi
>006CD6D5    jg          006CD6DC
 006CD6D7    mov         esi,1
 006CD6DC    mov         dword ptr [ebx+18],esi;TWindowValue.WindowNumber:Integer
 006CD6DF    xor         eax,eax
 006CD6E1    pop         edx
 006CD6E2    pop         ecx
 006CD6E3    pop         ecx
 006CD6E4    mov         dword ptr fs:[eax],edx
 006CD6E7    push        6CD701
 006CD6EC    lea         eax,[ebp-8]
 006CD6EF    mov         edx,2
 006CD6F4    call        @UStrArrayClr
 006CD6F9    ret
>006CD6FA    jmp         @HandleFinally
>006CD6FF    jmp         006CD6EC
 006CD701    mov         eax,ebx
 006CD703    pop         edi
 006CD704    pop         esi
 006CD705    pop         ebx
 006CD706    pop         ecx
 006CD707    pop         ecx
 006CD708    pop         ebp
 006CD709    ret
end;*}

//006CD738
function TWindowValue.CanSet:Boolean;
begin
{*
 006CD738    xor         eax,eax
 006CD73A    ret
*}
end;

//006CD73C
procedure TWindowValue.CreateClone;
begin
{*
 006CD73C    mov         dl,1
 006CD73E    mov         eax,[006CCC4C];TWindowValue
 006CD743    call        TObject.Create;TWindowValue.Create
 006CD748    ret
*}
end;

//006CD74C
procedure TWindowValue.FillClone(c:TExpression);
begin
{*
 006CD74C    push        ebx
 006CD74D    push        esi
 006CD74E    mov         esi,edx
 006CD750    mov         ebx,eax
 006CD752    mov         edx,esi
 006CD754    mov         eax,ebx
 006CD756    call        TExpression.FillClone
 006CD75B    mov         eax,esi
 006CD75D    mov         edx,dword ptr [ebx+1C];TWindowValue.Item:Integer
 006CD760    mov         dword ptr [eax+1C],edx
 006CD763    mov         edx,dword ptr [ebx+18];TWindowValue.WindowNumber:Integer
 006CD766    mov         dword ptr [eax+18],edx
 006CD769    pop         esi
 006CD76A    pop         ebx
 006CD76B    ret
*}
end;

//006CD76C
function TWindowValue.GetDataType:TDataType;
begin
{*
 006CD76C    mov         eax,dword ptr [eax+1C];TWindowValue.Item:Integer
 006CD76F    cmp         eax,21
>006CD772    ja          006CD80E
 006CD778    movzx       eax,byte ptr [eax+6CD786]
 006CD77F    jmp         dword ptr [eax*4+6CD7A8]
 006CD77F    db          0
 006CD77F    db          1
 006CD77F    db          2
 006CD77F    db          2
 006CD77F    db          3
 006CD77F    db          3
 006CD77F    db          4
 006CD77F    db          5
 006CD77F    db          6
 006CD77F    db          7
 006CD77F    db          7
 006CD77F    db          8
 006CD77F    db          8
 006CD77F    db          8
 006CD77F    db          8
 006CD77F    db          9
 006CD77F    db          9
 006CD77F    db          10
 006CD77F    db          10
 006CD77F    db          10
 006CD77F    db          10
 006CD77F    db          11
 006CD77F    db          11
 006CD77F    db          12
 006CD77F    db          13
 006CD77F    db          14
 006CD77F    db          14
 006CD77F    db          14
 006CD77F    db          14
 006CD77F    db          0
 006CD77F    db          2
 006CD77F    db          2
 006CD77F    db          2
 006CD77F    db          2
 006CD77F    dd          006CD80E
 006CD77F    dd          006CD7E4
 006CD77F    dd          006CD7E7
 006CD77F    dd          006CD7EA
 006CD77F    dd          006CD7ED
 006CD77F    dd          006CD7F0
 006CD77F    dd          006CD7F3
 006CD77F    dd          006CD7F6
 006CD77F    dd          006CD7F9
 006CD77F    dd          006CD7FC
 006CD77F    dd          006CD7FF
 006CD77F    dd          006CD802
 006CD77F    dd          006CD805
 006CD77F    dd          006CD808
 006CD77F    dd          006CD80B
 006CD7E4    mov         al,2
 006CD7E6    ret
 006CD7E7    mov         al,4
 006CD7E9    ret
 006CD7EA    mov         al,2
 006CD7EC    ret
 006CD7ED    mov         al,4
 006CD7EF    ret
 006CD7F0    mov         al,2
 006CD7F2    ret
 006CD7F3    mov         al,4
 006CD7F5    ret
 006CD7F6    mov         al,4
 006CD7F8    ret
 006CD7F9    mov         al,2
 006CD7FB    ret
 006CD7FC    mov         al,2
 006CD7FE    ret
 006CD7FF    mov         al,3
 006CD801    ret
 006CD802    mov         al,4
 006CD804    ret
 006CD805    mov         al,2
 006CD807    ret
 006CD808    mov         al,2
 006CD80A    ret
 006CD80B    mov         al,3
 006CD80D    ret
 006CD80E    xor         eax,eax
 006CD810    ret
*}
end;

//006CD814
{*procedure TWindowValue.GetString(?:?);
begin
 006CD814    push        ebx
 006CD815    push        esi
 006CD816    mov         esi,edx
 006CD818    mov         ebx,eax
 006CD81A    call        user32.GetForegroundWindow
 006CD81F    mov         edx,dword ptr ds:[81F6CC];gvar_0081F6CC:TOtherWindow
 006CD825    mov         dword ptr [edx+4],eax
 006CD828    mov         eax,dword ptr [ebx+1C];TWindowValue.Item:Integer
 006CD82B    cmp         eax,21
>006CD82E    ja          006CD939
 006CD834    movzx       eax,byte ptr [eax+6CD842]
 006CD83B    jmp         dword ptr [eax*4+6CD864]
 006CD83B    db          0
 006CD83B    db          0
 006CD83B    db          1
 006CD83B    db          6
 006CD83B    db          0
 006CD83B    db          0
 006CD83B    db          9
 006CD83B    db          0
 006CD83B    db          8
 006CD83B    db          1
 006CD83B    db          7
 006CD83B    db          0
 006CD83B    db          0
 006CD83B    db          0
 006CD83B    db          0
 006CD83B    db          0
 006CD83B    db          0
 006CD83B    db          0
 006CD83B    db          0
 006CD83B    db          0
 006CD83B    db          0
 006CD83B    db          10
 006CD83B    db          11
 006CD83B    db          0
 006CD83B    db          0
 006CD83B    db          0
 006CD83B    db          0
 006CD83B    db          0
 006CD83B    db          0
 006CD83B    db          0
 006CD83B    db          2
 006CD83B    db          3
 006CD83B    db          4
 006CD83B    db          5
 006CD83B    dd          006CD939
 006CD83B    dd          006CD894
 006CD83B    dd          006CD8A3
 006CD83B    dd          006CD8B2
 006CD83B    dd          006CD8C1
 006CD83B    dd          006CD8D0
 006CD83B    dd          006CD8DF
 006CD83B    dd          006CD8EE
 006CD83B    dd          006CD8FD
 006CD83B    dd          006CD90C
 006CD83B    dd          006CD91B
 006CD83B    dd          006CD92A
 006CD894    mov         edx,esi
 006CD896    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CD89B    call        TOtherWindow.GetText
 006CD8A0    pop         esi
 006CD8A1    pop         ebx
 006CD8A2    ret
 006CD8A3    mov         edx,esi
 006CD8A5    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CD8AA    call        TOtherWindow.BeforeDash
 006CD8AF    pop         esi
 006CD8B0    pop         ebx
 006CD8B1    ret
 006CD8B2    mov         edx,esi
 006CD8B4    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CD8B9    call        TOtherWindow.AfterDash
 006CD8BE    pop         esi
 006CD8BF    pop         ebx
 006CD8C0    ret
 006CD8C1    mov         edx,esi
 006CD8C3    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CD8C8    call        TOtherWindow.AppName
 006CD8CD    pop         esi
 006CD8CE    pop         ebx
 006CD8CF    ret
 006CD8D0    mov         edx,esi
 006CD8D2    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CD8D7    call        TOtherWindow.FileName
 006CD8DC    pop         esi
 006CD8DD    pop         ebx
 006CD8DE    ret
 006CD8DF    mov         edx,esi
 006CD8E1    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CD8E6    call        TOtherWindow.ClassName
 006CD8EB    pop         esi
 006CD8EC    pop         ebx
 006CD8ED    ret
 006CD8EE    mov         edx,esi
 006CD8F0    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CD8F5    call        TOtherWindow.GetTextP
 006CD8FA    pop         esi
 006CD8FB    pop         ebx
 006CD8FC    ret
 006CD8FD    mov         edx,esi
 006CD8FF    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CD904    call        TOtherWindow.FontName
 006CD909    pop         esi
 006CD90A    pop         ebx
 006CD90B    ret
 006CD90C    mov         edx,esi
 006CD90E    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CD913    call        TOtherWindow.FontType
 006CD918    pop         esi
 006CD919    pop         ebx
 006CD91A    ret
 006CD91B    mov         edx,esi
 006CD91D    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CD922    call        TOtherWindow.DefaultFont
 006CD927    pop         esi
 006CD928    pop         ebx
 006CD929    ret
 006CD92A    mov         edx,esi
 006CD92C    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CD931    call        TOtherWindow.SelectionFont
 006CD936    pop         esi
 006CD937    pop         ebx
 006CD938    ret
 006CD939    mov         edx,esi
 006CD93B    mov         eax,ebx
 006CD93D    call        TExpression.GetString
 006CD942    pop         esi
 006CD943    pop         ebx
 006CD944    ret
end;*}

//006CD948
function TWindowValue.GetUnits:TUnits;
begin
{*
 006CD948    mov         eax,dword ptr [eax+1C];TWindowValue.Item:Integer
 006CD94B    add         eax,0FFFFFFFC
 006CD94E    sub         eax,2
>006CD951    jb          006CD95B
 006CD953    add         eax,0FFFFFFFB
 006CD956    sub         eax,6
>006CD959    jae         006CD95E
 006CD95B    mov         al,0C
 006CD95D    ret
 006CD95E    xor         eax,eax
 006CD960    ret
*}
end;

//006CD964
procedure TWindowValue.GetValue;
begin
{*
 006CD964    push        ebx
 006CD965    push        esi
 006CD966    add         esp,0FFFFFFEC
 006CD969    mov         ebx,eax
 006CD96B    call        user32.GetForegroundWindow
 006CD970    mov         esi,eax
 006CD972    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CD977    mov         dword ptr [eax+4],esi
 006CD97A    mov         eax,dword ptr [ebx+1C];TWindowValue.Item:Integer
 006CD97D    cmp         eax,1D
>006CD980    ja          006CDC1A
 006CD986    jmp         dword ptr [eax*4+6CD98D]
 006CD986    dd          006CDC1A
 006CD986    dd          006CDA05
 006CD986    dd          006CDC1A
 006CD986    dd          006CDC1A
 006CD986    dd          006CDA1C
 006CD986    dd          006CDA37
 006CD986    dd          006CDC1A
 006CD986    dd          006CDA52
 006CD986    dd          006CDC1A
 006CD986    dd          006CDC1A
 006CD986    dd          006CDC1A
 006CD986    dd          006CDA73
 006CD986    dd          006CDA8E
 006CD986    dd          006CDAA9
 006CD986    dd          006CDAC4
 006CD986    dd          006CDADF
 006CD986    dd          006CDAFA
 006CD986    dd          006CDB15
 006CD986    dd          006CDB2D
 006CD986    dd          006CDB45
 006CD986    dd          006CDB5D
 006CD986    dd          006CDC1A
 006CD986    dd          006CDC1A
 006CD986    dd          006CDB75
 006CD986    dd          006CDB90
 006CD986    dd          006CDBC6
 006CD986    dd          006CDBDB
 006CD986    dd          006CDBF0
 006CD986    dd          006CDC05
 006CD986    dd          006CDBA8
 006CDA05    mov         dword ptr [esp+8],esi
 006CDA09    xor         eax,eax
 006CDA0B    mov         dword ptr [esp+0C],eax
 006CDA0F    fild        qword ptr [esp+8]
 006CDA13    fstp        qword ptr [esp]
 006CDA16    wait
>006CDA17    jmp         006CDC23
 006CDA1C    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDA21    call        TOtherWindow.CaretX
 006CDA26    mov         dword ptr [esp+10],eax
 006CDA2A    fild        dword ptr [esp+10]
 006CDA2E    fstp        qword ptr [esp]
 006CDA31    wait
>006CDA32    jmp         006CDC23
 006CDA37    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDA3C    call        TOtherWindow.CaretX
 006CDA41    mov         dword ptr [esp+10],eax
 006CDA45    fild        dword ptr [esp+10]
 006CDA49    fstp        qword ptr [esp]
 006CDA4C    wait
>006CDA4D    jmp         006CDC23
 006CDA52    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDA57    call        TOtherWindow.FontHandle
 006CDA5C    mov         dword ptr [esp+8],eax
 006CDA60    xor         eax,eax
 006CDA62    mov         dword ptr [esp+0C],eax
 006CDA66    fild        qword ptr [esp+8]
 006CDA6A    fstp        qword ptr [esp]
 006CDA6D    wait
>006CDA6E    jmp         006CDC23
 006CDA73    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDA78    call        TOtherWindow.GetWidth
 006CDA7D    mov         dword ptr [esp+10],eax
 006CDA81    fild        dword ptr [esp+10]
 006CDA85    fstp        qword ptr [esp]
 006CDA88    wait
>006CDA89    jmp         006CDC23
 006CDA8E    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDA93    call        TOtherWindow.GetHeight
 006CDA98    mov         dword ptr [esp+10],eax
 006CDA9C    fild        dword ptr [esp+10]
 006CDAA0    fstp        qword ptr [esp]
 006CDAA3    wait
>006CDAA4    jmp         006CDC23
 006CDAA9    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDAAE    call        TOtherWindow.GetLeft
 006CDAB3    mov         dword ptr [esp+10],eax
 006CDAB7    fild        dword ptr [esp+10]
 006CDABB    fstp        qword ptr [esp]
 006CDABE    wait
>006CDABF    jmp         006CDC23
 006CDAC4    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDAC9    call        TOtherWindow.GetTop
 006CDACE    mov         dword ptr [esp+10],eax
 006CDAD2    fild        dword ptr [esp+10]
 006CDAD6    fstp        qword ptr [esp]
 006CDAD9    wait
>006CDADA    jmp         006CDC23
 006CDADF    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDAE4    call        TOtherWindow.GetClientWidth
 006CDAE9    mov         dword ptr [esp+10],eax
 006CDAED    fild        dword ptr [esp+10]
 006CDAF1    fstp        qword ptr [esp]
 006CDAF4    wait
>006CDAF5    jmp         006CDC23
 006CDAFA    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDAFF    call        TOtherWindow.GetClientHeight
 006CDB04    mov         dword ptr [esp+10],eax
 006CDB08    fild        dword ptr [esp+10]
 006CDB0C    fstp        qword ptr [esp]
 006CDB0F    wait
>006CDB10    jmp         006CDC23
 006CDB15    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDB1A    call        TOtherWindow.Unicode
 006CDB1F    call        00686074
 006CDB24    fstp        qword ptr [esp]
 006CDB27    wait
>006CDB28    jmp         006CDC23
 006CDB2D    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDB32    call        TOtherWindow.GetEnabled
 006CDB37    call        00686074
 006CDB3C    fstp        qword ptr [esp]
 006CDB3F    wait
>006CDB40    jmp         006CDC23
 006CDB45    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDB4A    call        TOtherWindow.GetVisible
 006CDB4F    call        00686074
 006CDB54    fstp        qword ptr [esp]
 006CDB57    wait
>006CDB58    jmp         006CDC23
 006CDB5D    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDB62    call        TOtherWindow.CanUndo
 006CDB67    call        00686074
 006CDB6C    fstp        qword ptr [esp]
 006CDB6F    wait
>006CDB70    jmp         006CDC23
 006CDB75    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDB7A    call        TOtherWindow.GetIndex
 006CDB7F    mov         dword ptr [esp+10],eax
 006CDB83    fild        dword ptr [esp+10]
 006CDB87    fstp        qword ptr [esp]
 006CDB8A    wait
>006CDB8B    jmp         006CDC23
 006CDB90    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDB95    call        TOtherWindow.GetCount
 006CDB9A    mov         dword ptr [esp+10],eax
 006CDB9E    fild        dword ptr [esp+10]
 006CDBA2    fstp        qword ptr [esp]
 006CDBA5    wait
>006CDBA6    jmp         006CDC23
 006CDBA8    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDBAD    call        TOtherWindow.ParentHandle
 006CDBB2    mov         dword ptr [esp+8],eax
 006CDBB6    xor         eax,eax
 006CDBB8    mov         dword ptr [esp+0C],eax
 006CDBBC    fild        qword ptr [esp+8]
 006CDBC0    fstp        qword ptr [esp]
 006CDBC3    wait
>006CDBC4    jmp         006CDC23
 006CDBC6    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDBCB    call        TOtherWindow.IsMicrosoftWord
 006CDBD0    call        00686074
 006CDBD5    fstp        qword ptr [esp]
 006CDBD8    wait
>006CDBD9    jmp         006CDC23
 006CDBDB    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDBE0    call        TOtherWindow.IsNetscape
 006CDBE5    call        00686074
 006CDBEA    fstp        qword ptr [esp]
 006CDBED    wait
>006CDBEE    jmp         006CDC23
 006CDBF0    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDBF5    call        TOtherWindow.IsRichEdit
 006CDBFA    call        00686074
 006CDBFF    fstp        qword ptr [esp]
 006CDC02    wait
>006CDC03    jmp         006CDC23
 006CDC05    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDC0A    call        TOtherWindow.IsDelphi
 006CDC0F    call        00686074
 006CDC14    fstp        qword ptr [esp]
 006CDC17    wait
>006CDC18    jmp         006CDC23
 006CDC1A    xor         eax,eax
 006CDC1C    mov         dword ptr [esp],eax
 006CDC1F    mov         dword ptr [esp+4],eax
 006CDC23    fld         qword ptr [esp]
 006CDC26    add         esp,14
 006CDC29    pop         esi
 006CDC2A    pop         ebx
 006CDC2B    ret
*}
end;

//006CDC2C
function TWindowValue.SetValue(NewValue:Double):Boolean;
begin
{*
 006CDC2C    push        ebp
 006CDC2D    mov         ebp,esp
 006CDC2F    push        ebx
 006CDC30    mov         ebx,eax
 006CDC32    call        user32.GetForegroundWindow
 006CDC37    mov         edx,dword ptr ds:[81F6CC];gvar_0081F6CC:TOtherWindow
 006CDC3D    mov         dword ptr [edx+4],eax
 006CDC40    mov         eax,dword ptr [ebx+1C];TWindowValue.Item:Integer
 006CDC43    sub         eax,0B
>006CDC46    je          006CDC7F
 006CDC48    dec         eax
>006CDC49    je          006CDC95
 006CDC4B    dec         eax
>006CDC4C    je          006CDC53
 006CDC4E    dec         eax
>006CDC4F    je          006CDC69
>006CDC51    jmp         006CDCA9
 006CDC53    fld         qword ptr [ebp+8]
 006CDC56    call        @ROUND
 006CDC5B    mov         edx,eax
 006CDC5D    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDC62    call        TOtherWindow.SetLeft
>006CDC67    jmp         006CDCA9
 006CDC69    fld         qword ptr [ebp+8]
 006CDC6C    call        @ROUND
 006CDC71    mov         edx,eax
 006CDC73    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDC78    call        TOtherWindow.SetTop
>006CDC7D    jmp         006CDCA9
 006CDC7F    fld         qword ptr [ebp+8]
 006CDC82    call        @ROUND
 006CDC87    mov         edx,eax
 006CDC89    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDC8E    call        TOtherWindow.SetWidth
>006CDC93    jmp         006CDCA9
 006CDC95    fld         qword ptr [ebp+8]
 006CDC98    call        @ROUND
 006CDC9D    mov         edx,eax
 006CDC9F    mov         eax,[0081F6CC];gvar_0081F6CC:TOtherWindow
 006CDCA4    call        TOtherWindow.SetHeight
 006CDCA9    xor         eax,eax
 006CDCAB    pop         ebx
 006CDCAC    pop         ebp
 006CDCAD    ret         8
*}
end;

//006CDCB0
{*procedure TWindowValue.ToString(?:?);
begin
 006CDCB0    push        ebp
 006CDCB1    mov         ebp,esp
 006CDCB3    push        0
 006CDCB5    push        ebx
 006CDCB6    push        esi
 006CDCB7    mov         esi,edx
 006CDCB9    mov         ebx,eax
 006CDCBB    xor         eax,eax
 006CDCBD    push        ebp
 006CDCBE    push        6CDCF9
 006CDCC3    push        dword ptr fs:[eax]
 006CDCC6    mov         dword ptr fs:[eax],esp
 006CDCC9    lea         edx,[ebp-4]
 006CDCCC    mov         eax,dword ptr [ebx+1C];TWindowValue.Item:Integer
 006CDCCF    call        IntToStr
 006CDCD4    mov         ecx,dword ptr [ebp-4]
 006CDCD7    mov         eax,esi
 006CDCD9    mov         edx,6CDD14;'Window.'
 006CDCDE    call        @UStrCat3
 006CDCE3    xor         eax,eax
 006CDCE5    pop         edx
 006CDCE6    pop         ecx
 006CDCE7    pop         ecx
 006CDCE8    mov         dword ptr fs:[eax],edx
 006CDCEB    push        6CDD00
 006CDCF0    lea         eax,[ebp-4]
 006CDCF3    call        @UStrClr
 006CDCF8    ret
>006CDCF9    jmp         @HandleFinally
>006CDCFE    jmp         006CDCF0
 006CDD00    pop         esi
 006CDD01    pop         ebx
 006CDD02    pop         ecx
 006CDD03    pop         ebp
 006CDD04    ret
end;*}

//006CDD24
procedure sub_006CDD24;
begin
{*
 006CDD24    ret
*}
end;

//006CDD28
procedure sub_006CDD28;
begin
{*
 006CDD28    ret
*}
end;

//006CDD2C
{*function sub_006CDD2C:?;
begin
 006CDD2C    mov         al,1
 006CDD2E    ret
end;*}

//006CDD30
{*function sub_006CDD30(?:UnicodeString):?;
begin
 006CDD30    push        ebp
 006CDD31    mov         ebp,esp
 006CDD33    push        ecx
 006CDD34    push        ebx
 006CDD35    mov         dword ptr [ebp-4],eax
 006CDD38    mov         eax,dword ptr [ebp-4]
 006CDD3B    call        @UStrAddRef
 006CDD40    xor         eax,eax
 006CDD42    push        ebp
 006CDD43    push        6CDD73
 006CDD48    push        dword ptr fs:[eax]
 006CDD4B    mov         dword ptr fs:[eax],esp
 006CDD4E    mov         edx,dword ptr [ebp-4]
 006CDD51    mov         eax,[0081F6C4];gvar_0081F6C4:THashTable
 006CDD56    call        THashTable.Get
 006CDD5B    mov         ebx,eax
 006CDD5D    xor         eax,eax
 006CDD5F    pop         edx
 006CDD60    pop         ecx
 006CDD61    pop         ecx
 006CDD62    mov         dword ptr fs:[eax],edx
 006CDD65    push        6CDD7A
 006CDD6A    lea         eax,[ebp-4]
 006CDD6D    call        @UStrClr
 006CDD72    ret
>006CDD73    jmp         @HandleFinally
>006CDD78    jmp         006CDD6A
 006CDD7A    mov         eax,ebx
 006CDD7C    pop         ebx
 006CDD7D    pop         ecx
 006CDD7E    pop         ebp
 006CDD7F    ret
end;*}

//006CDD80
{*procedure sub_006CDD80(?:?; ?:?);
begin
 006CDD80    push        ebx
 006CDD81    push        esi
 006CDD82    mov         esi,edx
 006CDD84    mov         ebx,eax
 006CDD86    mov         ecx,esi
 006CDD88    mov         edx,ebx
 006CDD8A    mov         eax,[0081F6C4];gvar_0081F6C4:THashTable
 006CDD8F    call        THashTable.Get
 006CDD94    pop         esi
 006CDD95    pop         ebx
 006CDD96    ret
end;*}

//006CDD98
{*function sub_006CDD98:?;
begin
 006CDD98    push        ebp
 006CDD99    mov         ebp,esp
 006CDD9B    push        0
 006CDD9D    push        ebx
 006CDD9E    push        esi
 006CDD9F    xor         eax,eax
 006CDDA1    push        ebp
 006CDDA2    push        6CDDFC
 006CDDA7    push        dword ptr fs:[eax]
 006CDDAA    mov         dword ptr fs:[eax],esp
 006CDDAD    mov         dl,1
 006CDDAF    mov         eax,[0043C7BC];TStringList
 006CDDB4    call        TStringList.Create;TStringList.Create
 006CDDB9    mov         esi,eax
 006CDDBB    mov         dl,1
 006CDDBD    mov         eax,esi
 006CDDBF    call        TStringList.SetSorted
 006CDDC4    xor         ebx,ebx
 006CDDC6    lea         edx,[ebp-4]
 006CDDC9    mov         eax,ebx
 006CDDCB    call        006CDD80
 006CDDD0    cmp         dword ptr [ebp-4],0
>006CDDD4    je          006CDDE0
 006CDDD6    mov         edx,dword ptr [ebp-4]
 006CDDD9    mov         eax,esi
 006CDDDB    mov         ecx,dword ptr [eax]
 006CDDDD    call        dword ptr [ecx+38];TStringList.Add
 006CDDE0    inc         ebx
 006CDDE1    cmp         ebx,22
>006CDDE4    jne         006CDDC6
 006CDDE6    xor         eax,eax
 006CDDE8    pop         edx
 006CDDE9    pop         ecx
 006CDDEA    pop         ecx
 006CDDEB    mov         dword ptr fs:[eax],edx
 006CDDEE    push        6CDE03
 006CDDF3    lea         eax,[ebp-4]
 006CDDF6    call        @UStrClr
 006CDDFB    ret
>006CDDFC    jmp         @HandleFinally
>006CDE01    jmp         006CDDF3
 006CDE03    mov         eax,esi
 006CDE05    pop         esi
 006CDE06    pop         ebx
 006CDE07    pop         ecx
 006CDE08    pop         ebp
 006CDE09    ret
end;*}

//006CDE0C
{*function sub_006CDE0C(?:?):?;
begin
 006CDE0C    push        ebp
 006CDE0D    mov         ebp,esp
 006CDE0F    push        ecx
 006CDE10    push        ebx
 006CDE11    mov         dword ptr [ebp-4],eax
 006CDE14    mov         eax,dword ptr [ebp-4]
 006CDE17    call        @UStrAddRef
 006CDE1C    xor         eax,eax
 006CDE1E    push        ebp
 006CDE1F    push        6CDE74
 006CDE24    push        dword ptr fs:[eax]
 006CDE27    mov         dword ptr fs:[eax],esp
 006CDE2A    lea         eax,[ebp-4]
 006CDE2D    mov         edx,6CDE90;'Window'
 006CDE32    call        004F9BD0
 006CDE37    test        al,al
>006CDE39    jne         006CDE3F
 006CDE3B    xor         ebx,ebx
>006CDE3D    jmp         006CDE5E
 006CDE3F    lea         eax,[ebp-4]
 006CDE42    call        004F9D00
 006CDE47    lea         eax,[ebp-4]
 006CDE4A    mov         edx,6CDEAC;'.'
 006CDE4F    call        004F9BD0
 006CDE54    test        al,al
>006CDE56    jne         006CDE5C
 006CDE58    xor         ebx,ebx
>006CDE5A    jmp         006CDE5E
 006CDE5C    mov         bl,1
 006CDE5E    xor         eax,eax
 006CDE60    pop         edx
 006CDE61    pop         ecx
 006CDE62    pop         ecx
 006CDE63    mov         dword ptr fs:[eax],edx
 006CDE66    push        6CDE7B
 006CDE6B    lea         eax,[ebp-4]
 006CDE6E    call        @UStrClr
 006CDE73    ret
>006CDE74    jmp         @HandleFinally
>006CDE79    jmp         006CDE6B
 006CDE7B    mov         eax,ebx
 006CDE7D    pop         ebx
 006CDE7E    pop         ecx
 006CDE7F    pop         ebp
 006CDE80    ret
end;*}

Initialization
//00782750
{*
 00782750    push        ebp
 00782751    mov         ebp,esp
 00782753    push        ebx
 00782754    push        esi
 00782755    push        edi
 00782756    sub         dword ptr ds:[81F6C8],1
>0078275D    jae         007827C5
 0078275F    xor         edx,edx
 00782761    push        ebp
 00782762    push        7827AA
 00782767    push        dword ptr fs:[edx]
 0078276A    mov         dword ptr fs:[edx],esp
 0078276D    mov         eax,7827D8;'Initializing PieWIndow'
 00782772    call        004FA5FC
 00782777    mov         dl,1
 00782779    mov         eax,[0067D4A4];THashTable
 0078277E    call        THashTable.Create;THashTable.Create
 00782783    mov         [0081F6C4],eax;gvar_0081F6C4:THashTable
 00782788    call        006CCF94
 0078278D    xor         ecx,ecx
 0078278F    mov         dl,1
 00782791    mov         eax,[006C9748];TOtherWindow
 00782796    call        TOtherWindow.Create;TOtherWindow.Create
 0078279B    mov         [0081F6CC],eax;gvar_0081F6CC:TOtherWindow
 007827A0    xor         eax,eax
 007827A2    pop         edx
 007827A3    pop         ecx
 007827A4    pop         ecx
 007827A5    mov         dword ptr fs:[eax],edx
>007827A8    jmp         007827C5
>007827AA    jmp         @HandleOnException
 007827AF    dd          1
 007827B3    dd          00418C04;Exception
 007827B7    dd          007827BB
 007827BB    call        004FA644
 007827C0    call        @DoneExcept
 007827C5    pop         edi
 007827C6    pop         esi
 007827C7    pop         ebx
 007827C8    pop         ebp
 007827C9    ret
*}
Finalization
//006CDEB0
{*
 006CDEB0    push        ebp
 006CDEB1    mov         ebp,esp
 006CDEB3    push        ebx
 006CDEB4    push        esi
 006CDEB5    push        edi
 006CDEB6    inc         dword ptr ds:[81F6C8]
>006CDEBC    jne         006CDF12
 006CDEBE    xor         edx,edx
 006CDEC0    push        ebp
 006CDEC1    push        6CDEF7
 006CDEC6    push        dword ptr fs:[edx]
 006CDEC9    mov         dword ptr fs:[edx],esp
 006CDECC    mov         eax,6CDF24;'Finalizing PieWindow'
 006CDED1    call        004FA5FC
 006CDED6    mov         eax,[0081F6C4];gvar_0081F6C4:THashTable
 006CDEDB    xor         edx,edx
 006CDEDD    mov         dword ptr ds:[81F6C4],edx;gvar_0081F6C4:THashTable
 006CDEE3    call        TObject.Free
 006CDEE8    call        006CDD28
 006CDEED    xor         eax,eax
 006CDEEF    pop         edx
 006CDEF0    pop         ecx
 006CDEF1    pop         ecx
 006CDEF2    mov         dword ptr fs:[eax],edx
>006CDEF5    jmp         006CDF12
>006CDEF7    jmp         @HandleOnException
 006CDEFC    dd          1
 006CDF00    dd          00418C04;Exception
 006CDF04    dd          006CDF08
 006CDF08    call        004FA644
 006CDF0D    call        @DoneExcept
 006CDF12    pop         edi
 006CDF13    pop         esi
 006CDF14    pop         ebx
 006CDF15    pop         ebp
 006CDF16    ret
*}
end.