//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Graphics;

interface

uses
  SysUtils, Classes, Graphics, JvTrayIcon;

type
  EInvalidGraphic = class(Exception)
  end;
  EInvalidGraphicOperation = class(Exception)
  end;
  TResData = TResData = record//size=4
Handle:Cardinal;//f0
end;;
  TFontPitch = (fpDefault, fpVariable, fpFixed);
  TFontQuality = (fqDefault, fqDraft, fqProof, fqNonAntialiased, fqAntialiased, fqClearType, fqClearTypeNatural);
  TFontStyle = (fsBold, fsItalic, fsUnderline, fsStrikeOut);
  TFontStyles = set of TFontStyle;
  TFontStylesBase = set of TFontStyle;
  TFontData = TFontData = record//size=90
Handle:HFONT;//f0
Height:Integer;//f4
Orientation:Integer;//f8
Pitch:TFontPitch;//fC
Style:TFontStylesBase;//fD
Charset:TFontCharset;//fE
Name:TFontDataName;//fF
Quality:TFontQuality;//f8C
end;;
  TPenStyle = (psSolid, psDash, psDot, psDashDot, psDashDotDot, psClear, psInsideFrame, psUserStyle, psAlternate);
  TPenMode = (pmBlack, pmWhite, pmNop, pmNot, pmCopy, pmNotCopy, pmMergePenNot, pmMaskPenNot, pmMergeNotPen, pmMaskNotPen, pmMerge, pmNotMerge, pmMask, pmNotMask, pmXor, pmNotXor);
  TPenData = TPenData = record//size=10
Handle:HPEN;//f0
Color:TColor;//f4
Width:Integer;//f8
Style:TPenStyle;//fC
end;;
  TBrushStyle = (bsSolid, bsClear, bsHorizontal, bsVertical, bsFDiagonal, bsBDiagonal, bsCross, bsDiagCross);
  TBrushData = TBrushData = record//size=10
Handle:HBRUSH;//f0
Color:TColor;//f4
Bitmap:TBitmap;//f8
Style:TBrushStyle;//fC
OwnsBitmap:Boolean;//fD
end;;
  TResource = TResource = record//size=A4
Next:PResource;//f0
RefCount:Integer;//f4
Handle:Cardinal;//f8
HashCode:Word;//fC
Owner:Cardinal;//f10
Data:TResData;//f14
Font:TFontData;//f14
Pen:TPenData;//f14
Brush:TBrushData;//f14
end;;
  TGraphicsObject = class(TPersistent)
  published
    function HandleAllocated:Boolean;//00465E70
  public
    FOnChange:TNotifyEvent;//f8
    FResource:PResource;//f10
    FOwnerLock:PRTLCriticalSection;//f14
    procedure Lock;//00465E50
    procedure Unlock;//00465E60
  end;
  TFont = class(TGraphicsObject)
  published
    procedure Assign(Source:TPersistent);//0046636C
    destructor Destroy();//0046631C
    constructor Create();//004662BC
  public
    FColor:TColor;//f18
    FPixelsPerInch:Integer;//f1C
    FNotify:IChangeNotifier;//f20
    destructor Destroy(); virtual;//0046631C
    procedure Assign(Source:TPersistent); virtual;//v8//0046636C
    procedure Changed; virtual;//vC//00466350
    procedure GetData(var FontData:TFontData);//00466440
    procedure SetData(const FontData:TFontData);//00466458
    procedure SetColor(const Value:TColor);//004664A8
    function GetHandle:HFONT;//004664E4
    procedure SetHandle(const Value:HFONT);//00466718
    //function GetHeight:?;//00466740
    procedure SetHeight(const Value:Integer);//00466748
    function GetName:TFontName;//0046677C
    procedure SetName(const Value:TFontName);//004667D0
    function GetSize:Integer;//0046682C
    procedure SetSize(const Value:Integer);//00466848
    function GetStyle:TFontStyles;//00466868
    procedure SetStyle(const Value:TFontStyles);//00466874
    function GetPitch:TFontPitch;//004668B4
    function GetQuality:TFontQuality;//004668BC
    procedure SetPitch(const Value:TFontPitch);//004668C8
    procedure SetQuality(const Value:TFontQuality);//00466900
    function GetCharset:TFontCharset;//0046693C
    procedure SetCharset(const Value:TFontCharset);//00466944
    function GetOrientation:Integer;//0046697C
    procedure SetOrientation(const Value:Integer);//00466984
  end;
  TPen = class(TGraphicsObject)
  published
    procedure Assign(Source:TPersistent);//00466B4C
    destructor Destroy();//00466B18
    constructor Create();//00466ACC
  public
    FMode:TPenMode;//f18
    destructor Destroy(); virtual;//00466B18
    procedure Assign(Source:TPersistent); virtual;//v8//00466B4C
    procedure GetData(var PenData:TPenData);//00466C04
    //function GetColor:?;//00466C6C
    procedure SetColor(Value:TColor);//00466C74
    function GetHandle:HPEN;//00466CA4
    procedure SetHandle(Value:HPEN);//00466D54
    procedure SetMode(Value:TPenMode);//00466D78
    procedure SetStyle(Value:TPenStyle);//00466D90
    //function GetWidth:?;//00466DC0
    procedure SetWidth(Value:Integer);//00466DC8
    procedure SetData(const PenData:TPenData);//00466FC4
    function GetStyle:TPenStyle;//004671C0
  end;
  TBrush = class(TGraphicsObject)
  published
    procedure Assign(Source:TPersistent);//00466F00
    destructor Destroy();//00466ECC
    constructor Create();//00466E84
  public
    destructor Destroy(); virtual;//00466ECC
    procedure Assign(Source:TPersistent); virtual;//v8//00466F00
    procedure SetData(const BrushData:TBrushData);//00466C1C
    function GetStyle:TBrushStyle;//00466D88
    procedure GetData(var BrushData:TBrushData);//00466FA8
    procedure SetBitmap(Value:TBitmap);//0046701C
    //function GetColor:?;//00467040
    procedure SetColor(Value:TColor);//00467048
    function GetHandle:HBRUSH;//004670A8
    procedure SetStyle(Value:TBrushStyle);//004671C8
  end;
  TFillStyle = (fsSurface, fsBorder);
  TCanvasStates = (csHandleValid, csFontValid, csPenValid, csBrushValid);
  TCanvasState = set of TCanvasStates;
  TCanvasOrientation = (coLeftToRight, coRightToLeft);
  TTextFormats = (tfBottom, tfCalcRect, tfCenter, tfEditControl, tfEndEllipsis, tfPathEllipsis, tfExpandTabs, tfExternalLeading, tfLeft, tfModifyString, tfNoClip, tfNoPrefix, tfRight, tfRtlReading, tfSingleLine, tfTop, tfVerticalCenter, tfWordBreak);
  TTextFormat = set of TTextFormats;
  TCustomCanvas = class(TPersistent)
  published
    procedure Refresh;//004612B4
    procedure Rectangle(Rect:TRect);//00467288
    procedure RoundRect(Rect:TRect; CX:Integer; CY:Integer);//004672A0
    procedure RoundRect(X1:Integer; Y1:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer);//004612BC
    procedure PolyBezier;//0046129C
    procedure Polyline;//00461294
    procedure Rectangle(X1:Integer; Y1:Integer; Y2:Integer; X2:Integer);//004612AC
    procedure PolyBezierTo;//004612A4
    procedure StretchDraw(Rect:TRect; Graphic:TGraphic);//004612C4
    function TextWidth(Text:string):Integer;//004672EC
    procedure TextRect(Rect:TRect; X:Integer; Text:string; Y:Integer);//004612E4
    procedure Unlock;//00467368
    function TryLock:Boolean;//0046730C
    function TextHeight(Text:string):Integer;//004672CC
    procedure TextExtent(Text:string);//004612CC
    procedure TextRect(var Rect:TRect; var Text:string; TextFormat:TTextFormat);//004612DC
    procedure TextOut(X:Integer; Y:Integer; Text:string);//004612D4
    procedure Polygon;//0046128C
    procedure Draw(X:Integer; Y:Integer; Graphic:TGraphic);//0046123C
    procedure Chord(X1:Integer; Y1:Integer; Y4:Integer; X4:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer);//00461234
    procedure DrawFocusRect(Rect:TRect);//0046124C
    procedure Draw(X:Integer; Y:Integer; Opacity:Byte; Graphic:TGraphic);//00461244
    procedure ArcTo(X1:Integer; Y1:Integer; Y4:Integer; X4:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer);//0046121C
    procedure Arc(X1:Integer; Y1:Integer; Y4:Integer; X4:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer);//00461214
    procedure BrushCopy(Dest:TRect; Bitmap:TBitmap; Color:TColor; Source:TRect);//0046122C
    procedure AngleArc(X:Integer; Y:Integer; SweepAngle:Single; StartAngle:Single; Radius:Cardinal);//00461224
    procedure Ellipse(X1:Integer; Y1:Integer; Y2:Integer; X2:Integer);//00461254
    procedure Lock;//00467260
    procedure LineTo(X:Integer; Y:Integer);//00461274
    procedure Pie(X1:Integer; Y1:Integer; Y4:Integer; X4:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer);//00461284
    procedure MoveTo(X:Integer; Y:Integer);//0046127C
    procedure FillRect(Rect:TRect);//0046125C
    procedure Ellipse(Rect:TRect);//00467248
    procedure FrameRect(Rect:TRect);//0046126C
    procedure FloodFill(X:Integer; Y:Integer; FillStyle:TFillStyle; Color:TColor);//00461264
  public
    FOnChange:TNotifyEvent;//f8
    FOnChanging:TNotifyEvent;//f10
    FTextFlags:Integer;//f18
    FLock:_RTL_CRITICAL_SECTION;//f1C
    FLockCount:Integer;//f34
    procedure GetCanvasOrientation; virtual; abstract;//vC//00404A58
    procedure GetClipRect; virtual; abstract;//v10//00404A58
    procedure GetPenPos; virtual; abstract;//v14//00404A58
    procedure GetPixel; virtual; abstract;//v18//00404A58
    procedure SetPenPos; virtual; abstract;//v1C//00404A58
    procedure SetPixel; virtual; abstract;//v20//00404A58
    procedure Changing; virtual;//v28//00467234
    procedure RequiredState; virtual; abstract;//v2C//00404A58
    procedure Arc; virtual; abstract;//v30//00404A58
    procedure ArcTo; virtual; abstract;//v34//00404A58
    procedure AngleArc; virtual; abstract;//v38//00404A58
    procedure BrushCopy; virtual; abstract;//v3C//00404A58
    procedure Chord; virtual; abstract;//v40//00404A58
    procedure Draw; virtual; abstract;//v44//00404A58
    procedure Draw; virtual; abstract;//v48//00404A58
    procedure DrawFocusRect; virtual; abstract;//v4C//00404A58
    procedure Ellipse; virtual; abstract;//v50//00404A58
    procedure FillRect; virtual; abstract;//v54//00404A58
    procedure FloodFill; virtual; abstract;//v58//00404A58
    procedure FrameRect; virtual; abstract;//v5C//00404A58
    procedure LineTo; virtual; abstract;//v60//00404A58
    procedure MoveTo; virtual; abstract;//v64//00404A58
    procedure Pie; virtual; abstract;//v68//00404A58
    procedure Polygon; virtual; abstract;//v6C//00404A58
    procedure Polyline; virtual; abstract;//v70//00404A58
    procedure PolyBezier; virtual; abstract;//v74//00404A58
    procedure PolyBezierTo; virtual; abstract;//v78//00404A58
    procedure Rectangle; virtual; abstract;//v7C//00404A58
    procedure Refresh; virtual; abstract;//v80//00404A58
    procedure RoundRect; virtual; abstract;//v84//00404A58
    procedure StretchDraw; virtual; abstract;//v88//00404A58
    procedure TextExtent; virtual; abstract;//v8C//00404A58
    procedure TextOut; virtual; abstract;//v90//00404A58
    procedure TextRect; virtual; abstract;//v94//00404A58
    procedure TextRect; virtual; abstract;//v98//00404A58
  end;
  TCanvas = class(TCustomCanvas)
  published
    procedure Polyline(const Points:array[$0..-$1] of Windows.TPoint; const _Dv_:$0..-$1);//00467CF4
    procedure PolyBezier(const Points:array[$0..-$1] of Windows.TPoint; const _Dv_:$0..-$1);//00467D30
    procedure PolyBezierTo(const Points:array[$0..-$1] of Windows.TPoint; const _Dv_:$0..-$1);//00467D6C
    procedure Polygon(const Points:array[$0..-$1] of Windows.TPoint; const _Dv_:$0..-$1);//00467CB8
    procedure LineTo(X:Integer; Y:Integer);//00467BFC
    procedure MoveTo(X:Integer; Y:Integer);//00467C34
    procedure Pie(X1:Integer; Y1:Integer; Y4:Integer; X4:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer);//00467C60
    procedure Rectangle(X1:Integer; Y1:Integer; Y2:Integer; X2:Integer);//00467DA8
    procedure TextOut(X:Integer; Y:Integer; Text:string);//00467EB0
    procedure TextRect(var Rect:TRect; var Text:string; TextFormat:TTextFormat);//00467FF8
    procedure TextRect(Rect:TRect; X:Integer; Text:string; Y:Integer);//00467F4C
    function TextExtent(Text:string):tagSIZE;//00468094
    procedure Refresh;//00467DF0
    procedure RoundRect(X1:Integer; Y1:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer);//00467DF8
    procedure StretchDraw(Rect:TRect; Graphic:TGraphic);//00467E48
    function HandleAllocated:Boolean;//00467BF4
    procedure AngleArc(X:Integer; Y:Integer; SweepAngle:Single; StartAngle:Single; Radius:Cardinal);//00467564
    procedure BrushCopy(Dest:TRect; Bitmap:TBitmap; Color:TColor; Source:TRect);//004675AC
    procedure Chord(X1:Integer; Y1:Integer; Y4:Integer; X4:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer);//00467870
    procedure ArcTo(X1:Integer; Y1:Integer; Y4:Integer; X4:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer);//0046750C
    constructor Create();//00467390
    destructor Destroy();//00467454
    procedure Arc(X1:Integer; Y1:Integer; Y4:Integer; X4:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer);//004674B4
    procedure CopyRect(Dest:TRect; Canvas:TCanvas; Source:TRect);//004678C8
    procedure FillRect(Rect:TRect);//00467B2C
    procedure FloodFill(X:Integer; Y:Integer; FillStyle:TFillStyle; Color:TColor);//00467B68
    procedure FrameRect(Rect:TRect);//00467BB8
    procedure Ellipse(X1:Integer; Y1:Integer; Y2:Integer; X2:Integer);//00467AE4
    procedure Draw(X:Integer; Y:Integer; Graphic:TGraphic);//00467950
    procedure Draw(X:Integer; Y:Integer; Opacity:Byte; Graphic:TGraphic);//004679FC
    procedure DrawFocusRect(Rect:TRect);//00467AB0
  public
    FHandle:HDC;//f38
    State:TCanvasState;//f3C
    FFont:TFont;//f40
    FPen:TPen;//f44
    FBrush:TBrush;//f48
    FPenPos:TPoint;//f4C
    FCopyMode:Integer;//f54
    destructor Destroy(); virtual;//00467454
    function GetCanvasOrientation:TCanvasOrientation; virtual;//vC//00467E84
    function GetClipRect:TRect; virtual;//v10//004681C0
    function GetPenPos:TPoint; virtual;//v14//00468104
    function GetPixel(X:Integer; Y:Integer):TColor; virtual;//v18//0046814C
    procedure SetPenPos(Value:TPoint); virtual;//v1C//0046812C
    procedure SetPixel(X:Integer; Y:Integer; Value:TColor); virtual;//v20//00468178
    procedure RequiredState(ReqState:TCanvasState); virtual;//v2C//004682C4
    procedure Arc(X1:Integer; Y1:Integer; Y4:Integer; X4:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer); virtual;//v30//004674B4
    procedure ArcTo(X1:Integer; Y1:Integer; Y4:Integer; X4:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer); virtual;//v34//0046750C
    procedure AngleArc(X:Integer; Y:Integer; SweepAngle:Single; StartAngle:Single; Radius:Cardinal); virtual;//v38//00467564
    procedure BrushCopy(Dest:TRect; Bitmap:TBitmap; Color:TColor; Source:TRect); virtual;//v3C//004675AC
    procedure Chord(X1:Integer; Y1:Integer; Y4:Integer; X4:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer); virtual;//v40//00467870
    procedure Draw(X:Integer; Y:Integer; Graphic:TGraphic); virtual;//v44//00467950
    procedure Draw(X:Integer; Y:Integer; Opacity:Byte; Graphic:TGraphic); virtual;//v48//004679FC
    procedure DrawFocusRect(Rect:TRect); virtual;//v4C//00467AB0
    procedure Ellipse(X1:Integer; Y1:Integer; Y2:Integer; X2:Integer); virtual;//v50//00467AE4
    procedure FillRect(Rect:TRect); virtual;//v54//00467B2C
    procedure FloodFill(X:Integer; Y:Integer; FillStyle:TFillStyle; Color:TColor); virtual;//v58//00467B68
    procedure FrameRect(Rect:TRect); virtual;//v5C//00467BB8
    procedure LineTo(X:Integer; Y:Integer); virtual;//v60//00467BFC
    procedure MoveTo(X:Integer; Y:Integer); virtual;//v64//00467C34
    procedure Pie(X1:Integer; Y1:Integer; Y4:Integer; X4:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer); virtual;//v68//00467C60
    procedure Polygon(const Points:array[$0..-$1] of Windows.TPoint; const _Dv_:$0..-$1); virtual;//v6C//00467CB8
    procedure Polyline(const Points:array[$0..-$1] of Windows.TPoint; const _Dv_:$0..-$1); virtual;//v70//00467CF4
    procedure PolyBezier(const Points:array[$0..-$1] of Windows.TPoint; const _Dv_:$0..-$1); virtual;//v74//00467D30
    procedure PolyBezierTo(const Points:array[$0..-$1] of Windows.TPoint; const _Dv_:$0..-$1); virtual;//v78//00467D6C
    procedure Rectangle(X1:Integer; Y1:Integer; Y2:Integer; X2:Integer); virtual;//v7C//00467DA8
    procedure Refresh; virtual;//v80//00467DF0
    procedure RoundRect(X1:Integer; Y1:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer); virtual;//v84//00467DF8
    procedure StretchDraw(Rect:TRect; Graphic:TGraphic); virtual;//v88//00467E48
    function TextExtent(Text:string):tagSIZE; virtual;//v8C//00468094
    procedure TextOut(X:Integer; Y:Integer; Text:string); virtual;//v90//00467EB0
    procedure TextRect(var Rect:TRect; var Text:string; TextFormat:TTextFormat); virtual;//v94//00467FF8
    procedure TextRect(Rect:TRect; X:Integer; Text:string; Y:Integer); virtual;//v98//00467F4C
    procedure CreateHandle; virtual;//v9C//0046826C
    procedure SetFont(Value:TFont);//004680DC
    procedure SetPen(Value:TPen);//004680EC
    procedure SetBrush(Value:TBrush);//004680F8
    function GetHandle:HDC;//004681E8
    procedure DeselectHandles;//0046820C
    procedure SetHandle(Value:HDC);//00468270
    procedure CreateFont;//00468340
    procedure CreatePen;//0046836C
    procedure CreateBrush;//0046839C
    procedure FontChanged(AFont:TObject);//00468410
    procedure PenChanged(APen:TObject);//00468430
    procedure BrushChanged(ABrush:TObject);//00468450
  end;
  TProgressStage = (psStarting, psRunning, psEnding);
  TProgressEvent = procedure(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:string) of object;;
  TGraphic = class(TInterfacedPersistent)
  published
    procedure LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE);//00462704
    procedure SaveToStream(Stream:TStream);//004626FC
    procedure SetSize(AWidth:Integer; AHeight:Integer);//00469B7C
    procedure SaveToClipboardFormat(var AFormat:Word; var AData:Cardinal; var APalette:HPALETTE);//0046270C
    function Equals(Obj:TObject):Boolean;//00469A40
    constructor Create();//004697F0
    procedure LoadFromFile(Filename:string);//00469A80
    procedure LoadFromStream(Stream:TStream);//004626F4
    procedure SaveToFile(Filename:string);//00469B0C
  public
    FOnChange:TNotifyEvent;//f10
    f14:TJvTrayIcon;//f14
    FOnProgress:TProgressEvent;//f18
    FModified:Boolean;//f20
    FTransparent:Boolean;//f21
    FPaletteModified:Boolean;//f22
    function Equals(Obj:TObject):Boolean; virtual;//00469A40
    procedure DefineProperties(Filer:TFiler); virtual;//v4//00469898
    procedure Changed(Sender:TObject); virtual;//v10//00469828
    procedure Draw; virtual; abstract;//v14//00404A58
    procedure DrawTransparent(ACanvas:TCanvas; const Rect:TRect; Opacity:Byte); virtual;//v18//004698EC
    function Equals(Graphic:TGraphic):Boolean; virtual;//v1C//00469900
    procedure GetEmpty; virtual; abstract;//v20//00404A58
    procedure GetHeight; virtual; abstract;//v24//00404A58
    //function v28:?; virtual;//v28//00469A70
    //function v2C:?; virtual;//v2C//00469A78
    procedure GetWidth; virtual; abstract;//v30//00404A58
    procedure ReadData(Stream:TStream); virtual;//v34//00469B00
    procedure SetHeight; virtual; abstract;//v38//00404A58
    procedure v3C; virtual;//v3C//00469B64
    procedure SetTransparent(Value:Boolean); virtual;//v40//00469B98
    procedure SetWidth; virtual; abstract;//v44//00404A58
    procedure WriteData(Stream:TStream); virtual;//v48//00469BA8
    //function v4C:?; virtual;//v4C//00469A74
    constructor Create(); virtual;//v50//004697F0
    procedure LoadFromFile(Filename:string); virtual;//v54//00469A80
    procedure SaveToFile(Filename:string); virtual;//v58//00469B0C
    procedure LoadFromStream; virtual; abstract;//v5C//00404A58
    procedure SaveToStream; virtual; abstract;//v60//00404A58
    procedure LoadFromClipboardFormat; virtual; abstract;//v64//00404A58
    procedure SaveToClipboardFormat; virtual; abstract;//v68//00404A58
    procedure SetSize(AWidth:Integer; AHeight:Integer); virtual;//v6C//00469B7C
    procedure Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:UnicodeString); dynamic;//00469AD4
    procedure SetModified(Value:Boolean);//00469B68
  end;
  TPicture = class(TInterfacedPersistent)
  published
    procedure RegisterFileFormat(AExtension:string; ADescription:string; AGraphicClass:TGraphicClass);//0046AE68
    procedure Assign(Source:TPersistent);//0046AE0C
    procedure RegisterClipboardFormat(AFormat:Word; AGraphicClass:TGraphicClass);//0046AEB0
    procedure RegisterFileFormatRes(AExtension:string; ADescriptionResID:Integer; AGraphicClass:TGraphicClass);//0046AE8C
    procedure UnregisterGraphicClass(AClass:TGraphicClass);//0046AEC8
    procedure LoadFromFile(Filename:string);//0046AB8C
    destructor Destroy();//0046A9B4
    constructor Create();//0046A974
    procedure SaveToFile(Filename:string);//0046ACC4
    function SupportsClipboardFormat(AFormat:Word):Boolean;//0046ADC4
    procedure SaveToClipboardFormat(var AFormat:Word; var AData:Cardinal; var APalette:HPALETTE);//0046ADA0
    procedure LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE);//0046ACDC
  public
    FGraphic:TGraphic;//fC
    FOnChange:TNotifyEvent;//f10
    FNotify:IChangeNotifier;//f18
    FOnProgress:TProgressEvent;//f20
    destructor Destroy(); virtual;//0046A9B4
    procedure AssignTo(Dest:TPersistent); virtual;//v0//0046A9E4
    procedure DefineProperties(Filer:TFiler); virtual;//v4//0046B1C0
    procedure Assign(Source:TPersistent); virtual;//v8//0046AE0C
    procedure Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:UnicodeString); dynamic;//0046AF1C
    procedure Changed(Sender:TObject); dynamic;//0046AEF8
    procedure ForceType(GraphicType:TGraphicClass);//0046AA1C
    function GetBitmap:TBitmap;//0046AA80
    function GetIcon:TIcon;//0046AA98
    function GetMetafile:TMetafile;//0046AAB0
    procedure SetGraphic(Value:TGraphic);//0046AAE0
    procedure LoadFromStream(Stream:TStream);//0046ADDC
    procedure SaveToStream(Stream:TStream);//0046ADF4
    procedure ReadData(Stream:TStream);//0046AF48
    procedure WriteData(Stream:TStream);//0046B094
    function GetWidth:Integer;//0046B214
    function GetHeight:Integer;//0046B22C
  end;
  TMetafileCanvas = class(TCanvas)
  published
    destructor Destroy();//0046B588
    constructor CreateWithComment(Description:string; CreatedBy:string; ReferenceDevice:HDC);//0046B31C
    constructor Create(ReferenceDevice:HDC);//0046B284
  public
    FMetafile:TMetafile;//f58
    destructor Destroy(); virtual;//0046B588
  end;
  TSharedImage = class(TObject)
  published
    destructor Destroy();//0046CA3C
  public
    FRefCount:Integer;//f4
    destructor Destroy(); virtual;//0046CA3C
    procedure FreeHandle; virtual; abstract;//v0//00404A58
    procedure Reference;//0046CA64
    procedure Release;//0046CA68
  end;
  TMetafileImage = class(TSharedImage)
  published
    destructor Destroy();//0046B244
  public
    FHandle:Cardinal;//f8
    FWidth:Integer;//fC
    FHeight:Integer;//f10
    FPalette:HPALETTE;//f14
    FInch:Word;//f18
    FTempWidth:Integer;//f1C
    FTempHeight:Integer;//f20
    destructor Destroy(); virtual;//0046B244
    procedure FreeHandle; virtual;//v0//0046B280
  end;
  TMetafile = class(TGraphic)
  published
    procedure SaveToClipboardFormat(var AFormat:Word; var AData:Cardinal; var APalette:HPALETTE);//0046C430
    procedure LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE);//0046C3AC
    procedure SaveToStream(Stream:TStream);//0046BE28
    procedure SetSize(AWidth:Integer; AHeight:Integer);//0046C480
    function ReleaseHandle:Cardinal;//0046C464
    procedure Assign(Source:TPersistent);//0046B64C
    procedure Clear;//0046B6E0
    destructor Destroy();//0046B61C
    constructor Create();//0046B5D4
    procedure SaveToFile(Filename:string);//0046BD58
    procedure LoadFromStream(Stream:TStream);//0046BA20
    function HandleAllocated:Boolean;//0046B878
  public
    FImage:TMetafileImage;//f28
    FEnhanced:Boolean;//f2C
    destructor Destroy(); virtual;//0046B61C
    procedure Assign(Source:TPersistent); virtual;//v8//0046B64C
    procedure Draw(ACanvas:TCanvas; const Rect:TRect); virtual;//v14//0046B6E8
    function GetEmpty:Boolean; virtual;//v20//0046B860
    function GetHeight:Integer; virtual;//v24//0046B88C
    function GetPalette:HPALETTE; virtual;//v28//0046B930
    function GetWidth:Integer; virtual;//v30//0046B9BC
    procedure ReadData(Stream:TStream); virtual;//v34//0046BA9C
    procedure SetHeight(Value:Integer); virtual;//v38//0046BED4
    procedure SetTransparent(Value:Boolean); virtual;//v40//0046BFF8
    procedure SetWidth(Value:Integer); virtual;//v44//0046BFFC
    procedure WriteData(Stream:TStream); virtual;//v48//0046C154
    constructor Create(); virtual;//v50//0046B5D4
    procedure SaveToFile(Filename:string); virtual;//v58//0046BD58
    procedure LoadFromStream(Stream:TStream); virtual;//v5C//0046BA20
    procedure SaveToStream(Stream:TStream); virtual;//v60//0046BE28
    procedure LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE); virtual;//v64//0046C3AC
    procedure SaveToClipboardFormat(var AFormat:Word; var AData:Cardinal; var APalette:HPALETTE); virtual;//v68//0046C430
    procedure SetSize(AWidth:Integer; AHeight:Integer); virtual;//v6C//0046C480
    function GetAuthor:UnicodeString;//0046B778
    function GetDesc:UnicodeString;//0046B7E0
    function GetHandle:THandle;//0046B868
    function GetInch:Word;//0046B8F0
    function GetMMHeight:Integer;//0046B900
    function GetMMWidth:Integer;//0046B918
    procedure NewImage;//0046BA74
    procedure ReadEMFStream(Stream:TStream);//0046BB08
    procedure ReadWMFStream(Stream:TStream; Length:LongInt);//0046BBD8
    procedure SetHandle(Value:THandle);//0046BE44
    procedure SetInch(Value:Word);//0046BF48
    procedure SetMMHeight(Value:Integer);//0046BF80
    procedure SetMMWidth(Value:Integer);//0046BFBC
    function TestEMF(Stream:TStream):Boolean;//0046C070
    procedure UniqueImage;//0046C0D0
    procedure WriteEMFStream(Stream:TStream);//0046C1D8
    procedure WriteWMFStream(Stream:TStream);//0046C264
  end;
  TBitmapImage = class(TSharedImage)
  published
    destructor Destroy();//0046CA88
  public
    FHandle:HBITMAP;//f8
    FMaskHandle:HBITMAP;//fC
    FPalette:HPALETTE;//f10
    FDIBHandle:HBITMAP;//f14
    FDIB:tagDIBSECTION;//f18
    FSaveStream:TMemoryStream;//f6C
    FHalftone:Boolean;//f70
    FOS2Format:Boolean;//f71
    destructor Destroy(); virtual;//0046CA88
    procedure FreeHandle; virtual;//v0//0046CAEC
  end;
  TBitmapHandleType = (bmDIB, bmDDB);
  TPixelFormat = (pfDevice, pf1bit, pf4bit, pf8bit, pf15bit, pf16bit, pf24bit, pf32bit, pfCustom);
  TAlphaFormat = (afIgnored, afDefined, afPremultiplied);
  TTransparentMode = (tmAuto, tmFixed);
  TBitmap = class(TGraphic)
  published
    function ReleasePalette:HPALETTE;//0046F6B0
    procedure SaveToClipboardFormat(var Format:Word; var Data:Cardinal; var APalette:HPALETTE);//0046F6DC
    function ReleaseHandle:HBITMAP;//0046F668
    function ReleaseMaskHandle:HBITMAP;//0046F69C
    procedure LoadFromResourceName(Instance:Cardinal; ResName:string);//0046E5F0
    procedure LoadFromResourceID(Instance:Cardinal; ResID:Integer);//0046E660
    procedure SaveToStream(Stream:TStream);//0046F6D4
    procedure SetSize(AWidth:Integer; AHeight:Integer);//0046F77C
    procedure Mask(TransparentColor:TColor);//0046E370
    procedure Assign(Source:TPersistent);//0046D5C4
    procedure Dormant;//0046D7D0
    constructor Create();//0046D514
    destructor Destroy();//0046D588
    procedure LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE);//0046E56C
    procedure LoadFromStream(Stream:TStream);//0046E6D0
    procedure FreeImage;//0046DDB4
    function HandleAllocated:Boolean;//0046DEA0
  public
    FImage:TBitmapImage;//f28
    FCanvas:TCanvas;//f2C
    FIgnorePalette:Boolean;//f30
    FMaskBitsValid:Boolean;//f31
    FMaskValid:Boolean;//f32
    FTransparentColor:TColor;//f34
    FTransparentMode:TTransparentMode;//f38
    FAlphaFormat:TAlphaFormat;//f39
    destructor Destroy(); virtual;//0046D588
    procedure Assign(Source:TPersistent); virtual;//v8//0046D5C4
    procedure Changed(Sender:TObject); virtual;//v10//0046D7C4
    procedure Draw(ACanvas:TCanvas; const Rect:TRect); virtual;//v14//0046D84C
    procedure DrawTransparent(ACanvas:TCanvas; const Rect:TRect; Opacity:Byte); virtual;//v18//0046DAF8
    function GetEmpty:Boolean; virtual;//v20//0046DE18
    function GetHeight:Integer; virtual;//v24//0046DEE0
    function GetPalette:HPALETTE; virtual;//v28//0046DF20
    //function GetWidth:?; virtual;//v30//0046E244
    procedure ReadData(Stream:TStream); virtual;//v34//0046E7F4
    procedure SetHeight(Value:Integer); virtual;//v38//0046F01C
    procedure SetPalette(Value:HPALETTE); virtual;//v3C//0046F0BC
    procedure SetWidth(Value:Integer); virtual;//v44//0046F374
    procedure WriteData(Stream:TStream); virtual;//v48//0046F384
    function GetSupportsPartialTransparency:Boolean; virtual;//v4C//0046E020
    constructor Create(); virtual;//v50//0046D514
    procedure LoadFromStream(Stream:TStream); virtual;//v5C//0046E6D0
    procedure SaveToStream(Stream:TStream); virtual;//v60//0046F6D4
    procedure LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE); virtual;//v64//0046E56C
    procedure SaveToClipboardFormat(var Format:Word; var Data:Cardinal; var APalette:HPALETTE); virtual;//v68//0046F6DC
    procedure SetSize(AWidth:Integer; AHeight:Integer); virtual;//v6C//0046F77C
    function GetHandle:HBITMAP; virtual;//v70//0046DE7C
    function GetMaskHandle:HBITMAP; virtual;//v74//0046DEF0
    procedure SetHandleType(Value:TBitmapHandleType); virtual;//v78//0046EEE0
    procedure CopyImage(AHandle:HBITMAP; APalette:HPALETTE; DIB:TDIBSection);//0046D6D8
    procedure Changing(Sender:TObject);//0046D798
    function GetCanvas:TCanvas;//0046DE34
    function GetHandleType:TBitmapHandleType;//0046DEB4
    function GetMonochrome:Boolean;//0046DF04
    function GetPixelFormat:TPixelFormat;//0046DF34
    function GetScanline(Row:Integer):Pointer;//0046DFB8
    procedure PreMultiplyAlpha;//0046E03C
    procedure UnPreMultiplyAlpha;//0046E0E0
    procedure SetAlphaFormat(Value:TAlphaFormat);//0046E1A0
    function GetTransparentColor:TColor;//0046E1FC
    procedure DIBNeeded;//0046E24C
    procedure FreeContext;//0046E2C0
    procedure HandleNeeded;//0046E2D0
    procedure MaskHandleNeeded;//0046E454
    procedure PaletteNeeded;//0046E4B4
    procedure NewImage(NewHandle:HBITMAP; NewPalette:HPALETTE; const NewDIB:TDIBSection; OS2Format:Boolean; RLEStream:TStream);//0046E6F4
    procedure ReadDIB(Stream:TStream; ImageSize:LongWord; bmf:PBitmapFileHeader);//0046E81C
    procedure ReadStream(Stream:TStream; Size:LongInt);//0046EDAC
    procedure SetHandle(Value:HBITMAP);//0046EE1C
    procedure SetMaskHandle(Value:HBITMAP);//0046F02C
    procedure SetMonochrome(Value:Boolean);//0046F040
    procedure SetPixelFormat(Value:TPixelFormat);//0046F190
    procedure SetTransparentColor(Value:TColor);//0046F2F8
    procedure SetTransparentMode(Value:TTransparentMode);//0046F348
    procedure WriteStream(Stream:TStream; WriteSize:Boolean);//0046F38C
    function TransparentColorStored:Boolean;//0046F7DC
  end;
  TIconImage = class(TSharedImage)
  published
    destructor Destroy();//0046F7E4
  public
    FMemoryImage:TCustomMemoryStream;//f8
    FSize:TPoint;//fC
    FHandle:HICON;//f14
    destructor Destroy(); virtual;//0046F7E4
    procedure FreeHandle; virtual;//v0//0046F814
  end;
  TIcon = class(TGraphic)
  published
    procedure SaveToStream(Stream:TStream);//004700A8
    procedure SaveToClipboardFormat(var Format:Word; var Data:Cardinal; var APalette:HPALETTE);//004700E4
    function ReleaseHandle:HICON;//0046FF84
    procedure LoadFromResourceID(Instance:Cardinal; ResID:Integer);//0046FE14
    procedure LoadFromResourceName(Instance:Cardinal; ResName:string);//0046FE34
    procedure SetSize(AWidth:Integer; AHeight:Integer);//0047006C
    procedure LoadFromStream(Stream:TStream);//0046FE58
    procedure Assign(Source:TPersistent);//0046FBB0
    destructor Destroy();//0046FB80
    constructor Create();//0046FB2C
    procedure LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE);//004700D0
    function HandleAllocated:Boolean;//0046FC7C
    procedure AssignTo(Dest:TPersistent);//0046F864
  public
    FImage:TIconImage;//f28
    FRequestedSize:TPoint;//f2C
    destructor Destroy(); virtual;//0046FB80
    procedure AssignTo(Dest:TPersistent); virtual;//v0//0046F864
    procedure Assign(Source:TPersistent); virtual;//v8//0046FBB0
    procedure Draw(ACanvas:TCanvas; const Rect:TRect); virtual;//v14//0046FC0C
    function GetEmpty:Boolean; virtual;//v20//0046FC50
    function GetHeight:Integer; virtual;//v24//0046FC90
    function GetWidth:Integer; virtual;//v30//0046FCBC
    procedure SetHeight(Value:Integer); virtual;//v38//00470054
    procedure SetTransparent(Value:Boolean); virtual;//v40//0047008C
    procedure SetWidth(Value:Integer); virtual;//v44//00470090
    constructor Create(); virtual;//v50//0046FB2C
    procedure LoadFromStream(Stream:TStream); virtual;//v5C//0046FE58
    procedure SaveToStream(Stream:TStream); virtual;//v60//004700A8
    procedure LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE); virtual;//v64//004700D0
    procedure SaveToClipboardFormat(var Format:Word; var Data:Cardinal; var APalette:HPALETTE); virtual;//v68//004700E4
    procedure SetSize(AWidth:Integer; AHeight:Integer); virtual;//v6C//0047006C
    function GetHandle:HICON;//0046FC68
    procedure HandleNeeded;//0046FCE8
    procedure ImageNeeded;//0046FD60
    procedure NewImage(NewHandle:HICON; NewImage:TMemoryStream);//0046FF10
    procedure SetHandle(Value:HICON);//0046FFC0
  end;
  TWICImageFormat = (wifBmp, wifPng, wifJpeg, wifGif, wifTiff, wifWMPhoto, wifOther);
  TWICImage = class(TGraphic)
  published
    procedure SaveToStream(Stream:TStream);//0047071C
    procedure LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE);//004708CC
    procedure SaveToClipboardFormat(var AFormat:Word; var AData:Cardinal; var APalette:HPALETTE);//0047095C
    procedure LoadFromStream(Stream:TStream);//004705DC
    constructor Create();//004702B0
    destructor Destroy();//00470354
    procedure Assign(Source:TPersistent);//004700F8
  public
    FWidth:Cardinal;//f28
    FHeight:Cardinal;//f2C
    FBitmap:TBitmap;//f30
    FData:TMemoryStream;//f34
    FWicBitmap:IWICBitmap;//f38
    FImageFormat:TWICImageFormat;//f3C
    FEncoderContainerFormat:TGUID;//f3D
    FFormatChanged:Boolean;//f4D
    destructor Destroy(); virtual;//00470354
    procedure AssignTo(Dest:TPersistent); virtual;//v0//00470278
    procedure Assign(Source:TPersistent); virtual;//v8//004700F8
    procedure Draw(ACanvas:TCanvas; const Rect:TRect); virtual;//v14//00470530
    function GetEmpty:Boolean; virtual;//v20//0047055C
    //function GetHeight:?; virtual;//v24//00470578
    //function GetWidth:?; virtual;//v30//0047057C
    procedure SetHeight(Value:Integer); virtual;//v38//00470B3C
    procedure SetWidth(Value:Integer); virtual;//v44//00470B48
    constructor Create(); virtual;//v50//004702B0
    procedure LoadFromStream(Stream:TStream); virtual;//v5C//004705DC
    procedure SaveToStream(Stream:TStream); virtual;//v60//0047071C
    procedure LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE); virtual;//v64//004708CC
    procedure SaveToClipboardFormat(var AFormat:Word; var AData:Cardinal; var APalette:HPALETTE); virtual;//v68//0047095C
    procedure CreateWicBitmap;//004703E4
    function GetHandle:IWICBitmap;//00470564
    procedure SetEncoderContainerFormat(const Value:TGUID);//00470988
    procedure SetImageFormat(const Value:TWICImageFormat);//00470A3C
    procedure RequireBitmap;//00470B88
  end;
  TResourceManager = class(TObject)
  published
    procedure AssignResource(GraphicsObject:TGraphicsObject; AResource:PResource);//004654E0
    //procedure ChangeResource(GraphicsObject:TGraphicsObject; ResData:?);//00465454
    procedure Unlock;//00465268
    procedure Lock;//0046525C
    destructor Destroy();//00465238
    constructor Create;//004651FC
    procedure FreeResource(Resource:PResource);//00465384
    //function AllocResource(ResData:?):PResource;//00465274
  public
    ResList:PResource;//f4
    FLock:_RTL_CRITICAL_SECTION;//f8
    ResDataSize:Word;//f20
    destructor Destroy(); virtual;//00465238
    procedure v0; virtual;//v0//004654DC
  end;
  TBrushResourceManager = class(TResourceManager)
  public
    procedure FreeObjects(Resource:PResource); virtual;//v0//00465574
  end;
  TFileFormat = TFileFormat = record//size=10
f4:string;//f4
f8:string;//f8
end;
GraphicClass:TGraphicClass;//f0
Extension:string;//f4
Description:string;//f8
DescResID:Integer;//fC
end;;
  TFileFormatsList = class(TList)
  published
    function FindClassName(Classname:string):TGraphicClass;//0046A22C
    procedure Remove(AClass:TGraphicClass);//0046A2A8
    procedure BuildFilterStrings(AGraphicClass:TGraphicClass; var Descriptions:string; var Filters:string);//0046A2F4
    function FindExt(Ext:string):TGraphicClass;//0046A194
    constructor Create();//00469EEC
    destructor Destroy();//0046A0B4
    procedure Add(Ext:string; Desc:string; AClass:TGraphicClass; DescID:Integer);//0046A100
  public
    destructor Destroy(); virtual;//0046A0B4
  end;
  TClipboardFormats = class(TObject)
  published
    function FindFormat(Fmt:Word):TGraphicClass;//0046A8B0
    procedure Remove(AClass:TGraphicClass);//0046A8EC
    procedure Add(Fmt:Word; AClass:TGraphicClass);//0046A848
    constructor Create();//0046A788
    destructor Destroy();//0046A810
  public
    FClasses:TList;//f4
    FFormats:TList;//f8
  end;
  TBitmapCanvas = class(TCanvas)
  published
    destructor Destroy();//0046C880
    constructor Create;//0046C844
  public
    FBitmap:TBitmap;//f58
    FOldBitmap:HBITMAP;//f5C
    FOldPalette:HPALETTE;//f60
    destructor Destroy(); virtual;//0046C880
    procedure CreateHandle; virtual;//v9C//0046C950
    procedure FreeContext;//0046C8AC
  end;
  :TWICImage.:1 = array of Byte;
//elSize = 1
//varType equivalent: varByte;
  :TWICImage.:2 = array of Byte;
//elSize = 1
//varType equivalent: varByte;
  TPattern = TPattern = record//size=10
Next:PPattern;//f0
Bitmap:TBitmap;//f4
BkColorRef:Cardinal;//f8
FgColorRef:Cardinal;//fC
end;;
  TPatternManager = class(TObject)
  published
    procedure FreePatterns;//0047149C
    procedure Lock;//004712C4
    procedure Unlock;//004712D0
    function AllocPattern(BkColor:Cardinal; FgColor:Cardinal):PPattern;//004712DC
    constructor Create();//00471260
    destructor Destroy();//00471298
  public
    List:PPattern;//f4
    FLock:_RTL_CRITICAL_SECTION;//f8
    function CreateBitmap(BkColor:TColor; FgColor:TColor):TBitmap;//00471390
  end;
    procedure InternalDeletePalette(Pal:HPALETTE);//00464E2C
    function GetHashCode(const Buffer:void ; Count:Integer):Word;//004651E8
    procedure sub_004654DC;//004654DC
    procedure FreeObjects(Resource:PResource);//00465574
    procedure ClearColor(ResMan:TResourceManager);//0046558C
    procedure PaletteChanged;//00465610
    function ColorToRGB(Color:TColor):LongInt;//00465E0C
    function ColorToIdent(Color:LongInt; var Ident:UnicodeString):Boolean;//00465E1C
    function IdentToColor(const Ident:UnicodeString; var Color:LongInt):Boolean;//00465E2C
    procedure Changed;//00465E3C
    function CharsetToIdent(Charset:LongInt; var Ident:UnicodeString):Boolean;//00466190
    function IdentToCharset(const Ident:UnicodeString; var Charset:LongInt):Boolean;//004661A0
    function GetFontData(Font:HFONT):TFontData;//004661B0
    procedure Changed;//00466350
    function IsDefaultFont(const FontData:TFontData):Boolean;//004664B8
    function GetPenData(Pen:HPEN):TPenData;//004669BC
    function GetBrushData(Brush:HBRUSH):TBrushData;//00466DFC
    procedure Changed;//00467220
    procedure Changing;//00467234
    function GetCanvasOrientation:TCanvasOrientation;//00467E84
    function GetPenPos:TPoint;//00468104
    procedure SetPenPos(Value:TPoint);//0046812C
    function GetPixel(X:Integer; Y:Integer):TColor;//0046814C
    procedure SetPixel(X:Integer; Y:Integer; Value:TColor);//00468178
    function GetClipRect:TRect;//004681C0
    procedure CreateHandle;//0046826C
    procedure RequiredState(ReqState:TCanvasState);//004682C4
    procedure InvalidOperation(Str:PResStringRec);//00468470
    procedure InvalidGraphic(Str:PResStringRec);//00468488
    procedure InvalidBitmap;//004684A0
    procedure InvalidIcon;//004684AC
    procedure InvalidMetafile;//004684B8
    procedure OutOfResources;//004684C4
    procedure GDIError;//00468518
    function GDICheck(Value:Integer):Integer;//004685C0
    function DupBits(Src:HBITMAP; Size:TPoint; Mono:Boolean):HBITMAP;//004685D0
    function GetDInColors(BitCount:Word):Integer;//00468730
    function BytesPerScanline(PixelsPerScanline:LongInt; BitsPerPixel:LongInt; Alignment:LongInt):LongInt;//00468750
    function TransparentStretchBlt(DstDC:HDC; DstX:Integer; DstY:Integer; DstW:Integer; DstH:Integer; SrcDC:HDC; SrcX:Integer; SrcY:Integer; SrcW:Integer; SrcH:Integer; MaskDC:HDC; MaskX:Integer; MaskY:Integer):Boolean;//00468770
    procedure RGBTripleToQuad(var ColorTable:void );//004689FC
    procedure RGBQuadToTriple(var ColorTable:void ; var ColorCount:Integer);//00468A38
    procedure ByteSwapColors(var Colors:void ; Count:Integer);//00468AB4
    function CreateSystemPalette(const Entries:array[$0..-$1] of TColor; const _Dv_:$0..-$1):HPALETTE;//00468B08
    function SystemPaletteOverride(var Pal:TMaxLogPalette):Boolean;//00468C20
    function PaletteFromDIBColorTable(DIBHandle:THandle; ColorTable:Pointer; ColorCount:Integer):HPALETTE;//00468CB8
    function PaletteToDIBColorTable(Pal:HPALETTE; var ColorTable:array[$0..-$1] of Windows.TRGBQuad; const _Dv_:$0..-$1):Integer;//00468D5C
    procedure TwoBitsFromDIB(var BI:TBitmapInfoHeader; var XorBits:HBITMAP; var AndBits:HBITMAP; const IconSize:TPoint);//00468DB0
    function BetterSize(const Old:TIconRec; const New:TIconRec):Boolean;//00468F70
    procedure ReadIcon(Stream:TStream; var Icon:HICON; ImageCount:Integer; StartOffset:Integer; const RequestedSize:TPoint; var IconSize:TPoint);//00469054
    function ComputeAldusChecksum(var WMF:TMetafileHeader):Word;//0046938C
    procedure InitializeBitmapInfoHeader(Bitmap:HBITMAP; var BI:TBitmapInfoHeader; Colors:Integer);//004693C4
    procedure InternalGetDIBSizes(Bitmap:HBITMAP; var InfoHeaderSize:DWORD; var ImageSize:DWORD; Colors:Integer);//004694A8
    procedure GetDIBSizes(Bitmap:HBITMAP; var InfoHeaderSize:DWORD; var ImageSize:DWORD);//00469510
    function InternalGetDIB(Bitmap:HBITMAP; Palette:HPALETTE; var BitmapInfo:void ; var Bits:void ; Colors:Integer):Boolean;//00469518
    function GetDIB(Bitmap:HBITMAP; Palette:HPALETTE; var BitmapInfo:void ; var Bits:void ):Boolean;//004695CC
    procedure WinError;//004695E0
    procedure CheckBool(Result:BOOL);//004695E4
    procedure WriteIcon(Stream:TStream; Icon:HICON; WriteLength:Boolean);//004695F0
    procedure Changed(Sender:TObject);//00469828
    function DoWrite:Boolean;//00469840
    procedure DefineProperties(Filer:TFiler);//00469898
    procedure DrawTransparent(ACanvas:TCanvas; const Rect:TRect; Opacity:Byte);//004698EC
    function Equals(Graphic:TGraphic):Boolean;//00469900
    //function sub_00469A70:?;//00469A70
    //function sub_00469A74:?;//00469A74
    //function sub_00469A78:?;//00469A78
    procedure Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:UnicodeString);//00469AD4
    procedure ReadData(Stream:TStream);//00469B00
    procedure sub_00469B64;//00469B64
    procedure SetTransparent(Value:Boolean);//00469B98
    procedure WriteData(Stream:TStream);//00469BA8
    function GetFileFormats:TFileFormatsList;//0046A934
    function GetClipboardFormats:TClipboardFormats;//0046A954
    procedure AssignTo(Dest:TPersistent);//0046A9E4
    procedure Changed(Sender:TObject);//0046AEF8
    procedure Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:UnicodeString);//0046AF1C
    function DoWrite:Boolean;//0046B144
    procedure DefineProperties(Filer:TFiler);//0046B1C0
    procedure FreeHandle;//0046B280
    procedure Draw(ACanvas:TCanvas; const Rect:TRect);//0046B6E8
    function GetEmpty:Boolean;//0046B860
    function GetHeight:Integer;//0046B88C
    function GetPalette:HPALETTE;//0046B930
    function GetWidth:Integer;//0046B9BC
    procedure ReadData(Stream:TStream);//0046BA9C
    procedure SetHeight(Value:Integer);//0046BED4
    procedure SetTransparent(Value:Boolean);//0046BFF8
    procedure SetWidth(Value:Integer);//0046BFFC
    procedure WriteData(Stream:TStream);//0046C154
    procedure FreeMemoryContexts;//0046C718
    procedure DeselectBitmap(AHandle:HBITMAP);//0046C7C4
    procedure CreateHandle;//0046C950
    procedure FreeHandle;//0046CAEC
    procedure UpdateDIBColorTable(DIBHandle:HBITMAP; Pal:HPALETTE; const DIB:TDIBSection);//0046CB38
    procedure FixupBitFields(var DIB:TDIBSection);//0046CBF4
    function CopyBitmap(Handle:HBITMAP; OldPalette:HPALETTE; NewPalette:HPALETTE; var DIB:TDIBSection; Canvas:TCanvas):HBITMAP;//0046CC40
    function CopyPalette(Palette:HPALETTE):HPALETTE;//0046D2A4
    function CopyBitmapAsMask(Handle:HBITMAP; Palette:HPALETTE; TransparentColor:TColorRef):HBITMAP;//0046D308
    procedure Changed(Sender:TObject);//0046D7C4
    procedure Draw(ACanvas:TCanvas; const Rect:TRect);//0046D84C
    procedure DrawTransparent(ACanvas:TCanvas; const Rect:TRect; Opacity:Byte);//0046DAF8
    function GetEmpty:Boolean;//0046DE18
    function GetHandle:HBITMAP;//0046DE7C
    function GetHeight:Integer;//0046DEE0
    function GetMaskHandle:HBITMAP;//0046DEF0
    function GetPalette:HPALETTE;//0046DF20
    function GetSupportsPartialTransparency:Boolean;//0046E020
    //function GetWidth:?;//0046E244
    procedure ReadData(Stream:TStream);//0046E7F4
    procedure SetHandleType(Value:TBitmapHandleType);//0046EEE0
    procedure SetHeight(Value:Integer);//0046F01C
    procedure SetPalette(Value:HPALETTE);//0046F0BC
    procedure SetWidth(Value:Integer);//0046F374
    procedure WriteData(Stream:TStream);//0046F384
    procedure FreeHandle;//0046F814
    function HasAlpha(Buf:PRGBQuad; CX:Integer; CY:Integer):Boolean;//0046F82C
    procedure Draw(ACanvas:TCanvas; const Rect:TRect);//0046FC0C
    function GetEmpty:Boolean;//0046FC50
    function GetHeight:Integer;//0046FC90
    function GetWidth:Integer;//0046FCBC
    procedure SetHeight(Value:Integer);//00470054
    procedure SetTransparent(Value:Boolean);//0047008C
    procedure SetWidth(Value:Integer);//00470090
    procedure AssignTo(Dest:TPersistent);//00470278
    procedure Draw(ACanvas:TCanvas; const Rect:TRect);//00470530
    function GetEmpty:Boolean;//0047055C
    //function GetHeight:?;//00470578
    //function GetWidth:?;//0047057C
    procedure WicCheck(Result:HRESULT);//00470580
    procedure SetHeight(Value:Integer);//00470B3C
    procedure SetWidth(Value:Integer);//00470B48
    procedure InitScreenLogPixels;//00470D54
    function GetDefFontCharSet:TFontCharset;//00470DB8
    procedure InitDefFontData;//00470DFC
    function AllocPatternBitmap(BkColor:TColor; FgColor:TColor):TBitmap;//0047151C

implementation

//00461214
procedure TCustomCanvas.Arc(X1:Integer; Y1:Integer; Y4:Integer; X4:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer);
begin
{*
>00461214    jmp         @AbstractError
*}
end;

//0046121C
procedure TCustomCanvas.ArcTo(X1:Integer; Y1:Integer; Y4:Integer; X4:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer);
begin
{*
>0046121C    jmp         @AbstractError
*}
end;

//00461224
procedure TCustomCanvas.AngleArc(X:Integer; Y:Integer; SweepAngle:Single; StartAngle:Single; Radius:Cardinal);
begin
{*
>00461224    jmp         @AbstractError
*}
end;

//0046122C
procedure TCustomCanvas.BrushCopy(Dest:TRect; Bitmap:TBitmap; Color:TColor; Source:TRect);
begin
{*
>0046122C    jmp         @AbstractError
*}
end;

//00461234
procedure TCustomCanvas.Chord(X1:Integer; Y1:Integer; Y4:Integer; X4:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer);
begin
{*
>00461234    jmp         @AbstractError
*}
end;

//0046123C
procedure TCustomCanvas.Draw(X:Integer; Y:Integer; Graphic:TGraphic);
begin
{*
>0046123C    jmp         @AbstractError
*}
end;

//00461244
procedure TCustomCanvas.Draw(X:Integer; Y:Integer; Opacity:Byte; Graphic:TGraphic);
begin
{*
>00461244    jmp         @AbstractError
*}
end;

//0046124C
procedure TCustomCanvas.DrawFocusRect(Rect:TRect);
begin
{*
>0046124C    jmp         @AbstractError
*}
end;

//00461254
procedure TCustomCanvas.Ellipse(X1:Integer; Y1:Integer; Y2:Integer; X2:Integer);
begin
{*
>00461254    jmp         @AbstractError
*}
end;

//0046125C
procedure TCustomCanvas.FillRect(Rect:TRect);
begin
{*
>0046125C    jmp         @AbstractError
*}
end;

//00461264
procedure TCustomCanvas.FloodFill(X:Integer; Y:Integer; FillStyle:TFillStyle; Color:TColor);
begin
{*
>00461264    jmp         @AbstractError
*}
end;

//0046126C
procedure TCustomCanvas.FrameRect(Rect:TRect);
begin
{*
>0046126C    jmp         @AbstractError
*}
end;

//00461274
procedure TCustomCanvas.LineTo(X:Integer; Y:Integer);
begin
{*
>00461274    jmp         @AbstractError
*}
end;

//0046127C
procedure TCustomCanvas.MoveTo(X:Integer; Y:Integer);
begin
{*
>0046127C    jmp         @AbstractError
*}
end;

//00461284
procedure TCustomCanvas.Pie(X1:Integer; Y1:Integer; Y4:Integer; X4:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer);
begin
{*
>00461284    jmp         @AbstractError
*}
end;

//0046128C
procedure TCustomCanvas.Polygon;
begin
{*
>0046128C    jmp         @AbstractError
*}
end;

//00461294
procedure TCustomCanvas.Polyline;
begin
{*
>00461294    jmp         @AbstractError
*}
end;

//0046129C
procedure TCustomCanvas.PolyBezier;
begin
{*
>0046129C    jmp         @AbstractError
*}
end;

//004612A4
procedure TCustomCanvas.PolyBezierTo;
begin
{*
>004612A4    jmp         @AbstractError
*}
end;

//004612AC
procedure TCustomCanvas.Rectangle(X1:Integer; Y1:Integer; Y2:Integer; X2:Integer);
begin
{*
>004612AC    jmp         @AbstractError
*}
end;

//004612B4
procedure TCustomCanvas.Refresh;
begin
{*
>004612B4    jmp         @AbstractError
*}
end;

//004612BC
procedure TCustomCanvas.RoundRect(X1:Integer; Y1:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer);
begin
{*
>004612BC    jmp         @AbstractError
*}
end;

//004612C4
procedure TCustomCanvas.StretchDraw(Rect:TRect; Graphic:TGraphic);
begin
{*
>004612C4    jmp         @AbstractError
*}
end;

//004612CC
procedure TCustomCanvas.TextExtent(Text:string);
begin
{*
>004612CC    jmp         @AbstractError
*}
end;

//004612D4
procedure TCustomCanvas.TextOut(X:Integer; Y:Integer; Text:string);
begin
{*
>004612D4    jmp         @AbstractError
*}
end;

//004612DC
procedure TCustomCanvas.TextRect(var Rect:TRect; var Text:string; TextFormat:TTextFormat);
begin
{*
>004612DC    jmp         @AbstractError
*}
end;

//004612E4
procedure TCustomCanvas.TextRect(Rect:TRect; X:Integer; Text:string; Y:Integer);
begin
{*
>004612E4    jmp         @AbstractError
*}
end;

//004626F4
procedure TGraphic.LoadFromStream(Stream:TStream);
begin
{*
>004626F4    jmp         @AbstractError
*}
end;

//004626FC
procedure TGraphic.SaveToStream(Stream:TStream);
begin
{*
>004626FC    jmp         @AbstractError
*}
end;

//00462704
procedure TGraphic.LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE);
begin
{*
>00462704    jmp         @AbstractError
*}
end;

//0046270C
procedure TGraphic.SaveToClipboardFormat(var AFormat:Word; var AData:Cardinal; var APalette:HPALETTE);
begin
{*
>0046270C    jmp         @AbstractError
*}
end;

//00464E2C
procedure InternalDeletePalette(Pal:HPALETTE);
begin
{*
 00464E2C    test        eax,eax
>00464E2E    je          00464E3E
 00464E30    cmp         eax,dword ptr ds:[793050]
>00464E36    je          00464E3E
 00464E38    push        eax
 00464E39    call        gdi32.DeleteObject
 00464E3E    ret
*}
end;

//004651E8
function GetHashCode(const Buffer:void ; Count:Integer):Word;
begin
{*
 004651E8    mov         ecx,edx
 004651EA    mov         edx,eax
 004651EC    xor         eax,eax
 004651EE    rol         ax,5
 004651F2    xor         al,byte ptr [edx]
 004651F4    inc         edx
 004651F5    dec         ecx
>004651F6    jne         004651EE
 004651F8    ret
*}
end;

//004651FC
constructor TResourceManager.Create;
begin
{*
 004651FC    push        ebx
 004651FD    push        esi
 004651FE    test        dl,dl
>00465200    je          0046520A
 00465202    add         esp,0FFFFFFF0
 00465205    call        @ClassCreate
 0046520A    mov         ebx,edx
 0046520C    mov         esi,eax
 0046520E    mov         word ptr [esi+20],cx
 00465212    lea         eax,[esi+8]
 00465215    push        eax
 00465216    call        kernel32.InitializeCriticalSection
 0046521B    mov         eax,esi
 0046521D    test        bl,bl
>0046521F    je          00465230
 00465221    call        @AfterConstruction
 00465226    pop         dword ptr fs:[0]
 0046522D    add         esp,0C
 00465230    mov         eax,esi
 00465232    pop         esi
 00465233    pop         ebx
 00465234    ret
*}
end;

//00465238
destructor TResourceManager.Destroy();
begin
{*
 00465238    push        ebx
 00465239    push        esi
 0046523A    call        @BeforeDestruction
 0046523F    mov         ebx,edx
 00465241    mov         esi,eax
 00465243    lea         eax,[esi+8]
 00465246    push        eax
 00465247    call        kernel32.DeleteCriticalSection
 0046524C    test        bl,bl
>0046524E    jle         00465257
 00465250    mov         eax,esi
 00465252    call        @ClassDestroy
 00465257    pop         esi
 00465258    pop         ebx
 00465259    ret
*}
end;

//0046525C
procedure TResourceManager.Lock;
begin
{*
 0046525C    add         eax,8
 0046525F    push        eax
 00465260    call        kernel32.EnterCriticalSection
 00465265    ret
*}
end;

//00465268
procedure TResourceManager.Unlock;
begin
{*
 00465268    add         eax,8
 0046526B    push        eax
 0046526C    call        kernel32.LeaveCriticalSection
 00465271    ret
*}
end;

//00465274
{*function TResourceManager.AllocResource(ResData:?):PResource;
begin
 00465274    push        ebp
 00465275    mov         ebp,esp
 00465277    add         esp,0FFFFFFF0
 0046527A    push        ebx
 0046527B    push        esi
 0046527C    push        edi
 0046527D    mov         ebx,edx
 0046527F    mov         dword ptr [ebp-4],eax
 00465282    mov         eax,dword ptr [ebp-4]
 00465285    movzx       edx,word ptr [eax+20]
 00465289    mov         eax,ebx
 0046528B    call        GetHashCode
 00465290    mov         esi,eax
 00465292    mov         eax,dword ptr [ebp-4]
 00465295    mov         dword ptr [ebp-0C],eax
 00465298    mov         eax,dword ptr [ebp-0C]
 0046529B    add         eax,8
 0046529E    push        eax
 0046529F    call        kernel32.EnterCriticalSection
 004652A4    xor         edx,edx
 004652A6    push        ebp
 004652A7    push        465370
 004652AC    push        dword ptr fs:[edx]
 004652AF    mov         dword ptr fs:[edx],esp
 004652B2    call        TThread.GetCurrentThread
 004652B7    mov         edi,dword ptr [eax+8]
 004652BA    mov         eax,dword ptr [ebp-4]
 004652BD    mov         eax,dword ptr [eax+4]
 004652C0    mov         dword ptr [ebp-8],eax
>004652C3    jmp         004652CD
 004652C5    mov         eax,dword ptr [ebp-8]
 004652C8    mov         eax,dword ptr [eax]
 004652CA    mov         dword ptr [ebp-8],eax
 004652CD    cmp         dword ptr [ebp-8],0
>004652D1    je          004652FC
 004652D3    mov         eax,dword ptr [ebp-8]
 004652D6    cmp         edi,dword ptr [eax+10]
>004652D9    jne         004652C5
 004652DB    mov         eax,dword ptr [ebp-8]
 004652DE    cmp         si,word ptr [eax+0C]
>004652E2    jne         004652C5
 004652E4    mov         eax,dword ptr [ebp-4]
 004652E7    movzx       ecx,word ptr [eax+20]
 004652EB    mov         edx,ebx
 004652ED    mov         eax,dword ptr [ebp-8]
 004652F0    add         eax,14
 004652F3    call        CompareMem
 004652F8    test        al,al
>004652FA    je          004652C5
 004652FC    cmp         dword ptr [ebp-8],0
>00465300    jne         0046534A
 00465302    mov         eax,dword ptr [ebp-4]
 00465305    movzx       eax,word ptr [eax+20]
 00465309    add         eax,14
 0046530C    call        @GetMem
 00465311    mov         dword ptr [ebp-8],eax
 00465314    mov         eax,dword ptr [ebp-8]
 00465317    mov         edx,dword ptr [ebp-4]
 0046531A    mov         edx,dword ptr [edx+4]
 0046531D    mov         dword ptr [eax],edx
 0046531F    xor         edx,edx
 00465321    mov         dword ptr [eax+4],edx
 00465324    mov         edx,dword ptr [ebx]
 00465326    mov         dword ptr [eax+8],edx
 00465329    mov         word ptr [eax+0C],si
 0046532D    mov         dword ptr [eax+10],edi
 00465330    mov         edx,dword ptr [ebp-4]
 00465333    movzx       ecx,word ptr [edx+20]
 00465337    lea         edx,[eax+14]
 0046533A    mov         eax,ebx
 0046533C    call        Move
 00465341    mov         eax,dword ptr [ebp-4]
 00465344    mov         edx,dword ptr [ebp-8]
 00465347    mov         dword ptr [eax+4],edx
 0046534A    mov         eax,dword ptr [ebp-8]
 0046534D    inc         dword ptr [eax+4]
 00465350    xor         eax,eax
 00465352    pop         edx
 00465353    pop         ecx
 00465354    pop         ecx
 00465355    mov         dword ptr fs:[eax],edx
 00465358    push        465377
 0046535D    mov         eax,dword ptr [ebp-4]
 00465360    mov         dword ptr [ebp-10],eax
 00465363    mov         eax,dword ptr [ebp-10]
 00465366    add         eax,8
 00465369    push        eax
 0046536A    call        kernel32.LeaveCriticalSection
 0046536F    ret
>00465370    jmp         @HandleFinally
>00465375    jmp         0046535D
 00465377    mov         eax,dword ptr [ebp-8]
 0046537A    pop         edi
 0046537B    pop         esi
 0046537C    pop         ebx
 0046537D    mov         esp,ebp
 0046537F    pop         ebp
 00465380    ret
end;*}

//00465384
procedure TResourceManager.FreeResource(Resource:PResource);
begin
{*
 00465384    push        ebp
 00465385    mov         ebp,esp
 00465387    add         esp,0FFFFFFE8
 0046538A    mov         dword ptr [ebp-8],edx
 0046538D    mov         dword ptr [ebp-4],eax
 00465390    cmp         dword ptr [ebp-8],0
>00465394    je          0046544E
 0046539A    mov         eax,dword ptr [ebp-8]
 0046539D    mov         dword ptr [ebp-10],eax
 004653A0    mov         eax,dword ptr [ebp-4]
 004653A3    mov         dword ptr [ebp-14],eax
 004653A6    mov         eax,dword ptr [ebp-14]
 004653A9    add         eax,8
 004653AC    push        eax
 004653AD    call        kernel32.EnterCriticalSection
 004653B2    xor         ecx,ecx
 004653B4    push        ebp
 004653B5    push        46541F
 004653BA    push        dword ptr fs:[ecx]
 004653BD    mov         dword ptr fs:[ecx],esp
 004653C0    mov         eax,dword ptr [ebp-10]
 004653C3    dec         dword ptr [eax+4]
 004653C6    mov         eax,dword ptr [ebp-10]
 004653C9    cmp         dword ptr [eax+4],0
 004653CD    sete        byte ptr [ebp-9]
 004653D1    cmp         byte ptr [ebp-9],0
>004653D5    je          004653FF
 004653D7    mov         eax,dword ptr [ebp-4]
 004653DA    mov         eax,dword ptr [eax+4]
 004653DD    cmp         eax,dword ptr [ebp-8]
>004653E0    jne         004653F1
 004653E2    mov         eax,dword ptr [ebp-8]
 004653E5    mov         eax,dword ptr [eax]
 004653E7    mov         edx,dword ptr [ebp-4]
 004653EA    mov         dword ptr [edx+4],eax
>004653ED    jmp         004653FF
 004653EF    mov         eax,edx
 004653F1    mov         edx,dword ptr [eax]
 004653F3    cmp         edx,dword ptr [ebp-8]
>004653F6    jne         004653EF
 004653F8    mov         edx,dword ptr [ebp-8]
 004653FB    mov         edx,dword ptr [edx]
 004653FD    mov         dword ptr [eax],edx
 004653FF    xor         eax,eax
 00465401    pop         edx
 00465402    pop         ecx
 00465403    pop         ecx
 00465404    mov         dword ptr fs:[eax],edx
 00465407    push        465426
 0046540C    mov         eax,dword ptr [ebp-4]
 0046540F    mov         dword ptr [ebp-18],eax
 00465412    mov         eax,dword ptr [ebp-18]
 00465415    add         eax,8
 00465418    push        eax
 00465419    call        kernel32.LeaveCriticalSection
 0046541E    ret
>0046541F    jmp         @HandleFinally
>00465424    jmp         0046540C
 00465426    cmp         byte ptr [ebp-9],0
>0046542A    je          0046544E
 0046542C    mov         eax,dword ptr [ebp-10]
 0046542F    mov         eax,dword ptr [eax+8]
 00465432    test        eax,eax
>00465434    je          0046543C
 00465436    push        eax
 00465437    call        gdi32.DeleteObject
 0046543C    mov         edx,dword ptr [ebp-8]
 0046543F    mov         eax,dword ptr [ebp-4]
 00465442    mov         ecx,dword ptr [eax]
 00465444    call        dword ptr [ecx]
 00465446    mov         eax,dword ptr [ebp-8]
 00465449    call        @FreeMem
 0046544E    mov         esp,ebp
 00465450    pop         ebp
 00465451    ret
*}
end;

//00465454
{*procedure TResourceManager.ChangeResource(GraphicsObject:TGraphicsObject; ResData:?);
begin
 00465454    push        ebp
 00465455    mov         ebp,esp
 00465457    add         esp,0FFFFFFF0
 0046545A    push        ebx
 0046545B    push        esi
 0046545C    push        edi
 0046545D    mov         dword ptr [ebp-8],ecx
 00465460    mov         ebx,edx
 00465462    mov         dword ptr [ebp-4],eax
 00465465    mov         eax,dword ptr [ebp-4]
 00465468    mov         dword ptr [ebp-0C],eax
 0046546B    mov         eax,dword ptr [ebp-0C]
 0046546E    add         eax,8
 00465471    push        eax
 00465472    call        kernel32.EnterCriticalSection
 00465477    xor         eax,eax
 00465479    push        ebp
 0046547A    push        4654CD
 0046547F    push        dword ptr fs:[eax]
 00465482    mov         dword ptr fs:[eax],esp
 00465485    mov         esi,dword ptr [ebx+10]
 00465488    mov         edx,dword ptr [ebp-8]
 0046548B    mov         eax,dword ptr [ebp-4]
 0046548E    call        TResourceManager.AllocResource
 00465493    mov         edi,eax
 00465495    mov         dword ptr [ebx+10],edi
 00465498    cmp         esi,edi
>0046549A    je          004654A3
 0046549C    mov         eax,ebx
 0046549E    mov         edx,dword ptr [eax]
 004654A0    call        dword ptr [edx+0C]
 004654A3    mov         edx,esi
 004654A5    mov         eax,dword ptr [ebp-4]
 004654A8    call        TResourceManager.FreeResource
 004654AD    xor         eax,eax
 004654AF    pop         edx
 004654B0    pop         ecx
 004654B1    pop         ecx
 004654B2    mov         dword ptr fs:[eax],edx
 004654B5    push        4654D4
 004654BA    mov         eax,dword ptr [ebp-4]
 004654BD    mov         dword ptr [ebp-10],eax
 004654C0    mov         eax,dword ptr [ebp-10]
 004654C3    add         eax,8
 004654C6    push        eax
 004654C7    call        kernel32.LeaveCriticalSection
 004654CC    ret
>004654CD    jmp         @HandleFinally
>004654D2    jmp         004654BA
 004654D4    pop         edi
 004654D5    pop         esi
 004654D6    pop         ebx
 004654D7    mov         esp,ebp
 004654D9    pop         ebp
 004654DA    ret
end;*}

//004654DC
procedure sub_004654DC;
begin
{*
 004654DC    ret
*}
end;

//004654E0
procedure TResourceManager.AssignResource(GraphicsObject:TGraphicsObject; AResource:PResource);
begin
{*
 004654E0    push        ebp
 004654E1    mov         ebp,esp
 004654E3    add         esp,0FFFFFFF4
 004654E6    push        ebx
 004654E7    push        esi
 004654E8    push        edi
 004654E9    mov         esi,ecx
 004654EB    mov         edi,edx
 004654ED    mov         dword ptr [ebp-4],eax
 004654F0    mov         eax,dword ptr [ebp-4]
 004654F3    mov         dword ptr [ebp-8],eax
 004654F6    mov         eax,dword ptr [ebp-8]
 004654F9    add         eax,8
 004654FC    push        eax
 004654FD    call        kernel32.EnterCriticalSection
 00465502    xor         eax,eax
 00465504    push        ebp
 00465505    push        465565
 0046550A    push        dword ptr fs:[eax]
 0046550D    mov         dword ptr fs:[eax],esp
 00465510    mov         ebx,dword ptr [edi+10]
 00465513    cmp         esi,ebx
>00465515    je          00465545
 00465517    mov         eax,dword ptr [ebx+10]
 0046551A    cmp         eax,dword ptr [esi+10]
>0046551D    jne         00465538
 0046551F    inc         dword ptr [esi+4]
 00465522    mov         dword ptr [edi+10],esi
 00465525    mov         eax,edi
 00465527    mov         edx,dword ptr [eax]
 00465529    call        dword ptr [edx+0C]
 0046552C    mov         edx,ebx
 0046552E    mov         eax,dword ptr [ebp-4]
 00465531    call        TResourceManager.FreeResource
>00465536    jmp         00465545
 00465538    lea         ecx,[esi+14]
 0046553B    mov         edx,edi
 0046553D    mov         eax,dword ptr [ebp-4]
 00465540    call        TResourceManager.ChangeResource
 00465545    xor         eax,eax
 00465547    pop         edx
 00465548    pop         ecx
 00465549    pop         ecx
 0046554A    mov         dword ptr fs:[eax],edx
 0046554D    push        46556C
 00465552    mov         eax,dword ptr [ebp-4]
 00465555    mov         dword ptr [ebp-0C],eax
 00465558    mov         eax,dword ptr [ebp-0C]
 0046555B    add         eax,8
 0046555E    push        eax
 0046555F    call        kernel32.LeaveCriticalSection
 00465564    ret
>00465565    jmp         @HandleFinally
>0046556A    jmp         00465552
 0046556C    pop         edi
 0046556D    pop         esi
 0046556E    pop         ebx
 0046556F    mov         esp,ebp
 00465571    pop         ebp
 00465572    ret
*}
end;

//00465574
procedure TBrushResourceManager.FreeObjects(Resource:PResource);
begin
{*
 00465574    cmp         byte ptr [edx+21],0
>00465578    je          0046558A
 0046557A    lea         eax,[edx+1C]
 0046557D    mov         edx,dword ptr [eax]
 0046557F    xor         ecx,ecx
 00465581    mov         dword ptr [eax],ecx
 00465583    mov         eax,edx
 00465585    call        TObject.Free
 0046558A    ret
*}
end;

//0046558C
procedure ClearColor(ResMan:TResourceManager);
begin
{*
 0046558C    push        ebp
 0046558D    mov         ebp,esp
 0046558F    add         esp,0FFFFFFF4
 00465592    push        ebx
 00465593    push        esi
 00465594    push        edi
 00465595    mov         dword ptr [ebp-4],eax
 00465598    mov         eax,dword ptr [ebp-4]
 0046559B    mov         dword ptr [ebp-8],eax
 0046559E    mov         eax,dword ptr [ebp-8]
 004655A1    add         eax,8
 004655A4    push        eax
 004655A5    call        kernel32.EnterCriticalSection
 004655AA    xor         eax,eax
 004655AC    push        ebp
 004655AD    push        465602
 004655B2    push        dword ptr fs:[eax]
 004655B5    mov         dword ptr fs:[eax],esp
 004655B8    mov         eax,dword ptr [ebp-4]
 004655BB    mov         ebx,dword ptr [eax+4]
 004655BE    test        ebx,ebx
>004655C0    je          004655E2
 004655C2    mov         esi,ebx
 004655C4    mov         edi,dword ptr [esi+8]
 004655C7    test        edi,edi
>004655C9    je          004655DC
 004655CB    cmp         dword ptr [esi+18],0
>004655CF    jge         004655DC
 004655D1    push        edi
 004655D2    call        gdi32.DeleteObject
 004655D7    xor         eax,eax
 004655D9    mov         dword ptr [esi+8],eax
 004655DC    mov         ebx,dword ptr [ebx]
 004655DE    test        ebx,ebx
>004655E0    jne         004655C2
 004655E2    xor         eax,eax
 004655E4    pop         edx
 004655E5    pop         ecx
 004655E6    pop         ecx
 004655E7    mov         dword ptr fs:[eax],edx
 004655EA    push        465609
 004655EF    mov         eax,dword ptr [ebp-4]
 004655F2    mov         dword ptr [ebp-0C],eax
 004655F5    mov         eax,dword ptr [ebp-0C]
 004655F8    add         eax,8
 004655FB    push        eax
 004655FC    call        kernel32.LeaveCriticalSection
 00465601    ret
>00465602    jmp         @HandleFinally
>00465607    jmp         004655EF
 00465609    pop         edi
 0046560A    pop         esi
 0046560B    pop         ebx
 0046560C    mov         esp,ebp
 0046560E    pop         ebp
 0046560F    ret
*}
end;

//00465610
procedure PaletteChanged;
begin
{*
 00465610    push        ebp
 00465611    mov         ebp,esp
 00465613    add         esp,0FFFFFFF8
 00465616    push        ebx
 00465617    push        esi
 00465618    xor         eax,eax
 0046561A    mov         dword ptr [ebp-4],eax
 0046561D    mov         eax,[007930A8]
 00465622    call        TThreadList.LockList
 00465627    mov         dword ptr [ebp-8],eax
 0046562A    xor         edx,edx
 0046562C    push        ebp
 0046562D    push        4656B0
 00465632    push        dword ptr fs:[edx]
 00465635    mov         dword ptr fs:[edx],esp
>00465638    jmp         00465658
 0046563A    mov         edx,dword ptr [ebp-4]
 0046563D    mov         eax,dword ptr [ebp-8]
 00465640    call        TList.Get
 00465645    mov         ebx,eax
 00465647    mov         eax,ebx
 00465649    call        TCustomCanvas.Lock
 0046564E    inc         dword ptr [ebp-4]
 00465651    mov         eax,ebx
 00465653    call        TCanvas.DeselectHandles
 00465658    mov         eax,dword ptr [ebp-8]
 0046565B    mov         eax,dword ptr [eax+8]
 0046565E    cmp         eax,dword ptr [ebp-4]
>00465661    jg          0046563A
 00465663    mov         eax,[007930A0];gvar_007930A0
 00465668    call        ClearColor
 0046566D    mov         eax,[007930A4];gvar_007930A4
 00465672    call        ClearColor
 00465677    xor         eax,eax
 00465679    pop         edx
 0046567A    pop         ecx
 0046567B    pop         ecx
 0046567C    mov         dword ptr fs:[eax],edx
 0046567F    push        4656B7
 00465684    mov         ebx,dword ptr [ebp-4]
 00465687    dec         ebx
 00465688    test        ebx,ebx
>0046568A    jl          004656A2
 0046568C    inc         ebx
 0046568D    xor         esi,esi
 0046568F    mov         edx,esi
 00465691    mov         eax,dword ptr [ebp-8]
 00465694    call        TList.Get
 00465699    call        TCustomCanvas.Unlock
 0046569E    inc         esi
 0046569F    dec         ebx
>004656A0    jne         0046568F
 004656A2    mov         eax,[007930A8]
 004656A7    mov         eax,dword ptr [eax+8]
 004656AA    call        TMonitor.Exit
 004656AF    ret
>004656B0    jmp         @HandleFinally
>004656B5    jmp         00465684
 004656B7    pop         esi
 004656B8    pop         ebx
 004656B9    pop         ecx
 004656BA    pop         ecx
 004656BB    pop         ebp
 004656BC    ret
*}
end;

//00465E0C
function ColorToRGB(Color:TColor):LongInt;
begin
{*
 00465E0C    test        eax,eax
>00465E0E    jge         00465E1B
 00465E10    and         eax,0FF
 00465E15    push        eax
 00465E16    call        user32.GetSysColor
 00465E1B    ret
*}
end;

//00465E1C
function ColorToIdent(Color:LongInt; var Ident:UnicodeString):Boolean;
begin
{*
 00465E1C    push        33
 00465E1E    mov         ecx,785668
 00465E23    call        IntToIdent
 00465E28    ret
*}
end;

//00465E2C
function IdentToColor(const Ident:UnicodeString; var Color:LongInt):Boolean;
begin
{*
 00465E2C    push        33
 00465E2E    mov         ecx,785668
 00465E33    call        IdentToInt
 00465E38    ret
*}
end;

//00465E3C
procedure TCustomCanvas.Changed;
begin
{*
 00465E3C    push        ebx
 00465E3D    cmp         word ptr [eax+0A],0
>00465E42    je          00465E4E
 00465E44    mov         ebx,eax
 00465E46    mov         edx,eax
 00465E48    mov         eax,dword ptr [ebx+0C]
 00465E4B    call        dword ptr [ebx+8]
 00465E4E    pop         ebx
 00465E4F    ret
*}
end;

//00465E50
procedure TGraphicsObject.Lock;
begin
{*
 00465E50    mov         edx,dword ptr [eax+14]
 00465E53    test        edx,edx
>00465E55    je          00465E5D
 00465E57    push        edx
 00465E58    call        kernel32.EnterCriticalSection
 00465E5D    ret
*}
end;

//00465E60
procedure TGraphicsObject.Unlock;
begin
{*
 00465E60    mov         edx,dword ptr [eax+14]
 00465E63    test        edx,edx
>00465E65    je          00465E6D
 00465E67    push        edx
 00465E68    call        kernel32.LeaveCriticalSection
 00465E6D    ret
*}
end;

//00465E70
function TGraphicsObject.HandleAllocated:Boolean;
begin
{*
 00465E70    mov         edx,dword ptr [eax+10]
 00465E73    test        edx,edx
>00465E75    je          00465E7D
 00465E77    cmp         dword ptr [edx+8],0
>00465E7B    jne         00465E80
 00465E7D    xor         eax,eax
 00465E7F    ret
 00465E80    mov         al,1
 00465E82    ret
*}
end;

//00466190
function CharsetToIdent(Charset:LongInt; var Ident:UnicodeString):Boolean;
begin
{*
 00466190    push        11
 00466192    mov         ecx,785808
 00466197    call        IntToIdent
 0046619C    ret
*}
end;

//004661A0
function IdentToCharset(const Ident:UnicodeString; var Charset:LongInt):Boolean;
begin
{*
 004661A0    push        11
 004661A2    mov         ecx,785808
 004661A7    call        IdentToInt
 004661AC    ret
*}
end;

//004661B0
function GetFontData(Font:HFONT):TFontData;
begin
{*
 004661B0    push        ebp
 004661B1    mov         ebp,esp
 004661B3    add         esp,0FFFFFEA0
 004661B9    push        ebx
 004661BA    push        esi
 004661BB    push        edi
 004661BC    xor         ecx,ecx
 004661BE    mov         dword ptr [ebp-160],ecx
 004661C4    mov         ebx,edx
 004661C6    mov         esi,eax
 004661C8    xor         eax,eax
 004661CA    push        ebp
 004661CB    push        4662AD
 004661D0    push        dword ptr fs:[eax]
 004661D3    mov         dword ptr fs:[eax],esp
 004661D6    push        esi
 004661D7    mov         edi,ebx
 004661D9    mov         esi,7855D4
 004661DE    mov         ecx,24
 004661E3    rep movs    dword ptr [edi],dword ptr [esi]
 004661E5    pop         esi
 004661E6    test        esi,esi
>004661E8    je          00466294
 004661EE    lea         eax,[ebp-5C]
 004661F1    push        eax
 004661F2    push        5C
 004661F4    push        esi
 004661F5    call        gdi32.GetObjectW
 004661FA    test        eax,eax
>004661FC    je          00466294
 00466202    mov         eax,dword ptr [ebp-5C]
 00466205    mov         dword ptr [ebx+4],eax
 00466208    cmp         dword ptr [ebp-4C],2BC
>0046620F    jl          00466215
 00466211    or          byte ptr [ebx+0D],1
 00466215    cmp         byte ptr [ebp-48],1
>00466219    jne         0046621F
 0046621B    or          byte ptr [ebx+0D],2
 0046621F    cmp         byte ptr [ebp-47],1
>00466223    jne         00466229
 00466225    or          byte ptr [ebx+0D],4
 00466229    cmp         byte ptr [ebp-46],1
>0046622D    jne         00466233
 0046622F    or          byte ptr [ebx+0D],8
 00466233    movzx       eax,byte ptr [ebp-45]
 00466237    mov         byte ptr [ebx+0E],al
 0046623A    lea         eax,[ebp-160]
 00466240    lea         edx,[ebp-40]
 00466243    mov         ecx,20
 00466248    call        @UStrFromWArray
 0046624D    mov         eax,dword ptr [ebp-160]
 00466253    lea         edx,[ebp-15C]
 00466259    call        UTF8EncodeToShortString
 0046625E    lea         edx,[ebp-15C]
 00466264    lea         eax,[ebx+0F]
 00466267    mov         cl,7C
 00466269    call        @PStrNCpy
 0046626E    movzx       eax,byte ptr [ebp-41]
 00466272    and         al,0F
 00466274    dec         al
>00466276    je          00466282
 00466278    dec         al
>0046627A    jne         00466288
 0046627C    mov         byte ptr [ebx+0C],1
>00466280    jmp         0046628C
 00466282    mov         byte ptr [ebx+0C],2
>00466286    jmp         0046628C
 00466288    mov         byte ptr [ebx+0C],0
 0046628C    mov         dword ptr [ebx],esi
 0046628E    mov         eax,dword ptr [ebp-50]
 00466291    mov         dword ptr [ebx+8],eax
 00466294    xor         eax,eax
 00466296    pop         edx
 00466297    pop         ecx
 00466298    pop         ecx
 00466299    mov         dword ptr fs:[eax],edx
 0046629C    push        4662B4
 004662A1    lea         eax,[ebp-160]
 004662A7    call        @UStrClr
 004662AC    ret
>004662AD    jmp         @HandleFinally
>004662B2    jmp         004662A1
 004662B4    pop         edi
 004662B5    pop         esi
 004662B6    pop         ebx
 004662B7    mov         esp,ebp
 004662B9    pop         ebp
 004662BA    ret
*}
end;

//004662BC
constructor TFont.Create();
begin
{*
 004662BC    push        ebx
 004662BD    push        esi
 004662BE    test        dl,dl
>004662C0    je          004662CA
 004662C2    add         esp,0FFFFFFF0
 004662C5    call        @ClassCreate
 004662CA    mov         ebx,edx
 004662CC    mov         esi,eax
 004662CE    xor         edx,edx
 004662D0    mov         eax,esi
 004662D2    call        TObject.Create
 004662D7    xor         eax,eax
 004662D9    mov         [007855D4],eax
 004662DE    mov         edx,7855D4
 004662E3    mov         eax,[0079309C];gvar_0079309C
 004662E8    call        TResourceManager.AllocResource
 004662ED    mov         dword ptr [esi+10],eax
 004662F0    mov         dword ptr [esi+18],0FF000008
 004662F7    mov         eax,[00793058]
 004662FC    mov         dword ptr [esi+1C],eax
 004662FF    mov         eax,esi
 00466301    test        bl,bl
>00466303    je          00466314
 00466305    call        @AfterConstruction
 0046630A    pop         dword ptr fs:[0]
 00466311    add         esp,0C
 00466314    mov         eax,esi
 00466316    pop         esi
 00466317    pop         ebx
 00466318    ret
*}
end;

//0046631C
destructor TFont.Destroy();
begin
{*
 0046631C    push        ebx
 0046631D    push        esi
 0046631E    call        @BeforeDestruction
 00466323    mov         ebx,edx
 00466325    mov         esi,eax
 00466327    mov         edx,dword ptr [esi+10];TFont.FResource:PResource
 0046632A    mov         eax,[0079309C];gvar_0079309C
 0046632F    call        TResourceManager.FreeResource
 00466334    mov         edx,ebx
 00466336    and         dl,0FC
 00466339    mov         eax,esi
 0046633B    call        TMemoryStream.Destroy
 00466340    test        bl,bl
>00466342    jle         0046634B
 00466344    mov         eax,esi
 00466346    call        @ClassDestroy
 0046634B    pop         esi
 0046634C    pop         ebx
 0046634D    ret
*}
end;

//00466350
procedure TFont.Changed;
begin
{*
 00466350    push        ebx
 00466351    mov         ebx,eax
 00466353    mov         eax,ebx
 00466355    call        TCustomCanvas.Changed
 0046635A    cmp         dword ptr [ebx+20],0;TFont.FNotify:IChangeNotifier
>0046635E    je          00466368
 00466360    mov         eax,dword ptr [ebx+20];TFont.FNotify:IChangeNotifier
 00466363    mov         edx,dword ptr [eax]
 00466365    call        dword ptr [edx+0C]
 00466368    pop         ebx
 00466369    ret
*}
end;

//0046636C
procedure TFont.Assign(Source:TPersistent);
begin
{*
 0046636C    push        ebp
 0046636D    mov         ebp,esp
 0046636F    add         esp,0FFFFFFF8
 00466372    push        ebx
 00466373    mov         dword ptr [ebp-8],edx
 00466376    mov         dword ptr [ebp-4],eax
 00466379    mov         eax,dword ptr [ebp-8]
 0046637C    mov         edx,dword ptr ds:[45FAE8];TFont
 00466382    call        @IsClass
 00466387    test        al,al
>00466389    je          0046642E
 0046638F    mov         eax,dword ptr [ebp-4]
 00466392    call        TGraphicsObject.Lock
 00466397    xor         eax,eax
 00466399    push        ebp
 0046639A    push        466427
 0046639F    push        dword ptr fs:[eax]
 004663A2    mov         dword ptr fs:[eax],esp
 004663A5    mov         ebx,dword ptr [ebp-8]
 004663A8    mov         eax,ebx
 004663AA    call        TGraphicsObject.Lock
 004663AF    xor         eax,eax
 004663B1    push        ebp
 004663B2    push        46640A
 004663B7    push        dword ptr fs:[eax]
 004663BA    mov         dword ptr fs:[eax],esp
 004663BD    mov         ecx,dword ptr [ebx+10]
 004663C0    mov         edx,dword ptr [ebp-4]
 004663C3    mov         eax,[0079309C];gvar_0079309C
 004663C8    call        TResourceManager.AssignResource
 004663CD    mov         edx,dword ptr [ebx+18]
 004663D0    mov         eax,dword ptr [ebp-4]
 004663D3    call        TFont.SetColor
 004663D8    mov         eax,dword ptr [ebp-4]
 004663DB    mov         eax,dword ptr [eax+1C]
 004663DE    cmp         eax,dword ptr [ebx+1C]
>004663E1    je          004663F4
 004663E3    mov         eax,ebx
 004663E5    call        TFont.GetSize
 004663EA    mov         edx,eax
 004663EC    mov         eax,dword ptr [ebp-4]
 004663EF    call        TFont.SetSize
 004663F4    xor         eax,eax
 004663F6    pop         edx
 004663F7    pop         ecx
 004663F8    pop         ecx
 004663F9    mov         dword ptr fs:[eax],edx
 004663FC    push        466411
 00466401    mov         eax,dword ptr [ebp-8]
 00466404    call        TGraphicsObject.Unlock
 00466409    ret
>0046640A    jmp         @HandleFinally
>0046640F    jmp         00466401
 00466411    xor         eax,eax
 00466413    pop         edx
 00466414    pop         ecx
 00466415    pop         ecx
 00466416    mov         dword ptr fs:[eax],edx
 00466419    push        466439
 0046641E    mov         eax,dword ptr [ebp-4]
 00466421    call        TGraphicsObject.Unlock
 00466426    ret
>00466427    jmp         @HandleFinally
>0046642C    jmp         0046641E
 0046642E    mov         edx,dword ptr [ebp-8]
 00466431    mov         eax,dword ptr [ebp-4]
 00466434    call        TPersistent.Assign
 00466439    pop         ebx
 0046643A    pop         ecx
 0046643B    pop         ecx
 0046643C    pop         ebp
 0046643D    ret
*}
end;

//00466440
procedure TFont.GetData(var FontData:TFontData);
begin
{*
 00466440    push        esi
 00466441    push        edi
 00466442    mov         eax,dword ptr [eax+10]
 00466445    lea         esi,[eax+14]
 00466448    mov         edi,edx
 0046644A    mov         ecx,24
 0046644F    rep movs    dword ptr [edi],dword ptr [esi]
 00466451    xor         eax,eax
 00466453    mov         dword ptr [edx],eax
 00466455    pop         edi
 00466456    pop         esi
 00466457    ret
*}
end;

//00466458
procedure TFont.SetData(const FontData:TFontData);
begin
{*
 00466458    push        ebp
 00466459    mov         ebp,esp
 0046645B    push        ecx
 0046645C    push        ebx
 0046645D    mov         ebx,edx
 0046645F    mov         dword ptr [ebp-4],eax
 00466462    mov         eax,dword ptr [ebp-4]
 00466465    call        TGraphicsObject.Lock
 0046646A    xor         eax,eax
 0046646C    push        ebp
 0046646D    push        46649D
 00466472    push        dword ptr fs:[eax]
 00466475    mov         dword ptr fs:[eax],esp
 00466478    mov         ecx,ebx
 0046647A    mov         edx,dword ptr [ebp-4]
 0046647D    mov         eax,[0079309C];gvar_0079309C
 00466482    call        TResourceManager.ChangeResource
 00466487    xor         eax,eax
 00466489    pop         edx
 0046648A    pop         ecx
 0046648B    pop         ecx
 0046648C    mov         dword ptr fs:[eax],edx
 0046648F    push        4664A4
 00466494    mov         eax,dword ptr [ebp-4]
 00466497    call        TGraphicsObject.Unlock
 0046649C    ret
>0046649D    jmp         @HandleFinally
>004664A2    jmp         00466494
 004664A4    pop         ebx
 004664A5    pop         ecx
 004664A6    pop         ebp
 004664A7    ret
*}
end;

//004664A8
procedure TFont.SetColor(const Value:TColor);
begin
{*
 004664A8    cmp         edx,dword ptr [eax+18]
>004664AB    je          004664B5
 004664AD    mov         dword ptr [eax+18],edx
 004664B0    mov         edx,dword ptr [eax]
 004664B2    call        dword ptr [edx+0C]
 004664B5    ret
*}
end;

//004664B8
function IsDefaultFont(const FontData:TFontData):Boolean;
begin
{*
 004664B8    push        ebx
 004664B9    mov         ebx,eax
 004664BB    movzx       eax,byte ptr [ebx+0E]
 004664BF    cmp         al,byte ptr ds:[7855E2]
>004664C5    jne         004664DA
 004664C7    mov         eax,7855E3
 004664CC    lea         edx,[ebx+0F]
 004664CF    movzx       ecx,byte ptr [eax]
 004664D2    inc         ecx
 004664D3    call        @AStrCmp
>004664D8    je          004664DE
 004664DA    xor         eax,eax
 004664DC    pop         ebx
 004664DD    ret
 004664DE    mov         al,1
 004664E0    pop         ebx
 004664E1    ret
*}
end;

//004664E4
function TFont.GetHandle:HFONT;
begin
{*
 004664E4    push        ebp
 004664E5    mov         ebp,esp
 004664E7    add         esp,0FFFFFF8C
 004664EA    push        ebx
 004664EB    push        esi
 004664EC    xor         edx,edx
 004664EE    mov         dword ptr [ebp-74],edx
 004664F1    mov         dword ptr [ebp-4],edx
 004664F4    mov         dword ptr [ebp-8],edx
 004664F7    mov         ebx,eax
 004664F9    xor         eax,eax
 004664FB    push        ebp
 004664FC    push        4666EC
 00466501    push        dword ptr fs:[eax]
 00466504    mov         dword ptr fs:[eax],esp
 00466507    mov         eax,dword ptr [ebx+10]
 0046650A    mov         dword ptr [ebp-0C],eax
 0046650D    mov         eax,dword ptr [ebp-0C]
 00466510    cmp         dword ptr [eax+8],0
>00466514    jne         004666C3
 0046651A    mov         eax,[0079309C];gvar_0079309C
 0046651F    mov         dword ptr [ebp-10],eax
 00466522    mov         eax,dword ptr [ebp-10]
 00466525    add         eax,8
 00466528    push        eax
 00466529    call        kernel32.EnterCriticalSection
 0046652E    xor         edx,edx
 00466530    push        ebp
 00466531    push        4666BC
 00466536    push        dword ptr fs:[edx]
 00466539    mov         dword ptr fs:[edx],esp
 0046653C    mov         eax,dword ptr [ebp-0C]
 0046653F    cmp         dword ptr [eax+8],0
>00466543    jne         0046669A
 00466549    mov         eax,dword ptr [ebp-0C]
 0046654C    mov         eax,dword ptr [eax+18]
 0046654F    mov         dword ptr [ebp-70],eax
 00466552    xor         eax,eax
 00466554    mov         dword ptr [ebp-6C],eax
 00466557    mov         eax,dword ptr [ebp-0C]
 0046655A    mov         eax,dword ptr [eax+1C]
 0046655D    mov         dword ptr [ebp-68],eax
 00466560    mov         dword ptr [ebp-64],eax
 00466563    mov         eax,dword ptr [ebp-0C]
 00466566    test        byte ptr [eax+21],1
>0046656A    je          00466575
 0046656C    mov         dword ptr [ebp-60],2BC
>00466573    jmp         0046657C
 00466575    mov         dword ptr [ebp-60],190
 0046657C    mov         eax,dword ptr [ebp-0C]
 0046657F    test        byte ptr [eax+21],2
 00466583    setne       al
 00466586    mov         byte ptr [ebp-5C],al
 00466589    mov         eax,dword ptr [ebp-0C]
 0046658C    test        byte ptr [eax+21],4
 00466590    setne       al
 00466593    mov         byte ptr [ebp-5B],al
 00466596    mov         eax,dword ptr [ebp-0C]
 00466599    test        byte ptr [eax+21],8
 0046659D    setne       al
 004665A0    mov         byte ptr [ebp-5A],al
 004665A3    mov         eax,dword ptr [ebp-0C]
 004665A6    movzx       eax,byte ptr [eax+22]
 004665AA    cmp         al,1
>004665AC    jne         004665C3
 004665AE    cmp         byte ptr ds:[7855E2],1
>004665B5    je          004665C3
 004665B7    movzx       eax,byte ptr ds:[7855E2]
 004665BE    mov         byte ptr [ebp-59],al
>004665C1    jmp         004665C6
 004665C3    mov         byte ptr [ebp-59],al
 004665C6    lea         eax,[ebp-74]
 004665C9    mov         edx,dword ptr [ebp-0C]
 004665CC    add         edx,23
 004665CF    call        @UStrFromString
 004665D4    mov         eax,dword ptr [ebp-74]
 004665D7    mov         edx,466708;'Default'
 004665DC    call        CompareText
 004665E1    test        eax,eax
>004665E3    jne         00466606
 004665E5    mov         esi,7855E3
 004665EA    lea         edx,[ebp-4]
 004665ED    mov         eax,esi
 004665EF    call        UTF8ToUnicodeString
 004665F4    lea         eax,[ebp-54]
 004665F7    mov         ecx,1F
 004665FC    mov         edx,dword ptr [ebp-4]
 004665FF    call        StrPLCopy
>00466604    jmp         00466626
 00466606    mov         eax,dword ptr [ebp-0C]
 00466609    lea         esi,[eax+23]
 0046660C    lea         edx,[ebp-8]
 0046660F    mov         eax,esi
 00466611    call        UTF8ToUnicodeString
 00466616    lea         eax,[ebp-54]
 00466619    mov         ecx,1F
 0046661E    mov         edx,dword ptr [ebp-8]
 00466621    call        StrPLCopy
 00466626    mov         eax,[0078DB58];^gvar_00784C7C
 0046662B    cmp         dword ptr [eax],1
>0046662E    jne         0046664C
 00466630    call        GetDefFontCharSet
 00466635    cmp         al,80
>00466637    jne         0046664C
 00466639    mov         eax,dword ptr [ebp-0C]
 0046663C    add         eax,14
 0046663F    call        IsDefaultFont
 00466644    test        al,al
>00466646    je          0046664C
 00466648    mov         byte ptr [ebp-59],80
 0046664C    mov         eax,ebx
 0046664E    call        TFont.GetQuality
 00466653    mov         byte ptr [ebp-56],al
 00466656    cmp         dword ptr [ebp-64],0
>0046665A    je          00466662
 0046665C    mov         byte ptr [ebp-58],7
>00466660    jmp         00466666
 00466662    mov         byte ptr [ebp-58],0
 00466666    mov         byte ptr [ebp-57],0
 0046666A    mov         eax,ebx
 0046666C    call        TFont.GetPitch
 00466671    dec         al
>00466673    je          0046667B
 00466675    dec         al
>00466677    je          00466681
>00466679    jmp         00466687
 0046667B    mov         byte ptr [ebp-55],2
>0046667F    jmp         0046668B
 00466681    mov         byte ptr [ebp-55],1
>00466685    jmp         0046668B
 00466687    mov         byte ptr [ebp-55],0
 0046668B    lea         eax,[ebp-70]
 0046668E    push        eax
 0046668F    call        gdi32.CreateFontIndirectW
 00466694    mov         edx,dword ptr [ebp-0C]
 00466697    mov         dword ptr [edx+8],eax
 0046669A    xor         eax,eax
 0046669C    pop         edx
 0046669D    pop         ecx
 0046669E    pop         ecx
 0046669F    mov         dword ptr fs:[eax],edx
 004666A2    push        4666C3
 004666A7    mov         eax,[0079309C];gvar_0079309C
 004666AC    mov         dword ptr [ebp-14],eax
 004666AF    mov         eax,dword ptr [ebp-14]
 004666B2    add         eax,8
 004666B5    push        eax
 004666B6    call        kernel32.LeaveCriticalSection
 004666BB    ret
>004666BC    jmp         @HandleFinally
>004666C1    jmp         004666A7
 004666C3    mov         eax,dword ptr [ebp-0C]
 004666C6    mov         ebx,dword ptr [eax+8]
 004666C9    xor         eax,eax
 004666CB    pop         edx
 004666CC    pop         ecx
 004666CD    pop         ecx
 004666CE    mov         dword ptr fs:[eax],edx
 004666D1    push        4666F3
 004666D6    lea         eax,[ebp-74]
 004666D9    call        @UStrClr
 004666DE    lea         eax,[ebp-8]
 004666E1    mov         edx,2
 004666E6    call        @UStrArrayClr
 004666EB    ret
>004666EC    jmp         @HandleFinally
>004666F1    jmp         004666D6
 004666F3    mov         eax,ebx
 004666F5    pop         esi
 004666F6    pop         ebx
 004666F7    mov         esp,ebp
 004666F9    pop         ebp
 004666FA    ret
*}
end;

//00466718
procedure TFont.SetHandle(const Value:HFONT);
begin
{*
 00466718    push        ebx
 00466719    push        esi
 0046671A    add         esp,0FFFFFF70
 00466720    mov         esi,edx
 00466722    mov         ebx,eax
 00466724    mov         edx,esp
 00466726    mov         eax,esi
 00466728    call        GetFontData
 0046672D    mov         edx,esp
 0046672F    mov         eax,ebx
 00466731    call        TFont.SetData
 00466736    add         esp,90
 0046673C    pop         esi
 0046673D    pop         ebx
 0046673E    ret
*}
end;

//00466740
{*function TFont.GetHeight:?;
begin
 00466740    mov         eax,dword ptr [eax+10];TFont.FResource:PResource
 00466743    mov         eax,dword ptr [eax+18]
 00466746    ret
end;*}

//00466748
procedure TFont.SetHeight(const Value:Integer);
begin
{*
 00466748    push        ebx
 00466749    push        esi
 0046674A    add         esp,0FFFFFF70
 00466750    mov         esi,edx
 00466752    mov         ebx,eax
 00466754    mov         eax,dword ptr [ebx+10]
 00466757    cmp         esi,dword ptr [eax+18]
>0046675A    je          00466772
 0046675C    mov         edx,esp
 0046675E    mov         eax,ebx
 00466760    call        TFont.GetData
 00466765    mov         dword ptr [esp+4],esi
 00466769    mov         edx,esp
 0046676B    mov         eax,ebx
 0046676D    call        TFont.SetData
 00466772    add         esp,90
 00466778    pop         esi
 00466779    pop         ebx
 0046677A    ret
*}
end;

//0046677C
function TFont.GetName:TFontName;
begin
{*
 0046677C    push        ebp
 0046677D    mov         ebp,esp
 0046677F    push        0
 00466781    push        ebx
 00466782    push        esi
 00466783    mov         esi,edx
 00466785    xor         edx,edx
 00466787    push        ebp
 00466788    push        4667C3
 0046678D    push        dword ptr fs:[edx]
 00466790    mov         dword ptr fs:[edx],esp
 00466793    mov         eax,dword ptr [eax+10]
 00466796    lea         ebx,[eax+23]
 00466799    lea         edx,[ebp-4]
 0046679C    mov         eax,ebx
 0046679E    call        UTF8ToUnicodeString
 004667A3    mov         eax,esi
 004667A5    mov         edx,dword ptr [ebp-4]
 004667A8    call        @UStrAsg
 004667AD    xor         eax,eax
 004667AF    pop         edx
 004667B0    pop         ecx
 004667B1    pop         ecx
 004667B2    mov         dword ptr fs:[eax],edx
 004667B5    push        4667CA
 004667BA    lea         eax,[ebp-4]
 004667BD    call        @UStrClr
 004667C2    ret
>004667C3    jmp         @HandleFinally
>004667C8    jmp         004667BA
 004667CA    pop         esi
 004667CB    pop         ebx
 004667CC    pop         ecx
 004667CD    pop         ebp
 004667CE    ret
*}
end;

//004667D0
procedure TFont.SetName(const Value:TFontName);
begin
{*
 004667D0    push        ebx
 004667D1    push        esi
 004667D2    add         esp,0FFFFFE70
 004667D8    mov         esi,edx
 004667DA    mov         ebx,eax
 004667DC    test        esi,esi
>004667DE    je          00466822
 004667E0    mov         edx,esp
 004667E2    mov         eax,ebx
 004667E4    call        TFont.GetData
 004667E9    lea         eax,[esp+0F]
 004667ED    xor         ecx,ecx
 004667EF    mov         edx,7D
 004667F4    call        @FillChar
 004667F9    lea         edx,[esp+90]
 00466800    mov         eax,esi
 00466802    call        UTF8EncodeToShortString
 00466807    lea         edx,[esp+90]
 0046680E    lea         eax,[esp+0F]
 00466812    mov         cl,7C
 00466814    call        @PStrNCpy
 00466819    mov         edx,esp
 0046681B    mov         eax,ebx
 0046681D    call        TFont.SetData
 00466822    add         esp,190
 00466828    pop         esi
 00466829    pop         ebx
 0046682A    ret
*}
end;

//0046682C
function TFont.GetSize:Integer;
begin
{*
 0046682C    push        ebx
 0046682D    mov         ebx,eax
 0046682F    mov         eax,dword ptr [ebx+1C]
 00466832    push        eax
 00466833    push        48
 00466835    mov         eax,dword ptr [ebx+10]
 00466838    mov         eax,dword ptr [eax+18]
 0046683B    push        eax
 0046683C    call        kernel32.MulDiv
 00466841    neg         eax
 00466843    pop         ebx
 00466844    ret
*}
end;

//00466848
procedure TFont.SetSize(const Value:Integer);
begin
{*
 00466848    push        ebx
 00466849    push        esi
 0046684A    mov         esi,edx
 0046684C    mov         ebx,eax
 0046684E    push        48
 00466850    mov         eax,dword ptr [ebx+1C]
 00466853    push        eax
 00466854    push        esi
 00466855    call        kernel32.MulDiv
 0046685A    mov         edx,eax
 0046685C    neg         edx
 0046685E    mov         eax,ebx
 00466860    call        TFont.SetHeight
 00466865    pop         esi
 00466866    pop         ebx
 00466867    ret
*}
end;

//00466868
function TFont.GetStyle:TFontStyles;
begin
{*
 00466868    mov         eax,dword ptr [eax+10]
 0046686B    movzx       edx,byte ptr [eax+21]
 0046686F    mov         eax,edx
 00466871    ret
*}
end;

//00466874
procedure TFont.SetStyle(const Value:TFontStyles);
begin
{*
 00466874    push        ebx
 00466875    push        esi
 00466876    add         esp,0FFFFFF6C
 0046687C    mov         byte ptr [esp],dl
 0046687F    mov         esi,eax
 00466881    mov         eax,dword ptr [esi+10]
 00466884    movzx       ebx,byte ptr [eax+21]
 00466888    cmp         bl,byte ptr [esp]
>0046688B    je          004668AB
 0046688D    lea         edx,[esp+4]
 00466891    mov         eax,esi
 00466893    call        TFont.GetData
 00466898    movzx       eax,byte ptr [esp]
 0046689C    mov         byte ptr [esp+11],al
 004668A0    lea         edx,[esp+4]
 004668A4    mov         eax,esi
 004668A6    call        TFont.SetData
 004668AB    add         esp,94
 004668B1    pop         esi
 004668B2    pop         ebx
 004668B3    ret
*}
end;

//004668B4
function TFont.GetPitch:TFontPitch;
begin
{*
 004668B4    mov         eax,dword ptr [eax+10]
 004668B7    movzx       eax,byte ptr [eax+20]
 004668BB    ret
*}
end;

//004668BC
function TFont.GetQuality:TFontQuality;
begin
{*
 004668BC    mov         eax,dword ptr [eax+10]
 004668BF    movzx       eax,byte ptr [eax+0A0]
 004668C6    ret
*}
end;

//004668C8
procedure TFont.SetPitch(const Value:TFontPitch);
begin
{*
 004668C8    push        ebx
 004668C9    push        esi
 004668CA    add         esp,0FFFFFF70
 004668D0    mov         ebx,edx
 004668D2    mov         esi,eax
 004668D4    mov         eax,esi
 004668D6    call        TFont.GetPitch
 004668DB    cmp         bl,al
>004668DD    je          004668F5
 004668DF    mov         edx,esp
 004668E1    mov         eax,esi
 004668E3    call        TFont.GetData
 004668E8    mov         byte ptr [esp+0C],bl
 004668EC    mov         edx,esp
 004668EE    mov         eax,esi
 004668F0    call        TFont.SetData
 004668F5    add         esp,90
 004668FB    pop         esi
 004668FC    pop         ebx
 004668FD    ret
*}
end;

//00466900
procedure TFont.SetQuality(const Value:TFontQuality);
begin
{*
 00466900    push        ebx
 00466901    push        esi
 00466902    add         esp,0FFFFFF70
 00466908    mov         ebx,edx
 0046690A    mov         esi,eax
 0046690C    mov         eax,esi
 0046690E    call        TFont.GetQuality
 00466913    cmp         bl,al
>00466915    je          00466930
 00466917    mov         edx,esp
 00466919    mov         eax,esi
 0046691B    call        TFont.GetData
 00466920    mov         byte ptr [esp+8C],bl
 00466927    mov         edx,esp
 00466929    mov         eax,esi
 0046692B    call        TFont.SetData
 00466930    add         esp,90
 00466936    pop         esi
 00466937    pop         ebx
 00466938    ret
*}
end;

//0046693C
function TFont.GetCharset:TFontCharset;
begin
{*
 0046693C    mov         eax,dword ptr [eax+10]
 0046693F    movzx       eax,byte ptr [eax+22]
 00466943    ret
*}
end;

//00466944
procedure TFont.SetCharset(const Value:TFontCharset);
begin
{*
 00466944    push        ebx
 00466945    push        esi
 00466946    add         esp,0FFFFFF70
 0046694C    mov         ebx,edx
 0046694E    mov         esi,eax
 00466950    mov         eax,esi
 00466952    call        TFont.GetCharset
 00466957    cmp         bl,al
>00466959    je          00466971
 0046695B    mov         edx,esp
 0046695D    mov         eax,esi
 0046695F    call        TFont.GetData
 00466964    mov         byte ptr [esp+0E],bl
 00466968    mov         edx,esp
 0046696A    mov         eax,esi
 0046696C    call        TFont.SetData
 00466971    add         esp,90
 00466977    pop         esi
 00466978    pop         ebx
 00466979    ret
*}
end;

//0046697C
function TFont.GetOrientation:Integer;
begin
{*
 0046697C    mov         eax,dword ptr [eax+10]
 0046697F    mov         eax,dword ptr [eax+1C]
 00466982    ret
*}
end;

//00466984
procedure TFont.SetOrientation(const Value:Integer);
begin
{*
 00466984    push        ebx
 00466985    push        esi
 00466986    add         esp,0FFFFFF70
 0046698C    mov         esi,edx
 0046698E    mov         ebx,eax
 00466990    mov         eax,ebx
 00466992    call        TFont.GetOrientation
 00466997    cmp         esi,eax
>00466999    je          004669B1
 0046699B    mov         edx,esp
 0046699D    mov         eax,ebx
 0046699F    call        TFont.GetData
 004669A4    mov         dword ptr [esp+8],esi
 004669A8    mov         edx,esp
 004669AA    mov         eax,ebx
 004669AC    call        TFont.SetData
 004669B1    add         esp,90
 004669B7    pop         esi
 004669B8    pop         ebx
 004669B9    ret
*}
end;

//004669BC
function GetPenData(Pen:HPEN):TPenData;
begin
{*
 004669BC    push        ebp
 004669BD    mov         ebp,esp
 004669BF    add         esp,0FFFFFFD0
 004669C2    push        ebx
 004669C3    push        esi
 004669C4    push        edi
 004669C5    mov         esi,edx
 004669C7    mov         ebx,eax
 004669C9    push        esi
 004669CA    mov         edi,esi
 004669CC    mov         esi,785898
 004669D1    movs        dword ptr [edi],dword ptr [esi]
 004669D2    movs        dword ptr [edi],dword ptr [esi]
 004669D3    movs        dword ptr [edi],dword ptr [esi]
 004669D4    movs        dword ptr [edi],dword ptr [esi]
 004669D5    pop         esi
 004669D6    test        ebx,ebx
>004669D8    je          00466AC3
 004669DE    push        0
 004669E0    push        0
 004669E2    push        ebx
 004669E3    call        gdi32.GetObjectW
 004669E8    mov         edi,eax
 004669EA    cmp         edi,10
>004669ED    jne         00466A23
 004669EF    lea         eax,[ebp-14]
 004669F2    push        eax
 004669F3    push        10
 004669F5    push        ebx
 004669F6    call        gdi32.GetObjectW
 004669FB    test        eax,eax
>004669FD    je          00466AC3
 00466A03    mov         eax,dword ptr [ebp-14]
 00466A06    movzx       eax,byte ptr [eax+7858A8]
 00466A0D    mov         byte ptr [esi+0C],al
 00466A10    mov         eax,dword ptr [ebp-10]
 00466A13    mov         dword ptr [esi+8],eax
 00466A16    mov         eax,dword ptr [ebp-8]
 00466A19    mov         dword ptr [esi+4],eax
 00466A1C    mov         dword ptr [esi],ebx
>00466A1E    jmp         00466AC3
 00466A23    cmp         edi,18
>00466A26    jl          00466AC3
 00466A2C    cmp         edi,1C
>00466A2F    jle         00466A95
 00466A31    mov         eax,edi
 00466A33    call        @GetMem
 00466A38    mov         dword ptr [ebp-4],eax
 00466A3B    xor         edx,edx
 00466A3D    push        ebp
 00466A3E    push        466A8E
 00466A43    push        dword ptr fs:[edx]
 00466A46    mov         dword ptr fs:[edx],esp
 00466A49    mov         eax,dword ptr [ebp-4]
 00466A4C    push        eax
 00466A4D    push        edi
 00466A4E    push        ebx
 00466A4F    call        gdi32.GetObjectW
 00466A54    test        eax,eax
>00466A56    je          00466A78
 00466A58    mov         eax,dword ptr [ebp-4]
 00466A5B    mov         edx,dword ptr [eax]
 00466A5D    and         edx,0F
 00466A60    movzx       edx,byte ptr [edx+7858A8]
 00466A67    mov         byte ptr [esi+0C],dl
 00466A6A    mov         edx,dword ptr [eax+4]
 00466A6D    mov         dword ptr [esi+8],edx
 00466A70    mov         eax,dword ptr [eax+0C]
 00466A73    mov         dword ptr [esi+4],eax
 00466A76    mov         dword ptr [esi],ebx
 00466A78    xor         eax,eax
 00466A7A    pop         edx
 00466A7B    pop         ecx
 00466A7C    pop         ecx
 00466A7D    mov         dword ptr fs:[eax],edx
 00466A80    push        466AC3
 00466A85    mov         eax,dword ptr [ebp-4]
 00466A88    call        @FreeMem
 00466A8D    ret
>00466A8E    jmp         @HandleFinally
>00466A93    jmp         00466A85
 00466A95    lea         eax,[ebp-30]
 00466A98    push        eax
 00466A99    push        1C
 00466A9B    push        ebx
 00466A9C    call        gdi32.GetObjectW
 00466AA1    test        eax,eax
>00466AA3    je          00466AC3
 00466AA5    mov         eax,dword ptr [ebp-30]
 00466AA8    and         eax,0F
 00466AAB    movzx       eax,byte ptr [eax+7858A8]
 00466AB2    mov         byte ptr [esi+0C],al
 00466AB5    mov         eax,dword ptr [ebp-2C]
 00466AB8    mov         dword ptr [esi+8],eax
 00466ABB    mov         eax,dword ptr [ebp-24]
 00466ABE    mov         dword ptr [esi+4],eax
 00466AC1    mov         dword ptr [esi],ebx
 00466AC3    pop         edi
 00466AC4    pop         esi
 00466AC5    pop         ebx
 00466AC6    mov         esp,ebp
 00466AC8    pop         ebp
 00466AC9    ret
*}
end;

//00466ACC
constructor TPen.Create();
begin
{*
 00466ACC    push        ebx
 00466ACD    push        esi
 00466ACE    test        dl,dl
>00466AD0    je          00466ADA
 00466AD2    add         esp,0FFFFFFF0
 00466AD5    call        @ClassCreate
 00466ADA    mov         ebx,edx
 00466ADC    mov         esi,eax
 00466ADE    xor         edx,edx
 00466AE0    mov         eax,esi
 00466AE2    call        TObject.Create
 00466AE7    mov         edx,785898
 00466AEC    mov         eax,[007930A0];gvar_007930A0
 00466AF1    call        TResourceManager.AllocResource
 00466AF6    mov         dword ptr [esi+10],eax
 00466AF9    mov         byte ptr [esi+18],4
 00466AFD    mov         eax,esi
 00466AFF    test        bl,bl
>00466B01    je          00466B12
 00466B03    call        @AfterConstruction
 00466B08    pop         dword ptr fs:[0]
 00466B0F    add         esp,0C
 00466B12    mov         eax,esi
 00466B14    pop         esi
 00466B15    pop         ebx
 00466B16    ret
*}
end;

//00466B18
destructor TPen.Destroy();
begin
{*
 00466B18    push        ebx
 00466B19    push        esi
 00466B1A    call        @BeforeDestruction
 00466B1F    mov         ebx,edx
 00466B21    mov         esi,eax
 00466B23    mov         edx,dword ptr [esi+10];TPen.FResource:PResource
 00466B26    mov         eax,[007930A0];gvar_007930A0
 00466B2B    call        TResourceManager.FreeResource
 00466B30    mov         edx,ebx
 00466B32    and         dl,0FC
 00466B35    mov         eax,esi
 00466B37    call        TMemoryStream.Destroy
 00466B3C    test        bl,bl
>00466B3E    jle         00466B47
 00466B40    mov         eax,esi
 00466B42    call        @ClassDestroy
 00466B47    pop         esi
 00466B48    pop         ebx
 00466B49    ret
*}
end;

//00466B4C
procedure TPen.Assign(Source:TPersistent);
begin
{*
 00466B4C    push        ebp
 00466B4D    mov         ebp,esp
 00466B4F    add         esp,0FFFFFFF8
 00466B52    push        ebx
 00466B53    mov         dword ptr [ebp-8],edx
 00466B56    mov         dword ptr [ebp-4],eax
 00466B59    mov         eax,dword ptr [ebp-8]
 00466B5C    mov         edx,dword ptr ds:[45FE60];TPen
 00466B62    call        @IsClass
 00466B67    test        al,al
>00466B69    je          00466BF3
 00466B6F    mov         eax,dword ptr [ebp-4]
 00466B72    call        TGraphicsObject.Lock
 00466B77    xor         eax,eax
 00466B79    push        ebp
 00466B7A    push        466BEC
 00466B7F    push        dword ptr fs:[eax]
 00466B82    mov         dword ptr fs:[eax],esp
 00466B85    mov         ebx,dword ptr [ebp-8]
 00466B88    mov         eax,ebx
 00466B8A    call        TGraphicsObject.Lock
 00466B8F    xor         eax,eax
 00466B91    push        ebp
 00466B92    push        466BCF
 00466B97    push        dword ptr fs:[eax]
 00466B9A    mov         dword ptr fs:[eax],esp
 00466B9D    mov         ecx,dword ptr [ebx+10]
 00466BA0    mov         edx,dword ptr [ebp-4]
 00466BA3    mov         eax,[007930A0];gvar_007930A0
 00466BA8    call        TResourceManager.AssignResource
 00466BAD    movzx       edx,byte ptr [ebx+18]
 00466BB1    mov         eax,dword ptr [ebp-4]
 00466BB4    call        TPen.SetMode
 00466BB9    xor         eax,eax
 00466BBB    pop         edx
 00466BBC    pop         ecx
 00466BBD    pop         ecx
 00466BBE    mov         dword ptr fs:[eax],edx
 00466BC1    push        466BD6
 00466BC6    mov         eax,dword ptr [ebp-8]
 00466BC9    call        TGraphicsObject.Unlock
 00466BCE    ret
>00466BCF    jmp         @HandleFinally
>00466BD4    jmp         00466BC6
 00466BD6    xor         eax,eax
 00466BD8    pop         edx
 00466BD9    pop         ecx
 00466BDA    pop         ecx
 00466BDB    mov         dword ptr fs:[eax],edx
 00466BDE    push        466BFE
 00466BE3    mov         eax,dword ptr [ebp-4]
 00466BE6    call        TGraphicsObject.Unlock
 00466BEB    ret
>00466BEC    jmp         @HandleFinally
>00466BF1    jmp         00466BE3
 00466BF3    mov         edx,dword ptr [ebp-8]
 00466BF6    mov         eax,dword ptr [ebp-4]
 00466BF9    call        TPersistent.Assign
 00466BFE    pop         ebx
 00466BFF    pop         ecx
 00466C00    pop         ecx
 00466C01    pop         ebp
 00466C02    ret
*}
end;

//00466C04
procedure TPen.GetData(var PenData:TPenData);
begin
{*
 00466C04    push        esi
 00466C05    push        edi
 00466C06    mov         eax,dword ptr [eax+10]
 00466C09    lea         esi,[eax+14]
 00466C0C    mov         edi,edx
 00466C0E    movs        dword ptr [edi],dword ptr [esi]
 00466C0F    movs        dword ptr [edi],dword ptr [esi]
 00466C10    movs        dword ptr [edi],dword ptr [esi]
 00466C11    movs        dword ptr [edi],dword ptr [esi]
 00466C12    xor         eax,eax
 00466C14    mov         dword ptr [edx],eax
 00466C16    pop         edi
 00466C17    pop         esi
 00466C18    ret
*}
end;

//00466C1C
procedure TBrush.SetData(const BrushData:TBrushData);
begin
{*
 00466C1C    push        ebp
 00466C1D    mov         ebp,esp
 00466C1F    push        ecx
 00466C20    push        ebx
 00466C21    mov         ebx,edx
 00466C23    mov         dword ptr [ebp-4],eax
 00466C26    mov         eax,dword ptr [ebp-4]
 00466C29    call        TGraphicsObject.Lock
 00466C2E    xor         eax,eax
 00466C30    push        ebp
 00466C31    push        466C61
 00466C36    push        dword ptr fs:[eax]
 00466C39    mov         dword ptr fs:[eax],esp
 00466C3C    mov         ecx,ebx
 00466C3E    mov         edx,dword ptr [ebp-4]
 00466C41    mov         eax,[007930A0];gvar_007930A0
 00466C46    call        TResourceManager.ChangeResource
 00466C4B    xor         eax,eax
 00466C4D    pop         edx
 00466C4E    pop         ecx
 00466C4F    pop         ecx
 00466C50    mov         dword ptr fs:[eax],edx
 00466C53    push        466C68
 00466C58    mov         eax,dword ptr [ebp-4]
 00466C5B    call        TGraphicsObject.Unlock
 00466C60    ret
>00466C61    jmp         @HandleFinally
>00466C66    jmp         00466C58
 00466C68    pop         ebx
 00466C69    pop         ecx
 00466C6A    pop         ebp
 00466C6B    ret
*}
end;

//00466C6C
{*function TPen.GetColor:?;
begin
 00466C6C    mov         eax,dword ptr [eax+10];TPen.FResource:PResource
 00466C6F    mov         eax,dword ptr [eax+18]
 00466C72    ret
end;*}

//00466C74
procedure TPen.SetColor(Value:TColor);
begin
{*
 00466C74    push        ebx
 00466C75    push        esi
 00466C76    add         esp,0FFFFFFF0
 00466C79    mov         esi,edx
 00466C7B    mov         ebx,eax
 00466C7D    mov         eax,dword ptr [ebx+10]
 00466C80    cmp         esi,dword ptr [eax+18]
>00466C83    je          00466C9B
 00466C85    mov         edx,esp
 00466C87    mov         eax,ebx
 00466C89    call        TPen.GetData
 00466C8E    mov         dword ptr [esp+4],esi
 00466C92    mov         edx,esp
 00466C94    mov         eax,ebx
 00466C96    call        TBrush.SetData
 00466C9B    add         esp,10
 00466C9E    pop         esi
 00466C9F    pop         ebx
 00466CA0    ret
*}
end;

//00466CA4
function TPen.GetHandle:HPEN;
begin
{*
 00466CA4    push        ebp
 00466CA5    mov         ebp,esp
 00466CA7    add         esp,0FFFFFFE4
 00466CAA    mov         eax,dword ptr [eax+10]
 00466CAD    mov         dword ptr [ebp-4],eax
 00466CB0    mov         eax,dword ptr [ebp-4]
 00466CB3    cmp         dword ptr [eax+8],0
>00466CB7    jne         00466D49
 00466CBD    mov         eax,[007930A0];gvar_007930A0
 00466CC2    mov         dword ptr [ebp-8],eax
 00466CC5    mov         eax,dword ptr [ebp-8]
 00466CC8    add         eax,8
 00466CCB    push        eax
 00466CCC    call        kernel32.EnterCriticalSection
 00466CD1    xor         eax,eax
 00466CD3    push        ebp
 00466CD4    push        466D42
 00466CD9    push        dword ptr fs:[eax]
 00466CDC    mov         dword ptr fs:[eax],esp
 00466CDF    mov         eax,dword ptr [ebp-4]
 00466CE2    cmp         dword ptr [eax+8],0
>00466CE6    jne         00466D20
 00466CE8    mov         eax,dword ptr [ebp-4]
 00466CEB    movzx       eax,byte ptr [eax+20]
 00466CEF    movzx       eax,word ptr [eax*2+7858B2]
 00466CF7    mov         dword ptr [ebp-1C],eax
 00466CFA    mov         eax,dword ptr [ebp-4]
 00466CFD    mov         eax,dword ptr [eax+1C]
 00466D00    mov         dword ptr [ebp-18],eax
 00466D03    mov         eax,dword ptr [ebp-4]
 00466D06    mov         eax,dword ptr [eax+18]
 00466D09    call        ColorToRGB
 00466D0E    mov         dword ptr [ebp-10],eax
 00466D11    lea         eax,[ebp-1C]
 00466D14    push        eax
 00466D15    call        gdi32.CreatePenIndirect
 00466D1A    mov         edx,dword ptr [ebp-4]
 00466D1D    mov         dword ptr [edx+8],eax
 00466D20    xor         eax,eax
 00466D22    pop         edx
 00466D23    pop         ecx
 00466D24    pop         ecx
 00466D25    mov         dword ptr fs:[eax],edx
 00466D28    push        466D49
 00466D2D    mov         eax,[007930A0];gvar_007930A0
 00466D32    mov         dword ptr [ebp-0C],eax
 00466D35    mov         eax,dword ptr [ebp-0C]
 00466D38    add         eax,8
 00466D3B    push        eax
 00466D3C    call        kernel32.LeaveCriticalSection
 00466D41    ret
>00466D42    jmp         @HandleFinally
>00466D47    jmp         00466D2D
 00466D49    mov         eax,dword ptr [ebp-4]
 00466D4C    mov         eax,dword ptr [eax+8]
 00466D4F    mov         esp,ebp
 00466D51    pop         ebp
 00466D52    ret
*}
end;

//00466D54
procedure TPen.SetHandle(Value:HPEN);
begin
{*
 00466D54    push        ebx
 00466D55    push        esi
 00466D56    add         esp,0FFFFFFF0
 00466D59    mov         esi,edx
 00466D5B    mov         ebx,eax
 00466D5D    mov         edx,esp
 00466D5F    mov         eax,esi
 00466D61    call        GetPenData
 00466D66    mov         edx,esp
 00466D68    mov         eax,ebx
 00466D6A    call        TBrush.SetData
 00466D6F    add         esp,10
 00466D72    pop         esi
 00466D73    pop         ebx
 00466D74    ret
*}
end;

//00466D78
procedure TPen.SetMode(Value:TPenMode);
begin
{*
 00466D78    cmp         dl,byte ptr [eax+18]
>00466D7B    je          00466D85
 00466D7D    mov         byte ptr [eax+18],dl
 00466D80    mov         edx,dword ptr [eax]
 00466D82    call        dword ptr [edx+0C]
 00466D85    ret
*}
end;

//00466D88
function TBrush.GetStyle:TBrushStyle;
begin
{*
 00466D88    mov         eax,dword ptr [eax+10]
 00466D8B    movzx       eax,byte ptr [eax+20]
 00466D8F    ret
*}
end;

//00466D90
procedure TPen.SetStyle(Value:TPenStyle);
begin
{*
 00466D90    push        ebx
 00466D91    push        esi
 00466D92    add         esp,0FFFFFFF0
 00466D95    mov         ebx,edx
 00466D97    mov         esi,eax
 00466D99    mov         eax,esi
 00466D9B    call        TBrush.GetStyle
 00466DA0    cmp         bl,al
>00466DA2    je          00466DBA
 00466DA4    mov         edx,esp
 00466DA6    mov         eax,esi
 00466DA8    call        TPen.GetData
 00466DAD    mov         byte ptr [esp+0C],bl
 00466DB1    mov         edx,esp
 00466DB3    mov         eax,esi
 00466DB5    call        TBrush.SetData
 00466DBA    add         esp,10
 00466DBD    pop         esi
 00466DBE    pop         ebx
 00466DBF    ret
*}
end;

//00466DC0
{*function TPen.GetWidth:?;
begin
 00466DC0    mov         eax,dword ptr [eax+10];TPen.FResource:PResource
 00466DC3    mov         eax,dword ptr [eax+1C]
 00466DC6    ret
end;*}

//00466DC8
procedure TPen.SetWidth(Value:Integer);
begin
{*
 00466DC8    push        ebx
 00466DC9    push        esi
 00466DCA    add         esp,0FFFFFFF0
 00466DCD    mov         esi,edx
 00466DCF    mov         ebx,eax
 00466DD1    test        esi,esi
>00466DD3    jl          00466DF3
 00466DD5    mov         eax,dword ptr [ebx+10]
 00466DD8    cmp         esi,dword ptr [eax+1C]
>00466DDB    je          00466DF3
 00466DDD    mov         edx,esp
 00466DDF    mov         eax,ebx
 00466DE1    call        TPen.GetData
 00466DE6    mov         dword ptr [esp+8],esi
 00466DEA    mov         edx,esp
 00466DEC    mov         eax,ebx
 00466DEE    call        TBrush.SetData
 00466DF3    add         esp,10
 00466DF6    pop         esi
 00466DF7    pop         ebx
 00466DF8    ret
*}
end;

//00466DFC
function GetBrushData(Brush:HBRUSH):TBrushData;
begin
{*
 00466DFC    push        ebx
 00466DFD    push        esi
 00466DFE    push        edi
 00466DFF    add         esp,0FFFFFFF4
 00466E02    mov         ebx,edx
 00466E04    mov         esi,eax
 00466E06    push        esi
 00466E07    mov         edi,ebx
 00466E09    mov         esi,7858C4
 00466E0E    movs        dword ptr [edi],dword ptr [esi]
 00466E0F    movs        dword ptr [edi],dword ptr [esi]
 00466E10    movs        dword ptr [edi],dword ptr [esi]
 00466E11    movs        dword ptr [edi],dword ptr [esi]
 00466E12    pop         esi
 00466E13    test        esi,esi
>00466E15    je          00466E7B
 00466E17    push        esp
 00466E18    push        0C
 00466E1A    push        esi
 00466E1B    call        gdi32.GetObjectW
 00466E20    test        eax,eax
>00466E22    je          00466E7B
 00466E24    mov         eax,dword ptr [esp]
 00466E27    sub         eax,1
>00466E2A    jb          00466E35
>00466E2C    je          00466E3B
 00466E2E    sub         eax,2
>00466E31    je          00466E41
>00466E33    jmp         00466E68
 00466E35    mov         byte ptr [ebx+0C],0
>00466E39    jmp         00466E72
 00466E3B    mov         byte ptr [ebx+0C],1
>00466E3F    jmp         00466E72
 00466E41    cmp         dword ptr [ebx+8],0
>00466E45    jne         00466E5A
 00466E47    mov         dl,1
 00466E49    mov         eax,[00463B28];TBitmap
 00466E4E    call        TBitmap.Create
 00466E53    mov         dword ptr [ebx+8],eax
 00466E56    mov         byte ptr [ebx+0D],1
 00466E5A    mov         eax,dword ptr [ebx+8]
 00466E5D    mov         edx,dword ptr [esp+8]
 00466E61    call        TBitmap.SetHandle
>00466E66    jmp         00466E72
 00466E68    movzx       eax,byte ptr [esp+8]
 00466E6D    add         al,2
 00466E6F    mov         byte ptr [ebx+0C],al
 00466E72    mov         eax,dword ptr [esp+4]
 00466E76    mov         dword ptr [ebx+4],eax
 00466E79    mov         dword ptr [ebx],esi
 00466E7B    add         esp,0C
 00466E7E    pop         edi
 00466E7F    pop         esi
 00466E80    pop         ebx
 00466E81    ret
*}
end;

//00466E84
constructor TBrush.Create();
begin
{*
 00466E84    push        ebx
 00466E85    push        esi
 00466E86    test        dl,dl
>00466E88    je          00466E92
 00466E8A    add         esp,0FFFFFFF0
 00466E8D    call        @ClassCreate
 00466E92    mov         ebx,edx
 00466E94    mov         esi,eax
 00466E96    xor         edx,edx
 00466E98    mov         eax,esi
 00466E9A    call        TObject.Create
 00466E9F    mov         edx,7858C4
 00466EA4    mov         eax,[007930A4];gvar_007930A4
 00466EA9    call        TResourceManager.AllocResource
 00466EAE    mov         dword ptr [esi+10],eax
 00466EB1    mov         eax,esi
 00466EB3    test        bl,bl
>00466EB5    je          00466EC6
 00466EB7    call        @AfterConstruction
 00466EBC    pop         dword ptr fs:[0]
 00466EC3    add         esp,0C
 00466EC6    mov         eax,esi
 00466EC8    pop         esi
 00466EC9    pop         ebx
 00466ECA    ret
*}
end;

//00466ECC
destructor TBrush.Destroy();
begin
{*
 00466ECC    push        ebx
 00466ECD    push        esi
 00466ECE    call        @BeforeDestruction
 00466ED3    mov         ebx,edx
 00466ED5    mov         esi,eax
 00466ED7    mov         edx,dword ptr [esi+10];TBrush.FResource:PResource
 00466EDA    mov         eax,[007930A4];gvar_007930A4
 00466EDF    call        TResourceManager.FreeResource
 00466EE4    mov         edx,ebx
 00466EE6    and         dl,0FC
 00466EE9    mov         eax,esi
 00466EEB    call        TMemoryStream.Destroy
 00466EF0    test        bl,bl
>00466EF2    jle         00466EFB
 00466EF4    mov         eax,esi
 00466EF6    call        @ClassDestroy
 00466EFB    pop         esi
 00466EFC    pop         ebx
 00466EFD    ret
*}
end;

//00466F00
procedure TBrush.Assign(Source:TPersistent);
begin
{*
 00466F00    push        ebp
 00466F01    mov         ebp,esp
 00466F03    add         esp,0FFFFFFF8
 00466F06    push        ebx
 00466F07    mov         dword ptr [ebp-8],edx
 00466F0A    mov         dword ptr [ebp-4],eax
 00466F0D    mov         eax,dword ptr [ebp-8]
 00466F10    mov         edx,dword ptr ds:[460070];TBrush
 00466F16    call        @IsClass
 00466F1B    test        al,al
>00466F1D    je          00466F97
 00466F1F    mov         eax,dword ptr [ebp-4]
 00466F22    call        TGraphicsObject.Lock
 00466F27    xor         eax,eax
 00466F29    push        ebp
 00466F2A    push        466F90
 00466F2F    push        dword ptr fs:[eax]
 00466F32    mov         dword ptr fs:[eax],esp
 00466F35    mov         ebx,dword ptr [ebp-8]
 00466F38    mov         eax,ebx
 00466F3A    call        TGraphicsObject.Lock
 00466F3F    xor         eax,eax
 00466F41    push        ebp
 00466F42    push        466F73
 00466F47    push        dword ptr fs:[eax]
 00466F4A    mov         dword ptr fs:[eax],esp
 00466F4D    mov         ecx,dword ptr [ebx+10]
 00466F50    mov         edx,dword ptr [ebp-4]
 00466F53    mov         eax,[007930A4];gvar_007930A4
 00466F58    call        TResourceManager.AssignResource
 00466F5D    xor         eax,eax
 00466F5F    pop         edx
 00466F60    pop         ecx
 00466F61    pop         ecx
 00466F62    mov         dword ptr fs:[eax],edx
 00466F65    push        466F7A
 00466F6A    mov         eax,dword ptr [ebp-8]
 00466F6D    call        TGraphicsObject.Unlock
 00466F72    ret
>00466F73    jmp         @HandleFinally
>00466F78    jmp         00466F6A
 00466F7A    xor         eax,eax
 00466F7C    pop         edx
 00466F7D    pop         ecx
 00466F7E    pop         ecx
 00466F7F    mov         dword ptr fs:[eax],edx
 00466F82    push        466FA2
 00466F87    mov         eax,dword ptr [ebp-4]
 00466F8A    call        TGraphicsObject.Unlock
 00466F8F    ret
>00466F90    jmp         @HandleFinally
>00466F95    jmp         00466F87
 00466F97    mov         edx,dword ptr [ebp-8]
 00466F9A    mov         eax,dword ptr [ebp-4]
 00466F9D    call        TPersistent.Assign
 00466FA2    pop         ebx
 00466FA3    pop         ecx
 00466FA4    pop         ecx
 00466FA5    pop         ebp
 00466FA6    ret
*}
end;

//00466FA8
procedure TBrush.GetData(var BrushData:TBrushData);
begin
{*
 00466FA8    push        esi
 00466FA9    push        edi
 00466FAA    mov         eax,dword ptr [eax+10]
 00466FAD    lea         esi,[eax+14]
 00466FB0    mov         edi,edx
 00466FB2    movs        dword ptr [edi],dword ptr [esi]
 00466FB3    movs        dword ptr [edi],dword ptr [esi]
 00466FB4    movs        dword ptr [edi],dword ptr [esi]
 00466FB5    movs        dword ptr [edi],dword ptr [esi]
 00466FB6    xor         eax,eax
 00466FB8    mov         dword ptr [edx],eax
 00466FBA    xor         eax,eax
 00466FBC    mov         dword ptr [edx+8],eax
 00466FBF    pop         edi
 00466FC0    pop         esi
 00466FC1    ret
*}
end;

//00466FC4
procedure TPen.SetData(const PenData:TPenData);
begin
{*
 00466FC4    push        ebp
 00466FC5    mov         ebp,esp
 00466FC7    push        ecx
 00466FC8    push        ebx
 00466FC9    mov         ebx,edx
 00466FCB    mov         dword ptr [ebp-4],eax
 00466FCE    mov         eax,dword ptr [ebp-4]
 00466FD1    call        TGraphicsObject.Lock
 00466FD6    xor         eax,eax
 00466FD8    push        ebp
 00466FD9    push        467009
 00466FDE    push        dword ptr fs:[eax]
 00466FE1    mov         dword ptr fs:[eax],esp
 00466FE4    mov         ecx,ebx
 00466FE6    mov         edx,dword ptr [ebp-4]
 00466FE9    mov         eax,[007930A4];gvar_007930A4
 00466FEE    call        TResourceManager.ChangeResource
 00466FF3    xor         eax,eax
 00466FF5    pop         edx
 00466FF6    pop         ecx
 00466FF7    pop         ecx
 00466FF8    mov         dword ptr fs:[eax],edx
 00466FFB    push        467010
 00467000    mov         eax,dword ptr [ebp-4]
 00467003    call        TGraphicsObject.Unlock
 00467008    ret
>00467009    jmp         @HandleFinally
>0046700E    jmp         00467000
 00467010    pop         ebx
 00467011    pop         ecx
 00467012    pop         ebp
 00467013    ret
*}
end;

//0046701C
procedure TBrush.SetBitmap(Value:TBitmap);
begin
{*
 0046701C    push        esi
 0046701D    push        edi
 0046701E    add         esp,0FFFFFFF0
 00467021    mov         esi,7858C4
 00467026    mov         edi,esp
 00467028    movs        dword ptr [edi],dword ptr [esi]
 00467029    movs        dword ptr [edi],dword ptr [esi]
 0046702A    movs        dword ptr [edi],dword ptr [esi]
 0046702B    movs        dword ptr [edi],dword ptr [esi]
 0046702C    mov         dword ptr [esp+8],edx
 00467030    mov         edx,esp
 00467032    call        TPen.SetData
 00467037    add         esp,10
 0046703A    pop         edi
 0046703B    pop         esi
 0046703C    ret
*}
end;

//00467040
{*function TBrush.GetColor:?;
begin
 00467040    mov         eax,dword ptr [eax+10];TBrush.FResource:PResource
 00467043    mov         eax,dword ptr [eax+18]
 00467046    ret
end;*}

//00467048
procedure TBrush.SetColor(Value:TColor);
begin
{*
 00467048    push        ebx
 00467049    push        esi
 0046704A    add         esp,0FFFFFFF0
 0046704D    mov         esi,edx
 0046704F    mov         ebx,eax
 00467051    mov         eax,dword ptr [ebx+10]
 00467054    cmp         esi,dword ptr [eax+18]
>00467057    je          0046705D
 00467059    mov         al,1
>0046705B    jmp         00467079
 0046705D    mov         eax,ebx
 0046705F    call        TPen.GetStyle
 00467064    cmp         al,1
>00467066    jne         00467073
 00467068    mov         eax,ebx
 0046706A    call        TPen.GetStyle
 0046706F    test        al,al
>00467071    jne         00467077
 00467073    xor         eax,eax
>00467075    jmp         00467079
 00467077    mov         al,1
 00467079    test        al,al
>0046707B    je          0046709F
 0046707D    mov         edx,esp
 0046707F    mov         eax,ebx
 00467081    call        TBrush.GetData
 00467086    mov         dword ptr [esp+4],esi
 0046708A    cmp         byte ptr [esp+0C],1
>0046708F    jne         00467096
 00467091    mov         byte ptr [esp+0C],0
 00467096    mov         edx,esp
 00467098    mov         eax,ebx
 0046709A    call        TPen.SetData
 0046709F    add         esp,10
 004670A2    pop         esi
 004670A3    pop         ebx
 004670A4    ret
*}
end;

//004670A8
function TBrush.GetHandle:HBRUSH;
begin
{*
 004670A8    push        ebp
 004670A9    mov         ebp,esp
 004670AB    add         esp,0FFFFFFE8
 004670AE    mov         eax,dword ptr [eax+10]
 004670B1    mov         dword ptr [ebp-4],eax
 004670B4    mov         eax,dword ptr [ebp-4]
 004670B7    cmp         dword ptr [eax+8],0
>004670BB    jne         00467191
 004670C1    mov         eax,[007930A4];gvar_007930A4
 004670C6    mov         dword ptr [ebp-8],eax
 004670C9    mov         eax,dword ptr [ebp-8]
 004670CC    add         eax,8
 004670CF    push        eax
 004670D0    call        kernel32.EnterCriticalSection
 004670D5    xor         edx,edx
 004670D7    push        ebp
 004670D8    push        46718A
 004670DD    push        dword ptr fs:[edx]
 004670E0    mov         dword ptr fs:[edx],esp
 004670E3    mov         eax,dword ptr [ebp-4]
 004670E6    cmp         dword ptr [eax+8],0
>004670EA    jne         00467168
 004670EC    mov         eax,dword ptr [ebp-4]
 004670EF    mov         eax,dword ptr [eax+1C]
 004670F2    test        eax,eax
>004670F4    je          00467114
 004670F6    mov         dword ptr [ebp-18],3
 004670FD    mov         dl,1
 004670FF    mov         ecx,dword ptr [eax]
 00467101    call        dword ptr [ecx+78]
 00467104    mov         eax,dword ptr [ebp-4]
 00467107    mov         eax,dword ptr [eax+1C]
 0046710A    mov         edx,dword ptr [eax]
 0046710C    call        dword ptr [edx+70]
 0046710F    mov         dword ptr [ebp-10],eax
>00467112    jmp         0046714B
 00467114    xor         eax,eax
 00467116    mov         dword ptr [ebp-10],eax
 00467119    mov         eax,dword ptr [ebp-4]
 0046711C    movzx       eax,byte ptr [eax+20]
 00467120    mov         edx,eax
 00467122    sub         dl,1
>00467125    jb          0046712B
>00467127    je          00467132
>00467129    jmp         0046713B
 0046712B    xor         eax,eax
 0046712D    mov         dword ptr [ebp-18],eax
>00467130    jmp         0046714B
 00467132    mov         dword ptr [ebp-18],1
>00467139    jmp         0046714B
 0046713B    mov         dword ptr [ebp-18],2
 00467142    and         eax,7F
 00467145    sub         eax,2
 00467148    mov         dword ptr [ebp-10],eax
 0046714B    mov         eax,dword ptr [ebp-4]
 0046714E    mov         eax,dword ptr [eax+18]
 00467151    call        ColorToRGB
 00467156    mov         dword ptr [ebp-14],eax
 00467159    lea         eax,[ebp-18]
 0046715C    push        eax
 0046715D    call        gdi32.CreateBrushIndirect
 00467162    mov         edx,dword ptr [ebp-4]
 00467165    mov         dword ptr [edx+8],eax
 00467168    xor         eax,eax
 0046716A    pop         edx
 0046716B    pop         ecx
 0046716C    pop         ecx
 0046716D    mov         dword ptr fs:[eax],edx
 00467170    push        467191
 00467175    mov         eax,[007930A4];gvar_007930A4
 0046717A    mov         dword ptr [ebp-0C],eax
 0046717D    mov         eax,dword ptr [ebp-0C]
 00467180    add         eax,8
 00467183    push        eax
 00467184    call        kernel32.LeaveCriticalSection
 00467189    ret
>0046718A    jmp         @HandleFinally
>0046718F    jmp         00467175
 00467191    mov         eax,dword ptr [ebp-4]
 00467194    mov         eax,dword ptr [eax+8]
 00467197    mov         esp,ebp
 00467199    pop         ebp
 0046719A    ret
*}
end;

//004671C0
function TPen.GetStyle:TPenStyle;
begin
{*
 004671C0    mov         eax,dword ptr [eax+10]
 004671C3    movzx       eax,byte ptr [eax+20]
 004671C7    ret
*}
end;

//004671C8
procedure TBrush.SetStyle(Value:TBrushStyle);
begin
{*
 004671C8    push        ebx
 004671C9    push        esi
 004671CA    add         esp,0FFFFFFF0
 004671CD    mov         ebx,edx
 004671CF    mov         esi,eax
 004671D1    mov         eax,dword ptr [esi+10]
 004671D4    cmp         bl,byte ptr [eax+20]
>004671D7    je          004671DD
 004671D9    mov         al,1
>004671DB    jmp         004671F0
 004671DD    cmp         bl,1
>004671E0    jne         004671EE
 004671E2    cmp         dword ptr [eax+18],0FFFFFF
 004671E9    setne       al
>004671EC    jmp         004671F0
 004671EE    xor         eax,eax
 004671F0    test        al,al
>004671F2    je          00467218
 004671F4    mov         edx,esp
 004671F6    mov         eax,esi
 004671F8    call        TBrush.GetData
 004671FD    mov         eax,ebx
 004671FF    mov         byte ptr [esp+0C],al
 00467203    cmp         al,1
>00467205    jne         0046720F
 00467207    mov         dword ptr [esp+4],0FFFFFF
 0046720F    mov         edx,esp
 00467211    mov         eax,esi
 00467213    call        TPen.SetData
 00467218    add         esp,10
 0046721B    pop         esi
 0046721C    pop         ebx
 0046721D    ret
*}
end;

//00467220
procedure TGraphicsObject.Changed;
begin
{*
 00467220    push        ebx
 00467221    cmp         word ptr [eax+0A],0
>00467226    je          00467232
 00467228    mov         ebx,eax
 0046722A    mov         edx,eax
 0046722C    mov         eax,dword ptr [ebx+0C]
 0046722F    call        dword ptr [ebx+8]
 00467232    pop         ebx
 00467233    ret
*}
end;

//00467234
procedure TCustomCanvas.Changing;
begin
{*
 00467234    push        ebx
 00467235    cmp         word ptr [eax+12],0
>0046723A    je          00467246
 0046723C    mov         ebx,eax
 0046723E    mov         edx,eax
 00467240    mov         eax,dword ptr [ebx+14]
 00467243    call        dword ptr [ebx+10]
 00467246    pop         ebx
 00467247    ret
*}
end;

//00467248
procedure TCustomCanvas.Ellipse(Rect:TRect);
begin
{*
 00467248    push        ebx
 00467249    mov         ecx,dword ptr [edx+8]
 0046724C    push        ecx
 0046724D    mov         ecx,dword ptr [edx+0C]
 00467250    push        ecx
 00467251    mov         ecx,dword ptr [edx+4]
 00467254    mov         edx,dword ptr [edx]
 00467256    mov         ebx,dword ptr [eax]
 00467258    call        dword ptr [ebx+50]
 0046725B    pop         ebx
 0046725C    ret
*}
end;

//00467260
procedure TCustomCanvas.Lock;
begin
{*
 00467260    push        ebx
 00467261    mov         ebx,eax
 00467263    push        793084
 00467268    call        kernel32.EnterCriticalSection
 0046726D    inc         dword ptr [ebx+34]
 00467270    push        793084
 00467275    call        kernel32.LeaveCriticalSection
 0046727A    lea         eax,[ebx+1C]
 0046727D    push        eax
 0046727E    call        kernel32.EnterCriticalSection
 00467283    pop         ebx
 00467284    ret
*}
end;

//00467288
procedure TCustomCanvas.Rectangle(Rect:TRect);
begin
{*
 00467288    push        ebx
 00467289    mov         ecx,dword ptr [edx+8]
 0046728C    push        ecx
 0046728D    mov         ecx,dword ptr [edx+0C]
 00467290    push        ecx
 00467291    mov         ecx,dword ptr [edx+4]
 00467294    mov         edx,dword ptr [edx]
 00467296    mov         ebx,dword ptr [eax]
 00467298    call        dword ptr [ebx+7C]
 0046729B    pop         ebx
 0046729C    ret
*}
end;

//004672A0
procedure TCustomCanvas.RoundRect(Rect:TRect; CX:Integer; CY:Integer);
begin
{*
 004672A0    push        ebp
 004672A1    mov         ebp,esp
 004672A3    push        ebx
 004672A4    push        esi
 004672A5    mov         esi,eax
 004672A7    mov         eax,dword ptr [edx+8]
 004672AA    push        eax
 004672AB    mov         eax,dword ptr [edx+0C]
 004672AE    push        eax
 004672AF    push        ecx
 004672B0    mov         eax,dword ptr [ebp+8]
 004672B3    push        eax
 004672B4    mov         eax,dword ptr [edx]
 004672B6    mov         ecx,dword ptr [edx+4]
 004672B9    mov         edx,esi
 004672BB    xchg        eax,edx
 004672BC    mov         ebx,dword ptr [eax]
 004672BE    call        dword ptr [ebx+84]
 004672C4    pop         esi
 004672C5    pop         ebx
 004672C6    pop         ebp
 004672C7    ret         4
*}
end;

//004672CC
function TCustomCanvas.TextHeight(Text:string):Integer;
begin
{*
 004672CC    push        ebx
 004672CD    push        esi
 004672CE    add         esp,0FFFFFFF8
 004672D1    mov         esi,edx
 004672D3    mov         ebx,eax
 004672D5    mov         ecx,esp
 004672D7    mov         edx,esi
 004672D9    mov         eax,ebx
 004672DB    mov         ebx,dword ptr [eax]
 004672DD    call        dword ptr [ebx+8C]
 004672E3    mov         eax,dword ptr [esp+4]
 004672E7    pop         ecx
 004672E8    pop         edx
 004672E9    pop         esi
 004672EA    pop         ebx
 004672EB    ret
*}
end;

//004672EC
function TCustomCanvas.TextWidth(Text:string):Integer;
begin
{*
 004672EC    push        ebx
 004672ED    push        esi
 004672EE    add         esp,0FFFFFFF8
 004672F1    mov         esi,edx
 004672F3    mov         ebx,eax
 004672F5    mov         ecx,esp
 004672F7    mov         edx,esi
 004672F9    mov         eax,ebx
 004672FB    mov         ebx,dword ptr [eax]
 004672FD    call        dword ptr [ebx+8C]
 00467303    mov         eax,dword ptr [esp]
 00467306    pop         ecx
 00467307    pop         edx
 00467308    pop         esi
 00467309    pop         ebx
 0046730A    ret
*}
end;

//0046730C
function TCustomCanvas.TryLock:Boolean;
begin
{*
 0046730C    push        ebp
 0046730D    mov         ebp,esp
 0046730F    push        ecx
 00467310    push        ebx
 00467311    mov         ebx,eax
 00467313    push        793084
 00467318    call        kernel32.EnterCriticalSection
 0046731D    xor         eax,eax
 0046731F    push        ebp
 00467320    push        467358
 00467325    push        dword ptr fs:[eax]
 00467328    mov         dword ptr fs:[eax],esp
 0046732B    cmp         dword ptr [ebx+34],0
 0046732F    sete        byte ptr [ebp-1]
 00467333    cmp         byte ptr [ebp-1],0
>00467337    je          00467340
 00467339    mov         eax,ebx
 0046733B    call        TCustomCanvas.Lock
 00467340    xor         eax,eax
 00467342    pop         edx
 00467343    pop         ecx
 00467344    pop         ecx
 00467345    mov         dword ptr fs:[eax],edx
 00467348    push        46735F
 0046734D    push        793084
 00467352    call        kernel32.LeaveCriticalSection
 00467357    ret
>00467358    jmp         @HandleFinally
>0046735D    jmp         0046734D
 0046735F    movzx       eax,byte ptr [ebp-1]
 00467363    pop         ebx
 00467364    pop         ecx
 00467365    pop         ebp
 00467366    ret
*}
end;

//00467368
procedure TCustomCanvas.Unlock;
begin
{*
 00467368    push        ebx
 00467369    mov         ebx,eax
 0046736B    lea         eax,[ebx+1C]
 0046736E    push        eax
 0046736F    call        kernel32.LeaveCriticalSection
 00467374    push        793084
 00467379    call        kernel32.EnterCriticalSection
 0046737E    dec         dword ptr [ebx+34]
 00467381    push        793084
 00467386    call        kernel32.LeaveCriticalSection
 0046738B    pop         ebx
 0046738C    ret
*}
end;

//00467390
constructor TCanvas.Create();
begin
{*
 00467390    push        ebx
 00467391    push        esi
 00467392    push        edi
 00467393    test        dl,dl
>00467395    je          0046739F
 00467397    add         esp,0FFFFFFF0
 0046739A    call        @ClassCreate
 0046739F    mov         ebx,edx
 004673A1    mov         edi,eax
 004673A3    xor         edx,edx
 004673A5    mov         eax,edi
 004673A7    call        TObject.Create
 004673AC    lea         eax,[edi+1C]
 004673AF    push        eax
 004673B0    call        kernel32.InitializeCriticalSection
 004673B5    mov         dl,1
 004673B7    mov         eax,[0045FAE8];TFont
 004673BC    call        TFont.Create
 004673C1    mov         esi,eax
 004673C3    mov         dword ptr [edi+40],esi
 004673C6    mov         dword ptr [esi+0C],edi
 004673C9    mov         dword ptr [esi+8],468410;TCanvas.FontChanged
 004673D0    lea         eax,[edi+1C]
 004673D3    mov         dword ptr [esi+14],eax
 004673D6    mov         dl,1
 004673D8    mov         eax,[0045FE60];TPen
 004673DD    call        TPen.Create
 004673E2    mov         esi,eax
 004673E4    mov         dword ptr [edi+44],esi
 004673E7    mov         dword ptr [esi+0C],edi
 004673EA    mov         dword ptr [esi+8],468430;TCanvas.PenChanged
 004673F1    lea         eax,[edi+1C]
 004673F4    mov         dword ptr [esi+14],eax
 004673F7    mov         dl,1
 004673F9    mov         eax,[00460070];TBrush
 004673FE    call        TBrush.Create
 00467403    mov         esi,eax
 00467405    mov         dword ptr [edi+48],esi
 00467408    mov         dword ptr [esi+0C],edi
 0046740B    mov         dword ptr [esi+8],468450;TCanvas.BrushChanged
 00467412    lea         eax,[edi+1C]
 00467415    mov         dword ptr [esi+14],eax
 00467418    mov         dword ptr [edi+54],0CC0020
 0046741F    movzx       eax,byte ptr ds:[467450]
 00467426    mov         byte ptr [edi+3C],al
 00467429    mov         edx,edi
 0046742B    mov         eax,[007930A8]
 00467430    call        TThreadList.Add
 00467435    mov         eax,edi
 00467437    test        bl,bl
>00467439    je          0046744A
 0046743B    call        @AfterConstruction
 00467440    pop         dword ptr fs:[0]
 00467447    add         esp,0C
 0046744A    mov         eax,edi
 0046744C    pop         edi
 0046744D    pop         esi
 0046744E    pop         ebx
 0046744F    ret
*}
end;

//00467454
destructor TCanvas.Destroy();
begin
{*
 00467454    push        ebx
 00467455    push        esi
 00467456    call        @BeforeDestruction
 0046745B    mov         ebx,edx
 0046745D    mov         esi,eax
 0046745F    mov         cl,1
 00467461    mov         edx,esi
 00467463    mov         eax,[007930A8]
 00467468    call        TThreadList.RemoveItem
 0046746D    xor         edx,edx
 0046746F    mov         eax,esi
 00467471    call        TCanvas.SetHandle
 00467476    mov         eax,dword ptr [esi+40]
 00467479    call        TObject.Free
 0046747E    mov         eax,dword ptr [esi+44]
 00467481    call        TObject.Free
 00467486    mov         eax,dword ptr [esi+48]
 00467489    call        TObject.Free
 0046748E    lea         eax,[esi+1C]
 00467491    push        eax
 00467492    call        kernel32.DeleteCriticalSection
 00467497    mov         edx,ebx
 00467499    and         dl,0FC
 0046749C    mov         eax,esi
 0046749E    call        TMemoryStream.Destroy
 004674A3    test        bl,bl
>004674A5    jle         004674AE
 004674A7    mov         eax,esi
 004674A9    call        @ClassDestroy
 004674AE    pop         esi
 004674AF    pop         ebx
 004674B0    ret
*}
end;

//004674B4
procedure TCanvas.Arc(X1:Integer; Y1:Integer; Y4:Integer; X4:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer);
begin
{*
 004674B4    push        ebp
 004674B5    mov         ebp,esp
 004674B7    push        ebx
 004674B8    push        esi
 004674B9    push        edi
 004674BA    mov         edi,ecx
 004674BC    mov         esi,edx
 004674BE    mov         ebx,eax
 004674C0    mov         eax,ebx
 004674C2    mov         edx,dword ptr [eax]
 004674C4    call        dword ptr [edx+28]
 004674C7    movzx       edx,byte ptr ds:[467508]
 004674CE    mov         eax,ebx
 004674D0    mov         ecx,dword ptr [eax]
 004674D2    call        dword ptr [ecx+2C]
 004674D5    mov         eax,dword ptr [ebp+8]
 004674D8    push        eax
 004674D9    mov         eax,dword ptr [ebp+0C]
 004674DC    push        eax
 004674DD    mov         eax,dword ptr [ebp+10]
 004674E0    push        eax
 004674E1    mov         eax,dword ptr [ebp+14]
 004674E4    push        eax
 004674E5    mov         eax,dword ptr [ebp+18]
 004674E8    push        eax
 004674E9    mov         eax,dword ptr [ebp+1C]
 004674EC    push        eax
 004674ED    push        edi
 004674EE    push        esi
 004674EF    mov         eax,dword ptr [ebx+38]
 004674F2    push        eax
 004674F3    call        gdi32.Arc
 004674F8    mov         eax,ebx
 004674FA    mov         edx,dword ptr [eax]
 004674FC    call        dword ptr [edx+24]
 004674FF    pop         edi
 00467500    pop         esi
 00467501    pop         ebx
 00467502    pop         ebp
 00467503    ret         18
*}
end;

//0046750C
procedure TCanvas.ArcTo(X1:Integer; Y1:Integer; Y4:Integer; X4:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer);
begin
{*
 0046750C    push        ebp
 0046750D    mov         ebp,esp
 0046750F    push        ebx
 00467510    push        esi
 00467511    push        edi
 00467512    mov         edi,ecx
 00467514    mov         esi,edx
 00467516    mov         ebx,eax
 00467518    mov         eax,ebx
 0046751A    mov         edx,dword ptr [eax]
 0046751C    call        dword ptr [edx+28]
 0046751F    movzx       edx,byte ptr ds:[467560]
 00467526    mov         eax,ebx
 00467528    mov         ecx,dword ptr [eax]
 0046752A    call        dword ptr [ecx+2C]
 0046752D    mov         eax,dword ptr [ebp+8]
 00467530    push        eax
 00467531    mov         eax,dword ptr [ebp+0C]
 00467534    push        eax
 00467535    mov         eax,dword ptr [ebp+10]
 00467538    push        eax
 00467539    mov         eax,dword ptr [ebp+14]
 0046753C    push        eax
 0046753D    mov         eax,dword ptr [ebp+18]
 00467540    push        eax
 00467541    mov         eax,dword ptr [ebp+1C]
 00467544    push        eax
 00467545    push        edi
 00467546    push        esi
 00467547    mov         eax,dword ptr [ebx+38]
 0046754A    push        eax
 0046754B    call        gdi32.ArcTo
 00467550    mov         eax,ebx
 00467552    mov         edx,dword ptr [eax]
 00467554    call        dword ptr [edx+24]
 00467557    pop         edi
 00467558    pop         esi
 00467559    pop         ebx
 0046755A    pop         ebp
 0046755B    ret         18
*}
end;

//00467564
procedure TCanvas.AngleArc(X:Integer; Y:Integer; SweepAngle:Single; StartAngle:Single; Radius:Cardinal);
begin
{*
 00467564    push        ebp
 00467565    mov         ebp,esp
 00467567    push        ebx
 00467568    push        esi
 00467569    push        edi
 0046756A    mov         edi,ecx
 0046756C    mov         esi,edx
 0046756E    mov         ebx,eax
 00467570    mov         eax,ebx
 00467572    mov         edx,dword ptr [eax]
 00467574    call        dword ptr [edx+28]
 00467577    movzx       edx,byte ptr ds:[4675A8]
 0046757E    mov         eax,ebx
 00467580    mov         ecx,dword ptr [eax]
 00467582    call        dword ptr [ecx+2C]
 00467585    push        dword ptr [ebp+8]
 00467588    push        dword ptr [ebp+0C]
 0046758B    mov         eax,dword ptr [ebp+10]
 0046758E    push        eax
 0046758F    push        edi
 00467590    push        esi
 00467591    mov         eax,dword ptr [ebx+38]
 00467594    push        eax
 00467595    call        gdi32.AngleArc
 0046759A    mov         eax,ebx
 0046759C    mov         edx,dword ptr [eax]
 0046759E    call        dword ptr [edx+24]
 004675A1    pop         edi
 004675A2    pop         esi
 004675A3    pop         ebx
 004675A4    pop         ebp
 004675A5    ret         0C
*}
end;

//004675AC
procedure TCanvas.BrushCopy(Dest:TRect; Bitmap:TBitmap; Color:TColor; Source:TRect);
begin
{*
 004675AC    push        ebp
 004675AD    mov         ebp,esp
 004675AF    add         esp,0FFFFFFD8
 004675B2    push        ebx
 004675B3    push        esi
 004675B4    push        edi
 004675B5    mov         dword ptr [ebp-8],ecx
 004675B8    mov         esi,edx
 004675BA    mov         dword ptr [ebp-4],eax
 004675BD    mov         ebx,dword ptr [ebp+0C]
 004675C0    cmp         dword ptr [ebp-8],0
>004675C4    je          0046785C
 004675CA    mov         eax,dword ptr [ebp-4]
 004675CD    call        TCustomCanvas.Lock
 004675D2    xor         eax,eax
 004675D4    push        ebp
 004675D5    push        467855
 004675DA    push        dword ptr fs:[eax]
 004675DD    mov         dword ptr fs:[eax],esp
 004675E0    mov         eax,dword ptr [ebp-4]
 004675E3    mov         edx,dword ptr [eax]
 004675E5    call        dword ptr [edx+28]
 004675E8    movzx       edx,byte ptr ds:[467868]
 004675EF    mov         eax,dword ptr [ebp-4]
 004675F2    mov         ecx,dword ptr [eax]
 004675F4    call        dword ptr [ecx+2C]
 004675F7    mov         eax,dword ptr [ebp-8]
 004675FA    call        TBitmap.GetCanvas
 004675FF    call        TCustomCanvas.Lock
 00467604    xor         eax,eax
 00467606    push        ebp
 00467607    push        467830
 0046760C    push        dword ptr fs:[eax]
 0046760F    mov         dword ptr fs:[eax],esp
 00467612    mov         eax,dword ptr [esi+8]
 00467615    sub         eax,dword ptr [esi]
 00467617    mov         dword ptr [ebp-10],eax
 0046761A    mov         eax,dword ptr [esi+0C]
 0046761D    sub         eax,dword ptr [esi+4]
 00467620    mov         dword ptr [ebp-14],eax
 00467623    mov         edi,dword ptr [ebx+8]
 00467626    sub         edi,dword ptr [ebx]
 00467628    mov         eax,dword ptr [ebx+0C]
 0046762B    sub         eax,dword ptr [ebx+4]
 0046762E    mov         dword ptr [ebp-0C],eax
 00467631    mov         eax,dword ptr [ebp-8]
 00467634    call        TBitmap.GetTransparentColor
 00467639    cmp         eax,dword ptr [ebp+8]
>0046763C    jne         0046766A
 0046763E    xor         eax,eax
 00467640    mov         dword ptr [ebp-24],eax
 00467643    mov         eax,dword ptr [ebp-8]
 00467646    mov         edx,dword ptr [eax]
 00467648    call        dword ptr [edx+74]
 0046764B    mov         dword ptr [ebp-28],eax
 0046764E    push        0
 00467650    call        gdi32.CreateCompatibleDC
 00467655    mov         dword ptr [ebp-20],eax
 00467658    mov         eax,dword ptr [ebp-28]
 0046765B    push        eax
 0046765C    mov         eax,dword ptr [ebp-20]
 0046765F    push        eax
 00467660    call        gdi32.SelectObject
 00467665    mov         dword ptr [ebp-28],eax
>00467668    jmp         004676B6
 0046766A    mov         dl,1
 0046766C    mov         eax,[00463B28];TBitmap
 00467671    call        TBitmap.Create
 00467676    mov         dword ptr [ebp-24],eax
 00467679    mov         edx,dword ptr [ebp-8]
 0046767C    mov         eax,dword ptr [ebp-24]
 0046767F    mov         ecx,dword ptr [eax]
 00467681    call        dword ptr [ecx+8]
 00467684    mov         edx,dword ptr [ebp+8]
 00467687    mov         eax,dword ptr [ebp-24]
 0046768A    call        TBitmap.Mask
 0046768F    mov         eax,dword ptr [ebp-24]
 00467692    call        TBitmap.GetCanvas
 00467697    movzx       edx,byte ptr ds:[46786C]
 0046769E    mov         ecx,dword ptr [eax]
 004676A0    call        dword ptr [ecx+2C]
 004676A3    mov         eax,dword ptr [ebp-24]
 004676A6    call        TBitmap.GetCanvas
 004676AB    mov         eax,dword ptr [eax+38]
 004676AE    mov         dword ptr [ebp-20],eax
 004676B1    xor         eax,eax
 004676B3    mov         dword ptr [ebp-28],eax
 004676B6    xor         eax,eax
 004676B8    push        ebp
 004676B9    push        46780E
 004676BE    push        dword ptr fs:[eax]
 004676C1    mov         dword ptr fs:[eax],esp
 004676C4    mov         eax,dword ptr [ebp-8]
 004676C7    call        TBitmap.GetCanvas
 004676CC    movzx       edx,byte ptr ds:[46786C]
 004676D3    mov         ecx,dword ptr [eax]
 004676D5    call        dword ptr [ecx+2C]
 004676D8    mov         eax,dword ptr [ebp-4]
 004676DB    mov         eax,dword ptr [eax+48]
 004676DE    mov         eax,dword ptr [eax+10]
 004676E1    cmp         byte ptr [eax+20],1
>004676E5    jne         00467727
 004676E7    mov         eax,dword ptr [ebp-10]
 004676EA    push        eax
 004676EB    mov         eax,dword ptr [ebp-14]
 004676EE    push        eax
 004676EF    mov         eax,dword ptr [ebp-8]
 004676F2    call        TBitmap.GetCanvas
 004676F7    mov         eax,dword ptr [eax+38]
 004676FA    push        eax
 004676FB    mov         eax,dword ptr [ebx]
 004676FD    push        eax
 004676FE    mov         eax,dword ptr [ebx+4]
 00467701    push        eax
 00467702    push        edi
 00467703    mov         eax,dword ptr [ebp-0C]
 00467706    push        eax
 00467707    mov         eax,dword ptr [ebp-20]
 0046770A    push        eax
 0046770B    mov         eax,dword ptr [ebx]
 0046770D    push        eax
 0046770E    mov         eax,dword ptr [ebx+4]
 00467711    push        eax
 00467712    mov         ecx,dword ptr [esi+4]
 00467715    mov         edx,dword ptr [esi]
 00467717    mov         eax,dword ptr [ebp-4]
 0046771A    mov         eax,dword ptr [eax+38]
 0046771D    call        TransparentStretchBlt
>00467722    jmp         004677D4
 00467727    push        0CC0020
 0046772C    mov         eax,dword ptr [ebp-0C]
 0046772F    push        eax
 00467730    push        edi
 00467731    mov         eax,dword ptr [ebx+4]
 00467734    push        eax
 00467735    mov         eax,dword ptr [ebx]
 00467737    push        eax
 00467738    mov         eax,dword ptr [ebp-8]
 0046773B    call        TBitmap.GetCanvas
 00467740    mov         eax,dword ptr [eax+38]
 00467743    push        eax
 00467744    mov         eax,dword ptr [ebp-14]
 00467747    push        eax
 00467748    mov         eax,dword ptr [ebp-10]
 0046774B    push        eax
 0046774C    mov         eax,dword ptr [esi+4]
 0046774F    push        eax
 00467750    mov         eax,dword ptr [esi]
 00467752    push        eax
 00467753    mov         eax,dword ptr [ebp-4]
 00467756    mov         eax,dword ptr [eax+38]
 00467759    push        eax
 0046775A    call        gdi32.StretchBlt
 0046775F    push        0
 00467761    mov         eax,dword ptr [ebp-4]
 00467764    mov         eax,dword ptr [eax+38]
 00467767    push        eax
 00467768    call        gdi32.SetTextColor
 0046776D    mov         dword ptr [ebp-1C],eax
 00467770    push        0FFFFFF
 00467775    mov         eax,dword ptr [ebp-4]
 00467778    mov         eax,dword ptr [eax+38]
 0046777B    push        eax
 0046777C    call        gdi32.SetBkColor
 00467781    mov         dword ptr [ebp-18],eax
 00467784    push        0E20746
 00467789    mov         eax,dword ptr [ebp-0C]
 0046778C    push        eax
 0046778D    push        edi
 0046778E    mov         eax,dword ptr [ebx+4]
 00467791    push        eax
 00467792    mov         eax,dword ptr [ebx]
 00467794    push        eax
 00467795    mov         eax,dword ptr [ebp-20]
 00467798    push        eax
 00467799    mov         eax,dword ptr [ebp-14]
 0046779C    push        eax
 0046779D    mov         eax,dword ptr [ebp-10]
 004677A0    push        eax
 004677A1    mov         eax,dword ptr [esi+4]
 004677A4    push        eax
 004677A5    mov         eax,dword ptr [esi]
 004677A7    push        eax
 004677A8    mov         eax,dword ptr [ebp-4]
 004677AB    mov         eax,dword ptr [eax+38]
 004677AE    push        eax
 004677AF    call        gdi32.StretchBlt
 004677B4    mov         eax,dword ptr [ebp-1C]
 004677B7    push        eax
 004677B8    mov         eax,dword ptr [ebp-4]
 004677BB    mov         eax,dword ptr [eax+38]
 004677BE    push        eax
 004677BF    call        gdi32.SetTextColor
 004677C4    mov         eax,dword ptr [ebp-18]
 004677C7    push        eax
 004677C8    mov         eax,dword ptr [ebp-4]
 004677CB    mov         eax,dword ptr [eax+38]
 004677CE    push        eax
 004677CF    call        gdi32.SetBkColor
 004677D4    xor         eax,eax
 004677D6    pop         edx
 004677D7    pop         ecx
 004677D8    pop         ecx
 004677D9    mov         dword ptr fs:[eax],edx
 004677DC    push        467815
 004677E1    cmp         dword ptr [ebp-24],0
>004677E5    je          004677F1
 004677E7    mov         eax,dword ptr [ebp-24]
 004677EA    call        TObject.Free
>004677EF    jmp         0046780D
 004677F1    cmp         dword ptr [ebp-28],0
>004677F5    je          00467804
 004677F7    mov         eax,dword ptr [ebp-28]
 004677FA    push        eax
 004677FB    mov         eax,dword ptr [ebp-20]
 004677FE    push        eax
 004677FF    call        gdi32.SelectObject
 00467804    mov         eax,dword ptr [ebp-20]
 00467807    push        eax
 00467808    call        gdi32.DeleteDC
 0046780D    ret
>0046780E    jmp         @HandleFinally
>00467813    jmp         004677E1
 00467815    xor         eax,eax
 00467817    pop         edx
 00467818    pop         ecx
 00467819    pop         ecx
 0046781A    mov         dword ptr fs:[eax],edx
 0046781D    push        467837
 00467822    mov         eax,dword ptr [ebp-8]
 00467825    call        TBitmap.GetCanvas
 0046782A    call        TCustomCanvas.Unlock
 0046782F    ret
>00467830    jmp         @HandleFinally
>00467835    jmp         00467822
 00467837    mov         eax,dword ptr [ebp-4]
 0046783A    mov         edx,dword ptr [eax]
 0046783C    call        dword ptr [edx+24]
 0046783F    xor         eax,eax
 00467841    pop         edx
 00467842    pop         ecx
 00467843    pop         ecx
 00467844    mov         dword ptr fs:[eax],edx
 00467847    push        46785C
 0046784C    mov         eax,dword ptr [ebp-4]
 0046784F    call        TCustomCanvas.Unlock
 00467854    ret
>00467855    jmp         @HandleFinally
>0046785A    jmp         0046784C
 0046785C    pop         edi
 0046785D    pop         esi
 0046785E    pop         ebx
 0046785F    mov         esp,ebp
 00467861    pop         ebp
 00467862    ret         8
*}
end;

//00467870
procedure TCanvas.Chord(X1:Integer; Y1:Integer; Y4:Integer; X4:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer);
begin
{*
 00467870    push        ebp
 00467871    mov         ebp,esp
 00467873    push        ebx
 00467874    push        esi
 00467875    push        edi
 00467876    mov         edi,ecx
 00467878    mov         esi,edx
 0046787A    mov         ebx,eax
 0046787C    mov         eax,ebx
 0046787E    mov         edx,dword ptr [eax]
 00467880    call        dword ptr [edx+28]
 00467883    movzx       edx,byte ptr ds:[4678C4]
 0046788A    mov         eax,ebx
 0046788C    mov         ecx,dword ptr [eax]
 0046788E    call        dword ptr [ecx+2C]
 00467891    mov         eax,dword ptr [ebp+8]
 00467894    push        eax
 00467895    mov         eax,dword ptr [ebp+0C]
 00467898    push        eax
 00467899    mov         eax,dword ptr [ebp+10]
 0046789C    push        eax
 0046789D    mov         eax,dword ptr [ebp+14]
 004678A0    push        eax
 004678A1    mov         eax,dword ptr [ebp+18]
 004678A4    push        eax
 004678A5    mov         eax,dword ptr [ebp+1C]
 004678A8    push        eax
 004678A9    push        edi
 004678AA    push        esi
 004678AB    mov         eax,dword ptr [ebx+38]
 004678AE    push        eax
 004678AF    call        gdi32.Chord
 004678B4    mov         eax,ebx
 004678B6    mov         edx,dword ptr [eax]
 004678B8    call        dword ptr [edx+24]
 004678BB    pop         edi
 004678BC    pop         esi
 004678BD    pop         ebx
 004678BE    pop         ebp
 004678BF    ret         18
*}
end;

//004678C8
procedure TCanvas.CopyRect(Dest:TRect; Canvas:TCanvas; Source:TRect);
begin
{*
 004678C8    push        ebp
 004678C9    mov         ebp,esp
 004678CB    push        ecx
 004678CC    push        ebx
 004678CD    push        esi
 004678CE    push        edi
 004678CF    mov         dword ptr [ebp-4],ecx
 004678D2    mov         esi,edx
 004678D4    mov         ebx,eax
 004678D6    mov         edi,dword ptr [ebp+8]
 004678D9    mov         eax,ebx
 004678DB    mov         edx,dword ptr [eax]
 004678DD    call        dword ptr [edx+28]
 004678E0    movzx       edx,byte ptr ds:[467948]
 004678E7    mov         eax,ebx
 004678E9    mov         ecx,dword ptr [eax]
 004678EB    call        dword ptr [ecx+2C]
 004678EE    movzx       edx,byte ptr ds:[46794C]
 004678F5    mov         eax,dword ptr [ebp-4]
 004678F8    mov         ecx,dword ptr [eax]
 004678FA    call        dword ptr [ecx+2C]
 004678FD    mov         edx,dword ptr [ebx+54]
 00467900    push        edx
 00467901    mov         edx,dword ptr [edi+0C]
 00467904    sub         edx,dword ptr [edi+4]
 00467907    push        edx
 00467908    mov         edx,dword ptr [edi+8]
 0046790B    sub         edx,dword ptr [edi]
 0046790D    push        edx
 0046790E    mov         edx,dword ptr [edi+4]
 00467911    push        edx
 00467912    mov         edx,dword ptr [edi]
 00467914    push        edx
 00467915    mov         edx,dword ptr [ebp-4]
 00467918    mov         edx,dword ptr [edx+38]
 0046791B    push        edx
 0046791C    mov         edx,dword ptr [esi+0C]
 0046791F    sub         edx,dword ptr [esi+4]
 00467922    push        edx
 00467923    mov         edx,dword ptr [esi+8]
 00467926    mov         eax,dword ptr [esi]
 00467928    sub         edx,eax
 0046792A    push        edx
 0046792B    mov         edx,dword ptr [esi+4]
 0046792E    push        edx
 0046792F    push        eax
 00467930    mov         eax,dword ptr [ebx+38]
 00467933    push        eax
 00467934    call        gdi32.StretchBlt
 00467939    mov         eax,ebx
 0046793B    mov         edx,dword ptr [eax]
 0046793D    call        dword ptr [edx+24]
 00467940    pop         edi
 00467941    pop         esi
 00467942    pop         ebx
 00467943    pop         ecx
 00467944    pop         ebp
 00467945    ret         4
*}
end;

//00467950
procedure TCanvas.Draw(X:Integer; Y:Integer; Graphic:TGraphic);
begin
{*
 00467950    push        ebp
 00467951    mov         ebp,esp
 00467953    add         esp,0FFFFFFEC
 00467956    push        ebx
 00467957    push        esi
 00467958    push        edi
 00467959    mov         dword ptr [ebp-4],ecx
 0046795C    mov         edi,edx
 0046795E    mov         ebx,eax
 00467960    mov         esi,dword ptr [ebp+8]
 00467963    test        esi,esi
>00467965    je          004679EF
 0046796B    mov         eax,esi
 0046796D    mov         edx,dword ptr [eax]
 0046796F    call        dword ptr [edx+20]
 00467972    test        al,al
>00467974    jne         004679EF
 00467976    mov         eax,ebx
 00467978    mov         edx,dword ptr [eax]
 0046797A    call        dword ptr [edx+28]
 0046797D    movzx       edx,byte ptr ds:[4679F8]
 00467984    mov         eax,ebx
 00467986    mov         ecx,dword ptr [eax]
 00467988    call        dword ptr [ecx+2C]
 0046798B    mov         eax,dword ptr [ebx+48]
 0046798E    mov         eax,dword ptr [eax+10]
 00467991    mov         eax,dword ptr [eax+18]
 00467994    call        ColorToRGB
 00467999    push        eax
 0046799A    mov         eax,dword ptr [ebx+38]
 0046799D    push        eax
 0046799E    call        gdi32.SetBkColor
 004679A3    mov         eax,dword ptr [ebx+40]
 004679A6    mov         eax,dword ptr [eax+18]
 004679A9    call        ColorToRGB
 004679AE    push        eax
 004679AF    mov         eax,dword ptr [ebx+38]
 004679B2    push        eax
 004679B3    call        gdi32.SetTextColor
 004679B8    mov         eax,esi
 004679BA    mov         edx,dword ptr [eax]
 004679BC    call        dword ptr [edx+24]
 004679BF    add         eax,dword ptr [ebp-4]
 004679C2    push        eax
 004679C3    lea         eax,[ebp-14]
 004679C6    push        eax
 004679C7    mov         eax,esi
 004679C9    mov         edx,dword ptr [eax]
 004679CB    call        dword ptr [edx+30]
 004679CE    mov         ecx,eax
 004679D0    add         ecx,edi
 004679D2    mov         edx,dword ptr [ebp-4]
 004679D5    mov         eax,edi
 004679D7    call        Rect
 004679DC    lea         ecx,[ebp-14]
 004679DF    mov         edx,ebx
 004679E1    mov         eax,esi
 004679E3    mov         esi,dword ptr [eax]
 004679E5    call        dword ptr [esi+14]
 004679E8    mov         eax,ebx
 004679EA    mov         edx,dword ptr [eax]
 004679EC    call        dword ptr [edx+24]
 004679EF    pop         edi
 004679F0    pop         esi
 004679F1    pop         ebx
 004679F2    mov         esp,ebp
 004679F4    pop         ebp
 004679F5    ret         4
*}
end;

//004679FC
procedure TCanvas.Draw(X:Integer; Y:Integer; Opacity:Byte; Graphic:TGraphic);
begin
{*
 004679FC    push        ebp
 004679FD    mov         ebp,esp
 004679FF    add         esp,0FFFFFFEC
 00467A02    push        ebx
 00467A03    push        esi
 00467A04    push        edi
 00467A05    mov         dword ptr [ebp-4],ecx
 00467A08    mov         edi,edx
 00467A0A    mov         ebx,eax
 00467A0C    mov         esi,dword ptr [ebp+0C]
 00467A0F    test        esi,esi
>00467A11    je          00467AA0
 00467A17    mov         eax,esi
 00467A19    mov         edx,dword ptr [eax]
 00467A1B    call        dword ptr [edx+20]
 00467A1E    test        al,al
>00467A20    jne         00467AA0
 00467A22    mov         eax,ebx
 00467A24    mov         edx,dword ptr [eax]
 00467A26    call        dword ptr [edx+28]
 00467A29    movzx       edx,byte ptr ds:[467AAC]
 00467A30    mov         eax,ebx
 00467A32    mov         ecx,dword ptr [eax]
 00467A34    call        dword ptr [ecx+2C]
 00467A37    mov         eax,dword ptr [ebx+48]
 00467A3A    mov         eax,dword ptr [eax+10]
 00467A3D    mov         eax,dword ptr [eax+18]
 00467A40    call        ColorToRGB
 00467A45    push        eax
 00467A46    mov         eax,dword ptr [ebx+38]
 00467A49    push        eax
 00467A4A    call        gdi32.SetBkColor
 00467A4F    mov         eax,dword ptr [ebx+40]
 00467A52    mov         eax,dword ptr [eax+18]
 00467A55    call        ColorToRGB
 00467A5A    push        eax
 00467A5B    mov         eax,dword ptr [ebx+38]
 00467A5E    push        eax
 00467A5F    call        gdi32.SetTextColor
 00467A64    movzx       eax,byte ptr [ebp+8]
 00467A68    push        eax
 00467A69    mov         eax,esi
 00467A6B    mov         edx,dword ptr [eax]
 00467A6D    call        dword ptr [edx+24]
 00467A70    add         eax,dword ptr [ebp-4]
 00467A73    push        eax
 00467A74    lea         eax,[ebp-14]
 00467A77    push        eax
 00467A78    mov         eax,esi
 00467A7A    mov         edx,dword ptr [eax]
 00467A7C    call        dword ptr [edx+30]
 00467A7F    mov         ecx,eax
 00467A81    add         ecx,edi
 00467A83    mov         edx,dword ptr [ebp-4]
 00467A86    mov         eax,edi
 00467A88    call        Rect
 00467A8D    lea         ecx,[ebp-14]
 00467A90    mov         edx,ebx
 00467A92    mov         eax,esi
 00467A94    mov         esi,dword ptr [eax]
 00467A96    call        dword ptr [esi+18]
 00467A99    mov         eax,ebx
 00467A9B    mov         edx,dword ptr [eax]
 00467A9D    call        dword ptr [edx+24]
 00467AA0    pop         edi
 00467AA1    pop         esi
 00467AA2    pop         ebx
 00467AA3    mov         esp,ebp
 00467AA5    pop         ebp
 00467AA6    ret         8
*}
end;

//00467AB0
procedure TCanvas.DrawFocusRect(Rect:TRect);
begin
{*
 00467AB0    push        ebx
 00467AB1    push        esi
 00467AB2    mov         esi,edx
 00467AB4    mov         ebx,eax
 00467AB6    mov         eax,ebx
 00467AB8    mov         edx,dword ptr [eax]
 00467ABA    call        dword ptr [edx+28]
 00467ABD    movzx       edx,byte ptr ds:[467AE0]
 00467AC4    mov         eax,ebx
 00467AC6    mov         ecx,dword ptr [eax]
 00467AC8    call        dword ptr [ecx+2C]
 00467ACB    push        esi
 00467ACC    mov         eax,dword ptr [ebx+38]
 00467ACF    push        eax
 00467AD0    call        user32.DrawFocusRect
 00467AD5    mov         eax,ebx
 00467AD7    mov         edx,dword ptr [eax]
 00467AD9    call        dword ptr [edx+24]
 00467ADC    pop         esi
 00467ADD    pop         ebx
 00467ADE    ret
*}
end;

//00467AE4
procedure TCanvas.Ellipse(X1:Integer; Y1:Integer; Y2:Integer; X2:Integer);
begin
{*
 00467AE4    push        ebp
 00467AE5    mov         ebp,esp
 00467AE7    push        ebx
 00467AE8    push        esi
 00467AE9    push        edi
 00467AEA    mov         edi,ecx
 00467AEC    mov         esi,edx
 00467AEE    mov         ebx,eax
 00467AF0    mov         eax,ebx
 00467AF2    mov         edx,dword ptr [eax]
 00467AF4    call        dword ptr [edx+28]
 00467AF7    movzx       edx,byte ptr ds:[467B28]
 00467AFE    mov         eax,ebx
 00467B00    mov         ecx,dword ptr [eax]
 00467B02    call        dword ptr [ecx+2C]
 00467B05    mov         eax,dword ptr [ebp+8]
 00467B08    push        eax
 00467B09    mov         eax,dword ptr [ebp+0C]
 00467B0C    push        eax
 00467B0D    push        edi
 00467B0E    push        esi
 00467B0F    mov         eax,dword ptr [ebx+38]
 00467B12    push        eax
 00467B13    call        gdi32.Ellipse
 00467B18    mov         eax,ebx
 00467B1A    mov         edx,dword ptr [eax]
 00467B1C    call        dword ptr [edx+24]
 00467B1F    pop         edi
 00467B20    pop         esi
 00467B21    pop         ebx
 00467B22    pop         ebp
 00467B23    ret         8
*}
end;

//00467B2C
procedure TCanvas.FillRect(Rect:TRect);
begin
{*
 00467B2C    push        ebx
 00467B2D    push        esi
 00467B2E    mov         esi,edx
 00467B30    mov         ebx,eax
 00467B32    mov         eax,ebx
 00467B34    mov         edx,dword ptr [eax]
 00467B36    call        dword ptr [edx+28]
 00467B39    movzx       edx,byte ptr ds:[467B64]
 00467B40    mov         eax,ebx
 00467B42    mov         ecx,dword ptr [eax]
 00467B44    call        dword ptr [ecx+2C]
 00467B47    mov         eax,dword ptr [ebx+48]
 00467B4A    call        TBrush.GetHandle
 00467B4F    push        eax
 00467B50    push        esi
 00467B51    mov         eax,dword ptr [ebx+38]
 00467B54    push        eax
 00467B55    call        user32.FillRect
 00467B5A    mov         eax,ebx
 00467B5C    mov         edx,dword ptr [eax]
 00467B5E    call        dword ptr [edx+24]
 00467B61    pop         esi
 00467B62    pop         ebx
 00467B63    ret
*}
end;

//00467B68
procedure TCanvas.FloodFill(X:Integer; Y:Integer; FillStyle:TFillStyle; Color:TColor);
begin
{*
 00467B68    push        ebp
 00467B69    mov         ebp,esp
 00467B6B    push        ebx
 00467B6C    push        esi
 00467B6D    push        edi
 00467B6E    mov         edi,ecx
 00467B70    mov         esi,edx
 00467B72    mov         ebx,eax
 00467B74    mov         eax,ebx
 00467B76    mov         edx,dword ptr [eax]
 00467B78    call        dword ptr [edx+28]
 00467B7B    movzx       edx,byte ptr ds:[467BB4]
 00467B82    mov         eax,ebx
 00467B84    mov         ecx,dword ptr [eax]
 00467B86    call        dword ptr [ecx+2C]
 00467B89    movzx       eax,byte ptr [ebp+8]
 00467B8D    movzx       eax,word ptr [eax*2+7858D4]
 00467B95    push        eax
 00467B96    mov         eax,dword ptr [ebp+0C]
 00467B99    push        eax
 00467B9A    push        edi
 00467B9B    push        esi
 00467B9C    mov         eax,dword ptr [ebx+38]
 00467B9F    push        eax
 00467BA0    call        gdi32.ExtFloodFill
 00467BA5    mov         eax,ebx
 00467BA7    mov         edx,dword ptr [eax]
 00467BA9    call        dword ptr [edx+24]
 00467BAC    pop         edi
 00467BAD    pop         esi
 00467BAE    pop         ebx
 00467BAF    pop         ebp
 00467BB0    ret         8
*}
end;

//00467BB8
procedure TCanvas.FrameRect(Rect:TRect);
begin
{*
 00467BB8    push        ebx
 00467BB9    push        esi
 00467BBA    mov         esi,edx
 00467BBC    mov         ebx,eax
 00467BBE    mov         eax,ebx
 00467BC0    mov         edx,dword ptr [eax]
 00467BC2    call        dword ptr [edx+28]
 00467BC5    movzx       edx,byte ptr ds:[467BF0]
 00467BCC    mov         eax,ebx
 00467BCE    mov         ecx,dword ptr [eax]
 00467BD0    call        dword ptr [ecx+2C]
 00467BD3    mov         eax,dword ptr [ebx+48]
 00467BD6    call        TBrush.GetHandle
 00467BDB    push        eax
 00467BDC    push        esi
 00467BDD    mov         eax,dword ptr [ebx+38]
 00467BE0    push        eax
 00467BE1    call        user32.FrameRect
 00467BE6    mov         eax,ebx
 00467BE8    mov         edx,dword ptr [eax]
 00467BEA    call        dword ptr [edx+24]
 00467BED    pop         esi
 00467BEE    pop         ebx
 00467BEF    ret
*}
end;

//00467BF4
function TCanvas.HandleAllocated:Boolean;
begin
{*
 00467BF4    cmp         dword ptr [eax+38],0
 00467BF8    setne       al
 00467BFB    ret
*}
end;

//00467BFC
procedure TCanvas.LineTo(X:Integer; Y:Integer);
begin
{*
 00467BFC    push        ebx
 00467BFD    push        esi
 00467BFE    push        edi
 00467BFF    mov         edi,ecx
 00467C01    mov         esi,edx
 00467C03    mov         ebx,eax
 00467C05    mov         eax,ebx
 00467C07    mov         edx,dword ptr [eax]
 00467C09    call        dword ptr [edx+28]
 00467C0C    movzx       edx,byte ptr ds:[467C30]
 00467C13    mov         eax,ebx
 00467C15    mov         ecx,dword ptr [eax]
 00467C17    call        dword ptr [ecx+2C]
 00467C1A    push        edi
 00467C1B    push        esi
 00467C1C    mov         eax,dword ptr [ebx+38]
 00467C1F    push        eax
 00467C20    call        gdi32.LineTo
 00467C25    mov         eax,ebx
 00467C27    mov         edx,dword ptr [eax]
 00467C29    call        dword ptr [edx+24]
 00467C2C    pop         edi
 00467C2D    pop         esi
 00467C2E    pop         ebx
 00467C2F    ret
*}
end;

//00467C34
procedure TCanvas.MoveTo(X:Integer; Y:Integer);
begin
{*
 00467C34    push        ebx
 00467C35    push        esi
 00467C36    push        edi
 00467C37    mov         edi,ecx
 00467C39    mov         esi,edx
 00467C3B    mov         ebx,eax
 00467C3D    movzx       edx,byte ptr ds:[467C5C]
 00467C44    mov         eax,ebx
 00467C46    mov         ecx,dword ptr [eax]
 00467C48    call        dword ptr [ecx+2C]
 00467C4B    push        0
 00467C4D    push        edi
 00467C4E    push        esi
 00467C4F    mov         eax,dword ptr [ebx+38]
 00467C52    push        eax
 00467C53    call        gdi32.MoveToEx
 00467C58    pop         edi
 00467C59    pop         esi
 00467C5A    pop         ebx
 00467C5B    ret
*}
end;

//00467C60
procedure TCanvas.Pie(X1:Integer; Y1:Integer; Y4:Integer; X4:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer);
begin
{*
 00467C60    push        ebp
 00467C61    mov         ebp,esp
 00467C63    push        ebx
 00467C64    push        esi
 00467C65    push        edi
 00467C66    mov         edi,ecx
 00467C68    mov         esi,edx
 00467C6A    mov         ebx,eax
 00467C6C    mov         eax,ebx
 00467C6E    mov         edx,dword ptr [eax]
 00467C70    call        dword ptr [edx+28]
 00467C73    movzx       edx,byte ptr ds:[467CB4]
 00467C7A    mov         eax,ebx
 00467C7C    mov         ecx,dword ptr [eax]
 00467C7E    call        dword ptr [ecx+2C]
 00467C81    mov         eax,dword ptr [ebp+8]
 00467C84    push        eax
 00467C85    mov         eax,dword ptr [ebp+0C]
 00467C88    push        eax
 00467C89    mov         eax,dword ptr [ebp+10]
 00467C8C    push        eax
 00467C8D    mov         eax,dword ptr [ebp+14]
 00467C90    push        eax
 00467C91    mov         eax,dword ptr [ebp+18]
 00467C94    push        eax
 00467C95    mov         eax,dword ptr [ebp+1C]
 00467C98    push        eax
 00467C99    push        edi
 00467C9A    push        esi
 00467C9B    mov         eax,dword ptr [ebx+38]
 00467C9E    push        eax
 00467C9F    call        gdi32.Pie
 00467CA4    mov         eax,ebx
 00467CA6    mov         edx,dword ptr [eax]
 00467CA8    call        dword ptr [edx+24]
 00467CAB    pop         edi
 00467CAC    pop         esi
 00467CAD    pop         ebx
 00467CAE    pop         ebp
 00467CAF    ret         18
*}
end;

//00467CB8
procedure TCanvas.Polygon(const Points:array[$0..-$1] of Windows.TPoint; const _Dv_:$0..-$1);
begin
{*
 00467CB8    push        ebx
 00467CB9    push        esi
 00467CBA    push        edi
 00467CBB    mov         edi,ecx
 00467CBD    mov         esi,edx
 00467CBF    mov         ebx,eax
 00467CC1    mov         eax,ebx
 00467CC3    mov         edx,dword ptr [eax]
 00467CC5    call        dword ptr [edx+28]
 00467CC8    movzx       edx,byte ptr ds:[467CF0]
 00467CCF    mov         eax,ebx
 00467CD1    mov         ecx,dword ptr [eax]
 00467CD3    call        dword ptr [ecx+2C]
 00467CD6    inc         edi
 00467CD7    push        edi
 00467CD8    push        esi
 00467CD9    mov         eax,dword ptr [ebx+38]
 00467CDC    push        eax
 00467CDD    call        gdi32.Polygon
 00467CE2    mov         eax,ebx
 00467CE4    mov         edx,dword ptr [eax]
 00467CE6    call        dword ptr [edx+24]
 00467CE9    pop         edi
 00467CEA    pop         esi
 00467CEB    pop         ebx
 00467CEC    ret
*}
end;

//00467CF4
procedure TCanvas.Polyline(const Points:array[$0..-$1] of Windows.TPoint; const _Dv_:$0..-$1);
begin
{*
 00467CF4    push        ebx
 00467CF5    push        esi
 00467CF6    push        edi
 00467CF7    mov         edi,ecx
 00467CF9    mov         esi,edx
 00467CFB    mov         ebx,eax
 00467CFD    mov         eax,ebx
 00467CFF    mov         edx,dword ptr [eax]
 00467D01    call        dword ptr [edx+28]
 00467D04    movzx       edx,byte ptr ds:[467D2C]
 00467D0B    mov         eax,ebx
 00467D0D    mov         ecx,dword ptr [eax]
 00467D0F    call        dword ptr [ecx+2C]
 00467D12    inc         edi
 00467D13    push        edi
 00467D14    push        esi
 00467D15    mov         eax,dword ptr [ebx+38]
 00467D18    push        eax
 00467D19    call        gdi32.Polyline
 00467D1E    mov         eax,ebx
 00467D20    mov         edx,dword ptr [eax]
 00467D22    call        dword ptr [edx+24]
 00467D25    pop         edi
 00467D26    pop         esi
 00467D27    pop         ebx
 00467D28    ret
*}
end;

//00467D30
procedure TCanvas.PolyBezier(const Points:array[$0..-$1] of Windows.TPoint; const _Dv_:$0..-$1);
begin
{*
 00467D30    push        ebx
 00467D31    push        esi
 00467D32    push        edi
 00467D33    mov         edi,ecx
 00467D35    mov         esi,edx
 00467D37    mov         ebx,eax
 00467D39    mov         eax,ebx
 00467D3B    mov         edx,dword ptr [eax]
 00467D3D    call        dword ptr [edx+28]
 00467D40    movzx       edx,byte ptr ds:[467D68]
 00467D47    mov         eax,ebx
 00467D49    mov         ecx,dword ptr [eax]
 00467D4B    call        dword ptr [ecx+2C]
 00467D4E    inc         edi
 00467D4F    push        edi
 00467D50    push        esi
 00467D51    mov         eax,dword ptr [ebx+38]
 00467D54    push        eax
 00467D55    call        gdi32.PolyBezier
 00467D5A    mov         eax,ebx
 00467D5C    mov         edx,dword ptr [eax]
 00467D5E    call        dword ptr [edx+24]
 00467D61    pop         edi
 00467D62    pop         esi
 00467D63    pop         ebx
 00467D64    ret
*}
end;

//00467D6C
procedure TCanvas.PolyBezierTo(const Points:array[$0..-$1] of Windows.TPoint; const _Dv_:$0..-$1);
begin
{*
 00467D6C    push        ebx
 00467D6D    push        esi
 00467D6E    push        edi
 00467D6F    mov         edi,ecx
 00467D71    mov         esi,edx
 00467D73    mov         ebx,eax
 00467D75    mov         eax,ebx
 00467D77    mov         edx,dword ptr [eax]
 00467D79    call        dword ptr [edx+28]
 00467D7C    movzx       edx,byte ptr ds:[467DA4]
 00467D83    mov         eax,ebx
 00467D85    mov         ecx,dword ptr [eax]
 00467D87    call        dword ptr [ecx+2C]
 00467D8A    inc         edi
 00467D8B    push        edi
 00467D8C    push        esi
 00467D8D    mov         eax,dword ptr [ebx+38]
 00467D90    push        eax
 00467D91    call        gdi32.PolyBezierTo
 00467D96    mov         eax,ebx
 00467D98    mov         edx,dword ptr [eax]
 00467D9A    call        dword ptr [edx+24]
 00467D9D    pop         edi
 00467D9E    pop         esi
 00467D9F    pop         ebx
 00467DA0    ret
*}
end;

//00467DA8
procedure TCanvas.Rectangle(X1:Integer; Y1:Integer; Y2:Integer; X2:Integer);
begin
{*
 00467DA8    push        ebp
 00467DA9    mov         ebp,esp
 00467DAB    push        ebx
 00467DAC    push        esi
 00467DAD    push        edi
 00467DAE    mov         edi,ecx
 00467DB0    mov         esi,edx
 00467DB2    mov         ebx,eax
 00467DB4    mov         eax,ebx
 00467DB6    mov         edx,dword ptr [eax]
 00467DB8    call        dword ptr [edx+28]
 00467DBB    movzx       edx,byte ptr ds:[467DEC]
 00467DC2    mov         eax,ebx
 00467DC4    mov         ecx,dword ptr [eax]
 00467DC6    call        dword ptr [ecx+2C]
 00467DC9    mov         eax,dword ptr [ebp+8]
 00467DCC    push        eax
 00467DCD    mov         eax,dword ptr [ebp+0C]
 00467DD0    push        eax
 00467DD1    push        edi
 00467DD2    push        esi
 00467DD3    mov         eax,dword ptr [ebx+38]
 00467DD6    push        eax
 00467DD7    call        gdi32.Rectangle
 00467DDC    mov         eax,ebx
 00467DDE    mov         edx,dword ptr [eax]
 00467DE0    call        dword ptr [edx+24]
 00467DE3    pop         edi
 00467DE4    pop         esi
 00467DE5    pop         ebx
 00467DE6    pop         ebp
 00467DE7    ret         8
*}
end;

//00467DF0
procedure TCanvas.Refresh;
begin
{*
 00467DF0    call        TCanvas.DeselectHandles
 00467DF5    ret
*}
end;

//00467DF8
procedure TCanvas.RoundRect(X1:Integer; Y1:Integer; Y3:Integer; X3:Integer; Y2:Integer; X2:Integer);
begin
{*
 00467DF8    push        ebp
 00467DF9    mov         ebp,esp
 00467DFB    push        ebx
 00467DFC    push        esi
 00467DFD    push        edi
 00467DFE    mov         edi,ecx
 00467E00    mov         esi,edx
 00467E02    mov         ebx,eax
 00467E04    mov         eax,ebx
 00467E06    mov         edx,dword ptr [eax]
 00467E08    call        dword ptr [edx+28]
 00467E0B    movzx       edx,byte ptr ds:[467E44]
 00467E12    mov         eax,ebx
 00467E14    mov         ecx,dword ptr [eax]
 00467E16    call        dword ptr [ecx+2C]
 00467E19    mov         eax,dword ptr [ebp+8]
 00467E1C    push        eax
 00467E1D    mov         eax,dword ptr [ebp+0C]
 00467E20    push        eax
 00467E21    mov         eax,dword ptr [ebp+10]
 00467E24    push        eax
 00467E25    mov         eax,dword ptr [ebp+14]
 00467E28    push        eax
 00467E29    push        edi
 00467E2A    push        esi
 00467E2B    mov         eax,dword ptr [ebx+38]
 00467E2E    push        eax
 00467E2F    call        gdi32.RoundRect
 00467E34    mov         eax,ebx
 00467E36    mov         edx,dword ptr [eax]
 00467E38    call        dword ptr [edx+24]
 00467E3B    pop         edi
 00467E3C    pop         esi
 00467E3D    pop         ebx
 00467E3E    pop         ebp
 00467E3F    ret         10
*}
end;

//00467E48
procedure TCanvas.StretchDraw(Rect:TRect; Graphic:TGraphic);
begin
{*
 00467E48    push        ebx
 00467E49    push        esi
 00467E4A    push        edi
 00467E4B    mov         esi,ecx
 00467E4D    mov         edi,edx
 00467E4F    mov         ebx,eax
 00467E51    test        esi,esi
>00467E53    je          00467E7C
 00467E55    mov         eax,ebx
 00467E57    mov         edx,dword ptr [eax]
 00467E59    call        dword ptr [edx+28]
 00467E5C    movzx       edx,byte ptr ds:[467E80]
 00467E63    mov         eax,ebx
 00467E65    mov         ecx,dword ptr [eax]
 00467E67    call        dword ptr [ecx+2C]
 00467E6A    mov         ecx,edi
 00467E6C    mov         edx,ebx
 00467E6E    mov         eax,esi
 00467E70    mov         esi,dword ptr [eax]
 00467E72    call        dword ptr [esi+14]
 00467E75    mov         eax,ebx
 00467E77    mov         edx,dword ptr [eax]
 00467E79    call        dword ptr [edx+24]
 00467E7C    pop         edi
 00467E7D    pop         esi
 00467E7E    pop         ebx
 00467E7F    ret
*}
end;

//00467E84
function TCanvas.GetCanvasOrientation:TCanvasOrientation;
begin
{*
 00467E84    push        ebx
 00467E85    push        esi
 00467E86    add         esp,0FFFFFFF8
 00467E89    mov         esi,eax
 00467E8B    xor         ebx,ebx
 00467E8D    test        byte ptr [esi+18],80
>00467E91    je          00467EA9
 00467E93    push        esp
 00467E94    mov         eax,esi
 00467E96    call        TCanvas.GetHandle
 00467E9B    push        eax
 00467E9C    call        gdi32.GetWindowOrgEx
 00467EA1    cmp         dword ptr [esp],0
>00467EA5    je          00467EA9
 00467EA7    mov         bl,1
 00467EA9    mov         eax,ebx
 00467EAB    pop         ecx
 00467EAC    pop         edx
 00467EAD    pop         esi
 00467EAE    pop         ebx
 00467EAF    ret
*}
end;

//00467EB0
procedure TCanvas.TextOut(X:Integer; Y:Integer; Text:string);
begin
{*
 00467EB0    push        ebp
 00467EB1    mov         ebp,esp
 00467EB3    add         esp,0FFFFFFF8
 00467EB6    push        ebx
 00467EB7    push        esi
 00467EB8    push        edi
 00467EB9    mov         dword ptr [ebp-8],ecx
 00467EBC    mov         dword ptr [ebp-4],edx
 00467EBF    mov         ebx,eax
 00467EC1    mov         edi,dword ptr [ebp+8]
 00467EC4    mov         eax,ebx
 00467EC6    mov         edx,dword ptr [eax]
 00467EC8    call        dword ptr [edx+28]
 00467ECB    movzx       edx,byte ptr ds:[467F48]
 00467ED2    mov         eax,ebx
 00467ED4    mov         ecx,dword ptr [eax]
 00467ED6    call        dword ptr [ecx+2C]
 00467ED9    mov         eax,ebx
 00467EDB    mov         edx,dword ptr [eax]
 00467EDD    call        dword ptr [edx+0C]
 00467EE0    cmp         al,1
>00467EE2    jne         00467EF1
 00467EE4    mov         edx,edi
 00467EE6    mov         eax,ebx
 00467EE8    call        TCustomCanvas.TextWidth
 00467EED    inc         eax
 00467EEE    add         dword ptr [ebp-4],eax
 00467EF1    mov         esi,edi
 00467EF3    test        esi,esi
>00467EF5    je          00467EFC
 00467EF7    sub         esi,4
 00467EFA    mov         esi,dword ptr [esi]
 00467EFC    push        0
 00467EFE    push        esi
 00467EFF    mov         eax,edi
 00467F01    call        @UStrToPWChar
 00467F06    push        eax
 00467F07    push        0
 00467F09    mov         eax,dword ptr [ebx+18]
 00467F0C    push        eax
 00467F0D    mov         eax,dword ptr [ebp-8]
 00467F10    push        eax
 00467F11    mov         eax,dword ptr [ebp-4]
 00467F14    push        eax
 00467F15    mov         eax,dword ptr [ebx+38]
 00467F18    push        eax
 00467F19    call        gdi32.ExtTextOutW
 00467F1E    mov         edx,edi
 00467F20    mov         eax,ebx
 00467F22    call        TCustomCanvas.TextWidth
 00467F27    mov         edx,eax
 00467F29    add         edx,dword ptr [ebp-4]
 00467F2C    mov         ecx,dword ptr [ebp-8]
 00467F2F    mov         eax,ebx
 00467F31    mov         esi,dword ptr [eax]
 00467F33    call        dword ptr [esi+64]
 00467F36    mov         eax,ebx
 00467F38    mov         edx,dword ptr [eax]
 00467F3A    call        dword ptr [edx+24]
 00467F3D    pop         edi
 00467F3E    pop         esi
 00467F3F    pop         ebx
 00467F40    pop         ecx
 00467F41    pop         ecx
 00467F42    pop         ebp
 00467F43    ret         4
*}
end;

//00467F4C
procedure TCanvas.TextRect(Rect:TRect; X:Integer; Text:string; Y:Integer);
begin
{*
 00467F4C    push        ebp
 00467F4D    mov         ebp,esp
 00467F4F    add         esp,0FFFFFFE8
 00467F52    push        ebx
 00467F53    push        esi
 00467F54    push        edi
 00467F55    mov         esi,edx
 00467F57    lea         edi,[ebp-18]
 00467F5A    movs        dword ptr [edi],dword ptr [esi]
 00467F5B    movs        dword ptr [edi],dword ptr [esi]
 00467F5C    movs        dword ptr [edi],dword ptr [esi]
 00467F5D    movs        dword ptr [edi],dword ptr [esi]
 00467F5E    mov         dword ptr [ebp-4],ecx
 00467F61    mov         ebx,eax
 00467F63    mov         edi,dword ptr [ebp+8]
 00467F66    mov         eax,ebx
 00467F68    mov         edx,dword ptr [eax]
 00467F6A    call        dword ptr [edx+28]
 00467F6D    movzx       edx,byte ptr ds:[467FF4]
 00467F74    mov         eax,ebx
 00467F76    mov         ecx,dword ptr [eax]
 00467F78    call        dword ptr [ecx+2C]
 00467F7B    mov         eax,dword ptr [ebx+18]
 00467F7E    or          eax,4
 00467F81    mov         dword ptr [ebp-8],eax
 00467F84    mov         eax,dword ptr [ebx+48]
 00467F87    mov         eax,dword ptr [eax+10]
 00467F8A    cmp         byte ptr [eax+20],1
>00467F8E    je          00467F94
 00467F90    or          dword ptr [ebp-8],2
 00467F94    test        byte ptr [ebx+18],80
>00467F98    je          00467FB2
 00467F9A    mov         eax,ebx
 00467F9C    mov         edx,dword ptr [eax]
 00467F9E    call        dword ptr [edx+0C]
 00467FA1    cmp         al,1
>00467FA3    jne         00467FB2
 00467FA5    mov         edx,edi
 00467FA7    mov         eax,ebx
 00467FA9    call        TCustomCanvas.TextWidth
 00467FAE    inc         eax
 00467FAF    add         dword ptr [ebp-4],eax
 00467FB2    mov         esi,edi
 00467FB4    test        esi,esi
>00467FB6    je          00467FBD
 00467FB8    sub         esi,4
 00467FBB    mov         esi,dword ptr [esi]
 00467FBD    push        0
 00467FBF    push        esi
 00467FC0    mov         eax,edi
 00467FC2    call        @UStrToPWChar
 00467FC7    push        eax
 00467FC8    lea         eax,[ebp-18]
 00467FCB    push        eax
 00467FCC    mov         eax,dword ptr [ebp-8]
 00467FCF    push        eax
 00467FD0    mov         eax,dword ptr [ebp+0C]
 00467FD3    push        eax
 00467FD4    mov         eax,dword ptr [ebp-4]
 00467FD7    push        eax
 00467FD8    mov         eax,dword ptr [ebx+38]
 00467FDB    push        eax
 00467FDC    call        gdi32.ExtTextOutW
 00467FE1    mov         eax,ebx
 00467FE3    mov         edx,dword ptr [eax]
 00467FE5    call        dword ptr [edx+24]
 00467FE8    pop         edi
 00467FE9    pop         esi
 00467FEA    pop         ebx
 00467FEB    mov         esp,ebp
 00467FED    pop         ebp
 00467FEE    ret         8
*}
end;

//00467FF8
procedure TCanvas.TextRect(var Rect:TRect; var Text:string; TextFormat:TTextFormat);
begin
{*
 00467FF8    push        ebp
 00467FF9    mov         ebp,esp
 00467FFB    add         esp,0FFFFFFEC
 00467FFE    push        ebx
 00467FFF    push        esi
 00468000    push        edi
 00468001    mov         dword ptr [ebp-0C],ecx
 00468004    mov         dword ptr [ebp-8],edx
 00468007    mov         dword ptr [ebp-4],eax
 0046800A    mov         edi,dword ptr [ebp+8]
 0046800D    xor         ebx,ebx
 0046800F    xor         edx,edx
 00468011    mov         esi,7858D8
 00468016    mov         eax,edx
 00468018    cmp         al,1F
>0046801A    ja          00468022
 0046801C    and         eax,7F
 0046801F    bt          edi,eax
>00468022    jae         00468026
 00468024    or          ebx,dword ptr [esi]
 00468026    inc         edx
 00468027    add         esi,4
 0046802A    cmp         dl,12
>0046802D    jne         00468016
 0046802F    mov         eax,dword ptr [ebp-4]
 00468032    call        TCanvas.GetHandle
 00468037    mov         dword ptr [ebp-10],eax
 0046803A    mov         eax,dword ptr [ebp-0C]
 0046803D    mov         eax,dword ptr [eax]
 0046803F    mov         dword ptr [ebp-14],eax
 00468042    mov         esi,dword ptr [ebp-14]
 00468045    test        esi,esi
>00468047    je          0046804E
 00468049    sub         esi,4
 0046804C    mov         esi,dword ptr [esi]
 0046804E    push        0
 00468050    push        ebx
 00468051    mov         eax,dword ptr [ebp-8]
 00468054    push        eax
 00468055    push        esi
 00468056    mov         eax,dword ptr [ebp-0C]
 00468059    mov         eax,dword ptr [eax]
 0046805B    call        @UStrToPWChar
 00468060    push        eax
 00468061    mov         eax,dword ptr [ebp-10]
 00468064    push        eax
 00468065    call        user32.DrawTextExW
 0046806A    test        edi,200
>00468070    je          0046808B
 00468072    mov         eax,dword ptr [ebp-0C]
 00468075    mov         eax,dword ptr [eax]
 00468077    call        @UStrToPWChar
 0046807C    call        StrLen
 00468081    mov         edx,eax
 00468083    mov         eax,dword ptr [ebp-0C]
 00468086    call        @UStrSetLength
 0046808B    pop         edi
 0046808C    pop         esi
 0046808D    pop         ebx
 0046808E    mov         esp,ebp
 00468090    pop         ebp
 00468091    ret         4
*}
end;

//00468094
function TCanvas.TextExtent(Text:string):tagSIZE;
begin
{*
 00468094    push        ebx
 00468095    push        esi
 00468096    push        edi
 00468097    push        ebp
 00468098    mov         edi,ecx
 0046809A    mov         ebp,edx
 0046809C    mov         esi,eax
 0046809E    movzx       edx,byte ptr ds:[4680D8]
 004680A5    mov         eax,esi
 004680A7    mov         ecx,dword ptr [eax]
 004680A9    call        dword ptr [ecx+2C]
 004680AC    xor         eax,eax
 004680AE    mov         dword ptr [edi],eax
 004680B0    xor         eax,eax
 004680B2    mov         dword ptr [edi+4],eax
 004680B5    mov         ebx,ebp
 004680B7    test        ebx,ebx
>004680B9    je          004680C0
 004680BB    sub         ebx,4
 004680BE    mov         ebx,dword ptr [ebx]
 004680C0    push        edi
 004680C1    push        ebx
 004680C2    mov         eax,ebp
 004680C4    call        @UStrToPWChar
 004680C9    push        eax
 004680CA    mov         eax,dword ptr [esi+38]
 004680CD    push        eax
 004680CE    call        gdi32.GetTextExtentPoint32W
 004680D3    pop         ebp
 004680D4    pop         edi
 004680D5    pop         esi
 004680D6    pop         ebx
 004680D7    ret
*}
end;

//004680DC
procedure TCanvas.SetFont(Value:TFont);
begin
{*
 004680DC    push        esi
 004680DD    mov         esi,eax
 004680DF    mov         eax,dword ptr [esi+40]
 004680E2    mov         ecx,dword ptr [eax]
 004680E4    call        dword ptr [ecx+8]
 004680E7    pop         esi
 004680E8    ret
*}
end;

//004680EC
procedure TCanvas.SetPen(Value:TPen);
begin
{*
 004680EC    mov         eax,dword ptr [eax+44]
 004680EF    mov         ecx,dword ptr [eax]
 004680F1    call        dword ptr [ecx+8]
 004680F4    ret
*}
end;

//004680F8
procedure TCanvas.SetBrush(Value:TBrush);
begin
{*
 004680F8    mov         eax,dword ptr [eax+48]
 004680FB    mov         ecx,dword ptr [eax]
 004680FD    call        dword ptr [ecx+8]
 00468100    ret
*}
end;

//00468104
function TCanvas.GetPenPos:TPoint;
begin
{*
 00468104    push        ebx
 00468105    push        esi
 00468106    mov         esi,edx
 00468108    mov         ebx,eax
 0046810A    movzx       edx,byte ptr ds:[468128]
 00468111    mov         eax,ebx
 00468113    mov         ecx,dword ptr [eax]
 00468115    call        dword ptr [ecx+2C]
 00468118    push        esi
 00468119    mov         eax,dword ptr [ebx+38]
 0046811C    push        eax
 0046811D    call        gdi32.GetCurrentPositionEx
 00468122    pop         esi
 00468123    pop         ebx
 00468124    ret
*}
end;

//0046812C
procedure TCanvas.SetPenPos(Value:TPoint);
begin
{*
 0046812C    push        ebx
 0046812D    push        esi
 0046812E    push        edi
 0046812F    add         esp,0FFFFFFF8
 00468132    mov         esi,edx
 00468134    lea         edi,[esp]
 00468137    movs        dword ptr [edi],dword ptr [esi]
 00468138    movs        dword ptr [edi],dword ptr [esi]
 00468139    mov         ecx,dword ptr [esp+4]
 0046813D    mov         edx,dword ptr [esp]
 00468140    mov         ebx,dword ptr [eax]
 00468142    call        dword ptr [ebx+64]
 00468145    pop         ecx
 00468146    pop         edx
 00468147    pop         edi
 00468148    pop         esi
 00468149    pop         ebx
 0046814A    ret
*}
end;

//0046814C
function TCanvas.GetPixel(X:Integer; Y:Integer):TColor;
begin
{*
 0046814C    push        ebx
 0046814D    push        esi
 0046814E    push        edi
 0046814F    mov         edi,ecx
 00468151    mov         esi,edx
 00468153    mov         ebx,eax
 00468155    movzx       edx,byte ptr ds:[468174]
 0046815C    mov         eax,ebx
 0046815E    mov         ecx,dword ptr [eax]
 00468160    call        dword ptr [ecx+2C]
 00468163    push        edi
 00468164    push        esi
 00468165    mov         eax,dword ptr [ebx+38]
 00468168    push        eax
 00468169    call        gdi32.GetPixel
 0046816E    pop         edi
 0046816F    pop         esi
 00468170    pop         ebx
 00468171    ret
*}
end;

//00468178
procedure TCanvas.SetPixel(X:Integer; Y:Integer; Value:TColor);
begin
{*
 00468178    push        ebp
 00468179    mov         ebp,esp
 0046817B    push        ebx
 0046817C    push        esi
 0046817D    push        edi
 0046817E    mov         edi,ecx
 00468180    mov         esi,edx
 00468182    mov         ebx,eax
 00468184    mov         eax,ebx
 00468186    mov         edx,dword ptr [eax]
 00468188    call        dword ptr [edx+28]
 0046818B    movzx       edx,byte ptr ds:[4681BC]
 00468192    mov         eax,ebx
 00468194    mov         ecx,dword ptr [eax]
 00468196    call        dword ptr [ecx+2C]
 00468199    mov         eax,dword ptr [ebp+8]
 0046819C    call        ColorToRGB
 004681A1    push        eax
 004681A2    push        edi
 004681A3    push        esi
 004681A4    mov         eax,dword ptr [ebx+38]
 004681A7    push        eax
 004681A8    call        gdi32.SetPixel
 004681AD    mov         eax,ebx
 004681AF    mov         edx,dword ptr [eax]
 004681B1    call        dword ptr [edx+24]
 004681B4    pop         edi
 004681B5    pop         esi
 004681B6    pop         ebx
 004681B7    pop         ebp
 004681B8    ret         4
*}
end;

//004681C0
function TCanvas.GetClipRect:TRect;
begin
{*
 004681C0    push        ebx
 004681C1    push        esi
 004681C2    mov         esi,edx
 004681C4    mov         ebx,eax
 004681C6    movzx       edx,byte ptr ds:[4681E4]
 004681CD    mov         eax,ebx
 004681CF    mov         ecx,dword ptr [eax]
 004681D1    call        dword ptr [ecx+2C]
 004681D4    push        esi
 004681D5    mov         eax,dword ptr [ebx+38]
 004681D8    push        eax
 004681D9    call        gdi32.GetClipBox
 004681DE    pop         esi
 004681DF    pop         ebx
 004681E0    ret
*}
end;

//004681E8
function TCanvas.GetHandle:HDC;
begin
{*
 004681E8    push        ebx
 004681E9    mov         ebx,eax
 004681EB    mov         eax,ebx
 004681ED    mov         edx,dword ptr [eax]
 004681EF    call        dword ptr [edx+28]
 004681F2    movzx       edx,byte ptr ds:[468208]
 004681F9    mov         eax,ebx
 004681FB    mov         ecx,dword ptr [eax]
 004681FD    call        dword ptr [ecx+2C]
 00468200    mov         eax,dword ptr [ebx+38]
 00468203    pop         ebx
 00468204    ret
*}
end;

//0046820C
procedure TCanvas.DeselectHandles;
begin
{*
 0046820C    push        ebx
 0046820D    push        esi
 0046820E    mov         ebx,eax
 00468210    mov         esi,dword ptr [ebx+38]
 00468213    test        esi,esi
>00468215    je          00468264
 00468217    movzx       eax,byte ptr ds:[468268]
 0046821E    not         eax
 00468220    and         al,byte ptr [ebx+3C]
 00468223    movzx       edx,byte ptr [ebx+3C]
 00468227    cmp         dl,al
>00468229    je          00468264
 0046822B    mov         eax,[0079305C]
 00468230    push        eax
 00468231    push        esi
 00468232    call        gdi32.SelectObject
 00468237    mov         eax,[00793060]
 0046823C    push        eax
 0046823D    mov         eax,dword ptr [ebx+38]
 00468240    push        eax
 00468241    call        gdi32.SelectObject
 00468246    mov         eax,[00793064]
 0046824B    push        eax
 0046824C    mov         eax,dword ptr [ebx+38]
 0046824F    push        eax
 00468250    call        gdi32.SelectObject
 00468255    movzx       eax,byte ptr ds:[468268]
 0046825C    not         eax
 0046825E    and         al,byte ptr [ebx+3C]
 00468261    mov         byte ptr [ebx+3C],al
 00468264    pop         esi
 00468265    pop         ebx
 00468266    ret
*}
end;

//0046826C
procedure TCanvas.CreateHandle;
begin
{*
 0046826C    ret
*}
end;

//00468270
procedure TCanvas.SetHandle(Value:HDC);
begin
{*
 00468270    push        ebx
 00468271    push        esi
 00468272    add         esp,0FFFFFFF8
 00468275    mov         esi,edx
 00468277    mov         ebx,eax
 00468279    mov         eax,dword ptr [ebx+38]
 0046827C    cmp         esi,eax
>0046827E    je          004682BF
 00468280    test        eax,eax
>00468282    je          004682AA
 00468284    mov         eax,ebx
 00468286    call        TCanvas.DeselectHandles
 0046828B    mov         edx,esp
 0046828D    mov         eax,ebx
 0046828F    mov         ecx,dword ptr [eax]
 00468291    call        dword ptr [ecx+14]
 00468294    mov         eax,dword ptr [esp]
 00468297    mov         dword ptr [ebx+4C],eax
 0046829A    mov         eax,dword ptr [esp+4]
 0046829E    mov         dword ptr [ebx+50],eax
 004682A1    xor         eax,eax
 004682A3    mov         dword ptr [ebx+38],eax
 004682A6    and         byte ptr [ebx+3C],0FE
 004682AA    test        esi,esi
>004682AC    je          004682BF
 004682AE    or          byte ptr [ebx+3C],1
 004682B2    mov         dword ptr [ebx+38],esi
 004682B5    lea         edx,[ebx+4C]
 004682B8    mov         eax,ebx
 004682BA    mov         ecx,dword ptr [eax]
 004682BC    call        dword ptr [ecx+1C]
 004682BF    pop         ecx
 004682C0    pop         edx
 004682C1    pop         esi
 004682C2    pop         ebx
 004682C3    ret
*}
end;

//004682C4
procedure TCanvas.RequiredState(ReqState:TCanvasState);
begin
{*
 004682C4    push        ebx
 004682C5    push        esi
 004682C6    push        ecx
 004682C7    mov         byte ptr [esp],dl
 004682CA    mov         esi,eax
 004682CC    movzx       ebx,byte ptr [esi+3C]
 004682D0    not         ebx
 004682D2    and         bl,byte ptr [esp]
 004682D5    movzx       eax,byte ptr ds:[46833C]
 004682DC    cmp         al,bl
>004682DE    je          00468336
 004682E0    test        bl,1
>004682E3    je          0046830C
 004682E5    mov         eax,esi
 004682E7    mov         edx,dword ptr [eax]
 004682E9    call        dword ptr [edx+9C]
 004682EF    cmp         dword ptr [esi+38],0
>004682F3    jne         0046830C
 004682F5    mov         ecx,dword ptr ds:[78D0FC];^SResString191:TResStringRec
 004682FB    mov         dl,1
 004682FD    mov         eax,[00439268];EInvalidOperation
 00468302    call        Exception.CreateRes
 00468307    call        @RaiseExcept
 0046830C    test        bl,2
>0046830F    je          00468318
 00468311    mov         eax,esi
 00468313    call        TCanvas.CreateFont
 00468318    test        bl,4
>0046831B    je          00468324
 0046831D    mov         eax,esi
 0046831F    call        TCanvas.CreatePen
 00468324    test        bl,8
>00468327    je          00468330
 00468329    mov         eax,esi
 0046832B    call        TCanvas.CreateBrush
 00468330    or          bl,byte ptr [esi+3C]
 00468333    mov         byte ptr [esi+3C],bl
 00468336    pop         edx
 00468337    pop         esi
 00468338    pop         ebx
 00468339    ret
*}
end;

//00468340
procedure TCanvas.CreateFont;
begin
{*
 00468340    push        ebx
 00468341    mov         ebx,eax
 00468343    mov         eax,dword ptr [ebx+40]
 00468346    call        TFont.GetHandle
 0046834B    push        eax
 0046834C    mov         eax,dword ptr [ebx+38]
 0046834F    push        eax
 00468350    call        gdi32.SelectObject
 00468355    mov         eax,dword ptr [ebx+40]
 00468358    mov         eax,dword ptr [eax+18]
 0046835B    call        ColorToRGB
 00468360    push        eax
 00468361    mov         eax,dword ptr [ebx+38]
 00468364    push        eax
 00468365    call        gdi32.SetTextColor
 0046836A    pop         ebx
 0046836B    ret
*}
end;

//0046836C
procedure TCanvas.CreatePen;
begin
{*
 0046836C    push        ebx
 0046836D    mov         ebx,eax
 0046836F    mov         eax,dword ptr [ebx+44]
 00468372    call        TPen.GetHandle
 00468377    push        eax
 00468378    mov         eax,dword ptr [ebx+38]
 0046837B    push        eax
 0046837C    call        gdi32.SelectObject
 00468381    mov         eax,dword ptr [ebx+44]
 00468384    movzx       eax,byte ptr [eax+18]
 00468388    movzx       eax,word ptr [eax*2+785920]
 00468390    push        eax
 00468391    mov         eax,dword ptr [ebx+38]
 00468394    push        eax
 00468395    call        gdi32.SetROP2
 0046839A    pop         ebx
 0046839B    ret
*}
end;

//0046839C
procedure TCanvas.CreateBrush;
begin
{*
 0046839C    push        ebx
 0046839D    push        esi
 0046839E    mov         ebx,eax
 004683A0    mov         eax,dword ptr [ebx+48]
 004683A3    call        TBrush.GetHandle
 004683A8    push        eax
 004683A9    call        gdi32.UnrealizeObject
 004683AE    mov         eax,dword ptr [ebx+48]
 004683B1    call        TBrush.GetHandle
 004683B6    push        eax
 004683B7    mov         eax,dword ptr [ebx+38]
 004683BA    push        eax
 004683BB    call        gdi32.SelectObject
 004683C0    mov         eax,dword ptr [ebx+48]
 004683C3    mov         esi,dword ptr [eax+10]
 004683C6    cmp         byte ptr [esi+20],0
>004683CA    jne         004683EC
 004683CC    mov         eax,dword ptr [esi+18]
 004683CF    call        ColorToRGB
 004683D4    push        eax
 004683D5    mov         eax,dword ptr [ebx+38]
 004683D8    push        eax
 004683D9    call        gdi32.SetBkColor
 004683DE    push        2
 004683E0    mov         eax,dword ptr [ebx+38]
 004683E3    push        eax
 004683E4    call        gdi32.SetBkMode
 004683E9    pop         esi
 004683EA    pop         ebx
 004683EB    ret
 004683EC    mov         eax,dword ptr [esi+18]
 004683EF    call        ColorToRGB
 004683F4    not         eax
 004683F6    push        eax
 004683F7    mov         eax,dword ptr [ebx+38]
 004683FA    push        eax
 004683FB    call        gdi32.SetBkColor
 00468400    push        1
 00468402    mov         eax,dword ptr [ebx+38]
 00468405    push        eax
 00468406    call        gdi32.SetBkMode
 0046840B    pop         esi
 0046840C    pop         ebx
 0046840D    ret
*}
end;

//00468410
procedure TCanvas.FontChanged(AFont:TObject);
begin
{*
 00468410    push        ebx
 00468411    mov         ebx,eax
 00468413    test        byte ptr [ebx+3C],2
>00468417    je          0046842C
 00468419    and         byte ptr [ebx+3C],0FD
 0046841D    mov         eax,[00793064]
 00468422    push        eax
 00468423    mov         eax,dword ptr [ebx+38]
 00468426    push        eax
 00468427    call        gdi32.SelectObject
 0046842C    pop         ebx
 0046842D    ret
*}
end;

//00468430
procedure TCanvas.PenChanged(APen:TObject);
begin
{*
 00468430    push        ebx
 00468431    mov         ebx,eax
 00468433    test        byte ptr [ebx+3C],4
>00468437    je          0046844C
 00468439    and         byte ptr [ebx+3C],0FB
 0046843D    mov         eax,[0079305C]
 00468442    push        eax
 00468443    mov         eax,dword ptr [ebx+38]
 00468446    push        eax
 00468447    call        gdi32.SelectObject
 0046844C    pop         ebx
 0046844D    ret
*}
end;

//00468450
procedure TCanvas.BrushChanged(ABrush:TObject);
begin
{*
 00468450    push        ebx
 00468451    mov         ebx,eax
 00468453    test        byte ptr [ebx+3C],8
>00468457    je          0046846C
 00468459    and         byte ptr [ebx+3C],0F7
 0046845D    mov         eax,[00793060]
 00468462    push        eax
 00468463    mov         eax,dword ptr [ebx+38]
 00468466    push        eax
 00468467    call        gdi32.SelectObject
 0046846C    pop         ebx
 0046846D    ret
*}
end;

//00468470
procedure InvalidOperation(Str:PResStringRec);
begin
{*
 00468470    push        ebx
 00468471    mov         ebx,eax
 00468473    mov         ecx,ebx
 00468475    mov         dl,1
 00468477    mov         eax,[0045F278];EInvalidGraphicOperation
 0046847C    call        Exception.CreateRes
 00468481    call        @RaiseExcept
 00468486    pop         ebx
 00468487    ret
*}
end;

//00468488
procedure InvalidGraphic(Str:PResStringRec);
begin
{*
 00468488    push        ebx
 00468489    mov         ebx,eax
 0046848B    mov         ecx,ebx
 0046848D    mov         dl,1
 0046848F    mov         eax,[0045F1D8];EInvalidGraphic
 00468494    call        Exception.CreateRes
 00468499    call        @RaiseExcept
 0046849E    pop         ebx
 0046849F    ret
*}
end;

//004684A0
procedure InvalidBitmap;
begin
{*
 004684A0    mov         eax,[0078D064];^SResString179:TResStringRec
 004684A5    call        InvalidGraphic
 004684AA    ret
*}
end;

//004684AC
procedure InvalidIcon;
begin
{*
 004684AC    mov         eax,[0078D07C];^SResString180:TResStringRec
 004684B1    call        InvalidGraphic
 004684B6    ret
*}
end;

//004684B8
procedure InvalidMetafile;
begin
{*
 004684B8    mov         eax,[0078D670];^SResString181:TResStringRec
 004684BD    call        InvalidGraphic
 004684C2    ret
*}
end;

//004684C4
procedure OutOfResources;
begin
{*
 004684C4    push        ebp
 004684C5    mov         ebp,esp
 004684C7    push        0
 004684C9    xor         eax,eax
 004684CB    push        ebp
 004684CC    push        46850E
 004684D1    push        dword ptr fs:[eax]
 004684D4    mov         dword ptr fs:[eax],esp
 004684D7    lea         edx,[ebp-4]
 004684DA    mov         eax,[0078CD74];^SResString190:TResStringRec
 004684DF    call        LoadResString
 004684E4    mov         ecx,dword ptr [ebp-4]
 004684E7    mov         dl,1
 004684E9    mov         eax,[004391C8];EOutOfResources
 004684EE    call        Exception.Create
 004684F3    call        @RaiseExcept
 004684F8    xor         eax,eax
 004684FA    pop         edx
 004684FB    pop         ecx
 004684FC    pop         ecx
 004684FD    mov         dword ptr fs:[eax],edx
 00468500    push        468515
 00468505    lea         eax,[ebp-4]
 00468508    call        @UStrClr
 0046850D    ret
>0046850E    jmp         @HandleFinally
>00468513    jmp         00468505
 00468515    pop         ecx
 00468516    pop         ebp
 00468517    ret
*}
end;

//00468518
procedure GDIError;
begin
{*
 00468518    push        ebp
 00468519    mov         ebp,esp
 0046851B    add         esp,0FFFFFDFC
 00468521    push        ebx
 00468522    xor         eax,eax
 00468524    mov         dword ptr [ebp-204],eax
 0046852A    xor         eax,eax
 0046852C    push        ebp
 0046852D    push        4685B4
 00468532    push        dword ptr fs:[eax]
 00468535    mov         dword ptr fs:[eax],esp
 00468538    call        kernel32.GetLastError
 0046853D    mov         ebx,eax
 0046853F    test        ebx,ebx
>00468541    je          00468596
 00468543    push        0
 00468545    push        100
 0046854A    lea         eax,[ebp-200]
 00468550    push        eax
 00468551    push        400
 00468556    push        ebx
 00468557    push        0
 00468559    push        1000
 0046855E    call        kernel32.FormatMessageW
 00468563    test        eax,eax
>00468565    je          00468596
 00468567    lea         eax,[ebp-204]
 0046856D    lea         edx,[ebp-200]
 00468573    mov         ecx,100
 00468578    call        @UStrFromWArray
 0046857D    mov         ecx,dword ptr [ebp-204]
 00468583    mov         dl,1
 00468585    mov         eax,[004391C8];EOutOfResources
 0046858A    call        Exception.Create
 0046858F    call        @RaiseExcept
>00468594    jmp         0046859B
 00468596    call        OutOfResources
 0046859B    xor         eax,eax
 0046859D    pop         edx
 0046859E    pop         ecx
 0046859F    pop         ecx
 004685A0    mov         dword ptr fs:[eax],edx
 004685A3    push        4685BB
 004685A8    lea         eax,[ebp-204]
 004685AE    call        @UStrClr
 004685B3    ret
>004685B4    jmp         @HandleFinally
>004685B9    jmp         004685A8
 004685BB    pop         ebx
 004685BC    mov         esp,ebp
 004685BE    pop         ebp
 004685BF    ret
*}
end;

//004685C0
function GDICheck(Value:Integer):Integer;
begin
{*
 004685C0    push        ebx
 004685C1    mov         ebx,eax
 004685C3    test        ebx,ebx
>004685C5    jne         004685CC
 004685C7    call        GDIError
 004685CC    mov         eax,ebx
 004685CE    pop         ebx
 004685CF    ret
*}
end;

//004685D0
function DupBits(Src:HBITMAP; Size:TPoint; Mono:Boolean):HBITMAP;
begin
{*
 004685D0    push        ebp
 004685D1    mov         ebp,esp
 004685D3    add         esp,0FFFFFFCC
 004685D6    push        ebx
 004685D7    push        esi
 004685D8    push        edi
 004685D9    mov         esi,edx
 004685DB    lea         edi,[ebp-0C]
 004685DE    movs        dword ptr [edi],dword ptr [esi]
 004685DF    movs        dword ptr [edi],dword ptr [esi]
 004685E0    mov         ebx,ecx
 004685E2    mov         dword ptr [ebp-4],eax
 004685E5    push        0
 004685E7    call        gdi32.CreateCompatibleDC
 004685EC    mov         dword ptr [ebp-18],eax
 004685EF    push        0
 004685F1    call        gdi32.CreateCompatibleDC
 004685F6    mov         dword ptr [ebp-1C],eax
 004685F9    xor         eax,eax
 004685FB    push        ebp
 004685FC    push        46871E
 00468601    push        dword ptr fs:[eax]
 00468604    mov         dword ptr fs:[eax],esp
 00468607    lea         eax,[ebp-34]
 0046860A    push        eax
 0046860B    push        18
 0046860D    mov         eax,dword ptr [ebp-4]
 00468610    push        eax
 00468611    call        gdi32.GetObjectW
 00468616    test        bl,bl
>00468618    je          00468632
 0046861A    push        0
 0046861C    push        1
 0046861E    push        1
 00468620    mov         eax,dword ptr [ebp-8]
 00468623    push        eax
 00468624    mov         eax,dword ptr [ebp-0C]
 00468627    push        eax
 00468628    call        gdi32.CreateBitmap
 0046862D    mov         dword ptr [ebp-10],eax
>00468630    jmp         00468694
 00468632    push        0
 00468634    call        user32.GetDC
 00468639    mov         dword ptr [ebp-14],eax
 0046863C    cmp         dword ptr [ebp-14],0
>00468640    jne         00468647
 00468642    call        GDIError
 00468647    xor         eax,eax
 00468649    push        ebp
 0046864A    push        46868D
 0046864F    push        dword ptr fs:[eax]
 00468652    mov         dword ptr fs:[eax],esp
 00468655    mov         eax,dword ptr [ebp-8]
 00468658    push        eax
 00468659    mov         eax,dword ptr [ebp-0C]
 0046865C    push        eax
 0046865D    mov         eax,dword ptr [ebp-14]
 00468660    push        eax
 00468661    call        gdi32.CreateCompatibleBitmap
 00468666    mov         dword ptr [ebp-10],eax
 00468669    cmp         dword ptr [ebp-10],0
>0046866D    jne         00468674
 0046866F    call        GDIError
 00468674    xor         eax,eax
 00468676    pop         edx
 00468677    pop         ecx
 00468678    pop         ecx
 00468679    mov         dword ptr fs:[eax],edx
 0046867C    push        468694
 00468681    mov         eax,dword ptr [ebp-14]
 00468684    push        eax
 00468685    push        0
 00468687    call        user32.ReleaseDC
 0046868C    ret
>0046868D    jmp         @HandleFinally
>00468692    jmp         00468681
 00468694    cmp         dword ptr [ebp-10],0
>00468698    je          004686FE
 0046869A    mov         eax,dword ptr [ebp-4]
 0046869D    push        eax
 0046869E    mov         eax,dword ptr [ebp-18]
 004686A1    push        eax
 004686A2    call        gdi32.SelectObject
 004686A7    mov         ebx,eax
 004686A9    mov         eax,dword ptr [ebp-10]
 004686AC    push        eax
 004686AD    mov         eax,dword ptr [ebp-1C]
 004686B0    push        eax
 004686B1    call        gdi32.SelectObject
 004686B6    mov         esi,eax
 004686B8    push        0CC0020
 004686BD    mov         eax,dword ptr [ebp-2C]
 004686C0    push        eax
 004686C1    mov         eax,dword ptr [ebp-30]
 004686C4    push        eax
 004686C5    push        0
 004686C7    push        0
 004686C9    mov         eax,dword ptr [ebp-18]
 004686CC    push        eax
 004686CD    mov         eax,dword ptr [ebp-8]
 004686D0    push        eax
 004686D1    mov         eax,dword ptr [ebp-0C]
 004686D4    push        eax
 004686D5    push        0
 004686D7    push        0
 004686D9    mov         eax,dword ptr [ebp-1C]
 004686DC    push        eax
 004686DD    call        gdi32.StretchBlt
 004686E2    test        ebx,ebx
>004686E4    je          004686F0
 004686E6    push        ebx
 004686E7    mov         eax,dword ptr [ebp-18]
 004686EA    push        eax
 004686EB    call        gdi32.SelectObject
 004686F0    test        esi,esi
>004686F2    je          004686FE
 004686F4    push        esi
 004686F5    mov         eax,dword ptr [ebp-1C]
 004686F8    push        eax
 004686F9    call        gdi32.SelectObject
 004686FE    xor         eax,eax
 00468700    pop         edx
 00468701    pop         ecx
 00468702    pop         ecx
 00468703    mov         dword ptr fs:[eax],edx
 00468706    push        468725
 0046870B    mov         eax,dword ptr [ebp-18]
 0046870E    push        eax
 0046870F    call        gdi32.DeleteDC
 00468714    mov         eax,dword ptr [ebp-1C]
 00468717    push        eax
 00468718    call        gdi32.DeleteDC
 0046871D    ret
>0046871E    jmp         @HandleFinally
>00468723    jmp         0046870B
 00468725    mov         eax,dword ptr [ebp-10]
 00468728    pop         edi
 00468729    pop         esi
 0046872A    pop         ebx
 0046872B    mov         esp,ebp
 0046872D    pop         ebp
 0046872E    ret
*}
end;

//00468730
function GetDInColors(BitCount:Word):Integer;
begin
{*
 00468730    mov         edx,eax
 00468732    dec         dx
>00468735    je          00468743
 00468737    sub         dx,3
>0046873B    je          00468743
 0046873D    sub         dx,4
>00468741    jne         0046874D
 00468743    mov         ecx,eax
 00468745    mov         eax,1
 0046874A    shl         eax,cl
 0046874C    ret
 0046874D    xor         eax,eax
 0046874F    ret
*}
end;

//00468750
function BytesPerScanline(PixelsPerScanline:LongInt; BitsPerPixel:LongInt; Alignment:LongInt):LongInt;
begin
{*
 00468750    push        ebx
 00468751    dec         ecx
 00468752    mov         ebx,eax
 00468754    imul        ebx,edx
 00468757    add         ebx,ecx
 00468759    not         ecx
 0046875B    and         ebx,ecx
 0046875D    mov         ecx,8
 00468762    mov         eax,ebx
 00468764    cdq
 00468765    idiv        eax,ecx
 00468767    mov         ebx,eax
 00468769    mov         eax,ebx
 0046876B    pop         ebx
 0046876C    ret
*}
end;

//00468770
function TransparentStretchBlt(DstDC:HDC; DstX:Integer; DstY:Integer; DstW:Integer; DstH:Integer; SrcDC:HDC; SrcX:Integer; SrcY:Integer; SrcW:Integer; SrcH:Integer; MaskDC:HDC; MaskX:Integer; MaskY:Integer):Boolean;
begin
{*
 00468770    push        ebp
 00468771    mov         ebp,esp
 00468773    add         esp,0FFFFFFDC
 00468776    push        ebx
 00468777    push        esi
 00468778    push        edi
 00468779    mov         dword ptr [ebp-8],ecx
 0046877C    mov         dword ptr [ebp-4],edx
 0046877F    mov         edi,eax
 00468781    mov         esi,dword ptr [ebp+14]
 00468784    mov         ebx,dword ptr [ebp+18]
 00468787    mov         byte ptr [ebp-9],1
 0046878B    mov         eax,[0078DB58];^gvar_00784C7C
 00468790    cmp         dword ptr [eax],2
>00468793    jne         0046883F
 00468799    cmp         ebx,dword ptr [ebp+2C]
>0046879C    jne         0046883F
 004687A2    cmp         esi,dword ptr [ebp+28]
>004687A5    jne         0046883F
 004687AB    push        1
 004687AD    push        1
 004687AF    mov         eax,dword ptr [ebp+24]
 004687B2    push        eax
 004687B3    call        gdi32.CreateCompatibleBitmap
 004687B8    call        GDICheck
 004687BD    mov         dword ptr [ebp-14],eax
 004687C0    mov         eax,dword ptr [ebp-14]
 004687C3    push        eax
 004687C4    mov         eax,dword ptr [ebp+10]
 004687C7    push        eax
 004687C8    call        gdi32.SelectObject
 004687CD    mov         dword ptr [ebp-14],eax
 004687D0    xor         eax,eax
 004687D2    push        ebp
 004687D3    push        468838
 004687D8    push        dword ptr fs:[eax]
 004687DB    mov         dword ptr fs:[eax],esp
 004687DE    push        0CCAA0029
 004687E3    mov         eax,dword ptr [ebp+8]
 004687E6    push        eax
 004687E7    mov         eax,dword ptr [ebp+0C]
 004687EA    push        eax
 004687EB    mov         eax,dword ptr [ebp-14]
 004687EE    push        eax
 004687EF    mov         eax,dword ptr [ebp+1C]
 004687F2    push        eax
 004687F3    mov         eax,dword ptr [ebp+20]
 004687F6    push        eax
 004687F7    mov         eax,dword ptr [ebp+24]
 004687FA    push        eax
 004687FB    mov         eax,dword ptr [ebp+28]
 004687FE    push        eax
 004687FF    mov         eax,dword ptr [ebp+2C]
 00468802    push        eax
 00468803    mov         eax,dword ptr [ebp-8]
 00468806    push        eax
 00468807    mov         eax,dword ptr [ebp-4]
 0046880A    push        eax
 0046880B    push        edi
 0046880C    call        gdi32.MaskBlt
 00468811    xor         eax,eax
 00468813    pop         edx
 00468814    pop         ecx
 00468815    pop         ecx
 00468816    mov         dword ptr fs:[eax],edx
 00468819    push        4689EC
 0046881E    mov         eax,dword ptr [ebp-14]
 00468821    push        eax
 00468822    mov         eax,dword ptr [ebp+10]
 00468825    push        eax
 00468826    call        gdi32.SelectObject
 0046882B    mov         dword ptr [ebp-14],eax
 0046882E    mov         eax,dword ptr [ebp-14]
 00468831    push        eax
 00468832    call        gdi32.DeleteObject
 00468837    ret
>00468838    jmp         @HandleFinally
>0046883D    jmp         0046881E
 0046883F    xor         eax,eax
 00468841    mov         dword ptr [ebp-24],eax
 00468844    push        0
 00468846    call        gdi32.CreateCompatibleDC
 0046884B    call        GDICheck
 00468850    mov         dword ptr [ebp-10],eax
 00468853    xor         eax,eax
 00468855    push        ebp
 00468856    push        4689E5
 0046885B    push        dword ptr fs:[eax]
 0046885E    mov         dword ptr fs:[eax],esp
 00468861    push        esi
 00468862    push        ebx
 00468863    mov         eax,dword ptr [ebp+24]
 00468866    push        eax
 00468867    call        gdi32.CreateCompatibleBitmap
 0046886C    call        GDICheck
 00468871    mov         dword ptr [ebp-14],eax
 00468874    mov         eax,dword ptr [ebp-14]
 00468877    push        eax
 00468878    mov         eax,dword ptr [ebp-10]
 0046887B    push        eax
 0046887C    call        gdi32.SelectObject
 00468881    mov         dword ptr [ebp-18],eax
 00468884    push        0
 00468886    mov         eax,[00793050]
 0046888B    push        eax
 0046888C    mov         eax,dword ptr [ebp+24]
 0046888F    push        eax
 00468890    call        gdi32.SelectPalette
 00468895    mov         dword ptr [ebp-24],eax
 00468898    push        0
 0046889A    mov         eax,dword ptr [ebp-24]
 0046889D    push        eax
 0046889E    mov         eax,dword ptr [ebp+24]
 004688A1    push        eax
 004688A2    call        gdi32.SelectPalette
 004688A7    cmp         dword ptr [ebp-24],0
>004688AB    je          004688C1
 004688AD    push        0FF
 004688AF    mov         eax,dword ptr [ebp-24]
 004688B2    push        eax
 004688B3    mov         eax,dword ptr [ebp-10]
 004688B6    push        eax
 004688B7    call        gdi32.SelectPalette
 004688BC    mov         dword ptr [ebp-24],eax
>004688BF    jmp         004688D5
 004688C1    push        0FF
 004688C3    mov         eax,[00793050]
 004688C8    push        eax
 004688C9    mov         eax,dword ptr [ebp-10]
 004688CC    push        eax
 004688CD    call        gdi32.SelectPalette
 004688D2    mov         dword ptr [ebp-24],eax
 004688D5    mov         eax,dword ptr [ebp-10]
 004688D8    push        eax
 004688D9    call        gdi32.RealizePalette
 004688DE    push        0CC0020
 004688E3    push        esi
 004688E4    push        ebx
 004688E5    mov         eax,dword ptr [ebp+8]
 004688E8    push        eax
 004688E9    mov         eax,dword ptr [ebp+0C]
 004688EC    push        eax
 004688ED    mov         eax,dword ptr [ebp+10]
 004688F0    push        eax
 004688F1    push        esi
 004688F2    push        ebx
 004688F3    push        0
 004688F5    push        0
 004688F7    mov         eax,dword ptr [ebp-10]
 004688FA    push        eax
 004688FB    call        gdi32.StretchBlt
 00468900    push        440328
 00468905    push        esi
 00468906    push        ebx
 00468907    mov         eax,dword ptr [ebp+1C]
 0046890A    push        eax
 0046890B    mov         eax,dword ptr [ebp+20]
 0046890E    push        eax
 0046890F    mov         eax,dword ptr [ebp+24]
 00468912    push        eax
 00468913    push        esi
 00468914    push        ebx
 00468915    push        0
 00468917    push        0
 00468919    mov         eax,dword ptr [ebp-10]
 0046891C    push        eax
 0046891D    call        gdi32.StretchBlt
 00468922    push        0
 00468924    push        edi
 00468925    call        gdi32.SetTextColor
 0046892A    mov         dword ptr [ebp-1C],eax
 0046892D    push        0FFFFFF
 00468932    push        edi
 00468933    call        gdi32.SetBkColor
 00468938    mov         dword ptr [ebp-20],eax
 0046893B    push        8800C6
 00468940    push        esi
 00468941    push        ebx
 00468942    mov         eax,dword ptr [ebp+8]
 00468945    push        eax
 00468946    mov         eax,dword ptr [ebp+0C]
 00468949    push        eax
 0046894A    mov         eax,dword ptr [ebp+10]
 0046894D    push        eax
 0046894E    mov         eax,dword ptr [ebp+28]
 00468951    push        eax
 00468952    mov         eax,dword ptr [ebp+2C]
 00468955    push        eax
 00468956    mov         eax,dword ptr [ebp-8]
 00468959    push        eax
 0046895A    mov         eax,dword ptr [ebp-4]
 0046895D    push        eax
 0046895E    push        edi
 0046895F    call        gdi32.StretchBlt
 00468964    push        660046
 00468969    push        esi
 0046896A    push        ebx
 0046896B    push        0
 0046896D    push        0
 0046896F    mov         eax,dword ptr [ebp-10]
 00468972    push        eax
 00468973    mov         eax,dword ptr [ebp+28]
 00468976    push        eax
 00468977    mov         eax,dword ptr [ebp+2C]
 0046897A    push        eax
 0046897B    mov         eax,dword ptr [ebp-8]
 0046897E    push        eax
 0046897F    mov         eax,dword ptr [ebp-4]
 00468982    push        eax
 00468983    push        edi
 00468984    call        gdi32.StretchBlt
 00468989    mov         eax,dword ptr [ebp-1C]
 0046898C    push        eax
 0046898D    push        edi
 0046898E    call        gdi32.SetTextColor
 00468993    mov         eax,dword ptr [ebp-20]
 00468996    push        eax
 00468997    push        edi
 00468998    call        gdi32.SetBkColor
 0046899D    cmp         dword ptr [ebp-18],0
>004689A1    je          004689B0
 004689A3    mov         eax,dword ptr [ebp-18]
 004689A6    push        eax
 004689A7    mov         eax,dword ptr [ebp-10]
 004689AA    push        eax
 004689AB    call        gdi32.SelectObject
 004689B0    mov         eax,dword ptr [ebp-14]
 004689B3    push        eax
 004689B4    call        gdi32.DeleteObject
 004689B9    xor         eax,eax
 004689BB    pop         edx
 004689BC    pop         ecx
 004689BD    pop         ecx
 004689BE    mov         dword ptr fs:[eax],edx
 004689C1    push        4689EC
 004689C6    cmp         dword ptr [ebp-24],0
>004689CA    je          004689DB
 004689CC    push        0
 004689CE    mov         eax,dword ptr [ebp-24]
 004689D1    push        eax
 004689D2    mov         eax,dword ptr [ebp-10]
 004689D5    push        eax
 004689D6    call        gdi32.SelectPalette
 004689DB    mov         eax,dword ptr [ebp-10]
 004689DE    push        eax
 004689DF    call        gdi32.DeleteDC
 004689E4    ret
>004689E5    jmp         @HandleFinally
>004689EA    jmp         004689C6
 004689EC    movzx       eax,byte ptr [ebp-9]
 004689F0    pop         edi
 004689F1    pop         esi
 004689F2    pop         ebx
 004689F3    mov         esp,ebp
 004689F5    pop         ebp
 004689F6    ret         28
*}
end;

//004689FC
procedure RGBTripleToQuad(var ColorTable:void );
begin
{*
 004689FC    push        ebx
 004689FD    push        esi
 004689FE    push        edi
 004689FF    mov         esi,eax
 00468A01    mov         edi,esi
 00468A03    mov         edx,0FF
 00468A08    lea         eax,[edi+edx*4]
 00468A0B    lea         ecx,[edx+edx*2]
 00468A0E    lea         ecx,[esi+ecx]
 00468A11    movzx       ebx,byte ptr [ecx+2]
 00468A15    mov         byte ptr [eax+2],bl
 00468A18    movzx       ebx,byte ptr [ecx+1]
 00468A1C    mov         byte ptr [eax+1],bl
 00468A1F    movzx       ecx,byte ptr [ecx]
 00468A22    mov         byte ptr [eax],cl
 00468A24    mov         byte ptr [eax+3],0
 00468A28    dec         edx
 00468A29    test        edx,edx
>00468A2B    jne         00468A08
 00468A2D    mov         byte ptr [edi+3],0
 00468A31    pop         edi
 00468A32    pop         esi
 00468A33    pop         ebx
 00468A34    ret
*}
end;

//00468A38
procedure RGBQuadToTriple(var ColorTable:void ; var ColorCount:Integer);
begin
{*
 00468A38    push        ebx
 00468A39    push        esi
 00468A3A    push        edi
 00468A3B    add         esp,0FFFFFFF8
 00468A3E    mov         dword ptr [esp],edx
 00468A41    mov         esi,eax
 00468A43    mov         dword ptr [esp+4],esi
 00468A47    mov         edi,dword ptr [esp]
 00468A4A    mov         edi,dword ptr [edi]
 00468A4C    dec         edi
 00468A4D    test        edi,edi
>00468A4F    jle         00468A7A
 00468A51    mov         ecx,1
 00468A56    mov         eax,dword ptr [esp+4]
 00468A5A    lea         eax,[eax+ecx*4]
 00468A5D    lea         edx,[ecx+ecx*2]
 00468A60    lea         edx,[esi+edx]
 00468A63    movzx       ebx,byte ptr [eax+2]
 00468A67    mov         byte ptr [edx+2],bl
 00468A6A    movzx       ebx,byte ptr [eax+1]
 00468A6E    mov         byte ptr [edx+1],bl
 00468A71    movzx       eax,byte ptr [eax]
 00468A74    mov         byte ptr [edx],al
 00468A76    inc         ecx
 00468A77    dec         edi
>00468A78    jne         00468A56
 00468A7A    mov         eax,dword ptr [esp]
 00468A7D    cmp         dword ptr [eax],100
>00468A83    jge         00468AAD
 00468A85    mov         eax,dword ptr [esp]
 00468A88    mov         edx,100
 00468A8D    sub         edx,dword ptr [eax]
 00468A8F    lea         edx,[edx+edx*2]
 00468A92    mov         eax,dword ptr [esp]
 00468A95    mov         eax,dword ptr [eax]
 00468A97    lea         eax,[eax+eax*2]
 00468A9A    lea         eax,[esi+eax]
 00468A9D    xor         ecx,ecx
 00468A9F    call        @FillChar
 00468AA4    mov         eax,dword ptr [esp]
 00468AA7    mov         dword ptr [eax],100
 00468AAD    pop         ecx
 00468AAE    pop         edx
 00468AAF    pop         edi
 00468AB0    pop         esi
 00468AB1    pop         ebx
 00468AB2    ret
*}
end;

//00468AB4
procedure ByteSwapColors(var Colors:void ; Count:Integer);
begin
{*
 00468AB4    push        ebp
 00468AB5    mov         ebp,esp
 00468AB7    add         esp,0FFFFFFF4
 00468ABA    mov         dword ptr [ebp-8],edx
 00468ABD    mov         dword ptr [ebp-4],eax
 00468AC0    mov         eax,[0078D884];Test8086:Byte
 00468AC5    movzx       eax,byte ptr [eax]
 00468AC8    mov         dword ptr [ebp-0C],eax
 00468ACB    mov         edx,dword ptr [ebp-4]
 00468ACE    mov         ecx,dword ptr [ebp-8]
 00468AD1    dec         ecx
>00468AD2    js          00468B03
 00468AD4    cmp         dword ptr [ebp-0C],2
>00468AD8    jle         00468AEA
 00468ADA    mov         eax,dword ptr [edx+ecx*4]
 00468ADD    bswap       eax
 00468ADF    shr         eax,8
 00468AE2    mov         dword ptr [edx+ecx*4],eax
 00468AE5    dec         ecx
>00468AE6    jns         00468ADA
>00468AE8    jmp         00468B03
 00468AEA    push        ebx
 00468AEB    xor         ebx,ebx
 00468AED    mov         eax,dword ptr [edx+ecx*4]
 00468AF0    mov         bh,al
 00468AF2    mov         bl,ah
 00468AF4    shr         eax,10
 00468AF7    shl         ebx,8
 00468AFA    mov         bl,al
 00468AFC    mov         dword ptr [edx+ecx*4],ebx
 00468AFF    dec         ecx
>00468B00    jns         00468AEB
 00468B02    pop         ebx
 00468B03    mov         esp,ebp
 00468B05    pop         ebp
 00468B06    ret
*}
end;

//00468B08
function CreateSystemPalette(const Entries:array[$0..-$1] of TColor; const _Dv_:$0..-$1):HPALETTE;
begin
{*
 00468B08    push        ebp
 00468B09    mov         ebp,esp
 00468B0B    add         esp,0FFFFFBF8
 00468B11    push        ebx
 00468B12    mov         word ptr [ebp-408],300
 00468B1B    mov         word ptr [ebp-406],10
 00468B24    lea         edx,[ebp-404]
 00468B2A    mov         ecx,40
 00468B2F    call        Move
 00468B34    push        0
 00468B36    call        user32.GetDC
 00468B3B    mov         dword ptr [ebp-4],eax
 00468B3E    xor         eax,eax
 00468B40    push        ebp
 00468B41    push        468C05
 00468B46    push        dword ptr fs:[eax]
 00468B49    mov         dword ptr fs:[eax],esp
 00468B4C    push        68
 00468B4E    mov         eax,dword ptr [ebp-4]
 00468B51    push        eax
 00468B52    call        gdi32.GetDeviceCaps
 00468B57    mov         ebx,eax
 00468B59    cmp         ebx,10
>00468B5C    jl          00468BEC
 00468B62    lea         eax,[ebp-404]
 00468B68    push        eax
 00468B69    push        8
 00468B6B    push        0
 00468B6D    mov         eax,dword ptr [ebp-4]
 00468B70    push        eax
 00468B71    call        gdi32.GetSystemPaletteEntries
 00468B76    cmp         dword ptr [ebp-3E8],0C0C0C0
>00468B80    jne         00468BCE
 00468B82    lea         eax,[ebp-3E8]
 00468B88    push        eax
 00468B89    push        1
 00468B8B    mov         eax,ebx
 00468B8D    sub         eax,8
 00468B90    push        eax
 00468B91    mov         eax,dword ptr [ebp-4]
 00468B94    push        eax
 00468B95    call        gdi32.GetSystemPaletteEntries
 00468B9A    movzx       eax,word ptr [ebp-406]
 00468BA1    lea         eax,[ebp+eax*4-420]
 00468BA8    push        eax
 00468BA9    push        7
 00468BAB    sub         ebx,7
 00468BAE    push        ebx
 00468BAF    mov         eax,dword ptr [ebp-4]
 00468BB2    push        eax
 00468BB3    call        gdi32.GetSystemPaletteEntries
 00468BB8    lea         eax,[ebp-3E4]
 00468BBE    push        eax
 00468BBF    push        1
 00468BC1    push        7
 00468BC3    mov         eax,dword ptr [ebp-4]
 00468BC6    push        eax
 00468BC7    call        gdi32.GetSystemPaletteEntries
>00468BCC    jmp         00468BEC
 00468BCE    movzx       eax,word ptr [ebp-406]
 00468BD5    lea         eax,[ebp+eax*4-424]
 00468BDC    push        eax
 00468BDD    push        8
 00468BDF    sub         ebx,8
 00468BE2    push        ebx
 00468BE3    mov         eax,dword ptr [ebp-4]
 00468BE6    push        eax
 00468BE7    call        gdi32.GetSystemPaletteEntries
 00468BEC    xor         eax,eax
 00468BEE    pop         edx
 00468BEF    pop         ecx
 00468BF0    pop         ecx
 00468BF1    mov         dword ptr fs:[eax],edx
 00468BF4    push        468C0C
 00468BF9    mov         eax,dword ptr [ebp-4]
 00468BFC    push        eax
 00468BFD    push        0
 00468BFF    call        user32.ReleaseDC
 00468C04    ret
>00468C05    jmp         @HandleFinally
>00468C0A    jmp         00468BF9
 00468C0C    lea         eax,[ebp-408]
 00468C12    push        eax
 00468C13    call        gdi32.CreatePalette
 00468C18    pop         ebx
 00468C19    mov         esp,ebp
 00468C1B    pop         ebp
 00468C1C    ret
*}
end;

//00468C20
function SystemPaletteOverride(var Pal:TMaxLogPalette):Boolean;
begin
{*
 00468C20    push        ebp
 00468C21    mov         ebp,esp
 00468C23    add         esp,0FFFFFFF8
 00468C26    push        ebx
 00468C27    mov         ebx,eax
 00468C29    mov         byte ptr [ebp-1],0
 00468C2D    cmp         dword ptr ds:[793050],0
>00468C34    je          00468CAD
 00468C36    push        0
 00468C38    call        user32.GetDC
 00468C3D    mov         dword ptr [ebp-8],eax
 00468C40    xor         edx,edx
 00468C42    push        ebp
 00468C43    push        468CA6
 00468C48    push        dword ptr fs:[edx]
 00468C4B    mov         dword ptr fs:[edx],esp
 00468C4E    push        68
 00468C50    mov         eax,dword ptr [ebp-8]
 00468C53    push        eax
 00468C54    call        gdi32.GetDeviceCaps
 00468C59    cmp         eax,10
>00468C5C    jl          00468C8D
 00468C5E    lea         eax,[ebx+4]
 00468C61    push        eax
 00468C62    push        8
 00468C64    push        0
 00468C66    mov         eax,[00793050]
 00468C6B    push        eax
 00468C6C    call        gdi32.GetPaletteEntries
 00468C71    movzx       eax,word ptr [ebx+2]
 00468C75    lea         eax,[ebx+eax*4-1C]
 00468C79    push        eax
 00468C7A    push        8
 00468C7C    push        8
 00468C7E    mov         eax,[00793050]
 00468C83    push        eax
 00468C84    call        gdi32.GetPaletteEntries
 00468C89    mov         byte ptr [ebp-1],1
 00468C8D    xor         eax,eax
 00468C8F    pop         edx
 00468C90    pop         ecx
 00468C91    pop         ecx
 00468C92    mov         dword ptr fs:[eax],edx
 00468C95    push        468CAD
 00468C9A    mov         eax,dword ptr [ebp-8]
 00468C9D    push        eax
 00468C9E    push        0
 00468CA0    call        user32.ReleaseDC
 00468CA5    ret
>00468CA6    jmp         @HandleFinally
>00468CAB    jmp         00468C9A
 00468CAD    movzx       eax,byte ptr [ebp-1]
 00468CB1    pop         ebx
 00468CB2    pop         ecx
 00468CB3    pop         ecx
 00468CB4    pop         ebp
 00468CB5    ret
*}
end;

//00468CB8
function PaletteFromDIBColorTable(DIBHandle:THandle; ColorTable:Pointer; ColorCount:Integer):HPALETTE;
begin
{*
 00468CB8    push        ebx
 00468CB9    push        esi
 00468CBA    push        edi
 00468CBB    add         esp,0FFFFFBFC
 00468CC1    mov         edi,eax
 00468CC3    xor         esi,esi
 00468CC5    mov         word ptr [esp],300
 00468CCB    test        edi,edi
>00468CCD    je          00468D07
 00468CCF    push        0
 00468CD1    call        gdi32.CreateCompatibleDC
 00468CD6    mov         ebx,eax
 00468CD8    push        edi
 00468CD9    push        ebx
 00468CDA    call        gdi32.SelectObject
 00468CDF    mov         edi,eax
 00468CE1    lea         eax,[esp+4]
 00468CE5    push        eax
 00468CE6    push        100
 00468CEB    push        0
 00468CED    push        ebx
 00468CEE    call        gdi32.GetDIBColorTable
 00468CF3    mov         word ptr [esp+2],ax
 00468CF8    push        edi
 00468CF9    push        ebx
 00468CFA    call        gdi32.SelectObject
 00468CFF    push        ebx
 00468D00    call        gdi32.DeleteDC
>00468D05    jmp         00468D1B
 00468D07    mov         word ptr [esp+2],cx
 00468D0C    mov         eax,edx
 00468D0E    lea         edx,[esp+4]
 00468D12    add         ecx,ecx
 00468D14    add         ecx,ecx
 00468D16    call        Move
 00468D1B    cmp         word ptr [esp+2],0
>00468D21    je          00468D4E
 00468D23    cmp         word ptr [esp+2],10
>00468D29    jne         00468D36
 00468D2B    mov         eax,esp
 00468D2D    call        SystemPaletteOverride
 00468D32    test        al,al
>00468D34    jne         00468D44
 00468D36    movzx       edx,word ptr [esp+2]
 00468D3B    lea         eax,[esp+4]
 00468D3F    call        ByteSwapColors
 00468D44    mov         eax,esp
 00468D46    push        eax
 00468D47    call        gdi32.CreatePalette
 00468D4C    mov         esi,eax
 00468D4E    mov         eax,esi
 00468D50    add         esp,404
 00468D56    pop         edi
 00468D57    pop         esi
 00468D58    pop         ebx
 00468D59    ret
*}
end;

//00468D5C
function PaletteToDIBColorTable(Pal:HPALETTE; var ColorTable:array[$0..-$1] of Windows.TRGBQuad; const _Dv_:$0..-$1):Integer;
begin
{*
 00468D5C    push        ebx
 00468D5D    push        esi
 00468D5E    push        edi
 00468D5F    push        ecx
 00468D60    mov         edi,ecx
 00468D62    mov         esi,edx
 00468D64    mov         ebx,eax
 00468D66    xor         eax,eax
 00468D68    mov         dword ptr [esp],eax
 00468D6B    test        ebx,ebx
>00468D6D    je          00468DA5
 00468D6F    push        esp
 00468D70    push        4
 00468D72    push        ebx
 00468D73    call        gdi32.GetObjectW
 00468D78    test        eax,eax
>00468D7A    je          00468DA5
 00468D7C    cmp         dword ptr [esp],0
>00468D80    je          00468DA5
 00468D82    mov         eax,edi
 00468D84    inc         eax
 00468D85    cmp         eax,dword ptr [esp]
>00468D88    jge         00468D8D
 00468D8A    mov         dword ptr [esp],eax
 00468D8D    push        esi
 00468D8E    mov         eax,dword ptr [esp+4]
 00468D92    push        eax
 00468D93    push        0
 00468D95    push        ebx
 00468D96    call        gdi32.GetPaletteEntries
 00468D9B    mov         eax,esi
 00468D9D    mov         edx,dword ptr [esp]
 00468DA0    call        ByteSwapColors
 00468DA5    mov         eax,dword ptr [esp]
 00468DA8    pop         edx
 00468DA9    pop         edi
 00468DAA    pop         esi
 00468DAB    pop         ebx
 00468DAC    ret
*}
end;

//00468DB0
procedure TwoBitsFromDIB(var BI:TBitmapInfoHeader; var XorBits:HBITMAP; var AndBits:HBITMAP; const IconSize:TPoint);
begin
{*
 00468DB0    push        ebp
 00468DB1    mov         ebp,esp
 00468DB3    add         esp,0FFFFFFEC
 00468DB6    push        ebx
 00468DB7    push        esi
 00468DB8    push        edi
 00468DB9    mov         dword ptr [ebp-8],ecx
 00468DBC    mov         ebx,edx
 00468DBE    mov         dword ptr [ebp-4],eax
 00468DC1    mov         eax,dword ptr [ebp-4]
 00468DC4    shr         dword ptr [eax+8],1
 00468DC7    mov         edx,dword ptr [ebp-4]
 00468DCA    movzx       edx,word ptr [edx+0E]
 00468DCE    mov         eax,dword ptr [ebp-4]
 00468DD1    mov         eax,dword ptr [eax+4]
 00468DD4    mov         ecx,20
 00468DD9    call        BytesPerScanline
 00468DDE    mov         edx,dword ptr [ebp-4]
 00468DE1    imul        dword ptr [edx+8]
 00468DE4    mov         edx,dword ptr [ebp-4]
 00468DE7    mov         dword ptr [edx+14],eax
 00468DEA    mov         eax,dword ptr [ebp-4]
 00468DED    movzx       eax,word ptr [eax+0E]
 00468DF1    call        GetDInColors
 00468DF6    mov         esi,eax
 00468DF8    push        0
 00468DFA    call        user32.GetDC
 00468DFF    mov         dword ptr [ebp-10],eax
 00468E02    cmp         dword ptr [ebp-10],0
>00468E06    jne         00468E0D
 00468E08    call        OutOfResources
 00468E0D    xor         edx,edx
 00468E0F    push        ebp
 00468E10    push        468F5D
 00468E15    push        dword ptr fs:[edx]
 00468E18    mov         dword ptr fs:[edx],esp
 00468E1B    mov         edi,dword ptr [ebp-4]
 00468E1E    mov         eax,edi
 00468E20    add         eax,28
 00468E23    mov         edx,esi
 00468E25    add         edx,edx
 00468E27    add         edx,edx
 00468E29    add         eax,edx
 00468E2B    mov         dword ptr [ebp-14],eax
 00468E2E    push        0
 00468E30    mov         eax,dword ptr [ebp-4]
 00468E33    push        edi
 00468E34    mov         eax,dword ptr [ebp-14]
 00468E37    push        eax
 00468E38    push        4
 00468E3A    mov         eax,dword ptr [ebp-4]
 00468E3D    push        eax
 00468E3E    mov         eax,dword ptr [ebp-10]
 00468E41    push        eax
 00468E42    call        gdi32.CreateDIBitmap
 00468E47    call        GDICheck
 00468E4C    mov         dword ptr [ebp-0C],eax
 00468E4F    xor         eax,eax
 00468E51    push        ebp
 00468E52    push        468E83
 00468E57    push        dword ptr fs:[eax]
 00468E5A    mov         dword ptr fs:[eax],esp
 00468E5D    mov         edx,dword ptr [ebp+8]
 00468E60    xor         ecx,ecx
 00468E62    mov         eax,dword ptr [ebp-0C]
 00468E65    call        DupBits
 00468E6A    mov         dword ptr [ebx],eax
 00468E6C    xor         eax,eax
 00468E6E    pop         edx
 00468E6F    pop         ecx
 00468E70    pop         ecx
 00468E71    mov         dword ptr fs:[eax],edx
 00468E74    push        468E8A
 00468E79    mov         eax,dword ptr [ebp-0C]
 00468E7C    push        eax
 00468E7D    call        gdi32.DeleteObject
 00468E82    ret
>00468E83    jmp         @HandleFinally
>00468E88    jmp         00468E79
 00468E8A    mov         eax,dword ptr [ebp-4]
 00468E8D    mov         eax,dword ptr [eax+14]
 00468E90    add         dword ptr [ebp-14],eax
 00468E93    mov         eax,dword ptr [ebp-4]
 00468E96    mov         bx,1
 00468E9A    mov         word ptr [eax+0E],bx
 00468E9E    mov         eax,dword ptr [ebp-4]
 00468EA1    movzx       edx,bx
 00468EA4    mov         eax,dword ptr [ebp-4]
 00468EA7    mov         eax,dword ptr [eax+4]
 00468EAA    mov         ecx,20
 00468EAF    call        BytesPerScanline
 00468EB4    mov         edx,dword ptr [ebp-4]
 00468EB7    imul        dword ptr [edx+8]
 00468EBA    mov         edx,dword ptr [ebp-4]
 00468EBD    mov         dword ptr [edx+14],eax
 00468EC0    mov         eax,dword ptr [ebp-4]
 00468EC3    mov         dword ptr [eax+20],2
 00468ECA    mov         eax,dword ptr [ebp-4]
 00468ECD    mov         dword ptr [eax+24],2
 00468ED4    mov         eax,dword ptr [ebp-4]
 00468ED7    add         eax,28
 00468EDA    xor         edx,edx
 00468EDC    mov         dword ptr [eax],edx
 00468EDE    mov         dword ptr [eax+4],0FFFFFF
 00468EE5    push        0
 00468EE7    mov         ebx,dword ptr [ebp-4]
 00468EEA    push        ebx
 00468EEB    mov         eax,dword ptr [ebp-14]
 00468EEE    push        eax
 00468EEF    push        4
 00468EF1    mov         eax,dword ptr [ebp-4]
 00468EF4    push        ebx
 00468EF5    mov         eax,dword ptr [ebp-10]
 00468EF8    push        eax
 00468EF9    call        gdi32.CreateDIBitmap
 00468EFE    call        GDICheck
 00468F03    mov         dword ptr [ebp-0C],eax
 00468F06    xor         eax,eax
 00468F08    push        ebp
 00468F09    push        468F3D
 00468F0E    push        dword ptr fs:[eax]
 00468F11    mov         dword ptr fs:[eax],esp
 00468F14    mov         edx,dword ptr [ebp+8]
 00468F17    mov         cl,1
 00468F19    mov         eax,dword ptr [ebp-0C]
 00468F1C    call        DupBits
 00468F21    mov         edx,dword ptr [ebp-8]
 00468F24    mov         dword ptr [edx],eax
 00468F26    xor         eax,eax
 00468F28    pop         edx
 00468F29    pop         ecx
 00468F2A    pop         ecx
 00468F2B    mov         dword ptr fs:[eax],edx
 00468F2E    push        468F44
 00468F33    mov         eax,dword ptr [ebp-0C]
 00468F36    push        eax
 00468F37    call        gdi32.DeleteObject
 00468F3C    ret
>00468F3D    jmp         @HandleFinally
>00468F42    jmp         00468F33
 00468F44    xor         eax,eax
 00468F46    pop         edx
 00468F47    pop         ecx
 00468F48    pop         ecx
 00468F49    mov         dword ptr fs:[eax],edx
 00468F4C    push        468F64
 00468F51    mov         eax,dword ptr [ebp-10]
 00468F54    push        eax
 00468F55    push        0
 00468F57    call        user32.ReleaseDC
 00468F5C    ret
>00468F5D    jmp         @HandleFinally
>00468F62    jmp         00468F51
 00468F64    pop         edi
 00468F65    pop         esi
 00468F66    pop         ebx
 00468F67    mov         esp,ebp
 00468F69    pop         ebp
 00468F6A    ret         4
*}
end;

//00468F70
function BetterSize(const Old:TIconRec; const New:TIconRec):Boolean;
begin
{*
 00468F70    push        ebp
 00468F71    mov         ebp,esp
 00468F73    push        ecx
 00468F74    push        ebx
 00468F75    push        esi
 00468F76    push        edi
 00468F77    movzx       ecx,byte ptr [edx]
 00468F7A    test        cl,cl
>00468F7C    jne         00468F90
 00468F7E    mov         ecx,dword ptr [ebp+8]
 00468F81    mov         ecx,dword ptr [ecx+8]
 00468F84    push        dword ptr [ecx]
 00468F86    mov         ecx,100
 00468F8B    pop         ebx
 00468F8C    sub         ecx,ebx
>00468F8E    jmp         00468F9B
 00468F90    movzx       ecx,cl
 00468F93    mov         ebx,dword ptr [ebp+8]
 00468F96    mov         ebx,dword ptr [ebx+8]
 00468F99    sub         ecx,dword ptr [ebx]
 00468F9B    movzx       ebx,byte ptr [edx+1]
 00468F9F    test        bl,bl
>00468FA1    jne         00468FB3
 00468FA3    mov         edx,dword ptr [ebp+8]
 00468FA6    mov         edx,dword ptr [edx+8]
 00468FA9    mov         ebx,100
 00468FAE    sub         ebx,dword ptr [edx+4]
>00468FB1    jmp         00468FC1
 00468FB3    movzx       edx,bl
 00468FB6    mov         ebx,dword ptr [ebp+8]
 00468FB9    mov         ebx,dword ptr [ebx+8]
 00468FBC    sub         edx,dword ptr [ebx+4]
 00468FBF    mov         ebx,edx
 00468FC1    movzx       edx,byte ptr [eax]
 00468FC4    test        dl,dl
>00468FC6    jne         00468FDA
 00468FC8    mov         edx,dword ptr [ebp+8]
 00468FCB    mov         edx,dword ptr [edx+8]
 00468FCE    mov         esi,100
 00468FD3    sub         esi,dword ptr [edx]
 00468FD5    mov         dword ptr [ebp-4],esi
>00468FD8    jmp         00468FE8
 00468FDA    movzx       edx,dl
 00468FDD    mov         esi,dword ptr [ebp+8]
 00468FE0    mov         esi,dword ptr [esi+8]
 00468FE3    sub         edx,dword ptr [esi]
 00468FE5    mov         dword ptr [ebp-4],edx
 00468FE8    movzx       edx,byte ptr [eax+1]
 00468FEC    test        dl,dl
>00468FEE    jne         00469000
 00468FF0    mov         eax,dword ptr [ebp+8]
 00468FF3    mov         eax,dword ptr [eax+8]
 00468FF6    mov         esi,100
 00468FFB    sub         esi,dword ptr [eax+4]
>00468FFE    jmp         0046900C
 00469000    movzx       esi,dl
 00469003    mov         eax,dword ptr [ebp+8]
 00469006    mov         eax,dword ptr [eax+8]
 00469009    sub         esi,dword ptr [eax+4]
 0046900C    mov         eax,ecx
 0046900E    cdq
 0046900F    xor         eax,edx
 00469011    sub         eax,edx
 00469013    mov         edi,eax
 00469015    mov         eax,dword ptr [ebp-4]
 00469018    cdq
 00469019    xor         eax,edx
 0046901B    sub         eax,edx
 0046901D    cmp         edi,eax
>0046901F    jg          00469046
 00469021    test        ecx,ecx
>00469023    jle         0046902A
 00469025    cmp         ecx,dword ptr [ebp-4]
>00469028    jg          00469046
 0046902A    mov         eax,ebx
 0046902C    cdq
 0046902D    xor         eax,edx
 0046902F    sub         eax,edx
 00469031    mov         ecx,eax
 00469033    mov         eax,esi
 00469035    cdq
 00469036    xor         eax,edx
 00469038    sub         eax,edx
 0046903A    cmp         ecx,eax
>0046903C    jg          00469046
 0046903E    test        ebx,ebx
>00469040    jle         0046904A
 00469042    cmp         esi,ebx
>00469044    jge         0046904A
 00469046    xor         eax,eax
>00469048    jmp         0046904C
 0046904A    mov         al,1
 0046904C    pop         edi
 0046904D    pop         esi
 0046904E    pop         ebx
 0046904F    pop         ecx
 00469050    pop         ebp
 00469051    ret
*}
end;

//00469054
procedure ReadIcon(Stream:TStream; var Icon:HICON; ImageCount:Integer; StartOffset:Integer; const RequestedSize:TPoint; var IconSize:TPoint);
begin
{*
 00469054    push        ebp
 00469055    mov         ebp,esp
 00469057    add         esp,0FFFFFF90
 0046905A    push        ebx
 0046905B    push        esi
 0046905C    push        edi
 0046905D    mov         dword ptr [ebp-0C],ecx
 00469060    mov         dword ptr [ebp-8],edx
 00469063    mov         dword ptr [ebp-4],eax
 00469066    mov         ebx,dword ptr [ebp+0C]
 00469069    mov         eax,dword ptr [ebp-0C]
 0046906C    shl         eax,4
 0046906F    mov         dword ptr [ebp-14],eax
 00469072    mov         eax,dword ptr [ebp-14]
 00469075    call        AllocMem
 0046907A    mov         dword ptr [ebp-10],eax
 0046907D    xor         edx,edx
 0046907F    push        ebp
 00469080    push        46937A
 00469085    push        dword ptr fs:[edx]
 00469088    mov         dword ptr fs:[edx],esp
 0046908B    mov         edx,dword ptr [ebp-10]
 0046908E    mov         ecx,dword ptr [ebp-14]
 00469091    mov         eax,dword ptr [ebp-4]
 00469094    mov         esi,dword ptr [eax]
 00469096    call        dword ptr [esi+0C]
 00469099    mov         eax,dword ptr [ebx]
 0046909B    or          eax,dword ptr [ebx+4]
>0046909E    jne         004690BB
 004690A0    push        0B
 004690A2    call        user32.GetSystemMetrics
 004690A7    mov         edx,dword ptr [ebp+8]
 004690AA    mov         dword ptr [edx],eax
 004690AC    push        0C
 004690AE    call        user32.GetSystemMetrics
 004690B3    mov         edx,dword ptr [ebp+8]
 004690B6    mov         dword ptr [edx+4],eax
>004690B9    jmp         004690C8
 004690BB    mov         eax,dword ptr [ebp+8]
 004690BE    mov         edx,dword ptr [ebx]
 004690C0    mov         dword ptr [eax],edx
 004690C2    mov         edx,dword ptr [ebx+4]
 004690C5    mov         dword ptr [eax+4],edx
 004690C8    push        0
 004690CA    call        user32.GetDC
 004690CF    mov         dword ptr [ebp-28],eax
 004690D2    cmp         dword ptr [ebp-28],0
>004690D6    jne         004690DD
 004690D8    call        OutOfResources
 004690DD    xor         edx,edx
 004690DF    push        ebp
 004690E0    push        46913D
 004690E5    push        dword ptr fs:[edx]
 004690E8    mov         dword ptr fs:[edx],esp
 004690EB    push        0E
 004690ED    mov         eax,dword ptr [ebp-28]
 004690F0    push        eax
 004690F1    call        gdi32.GetDeviceCaps
 004690F6    mov         ebx,eax
 004690F8    push        0C
 004690FA    mov         eax,dword ptr [ebp-28]
 004690FD    push        eax
 004690FE    call        gdi32.GetDeviceCaps
 00469103    imul        bx,ax
 00469107    mov         eax,ebx
 00469109    cmp         ax,8
>0046910D    jbe         00469118
 0046910F    mov         dword ptr [ebp-1C],7FFFFFFF
>00469116    jmp         00469124
 00469118    mov         ecx,eax
 0046911A    mov         eax,1
 0046911F    shl         eax,cl
 00469121    mov         dword ptr [ebp-1C],eax
 00469124    xor         eax,eax
 00469126    pop         edx
 00469127    pop         ecx
 00469128    pop         ecx
 00469129    mov         dword ptr fs:[eax],edx
 0046912C    push        469144
 00469131    mov         eax,dword ptr [ebp-28]
 00469134    push        eax
 00469135    push        0
 00469137    call        user32.ReleaseDC
 0046913C    ret
>0046913D    jmp         @HandleFinally
>00469142    jmp         00469131
 00469144    xor         eax,eax
 00469146    mov         dword ptr [ebp-24],eax
 00469149    mov         eax,dword ptr [ebp-10]
 0046914C    movzx       eax,word ptr [eax+2]
 00469150    test        eax,eax
>00469152    jne         00469159
 00469154    mov         eax,7FFFFFFF
 00469159    mov         dword ptr [ebp-20],eax
 0046915C    mov         edi,dword ptr [ebp-0C]
 0046915F    dec         edi
 00469160    test        edi,edi
>00469162    jle         004691B4
 00469164    mov         ebx,1
 00469169    mov         eax,ebx
 0046916B    add         eax,eax
 0046916D    mov         edx,dword ptr [ebp-10]
 00469170    movzx       eax,word ptr [edx+eax*8+2]
 00469175    test        eax,eax
>00469177    jne         0046917E
 00469179    mov         eax,7FFFFFFF
 0046917E    mov         esi,eax
 00469180    cmp         esi,dword ptr [ebp-1C]
>00469183    jg          004691B0
 00469185    cmp         esi,dword ptr [ebp-20]
>00469188    jl          004691B0
 0046918A    push        ebp
 0046918B    mov         eax,ebx
 0046918D    add         eax,eax
 0046918F    mov         edx,dword ptr [ebp-10]
 00469192    lea         edx,[edx+eax*8]
 00469195    mov         eax,dword ptr [ebp-24]
 00469198    add         eax,eax
 0046919A    mov         ecx,dword ptr [ebp-10]
 0046919D    lea         eax,[ecx+eax*8]
 004691A0    call        BetterSize
 004691A5    pop         ecx
 004691A6    test        al,al
>004691A8    je          004691B0
 004691AA    mov         dword ptr [ebp-24],ebx
 004691AD    mov         dword ptr [ebp-20],esi
 004691B0    inc         ebx
 004691B1    dec         edi
>004691B2    jne         00469169
 004691B4    mov         eax,dword ptr [ebp-24]
 004691B7    add         eax,eax
 004691B9    mov         edx,dword ptr [ebp-10]
 004691BC    lea         eax,[edx+eax*8]
 004691BF    mov         dword ptr [ebp-40],eax
 004691C2    mov         eax,dword ptr [ebp-40]
 004691C5    movzx       eax,byte ptr [eax]
 004691C8    test        al,al
>004691CA    jne         004691D7
 004691CC    mov         eax,dword ptr [ebp+8]
 004691CF    mov         dword ptr [eax],100
>004691D5    jmp         004691DF
 004691D7    movzx       eax,al
 004691DA    mov         edx,dword ptr [ebp+8]
 004691DD    mov         dword ptr [edx],eax
 004691DF    mov         eax,dword ptr [ebp-40]
 004691E2    movzx       eax,byte ptr [eax+1]
 004691E6    test        al,al
>004691E8    jne         004691F6
 004691EA    mov         eax,dword ptr [ebp+8]
 004691ED    mov         dword ptr [eax+4],100
>004691F4    jmp         004691FF
 004691F6    movzx       eax,al
 004691F9    mov         edx,dword ptr [ebp+8]
 004691FC    mov         dword ptr [edx+4],eax
 004691FF    mov         eax,dword ptr [ebp-40]
 00469202    mov         eax,dword ptr [eax+8]
 00469205    call        AllocMem
 0046920A    mov         dword ptr [ebp-2C],eax
 0046920D    xor         eax,eax
 0046920F    push        ebp
 00469210    push        46935A
 00469215    push        dword ptr fs:[eax]
 00469218    mov         dword ptr fs:[eax],esp
 0046921B    mov         eax,dword ptr [ebp-40]
 0046921E    mov         edx,dword ptr [eax+0C]
 00469221    mov         eax,dword ptr [ebp-14]
 00469224    add         eax,dword ptr [ebp+10]
 00469227    sub         edx,eax
 00469229    mov         cx,1
 0046922D    mov         eax,dword ptr [ebp-4]
 00469230    mov         ebx,dword ptr [eax]
 00469232    call        dword ptr [ebx+14]
 00469235    mov         eax,dword ptr [ebp-40]
 00469238    mov         ecx,dword ptr [eax+8]
 0046923B    mov         ebx,dword ptr [ebp-2C]
 0046923E    mov         edx,ebx
 00469240    mov         eax,dword ptr [ebp-4]
 00469243    mov         esi,dword ptr [eax]
 00469245    call        dword ptr [esi+0C]
 00469248    mov         eax,dword ptr [ebp+8]
 0046924B    push        eax
 0046924C    lea         ecx,[ebp-38]
 0046924F    lea         edx,[ebp-34]
 00469252    mov         eax,ebx
 00469254    call        TwoBitsFromDIB
 00469259    lea         eax,[ebp-70]
 0046925C    push        eax
 0046925D    push        18
 0046925F    mov         eax,dword ptr [ebp-38]
 00469262    push        eax
 00469263    call        gdi32.GetObjectW
 00469268    lea         eax,[ebp-58]
 0046926B    push        eax
 0046926C    push        18
 0046926E    mov         eax,dword ptr [ebp-34]
 00469271    push        eax
 00469272    call        gdi32.GetObjectW
 00469277    mov         ebx,dword ptr [ebp-64]
 0046927A    imul        ebx,dword ptr [ebp-68]
 0046927E    movzx       eax,word ptr [ebp-60]
 00469282    imul        ebx,eax
 00469285    mov         eax,dword ptr [ebp-4C]
 00469288    imul        dword ptr [ebp-50]
 0046928B    movzx       edx,word ptr [ebp-48]
 0046928F    imul        edx
 00469291    mov         dword ptr [ebp-3C],eax
 00469294    mov         eax,dword ptr [ebp-3C]
 00469297    add         eax,ebx
 00469299    mov         dword ptr [ebp-18],eax
 0046929C    mov         eax,dword ptr [ebp-18]
 0046929F    call        AllocMem
 004692A4    mov         dword ptr [ebp-30],eax
 004692A7    xor         eax,eax
 004692A9    push        ebp
 004692AA    push        469337
 004692AF    push        dword ptr fs:[eax]
 004692B2    mov         dword ptr fs:[eax],esp
 004692B5    mov         edi,dword ptr [ebp-30]
 004692B8    mov         esi,dword ptr [ebp-30]
 004692BB    add         esi,ebx
 004692BD    push        edi
 004692BE    push        ebx
 004692BF    mov         eax,dword ptr [ebp-38]
 004692C2    push        eax
 004692C3    call        gdi32.GetBitmapBits
 004692C8    push        esi
 004692C9    mov         eax,dword ptr [ebp-3C]
 004692CC    push        eax
 004692CD    mov         eax,dword ptr [ebp-34]
 004692D0    push        eax
 004692D1    call        gdi32.GetBitmapBits
 004692D6    mov         eax,dword ptr [ebp-34]
 004692D9    push        eax
 004692DA    call        gdi32.DeleteObject
 004692DF    mov         eax,dword ptr [ebp-38]
 004692E2    push        eax
 004692E3    call        gdi32.DeleteObject
 004692E8    push        esi
 004692E9    push        edi
 004692EA    movzx       eax,byte ptr [ebp-46]
 004692EE    push        eax
 004692EF    movzx       eax,byte ptr [ebp-48]
 004692F3    push        eax
 004692F4    mov         eax,dword ptr [ebp+8]
 004692F7    mov         eax,dword ptr [eax+4]
 004692FA    push        eax
 004692FB    mov         eax,dword ptr [ebp+8]
 004692FE    mov         eax,dword ptr [eax]
 00469300    push        eax
 00469301    mov         eax,[00790C38];gvar_00790C38
 00469306    push        eax
 00469307    call        user32.CreateIcon
 0046930C    mov         edx,dword ptr [ebp-8]
 0046930F    mov         dword ptr [edx],eax
 00469311    mov         eax,dword ptr [ebp-8]
 00469314    cmp         dword ptr [eax],0
>00469317    jne         0046931E
 00469319    call        GDIError
 0046931E    xor         eax,eax
 00469320    pop         edx
 00469321    pop         ecx
 00469322    pop         ecx
 00469323    mov         dword ptr fs:[eax],edx
 00469326    push        46933E
 0046932B    mov         edx,dword ptr [ebp-18]
 0046932E    mov         eax,dword ptr [ebp-30]
 00469331    call        @FreeMem
 00469336    ret
>00469337    jmp         @HandleFinally
>0046933C    jmp         0046932B
 0046933E    xor         eax,eax
 00469340    pop         edx
 00469341    pop         ecx
 00469342    pop         ecx
 00469343    mov         dword ptr fs:[eax],edx
 00469346    push        469361
 0046934B    mov         eax,dword ptr [ebp-40]
 0046934E    mov         edx,dword ptr [eax+8]
 00469351    mov         eax,dword ptr [ebp-2C]
 00469354    call        @FreeMem
 00469359    ret
>0046935A    jmp         @HandleFinally
>0046935F    jmp         0046934B
 00469361    xor         eax,eax
 00469363    pop         edx
 00469364    pop         ecx
 00469365    pop         ecx
 00469366    mov         dword ptr fs:[eax],edx
 00469369    push        469381
 0046936E    mov         edx,dword ptr [ebp-14]
 00469371    mov         eax,dword ptr [ebp-10]
 00469374    call        @FreeMem
 00469379    ret
>0046937A    jmp         @HandleFinally
>0046937F    jmp         0046936E
 00469381    pop         edi
 00469382    pop         esi
 00469383    pop         ebx
 00469384    mov         esp,ebp
 00469386    pop         ebp
 00469387    ret         0C
*}
end;

//0046938C
function ComputeAldusChecksum(var WMF:TMetafileHeader):Word;
begin
{*
 0046938C    xor         edx,edx
 0046938E    xor         dx,word ptr [eax]
 00469391    mov         ecx,dword ptr [eax]
 00469393    shr         ecx,10
 00469396    xor         dx,cx
 00469399    xor         dx,word ptr [eax+4]
 0046939D    xor         dx,word ptr [eax+6]
 004693A1    xor         dx,word ptr [eax+8]
 004693A5    xor         dx,word ptr [eax+0A]
 004693A9    xor         dx,word ptr [eax+0C]
 004693AD    xor         dx,word ptr [eax+0E]
 004693B1    xor         dx,word ptr [eax+10]
 004693B5    mov         eax,dword ptr [eax+10]
 004693B8    shr         eax,10
 004693BB    xor         dx,ax
 004693BE    mov         eax,edx
 004693C0    ret
*}
end;

//004693C4
procedure InitializeBitmapInfoHeader(Bitmap:HBITMAP; var BI:TBitmapInfoHeader; Colors:Integer);
begin
{*
 004693C4    push        ebx
 004693C5    push        esi
 004693C6    push        edi
 004693C7    add         esp,0FFFFFFAC
 004693CA    mov         esi,ecx
 004693CC    mov         ebx,edx
 004693CE    xor         edx,edx
 004693D0    mov         dword ptr [esp+18],edx
 004693D4    push        esp
 004693D5    push        54
 004693D7    push        eax
 004693D8    call        gdi32.GetObjectW
 004693DD    test        eax,eax
>004693DF    jne         004693E8
 004693E1    call        InvalidBitmap
>004693E6    jmp         00469427
 004693E8    cmp         eax,40
>004693EB    jl          00469405
 004693ED    cmp         dword ptr [esp+18],28
>004693F2    jb          00469405
 004693F4    push        esi
 004693F5    mov         edi,ebx
 004693F7    lea         esi,[esp+1C]
 004693FB    mov         ecx,0A
 00469400    rep movs    dword ptr [edi],dword ptr [esi]
 00469402    pop         esi
>00469403    jmp         00469427
 00469405    mov         eax,ebx
 00469407    xor         ecx,ecx
 00469409    mov         edx,28
 0046940E    call        @FillChar
 00469413    mov         dword ptr [ebx],28
 00469419    mov         eax,dword ptr [esp+4]
 0046941D    mov         dword ptr [ebx+4],eax
 00469420    mov         eax,dword ptr [esp+8]
 00469424    mov         dword ptr [ebx+8],eax
 00469427    mov         eax,esi
 00469429    sub         eax,2
>0046942C    je          0046943D
 0046942E    dec         eax
 0046942F    sub         eax,0E
>00469432    jb          00469445
 00469434    sub         eax,0F0
>00469439    jb          00469450
>0046943B    jmp         0046945B
 0046943D    mov         word ptr [ebx+0E],1
>00469443    jmp         00469469
 00469445    mov         word ptr [ebx+0E],4
 0046944B    mov         dword ptr [ebx+20],esi
>0046944E    jmp         00469469
 00469450    mov         word ptr [ebx+0E],8
 00469456    mov         dword ptr [ebx+20],esi
>00469459    jmp         00469469
 0046945B    movzx       eax,word ptr [esp+12]
 00469460    imul        word ptr [esp+10]
 00469465    mov         word ptr [ebx+0E],ax
 00469469    mov         word ptr [ebx+0C],1
 0046946F    mov         eax,dword ptr [ebx+20]
 00469472    cmp         eax,dword ptr [ebx+24]
>00469475    jae         0046947A
 00469477    mov         dword ptr [ebx+24],eax
 0046947A    cmp         dword ptr [ebx+14],0
>0046947E    jne         004694A1
 00469480    movzx       edx,word ptr [ebx+0E]
 00469484    mov         eax,dword ptr [ebx+4]
 00469487    mov         ecx,20
 0046948C    call        BytesPerScanline
 00469491    mov         ecx,eax
 00469493    mov         eax,dword ptr [ebx+8]
 00469496    cdq
 00469497    xor         eax,edx
 00469499    sub         eax,edx
 0046949B    imul        ecx,eax
 0046949E    mov         dword ptr [ebx+14],ecx
 004694A1    add         esp,54
 004694A4    pop         edi
 004694A5    pop         esi
 004694A6    pop         ebx
 004694A7    ret
*}
end;

//004694A8
procedure InternalGetDIBSizes(Bitmap:HBITMAP; var InfoHeaderSize:DWORD; var ImageSize:DWORD; Colors:Integer);
begin
{*
 004694A8    push        ebp
 004694A9    mov         ebp,esp
 004694AB    add         esp,0FFFFFFD8
 004694AE    push        ebx
 004694AF    push        esi
 004694B0    mov         esi,ecx
 004694B2    mov         ebx,edx
 004694B4    lea         edx,[ebp-28]
 004694B7    mov         ecx,dword ptr [ebp+8]
 004694BA    call        InitializeBitmapInfoHeader
 004694BF    movzx       eax,word ptr [ebp-1A]
 004694C3    cmp         ax,8
>004694C7    jbe         004694DA
 004694C9    mov         dword ptr [ebx],28
 004694CF    test        byte ptr [ebp-18],3
>004694D3    je          00469500
 004694D5    add         dword ptr [ebx],0C
>004694D8    jmp         00469500
 004694DA    mov         edx,dword ptr [ebp-8]
 004694DD    test        edx,edx
>004694DF    jne         004694F5
 004694E1    mov         ecx,eax
 004694E3    mov         eax,1
 004694E8    shl         eax,cl
 004694EA    add         eax,eax
 004694EC    add         eax,eax
 004694EE    add         eax,28
 004694F1    mov         dword ptr [ebx],eax
>004694F3    jmp         00469500
 004694F5    mov         eax,edx
 004694F7    add         eax,eax
 004694F9    add         eax,eax
 004694FB    add         eax,28
 004694FE    mov         dword ptr [ebx],eax
 00469500    mov         eax,dword ptr [ebp-14]
 00469503    mov         dword ptr [esi],eax
 00469505    pop         esi
 00469506    pop         ebx
 00469507    mov         esp,ebp
 00469509    pop         ebp
 0046950A    ret         4
*}
end;

//00469510
procedure GetDIBSizes(Bitmap:HBITMAP; var InfoHeaderSize:DWORD; var ImageSize:DWORD);
begin
{*
 00469510    push        0
 00469512    call        InternalGetDIBSizes
 00469517    ret
*}
end;

//00469518
function InternalGetDIB(Bitmap:HBITMAP; Palette:HPALETTE; var BitmapInfo:void ; var Bits:void ; Colors:Integer):Boolean;
begin
{*
 00469518    push        ebp
 00469519    mov         ebp,esp
 0046951B    add         esp,0FFFFFFF4
 0046951E    push        ebx
 0046951F    push        esi
 00469520    push        edi
 00469521    mov         ebx,ecx
 00469523    mov         edi,edx
 00469525    mov         esi,eax
 00469527    mov         edx,ebx
 00469529    mov         ecx,dword ptr [ebp+8]
 0046952C    mov         eax,esi
 0046952E    call        InitializeBitmapInfoHeader
 00469533    xor         eax,eax
 00469535    mov         dword ptr [ebp-8],eax
 00469538    push        0
 0046953A    call        gdi32.CreateCompatibleDC
 0046953F    mov         dword ptr [ebp-0C],eax
 00469542    xor         eax,eax
 00469544    push        ebp
 00469545    push        4695B5
 0046954A    push        dword ptr fs:[eax]
 0046954D    mov         dword ptr fs:[eax],esp
 00469550    test        edi,edi
>00469552    je          0046956C
 00469554    push        0
 00469556    push        edi
 00469557    mov         eax,dword ptr [ebp-0C]
 0046955A    push        eax
 0046955B    call        gdi32.SelectPalette
 00469560    mov         dword ptr [ebp-8],eax
 00469563    mov         eax,dword ptr [ebp-0C]
 00469566    push        eax
 00469567    call        gdi32.RealizePalette
 0046956C    push        0
 0046956E    push        ebx
 0046956F    mov         eax,dword ptr [ebp+0C]
 00469572    push        eax
 00469573    mov         eax,dword ptr [ebx+8]
 00469576    push        eax
 00469577    push        0
 00469579    push        esi
 0046957A    mov         eax,dword ptr [ebp-0C]
 0046957D    push        eax
 0046957E    call        gdi32.GetDIBits
 00469583    test        eax,eax
 00469585    setne       byte ptr [ebp-1]
 00469589    xor         eax,eax
 0046958B    pop         edx
 0046958C    pop         ecx
 0046958D    pop         ecx
 0046958E    mov         dword ptr fs:[eax],edx
 00469591    push        4695BC
 00469596    cmp         dword ptr [ebp-8],0
>0046959A    je          004695AB
 0046959C    push        0
 0046959E    mov         eax,dword ptr [ebp-8]
 004695A1    push        eax
 004695A2    mov         eax,dword ptr [ebp-0C]
 004695A5    push        eax
 004695A6    call        gdi32.SelectPalette
 004695AB    mov         eax,dword ptr [ebp-0C]
 004695AE    push        eax
 004695AF    call        gdi32.DeleteDC
 004695B4    ret
>004695B5    jmp         @HandleFinally
>004695BA    jmp         00469596
 004695BC    movzx       eax,byte ptr [ebp-1]
 004695C0    pop         edi
 004695C1    pop         esi
 004695C2    pop         ebx
 004695C3    mov         esp,ebp
 004695C5    pop         ebp
 004695C6    ret         8
*}
end;

//004695CC
function GetDIB(Bitmap:HBITMAP; Palette:HPALETTE; var BitmapInfo:void ; var Bits:void ):Boolean;
begin
{*
 004695CC    push        ebp
 004695CD    mov         ebp,esp
 004695CF    push        ebx
 004695D0    mov         ebx,dword ptr [ebp+8]
 004695D3    push        ebx
 004695D4    push        0
 004695D6    call        InternalGetDIB
 004695DB    pop         ebx
 004695DC    pop         ebp
 004695DD    ret         4
*}
end;

//004695E0
procedure WinError;
begin
{*
 004695E0    ret
*}
end;

//004695E4
procedure CheckBool(Result:BOOL);
begin
{*
 004695E4    test        eax,eax
>004695E6    jne         004695ED
 004695E8    call        WinError
 004695ED    ret
*}
end;

//004695F0
procedure WriteIcon(Stream:TStream; Icon:HICON; WriteLength:Boolean);
begin
{*
 004695F0    push        ebp
 004695F1    mov         ebp,esp
 004695F3    add         esp,0FFFFFFAC
 004695F6    push        ebx
 004695F7    push        esi
 004695F8    push        edi
 004695F9    mov         byte ptr [ebp-1],cl
 004695FC    mov         esi,edx
 004695FE    mov         ebx,eax
 00469600    lea         eax,[ebp-2A]
 00469603    xor         ecx,ecx
 00469605    mov         edx,6
 0046960A    call        @FillChar
 0046960F    lea         eax,[ebp-54]
 00469612    xor         ecx,ecx
 00469614    mov         edx,10
 00469619    call        @FillChar
 0046961E    lea         eax,[ebp-44]
 00469621    push        eax
 00469622    push        esi
 00469623    call        user32.GetIconInfo
 00469628    call        CheckBool
 0046962D    xor         edx,edx
 0046962F    push        ebp
 00469630    push        4697E0
 00469635    push        dword ptr fs:[edx]
 00469638    mov         dword ptr fs:[edx],esp
 0046963B    push        2
 0046963D    lea         ecx,[ebp-10]
 00469640    lea         edx,[ebp-8]
 00469643    mov         eax,dword ptr [ebp-38]
 00469646    call        InternalGetDIBSizes
 0046964B    push        0FF
 0046964D    lea         ecx,[ebp-14]
 00469650    lea         edx,[ebp-0C]
 00469653    mov         eax,dword ptr [ebp-34]
 00469656    call        InternalGetDIBSizes
 0046965B    xor         eax,eax
 0046965D    mov         dword ptr [ebp-18],eax
 00469660    xor         eax,eax
 00469662    mov         dword ptr [ebp-1C],eax
 00469665    xor         eax,eax
 00469667    mov         dword ptr [ebp-20],eax
 0046966A    xor         eax,eax
 0046966C    mov         dword ptr [ebp-24],eax
 0046966F    xor         edx,edx
 00469671    push        ebp
 00469672    push        4697B9
 00469677    push        dword ptr fs:[edx]
 0046967A    mov         dword ptr fs:[edx],esp
 0046967D    mov         eax,dword ptr [ebp-8]
 00469680    call        AllocMem
 00469685    mov         dword ptr [ebp-18],eax
 00469688    mov         eax,dword ptr [ebp-10]
 0046968B    call        AllocMem
 00469690    mov         dword ptr [ebp-1C],eax
 00469693    mov         eax,dword ptr [ebp-0C]
 00469696    call        AllocMem
 0046969B    mov         dword ptr [ebp-20],eax
 0046969E    mov         eax,dword ptr [ebp-14]
 004696A1    call        AllocMem
 004696A6    mov         dword ptr [ebp-24],eax
 004696A9    mov         eax,dword ptr [ebp-1C]
 004696AC    push        eax
 004696AD    push        2
 004696AF    mov         ecx,dword ptr [ebp-18]
 004696B2    xor         edx,edx
 004696B4    mov         eax,dword ptr [ebp-38]
 004696B7    call        InternalGetDIB
 004696BC    mov         eax,dword ptr [ebp-24]
 004696BF    push        eax
 004696C0    push        0FF
 004696C2    mov         ecx,dword ptr [ebp-20]
 004696C5    xor         edx,edx
 004696C7    mov         eax,dword ptr [ebp-34]
 004696CA    call        InternalGetDIB
 004696CF    cmp         byte ptr [ebp-1],0
>004696D3    je          004696F3
 004696D5    mov         eax,dword ptr [ebp-0C]
 004696D8    add         eax,16
 004696DB    add         eax,dword ptr [ebp-14]
 004696DE    add         eax,dword ptr [ebp-10]
 004696E1    mov         dword ptr [ebp-30],eax
 004696E4    lea         edx,[ebp-30]
 004696E7    mov         ecx,4
 004696EC    mov         eax,ebx
 004696EE    mov         esi,dword ptr [eax]
 004696F0    call        dword ptr [esi+10]
 004696F3    mov         word ptr [ebp-28],1
 004696F9    mov         word ptr [ebp-26],1
 004696FF    lea         edx,[ebp-2A]
 00469702    mov         ecx,6
 00469707    mov         eax,ebx
 00469709    mov         esi,dword ptr [eax]
 0046970B    call        dword ptr [esi+10]
 0046970E    mov         esi,dword ptr [ebp-20]
 00469711    mov         eax,esi
 00469713    movzx       edx,byte ptr [eax+4]
 00469717    mov         byte ptr [ebp-54],dl
 0046971A    movzx       edx,byte ptr [eax+8]
 0046971E    mov         byte ptr [ebp-53],dl
 00469721    movzx       edx,word ptr [eax+0C]
 00469725    imul        dx,word ptr [eax+0E]
 0046972A    mov         word ptr [ebp-52],dx
 0046972E    mov         eax,dword ptr [ebp-0C]
 00469731    add         eax,dword ptr [ebp-14]
 00469734    add         eax,dword ptr [ebp-10]
 00469737    mov         dword ptr [ebp-4C],eax
 0046973A    mov         dword ptr [ebp-48],16
 00469741    lea         edx,[ebp-54]
 00469744    mov         ecx,10
 00469749    mov         eax,ebx
 0046974B    mov         edi,dword ptr [eax]
 0046974D    call        dword ptr [edi+10]
 00469750    mov         eax,esi
 00469752    mov         edx,dword ptr [eax+8]
 00469755    add         dword ptr [eax+8],edx
 00469758    mov         edx,dword ptr [ebp-20]
 0046975B    mov         ecx,dword ptr [ebp-0C]
 0046975E    mov         eax,ebx
 00469760    mov         esi,dword ptr [eax]
 00469762    call        dword ptr [esi+10]
 00469765    mov         edx,dword ptr [ebp-24]
 00469768    mov         ecx,dword ptr [ebp-14]
 0046976B    mov         eax,ebx
 0046976D    mov         esi,dword ptr [eax]
 0046976F    call        dword ptr [esi+10]
 00469772    mov         edx,dword ptr [ebp-1C]
 00469775    mov         ecx,dword ptr [ebp-10]
 00469778    mov         eax,ebx
 0046977A    mov         ebx,dword ptr [eax]
 0046977C    call        dword ptr [ebx+10]
 0046977F    xor         eax,eax
 00469781    pop         edx
 00469782    pop         ecx
 00469783    pop         ecx
 00469784    mov         dword ptr fs:[eax],edx
 00469787    push        4697C0
 0046978C    mov         edx,dword ptr [ebp-0C]
 0046978F    mov         eax,dword ptr [ebp-20]
 00469792    call        @FreeMem
 00469797    mov         edx,dword ptr [ebp-14]
 0046979A    mov         eax,dword ptr [ebp-24]
 0046979D    call        @FreeMem
 004697A2    mov         edx,dword ptr [ebp-8]
 004697A5    mov         eax,dword ptr [ebp-18]
 004697A8    call        @FreeMem
 004697AD    mov         edx,dword ptr [ebp-10]
 004697B0    mov         eax,dword ptr [ebp-1C]
 004697B3    call        @FreeMem
 004697B8    ret
>004697B9    jmp         @HandleFinally
>004697BE    jmp         0046978C
 004697C0    xor         eax,eax
 004697C2    pop         edx
 004697C3    pop         ecx
 004697C4    pop         ecx
 004697C5    mov         dword ptr fs:[eax],edx
 004697C8    push        4697E7
 004697CD    mov         eax,dword ptr [ebp-34]
 004697D0    push        eax
 004697D1    call        gdi32.DeleteObject
 004697D6    mov         eax,dword ptr [ebp-38]
 004697D9    push        eax
 004697DA    call        gdi32.DeleteObject
 004697DF    ret
>004697E0    jmp         @HandleFinally
>004697E5    jmp         004697CD
 004697E7    pop         edi
 004697E8    pop         esi
 004697E9    pop         ebx
 004697EA    mov         esp,ebp
 004697EC    pop         ebp
 004697ED    ret
*}
end;

//004697F0
constructor TGraphic.Create();
begin
{*
 004697F0    push        ebx
 004697F1    push        esi
 004697F2    test        dl,dl
>004697F4    je          004697FE
 004697F6    add         esp,0FFFFFFF0
 004697F9    call        @ClassCreate
 004697FE    mov         ebx,edx
 00469800    mov         esi,eax
 00469802    xor         edx,edx
 00469804    mov         eax,esi
 00469806    call        TObject.Create
 0046980B    mov         eax,esi
 0046980D    test        bl,bl
>0046980F    je          00469820
 00469811    call        @AfterConstruction
 00469816    pop         dword ptr fs:[0]
 0046981D    add         esp,0C
 00469820    mov         eax,esi
 00469822    pop         esi
 00469823    pop         ebx
 00469824    ret
*}
end;

//00469828
procedure TGraphic.Changed(Sender:TObject);
begin
{*
 00469828    push        ebx
 00469829    mov         byte ptr [eax+20],1
 0046982D    cmp         word ptr [eax+12],0
>00469832    je          0046983E
 00469834    mov         ebx,eax
 00469836    mov         edx,eax
 00469838    mov         eax,dword ptr [ebx+14]
 0046983B    call        dword ptr [ebx+10]
 0046983E    pop         ebx
 0046983F    ret
*}
end;

//00469840
function DoWrite:Boolean;
begin
{*
 00469840    push        ebp
 00469841    mov         ebp,esp
 00469843    push        ebx
 00469844    mov         eax,dword ptr [ebp+8]
 00469847    mov         eax,dword ptr [eax-4]
 0046984A    cmp         dword ptr [eax+20],0
>0046984E    je          00469887
 00469850    mov         eax,dword ptr [ebp+8]
 00469853    mov         eax,dword ptr [eax-4]
 00469856    mov         ebx,dword ptr [eax+20]
 00469859    mov         eax,ebx
 0046985B    mov         edx,dword ptr ds:[462108];TGraphic
 00469861    call        @IsClass
 00469866    test        al,al
>00469868    je          00469882
 0046986A    mov         eax,dword ptr [ebp+8]
 0046986D    mov         edx,ebx
 0046986F    mov         eax,dword ptr [ebp+8]
 00469872    mov         eax,dword ptr [eax-8]
 00469875    mov         ecx,dword ptr [eax]
 00469877    call        dword ptr [ecx+1C]
 0046987A    test        al,al
>0046987C    je          00469882
 0046987E    xor         eax,eax
>00469880    jmp         00469894
 00469882    mov         al,1
 00469884    pop         ebx
 00469885    pop         ebp
 00469886    ret
 00469887    mov         eax,dword ptr [ebp+8]
 0046988A    mov         eax,dword ptr [eax-8]
 0046988D    mov         edx,dword ptr [eax]
 0046988F    call        dword ptr [edx+20]
 00469892    xor         al,1
 00469894    pop         ebx
 00469895    pop         ebp
 00469896    ret
*}
end;

//00469898
procedure TGraphic.DefineProperties(Filer:TFiler);
begin
{*
 00469898    push        ebp
 00469899    mov         ebp,esp
 0046989B    add         esp,0FFFFFFF8
 0046989E    push        ebx
 0046989F    mov         dword ptr [ebp-4],edx
 004698A2    mov         dword ptr [ebp-8],eax
 004698A5    mov         eax,dword ptr [ebp-8]
 004698A8    push        eax
 004698A9    mov         eax,dword ptr [eax]
 004698AB    mov         eax,dword ptr [eax+34]
 004698AE    push        eax
 004698AF    mov         eax,dword ptr [ebp-8]
 004698B2    push        eax
 004698B3    mov         eax,dword ptr [eax]
 004698B5    mov         eax,dword ptr [eax+48]
 004698B8    push        eax
 004698B9    push        ebp
 004698BA    call        DoWrite
 004698BF    pop         ecx
 004698C0    mov         ecx,eax
 004698C2    mov         edx,4698E0;'Data'
 004698C7    mov         eax,dword ptr [ebp-4]
 004698CA    mov         ebx,dword ptr [eax]
 004698CC    call        dword ptr [ebx+8]
 004698CF    pop         ebx
 004698D0    pop         ecx
 004698D1    pop         ecx
 004698D2    pop         ebp
 004698D3    ret
*}
end;

//004698EC
procedure TGraphic.DrawTransparent(ACanvas:TCanvas; const Rect:TRect; Opacity:Byte);
begin
{*
 004698EC    push        ebp
 004698ED    mov         ebp,esp
 004698EF    push        ebx
 004698F0    push        esi
 004698F1    mov         esi,eax
 004698F3    mov         eax,esi
 004698F5    mov         ebx,dword ptr [eax]
 004698F7    call        dword ptr [ebx+14]
 004698FA    pop         esi
 004698FB    pop         ebx
 004698FC    pop         ebp
 004698FD    ret         4
*}
end;

//00469900
function TGraphic.Equals(Graphic:TGraphic):Boolean;
begin
{*
 00469900    push        ebp
 00469901    mov         ebp,esp
 00469903    add         esp,0FFFFFFF4
 00469906    push        ebx
 00469907    push        esi
 00469908    mov         esi,edx
 0046990A    mov         ebx,eax
 0046990C    test        esi,esi
>0046990E    je          0046991F
 00469910    mov         edx,dword ptr [ebx]
 00469912    mov         eax,edx
 00469914    mov         ecx,dword ptr [esi]
 00469916    mov         edx,ecx
 00469918    cmp         edx,eax
 0046991A    sete        al
>0046991D    jmp         00469921
 0046991F    xor         eax,eax
 00469921    mov         byte ptr [ebp-1],al
 00469924    mov         eax,ebx
 00469926    mov         edx,dword ptr [eax]
 00469928    call        dword ptr [edx+20]
 0046992B    test        al,al
>0046992D    jne         0046993A
 0046992F    mov         eax,esi
 00469931    mov         edx,dword ptr [eax]
 00469933    call        dword ptr [edx+20]
 00469936    test        al,al
>00469938    je          0046995E
 0046993A    mov         eax,ebx
 0046993C    mov         edx,dword ptr [eax]
 0046993E    call        dword ptr [edx+20]
 00469941    test        al,al
>00469943    je          00469950
 00469945    mov         eax,esi
 00469947    mov         edx,dword ptr [eax]
 00469949    call        dword ptr [edx+20]
 0046994C    test        al,al
>0046994E    jne         00469954
 00469950    xor         eax,eax
>00469952    jmp         00469956
 00469954    mov         al,1
 00469956    mov         byte ptr [ebp-1],al
>00469959    jmp         00469A34
 0046995E    cmp         byte ptr [ebp-1],0
>00469962    je          00469A34
 00469968    mov         dl,1
 0046996A    mov         eax,[0043DAFC];TMemoryStream
 0046996F    call        TObject.Create
 00469974    mov         dword ptr [ebp-8],eax
 00469977    xor         eax,eax
 00469979    push        ebp
 0046997A    push        469A2D
 0046997F    push        dword ptr fs:[eax]
 00469982    mov         dword ptr fs:[eax],esp
 00469985    mov         edx,dword ptr [ebp-8]
 00469988    mov         eax,ebx
 0046998A    mov         ecx,dword ptr [eax]
 0046998C    call        dword ptr [ecx+48]
 0046998F    mov         dl,1
 00469991    mov         eax,[0043DAFC];TMemoryStream
 00469996    call        TObject.Create
 0046999B    mov         dword ptr [ebp-0C],eax
 0046999E    xor         eax,eax
 004699A0    push        ebp
 004699A1    push        469A10
 004699A6    push        dword ptr fs:[eax]
 004699A9    mov         dword ptr fs:[eax],esp
 004699AC    mov         edx,dword ptr [ebp-0C]
 004699AF    mov         eax,esi
 004699B1    mov         ecx,dword ptr [eax]
 004699B3    call        dword ptr [ecx+48]
 004699B6    mov         eax,dword ptr [ebp-8]
 004699B9    mov         edx,dword ptr [eax]
 004699BB    call        dword ptr [edx]
 004699BD    push        edx
 004699BE    push        eax
 004699BF    mov         eax,dword ptr [ebp-0C]
 004699C2    mov         edx,dword ptr [eax]
 004699C4    call        dword ptr [edx]
 004699C6    cmp         edx,dword ptr [esp+4]
>004699CA    jne         004699CF
 004699CC    cmp         eax,dword ptr [esp]
 004699CF    pop         edx
 004699D0    pop         eax
>004699D1    jne         004699F1
 004699D3    mov         eax,dword ptr [ebp-8]
 004699D6    mov         edx,dword ptr [eax]
 004699D8    call        dword ptr [edx]
 004699DA    mov         ecx,eax
 004699DC    mov         eax,dword ptr [ebp-0C]
 004699DF    mov         edx,dword ptr [eax+4]
 004699E2    mov         eax,dword ptr [ebp-8]
 004699E5    mov         eax,dword ptr [eax+4]
 004699E8    call        CompareMem
 004699ED    test        al,al
>004699EF    jne         004699F5
 004699F1    xor         eax,eax
>004699F3    jmp         004699F7
 004699F5    mov         al,1
 004699F7    mov         byte ptr [ebp-1],al
 004699FA    xor         eax,eax
 004699FC    pop         edx
 004699FD    pop         ecx
 004699FE    pop         ecx
 004699FF    mov         dword ptr fs:[eax],edx
 00469A02    push        469A17
 00469A07    mov         eax,dword ptr [ebp-0C]
 00469A0A    call        TObject.Free
 00469A0F    ret
>00469A10    jmp         @HandleFinally
>00469A15    jmp         00469A07
 00469A17    xor         eax,eax
 00469A19    pop         edx
 00469A1A    pop         ecx
 00469A1B    pop         ecx
 00469A1C    mov         dword ptr fs:[eax],edx
 00469A1F    push        469A34
 00469A24    mov         eax,dword ptr [ebp-8]
 00469A27    call        TObject.Free
 00469A2C    ret
>00469A2D    jmp         @HandleFinally
>00469A32    jmp         00469A24
 00469A34    movzx       eax,byte ptr [ebp-1]
 00469A38    pop         esi
 00469A39    pop         ebx
 00469A3A    mov         esp,ebp
 00469A3C    pop         ebp
 00469A3D    ret
*}
end;

//00469A40
function TGraphic.Equals(Obj:TObject):Boolean;
begin
{*
 00469A40    push        ebx
 00469A41    push        esi
 00469A42    mov         esi,edx
 00469A44    mov         ebx,eax
 00469A46    mov         eax,esi
 00469A48    mov         edx,dword ptr ds:[462108];TGraphic
 00469A4E    call        @IsClass
 00469A53    test        al,al
>00469A55    je          00469A63
 00469A57    mov         edx,esi
 00469A59    mov         eax,ebx
 00469A5B    mov         ecx,dword ptr [eax]
 00469A5D    call        dword ptr [ecx+1C]
 00469A60    pop         esi
 00469A61    pop         ebx
 00469A62    ret
 00469A63    mov         edx,esi
 00469A65    mov         eax,ebx
 00469A67    call        TObject.Equals
 00469A6C    pop         esi
 00469A6D    pop         ebx
 00469A6E    ret
*}
end;

//00469A70
{*function sub_00469A70:?;
begin
 00469A70    xor         eax,eax
 00469A72    ret
end;*}

//00469A74
{*function sub_00469A74:?;
begin
 00469A74    xor         eax,eax
 00469A76    ret
end;*}

//00469A78
{*function sub_00469A78:?;
begin
 00469A78    movzx       eax,byte ptr [eax+21];TGraphic.FTransparent:Boolean
 00469A7C    ret
end;*}

//00469A80
procedure TGraphic.LoadFromFile(Filename:string);
begin
{*
 00469A80    push        ebp
 00469A81    mov         ebp,esp
 00469A83    push        ecx
 00469A84    push        esi
 00469A85    mov         esi,eax
 00469A87    push        20
 00469A89    mov         ecx,edx
 00469A8B    mov         eax,[0043D6D0];TFileStream
 00469A90    mov         dl,1
 00469A92    call        TFileStream.Create
 00469A97    mov         dword ptr [ebp-4],eax
 00469A9A    xor         eax,eax
 00469A9C    push        ebp
 00469A9D    push        469AC8
 00469AA2    push        dword ptr fs:[eax]
 00469AA5    mov         dword ptr fs:[eax],esp
 00469AA8    mov         edx,dword ptr [ebp-4]
 00469AAB    mov         eax,esi
 00469AAD    mov         ecx,dword ptr [eax]
 00469AAF    call        dword ptr [ecx+5C]
 00469AB2    xor         eax,eax
 00469AB4    pop         edx
 00469AB5    pop         ecx
 00469AB6    pop         ecx
 00469AB7    mov         dword ptr fs:[eax],edx
 00469ABA    push        469ACF
 00469ABF    mov         eax,dword ptr [ebp-4]
 00469AC2    call        TObject.Free
 00469AC7    ret
>00469AC8    jmp         @HandleFinally
>00469ACD    jmp         00469ABF
 00469ACF    pop         esi
 00469AD0    pop         ecx
 00469AD1    pop         ebp
 00469AD2    ret
*}
end;

//00469AD4
procedure TGraphic.Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:UnicodeString);
begin
{*
 00469AD4    push        ebp
 00469AD5    mov         ebp,esp
 00469AD7    push        ebx
 00469AD8    cmp         word ptr [eax+1A],0
>00469ADD    je          00469AF9
 00469ADF    movzx       ebx,byte ptr [ebp+14]
 00469AE3    push        ebx
 00469AE4    movzx       ebx,byte ptr [ebp+10]
 00469AE8    push        ebx
 00469AE9    mov         ebx,dword ptr [ebp+0C]
 00469AEC    push        ebx
 00469AED    mov         ebx,dword ptr [ebp+8]
 00469AF0    push        ebx
 00469AF1    mov         ebx,eax
 00469AF3    mov         eax,dword ptr [ebx+1C]
 00469AF6    call        dword ptr [ebx+18]
 00469AF9    pop         ebx
 00469AFA    pop         ebp
 00469AFB    ret         10
*}
end;

//00469B00
procedure TGraphic.ReadData(Stream:TStream);
begin
{*
 00469B00    push        esi
 00469B01    mov         esi,eax
 00469B03    mov         eax,esi
 00469B05    mov         ecx,dword ptr [eax]
 00469B07    call        dword ptr [ecx+5C]
 00469B0A    pop         esi
 00469B0B    ret
*}
end;

//00469B0C
procedure TGraphic.SaveToFile(Filename:string);
begin
{*
 00469B0C    push        ebp
 00469B0D    mov         ebp,esp
 00469B0F    push        ecx
 00469B10    push        esi
 00469B11    mov         esi,eax
 00469B13    push        0FF00
 00469B18    mov         ecx,edx
 00469B1A    mov         eax,[0043D6D0];TFileStream
 00469B1F    mov         dl,1
 00469B21    call        TFileStream.Create
 00469B26    mov         dword ptr [ebp-4],eax
 00469B29    xor         eax,eax
 00469B2B    push        ebp
 00469B2C    push        469B57
 00469B31    push        dword ptr fs:[eax]
 00469B34    mov         dword ptr fs:[eax],esp
 00469B37    mov         edx,dword ptr [ebp-4]
 00469B3A    mov         eax,esi
 00469B3C    mov         ecx,dword ptr [eax]
 00469B3E    call        dword ptr [ecx+60]
 00469B41    xor         eax,eax
 00469B43    pop         edx
 00469B44    pop         ecx
 00469B45    pop         ecx
 00469B46    mov         dword ptr fs:[eax],edx
 00469B49    push        469B5E
 00469B4E    mov         eax,dword ptr [ebp-4]
 00469B51    call        TObject.Free
 00469B56    ret
>00469B57    jmp         @HandleFinally
>00469B5C    jmp         00469B4E
 00469B5E    pop         esi
 00469B5F    pop         ecx
 00469B60    pop         ebp
 00469B61    ret
*}
end;

//00469B64
procedure sub_00469B64;
begin
{*
 00469B64    ret
*}
end;

//00469B68
procedure TGraphic.SetModified(Value:Boolean);
begin
{*
 00469B68    test        dl,dl
>00469B6A    je          00469B74
 00469B6C    mov         edx,eax
 00469B6E    mov         ecx,dword ptr [eax]
 00469B70    call        dword ptr [ecx+10]
 00469B73    ret
 00469B74    mov         byte ptr [eax+20],0
 00469B78    ret
*}
end;

//00469B7C
procedure TGraphic.SetSize(AWidth:Integer; AHeight:Integer);
begin
{*
 00469B7C    push        ebx
 00469B7D    push        esi
 00469B7E    mov         esi,ecx
 00469B80    mov         ebx,eax
 00469B82    mov         eax,ebx
 00469B84    mov         ecx,dword ptr [eax]
 00469B86    call        dword ptr [ecx+44]
 00469B89    mov         edx,esi
 00469B8B    mov         eax,ebx
 00469B8D    mov         ecx,dword ptr [eax]
 00469B8F    call        dword ptr [ecx+38]
 00469B92    pop         esi
 00469B93    pop         ebx
 00469B94    ret
*}
end;

//00469B98
procedure TGraphic.SetTransparent(Value:Boolean);
begin
{*
 00469B98    cmp         dl,byte ptr [eax+21]
>00469B9B    je          00469BA7
 00469B9D    mov         byte ptr [eax+21],dl
 00469BA0    mov         edx,eax
 00469BA2    mov         ecx,dword ptr [eax]
 00469BA4    call        dword ptr [ecx+10]
 00469BA7    ret
*}
end;

//00469BA8
procedure TGraphic.WriteData(Stream:TStream);
begin
{*
 00469BA8    push        esi
 00469BA9    mov         esi,eax
 00469BAB    mov         eax,esi
 00469BAD    mov         ecx,dword ptr [eax]
 00469BAF    call        dword ptr [ecx+60]
 00469BB2    pop         esi
 00469BB3    ret
*}
end;

//00469EEC
constructor TFileFormatsList.Create();
begin
{*
 00469EEC    push        ebp
 00469EED    mov         ebp,esp
 00469EEF    xor         ecx,ecx
 00469EF1    push        ecx
 00469EF2    push        ecx
 00469EF3    push        ecx
 00469EF4    push        ecx
 00469EF5    push        ecx
 00469EF6    push        ecx
 00469EF7    push        ebx
 00469EF8    push        esi
 00469EF9    test        dl,dl
>00469EFB    je          00469F05
 00469EFD    add         esp,0FFFFFFF0
 00469F00    call        @ClassCreate
 00469F05    mov         ebx,edx
 00469F07    mov         esi,eax
 00469F09    xor         eax,eax
 00469F0B    push        ebp
 00469F0C    push        46A013
 00469F11    push        dword ptr fs:[eax]
 00469F14    mov         dword ptr fs:[eax],esp
 00469F17    xor         edx,edx
 00469F19    mov         eax,esi
 00469F1B    call        TObject.Create
 00469F20    push        0
 00469F22    mov         eax,[004632EC];TMetafile
 00469F27    push        eax
 00469F28    lea         edx,[ebp-4]
 00469F2B    mov         eax,[0078D3B8];^SResString232:TResStringRec
 00469F30    call        LoadResString
 00469F35    mov         ecx,dword ptr [ebp-4]
 00469F38    mov         edx,46A044;'wmf'
 00469F3D    mov         eax,esi
 00469F3F    call        TFileFormatsList.Add
 00469F44    push        0
 00469F46    mov         eax,[004632EC];TMetafile
 00469F4B    push        eax
 00469F4C    lea         edx,[ebp-8]
 00469F4F    mov         eax,[0078CDA0];^SResString233:TResStringRec
 00469F54    call        LoadResString
 00469F59    mov         ecx,dword ptr [ebp-8]
 00469F5C    mov         edx,46A058;'emf'
 00469F61    mov         eax,esi
 00469F63    call        TFileFormatsList.Add
 00469F68    push        0
 00469F6A    mov         eax,[00464454];TIcon
 00469F6F    push        eax
 00469F70    lea         edx,[ebp-0C]
 00469F73    mov         eax,[0078CD9C];^SResString234:TResStringRec
 00469F78    call        LoadResString
 00469F7D    mov         ecx,dword ptr [ebp-0C]
 00469F80    mov         edx,46A06C;'ico'
 00469F85    mov         eax,esi
 00469F87    call        TFileFormatsList.Add
 00469F8C    push        0
 00469F8E    mov         eax,[004649C8];TWICImage
 00469F93    push        eax
 00469F94    lea         edx,[ebp-10]
 00469F97    mov         eax,[0078D87C];^SResString236:TResStringRec
 00469F9C    call        LoadResString
 00469FA1    mov         ecx,dword ptr [ebp-10]
 00469FA4    mov         edx,46A080;'tiff'
 00469FA9    mov         eax,esi
 00469FAB    call        TFileFormatsList.Add
 00469FB0    push        0
 00469FB2    mov         eax,[004649C8];TWICImage
 00469FB7    push        eax
 00469FB8    lea         edx,[ebp-14]
 00469FBB    mov         eax,[0078D87C];^SResString236:TResStringRec
 00469FC0    call        LoadResString
 00469FC5    mov         ecx,dword ptr [ebp-14]
 00469FC8    mov         edx,46A098;'tif'
 00469FCD    mov         eax,esi
 00469FCF    call        TFileFormatsList.Add
 00469FD4    push        0
 00469FD6    mov         eax,[00463B28];TBitmap
 00469FDB    push        eax
 00469FDC    lea         edx,[ebp-18]
 00469FDF    mov         eax,[0078CD88];^SResString235:TResStringRec
 00469FE4    call        LoadResString
 00469FE9    mov         ecx,dword ptr [ebp-18]
 00469FEC    mov         edx,46A0AC;'bmp'
 00469FF1    mov         eax,esi
 00469FF3    call        TFileFormatsList.Add
 00469FF8    xor         eax,eax
 00469FFA    pop         edx
 00469FFB    pop         ecx
 00469FFC    pop         ecx
 00469FFD    mov         dword ptr fs:[eax],edx
 0046A000    push        46A01A
 0046A005    lea         eax,[ebp-18]
 0046A008    mov         edx,6
 0046A00D    call        @UStrArrayClr
 0046A012    ret
>0046A013    jmp         @HandleFinally
>0046A018    jmp         0046A005
 0046A01A    mov         eax,esi
 0046A01C    test        bl,bl
>0046A01E    je          0046A02F
 0046A020    call        @AfterConstruction
 0046A025    pop         dword ptr fs:[0]
 0046A02C    add         esp,0C
 0046A02F    mov         eax,esi
 0046A031    pop         esi
 0046A032    pop         ebx
 0046A033    mov         esp,ebp
 0046A035    pop         ebp
 0046A036    ret
*}
end;

//0046A0B4
destructor TFileFormatsList.Destroy();
begin
{*
 0046A0B4    push        ebx
 0046A0B5    push        esi
 0046A0B6    push        edi
 0046A0B7    push        ebp
 0046A0B8    call        @BeforeDestruction
 0046A0BD    mov         ebx,edx
 0046A0BF    mov         edi,eax
 0046A0C1    mov         ebp,dword ptr [edi+8]
 0046A0C4    dec         ebp
 0046A0C5    test        ebp,ebp
>0046A0C7    jl          0046A0E4
 0046A0C9    inc         ebp
 0046A0CA    xor         esi,esi
 0046A0CC    mov         edx,esi
 0046A0CE    mov         eax,edi
 0046A0D0    call        TList.Get
 0046A0D5    mov         edx,dword ptr ds:[469BB4];TFileFormat
 0046A0DB    call        @Dispose
 0046A0E0    inc         esi
 0046A0E1    dec         ebp
>0046A0E2    jne         0046A0CC
 0046A0E4    mov         edx,ebx
 0046A0E6    and         dl,0FC
 0046A0E9    mov         eax,edi
 0046A0EB    call        TList.Destroy
 0046A0F0    test        bl,bl
>0046A0F2    jle         0046A0FB
 0046A0F4    mov         eax,edi
 0046A0F6    call        @ClassDestroy
 0046A0FB    pop         ebp
 0046A0FC    pop         edi
 0046A0FD    pop         esi
 0046A0FE    pop         ebx
 0046A0FF    ret
*}
end;

//0046A100
procedure TFileFormatsList.Add(Ext:string; Desc:string; AClass:TGraphicClass; DescID:Integer);
begin
{*
 0046A100    push        ebp
 0046A101    mov         ebp,esp
 0046A103    add         esp,0FFFFFFF4
 0046A106    push        ebx
 0046A107    push        esi
 0046A108    push        edi
 0046A109    xor         ebx,ebx
 0046A10B    mov         dword ptr [ebp-0C],ebx
 0046A10E    mov         dword ptr [ebp-8],ecx
 0046A111    mov         dword ptr [ebp-4],edx
 0046A114    mov         edi,eax
 0046A116    xor         eax,eax
 0046A118    push        ebp
 0046A119    push        46A183
 0046A11E    push        dword ptr fs:[eax]
 0046A121    mov         dword ptr fs:[eax],esp
 0046A124    mov         edx,dword ptr ds:[469BB4];TFileFormat
 0046A12A    mov         eax,10
 0046A12F    call        @New
 0046A134    mov         esi,eax
 0046A136    mov         ebx,esi
 0046A138    lea         edx,[ebp-0C]
 0046A13B    mov         eax,dword ptr [ebp-4]
 0046A13E    call        AnsiLowerCase
 0046A143    mov         edx,dword ptr [ebp-0C]
 0046A146    lea         eax,[ebx+4]
 0046A149    call        @UStrAsg
 0046A14E    mov         eax,dword ptr [ebp+8]
 0046A151    mov         dword ptr [ebx],eax
 0046A153    lea         eax,[ebx+8]
 0046A156    mov         edx,dword ptr [ebp-8]
 0046A159    call        @UStrAsg
 0046A15E    mov         eax,dword ptr [ebp+0C]
 0046A161    mov         dword ptr [ebx+0C],eax
 0046A164    mov         edx,esi
 0046A166    mov         eax,edi
 0046A168    call        TList.Add
 0046A16D    xor         eax,eax
 0046A16F    pop         edx
 0046A170    pop         ecx
 0046A171    pop         ecx
 0046A172    mov         dword ptr fs:[eax],edx
 0046A175    push        46A18A
 0046A17A    lea         eax,[ebp-0C]
 0046A17D    call        @UStrClr
 0046A182    ret
>0046A183    jmp         @HandleFinally
>0046A188    jmp         0046A17A
 0046A18A    pop         edi
 0046A18B    pop         esi
 0046A18C    pop         ebx
 0046A18D    mov         esp,ebp
 0046A18F    pop         ebp
 0046A190    ret         8
*}
end;

//0046A194
function TFileFormatsList.FindExt(Ext:string):TGraphicClass;
begin
{*
 0046A194    push        ebp
 0046A195    mov         ebp,esp
 0046A197    add         esp,0FFFFFFF8
 0046A19A    push        ebx
 0046A19B    push        esi
 0046A19C    push        edi
 0046A19D    xor         ecx,ecx
 0046A19F    mov         dword ptr [ebp-8],ecx
 0046A1A2    mov         dword ptr [ebp-4],edx
 0046A1A5    mov         edi,eax
 0046A1A7    mov         eax,dword ptr [ebp-4]
 0046A1AA    call        @UStrAddRef
 0046A1AF    xor         eax,eax
 0046A1B1    push        ebp
 0046A1B2    push        46A21B
 0046A1B7    push        dword ptr fs:[eax]
 0046A1BA    mov         dword ptr fs:[eax],esp
 0046A1BD    lea         edx,[ebp-8]
 0046A1C0    mov         eax,dword ptr [ebp-4]
 0046A1C3    call        AnsiLowerCase
 0046A1C8    mov         edx,dword ptr [ebp-8]
 0046A1CB    lea         eax,[ebp-4]
 0046A1CE    call        @UStrLAsg
 0046A1D3    mov         ebx,dword ptr [edi+8]
 0046A1D6    dec         ebx
 0046A1D7    cmp         ebx,0
>0046A1DA    jl          0046A1FE
 0046A1DC    mov         edx,ebx
 0046A1DE    mov         eax,edi
 0046A1E0    call        TList.Get
 0046A1E5    mov         esi,eax
 0046A1E7    mov         eax,dword ptr [esi+4]
 0046A1EA    mov         edx,dword ptr [ebp-4]
 0046A1ED    call        @UStrEqual
>0046A1F2    jne         0046A1F8
 0046A1F4    mov         ebx,dword ptr [esi]
>0046A1F6    jmp         0046A200
 0046A1F8    dec         ebx
 0046A1F9    cmp         ebx,0FFFFFFFF
>0046A1FC    jne         0046A1DC
 0046A1FE    xor         ebx,ebx
 0046A200    xor         eax,eax
 0046A202    pop         edx
 0046A203    pop         ecx
 0046A204    pop         ecx
 0046A205    mov         dword ptr fs:[eax],edx
 0046A208    push        46A222
 0046A20D    lea         eax,[ebp-8]
 0046A210    mov         edx,2
 0046A215    call        @UStrArrayClr
 0046A21A    ret
>0046A21B    jmp         @HandleFinally
>0046A220    jmp         0046A20D
 0046A222    mov         eax,ebx
 0046A224    pop         edi
 0046A225    pop         esi
 0046A226    pop         ebx
 0046A227    pop         ecx
 0046A228    pop         ecx
 0046A229    pop         ebp
 0046A22A    ret
*}
end;

//0046A22C
function TFileFormatsList.FindClassName(Classname:string):TGraphicClass;
begin
{*
 0046A22C    push        ebp
 0046A22D    mov         ebp,esp
 0046A22F    add         esp,0FFFFFFF8
 0046A232    push        ebx
 0046A233    push        esi
 0046A234    push        edi
 0046A235    xor         ecx,ecx
 0046A237    mov         dword ptr [ebp-8],ecx
 0046A23A    mov         dword ptr [ebp-4],edx
 0046A23D    mov         edi,eax
 0046A23F    xor         eax,eax
 0046A241    push        ebp
 0046A242    push        46A296
 0046A247    push        dword ptr fs:[eax]
 0046A24A    mov         dword ptr fs:[eax],esp
 0046A24D    mov         ebx,dword ptr [edi+8]
 0046A250    dec         ebx
 0046A251    cmp         ebx,0
>0046A254    jl          0046A27E
 0046A256    mov         edx,ebx
 0046A258    mov         eax,edi
 0046A25A    call        TList.Get
 0046A25F    mov         esi,dword ptr [eax]
 0046A261    lea         edx,[ebp-8]
 0046A264    mov         eax,esi
 0046A266    call        TObject.ClassName
 0046A26B    mov         eax,dword ptr [ebp-8]
 0046A26E    mov         edx,dword ptr [ebp-4]
 0046A271    call        @UStrEqual
>0046A276    je          0046A280
 0046A278    dec         ebx
 0046A279    cmp         ebx,0FFFFFFFF
>0046A27C    jne         0046A256
 0046A27E    xor         esi,esi
 0046A280    xor         eax,eax
 0046A282    pop         edx
 0046A283    pop         ecx
 0046A284    pop         ecx
 0046A285    mov         dword ptr fs:[eax],edx
 0046A288    push        46A29D
 0046A28D    lea         eax,[ebp-8]
 0046A290    call        @UStrClr
 0046A295    ret
>0046A296    jmp         @HandleFinally
>0046A29B    jmp         0046A28D
 0046A29D    mov         eax,esi
 0046A29F    pop         edi
 0046A2A0    pop         esi
 0046A2A1    pop         ebx
 0046A2A2    pop         ecx
 0046A2A3    pop         ecx
 0046A2A4    pop         ebp
 0046A2A5    ret
*}
end;

//0046A2A8
procedure TFileFormatsList.Remove(AClass:TGraphicClass);
begin
{*
 0046A2A8    push        ebx
 0046A2A9    push        esi
 0046A2AA    push        edi
 0046A2AB    push        ebp
 0046A2AC    mov         ebp,edx
 0046A2AE    mov         edi,eax
 0046A2B0    mov         ebx,dword ptr [edi+8]
 0046A2B3    dec         ebx
 0046A2B4    cmp         ebx,0
>0046A2B7    jl          0046A2ED
 0046A2B9    mov         edx,ebx
 0046A2BB    mov         eax,edi
 0046A2BD    call        TList.Get
 0046A2C2    mov         esi,eax
 0046A2C4    mov         edx,ebp
 0046A2C6    mov         eax,dword ptr [esi]
 0046A2C8    call        TObject.InheritsFrom
 0046A2CD    test        al,al
>0046A2CF    je          0046A2E7
 0046A2D1    mov         edx,dword ptr ds:[469BB4];TFileFormat
 0046A2D7    mov         eax,esi
 0046A2D9    call        @Dispose
 0046A2DE    mov         edx,ebx
 0046A2E0    mov         eax,edi
 0046A2E2    call        TList.Delete
 0046A2E7    dec         ebx
 0046A2E8    cmp         ebx,0FFFFFFFF
>0046A2EB    jne         0046A2B9
 0046A2ED    pop         ebp
 0046A2EE    pop         edi
 0046A2EF    pop         esi
 0046A2F0    pop         ebx
 0046A2F1    ret
*}
end;

//0046A2F4
procedure TFileFormatsList.BuildFilterStrings(AGraphicClass:TGraphicClass; var Descriptions:string; var Filters:string);
begin
{*
 0046A2F4    push        ebp
 0046A2F5    mov         ebp,esp
 0046A2F7    add         esp,0FFFFFFB0
 0046A2FA    push        ebx
 0046A2FB    push        esi
 0046A2FC    xor         ebx,ebx
 0046A2FE    mov         dword ptr [ebp-50],ebx
 0046A301    mov         dword ptr [ebp-4C],ebx
 0046A304    mov         dword ptr [ebp-40],ebx
 0046A307    mov         dword ptr [ebp-44],ebx
 0046A30A    mov         dword ptr [ebp-48],ebx
 0046A30D    mov         dword ptr [ebp-34],ebx
 0046A310    mov         dword ptr [ebp-20],ebx
 0046A313    mov         dword ptr [ebp-1C],ebx
 0046A316    mov         dword ptr [ebp-0C],ecx
 0046A319    mov         dword ptr [ebp-8],edx
 0046A31C    mov         dword ptr [ebp-4],eax
 0046A31F    xor         eax,eax
 0046A321    push        ebp
 0046A322    push        46A516
 0046A327    push        dword ptr fs:[eax]
 0046A32A    mov         dword ptr fs:[eax],esp
 0046A32D    mov         dl,1
 0046A32F    mov         eax,[0041B40C];TStringBuilder
 0046A334    call        TStringBuilder.Create
 0046A339    mov         dword ptr [ebp-14],eax
 0046A33C    mov         dl,1
 0046A33E    mov         eax,[0041B40C];TStringBuilder
 0046A343    call        TStringBuilder.Create
 0046A348    mov         dword ptr [ebp-18],eax
 0046A34B    xor         edx,edx
 0046A34D    push        ebp
 0046A34E    push        46A4DF
 0046A353    push        dword ptr fs:[edx]
 0046A356    mov         dword ptr fs:[edx],esp
 0046A359    xor         eax,eax
 0046A35B    mov         dword ptr [ebp-10],eax
 0046A35E    mov         eax,dword ptr [ebp-4]
 0046A361    mov         esi,dword ptr [eax+8]
 0046A364    dec         esi
 0046A365    cmp         esi,0
>0046A368    jl          0046A440
 0046A36E    mov         edx,esi
 0046A370    mov         eax,dword ptr [ebp-4]
 0046A373    call        TList.Get
 0046A378    mov         ebx,eax
 0046A37A    mov         eax,dword ptr [ebx]
 0046A37C    mov         edx,dword ptr [ebp-8]
 0046A37F    call        TObject.InheritsFrom
 0046A384    test        al,al
>0046A386    je          0046A436
 0046A38C    cmp         dword ptr [ebx+4],0
>0046A390    je          0046A436
 0046A396    cmp         dword ptr [ebp-10],0
>0046A39A    je          0046A3B4
 0046A39C    mov         dx,7C
 0046A3A0    mov         eax,dword ptr [ebp-14]
 0046A3A3    call        TStringBuilder.Append
 0046A3A8    mov         dx,3B
 0046A3AC    mov         eax,dword ptr [ebp-18]
 0046A3AF    call        TStringBuilder.Append
 0046A3B4    cmp         dword ptr [ebx+8],0
>0046A3B8    jne         0046A3D6
 0046A3BA    cmp         dword ptr [ebx+0C],0
>0046A3BE    je          0046A3D6
 0046A3C0    lea         edx,[ebp-1C]
 0046A3C3    mov         eax,dword ptr [ebx+0C]
 0046A3C6    call        LoadStr
 0046A3CB    mov         edx,dword ptr [ebp-1C]
 0046A3CE    lea         eax,[ebx+8]
 0046A3D1    call        @UStrAsg
 0046A3D6    lea         eax,[ebp-20]
 0046A3D9    push        eax
 0046A3DA    mov         eax,dword ptr [ebx+8]
 0046A3DD    mov         dword ptr [ebp-30],eax
 0046A3E0    mov         byte ptr [ebp-2C],11
 0046A3E4    mov         eax,dword ptr [ebx+4]
 0046A3E7    mov         dword ptr [ebp-28],eax
 0046A3EA    mov         byte ptr [ebp-24],11
 0046A3EE    lea         edx,[ebp-30]
 0046A3F1    mov         ecx,1
 0046A3F6    mov         eax,46A534;'%s (*.%s)|*.%1:s'
 0046A3FB    call        Format
 0046A400    mov         edx,dword ptr [ebp-20]
 0046A403    mov         eax,dword ptr [ebp-14]
 0046A406    call        TStringBuilder.Append
 0046A40B    lea         eax,[ebp-34]
 0046A40E    push        eax
 0046A40F    mov         eax,dword ptr [ebx+4]
 0046A412    mov         dword ptr [ebp-3C],eax
 0046A415    mov         byte ptr [ebp-38],11
 0046A419    lea         edx,[ebp-3C]
 0046A41C    xor         ecx,ecx
 0046A41E    mov         eax,46A564;'*.%s'
 0046A423    call        Format
 0046A428    mov         edx,dword ptr [ebp-34]
 0046A42B    mov         eax,dword ptr [ebp-18]
 0046A42E    call        TStringBuilder.Append
 0046A433    inc         dword ptr [ebp-10]
 0046A436    dec         esi
 0046A437    cmp         esi,0FFFFFFFF
>0046A43A    jne         0046A36E
 0046A440    cmp         dword ptr [ebp-10],1
>0046A444    jle         0046A495
 0046A446    lea         eax,[ebp-40]
 0046A449    push        eax
 0046A44A    lea         edx,[ebp-44]
 0046A44D    mov         eax,[0078D848];^SResString279:TResStringRec
 0046A452    call        LoadResString
 0046A457    mov         eax,dword ptr [ebp-44]
 0046A45A    mov         dword ptr [ebp-30],eax
 0046A45D    mov         byte ptr [ebp-2C],11
 0046A461    lea         edx,[ebp-48]
 0046A464    mov         eax,dword ptr [ebp-18]
 0046A467    mov         ecx,dword ptr [eax]
 0046A469    call        dword ptr [ecx-24]
 0046A46C    mov         eax,dword ptr [ebp-48]
 0046A46F    mov         dword ptr [ebp-28],eax
 0046A472    mov         byte ptr [ebp-24],11
 0046A476    lea         edx,[ebp-30]
 0046A479    mov         ecx,1
 0046A47E    mov         eax,46A57C;'%s (%s)|%1:s|'
 0046A483    call        Format
 0046A488    mov         ecx,dword ptr [ebp-40]
 0046A48B    xor         edx,edx
 0046A48D    mov         eax,dword ptr [ebp-14]
 0046A490    call        TStringBuilder.Insert
 0046A495    lea         edx,[ebp-4C]
 0046A498    mov         eax,dword ptr [ebp-14]
 0046A49B    mov         ecx,dword ptr [eax]
 0046A49D    call        dword ptr [ecx-24]
 0046A4A0    mov         edx,dword ptr [ebp-4C]
 0046A4A3    mov         eax,dword ptr [ebp-0C]
 0046A4A6    call        @UStrAsg
 0046A4AB    lea         edx,[ebp-50]
 0046A4AE    mov         eax,dword ptr [ebp-18]
 0046A4B1    mov         ecx,dword ptr [eax]
 0046A4B3    call        dword ptr [ecx-24]
 0046A4B6    mov         edx,dword ptr [ebp-50]
 0046A4B9    mov         eax,dword ptr [ebp+8]
 0046A4BC    call        @UStrAsg
 0046A4C1    xor         eax,eax
 0046A4C3    pop         edx
 0046A4C4    pop         ecx
 0046A4C5    pop         ecx
 0046A4C6    mov         dword ptr fs:[eax],edx
 0046A4C9    push        46A4E6
 0046A4CE    mov         eax,dword ptr [ebp-14]
 0046A4D1    call        TObject.Free
 0046A4D6    mov         eax,dword ptr [ebp-18]
 0046A4D9    call        TObject.Free
 0046A4DE    ret
>0046A4DF    jmp         @HandleFinally
>0046A4E4    jmp         0046A4CE
 0046A4E6    xor         eax,eax
 0046A4E8    pop         edx
 0046A4E9    pop         ecx
 0046A4EA    pop         ecx
 0046A4EB    mov         dword ptr fs:[eax],edx
 0046A4EE    push        46A51D
 0046A4F3    lea         eax,[ebp-50]
 0046A4F6    mov         edx,5
 0046A4FB    call        @UStrArrayClr
 0046A500    lea         eax,[ebp-34]
 0046A503    call        @UStrClr
 0046A508    lea         eax,[ebp-20]
 0046A50B    mov         edx,2
 0046A510    call        @UStrArrayClr
 0046A515    ret
>0046A516    jmp         @HandleFinally
>0046A51B    jmp         0046A4F3
 0046A51D    pop         esi
 0046A51E    pop         ebx
 0046A51F    mov         esp,ebp
 0046A521    pop         ebp
 0046A522    ret         4
*}
end;

//0046A788
constructor TClipboardFormats.Create();
begin
{*
 0046A788    push        ebx
 0046A789    push        esi
 0046A78A    test        dl,dl
>0046A78C    je          0046A796
 0046A78E    add         esp,0FFFFFFF0
 0046A791    call        @ClassCreate
 0046A796    mov         ebx,edx
 0046A798    mov         esi,eax
 0046A79A    xor         edx,edx
 0046A79C    mov         eax,esi
 0046A79E    call        TObject.Create
 0046A7A3    mov         dl,1
 0046A7A5    mov         eax,[00439644];TList
 0046A7AA    call        TObject.Create
 0046A7AF    mov         dword ptr [esi+4],eax
 0046A7B2    mov         dl,1
 0046A7B4    mov         eax,[00439644];TList
 0046A7B9    call        TObject.Create
 0046A7BE    mov         dword ptr [esi+8],eax
 0046A7C1    mov         ecx,dword ptr ds:[4632EC];TMetafile
 0046A7C7    mov         dx,3
 0046A7CB    mov         eax,esi
 0046A7CD    call        TClipboardFormats.Add
 0046A7D2    mov         ecx,dword ptr ds:[4632EC];TMetafile
 0046A7D8    mov         dx,0E
 0046A7DC    mov         eax,esi
 0046A7DE    call        TClipboardFormats.Add
 0046A7E3    mov         ecx,dword ptr ds:[463B28];TBitmap
 0046A7E9    mov         dx,2
 0046A7ED    mov         eax,esi
 0046A7EF    call        TClipboardFormats.Add
 0046A7F4    mov         eax,esi
 0046A7F6    test        bl,bl
>0046A7F8    je          0046A809
 0046A7FA    call        @AfterConstruction
 0046A7FF    pop         dword ptr fs:[0]
 0046A806    add         esp,0C
 0046A809    mov         eax,esi
 0046A80B    pop         esi
 0046A80C    pop         ebx
 0046A80D    ret
*}
end;

//0046A810
destructor TClipboardFormats.Destroy();
begin
{*
 0046A810    push        ebx
 0046A811    push        esi
 0046A812    call        @BeforeDestruction
 0046A817    mov         ebx,edx
 0046A819    mov         esi,eax
 0046A81B    mov         eax,dword ptr [esi+4]
 0046A81E    call        TObject.Free
 0046A823    mov         eax,dword ptr [esi+8]
 0046A826    call        TObject.Free
 0046A82B    mov         edx,ebx
 0046A82D    and         dl,0FC
 0046A830    mov         eax,esi
 0046A832    call        TObject.Destroy
 0046A837    test        bl,bl
>0046A839    jle         0046A842
 0046A83B    mov         eax,esi
 0046A83D    call        @ClassDestroy
 0046A842    pop         esi
 0046A843    pop         ebx
 0046A844    ret
*}
end;

//0046A848
procedure TClipboardFormats.Add(Fmt:Word; AClass:TGraphicClass);
begin
{*
 0046A848    push        ebp
 0046A849    mov         ebp,esp
 0046A84B    add         esp,0FFFFFFF8
 0046A84E    push        ebx
 0046A84F    push        esi
 0046A850    push        edi
 0046A851    mov         ebx,edx
 0046A853    mov         dword ptr [ebp-4],eax
 0046A856    mov         eax,dword ptr [ebp-4]
 0046A859    mov         eax,dword ptr [eax+4]
 0046A85C    mov         edx,ecx
 0046A85E    call        TList.Add
 0046A863    mov         dword ptr [ebp-8],eax
 0046A866    xor         eax,eax
 0046A868    push        ebp
 0046A869    push        46A88C
 0046A86E    push        dword ptr fs:[eax]
 0046A871    mov         dword ptr fs:[eax],esp
 0046A874    movzx       edx,bx
 0046A877    mov         eax,dword ptr [ebp-4]
 0046A87A    mov         eax,dword ptr [eax+8]
 0046A87D    call        TList.Add
 0046A882    xor         eax,eax
 0046A884    pop         edx
 0046A885    pop         ecx
 0046A886    pop         ecx
 0046A887    mov         dword ptr fs:[eax],edx
>0046A88A    jmp         0046A8A9
>0046A88C    jmp         @HandleAnyException
 0046A891    mov         eax,dword ptr [ebp-4]
 0046A894    mov         eax,dword ptr [eax+4]
 0046A897    mov         edx,dword ptr [ebp-8]
 0046A89A    call        TList.Delete
 0046A89F    call        @RaiseAgain
 0046A8A4    call        @DoneExcept
 0046A8A9    pop         edi
 0046A8AA    pop         esi
 0046A8AB    pop         ebx
 0046A8AC    pop         ecx
 0046A8AD    pop         ecx
 0046A8AE    pop         ebp
 0046A8AF    ret
*}
end;

//0046A8B0
function TClipboardFormats.FindFormat(Fmt:Word):TGraphicClass;
begin
{*
 0046A8B0    push        ebx
 0046A8B1    push        esi
 0046A8B2    push        edi
 0046A8B3    mov         edi,edx
 0046A8B5    mov         esi,eax
 0046A8B7    mov         eax,dword ptr [esi+8]
 0046A8BA    mov         ebx,dword ptr [eax+8]
 0046A8BD    dec         ebx
 0046A8BE    cmp         ebx,0
>0046A8C1    jl          0046A8E6
 0046A8C3    mov         edx,ebx
 0046A8C5    mov         eax,dword ptr [esi+8]
 0046A8C8    call        TList.Get
 0046A8CD    movzx       edx,di
 0046A8D0    cmp         eax,edx
>0046A8D2    jne         0046A8E0
 0046A8D4    mov         edx,ebx
 0046A8D6    mov         eax,dword ptr [esi+4]
 0046A8D9    call        TList.Get
>0046A8DE    jmp         0046A8E8
 0046A8E0    dec         ebx
 0046A8E1    cmp         ebx,0FFFFFFFF
>0046A8E4    jne         0046A8C3
 0046A8E6    xor         eax,eax
 0046A8E8    pop         edi
 0046A8E9    pop         esi
 0046A8EA    pop         ebx
 0046A8EB    ret
*}
end;

//0046A8EC
procedure TClipboardFormats.Remove(AClass:TGraphicClass);
begin
{*
 0046A8EC    push        ebx
 0046A8ED    push        esi
 0046A8EE    push        edi
 0046A8EF    mov         edi,edx
 0046A8F1    mov         esi,eax
 0046A8F3    mov         eax,dword ptr [esi+4]
 0046A8F6    mov         ebx,dword ptr [eax+8]
 0046A8F9    dec         ebx
 0046A8FA    cmp         ebx,0
>0046A8FD    jl          0046A92E
 0046A8FF    mov         edx,ebx
 0046A901    mov         eax,dword ptr [esi+4]
 0046A904    call        TList.Get
 0046A909    mov         edx,edi
 0046A90B    call        TObject.InheritsFrom
 0046A910    test        al,al
>0046A912    je          0046A928
 0046A914    mov         edx,ebx
 0046A916    mov         eax,dword ptr [esi+4]
 0046A919    call        TList.Delete
 0046A91E    mov         edx,ebx
 0046A920    mov         eax,dword ptr [esi+8]
 0046A923    call        TList.Delete
 0046A928    dec         ebx
 0046A929    cmp         ebx,0FFFFFFFF
>0046A92C    jne         0046A8FF
 0046A92E    pop         edi
 0046A92F    pop         esi
 0046A930    pop         ebx
 0046A931    ret
*}
end;

//0046A934
function GetFileFormats:TFileFormatsList;
begin
{*
 0046A934    cmp         dword ptr ds:[785944],0
>0046A93B    jne         0046A94E
 0046A93D    mov         dl,1
 0046A93F    mov         eax,[00469C40];TFileFormatsList
 0046A944    call        TFileFormatsList.Create
 0046A949    mov         [00785944],eax
 0046A94E    mov         eax,[00785944]
 0046A953    ret
*}
end;

//0046A954
function GetClipboardFormats:TClipboardFormats;
begin
{*
 0046A954    cmp         dword ptr ds:[785940],0
>0046A95B    jne         0046A96E
 0046A95D    mov         dl,1
 0046A95F    mov         eax,[0046A598];TClipboardFormats
 0046A964    call        TClipboardFormats.Create
 0046A969    mov         [00785940],eax
 0046A96E    mov         eax,[00785940]
 0046A973    ret
*}
end;

//0046A974
constructor TPicture.Create();
begin
{*
 0046A974    push        ebx
 0046A975    push        esi
 0046A976    test        dl,dl
>0046A978    je          0046A982
 0046A97A    add         esp,0FFFFFFF0
 0046A97D    call        @ClassCreate
 0046A982    mov         ebx,edx
 0046A984    mov         esi,eax
 0046A986    xor         edx,edx
 0046A988    mov         eax,esi
 0046A98A    call        TObject.Create
 0046A98F    call        GetFileFormats
 0046A994    call        GetClipboardFormats
 0046A999    mov         eax,esi
 0046A99B    test        bl,bl
>0046A99D    je          0046A9AE
 0046A99F    call        @AfterConstruction
 0046A9A4    pop         dword ptr fs:[0]
 0046A9AB    add         esp,0C
 0046A9AE    mov         eax,esi
 0046A9B0    pop         esi
 0046A9B1    pop         ebx
 0046A9B2    ret
*}
end;

//0046A9B4
destructor TPicture.Destroy();
begin
{*
 0046A9B4    push        ebx
 0046A9B5    push        esi
 0046A9B6    call        @BeforeDestruction
 0046A9BB    mov         ebx,edx
 0046A9BD    mov         esi,eax
 0046A9BF    mov         eax,dword ptr [esi+0C];TPicture.FGraphic:TGraphic
 0046A9C2    call        TObject.Free
 0046A9C7    mov         edx,ebx
 0046A9C9    and         dl,0FC
 0046A9CC    mov         eax,esi
 0046A9CE    call        TMemoryStream.Destroy
 0046A9D3    test        bl,bl
>0046A9D5    jle         0046A9DE
 0046A9D7    mov         eax,esi
 0046A9D9    call        @ClassDestroy
 0046A9DE    pop         esi
 0046A9DF    pop         ebx
 0046A9E0    ret
*}
end;

//0046A9E4
procedure TPicture.AssignTo(Dest:TPersistent);
begin
{*
 0046A9E4    push        ebx
 0046A9E5    push        esi
 0046A9E6    push        edi
 0046A9E7    push        ebp
 0046A9E8    mov         esi,edx
 0046A9EA    mov         ebx,eax
 0046A9EC    mov         eax,dword ptr [esi]
 0046A9EE    mov         edi,eax
 0046A9F0    mov         ebp,dword ptr [ebx+0C]
 0046A9F3    mov         eax,ebp
 0046A9F5    mov         edx,edi
 0046A9F7    call        @IsClass
 0046A9FC    test        al,al
>0046A9FE    je          0046AA0B
 0046AA00    mov         edx,ebp
 0046AA02    mov         eax,esi
 0046AA04    mov         ecx,dword ptr [eax]
 0046AA06    call        dword ptr [ecx+8]
>0046AA09    jmp         0046AA14
 0046AA0B    mov         edx,esi
 0046AA0D    mov         eax,ebx
 0046AA0F    call        TPersistent.AssignTo
 0046AA14    pop         ebp
 0046AA15    pop         edi
 0046AA16    pop         esi
 0046AA17    pop         ebx
 0046AA18    ret
*}
end;

//0046AA1C
procedure TPicture.ForceType(GraphicType:TGraphicClass);
begin
{*
 0046AA1C    push        ebx
 0046AA1D    push        esi
 0046AA1E    push        edi
 0046AA1F    mov         edi,edx
 0046AA21    mov         ebx,eax
 0046AA23    mov         esi,dword ptr [ebx+0C]
 0046AA26    mov         eax,esi
 0046AA28    mov         edx,edi
 0046AA2A    call        @IsClass
 0046AA2F    test        al,al
>0046AA31    jne         0046AA7A
 0046AA33    mov         eax,esi
 0046AA35    call        TObject.Free
 0046AA3A    xor         eax,eax
 0046AA3C    mov         dword ptr [ebx+0C],eax
 0046AA3F    mov         dl,1
 0046AA41    mov         eax,edi
 0046AA43    call        dword ptr [eax+50]
 0046AA46    mov         esi,eax
 0046AA48    mov         dword ptr [ebx+0C],esi
 0046AA4B    mov         dword ptr [esi+14],ebx
 0046AA4E    mov         eax,ebx
 0046AA50    mov         dx,0FFFD
 0046AA54    call        @FindDynaInst
 0046AA59    mov         dword ptr [esi+10],eax
 0046AA5C    mov         dword ptr [esi+1C],ebx
 0046AA5F    mov         eax,ebx
 0046AA61    mov         dx,0FFFC
 0046AA65    call        @FindDynaInst
 0046AA6A    mov         dword ptr [esi+18],eax
 0046AA6D    mov         edx,ebx
 0046AA6F    mov         eax,ebx
 0046AA71    mov         si,0FFFD
 0046AA75    call        @CallDynaInst
 0046AA7A    pop         edi
 0046AA7B    pop         esi
 0046AA7C    pop         ebx
 0046AA7D    ret
*}
end;

//0046AA80
function TPicture.GetBitmap:TBitmap;
begin
{*
 0046AA80    push        ebx
 0046AA81    mov         ebx,eax
 0046AA83    mov         edx,dword ptr ds:[463B28];TBitmap
 0046AA89    mov         eax,ebx
 0046AA8B    call        TPicture.ForceType
 0046AA90    mov         eax,dword ptr [ebx+0C]
 0046AA93    pop         ebx
 0046AA94    ret
*}
end;

//0046AA98
function TPicture.GetIcon:TIcon;
begin
{*
 0046AA98    push        ebx
 0046AA99    mov         ebx,eax
 0046AA9B    mov         edx,dword ptr ds:[464454];TIcon
 0046AAA1    mov         eax,ebx
 0046AAA3    call        TPicture.ForceType
 0046AAA8    mov         eax,dword ptr [ebx+0C]
 0046AAAB    pop         ebx
 0046AAAC    ret
*}
end;

//0046AAB0
function TPicture.GetMetafile:TMetafile;
begin
{*
 0046AAB0    push        ebx
 0046AAB1    mov         ebx,eax
 0046AAB3    mov         edx,dword ptr ds:[4632EC];TMetafile
 0046AAB9    mov         eax,ebx
 0046AABB    call        TPicture.ForceType
 0046AAC0    mov         eax,dword ptr [ebx+0C]
 0046AAC3    pop         ebx
 0046AAC4    ret
*}
end;

//0046AAE0
procedure TPicture.SetGraphic(Value:TGraphic);
begin
{*
 0046AAE0    push        ebp
 0046AAE1    mov         ebp,esp
 0046AAE3    push        ecx
 0046AAE4    push        ebx
 0046AAE5    push        esi
 0046AAE6    push        edi
 0046AAE7    mov         esi,edx
 0046AAE9    mov         ebx,eax
 0046AAEB    xor         eax,eax
 0046AAED    mov         dword ptr [ebp-4],eax
 0046AAF0    test        esi,esi
>0046AAF2    je          0046AB3C
 0046AAF4    mov         eax,dword ptr [esi]
 0046AAF6    mov         edi,eax
 0046AAF8    mov         dl,1
 0046AAFA    mov         eax,edi
 0046AAFC    call        dword ptr [eax+50]
 0046AAFF    mov         dword ptr [ebp-4],eax
 0046AB02    mov         edx,esi
 0046AB04    mov         eax,dword ptr [ebp-4]
 0046AB07    mov         ecx,dword ptr [eax]
 0046AB09    call        dword ptr [ecx+8]
 0046AB0C    mov         eax,dword ptr [ebp-4]
 0046AB0F    mov         dword ptr [eax+14],ebx
 0046AB12    push        eax
 0046AB13    mov         eax,ebx
 0046AB15    mov         dx,0FFFD
 0046AB19    call        @FindDynaInst
 0046AB1E    mov         edx,eax
 0046AB20    pop         eax
 0046AB21    mov         dword ptr [eax+10],edx
 0046AB24    mov         eax,dword ptr [ebp-4]
 0046AB27    mov         dword ptr [eax+1C],ebx
 0046AB2A    push        eax
 0046AB2B    mov         eax,ebx
 0046AB2D    mov         dx,0FFFC
 0046AB31    call        @FindDynaInst
 0046AB36    mov         edx,eax
 0046AB38    pop         eax
 0046AB39    mov         dword ptr [eax+18],edx
 0046AB3C    xor         eax,eax
 0046AB3E    push        ebp
 0046AB3F    push        46AB6F
 0046AB44    push        dword ptr fs:[eax]
 0046AB47    mov         dword ptr fs:[eax],esp
 0046AB4A    mov         eax,dword ptr [ebx+0C]
 0046AB4D    call        TObject.Free
 0046AB52    mov         eax,dword ptr [ebp-4]
 0046AB55    mov         dword ptr [ebx+0C],eax
 0046AB58    mov         edx,ebx
 0046AB5A    mov         eax,ebx
 0046AB5C    mov         si,0FFFD
 0046AB60    call        @CallDynaInst
 0046AB65    xor         eax,eax
 0046AB67    pop         edx
 0046AB68    pop         ecx
 0046AB69    pop         ecx
 0046AB6A    mov         dword ptr fs:[eax],edx
>0046AB6D    jmp         0046AB86
>0046AB6F    jmp         @HandleAnyException
 0046AB74    mov         eax,dword ptr [ebp-4]
 0046AB77    call        TObject.Free
 0046AB7C    call        @RaiseAgain
 0046AB81    call        @DoneExcept
 0046AB86    pop         edi
 0046AB87    pop         esi
 0046AB88    pop         ebx
 0046AB89    pop         ecx
 0046AB8A    pop         ebp
 0046AB8B    ret
*}
end;

//0046AB8C
procedure TPicture.LoadFromFile(Filename:string);
begin
{*
 0046AB8C    push        ebp
 0046AB8D    mov         ebp,esp
 0046AB8F    add         esp,0FFFFFFEC
 0046AB92    push        ebx
 0046AB93    push        esi
 0046AB94    push        edi
 0046AB95    xor         ecx,ecx
 0046AB97    mov         dword ptr [ebp-14],ecx
 0046AB9A    mov         dword ptr [ebp-4],ecx
 0046AB9D    mov         edi,edx
 0046AB9F    mov         ebx,eax
 0046ABA1    xor         eax,eax
 0046ABA3    push        ebp
 0046ABA4    push        46ACB4
 0046ABA9    push        dword ptr fs:[eax]
 0046ABAC    mov         dword ptr fs:[eax],esp
 0046ABAF    lea         edx,[ebp-4]
 0046ABB2    mov         eax,edi
 0046ABB4    call        ExtractFileExt
 0046ABB9    lea         eax,[ebp-4]
 0046ABBC    mov         ecx,1
 0046ABC1    mov         edx,1
 0046ABC6    call        @UStrDelete
 0046ABCB    mov         edx,dword ptr [ebp-4]
 0046ABCE    mov         eax,[00785944]
 0046ABD3    call        TFileFormatsList.FindExt
 0046ABD8    mov         esi,eax
 0046ABDA    test        esi,esi
>0046ABDC    jne         0046AC0F
 0046ABDE    mov         eax,dword ptr [ebp-4]
 0046ABE1    mov         dword ptr [ebp-10],eax
 0046ABE4    mov         byte ptr [ebp-0C],11
 0046ABE8    lea         eax,[ebp-10]
 0046ABEB    push        eax
 0046ABEC    push        0
 0046ABEE    lea         edx,[ebp-14]
 0046ABF1    mov         eax,[0078DB50];^SResString188:TResStringRec
 0046ABF6    call        LoadResString
 0046ABFB    mov         ecx,dword ptr [ebp-14]
 0046ABFE    mov         dl,1
 0046AC00    mov         eax,[0045F1D8];EInvalidGraphic
 0046AC05    call        Exception.CreateFmt
 0046AC0A    call        @RaiseExcept
 0046AC0F    mov         dl,1
 0046AC11    mov         eax,esi
 0046AC13    call        dword ptr [eax+50]
 0046AC16    mov         dword ptr [ebp-8],eax
 0046AC19    xor         eax,eax
 0046AC1B    push        ebp
 0046AC1C    push        46AC53
 0046AC21    push        dword ptr fs:[eax]
 0046AC24    mov         dword ptr fs:[eax],esp
 0046AC27    mov         eax,dword ptr [ebp-8]
 0046AC2A    mov         dword ptr [eax+1C],ebx
 0046AC2D    push        eax
 0046AC2E    mov         eax,ebx
 0046AC30    mov         dx,0FFFC
 0046AC34    call        @FindDynaInst
 0046AC39    mov         edx,eax
 0046AC3B    pop         eax
 0046AC3C    mov         dword ptr [eax+18],edx
 0046AC3F    mov         edx,edi
 0046AC41    mov         eax,dword ptr [ebp-8]
 0046AC44    mov         ecx,dword ptr [eax]
 0046AC46    call        dword ptr [ecx+54]
 0046AC49    xor         eax,eax
 0046AC4B    pop         edx
 0046AC4C    pop         ecx
 0046AC4D    pop         ecx
 0046AC4E    mov         dword ptr fs:[eax],edx
>0046AC51    jmp         0046AC6A
>0046AC53    jmp         @HandleAnyException
 0046AC58    mov         eax,dword ptr [ebp-8]
 0046AC5B    call        TObject.Free
 0046AC60    call        @RaiseAgain
 0046AC65    call        @DoneExcept
 0046AC6A    mov         eax,dword ptr [ebx+0C]
 0046AC6D    call        TObject.Free
 0046AC72    mov         esi,dword ptr [ebp-8]
 0046AC75    mov         dword ptr [ebx+0C],esi
 0046AC78    mov         dword ptr [esi+14],ebx
 0046AC7B    mov         eax,ebx
 0046AC7D    mov         dx,0FFFD
 0046AC81    call        @FindDynaInst
 0046AC86    mov         dword ptr [esi+10],eax
 0046AC89    mov         edx,ebx
 0046AC8B    mov         eax,ebx
 0046AC8D    mov         si,0FFFD
 0046AC91    call        @CallDynaInst
 0046AC96    xor         eax,eax
 0046AC98    pop         edx
 0046AC99    pop         ecx
 0046AC9A    pop         ecx
 0046AC9B    mov         dword ptr fs:[eax],edx
 0046AC9E    push        46ACBB
 0046ACA3    lea         eax,[ebp-14]
 0046ACA6    call        @UStrClr
 0046ACAB    lea         eax,[ebp-4]
 0046ACAE    call        @UStrClr
 0046ACB3    ret
>0046ACB4    jmp         @HandleFinally
>0046ACB9    jmp         0046ACA3
 0046ACBB    pop         edi
 0046ACBC    pop         esi
 0046ACBD    pop         ebx
 0046ACBE    mov         esp,ebp
 0046ACC0    pop         ebp
 0046ACC1    ret
*}
end;

//0046ACC4
procedure TPicture.SaveToFile(Filename:string);
begin
{*
 0046ACC4    push        esi
 0046ACC5    push        edi
 0046ACC6    mov         esi,eax
 0046ACC8    mov         edi,dword ptr [esi+0C]
 0046ACCB    test        edi,edi
>0046ACCD    je          0046ACD6
 0046ACCF    mov         eax,edi
 0046ACD1    mov         ecx,dword ptr [eax]
 0046ACD3    call        dword ptr [ecx+58]
 0046ACD6    pop         edi
 0046ACD7    pop         esi
 0046ACD8    ret
*}
end;

//0046ACDC
procedure TPicture.LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE);
begin
{*
 0046ACDC    push        ebp
 0046ACDD    mov         ebp,esp
 0046ACDF    add         esp,0FFFFFFF8
 0046ACE2    push        ebx
 0046ACE3    push        esi
 0046ACE4    push        edi
 0046ACE5    mov         dword ptr [ebp-4],ecx
 0046ACE8    mov         edi,edx
 0046ACEA    mov         ebx,eax
 0046ACEC    mov         edx,edi
 0046ACEE    mov         eax,[00785940]
 0046ACF3    call        TClipboardFormats.FindFormat
 0046ACF8    mov         esi,eax
 0046ACFA    test        esi,esi
>0046ACFC    jne         0046AD08
 0046ACFE    mov         eax,[0078D5E0];^SResString189:TResStringRec
 0046AD03    call        InvalidGraphic
 0046AD08    mov         dl,1
 0046AD0A    mov         eax,esi
 0046AD0C    call        dword ptr [eax+50]
 0046AD0F    mov         dword ptr [ebp-8],eax
 0046AD12    xor         eax,eax
 0046AD14    push        ebp
 0046AD15    push        46AD53
 0046AD1A    push        dword ptr fs:[eax]
 0046AD1D    mov         dword ptr fs:[eax],esp
 0046AD20    mov         eax,dword ptr [ebp-8]
 0046AD23    mov         dword ptr [eax+1C],ebx
 0046AD26    push        eax
 0046AD27    mov         eax,ebx
 0046AD29    mov         dx,0FFFC
 0046AD2D    call        @FindDynaInst
 0046AD32    mov         edx,eax
 0046AD34    pop         eax
 0046AD35    mov         dword ptr [eax+18],edx
 0046AD38    mov         eax,dword ptr [ebp+8]
 0046AD3B    push        eax
 0046AD3C    mov         ecx,dword ptr [ebp-4]
 0046AD3F    mov         edx,edi
 0046AD41    mov         eax,dword ptr [ebp-8]
 0046AD44    mov         esi,dword ptr [eax]
 0046AD46    call        dword ptr [esi+64]
 0046AD49    xor         eax,eax
 0046AD4B    pop         edx
 0046AD4C    pop         ecx
 0046AD4D    pop         ecx
 0046AD4E    mov         dword ptr fs:[eax],edx
>0046AD51    jmp         0046AD6A
>0046AD53    jmp         @HandleAnyException
 0046AD58    mov         eax,dword ptr [ebp-8]
 0046AD5B    call        TObject.Free
 0046AD60    call        @RaiseAgain
 0046AD65    call        @DoneExcept
 0046AD6A    mov         eax,dword ptr [ebx+0C]
 0046AD6D    call        TObject.Free
 0046AD72    mov         esi,dword ptr [ebp-8]
 0046AD75    mov         dword ptr [ebx+0C],esi
 0046AD78    mov         dword ptr [esi+14],ebx
 0046AD7B    mov         eax,ebx
 0046AD7D    mov         dx,0FFFD
 0046AD81    call        @FindDynaInst
 0046AD86    mov         dword ptr [esi+10],eax
 0046AD89    mov         edx,ebx
 0046AD8B    mov         eax,ebx
 0046AD8D    mov         si,0FFFD
 0046AD91    call        @CallDynaInst
 0046AD96    pop         edi
 0046AD97    pop         esi
 0046AD98    pop         ebx
 0046AD99    pop         ecx
 0046AD9A    pop         ecx
 0046AD9B    pop         ebp
 0046AD9C    ret         4
*}
end;

//0046ADA0
procedure TPicture.SaveToClipboardFormat(var AFormat:Word; var AData:Cardinal; var APalette:HPALETTE);
begin
{*
 0046ADA0    push        ebp
 0046ADA1    mov         ebp,esp
 0046ADA3    push        ebx
 0046ADA4    push        esi
 0046ADA5    push        edi
 0046ADA6    mov         esi,eax
 0046ADA8    mov         edi,dword ptr [esi+0C]
 0046ADAB    test        edi,edi
>0046ADAD    je          0046ADBA
 0046ADAF    mov         eax,dword ptr [ebp+8]
 0046ADB2    push        eax
 0046ADB3    mov         eax,edi
 0046ADB5    mov         ebx,dword ptr [eax]
 0046ADB7    call        dword ptr [ebx+68]
 0046ADBA    pop         edi
 0046ADBB    pop         esi
 0046ADBC    pop         ebx
 0046ADBD    pop         ebp
 0046ADBE    ret         4
*}
end;

//0046ADC4
function TPicture.SupportsClipboardFormat(AFormat:Word):Boolean;
begin
{*
 0046ADC4    push        ebx
 0046ADC5    mov         ebx,edx
 0046ADC7    call        GetClipboardFormats
 0046ADCC    mov         edx,ebx
 0046ADCE    call        TClipboardFormats.FindFormat
 0046ADD3    test        eax,eax
 0046ADD5    setne       al
 0046ADD8    pop         ebx
 0046ADD9    ret
*}
end;

//0046ADDC
procedure TPicture.LoadFromStream(Stream:TStream);
begin
{*
 0046ADDC    push        esi
 0046ADDD    push        edi
 0046ADDE    mov         edi,edx
 0046ADE0    mov         esi,eax
 0046ADE2    mov         eax,esi
 0046ADE4    call        TPicture.GetBitmap
 0046ADE9    mov         edx,edi
 0046ADEB    mov         ecx,dword ptr [eax]
 0046ADED    call        dword ptr [ecx+5C]
 0046ADF0    pop         edi
 0046ADF1    pop         esi
 0046ADF2    ret
*}
end;

//0046ADF4
procedure TPicture.SaveToStream(Stream:TStream);
begin
{*
 0046ADF4    push        ebx
 0046ADF5    push        esi
 0046ADF6    mov         esi,edx
 0046ADF8    mov         ebx,eax
 0046ADFA    mov         eax,ebx
 0046ADFC    call        TPicture.GetBitmap
 0046AE01    mov         edx,esi
 0046AE03    mov         ecx,dword ptr [eax]
 0046AE05    call        dword ptr [ecx+60]
 0046AE08    pop         esi
 0046AE09    pop         ebx
 0046AE0A    ret
*}
end;

//0046AE0C
procedure TPicture.Assign(Source:TPersistent);
begin
{*
 0046AE0C    push        ebx
 0046AE0D    push        esi
 0046AE0E    mov         ebx,edx
 0046AE10    mov         esi,eax
 0046AE12    test        ebx,ebx
>0046AE14    jne         0046AE22
 0046AE16    xor         edx,edx
 0046AE18    mov         eax,esi
 0046AE1A    call        TPicture.SetGraphic
 0046AE1F    pop         esi
 0046AE20    pop         ebx
 0046AE21    ret
 0046AE22    mov         eax,ebx
 0046AE24    mov         edx,dword ptr ds:[46279C];TPicture
 0046AE2A    call        @IsClass
 0046AE2F    test        al,al
>0046AE31    je          0046AE3F
 0046AE33    mov         edx,dword ptr [ebx+0C]
 0046AE36    mov         eax,esi
 0046AE38    call        TPicture.SetGraphic
>0046AE3D    jmp         0046AE64
 0046AE3F    mov         eax,ebx
 0046AE41    mov         edx,dword ptr ds:[462108];TGraphic
 0046AE47    call        @IsClass
 0046AE4C    test        al,al
>0046AE4E    je          0046AE5B
 0046AE50    mov         edx,ebx
 0046AE52    mov         eax,esi
 0046AE54    call        TPicture.SetGraphic
>0046AE59    jmp         0046AE64
 0046AE5B    mov         edx,ebx
 0046AE5D    mov         eax,esi
 0046AE5F    call        TPersistent.Assign
 0046AE64    pop         esi
 0046AE65    pop         ebx
 0046AE66    ret
*}
end;

//0046AE68
procedure TPicture.RegisterFileFormat(AExtension:string; ADescription:string; AGraphicClass:TGraphicClass);
begin
{*
 0046AE68    push        ebp
 0046AE69    mov         ebp,esp
 0046AE6B    push        ebx
 0046AE6C    push        esi
 0046AE6D    mov         esi,ecx
 0046AE6F    mov         ebx,edx
 0046AE71    push        0
 0046AE73    mov         eax,dword ptr [ebp+8]
 0046AE76    push        eax
 0046AE77    call        GetFileFormats
 0046AE7C    mov         ecx,esi
 0046AE7E    mov         edx,ebx
 0046AE80    call        TFileFormatsList.Add
 0046AE85    pop         esi
 0046AE86    pop         ebx
 0046AE87    pop         ebp
 0046AE88    ret         4
*}
end;

//0046AE8C
procedure TPicture.RegisterFileFormatRes(AExtension:string; ADescriptionResID:Integer; AGraphicClass:TGraphicClass);
begin
{*
 0046AE8C    push        ebp
 0046AE8D    mov         ebp,esp
 0046AE8F    push        ebx
 0046AE90    push        esi
 0046AE91    mov         esi,ecx
 0046AE93    mov         ebx,edx
 0046AE95    push        esi
 0046AE96    mov         eax,dword ptr [ebp+8]
 0046AE99    push        eax
 0046AE9A    call        GetFileFormats
 0046AE9F    xor         ecx,ecx
 0046AEA1    mov         edx,ebx
 0046AEA3    call        TFileFormatsList.Add
 0046AEA8    pop         esi
 0046AEA9    pop         ebx
 0046AEAA    pop         ebp
 0046AEAB    ret         4
*}
end;

//0046AEB0
procedure TPicture.RegisterClipboardFormat(AFormat:Word; AGraphicClass:TGraphicClass);
begin
{*
 0046AEB0    push        ebx
 0046AEB1    push        esi
 0046AEB2    mov         esi,ecx
 0046AEB4    mov         ebx,edx
 0046AEB6    call        GetClipboardFormats
 0046AEBB    mov         ecx,esi
 0046AEBD    mov         edx,ebx
 0046AEBF    call        TClipboardFormats.Add
 0046AEC4    pop         esi
 0046AEC5    pop         ebx
 0046AEC6    ret
*}
end;

//0046AEC8
procedure TPicture.UnregisterGraphicClass(AClass:TGraphicClass);
begin
{*
 0046AEC8    push        ebx
 0046AEC9    mov         ebx,edx
 0046AECB    cmp         dword ptr ds:[785944],0
>0046AED2    je          0046AEE0
 0046AED4    mov         edx,ebx
 0046AED6    mov         eax,[00785944]
 0046AEDB    call        TFileFormatsList.Remove
 0046AEE0    cmp         dword ptr ds:[785940],0
>0046AEE7    je          0046AEF5
 0046AEE9    mov         edx,ebx
 0046AEEB    mov         eax,[00785940]
 0046AEF0    call        TClipboardFormats.Remove
 0046AEF5    pop         ebx
 0046AEF6    ret
*}
end;

//0046AEF8
procedure TPicture.Changed(Sender:TObject);
begin
{*
 0046AEF8    push        ebx
 0046AEF9    mov         ebx,eax
 0046AEFB    cmp         word ptr [ebx+12],0
>0046AF00    je          0046AF0A
 0046AF02    mov         edx,ebx
 0046AF04    mov         eax,dword ptr [ebx+14]
 0046AF07    call        dword ptr [ebx+10]
 0046AF0A    cmp         dword ptr [ebx+18],0
>0046AF0E    je          0046AF18
 0046AF10    mov         eax,dword ptr [ebx+18]
 0046AF13    mov         edx,dword ptr [eax]
 0046AF15    call        dword ptr [edx+0C]
 0046AF18    pop         ebx
 0046AF19    ret
*}
end;

//0046AF1C
procedure TPicture.Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:UnicodeString);
begin
{*
 0046AF1C    push        ebp
 0046AF1D    mov         ebp,esp
 0046AF1F    push        ebx
 0046AF20    cmp         word ptr [eax+22],0
>0046AF25    je          0046AF41
 0046AF27    movzx       ebx,byte ptr [ebp+14]
 0046AF2B    push        ebx
 0046AF2C    movzx       ebx,byte ptr [ebp+10]
 0046AF30    push        ebx
 0046AF31    mov         ebx,dword ptr [ebp+0C]
 0046AF34    push        ebx
 0046AF35    mov         ebx,dword ptr [ebp+8]
 0046AF38    push        ebx
 0046AF39    mov         ebx,eax
 0046AF3B    mov         eax,dword ptr [ebx+24]
 0046AF3E    call        dword ptr [ebx+20]
 0046AF41    pop         ebx
 0046AF42    pop         ebp
 0046AF43    ret         10
*}
end;

//0046AF48
procedure TPicture.ReadData(Stream:TStream);
begin
{*
 0046AF48    push        ebp
 0046AF49    mov         ebp,esp
 0046AF4B    add         esp,0FFFFFFF0
 0046AF4E    push        ebx
 0046AF4F    push        esi
 0046AF50    push        edi
 0046AF51    xor         ecx,ecx
 0046AF53    mov         dword ptr [ebp-4],ecx
 0046AF56    mov         dword ptr [ebp-8],ecx
 0046AF59    mov         esi,edx
 0046AF5B    mov         ebx,eax
 0046AF5D    xor         eax,eax
 0046AF5F    push        ebp
 0046AF60    push        46B083
 0046AF65    push        dword ptr fs:[eax]
 0046AF68    mov         dword ptr fs:[eax],esp
 0046AF6B    lea         edx,[ebp-0D]
 0046AF6E    mov         ecx,1
 0046AF73    mov         eax,esi
 0046AF75    mov         edi,dword ptr [eax]
 0046AF77    call        dword ptr [edi+0C]
 0046AF7A    movzx       eax,byte ptr [ebp-0D]
 0046AF7E    push        eax
 0046AF7F    lea         eax,[ebp-8]
 0046AF82    mov         ecx,1
 0046AF87    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0046AF8D    call        @DynArraySetLength
 0046AF92    add         esp,4
 0046AF95    movzx       ecx,byte ptr [ebp-0D]
 0046AF99    mov         edx,dword ptr [ebp-8]
 0046AF9C    mov         eax,esi
 0046AF9E    mov         edi,dword ptr [eax]
 0046AFA0    call        dword ptr [edi+0C]
 0046AFA3    call        TEncoding.GetUTF8
 0046AFA8    lea         ecx,[ebp-4]
 0046AFAB    mov         edx,dword ptr [ebp-8]
 0046AFAE    call        TEncoding.GetString
 0046AFB3    mov         edx,dword ptr [ebp-4]
 0046AFB6    mov         eax,[00785944]
 0046AFBB    call        TFileFormatsList.FindClassName
 0046AFC0    mov         edi,eax
 0046AFC2    xor         eax,eax
 0046AFC4    mov         dword ptr [ebp-0C],eax
 0046AFC7    test        edi,edi
>0046AFC9    je          0046B00E
 0046AFCB    mov         dl,1
 0046AFCD    mov         eax,edi
 0046AFCF    call        dword ptr [eax+50]
 0046AFD2    mov         dword ptr [ebp-0C],eax
 0046AFD5    xor         eax,eax
 0046AFD7    push        ebp
 0046AFD8    push        46AFF7
 0046AFDD    push        dword ptr fs:[eax]
 0046AFE0    mov         dword ptr fs:[eax],esp
 0046AFE3    mov         edx,esi
 0046AFE5    mov         eax,dword ptr [ebp-0C]
 0046AFE8    mov         ecx,dword ptr [eax]
 0046AFEA    call        dword ptr [ecx+34]
 0046AFED    xor         eax,eax
 0046AFEF    pop         edx
 0046AFF0    pop         ecx
 0046AFF1    pop         ecx
 0046AFF2    mov         dword ptr fs:[eax],edx
>0046AFF5    jmp         0046B00E
>0046AFF7    jmp         @HandleAnyException
 0046AFFC    mov         eax,dword ptr [ebp-0C]
 0046AFFF    call        TObject.Free
 0046B004    call        @RaiseAgain
 0046B009    call        @DoneExcept
 0046B00E    mov         eax,dword ptr [ebx+0C]
 0046B011    call        TObject.Free
 0046B016    mov         eax,dword ptr [ebp-0C]
 0046B019    mov         dword ptr [ebx+0C],eax
 0046B01C    cmp         dword ptr [ebp-0C],0
>0046B020    je          0046B052
 0046B022    mov         eax,dword ptr [ebp-0C]
 0046B025    mov         dword ptr [eax+14],ebx
 0046B028    push        eax
 0046B029    mov         eax,ebx
 0046B02B    mov         dx,0FFFD
 0046B02F    call        @FindDynaInst
 0046B034    mov         edx,eax
 0046B036    pop         eax
 0046B037    mov         dword ptr [eax+10],edx
 0046B03A    mov         eax,dword ptr [ebp-0C]
 0046B03D    mov         dword ptr [eax+1C],ebx
 0046B040    push        eax
 0046B041    mov         eax,ebx
 0046B043    mov         dx,0FFFC
 0046B047    call        @FindDynaInst
 0046B04C    mov         edx,eax
 0046B04E    pop         eax
 0046B04F    mov         dword ptr [eax+18],edx
 0046B052    mov         edx,ebx
 0046B054    mov         eax,ebx
 0046B056    mov         si,0FFFD
 0046B05A    call        @CallDynaInst
 0046B05F    xor         eax,eax
 0046B061    pop         edx
 0046B062    pop         ecx
 0046B063    pop         ecx
 0046B064    mov         dword ptr fs:[eax],edx
 0046B067    push        46B08A
 0046B06C    lea         eax,[ebp-8]
 0046B06F    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0046B075    call        @DynArrayClear
 0046B07A    lea         eax,[ebp-4]
 0046B07D    call        @UStrClr
 0046B082    ret
>0046B083    jmp         @HandleFinally
>0046B088    jmp         0046B06C
 0046B08A    pop         edi
 0046B08B    pop         esi
 0046B08C    pop         ebx
 0046B08D    mov         esp,ebp
 0046B08F    pop         ebp
 0046B090    ret
*}
end;

//0046B094
procedure TPicture.WriteData(Stream:TStream);
begin
{*
 0046B094    push        ebp
 0046B095    mov         ebp,esp
 0046B097    push        0
 0046B099    push        0
 0046B09B    push        0
 0046B09D    push        ebx
 0046B09E    push        esi
 0046B09F    push        edi
 0046B0A0    mov         esi,edx
 0046B0A2    mov         ebx,eax
 0046B0A4    xor         eax,eax
 0046B0A6    push        ebp
 0046B0A7    push        46B136
 0046B0AC    push        dword ptr fs:[eax]
 0046B0AF    mov         dword ptr fs:[eax],esp
 0046B0B2    mov         edi,dword ptr [ebx+0C]
 0046B0B5    test        edi,edi
>0046B0B7    je          0046B0C5
 0046B0B9    lea         edx,[ebp-4]
 0046B0BC    mov         eax,dword ptr [edi]
 0046B0BE    call        TObject.ClassName
>0046B0C3    jmp         0046B0CD
 0046B0C5    lea         eax,[ebp-4]
 0046B0C8    call        @UStrClr
 0046B0CD    call        TEncoding.GetUTF8
 0046B0D2    lea         ecx,[ebp-8]
 0046B0D5    mov         edx,dword ptr [ebp-4]
 0046B0D8    call        TEncoding.GetBytes
 0046B0DD    mov         eax,dword ptr [ebp-8]
 0046B0E0    call        @DynArrayLength
 0046B0E5    mov         dword ptr [ebp-0C],eax
 0046B0E8    lea         edx,[ebp-0C]
 0046B0EB    mov         ecx,1
 0046B0F0    mov         eax,esi
 0046B0F2    mov         edi,dword ptr [eax]
 0046B0F4    call        dword ptr [edi+10]
 0046B0F7    mov         edx,dword ptr [ebp-8]
 0046B0FA    mov         ecx,dword ptr [ebp-0C]
 0046B0FD    mov         eax,esi
 0046B0FF    mov         edi,dword ptr [eax]
 0046B101    call        dword ptr [edi+10]
 0046B104    mov         eax,dword ptr [ebx+0C]
 0046B107    test        eax,eax
>0046B109    je          0046B112
 0046B10B    mov         edx,esi
 0046B10D    mov         ecx,dword ptr [eax]
 0046B10F    call        dword ptr [ecx+48]
 0046B112    xor         eax,eax
 0046B114    pop         edx
 0046B115    pop         ecx
 0046B116    pop         ecx
 0046B117    mov         dword ptr fs:[eax],edx
 0046B11A    push        46B13D
 0046B11F    lea         eax,[ebp-8]
 0046B122    mov         edx,dword ptr ds:[418988];TArray<System.Byte>
 0046B128    call        @DynArrayClear
 0046B12D    lea         eax,[ebp-4]
 0046B130    call        @UStrClr
 0046B135    ret
>0046B136    jmp         @HandleFinally
>0046B13B    jmp         0046B11F
 0046B13D    pop         edi
 0046B13E    pop         esi
 0046B13F    pop         ebx
 0046B140    mov         esp,ebp
 0046B142    pop         ebp
 0046B143    ret
*}
end;

//0046B144
function DoWrite:Boolean;
begin
{*
 0046B144    push        ebp
 0046B145    mov         ebp,esp
 0046B147    push        ebx
 0046B148    push        esi
 0046B149    mov         eax,dword ptr [ebp+8]
 0046B14C    mov         eax,dword ptr [eax-4]
 0046B14F    mov         esi,dword ptr [eax+20]
 0046B152    test        esi,esi
>0046B154    je          0046B1AD
 0046B156    mov         bl,1
 0046B158    mov         eax,dword ptr [ebp+8]
 0046B15B    mov         eax,esi
 0046B15D    mov         edx,dword ptr ds:[46279C];TPicture
 0046B163    call        @IsClass
 0046B168    test        al,al
>0046B16A    je          0046B1BA
 0046B16C    mov         eax,dword ptr [ebp+8]
 0046B16F    mov         ebx,esi
 0046B171    mov         eax,dword ptr [ebp+8]
 0046B174    mov         eax,dword ptr [eax-8]
 0046B177    mov         eax,dword ptr [eax+0C]
 0046B17A    cmp         eax,dword ptr [ebx+0C]
>0046B17D    je          0046B1A3
 0046B17F    mov         eax,dword ptr [ebp+8]
 0046B182    mov         eax,dword ptr [eax-8]
 0046B185    mov         esi,dword ptr [eax+0C]
 0046B188    test        esi,esi
>0046B18A    je          0046B1A7
 0046B18C    cmp         dword ptr [ebx+0C],0
>0046B190    je          0046B1A7
 0046B192    mov         edx,dword ptr [ebx+0C]
 0046B195    mov         eax,dword ptr [ebp+8]
 0046B198    mov         eax,esi
 0046B19A    mov         ecx,dword ptr [eax]
 0046B19C    call        dword ptr [ecx+1C]
 0046B19F    test        al,al
>0046B1A1    je          0046B1A7
 0046B1A3    xor         eax,eax
>0046B1A5    jmp         0046B1A9
 0046B1A7    mov         al,1
 0046B1A9    mov         ebx,eax
>0046B1AB    jmp         0046B1BA
 0046B1AD    mov         eax,dword ptr [ebp+8]
 0046B1B0    mov         eax,dword ptr [eax-8]
 0046B1B3    cmp         dword ptr [eax+0C],0
 0046B1B7    setne       bl
 0046B1BA    mov         eax,ebx
 0046B1BC    pop         esi
 0046B1BD    pop         ebx
 0046B1BE    pop         ebp
 0046B1BF    ret
*}
end;

//0046B1C0
procedure TPicture.DefineProperties(Filer:TFiler);
begin
{*
 0046B1C0    push        ebp
 0046B1C1    mov         ebp,esp
 0046B1C3    add         esp,0FFFFFFF8
 0046B1C6    push        ebx
 0046B1C7    mov         dword ptr [ebp-4],edx
 0046B1CA    mov         dword ptr [ebp-8],eax
 0046B1CD    mov         eax,dword ptr [ebp-8]
 0046B1D0    push        eax
 0046B1D1    push        46AF48;TPicture.ReadData
 0046B1D6    mov         eax,dword ptr [ebp-8]
 0046B1D9    push        eax
 0046B1DA    push        46B094;TPicture.WriteData
 0046B1DF    push        ebp
 0046B1E0    call        DoWrite
 0046B1E5    pop         ecx
 0046B1E6    mov         ecx,eax
 0046B1E8    mov         edx,46B208;'Data'
 0046B1ED    mov         eax,dword ptr [ebp-4]
 0046B1F0    mov         ebx,dword ptr [eax]
 0046B1F2    call        dword ptr [ebx+8]
 0046B1F5    pop         ebx
 0046B1F6    pop         ecx
 0046B1F7    pop         ecx
 0046B1F8    pop         ebp
 0046B1F9    ret
*}
end;

//0046B214
function TPicture.GetWidth:Integer;
begin
{*
 0046B214    push        esi
 0046B215    xor         edx,edx
 0046B217    mov         esi,dword ptr [eax+0C]
 0046B21A    test        esi,esi
>0046B21C    je          0046B227
 0046B21E    mov         eax,esi
 0046B220    mov         edx,dword ptr [eax]
 0046B222    call        dword ptr [edx+30]
 0046B225    mov         edx,eax
 0046B227    mov         eax,edx
 0046B229    pop         esi
 0046B22A    ret
*}
end;

//0046B22C
function TPicture.GetHeight:Integer;
begin
{*
 0046B22C    push        esi
 0046B22D    xor         edx,edx
 0046B22F    mov         esi,dword ptr [eax+0C]
 0046B232    test        esi,esi
>0046B234    je          0046B23F
 0046B236    mov         eax,esi
 0046B238    mov         edx,dword ptr [eax]
 0046B23A    call        dword ptr [edx+24]
 0046B23D    mov         edx,eax
 0046B23F    mov         eax,edx
 0046B241    pop         esi
 0046B242    ret
*}
end;

//0046B244
destructor TMetafileImage.Destroy();
begin
{*
 0046B244    push        ebx
 0046B245    push        esi
 0046B246    call        @BeforeDestruction
 0046B24B    mov         ebx,edx
 0046B24D    mov         esi,eax
 0046B24F    mov         eax,dword ptr [esi+8]
 0046B252    test        eax,eax
>0046B254    je          0046B25C
 0046B256    push        eax
 0046B257    call        gdi32.DeleteEnhMetaFile
 0046B25C    mov         eax,dword ptr [esi+14]
 0046B25F    call        InternalDeletePalette
 0046B264    mov         edx,ebx
 0046B266    and         dl,0FC
 0046B269    mov         eax,esi
 0046B26B    call        TSharedImage.Destroy
 0046B270    test        bl,bl
>0046B272    jle         0046B27B
 0046B274    mov         eax,esi
 0046B276    call        @ClassDestroy
 0046B27B    pop         esi
 0046B27C    pop         ebx
 0046B27D    ret
*}
end;

//0046B280
procedure TMetafileImage.FreeHandle;
begin
{*
 0046B280    ret
*}
end;

//0046B284
constructor TMetafileCanvas.Create(ReferenceDevice:HDC);
begin
{*
 0046B284    push        ebp
 0046B285    mov         ebp,esp
 0046B287    push        0
 0046B289    push        0
 0046B28B    push        ebx
 0046B28C    push        esi
 0046B28D    push        edi
 0046B28E    test        dl,dl
>0046B290    je          0046B29A
 0046B292    add         esp,0FFFFFFF0
 0046B295    call        @ClassCreate
 0046B29A    mov         edi,ecx
 0046B29C    mov         ebx,edx
 0046B29E    mov         esi,eax
 0046B2A0    xor         eax,eax
 0046B2A2    push        ebp
 0046B2A3    push        46B2F4
 0046B2A8    push        dword ptr fs:[eax]
 0046B2AB    mov         dword ptr fs:[eax],esp
 0046B2AE    mov         eax,dword ptr [ebp+8]
 0046B2B1    push        eax
 0046B2B2    lea         edx,[ebp-4]
 0046B2B5    mov         eax,edi
 0046B2B7    call        TMetafile.GetAuthor
 0046B2BC    mov         eax,dword ptr [ebp-4]
 0046B2BF    push        eax
 0046B2C0    lea         edx,[ebp-8]
 0046B2C3    mov         eax,edi
 0046B2C5    call        TMetafile.GetDesc
 0046B2CA    mov         eax,dword ptr [ebp-8]
 0046B2CD    push        eax
 0046B2CE    mov         ecx,edi
 0046B2D0    xor         edx,edx
 0046B2D2    mov         eax,esi
 0046B2D4    call        TMetafileCanvas.CreateWithComment
 0046B2D9    xor         eax,eax
 0046B2DB    pop         edx
 0046B2DC    pop         ecx
 0046B2DD    pop         ecx
 0046B2DE    mov         dword ptr fs:[eax],edx
 0046B2E1    push        46B2FB
 0046B2E6    lea         eax,[ebp-8]
 0046B2E9    mov         edx,2
 0046B2EE    call        @UStrArrayClr
 0046B2F3    ret
>0046B2F4    jmp         @HandleFinally
>0046B2F9    jmp         0046B2E6
 0046B2FB    mov         eax,esi
 0046B2FD    test        bl,bl
>0046B2FF    je          0046B310
 0046B301    call        @AfterConstruction
 0046B306    pop         dword ptr fs:[0]
 0046B30D    add         esp,0C
 0046B310    mov         eax,esi
 0046B312    pop         edi
 0046B313    pop         esi
 0046B314    pop         ebx
 0046B315    pop         ecx
 0046B316    pop         ecx
 0046B317    pop         ebp
 0046B318    ret         4
*}
end;

//0046B31C
constructor TMetafileCanvas.CreateWithComment(Description:string; CreatedBy:string; ReferenceDevice:HDC);
begin
{*
 0046B31C    push        ebp
 0046B31D    mov         ebp,esp
 0046B31F    add         esp,0FFFFFFE0
 0046B322    push        ebx
 0046B323    push        esi
 0046B324    push        edi
 0046B325    xor         ebx,ebx
 0046B327    mov         dword ptr [ebp-20],ebx
 0046B32A    test        dl,dl
>0046B32C    je          0046B336
 0046B32E    add         esp,0FFFFFFF0
 0046B331    call        @ClassCreate
 0046B336    mov         edi,ecx
 0046B338    mov         byte ptr [ebp-5],dl
 0046B33B    mov         dword ptr [ebp-4],eax
 0046B33E    mov         esi,dword ptr [ebp+8]
 0046B341    mov         ebx,dword ptr [ebp+0C]
 0046B344    xor         eax,eax
 0046B346    push        ebp
 0046B347    push        46B539
 0046B34C    push        dword ptr fs:[eax]
 0046B34F    mov         dword ptr fs:[eax],esp
 0046B352    xor         edx,edx
 0046B354    mov         eax,dword ptr [ebp-4]
 0046B357    call        TCanvas.Create
 0046B35C    mov         eax,dword ptr [ebp-4]
 0046B35F    mov         dword ptr [eax+58],edi
 0046B362    mov         eax,dword ptr [ebp+10]
 0046B365    mov         dword ptr [ebp-0C],eax
 0046B368    cmp         dword ptr [ebp+10],0
>0046B36C    jne         0046B378
 0046B36E    push        0
 0046B370    call        user32.GetDC
 0046B375    mov         dword ptr [ebp-0C],eax
 0046B378    xor         edx,edx
 0046B37A    push        ebp
 0046B37B    push        46B51C
 0046B380    push        dword ptr fs:[edx]
 0046B383    mov         dword ptr fs:[edx],esp
 0046B386    mov         eax,dword ptr [ebp-4]
 0046B389    mov         eax,dword ptr [eax+58]
 0046B38C    call        TMetafile.GetMMWidth
 0046B391    test        eax,eax
>0046B393    jne         0046B3F6
 0046B395    mov         eax,dword ptr [ebp-4]
 0046B398    mov         eax,dword ptr [eax+58]
 0046B39B    mov         edx,dword ptr [eax]
 0046B39D    call        dword ptr [edx+30]
 0046B3A0    test        eax,eax
>0046B3A2    jne         0046B3BF
 0046B3A4    push        4
 0046B3A6    mov         eax,dword ptr [ebp-0C]
 0046B3A9    push        eax
 0046B3AA    call        gdi32.GetDeviceCaps
 0046B3AF    imul        edx,eax,64
 0046B3B2    mov         eax,dword ptr [ebp-4]
 0046B3B5    mov         eax,dword ptr [eax+58]
 0046B3B8    call        TMetafile.SetMMWidth
>0046B3BD    jmp         0046B3F6
 0046B3BF    push        8
 0046B3C1    mov         eax,dword ptr [ebp-0C]
 0046B3C4    push        eax
 0046B3C5    call        gdi32.GetDeviceCaps
 0046B3CA    push        eax
 0046B3CB    push        4
 0046B3CD    mov         eax,dword ptr [ebp-0C]
 0046B3D0    push        eax
 0046B3D1    call        gdi32.GetDeviceCaps
 0046B3D6    imul        eax,eax,64
 0046B3D9    push        eax
 0046B3DA    mov         eax,dword ptr [ebp-4]
 0046B3DD    mov         edi,dword ptr [eax+58]
 0046B3E0    mov         eax,edi
 0046B3E2    mov         edx,dword ptr [eax]
 0046B3E4    call        dword ptr [edx+30]
 0046B3E7    push        eax
 0046B3E8    call        kernel32.MulDiv
 0046B3ED    mov         edx,eax
 0046B3EF    mov         eax,edi
 0046B3F1    call        TMetafile.SetMMWidth
 0046B3F6    mov         eax,dword ptr [ebp-4]
 0046B3F9    mov         eax,dword ptr [eax+58]
 0046B3FC    call        TMetafile.GetMMHeight
 0046B401    test        eax,eax
>0046B403    jne         0046B466
 0046B405    mov         eax,dword ptr [ebp-4]
 0046B408    mov         eax,dword ptr [eax+58]
 0046B40B    mov         edx,dword ptr [eax]
 0046B40D    call        dword ptr [edx+24]
 0046B410    test        eax,eax
>0046B412    jne         0046B42F
 0046B414    push        6
 0046B416    mov         eax,dword ptr [ebp-0C]
 0046B419    push        eax
 0046B41A    call        gdi32.GetDeviceCaps
 0046B41F    imul        edx,eax,64
 0046B422    mov         eax,dword ptr [ebp-4]
 0046B425    mov         eax,dword ptr [eax+58]
 0046B428    call        TMetafile.SetMMHeight
>0046B42D    jmp         0046B466
 0046B42F    push        0A
 0046B431    mov         eax,dword ptr [ebp-0C]
 0046B434    push        eax
 0046B435    call        gdi32.GetDeviceCaps
 0046B43A    push        eax
 0046B43B    push        6
 0046B43D    mov         eax,dword ptr [ebp-0C]
 0046B440    push        eax
 0046B441    call        gdi32.GetDeviceCaps
 0046B446    imul        eax,eax,64
 0046B449    push        eax
 0046B44A    mov         eax,dword ptr [ebp-4]
 0046B44D    mov         edi,dword ptr [eax+58]
 0046B450    mov         eax,edi
 0046B452    mov         edx,dword ptr [eax]
 0046B454    call        dword ptr [edx+24]
 0046B457    push        eax
 0046B458    call        kernel32.MulDiv
 0046B45D    mov         edx,eax
 0046B45F    mov         eax,edi
 0046B461    call        TMetafile.SetMMHeight
 0046B466    mov         eax,dword ptr [ebp-4]
 0046B469    mov         eax,dword ptr [eax+58]
 0046B46C    call        TMetafile.GetMMHeight
 0046B471    push        eax
 0046B472    lea         eax,[ebp-1C]
 0046B475    push        eax
 0046B476    mov         eax,dword ptr [ebp-4]
 0046B479    mov         eax,dword ptr [eax+58]
 0046B47C    call        TMetafile.GetMMWidth
 0046B481    mov         ecx,eax
 0046B483    xor         edx,edx
 0046B485    xor         eax,eax
 0046B487    call        Rect
 0046B48C    mov         eax,ebx
 0046B48E    test        eax,eax
>0046B490    je          0046B497
 0046B492    sub         eax,4
 0046B495    mov         eax,dword ptr [eax]
 0046B497    test        eax,eax
>0046B499    jle         0046B49F
 0046B49B    mov         al,1
>0046B49D    jmp         0046B4AF
 0046B49F    mov         eax,esi
 0046B4A1    test        eax,eax
>0046B4A3    je          0046B4AA
 0046B4A5    sub         eax,4
 0046B4A8    mov         eax,dword ptr [eax]
 0046B4AA    test        eax,eax
 0046B4AC    setg        al
 0046B4AF    test        al,al
>0046B4B1    je          0046B4D6
 0046B4B3    push        ebx
 0046B4B4    push        46B570;''
 0046B4B9    push        esi
 0046B4BA    push        46B580;''
 0046B4BF    lea         eax,[ebp-20]
 0046B4C2    mov         edx,4
 0046B4C7    call        @UStrCatN
 0046B4CC    mov         eax,dword ptr [ebp-20]
 0046B4CF    call        @UStrToPWChar
>0046B4D4    jmp         0046B4D8
 0046B4D6    xor         eax,eax
 0046B4D8    push        eax
 0046B4D9    lea         eax,[ebp-1C]
 0046B4DC    push        eax
 0046B4DD    push        0
 0046B4DF    mov         eax,dword ptr [ebp-0C]
 0046B4E2    push        eax
 0046B4E3    call        gdi32.CreateEnhMetaFileW
 0046B4E8    mov         ebx,eax
 0046B4EA    test        ebx,ebx
>0046B4EC    jne         0046B4F3
 0046B4EE    call        GDIError
 0046B4F3    mov         edx,ebx
 0046B4F5    mov         eax,dword ptr [ebp-4]
 0046B4F8    call        TCanvas.SetHandle
 0046B4FD    xor         eax,eax
 0046B4FF    pop         edx
 0046B500    pop         ecx
 0046B501    pop         ecx
 0046B502    mov         dword ptr fs:[eax],edx
 0046B505    push        46B523
 0046B50A    cmp         dword ptr [ebp+10],0
>0046B50E    jne         0046B51B
 0046B510    mov         eax,dword ptr [ebp-0C]
 0046B513    push        eax
 0046B514    push        0
 0046B516    call        user32.ReleaseDC
 0046B51B    ret
>0046B51C    jmp         @HandleFinally
>0046B521    jmp         0046B50A
 0046B523    xor         eax,eax
 0046B525    pop         edx
 0046B526    pop         ecx
 0046B527    pop         ecx
 0046B528    mov         dword ptr fs:[eax],edx
 0046B52B    push        46B540
 0046B530    lea         eax,[ebp-20]
 0046B533    call        @UStrClr
 0046B538    ret
>0046B539    jmp         @HandleFinally
>0046B53E    jmp         0046B530
 0046B540    mov         eax,dword ptr [ebp-4]
 0046B543    cmp         byte ptr [ebp-5],0
>0046B547    je          0046B558
 0046B549    call        @AfterConstruction
 0046B54E    pop         dword ptr fs:[0]
 0046B555    add         esp,0C
 0046B558    mov         eax,dword ptr [ebp-4]
 0046B55B    pop         edi
 0046B55C    pop         esi
 0046B55D    pop         ebx
 0046B55E    mov         esp,ebp
 0046B560    pop         ebp
 0046B561    ret         0C
*}
end;

//0046B588
destructor TMetafileCanvas.Destroy();
begin
{*
 0046B588    push        ebx
 0046B589    push        esi
 0046B58A    push        edi
 0046B58B    call        @BeforeDestruction
 0046B590    mov         ebx,edx
 0046B592    mov         edi,eax
 0046B594    mov         eax,edi
 0046B596    call        TCanvas.GetHandle
 0046B59B    mov         esi,eax
 0046B59D    xor         edx,edx
 0046B59F    mov         eax,edi
 0046B5A1    call        TCanvas.SetHandle
 0046B5A6    push        esi
 0046B5A7    call        gdi32.CloseEnhMetaFile
 0046B5AC    mov         edx,eax
 0046B5AE    mov         eax,dword ptr [edi+58]
 0046B5B1    call        TMetafile.SetHandle
 0046B5B6    mov         edx,ebx
 0046B5B8    and         dl,0FC
 0046B5BB    mov         eax,edi
 0046B5BD    call        TCanvas.Destroy
 0046B5C2    test        bl,bl
>0046B5C4    jle         0046B5CD
 0046B5C6    mov         eax,edi
 0046B5C8    call        @ClassDestroy
 0046B5CD    pop         edi
 0046B5CE    pop         esi
 0046B5CF    pop         ebx
 0046B5D0    ret
*}
end;

//0046B5D4
constructor TMetafile.Create();
begin
{*
 0046B5D4    push        ebx
 0046B5D5    push        esi
 0046B5D6    test        dl,dl
>0046B5D8    je          0046B5E2
 0046B5DA    add         esp,0FFFFFFF0
 0046B5DD    call        @ClassCreate
 0046B5E2    mov         ebx,edx
 0046B5E4    mov         esi,eax
 0046B5E6    xor         edx,edx
 0046B5E8    mov         eax,esi
 0046B5EA    call        TGraphic.Create
 0046B5EF    mov         byte ptr [esi+2C],1
 0046B5F3    mov         byte ptr [esi+21],1
 0046B5F7    xor         edx,edx
 0046B5F9    mov         eax,esi
 0046B5FB    mov         ecx,dword ptr [eax]
 0046B5FD    call        dword ptr [ecx+8]
 0046B600    mov         eax,esi
 0046B602    test        bl,bl
>0046B604    je          0046B615
 0046B606    call        @AfterConstruction
 0046B60B    pop         dword ptr fs:[0]
 0046B612    add         esp,0C
 0046B615    mov         eax,esi
 0046B617    pop         esi
 0046B618    pop         ebx
 0046B619    ret
*}
end;

//0046B61C
destructor TMetafile.Destroy();
begin
{*
 0046B61C    push        ebx
 0046B61D    push        esi
 0046B61E    call        @BeforeDestruction
 0046B623    mov         ebx,edx
 0046B625    mov         esi,eax
 0046B627    mov         eax,dword ptr [esi+28];TMetafile.FImage:TMetafileImage
 0046B62A    call        TSharedImage.Release
 0046B62F    mov         edx,ebx
 0046B631    and         dl,0FC
 0046B634    mov         eax,esi
 0046B636    call        TMemoryStream.Destroy
 0046B63B    test        bl,bl
>0046B63D    jle         0046B646
 0046B63F    mov         eax,esi
 0046B641    call        @ClassDestroy
 0046B646    pop         esi
 0046B647    pop         ebx
 0046B648    ret
*}
end;

//0046B64C
procedure TMetafile.Assign(Source:TPersistent);
begin
{*
 0046B64C    push        ebx
 0046B64D    push        esi
 0046B64E    push        edi
 0046B64F    mov         esi,edx
 0046B651    mov         ebx,eax
 0046B653    test        esi,esi
>0046B655    je          0046B668
 0046B657    mov         eax,esi
 0046B659    mov         edx,dword ptr ds:[4632EC];TMetafile
 0046B65F    call        @IsClass
 0046B664    test        al,al
>0046B666    je          0046B6D3
 0046B668    xor         edi,edi
 0046B66A    mov         eax,dword ptr [ebx+28]
 0046B66D    test        eax,eax
>0046B66F    je          0046B679
 0046B671    mov         edi,dword ptr [eax+14]
 0046B674    call        TSharedImage.Release
 0046B679    test        esi,esi
>0046B67B    je          0046B68E
 0046B67D    mov         eax,esi
 0046B67F    mov         edx,dword ptr [eax+28]
 0046B682    mov         dword ptr [ebx+28],edx
 0046B685    movzx       eax,byte ptr [eax+2C]
 0046B689    mov         byte ptr [ebx+2C],al
>0046B68C    jmp         0046B6A1
 0046B68E    mov         dl,1
 0046B690    mov         eax,[0046318C];TMetafileImage
 0046B695    call        TObject.Create
 0046B69A    mov         dword ptr [ebx+28],eax
 0046B69D    mov         byte ptr [ebx+2C],1
 0046B6A1    mov         eax,dword ptr [ebx+28]
 0046B6A4    call        TSharedImage.Reference
 0046B6A9    mov         eax,ebx
 0046B6AB    mov         edx,dword ptr [eax]
 0046B6AD    call        dword ptr [edx+28]
 0046B6B0    cmp         edi,eax
>0046B6B2    je          0046B6BF
 0046B6B4    mov         eax,ebx
 0046B6B6    mov         edx,dword ptr [eax]
 0046B6B8    call        dword ptr [edx+28]
 0046B6BB    test        eax,eax
>0046B6BD    jne         0046B6C3
 0046B6BF    xor         eax,eax
>0046B6C1    jmp         0046B6C5
 0046B6C3    mov         al,1
 0046B6C5    mov         byte ptr [ebx+22],al
 0046B6C8    mov         edx,ebx
 0046B6CA    mov         eax,ebx
 0046B6CC    mov         ecx,dword ptr [eax]
 0046B6CE    call        dword ptr [ecx+10]
>0046B6D1    jmp         0046B6DC
 0046B6D3    mov         edx,esi
 0046B6D5    mov         eax,ebx
 0046B6D7    call        TPersistent.Assign
 0046B6DC    pop         edi
 0046B6DD    pop         esi
 0046B6DE    pop         ebx
 0046B6DF    ret
*}
end;

//0046B6E0
procedure TMetafile.Clear;
begin
{*
 0046B6E0    call        TMetafile.NewImage
 0046B6E5    ret
*}
end;

//0046B6E8
procedure TMetafile.Draw(ACanvas:TCanvas; const Rect:TRect);
begin
{*
 0046B6E8    push        ebx
 0046B6E9    push        esi
 0046B6EA    push        edi
 0046B6EB    push        ebp
 0046B6EC    add         esp,0FFFFFFEC
 0046B6EF    mov         dword ptr [esp],ecx
 0046B6F2    mov         edi,edx
 0046B6F4    mov         ebx,eax
 0046B6F6    cmp         dword ptr [ebx+28],0
>0046B6FA    je          0046B770
 0046B6FC    mov         eax,ebx
 0046B6FE    mov         edx,dword ptr [eax]
 0046B700    call        dword ptr [edx+28]
 0046B703    mov         esi,eax
 0046B705    xor         ebp,ebp
 0046B707    test        esi,esi
>0046B709    je          0046B72A
 0046B70B    push        0FF
 0046B70D    push        esi
 0046B70E    mov         eax,edi
 0046B710    call        TCanvas.GetHandle
 0046B715    push        eax
 0046B716    call        gdi32.SelectPalette
 0046B71B    mov         ebp,eax
 0046B71D    mov         eax,edi
 0046B71F    call        TCanvas.GetHandle
 0046B724    push        eax
 0046B725    call        gdi32.RealizePalette
 0046B72A    mov         eax,dword ptr [esp]
 0046B72D    push        esi
 0046B72E    push        edi
 0046B72F    mov         esi,eax
 0046B731    lea         edi,[esp+0C]
 0046B735    movs        dword ptr [edi],dword ptr [esi]
 0046B736    movs        dword ptr [edi],dword ptr [esi]
 0046B737    movs        dword ptr [edi],dword ptr [esi]
 0046B738    movs        dword ptr [edi],dword ptr [esi]
 0046B739    pop         edi
 0046B73A    pop         esi
 0046B73B    dec         dword ptr [esp+0C]
 0046B73F    dec         dword ptr [esp+10]
 0046B743    lea         eax,[esp+4]
 0046B747    push        eax
 0046B748    mov         eax,dword ptr [ebx+28]
 0046B74B    mov         eax,dword ptr [eax+8]
 0046B74E    push        eax
 0046B74F    mov         eax,edi
 0046B751    call        TCanvas.GetHandle
 0046B756    push        eax
 0046B757    call        gdi32.PlayEnhMetaFile
 0046B75C    test        esi,esi
>0046B75E    je          0046B770
 0046B760    push        0FF
 0046B762    push        ebp
 0046B763    mov         eax,edi
 0046B765    call        TCanvas.GetHandle
 0046B76A    push        eax
 0046B76B    call        gdi32.SelectPalette
 0046B770    add         esp,14
 0046B773    pop         ebp
 0046B774    pop         edi
 0046B775    pop         esi
 0046B776    pop         ebx
 0046B777    ret
*}
end;

//0046B778
function TMetafile.GetAuthor:UnicodeString;
begin
{*
 0046B778    push        ebx
 0046B779    push        esi
 0046B77A    push        edi
 0046B77B    mov         esi,edx
 0046B77D    mov         ebx,eax
 0046B77F    mov         eax,esi
 0046B781    call        @UStrClr
 0046B786    mov         eax,dword ptr [ebx+28]
 0046B789    test        eax,eax
>0046B78B    je          0046B7D9
 0046B78D    cmp         dword ptr [eax+8],0
>0046B791    je          0046B7D9
 0046B793    push        0
 0046B795    push        0
 0046B797    mov         eax,dword ptr [eax+8]
 0046B79A    push        eax
 0046B79B    call        gdi32.GetEnhMetaFileDescriptionW
 0046B7A0    mov         edi,eax
 0046B7A2    test        edi,edi
>0046B7A4    jle         0046B7D9
 0046B7A6    mov         eax,esi
 0046B7A8    mov         edx,edi
 0046B7AA    call        @UStrSetLength
 0046B7AF    mov         eax,dword ptr [esi]
 0046B7B1    call        @UStrToPWChar
 0046B7B6    push        eax
 0046B7B7    push        edi
 0046B7B8    mov         eax,dword ptr [ebx+28]
 0046B7BB    mov         eax,dword ptr [eax+8]
 0046B7BE    push        eax
 0046B7BF    call        gdi32.GetEnhMetaFileDescriptionW
 0046B7C4    mov         eax,dword ptr [esi]
 0046B7C6    call        @UStrToPWChar
 0046B7CB    call        StrLen
 0046B7D0    mov         edx,eax
 0046B7D2    mov         eax,esi
 0046B7D4    call        @UStrSetLength
 0046B7D9    pop         edi
 0046B7DA    pop         esi
 0046B7DB    pop         ebx
 0046B7DC    ret
*}
end;

//0046B7E0
function TMetafile.GetDesc:UnicodeString;
begin
{*
 0046B7E0    push        ebx
 0046B7E1    push        esi
 0046B7E2    push        edi
 0046B7E3    mov         ebx,edx
 0046B7E5    mov         esi,eax
 0046B7E7    mov         eax,ebx
 0046B7E9    call        @UStrClr
 0046B7EE    mov         eax,dword ptr [esi+28]
 0046B7F1    test        eax,eax
>0046B7F3    je          0046B85C
 0046B7F5    cmp         dword ptr [eax+8],0
>0046B7F9    je          0046B85C
 0046B7FB    push        0
 0046B7FD    push        0
 0046B7FF    mov         eax,dword ptr [eax+8]
 0046B802    push        eax
 0046B803    call        gdi32.GetEnhMetaFileDescriptionW
 0046B808    mov         edi,eax
 0046B80A    test        edi,edi
>0046B80C    jle         0046B85C
 0046B80E    mov         eax,ebx
 0046B810    mov         edx,edi
 0046B812    call        @UStrSetLength
 0046B817    mov         eax,dword ptr [ebx]
 0046B819    call        @UStrToPWChar
 0046B81E    push        eax
 0046B81F    push        edi
 0046B820    mov         eax,dword ptr [esi+28]
 0046B823    mov         eax,dword ptr [eax+8]
 0046B826    push        eax
 0046B827    call        gdi32.GetEnhMetaFileDescriptionW
 0046B82C    mov         eax,dword ptr [ebx]
 0046B82E    call        @UStrToPWChar
 0046B833    call        StrLen
 0046B838    mov         ecx,eax
 0046B83A    inc         ecx
 0046B83B    mov         eax,ebx
 0046B83D    mov         edx,1
 0046B842    call        @UStrDelete
 0046B847    mov         eax,dword ptr [ebx]
 0046B849    call        @UStrToPWChar
 0046B84E    call        StrLen
 0046B853    mov         edx,eax
 0046B855    mov         eax,ebx
 0046B857    call        @UStrSetLength
 0046B85C    pop         edi
 0046B85D    pop         esi
 0046B85E    pop         ebx
 0046B85F    ret
*}
end;

//0046B860
function TMetafile.GetEmpty:Boolean;
begin
{*
 0046B860    cmp         dword ptr [eax+28],0
 0046B864    sete        al
 0046B867    ret
*}
end;

//0046B868
function TMetafile.GetHandle:THandle;
begin
{*
 0046B868    mov         edx,dword ptr [eax+28]
 0046B86B    test        edx,edx
>0046B86D    je          0046B873
 0046B86F    mov         eax,dword ptr [edx+8]
 0046B872    ret
 0046B873    xor         eax,eax
 0046B875    ret
*}
end;

//0046B878
function TMetafile.HandleAllocated:Boolean;
begin
{*
 0046B878    mov         edx,dword ptr [eax+28]
 0046B87B    test        edx,edx
>0046B87D    je          0046B885
 0046B87F    cmp         dword ptr [edx+8],0
>0046B883    jne         0046B888
 0046B885    xor         eax,eax
 0046B887    ret
 0046B888    mov         al,1
 0046B88A    ret
*}
end;

//0046B88C
function TMetafile.GetHeight:Integer;
begin
{*
 0046B88C    push        ebx
 0046B88D    add         esp,0FFFFFF9C
 0046B890    mov         ebx,eax
 0046B892    cmp         dword ptr [ebx+28],0
>0046B896    jne         0046B89F
 0046B898    mov         eax,ebx
 0046B89A    call        TMetafile.NewImage
 0046B89F    mov         ebx,dword ptr [ebx+28]
 0046B8A2    cmp         word ptr [ebx+18],0
>0046B8A7    jne         0046B8D4
 0046B8A9    mov         eax,dword ptr [ebx+8]
 0046B8AC    test        eax,eax
>0046B8AE    jne         0046B8B5
 0046B8B0    mov         eax,dword ptr [ebx+20]
>0046B8B3    jmp         0046B8E8
 0046B8B5    push        esp
 0046B8B6    push        64
 0046B8B8    push        eax
 0046B8B9    call        gdi32.GetEnhMetaFileHeader
 0046B8BE    imul        eax,dword ptr [esp+54],64
 0046B8C3    push        eax
 0046B8C4    mov         eax,dword ptr [esp+50]
 0046B8C8    push        eax
 0046B8C9    mov         eax,dword ptr [ebx+10]
 0046B8CC    push        eax
 0046B8CD    call        kernel32.MulDiv
>0046B8D2    jmp         0046B8E8
 0046B8D4    push        9EC
 0046B8D9    mov         eax,[00793058]
 0046B8DE    push        eax
 0046B8DF    mov         eax,dword ptr [ebx+10]
 0046B8E2    push        eax
 0046B8E3    call        kernel32.MulDiv
 0046B8E8    add         esp,64
 0046B8EB    pop         ebx
 0046B8EC    ret
*}
end;

//0046B8F0
function TMetafile.GetInch:Word;
begin
{*
 0046B8F0    xor         edx,edx
 0046B8F2    mov         ecx,dword ptr [eax+28]
 0046B8F5    test        ecx,ecx
>0046B8F7    je          0046B8FD
 0046B8F9    movzx       edx,word ptr [ecx+18]
 0046B8FD    mov         eax,edx
 0046B8FF    ret
*}
end;

//0046B900
function TMetafile.GetMMHeight:Integer;
begin
{*
 0046B900    push        ebx
 0046B901    mov         ebx,eax
 0046B903    cmp         dword ptr [ebx+28],0
>0046B907    jne         0046B910
 0046B909    mov         eax,ebx
 0046B90B    call        TMetafile.NewImage
 0046B910    mov         eax,dword ptr [ebx+28]
 0046B913    mov         eax,dword ptr [eax+10]
 0046B916    pop         ebx
 0046B917    ret
*}
end;

//0046B918
function TMetafile.GetMMWidth:Integer;
begin
{*
 0046B918    push        ebx
 0046B919    mov         ebx,eax
 0046B91B    cmp         dword ptr [ebx+28],0
>0046B91F    jne         0046B928
 0046B921    mov         eax,ebx
 0046B923    call        TMetafile.NewImage
 0046B928    mov         eax,dword ptr [ebx+28]
 0046B92B    mov         eax,dword ptr [eax+0C]
 0046B92E    pop         ebx
 0046B92F    ret
*}
end;

//0046B930
function TMetafile.GetPalette:HPALETTE;
begin
{*
 0046B930    push        ebx
 0046B931    push        esi
 0046B932    push        edi
 0046B933    add         esp,0FFFFFBFC
 0046B939    mov         ebx,eax
 0046B93B    xor         edi,edi
 0046B93D    mov         eax,dword ptr [ebx+28]
 0046B940    test        eax,eax
>0046B942    je          0046B9AD
 0046B944    cmp         dword ptr [eax+8],0
>0046B948    je          0046B9AD
 0046B94A    cmp         dword ptr [eax+14],0
>0046B94E    jne         0046B9A7
 0046B950    push        0
 0046B952    push        0
 0046B954    mov         eax,dword ptr [eax+8]
 0046B957    push        eax
 0046B958    call        gdi32.GetEnhMetaFilePaletteEntries
 0046B95D    mov         esi,eax
 0046B95F    test        esi,esi
>0046B961    je          0046B9AD
 0046B963    cmp         esi,100
>0046B969    jle         0046B971
 0046B96B    and         esi,0FF
 0046B971    mov         eax,dword ptr [ebx+28]
 0046B974    mov         eax,dword ptr [eax+14]
 0046B977    call        InternalDeletePalette
 0046B97C    mov         word ptr [esp],300
 0046B982    mov         word ptr [esp+2],si
 0046B987    lea         eax,[esp+4]
 0046B98B    push        eax
 0046B98C    push        esi
 0046B98D    mov         eax,dword ptr [ebx+28]
 0046B990    mov         eax,dword ptr [eax+8]
 0046B993    push        eax
 0046B994    call        gdi32.GetEnhMetaFilePaletteEntries
 0046B999    mov         eax,esp
 0046B99B    push        eax
 0046B99C    call        gdi32.CreatePalette
 0046B9A1    mov         edx,dword ptr [ebx+28]
 0046B9A4    mov         dword ptr [edx+14],eax
 0046B9A7    mov         eax,dword ptr [ebx+28]
 0046B9AA    mov         edi,dword ptr [eax+14]
 0046B9AD    mov         eax,edi
 0046B9AF    add         esp,404
 0046B9B5    pop         edi
 0046B9B6    pop         esi
 0046B9B7    pop         ebx
 0046B9B8    ret
*}
end;

//0046B9BC
function TMetafile.GetWidth:Integer;
begin
{*
 0046B9BC    push        ebx
 0046B9BD    add         esp,0FFFFFF9C
 0046B9C0    mov         ebx,eax
 0046B9C2    cmp         dword ptr [ebx+28],0
>0046B9C6    jne         0046B9CF
 0046B9C8    mov         eax,ebx
 0046B9CA    call        TMetafile.NewImage
 0046B9CF    mov         ebx,dword ptr [ebx+28]
 0046B9D2    cmp         word ptr [ebx+18],0
>0046B9D7    jne         0046BA04
 0046B9D9    mov         eax,dword ptr [ebx+8]
 0046B9DC    test        eax,eax
>0046B9DE    jne         0046B9E5
 0046B9E0    mov         eax,dword ptr [ebx+1C]
>0046B9E3    jmp         0046BA18
 0046B9E5    push        esp
 0046B9E6    push        64
 0046B9E8    push        eax
 0046B9E9    call        gdi32.GetEnhMetaFileHeader
 0046B9EE    imul        eax,dword ptr [esp+50],64
 0046B9F3    push        eax
 0046B9F4    mov         eax,dword ptr [esp+4C]
 0046B9F8    push        eax
 0046B9F9    mov         eax,dword ptr [ebx+0C]
 0046B9FC    push        eax
 0046B9FD    call        kernel32.MulDiv
>0046BA02    jmp         0046BA18
 0046BA04    push        9EC
 0046BA09    mov         eax,[00793058]
 0046BA0E    push        eax
 0046BA0F    mov         eax,dword ptr [ebx+0C]
 0046BA12    push        eax
 0046BA13    call        kernel32.MulDiv
 0046BA18    add         esp,64
 0046BA1B    pop         ebx
 0046BA1C    ret
*}
end;

//0046BA20
procedure TMetafile.LoadFromStream(Stream:TStream);
begin
{*
 0046BA20    push        ebx
 0046BA21    push        esi
 0046BA22    mov         esi,edx
 0046BA24    mov         ebx,eax
 0046BA26    mov         edx,esi
 0046BA28    mov         eax,ebx
 0046BA2A    call        TMetafile.TestEMF
 0046BA2F    test        al,al
>0046BA31    je          0046BA3E
 0046BA33    mov         edx,esi
 0046BA35    mov         eax,ebx
 0046BA37    call        TMetafile.ReadEMFStream
>0046BA3C    jmp         0046BA58
 0046BA3E    mov         eax,esi
 0046BA40    mov         edx,dword ptr [eax]
 0046BA42    call        dword ptr [edx]
 0046BA44    push        eax
 0046BA45    mov         eax,esi
 0046BA47    call        TStream.GetPosition
 0046BA4C    pop         ecx
 0046BA4D    sub         ecx,eax
 0046BA4F    mov         edx,esi
 0046BA51    mov         eax,ebx
 0046BA53    call        TMetafile.ReadWMFStream
 0046BA58    mov         eax,ebx
 0046BA5A    mov         edx,dword ptr [eax]
 0046BA5C    call        dword ptr [edx+28]
 0046BA5F    test        eax,eax
 0046BA61    setne       al
 0046BA64    mov         byte ptr [ebx+22],al
 0046BA67    mov         edx,ebx
 0046BA69    mov         eax,ebx
 0046BA6B    mov         ecx,dword ptr [eax]
 0046BA6D    call        dword ptr [ecx+10]
 0046BA70    pop         esi
 0046BA71    pop         ebx
 0046BA72    ret
*}
end;

//0046BA74
procedure TMetafile.NewImage;
begin
{*
 0046BA74    push        ebx
 0046BA75    push        esi
 0046BA76    mov         ebx,eax
 0046BA78    mov         eax,dword ptr [ebx+28]
 0046BA7B    call        TSharedImage.Release
 0046BA80    mov         dl,1
 0046BA82    mov         eax,[0046318C];TMetafileImage
 0046BA87    call        TObject.Create
 0046BA8C    mov         esi,eax
 0046BA8E    mov         dword ptr [ebx+28],esi
 0046BA91    mov         eax,esi
 0046BA93    call        TSharedImage.Reference
 0046BA98    pop         esi
 0046BA99    pop         ebx
 0046BA9A    ret
*}
end;

//0046BA9C
procedure TMetafile.ReadData(Stream:TStream);
begin
{*
 0046BA9C    push        ebx
 0046BA9D    push        esi
 0046BA9E    push        edi
 0046BA9F    push        ecx
 0046BAA0    mov         esi,edx
 0046BAA2    mov         ebx,eax
 0046BAA4    mov         edx,esp
 0046BAA6    mov         ecx,4
 0046BAAB    mov         eax,esi
 0046BAAD    mov         edi,dword ptr [eax]
 0046BAAF    call        dword ptr [edi+0C]
 0046BAB2    cmp         dword ptr [esp],4
>0046BAB6    jg          0046BAC3
 0046BAB8    xor         edx,edx
 0046BABA    mov         eax,ebx
 0046BABC    mov         ecx,dword ptr [eax]
 0046BABE    call        dword ptr [ecx+8]
>0046BAC1    jmp         0046BAEA
 0046BAC3    mov         edx,esi
 0046BAC5    mov         eax,ebx
 0046BAC7    call        TMetafile.TestEMF
 0046BACC    test        al,al
>0046BACE    je          0046BADB
 0046BAD0    mov         edx,esi
 0046BAD2    mov         eax,ebx
 0046BAD4    call        TMetafile.ReadEMFStream
>0046BAD9    jmp         0046BAEA
 0046BADB    mov         ecx,dword ptr [esp]
 0046BADE    sub         ecx,4
 0046BAE1    mov         edx,esi
 0046BAE3    mov         eax,ebx
 0046BAE5    call        TMetafile.ReadWMFStream
 0046BAEA    mov         eax,ebx
 0046BAEC    mov         edx,dword ptr [eax]
 0046BAEE    call        dword ptr [edx+28]
 0046BAF1    test        eax,eax
 0046BAF3    setne       al
 0046BAF6    mov         byte ptr [ebx+22],al
 0046BAF9    mov         edx,ebx
 0046BAFB    mov         eax,ebx
 0046BAFD    mov         ecx,dword ptr [eax]
 0046BAFF    call        dword ptr [ecx+10]
 0046BB02    pop         edx
 0046BB03    pop         edi
 0046BB04    pop         esi
 0046BB05    pop         ebx
 0046BB06    ret
*}
end;

//0046BB08
procedure TMetafile.ReadEMFStream(Stream:TStream);
begin
{*
 0046BB08    push        ebp
 0046BB09    mov         ebp,esp
 0046BB0B    add         esp,0FFFFFF98
 0046BB0E    push        ebx
 0046BB0F    push        esi
 0046BB10    push        edi
 0046BB11    mov         edi,edx
 0046BB13    mov         esi,eax
 0046BB15    mov         eax,esi
 0046BB17    call        TMetafile.NewImage
 0046BB1C    lea         edx,[ebp-68]
 0046BB1F    mov         ecx,64
 0046BB24    mov         eax,edi
 0046BB26    call        TStream.ReadBuffer
 0046BB2B    cmp         dword ptr [ebp-40],464D4520
>0046BB32    je          0046BB39
 0046BB34    call        InvalidMetafile
 0046BB39    mov         eax,dword ptr [ebp-38]
 0046BB3C    call        @GetMem
 0046BB41    mov         dword ptr [ebp-4],eax
 0046BB44    mov         ebx,dword ptr [esi+28]
 0046BB47    xor         eax,eax
 0046BB49    push        ebp
 0046BB4A    push        46BBC8
 0046BB4F    push        dword ptr fs:[eax]
 0046BB52    mov         dword ptr fs:[eax],esp
 0046BB55    mov         edx,dword ptr [ebp-4]
 0046BB58    lea         eax,[ebp-68]
 0046BB5B    mov         ecx,64
 0046BB60    call        Move
 0046BB65    mov         ecx,dword ptr [ebp-38]
 0046BB68    sub         ecx,64
 0046BB6B    mov         edx,dword ptr [ebp-4]
 0046BB6E    add         edx,64
 0046BB71    mov         eax,edi
 0046BB73    call        TStream.ReadBuffer
 0046BB78    mov         eax,dword ptr [ebp-4]
 0046BB7B    push        eax
 0046BB7C    mov         eax,dword ptr [ebp-38]
 0046BB7F    push        eax
 0046BB80    call        gdi32.SetEnhMetaFileBits
 0046BB85    mov         edi,eax
 0046BB87    mov         dword ptr [ebx+8],edi
 0046BB8A    test        edi,edi
>0046BB8C    jne         0046BB93
 0046BB8E    call        InvalidMetafile
 0046BB93    mov         word ptr [ebx+18],0
 0046BB99    mov         eax,dword ptr [ebp-48]
 0046BB9C    sub         eax,dword ptr [ebp-50]
 0046BB9F    mov         dword ptr [ebx+0C],eax
 0046BBA2    mov         eax,dword ptr [ebp-44]
 0046BBA5    sub         eax,dword ptr [ebp-4C]
 0046BBA8    mov         dword ptr [ebx+10],eax
 0046BBAB    mov         byte ptr [esi+2C],1
 0046BBAF    xor         eax,eax
 0046BBB1    pop         edx
 0046BBB2    pop         ecx
 0046BBB3    pop         ecx
 0046BBB4    mov         dword ptr fs:[eax],edx
 0046BBB7    push        46BBCF
 0046BBBC    mov         edx,dword ptr [ebp-38]
 0046BBBF    mov         eax,dword ptr [ebp-4]
 0046BBC2    call        @FreeMem
 0046BBC7    ret
>0046BBC8    jmp         @HandleFinally
>0046BBCD    jmp         0046BBBC
 0046BBCF    pop         edi
 0046BBD0    pop         esi
 0046BBD1    pop         ebx
 0046BBD2    mov         esp,ebp
 0046BBD4    pop         ebp
 0046BBD5    ret
*}
end;

//0046BBD8
procedure TMetafile.ReadWMFStream(Stream:TStream; Length:LongInt);
begin
{*
 0046BBD8    push        ebp
 0046BBD9    mov         ebp,esp
 0046BBDB    add         esp,0FFFFFF68
 0046BBE1    push        ebx
 0046BBE2    push        esi
 0046BBE3    push        edi
 0046BBE4    mov         dword ptr [ebp-8],ecx
 0046BBE7    mov         dword ptr [ebp-4],edx
 0046BBEA    mov         esi,eax
 0046BBEC    mov         eax,esi
 0046BBEE    call        TMetafile.NewImage
 0046BBF3    lea         edx,[ebp-22]
 0046BBF6    mov         ecx,16
 0046BBFB    mov         eax,dword ptr [ebp-4]
 0046BBFE    mov         ebx,dword ptr [eax]
 0046BC00    call        dword ptr [ebx+0C]
 0046BC03    cmp         dword ptr [ebp-22],9AC6CDD7
>0046BC0A    jne         0046BC1A
 0046BC0C    lea         eax,[ebp-22]
 0046BC0F    call        ComputeAldusChecksum
 0046BC14    cmp         ax,word ptr [ebp-0E]
>0046BC18    je          0046BC1F
 0046BC1A    call        InvalidMetafile
 0046BC1F    sub         dword ptr [ebp-8],16
 0046BC23    mov         eax,dword ptr [ebp-8]
 0046BC26    call        @GetMem
 0046BC2B    mov         dword ptr [ebp-0C],eax
 0046BC2E    mov         ebx,dword ptr [esi+28]
 0046BC31    xor         eax,eax
 0046BC33    push        ebp
 0046BC34    push        46BD47
 0046BC39    push        dword ptr fs:[eax]
 0046BC3C    mov         dword ptr fs:[eax],esp
 0046BC3F    mov         edx,dword ptr [ebp-0C]
 0046BC42    mov         ecx,dword ptr [ebp-8]
 0046BC45    mov         eax,dword ptr [ebp-4]
 0046BC48    mov         edi,dword ptr [eax]
 0046BC4A    call        dword ptr [edi+0C]
 0046BC4D    mov         eax,dword ptr [esi+28]
 0046BC50    movzx       edx,word ptr [ebp-14]
 0046BC54    mov         word ptr [eax+18],dx
 0046BC58    cmp         word ptr [ebp-14],0
>0046BC5D    jne         0046BC65
 0046BC5F    mov         word ptr [ebp-14],60
 0046BC65    movzx       eax,word ptr [ebp-14]
 0046BC69    push        eax
 0046BC6A    push        9EC
 0046BC6F    movsx       eax,word ptr [ebp-18]
 0046BC73    movsx       edx,word ptr [ebp-1C]
 0046BC77    sub         eax,edx
 0046BC79    push        eax
 0046BC7A    call        kernel32.MulDiv
 0046BC7F    mov         dword ptr [ebx+0C],eax
 0046BC82    movzx       eax,word ptr [ebp-14]
 0046BC86    push        eax
 0046BC87    push        9EC
 0046BC8C    movsx       eax,word ptr [ebp-16]
 0046BC90    movsx       edx,word ptr [ebp-1A]
 0046BC94    sub         eax,edx
 0046BC96    push        eax
 0046BC97    call        kernel32.MulDiv
 0046BC9C    mov         dword ptr [ebx+10],eax
 0046BC9F    mov         dword ptr [ebp-32],8
 0046BCA6    xor         eax,eax
 0046BCA8    mov         dword ptr [ebp-2E],eax
 0046BCAB    xor         eax,eax
 0046BCAD    mov         dword ptr [ebp-2A],eax
 0046BCB0    xor         eax,eax
 0046BCB2    mov         dword ptr [ebp-26],eax
 0046BCB5    lea         eax,[ebp-32]
 0046BCB8    push        eax
 0046BCB9    push        0
 0046BCBB    mov         eax,dword ptr [ebp-0C]
 0046BCBE    push        eax
 0046BCBF    mov         eax,dword ptr [ebp-8]
 0046BCC2    push        eax
 0046BCC3    call        gdi32.SetWinMetaFileBits
 0046BCC8    mov         edi,eax
 0046BCCA    mov         dword ptr [ebx+8],edi
 0046BCCD    test        edi,edi
>0046BCCF    jne         0046BCD6
 0046BCD1    call        InvalidMetafile
 0046BCD6    lea         eax,[ebp-96]
 0046BCDC    push        eax
 0046BCDD    push        64
 0046BCDF    mov         eax,dword ptr [ebx+8]
 0046BCE2    push        eax
 0046BCE3    call        gdi32.GetEnhMetaFileHeader
 0046BCE8    mov         dword ptr [ebp-32],8
 0046BCEF    mov         eax,dword ptr [ebp-76]
 0046BCF2    mov         dword ptr [ebp-2E],eax
 0046BCF5    mov         eax,dword ptr [ebp-72]
 0046BCF8    mov         dword ptr [ebp-2A],eax
 0046BCFB    xor         eax,eax
 0046BCFD    mov         dword ptr [ebp-26],eax
 0046BD00    mov         eax,dword ptr [ebx+8]
 0046BD03    push        eax
 0046BD04    call        gdi32.DeleteEnhMetaFile
 0046BD09    lea         eax,[ebp-32]
 0046BD0C    push        eax
 0046BD0D    push        0
 0046BD0F    mov         eax,dword ptr [ebp-0C]
 0046BD12    push        eax
 0046BD13    mov         eax,dword ptr [ebp-8]
 0046BD16    push        eax
 0046BD17    call        gdi32.SetWinMetaFileBits
 0046BD1C    mov         edi,eax
 0046BD1E    mov         dword ptr [ebx+8],edi
 0046BD21    test        edi,edi
>0046BD23    jne         0046BD2A
 0046BD25    call        InvalidMetafile
 0046BD2A    mov         byte ptr [esi+2C],0
 0046BD2E    xor         eax,eax
 0046BD30    pop         edx
 0046BD31    pop         ecx
 0046BD32    pop         ecx
 0046BD33    mov         dword ptr fs:[eax],edx
 0046BD36    push        46BD4E
 0046BD3B    mov         edx,dword ptr [ebp-8]
 0046BD3E    mov         eax,dword ptr [ebp-0C]
 0046BD41    call        @FreeMem
 0046BD46    ret
>0046BD47    jmp         @HandleFinally
>0046BD4C    jmp         0046BD3B
 0046BD4E    pop         edi
 0046BD4F    pop         esi
 0046BD50    pop         ebx
 0046BD51    mov         esp,ebp
 0046BD53    pop         ebp
 0046BD54    ret
*}
end;

//0046BD58
procedure TMetafile.SaveToFile(Filename:string);
begin
{*
 0046BD58    push        ebp
 0046BD59    mov         ebp,esp
 0046BD5B    add         esp,0FFFFFFF0
 0046BD5E    push        ebx
 0046BD5F    xor         ecx,ecx
 0046BD61    mov         dword ptr [ebp-0C],ecx
 0046BD64    mov         dword ptr [ebp-10],ecx
 0046BD67    mov         ebx,edx
 0046BD69    mov         dword ptr [ebp-4],eax
 0046BD6C    xor         eax,eax
 0046BD6E    push        ebp
 0046BD6F    push        46BE01
 0046BD74    push        dword ptr fs:[eax]
 0046BD77    mov         dword ptr fs:[eax],esp
 0046BD7A    mov         eax,dword ptr [ebp-4]
 0046BD7D    movzx       eax,byte ptr [eax+2C]
 0046BD81    mov         byte ptr [ebp-5],al
 0046BD84    xor         eax,eax
 0046BD86    push        ebp
 0046BD87    push        46BDDF
 0046BD8C    push        dword ptr fs:[eax]
 0046BD8F    mov         dword ptr fs:[eax],esp
 0046BD92    lea         edx,[ebp-10]
 0046BD95    mov         eax,ebx
 0046BD97    call        ExtractFileExt
 0046BD9C    mov         eax,dword ptr [ebp-10]
 0046BD9F    lea         edx,[ebp-0C]
 0046BDA2    call        AnsiLowerCaseFileName
 0046BDA7    mov         eax,dword ptr [ebp-0C]
 0046BDAA    mov         edx,46BE1C;'.wmf'
 0046BDAF    call        @UStrEqual
>0046BDB4    jne         0046BDBD
 0046BDB6    mov         eax,dword ptr [ebp-4]
 0046BDB9    mov         byte ptr [eax+2C],0
 0046BDBD    mov         edx,ebx
 0046BDBF    mov         eax,dword ptr [ebp-4]
 0046BDC2    call        TGraphic.SaveToFile
 0046BDC7    xor         eax,eax
 0046BDC9    pop         edx
 0046BDCA    pop         ecx
 0046BDCB    pop         ecx
 0046BDCC    mov         dword ptr fs:[eax],edx
 0046BDCF    push        46BDE6
 0046BDD4    mov         eax,dword ptr [ebp-4]
 0046BDD7    movzx       edx,byte ptr [ebp-5]
 0046BDDB    mov         byte ptr [eax+2C],dl
 0046BDDE    ret
>0046BDDF    jmp         @HandleFinally
>0046BDE4    jmp         0046BDD4
 0046BDE6    xor         eax,eax
 0046BDE8    pop         edx
 0046BDE9    pop         ecx
 0046BDEA    pop         ecx
 0046BDEB    mov         dword ptr fs:[eax],edx
 0046BDEE    push        46BE08
 0046BDF3    lea         eax,[ebp-10]
 0046BDF6    mov         edx,2
 0046BDFB    call        @UStrArrayClr
 0046BE00    ret
>0046BE01    jmp         @HandleFinally
>0046BE06    jmp         0046BDF3
 0046BE08    pop         ebx
 0046BE09    mov         esp,ebp
 0046BE0B    pop         ebp
 0046BE0C    ret
*}
end;

//0046BE28
procedure TMetafile.SaveToStream(Stream:TStream);
begin
{*
 0046BE28    cmp         dword ptr [eax+28],0
>0046BE2C    je          0046BE40
 0046BE2E    cmp         byte ptr [eax+2C],0
>0046BE32    je          0046BE3B
 0046BE34    call        TMetafile.WriteEMFStream
>0046BE39    jmp         0046BE40
 0046BE3B    call        TMetafile.WriteWMFStream
 0046BE40    ret
*}
end;

//0046BE44
procedure TMetafile.SetHandle(Value:THandle);
begin
{*
 0046BE44    push        ebx
 0046BE45    push        esi
 0046BE46    add         esp,0FFFFFF9C
 0046BE49    mov         esi,edx
 0046BE4B    mov         ebx,eax
 0046BE4D    test        esi,esi
>0046BE4F    je          0046BE63
 0046BE51    push        esp
 0046BE52    push        64
 0046BE54    push        esi
 0046BE55    call        gdi32.GetEnhMetaFileHeader
 0046BE5A    test        eax,eax
>0046BE5C    jne         0046BE63
 0046BE5E    call        InvalidMetafile
 0046BE63    mov         eax,ebx
 0046BE65    call        TMetafile.UniqueImage
 0046BE6A    mov         eax,dword ptr [ebx+28]
 0046BE6D    mov         eax,dword ptr [eax+8]
 0046BE70    test        eax,eax
>0046BE72    je          0046BE7A
 0046BE74    push        eax
 0046BE75    call        gdi32.DeleteEnhMetaFile
 0046BE7A    mov         eax,dword ptr [ebx+28]
 0046BE7D    mov         eax,dword ptr [eax+14]
 0046BE80    call        InternalDeletePalette
 0046BE85    mov         eax,dword ptr [ebx+28]
 0046BE88    xor         edx,edx
 0046BE8A    mov         dword ptr [eax+14],edx
 0046BE8D    mov         dword ptr [eax+8],esi
 0046BE90    xor         edx,edx
 0046BE92    mov         dword ptr [eax+1C],edx
 0046BE95    xor         edx,edx
 0046BE97    mov         dword ptr [eax+20],edx
 0046BE9A    test        esi,esi
>0046BE9C    je          0046BEB4
 0046BE9E    mov         edx,dword ptr [esp+20]
 0046BEA2    sub         edx,dword ptr [esp+18]
 0046BEA6    mov         dword ptr [eax+0C],edx
 0046BEA9    mov         edx,dword ptr [esp+24]
 0046BEAD    sub         edx,dword ptr [esp+1C]
 0046BEB1    mov         dword ptr [eax+10],edx
 0046BEB4    mov         eax,ebx
 0046BEB6    mov         edx,dword ptr [eax]
 0046BEB8    call        dword ptr [edx+28]
 0046BEBB    test        eax,eax
 0046BEBD    setne       al
 0046BEC0    mov         byte ptr [ebx+22],al
 0046BEC3    mov         edx,ebx
 0046BEC5    mov         eax,ebx
 0046BEC7    mov         ecx,dword ptr [eax]
 0046BEC9    call        dword ptr [ecx+10]
 0046BECC    add         esp,64
 0046BECF    pop         esi
 0046BED0    pop         ebx
 0046BED1    ret
*}
end;

//0046BED4
procedure TMetafile.SetHeight(Value:Integer);
begin
{*
 0046BED4    push        ebx
 0046BED5    push        esi
 0046BED6    add         esp,0FFFFFF9C
 0046BED9    mov         esi,edx
 0046BEDB    mov         ebx,eax
 0046BEDD    cmp         dword ptr [ebx+28],0
>0046BEE1    jne         0046BEEA
 0046BEE3    mov         eax,ebx
 0046BEE5    call        TMetafile.NewImage
 0046BEEA    mov         eax,dword ptr [ebx+28]
 0046BEED    cmp         word ptr [eax+18],0
>0046BEF2    jne         0046BF25
 0046BEF4    mov         edx,dword ptr [eax+8]
 0046BEF7    test        edx,edx
>0046BEF9    jne         0046BF00
 0046BEFB    mov         dword ptr [eax+20],esi
>0046BEFE    jmp         0046BF3F
 0046BF00    push        esp
 0046BF01    push        64
 0046BF03    push        edx
 0046BF04    call        gdi32.GetEnhMetaFileHeader
 0046BF09    mov         eax,dword ptr [esp+4C]
 0046BF0D    push        eax
 0046BF0E    imul        eax,dword ptr [esp+58],64
 0046BF13    push        eax
 0046BF14    push        esi
 0046BF15    call        kernel32.MulDiv
 0046BF1A    mov         edx,eax
 0046BF1C    mov         eax,ebx
 0046BF1E    call        TMetafile.SetMMHeight
>0046BF23    jmp         0046BF3F
 0046BF25    mov         eax,[00793058]
 0046BF2A    push        eax
 0046BF2B    push        9EC
 0046BF30    push        esi
 0046BF31    call        kernel32.MulDiv
 0046BF36    mov         edx,eax
 0046BF38    mov         eax,ebx
 0046BF3A    call        TMetafile.SetMMHeight
 0046BF3F    add         esp,64
 0046BF42    pop         esi
 0046BF43    pop         ebx
 0046BF44    ret
*}
end;

//0046BF48
procedure TMetafile.SetInch(Value:Word);
begin
{*
 0046BF48    push        ebx
 0046BF49    push        esi
 0046BF4A    mov         esi,edx
 0046BF4C    mov         ebx,eax
 0046BF4E    cmp         dword ptr [ebx+28],0
>0046BF52    jne         0046BF5B
 0046BF54    mov         eax,ebx
 0046BF56    call        TMetafile.NewImage
 0046BF5B    mov         eax,dword ptr [ebx+28]
 0046BF5E    cmp         si,word ptr [eax+18]
>0046BF62    je          0046BF7B
 0046BF64    mov         eax,ebx
 0046BF66    call        TMetafile.UniqueImage
 0046BF6B    mov         eax,dword ptr [ebx+28]
 0046BF6E    mov         word ptr [eax+18],si
 0046BF72    mov         edx,ebx
 0046BF74    mov         eax,ebx
 0046BF76    mov         ecx,dword ptr [eax]
 0046BF78    call        dword ptr [ecx+10]
 0046BF7B    pop         esi
 0046BF7C    pop         ebx
 0046BF7D    ret
*}
end;

//0046BF80
procedure TMetafile.SetMMHeight(Value:Integer);
begin
{*
 0046BF80    push        ebx
 0046BF81    push        esi
 0046BF82    mov         esi,edx
 0046BF84    mov         ebx,eax
 0046BF86    cmp         dword ptr [ebx+28],0
>0046BF8A    jne         0046BF93
 0046BF8C    mov         eax,ebx
 0046BF8E    call        TMetafile.NewImage
 0046BF93    mov         eax,dword ptr [ebx+28]
 0046BF96    xor         edx,edx
 0046BF98    mov         dword ptr [eax+20],edx
 0046BF9B    cmp         esi,dword ptr [eax+10]
>0046BF9E    je          0046BFB6
 0046BFA0    mov         eax,ebx
 0046BFA2    call        TMetafile.UniqueImage
 0046BFA7    mov         eax,dword ptr [ebx+28]
 0046BFAA    mov         dword ptr [eax+10],esi
 0046BFAD    mov         edx,ebx
 0046BFAF    mov         eax,ebx
 0046BFB1    mov         ecx,dword ptr [eax]
 0046BFB3    call        dword ptr [ecx+10]
 0046BFB6    pop         esi
 0046BFB7    pop         ebx
 0046BFB8    ret
*}
end;

//0046BFBC
procedure TMetafile.SetMMWidth(Value:Integer);
begin
{*
 0046BFBC    push        ebx
 0046BFBD    push        esi
 0046BFBE    mov         esi,edx
 0046BFC0    mov         ebx,eax
 0046BFC2    cmp         dword ptr [ebx+28],0
>0046BFC6    jne         0046BFCF
 0046BFC8    mov         eax,ebx
 0046BFCA    call        TMetafile.NewImage
 0046BFCF    mov         eax,dword ptr [ebx+28]
 0046BFD2    xor         edx,edx
 0046BFD4    mov         dword ptr [eax+1C],edx
 0046BFD7    cmp         esi,dword ptr [eax+0C]
>0046BFDA    je          0046BFF2
 0046BFDC    mov         eax,ebx
 0046BFDE    call        TMetafile.UniqueImage
 0046BFE3    mov         eax,dword ptr [ebx+28]
 0046BFE6    mov         dword ptr [eax+0C],esi
 0046BFE9    mov         edx,ebx
 0046BFEB    mov         eax,ebx
 0046BFED    mov         ecx,dword ptr [eax]
 0046BFEF    call        dword ptr [ecx+10]
 0046BFF2    pop         esi
 0046BFF3    pop         ebx
 0046BFF4    ret
*}
end;

//0046BFF8
procedure TMetafile.SetTransparent(Value:Boolean);
begin
{*
 0046BFF8    ret
*}
end;

//0046BFFC
procedure TMetafile.SetWidth(Value:Integer);
begin
{*
 0046BFFC    push        ebx
 0046BFFD    push        esi
 0046BFFE    add         esp,0FFFFFF9C
 0046C001    mov         esi,edx
 0046C003    mov         ebx,eax
 0046C005    cmp         dword ptr [ebx+28],0
>0046C009    jne         0046C012
 0046C00B    mov         eax,ebx
 0046C00D    call        TMetafile.NewImage
 0046C012    mov         eax,dword ptr [ebx+28]
 0046C015    cmp         word ptr [eax+18],0
>0046C01A    jne         0046C04D
 0046C01C    mov         edx,dword ptr [eax+8]
 0046C01F    test        edx,edx
>0046C021    jne         0046C028
 0046C023    mov         dword ptr [eax+1C],esi
>0046C026    jmp         0046C067
 0046C028    push        esp
 0046C029    push        64
 0046C02B    push        edx
 0046C02C    call        gdi32.GetEnhMetaFileHeader
 0046C031    mov         eax,dword ptr [esp+48]
 0046C035    push        eax
 0046C036    imul        eax,dword ptr [esp+54],64
 0046C03B    push        eax
 0046C03C    push        esi
 0046C03D    call        kernel32.MulDiv
 0046C042    mov         edx,eax
 0046C044    mov         eax,ebx
 0046C046    call        TMetafile.SetMMWidth
>0046C04B    jmp         0046C067
 0046C04D    mov         eax,[00793058]
 0046C052    push        eax
 0046C053    push        9EC
 0046C058    push        esi
 0046C059    call        kernel32.MulDiv
 0046C05E    mov         edx,eax
 0046C060    mov         eax,ebx
 0046C062    call        TMetafile.SetMMWidth
 0046C067    add         esp,64
 0046C06A    pop         esi
 0046C06B    pop         ebx
 0046C06C    ret
*}
end;

//0046C070
function TMetafile.TestEMF(Stream:TStream):Boolean;
begin
{*
 0046C070    push        ebx
 0046C071    push        esi
 0046C072    push        edi
 0046C073    add         esp,0FFFFFF9C
 0046C076    mov         ebx,edx
 0046C078    mov         eax,ebx
 0046C07A    mov         edx,dword ptr [eax]
 0046C07C    call        dword ptr [edx]
 0046C07E    mov         esi,eax
 0046C080    mov         eax,ebx
 0046C082    call        TStream.GetPosition
 0046C087    sub         esi,eax
 0046C089    cmp         esi,64
>0046C08C    jle         0046C0AC
 0046C08E    mov         edx,esp
 0046C090    mov         ecx,64
 0046C095    mov         eax,ebx
 0046C097    mov         edi,dword ptr [eax]
 0046C099    call        dword ptr [edi+0C]
 0046C09C    mov         cx,1
 0046C0A0    mov         edx,0FFFFFF9C
 0046C0A5    mov         eax,ebx
 0046C0A7    mov         ebx,dword ptr [eax]
 0046C0A9    call        dword ptr [ebx+14]
 0046C0AC    cmp         esi,64
>0046C0AF    jle         0046C0C1
 0046C0B1    cmp         dword ptr [esp],1
>0046C0B5    jne         0046C0C1
 0046C0B7    cmp         dword ptr [esp+28],464D4520
>0046C0BF    je          0046C0C5
 0046C0C1    xor         eax,eax
>0046C0C3    jmp         0046C0C7
 0046C0C5    mov         al,1
 0046C0C7    add         esp,64
 0046C0CA    pop         edi
 0046C0CB    pop         esi
 0046C0CC    pop         ebx
 0046C0CD    ret
*}
end;

//0046C0D0
procedure TMetafile.UniqueImage;
begin
{*
 0046C0D0    push        ebx
 0046C0D1    push        esi
 0046C0D2    push        edi
 0046C0D3    mov         ebx,eax
 0046C0D5    mov         eax,dword ptr [ebx+28]
 0046C0D8    test        eax,eax
>0046C0DA    jne         0046C0E5
 0046C0DC    mov         eax,ebx
 0046C0DE    call        TMetafile.NewImage
>0046C0E3    jmp         0046C14F
 0046C0E5    cmp         dword ptr [eax+4],1
>0046C0E9    jle         0046C14F
 0046C0EB    mov         dl,1
 0046C0ED    mov         eax,[0046318C];TMetafileImage
 0046C0F2    call        TObject.Create
 0046C0F7    mov         esi,eax
 0046C0F9    mov         eax,dword ptr [ebx+28]
 0046C0FC    mov         edi,dword ptr [eax+8]
 0046C0FF    test        edi,edi
>0046C101    je          0046C10E
 0046C103    push        0
 0046C105    push        edi
 0046C106    call        gdi32.CopyEnhMetaFileW
 0046C10B    mov         dword ptr [esi+8],eax
 0046C10E    mov         eax,dword ptr [ebx+28]
 0046C111    mov         eax,dword ptr [eax+10]
 0046C114    mov         dword ptr [esi+10],eax
 0046C117    mov         eax,dword ptr [ebx+28]
 0046C11A    mov         eax,dword ptr [eax+0C]
 0046C11D    mov         dword ptr [esi+0C],eax
 0046C120    mov         eax,dword ptr [ebx+28]
 0046C123    movzx       eax,word ptr [eax+18]
 0046C127    mov         word ptr [esi+18],ax
 0046C12B    mov         eax,dword ptr [ebx+28]
 0046C12E    mov         eax,dword ptr [eax+1C]
 0046C131    mov         dword ptr [esi+1C],eax
 0046C134    mov         eax,dword ptr [ebx+28]
 0046C137    mov         eax,dword ptr [eax+20]
 0046C13A    mov         dword ptr [esi+20],eax
 0046C13D    mov         eax,dword ptr [ebx+28]
 0046C140    call        TSharedImage.Release
 0046C145    mov         eax,esi
 0046C147    mov         dword ptr [ebx+28],eax
 0046C14A    call        TSharedImage.Reference
 0046C14F    pop         edi
 0046C150    pop         esi
 0046C151    pop         ebx
 0046C152    ret
*}
end;

//0046C154
procedure TMetafile.WriteData(Stream:TStream);
begin
{*
 0046C154    push        ebx
 0046C155    push        esi
 0046C156    push        edi
 0046C157    push        ecx
 0046C158    mov         ebx,edx
 0046C15A    mov         esi,eax
 0046C15C    cmp         dword ptr [esi+28],0
>0046C160    je          0046C1D2
 0046C162    xor         eax,eax
 0046C164    mov         dword ptr [esp],eax
 0046C167    mov         edx,esp
 0046C169    mov         ecx,4
 0046C16E    mov         eax,ebx
 0046C170    mov         edi,dword ptr [eax]
 0046C172    call        dword ptr [edi+10]
 0046C175    mov         eax,ebx
 0046C177    call        TStream.GetPosition
 0046C17C    sub         eax,4
 0046C17F    mov         dword ptr [esp],eax
 0046C182    cmp         byte ptr [esi+2C],0
>0046C186    je          0046C193
 0046C188    mov         edx,ebx
 0046C18A    mov         eax,esi
 0046C18C    call        TMetafile.WriteEMFStream
>0046C191    jmp         0046C19C
 0046C193    mov         edx,ebx
 0046C195    mov         eax,esi
 0046C197    call        TMetafile.WriteWMFStream
 0046C19C    mov         eax,dword ptr [esp]
 0046C19F    cdq
 0046C1A0    push        edx
 0046C1A1    push        eax
 0046C1A2    xor         edx,edx
 0046C1A4    mov         eax,ebx
 0046C1A6    mov         ecx,dword ptr [eax]
 0046C1A8    call        dword ptr [ecx+18]
 0046C1AB    mov         eax,ebx
 0046C1AD    mov         edx,dword ptr [eax]
 0046C1AF    call        dword ptr [edx]
 0046C1B1    sub         eax,dword ptr [esp]
 0046C1B4    mov         dword ptr [esp],eax
 0046C1B7    mov         edx,esp
 0046C1B9    mov         ecx,4
 0046C1BE    mov         eax,ebx
 0046C1C0    mov         esi,dword ptr [eax]
 0046C1C2    call        dword ptr [esi+10]
 0046C1C5    push        0
 0046C1C7    push        0
 0046C1C9    mov         dl,2
 0046C1CB    mov         eax,ebx
 0046C1CD    mov         ecx,dword ptr [eax]
 0046C1CF    call        dword ptr [ecx+18]
 0046C1D2    pop         edx
 0046C1D3    pop         edi
 0046C1D4    pop         esi
 0046C1D5    pop         ebx
 0046C1D6    ret
*}
end;

//0046C1D8
procedure TMetafile.WriteEMFStream(Stream:TStream);
begin
{*
 0046C1D8    push        ebp
 0046C1D9    mov         ebp,esp
 0046C1DB    add         esp,0FFFFFFF8
 0046C1DE    push        ebx
 0046C1DF    push        esi
 0046C1E0    mov         esi,edx
 0046C1E2    mov         ebx,eax
 0046C1E4    mov         eax,dword ptr [ebx+28]
 0046C1E7    test        eax,eax
>0046C1E9    je          0046C25B
 0046C1EB    push        0
 0046C1ED    push        0
 0046C1EF    mov         eax,dword ptr [eax+8]
 0046C1F2    push        eax
 0046C1F3    call        gdi32.GetEnhMetaFileBits
 0046C1F8    mov         dword ptr [ebp-8],eax
 0046C1FB    cmp         dword ptr [ebp-8],0
>0046C1FF    je          0046C25B
 0046C201    mov         eax,dword ptr [ebp-8]
 0046C204    call        @GetMem
 0046C209    mov         dword ptr [ebp-4],eax
 0046C20C    xor         eax,eax
 0046C20E    push        ebp
 0046C20F    push        46C254
 0046C214    push        dword ptr fs:[eax]
 0046C217    mov         dword ptr fs:[eax],esp
 0046C21A    mov         eax,dword ptr [ebp-4]
 0046C21D    push        eax
 0046C21E    mov         eax,dword ptr [ebp-8]
 0046C221    push        eax
 0046C222    mov         eax,dword ptr [ebx+28]
 0046C225    mov         eax,dword ptr [eax+8]
 0046C228    push        eax
 0046C229    call        gdi32.GetEnhMetaFileBits
 0046C22E    mov         edx,dword ptr [ebp-4]
 0046C231    mov         ecx,dword ptr [ebp-8]
 0046C234    mov         eax,esi
 0046C236    call        TStream.WriteBuffer
 0046C23B    xor         eax,eax
 0046C23D    pop         edx
 0046C23E    pop         ecx
 0046C23F    pop         ecx
 0046C240    mov         dword ptr fs:[eax],edx
 0046C243    push        46C25B
 0046C248    mov         edx,dword ptr [ebp-8]
 0046C24B    mov         eax,dword ptr [ebp-4]
 0046C24E    call        @FreeMem
 0046C253    ret
>0046C254    jmp         @HandleFinally
>0046C259    jmp         0046C248
 0046C25B    pop         esi
 0046C25C    pop         ebx
 0046C25D    pop         ecx
 0046C25E    pop         ecx
 0046C25F    pop         ebp
 0046C260    ret
*}
end;

//0046C264
procedure TMetafile.WriteWMFStream(Stream:TStream);
begin
{*
 0046C264    push        ebp
 0046C265    mov         ebp,esp
 0046C267    add         esp,0FFFFFFDC
 0046C26A    push        ebx
 0046C26B    push        esi
 0046C26C    mov         esi,edx
 0046C26E    mov         ebx,eax
 0046C270    cmp         dword ptr [ebx+28],0
>0046C274    je          0046C3A6
 0046C27A    lea         eax,[ebp-22]
 0046C27D    xor         ecx,ecx
 0046C27F    mov         edx,16
 0046C284    call        @FillChar
 0046C289    mov         ebx,dword ptr [ebx+28]
 0046C28C    mov         dword ptr [ebp-22],9AC6CDD7
 0046C293    movzx       eax,word ptr [ebx+18]
 0046C297    test        ax,ax
>0046C29A    jne         0046C2A4
 0046C29C    mov         word ptr [ebp-14],60
>0046C2A2    jmp         0046C2A8
 0046C2A4    mov         word ptr [ebp-14],ax
 0046C2A8    push        9EC
 0046C2AD    movzx       eax,word ptr [ebp-14]
 0046C2B1    push        eax
 0046C2B2    mov         eax,dword ptr [ebx+0C]
 0046C2B5    push        eax
 0046C2B6    call        kernel32.MulDiv
 0046C2BB    mov         word ptr [ebp-18],ax
 0046C2BF    push        9EC
 0046C2C4    movzx       eax,word ptr [ebp-14]
 0046C2C8    push        eax
 0046C2C9    mov         eax,dword ptr [ebx+10]
 0046C2CC    push        eax
 0046C2CD    call        kernel32.MulDiv
 0046C2D2    mov         word ptr [ebp-16],ax
 0046C2D6    lea         eax,[ebp-22]
 0046C2D9    call        ComputeAldusChecksum
 0046C2DE    mov         word ptr [ebp-0E],ax
 0046C2E2    push        0
 0046C2E4    call        user32.GetDC
 0046C2E9    mov         dword ptr [ebp-8],eax
 0046C2EC    xor         eax,eax
 0046C2EE    push        ebp
 0046C2EF    push        46C39F
 0046C2F4    push        dword ptr fs:[eax]
 0046C2F7    mov         dword ptr fs:[eax],esp
 0046C2FA    mov         eax,dword ptr [ebp-8]
 0046C2FD    push        eax
 0046C2FE    push        8
 0046C300    push        0
 0046C302    push        0
 0046C304    mov         eax,dword ptr [ebx+8]
 0046C307    push        eax
 0046C308    call        gdi32.GetWinMetaFileBits
 0046C30D    mov         dword ptr [ebp-4],eax
 0046C310    mov         eax,dword ptr [ebp-4]
 0046C313    call        @GetMem
 0046C318    mov         dword ptr [ebp-0C],eax
 0046C31B    xor         eax,eax
 0046C31D    push        ebp
 0046C31E    push        46C37F
 0046C323    push        dword ptr fs:[eax]
 0046C326    mov         dword ptr fs:[eax],esp
 0046C329    mov         eax,dword ptr [ebp-8]
 0046C32C    push        eax
 0046C32D    push        8
 0046C32F    mov         eax,dword ptr [ebp-0C]
 0046C332    push        eax
 0046C333    mov         eax,dword ptr [ebp-4]
 0046C336    push        eax
 0046C337    mov         eax,dword ptr [ebx+8]
 0046C33A    push        eax
 0046C33B    call        gdi32.GetWinMetaFileBits
 0046C340    cmp         eax,dword ptr [ebp-4]
>0046C343    jae         0046C34A
 0046C345    call        GDIError
 0046C34A    lea         edx,[ebp-22]
 0046C34D    mov         ecx,16
 0046C352    mov         eax,esi
 0046C354    call        TStream.WriteBuffer
 0046C359    mov         edx,dword ptr [ebp-0C]
 0046C35C    mov         ecx,dword ptr [ebp-4]
 0046C35F    mov         eax,esi
 0046C361    call        TStream.WriteBuffer
 0046C366    xor         eax,eax
 0046C368    pop         edx
 0046C369    pop         ecx
 0046C36A    pop         ecx
 0046C36B    mov         dword ptr fs:[eax],edx
 0046C36E    push        46C386
 0046C373    mov         edx,dword ptr [ebp-4]
 0046C376    mov         eax,dword ptr [ebp-0C]
 0046C379    call        @FreeMem
 0046C37E    ret
>0046C37F    jmp         @HandleFinally
>0046C384    jmp         0046C373
 0046C386    xor         eax,eax
 0046C388    pop         edx
 0046C389    pop         ecx
 0046C38A    pop         ecx
 0046C38B    mov         dword ptr fs:[eax],edx
 0046C38E    push        46C3A6
 0046C393    mov         eax,dword ptr [ebp-8]
 0046C396    push        eax
 0046C397    push        0
 0046C399    call        user32.ReleaseDC
 0046C39E    ret
>0046C39F    jmp         @HandleFinally
>0046C3A4    jmp         0046C393
 0046C3A6    pop         esi
 0046C3A7    pop         ebx
 0046C3A8    mov         esp,ebp
 0046C3AA    pop         ebp
 0046C3AB    ret
*}
end;

//0046C3AC
procedure TMetafile.LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE);
begin
{*
 0046C3AC    push        ebp
 0046C3AD    mov         ebp,esp
 0046C3AF    add         esp,0FFFFFF9C
 0046C3B2    push        ebx
 0046C3B3    push        esi
 0046C3B4    push        edi
 0046C3B5    mov         ebx,eax
 0046C3B7    push        0E
 0046C3B9    call        user32.GetClipboardData
 0046C3BE    mov         edi,eax
 0046C3C0    test        edi,edi
>0046C3C2    jne         0046C3CE
 0046C3C4    mov         eax,[0078D5E0];^SResString189:TResStringRec
 0046C3C9    call        InvalidGraphic
 0046C3CE    mov         eax,ebx
 0046C3D0    call        TMetafile.NewImage
 0046C3D5    mov         esi,dword ptr [ebx+28]
 0046C3D8    push        0
 0046C3DA    push        edi
 0046C3DB    call        gdi32.CopyEnhMetaFileW
 0046C3E0    mov         dword ptr [esi+8],eax
 0046C3E3    lea         eax,[ebp-64]
 0046C3E6    push        eax
 0046C3E7    push        64
 0046C3E9    mov         eax,dword ptr [esi+8]
 0046C3EC    push        eax
 0046C3ED    call        gdi32.GetEnhMetaFileHeader
 0046C3F2    mov         eax,dword ptr [ebp-44]
 0046C3F5    sub         eax,dword ptr [ebp-4C]
 0046C3F8    mov         dword ptr [esi+0C],eax
 0046C3FB    mov         eax,dword ptr [ebp-40]
 0046C3FE    sub         eax,dword ptr [ebp-48]
 0046C401    mov         dword ptr [esi+10],eax
 0046C404    mov         word ptr [esi+18],0
 0046C40A    mov         byte ptr [ebx+2C],1
 0046C40E    mov         eax,ebx
 0046C410    mov         edx,dword ptr [eax]
 0046C412    call        dword ptr [edx+28]
 0046C415    test        eax,eax
 0046C417    setne       al
 0046C41A    mov         byte ptr [ebx+22],al
 0046C41D    mov         edx,ebx
 0046C41F    mov         eax,ebx
 0046C421    mov         ecx,dword ptr [eax]
 0046C423    call        dword ptr [ecx+10]
 0046C426    pop         edi
 0046C427    pop         esi
 0046C428    pop         ebx
 0046C429    mov         esp,ebp
 0046C42B    pop         ebp
 0046C42C    ret         4
*}
end;

//0046C430
procedure TMetafile.SaveToClipboardFormat(var AFormat:Word; var AData:Cardinal; var APalette:HPALETTE);
begin
{*
 0046C430    push        ebp
 0046C431    mov         ebp,esp
 0046C433    push        ebx
 0046C434    push        esi
 0046C435    push        edi
 0046C436    mov         edi,ecx
 0046C438    mov         ebx,eax
 0046C43A    mov         esi,dword ptr [ebx+28]
 0046C43D    test        esi,esi
>0046C43F    je          0046C45A
 0046C441    mov         word ptr [edx],0E
 0046C446    mov         eax,dword ptr [ebp+8]
 0046C449    xor         edx,edx
 0046C44B    mov         dword ptr [eax],edx
 0046C44D    push        0
 0046C44F    mov         eax,dword ptr [esi+8]
 0046C452    push        eax
 0046C453    call        gdi32.CopyEnhMetaFileW
 0046C458    mov         dword ptr [edi],eax
 0046C45A    pop         edi
 0046C45B    pop         esi
 0046C45C    pop         ebx
 0046C45D    pop         ebp
 0046C45E    ret         4
*}
end;

//0046C464
function TMetafile.ReleaseHandle:Cardinal;
begin
{*
 0046C464    push        ebx
 0046C465    mov         ebx,eax
 0046C467    mov         eax,ebx
 0046C469    call        TMetafile.UniqueImage
 0046C46E    mov         eax,dword ptr [ebx+28]
 0046C471    mov         edx,dword ptr [eax+8]
 0046C474    xor         ecx,ecx
 0046C476    mov         dword ptr [eax+8],ecx
 0046C479    mov         eax,edx
 0046C47B    pop         ebx
 0046C47C    ret
*}
end;

//0046C480
procedure TMetafile.SetSize(AWidth:Integer; AHeight:Integer);
begin
{*
 0046C480    push        ebx
 0046C481    push        esi
 0046C482    push        edi
 0046C483    add         esp,0FFFFFF9C
 0046C486    mov         edi,ecx
 0046C488    mov         esi,edx
 0046C48A    mov         ebx,eax
 0046C48C    cmp         dword ptr [ebx+28],0
>0046C490    jne         0046C499
 0046C492    mov         eax,ebx
 0046C494    call        TMetafile.NewImage
 0046C499    mov         eax,dword ptr [ebx+28]
 0046C49C    cmp         word ptr [eax+18],0
>0046C4A1    jne         0046C4F1
 0046C4A3    mov         edx,dword ptr [eax+8]
 0046C4A6    test        edx,edx
>0046C4A8    jne         0046C4B2
 0046C4AA    mov         dword ptr [eax+1C],esi
 0046C4AD    mov         dword ptr [eax+20],edi
>0046C4B0    jmp         0046C525
 0046C4B2    push        esp
 0046C4B3    push        64
 0046C4B5    push        edx
 0046C4B6    call        gdi32.GetEnhMetaFileHeader
 0046C4BB    mov         eax,dword ptr [esp+48]
 0046C4BF    push        eax
 0046C4C0    imul        eax,dword ptr [esp+54],64
 0046C4C5    push        eax
 0046C4C6    push        esi
 0046C4C7    call        kernel32.MulDiv
 0046C4CC    mov         edx,eax
 0046C4CE    mov         eax,ebx
 0046C4D0    call        TMetafile.SetMMWidth
 0046C4D5    mov         eax,dword ptr [esp+4C]
 0046C4D9    push        eax
 0046C4DA    imul        eax,dword ptr [esp+58],64
 0046C4DF    push        eax
 0046C4E0    push        edi
 0046C4E1    call        kernel32.MulDiv
 0046C4E6    mov         edx,eax
 0046C4E8    mov         eax,ebx
 0046C4EA    call        TMetafile.SetMMHeight
>0046C4EF    jmp         0046C525
 0046C4F1    mov         eax,[00793058]
 0046C4F6    push        eax
 0046C4F7    push        9EC
 0046C4FC    push        esi
 0046C4FD    call        kernel32.MulDiv
 0046C502    mov         edx,eax
 0046C504    mov         eax,ebx
 0046C506    call        TMetafile.SetMMWidth
 0046C50B    mov         eax,[00793058]
 0046C510    push        eax
 0046C511    push        9EC
 0046C516    push        edi
 0046C517    call        kernel32.MulDiv
 0046C51C    mov         edx,eax
 0046C51E    mov         eax,ebx
 0046C520    call        TMetafile.SetMMHeight
 0046C525    add         esp,64
 0046C528    pop         edi
 0046C529    pop         esi
 0046C52A    pop         ebx
 0046C52B    ret
*}
end;

//0046C718
procedure FreeMemoryContexts;
begin
{*
 0046C718    push        ebp
 0046C719    mov         ebp,esp
 0046C71B    add         esp,0FFFFFFF4
 0046C71E    mov         eax,[00785948]
 0046C723    call        TThreadList.LockList
 0046C728    mov         dword ptr [ebp-8],eax
 0046C72B    xor         edx,edx
 0046C72D    push        ebp
 0046C72E    push        46C7B9
 0046C733    push        dword ptr fs:[edx]
 0046C736    mov         dword ptr fs:[edx],esp
 0046C739    mov         eax,dword ptr [ebp-8]
 0046C73C    mov         eax,dword ptr [eax+8]
 0046C73F    dec         eax
 0046C740    cmp         eax,0
>0046C743    jl          0046C79E
 0046C745    mov         dword ptr [ebp-4],eax
 0046C748    mov         edx,dword ptr [ebp-4]
 0046C74B    mov         eax,dword ptr [ebp-8]
 0046C74E    call        TList.Get
 0046C753    mov         dword ptr [ebp-0C],eax
 0046C756    mov         eax,dword ptr [ebp-0C]
 0046C759    call        TCustomCanvas.TryLock
 0046C75E    test        al,al
>0046C760    je          0046C795
 0046C762    xor         eax,eax
 0046C764    push        ebp
 0046C765    push        46C78E
 0046C76A    push        dword ptr fs:[eax]
 0046C76D    mov         dword ptr fs:[eax],esp
 0046C770    mov         eax,dword ptr [ebp-0C]
 0046C773    call        TBitmapCanvas.FreeContext
 0046C778    xor         eax,eax
 0046C77A    pop         edx
 0046C77B    pop         ecx
 0046C77C    pop         ecx
 0046C77D    mov         dword ptr fs:[eax],edx
 0046C780    push        46C795
 0046C785    mov         eax,dword ptr [ebp-0C]
 0046C788    call        TCustomCanvas.Unlock
 0046C78D    ret
>0046C78E    jmp         @HandleFinally
>0046C793    jmp         0046C785
 0046C795    dec         dword ptr [ebp-4]
 0046C798    cmp         dword ptr [ebp-4],0FFFFFFFF
>0046C79C    jne         0046C748
 0046C79E    xor         eax,eax
 0046C7A0    pop         edx
 0046C7A1    pop         ecx
 0046C7A2    pop         ecx
 0046C7A3    mov         dword ptr fs:[eax],edx
 0046C7A6    push        46C7C0
 0046C7AB    mov         eax,[00785948]
 0046C7B0    mov         eax,dword ptr [eax+8]
 0046C7B3    call        TMonitor.Exit
 0046C7B8    ret
>0046C7B9    jmp         @HandleFinally
>0046C7BE    jmp         0046C7AB
 0046C7C0    mov         esp,ebp
 0046C7C2    pop         ebp
 0046C7C3    ret
*}
end;

//0046C7C4
procedure DeselectBitmap(AHandle:HBITMAP);
begin
{*
 0046C7C4    push        ebp
 0046C7C5    mov         ebp,esp
 0046C7C7    push        ecx
 0046C7C8    push        ebx
 0046C7C9    push        esi
 0046C7CA    mov         dword ptr [ebp-4],eax
 0046C7CD    cmp         dword ptr [ebp-4],0
>0046C7D1    je          0046C83E
 0046C7D3    mov         eax,[00785948]
 0046C7D8    call        TThreadList.LockList
 0046C7DD    mov         esi,eax
 0046C7DF    xor         ecx,ecx
 0046C7E1    push        ebp
 0046C7E2    push        46C837
 0046C7E7    push        dword ptr fs:[ecx]
 0046C7EA    mov         dword ptr fs:[ecx],esp
 0046C7ED    mov         ebx,dword ptr [esi+8]
 0046C7F0    dec         ebx
 0046C7F1    cmp         ebx,0
>0046C7F4    jl          0046C81C
 0046C7F6    mov         edx,ebx
 0046C7F8    mov         eax,esi
 0046C7FA    call        TList.Get
 0046C7FF    mov         edx,dword ptr [eax+58]
 0046C802    test        edx,edx
>0046C804    je          0046C816
 0046C806    mov         edx,dword ptr [edx+28]
 0046C809    mov         edx,dword ptr [edx+8]
 0046C80C    cmp         edx,dword ptr [ebp-4]
>0046C80F    jne         0046C816
 0046C811    call        TBitmapCanvas.FreeContext
 0046C816    dec         ebx
 0046C817    cmp         ebx,0FFFFFFFF
>0046C81A    jne         0046C7F6
 0046C81C    xor         eax,eax
 0046C81E    pop         edx
 0046C81F    pop         ecx
 0046C820    pop         ecx
 0046C821    mov         dword ptr fs:[eax],edx
 0046C824    push        46C83E
 0046C829    mov         eax,[00785948]
 0046C82E    mov         eax,dword ptr [eax+8]
 0046C831    call        TMonitor.Exit
 0046C836    ret
>0046C837    jmp         @HandleFinally
>0046C83C    jmp         0046C829
 0046C83E    pop         esi
 0046C83F    pop         ebx
 0046C840    pop         ecx
 0046C841    pop         ebp
 0046C842    ret
*}
end;

//0046C844
constructor TBitmapCanvas.Create;
begin
{*
 0046C844    push        ebx
 0046C845    push        esi
 0046C846    push        edi
 0046C847    test        dl,dl
>0046C849    je          0046C853
 0046C84B    add         esp,0FFFFFFF0
 0046C84E    call        @ClassCreate
 0046C853    mov         esi,ecx
 0046C855    mov         ebx,edx
 0046C857    mov         edi,eax
 0046C859    xor         edx,edx
 0046C85B    mov         eax,edi
 0046C85D    call        TCanvas.Create
 0046C862    mov         dword ptr [edi+58],esi
 0046C865    mov         eax,edi
 0046C867    test        bl,bl
>0046C869    je          0046C87A
 0046C86B    call        @AfterConstruction
 0046C870    pop         dword ptr fs:[0]
 0046C877    add         esp,0C
 0046C87A    mov         eax,edi
 0046C87C    pop         edi
 0046C87D    pop         esi
 0046C87E    pop         ebx
 0046C87F    ret
*}
end;

//0046C880
destructor TBitmapCanvas.Destroy();
begin
{*
 0046C880    push        ebx
 0046C881    push        esi
 0046C882    call        @BeforeDestruction
 0046C887    mov         ebx,edx
 0046C889    mov         esi,eax
 0046C88B    mov         eax,esi
 0046C88D    call        TBitmapCanvas.FreeContext
 0046C892    mov         edx,ebx
 0046C894    and         dl,0FC
 0046C897    mov         eax,esi
 0046C899    call        TCanvas.Destroy
 0046C89E    test        bl,bl
>0046C8A0    jle         0046C8A9
 0046C8A2    mov         eax,esi
 0046C8A4    call        @ClassDestroy
 0046C8A9    pop         esi
 0046C8AA    pop         ebx
 0046C8AB    ret
*}
end;

//0046C8AC
procedure TBitmapCanvas.FreeContext;
begin
{*
 0046C8AC    push        ebp
 0046C8AD    mov         ebp,esp
 0046C8AF    push        ecx
 0046C8B0    push        ebx
 0046C8B1    mov         dword ptr [ebp-4],eax
 0046C8B4    mov         eax,dword ptr [ebp-4]
 0046C8B7    cmp         dword ptr [eax+38],0
>0046C8BB    je          0046C949
 0046C8C1    mov         eax,dword ptr [ebp-4]
 0046C8C4    call        TCustomCanvas.Lock
 0046C8C9    xor         edx,edx
 0046C8CB    push        ebp
 0046C8CC    push        46C942
 0046C8D1    push        dword ptr fs:[edx]
 0046C8D4    mov         dword ptr fs:[edx],esp
 0046C8D7    mov         eax,dword ptr [ebp-4]
 0046C8DA    mov         eax,dword ptr [eax+5C]
 0046C8DD    test        eax,eax
>0046C8DF    je          0046C8EE
 0046C8E1    push        eax
 0046C8E2    mov         eax,dword ptr [ebp-4]
 0046C8E5    mov         eax,dword ptr [eax+38]
 0046C8E8    push        eax
 0046C8E9    call        gdi32.SelectObject
 0046C8EE    mov         eax,dword ptr [ebp-4]
 0046C8F1    mov         eax,dword ptr [eax+60]
 0046C8F4    test        eax,eax
>0046C8F6    je          0046C907
 0046C8F8    push        0FF
 0046C8FA    push        eax
 0046C8FB    mov         eax,dword ptr [ebp-4]
 0046C8FE    mov         eax,dword ptr [eax+38]
 0046C901    push        eax
 0046C902    call        gdi32.SelectPalette
 0046C907    mov         eax,dword ptr [ebp-4]
 0046C90A    mov         ebx,dword ptr [eax+38]
 0046C90D    xor         edx,edx
 0046C90F    mov         eax,dword ptr [ebp-4]
 0046C912    call        TCanvas.SetHandle
 0046C917    push        ebx
 0046C918    call        gdi32.DeleteDC
 0046C91D    mov         cl,1
 0046C91F    mov         edx,dword ptr [ebp-4]
 0046C922    mov         eax,[00785948]
 0046C927    call        TThreadList.RemoveItem
 0046C92C    xor         eax,eax
 0046C92E    pop         edx
 0046C92F    pop         ecx
 0046C930    pop         ecx
 0046C931    mov         dword ptr fs:[eax],edx
 0046C934    push        46C949
 0046C939    mov         eax,dword ptr [ebp-4]
 0046C93C    call        TCustomCanvas.Unlock
 0046C941    ret
>0046C942    jmp         @HandleFinally
>0046C947    jmp         0046C939
 0046C949    pop         ebx
 0046C94A    pop         ecx
 0046C94B    pop         ebp
 0046C94C    ret
*}
end;

//0046C950
procedure TBitmapCanvas.CreateHandle;
begin
{*
 0046C950    push        ebp
 0046C951    mov         ebp,esp
 0046C953    push        ecx
 0046C954    push        ebx
 0046C955    push        esi
 0046C956    mov         dword ptr [ebp-4],eax
 0046C959    mov         eax,dword ptr [ebp-4]
 0046C95C    cmp         dword ptr [eax+58],0
>0046C960    je          0046CA36
 0046C966    mov         eax,dword ptr [ebp-4]
 0046C969    call        TCustomCanvas.Lock
 0046C96E    xor         eax,eax
 0046C970    push        ebp
 0046C971    push        46CA2F
 0046C976    push        dword ptr fs:[eax]
 0046C979    mov         dword ptr fs:[eax],esp
 0046C97C    mov         eax,dword ptr [ebp-4]
 0046C97F    mov         eax,dword ptr [eax+58]
 0046C982    call        TBitmap.HandleNeeded
 0046C987    mov         eax,dword ptr [ebp-4]
 0046C98A    mov         eax,dword ptr [eax+58]
 0046C98D    mov         eax,dword ptr [eax+28]
 0046C990    mov         eax,dword ptr [eax+8]
 0046C993    call        DeselectBitmap
 0046C998    mov         eax,dword ptr [ebp-4]
 0046C99B    mov         eax,dword ptr [eax+58]
 0046C99E    call        TBitmap.PaletteNeeded
 0046C9A3    push        0
 0046C9A5    call        gdi32.CreateCompatibleDC
 0046C9AA    mov         ebx,eax
 0046C9AC    mov         eax,dword ptr [ebp-4]
 0046C9AF    mov         eax,dword ptr [eax+58]
 0046C9B2    mov         eax,dword ptr [eax+28]
 0046C9B5    mov         esi,dword ptr [eax+8]
 0046C9B8    test        esi,esi
>0046C9BA    je          0046C9CB
 0046C9BC    push        esi
 0046C9BD    push        ebx
 0046C9BE    call        gdi32.SelectObject
 0046C9C3    mov         edx,dword ptr [ebp-4]
 0046C9C6    mov         dword ptr [edx+5C],eax
>0046C9C9    jmp         0046C9D3
 0046C9CB    mov         eax,dword ptr [ebp-4]
 0046C9CE    xor         edx,edx
 0046C9D0    mov         dword ptr [eax+5C],edx
 0046C9D3    mov         eax,dword ptr [ebp-4]
 0046C9D6    mov         eax,dword ptr [eax+58]
 0046C9D9    mov         eax,dword ptr [eax+28]
 0046C9DC    mov         esi,dword ptr [eax+10]
 0046C9DF    test        esi,esi
>0046C9E1    je          0046C9FA
 0046C9E3    push        0FF
 0046C9E5    push        esi
 0046C9E6    push        ebx
 0046C9E7    call        gdi32.SelectPalette
 0046C9EC    mov         edx,dword ptr [ebp-4]
 0046C9EF    mov         dword ptr [edx+60],eax
 0046C9F2    push        ebx
 0046C9F3    call        gdi32.RealizePalette
>0046C9F8    jmp         0046CA02
 0046C9FA    mov         eax,dword ptr [ebp-4]
 0046C9FD    xor         edx,edx
 0046C9FF    mov         dword ptr [eax+60],edx
 0046CA02    mov         edx,ebx
 0046CA04    mov         eax,dword ptr [ebp-4]
 0046CA07    call        TCanvas.SetHandle
 0046CA0C    mov         edx,dword ptr [ebp-4]
 0046CA0F    mov         eax,[00785948]
 0046CA14    call        TThreadList.Add
 0046CA19    xor         eax,eax
 0046CA1B    pop         edx
 0046CA1C    pop         ecx
 0046CA1D    pop         ecx
 0046CA1E    mov         dword ptr fs:[eax],edx
 0046CA21    push        46CA36
 0046CA26    mov         eax,dword ptr [ebp-4]
 0046CA29    call        TCustomCanvas.Unlock
 0046CA2E    ret
>0046CA2F    jmp         @HandleFinally
>0046CA34    jmp         0046CA26
 0046CA36    pop         esi
 0046CA37    pop         ebx
 0046CA38    pop         ecx
 0046CA39    pop         ebp
 0046CA3A    ret
*}
end;

//0046CA3C
destructor TSharedImage.Destroy();
begin
{*
 0046CA3C    push        ebx
 0046CA3D    push        esi
 0046CA3E    call        @BeforeDestruction
 0046CA43    mov         ebx,edx
 0046CA45    mov         esi,eax
 0046CA47    mov         edx,ebx
 0046CA49    and         dl,0FC
 0046CA4C    mov         eax,esi
 0046CA4E    call        TObject.Destroy
 0046CA53    test        bl,bl
>0046CA55    jle         0046CA5E
 0046CA57    mov         eax,esi
 0046CA59    call        @ClassDestroy
 0046CA5E    pop         esi
 0046CA5F    pop         ebx
 0046CA60    ret
*}
end;

//0046CA64
procedure TSharedImage.Reference;
begin
{*
 0046CA64    inc         dword ptr [eax+4]
 0046CA67    ret
*}
end;

//0046CA68
procedure TSharedImage.Release;
begin
{*
 0046CA68    push        ebx
 0046CA69    mov         ebx,eax
 0046CA6B    test        ebx,ebx
>0046CA6D    je          0046CA85
 0046CA6F    dec         dword ptr [ebx+4]
 0046CA72    cmp         dword ptr [ebx+4],0
>0046CA76    jne         0046CA85
 0046CA78    mov         eax,ebx
 0046CA7A    mov         edx,dword ptr [eax]
 0046CA7C    call        dword ptr [edx]
 0046CA7E    mov         eax,ebx
 0046CA80    call        TObject.Free
 0046CA85    pop         ebx
 0046CA86    ret
*}
end;

//0046CA88
destructor TBitmapImage.Destroy();
begin
{*
 0046CA88    push        ebx
 0046CA89    push        esi
 0046CA8A    call        @BeforeDestruction
 0046CA8F    mov         ebx,edx
 0046CA91    mov         esi,eax
 0046CA93    mov         eax,dword ptr [esi+14]
 0046CA96    test        eax,eax
>0046CA98    je          0046CAAD
 0046CA9A    call        DeselectBitmap
 0046CA9F    mov         eax,dword ptr [esi+14]
 0046CAA2    push        eax
 0046CAA3    call        gdi32.DeleteObject
 0046CAA8    xor         eax,eax
 0046CAAA    mov         dword ptr [esi+14],eax
 0046CAAD    mov         eax,esi
 0046CAAF    mov         edx,dword ptr [eax]
 0046CAB1    call        dword ptr [edx]
 0046CAB3    mov         eax,dword ptr [esi+64]
 0046CAB6    test        eax,eax
>0046CAB8    je          0046CAC0
 0046CABA    push        eax
 0046CABB    call        kernel32.CloseHandle
 0046CAC0    lea         eax,[esi+6C]
 0046CAC3    mov         edx,dword ptr [eax]
 0046CAC5    xor         ecx,ecx
 0046CAC7    mov         dword ptr [eax],ecx
 0046CAC9    mov         eax,edx
 0046CACB    call        TObject.Free
 0046CAD0    mov         edx,ebx
 0046CAD2    and         dl,0FC
 0046CAD5    mov         eax,esi
 0046CAD7    call        TSharedImage.Destroy
 0046CADC    test        bl,bl
>0046CADE    jle         0046CAE7
 0046CAE0    mov         eax,esi
 0046CAE2    call        @ClassDestroy
 0046CAE7    pop         esi
 0046CAE8    pop         ebx
 0046CAE9    ret
*}
end;

//0046CAEC
procedure TBitmapImage.FreeHandle;
begin
{*
 0046CAEC    push        ebx
 0046CAED    mov         ebx,eax
 0046CAEF    mov         eax,dword ptr [ebx+8]
 0046CAF2    test        eax,eax
>0046CAF4    je          0046CB09
 0046CAF6    call        DeselectBitmap
 0046CAFB    mov         eax,dword ptr [ebx+8]
 0046CAFE    cmp         eax,dword ptr [ebx+14]
>0046CB01    je          0046CB09
 0046CB03    push        eax
 0046CB04    call        gdi32.DeleteObject
 0046CB09    mov         eax,dword ptr [ebx+0C]
 0046CB0C    test        eax,eax
>0046CB0E    je          0046CB23
 0046CB10    call        DeselectBitmap
 0046CB15    mov         eax,dword ptr [ebx+0C]
 0046CB18    push        eax
 0046CB19    call        gdi32.DeleteObject
 0046CB1E    xor         eax,eax
 0046CB20    mov         dword ptr [ebx+0C],eax
 0046CB23    mov         eax,dword ptr [ebx+10]
 0046CB26    call        InternalDeletePalette
 0046CB2B    xor         eax,eax
 0046CB2D    mov         dword ptr [ebx+8],eax
 0046CB30    xor         eax,eax
 0046CB32    mov         dword ptr [ebx+10],eax
 0046CB35    pop         ebx
 0046CB36    ret
*}
end;

//0046CB38
procedure UpdateDIBColorTable(DIBHandle:HBITMAP; Pal:HPALETTE; const DIB:TDIBSection);
begin
{*
 0046CB38    push        ebp
 0046CB39    mov         ebp,esp
 0046CB3B    add         esp,0FFFFFBF0
 0046CB41    push        ebx
 0046CB42    push        esi
 0046CB43    mov         dword ptr [ebp-4],edx
 0046CB46    mov         esi,eax
 0046CB48    test        esi,esi
>0046CB4A    je          0046CBEE
 0046CB50    cmp         word ptr [ecx+26],8
>0046CB55    ja          0046CBEE
 0046CB5B    lea         edx,[ebp-410]
 0046CB61    mov         ecx,0FF
 0046CB66    mov         eax,dword ptr [ebp-4]
 0046CB69    call        PaletteToDIBColorTable
 0046CB6E    mov         ebx,eax
 0046CB70    test        ebx,ebx
>0046CB72    je          0046CBEE
 0046CB74    push        0
 0046CB76    call        user32.GetDC
 0046CB7B    mov         dword ptr [ebp-8],eax
 0046CB7E    mov         eax,dword ptr [ebp-8]
 0046CB81    push        eax
 0046CB82    call        gdi32.CreateCompatibleDC
 0046CB87    mov         dword ptr [ebp-0C],eax
 0046CB8A    push        esi
 0046CB8B    mov         eax,dword ptr [ebp-0C]
 0046CB8E    push        eax
 0046CB8F    call        gdi32.SelectObject
 0046CB94    mov         dword ptr [ebp-10],eax
 0046CB97    xor         eax,eax
 0046CB99    push        ebp
 0046CB9A    push        46CBE7
 0046CB9F    push        dword ptr fs:[eax]
 0046CBA2    mov         dword ptr fs:[eax],esp
 0046CBA5    lea         eax,[ebp-410]
 0046CBAB    push        eax
 0046CBAC    push        ebx
 0046CBAD    push        0
 0046CBAF    mov         eax,dword ptr [ebp-0C]
 0046CBB2    push        eax
 0046CBB3    call        gdi32.SetDIBColorTable
 0046CBB8    xor         eax,eax
 0046CBBA    pop         edx
 0046CBBB    pop         ecx
 0046CBBC    pop         ecx
 0046CBBD    mov         dword ptr fs:[eax],edx
 0046CBC0    push        46CBEE
 0046CBC5    mov         eax,dword ptr [ebp-10]
 0046CBC8    push        eax
 0046CBC9    mov         eax,dword ptr [ebp-0C]
 0046CBCC    push        eax
 0046CBCD    call        gdi32.SelectObject
 0046CBD2    mov         eax,dword ptr [ebp-0C]
 0046CBD5    push        eax
 0046CBD6    call        gdi32.DeleteDC
 0046CBDB    mov         eax,dword ptr [ebp-8]
 0046CBDE    push        eax
 0046CBDF    push        0
 0046CBE1    call        user32.ReleaseDC
 0046CBE6    ret
>0046CBE7    jmp         @HandleFinally
>0046CBEC    jmp         0046CBC5
 0046CBEE    pop         esi
 0046CBEF    pop         ebx
 0046CBF0    mov         esp,ebp
 0046CBF2    pop         ebp
 0046CBF3    ret
*}
end;

//0046CBF4
procedure FixupBitFields(var DIB:TDIBSection);
begin
{*
 0046CBF4    test        byte ptr [eax+28],3
>0046CBF8    je          0046CC3C
 0046CBFA    cmp         dword ptr [eax+40],0
>0046CBFE    jne         0046CC3C
 0046CC00    movzx       edx,word ptr [eax+26]
 0046CC04    cmp         dx,10
>0046CC08    jne         0046CC21
 0046CC0A    mov         dword ptr [eax+40],0F800
 0046CC11    mov         dword ptr [eax+44],7E0
 0046CC18    mov         dword ptr [eax+48],1F
>0046CC1F    jmp         0046CC3C
 0046CC21    cmp         dx,20
>0046CC25    jne         0046CC3C
 0046CC27    mov         dword ptr [eax+40],0FF0000
 0046CC2E    mov         dword ptr [eax+44],0FF00
 0046CC35    mov         dword ptr [eax+48],0FF
 0046CC3C    ret
*}
end;

//0046CC40
function CopyBitmap(Handle:HBITMAP; OldPalette:HPALETTE; NewPalette:HPALETTE; var DIB:TDIBSection; Canvas:TCanvas):HBITMAP;
begin
{*
 0046CC40    push        ebp
 0046CC41    mov         ebp,esp
 0046CC43    add         esp,0FFFFFF68
 0046CC49    push        ebx
 0046CC4A    push        esi
 0046CC4B    push        edi
 0046CC4C    mov         dword ptr [ebp-0C],ecx
 0046CC4F    mov         dword ptr [ebp-8],edx
 0046CC52    mov         dword ptr [ebp-4],eax
 0046CC55    xor         eax,eax
 0046CC57    mov         dword ptr [ebp-10],eax
 0046CC5A    mov         eax,dword ptr [ebp+0C]
 0046CC5D    cmp         dword ptr [eax+18],0
>0046CC61    je          0046CC7D
 0046CC63    mov         eax,dword ptr [ebp+0C]
 0046CC66    cmp         dword ptr [eax+1C],0
>0046CC6A    je          0046D298
 0046CC70    mov         eax,dword ptr [ebp+0C]
 0046CC73    cmp         dword ptr [eax+20],0
>0046CC77    je          0046D298
 0046CC7D    mov         eax,dword ptr [ebp+0C]
 0046CC80    cmp         dword ptr [eax+18],0
>0046CC84    jne         0046CCA0
 0046CC86    mov         eax,dword ptr [ebp+0C]
 0046CC89    cmp         dword ptr [eax+4],0
>0046CC8D    je          0046D298
 0046CC93    mov         eax,dword ptr [ebp+0C]
 0046CC96    cmp         dword ptr [eax+8],0
>0046CC9A    je          0046D298
 0046CCA0    mov         eax,dword ptr [ebp-4]
 0046CCA3    call        DeselectBitmap
 0046CCA8    xor         eax,eax
 0046CCAA    mov         dword ptr [ebp-70],eax
 0046CCAD    cmp         dword ptr [ebp-4],0
>0046CCB1    je          0046CCCF
 0046CCB3    lea         eax,[ebp-88]
 0046CCB9    push        eax
 0046CCBA    push        54
 0046CCBC    mov         eax,dword ptr [ebp-4]
 0046CCBF    push        eax
 0046CCC0    call        gdi32.GetObjectW
 0046CCC5    cmp         eax,18
>0046CCC8    jge         0046CCCF
 0046CCCA    call        InvalidBitmap
 0046CCCF    push        0
 0046CCD1    call        user32.GetDC
 0046CCD6    call        GDICheck
 0046CCDB    mov         dword ptr [ebp-18],eax
 0046CCDE    mov         eax,dword ptr [ebp-18]
 0046CCE1    push        eax
 0046CCE2    call        gdi32.CreateCompatibleDC
 0046CCE7    call        GDICheck
 0046CCEC    mov         dword ptr [ebp-1C],eax
 0046CCEF    xor         edx,edx
 0046CCF1    push        ebp
 0046CCF2    push        46D291
 0046CCF7    push        dword ptr fs:[edx]
 0046CCFA    mov         dword ptr fs:[edx],esp
 0046CCFD    mov         eax,dword ptr [ebp+0C]
 0046CD00    cmp         dword ptr [eax+18],28
>0046CD04    jae         0046CD64
 0046CD06    mov         eax,dword ptr [ebp+0C]
 0046CD09    movzx       eax,word ptr [eax+10]
 0046CD0D    mov         edx,dword ptr [ebp+0C]
 0046CD10    or          ax,word ptr [edx+12]
 0046CD14    cmp         ax,1
>0046CD18    jne         0046CD40
 0046CD1A    push        0
 0046CD1C    push        1
 0046CD1E    push        1
 0046CD20    mov         eax,dword ptr [ebp+0C]
 0046CD23    mov         eax,dword ptr [eax+8]
 0046CD26    push        eax
 0046CD27    mov         eax,dword ptr [ebp+0C]
 0046CD2A    mov         eax,dword ptr [eax+4]
 0046CD2D    push        eax
 0046CD2E    call        gdi32.CreateBitmap
 0046CD33    call        GDICheck
 0046CD38    mov         dword ptr [ebp-10],eax
>0046CD3B    jmp         0046CF9F
 0046CD40    mov         eax,dword ptr [ebp+0C]
 0046CD43    mov         eax,dword ptr [eax+8]
 0046CD46    push        eax
 0046CD47    mov         eax,dword ptr [ebp+0C]
 0046CD4A    mov         eax,dword ptr [eax+4]
 0046CD4D    push        eax
 0046CD4E    mov         eax,dword ptr [ebp-18]
 0046CD51    push        eax
 0046CD52    call        gdi32.CreateCompatibleBitmap
 0046CD57    call        GDICheck
 0046CD5C    mov         dword ptr [ebp-10],eax
>0046CD5F    jmp         0046CF9F
 0046CD64    mov         eax,42C
 0046CD69    call        @GetMem
 0046CD6E    mov         dword ptr [ebp-28],eax
 0046CD71    xor         edx,edx
 0046CD73    push        ebp
 0046CD74    push        46CF98
 0046CD79    push        dword ptr fs:[edx]
 0046CD7C    mov         dword ptr fs:[edx],esp
 0046CD7F    mov         eax,dword ptr [ebp+0C]
 0046CD82    mov         dword ptr [eax+18],28
 0046CD89    mov         eax,dword ptr [ebp+0C]
 0046CD8C    mov         word ptr [eax+24],1
 0046CD92    mov         eax,dword ptr [ebp+0C]
 0046CD95    cmp         word ptr [eax+26],0
>0046CD9A    jne         0046CDBF
 0046CD9C    push        0C
 0046CD9E    mov         eax,dword ptr [ebp-18]
 0046CDA1    push        eax
 0046CDA2    call        gdi32.GetDeviceCaps
 0046CDA7    mov         ebx,eax
 0046CDA9    push        0E
 0046CDAB    mov         eax,dword ptr [ebp-18]
 0046CDAE    push        eax
 0046CDAF    call        gdi32.GetDeviceCaps
 0046CDB4    imul        bx,ax
 0046CDB8    mov         eax,dword ptr [ebp+0C]
 0046CDBB    mov         word ptr [eax+26],bx
 0046CDBF    mov         eax,dword ptr [ebp+0C]
 0046CDC2    mov         edx,dword ptr [ebp-28]
 0046CDC5    lea         esi,[eax+18]
 0046CDC8    mov         edi,edx
 0046CDCA    mov         ecx,0A
 0046CDCF    rep movs    dword ptr [edi],dword ptr [esi]
 0046CDD1    mov         eax,dword ptr [ebp+0C]
 0046CDD4    mov         eax,dword ptr [eax+1C]
 0046CDD7    mov         edx,dword ptr [ebp+0C]
 0046CDDA    mov         dword ptr [edx+4],eax
 0046CDDD    mov         eax,dword ptr [ebp+0C]
 0046CDE0    mov         eax,dword ptr [eax+20]
 0046CDE3    mov         edx,dword ptr [ebp+0C]
 0046CDE6    mov         dword ptr [edx+8],eax
 0046CDE9    mov         eax,dword ptr [ebp+0C]
 0046CDEC    cmp         word ptr [eax+26],8
>0046CDF1    ja          0046CEBE
 0046CDF7    mov         eax,dword ptr [ebp+0C]
 0046CDFA    cmp         word ptr [eax+26],1
>0046CDFF    jne         0046CE29
 0046CE01    cmp         dword ptr [ebp-4],0
>0046CE05    je          0046CE0D
 0046CE07    cmp         dword ptr [ebp-74],0
>0046CE0B    jne         0046CE29
 0046CE0D    mov         eax,dword ptr [ebp-28]
 0046CE10    xor         edx,edx
 0046CE12    mov         dword ptr [eax+28],edx
 0046CE15    mov         eax,dword ptr [ebp-28]
 0046CE18    add         eax,28
 0046CE1B    add         eax,4
 0046CE1E    mov         dword ptr [eax],0FFFFFF
>0046CE24    jmp         0046CEFB
 0046CE29    cmp         dword ptr [ebp-0C],0
>0046CE2D    je          0046CE47
 0046CE2F    mov         eax,dword ptr [ebp-28]
 0046CE32    lea         edx,[eax+28]
 0046CE35    mov         ecx,0FF
 0046CE3A    mov         eax,dword ptr [ebp-0C]
 0046CE3D    call        PaletteToDIBColorTable
>0046CE42    jmp         0046CEFB
 0046CE47    cmp         dword ptr [ebp-4],0
>0046CE4B    je          0046CEFB
 0046CE51    mov         eax,dword ptr [ebp-4]
 0046CE54    push        eax
 0046CE55    mov         eax,dword ptr [ebp-1C]
 0046CE58    push        eax
 0046CE59    call        gdi32.SelectObject
 0046CE5E    mov         dword ptr [ebp-14],eax
 0046CE61    cmp         dword ptr [ebp-70],0
>0046CE65    jbe         0046CE8C
 0046CE67    cmp         dword ptr [ebp-74],0
>0046CE6B    je          0046CE8C
 0046CE6D    mov         eax,dword ptr [ebp-28]
 0046CE70    add         eax,28
 0046CE73    push        eax
 0046CE74    push        100
 0046CE79    push        0
 0046CE7B    mov         eax,dword ptr [ebp-1C]
 0046CE7E    push        eax
 0046CE7F    call        gdi32.GetDIBColorTable
 0046CE84    mov         edx,dword ptr [ebp+0C]
 0046CE87    mov         dword ptr [edx+38],eax
>0046CE8A    jmp         0046CEAF
 0046CE8C    push        0
 0046CE8E    mov         eax,dword ptr [ebp-28]
 0046CE91    push        eax
 0046CE92    push        0
 0046CE94    mov         eax,dword ptr [ebp+0C]
 0046CE97    mov         eax,dword ptr [eax+20]
 0046CE9A    cdq
 0046CE9B    xor         eax,edx
 0046CE9D    sub         eax,edx
 0046CE9F    push        eax
 0046CEA0    push        0
 0046CEA2    mov         eax,dword ptr [ebp-4]
 0046CEA5    push        eax
 0046CEA6    mov         eax,dword ptr [ebp-1C]
 0046CEA9    push        eax
 0046CEAA    call        gdi32.GetDIBits
 0046CEAF    mov         eax,dword ptr [ebp-14]
 0046CEB2    push        eax
 0046CEB3    mov         eax,dword ptr [ebp-1C]
 0046CEB6    push        eax
 0046CEB7    call        gdi32.SelectObject
>0046CEBC    jmp         0046CEFB
 0046CEBE    mov         eax,dword ptr [ebp+0C]
 0046CEC1    movzx       eax,word ptr [eax+26]
 0046CEC5    cmp         ax,10
>0046CEC9    je          0046CED4
 0046CECB    mov         edx,dword ptr [ebp+0C]
 0046CECE    cmp         ax,20
>0046CED2    jne         0046CEFB
 0046CED4    mov         eax,dword ptr [ebp+0C]
 0046CED7    test        byte ptr [eax+28],3
>0046CEDB    je          0046CEFB
 0046CEDD    mov         eax,dword ptr [ebp+0C]
 0046CEE0    call        FixupBitFields
 0046CEE5    mov         eax,dword ptr [ebp-28]
 0046CEE8    lea         edx,[eax+28]
 0046CEEB    mov         eax,dword ptr [ebp+0C]
 0046CEEE    add         eax,40
 0046CEF1    mov         ecx,0C
 0046CEF6    call        Move
 0046CEFB    push        0
 0046CEFD    push        0
 0046CEFF    lea         eax,[ebp-2C]
 0046CF02    push        eax
 0046CF03    push        0
 0046CF05    mov         eax,dword ptr [ebp-28]
 0046CF08    push        eax
 0046CF09    mov         eax,dword ptr [ebp-18]
 0046CF0C    push        eax
 0046CF0D    call        gdi32.CreateDIBSection
 0046CF12    call        GDICheck
 0046CF17    mov         dword ptr [ebp-10],eax
 0046CF1A    cmp         dword ptr [ebp-2C],0
>0046CF1E    jne         0046CF25
 0046CF20    call        GDIError
 0046CF25    cmp         dword ptr [ebp-4],0
>0046CF29    je          0046CF82
 0046CF2B    mov         eax,dword ptr [ebp+0C]
 0046CF2E    mov         eax,dword ptr [eax+1C]
 0046CF31    cmp         eax,dword ptr [ebp-84]
>0046CF37    jne         0046CF82
 0046CF39    mov         eax,dword ptr [ebp+0C]
 0046CF3C    mov         eax,dword ptr [eax+20]
 0046CF3F    cmp         eax,dword ptr [ebp-80]
>0046CF42    jne         0046CF82
 0046CF44    mov         eax,dword ptr [ebp+0C]
 0046CF47    cmp         word ptr [eax+26],8
>0046CF4C    jbe         0046CF82
 0046CF4E    push        0
 0046CF50    mov         eax,dword ptr [ebp-28]
 0046CF53    push        eax
 0046CF54    mov         eax,dword ptr [ebp-2C]
 0046CF57    push        eax
 0046CF58    mov         eax,dword ptr [ebp+0C]
 0046CF5B    mov         eax,dword ptr [eax+20]
 0046CF5E    cdq
 0046CF5F    xor         eax,edx
 0046CF61    sub         eax,edx
 0046CF63    push        eax
 0046CF64    push        0
 0046CF66    mov         eax,dword ptr [ebp-4]
 0046CF69    push        eax
 0046CF6A    mov         eax,dword ptr [ebp-1C]
 0046CF6D    push        eax
 0046CF6E    call        gdi32.GetDIBits
 0046CF73    call        @TryFinallyExit
 0046CF78    call        @TryFinallyExit
>0046CF7D    jmp         0046D298
 0046CF82    xor         eax,eax
 0046CF84    pop         edx
 0046CF85    pop         ecx
 0046CF86    pop         ecx
 0046CF87    mov         dword ptr fs:[eax],edx
 0046CF8A    push        46CF9F
 0046CF8F    mov         eax,dword ptr [ebp-28]
 0046CF92    call        @FreeMem
 0046CF97    ret
>0046CF98    jmp         @HandleFinally
>0046CF9D    jmp         0046CF8F
 0046CF9F    mov         eax,dword ptr [ebp-10]
 0046CFA2    call        GDICheck
 0046CFA7    mov         eax,dword ptr [ebp-10]
 0046CFAA    push        eax
 0046CFAB    mov         eax,dword ptr [ebp-1C]
 0046CFAE    push        eax
 0046CFAF    call        gdi32.SelectObject
 0046CFB4    call        GDICheck
 0046CFB9    mov         dword ptr [ebp-14],eax
 0046CFBC    xor         eax,eax
 0046CFBE    push        ebp
 0046CFBF    push        46D242
 0046CFC4    push        dword ptr fs:[eax]
 0046CFC7    mov         dword ptr fs:[eax],esp
 0046CFCA    xor         eax,eax
 0046CFCC    push        ebp
 0046CFCD    push        46D231
 0046CFD2    push        dword ptr fs:[eax]
 0046CFD5    mov         dword ptr fs:[eax],esp
 0046CFD8    xor         eax,eax
 0046CFDA    mov         dword ptr [ebp-24],eax
 0046CFDD    xor         ebx,ebx
 0046CFDF    cmp         dword ptr [ebp-0C],0
>0046CFE3    je          0046D000
 0046CFE5    push        0
 0046CFE7    mov         eax,dword ptr [ebp-0C]
 0046CFEA    push        eax
 0046CFEB    mov         eax,dword ptr [ebp-1C]
 0046CFEE    push        eax
 0046CFEF    call        gdi32.SelectPalette
 0046CFF4    mov         dword ptr [ebp-24],eax
 0046CFF7    mov         eax,dword ptr [ebp-1C]
 0046CFFA    push        eax
 0046CFFB    call        gdi32.RealizePalette
 0046D000    xor         eax,eax
 0046D002    push        ebp
 0046D003    push        46D20F
 0046D008    push        dword ptr fs:[eax]
 0046D00B    mov         dword ptr fs:[eax],esp
 0046D00E    cmp         dword ptr [ebp+8],0
>0046D012    je          0046D0CF
 0046D018    mov         eax,dword ptr [ebp+8]
 0046D01B    mov         eax,dword ptr [eax+48]
 0046D01E    call        TBrush.GetHandle
 0046D023    push        eax
 0046D024    mov         eax,dword ptr [ebp+0C]
 0046D027    mov         eax,dword ptr [eax+8]
 0046D02A    push        eax
 0046D02B    lea         eax,[ebp-98]
 0046D031    push        eax
 0046D032    mov         ecx,dword ptr [ebp+0C]
 0046D035    mov         ecx,dword ptr [ecx+4]
 0046D038    xor         edx,edx
 0046D03A    xor         eax,eax
 0046D03C    call        Rect
 0046D041    lea         eax,[ebp-98]
 0046D047    push        eax
 0046D048    mov         eax,dword ptr [ebp-1C]
 0046D04B    push        eax
 0046D04C    call        user32.FillRect
 0046D051    mov         eax,dword ptr [ebp+8]
 0046D054    mov         eax,dword ptr [eax+40]
 0046D057    mov         eax,dword ptr [eax+18]
 0046D05A    call        ColorToRGB
 0046D05F    push        eax
 0046D060    mov         eax,dword ptr [ebp-1C]
 0046D063    push        eax
 0046D064    call        gdi32.SetTextColor
 0046D069    mov         eax,dword ptr [ebp+8]
 0046D06C    mov         eax,dword ptr [eax+48]
 0046D06F    mov         eax,dword ptr [eax+10]
 0046D072    mov         eax,dword ptr [eax+18]
 0046D075    call        ColorToRGB
 0046D07A    push        eax
 0046D07B    mov         eax,dword ptr [ebp-1C]
 0046D07E    push        eax
 0046D07F    call        gdi32.SetBkColor
 0046D084    mov         eax,dword ptr [ebp+0C]
 0046D087    cmp         word ptr [eax+26],1
>0046D08C    jne         0046D0EF
 0046D08E    mov         eax,dword ptr [ebp+0C]
 0046D091    cmp         dword ptr [eax+14],0
>0046D095    je          0046D0EF
 0046D097    mov         eax,dword ptr [ebp+8]
 0046D09A    mov         eax,dword ptr [eax+40]
 0046D09D    mov         eax,dword ptr [eax+18]
 0046D0A0    call        ColorToRGB
 0046D0A5    mov         dword ptr [ebp-34],eax
 0046D0A8    mov         eax,dword ptr [ebp+8]
 0046D0AB    mov         eax,dword ptr [eax+48]
 0046D0AE    mov         eax,dword ptr [eax+10]
 0046D0B1    mov         eax,dword ptr [eax+18]
 0046D0B4    call        ColorToRGB
 0046D0B9    mov         dword ptr [ebp-30],eax
 0046D0BC    lea         eax,[ebp-34]
 0046D0BF    push        eax
 0046D0C0    push        2
 0046D0C2    push        0
 0046D0C4    mov         eax,dword ptr [ebp-1C]
 0046D0C7    push        eax
 0046D0C8    call        gdi32.SetDIBColorTable
>0046D0CD    jmp         0046D0EF
 0046D0CF    push        0FF0062
 0046D0D4    mov         eax,dword ptr [ebp+0C]
 0046D0D7    mov         eax,dword ptr [eax+8]
 0046D0DA    push        eax
 0046D0DB    mov         eax,dword ptr [ebp+0C]
 0046D0DE    mov         eax,dword ptr [eax+4]
 0046D0E1    push        eax
 0046D0E2    push        0
 0046D0E4    push        0
 0046D0E6    mov         eax,dword ptr [ebp-1C]
 0046D0E9    push        eax
 0046D0EA    call        gdi32.PatBlt
 0046D0EF    cmp         dword ptr [ebp-4],0
>0046D0F3    je          0046D1EC
 0046D0F9    mov         eax,dword ptr [ebp-18]
 0046D0FC    push        eax
 0046D0FD    call        gdi32.CreateCompatibleDC
 0046D102    call        GDICheck
 0046D107    mov         dword ptr [ebp-20],eax
 0046D10A    xor         eax,eax
 0046D10C    push        ebp
 0046D10D    push        46D1E5
 0046D112    push        dword ptr fs:[eax]
 0046D115    mov         dword ptr fs:[eax],esp
 0046D118    mov         eax,dword ptr [ebp-4]
 0046D11B    push        eax
 0046D11C    mov         eax,dword ptr [ebp-20]
 0046D11F    push        eax
 0046D120    call        gdi32.SelectObject
 0046D125    call        GDICheck
 0046D12A    mov         esi,eax
 0046D12C    cmp         dword ptr [ebp-8],0
>0046D130    je          0046D14C
 0046D132    push        0
 0046D134    mov         eax,dword ptr [ebp-8]
 0046D137    push        eax
 0046D138    mov         eax,dword ptr [ebp-20]
 0046D13B    push        eax
 0046D13C    call        gdi32.SelectPalette
 0046D141    mov         ebx,eax
 0046D143    mov         eax,dword ptr [ebp-20]
 0046D146    push        eax
 0046D147    call        gdi32.RealizePalette
 0046D14C    cmp         dword ptr [ebp+8],0
>0046D150    je          0046D185
 0046D152    mov         eax,dword ptr [ebp+8]
 0046D155    mov         eax,dword ptr [eax+40]
 0046D158    mov         eax,dword ptr [eax+18]
 0046D15B    call        ColorToRGB
 0046D160    push        eax
 0046D161    mov         eax,dword ptr [ebp-20]
 0046D164    push        eax
 0046D165    call        gdi32.SetTextColor
 0046D16A    mov         eax,dword ptr [ebp+8]
 0046D16D    mov         eax,dword ptr [eax+48]
 0046D170    mov         eax,dword ptr [eax+10]
 0046D173    mov         eax,dword ptr [eax+18]
 0046D176    call        ColorToRGB
 0046D17B    push        eax
 0046D17C    mov         eax,dword ptr [ebp-20]
 0046D17F    push        eax
 0046D180    call        gdi32.SetBkColor
 0046D185    push        0CC0020
 0046D18A    push        0
 0046D18C    push        0
 0046D18E    mov         eax,dword ptr [ebp-20]
 0046D191    push        eax
 0046D192    mov         eax,dword ptr [ebp+0C]
 0046D195    mov         eax,dword ptr [eax+8]
 0046D198    push        eax
 0046D199    mov         eax,dword ptr [ebp+0C]
 0046D19C    mov         eax,dword ptr [eax+4]
 0046D19F    push        eax
 0046D1A0    push        0
 0046D1A2    push        0
 0046D1A4    mov         eax,dword ptr [ebp-1C]
 0046D1A7    push        eax
 0046D1A8    call        gdi32.BitBlt
 0046D1AD    cmp         dword ptr [ebp-8],0
>0046D1B1    je          0046D1BF
 0046D1B3    push        0FF
 0046D1B5    push        ebx
 0046D1B6    mov         eax,dword ptr [ebp-20]
 0046D1B9    push        eax
 0046D1BA    call        gdi32.SelectPalette
 0046D1BF    push        esi
 0046D1C0    mov         eax,dword ptr [ebp-20]
 0046D1C3    push        eax
 0046D1C4    call        gdi32.SelectObject
 0046D1C9    call        GDICheck
 0046D1CE    xor         eax,eax
 0046D1D0    pop         edx
 0046D1D1    pop         ecx
 0046D1D2    pop         ecx
 0046D1D3    mov         dword ptr fs:[eax],edx
 0046D1D6    push        46D1EC
 0046D1DB    mov         eax,dword ptr [ebp-20]
 0046D1DE    push        eax
 0046D1DF    call        gdi32.DeleteDC
 0046D1E4    ret
>0046D1E5    jmp         @HandleFinally
>0046D1EA    jmp         0046D1DB
 0046D1EC    xor         eax,eax
 0046D1EE    pop         edx
 0046D1EF    pop         ecx
 0046D1F0    pop         ecx
 0046D1F1    mov         dword ptr fs:[eax],edx
 0046D1F4    push        46D216
 0046D1F9    cmp         dword ptr [ebp-0C],0
>0046D1FD    je          0046D20E
 0046D1FF    push        0FF
 0046D201    mov         eax,dword ptr [ebp-24]
 0046D204    push        eax
 0046D205    mov         eax,dword ptr [ebp-1C]
 0046D208    push        eax
 0046D209    call        gdi32.SelectPalette
 0046D20E    ret
>0046D20F    jmp         @HandleFinally
>0046D214    jmp         0046D1F9
 0046D216    xor         eax,eax
 0046D218    pop         edx
 0046D219    pop         ecx
 0046D21A    pop         ecx
 0046D21B    mov         dword ptr fs:[eax],edx
 0046D21E    push        46D238
 0046D223    mov         eax,dword ptr [ebp-14]
 0046D226    push        eax
 0046D227    mov         eax,dword ptr [ebp-1C]
 0046D22A    push        eax
 0046D22B    call        gdi32.SelectObject
 0046D230    ret
>0046D231    jmp         @HandleFinally
>0046D236    jmp         0046D223
 0046D238    xor         eax,eax
 0046D23A    pop         edx
 0046D23B    pop         ecx
 0046D23C    pop         ecx
 0046D23D    mov         dword ptr fs:[eax],edx
>0046D240    jmp         0046D25A
>0046D242    jmp         @HandleAnyException
 0046D247    mov         eax,dword ptr [ebp-10]
 0046D24A    push        eax
 0046D24B    call        gdi32.DeleteObject
 0046D250    call        @RaiseAgain
 0046D255    call        @DoneExcept
 0046D25A    xor         eax,eax
 0046D25C    pop         edx
 0046D25D    pop         ecx
 0046D25E    pop         ecx
 0046D25F    mov         dword ptr fs:[eax],edx
 0046D262    push        46D298
 0046D267    mov         eax,dword ptr [ebp-1C]
 0046D26A    push        eax
 0046D26B    call        gdi32.DeleteDC
 0046D270    mov         eax,dword ptr [ebp-18]
 0046D273    push        eax
 0046D274    push        0
 0046D276    call        user32.ReleaseDC
 0046D27B    cmp         dword ptr [ebp-10],0
>0046D27F    je          0046D290
 0046D281    mov         eax,dword ptr [ebp+0C]
 0046D284    push        eax
 0046D285    push        54
 0046D287    mov         eax,dword ptr [ebp-10]
 0046D28A    push        eax
 0046D28B    call        gdi32.GetObjectW
 0046D290    ret
>0046D291    jmp         @HandleFinally
>0046D296    jmp         0046D267
 0046D298    mov         eax,dword ptr [ebp-10]
 0046D29B    pop         edi
 0046D29C    pop         esi
 0046D29D    pop         ebx
 0046D29E    mov         esp,ebp
 0046D2A0    pop         ebp
 0046D2A1    ret         8
*}
end;

//0046D2A4
function CopyPalette(Palette:HPALETTE):HPALETTE;
begin
{*
 0046D2A4    push        ebx
 0046D2A5    push        esi
 0046D2A6    add         esp,0FFFFFBF8
 0046D2AC    mov         ebx,eax
 0046D2AE    xor         esi,esi
 0046D2B0    test        ebx,ebx
>0046D2B2    je          0046D2FA
 0046D2B4    xor         eax,eax
 0046D2B6    mov         dword ptr [esp],eax
 0046D2B9    push        esp
 0046D2BA    push        4
 0046D2BC    push        ebx
 0046D2BD    call        gdi32.GetObjectW
 0046D2C2    test        eax,eax
>0046D2C4    je          0046D2FA
 0046D2C6    cmp         dword ptr [esp],0
>0046D2CA    je          0046D2FA
 0046D2CC    mov         word ptr [esp+4],300
 0046D2D3    movzx       eax,word ptr [esp]
 0046D2D7    mov         word ptr [esp+6],ax
 0046D2DC    lea         eax,[esp+8]
 0046D2E0    push        eax
 0046D2E1    mov         eax,dword ptr [esp+4]
 0046D2E5    push        eax
 0046D2E6    push        0
 0046D2E8    push        ebx
 0046D2E9    call        gdi32.GetPaletteEntries
 0046D2EE    lea         eax,[esp+4]
 0046D2F2    push        eax
 0046D2F3    call        gdi32.CreatePalette
 0046D2F8    mov         esi,eax
 0046D2FA    mov         eax,esi
 0046D2FC    add         esp,408
 0046D302    pop         esi
 0046D303    pop         ebx
 0046D304    ret
*}
end;

//0046D308
function CopyBitmapAsMask(Handle:HBITMAP; Palette:HPALETTE; TransparentColor:TColorRef):HBITMAP;
begin
{*
 0046D308    push        ebp
 0046D309    mov         ebp,esp
 0046D30B    add         esp,0FFFFFF90
 0046D30E    push        ebx
 0046D30F    push        esi
 0046D310    push        edi
 0046D311    mov         edi,ecx
 0046D313    mov         esi,edx
 0046D315    mov         ebx,eax
 0046D317    xor         eax,eax
 0046D319    mov         dword ptr [ebp-4],eax
 0046D31C    test        ebx,ebx
>0046D31E    je          0046D50A
 0046D324    lea         eax,[ebp-70]
 0046D327    push        eax
 0046D328    push        54
 0046D32A    push        ebx
 0046D32B    call        gdi32.GetObjectW
 0046D330    test        eax,eax
>0046D332    je          0046D50A
 0046D338    mov         eax,ebx
 0046D33A    call        DeselectBitmap
 0046D33F    xor         eax,eax
 0046D341    mov         dword ptr [ebp-8],eax
 0046D344    xor         eax,eax
 0046D346    mov         dword ptr [ebp-10],eax
 0046D349    xor         eax,eax
 0046D34B    push        ebp
 0046D34C    push        46D503
 0046D351    push        dword ptr fs:[eax]
 0046D354    mov         dword ptr fs:[eax],esp
 0046D357    push        0
 0046D359    call        user32.GetDC
 0046D35E    call        GDICheck
 0046D363    mov         dword ptr [ebp-8],eax
 0046D366    mov         eax,dword ptr [ebp-8]
 0046D369    push        eax
 0046D36A    call        gdi32.CreateCompatibleDC
 0046D36F    call        GDICheck
 0046D374    mov         dword ptr [ebp-10],eax
 0046D377    push        0
 0046D379    push        1
 0046D37B    push        1
 0046D37D    mov         eax,dword ptr [ebp-68]
 0046D380    push        eax
 0046D381    mov         eax,dword ptr [ebp-6C]
 0046D384    push        eax
 0046D385    call        gdi32.CreateBitmap
 0046D38A    mov         dword ptr [ebp-4],eax
 0046D38D    cmp         dword ptr [ebp-4],0
>0046D391    je          0046D4D5
 0046D397    mov         eax,dword ptr [ebp-4]
 0046D39A    push        eax
 0046D39B    mov         eax,dword ptr [ebp-10]
 0046D39E    push        eax
 0046D39F    call        gdi32.SelectObject
 0046D3A4    mov         dword ptr [ebp-1C],eax
 0046D3A7    cmp         edi,1FFFFFFF
>0046D3AD    jne         0046D3CB
 0046D3AF    push        42
 0046D3B1    mov         eax,dword ptr [ebp-68]
 0046D3B4    push        eax
 0046D3B5    mov         eax,dword ptr [ebp-6C]
 0046D3B8    push        eax
 0046D3B9    push        0
 0046D3BB    push        0
 0046D3BD    mov         eax,dword ptr [ebp-10]
 0046D3C0    push        eax
 0046D3C1    call        gdi32.PatBlt
>0046D3C6    jmp         0046D4C2
 0046D3CB    mov         eax,dword ptr [ebp-8]
 0046D3CE    push        eax
 0046D3CF    call        gdi32.CreateCompatibleDC
 0046D3D4    call        GDICheck
 0046D3D9    mov         dword ptr [ebp-0C],eax
 0046D3DC    xor         eax,eax
 0046D3DE    push        ebp
 0046D3DF    push        46D4BB
 0046D3E4    push        dword ptr fs:[eax]
 0046D3E7    mov         dword ptr fs:[eax],esp
 0046D3EA    cmp         dword ptr [ebp-5C],0
>0046D3EE    je          0046D40E
 0046D3F0    mov         byte ptr [ebp-11],1
 0046D3F4    xor         eax,eax
 0046D3F6    mov         dword ptr [ebp-58],eax
 0046D3F9    lea         eax,[ebp-70]
 0046D3FC    push        eax
 0046D3FD    push        0
 0046D3FF    mov         ecx,esi
 0046D401    mov         edx,esi
 0046D403    mov         eax,ebx
 0046D405    call        CopyBitmap
 0046D40A    mov         ebx,eax
>0046D40C    jmp         0046D412
 0046D40E    mov         byte ptr [ebp-11],0
 0046D412    push        ebx
 0046D413    mov         eax,dword ptr [ebp-0C]
 0046D416    push        eax
 0046D417    call        gdi32.SelectObject
 0046D41C    mov         dword ptr [ebp-18],eax
 0046D41F    test        esi,esi
>0046D421    je          0046D44D
 0046D423    push        0
 0046D425    push        esi
 0046D426    mov         eax,dword ptr [ebp-0C]
 0046D429    push        eax
 0046D42A    call        gdi32.SelectPalette
 0046D42F    mov         eax,dword ptr [ebp-0C]
 0046D432    push        eax
 0046D433    call        gdi32.RealizePalette
 0046D438    push        0
 0046D43A    push        esi
 0046D43B    mov         eax,dword ptr [ebp-10]
 0046D43E    push        eax
 0046D43F    call        gdi32.SelectPalette
 0046D444    mov         eax,dword ptr [ebp-10]
 0046D447    push        eax
 0046D448    call        gdi32.RealizePalette
 0046D44D    push        edi
 0046D44E    mov         eax,dword ptr [ebp-0C]
 0046D451    push        eax
 0046D452    call        gdi32.SetBkColor
 0046D457    mov         esi,eax
 0046D459    push        0CC0020
 0046D45E    push        0
 0046D460    push        0
 0046D462    mov         eax,dword ptr [ebp-0C]
 0046D465    push        eax
 0046D466    mov         eax,dword ptr [ebp-68]
 0046D469    push        eax
 0046D46A    mov         eax,dword ptr [ebp-6C]
 0046D46D    push        eax
 0046D46E    push        0
 0046D470    push        0
 0046D472    mov         eax,dword ptr [ebp-10]
 0046D475    push        eax
 0046D476    call        gdi32.BitBlt
 0046D47B    push        esi
 0046D47C    mov         eax,dword ptr [ebp-0C]
 0046D47F    push        eax
 0046D480    call        gdi32.SetBkColor
 0046D485    cmp         dword ptr [ebp-18],0
>0046D489    je          0046D498
 0046D48B    mov         eax,dword ptr [ebp-18]
 0046D48E    push        eax
 0046D48F    mov         eax,dword ptr [ebp-0C]
 0046D492    push        eax
 0046D493    call        gdi32.SelectObject
 0046D498    cmp         byte ptr [ebp-11],0
>0046D49C    je          0046D4A4
 0046D49E    push        ebx
 0046D49F    call        gdi32.DeleteObject
 0046D4A4    xor         eax,eax
 0046D4A6    pop         edx
 0046D4A7    pop         ecx
 0046D4A8    pop         ecx
 0046D4A9    mov         dword ptr fs:[eax],edx
 0046D4AC    push        46D4C2
 0046D4B1    mov         eax,dword ptr [ebp-0C]
 0046D4B4    push        eax
 0046D4B5    call        gdi32.DeleteDC
 0046D4BA    ret
>0046D4BB    jmp         @HandleFinally
>0046D4C0    jmp         0046D4B1
 0046D4C2    cmp         dword ptr [ebp-1C],0
>0046D4C6    je          0046D4D5
 0046D4C8    mov         eax,dword ptr [ebp-1C]
 0046D4CB    push        eax
 0046D4CC    mov         eax,dword ptr [ebp-10]
 0046D4CF    push        eax
 0046D4D0    call        gdi32.SelectObject
 0046D4D5    xor         eax,eax
 0046D4D7    pop         edx
 0046D4D8    pop         ecx
 0046D4D9    pop         ecx
 0046D4DA    mov         dword ptr fs:[eax],edx
 0046D4DD    push        46D50A
 0046D4E2    cmp         dword ptr [ebp-10],0
>0046D4E6    je          0046D4F1
 0046D4E8    mov         eax,dword ptr [ebp-10]
 0046D4EB    push        eax
 0046D4EC    call        gdi32.DeleteDC
 0046D4F1    cmp         dword ptr [ebp-8],0
>0046D4F5    je          0046D502
 0046D4F7    mov         eax,dword ptr [ebp-8]
 0046D4FA    push        eax
 0046D4FB    push        0
 0046D4FD    call        user32.ReleaseDC
 0046D502    ret
>0046D503    jmp         @HandleFinally
>0046D508    jmp         0046D4E2
 0046D50A    mov         eax,dword ptr [ebp-4]
 0046D50D    pop         edi
 0046D50E    pop         esi
 0046D50F    pop         ebx
 0046D510    mov         esp,ebp
 0046D512    pop         ebp
 0046D513    ret
*}
end;

//0046D514
constructor TBitmap.Create();
begin
{*
 0046D514    push        ebp
 0046D515    mov         ebp,esp
 0046D517    push        ecx
 0046D518    push        ebx
 0046D519    push        esi
 0046D51A    test        dl,dl
>0046D51C    je          0046D526
 0046D51E    add         esp,0FFFFFFF0
 0046D521    call        @ClassCreate
 0046D526    mov         byte ptr [ebp-1],dl
 0046D529    mov         ebx,eax
 0046D52B    xor         edx,edx
 0046D52D    mov         eax,ebx
 0046D52F    call        TGraphic.Create
 0046D534    mov         dword ptr [ebx+34],20000000
 0046D53B    mov         byte ptr [ebx+39],0
 0046D53F    mov         dl,1
 0046D541    mov         eax,[00463870];TBitmapImage
 0046D546    call        TObject.Create
 0046D54B    mov         esi,eax
 0046D54D    mov         dword ptr [ebx+28],esi
 0046D550    mov         eax,esi
 0046D552    inc         dword ptr [eax+4]
 0046D555    cmp         byte ptr ds:[785664],0
>0046D55C    je          0046D567
 0046D55E    mov         dl,1
 0046D560    mov         eax,ebx
 0046D562    mov         ecx,dword ptr [eax]
 0046D564    call        dword ptr [ecx+78]
 0046D567    mov         eax,ebx
 0046D569    cmp         byte ptr [ebp-1],0
>0046D56D    je          0046D57E
 0046D56F    call        @AfterConstruction
 0046D574    pop         dword ptr fs:[0]
 0046D57B    add         esp,0C
 0046D57E    mov         eax,ebx
 0046D580    pop         esi
 0046D581    pop         ebx
 0046D582    pop         ecx
 0046D583    pop         ebp
 0046D584    ret
*}
end;

//0046D588
destructor TBitmap.Destroy();
begin
{*
 0046D588    push        ebx
 0046D589    push        esi
 0046D58A    call        @BeforeDestruction
 0046D58F    mov         ebx,edx
 0046D591    mov         esi,eax
 0046D593    mov         eax,esi
 0046D595    call        TBitmap.FreeContext
 0046D59A    mov         eax,dword ptr [esi+28];TBitmap.FImage:TBitmapImage
 0046D59D    call        TSharedImage.Release
 0046D5A2    mov         eax,dword ptr [esi+2C];TBitmap.FCanvas:TCanvas
 0046D5A5    call        TObject.Free
 0046D5AA    mov         edx,ebx
 0046D5AC    and         dl,0FC
 0046D5AF    mov         eax,esi
 0046D5B1    call        TMemoryStream.Destroy
 0046D5B6    test        bl,bl
>0046D5B8    jle         0046D5C1
 0046D5BA    mov         eax,esi
 0046D5BC    call        @ClassDestroy
 0046D5C1    pop         esi
 0046D5C2    pop         ebx
 0046D5C3    ret
*}
end;

//0046D5C4
procedure TBitmap.Assign(Source:TPersistent);
begin
{*
 0046D5C4    push        ebp
 0046D5C5    mov         ebp,esp
 0046D5C7    add         esp,0FFFFFFA8
 0046D5CA    push        ebx
 0046D5CB    push        esi
 0046D5CC    mov         ebx,edx
 0046D5CE    mov         dword ptr [ebp-4],eax
 0046D5D1    test        ebx,ebx
>0046D5D3    je          0046D5EA
 0046D5D5    mov         eax,ebx
 0046D5D7    mov         edx,dword ptr ds:[463B28];TBitmap
 0046D5DD    call        @IsClass
 0046D5E2    test        al,al
>0046D5E4    je          0046D6C6
 0046D5EA    mov         eax,dword ptr [ebp-4]
 0046D5ED    call        TBitmap.FreeContext
 0046D5F2    push        79306C
 0046D5F7    call        kernel32.EnterCriticalSection
 0046D5FC    xor         edx,edx
 0046D5FE    push        ebp
 0046D5FF    push        46D69F
 0046D604    push        dword ptr fs:[edx]
 0046D607    mov         dword ptr fs:[edx],esp
 0046D60A    test        ebx,ebx
>0046D60C    je          0046D664
 0046D60E    mov         esi,ebx
 0046D610    mov         eax,dword ptr [esi+28]
 0046D613    inc         dword ptr [eax+4]
 0046D616    mov         eax,dword ptr [ebp-4]
 0046D619    mov         eax,dword ptr [eax+28]
 0046D61C    call        TSharedImage.Release
 0046D621    mov         eax,dword ptr [esi+28]
 0046D624    mov         edx,dword ptr [ebp-4]
 0046D627    mov         dword ptr [edx+28],eax
 0046D62A    movzx       eax,byte ptr [esi+21]
 0046D62E    mov         edx,dword ptr [ebp-4]
 0046D631    mov         byte ptr [edx+21],al
 0046D634    mov         eax,dword ptr [esi+34]
 0046D637    mov         edx,dword ptr [ebp-4]
 0046D63A    mov         dword ptr [edx+34],eax
 0046D63D    movzx       eax,byte ptr [esi+38]
 0046D641    mov         edx,dword ptr [ebp-4]
 0046D644    mov         byte ptr [edx+38],al
 0046D647    mov         eax,esi
 0046D649    call        TBitmap.GetPixelFormat
 0046D64E    mov         edx,eax
 0046D650    mov         eax,dword ptr [ebp-4]
 0046D653    call        TBitmap.SetPixelFormat
 0046D658    movzx       eax,byte ptr [esi+39]
 0046D65C    mov         edx,dword ptr [ebp-4]
 0046D65F    mov         byte ptr [edx+39],al
>0046D662    jmp         0046D687
 0046D664    lea         eax,[ebp-58]
 0046D667    xor         ecx,ecx
 0046D669    mov         edx,54
 0046D66E    call        @FillChar
 0046D673    lea         eax,[ebp-58]
 0046D676    push        eax
 0046D677    push        0
 0046D679    push        0
 0046D67B    xor         ecx,ecx
 0046D67D    xor         edx,edx
 0046D67F    mov         eax,dword ptr [ebp-4]
 0046D682    call        TBitmap.NewImage
 0046D687    xor         eax,eax
 0046D689    pop         edx
 0046D68A    pop         ecx
 0046D68B    pop         ecx
 0046D68C    mov         dword ptr fs:[eax],edx
 0046D68F    push        46D6A6
 0046D694    push        79306C
 0046D699    call        kernel32.LeaveCriticalSection
 0046D69E    ret
>0046D69F    jmp         @HandleFinally
>0046D6A4    jmp         0046D694
 0046D6A6    mov         eax,dword ptr [ebp-4]
 0046D6A9    mov         edx,dword ptr [eax]
 0046D6AB    call        dword ptr [edx+28]
 0046D6AE    test        eax,eax
 0046D6B0    setne       al
 0046D6B3    mov         edx,dword ptr [ebp-4]
 0046D6B6    mov         byte ptr [edx+22],al
 0046D6B9    mov         edx,dword ptr [ebp-4]
 0046D6BC    mov         eax,dword ptr [ebp-4]
 0046D6BF    mov         ecx,dword ptr [eax]
 0046D6C1    call        dword ptr [ecx+10]
>0046D6C4    jmp         0046D6D0
 0046D6C6    mov         edx,ebx
 0046D6C8    mov         eax,dword ptr [ebp-4]
 0046D6CB    call        TPersistent.Assign
 0046D6D0    pop         esi
 0046D6D1    pop         ebx
 0046D6D2    mov         esp,ebp
 0046D6D4    pop         ebp
 0046D6D5    ret
*}
end;

//0046D6D8
procedure TBitmap.CopyImage(AHandle:HBITMAP; APalette:HPALETTE; DIB:TDIBSection);
begin
{*
 0046D6D8    push        ebp
 0046D6D9    mov         ebp,esp
 0046D6DB    add         esp,0FFFFFFA4
 0046D6DE    push        ebx
 0046D6DF    push        esi
 0046D6E0    push        edi
 0046D6E1    mov         esi,dword ptr [ebp+8]
 0046D6E4    lea         edi,[ebp-5C]
 0046D6E7    push        ecx
 0046D6E8    mov         ecx,15
 0046D6ED    rep movs    dword ptr [edi],dword ptr [esi]
 0046D6EF    pop         ecx
 0046D6F0    mov         esi,ecx
 0046D6F2    mov         edi,edx
 0046D6F4    mov         ebx,eax
 0046D6F6    mov         eax,ebx
 0046D6F8    call        TBitmap.FreeContext
 0046D6FD    xor         eax,eax
 0046D6FF    mov         dword ptr [ebp-4],eax
 0046D702    xor         eax,eax
 0046D704    mov         dword ptr [ebp-8],eax
 0046D707    xor         eax,eax
 0046D709    push        ebp
 0046D70A    push        46D768
 0046D70F    push        dword ptr fs:[eax]
 0046D712    mov         dword ptr fs:[eax],esp
 0046D715    cmp         esi,dword ptr ds:[793050]
>0046D71B    jne         0046D722
 0046D71D    mov         dword ptr [ebp-8],esi
>0046D720    jmp         0046D72C
 0046D722    mov         eax,esi
 0046D724    call        CopyPalette
 0046D729    mov         dword ptr [ebp-8],eax
 0046D72C    lea         eax,[ebp-5C]
 0046D72F    push        eax
 0046D730    mov         eax,dword ptr [ebx+2C]
 0046D733    push        eax
 0046D734    mov         ecx,dword ptr [ebp-8]
 0046D737    mov         edx,esi
 0046D739    mov         eax,edi
 0046D73B    call        CopyBitmap
 0046D740    mov         dword ptr [ebp-4],eax
 0046D743    lea         eax,[ebp-5C]
 0046D746    push        eax
 0046D747    mov         eax,dword ptr [ebx+28]
 0046D74A    movzx       eax,byte ptr [eax+71]
 0046D74E    push        eax
 0046D74F    push        0
 0046D751    mov         ecx,dword ptr [ebp-8]
 0046D754    mov         edx,dword ptr [ebp-4]
 0046D757    mov         eax,ebx
 0046D759    call        TBitmap.NewImage
 0046D75E    xor         eax,eax
 0046D760    pop         edx
 0046D761    pop         ecx
 0046D762    pop         ecx
 0046D763    mov         dword ptr fs:[eax],edx
>0046D766    jmp         0046D78E
>0046D768    jmp         @HandleAnyException
 0046D76D    mov         eax,dword ptr [ebp-8]
 0046D770    call        InternalDeletePalette
 0046D775    cmp         dword ptr [ebp-4],0
>0046D779    je          0046D784
 0046D77B    mov         eax,dword ptr [ebp-4]
 0046D77E    push        eax
 0046D77F    call        gdi32.DeleteObject
 0046D784    call        @RaiseAgain
 0046D789    call        @DoneExcept
 0046D78E    pop         edi
 0046D78F    pop         esi
 0046D790    pop         ebx
 0046D791    mov         esp,ebp
 0046D793    pop         ebp
 0046D794    ret         4
*}
end;

//0046D798
procedure TBitmap.Changing(Sender:TObject);
begin
{*
 0046D798    push        ebx
 0046D799    mov         ebx,eax
 0046D79B    mov         eax,ebx
 0046D79D    call        TBitmap.FreeImage
 0046D7A2    mov         eax,dword ptr [ebx+28]
 0046D7A5    xor         edx,edx
 0046D7A7    mov         dword ptr [eax+50],edx
 0046D7AA    xor         edx,edx
 0046D7AC    mov         dword ptr [eax+54],edx
 0046D7AF    add         eax,6C
 0046D7B2    mov         edx,dword ptr [eax]
 0046D7B4    xor         ecx,ecx
 0046D7B6    mov         dword ptr [eax],ecx
 0046D7B8    mov         eax,edx
 0046D7BA    call        TObject.Free
 0046D7BF    pop         ebx
 0046D7C0    ret
*}
end;

//0046D7C4
procedure TBitmap.Changed(Sender:TObject);
begin
{*
 0046D7C4    mov         byte ptr [eax+31],0
 0046D7C8    call        TGraphic.Changed
 0046D7CD    ret
*}
end;

//0046D7D0
procedure TBitmap.Dormant;
begin
{*
 0046D7D0    push        ebx
 0046D7D1    push        esi
 0046D7D2    push        edi
 0046D7D3    add         esp,0FFFFFFAC
 0046D7D6    mov         ebx,eax
 0046D7D8    mov         dl,1
 0046D7DA    mov         eax,[0043DAFC];TMemoryStream
 0046D7DF    call        TObject.Create
 0046D7E4    mov         esi,eax
 0046D7E6    mov         edx,esi
 0046D7E8    mov         eax,ebx
 0046D7EA    mov         ecx,dword ptr [eax]
 0046D7EC    call        dword ptr [ecx+60]
 0046D7EF    mov         eax,esi
 0046D7F1    mov         edx,dword ptr [eax]
 0046D7F3    call        dword ptr [edx]
 0046D7F5    push        edx
 0046D7F6    push        eax
 0046D7F7    mov         eax,esi
 0046D7F9    call        TStream.SetSize64
 0046D7FE    mov         eax,dword ptr [ebx+28]
 0046D801    push        esi
 0046D802    lea         esi,[eax+18]
 0046D805    lea         edi,[esp+4]
 0046D809    mov         ecx,15
 0046D80E    rep movs    dword ptr [edi],dword ptr [esi]
 0046D810    pop         esi
 0046D811    xor         eax,eax
 0046D813    mov         dword ptr [esp+14],eax
 0046D817    mov         eax,ebx
 0046D819    call        TBitmap.FreeContext
 0046D81E    lea         eax,[ebx+2C]
 0046D821    mov         edx,dword ptr [eax]
 0046D823    xor         ecx,ecx
 0046D825    mov         dword ptr [eax],ecx
 0046D827    mov         eax,edx
 0046D829    call        TObject.Free
 0046D82E    push        esp
 0046D82F    mov         eax,dword ptr [ebx+28]
 0046D832    movzx       eax,byte ptr [eax+71]
 0046D836    push        eax
 0046D837    push        esi
 0046D838    xor         ecx,ecx
 0046D83A    xor         edx,edx
 0046D83C    mov         eax,ebx
 0046D83E    call        TBitmap.NewImage
 0046D843    add         esp,54
 0046D846    pop         edi
 0046D847    pop         esi
 0046D848    pop         ebx
 0046D849    ret
*}
end;

//0046D84C
procedure TBitmap.Draw(ACanvas:TCanvas; const Rect:TRect);
begin
{*
 0046D84C    push        ebp
 0046D84D    mov         ebp,esp
 0046D84F    add         esp,0FFFFFFE0
 0046D852    push        ebx
 0046D853    push        esi
 0046D854    push        edi
 0046D855    mov         edi,ecx
 0046D857    mov         dword ptr [ebp-4],edx
 0046D85A    mov         ebx,eax
 0046D85C    mov         esi,dword ptr [ebx+28]
 0046D85F    movzx       edx,byte ptr ds:[46DAF4]
 0046D866    mov         eax,dword ptr [ebp-4]
 0046D869    mov         ecx,dword ptr [eax]
 0046D86B    call        dword ptr [ecx+2C]
 0046D86E    mov         eax,ebx
 0046D870    call        TBitmap.PaletteNeeded
 0046D875    xor         eax,eax
 0046D877    mov         dword ptr [ebp-8],eax
 0046D87A    mov         byte ptr [ebp-9],0
 0046D87E    mov         eax,dword ptr [esi+10]
 0046D881    test        eax,eax
>0046D883    je          0046D8A7
 0046D885    push        0FF
 0046D887    push        eax
 0046D888    mov         eax,dword ptr [ebp-4]
 0046D88B    mov         eax,dword ptr [eax+38]
 0046D88E    push        eax
 0046D88F    call        gdi32.SelectPalette
 0046D894    mov         dword ptr [ebp-8],eax
 0046D897    mov         eax,dword ptr [ebp-4]
 0046D89A    mov         eax,dword ptr [eax+38]
 0046D89D    push        eax
 0046D89E    call        gdi32.RealizePalette
 0046D8A3    mov         byte ptr [ebp-9],1
 0046D8A7    push        0C
 0046D8A9    mov         eax,dword ptr [ebp-4]
 0046D8AC    mov         eax,dword ptr [eax+38]
 0046D8AF    push        eax
 0046D8B0    call        gdi32.GetDeviceCaps
 0046D8B5    push        eax
 0046D8B6    push        0E
 0046D8B8    mov         eax,dword ptr [ebp-4]
 0046D8BB    mov         eax,dword ptr [eax+38]
 0046D8BE    push        eax
 0046D8BF    call        gdi32.GetDeviceCaps
 0046D8C4    mov         edx,eax
 0046D8C6    pop         eax
 0046D8C7    imul        edx
 0046D8C9    cmp         eax,8
>0046D8CC    jg          0046D8DD
 0046D8CE    movzx       edx,word ptr [esi+2A]
 0046D8D2    movzx       ecx,word ptr [esi+28]
 0046D8D6    imul        edx,ecx
 0046D8D9    cmp         eax,edx
>0046D8DB    jl          0046D8E1
 0046D8DD    xor         eax,eax
>0046D8DF    jmp         0046D8E3
 0046D8E1    mov         al,1
 0046D8E3    test        al,al
>0046D8E5    je          0046D91F
 0046D8E7    lea         eax,[ebp-14]
 0046D8EA    push        eax
 0046D8EB    mov         eax,dword ptr [ebp-4]
 0046D8EE    mov         eax,dword ptr [eax+38]
 0046D8F1    push        eax
 0046D8F2    call        gdi32.GetBrushOrgEx
 0046D8F7    push        4
 0046D8F9    mov         eax,dword ptr [ebp-4]
 0046D8FC    mov         eax,dword ptr [eax+38]
 0046D8FF    push        eax
 0046D900    call        gdi32.SetStretchBltMode
 0046D905    lea         eax,[ebp-14]
 0046D908    push        eax
 0046D909    mov         eax,dword ptr [ebp-10]
 0046D90C    push        eax
 0046D90D    mov         eax,dword ptr [ebp-14]
 0046D910    push        eax
 0046D911    mov         eax,dword ptr [ebp-4]
 0046D914    mov         eax,dword ptr [eax+38]
 0046D917    push        eax
 0046D918    call        gdi32.SetBrushOrgEx
>0046D91D    jmp         0046D93A
 0046D91F    mov         eax,ebx
 0046D921    call        TBitmap.GetMonochrome
 0046D926    test        al,al
>0046D928    jne         0046D93A
 0046D92A    push        3
 0046D92C    mov         eax,dword ptr [ebp-4]
 0046D92F    call        TCanvas.GetHandle
 0046D934    push        eax
 0046D935    call        gdi32.SetStretchBltMode
 0046D93A    xor         eax,eax
 0046D93C    push        ebp
 0046D93D    push        46DAE3
 0046D942    push        dword ptr fs:[eax]
 0046D945    mov         dword ptr fs:[eax],esp
 0046D948    mov         eax,ebx
 0046D94A    mov         edx,dword ptr [eax]
 0046D94C    call        dword ptr [edx+2C]
 0046D94F    test        al,al
>0046D951    je          0046D95A
 0046D953    mov         eax,ebx
 0046D955    call        TBitmap.MaskHandleNeeded
 0046D95A    mov         eax,ebx
 0046D95C    call        TBitmap.GetCanvas
 0046D961    movzx       edx,byte ptr ds:[46DAF4]
 0046D968    mov         ecx,dword ptr [eax]
 0046D96A    call        dword ptr [ecx+2C]
 0046D96D    mov         eax,ebx
 0046D96F    mov         edx,dword ptr [eax]
 0046D971    call        dword ptr [edx+2C]
 0046D974    test        al,al
>0046D976    je          0046DA26
 0046D97C    xor         eax,eax
 0046D97E    mov         dword ptr [ebp-1C],eax
 0046D981    xor         eax,eax
 0046D983    mov         dword ptr [ebp-18],eax
 0046D986    xor         eax,eax
 0046D988    push        ebp
 0046D989    push        46DA1F
 0046D98E    push        dword ptr fs:[eax]
 0046D991    mov         dword ptr fs:[eax],esp
 0046D994    push        0
 0046D996    call        gdi32.CreateCompatibleDC
 0046D99B    call        GDICheck
 0046D9A0    mov         dword ptr [ebp-18],eax
 0046D9A3    mov         eax,dword ptr [esi+0C]
 0046D9A6    push        eax
 0046D9A7    mov         eax,dword ptr [ebp-18]
 0046D9AA    push        eax
 0046D9AB    call        gdi32.SelectObject
 0046D9B0    mov         dword ptr [ebp-1C],eax
 0046D9B3    mov         eax,dword ptr [edi+8]
 0046D9B6    sub         eax,dword ptr [edi]
 0046D9B8    push        eax
 0046D9B9    mov         eax,dword ptr [edi+0C]
 0046D9BC    sub         eax,dword ptr [edi+4]
 0046D9BF    push        eax
 0046D9C0    mov         eax,ebx
 0046D9C2    call        TBitmap.GetCanvas
 0046D9C7    mov         eax,dword ptr [eax+38]
 0046D9CA    push        eax
 0046D9CB    push        0
 0046D9CD    push        0
 0046D9CF    mov         eax,dword ptr [esi+1C]
 0046D9D2    push        eax
 0046D9D3    mov         eax,dword ptr [esi+20]
 0046D9D6    push        eax
 0046D9D7    mov         eax,dword ptr [ebp-18]
 0046D9DA    push        eax
 0046D9DB    push        0
 0046D9DD    push        0
 0046D9DF    mov         ecx,dword ptr [edi+4]
 0046D9E2    mov         edx,dword ptr [edi]
 0046D9E4    mov         eax,dword ptr [ebp-4]
 0046D9E7    mov         eax,dword ptr [eax+38]
 0046D9EA    call        TransparentStretchBlt
 0046D9EF    xor         eax,eax
 0046D9F1    pop         edx
 0046D9F2    pop         ecx
 0046D9F3    pop         ecx
 0046D9F4    mov         dword ptr fs:[eax],edx
 0046D9F7    push        46DABD
 0046D9FC    cmp         dword ptr [ebp-1C],0
>0046DA00    je          0046DA0F
 0046DA02    mov         eax,dword ptr [ebp-1C]
 0046DA05    push        eax
 0046DA06    mov         eax,dword ptr [ebp-18]
 0046DA09    push        eax
 0046DA0A    call        gdi32.SelectObject
 0046DA0F    cmp         dword ptr [ebp-18],0
>0046DA13    je          0046DA1E
 0046DA15    mov         eax,dword ptr [ebp-18]
 0046DA18    push        eax
 0046DA19    call        gdi32.DeleteDC
 0046DA1E    ret
>0046DA1F    jmp         @HandleFinally
>0046DA24    jmp         0046D9FC
 0046DA26    mov         eax,ebx
 0046DA28    mov         edx,dword ptr [eax]
 0046DA2A    call        dword ptr [edx+4C]
 0046DA2D    test        al,al
>0046DA2F    je          0046DA7F
 0046DA31    mov         byte ptr [ebp-20],0
 0046DA35    mov         byte ptr [ebp-1F],0
 0046DA39    mov         byte ptr [ebp-1E],0FF
 0046DA3D    mov         byte ptr [ebp-1D],1
 0046DA41    push        dword ptr [ebp-20]
 0046DA44    mov         eax,dword ptr [esi+20]
 0046DA47    push        eax
 0046DA48    mov         eax,dword ptr [esi+1C]
 0046DA4B    push        eax
 0046DA4C    push        0
 0046DA4E    push        0
 0046DA50    mov         eax,ebx
 0046DA52    call        TBitmap.GetCanvas
 0046DA57    mov         eax,dword ptr [eax+38]
 0046DA5A    push        eax
 0046DA5B    mov         eax,dword ptr [edi+0C]
 0046DA5E    sub         eax,dword ptr [edi+4]
 0046DA61    push        eax
 0046DA62    mov         eax,dword ptr [edi+8]
 0046DA65    sub         eax,dword ptr [edi]
 0046DA67    push        eax
 0046DA68    mov         eax,dword ptr [edi+4]
 0046DA6B    push        eax
 0046DA6C    mov         eax,dword ptr [edi]
 0046DA6E    push        eax
 0046DA6F    mov         eax,dword ptr [ebp-4]
 0046DA72    call        TCanvas.GetHandle
 0046DA77    push        eax
 0046DA78    call        msimg32.AlphaBlend
>0046DA7D    jmp         0046DABD
 0046DA7F    mov         eax,dword ptr [ebp-4]
 0046DA82    mov         eax,dword ptr [eax+54]
 0046DA85    push        eax
 0046DA86    mov         eax,dword ptr [esi+20]
 0046DA89    push        eax
 0046DA8A    mov         eax,dword ptr [esi+1C]
 0046DA8D    push        eax
 0046DA8E    push        0
 0046DA90    push        0
 0046DA92    mov         eax,ebx
 0046DA94    call        TBitmap.GetCanvas
 0046DA99    mov         eax,dword ptr [eax+38]
 0046DA9C    push        eax
 0046DA9D    mov         eax,dword ptr [edi+0C]
 0046DAA0    sub         eax,dword ptr [edi+4]
 0046DAA3    push        eax
 0046DAA4    mov         eax,dword ptr [edi+8]
 0046DAA7    sub         eax,dword ptr [edi]
 0046DAA9    push        eax
 0046DAAA    mov         eax,dword ptr [edi+4]
 0046DAAD    push        eax
 0046DAAE    mov         eax,dword ptr [edi]
 0046DAB0    push        eax
 0046DAB1    mov         eax,dword ptr [ebp-4]
 0046DAB4    mov         eax,dword ptr [eax+38]
 0046DAB7    push        eax
 0046DAB8    call        gdi32.StretchBlt
 0046DABD    xor         eax,eax
 0046DABF    pop         edx
 0046DAC0    pop         ecx
 0046DAC1    pop         ecx
 0046DAC2    mov         dword ptr fs:[eax],edx
 0046DAC5    push        46DAEA
 0046DACA    cmp         byte ptr [ebp-9],0
>0046DACE    je          0046DAE2
 0046DAD0    push        0FF
 0046DAD2    mov         eax,dword ptr [ebp-8]
 0046DAD5    push        eax
 0046DAD6    mov         eax,dword ptr [ebp-4]
 0046DAD9    mov         eax,dword ptr [eax+38]
 0046DADC    push        eax
 0046DADD    call        gdi32.SelectPalette
 0046DAE2    ret
>0046DAE3    jmp         @HandleFinally
>0046DAE8    jmp         0046DACA
 0046DAEA    pop         edi
 0046DAEB    pop         esi
 0046DAEC    pop         ebx
 0046DAED    mov         esp,ebp
 0046DAEF    pop         ebp
 0046DAF0    ret
*}
end;

//0046DAF8
procedure TBitmap.DrawTransparent(ACanvas:TCanvas; const Rect:TRect; Opacity:Byte);
begin
{*
 0046DAF8    push        ebp
 0046DAF9    mov         ebp,esp
 0046DAFB    add         esp,0FFFFFFE0
 0046DAFE    push        ebx
 0046DAFF    push        esi
 0046DB00    push        edi
 0046DB01    mov         edi,ecx
 0046DB03    mov         dword ptr [ebp-4],edx
 0046DB06    mov         ebx,eax
 0046DB08    mov         esi,dword ptr [ebx+28]
 0046DB0B    movzx       edx,byte ptr ds:[46DDB0]
 0046DB12    mov         eax,dword ptr [ebp-4]
 0046DB15    mov         ecx,dword ptr [eax]
 0046DB17    call        dword ptr [ecx+2C]
 0046DB1A    mov         eax,ebx
 0046DB1C    call        TBitmap.PaletteNeeded
 0046DB21    xor         eax,eax
 0046DB23    mov         dword ptr [ebp-8],eax
 0046DB26    mov         byte ptr [ebp-9],0
 0046DB2A    mov         eax,dword ptr [esi+10]
 0046DB2D    test        eax,eax
>0046DB2F    je          0046DB53
 0046DB31    push        0FF
 0046DB33    push        eax
 0046DB34    mov         eax,dword ptr [ebp-4]
 0046DB37    mov         eax,dword ptr [eax+38]
 0046DB3A    push        eax
 0046DB3B    call        gdi32.SelectPalette
 0046DB40    mov         dword ptr [ebp-8],eax
 0046DB43    mov         eax,dword ptr [ebp-4]
 0046DB46    mov         eax,dword ptr [eax+38]
 0046DB49    push        eax
 0046DB4A    call        gdi32.RealizePalette
 0046DB4F    mov         byte ptr [ebp-9],1
 0046DB53    push        0C
 0046DB55    mov         eax,dword ptr [ebp-4]
 0046DB58    mov         eax,dword ptr [eax+38]
 0046DB5B    push        eax
 0046DB5C    call        gdi32.GetDeviceCaps
 0046DB61    push        eax
 0046DB62    push        0E
 0046DB64    mov         eax,dword ptr [ebp-4]
 0046DB67    mov         eax,dword ptr [eax+38]
 0046DB6A    push        eax
 0046DB6B    call        gdi32.GetDeviceCaps
 0046DB70    mov         edx,eax
 0046DB72    pop         eax
 0046DB73    imul        edx
 0046DB75    cmp         eax,8
>0046DB78    jg          0046DB89
 0046DB7A    movzx       edx,word ptr [esi+2A]
 0046DB7E    movzx       ecx,word ptr [esi+28]
 0046DB82    imul        edx,ecx
 0046DB85    cmp         eax,edx
>0046DB87    jl          0046DB8D
 0046DB89    xor         eax,eax
>0046DB8B    jmp         0046DB8F
 0046DB8D    mov         al,1
 0046DB8F    test        al,al
>0046DB91    je          0046DBCB
 0046DB93    lea         eax,[ebp-14]
 0046DB96    push        eax
 0046DB97    mov         eax,dword ptr [ebp-4]
 0046DB9A    mov         eax,dword ptr [eax+38]
 0046DB9D    push        eax
 0046DB9E    call        gdi32.GetBrushOrgEx
 0046DBA3    push        4
 0046DBA5    mov         eax,dword ptr [ebp-4]
 0046DBA8    mov         eax,dword ptr [eax+38]
 0046DBAB    push        eax
 0046DBAC    call        gdi32.SetStretchBltMode
 0046DBB1    lea         eax,[ebp-14]
 0046DBB4    push        eax
 0046DBB5    mov         eax,dword ptr [ebp-10]
 0046DBB8    push        eax
 0046DBB9    mov         eax,dword ptr [ebp-14]
 0046DBBC    push        eax
 0046DBBD    mov         eax,dword ptr [ebp-4]
 0046DBC0    mov         eax,dword ptr [eax+38]
 0046DBC3    push        eax
 0046DBC4    call        gdi32.SetBrushOrgEx
>0046DBC9    jmp         0046DBE6
 0046DBCB    mov         eax,ebx
 0046DBCD    call        TBitmap.GetMonochrome
 0046DBD2    test        al,al
>0046DBD4    jne         0046DBE6
 0046DBD6    push        3
 0046DBD8    mov         eax,dword ptr [ebp-4]
 0046DBDB    call        TCanvas.GetHandle
 0046DBE0    push        eax
 0046DBE1    call        gdi32.SetStretchBltMode
 0046DBE6    xor         eax,eax
 0046DBE8    push        ebp
 0046DBE9    push        46DD9F
 0046DBEE    push        dword ptr fs:[eax]
 0046DBF1    mov         dword ptr fs:[eax],esp
 0046DBF4    mov         eax,ebx
 0046DBF6    mov         edx,dword ptr [eax]
 0046DBF8    call        dword ptr [edx+2C]
 0046DBFB    test        al,al
>0046DBFD    je          0046DC06
 0046DBFF    mov         eax,ebx
 0046DC01    call        TBitmap.MaskHandleNeeded
 0046DC06    mov         eax,ebx
 0046DC08    call        TBitmap.GetCanvas
 0046DC0D    movzx       edx,byte ptr ds:[46DDB0]
 0046DC14    mov         ecx,dword ptr [eax]
 0046DC16    call        dword ptr [ecx+2C]
 0046DC19    mov         eax,ebx
 0046DC1B    mov         edx,dword ptr [eax]
 0046DC1D    call        dword ptr [edx+2C]
 0046DC20    test        al,al
>0046DC22    je          0046DCD2
 0046DC28    xor         eax,eax
 0046DC2A    mov         dword ptr [ebp-1C],eax
 0046DC2D    xor         eax,eax
 0046DC2F    mov         dword ptr [ebp-18],eax
 0046DC32    xor         eax,eax
 0046DC34    push        ebp
 0046DC35    push        46DCCB
 0046DC3A    push        dword ptr fs:[eax]
 0046DC3D    mov         dword ptr fs:[eax],esp
 0046DC40    push        0
 0046DC42    call        gdi32.CreateCompatibleDC
 0046DC47    call        GDICheck
 0046DC4C    mov         dword ptr [ebp-18],eax
 0046DC4F    mov         eax,dword ptr [esi+0C]
 0046DC52    push        eax
 0046DC53    mov         eax,dword ptr [ebp-18]
 0046DC56    push        eax
 0046DC57    call        gdi32.SelectObject
 0046DC5C    mov         dword ptr [ebp-1C],eax
 0046DC5F    mov         eax,dword ptr [edi+8]
 0046DC62    sub         eax,dword ptr [edi]
 0046DC64    push        eax
 0046DC65    mov         eax,dword ptr [edi+0C]
 0046DC68    sub         eax,dword ptr [edi+4]
 0046DC6B    push        eax
 0046DC6C    mov         eax,ebx
 0046DC6E    call        TBitmap.GetCanvas
 0046DC73    mov         eax,dword ptr [eax+38]
 0046DC76    push        eax
 0046DC77    push        0
 0046DC79    push        0
 0046DC7B    mov         eax,dword ptr [esi+1C]
 0046DC7E    push        eax
 0046DC7F    mov         eax,dword ptr [esi+20]
 0046DC82    push        eax
 0046DC83    mov         eax,dword ptr [ebp-18]
 0046DC86    push        eax
 0046DC87    push        0
 0046DC89    push        0
 0046DC8B    mov         ecx,dword ptr [edi+4]
 0046DC8E    mov         edx,dword ptr [edi]
 0046DC90    mov         eax,dword ptr [ebp-4]
 0046DC93    mov         eax,dword ptr [eax+38]
 0046DC96    call        TransparentStretchBlt
 0046DC9B    xor         eax,eax
 0046DC9D    pop         edx
 0046DC9E    pop         ecx
 0046DC9F    pop         ecx
 0046DCA0    mov         dword ptr fs:[eax],edx
 0046DCA3    push        46DD79
 0046DCA8    cmp         dword ptr [ebp-1C],0
>0046DCAC    je          0046DCBB
 0046DCAE    mov         eax,dword ptr [ebp-1C]
 0046DCB1    push        eax
 0046DCB2    mov         eax,dword ptr [ebp-18]
 0046DCB5    push        eax
 0046DCB6    call        gdi32.SelectObject
 0046DCBB    cmp         dword ptr [ebp-18],0
>0046DCBF    je          0046DCCA
 0046DCC1    mov         eax,dword ptr [ebp-18]
 0046DCC4    push        eax
 0046DCC5    call        gdi32.DeleteDC
 0046DCCA    ret
>0046DCCB    jmp         @HandleFinally
>0046DCD0    jmp         0046DCA8
 0046DCD2    cmp         word ptr [esi+3E],20
>0046DCD7    jne         0046DD2A
 0046DCD9    mov         byte ptr [ebp-20],0
 0046DCDD    mov         byte ptr [ebp-1F],0
 0046DCE1    movzx       eax,byte ptr [ebp+8]
 0046DCE5    mov         byte ptr [ebp-1E],al
 0046DCE8    mov         byte ptr [ebp-1D],1
 0046DCEC    push        dword ptr [ebp-20]
 0046DCEF    mov         eax,dword ptr [esi+20]
 0046DCF2    push        eax
 0046DCF3    mov         eax,dword ptr [esi+1C]
 0046DCF6    push        eax
 0046DCF7    push        0
 0046DCF9    push        0
 0046DCFB    mov         eax,ebx
 0046DCFD    call        TBitmap.GetCanvas
 0046DD02    mov         eax,dword ptr [eax+38]
 0046DD05    push        eax
 0046DD06    mov         eax,dword ptr [edi+0C]
 0046DD09    sub         eax,dword ptr [edi+4]
 0046DD0C    push        eax
 0046DD0D    mov         eax,dword ptr [edi+8]
 0046DD10    sub         eax,dword ptr [edi]
 0046DD12    push        eax
 0046DD13    mov         eax,dword ptr [edi+4]
 0046DD16    push        eax
 0046DD17    mov         eax,dword ptr [edi]
 0046DD19    push        eax
 0046DD1A    mov         eax,dword ptr [ebp-4]
 0046DD1D    call        TCanvas.GetHandle
 0046DD22    push        eax
 0046DD23    call        msimg32.AlphaBlend
>0046DD28    jmp         0046DD79
 0046DD2A    mov         byte ptr [ebp-20],0
 0046DD2E    mov         byte ptr [ebp-1F],0
 0046DD32    movzx       eax,byte ptr [ebp+8]
 0046DD36    mov         byte ptr [ebp-1E],al
 0046DD39    mov         byte ptr [ebp-1D],0
 0046DD3D    push        dword ptr [ebp-20]
 0046DD40    mov         eax,dword ptr [esi+20]
 0046DD43    push        eax
 0046DD44    mov         eax,dword ptr [esi+1C]
 0046DD47    push        eax
 0046DD48    push        0
 0046DD4A    push        0
 0046DD4C    mov         eax,ebx
 0046DD4E    call        TBitmap.GetCanvas
 0046DD53    mov         eax,dword ptr [eax+38]
 0046DD56    push        eax
 0046DD57    mov         eax,dword ptr [edi+0C]
 0046DD5A    sub         eax,dword ptr [edi+4]
 0046DD5D    push        eax
 0046DD5E    mov         eax,dword ptr [edi+8]
 0046DD61    sub         eax,dword ptr [edi]
 0046DD63    push        eax
 0046DD64    mov         eax,dword ptr [edi+4]
 0046DD67    push        eax
 0046DD68    mov         eax,dword ptr [edi]
 0046DD6A    push        eax
 0046DD6B    mov         eax,dword ptr [ebp-4]
 0046DD6E    call        TCanvas.GetHandle
 0046DD73    push        eax
 0046DD74    call        msimg32.AlphaBlend
 0046DD79    xor         eax,eax
 0046DD7B    pop         edx
 0046DD7C    pop         ecx
 0046DD7D    pop         ecx
 0046DD7E    mov         dword ptr fs:[eax],edx
 0046DD81    push        46DDA6
 0046DD86    cmp         byte ptr [ebp-9],0
>0046DD8A    je          0046DD9E
 0046DD8C    push        0FF
 0046DD8E    mov         eax,dword ptr [ebp-8]
 0046DD91    push        eax
 0046DD92    mov         eax,dword ptr [ebp-4]
 0046DD95    mov         eax,dword ptr [eax+38]
 0046DD98    push        eax
 0046DD99    call        gdi32.SelectPalette
 0046DD9E    ret
>0046DD9F    jmp         @HandleFinally
>0046DDA4    jmp         0046DD86
 0046DDA6    pop         edi
 0046DDA7    pop         esi
 0046DDA8    pop         ebx
 0046DDA9    mov         esp,ebp
 0046DDAB    pop         ebp
 0046DDAC    ret         4
*}
end;

//0046DDB4
procedure TBitmap.FreeImage;
begin
{*
 0046DDB4    push        ebx
 0046DDB5    push        esi
 0046DDB6    mov         esi,eax
 0046DDB8    mov         ebx,dword ptr [esi+28]
 0046DDBB    cmp         dword ptr [ebx+4],1
>0046DDBF    jle         0046DDE8
 0046DDC1    mov         eax,esi
 0046DDC3    call        TBitmap.HandleNeeded
 0046DDC8    cmp         byte ptr [ebx+70],0
>0046DDCC    je          0046DDD2
 0046DDCE    xor         eax,eax
>0046DDD0    jmp         0046DDD5
 0046DDD2    mov         eax,dword ptr [ebx+10]
 0046DDD5    lea         edx,[ebx+18]
 0046DDD8    push        edx
 0046DDD9    mov         ecx,eax
 0046DDDB    mov         edx,dword ptr [ebx+8]
 0046DDDE    mov         eax,esi
 0046DDE0    call        TBitmap.CopyImage
 0046DDE5    pop         esi
 0046DDE6    pop         ebx
 0046DDE7    ret
 0046DDE8    mov         eax,dword ptr [ebx+8]
 0046DDEB    test        eax,eax
>0046DDED    je          0046DE14
 0046DDEF    cmp         eax,dword ptr [ebx+14]
>0046DDF2    je          0046DE14
 0046DDF4    mov         esi,dword ptr [ebx+14]
 0046DDF7    test        esi,esi
>0046DDF9    je          0046DE0A
 0046DDFB    push        esi
 0046DDFC    call        gdi32.DeleteObject
 0046DE01    test        eax,eax
>0046DE03    jne         0046DE0A
 0046DE05    call        GDIError
 0046DE0A    xor         eax,eax
 0046DE0C    mov         dword ptr [ebx+14],eax
 0046DE0F    xor         eax,eax
 0046DE11    mov         dword ptr [ebx+2C],eax
 0046DE14    pop         esi
 0046DE15    pop         ebx
 0046DE16    ret
*}
end;

//0046DE18
function TBitmap.GetEmpty:Boolean;
begin
{*
 0046DE18    mov         eax,dword ptr [eax+28]
 0046DE1B    cmp         dword ptr [eax+8],0
>0046DE1F    jne         0046DE2D
 0046DE21    cmp         dword ptr [eax+14],0
>0046DE25    jne         0046DE2D
 0046DE27    cmp         dword ptr [eax+6C],0
>0046DE2B    je          0046DE30
 0046DE2D    xor         eax,eax
 0046DE2F    ret
 0046DE30    mov         al,1
 0046DE32    ret
*}
end;

//0046DE34
function TBitmap.GetCanvas:TCanvas;
begin
{*
 0046DE34    push        ebx
 0046DE35    push        esi
 0046DE36    mov         ebx,eax
 0046DE38    cmp         dword ptr [ebx+2C],0
>0046DE3C    jne         0046DE73
 0046DE3E    mov         eax,ebx
 0046DE40    call        TBitmap.HandleNeeded
 0046DE45    cmp         dword ptr [ebx+2C],0
>0046DE49    jne         0046DE73
 0046DE4B    mov         ecx,ebx
 0046DE4D    mov         dl,1
 0046DE4F    mov         eax,[0046C52C];TBitmapCanvas
 0046DE54    call        TBitmapCanvas.Create
 0046DE59    mov         esi,eax
 0046DE5B    mov         dword ptr [ebx+2C],esi
 0046DE5E    mov         dword ptr [esi+0C],ebx
 0046DE61    mov         eax,dword ptr [ebx]
 0046DE63    mov         eax,dword ptr [eax+10]
 0046DE66    mov         dword ptr [esi+8],eax
 0046DE69    mov         dword ptr [esi+14],ebx
 0046DE6C    mov         dword ptr [esi+10],46D798;TBitmap.Changing
 0046DE73    mov         eax,dword ptr [ebx+2C]
 0046DE76    pop         esi
 0046DE77    pop         ebx
 0046DE78    ret
*}
end;

//0046DE7C
function TBitmap.GetHandle:HBITMAP;
begin
{*
 0046DE7C    push        ebx
 0046DE7D    mov         ebx,eax
 0046DE7F    mov         eax,ebx
 0046DE81    call        TBitmap.FreeContext
 0046DE86    mov         eax,ebx
 0046DE88    call        TBitmap.HandleNeeded
 0046DE8D    mov         edx,ebx
 0046DE8F    mov         eax,ebx
 0046DE91    call        TBitmap.Changing
 0046DE96    mov         eax,dword ptr [ebx+28]
 0046DE99    mov         eax,dword ptr [eax+8]
 0046DE9C    pop         ebx
 0046DE9D    ret
*}
end;

//0046DEA0
function TBitmap.HandleAllocated:Boolean;
begin
{*
 0046DEA0    mov         edx,dword ptr [eax+28]
 0046DEA3    test        edx,edx
>0046DEA5    je          0046DEAD
 0046DEA7    cmp         dword ptr [edx+8],0
>0046DEAB    jne         0046DEB0
 0046DEAD    xor         eax,eax
 0046DEAF    ret
 0046DEB0    mov         al,1
 0046DEB2    ret
*}
end;

//0046DEB4
function TBitmap.GetHandleType:TBitmapHandleType;
begin
{*
 0046DEB4    mov         eax,dword ptr [eax+28]
 0046DEB7    mov         edx,dword ptr [eax+8]
 0046DEBA    test        edx,edx
>0046DEBC    je          0046DEC3
 0046DEBE    cmp         edx,dword ptr [eax+14]
>0046DEC1    jne         0046DEDA
 0046DEC3    cmp         dword ptr [eax+14],0
>0046DEC7    jne         0046DED7
 0046DEC9    cmp         dword ptr [eax+30],0
>0046DECD    jne         0046DED3
 0046DECF    mov         al,1
>0046DED1    jmp         0046DEDC
 0046DED3    xor         eax,eax
>0046DED5    jmp         0046DEDC
 0046DED7    xor         eax,eax
 0046DED9    ret
 0046DEDA    mov         al,1
 0046DEDC    ret
*}
end;

//0046DEE0
function TBitmap.GetHeight:Integer;
begin
{*
 0046DEE0    mov         ecx,eax
 0046DEE2    mov         eax,dword ptr [ecx+28]
 0046DEE5    mov         eax,dword ptr [eax+20]
 0046DEE8    cdq
 0046DEE9    xor         eax,edx
 0046DEEB    sub         eax,edx
 0046DEED    ret
*}
end;

//0046DEF0
function TBitmap.GetMaskHandle:HBITMAP;
begin
{*
 0046DEF0    push        ebx
 0046DEF1    mov         ebx,eax
 0046DEF3    mov         eax,ebx
 0046DEF5    call        TBitmap.MaskHandleNeeded
 0046DEFA    mov         eax,dword ptr [ebx+28]
 0046DEFD    mov         eax,dword ptr [eax+0C]
 0046DF00    pop         ebx
 0046DF01    ret
*}
end;

//0046DF04
function TBitmap.GetMonochrome:Boolean;
begin
{*
 0046DF04    mov         eax,dword ptr [eax+28]
 0046DF07    add         eax,18
 0046DF0A    cmp         word ptr [eax+10],1
>0046DF0F    jne         0046DF18
 0046DF11    cmp         word ptr [eax+12],1
>0046DF16    je          0046DF1B
 0046DF18    xor         eax,eax
 0046DF1A    ret
 0046DF1B    mov         al,1
 0046DF1D    ret
*}
end;

//0046DF20
function TBitmap.GetPalette:HPALETTE;
begin
{*
 0046DF20    push        ebx
 0046DF21    mov         ebx,eax
 0046DF23    mov         eax,ebx
 0046DF25    call        TBitmap.PaletteNeeded
 0046DF2A    mov         eax,dword ptr [ebx+28]
 0046DF2D    mov         eax,dword ptr [eax+10]
 0046DF30    pop         ebx
 0046DF31    ret
*}
end;

//0046DF34
function TBitmap.GetPixelFormat:TPixelFormat;
begin
{*
 0046DF34    push        ebx
 0046DF35    push        esi
 0046DF36    mov         esi,eax
 0046DF38    mov         bl,8
 0046DF3A    mov         eax,esi
 0046DF3C    call        TBitmap.GetHandleType
 0046DF41    cmp         al,1
>0046DF43    jne         0046DF49
 0046DF45    xor         ebx,ebx
>0046DF47    jmp         0046DFB0
 0046DF49    mov         eax,dword ptr [esi+28]
 0046DF4C    lea         edx,[eax+18]
 0046DF4F    lea         eax,[edx+18]
 0046DF52    movzx       ecx,word ptr [eax+0E]
 0046DF56    cmp         ecx,10
>0046DF59    jg          0046DF6C
>0046DF5B    je          0046DF84
 0046DF5D    dec         ecx
>0046DF5E    je          0046DF78
 0046DF60    sub         ecx,3
>0046DF63    je          0046DF7C
 0046DF65    sub         ecx,4
>0046DF68    je          0046DF80
>0046DF6A    jmp         0046DFB0
 0046DF6C    sub         ecx,18
>0046DF6F    je          0046DFA4
 0046DF71    sub         ecx,8
>0046DF74    je          0046DFA8
>0046DF76    jmp         0046DFB0
 0046DF78    mov         bl,1
>0046DF7A    jmp         0046DFB0
 0046DF7C    mov         bl,2
>0046DF7E    jmp         0046DFB0
 0046DF80    mov         bl,3
>0046DF82    jmp         0046DFB0
 0046DF84    mov         eax,dword ptr [eax+10]
 0046DF87    sub         eax,1
>0046DF8A    jb          0046DF93
 0046DF8C    sub         eax,2
>0046DF8F    je          0046DF97
>0046DF91    jmp         0046DFB0
 0046DF93    mov         bl,4
>0046DF95    jmp         0046DFB0
 0046DF97    cmp         dword ptr [edx+44],7E0
>0046DF9E    jne         0046DFB0
 0046DFA0    mov         bl,5
>0046DFA2    jmp         0046DFB0
 0046DFA4    mov         bl,6
>0046DFA6    jmp         0046DFB0
 0046DFA8    cmp         dword ptr [eax+10],0
>0046DFAC    jne         0046DFB0
 0046DFAE    mov         bl,7
 0046DFB0    mov         eax,ebx
 0046DFB2    pop         esi
 0046DFB3    pop         ebx
 0046DFB4    ret
*}
end;

//0046DFB8
function TBitmap.GetScanline(Row:Integer):Pointer;
begin
{*
 0046DFB8    push        ebx
 0046DFB9    push        esi
 0046DFBA    push        edi
 0046DFBB    push        ebp
 0046DFBC    mov         edi,edx
 0046DFBE    mov         ebx,eax
 0046DFC0    mov         edx,ebx
 0046DFC2    mov         eax,ebx
 0046DFC4    call        TBitmap.Changing
 0046DFC9    mov         eax,dword ptr [ebx+28]
 0046DFCC    add         eax,18
 0046DFCF    mov         ebp,eax
 0046DFD1    lea         esi,[eax+18]
 0046DFD4    test        edi,edi
>0046DFD6    jl          0046DFDD
 0046DFD8    cmp         edi,dword ptr [ebp+8]
>0046DFDB    jl          0046DFE7
 0046DFDD    mov         eax,[0078D794];^SResString184:TResStringRec
 0046DFE2    call        InvalidOperation
 0046DFE7    mov         eax,ebx
 0046DFE9    call        TBitmap.DIBNeeded
 0046DFEE    call        gdi32.GdiFlush
 0046DFF3    mov         eax,dword ptr [esi+8]
 0046DFF6    test        eax,eax
>0046DFF8    jle         0046DFFF
 0046DFFA    sub         eax,edi
 0046DFFC    dec         eax
 0046DFFD    mov         edi,eax
 0046DFFF    movzx       edx,word ptr [esi+0E]
 0046E003    mov         ecx,20
 0046E008    mov         eax,dword ptr [esi+4]
 0046E00B    call        BytesPerScanline
 0046E010    imul        edi
 0046E012    add         eax,dword ptr [ebp+14]
 0046E015    mov         ebx,eax
 0046E017    mov         eax,ebx
 0046E019    pop         ebp
 0046E01A    pop         edi
 0046E01B    pop         esi
 0046E01C    pop         ebx
 0046E01D    ret
*}
end;

//0046E020
function TBitmap.GetSupportsPartialTransparency:Boolean;
begin
{*
 0046E020    mov         edx,dword ptr [eax+28]
 0046E023    cmp         word ptr [edx+3E],20
>0046E028    jne         0046E033
 0046E02A    movzx       eax,byte ptr [eax+39]
 0046E02E    dec         eax
 0046E02F    sub         al,2
>0046E031    jb          0046E036
 0046E033    xor         eax,eax
 0046E035    ret
 0046E036    mov         al,1
 0046E038    ret
*}
end;

//0046E03C
procedure TBitmap.PreMultiplyAlpha;
begin
{*
 0046E03C    push        ebx
 0046E03D    push        esi
 0046E03E    push        edi
 0046E03F    push        ebp
 0046E040    mov         esi,eax
 0046E042    mov         eax,dword ptr [esi+28]
 0046E045    cmp         word ptr [eax+3E],20
>0046E04A    jne         0046E0D9
 0046E050    cmp         dword ptr [eax+4],1
>0046E054    jle         0046E070
 0046E056    mov         ebx,eax
 0046E058    mov         eax,esi
 0046E05A    call        TBitmap.HandleNeeded
 0046E05F    lea         eax,[ebx+18]
 0046E062    push        eax
 0046E063    mov         ecx,dword ptr [ebx+10]
 0046E066    mov         edx,dword ptr [ebx+8]
 0046E069    mov         eax,esi
 0046E06B    call        TBitmap.CopyImage
 0046E070    mov         eax,dword ptr [esi+28]
 0046E073    mov         eax,dword ptr [eax+2C]
 0046E076    test        eax,eax
>0046E078    je          0046E0D9
 0046E07A    mov         ebx,eax
>0046E07C    jmp         0046E0C9
 0046E07E    lea         eax,[ebx+3]
 0046E081    movzx       edi,byte ptr [eax]
 0046E084    push        0FF
 0046E089    movzx       ebp,di
 0046E08C    push        ebp
 0046E08D    movzx       eax,byte ptr [ebx]
 0046E090    push        eax
 0046E091    call        kernel32.MulDiv
 0046E096    mov         byte ptr [ebx],al
 0046E098    push        0FF
 0046E09D    push        ebp
 0046E09E    lea         eax,[ebx+1]
 0046E0A1    movzx       eax,byte ptr [eax]
 0046E0A4    push        eax
 0046E0A5    call        kernel32.MulDiv
 0046E0AA    lea         edx,[ebx+1]
 0046E0AD    mov         byte ptr [edx],al
 0046E0AF    push        0FF
 0046E0B4    push        ebp
 0046E0B5    lea         eax,[ebx+2]
 0046E0B8    movzx       eax,byte ptr [eax]
 0046E0BB    push        eax
 0046E0BC    call        kernel32.MulDiv
 0046E0C1    lea         edx,[ebx+2]
 0046E0C4    mov         byte ptr [edx],al
 0046E0C6    add         ebx,4
 0046E0C9    mov         eax,dword ptr [esi+28]
 0046E0CC    mov         eax,dword ptr [eax+2C]
 0046E0CF    mov         edx,dword ptr [esi+28]
 0046E0D2    add         eax,dword ptr [edx+44]
 0046E0D5    cmp         eax,ebx
>0046E0D7    ja          0046E07E
 0046E0D9    pop         ebp
 0046E0DA    pop         edi
 0046E0DB    pop         esi
 0046E0DC    pop         ebx
 0046E0DD    ret
*}
end;

//0046E0E0
procedure TBitmap.UnPreMultiplyAlpha;
begin
{*
 0046E0E0    push        ebx
 0046E0E1    push        esi
 0046E0E2    push        edi
 0046E0E3    push        ebp
 0046E0E4    mov         esi,eax
 0046E0E6    mov         eax,dword ptr [esi+28]
 0046E0E9    cmp         word ptr [eax+3E],20
>0046E0EE    jne         0046E199
 0046E0F4    cmp         dword ptr [eax+4],1
>0046E0F8    jle         0046E114
 0046E0FA    mov         ebx,eax
 0046E0FC    mov         eax,esi
 0046E0FE    call        TBitmap.HandleNeeded
 0046E103    lea         eax,[ebx+18]
 0046E106    push        eax
 0046E107    mov         ecx,dword ptr [ebx+10]
 0046E10A    mov         edx,dword ptr [ebx+8]
 0046E10D    mov         eax,esi
 0046E10F    call        TBitmap.CopyImage
 0046E114    mov         eax,dword ptr [esi+28]
 0046E117    mov         eax,dword ptr [eax+2C]
 0046E11A    test        eax,eax
>0046E11C    je          0046E199
 0046E11E    mov         ebx,eax
>0046E120    jmp         0046E18C
 0046E122    lea         eax,[ebx+3]
 0046E125    cmp         byte ptr [eax],0
>0046E128    jne         0046E13B
 0046E12A    mov         byte ptr [ebx],0
 0046E12D    lea         eax,[ebx+1]
 0046E130    mov         byte ptr [eax],0
 0046E133    lea         eax,[ebx+2]
 0046E136    mov         byte ptr [eax],0
>0046E139    jmp         0046E189
 0046E13B    lea         eax,[ebx+3]
 0046E13E    movzx       edi,byte ptr [eax]
 0046E141    movzx       eax,di
 0046E144    push        eax
 0046E145    push        0FF
 0046E14A    movzx       eax,byte ptr [ebx]
 0046E14D    push        eax
 0046E14E    call        kernel32.MulDiv
 0046E153    mov         byte ptr [ebx],al
 0046E155    movzx       eax,di
 0046E158    push        eax
 0046E159    push        0FF
 0046E15E    lea         eax,[ebx+1]
 0046E161    movzx       eax,byte ptr [eax]
 0046E164    push        eax
 0046E165    call        kernel32.MulDiv
 0046E16A    lea         edx,[ebx+1]
 0046E16D    mov         byte ptr [edx],al
 0046E16F    movzx       eax,di
 0046E172    push        eax
 0046E173    push        0FF
 0046E178    lea         eax,[ebx+2]
 0046E17B    movzx       eax,byte ptr [eax]
 0046E17E    push        eax
 0046E17F    call        kernel32.MulDiv
 0046E184    lea         edx,[ebx+2]
 0046E187    mov         byte ptr [edx],al
 0046E189    add         ebx,4
 0046E18C    mov         ebp,dword ptr [esi+28]
 0046E18F    mov         eax,dword ptr [ebp+2C]
 0046E192    add         eax,dword ptr [ebp+44]
 0046E195    cmp         eax,ebx
>0046E197    ja          0046E122
 0046E199    pop         ebp
 0046E19A    pop         edi
 0046E19B    pop         esi
 0046E19C    pop         ebx
 0046E19D    ret
*}
end;

//0046E1A0
procedure TBitmap.SetAlphaFormat(Value:TAlphaFormat);
begin
{*
 0046E1A0    push        ebx
 0046E1A1    push        esi
 0046E1A2    push        edi
 0046E1A3    mov         ebx,edx
 0046E1A5    mov         esi,eax
 0046E1A7    cmp         bl,byte ptr [esi+39]
>0046E1AA    je          0046E1F5
 0046E1AC    mov         eax,dword ptr [esi+28]
 0046E1AF    cmp         dword ptr [eax+4],1
>0046E1B3    jle         0046E1CF
 0046E1B5    mov         edi,eax
 0046E1B7    mov         eax,esi
 0046E1B9    call        TBitmap.HandleNeeded
 0046E1BE    lea         eax,[edi+18]
 0046E1C1    push        eax
 0046E1C2    mov         ecx,dword ptr [edi+10]
 0046E1C5    mov         edx,dword ptr [edi+8]
 0046E1C8    mov         eax,esi
 0046E1CA    call        TBitmap.CopyImage
 0046E1CF    cmp         byte ptr [esi+39],0
>0046E1D3    jne         0046E1DE
 0046E1D5    mov         eax,esi
 0046E1D7    call        TBitmap.PreMultiplyAlpha
>0046E1DC    jmp         0046E1E9
 0046E1DE    test        bl,bl
>0046E1E0    jne         0046E1E9
 0046E1E2    mov         eax,esi
 0046E1E4    call        TBitmap.UnPreMultiplyAlpha
 0046E1E9    mov         byte ptr [esi+39],bl
 0046E1EC    mov         edx,esi
 0046E1EE    mov         eax,esi
 0046E1F0    mov         ecx,dword ptr [eax]
 0046E1F2    call        dword ptr [ecx+10]
 0046E1F5    pop         edi
 0046E1F6    pop         esi
 0046E1F7    pop         ebx
 0046E1F8    ret
*}
end;

//0046E1FC
function TBitmap.GetTransparentColor:TColor;
begin
{*
 0046E1FC    push        ebx
 0046E1FD    mov         ebx,eax
 0046E1FF    mov         eax,dword ptr [ebx+34]
 0046E202    cmp         eax,20000000
>0046E207    jne         0046E235
 0046E209    mov         eax,ebx
 0046E20B    call        TBitmap.GetMonochrome
 0046E210    test        al,al
>0046E212    je          0046E21B
 0046E214    mov         eax,0FFFFFF
>0046E219    jmp         0046E23A
 0046E21B    mov         eax,ebx
 0046E21D    mov         edx,dword ptr [eax]
 0046E21F    call        dword ptr [edx+24]
 0046E222    dec         eax
 0046E223    push        eax
 0046E224    mov         eax,ebx
 0046E226    call        TBitmap.GetCanvas
 0046E22B    xor         edx,edx
 0046E22D    pop         ecx
 0046E22E    mov         ebx,dword ptr [eax]
 0046E230    call        dword ptr [ebx+18]
>0046E233    jmp         0046E23A
 0046E235    call        ColorToRGB
 0046E23A    or          eax,2000000
 0046E23F    pop         ebx
 0046E240    ret
*}
end;

//0046E244
{*function TBitmap.GetWidth:?;
begin
 0046E244    mov         eax,dword ptr [eax+28];TBitmap.FImage:TBitmapImage
 0046E247    mov         eax,dword ptr [eax+1C];TBitmapImage.FDIB.dsBm:tagBITMAP
 0046E24A    ret
end;*}

//0046E24C
procedure TBitmap.DIBNeeded;
begin
{*
 0046E24C    push        ebx
 0046E24D    push        esi
 0046E24E    mov         ebx,dword ptr [eax+28]
 0046E251    cmp         dword ptr [ebx+8],0
>0046E255    je          0046E2BC
 0046E257    cmp         dword ptr [ebx+14],0
>0046E25B    jne         0046E2BC
 0046E25D    call        TBitmap.PaletteNeeded
 0046E262    cmp         dword ptr [ebx+30],0
>0046E266    jne         0046E2A4
 0046E268    lea         eax,[ebx+18]
 0046E26B    push        eax
 0046E26C    push        54
 0046E26E    mov         eax,dword ptr [ebx+8]
 0046E271    push        eax
 0046E272    call        gdi32.GetObjectW
 0046E277    lea         eax,[ebx+18]
 0046E27A    mov         edx,eax
 0046E27C    add         eax,18
 0046E27F    mov         dword ptr [eax],28
 0046E285    mov         ecx,dword ptr [edx+4]
 0046E288    mov         dword ptr [eax+4],ecx
 0046E28B    mov         ecx,dword ptr [edx+8]
 0046E28E    mov         dword ptr [eax+8],ecx
 0046E291    mov         word ptr [eax+0C],1
 0046E297    movzx       ecx,word ptr [edx+10]
 0046E29B    imul        cx,word ptr [edx+12]
 0046E2A0    mov         word ptr [eax+0E],cx
 0046E2A4    lea         eax,[ebx+18]
 0046E2A7    push        eax
 0046E2A8    push        0
 0046E2AA    mov         esi,dword ptr [ebx+10]
 0046E2AD    mov         ecx,esi
 0046E2AF    mov         edx,esi
 0046E2B1    mov         eax,dword ptr [ebx+8]
 0046E2B4    call        CopyBitmap
 0046E2B9    mov         dword ptr [ebx+14],eax
 0046E2BC    pop         esi
 0046E2BD    pop         ebx
 0046E2BE    ret
*}
end;

//0046E2C0
procedure TBitmap.FreeContext;
begin
{*
 0046E2C0    mov         edx,dword ptr [eax+2C]
 0046E2C3    test        edx,edx
>0046E2C5    je          0046E2CE
 0046E2C7    mov         eax,edx
 0046E2C9    call        TBitmapCanvas.FreeContext
 0046E2CE    ret
*}
end;

//0046E2D0
procedure TBitmap.HandleNeeded;
begin
{*
 0046E2D0    push        ebp
 0046E2D1    mov         ebp,esp
 0046E2D3    add         esp,0FFFFFFF0
 0046E2D6    mov         dword ptr [ebp-4],eax
 0046E2D9    mov         eax,dword ptr [ebp-4]
 0046E2DC    mov         eax,dword ptr [eax+28]
 0046E2DF    cmp         dword ptr [eax+8],0
>0046E2E3    jne         0046E35A
 0046E2E5    cmp         dword ptr [eax+14],0
>0046E2E9    jne         0046E35A
 0046E2EB    cmp         dword ptr [eax+6C],0
>0046E2EF    je          0046E35A
 0046E2F1    push        0
 0046E2F3    push        0
 0046E2F5    mov         eax,dword ptr [eax+6C]
 0046E2F8    call        TStream.SetPosition
 0046E2FD    mov         eax,dword ptr [ebp-4]
 0046E300    mov         edx,dword ptr [eax+10]
 0046E303    mov         dword ptr [ebp-10],edx
 0046E306    mov         edx,dword ptr [eax+14]
 0046E309    mov         dword ptr [ebp-0C],edx
 0046E30C    xor         eax,eax
 0046E30E    push        ebp
 0046E30F    push        46E353
 0046E314    push        dword ptr fs:[eax]
 0046E317    mov         dword ptr fs:[eax],esp
 0046E31A    mov         eax,dword ptr [ebp-4]
 0046E31D    xor         edx,edx
 0046E31F    mov         dword ptr [eax+10],edx
 0046E322    mov         dword ptr [eax+14],edx
 0046E325    mov         eax,dword ptr [ebp-4]
 0046E328    mov         eax,dword ptr [eax+28]
 0046E32B    mov         edx,dword ptr [eax+6C]
 0046E32E    mov         eax,dword ptr [ebp-4]
 0046E331    mov         ecx,dword ptr [eax]
 0046E333    call        dword ptr [ecx+5C]
 0046E336    xor         eax,eax
 0046E338    pop         edx
 0046E339    pop         ecx
 0046E33A    pop         ecx
 0046E33B    mov         dword ptr fs:[eax],edx
 0046E33E    push        46E35A
 0046E343    mov         eax,dword ptr [ebp-4]
 0046E346    mov         edx,dword ptr [ebp-10]
 0046E349    mov         dword ptr [eax+10],edx
 0046E34C    mov         edx,dword ptr [ebp-0C]
 0046E34F    mov         dword ptr [eax+14],edx
 0046E352    ret
>0046E353    jmp         @HandleFinally
>0046E358    jmp         0046E343
 0046E35A    mov         eax,dword ptr [ebp-4]
 0046E35D    mov         eax,dword ptr [eax+28]
 0046E360    cmp         dword ptr [eax+8],0
>0046E364    jne         0046E36C
 0046E366    mov         edx,dword ptr [eax+14]
 0046E369    mov         dword ptr [eax+8],edx
 0046E36C    mov         esp,ebp
 0046E36E    pop         ebp
 0046E36F    ret
*}
end;

//0046E370
procedure TBitmap.Mask(TransparentColor:TColor);
begin
{*
 0046E370    push        ebp
 0046E371    mov         ebp,esp
 0046E373    add         esp,0FFFFFFA4
 0046E376    push        ebx
 0046E377    push        esi
 0046E378    push        edi
 0046E379    mov         edi,edx
 0046E37B    mov         ebx,eax
 0046E37D    xor         eax,eax
 0046E37F    mov         dword ptr [ebp-4],eax
 0046E382    xor         eax,eax
 0046E384    mov         dword ptr [ebp-8],eax
 0046E387    xor         edx,edx
 0046E389    push        ebp
 0046E38A    push        46E41B
 0046E38F    push        dword ptr fs:[edx]
 0046E392    mov         dword ptr fs:[edx],esp
 0046E395    mov         eax,ebx
 0046E397    call        TBitmap.FreeContext
 0046E39C    mov         eax,ebx
 0046E39E    call        TBitmap.HandleNeeded
 0046E3A3    mov         eax,edi
 0046E3A5    call        ColorToRGB
 0046E3AA    mov         ecx,eax
 0046E3AC    mov         esi,dword ptr [ebx+28]
 0046E3AF    mov         edx,dword ptr [esi+10]
 0046E3B2    mov         eax,dword ptr [esi+8]
 0046E3B5    call        CopyBitmapAsMask
 0046E3BA    mov         dword ptr [ebp-4],eax
 0046E3BD    lea         eax,[ebp-5C]
 0046E3C0    xor         ecx,ecx
 0046E3C2    mov         edx,54
 0046E3C7    call        @FillChar
 0046E3CC    lea         eax,[ebp-5C]
 0046E3CF    push        eax
 0046E3D0    push        54
 0046E3D2    mov         eax,dword ptr [ebp-4]
 0046E3D5    push        eax
 0046E3D6    call        gdi32.GetObjectW
 0046E3DB    mov         eax,dword ptr [ebx+28]
 0046E3DE    mov         eax,dword ptr [eax+10]
 0046E3E1    cmp         eax,dword ptr ds:[793050]
>0046E3E7    jne         0046E3EE
 0046E3E9    mov         dword ptr [ebp-8],eax
>0046E3EC    jmp         0046E3F6
 0046E3EE    call        CopyPalette
 0046E3F3    mov         dword ptr [ebp-8],eax
 0046E3F6    lea         eax,[ebp-5C]
 0046E3F9    push        eax
 0046E3FA    mov         eax,dword ptr [ebx+28]
 0046E3FD    movzx       eax,byte ptr [eax+71]
 0046E401    push        eax
 0046E402    push        0
 0046E404    mov         ecx,dword ptr [ebp-8]
 0046E407    mov         edx,dword ptr [ebp-4]
 0046E40A    mov         eax,ebx
 0046E40C    call        TBitmap.NewImage
 0046E411    xor         eax,eax
 0046E413    pop         edx
 0046E414    pop         ecx
 0046E415    pop         ecx
 0046E416    mov         dword ptr fs:[eax],edx
>0046E419    jmp         0046E441
>0046E41B    jmp         @HandleAnyException
 0046E420    mov         eax,dword ptr [ebp-8]
 0046E423    call        InternalDeletePalette
 0046E428    cmp         dword ptr [ebp-4],0
>0046E42C    je          0046E437
 0046E42E    mov         eax,dword ptr [ebp-4]
 0046E431    push        eax
 0046E432    call        gdi32.DeleteObject
 0046E437    call        @RaiseAgain
 0046E43C    call        @DoneExcept
 0046E441    mov         edx,ebx
 0046E443    mov         eax,ebx
 0046E445    mov         ecx,dword ptr [eax]
 0046E447    call        dword ptr [ecx+10]
 0046E44A    pop         edi
 0046E44B    pop         esi
 0046E44C    pop         ebx
 0046E44D    mov         esp,ebp
 0046E44F    pop         ebp
 0046E450    ret
*}
end;

//0046E454
procedure TBitmap.MaskHandleNeeded;
begin
{*
 0046E454    push        ebx
 0046E455    push        esi
 0046E456    mov         ebx,eax
 0046E458    cmp         byte ptr [ebx+32],0
>0046E45C    je          0046E464
 0046E45E    cmp         byte ptr [ebx+31],0
>0046E462    jne         0046E4B1
 0046E464    mov         esi,dword ptr [ebx+28]
 0046E467    mov         eax,dword ptr [esi+0C]
 0046E46A    test        eax,eax
>0046E46C    je          0046E481
 0046E46E    call        DeselectBitmap
 0046E473    mov         eax,dword ptr [esi+0C]
 0046E476    push        eax
 0046E477    call        gdi32.DeleteObject
 0046E47C    xor         eax,eax
 0046E47E    mov         dword ptr [esi+0C],eax
 0046E481    mov         eax,ebx
 0046E483    call        TBitmap.FreeContext
 0046E488    mov         eax,ebx
 0046E48A    call        TBitmap.HandleNeeded
 0046E48F    mov         esi,dword ptr [ebx+28]
 0046E492    mov         eax,ebx
 0046E494    call        TBitmap.GetTransparentColor
 0046E499    mov         ecx,eax
 0046E49B    mov         edx,dword ptr [esi+10]
 0046E49E    mov         eax,dword ptr [esi+8]
 0046E4A1    call        CopyBitmapAsMask
 0046E4A6    mov         dword ptr [esi+0C],eax
 0046E4A9    mov         byte ptr [ebx+32],1
 0046E4AD    mov         byte ptr [ebx+31],1
 0046E4B1    pop         esi
 0046E4B2    pop         ebx
 0046E4B3    ret
*}
end;

//0046E4B4
procedure TBitmap.PaletteNeeded;
begin
{*
 0046E4B4    push        ebx
 0046E4B5    push        esi
 0046E4B6    push        edi
 0046E4B7    push        ebp
 0046E4B8    mov         edi,eax
 0046E4BA    mov         ebp,dword ptr [edi+28]
 0046E4BD    cmp         byte ptr [edi+30],0
>0046E4C1    jne         0046E567
 0046E4C7    cmp         dword ptr [ebp+10],0
>0046E4CB    jne         0046E567
 0046E4D1    cmp         dword ptr [ebp+14],0
>0046E4D5    je          0046E567
 0046E4DB    mov         eax,dword ptr [ebp+14]
 0046E4DE    cmp         eax,dword ptr [ebp+8]
>0046E4E1    jne         0046E4E8
 0046E4E3    call        DeselectBitmap
 0046E4E8    movzx       ecx,word ptr [ebp+3E]
 0046E4EC    mov         eax,1
 0046E4F1    shl         eax,cl
 0046E4F3    mov         ecx,eax
 0046E4F5    xor         edx,edx
 0046E4F7    mov         eax,dword ptr [ebp+14]
 0046E4FA    call        PaletteFromDIBColorTable
 0046E4FF    mov         esi,eax
 0046E501    mov         dword ptr [ebp+10],esi
 0046E504    test        esi,esi
>0046E506    jne         0046E567
 0046E508    push        0
 0046E50A    call        user32.GetDC
 0046E50F    call        GDICheck
 0046E514    mov         esi,eax
 0046E516    cmp         byte ptr [ebp+70],0
>0046E51A    jne         0046E543
 0046E51C    push        0C
 0046E51E    push        esi
 0046E51F    call        gdi32.GetDeviceCaps
 0046E524    mov         ebx,eax
 0046E526    push        0E
 0046E528    push        esi
 0046E529    call        gdi32.GetDeviceCaps
 0046E52E    imul        ebx,eax
 0046E531    movzx       eax,word ptr [ebp+2A]
 0046E535    movzx       edx,word ptr [ebp+28]
 0046E539    imul        edx
 0046E53B    cmp         ebx,eax
>0046E53D    jl          0046E543
 0046E53F    xor         ebx,ebx
>0046E541    jmp         0046E545
 0046E543    mov         bl,1
 0046E545    mov         byte ptr [ebp+70],bl
 0046E548    test        bl,bl
>0046E54A    je          0046E555
 0046E54C    push        esi
 0046E54D    call        gdi32.CreateHalftonePalette
 0046E552    mov         dword ptr [ebp+10],eax
 0046E555    push        esi
 0046E556    push        0
 0046E558    call        user32.ReleaseDC
 0046E55D    cmp         dword ptr [ebp+10],0
>0046E561    jne         0046E567
 0046E563    mov         byte ptr [edi+30],1
 0046E567    pop         ebp
 0046E568    pop         edi
 0046E569    pop         esi
 0046E56A    pop         ebx
 0046E56B    ret
*}
end;

//0046E56C
procedure TBitmap.LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE);
begin
{*
 0046E56C    push        ebp
 0046E56D    mov         ebp,esp
 0046E56F    add         esp,0FFFFFFAC
 0046E572    push        ebx
 0046E573    push        esi
 0046E574    mov         ebx,ecx
 0046E576    mov         esi,eax
 0046E578    cmp         dx,2
>0046E57C    jne         0046E582
 0046E57E    test        ebx,ebx
>0046E580    jne         0046E58C
 0046E582    mov         eax,[0078D5E0];^SResString189:TResStringRec
 0046E587    call        InvalidGraphic
 0046E58C    mov         eax,esi
 0046E58E    call        TBitmap.FreeContext
 0046E593    lea         eax,[ebp-54]
 0046E596    xor         ecx,ecx
 0046E598    mov         edx,54
 0046E59D    call        @FillChar
 0046E5A2    lea         eax,[ebp-54]
 0046E5A5    push        eax
 0046E5A6    push        54
 0046E5A8    push        ebx
 0046E5A9    call        gdi32.GetObjectW
 0046E5AE    cmp         dword ptr [ebp-40],0
>0046E5B2    jne         0046E5B9
 0046E5B4    xor         eax,eax
 0046E5B6    mov         dword ptr [ebp-3C],eax
 0046E5B9    lea         eax,[ebp-54]
 0046E5BC    push        eax
 0046E5BD    mov         ecx,dword ptr [ebp+8]
 0046E5C0    mov         edx,ebx
 0046E5C2    mov         eax,esi
 0046E5C4    call        TBitmap.CopyImage
 0046E5C9    mov         eax,dword ptr [esi+28]
 0046E5CC    mov         byte ptr [eax+71],0
 0046E5D0    mov         eax,esi
 0046E5D2    mov         edx,dword ptr [eax]
 0046E5D4    call        dword ptr [edx+28]
 0046E5D7    test        eax,eax
 0046E5D9    setne       al
 0046E5DC    mov         byte ptr [esi+22],al
 0046E5DF    mov         edx,esi
 0046E5E1    mov         eax,esi
 0046E5E3    mov         ecx,dword ptr [eax]
 0046E5E5    call        dword ptr [ecx+10]
 0046E5E8    pop         esi
 0046E5E9    pop         ebx
 0046E5EA    mov         esp,ebp
 0046E5EC    pop         ebp
 0046E5ED    ret         4
*}
end;

//0046E5F0
procedure TBitmap.LoadFromResourceName(Instance:Cardinal; ResName:string);
begin
{*
 0046E5F0    push        ebp
 0046E5F1    mov         ebp,esp
 0046E5F3    push        ecx
 0046E5F4    push        ebx
 0046E5F5    push        esi
 0046E5F6    push        edi
 0046E5F7    mov         edi,ecx
 0046E5F9    mov         esi,edx
 0046E5FB    mov         ebx,eax
 0046E5FD    mov         eax,ebx
 0046E5FF    call        TBitmap.FreeContext
 0046E604    push        edi
 0046E605    push        2
 0046E607    mov         ecx,esi
 0046E609    mov         dl,1
 0046E60B    mov         eax,[0043E1E4];TResourceStream
 0046E610    call        TResourceStream.Create
 0046E615    mov         dword ptr [ebp-4],eax
 0046E618    xor         eax,eax
 0046E61A    push        ebp
 0046E61B    push        46E651
 0046E620    push        dword ptr fs:[eax]
 0046E623    mov         dword ptr fs:[eax],esp
 0046E626    push        0
 0046E628    mov         eax,dword ptr [ebp-4]
 0046E62B    mov         edx,dword ptr [eax]
 0046E62D    call        dword ptr [edx]
 0046E62F    mov         ecx,eax
 0046E631    mov         edx,dword ptr [ebp-4]
 0046E634    mov         eax,ebx
 0046E636    call        TBitmap.ReadDIB
 0046E63B    xor         eax,eax
 0046E63D    pop         edx
 0046E63E    pop         ecx
 0046E63F    pop         ecx
 0046E640    mov         dword ptr fs:[eax],edx
 0046E643    push        46E658
 0046E648    mov         eax,dword ptr [ebp-4]
 0046E64B    call        TObject.Free
 0046E650    ret
>0046E651    jmp         @HandleFinally
>0046E656    jmp         0046E648
 0046E658    pop         edi
 0046E659    pop         esi
 0046E65A    pop         ebx
 0046E65B    pop         ecx
 0046E65C    pop         ebp
 0046E65D    ret
*}
end;

//0046E660
procedure TBitmap.LoadFromResourceID(Instance:Cardinal; ResID:Integer);
begin
{*
 0046E660    push        ebp
 0046E661    mov         ebp,esp
 0046E663    push        ecx
 0046E664    push        ebx
 0046E665    push        esi
 0046E666    push        edi
 0046E667    mov         edi,ecx
 0046E669    mov         esi,edx
 0046E66B    mov         ebx,eax
 0046E66D    mov         eax,ebx
 0046E66F    call        TBitmap.FreeContext
 0046E674    push        edi
 0046E675    push        2
 0046E677    mov         ecx,esi
 0046E679    mov         dl,1
 0046E67B    mov         eax,[0043E1E4];TResourceStream
 0046E680    call        TResourceStream.CreateFromID
 0046E685    mov         dword ptr [ebp-4],eax
 0046E688    xor         eax,eax
 0046E68A    push        ebp
 0046E68B    push        46E6C1
 0046E690    push        dword ptr fs:[eax]
 0046E693    mov         dword ptr fs:[eax],esp
 0046E696    push        0
 0046E698    mov         eax,dword ptr [ebp-4]
 0046E69B    mov         edx,dword ptr [eax]
 0046E69D    call        dword ptr [edx]
 0046E69F    mov         ecx,eax
 0046E6A1    mov         edx,dword ptr [ebp-4]
 0046E6A4    mov         eax,ebx
 0046E6A6    call        TBitmap.ReadDIB
 0046E6AB    xor         eax,eax
 0046E6AD    pop         edx
 0046E6AE    pop         ecx
 0046E6AF    pop         ecx
 0046E6B0    mov         dword ptr fs:[eax],edx
 0046E6B3    push        46E6C8
 0046E6B8    mov         eax,dword ptr [ebp-4]
 0046E6BB    call        TObject.Free
 0046E6C0    ret
>0046E6C1    jmp         @HandleFinally
>0046E6C6    jmp         0046E6B8
 0046E6C8    pop         edi
 0046E6C9    pop         esi
 0046E6CA    pop         ebx
 0046E6CB    pop         ecx
 0046E6CC    pop         ebp
 0046E6CD    ret
*}
end;

//0046E6D0
procedure TBitmap.LoadFromStream(Stream:TStream);
begin
{*
 0046E6D0    push        ebx
 0046E6D1    push        esi
 0046E6D2    mov         ebx,edx
 0046E6D4    mov         esi,eax
 0046E6D6    mov         eax,ebx
 0046E6D8    mov         edx,dword ptr [eax]
 0046E6DA    call        dword ptr [edx]
 0046E6DC    push        eax
 0046E6DD    mov         eax,ebx
 0046E6DF    call        TStream.GetPosition
 0046E6E4    pop         ecx
 0046E6E5    sub         ecx,eax
 0046E6E7    mov         edx,ebx
 0046E6E9    mov         eax,esi
 0046E6EB    call        TBitmap.ReadStream
 0046E6F0    pop         esi
 0046E6F1    pop         ebx
 0046E6F2    ret
*}
end;

//0046E6F4
procedure TBitmap.NewImage(NewHandle:HBITMAP; NewPalette:HPALETTE; const NewDIB:TDIBSection; OS2Format:Boolean; RLEStream:TStream);
begin
{*
 0046E6F4    push        ebp
 0046E6F5    mov         ebp,esp
 0046E6F7    add         esp,0FFFFFFF8
 0046E6FA    push        ebx
 0046E6FB    push        esi
 0046E6FC    push        edi
 0046E6FD    mov         esi,ecx
 0046E6FF    mov         ebx,edx
 0046E701    mov         dword ptr [ebp-4],eax
 0046E704    mov         dl,1
 0046E706    mov         eax,[00463870];TBitmapImage
 0046E70B    call        TObject.Create
 0046E710    mov         dword ptr [ebp-8],eax
 0046E713    xor         eax,eax
 0046E715    push        ebp
 0046E716    push        46E77C
 0046E71B    push        dword ptr fs:[eax]
 0046E71E    mov         dword ptr fs:[eax],esp
 0046E721    mov         eax,dword ptr [ebp-8]
 0046E724    mov         dword ptr [eax+8],ebx
 0046E727    mov         eax,dword ptr [ebp-8]
 0046E72A    mov         dword ptr [eax+10],esi
 0046E72D    mov         eax,dword ptr [ebp+10]
 0046E730    mov         edx,dword ptr [ebp-8]
 0046E733    mov         esi,eax
 0046E735    lea         edi,[edx+18]
 0046E738    mov         ecx,15
 0046E73D    rep movs    dword ptr [edi],dword ptr [esi]
 0046E73F    mov         eax,dword ptr [ebp-8]
 0046E742    movzx       edx,byte ptr [ebp+0C]
 0046E746    mov         byte ptr [eax+71],dl
 0046E749    mov         eax,dword ptr [ebp-8]
 0046E74C    cmp         dword ptr [eax+2C],0
>0046E750    je          0046E75E
 0046E752    mov         eax,dword ptr [ebp-8]
 0046E755    mov         eax,dword ptr [eax+8]
 0046E758    mov         edx,dword ptr [ebp-8]
 0046E75B    mov         dword ptr [edx+14],eax
 0046E75E    mov         eax,dword ptr [ebp+8]
 0046E761    mov         edx,dword ptr ds:[43DAFC];TMemoryStream
 0046E767    call        @AsClass
 0046E76C    mov         edx,dword ptr [ebp-8]
 0046E76F    mov         dword ptr [edx+6C],eax
 0046E772    xor         eax,eax
 0046E774    pop         edx
 0046E775    pop         ecx
 0046E776    pop         ecx
 0046E777    mov         dword ptr fs:[eax],edx
>0046E77A    jmp         0046E793
>0046E77C    jmp         @HandleAnyException
 0046E781    mov         eax,dword ptr [ebp-8]
 0046E784    call        TObject.Free
 0046E789    call        @RaiseAgain
 0046E78E    call        @DoneExcept
 0046E793    push        79306C
 0046E798    call        kernel32.EnterCriticalSection
 0046E79D    xor         edx,edx
 0046E79F    push        ebp
 0046E7A0    push        46E7DA
 0046E7A5    push        dword ptr fs:[edx]
 0046E7A8    mov         dword ptr fs:[edx],esp
 0046E7AB    mov         eax,dword ptr [ebp-4]
 0046E7AE    mov         eax,dword ptr [eax+28]
 0046E7B1    call        TSharedImage.Release
 0046E7B6    mov         edx,dword ptr [ebp-4]
 0046E7B9    mov         eax,dword ptr [ebp-8]
 0046E7BC    mov         dword ptr [edx+28],eax
 0046E7BF    inc         dword ptr [eax+4]
 0046E7C2    xor         eax,eax
 0046E7C4    pop         edx
 0046E7C5    pop         ecx
 0046E7C6    pop         ecx
 0046E7C7    mov         dword ptr fs:[eax],edx
 0046E7CA    push        46E7E1
 0046E7CF    push        79306C
 0046E7D4    call        kernel32.LeaveCriticalSection
 0046E7D9    ret
>0046E7DA    jmp         @HandleFinally
>0046E7DF    jmp         0046E7CF
 0046E7E1    mov         eax,dword ptr [ebp-4]
 0046E7E4    mov         byte ptr [eax+32],0
 0046E7E8    pop         edi
 0046E7E9    pop         esi
 0046E7EA    pop         ebx
 0046E7EB    pop         ecx
 0046E7EC    pop         ecx
 0046E7ED    pop         ebp
 0046E7EE    ret         0C
*}
end;

//0046E7F4
procedure TBitmap.ReadData(Stream:TStream);
begin
{*
 0046E7F4    push        ebx
 0046E7F5    push        esi
 0046E7F6    push        edi
 0046E7F7    push        ecx
 0046E7F8    mov         esi,edx
 0046E7FA    mov         ebx,eax
 0046E7FC    mov         edx,esp
 0046E7FE    mov         ecx,4
 0046E803    mov         eax,esi
 0046E805    mov         edi,dword ptr [eax]
 0046E807    call        dword ptr [edi+0C]
 0046E80A    mov         ecx,dword ptr [esp]
 0046E80D    mov         edx,esi
 0046E80F    mov         eax,ebx
 0046E811    call        TBitmap.ReadStream
 0046E816    pop         edx
 0046E817    pop         edi
 0046E818    pop         esi
 0046E819    pop         ebx
 0046E81A    ret
*}
end;

//0046E81C
procedure TBitmap.ReadDIB(Stream:TStream; ImageSize:LongWord; bmf:PBitmapFileHeader);
begin
{*
 0046E81C    push        ebp
 0046E81D    mov         ebp,esp
 0046E81F    add         esp,0FFFFFF54
 0046E825    push        ebx
 0046E826    push        esi
 0046E827    push        edi
 0046E828    mov         esi,ecx
 0046E82A    mov         dword ptr [ebp-8],edx
 0046E82D    mov         dword ptr [ebp-4],eax
 0046E830    xor         eax,eax
 0046E832    mov         dword ptr [ebp-30],eax
 0046E835    xor         eax,eax
 0046E837    mov         dword ptr [ebp-28],eax
 0046E83A    xor         eax,eax
 0046E83C    mov         dword ptr [ebp-38],eax
 0046E83F    lea         edx,[ebp-20]
 0046E842    mov         ecx,4
 0046E847    mov         eax,dword ptr [ebp-8]
 0046E84A    mov         ebx,dword ptr [eax]
 0046E84C    call        dword ptr [ebx+0C]
 0046E84F    cmp         dword ptr [ebp-20],0C
 0046E853    sete        byte ptr [ebp-21]
 0046E857    cmp         byte ptr [ebp-21],0
>0046E85B    je          0046E864
 0046E85D    mov         dword ptr [ebp-20],28
 0046E864    mov         eax,dword ptr [ebp-20]
 0046E867    add         eax,0C
 0046E86A    add         eax,400
 0046E86F    call        @GetMem
 0046E874    mov         dword ptr [ebp-18],eax
 0046E877    mov         eax,dword ptr [ebp-18]
 0046E87A    mov         dword ptr [ebp-3C],eax
 0046E87D    xor         edx,edx
 0046E87F    push        ebp
 0046E880    push        46ED3F
 0046E885    push        dword ptr fs:[edx]
 0046E888    mov         dword ptr fs:[edx],esp
 0046E88B    xor         edx,edx
 0046E88D    push        ebp
 0046E88E    push        46ED12
 0046E893    push        dword ptr fs:[edx]
 0046E896    mov         dword ptr fs:[edx],esp
 0046E899    cmp         byte ptr [ebp-21],0
>0046E89D    je          0046E8EB
 0046E89F    lea         edx,[ebp-48]
 0046E8A2    add         edx,4
 0046E8A5    mov         ecx,8
 0046E8AA    mov         eax,dword ptr [ebp-8]
 0046E8AD    mov         ebx,dword ptr [eax]
 0046E8AF    call        dword ptr [ebx+0C]
 0046E8B2    mov         ebx,dword ptr [ebp-3C]
 0046E8B5    mov         eax,ebx
 0046E8B7    xor         ecx,ecx
 0046E8B9    mov         edx,28
 0046E8BE    call        @FillChar
 0046E8C3    mov         eax,ebx
 0046E8C5    movzx       edx,word ptr [ebp-44]
 0046E8C9    mov         dword ptr [eax+4],edx
 0046E8CC    movzx       edx,word ptr [ebp-42]
 0046E8D0    mov         dword ptr [eax+8],edx
 0046E8D3    movzx       edx,word ptr [ebp-40]
 0046E8D7    mov         word ptr [eax+0C],dx
 0046E8DB    movzx       edx,word ptr [ebp-3E]
 0046E8DF    mov         word ptr [eax+0E],dx
 0046E8E3    sub         esi,0C
>0046E8E6    jmp         0046E9BA
 0046E8EB    mov         ecx,dword ptr [ebp-20]
 0046E8EE    sub         ecx,4
 0046E8F1    mov         edx,dword ptr [ebp-18]
 0046E8F4    add         edx,4
 0046E8F7    mov         eax,dword ptr [ebp-8]
 0046E8FA    mov         ebx,dword ptr [eax]
 0046E8FC    call        dword ptr [ebx+0C]
 0046E8FF    mov         eax,dword ptr [ebp-20]
 0046E902    sub         esi,eax
 0046E904    mov         eax,dword ptr [ebp-3C]
 0046E907    mov         eax,dword ptr [eax+10]
 0046E90A    cmp         eax,3
>0046E90D    je          0046E9BA
 0046E913    test        eax,eax
>0046E915    je          0046E9BA
 0046E91B    mov         dl,1
 0046E91D    mov         eax,[0043DAFC];TMemoryStream
 0046E922    call        TObject.Create
 0046E927    mov         dword ptr [ebp-38],eax
 0046E92A    cmp         dword ptr [ebp+8],0
>0046E92E    jne         0046E95F
 0046E930    lea         eax,[ebp-0AA]
 0046E936    xor         ecx,ecx
 0046E938    mov         edx,0E
 0046E93D    call        @FillChar
 0046E942    mov         word ptr [ebp-0AA],4D42
 0046E94B    mov         eax,dword ptr [ebp-20]
 0046E94E    add         eax,esi
 0046E950    mov         dword ptr [ebp-0A8],eax
 0046E956    lea         eax,[ebp-0AA]
 0046E95C    mov         dword ptr [ebp+8],eax
 0046E95F    mov         edx,dword ptr [ebp+8]
 0046E962    mov         ecx,0E
 0046E967    mov         eax,dword ptr [ebp-38]
 0046E96A    mov         ebx,dword ptr [eax]
 0046E96C    call        dword ptr [ebx+10]
 0046E96F    lea         edx,[ebp-20]
 0046E972    mov         ecx,4
 0046E977    mov         eax,dword ptr [ebp-38]
 0046E97A    mov         ebx,dword ptr [eax]
 0046E97C    call        dword ptr [ebx+10]
 0046E97F    mov         ecx,dword ptr [ebp-20]
 0046E982    sub         ecx,4
 0046E985    mov         edx,dword ptr [ebp-18]
 0046E988    add         edx,4
 0046E98B    mov         eax,dword ptr [ebp-38]
 0046E98E    mov         ebx,dword ptr [eax]
 0046E990    call        dword ptr [ebx+10]
 0046E993    mov         eax,esi
 0046E995    xor         edx,edx
 0046E997    push        edx
 0046E998    push        eax
 0046E999    mov         edx,dword ptr [ebp-8]
 0046E99C    mov         eax,dword ptr [ebp-38]
 0046E99F    call        TStream.CopyFrom
 0046E9A4    mov         edx,esi
 0046E9A6    neg         edx
 0046E9A8    mov         cx,2
 0046E9AC    mov         eax,dword ptr [ebp-38]
 0046E9AF    mov         ebx,dword ptr [eax]
 0046E9B1    call        dword ptr [ebx+14]
 0046E9B4    mov         eax,dword ptr [ebp-38]
 0046E9B7    mov         dword ptr [ebp-8],eax
 0046E9BA    mov         ebx,dword ptr [ebp-3C]
 0046E9BD    mov         eax,dword ptr [ebp-20]
 0046E9C0    mov         dword ptr [ebx],eax
 0046E9C2    mov         eax,dword ptr [ebp-18]
 0046E9C5    add         eax,dword ptr [ebp-20]
 0046E9C8    mov         dword ptr [ebp-1C],eax
 0046E9CB    cmp         word ptr [ebx+0C],1
>0046E9D0    je          0046E9D7
 0046E9D2    call        InvalidBitmap
 0046E9D7    cmp         dword ptr [ebp-20],28
>0046E9DB    jne         0046EA0A
 0046E9DD    movzx       eax,word ptr [ebx+0E]
 0046E9E1    cmp         ax,10
>0046E9E5    je          0046E9ED
 0046E9E7    cmp         ax,20
>0046E9EB    jne         0046EA0A
 0046E9ED    cmp         dword ptr [ebx+10],3
>0046E9F1    jne         0046EA0A
 0046E9F3    mov         edx,dword ptr [ebp-1C]
 0046E9F6    mov         ecx,0C
 0046E9FB    mov         eax,dword ptr [ebp-8]
 0046E9FE    call        TStream.ReadBuffer
 0046EA03    add         dword ptr [ebp-1C],0C
 0046EA07    sub         esi,0C
 0046EA0A    cmp         dword ptr [ebx+20],0
>0046EA0E    jne         0046EA1C
 0046EA10    movzx       eax,word ptr [ebx+0E]
 0046EA14    call        GetDInColors
 0046EA19    mov         dword ptr [ebx+20],eax
 0046EA1C    mov         ecx,dword ptr [ebx+20]
 0046EA1F    movzx       edi,byte ptr [ebp-21]
 0046EA23    movzx       eax,byte ptr [edi+78594C]
 0046EA2A    imul        ecx,eax
 0046EA2D    mov         edx,dword ptr [ebp-1C]
 0046EA30    mov         eax,dword ptr [ebp-8]
 0046EA33    call        TStream.ReadBuffer
 0046EA38    mov         eax,dword ptr [ebx+20]
 0046EA3B    movzx       edx,byte ptr [edi+78594C]
 0046EA42    imul        edx
 0046EA44    sub         esi,eax
 0046EA46    cmp         dword ptr [ebx+14],0
>0046EA4A    je          0046EA52
 0046EA4C    cmp         dword ptr [ebx+10],0
>0046EA50    jne         0046EA73
 0046EA52    movzx       edx,word ptr [ebx+0E]
 0046EA56    mov         eax,dword ptr [ebx+4]
 0046EA59    mov         ecx,20
 0046EA5E    call        BytesPerScanline
 0046EA63    mov         ecx,eax
 0046EA65    mov         eax,dword ptr [ebx+8]
 0046EA68    cdq
 0046EA69    xor         eax,edx
 0046EA6B    sub         eax,edx
 0046EA6D    imul        ecx,eax
 0046EA70    mov         dword ptr [ebx+14],ecx
 0046EA73    mov         eax,dword ptr [ebx+14]
 0046EA76    cmp         esi,eax
>0046EA78    jbe         0046EA7C
 0046EA7A    mov         esi,eax
 0046EA7C    cmp         byte ptr [ebp-21],0
>0046EA80    je          0046EA8A
 0046EA82    mov         eax,dword ptr [ebp-1C]
 0046EA85    call        RGBTripleToQuad
 0046EA8A    push        0
 0046EA8C    call        user32.GetDC
 0046EA91    call        GDICheck
 0046EA96    mov         dword ptr [ebp-0C],eax
 0046EA99    xor         edx,edx
 0046EA9B    push        ebp
 0046EA9C    push        46EC8D
 0046EAA1    push        dword ptr fs:[edx]
 0046EAA4    mov         dword ptr fs:[edx],esp
 0046EAA7    mov         eax,dword ptr [ebp-3C]
 0046EAAA    mov         eax,dword ptr [eax+10]
 0046EAAD    test        eax,eax
>0046EAAF    je          0046EAB6
 0046EAB1    cmp         eax,3
>0046EAB4    jne         0046EAC3
 0046EAB6    cmp         byte ptr ds:[785664],0
>0046EABD    je          0046EBFC
 0046EAC3    xor         eax,eax
 0046EAC5    mov         dword ptr [ebp-10],eax
 0046EAC8    mov         eax,esi
 0046EACA    call        @GetMem
 0046EACF    mov         dword ptr [ebp-14],eax
 0046EAD2    xor         edx,edx
 0046EAD4    push        ebp
 0046EAD5    push        46EBF5
 0046EADA    push        dword ptr fs:[edx]
 0046EADD    mov         dword ptr fs:[edx],esp
 0046EAE0    mov         edx,dword ptr [ebp-14]
 0046EAE3    mov         ecx,esi
 0046EAE5    mov         eax,dword ptr [ebp-8]
 0046EAE8    call        TStream.ReadBuffer
 0046EAED    mov         eax,dword ptr [ebp-0C]
 0046EAF0    push        eax
 0046EAF1    call        gdi32.CreateCompatibleDC
 0046EAF6    call        GDICheck
 0046EAFB    mov         dword ptr [ebp-10],eax
 0046EAFE    push        1
 0046EB00    push        1
 0046EB02    mov         eax,dword ptr [ebp-0C]
 0046EB05    push        eax
 0046EB06    call        gdi32.CreateCompatibleBitmap
 0046EB0B    push        eax
 0046EB0C    mov         eax,dword ptr [ebp-10]
 0046EB0F    push        eax
 0046EB10    call        gdi32.SelectObject
 0046EB15    mov         dword ptr [ebp-2C],eax
 0046EB18    xor         eax,eax
 0046EB1A    mov         dword ptr [ebp-34],eax
 0046EB1D    mov         eax,dword ptr [ebp-3C]
 0046EB20    mov         eax,dword ptr [eax+20]
 0046EB23    test        eax,eax
>0046EB25    jbe         0046EB51
 0046EB27    mov         ecx,eax
 0046EB29    mov         edx,dword ptr [ebp-1C]
 0046EB2C    xor         eax,eax
 0046EB2E    call        PaletteFromDIBColorTable
 0046EB33    mov         dword ptr [ebp-30],eax
 0046EB36    push        0
 0046EB38    mov         eax,dword ptr [ebp-30]
 0046EB3B    push        eax
 0046EB3C    mov         eax,dword ptr [ebp-10]
 0046EB3F    push        eax
 0046EB40    call        gdi32.SelectPalette
 0046EB45    mov         dword ptr [ebp-34],eax
 0046EB48    mov         eax,dword ptr [ebp-10]
 0046EB4B    push        eax
 0046EB4C    call        gdi32.RealizePalette
 0046EB51    xor         edx,edx
 0046EB53    push        ebp
 0046EB54    push        46EBC9
 0046EB59    push        dword ptr fs:[edx]
 0046EB5C    mov         dword ptr fs:[edx],esp
 0046EB5F    push        0
 0046EB61    mov         eax,dword ptr [ebp-18]
 0046EB64    push        eax
 0046EB65    mov         edx,dword ptr [ebp-14]
 0046EB68    push        edx
 0046EB69    push        4
 0046EB6B    push        eax
 0046EB6C    mov         eax,dword ptr [ebp-10]
 0046EB6F    push        eax
 0046EB70    call        gdi32.CreateDIBitmap
 0046EB75    mov         dword ptr [ebp-28],eax
 0046EB78    cmp         dword ptr [ebp-28],0
>0046EB7C    jne         0046EB93
 0046EB7E    call        kernel32.GetLastError
 0046EB83    test        eax,eax
>0046EB85    jne         0046EB8E
 0046EB87    call        InvalidBitmap
>0046EB8C    jmp         0046EB93
 0046EB8E    call        RaiseLastOSError
 0046EB93    xor         eax,eax
 0046EB95    pop         edx
 0046EB96    pop         ecx
 0046EB97    pop         ecx
 0046EB98    mov         dword ptr fs:[eax],edx
 0046EB9B    push        46EBD0
 0046EBA0    cmp         dword ptr [ebp-34],0
>0046EBA4    je          0046EBB5
 0046EBA6    push        0FF
 0046EBA8    mov         eax,dword ptr [ebp-34]
 0046EBAB    push        eax
 0046EBAC    mov         eax,dword ptr [ebp-10]
 0046EBAF    push        eax
 0046EBB0    call        gdi32.SelectPalette
 0046EBB5    mov         eax,dword ptr [ebp-2C]
 0046EBB8    push        eax
 0046EBB9    mov         eax,dword ptr [ebp-10]
 0046EBBC    push        eax
 0046EBBD    call        gdi32.SelectObject
 0046EBC2    push        eax
 0046EBC3    call        gdi32.DeleteObject
 0046EBC8    ret
>0046EBC9    jmp         @HandleFinally
>0046EBCE    jmp         0046EBA0
 0046EBD0    xor         eax,eax
 0046EBD2    pop         edx
 0046EBD3    pop         ecx
 0046EBD4    pop         ecx
 0046EBD5    mov         dword ptr fs:[eax],edx
 0046EBD8    push        46EC74
 0046EBDD    cmp         dword ptr [ebp-10],0
>0046EBE1    je          0046EBEC
 0046EBE3    mov         eax,dword ptr [ebp-10]
 0046EBE6    push        eax
 0046EBE7    call        gdi32.DeleteDC
 0046EBEC    mov         eax,dword ptr [ebp-14]
 0046EBEF    call        @FreeMem
 0046EBF4    ret
>0046EBF5    jmp         @HandleFinally
>0046EBFA    jmp         0046EBDD
 0046EBFC    push        0
 0046EBFE    push        0
 0046EC00    lea         eax,[ebp-14]
 0046EC03    push        eax
 0046EC04    push        0
 0046EC06    mov         eax,dword ptr [ebp-18]
 0046EC09    push        eax
 0046EC0A    mov         eax,dword ptr [ebp-0C]
 0046EC0D    push        eax
 0046EC0E    call        gdi32.CreateDIBSection
 0046EC13    mov         dword ptr [ebp-28],eax
 0046EC16    cmp         dword ptr [ebp-28],0
>0046EC1A    je          0046EC22
 0046EC1C    cmp         dword ptr [ebp-14],0
>0046EC20    jne         0046EC37
 0046EC22    call        kernel32.GetLastError
 0046EC27    test        eax,eax
>0046EC29    jne         0046EC32
 0046EC2B    call        InvalidBitmap
>0046EC30    jmp         0046EC37
 0046EC32    call        RaiseLastOSError
 0046EC37    xor         eax,eax
 0046EC39    push        ebp
 0046EC3A    push        46EC5C
 0046EC3F    push        dword ptr fs:[eax]
 0046EC42    mov         dword ptr fs:[eax],esp
 0046EC45    mov         edx,dword ptr [ebp-14]
 0046EC48    mov         ecx,esi
 0046EC4A    mov         eax,dword ptr [ebp-8]
 0046EC4D    call        TStream.ReadBuffer
 0046EC52    xor         eax,eax
 0046EC54    pop         edx
 0046EC55    pop         ecx
 0046EC56    pop         ecx
 0046EC57    mov         dword ptr fs:[eax],edx
>0046EC5A    jmp         0046EC74
>0046EC5C    jmp         @HandleAnyException
 0046EC61    mov         eax,dword ptr [ebp-28]
 0046EC64    push        eax
 0046EC65    call        gdi32.DeleteObject
 0046EC6A    call        @RaiseAgain
 0046EC6F    call        @DoneExcept
 0046EC74    xor         eax,eax
 0046EC76    pop         edx
 0046EC77    pop         ecx
 0046EC78    pop         ecx
 0046EC79    mov         dword ptr fs:[eax],edx
 0046EC7C    push        46EC94
 0046EC81    mov         eax,dword ptr [ebp-0C]
 0046EC84    push        eax
 0046EC85    push        0
 0046EC87    call        user32.ReleaseDC
 0046EC8C    ret
>0046EC8D    jmp         @HandleFinally
>0046EC92    jmp         0046EC81
 0046EC94    mov         eax,dword ptr [ebp-3C]
 0046EC97    cmp         word ptr [eax+0E],8
>0046EC9C    jbe         0046ECC0
 0046EC9E    mov         eax,dword ptr [ebp-3C]
 0046ECA1    cmp         dword ptr [eax+20],0
>0046ECA5    jbe         0046ECC0
 0046ECA7    cmp         dword ptr [ebp-30],0
>0046ECAB    jne         0046ECC0
 0046ECAD    mov         eax,dword ptr [ebp-3C]
 0046ECB0    mov         ecx,dword ptr [eax+20]
 0046ECB3    mov         edx,dword ptr [ebp-1C]
 0046ECB6    xor         eax,eax
 0046ECB8    call        PaletteFromDIBColorTable
 0046ECBD    mov         dword ptr [ebp-30],eax
 0046ECC0    lea         eax,[ebp-9C]
 0046ECC6    xor         ecx,ecx
 0046ECC8    mov         edx,54
 0046ECCD    call        @FillChar
 0046ECD2    lea         eax,[ebp-9C]
 0046ECD8    push        eax
 0046ECD9    push        54
 0046ECDB    mov         eax,dword ptr [ebp-28]
 0046ECDE    push        eax
 0046ECDF    call        gdi32.GetObjectW
 0046ECE4    mov         eax,dword ptr [ebp-3C]
 0046ECE7    mov         eax,dword ptr [eax+18]
 0046ECEA    mov         dword ptr [ebp-6C],eax
 0046ECED    mov         eax,dword ptr [ebp-3C]
 0046ECF0    mov         eax,dword ptr [eax+1C]
 0046ECF3    mov         dword ptr [ebp-68],eax
 0046ECF6    mov         eax,dword ptr [ebp-3C]
 0046ECF9    mov         eax,dword ptr [eax+20]
 0046ECFC    mov         dword ptr [ebp-64],eax
 0046ECFF    mov         eax,dword ptr [ebp-3C]
 0046ED02    mov         eax,dword ptr [eax+24]
 0046ED05    mov         dword ptr [ebp-60],eax
 0046ED08    xor         eax,eax
 0046ED0A    pop         edx
 0046ED0B    pop         ecx
 0046ED0C    pop         ecx
 0046ED0D    mov         dword ptr fs:[eax],edx
>0046ED10    jmp         0046ED29
>0046ED12    jmp         @HandleAnyException
 0046ED17    mov         eax,dword ptr [ebp-38]
 0046ED1A    call        TObject.Free
 0046ED1F    call        @RaiseAgain
 0046ED24    call        @DoneExcept
 0046ED29    xor         eax,eax
 0046ED2B    pop         edx
 0046ED2C    pop         ecx
 0046ED2D    pop         ecx
 0046ED2E    mov         dword ptr fs:[eax],edx
 0046ED31    push        46ED46
 0046ED36    mov         eax,dword ptr [ebp-18]
 0046ED39    call        @FreeMem
 0046ED3E    ret
>0046ED3F    jmp         @HandleFinally
>0046ED44    jmp         0046ED36
 0046ED46    lea         eax,[ebp-9C]
 0046ED4C    push        eax
 0046ED4D    movzx       eax,byte ptr [ebp-21]
 0046ED51    push        eax
 0046ED52    mov         eax,dword ptr [ebp-38]
 0046ED55    push        eax
 0046ED56    mov         ecx,dword ptr [ebp-30]
 0046ED59    mov         edx,dword ptr [ebp-28]
 0046ED5C    mov         eax,dword ptr [ebp-4]
 0046ED5F    call        TBitmap.NewImage
 0046ED64    mov         eax,dword ptr [ebp-4]
 0046ED67    mov         eax,dword ptr [eax+28]
 0046ED6A    cmp         word ptr [eax+3E],20
>0046ED6F    jne         0046ED82
 0046ED71    mov         eax,dword ptr [ebp-4]
 0046ED74    cmp         byte ptr [eax+39],1
>0046ED78    jne         0046ED82
 0046ED7A    mov         eax,dword ptr [ebp-4]
 0046ED7D    call        TBitmap.PreMultiplyAlpha
 0046ED82    mov         eax,dword ptr [ebp-4]
 0046ED85    mov         edx,dword ptr [eax]
 0046ED87    call        dword ptr [edx+28]
 0046ED8A    test        eax,eax
 0046ED8C    setne       al
 0046ED8F    mov         edx,dword ptr [ebp-4]
 0046ED92    mov         byte ptr [edx+22],al
 0046ED95    mov         edx,dword ptr [ebp-4]
 0046ED98    mov         eax,dword ptr [ebp-4]
 0046ED9B    mov         ecx,dword ptr [eax]
 0046ED9D    call        dword ptr [ecx+10]
 0046EDA0    pop         edi
 0046EDA1    pop         esi
 0046EDA2    pop         ebx
 0046EDA3    mov         esp,ebp
 0046EDA5    pop         ebp
 0046EDA6    ret         4
*}
end;

//0046EDAC
procedure TBitmap.ReadStream(Stream:TStream; Size:LongInt);
begin
{*
 0046EDAC    push        ebx
 0046EDAD    push        esi
 0046EDAE    push        edi
 0046EDAF    add         esp,0FFFFFF9C
 0046EDB2    mov         esi,ecx
 0046EDB4    mov         edi,edx
 0046EDB6    mov         ebx,eax
 0046EDB8    mov         eax,ebx
 0046EDBA    call        TBitmap.FreeContext
 0046EDBF    test        esi,esi
>0046EDC1    jne         0046EDE9
 0046EDC3    lea         eax,[esp+0E]
 0046EDC7    xor         ecx,ecx
 0046EDC9    mov         edx,54
 0046EDCE    call        @FillChar
 0046EDD3    lea         eax,[esp+0E]
 0046EDD7    push        eax
 0046EDD8    push        0
 0046EDDA    push        0
 0046EDDC    xor         ecx,ecx
 0046EDDE    xor         edx,edx
 0046EDE0    mov         eax,ebx
 0046EDE2    call        TBitmap.NewImage
>0046EDE7    jmp         0046EE13
 0046EDE9    mov         edx,esp
 0046EDEB    mov         ecx,0E
 0046EDF0    mov         eax,edi
 0046EDF2    call        TStream.ReadBuffer
 0046EDF7    cmp         word ptr [esp],4D42
>0046EDFD    je          0046EE04
 0046EDFF    call        InvalidBitmap
 0046EE04    push        esp
 0046EE05    mov         ecx,esi
 0046EE07    sub         ecx,0E
 0046EE0A    mov         edx,edi
 0046EE0C    mov         eax,ebx
 0046EE0E    call        TBitmap.ReadDIB
 0046EE13    add         esp,64
 0046EE16    pop         edi
 0046EE17    pop         esi
 0046EE18    pop         ebx
 0046EE19    ret
*}
end;

//0046EE1C
procedure TBitmap.SetHandle(Value:HBITMAP);
begin
{*
 0046EE1C    push        ebp
 0046EE1D    mov         ebp,esp
 0046EE1F    add         esp,0FFFFFFA8
 0046EE22    push        ebx
 0046EE23    push        esi
 0046EE24    push        edi
 0046EE25    mov         edi,edx
 0046EE27    mov         ebx,eax
 0046EE29    mov         esi,dword ptr [ebx+28]
 0046EE2C    cmp         edi,dword ptr [esi+8]
>0046EE2F    je          0046EED7
 0046EE35    mov         eax,ebx
 0046EE37    call        TBitmap.FreeContext
 0046EE3C    lea         eax,[ebp-58]
 0046EE3F    xor         ecx,ecx
 0046EE41    mov         edx,54
 0046EE46    call        @FillChar
 0046EE4B    test        edi,edi
>0046EE4D    je          0046EE5B
 0046EE4F    lea         eax,[ebp-58]
 0046EE52    push        eax
 0046EE53    push        54
 0046EE55    push        edi
 0046EE56    call        gdi32.GetObjectW
 0046EE5B    cmp         dword ptr [esi+4],1
>0046EE5F    jne         0046EE6E
 0046EE61    mov         eax,dword ptr [esi+10]
 0046EE64    mov         dword ptr [ebp-4],eax
 0046EE67    xor         eax,eax
 0046EE69    mov         dword ptr [esi+10],eax
>0046EE6C    jmp         0046EE8B
 0046EE6E    mov         eax,dword ptr [esi+10]
 0046EE71    cmp         eax,dword ptr ds:[793050]
>0046EE77    jne         0046EE83
 0046EE79    mov         eax,[00793050]
 0046EE7E    mov         dword ptr [ebp-4],eax
>0046EE81    jmp         0046EE8B
 0046EE83    call        CopyPalette
 0046EE88    mov         dword ptr [ebp-4],eax
 0046EE8B    xor         eax,eax
 0046EE8D    push        ebp
 0046EE8E    push        46EEB7
 0046EE93    push        dword ptr fs:[eax]
 0046EE96    mov         dword ptr fs:[eax],esp
 0046EE99    lea         eax,[ebp-58]
 0046EE9C    push        eax
 0046EE9D    push        0
 0046EE9F    push        0
 0046EEA1    mov         ecx,dword ptr [ebp-4]
 0046EEA4    mov         edx,edi
 0046EEA6    mov         eax,ebx
 0046EEA8    call        TBitmap.NewImage
 0046EEAD    xor         eax,eax
 0046EEAF    pop         edx
 0046EEB0    pop         ecx
 0046EEB1    pop         ecx
 0046EEB2    mov         dword ptr fs:[eax],edx
>0046EEB5    jmp         0046EECE
>0046EEB7    jmp         @HandleAnyException
 0046EEBC    mov         eax,dword ptr [ebp-4]
 0046EEBF    call        InternalDeletePalette
 0046EEC4    call        @RaiseAgain
 0046EEC9    call        @DoneExcept
 0046EECE    mov         edx,ebx
 0046EED0    mov         eax,ebx
 0046EED2    mov         ecx,dword ptr [eax]
 0046EED4    call        dword ptr [ecx+10]
 0046EED7    pop         edi
 0046EED8    pop         esi
 0046EED9    pop         ebx
 0046EEDA    mov         esp,ebp
 0046EEDC    pop         ebp
 0046EEDD    ret
*}
end;

//0046EEE0
procedure TBitmap.SetHandleType(Value:TBitmapHandleType);
begin
{*
 0046EEE0    push        ebx
 0046EEE1    push        esi
 0046EEE2    push        edi
 0046EEE3    push        ebp
 0046EEE4    add         esp,0FFFFFFAC
 0046EEE7    mov         ebx,edx
 0046EEE9    mov         esi,eax
 0046EEEB    mov         eax,esi
 0046EEED    call        TBitmap.GetHandleType
 0046EEF2    cmp         bl,al
>0046EEF4    je          0046F012
 0046EEFA    mov         edi,dword ptr [esi+28]
 0046EEFD    cmp         dword ptr [edi+8],0
>0046EF01    jne         0046EF24
 0046EF03    cmp         dword ptr [edi+14],0
>0046EF07    jne         0046EF24
 0046EF09    cmp         bl,1
>0046EF0C    jne         0046EF18
 0046EF0E    xor         eax,eax
 0046EF10    mov         dword ptr [edi+30],eax
>0046EF13    jmp         0046F012
 0046EF18    mov         dword ptr [edi+30],28
>0046EF1F    jmp         0046F012
 0046EF24    test        bl,bl
>0046EF26    jne         0046EF91
 0046EF28    mov         eax,dword ptr [edi+14]
 0046EF2B    test        eax,eax
>0046EF2D    je          0046EF38
 0046EF2F    cmp         eax,dword ptr [edi+8]
>0046EF32    je          0046F012
 0046EF38    mov         eax,esi
 0046EF3A    call        TBitmap.FreeContext
 0046EF3F    mov         eax,esi
 0046EF41    call        TBitmap.PaletteNeeded
 0046EF46    mov         eax,esi
 0046EF48    call        TBitmap.DIBNeeded
 0046EF4D    cmp         dword ptr [edi+4],1
>0046EF51    jne         0046EF7E
 0046EF53    mov         eax,dword ptr [edi+14]
 0046EF56    xor         edx,edx
 0046EF58    mov         dword ptr [edi+14],edx
 0046EF5B    mov         ebp,dword ptr [edi+10]
 0046EF5E    xor         edx,edx
 0046EF60    mov         dword ptr [edi+10],edx
 0046EF63    lea         edx,[edi+18]
 0046EF66    push        edx
 0046EF67    movzx       edx,byte ptr [edi+71]
 0046EF6B    push        edx
 0046EF6C    push        0
 0046EF6E    mov         ecx,ebp
 0046EF70    mov         edx,eax
 0046EF72    mov         eax,esi
 0046EF74    call        TBitmap.NewImage
>0046EF79    jmp         0046F009
 0046EF7E    lea         eax,[edi+18]
 0046EF81    push        eax
 0046EF82    mov         ecx,dword ptr [edi+10]
 0046EF85    mov         edx,dword ptr [edi+14]
 0046EF88    mov         eax,esi
 0046EF8A    call        TBitmap.CopyImage
>0046EF8F    jmp         0046F009
 0046EF91    mov         eax,dword ptr [edi+8]
 0046EF94    test        eax,eax
>0046EF96    je          0046EF9D
 0046EF98    cmp         eax,dword ptr [edi+14]
>0046EF9B    jne         0046F012
 0046EF9D    mov         eax,esi
 0046EF9F    call        TBitmap.FreeContext
 0046EFA4    mov         eax,esi
 0046EFA6    call        TBitmap.PaletteNeeded
 0046EFAB    push        esi
 0046EFAC    push        edi
 0046EFAD    lea         esi,[edi+18]
 0046EFB0    lea         edi,[esp+8]
 0046EFB4    mov         ecx,15
 0046EFB9    rep movs    dword ptr [edi],dword ptr [esi]
 0046EFBB    pop         edi
 0046EFBC    pop         esi
 0046EFBD    xor         eax,eax
 0046EFBF    mov         dword ptr [esp+18],eax
 0046EFC3    cmp         dword ptr [edi+4],1
 0046EFC7    sete        bl
 0046EFCA    test        bl,bl
>0046EFCC    je          0046EFD3
 0046EFCE    mov         ebp,dword ptr [edi+10]
>0046EFD1    jmp         0046EFDD
 0046EFD3    mov         eax,dword ptr [edi+10]
 0046EFD6    call        CopyPalette
 0046EFDB    mov         ebp,eax
 0046EFDD    push        esp
 0046EFDE    push        0
 0046EFE0    mov         ecx,ebp
 0046EFE2    mov         edx,dword ptr [edi+10]
 0046EFE5    mov         eax,dword ptr [edi+14]
 0046EFE8    call        CopyBitmap
 0046EFED    test        bl,bl
>0046EFEF    je          0046EFF6
 0046EFF1    mov         dword ptr [edi+8],eax
>0046EFF4    jmp         0046F009
 0046EFF6    push        esp
 0046EFF7    movzx       edx,byte ptr [edi+71]
 0046EFFB    push        edx
 0046EFFC    push        0
 0046EFFE    mov         ecx,ebp
 0046F000    mov         edx,eax
 0046F002    mov         eax,esi
 0046F004    call        TBitmap.NewImage
 0046F009    mov         edx,esi
 0046F00B    mov         eax,esi
 0046F00D    mov         ecx,dword ptr [eax]
 0046F00F    call        dword ptr [ecx+10]
 0046F012    add         esp,54
 0046F015    pop         ebp
 0046F016    pop         edi
 0046F017    pop         esi
 0046F018    pop         ebx
 0046F019    ret
*}
end;

//0046F01C
procedure TBitmap.SetHeight(Value:Integer);
begin
{*
 0046F01C    push        ebx
 0046F01D    mov         ecx,dword ptr [eax+28]
 0046F020    mov         ecx,dword ptr [ecx+1C]
 0046F023    xchg        ecx,edx
 0046F025    mov         ebx,dword ptr [eax]
 0046F027    call        dword ptr [ebx+6C]
 0046F02A    pop         ebx
 0046F02B    ret
*}
end;

//0046F02C
procedure TBitmap.SetMaskHandle(Value:HBITMAP);
begin
{*
 0046F02C    mov         ecx,dword ptr [eax+28]
 0046F02F    cmp         edx,dword ptr [ecx+0C]
>0046F032    je          0046F03F
 0046F034    mov         dword ptr [ecx+0C],edx
 0046F037    mov         byte ptr [eax+32],1
 0046F03B    mov         byte ptr [eax+31],1
 0046F03F    ret
*}
end;

//0046F040
procedure TBitmap.SetMonochrome(Value:Boolean);
begin
{*
 0046F040    push        ebx
 0046F041    push        esi
 0046F042    push        edi
 0046F043    add         esp,0FFFFFFAC
 0046F046    mov         ebx,edx
 0046F048    mov         edi,eax
 0046F04A    mov         esi,dword ptr [edi+28]
 0046F04D    lea         eax,[esi+30]
 0046F050    cmp         word ptr [eax+0C],1
>0046F055    jne         0046F05E
 0046F057    cmp         word ptr [eax+0E],1
>0046F05C    je          0046F062
 0046F05E    xor         eax,eax
>0046F060    jmp         0046F064
 0046F062    mov         al,1
 0046F064    cmp         bl,al
>0046F066    je          0046F0B5
 0046F068    mov         eax,edi
 0046F06A    call        TBitmap.HandleNeeded
 0046F06F    push        esi
 0046F070    push        edi
 0046F071    add         esi,18
 0046F074    lea         edi,[esp+8]
 0046F078    mov         ecx,15
 0046F07D    rep movs    dword ptr [edi],dword ptr [esi]
 0046F07F    pop         edi
 0046F080    pop         esi
 0046F081    xor         eax,eax
 0046F083    mov         dword ptr [esp+18],eax
 0046F087    movzx       eax,bl
 0046F08A    mov         word ptr [esp+24],ax
 0046F08F    mov         word ptr [esp+26],ax
 0046F094    mov         word ptr [esp+10],ax
 0046F099    mov         word ptr [esp+12],ax
 0046F09E    push        esp
 0046F09F    mov         ecx,dword ptr [esi+10]
 0046F0A2    mov         edx,dword ptr [esi+8]
 0046F0A5    mov         eax,edi
 0046F0A7    call        TBitmap.CopyImage
 0046F0AC    mov         edx,edi
 0046F0AE    mov         eax,edi
 0046F0B0    mov         ecx,dword ptr [eax]
 0046F0B2    call        dword ptr [ecx+10]
 0046F0B5    add         esp,54
 0046F0B8    pop         edi
 0046F0B9    pop         esi
 0046F0BA    pop         ebx
 0046F0BB    ret
*}
end;

//0046F0BC
procedure TBitmap.SetPalette(Value:HPALETTE);
begin
{*
 0046F0BC    push        ebp
 0046F0BD    mov         ebp,esp
 0046F0BF    add         esp,0FFFFFFA8
 0046F0C2    push        ebx
 0046F0C3    push        esi
 0046F0C4    push        edi
 0046F0C5    mov         edi,edx
 0046F0C7    mov         ebx,eax
 0046F0C9    mov         eax,dword ptr [ebx+28]
 0046F0CC    cmp         edi,dword ptr [eax+10]
>0046F0CF    je          0046F189
 0046F0D5    mov         esi,eax
 0046F0D7    test        edi,edi
>0046F0D9    jne         0046F0F0
 0046F0DB    cmp         dword ptr [esi+4],1
>0046F0DF    jne         0046F0F0
 0046F0E1    mov         eax,dword ptr [esi+10]
 0046F0E4    call        InternalDeletePalette
 0046F0E9    xor         eax,eax
 0046F0EB    mov         dword ptr [esi+10],eax
>0046F0EE    jmp         0046F16C
 0046F0F0    mov         eax,ebx
 0046F0F2    call        TBitmap.FreeContext
 0046F0F7    mov         eax,ebx
 0046F0F9    call        TBitmap.HandleNeeded
 0046F0FE    push        esi
 0046F0FF    push        edi
 0046F100    add         esi,18
 0046F103    lea         edi,[ebp-58]
 0046F106    mov         ecx,15
 0046F10B    rep movs    dword ptr [edi],dword ptr [esi]
 0046F10D    pop         edi
 0046F10E    pop         esi
 0046F10F    lea         eax,[ebp-58]
 0046F112    push        eax
 0046F113    push        0
 0046F115    mov         edx,dword ptr [esi+10]
 0046F118    mov         eax,dword ptr [esi+8]
 0046F11B    mov         ecx,edi
 0046F11D    call        CopyBitmap
 0046F122    mov         dword ptr [ebp-4],eax
 0046F125    xor         eax,eax
 0046F127    push        ebp
 0046F128    push        46F154
 0046F12D    push        dword ptr fs:[eax]
 0046F130    mov         dword ptr fs:[eax],esp
 0046F133    lea         eax,[ebp-58]
 0046F136    push        eax
 0046F137    movzx       eax,byte ptr [esi+71]
 0046F13B    push        eax
 0046F13C    push        0
 0046F13E    mov         ecx,edi
 0046F140    mov         edx,dword ptr [ebp-4]
 0046F143    mov         eax,ebx
 0046F145    call        TBitmap.NewImage
 0046F14A    xor         eax,eax
 0046F14C    pop         edx
 0046F14D    pop         ecx
 0046F14E    pop         ecx
 0046F14F    mov         dword ptr fs:[eax],edx
>0046F152    jmp         0046F16C
>0046F154    jmp         @HandleAnyException
 0046F159    mov         eax,dword ptr [ebp-4]
 0046F15C    push        eax
 0046F15D    call        gdi32.DeleteObject
 0046F162    call        @RaiseAgain
 0046F167    call        @DoneExcept
 0046F16C    mov         eax,dword ptr [ebx+28]
 0046F16F    lea         ecx,[eax+18]
 0046F172    mov         eax,dword ptr [eax+14]
 0046F175    mov         edx,edi
 0046F177    call        UpdateDIBColorTable
 0046F17C    mov         byte ptr [ebx+22],1
 0046F180    mov         edx,ebx
 0046F182    mov         eax,ebx
 0046F184    mov         ecx,dword ptr [eax]
 0046F186    call        dword ptr [ecx+10]
 0046F189    pop         edi
 0046F18A    pop         esi
 0046F18B    pop         ebx
 0046F18C    mov         esp,ebp
 0046F18E    pop         ebp
 0046F18F    ret
*}
end;

//0046F190
procedure TBitmap.SetPixelFormat(Value:TPixelFormat);
begin
{*
 0046F190    push        ebp
 0046F191    mov         ebp,esp
 0046F193    add         esp,0FFFFFFA0
 0046F196    push        ebx
 0046F197    push        esi
 0046F198    push        edi
 0046F199    mov         ebx,edx
 0046F19B    mov         dword ptr [ebp-4],eax
 0046F19E    mov         eax,dword ptr [ebp-4]
 0046F1A1    call        TBitmap.GetPixelFormat
 0046F1A6    cmp         bl,al
>0046F1A8    je          0046F2EE
 0046F1AE    mov         eax,ebx
 0046F1B0    sub         al,1
>0046F1B2    jb          0046F1BA
 0046F1B4    sub         al,7
>0046F1B6    je          0046F1C9
>0046F1B8    jmp         0046F1D8
 0046F1BA    mov         dl,1
 0046F1BC    mov         eax,dword ptr [ebp-4]
 0046F1BF    mov         ecx,dword ptr [eax]
 0046F1C1    call        dword ptr [ecx+78]
>0046F1C4    jmp         0046F2EE
 0046F1C9    mov         eax,[0078D024];^SResString182:TResStringRec
 0046F1CE    call        InvalidGraphic
>0046F1D3    jmp         0046F2EE
 0046F1D8    lea         eax,[ebp-5D]
 0046F1DB    xor         ecx,ecx
 0046F1DD    mov         edx,54
 0046F1E2    call        @FillChar
 0046F1E7    mov         eax,dword ptr [ebp-4]
 0046F1EA    mov         eax,dword ptr [eax+28]
 0046F1ED    lea         esi,[eax+18]
 0046F1F0    lea         edi,[ebp-5D]
 0046F1F3    mov         ecx,6
 0046F1F8    rep movs    dword ptr [edi],dword ptr [esi]
 0046F1FA    mov         byte ptr [ebp-9],0
 0046F1FE    xor         edx,edx
 0046F200    mov         dword ptr [ebp-49],edx
 0046F203    mov         dword ptr [ebp-45],28
 0046F20A    mov         edx,dword ptr [ebp-59]
 0046F20D    mov         dword ptr [ebp-41],edx
 0046F210    mov         edx,dword ptr [ebp-55]
 0046F213    mov         dword ptr [ebp-3D],edx
 0046F216    mov         word ptr [ebp-39],1
 0046F21C    movzx       edx,bl
 0046F21F    movzx       edx,byte ptr [edx+78594D]
 0046F226    mov         word ptr [ebp-37],dx
 0046F22A    mov         eax,dword ptr [eax+10]
 0046F22D    mov         dword ptr [ebp-8],eax
 0046F230    sub         bl,2
>0046F233    je          0046F240
 0046F235    dec         bl
>0046F237    je          0046F24A
 0046F239    sub         bl,2
>0046F23C    je          0046F26F
>0046F23E    jmp         0046F28B
 0046F240    mov         eax,[00793050]
 0046F245    mov         dword ptr [ebp-8],eax
>0046F248    jmp         0046F28B
 0046F24A    push        0
 0046F24C    call        user32.GetDC
 0046F251    call        GDICheck
 0046F256    mov         ebx,eax
 0046F258    push        ebx
 0046F259    call        gdi32.CreateHalftonePalette
 0046F25E    mov         dword ptr [ebp-8],eax
 0046F261    mov         byte ptr [ebp-9],1
 0046F265    push        ebx
 0046F266    push        0
 0046F268    call        user32.ReleaseDC
>0046F26D    jmp         0046F28B
 0046F26F    mov         dword ptr [ebp-35],3
 0046F276    mov         dword ptr [ebp-1D],0F800
 0046F27D    mov         dword ptr [ebp-19],7E0
 0046F284    mov         dword ptr [ebp-15],1F
 0046F28B    xor         eax,eax
 0046F28D    push        ebp
 0046F28E    push        46F2DC
 0046F293    push        dword ptr fs:[eax]
 0046F296    mov         dword ptr fs:[eax],esp
 0046F299    lea         eax,[ebp-5D]
 0046F29C    push        eax
 0046F29D    mov         eax,dword ptr [ebp-4]
 0046F2A0    mov         edx,dword ptr [eax]
 0046F2A2    call        dword ptr [edx+70]
 0046F2A5    mov         edx,eax
 0046F2A7    mov         ecx,dword ptr [ebp-8]
 0046F2AA    mov         eax,dword ptr [ebp-4]
 0046F2AD    call        TBitmap.CopyImage
 0046F2B2    cmp         dword ptr [ebp-8],0
 0046F2B6    setne       al
 0046F2B9    mov         edx,dword ptr [ebp-4]
 0046F2BC    mov         byte ptr [edx+22],al
 0046F2BF    xor         eax,eax
 0046F2C1    pop         edx
 0046F2C2    pop         ecx
 0046F2C3    pop         ecx
 0046F2C4    mov         dword ptr fs:[eax],edx
 0046F2C7    push        46F2E3
 0046F2CC    cmp         byte ptr [ebp-9],0
>0046F2D0    je          0046F2DB
 0046F2D2    mov         eax,dword ptr [ebp-8]
 0046F2D5    push        eax
 0046F2D6    call        gdi32.DeleteObject
 0046F2DB    ret
>0046F2DC    jmp         @HandleFinally
>0046F2E1    jmp         0046F2CC
 0046F2E3    mov         edx,dword ptr [ebp-4]
 0046F2E6    mov         eax,dword ptr [ebp-4]
 0046F2E9    mov         ecx,dword ptr [eax]
 0046F2EB    call        dword ptr [ecx+10]
 0046F2EE    pop         edi
 0046F2EF    pop         esi
 0046F2F0    pop         ebx
 0046F2F1    mov         esp,ebp
 0046F2F3    pop         ebp
 0046F2F4    ret
*}
end;

//0046F2F8
procedure TBitmap.SetTransparentColor(Value:TColor);
begin
{*
 0046F2F8    push        ebx
 0046F2F9    push        esi
 0046F2FA    mov         esi,eax
 0046F2FC    cmp         edx,dword ptr [esi+34]
>0046F2FF    je          0046F342
 0046F301    cmp         edx,20000000
>0046F307    jne         0046F30F
 0046F309    mov         byte ptr [esi+38],0
>0046F30D    jmp         0046F313
 0046F30F    mov         byte ptr [esi+38],1
 0046F313    mov         dword ptr [esi+34],edx
 0046F316    mov         eax,dword ptr [esi+28]
 0046F319    cmp         dword ptr [eax+4],1
>0046F31D    jle         0046F339
 0046F31F    mov         ebx,eax
 0046F321    mov         eax,esi
 0046F323    call        TBitmap.HandleNeeded
 0046F328    lea         eax,[ebx+18]
 0046F32B    push        eax
 0046F32C    mov         ecx,dword ptr [ebx+10]
 0046F32F    mov         edx,dword ptr [ebx+8]
 0046F332    mov         eax,esi
 0046F334    call        TBitmap.CopyImage
 0046F339    mov         edx,esi
 0046F33B    mov         eax,esi
 0046F33D    mov         ecx,dword ptr [eax]
 0046F33F    call        dword ptr [ecx+10]
 0046F342    pop         esi
 0046F343    pop         ebx
 0046F344    ret
*}
end;

//0046F348
procedure TBitmap.SetTransparentMode(Value:TTransparentMode);
begin
{*
 0046F348    push        ebx
 0046F349    mov         ebx,eax
 0046F34B    cmp         dl,byte ptr [ebx+38]
>0046F34E    je          0046F372
 0046F350    test        dl,dl
>0046F352    jne         0046F362
 0046F354    mov         edx,20000000
 0046F359    mov         eax,ebx
 0046F35B    call        TBitmap.SetTransparentColor
>0046F360    jmp         0046F372
 0046F362    mov         eax,ebx
 0046F364    call        TBitmap.GetTransparentColor
 0046F369    mov         edx,eax
 0046F36B    mov         eax,ebx
 0046F36D    call        TBitmap.SetTransparentColor
 0046F372    pop         ebx
 0046F373    ret
*}
end;

//0046F374
procedure TBitmap.SetWidth(Value:Integer);
begin
{*
 0046F374    push        ebx
 0046F375    mov         ecx,dword ptr [eax+28]
 0046F378    mov         ecx,dword ptr [ecx+20]
 0046F37B    mov         ebx,dword ptr [eax]
 0046F37D    call        dword ptr [ebx+6C]
 0046F380    pop         ebx
 0046F381    ret
*}
end;

//0046F384
procedure TBitmap.WriteData(Stream:TStream);
begin
{*
 0046F384    mov         cl,1
 0046F386    call        TBitmap.WriteStream
 0046F38B    ret
*}
end;

//0046F38C
procedure TBitmap.WriteStream(Stream:TStream; WriteSize:Boolean);
begin
{*
 0046F38C    push        ebx
 0046F38D    push        esi
 0046F38E    push        edi
 0046F38F    push        ebp
 0046F390    add         esp,0FFFFFBD4
 0046F396    mov         ebx,ecx
 0046F398    mov         edi,edx
 0046F39A    mov         esi,eax
 0046F39C    lea         eax,[esp+10]
 0046F3A0    xor         ecx,ecx
 0046F3A2    mov         edx,0E
 0046F3A7    call        @FillChar
 0046F3AC    mov         word ptr [esp+10],4D42
 0046F3B3    mov         eax,dword ptr [esi+28]
 0046F3B6    mov         ebp,dword ptr [eax+6C]
 0046F3B9    test        ebp,ebp
>0046F3BB    je          0046F3F5
 0046F3BD    mov         eax,ebp
 0046F3BF    mov         edx,dword ptr [eax]
 0046F3C1    call        dword ptr [edx]
 0046F3C3    mov         dword ptr [esp],eax
 0046F3C6    test        bl,bl
>0046F3C8    je          0046F3D8
 0046F3CA    mov         edx,esp
 0046F3CC    mov         ecx,4
 0046F3D1    mov         eax,edi
 0046F3D3    call        TStream.WriteBuffer
 0046F3D8    mov         eax,dword ptr [esi+28]
 0046F3DB    mov         ebx,dword ptr [eax+6C]
 0046F3DE    mov         eax,ebx
 0046F3E0    mov         edx,dword ptr [eax]
 0046F3E2    call        dword ptr [edx]
 0046F3E4    mov         ecx,eax
 0046F3E6    mov         edx,dword ptr [ebx+4]
 0046F3E9    mov         eax,edi
 0046F3EB    mov         ebx,dword ptr [eax]
 0046F3ED    call        dword ptr [ebx+10]
>0046F3F0    jmp         0046F659
 0046F3F5    mov         eax,esi
 0046F3F7    call        TBitmap.DIBNeeded
 0046F3FC    mov         eax,dword ptr [esi+28]
 0046F3FF    cmp         word ptr [eax+3E],20
>0046F404    jne         0046F413
 0046F406    cmp         byte ptr [esi+39],1
>0046F40A    jne         0046F413
 0046F40C    mov         eax,esi
 0046F40E    call        TBitmap.UnPreMultiplyAlpha
 0046F413    mov         ebp,dword ptr [esi+28]
 0046F416    xor         eax,eax
 0046F418    mov         dword ptr [esp],eax
 0046F41B    mov         eax,dword ptr [ebp+14]
 0046F41E    test        eax,eax
>0046F420    je          0046F54F
 0046F426    mov         edx,dword ptr [ebp+50]
 0046F429    push        edx
 0046F42A    lea         ecx,[esp+4]
 0046F42E    lea         edx,[esp+0C]
 0046F432    call        InternalGetDIBSizes
 0046F437    cmp         byte ptr [ebp+71],0
>0046F43B    je          0046F45F
 0046F43D    mov         dword ptr [esp+8],0C
 0046F445    movzx       eax,word ptr [ebp+3E]
 0046F449    cmp         ax,8
>0046F44D    ja          0046F45F
 0046F44F    mov         ecx,eax
 0046F451    mov         eax,1
 0046F456    shl         eax,cl
 0046F458    lea         eax,[eax+eax*2]
 0046F45B    add         dword ptr [esp+8],eax
 0046F45F    mov         eax,dword ptr [esp+8]
 0046F463    add         eax,0E
 0046F466    add         dword ptr [esp],eax
 0046F469    lea         eax,[esp+10]
 0046F46D    xor         ecx,ecx
 0046F46F    mov         edx,0E
 0046F474    call        @FillChar
 0046F479    mov         word ptr [esp+10],4D42
 0046F480    cmp         word ptr [ebp+3E],8
>0046F485    ja          0046F4E2
 0046F487    mov         eax,esi
 0046F489    call        TBitmap.GetCanvas
 0046F48E    movzx       edx,byte ptr ds:[46F664]
 0046F495    mov         ecx,dword ptr [eax]
 0046F497    call        dword ptr [ecx+2C]
 0046F49A    mov         eax,dword ptr [ebp+14]
 0046F49D    push        eax
 0046F49E    mov         eax,dword ptr [esi+2C]
 0046F4A1    mov         eax,dword ptr [eax+38]
 0046F4A4    push        eax
 0046F4A5    call        gdi32.SelectObject
 0046F4AA    call        GDICheck
 0046F4AF    mov         dword ptr [esp+0C],eax
 0046F4B3    lea         eax,[esp+2A]
 0046F4B7    push        eax
 0046F4B8    push        100
 0046F4BD    push        0
 0046F4BF    mov         eax,dword ptr [esi+2C]
 0046F4C2    mov         eax,dword ptr [eax+38]
 0046F4C5    push        eax
 0046F4C6    call        gdi32.GetDIBColorTable
 0046F4CB    mov         dword ptr [esp+4],eax
 0046F4CF    mov         eax,dword ptr [esp+0C]
 0046F4D3    push        eax
 0046F4D4    mov         eax,dword ptr [esi+2C]
 0046F4D7    mov         eax,dword ptr [eax+38]
 0046F4DA    push        eax
 0046F4DB    call        gdi32.SelectObject
>0046F4E0    jmp         0046F4E8
 0046F4E2    xor         eax,eax
 0046F4E4    mov         dword ptr [esp+4],eax
 0046F4E8    mov         eax,dword ptr [ebp+50]
 0046F4EB    test        eax,eax
>0046F4ED    jbe         0046F4F9
 0046F4EF    cmp         eax,dword ptr [esp+4]
>0046F4F3    jae         0046F4F9
 0046F4F5    mov         dword ptr [esp+4],eax
 0046F4F9    cmp         byte ptr [ebp+71],0
>0046F4FD    jne         0046F53D
 0046F4FF    cmp         dword ptr [esp+4],0
>0046F504    jne         0046F53D
 0046F506    cmp         dword ptr [ebp+10],0
>0046F50A    je          0046F53D
 0046F50C    cmp         byte ptr [ebp+70],0
>0046F510    jne         0046F53D
 0046F512    lea         edx,[esp+2A]
 0046F516    mov         ecx,0FF
 0046F51B    mov         eax,dword ptr [ebp+10]
 0046F51E    call        PaletteToDIBColorTable
 0046F523    mov         dword ptr [esp+4],eax
 0046F527    cmp         word ptr [ebp+3E],8
>0046F52C    jbe         0046F53D
 0046F52E    mov         eax,dword ptr [esp+4]
 0046F532    add         eax,eax
 0046F534    add         eax,eax
 0046F536    add         dword ptr [esp],eax
 0046F539    add         dword ptr [esp+8],eax
 0046F53D    mov         eax,dword ptr [esp]
 0046F540    mov         dword ptr [esp+12],eax
 0046F544    mov         eax,dword ptr [esp+8]
 0046F548    add         eax,0E
 0046F54B    mov         dword ptr [esp+1A],eax
 0046F54F    test        bl,bl
>0046F551    je          0046F561
 0046F553    mov         edx,esp
 0046F555    mov         ecx,4
 0046F55A    mov         eax,edi
 0046F55C    call        TStream.WriteBuffer
 0046F561    cmp         dword ptr [esp],0
>0046F565    je          0046F659
 0046F56B    lea         eax,[ebp+18]
 0046F56E    call        FixupBitFields
 0046F573    cmp         dword ptr [esp+4],0
>0046F578    je          0046F5A1
 0046F57A    mov         eax,dword ptr [ebp+50]
 0046F57D    test        eax,eax
>0046F57F    je          0046F587
 0046F581    cmp         eax,dword ptr [esp+4]
>0046F585    je          0046F58E
 0046F587    mov         eax,dword ptr [esp+4]
 0046F58B    mov         dword ptr [ebp+50],eax
 0046F58E    cmp         byte ptr [ebp+71],0
>0046F592    je          0046F5A1
 0046F594    lea         edx,[esp+4]
 0046F598    lea         eax,[esp+2A]
 0046F59C    call        RGBQuadToTriple
 0046F5A1    cmp         byte ptr [ebp+71],0
>0046F5A5    je          0046F5F6
 0046F5A7    lea         eax,[ebp+30]
 0046F5AA    mov         dword ptr [esp+1E],0C
 0046F5B2    movzx       edx,word ptr [eax+4]
 0046F5B6    mov         word ptr [esp+22],dx
 0046F5BB    movzx       edx,word ptr [eax+8]
 0046F5BF    mov         word ptr [esp+24],dx
 0046F5C4    mov         word ptr [esp+26],1
 0046F5CB    movzx       eax,word ptr [eax+0E]
 0046F5CF    mov         word ptr [esp+28],ax
 0046F5D4    lea         edx,[esp+10]
 0046F5D8    mov         ecx,0E
 0046F5DD    mov         eax,edi
 0046F5DF    call        TStream.WriteBuffer
 0046F5E4    lea         edx,[esp+1E]
 0046F5E8    mov         ecx,0C
 0046F5ED    mov         eax,edi
 0046F5EF    call        TStream.WriteBuffer
>0046F5F4    jmp         0046F631
 0046F5F6    lea         edx,[esp+10]
 0046F5FA    mov         ecx,0E
 0046F5FF    mov         eax,edi
 0046F601    call        TStream.WriteBuffer
 0046F606    lea         edx,[ebp+30]
 0046F609    mov         ecx,28
 0046F60E    mov         eax,edi
 0046F610    call        TStream.WriteBuffer
 0046F615    cmp         word ptr [ebp+3E],8
>0046F61A    jbe         0046F631
 0046F61C    test        byte ptr [ebp+40],3
>0046F620    je          0046F631
 0046F622    lea         edx,[ebp+58]
 0046F625    mov         ecx,0C
 0046F62A    mov         eax,edi
 0046F62C    call        TStream.WriteBuffer
 0046F631    movzx       eax,byte ptr [ebp+71]
 0046F635    movzx       ecx,byte ptr [eax+785955]
 0046F63C    imul        ecx,dword ptr [esp+4]
 0046F641    lea         edx,[esp+2A]
 0046F645    mov         eax,edi
 0046F647    call        TStream.WriteBuffer
 0046F64C    mov         edx,dword ptr [ebp+2C]
 0046F64F    mov         ecx,dword ptr [ebp+44]
 0046F652    mov         eax,edi
 0046F654    call        TStream.WriteBuffer
 0046F659    add         esp,42C
 0046F65F    pop         ebp
 0046F660    pop         edi
 0046F661    pop         esi
 0046F662    pop         ebx
 0046F663    ret
*}
end;

//0046F668
function TBitmap.ReleaseHandle:HBITMAP;
begin
{*
 0046F668    push        ebx
 0046F669    mov         ebx,eax
 0046F66B    mov         eax,ebx
 0046F66D    call        TBitmap.HandleNeeded
 0046F672    mov         edx,ebx
 0046F674    mov         eax,ebx
 0046F676    call        TBitmap.Changing
 0046F67B    mov         eax,dword ptr [ebx+28]
 0046F67E    mov         edx,dword ptr [eax+8]
 0046F681    mov         ecx,edx
 0046F683    cmp         edx,dword ptr [eax+14]
>0046F686    jne         0046F692
 0046F688    xor         edx,edx
 0046F68A    mov         dword ptr [eax+14],edx
 0046F68D    xor         edx,edx
 0046F68F    mov         dword ptr [eax+2C],edx
 0046F692    xor         edx,edx
 0046F694    mov         dword ptr [eax+8],edx
 0046F697    mov         eax,ecx
 0046F699    pop         ebx
 0046F69A    ret
*}
end;

//0046F69C
function TBitmap.ReleaseMaskHandle:HBITMAP;
begin
{*
 0046F69C    push        ebx
 0046F69D    mov         ebx,eax
 0046F69F    mov         eax,ebx
 0046F6A1    mov         edx,dword ptr [eax]
 0046F6A3    call        dword ptr [edx+74]
 0046F6A6    mov         edx,dword ptr [ebx+28]
 0046F6A9    xor         ecx,ecx
 0046F6AB    mov         dword ptr [edx+0C],ecx
 0046F6AE    pop         ebx
 0046F6AF    ret
*}
end;

//0046F6B0
function TBitmap.ReleasePalette:HPALETTE;
begin
{*
 0046F6B0    push        ebx
 0046F6B1    mov         ebx,eax
 0046F6B3    mov         eax,ebx
 0046F6B5    call        TBitmap.HandleNeeded
 0046F6BA    mov         edx,ebx
 0046F6BC    mov         eax,ebx
 0046F6BE    call        TBitmap.Changing
 0046F6C3    mov         eax,dword ptr [ebx+28]
 0046F6C6    mov         edx,dword ptr [eax+10]
 0046F6C9    xor         ecx,ecx
 0046F6CB    mov         dword ptr [eax+10],ecx
 0046F6CE    mov         eax,edx
 0046F6D0    pop         ebx
 0046F6D1    ret
*}
end;

//0046F6D4
procedure TBitmap.SaveToStream(Stream:TStream);
begin
{*
 0046F6D4    xor         ecx,ecx
 0046F6D6    call        TBitmap.WriteStream
 0046F6DB    ret
*}
end;

//0046F6DC
procedure TBitmap.SaveToClipboardFormat(var Format:Word; var Data:Cardinal; var APalette:HPALETTE);
begin
{*
 0046F6DC    push        ebp
 0046F6DD    mov         ebp,esp
 0046F6DF    add         esp,0FFFFFFA8
 0046F6E2    push        ebx
 0046F6E3    push        esi
 0046F6E4    push        edi
 0046F6E5    mov         dword ptr [ebp-4],ecx
 0046F6E8    mov         ebx,eax
 0046F6EA    mov         word ptr [edx],2
 0046F6EF    mov         eax,ebx
 0046F6F1    call        TBitmap.HandleNeeded
 0046F6F6    mov         esi,dword ptr [ebx+28]
 0046F6F9    push        esi
 0046F6FA    add         esi,18
 0046F6FD    lea         edi,[ebp-58]
 0046F700    mov         ecx,15
 0046F705    rep movs    dword ptr [edi],dword ptr [esi]
 0046F707    pop         esi
 0046F708    xor         eax,eax
 0046F70A    mov         dword ptr [ebp-40],eax
 0046F70D    xor         eax,eax
 0046F70F    mov         dword ptr [ebp-44],eax
 0046F712    lea         eax,[ebp-58]
 0046F715    push        eax
 0046F716    mov         eax,dword ptr [ebx+2C]
 0046F719    push        eax
 0046F71A    mov         edi,dword ptr [esi+10]
 0046F71D    mov         ecx,edi
 0046F71F    mov         edx,edi
 0046F721    mov         eax,dword ptr [esi+8]
 0046F724    call        CopyBitmap
 0046F729    mov         edx,dword ptr [ebp-4]
 0046F72C    mov         dword ptr [edx],eax
 0046F72E    xor         eax,eax
 0046F730    push        ebp
 0046F731    push        46F756
 0046F736    push        dword ptr fs:[eax]
 0046F739    mov         dword ptr fs:[eax],esp
 0046F73C    mov         eax,dword ptr [ebx+28]
 0046F73F    mov         eax,dword ptr [eax+10]
 0046F742    call        CopyPalette
 0046F747    mov         edx,dword ptr [ebp+8]
 0046F74A    mov         dword ptr [edx],eax
 0046F74C    xor         eax,eax
 0046F74E    pop         edx
 0046F74F    pop         ecx
 0046F750    pop         ecx
 0046F751    mov         dword ptr fs:[eax],edx
>0046F754    jmp         0046F770
>0046F756    jmp         @HandleAnyException
 0046F75B    mov         eax,dword ptr [ebp-4]
 0046F75E    mov         eax,dword ptr [eax]
 0046F760    push        eax
 0046F761    call        gdi32.DeleteObject
 0046F766    call        @RaiseAgain
 0046F76B    call        @DoneExcept
 0046F770    pop         edi
 0046F771    pop         esi
 0046F772    pop         ebx
 0046F773    mov         esp,ebp
 0046F775    pop         ebp
 0046F776    ret         4
*}
end;

//0046F77C
procedure TBitmap.SetSize(AWidth:Integer; AHeight:Integer);
begin
{*
 0046F77C    push        ebx
 0046F77D    push        esi
 0046F77E    push        edi
 0046F77F    add         esp,0FFFFFFAC
 0046F782    mov         edi,ecx
 0046F784    mov         esi,edx
 0046F786    mov         ebx,eax
 0046F788    mov         eax,ebx
 0046F78A    call        TBitmap.HandleNeeded
 0046F78F    mov         eax,dword ptr [ebx+28]
 0046F792    cmp         esi,dword ptr [eax+1C]
>0046F795    jne         0046F79C
 0046F797    cmp         edi,dword ptr [eax+20]
>0046F79A    je          0046F7D5
 0046F79C    push        esi
 0046F79D    push        edi
 0046F79E    lea         esi,[eax+18]
 0046F7A1    lea         edi,[esp+8]
 0046F7A5    mov         ecx,15
 0046F7AA    rep movs    dword ptr [edi],dword ptr [esi]
 0046F7AC    pop         edi
 0046F7AD    pop         esi
 0046F7AE    mov         dword ptr [esp+4],esi
 0046F7B2    mov         dword ptr [esp+8],edi
 0046F7B6    mov         dword ptr [esp+1C],esi
 0046F7BA    mov         dword ptr [esp+20],edi
 0046F7BE    push        esp
 0046F7BF    mov         ecx,dword ptr [eax+10]
 0046F7C2    mov         edx,dword ptr [eax+8]
 0046F7C5    mov         eax,ebx
 0046F7C7    call        TBitmap.CopyImage
 0046F7CC    mov         edx,ebx
 0046F7CE    mov         eax,ebx
 0046F7D0    mov         ecx,dword ptr [eax]
 0046F7D2    call        dword ptr [ecx+10]
 0046F7D5    add         esp,54
 0046F7D8    pop         edi
 0046F7D9    pop         esi
 0046F7DA    pop         ebx
 0046F7DB    ret
*}
end;

//0046F7DC
function TBitmap.TransparentColorStored:Boolean;
begin
{*
 0046F7DC    cmp         byte ptr [eax+38],1
 0046F7E0    sete        al
 0046F7E3    ret
*}
end;

//0046F7E4
destructor TIconImage.Destroy();
begin
{*
 0046F7E4    push        ebx
 0046F7E5    push        esi
 0046F7E6    call        @BeforeDestruction
 0046F7EB    mov         ebx,edx
 0046F7ED    mov         esi,eax
 0046F7EF    mov         eax,dword ptr [esi+8]
 0046F7F2    call        TObject.Free
 0046F7F7    mov         edx,ebx
 0046F7F9    and         dl,0FC
 0046F7FC    mov         eax,esi
 0046F7FE    call        TSharedImage.Destroy
 0046F803    test        bl,bl
>0046F805    jle         0046F80E
 0046F807    mov         eax,esi
 0046F809    call        @ClassDestroy
 0046F80E    pop         esi
 0046F80F    pop         ebx
 0046F810    ret
*}
end;

//0046F814
procedure TIconImage.FreeHandle;
begin
{*
 0046F814    push        ebx
 0046F815    mov         ebx,eax
 0046F817    mov         eax,dword ptr [ebx+14]
 0046F81A    test        eax,eax
>0046F81C    je          0046F824
 0046F81E    push        eax
 0046F81F    call        user32.DestroyIcon
 0046F824    xor         eax,eax
 0046F826    mov         dword ptr [ebx+14],eax
 0046F829    pop         ebx
 0046F82A    ret
*}
end;

//0046F82C
function HasAlpha(Buf:PRGBQuad; CX:Integer; CY:Integer):Boolean;
begin
{*
 0046F82C    push        ebp
 0046F82D    mov         ebp,esp
 0046F82F    push        ecx
 0046F830    push        ebx
 0046F831    mov         dword ptr [ebp-4],ecx
 0046F834    xor         ecx,ecx
 0046F836    mov         ebx,dword ptr [ebp-4]
 0046F839    dec         ebx
 0046F83A    test        ebx,ebx
>0046F83C    jl          0046F85B
 0046F83E    inc         ebx
 0046F83F    mov         edx,dword ptr [ebp-4]
 0046F842    dec         edx
 0046F843    test        edx,edx
>0046F845    jl          0046F858
 0046F847    inc         edx
 0046F848    test        byte ptr [eax+3],0FF
>0046F84C    je          0046F852
 0046F84E    mov         cl,1
>0046F850    jmp         0046F85B
 0046F852    add         eax,4
 0046F855    dec         edx
>0046F856    jne         0046F848
 0046F858    dec         ebx
>0046F859    jne         0046F83F
 0046F85B    mov         eax,ecx
 0046F85D    pop         ebx
 0046F85E    pop         ecx
 0046F85F    pop         ebp
 0046F860    ret
*}
end;

//0046F864
procedure TIcon.AssignTo(Dest:TPersistent);
begin
{*
 0046F864    push        ebp
 0046F865    mov         ebp,esp
 0046F867    add         esp,0FFFFFFA0
 0046F86A    push        ebx
 0046F86B    push        esi
 0046F86C    mov         esi,edx
 0046F86E    mov         ebx,eax
 0046F870    mov         eax,esi
 0046F872    mov         edx,dword ptr ds:[463B28];TBitmap
 0046F878    call        @IsClass
 0046F87D    test        al,al
>0046F87F    je          0046FB1C
 0046F885    mov         dword ptr [ebp-0C],esi
 0046F888    mov         eax,ebx
 0046F88A    mov         edx,dword ptr [eax]
 0046F88C    call        dword ptr [edx+24]
 0046F88F    push        eax
 0046F890    mov         eax,ebx
 0046F892    mov         edx,dword ptr [eax]
 0046F894    call        dword ptr [edx+30]
 0046F897    mov         edx,eax
 0046F899    mov         eax,dword ptr [ebp-0C]
 0046F89C    pop         ecx
 0046F89D    mov         esi,dword ptr [eax]
 0046F89F    call        dword ptr [esi+6C]
 0046F8A2    mov         dl,7
 0046F8A4    mov         eax,dword ptr [ebp-0C]
 0046F8A7    call        TBitmap.SetPixelFormat
 0046F8AC    mov         dl,1
 0046F8AE    mov         eax,dword ptr [ebp-0C]
 0046F8B1    call        TBitmap.SetAlphaFormat
 0046F8B6    mov         eax,dword ptr [ebp-0C]
 0046F8B9    call        TBitmap.GetCanvas
 0046F8BE    mov         eax,dword ptr [eax+48]
 0046F8C1    xor         edx,edx
 0046F8C3    call        TBrush.SetColor
 0046F8C8    mov         eax,ebx
 0046F8CA    mov         edx,dword ptr [eax]
 0046F8CC    call        dword ptr [edx+24]
 0046F8CF    push        eax
 0046F8D0    lea         eax,[ebp-60]
 0046F8D3    push        eax
 0046F8D4    mov         eax,ebx
 0046F8D6    mov         edx,dword ptr [eax]
 0046F8D8    call        dword ptr [edx+30]
 0046F8DB    mov         ecx,eax
 0046F8DD    xor         edx,edx
 0046F8DF    xor         eax,eax
 0046F8E1    call        Rect
 0046F8E6    lea         eax,[ebp-60]
 0046F8E9    push        eax
 0046F8EA    mov         eax,dword ptr [ebp-0C]
 0046F8ED    call        TBitmap.GetCanvas
 0046F8F2    pop         edx
 0046F8F3    mov         ecx,dword ptr [eax]
 0046F8F5    call        dword ptr [ecx+54]
 0046F8F8    push        3
 0046F8FA    push        0
 0046F8FC    push        0
 0046F8FE    mov         eax,ebx
 0046F900    mov         edx,dword ptr [eax]
 0046F902    call        dword ptr [edx+24]
 0046F905    push        eax
 0046F906    mov         eax,ebx
 0046F908    mov         edx,dword ptr [eax]
 0046F90A    call        dword ptr [edx+30]
 0046F90D    push        eax
 0046F90E    mov         eax,ebx
 0046F910    call        TIcon.GetHandle
 0046F915    push        eax
 0046F916    push        0
 0046F918    push        0
 0046F91A    mov         eax,dword ptr [ebp-0C]
 0046F91D    call        TBitmap.GetCanvas
 0046F922    call        TCanvas.GetHandle
 0046F927    push        eax
 0046F928    call        user32.DrawIconEx
 0046F92D    mov         dword ptr [ebp-50],2C
 0046F934    mov         word ptr [ebp-44],1
 0046F93A    mov         eax,ebx
 0046F93C    mov         edx,dword ptr [eax]
 0046F93E    call        dword ptr [edx+30]
 0046F941    mov         dword ptr [ebp-48],eax
 0046F944    mov         eax,ebx
 0046F946    mov         edx,dword ptr [eax]
 0046F948    call        dword ptr [edx+24]
 0046F94B    mov         dword ptr [ebp-4C],eax
 0046F94E    xor         eax,eax
 0046F950    mov         dword ptr [ebp-40],eax
 0046F953    mov         word ptr [ebp-42],20
 0046F959    mov         eax,dword ptr [ebp-4C]
 0046F95C    add         eax,eax
 0046F95E    add         eax,eax
 0046F960    imul        dword ptr [ebp-48]
 0046F963    call        AllocMem
 0046F968    mov         dword ptr [ebp-4],eax
 0046F96B    xor         esi,esi
 0046F96D    push        ebp
 0046F96E    push        46FB15
 0046F973    push        dword ptr fs:[esi]
 0046F976    mov         dword ptr fs:[esi],esp
 0046F979    push        0
 0046F97B    lea         eax,[ebp-50]
 0046F97E    push        eax
 0046F97F    mov         eax,dword ptr [ebp-4]
 0046F982    push        eax
 0046F983    mov         eax,ebx
 0046F985    mov         edx,dword ptr [eax]
 0046F987    call        dword ptr [edx+24]
 0046F98A    push        eax
 0046F98B    push        0
 0046F98D    mov         eax,dword ptr [ebp-0C]
 0046F990    mov         edx,dword ptr [eax]
 0046F992    call        dword ptr [edx+70]
 0046F995    push        eax
 0046F996    mov         eax,dword ptr [ebp-0C]
 0046F999    call        TBitmap.GetCanvas
 0046F99E    call        TCanvas.GetHandle
 0046F9A3    push        eax
 0046F9A4    call        gdi32.GetDIBits
 0046F9A9    mov         esi,eax
 0046F9AB    mov         eax,ebx
 0046F9AD    mov         edx,dword ptr [eax]
 0046F9AF    call        dword ptr [edx+24]
 0046F9B2    cmp         esi,eax
>0046F9B4    jne         0046FAFF
 0046F9BA    mov         eax,ebx
 0046F9BC    mov         edx,dword ptr [eax]
 0046F9BE    call        dword ptr [edx+24]
 0046F9C1    push        eax
 0046F9C2    mov         eax,ebx
 0046F9C4    mov         edx,dword ptr [eax]
 0046F9C6    call        dword ptr [edx+30]
 0046F9C9    mov         edx,eax
 0046F9CB    mov         eax,dword ptr [ebp-4]
 0046F9CE    pop         ecx
 0046F9CF    call        HasAlpha
 0046F9D4    test        al,al
>0046F9D6    jne         0046FAFF
 0046F9DC    mov         eax,dword ptr [ebp-4C]
 0046F9DF    add         eax,eax
 0046F9E1    add         eax,eax
 0046F9E3    imul        dword ptr [ebp-48]
 0046F9E6    call        AllocMem
 0046F9EB    mov         dword ptr [ebp-8],eax
 0046F9EE    xor         esi,esi
 0046F9F0    push        ebp
 0046F9F1    push        46FAF8
 0046F9F6    push        dword ptr fs:[esi]
 0046F9F9    mov         dword ptr fs:[esi],esp
 0046F9FC    lea         eax,[ebp-24]
 0046F9FF    push        eax
 0046FA00    mov         eax,ebx
 0046FA02    call        TIcon.GetHandle
 0046FA07    push        eax
 0046FA08    call        user32.GetIconInfo
 0046FA0D    xor         esi,esi
 0046FA0F    push        ebp
 0046FA10    push        46FADB
 0046FA15    push        dword ptr fs:[esi]
 0046FA18    mov         dword ptr fs:[esi],esp
 0046FA1B    push        0
 0046FA1D    lea         eax,[ebp-50]
 0046FA20    push        eax
 0046FA21    mov         eax,dword ptr [ebp-8]
 0046FA24    push        eax
 0046FA25    mov         eax,ebx
 0046FA27    mov         edx,dword ptr [eax]
 0046FA29    call        dword ptr [edx+24]
 0046FA2C    push        eax
 0046FA2D    push        0
 0046FA2F    mov         eax,dword ptr [ebp-18]
 0046FA32    push        eax
 0046FA33    mov         eax,dword ptr [ebp-0C]
 0046FA36    call        TBitmap.GetCanvas
 0046FA3B    call        TCanvas.GetHandle
 0046FA40    push        eax
 0046FA41    call        gdi32.GetDIBits
 0046FA46    mov         esi,eax
 0046FA48    mov         eax,ebx
 0046FA4A    mov         edx,dword ptr [eax]
 0046FA4C    call        dword ptr [edx+24]
 0046FA4F    cmp         esi,eax
>0046FA51    jne         0046FABB
 0046FA53    mov         edx,dword ptr [ebp-4]
 0046FA56    mov         ecx,dword ptr [ebp-8]
 0046FA59    mov         eax,dword ptr [ebp-48]
 0046FA5C    dec         eax
 0046FA5D    test        eax,eax
>0046FA5F    jl          0046FA8B
 0046FA61    inc         eax
 0046FA62    mov         dword ptr [ebp-10],eax
 0046FA65    mov         eax,dword ptr [ebp-4C]
 0046FA68    dec         eax
 0046FA69    test        eax,eax
>0046FA6B    jl          0046FA86
 0046FA6D    inc         eax
 0046FA6E    cmp         dword ptr [ecx],0
>0046FA71    je          0046FA79
 0046FA73    xor         esi,esi
 0046FA75    mov         dword ptr [edx],esi
>0046FA77    jmp         0046FA7D
 0046FA79    mov         byte ptr [edx+3],0FF
 0046FA7D    add         edx,4
 0046FA80    add         ecx,4
 0046FA83    dec         eax
>0046FA84    jne         0046FA6E
 0046FA86    dec         dword ptr [ebp-10]
>0046FA89    jne         0046FA65
 0046FA8B    push        0
 0046FA8D    lea         eax,[ebp-50]
 0046FA90    push        eax
 0046FA91    mov         eax,dword ptr [ebp-4]
 0046FA94    push        eax
 0046FA95    mov         eax,ebx
 0046FA97    mov         edx,dword ptr [eax]
 0046FA99    call        dword ptr [edx+24]
 0046FA9C    push        eax
 0046FA9D    push        0
 0046FA9F    mov         eax,dword ptr [ebp-0C]
 0046FAA2    mov         edx,dword ptr [eax]
 0046FAA4    call        dword ptr [edx+70]
 0046FAA7    push        eax
 0046FAA8    mov         eax,dword ptr [ebp-0C]
 0046FAAB    call        TBitmap.GetCanvas
 0046FAB0    call        TCanvas.GetHandle
 0046FAB5    push        eax
 0046FAB6    call        gdi32.SetDIBits
 0046FABB    xor         eax,eax
 0046FABD    pop         edx
 0046FABE    pop         ecx
 0046FABF    pop         ecx
 0046FAC0    mov         dword ptr fs:[eax],edx
 0046FAC3    push        46FAE2
 0046FAC8    mov         eax,dword ptr [ebp-18]
 0046FACB    push        eax
 0046FACC    call        gdi32.DeleteObject
 0046FAD1    mov         eax,dword ptr [ebp-14]
 0046FAD4    push        eax
 0046FAD5    call        gdi32.DeleteObject
 0046FADA    ret
>0046FADB    jmp         @HandleFinally
>0046FAE0    jmp         0046FAC8
 0046FAE2    xor         eax,eax
 0046FAE4    pop         edx
 0046FAE5    pop         ecx
 0046FAE6    pop         ecx
 0046FAE7    mov         dword ptr fs:[eax],edx
 0046FAEA    push        46FAFF
 0046FAEF    mov         eax,dword ptr [ebp-8]
 0046FAF2    call        @FreeMem
 0046FAF7    ret
>0046FAF8    jmp         @HandleFinally
>0046FAFD    jmp         0046FAEF
 0046FAFF    xor         eax,eax
 0046FB01    pop         edx
 0046FB02    pop         ecx
 0046FB03    pop         ecx
 0046FB04    mov         dword ptr fs:[eax],edx
 0046FB07    push        46FB25
 0046FB0C    mov         eax,dword ptr [ebp-4]
 0046FB0F    call        @FreeMem
 0046FB14    ret
>0046FB15    jmp         @HandleFinally
>0046FB1A    jmp         0046FB0C
 0046FB1C    mov         edx,esi
 0046FB1E    mov         eax,ebx
 0046FB20    call        TPersistent.AssignTo
 0046FB25    pop         esi
 0046FB26    pop         ebx
 0046FB27    mov         esp,ebp
 0046FB29    pop         ebp
 0046FB2A    ret
*}
end;

//0046FB2C
constructor TIcon.Create();
begin
{*
 0046FB2C    push        ebx
 0046FB2D    push        esi
 0046FB2E    push        edi
 0046FB2F    test        dl,dl
>0046FB31    je          0046FB3B
 0046FB33    add         esp,0FFFFFFF0
 0046FB36    call        @ClassCreate
 0046FB3B    mov         ebx,edx
 0046FB3D    mov         edi,eax
 0046FB3F    xor         edx,edx
 0046FB41    mov         eax,edi
 0046FB43    call        TGraphic.Create
 0046FB48    mov         byte ptr [edi+21],1
 0046FB4C    mov         dl,1
 0046FB4E    mov         eax,[00464348];TIconImage
 0046FB53    call        TObject.Create
 0046FB58    mov         esi,eax
 0046FB5A    mov         dword ptr [edi+28],esi
 0046FB5D    mov         eax,esi
 0046FB5F    inc         dword ptr [eax+4]
 0046FB62    mov         eax,edi
 0046FB64    test        bl,bl
>0046FB66    je          0046FB77
 0046FB68    call        @AfterConstruction
 0046FB6D    pop         dword ptr fs:[0]
 0046FB74    add         esp,0C
 0046FB77    mov         eax,edi
 0046FB79    pop         edi
 0046FB7A    pop         esi
 0046FB7B    pop         ebx
 0046FB7C    ret
*}
end;

//0046FB80
destructor TIcon.Destroy();
begin
{*
 0046FB80    push        ebx
 0046FB81    push        esi
 0046FB82    call        @BeforeDestruction
 0046FB87    mov         ebx,edx
 0046FB89    mov         esi,eax
 0046FB8B    mov         eax,dword ptr [esi+28];TIcon.FImage:TIconImage
 0046FB8E    call        TSharedImage.Release
 0046FB93    mov         edx,ebx
 0046FB95    and         dl,0FC
 0046FB98    mov         eax,esi
 0046FB9A    call        TMemoryStream.Destroy
 0046FB9F    test        bl,bl
>0046FBA1    jle         0046FBAA
 0046FBA3    mov         eax,esi
 0046FBA5    call        @ClassDestroy
 0046FBAA    pop         esi
 0046FBAB    pop         ebx
 0046FBAC    ret
*}
end;

//0046FBB0
procedure TIcon.Assign(Source:TPersistent);
begin
{*
 0046FBB0    push        ebx
 0046FBB1    push        esi
 0046FBB2    push        edi
 0046FBB3    mov         ebx,edx
 0046FBB5    mov         esi,eax
 0046FBB7    test        ebx,ebx
>0046FBB9    je          0046FBCC
 0046FBBB    mov         eax,ebx
 0046FBBD    mov         edx,dword ptr ds:[464454];TIcon
 0046FBC3    call        @IsClass
 0046FBC8    test        al,al
>0046FBCA    je          0046FBFE
 0046FBCC    test        ebx,ebx
>0046FBCE    je          0046FBE8
 0046FBD0    mov         edi,ebx
 0046FBD2    mov         eax,dword ptr [edi+28]
 0046FBD5    inc         dword ptr [eax+4]
 0046FBD8    mov         eax,dword ptr [esi+28]
 0046FBDB    call        TSharedImage.Release
 0046FBE0    mov         eax,dword ptr [edi+28]
 0046FBE3    mov         dword ptr [esi+28],eax
>0046FBE6    jmp         0046FBF3
 0046FBE8    xor         ecx,ecx
 0046FBEA    xor         edx,edx
 0046FBEC    mov         eax,esi
 0046FBEE    call        TIcon.NewImage
 0046FBF3    mov         edx,esi
 0046FBF5    mov         eax,esi
 0046FBF7    mov         ecx,dword ptr [eax]
 0046FBF9    call        dword ptr [ecx+10]
>0046FBFC    jmp         0046FC07
 0046FBFE    mov         edx,ebx
 0046FC00    mov         eax,esi
 0046FC02    call        TPersistent.Assign
 0046FC07    pop         edi
 0046FC08    pop         esi
 0046FC09    pop         ebx
 0046FC0A    ret
*}
end;

//0046FC0C
procedure TIcon.Draw(ACanvas:TCanvas; const Rect:TRect);
begin
{*
 0046FC0C    push        ebx
 0046FC0D    push        esi
 0046FC0E    push        edi
 0046FC0F    mov         edi,ecx
 0046FC11    mov         esi,edx
 0046FC13    mov         ebx,eax
 0046FC15    movzx       edx,byte ptr ds:[46FC4C]
 0046FC1C    mov         eax,esi
 0046FC1E    mov         ecx,dword ptr [eax]
 0046FC20    call        dword ptr [ecx+2C]
 0046FC23    push        3
 0046FC25    push        0
 0046FC27    push        0
 0046FC29    push        0
 0046FC2B    push        0
 0046FC2D    mov         eax,ebx
 0046FC2F    call        TIcon.GetHandle
 0046FC34    push        eax
 0046FC35    mov         eax,dword ptr [edi+4]
 0046FC38    push        eax
 0046FC39    mov         eax,dword ptr [edi]
 0046FC3B    push        eax
 0046FC3C    mov         eax,dword ptr [esi+38]
 0046FC3F    push        eax
 0046FC40    call        user32.DrawIconEx
 0046FC45    pop         edi
 0046FC46    pop         esi
 0046FC47    pop         ebx
 0046FC48    ret
*}
end;

//0046FC50
function TIcon.GetEmpty:Boolean;
begin
{*
 0046FC50    mov         eax,dword ptr [eax+28]
 0046FC53    cmp         dword ptr [eax+14],0
>0046FC57    jne         0046FC5F
 0046FC59    cmp         dword ptr [eax+8],0
>0046FC5D    je          0046FC62
 0046FC5F    xor         eax,eax
 0046FC61    ret
 0046FC62    mov         al,1
 0046FC64    ret
*}
end;

//0046FC68
function TIcon.GetHandle:HICON;
begin
{*
 0046FC68    push        ebx
 0046FC69    mov         ebx,eax
 0046FC6B    mov         eax,ebx
 0046FC6D    call        TIcon.HandleNeeded
 0046FC72    mov         eax,dword ptr [ebx+28]
 0046FC75    mov         eax,dword ptr [eax+14]
 0046FC78    pop         ebx
 0046FC79    ret
*}
end;

//0046FC7C
function TIcon.HandleAllocated:Boolean;
begin
{*
 0046FC7C    mov         edx,dword ptr [eax+28]
 0046FC7F    test        edx,edx
>0046FC81    je          0046FC89
 0046FC83    cmp         dword ptr [edx+14],0
>0046FC87    jne         0046FC8C
 0046FC89    xor         eax,eax
 0046FC8B    ret
 0046FC8C    mov         al,1
 0046FC8E    ret
*}
end;

//0046FC90
function TIcon.GetHeight:Integer;
begin
{*
 0046FC90    push        ebx
 0046FC91    mov         ebx,eax
 0046FC93    mov         edx,dword ptr [ebx+28]
 0046FC96    mov         eax,dword ptr [edx+10]
 0046FC99    test        eax,eax
>0046FC9B    jne         0046FCB9
 0046FC9D    cmp         dword ptr [edx+8],0
>0046FCA1    je          0046FCB2
 0046FCA3    mov         eax,ebx
 0046FCA5    call        TIcon.HandleNeeded
 0046FCAA    mov         eax,dword ptr [ebx+28]
 0046FCAD    mov         eax,dword ptr [eax+10]
>0046FCB0    jmp         0046FCB9
 0046FCB2    push        0C
 0046FCB4    call        user32.GetSystemMetrics
 0046FCB9    pop         ebx
 0046FCBA    ret
*}
end;

//0046FCBC
function TIcon.GetWidth:Integer;
begin
{*
 0046FCBC    push        ebx
 0046FCBD    mov         ebx,eax
 0046FCBF    mov         edx,dword ptr [ebx+28]
 0046FCC2    mov         eax,dword ptr [edx+0C]
 0046FCC5    test        eax,eax
>0046FCC7    jne         0046FCE5
 0046FCC9    cmp         dword ptr [edx+8],0
>0046FCCD    je          0046FCDE
 0046FCCF    mov         eax,ebx
 0046FCD1    call        TIcon.HandleNeeded
 0046FCD6    mov         eax,dword ptr [ebx+28]
 0046FCD9    mov         eax,dword ptr [eax+0C]
>0046FCDC    jmp         0046FCE5
 0046FCDE    push        0C
 0046FCE0    call        user32.GetSystemMetrics
 0046FCE5    pop         ebx
 0046FCE6    ret
*}
end;

//0046FCE8
procedure TIcon.HandleNeeded;
begin
{*
 0046FCE8    push        ebx
 0046FCE9    push        esi
 0046FCEA    add         esp,0FFFFFFF4
 0046FCED    mov         esi,eax
 0046FCEF    mov         ebx,dword ptr [esi+28]
 0046FCF2    cmp         dword ptr [ebx+14],0
>0046FCF6    jne         0046FD5A
 0046FCF8    mov         eax,dword ptr [ebx+8]
 0046FCFB    test        eax,eax
>0046FCFD    je          0046FD5A
 0046FCFF    push        0
 0046FD01    push        0
 0046FD03    call        TStream.SetPosition
 0046FD08    mov         edx,esp
 0046FD0A    mov         ecx,6
 0046FD0F    mov         eax,dword ptr [ebx+8]
 0046FD12    call        TStream.ReadBuffer
 0046FD17    movzx       eax,word ptr [esp+2]
 0046FD1C    sub         ax,1
>0046FD20    jb          0046FD26
>0046FD22    je          0046FD31
>0046FD24    jmp         0046FD4E
 0046FD26    mov         eax,[00793068]
 0046FD2B    mov         dword ptr [esp+8],eax
>0046FD2F    jmp         0046FD53
 0046FD31    push        6
 0046FD33    lea         eax,[esi+2C]
 0046FD36    push        eax
 0046FD37    lea         eax,[ebx+0C]
 0046FD3A    push        eax
 0046FD3B    movzx       ecx,word ptr [esp+10]
 0046FD40    lea         edx,[esp+14]
 0046FD44    mov         eax,dword ptr [ebx+8]
 0046FD47    call        ReadIcon
>0046FD4C    jmp         0046FD53
 0046FD4E    call        InvalidIcon
 0046FD53    mov         eax,dword ptr [esp+8]
 0046FD57    mov         dword ptr [ebx+14],eax
 0046FD5A    add         esp,0C
 0046FD5D    pop         esi
 0046FD5E    pop         ebx
 0046FD5F    ret
*}
end;

//0046FD60
procedure TIcon.ImageNeeded;
begin
{*
 0046FD60    push        ebp
 0046FD61    mov         ebp,esp
 0046FD63    add         esp,0FFFFFFF4
 0046FD66    push        ebx
 0046FD67    push        esi
 0046FD68    push        edi
 0046FD69    mov         esi,eax
 0046FD6B    mov         ebx,dword ptr [esi+28]
 0046FD6E    cmp         dword ptr [ebx+8],0
>0046FD72    jne         0046FE0A
 0046FD78    cmp         dword ptr [ebx+14],0
>0046FD7C    jne         0046FD83
 0046FD7E    call        InvalidIcon
 0046FD83    mov         dl,1
 0046FD85    mov         eax,[0043DAFC];TMemoryStream
 0046FD8A    call        TObject.Create
 0046FD8F    mov         dword ptr [ebp-4],eax
 0046FD92    xor         eax,eax
 0046FD94    push        ebp
 0046FD95    push        46FDED
 0046FD9A    push        dword ptr fs:[eax]
 0046FD9D    mov         dword ptr fs:[eax],esp
 0046FDA0    mov         eax,esi
 0046FDA2    call        TIcon.GetHandle
 0046FDA7    cmp         eax,dword ptr ds:[793068]
>0046FDAD    jne         0046FDD0
 0046FDAF    lea         eax,[ebp-0A]
 0046FDB2    xor         ecx,ecx
 0046FDB4    mov         edx,6
 0046FDB9    call        @FillChar
 0046FDBE    lea         edx,[ebp-0A]
 0046FDC1    mov         ecx,6
 0046FDC6    mov         eax,dword ptr [ebp-4]
 0046FDC9    call        TStream.WriteBuffer
>0046FDCE    jmp         0046FDE3
 0046FDD0    mov         eax,esi
 0046FDD2    call        TIcon.GetHandle
 0046FDD7    mov         edx,eax
 0046FDD9    xor         ecx,ecx
 0046FDDB    mov         eax,dword ptr [ebp-4]
 0046FDDE    call        WriteIcon
 0046FDE3    xor         eax,eax
 0046FDE5    pop         edx
 0046FDE6    pop         ecx
 0046FDE7    pop         ecx
 0046FDE8    mov         dword ptr fs:[eax],edx
>0046FDEB    jmp         0046FE04
>0046FDED    jmp         @HandleAnyException
 0046FDF2    mov         eax,dword ptr [ebp-4]
 0046FDF5    call        TObject.Free
 0046FDFA    call        @RaiseAgain
 0046FDFF    call        @DoneExcept
 0046FE04    mov         eax,dword ptr [ebp-4]
 0046FE07    mov         dword ptr [ebx+8],eax
 0046FE0A    pop         edi
 0046FE0B    pop         esi
 0046FE0C    pop         ebx
 0046FE0D    mov         esp,ebp
 0046FE0F    pop         ebp
 0046FE10    ret
*}
end;

//0046FE14
procedure TIcon.LoadFromResourceID(Instance:Cardinal; ResID:Integer);
begin
{*
 0046FE14    push        ebx
 0046FE15    push        esi
 0046FE16    push        edi
 0046FE17    mov         edi,ecx
 0046FE19    mov         esi,edx
 0046FE1B    mov         ebx,eax
 0046FE1D    push        edi
 0046FE1E    push        esi
 0046FE1F    call        user32.LoadIconW
 0046FE24    mov         edx,eax
 0046FE26    mov         eax,ebx
 0046FE28    call        TIcon.SetHandle
 0046FE2D    pop         edi
 0046FE2E    pop         esi
 0046FE2F    pop         ebx
 0046FE30    ret
*}
end;

//0046FE34
procedure TIcon.LoadFromResourceName(Instance:Cardinal; ResName:string);
begin
{*
 0046FE34    push        ebx
 0046FE35    push        esi
 0046FE36    push        edi
 0046FE37    mov         edi,ecx
 0046FE39    mov         esi,edx
 0046FE3B    mov         ebx,eax
 0046FE3D    mov         eax,edi
 0046FE3F    call        @UStrToPWChar
 0046FE44    push        eax
 0046FE45    push        esi
 0046FE46    call        user32.LoadIconW
 0046FE4B    mov         edx,eax
 0046FE4D    mov         eax,ebx
 0046FE4F    call        TIcon.SetHandle
 0046FE54    pop         edi
 0046FE55    pop         esi
 0046FE56    pop         ebx
 0046FE57    ret
*}
end;

//0046FE58
procedure TIcon.LoadFromStream(Stream:TStream);
begin
{*
 0046FE58    push        ebp
 0046FE59    mov         ebp,esp
 0046FE5B    add         esp,0FFFFFFF4
 0046FE5E    push        ebx
 0046FE5F    push        esi
 0046FE60    push        edi
 0046FE61    mov         esi,edx
 0046FE63    mov         ebx,eax
 0046FE65    mov         dl,1
 0046FE67    mov         eax,[0043DAFC];TMemoryStream
 0046FE6C    call        TObject.Create
 0046FE71    mov         dword ptr [ebp-4],eax
 0046FE74    xor         eax,eax
 0046FE76    push        ebp
 0046FE77    push        46FEE6
 0046FE7C    push        dword ptr fs:[eax]
 0046FE7F    mov         dword ptr fs:[eax],esp
 0046FE82    mov         eax,esi
 0046FE84    mov         edx,dword ptr [eax]
 0046FE86    call        dword ptr [edx]
 0046FE88    push        eax
 0046FE89    mov         eax,esi
 0046FE8B    call        TStream.GetPosition
 0046FE90    pop         edx
 0046FE91    sub         edx,eax
 0046FE93    mov         eax,dword ptr [ebp-4]
 0046FE96    mov         ecx,dword ptr [eax]
 0046FE98    call        dword ptr [ecx+4]
 0046FE9B    mov         eax,dword ptr [ebp-4]
 0046FE9E    mov         edx,dword ptr [eax]
 0046FEA0    call        dword ptr [edx]
 0046FEA2    mov         ecx,eax
 0046FEA4    mov         eax,dword ptr [ebp-4]
 0046FEA7    mov         edx,dword ptr [eax+4]
 0046FEAA    mov         eax,esi
 0046FEAC    call        TStream.ReadBuffer
 0046FEB1    lea         edx,[ebp-0A]
 0046FEB4    mov         ecx,6
 0046FEB9    mov         eax,dword ptr [ebp-4]
 0046FEBC    call        TStream.ReadBuffer
 0046FEC1    movzx       eax,word ptr [ebp-8]
 0046FEC5    sub         ax,2
>0046FEC9    jb          0046FED0
 0046FECB    call        InvalidIcon
 0046FED0    mov         ecx,dword ptr [ebp-4]
 0046FED3    xor         edx,edx
 0046FED5    mov         eax,ebx
 0046FED7    call        TIcon.NewImage
 0046FEDC    xor         eax,eax
 0046FEDE    pop         edx
 0046FEDF    pop         ecx
 0046FEE0    pop         ecx
 0046FEE1    mov         dword ptr fs:[eax],edx
>0046FEE4    jmp         0046FEFD
>0046FEE6    jmp         @HandleAnyException
 0046FEEB    mov         eax,dword ptr [ebp-4]
 0046FEEE    call        TObject.Free
 0046FEF3    call        @RaiseAgain
 0046FEF8    call        @DoneExcept
 0046FEFD    mov         edx,ebx
 0046FEFF    mov         eax,ebx
 0046FF01    mov         ecx,dword ptr [eax]
 0046FF03    call        dword ptr [ecx+10]
 0046FF06    pop         edi
 0046FF07    pop         esi
 0046FF08    pop         ebx
 0046FF09    mov         esp,ebp
 0046FF0B    pop         ebp
 0046FF0C    ret
*}
end;

//0046FF10
procedure TIcon.NewImage(NewHandle:HICON; NewImage:TMemoryStream);
begin
{*
 0046FF10    push        ebp
 0046FF11    mov         ebp,esp
 0046FF13    push        ecx
 0046FF14    push        ebx
 0046FF15    push        esi
 0046FF16    push        edi
 0046FF17    mov         edi,ecx
 0046FF19    mov         esi,edx
 0046FF1B    mov         ebx,eax
 0046FF1D    mov         dl,1
 0046FF1F    mov         eax,[00464348];TIconImage
 0046FF24    call        TObject.Create
 0046FF29    mov         dword ptr [ebp-4],eax
 0046FF2C    xor         eax,eax
 0046FF2E    push        ebp
 0046FF2F    push        46FF50
 0046FF34    push        dword ptr fs:[eax]
 0046FF37    mov         dword ptr fs:[eax],esp
 0046FF3A    mov         eax,dword ptr [ebp-4]
 0046FF3D    mov         dword ptr [eax+14],esi
 0046FF40    mov         eax,dword ptr [ebp-4]
 0046FF43    mov         dword ptr [eax+8],edi
 0046FF46    xor         eax,eax
 0046FF48    pop         edx
 0046FF49    pop         ecx
 0046FF4A    pop         ecx
 0046FF4B    mov         dword ptr fs:[eax],edx
>0046FF4E    jmp         0046FF67
>0046FF50    jmp         @HandleAnyException
 0046FF55    mov         eax,dword ptr [ebp-4]
 0046FF58    call        TObject.Free
 0046FF5D    call        @RaiseAgain
 0046FF62    call        @DoneExcept
 0046FF67    mov         eax,dword ptr [ebp-4]
 0046FF6A    inc         dword ptr [eax+4]
 0046FF6D    mov         eax,dword ptr [ebx+28]
 0046FF70    call        TSharedImage.Release
 0046FF75    mov         eax,dword ptr [ebp-4]
 0046FF78    mov         dword ptr [ebx+28],eax
 0046FF7B    pop         edi
 0046FF7C    pop         esi
 0046FF7D    pop         ebx
 0046FF7E    pop         ecx
 0046FF7F    pop         ebp
 0046FF80    ret
*}
end;

//0046FF84
function TIcon.ReleaseHandle:HICON;
begin
{*
 0046FF84    push        ebx
 0046FF85    push        esi
 0046FF86    push        edi
 0046FF87    mov         ebx,eax
 0046FF89    mov         esi,dword ptr [ebx+28]
 0046FF8C    cmp         dword ptr [esi+4],1
>0046FF90    jle         0046FFA6
 0046FF92    mov         eax,dword ptr [esi+14]
 0046FF95    push        eax
 0046FF96    call        user32.CopyIcon
 0046FF9B    mov         edx,eax
 0046FF9D    xor         ecx,ecx
 0046FF9F    mov         eax,ebx
 0046FFA1    call        TIcon.NewImage
 0046FFA6    mov         edi,dword ptr [esi+14]
 0046FFA9    xor         eax,eax
 0046FFAB    mov         dword ptr [esi+14],eax
 0046FFAE    mov         edx,ebx
 0046FFB0    mov         eax,ebx
 0046FFB2    mov         ecx,dword ptr [eax]
 0046FFB4    call        dword ptr [ecx+10]
 0046FFB7    mov         eax,edi
 0046FFB9    pop         edi
 0046FFBA    pop         esi
 0046FFBB    pop         ebx
 0046FFBC    ret
*}
end;

//0046FFC0
procedure TIcon.SetHandle(Value:HICON);
begin
{*
 0046FFC0    push        ebp
 0046FFC1    mov         ebp,esp
 0046FFC3    add         esp,0FFFFFFD0
 0046FFC6    push        ebx
 0046FFC7    mov         ebx,edx
 0046FFC9    mov         dword ptr [ebp-4],eax
 0046FFCC    xor         ecx,ecx
 0046FFCE    mov         edx,ebx
 0046FFD0    mov         eax,dword ptr [ebp-4]
 0046FFD3    call        TIcon.NewImage
 0046FFD8    test        ebx,ebx
>0046FFDA    je          00470044
 0046FFDC    lea         eax,[ebp-18]
 0046FFDF    push        eax
 0046FFE0    push        ebx
 0046FFE1    call        user32.GetIconInfo
 0046FFE6    test        eax,eax
>0046FFE8    je          00470044
 0046FFEA    xor         edx,edx
 0046FFEC    push        ebp
 0046FFED    push        47003D
 0046FFF2    push        dword ptr fs:[edx]
 0046FFF5    mov         dword ptr fs:[edx],esp
 0046FFF8    lea         eax,[ebp-30]
 0046FFFB    push        eax
 0046FFFC    push        18
 0046FFFE    mov         eax,dword ptr [ebp-8]
 00470001    push        eax
 00470002    call        gdi32.GetObjectW
 00470007    test        eax,eax
>00470009    je          0047001D
 0047000B    mov         eax,dword ptr [ebp-4]
 0047000E    mov         eax,dword ptr [eax+28]
 00470011    mov         edx,dword ptr [ebp-2C]
 00470014    mov         dword ptr [eax+0C],edx
 00470017    mov         edx,dword ptr [ebp-28]
 0047001A    mov         dword ptr [eax+10],edx
 0047001D    xor         eax,eax
 0047001F    pop         edx
 00470020    pop         ecx
 00470021    pop         ecx
 00470022    mov         dword ptr fs:[eax],edx
 00470025    push        470044
 0047002A    mov         eax,dword ptr [ebp-0C]
 0047002D    push        eax
 0047002E    call        gdi32.DeleteObject
 00470033    mov         eax,dword ptr [ebp-8]
 00470036    push        eax
 00470037    call        gdi32.DeleteObject
 0047003C    ret
>0047003D    jmp         @HandleFinally
>00470042    jmp         0047002A
 00470044    mov         edx,dword ptr [ebp-4]
 00470047    mov         eax,dword ptr [ebp-4]
 0047004A    mov         ecx,dword ptr [eax]
 0047004C    call        dword ptr [ecx+10]
 0047004F    pop         ebx
 00470050    mov         esp,ebp
 00470052    pop         ebp
 00470053    ret
*}
end;

//00470054
procedure TIcon.SetHeight(Value:Integer);
begin
{*
 00470054    mov         ecx,dword ptr [eax+28]
 00470057    cmp         dword ptr [ecx+14],0
>0047005B    jne         00470061
 0047005D    mov         dword ptr [eax+30],edx
 00470060    ret
 00470061    mov         eax,[0078CFC0];^SResString185:TResStringRec
 00470066    call        InvalidOperation
 0047006B    ret
*}
end;

//0047006C
procedure TIcon.SetSize(AWidth:Integer; AHeight:Integer);
begin
{*
 0047006C    push        ebx
 0047006D    mov         ebx,dword ptr [eax+28]
 00470070    cmp         dword ptr [ebx+14],0
>00470074    jne         0047007E
 00470076    mov         dword ptr [eax+2C],edx
 00470079    mov         dword ptr [eax+30],ecx
 0047007C    pop         ebx
 0047007D    ret
 0047007E    mov         eax,[0078CFC0];^SResString185:TResStringRec
 00470083    call        InvalidOperation
 00470088    pop         ebx
 00470089    ret
*}
end;

//0047008C
procedure TIcon.SetTransparent(Value:Boolean);
begin
{*
 0047008C    ret
*}
end;

//00470090
procedure TIcon.SetWidth(Value:Integer);
begin
{*
 00470090    mov         ecx,dword ptr [eax+28]
 00470093    cmp         dword ptr [ecx+14],0
>00470097    jne         0047009D
 00470099    mov         dword ptr [eax+2C],edx
 0047009C    ret
 0047009D    mov         eax,[0078CFC0];^SResString185:TResStringRec
 004700A2    call        InvalidOperation
 004700A7    ret
*}
end;

//004700A8
procedure TIcon.SaveToStream(Stream:TStream);
begin
{*
 004700A8    push        ebx
 004700A9    push        esi
 004700AA    mov         esi,edx
 004700AC    mov         ebx,eax
 004700AE    mov         eax,ebx
 004700B0    call        TIcon.ImageNeeded
 004700B5    mov         eax,dword ptr [ebx+28]
 004700B8    mov         ebx,dword ptr [eax+8]
 004700BB    mov         eax,ebx
 004700BD    mov         edx,dword ptr [eax]
 004700BF    call        dword ptr [edx]
 004700C1    mov         ecx,eax
 004700C3    mov         edx,dword ptr [ebx+4]
 004700C6    mov         eax,esi
 004700C8    call        TStream.WriteBuffer
 004700CD    pop         esi
 004700CE    pop         ebx
 004700CF    ret
*}
end;

//004700D0
procedure TIcon.LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE);
begin
{*
 004700D0    push        ebp
 004700D1    mov         ebp,esp
 004700D3    mov         eax,[0078CBF0];^SResString282:TResStringRec
 004700D8    call        InvalidOperation
 004700DD    pop         ebp
 004700DE    ret         4
*}
end;

//004700E4
procedure TIcon.SaveToClipboardFormat(var Format:Word; var Data:Cardinal; var APalette:HPALETTE);
begin
{*
 004700E4    push        ebp
 004700E5    mov         ebp,esp
 004700E7    mov         eax,[0078CBF0];^SResString282:TResStringRec
 004700EC    call        InvalidOperation
 004700F1    pop         ebp
 004700F2    ret         4
*}
end;

//004700F8
procedure TWICImage.Assign(Source:TPersistent);
begin
{*
 004700F8    push        ebp
 004700F9    mov         ebp,esp
 004700FB    push        ecx
 004700FC    push        ebx
 004700FD    push        esi
 004700FE    push        edi
 004700FF    mov         ebx,edx
 00470101    mov         dword ptr [ebp-4],eax
 00470104    mov         eax,ebx
 00470106    mov         edx,dword ptr ds:[4649C8];TWICImage
 0047010C    call        @IsClass
 00470111    test        al,al
>00470113    je          0047020F
 00470119    mov         esi,ebx
 0047011B    cmp         dword ptr [esi+38],0
>0047011F    je          0047013E
 00470121    mov         eax,dword ptr [ebp-4]
 00470124    add         eax,38;TWICImage.FWicBitmap:IWICBitmap
 00470127    call        @IntfClear
 0047012C    push        eax
 0047012D    push        0
 0047012F    mov         eax,dword ptr [esi+38]
 00470132    push        eax
 00470133    mov         eax,[0079304C];gvar_0079304C
 00470138    push        eax
 00470139    mov         eax,dword ptr [eax]
 0047013B    call        dword ptr [eax+48]
 0047013E    cmp         dword ptr [esi+30],0
>00470142    je          004701A7
 00470144    mov         eax,dword ptr [ebp-4]
 00470147    cmp         dword ptr [eax+30],0;TWICImage.FBitmap:TBitmap
>0047014B    jne         0047015F
 0047014D    mov         dl,1
 0047014F    mov         eax,[00463B28];TBitmap
 00470154    call        TBitmap.Create;TBitmap.Create
 00470159    mov         edx,dword ptr [ebp-4]
 0047015C    mov         dword ptr [edx+30],eax;TWICImage.FBitmap:TBitmap
 0047015F    xor         ecx,ecx
 00470161    push        ebp
 00470162    push        470185
 00470167    push        dword ptr fs:[ecx]
 0047016A    mov         dword ptr fs:[ecx],esp
 0047016D    mov         edx,dword ptr [esi+30]
 00470170    mov         eax,dword ptr [ebp-4]
 00470173    mov         eax,dword ptr [eax+30];TWICImage.FBitmap:TBitmap
 00470176    mov         ecx,dword ptr [eax]
 00470178    call        dword ptr [ecx+8];TBitmap.Assign
 0047017B    xor         eax,eax
 0047017D    pop         edx
 0047017E    pop         ecx
 0047017F    pop         ecx
 00470180    mov         dword ptr fs:[eax],edx
>00470183    jmp         004701A7
>00470185    jmp         @HandleAnyException
 0047018A    mov         eax,dword ptr [ebp-4]
 0047018D    add         eax,30;TWICImage.FBitmap:TBitmap
 00470190    mov         edx,dword ptr [eax]
 00470192    xor         ecx,ecx
 00470194    mov         dword ptr [eax],ecx
 00470196    mov         eax,edx
 00470198    call        TObject.Free
 0047019D    call        @RaiseAgain
 004701A2    call        @DoneExcept
 004701A7    mov         eax,dword ptr [ebp-4]
 004701AA    push        esi
 004701AB    add         esi,3D
 004701AE    lea         edi,[eax+3D];TWICImage.FEncoderContainerFormat:TGUID
 004701B1    movs        dword ptr [edi],dword ptr [esi]
 004701B2    movs        dword ptr [edi],dword ptr [esi]
 004701B3    movs        dword ptr [edi],dword ptr [esi]
 004701B4    movs        dword ptr [edi],dword ptr [esi]
 004701B5    pop         esi
 004701B6    movzx       eax,byte ptr [esi+3C]
 004701BA    mov         edx,dword ptr [ebp-4]
 004701BD    mov         byte ptr [edx+3C],al;TWICImage.FImageFormat:TWICImageFormat
 004701C0    mov         eax,dword ptr [esi+28]
 004701C3    mov         edx,dword ptr [ebp-4]
 004701C6    mov         dword ptr [edx+28],eax;TWICImage.FWidth:Cardinal
 004701C9    mov         eax,dword ptr [esi+2C]
 004701CC    mov         edx,dword ptr [ebp-4]
 004701CF    mov         dword ptr [edx+2C],eax;TWICImage.FHeight:Cardinal
 004701D2    mov         eax,dword ptr [ebp-4]
 004701D5    mov         eax,dword ptr [eax+34];TWICImage.FData:TMemoryStream
 004701D8    call        TMemoryStream.Clear
 004701DD    push        0
 004701DF    push        0
 004701E1    mov         esi,ebx
 004701E3    mov         eax,dword ptr [esi+34]
 004701E6    call        TStream.SetPosition
 004701EB    mov         edi,dword ptr [ebx+34]
 004701EE    mov         eax,edi
 004701F0    mov         edx,dword ptr [eax]
 004701F2    call        dword ptr [edx]
 004701F4    push        edx
 004701F5    push        eax
 004701F6    mov         edx,edi
 004701F8    mov         eax,dword ptr [ebp-4]
 004701FB    mov         eax,dword ptr [eax+34];TWICImage.FData:TMemoryStream
 004701FE    call        TStream.CopyFrom
 00470203    movzx       eax,byte ptr [esi+4D]
 00470207    mov         edx,dword ptr [ebp-4]
 0047020A    mov         byte ptr [edx+4D],al;TWICImage.FFormatChanged:Boolean
>0047020D    jmp         00470271
 0047020F    mov         eax,ebx
 00470211    mov         edx,dword ptr ds:[463B28];TBitmap
 00470217    call        @IsClass
 0047021C    test        al,al
>0047021E    je          00470267
 00470220    mov         eax,dword ptr [ebp-4]
 00470223    add         eax,38;TWICImage.FWicBitmap:IWICBitmap
 00470226    call        @IntfClear
 0047022B    mov         eax,dword ptr [ebp-4]
 0047022E    cmp         dword ptr [eax+30],0;TWICImage.FBitmap:TBitmap
>00470232    jne         00470246
 00470234    mov         dl,1
 00470236    mov         eax,[00463B28];TBitmap
 0047023B    call        TBitmap.Create;TBitmap.Create
 00470240    mov         edx,dword ptr [ebp-4]
 00470243    mov         dword ptr [edx+30],eax;TWICImage.FBitmap:TBitmap
 00470246    mov         eax,dword ptr [ebp-4]
 00470249    mov         eax,dword ptr [eax+30];TWICImage.FBitmap:TBitmap
 0047024C    mov         edx,ebx
 0047024E    mov         ecx,dword ptr [eax]
 00470250    call        dword ptr [ecx+8];TBitmap.Assign
 00470253    mov         eax,dword ptr [ebp-4]
 00470256    call        TWICImage.CreateWicBitmap
 0047025B    xor         edx,edx
 0047025D    mov         eax,dword ptr [ebp-4]
 00470260    call        TWICImage.SetImageFormat
>00470265    jmp         00470271
 00470267    mov         edx,ebx
 00470269    mov         eax,dword ptr [ebp-4]
 0047026C    call        TPersistent.Assign
 00470271    pop         edi
 00470272    pop         esi
 00470273    pop         ebx
 00470274    pop         ecx
 00470275    pop         ebp
 00470276    ret
*}
end;

//00470278
procedure TWICImage.AssignTo(Dest:TPersistent);
begin
{*
 00470278    push        ebx
 00470279    push        esi
 0047027A    mov         esi,edx
 0047027C    mov         ebx,eax
 0047027E    mov         eax,esi
 00470280    mov         edx,dword ptr ds:[463B28];TBitmap
 00470286    call        @IsClass
 0047028B    test        al,al
>0047028D    je          004702A3
 0047028F    mov         eax,ebx
 00470291    call        TWICImage.RequireBitmap
 00470296    mov         edx,dword ptr [ebx+30]
 00470299    mov         eax,esi
 0047029B    mov         ecx,dword ptr [eax]
 0047029D    call        dword ptr [ecx+8]
 004702A0    pop         esi
 004702A1    pop         ebx
 004702A2    ret
 004702A3    mov         edx,esi
 004702A5    mov         eax,ebx
 004702A7    call        TPersistent.AssignTo
 004702AC    pop         esi
 004702AD    pop         ebx
 004702AE    ret
*}
end;

//004702B0
constructor TWICImage.Create();
begin
{*
 004702B0    push        ebx
 004702B1    push        esi
 004702B2    push        edi
 004702B3    test        dl,dl
>004702B5    je          004702BF
 004702B7    add         esp,0FFFFFFF0
 004702BA    call        @ClassCreate
 004702BF    mov         ebx,edx
 004702C1    mov         esi,eax
 004702C3    xor         edx,edx
 004702C5    mov         eax,esi
 004702C7    call        TGraphic.Create
 004702CC    cmp         dword ptr ds:[79304C],0;gvar_0079304C
>004702D3    jne         004702F6
 004702D5    mov         eax,79304C;gvar_0079304C
 004702DA    call        @IntfClear
 004702DF    push        eax
 004702E0    push        470344
 004702E5    push        5
 004702E7    push        0
 004702E9    mov         eax,[0078D540]
 004702EE    push        eax
 004702EF    call        ole32.CoCreateInstance
>004702F4    jmp         00470301
 004702F6    mov         eax,[0079304C];gvar_0079304C
 004702FB    push        eax
 004702FC    mov         eax,dword ptr [eax]
 004702FE    call        dword ptr [eax+4]
 00470301    mov         eax,[0078CE28]
 00470306    push        esi
 00470307    lea         edi,[esi+3D]
 0047030A    mov         esi,eax
 0047030C    movs        dword ptr [edi],dword ptr [esi]
 0047030D    movs        dword ptr [edi],dword ptr [esi]
 0047030E    movs        dword ptr [edi],dword ptr [esi]
 0047030F    movs        dword ptr [edi],dword ptr [esi]
 00470310    pop         esi
 00470311    mov         byte ptr [esi+3C],0
 00470315    mov         dl,1
 00470317    mov         eax,[0043DAFC];TMemoryStream
 0047031C    call        TObject.Create
 00470321    mov         dword ptr [esi+34],eax
 00470324    mov         byte ptr [esi+4D],0
 00470328    mov         eax,esi
 0047032A    test        bl,bl
>0047032C    je          0047033D
 0047032E    call        @AfterConstruction
 00470333    pop         dword ptr fs:[0]
 0047033A    add         esp,0C
 0047033D    mov         eax,esi
 0047033F    pop         edi
 00470340    pop         esi
 00470341    pop         ebx
 00470342    ret
*}
end;

//00470354
destructor TWICImage.Destroy();
begin
{*
 00470354    push        ebx
 00470355    push        esi
 00470356    call        @BeforeDestruction
 0047035B    mov         ebx,edx
 0047035D    mov         esi,eax
 0047035F    cmp         dword ptr [esi+30],0;TWICImage.FBitmap:TBitmap
>00470363    je          00470375
 00470365    lea         eax,[esi+30];TWICImage.FBitmap:TBitmap
 00470368    mov         edx,dword ptr [eax]
 0047036A    xor         ecx,ecx
 0047036C    mov         dword ptr [eax],ecx
 0047036E    mov         eax,edx
 00470370    call        TObject.Free
 00470375    mov         eax,dword ptr [esi+34];TWICImage.FData:TMemoryStream
 00470378    call        TObject.Free
 0047037D    mov         eax,[0079304C];gvar_0079304C
 00470382    push        eax
 00470383    mov         eax,dword ptr [eax]
 00470385    call        dword ptr [eax+8]
 00470388    test        eax,eax
>0047038A    jne         00470393
 0047038C    xor         eax,eax
 0047038E    mov         [0079304C],eax;gvar_0079304C
 00470393    mov         edx,ebx
 00470395    and         dl,0FC
 00470398    mov         eax,esi
 0047039A    call        TMemoryStream.Destroy
 0047039F    test        bl,bl
>004703A1    jle         004703AA
 004703A3    mov         eax,esi
 004703A5    call        @ClassDestroy
 004703AA    pop         esi
 004703AB    pop         ebx
 004703AC    ret
*}
end;

//004703E4
procedure TWICImage.CreateWicBitmap;
begin
{*
 004703E4    push        ebp
 004703E5    mov         ebp,esp
 004703E7    add         esp,0FFFFFFC0
 004703EA    push        ebx
 004703EB    push        esi
 004703EC    push        edi
 004703ED    xor         edx,edx
 004703EF    mov         dword ptr [ebp-4],edx
 004703F2    mov         ebx,eax
 004703F4    xor         eax,eax
 004703F6    push        ebp
 004703F7    push        470522
 004703FC    push        dword ptr fs:[eax]
 004703FF    mov         dword ptr fs:[eax],esp
 00470402    mov         eax,dword ptr [ebx+34]
 00470405    call        TMemoryStream.Clear
 0047040A    mov         byte ptr [ebx+4D],1
 0047040E    mov         eax,dword ptr [ebx+30]
 00470411    cmp         byte ptr [eax+39],1
>00470415    jne         00470428
 00470417    mov         edx,dword ptr ds:[78D000]
 0047041D    mov         esi,edx
 0047041F    lea         edi,[ebp-14]
 00470422    movs        dword ptr [edi],dword ptr [esi]
 00470423    movs        dword ptr [edi],dword ptr [esi]
 00470424    movs        dword ptr [edi],dword ptr [esi]
 00470425    movs        dword ptr [edi],dword ptr [esi]
>00470426    jmp         00470437
 00470428    mov         edx,dword ptr ds:[78CB58]
 0047042E    mov         esi,edx
 00470430    lea         edi,[ebp-14]
 00470433    movs        dword ptr [edi],dword ptr [esi]
 00470434    movs        dword ptr [edi],dword ptr [esi]
 00470435    movs        dword ptr [edi],dword ptr [esi]
 00470436    movs        dword ptr [edi],dword ptr [esi]
 00470437    mov         dl,7
 00470439    call        TBitmap.SetPixelFormat
 0047043E    mov         eax,dword ptr [ebx+30]
 00470441    mov         edx,dword ptr [eax]
 00470443    call        dword ptr [edx+30]
 00470446    mov         dword ptr [ebx+28],eax
 00470449    mov         eax,dword ptr [ebx+30]
 0047044C    mov         edx,dword ptr [eax]
 0047044E    call        dword ptr [edx+24]
 00470451    mov         esi,eax
 00470453    mov         dword ptr [ebx+2C],esi
 00470456    mov         eax,dword ptr [ebx+28]
 00470459    add         eax,eax
 0047045B    add         eax,eax
 0047045D    imul        esi
 0047045F    push        eax
 00470460    lea         eax,[ebp-4]
 00470463    mov         ecx,1
 00470468    mov         edx,dword ptr ds:[4703B0];:TWICImage.:1
 0047046E    call        @DynArraySetLength
 00470473    add         esp,4
 00470476    lea         eax,[ebp-40]
 00470479    xor         ecx,ecx
 0047047B    mov         edx,2C
 00470480    call        @FillChar
 00470485    mov         dword ptr [ebp-40],2C
 0047048C    mov         eax,dword ptr [ebx+28]
 0047048F    mov         dword ptr [ebp-3C],eax
 00470492    mov         eax,dword ptr [ebx+2C]
 00470495    neg         eax
 00470497    mov         dword ptr [ebp-38],eax
 0047049A    mov         word ptr [ebp-34],1
 004704A0    mov         word ptr [ebp-32],20
 004704A6    push        0
 004704A8    lea         eax,[ebp-40]
 004704AB    push        eax
 004704AC    mov         eax,dword ptr [ebp-4]
 004704AF    push        eax
 004704B0    mov         eax,dword ptr [ebx+2C]
 004704B3    push        eax
 004704B4    push        0
 004704B6    mov         eax,dword ptr [ebx+30]
 004704B9    mov         edx,dword ptr [eax]
 004704BB    call        dword ptr [edx+70]
 004704BE    push        eax
 004704BF    mov         eax,dword ptr [ebx+30]
 004704C2    call        TBitmap.GetCanvas
 004704C7    call        TCanvas.GetHandle
 004704CC    push        eax
 004704CD    call        gdi32.GetDIBits
 004704D2    lea         eax,[ebx+38]
 004704D5    call        @IntfClear
 004704DA    push        eax
 004704DB    mov         eax,dword ptr [ebp-4]
 004704DE    push        eax
 004704DF    mov         eax,dword ptr [ebp-4]
 004704E2    call        @DynArrayLength
 004704E7    push        eax
 004704E8    mov         esi,dword ptr [ebx+28]
 004704EB    mov         eax,esi
 004704ED    add         eax,eax
 004704EF    add         eax,eax
 004704F1    push        eax
 004704F2    lea         eax,[ebp-14]
 004704F5    push        eax
 004704F6    mov         eax,dword ptr [ebx+2C]
 004704F9    push        eax
 004704FA    push        esi
 004704FB    mov         eax,[0079304C];gvar_0079304C
 00470500    push        eax
 00470501    mov         eax,dword ptr [eax]
 00470503    call        dword ptr [eax+50]
 00470506    xor         eax,eax
 00470508    pop         edx
 00470509    pop         ecx
 0047050A    pop         ecx
 0047050B    mov         dword ptr fs:[eax],edx
 0047050E    push        470529
 00470513    lea         eax,[ebp-4]
 00470516    mov         edx,dword ptr ds:[4703B0];:TWICImage.:1
 0047051C    call        @DynArrayClear
 00470521    ret
>00470522    jmp         @HandleFinally
>00470527    jmp         00470513
 00470529    pop         edi
 0047052A    pop         esi
 0047052B    pop         ebx
 0047052C    mov         esp,ebp
 0047052E    pop         ebp
 0047052F    ret
*}
end;

//00470530
procedure TWICImage.Draw(ACanvas:TCanvas; const Rect:TRect);
begin
{*
 00470530    push        ebx
 00470531    push        esi
 00470532    push        edi
 00470533    push        ebp
 00470534    mov         ebp,ecx
 00470536    mov         edi,edx
 00470538    mov         ebx,eax
 0047053A    mov         eax,ebx
 0047053C    call        TWICImage.RequireBitmap
 00470541    mov         esi,dword ptr [ebx+30]
 00470544    test        esi,esi
>00470546    je          00470556
 00470548    mov         edx,ebp
 0047054A    mov         ecx,esi
 0047054C    mov         eax,edi
 0047054E    mov         ebx,dword ptr [eax]
 00470550    call        dword ptr [ebx+88]
 00470556    pop         ebp
 00470557    pop         edi
 00470558    pop         esi
 00470559    pop         ebx
 0047055A    ret
*}
end;

//0047055C
function TWICImage.GetEmpty:Boolean;
begin
{*
 0047055C    cmp         dword ptr [eax+38],0
 00470560    sete        al
 00470563    ret
*}
end;

//00470564
function TWICImage.GetHandle:IWICBitmap;
begin
{*
 00470564    push        ebx
 00470565    push        esi
 00470566    mov         esi,edx
 00470568    mov         ebx,eax
 0047056A    mov         eax,esi
 0047056C    mov         edx,dword ptr [ebx+38]
 0047056F    call        @IntfCopy
 00470574    pop         esi
 00470575    pop         ebx
 00470576    ret
*}
end;

//00470578
{*function TWICImage.GetHeight:?;
begin
 00470578    mov         eax,dword ptr [eax+2C];TWICImage.FHeight:Cardinal
 0047057B    ret
end;*}

//0047057C
{*function TWICImage.GetWidth:?;
begin
 0047057C    mov         eax,dword ptr [eax+28];TWICImage.FWidth:Cardinal
 0047057F    ret
end;*}

//00470580
procedure WicCheck(Result:HRESULT);
begin
{*
 00470580    push        ebp
 00470581    mov         ebp,esp
 00470583    push        0
 00470585    xor         edx,edx
 00470587    push        ebp
 00470588    push        4705D1
 0047058D    push        dword ptr fs:[edx]
 00470590    mov         dword ptr fs:[edx],esp
 00470593    test        eax,80000000
>00470598    je          004705BB
 0047059A    lea         edx,[ebp-4]
 0047059D    mov         eax,[0078D234];^SResString183:TResStringRec
 004705A2    call        LoadResString
 004705A7    mov         ecx,dword ptr [ebp-4]
 004705AA    mov         dl,1
 004705AC    mov         eax,[0045F1D8];EInvalidGraphic
 004705B1    call        Exception.Create
 004705B6    call        @RaiseExcept
 004705BB    xor         eax,eax
 004705BD    pop         edx
 004705BE    pop         ecx
 004705BF    pop         ecx
 004705C0    mov         dword ptr fs:[eax],edx
 004705C3    push        4705D8
 004705C8    lea         eax,[ebp-4]
 004705CB    call        @UStrClr
 004705D0    ret
>004705D1    jmp         @HandleFinally
>004705D6    jmp         004705C8
 004705D8    pop         ecx
 004705D9    pop         ebp
 004705DA    ret
*}
end;

//004705DC
procedure TWICImage.LoadFromStream(Stream:TStream);
begin
{*
 004705DC    push        ebp
 004705DD    mov         ebp,esp
 004705DF    add         esp,0FFFFFFE8
 004705E2    push        ebx
 004705E3    push        esi
 004705E4    xor         ecx,ecx
 004705E6    mov         dword ptr [ebp-4],ecx
 004705E9    mov         dword ptr [ebp-8],ecx
 004705EC    mov         esi,edx
 004705EE    mov         ebx,eax
 004705F0    xor         eax,eax
 004705F2    push        ebp
 004705F3    push        47070E
 004705F8    push        dword ptr fs:[eax]
 004705FB    mov         dword ptr fs:[eax],esp
 004705FE    lea         eax,[ebx+30];TWICImage.FBitmap:TBitmap
 00470601    mov         edx,dword ptr [eax]
 00470603    xor         ecx,ecx
 00470605    mov         dword ptr [eax],ecx
 00470607    mov         eax,edx
 00470609    call        TObject.Free
 0047060E    mov         eax,dword ptr [ebx+34];TWICImage.FData:TMemoryStream
 00470611    call        TMemoryStream.Clear
 00470616    mov         eax,esi
 00470618    mov         edx,dword ptr [eax]
 0047061A    call        dword ptr [edx];TStream.GetSize
 0047061C    push        edx
 0047061D    push        eax
 0047061E    mov         eax,esi
 00470620    call        TStream.GetPosition
 00470625    sub         dword ptr [esp],eax
 00470628    sbb         dword ptr [esp+4],edx
 0047062C    pop         eax
 0047062D    pop         edx
 0047062E    push        edx
 0047062F    push        eax
 00470630    mov         edx,esi
 00470632    mov         eax,dword ptr [ebx+34];TWICImage.FData:TMemoryStream
 00470635    call        TStream.CopyFrom
 0047063A    push        0
 0047063C    push        0
 0047063E    mov         eax,dword ptr [ebx+34];TWICImage.FData:TMemoryStream
 00470641    call        TStream.SetPosition
 00470646    push        0
 00470648    mov         ecx,dword ptr [ebx+34];TWICImage.FData:TMemoryStream
 0047064B    mov         dl,1
 0047064D    mov         eax,[0043E568];TStreamAdapter
 00470652    call        TStreamAdapter.Create;TStreamAdapter.Create
 00470657    mov         esi,eax
 00470659    lea         eax,[ebp-4]
 0047065C    call        @IntfClear
 00470661    push        eax
 00470662    push        0
 00470664    mov         eax,[0078D23C];^gvar_00784E50
 00470669    push        eax
 0047066A    test        esi,esi
>0047066C    je          00470671
 0047066E    sub         esi,0FFFFFFEC
 00470671    push        esi
 00470672    mov         eax,[0079304C];gvar_0079304C
 00470677    push        eax
 00470678    mov         eax,dword ptr [eax]
 0047067A    call        dword ptr [eax+10]
 0047067D    call        WicCheck
 00470682    lea         eax,[ebp-18]
 00470685    push        eax
 00470686    mov         eax,dword ptr [ebp-4]
 00470689    push        eax
 0047068A    mov         eax,dword ptr [eax]
 0047068C    call        dword ptr [eax+14]
 0047068F    call        WicCheck
 00470694    lea         edx,[ebp-18]
 00470697    mov         eax,ebx
 00470699    call        TWICImage.SetEncoderContainerFormat
 0047069E    lea         eax,[ebp-8]
 004706A1    call        @IntfClear
 004706A6    push        eax
 004706A7    push        0
 004706A9    mov         eax,dword ptr [ebp-4]
 004706AC    push        eax
 004706AD    mov         eax,dword ptr [eax]
 004706AF    call        dword ptr [eax+34]
 004706B2    call        WicCheck
 004706B7    lea         eax,[ebx+38];TWICImage.FWicBitmap:IWICBitmap
 004706BA    call        @IntfClear
 004706BF    push        eax
 004706C0    push        2
 004706C2    mov         eax,dword ptr [ebp-8]
 004706C5    push        eax
 004706C6    mov         eax,[0079304C];gvar_0079304C
 004706CB    push        eax
 004706CC    mov         eax,dword ptr [eax]
 004706CE    call        dword ptr [eax+48]
 004706D1    call        WicCheck
 004706D6    lea         eax,[ebx+2C];TWICImage.FHeight:Cardinal
 004706D9    push        eax
 004706DA    lea         eax,[ebx+28];TWICImage.FWidth:Cardinal
 004706DD    push        eax
 004706DE    mov         eax,dword ptr [ebx+38];TWICImage.FWicBitmap:IWICBitmap
 004706E1    push        eax
 004706E2    mov         eax,dword ptr [eax]
 004706E4    call        dword ptr [eax+0C]
 004706E7    call        WicCheck
 004706EC    mov         byte ptr [ebx+4D],0;TWICImage.FFormatChanged:Boolean
 004706F0    xor         eax,eax
 004706F2    pop         edx
 004706F3    pop         ecx
 004706F4    pop         ecx
 004706F5    mov         dword ptr fs:[eax],edx
 004706F8    push        470715
 004706FD    lea         eax,[ebp-8]
 00470700    call        @IntfClear
 00470705    lea         eax,[ebp-4]
 00470708    call        @IntfClear
 0047070D    ret
>0047070E    jmp         @HandleFinally
>00470713    jmp         004706FD
 00470715    pop         esi
 00470716    pop         ebx
 00470717    mov         esp,ebp
 00470719    pop         ebp
 0047071A    ret
*}
end;

//0047071C
procedure TWICImage.SaveToStream(Stream:TStream);
begin
{*
 0047071C    push        ebp
 0047071D    mov         ebp,esp
 0047071F    mov         ecx,4
 00470724    push        0
 00470726    push        0
 00470728    dec         ecx
>00470729    jne         00470724
 0047072B    push        ecx
 0047072C    push        ebx
 0047072D    push        esi
 0047072E    push        edi
 0047072F    mov         edi,edx
 00470731    mov         ebx,eax
 00470733    xor         eax,eax
 00470735    push        ebp
 00470736    push        4708BE
 0047073B    push        dword ptr fs:[eax]
 0047073E    mov         dword ptr fs:[eax],esp
 00470741    cmp         byte ptr [ebx+4D],0;TWICImage.FFormatChanged:Boolean
>00470745    je          00470868
 0047074B    mov         eax,dword ptr [ebx+34];TWICImage.FData:TMemoryStream
 0047074E    call        TMemoryStream.Clear
 00470753    push        0
 00470755    mov         ecx,dword ptr [ebx+34];TWICImage.FData:TMemoryStream
 00470758    mov         dl,1
 0047075A    mov         eax,[0043E568];TStreamAdapter
 0047075F    call        TStreamAdapter.Create;TStreamAdapter.Create
 00470764    mov         esi,eax
 00470766    mov         eax,esi
 00470768    test        eax,eax
>0047076A    je          0047076F
 0047076C    sub         eax,0FFFFFFF8
 0047076F    push        eax
 00470770    mov         eax,dword ptr [eax]
 00470772    call        dword ptr [eax+4];TStreamAdapter.Write
 00470775    lea         eax,[ebp-10]
 00470778    call        @IntfClear
 0047077D    push        eax
 0047077E    mov         eax,[0079304C];gvar_0079304C
 00470783    push        eax
 00470784    mov         eax,dword ptr [eax]
 00470786    call        dword ptr [eax+38]
 00470789    test        esi,esi
>0047078B    je          00470790
 0047078D    sub         esi,0FFFFFFEC
 00470790    push        esi
 00470791    mov         eax,dword ptr [ebp-10]
 00470794    push        eax
 00470795    mov         eax,dword ptr [eax]
 00470797    call        dword ptr [eax+38]
 0047079A    lea         eax,[ebp-4]
 0047079D    call        @IntfClear
 004707A2    push        eax
 004707A3    mov         eax,[0078D23C];^gvar_00784E50
 004707A8    push        eax
 004707A9    lea         eax,[ebx+3D];TWICImage.FEncoderContainerFormat:TGUID
 004707AC    push        eax
 004707AD    mov         eax,[0079304C];gvar_0079304C
 004707B2    push        eax
 004707B3    mov         eax,dword ptr [eax]
 004707B5    call        dword ptr [eax+20]
 004707B8    push        2
 004707BA    mov         eax,dword ptr [ebp-10]
 004707BD    push        eax
 004707BE    mov         eax,dword ptr [ebp-4]
 004707C1    push        eax
 004707C2    mov         eax,dword ptr [eax]
 004707C4    call        dword ptr [eax+0C]
 004707C7    lea         eax,[ebp-0C]
 004707CA    push        eax
 004707CB    lea         eax,[ebp-8]
 004707CE    call        @IntfClear
 004707D3    push        eax
 004707D4    mov         eax,dword ptr [ebp-4]
 004707D7    push        eax
 004707D8    mov         eax,dword ptr [eax]
 004707DA    call        dword ptr [eax+28]
 004707DD    mov         eax,dword ptr [ebp-0C]
 004707E0    push        eax
 004707E1    mov         eax,dword ptr [ebp-8]
 004707E4    push        eax
 004707E5    mov         eax,dword ptr [eax]
 004707E7    call        dword ptr [eax+0C]
 004707EA    lea         eax,[ebp-24]
 004707ED    push        eax
 004707EE    mov         eax,dword ptr [ebx+38];TWICImage.FWicBitmap:IWICBitmap
 004707F1    push        eax
 004707F2    mov         eax,dword ptr [eax]
 004707F4    call        dword ptr [eax+10]
 004707F7    lea         eax,[ebp-24]
 004707FA    push        eax
 004707FB    mov         eax,dword ptr [ebp-8]
 004707FE    push        eax
 004707FF    mov         eax,dword ptr [eax]
 00470801    call        dword ptr [eax+18]
 00470804    mov         eax,dword ptr [ebx+2C];TWICImage.FHeight:Cardinal
 00470807    push        eax
 00470808    mov         eax,dword ptr [ebx+28];TWICImage.FWidth:Cardinal
 0047080B    push        eax
 0047080C    mov         eax,dword ptr [ebp-8]
 0047080F    push        eax
 00470810    mov         eax,dword ptr [eax]
 00470812    call        dword ptr [eax+10]
 00470815    lea         eax,[ebp-14]
 00470818    call        @IntfClear
 0047081D    push        eax
 0047081E    mov         eax,[0079304C];gvar_0079304C
 00470823    push        eax
 00470824    mov         eax,dword ptr [eax]
 00470826    call        dword ptr [eax+24]
 00470829    mov         eax,dword ptr [ebp-14]
 0047082C    push        eax
 0047082D    mov         eax,dword ptr [ebx+38];TWICImage.FWicBitmap:IWICBitmap
 00470830    push        eax
 00470831    mov         eax,dword ptr [eax]
 00470833    call        dword ptr [eax+18]
 00470836    mov         eax,dword ptr [ebp-14]
 00470839    push        eax
 0047083A    mov         eax,dword ptr [ebp-8]
 0047083D    push        eax
 0047083E    mov         eax,dword ptr [eax]
 00470840    call        dword ptr [eax+20]
 00470843    push        0
 00470845    mov         eax,dword ptr [ebx+38];TWICImage.FWicBitmap:IWICBitmap
 00470848    push        eax
 00470849    mov         eax,dword ptr [ebp-8]
 0047084C    push        eax
 0047084D    mov         eax,dword ptr [eax]
 0047084F    call        dword ptr [eax+2C]
 00470852    mov         eax,dword ptr [ebp-8]
 00470855    push        eax
 00470856    mov         eax,dword ptr [eax]
 00470858    call        dword ptr [eax+30]
 0047085B    mov         eax,dword ptr [ebp-4]
 0047085E    push        eax
 0047085F    mov         eax,dword ptr [eax]
 00470861    call        dword ptr [eax+2C]
 00470864    mov         byte ptr [ebx+4D],0;TWICImage.FFormatChanged:Boolean
 00470868    push        0
 0047086A    push        0
 0047086C    mov         eax,dword ptr [ebx+34];TWICImage.FData:TMemoryStream
 0047086F    call        TStream.SetPosition
 00470874    mov         esi,dword ptr [ebx+34];TWICImage.FData:TMemoryStream
 00470877    mov         eax,esi
 00470879    mov         edx,dword ptr [eax]
 0047087B    call        dword ptr [edx];TStream.GetSize
 0047087D    push        edx
 0047087E    push        eax
 0047087F    mov         edx,esi
 00470881    mov         eax,edi
 00470883    call        TStream.CopyFrom
 00470888    xor         eax,eax
 0047088A    pop         edx
 0047088B    pop         ecx
 0047088C    pop         ecx
 0047088D    mov         dword ptr fs:[eax],edx
 00470890    push        4708C5
 00470895    lea         eax,[ebp-14]
 00470898    call        @IntfClear
 0047089D    lea         eax,[ebp-10]
 004708A0    call        @IntfClear
 004708A5    lea         eax,[ebp-0C]
 004708A8    call        @IntfClear
 004708AD    lea         eax,[ebp-8]
 004708B0    call        @IntfClear
 004708B5    lea         eax,[ebp-4]
 004708B8    call        @IntfClear
 004708BD    ret
>004708BE    jmp         @HandleFinally
>004708C3    jmp         00470895
 004708C5    pop         edi
 004708C6    pop         esi
 004708C7    pop         ebx
 004708C8    mov         esp,ebp
 004708CA    pop         ebp
 004708CB    ret
*}
end;

//004708CC
procedure TWICImage.LoadFromClipboardFormat(AFormat:Word; AData:Cardinal; APalette:HPALETTE);
begin
{*
 004708CC    push        ebp
 004708CD    mov         ebp,esp
 004708CF    push        ecx
 004708D0    push        ebx
 004708D1    push        esi
 004708D2    push        edi
 004708D3    mov         edi,ecx
 004708D5    mov         esi,edx
 004708D7    mov         dword ptr [ebp-4],eax
 004708DA    mov         eax,dword ptr [ebp-4]
 004708DD    add         eax,38
 004708E0    call        @IntfClear
 004708E5    mov         eax,dword ptr [ebp-4]
 004708E8    mov         ebx,dword ptr [eax+30]
 004708EB    test        ebx,ebx
>004708ED    jne         004708FF
 004708EF    mov         eax,ebx
 004708F1    or          edx,0FFFFFFFF
 004708F4    mov         ecx,dword ptr [eax]
 004708F6    call        dword ptr [ecx+50]
 004708F9    mov         edx,dword ptr [ebp-4]
 004708FC    mov         dword ptr [edx+30],eax
 004708FF    xor         ecx,ecx
 00470901    push        ebp
 00470902    push        470932
 00470907    push        dword ptr fs:[ecx]
 0047090A    mov         dword ptr fs:[ecx],esp
 0047090D    mov         eax,dword ptr [ebp+8]
 00470910    push        eax
 00470911    mov         eax,dword ptr [ebp-4]
 00470914    mov         eax,dword ptr [eax+30]
 00470917    mov         ecx,edi
 00470919    mov         edx,esi
 0047091B    mov         ebx,dword ptr [eax]
 0047091D    call        dword ptr [ebx+64]
 00470920    mov         eax,dword ptr [ebp-4]
 00470923    call        TWICImage.CreateWicBitmap
 00470928    xor         eax,eax
 0047092A    pop         edx
 0047092B    pop         ecx
 0047092C    pop         ecx
 0047092D    mov         dword ptr fs:[eax],edx
>00470930    jmp         00470954
>00470932    jmp         @HandleAnyException
 00470937    mov         eax,dword ptr [ebp-4]
 0047093A    add         eax,30
 0047093D    mov         edx,dword ptr [eax]
 0047093F    xor         ecx,ecx
 00470941    mov         dword ptr [eax],ecx
 00470943    mov         eax,edx
 00470945    call        TObject.Free
 0047094A    call        @RaiseAgain
 0047094F    call        @DoneExcept
 00470954    pop         edi
 00470955    pop         esi
 00470956    pop         ebx
 00470957    pop         ecx
 00470958    pop         ebp
 00470959    ret         4
*}
end;

//0047095C
procedure TWICImage.SaveToClipboardFormat(var AFormat:Word; var AData:Cardinal; var APalette:HPALETTE);
begin
{*
 0047095C    push        ebp
 0047095D    mov         ebp,esp
 0047095F    push        ebx
 00470960    push        esi
 00470961    push        edi
 00470962    mov         edi,ecx
 00470964    mov         esi,edx
 00470966    mov         ebx,eax
 00470968    mov         eax,ebx
 0047096A    call        TWICImage.RequireBitmap
 0047096F    mov         eax,dword ptr [ebp+8]
 00470972    push        eax
 00470973    mov         ecx,edi
 00470975    mov         edx,esi
 00470977    mov         eax,dword ptr [ebx+30]
 0047097A    mov         ebx,dword ptr [eax]
 0047097C    call        dword ptr [ebx+68]
 0047097F    pop         edi
 00470980    pop         esi
 00470981    pop         ebx
 00470982    pop         ebp
 00470983    ret         4
*}
end;

//00470988
procedure TWICImage.SetEncoderContainerFormat(const Value:TGUID);
begin
{*
 00470988    push        ebx
 00470989    push        esi
 0047098A    push        edi
 0047098B    mov         esi,edx
 0047098D    mov         ebx,eax
 0047098F    lea         eax,[ebx+3D]
 00470992    push        eax
 00470993    push        esi
 00470994    call        ole32.IsEqualGUID
 00470999    test        al,al
>0047099B    jne         00470A36
 004709A1    mov         byte ptr [ebx+4D],1
 004709A5    push        esi
 004709A6    lea         edi,[ebx+3D]
 004709A9    movs        dword ptr [edi],dword ptr [esi]
 004709AA    movs        dword ptr [edi],dword ptr [esi]
 004709AB    movs        dword ptr [edi],dword ptr [esi]
 004709AC    movs        dword ptr [edi],dword ptr [esi]
 004709AD    pop         esi
 004709AE    mov         eax,[0078CE28]
 004709B3    push        eax
 004709B4    push        esi
 004709B5    call        ole32.IsEqualGUID
 004709BA    test        al,al
>004709BC    je          004709C4
 004709BE    mov         byte ptr [ebx+3C],0
>004709C2    jmp         00470A36
 004709C4    mov         eax,[0078CD24]
 004709C9    push        eax
 004709CA    push        esi
 004709CB    call        ole32.IsEqualGUID
 004709D0    test        al,al
>004709D2    je          004709DA
 004709D4    mov         byte ptr [ebx+3C],1
>004709D8    jmp         00470A36
 004709DA    mov         eax,[0078D51C]
 004709DF    push        eax
 004709E0    push        esi
 004709E1    call        ole32.IsEqualGUID
 004709E6    test        al,al
>004709E8    je          004709F0
 004709EA    mov         byte ptr [ebx+3C],2
>004709EE    jmp         00470A36
 004709F0    mov         eax,[0078D8C4]
 004709F5    push        eax
 004709F6    push        esi
 004709F7    call        ole32.IsEqualGUID
 004709FC    test        al,al
>004709FE    je          00470A06
 00470A00    mov         byte ptr [ebx+3C],4
>00470A04    jmp         00470A36
 00470A06    mov         eax,[0078D5FC]
 00470A0B    push        eax
 00470A0C    push        esi
 00470A0D    call        ole32.IsEqualGUID
 00470A12    test        al,al
>00470A14    je          00470A1C
 00470A16    mov         byte ptr [ebx+3C],3
>00470A1A    jmp         00470A36
 00470A1C    mov         eax,[0078D920]
 00470A21    push        eax
 00470A22    push        esi
 00470A23    call        ole32.IsEqualGUID
 00470A28    test        al,al
>00470A2A    je          00470A32
 00470A2C    mov         byte ptr [ebx+3C],5
>00470A30    jmp         00470A36
 00470A32    mov         byte ptr [ebx+3C],6
 00470A36    pop         edi
 00470A37    pop         esi
 00470A38    pop         ebx
 00470A39    ret
*}
end;

//00470A3C
procedure TWICImage.SetImageFormat(const Value:TWICImageFormat);
begin
{*
 00470A3C    push        esi
 00470A3D    push        edi
 00470A3E    cmp         dl,byte ptr [eax+3C]
>00470A41    je          00470ADD
 00470A47    mov         byte ptr [eax+4D],1
 00470A4B    mov         byte ptr [eax+3C],dl
 00470A4E    and         edx,7F
 00470A51    cmp         edx,5
>00470A54    ja          00470ADD
 00470A5A    jmp         dword ptr [edx*4+470A61]
 00470A5A    dd          00470A79
 00470A5A    dd          00470A8A
 00470A5A    dd          00470A9B
 00470A5A    dd          00470AAC
 00470A5A    dd          00470ABD
 00470A5A    dd          00470ACE
 00470A79    mov         edx,dword ptr ds:[78CE28]
 00470A7F    mov         esi,edx
 00470A81    lea         edi,[eax+3D]
 00470A84    movs        dword ptr [edi],dword ptr [esi]
 00470A85    movs        dword ptr [edi],dword ptr [esi]
 00470A86    movs        dword ptr [edi],dword ptr [esi]
 00470A87    movs        dword ptr [edi],dword ptr [esi]
>00470A88    jmp         00470ADD
 00470A8A    mov         edx,dword ptr ds:[78CD24]
 00470A90    mov         esi,edx
 00470A92    lea         edi,[eax+3D]
 00470A95    movs        dword ptr [edi],dword ptr [esi]
 00470A96    movs        dword ptr [edi],dword ptr [esi]
 00470A97    movs        dword ptr [edi],dword ptr [esi]
 00470A98    movs        dword ptr [edi],dword ptr [esi]
>00470A99    jmp         00470ADD
 00470A9B    mov         edx,dword ptr ds:[78D51C]
 00470AA1    mov         esi,edx
 00470AA3    lea         edi,[eax+3D]
 00470AA6    movs        dword ptr [edi],dword ptr [esi]
 00470AA7    movs        dword ptr [edi],dword ptr [esi]
 00470AA8    movs        dword ptr [edi],dword ptr [esi]
 00470AA9    movs        dword ptr [edi],dword ptr [esi]
>00470AAA    jmp         00470ADD
 00470AAC    mov         edx,dword ptr ds:[78D5FC]
 00470AB2    mov         esi,edx
 00470AB4    lea         edi,[eax+3D]
 00470AB7    movs        dword ptr [edi],dword ptr [esi]
 00470AB8    movs        dword ptr [edi],dword ptr [esi]
 00470AB9    movs        dword ptr [edi],dword ptr [esi]
 00470ABA    movs        dword ptr [edi],dword ptr [esi]
>00470ABB    jmp         00470ADD
 00470ABD    mov         edx,dword ptr ds:[78D8C4]
 00470AC3    mov         esi,edx
 00470AC5    lea         edi,[eax+3D]
 00470AC8    movs        dword ptr [edi],dword ptr [esi]
 00470AC9    movs        dword ptr [edi],dword ptr [esi]
 00470ACA    movs        dword ptr [edi],dword ptr [esi]
 00470ACB    movs        dword ptr [edi],dword ptr [esi]
>00470ACC    jmp         00470ADD
 00470ACE    mov         edx,dword ptr ds:[78D920]
 00470AD4    mov         esi,edx
 00470AD6    lea         edi,[eax+3D]
 00470AD9    movs        dword ptr [edi],dword ptr [esi]
 00470ADA    movs        dword ptr [edi],dword ptr [esi]
 00470ADB    movs        dword ptr [edi],dword ptr [esi]
 00470ADC    movs        dword ptr [edi],dword ptr [esi]
 00470ADD    pop         edi
 00470ADE    pop         esi
 00470ADF    ret
*}
end;

//00470B3C
procedure TWICImage.SetHeight(Value:Integer);
begin
{*
 00470B3C    mov         eax,[0078CB3C];^SResString186:TResStringRec
 00470B41    call        InvalidOperation
 00470B46    ret
*}
end;

//00470B48
procedure TWICImage.SetWidth(Value:Integer);
begin
{*
 00470B48    mov         eax,[0078CB3C];^SResString186:TResStringRec
 00470B4D    call        InvalidOperation
 00470B52    ret
*}
end;

//00470B88
procedure TWICImage.RequireBitmap;
begin
{*
 00470B88    push        ebp
 00470B89    mov         ebp,esp
 00470B8B    add         esp,0FFFFFFC8
 00470B8E    push        ebx
 00470B8F    push        esi
 00470B90    push        edi
 00470B91    xor         edx,edx
 00470B93    mov         dword ptr [ebp-4],edx
 00470B96    mov         dword ptr [ebp-8],edx
 00470B99    mov         dword ptr [ebp-0C],eax
 00470B9C    xor         eax,eax
 00470B9E    push        ebp
 00470B9F    push        470D45
 00470BA4    push        dword ptr fs:[eax]
 00470BA7    mov         dword ptr fs:[eax],esp
 00470BAA    mov         eax,dword ptr [ebp-0C]
 00470BAD    cmp         dword ptr [eax+30],0
>00470BB1    jne         00470D21
 00470BB7    mov         eax,dword ptr [ebp-0C]
 00470BBA    cmp         dword ptr [eax+38],0
>00470BBE    je          00470D21
 00470BC4    mov         eax,dword ptr [ebp-0C]
 00470BC7    add         eax,2C
 00470BCA    push        eax
 00470BCB    mov         eax,dword ptr [ebp-0C]
 00470BCE    add         eax,28
 00470BD1    push        eax
 00470BD2    mov         eax,dword ptr [ebp-0C]
 00470BD5    mov         eax,dword ptr [eax+38]
 00470BD8    push        eax
 00470BD9    mov         eax,dword ptr [eax]
 00470BDB    call        dword ptr [eax+0C]
 00470BDE    mov         eax,dword ptr [ebp-0C]
 00470BE1    mov         ebx,dword ptr [eax+28]
 00470BE4    add         ebx,ebx
 00470BE6    add         ebx,ebx
 00470BE8    mov         eax,dword ptr [ebp-0C]
 00470BEB    mov         eax,dword ptr [eax+2C]
 00470BEE    imul        ebx
 00470BF0    push        eax
 00470BF1    lea         eax,[ebp-8]
 00470BF4    mov         ecx,1
 00470BF9    mov         edx,dword ptr ds:[470B54];:TWICImage.:2
 00470BFF    call        @DynArraySetLength
 00470C04    add         esp,4
 00470C07    lea         eax,[ebp-4]
 00470C0A    call        @IntfClear
 00470C0F    push        eax
 00470C10    mov         eax,dword ptr [ebp-0C]
 00470C13    mov         eax,dword ptr [eax+38]
 00470C16    push        eax
 00470C17    mov         eax,[0078D000]
 00470C1C    push        eax
 00470C1D    call        WICConvertBitmapSource
 00470C22    mov         eax,dword ptr [ebp-8]
 00470C25    push        eax
 00470C26    mov         eax,dword ptr [ebp-8]
 00470C29    call        @DynArrayLength
 00470C2E    push        eax
 00470C2F    push        ebx
 00470C30    push        0
 00470C32    mov         eax,dword ptr [ebp-4]
 00470C35    push        eax
 00470C36    mov         eax,dword ptr [eax]
 00470C38    call        dword ptr [eax+1C]
 00470C3B    lea         eax,[ebp-38]
 00470C3E    xor         ecx,ecx
 00470C40    mov         edx,2C
 00470C45    call        @FillChar
 00470C4A    mov         dword ptr [ebp-38],2C
 00470C51    mov         eax,dword ptr [ebp-0C]
 00470C54    mov         eax,dword ptr [eax+28]
 00470C57    mov         dword ptr [ebp-34],eax
 00470C5A    mov         eax,dword ptr [ebp-0C]
 00470C5D    mov         eax,dword ptr [eax+2C]
 00470C60    neg         eax
 00470C62    mov         dword ptr [ebp-30],eax
 00470C65    mov         word ptr [ebp-2C],1
 00470C6B    mov         word ptr [ebp-2A],20
 00470C71    mov         dl,1
 00470C73    mov         eax,[00463B28];TBitmap
 00470C78    call        TBitmap.Create
 00470C7D    mov         ebx,eax
 00470C7F    mov         eax,dword ptr [ebp-0C]
 00470C82    mov         dword ptr [eax+30],ebx
 00470C85    xor         ecx,ecx
 00470C87    push        ebp
 00470C88    push        470CFF
 00470C8D    push        dword ptr fs:[ecx]
 00470C90    mov         dword ptr fs:[ecx],esp
 00470C93    mov         eax,ebx
 00470C95    mov         dl,7
 00470C97    call        TBitmap.SetPixelFormat
 00470C9C    mov         eax,dword ptr [ebp-0C]
 00470C9F    mov         ecx,dword ptr [eax+2C]
 00470CA2    mov         eax,dword ptr [ebp-0C]
 00470CA5    mov         edx,dword ptr [eax+28]
 00470CA8    mov         eax,dword ptr [ebp-0C]
 00470CAB    mov         eax,dword ptr [eax+30]
 00470CAE    mov         ebx,dword ptr [eax]
 00470CB0    call        dword ptr [ebx+6C]
 00470CB3    push        0
 00470CB5    lea         eax,[ebp-38]
 00470CB8    push        eax
 00470CB9    mov         eax,dword ptr [ebp-8]
 00470CBC    push        eax
 00470CBD    mov         eax,dword ptr [ebp-0C]
 00470CC0    mov         eax,dword ptr [eax+2C]
 00470CC3    push        eax
 00470CC4    push        0
 00470CC6    mov         eax,dword ptr [ebp-0C]
 00470CC9    mov         eax,dword ptr [eax+30]
 00470CCC    mov         edx,dword ptr [eax]
 00470CCE    call        dword ptr [edx+70]
 00470CD1    push        eax
 00470CD2    mov         eax,dword ptr [ebp-0C]
 00470CD5    mov         eax,dword ptr [eax+30]
 00470CD8    call        TBitmap.GetCanvas
 00470CDD    call        TCanvas.GetHandle
 00470CE2    push        eax
 00470CE3    call        gdi32.SetDIBits
 00470CE8    mov         eax,dword ptr [ebp-0C]
 00470CEB    mov         eax,dword ptr [eax+30]
 00470CEE    mov         dl,1
 00470CF0    call        TBitmap.SetAlphaFormat
 00470CF5    xor         eax,eax
 00470CF7    pop         edx
 00470CF8    pop         ecx
 00470CF9    pop         ecx
 00470CFA    mov         dword ptr fs:[eax],edx
>00470CFD    jmp         00470D21
>00470CFF    jmp         @HandleAnyException
 00470D04    mov         eax,dword ptr [ebp-0C]
 00470D07    add         eax,30
 00470D0A    mov         edx,dword ptr [eax]
 00470D0C    xor         ecx,ecx
 00470D0E    mov         dword ptr [eax],ecx
 00470D10    mov         eax,edx
 00470D12    call        TObject.Free
 00470D17    call        @RaiseAgain
 00470D1C    call        @DoneExcept
 00470D21    xor         eax,eax
 00470D23    pop         edx
 00470D24    pop         ecx
 00470D25    pop         ecx
 00470D26    mov         dword ptr fs:[eax],edx
 00470D29    push        470D4C
 00470D2E    lea         eax,[ebp-8]
 00470D31    mov         edx,dword ptr ds:[470B54];:TWICImage.:2
 00470D37    call        @DynArrayClear
 00470D3C    lea         eax,[ebp-4]
 00470D3F    call        @IntfClear
 00470D44    ret
>00470D45    jmp         @HandleFinally
>00470D4A    jmp         00470D2E
 00470D4C    pop         edi
 00470D4D    pop         esi
 00470D4E    pop         ebx
 00470D4F    mov         esp,ebp
 00470D51    pop         ebp
 00470D52    ret
*}
end;

//00470D54
procedure InitScreenLogPixels;
begin
{*
 00470D54    push        ebp
 00470D55    mov         ebp,esp
 00470D57    push        ecx
 00470D58    push        0
 00470D5A    call        user32.GetDC
 00470D5F    mov         dword ptr [ebp-4],eax
 00470D62    xor         eax,eax
 00470D64    push        ebp
 00470D65    push        470D99
 00470D6A    push        dword ptr fs:[eax]
 00470D6D    mov         dword ptr fs:[eax],esp
 00470D70    push        5A
 00470D72    mov         eax,dword ptr [ebp-4]
 00470D75    push        eax
 00470D76    call        gdi32.GetDeviceCaps
 00470D7B    mov         [00793058],eax
 00470D80    xor         eax,eax
 00470D82    pop         edx
 00470D83    pop         ecx
 00470D84    pop         ecx
 00470D85    mov         dword ptr fs:[eax],edx
 00470D88    push        470DA0
 00470D8D    mov         eax,dword ptr [ebp-4]
 00470D90    push        eax
 00470D91    push        0
 00470D93    call        user32.ReleaseDC
 00470D98    ret
>00470D99    jmp         @HandleFinally
>00470D9E    jmp         00470D8D
 00470DA0    mov         eax,785958
 00470DA5    mov         edx,0F
 00470DAA    call        CreateSystemPalette
 00470DAF    mov         [00793050],eax
 00470DB4    pop         ecx
 00470DB5    pop         ebp
 00470DB6    ret
*}
end;

//00470DB8
function GetDefFontCharSet:TFontCharset;
begin
{*
 00470DB8    push        ebx
 00470DB9    push        esi
 00470DBA    add         esp,0FFFFFFC4
 00470DBD    mov         bl,1
 00470DBF    push        0
 00470DC1    call        user32.GetDC
 00470DC6    mov         esi,eax
 00470DC8    test        esi,esi
>00470DCA    je          00470DF4
 00470DCC    mov         eax,[00793064]
 00470DD1    push        eax
 00470DD2    push        esi
 00470DD3    call        gdi32.SelectObject
 00470DD8    test        eax,eax
>00470DDA    je          00470DEC
 00470DDC    push        esp
 00470DDD    push        esi
 00470DDE    call        gdi32.GetTextMetricsW
 00470DE3    test        eax,eax
>00470DE5    je          00470DEC
 00470DE7    movzx       ebx,byte ptr [esp+38]
 00470DEC    push        esi
 00470DED    push        0
 00470DEF    call        user32.ReleaseDC
 00470DF4    mov         eax,ebx
 00470DF6    add         esp,3C
 00470DF9    pop         esi
 00470DFA    pop         ebx
 00470DFB    ret
*}
end;

//00470DFC
procedure InitDefFontData;
begin
{*
 00470DFC    push        ebp
 00470DFD    mov         ebp,esp
 00470DFF    add         esp,0FFFFFEF8
 00470E05    xor         eax,eax
 00470E07    mov         dword ptr [ebp-4],eax
 00470E0A    xor         eax,eax
 00470E0C    push        ebp
 00470E0D    push        470EFA
 00470E12    push        dword ptr fs:[eax]
 00470E15    mov         dword ptr fs:[eax],esp
 00470E18    push        48
 00470E1A    mov         eax,[00793058]
 00470E1F    push        eax
 00470E20    push        8
 00470E22    call        kernel32.MulDiv
 00470E27    neg         eax
 00470E29    mov         [007855D8],eax
 00470E2E    mov         eax,[0078DB58];^gvar_00784C7C
 00470E33    cmp         dword ptr [eax],1
>00470E36    jne         00470E4E
 00470E38    call        GetDefFontCharSet
 00470E3D    cmp         al,80
>00470E3F    jne         00470E4E
 00470E41    lea         eax,[ebp-4]
 00470E44    mov         edx,470F14;'Tahoma'
 00470E49    call        @UStrLAsg
 00470E4E    mov         dl,1
 00470E50    mov         eax,[0045C080];TRegistry
 00470E55    call        TRegistry.Create
 00470E5A    mov         dword ptr [ebp-8],eax
 00470E5D    xor         eax,eax
 00470E5F    push        ebp
 00470E60    push        470EB7
 00470E65    push        dword ptr fs:[eax]
 00470E68    mov         dword ptr fs:[eax],esp
 00470E6B    mov         edx,80000002
 00470E70    mov         eax,dword ptr [ebp-8]
 00470E73    call        TRegistry.SetRootKey
 00470E78    mov         edx,470F30;'SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes'
 00470E7D    mov         eax,dword ptr [ebp-8]
 00470E80    call        TRegistry.OpenKeyReadOnly
 00470E85    test        al,al
>00470E87    je          00470EA1
 00470E89    lea         ecx,[ebp-4]
 00470E8C    mov         edx,470FB8;'MS Shell Dlg 2'
 00470E91    mov         eax,dword ptr [ebp-8]
 00470E94    call        TRegistry.ReadString
 00470E99    mov         eax,dword ptr [ebp-8]
 00470E9C    call        TRegistry.CloseKey
 00470EA1    xor         eax,eax
 00470EA3    pop         edx
 00470EA4    pop         ecx
 00470EA5    pop         ecx
 00470EA6    mov         dword ptr fs:[eax],edx
 00470EA9    push        470EBE
 00470EAE    mov         eax,dword ptr [ebp-8]
 00470EB1    call        TObject.Free
 00470EB6    ret
>00470EB7    jmp         @HandleFinally
>00470EBC    jmp         00470EAE
 00470EBE    cmp         dword ptr [ebp-4],0
>00470EC2    je          00470EE4
 00470EC4    lea         edx,[ebp-108]
 00470ECA    mov         eax,dword ptr [ebp-4]
 00470ECD    call        UTF8EncodeToShortString
 00470ED2    lea         edx,[ebp-108]
 00470ED8    mov         eax,7855E3
 00470EDD    mov         cl,7C
 00470EDF    call        @PStrNCpy
 00470EE4    xor         eax,eax
 00470EE6    pop         edx
 00470EE7    pop         ecx
 00470EE8    pop         ecx
 00470EE9    mov         dword ptr fs:[eax],edx
 00470EEC    push        470F01
 00470EF1    lea         eax,[ebp-4]
 00470EF4    call        @UStrClr
 00470EF9    ret
>00470EFA    jmp         @HandleFinally
>00470EFF    jmp         00470EF1
 00470F01    mov         esp,ebp
 00470F03    pop         ebp
 00470F04    ret
*}
end;

//00471260
constructor TPatternManager.Create();
begin
{*
 00471260    push        ebx
 00471261    push        esi
 00471262    test        dl,dl
>00471264    je          0047126E
 00471266    add         esp,0FFFFFFF0
 00471269    call        @ClassCreate
 0047126E    mov         ebx,edx
 00471270    mov         esi,eax
 00471272    lea         eax,[esi+8]
 00471275    push        eax
 00471276    call        kernel32.InitializeCriticalSection
 0047127B    mov         eax,esi
 0047127D    test        bl,bl
>0047127F    je          00471290
 00471281    call        @AfterConstruction
 00471286    pop         dword ptr fs:[0]
 0047128D    add         esp,0C
 00471290    mov         eax,esi
 00471292    pop         esi
 00471293    pop         ebx
 00471294    ret
*}
end;

//00471298
destructor TPatternManager.Destroy();
begin
{*
 00471298    push        ebx
 00471299    push        esi
 0047129A    call        @BeforeDestruction
 0047129F    mov         ebx,edx
 004712A1    mov         esi,eax
 004712A3    mov         eax,esi
 004712A5    call        TPatternManager.FreePatterns
 004712AA    lea         eax,[esi+8]
 004712AD    push        eax
 004712AE    call        kernel32.DeleteCriticalSection
 004712B3    test        bl,bl
>004712B5    jle         004712BE
 004712B7    mov         eax,esi
 004712B9    call        @ClassDestroy
 004712BE    pop         esi
 004712BF    pop         ebx
 004712C0    ret
*}
end;

//004712C4
procedure TPatternManager.Lock;
begin
{*
 004712C4    add         eax,8
 004712C7    push        eax
 004712C8    call        kernel32.EnterCriticalSection
 004712CD    ret
*}
end;

//004712D0
procedure TPatternManager.Unlock;
begin
{*
 004712D0    add         eax,8
 004712D3    push        eax
 004712D4    call        kernel32.LeaveCriticalSection
 004712D9    ret
*}
end;

//004712DC
function TPatternManager.AllocPattern(BkColor:Cardinal; FgColor:Cardinal):PPattern;
begin
{*
 004712DC    push        ebp
 004712DD    mov         ebp,esp
 004712DF    add         esp,0FFFFFFF8
 004712E2    push        ebx
 004712E3    push        esi
 004712E4    push        edi
 004712E5    mov         esi,ecx
 004712E7    mov         ebx,edx
 004712E9    mov         dword ptr [ebp-4],eax
 004712EC    mov         eax,dword ptr [ebp-4]
 004712EF    call        TPatternManager.Lock
 004712F4    xor         eax,eax
 004712F6    push        ebp
 004712F7    push        47137D
 004712FC    push        dword ptr fs:[eax]
 004712FF    mov         dword ptr fs:[eax],esp
 00471302    mov         eax,dword ptr [ebp-4]
 00471305    mov         eax,dword ptr [eax+4]
 00471308    mov         dword ptr [ebp-8],eax
>0047130B    jmp         00471315
 0047130D    mov         eax,dword ptr [ebp-8]
 00471310    mov         eax,dword ptr [eax]
 00471312    mov         dword ptr [ebp-8],eax
 00471315    cmp         dword ptr [ebp-8],0
>00471319    je          0047132B
 0047131B    mov         eax,dword ptr [ebp-8]
 0047131E    cmp         ebx,dword ptr [eax+8]
>00471321    jne         0047130D
 00471323    mov         eax,dword ptr [ebp-8]
 00471326    cmp         esi,dword ptr [eax+0C]
>00471329    jne         0047130D
 0047132B    cmp         dword ptr [ebp-8],0
>0047132F    jne         00471367
 00471331    mov         eax,10
 00471336    call        @GetMem
 0047133B    mov         dword ptr [ebp-8],eax
 0047133E    mov         edi,dword ptr [ebp-8]
 00471341    mov         eax,dword ptr [ebp-4]
 00471344    mov         eax,dword ptr [eax+4]
 00471347    mov         dword ptr [edi],eax
 00471349    mov         ecx,esi
 0047134B    mov         edx,ebx
 0047134D    mov         eax,dword ptr [ebp-4]
 00471350    call        TPatternManager.CreateBitmap
 00471355    mov         dword ptr [edi+4],eax
 00471358    mov         dword ptr [edi+8],ebx
 0047135B    mov         dword ptr [edi+0C],esi
 0047135E    mov         eax,dword ptr [ebp-4]
 00471361    mov         edx,dword ptr [ebp-8]
 00471364    mov         dword ptr [eax+4],edx
 00471367    xor         eax,eax
 00471369    pop         edx
 0047136A    pop         ecx
 0047136B    pop         ecx
 0047136C    mov         dword ptr fs:[eax],edx
 0047136F    push        471384
 00471374    mov         eax,dword ptr [ebp-4]
 00471377    call        TPatternManager.Unlock
 0047137C    ret
>0047137D    jmp         @HandleFinally
>00471382    jmp         00471374
 00471384    mov         eax,dword ptr [ebp-8]
 00471387    pop         edi
 00471388    pop         esi
 00471389    pop         ebx
 0047138A    pop         ecx
 0047138B    pop         ecx
 0047138C    pop         ebp
 0047138D    ret
*}
end;

//00471390
function TPatternManager.CreateBitmap(BkColor:TColor; FgColor:TColor):TBitmap;
begin
{*
 00471390    push        ebp
 00471391    mov         ebp,esp
 00471393    add         esp,0FFFFFFE4
 00471396    push        ebx
 00471397    push        esi
 00471398    push        edi
 00471399    mov         dword ptr [ebp-4],ecx
 0047139C    mov         ebx,edx
 0047139E    mov         dl,1
 004713A0    mov         eax,[00463B28];TBitmap
 004713A5    call        TBitmap.Create
 004713AA    mov         dword ptr [ebp-8],eax
 004713AD    xor         eax,eax
 004713AF    push        ebp
 004713B0    push        471478
 004713B5    push        dword ptr fs:[eax]
 004713B8    mov         dword ptr fs:[eax],esp
 004713BB    mov         edx,8
 004713C0    mov         eax,dword ptr [ebp-8]
 004713C3    mov         ecx,dword ptr [eax]
 004713C5    call        dword ptr [ecx+44]
 004713C8    mov         edx,8
 004713CD    mov         eax,dword ptr [ebp-8]
 004713D0    mov         ecx,dword ptr [eax]
 004713D2    call        dword ptr [ecx+38]
 004713D5    mov         eax,dword ptr [ebp-8]
 004713D8    call        TBitmap.GetCanvas
 004713DD    mov         dword ptr [ebp-0C],eax
 004713E0    mov         eax,dword ptr [ebp-0C]
 004713E3    mov         eax,dword ptr [eax+48]
 004713E6    xor         edx,edx
 004713E8    call        TBrush.SetStyle
 004713ED    mov         eax,dword ptr [ebp-0C]
 004713F0    mov         eax,dword ptr [eax+48]
 004713F3    mov         edx,ebx
 004713F5    call        TBrush.SetColor
 004713FA    mov         eax,dword ptr [ebp-8]
 004713FD    mov         edx,dword ptr [eax]
 004713FF    call        dword ptr [edx+24]
 00471402    push        eax
 00471403    lea         eax,[ebp-1C]
 00471406    push        eax
 00471407    mov         eax,dword ptr [ebp-8]
 0047140A    mov         edx,dword ptr [eax]
 0047140C    call        dword ptr [edx+30]
 0047140F    mov         ecx,eax
 00471411    xor         edx,edx
 00471413    xor         eax,eax
 00471415    call        Rect
 0047141A    lea         edx,[ebp-1C]
 0047141D    mov         eax,dword ptr [ebp-0C]
 00471420    mov         ecx,dword ptr [eax]
 00471422    call        dword ptr [ecx+54]
 00471425    xor         esi,esi
 00471427    xor         ebx,ebx
 00471429    mov         eax,esi
 0047142B    and         eax,80000001
>00471430    jns         00471437
 00471432    dec         eax
 00471433    or          eax,0FFFFFFFE
 00471436    inc         eax
 00471437    mov         edx,ebx
 00471439    and         edx,80000001
>0047143F    jns         00471446
 00471441    dec         edx
 00471442    or          edx,0FFFFFFFE
 00471445    inc         edx
 00471446    cmp         eax,edx
>00471448    jne         0047145A
 0047144A    mov         eax,dword ptr [ebp-4]
 0047144D    push        eax
 0047144E    mov         ecx,esi
 00471450    mov         edx,ebx
 00471452    mov         eax,dword ptr [ebp-0C]
 00471455    mov         edi,dword ptr [eax]
 00471457    call        dword ptr [edi+20]
 0047145A    inc         ebx
 0047145B    cmp         ebx,9
>0047145E    jne         00471429
 00471460    inc         esi
 00471461    cmp         esi,9
>00471464    jne         00471427
 00471466    mov         eax,dword ptr [ebp-8]
 00471469    call        TBitmap.Dormant
 0047146E    xor         eax,eax
 00471470    pop         edx
 00471471    pop         ecx
 00471472    pop         ecx
 00471473    mov         dword ptr fs:[eax],edx
>00471476    jmp         0047148F
>00471478    jmp         @HandleAnyException
 0047147D    mov         eax,dword ptr [ebp-8]
 00471480    call        TObject.Free
 00471485    call        @RaiseAgain
 0047148A    call        @DoneExcept
 0047148F    mov         eax,dword ptr [ebp-8]
 00471492    pop         edi
 00471493    pop         esi
 00471494    pop         ebx
 00471495    mov         esp,ebp
 00471497    pop         ebp
 00471498    ret
*}
end;

//0047149C
procedure TPatternManager.FreePatterns;
begin
{*
 0047149C    push        ebp
 0047149D    mov         ebp,esp
 0047149F    add         esp,0FFFFFFF4
 004714A2    push        ebx
 004714A3    push        esi
 004714A4    mov         dword ptr [ebp-4],eax
>004714A7    jmp         00471509
 004714A9    mov         dword ptr [ebp-8],ebx
 004714AC    mov         eax,dword ptr [ebp-8]
 004714AF    mov         dword ptr [ebp-0C],eax
 004714B2    mov         eax,dword ptr [ebp-4]
 004714B5    call        TPatternManager.Lock
 004714BA    xor         eax,eax
 004714BC    push        ebp
 004714BD    push        4714E9
 004714C2    push        dword ptr fs:[eax]
 004714C5    mov         dword ptr fs:[eax],esp
 004714C8    mov         eax,dword ptr [ebp-0C]
 004714CB    mov         eax,dword ptr [eax]
 004714CD    mov         edx,dword ptr [ebp-4]
 004714D0    mov         dword ptr [edx+4],eax
 004714D3    xor         eax,eax
 004714D5    pop         edx
 004714D6    pop         ecx
 004714D7    pop         ecx
 004714D8    mov         dword ptr fs:[eax],edx
 004714DB    push        4714F0
 004714E0    mov         eax,dword ptr [ebp-4]
 004714E3    call        TPatternManager.Unlock
 004714E8    ret
>004714E9    jmp         @HandleFinally
>004714EE    jmp         004714E0
 004714F0    mov         eax,dword ptr [ebp-0C]
 004714F3    mov         esi,dword ptr [eax+4]
 004714F6    test        esi,esi
>004714F8    je          00471501
 004714FA    mov         eax,esi
 004714FC    call        TObject.Free
 00471501    mov         eax,dword ptr [ebp-8]
 00471504    call        @FreeMem
 00471509    mov         eax,dword ptr [ebp-4]
 0047150C    mov         ebx,dword ptr [eax+4]
 0047150F    test        ebx,ebx
>00471511    jne         004714A9
 00471513    pop         esi
 00471514    pop         ebx
 00471515    mov         esp,ebp
 00471517    pop         ebp
 00471518    ret
*}
end;

//0047151C
function AllocPatternBitmap(BkColor:TColor; FgColor:TColor):TBitmap;
begin
{*
 0047151C    push        ebx
 0047151D    push        esi
 0047151E    mov         esi,edx
 00471520    mov         ebx,eax
 00471522    cmp         dword ptr ds:[7930AC],0
>00471529    je          0047154D
 0047152B    mov         eax,esi
 0047152D    call        ColorToRGB
 00471532    push        eax
 00471533    mov         eax,ebx
 00471535    call        ColorToRGB
 0047153A    mov         edx,eax
 0047153C    mov         eax,[007930AC]
 00471541    pop         ecx
 00471542    call        TPatternManager.AllocPattern
 00471547    mov         eax,dword ptr [eax+4]
 0047154A    pop         esi
 0047154B    pop         ebx
 0047154C    ret
 0047154D    xor         eax,eax
 0047154F    pop         esi
 00471550    pop         ebx
 00471551    ret
*}
end;

Initialization
//007807CC
{*
 007807CC    sub         dword ptr ds:[793054],1
>007807D3    jae         007808C6
 007807D9    call        InitScreenLogPixels
 007807DE    push        79306C
 007807E3    call        kernel32.InitializeCriticalSection
 007807E8    push        793084
 007807ED    call        kernel32.InitializeCriticalSection
 007807F2    push        7
 007807F4    call        gdi32.GetStockObject
 007807F9    mov         [0079305C],eax
 007807FE    push        5
 00780800    call        gdi32.GetStockObject
 00780805    mov         [00793060],eax
 0078080A    push        0D
 0078080C    call        gdi32.GetStockObject
 00780811    mov         [00793064],eax
 00780816    push        7F00
 0078081B    push        0
 0078081D    call        user32.LoadIconW
 00780822    mov         [00793068],eax
 00780827    call        InitDefFontData
 0078082C    mov         cx,90
 00780830    mov         dl,1
 00780832    mov         eax,[00464E40];TResourceManager
 00780837    call        TResourceManager.Create
 0078083C    mov         [0079309C],eax;gvar_0079309C
 00780841    mov         cx,10
 00780845    mov         dl,1
 00780847    mov         eax,[00464E40];TResourceManager
 0078084C    call        TResourceManager.Create
 00780851    mov         [007930A0],eax;gvar_007930A0
 00780856    mov         cx,10
 0078085A    mov         dl,1
 0078085C    mov         eax,[00465140];TBrushResourceManager
 00780861    call        TResourceManager.Create
 00780866    mov         [007930A4],eax;gvar_007930A4
 0078086B    mov         dl,1
 0078086D    mov         eax,[00471058];TPatternManager
 00780872    call        TPatternManager.Create
 00780877    mov         [007930AC],eax
 0078087C    mov         dl,1
 0078087E    mov         eax,[00439D58];TThreadList
 00780883    call        TThreadList.Create
 00780888    mov         [00785948],eax
 0078088D    mov         dl,1
 0078088F    mov         eax,[00439D58];TThreadList
 00780894    call        TThreadList.Create
 00780899    mov         [007930A8],eax
 0078089E    mov         ecx,465E1C;ColorToIdent:Boolean
 007808A3    mov         edx,465E2C;IdentToColor:Boolean
 007808A8    mov         eax,[0045F1C0];TColor
 007808AD    call        RegisterIntegerConsts
 007808B2    mov         ecx,466190;CharsetToIdent:Boolean
 007808B7    mov         edx,4661A0;IdentToCharset:Boolean
 007808BC    mov         eax,[0045F3B8];TFontCharset
 007808C1    call        RegisterIntegerConsts
 007808C6    ret
*}
Finalization
//00471554
{*
 00471554    push        ebp
 00471555    mov         ebp,esp
 00471557    xor         eax,eax
 00471559    push        ebp
 0047155A    push        471627
 0047155F    push        dword ptr fs:[eax]
 00471562    mov         dword ptr fs:[eax],esp
 00471565    inc         dword ptr ds:[793054]
>0047156B    jne         00471619
 00471571    mov         eax,[007930AC]
 00471576    call        TObject.Free
 0047157B    mov         eax,[00785944]
 00471580    call        TObject.Free
 00471585    mov         eax,[00785940]
 0047158A    call        TObject.Free
 0047158F    call        FreeMemoryContexts
 00471594    mov         eax,[00785948]
 00471599    call        TObject.Free
 0047159E    mov         eax,[007930A8]
 004715A3    call        TObject.Free
 004715A8    mov         eax,[0079309C];gvar_0079309C
 004715AD    call        TObject.Free
 004715B2    mov         eax,[007930A0];gvar_007930A0
 004715B7    call        TObject.Free
 004715BC    mov         eax,[007930A4];gvar_007930A4
 004715C1    call        TObject.Free
 004715C6    mov         eax,[00793050]
 004715CB    push        eax
 004715CC    call        gdi32.DeleteObject
 004715D1    push        79306C
 004715D6    call        kernel32.DeleteCriticalSection
 004715DB    push        793084
 004715E0    call        kernel32.DeleteCriticalSection
 004715E5    mov         eax,79304C;gvar_0079304C
 004715EA    call        @IntfClear
 004715EF    mov         eax,785668
 004715F4    mov         ecx,34
 004715F9    mov         edx,dword ptr ds:[4432AC];TIdentMapEntry
 004715FF    call        @FinalizeArray
 00471604    mov         eax,785808
 00471609    mov         ecx,12
 0047160E    mov         edx,dword ptr ds:[4432AC];TIdentMapEntry
 00471614    call        @FinalizeArray
 00471619    xor         eax,eax
 0047161B    pop         edx
 0047161C    pop         ecx
 0047161D    pop         ecx
 0047161E    mov         dword ptr fs:[eax],edx
 00471621    push        47162E
 00471626    ret
>00471627    jmp         @HandleFinally
>0047162C    jmp         00471626
 0047162E    pop         ebp
 0047162F    ret
*}
end.