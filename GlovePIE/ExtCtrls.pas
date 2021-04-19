//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit ExtCtrls;

interface

uses
  SysUtils, Classes, Graphics, Controls, DwmApi;

type
  TShapeType = (stRectangle, stSquare, stRoundRect, stRoundSquare, stEllipse, stCircle);
  TShape = class(TGraphicControl)
  published
    destructor Destroy();//004C6F9C
    constructor Create;//004C6EF8
    procedure StyleChanged(Sender:TObject);//004C70F0
  public
    FPen:TPen;//f1B0
    FBrush:TBrush;//f1B4
    FShape:TShapeType;//f1B8
    destructor Destroy(); virtual;//004C6F9C
    constructor Create; virtual;//v2C//004C6EF8
    procedure Paint; virtual;//vA0//004C6FD8
    procedure SetBrush(Value:TBrush);//004C70FC
    procedure SetPen(Value:TPen);//004C7108
    procedure SetShape(Value:TShapeType);//004C7114
  end;
  TImage = class(TGraphicControl)
  published
    constructor Create;//004C712C
    destructor Destroy();//004C71C4
  public
    FPicture:TPicture;//f1B0
    FOnProgress:TProgressEvent;//f1B8
    FStretch:Boolean;//f1C0
    FCenter:Boolean;//f1C1
    FIncrementalDisplay:Boolean;//f1C2
    FTransparent:Boolean;//f1C3
    FDrawing:Boolean;//f1C4
    FProportional:Boolean;//f1C5
    destructor Destroy(); virtual;//004C71C4
    constructor Create; virtual;//v2C//004C712C
    function CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean; virtual;//v38//004C7894
    procedure Paint; virtual;//vA0//004C73EC
    procedure Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:UnicodeString); dynamic;//004C758C
    procedure GetPalette; dynamic;//004C71F4
    function DestRect:TRect;//004C7214
    function DoPaletteChange:Boolean;//004C74F0
    function GetCanvas:TCanvas;//004C75F8
    procedure SetCenter(Value:Boolean);//004C76F8
    procedure SetPicture(Value:TPicture);//004C7710
    procedure SetStretch(Value:Boolean);//004C7720
    procedure SetTransparent(Value:Boolean);//004C7738
    procedure SetProportional(Value:Boolean);//004C7750
    procedure PictureChanged(Sender:TObject);//004C7768
  end;
  TTimer = class(TComponent)
  published
    destructor Destroy();//004C794C
    constructor Create;//004C78FC
  public
    FInterval:Cardinal;//f34
    FWindowHandle:HWND;//f38
    FOnTimer:TNotifyEvent;//f40
    FEnabled:Boolean;//f48
    destructor Destroy(); virtual;//004C794C
    constructor Create; virtual;//v2C//004C78FC
    procedure Timer; dynamic;//004C7AC8
    procedure WndProc(var Msg:TMessage);//004C7990
    procedure UpdateTimer;//004C7A04
    procedure SetEnabled(Value:Boolean);//004C7A90
    procedure SetInterval(Value:Cardinal);//004C7AA0
    procedure SetOnTimer(Value:TNotifyEvent);//004C7AB0
  end;
  TCustomPanel = class(TCustomControl)
  published
    constructor Create;//004C7ADC
    procedure GetControlsAlignment;//004C8030
  public
    FAlignment:TAlignment;//f278
    FAutoSizeDocking:Boolean;//f279
    FBevelInner:TBevelCut;//f27A
    FBevelOuter:TBevelCut;//f27B
    FBevelWidth:TBevelWidth;//f27C
    FBorderWidth:TBorderWidth;//f280
    FBorderStyle:TBorderStyle;//f284
    FFullRepaint:Boolean;//f285
    FLocked:Boolean;//f286
    FParentBackgroundSet:Boolean;//f287
    FShowCaption:Boolean;//f288
    FVerticalAlignment:TVerticalAlignment;//f289
    constructor Create; virtual;//v2C//004C7ADC
    function CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean; virtual;//v38//004C81D0
    procedure AdjustClientRect(var Rect:TRect); virtual;//vA0//004C8038
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//004C7BBC
    procedure SetParentBackground(Value:Boolean); virtual;//vD8//004C81FC
    procedure Paint; virtual;//vEC//004C7DBC
    procedure WMWindowPosChanged(var Message:TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;//004C7C74
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//004C7C34
    procedure CMTextChanged(var Message:TMessage); message CM_TEXTCHANGED;//004C7C28
    procedure CMIsToolControl(var Message:TMessage); message CM_ISTOOLCONTROL;//004C7C60
    procedure CMDockClient(var Message:TCMDockClient); message CM_DOCKCLIENT;//004C8094
    procedure CMBorderChanged(var Message:TMessage); message CM_BORDERCHANGED;//004C7C10
    procedure GetControlsAlignment; dynamic;//004C8030
    procedure SetAlignment(Value:TAlignment);//004C7F74
    procedure SetBevelInner(Value:TBevelCut);//004C7F8C
    procedure SetBevelOuter(Value:TBevelCut);//004C7FA8
    procedure SetBevelWidth(Value:TBevelWidth);//004C7FC4
    procedure SetBorderWidth(Value:TBorderWidth);//004C7FE0
    procedure SetBorderStyle(Value:TBorderStyle);//004C7FFC
    procedure SetShowCaption(Value:Boolean);//004C8010
    procedure SetVerticalAlignment(const Value:TVerticalAlignment);//004C8238
  end;
  TPanel = class(TCustomPanel)
  end;
  TCustomRadioGroup = class(TCustomGroupBox)
  published
    constructor Create;//004C8654
    procedure GetChildren(Root:TComponent; Proc:TGetChildProc);//004C8C20
    procedure FlipChildren(AllLevels:Boolean);//004C8730
    destructor Destroy();//004C86E4
  public
    FButtons:TList;//f278
    FItems:TStrings;//f27C
    FItemIndex:Integer;//f280
    FColumns:Integer;//f284
    FReading:Boolean;//f288
    FUpdating:Boolean;//f289
    FWordWrap:Boolean;//f28A
    destructor Destroy(); virtual;//004C86E4
    procedure Loaded; virtual;//vC//004C8944
    procedure ReadState(Reader:TReader); virtual;//v14//004C8958
    constructor Create; virtual;//v2C//004C8654
    procedure CreateWnd; virtual;//vB4//004C8984
    //function vF0:?; virtual;//vF0//004C8C1C
    procedure WMSize(var Message:TWMSize); message WM_SIZE;//004C8C08
    procedure CMEnabledChanged(var Message:TMessage); message CM_ENABLEDCHANGED;//004C8BB4
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//004C8BF4
    procedure FlipChildren(AllLevels:Boolean); dynamic;//004C8730
    procedure GetChildren(Root:TComponent; Proc:TGetChildProc); dynamic;//004C8C20
    procedure ArrangeButtons;//004C8734
    procedure ButtonClick(Sender:TObject);//004C88D0
    procedure ItemsChange(Sender:TObject);//004C8908
    procedure SetButtonCount(Value:Integer);//004C8998
    procedure SetColumns(Value:Integer);//004C89D8
    procedure SetItemIndex(Value:Integer);//004C8A10
    procedure SetItems(Value:TStrings);//004C8A94
    procedure SetWordWrap(Value:Boolean);//004C8AAC
    procedure UpdateButtons;//004C8AC0
  end;
  TRadioGroup = class(TCustomRadioGroup)
  end;
  TSplitterCanResizeEvent = procedure(Sender:TObject; var NewSize:Integer; var Accept:Boolean) of object;;
  TResizeStyle = (rsNone, rsLine, rsUpdate, rsPattern);
  TSplitter = class(TGraphicControl)
  published
    constructor Create;//004C8C28
    destructor Destroy();//004C8CBC
  public
    FActiveControl:TWinControl;//f1B0
    FAutoSnap:Boolean;//f1B4
    FBeveled:Boolean;//f1B5
    FBrush:TBrush;//f1B8
    FControl:TControl;//f1BC
    FDownPos:TPoint;//f1C0
    FLineDC:HDC;//f1C8
    FLineVisible:Boolean;//f1CC
    FMinSize:NaturalNumber;//f1D0
    FMaxSize:Integer;//f1D4
    FNewSize:Integer;//f1D8
    FOldKeyDown:TKeyEvent;//f1E0
    FOldSize:Integer;//f1E8
    FPrevBrush:HBRUSH;//f1EC
    FResizeStyle:TResizeStyle;//f1F0
    FSplit:Integer;//f1F4
    FOnCanResize:TSplitterCanResizeEvent;//f1F8
    FOnMoved:TNotifyEvent;//f200
    FOnPaint:TNotifyEvent;//f208
    destructor Destroy(); virtual;//004C8CBC
    constructor Create; virtual;//v2C//004C8C28
    procedure RequestAlign; virtual;//v68//004C8FC0
    procedure Paint; virtual;//vA0//004C9000
    function CanResize(var NewSize:Integer):Boolean; virtual;//vA4//004C9190
    function DoCanResize(var NewSize:Integer):Boolean; virtual;//vA8//004C9160
    procedure StopSizing; dynamic;//004C972C
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//004C9688
    procedure MouseMove(Shift:TShiftState; X:Integer; Y:Integer); dynamic;//004C95DC
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//004C91BC
    procedure AllocateLineDC;//004C8CEC
    procedure DrawLine;//004C8D68
    procedure ReleaseLineDC;//004C8DE4
    function FindControl:TControl;//004C8E2C
    procedure UpdateControlSize;//004C936C
    procedure CalcSplitSize(X:Integer; Y:Integer; var NewSize:Integer; var Split:Integer);//004C94F0
    procedure UpdateSize(X:Integer; Y:Integer);//004C95C4
    procedure FocusKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);//004C96E0
    procedure SetBeveled(Value:Boolean);//004C971C
  end;
  TGroupButton = class(TRadioButton)
  published
    constructor InternalCreate;//004C8484
    destructor Destroy();//004C8508
  public
    FInClick:Boolean;//f280
    destructor Destroy(); virtual;//004C8508
    procedure CreateParams(var Params:TCreateParams); virtual;//vAC//004C8644
    procedure CNCommand(var Message:TWMCommand); dynamic;//004C8540
    procedure KeyPress(var Key:Char); dynamic;//004C85D0
    procedure KeyDown(var Key:Word; Shift:TShiftState); dynamic;//004C8614
  end;
    procedure DoRect;//004C6DD4
    procedure Frame3D(Canvas:TCanvas; var Rect:TRect; TopColor:TColor; BottomColor:TColor; Width:Integer);//004C6E98
    procedure Paint;//004C6FD8
    procedure GetPalette;//004C71F4
    procedure DoBufferedPaint(Canvas:TCanvas);//004C7340
    procedure Paint;//004C73EC
    procedure Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:UnicodeString);//004C758C
    function CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;//004C7894
    procedure Timer;//004C7AC8
    procedure CreateParams(var Params:TCreateParams);//004C7BBC
    procedure CMBorderChanged(var Message:TMessage);//004C7C10
    procedure CMTextChanged(var Message:TMessage);//004C7C28
    procedure CMCtl3DChanged(var Message:TMessage);//004C7C34
    procedure CMIsToolControl(var Message:TMessage);//004C7C60
    procedure WMWindowPosChanged(var Message:TWMWindowPosChanged);//004C7C74
    procedure AdjustColors(Bevel:TBevelCut);//004C7D84
    procedure Paint;//004C7DBC
    procedure AdjustClientRect(var Rect:TRect);//004C8038
    procedure CMDockClient(var Message:TCMDockClient);//004C8094
    function CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;//004C81D0
    procedure SetParentBackground(Value:Boolean);//004C81FC
    procedure CNCommand(var Message:TWMCommand);//004C8540
    procedure KeyPress(var Key:Char);//004C85D0
    procedure KeyDown(var Key:Word; Shift:TShiftState);//004C8614
    procedure CreateParams(var Params:TCreateParams);//004C8644
    procedure Loaded;//004C8944
    procedure ReadState(Reader:TReader);//004C8958
    procedure CreateWnd;//004C8984
    procedure CMEnabledChanged(var Message:TMessage);//004C8BB4
    procedure CMFontChanged(var Message:TMessage);//004C8BF4
    procedure WMSize(var Message:TWMSize);//004C8C08
    //function sub_004C8C1C:?;//004C8C1C
    procedure RequestAlign;//004C8FC0
    procedure Paint;//004C9000
    function DoCanResize(var NewSize:Integer):Boolean;//004C9160
    function CanResize(var NewSize:Integer):Boolean;//004C9190
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//004C91BC
    procedure MouseMove(Shift:TShiftState; X:Integer; Y:Integer);//004C95DC
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//004C9688
    procedure StopSizing;//004C972C

implementation

//004C6DD4
procedure DoRect;
begin
{*
 004C6DD4    push        ebp
 004C6DD5    mov         ebp,esp
 004C6DD7    add         esp,0FFFFFFD8
 004C6DDA    push        ebx
 004C6DDB    push        esi
 004C6DDC    mov         ebx,dword ptr [ebp+8]
 004C6DDF    mov         ebx,dword ptr [ebx-4]
 004C6DE2    mov         eax,dword ptr [ebx+8]
 004C6DE5    mov         dword ptr [ebp-8],eax
 004C6DE8    mov         eax,dword ptr [ebx+4]
 004C6DEB    mov         dword ptr [ebp-4],eax
 004C6DEE    mov         eax,dword ptr [ebx]
 004C6DF0    mov         dword ptr [ebp-10],eax
 004C6DF3    mov         eax,dword ptr [ebx+0C]
 004C6DF6    mov         dword ptr [ebp-0C],eax
 004C6DF9    mov         eax,dword ptr [ebp+8]
 004C6DFC    mov         edx,dword ptr [eax-0C]
 004C6DFF    mov         eax,dword ptr [ebp+8]
 004C6E02    mov         eax,dword ptr [eax-8]
 004C6E05    mov         eax,dword ptr [eax+44]
 004C6E08    call        TPen.SetColor
 004C6E0D    mov         eax,dword ptr [ebp-10]
 004C6E10    mov         dword ptr [ebp-28],eax
 004C6E13    mov         eax,dword ptr [ebp-0C]
 004C6E16    mov         dword ptr [ebp-24],eax
 004C6E19    mov         eax,dword ptr [ebx]
 004C6E1B    mov         dword ptr [ebp-20],eax
 004C6E1E    mov         eax,dword ptr [ebx+4]
 004C6E21    mov         dword ptr [ebp-1C],eax
 004C6E24    mov         eax,dword ptr [ebp-8]
 004C6E27    mov         dword ptr [ebp-18],eax
 004C6E2A    mov         eax,dword ptr [ebp-4]
 004C6E2D    mov         dword ptr [ebp-14],eax
 004C6E30    lea         edx,[ebp-28]
 004C6E33    mov         eax,dword ptr [ebp+8]
 004C6E36    mov         eax,dword ptr [eax-8]
 004C6E39    mov         ecx,2
 004C6E3E    mov         esi,dword ptr [eax]
 004C6E40    call        dword ptr [esi+70]
 004C6E43    mov         eax,dword ptr [ebp+8]
 004C6E46    mov         edx,dword ptr [eax+0C]
 004C6E49    mov         eax,dword ptr [ebp+8]
 004C6E4C    mov         eax,dword ptr [eax-8]
 004C6E4F    mov         eax,dword ptr [eax+44]
 004C6E52    call        TPen.SetColor
 004C6E57    dec         dword ptr [ebp-10]
 004C6E5A    mov         eax,dword ptr [ebp-8]
 004C6E5D    mov         dword ptr [ebp-28],eax
 004C6E60    mov         eax,dword ptr [ebp-4]
 004C6E63    mov         dword ptr [ebp-24],eax
 004C6E66    mov         eax,dword ptr [ebx+8]
 004C6E69    mov         dword ptr [ebp-20],eax
 004C6E6C    mov         eax,dword ptr [ebx+0C]
 004C6E6F    mov         dword ptr [ebp-1C],eax
 004C6E72    mov         eax,dword ptr [ebp-10]
 004C6E75    mov         dword ptr [ebp-18],eax
 004C6E78    mov         eax,dword ptr [ebp-0C]
 004C6E7B    mov         dword ptr [ebp-14],eax
 004C6E7E    lea         edx,[ebp-28]
 004C6E81    mov         eax,dword ptr [ebp+8]
 004C6E84    mov         eax,dword ptr [eax-8]
 004C6E87    mov         ecx,2
 004C6E8C    mov         ebx,dword ptr [eax]
 004C6E8E    call        dword ptr [ebx+70]
 004C6E91    pop         esi
 004C6E92    pop         ebx
 004C6E93    mov         esp,ebp
 004C6E95    pop         ebp
 004C6E96    ret
*}
end;

//004C6E98
procedure Frame3D(Canvas:TCanvas; var Rect:TRect; TopColor:TColor; BottomColor:TColor; Width:Integer);
begin
{*
 004C6E98    push        ebp
 004C6E99    mov         ebp,esp
 004C6E9B    add         esp,0FFFFFFF4
 004C6E9E    push        ebx
 004C6E9F    mov         dword ptr [ebp-0C],ecx
 004C6EA2    mov         dword ptr [ebp-4],edx
 004C6EA5    mov         dword ptr [ebp-8],eax
 004C6EA8    mov         ebx,dword ptr [ebp+8]
 004C6EAB    mov         eax,dword ptr [ebp-8]
 004C6EAE    mov         eax,dword ptr [eax+44]
 004C6EB1    mov         edx,1
 004C6EB6    call        TPen.SetWidth
 004C6EBB    mov         eax,dword ptr [ebp-4]
 004C6EBE    dec         dword ptr [eax+0C]
 004C6EC1    mov         eax,dword ptr [ebp-4]
 004C6EC4    dec         dword ptr [eax+8]
 004C6EC7    test        ebx,ebx
>004C6EC9    jle         004C6EE4
 004C6ECB    dec         ebx
 004C6ECC    push        ebp
 004C6ECD    call        DoRect
 004C6ED2    pop         ecx
 004C6ED3    push        0FF
 004C6ED5    push        0FF
 004C6ED7    mov         eax,dword ptr [ebp-4]
 004C6EDA    push        eax
 004C6EDB    call        user32.InflateRect
 004C6EE0    test        ebx,ebx
>004C6EE2    jg          004C6ECB
 004C6EE4    mov         eax,dword ptr [ebp-4]
 004C6EE7    inc         dword ptr [eax+0C]
 004C6EEA    mov         eax,dword ptr [ebp-4]
 004C6EED    inc         dword ptr [eax+8]
 004C6EF0    pop         ebx
 004C6EF1    mov         esp,ebp
 004C6EF3    pop         ebp
 004C6EF4    ret         8
*}
end;

//004C6EF8
constructor TShape.Create;
begin
{*
 004C6EF8    push        ebp
 004C6EF9    mov         ebp,esp
 004C6EFB    push        ecx
 004C6EFC    push        ebx
 004C6EFD    push        esi
 004C6EFE    test        dl,dl
>004C6F00    je          004C6F0A
 004C6F02    add         esp,0FFFFFFF0
 004C6F05    call        @ClassCreate
 004C6F0A    mov         byte ptr [ebp-1],dl
 004C6F0D    mov         ebx,eax
 004C6F0F    xor         edx,edx
 004C6F11    mov         eax,ebx
 004C6F13    call        TGraphicControl.Create
 004C6F18    mov         eax,dword ptr [ebx+50]
 004C6F1B    or          eax,dword ptr ds:[4C6F98]
 004C6F21    mov         dword ptr [ebx+50],eax
 004C6F24    mov         edx,41
 004C6F29    mov         eax,ebx
 004C6F2B    call        TControl.SetWidth
 004C6F30    mov         edx,41
 004C6F35    mov         eax,ebx
 004C6F37    call        TControl.SetHeight
 004C6F3C    mov         dl,1
 004C6F3E    mov         eax,[0045FE60];TPen
 004C6F43    call        TPen.Create
 004C6F48    mov         esi,eax
 004C6F4A    mov         dword ptr [ebx+1B0],esi
 004C6F50    mov         dword ptr [esi+0C],ebx
 004C6F53    mov         dword ptr [esi+8],4C70F0;TShape.StyleChanged
 004C6F5A    mov         dl,1
 004C6F5C    mov         eax,[00460070];TBrush
 004C6F61    call        TBrush.Create
 004C6F66    mov         esi,eax
 004C6F68    mov         dword ptr [ebx+1B4],esi
 004C6F6E    mov         dword ptr [esi+0C],ebx
 004C6F71    mov         dword ptr [esi+8],4C70F0;TShape.StyleChanged
 004C6F78    mov         eax,ebx
 004C6F7A    cmp         byte ptr [ebp-1],0
>004C6F7E    je          004C6F8F
 004C6F80    call        @AfterConstruction
 004C6F85    pop         dword ptr fs:[0]
 004C6F8C    add         esp,0C
 004C6F8F    mov         eax,ebx
 004C6F91    pop         esi
 004C6F92    pop         ebx
 004C6F93    pop         ecx
 004C6F94    pop         ebp
 004C6F95    ret
*}
end;

//004C6F9C
destructor TShape.Destroy();
begin
{*
 004C6F9C    push        ebx
 004C6F9D    push        esi
 004C6F9E    call        @BeforeDestruction
 004C6FA3    mov         ebx,edx
 004C6FA5    mov         esi,eax
 004C6FA7    mov         eax,dword ptr [esi+1B0]
 004C6FAD    call        TObject.Free
 004C6FB2    mov         eax,dword ptr [esi+1B4]
 004C6FB8    call        TObject.Free
 004C6FBD    mov         edx,ebx
 004C6FBF    and         dl,0FC
 004C6FC2    mov         eax,esi
 004C6FC4    call        TGraphicControl.Destroy
 004C6FC9    test        bl,bl
>004C6FCB    jle         004C6FD4
 004C6FCD    mov         eax,esi
 004C6FCF    call        @ClassDestroy
 004C6FD4    pop         esi
 004C6FD5    pop         ebx
 004C6FD6    ret
*}
end;

