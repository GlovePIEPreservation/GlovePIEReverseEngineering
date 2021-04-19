//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit34;

interface

uses
  SysUtils, Classes, TNTForms, Buttons, Graphics, System;

type
  TTntForm = class(TForm)
  end;
  TButtonLayout = (blGlyphLeft, blGlyphRight, blGlyphTop, blGlyphBottom);
  TButtonState = (bsUp, bsDisabled, bsDown, bsExclusive);
  TButtonStyle = (bsAutoDetect, bsWin31, bsNew);
  TBitBtnActionLink = class(TControlActionLink)
  published
    constructor Create;//004F72B8
  public
    FClient:TBitBtn;//f20
    FImageIndex:Integer;//f24
    procedure AssignClient(AClient:TObject); virtual;//v0//004F7294
    constructor Create; virtual;//v14//004F72B8
    function IsImageIndexLinked:Boolean; virtual;//v3C//004F72F4
    procedure SetImageIndex(Value:Integer); virtual;//v6C//004F73DC
    function IsGlyphLinked(Index:TImageIndex):Boolean;//004F7318
  end;
  TBitBtnKind = (bkCustom, bkOK, bkCancel, bkHelp, bkYes, bkNo, bkClose, bkAbort, bkRetry, bkIgnore, bkAll);
  TBitBtn = class(TCustomButton)
  published
    procedure Click;//004F67C4
    destructor Destroy();//004F6738
    constructor Create;//004F6680
  public
    FCanvas:TCanvas;//f2C8
    FGlyph:TObject;//f2CC
    FStyle:TButtonStyle;//f2D0
    FKind:TBitBtnKind;//f2D1
    FLayout:TButtonLayout;//f2D2
    FSpacing:Integer;//f2D4
    FMargin:Integer;//f2D8
    IsFocused:Boolean;//f2DC
    FModifiedGlyph:Boolean;//f2DD
    FMouseInControl:Boolean;//f2DE
    destructor Destroy(); virtual;//004F6738
    constructor Create; virtual;//v2C//004F6680
    procedure CreateHandle; virtual;//vA8//004F6774
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//004F67A0
    procedure SetButtonStyle(ADefault:Boolean); virtual;//vF4//004F67B0
    procedure WMLButtonDblClk(var Message:TWMLButtonDblClk); message WM_LBUTTONDBLCLK;//004F6D1C
    procedure CMEnabledChanged(var Message:TMessage); message CM_ENABLEDCHANGED;//004F6D04
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//004F6CEC
    procedure CMMouseEnter(var Message:TMessage); message CM_MOUSEENTER;//004F721C
    procedure CMMouseLeave(var Message:TMessage); message CM_MOUSELEAVE;//004F7258
    procedure CNDrawItem(var Message:TWMDrawItem); dynamic;//004F6844
    procedure CNMeasureItem(var Message:TWMMeasureItem); dynamic;//004F6834
    procedure GetPalette; dynamic;//004F6D3C
    procedure sub_0048751C; dynamic;//004F728C
    procedure Click; dynamic;//004F67C4
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean); dynamic;//004F7124
    procedure DrawItem(const DrawItemStruct:TDrawItemStruct);//004F6850
    procedure SetGlyph(Value:TBitmap);//004F6D50
    function GetGlyph:TBitmap;//004F6D74
    procedure GlyphChanged(Sender:TObject);//004F6D80
    procedure InternalCopyImage(Image:TBitmap; ImageList:TCustomImageList; Index:Integer);//004F6D8C
    function IsCustom(Value:Boolean):Boolean;//004F6E14
    procedure SetStyle(Value:TButtonStyle);//004F6E50
    procedure SetKind(Value:TBitBtnKind);//004F6E70
    function IsCustomCaption(Value:TCaption):Boolean;//004F6F7C
    function GetKind:TBitBtnKind;//004F6FF4
    procedure SetLayout(Value:TButtonLayout);//004F7064
    function GetNumGlyphs:TNumGlyphs;//004F7084
    procedure SetNumGlyphs(Value:TNumGlyphs);//004F7090
    procedure SetSpacing(Value:Integer);//004F70C0
    procedure SetMargin(Value:Integer);//004F70E0
    procedure CopyImage(ImageList:TCustomImageList; Index:Integer);//004F7104
  end;
  TGlyphList = class(TImageList)
  published
    function AddMasked(Image:TBitmap; MaskColor:TColor):Integer;//004F5518
    procedure Delete(Index:Integer);//004F5544
    constructor CreateSize(AHeight:Integer);//004F5448
    destructor Destroy();//004F549C
  public
    Used:TBits;//f90
    FCount:Integer;//f94
    destructor Destroy(); virtual;//004F549C
    function AllocateIndex:Integer;//004F54CC
  end;
  TGlyphCache = class(TObject)
  published
    procedure ReturnList(List:TGlyphList);//004F5648
    function Empty:Boolean;//004F5670
    function GetList(AWidth:Integer; AHeight:Integer):TGlyphList;//004F55E8
    constructor Create();//004F5574
    destructor Destroy();//004F55B8
  public
    GlyphLists:TList;//f4
  end;
  TButtonGlyph = class(TObject)
  published
    function Draw(Canvas:TCanvas; Client:TRect; BiDiFlags:Integer; Transparent:Boolean; State:TButtonState; Spacing:Integer; Margin:Integer; Layout:TButtonLayout; Caption:string; Offset:TPoint):TRect;//004F660C
    destructor Destroy();//004F5714
    constructor Create();//004F567C
  public
    FOriginal:TBitmap;//f4
    FGlyphList:TGlyphList;//f8
    FIndexs:?;//fC
    FTransparentColor:TColor;//f1C
    FNumGlyphs:TNumGlyphs;//f20
    FPaintOnGlass:Boolean;//f21
    FThemeDetails:TThemedElementDetails;//f24
    FThemeElement:TThemedElement;//f30
    FThemesEnabled:Boolean;//f31
    FOnChange:TNotifyEvent;//f38
    procedure Invalidate;//004F5770
    procedure GlyphChanged(Sender:TObject);//004F57B4
    procedure SetGlyph(Value:TBitmap);//004F57E4
    procedure SetNumGlyphs(Value:TNumGlyphs);//004F585C
    function CreateButtonGlyph(State:TButtonState):Integer;//004F5884
    procedure DrawButtonGlyph(Canvas:TCanvas; const GlyphPos:TPoint; State:TButtonState; Transparent:Boolean);//004F5E58
    procedure DrawButtonText(Canvas:TCanvas; const Caption:UnicodeString; TextBounds:TRect; State:TButtonState; Flags:LongInt);//004F61B4
    procedure CalcButtonLayout(Canvas:TCanvas; const Client:TRect; const Offset:TPoint; const Caption:UnicodeString; Layout:TButtonLayout; Margin:Integer; Spacing:Integer; var GlyphPos:TPoint; var TextBounds:TRect; BiDiFlags:LongInt);//004F6280
  end;
    function DrawButtonFace(Canvas:TCanvas; const Client:TRect; BevelWidth:Integer; Style:TButtonStyle; IsRounded:Boolean; IsDown:Boolean; IsFocused:Boolean):TRect;//004F4A14
    function GetBitBtnGlyph(Kind:TBitBtnKind):TBitmap;//004F4C70
    procedure DoDrawText(DC:HDC; const Text:UnicodeString; var TextRect:TRect; TextFlags:Cardinal);//004F602C
    procedure CreateHandle;//004F6774
    procedure CreateParams(var Params:TCreateParams);//004F67A0
    procedure SetButtonStyle(ADefault:Boolean);//004F67B0
    procedure CNMeasureItem(var Message:TWMMeasureItem);//004F6834
    procedure CNDrawItem(var Message:TWMDrawItem);//004F6844
    procedure CMFontChanged(var Message:TMessage);//004F6CEC
    procedure CMEnabledChanged(var Message:TMessage);//004F6D04
    procedure WMLButtonDblClk(var Message:TWMLButtonDblClk);//004F6D1C
    procedure GetPalette;//004F6D3C
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean);//004F7124
    procedure DestroyLocals;//004F7200
    procedure CMMouseEnter(var Message:TMessage);//004F721C
    procedure CMMouseLeave(var Message:TMessage);//004F7258
    procedure sub_0048751C;//004F728C
    procedure AssignClient(AClient:TObject);//004F7294
    function IsImageIndexLinked:Boolean;//004F72F4
    procedure SetImageIndex(Value:Integer);//004F73DC

implementation

//004F4A14
function DrawButtonFace(Canvas:TCanvas; const Client:TRect; BevelWidth:Integer; Style:TButtonStyle; IsRounded:Boolean; IsDown:Boolean; IsFocused:Boolean):TRect;
begin
{*
 004F4A14    push        ebp
 004F4A15    mov         ebp,esp
 004F4A17    add         esp,0FFFFFFC4
 004F4A1A    push        ebx
 004F4A1B    push        esi
 004F4A1C    push        edi
 004F4A1D    mov         dword ptr [ebp-4],ecx
 004F4A20    mov         esi,edx
 004F4A22    mov         ebx,eax
 004F4A24    mov         eax,dword ptr [ebp+18]
 004F4A27    test        al,al
>004F4A29    jne         004F4A36
 004F4A2B    mov         edx,dword ptr ds:[78D264];^NewStyleControls:Boolean
 004F4A31    cmp         byte ptr [edx],0
>004F4A34    jne         004F4A3E
 004F4A36    cmp         al,2
>004F4A38    je          004F4A3E
 004F4A3A    xor         eax,eax
>004F4A3C    jmp         004F4A40
 004F4A3E    mov         al,1
 004F4A40    push        esi
 004F4A41    lea         edi,[ebp-24]
 004F4A44    movs        dword ptr [edi],dword ptr [esi]
 004F4A45    movs        dword ptr [edi],dword ptr [esi]
 004F4A46    movs        dword ptr [edi],dword ptr [esi]
 004F4A47    movs        dword ptr [edi],dword ptr [esi]
 004F4A48    pop         esi
 004F4A49    test        al,al
>004F4A4B    je          004F4AF3
 004F4A51    mov         edx,0FF00000F
 004F4A56    mov         eax,dword ptr [ebx+48]
 004F4A59    call        TBrush.SetColor
 004F4A5E    xor         edx,edx
 004F4A60    mov         eax,dword ptr [ebx+48]
 004F4A63    call        TBrush.SetStyle
 004F4A68    mov         eax,ebx
 004F4A6A    call        TCanvas.GetHandle
 004F4A6F    mov         ebx,eax
 004F4A71    cmp         byte ptr [ebp+10],0
>004F4A75    je          004F4AB5
 004F4A77    push        3
 004F4A79    push        8
 004F4A7B    lea         eax,[ebp-24]
 004F4A7E    push        eax
 004F4A7F    push        ebx
 004F4A80    call        user32.DrawEdge
 004F4A85    push        0C
 004F4A87    push        2
 004F4A89    lea         eax,[ebp-24]
 004F4A8C    push        eax
 004F4A8D    push        ebx
 004F4A8E    call        user32.DrawEdge
 004F4A93    dec         dword ptr [ebp-18]
 004F4A96    dec         dword ptr [ebp-1C]
 004F4A99    inc         dword ptr [ebp-20]
 004F4A9C    inc         dword ptr [ebp-24]
 004F4A9F    push        803
 004F4AA4    push        2
 004F4AA6    lea         eax,[ebp-24]
 004F4AA9    push        eax
 004F4AAA    push        ebx
 004F4AAB    call        user32.DrawEdge
>004F4AB0    jmp         004F4C36
 004F4AB5    push        0C
 004F4AB7    push        1
 004F4AB9    lea         eax,[ebp-24]
 004F4ABC    push        eax
 004F4ABD    push        ebx
 004F4ABE    call        user32.DrawEdge
 004F4AC3    dec         dword ptr [ebp-18]
 004F4AC6    dec         dword ptr [ebp-1C]
 004F4AC9    push        3
 004F4ACB    push        4
 004F4ACD    lea         eax,[ebp-24]
 004F4AD0    push        eax
 004F4AD1    push        ebx
 004F4AD2    call        user32.DrawEdge
 004F4AD7    inc         dword ptr [ebp-20]
 004F4ADA    inc         dword ptr [ebp-24]
 004F4ADD    push        80C
 004F4AE2    push        4
 004F4AE4    lea         eax,[ebp-24]
 004F4AE7    push        eax
 004F4AE8    push        ebx
 004F4AE9    call        user32.DrawEdge
>004F4AEE    jmp         004F4C36
 004F4AF3    mov         edx,0FF000006
 004F4AF8    mov         eax,dword ptr [ebx+44]
 004F4AFB    call        TPen.SetColor
 004F4B00    mov         edx,0FF00000F
 004F4B05    mov         eax,dword ptr [ebx+48]
 004F4B08    call        TBrush.SetColor
 004F4B0D    xor         edx,edx
 004F4B0F    mov         eax,dword ptr [ebx+48]
 004F4B12    call        TBrush.SetStyle
 004F4B17    mov         eax,dword ptr [ebp-1C]
 004F4B1A    push        eax
 004F4B1B    mov         eax,dword ptr [ebp-18]
 004F4B1E    push        eax
 004F4B1F    mov         ecx,dword ptr [ebp-20]
 004F4B22    mov         edx,dword ptr [ebp-24]
 004F4B25    mov         eax,ebx
 004F4B27    mov         edi,dword ptr [eax]
 004F4B29    call        dword ptr [edi+7C]
 004F4B2C    cmp         byte ptr [ebp+14],0
>004F4B30    je          004F4B7E
 004F4B32    push        0FF00000F
 004F4B37    mov         ecx,dword ptr [ebp-20]
 004F4B3A    mov         edx,dword ptr [ebp-24]
 004F4B3D    mov         eax,ebx
 004F4B3F    mov         edi,dword ptr [eax]
 004F4B41    call        dword ptr [edi+20]
 004F4B44    push        0FF00000F
 004F4B49    mov         ecx,dword ptr [ebp-18]
 004F4B4C    dec         ecx
 004F4B4D    mov         edx,dword ptr [ebp-24]
 004F4B50    mov         eax,ebx
 004F4B52    mov         edi,dword ptr [eax]
 004F4B54    call        dword ptr [edi+20]
 004F4B57    push        0FF00000F
 004F4B5C    mov         edx,dword ptr [ebp-1C]
 004F4B5F    dec         edx
 004F4B60    mov         ecx,dword ptr [ebp-20]
 004F4B63    mov         eax,ebx
 004F4B65    mov         edi,dword ptr [eax]
 004F4B67    call        dword ptr [edi+20]
 004F4B6A    push        0FF00000F
 004F4B6F    mov         ecx,dword ptr [ebp-18]
 004F4B72    dec         ecx
 004F4B73    mov         edx,dword ptr [ebp-1C]
 004F4B76    dec         edx
 004F4B77    mov         eax,ebx
 004F4B79    mov         edi,dword ptr [eax]
 004F4B7B    call        dword ptr [edi+20]
 004F4B7E    cmp         byte ptr [ebp+0C],0
>004F4B82    je          004F4BB0
 004F4B84    push        0FF
 004F4B86    push        0FF
 004F4B88    lea         eax,[ebp-24]
 004F4B8B    push        eax
 004F4B8C    call        user32.InflateRect
 004F4B91    mov         dl,1
 004F4B93    mov         eax,dword ptr [ebx+48]
 004F4B96    call        TBrush.SetStyle
 004F4B9B    mov         eax,dword ptr [ebp-1C]
 004F4B9E    push        eax
 004F4B9F    mov         eax,dword ptr [ebp-18]
 004F4BA2    push        eax
 004F4BA3    mov         ecx,dword ptr [ebp-20]
 004F4BA6    mov         edx,dword ptr [ebp-24]
 004F4BA9    mov         eax,ebx
 004F4BAB    mov         edi,dword ptr [eax]
 004F4BAD    call        dword ptr [edi+7C]
 004F4BB0    push        0FF
 004F4BB2    push        0FF
 004F4BB4    lea         eax,[ebp-24]
 004F4BB7    push        eax
 004F4BB8    call        user32.InflateRect
 004F4BBD    cmp         byte ptr [ebp+10],0
>004F4BC1    jne         004F4BDD
 004F4BC3    push        0FF000010
 004F4BC8    mov         eax,dword ptr [ebp-4]
 004F4BCB    push        eax
 004F4BCC    lea         edx,[ebp-24]
 004F4BCF    mov         ecx,0FF000014
 004F4BD4    mov         eax,ebx
 004F4BD6    call        Frame3D
>004F4BDB    jmp         004F4C36
 004F4BDD    mov         edx,0FF000010
 004F4BE2    mov         eax,dword ptr [ebx+44]
 004F4BE5    call        TPen.SetColor
 004F4BEA    mov         eax,dword ptr [ebp-24]
 004F4BED    mov         dword ptr [ebp-0C],eax
 004F4BF0    mov         eax,dword ptr [ebp-18]
 004F4BF3    dec         eax
 004F4BF4    mov         dword ptr [ebp-8],eax
 004F4BF7    mov         eax,dword ptr [ebp-1C]
 004F4BFA    mov         dword ptr [ebp-14],eax
 004F4BFD    mov         eax,dword ptr [ebp-20]
 004F4C00    mov         dword ptr [ebp-10],eax
 004F4C03    mov         eax,dword ptr [ebp-0C]
 004F4C06    mov         dword ptr [ebp-3C],eax
 004F4C09    mov         eax,dword ptr [ebp-8]
 004F4C0C    mov         dword ptr [ebp-38],eax
 004F4C0F    mov         eax,dword ptr [ebp-24]
 004F4C12    mov         dword ptr [ebp-34],eax
 004F4C15    mov         eax,dword ptr [ebp-20]
 004F4C18    mov         dword ptr [ebp-30],eax
 004F4C1B    mov         eax,dword ptr [ebp-14]
 004F4C1E    mov         dword ptr [ebp-2C],eax
 004F4C21    mov         eax,dword ptr [ebp-10]
 004F4C24    mov         dword ptr [ebp-28],eax
 004F4C27    lea         edx,[ebp-3C]
 004F4C2A    mov         ecx,2
 004F4C2F    mov         eax,ebx
 004F4C31    mov         ebx,dword ptr [eax]
 004F4C33    call        dword ptr [ebx+70]
 004F4C36    mov         eax,dword ptr [esi+0C]
 004F4C39    sub         eax,2
 004F4C3C    push        eax
 004F4C3D    mov         eax,dword ptr [ebp+8]
 004F4C40    push        eax
 004F4C41    mov         ecx,dword ptr [esi+8]
 004F4C44    sub         ecx,2
 004F4C47    mov         edx,dword ptr [esi+4]
 004F4C4A    inc         edx
 004F4C4B    mov         eax,dword ptr [esi]
 004F4C4D    inc         eax
 004F4C4E    call        Rect
 004F4C53    cmp         byte ptr [ebp+10],0
>004F4C57    je          004F4C66
 004F4C59    push        1
 004F4C5B    push        1
 004F4C5D    mov         eax,dword ptr [ebp+8]
 004F4C60    push        eax
 004F4C61    call        user32.OffsetRect
 004F4C66    pop         edi
 004F4C67    pop         esi
 004F4C68    pop         ebx
 004F4C69    mov         esp,ebp
 004F4C6B    pop         ebp
 004F4C6C    ret         14
*}
end;