//004C6FD8
procedure TShape.Paint;
begin
{*
 004C6FD8    push        ebx
 004C6FD9    push        esi
 004C6FDA    push        edi
 004C6FDB    push        ebp
 004C6FDC    add         esp,0FFFFFFF4
 004C6FDF    mov         ebx,eax
 004C6FE1    mov         esi,dword ptr [ebx+1A8]
 004C6FE7    mov         edx,dword ptr [ebx+1B0]
 004C6FED    mov         eax,esi
 004C6FEF    call        TCanvas.SetPen
 004C6FF4    mov         edx,dword ptr [ebx+1B4]
 004C6FFA    mov         eax,esi
 004C6FFC    call        TCanvas.SetBrush
 004C7001    mov         eax,dword ptr [esi+44]
 004C7004    mov         eax,dword ptr [eax+10]
 004C7007    mov         eax,dword ptr [eax+1C]
 004C700A    mov         edx,eax
 004C700C    sar         edx,1
>004C700E    jns         004C7013
 004C7010    adc         edx,0
 004C7013    mov         dword ptr [esp],edx
 004C7016    mov         edx,dword ptr [esp]
 004C7019    mov         dword ptr [esp+4],edx
 004C701D    mov         edi,dword ptr [ebx+48]
 004C7020    sub         edi,eax
 004C7022    inc         edi
 004C7023    mov         ebp,dword ptr [ebx+4C]
 004C7026    sub         ebp,eax
 004C7028    inc         ebp
 004C7029    test        eax,eax
>004C702B    jne         004C702F
 004C702D    dec         edi
 004C702E    dec         ebp
 004C702F    cmp         ebp,edi
>004C7031    jle         004C7039
 004C7033    mov         dword ptr [esp+8],edi
>004C7037    jmp         004C703D
 004C7039    mov         dword ptr [esp+8],ebp
 004C703D    movzx       eax,byte ptr [ebx+1B8]
 004C7044    mov         edx,eax
 004C7046    sub         dl,1
>004C7049    je          004C7055
 004C704B    sub         dl,2
>004C704E    je          004C7055
 004C7050    sub         dl,2
>004C7053    jne         004C707A
 004C7055    sub         edi,dword ptr [esp+8]
 004C7059    sar         edi,1
>004C705B    jns         004C7060
 004C705D    adc         edi,0
 004C7060    add         dword ptr [esp],edi
 004C7063    sub         ebp,dword ptr [esp+8]
 004C7067    sar         ebp,1
>004C7069    jns         004C706E
 004C706B    adc         ebp,0
 004C706E    add         dword ptr [esp+4],ebp
 004C7072    mov         edi,dword ptr [esp+8]
 004C7076    mov         ebp,dword ptr [esp+8]
 004C707A    sub         al,2
>004C707C    jb          004C7088
 004C707E    sub         al,2
>004C7080    jb          004C70A2
 004C7082    sub         al,2
>004C7084    jb          004C70CF
>004C7086    jmp         004C70E7
 004C7088    add         edi,dword ptr [esp]
 004C708B    push        edi
 004C708C    add         ebp,dword ptr [esp+8]
 004C7090    push        ebp
 004C7091    mov         ecx,dword ptr [esp+0C]
 004C7095    mov         edx,dword ptr [esp+8]
 004C7099    mov         eax,esi
 004C709B    mov         ebx,dword ptr [eax]
 004C709D    call        dword ptr [ebx+7C]
>004C70A0    jmp         004C70E7
 004C70A2    add         edi,dword ptr [esp]
 004C70A5    push        edi
 004C70A6    add         ebp,dword ptr [esp+8]
 004C70AA    push        ebp
 004C70AB    mov         eax,dword ptr [esp+10]
 004C70AF    test        eax,eax
>004C70B1    jns         004C70B6
 004C70B3    add         eax,3
 004C70B6    sar         eax,2
 004C70B9    push        eax
 004C70BA    push        eax
 004C70BB    mov         ecx,dword ptr [esp+14]
 004C70BF    mov         edx,dword ptr [esp+10]
 004C70C3    mov         eax,esi
 004C70C5    mov         ebx,dword ptr [eax]
 004C70C7    call        dword ptr [ebx+84]
>004C70CD    jmp         004C70E7
 004C70CF    add         edi,dword ptr [esp]
 004C70D2    push        edi
 004C70D3    add         ebp,dword ptr [esp+8]
 004C70D7    push        ebp
 004C70D8    mov         ecx,dword ptr [esp+0C]
 004C70DC    mov         edx,dword ptr [esp+8]
 004C70E0    mov         eax,esi
 004C70E2    mov         ebx,dword ptr [eax]
 004C70E4    call        dword ptr [ebx+50]
 004C70E7    add         esp,0C
 004C70EA    pop         ebp
 004C70EB    pop         edi
 004C70EC    pop         esi
 004C70ED    pop         ebx
 004C70EE    ret
*}
end;

//004C70F0
procedure TShape.StyleChanged(Sender:TObject);
begin
{*
 004C70F0    mov         edx,dword ptr [eax]
 004C70F2    call        dword ptr [edx+90]
 004C70F8    ret
*}
end;

//004C70FC
procedure TShape.SetBrush(Value:TBrush);
begin
{*
 004C70FC    mov         eax,dword ptr [eax+1B4]
 004C7102    mov         ecx,dword ptr [eax]
 004C7104    call        dword ptr [ecx+8]
 004C7107    ret
*}
end;

//004C7108
procedure TShape.SetPen(Value:TPen);
begin
{*
 004C7108    mov         eax,dword ptr [eax+1B0]
 004C710E    mov         ecx,dword ptr [eax]
 004C7110    call        dword ptr [ecx+8]
 004C7113    ret
*}
end;

//004C7114
procedure TShape.SetShape(Value:TShapeType);
begin
{*
 004C7114    cmp         dl,byte ptr [eax+1B8]
>004C711A    je          004C712A
 004C711C    mov         byte ptr [eax+1B8],dl
 004C7122    mov         edx,dword ptr [eax]
 004C7124    call        dword ptr [edx+90]
 004C712A    ret
*}
end;

//004C712C
constructor TImage.Create;
begin
{*
 004C712C    push        ebp
 004C712D    mov         ebp,esp
 004C712F    push        ecx
 004C7130    push        ebx
 004C7131    push        esi
 004C7132    test        dl,dl
>004C7134    je          004C713E
 004C7136    add         esp,0FFFFFFF0
 004C7139    call        @ClassCreate
 004C713E    mov         byte ptr [ebp-1],dl
 004C7141    mov         ebx,eax
 004C7143    xor         edx,edx
 004C7145    mov         eax,ebx
 004C7147    call        TGraphicControl.Create
 004C714C    mov         eax,dword ptr [ebx+50]
 004C714F    or          eax,dword ptr ds:[4C71C0]
 004C7155    mov         dword ptr [ebx+50],eax
 004C7158    mov         dl,1
 004C715A    mov         eax,[0046279C];TPicture
 004C715F    call        TPicture.Create
 004C7164    mov         esi,eax
 004C7166    mov         dword ptr [ebx+1B0],esi
 004C716C    mov         dword ptr [esi+14],ebx
 004C716F    mov         dword ptr [esi+10],4C7768;TImage.PictureChanged
 004C7176    mov         dword ptr [esi+24],ebx
 004C7179    mov         eax,ebx
 004C717B    mov         dx,0FFC6
 004C717F    call        @FindDynaInst
 004C7184    mov         dword ptr [esi+20],eax
 004C7187    mov         edx,69
 004C718C    mov         eax,ebx
 004C718E    call        TControl.SetHeight
 004C7193    mov         edx,69
 004C7198    mov         eax,ebx
 004C719A    call        TControl.SetWidth
 004C719F    mov         eax,ebx
 004C71A1    cmp         byte ptr [ebp-1],0
>004C71A5    je          004C71B6
 004C71A7    call        @AfterConstruction
 004C71AC    pop         dword ptr fs:[0]
 004C71B3    add         esp,0C
 004C71B6    mov         eax,ebx
 004C71B8    pop         esi
 004C71B9    pop         ebx
 004C71BA    pop         ecx
 004C71BB    pop         ebp
 004C71BC    ret
*}
end;

//004C71C4
destructor TImage.Destroy();
begin
{*
 004C71C4    push        ebx
 004C71C5    push        esi
 004C71C6    call        @BeforeDestruction
 004C71CB    mov         ebx,edx
 004C71CD    mov         esi,eax
 004C71CF    mov         eax,dword ptr [esi+1B0]
 004C71D5    call        TObject.Free
 004C71DA    mov         edx,ebx
 004C71DC    and         dl,0FC
 004C71DF    mov         eax,esi
 004C71E1    call        TGraphicControl.Destroy
 004C71E6    test        bl,bl
>004C71E8    jle         004C71F1
 004C71EA    mov         eax,esi
 004C71EC    call        @ClassDestroy
 004C71F1    pop         esi
 004C71F2    pop         ebx
 004C71F3    ret
*}
end;

//004C71F4
procedure TImage.GetPalette;
begin
{*
 004C71F4    push        esi
 004C71F5    xor         edx,edx
 004C71F7    mov         ecx,dword ptr [eax+1B0]
 004C71FD    mov         esi,dword ptr [ecx+0C]
 004C7200    test        esi,esi
>004C7202    je          004C720D
 004C7204    mov         eax,esi
 004C7206    mov         edx,dword ptr [eax]
 004C7208    call        dword ptr [edx+28]
 004C720B    mov         edx,eax
 004C720D    mov         eax,edx
 004C720F    pop         esi
 004C7210    ret
*}
end;

//004C7214
function TImage.DestRect:TRect;
begin
{*
 004C7214    push        ebx
 004C7215    push        esi
 004C7216    push        edi
 004C7217    push        ebp
 004C7218    add         esp,0FFFFFFE8
 004C721B    mov         ebp,edx
 004C721D    mov         ebx,eax
 004C721F    mov         eax,dword ptr [ebx+1B0]
 004C7225    call        TPicture.GetWidth
 004C722A    mov         esi,eax
 004C722C    mov         eax,dword ptr [ebx+1B0]
 004C7232    call        TPicture.GetHeight
 004C7237    mov         edi,eax
 004C7239    mov         eax,ebx
 004C723B    call        TControl.GetClientWidth
 004C7240    mov         dword ptr [esp],eax
 004C7243    mov         eax,ebx
 004C7245    call        TControl.GetClientHeight
 004C724A    mov         dword ptr [esp+4],eax
 004C724E    cmp         byte ptr [ebx+1C0],0
>004C7255    jne         004C7273
 004C7257    cmp         byte ptr [ebx+1C5],0
>004C725E    je          004C72FD
 004C7264    cmp         esi,dword ptr [esp]
>004C7267    jg          004C7273
 004C7269    cmp         edi,dword ptr [esp+4]
>004C726D    jle         004C72FD
 004C7273    cmp         byte ptr [ebx+1C5],0
>004C727A    je          004C72F6
 004C727C    test        esi,esi
>004C727E    jle         004C72F6
 004C7280    test        edi,edi
>004C7282    jle         004C72F6
 004C7284    mov         dword ptr [esp+10],esi
 004C7288    fild        dword ptr [esp+10]
 004C728C    mov         dword ptr [esp+14],edi
 004C7290    fild        dword ptr [esp+14]
 004C7294    fdivp       st(1),st
 004C7296    fstp        qword ptr [esp+8]
 004C729A    wait
 004C729B    cmp         edi,esi
>004C729D    jge         004C72CB
 004C729F    mov         esi,dword ptr [esp]
 004C72A2    fild        dword ptr [esp]
 004C72A5    fdiv        qword ptr [esp+8]
 004C72A9    call        @TRUNC
 004C72AE    mov         edi,eax
 004C72B0    cmp         edi,dword ptr [esp+4]
>004C72B4    jle         004C72FD
 004C72B6    mov         edi,dword ptr [esp+4]
 004C72BA    fild        dword ptr [esp+4]
 004C72BE    fmul        qword ptr [esp+8]
 004C72C2    call        @TRUNC
 004C72C7    mov         esi,eax
>004C72C9    jmp         004C72FD
 004C72CB    mov         edi,dword ptr [esp+4]
 004C72CF    fild        dword ptr [esp+4]
 004C72D3    fmul        qword ptr [esp+8]
 004C72D7    call        @TRUNC
 004C72DC    mov         esi,eax
 004C72DE    cmp         esi,dword ptr [esp]
>004C72E1    jle         004C72FD
 004C72E3    mov         esi,dword ptr [esp]
 004C72E6    fild        dword ptr [esp]
 004C72E9    fdiv        qword ptr [esp+8]
 004C72ED    call        @TRUNC
 004C72F2    mov         edi,eax
>004C72F4    jmp         004C72FD
 004C72F6    mov         esi,dword ptr [esp]
 004C72F9    mov         edi,dword ptr [esp+4]
 004C72FD    xor         eax,eax
 004C72FF    mov         dword ptr [ebp],eax
 004C7302    xor         eax,eax
 004C7304    mov         dword ptr [ebp+4],eax
 004C7307    mov         dword ptr [ebp+8],esi
 004C730A    mov         dword ptr [ebp+0C],edi
 004C730D    cmp         byte ptr [ebx+1C1],0
>004C7314    je          004C7336
 004C7316    mov         ecx,dword ptr [esp+4]
 004C731A    sub         ecx,edi
 004C731C    sar         ecx,1
>004C731E    jns         004C7323
 004C7320    adc         ecx,0
 004C7323    mov         edx,dword ptr [esp]
 004C7326    sub         edx,esi
 004C7328    sar         edx,1
>004C732A    jns         004C732F
 004C732C    adc         edx,0
 004C732F    mov         eax,ebp
 004C7331    call        OffsetRect
 004C7336    add         esp,18
 004C7339    pop         ebp
 004C733A    pop         edi
 004C733B    pop         esi
 004C733C    pop         ebx
 004C733D    ret
*}
end;

//004C7340
procedure DoBufferedPaint(Canvas:TCanvas);
begin
{*
 004C7340    push        ebp
 004C7341    mov         ebp,esp
 004C7343    add         esp,0FFFFFFD8
 004C7346    push        ebx
 004C7347    mov         ebx,eax
 004C7349    lea         edx,[ebp-18]
 004C734C    mov         eax,dword ptr [ebp+8]
 004C734F    mov         eax,dword ptr [eax-4]
 004C7352    call        TImage.DestRect
 004C7357    lea         eax,[ebp-4]
 004C735A    push        eax
 004C735B    push        0
 004C735D    push        2
 004C735F    lea         eax,[ebp-18]
 004C7362    push        eax
 004C7363    mov         eax,ebx
 004C7365    call        TCanvas.GetHandle
 004C736A    push        eax
 004C736B    call        BeginBufferedPaint
 004C7370    mov         dword ptr [ebp-8],eax
 004C7373    xor         eax,eax
 004C7375    push        ebp
 004C7376    push        4C73E0
 004C737B    push        dword ptr fs:[eax]
 004C737E    mov         dword ptr fs:[eax],esp
 004C7381    mov         edx,dword ptr [ebp-4]
 004C7384    mov         eax,ebx
 004C7386    call        TCanvas.SetHandle
 004C738B    lea         edx,[ebp-28]
 004C738E    mov         eax,dword ptr [ebp+8]
 004C7391    mov         eax,dword ptr [eax-4]
 004C7394    call        TImage.DestRect
 004C7399    lea         edx,[ebp-28]
 004C739C    mov         eax,dword ptr [ebp+8]
 004C739F    mov         eax,dword ptr [eax-4]
 004C73A2    mov         eax,dword ptr [eax+1B0]
 004C73A8    mov         ecx,dword ptr [eax+0C]
 004C73AB    mov         eax,ebx
 004C73AD    mov         ebx,dword ptr [eax]
 004C73AF    call        dword ptr [ebx+88]
 004C73B5    push        0FF
 004C73BA    lea         eax,[ebp-18]
 004C73BD    push        eax
 004C73BE    mov         eax,dword ptr [ebp-8]
 004C73C1    push        eax
 004C73C2    call        BufferedPaintSetAlpha
 004C73C7    xor         eax,eax
 004C73C9    pop         edx
 004C73CA    pop         ecx
 004C73CB    pop         ecx
 004C73CC    mov         dword ptr fs:[eax],edx
 004C73CF    push        4C73E7
 004C73D4    push        0FF
 004C73D6    mov         eax,dword ptr [ebp-8]
 004C73D9    push        eax
 004C73DA    call        EndBufferedPaint
 004C73DF    ret
>004C73E0    jmp         @HandleFinally
>004C73E5    jmp         004C73D4
 004C73E7    pop         ebx
 004C73E8    mov         esp,ebp
 004C73EA    pop         ebp
 004C73EB    ret
*}
end;

//004C73EC
procedure TImage.Paint;
begin
{*
 004C73EC    push        ebp
 004C73ED    mov         ebp,esp
 004C73EF    add         esp,0FFFFFFE8
 004C73F2    push        ebx
 004C73F3    mov         dword ptr [ebp-4],eax
 004C73F6    mov         eax,dword ptr [ebp-4]
 004C73F9    test        byte ptr [eax+1C],10
>004C73FD    je          004C7435
 004C73FF    mov         eax,dword ptr [ebp-4]
 004C7402    mov         ebx,dword ptr [eax+1A8]
 004C7408    mov         eax,dword ptr [ebx+44]
 004C740B    mov         dl,1
 004C740D    call        TPen.SetStyle
 004C7412    mov         eax,dword ptr [ebx+48]
 004C7415    mov         dl,1
 004C7417    call        TBrush.SetStyle
 004C741C    mov         eax,dword ptr [ebp-4]
 004C741F    mov         eax,dword ptr [eax+48]
 004C7422    push        eax
 004C7423    mov         eax,dword ptr [ebp-4]
 004C7426    mov         eax,dword ptr [eax+4C]
 004C7429    push        eax
 004C742A    xor         ecx,ecx
 004C742C    xor         edx,edx
 004C742E    mov         eax,ebx
 004C7430    mov         ebx,dword ptr [eax]
 004C7432    call        dword ptr [ebx+7C]
 004C7435    mov         eax,dword ptr [ebp-4]
 004C7438    movzx       eax,byte ptr [eax+1C4]
 004C743F    mov         byte ptr [ebp-5],al
 004C7442    mov         eax,dword ptr [ebp-4]
 004C7445    mov         byte ptr [eax+1C4],1
 004C744C    xor         eax,eax
 004C744E    push        ebp
 004C744F    push        4C74E1
 004C7454    push        dword ptr fs:[eax]
 004C7457    mov         dword ptr fs:[eax],esp
 004C745A    mov         eax,dword ptr [ebp-4]
 004C745D    test        byte ptr [eax+55],80
>004C7461    je          004C7499
 004C7463    mov         eax,dword ptr [ebp-4]
 004C7466    mov         eax,dword ptr [eax+1B0]
 004C746C    cmp         dword ptr [eax+0C],0
>004C7470    je          004C7499
 004C7472    mov         eax,dword ptr [ebp-4]
 004C7475    mov         eax,dword ptr [eax+1B0]
 004C747B    mov         eax,dword ptr [eax+0C]
 004C747E    mov         edx,dword ptr [eax]
 004C7480    call        dword ptr [edx+4C]
 004C7483    test        al,al
>004C7485    jne         004C7499
 004C7487    push        ebp
 004C7488    mov         eax,dword ptr [ebp-4]
 004C748B    mov         eax,dword ptr [eax+1A8]
 004C7491    call        DoBufferedPaint
 004C7496    pop         ecx
>004C7497    jmp         004C74C6
 004C7499    mov         eax,dword ptr [ebp-4]
 004C749C    mov         ebx,dword ptr [eax+1A8]
 004C74A2    lea         edx,[ebp-18]
 004C74A5    mov         eax,dword ptr [ebp-4]
 004C74A8    call        TImage.DestRect
 004C74AD    lea         edx,[ebp-18]
 004C74B0    mov         eax,dword ptr [ebp-4]
 004C74B3    mov         eax,dword ptr [eax+1B0]
 004C74B9    mov         ecx,dword ptr [eax+0C]
 004C74BC    mov         eax,ebx
 004C74BE    mov         ebx,dword ptr [eax]
 004C74C0    call        dword ptr [ebx+88]
 004C74C6    xor         eax,eax
 004C74C8    pop         edx
 004C74C9    pop         ecx
 004C74CA    pop         ecx
 004C74CB    mov         dword ptr fs:[eax],edx
 004C74CE    push        4C74E8
 004C74D3    mov         eax,dword ptr [ebp-4]
 004C74D6    movzx       edx,byte ptr [ebp-5]
 004C74DA    mov         byte ptr [eax+1C4],dl
 004C74E0    ret
>004C74E1    jmp         @HandleFinally
>004C74E6    jmp         004C74D3
 004C74E8    pop         ebx
 004C74E9    mov         esp,ebp
 004C74EB    pop         ebp
 004C74EC    ret
*}
end;

//004C74F0
function TImage.DoPaletteChange:Boolean;
begin
{*
 004C74F0    push        ebx
 004C74F1    push        esi
 004C74F2    push        edi
 004C74F3    push        ebp
 004C74F4    mov         ebp,eax
 004C74F6    xor         ebx,ebx
 004C74F8    mov         eax,dword ptr [ebp+1B0]
 004C74FE    mov         esi,dword ptr [eax+0C]
 004C7501    cmp         byte ptr [ebp+59],0
>004C7505    je          004C7582
 004C7507    test        byte ptr [ebp+1C],1
>004C750B    jne         004C7582
 004C750D    test        esi,esi
>004C750F    je          004C7582
 004C7511    cmp         byte ptr [esi+22],0
>004C7515    je          004C7582
 004C7517    mov         eax,esi
 004C7519    mov         edx,dword ptr [eax]
 004C751B    call        dword ptr [edx+28]
 004C751E    test        eax,eax
>004C7520    jne         004C7528
 004C7522    mov         byte ptr [esi+22],0
>004C7526    jmp         004C7582
 004C7528    mov         dl,1
 004C752A    mov         eax,ebp
 004C752C    call        GetParentForm
 004C7531    mov         edi,eax
 004C7533    test        edi,edi
>004C7535    je          004C7582
 004C7537    cmp         byte ptr [edi+29D],0
>004C753E    je          004C7582
 004C7540    mov         eax,edi
 004C7542    call        TWinControl.HandleAllocated
 004C7547    test        al,al
>004C7549    je          004C7582
 004C754B    cmp         byte ptr [ebp+1C4],0
>004C7552    je          004C7566
 004C7554    push        0
 004C7556    xor         ecx,ecx
 004C7558    mov         edx,30F
 004C755D    mov         eax,edi
 004C755F    call        TControl.Perform
>004C7564    jmp         004C757C
 004C7566    push        0
 004C7568    push        0
 004C756A    push        30F
 004C756F    mov         eax,edi
 004C7571    call        TWinControl.GetHandle
 004C7576    push        eax
 004C7577    call        user32.PostMessageW
 004C757C    mov         bl,1
 004C757E    mov         byte ptr [esi+22],0
 004C7582    mov         eax,ebx
 004C7584    pop         ebp
 004C7585    pop         edi
 004C7586    pop         esi
 004C7587    pop         ebx
 004C7588    ret
*}
end;