//004F4C70
function GetBitBtnGlyph(Kind:TBitBtnKind):TBitmap;
begin
{*
 004F4C70    push        ebp
 004F4C71    mov         ebp,esp
 004F4C73    push        0
 004F4C75    push        ebx
 004F4C76    push        esi
 004F4C77    mov         ebx,eax
 004F4C79    xor         eax,eax
 004F4C7B    push        ebp
 004F4C7C    push        4F4CED
 004F4C81    push        dword ptr fs:[eax]
 004F4C84    mov         dword ptr fs:[eax],esp
 004F4C87    mov         esi,ebx
 004F4C89    and         esi,7F
 004F4C8C    cmp         dword ptr [esi*4+793318],0
>004F4C94    jne         004F4CD0
 004F4C96    mov         dl,1
 004F4C98    mov         eax,[00463B28];TBitmap
 004F4C9D    call        TBitmap.Create
 004F4CA2    mov         dword ptr [esi*4+793318],eax
 004F4CA9    lea         eax,[ebp-4]
 004F4CAC    mov         edx,dword ptr [esi*4+786834]
 004F4CB3    call        @UStrFromPWChar
 004F4CB8    mov         ecx,dword ptr [ebp-4]
 004F4CBB    movzx       eax,bl
 004F4CBE    mov         eax,dword ptr [eax*4+793318]
 004F4CC5    mov         edx,dword ptr ds:[790C38];gvar_00790C38
 004F4CCB    call        TBitmap.LoadFromResourceName
 004F4CD0    mov         ebx,dword ptr [esi*4+793318]
 004F4CD7    xor         eax,eax
 004F4CD9    pop         edx
 004F4CDA    pop         ecx
 004F4CDB    pop         ecx
 004F4CDC    mov         dword ptr fs:[eax],edx
 004F4CDF    push        4F4CF4
 004F4CE4    lea         eax,[ebp-4]
 004F4CE7    call        @UStrClr
 004F4CEC    ret
>004F4CED    jmp         @HandleFinally
>004F4CF2    jmp         004F4CE4
 004F4CF4    mov         eax,ebx
 004F4CF6    pop         esi
 004F4CF7    pop         ebx
 004F4CF8    pop         ecx
 004F4CF9    pop         ebp
 004F4CFA    ret
*}
end;

//004F5448
constructor TGlyphList.CreateSize(AHeight:Integer);
begin
{*
 004F5448    push        ebp
 004F5449    mov         ebp,esp
 004F544B    push        ebx
 004F544C    push        esi
 004F544D    test        dl,dl
>004F544F    je          004F5459
 004F5451    add         esp,0FFFFFFF0
 004F5454    call        @ClassCreate
 004F5459    mov         ebx,edx
 004F545B    mov         esi,eax
 004F545D    mov         eax,dword ptr [ebp+8]
 004F5460    push        eax
 004F5461    xor         edx,edx
 004F5463    mov         eax,esi
 004F5465    call        TCustomImageList.CreateSize
 004F546A    mov         dl,1
 004F546C    mov         eax,[0043A874];TBits
 004F5471    call        TObject.Create
 004F5476    mov         dword ptr [esi+90],eax
 004F547C    mov         eax,esi
 004F547E    test        bl,bl
>004F5480    je          004F5491
 004F5482    call        @AfterConstruction
 004F5487    pop         dword ptr fs:[0]
 004F548E    add         esp,0C
 004F5491    mov         eax,esi
 004F5493    pop         esi
 004F5494    pop         ebx
 004F5495    pop         ebp
 004F5496    ret         4
*}
end;

//004F549C
destructor TGlyphList.Destroy();
begin
{*
 004F549C    push        ebx
 004F549D    push        esi
 004F549E    call        @BeforeDestruction
 004F54A3    mov         ebx,edx
 004F54A5    mov         esi,eax
 004F54A7    mov         eax,dword ptr [esi+90]
 004F54AD    call        TObject.Free
 004F54B2    mov         edx,ebx
 004F54B4    and         dl,0FC
 004F54B7    mov         eax,esi
 004F54B9    call        TCustomImageList.Destroy
 004F54BE    test        bl,bl
>004F54C0    jle         004F54C9
 004F54C2    mov         eax,esi
 004F54C4    call        @ClassDestroy
 004F54C9    pop         esi
 004F54CA    pop         ebx
 004F54CB    ret
*}
end;

//004F54CC
function TGlyphList.AllocateIndex:Integer;
begin
{*
 004F54CC    push        ebx
 004F54CD    push        esi
 004F54CE    mov         ebx,eax
 004F54D0    mov         eax,dword ptr [ebx+90]
 004F54D6    call        TBits.OpenBit
 004F54DB    mov         esi,eax
 004F54DD    mov         eax,dword ptr [ebx+90]
 004F54E3    cmp         esi,dword ptr [eax+4]
>004F54E6    jl          004F5503
 004F54E8    xor         ecx,ecx
 004F54EA    xor         edx,edx
 004F54EC    mov         eax,ebx
 004F54EE    call        TCustomImageList.Add
 004F54F3    mov         esi,eax
 004F54F5    lea         edx,[esi+1]
 004F54F8    mov         eax,dword ptr [ebx+90]
 004F54FE    call        TBits.SetSize
 004F5503    mov         cl,1
 004F5505    mov         edx,esi
 004F5507    mov         eax,dword ptr [ebx+90]
 004F550D    call        TBits.SetBit
 004F5512    mov         eax,esi
 004F5514    pop         esi
 004F5515    pop         ebx
 004F5516    ret
*}
end;

//004F5518
function TGlyphList.AddMasked(Image:TBitmap; MaskColor:TColor):Integer;
begin
{*
 004F5518    push        ebx
 004F5519    push        esi
 004F551A    push        edi
 004F551B    push        ebp
 004F551C    mov         ebp,ecx
 004F551E    mov         edi,edx
 004F5520    mov         ebx,eax
 004F5522    mov         eax,ebx
 004F5524    call        TGlyphList.AllocateIndex
 004F5529    mov         esi,eax
 004F552B    push        ebp
 004F552C    mov         ecx,edi
 004F552E    mov         edx,esi
 004F5530    mov         eax,ebx
 004F5532    call        TCustomImageList.ReplaceMasked
 004F5537    inc         dword ptr [ebx+94]
 004F553D    mov         eax,esi
 004F553F    pop         ebp
 004F5540    pop         edi
 004F5541    pop         esi
 004F5542    pop         ebx
 004F5543    ret
*}
end;

//004F5544
procedure TGlyphList.Delete(Index:Integer);
begin
{*
 004F5544    push        ebx
 004F5545    push        esi
 004F5546    mov         esi,edx
 004F5548    mov         ebx,eax
 004F554A    mov         edx,esi
 004F554C    mov         eax,dword ptr [ebx+90]
 004F5552    call        TBits.GetBit
 004F5557    test        al,al
>004F5559    je          004F5570
 004F555B    dec         dword ptr [ebx+94]
 004F5561    xor         ecx,ecx
 004F5563    mov         edx,esi
 004F5565    mov         eax,dword ptr [ebx+90]
 004F556B    call        TBits.SetBit
 004F5570    pop         esi
 004F5571    pop         ebx
 004F5572    ret
*}
end;

//004F5574
constructor TGlyphCache.Create();
begin
{*
 004F5574    push        ebx
 004F5575    push        esi
 004F5576    test        dl,dl
>004F5578    je          004F5582
 004F557A    add         esp,0FFFFFFF0
 004F557D    call        @ClassCreate
 004F5582    mov         ebx,edx
 004F5584    mov         esi,eax
 004F5586    xor         edx,edx
 004F5588    mov         eax,esi
 004F558A    call        TObject.Create
 004F558F    mov         dl,1
 004F5591    mov         eax,[00439644];TList
 004F5596    call        TObject.Create
 004F559B    mov         dword ptr [esi+4],eax
 004F559E    mov         eax,esi
 004F55A0    test        bl,bl
>004F55A2    je          004F55B3
 004F55A4    call        @AfterConstruction
 004F55A9    pop         dword ptr fs:[0]
 004F55B0    add         esp,0C
 004F55B3    mov         eax,esi
 004F55B5    pop         esi
 004F55B6    pop         ebx
 004F55B7    ret
*}
end;

//004F55B8
destructor TGlyphCache.Destroy();
begin
{*
 004F55B8    push        ebx
 004F55B9    push        esi
 004F55BA    call        @BeforeDestruction
 004F55BF    mov         ebx,edx
 004F55C1    mov         esi,eax
 004F55C3    mov         eax,dword ptr [esi+4]
 004F55C6    call        TObject.Free
 004F55CB    mov         edx,ebx
 004F55CD    and         dl,0FC
 004F55D0    mov         eax,esi
 004F55D2    call        TObject.Destroy
 004F55D7    test        bl,bl
>004F55D9    jle         004F55E2
 004F55DB    mov         eax,esi
 004F55DD    call        @ClassDestroy
 004F55E2    pop         esi
 004F55E3    pop         ebx
 004F55E4    ret
*}
end;

//004F55E8
function TGlyphCache.GetList(AWidth:Integer; AHeight:Integer):TGlyphList;
begin
{*
 004F55E8    push        ebx
 004F55E9    push        esi
 004F55EA    push        edi
 004F55EB    push        ebp
 004F55EC    push        ecx
 004F55ED    mov         dword ptr [esp],ecx
 004F55F0    mov         ebp,edx
 004F55F2    mov         edi,eax
 004F55F4    mov         eax,dword ptr [edi+4]
 004F55F7    mov         esi,dword ptr [eax+8]
 004F55FA    dec         esi
 004F55FB    cmp         esi,0
>004F55FE    jl          004F561F
 004F5600    mov         eax,dword ptr [edi+4]
 004F5603    mov         edx,esi
 004F5605    call        TList.Get
 004F560A    mov         ebx,eax
 004F560C    cmp         ebp,dword ptr [ebx+38]
>004F560F    jne         004F5619
 004F5611    mov         eax,dword ptr [ebx+34]
 004F5614    cmp         eax,dword ptr [esp]
>004F5617    je          004F563D
 004F5619    dec         esi
 004F561A    cmp         esi,0FFFFFFFF
>004F561D    jne         004F5600
 004F561F    mov         eax,dword ptr [esp]
 004F5622    push        eax
 004F5623    mov         ecx,ebp
 004F5625    mov         dl,1
 004F5627    mov         eax,[004F4CFC];TGlyphList
 004F562C    call        TGlyphList.CreateSize
 004F5631    mov         ebx,eax
 004F5633    mov         eax,dword ptr [edi+4]
 004F5636    mov         edx,ebx
 004F5638    call        TList.Add
 004F563D    mov         eax,ebx
 004F563F    pop         edx
 004F5640    pop         ebp
 004F5641    pop         edi
 004F5642    pop         esi
 004F5643    pop         ebx
 004F5644    ret
*}
end;

//004F5648
procedure TGlyphCache.ReturnList(List:TGlyphList);
begin
{*
 004F5648    push        ebx
 004F5649    mov         ebx,edx
 004F564B    test        ebx,ebx
>004F564D    je          004F566B
 004F564F    cmp         dword ptr [ebx+94],0
>004F5656    jne         004F566B
 004F5658    mov         edx,ebx
 004F565A    xor         ecx,ecx
 004F565C    mov         eax,dword ptr [eax+4]
 004F565F    call        TList.RemoveItem
 004F5664    mov         eax,ebx
 004F5666    call        TObject.Free
 004F566B    pop         ebx
 004F566C    ret
*}
end;

//004F5670
function TGlyphCache.Empty:Boolean;
begin
{*
 004F5670    mov         eax,dword ptr [eax+4]
 004F5673    cmp         dword ptr [eax+8],0
 004F5677    sete        al
 004F567A    ret
*}
end;

//004F567C
constructor TButtonGlyph.Create();
begin
{*
 004F567C    push        ebp
 004F567D    mov         ebp,esp
 004F567F    push        ecx
 004F5680    push        ebx
 004F5681    push        esi
 004F5682    test        dl,dl
>004F5684    je          004F568E
 004F5686    add         esp,0FFFFFFF0
 004F5689    call        @ClassCreate
 004F568E    mov         byte ptr [ebp-1],dl
 004F5691    mov         ebx,eax
 004F5693    xor         edx,edx
 004F5695    mov         eax,ebx
 004F5697    call        TObject.Create
 004F569C    mov         dl,1
 004F569E    mov         eax,[00463B28];TBitmap
 004F56A3    call        TBitmap.Create
 004F56A8    mov         esi,eax
 004F56AA    mov         dword ptr [ebx+4],esi
 004F56AD    mov         dword ptr [esi+14],ebx
 004F56B0    mov         dword ptr [esi+10],4F57B4;TButtonGlyph.GlyphChanged
 004F56B7    mov         dword ptr [ebx+1C],8080
 004F56BE    mov         byte ptr [ebx+20],1
 004F56C2    mov         byte ptr [ebx+21],0
 004F56C6    mov         byte ptr [ebx+31],0
 004F56CA    xor         eax,eax
 004F56CC    movzx       edx,al
 004F56CF    mov         dword ptr [ebx+edx*4+0C],0FFFFFFFF
 004F56D7    inc         eax
 004F56D8    cmp         al,4
>004F56DA    jne         004F56CC
 004F56DC    cmp         dword ptr ds:[7868B8],0
>004F56E3    jne         004F56F6
 004F56E5    mov         dl,1
 004F56E7    mov         eax,[004F4F38];TGlyphCache
 004F56EC    call        TGlyphCache.Create
 004F56F1    mov         [007868B8],eax
 004F56F6    mov         eax,ebx
 004F56F8    cmp         byte ptr [ebp-1],0
>004F56FC    je          004F570D
 004F56FE    call        @AfterConstruction
 004F5703    pop         dword ptr fs:[0]
 004F570A    add         esp,0C
 004F570D    mov         eax,ebx
 004F570F    pop         esi
 004F5710    pop         ebx
 004F5711    pop         ecx
 004F5712    pop         ebp
 004F5713    ret
*}
end;

//004F5714
destructor TButtonGlyph.Destroy();
begin
{*
 004F5714    push        ebx
 004F5715    push        esi
 004F5716    call        @BeforeDestruction
 004F571B    mov         ebx,edx
 004F571D    mov         esi,eax
 004F571F    mov         eax,dword ptr [esi+4]
 004F5722    call        TObject.Free
 004F5727    mov         eax,esi
 004F5729    call        TButtonGlyph.Invalidate
 004F572E    cmp         dword ptr ds:[7868B8],0
>004F5735    je          004F5756
 004F5737    mov         eax,[007868B8]
 004F573C    call        TGlyphCache.Empty
 004F5741    test        al,al
>004F5743    je          004F5756
 004F5745    mov         eax,[007868B8]
 004F574A    call        TObject.Free
 004F574F    xor         eax,eax
 004F5751    mov         [007868B8],eax
 004F5756    mov         edx,ebx
 004F5758    and         dl,0FC
 004F575B    mov         eax,esi
 004F575D    call        TObject.Destroy
 004F5762    test        bl,bl
>004F5764    jle         004F576D
 004F5766    mov         eax,esi
 004F5768    call        @ClassDestroy
 004F576D    pop         esi
 004F576E    pop         ebx
 004F576F    ret
*}
end;

//004F5770
procedure TButtonGlyph.Invalidate;
begin
{*
 004F5770    push        ebx
 004F5771    push        esi
 004F5772    push        edi
 004F5773    mov         esi,eax
 004F5775    xor         ebx,ebx
 004F5777    mov         edi,ebx
 004F5779    and         edi,7F
 004F577C    mov         eax,dword ptr [esi+edi*4+0C]
 004F5780    cmp         eax,0FFFFFFFF
>004F5783    je          004F578F
 004F5785    mov         edx,eax
 004F5787    mov         eax,dword ptr [esi+8]
 004F578A    call        TGlyphList.Delete
 004F578F    mov         dword ptr [esi+edi*4+0C],0FFFFFFFF
 004F5797    inc         ebx
 004F5798    cmp         bl,4
>004F579B    jne         004F5777
 004F579D    mov         edx,dword ptr [esi+8]
 004F57A0    mov         eax,[007868B8]
 004F57A5    call        TGlyphCache.ReturnList
 004F57AA    xor         eax,eax
 004F57AC    mov         dword ptr [esi+8],eax
 004F57AF    pop         edi
 004F57B0    pop         esi
 004F57B1    pop         ebx
 004F57B2    ret
*}
end;

//004F57B4
procedure TButtonGlyph.GlyphChanged(Sender:TObject);
begin
{*
 004F57B4    push        ebx
 004F57B5    push        esi
 004F57B6    mov         ebx,eax
 004F57B8    mov         esi,dword ptr [ebx+4]
 004F57BB    cmp         edx,esi
>004F57BD    jne         004F57DF
 004F57BF    mov         eax,esi
 004F57C1    call        TBitmap.GetTransparentColor
 004F57C6    mov         dword ptr [ebx+1C],eax
 004F57C9    mov         eax,ebx
 004F57CB    call        TButtonGlyph.Invalidate
 004F57D0    cmp         word ptr [ebx+3A],0
>004F57D5    je          004F57DF
 004F57D7    mov         edx,ebx
 004F57D9    mov         eax,dword ptr [ebx+3C]
 004F57DC    call        dword ptr [ebx+38]
 004F57DF    pop         esi
 004F57E0    pop         ebx
 004F57E1    ret
*}
end;

//004F57E4
procedure TButtonGlyph.SetGlyph(Value:TBitmap);
begin
{*
 004F57E4    push        ebx
 004F57E5    push        esi
 004F57E6    mov         ebx,edx
 004F57E8    mov         esi,eax
 004F57EA    mov         eax,esi
 004F57EC    call        TButtonGlyph.Invalidate
 004F57F1    mov         edx,ebx
 004F57F3    mov         eax,dword ptr [esi+4]
 004F57F6    mov         ecx,dword ptr [eax]
 004F57F8    call        dword ptr [ecx+8]
 004F57FB    test        ebx,ebx
>004F57FD    je          004F5859
 004F57FF    mov         eax,ebx
 004F5801    mov         edx,dword ptr [eax]
 004F5803    call        dword ptr [edx+24]
 004F5806    test        eax,eax
>004F5808    jle         004F5859
 004F580A    mov         eax,ebx
 004F580C    call        TBitmap.GetTransparentColor
 004F5811    mov         dword ptr [esi+1C],eax
 004F5814    mov         eax,ebx
 004F5816    mov         edx,dword ptr [eax]
 004F5818    call        dword ptr [edx+30]
 004F581B    push        eax
 004F581C    mov         eax,ebx
 004F581E    mov         edx,dword ptr [eax]
 004F5820    call        dword ptr [edx+24]
 004F5823    mov         edx,eax
 004F5825    pop         eax
 004F5826    mov         ecx,edx
 004F5828    cdq
 004F5829    idiv        eax,ecx
 004F582B    test        edx,edx
>004F582D    jne         004F5859
 004F582F    mov         eax,ebx
 004F5831    mov         edx,dword ptr [eax]
 004F5833    call        dword ptr [edx+30]
 004F5836    push        eax
 004F5837    mov         eax,ebx
 004F5839    mov         edx,dword ptr [eax]
 004F583B    call        dword ptr [edx+24]
 004F583E    mov         edx,eax
 004F5840    pop         eax
 004F5841    mov         ecx,edx
 004F5843    cdq
 004F5844    idiv        eax,ecx
 004F5846    cmp         eax,4
>004F5849    jle         004F5850
 004F584B    mov         eax,1
 004F5850    mov         edx,eax
 004F5852    mov         eax,esi
 004F5854    call        TButtonGlyph.SetNumGlyphs
 004F5859    pop         esi
 004F585A    pop         ebx
 004F585B    ret
*}
end;

//004F585C
procedure TButtonGlyph.SetNumGlyphs(Value:TNumGlyphs);
begin
{*
 004F585C    push        ebx
 004F585D    push        esi
 004F585E    mov         ebx,edx
 004F5860    mov         esi,eax
 004F5862    cmp         bl,byte ptr [esi+20]
>004F5865    je          004F587F
 004F5867    test        bl,bl
>004F5869    jbe         004F587F
 004F586B    mov         eax,esi
 004F586D    call        TButtonGlyph.Invalidate
 004F5872    mov         byte ptr [esi+20],bl
 004F5875    mov         edx,dword ptr [esi+4]
 004F5878    mov         eax,esi
 004F587A    call        TButtonGlyph.GlyphChanged
 004F587F    pop         esi
 004F5880    pop         ebx
 004F5881    ret
*}
end;

//004F5884
function TButtonGlyph.CreateButtonGlyph(State:TButtonState):Integer;
begin
{*
 004F5884    push        ebp
 004F5885    mov         ebp,esp
 004F5887    add         esp,0FFFFFFC8
 004F588A    push        ebx
 004F588B    push        esi
 004F588C    push        edi
 004F588D    mov         byte ptr [ebp-5],dl
 004F5890    mov         dword ptr [ebp-4],eax
 004F5893    cmp         byte ptr [ebp-5],2
>004F5897    jne         004F58A6
 004F5899    mov         eax,dword ptr [ebp-4]
 004F589C    cmp         byte ptr [eax+20],3
>004F58A0    jae         004F58A6
 004F58A2    mov         byte ptr [ebp-5],0
 004F58A6    movzx       eax,byte ptr [ebp-5]
 004F58AA    mov         edx,dword ptr [ebp-4]
 004F58AD    mov         ebx,dword ptr [edx+eax*4+0C]
 004F58B1    cmp         ebx,0FFFFFFFF
>004F58B4    jne         004F5E4C
 004F58BA    mov         eax,dword ptr [ebp-4]
 004F58BD    mov         eax,dword ptr [eax+4]
 004F58C0    mov         edx,dword ptr [eax]
 004F58C2    call        dword ptr [edx+30]
 004F58C5    mov         esi,eax
 004F58C7    mov         eax,dword ptr [ebp-4]
 004F58CA    mov         eax,dword ptr [eax+4]
 004F58CD    mov         edx,dword ptr [eax]
 004F58CF    call        dword ptr [edx+24]
 004F58D2    or          esi,eax
>004F58D4    je          004F5E4C
 004F58DA    mov         eax,dword ptr [ebp-4]
 004F58DD    mov         eax,dword ptr [eax+4]
 004F58E0    mov         edx,dword ptr [eax]
 004F58E2    call        dword ptr [edx+30]
 004F58E5    mov         edx,dword ptr [ebp-4]
 004F58E8    movzx       edx,byte ptr [edx+20]
 004F58EC    mov         ecx,edx
 004F58EE    cdq
 004F58EF    idiv        eax,ecx
 004F58F1    mov         edi,eax
 004F58F3    mov         eax,dword ptr [ebp-4]
 004F58F6    mov         eax,dword ptr [eax+4]
 004F58F9    mov         edx,dword ptr [eax]
 004F58FB    call        dword ptr [edx+24]
 004F58FE    mov         esi,eax
 004F5900    mov         eax,dword ptr [ebp-4]
 004F5903    cmp         dword ptr [eax+8],0
>004F5907    jne         004F5937
 004F5909    cmp         dword ptr ds:[7868B8],0
>004F5910    jne         004F5923
 004F5912    mov         dl,1
 004F5914    mov         eax,[004F4F38];TGlyphCache
 004F5919    call        TGlyphCache.Create
 004F591E    mov         [007868B8],eax
 004F5923    mov         ecx,esi
 004F5925    mov         edx,edi
 004F5927    mov         eax,[007868B8]
 004F592C    call        TGlyphCache.GetList
 004F5931    mov         edx,dword ptr [ebp-4]
 004F5934    mov         dword ptr [edx+8],eax
 004F5937    mov         dl,1
 004F5939    mov         eax,[00463B28];TBitmap
 004F593E    call        TBitmap.Create
 004F5943    mov         dword ptr [ebp-0C],eax
 004F5946    xor         eax,eax
 004F5948    push        ebp
 004F5949    push        4F5E2F
 004F594E    push        dword ptr fs:[eax]
 004F5951    mov         dword ptr fs:[eax],esp
 004F5954    mov         edx,edi
 004F5956    mov         eax,dword ptr [ebp-0C]
 004F5959    mov         ecx,dword ptr [eax]
 004F595B    call        dword ptr [ecx+44]
 004F595E    mov         edx,esi
 004F5960    mov         eax,dword ptr [ebp-0C]
 004F5963    mov         ecx,dword ptr [eax]
 004F5965    call        dword ptr [ecx+38]
 004F5968    push        esi
 004F5969    lea         eax,[ebp-28]
 004F596C    push        eax
 004F596D    mov         ecx,edi
 004F596F    xor         edx,edx
 004F5971    xor         eax,eax
 004F5973    call        Rect
 004F5978    mov         eax,dword ptr [ebp-0C]
 004F597B    call        TBitmap.GetCanvas
 004F5980    mov         eax,dword ptr [eax+48]
 004F5983    mov         edx,0FF00000F
 004F5988    call        TBrush.SetColor
 004F598D    mov         eax,dword ptr [ebp-4]
 004F5990    mov         eax,dword ptr [eax+4]
 004F5993    mov         edx,dword ptr [eax]
 004F5995    call        dword ptr [edx+28]
 004F5998    call        CopyPalette
 004F599D    mov         edx,eax
 004F599F    mov         eax,dword ptr [ebp-0C]
 004F59A2    mov         ecx,dword ptr [eax]
 004F59A4    call        dword ptr [ecx+3C]
 004F59A7    movzx       ebx,byte ptr [ebp-5]
 004F59AB    mov         eax,dword ptr [ebp-4]
 004F59AE    cmp         bl,byte ptr [eax+20]
>004F59B1    jl          004F59B5
 004F59B3    xor         ebx,ebx
 004F59B5    push        esi
 004F59B6    lea         eax,[ebp-38]
 004F59B9    push        eax
 004F59BA    movzx       ecx,bl
 004F59BD    inc         ecx
 004F59BE    imul        ecx,edi
 004F59C1    movzx       eax,bl
 004F59C4    imul        edi
 004F59C6    xor         edx,edx
 004F59C8    call        Rect
 004F59CD    movzx       eax,byte ptr [ebp-5]
 004F59D1    sub         al,1
>004F59D3    jb          004F59E0
>004F59D5    je          004F5A54
 004F59D7    dec         eax
 004F59D8    sub         al,2
>004F59DA    jae         004F5E19
 004F59E0    lea         eax,[ebp-38]
 004F59E3    push        eax
 004F59E4    mov         eax,dword ptr [ebp-4]
 004F59E7    mov         eax,dword ptr [eax+4]
 004F59EA    call        TBitmap.GetCanvas
 004F59EF    push        eax
 004F59F0    mov         eax,dword ptr [ebp-0C]
 004F59F3    call        TBitmap.GetCanvas
 004F59F8    lea         edx,[ebp-28]
 004F59FB    pop         ecx
 004F59FC    call        TCanvas.CopyRect
 004F5A01    mov         eax,dword ptr [ebp-4]
 004F5A04    mov         eax,dword ptr [eax+4]
 004F5A07    cmp         byte ptr [eax+38],1
>004F5A0B    jne         004F5A31
 004F5A0D    mov         eax,dword ptr [ebp-4]
 004F5A10    mov         ecx,dword ptr [eax+1C]
 004F5A13    mov         eax,dword ptr [ebp-4]
 004F5A16    mov         eax,dword ptr [eax+8]
 004F5A19    mov         edx,dword ptr [ebp-0C]
 004F5A1C    call        TGlyphList.AddMasked
 004F5A21    movzx       edx,byte ptr [ebp-5]
 004F5A25    mov         ecx,dword ptr [ebp-4]
 004F5A28    mov         dword ptr [ecx+edx*4+0C],eax
>004F5A2C    jmp         004F5E19
 004F5A31    mov         eax,dword ptr [ebp-4]
 004F5A34    mov         eax,dword ptr [eax+8]
 004F5A37    mov         ecx,20000000
 004F5A3C    mov         edx,dword ptr [ebp-0C]
 004F5A3F    call        TGlyphList.AddMasked
 004F5A44    movzx       edx,byte ptr [ebp-5]
 004F5A48    mov         ecx,dword ptr [ebp-4]
 004F5A4B    mov         dword ptr [ecx+edx*4+0C],eax
>004F5A4F    jmp         004F5E19
 004F5A54    xor         eax,eax
 004F5A56    mov         dword ptr [ebp-14],eax
 004F5A59    xor         eax,eax
 004F5A5B    mov         dword ptr [ebp-10],eax
 004F5A5E    xor         eax,eax
 004F5A60    push        ebp
 004F5A61    push        4F5DF4
 004F5A66    push        dword ptr fs:[eax]
 004F5A69    mov         dword ptr fs:[eax],esp
 004F5A6C    mov         dl,1
 004F5A6E    mov         eax,[00463B28];TBitmap
 004F5A73    call        TBitmap.Create
 004F5A78    mov         dword ptr [ebp-14],eax
 004F5A7B    mov         dl,1
 004F5A7D    mov         eax,[00463B28];TBitmap
 004F5A82    call        TBitmap.Create
 004F5A87    mov         dword ptr [ebp-10],eax
 004F5A8A    mov         eax,dword ptr [ebp-4]
 004F5A8D    mov         edx,dword ptr [eax+4]
 004F5A90    mov         eax,dword ptr [ebp-10]
 004F5A93    mov         ecx,dword ptr [eax]
 004F5A95    call        dword ptr [ecx+8]
 004F5A98    mov         dl,1
 004F5A9A    mov         eax,dword ptr [ebp-10]
 004F5A9D    mov         ecx,dword ptr [eax]
 004F5A9F    call        dword ptr [ecx+78]
 004F5AA2    mov         eax,dword ptr [ebp-4]
 004F5AA5    cmp         byte ptr [eax+20],1
>004F5AA9    jbe         004F5C87
 004F5AAF    mov         eax,dword ptr [ebp-0C]
 004F5AB2    call        TBitmap.GetCanvas
 004F5AB7    mov         dword ptr [ebp-18],eax
 004F5ABA    lea         eax,[ebp-38]
 004F5ABD    push        eax
 004F5ABE    mov         eax,dword ptr [ebp-10]
 004F5AC1    call        TBitmap.GetCanvas
 004F5AC6    mov         ecx,eax
 004F5AC8    lea         edx,[ebp-28]
 004F5ACB    mov         eax,dword ptr [ebp-18]
 004F5ACE    call        TCanvas.CopyRect
 004F5AD3    mov         dl,1
 004F5AD5    mov         eax,dword ptr [ebp-14]
 004F5AD8    call        TBitmap.SetMonochrome
 004F5ADD    mov         edx,edi
 004F5ADF    mov         eax,dword ptr [ebp-14]
 004F5AE2    mov         ecx,dword ptr [eax]
 004F5AE4    call        dword ptr [ecx+44]
 004F5AE7    mov         edx,esi
 004F5AE9    mov         eax,dword ptr [ebp-14]
 004F5AEC    mov         ecx,dword ptr [eax]
 004F5AEE    call        dword ptr [ecx+38]
 004F5AF1    mov         eax,dword ptr [ebp-10]
 004F5AF4    call        TBitmap.GetCanvas
 004F5AF9    mov         eax,dword ptr [eax+48]
 004F5AFC    mov         edx,0FFFFFF
 004F5B01    call        TBrush.SetColor
 004F5B06    lea         eax,[ebp-38]
 004F5B09    push        eax
 004F5B0A    mov         eax,dword ptr [ebp-10]
 004F5B0D    call        TBitmap.GetCanvas
 004F5B12    push        eax
 004F5B13    mov         eax,dword ptr [ebp-14]
 004F5B16    call        TBitmap.GetCanvas
 004F5B1B    lea         edx,[ebp-28]
 004F5B1E    pop         ecx
 004F5B1F    call        TCanvas.CopyRect
 004F5B24    mov         eax,dword ptr [ebp-18]
 004F5B27    mov         eax,dword ptr [eax+48]
 004F5B2A    mov         edx,0FF000014
 004F5B2F    call        TBrush.SetColor
 004F5B34    mov         eax,dword ptr [ebp-18]
 004F5B37    call        TCanvas.GetHandle
 004F5B3C    mov         ebx,eax
 004F5B3E    push        0
 004F5B40    push        ebx
 004F5B41    call        gdi32.SetTextColor
 004F5B46    push        0FFFFFF
 004F5B4B    push        ebx
 004F5B4C    call        gdi32.SetBkColor
 004F5B51    push        0E20746
 004F5B56    push        0
 004F5B58    push        0
 004F5B5A    mov         eax,dword ptr [ebp-14]
 004F5B5D    call        TBitmap.GetCanvas
 004F5B62    call        TCanvas.GetHandle
 004F5B67    push        eax
 004F5B68    push        esi
 004F5B69    push        edi
 004F5B6A    push        0
 004F5B6C    push        0
 004F5B6E    push        ebx
 004F5B6F    call        gdi32.BitBlt
 004F5B74    mov         eax,dword ptr [ebp-10]
 004F5B77    call        TBitmap.GetCanvas
 004F5B7C    mov         eax,dword ptr [eax+48]
 004F5B7F    mov         edx,808080
 004F5B84    call        TBrush.SetColor
 004F5B89    lea         eax,[ebp-38]
 004F5B8C    push        eax
 004F5B8D    mov         eax,dword ptr [ebp-10]
 004F5B90    call        TBitmap.GetCanvas
 004F5B95    push        eax
 004F5B96    mov         eax,dword ptr [ebp-14]
 004F5B99    call        TBitmap.GetCanvas
 004F5B9E    lea         edx,[ebp-28]
 004F5BA1    pop         ecx
 004F5BA2    call        TCanvas.CopyRect
 004F5BA7    mov         eax,dword ptr [ebp-18]
 004F5BAA    mov         eax,dword ptr [eax+48]
 004F5BAD    mov         edx,0FF000010
 004F5BB2    call        TBrush.SetColor
 004F5BB7    mov         eax,dword ptr [ebp-18]
 004F5BBA    call        TCanvas.GetHandle
 004F5BBF    mov         ebx,eax
 004F5BC1    push        0
 004F5BC3    push        ebx
 004F5BC4    call        gdi32.SetTextColor
 004F5BC9    push        0FFFFFF
 004F5BCE    push        ebx
 004F5BCF    call        gdi32.SetBkColor
 004F5BD4    push        0E20746
 004F5BD9    push        0
 004F5BDB    push        0
 004F5BDD    mov         eax,dword ptr [ebp-14]
 004F5BE0    call        TBitmap.GetCanvas
 004F5BE5    call        TCanvas.GetHandle
 004F5BEA    push        eax
 004F5BEB    push        esi
 004F5BEC    push        edi
 004F5BED    push        0
 004F5BEF    push        0
 004F5BF1    push        ebx
 004F5BF2    call        gdi32.BitBlt
 004F5BF7    mov         eax,dword ptr [ebp-4]
 004F5BFA    mov         eax,dword ptr [eax+1C]
 004F5BFD    call        ColorToRGB
 004F5C02    push        eax
 004F5C03    mov         eax,dword ptr [ebp-10]
 004F5C06    call        TBitmap.GetCanvas
 004F5C0B    mov         eax,dword ptr [eax+48]
 004F5C0E    pop         edx
 004F5C0F    call        TBrush.SetColor
 004F5C14    lea         eax,[ebp-38]
 004F5C17    push        eax
 004F5C18    mov         eax,dword ptr [ebp-10]
 004F5C1B    call        TBitmap.GetCanvas
 004F5C20    push        eax
 004F5C21    mov         eax,dword ptr [ebp-14]
 004F5C24    call        TBitmap.GetCanvas
 004F5C29    lea         edx,[ebp-28]
 004F5C2C    pop         ecx
 004F5C2D    call        TCanvas.CopyRect
 004F5C32    mov         eax,dword ptr [ebp-18]
 004F5C35    mov         eax,dword ptr [eax+48]
 004F5C38    mov         edx,0FF00000F
 004F5C3D    call        TBrush.SetColor
 004F5C42    mov         eax,dword ptr [ebp-18]
 004F5C45    call        TCanvas.GetHandle
 004F5C4A    mov         ebx,eax
 004F5C4C    push        0
 004F5C4E    push        ebx
 004F5C4F    call        gdi32.SetTextColor
 004F5C54    push        0FFFFFF
 004F5C59    push        ebx
 004F5C5A    call        gdi32.SetBkColor
 004F5C5F    push        0E20746
 004F5C64    push        0
 004F5C66    push        0
 004F5C68    mov         eax,dword ptr [ebp-14]
 004F5C6B    call        TBitmap.GetCanvas
 004F5C70    call        TCanvas.GetHandle
 004F5C75    push        eax
 004F5C76    push        esi
 004F5C77    push        edi
 004F5C78    push        0
 004F5C7A    push        0
 004F5C7C    push        ebx
 004F5C7D    call        gdi32.BitBlt
>004F5C82    jmp         004F5DD6
 004F5C87    mov         eax,dword ptr [ebp-4]
 004F5C8A    mov         edx,dword ptr [eax+4]
 004F5C8D    mov         eax,dword ptr [ebp-14]
 004F5C90    mov         ecx,dword ptr [eax]
 004F5C92    call        dword ptr [ecx+8]
 004F5C95    mov         dl,1
 004F5C97    mov         eax,dword ptr [ebp-14]
 004F5C9A    mov         ecx,dword ptr [eax]
 004F5C9C    call        dword ptr [ecx+78]
 004F5C9F    mov         eax,dword ptr [ebp-14]
 004F5CA2    call        TBitmap.GetCanvas
 004F5CA7    mov         eax,dword ptr [eax+48]
 004F5CAA    xor         edx,edx
 004F5CAC    call        TBrush.SetColor
 004F5CB1    mov         edx,edi
 004F5CB3    mov         eax,dword ptr [ebp-14]
 004F5CB6    mov         ecx,dword ptr [eax]
 004F5CB8    call        dword ptr [ecx+44]
 004F5CBB    mov         eax,dword ptr [ebp-14]
 004F5CBE    call        TBitmap.GetMonochrome
 004F5CC3    test        al,al
>004F5CC5    je          004F5CFB
 004F5CC7    mov         eax,dword ptr [ebp-14]
 004F5CCA    call        TBitmap.GetCanvas
 004F5CCF    mov         eax,dword ptr [eax+40]
 004F5CD2    mov         edx,0FFFFFF
 004F5CD7    call        TFont.SetColor
 004F5CDC    xor         edx,edx
 004F5CDE    mov         eax,dword ptr [ebp-14]
 004F5CE1    call        TBitmap.SetMonochrome
 004F5CE6    mov         eax,dword ptr [ebp-14]
 004F5CE9    call        TBitmap.GetCanvas
 004F5CEE    mov         eax,dword ptr [eax+48]
 004F5CF1    mov         edx,0FFFFFF
 004F5CF6    call        TBrush.SetColor
 004F5CFB    mov         dl,1
 004F5CFD    mov         eax,dword ptr [ebp-14]
 004F5D00    call        TBitmap.SetMonochrome
 004F5D05    mov         eax,dword ptr [ebp-0C]
 004F5D08    call        TBitmap.GetCanvas
 004F5D0D    mov         ebx,eax
 004F5D0F    mov         eax,dword ptr [ebx+48]
 004F5D12    mov         edx,0FF00000F
 004F5D17    call        TBrush.SetColor
 004F5D1C    lea         edx,[ebp-28]
 004F5D1F    mov         eax,ebx
 004F5D21    mov         ecx,dword ptr [eax]
 004F5D23    call        dword ptr [ecx+54]
 004F5D26    mov         eax,dword ptr [ebx+48]
 004F5D29    mov         edx,0FF000014
 004F5D2E    call        TBrush.SetColor
 004F5D33    push        0
 004F5D35    mov         eax,ebx
 004F5D37    call        TCanvas.GetHandle
 004F5D3C    push        eax
 004F5D3D    call        gdi32.SetTextColor
 004F5D42    push        0FFFFFF
 004F5D47    mov         eax,ebx
 004F5D49    call        TCanvas.GetHandle
 004F5D4E    push        eax
 004F5D4F    call        gdi32.SetBkColor
 004F5D54    push        0E20746
 004F5D59    push        0
 004F5D5B    push        0
 004F5D5D    mov         eax,dword ptr [ebp-14]
 004F5D60    call        TBitmap.GetCanvas
 004F5D65    call        TCanvas.GetHandle
 004F5D6A    push        eax
 004F5D6B    push        esi
 004F5D6C    push        edi
 004F5D6D    push        1
 004F5D6F    push        1
 004F5D71    mov         eax,ebx
 004F5D73    call        TCanvas.GetHandle
 004F5D78    push        eax
 004F5D79    call        gdi32.BitBlt
 004F5D7E    mov         eax,dword ptr [ebx+48]
 004F5D81    mov         edx,0FF000010
 004F5D86    call        TBrush.SetColor
 004F5D8B    push        0
 004F5D8D    mov         eax,ebx
 004F5D8F    call        TCanvas.GetHandle
 004F5D94    push        eax
 004F5D95    call        gdi32.SetTextColor
 004F5D9A    push        0FFFFFF
 004F5D9F    mov         eax,ebx
 004F5DA1    call        TCanvas.GetHandle
 004F5DA6    push        eax
 004F5DA7    call        gdi32.SetBkColor
 004F5DAC    push        0E20746
 004F5DB1    push        0
 004F5DB3    push        0
 004F5DB5    mov         eax,dword ptr [ebp-14]
 004F5DB8    call        TBitmap.GetCanvas
 004F5DBD    call        TCanvas.GetHandle
 004F5DC2    push        eax
 004F5DC3    push        esi
 004F5DC4    push        edi
 004F5DC5    push        0
 004F5DC7    push        0
 004F5DC9    mov         eax,ebx
 004F5DCB    call        TCanvas.GetHandle
 004F5DD0    push        eax
 004F5DD1    call        gdi32.BitBlt
 004F5DD6    xor         eax,eax
 004F5DD8    pop         edx
 004F5DD9    pop         ecx
 004F5DDA    pop         ecx
 004F5DDB    mov         dword ptr fs:[eax],edx
 004F5DDE    push        4F5DFB
 004F5DE3    mov         eax,dword ptr [ebp-10]
 004F5DE6    call        TObject.Free
 004F5DEB    mov         eax,dword ptr [ebp-14]
 004F5DEE    call        TObject.Free
 004F5DF3    ret
>004F5DF4    jmp         @HandleFinally
>004F5DF9    jmp         004F5DE3
 004F5DFB    mov         eax,dword ptr [ebp-4]
 004F5DFE    mov         eax,dword ptr [eax+8]
 004F5E01    mov         ecx,20000000
 004F5E06    mov         edx,dword ptr [ebp-0C]
 004F5E09    call        TGlyphList.AddMasked
 004F5E0E    movzx       edx,byte ptr [ebp-5]
 004F5E12    mov         ecx,dword ptr [ebp-4]
 004F5E15    mov         dword ptr [ecx+edx*4+0C],eax
 004F5E19    xor         eax,eax
 004F5E1B    pop         edx
 004F5E1C    pop         ecx
 004F5E1D    pop         ecx
 004F5E1E    mov         dword ptr fs:[eax],edx
 004F5E21    push        4F5E36
 004F5E26    mov         eax,dword ptr [ebp-0C]
 004F5E29    call        TObject.Free
 004F5E2E    ret
>004F5E2F    jmp         @HandleFinally
>004F5E34    jmp         004F5E26
 004F5E36    movzx       eax,byte ptr [ebp-5]
 004F5E3A    mov         edx,dword ptr [ebp-4]
 004F5E3D    mov         ebx,dword ptr [edx+eax*4+0C]
 004F5E41    mov         eax,dword ptr [ebp-4]
 004F5E44    mov         eax,dword ptr [eax+4]
 004F5E47    call        TBitmap.Dormant
 004F5E4C    mov         eax,ebx
 004F5E4E    pop         edi
 004F5E4F    pop         esi
 004F5E50    pop         ebx
 004F5E51    mov         esp,ebp
 004F5E53    pop         ebp
 004F5E54    ret
*}
end;