//004C758C
procedure TImage.Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:UnicodeString);
begin
{*
 004C758C    push        ebp
 004C758D    mov         ebp,esp
 004C758F    push        ecx
 004C7590    push        ebx
 004C7591    push        esi
 004C7592    push        edi
 004C7593    mov         byte ptr [ebp-1],cl
 004C7596    mov         edi,edx
 004C7598    mov         esi,eax
 004C759A    mov         ebx,dword ptr [ebp+10]
 004C759D    test        byte ptr [esi+1C2],bl
>004C75A3    je          004C75C6
 004C75A5    mov         eax,esi
 004C75A7    call        TImage.DoPaletteChange
 004C75AC    test        al,al
>004C75AE    je          004C75BC
 004C75B0    mov         eax,esi
 004C75B2    mov         edx,dword ptr [eax]
 004C75B4    call        dword ptr [edx+9C]
>004C75BA    jmp         004C75C6
 004C75BC    mov         eax,esi
 004C75BE    mov         edx,dword ptr [eax]
 004C75C0    call        dword ptr [edx+0A0]
 004C75C6    cmp         word ptr [esi+1BA],0
>004C75CE    je          004C75F0
 004C75D0    movzx       eax,byte ptr [ebp+14]
 004C75D4    push        eax
 004C75D5    push        ebx
 004C75D6    mov         eax,dword ptr [ebp+0C]
 004C75D9    push        eax
 004C75DA    mov         eax,dword ptr [ebp+8]
 004C75DD    push        eax
 004C75DE    movzx       ecx,byte ptr [ebp-1]
 004C75E2    mov         edx,edi
 004C75E4    mov         eax,dword ptr [esi+1BC]
 004C75EA    call        dword ptr [esi+1B8]
 004C75F0    pop         edi
 004C75F1    pop         esi
 004C75F2    pop         ebx
 004C75F3    pop         ecx
 004C75F4    pop         ebp
 004C75F5    ret         10
*}
end;

//004C75F8
function TImage.GetCanvas:TCanvas;
begin
{*
 004C75F8    push        ebp
 004C75F9    mov         ebp,esp
 004C75FB    add         esp,0FFFFFFF4
 004C75FE    push        ebx
 004C75FF    xor         edx,edx
 004C7601    mov         dword ptr [ebp-0C],edx
 004C7604    mov         dword ptr [ebp-4],eax
 004C7607    xor         eax,eax
 004C7609    push        ebp
 004C760A    push        4C76EA
 004C760F    push        dword ptr fs:[eax]
 004C7612    mov         dword ptr fs:[eax],esp
 004C7615    mov         eax,dword ptr [ebp-4]
 004C7618    mov         eax,dword ptr [eax+1B0]
 004C761E    cmp         dword ptr [eax+0C],0
>004C7622    jne         004C768B
 004C7624    mov         dl,1
 004C7626    mov         eax,[00463B28];TBitmap
 004C762B    call        TBitmap.Create
 004C7630    mov         dword ptr [ebp-8],eax
 004C7633    xor         eax,eax
 004C7635    push        ebp
 004C7636    push        4C7684
 004C763B    push        dword ptr fs:[eax]
 004C763E    mov         dword ptr fs:[eax],esp
 004C7641    mov         eax,dword ptr [ebp-4]
 004C7644    mov         edx,dword ptr [eax+48]
 004C7647    mov         eax,dword ptr [ebp-8]
 004C764A    mov         ecx,dword ptr [eax]
 004C764C    call        dword ptr [ecx+44]
 004C764F    mov         eax,dword ptr [ebp-4]
 004C7652    mov         edx,dword ptr [eax+4C]
 004C7655    mov         eax,dword ptr [ebp-8]
 004C7658    mov         ecx,dword ptr [eax]
 004C765A    call        dword ptr [ecx+38]
 004C765D    mov         eax,dword ptr [ebp-4]
 004C7660    mov         eax,dword ptr [eax+1B0]
 004C7666    mov         edx,dword ptr [ebp-8]
 004C7669    call        TPicture.SetGraphic
 004C766E    xor         eax,eax
 004C7670    pop         edx
 004C7671    pop         ecx
 004C7672    pop         ecx
 004C7673    mov         dword ptr fs:[eax],edx
 004C7676    push        4C768B
 004C767B    mov         eax,dword ptr [ebp-8]
 004C767E    call        TObject.Free
 004C7683    ret
>004C7684    jmp         @HandleFinally
>004C7689    jmp         004C767B
 004C768B    mov         eax,dword ptr [ebp-4]
 004C768E    mov         eax,dword ptr [eax+1B0]
 004C7694    mov         ebx,dword ptr [eax+0C]
 004C7697    mov         eax,ebx
 004C7699    mov         edx,dword ptr ds:[463B28];TBitmap
 004C769F    call        @IsClass
 004C76A4    test        al,al
>004C76A6    je          004C76B3
 004C76A8    mov         eax,ebx
 004C76AA    call        TBitmap.GetCanvas
 004C76AF    mov         ebx,eax
>004C76B1    jmp         004C76D4
 004C76B3    lea         edx,[ebp-0C]
 004C76B6    mov         eax,[0078CED0];^SResString219:TResStringRec
 004C76BB    call        LoadResString
 004C76C0    mov         ecx,dword ptr [ebp-0C]
 004C76C3    mov         dl,1
 004C76C5    mov         eax,[00439268];EInvalidOperation
 004C76CA    call        Exception.Create
 004C76CF    call        @RaiseExcept
 004C76D4    xor         eax,eax
 004C76D6    pop         edx
 004C76D7    pop         ecx
 004C76D8    pop         ecx
 004C76D9    mov         dword ptr fs:[eax],edx
 004C76DC    push        4C76F1
 004C76E1    lea         eax,[ebp-0C]
 004C76E4    call        @UStrClr
 004C76E9    ret
>004C76EA    jmp         @HandleFinally
>004C76EF    jmp         004C76E1
 004C76F1    mov         eax,ebx
 004C76F3    pop         ebx
 004C76F4    mov         esp,ebp
 004C76F6    pop         ebp
 004C76F7    ret
*}
end;

//004C76F8
procedure TImage.SetCenter(Value:Boolean);
begin
{*
 004C76F8    cmp         dl,byte ptr [eax+1C1]
>004C76FE    je          004C770D
 004C7700    mov         byte ptr [eax+1C1],dl
 004C7706    mov         edx,eax
 004C7708    call        TImage.PictureChanged
 004C770D    ret
*}
end;

//004C7710
procedure TImage.SetPicture(Value:TPicture);
begin
{*
 004C7710    push        esi
 004C7711    mov         esi,eax
 004C7713    mov         eax,dword ptr [esi+1B0]
 004C7719    mov         ecx,dword ptr [eax]
 004C771B    call        dword ptr [ecx+8]
 004C771E    pop         esi
 004C771F    ret
*}
end;

//004C7720
procedure TImage.SetStretch(Value:Boolean);
begin
{*
 004C7720    cmp         dl,byte ptr [eax+1C0]
>004C7726    je          004C7735
 004C7728    mov         byte ptr [eax+1C0],dl
 004C772E    mov         edx,eax
 004C7730    call        TImage.PictureChanged
 004C7735    ret
*}
end;

//004C7738
procedure TImage.SetTransparent(Value:Boolean);
begin
{*
 004C7738    cmp         dl,byte ptr [eax+1C3]
>004C773E    je          004C774D
 004C7740    mov         byte ptr [eax+1C3],dl
 004C7746    mov         edx,eax
 004C7748    call        TImage.PictureChanged
 004C774D    ret
*}
end;

//004C7750
procedure TImage.SetProportional(Value:Boolean);
begin
{*
 004C7750    cmp         dl,byte ptr [eax+1C5]
>004C7756    je          004C7765
 004C7758    mov         byte ptr [eax+1C5],dl
 004C775E    mov         edx,eax
 004C7760    call        TImage.PictureChanged
 004C7765    ret
*}
end;

//004C7768
procedure TImage.PictureChanged(Sender:TObject);
begin
{*
 004C7768    push        ebx
 004C7769    push        esi
 004C776A    add         esp,0FFFFFFF0
 004C776D    mov         ebx,eax
 004C776F    cmp         byte ptr [ebx+5E],0
>004C7773    je          004C77BB
 004C7775    mov         eax,dword ptr [ebx+1B0]
 004C777B    call        TPicture.GetWidth
 004C7780    test        eax,eax
>004C7782    jle         004C77BB
 004C7784    mov         eax,dword ptr [ebx+1B0]
 004C778A    call        TPicture.GetHeight
 004C778F    test        eax,eax
>004C7791    jle         004C77BB
 004C7793    mov         eax,dword ptr [ebx+1B0]
 004C7799    call        TPicture.GetWidth
 004C779E    push        eax
 004C779F    mov         eax,dword ptr [ebx+1B0]
 004C77A5    call        TPicture.GetHeight
 004C77AA    push        eax
 004C77AB    mov         ecx,dword ptr [ebx+44]
 004C77AE    mov         edx,dword ptr [ebx+40]
 004C77B1    mov         eax,ebx
 004C77B3    mov         esi,dword ptr [eax]
 004C77B5    call        dword ptr [esi+98]
 004C77BB    mov         eax,dword ptr [ebx+1B0]
 004C77C1    mov         esi,dword ptr [eax+0C]
 004C77C4    test        esi,esi
>004C77C6    je          004C7869
 004C77CC    mov         eax,esi
 004C77CE    mov         edx,dword ptr ds:[4632EC];TMetafile
 004C77D4    call        @IsClass
 004C77D9    test        al,al
>004C77DB    jne         004C77FC
 004C77DD    mov         eax,esi
 004C77DF    mov         edx,dword ptr ds:[464454];TIcon
 004C77E5    call        @IsClass
 004C77EA    test        al,al
>004C77EC    jne         004C77FC
 004C77EE    movzx       edx,byte ptr [ebx+1C3]
 004C77F5    mov         eax,esi
 004C77F7    mov         ecx,dword ptr [eax]
 004C77F9    call        dword ptr [ecx+40]
 004C77FC    mov         edx,esp
 004C77FE    mov         eax,ebx
 004C7800    call        TImage.DestRect
 004C7805    mov         eax,esi
 004C7807    mov         edx,dword ptr [eax]
 004C7809    call        dword ptr [edx+2C]
 004C780C    test        al,al
>004C780E    jne         004C783C
 004C7810    cmp         dword ptr [esp],0
>004C7814    jg          004C783C
 004C7816    cmp         dword ptr [esp+4],0
>004C781B    jg          004C783C
 004C781D    mov         eax,dword ptr [esp+8]
 004C7821    cmp         eax,dword ptr [ebx+48]
>004C7824    jl          004C783C
 004C7826    mov         eax,dword ptr [esp+0C]
 004C782A    cmp         eax,dword ptr [ebx+4C]
>004C782D    jl          004C783C
 004C782F    mov         eax,[004C7890]
 004C7834    or          eax,dword ptr [ebx+50]
 004C7837    mov         dword ptr [ebx+50],eax
>004C783A    jmp         004C7849
 004C783C    mov         eax,[004C7890]
 004C7841    not         eax
 004C7843    and         eax,dword ptr [ebx+50]
 004C7846    mov         dword ptr [ebx+50],eax
 004C7849    mov         eax,ebx
 004C784B    call        TImage.DoPaletteChange
 004C7850    test        al,al
>004C7852    je          004C7876
 004C7854    cmp         byte ptr [ebx+1C4],0
>004C785B    je          004C7876
 004C785D    mov         eax,ebx
 004C785F    mov         edx,dword ptr [eax]
 004C7861    call        dword ptr [edx+9C]
>004C7867    jmp         004C7876
 004C7869    mov         eax,[004C7890]
 004C786E    not         eax
 004C7870    and         eax,dword ptr [ebx+50]
 004C7873    mov         dword ptr [ebx+50],eax
 004C7876    cmp         byte ptr [ebx+1C4],0
>004C787D    jne         004C7889
 004C787F    mov         eax,ebx
 004C7881    mov         edx,dword ptr [eax]
 004C7883    call        dword ptr [edx+90]
 004C7889    add         esp,10
 004C788C    pop         esi
 004C788D    pop         ebx
 004C788E    ret
*}
end;

//004C7894
function TImage.CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;
begin
{*
 004C7894    push        ebx
 004C7895    push        esi
 004C7896    push        edi
 004C7897    push        ebp
 004C7898    mov         ebp,ecx
 004C789A    mov         edi,edx
 004C789C    mov         esi,eax
 004C789E    mov         bl,1
 004C78A0    test        byte ptr [esi+1C],10
>004C78A4    je          004C78C4
 004C78A6    mov         eax,dword ptr [esi+1B0]
 004C78AC    call        TPicture.GetWidth
 004C78B1    test        eax,eax
>004C78B3    jle         004C78F5
 004C78B5    mov         eax,dword ptr [esi+1B0]
 004C78BB    call        TPicture.GetHeight
 004C78C0    test        eax,eax
>004C78C2    jle         004C78F5
 004C78C4    movzx       eax,byte ptr [esi+5D]
 004C78C8    test        al,al
>004C78CA    je          004C78D2
 004C78CC    add         al,0FD
 004C78CE    sub         al,2
>004C78D0    jae         004C78DF
 004C78D2    mov         eax,dword ptr [esi+1B0]
 004C78D8    call        TPicture.GetWidth
 004C78DD    mov         dword ptr [edi],eax
 004C78DF    movzx       eax,byte ptr [esi+5D]
 004C78E3    sub         al,3
>004C78E5    jae         004C78F5
 004C78E7    mov         eax,dword ptr [esi+1B0]
 004C78ED    call        TPicture.GetHeight
 004C78F2    mov         dword ptr [ebp],eax
 004C78F5    mov         eax,ebx
 004C78F7    pop         ebp
 004C78F8    pop         edi
 004C78F9    pop         esi
 004C78FA    pop         ebx
 004C78FB    ret
*}
end;

//004C78FC
constructor TTimer.Create;
begin
{*
 004C78FC    push        ebx
 004C78FD    push        esi
 004C78FE    test        dl,dl
>004C7900    je          004C790A
 004C7902    add         esp,0FFFFFFF0
 004C7905    call        @ClassCreate
 004C790A    mov         ebx,edx
 004C790C    mov         esi,eax
 004C790E    xor         edx,edx
 004C7910    mov         eax,esi
 004C7912    call        TComponent.Create
 004C7917    mov         byte ptr [esi+48],1
 004C791B    mov         dword ptr [esi+34],3E8
 004C7922    push        esi
 004C7923    push        4C7990;TTimer.WndProc
 004C7928    call        AllocateHWnd
 004C792D    mov         dword ptr [esi+38],eax
 004C7930    mov         eax,esi
 004C7932    test        bl,bl
>004C7934    je          004C7945
 004C7936    call        @AfterConstruction
 004C793B    pop         dword ptr fs:[0]
 004C7942    add         esp,0C
 004C7945    mov         eax,esi
 004C7947    pop         esi
 004C7948    pop         ebx
 004C7949    ret
*}
end;

//004C794C
destructor TTimer.Destroy();
begin
{*
 004C794C    push        ebx
 004C794D    push        esi
 004C794E    call        @BeforeDestruction
 004C7953    mov         ebx,edx
 004C7955    mov         esi,eax
 004C7957    mov         byte ptr [esi+48],0
 004C795B    cmp         dword ptr [esi+38],0
>004C795F    je          004C7975
 004C7961    mov         eax,esi
 004C7963    call        TTimer.UpdateTimer
 004C7968    mov         eax,dword ptr [esi+38]
 004C796B    call        DeallocateHWnd
 004C7970    xor         eax,eax
 004C7972    mov         dword ptr [esi+38],eax
 004C7975    mov         edx,ebx
 004C7977    and         dl,0FC
 004C797A    mov         eax,esi
 004C797C    call        TComponent.Destroy
 004C7981    test        bl,bl
>004C7983    jle         004C798C
 004C7985    mov         eax,esi
 004C7987    call        @ClassDestroy
 004C798C    pop         esi
 004C798D    pop         ebx
 004C798E    ret
*}
end;

//004C7990
procedure TTimer.WndProc(var Msg:TMessage);
begin
{*
 004C7990    push        ebp
 004C7991    mov         ebp,esp
 004C7993    push        ecx
 004C7994    push        ebx
 004C7995    push        esi
 004C7996    push        edi
 004C7997    mov         ebx,edx
 004C7999    mov         dword ptr [ebp-4],eax
 004C799C    mov         esi,dword ptr [ebx]
 004C799E    cmp         esi,113
>004C79A4    jne         004C79E5
 004C79A6    xor         eax,eax
 004C79A8    push        ebp
 004C79A9    push        4C79CA
 004C79AE    push        dword ptr fs:[eax]
 004C79B1    mov         dword ptr fs:[eax],esp
 004C79B4    mov         eax,dword ptr [ebp-4]
 004C79B7    mov         si,0FFF0
 004C79BB    call        @CallDynaInst
 004C79C0    xor         eax,eax
 004C79C2    pop         edx
 004C79C3    pop         ecx
 004C79C4    pop         ecx
 004C79C5    mov         dword ptr fs:[eax],edx
>004C79C8    jmp         004C79FD
>004C79CA    jmp         @HandleAnyException
 004C79CF    mov         eax,[0078D590];^Application:TApplication
 004C79D4    mov         eax,dword ptr [eax]
 004C79D6    mov         edx,dword ptr [ebp-4]
 004C79D9    call        TApplication.HandleException
 004C79DE    call        @DoneExcept
>004C79E3    jmp         004C79FD
 004C79E5    mov         eax,dword ptr [ebx+8]
 004C79E8    push        eax
 004C79E9    mov         eax,dword ptr [ebx+4]
 004C79EC    push        eax
 004C79ED    push        esi
 004C79EE    mov         eax,dword ptr [ebp-4]
 004C79F1    mov         eax,dword ptr [eax+38]
 004C79F4    push        eax
 004C79F5    call        user32.DefWindowProcW
 004C79FA    mov         dword ptr [ebx+0C],eax
 004C79FD    pop         edi
 004C79FE    pop         esi
 004C79FF    pop         ebx
 004C7A00    pop         ecx
 004C7A01    pop         ebp
 004C7A02    ret
*}
end;

//004C7A04
procedure TTimer.UpdateTimer;
begin
{*
 004C7A04    push        ebp
 004C7A05    mov         ebp,esp
 004C7A07    push        0
 004C7A09    push        ebx
 004C7A0A    push        esi
 004C7A0B    mov         ebx,eax
 004C7A0D    xor         eax,eax
 004C7A0F    push        ebp
 004C7A10    push        4C7A83
 004C7A15    push        dword ptr fs:[eax]
 004C7A18    mov         dword ptr fs:[eax],esp
 004C7A1B    push        1
 004C7A1D    mov         eax,dword ptr [ebx+38]
 004C7A20    push        eax
 004C7A21    call        user32.KillTimer
 004C7A26    mov         esi,dword ptr [ebx+34]
 004C7A29    test        esi,esi
>004C7A2B    je          004C7A6D
 004C7A2D    cmp         byte ptr [ebx+48],0
>004C7A31    je          004C7A6D
 004C7A33    cmp         word ptr [ebx+42],0
>004C7A38    je          004C7A6D
 004C7A3A    push        0
 004C7A3C    push        esi
 004C7A3D    push        1
 004C7A3F    mov         eax,dword ptr [ebx+38]
 004C7A42    push        eax
 004C7A43    call        user32.SetTimer
 004C7A48    test        eax,eax
>004C7A4A    jne         004C7A6D
 004C7A4C    lea         edx,[ebp-4]
 004C7A4F    mov         eax,[0078DAF8];^SResString211:TResStringRec
 004C7A54    call        LoadResString
 004C7A59    mov         ecx,dword ptr [ebp-4]
 004C7A5C    mov         dl,1
 004C7A5E    mov         eax,[004391C8];EOutOfResources
 004C7A63    call        Exception.Create
 004C7A68    call        @RaiseExcept
 004C7A6D    xor         eax,eax
 004C7A6F    pop         edx
 004C7A70    pop         ecx
 004C7A71    pop         ecx
 004C7A72    mov         dword ptr fs:[eax],edx
 004C7A75    push        4C7A8A
 004C7A7A    lea         eax,[ebp-4]
 004C7A7D    call        @UStrClr
 004C7A82    ret
>004C7A83    jmp         @HandleFinally
>004C7A88    jmp         004C7A7A
 004C7A8A    pop         esi
 004C7A8B    pop         ebx
 004C7A8C    pop         ecx
 004C7A8D    pop         ebp
 004C7A8E    ret
*}
end;

//004C7A90
procedure TTimer.SetEnabled(Value:Boolean);
begin
{*
 004C7A90    cmp         dl,byte ptr [eax+48]
>004C7A93    je          004C7A9D
 004C7A95    mov         byte ptr [eax+48],dl
 004C7A98    call        TTimer.UpdateTimer
 004C7A9D    ret
*}
end;

//004C7AA0
procedure TTimer.SetInterval(Value:Cardinal);
begin
{*
 004C7AA0    cmp         edx,dword ptr [eax+34]
>004C7AA3    je          004C7AAD
 004C7AA5    mov         dword ptr [eax+34],edx
 004C7AA8    call        TTimer.UpdateTimer
 004C7AAD    ret
*}
end;