//004F5E58
procedure TButtonGlyph.DrawButtonGlyph(Canvas:TCanvas; const GlyphPos:TPoint; State:TButtonState; Transparent:Boolean);
begin
{*
 004F5E58    push        ebp
 004F5E59    mov         ebp,esp
 004F5E5B    add         esp,0FFFFFFD4
 004F5E5E    push        ebx
 004F5E5F    push        esi
 004F5E60    push        edi
 004F5E61    mov         esi,ecx
 004F5E63    mov         dword ptr [ebp-4],edx
 004F5E66    mov         ebx,eax
 004F5E68    cmp         dword ptr [ebx+4],0
>004F5E6C    je          004F6023
 004F5E72    mov         eax,dword ptr [ebx+4]
 004F5E75    mov         edx,dword ptr [eax]
 004F5E77    call        dword ptr [edx+30]
 004F5E7A    test        eax,eax
>004F5E7C    je          004F6023
 004F5E82    mov         eax,dword ptr [ebx+4]
 004F5E85    mov         edx,dword ptr [eax]
 004F5E87    call        dword ptr [edx+24]
 004F5E8A    test        eax,eax
>004F5E8C    je          004F6023
 004F5E92    movzx       edx,byte ptr [ebp+0C]
 004F5E96    mov         eax,ebx
 004F5E98    call        TButtonGlyph.CreateButtonGlyph
 004F5E9D    mov         edi,eax
 004F5E9F    cmp         byte ptr [ebx+31],0
>004F5EA3    je          004F5FB1
 004F5EA9    mov         eax,dword ptr [esi]
 004F5EAB    mov         dword ptr [ebp-2C],eax
 004F5EAE    mov         eax,dword ptr [esi+4]
 004F5EB1    mov         dword ptr [ebp-28],eax
 004F5EB4    mov         eax,dword ptr [ebx+4]
 004F5EB7    mov         edx,dword ptr [eax]
 004F5EB9    call        dword ptr [edx+30]
 004F5EBC    movzx       edx,byte ptr [ebx+20]
 004F5EC0    mov         ecx,edx
 004F5EC2    cdq
 004F5EC3    idiv        eax,ecx
 004F5EC5    add         eax,dword ptr [ebp-2C]
 004F5EC8    mov         dword ptr [ebp-24],eax
 004F5ECB    mov         eax,dword ptr [ebx+4]
 004F5ECE    mov         edx,dword ptr [eax]
 004F5ED0    call        dword ptr [edx+24]
 004F5ED3    add         eax,dword ptr [ebp-28]
 004F5ED6    mov         dword ptr [ebp-20],eax
 004F5ED9    movzx       eax,byte ptr [ebp+0C]
 004F5EDD    dec         al
>004F5EDF    je          004F5EE8
 004F5EE1    dec         eax
 004F5EE2    sub         al,2
>004F5EE4    jb          004F5EEE
>004F5EE6    jmp         004F5EF4
 004F5EE8    mov         byte ptr [ebp-5],5
>004F5EEC    jmp         004F5EF8
 004F5EEE    mov         byte ptr [ebp-5],4
>004F5EF2    jmp         004F5EF8
 004F5EF4    mov         byte ptr [ebp-5],2
 004F5EF8    call        ThemeServices
 004F5EFD    lea         ecx,[ebp-1C]
 004F5F00    movzx       edx,byte ptr [ebp-5]
 004F5F04    call        TThemeServices.GetElementDetails
 004F5F09    cmp         byte ptr [ebx+21],0
>004F5F0D    je          004F5F8A
 004F5F0F    lea         eax,[ebp-0C]
 004F5F12    push        eax
 004F5F13    push        0
 004F5F15    push        2
 004F5F17    lea         eax,[ebp-2C]
 004F5F1A    push        eax
 004F5F1B    mov         eax,dword ptr [ebp-4]
 004F5F1E    call        TCanvas.GetHandle
 004F5F23    push        eax
 004F5F24    call        BeginBufferedPaint
 004F5F29    mov         dword ptr [ebp-10],eax
 004F5F2C    xor         eax,eax
 004F5F2E    push        ebp
 004F5F2F    push        4F5F83
 004F5F34    push        dword ptr fs:[eax]
 004F5F37    mov         dword ptr fs:[eax],esp
 004F5F3A    lea         eax,[ebp-2C]
 004F5F3D    push        eax
 004F5F3E    mov         eax,dword ptr [ebx+8]
 004F5F41    call        TCustomImageList.GetHandle
 004F5F46    push        eax
 004F5F47    push        edi
 004F5F48    call        ThemeServices
 004F5F4D    lea         ecx,[ebp-1C]
 004F5F50    mov         edx,dword ptr [ebp-0C]
 004F5F53    call        TThemeServices.DrawIcon
 004F5F58    push        0FF
 004F5F5D    lea         eax,[ebp-2C]
 004F5F60    push        eax
 004F5F61    mov         eax,dword ptr [ebp-10]
 004F5F64    push        eax
 004F5F65    call        BufferedPaintSetAlpha
 004F5F6A    xor         eax,eax
 004F5F6C    pop         edx
 004F5F6D    pop         ecx
 004F5F6E    pop         ecx
 004F5F6F    mov         dword ptr fs:[eax],edx
 004F5F72    push        4F6023
 004F5F77    push        0FF
 004F5F79    mov         eax,dword ptr [ebp-10]
 004F5F7C    push        eax
 004F5F7D    call        EndBufferedPaint
 004F5F82    ret
>004F5F83    jmp         @HandleFinally
>004F5F88    jmp         004F5F77
 004F5F8A    lea         eax,[ebp-2C]
 004F5F8D    push        eax
 004F5F8E    mov         eax,dword ptr [ebx+8]
 004F5F91    call        TCustomImageList.GetHandle
 004F5F96    push        eax
 004F5F97    push        edi
 004F5F98    mov         eax,dword ptr [ebp-4]
 004F5F9B    call        TCanvas.GetHandle
 004F5FA0    push        eax
 004F5FA1    call        ThemeServices
 004F5FA6    lea         ecx,[ebp-1C]
 004F5FA9    pop         edx
 004F5FAA    call        TThemeServices.DrawIcon
>004F5FAF    jmp         004F6023
 004F5FB1    cmp         byte ptr [ebp+8],0
>004F5FB5    jne         004F5FBD
 004F5FB7    cmp         byte ptr [ebp+0C],3
>004F5FBB    jne         004F5FEE
 004F5FBD    push        1
 004F5FBF    push        1FFFFFFF
 004F5FC4    push        1FFFFFFF
 004F5FC9    push        0
 004F5FCB    push        0
 004F5FCD    mov         eax,dword ptr [esi+4]
 004F5FD0    push        eax
 004F5FD1    mov         eax,dword ptr [esi]
 004F5FD3    push        eax
 004F5FD4    mov         eax,dword ptr [ebp-4]
 004F5FD7    call        TCanvas.GetHandle
 004F5FDC    push        eax
 004F5FDD    push        edi
 004F5FDE    mov         eax,dword ptr [ebx+8]
 004F5FE1    call        TCustomImageList.GetHandle
 004F5FE6    push        eax
 004F5FE7    call        comctl32.ImageList_DrawEx
>004F5FEC    jmp         004F6023
 004F5FEE    push        0
 004F5FF0    push        1FFFFFFF
 004F5FF5    mov         eax,0FF00000F
 004F5FFA    call        ColorToRGB
 004F5FFF    push        eax
 004F6000    push        0
 004F6002    push        0
 004F6004    mov         eax,dword ptr [esi+4]
 004F6007    push        eax
 004F6008    mov         eax,dword ptr [esi]
 004F600A    push        eax
 004F600B    mov         eax,dword ptr [ebp-4]
 004F600E    call        TCanvas.GetHandle
 004F6013    push        eax
 004F6014    push        edi
 004F6015    mov         eax,dword ptr [ebx+8]
 004F6018    call        TCustomImageList.GetHandle
 004F601D    push        eax
 004F601E    call        comctl32.ImageList_DrawEx
 004F6023    pop         edi
 004F6024    pop         esi
 004F6025    pop         ebx
 004F6026    mov         esp,ebp
 004F6028    pop         ebp
 004F6029    ret         8
*}
end;

//004F602C
procedure DoDrawText(DC:HDC; const Text:UnicodeString; var TextRect:TRect; TextFlags:Cardinal);
begin
{*
 004F602C    push        ebp
 004F602D    mov         ebp,esp
 004F602F    add         esp,0FFFFFFAC
 004F6032    push        ebx
 004F6033    push        esi
 004F6034    push        edi
 004F6035    xor         ebx,ebx
 004F6037    mov         dword ptr [ebp-54],ebx
 004F603A    mov         edi,ecx
 004F603C    mov         esi,edx
 004F603E    mov         dword ptr [ebp-4],eax
 004F6041    xor         eax,eax
 004F6043    push        ebp
 004F6044    push        4F61A2
 004F6049    push        dword ptr fs:[eax]
 004F604C    mov         dword ptr fs:[eax],esp
 004F604F    mov         eax,dword ptr [ebp+0C]
 004F6052    mov         eax,dword ptr [eax-4]
 004F6055    cmp         byte ptr [eax+31],0
>004F6059    je          004F616A
 004F605F    mov         eax,dword ptr [ebp+0C]
 004F6062    mov         eax,dword ptr [eax-4]
 004F6065    cmp         byte ptr [eax+21],0
>004F6069    je          004F6106
 004F606F    lea         eax,[ebp-50]
 004F6072    xor         ecx,ecx
 004F6074    mov         edx,40
 004F6079    call        @FillChar
 004F607E    mov         dword ptr [ebp-50],40
 004F6085    mov         dword ptr [ebp-4C],2001
 004F608C    mov         eax,dword ptr [ebp+0C]
 004F608F    mov         eax,dword ptr [eax-8]
 004F6092    mov         eax,dword ptr [eax+40]
 004F6095    mov         eax,dword ptr [eax+18]
 004F6098    call        ColorToRGB
 004F609D    mov         dword ptr [ebp-48],eax
 004F60A0    call        ThemeServices
 004F60A5    mov         edx,dword ptr [ebp+0C]
 004F60A8    mov         edx,dword ptr [edx-4]
 004F60AB    movzx       edx,byte ptr [edx+30]
 004F60AF    call        TThemeServices.GetTheme
 004F60B4    mov         dword ptr [ebp-8],eax
 004F60B7    mov         ebx,esi
 004F60B9    test        ebx,ebx
>004F60BB    je          004F60C2
 004F60BD    sub         ebx,4
 004F60C0    mov         ebx,dword ptr [ebx]
 004F60C2    mov         eax,dword ptr [ebp+0C]
 004F60C5    mov         eax,dword ptr [eax-4]
 004F60C8    mov         eax,dword ptr [eax+28]
 004F60CB    mov         dword ptr [ebp-0C],eax
 004F60CE    mov         eax,dword ptr [ebp+0C]
 004F60D1    mov         eax,dword ptr [eax-4]
 004F60D4    mov         eax,dword ptr [eax+2C]
 004F60D7    mov         dword ptr [ebp-10],eax
 004F60DA    lea         eax,[ebp-50]
 004F60DD    push        eax
 004F60DE    push        edi
 004F60DF    mov         eax,dword ptr [ebp+8]
 004F60E2    push        eax
 004F60E3    push        ebx
 004F60E4    mov         eax,esi
 004F60E6    call        @UStrToPWChar
 004F60EB    push        eax
 004F60EC    mov         eax,dword ptr [ebp-10]
 004F60EF    push        eax
 004F60F0    mov         eax,dword ptr [ebp-0C]
 004F60F3    push        eax
 004F60F4    mov         eax,dword ptr [ebp-4]
 004F60F7    push        eax
 004F60F8    mov         eax,dword ptr [ebp-8]
 004F60FB    push        eax
 004F60FC    call        DrawThemeTextEx
>004F6101    jmp         004F618C
 004F6106    mov         eax,dword ptr [ebp+0C]
 004F6109    cmp         byte ptr [eax+0C],1
>004F610D    jne         004F6146
 004F610F    lea         eax,[ebp-54]
 004F6112    mov         edx,esi
 004F6114    call        @WStrFromUStr
 004F6119    mov         eax,dword ptr [ebp-54]
 004F611C    push        eax
 004F611D    push        edi
 004F611E    mov         eax,dword ptr [ebp+8]
 004F6121    push        eax
 004F6122    push        0
 004F6124    mov         eax,dword ptr [ebp+0C]
 004F6127    mov         eax,dword ptr [eax-8]
 004F612A    call        TCanvas.GetHandle
 004F612F    push        eax
 004F6130    call        ThemeServices
 004F6135    mov         edx,dword ptr [ebp+0C]
 004F6138    mov         edx,dword ptr [edx-4]
 004F613B    lea         ecx,[edx+24]
 004F613E    pop         edx
 004F613F    call        TThemeServices.DrawText
>004F6144    jmp         004F618C
 004F6146    mov         ebx,esi
 004F6148    test        ebx,ebx
>004F614A    je          004F6151
 004F614C    sub         ebx,4
 004F614F    mov         ebx,dword ptr [ebx]
 004F6151    mov         eax,dword ptr [ebp+8]
 004F6154    push        eax
 004F6155    push        edi
 004F6156    push        ebx
 004F6157    mov         eax,esi
 004F6159    call        @UStrToPWChar
 004F615E    push        eax
 004F615F    mov         eax,dword ptr [ebp-4]
 004F6162    push        eax
 004F6163    call        user32.DrawTextW
>004F6168    jmp         004F618C
 004F616A    mov         ebx,esi
 004F616C    test        ebx,ebx
>004F616E    je          004F6175
 004F6170    sub         ebx,4
 004F6173    mov         ebx,dword ptr [ebx]
 004F6175    mov         eax,dword ptr [ebp+8]
 004F6178    push        eax
 004F6179    push        edi
 004F617A    push        ebx
 004F617B    mov         eax,esi
 004F617D    call        @UStrToPWChar
 004F6182    push        eax
 004F6183    mov         eax,dword ptr [ebp-4]
 004F6186    push        eax
 004F6187    call        user32.DrawTextW
 004F618C    xor         eax,eax
 004F618E    pop         edx
 004F618F    pop         ecx
 004F6190    pop         ecx
 004F6191    mov         dword ptr fs:[eax],edx
 004F6194    push        4F61A9
 004F6199    lea         eax,[ebp-54]
 004F619C    call        @WStrClr
 004F61A1    ret
>004F61A2    jmp         @HandleFinally
>004F61A7    jmp         004F6199
 004F61A9    pop         edi
 004F61AA    pop         esi
 004F61AB    pop         ebx
 004F61AC    mov         esp,ebp
 004F61AE    pop         ebp
 004F61AF    ret         4
*}
end;

//004F61B4
procedure TButtonGlyph.DrawButtonText(Canvas:TCanvas; const Caption:UnicodeString; TextBounds:TRect; State:TButtonState; Flags:LongInt);
begin
{*
 004F61B4    push        ebp
 004F61B5    mov         ebp,esp
 004F61B7    add         esp,0FFFFFFE8
 004F61BA    push        ebx
 004F61BB    push        esi
 004F61BC    push        edi
 004F61BD    mov         esi,dword ptr [ebp+10]
 004F61C0    lea         edi,[ebp-18]
 004F61C3    movs        dword ptr [edi],dword ptr [esi]
 004F61C4    movs        dword ptr [edi],dword ptr [esi]
 004F61C5    movs        dword ptr [edi],dword ptr [esi]
 004F61C6    movs        dword ptr [edi],dword ptr [esi]
 004F61C7    mov         ebx,ecx
 004F61C9    mov         dword ptr [ebp-8],edx
 004F61CC    mov         dword ptr [ebp-4],eax
 004F61CF    mov         esi,dword ptr [ebp+8]
 004F61D2    mov         eax,dword ptr [ebp-8]
 004F61D5    mov         eax,dword ptr [eax+48]
 004F61D8    mov         dl,1
 004F61DA    call        TBrush.SetStyle
 004F61DF    cmp         byte ptr [ebp+0C],1
>004F61E3    jne         004F625C
 004F61E5    mov         eax,dword ptr [ebp-4]
 004F61E8    cmp         byte ptr [eax+31],0
>004F61EC    jne         004F625C
 004F61EE    push        1
 004F61F0    push        1
 004F61F2    lea         eax,[ebp-18]
 004F61F5    push        eax
 004F61F6    call        user32.OffsetRect
 004F61FB    mov         eax,dword ptr [ebp-8]
 004F61FE    mov         eax,dword ptr [eax+40]
 004F6201    mov         edx,0FF000014
 004F6206    call        TFont.SetColor
 004F620B    push        ebp
 004F620C    mov         edi,esi
 004F620E    or          edi,105
 004F6214    push        edi
 004F6215    mov         eax,dword ptr [ebp-8]
 004F6218    call        TCanvas.GetHandle
 004F621D    lea         ecx,[ebp-18]
 004F6220    mov         edx,ebx
 004F6222    call        DoDrawText
 004F6227    pop         ecx
 004F6228    push        0FF
 004F622A    push        0FF
 004F622C    lea         eax,[ebp-18]
 004F622F    push        eax
 004F6230    call        user32.OffsetRect
 004F6235    mov         eax,dword ptr [ebp-8]
 004F6238    mov         eax,dword ptr [eax+40]
 004F623B    mov         edx,0FF000010
 004F6240    call        TFont.SetColor
 004F6245    push        ebp
 004F6246    push        edi
 004F6247    mov         eax,dword ptr [ebp-8]
 004F624A    call        TCanvas.GetHandle
 004F624F    lea         ecx,[ebp-18]
 004F6252    mov         edx,ebx
 004F6254    call        DoDrawText
 004F6259    pop         ecx
>004F625A    jmp         004F6277
 004F625C    push        ebp
 004F625D    or          esi,105
 004F6263    push        esi
 004F6264    mov         eax,dword ptr [ebp-8]
 004F6267    call        TCanvas.GetHandle
 004F626C    lea         ecx,[ebp-18]
 004F626F    mov         edx,ebx
 004F6271    call        DoDrawText
 004F6276    pop         ecx
 004F6277    pop         edi
 004F6278    pop         esi
 004F6279    pop         ebx
 004F627A    mov         esp,ebp
 004F627C    pop         ebp
 004F627D    ret         0C
*}
end;

//004F6280
procedure TButtonGlyph.CalcButtonLayout(Canvas:TCanvas; const Client:TRect; const Offset:TPoint; const Caption:UnicodeString; Layout:TButtonLayout; Margin:Integer; Spacing:Integer; var GlyphPos:TPoint; var TextBounds:TRect; BiDiFlags:LongInt);
begin
{*
 004F6280    push        ebp
 004F6281    mov         ebp,esp
 004F6283    add         esp,0FFFFFF74
 004F6289    push        ebx
 004F628A    push        esi
 004F628B    push        edi
 004F628C    mov         ebx,ecx
 004F628E    mov         dword ptr [ebp-8],edx
 004F6291    mov         dword ptr [ebp-4],eax
 004F6294    mov         edi,dword ptr [ebp+0C]
 004F6297    mov         esi,dword ptr [ebp+10]
 004F629A    mov         eax,dword ptr [ebp+8]
 004F629D    and         eax,2
 004F62A0    cmp         eax,2
>004F62A3    jne         004F62BB
 004F62A5    cmp         byte ptr [ebp+1C],0
>004F62A9    jne         004F62B1
 004F62AB    mov         byte ptr [ebp+1C],1
>004F62AF    jmp         004F62BB
 004F62B1    cmp         byte ptr [ebp+1C],1
>004F62B5    jne         004F62BB
 004F62B7    mov         byte ptr [ebp+1C],0
 004F62BB    mov         eax,dword ptr [ebx+8]
 004F62BE    sub         eax,dword ptr [ebx]
 004F62C0    mov         edx,dword ptr [ebx+0C]
 004F62C3    sub         edx,dword ptr [ebx+4]
 004F62C6    mov         dword ptr [ebp-38],eax
 004F62C9    mov         dword ptr [ebp-34],edx
 004F62CC    mov         eax,dword ptr [ebp-38]
 004F62CF    mov         dword ptr [ebp-18],eax
 004F62D2    mov         eax,dword ptr [ebp-34]
 004F62D5    mov         dword ptr [ebp-14],eax
 004F62D8    mov         eax,dword ptr [ebp-4]
 004F62DB    cmp         dword ptr [eax+4],0
>004F62DF    je          004F631D
 004F62E1    mov         eax,dword ptr [ebp-4]
 004F62E4    mov         eax,dword ptr [eax+4]
 004F62E7    mov         edx,dword ptr [eax]
 004F62E9    call        dword ptr [edx+30]
 004F62EC    mov         edx,dword ptr [ebp-4]
 004F62EF    movzx       edx,byte ptr [edx+20]
 004F62F3    mov         ecx,edx
 004F62F5    cdq
 004F62F6    idiv        eax,ecx
 004F62F8    mov         dword ptr [ebp-3C],eax
 004F62FB    mov         eax,dword ptr [ebp-4]
 004F62FE    mov         eax,dword ptr [eax+4]
 004F6301    mov         edx,dword ptr [eax]
 004F6303    call        dword ptr [edx+24]
 004F6306    mov         edx,dword ptr [ebp-3C]
 004F6309    mov         dword ptr [ebp-44],edx
 004F630C    mov         dword ptr [ebp-40],eax
 004F630F    mov         eax,dword ptr [ebp-44]
 004F6312    mov         dword ptr [ebp-20],eax
 004F6315    mov         eax,dword ptr [ebp-40]
 004F6318    mov         dword ptr [ebp-1C],eax
>004F631B    jmp         004F6333
 004F631D    xor         eax,eax
 004F631F    mov         dword ptr [ebp-4C],eax
 004F6322    xor         eax,eax
 004F6324    mov         dword ptr [ebp-48],eax
 004F6327    mov         eax,dword ptr [ebp-4C]
 004F632A    mov         dword ptr [ebp-20],eax
 004F632D    mov         eax,dword ptr [ebp-48]
 004F6330    mov         dword ptr [ebp-1C],eax
 004F6333    mov         eax,dword ptr [ebp+20]
 004F6336    test        eax,eax
>004F6338    je          004F633F
 004F633A    sub         eax,4
 004F633D    mov         eax,dword ptr [eax]
 004F633F    test        eax,eax
>004F6341    jle         004F63CD
 004F6347    push        0
 004F6349    lea         eax,[ebp-8C]
 004F634F    push        eax
 004F6350    mov         ecx,dword ptr [ebx+8]
 004F6353    sub         ecx,dword ptr [ebx]
 004F6355    xor         edx,edx
 004F6357    xor         eax,eax
 004F6359    call        Rect
 004F635E    push        esi
 004F635F    push        edi
 004F6360    lea         esi,[ebp-8C]
 004F6366    movs        dword ptr [edi],dword ptr [esi]
 004F6367    movs        dword ptr [edi],dword ptr [esi]
 004F6368    movs        dword ptr [edi],dword ptr [esi]
 004F6369    movs        dword ptr [edi],dword ptr [esi]
 004F636A    pop         edi
 004F636B    pop         esi
 004F636C    mov         eax,dword ptr [ebp-8]
 004F636F    call        TCanvas.GetHandle
 004F6374    mov         dword ptr [ebp-54],eax
 004F6377    mov         eax,dword ptr [ebp+20]
 004F637A    mov         dword ptr [ebp-50],eax
 004F637D    cmp         dword ptr [ebp-50],0
>004F6381    je          004F638E
 004F6383    mov         eax,dword ptr [ebp-50]
 004F6386    sub         eax,4
 004F6389    mov         eax,dword ptr [eax]
 004F638B    mov         dword ptr [ebp-50],eax
 004F638E    mov         eax,dword ptr [ebp+8]
 004F6391    or          eax,400
 004F6396    push        eax
 004F6397    push        edi
 004F6398    mov         eax,dword ptr [ebp-50]
 004F639B    push        eax
 004F639C    mov         eax,dword ptr [ebp+20]
 004F639F    call        @UStrToPWChar
 004F63A4    push        eax
 004F63A5    mov         eax,dword ptr [ebp-54]
 004F63A8    push        eax
 004F63A9    call        user32.DrawTextW
 004F63AE    mov         eax,dword ptr [edi+8]
 004F63B1    sub         eax,dword ptr [edi]
 004F63B3    mov         edx,dword ptr [edi+0C]
 004F63B6    sub         edx,dword ptr [edi+4]
 004F63B9    mov         dword ptr [ebp-5C],eax
 004F63BC    mov         dword ptr [ebp-58],edx
 004F63BF    mov         eax,dword ptr [ebp-5C]
 004F63C2    mov         dword ptr [ebp-28],eax
 004F63C5    mov         eax,dword ptr [ebp-58]
 004F63C8    mov         dword ptr [ebp-24],eax
>004F63CB    jmp         004F6405
 004F63CD    push        0
 004F63CF    lea         eax,[ebp-8C]
 004F63D5    push        eax
 004F63D6    xor         ecx,ecx
 004F63D8    xor         edx,edx
 004F63DA    xor         eax,eax
 004F63DC    call        Rect
 004F63E1    push        esi
 004F63E2    push        edi
 004F63E3    lea         esi,[ebp-8C]
 004F63E9    movs        dword ptr [edi],dword ptr [esi]
 004F63EA    movs        dword ptr [edi],dword ptr [esi]
 004F63EB    movs        dword ptr [edi],dword ptr [esi]
 004F63EC    movs        dword ptr [edi],dword ptr [esi]
 004F63ED    pop         edi
 004F63EE    pop         esi
 004F63EF    xor         eax,eax
 004F63F1    mov         dword ptr [ebp-64],eax
 004F63F4    xor         eax,eax
 004F63F6    mov         dword ptr [ebp-60],eax
 004F63F9    mov         eax,dword ptr [ebp-64]
 004F63FC    mov         dword ptr [ebp-28],eax
 004F63FF    mov         eax,dword ptr [ebp-60]
 004F6402    mov         dword ptr [ebp-24],eax
 004F6405    movzx       eax,byte ptr [ebp+1C]
 004F6409    sub         al,2
>004F640B    jae         004F6430
 004F640D    mov         eax,dword ptr [ebp-14]
 004F6410    mov         edx,eax
 004F6412    sub         edx,dword ptr [ebp-1C]
 004F6415    inc         edx
 004F6416    sar         edx,1
>004F6418    jns         004F641D
 004F641A    adc         edx,0
 004F641D    mov         dword ptr [esi+4],edx
 004F6420    sub         eax,dword ptr [ebp-24]
 004F6423    inc         eax
 004F6424    sar         eax,1
>004F6426    jns         004F642B
 004F6428    adc         eax,0
 004F642B    mov         dword ptr [ebp-0C],eax
>004F642E    jmp         004F6450
 004F6430    mov         eax,dword ptr [ebp-18]
 004F6433    mov         edx,eax
 004F6435    sub         edx,dword ptr [ebp-20]
 004F6438    inc         edx
 004F6439    sar         edx,1
>004F643B    jns         004F6440
 004F643D    adc         edx,0
 004F6440    mov         dword ptr [esi],edx
 004F6442    sub         eax,dword ptr [ebp-28]
 004F6445    inc         eax
 004F6446    sar         eax,1
>004F6448    jns         004F644D
 004F644A    adc         eax,0
 004F644D    mov         dword ptr [ebp-10],eax
 004F6450    cmp         dword ptr [ebp-28],0
>004F6454    je          004F645C
 004F6456    cmp         dword ptr [ebp-20],0
>004F645A    jne         004F6461
 004F645C    xor         eax,eax
 004F645E    mov         dword ptr [ebp+14],eax
 004F6461    cmp         dword ptr [ebp+18],0FFFFFFFF
>004F6465    jne         004F6518
 004F646B    cmp         dword ptr [ebp+14],0
>004F646F    jge         004F64C6
 004F6471    mov         eax,dword ptr [ebp-20]
 004F6474    add         eax,dword ptr [ebp-28]
 004F6477    mov         dword ptr [ebp-6C],eax
 004F647A    mov         eax,dword ptr [ebp-1C]
 004F647D    add         eax,dword ptr [ebp-24]
 004F6480    mov         dword ptr [ebp-68],eax
 004F6483    mov         eax,dword ptr [ebp-6C]
 004F6486    mov         dword ptr [ebp-30],eax
 004F6489    mov         eax,dword ptr [ebp-68]
 004F648C    mov         dword ptr [ebp-2C],eax
 004F648F    movzx       eax,byte ptr [ebp+1C]
 004F6493    sub         al,2
>004F6495    jae         004F64AA
 004F6497    mov         eax,dword ptr [ebp-18]
 004F649A    sub         eax,dword ptr [ebp-30]
 004F649D    mov         ecx,3
 004F64A2    cdq
 004F64A3    idiv        eax,ecx
 004F64A5    mov         dword ptr [ebp+18],eax
>004F64A8    jmp         004F64BB
 004F64AA    mov         eax,dword ptr [ebp-14]
 004F64AD    sub         eax,dword ptr [ebp-2C]
 004F64B0    mov         ecx,3
 004F64B5    cdq
 004F64B6    idiv        eax,ecx
 004F64B8    mov         dword ptr [ebp+18],eax
 004F64BB    mov         eax,dword ptr [ebp+18]
 004F64BE    mov         dword ptr [ebp+14],eax
>004F64C1    jmp         004F6570
 004F64C6    mov         eax,dword ptr [ebp-20]
 004F64C9    add         eax,dword ptr [ebp+14]
 004F64CC    add         eax,dword ptr [ebp-28]
 004F64CF    mov         dword ptr [ebp-74],eax
 004F64D2    mov         eax,dword ptr [ebp-1C]
 004F64D5    add         eax,dword ptr [ebp+14]
 004F64D8    add         eax,dword ptr [ebp-24]
 004F64DB    mov         dword ptr [ebp-70],eax
 004F64DE    mov         eax,dword ptr [ebp-74]
 004F64E1    mov         dword ptr [ebp-30],eax
 004F64E4    mov         eax,dword ptr [ebp-70]
 004F64E7    mov         dword ptr [ebp-2C],eax
 004F64EA    movzx       eax,byte ptr [ebp+1C]
 004F64EE    sub         al,2
>004F64F0    jae         004F6505
 004F64F2    mov         eax,dword ptr [ebp-18]
 004F64F5    sub         eax,dword ptr [ebp-30]
 004F64F8    inc         eax
 004F64F9    sar         eax,1
>004F64FB    jns         004F6500
 004F64FD    adc         eax,0
 004F6500    mov         dword ptr [ebp+18],eax
>004F6503    jmp         004F6570
 004F6505    mov         eax,dword ptr [ebp-14]
 004F6508    sub         eax,dword ptr [ebp-2C]
 004F650B    inc         eax
 004F650C    sar         eax,1
>004F650E    jns         004F6513
 004F6510    adc         eax,0
 004F6513    mov         dword ptr [ebp+18],eax
>004F6516    jmp         004F6570
 004F6518    cmp         dword ptr [ebp+14],0
>004F651C    jge         004F6570
 004F651E    mov         eax,dword ptr [ebp+18]
 004F6521    add         eax,dword ptr [ebp-20]
 004F6524    mov         edx,dword ptr [ebp-18]
 004F6527    sub         edx,eax
 004F6529    mov         dword ptr [ebp-7C],edx
 004F652C    mov         eax,dword ptr [ebp+18]
 004F652F    add         eax,dword ptr [ebp-1C]
 004F6532    mov         edx,dword ptr [ebp-14]
 004F6535    sub         edx,eax
 004F6537    mov         dword ptr [ebp-78],edx
 004F653A    mov         eax,dword ptr [ebp-7C]
 004F653D    mov         dword ptr [ebp-30],eax
 004F6540    mov         eax,dword ptr [ebp-78]
 004F6543    mov         dword ptr [ebp-2C],eax
 004F6546    movzx       eax,byte ptr [ebp+1C]
 004F654A    sub         al,2
>004F654C    jae         004F6560
 004F654E    mov         eax,dword ptr [ebp-30]
 004F6551    sub         eax,dword ptr [ebp-28]
 004F6554    sar         eax,1
>004F6556    jns         004F655B
 004F6558    adc         eax,0
 004F655B    mov         dword ptr [ebp+14],eax
>004F655E    jmp         004F6570
 004F6560    mov         eax,dword ptr [ebp-2C]
 004F6563    sub         eax,dword ptr [ebp-24]
 004F6566    sar         eax,1
>004F6568    jns         004F656D
 004F656A    adc         eax,0
 004F656D    mov         dword ptr [ebp+14],eax
 004F6570    movzx       eax,byte ptr [ebp+1C]
 004F6574    sub         al,1
>004F6576    jb          004F6584
>004F6578    je          004F6594
 004F657A    dec         al
>004F657C    je          004F65AA
 004F657E    dec         al
>004F6580    je          004F65BB
>004F6582    jmp         004F65D0
 004F6584    mov         eax,dword ptr [ebp+18]
 004F6587    mov         dword ptr [esi],eax
 004F6589    add         eax,dword ptr [ebp-20]
 004F658C    add         eax,dword ptr [ebp+14]
 004F658F    mov         dword ptr [ebp-10],eax
>004F6592    jmp         004F65D0
 004F6594    mov         eax,dword ptr [ebp-18]
 004F6597    sub         eax,dword ptr [ebp+18]
 004F659A    sub         eax,dword ptr [ebp-20]
 004F659D    mov         dword ptr [esi],eax
 004F659F    sub         eax,dword ptr [ebp+14]
 004F65A2    sub         eax,dword ptr [ebp-28]
 004F65A5    mov         dword ptr [ebp-10],eax
>004F65A8    jmp         004F65D0
 004F65AA    mov         eax,dword ptr [ebp+18]
 004F65AD    mov         dword ptr [esi+4],eax
 004F65B0    add         eax,dword ptr [ebp-1C]
 004F65B3    add         eax,dword ptr [ebp+14]
 004F65B6    mov         dword ptr [ebp-0C],eax
>004F65B9    jmp         004F65D0
 004F65BB    mov         eax,dword ptr [ebp-14]
 004F65BE    sub         eax,dword ptr [ebp+18]
 004F65C1    sub         eax,dword ptr [ebp-1C]
 004F65C4    mov         dword ptr [esi+4],eax
 004F65C7    sub         eax,dword ptr [ebp+14]
 004F65CA    sub         eax,dword ptr [ebp-24]
 004F65CD    mov         dword ptr [ebp-0C],eax
 004F65D0    mov         eax,dword ptr [ebx]
 004F65D2    mov         edx,dword ptr [ebp+24]
 004F65D5    add         eax,dword ptr [edx]
 004F65D7    add         dword ptr [esi],eax
 004F65D9    mov         eax,dword ptr [ebx+4]
 004F65DC    mov         edx,dword ptr [ebp+24]
 004F65DF    add         eax,dword ptr [edx+4]
 004F65E2    add         dword ptr [esi+4],eax
 004F65E5    mov         eax,dword ptr [ebx+4]
 004F65E8    add         eax,dword ptr [ebp-0C]
 004F65EB    mov         edx,dword ptr [ebp+24]
 004F65EE    add         eax,dword ptr [edx+4]
 004F65F1    push        eax
 004F65F2    mov         eax,dword ptr [ebx]
 004F65F4    add         eax,dword ptr [ebp-10]
 004F65F7    mov         edx,dword ptr [ebp+24]
 004F65FA    add         eax,dword ptr [edx]
 004F65FC    push        eax
 004F65FD    push        edi
 004F65FE    call        user32.OffsetRect
 004F6603    pop         edi
 004F6604    pop         esi
 004F6605    pop         ebx
 004F6606    mov         esp,ebp
 004F6608    pop         ebp
 004F6609    ret         20
*}
end;