//004C7AB0
procedure TTimer.SetOnTimer(Value:TNotifyEvent);
begin
{*
 004C7AB0    push        ebp
 004C7AB1    mov         ebp,esp
 004C7AB3    mov         edx,dword ptr [ebp+8]
 004C7AB6    mov         dword ptr [eax+40],edx
 004C7AB9    mov         edx,dword ptr [ebp+0C]
 004C7ABC    mov         dword ptr [eax+44],edx
 004C7ABF    call        TTimer.UpdateTimer
 004C7AC4    pop         ebp
 004C7AC5    ret         8
*}
end;

//004C7AC8
procedure TTimer.Timer;
begin
{*
 004C7AC8    push        ebx
 004C7AC9    cmp         word ptr [eax+42],0
>004C7ACE    je          004C7ADA
 004C7AD0    mov         ebx,eax
 004C7AD2    mov         edx,eax
 004C7AD4    mov         eax,dword ptr [ebx+44]
 004C7AD7    call        dword ptr [ebx+40]
 004C7ADA    pop         ebx
 004C7ADB    ret
*}
end;

//004C7ADC
constructor TCustomPanel.Create;
begin
{*
 004C7ADC    push        ebx
 004C7ADD    push        esi
 004C7ADE    test        dl,dl
>004C7AE0    je          004C7AEA
 004C7AE2    add         esp,0FFFFFFF0
 004C7AE5    call        @ClassCreate
 004C7AEA    mov         ebx,edx
 004C7AEC    mov         esi,eax
 004C7AEE    xor         edx,edx
 004C7AF0    mov         eax,esi
 004C7AF2    call        TCustomControl.Create
 004C7AF7    mov         eax,[004C7BB0]
 004C7AFC    mov         dword ptr [esi+50],eax
 004C7AFF    call        ThemeServices
 004C7B04    call        TThemeServices.GetThemesEnabled
 004C7B09    test        al,al
>004C7B0B    je          004C7B23
 004C7B0D    mov         eax,dword ptr [esi+50]
 004C7B10    or          eax,dword ptr ds:[4C7BB4]
 004C7B16    mov         edx,dword ptr ds:[4C7BB8]
 004C7B1C    not         edx
 004C7B1E    and         edx,eax
 004C7B20    mov         dword ptr [esi+50],edx
 004C7B23    mov         edx,0B9
 004C7B28    mov         eax,esi
 004C7B2A    call        TControl.SetWidth
 004C7B2F    mov         edx,29
 004C7B34    mov         eax,esi
 004C7B36    call        TControl.SetHeight
 004C7B3B    mov         byte ptr [esi+278],2
 004C7B42    mov         byte ptr [esi+289],2
 004C7B49    mov         dl,2
 004C7B4B    mov         eax,esi
 004C7B4D    call        TCustomPanel.SetBevelOuter
 004C7B52    mov         edx,1
 004C7B57    mov         eax,esi
 004C7B59    call        TCustomPanel.SetBevelWidth
 004C7B5E    mov         byte ptr [esi+284],0
 004C7B65    mov         edx,0FF00000F
 004C7B6A    mov         eax,esi
 004C7B6C    call        TControl.SetColor
 004C7B71    mov         byte ptr [esi+285],1
 004C7B78    mov         dl,1
 004C7B7A    mov         eax,esi
 004C7B7C    call        TWinControl.SetUseDockManager
 004C7B81    mov         dl,1
 004C7B83    mov         eax,esi
 004C7B85    mov         ecx,dword ptr [eax]
 004C7B87    call        dword ptr [ecx+0D8]
 004C7B8D    mov         byte ptr [esi+288],1
 004C7B94    mov         eax,esi
 004C7B96    test        bl,bl
>004C7B98    je          004C7BA9
 004C7B9A    call        @AfterConstruction
 004C7B9F    pop         dword ptr fs:[0]
 004C7BA6    add         esp,0C
 004C7BA9    mov         eax,esi
 004C7BAB    pop         esi
 004C7BAC    pop         ebx
 004C7BAD    ret
*}
end;

//004C7BBC
procedure TCustomPanel.CreateParams(var Params:TCreateParams);
begin
{*
 004C7BBC    push        ebx
 004C7BBD    push        esi
 004C7BBE    mov         esi,edx
 004C7BC0    mov         ebx,eax
 004C7BC2    mov         edx,esi
 004C7BC4    mov         eax,ebx
 004C7BC6    call        TWinControl.CreateParams
 004C7BCB    movzx       eax,byte ptr [ebx+284]
 004C7BD2    mov         eax,dword ptr [eax*4+786380]
 004C7BD9    or          dword ptr [esi+4],eax
 004C7BDC    mov         eax,[0078D264];^NewStyleControls:Boolean
 004C7BE1    cmp         byte ptr [eax],0
>004C7BE4    je          004C7C06
 004C7BE6    cmp         byte ptr [ebx+1E9],0
>004C7BED    je          004C7C06
 004C7BEF    cmp         byte ptr [ebx+284],1
>004C7BF6    jne         004C7C06
 004C7BF8    and         dword ptr [esi+4],0FF7FFFFF
 004C7BFF    or          dword ptr [esi+8],200
 004C7C06    and         dword ptr [esi+24],0FFFFFFFC
 004C7C0A    pop         esi
 004C7C0B    pop         ebx
 004C7C0C    ret
*}
end;

//004C7C10
procedure TCustomPanel.CMBorderChanged(var Message:TMessage);
begin
{*
 004C7C10    push        esi
 004C7C11    mov         esi,eax
 004C7C13    mov         eax,esi
 004C7C15    call        TWinControl.CMBorderChanged
 004C7C1A    mov         eax,esi
 004C7C1C    mov         edx,dword ptr [eax]
 004C7C1E    call        dword ptr [edx+90]
 004C7C24    pop         esi
 004C7C25    ret
*}
end;

//004C7C28
procedure TCustomPanel.CMTextChanged(var Message:TMessage);
begin
{*
 004C7C28    mov         edx,dword ptr [eax]
 004C7C2A    call        dword ptr [edx+90]
 004C7C30    ret
*}
end;

//004C7C34
procedure TCustomPanel.CMCtl3DChanged(var Message:TMessage);
begin
{*
 004C7C34    push        ebx
 004C7C35    push        esi
 004C7C36    mov         esi,edx
 004C7C38    mov         ebx,eax
 004C7C3A    mov         eax,[0078D264];^NewStyleControls:Boolean
 004C7C3F    cmp         byte ptr [eax],0
>004C7C42    je          004C7C54
 004C7C44    cmp         byte ptr [ebx+284],1
>004C7C4B    jne         004C7C54
 004C7C4D    mov         eax,ebx
 004C7C4F    call        TWinControl.RecreateWnd
 004C7C54    mov         edx,esi
 004C7C56    mov         eax,ebx
 004C7C58    call        TWinControl.CMCtl3DChanged
 004C7C5D    pop         esi
 004C7C5E    pop         ebx
 004C7C5F    ret
*}
end;

//004C7C60
procedure TCustomPanel.CMIsToolControl(var Message:TMessage);
begin
{*
 004C7C60    cmp         byte ptr [eax+286],0
>004C7C67    jne         004C7C70
 004C7C69    mov         dword ptr [edx+0C],1
 004C7C70    ret
*}
end;

//004C7C74
procedure TCustomPanel.WMWindowPosChanged(var Message:TWMWindowPosChanged);
begin
{*
 004C7C74    push        ebp
 004C7C75    mov         ebp,esp
 004C7C77    add         esp,0FFFFFFEC
 004C7C7A    push        ebx
 004C7C7B    push        esi
 004C7C7C    push        edi
 004C7C7D    xor         ecx,ecx
 004C7C7F    mov         dword ptr [ebp-14],ecx
 004C7C82    mov         edi,edx
 004C7C84    mov         ebx,eax
 004C7C86    xor         eax,eax
 004C7C88    push        ebp
 004C7C89    push        4C7D74
 004C7C8E    push        dword ptr fs:[eax]
 004C7C91    mov         dword ptr fs:[eax],esp
 004C7C94    cmp         byte ptr [ebx+285],0
>004C7C9B    jne         004C7CB6
 004C7C9D    cmp         byte ptr [ebx+288],0
>004C7CA4    je          004C7CC5
 004C7CA6    lea         edx,[ebp-14]
 004C7CA9    mov         eax,ebx
 004C7CAB    call        TControl.GetText
 004C7CB0    cmp         dword ptr [ebp-14],0
>004C7CB4    je          004C7CC5
 004C7CB6    mov         eax,ebx
 004C7CB8    mov         edx,dword ptr [eax]
 004C7CBA    call        dword ptr [edx+90]
>004C7CC0    jmp         004C7D55
 004C7CC5    mov         esi,dword ptr [ebx+280]
 004C7CCB    cmp         byte ptr [ebx+27A],0
>004C7CD2    je          004C7CDC
 004C7CD4    mov         eax,dword ptr [ebx+27C]
 004C7CDA    add         esi,eax
 004C7CDC    cmp         byte ptr [ebx+27B],0
>004C7CE3    je          004C7CED
 004C7CE5    mov         eax,dword ptr [ebx+27C]
 004C7CEB    add         esi,eax
 004C7CED    test        esi,esi
>004C7CEF    jle         004C7D55
 004C7CF1    mov         eax,dword ptr [ebx+48]
 004C7CF4    mov         dword ptr [ebp-8],eax
 004C7CF7    mov         eax,dword ptr [ebx+4C]
 004C7CFA    mov         dword ptr [ebp-4],eax
 004C7CFD    mov         eax,dword ptr [edi+8]
 004C7D00    mov         eax,dword ptr [eax+10]
 004C7D03    cmp         eax,dword ptr [ebp-8]
>004C7D06    je          004C7D29
 004C7D08    xor         eax,eax
 004C7D0A    mov         dword ptr [ebp-0C],eax
 004C7D0D    mov         eax,dword ptr [ebp-8]
 004C7D10    sub         eax,esi
 004C7D12    dec         eax
 004C7D13    mov         dword ptr [ebp-10],eax
 004C7D16    push        0FF
 004C7D18    lea         eax,[ebp-10]
 004C7D1B    push        eax
 004C7D1C    mov         eax,ebx
 004C7D1E    call        TWinControl.GetHandle
 004C7D23    push        eax
 004C7D24    call        user32.InvalidateRect
 004C7D29    mov         eax,dword ptr [edi+8]
 004C7D2C    mov         eax,dword ptr [eax+14]
 004C7D2F    cmp         eax,dword ptr [ebp-4]
>004C7D32    je          004C7D55
 004C7D34    xor         eax,eax
 004C7D36    mov         dword ptr [ebp-10],eax
 004C7D39    mov         eax,dword ptr [ebp-4]
 004C7D3C    sub         eax,esi
 004C7D3E    dec         eax
 004C7D3F    mov         dword ptr [ebp-0C],eax
 004C7D42    push        0FF
 004C7D44    lea         eax,[ebp-10]
 004C7D47    push        eax
 004C7D48    mov         eax,ebx
 004C7D4A    call        TWinControl.GetHandle
 004C7D4F    push        eax
 004C7D50    call        user32.InvalidateRect
 004C7D55    mov         edx,edi
 004C7D57    mov         eax,ebx
 004C7D59    call        TWinControl.WMWindowPosChanged
 004C7D5E    xor         eax,eax
 004C7D60    pop         edx
 004C7D61    pop         ecx
 004C7D62    pop         ecx
 004C7D63    mov         dword ptr fs:[eax],edx
 004C7D66    push        4C7D7B
 004C7D6B    lea         eax,[ebp-14]
 004C7D6E    call        @UStrClr
 004C7D73    ret
>004C7D74    jmp         @HandleFinally
>004C7D79    jmp         004C7D6B
 004C7D7B    pop         edi
 004C7D7C    pop         esi
 004C7D7D    pop         ebx
 004C7D7E    mov         esp,ebp
 004C7D80    pop         ebp
 004C7D81    ret
*}
end;

//004C7D84
procedure AdjustColors(Bevel:TBevelCut);
begin
{*
 004C7D84    push        ebp
 004C7D85    mov         ebp,esp
 004C7D87    mov         edx,dword ptr [ebp+8]
 004C7D8A    mov         dword ptr [edx-4],0FF000014
 004C7D91    cmp         al,1
>004C7D93    jne         004C7D9F
 004C7D95    mov         edx,dword ptr [ebp+8]
 004C7D98    mov         dword ptr [edx-4],0FF000010
 004C7D9F    mov         edx,dword ptr [ebp+8]
 004C7DA2    mov         dword ptr [edx-8],0FF000010
 004C7DA9    cmp         al,1
>004C7DAB    jne         004C7DB7
 004C7DAD    mov         eax,dword ptr [ebp+8]
 004C7DB0    mov         dword ptr [eax-8],0FF000014
 004C7DB7    pop         ebp
 004C7DB8    ret
*}
end;

//004C7DBC
procedure TCustomPanel.Paint;
begin
{*
 004C7DBC    push        ebp
 004C7DBD    mov         ebp,esp
 004C7DBF    add         esp,0FFFFFFDC
 004C7DC2    push        ebx
 004C7DC3    push        esi
 004C7DC4    push        edi
 004C7DC5    xor         edx,edx
 004C7DC7    mov         dword ptr [ebp-20],edx
 004C7DCA    mov         dword ptr [ebp-1C],edx
 004C7DCD    mov         ebx,eax
 004C7DCF    xor         eax,eax
 004C7DD1    push        ebp
 004C7DD2    push        4C7F64
 004C7DD7    push        dword ptr fs:[eax]
 004C7DDA    mov         dword ptr fs:[eax],esp
 004C7DDD    lea         edx,[ebp-18]
 004C7DE0    mov         eax,ebx
 004C7DE2    mov         ecx,dword ptr [eax]
 004C7DE4    call        dword ptr [ecx+54]
 004C7DE7    movzx       eax,byte ptr [ebx+27B]
 004C7DEE    test        al,al
>004C7DF0    je          004C7E15
 004C7DF2    push        ebp
 004C7DF3    call        AdjustColors
 004C7DF8    pop         ecx
 004C7DF9    mov         eax,dword ptr [ebp-8]
 004C7DFC    push        eax
 004C7DFD    mov         eax,dword ptr [ebx+27C]
 004C7E03    push        eax
 004C7E04    lea         edx,[ebp-18]
 004C7E07    mov         ecx,dword ptr [ebp-4]
 004C7E0A    mov         eax,dword ptr [ebx+270]
 004C7E10    call        Frame3D
 004C7E15    call        ThemeServices
 004C7E1A    call        TThemeServices.GetThemesEnabled
 004C7E1F    test        al,al
>004C7E21    je          004C7E29
 004C7E23    test        byte ptr [ebx+52],4
>004C7E27    jne         004C7E46
 004C7E29    mov         eax,dword ptr [ebx+6C]
 004C7E2C    push        eax
 004C7E2D    mov         edx,dword ptr [ebx+280]
 004C7E33    push        edx
 004C7E34    lea         edx,[ebp-18]
 004C7E37    mov         ecx,eax
 004C7E39    mov         eax,dword ptr [ebx+270]
 004C7E3F    call        Frame3D
>004C7E44    jmp         004C7E61
 004C7E46    mov         eax,dword ptr [ebx+280]
 004C7E4C    neg         eax
 004C7E4E    push        eax
 004C7E4F    mov         edx,dword ptr [ebx+280]
 004C7E55    neg         edx
 004C7E57    push        eax
 004C7E58    lea         eax,[ebp-18]
 004C7E5B    push        eax
 004C7E5C    call        user32.InflateRect
 004C7E61    movzx       eax,byte ptr [ebx+27A]
 004C7E68    test        al,al
>004C7E6A    je          004C7E8F
 004C7E6C    push        ebp
 004C7E6D    call        AdjustColors
 004C7E72    pop         ecx
 004C7E73    mov         eax,dword ptr [ebp-8]
 004C7E76    push        eax
 004C7E77    mov         eax,dword ptr [ebx+27C]
 004C7E7D    push        eax
 004C7E7E    lea         edx,[ebp-18]
 004C7E81    mov         ecx,dword ptr [ebp-4]
 004C7E84    mov         eax,dword ptr [ebx+270]
 004C7E8A    call        Frame3D
 004C7E8F    mov         esi,dword ptr [ebx+270]
 004C7E95    call        ThemeServices
 004C7E9A    call        TThemeServices.GetThemesEnabled
 004C7E9F    test        al,al
>004C7EA1    je          004C7EAE
 004C7EA3    mov         eax,ebx
 004C7EA5    call        TWinControl.GetParentBackground
 004C7EAA    test        al,al
>004C7EAC    jne         004C7EC3
 004C7EAE    mov         edx,dword ptr [ebx+6C]
 004C7EB1    mov         eax,dword ptr [esi+48]
 004C7EB4    call        TBrush.SetColor
 004C7EB9    lea         edx,[ebp-18]
 004C7EBC    mov         eax,esi
 004C7EBE    mov         ecx,dword ptr [eax]
 004C7EC0    call        dword ptr [ecx+54]
 004C7EC3    cmp         byte ptr [ebx+288],0
>004C7ECA    je          004C7F49
 004C7ECC    lea         edx,[ebp-1C]
 004C7ECF    mov         eax,ebx
 004C7ED1    call        TControl.GetText
 004C7ED6    cmp         dword ptr [ebp-1C],0
>004C7EDA    je          004C7F49
 004C7EDC    mov         dl,1
 004C7EDE    mov         eax,dword ptr [esi+48]
 004C7EE1    call        TBrush.SetStyle
 004C7EE6    mov         edx,dword ptr [ebx+64]
 004C7EE9    mov         eax,esi
 004C7EEB    call        TCanvas.SetFont
 004C7EF0    movzx       eax,byte ptr [ebx+289]
 004C7EF7    mov         edi,dword ptr [eax*4+786394]
 004C7EFE    or          edi,60
 004C7F01    movzx       eax,byte ptr [ebx+278]
 004C7F08    or          edi,dword ptr [eax*4+786388]
 004C7F0F    mov         edx,edi
 004C7F11    mov         eax,ebx
 004C7F13    call        TControl.DrawTextBiDiModeFlags
 004C7F18    mov         edi,eax
 004C7F1A    mov         eax,esi
 004C7F1C    call        TCanvas.GetHandle
 004C7F21    mov         esi,eax
 004C7F23    lea         edx,[ebp-20]
 004C7F26    mov         eax,ebx
 004C7F28    call        TControl.GetText
 004C7F2D    mov         ebx,dword ptr [ebp-20]
 004C7F30    push        edi
 004C7F31    lea         eax,[ebp-18]
 004C7F34    push        eax
 004C7F35    push        0FF
 004C7F37    mov         dword ptr [ebp-24],ebx
 004C7F3A    mov         eax,dword ptr [ebp-24]
 004C7F3D    call        @UStrToPWChar
 004C7F42    push        eax
 004C7F43    push        esi
 004C7F44    call        user32.DrawTextW
 004C7F49    xor         eax,eax
 004C7F4B    pop         edx
 004C7F4C    pop         ecx
 004C7F4D    pop         ecx
 004C7F4E    mov         dword ptr fs:[eax],edx
 004C7F51    push        4C7F6B
 004C7F56    lea         eax,[ebp-20]
 004C7F59    mov         edx,2
 004C7F5E    call        @UStrArrayClr
 004C7F63    ret
>004C7F64    jmp         @HandleFinally
>004C7F69    jmp         004C7F56
 004C7F6B    pop         edi
 004C7F6C    pop         esi
 004C7F6D    pop         ebx
 004C7F6E    mov         esp,ebp
 004C7F70    pop         ebp
 004C7F71    ret
*}
end;

//004C7F74
procedure TCustomPanel.SetAlignment(Value:TAlignment);
begin
{*
 004C7F74    push        esi
 004C7F75    mov         esi,eax
 004C7F77    mov         byte ptr [esi+278],dl
 004C7F7D    mov         eax,esi
 004C7F7F    mov         edx,dword ptr [eax]
 004C7F81    call        dword ptr [edx+90]
 004C7F87    pop         esi
 004C7F88    ret
*}
end;

//004C7F8C
procedure TCustomPanel.SetBevelInner(Value:TBevelCut);
begin
{*
 004C7F8C    push        esi
 004C7F8D    mov         esi,eax
 004C7F8F    mov         byte ptr [esi+27A],dl
 004C7F95    mov         eax,esi
 004C7F97    call        TWinControl.Realign
 004C7F9C    mov         eax,esi
 004C7F9E    mov         edx,dword ptr [eax]
 004C7FA0    call        dword ptr [edx+90]
 004C7FA6    pop         esi
 004C7FA7    ret
*}
end;

//004C7FA8
procedure TCustomPanel.SetBevelOuter(Value:TBevelCut);
begin
{*
 004C7FA8    push        esi
 004C7FA9    mov         esi,eax
 004C7FAB    mov         byte ptr [esi+27B],dl
 004C7FB1    mov         eax,esi
 004C7FB3    call        TWinControl.Realign
 004C7FB8    mov         eax,esi
 004C7FBA    mov         edx,dword ptr [eax]
 004C7FBC    call        dword ptr [edx+90]
 004C7FC2    pop         esi
 004C7FC3    ret
*}
end;

//004C7FC4
procedure TCustomPanel.SetBevelWidth(Value:TBevelWidth);
begin
{*
 004C7FC4    push        esi
 004C7FC5    mov         esi,eax
 004C7FC7    mov         dword ptr [esi+27C],edx
 004C7FCD    mov         eax,esi
 004C7FCF    call        TWinControl.Realign
 004C7FD4    mov         eax,esi
 004C7FD6    mov         edx,dword ptr [eax]
 004C7FD8    call        dword ptr [edx+90]
 004C7FDE    pop         esi
 004C7FDF    ret
*}
end;

//004C7FE0
procedure TCustomPanel.SetBorderWidth(Value:TBorderWidth);
begin
{*
 004C7FE0    push        esi
 004C7FE1    mov         esi,eax
 004C7FE3    mov         dword ptr [esi+280],edx
 004C7FE9    mov         eax,esi
 004C7FEB    call        TWinControl.Realign
 004C7FF0    mov         eax,esi
 004C7FF2    mov         edx,dword ptr [eax]
 004C7FF4    call        dword ptr [edx+90]
 004C7FFA    pop         esi
 004C7FFB    ret
*}
end;