//004F660C
function TButtonGlyph.Draw(Canvas:TCanvas; Client:TRect; BiDiFlags:Integer; Transparent:Boolean; State:TButtonState; Spacing:Integer; Margin:Integer; Layout:TButtonLayout; Caption:string; Offset:TPoint):TRect;
begin
{*
 004F660C    push        ebp
 004F660D    mov         ebp,esp
 004F660F    add         esp,0FFFFFFF4
 004F6612    push        ebx
 004F6613    push        esi
 004F6614    push        edi
 004F6615    mov         dword ptr [ebp-4],ecx
 004F6618    mov         esi,edx
 004F661A    mov         ebx,eax
 004F661C    mov         edi,dword ptr [ebp+24]
 004F661F    mov         eax,dword ptr [ebp+28]
 004F6622    push        eax
 004F6623    push        edi
 004F6624    movzx       eax,byte ptr [ebp+20]
 004F6628    push        eax
 004F6629    mov         eax,dword ptr [ebp+1C]
 004F662C    push        eax
 004F662D    mov         eax,dword ptr [ebp+18]
 004F6630    push        eax
 004F6631    lea         eax,[ebp-0C]
 004F6634    push        eax
 004F6635    mov         eax,dword ptr [ebp+8]
 004F6638    push        eax
 004F6639    mov         eax,dword ptr [ebp+0C]
 004F663C    push        eax
 004F663D    mov         ecx,dword ptr [ebp-4]
 004F6640    mov         edx,esi
 004F6642    mov         eax,ebx
 004F6644    call        TButtonGlyph.CalcButtonLayout
 004F6649    movzx       eax,byte ptr [ebp+14]
 004F664D    push        eax
 004F664E    movzx       eax,byte ptr [ebp+10]
 004F6652    push        eax
 004F6653    lea         ecx,[ebp-0C]
 004F6656    mov         edx,esi
 004F6658    mov         eax,ebx
 004F665A    call        TButtonGlyph.DrawButtonGlyph
 004F665F    mov         eax,dword ptr [ebp+8]
 004F6662    push        eax
 004F6663    movzx       eax,byte ptr [ebp+14]
 004F6667    push        eax
 004F6668    mov         eax,dword ptr [ebp+0C]
 004F666B    push        eax
 004F666C    mov         ecx,edi
 004F666E    mov         edx,esi
 004F6670    mov         eax,ebx
 004F6672    call        TButtonGlyph.DrawButtonText
 004F6677    pop         edi
 004F6678    pop         esi
 004F6679    pop         ebx
 004F667A    mov         esp,ebp
 004F667C    pop         ebp
 004F667D    ret         24
*}
end;

//004F6680
constructor TBitBtn.Create;
begin
{*
 004F6680    push        ebp
 004F6681    mov         ebp,esp
 004F6683    push        ecx
 004F6684    push        ebx
 004F6685    push        esi
 004F6686    push        edi
 004F6687    test        dl,dl
>004F6689    je          004F6693
 004F668B    add         esp,0FFFFFFF0
 004F668E    call        @ClassCreate
 004F6693    mov         edi,ecx
 004F6695    mov         byte ptr [ebp-1],dl
 004F6698    mov         ebx,eax
 004F669A    mov         dl,1
 004F669C    mov         eax,[004F5104];TButtonGlyph
 004F66A1    call        TButtonGlyph.Create
 004F66A6    mov         esi,eax
 004F66A8    mov         dword ptr [ebx+2CC],esi
 004F66AE    mov         dword ptr [esi+3C],ebx
 004F66B1    mov         dword ptr [esi+38],4F6D80;TBitBtn.GlyphChanged
 004F66B8    mov         ecx,edi
 004F66BA    xor         edx,edx
 004F66BC    mov         eax,ebx
 004F66BE    call        TCustomButton.Create
 004F66C3    mov         dl,1
 004F66C5    mov         eax,[004612EC];TCanvas
 004F66CA    call        TCanvas.Create
 004F66CF    mov         dword ptr [ebx+2C8],eax
 004F66D5    mov         byte ptr [ebx+2D0],0
 004F66DC    mov         byte ptr [ebx+2D1],0
 004F66E3    mov         byte ptr [ebx+2D2],0
 004F66EA    mov         dword ptr [ebx+2D4],4
 004F66F4    mov         dword ptr [ebx+2D8],0FFFFFFFF
 004F66FE    mov         eax,dword ptr [ebx+50]
 004F6701    or          eax,dword ptr ds:[4F6734]
 004F6707    mov         dword ptr [ebx+50],eax
 004F670A    mov         dl,1
 004F670C    mov         eax,ebx
 004F670E    call        TWinControl.SetDoubleBuffered
 004F6713    mov         eax,ebx
 004F6715    cmp         byte ptr [ebp-1],0
>004F6719    je          004F672A
 004F671B    call        @AfterConstruction
 004F6720    pop         dword ptr fs:[0]
 004F6727    add         esp,0C
 004F672A    mov         eax,ebx
 004F672C    pop         edi
 004F672D    pop         esi
 004F672E    pop         ebx
 004F672F    pop         ecx
 004F6730    pop         ebp
 004F6731    ret
*}
end;

//004F6738
destructor TBitBtn.Destroy();
begin
{*
 004F6738    push        ebx
 004F6739    push        esi
 004F673A    call        @BeforeDestruction
 004F673F    mov         ebx,edx
 004F6741    mov         esi,eax
 004F6743    mov         edx,ebx
 004F6745    and         dl,0FC
 004F6748    mov         eax,esi
 004F674A    call        TCustomButton.Destroy
 004F674F    mov         eax,dword ptr [esi+2CC]
 004F6755    call        TObject.Free
 004F675A    mov         eax,dword ptr [esi+2C8]
 004F6760    call        TObject.Free
 004F6765    test        bl,bl
>004F6767    jle         004F6770
 004F6769    mov         eax,esi
 004F676B    call        @ClassDestroy
 004F6770    pop         esi
 004F6771    pop         ebx
 004F6772    ret
*}
end;

//004F6774
procedure TBitBtn.CreateHandle;
begin
{*
 004F6774    push        ebx
 004F6775    push        esi
 004F6776    mov         esi,eax
 004F6778    mov         eax,esi
 004F677A    mov         edx,dword ptr [eax]
 004F677C    call        dword ptr [edx+5C]
 004F677F    test        al,al
>004F6781    je          004F6787
 004F6783    xor         ebx,ebx
>004F6785    jmp         004F6789
 004F6787    mov         bl,1
 004F6789    mov         eax,esi
 004F678B    call        TWinControl.CreateHandle
 004F6790    mov         edx,ebx
 004F6792    mov         eax,dword ptr [esi+2CC]
 004F6798    call        TButtonGlyph.CreateButtonGlyph
 004F679D    pop         esi
 004F679E    pop         ebx
 004F679F    ret
*}
end;

//004F67A0
procedure TBitBtn.CreateParams(var Params:TCreateParams);
begin
{*
 004F67A0    push        ebx
 004F67A1    mov         ebx,edx
 004F67A3    mov         edx,ebx
 004F67A5    call        TCustomButton.CreateParams
 004F67AA    or          dword ptr [ebx+4],0B
 004F67AE    pop         ebx
 004F67AF    ret
*}
end;

//004F67B0
procedure TBitBtn.SetButtonStyle(ADefault:Boolean);
begin
{*
 004F67B0    cmp         dl,byte ptr [eax+2DC]
>004F67B6    je          004F67C3
 004F67B8    mov         byte ptr [eax+2DC],dl
 004F67BE    call        TControl.Refresh
 004F67C3    ret
*}
end;

//004F67C4
procedure TBitBtn.Click;
begin
{*
 004F67C4    push        ebx
 004F67C5    mov         ebx,eax
 004F67C7    movzx       eax,byte ptr [ebx+2D1]
 004F67CE    sub         al,3
>004F67D0    je          004F67F3
 004F67D2    sub         al,3
>004F67D4    jne         004F682A
 004F67D6    mov         dl,1
 004F67D8    mov         eax,ebx
 004F67DA    call        GetParentForm
 004F67DF    test        eax,eax
>004F67E1    je          004F67EA
 004F67E3    call        TCustomForm.Close
>004F67E8    jmp         004F6831
 004F67EA    mov         eax,ebx
 004F67EC    call        TCustomButton.Click
 004F67F1    pop         ebx
 004F67F2    ret
 004F67F3    mov         eax,ebx
>004F67F5    jmp         004F67FA
 004F67F7    mov         eax,dword ptr [eax+34]
 004F67FA    test        eax,eax
>004F67FC    je          004F6807
 004F67FE    cmp         dword ptr [eax+168],0
>004F6805    je          004F67F7
 004F6807    test        eax,eax
>004F6809    je          004F6821
 004F680B    mov         edx,dword ptr ds:[78D590];^Application:TApplication
 004F6811    mov         edx,dword ptr [edx]
 004F6813    mov         eax,dword ptr [eax+168]
 004F6819    xchg        eax,edx
 004F681A    call        TApplication.HelpContext
>004F681F    jmp         004F6831
 004F6821    mov         eax,ebx
 004F6823    call        TCustomButton.Click
 004F6828    pop         ebx
 004F6829    ret
 004F682A    mov         eax,ebx
 004F682C    call        TCustomButton.Click
 004F6831    pop         ebx
 004F6832    ret
*}
end;

//004F6834
procedure TBitBtn.CNMeasureItem(var Message:TWMMeasureItem);
begin
{*
 004F6834    mov         edx,dword ptr [edx+8]
 004F6837    mov         ecx,dword ptr [eax+48]
 004F683A    mov         dword ptr [edx+0C],ecx
 004F683D    mov         eax,dword ptr [eax+4C]
 004F6840    mov         dword ptr [edx+10],eax
 004F6843    ret
*}
end;

//004F6844
procedure TBitBtn.CNDrawItem(var Message:TWMDrawItem);
begin
{*
 004F6844    mov         edx,dword ptr [edx+8]
 004F6847    call        TBitBtn.DrawItem
 004F684C    ret
*}
end;

//004F6850
procedure TBitBtn.DrawItem(const DrawItemStruct:TDrawItemStruct);
begin
{*
 004F6850    push        ebp
 004F6851    mov         ebp,esp
 004F6853    add         esp,0FFFFFFA8
 004F6856    push        ebx
 004F6857    push        esi
 004F6858    push        edi
 004F6859    xor         ecx,ecx
 004F685B    mov         dword ptr [ebp-58],ecx
 004F685E    mov         dword ptr [ebp-54],ecx
 004F6861    mov         esi,edx
 004F6863    mov         ebx,eax
 004F6865    xor         eax,eax
 004F6867    push        ebp
 004F6868    push        4F6CDE
 004F686D    push        dword ptr fs:[eax]
 004F6870    mov         dword ptr fs:[eax],esp
 004F6873    mov         edx,dword ptr [esi+18]
 004F6876    mov         eax,dword ptr [ebx+2C8]
 004F687C    call        TCanvas.SetHandle
 004F6881    lea         edx,[ebp-34]
 004F6884    mov         eax,ebx
 004F6886    mov         ecx,dword ptr [eax]
 004F6888    call        dword ptr [ecx+54]
 004F688B    mov         edx,dword ptr [esi+18]
 004F688E    mov         eax,dword ptr [ebx+2C8]
 004F6894    call        TCanvas.SetHandle
 004F6899    mov         edx,dword ptr [ebx+64]
 004F689C    mov         eax,dword ptr [ebx+2C8]
 004F68A2    call        TCanvas.SetFont
 004F68A7    mov         eax,dword ptr [esi+10]
 004F68AA    test        al,1
 004F68AC    setne       byte ptr [ebp-1]
 004F68B0    test        al,10
 004F68B2    setne       byte ptr [ebp-2]
 004F68B6    mov         eax,ebx
 004F68B8    mov         edx,dword ptr [eax]
 004F68BA    call        dword ptr [edx+5C]
 004F68BD    test        al,al
>004F68BF    jne         004F68C7
 004F68C1    mov         byte ptr [ebp-3],1
>004F68C5    jmp         004F68D7
 004F68C7    cmp         byte ptr [ebp-1],0
>004F68CB    je          004F68D3
 004F68CD    mov         byte ptr [ebp-3],2
>004F68D1    jmp         004F68D7
 004F68D3    mov         byte ptr [ebp-3],0
 004F68D7    mov         eax,ebx
 004F68D9    call        ThemeControl
 004F68DE    test        al,al
>004F68E0    je          004F6AA1
 004F68E6    mov         eax,ebx
 004F68E8    mov         edx,dword ptr [eax]
 004F68EA    call        dword ptr [edx+5C]
 004F68ED    test        al,al
>004F68EF    jne         004F68F7
 004F68F1    mov         byte ptr [ebp-9],5
>004F68F5    jmp         004F6928
 004F68F7    cmp         byte ptr [ebp-1],0
>004F68FB    je          004F6903
 004F68FD    mov         byte ptr [ebp-9],4
>004F6901    jmp         004F6928
 004F6903    cmp         byte ptr [ebx+2DE],0
>004F690A    je          004F6912
 004F690C    mov         byte ptr [ebp-9],3
>004F6910    jmp         004F6928
 004F6912    movzx       eax,byte ptr [ebx+2DC]
 004F6919    or          al,byte ptr [ebp-2]
>004F691C    je          004F6924
 004F691E    mov         byte ptr [ebp-9],6
>004F6922    jmp         004F6928
 004F6924    mov         byte ptr [ebp-9],2
 004F6928    call        ThemeServices
 004F692D    lea         ecx,[ebp-40]
 004F6930    movzx       edx,byte ptr [ebp-9]
 004F6934    call        TThemeServices.GetElementDetails
 004F6939    test        byte ptr [ebx+55],80
>004F693D    jne         004F695F
 004F693F    lea         eax,[ebp-40]
 004F6942    push        eax
 004F6943    push        1
 004F6945    push        0
 004F6947    mov         eax,ebx
 004F6949    call        TWinControl.GetHandle
 004F694E    push        eax
 004F694F    call        ThemeServices
 004F6954    mov         ecx,dword ptr [esi+18]
 004F6957    pop         edx
 004F6958    call        TThemeServices.DrawParentBackground
>004F695D    jmp         004F6974
 004F695F    push        4
 004F6961    call        gdi32.GetStockObject
 004F6966    push        eax
 004F6967    lea         eax,[ebp-34]
 004F696A    push        eax
 004F696B    mov         eax,dword ptr [esi+18]
 004F696E    push        eax
 004F696F    call        user32.FillRect
 004F6974    lea         eax,[esi+1C]
 004F6977    push        eax
 004F6978    call        ThemeServices
 004F697D    mov         edx,dword ptr [esi+18]
 004F6980    lea         ecx,[ebp-40]
 004F6983    call        TThemeServices.DrawElement
 004F6988    lea         eax,[esi+1C]
 004F698B    push        eax
 004F698C    lea         eax,[ebp-34]
 004F698F    push        eax
 004F6990    mov         eax,dword ptr [ebx+2C8]
 004F6996    call        TCanvas.GetHandle
 004F699B    push        eax
 004F699C    call        ThemeServices
 004F69A1    lea         ecx,[ebp-40]
 004F69A4    pop         edx
 004F69A5    call        TThemeServices.ContentRect
 004F69AA    xor         eax,eax
 004F69AC    mov         dword ptr [ebp-1C],eax
 004F69AF    xor         eax,eax
 004F69B1    mov         dword ptr [ebp-18],eax
 004F69B4    mov         eax,dword ptr [ebp-1C]
 004F69B7    mov         dword ptr [ebp-14],eax
 004F69BA    mov         eax,dword ptr [ebp-18]
 004F69BD    mov         dword ptr [ebp-10],eax
 004F69C0    test        byte ptr [ebx+55],80
 004F69C4    setne       dl
 004F69C7    mov         eax,dword ptr [ebx+2CC]
 004F69CD    mov         byte ptr [eax+21],dl
 004F69D0    mov         edx,dword ptr [ebp-40]
 004F69D3    mov         dword ptr [eax+24],edx
 004F69D6    mov         edx,dword ptr [ebp-3C]
 004F69D9    mov         dword ptr [eax+28],edx
 004F69DC    mov         edx,dword ptr [ebp-38]
 004F69DF    mov         dword ptr [eax+2C],edx
 004F69E2    mov         byte ptr [eax+30],0
 004F69E6    mov         eax,ebx
 004F69E8    call        ThemeControl
 004F69ED    mov         esi,dword ptr [ebx+2CC]
 004F69F3    mov         byte ptr [esi+31],al
 004F69F6    lea         eax,[ebp-14]
 004F69F9    push        eax
 004F69FA    lea         edx,[ebp-54]
 004F69FD    mov         eax,ebx
 004F69FF    call        TControl.GetText
 004F6A04    mov         eax,dword ptr [ebp-54]
 004F6A07    push        eax
 004F6A08    movzx       eax,byte ptr [ebx+2D2]
 004F6A0F    push        eax
 004F6A10    mov         eax,dword ptr [ebx+2D8]
 004F6A16    push        eax
 004F6A17    mov         eax,dword ptr [ebx+2D4]
 004F6A1D    push        eax
 004F6A1E    movzx       eax,byte ptr [ebp-3]
 004F6A22    push        eax
 004F6A23    push        0
 004F6A25    xor         edx,edx
 004F6A27    mov         eax,ebx
 004F6A29    call        TControl.DrawTextBiDiModeFlags
 004F6A2E    movzx       edx,byte ptr [ebx+271]
 004F6A35    or          eax,dword ptr [edx*4+7868BC]
 004F6A3C    push        eax
 004F6A3D    lea         eax,[ebp-50]
 004F6A40    push        eax
 004F6A41    lea         ecx,[ebp-34]
 004F6A44    mov         edx,dword ptr [ebx+2C8]
 004F6A4A    mov         eax,esi
 004F6A4C    call        TButtonGlyph.Draw
 004F6A51    movzx       eax,byte ptr [ebx+2DC]
 004F6A58    and         al,byte ptr [ebp-2]
>004F6A5B    je          004F6CB6
 004F6A61    mov         eax,dword ptr [ebx+2C8]
 004F6A67    mov         eax,dword ptr [eax+44]
 004F6A6A    mov         edx,0FF000006
 004F6A6F    call        TPen.SetColor
 004F6A74    mov         eax,dword ptr [ebx+2C8]
 004F6A7A    mov         eax,dword ptr [eax+48]
 004F6A7D    mov         edx,0FF00000F
 004F6A82    call        TBrush.SetColor
 004F6A87    lea         eax,[ebp-34]
 004F6A8A    push        eax
 004F6A8B    mov         eax,dword ptr [ebx+2C8]
 004F6A91    call        TCanvas.GetHandle
 004F6A96    push        eax
 004F6A97    call        user32.DrawFocusRect
>004F6A9C    jmp         004F6CB6
 004F6AA1    lea         edx,[ebp-34]
 004F6AA4    mov         eax,ebx
 004F6AA6    mov         ecx,dword ptr [eax]
 004F6AA8    call        dword ptr [ecx+54]
 004F6AAB    mov         dword ptr [ebp-8],2010
 004F6AB2    cmp         byte ptr [ebp-1],0
>004F6AB6    je          004F6ABF
 004F6AB8    or          dword ptr [ebp-8],200
 004F6ABF    test        byte ptr [esi+10],4
>004F6AC3    je          004F6ACC
 004F6AC5    or          dword ptr [ebp-8],100
 004F6ACC    movzx       eax,byte ptr [ebx+2DC]
 004F6AD3    or          al,byte ptr [ebp-2]
>004F6AD6    je          004F6B34
 004F6AD8    mov         eax,dword ptr [ebx+2C8]
 004F6ADE    mov         eax,dword ptr [eax+44]
 004F6AE1    mov         edx,0FF000006
 004F6AE6    call        TPen.SetColor
 004F6AEB    mov         eax,dword ptr [ebx+2C8]
 004F6AF1    mov         eax,dword ptr [eax+44]
 004F6AF4    mov         edx,1
 004F6AF9    call        TPen.SetWidth
 004F6AFE    mov         eax,dword ptr [ebx+2C8]
 004F6B04    mov         eax,dword ptr [eax+48]
 004F6B07    mov         dl,1
 004F6B09    call        TBrush.SetStyle
 004F6B0E    mov         eax,dword ptr [ebp-2C]
 004F6B11    push        eax
 004F6B12    mov         eax,dword ptr [ebp-28]
 004F6B15    push        eax
 004F6B16    mov         ecx,dword ptr [ebp-30]
 004F6B19    mov         edx,dword ptr [ebp-34]
 004F6B1C    mov         eax,dword ptr [ebx+2C8]
 004F6B22    mov         edi,dword ptr [eax]
 004F6B24    call        dword ptr [edi+7C]
 004F6B27    push        0FF
 004F6B29    push        0FF
 004F6B2B    lea         eax,[ebp-34]
 004F6B2E    push        eax
 004F6B2F    call        user32.InflateRect
 004F6B34    cmp         byte ptr [ebp-1],0
>004F6B38    je          004F6B9B
 004F6B3A    mov         eax,dword ptr [ebx+2C8]
 004F6B40    mov         eax,dword ptr [eax+44]
 004F6B43    mov         edx,0FF000010
 004F6B48    call        TPen.SetColor
 004F6B4D    mov         eax,dword ptr [ebx+2C8]
 004F6B53    mov         eax,dword ptr [eax+44]
 004F6B56    mov         edx,1
 004F6B5B    call        TPen.SetWidth
 004F6B60    mov         eax,dword ptr [ebx+2C8]
 004F6B66    mov         eax,dword ptr [eax+48]
 004F6B69    mov         edx,0FF00000F
 004F6B6E    call        TBrush.SetColor
 004F6B73    mov         eax,dword ptr [ebp-2C]
 004F6B76    push        eax
 004F6B77    mov         eax,dword ptr [ebp-28]
 004F6B7A    push        eax
 004F6B7B    mov         ecx,dword ptr [ebp-30]
 004F6B7E    mov         edx,dword ptr [ebp-34]
 004F6B81    mov         eax,dword ptr [ebx+2C8]
 004F6B87    mov         esi,dword ptr [eax]
 004F6B89    call        dword ptr [esi+7C]
 004F6B8C    push        0FF
 004F6B8E    push        0FF
 004F6B90    lea         eax,[ebp-34]
 004F6B93    push        eax
 004F6B94    call        user32.InflateRect
>004F6B99    jmp         004F6BAE
 004F6B9B    mov         eax,dword ptr [ebp-8]
 004F6B9E    push        eax
 004F6B9F    push        4
 004F6BA1    lea         eax,[ebp-34]
 004F6BA4    push        eax
 004F6BA5    mov         eax,dword ptr [esi+18]
 004F6BA8    push        eax
 004F6BA9    call        user32.DrawFrameControl
 004F6BAE    cmp         byte ptr [ebx+2DC],0
>004F6BB5    je          004F6BCE
 004F6BB7    lea         edx,[ebp-34]
 004F6BBA    mov         eax,ebx
 004F6BBC    mov         ecx,dword ptr [eax]
 004F6BBE    call        dword ptr [ecx+54]
 004F6BC1    push        0FF
 004F6BC3    push        0FF
 004F6BC5    lea         eax,[ebp-34]
 004F6BC8    push        eax
 004F6BC9    call        user32.InflateRect
 004F6BCE    mov         edx,dword ptr [ebx+64]
 004F6BD1    mov         eax,dword ptr [ebx+2C8]
 004F6BD7    call        TCanvas.SetFont
 004F6BDC    cmp         byte ptr [ebp-1],0
>004F6BE0    je          004F6BEF
 004F6BE2    push        1
 004F6BE4    push        1
 004F6BE6    lea         eax,[ebp-34]
 004F6BE9    push        eax
 004F6BEA    call        user32.OffsetRect
 004F6BEF    xor         eax,eax
 004F6BF1    mov         dword ptr [ebp-24],eax
 004F6BF4    xor         eax,eax
 004F6BF6    mov         dword ptr [ebp-20],eax
 004F6BF9    lea         eax,[ebp-24]
 004F6BFC    push        eax
 004F6BFD    lea         edx,[ebp-58]
 004F6C00    mov         eax,ebx
 004F6C02    call        TControl.GetText
 004F6C07    mov         eax,dword ptr [ebp-58]
 004F6C0A    push        eax
 004F6C0B    movzx       eax,byte ptr [ebx+2D2]
 004F6C12    push        eax
 004F6C13    mov         eax,dword ptr [ebx+2D8]
 004F6C19    push        eax
 004F6C1A    mov         eax,dword ptr [ebx+2D4]
 004F6C20    push        eax
 004F6C21    movzx       eax,byte ptr [ebp-3]
 004F6C25    push        eax
 004F6C26    push        0
 004F6C28    xor         edx,edx
 004F6C2A    mov         eax,ebx
 004F6C2C    call        TControl.DrawTextBiDiModeFlags
 004F6C31    movzx       edx,byte ptr [ebx+271]
 004F6C38    or          eax,dword ptr [edx*4+7868BC]
 004F6C3F    push        eax
 004F6C40    lea         eax,[ebp-50]
 004F6C43    push        eax
 004F6C44    lea         ecx,[ebp-34]
 004F6C47    mov         edx,dword ptr [ebx+2C8]
 004F6C4D    mov         eax,dword ptr [ebx+2CC]
 004F6C53    call        TButtonGlyph.Draw
 004F6C58    movzx       eax,byte ptr [ebx+2DC]
 004F6C5F    and         al,byte ptr [ebp-2]
>004F6C62    je          004F6CB6
 004F6C64    lea         edx,[ebp-34]
 004F6C67    mov         eax,ebx
 004F6C69    mov         ecx,dword ptr [eax]
 004F6C6B    call        dword ptr [ecx+54]
 004F6C6E    push        0FC
 004F6C70    push        0FC
 004F6C72    lea         eax,[ebp-34]
 004F6C75    push        eax
 004F6C76    call        user32.InflateRect
 004F6C7B    mov         eax,dword ptr [ebx+2C8]
 004F6C81    mov         eax,dword ptr [eax+44]
 004F6C84    mov         edx,0FF000006
 004F6C89    call        TPen.SetColor
 004F6C8E    mov         eax,dword ptr [ebx+2C8]
 004F6C94    mov         eax,dword ptr [eax+48]
 004F6C97    mov         edx,0FF00000F
 004F6C9C    call        TBrush.SetColor
 004F6CA1    lea         eax,[ebp-34]
 004F6CA4    push        eax
 004F6CA5    mov         eax,dword ptr [ebx+2C8]
 004F6CAB    call        TCanvas.GetHandle
 004F6CB0    push        eax
 004F6CB1    call        user32.DrawFocusRect
 004F6CB6    xor         edx,edx
 004F6CB8    mov         eax,dword ptr [ebx+2C8]
 004F6CBE    call        TCanvas.SetHandle
 004F6CC3    xor         eax,eax
 004F6CC5    pop         edx
 004F6CC6    pop         ecx
 004F6CC7    pop         ecx
 004F6CC8    mov         dword ptr fs:[eax],edx
 004F6CCB    push        4F6CE5
 004F6CD0    lea         eax,[ebp-58]
 004F6CD3    mov         edx,2
 004F6CD8    call        @UStrArrayClr
 004F6CDD    ret
>004F6CDE    jmp         @HandleFinally
>004F6CE3    jmp         004F6CD0
 004F6CE5    pop         edi
 004F6CE6    pop         esi
 004F6CE7    pop         ebx
 004F6CE8    mov         esp,ebp
 004F6CEA    pop         ebp
 004F6CEB    ret
*}
end;