//004C7FFC
procedure TCustomPanel.SetBorderStyle(Value:TBorderStyle);
begin
{*
 004C7FFC    cmp         dl,byte ptr [eax+284]
>004C8002    je          004C800F
 004C8004    mov         byte ptr [eax+284],dl
 004C800A    call        TWinControl.RecreateWnd
 004C800F    ret
*}
end;

//004C8010
procedure TCustomPanel.SetShowCaption(Value:Boolean);
begin
{*
 004C8010    push        esi
 004C8011    mov         esi,eax
 004C8013    cmp         dl,byte ptr [esi+288]
>004C8019    je          004C802B
 004C801B    mov         byte ptr [esi+288],dl
 004C8021    mov         eax,esi
 004C8023    mov         edx,dword ptr [eax]
 004C8025    call        dword ptr [edx+90]
 004C802B    pop         esi
 004C802C    ret
*}
end;

//004C8030
procedure TCustomPanel.GetControlsAlignment;
begin
{*
 004C8030    movzx       eax,byte ptr [eax+278]
 004C8037    ret
*}
end;

//004C8038
procedure TCustomPanel.AdjustClientRect(var Rect:TRect);
begin
{*
 004C8038    push        ebx
 004C8039    push        esi
 004C803A    mov         esi,edx
 004C803C    mov         ebx,eax
 004C803E    mov         edx,esi
 004C8040    mov         eax,ebx
 004C8042    call        TWinControl.AdjustClientRect
 004C8047    mov         eax,dword ptr [ebx+280]
 004C804D    neg         eax
 004C804F    push        eax
 004C8050    mov         edx,dword ptr [ebx+280]
 004C8056    neg         edx
 004C8058    push        eax
 004C8059    push        esi
 004C805A    call        user32.InflateRect
 004C805F    xor         eax,eax
 004C8061    cmp         byte ptr [ebx+27B],0
>004C8068    je          004C8072
 004C806A    mov         edx,dword ptr [ebx+27C]
 004C8070    add         eax,edx
 004C8072    cmp         byte ptr [ebx+27A],0
>004C8079    je          004C8083
 004C807B    mov         edx,dword ptr [ebx+27C]
 004C8081    add         eax,edx
 004C8083    mov         edx,eax
 004C8085    neg         edx
 004C8087    push        edx
 004C8088    neg         eax
 004C808A    push        edx
 004C808B    push        esi
 004C808C    call        user32.InflateRect
 004C8091    pop         esi
 004C8092    pop         ebx
 004C8093    ret
*}
end;

//004C8094
procedure TCustomPanel.CMDockClient(var Message:TCMDockClient);
begin
{*
 004C8094    push        ebp
 004C8095    mov         ebp,esp
 004C8097    add         esp,0FFFFFFE8
 004C809A    push        ebx
 004C809B    push        esi
 004C809C    push        edi
 004C809D    mov         dword ptr [ebp-8],edx
 004C80A0    mov         dword ptr [ebp-4],eax
 004C80A3    mov         eax,dword ptr [ebp-4]
 004C80A6    cmp         byte ptr [eax+5E],0
>004C80AA    je          004C81BD
 004C80B0    mov         eax,dword ptr [ebp-4]
 004C80B3    mov         byte ptr [eax+279],1
 004C80BA    xor         edx,edx
 004C80BC    push        ebp
 004C80BD    push        4C81B6
 004C80C2    push        dword ptr fs:[edx]
 004C80C5    mov         dword ptr fs:[edx],esp
 004C80C8    mov         eax,dword ptr [ebp-8]
 004C80CB    mov         eax,dword ptr [eax+4]
 004C80CE    lea         esi,[eax+4C]
 004C80D1    lea         edi,[ebp-18]
 004C80D4    movs        dword ptr [edi],dword ptr [esi]
 004C80D5    movs        dword ptr [edi],dword ptr [esi]
 004C80D6    movs        dword ptr [edi],dword ptr [esi]
 004C80D7    movs        dword ptr [edi],dword ptr [esi]
 004C80D8    mov         eax,dword ptr [ebp-4]
 004C80DB    movzx       eax,byte ptr [eax+5D]
 004C80DF    dec         al
>004C80E1    je          004C8143
 004C80E3    dec         al
>004C80E5    je          004C815C
 004C80E7    dec         al
>004C80E9    je          004C80F4
 004C80EB    dec         al
>004C80ED    je          004C8111
>004C80EF    jmp         004C818C
 004C80F4    mov         eax,dword ptr [ebp-4]
 004C80F7    cmp         dword ptr [eax+48],0
>004C80FB    jne         004C818C
 004C8101    mov         edx,dword ptr [ebp-10]
 004C8104    sub         edx,dword ptr [ebp-18]
 004C8107    mov         eax,dword ptr [ebp-4]
 004C810A    call        TControl.SetWidth
>004C810F    jmp         004C818C
 004C8111    mov         eax,dword ptr [ebp-4]
 004C8114    cmp         dword ptr [eax+48],0
>004C8118    jne         004C818C
 004C811A    mov         eax,dword ptr [ebp-10]
 004C811D    sub         eax,dword ptr [ebp-18]
 004C8120    push        eax
 004C8121    mov         edx,dword ptr [ebp-4]
 004C8124    mov         edx,dword ptr [edx+4C]
 004C8127    push        edx
 004C8128    mov         edx,dword ptr [ebp-4]
 004C812B    mov         ecx,dword ptr [edx+44]
 004C812E    mov         edx,dword ptr [ebp-4]
 004C8131    mov         edx,dword ptr [edx+40]
 004C8134    sub         edx,eax
 004C8136    mov         eax,dword ptr [ebp-4]
 004C8139    mov         ebx,dword ptr [eax]
 004C813B    call        dword ptr [ebx+98]
>004C8141    jmp         004C818C
 004C8143    mov         eax,dword ptr [ebp-4]
 004C8146    cmp         dword ptr [eax+4C],0
>004C814A    jne         004C818C
 004C814C    mov         edx,dword ptr [ebp-0C]
 004C814F    sub         edx,dword ptr [ebp-14]
 004C8152    mov         eax,dword ptr [ebp-4]
 004C8155    call        TControl.SetHeight
>004C815A    jmp         004C818C
 004C815C    mov         eax,dword ptr [ebp-4]
 004C815F    cmp         dword ptr [eax+4C],0
>004C8163    jne         004C818C
 004C8165    mov         eax,dword ptr [ebp-0C]
 004C8168    sub         eax,dword ptr [ebp-14]
 004C816B    mov         edx,dword ptr [ebp-4]
 004C816E    mov         edx,dword ptr [edx+48]
 004C8171    push        edx
 004C8172    push        eax
 004C8173    mov         edx,dword ptr [ebp-4]
 004C8176    mov         ecx,dword ptr [edx+44]
 004C8179    sub         ecx,eax
 004C817B    mov         eax,dword ptr [ebp-4]
 004C817E    mov         edx,dword ptr [eax+40]
 004C8181    mov         eax,dword ptr [ebp-4]
 004C8184    mov         ebx,dword ptr [eax]
 004C8186    call        dword ptr [ebx+98]
 004C818C    mov         edx,dword ptr [ebp-8]
 004C818F    mov         eax,dword ptr [ebp-4]
 004C8192    call        TWinControl.CMDockClient
 004C8197    call        @TryFinallyExit
>004C819C    jmp         004C81C8
 004C819E    xor         eax,eax
 004C81A0    pop         edx
 004C81A1    pop         ecx
 004C81A2    pop         ecx
 004C81A3    mov         dword ptr fs:[eax],edx
 004C81A6    push        4C81BD
 004C81AB    mov         eax,dword ptr [ebp-4]
 004C81AE    mov         byte ptr [eax+279],0
 004C81B5    ret
>004C81B6    jmp         @HandleFinally
>004C81BB    jmp         004C81AB
 004C81BD    mov         edx,dword ptr [ebp-8]
 004C81C0    mov         eax,dword ptr [ebp-4]
 004C81C3    call        TWinControl.CMDockClient
 004C81C8    pop         edi
 004C81C9    pop         esi
 004C81CA    pop         ebx
 004C81CB    mov         esp,ebp
 004C81CD    pop         ebp
 004C81CE    ret
*}
end;

//004C81D0
function TCustomPanel.CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;
begin
{*
 004C81D0    push        ebx
 004C81D1    push        esi
 004C81D2    push        edi
 004C81D3    mov         edi,ecx
 004C81D5    mov         esi,edx
 004C81D7    mov         ebx,eax
 004C81D9    cmp         byte ptr [ebx+279],0
>004C81E0    jne         004C81F1
 004C81E2    mov         ecx,edi
 004C81E4    mov         edx,esi
 004C81E6    mov         eax,ebx
 004C81E8    call        TWinControl.CanAutoSize
 004C81ED    test        al,al
>004C81EF    jne         004C81F5
 004C81F1    xor         eax,eax
>004C81F3    jmp         004C81F7
 004C81F5    mov         al,1
 004C81F7    pop         edi
 004C81F8    pop         esi
 004C81F9    pop         ebx
 004C81FA    ret
*}
end;

//004C81FC
procedure TCustomPanel.SetParentBackground(Value:Boolean);
begin
{*
 004C81FC    push        ebx
 004C81FD    push        esi
 004C81FE    mov         ebx,edx
 004C8200    mov         esi,eax
 004C8202    test        bl,bl
>004C8204    je          004C8215
 004C8206    mov         eax,[004C8234]
 004C820B    not         eax
 004C820D    and         eax,dword ptr [esi+50]
 004C8210    mov         dword ptr [esi+50],eax
>004C8213    jmp         004C8220
 004C8215    mov         eax,[004C8234]
 004C821A    or          eax,dword ptr [esi+50]
 004C821D    mov         dword ptr [esi+50],eax
 004C8220    mov         byte ptr [esi+287],1
 004C8227    mov         edx,ebx
 004C8229    mov         eax,esi
 004C822B    call        TWinControl.SetParentBackground
 004C8230    pop         esi
 004C8231    pop         ebx
 004C8232    ret
*}
end;

//004C8238
procedure TCustomPanel.SetVerticalAlignment(const Value:TVerticalAlignment);
begin
{*
 004C8238    push        esi
 004C8239    mov         esi,eax
 004C823B    mov         byte ptr [esi+289],dl
 004C8241    mov         eax,esi
 004C8243    mov         edx,dword ptr [eax]
 004C8245    call        dword ptr [edx+90]
 004C824B    pop         esi
 004C824C    ret
*}
end;

//004C8484
constructor TGroupButton.InternalCreate;
begin
{*
 004C8484    push        ebx
 004C8485    push        esi
 004C8486    push        edi
 004C8487    test        dl,dl
>004C8489    je          004C8493
 004C848B    add         esp,0FFFFFFF0
 004C848E    call        @ClassCreate
 004C8493    mov         esi,ecx
 004C8495    mov         ebx,edx
 004C8497    mov         edi,eax
 004C8499    mov         ecx,esi
 004C849B    xor         edx,edx
 004C849D    mov         eax,edi
 004C849F    call        TRadioButton.Create
 004C84A4    mov         edx,edi
 004C84A6    mov         eax,dword ptr [esi+278]
 004C84AC    call        TList.Add
 004C84B1    xor         edx,edx
 004C84B3    mov         eax,edi
 004C84B5    call        TControl.SetVisible
 004C84BA    mov         eax,esi
 004C84BC    mov         edx,dword ptr [eax]
 004C84BE    call        dword ptr [edx+5C]
 004C84C1    mov         edx,eax
 004C84C3    mov         eax,edi
 004C84C5    mov         ecx,dword ptr [eax]
 004C84C7    call        dword ptr [ecx+74]
 004C84CA    xor         edx,edx
 004C84CC    mov         eax,edi
 004C84CE    call        TControl.SetParentShowHint
 004C84D3    mov         dword ptr [edi+114],esi
 004C84D9    mov         dword ptr [edi+110],4C88D0;TCustomRadioGroup.ButtonClick
 004C84E3    mov         edx,esi
 004C84E5    mov         eax,edi
 004C84E7    mov         ecx,dword ptr [eax]
 004C84E9    call        dword ptr [ecx+78]
 004C84EC    mov         eax,edi
 004C84EE    test        bl,bl
>004C84F0    je          004C8501
 004C84F2    call        @AfterConstruction
 004C84F7    pop         dword ptr fs:[0]
 004C84FE    add         esp,0C
 004C8501    mov         eax,edi
 004C8503    pop         edi
 004C8504    pop         esi
 004C8505    pop         ebx
 004C8506    ret
*}
end;

//004C8508
destructor TGroupButton.Destroy();
begin
{*
 004C8508    push        ebx
 004C8509    push        esi
 004C850A    call        @BeforeDestruction
 004C850F    mov         ebx,edx
 004C8511    mov         esi,eax
 004C8513    mov         edx,esi
 004C8515    mov         eax,dword ptr [esi+4]
 004C8518    mov         eax,dword ptr [eax+278]
 004C851E    xor         ecx,ecx
 004C8520    call        TList.RemoveItem
 004C8525    mov         edx,ebx
 004C8527    and         dl,0FC
 004C852A    mov         eax,esi
 004C852C    call        TWinControl.Destroy
 004C8531    test        bl,bl
>004C8533    jle         004C853C
 004C8535    mov         eax,esi
 004C8537    call        @ClassDestroy
 004C853C    pop         esi
 004C853D    pop         ebx
 004C853E    ret
*}
end;

//004C8540
procedure TGroupButton.CNCommand(var Message:TWMCommand);
begin
{*
 004C8540    push        ebp
 004C8541    mov         ebp,esp
 004C8543    push        ecx
 004C8544    push        ebx
 004C8545    push        esi
 004C8546    push        edi
 004C8547    mov         ebx,edx
 004C8549    mov         dword ptr [ebp-4],eax
 004C854C    mov         eax,dword ptr [ebp-4]
 004C854F    cmp         byte ptr [eax+280],0
>004C8556    jne         004C85C8
 004C8558    mov         eax,dword ptr [ebp-4]
 004C855B    mov         byte ptr [eax+280],1
 004C8562    xor         eax,eax
 004C8564    push        ebp
 004C8565    push        4C85A5
 004C856A    push        dword ptr fs:[eax]
 004C856D    mov         dword ptr fs:[eax],esp
 004C8570    movzx       esi,word ptr [ebx+6]
 004C8574    test        si,si
>004C8577    je          004C857F
 004C8579    cmp         si,5
>004C857D    jne         004C859B
 004C857F    mov         eax,dword ptr [ebp-4]
 004C8582    mov         eax,dword ptr [eax+34]
 004C8585    mov         edx,dword ptr [eax]
 004C8587    call        dword ptr [edx+0F0]
 004C858D    test        al,al
>004C858F    je          004C859B
 004C8591    mov         edx,ebx
 004C8593    mov         eax,dword ptr [ebp-4]
 004C8596    call        TRadioButton.CNCommand
 004C859B    xor         eax,eax
 004C859D    pop         edx
 004C859E    pop         ecx
 004C859F    pop         ecx
 004C85A0    mov         dword ptr fs:[eax],edx
>004C85A3    jmp         004C85BE
>004C85A5    jmp         @HandleAnyException
 004C85AA    mov         eax,[0078D590];^Application:TApplication
 004C85AF    mov         eax,dword ptr [eax]
 004C85B1    mov         edx,dword ptr [ebp-4]
 004C85B4    call        TApplication.HandleException
 004C85B9    call        @DoneExcept
 004C85BE    mov         eax,dword ptr [ebp-4]
 004C85C1    mov         byte ptr [eax+280],0
 004C85C8    pop         edi
 004C85C9    pop         esi
 004C85CA    pop         ebx
 004C85CB    pop         ecx
 004C85CC    pop         ebp
 004C85CD    ret
*}
end;

//004C85D0
procedure TGroupButton.KeyPress(var Key:Char);
begin
{*
 004C85D0    push        ebx
 004C85D1    push        esi
 004C85D2    push        edi
 004C85D3    mov         ebx,edx
 004C85D5    mov         edi,eax
 004C85D7    mov         edx,ebx
 004C85D9    mov         eax,edi
 004C85DB    call        TWinControl.KeyPress
 004C85E0    mov         edx,ebx
 004C85E2    mov         eax,dword ptr [edi+34]
 004C85E5    mov         si,0FFB8
 004C85E9    call        @CallDynaInst
 004C85EE    cmp         word ptr [ebx],8
>004C85F2    je          004C85FA
 004C85F4    cmp         word ptr [ebx],20
>004C85F8    jne         004C860E
 004C85FA    mov         eax,dword ptr [edi+34]
 004C85FD    mov         edx,dword ptr [eax]
 004C85FF    call        dword ptr [edx+0F0]
 004C8605    test        al,al
>004C8607    jne         004C860E
 004C8609    mov         word ptr [ebx],0
 004C860E    pop         edi
 004C860F    pop         esi
 004C8610    pop         ebx
 004C8611    ret
*}
end;

//004C8614
procedure TGroupButton.KeyDown(var Key:Word; Shift:TShiftState);
begin
{*
 004C8614    push        ebx
 004C8615    push        esi
 004C8616    push        ecx
 004C8617    mov         word ptr [esp],cx
 004C861B    mov         esi,edx
 004C861D    mov         ebx,eax
 004C861F    mov         edx,esi
 004C8621    movzx       ecx,word ptr [esp]
 004C8625    mov         eax,ebx
 004C8627    call        TWinControl.KeyDown
 004C862C    mov         edx,esi
 004C862E    movzx       ecx,word ptr [esp]
 004C8632    mov         eax,dword ptr [ebx+34]
 004C8635    mov         si,0FFBA
 004C8639    call        @CallDynaInst
 004C863E    pop         edx
 004C863F    pop         esi
 004C8640    pop         ebx
 004C8641    ret
*}
end;

//004C8644
procedure TGroupButton.CreateParams(var Params:TCreateParams);
begin
{*
 004C8644    push        ebx
 004C8645    mov         ebx,edx
 004C8647    mov         edx,ebx
 004C8649    call        TRadioButton.CreateParams
 004C864E    and         dword ptr [ebx+24],0FFFFFFFC
 004C8652    pop         ebx
 004C8653    ret
*}
end;

//004C8654
constructor TCustomRadioGroup.Create;
begin
{*
 004C8654    push        ebp
 004C8655    mov         ebp,esp
 004C8657    push        ecx
 004C8658    push        ebx
 004C8659    push        esi
 004C865A    test        dl,dl
>004C865C    je          004C8666
 004C865E    add         esp,0FFFFFFF0
 004C8661    call        @ClassCreate
 004C8666    mov         byte ptr [ebp-1],dl
 004C8669    mov         ebx,eax
 004C866B    xor         edx,edx
 004C866D    mov         eax,ebx
 004C866F    call        TCustomGroupBox.Create
 004C8674    mov         eax,[004C86E0]
 004C8679    mov         dword ptr [ebx+50],eax
 004C867C    mov         dl,1
 004C867E    mov         eax,[00439644];TList
 004C8683    call        TObject.Create
 004C8688    mov         dword ptr [ebx+278],eax
 004C868E    mov         dl,1
 004C8690    mov         eax,[0043C7BC];TStringList
 004C8695    call        TStringList.Create
 004C869A    mov         esi,eax
 004C869C    mov         dword ptr [ebx+27C],esi
 004C86A2    mov         dword ptr [esi+44],ebx
 004C86A5    mov         dword ptr [esi+40],4C8908;TCustomRadioGroup.ItemsChange
 004C86AC    mov         dword ptr [ebx+280],0FFFFFFFF
 004C86B6    mov         dword ptr [ebx+284],1
 004C86C0    mov         eax,ebx
 004C86C2    cmp         byte ptr [ebp-1],0
>004C86C6    je          004C86D7
 004C86C8    call        @AfterConstruction
 004C86CD    pop         dword ptr fs:[0]
 004C86D4    add         esp,0C
 004C86D7    mov         eax,ebx
 004C86D9    pop         esi
 004C86DA    pop         ebx
 004C86DB    pop         ecx
 004C86DC    pop         ebp
 004C86DD    ret
*}
end;

//004C86E4
destructor TCustomRadioGroup.Destroy();
begin
{*
 004C86E4    push        ebx
 004C86E5    push        esi
 004C86E6    call        @BeforeDestruction
 004C86EB    mov         ebx,edx
 004C86ED    mov         esi,eax
 004C86EF    xor         edx,edx
 004C86F1    mov         eax,esi
 004C86F3    call        TCustomRadioGroup.SetButtonCount
 004C86F8    mov         eax,dword ptr [esi+27C]
 004C86FE    xor         edx,edx
 004C8700    mov         dword ptr [eax+40],edx
 004C8703    mov         dword ptr [eax+44],edx
 004C8706    call        TObject.Free
 004C870B    mov         eax,dword ptr [esi+278]
 004C8711    call        TObject.Free
 004C8716    mov         edx,ebx
 004C8718    and         dl,0FC
 004C871B    mov         eax,esi
 004C871D    call        TCustomControl.Destroy
 004C8722    test        bl,bl
>004C8724    jle         004C872D
 004C8726    mov         eax,esi
 004C8728    call        @ClassDestroy
 004C872D    pop         esi
 004C872E    pop         ebx
 004C872F    ret
*}
end;

//004C8730
procedure TCustomRadioGroup.FlipChildren(AllLevels:Boolean);
begin
{*
 004C8730    ret
*}
end;