//004F6CEC
procedure TBitBtn.CMFontChanged(var Message:TMessage);
begin
{*
 004F6CEC    push        esi
 004F6CED    mov         esi,eax
 004F6CEF    mov         eax,esi
 004F6CF1    call        TWinControl.CMFontChanged
 004F6CF6    mov         eax,esi
 004F6CF8    mov         edx,dword ptr [eax]
 004F6CFA    call        dword ptr [edx+90]
 004F6D00    pop         esi
 004F6D01    ret
*}
end;

//004F6D04
procedure TBitBtn.CMEnabledChanged(var Message:TMessage);
begin
{*
 004F6D04    push        esi
 004F6D05    mov         esi,eax
 004F6D07    mov         eax,esi
 004F6D09    call        TWinControl.CMEnabledChanged
 004F6D0E    mov         eax,esi
 004F6D10    mov         edx,dword ptr [eax]
 004F6D12    call        dword ptr [edx+90]
 004F6D18    pop         esi
 004F6D19    ret
*}
end;

//004F6D1C
procedure TBitBtn.WMLButtonDblClk(var Message:TWMLButtonDblClk);
begin
{*
 004F6D1C    push        ebx
 004F6D1D    movzx       ecx,word ptr [edx+8]
 004F6D21    movzx       ebx,word ptr [edx+0A]
 004F6D25    shr         ebx,10
 004F6D28    or          ecx,ebx
 004F6D2A    push        ecx
 004F6D2B    mov         ecx,dword ptr [edx+4]
 004F6D2E    mov         edx,201
 004F6D33    call        TControl.Perform
 004F6D38    pop         ebx
 004F6D39    ret
*}
end;

//004F6D3C
procedure TBitBtn.GetPalette;
begin
{*
 004F6D3C    push        ebx
 004F6D3D    mov         ebx,eax
 004F6D3F    mov         eax,ebx
 004F6D41    call        TBitBtn.GetGlyph
 004F6D46    mov         edx,dword ptr [eax]
 004F6D48    call        dword ptr [edx+28]
 004F6D4B    pop         ebx
 004F6D4C    ret
*}
end;

//004F6D50
procedure TBitBtn.SetGlyph(Value:TBitmap);
begin
{*
 004F6D50    push        esi
 004F6D51    mov         esi,eax
 004F6D53    mov         eax,dword ptr [esi+2CC]
 004F6D59    call        TButtonGlyph.SetGlyph
 004F6D5E    mov         byte ptr [esi+2DD],1
 004F6D65    mov         eax,esi
 004F6D67    mov         edx,dword ptr [eax]
 004F6D69    call        dword ptr [edx+90]
 004F6D6F    pop         esi
 004F6D70    ret
*}
end;

//004F6D74
function TBitBtn.GetGlyph:TBitmap;
begin
{*
 004F6D74    mov         eax,dword ptr [eax+2CC]
 004F6D7A    mov         eax,dword ptr [eax+4]
 004F6D7D    ret
*}
end;

//004F6D80
procedure TBitBtn.GlyphChanged(Sender:TObject);
begin
{*
 004F6D80    mov         edx,dword ptr [eax]
 004F6D82    call        dword ptr [edx+90]
 004F6D88    ret
*}
end;

//004F6D8C
procedure TBitBtn.InternalCopyImage(Image:TBitmap; ImageList:TCustomImageList; Index:Integer);
begin
{*
 004F6D8C    push        ebp
 004F6D8D    mov         ebp,esp
 004F6D8F    add         esp,0FFFFFFF0
 004F6D92    push        ebx
 004F6D93    push        esi
 004F6D94    mov         esi,ecx
 004F6D96    mov         ebx,edx
 004F6D98    mov         edx,dword ptr [esi+38]
 004F6D9B    mov         eax,ebx
 004F6D9D    mov         ecx,dword ptr [eax]
 004F6D9F    call        dword ptr [ecx+44]
 004F6DA2    mov         edx,dword ptr [esi+34]
 004F6DA5    mov         eax,ebx
 004F6DA7    mov         ecx,dword ptr [eax]
 004F6DA9    call        dword ptr [ecx+38]
 004F6DAC    mov         eax,ebx
 004F6DAE    call        TBitmap.GetCanvas
 004F6DB3    mov         eax,dword ptr [eax+48]
 004F6DB6    mov         edx,0FF00FF
 004F6DBB    call        TBrush.SetColor
 004F6DC0    mov         eax,ebx
 004F6DC2    mov         edx,dword ptr [eax]
 004F6DC4    call        dword ptr [edx+24]
 004F6DC7    push        eax
 004F6DC8    lea         eax,[ebp-10]
 004F6DCB    push        eax
 004F6DCC    mov         eax,ebx
 004F6DCE    mov         edx,dword ptr [eax]
 004F6DD0    call        dword ptr [edx+30]
 004F6DD3    mov         ecx,eax
 004F6DD5    xor         edx,edx
 004F6DD7    xor         eax,eax
 004F6DD9    call        Rect
 004F6DDE    lea         eax,[ebp-10]
 004F6DE1    push        eax
 004F6DE2    mov         eax,ebx
 004F6DE4    call        TBitmap.GetCanvas
 004F6DE9    pop         edx
 004F6DEA    mov         ecx,dword ptr [eax]
 004F6DEC    call        dword ptr [ecx+54]
 004F6DEF    push        0
 004F6DF1    mov         eax,dword ptr [ebp+8]
 004F6DF4    push        eax
 004F6DF5    push        1
 004F6DF7    mov         eax,ebx
 004F6DF9    call        TBitmap.GetCanvas
 004F6DFE    mov         edx,eax
 004F6E00    xor         ecx,ecx
 004F6E02    mov         eax,esi
 004F6E04    call        TCustomImageList.Draw
 004F6E09    pop         esi
 004F6E0A    pop         ebx
 004F6E0B    mov         esp,ebp
 004F6E0D    pop         ebp
 004F6E0E    ret         4
*}
end;

//004F6E14
function TBitBtn.IsCustom(Value:Boolean):Boolean;
begin
{*
 004F6E14    push        ebx
 004F6E15    push        esi
 004F6E16    mov         esi,eax
 004F6E18    mov         ebx,dword ptr [esi+68]
 004F6E1B    mov         eax,esi
 004F6E1D    call        TBitBtn.GetKind
 004F6E22    test        al,al
>004F6E24    jne         004F6E43
 004F6E26    test        ebx,ebx
>004F6E28    je          004F6E48
 004F6E2A    mov         eax,ebx
 004F6E2C    mov         edx,dword ptr [eax]
 004F6E2E    call        dword ptr [edx+3C]
 004F6E31    test        al,al
>004F6E33    je          004F6E48
 004F6E35    mov         edx,dword ptr [ebx+24]
 004F6E38    mov         eax,ebx
 004F6E3A    call        TBitBtnActionLink.IsGlyphLinked
 004F6E3F    test        al,al
>004F6E41    je          004F6E48
 004F6E43    xor         eax,eax
 004F6E45    pop         esi
 004F6E46    pop         ebx
 004F6E47    ret
 004F6E48    mov         al,1
 004F6E4A    pop         esi
 004F6E4B    pop         ebx
 004F6E4C    ret
*}
end;

//004F6E50
procedure TBitBtn.SetStyle(Value:TButtonStyle);
begin
{*
 004F6E50    push        esi
 004F6E51    mov         esi,eax
 004F6E53    cmp         dl,byte ptr [esi+2D0]
>004F6E59    je          004F6E6B
 004F6E5B    mov         byte ptr [esi+2D0],dl
 004F6E61    mov         eax,esi
 004F6E63    mov         edx,dword ptr [eax]
 004F6E65    call        dword ptr [edx+90]
 004F6E6B    pop         esi
 004F6E6C    ret
*}
end;

//004F6E70
procedure TBitBtn.SetKind(Value:TBitBtnKind);
begin
{*
 004F6E70    push        ebp
 004F6E71    mov         ebp,esp
 004F6E73    push        0
 004F6E75    push        0
 004F6E77    push        ebx
 004F6E78    push        esi
 004F6E79    push        edi
 004F6E7A    mov         ebx,edx
 004F6E7C    mov         esi,eax
 004F6E7E    xor         eax,eax
 004F6E80    push        ebp
 004F6E81    push        4F6F6D
 004F6E86    push        dword ptr fs:[eax]
 004F6E89    mov         dword ptr fs:[eax],esp
 004F6E8C    cmp         bl,byte ptr [esi+2D1]
>004F6E92    je          004F6F4F
 004F6E98    test        bl,bl
>004F6E9A    je          004F6F3F
 004F6EA0    mov         eax,ebx
 004F6EA2    sub         al,1
>004F6EA4    je          004F6EAE
 004F6EA6    sub         al,3
>004F6EA8    je          004F6EAE
 004F6EAA    xor         edx,edx
>004F6EAC    jmp         004F6EB0
 004F6EAE    mov         dl,1
 004F6EB0    mov         eax,esi
 004F6EB2    call        TCustomButton.SetDefault
 004F6EB7    mov         eax,ebx
 004F6EB9    sub         al,2
>004F6EBB    je          004F6EC5
 004F6EBD    sub         al,3
>004F6EBF    je          004F6EC5
 004F6EC1    xor         eax,eax
>004F6EC3    jmp         004F6EC7
 004F6EC5    mov         al,1
 004F6EC7    mov         byte ptr [esi+279],al
 004F6ECD    test        byte ptr [esi+1C],1
>004F6ED1    je          004F6EE3
 004F6ED3    lea         edx,[ebp-4]
 004F6ED6    mov         eax,esi
 004F6ED8    call        TControl.GetText
 004F6EDD    cmp         dword ptr [ebp-4],0
>004F6EE1    je          004F6EE9
 004F6EE3    test        byte ptr [esi+1C],1
>004F6EE7    jne         004F6F0B
 004F6EE9    movzx       eax,bl
 004F6EEC    mov         edi,dword ptr [eax*4+786860]
 004F6EF3    test        edi,edi
>004F6EF5    je          004F6F0B
 004F6EF7    lea         edx,[ebp-8]
 004F6EFA    mov         eax,edi
 004F6EFC    call        LoadResString
 004F6F01    mov         edx,dword ptr [ebp-8]
 004F6F04    mov         eax,esi
 004F6F06    call        TControl.SetText
 004F6F0B    movzx       eax,bl
 004F6F0E    mov         eax,dword ptr [eax*4+78688C]
 004F6F15    mov         dword ptr [esi+2AC],eax
 004F6F1B    mov         eax,ebx
 004F6F1D    call        GetBitBtnGlyph
 004F6F22    mov         edx,eax
 004F6F24    mov         eax,dword ptr [esi+2CC]
 004F6F2A    call        TButtonGlyph.SetGlyph
 004F6F2F    mov         dl,2
 004F6F31    mov         eax,esi
 004F6F33    call        TBitBtn.SetNumGlyphs
 004F6F38    mov         byte ptr [esi+2DD],0
 004F6F3F    mov         byte ptr [esi+2D1],bl
 004F6F45    mov         eax,esi
 004F6F47    mov         edx,dword ptr [eax]
 004F6F49    call        dword ptr [edx+90]
 004F6F4F    xor         eax,eax
 004F6F51    pop         edx
 004F6F52    pop         ecx
 004F6F53    pop         ecx
 004F6F54    mov         dword ptr fs:[eax],edx
 004F6F57    push        4F6F74
 004F6F5C    lea         eax,[ebp-8]
 004F6F5F    call        @UStrClr
 004F6F64    lea         eax,[ebp-4]
 004F6F67    call        @UStrClr
 004F6F6C    ret
>004F6F6D    jmp         @HandleFinally
>004F6F72    jmp         004F6F5C
 004F6F74    pop         edi
 004F6F75    pop         esi
 004F6F76    pop         ebx
 004F6F77    pop         ecx
 004F6F78    pop         ecx
 004F6F79    pop         ebp
 004F6F7A    ret
*}
end;

//004F6F7C
function TBitBtn.IsCustomCaption(Value:TCaption):Boolean;
begin
{*
 004F6F7C    push        ebp
 004F6F7D    mov         ebp,esp
 004F6F7F    push        0
 004F6F81    push        0
 004F6F83    push        ebx
 004F6F84    mov         ebx,eax
 004F6F86    xor         eax,eax
 004F6F88    push        ebp
 004F6F89    push        4F6FE6
 004F6F8E    push        dword ptr fs:[eax]
 004F6F91    mov         dword ptr fs:[eax],esp
 004F6F94    lea         edx,[ebp-4]
 004F6F97    movzx       eax,byte ptr [ebx+2D1]
 004F6F9E    mov         eax,dword ptr [eax*4+786860]
 004F6FA5    call        LoadResString
 004F6FAA    mov         eax,dword ptr [ebp-4]
 004F6FAD    push        eax
 004F6FAE    lea         edx,[ebp-8]
 004F6FB1    mov         eax,ebx
 004F6FB3    call        TControl.GetText
 004F6FB8    mov         eax,dword ptr [ebp-8]
 004F6FBB    pop         edx
 004F6FBC    call        AnsiCompareStr
 004F6FC1    test        eax,eax
 004F6FC3    setne       al
 004F6FC6    mov         ebx,eax
 004F6FC8    xor         eax,eax
 004F6FCA    pop         edx
 004F6FCB    pop         ecx
 004F6FCC    pop         ecx
 004F6FCD    mov         dword ptr fs:[eax],edx
 004F6FD0    push        4F6FED
 004F6FD5    lea         eax,[ebp-8]
 004F6FD8    call        @UStrClr
 004F6FDD    lea         eax,[ebp-4]
 004F6FE0    call        @UStrClr
 004F6FE5    ret
>004F6FE6    jmp         @HandleFinally
>004F6FEB    jmp         004F6FD5
 004F6FED    mov         eax,ebx
 004F6FEF    pop         ebx
 004F6FF0    pop         ecx
 004F6FF1    pop         ecx
 004F6FF2    pop         ebp
 004F6FF3    ret
*}
end;