//004C8734
procedure TCustomRadioGroup.ArrangeButtons;
begin
{*
 004C8734    push        ebp
 004C8735    mov         ebp,esp
 004C8737    add         esp,0FFFFFFA4
 004C873A    push        ebx
 004C873B    push        esi
 004C873C    push        edi
 004C873D    mov         ebx,eax
 004C873F    mov         eax,dword ptr [ebx+278]
 004C8745    cmp         dword ptr [eax+8],0
>004C8749    je          004C88C8
 004C874F    cmp         byte ptr [ebx+288],0
>004C8756    jne         004C88C8
 004C875C    push        0
 004C875E    call        user32.GetDC
 004C8763    mov         esi,eax
 004C8765    mov         eax,dword ptr [ebx+64]
 004C8768    call        TFont.GetHandle
 004C876D    push        eax
 004C876E    push        esi
 004C876F    call        gdi32.SelectObject
 004C8774    mov         edi,eax
 004C8776    lea         eax,[ebp-5C]
 004C8779    push        eax
 004C877A    push        esi
 004C877B    call        gdi32.GetTextMetricsW
 004C8780    push        edi
 004C8781    push        esi
 004C8782    call        gdi32.SelectObject
 004C8787    push        esi
 004C8788    push        0
 004C878A    call        user32.ReleaseDC
 004C878F    mov         eax,dword ptr [ebx+278]
 004C8795    mov         esi,dword ptr [eax+8]
 004C8798    mov         eax,esi
 004C879A    mov         ecx,dword ptr [ebx+284]
 004C87A0    add         eax,ecx
 004C87A2    dec         eax
 004C87A3    cdq
 004C87A4    idiv        eax,ecx
 004C87A6    mov         dword ptr [ebp-4],eax
 004C87A9    mov         eax,dword ptr [ebx+48]
 004C87AC    sub         eax,0A
 004C87AF    cdq
 004C87B0    idiv        eax,ecx
 004C87B2    mov         dword ptr [ebp-8],eax
 004C87B5    mov         eax,dword ptr [ebx+4C]
 004C87B8    mov         ecx,dword ptr [ebp-5C]
 004C87BB    sub         eax,ecx
 004C87BD    sub         eax,5
 004C87C0    mov         dword ptr [ebp-14],eax
 004C87C3    mov         eax,dword ptr [ebp-14]
 004C87C6    cdq
 004C87C7    idiv        eax,dword ptr [ebp-4]
 004C87CA    mov         dword ptr [ebp-0C],eax
 004C87CD    mov         eax,dword ptr [ebp-14]
 004C87D0    cdq
 004C87D1    idiv        eax,dword ptr [ebp-4]
 004C87D4    sar         edx,1
>004C87D6    jns         004C87DB
 004C87D8    adc         edx,0
 004C87DB    inc         ecx
 004C87DC    add         edx,ecx
 004C87DE    mov         dword ptr [ebp-10],edx
 004C87E1    push        esi
 004C87E2    call        user32.BeginDeferWindowPos
 004C87E7    mov         dword ptr [ebp-18],eax
 004C87EA    xor         eax,eax
 004C87EC    push        ebp
 004C87ED    push        4C88C1
 004C87F2    push        dword ptr fs:[eax]
 004C87F5    mov         dword ptr fs:[eax],esp
 004C87F8    mov         eax,dword ptr [ebx+278]
 004C87FE    mov         eax,dword ptr [eax+8]
 004C8801    dec         eax
 004C8802    test        eax,eax
>004C8804    jl          004C88AA
 004C880A    inc         eax
 004C880B    mov         dword ptr [ebp-20],eax
 004C880E    mov         dword ptr [ebp-14],0
 004C8815    mov         eax,dword ptr [ebx+278]
 004C881B    mov         edx,dword ptr [ebp-14]
 004C881E    call        TList.Get
 004C8823    mov         edi,eax
 004C8825    movzx       edx,byte ptr [ebx+61]
 004C8829    mov         eax,edi
 004C882B    mov         ecx,dword ptr [eax]
 004C882D    call        dword ptr [ecx+80]
 004C8833    mov         eax,dword ptr [ebp-14]
 004C8836    cdq
 004C8837    idiv        eax,dword ptr [ebp-4]
 004C883A    imul        dword ptr [ebp-8]
 004C883D    add         eax,8
 004C8840    mov         dword ptr [ebp-1C],eax
 004C8843    mov         eax,edi
 004C8845    mov         si,0FFC7
 004C8849    call        @CallDynaInst
 004C884E    test        al,al
>004C8850    je          004C8862
 004C8852    mov         eax,ebx
 004C8854    call        TControl.GetClientWidth
 004C8859    sub         eax,dword ptr [ebp-1C]
 004C885C    sub         eax,dword ptr [ebp-8]
 004C885F    mov         dword ptr [ebp-1C],eax
 004C8862    push        14
 004C8864    mov         eax,dword ptr [ebp-0C]
 004C8867    push        eax
 004C8868    mov         eax,dword ptr [ebp-8]
 004C886B    push        eax
 004C886C    mov         eax,dword ptr [ebp-14]
 004C886F    cdq
 004C8870    idiv        eax,dword ptr [ebp-4]
 004C8873    imul        edx,dword ptr [ebp-0C]
 004C8877    add         edx,dword ptr [ebp-10]
 004C887A    push        edx
 004C887B    mov         eax,dword ptr [ebp-1C]
 004C887E    push        eax
 004C887F    push        0
 004C8881    mov         eax,edi
 004C8883    call        TWinControl.GetHandle
 004C8888    push        eax
 004C8889    mov         eax,dword ptr [ebp-18]
 004C888C    push        eax
 004C888D    call        user32.DeferWindowPos
 004C8892    mov         dword ptr [ebp-18],eax
 004C8895    mov         dl,1
 004C8897    mov         eax,edi
 004C8899    call        TControl.SetVisible
 004C889E    inc         dword ptr [ebp-14]
 004C88A1    dec         dword ptr [ebp-20]
>004C88A4    jne         004C8815
 004C88AA    xor         eax,eax
 004C88AC    pop         edx
 004C88AD    pop         ecx
 004C88AE    pop         ecx
 004C88AF    mov         dword ptr fs:[eax],edx
 004C88B2    push        4C88C8
 004C88B7    mov         eax,dword ptr [ebp-18]
 004C88BA    push        eax
 004C88BB    call        user32.EndDeferWindowPos
 004C88C0    ret
>004C88C1    jmp         @HandleFinally
>004C88C6    jmp         004C88B7
 004C88C8    pop         edi
 004C88C9    pop         esi
 004C88CA    pop         ebx
 004C88CB    mov         esp,ebp
 004C88CD    pop         ebp
 004C88CE    ret
*}
end;

//004C88D0
procedure TCustomRadioGroup.ButtonClick(Sender:TObject);
begin
{*
 004C88D0    push        ebx
 004C88D1    push        esi
 004C88D2    mov         esi,edx
 004C88D4    mov         ebx,eax
 004C88D6    cmp         byte ptr [ebx+289],0
>004C88DD    jne         004C8904
 004C88DF    mov         edx,esi
 004C88E1    mov         eax,dword ptr [ebx+278]
 004C88E7    call        TList.IndexOf
 004C88EC    mov         dword ptr [ebx+280],eax
 004C88F2    mov         eax,ebx
 004C88F4    call        TControl.Changed
 004C88F9    mov         eax,ebx
 004C88FB    mov         si,0FFEC
 004C88FF    call        @CallDynaInst
 004C8904    pop         esi
 004C8905    pop         ebx
 004C8906    ret
*}
end;

//004C8908
procedure TCustomRadioGroup.ItemsChange(Sender:TObject);
begin
{*
 004C8908    push        ebx
 004C8909    mov         ebx,eax
 004C890B    cmp         byte ptr [ebx+288],0
>004C8912    jne         004C8940
 004C8914    mov         eax,dword ptr [ebx+27C]
 004C891A    mov         edx,dword ptr [eax]
 004C891C    call        dword ptr [edx+14]
 004C891F    cmp         eax,dword ptr [ebx+280]
>004C8925    jg          004C8939
 004C8927    mov         eax,dword ptr [ebx+27C]
 004C892D    mov         edx,dword ptr [eax]
 004C892F    call        dword ptr [edx+14]
 004C8932    dec         eax
 004C8933    mov         dword ptr [ebx+280],eax
 004C8939    mov         eax,ebx
 004C893B    call        TCustomRadioGroup.UpdateButtons
 004C8940    pop         ebx
 004C8941    ret
*}
end;

//004C8944
procedure TCustomRadioGroup.Loaded;
begin
{*
 004C8944    push        ebx
 004C8945    mov         ebx,eax
 004C8947    mov         eax,ebx
 004C8949    call        TControl.Loaded
 004C894E    mov         eax,ebx
 004C8950    call        TCustomRadioGroup.ArrangeButtons
 004C8955    pop         ebx
 004C8956    ret
*}
end;

//004C8958
procedure TCustomRadioGroup.ReadState(Reader:TReader);
begin
{*
 004C8958    push        ebx
 004C8959    mov         ebx,eax
 004C895B    mov         byte ptr [ebx+288],1
 004C8962    mov         eax,ebx
 004C8964    call        TWinControl.ReadState
 004C8969    mov         byte ptr [ebx+288],0
 004C8970    mov         eax,ebx
 004C8972    call        TWinControl.HandleAllocated
 004C8977    test        al,al
>004C8979    je          004C8982
 004C897B    mov         eax,ebx
 004C897D    call        TCustomRadioGroup.UpdateButtons
 004C8982    pop         ebx
 004C8983    ret
*}
end;

//004C8984
procedure TCustomRadioGroup.CreateWnd;
begin
{*
 004C8984    push        ebx
 004C8985    mov         ebx,eax
 004C8987    mov         eax,ebx
 004C8989    call        TWinControl.CreateWnd
 004C898E    mov         eax,ebx
 004C8990    call        TCustomRadioGroup.UpdateButtons
 004C8995    pop         ebx
 004C8996    ret
*}
end;

//004C8998
procedure TCustomRadioGroup.SetButtonCount(Value:Integer);
begin
{*
 004C8998    push        ebx
 004C8999    push        esi
 004C899A    push        edi
 004C899B    mov         esi,edx
 004C899D    mov         ebx,eax
>004C899F    jmp         004C89AF
 004C89A1    mov         ecx,ebx
 004C89A3    mov         dl,1
 004C89A5    mov         eax,[004C8250];TGroupButton
 004C89AA    call        TGroupButton.InternalCreate
 004C89AF    mov         eax,dword ptr [ebx+278]
 004C89B5    cmp         esi,dword ptr [eax+8]
>004C89B8    jg          004C89A1
>004C89BA    jmp         004C89C8
 004C89BC    mov         eax,edi
 004C89BE    call        TList.Last
 004C89C3    call        TObject.Free
 004C89C8    mov         edi,dword ptr [ebx+278]
 004C89CE    cmp         esi,dword ptr [edi+8]
>004C89D1    jl          004C89BC
 004C89D3    pop         edi
 004C89D4    pop         esi
 004C89D5    pop         ebx
 004C89D6    ret
*}
end;

//004C89D8
procedure TCustomRadioGroup.SetColumns(Value:Integer);
begin
{*
 004C89D8    push        esi
 004C89D9    mov         esi,eax
 004C89DB    cmp         edx,1
>004C89DE    jge         004C89E5
 004C89E0    mov         edx,1
 004C89E5    cmp         edx,10
>004C89E8    jle         004C89EF
 004C89EA    mov         edx,10
 004C89EF    cmp         edx,dword ptr [esi+284]
>004C89F5    je          004C8A0E
 004C89F7    mov         dword ptr [esi+284],edx
 004C89FD    mov         eax,esi
 004C89FF    call        TCustomRadioGroup.ArrangeButtons
 004C8A04    mov         eax,esi
 004C8A06    mov         edx,dword ptr [eax]
 004C8A08    call        dword ptr [edx+90]
 004C8A0E    pop         esi
 004C8A0F    ret
*}
end;

//004C8A10
procedure TCustomRadioGroup.SetItemIndex(Value:Integer);
begin
{*
 004C8A10    push        ebx
 004C8A11    push        esi
 004C8A12    push        edi
 004C8A13    push        ebp
 004C8A14    mov         esi,edx
 004C8A16    mov         ebx,eax
 004C8A18    cmp         byte ptr [ebx+288],0
>004C8A1F    je          004C8A29
 004C8A21    mov         dword ptr [ebx+280],esi
>004C8A27    jmp         004C8A8C
 004C8A29    mov         eax,ebx
 004C8A2B    call        TWinControl.HandleNeeded
 004C8A30    cmp         esi,0FFFFFFFF
>004C8A33    jge         004C8A38
 004C8A35    or          esi,0FFFFFFFF
 004C8A38    mov         ebp,dword ptr [ebx+278]
 004C8A3E    mov         eax,dword ptr [ebp+8]
 004C8A41    cmp         esi,eax
>004C8A43    jl          004C8A48
 004C8A45    mov         esi,eax
 004C8A47    dec         esi
 004C8A48    mov         edi,dword ptr [ebx+280]
 004C8A4E    cmp         esi,edi
>004C8A50    je          004C8A8C
 004C8A52    test        edi,edi
>004C8A54    jl          004C8A69
 004C8A56    mov         edx,edi
 004C8A58    mov         eax,ebp
 004C8A5A    call        TList.Get
 004C8A5F    xor         edx,edx
 004C8A61    mov         ecx,dword ptr [eax]
 004C8A63    call        dword ptr [ecx+0F0]
 004C8A69    mov         edi,esi
 004C8A6B    mov         dword ptr [ebx+280],edi
 004C8A71    test        edi,edi
>004C8A73    jl          004C8A8C
 004C8A75    mov         edx,edi
 004C8A77    mov         eax,dword ptr [ebx+278]
 004C8A7D    call        TList.Get
 004C8A82    mov         dl,1
 004C8A84    mov         ecx,dword ptr [eax]
 004C8A86    call        dword ptr [ecx+0F0]
 004C8A8C    pop         ebp
 004C8A8D    pop         edi
 004C8A8E    pop         esi
 004C8A8F    pop         ebx
 004C8A90    ret
*}
end;

//004C8A94
procedure TCustomRadioGroup.SetItems(Value:TStrings);
begin
{*
 004C8A94    push        esi
 004C8A95    push        edi
 004C8A96    mov         edi,edx
 004C8A98    mov         esi,eax
 004C8A9A    mov         edx,edi
 004C8A9C    mov         eax,dword ptr [esi+27C]
 004C8AA2    mov         ecx,dword ptr [eax]
 004C8AA4    call        dword ptr [ecx+8]
 004C8AA7    pop         edi
 004C8AA8    pop         esi
 004C8AA9    ret
*}
end;

//004C8AAC
procedure TCustomRadioGroup.SetWordWrap(Value:Boolean);
begin
{*
 004C8AAC    cmp         dl,byte ptr [eax+28A]
>004C8AB2    je          004C8ABF
 004C8AB4    mov         byte ptr [eax+28A],dl
 004C8ABA    call        TCustomRadioGroup.UpdateButtons
 004C8ABF    ret
*}
end;

//004C8AC0
procedure TCustomRadioGroup.UpdateButtons;
begin
{*
 004C8AC0    push        ebp
 004C8AC1    mov         ebp,esp
 004C8AC3    add         esp,0FFFFFFF8
 004C8AC6    push        ebx
 004C8AC7    push        esi
 004C8AC8    push        edi
 004C8AC9    xor         edx,edx
 004C8ACB    mov         dword ptr [ebp-8],edx
 004C8ACE    mov         ebx,eax
 004C8AD0    xor         eax,eax
 004C8AD2    push        ebp
 004C8AD3    push        4C8BA5
 004C8AD8    push        dword ptr fs:[eax]
 004C8ADB    mov         dword ptr fs:[eax],esp
 004C8ADE    mov         eax,dword ptr [ebx+27C]
 004C8AE4    mov         edx,dword ptr [eax]
 004C8AE6    call        dword ptr [edx+14]
 004C8AE9    mov         edx,eax
 004C8AEB    mov         eax,ebx
 004C8AED    call        TCustomRadioGroup.SetButtonCount
 004C8AF2    mov         eax,dword ptr [ebx+278]
 004C8AF8    mov         eax,dword ptr [eax+8]
 004C8AFB    dec         eax
 004C8AFC    test        eax,eax
>004C8AFE    jl          004C8B4C
 004C8B00    inc         eax
 004C8B01    mov         dword ptr [ebp-4],eax
 004C8B04    xor         esi,esi
 004C8B06    lea         ecx,[ebp-8]
 004C8B09    mov         edx,esi
 004C8B0B    mov         eax,dword ptr [ebx+27C]
 004C8B11    mov         edi,dword ptr [eax]
 004C8B13    call        dword ptr [edi+0C]
 004C8B16    mov         eax,dword ptr [ebp-8]
 004C8B19    push        eax
 004C8B1A    mov         edx,esi
 004C8B1C    mov         eax,dword ptr [ebx+278]
 004C8B22    call        TList.Get
 004C8B27    pop         edx
 004C8B28    call        TControl.SetText
 004C8B2D    mov         edx,esi
 004C8B2F    mov         eax,dword ptr [ebx+278]
 004C8B35    call        TList.Get
 004C8B3A    movzx       edx,byte ptr [ebx+28A]
 004C8B41    call        TButtonControl.SetWordWrap
 004C8B46    inc         esi
 004C8B47    dec         dword ptr [ebp-4]
>004C8B4A    jne         004C8B06
 004C8B4C    cmp         dword ptr [ebx+280],0
>004C8B53    jl          004C8B7E
 004C8B55    mov         byte ptr [ebx+289],1
 004C8B5C    mov         edx,dword ptr [ebx+280]
 004C8B62    mov         eax,dword ptr [ebx+278]
 004C8B68    call        TList.Get
 004C8B6D    mov         dl,1
 004C8B6F    mov         ecx,dword ptr [eax]
 004C8B71    call        dword ptr [ecx+0F0]
 004C8B77    mov         byte ptr [ebx+289],0
 004C8B7E    mov         eax,ebx
 004C8B80    call        TCustomRadioGroup.ArrangeButtons
 004C8B85    mov         eax,ebx
 004C8B87    mov         edx,dword ptr [eax]
 004C8B89    call        dword ptr [edx+90]
 004C8B8F    xor         eax,eax
 004C8B91    pop         edx
 004C8B92    pop         ecx
 004C8B93    pop         ecx
 004C8B94    mov         dword ptr fs:[eax],edx
 004C8B97    push        4C8BAC
 004C8B9C    lea         eax,[ebp-8]
 004C8B9F    call        @UStrClr
 004C8BA4    ret
>004C8BA5    jmp         @HandleFinally
>004C8BAA    jmp         004C8B9C
 004C8BAC    pop         edi
 004C8BAD    pop         esi
 004C8BAE    pop         ebx
 004C8BAF    pop         ecx
 004C8BB0    pop         ecx
 004C8BB1    pop         ebp
 004C8BB2    ret
*}
end;

//004C8BB4
procedure TCustomRadioGroup.CMEnabledChanged(var Message:TMessage);
begin
{*
 004C8BB4    push        ebx
 004C8BB5    push        esi
 004C8BB6    push        edi
 004C8BB7    mov         ebx,eax
 004C8BB9    mov         eax,ebx
 004C8BBB    call        TWinControl.CMEnabledChanged
 004C8BC0    mov         eax,dword ptr [ebx+278]
 004C8BC6    mov         esi,dword ptr [eax+8]
 004C8BC9    dec         esi
 004C8BCA    test        esi,esi
>004C8BCC    jl          004C8BF0
 004C8BCE    inc         esi
 004C8BCF    xor         edi,edi
 004C8BD1    mov         eax,ebx
 004C8BD3    mov         edx,dword ptr [eax]
 004C8BD5    call        dword ptr [edx+5C]
 004C8BD8    push        eax
 004C8BD9    mov         edx,edi
 004C8BDB    mov         eax,dword ptr [ebx+278]
 004C8BE1    call        TList.Get
 004C8BE6    pop         edx
 004C8BE7    mov         ecx,dword ptr [eax]
 004C8BE9    call        dword ptr [ecx+74]
 004C8BEC    inc         edi
 004C8BED    dec         esi
>004C8BEE    jne         004C8BD1
 004C8BF0    pop         edi
 004C8BF1    pop         esi
 004C8BF2    pop         ebx
 004C8BF3    ret
*}
end;

//004C8BF4
procedure TCustomRadioGroup.CMFontChanged(var Message:TMessage);
begin
{*
 004C8BF4    push        ebx
 004C8BF5    mov         ebx,eax
 004C8BF7    mov         eax,ebx
 004C8BF9    call        TWinControl.CMFontChanged
 004C8BFE    mov         eax,ebx
 004C8C00    call        TCustomRadioGroup.ArrangeButtons
 004C8C05    pop         ebx
 004C8C06    ret
*}
end;

//004C8C08
procedure TCustomRadioGroup.WMSize(var Message:TWMSize);
begin
{*
 004C8C08    push        ebx
 004C8C09    mov         ebx,eax
 004C8C0B    mov         eax,ebx
 004C8C0D    call        TCustomCheckBox.WMSize
 004C8C12    mov         eax,ebx
 004C8C14    call        TCustomRadioGroup.ArrangeButtons
 004C8C19    pop         ebx
 004C8C1A    ret
*}
end;

//004C8C1C
{*function sub_004C8C1C:?;
begin
 004C8C1C    mov         al,1
 004C8C1E    ret
end;*}

//004C8C20
procedure TCustomRadioGroup.GetChildren(Root:TComponent; Proc:TGetChildProc);
begin
{*
 004C8C20    push        ebp
 004C8C21    mov         ebp,esp
 004C8C23    pop         ebp
 004C8C24    ret         8
*}
end;

//004C8C28
constructor TSplitter.Create;
begin
{*
 004C8C28    push        ebx
 004C8C29    push        esi
 004C8C2A    test        dl,dl
>004C8C2C    je          004C8C36
 004C8C2E    add         esp,0FFFFFFF0
 004C8C31    call        @ClassCreate
 004C8C36    mov         ebx,edx
 004C8C38    mov         esi,eax
 004C8C3A    xor         edx,edx
 004C8C3C    mov         eax,esi
 004C8C3E    call        TGraphicControl.Create
 004C8C43    mov         eax,[004C8CB8]
 004C8C48    not         eax
 004C8C4A    and         eax,dword ptr [esi+50]
 004C8C4D    mov         dword ptr [esi+50],eax
 004C8C50    mov         byte ptr [esi+1B4],1
 004C8C57    mov         edx,64
 004C8C5C    mov         eax,esi
 004C8C5E    call        TControl.SetHeight
 004C8C63    mov         dl,3
 004C8C65    mov         eax,esi
 004C8C67    call        TControl.SetAlign
 004C8C6C    mov         edx,3
 004C8C71    mov         eax,esi
 004C8C73    call        TControl.SetWidth
 004C8C78    mov         dx,0FFF2
 004C8C7C    mov         eax,esi
 004C8C7E    call        TControl.SetCursor
 004C8C83    mov         dword ptr [esi+1D0],1E
 004C8C8D    mov         byte ptr [esi+1F0],3
 004C8C94    mov         dword ptr [esi+1E8],0FFFFFFFF
 004C8C9E    mov         eax,esi
 004C8CA0    test        bl,bl
>004C8CA2    je          004C8CB3
 004C8CA4    call        @AfterConstruction
 004C8CA9    pop         dword ptr fs:[0]
 004C8CB0    add         esp,0C
 004C8CB3    mov         eax,esi
 004C8CB5    pop         esi
 004C8CB6    pop         ebx
 004C8CB7    ret
*}
end;