//004F6FF4
function TBitBtn.GetKind:TBitBtnKind;
begin
{*
 004F6FF4    cmp         byte ptr [eax+2D1],0
>004F6FFB    je          004F705A
 004F6FFD    movzx       edx,byte ptr [eax+2D1]
 004F7004    mov         ecx,edx
 004F7006    sub         cl,1
>004F7009    je          004F7014
 004F700B    sub         cl,3
>004F700E    je          004F7014
 004F7010    xor         ecx,ecx
>004F7012    jmp         004F7016
 004F7014    mov         cl,1
 004F7016    xor         cl,byte ptr [eax+280]
>004F701C    jne         004F7053
 004F701E    mov         ecx,edx
 004F7020    sub         cl,2
>004F7023    je          004F702E
 004F7025    sub         cl,3
>004F7028    je          004F702E
 004F702A    xor         ecx,ecx
>004F702C    jmp         004F7030
 004F702E    mov         cl,1
 004F7030    xor         cl,byte ptr [eax+279]
>004F7036    jne         004F7053
 004F7038    and         edx,7F
 004F703B    mov         edx,dword ptr [edx*4+78688C]
 004F7042    cmp         edx,dword ptr [eax+2AC]
>004F7048    jne         004F7053
 004F704A    cmp         byte ptr [eax+2DD],0
>004F7051    je          004F705A
 004F7053    mov         byte ptr [eax+2D1],0
 004F705A    movzx       eax,byte ptr [eax+2D1]
 004F7061    ret
*}
end;

//004F7064
procedure TBitBtn.SetLayout(Value:TButtonLayout);
begin
{*
 004F7064    push        esi
 004F7065    mov         esi,eax
 004F7067    cmp         dl,byte ptr [esi+2D2]
>004F706D    je          004F707F
 004F706F    mov         byte ptr [esi+2D2],dl
 004F7075    mov         eax,esi
 004F7077    mov         edx,dword ptr [eax]
 004F7079    call        dword ptr [edx+90]
 004F707F    pop         esi
 004F7080    ret
*}
end;

//004F7084
function TBitBtn.GetNumGlyphs:TNumGlyphs;
begin
{*
 004F7084    mov         eax,dword ptr [eax+2CC]
 004F708A    movzx       eax,byte ptr [eax+20]
 004F708E    ret
*}
end;

//004F7090
procedure TBitBtn.SetNumGlyphs(Value:TNumGlyphs);
begin
{*
 004F7090    push        esi
 004F7091    mov         esi,eax
 004F7093    test        dl,dl
>004F7095    jae         004F709B
 004F7097    mov         dl,1
>004F7099    jmp         004F70A2
 004F709B    cmp         dl,4
>004F709E    jbe         004F70A2
 004F70A0    mov         dl,4
 004F70A2    mov         eax,dword ptr [esi+2CC]
 004F70A8    cmp         dl,byte ptr [eax+20]
>004F70AB    je          004F70BC
 004F70AD    call        TButtonGlyph.SetNumGlyphs
 004F70B2    mov         eax,esi
 004F70B4    mov         edx,dword ptr [eax]
 004F70B6    call        dword ptr [edx+90]
 004F70BC    pop         esi
 004F70BD    ret
*}
end;

//004F70C0
procedure TBitBtn.SetSpacing(Value:Integer);
begin
{*
 004F70C0    push        esi
 004F70C1    mov         esi,eax
 004F70C3    cmp         edx,dword ptr [esi+2D4]
>004F70C9    je          004F70DB
 004F70CB    mov         dword ptr [esi+2D4],edx
 004F70D1    mov         eax,esi
 004F70D3    mov         edx,dword ptr [eax]
 004F70D5    call        dword ptr [edx+90]
 004F70DB    pop         esi
 004F70DC    ret
*}
end;

//004F70E0
procedure TBitBtn.SetMargin(Value:Integer);
begin
{*
 004F70E0    push        esi
 004F70E1    mov         esi,eax
 004F70E3    cmp         edx,dword ptr [esi+2D8]
>004F70E9    je          004F7100
 004F70EB    cmp         edx,0FFFFFFFF
>004F70EE    jl          004F7100
 004F70F0    mov         dword ptr [esi+2D8],edx
 004F70F6    mov         eax,esi
 004F70F8    mov         edx,dword ptr [eax]
 004F70FA    call        dword ptr [edx+90]
 004F7100    pop         esi
 004F7101    ret
*}
end;

//004F7104
procedure TBitBtn.CopyImage(ImageList:TCustomImageList; Index:Integer);
begin
{*
 004F7104    push        ebx
 004F7105    push        esi
 004F7106    push        edi
 004F7107    mov         edi,ecx
 004F7109    mov         esi,edx
 004F710B    mov         ebx,eax
 004F710D    push        edi
 004F710E    mov         eax,ebx
 004F7110    call        TBitBtn.GetGlyph
 004F7115    mov         edx,eax
 004F7117    mov         ecx,esi
 004F7119    mov         eax,ebx
 004F711B    call        TBitBtn.InternalCopyImage
 004F7120    pop         edi
 004F7121    pop         esi
 004F7122    pop         ebx
 004F7123    ret
*}
end;

//004F7124
procedure TBitBtn.ActionChange(Sender:TObject; CheckDefaults:Boolean);
begin
{*
 004F7124    push        ebx
 004F7125    push        esi
 004F7126    push        edi
 004F7127    push        ebp
 004F7128    mov         ebx,ecx
 004F712A    mov         ebp,edx
 004F712C    mov         esi,eax
 004F712E    mov         ecx,ebx
 004F7130    mov         edx,ebp
 004F7132    mov         eax,esi
 004F7134    call        TCustomButton.ActionChange
 004F7139    mov         eax,ebp
 004F713B    mov         edx,dword ptr ds:[4743FC];TCustomAction
 004F7141    call        @IsClass
 004F7146    test        al,al
>004F7148    je          004F71FB
 004F714E    mov         edi,dword ptr [esi+68]
 004F7151    test        bl,bl
>004F7153    je          004F7177
 004F7155    mov         edx,dword ptr [edi+24]
 004F7158    mov         eax,edi
 004F715A    call        TBitBtnActionLink.IsGlyphLinked
 004F715F    test        al,al
>004F7161    jne         004F7177
 004F7163    mov         eax,esi
 004F7165    call        TBitBtn.GetGlyph
 004F716A    mov         edx,dword ptr [eax]
 004F716C    call        dword ptr [edx+20]
 004F716F    test        al,al
>004F7171    je          004F71FB
 004F7177    test        bl,bl
>004F7179    jne         004F718C
 004F717B    cmp         dword ptr [edi+24],0FFFFFFFF
>004F717F    jne         004F718C
 004F7181    mov         eax,dword ptr [edi+24]
 004F7184    cmp         eax,dword ptr [ebp+80]
>004F718A    je          004F71A9
 004F718C    mov         eax,ebp
 004F718E    mov         edx,dword ptr [eax+80]
 004F7194    mov         dword ptr [edi+24],edx
 004F7197    cmp         dword ptr [eax+80],0FFFFFFFF
>004F719E    je          004F71A9
 004F71A0    xor         edx,edx
 004F71A2    mov         eax,esi
 004F71A4    call        TBitBtn.SetGlyph
 004F71A9    mov         eax,esi
 004F71AB    call        TBitBtn.GetGlyph
 004F71B0    mov         edx,dword ptr [eax]
 004F71B2    call        dword ptr [edx+20]
 004F71B5    test        al,al
>004F71B7    je          004F71FB
 004F71B9    cmp         dword ptr [ebp+5C],0
>004F71BD    je          004F71FB
 004F71BF    mov         eax,dword ptr [ebp+5C]
 004F71C2    cmp         dword ptr [eax+3C],0
>004F71C6    je          004F71FB
 004F71C8    cmp         dword ptr [ebp+80],0
>004F71CF    jl          004F71FB
 004F71D1    mov         ebx,ebp
 004F71D3    mov         eax,dword ptr [ebx+5C]
 004F71D6    mov         eax,dword ptr [eax+3C]
 004F71D9    call        TCustomImageList.GetCount
 004F71DE    cmp         eax,dword ptr [ebx+80]
>004F71E4    jle         004F71FB
 004F71E6    mov         eax,ebp
 004F71E8    mov         ecx,dword ptr [eax+80]
 004F71EE    mov         eax,dword ptr [eax+5C]
 004F71F1    mov         edx,dword ptr [eax+3C]
 004F71F4    mov         eax,esi
 004F71F6    call        TBitBtn.CopyImage
 004F71FB    pop         ebp
 004F71FC    pop         edi
 004F71FD    pop         esi
 004F71FE    pop         ebx
 004F71FF    ret
*}
end;

//004F7200
procedure DestroyLocals;
begin
{*
 004F7200    push        ebx
 004F7201    push        esi
 004F7202    mov         bl,0B
 004F7204    mov         esi,793318
 004F7209    mov         eax,dword ptr [esi]
 004F720B    call        TObject.Free
 004F7210    add         esi,4
 004F7213    dec         bl
>004F7215    jne         004F7209
 004F7217    pop         esi
 004F7218    pop         ebx
 004F7219    ret
*}
end;

//004F721C
procedure TBitBtn.CMMouseEnter(var Message:TMessage);
begin
{*
 004F721C    push        esi
 004F721D    mov         esi,eax
 004F721F    mov         eax,esi
 004F7221    call        TControl.CMMouseEnter
 004F7226    call        ThemeServices
 004F722B    call        TThemeServices.GetThemesEnabled
 004F7230    test        al,al
>004F7232    je          004F7254
 004F7234    cmp         byte ptr [esi+2DE],0
>004F723B    jne         004F7254
 004F723D    test        byte ptr [esi+1C],10
>004F7241    jne         004F7254
 004F7243    mov         byte ptr [esi+2DE],1
 004F724A    mov         eax,esi
 004F724C    mov         edx,dword ptr [eax]
 004F724E    call        dword ptr [edx+94]
 004F7254    pop         esi
 004F7255    ret
*}
end;

//004F7258
procedure TBitBtn.CMMouseLeave(var Message:TMessage);
begin
{*
 004F7258    push        esi
 004F7259    mov         esi,eax
 004F725B    mov         eax,esi
 004F725D    call        TControl.CMMouseLeave
 004F7262    call        ThemeServices
 004F7267    call        TThemeServices.GetThemesEnabled
 004F726C    test        al,al
>004F726E    je          004F728A
 004F7270    cmp         byte ptr [esi+2DE],0
>004F7277    je          004F728A
 004F7279    mov         byte ptr [esi+2DE],0
 004F7280    mov         eax,esi
 004F7282    mov         edx,dword ptr [eax]
 004F7284    call        dword ptr [edx+94]
 004F728A    pop         esi
 004F728B    ret
*}
end;

//004F728C
procedure TBitBtn.sub_0048751C;
begin
{*
 004F728C    mov         eax,[004F3B94];TBitBtnActionLink
 004F7291    ret
*}
end;

//004F7294
procedure TBitBtnActionLink.AssignClient(AClient:TObject);
begin
{*
 004F7294    push        ebx
 004F7295    push        esi
 004F7296    mov         esi,edx
 004F7298    mov         ebx,eax
 004F729A    mov         edx,esi
 004F729C    mov         eax,ebx
 004F729E    call        TControlActionLink.AssignClient
 004F72A3    mov         eax,esi
 004F72A5    mov         edx,dword ptr ds:[4F3DB0];TBitBtn
 004F72AB    call        @AsClass
 004F72B0    mov         dword ptr [ebx+20],eax
 004F72B3    pop         esi
 004F72B4    pop         ebx
 004F72B5    ret
*}
end;

//004F72B8
constructor TBitBtnActionLink.Create;
begin
{*
 004F72B8    push        ebx
 004F72B9    push        esi
 004F72BA    test        dl,dl
>004F72BC    je          004F72C6
 004F72BE    add         esp,0FFFFFFF0
 004F72C1    call        @ClassCreate
 004F72C6    mov         ebx,edx
 004F72C8    mov         esi,eax
 004F72CA    xor         edx,edx
 004F72CC    mov         eax,esi
 004F72CE    call        TBasicActionLink.Create
 004F72D3    mov         dword ptr [esi+24],0FFFFFFFF
 004F72DA    mov         eax,esi
 004F72DC    test        bl,bl
>004F72DE    je          004F72EF
 004F72E0    call        @AfterConstruction
 004F72E5    pop         dword ptr fs:[0]
 004F72EC    add         esp,0C
 004F72EF    mov         eax,esi
 004F72F1    pop         esi
 004F72F2    pop         ebx
 004F72F3    ret
*}
end;

//004F72F4
function TBitBtnActionLink.IsImageIndexLinked:Boolean;
begin
{*
 004F72F4    push        ebx
 004F72F5    mov         ebx,eax
 004F72F7    mov         eax,ebx
 004F72F9    call        TActionLink.IsImageIndexLinked
 004F72FE    test        al,al
>004F7300    je          004F7310
 004F7302    mov         eax,dword ptr [ebx+10]
 004F7305    mov         eax,dword ptr [eax+80]
 004F730B    cmp         eax,dword ptr [ebx+24]
>004F730E    je          004F7314
 004F7310    xor         eax,eax
 004F7312    pop         ebx
 004F7313    ret
 004F7314    mov         al,1
 004F7316    pop         ebx
 004F7317    ret
*}
end;

//004F7318
function TBitBtnActionLink.IsGlyphLinked(Index:TImageIndex):Boolean;
begin
{*
 004F7318    push        ebp
 004F7319    mov         ebp,esp
 004F731B    add         esp,0FFFFFFF8
 004F731E    push        ebx
 004F731F    push        esi
 004F7320    push        edi
 004F7321    mov         edi,edx
 004F7323    mov         ebx,eax
 004F7325    mov         eax,dword ptr [ebx+10]
 004F7328    mov         eax,dword ptr [eax+5C]
 004F732B    mov         esi,dword ptr [eax+3C]
 004F732E    test        esi,esi
>004F7330    je          004F7362
 004F7332    mov         eax,dword ptr [ebx+20]
 004F7335    call        TBitBtn.GetGlyph
 004F733A    test        eax,eax
>004F733C    je          004F7362
 004F733E    mov         eax,dword ptr [ebx+20]
 004F7341    call        TBitBtn.GetGlyph
 004F7346    mov         edx,dword ptr [eax]
 004F7348    call        dword ptr [edx+30]
 004F734B    cmp         eax,dword ptr [esi+38]
>004F734E    jne         004F7362
 004F7350    mov         eax,dword ptr [ebx+20]
 004F7353    call        TBitBtn.GetGlyph
 004F7358    mov         edx,dword ptr [eax]
 004F735A    call        dword ptr [edx+24]
 004F735D    cmp         eax,dword ptr [esi+34]
>004F7360    je          004F7366
 004F7362    xor         eax,eax
>004F7364    jmp         004F7368
 004F7366    mov         al,1
 004F7368    mov         byte ptr [ebp-1],al
 004F736B    cmp         byte ptr [ebp-1],0
>004F736F    je          004F73CE
 004F7371    mov         dl,1
 004F7373    mov         eax,[00463B28];TBitmap
 004F7378    call        TBitmap.Create
 004F737D    mov         dword ptr [ebp-8],eax
 004F7380    xor         eax,eax
 004F7382    push        ebp
 004F7383    push        4F73C7
 004F7388    push        dword ptr fs:[eax]
 004F738B    mov         dword ptr fs:[eax],esp
 004F738E    push        edi
 004F738F    mov         eax,dword ptr [ebx+20]
 004F7392    mov         ecx,esi
 004F7394    mov         edx,dword ptr [ebp-8]
 004F7397    call        TBitBtn.InternalCopyImage
 004F739C    mov         eax,dword ptr [ebx+20]
 004F739F    call        TBitBtn.GetGlyph
 004F73A4    mov         edx,eax
 004F73A6    mov         eax,dword ptr [ebp-8]
 004F73A9    mov         ecx,dword ptr [eax]
 004F73AB    call        dword ptr [ecx-2C]
 004F73AE    mov         byte ptr [ebp-1],al
 004F73B1    xor         eax,eax
 004F73B3    pop         edx
 004F73B4    pop         ecx
 004F73B5    pop         ecx
 004F73B6    mov         dword ptr fs:[eax],edx
 004F73B9    push        4F73CE
 004F73BE    mov         eax,dword ptr [ebp-8]
 004F73C1    call        TObject.Free
 004F73C6    ret
>004F73C7    jmp         @HandleFinally
>004F73CC    jmp         004F73BE
 004F73CE    movzx       eax,byte ptr [ebp-1]
 004F73D2    pop         edi
 004F73D3    pop         esi
 004F73D4    pop         ebx
 004F73D5    pop         ecx
 004F73D6    pop         ecx
 004F73D7    pop         ebp
 004F73D8    ret
*}
end;

//004F73DC
procedure TBitBtnActionLink.SetImageIndex(Value:Integer);
begin
{*
 004F73DC    push        ebx
 004F73DD    push        esi
 004F73DE    push        edi
 004F73DF    mov         edi,edx
 004F73E1    mov         ebx,eax
 004F73E3    mov         eax,ebx
 004F73E5    mov         edx,dword ptr [eax]
 004F73E7    call        dword ptr [edx+3C]
 004F73EA    test        al,al
>004F73EC    jne         004F73FF
 004F73EE    mov         eax,dword ptr [ebx+20]
 004F73F1    call        TBitBtn.GetGlyph
 004F73F6    mov         edx,dword ptr [eax]
 004F73F8    call        dword ptr [edx+20]
 004F73FB    test        al,al
>004F73FD    je          004F747B
 004F73FF    mov         esi,dword ptr [ebx+10]
 004F7402    mov         eax,esi
 004F7404    mov         edx,dword ptr ds:[4743FC];TCustomAction
 004F740A    call        @IsClass
 004F740F    test        al,al
>004F7411    je          004F746E
 004F7413    mov         eax,dword ptr [esi+5C]
 004F7416    test        eax,eax
>004F7418    je          004F746E
 004F741A    cmp         dword ptr [eax+3C],0
>004F741E    je          004F746E
 004F7420    test        edi,edi
>004F7422    jl          004F7464
 004F7424    mov         eax,dword ptr [esi+5C]
 004F7427    mov         eax,dword ptr [eax+3C]
 004F742A    call        TCustomImageList.GetCount
 004F742F    cmp         edi,eax
>004F7431    jge         004F7464
 004F7433    mov         edx,dword ptr [ebx+24]
 004F7436    mov         eax,ebx
 004F7438    call        TBitBtnActionLink.IsGlyphLinked
 004F743D    test        al,al
>004F743F    jne         004F7452
 004F7441    mov         eax,dword ptr [ebx+20]
 004F7444    call        TBitBtn.GetGlyph
 004F7449    mov         edx,dword ptr [eax]
 004F744B    call        dword ptr [edx+20]
 004F744E    test        al,al
>004F7450    je          004F746E
 004F7452    mov         eax,dword ptr [esi+5C]
 004F7455    mov         edx,dword ptr [eax+3C]
 004F7458    mov         ecx,edi
 004F745A    mov         eax,dword ptr [ebx+20]
 004F745D    call        TBitBtn.CopyImage
>004F7462    jmp         004F746E
 004F7464    xor         edx,edx
 004F7466    mov         eax,dword ptr [ebx+20]
 004F7469    call        TBitBtn.SetGlyph
 004F746E    mov         dword ptr [ebx+24],edi
 004F7471    xor         edx,edx
 004F7473    mov         eax,dword ptr [ebx+20]
 004F7476    call        TBitBtn.GlyphChanged
 004F747B    pop         edi
 004F747C    pop         esi
 004F747D    pop         ebx
 004F747E    ret
*}
end;

Initialization
//00780C74
{*
 00780C74    sub         dword ptr ds:[793314],1
>00780C7B    jae         00780C98
 00780C7D    mov         eax,4F7480
 00780C82    call        @InitImports
 00780C87    mov         eax,793318
 00780C8C    xor         ecx,ecx
 00780C8E    mov         edx,2C
 00780C93    call        @FillChar
 00780C98    ret
*}
Finalization
end.