//004C8CBC
destructor TSplitter.Destroy();
begin
{*
 004C8CBC    push        ebx
 004C8CBD    push        esi
 004C8CBE    call        @BeforeDestruction
 004C8CC3    mov         ebx,edx
 004C8CC5    mov         esi,eax
 004C8CC7    mov         eax,dword ptr [esi+1B8]
 004C8CCD    call        TObject.Free
 004C8CD2    mov         edx,ebx
 004C8CD4    and         dl,0FC
 004C8CD7    mov         eax,esi
 004C8CD9    call        TGraphicControl.Destroy
 004C8CDE    test        bl,bl
>004C8CE0    jle         004C8CE9
 004C8CE2    mov         eax,esi
 004C8CE4    call        @ClassDestroy
 004C8CE9    pop         esi
 004C8CEA    pop         ebx
 004C8CEB    ret
*}
end;

//004C8CEC
procedure TSplitter.AllocateLineDC;
begin
{*
 004C8CEC    push        ebx
 004C8CED    push        esi
 004C8CEE    mov         ebx,eax
 004C8CF0    push        412
 004C8CF5    push        0
 004C8CF7    mov         eax,dword ptr [ebx+34]
 004C8CFA    call        TWinControl.GetHandle
 004C8CFF    push        eax
 004C8D00    call        user32.GetDCEx
 004C8D05    mov         dword ptr [ebx+1C8],eax
 004C8D0B    cmp         byte ptr [ebx+1F0],3
>004C8D12    jne         004C8D64
 004C8D14    cmp         dword ptr [ebx+1B8],0
>004C8D1B    jne         004C8D46
 004C8D1D    mov         dl,1
 004C8D1F    mov         eax,[00460070];TBrush
 004C8D24    call        TBrush.Create
 004C8D29    mov         esi,eax
 004C8D2B    mov         dword ptr [ebx+1B8],esi
 004C8D31    mov         edx,0FFFFFF
 004C8D36    xor         eax,eax
 004C8D38    call        AllocPatternBitmap
 004C8D3D    mov         edx,eax
 004C8D3F    mov         eax,esi
 004C8D41    call        TBrush.SetBitmap
 004C8D46    mov         eax,dword ptr [ebx+1B8]
 004C8D4C    call        TBrush.GetHandle
 004C8D51    push        eax
 004C8D52    mov         eax,dword ptr [ebx+1C8]
 004C8D58    push        eax
 004C8D59    call        gdi32.SelectObject
 004C8D5E    mov         dword ptr [ebx+1EC],eax
 004C8D64    pop         esi
 004C8D65    pop         ebx
 004C8D66    ret
*}
end;

//004C8D68
procedure TSplitter.DrawLine;
begin
{*
 004C8D68    push        esi
 004C8D69    add         esp,0FFFFFFF0
 004C8D6C    movzx       edx,byte ptr [eax+1CC]
 004C8D73    xor         dl,1
 004C8D76    mov         byte ptr [eax+1CC],dl
 004C8D7C    mov         edx,dword ptr [eax+40]
 004C8D7F    mov         dword ptr [esp+8],edx
 004C8D83    mov         esi,dword ptr [eax+44]
 004C8D86    mov         dword ptr [esp+0C],esi
 004C8D8A    mov         ecx,dword ptr [esp+8]
 004C8D8E    mov         dword ptr [esp],ecx
 004C8D91    mov         ecx,dword ptr [esp+0C]
 004C8D95    mov         dword ptr [esp+4],ecx
 004C8D99    movzx       ecx,byte ptr [eax+5D]
 004C8D9D    add         cl,0FD
 004C8DA0    sub         cl,2
>004C8DA3    jae         004C8DB0
 004C8DA5    add         edx,dword ptr [eax+1F4]
 004C8DAB    mov         dword ptr [esp],edx
>004C8DAE    jmp         004C8DBA
 004C8DB0    add         esi,dword ptr [eax+1F4]
 004C8DB6    mov         dword ptr [esp+4],esi
 004C8DBA    push        5A0049
 004C8DBF    mov         edx,dword ptr [eax+4C]
 004C8DC2    push        edx
 004C8DC3    mov         edx,dword ptr [eax+48]
 004C8DC6    push        edx
 004C8DC7    mov         edx,dword ptr [esp+10]
 004C8DCB    push        edx
 004C8DCC    mov         edx,dword ptr [esp+10]
 004C8DD0    push        edx
 004C8DD1    mov         eax,dword ptr [eax+1C8]
 004C8DD7    push        eax
 004C8DD8    call        gdi32.PatBlt
 004C8DDD    add         esp,10
 004C8DE0    pop         esi
 004C8DE1    ret
*}
end;

//004C8DE4
procedure TSplitter.ReleaseLineDC;
begin
{*
 004C8DE4    push        ebx
 004C8DE5    mov         ebx,eax
 004C8DE7    mov         eax,dword ptr [ebx+1EC]
 004C8DED    test        eax,eax
>004C8DEF    je          004C8DFE
 004C8DF1    push        eax
 004C8DF2    mov         eax,dword ptr [ebx+1C8]
 004C8DF8    push        eax
 004C8DF9    call        gdi32.SelectObject
 004C8DFE    mov         eax,dword ptr [ebx+1C8]
 004C8E04    push        eax
 004C8E05    mov         eax,dword ptr [ebx+34]
 004C8E08    call        TWinControl.GetHandle
 004C8E0D    push        eax
 004C8E0E    call        user32.ReleaseDC
 004C8E13    mov         eax,dword ptr [ebx+1B8]
 004C8E19    test        eax,eax
>004C8E1B    je          004C8E2A
 004C8E1D    call        TObject.Free
 004C8E22    xor         eax,eax
 004C8E24    mov         dword ptr [ebx+1B8],eax
 004C8E2A    pop         ebx
 004C8E2B    ret
*}
end;

//004C8E2C
function TSplitter.FindControl:TControl;
begin
{*
 004C8E2C    push        ebx
 004C8E2D    push        esi
 004C8E2E    push        edi
 004C8E2F    push        ebp
 004C8E30    add         esp,0FFFFFFE0
 004C8E33    mov         esi,eax
 004C8E35    xor         ebx,ebx
 004C8E37    mov         eax,dword ptr [esi+40]
 004C8E3A    mov         dword ptr [esp+8],eax
 004C8E3E    mov         eax,dword ptr [esi+44]
 004C8E41    mov         dword ptr [esp+0C],eax
 004C8E45    mov         eax,dword ptr [esp+8]
 004C8E49    mov         dword ptr [esp],eax
 004C8E4C    mov         eax,dword ptr [esp+0C]
 004C8E50    mov         dword ptr [esp+4],eax
 004C8E54    movzx       eax,byte ptr [esi+5D]
 004C8E58    dec         al
>004C8E5A    je          004C8EAB
 004C8E5C    dec         al
>004C8E5E    je          004C8EC9
 004C8E60    dec         al
>004C8E62    je          004C8E6D
 004C8E64    dec         al
>004C8E66    je          004C8E89
>004C8E68    jmp         004C8FB4
 004C8E6D    mov         eax,esi
 004C8E6F    call        TControl.GetAlignWithMargins
 004C8E74    test        al,al
>004C8E76    jne         004C8E7D
 004C8E78    dec         dword ptr [esp]
>004C8E7B    jmp         004C8EEB
 004C8E7D    mov         eax,dword ptr [esi+74]
 004C8E80    mov         eax,dword ptr [eax+8]
 004C8E83    inc         eax
 004C8E84    sub         dword ptr [esp],eax
>004C8E87    jmp         004C8EEB
 004C8E89    mov         eax,esi
 004C8E8B    call        TControl.GetAlignWithMargins
 004C8E90    test        al,al
>004C8E92    jne         004C8E9C
 004C8E94    mov         eax,dword ptr [esi+48]
 004C8E97    add         dword ptr [esp],eax
>004C8E9A    jmp         004C8EEB
 004C8E9C    mov         eax,dword ptr [esi+74]
 004C8E9F    mov         eax,dword ptr [eax+10]
 004C8EA2    add         eax,dword ptr [esi+48]
 004C8EA5    inc         eax
 004C8EA6    add         dword ptr [esp],eax
>004C8EA9    jmp         004C8EEB
 004C8EAB    mov         eax,esi
 004C8EAD    call        TControl.GetAlignWithMargins
 004C8EB2    test        al,al
>004C8EB4    jne         004C8EBC
 004C8EB6    dec         dword ptr [esp+4]
>004C8EBA    jmp         004C8EEB
 004C8EBC    mov         eax,dword ptr [esi+74]
 004C8EBF    mov         eax,dword ptr [eax+0C]
 004C8EC2    inc         eax
 004C8EC3    sub         dword ptr [esp+4],eax
>004C8EC7    jmp         004C8EEB
 004C8EC9    mov         eax,esi
 004C8ECB    call        TControl.GetAlignWithMargins
 004C8ED0    test        al,al
>004C8ED2    jne         004C8EDD
 004C8ED4    mov         eax,dword ptr [esi+4C]
 004C8ED7    add         dword ptr [esp+4],eax
>004C8EDB    jmp         004C8EEB
 004C8EDD    mov         eax,dword ptr [esi+74]
 004C8EE0    mov         eax,dword ptr [eax+14]
 004C8EE3    add         eax,dword ptr [esi+4C]
 004C8EE6    inc         eax
 004C8EE7    add         dword ptr [esp+4],eax
 004C8EEB    mov         eax,dword ptr [esi+34]
 004C8EEE    call        TWinControl.GetControlCount
 004C8EF3    mov         edi,eax
 004C8EF5    dec         edi
 004C8EF6    test        edi,edi
>004C8EF8    jl          004C8FB2
 004C8EFE    inc         edi
 004C8EFF    xor         ebp,ebp
 004C8F01    mov         edx,ebp
 004C8F03    mov         eax,dword ptr [esi+34]
 004C8F06    call        TWinControl.GetControl
 004C8F0B    mov         ebx,eax
 004C8F0D    cmp         byte ptr [ebx+59],0
>004C8F11    je          004C8FAA
 004C8F17    mov         eax,ebx
 004C8F19    mov         edx,dword ptr [eax]
 004C8F1B    call        dword ptr [edx+5C]
 004C8F1E    test        al,al
>004C8F20    je          004C8FAA
 004C8F26    lea         edx,[esp+10]
 004C8F2A    mov         eax,ebx
 004C8F2C    call        TControl.GetBoundsRect
 004C8F31    mov         eax,ebx
 004C8F33    call        TControl.GetAlignWithMargins
 004C8F38    test        al,al
>004C8F3A    je          004C8F5B
 004C8F3C    mov         eax,dword ptr [ebx+74]
 004C8F3F    mov         edx,dword ptr [eax+10]
 004C8F42    add         dword ptr [esp+18],edx
 004C8F46    mov         edx,dword ptr [eax+8]
 004C8F49    sub         dword ptr [esp+10],edx
 004C8F4D    mov         edx,dword ptr [eax+14]
 004C8F50    add         dword ptr [esp+1C],edx
 004C8F54    mov         eax,dword ptr [eax+0C]
 004C8F57    sub         dword ptr [esp+14],eax
 004C8F5B    mov         eax,dword ptr [esp+18]
 004C8F5F    sub         eax,dword ptr [esp+10]
>004C8F63    jne         004C8F7B
 004C8F65    movzx       eax,byte ptr [esi+5D]
 004C8F69    sub         al,1
>004C8F6B    je          004C8F71
 004C8F6D    sub         al,2
>004C8F6F    jne         004C8F77
 004C8F71    dec         dword ptr [esp+10]
>004C8F75    jmp         004C8F7B
 004C8F77    inc         dword ptr [esp+18]
 004C8F7B    mov         eax,dword ptr [esp+1C]
 004C8F7F    sub         eax,dword ptr [esp+14]
>004C8F83    jne         004C8F9B
 004C8F85    movzx       eax,byte ptr [esi+5D]
 004C8F89    sub         al,1
>004C8F8B    je          004C8F91
 004C8F8D    sub         al,2
>004C8F8F    jne         004C8F97
 004C8F91    dec         dword ptr [esp+14]
>004C8F95    jmp         004C8F9B
 004C8F97    inc         dword ptr [esp+1C]
 004C8F9B    mov         edx,esp
 004C8F9D    lea         eax,[esp+10]
 004C8FA1    call        PtInRect
 004C8FA6    test        al,al
>004C8FA8    jne         004C8FB4
 004C8FAA    inc         ebp
 004C8FAB    dec         edi
>004C8FAC    jne         004C8F01
 004C8FB2    xor         ebx,ebx
 004C8FB4    mov         eax,ebx
 004C8FB6    add         esp,20
 004C8FB9    pop         ebp
 004C8FBA    pop         edi
 004C8FBB    pop         esi
 004C8FBC    pop         ebx
 004C8FBD    ret
*}
end;

//004C8FC0
procedure TSplitter.RequestAlign;
begin
{*
 004C8FC0    push        ebx
 004C8FC1    mov         ebx,eax
 004C8FC3    mov         eax,ebx
 004C8FC5    call        TControl.RequestAlign
 004C8FCA    movzx       eax,word ptr [ebx+78]
 004C8FCE    cmp         ax,0FFFFFFF1
>004C8FD2    je          004C8FDA
 004C8FD4    cmp         ax,0FFFFFFF2
>004C8FD8    jne         004C8FFB
 004C8FDA    movzx       eax,byte ptr [ebx+5D]
 004C8FDE    dec         eax
 004C8FDF    sub         al,2
>004C8FE1    jae         004C8FF0
 004C8FE3    mov         dx,0FFF1
 004C8FE7    mov         eax,ebx
 004C8FE9    call        TControl.SetCursor
>004C8FEE    jmp         004C8FFB
 004C8FF0    mov         dx,0FFF2
 004C8FF4    mov         eax,ebx
 004C8FF6    call        TControl.SetCursor
 004C8FFB    pop         ebx
 004C8FFC    ret
*}
end;

//004C9000
procedure TSplitter.Paint;
begin
{*
 004C9000    push        ebx
 004C9001    push        esi
 004C9002    add         esp,0FFFFFFE0
 004C9005    mov         esi,eax
 004C9007    mov         edx,esp
 004C9009    mov         eax,esi
 004C900B    mov         ecx,dword ptr [eax]
 004C900D    call        dword ptr [ecx+54]
 004C9010    mov         eax,dword ptr [esi+1A8]
 004C9016    mov         eax,dword ptr [eax+48]
 004C9019    mov         edx,dword ptr [esi+6C]
 004C901C    call        TBrush.SetColor
 004C9021    lea         edx,[esp+10]
 004C9025    mov         eax,esi
 004C9027    mov         ecx,dword ptr [eax]
 004C9029    call        dword ptr [ecx+54]
 004C902C    lea         edx,[esp+10]
 004C9030    mov         eax,dword ptr [esi+1A8]
 004C9036    mov         ecx,dword ptr [eax]
 004C9038    call        dword ptr [ecx+54]
 004C903B    cmp         byte ptr [esi+1B5],0
>004C9042    je          004C90F0
 004C9048    movzx       eax,byte ptr [esi+5D]
 004C904C    add         al,0FD
 004C904E    sub         al,2
>004C9050    jae         004C9062
 004C9052    push        2
 004C9054    push        0FF
 004C9056    lea         eax,[esp+8]
 004C905A    push        eax
 004C905B    call        user32.InflateRect
>004C9060    jmp         004C9070
 004C9062    push        0FF
 004C9064    push        2
 004C9066    lea         eax,[esp+8]
 004C906A    push        eax
 004C906B    call        user32.InflateRect
 004C9070    mov         eax,esp
 004C9072    mov         ecx,1
 004C9077    mov         edx,1
 004C907C    call        OffsetRect
 004C9081    mov         eax,0FF000014
 004C9086    call        ColorToRGB
 004C908B    push        eax
 004C908C    call        gdi32.CreateSolidBrush
 004C9091    mov         ebx,eax
 004C9093    push        ebx
 004C9094    lea         eax,[esp+4]
 004C9098    push        eax
 004C9099    mov         eax,dword ptr [esi+1A8]
 004C909F    call        TCanvas.GetHandle
 004C90A4    push        eax
 004C90A5    call        user32.FrameRect
 004C90AA    push        ebx
 004C90AB    call        gdi32.DeleteObject
 004C90B0    mov         eax,esp
 004C90B2    mov         ecx,0FFFFFFFE
 004C90B7    mov         edx,0FFFFFFFE
 004C90BC    call        OffsetRect
 004C90C1    mov         eax,0FF000010
 004C90C6    call        ColorToRGB
 004C90CB    push        eax
 004C90CC    call        gdi32.CreateSolidBrush
 004C90D1    mov         ebx,eax
 004C90D3    push        ebx
 004C90D4    lea         eax,[esp+4]
 004C90D8    push        eax
 004C90D9    mov         eax,dword ptr [esi+1A8]
 004C90DF    call        TCanvas.GetHandle
 004C90E4    push        eax
 004C90E5    call        user32.FrameRect
 004C90EA    push        ebx
 004C90EB    call        gdi32.DeleteObject
 004C90F0    test        byte ptr [esi+1C],10
>004C90F4    je          004C9142
 004C90F6    mov         ebx,dword ptr [esi+1A8]
 004C90FC    mov         eax,dword ptr [ebx+44]
 004C90FF    mov         dl,2
 004C9101    call        TPen.SetStyle
 004C9106    mov         eax,dword ptr [ebx+44]
 004C9109    mov         dl,0E
 004C910B    call        TPen.SetMode
 004C9110    mov         eax,dword ptr [ebx+44]
 004C9113    mov         edx,0FFD8CE
 004C9118    call        TPen.SetColor
 004C911D    mov         eax,dword ptr [ebx+48]
 004C9120    mov         dl,1
 004C9122    call        TBrush.SetStyle
 004C9127    mov         eax,esi
 004C9129    call        TControl.GetClientWidth
 004C912E    push        eax
 004C912F    mov         eax,esi
 004C9131    call        TControl.GetClientHeight
 004C9136    push        eax
 004C9137    xor         ecx,ecx
 004C9139    xor         edx,edx
 004C913B    mov         eax,ebx
 004C913D    mov         ebx,dword ptr [eax]
 004C913F    call        dword ptr [ebx+7C]
 004C9142    cmp         word ptr [esi+20A],0
>004C914A    je          004C915A
 004C914C    mov         edx,esi
 004C914E    mov         eax,dword ptr [esi+20C]
 004C9154    call        dword ptr [esi+208]
 004C915A    add         esp,20
 004C915D    pop         esi
 004C915E    pop         ebx
 004C915F    ret
*}
end;

//004C9160
function TSplitter.DoCanResize(var NewSize:Integer):Boolean;
begin
{*
 004C9160    push        ebx
 004C9161    push        esi
 004C9162    mov         esi,edx
 004C9164    mov         ebx,eax
 004C9166    mov         edx,esi
 004C9168    mov         eax,ebx
 004C916A    mov         ecx,dword ptr [eax]
 004C916C    call        dword ptr [ecx+0A4]
 004C9172    test        al,al
>004C9174    je          004C918D
 004C9176    mov         edx,dword ptr [esi]
 004C9178    cmp         edx,dword ptr [ebx+1D0]
>004C917E    jg          004C918D
 004C9180    cmp         byte ptr [ebx+1B4],0
>004C9187    je          004C918D
 004C9189    xor         edx,edx
 004C918B    mov         dword ptr [esi],edx
 004C918D    pop         esi
 004C918E    pop         ebx
 004C918F    ret
*}
end;

//004C9190
function TSplitter.CanResize(var NewSize:Integer):Boolean;
begin
{*
 004C9190    push        ebx
 004C9191    push        ecx
 004C9192    mov         byte ptr [esp],1
 004C9196    cmp         word ptr [eax+1FA],0
>004C919E    je          004C91B3
 004C91A0    push        esp
 004C91A1    mov         ecx,edx
 004C91A3    mov         ebx,eax
 004C91A5    mov         edx,eax
 004C91A7    mov         eax,dword ptr [ebx+1FC]
 004C91AD    call        dword ptr [ebx+1F8]
 004C91B3    movzx       eax,byte ptr [esp]
 004C91B7    pop         edx
 004C91B8    pop         ebx
 004C91B9    ret
*}
end;

//004C91BC
procedure TSplitter.MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 004C91BC    push        ebp
 004C91BD    mov         ebp,esp
 004C91BF    add         esp,0FFFFFFF4
 004C91C2    push        ebx
 004C91C3    push        esi
 004C91C4    push        edi
 004C91C5    mov         word ptr [ebp-3],cx
 004C91C9    mov         byte ptr [ebp-1],dl
 004C91CC    mov         ebx,eax
 004C91CE    mov         eax,dword ptr [ebp+0C]
 004C91D1    push        eax
 004C91D2    mov         eax,dword ptr [ebp+8]
 004C91D5    push        eax
 004C91D6    movzx       ecx,word ptr [ebp-3]
 004C91DA    movzx       edx,byte ptr [ebp-1]
 004C91DE    mov         eax,ebx
 004C91E0    call        TControl.MouseDown
 004C91E5    cmp         byte ptr [ebp-1],0
>004C91E9    jne         004C9362
 004C91EF    mov         eax,ebx
 004C91F1    call        TSplitter.FindControl
 004C91F6    mov         dword ptr [ebx+1BC],eax
 004C91FC    mov         eax,dword ptr [ebp+0C]
 004C91FF    mov         dword ptr [ebp-0C],eax
 004C9202    mov         eax,dword ptr [ebp+8]
 004C9205    mov         dword ptr [ebp-8],eax
 004C9208    mov         eax,dword ptr [ebp-0C]
 004C920B    mov         dword ptr [ebx+1C0],eax
 004C9211    mov         eax,dword ptr [ebp-8]
 004C9214    mov         dword ptr [ebx+1C4],eax
 004C921A    cmp         dword ptr [ebx+1BC],0
>004C9221    je          004C9362
 004C9227    movzx       eax,byte ptr [ebx+5D]
 004C922B    add         al,0FD
 004C922D    sub         al,2
>004C922F    jae         004C9291
 004C9231    mov         eax,dword ptr [ebx+34]
 004C9234    call        TControl.GetClientWidth
 004C9239    sub         eax,dword ptr [ebx+1D0]
 004C923F    mov         dword ptr [ebx+1D4],eax
 004C9245    mov         eax,dword ptr [ebx+34]
 004C9248    call        TWinControl.GetControlCount
 004C924D    mov         esi,eax
 004C924F    dec         esi
 004C9250    test        esi,esi
>004C9252    jl          004C9280
 004C9254    inc         esi
 004C9255    xor         edi,edi
 004C9257    mov         edx,edi
 004C9259    mov         eax,dword ptr [ebx+34]
 004C925C    call        TWinControl.GetControl
 004C9261    cmp         byte ptr [eax+59],0
>004C9265    je          004C927C
 004C9267    movzx       edx,byte ptr [eax+5D]
 004C926B    add         dl,0FD
 004C926E    sub         dl,2
>004C9271    jae         004C927C
 004C9273    mov         eax,dword ptr [eax+48]
 004C9276    sub         dword ptr [ebx+1D4],eax
 004C927C    inc         edi
 004C927D    dec         esi
>004C927E    jne         004C9257
 004C9280    mov         eax,dword ptr [ebx+1BC]
 004C9286    mov         eax,dword ptr [eax+48]
 004C9289    add         dword ptr [ebx+1D4],eax
>004C928F    jmp         004C92ED
 004C9291    mov         eax,dword ptr [ebx+34]
 004C9294    call        TControl.GetClientHeight
 004C9299    sub         eax,dword ptr [ebx+1D0]
 004C929F    mov         dword ptr [ebx+1D4],eax
 004C92A5    mov         eax,dword ptr [ebx+34]
 004C92A8    call        TWinControl.GetControlCount
 004C92AD    mov         esi,eax
 004C92AF    dec         esi
 004C92B0    test        esi,esi
>004C92B2    jl          004C92DE
 004C92B4    inc         esi
 004C92B5    xor         edi,edi
 004C92B7    mov         edx,edi
 004C92B9    mov         eax,dword ptr [ebx+34]
 004C92BC    call        TWinControl.GetControl
 004C92C1    cmp         byte ptr [eax+59],0
>004C92C5    je          004C92DA
 004C92C7    movzx       edx,byte ptr [eax+5D]
 004C92CB    dec         edx
 004C92CC    sub         dl,2
>004C92CF    jae         004C92DA
 004C92D1    mov         eax,dword ptr [eax+4C]
 004C92D4    sub         dword ptr [ebx+1D4],eax
 004C92DA    inc         edi
 004C92DB    dec         esi
>004C92DC    jne         004C92B7
 004C92DE    mov         eax,dword ptr [ebx+1BC]
 004C92E4    mov         eax,dword ptr [eax+4C]
 004C92E7    add         dword ptr [ebx+1D4],eax
 004C92ED    mov         ecx,dword ptr [ebp+8]
 004C92F0    mov         edx,dword ptr [ebp+0C]
 004C92F3    mov         eax,ebx
 004C92F5    call        TSplitter.UpdateSize
 004C92FA    mov         eax,ebx
 004C92FC    call        TSplitter.AllocateLineDC
 004C9301    mov         dl,1
 004C9303    mov         eax,ebx
 004C9305    call        ValidParentForm
 004C930A    mov         edx,eax
 004C930C    mov         ecx,dword ptr [edx+290]
 004C9312    test        ecx,ecx
>004C9314    je          004C934C
 004C9316    mov         eax,ecx
 004C9318    mov         dword ptr [ebx+1B0],eax
 004C931E    mov         edx,dword ptr [eax+218]
 004C9324    mov         dword ptr [ebx+1E0],edx
 004C932A    mov         edx,dword ptr [eax+21C]
 004C9330    mov         dword ptr [ebx+1E4],edx
 004C9336    mov         eax,dword ptr [ebx+1B0]
 004C933C    mov         dword ptr [eax+21C],ebx
 004C9342    mov         dword ptr [eax+218],4C96E0;TSplitter.FocusKeyDown
 004C934C    movzx       eax,byte ptr [ebx+1F0]
 004C9353    sub         al,1
>004C9355    je          004C935B
 004C9357    sub         al,2
>004C9359    jne         004C9362
 004C935B    mov         eax,ebx
 004C935D    call        TSplitter.DrawLine
 004C9362    pop         edi
 004C9363    pop         esi
 004C9364    pop         ebx
 004C9365    mov         esp,ebp
 004C9367    pop         ebp
 004C9368    ret         8
*}
end;

//004C936C
procedure TSplitter.UpdateControlSize;
begin
{*
 004C936C    push        ebp
 004C936D    mov         ebp,esp
 004C936F    push        ecx
 004C9370    push        ebx
 004C9371    mov         dword ptr [ebp-4],eax
 004C9374    mov         eax,dword ptr [ebp-4]
 004C9377    mov         eax,dword ptr [eax+1D8]
 004C937D    mov         edx,dword ptr [ebp-4]
 004C9380    cmp         eax,dword ptr [edx+1E8]
>004C9386    je          004C94EC
 004C938C    mov         edx,dword ptr [ebp-4]
 004C938F    movzx       edx,byte ptr [edx+5D]
 004C9393    dec         dl
>004C9395    je          004C93C1
 004C9397    dec         dl
>004C9399    je          004C9443
 004C939F    dec         dl
>004C93A1    je          004C93AC
 004C93A3    dec         dl
>004C93A5    je          004C93D6
>004C93A7    jmp         004C94B0
 004C93AC    mov         edx,eax
 004C93AE    mov         eax,dword ptr [ebp-4]
 004C93B1    mov         eax,dword ptr [eax+1BC]
 004C93B7    call        TControl.SetWidth
>004C93BC    jmp         004C94B0
 004C93C1    mov         edx,eax
 004C93C3    mov         eax,dword ptr [ebp-4]
 004C93C6    mov         eax,dword ptr [eax+1BC]
 004C93CC    call        TControl.SetHeight
>004C93D1    jmp         004C94B0
 004C93D6    mov         eax,dword ptr [ebp-4]
 004C93D9    mov         eax,dword ptr [eax+34]
 004C93DC    call        TWinControl.DisableAlign
 004C93E1    xor         edx,edx
 004C93E3    push        ebp
 004C93E4    push        4C943C
 004C93E9    push        dword ptr fs:[edx]
 004C93EC    mov         dword ptr fs:[edx],esp
 004C93EF    mov         eax,dword ptr [ebp-4]
 004C93F2    mov         eax,dword ptr [eax+1BC]
 004C93F8    mov         edx,dword ptr [eax+48]
 004C93FB    mov         ecx,dword ptr [ebp-4]
 004C93FE    sub         edx,dword ptr [ecx+1D8]
 004C9404    add         edx,dword ptr [eax+40]
 004C9407    call        TControl.SetLeft
 004C940C    mov         eax,dword ptr [ebp-4]
 004C940F    mov         edx,dword ptr [eax+1D8]
 004C9415    mov         eax,dword ptr [ebp-4]
 004C9418    mov         eax,dword ptr [eax+1BC]
 004C941E    call        TControl.SetWidth
 004C9423    xor         eax,eax
 004C9425    pop         edx
 004C9426    pop         ecx
 004C9427    pop         ecx
 004C9428    mov         dword ptr fs:[eax],edx
 004C942B    push        4C94B0
 004C9430    mov         eax,dword ptr [ebp-4]
 004C9433    mov         eax,dword ptr [eax+34]
 004C9436    call        TWinControl.EnableAlign
 004C943B    ret
>004C943C    jmp         @HandleFinally
>004C9441    jmp         004C9430
 004C9443    mov         eax,dword ptr [ebp-4]
 004C9446    mov         eax,dword ptr [eax+34]
 004C9449    call        TWinControl.DisableAlign
 004C944E    xor         edx,edx
 004C9450    push        ebp
 004C9451    push        4C94A9
 004C9456    push        dword ptr fs:[edx]
 004C9459    mov         dword ptr fs:[edx],esp
 004C945C    mov         eax,dword ptr [ebp-4]
 004C945F    mov         eax,dword ptr [eax+1BC]
 004C9465    mov         edx,dword ptr [eax+4C]
 004C9468    mov         ecx,dword ptr [ebp-4]
 004C946B    sub         edx,dword ptr [ecx+1D8]
 004C9471    add         edx,dword ptr [eax+44]
 004C9474    call        TControl.SetTop
 004C9479    mov         eax,dword ptr [ebp-4]
 004C947C    mov         edx,dword ptr [eax+1D8]
 004C9482    mov         eax,dword ptr [ebp-4]
 004C9485    mov         eax,dword ptr [eax+1BC]
 004C948B    call        TControl.SetHeight
 004C9490    xor         eax,eax
 004C9492    pop         edx
 004C9493    pop         ecx
 004C9494    pop         ecx
 004C9495    mov         dword ptr fs:[eax],edx
 004C9498    push        4C94B0
 004C949D    mov         eax,dword ptr [ebp-4]
 004C94A0    mov         eax,dword ptr [eax+34]
 004C94A3    call        TWinControl.EnableAlign
 004C94A8    ret
>004C94A9    jmp         @HandleFinally
>004C94AE    jmp         004C949D
 004C94B0    mov         eax,dword ptr [ebp-4]
 004C94B3    mov         edx,dword ptr [eax]
 004C94B5    call        dword ptr [edx+9C]
 004C94BB    mov         eax,dword ptr [ebp-4]
 004C94BE    cmp         word ptr [eax+202],0
>004C94C6    je          004C94DA
 004C94C8    mov         ebx,dword ptr [ebp-4]
 004C94CB    mov         edx,dword ptr [ebp-4]
 004C94CE    mov         eax,dword ptr [ebx+204]
 004C94D4    call        dword ptr [ebx+200]
 004C94DA    mov         eax,dword ptr [ebp-4]
 004C94DD    mov         eax,dword ptr [eax+1D8]
 004C94E3    mov         edx,dword ptr [ebp-4]
 004C94E6    mov         dword ptr [edx+1E8],eax
 004C94EC    pop         ebx
 004C94ED    pop         ecx
 004C94EE    pop         ebp
 004C94EF    ret
*}
end;

//004C94F0
procedure TSplitter.CalcSplitSize(X:Integer; Y:Integer; var NewSize:Integer; var Split:Integer);
begin
{*
 004C94F0    push        ebp
 004C94F1    mov         ebp,esp
 004C94F3    push        ecx
 004C94F4    push        esi
 004C94F5    push        edi
 004C94F6    mov         dword ptr [ebp-4],ecx
 004C94F9    mov         ecx,edx
 004C94FB    mov         esi,eax
 004C94FD    mov         edi,dword ptr [ebp+0C]
 004C9500    movzx       edx,byte ptr [esi+5D]
 004C9504    mov         eax,edx
 004C9506    add         al,0FD
 004C9508    sub         al,2
>004C950A    jae         004C9519
 004C950C    sub         ecx,dword ptr [esi+1C0]
 004C9512    mov         eax,dword ptr [ebp+8]
 004C9515    mov         dword ptr [eax],ecx
>004C9517    jmp         004C9527
 004C9519    mov         eax,dword ptr [ebp-4]
 004C951C    sub         eax,dword ptr [esi+1C4]
 004C9522    mov         ecx,dword ptr [ebp+8]
 004C9525    mov         dword ptr [ecx],eax
 004C9527    xor         eax,eax
 004C9529    mov         ecx,edx
 004C952B    dec         cl
>004C952D    je          004C955D
 004C952F    dec         cl
>004C9531    je          004C956D
 004C9533    dec         cl
>004C9535    je          004C953D
 004C9537    dec         cl
>004C9539    je          004C954D
>004C953B    jmp         004C957B
 004C953D    mov         eax,dword ptr [esi+1BC]
 004C9543    mov         eax,dword ptr [eax+48]
 004C9546    mov         ecx,dword ptr [ebp+8]
 004C9549    add         eax,dword ptr [ecx]
>004C954B    jmp         004C957B
 004C954D    mov         eax,dword ptr [esi+1BC]
 004C9553    mov         eax,dword ptr [eax+48]
 004C9556    mov         ecx,dword ptr [ebp+8]
 004C9559    sub         eax,dword ptr [ecx]
>004C955B    jmp         004C957B
 004C955D    mov         eax,dword ptr [esi+1BC]
 004C9563    mov         eax,dword ptr [eax+4C]
 004C9566    mov         ecx,dword ptr [ebp+8]
 004C9569    add         eax,dword ptr [ecx]
>004C956B    jmp         004C957B
 004C956D    mov         eax,dword ptr [esi+1BC]
 004C9573    mov         eax,dword ptr [eax+4C]
 004C9576    mov         ecx,dword ptr [ebp+8]
 004C9579    sub         eax,dword ptr [ecx]
 004C957B    mov         dword ptr [edi],eax
 004C957D    cmp         eax,dword ptr [esi+1D0]
>004C9583    jge         004C958F
 004C9585    mov         ecx,dword ptr [esi+1D0]
 004C958B    mov         dword ptr [edi],ecx
>004C958D    jmp         004C959F
 004C958F    cmp         eax,dword ptr [esi+1D4]
>004C9595    jle         004C959F
 004C9597    mov         ecx,dword ptr [esi+1D4]
 004C959D    mov         dword ptr [edi],ecx
 004C959F    cmp         eax,dword ptr [edi]
>004C95A1    je          004C95BC
 004C95A3    sub         dl,2
>004C95A6    je          004C95AD
 004C95A8    sub         dl,2
>004C95AB    jne         004C95B1
 004C95AD    sub         eax,dword ptr [edi]
>004C95AF    jmp         004C95B7
 004C95B1    mov         edx,dword ptr [edi]
 004C95B3    sub         edx,eax
 004C95B5    mov         eax,edx
 004C95B7    mov         edx,dword ptr [ebp+8]
 004C95BA    add         dword ptr [edx],eax
 004C95BC    pop         edi
 004C95BD    pop         esi
 004C95BE    pop         ecx
 004C95BF    pop         ebp
 004C95C0    ret         8
*}
end;

//004C95C4
procedure TSplitter.UpdateSize(X:Integer; Y:Integer);
begin
{*
 004C95C4    push        ebx
 004C95C5    lea         ebx,[eax+1D8]
 004C95CB    push        ebx
 004C95CC    lea         ebx,[eax+1F4]
 004C95D2    push        ebx
 004C95D3    call        TSplitter.CalcSplitSize
 004C95D8    pop         ebx
 004C95D9    ret
*}
end;

//004C95DC
procedure TSplitter.MouseMove(Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 004C95DC    push        ebp
 004C95DD    mov         ebp,esp
 004C95DF    add         esp,0FFFFFFF4
 004C95E2    push        ebx
 004C95E3    push        esi
 004C95E4    push        edi
 004C95E5    mov         esi,ecx
 004C95E7    mov         word ptr [ebp-2],dx
 004C95EB    mov         ebx,eax
 004C95ED    mov         edi,dword ptr [ebp+8]
 004C95F0    push        edi
 004C95F1    mov         ecx,esi
 004C95F3    movzx       edx,word ptr [ebp-2]
 004C95F7    mov         eax,ebx
 004C95F9    call        TControl.MouseMove
 004C95FE    test        byte ptr [ebp-2],8
>004C9602    je          004C967F
 004C9604    cmp         dword ptr [ebx+1BC],0
>004C960B    je          004C967F
 004C960D    lea         eax,[ebp-8]
 004C9610    push        eax
 004C9611    lea         eax,[ebp-0C]
 004C9614    push        eax
 004C9615    mov         ecx,edi
 004C9617    mov         edx,esi
 004C9619    mov         eax,ebx
 004C961B    call        TSplitter.CalcSplitSize
 004C9620    lea         edx,[ebp-8]
 004C9623    mov         eax,ebx
 004C9625    mov         ecx,dword ptr [eax]
 004C9627    call        dword ptr [ecx+0A8]
 004C962D    test        al,al
>004C962F    je          004C967F
 004C9631    movzx       eax,byte ptr [ebx+1F0]
 004C9638    sub         al,1
>004C963A    je          004C9640
 004C963C    sub         al,2
>004C963E    jne         004C9647
 004C9640    mov         eax,ebx
 004C9642    call        TSplitter.DrawLine
 004C9647    mov         eax,dword ptr [ebp-8]
 004C964A    mov         dword ptr [ebx+1D8],eax
 004C9650    mov         eax,dword ptr [ebp-0C]
 004C9653    mov         dword ptr [ebx+1F4],eax
 004C9659    cmp         byte ptr [ebx+1F0],2
>004C9660    jne         004C9669
 004C9662    mov         eax,ebx
 004C9664    call        TSplitter.UpdateControlSize
 004C9669    movzx       eax,byte ptr [ebx+1F0]
 004C9670    sub         al,1
>004C9672    je          004C9678
 004C9674    sub         al,2
>004C9676    jne         004C967F
 004C9678    mov         eax,ebx
 004C967A    call        TSplitter.DrawLine
 004C967F    pop         edi
 004C9680    pop         esi
 004C9681    pop         ebx
 004C9682    mov         esp,ebp
 004C9684    pop         ebp
 004C9685    ret         4
*}
end;

//004C9688
procedure TSplitter.MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 004C9688    push        ebp
 004C9689    mov         ebp,esp
 004C968B    push        ecx
 004C968C    push        esi
 004C968D    mov         word ptr [ebp-2],cx
 004C9691    mov         esi,eax
 004C9693    mov         eax,dword ptr [ebp+0C]
 004C9696    push        eax
 004C9697    mov         eax,dword ptr [ebp+8]
 004C969A    push        eax
 004C969B    movzx       ecx,word ptr [ebp-2]
 004C969F    mov         eax,esi
 004C96A1    call        TControl.MouseUp
 004C96A6    cmp         dword ptr [esi+1BC],0
>004C96AD    je          004C96D7
 004C96AF    movzx       eax,byte ptr [esi+1F0]
 004C96B6    sub         al,1
>004C96B8    je          004C96BE
 004C96BA    sub         al,2
>004C96BC    jne         004C96C5
 004C96BE    mov         eax,esi
 004C96C0    call        TSplitter.DrawLine
 004C96C5    mov         eax,esi
 004C96C7    call        TSplitter.UpdateControlSize
 004C96CC    mov         eax,esi
 004C96CE    mov         si,0FFC6
 004C96D2    call        @CallDynaInst
 004C96D7    pop         esi
 004C96D8    pop         ecx
 004C96D9    pop         ebp
 004C96DA    ret         8
*}
end;

//004C96E0
procedure TSplitter.FocusKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
{*
 004C96E0    push        ebp
 004C96E1    mov         ebp,esp
 004C96E3    push        esi
 004C96E4    mov         esi,eax
 004C96E6    cmp         word ptr [ecx],1B
>004C96EA    jne         004C96F9
 004C96EC    mov         eax,esi
 004C96EE    mov         si,0FFC6
 004C96F2    call        @CallDynaInst
>004C96F7    jmp         004C9714
 004C96F9    cmp         word ptr [esi+1E2],0
>004C9701    je          004C9714
 004C9703    movzx       eax,word ptr [ebp+8]
 004C9707    push        eax
 004C9708    mov         eax,dword ptr [esi+1E4]
 004C970E    call        dword ptr [esi+1E0]
 004C9714    pop         esi
 004C9715    pop         ebp
 004C9716    ret         4
*}
end;

//004C971C
procedure TSplitter.SetBeveled(Value:Boolean);
begin
{*
 004C971C    mov         byte ptr [eax+1B5],dl
 004C9722    mov         edx,dword ptr [eax]
 004C9724    call        dword ptr [edx+94]
 004C972A    ret
*}
end;

//004C972C
procedure TSplitter.StopSizing;
begin
{*
 004C972C    push        ebx
 004C972D    mov         ebx,eax
 004C972F    cmp         dword ptr [ebx+1BC],0
>004C9736    je          004C9781
 004C9738    cmp         byte ptr [ebx+1CC],0
>004C973F    je          004C9748
 004C9741    mov         eax,ebx
 004C9743    call        TSplitter.DrawLine
 004C9748    xor         eax,eax
 004C974A    mov         dword ptr [ebx+1BC],eax
 004C9750    mov         eax,ebx
 004C9752    call        TSplitter.ReleaseLineDC
 004C9757    mov         eax,dword ptr [ebx+1B0]
 004C975D    test        eax,eax
>004C975F    je          004C9781
 004C9761    mov         edx,dword ptr [ebx+1E0]
 004C9767    mov         dword ptr [eax+218],edx
 004C976D    mov         edx,dword ptr [ebx+1E4]
 004C9773    mov         dword ptr [eax+21C],edx
 004C9779    xor         eax,eax
 004C977B    mov         dword ptr [ebx+1B0],eax
 004C9781    cmp         word ptr [ebx+202],0
>004C9789    je          004C9799
 004C978B    mov         edx,ebx
 004C978D    mov         eax,dword ptr [ebx+204]
 004C9793    call        dword ptr [ebx+200]
 004C9799    pop         ebx
 004C979A    ret
*}
end;

Initialization
//00780AD0
{*
 00780AD0    sub         dword ptr ds:[793290],1
>00780AD7    jae         00780B02
 00780AD9    mov         eax,[0047A16C];TControl
 00780ADE    call        StartClassGroup
 00780AE3    mov         edx,dword ptr ds:[47A16C];TControl
 00780AE9    mov         eax,[004C4800];TTimer
 00780AEE    call        GroupDescendentsWith
 00780AF3    push        780B04
 00780AF8    call        user32.RegisterWindowMessageW
 00780AFD    mov         [0079328C],eax
 00780B02    ret
*}
Finalization
end.